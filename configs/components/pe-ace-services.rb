component "pe-ace-services" do |pkg, settings, platform|
  pkg.environment "GEM_HOME", settings[:gem_home]
  pkg.environment "PATH", "#{settings[:bindir]}:$$PATH"
  pkg.load_from_json('configs/components/ace.json')
  pkg.build_requires 'puppet-agent'

  pkg.build do
    ["#{settings[:gem_build]} agentless-catalog-executor.gemspec"]
  end

  pkg.install do
    ["#{settings[:gem_install]} agentless-catalog-executor-*.gem"]
  end

  pkg.install_file('puma_config.rb', "#{settings[:prefix]}/config/puma_config.rb")

  case platform.servicetype
  when "systemd"
    pkg.add_source("file://resources/systemd/pe-ace-server.service", sum: "35783549be1823f0d2746661076e75f0")
    pkg.add_source("file://resources/systemd/pe-ace-server.logrotate", sum: "e3e77a174da30ab4eb0d55da04f9b31b")
    pkg.install_service "../pe-ace-server.service", nil, "pe-ace-server"
    pkg.install_configfile "../pe-ace-server.logrotate", "/etc/logrotate.d/pe-ace-server"
  when "sysv"
    if platform.is_rpm?
      pkg.add_source("file://resources/redhat/pe-ace-server.init", sum: "2ad1e120fa79f0d8bef8b3420dcfa229")
      pkg.add_source("file://resources/redhat/pe-ace-server.sysconfig", sum: "273ddf6ee45968f2f96a0a7adc3b4a59")
      pkg.add_source("file://resources/redhat/pe-ace-server.logrotate", sum: "47740a40b4c22b7d6129c51f03d14c96")
      pkg.install_service "../pe-ace-server.init", "../pe-ace-server.sysconfig", "pe-ace-server"
      pkg.install_configfile "../pe-ace-server.logrotate", "/etc/logrotate.d/pe-ace-server"
    else
      fail "This OS is not supported. See https://puppet.com/docs/pe/latest/supported_operating_systems.html#puppet-master-platforms for supported platforms"
    end
  else
    fail "need to know where to put service files"
  end

  pkg.add_postinstall_action ["install", "upgrade"], [
    "/bin/chown -R #{settings[:pe_ace_user]}:#{settings[:pe_ace_user]} #{settings[:homedir]}",
    "/bin/chown -R #{settings[:pe_ace_user]}:#{settings[:pe_ace_user]} #{settings[:ace_sysconfdir]}",
    "/bin/chown -R #{settings[:pe_ace_user]}:#{settings[:pe_ace_user]} #{settings[:ace_logdir]}",
    "/bin/chown -R #{settings[:pe_ace_user]}:#{settings[:pe_ace_user]} #{settings[:ace_rundir]}"
  ]
end

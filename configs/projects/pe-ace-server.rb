project "pe-ace-server" do |proj|
  proj.license "See components"
  proj.vendor "Puppet, Inc.  <info@puppet.com>"
  proj.homepage "https://www.puppet.com"
  proj.identifier "com.puppetlabs"
  proj.description 'Service to expose ace transports'
  # We can just have the same version as ace, and use tags for specific packages
  proj.version_from_git

  services = {"ace-server" => "ace"}

  services.each do |service, short|
    proj.setting("#{short}_sysconfdir".to_sym,
                 "/etc/puppetlabs/#{service}/conf.d")
    proj.setting("#{short}_logdir".to_sym,
                 "/var/log/puppetlabs/#{service}")
    proj.setting("#{short}_rundir".to_sym,
                 "/var/run/puppetlabs/#{service}")
  end

  proj.setting(:prefix, "/opt/puppetlabs/server/apps/ace-server")
  proj.setting(:pe_ace_user, "pe-ace-server")
  proj.setting(:bindir, "#{proj.prefix}/bin")
  proj.setting(:libdir, "#{proj.prefix}/lib")
  proj.setting(:homedir, "/opt/puppetlabs/server/data/ace-server")
  proj.setting(:gem_home, File.join(proj.libdir, 'ruby'))
  proj.setting(:gem_install, "/opt/puppetlabs/puppet/bin/gem install --no-rdoc --no-ri --local --bindir=#{proj.bindir}")
  proj.setting(:gem_build, "/opt/puppetlabs/puppet/bin/gem build")
  proj.setting(:artifactory_url, "https://artifactory.delivery.puppetlabs.net/artifactory")
  proj.setting(:buildsources_url, "#{proj.artifactory_url}/generic/buildsources")

  proj.setting(:link_bindir, "/opt/puppetlabs/bin")
  proj.setting(:main_bin, "/usr/local/bin")

  proj.user(proj.pe_ace_user,
            group: proj.pe_ace_user,
            shell: '/sbin/nologin',
            homedir: "#{proj.homedir}",
            is_system: true)

  proj.component 'rubygem-puma'
  proj.component 'rubygem-net-ssh-telnet'
  proj.component 'pe-ace-services'

  proj.directory proj.prefix
  proj.directory proj.homedir
  proj.directory proj.link_bindir

  services.each do |_, short|
    proj.directory proj.send("#{short}_sysconfdir")
    proj.directory proj.send("#{short}_logdir")
    proj.directory proj.send("#{short}_rundir")
  end
end

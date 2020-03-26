component 'shared-build-repo' do |_pkg, settings, platform|
	# Previously each component would read `peversion` from a file in the root of the directory
	# and point to a single platform independent path on enterprise.d.p.n. Now that the logic
	# for determining build repo is more complex, instead of copying this code to each component
	# we instead add a single compoenent whose only purpose is to add the correct build repo based
	# on the platform version and the pe_version setting.
  artifactory_url = 'https://artifactory.delivery.puppetlabs.net/artifactory'

  if platform.is_rpm?
    platform.add_build_repository "#{artifactory_url}/rpm_enterprise__local/#{settings[:pe_version]}/repos/#{platform.name}/#{platform.name}.repo"
  end

  if platform.is_deb?
    platform.add_build_repository "#{artifactory_url}/debian_enterprise__local/#{settings[:pe_version]}/repos/#{platform.name}/#{platform.name}.list"
  end
end
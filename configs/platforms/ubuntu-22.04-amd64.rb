platform "ubuntu-22.04-amd64" do |plat|
  plat.inherit_from_default
  packages = %w(git)
  plat.provision_with "apt-get install -qy --no-install-recommends #{packages.join(' ')}"
  plat.provision_with "curl https://artifactory.delivery.puppetlabs.net/artifactory/api/gpg/key/public | apt-key add -"
end

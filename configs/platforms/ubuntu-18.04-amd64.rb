platform "ubuntu-18.04-amd64" do |plat|
  plat.inherit_from_default
  packages = %w(git)
  plat.provision_with "apt-get install -qy --no-install-recommends #{packages.join(' ')}"
end

platform "sles-12-x86_64" do |plat|
  plat.inherit_from_default
  packages = %w(git)
  plat.provision_with "zypper -n --no-gpg-checks install -y #{packages.join(' ')}"
end

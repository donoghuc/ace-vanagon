platform "el-9-x86_64" do |plat|
  plat.inherit_from_default
  packages = %w(git)
  plat.provision_with "dnf install -y --allowerasing #{packages.join(' ')}"
end

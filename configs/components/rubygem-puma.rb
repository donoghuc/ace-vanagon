component "rubygem-puma" do |pkg, settings, platform|
  pkg.version "5.0.2"
  pkg.md5sum "1e62f623cce27a4f89479b9b5c2d244f"
  instance_eval File.read('configs/components/_base-rubygem.rb')
end

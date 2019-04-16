component "rubygem-puma" do |pkg, settings, platform|
  pkg.version "3.12.1"
  pkg.md5sum "8349b8ff0f55e0a8d5833580e8139c3c"
  instance_eval File.read('configs/components/_base-rubygem.rb')
end

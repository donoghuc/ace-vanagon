component "rubygem-puma" do |pkg, settings, platform|
  pkg.version "5.6.4"
  pkg.md5sum "da424b32f6296d09d9999188702d0cc6"
  instance_eval File.read('configs/components/_base-rubygem.rb')
end

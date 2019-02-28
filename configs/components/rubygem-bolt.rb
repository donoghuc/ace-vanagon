component "rubygem-bolt" do |pkg, settings, platform|
  pkg.version "1.13.0"
  pkg.md5sum "7c096cfe8fcbb98d0de092c301f0b9d0"
  instance_eval File.read('configs/components/_base-rubygem.rb')
end

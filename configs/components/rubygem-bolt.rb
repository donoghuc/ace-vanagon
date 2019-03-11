component "rubygem-bolt" do |pkg, settings, platform|
  pkg.version "1.13.1"
  pkg.md5sum "4fae71c9c0fbc0040234d0f897b9b067"
  instance_eval File.read('configs/components/_base-rubygem.rb')
end

component "rubygem-puma" do |pkg, settings, platform|
  pkg.version "6.4.2"
  pkg.md5sum "ada3781e72b87edda00aa7fd79a0160e"
  instance_eval File.read('configs/components/_base-rubygem.rb')
end

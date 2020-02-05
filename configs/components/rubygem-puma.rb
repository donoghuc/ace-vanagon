component "rubygem-puma" do |pkg, settings, platform|
  pkg.version "4.3.1"
  pkg.md5sum "2261b2bfffffc47aa7674908dbad7bad"
  instance_eval File.read('configs/components/_base-rubygem.rb')
end

component "rubygem-puma" do |pkg, settings, platform|
  pkg.version "6.4.0"
  pkg.md5sum "0bbd940c730aa7a116b1460e45d13108"
  instance_eval File.read('configs/components/_base-rubygem.rb')
end

component "rubygem-puma" do |pkg, settings, platform|
  pkg.version "5.4.0"
  pkg.md5sum "3cd6ccbb9df6594c635bce80930cafdb"
  instance_eval File.read('configs/components/_base-rubygem.rb')
end

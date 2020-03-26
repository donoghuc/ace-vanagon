platform "redhatfips-7-x86_64" do |plat|
  plat.servicedir "/usr/lib/systemd/system"
  plat.defaultdir "/etc/sysconfig"
  plat.servicetype "systemd"

  plat.provision_with "rpm --import http://yum.puppetlabs.com/RPM-GPG-KEY-puppetlabs"
  plat.add_build_repository "http://pl-build-tools.delivery.puppetlabs.net/yum/pl-build-tools-release-el-7.noarch.rpm"

  packages = [
    "autoconf",
    "automake",
    "createrepo",
    "gcc",
    "git",
    "libtool",
    "make",
    "openssl-devel",
    "rpmdevtools",
    "rsync",
    "rpm-build",
    "rpm-libs",
    "rpm-sign",
    "yum-utils",
  ]
  plat.provision_with "yum install -y --nogpgcheck #{packages.join(' ')}"
  plat.install_build_dependencies_with "yum install --assumeyes"
  plat.vmpooler_template "redhat-fips-7-x86_64"
end

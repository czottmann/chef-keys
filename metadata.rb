name              "keys"
maintainer        "Carlo Zottmann"
maintainer_email  "carlo@zottmann.org"
license           "WTFPL"
description       "Creates keys in /home/chef/.ssh/ from a data bag"
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           "1.0"
recipe            "keys", "Copies keys from data bag."

%w{ ubuntu debian redhat centos fedora freebsd openbsd mac_os_x }.each do |os|
  supports os
end

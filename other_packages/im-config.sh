#! /bin/bash
pkgname=im-config
grep -E "Package: |Version: " Sources > packages_version.txt
grep -A 1 "$pkgname" packages_version.txt > current_package_version.txt
current_version_line=`grep "Version: " current_package_version.txt`
current_version=`echo ${current_version_line#*Version: }`
version_line=`curl http://anonscm.debian.org/cgit/collab-maint/im-config.git |grep "im-config.git/tag/?id=debian"|sed 1q`
version_1=`echo ${version_line#*im-config.git/tag/?id=debian/}`
version=`echo ${version_1%\'>debian*}`
echo "package name: $pkgname"
echo "current version: $current_version"
echo "upstream version: $version"

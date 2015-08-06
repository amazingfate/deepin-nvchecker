#! /bin/bash
pkgname=jchardet
grep -E "Package: |Version: " Sources > packages_version.txt
grep -A 1 "$pkgname" packages_version.txt > current_package_version.txt
current_version_line=`grep "Version: " current_package_version.txt`
current_version=`echo ${current_version_line#*Version: }`
version_line=`curl https://launchpad.net/~rockclimb/+archive/ubuntu/ppa/+packages |grep "$pkgname"|sed 1q`
version=`echo ${version_line#*jchardet - }`
#version=`echo ${version_1%\">*}`
echo "package name: $pkgname"
echo "current version: $current_version"
echo "upstream version: $version"

#! /bin/bash
pkgname=x-kit
grep -E "Package: |Version: " Sources > packages_version.txt
grep -A 1 "$pkgname" packages_version.txt > current_package_version.txt
current_version_line=`grep "Version: " current_package_version.txt`
current_version=`echo ${current_version_line#*Version: }`
version_line=`curl https://launchpad.net/xorgparser | grep -E  "Latest version"`
version=`echo ${version_line#*is }`
echo "package name: $pkgname"
echo "current version: $current_version"
echo "upstream version: $version"

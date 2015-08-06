pkgname=oxide-qt
grep -E "Package: |Version: " Sources > packages_version.txt
grep -A 1 " $pkgname" packages_version.txt > current_package_version.txt
current_version_line=`grep "Version: " current_package_version.txt|sed 1q`
current_version=`echo ${current_version_line#*Version: }`
echo "package name: $pkgname"
echo "current version: $current_version"
echo "upstream version: this package has several versions in upstream, please check it at https://launchpad.net/oxide/+series"

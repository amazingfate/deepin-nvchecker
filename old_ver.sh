#! /bin/bash
wget http://pools.corp.linuxdeepin.com/dev/dists/unstable/main/source/Sources.gz
rm Sources
gzip -d Sources.gz
grep -E "Package: " Sources > packages.txt
while read package
do
    packagename=`echo ${package#*Package: }`
    echo $packagename >> pkglist.txt
done < packages.txt
grep -E "Package: |Version: " Sources > packages_version.txt
while read pkgname
do
    grep -A 1 " ${pkgname}" packages_version.txt > current_package_version.txt
    current_version_line=`grep "Version: " current_package_version.txt|sed 1q`
    current_version=`echo ${current_version_line#*Version: }`
    echo "${pkgname} $current_version" >> old_ver.txt
done < pkglist.txt

ls other_packages > scripts.txt
cd other_packages
wget http://pools.corp.linuxdeepin.com/dev/dists/unstable/main/source/Sources.gz
gzip -d Sources.gz
while read script
do
        sh $script >> ../output.txt
            echo "====分割线====" >> ../output.txt
        done < ../scripts.txt

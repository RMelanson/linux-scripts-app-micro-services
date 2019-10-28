dir=$1
mode=744
echo "EXECUTING: cd $dir " > $dir/setup.log
cd $dir
echo "find $dir -name '*.sh' -exec chmod $mode {} \;" >> $dir/setup.log
find $dir -name '*.sh' -exec chmod $mode {} \;
./setup.sh $* 2>&1| tee -a setup.log
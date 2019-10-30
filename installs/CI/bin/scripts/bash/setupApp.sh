echo "BEFORE EXECUTING: Parms \$\*  = $*" | tee $dir/setup.log
echo "BEFORE EXECUTING: Parms \@*\* = @*" | tee -a $dir/setup.log
dir=$1
shift
echo "AFTER EXECUTING: Parms \$\*  = $*" | tee -a $dir/setup.log
echo "AFTER EXECUTING: Parms \@*\* = @*" | tee -a $dir/setup.log
mode=744
echo "EXECUTING: cd $dir " | tee -a $dir/setup.log
cd $dir
echo "find $dir -name '*.sh' -exec chmod $mode {} \;" | tee -a $dir/setup.log
find $dir -name '*.sh' -exec chmod $mode {} \;
./setup.sh $* 2>&1| tee -a setup.log
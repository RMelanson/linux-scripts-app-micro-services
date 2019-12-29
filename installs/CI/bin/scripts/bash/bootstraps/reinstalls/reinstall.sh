scriptType=$1
pkg=$2
bootStrapDir="/opt/CI/bin/scripts/bash/bootstraps"
pkgDir="$scriptType/$pkg"

echo "reinstall.sh EXECUTING: . ../uninstall_$pkg.sh"
. ../uninstall_$pkg.sh

echo "reinstall.sh EXECUTING: . /opt/CI/bin/scripts/bash/ciUtils/setupApp.sh $pkgDir"
. /opt/CI/bin/scripts/bash/ciUtils/setupApp.sh $pkgDir

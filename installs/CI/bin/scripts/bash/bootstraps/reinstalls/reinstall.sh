scriptType=$1
pkg=$2
bootStrapDir="/opt/CI/bin/scripts/bash/bootstraps"
reinstallDir="$bootStrapDir/reinstall"
uninstallDir="$bootStrapDir/uninstall"
pkgDir="$scriptType/$pkg"

. $uninstallDir/uninstall_CI.sh

. /opt/CI/bin/scripts/bash/ciUtils/setupApp.sh $pkgDir

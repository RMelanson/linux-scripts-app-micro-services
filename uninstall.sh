clear
cloudinit stop all
cloudinit clean all
bootstraps="/opt/CI/bin/scripts/bash/bootstraps"
apps="$bootstraps/apps"
pkg=$apps/CLOUD_INITIALIZER
rm -rf $pkg
rm -rf /var/www/html/cloudinitializer/

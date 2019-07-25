clear
cloudInit stop all
cloudInit clean all
rm -rf /tmp/scripts/utils/APP_SERVICES
rm -rf ./CLOUD_INITIALISER
rm -rf /opt/CI
rm -rf /var/www/html/cloudinitialiser/

. ./cloudInitialiserBootStrap.sh

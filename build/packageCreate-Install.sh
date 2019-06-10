echo "Package installation process started..."
Package_Version=""
TARGET_ORG=

echo "Creating new package version for BrillioTest"
  Package_Version="$(sfdx force:package:version:create -p BrillioTest -d force-app -w 10 -v --targetdevhubusername dev0@brillio.com)"
  sleep 300 # We've to wait for package replication.

echo "Package installation es-base-objects"
$SFDX_CLI_EXEC force:package:install --package $Package_Version -w 10 -r -u UAT

echo "...Done!"

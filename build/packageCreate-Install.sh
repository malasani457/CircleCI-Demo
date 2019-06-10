echo "Unlocked Package process started..."
Package_Version=""
TARGET_ORG=

echo "Creating new package version for BrillioTest"
  Package_Version="$(sfdx force:package:version:create -p BrillioTest -d force-app -k test1234 -w 10 -v DEV)"
  sleep 300 # We've to wait for package replication.
echo "Package version is Done!"
echo  "$Package_Version"

echo "Package installation process started"
sfdx force:package:install --package $Package_Version -w 10 -r -u UAT

echo "Installed Sucessfully...Done!"

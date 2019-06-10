echo "Unlocked Package process started..."
Package_Version=""
TARGET_ORG=

echo "Creating new package version for BrillioTest"
  Package_Version="$(sfdx force:package:version:create -p Brillio1 -d force-app -k test1234 -w 10 -v DEV --json | jq '.result.SubscriberPackageVersionId' | tr -d '"')"
  sleep 300 # We've to wait for package replication.
echo "Package version is Done!"
echo "******************************"
echo  $Package_Version
echo "******************************"

echo "Package installation process started"
sfdx force:package:install --package $Package_Version -w 10 -r -k test1234 -u UAT

echo "Installed Sucessfully...Done!"

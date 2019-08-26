# cleanup
rm -rf src && \
# deploy to the package org
sfdx force:source:convert -d src -r force-app && \
sfdx force:mdapi:deploy -d src -u ltngSharingPkg -w 60 -l RunAllTestsInOrg && \
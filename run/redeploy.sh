#!/bin/bash

echo "Redeploying all..."

chmod +x ../db/deployments/redeploy.sh
chmod +x ../news-system/deployments/redeploy.sh
chmod +x ../news-portal/deployments/redeploy.sh

../db/deployments/redeploy.sh
../news-system/deployments/redeploy.sh
../news-portal/deployments/redeploy.sh
# Create an App Service app with deployment from GitHub
# set -e # exit if error
# Variable block
let "randomIdentifier=$RANDOM*$RANDOM"
location="East US"
resourceGroup="msdocs-app-service-rg-$randomIdentifier"
tag="deploy-github.sh"
gitrepo=https://github.com/Azure-Samples/php-docs-hello-world # Replace the following URL with your own public GitHub repo URL if you have one
appServicePlan="msdocs-app-service-plan-$randomIdentifier"
webapp="msdocs-web-app-$randomIdentifier"

# Create a resource group.
echo "Creating $resourceGroup in "$location"..."
az group create --name $resourceGroup --location "$location" --tag $tag

# Create an App Service plan in `FREE` tier.
echo "Creating $appServicePlan"
az appservice plan create --name $appServicePlan --resource-group $resourceGroup --sku FREE

# Create a web app.
echo "Creating $webapp"
az webapp create --name $webapp --resource-group $resourceGroup --plan $appServicePlan

# Deploy code from a public GitHub repository. 
az webapp deployment source config --name $webapp --resource-group $resourceGroup \
--repo-url $gitrepo --branch master --manual-integration

# Use curl to see the web app.
site="http://$webapp.azurewebsites.net"
echo $site
curl "$site" # Optionally, copy and paste the output of the previous command into a browser to see the web app



az webapp deployment source config --name msdocs-web-app-135775266 --resource-group msdocs-app-service-rg-135775266 \
--repo-url https://github.com/qf-devops/azureadmin.git --branch main --manual-integration
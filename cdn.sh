
   20  az group create --name MyResourceGroup --location eastus
   21  az cdn profile create --resource-group MyResourceGroup --name MyCDNProfile --sku Standard_Microsoft
   23  az cdn endpoint create --resource-group MyResourceGroup --name MyABBCDNEndpoint --profile-name MyCDNProfile --origin www.contoso.com
   24  az cdn origin-group create --resource-group MyResourceGroup --endpoint-name MyABBCDNEndpoint --profile-name MyCDNProfile --name MyOriginGroup --origins origin-0
   25  az cdn endpoint update --resource-group MyResourceGroup --name MyABBCDNEndpoint --profile-name MyCDNProfile --default-origin-group MyOriginGroup
   26  az cdn origin create --resource-group MyResourceGroup --endpoint-name MyABBCDNEndpoint --profile-name MyCDNProfile --name origin-1 --host-name example.contoso.com
   27  az cdn custom-domain create --resource-group MyResourceGroup --endpoint-name MyABBCDNEndpoint --profile-name MyCDNProfile --name MyCustomDomain --hostname www.vytecbbbv.com
   28  history
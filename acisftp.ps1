$sftpUserName = "abcuser";
$sftpPassword = "fj46v9hnh7f1";
$sftpUsers = [string]::Concat($sftpUserName, ":", $sftpPassword, ":1001");
$volumeaccountkey = "key"

az container create --resource-group RG-PRODUCTION-PEGA --name pega-bix-sftpserver --image "atmoz/sftp:latest" --dns-name-label "pega-bix-prod-sftp" --cpu 2 --memory 1 --os-type Linux --ports 22 --environment-variables SFTP_USERS=$sftpUsers --azure-file-volume-mount-path "/home/abcuser/dev" --azure-file-volume-share-name "dev" --azure-file-volume-account-key $volumeaccountkey --azure-file-volume-account-name "abcac" --ip-address Public --protocol TCP

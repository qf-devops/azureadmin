$sftpUserName = "abcuser";
$sftpPassword = "fj46v9hnh7f1";
$sftpUsers = [string]::Concat($sftpUserName, ":", $sftpPassword, ":1001");
$volumeaccountkey = "aXdL2yp03by0iGQ92wRnX1OHQFyHP4Le2XhlS98/v8hVO+OLQzRCj/nAAH9A1XMImEVf9TcDh9oa+ASt+AZ8lQ=="

az container create --resource-group dev --name sftpserver --image "atmoz/sftp:latest" --dns-name-label "sftp-avc-1" --cpu 2 --memory 1 --os-type Linux --ports 22 --environment-variables SFTP_USERS=$sftpUsers --azure-file-volume-mount-path "/home/abcuser/dev" --azure-file-volume-share-name "devfileshare" --azure-file-volume-account-key $volumeaccountkey --azure-file-volume-account-name "sftpstoarge06092023" --ip-address Public --protocol TCP

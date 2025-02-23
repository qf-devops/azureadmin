from azure.identity import ManagedIdentityCredential
from azure.storage.blob import BlobServiceClient

# Set storage account and container details
STORAGE_ACCOUNT_NAME = "your_storage_account"
CONTAINER_NAME = "your_container"
BLOB_NAME = "sample.txt"  # Example blob name

# Managed Identity Credential
credential = ManagedIdentityCredential()

# Blob Service Client with Managed Identity
blob_service_client = BlobServiceClient(
    account_url=f"https://{STORAGE_ACCOUNT_NAME}.blob.core.windows.net",
    credential=credential
)

# Get container client
container_client = blob_service_client.get_container_client(CONTAINER_NAME)

# List blobs in container
print("Listing blobs in container:")
for blob in container_client.list_blobs():
    print(f"- {blob.name}")

# Download a blob
blob_client = container_client.get_blob_client(BLOB_NAME)
blob_data = blob_client.download_blob().readall()
print(f"\nDownloaded blob content:\n{blob_data.decode()}")

# Upload a blob (if write permission is given)
new_blob_name = "uploaded_sample.txt"
new_blob_client = container_client.get_blob_client(new_blob_name)
new_blob_client.upload_blob("Hello, this is a test upload.", overwrite=True)
print(f"\nUploaded new blob: {new_blob_name}")


### BREAKING CHANGE

### IAM

- Model `net.accelbyte.sdk.api.iam.models.ModelUserResponseV3`
    - Type changed for field `tags` from `List<String>` to `List<ModelTagDetail>`.

- Operation `net.accelbyte.sdk.api.iam.operations.users.AdminListUserIDByUserIDsV3`
    - Request body model changed from `ModelUserIDsRequest` to `ModelAdminBulkUserRequest`.
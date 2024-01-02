#!/usr/bin/env bash

# Copyright (c) 2021 AccelByte Inc. All Rights Reserved.
# This is licensed software from AccelByte Inc, for limitations
# and restrictions contact your company contract manager.

# Code generated. DO NOT EDIT.

# Meta:
# - random seed: 
# - template file: 

# Instructions:
# - Run the Justice SDK Mock Server first before running this script.

export AB_BASE_URL="http://127.0.0.1:8080"
export AB_CLIENT_ID="admin"
export AB_CLIENT_SECRET="admin"
export AB_NAMESPACE="test"

EXIT_CODE=0

eval_tap() {
  if [ $1 -eq 0 ]; then
    echo "ok $2 - $3"
  else
    EXIT_CODE=1
    echo "not ok $2 - $3"
    sed 's/^/# /g' $4
  fi
  rm -f $4
}

chmod +x ./ng
trap "./ng ng-stop" EXIT
java -jar build/install/cli/lib/nailgun-server-*.jar 1>&2 &
(for i in $(seq 1 100); do bash -c "timeout 1 echo > /dev/tcp/127.0.0.1/2113" 2>/dev/null && exit 0 || sleep 1; done; exit 1) || exit 1
for JAR in build/install/cli/lib/*.jar; do ./ng ng-cp $JAR 1>&2; done
./ng ng-cp 1>&2

echo "TAP version 13"
echo "1..367"

#- 1 Login
./ng net.accelbyte.sdk.cli.Main loginClient \
    > test.out 2>&1
eval_tap $? 1 'Login' test.out

if [ $EXIT_CODE -ne 0 ]; then
  echo "Bail out! Login failed."
  exit $EXIT_CODE
fi

touch "tmp.dat"

#- 2 GetBansType
eval_tap 0 2 'GetBansType # SKIP deprecated' test.out

#- 3 GetListBanReason
eval_tap 0 3 'GetListBanReason # SKIP deprecated' test.out

#- 4 GetClients
eval_tap 0 4 'GetClients # SKIP deprecated' test.out

#- 5 CreateClient
eval_tap 0 5 'CreateClient # SKIP deprecated' test.out

#- 6 GetClient
eval_tap 0 6 'GetClient # SKIP deprecated' test.out

#- 7 UpdateClient
eval_tap 0 7 'UpdateClient # SKIP deprecated' test.out

#- 8 DeleteClient
eval_tap 0 8 'DeleteClient # SKIP deprecated' test.out

#- 9 UpdateClientPermission
eval_tap 0 9 'UpdateClientPermission # SKIP deprecated' test.out

#- 10 AddClientPermission
eval_tap 0 10 'AddClientPermission # SKIP deprecated' test.out

#- 11 DeleteClientPermission
eval_tap 0 11 'DeleteClientPermission # SKIP deprecated' test.out

#- 12 UpdateClientSecret
eval_tap 0 12 'UpdateClientSecret # SKIP deprecated' test.out

#- 13 GetClientsbyNamespace
eval_tap 0 13 'GetClientsbyNamespace # SKIP deprecated' test.out

#- 14 CreateClientByNamespace
eval_tap 0 14 'CreateClientByNamespace # SKIP deprecated' test.out

#- 15 DeleteClientByNamespace
eval_tap 0 15 'DeleteClientByNamespace # SKIP deprecated' test.out

#- 16 CreateUser
eval_tap 0 16 'CreateUser # SKIP deprecated' test.out

#- 17 GetAdminUsersByRoleID
eval_tap 0 17 'GetAdminUsersByRoleID # SKIP deprecated' test.out

#- 18 GetUserByLoginID
eval_tap 0 18 'GetUserByLoginID # SKIP deprecated' test.out

#- 19 GetUserByPlatformUserID
eval_tap 0 19 'GetUserByPlatformUserID # SKIP deprecated' test.out

#- 20 ForgotPassword
eval_tap 0 20 'ForgotPassword # SKIP deprecated' test.out

#- 21 GetUsersByLoginIds
eval_tap 0 21 'GetUsersByLoginIds # SKIP deprecated' test.out

#- 22 ResetPassword
eval_tap 0 22 'ResetPassword # SKIP deprecated' test.out

#- 23 SearchUser
eval_tap 0 23 'SearchUser # SKIP deprecated' test.out

#- 24 GetUserByUserID
eval_tap 0 24 'GetUserByUserID # SKIP deprecated' test.out

#- 25 UpdateUser
eval_tap 0 25 'UpdateUser # SKIP deprecated' test.out

#- 26 DeleteUser
eval_tap 0 26 'DeleteUser # SKIP deprecated' test.out

#- 27 BanUser
eval_tap 0 27 'BanUser # SKIP deprecated' test.out

#- 28 GetUserBanHistory
eval_tap 0 28 'GetUserBanHistory # SKIP deprecated' test.out

#- 29 DisableUserBan
eval_tap 0 29 'DisableUserBan # SKIP deprecated' test.out

#- 30 EnableUserBan
eval_tap 0 30 'EnableUserBan # SKIP deprecated' test.out

#- 31 ListCrossNamespaceAccountLink
eval_tap 0 31 'ListCrossNamespaceAccountLink # SKIP deprecated' test.out

#- 32 DisableUser
eval_tap 0 32 'DisableUser # SKIP deprecated' test.out

#- 33 EnableUser
eval_tap 0 33 'EnableUser # SKIP deprecated' test.out

#- 34 GetUserInformation
eval_tap 0 34 'GetUserInformation # SKIP deprecated' test.out

#- 35 DeleteUserInformation
eval_tap 0 35 'DeleteUserInformation # SKIP deprecated' test.out

#- 36 GetUserLoginHistories
eval_tap 0 36 'GetUserLoginHistories # SKIP deprecated' test.out

#- 37 UpdatePassword
eval_tap 0 37 'UpdatePassword # SKIP deprecated' test.out

#- 38 SaveUserPermission
eval_tap 0 38 'SaveUserPermission # SKIP deprecated' test.out

#- 39 AddUserPermission
eval_tap 0 39 'AddUserPermission # SKIP deprecated' test.out

#- 40 DeleteUserPermission
eval_tap 0 40 'DeleteUserPermission # SKIP deprecated' test.out

#- 41 GetUserPlatformAccounts
eval_tap 0 41 'GetUserPlatformAccounts # SKIP deprecated' test.out

#- 42 GetUserMapping
eval_tap 0 42 'GetUserMapping # SKIP deprecated' test.out

#- 43 GetUserJusticePlatformAccount
eval_tap 0 43 'GetUserJusticePlatformAccount # SKIP deprecated' test.out

#- 44 PlatformLink
eval_tap 0 44 'PlatformLink # SKIP deprecated' test.out

#- 45 PlatformUnlink
eval_tap 0 45 'PlatformUnlink # SKIP deprecated' test.out

#- 46 GetPublisherUser
eval_tap 0 46 'GetPublisherUser # SKIP deprecated' test.out

#- 47 SaveUserRoles
eval_tap 0 47 'SaveUserRoles # SKIP deprecated' test.out

#- 48 AddUserRole
eval_tap 0 48 'AddUserRole # SKIP deprecated' test.out

#- 49 DeleteUserRole
eval_tap 0 49 'DeleteUserRole # SKIP deprecated' test.out

#- 50 UpgradeHeadlessAccount
eval_tap 0 50 'UpgradeHeadlessAccount # SKIP deprecated' test.out

#- 51 UpgradeHeadlessAccountWithVerificationCode
eval_tap 0 51 'UpgradeHeadlessAccountWithVerificationCode # SKIP deprecated' test.out

#- 52 UserVerification
eval_tap 0 52 'UserVerification # SKIP deprecated' test.out

#- 53 SendVerificationCode
eval_tap 0 53 'SendVerificationCode # SKIP deprecated' test.out

#- 54 Authorization
eval_tap 0 54 'Authorization # SKIP deprecated' test.out

#- 55 GetJWKS
eval_tap 0 55 'GetJWKS # SKIP deprecated' test.out

#- 56 PlatformTokenRequestHandler
eval_tap 0 56 'PlatformTokenRequestHandler # SKIP deprecated' test.out

#- 57 RevokeUser
eval_tap 0 57 'RevokeUser # SKIP deprecated' test.out

#- 58 GetRevocationList
eval_tap 0 58 'GetRevocationList # SKIP deprecated' test.out

#- 59 RevokeToken
eval_tap 0 59 'RevokeToken # SKIP deprecated' test.out

#- 60 RevokeAUser
eval_tap 0 60 'RevokeAUser # SKIP deprecated' test.out

#- 61 TokenGrant
eval_tap 0 61 'TokenGrant # SKIP deprecated' test.out

#- 62 VerifyToken
eval_tap 0 62 'VerifyToken # SKIP deprecated' test.out

#- 63 GetRoles
eval_tap 0 63 'GetRoles # SKIP deprecated' test.out

#- 64 CreateRole
eval_tap 0 64 'CreateRole # SKIP deprecated' test.out

#- 65 GetRole
eval_tap 0 65 'GetRole # SKIP deprecated' test.out

#- 66 UpdateRole
eval_tap 0 66 'UpdateRole # SKIP deprecated' test.out

#- 67 DeleteRole
eval_tap 0 67 'DeleteRole # SKIP deprecated' test.out

#- 68 GetRoleAdminStatus
eval_tap 0 68 'GetRoleAdminStatus # SKIP deprecated' test.out

#- 69 SetRoleAsAdmin
eval_tap 0 69 'SetRoleAsAdmin # SKIP deprecated' test.out

#- 70 RemoveRoleAdmin
eval_tap 0 70 'RemoveRoleAdmin # SKIP deprecated' test.out

#- 71 GetRoleManagers
eval_tap 0 71 'GetRoleManagers # SKIP deprecated' test.out

#- 72 AddRoleManagers
eval_tap 0 72 'AddRoleManagers # SKIP deprecated' test.out

#- 73 RemoveRoleManagers
eval_tap 0 73 'RemoveRoleManagers # SKIP deprecated' test.out

#- 74 GetRoleMembers
eval_tap 0 74 'GetRoleMembers # SKIP deprecated' test.out

#- 75 AddRoleMembers
eval_tap 0 75 'AddRoleMembers # SKIP deprecated' test.out

#- 76 RemoveRoleMembers
eval_tap 0 76 'RemoveRoleMembers # SKIP deprecated' test.out

#- 77 UpdateRolePermissions
eval_tap 0 77 'UpdateRolePermissions # SKIP deprecated' test.out

#- 78 AddRolePermission
eval_tap 0 78 'AddRolePermission # SKIP deprecated' test.out

#- 79 DeleteRolePermission
eval_tap 0 79 'DeleteRolePermission # SKIP deprecated' test.out

#- 80 AdminGetAgeRestrictionStatusV2
eval_tap 0 80 'AdminGetAgeRestrictionStatusV2 # SKIP deprecated' test.out

#- 81 AdminUpdateAgeRestrictionConfigV2
eval_tap 0 81 'AdminUpdateAgeRestrictionConfigV2 # SKIP deprecated' test.out

#- 82 GetListCountryAgeRestriction
eval_tap 0 82 'GetListCountryAgeRestriction # SKIP deprecated' test.out

#- 83 UpdateCountryAgeRestriction
eval_tap 0 83 'UpdateCountryAgeRestriction # SKIP deprecated' test.out

#- 84 AdminSearchUsersV2
eval_tap 0 84 'AdminSearchUsersV2 # SKIP deprecated' test.out

#- 85 AdminGetUserByUserIdV2
eval_tap 0 85 'AdminGetUserByUserIdV2 # SKIP deprecated' test.out

#- 86 AdminUpdateUserV2
eval_tap 0 86 'AdminUpdateUserV2 # SKIP deprecated' test.out

#- 87 AdminBanUserV2
eval_tap 0 87 'AdminBanUserV2 # SKIP deprecated' test.out

#- 88 AdminGetUserBanV2
eval_tap 0 88 'AdminGetUserBanV2 # SKIP deprecated' test.out

#- 89 AdminDisableUserV2
eval_tap 0 89 'AdminDisableUserV2 # SKIP deprecated' test.out

#- 90 AdminEnableUserV2
eval_tap 0 90 'AdminEnableUserV2 # SKIP deprecated' test.out

#- 91 AdminResetPasswordV2
eval_tap 0 91 'AdminResetPasswordV2 # SKIP deprecated' test.out

#- 92 AdminDeletePlatformLinkV2
eval_tap 0 92 'AdminDeletePlatformLinkV2 # SKIP deprecated' test.out

#- 93 AdminPutUserRolesV2
eval_tap 0 93 'AdminPutUserRolesV2 # SKIP deprecated' test.out

#- 94 AdminCreateUserRolesV2
eval_tap 0 94 'AdminCreateUserRolesV2 # SKIP deprecated' test.out

#- 95 PublicGetCountryAgeRestriction
eval_tap 0 95 'PublicGetCountryAgeRestriction # SKIP deprecated' test.out

#- 96 PublicCreateUserV2
eval_tap 0 96 'PublicCreateUserV2 # SKIP deprecated' test.out

#- 97 PublicForgotPasswordV2
eval_tap 0 97 'PublicForgotPasswordV2 # SKIP deprecated' test.out

#- 98 PublicResetPasswordV2
eval_tap 0 98 'PublicResetPasswordV2 # SKIP deprecated' test.out

#- 99 PublicGetUserByUserIDV2
eval_tap 0 99 'PublicGetUserByUserIDV2 # SKIP deprecated' test.out

#- 100 PublicUpdateUserV2
eval_tap 0 100 'PublicUpdateUserV2 # SKIP deprecated' test.out

#- 101 PublicGetUserBan
eval_tap 0 101 'PublicGetUserBan # SKIP deprecated' test.out

#- 102 PublicUpdatePasswordV2
eval_tap 0 102 'PublicUpdatePasswordV2 # SKIP deprecated' test.out

#- 103 GetListJusticePlatformAccounts
eval_tap 0 103 'GetListJusticePlatformAccounts # SKIP deprecated' test.out

#- 104 PublicPlatformLinkV2
eval_tap 0 104 'PublicPlatformLinkV2 # SKIP deprecated' test.out

#- 105 PublicDeletePlatformLinkV2
eval_tap 0 105 'PublicDeletePlatformLinkV2 # SKIP deprecated' test.out

#- 106 AdminGetBansTypeV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBansTypeV3 \
    > test.out 2>&1
eval_tap $? 106 'AdminGetBansTypeV3' test.out

#- 107 AdminGetListBanReasonV3
./ng net.accelbyte.sdk.cli.Main iam adminGetListBanReasonV3 \
    > test.out 2>&1
eval_tap $? 107 'AdminGetListBanReasonV3' test.out

#- 108 AdminGetInputValidations
./ng net.accelbyte.sdk.cli.Main iam adminGetInputValidations \
    > test.out 2>&1
eval_tap $? 108 'AdminGetInputValidations' test.out

#- 109 AdminUpdateInputValidations
./ng net.accelbyte.sdk.cli.Main iam adminUpdateInputValidations \
    --body '[{"field": "DVTVHyK9", "validation": {"allowAllSpecialCharacters": true, "allowDigit": false, "allowLetter": true, "allowSpace": true, "allowUnicode": true, "avatarConfig": {"allowedPrefixes": ["e4RwfLyH", "4UM8tjQK", "eIWXrqRe"], "preferRegex": true, "regex": "NsbbrcXb"}, "blockedWord": ["LgqU89n3", "7FlCw7d7", "vd1Xvhxm"], "description": [{"language": "OUVIUmg8", "message": ["uUYmcSYw", "NBgupjvm", "KbGn4NeA"]}, {"language": "qWkJwmJB", "message": ["oRtNj7lL", "aMkWgFIU", "xYqXAtvv"]}, {"language": "HEDwj37Y", "message": ["JUkXKUxP", "XIF4IWuf", "fd3brZsw"]}], "isCustomRegex": false, "letterCase": "UBMQv7Y8", "maxLength": 17, "maxRepeatingAlphaNum": 48, "maxRepeatingSpecialCharacter": 49, "minCharType": 49, "minLength": 40, "regex": "VfvAvWgs", "specialCharacterLocation": "ZenJkZD6", "specialCharacters": ["E0gLXJFW", "0I2kKT2O", "dhnSPbac"]}}, {"field": "fievfDpi", "validation": {"allowAllSpecialCharacters": false, "allowDigit": true, "allowLetter": false, "allowSpace": false, "allowUnicode": true, "avatarConfig": {"allowedPrefixes": ["BXwTkxlh", "2Bx6AQ6D", "q7EtONSq"], "preferRegex": true, "regex": "pBaBXjwa"}, "blockedWord": ["WhXGTrVs", "f0u0gONQ", "hgBmCSCx"], "description": [{"language": "KqasCs2M", "message": ["WxDIFgGY", "wF1rpTTD", "fdqxY1jt"]}, {"language": "nEj3gulO", "message": ["KvfUQTFQ", "yzvDEQEe", "k5x3oYNV"]}, {"language": "MLELwiyO", "message": ["pJduOXdU", "FRlSoDFV", "qjUqFRFy"]}], "isCustomRegex": true, "letterCase": "zZAkUQux", "maxLength": 63, "maxRepeatingAlphaNum": 44, "maxRepeatingSpecialCharacter": 36, "minCharType": 84, "minLength": 60, "regex": "QKp4YAQP", "specialCharacterLocation": "hed42ccJ", "specialCharacters": ["2WaQ4skK", "emrFbYRY", "KzSs5QAU"]}}, {"field": "I1VQ3bCa", "validation": {"allowAllSpecialCharacters": false, "allowDigit": true, "allowLetter": true, "allowSpace": true, "allowUnicode": true, "avatarConfig": {"allowedPrefixes": ["kjUddw5I", "Qzx0e1OB", "o2MQvcLk"], "preferRegex": false, "regex": "UcAXhS0c"}, "blockedWord": ["6LDwdFob", "ATx3u9SB", "zc6EwfCb"], "description": [{"language": "RC92Uu4F", "message": ["r1a1VDSI", "FxLALw4a", "alozwkXA"]}, {"language": "h1nBbcrp", "message": ["2xd9s9qt", "xdW4R91I", "3MYe2Mqx"]}, {"language": "ZqOyhy0V", "message": ["Ez10AoNE", "qSbf8dBg", "VrDDIqGr"]}], "isCustomRegex": false, "letterCase": "ILKQN1Uy", "maxLength": 87, "maxRepeatingAlphaNum": 61, "maxRepeatingSpecialCharacter": 50, "minCharType": 24, "minLength": 11, "regex": "HiRfu2Ck", "specialCharacterLocation": "Qp9H6TKW", "specialCharacters": ["AFjTvwkB", "jSfpoaqr", "keTRrZJH"]}}]' \
    > test.out 2>&1
eval_tap $? 109 'AdminUpdateInputValidations' test.out

#- 110 AdminResetInputValidations
./ng net.accelbyte.sdk.cli.Main iam adminResetInputValidations \
    --field 'ygTk4Em0' \
    > test.out 2>&1
eval_tap $? 110 'AdminResetInputValidations' test.out

#- 111 ListAdminsV3
./ng net.accelbyte.sdk.cli.Main iam listAdminsV3 \
    --namespace "$AB_NAMESPACE" \
    --after 'Z6DjmQCi' \
    --before 'ffZUYsqW' \
    --limit '3' \
    > test.out 2>&1
eval_tap $? 111 'ListAdminsV3' test.out

#- 112 AdminGetAgeRestrictionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetAgeRestrictionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 112 'AdminGetAgeRestrictionStatusV3' test.out

#- 113 AdminUpdateAgeRestrictionConfigV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateAgeRestrictionConfigV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"ageRestriction": 26, "enable": false}' \
    > test.out 2>&1
eval_tap $? 113 'AdminUpdateAgeRestrictionConfigV3' test.out

#- 114 AdminGetListCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminGetListCountryAgeRestrictionV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 114 'AdminGetListCountryAgeRestrictionV3' test.out

#- 115 AdminUpdateCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateCountryAgeRestrictionV3 \
    --countryCode '1dsaoV5G' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ageRestriction": 67}' \
    > test.out 2>&1
eval_tap $? 115 'AdminUpdateCountryAgeRestrictionV3' test.out

#- 116 AdminGetBannedUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType 'UHVDZHVO' \
    --limit '66' \
    --offset '79' \
    > test.out 2>&1
eval_tap $? 116 'AdminGetBannedUsersV3' test.out

#- 117 AdminBanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"ban": "z6GT94z6", "comment": "l9QDIMkI", "endDate": "aWlf78Za", "reason": "4Uda5OtC", "skipNotif": true, "userIds": ["W8WCXrpO", "09SpsRjz", "65kneWnM"]}' \
    > test.out 2>&1
eval_tap $? 117 'AdminBanUserBulkV3' test.out

#- 118 AdminUnbanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminUnbanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"bans": [{"banId": "QNzJEPWg", "userId": "gy3biBZ6"}, {"banId": "h6rQvjs8", "userId": "YNTLxqSn"}, {"banId": "zCyhHU3x", "userId": "Vfc3xCAJ"}]}' \
    > test.out 2>&1
eval_tap $? 118 'AdminUnbanUserBulkV3' test.out

#- 119 AdminGetBansTypeWithNamespaceV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBansTypeWithNamespaceV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 119 'AdminGetBansTypeWithNamespaceV3' test.out

#- 120 AdminGetClientsByNamespaceV3
./ng net.accelbyte.sdk.cli.Main iam adminGetClientsByNamespaceV3 \
    --namespace "$AB_NAMESPACE" \
    --clientId 'nzEZIu8c' \
    --clientName 'q0mif8yB' \
    --clientType 'kOy3N0b3' \
    --limit '41' \
    --offset '71' \
    > test.out 2>&1
eval_tap $? 120 'AdminGetClientsByNamespaceV3' test.out

#- 121 AdminCreateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateClientV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["85v12WPX", "5IyIYXbC", "BMFvsmYn"], "baseUri": "vuiudQ6k", "clientId": "zXFzwvVN", "clientName": "dMxhlMSw", "clientPermissions": [{"action": 50, "resource": "M2zeDQgR", "schedAction": 14, "schedCron": "k7KfLXjf", "schedRange": ["PeglnTDK", "ho2GMEsj", "8ujZNZij"]}, {"action": 56, "resource": "HM3W9zop", "schedAction": 90, "schedCron": "cI64ZRk9", "schedRange": ["7dFAINKC", "DxlJQNmE", "nHxJTpbX"]}, {"action": 22, "resource": "EstBGZQN", "schedAction": 3, "schedCron": "9zYt1Vft", "schedRange": ["0HmlSLcO", "6Q1jPjN5", "gGLDrYbm"]}], "clientPlatform": "IyIbj7n1", "deletable": true, "description": "KlMSdB91", "namespace": "TzwQJOgV", "oauthAccessTokenExpiration": 62, "oauthAccessTokenExpirationTimeUnit": "6Gt4IrfO", "oauthClientType": "WVOvMGTK", "oauthRefreshTokenExpiration": 31, "oauthRefreshTokenExpirationTimeUnit": "WgsahB9w", "parentNamespace": "PQS4E0RN", "redirectUri": "ecXI9Kjc", "scopes": ["d2POG71a", "ghXn6gkG", "aDxhOsSp"], "secret": "kFHhF7jJ", "twoFactorEnabled": false}' \
    > test.out 2>&1
eval_tap $? 121 'AdminCreateClientV3' test.out

#- 122 AdminGetClientsbyNamespacebyIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetClientsbyNamespacebyIDV3 \
    --clientId 'HFfPh08S' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 122 'AdminGetClientsbyNamespacebyIDV3' test.out

#- 123 AdminDeleteClientV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientV3 \
    --clientId 'rMU2EpWH' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 123 'AdminDeleteClientV3' test.out

#- 124 AdminUpdateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientV3 \
    --clientId 'izv1v4wY' \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["gJz65TIN", "NcLlZ5HI", "Um1Th9h5"], "baseUri": "vdmDWvSL", "clientName": "huRkwHnH", "clientPermissions": [{"action": 35, "resource": "XS8qNNqe", "schedAction": 75, "schedCron": "XkUgSRyp", "schedRange": ["1x9qSEjQ", "TWiUYIDi", "nARGKGHd"]}, {"action": 51, "resource": "t00OgC85", "schedAction": 15, "schedCron": "d9xKGGHJ", "schedRange": ["mvXS0DVN", "9FESY7tc", "as4LOMNE"]}, {"action": 1, "resource": "dyIMB7Wf", "schedAction": 94, "schedCron": "knMOc63u", "schedRange": ["eWhFT7Ka", "JkwqUQ5h", "ongDTRhM"]}], "clientPlatform": "jVQAItoj", "deletable": true, "description": "jFx4ZIBH", "namespace": "NJt2N71F", "oauthAccessTokenExpiration": 50, "oauthAccessTokenExpirationTimeUnit": "68tkViyl", "oauthRefreshTokenExpiration": 98, "oauthRefreshTokenExpirationTimeUnit": "mJle3oDM", "redirectUri": "QY0knDrE", "scopes": ["uFsoower", "qB9RIIfL", "GO2pEwuc"], "twoFactorEnabled": false}' \
    > test.out 2>&1
eval_tap $? 124 'AdminUpdateClientV3' test.out

#- 125 AdminUpdateClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientPermissionV3 \
    --clientId 'O3oFQboI' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 3, "resource": "dLvhUBj0"}, {"action": 22, "resource": "Cy5tlKKF"}, {"action": 72, "resource": "ahyHk50r"}]}' \
    > test.out 2>&1
eval_tap $? 125 'AdminUpdateClientPermissionV3' test.out

#- 126 AdminAddClientPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddClientPermissionsV3 \
    --clientId 'S7ZWlUin' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 49, "resource": "r8mbbhTX"}, {"action": 20, "resource": "2UyAjtrC"}, {"action": 53, "resource": "kVy1uKg1"}]}' \
    > test.out 2>&1
eval_tap $? 126 'AdminAddClientPermissionsV3' test.out

#- 127 AdminDeleteClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientPermissionV3 \
    --action '1' \
    --clientId 'd30q7PuW' \
    --namespace "$AB_NAMESPACE" \
    --resource 'J3hiCN0l' \
    > test.out 2>&1
eval_tap $? 127 'AdminDeleteClientPermissionV3' test.out

#- 128 AdminGetCountryListV3
./ng net.accelbyte.sdk.cli.Main iam adminGetCountryListV3 \
    --namespace "$AB_NAMESPACE" \
    --filterBlacklist  \
    > test.out 2>&1
eval_tap $? 128 'AdminGetCountryListV3' test.out

#- 129 AdminGetCountryBlacklistV3
./ng net.accelbyte.sdk.cli.Main iam adminGetCountryBlacklistV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 129 'AdminGetCountryBlacklistV3' test.out

#- 130 AdminAddCountryBlacklistV3
./ng net.accelbyte.sdk.cli.Main iam adminAddCountryBlacklistV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"blacklist": ["nXFhslJe", "HjezbfPY", "OZ3xKPq1"]}' \
    > test.out 2>&1
eval_tap $? 130 'AdminAddCountryBlacklistV3' test.out

#- 131 RetrieveAllThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveAllThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 131 'RetrieveAllThirdPartyLoginPlatformCredentialV3' test.out

#- 132 RetrieveAllActiveThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveAllActiveThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 132 'RetrieveAllActiveThirdPartyLoginPlatformCredentialV3' test.out

#- 133 RetrieveAllSSOLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveAllSSOLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '71' \
    --offset '68' \
    > test.out 2>&1
eval_tap $? 133 'RetrieveAllSSOLoginPlatformCredentialV3' test.out

#- 134 RetrieveThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'BSbUw9Ck' \
    > test.out 2>&1
eval_tap $? 134 'RetrieveThirdPartyLoginPlatformCredentialV3' test.out

#- 135 AddThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam addThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'XfpbQOId' \
    --body '{"ACSURL": "RTgakTVi", "AWSCognitoRegion": "x9qkP2Od", "AWSCognitoUserPool": "qrkdcPhP", "AllowedClients": ["rwz6yUDL", "VQFdQogv", "b5TDHKeu"], "AppId": "9Rh8kiB4", "AuthorizationEndpoint": "CfGxjJ80", "ClientId": "P2J06mmZ", "Environment": "Sm7mDGYq", "FederationMetadataURL": "by08dqms", "GenericOauthFlow": true, "IsActive": false, "Issuer": "WgocEbZo", "JWKSEndpoint": "q4A7YJ9C", "KeyID": "3TfLTOrp", "NetflixCertificates": {"encryptedPrivateKey": "PO2uHczc", "encryptedPrivateKeyName": "54WF4wiG", "publicCertificate": "XAXrb9ls", "publicCertificateName": "dmrMPglA", "rootCertificate": "fe9i0jBC", "rootCertificateName": "MomIjZwl"}, "OrganizationId": "WoTyyzOT", "PlatformName": "0V8dOnyr", "RedirectUri": "vhOJFTUI", "RegisteredDomains": [{"affectedClientIDs": ["b5fSixYJ", "AAx6mHcM", "WHCARq88"], "domain": "HNVjzR5V", "namespaces": ["wdOcGrS4", "r4DKaFPK", "b63FI5xx"], "roleId": "fbSLPPaC"}, {"affectedClientIDs": ["tlNFyEtU", "0bXhsG2X", "HVTPAXt9"], "domain": "2ok7UMIU", "namespaces": ["m9kDRE1f", "UoPOPPz1", "Blsjlei7"], "roleId": "5MCW6syR"}, {"affectedClientIDs": ["8ndDixEy", "jrZ6jGFA", "zD3Hvs9e"], "domain": "fCu0CXuh", "namespaces": ["9LrRRApw", "2qSnf6cj", "SE1KhptD"], "roleId": "DCPFeNNS"}], "Secret": "BEmyTbYd", "TeamID": "Ltacexqs", "TokenAuthenticationType": "2lomcOgO", "TokenClaimsMapping": {"AyUAr3mx": "8AepFgKD", "qdz8XBjh": "Z6xy9yb0", "7MJlMwcu": "HdhOyBgo"}, "TokenEndpoint": "OQNiqsdJ", "UserInfoEndpoint": "lhwqiLaJ", "UserInfoHTTPMethod": "QidTuLvS", "scopes": ["xw9rIoIM", "3tCr61Lt", "6YLmWKaN"]}' \
    > test.out 2>&1
eval_tap $? 135 'AddThirdPartyLoginPlatformCredentialV3' test.out

#- 136 DeleteThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'g0W7xywI' \
    > test.out 2>&1
eval_tap $? 136 'DeleteThirdPartyLoginPlatformCredentialV3' test.out

#- 137 UpdateThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'eV1iiZvS' \
    --body '{"ACSURL": "rlzbPHdr", "AWSCognitoRegion": "Z5e2aFC2", "AWSCognitoUserPool": "MBjXEBji", "AllowedClients": ["IfCWGZIc", "iHRgErea", "emFyxzuk"], "AppId": "nsIRCST4", "AuthorizationEndpoint": "K8YEVpbE", "ClientId": "fbFbidHD", "Environment": "4DbqOrRG", "FederationMetadataURL": "PWcw6wX4", "GenericOauthFlow": false, "IsActive": false, "Issuer": "sNXjZsAE", "JWKSEndpoint": "UJiYNspe", "KeyID": "ncCjy0PP", "NetflixCertificates": {"encryptedPrivateKey": "QWyf3ukG", "encryptedPrivateKeyName": "AWoT6W3Y", "publicCertificate": "9sshgqv4", "publicCertificateName": "WE9ABQgg", "rootCertificate": "xIpdmTok", "rootCertificateName": "EIpetoN2"}, "OrganizationId": "SCaHFvfs", "PlatformName": "rRae2nVA", "RedirectUri": "ffculSlO", "RegisteredDomains": [{"affectedClientIDs": ["ciRXDAjX", "5iIjHOlI", "u2znws9a"], "domain": "DPLDS0BU", "namespaces": ["Lwh3c0xI", "RPS1NFfD", "m9jnnOyL"], "roleId": "mLZRNOnX"}, {"affectedClientIDs": ["vZVd0aBX", "3hOUksqT", "nhIPBX4R"], "domain": "tibTv7p8", "namespaces": ["h7Uc3rBs", "SGG8rliN", "9eNJlrxp"], "roleId": "vNQLYmAG"}, {"affectedClientIDs": ["U4uVJPC1", "oMn0unex", "fqfP9zcI"], "domain": "BI1fA7Gw", "namespaces": ["q2Y2eglr", "VOqquO7u", "IKosTtY4"], "roleId": "tDph6uL9"}], "Secret": "nYwHvIrf", "TeamID": "UGEW4rb0", "TokenAuthenticationType": "DDBN237o", "TokenClaimsMapping": {"LZXzd8Fs": "0u5XelwG", "7EnzKQ41": "EjurFGBs", "8gNk3XSE": "4AeDT4rr"}, "TokenEndpoint": "JPzpRxjX", "UserInfoEndpoint": "1GCK7SUM", "UserInfoHTTPMethod": "30wXY92x", "scopes": ["UQoLAQaE", "LPCH2X3F", "KSyev2Oq"]}' \
    > test.out 2>&1
eval_tap $? 137 'UpdateThirdPartyLoginPlatformCredentialV3' test.out

#- 138 UpdateThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '86Na9u9q' \
    --body '{"affectedClientIDs": ["cTRAPrhd", "GkXwSsN8", "pREMoECT"], "assignedNamespaces": ["Q6fLQxqL", "OLyKeelt", "SXIC4f5i"], "domain": "4fwER6pb", "roleId": "bpWUILqI"}' \
    > test.out 2>&1
eval_tap $? 138 'UpdateThirdPartyLoginPlatformDomainV3' test.out

#- 139 DeleteThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'kX2wcDm2' \
    --body '{"domain": "oRAn74rD"}' \
    > test.out 2>&1
eval_tap $? 139 'DeleteThirdPartyLoginPlatformDomainV3' test.out

#- 140 RetrieveSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam retrieveSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'mqCXU61s' \
    > test.out 2>&1
eval_tap $? 140 'RetrieveSSOLoginPlatformCredential' test.out

#- 141 AddSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam addSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'cqdhCNGU' \
    --body '{"acsUrl": "PUaLDY0j", "apiKey": "ba3qcb90", "appId": "fvbtS2Sb", "federationMetadataUrl": "Dz5bxC0R", "isActive": true, "redirectUri": "ij4ftfll", "secret": "JwNPKuj9", "ssoUrl": "zaxvNpGf"}' \
    > test.out 2>&1
eval_tap $? 141 'AddSSOLoginPlatformCredential' test.out

#- 142 DeleteSSOLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteSSOLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '3dN3NDe4' \
    > test.out 2>&1
eval_tap $? 142 'DeleteSSOLoginPlatformCredentialV3' test.out

#- 143 UpdateSSOPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam updateSSOPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'AyBPLyGo' \
    --body '{"acsUrl": "PdncNQkM", "apiKey": "eYzm3pTB", "appId": "x7h3KBjy", "federationMetadataUrl": "2DYfHuJO", "isActive": false, "redirectUri": "uZNYLZq9", "secret": "q2CYweBr", "ssoUrl": "80qjqhSX"}' \
    > test.out 2>&1
eval_tap $? 143 'UpdateSSOPlatformCredential' test.out

#- 144 AdminListUserIDByPlatformUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByPlatformUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'GF57p62K' \
    --rawPID  \
    --body '{"platformUserIds": ["bx018uH5", "Ji6je4PO", "78NkbElL"]}' \
    > test.out 2>&1
eval_tap $? 144 'AdminListUserIDByPlatformUserIDsV3' test.out

#- 145 AdminGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'J6f092eq' \
    --platformUserId 'x7OJHvDS' \
    > test.out 2>&1
eval_tap $? 145 'AdminGetUserByPlatformUserIDV3' test.out

#- 146 GetAdminUsersByRoleIdV3
./ng net.accelbyte.sdk.cli.Main iam getAdminUsersByRoleIdV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'U1UzoUsS' \
    --after '92' \
    --before '36' \
    --limit '50' \
    > test.out 2>&1
eval_tap $? 146 'GetAdminUsersByRoleIdV3' test.out

#- 147 AdminGetUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --emailAddress '9yPd2TBS' \
    > test.out 2>&1
eval_tap $? 147 'AdminGetUserByEmailAddressV3' test.out

#- 148 AdminGetBulkUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType 'okbQrxAZ' \
    --body '{"bulkUserId": ["S8xqjEnn", "dVrjfqEI", "NwCboecI"]}' \
    > test.out 2>&1
eval_tap $? 148 'AdminGetBulkUserBanV3' test.out

#- 149 AdminListUserIDByUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["5tCYnp5W", "lW078avt", "gW8kkDXZ"]}' \
    > test.out 2>&1
eval_tap $? 149 'AdminListUserIDByUserIDsV3' test.out

#- 150 AdminBulkGetUsersPlatform
./ng net.accelbyte.sdk.cli.Main iam adminBulkGetUsersPlatform \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["EUY2oCAa", "jXwnb0fl", "iQRoR7KO"]}' \
    > test.out 2>&1
eval_tap $? 150 'AdminBulkGetUsersPlatform' test.out

#- 151 AdminInviteUserV3
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddresses": ["VXgKJi6r", "Hc3LBYEU", "ttiACPvb"], "isAdmin": false, "namespace": "8msVihlz", "roles": ["NNhEswZg", "7x7zrJdh", "d5hfSXgp"]}' \
    > test.out 2>&1
eval_tap $? 151 'AdminInviteUserV3' test.out

#- 152 AdminQueryThirdPlatformLinkHistoryV3
./ng net.accelbyte.sdk.cli.Main iam adminQueryThirdPlatformLinkHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '58' \
    --offset '98' \
    --platformUserId 'fSeB3Ja9' \
    --platformId 'LTVEDItQ' \
    > test.out 2>&1
eval_tap $? 152 'AdminQueryThirdPlatformLinkHistoryV3' test.out

#- 153 AdminListUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminListUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '2' \
    --offset '99' \
    > test.out 2>&1
eval_tap $? 153 'AdminListUsersV3' test.out

#- 154 AdminSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam adminSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'Oq2jgqKW' \
    --endDate 'jTDCGAJt' \
    --includeTotal  \
    --limit '72' \
    --offset '48' \
    --platformBy 'YeW54Bsl' \
    --platformId 'hkHtNqTk' \
    --query 'DeHdCJZf' \
    --startDate 'nc0G4XAR' \
    --testAccount  \
    > test.out 2>&1
eval_tap $? 154 'AdminSearchUserV3' test.out

#- 155 AdminGetBulkUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"listEmailAddressRequest": ["YV0XUOTW", "F27PQRkj", "tOoCXZqX"]}' \
    > test.out 2>&1
eval_tap $? 155 'AdminGetBulkUserByEmailAddressV3' test.out

#- 156 AdminGetUserByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'xEHtq62c' \
    > test.out 2>&1
eval_tap $? 156 'AdminGetUserByUserIdV3' test.out

#- 157 AdminUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'aSy0cQWM' \
    --body '{"avatarUrl": "EPcZ5Y7X", "country": "TJixwbHz", "dateOfBirth": "q7QNlPNT", "displayName": "BUyCT23T", "languageTag": "UemfbDvK", "userName": "kIiSR4Cu"}' \
    > test.out 2>&1
eval_tap $? 157 'AdminUpdateUserV3' test.out

#- 158 AdminGetUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'o59ccufQ' \
    --activeOnly  \
    --after '4FERW7PH' \
    --before 'TPqQNMqf' \
    --limit '85' \
    > test.out 2>&1
eval_tap $? 158 'AdminGetUserBanV3' test.out

#- 159 AdminBanUserV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'EupyVuqB' \
    --body '{"ban": "HxtKeIXh", "comment": "JW7DB5qg", "endDate": "N3OMAF7H", "reason": "FFKg40rL", "skipNotif": true}' \
    > test.out 2>&1
eval_tap $? 159 'AdminBanUserV3' test.out

#- 160 AdminUpdateUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserBanV3 \
    --banId 'uIfTQoE9' \
    --namespace "$AB_NAMESPACE" \
    --userId '0G04NLY7' \
    --body '{"enabled": true, "skipNotif": true}' \
    > test.out 2>&1
eval_tap $? 160 'AdminUpdateUserBanV3' test.out

#- 161 AdminSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'SPmpUUU3' \
    --body '{"context": "YLmrRX8N", "emailAddress": "8eoMrQXR", "languageTag": "aR53zFxK"}' \
    > test.out 2>&1
eval_tap $? 161 'AdminSendVerificationCodeV3' test.out

#- 162 AdminVerifyAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'uQ5UPbZR' \
    --body '{"Code": "317dC1Zl", "ContactType": "PkuAaYme", "LanguageTag": "EfEO1MQZ", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 162 'AdminVerifyAccountV3' test.out

#- 163 GetUserVerificationCode
./ng net.accelbyte.sdk.cli.Main iam getUserVerificationCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'pHcjw0pb' \
    > test.out 2>&1
eval_tap $? 163 'GetUserVerificationCode' test.out

#- 164 AdminGetUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'yWWfQ5GD' \
    > test.out 2>&1
eval_tap $? 164 'AdminGetUserDeletionStatusV3' test.out

#- 165 AdminUpdateUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'sydDvggr' \
    --body '{"deletionDate": 9, "enabled": true}' \
    > test.out 2>&1
eval_tap $? 165 'AdminUpdateUserDeletionStatusV3' test.out

#- 166 AdminUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'HBcvQ3KT' \
    --body '{"code": "V11rmhhS", "country": "534kdNqv", "dateOfBirth": "LDZbinLc", "displayName": "1xhgfEhE", "emailAddress": "5rbSlG3u", "password": "Qc11mJC7", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 166 'AdminUpgradeHeadlessAccountV3' test.out

#- 167 AdminDeleteUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'x2IZriqW' \
    > test.out 2>&1
eval_tap $? 167 'AdminDeleteUserInformationV3' test.out

#- 168 AdminGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'a1fbSMM2' \
    --after '0.1332417681836804' \
    --before '0.33956427531376265' \
    --limit '15' \
    > test.out 2>&1
eval_tap $? 168 'AdminGetUserLoginHistoriesV3' test.out

#- 169 AdminResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam adminResetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'RtWsBEAM' \
    --body '{"languageTag": "XYMhNySw", "newPassword": "pGriqjHi", "oldPassword": "4nFrSR6U"}' \
    > test.out 2>&1
eval_tap $? 169 'AdminResetPasswordV3' test.out

#- 170 AdminUpdateUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserPermissionV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '0a82dPQj' \
    --body '{"Permissions": [{"Action": 84, "Resource": "VSQShwht", "SchedAction": 100, "SchedCron": "euiweVLt", "SchedRange": ["wj3bHqhD", "thijsw66", "2obyw7nr"]}, {"Action": 20, "Resource": "QGhhpxdC", "SchedAction": 4, "SchedCron": "MwHVKLHI", "SchedRange": ["bbpwdaQv", "54BZxYLn", "5lFcfI9R"]}, {"Action": 32, "Resource": "gXRMcXy0", "SchedAction": 33, "SchedCron": "n1eumWKR", "SchedRange": ["TsIbIuFz", "TebV9X1M", "1oU9ViNN"]}]}' \
    > test.out 2>&1
eval_tap $? 170 'AdminUpdateUserPermissionV3' test.out

#- 171 AdminAddUserPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserPermissionsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'y5HrYOCv' \
    --body '{"Permissions": [{"Action": 76, "Resource": "C3jUoDmG", "SchedAction": 32, "SchedCron": "EJncNBiq", "SchedRange": ["BvyjKbe0", "uARinexu", "yHjhoyaS"]}, {"Action": 87, "Resource": "tLIA307R", "SchedAction": 90, "SchedCron": "Fhi1DxLU", "SchedRange": ["M6EVQQvw", "R9sqPrVL", "y0xXSv5G"]}, {"Action": 22, "Resource": "6zSZSpa0", "SchedAction": 69, "SchedCron": "p8ZffHVP", "SchedRange": ["wzFYB61k", "LpQEwVUD", "mQRQ56xJ"]}]}' \
    > test.out 2>&1
eval_tap $? 171 'AdminAddUserPermissionsV3' test.out

#- 172 AdminDeleteUserPermissionBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'wM4FQXHK' \
    --body '[{"Action": 11, "Resource": "zIRpPoX4"}, {"Action": 16, "Resource": "kuOQOhEb"}, {"Action": 95, "Resource": "nRLqDBrN"}]' \
    > test.out 2>&1
eval_tap $? 172 'AdminDeleteUserPermissionBulkV3' test.out

#- 173 AdminDeleteUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionV3 \
    --action '75' \
    --namespace "$AB_NAMESPACE" \
    --resource '7z7acgqG' \
    --userId '7SkLFnGj' \
    > test.out 2>&1
eval_tap $? 173 'AdminDeleteUserPermissionV3' test.out

#- 174 AdminGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'P9UhXD64' \
    --after 'vjtHzQ6v' \
    --before 'pPnAJnrg' \
    --limit '14' \
    --platformId 'PPY50bXH' \
    > test.out 2>&1
eval_tap $? 174 'AdminGetUserPlatformAccountsV3' test.out

#- 175 AdminGetListJusticePlatformAccounts
./ng net.accelbyte.sdk.cli.Main iam adminGetListJusticePlatformAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId '7Mszj3qA' \
    > test.out 2>&1
eval_tap $? 175 'AdminGetListJusticePlatformAccounts' test.out

#- 176 AdminGetUserMapping
./ng net.accelbyte.sdk.cli.Main iam adminGetUserMapping \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'IN3BuxvE' \
    --userId '9NKSvMjg' \
    > test.out 2>&1
eval_tap $? 176 'AdminGetUserMapping' test.out

#- 177 AdminCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam adminCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'q8ybcfp1' \
    --userId 'ZMwEVapN' \
    > test.out 2>&1
eval_tap $? 177 'AdminCreateJusticeUser' test.out

#- 178 AdminLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'FxnoqtFn' \
    --skipConflict  \
    --body '{"platformId": "DROi9RDD", "platformUserId": "EbZTAIOV"}' \
    > test.out 2>&1
eval_tap $? 178 'AdminLinkPlatformAccount' test.out

#- 179 AdminPlatformUnlinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformUnlinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '6XZZA1OV' \
    --userId 'Pau3V7OL' \
    --body '{"platformNamespace": "ME6UlUXK"}' \
    > test.out 2>&1
eval_tap $? 179 'AdminPlatformUnlinkV3' test.out

#- 180 AdminPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'ALaWzzOJ' \
    --userId 'Kamo5jY6' \
    --ticket 'cdWoW54H' \
    > test.out 2>&1
eval_tap $? 180 'AdminPlatformLinkV3' test.out

#- 181 AdminDeleteUserLinkingHistoryByPlatformIDV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserLinkingHistoryByPlatformIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'HJCb3GmU' \
    --userId 'TsrcklT7' \
    > test.out 2>&1
eval_tap $? 181 'AdminDeleteUserLinkingHistoryByPlatformIDV3' test.out

#- 182 AdminGetThirdPartyPlatformTokenLinkStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetThirdPartyPlatformTokenLinkStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '9IW5z0ue' \
    --userId '3igJykI0' \
    --platformToken 'u6ns6gPF' \
    > test.out 2>&1
eval_tap $? 182 'AdminGetThirdPartyPlatformTokenLinkStatusV3' test.out

#- 183 AdminGetUserSinglePlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminGetUserSinglePlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --platformId 'OjpCkgFa' \
    --userId 'mTA3MUv7' \
    > test.out 2>&1
eval_tap $? 183 'AdminGetUserSinglePlatformAccount' test.out

#- 184 AdminDeleteUserRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRolesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'YyjReSlj' \
    --body '["3h7zWzwg", "3ILBORpm", "V1Q8kLMe"]' \
    > test.out 2>&1
eval_tap $? 184 'AdminDeleteUserRolesV3' test.out

#- 185 AdminSaveUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminSaveUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'HdaAzCHW' \
    --body '[{"namespace": "uaj8fnts", "roleId": "j0RONqzc"}, {"namespace": "nA7saeZk", "roleId": "sBHAJW9N"}, {"namespace": "3slJPvRf", "roleId": "L4B562t2"}]' \
    > test.out 2>&1
eval_tap $? 185 'AdminSaveUserRoleV3' test.out

#- 186 AdminAddUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'RLV842Mt' \
    --userId 's04gQoDg' \
    > test.out 2>&1
eval_tap $? 186 'AdminAddUserRoleV3' test.out

#- 187 AdminDeleteUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId '53Ej9cHY' \
    --userId 'hCsebbBW' \
    > test.out 2>&1
eval_tap $? 187 'AdminDeleteUserRoleV3' test.out

#- 188 AdminUpdateUserStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'wGzpDsB2' \
    --body '{"enabled": true, "reason": "sa87nFJz"}' \
    > test.out 2>&1
eval_tap $? 188 'AdminUpdateUserStatusV3' test.out

#- 189 AdminTrustlyUpdateUserIdentity
./ng net.accelbyte.sdk.cli.Main iam adminTrustlyUpdateUserIdentity \
    --namespace "$AB_NAMESPACE" \
    --userId 'hf6TZdhs' \
    --body '{"emailAddress": "seZj3Ezk", "password": "JOqAElNA"}' \
    > test.out 2>&1
eval_tap $? 189 'AdminTrustlyUpdateUserIdentity' test.out

#- 190 AdminVerifyUserWithoutVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyUserWithoutVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'VsNA45rl' \
    > test.out 2>&1
eval_tap $? 190 'AdminVerifyUserWithoutVerificationCodeV3' test.out

#- 191 AdminUpdateClientSecretV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientSecretV3 \
    --clientId '9A1bMm4V' \
    --namespace "$AB_NAMESPACE" \
    --body '{"newSecret": "SL8fvqw4"}' \
    > test.out 2>&1
eval_tap $? 191 'AdminUpdateClientSecretV3' test.out

#- 192 AdminGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV3 \
    --after '6MjZUsUB' \
    --before 'tL4GH36k' \
    --isWildcard  \
    --limit '78' \
    > test.out 2>&1
eval_tap $? 192 'AdminGetRolesV3' test.out

#- 193 AdminCreateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV3 \
    --body '{"adminRole": true, "deletable": true, "isWildcard": true, "managers": [{"displayName": "8LRl2BNY", "namespace": "EmKSglYt", "userId": "qbwyWm6s"}, {"displayName": "He126OM6", "namespace": "KoNPnnCG", "userId": "KQkYIAwU"}, {"displayName": "R5fZyyYY", "namespace": "ibl6FHQt", "userId": "dVVvINfT"}], "members": [{"displayName": "xF8omK6W", "namespace": "rytyLaSZ", "userId": "NM2r3Uel"}, {"displayName": "GnI1ptAP", "namespace": "Enacfz0C", "userId": "SuFZQJ1O"}, {"displayName": "dxdg902h", "namespace": "7eE5TcQW", "userId": "xAA0dhmp"}], "permissions": [{"action": 16, "resource": "SdY159qZ", "schedAction": 23, "schedCron": "CEyHfDTH", "schedRange": ["wYGG6U1W", "tnzPw29v", "p32VCX6J"]}, {"action": 30, "resource": "7LrXWw0h", "schedAction": 56, "schedCron": "pcdbkUEv", "schedRange": ["4mT8RC1W", "rtKUH5K2", "RVJs7buI"]}, {"action": 41, "resource": "y6xiDHB6", "schedAction": 36, "schedCron": "4OfIOVUF", "schedRange": ["I1M5BOLC", "n2l0ekk8", "ATh5TzFg"]}], "roleName": "uEqcsZgT"}' \
    > test.out 2>&1
eval_tap $? 193 'AdminCreateRoleV3' test.out

#- 194 AdminGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV3 \
    --roleId 'l6YSiZCs' \
    > test.out 2>&1
eval_tap $? 194 'AdminGetRoleV3' test.out

#- 195 AdminDeleteRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV3 \
    --roleId 'pRZhug5X' \
    > test.out 2>&1
eval_tap $? 195 'AdminDeleteRoleV3' test.out

#- 196 AdminUpdateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV3 \
    --roleId 'Q9um8ncG' \
    --body '{"deletable": true, "isWildcard": false, "roleName": "mA1Ze3Bm"}' \
    > test.out 2>&1
eval_tap $? 196 'AdminUpdateRoleV3' test.out

#- 197 AdminGetRoleAdminStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleAdminStatusV3 \
    --roleId 'IHbF2IXV' \
    > test.out 2>&1
eval_tap $? 197 'AdminGetRoleAdminStatusV3' test.out

#- 198 AdminUpdateAdminRoleStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateAdminRoleStatusV3 \
    --roleId 'CfH1ywWE' \
    > test.out 2>&1
eval_tap $? 198 'AdminUpdateAdminRoleStatusV3' test.out

#- 199 AdminRemoveRoleAdminV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleAdminV3 \
    --roleId 'hHg7nzbD' \
    > test.out 2>&1
eval_tap $? 199 'AdminRemoveRoleAdminV3' test.out

#- 200 AdminGetRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleManagersV3 \
    --roleId 'jNKn8zRe' \
    --after 'NPMfYBqI' \
    --before 'RuwKFiKN' \
    --limit '38' \
    > test.out 2>&1
eval_tap $? 200 'AdminGetRoleManagersV3' test.out

#- 201 AdminAddRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleManagersV3 \
    --roleId 'ee4Tr204' \
    --body '{"managers": [{"displayName": "cMA4N1N0", "namespace": "iKN70Ux4", "userId": "5rFURM2i"}, {"displayName": "9TwlSezc", "namespace": "8pgtOv4K", "userId": "v9OLjN1o"}, {"displayName": "KOxPbTJi", "namespace": "E548Q1bN", "userId": "LkPARTgZ"}]}' \
    > test.out 2>&1
eval_tap $? 201 'AdminAddRoleManagersV3' test.out

#- 202 AdminRemoveRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleManagersV3 \
    --roleId 'ybZdggc2' \
    --body '{"managers": [{"displayName": "pdVMqL6P", "namespace": "vg3XDdyH", "userId": "trg75a7W"}, {"displayName": "8w9Cztx3", "namespace": "5dUkngn8", "userId": "FYPmjfvW"}, {"displayName": "FDVckPne", "namespace": "AAJ9DYA6", "userId": "EwtgoRsn"}]}' \
    > test.out 2>&1
eval_tap $? 202 'AdminRemoveRoleManagersV3' test.out

#- 203 AdminGetRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleMembersV3 \
    --roleId 'sEX4ZzDV' \
    --after 'WiiWPsI5' \
    --before '8XeHMqvR' \
    --limit '82' \
    > test.out 2>&1
eval_tap $? 203 'AdminGetRoleMembersV3' test.out

#- 204 AdminAddRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleMembersV3 \
    --roleId 'tGVfB9sl' \
    --body '{"members": [{"displayName": "rMeNDkI1", "namespace": "KwAtapbX", "userId": "1q7IqDsC"}, {"displayName": "K5KLOBzH", "namespace": "xSdNrRkP", "userId": "T1BunE7a"}, {"displayName": "pLlFPqhv", "namespace": "0ecI3La9", "userId": "tV64OcRU"}]}' \
    > test.out 2>&1
eval_tap $? 204 'AdminAddRoleMembersV3' test.out

#- 205 AdminRemoveRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleMembersV3 \
    --roleId 'Wc3n1XRM' \
    --body '{"members": [{"displayName": "NvE6TMGr", "namespace": "RFmdb7nR", "userId": "gg1PLP05"}, {"displayName": "Hi5QARo3", "namespace": "zzoO5LNE", "userId": "r5LWGNMn"}, {"displayName": "t1COy45P", "namespace": "sSkHSypL", "userId": "XWOJiXOe"}]}' \
    > test.out 2>&1
eval_tap $? 205 'AdminRemoveRoleMembersV3' test.out

#- 206 AdminUpdateRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV3 \
    --roleId 'Q9sQbJ7j' \
    --body '{"permissions": [{"action": 96, "resource": "bCcZPdWo", "schedAction": 64, "schedCron": "BzCpvvLr", "schedRange": ["L3VZllqR", "W2QAfihh", "3ZbKU09T"]}, {"action": 48, "resource": "3mxbL0EY", "schedAction": 6, "schedCron": "hNmNeKUB", "schedRange": ["AuefINB6", "szoCiGUf", "1W3dGHva"]}, {"action": 55, "resource": "E9yfe9UX", "schedAction": 91, "schedCron": "5YvymHez", "schedRange": ["bBXjSxFa", "2aIHYOhN", "ee0smETx"]}]}' \
    > test.out 2>&1
eval_tap $? 206 'AdminUpdateRolePermissionsV3' test.out

#- 207 AdminAddRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV3 \
    --roleId 'B0h1DhTY' \
    --body '{"permissions": [{"action": 53, "resource": "dDqfT04A", "schedAction": 41, "schedCron": "OXAyQru7", "schedRange": ["qj2wR1Yk", "PeQ1P6vF", "hQNE6FWX"]}, {"action": 78, "resource": "p8o9xpAr", "schedAction": 57, "schedCron": "UhvCkYUz", "schedRange": ["Qo27n6TN", "HFF50uuq", "pktSJxLE"]}, {"action": 50, "resource": "0Rasd9gD", "schedAction": 40, "schedCron": "Z5kx0tdp", "schedRange": ["UoBwgyQy", "JsMKQOkA", "ulV4Oo7x"]}]}' \
    > test.out 2>&1
eval_tap $? 207 'AdminAddRolePermissionsV3' test.out

#- 208 AdminDeleteRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV3 \
    --roleId '96AL89vz' \
    --body '["ck8UY6Bn", "kwRsAqgB", "WBIhBDRj"]' \
    > test.out 2>&1
eval_tap $? 208 'AdminDeleteRolePermissionsV3' test.out

#- 209 AdminDeleteRolePermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionV3 \
    --action '24' \
    --resource 'D4YBFNaH' \
    --roleId 'Y66YvqH4' \
    > test.out 2>&1
eval_tap $? 209 'AdminDeleteRolePermissionV3' test.out

#- 210 AdminGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam adminGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 210 'AdminGetMyUserV3' test.out

#- 211 UserAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam userAuthenticationV3 \
    --clientId 'jhZYAGGS' \
    --extendExp  \
    --redirectUri 'WEZuyH03' \
    --password 'xb1mIq5S' \
    --requestId 'UE1uAANs' \
    --userName 'b6D7CkbD' \
    > test.out 2>&1
eval_tap $? 211 'UserAuthenticationV3' test.out

#- 212 AuthenticationWithPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV3 \
    --extendExp  \
    --clientId 'xkmbydMy' \
    --linkingToken 'mblsdw1J' \
    --password '1Kz6ANij' \
    --username 'En16wgWO' \
    > test.out 2>&1
eval_tap $? 212 'AuthenticationWithPlatformLinkV3' test.out

#- 213 GenerateTokenByNewHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV3 \
    --additionalData 'cuUMVe64' \
    --extendExp  \
    --linkingToken 'PFprGTlY' \
    > test.out 2>&1
eval_tap $? 213 'GenerateTokenByNewHeadlessAccountV3' test.out

#- 214 RequestOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam requestOneTimeLinkingCodeV3 \
    --platformId '0PJE2tcw' \
    > test.out 2>&1
eval_tap $? 214 'RequestOneTimeLinkingCodeV3' test.out

#- 215 ValidateOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam validateOneTimeLinkingCodeV3 \
    --oneTimeLinkCode 'UHFAoZ6t' \
    > test.out 2>&1
eval_tap $? 215 'ValidateOneTimeLinkingCodeV3' test.out

#- 216 RequestTokenByOneTimeLinkCodeResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTokenByOneTimeLinkCodeResponseV3 \
    --additionalData 'mNWW0XhW' \
    --isTransient  \
    --clientId 'm3iBAqpe' \
    --oneTimeLinkCode 'aCIQ4EIw' \
    > test.out 2>&1
eval_tap $? 216 'RequestTokenByOneTimeLinkCodeResponseV3' test.out

#- 217 GetCountryLocationV3
./ng net.accelbyte.sdk.cli.Main iam getCountryLocationV3 \
    > test.out 2>&1
eval_tap $? 217 'GetCountryLocationV3' test.out

#- 218 Logout
./ng net.accelbyte.sdk.cli.Main iam logout \
    > test.out 2>&1
eval_tap $? 218 'Logout' test.out

#- 219 RequestTokenExchangeCodeV3
./ng net.accelbyte.sdk.cli.Main iam requestTokenExchangeCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --clientId 'eoR3JSRD' \
    > test.out 2>&1
eval_tap $? 219 'RequestTokenExchangeCodeV3' test.out

#- 220 AdminRetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam adminRetrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'yaniauzd' \
    --userId 'JFpBl5qe' \
    > test.out 2>&1
eval_tap $? 220 'AdminRetrieveUserThirdPartyPlatformTokenV3' test.out

#- 221 RevokeUserV3
./ng net.accelbyte.sdk.cli.Main iam revokeUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'E0DYfWRR' \
    --includeGameNamespace  \
    > test.out 2>&1
eval_tap $? 221 'RevokeUserV3' test.out

#- 222 AuthorizeV3
./ng net.accelbyte.sdk.cli.Main iam authorizeV3 \
    --codeChallenge '6MKSPtIe' \
    --codeChallengeMethod 'plain' \
    --createHeadless  \
    --oneTimeLinkCode 'UJdTdfM2' \
    --redirectUri '6hcjsaDE' \
    --scope 'zi6DGnf8' \
    --state 'XXWrz9Kn' \
    --targetAuthPage 'dvSay8oL' \
    --useRedirectUriAsLoginUrlWhenLocked  \
    --clientId 'dxC6rAcX' \
    --responseType 'code' \
    > test.out 2>&1
eval_tap $? 222 'AuthorizeV3' test.out

#- 223 TokenIntrospectionV3
./ng net.accelbyte.sdk.cli.Main iam tokenIntrospectionV3 \
    --token 'LgVgL6Zl' \
    > test.out 2>&1
eval_tap $? 223 'TokenIntrospectionV3' test.out

#- 224 GetJWKSV3
./ng net.accelbyte.sdk.cli.Main iam getJWKSV3 \
    > test.out 2>&1
eval_tap $? 224 'GetJWKSV3' test.out

#- 225 SendMFAAuthenticationCode
./ng net.accelbyte.sdk.cli.Main iam sendMFAAuthenticationCode \
    --clientId 'ptnvZZTv' \
    --factor 'v8LJc0kq' \
    --mfaToken 'BNzbjSvm' \
    > test.out 2>&1
eval_tap $? 225 'SendMFAAuthenticationCode' test.out

#- 226 Change2faMethod
./ng net.accelbyte.sdk.cli.Main iam change2faMethod \
    --factor 'MQjVMFpT' \
    --mfaToken 'geL9deUK' \
    > test.out 2>&1
eval_tap $? 226 'Change2faMethod' test.out

#- 227 Verify2faCode
./ng net.accelbyte.sdk.cli.Main iam verify2faCode \
    --code 'Am6XFedb' \
    --factor 'Wotah9IP' \
    --mfaToken 'hqNuxI0o' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 227 'Verify2faCode' test.out

#- 228 RetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam retrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '4u9aJOYb' \
    --userId 'IxVIZmo3' \
    > test.out 2>&1
eval_tap $? 228 'RetrieveUserThirdPartyPlatformTokenV3' test.out

#- 229 AuthCodeRequestV3
./ng net.accelbyte.sdk.cli.Main iam authCodeRequestV3 \
    --platformId 'bYRsoxwl' \
    --clientId 'aOkVTaje' \
    --redirectUri '0ZYSHraW' \
    --requestId '7ItP8D0Q' \
    > test.out 2>&1
eval_tap $? 229 'AuthCodeRequestV3' test.out

#- 230 PlatformTokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV3 \
    --platformId 'AkukQEpj' \
    --additionalData 'CH668r1H' \
    --clientId 'mJSfnVrv' \
    --createHeadless  \
    --deviceId 'hjcZreJk' \
    --macAddress 'Jhr2Nq9z' \
    --platformToken 'QahkX2St' \
    --skipSetCookie  \
    > test.out 2>&1
eval_tap $? 230 'PlatformTokenGrantV3' test.out

#- 231 GetRevocationListV3
./ng net.accelbyte.sdk.cli.Main iam getRevocationListV3 \
    > test.out 2>&1
eval_tap $? 231 'GetRevocationListV3' test.out

#- 232 TokenRevocationV3
./ng net.accelbyte.sdk.cli.Main iam tokenRevocationV3 \
    --token 'tjVHpcRU' \
    > test.out 2>&1
eval_tap $? 232 'TokenRevocationV3' test.out

#- 233 SimultaneousLoginV3
./ng net.accelbyte.sdk.cli.Main iam simultaneousLoginV3 \
    --simultaneousPlatform 'pspc' \
    --simultaneousTicket 'qHKgHXO5' \
    --nativePlatform 'steam' \
    --nativePlatformTicket 'zaYMwj9b' \
    > test.out 2>&1
eval_tap $? 233 'SimultaneousLoginV3' test.out

#- 234 TokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV3 \
    --additionalData 'rbbxLHEb' \
    --clientId 'f09XRumS' \
    --code 'm7yp4LZO' \
    --codeVerifier 'u9VQzPbm' \
    --extendNamespace 'k5lwK4P5' \
    --extendExp  \
    --password '5wwovm2D' \
    --redirectUri 'tUfGaAir' \
    --refreshToken 'MMDl5yJP' \
    --username 'mKHEe0mG' \
    --grantType 'urn:ietf:params:oauth:grant-type:extend_client_credentials' \
    > test.out 2>&1
eval_tap $? 234 'TokenGrantV3' test.out

#- 235 VerifyTokenV3
./ng net.accelbyte.sdk.cli.Main iam verifyTokenV3 \
    --token 'bA95XYbR' \
    > test.out 2>&1
eval_tap $? 235 'VerifyTokenV3' test.out

#- 236 PlatformAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticationV3 \
    --platformId 'OJVoHNeE' \
    --code 'xhVJTzCj' \
    --error 'etV2sGPy' \
    --openidAssocHandle 'TGM4WSbg' \
    --openidClaimedId '4Oz9irLl' \
    --openidIdentity '7on8GJi8' \
    --openidMode 'WofRWpW7' \
    --openidNs 'ahUxc0ry' \
    --openidOpEndpoint 'AAWNb2X9' \
    --openidResponseNonce 'EKL3EkKW' \
    --openidReturnTo '8gptrfdU' \
    --openidSig 'Q82NiiW1' \
    --openidSigned 'PPkWk5rJ' \
    --state '2u6NGdVS' \
    > test.out 2>&1
eval_tap $? 236 'PlatformAuthenticationV3' test.out

#- 237 PlatformTokenRefreshV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenRefreshV3 \
    --platformId 'MZNauVu3' \
    --platformToken 'HT5uAHvf' \
    > test.out 2>&1
eval_tap $? 237 'PlatformTokenRefreshV3' test.out

#- 238 PublicGetInputValidations
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidations \
    --defaultOnEmpty  \
    --languageCode 'pnK729Ih' \
    > test.out 2>&1
eval_tap $? 238 'PublicGetInputValidations' test.out

#- 239 PublicGetInputValidationByField
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidationByField \
    --field 'xwwaAkWY' \
    > test.out 2>&1
eval_tap $? 239 'PublicGetInputValidationByField' test.out

#- 240 PublicGetCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam publicGetCountryAgeRestrictionV3 \
    --countryCode 'rReIVBOB' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 240 'PublicGetCountryAgeRestrictionV3' test.out

#- 241 PublicGetCountryListV3
./ng net.accelbyte.sdk.cli.Main iam publicGetCountryListV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 241 'PublicGetCountryListV3' test.out

#- 242 RetrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3
./ng net.accelbyte.sdk.cli.Main iam retrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 242 'RetrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3' test.out

#- 243 RetrieveActiveOIDCClientsPublicV3
./ng net.accelbyte.sdk.cli.Main iam retrieveActiveOIDCClientsPublicV3 \
    --namespace "$AB_NAMESPACE" \
    --clientId 'nBbDkP9M' \
    > test.out 2>&1
eval_tap $? 243 'RetrieveActiveOIDCClientsPublicV3' test.out

#- 244 PublicListUserIDByPlatformUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserIDByPlatformUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'IeRxpVdI' \
    --rawPID  \
    --body '{"platformUserIds": ["N0B9WKZA", "ZrYfsizX", "BM60KnI5"]}' \
    > test.out 2>&1
eval_tap $? 244 'PublicListUserIDByPlatformUserIDsV3' test.out

#- 245 PublicGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'OwfSra60' \
    --platformUserId 'mhHQ3ZFP' \
    > test.out 2>&1
eval_tap $? 245 'PublicGetUserByPlatformUserIDV3' test.out

#- 246 PublicGetAsyncStatus
./ng net.accelbyte.sdk.cli.Main iam publicGetAsyncStatus \
    --namespace "$AB_NAMESPACE" \
    --requestId 'cLwXujqF' \
    > test.out 2>&1
eval_tap $? 246 'PublicGetAsyncStatus' test.out

#- 247 PublicSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam publicSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'Hrnpse6L' \
    --limit '75' \
    --offset '28' \
    --platformBy '6BLGrKQL' \
    --platformId 'vBVOdyXN' \
    --query 'JTHB03ws' \
    > test.out 2>&1
eval_tap $? 247 'PublicSearchUserV3' test.out

#- 248 PublicCreateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "zTxR6T3M", "acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "aowz0SMf", "policyId": "APZTCctE", "policyVersionId": "LwEQmyAR"}, {"isAccepted": false, "localizedPolicyVersionId": "AvuCtXPr", "policyId": "XIaWMthy", "policyVersionId": "i2plEcWS"}, {"isAccepted": false, "localizedPolicyVersionId": "XjcreUff", "policyId": "zHk17Is0", "policyVersionId": "ygagrIGO"}], "authType": "wub8jMW3", "code": "V0khRt5L", "country": "yt20tDlW", "dateOfBirth": "e9i5IVvx", "displayName": "SgvHVrMm", "emailAddress": "emMBW4mP", "password": "zz8yKJBr", "reachMinimumAge": true}' \
    > test.out 2>&1
eval_tap $? 248 'PublicCreateUserV3' test.out

#- 249 CheckUserAvailability
./ng net.accelbyte.sdk.cli.Main iam checkUserAvailability \
    --namespace "$AB_NAMESPACE" \
    --field 'ERRmvMB0' \
    --query 'xaEx6Vsl' \
    > test.out 2>&1
eval_tap $? 249 'CheckUserAvailability' test.out

#- 250 PublicBulkGetUsers
./ng net.accelbyte.sdk.cli.Main iam publicBulkGetUsers \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["JKV6UgoO", "Y7uyQbjJ", "mrgUPiTA"]}' \
    > test.out 2>&1
eval_tap $? 250 'PublicBulkGetUsers' test.out

#- 251 PublicSendRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicSendRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "TYePnEs8", "languageTag": "sPKbqEAE"}' \
    > test.out 2>&1
eval_tap $? 251 'PublicSendRegistrationCode' test.out

#- 252 PublicVerifyRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicVerifyRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "ZQgoNVLg", "emailAddress": "wtjDmZmi"}' \
    > test.out 2>&1
eval_tap $? 252 'PublicVerifyRegistrationCode' test.out

#- 253 PublicForgotPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicForgotPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "700wDHIo", "languageTag": "TqMHu3z8"}' \
    > test.out 2>&1
eval_tap $? 253 'PublicForgotPasswordV3' test.out

#- 254 GetAdminInvitationV3
./ng net.accelbyte.sdk.cli.Main iam getAdminInvitationV3 \
    --invitationId 'txf83shB' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 254 'GetAdminInvitationV3' test.out

#- 255 CreateUserFromInvitationV3
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV3 \
    --invitationId 'KhheLNzr' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "BNRY0c20", "policyId": "YKCCbz5Q", "policyVersionId": "z7Dp42Tg"}, {"isAccepted": false, "localizedPolicyVersionId": "2cmrv5we", "policyId": "PO7791f3", "policyVersionId": "eMPrbosT"}, {"isAccepted": false, "localizedPolicyVersionId": "yLMIvBek", "policyId": "5LBLO9D9", "policyVersionId": "zYRfPDvf"}], "authType": "EMAILPASSWD", "country": "Fa4yZnrQ", "dateOfBirth": "MdTG9mIm", "displayName": "iI4GoP72", "password": "OvUZcdkC", "reachMinimumAge": false}' \
    > test.out 2>&1
eval_tap $? 255 'CreateUserFromInvitationV3' test.out

#- 256 UpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam updateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "ztZnSL9f", "country": "orw9VWpq", "dateOfBirth": "BYEsfduQ", "displayName": "skxmM3nm", "languageTag": "pFNzQHzv", "userName": "AeqRlnCu"}' \
    > test.out 2>&1
eval_tap $? 256 'UpdateUserV3' test.out

#- 257 PublicPartialUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicPartialUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "JV7mGBl0", "country": "GjPTpsDz", "dateOfBirth": "OxJrntih", "displayName": "kGNPOfJu", "languageTag": "FobFkPCf", "userName": "N9ahNVQd"}' \
    > test.out 2>&1
eval_tap $? 257 'PublicPartialUpdateUserV3' test.out

#- 258 PublicSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"context": "pFWQR3Xb", "emailAddress": "FPbYRkgC", "languageTag": "vFbZf1yS"}' \
    > test.out 2>&1
eval_tap $? 258 'PublicSendVerificationCodeV3' test.out

#- 259 PublicUserVerificationV3
./ng net.accelbyte.sdk.cli.Main iam publicUserVerificationV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "RMAOiK6w", "contactType": "nbyFWpXz", "languageTag": "8vsM0l9H", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 259 'PublicUserVerificationV3' test.out

#- 260 PublicUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "fIgzkP0h", "country": "XTXoaLcN", "dateOfBirth": "N4aR9UAb", "displayName": "TRCeksKw", "emailAddress": "tTSxppez", "password": "cipYhs7L", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 260 'PublicUpgradeHeadlessAccountV3' test.out

#- 261 PublicVerifyHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --needVerificationCode  \
    --body '{"emailAddress": "MXzunphd", "password": "WyUtuOvU"}' \
    > test.out 2>&1
eval_tap $? 261 'PublicVerifyHeadlessAccountV3' test.out

#- 262 PublicUpdatePasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicUpdatePasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"languageTag": "EzXXOAvF", "newPassword": "5xckWEw9", "oldPassword": "kxkz7Na4"}' \
    > test.out 2>&1
eval_tap $? 262 'PublicUpdatePasswordV3' test.out

#- 263 PublicCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam publicCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'JL3YBqQG' \
    > test.out 2>&1
eval_tap $? 263 'PublicCreateJusticeUser' test.out

#- 264 PublicPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '4mVaxf7b' \
    --redirectUri 'bWVyKyXS' \
    --ticket 'KXEFkxxK' \
    > test.out 2>&1
eval_tap $? 264 'PublicPlatformLinkV3' test.out

#- 265 PublicPlatformUnlinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '3GEN1ii4' \
    --body '{"platformNamespace": "4dbmaG2Q"}' \
    > test.out 2>&1
eval_tap $? 265 'PublicPlatformUnlinkV3' test.out

#- 266 PublicPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '4LBXJ4EQ' \
    > test.out 2>&1
eval_tap $? 266 'PublicPlatformUnlinkAllV3' test.out

#- 267 PublicForcePlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicForcePlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'YWLwvt0a' \
    --ticket 'PbiZSlNT' \
    > test.out 2>&1
eval_tap $? 267 'PublicForcePlatformLinkV3' test.out

#- 268 PublicWebLinkPlatform
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatform \
    --namespace "$AB_NAMESPACE" \
    --platformId 'ASl0FUck' \
    --clientId 'lp0rjEEB' \
    --redirectUri 'SlZLBiCY' \
    > test.out 2>&1
eval_tap $? 268 'PublicWebLinkPlatform' test.out

#- 269 PublicWebLinkPlatformEstablish
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatformEstablish \
    --namespace "$AB_NAMESPACE" \
    --platformId 'GM7TO0ko' \
    --code 'hTds3ugQ' \
    --state 'ESzQeYs3' \
    > test.out 2>&1
eval_tap $? 269 'PublicWebLinkPlatformEstablish' test.out

#- 270 PublicProcessWebLinkPlatformV3
./ng net.accelbyte.sdk.cli.Main iam publicProcessWebLinkPlatformV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '2Qe7lu54' \
    --code 'TgTcgcRi' \
    --state '7uEUa7Ch' \
    > test.out 2>&1
eval_tap $? 270 'PublicProcessWebLinkPlatformV3' test.out

#- 271 PublicGetUsersPlatformInfosV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUsersPlatformInfosV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"platformId": "Pp3QNI5C", "userIds": ["wsITT2c4", "z1qbfy01", "JQPtDNdz"]}' \
    > test.out 2>&1
eval_tap $? 271 'PublicGetUsersPlatformInfosV3' test.out

#- 272 ResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam resetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "TclIeGqN", "emailAddress": "5CynZtCM", "newPassword": "wknIy2pI"}' \
    > test.out 2>&1
eval_tap $? 272 'ResetPasswordV3' test.out

#- 273 PublicGetUserByUserIdV3
eval_tap 0 273 'PublicGetUserByUserIdV3 # SKIP deprecated' test.out

#- 274 PublicGetUserBanHistoryV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserBanHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'HPM7Co5E' \
    --activeOnly  \
    --after 'BBMNTB1U' \
    --before 'xIGqtUh2' \
    --limit '75' \
    > test.out 2>&1
eval_tap $? 274 'PublicGetUserBanHistoryV3' test.out

#- 275 PublicListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'YfBa500o' \
    > test.out 2>&1
eval_tap $? 275 'PublicListUserAllPlatformAccountsDistinctV3' test.out

#- 276 PublicGetUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'FczNCK2y' \
    > test.out 2>&1
eval_tap $? 276 'PublicGetUserInformationV3' test.out

#- 277 PublicGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'fe8ZbFVw' \
    --after '0.6994764121079796' \
    --before '0.7245868351903982' \
    --limit '98' \
    > test.out 2>&1
eval_tap $? 277 'PublicGetUserLoginHistoriesV3' test.out

#- 278 PublicGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'geYkQAaL' \
    --after 'mDBr6Rh3' \
    --before '28pHfSWp' \
    --limit '11' \
    --platformId 'jtMWbO6t' \
    > test.out 2>&1
eval_tap $? 278 'PublicGetUserPlatformAccountsV3' test.out

#- 279 PublicListJusticePlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicListJusticePlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'CdxDOHZ4' \
    > test.out 2>&1
eval_tap $? 279 'PublicListJusticePlatformAccountsV3' test.out

#- 280 PublicLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam publicLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ydjvm2zo' \
    --body '{"platformId": "ChoBTiXR", "platformUserId": "YhRrHjXp"}' \
    > test.out 2>&1
eval_tap $? 280 'PublicLinkPlatformAccount' test.out

#- 281 PublicForceLinkPlatformWithProgression
./ng net.accelbyte.sdk.cli.Main iam publicForceLinkPlatformWithProgression \
    --namespace "$AB_NAMESPACE" \
    --userId 'uqBwvh2W' \
    --body '{"chosenNamespaces": ["PFVb7c0O", "USIqFuAx", "c2eyqX09"], "requestId": "76WlyhQH"}' \
    > test.out 2>&1
eval_tap $? 281 'PublicForceLinkPlatformWithProgression' test.out

#- 282 PublicGetPublisherUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetPublisherUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'JvBrHWUw' \
    > test.out 2>&1
eval_tap $? 282 'PublicGetPublisherUserV3' test.out

#- 283 PublicValidateUserByUserIDAndPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserByUserIDAndPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'WxkX91vf' \
    --password 'QZwjWO4h' \
    > test.out 2>&1
eval_tap $? 283 'PublicValidateUserByUserIDAndPasswordV3' test.out

#- 284 PublicGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRolesV3 \
    --after '5gDCytUN' \
    --before 'n9Jlwfxp' \
    --isWildcard  \
    --limit '4' \
    > test.out 2>&1
eval_tap $? 284 'PublicGetRolesV3' test.out

#- 285 PublicGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRoleV3 \
    --roleId 'kIc01Zmr' \
    > test.out 2>&1
eval_tap $? 285 'PublicGetRoleV3' test.out

#- 286 PublicGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyUserV3 \
    --includeAllPlatforms  \
    > test.out 2>&1
eval_tap $? 286 'PublicGetMyUserV3' test.out

#- 287 PublicGetLinkHeadlessAccountToMyAccountConflictV3
./ng net.accelbyte.sdk.cli.Main iam publicGetLinkHeadlessAccountToMyAccountConflictV3 \
    --oneTimeLinkCode 'cM8O2m4S' \
    > test.out 2>&1
eval_tap $? 287 'PublicGetLinkHeadlessAccountToMyAccountConflictV3' test.out

#- 288 LinkHeadlessAccountToMyAccountV3
./ng net.accelbyte.sdk.cli.Main iam linkHeadlessAccountToMyAccountV3 \
    --body '{"chosenNamespaces": ["69quec3F", "3xjIj17z", "X5hjYSzR"], "oneTimeLinkCode": "UR7ahOR3"}' \
    > test.out 2>&1
eval_tap $? 288 'LinkHeadlessAccountToMyAccountV3' test.out

#- 289 PublicSendVerificationLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationLinkV3 \
    --body '{"languageTag": "64NwsAsY"}' \
    > test.out 2>&1
eval_tap $? 289 'PublicSendVerificationLinkV3' test.out

#- 290 PublicVerifyUserByLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyUserByLinkV3 \
    --code 'YcXxFYkR' \
    > test.out 2>&1
eval_tap $? 290 'PublicVerifyUserByLinkV3' test.out

#- 291 PlatformAuthenticateSAMLV3Handler
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticateSAMLV3Handler \
    --platformId 'JB8cczwT' \
    --code 'xcye035x' \
    --error 'fBvZUr5t' \
    --state 'XlEHHUr5' \
    > test.out 2>&1
eval_tap $? 291 'PlatformAuthenticateSAMLV3Handler' test.out

#- 292 LoginSSOClient
./ng net.accelbyte.sdk.cli.Main iam loginSSOClient \
    --platformId 'qmUhwmXe' \
    --payload 'fEUbPYC3' \
    > test.out 2>&1
eval_tap $? 292 'LoginSSOClient' test.out

#- 293 LogoutSSOClient
./ng net.accelbyte.sdk.cli.Main iam logoutSSOClient \
    --platformId 'HGGQBxsd' \
    > test.out 2>&1
eval_tap $? 293 'LogoutSSOClient' test.out

#- 294 RequestTargetTokenResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTargetTokenResponseV3 \
    --additionalData 'pz54fm4o' \
    --code 'jwo8v3Hh' \
    > test.out 2>&1
eval_tap $? 294 'RequestTargetTokenResponseV3' test.out

#- 295 PlatformTokenRefreshV3Deprecate
eval_tap 0 295 'PlatformTokenRefreshV3Deprecate # SKIP deprecated' test.out

#- 296 AdminGetDevicesByUserV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDevicesByUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'NZlXDsZ8' \
    > test.out 2>&1
eval_tap $? 296 'AdminGetDevicesByUserV4' test.out

#- 297 AdminGetBannedDevicesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedDevicesV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceType 'uUMa434V' \
    --endDate 'MycDbRyW' \
    --limit '77' \
    --offset '9' \
    --startDate '79fZvqLD' \
    > test.out 2>&1
eval_tap $? 297 'AdminGetBannedDevicesV4' test.out

#- 298 AdminGetUserDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeviceBansV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'SLaA7q8W' \
    > test.out 2>&1
eval_tap $? 298 'AdminGetUserDeviceBansV4' test.out

#- 299 AdminBanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminBanDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"comment": "UWTjcLb7", "deviceId": "pTfNe2Up", "deviceType": "DwdeTOpi", "enabled": true, "endDate": "gClxtGjQ", "ext": {"f4eIHOoL": {}, "P6BCZXBl": {}, "ebPGaC38": {}}, "reason": "8U5GfHF9"}' \
    > test.out 2>&1
eval_tap $? 299 'AdminBanDeviceV4' test.out

#- 300 AdminGetDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBanV4 \
    --banId 'NYvcQvbl' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 300 'AdminGetDeviceBanV4' test.out

#- 301 AdminUpdateDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateDeviceBanV4 \
    --banId 'kWTvCuAw' \
    --namespace "$AB_NAMESPACE" \
    --body '{"enabled": true}' \
    > test.out 2>&1
eval_tap $? 301 'AdminUpdateDeviceBanV4' test.out

#- 302 AdminGenerateReportV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateReportV4 \
    --namespace "$AB_NAMESPACE" \
    --endDate 'pPusCzTu' \
    --startDate '52N5CIKh' \
    --deviceType 'AOQrtBbW' \
    > test.out 2>&1
eval_tap $? 302 'AdminGenerateReportV4' test.out

#- 303 AdminGetDeviceTypesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceTypesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 303 'AdminGetDeviceTypesV4' test.out

#- 304 AdminGetDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBansV4 \
    --deviceId 'm1LKruj2' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 304 'AdminGetDeviceBansV4' test.out

#- 305 AdminDecryptDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminDecryptDeviceV4 \
    --deviceId 'BteGrNZN' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 305 'AdminDecryptDeviceV4' test.out

#- 306 AdminUnbanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminUnbanDeviceV4 \
    --deviceId '4B2OA9lx' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 306 'AdminUnbanDeviceV4' test.out

#- 307 AdminGetUsersByDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUsersByDeviceV4 \
    --deviceId 'EfvgL0OU' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 307 'AdminGetUsersByDeviceV4' test.out

#- 308 AdminCreateTestUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateTestUsersV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 57}' \
    > test.out 2>&1
eval_tap $? 308 'AdminCreateTestUsersV4' test.out

#- 309 AdminBulkUpdateUserAccountTypeV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateUserAccountTypeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"testAccount": true, "userIds": ["ZOCENZTb", "e7wzqVRu", "sVKlnTQm"]}' \
    > test.out 2>&1
eval_tap $? 309 'AdminBulkUpdateUserAccountTypeV4' test.out

#- 310 AdminBulkCheckValidUserIDV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkCheckValidUserIDV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["L9h8VY12", "W46cBbe1", "V7VNhdK6"]}' \
    > test.out 2>&1
eval_tap $? 310 'AdminBulkCheckValidUserIDV4' test.out

#- 311 AdminUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'NTVmXtfN' \
    --body '{"avatarUrl": "TxfRdylE", "country": "BicCXNiD", "dateOfBirth": "tS3SxsKM", "displayName": "FQYEfA0D", "languageTag": "3t6tUCEy", "userName": "oCxxX579"}' \
    > test.out 2>&1
eval_tap $? 311 'AdminUpdateUserV4' test.out

#- 312 AdminUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ptd2WOn7' \
    --body '{"code": "w7ByoIKw", "emailAddress": "umXaBCEr"}' \
    > test.out 2>&1
eval_tap $? 312 'AdminUpdateUserEmailAddressV4' test.out

#- 313 AdminDisableUserMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableUserMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'rdUebnHg' \
    > test.out 2>&1
eval_tap $? 313 'AdminDisableUserMFAV4' test.out

#- 314 AdminListUserRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminListUserRolesV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '1ne8er4C' \
    > test.out 2>&1
eval_tap $? 314 'AdminListUserRolesV4' test.out

#- 315 AdminUpdateUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '5K39XkLW' \
    --body '{"assignedNamespaces": ["LbCIcWe2", "uhXQTJqb", "tNrRpoDf"], "roleId": "Ae2yfKXw"}' \
    > test.out 2>&1
eval_tap $? 315 'AdminUpdateUserRoleV4' test.out

#- 316 AdminAddUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'LlLAGVFD' \
    --body '{"assignedNamespaces": ["h1EYAiru", "ge3dzkbM", "FkHzMao0"], "roleId": "bQbvXTwv"}' \
    > test.out 2>&1
eval_tap $? 316 'AdminAddUserRoleV4' test.out

#- 317 AdminRemoveUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRemoveUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'lSwwOcZD' \
    --body '{"assignedNamespaces": ["oNBg2Qm2", "gDWGDpg9", "J1aMLevB"], "roleId": "NvnR1t9d"}' \
    > test.out 2>&1
eval_tap $? 317 'AdminRemoveUserRoleV4' test.out

#- 318 AdminGetRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV4 \
    --adminRole  \
    --isWildcard  \
    --limit '29' \
    --offset '25' \
    > test.out 2>&1
eval_tap $? 318 'AdminGetRolesV4' test.out

#- 319 AdminCreateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV4 \
    --body '{"adminRole": false, "deletable": false, "isWildcard": true, "roleName": "PHix2Cxd"}' \
    > test.out 2>&1
eval_tap $? 319 'AdminCreateRoleV4' test.out

#- 320 AdminGetRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV4 \
    --roleId '60a7l3z6' \
    > test.out 2>&1
eval_tap $? 320 'AdminGetRoleV4' test.out

#- 321 AdminDeleteRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV4 \
    --roleId 'nBv06fPk' \
    > test.out 2>&1
eval_tap $? 321 'AdminDeleteRoleV4' test.out

#- 322 AdminUpdateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV4 \
    --roleId 'LLi0OJsj' \
    --body '{"adminRole": false, "deletable": true, "isWildcard": true, "roleName": "GatAxpNE"}' \
    > test.out 2>&1
eval_tap $? 322 'AdminUpdateRoleV4' test.out

#- 323 AdminUpdateRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV4 \
    --roleId 'C9grOzxk' \
    --body '{"permissions": [{"action": 22, "resource": "yqstGhyp", "schedAction": 72, "schedCron": "lRQBg06D", "schedRange": ["wx8TxqUV", "pGXQf3fP", "MmSlij0S"]}, {"action": 72, "resource": "kKVnQ8K1", "schedAction": 60, "schedCron": "o1KJB278", "schedRange": ["uHrxkjzl", "mpONR3Wc", "iwd5wb87"]}, {"action": 50, "resource": "LzCQ47I8", "schedAction": 49, "schedCron": "Dfhd6g9y", "schedRange": ["zTDXVjPr", "AbFAKxxl", "bI2ly268"]}]}' \
    > test.out 2>&1
eval_tap $? 323 'AdminUpdateRolePermissionsV4' test.out

#- 324 AdminAddRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV4 \
    --roleId 'nmEm7ubw' \
    --body '{"permissions": [{"action": 85, "resource": "TyCDapiZ", "schedAction": 24, "schedCron": "AnxfYllD", "schedRange": ["bxkG4CTX", "scw6Sobq", "kW4IHGL8"]}, {"action": 89, "resource": "XIjNqyJ2", "schedAction": 67, "schedCron": "3MOynBlw", "schedRange": ["pmniAs4x", "Oz59XPVb", "Malv5OWq"]}, {"action": 97, "resource": "OLXmXENp", "schedAction": 74, "schedCron": "e5L5p5pM", "schedRange": ["hpCFJ725", "2LQtGeae", "Q0SWAK9w"]}]}' \
    > test.out 2>&1
eval_tap $? 324 'AdminAddRolePermissionsV4' test.out

#- 325 AdminDeleteRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV4 \
    --roleId 'aw7vQ2zt' \
    --body '["5FjYQ8VE", "RWKuJUFV", "mBbbV2Xg"]' \
    > test.out 2>&1
eval_tap $? 325 'AdminDeleteRolePermissionsV4' test.out

#- 326 AdminListAssignedUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminListAssignedUsersV4 \
    --roleId 'HOnjVko9' \
    --after 'eORaIyRY' \
    --before 'bo8AMOsq' \
    --limit '40' \
    > test.out 2>&1
eval_tap $? 326 'AdminListAssignedUsersV4' test.out

#- 327 AdminAssignUserToRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAssignUserToRoleV4 \
    --roleId 'f3Sflcc5' \
    --body '{"assignedNamespaces": ["ommELenj", "aeyLVAZF", "9lUDtXa1"], "namespace": "T9Qy8URW", "userId": "6tIEWjP6"}' \
    > test.out 2>&1
eval_tap $? 327 'AdminAssignUserToRoleV4' test.out

#- 328 AdminRevokeUserFromRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRevokeUserFromRoleV4 \
    --roleId 'gU5ry8mm' \
    --body '{"namespace": "aPwMwqGC", "userId": "ILr5a1FW"}' \
    > test.out 2>&1
eval_tap $? 328 'AdminRevokeUserFromRoleV4' test.out

#- 329 AdminInviteUserNewV4
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserNewV4 \
    --body '{"assignedNamespaces": ["k7aeU0WG", "SBHk1lEe", "SoV6gPhJ"], "emailAddresses": ["8GADGKGR", "JmeoBRyP", "orLiWPoV"], "isAdmin": true, "namespace": "kQCYTUO0", "roleId": "4NY7wZqk"}' \
    > test.out 2>&1
eval_tap $? 329 'AdminInviteUserNewV4' test.out

#- 330 AdminUpdateMyUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateMyUserV4 \
    --body '{"avatarUrl": "qFQU3mvW", "country": "ECuzQqke", "dateOfBirth": "OsxAgcOn", "displayName": "6T9FBx3w", "languageTag": "NZdCkhP4", "userName": "p3kgpPrt"}' \
    > test.out 2>&1
eval_tap $? 330 'AdminUpdateMyUserV4' test.out

#- 331 AdminDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyAuthenticatorV4 \
    > test.out 2>&1
eval_tap $? 331 'AdminDisableMyAuthenticatorV4' test.out

#- 332 AdminEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyAuthenticatorV4 \
    --code 'JlqBEgsr' \
    > test.out 2>&1
eval_tap $? 332 'AdminEnableMyAuthenticatorV4' test.out

#- 333 AdminGenerateMyAuthenticatorKeyV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateMyAuthenticatorKeyV4 \
    > test.out 2>&1
eval_tap $? 333 'AdminGenerateMyAuthenticatorKeyV4' test.out

#- 334 AdminGetMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 334 'AdminGetMyBackupCodesV4' test.out

#- 335 AdminGenerateMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 335 'AdminGenerateMyBackupCodesV4' test.out

#- 336 AdminDisableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 336 'AdminDisableMyBackupCodesV4' test.out

#- 337 AdminDownloadMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminDownloadMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 337 'AdminDownloadMyBackupCodesV4' test.out

#- 338 AdminEnableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 338 'AdminEnableMyBackupCodesV4' test.out

#- 339 AdminSendMyMFAEmailCodeV4
./ng net.accelbyte.sdk.cli.Main iam adminSendMyMFAEmailCodeV4 \
    > test.out 2>&1
eval_tap $? 339 'AdminSendMyMFAEmailCodeV4' test.out

#- 340 AdminDisableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyEmailV4 \
    > test.out 2>&1
eval_tap $? 340 'AdminDisableMyEmailV4' test.out

#- 341 AdminEnableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyEmailV4 \
    --code 'jpA4gVME' \
    > test.out 2>&1
eval_tap $? 341 'AdminEnableMyEmailV4' test.out

#- 342 AdminGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyEnabledFactorsV4 \
    > test.out 2>&1
eval_tap $? 342 'AdminGetMyEnabledFactorsV4' test.out

#- 343 AdminMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam adminMakeFactorMyDefaultV4 \
    --factor 'QacPYtvf' \
    > test.out 2>&1
eval_tap $? 343 'AdminMakeFactorMyDefaultV4' test.out

#- 344 AdminInviteUserV4
eval_tap 0 344 'AdminInviteUserV4 # SKIP deprecated' test.out

#- 345 PublicCreateTestUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateTestUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "Eq2uIipO", "policyId": "pPGB1Ea2", "policyVersionId": "JEOidl82"}, {"isAccepted": true, "localizedPolicyVersionId": "Qp6bLpf8", "policyId": "YYdBF41l", "policyVersionId": "vcR8N47a"}, {"isAccepted": true, "localizedPolicyVersionId": "4JpmiYlw", "policyId": "8nspopTr", "policyVersionId": "sy718hJR"}], "authType": "EMAILPASSWD", "country": "8SXkxirp", "dateOfBirth": "yGlej8N8", "displayName": "Cjdl7HTb", "emailAddress": "OBb4zZCv", "password": "Ig24oB5l", "passwordMD5Sum": "LyRuD7Wx", "username": "7b0d7yWQ", "verified": false}' \
    > test.out 2>&1
eval_tap $? 345 'PublicCreateTestUserV4' test.out

#- 346 PublicCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "eYRxQs69", "policyId": "Ab1eEauC", "policyVersionId": "WgTjnBOY"}, {"isAccepted": true, "localizedPolicyVersionId": "fyJcjMdi", "policyId": "L2DrQaB4", "policyVersionId": "fmOS6bHx"}, {"isAccepted": false, "localizedPolicyVersionId": "DriuTnAC", "policyId": "sSgDZoyM", "policyVersionId": "QbJ3rhsq"}], "authType": "EMAILPASSWD", "code": "cUQzLfON", "country": "jMzt2Rwl", "dateOfBirth": "y7vYoAMW", "displayName": "cBvPpHHH", "emailAddress": "VnpR6Oh9", "password": "9576hKHP", "passwordMD5Sum": "ZRY5tyxE", "reachMinimumAge": true, "username": "qo2LTgTJ"}' \
    > test.out 2>&1
eval_tap $? 346 'PublicCreateUserV4' test.out

#- 347 CreateUserFromInvitationV4
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV4 \
    --invitationId '3iXfbHuz' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "7JO5MyRE", "policyId": "S8EwB2sS", "policyVersionId": "QiujPtuD"}, {"isAccepted": false, "localizedPolicyVersionId": "LLAEsUiR", "policyId": "vPapDEdS", "policyVersionId": "Ll5GU8Cg"}, {"isAccepted": true, "localizedPolicyVersionId": "k1QncsRo", "policyId": "MlsJizGG", "policyVersionId": "4mvmS1mW"}], "authType": "EMAILPASSWD", "country": "sXIcRi3i", "dateOfBirth": "z68mE4AD", "displayName": "6BId2eNX", "password": "tchqGGGs", "reachMinimumAge": true, "username": "6ZpgyRCU"}' \
    > test.out 2>&1
eval_tap $? 347 'CreateUserFromInvitationV4' test.out

#- 348 PublicUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "4iliIdrs", "country": "rFbPe0nB", "dateOfBirth": "xiZY8pkP", "displayName": "NTc5Im1b", "languageTag": "E3eswCbv", "userName": "kChe3Qrx"}' \
    > test.out 2>&1
eval_tap $? 348 'PublicUpdateUserV4' test.out

#- 349 PublicUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "IDC6waLO", "emailAddress": "HxCr2ym3"}' \
    > test.out 2>&1
eval_tap $? 349 'PublicUpdateUserEmailAddressV4' test.out

#- 350 PublicUpgradeHeadlessAccountWithVerificationCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountWithVerificationCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "VWzO9dec", "country": "6oKZNAl6", "dateOfBirth": "IZu53kai", "displayName": "8F54TaZN", "emailAddress": "qz6Dmnii", "password": "oyAz87PR", "reachMinimumAge": true, "username": "2RtoobAx", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 350 'PublicUpgradeHeadlessAccountWithVerificationCodeV4' test.out

#- 351 PublicUpgradeHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "BbFmxvJV", "password": "clAE48fp", "username": "mNcqTKWg"}' \
    > test.out 2>&1
eval_tap $? 351 'PublicUpgradeHeadlessAccountV4' test.out

#- 352 PublicDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 352 'PublicDisableMyAuthenticatorV4' test.out

#- 353 PublicEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    --code '9HjjZ9KT' \
    > test.out 2>&1
eval_tap $? 353 'PublicEnableMyAuthenticatorV4' test.out

#- 354 PublicGenerateMyAuthenticatorKeyV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateMyAuthenticatorKeyV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 354 'PublicGenerateMyAuthenticatorKeyV4' test.out

#- 355 PublicGetMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGetMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 355 'PublicGetMyBackupCodesV4' test.out

#- 356 PublicGenerateMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 356 'PublicGenerateMyBackupCodesV4' test.out

#- 357 PublicDisableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 357 'PublicDisableMyBackupCodesV4' test.out

#- 358 PublicDownloadMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicDownloadMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 358 'PublicDownloadMyBackupCodesV4' test.out

#- 359 PublicEnableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 359 'PublicEnableMyBackupCodesV4' test.out

#- 360 PublicRemoveTrustedDeviceV4
./ng net.accelbyte.sdk.cli.Main iam publicRemoveTrustedDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceToken 'AnmLJ4Ut' \
    > test.out 2>&1
eval_tap $? 360 'PublicRemoveTrustedDeviceV4' test.out

#- 361 PublicSendMyMFAEmailCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicSendMyMFAEmailCodeV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 361 'PublicSendMyMFAEmailCodeV4' test.out

#- 362 PublicDisableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyEmailV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 362 'PublicDisableMyEmailV4' test.out

#- 363 PublicEnableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyEmailV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'HR1SK24a' \
    > test.out 2>&1
eval_tap $? 363 'PublicEnableMyEmailV4' test.out

#- 364 PublicGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam publicGetMyEnabledFactorsV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 364 'PublicGetMyEnabledFactorsV4' test.out

#- 365 PublicMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam publicMakeFactorMyDefaultV4 \
    --namespace "$AB_NAMESPACE" \
    --factor '68CfzRB8' \
    > test.out 2>&1
eval_tap $? 365 'PublicMakeFactorMyDefaultV4' test.out

#- 366 PublicGetUserPublicInfoByUserIdV4
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPublicInfoByUserIdV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'PQOfV3VH' \
    > test.out 2>&1
eval_tap $? 366 'PublicGetUserPublicInfoByUserIdV4' test.out

#- 367 PublicInviteUserV4
./ng net.accelbyte.sdk.cli.Main iam publicInviteUserV4 \
    --body '{"additionalData": "MweKrxJT", "emailAddress": "j8xOSOuF", "namespace": "mYUcLeX2", "namespaceDisplayName": "5MWpvkv9"}' \
    > test.out 2>&1
eval_tap $? 367 'PublicInviteUserV4' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
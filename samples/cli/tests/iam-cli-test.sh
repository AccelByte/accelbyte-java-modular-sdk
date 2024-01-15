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
    --body '[{"field": "s3YKbpv5", "validation": {"allowAllSpecialCharacters": false, "allowDigit": true, "allowLetter": true, "allowSpace": false, "allowUnicode": true, "avatarConfig": {"allowedPrefixes": ["7TIZvPSR", "0vJaEBBT", "lkY3mt6J"], "preferRegex": false, "regex": "kJljCJEY"}, "blockedWord": ["14UA74E9", "HoEKlsvj", "4q3h79GI"], "description": [{"language": "UXPXx7GP", "message": ["QRJbd4g8", "U45JDDTL", "ZibSqPHP"]}, {"language": "g4fqshWY", "message": ["QrdI9kpD", "MJz0IGQU", "Jroz1hjb"]}, {"language": "uxNmgz8V", "message": ["d7rpZCEL", "7VmkFS5u", "NsoXqGvR"]}], "isCustomRegex": false, "letterCase": "H1gXx6FV", "maxLength": 2, "maxRepeatingAlphaNum": 48, "maxRepeatingSpecialCharacter": 86, "minCharType": 67, "minLength": 59, "regex": "yTS5gqCv", "specialCharacterLocation": "L2X1dv7d", "specialCharacters": ["EiA8gVJm", "xdVlbaVi", "ErhiLudU"]}}, {"field": "Y6Jz41nb", "validation": {"allowAllSpecialCharacters": false, "allowDigit": true, "allowLetter": true, "allowSpace": true, "allowUnicode": true, "avatarConfig": {"allowedPrefixes": ["oR3uF9b6", "bkhVAlwL", "OoS7mG8B"], "preferRegex": false, "regex": "xMvQNLDJ"}, "blockedWord": ["orLtb6Po", "BP7hlvzb", "ARZ62vPY"], "description": [{"language": "amOATuak", "message": ["TAbN3fHx", "e6UWlAqm", "gm9dFxsF"]}, {"language": "niE68kJj", "message": ["whAQdcSA", "fkRHcSKg", "eTwWD4Xm"]}, {"language": "JucuVVFI", "message": ["rf15R5K0", "dZ4PTjbo", "2crMFdDa"]}], "isCustomRegex": false, "letterCase": "bifPui6f", "maxLength": 92, "maxRepeatingAlphaNum": 57, "maxRepeatingSpecialCharacter": 65, "minCharType": 66, "minLength": 9, "regex": "zs7OcvRI", "specialCharacterLocation": "tjW6CUDO", "specialCharacters": ["Okd59Wkh", "AHdW8Taa", "HpCFue3c"]}}, {"field": "cG4EbHnQ", "validation": {"allowAllSpecialCharacters": true, "allowDigit": true, "allowLetter": false, "allowSpace": true, "allowUnicode": false, "avatarConfig": {"allowedPrefixes": ["GihKlHZN", "lBUn5FJ8", "btnRqLNr"], "preferRegex": true, "regex": "yolymGmz"}, "blockedWord": ["D99qppNr", "9C3IJmAp", "b5mvrk4P"], "description": [{"language": "9HL9DU0d", "message": ["bguGpCi0", "H6Bhpj17", "6V3Y2D2p"]}, {"language": "btTUJZoi", "message": ["Q6TIBg4c", "7GeBSxGz", "aPwtejZC"]}, {"language": "VFIsqyRv", "message": ["cvryw47y", "mdIP29va", "CvLavTus"]}], "isCustomRegex": true, "letterCase": "Up2ynCwx", "maxLength": 100, "maxRepeatingAlphaNum": 98, "maxRepeatingSpecialCharacter": 72, "minCharType": 13, "minLength": 88, "regex": "GPCSLuEh", "specialCharacterLocation": "EYyUywUs", "specialCharacters": ["D6exCGhZ", "LhcwpoRu", "6mVJQmkA"]}}]' \
    > test.out 2>&1
eval_tap $? 109 'AdminUpdateInputValidations' test.out

#- 110 AdminResetInputValidations
./ng net.accelbyte.sdk.cli.Main iam adminResetInputValidations \
    --field 'MNXKcxy2' \
    > test.out 2>&1
eval_tap $? 110 'AdminResetInputValidations' test.out

#- 111 ListAdminsV3
./ng net.accelbyte.sdk.cli.Main iam listAdminsV3 \
    --namespace "$AB_NAMESPACE" \
    --after 'tTGnJqxl' \
    --before 'mZwgoTmP' \
    --limit '7' \
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
    --body '{"ageRestriction": 18, "enable": false}' \
    > test.out 2>&1
eval_tap $? 113 'AdminUpdateAgeRestrictionConfigV3' test.out

#- 114 AdminGetListCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminGetListCountryAgeRestrictionV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 114 'AdminGetListCountryAgeRestrictionV3' test.out

#- 115 AdminUpdateCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateCountryAgeRestrictionV3 \
    --countryCode 'GxxfqDkm' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ageRestriction": 27}' \
    > test.out 2>&1
eval_tap $? 115 'AdminUpdateCountryAgeRestrictionV3' test.out

#- 116 AdminGetBannedUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType 'aGODAXRI' \
    --limit '87' \
    --offset '96' \
    > test.out 2>&1
eval_tap $? 116 'AdminGetBannedUsersV3' test.out

#- 117 AdminBanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"ban": "QCpCRRj0", "comment": "ttDETd13", "endDate": "OfBrTSUy", "reason": "fwkvGwwT", "skipNotif": true, "userIds": ["YVAaqR0D", "usAR0iBC", "vQbTQNOQ"]}' \
    > test.out 2>&1
eval_tap $? 117 'AdminBanUserBulkV3' test.out

#- 118 AdminUnbanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminUnbanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"bans": [{"banId": "WOoWLjiH", "userId": "mQpXf6co"}, {"banId": "0PmfyfnS", "userId": "abX3Mkm3"}, {"banId": "yFS2c2Zc", "userId": "maPnwkjV"}]}' \
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
    --clientId 'oJPcACAL' \
    --clientName 'dj03HoAI' \
    --clientType 'erTV05tq' \
    --limit '7' \
    --offset '69' \
    > test.out 2>&1
eval_tap $? 120 'AdminGetClientsByNamespaceV3' test.out

#- 121 AdminCreateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateClientV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["0Y3BvGij", "gZUdkLPm", "8SrEnyUw"], "baseUri": "BF3b0sU8", "clientId": "mtAer3oR", "clientName": "ZVxOQBMM", "clientPermissions": [{"action": 62, "resource": "fgeKZFYF", "schedAction": 15, "schedCron": "eX00ZhTA", "schedRange": ["MaVjnk7J", "oacUNWLN", "7VjPJd9B"]}, {"action": 90, "resource": "AMku2bKM", "schedAction": 13, "schedCron": "pZ7TUwI7", "schedRange": ["VhMyJkIN", "nl7PllEJ", "OGvTVY36"]}, {"action": 51, "resource": "YralwT8j", "schedAction": 34, "schedCron": "BOp1AK3Z", "schedRange": ["VNvrRFtu", "PKHdoj9A", "aBIMoXUo"]}], "clientPlatform": "KrNI4qCP", "deletable": false, "description": "lClmjNfw", "namespace": "AWRqeEp9", "oauthAccessTokenExpiration": 48, "oauthAccessTokenExpirationTimeUnit": "OXSUnci3", "oauthClientType": "FeSyCepL", "oauthRefreshTokenExpiration": 74, "oauthRefreshTokenExpirationTimeUnit": "7lCDN13T", "parentNamespace": "gGex3hAB", "redirectUri": "L2rGhfhs", "scopes": ["gmVnUHYg", "sxemfGM8", "JISGfJHp"], "secret": "YOsAsFnN", "twoFactorEnabled": false}' \
    > test.out 2>&1
eval_tap $? 121 'AdminCreateClientV3' test.out

#- 122 AdminGetClientsbyNamespacebyIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetClientsbyNamespacebyIDV3 \
    --clientId 'A682WS51' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 122 'AdminGetClientsbyNamespacebyIDV3' test.out

#- 123 AdminDeleteClientV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientV3 \
    --clientId 'bsgPSUJf' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 123 'AdminDeleteClientV3' test.out

#- 124 AdminUpdateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientV3 \
    --clientId 'M8T9Z2Be' \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["j0khkEiK", "PvzOH2FW", "r6Xd5FLR"], "baseUri": "BrNnQoq5", "clientName": "Yv0o9iKp", "clientPermissions": [{"action": 32, "resource": "a7HSfnKm", "schedAction": 40, "schedCron": "DD79U4dQ", "schedRange": ["R4LZe8yn", "a4CITBVu", "EF9M5IdR"]}, {"action": 28, "resource": "qaFgTFTu", "schedAction": 19, "schedCron": "gba8B7NB", "schedRange": ["mbLZcYbQ", "nc8zRNMW", "oIw3MU4B"]}, {"action": 91, "resource": "NWj2BMW6", "schedAction": 10, "schedCron": "rVxNP45z", "schedRange": ["jmzV5ScJ", "Atxo4XHB", "wv5FiXdJ"]}], "clientPlatform": "tZVaBHdh", "deletable": true, "description": "rlY7JJJ0", "namespace": "LqxUI81C", "oauthAccessTokenExpiration": 18, "oauthAccessTokenExpirationTimeUnit": "PeEziW4K", "oauthRefreshTokenExpiration": 47, "oauthRefreshTokenExpirationTimeUnit": "zmCTfocl", "redirectUri": "pegPtY7z", "scopes": ["qfGmXH4Y", "Wt46mKzK", "KV90VJ13"], "twoFactorEnabled": true}' \
    > test.out 2>&1
eval_tap $? 124 'AdminUpdateClientV3' test.out

#- 125 AdminUpdateClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientPermissionV3 \
    --clientId '1Pt2Xc26' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 64, "resource": "BPKs23Ok"}, {"action": 1, "resource": "oIwHdndI"}, {"action": 88, "resource": "8bK0tk5M"}]}' \
    > test.out 2>&1
eval_tap $? 125 'AdminUpdateClientPermissionV3' test.out

#- 126 AdminAddClientPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddClientPermissionsV3 \
    --clientId '7c60ldxK' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 5, "resource": "94KGohFj"}, {"action": 32, "resource": "yNxqp9lg"}, {"action": 82, "resource": "CHcTh30G"}]}' \
    > test.out 2>&1
eval_tap $? 126 'AdminAddClientPermissionsV3' test.out

#- 127 AdminDeleteClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientPermissionV3 \
    --action '72' \
    --clientId 'aJAOZiN0' \
    --namespace "$AB_NAMESPACE" \
    --resource '5vfGMAU5' \
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
    --body '{"blacklist": ["tTLBlbr8", "Dnyw0c3Z", "Gs6nVkYT"]}' \
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
    --limit '96' \
    --offset '28' \
    > test.out 2>&1
eval_tap $? 133 'RetrieveAllSSOLoginPlatformCredentialV3' test.out

#- 134 RetrieveThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Nlf5urRx' \
    > test.out 2>&1
eval_tap $? 134 'RetrieveThirdPartyLoginPlatformCredentialV3' test.out

#- 135 AddThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam addThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'zvQzXVwy' \
    --body '{"ACSURL": "DrNUj2xH", "AWSCognitoRegion": "5jE5p4LN", "AWSCognitoUserPool": "uqbP45ze", "AllowedClients": ["kddZFJFv", "VcuCwCJo", "ffx3ZbhT"], "AppId": "HhnkJnEO", "AuthorizationEndpoint": "qXXf0Qo3", "ClientId": "fIIrflFz", "Environment": "962bgf6u", "FederationMetadataURL": "mCTeB7nW", "GenericOauthFlow": true, "IsActive": false, "Issuer": "EeoiNYWn", "JWKSEndpoint": "DibGOmlY", "KeyID": "BGX7UsX0", "NetflixCertificates": {"encryptedPrivateKey": "rAexiFSC", "encryptedPrivateKeyName": "d3Y9Sc38", "publicCertificate": "dlauVvf4", "publicCertificateName": "aUFWNVZ3", "rootCertificate": "lHqpkVhH", "rootCertificateName": "koohS32f"}, "OrganizationId": "yIcoG3T2", "PlatformName": "JiRnNhWb", "RedirectUri": "nOu674rJ", "RegisteredDomains": [{"affectedClientIDs": ["jpImjaD6", "Qy4wjPPD", "5ileehZN"], "domain": "YlAA2oZx", "namespaces": ["s1H6S0JF", "Ofw8Ovv6", "XEFdo8i5"], "roleId": "V8yeAPMN"}, {"affectedClientIDs": ["s8MDsv8p", "KGBtNNTO", "PA7frDNY"], "domain": "z9RykFeo", "namespaces": ["v7sxgmdT", "Q4aJNkN6", "xrrhV754"], "roleId": "nis1Yh2j"}, {"affectedClientIDs": ["DzcJzT9M", "QP4pBhWh", "S1czmUEh"], "domain": "zt9RS3Q3", "namespaces": ["VxxmZmkA", "Z7zJzofd", "p2UIS2B2"], "roleId": "pyTPyWVs"}], "Secret": "kVzMu8vu", "TeamID": "kJYKaNvk", "TokenAuthenticationType": "es8IwofJ", "TokenClaimsMapping": {"NEwHBQ9n": "eUIn7HGH", "iJQldNGU": "eq87Xy38", "cvyMXUhd": "nO3LjQEE"}, "TokenEndpoint": "AiNNRIHK", "UserInfoEndpoint": "AS5ek9Xu", "UserInfoHTTPMethod": "hxtoOX8W", "scopes": ["z1dfa4Jd", "lNxixwPc", "JWwOQ3SP"]}' \
    > test.out 2>&1
eval_tap $? 135 'AddThirdPartyLoginPlatformCredentialV3' test.out

#- 136 DeleteThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'ABvWqgSE' \
    > test.out 2>&1
eval_tap $? 136 'DeleteThirdPartyLoginPlatformCredentialV3' test.out

#- 137 UpdateThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'oWgqQfhT' \
    --body '{"ACSURL": "xkdgFHV8", "AWSCognitoRegion": "lECYq1Lz", "AWSCognitoUserPool": "lFY1teVn", "AllowedClients": ["tUP6YjMJ", "ZHJRThDB", "IhOUN80e"], "AppId": "dPZ4VQTx", "AuthorizationEndpoint": "aj6OKvqt", "ClientId": "eVMe9p97", "Environment": "9sI9Lr82", "FederationMetadataURL": "K0cTQJHj", "GenericOauthFlow": false, "IsActive": true, "Issuer": "O0x7k1SR", "JWKSEndpoint": "Hv1mqNSB", "KeyID": "W77E7tff", "NetflixCertificates": {"encryptedPrivateKey": "WoMiO5Ow", "encryptedPrivateKeyName": "Kv64MowW", "publicCertificate": "zFt9Sq9P", "publicCertificateName": "fbqFIPlq", "rootCertificate": "H8iFHoKs", "rootCertificateName": "nVZ0CaFd"}, "OrganizationId": "lQqluyVZ", "PlatformName": "bA6hMLsX", "RedirectUri": "058AiGWp", "RegisteredDomains": [{"affectedClientIDs": ["tve0dsVZ", "nLRTMEVv", "E7RQeLoy"], "domain": "ag9JkCK6", "namespaces": ["ynLlUo6a", "46X0Lrao", "dXN0HP2O"], "roleId": "DM16msmr"}, {"affectedClientIDs": ["xOXkZLM0", "bXPSbKP5", "23n4Zhz1"], "domain": "aiKZgqJ6", "namespaces": ["GDFaNOb8", "1A9vSTGT", "D7PBIeiv"], "roleId": "P54lyFJM"}, {"affectedClientIDs": ["10QM6OPF", "7xChK0oo", "MEQKOT9T"], "domain": "4BK9avPQ", "namespaces": ["q3DbYcyU", "fqXsx3GP", "MOSSKona"], "roleId": "GgZKHAR5"}], "Secret": "APZmCumM", "TeamID": "dz2Sesy7", "TokenAuthenticationType": "Gw6FF6dL", "TokenClaimsMapping": {"aW7Cu0OL": "rYTCPa6Y", "eitfrGZe": "7MriKGjA", "5dauisfI": "PsUHdD9N"}, "TokenEndpoint": "MCEdsWCL", "UserInfoEndpoint": "2BkM8lJg", "UserInfoHTTPMethod": "olnhdQdb", "scopes": ["HFSNSJx5", "KkqSgvsG", "4TweJvth"]}' \
    > test.out 2>&1
eval_tap $? 137 'UpdateThirdPartyLoginPlatformCredentialV3' test.out

#- 138 UpdateThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'bGAsDkOt' \
    --body '{"affectedClientIDs": ["P8fh7YLG", "8xU1Bz76", "2qoKXnr9"], "assignedNamespaces": ["RpfqMT3A", "Tk1yh63r", "xdj2JlvS"], "domain": "6IWoJjIh", "roleId": "zSuL9sdm"}' \
    > test.out 2>&1
eval_tap $? 138 'UpdateThirdPartyLoginPlatformDomainV3' test.out

#- 139 DeleteThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'tChMsOFG' \
    --body '{"domain": "wuytbajN"}' \
    > test.out 2>&1
eval_tap $? 139 'DeleteThirdPartyLoginPlatformDomainV3' test.out

#- 140 RetrieveSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam retrieveSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'JyDgLvnH' \
    > test.out 2>&1
eval_tap $? 140 'RetrieveSSOLoginPlatformCredential' test.out

#- 141 AddSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam addSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId '6LCOsM0q' \
    --body '{"acsUrl": "lEOg1R6v", "apiKey": "UPZj83Mc", "appId": "4k7U1dBE", "federationMetadataUrl": "VhHCzIwM", "isActive": false, "redirectUri": "3wLfcQsD", "secret": "mjdqANcd", "ssoUrl": "C5dZkSEV"}' \
    > test.out 2>&1
eval_tap $? 141 'AddSSOLoginPlatformCredential' test.out

#- 142 DeleteSSOLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteSSOLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'N7z3SY5R' \
    > test.out 2>&1
eval_tap $? 142 'DeleteSSOLoginPlatformCredentialV3' test.out

#- 143 UpdateSSOPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam updateSSOPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'WXLllKaS' \
    --body '{"acsUrl": "Td8FH5Y4", "apiKey": "dJviw5Fd", "appId": "5TcQyEfT", "federationMetadataUrl": "XT6nYnZM", "isActive": false, "redirectUri": "SxVnCwXO", "secret": "XkFhMX1F", "ssoUrl": "wYiWE4PZ"}' \
    > test.out 2>&1
eval_tap $? 143 'UpdateSSOPlatformCredential' test.out

#- 144 AdminListUserIDByPlatformUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByPlatformUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'uiiIsp35' \
    --rawPID  \
    --body '{"platformUserIds": ["IR7WQGPR", "ydHWFEzG", "JzqxBW3U"]}' \
    > test.out 2>&1
eval_tap $? 144 'AdminListUserIDByPlatformUserIDsV3' test.out

#- 145 AdminGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'zhPNMg6n' \
    --platformUserId 'nnn5wXZw' \
    > test.out 2>&1
eval_tap $? 145 'AdminGetUserByPlatformUserIDV3' test.out

#- 146 GetAdminUsersByRoleIdV3
./ng net.accelbyte.sdk.cli.Main iam getAdminUsersByRoleIdV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'WEJ1ErDu' \
    --after '5' \
    --before '54' \
    --limit '77' \
    > test.out 2>&1
eval_tap $? 146 'GetAdminUsersByRoleIdV3' test.out

#- 147 AdminGetUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --emailAddress '7OoEV4Oe' \
    > test.out 2>&1
eval_tap $? 147 'AdminGetUserByEmailAddressV3' test.out

#- 148 AdminGetBulkUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType '0XoVrbzI' \
    --body '{"bulkUserId": ["jO4BldsF", "QQwQv4XK", "hwa9QOZc"]}' \
    > test.out 2>&1
eval_tap $? 148 'AdminGetBulkUserBanV3' test.out

#- 149 AdminListUserIDByUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["Kpwslnyg", "zlS3OMs7", "VcKt2gUV"]}' \
    > test.out 2>&1
eval_tap $? 149 'AdminListUserIDByUserIDsV3' test.out

#- 150 AdminBulkGetUsersPlatform
./ng net.accelbyte.sdk.cli.Main iam adminBulkGetUsersPlatform \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["3KiCp7mJ", "BXcpaVPK", "FcEbpOOO"]}' \
    > test.out 2>&1
eval_tap $? 150 'AdminBulkGetUsersPlatform' test.out

#- 151 AdminInviteUserV3
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddresses": ["4xp0cgD0", "RK32jlaa", "1Ax9EWtk"], "isAdmin": true, "namespace": "P91dkhDD", "roles": ["ULciydjB", "TC1YLAck", "KkUhUz37"]}' \
    > test.out 2>&1
eval_tap $? 151 'AdminInviteUserV3' test.out

#- 152 AdminQueryThirdPlatformLinkHistoryV3
./ng net.accelbyte.sdk.cli.Main iam adminQueryThirdPlatformLinkHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '88' \
    --offset '55' \
    --platformUserId 'mfQ7r37w' \
    --platformId 'V3U5nSqf' \
    > test.out 2>&1
eval_tap $? 152 'AdminQueryThirdPlatformLinkHistoryV3' test.out

#- 153 AdminListUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminListUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '24' \
    --offset '74' \
    > test.out 2>&1
eval_tap $? 153 'AdminListUsersV3' test.out

#- 154 AdminSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam adminSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'gleh3hBf' \
    --endDate 'O9mtUR6K' \
    --includeTotal  \
    --limit '7' \
    --offset '15' \
    --platformBy 'w3jq6hKI' \
    --platformId 'mKmiMyIT' \
    --query 'LpEaexO0' \
    --startDate 'qxkKnneW' \
    --testAccount  \
    > test.out 2>&1
eval_tap $? 154 'AdminSearchUserV3' test.out

#- 155 AdminGetBulkUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"listEmailAddressRequest": ["Zwrpt7hy", "dcCOCAjg", "AcZ9YFmO"]}' \
    > test.out 2>&1
eval_tap $? 155 'AdminGetBulkUserByEmailAddressV3' test.out

#- 156 AdminGetUserByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'sAxZHoeA' \
    > test.out 2>&1
eval_tap $? 156 'AdminGetUserByUserIdV3' test.out

#- 157 AdminUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '9kb1hvEl' \
    --body '{"avatarUrl": "yiQclYOM", "country": "bP9ZxUGb", "dateOfBirth": "NJzUF60M", "displayName": "QjZGysxJ", "languageTag": "OmS8snPd", "userName": "73boaaxr"}' \
    > test.out 2>&1
eval_tap $? 157 'AdminUpdateUserV3' test.out

#- 158 AdminGetUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'EOzVvdfv' \
    --activeOnly  \
    --after 'S1J7297e' \
    --before '6QeTX7CY' \
    --limit '84' \
    > test.out 2>&1
eval_tap $? 158 'AdminGetUserBanV3' test.out

#- 159 AdminBanUserV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'SdGaYT1r' \
    --body '{"ban": "AG0TP2DK", "comment": "TRs2Mpvm", "endDate": "kynp9M6h", "reason": "QPy4Mckg", "skipNotif": true}' \
    > test.out 2>&1
eval_tap $? 159 'AdminBanUserV3' test.out

#- 160 AdminUpdateUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserBanV3 \
    --banId 'RClkZH3u' \
    --namespace "$AB_NAMESPACE" \
    --userId 'v50P5VUC' \
    --body '{"enabled": false, "skipNotif": true}' \
    > test.out 2>&1
eval_tap $? 160 'AdminUpdateUserBanV3' test.out

#- 161 AdminSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'WlrGmhaf' \
    --body '{"context": "dRqvrbqP", "emailAddress": "7HTxr56U", "languageTag": "d4qPGc8d"}' \
    > test.out 2>&1
eval_tap $? 161 'AdminSendVerificationCodeV3' test.out

#- 162 AdminVerifyAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '3wmDiVZF' \
    --body '{"Code": "Jgy0pisT", "ContactType": "xVQhycbt", "LanguageTag": "bfBRdvcl", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 162 'AdminVerifyAccountV3' test.out

#- 163 GetUserVerificationCode
./ng net.accelbyte.sdk.cli.Main iam getUserVerificationCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'JiAqz10z' \
    > test.out 2>&1
eval_tap $? 163 'GetUserVerificationCode' test.out

#- 164 AdminGetUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '2Ps3hLXZ' \
    > test.out 2>&1
eval_tap $? 164 'AdminGetUserDeletionStatusV3' test.out

#- 165 AdminUpdateUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '6vsPOzdK' \
    --body '{"deletionDate": 3, "enabled": true}' \
    > test.out 2>&1
eval_tap $? 165 'AdminUpdateUserDeletionStatusV3' test.out

#- 166 AdminUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'H5zzSOg3' \
    --body '{"code": "0NZuOGWA", "country": "Njwx2qnx", "dateOfBirth": "FPggIIW6", "displayName": "Xk8RQQoE", "emailAddress": "SKmKuVNB", "password": "vqWiBa2p", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 166 'AdminUpgradeHeadlessAccountV3' test.out

#- 167 AdminDeleteUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'jWnUBSIU' \
    > test.out 2>&1
eval_tap $? 167 'AdminDeleteUserInformationV3' test.out

#- 168 AdminGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '9cnjR0HY' \
    --after '0.0992160530995212' \
    --before '0.15734229759778917' \
    --limit '76' \
    > test.out 2>&1
eval_tap $? 168 'AdminGetUserLoginHistoriesV3' test.out

#- 169 AdminResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam adminResetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Exrgu3S2' \
    --body '{"languageTag": "dK7duQPl", "newPassword": "fcH4NDta", "oldPassword": "Ljs8LBEC"}' \
    > test.out 2>&1
eval_tap $? 169 'AdminResetPasswordV3' test.out

#- 170 AdminUpdateUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserPermissionV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '4Y4CuGUu' \
    --body '{"Permissions": [{"Action": 86, "Resource": "LvnCH05r", "SchedAction": 66, "SchedCron": "O4mkPYBi", "SchedRange": ["Ac7JPqC7", "QctMTyYG", "LofLeHi6"]}, {"Action": 48, "Resource": "dWTJivgY", "SchedAction": 84, "SchedCron": "hWsgs4zr", "SchedRange": ["9hv6qdVA", "ZqSj98eR", "aGsAzGqa"]}, {"Action": 100, "Resource": "5ljvYfZF", "SchedAction": 79, "SchedCron": "kcNWEtnN", "SchedRange": ["EgBrBPLy", "FIJukLHt", "fwrObRfv"]}]}' \
    > test.out 2>&1
eval_tap $? 170 'AdminUpdateUserPermissionV3' test.out

#- 171 AdminAddUserPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserPermissionsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'vs8AISCn' \
    --body '{"Permissions": [{"Action": 51, "Resource": "F8d3AFUY", "SchedAction": 97, "SchedCron": "BZ7zZv74", "SchedRange": ["NT7jCZnH", "J0zfR1l0", "nSjlOpGu"]}, {"Action": 26, "Resource": "Rav5RYjp", "SchedAction": 0, "SchedCron": "qLiuHVlK", "SchedRange": ["IDnTmwfp", "VdGh8N9j", "aNmjrfsk"]}, {"Action": 78, "Resource": "WHGRBhTZ", "SchedAction": 69, "SchedCron": "K6v4Bo0O", "SchedRange": ["NYOjHuH0", "tyqwPhVF", "fVmSxq77"]}]}' \
    > test.out 2>&1
eval_tap $? 171 'AdminAddUserPermissionsV3' test.out

#- 172 AdminDeleteUserPermissionBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'BRVCZydk' \
    --body '[{"Action": 6, "Resource": "L508LtCl"}, {"Action": 65, "Resource": "gnr5lTHA"}, {"Action": 20, "Resource": "EU9QIZS2"}]' \
    > test.out 2>&1
eval_tap $? 172 'AdminDeleteUserPermissionBulkV3' test.out

#- 173 AdminDeleteUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionV3 \
    --action '59' \
    --namespace "$AB_NAMESPACE" \
    --resource 'x2Umk6o6' \
    --userId 'M2p76ITS' \
    > test.out 2>&1
eval_tap $? 173 'AdminDeleteUserPermissionV3' test.out

#- 174 AdminGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'U3ZB5ipT' \
    --after 'l33vCOfc' \
    --before 'VyNf0oRo' \
    --limit '78' \
    --platformId 'ABOjrwOq' \
    > test.out 2>&1
eval_tap $? 174 'AdminGetUserPlatformAccountsV3' test.out

#- 175 AdminGetListJusticePlatformAccounts
./ng net.accelbyte.sdk.cli.Main iam adminGetListJusticePlatformAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'razHMYMl' \
    > test.out 2>&1
eval_tap $? 175 'AdminGetListJusticePlatformAccounts' test.out

#- 176 AdminGetUserMapping
./ng net.accelbyte.sdk.cli.Main iam adminGetUserMapping \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'HXZKSkwZ' \
    --userId 'iAOvISWS' \
    > test.out 2>&1
eval_tap $? 176 'AdminGetUserMapping' test.out

#- 177 AdminCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam adminCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'gtpo2DYD' \
    --userId 't0hHJ8p1' \
    > test.out 2>&1
eval_tap $? 177 'AdminCreateJusticeUser' test.out

#- 178 AdminLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'M0RhStdR' \
    --skipConflict  \
    --body '{"platformId": "1o7xuLDc", "platformUserId": "hW5mA5Iq"}' \
    > test.out 2>&1
eval_tap $? 178 'AdminLinkPlatformAccount' test.out

#- 179 AdminPlatformUnlinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformUnlinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'vUGWf6ZB' \
    --userId 'IuAs2lhL' \
    --body '{"platformNamespace": "152JW5gs"}' \
    > test.out 2>&1
eval_tap $? 179 'AdminPlatformUnlinkV3' test.out

#- 180 AdminPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'J6dVHD6l' \
    --userId 'LvHwA9CU' \
    --ticket 'zEOzKdek' \
    > test.out 2>&1
eval_tap $? 180 'AdminPlatformLinkV3' test.out

#- 181 AdminDeleteUserLinkingHistoryByPlatformIDV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserLinkingHistoryByPlatformIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'fa0r9vpb' \
    --userId '02TPB8MN' \
    > test.out 2>&1
eval_tap $? 181 'AdminDeleteUserLinkingHistoryByPlatformIDV3' test.out

#- 182 AdminGetThirdPartyPlatformTokenLinkStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetThirdPartyPlatformTokenLinkStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'UGu23to5' \
    --userId 'd2ImkbyH' \
    --platformToken 'tYAsyg0d' \
    > test.out 2>&1
eval_tap $? 182 'AdminGetThirdPartyPlatformTokenLinkStatusV3' test.out

#- 183 AdminGetUserSinglePlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminGetUserSinglePlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --platformId 'yGB61Fe5' \
    --userId 'EXY1c8xt' \
    > test.out 2>&1
eval_tap $? 183 'AdminGetUserSinglePlatformAccount' test.out

#- 184 AdminDeleteUserRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRolesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'oO11s7ki' \
    --body '["C0y0M7fi", "BH7EW9ny", "gsHWUUCA"]' \
    > test.out 2>&1
eval_tap $? 184 'AdminDeleteUserRolesV3' test.out

#- 185 AdminSaveUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminSaveUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'eLEhme3T' \
    --body '[{"namespace": "RgwnikgE", "roleId": "laCjodLe"}, {"namespace": "3YbG4eYR", "roleId": "lPKO18vG"}, {"namespace": "CIlRytug", "roleId": "9q1qbqBa"}]' \
    > test.out 2>&1
eval_tap $? 185 'AdminSaveUserRoleV3' test.out

#- 186 AdminAddUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId '90UsN6ks' \
    --userId 'wp2vJWli' \
    > test.out 2>&1
eval_tap $? 186 'AdminAddUserRoleV3' test.out

#- 187 AdminDeleteUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'dyea3B1i' \
    --userId '9ooGSlrX' \
    > test.out 2>&1
eval_tap $? 187 'AdminDeleteUserRoleV3' test.out

#- 188 AdminUpdateUserStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'oFq92gIp' \
    --body '{"enabled": false, "reason": "GqICfBBF"}' \
    > test.out 2>&1
eval_tap $? 188 'AdminUpdateUserStatusV3' test.out

#- 189 AdminTrustlyUpdateUserIdentity
./ng net.accelbyte.sdk.cli.Main iam adminTrustlyUpdateUserIdentity \
    --namespace "$AB_NAMESPACE" \
    --userId 'glrY26wQ' \
    --body '{"emailAddress": "4TlTNsuw", "password": "VJhGvKJm"}' \
    > test.out 2>&1
eval_tap $? 189 'AdminTrustlyUpdateUserIdentity' test.out

#- 190 AdminVerifyUserWithoutVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyUserWithoutVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'bWvwZNBB' \
    > test.out 2>&1
eval_tap $? 190 'AdminVerifyUserWithoutVerificationCodeV3' test.out

#- 191 AdminUpdateClientSecretV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientSecretV3 \
    --clientId 'eAowiafB' \
    --namespace "$AB_NAMESPACE" \
    --body '{"newSecret": "O0Y7GJpf"}' \
    > test.out 2>&1
eval_tap $? 191 'AdminUpdateClientSecretV3' test.out

#- 192 AdminGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV3 \
    --after '6sNcKCtx' \
    --before 'sFB2rima' \
    --isWildcard  \
    --limit '84' \
    > test.out 2>&1
eval_tap $? 192 'AdminGetRolesV3' test.out

#- 193 AdminCreateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV3 \
    --body '{"adminRole": true, "deletable": false, "isWildcard": false, "managers": [{"displayName": "hntdd7EC", "namespace": "ALQtJYvt", "userId": "3rLFIvpK"}, {"displayName": "SqTelSVi", "namespace": "UXiotFwN", "userId": "d54dvTgK"}, {"displayName": "dPqwvEQJ", "namespace": "MczK2V1i", "userId": "XpdDoaTQ"}], "members": [{"displayName": "PMnR2opN", "namespace": "kCtChHiz", "userId": "CiiZF62O"}, {"displayName": "61qWGweR", "namespace": "1SV6dpGA", "userId": "gL6s6wdn"}, {"displayName": "fb7vcex3", "namespace": "GONEb3VO", "userId": "FSfqfs6s"}], "permissions": [{"action": 89, "resource": "xisZgoLv", "schedAction": 23, "schedCron": "9rJCLsdn", "schedRange": ["VnCc43Sj", "BBj097xU", "TBRF1vh6"]}, {"action": 53, "resource": "AzcoVUQF", "schedAction": 16, "schedCron": "l6xaxMOI", "schedRange": ["lO616jHD", "AvtWRCcP", "ztqYuxdc"]}, {"action": 47, "resource": "FixIBu4Y", "schedAction": 73, "schedCron": "1UANyuFh", "schedRange": ["35B6aU87", "ia2UZ9Jl", "ZpUaYOQS"]}], "roleName": "Ko2H1ENs"}' \
    > test.out 2>&1
eval_tap $? 193 'AdminCreateRoleV3' test.out

#- 194 AdminGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV3 \
    --roleId 'WGmc5WcU' \
    > test.out 2>&1
eval_tap $? 194 'AdminGetRoleV3' test.out

#- 195 AdminDeleteRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV3 \
    --roleId 'jsXUNd5r' \
    > test.out 2>&1
eval_tap $? 195 'AdminDeleteRoleV3' test.out

#- 196 AdminUpdateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV3 \
    --roleId 'ISvyjqNB' \
    --body '{"deletable": true, "isWildcard": true, "roleName": "Z8NBx612"}' \
    > test.out 2>&1
eval_tap $? 196 'AdminUpdateRoleV3' test.out

#- 197 AdminGetRoleAdminStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleAdminStatusV3 \
    --roleId 'sNzD11WN' \
    > test.out 2>&1
eval_tap $? 197 'AdminGetRoleAdminStatusV3' test.out

#- 198 AdminUpdateAdminRoleStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateAdminRoleStatusV3 \
    --roleId 'HvnctHxp' \
    > test.out 2>&1
eval_tap $? 198 'AdminUpdateAdminRoleStatusV3' test.out

#- 199 AdminRemoveRoleAdminV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleAdminV3 \
    --roleId 'nxc2Vwjx' \
    > test.out 2>&1
eval_tap $? 199 'AdminRemoveRoleAdminV3' test.out

#- 200 AdminGetRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleManagersV3 \
    --roleId 'R6PyXCF3' \
    --after 'sKFpZm9b' \
    --before 'nhRCsbdr' \
    --limit '50' \
    > test.out 2>&1
eval_tap $? 200 'AdminGetRoleManagersV3' test.out

#- 201 AdminAddRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleManagersV3 \
    --roleId 'UdqCdgJV' \
    --body '{"managers": [{"displayName": "LhAXANbV", "namespace": "M7HrW8f2", "userId": "tw5WWl6M"}, {"displayName": "nIY7oflA", "namespace": "QIJhtSdW", "userId": "mUUJ792X"}, {"displayName": "VaIQd3o6", "namespace": "FkKtpat2", "userId": "JTuVid3K"}]}' \
    > test.out 2>&1
eval_tap $? 201 'AdminAddRoleManagersV3' test.out

#- 202 AdminRemoveRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleManagersV3 \
    --roleId '8H3t75dW' \
    --body '{"managers": [{"displayName": "uraokULs", "namespace": "WrlgZ34T", "userId": "DY0fQCAR"}, {"displayName": "oYyoCvKy", "namespace": "uOH79Owk", "userId": "3h0Djhao"}, {"displayName": "LW712yo4", "namespace": "dc7HMnoe", "userId": "oD0BfnDd"}]}' \
    > test.out 2>&1
eval_tap $? 202 'AdminRemoveRoleManagersV3' test.out

#- 203 AdminGetRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleMembersV3 \
    --roleId 'kMHIgxye' \
    --after 'gSkxApcc' \
    --before 'C0QBhhlN' \
    --limit '82' \
    > test.out 2>&1
eval_tap $? 203 'AdminGetRoleMembersV3' test.out

#- 204 AdminAddRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleMembersV3 \
    --roleId 'Fqq0BsGH' \
    --body '{"members": [{"displayName": "p8L4Ib9D", "namespace": "j6FpCLoe", "userId": "qoXqquJj"}, {"displayName": "OyvfkQt5", "namespace": "6FUy88VL", "userId": "MzYBAvp4"}, {"displayName": "UciRtSzU", "namespace": "hYeNIdb0", "userId": "tfe5Bk6j"}]}' \
    > test.out 2>&1
eval_tap $? 204 'AdminAddRoleMembersV3' test.out

#- 205 AdminRemoveRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleMembersV3 \
    --roleId '0jh4BYlk' \
    --body '{"members": [{"displayName": "rN1VAtvC", "namespace": "yg9igiZv", "userId": "Bct4PIj0"}, {"displayName": "OAfFcB8c", "namespace": "DbwneNWU", "userId": "ucSzoUGO"}, {"displayName": "sADHBiOV", "namespace": "NOM7wmXe", "userId": "DDrhdQrV"}]}' \
    > test.out 2>&1
eval_tap $? 205 'AdminRemoveRoleMembersV3' test.out

#- 206 AdminUpdateRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV3 \
    --roleId 'Tv6aQT1T' \
    --body '{"permissions": [{"action": 92, "resource": "wB4d0Hty", "schedAction": 73, "schedCron": "X75srNSY", "schedRange": ["kYBn0rbI", "2MM0BkHO", "2pNPPLXR"]}, {"action": 20, "resource": "qAMwGEPg", "schedAction": 57, "schedCron": "Yp6pMhPV", "schedRange": ["9dXb8VhZ", "usJ3R9De", "5QYe0kVy"]}, {"action": 8, "resource": "P8Fnj04P", "schedAction": 59, "schedCron": "0m7Gk5kk", "schedRange": ["lhtvg01x", "A4MuZhiZ", "W0UyjakD"]}]}' \
    > test.out 2>&1
eval_tap $? 206 'AdminUpdateRolePermissionsV3' test.out

#- 207 AdminAddRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV3 \
    --roleId '7IdptCP8' \
    --body '{"permissions": [{"action": 96, "resource": "8PcWbWgZ", "schedAction": 19, "schedCron": "eMh9spaj", "schedRange": ["itL32bV0", "cn6WYgrN", "qC3BcyvN"]}, {"action": 11, "resource": "nXvp2bEq", "schedAction": 59, "schedCron": "hl0ShcKQ", "schedRange": ["uudyE5Ew", "4bNFYnkI", "6QKiUmmL"]}, {"action": 25, "resource": "PZsfz0Dw", "schedAction": 7, "schedCron": "NiICuPPk", "schedRange": ["Pl01z0k1", "0bbRX2FZ", "IVupKFCO"]}]}' \
    > test.out 2>&1
eval_tap $? 207 'AdminAddRolePermissionsV3' test.out

#- 208 AdminDeleteRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV3 \
    --roleId 'tkGWlyY2' \
    --body '["LW1fXEvR", "B4SEXlpW", "r89bPQGe"]' \
    > test.out 2>&1
eval_tap $? 208 'AdminDeleteRolePermissionsV3' test.out

#- 209 AdminDeleteRolePermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionV3 \
    --action '77' \
    --resource 'ArU7dWal' \
    --roleId 'ZWVHBZU2' \
    > test.out 2>&1
eval_tap $? 209 'AdminDeleteRolePermissionV3' test.out

#- 210 AdminGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam adminGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 210 'AdminGetMyUserV3' test.out

#- 211 UserAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam userAuthenticationV3 \
    --clientId 'EXRPQwK4' \
    --extendExp  \
    --redirectUri '36khcgLk' \
    --password 'y00LLaM1' \
    --requestId 'mEiqELw9' \
    --userName '8PpCjUiz' \
    > test.out 2>&1
eval_tap $? 211 'UserAuthenticationV3' test.out

#- 212 AuthenticationWithPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV3 \
    --extendExp  \
    --clientId 'yQkRWapS' \
    --linkingToken '7jPwyoHW' \
    --password 'DK3PEmmL' \
    --username 'QdzLS4rg' \
    > test.out 2>&1
eval_tap $? 212 'AuthenticationWithPlatformLinkV3' test.out

#- 213 GenerateTokenByNewHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV3 \
    --additionalData 'pTDjxXEB' \
    --extendExp  \
    --linkingToken 'nRn6aVLc' \
    > test.out 2>&1
eval_tap $? 213 'GenerateTokenByNewHeadlessAccountV3' test.out

#- 214 RequestOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam requestOneTimeLinkingCodeV3 \
    --platformId 'FWOeH9Ki' \
    > test.out 2>&1
eval_tap $? 214 'RequestOneTimeLinkingCodeV3' test.out

#- 215 ValidateOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam validateOneTimeLinkingCodeV3 \
    --oneTimeLinkCode 'wwAizkw4' \
    > test.out 2>&1
eval_tap $? 215 'ValidateOneTimeLinkingCodeV3' test.out

#- 216 RequestTokenByOneTimeLinkCodeResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTokenByOneTimeLinkCodeResponseV3 \
    --additionalData 'VnlWtDXY' \
    --isTransient  \
    --clientId 'SyoPdgyW' \
    --oneTimeLinkCode 'v4Jwx5zS' \
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
    --clientId 'whav1IwB' \
    > test.out 2>&1
eval_tap $? 219 'RequestTokenExchangeCodeV3' test.out

#- 220 AdminRetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam adminRetrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'n9w8zzcu' \
    --userId 'nZEPYroM' \
    > test.out 2>&1
eval_tap $? 220 'AdminRetrieveUserThirdPartyPlatformTokenV3' test.out

#- 221 RevokeUserV3
./ng net.accelbyte.sdk.cli.Main iam revokeUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '3XRy1RGs' \
    --includeGameNamespace  \
    > test.out 2>&1
eval_tap $? 221 'RevokeUserV3' test.out

#- 222 AuthorizeV3
./ng net.accelbyte.sdk.cli.Main iam authorizeV3 \
    --codeChallenge 'ry6aITcR' \
    --codeChallengeMethod 'S256' \
    --createHeadless  \
    --oneTimeLinkCode 'qxtjB56v' \
    --redirectUri 'VemcqhNb' \
    --scope 'OWPcyWc9' \
    --state 'YQKTD0WS' \
    --targetAuthPage 'LOWdIboC' \
    --useRedirectUriAsLoginUrlWhenLocked  \
    --clientId 'ssp3t4y3' \
    --responseType 'code' \
    > test.out 2>&1
eval_tap $? 222 'AuthorizeV3' test.out

#- 223 TokenIntrospectionV3
./ng net.accelbyte.sdk.cli.Main iam tokenIntrospectionV3 \
    --token 'vl3FinLE' \
    > test.out 2>&1
eval_tap $? 223 'TokenIntrospectionV3' test.out

#- 224 GetJWKSV3
./ng net.accelbyte.sdk.cli.Main iam getJWKSV3 \
    > test.out 2>&1
eval_tap $? 224 'GetJWKSV3' test.out

#- 225 SendMFAAuthenticationCode
./ng net.accelbyte.sdk.cli.Main iam sendMFAAuthenticationCode \
    --clientId 'BR5bi3X0' \
    --factor '95g02OdG' \
    --mfaToken 'vLqo6DVE' \
    > test.out 2>&1
eval_tap $? 225 'SendMFAAuthenticationCode' test.out

#- 226 Change2faMethod
./ng net.accelbyte.sdk.cli.Main iam change2faMethod \
    --factor 'tazRWIqr' \
    --mfaToken 'PcnB03ux' \
    > test.out 2>&1
eval_tap $? 226 'Change2faMethod' test.out

#- 227 Verify2faCode
./ng net.accelbyte.sdk.cli.Main iam verify2faCode \
    --code 'OU4wSCpT' \
    --factor 'fDWe18Al' \
    --mfaToken 'F8suug4k' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 227 'Verify2faCode' test.out

#- 228 RetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam retrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'p646q8UK' \
    --userId 'paxLA5Ue' \
    > test.out 2>&1
eval_tap $? 228 'RetrieveUserThirdPartyPlatformTokenV3' test.out

#- 229 AuthCodeRequestV3
./ng net.accelbyte.sdk.cli.Main iam authCodeRequestV3 \
    --platformId 'aTa3cI3d' \
    --clientId 'PkmYclFf' \
    --redirectUri '4NOuxhYo' \
    --requestId 'XWBcg6wq' \
    > test.out 2>&1
eval_tap $? 229 'AuthCodeRequestV3' test.out

#- 230 PlatformTokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV3 \
    --platformId 'jH01mtSc' \
    --additionalData 'c6mIAYjG' \
    --clientId '8vCYVYvl' \
    --createHeadless  \
    --deviceId 'EXjWTWSU' \
    --macAddress 'AwGJxxjC' \
    --platformToken '2bNFF2uS' \
    --skipSetCookie  \
    > test.out 2>&1
eval_tap $? 230 'PlatformTokenGrantV3' test.out

#- 231 GetRevocationListV3
./ng net.accelbyte.sdk.cli.Main iam getRevocationListV3 \
    > test.out 2>&1
eval_tap $? 231 'GetRevocationListV3' test.out

#- 232 TokenRevocationV3
./ng net.accelbyte.sdk.cli.Main iam tokenRevocationV3 \
    --token 'T1Zhi5u8' \
    > test.out 2>&1
eval_tap $? 232 'TokenRevocationV3' test.out

#- 233 SimultaneousLoginV3
./ng net.accelbyte.sdk.cli.Main iam simultaneousLoginV3 \
    --simultaneousPlatform 'pspc' \
    --simultaneousTicket '3Jawt11S' \
    --nativePlatform 'epicgames' \
    --nativePlatformTicket 'LFbZr3fY' \
    > test.out 2>&1
eval_tap $? 233 'SimultaneousLoginV3' test.out

#- 234 TokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV3 \
    --additionalData 'gzLhcuWg' \
    --clientId 'dC0ugeTG' \
    --code 'H4knRNeo' \
    --codeVerifier 'LjF6KH7h' \
    --extendNamespace 'fjzenxnq' \
    --extendExp  \
    --password 'sFTfvGVB' \
    --redirectUri 'x5ez8CKS' \
    --refreshToken 'DwRDJDn6' \
    --username 'kAOEvTVc' \
    --grantType 'client_credentials' \
    > test.out 2>&1
eval_tap $? 234 'TokenGrantV3' test.out

#- 235 VerifyTokenV3
./ng net.accelbyte.sdk.cli.Main iam verifyTokenV3 \
    --token 'NaAdxiOf' \
    > test.out 2>&1
eval_tap $? 235 'VerifyTokenV3' test.out

#- 236 PlatformAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticationV3 \
    --platformId 'fozzdpdy' \
    --code '9WBysBW2' \
    --error 'kHhJKeSN' \
    --openidAssocHandle 'IwNBSeAE' \
    --openidClaimedId '3Yoc2w08' \
    --openidIdentity 'jLHmAteC' \
    --openidMode 'CqzVb8N3' \
    --openidNs 'yOKkfXbw' \
    --openidOpEndpoint 'LVv8lFgF' \
    --openidResponseNonce 'MwkCBkzY' \
    --openidReturnTo 'AO5yVY9j' \
    --openidSig 'wwMTwudT' \
    --openidSigned 'o6fZU2PD' \
    --state 'H4GDOHg5' \
    > test.out 2>&1
eval_tap $? 236 'PlatformAuthenticationV3' test.out

#- 237 PlatformTokenRefreshV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenRefreshV3 \
    --platformId '2t8FN509' \
    --platformToken 'fKtOimNl' \
    > test.out 2>&1
eval_tap $? 237 'PlatformTokenRefreshV3' test.out

#- 238 PublicGetInputValidations
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidations \
    --defaultOnEmpty  \
    --languageCode 'yH1hyizQ' \
    > test.out 2>&1
eval_tap $? 238 'PublicGetInputValidations' test.out

#- 239 PublicGetInputValidationByField
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidationByField \
    --field 'p0OrmSbK' \
    > test.out 2>&1
eval_tap $? 239 'PublicGetInputValidationByField' test.out

#- 240 PublicGetCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam publicGetCountryAgeRestrictionV3 \
    --countryCode 'mXu6WSg1' \
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
    --clientId 'oTgwkR4H' \
    > test.out 2>&1
eval_tap $? 243 'RetrieveActiveOIDCClientsPublicV3' test.out

#- 244 PublicListUserIDByPlatformUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserIDByPlatformUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'j8eaUVd7' \
    --rawPID  \
    --body '{"platformUserIds": ["WO836cIz", "JaSRtsMu", "jnb5Ct1h"]}' \
    > test.out 2>&1
eval_tap $? 244 'PublicListUserIDByPlatformUserIDsV3' test.out

#- 245 PublicGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'UOTWAIMA' \
    --platformUserId 'ppR93eC1' \
    > test.out 2>&1
eval_tap $? 245 'PublicGetUserByPlatformUserIDV3' test.out

#- 246 PublicGetAsyncStatus
./ng net.accelbyte.sdk.cli.Main iam publicGetAsyncStatus \
    --namespace "$AB_NAMESPACE" \
    --requestId 'H12YnndM' \
    > test.out 2>&1
eval_tap $? 246 'PublicGetAsyncStatus' test.out

#- 247 PublicSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam publicSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'EyL4UEfZ' \
    --limit '3' \
    --offset '4' \
    --platformBy 'ZyMicMCi' \
    --platformId 'mZnHBBJ2' \
    --query '1hFwwkfD' \
    > test.out 2>&1
eval_tap $? 247 'PublicSearchUserV3' test.out

#- 248 PublicCreateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "nkIYnVJl", "acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "2kkjdL2r", "policyId": "Df01FNPe", "policyVersionId": "7oJQIm3T"}, {"isAccepted": true, "localizedPolicyVersionId": "ynwHZ1q7", "policyId": "bc0Ylosj", "policyVersionId": "MrzgNJu7"}, {"isAccepted": true, "localizedPolicyVersionId": "3aTeH0HB", "policyId": "dLAp4XK8", "policyVersionId": "OFQhanvK"}], "authType": "hJCHqG9R", "code": "U316Z87Q", "country": "TrPpM1Cu", "dateOfBirth": "09GygQnl", "displayName": "M1NAf3nS", "emailAddress": "J2h5Dtqi", "password": "csS7ur3h", "reachMinimumAge": true}' \
    > test.out 2>&1
eval_tap $? 248 'PublicCreateUserV3' test.out

#- 249 CheckUserAvailability
./ng net.accelbyte.sdk.cli.Main iam checkUserAvailability \
    --namespace "$AB_NAMESPACE" \
    --field 'iX9MPbkO' \
    --query 'KoylDYpC' \
    > test.out 2>&1
eval_tap $? 249 'CheckUserAvailability' test.out

#- 250 PublicBulkGetUsers
./ng net.accelbyte.sdk.cli.Main iam publicBulkGetUsers \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["qUrDQqOi", "JfFcYN7U", "dtAzGRqI"]}' \
    > test.out 2>&1
eval_tap $? 250 'PublicBulkGetUsers' test.out

#- 251 PublicSendRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicSendRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "trS3y2w7", "languageTag": "IB7jjV0F"}' \
    > test.out 2>&1
eval_tap $? 251 'PublicSendRegistrationCode' test.out

#- 252 PublicVerifyRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicVerifyRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "82ACOObP", "emailAddress": "sqqBi3rc"}' \
    > test.out 2>&1
eval_tap $? 252 'PublicVerifyRegistrationCode' test.out

#- 253 PublicForgotPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicForgotPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "DLPMVO59", "languageTag": "YXwq6EyJ"}' \
    > test.out 2>&1
eval_tap $? 253 'PublicForgotPasswordV3' test.out

#- 254 GetAdminInvitationV3
./ng net.accelbyte.sdk.cli.Main iam getAdminInvitationV3 \
    --invitationId 'oaU40gq8' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 254 'GetAdminInvitationV3' test.out

#- 255 CreateUserFromInvitationV3
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV3 \
    --invitationId 'FLXxrTud' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "AMFMWDvA", "policyId": "hmk1Z7nl", "policyVersionId": "JYGxPtWO"}, {"isAccepted": false, "localizedPolicyVersionId": "vmbSi9J5", "policyId": "usqFH2Bg", "policyVersionId": "LCRIWKyp"}, {"isAccepted": true, "localizedPolicyVersionId": "0ej2u2WC", "policyId": "9ICww1oQ", "policyVersionId": "ty2U0xt2"}], "authType": "EMAILPASSWD", "country": "hd03FNt0", "dateOfBirth": "loReViqR", "displayName": "GjSplEkx", "password": "NPdcRIy6", "reachMinimumAge": false}' \
    > test.out 2>&1
eval_tap $? 255 'CreateUserFromInvitationV3' test.out

#- 256 UpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam updateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "TFZV3iH1", "country": "Dl1DWMux", "dateOfBirth": "kMCoa01D", "displayName": "Zukpausr", "languageTag": "z5fc3uqz", "userName": "FlNuGPLC"}' \
    > test.out 2>&1
eval_tap $? 256 'UpdateUserV3' test.out

#- 257 PublicPartialUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicPartialUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "sCuYkbs4", "country": "met1gmoK", "dateOfBirth": "I4uB1kfj", "displayName": "Ejgfhr1l", "languageTag": "T44edAul", "userName": "HaLbZYjk"}' \
    > test.out 2>&1
eval_tap $? 257 'PublicPartialUpdateUserV3' test.out

#- 258 PublicSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"context": "qgCPOKJj", "emailAddress": "lXAMfdru", "languageTag": "mf32BGBd"}' \
    > test.out 2>&1
eval_tap $? 258 'PublicSendVerificationCodeV3' test.out

#- 259 PublicUserVerificationV3
./ng net.accelbyte.sdk.cli.Main iam publicUserVerificationV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "azJYX79p", "contactType": "vWB6bDka", "languageTag": "TKxl3gtQ", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 259 'PublicUserVerificationV3' test.out

#- 260 PublicUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "NAhL6rLC", "country": "kJgnRSkX", "dateOfBirth": "czecWDNK", "displayName": "fHlauWcg", "emailAddress": "9KpboMOw", "password": "qDXrm6Fw", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 260 'PublicUpgradeHeadlessAccountV3' test.out

#- 261 PublicVerifyHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --needVerificationCode  \
    --body '{"emailAddress": "FUeo8DZr", "password": "SRY3SdN0"}' \
    > test.out 2>&1
eval_tap $? 261 'PublicVerifyHeadlessAccountV3' test.out

#- 262 PublicUpdatePasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicUpdatePasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"languageTag": "OLQyn385", "newPassword": "Xq1vQgAi", "oldPassword": "QJYs0yK4"}' \
    > test.out 2>&1
eval_tap $? 262 'PublicUpdatePasswordV3' test.out

#- 263 PublicCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam publicCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'sEzwipIs' \
    > test.out 2>&1
eval_tap $? 263 'PublicCreateJusticeUser' test.out

#- 264 PublicPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'VoRVL8Eq' \
    --redirectUri 'xRtBmkf1' \
    --ticket 'VIJeCB2T' \
    > test.out 2>&1
eval_tap $? 264 'PublicPlatformLinkV3' test.out

#- 265 PublicPlatformUnlinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'fvWMUom2' \
    --body '{"platformNamespace": "wZSZ4KPy"}' \
    > test.out 2>&1
eval_tap $? 265 'PublicPlatformUnlinkV3' test.out

#- 266 PublicPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'ah5kR6Na' \
    > test.out 2>&1
eval_tap $? 266 'PublicPlatformUnlinkAllV3' test.out

#- 267 PublicForcePlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicForcePlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'LpzaQ2Il' \
    --ticket '3tjT1YUI' \
    > test.out 2>&1
eval_tap $? 267 'PublicForcePlatformLinkV3' test.out

#- 268 PublicWebLinkPlatform
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatform \
    --namespace "$AB_NAMESPACE" \
    --platformId '7pwuAsgS' \
    --clientId 'l16cS340' \
    --redirectUri 'tAB7sQg5' \
    > test.out 2>&1
eval_tap $? 268 'PublicWebLinkPlatform' test.out

#- 269 PublicWebLinkPlatformEstablish
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatformEstablish \
    --namespace "$AB_NAMESPACE" \
    --platformId 'M1IWKwBc' \
    --code 'DxEmyQo0' \
    --state 'v5VcsyhW' \
    > test.out 2>&1
eval_tap $? 269 'PublicWebLinkPlatformEstablish' test.out

#- 270 PublicProcessWebLinkPlatformV3
./ng net.accelbyte.sdk.cli.Main iam publicProcessWebLinkPlatformV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'yZRawOYf' \
    --code '0inPCbEi' \
    --state 'sZZTL5EM' \
    > test.out 2>&1
eval_tap $? 270 'PublicProcessWebLinkPlatformV3' test.out

#- 271 PublicGetUsersPlatformInfosV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUsersPlatformInfosV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"platformId": "uEGSPB7E", "userIds": ["Bn1A19rW", "1T29bDn7", "G9VywM6C"]}' \
    > test.out 2>&1
eval_tap $? 271 'PublicGetUsersPlatformInfosV3' test.out

#- 272 ResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam resetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "WoCwm6vu", "emailAddress": "oHaaUdHW", "newPassword": "qWWE5KpQ"}' \
    > test.out 2>&1
eval_tap $? 272 'ResetPasswordV3' test.out

#- 273 PublicGetUserByUserIdV3
eval_tap 0 273 'PublicGetUserByUserIdV3 # SKIP deprecated' test.out

#- 274 PublicGetUserBanHistoryV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserBanHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'qKfgMY6c' \
    --activeOnly  \
    --after 'ORx0gRR3' \
    --before 'L4pEGKUj' \
    --limit '52' \
    > test.out 2>&1
eval_tap $? 274 'PublicGetUserBanHistoryV3' test.out

#- 275 PublicListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '0dnQtOwu' \
    > test.out 2>&1
eval_tap $? 275 'PublicListUserAllPlatformAccountsDistinctV3' test.out

#- 276 PublicGetUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'rpHgYzFv' \
    > test.out 2>&1
eval_tap $? 276 'PublicGetUserInformationV3' test.out

#- 277 PublicGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'SxPkqO2a' \
    --after '0.9318302611588818' \
    --before '0.8282137450635076' \
    --limit '57' \
    > test.out 2>&1
eval_tap $? 277 'PublicGetUserLoginHistoriesV3' test.out

#- 278 PublicGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'JhqKgSQX' \
    --after 'RcFT7AYY' \
    --before 'OTIEIcM3' \
    --limit '44' \
    --platformId 'sQVxIdGU' \
    > test.out 2>&1
eval_tap $? 278 'PublicGetUserPlatformAccountsV3' test.out

#- 279 PublicListJusticePlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicListJusticePlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'A2wvVBcV' \
    > test.out 2>&1
eval_tap $? 279 'PublicListJusticePlatformAccountsV3' test.out

#- 280 PublicLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam publicLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId '90FygCjr' \
    --body '{"platformId": "sw8h2Lvw", "platformUserId": "OHEcV2Ql"}' \
    > test.out 2>&1
eval_tap $? 280 'PublicLinkPlatformAccount' test.out

#- 281 PublicForceLinkPlatformWithProgression
./ng net.accelbyte.sdk.cli.Main iam publicForceLinkPlatformWithProgression \
    --namespace "$AB_NAMESPACE" \
    --userId 'drskMerQ' \
    --body '{"chosenNamespaces": ["fG5ckzJV", "kV05l1We", "N7OHYna0"], "requestId": "uOQIy86Y"}' \
    > test.out 2>&1
eval_tap $? 281 'PublicForceLinkPlatformWithProgression' test.out

#- 282 PublicGetPublisherUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetPublisherUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '49J3Ff9u' \
    > test.out 2>&1
eval_tap $? 282 'PublicGetPublisherUserV3' test.out

#- 283 PublicValidateUserByUserIDAndPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserByUserIDAndPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'T7LE4pF4' \
    --password 'y8xU9gSz' \
    > test.out 2>&1
eval_tap $? 283 'PublicValidateUserByUserIDAndPasswordV3' test.out

#- 284 PublicGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRolesV3 \
    --after 'a3nDOUgN' \
    --before 'qO8VTuYz' \
    --isWildcard  \
    --limit '81' \
    > test.out 2>&1
eval_tap $? 284 'PublicGetRolesV3' test.out

#- 285 PublicGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRoleV3 \
    --roleId '5n5BcJ2p' \
    > test.out 2>&1
eval_tap $? 285 'PublicGetRoleV3' test.out

#- 286 PublicGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyUserV3 \
    --includeAllPlatforms  \
    > test.out 2>&1
eval_tap $? 286 'PublicGetMyUserV3' test.out

#- 287 PublicGetLinkHeadlessAccountToMyAccountConflictV3
./ng net.accelbyte.sdk.cli.Main iam publicGetLinkHeadlessAccountToMyAccountConflictV3 \
    --oneTimeLinkCode 'BiHtwdZq' \
    > test.out 2>&1
eval_tap $? 287 'PublicGetLinkHeadlessAccountToMyAccountConflictV3' test.out

#- 288 LinkHeadlessAccountToMyAccountV3
./ng net.accelbyte.sdk.cli.Main iam linkHeadlessAccountToMyAccountV3 \
    --body '{"chosenNamespaces": ["TtyNX0GB", "dBjkFEdU", "XAI0nyI3"], "oneTimeLinkCode": "ZQjYLFA7"}' \
    > test.out 2>&1
eval_tap $? 288 'LinkHeadlessAccountToMyAccountV3' test.out

#- 289 PublicSendVerificationLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationLinkV3 \
    --body '{"languageTag": "jD8vf10Z"}' \
    > test.out 2>&1
eval_tap $? 289 'PublicSendVerificationLinkV3' test.out

#- 290 PublicVerifyUserByLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyUserByLinkV3 \
    --code 'nrxtc53V' \
    > test.out 2>&1
eval_tap $? 290 'PublicVerifyUserByLinkV3' test.out

#- 291 PlatformAuthenticateSAMLV3Handler
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticateSAMLV3Handler \
    --platformId '3PVCKOTr' \
    --code 'O8kWyOdk' \
    --error 'vVcTqJyB' \
    --state 'mOyAmqLc' \
    > test.out 2>&1
eval_tap $? 291 'PlatformAuthenticateSAMLV3Handler' test.out

#- 292 LoginSSOClient
./ng net.accelbyte.sdk.cli.Main iam loginSSOClient \
    --platformId '6YLfGeSJ' \
    --payload 'n5acC18T' \
    > test.out 2>&1
eval_tap $? 292 'LoginSSOClient' test.out

#- 293 LogoutSSOClient
./ng net.accelbyte.sdk.cli.Main iam logoutSSOClient \
    --platformId 'IihOUZKa' \
    > test.out 2>&1
eval_tap $? 293 'LogoutSSOClient' test.out

#- 294 RequestTargetTokenResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTargetTokenResponseV3 \
    --additionalData 'CAxsdCJz' \
    --code 'GZ1B7G1Z' \
    > test.out 2>&1
eval_tap $? 294 'RequestTargetTokenResponseV3' test.out

#- 295 PlatformTokenRefreshV3Deprecate
eval_tap 0 295 'PlatformTokenRefreshV3Deprecate # SKIP deprecated' test.out

#- 296 AdminGetDevicesByUserV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDevicesByUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'nJDjQatr' \
    > test.out 2>&1
eval_tap $? 296 'AdminGetDevicesByUserV4' test.out

#- 297 AdminGetBannedDevicesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedDevicesV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceType 'gAg8tLxL' \
    --endDate 'NON1xOki' \
    --limit '80' \
    --offset '79' \
    --startDate '0eb0dx1C' \
    > test.out 2>&1
eval_tap $? 297 'AdminGetBannedDevicesV4' test.out

#- 298 AdminGetUserDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeviceBansV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'iqRyxKC3' \
    > test.out 2>&1
eval_tap $? 298 'AdminGetUserDeviceBansV4' test.out

#- 299 AdminBanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminBanDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"comment": "lz87XIeR", "deviceId": "xFcpQCMq", "deviceType": "9xV7dyzs", "enabled": false, "endDate": "8QWkR3Wo", "ext": {"ZXDOdbaW": {}, "SAsuXiLo": {}, "iTlUAw19": {}}, "reason": "e0ffJIYo"}' \
    > test.out 2>&1
eval_tap $? 299 'AdminBanDeviceV4' test.out

#- 300 AdminGetDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBanV4 \
    --banId 'cI7pQCyh' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 300 'AdminGetDeviceBanV4' test.out

#- 301 AdminUpdateDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateDeviceBanV4 \
    --banId '0HYhoNZT' \
    --namespace "$AB_NAMESPACE" \
    --body '{"enabled": true}' \
    > test.out 2>&1
eval_tap $? 301 'AdminUpdateDeviceBanV4' test.out

#- 302 AdminGenerateReportV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateReportV4 \
    --namespace "$AB_NAMESPACE" \
    --endDate 'rJhpaeZg' \
    --startDate 'WDuf2U9i' \
    --deviceType 'aN5KqzuB' \
    > test.out 2>&1
eval_tap $? 302 'AdminGenerateReportV4' test.out

#- 303 AdminGetDeviceTypesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceTypesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 303 'AdminGetDeviceTypesV4' test.out

#- 304 AdminGetDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBansV4 \
    --deviceId 'NZ9xZEKv' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 304 'AdminGetDeviceBansV4' test.out

#- 305 AdminDecryptDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminDecryptDeviceV4 \
    --deviceId 'TaIMTMv5' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 305 'AdminDecryptDeviceV4' test.out

#- 306 AdminUnbanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminUnbanDeviceV4 \
    --deviceId 'P24WsJ3P' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 306 'AdminUnbanDeviceV4' test.out

#- 307 AdminGetUsersByDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUsersByDeviceV4 \
    --deviceId 'ynJanNmP' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 307 'AdminGetUsersByDeviceV4' test.out

#- 308 AdminCreateTestUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateTestUsersV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 19}' \
    > test.out 2>&1
eval_tap $? 308 'AdminCreateTestUsersV4' test.out

#- 309 AdminBulkUpdateUserAccountTypeV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateUserAccountTypeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"testAccount": true, "userIds": ["bi9d6jIf", "PbhwkNUC", "9eTOmMSt"]}' \
    > test.out 2>&1
eval_tap $? 309 'AdminBulkUpdateUserAccountTypeV4' test.out

#- 310 AdminBulkCheckValidUserIDV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkCheckValidUserIDV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["u2GregdU", "k8FNvlWa", "jZm9wZah"]}' \
    > test.out 2>&1
eval_tap $? 310 'AdminBulkCheckValidUserIDV4' test.out

#- 311 AdminUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'oQLkW8Ur' \
    --body '{"avatarUrl": "KLxzAUGv", "country": "HYNu2Pqn", "dateOfBirth": "kqpTEQ07", "displayName": "T5vUxyG1", "languageTag": "XvCgCb7d", "userName": "IwDufISQ"}' \
    > test.out 2>&1
eval_tap $? 311 'AdminUpdateUserV4' test.out

#- 312 AdminUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'OoJITEMf' \
    --body '{"code": "wyC8pnSj", "emailAddress": "4U6r4XpH"}' \
    > test.out 2>&1
eval_tap $? 312 'AdminUpdateUserEmailAddressV4' test.out

#- 313 AdminDisableUserMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableUserMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'UV5ZzeB4' \
    > test.out 2>&1
eval_tap $? 313 'AdminDisableUserMFAV4' test.out

#- 314 AdminListUserRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminListUserRolesV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'I3iBBHNL' \
    > test.out 2>&1
eval_tap $? 314 'AdminListUserRolesV4' test.out

#- 315 AdminUpdateUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'BDrxxBL3' \
    --body '{"assignedNamespaces": ["T6w9Eu3j", "Gmavk6CO", "EGZMpUgh"], "roleId": "RE1jmauK"}' \
    > test.out 2>&1
eval_tap $? 315 'AdminUpdateUserRoleV4' test.out

#- 316 AdminAddUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'diohgZNT' \
    --body '{"assignedNamespaces": ["smlI8Tx9", "E4pCGGPk", "zIbXjrpr"], "roleId": "iINd2JfW"}' \
    > test.out 2>&1
eval_tap $? 316 'AdminAddUserRoleV4' test.out

#- 317 AdminRemoveUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRemoveUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ebi7cpLw' \
    --body '{"assignedNamespaces": ["sUlWsOu7", "IklerEqr", "1UxOAmOY"], "roleId": "aQJ3YVap"}' \
    > test.out 2>&1
eval_tap $? 317 'AdminRemoveUserRoleV4' test.out

#- 318 AdminGetRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV4 \
    --adminRole  \
    --isWildcard  \
    --limit '11' \
    --offset '49' \
    > test.out 2>&1
eval_tap $? 318 'AdminGetRolesV4' test.out

#- 319 AdminCreateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV4 \
    --body '{"adminRole": true, "deletable": true, "isWildcard": false, "roleName": "8o24eRXq"}' \
    > test.out 2>&1
eval_tap $? 319 'AdminCreateRoleV4' test.out

#- 320 AdminGetRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV4 \
    --roleId 'DsFNVaMp' \
    > test.out 2>&1
eval_tap $? 320 'AdminGetRoleV4' test.out

#- 321 AdminDeleteRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV4 \
    --roleId 'xcF47JSM' \
    > test.out 2>&1
eval_tap $? 321 'AdminDeleteRoleV4' test.out

#- 322 AdminUpdateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV4 \
    --roleId 'vyN3JyMD' \
    --body '{"adminRole": true, "deletable": false, "isWildcard": true, "roleName": "4nLLWLW7"}' \
    > test.out 2>&1
eval_tap $? 322 'AdminUpdateRoleV4' test.out

#- 323 AdminUpdateRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV4 \
    --roleId 'hSI5QRpR' \
    --body '{"permissions": [{"action": 18, "resource": "r0f3flt2", "schedAction": 52, "schedCron": "uBgnPS7u", "schedRange": ["4iCawq9x", "UfjYHsFK", "Epqn6xLa"]}, {"action": 59, "resource": "erK2hf7M", "schedAction": 92, "schedCron": "rioXNCop", "schedRange": ["ObZOZ8F8", "VCFh3lvL", "Xrpe4gJV"]}, {"action": 96, "resource": "aPIwXXdS", "schedAction": 36, "schedCron": "IlHADtkA", "schedRange": ["ui8cDlUc", "jNBE8B9Z", "1ucc0259"]}]}' \
    > test.out 2>&1
eval_tap $? 323 'AdminUpdateRolePermissionsV4' test.out

#- 324 AdminAddRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV4 \
    --roleId 'TsYh13hZ' \
    --body '{"permissions": [{"action": 92, "resource": "z16R9sRd", "schedAction": 2, "schedCron": "jfEgwKnD", "schedRange": ["5TD67vCg", "8QtWGvGQ", "m5WZtM8A"]}, {"action": 68, "resource": "fIAf0CSP", "schedAction": 89, "schedCron": "dF1btfne", "schedRange": ["EuFEZNVY", "LKXNPV9D", "zRibL4QS"]}, {"action": 77, "resource": "QrRZufTw", "schedAction": 88, "schedCron": "iwRtcNSe", "schedRange": ["tYtkcIrZ", "uMRZVAmJ", "dGxs0XPv"]}]}' \
    > test.out 2>&1
eval_tap $? 324 'AdminAddRolePermissionsV4' test.out

#- 325 AdminDeleteRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV4 \
    --roleId 'jkwS92iA' \
    --body '["M5Vw1q8X", "21zzfhTO", "BXiwjQjT"]' \
    > test.out 2>&1
eval_tap $? 325 'AdminDeleteRolePermissionsV4' test.out

#- 326 AdminListAssignedUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminListAssignedUsersV4 \
    --roleId 'SEPjnAre' \
    --after 'uFxCE7wv' \
    --before 'x9ks4qaT' \
    --limit '84' \
    > test.out 2>&1
eval_tap $? 326 'AdminListAssignedUsersV4' test.out

#- 327 AdminAssignUserToRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAssignUserToRoleV4 \
    --roleId 'd4vDNsA0' \
    --body '{"assignedNamespaces": ["zV59RZJJ", "ilpoMDXE", "qJeQGwyW"], "namespace": "iWrHp37L", "userId": "i1ZrP8rJ"}' \
    > test.out 2>&1
eval_tap $? 327 'AdminAssignUserToRoleV4' test.out

#- 328 AdminRevokeUserFromRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRevokeUserFromRoleV4 \
    --roleId 'NIalyG9G' \
    --body '{"namespace": "8iNXhkby", "userId": "keAG4Kmz"}' \
    > test.out 2>&1
eval_tap $? 328 'AdminRevokeUserFromRoleV4' test.out

#- 329 AdminInviteUserNewV4
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserNewV4 \
    --body '{"assignedNamespaces": ["CrIj52aW", "85mwI3nL", "i1aaBtRm"], "emailAddresses": ["E3qgZVL1", "Ml8drau5", "if1jwlUC"], "isAdmin": true, "namespace": "mkb22PU7", "roleId": "JN7MFBHy"}' \
    > test.out 2>&1
eval_tap $? 329 'AdminInviteUserNewV4' test.out

#- 330 AdminUpdateMyUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateMyUserV4 \
    --body '{"avatarUrl": "0dz3E85I", "country": "oN1GmP7M", "dateOfBirth": "oRvmxQXx", "displayName": "ceJk2Twv", "languageTag": "YboKuC8V", "userName": "RfBqEOZt"}' \
    > test.out 2>&1
eval_tap $? 330 'AdminUpdateMyUserV4' test.out

#- 331 AdminDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyAuthenticatorV4 \
    > test.out 2>&1
eval_tap $? 331 'AdminDisableMyAuthenticatorV4' test.out

#- 332 AdminEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyAuthenticatorV4 \
    --code 'Nj1Sg1nI' \
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
    --code '33yZJLvF' \
    > test.out 2>&1
eval_tap $? 341 'AdminEnableMyEmailV4' test.out

#- 342 AdminGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyEnabledFactorsV4 \
    > test.out 2>&1
eval_tap $? 342 'AdminGetMyEnabledFactorsV4' test.out

#- 343 AdminMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam adminMakeFactorMyDefaultV4 \
    --factor 'ot0VZtB6' \
    > test.out 2>&1
eval_tap $? 343 'AdminMakeFactorMyDefaultV4' test.out

#- 344 AdminInviteUserV4
eval_tap 0 344 'AdminInviteUserV4 # SKIP deprecated' test.out

#- 345 PublicCreateTestUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateTestUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "P9Rh6Sj1", "policyId": "W6Pg6ga6", "policyVersionId": "OT9W1KsG"}, {"isAccepted": false, "localizedPolicyVersionId": "DhdXhCSs", "policyId": "pCQRTLtH", "policyVersionId": "Y5jVIark"}, {"isAccepted": false, "localizedPolicyVersionId": "wixX3Zfm", "policyId": "IG6ZFjpP", "policyVersionId": "8TYLbs53"}], "authType": "EMAILPASSWD", "country": "iO1D4YTe", "dateOfBirth": "lGm4FDbR", "displayName": "luiILP25", "emailAddress": "OCgzABhx", "password": "u3aHn7ad", "passwordMD5Sum": "MOP8L7RV", "username": "fAxwNBvP", "verified": false}' \
    > test.out 2>&1
eval_tap $? 345 'PublicCreateTestUserV4' test.out

#- 346 PublicCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "hP205fLG", "policyId": "SQHIPRkX", "policyVersionId": "lmmmTtHb"}, {"isAccepted": true, "localizedPolicyVersionId": "MAEejgYy", "policyId": "3nBL1g4c", "policyVersionId": "8Z7v3djg"}, {"isAccepted": true, "localizedPolicyVersionId": "cRG9LLeo", "policyId": "K8TQB5w9", "policyVersionId": "c24cSv26"}], "authType": "EMAILPASSWD", "code": "pau5O5kB", "country": "PPnIv5R2", "dateOfBirth": "8Zu5FmIK", "displayName": "DDIViV6d", "emailAddress": "luTdGlfU", "password": "LaItupHG", "passwordMD5Sum": "wKv8mzeD", "reachMinimumAge": false, "username": "fzrLFlJn"}' \
    > test.out 2>&1
eval_tap $? 346 'PublicCreateUserV4' test.out

#- 347 CreateUserFromInvitationV4
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV4 \
    --invitationId '9rM7J6CX' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "Pd2Cidk5", "policyId": "Z3HV6vCH", "policyVersionId": "NNwByVfZ"}, {"isAccepted": false, "localizedPolicyVersionId": "f05D0nXf", "policyId": "yw1j2eIu", "policyVersionId": "9rxVKzgC"}, {"isAccepted": false, "localizedPolicyVersionId": "UxDVWhdm", "policyId": "G9EkpMH2", "policyVersionId": "3hxJ0fqf"}], "authType": "EMAILPASSWD", "country": "zvV0p0dv", "dateOfBirth": "7hd7PqB1", "displayName": "KdUUqPcU", "password": "aFEqguRW", "reachMinimumAge": true, "username": "FxrK8qZp"}' \
    > test.out 2>&1
eval_tap $? 347 'CreateUserFromInvitationV4' test.out

#- 348 PublicUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "m5nAbNAH", "country": "QGcwhmNc", "dateOfBirth": "Qgx4Kp5t", "displayName": "0h8iVoKq", "languageTag": "NF0IBmdl", "userName": "wScaAlDJ"}' \
    > test.out 2>&1
eval_tap $? 348 'PublicUpdateUserV4' test.out

#- 349 PublicUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "ixgXKxup", "emailAddress": "XLOFFQrl"}' \
    > test.out 2>&1
eval_tap $? 349 'PublicUpdateUserEmailAddressV4' test.out

#- 350 PublicUpgradeHeadlessAccountWithVerificationCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountWithVerificationCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "SNwmuhDY", "country": "vDsE5uuY", "dateOfBirth": "r6BSSgFM", "displayName": "Rew3qL2I", "emailAddress": "9aRVvhjD", "password": "viBq3FFc", "reachMinimumAge": true, "username": "6ZIwbBn5", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 350 'PublicUpgradeHeadlessAccountWithVerificationCodeV4' test.out

#- 351 PublicUpgradeHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "NNJeeB2e", "password": "4tULlS4u", "username": "2nMMlKrP"}' \
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
    --code 'mBf1k67l' \
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
    --deviceToken 'P7blzGiu' \
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
    --code 'e01ZYPD3' \
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
    --factor '711ws97u' \
    > test.out 2>&1
eval_tap $? 365 'PublicMakeFactorMyDefaultV4' test.out

#- 366 PublicGetUserPublicInfoByUserIdV4
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPublicInfoByUserIdV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'sV407Vgp' \
    > test.out 2>&1
eval_tap $? 366 'PublicGetUserPublicInfoByUserIdV4' test.out

#- 367 PublicInviteUserV4
./ng net.accelbyte.sdk.cli.Main iam publicInviteUserV4 \
    --body '{"additionalData": "b5QWR0gq", "emailAddress": "XRUZeYmg", "namespace": "DtxLwUzt", "namespaceDisplayName": "BlygWlbE"}' \
    > test.out 2>&1
eval_tap $? 367 'PublicInviteUserV4' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
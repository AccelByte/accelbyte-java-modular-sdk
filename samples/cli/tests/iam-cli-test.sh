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
echo "1..404"

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

#- 108 AdminListClientAvailablePermissions
./ng net.accelbyte.sdk.cli.Main iam adminListClientAvailablePermissions \
    --excludePermissions  \
    > test.out 2>&1
eval_tap $? 108 'AdminListClientAvailablePermissions' test.out

#- 109 AdminUpdateAvailablePermissionsByModule
./ng net.accelbyte.sdk.cli.Main iam adminUpdateAvailablePermissionsByModule \
    --forceDelete  \
    --body '{"modules": [{"docLink": "si5gZsLj", "groups": [{"group": "ESbxaZe5", "groupId": "iamvRZvf", "permissions": [{"allowedActions": [54, 77, 29], "resource": "wWCv8m0b"}, {"allowedActions": [86, 28, 61], "resource": "iIsMDfVq"}, {"allowedActions": [57, 47, 2], "resource": "qStBpg2I"}]}, {"group": "5mE7yWf0", "groupId": "qfssrSO2", "permissions": [{"allowedActions": [88, 81, 18], "resource": "q0cNwax5"}, {"allowedActions": [27, 27, 51], "resource": "vErIxzAp"}, {"allowedActions": [2, 54, 13], "resource": "z3CYYzVU"}]}, {"group": "hYflPPtK", "groupId": "zfYG7rfn", "permissions": [{"allowedActions": [62, 99, 8], "resource": "3I0qSRnI"}, {"allowedActions": [63, 5, 83], "resource": "D9h0GIlI"}, {"allowedActions": [21, 93, 70], "resource": "nHV8D2A0"}]}], "module": "tKyeQ7M0", "moduleId": "fOHIVz4c"}, {"docLink": "jpK0g2PU", "groups": [{"group": "rb4T5rcg", "groupId": "oleQ01A2", "permissions": [{"allowedActions": [98, 74, 62], "resource": "dXqCKUfC"}, {"allowedActions": [45, 95, 38], "resource": "AvRblA4f"}, {"allowedActions": [91, 53, 74], "resource": "AFqRR6ue"}]}, {"group": "SHE7HSLO", "groupId": "GXspOV1I", "permissions": [{"allowedActions": [70, 8, 7], "resource": "zjQZYkXy"}, {"allowedActions": [73, 67, 85], "resource": "rytqoS9e"}, {"allowedActions": [88, 76, 1], "resource": "lRgRJmzj"}]}, {"group": "NcamzBQ8", "groupId": "J7iYjbs1", "permissions": [{"allowedActions": [69, 95, 91], "resource": "xIpiuI5w"}, {"allowedActions": [1, 10, 42], "resource": "zEktntiY"}, {"allowedActions": [11, 96, 70], "resource": "qbnCoZB8"}]}], "module": "Xm4OTBDx", "moduleId": "5HIVZhCN"}, {"docLink": "SEcikA1B", "groups": [{"group": "9d5bVzVG", "groupId": "J6ZQT8eb", "permissions": [{"allowedActions": [22, 9, 3], "resource": "8ruYYS5N"}, {"allowedActions": [15, 36, 0], "resource": "xh4qaezB"}, {"allowedActions": [42, 13, 76], "resource": "IwzdCZzs"}]}, {"group": "ytx1swRl", "groupId": "z6h3cWi5", "permissions": [{"allowedActions": [85, 61, 28], "resource": "kHqLVg1Z"}, {"allowedActions": [70, 85, 48], "resource": "3L1jaQUB"}, {"allowedActions": [0, 44, 40], "resource": "HWvzoti3"}]}, {"group": "h3IHr2yo", "groupId": "HD9l9HFl", "permissions": [{"allowedActions": [31, 68, 64], "resource": "wm3PVSQn"}, {"allowedActions": [69, 11, 16], "resource": "sb5VmF7u"}, {"allowedActions": [47, 21, 40], "resource": "fRKtHCLn"}]}], "module": "9Uncf30b", "moduleId": "4XXyrsAa"}]}' \
    > test.out 2>&1
eval_tap $? 109 'AdminUpdateAvailablePermissionsByModule' test.out

#- 110 AdminDeleteConfigPermissionsByGroup
./ng net.accelbyte.sdk.cli.Main iam adminDeleteConfigPermissionsByGroup \
    --forceDelete  \
    --body '{"groupId": "UHZAD9HX", "moduleId": "D0NkB1Hz"}' \
    > test.out 2>&1
eval_tap $? 110 'AdminDeleteConfigPermissionsByGroup' test.out

#- 111 AdminListClientTemplates
./ng net.accelbyte.sdk.cli.Main iam adminListClientTemplates \
    > test.out 2>&1
eval_tap $? 111 'AdminListClientTemplates' test.out

#- 112 AdminGetInputValidations
./ng net.accelbyte.sdk.cli.Main iam adminGetInputValidations \
    > test.out 2>&1
eval_tap $? 112 'AdminGetInputValidations' test.out

#- 113 AdminUpdateInputValidations
./ng net.accelbyte.sdk.cli.Main iam adminUpdateInputValidations \
    --body '[{"field": "Acy2sXF2", "validation": {"allowAllSpecialCharacters": false, "allowDigit": true, "allowLetter": false, "allowSpace": true, "allowUnicode": true, "avatarConfig": {"allowedPrefixes": ["EZ7PJDkf", "kaO1Ocx2", "qAddE75n"], "preferRegex": false, "regex": "8xBqfKWp"}, "blockedWord": ["7WQMSM2H", "1RQWY1Ts", "K9DVD55s"], "description": [{"language": "GHF4AyP0", "message": ["dfNXum91", "2cDrn98n", "bnT9W0Nl"]}, {"language": "7TXV93iP", "message": ["OftIg3au", "6jkdLFFB", "P8utsKfS"]}, {"language": "woKEDNqp", "message": ["pgV2Wsg0", "3DtUtmBC", "iSaGH15b"]}], "isCustomRegex": false, "letterCase": "MonwhJOB", "maxLength": 19, "maxRepeatingAlphaNum": 32, "maxRepeatingSpecialCharacter": 69, "minCharType": 37, "minLength": 12, "profanityFilter": "QmdsVpJ0", "regex": "Amj4GieW", "specialCharacterLocation": "gV2bc1by", "specialCharacters": ["vFmv67zu", "W63Qqmxe", "DRAPJSAh"]}}, {"field": "9kQ4ImuB", "validation": {"allowAllSpecialCharacters": false, "allowDigit": true, "allowLetter": true, "allowSpace": true, "allowUnicode": true, "avatarConfig": {"allowedPrefixes": ["xf45BkSu", "gJcOZ8bo", "FALTeRYr"], "preferRegex": true, "regex": "BEJReMeN"}, "blockedWord": ["JkY7io7I", "ipIh6Mci", "oG7Oiu9F"], "description": [{"language": "omxfMAp3", "message": ["DEFBMfae", "ID71YTm8", "vUldqZ2l"]}, {"language": "SxrcQz5S", "message": ["FFIwDwxq", "GeGclK9r", "ghGVEti6"]}, {"language": "iaZqy77c", "message": ["SRb503XM", "amrhEcXL", "TxL0B2KX"]}], "isCustomRegex": false, "letterCase": "M22ihYZe", "maxLength": 47, "maxRepeatingAlphaNum": 84, "maxRepeatingSpecialCharacter": 1, "minCharType": 19, "minLength": 45, "profanityFilter": "fBflwUHd", "regex": "V0yfGlCr", "specialCharacterLocation": "gAFlqWxG", "specialCharacters": ["RbkLQG0D", "LHvBG7M4", "AZRs3YWE"]}}, {"field": "9bpXypgY", "validation": {"allowAllSpecialCharacters": false, "allowDigit": true, "allowLetter": true, "allowSpace": true, "allowUnicode": true, "avatarConfig": {"allowedPrefixes": ["6CfWNUxq", "zxxXFDA5", "EK0IP8Xf"], "preferRegex": false, "regex": "SJJ8mUNU"}, "blockedWord": ["7bcUZxEt", "E1NP90QY", "CORHP4HU"], "description": [{"language": "ENI2MD1D", "message": ["eiKXEbIb", "CwSqYWc7", "6IgT1R4e"]}, {"language": "Hwsbwzhd", "message": ["H6txosHO", "xoiLJCCO", "45Erzjpk"]}, {"language": "ayo5MSlt", "message": ["rRvHLEvh", "vS5e5vfX", "pHD6qBxB"]}], "isCustomRegex": true, "letterCase": "XbfDZaE7", "maxLength": 35, "maxRepeatingAlphaNum": 25, "maxRepeatingSpecialCharacter": 36, "minCharType": 94, "minLength": 57, "profanityFilter": "LJ2N8T0x", "regex": "ipBUYWOO", "specialCharacterLocation": "3cCBIJYj", "specialCharacters": ["GMbPHIoj", "Xi68Zd43", "jutllxEC"]}}]' \
    > test.out 2>&1
eval_tap $? 113 'AdminUpdateInputValidations' test.out

#- 114 AdminResetInputValidations
./ng net.accelbyte.sdk.cli.Main iam adminResetInputValidations \
    --field 'WGrQHj2l' \
    > test.out 2>&1
eval_tap $? 114 'AdminResetInputValidations' test.out

#- 115 ListAdminsV3
./ng net.accelbyte.sdk.cli.Main iam listAdminsV3 \
    --namespace "$AB_NAMESPACE" \
    --after 'QkWasyEu' \
    --before 'IUGQkQyL' \
    --endDate 'leYNn2fu' \
    --limit '73' \
    --query 'xR3BuWeu' \
    --roleId '0elypFWF' \
    --startDate 'wJoqbG3J' \
    > test.out 2>&1
eval_tap $? 115 'ListAdminsV3' test.out

#- 116 AdminGetAgeRestrictionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetAgeRestrictionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 116 'AdminGetAgeRestrictionStatusV3' test.out

#- 117 AdminUpdateAgeRestrictionConfigV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateAgeRestrictionConfigV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"ageRestriction": 65, "enable": true}' \
    > test.out 2>&1
eval_tap $? 117 'AdminUpdateAgeRestrictionConfigV3' test.out

#- 118 AdminGetListCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminGetListCountryAgeRestrictionV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 118 'AdminGetListCountryAgeRestrictionV3' test.out

#- 119 AdminUpdateCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateCountryAgeRestrictionV3 \
    --countryCode 'ha7kue22' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ageRestriction": 66}' \
    > test.out 2>&1
eval_tap $? 119 'AdminUpdateCountryAgeRestrictionV3' test.out

#- 120 AdminGetBannedUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType 'NR2NnpKL' \
    --limit '33' \
    --offset '69' \
    > test.out 2>&1
eval_tap $? 120 'AdminGetBannedUsersV3' test.out

#- 121 AdminBanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"ban": "wJTpAKZy", "comment": "8KfMWUDQ", "endDate": "oGYG9G0O", "reason": "iT5stW40", "skipNotif": false, "userIds": ["1Q1KkUG2", "W7QZzUw4", "XZHavVZZ"]}' \
    > test.out 2>&1
eval_tap $? 121 'AdminBanUserBulkV3' test.out

#- 122 AdminUnbanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminUnbanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"bans": [{"banId": "7UUHCxNx", "userId": "b4hW9iUp"}, {"banId": "TVSNK48K", "userId": "9Vn0xIsu"}, {"banId": "tt8eTo4F", "userId": "BpgF19q2"}]}' \
    > test.out 2>&1
eval_tap $? 122 'AdminUnbanUserBulkV3' test.out

#- 123 AdminGetBansTypeWithNamespaceV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBansTypeWithNamespaceV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 123 'AdminGetBansTypeWithNamespaceV3' test.out

#- 124 AdminGetClientsByNamespaceV3
./ng net.accelbyte.sdk.cli.Main iam adminGetClientsByNamespaceV3 \
    --namespace "$AB_NAMESPACE" \
    --clientId 'F0kzrQrX' \
    --clientName 'CB6Y9iAD' \
    --clientType 'Uc6EHxM9' \
    --limit '20' \
    --offset '9' \
    --skipLoginQueue  \
    > test.out 2>&1
eval_tap $? 124 'AdminGetClientsByNamespaceV3' test.out

#- 125 AdminBulkUpdateClientsV3
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateClientsV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientIds": ["AxUQEU8b", "Tv8rWACJ", "K2cuXfCq"], "clientUpdateRequest": {"audiences": ["WrNRfdaZ", "JRoUHrnh", "oGUWqKhN"], "baseUri": "VXioogx1", "clientName": "DPH88W8v", "clientPermissions": [{"action": 55, "resource": "npYIS1EH", "schedAction": 47, "schedCron": "T8xJPpoH", "schedRange": ["3cTisnVT", "hCOoni7j", "h9fhYxA8"]}, {"action": 87, "resource": "Fs3Xfjvb", "schedAction": 63, "schedCron": "7hV4RpVv", "schedRange": ["kZCedDfu", "0KG9EILM", "1gxiysrr"]}, {"action": 78, "resource": "JUn9wXcc", "schedAction": 58, "schedCron": "cMWG3eWD", "schedRange": ["SOSF0fFY", "Pl6NLE0Q", "3JNnuJnX"]}], "clientPlatform": "wF3Ill2f", "deletable": true, "description": "4Ed5rP7U", "modulePermissions": [{"moduleId": "A2duCRZd", "selectedGroups": [{"groupId": "PQgnxG5J", "selectedActions": [32, 65, 56]}, {"groupId": "6hHkU90q", "selectedActions": [38, 82, 73]}, {"groupId": "ajg65sRK", "selectedActions": [65, 71, 5]}]}, {"moduleId": "QZM76CtC", "selectedGroups": [{"groupId": "ykUawbmV", "selectedActions": [69, 17, 66]}, {"groupId": "0SxSnChh", "selectedActions": [18, 79, 84]}, {"groupId": "FXbN7RWC", "selectedActions": [55, 29, 90]}]}, {"moduleId": "2N0RgD4G", "selectedGroups": [{"groupId": "Tuyyivnq", "selectedActions": [59, 47, 63]}, {"groupId": "89mXUu07", "selectedActions": [5, 78, 83]}, {"groupId": "3QQfnYdI", "selectedActions": [60, 45, 37]}]}], "namespace": "aR7uLbkQ", "oauthAccessTokenExpiration": 12, "oauthAccessTokenExpirationTimeUnit": "Eiyr68Ou", "oauthRefreshTokenExpiration": 72, "oauthRefreshTokenExpirationTimeUnit": "cwf7SmJ2", "redirectUri": "8Hb6gT8L", "scopes": ["fUG71sUG", "hl4skXmf", "XNJ0jlhK"], "skipLoginQueue": false, "twoFactorEnabled": true}}' \
    > test.out 2>&1
eval_tap $? 125 'AdminBulkUpdateClientsV3' test.out

#- 126 AdminCreateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateClientV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["DvypWBxf", "IPk40uR1", "UwvyNsKE"], "baseUri": "NuQgtLFF", "clientId": "wKx0drrd", "clientName": "vfmYBwQW", "clientPermissions": [{"action": 50, "resource": "fY5LJ2X4", "schedAction": 12, "schedCron": "xvuFi5rW", "schedRange": ["yN1hBVoE", "0fgTS78H", "23sgbPBT"]}, {"action": 36, "resource": "z5PabcjR", "schedAction": 64, "schedCron": "VYqoYKct", "schedRange": ["IJ4T9jpp", "1qAiJSjU", "ANWRpVpe"]}, {"action": 55, "resource": "FXBL98Sw", "schedAction": 7, "schedCron": "bXSTympR", "schedRange": ["XX7f7ixl", "9HPGoc0f", "7xLqM4Ps"]}], "clientPlatform": "LvItfgoZ", "deletable": false, "description": "c5cqrrKK", "modulePermissions": [{"moduleId": "Mfn8lgTL", "selectedGroups": [{"groupId": "0bBFbw9J", "selectedActions": [48, 44, 19]}, {"groupId": "ROkmkBYs", "selectedActions": [58, 48, 1]}, {"groupId": "enEw3GgC", "selectedActions": [0, 99, 41]}]}, {"moduleId": "iLu5OT2R", "selectedGroups": [{"groupId": "tw023HyS", "selectedActions": [65, 53, 65]}, {"groupId": "9r5YWCRL", "selectedActions": [100, 26, 23]}, {"groupId": "mxCi2Fgj", "selectedActions": [30, 5, 91]}]}, {"moduleId": "EolRfPa5", "selectedGroups": [{"groupId": "XWGAfzbH", "selectedActions": [7, 18, 5]}, {"groupId": "zRDKahwH", "selectedActions": [2, 4, 4]}, {"groupId": "uuhjxCi9", "selectedActions": [91, 63, 8]}]}], "namespace": "s3aMGmNo", "oauthAccessTokenExpiration": 54, "oauthAccessTokenExpirationTimeUnit": "wzwoy4PO", "oauthClientType": "HF3uBYkf", "oauthRefreshTokenExpiration": 73, "oauthRefreshTokenExpirationTimeUnit": "EKROyAw1", "parentNamespace": "OShaY5CY", "redirectUri": "TpJiJThD", "scopes": ["bW8XmIXL", "nLMjLHxi", "zeYnjBFP"], "secret": "x93swzzJ", "skipLoginQueue": false, "twoFactorEnabled": false}' \
    > test.out 2>&1
eval_tap $? 126 'AdminCreateClientV3' test.out

#- 127 AdminGetClientsbyNamespacebyIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetClientsbyNamespacebyIDV3 \
    --clientId 'dRDEvhYJ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 127 'AdminGetClientsbyNamespacebyIDV3' test.out

#- 128 AdminDeleteClientV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientV3 \
    --clientId 'w72rF4BY' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 128 'AdminDeleteClientV3' test.out

#- 129 AdminUpdateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientV3 \
    --clientId 'WPvVIykL' \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["vlZZGo6a", "xaEgz7fN", "7ACa0lI9"], "baseUri": "cVUBzDVI", "clientName": "VDigzgUR", "clientPermissions": [{"action": 71, "resource": "8wZqxjzL", "schedAction": 33, "schedCron": "47R38OqP", "schedRange": ["AJqBTT6y", "WTxO5iLM", "tOjYm7GX"]}, {"action": 45, "resource": "hwUUlRh1", "schedAction": 39, "schedCron": "HP6rmCh5", "schedRange": ["Py5FwrzD", "stOQQUUd", "YOgkW6or"]}, {"action": 61, "resource": "bFwlxX2R", "schedAction": 24, "schedCron": "VUwZXit2", "schedRange": ["GdDigJ6L", "tHS0LChD", "fXh7cxXL"]}], "clientPlatform": "55gJMlh5", "deletable": true, "description": "S5VgFQ6I", "modulePermissions": [{"moduleId": "oUIIvbi7", "selectedGroups": [{"groupId": "jwowr4ai", "selectedActions": [26, 46, 40]}, {"groupId": "hCQy7k8c", "selectedActions": [82, 18, 2]}, {"groupId": "PIrOOpS4", "selectedActions": [93, 39, 98]}]}, {"moduleId": "IoI1c6uh", "selectedGroups": [{"groupId": "yVVLi3Oj", "selectedActions": [79, 100, 84]}, {"groupId": "bb3ePF3H", "selectedActions": [22, 87, 79]}, {"groupId": "Qfc8wyVL", "selectedActions": [36, 71, 69]}]}, {"moduleId": "TxWtY23b", "selectedGroups": [{"groupId": "mdXm4PAf", "selectedActions": [36, 59, 42]}, {"groupId": "9eP9lBgQ", "selectedActions": [48, 12, 25]}, {"groupId": "KuUTNUhn", "selectedActions": [91, 94, 27]}]}], "namespace": "Vttwwp7d", "oauthAccessTokenExpiration": 26, "oauthAccessTokenExpirationTimeUnit": "sSIrTcgf", "oauthRefreshTokenExpiration": 88, "oauthRefreshTokenExpirationTimeUnit": "Gf3GwBP1", "redirectUri": "NOdeuHWH", "scopes": ["sUrVCF6I", "Xcgvz14P", "tbTb7MEs"], "skipLoginQueue": true, "twoFactorEnabled": false}' \
    > test.out 2>&1
eval_tap $? 129 'AdminUpdateClientV3' test.out

#- 130 AdminUpdateClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientPermissionV3 \
    --clientId 'Lf6zSqOG' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 32, "resource": "IGFYiExi"}, {"action": 37, "resource": "0nUDTJJ4"}, {"action": 83, "resource": "ciHBA6ct"}]}' \
    > test.out 2>&1
eval_tap $? 130 'AdminUpdateClientPermissionV3' test.out

#- 131 AdminAddClientPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddClientPermissionsV3 \
    --clientId 'I6B0yQIg' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 12, "resource": "fxosB9ww"}, {"action": 73, "resource": "VksDZN6P"}, {"action": 95, "resource": "dbnRBppJ"}]}' \
    > test.out 2>&1
eval_tap $? 131 'AdminAddClientPermissionsV3' test.out

#- 132 AdminDeleteClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientPermissionV3 \
    --action '36' \
    --clientId 'abDC7Shp' \
    --namespace "$AB_NAMESPACE" \
    --resource 'hmzyDO10' \
    > test.out 2>&1
eval_tap $? 132 'AdminDeleteClientPermissionV3' test.out

#- 133 AdminGetConfigValueV3
./ng net.accelbyte.sdk.cli.Main iam adminGetConfigValueV3 \
    --configKey 'tCQiFd4I' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 133 'AdminGetConfigValueV3' test.out

#- 134 AdminGetCountryListV3
./ng net.accelbyte.sdk.cli.Main iam adminGetCountryListV3 \
    --namespace "$AB_NAMESPACE" \
    --filterBlacklist  \
    > test.out 2>&1
eval_tap $? 134 'AdminGetCountryListV3' test.out

#- 135 AdminGetCountryBlacklistV3
./ng net.accelbyte.sdk.cli.Main iam adminGetCountryBlacklistV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 135 'AdminGetCountryBlacklistV3' test.out

#- 136 AdminAddCountryBlacklistV3
./ng net.accelbyte.sdk.cli.Main iam adminAddCountryBlacklistV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"blacklist": ["JD3EVJ8Z", "58piNCA6", "icAT41C2"]}' \
    > test.out 2>&1
eval_tap $? 136 'AdminAddCountryBlacklistV3' test.out

#- 137 RetrieveAllThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveAllThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 137 'RetrieveAllThirdPartyLoginPlatformCredentialV3' test.out

#- 138 RetrieveAllActiveThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveAllActiveThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 138 'RetrieveAllActiveThirdPartyLoginPlatformCredentialV3' test.out

#- 139 RetrieveAllSSOLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveAllSSOLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '2' \
    --offset '13' \
    > test.out 2>&1
eval_tap $? 139 'RetrieveAllSSOLoginPlatformCredentialV3' test.out

#- 140 RetrieveThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'FSakgTkx' \
    > test.out 2>&1
eval_tap $? 140 'RetrieveThirdPartyLoginPlatformCredentialV3' test.out

#- 141 AddThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam addThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'wXmMw6ht' \
    --body '{"ACSURL": "Ya6xvnwM", "AWSCognitoRegion": "pKiNvTLG", "AWSCognitoUserPool": "9eARBSxJ", "AllowedClients": ["ynovs5Z2", "CoyoQsfI", "bOT3EokO"], "AppId": "vvaTpguC", "AuthorizationEndpoint": "VdMQWqX3", "ClientId": "r8Q6Wlqp", "EmptyStrFieldList": ["KQ5XrsR7", "DPiVNTby", "JXK4YIlS"], "EnableServerLicenseValidation": true, "Environment": "IetzCLjk", "FederationMetadataURL": "KEee1bUb", "GenericOauthFlow": true, "IncludePUID": true, "IsActive": true, "Issuer": "3GUcqJ8j", "JWKSEndpoint": "wohatmI8", "KeyID": "cb2QPxBx", "LogoURL": "Cx7fnkHk", "NetflixCertificates": {"encryptedPrivateKey": "N9c2gr0I", "encryptedPrivateKeyName": "ohaGjk6v", "publicCertificate": "MDr8uemi", "publicCertificateName": "ECS3b1xf", "rootCertificate": "sCfwQmbi", "rootCertificateName": "dgZhqWBt"}, "OrganizationId": "11kWCdP8", "PlatformName": "O9S7Ct6M", "RedirectUri": "BbwzRkGw", "RegisteredDomains": [{"affectedClientIDs": ["Tj5JytoE", "5RETT0m7", "44ofRccy"], "domain": "DDgAxUKM", "namespaces": ["ZdgvYHJe", "ToFbh3j0", "MSKA5gyd"], "roleId": "3Gmn3yL5"}, {"affectedClientIDs": ["O4WYTQZP", "xCWviJm9", "L03fW4Sr"], "domain": "uZDvaNbn", "namespaces": ["fNlwszAm", "XCUXpaKY", "ltnDGkmR"], "roleId": "9ecrUHKU"}, {"affectedClientIDs": ["Y1rMO2IF", "JUbP31JN", "V4VljhJc"], "domain": "wFluQyAK", "namespaces": ["MzmyREos", "jYyTRCmu", "eHswynQd"], "roleId": "LnKFXsES"}], "Secret": "XdLp1MzZ", "TeamID": "RgO5q7mI", "TokenAuthenticationType": "Nw3Hc1U7", "TokenClaimsMapping": {"7JfPP9pq": "RZda8pta", "zepYcj0U": "l9eH0SKX", "Dvoolw8j": "yrUz2Jvk"}, "TokenEndpoint": "a3DlrRvR", "UserInfoEndpoint": "qSMlvxP2", "UserInfoHTTPMethod": "kbCfuVTv", "scopes": ["yvlTskDB", "qIfjlQuJ", "rb4N0919"]}' \
    > test.out 2>&1
eval_tap $? 141 'AddThirdPartyLoginPlatformCredentialV3' test.out

#- 142 DeleteThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'UNmsJjOs' \
    > test.out 2>&1
eval_tap $? 142 'DeleteThirdPartyLoginPlatformCredentialV3' test.out

#- 143 UpdateThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'UCqLhp9P' \
    --body '{"ACSURL": "XRDEtJuT", "AWSCognitoRegion": "LxbRfMqj", "AWSCognitoUserPool": "jl1qOY3w", "AllowedClients": ["lCkimueV", "LLvbDZbG", "B9zriFUd"], "AppId": "eFNlBHaf", "AuthorizationEndpoint": "w8iQyLsY", "ClientId": "td0Ybm9u", "EmptyStrFieldList": ["RLXnbTEf", "6V7cVwqL", "JNCWLCvI"], "EnableServerLicenseValidation": true, "Environment": "o2YIPavl", "FederationMetadataURL": "4f9eq7gf", "GenericOauthFlow": true, "IncludePUID": false, "IsActive": true, "Issuer": "nKT7iXcE", "JWKSEndpoint": "mZ6fIQMz", "KeyID": "UAoi1oIA", "LogoURL": "V621lWxY", "NetflixCertificates": {"encryptedPrivateKey": "lpRoNAMO", "encryptedPrivateKeyName": "Ku8mZmrn", "publicCertificate": "uAnraMDJ", "publicCertificateName": "CKCvW0vL", "rootCertificate": "xMQ3KyzA", "rootCertificateName": "4eW4pPX8"}, "OrganizationId": "W1CfUhAk", "PlatformName": "XZHHp3BO", "RedirectUri": "3Jd7z7YU", "RegisteredDomains": [{"affectedClientIDs": ["tS0tsg0S", "dMoSuuN6", "jpvekbps"], "domain": "Btdr2k8S", "namespaces": ["QiJqSRa1", "NXCpbut1", "vUnPUrzd"], "roleId": "6gJ3Bjfy"}, {"affectedClientIDs": ["GNRhVudj", "PpuCXVzC", "R9ytpT6B"], "domain": "d8ANMBDc", "namespaces": ["TQocFDoz", "vhNmuYCk", "iKZShwbb"], "roleId": "PUVwiB6F"}, {"affectedClientIDs": ["DBpHT4Jc", "uK6fmfGs", "3UItcuUe"], "domain": "jvVqBtLB", "namespaces": ["qG9XT6tW", "QD28hYla", "muJkrqJx"], "roleId": "AMn3ZIWG"}], "Secret": "H7ur42fL", "TeamID": "klh1aLXw", "TokenAuthenticationType": "Dui7eER9", "TokenClaimsMapping": {"pX0ZYg9Y": "Ec9WvCbT", "lbPwixXx": "NhziuYRI", "ZfbhS3ff": "FeU0TSV2"}, "TokenEndpoint": "Xdd9A8Nw", "UserInfoEndpoint": "XfptpAoy", "UserInfoHTTPMethod": "H1yRhT9F", "scopes": ["T3dJbeKs", "PwX14iKV", "8fBvefeI"]}' \
    > test.out 2>&1
eval_tap $? 143 'UpdateThirdPartyLoginPlatformCredentialV3' test.out

#- 144 UpdateThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '2IZKBsrs' \
    --body '{"affectedClientIDs": ["NmuK8ia6", "qe3pt5Bx", "JjA8X69w"], "assignedNamespaces": ["AJQ7nILG", "qvn6cvyz", "nHPBWoMk"], "domain": "RrcFALDC", "roleId": "IK3Pn05x"}' \
    > test.out 2>&1
eval_tap $? 144 'UpdateThirdPartyLoginPlatformDomainV3' test.out

#- 145 DeleteThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'wTvpJRny' \
    --body '{"domain": "mAaxg3jN"}' \
    > test.out 2>&1
eval_tap $? 145 'DeleteThirdPartyLoginPlatformDomainV3' test.out

#- 146 RetrieveSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam retrieveSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'AwuI4iGI' \
    > test.out 2>&1
eval_tap $? 146 'RetrieveSSOLoginPlatformCredential' test.out

#- 147 AddSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam addSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'ru0qIhE7' \
    --body '{"acsUrl": "0QKYnh1R", "apiKey": "lJ3kYG8e", "appId": "KqhD58Vx", "federationMetadataUrl": "9rbwWzh6", "isActive": false, "redirectUri": "QTQ86BH3", "secret": "Cj8YqrkM", "ssoUrl": "BuMMxLtU"}' \
    > test.out 2>&1
eval_tap $? 147 'AddSSOLoginPlatformCredential' test.out

#- 148 DeleteSSOLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteSSOLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'gWv2lwlV' \
    > test.out 2>&1
eval_tap $? 148 'DeleteSSOLoginPlatformCredentialV3' test.out

#- 149 UpdateSSOPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam updateSSOPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'gfAIshSR' \
    --body '{"acsUrl": "pgNvaDf8", "apiKey": "5VbkvWD0", "appId": "l5sc4Ft2", "federationMetadataUrl": "wiJT0Nnk", "isActive": false, "redirectUri": "nqYers0c", "secret": "neXLFkai", "ssoUrl": "gAauzytp"}' \
    > test.out 2>&1
eval_tap $? 149 'UpdateSSOPlatformCredential' test.out

#- 150 AdminListUserIDByPlatformUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByPlatformUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '3bAbVX2L' \
    --rawPID  \
    --rawPUID  \
    --body '{"platformUserIds": ["cYGdUC7r", "9PEMmxag", "FkmZhsJw"]}' \
    > test.out 2>&1
eval_tap $? 150 'AdminListUserIDByPlatformUserIDsV3' test.out

#- 151 AdminGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'vGdqvoyn' \
    --platformUserId 'QOCHP2hH' \
    > test.out 2>&1
eval_tap $? 151 'AdminGetUserByPlatformUserIDV3' test.out

#- 152 GetAdminUsersByRoleIdV3
./ng net.accelbyte.sdk.cli.Main iam getAdminUsersByRoleIdV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'pN0WHCZu' \
    --after '59' \
    --before '55' \
    --limit '100' \
    > test.out 2>&1
eval_tap $? 152 'GetAdminUsersByRoleIdV3' test.out

#- 153 AdminGetUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --emailAddress 'qG8QHyuY' \
    > test.out 2>&1
eval_tap $? 153 'AdminGetUserByEmailAddressV3' test.out

#- 154 AdminBulkUpdateUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"updateRequest": {"skipLoginQueue": false}, "userIds": ["keRorKE0", "WCHZtLez", "mDWtvNoP"]}' \
    > test.out 2>&1
eval_tap $? 154 'AdminBulkUpdateUsersV3' test.out

#- 155 AdminGetBulkUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType 'uGDCUCHU' \
    --body '{"bulkUserId": ["pianQYnh", "odgPYaWQ", "Vxpc17yb"]}' \
    > test.out 2>&1
eval_tap $? 155 'AdminGetBulkUserBanV3' test.out

#- 156 AdminListUserIDByUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["Ph4e5aOq", "vqIGDdMQ", "aRDKuaeW"]}' \
    > test.out 2>&1
eval_tap $? 156 'AdminListUserIDByUserIDsV3' test.out

#- 157 AdminBulkGetUsersPlatform
./ng net.accelbyte.sdk.cli.Main iam adminBulkGetUsersPlatform \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["tsrlawER", "9BikkoVH", "gKg9QhFO"]}' \
    > test.out 2>&1
eval_tap $? 157 'AdminBulkGetUsersPlatform' test.out

#- 158 AdminInviteUserV3
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddresses": ["c2KVPJ4M", "xkdM9d3I", "JoAT1Zjc"], "isAdmin": false, "languageTag": "mdIkaa8d", "namespace": "8P16elVq", "roles": ["Zkh0YCWh", "kerIGSDU", "KYgYbgg2"]}' \
    > test.out 2>&1
eval_tap $? 158 'AdminInviteUserV3' test.out

#- 159 AdminQueryThirdPlatformLinkHistoryV3
./ng net.accelbyte.sdk.cli.Main iam adminQueryThirdPlatformLinkHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '64' \
    --offset '56' \
    --platformUserId 'i2ADMDU1' \
    --platformId 'PRF5BoNf' \
    > test.out 2>&1
eval_tap $? 159 'AdminQueryThirdPlatformLinkHistoryV3' test.out

#- 160 AdminListUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminListUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '23' \
    --offset '51' \
    > test.out 2>&1
eval_tap $? 160 'AdminListUsersV3' test.out

#- 161 AdminSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam adminSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'tRR8pWmw' \
    --endDate 'vg6BTGRK' \
    --includeTotal  \
    --limit '27' \
    --offset '67' \
    --platformBy 'bGtsaKoS' \
    --platformId 'GEUhyBIc' \
    --query 'mNj3oumc' \
    --roleIds 'CXb9Xzxu' \
    --skipLoginQueue  \
    --startDate 'mj9s3sQx' \
    --testAccount  \
    > test.out 2>&1
eval_tap $? 161 'AdminSearchUserV3' test.out

#- 162 AdminGetBulkUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"listEmailAddressRequest": ["BDWv3iu6", "lQYNy6h3", "8VXSQYhX"]}' \
    > test.out 2>&1
eval_tap $? 162 'AdminGetBulkUserByEmailAddressV3' test.out

#- 163 AdminGetUserByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'fCRvz9Ya' \
    > test.out 2>&1
eval_tap $? 163 'AdminGetUserByUserIdV3' test.out

#- 164 AdminUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'gdynF2Kw' \
    --body '{"avatarUrl": "k9tEtWdI", "country": "Qbezg2h7", "dateOfBirth": "T2NF0wGL", "displayName": "5BpNfHxW", "languageTag": "L5eA95I1", "skipLoginQueue": true, "uniqueDisplayName": "DtPZZik2", "userName": "xCIlk7GH"}' \
    > test.out 2>&1
eval_tap $? 164 'AdminUpdateUserV3' test.out

#- 165 AdminGetUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '8g7KbpRT' \
    --activeOnly  \
    --after 'q8DJhzFK' \
    --before 'bmIOVIDs' \
    --limit '49' \
    > test.out 2>&1
eval_tap $? 165 'AdminGetUserBanV3' test.out

#- 166 AdminBanUserV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ToTDH4i9' \
    --body '{"ban": "0BipygBm", "comment": "F4AHfB3S", "endDate": "CIBgl92E", "reason": "I7vg3rcS", "skipNotif": true}' \
    > test.out 2>&1
eval_tap $? 166 'AdminBanUserV3' test.out

#- 167 AdminGetUserBanSummaryV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanSummaryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'QcMJmcpI' \
    > test.out 2>&1
eval_tap $? 167 'AdminGetUserBanSummaryV3' test.out

#- 168 AdminUpdateUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserBanV3 \
    --banId 'hGxJPfRP' \
    --namespace "$AB_NAMESPACE" \
    --userId 'zTymSxIP' \
    --body '{"enabled": false, "skipNotif": true}' \
    > test.out 2>&1
eval_tap $? 168 'AdminUpdateUserBanV3' test.out

#- 169 AdminSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'APiV87xB' \
    --body '{"context": "aUcbhGNy", "emailAddress": "IMF36VX3", "languageTag": "ZKIwrqMa"}' \
    > test.out 2>&1
eval_tap $? 169 'AdminSendVerificationCodeV3' test.out

#- 170 AdminVerifyAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'VlSWMzDH' \
    --body '{"Code": "QFa0wX6u", "ContactType": "jYmvIfRV", "LanguageTag": "geHTCBeM", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 170 'AdminVerifyAccountV3' test.out

#- 171 GetUserVerificationCode
./ng net.accelbyte.sdk.cli.Main iam getUserVerificationCode \
    --namespace "$AB_NAMESPACE" \
    --userId '3LYY6iop' \
    > test.out 2>&1
eval_tap $? 171 'GetUserVerificationCode' test.out

#- 172 AdminGetUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'fNU9f8Gg' \
    > test.out 2>&1
eval_tap $? 172 'AdminGetUserDeletionStatusV3' test.out

#- 173 AdminUpdateUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'SNofYgfV' \
    --body '{"deletionDate": 94, "enabled": false}' \
    > test.out 2>&1
eval_tap $? 173 'AdminUpdateUserDeletionStatusV3' test.out

#- 174 AdminListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'XhhBpayd' \
    > test.out 2>&1
eval_tap $? 174 'AdminListUserAllPlatformAccountsDistinctV3' test.out

#- 175 AdminUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'DxpdTawp' \
    --body '{"code": "1U2LeiJZ", "country": "6t7stgRT", "dateOfBirth": "vFkOUh7d", "displayName": "sqoeXGLh", "emailAddress": "k4vxP0Xi", "password": "iqb3lBBa", "uniqueDisplayName": "daVmbgNb", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 175 'AdminUpgradeHeadlessAccountV3' test.out

#- 176 AdminDeleteUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ty42MlJY' \
    > test.out 2>&1
eval_tap $? 176 'AdminDeleteUserInformationV3' test.out

#- 177 AdminGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Lwg4xdST' \
    --after '0.10107699427195926' \
    --before '0.6959865829913104' \
    --limit '87' \
    > test.out 2>&1
eval_tap $? 177 'AdminGetUserLoginHistoriesV3' test.out

#- 178 AdminResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam adminResetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Lieg6EK1' \
    --body '{"languageTag": "4nQbHEfD", "mfaToken": "axx6yZyx", "newPassword": "IfP6kYBa", "oldPassword": "shKbPHFX"}' \
    > test.out 2>&1
eval_tap $? 178 'AdminResetPasswordV3' test.out

#- 179 AdminUpdateUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserPermissionV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'tmunFkbG' \
    --body '{"Permissions": [{"Action": 39, "Resource": "chQgeicw", "SchedAction": 54, "SchedCron": "rNQtu9SJ", "SchedRange": ["8m8DDGqX", "GBvXDeYD", "AjCFRCF1"]}, {"Action": 64, "Resource": "eG8guXTh", "SchedAction": 82, "SchedCron": "OHC0K1sl", "SchedRange": ["JGWoDBmy", "BeVp4ehY", "XFQdvyLY"]}, {"Action": 100, "Resource": "ARkWmcc4", "SchedAction": 55, "SchedCron": "Dp2cUstc", "SchedRange": ["yXX9Sr9S", "bcs9Hf4r", "3zk23zf8"]}]}' \
    > test.out 2>&1
eval_tap $? 179 'AdminUpdateUserPermissionV3' test.out

#- 180 AdminAddUserPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserPermissionsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'id84st8O' \
    --body '{"Permissions": [{"Action": 80, "Resource": "vabWcKRN", "SchedAction": 96, "SchedCron": "66ZJpBVt", "SchedRange": ["PIvyj1mA", "jtsGkIZR", "toKt2sum"]}, {"Action": 99, "Resource": "IR4xCjsR", "SchedAction": 81, "SchedCron": "J3MvDAGC", "SchedRange": ["hncPSgvA", "elO225lP", "Qfr7YkFl"]}, {"Action": 93, "Resource": "OqGHq2y4", "SchedAction": 87, "SchedCron": "sCm4Mb4Z", "SchedRange": ["CvmftWA0", "NMlWSocC", "KlPuMARa"]}]}' \
    > test.out 2>&1
eval_tap $? 180 'AdminAddUserPermissionsV3' test.out

#- 181 AdminDeleteUserPermissionBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'nW7JlE0G' \
    --body '[{"Action": 73, "Resource": "q1pN4zvr"}, {"Action": 80, "Resource": "VvD832dL"}, {"Action": 60, "Resource": "kQSidCH4"}]' \
    > test.out 2>&1
eval_tap $? 181 'AdminDeleteUserPermissionBulkV3' test.out

#- 182 AdminDeleteUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionV3 \
    --action '41' \
    --namespace "$AB_NAMESPACE" \
    --resource 'MlN05Cef' \
    --userId 'SmJ8Tsf6' \
    > test.out 2>&1
eval_tap $? 182 'AdminDeleteUserPermissionV3' test.out

#- 183 AdminGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'XowC1u6h' \
    --after 'bIeAbbAM' \
    --before 'eDwa4Ynr' \
    --limit '5' \
    --platformId 'J1phKdiG' \
    --targetNamespace 'ofQdejfY' \
    > test.out 2>&1
eval_tap $? 183 'AdminGetUserPlatformAccountsV3' test.out

#- 184 AdminListAllDistinctPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminListAllDistinctPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'BQMeckxc' \
    --status 'Qh4soH92' \
    > test.out 2>&1
eval_tap $? 184 'AdminListAllDistinctPlatformAccountsV3' test.out

#- 185 AdminGetListJusticePlatformAccounts
./ng net.accelbyte.sdk.cli.Main iam adminGetListJusticePlatformAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'zh0TScwT' \
    > test.out 2>&1
eval_tap $? 185 'AdminGetListJusticePlatformAccounts' test.out

#- 186 AdminGetUserMapping
./ng net.accelbyte.sdk.cli.Main iam adminGetUserMapping \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'oTnu2Ww8' \
    --userId 'imMdxn2g' \
    > test.out 2>&1
eval_tap $? 186 'AdminGetUserMapping' test.out

#- 187 AdminCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam adminCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'A5SkHGg9' \
    --userId 'QL1UwWl8' \
    > test.out 2>&1
eval_tap $? 187 'AdminCreateJusticeUser' test.out

#- 188 AdminLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'H7SzXbyl' \
    --skipConflict  \
    --body '{"platformId": "Bd6bOZXp", "platformUserId": "iaomR5lz"}' \
    > test.out 2>&1
eval_tap $? 188 'AdminLinkPlatformAccount' test.out

#- 189 AdminGetUserLinkHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLinkHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Z2KvJT5g' \
    --platformId 'ZaBKTkVo' \
    > test.out 2>&1
eval_tap $? 189 'AdminGetUserLinkHistoriesV3' test.out

#- 190 AdminPlatformUnlinkV3
eval_tap 0 190 'AdminPlatformUnlinkV3 # SKIP deprecated' test.out

#- 191 AdminPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'T8mZvY1S' \
    --userId 'tZCzzAJ9' \
    > test.out 2>&1
eval_tap $? 191 'AdminPlatformUnlinkAllV3' test.out

#- 192 AdminPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'kQf9j4WN' \
    --userId 'fHQYWuwH' \
    --ticket 's4ZS4YxV' \
    > test.out 2>&1
eval_tap $? 192 'AdminPlatformLinkV3' test.out

#- 193 AdminDeleteUserLinkingHistoryByPlatformIDV3
eval_tap 0 193 'AdminDeleteUserLinkingHistoryByPlatformIDV3 # SKIP deprecated' test.out

#- 194 AdminDeleteUserLinkingRestrictionByPlatformIDV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserLinkingRestrictionByPlatformIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'naaHv6eC' \
    --userId 'UNFPuTwU' \
    > test.out 2>&1
eval_tap $? 194 'AdminDeleteUserLinkingRestrictionByPlatformIDV3' test.out

#- 195 AdminGetThirdPartyPlatformTokenLinkStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetThirdPartyPlatformTokenLinkStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'YSsL7Pta' \
    --userId '4JQ9Ys8D' \
    --platformToken 'oaGVSAGt' \
    > test.out 2>&1
eval_tap $? 195 'AdminGetThirdPartyPlatformTokenLinkStatusV3' test.out

#- 196 AdminGetUserSinglePlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminGetUserSinglePlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --platformId 'aC5wibJ5' \
    --userId 'QAUXO1S5' \
    > test.out 2>&1
eval_tap $? 196 'AdminGetUserSinglePlatformAccount' test.out

#- 197 AdminDeleteUserRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRolesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'uYaU3J5U' \
    --body '["psOfyXOY", "tS6Vgj39", "VvVAQ8Tg"]' \
    > test.out 2>&1
eval_tap $? 197 'AdminDeleteUserRolesV3' test.out

#- 198 AdminSaveUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminSaveUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'qgpjHjcV' \
    --body '[{"namespace": "aWO7wTQK", "roleId": "4jh9kPsq"}, {"namespace": "tkSNFm57", "roleId": "3nn7xz50"}, {"namespace": "rYy5KS8c", "roleId": "dZkmvGT5"}]' \
    > test.out 2>&1
eval_tap $? 198 'AdminSaveUserRoleV3' test.out

#- 199 AdminAddUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'T7WNj5Pn' \
    --userId '93keBLhH' \
    > test.out 2>&1
eval_tap $? 199 'AdminAddUserRoleV3' test.out

#- 200 AdminDeleteUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'XeCgnQRe' \
    --userId 'itFA3XhQ' \
    > test.out 2>&1
eval_tap $? 200 'AdminDeleteUserRoleV3' test.out

#- 201 AdminUpdateUserStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'wHtHA77e' \
    --body '{"enabled": true, "reason": "UIiReMVt"}' \
    > test.out 2>&1
eval_tap $? 201 'AdminUpdateUserStatusV3' test.out

#- 202 AdminTrustlyUpdateUserIdentity
./ng net.accelbyte.sdk.cli.Main iam adminTrustlyUpdateUserIdentity \
    --namespace "$AB_NAMESPACE" \
    --userId 'yOjLGUz1' \
    --body '{"emailAddress": "dYLCf5RS", "password": "hFHShoR8"}' \
    > test.out 2>&1
eval_tap $? 202 'AdminTrustlyUpdateUserIdentity' test.out

#- 203 AdminVerifyUserWithoutVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyUserWithoutVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'oHfcaggf' \
    > test.out 2>&1
eval_tap $? 203 'AdminVerifyUserWithoutVerificationCodeV3' test.out

#- 204 AdminUpdateClientSecretV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientSecretV3 \
    --clientId 'KQUgOExs' \
    --namespace "$AB_NAMESPACE" \
    --body '{"newSecret": "qaO5gYce"}' \
    > test.out 2>&1
eval_tap $? 204 'AdminUpdateClientSecretV3' test.out

#- 205 AdminCheckThirdPartyLoginPlatformAvailabilityV3
./ng net.accelbyte.sdk.cli.Main iam adminCheckThirdPartyLoginPlatformAvailabilityV3 \
    --platformId 'dEkZb4Xb' \
    > test.out 2>&1
eval_tap $? 205 'AdminCheckThirdPartyLoginPlatformAvailabilityV3' test.out

#- 206 AdminGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV3 \
    --after 'AtsPim4a' \
    --before 'pzN5bHYM' \
    --isWildcard  \
    --limit '77' \
    > test.out 2>&1
eval_tap $? 206 'AdminGetRolesV3' test.out

#- 207 AdminCreateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV3 \
    --body '{"adminRole": false, "deletable": true, "isWildcard": false, "managers": [{"displayName": "CX3y7jig", "namespace": "q0AYsmin", "userId": "YDqHPboO"}, {"displayName": "fhqN97fx", "namespace": "slqk0iuv", "userId": "CbNwid4o"}, {"displayName": "2VyWtL7e", "namespace": "RGKJdJuO", "userId": "GzVDUDkO"}], "members": [{"displayName": "TAYzxRIA", "namespace": "b0BxQkFb", "userId": "ZRHt5c4U"}, {"displayName": "96JtG8h4", "namespace": "l9LgKiaW", "userId": "0xUzleBf"}, {"displayName": "Yoo24anf", "namespace": "LYRdBd2h", "userId": "paRDtuNB"}], "permissions": [{"action": 75, "resource": "6sjuQwpk", "schedAction": 27, "schedCron": "pNog7y97", "schedRange": ["u6IemCOL", "0m6rS4Qk", "XSBlOJZA"]}, {"action": 29, "resource": "eALnzEMR", "schedAction": 81, "schedCron": "8n8y5LLl", "schedRange": ["ORxbtFoH", "Ep9r4XxD", "xWK30fEu"]}, {"action": 9, "resource": "pIXppjap", "schedAction": 8, "schedCron": "CxemfCup", "schedRange": ["XOnPNfs7", "jYxqFFCs", "3zUDE899"]}], "roleName": "dghUhtx8"}' \
    > test.out 2>&1
eval_tap $? 207 'AdminCreateRoleV3' test.out

#- 208 AdminGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV3 \
    --roleId 'gJ1L8yCT' \
    > test.out 2>&1
eval_tap $? 208 'AdminGetRoleV3' test.out

#- 209 AdminDeleteRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV3 \
    --roleId 'KZvga6CK' \
    > test.out 2>&1
eval_tap $? 209 'AdminDeleteRoleV3' test.out

#- 210 AdminUpdateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV3 \
    --roleId 'cYB8jmkp' \
    --body '{"deletable": false, "isWildcard": false, "roleName": "fvnCuTB1"}' \
    > test.out 2>&1
eval_tap $? 210 'AdminUpdateRoleV3' test.out

#- 211 AdminGetRoleAdminStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleAdminStatusV3 \
    --roleId 'z3Ig17cR' \
    > test.out 2>&1
eval_tap $? 211 'AdminGetRoleAdminStatusV3' test.out

#- 212 AdminUpdateAdminRoleStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateAdminRoleStatusV3 \
    --roleId '9xEHz4Sw' \
    > test.out 2>&1
eval_tap $? 212 'AdminUpdateAdminRoleStatusV3' test.out

#- 213 AdminRemoveRoleAdminV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleAdminV3 \
    --roleId '5VQ3n0Lq' \
    > test.out 2>&1
eval_tap $? 213 'AdminRemoveRoleAdminV3' test.out

#- 214 AdminGetRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleManagersV3 \
    --roleId 'dkyPvHdr' \
    --after 'KbdXirDT' \
    --before '5P7Prbps' \
    --limit '72' \
    > test.out 2>&1
eval_tap $? 214 'AdminGetRoleManagersV3' test.out

#- 215 AdminAddRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleManagersV3 \
    --roleId 'KLaXgmQV' \
    --body '{"managers": [{"displayName": "8p9KJQki", "namespace": "Lc02PeYR", "userId": "c5Aey7Px"}, {"displayName": "XFRt8pSa", "namespace": "HoSZK6QX", "userId": "eIZUoVhm"}, {"displayName": "kVFMDVff", "namespace": "ITBEKf4H", "userId": "dcNDzPfG"}]}' \
    > test.out 2>&1
eval_tap $? 215 'AdminAddRoleManagersV3' test.out

#- 216 AdminRemoveRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleManagersV3 \
    --roleId '07VGqY2Y' \
    --body '{"managers": [{"displayName": "PSyRIlwv", "namespace": "KRTGPj6x", "userId": "vwk74Edu"}, {"displayName": "CIkcTBEx", "namespace": "YS60Rjbr", "userId": "FJiBadNj"}, {"displayName": "cb1t8ddo", "namespace": "PScZTjG1", "userId": "8XFT3vFK"}]}' \
    > test.out 2>&1
eval_tap $? 216 'AdminRemoveRoleManagersV3' test.out

#- 217 AdminGetRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleMembersV3 \
    --roleId 'bphLGdPu' \
    --after 'duJu88OX' \
    --before 'kssVYFw2' \
    --limit '77' \
    > test.out 2>&1
eval_tap $? 217 'AdminGetRoleMembersV3' test.out

#- 218 AdminAddRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleMembersV3 \
    --roleId 'KtZBdvS9' \
    --body '{"members": [{"displayName": "PHxrgNUc", "namespace": "tqnv4Eb9", "userId": "eOGX3gpJ"}, {"displayName": "4KG5XoWm", "namespace": "hPyvBNsG", "userId": "mAUQCbbS"}, {"displayName": "3e8Rg4xN", "namespace": "5ZdqvXhI", "userId": "eLc9tqbq"}]}' \
    > test.out 2>&1
eval_tap $? 218 'AdminAddRoleMembersV3' test.out

#- 219 AdminRemoveRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleMembersV3 \
    --roleId 'rlz4n7Wp' \
    --body '{"members": [{"displayName": "95xkYGHJ", "namespace": "Dgds2ZNI", "userId": "U3vSJ1tM"}, {"displayName": "2rxEVpRv", "namespace": "VVX0qmMj", "userId": "xcrFhd18"}, {"displayName": "hXfjTgAb", "namespace": "jZcPIdU1", "userId": "d9gYeIkQ"}]}' \
    > test.out 2>&1
eval_tap $? 219 'AdminRemoveRoleMembersV3' test.out

#- 220 AdminUpdateRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV3 \
    --roleId 'kpjQXnPc' \
    --body '{"permissions": [{"action": 61, "resource": "nw7mxfew", "schedAction": 35, "schedCron": "ebAUNS6b", "schedRange": ["R51Cap71", "FLDdiM1n", "tnMLlD3F"]}, {"action": 27, "resource": "bt6QWMbj", "schedAction": 10, "schedCron": "27ulXxC7", "schedRange": ["WYnFNRJc", "g2tdrnMQ", "WirYQnKs"]}, {"action": 90, "resource": "udC43qBt", "schedAction": 16, "schedCron": "XmF4BtMu", "schedRange": ["EQpjaHzY", "Ty2S4DZh", "8PLyVvce"]}]}' \
    > test.out 2>&1
eval_tap $? 220 'AdminUpdateRolePermissionsV3' test.out

#- 221 AdminAddRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV3 \
    --roleId 'FWywmgU9' \
    --body '{"permissions": [{"action": 26, "resource": "0ATb7ikV", "schedAction": 21, "schedCron": "MJ4LJ792", "schedRange": ["LqeCDCzu", "7Um7E0qM", "mMzadPlG"]}, {"action": 47, "resource": "4IJY3Uqc", "schedAction": 68, "schedCron": "vK5d2Px4", "schedRange": ["GJP9Q2dL", "cKkBsasV", "vqRE5H3m"]}, {"action": 23, "resource": "W1TH44Sz", "schedAction": 76, "schedCron": "3hlcJwsE", "schedRange": ["noNqYZq8", "7lKPyHpf", "hpJ5j8bQ"]}]}' \
    > test.out 2>&1
eval_tap $? 221 'AdminAddRolePermissionsV3' test.out

#- 222 AdminDeleteRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV3 \
    --roleId 'DTFJeSXj' \
    --body '["E60tOGW7", "ZjtqBtlM", "H81SLRXd"]' \
    > test.out 2>&1
eval_tap $? 222 'AdminDeleteRolePermissionsV3' test.out

#- 223 AdminDeleteRolePermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionV3 \
    --action '93' \
    --resource '2G8oIXPl' \
    --roleId 'W6CCxNss' \
    > test.out 2>&1
eval_tap $? 223 'AdminDeleteRolePermissionV3' test.out

#- 224 AdminGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam adminGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 224 'AdminGetMyUserV3' test.out

#- 225 UserAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam userAuthenticationV3 \
    --clientId 'PNYhqtAD' \
    --extendExp  \
    --redirectUri 'eI3AhsUz' \
    --password '6wE0MYhe' \
    --requestId 'E9SKd4ak' \
    --userName 'OaDSh8zX' \
    > test.out 2>&1
eval_tap $? 225 'UserAuthenticationV3' test.out

#- 226 AuthenticationWithPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV3 \
    --extendExp  \
    --clientId '3tcHnmwM' \
    --linkingToken 'wmCX4xL8' \
    --password 'yvzRNww3' \
    --username '6nsbXH3o' \
    > test.out 2>&1
eval_tap $? 226 'AuthenticationWithPlatformLinkV3' test.out

#- 227 GenerateTokenByNewHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV3 \
    --additionalData 'RD0SwE20' \
    --extendExp  \
    --linkingToken 'mhCWrbxE' \
    > test.out 2>&1
eval_tap $? 227 'GenerateTokenByNewHeadlessAccountV3' test.out

#- 228 RequestOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam requestOneTimeLinkingCodeV3 \
    --platformId 'ZX9jV4tl' \
    > test.out 2>&1
eval_tap $? 228 'RequestOneTimeLinkingCodeV3' test.out

#- 229 ValidateOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam validateOneTimeLinkingCodeV3 \
    --oneTimeLinkCode 'co3qzvhJ' \
    > test.out 2>&1
eval_tap $? 229 'ValidateOneTimeLinkingCodeV3' test.out

#- 230 RequestTokenByOneTimeLinkCodeResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTokenByOneTimeLinkCodeResponseV3 \
    --additionalData '1creiCZh' \
    --isTransient  \
    --clientId 'B6ReLvcw' \
    --oneTimeLinkCode 'Ehv8kc3Q' \
    > test.out 2>&1
eval_tap $? 230 'RequestTokenByOneTimeLinkCodeResponseV3' test.out

#- 231 GetCountryLocationV3
./ng net.accelbyte.sdk.cli.Main iam getCountryLocationV3 \
    > test.out 2>&1
eval_tap $? 231 'GetCountryLocationV3' test.out

#- 232 Logout
./ng net.accelbyte.sdk.cli.Main iam logout \
    > test.out 2>&1
eval_tap $? 232 'Logout' test.out

#- 233 RequestTokenExchangeCodeV3
./ng net.accelbyte.sdk.cli.Main iam requestTokenExchangeCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --codeChallenge 'mdIHcGlb' \
    --codeChallengeMethod 'S256' \
    --clientId 'pJvtufvq' \
    > test.out 2>&1
eval_tap $? 233 'RequestTokenExchangeCodeV3' test.out

#- 234 AdminRetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam adminRetrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'U8DOx6tr' \
    --userId '6QqQVGAx' \
    --platformUserId 'etpRLNB3' \
    > test.out 2>&1
eval_tap $? 234 'AdminRetrieveUserThirdPartyPlatformTokenV3' test.out

#- 235 RevokeUserV3
./ng net.accelbyte.sdk.cli.Main iam revokeUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'sWrdix9o' \
    --includeGameNamespace  \
    > test.out 2>&1
eval_tap $? 235 'RevokeUserV3' test.out

#- 236 AuthorizeV3
./ng net.accelbyte.sdk.cli.Main iam authorizeV3 \
    --codeChallenge 'NyQWe0p7' \
    --codeChallengeMethod 'plain' \
    --createHeadless  \
    --oneTimeLinkCode 'ozXfFtV5' \
    --redirectUri 'Pj6nYIaS' \
    --scope 'OyUcMYcm' \
    --state 'I6JysuV3' \
    --targetAuthPage 'zCmxlkaJ' \
    --useRedirectUriAsLoginUrlWhenLocked  \
    --clientId 'PrXUgEud' \
    --responseType 'code' \
    > test.out 2>&1
eval_tap $? 236 'AuthorizeV3' test.out

#- 237 TokenIntrospectionV3
./ng net.accelbyte.sdk.cli.Main iam tokenIntrospectionV3 \
    --token 'RxTYMJZ9' \
    > test.out 2>&1
eval_tap $? 237 'TokenIntrospectionV3' test.out

#- 238 GetJWKSV3
./ng net.accelbyte.sdk.cli.Main iam getJWKSV3 \
    > test.out 2>&1
eval_tap $? 238 'GetJWKSV3' test.out

#- 239 SendMFAAuthenticationCode
./ng net.accelbyte.sdk.cli.Main iam sendMFAAuthenticationCode \
    --clientId 'zKZofFyv' \
    --factor 'RpCCIXXB' \
    --mfaToken 'XahPSUlk' \
    > test.out 2>&1
eval_tap $? 239 'SendMFAAuthenticationCode' test.out

#- 240 Change2faMethod
./ng net.accelbyte.sdk.cli.Main iam change2faMethod \
    --factor 'GfzRrAvT' \
    --mfaToken 'DvlJo2gh' \
    > test.out 2>&1
eval_tap $? 240 'Change2faMethod' test.out

#- 241 Verify2faCode
./ng net.accelbyte.sdk.cli.Main iam verify2faCode \
    --code 'iohHgi4F' \
    --factor 'mR08bE6u' \
    --mfaToken 'nl6Oxihq' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 241 'Verify2faCode' test.out

#- 242 RetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam retrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'TGZlQY9I' \
    --userId 'YontAUoc' \
    > test.out 2>&1
eval_tap $? 242 'RetrieveUserThirdPartyPlatformTokenV3' test.out

#- 243 AuthCodeRequestV3
./ng net.accelbyte.sdk.cli.Main iam authCodeRequestV3 \
    --platformId 'PvvEztzs' \
    --clientId 'Vx4QNiKl' \
    --redirectUri 'sPdrIflW' \
    --requestId '1F0f6BXF' \
    > test.out 2>&1
eval_tap $? 243 'AuthCodeRequestV3' test.out

#- 244 PlatformTokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV3 \
    --platformId 'Lq6AYwnE' \
    --additionalData 'IY8snL7z' \
    --clientId 'Iw2VqzOa' \
    --createHeadless  \
    --deviceId 'nT6eESEZ' \
    --macAddress 'AmiSy6HN' \
    --platformToken 'xVVDLt2X' \
    --serviceLabel '0.6279836450853344' \
    --skipSetCookie  \
    > test.out 2>&1
eval_tap $? 244 'PlatformTokenGrantV3' test.out

#- 245 GetRevocationListV3
./ng net.accelbyte.sdk.cli.Main iam getRevocationListV3 \
    > test.out 2>&1
eval_tap $? 245 'GetRevocationListV3' test.out

#- 246 TokenRevocationV3
./ng net.accelbyte.sdk.cli.Main iam tokenRevocationV3 \
    --token '9lM09Lia' \
    > test.out 2>&1
eval_tap $? 246 'TokenRevocationV3' test.out

#- 247 SimultaneousLoginV3
./ng net.accelbyte.sdk.cli.Main iam simultaneousLoginV3 \
    --simultaneousPlatform 'MlMxGSnY' \
    --simultaneousTicket 'vOK36m9b' \
    --nativePlatform 'steam' \
    --nativePlatformTicket 'mtzQxItz' \
    > test.out 2>&1
eval_tap $? 247 'SimultaneousLoginV3' test.out

#- 248 TokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV3 \
    --additionalData 'KuqmDVrs' \
    --clientId '5vIxEYbg' \
    --clientSecret 'stUPYqAD' \
    --code 'c2OR9uRa' \
    --codeVerifier 'VKDrsSBb' \
    --extendNamespace '0ZENpc6d' \
    --extendExp  \
    --password 'EMYpEuDy' \
    --redirectUri '7oED3BFI' \
    --refreshToken 'P7eD9EhJ' \
    --username '2N0V0BQM' \
    --grantType 'urn:ietf:params:oauth:grant-type:extend_client_credentials' \
    > test.out 2>&1
eval_tap $? 248 'TokenGrantV3' test.out

#- 249 VerifyTokenV3
./ng net.accelbyte.sdk.cli.Main iam verifyTokenV3 \
    --token 'ElS5nLzA' \
    > test.out 2>&1
eval_tap $? 249 'VerifyTokenV3' test.out

#- 250 PlatformAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticationV3 \
    --platformId 'VDZRFiWk' \
    --code 'ZqIzPekr' \
    --error 'Y6M6xW8R' \
    --openidAssocHandle 'yU44BPz9' \
    --openidClaimedId 'u7IRBp6n' \
    --openidIdentity '5heZAbhV' \
    --openidMode 'NeDo8Qt9' \
    --openidNs 'EqPGRYVa' \
    --openidOpEndpoint '1qGfTik0' \
    --openidResponseNonce 'pZdsaMfQ' \
    --openidReturnTo '6Deh768b' \
    --openidSig 'FeYA4dyt' \
    --openidSigned 'YLgZV0hB' \
    --state 'bQMZROvk' \
    > test.out 2>&1
eval_tap $? 250 'PlatformAuthenticationV3' test.out

#- 251 PlatformTokenRefreshV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenRefreshV3 \
    --platformId 'xhnMVJdc' \
    --platformToken 'QdKlxIyZ' \
    > test.out 2>&1
eval_tap $? 251 'PlatformTokenRefreshV3' test.out

#- 252 PublicGetInputValidations
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidations \
    --defaultOnEmpty  \
    --languageCode 't6hENbXM' \
    > test.out 2>&1
eval_tap $? 252 'PublicGetInputValidations' test.out

#- 253 PublicGetInputValidationByField
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidationByField \
    --field 'FRbIlVdh' \
    > test.out 2>&1
eval_tap $? 253 'PublicGetInputValidationByField' test.out

#- 254 PublicGetCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam publicGetCountryAgeRestrictionV3 \
    --countryCode 'wvaAw4C4' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 254 'PublicGetCountryAgeRestrictionV3' test.out

#- 255 PublicGetConfigValueV3
./ng net.accelbyte.sdk.cli.Main iam publicGetConfigValueV3 \
    --configKey 'WXurRMCW' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 255 'PublicGetConfigValueV3' test.out

#- 256 PublicGetCountryListV3
./ng net.accelbyte.sdk.cli.Main iam publicGetCountryListV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 256 'PublicGetCountryListV3' test.out

#- 257 RetrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3
./ng net.accelbyte.sdk.cli.Main iam retrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 257 'RetrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3' test.out

#- 258 RetrieveActiveOIDCClientsPublicV3
./ng net.accelbyte.sdk.cli.Main iam retrieveActiveOIDCClientsPublicV3 \
    --namespace "$AB_NAMESPACE" \
    --clientId 'Ol3gID9J' \
    > test.out 2>&1
eval_tap $? 258 'RetrieveActiveOIDCClientsPublicV3' test.out

#- 259 PublicListUserIDByPlatformUserIDsV3
eval_tap 0 259 'PublicListUserIDByPlatformUserIDsV3 # SKIP deprecated' test.out

#- 260 PublicGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'vnHTJNJh' \
    --platformUserId 'E0ngzLcJ' \
    > test.out 2>&1
eval_tap $? 260 'PublicGetUserByPlatformUserIDV3' test.out

#- 261 PublicGetAsyncStatus
./ng net.accelbyte.sdk.cli.Main iam publicGetAsyncStatus \
    --namespace "$AB_NAMESPACE" \
    --requestId 'VxizLCfo' \
    > test.out 2>&1
eval_tap $? 261 'PublicGetAsyncStatus' test.out

#- 262 PublicSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam publicSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'M0omn8il' \
    --limit '25' \
    --offset '1' \
    --platformBy 'kkC9MVJf' \
    --platformId 'h4x0HsBP' \
    --query 'IByh7V67' \
    > test.out 2>&1
eval_tap $? 262 'PublicSearchUserV3' test.out

#- 263 PublicCreateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "7QNwOrjZ", "acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "uKWNvZbo", "policyId": "yabHIw8M", "policyVersionId": "SND1Bs8g"}, {"isAccepted": false, "localizedPolicyVersionId": "5s0XWYzy", "policyId": "LzYH804y", "policyVersionId": "QdYgFWRi"}, {"isAccepted": true, "localizedPolicyVersionId": "C0fcFhC8", "policyId": "asYhTkf9", "policyVersionId": "3zvftXZ2"}], "authType": "nv1bSHro", "code": "iwgWG5Jq", "country": "eJX1yWKV", "dateOfBirth": "ejsJHpHM", "displayName": "QLmtRtSR", "emailAddress": "nD0FyEGy", "password": "S1mN6KBk", "reachMinimumAge": false, "uniqueDisplayName": "szK9hcir"}' \
    > test.out 2>&1
eval_tap $? 263 'PublicCreateUserV3' test.out

#- 264 CheckUserAvailability
./ng net.accelbyte.sdk.cli.Main iam checkUserAvailability \
    --namespace "$AB_NAMESPACE" \
    --field 'KGZj6L0d' \
    --query 'z0fQFFwA' \
    > test.out 2>&1
eval_tap $? 264 'CheckUserAvailability' test.out

#- 265 PublicBulkGetUsers
./ng net.accelbyte.sdk.cli.Main iam publicBulkGetUsers \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["0scarSG6", "fCCWEcpL", "0N0Ed0qW"]}' \
    > test.out 2>&1
eval_tap $? 265 'PublicBulkGetUsers' test.out

#- 266 PublicSendRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicSendRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "Qiksvl2r", "languageTag": "KZxjWQFz"}' \
    > test.out 2>&1
eval_tap $? 266 'PublicSendRegistrationCode' test.out

#- 267 PublicVerifyRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicVerifyRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "8Hpv7qhe", "emailAddress": "uCUs6FQf"}' \
    > test.out 2>&1
eval_tap $? 267 'PublicVerifyRegistrationCode' test.out

#- 268 PublicForgotPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicForgotPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "4541yB8o", "languageTag": "pMgQkCH4"}' \
    > test.out 2>&1
eval_tap $? 268 'PublicForgotPasswordV3' test.out

#- 269 PublicValidateUserInput
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserInput \
    --namespace "$AB_NAMESPACE" \
    --body '{"displayName": "cVfWstQs", "uniqueDisplayName": "NM4PvdRV", "username": "n6gXblzE"}' \
    > test.out 2>&1
eval_tap $? 269 'PublicValidateUserInput' test.out

#- 270 GetAdminInvitationV3
./ng net.accelbyte.sdk.cli.Main iam getAdminInvitationV3 \
    --invitationId 'dCdox1d8' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 270 'GetAdminInvitationV3' test.out

#- 271 CreateUserFromInvitationV3
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV3 \
    --invitationId 'gdl44P3l' \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "1jj0OWJJ", "acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "2B0czaTr", "policyId": "BlYkUszr", "policyVersionId": "B6EfhROD"}, {"isAccepted": true, "localizedPolicyVersionId": "UysIZObO", "policyId": "xuV8rGDQ", "policyVersionId": "Wj7vWzUa"}, {"isAccepted": true, "localizedPolicyVersionId": "hbTUMmTK", "policyId": "f61tSY9y", "policyVersionId": "a3NyT66i"}], "authType": "q1G60D12", "code": "UAQOp3ys", "country": "WNHwZLqA", "dateOfBirth": "TBGl9O7Y", "displayName": "GuKDJNt3", "emailAddress": "ravmSiYh", "password": "7utH0YJW", "reachMinimumAge": false, "uniqueDisplayName": "vqhvWf19"}' \
    > test.out 2>&1
eval_tap $? 271 'CreateUserFromInvitationV3' test.out

#- 272 UpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam updateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "ltwG4luH", "country": "vBSHcnVu", "dateOfBirth": "t5P35Gdy", "displayName": "VwXjzp5t", "languageTag": "LOzfDvoi", "uniqueDisplayName": "fdtLk6O8", "userName": "8vleyP5o"}' \
    > test.out 2>&1
eval_tap $? 272 'UpdateUserV3' test.out

#- 273 PublicPartialUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicPartialUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "Xn8UBFOj", "country": "XEOH5n9O", "dateOfBirth": "YjwJWveC", "displayName": "ywSeWYv3", "languageTag": "mJQtzhyz", "uniqueDisplayName": "EgNOKcfv", "userName": "ALLfTao5"}' \
    > test.out 2>&1
eval_tap $? 273 'PublicPartialUpdateUserV3' test.out

#- 274 PublicSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"context": "7YaCeSOv", "emailAddress": "RTOEkdIk", "languageTag": "6Au3eneN"}' \
    > test.out 2>&1
eval_tap $? 274 'PublicSendVerificationCodeV3' test.out

#- 275 PublicUserVerificationV3
./ng net.accelbyte.sdk.cli.Main iam publicUserVerificationV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "85zIQyWD", "contactType": "HWLgT6PL", "languageTag": "hLwCZ2Lv", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 275 'PublicUserVerificationV3' test.out

#- 276 PublicUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "Z3UY41qb", "country": "kbcIHqiz", "dateOfBirth": "bi0ZF1nJ", "displayName": "PwbVGIP9", "emailAddress": "nOvu47Ga", "password": "ZHgjbusw", "uniqueDisplayName": "BR6ENqIt", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 276 'PublicUpgradeHeadlessAccountV3' test.out

#- 277 PublicVerifyHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --needVerificationCode  \
    --body '{"emailAddress": "N9ciaVgz", "password": "2yoXi0Zf"}' \
    > test.out 2>&1
eval_tap $? 277 'PublicVerifyHeadlessAccountV3' test.out

#- 278 PublicUpdatePasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicUpdatePasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"languageTag": "ING9pi6s", "mfaToken": "rtphapvj", "newPassword": "pWxUD49V", "oldPassword": "HNDfyuoI"}' \
    > test.out 2>&1
eval_tap $? 278 'PublicUpdatePasswordV3' test.out

#- 279 PublicCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam publicCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'wIt8JlXy' \
    > test.out 2>&1
eval_tap $? 279 'PublicCreateJusticeUser' test.out

#- 280 PublicPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'bvwWshIf' \
    --redirectUri 'UGdcq4gY' \
    --ticket 't3wW32Rf' \
    > test.out 2>&1
eval_tap $? 280 'PublicPlatformLinkV3' test.out

#- 281 PublicPlatformUnlinkV3
eval_tap 0 281 'PublicPlatformUnlinkV3 # SKIP deprecated' test.out

#- 282 PublicPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '2JMhmZbf' \
    > test.out 2>&1
eval_tap $? 282 'PublicPlatformUnlinkAllV3' test.out

#- 283 PublicForcePlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicForcePlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'V1LaRM2B' \
    --ticket 'M3RVHQIX' \
    > test.out 2>&1
eval_tap $? 283 'PublicForcePlatformLinkV3' test.out

#- 284 PublicWebLinkPlatform
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatform \
    --namespace "$AB_NAMESPACE" \
    --platformId 'MblXkydj' \
    --clientId 'FuPEtZBp' \
    --redirectUri 'Y1hW9rlX' \
    > test.out 2>&1
eval_tap $? 284 'PublicWebLinkPlatform' test.out

#- 285 PublicWebLinkPlatformEstablish
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatformEstablish \
    --namespace "$AB_NAMESPACE" \
    --platformId 'AVTDowhO' \
    --code 'MT5hAJKr' \
    --state 'BF3HtECs' \
    > test.out 2>&1
eval_tap $? 285 'PublicWebLinkPlatformEstablish' test.out

#- 286 PublicProcessWebLinkPlatformV3
./ng net.accelbyte.sdk.cli.Main iam publicProcessWebLinkPlatformV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'qNrf34TA' \
    --code 'nHmyZvT9' \
    --state 'eVYbbfWS' \
    > test.out 2>&1
eval_tap $? 286 'PublicProcessWebLinkPlatformV3' test.out

#- 287 PublicGetUsersPlatformInfosV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUsersPlatformInfosV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"platformId": "55kdeZn4", "userIds": ["Pw6NXIK0", "7dvKtmdG", "ZjrdP0dl"]}' \
    > test.out 2>&1
eval_tap $? 287 'PublicGetUsersPlatformInfosV3' test.out

#- 288 ResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam resetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "1oviAwAZ", "emailAddress": "V54ibLu1", "languageTag": "uauuq7Dy", "newPassword": "aMVvc08p"}' \
    > test.out 2>&1
eval_tap $? 288 'ResetPasswordV3' test.out

#- 289 PublicGetUserByUserIdV3
eval_tap 0 289 'PublicGetUserByUserIdV3 # SKIP deprecated' test.out

#- 290 PublicGetUserBanHistoryV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserBanHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'cUMsS5q4' \
    --activeOnly  \
    --after 'Ypbni2Dk' \
    --before 'WsU0X6lu' \
    --limit '58' \
    > test.out 2>&1
eval_tap $? 290 'PublicGetUserBanHistoryV3' test.out

#- 291 PublicListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'VFWJlPud' \
    > test.out 2>&1
eval_tap $? 291 'PublicListUserAllPlatformAccountsDistinctV3' test.out

#- 292 PublicGetUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'S8OUvqcC' \
    > test.out 2>&1
eval_tap $? 292 'PublicGetUserInformationV3' test.out

#- 293 PublicGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'NBJQX08o' \
    --after '0.15369552086876692' \
    --before '0.5285921089467746' \
    --limit '24' \
    > test.out 2>&1
eval_tap $? 293 'PublicGetUserLoginHistoriesV3' test.out

#- 294 PublicGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Mk43mGlW' \
    --after '0NqnNPj0' \
    --before '1FKrZqGY' \
    --limit '76' \
    --platformId '48lF4TCL' \
    > test.out 2>&1
eval_tap $? 294 'PublicGetUserPlatformAccountsV3' test.out

#- 295 PublicListJusticePlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicListJusticePlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'jP2vWOiV' \
    > test.out 2>&1
eval_tap $? 295 'PublicListJusticePlatformAccountsV3' test.out

#- 296 PublicLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam publicLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'NLiGgA3x' \
    --body '{"platformId": "8vmEW5bm", "platformUserId": "Oq1WjLkG"}' \
    > test.out 2>&1
eval_tap $? 296 'PublicLinkPlatformAccount' test.out

#- 297 PublicForceLinkPlatformWithProgression
./ng net.accelbyte.sdk.cli.Main iam publicForceLinkPlatformWithProgression \
    --namespace "$AB_NAMESPACE" \
    --userId '0p9cBBJ8' \
    --body '{"chosenNamespaces": ["7zsveozS", "eIf8mWwJ", "dprwOMMx"], "requestId": "jeqxZjpH"}' \
    > test.out 2>&1
eval_tap $? 297 'PublicForceLinkPlatformWithProgression' test.out

#- 298 PublicGetPublisherUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetPublisherUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'mCZgmUHy' \
    > test.out 2>&1
eval_tap $? 298 'PublicGetPublisherUserV3' test.out

#- 299 PublicValidateUserByUserIDAndPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserByUserIDAndPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'IdiAQy8z' \
    --password 'FK9nKZoE' \
    > test.out 2>&1
eval_tap $? 299 'PublicValidateUserByUserIDAndPasswordV3' test.out

#- 300 PublicGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRolesV3 \
    --after 'OkrLYXIf' \
    --before 'uVdphWc0' \
    --isWildcard  \
    --limit '64' \
    > test.out 2>&1
eval_tap $? 300 'PublicGetRolesV3' test.out

#- 301 PublicGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRoleV3 \
    --roleId 'MEsW51Bl' \
    > test.out 2>&1
eval_tap $? 301 'PublicGetRoleV3' test.out

#- 302 PublicGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyUserV3 \
    --includeAllPlatforms  \
    > test.out 2>&1
eval_tap $? 302 'PublicGetMyUserV3' test.out

#- 303 PublicGetLinkHeadlessAccountToMyAccountConflictV3
./ng net.accelbyte.sdk.cli.Main iam publicGetLinkHeadlessAccountToMyAccountConflictV3 \
    --oneTimeLinkCode 'ddrqq580' \
    > test.out 2>&1
eval_tap $? 303 'PublicGetLinkHeadlessAccountToMyAccountConflictV3' test.out

#- 304 LinkHeadlessAccountToMyAccountV3
./ng net.accelbyte.sdk.cli.Main iam linkHeadlessAccountToMyAccountV3 \
    --body '{"chosenNamespaces": ["xM1SHyxt", "YVeULnkO", "9XALqMV7"], "oneTimeLinkCode": "ycktMVFz"}' \
    > test.out 2>&1
eval_tap $? 304 'LinkHeadlessAccountToMyAccountV3' test.out

#- 305 PublicSendVerificationLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationLinkV3 \
    --body '{"languageTag": "LEkgBdbF"}' \
    > test.out 2>&1
eval_tap $? 305 'PublicSendVerificationLinkV3' test.out

#- 306 PublicVerifyUserByLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyUserByLinkV3 \
    --code 'Ai5At4ry' \
    > test.out 2>&1
eval_tap $? 306 'PublicVerifyUserByLinkV3' test.out

#- 307 PlatformAuthenticateSAMLV3Handler
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticateSAMLV3Handler \
    --platformId 'GpiqDVAG' \
    --code 'RHe7OvQR' \
    --error 'ewBewvec' \
    --state 'gaMfrTfa' \
    > test.out 2>&1
eval_tap $? 307 'PlatformAuthenticateSAMLV3Handler' test.out

#- 308 LoginSSOClient
./ng net.accelbyte.sdk.cli.Main iam loginSSOClient \
    --platformId 'bVAdAZPE' \
    --payload 'nKBVkf6S' \
    > test.out 2>&1
eval_tap $? 308 'LoginSSOClient' test.out

#- 309 LogoutSSOClient
./ng net.accelbyte.sdk.cli.Main iam logoutSSOClient \
    --platformId '5gw8KWZw' \
    > test.out 2>&1
eval_tap $? 309 'LogoutSSOClient' test.out

#- 310 RequestTargetTokenResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTargetTokenResponseV3 \
    --additionalData 'sW4pfBiD' \
    --code 'HquZrDZH' \
    > test.out 2>&1
eval_tap $? 310 'RequestTargetTokenResponseV3' test.out

#- 311 AdminListInvitationHistoriesV4
./ng net.accelbyte.sdk.cli.Main iam adminListInvitationHistoriesV4 \
    --limit '68' \
    --namespace "$AB_NAMESPACE" \
    --offset '25' \
    > test.out 2>&1
eval_tap $? 311 'AdminListInvitationHistoriesV4' test.out

#- 312 AdminGetDevicesByUserV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDevicesByUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'tsDNHzBN' \
    > test.out 2>&1
eval_tap $? 312 'AdminGetDevicesByUserV4' test.out

#- 313 AdminGetBannedDevicesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedDevicesV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceType 'PDwGpNZg' \
    --endDate 'kjGbG1on' \
    --limit '87' \
    --offset '37' \
    --startDate '4Xe3cLBc' \
    > test.out 2>&1
eval_tap $? 313 'AdminGetBannedDevicesV4' test.out

#- 314 AdminGetUserDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeviceBansV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'PHdgjexD' \
    > test.out 2>&1
eval_tap $? 314 'AdminGetUserDeviceBansV4' test.out

#- 315 AdminBanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminBanDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"comment": "G1ZqUmrL", "deviceId": "f6iYL5EW", "deviceType": "H4aiIVxq", "enabled": false, "endDate": "ONa8zWYX", "ext": {"kdDgmZ2G": {}, "0eHgOgSX": {}, "fdV3V8hc": {}}, "reason": "zRJ9GK1o"}' \
    > test.out 2>&1
eval_tap $? 315 'AdminBanDeviceV4' test.out

#- 316 AdminGetDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBanV4 \
    --banId '7gRas5ll' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 316 'AdminGetDeviceBanV4' test.out

#- 317 AdminUpdateDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateDeviceBanV4 \
    --banId 'UEPsGyxy' \
    --namespace "$AB_NAMESPACE" \
    --body '{"enabled": true}' \
    > test.out 2>&1
eval_tap $? 317 'AdminUpdateDeviceBanV4' test.out

#- 318 AdminGenerateReportV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateReportV4 \
    --namespace "$AB_NAMESPACE" \
    --endDate 'UZhszfl8' \
    --startDate 'yIsMCrGX' \
    --deviceType 'MGGrRCMe' \
    > test.out 2>&1
eval_tap $? 318 'AdminGenerateReportV4' test.out

#- 319 AdminGetDeviceTypesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceTypesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 319 'AdminGetDeviceTypesV4' test.out

#- 320 AdminGetDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBansV4 \
    --deviceId '7VIDic9X' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 320 'AdminGetDeviceBansV4' test.out

#- 321 AdminDecryptDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminDecryptDeviceV4 \
    --deviceId 'g9HShasJ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 321 'AdminDecryptDeviceV4' test.out

#- 322 AdminUnbanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminUnbanDeviceV4 \
    --deviceId 'rQ5QZVcZ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 322 'AdminUnbanDeviceV4' test.out

#- 323 AdminGetUsersByDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUsersByDeviceV4 \
    --deviceId 'fEPiirCQ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 323 'AdminGetUsersByDeviceV4' test.out

#- 324 AdminGetNamespaceInvitationHistoryV4
./ng net.accelbyte.sdk.cli.Main iam adminGetNamespaceInvitationHistoryV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 324 'AdminGetNamespaceInvitationHistoryV4' test.out

#- 325 AdminGetNamespaceUserInvitationHistoryV4
./ng net.accelbyte.sdk.cli.Main iam adminGetNamespaceUserInvitationHistoryV4 \
    --namespace "$AB_NAMESPACE" \
    --limit '79' \
    --offset '32' \
    > test.out 2>&1
eval_tap $? 325 'AdminGetNamespaceUserInvitationHistoryV4' test.out

#- 326 AdminCreateTestUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateTestUsersV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 94}' \
    > test.out 2>&1
eval_tap $? 326 'AdminCreateTestUsersV4' test.out

#- 327 AdminCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "ffbV4TvD", "policyId": "MjR7JbUw", "policyVersionId": "BfIY6GjJ"}, {"isAccepted": false, "localizedPolicyVersionId": "r9uf9h69", "policyId": "a7q050WB", "policyVersionId": "VAEaHR6m"}, {"isAccepted": true, "localizedPolicyVersionId": "IR1gRtdf", "policyId": "K2hSN5Zr", "policyVersionId": "PkfOFqMl"}], "authType": "EMAILPASSWD", "code": "p6tP5LRP", "country": "k8yLef7f", "dateOfBirth": "SWzxIrVk", "displayName": "sqS6Ybms", "emailAddress": "o9moDR5l", "password": "LaBHT2Uu", "passwordMD5Sum": "WazvyhTv", "reachMinimumAge": false, "uniqueDisplayName": "zRXqjwDe", "username": "JckwgIPo"}' \
    > test.out 2>&1
eval_tap $? 327 'AdminCreateUserV4' test.out

#- 328 AdminBulkUpdateUserAccountTypeV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateUserAccountTypeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"testAccount": false, "userIds": ["JzZx6DZW", "w6YshdRy", "ABTIQrkO"]}' \
    > test.out 2>&1
eval_tap $? 328 'AdminBulkUpdateUserAccountTypeV4' test.out

#- 329 AdminBulkCheckValidUserIDV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkCheckValidUserIDV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["Z0SKzlkv", "KSsf6zki", "x34NIQ1Z"]}' \
    > test.out 2>&1
eval_tap $? 329 'AdminBulkCheckValidUserIDV4' test.out

#- 330 AdminUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'PZsTdCMm' \
    --body '{"avatarUrl": "xAANKhYO", "country": "R2obQFoj", "dateOfBirth": "1viWHxOa", "displayName": "KKGZfEiu", "languageTag": "mFQ7c6dT", "skipLoginQueue": true, "uniqueDisplayName": "9u3TycQi", "userName": "zc3YIDvp"}' \
    > test.out 2>&1
eval_tap $? 330 'AdminUpdateUserV4' test.out

#- 331 AdminUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'f3EPFV6p' \
    --body '{"code": "OGMjM5d6", "emailAddress": "wrVb1YLt"}' \
    > test.out 2>&1
eval_tap $? 331 'AdminUpdateUserEmailAddressV4' test.out

#- 332 AdminDisableUserMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableUserMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'JeQbqQ69' \
    > test.out 2>&1
eval_tap $? 332 'AdminDisableUserMFAV4' test.out

#- 333 AdminListUserRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminListUserRolesV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '6RN4FbdU' \
    > test.out 2>&1
eval_tap $? 333 'AdminListUserRolesV4' test.out

#- 334 AdminUpdateUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'PbJBkdJ6' \
    --body '{"assignedNamespaces": ["wOskK5HJ", "x15u3J7H", "u0FYZRtq"], "roleId": "6l2URZLS"}' \
    > test.out 2>&1
eval_tap $? 334 'AdminUpdateUserRoleV4' test.out

#- 335 AdminAddUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ql7Yd62p' \
    --body '{"assignedNamespaces": ["WucwhfM7", "ZvuUSp6R", "bOGzFTfl"], "roleId": "qUngkcib"}' \
    > test.out 2>&1
eval_tap $? 335 'AdminAddUserRoleV4' test.out

#- 336 AdminRemoveUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRemoveUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'tNP4OQIz' \
    --body '{"assignedNamespaces": ["bhZVnmGo", "KOztNxbw", "dVnmmukJ"], "roleId": "AiNCKw79"}' \
    > test.out 2>&1
eval_tap $? 336 'AdminRemoveUserRoleV4' test.out

#- 337 AdminGetRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV4 \
    --adminRole  \
    --isWildcard  \
    --limit '81' \
    --offset '82' \
    > test.out 2>&1
eval_tap $? 337 'AdminGetRolesV4' test.out

#- 338 AdminCreateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV4 \
    --body '{"adminRole": true, "deletable": true, "isWildcard": true, "roleName": "NerWJdXI"}' \
    > test.out 2>&1
eval_tap $? 338 'AdminCreateRoleV4' test.out

#- 339 AdminGetRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV4 \
    --roleId 'uNCELA8Z' \
    > test.out 2>&1
eval_tap $? 339 'AdminGetRoleV4' test.out

#- 340 AdminDeleteRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV4 \
    --roleId '6DiAZNtF' \
    > test.out 2>&1
eval_tap $? 340 'AdminDeleteRoleV4' test.out

#- 341 AdminUpdateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV4 \
    --roleId '0HnVC3V3' \
    --body '{"adminRole": false, "deletable": false, "isWildcard": true, "roleName": "CbpesXdu"}' \
    > test.out 2>&1
eval_tap $? 341 'AdminUpdateRoleV4' test.out

#- 342 AdminUpdateRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV4 \
    --roleId 'ZIdhsrTE' \
    --body '{"permissions": [{"action": 56, "resource": "6bFex0Mn", "schedAction": 53, "schedCron": "noreQN9h", "schedRange": ["f37belJM", "GgWOVnkR", "PmzbqPH9"]}, {"action": 28, "resource": "v0bohjMd", "schedAction": 31, "schedCron": "WnkWcltj", "schedRange": ["OGCxdUxQ", "8y3yOEcN", "hqJfOkoo"]}, {"action": 65, "resource": "ZuMiz4c7", "schedAction": 34, "schedCron": "Kann18Ci", "schedRange": ["JP1SAqSD", "YsYXdarG", "Hr4vqHnZ"]}]}' \
    > test.out 2>&1
eval_tap $? 342 'AdminUpdateRolePermissionsV4' test.out

#- 343 AdminAddRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV4 \
    --roleId '1TX4pf7b' \
    --body '{"permissions": [{"action": 61, "resource": "YTUpbLlR", "schedAction": 55, "schedCron": "6wmTHW00", "schedRange": ["KzetWWzA", "4gP9F5Bp", "ZS203YD6"]}, {"action": 74, "resource": "AMP3TBXh", "schedAction": 43, "schedCron": "yVDegSTT", "schedRange": ["UUP2qcLy", "KN7Kjjyq", "FDzKN2Zu"]}, {"action": 14, "resource": "ImyrY6WQ", "schedAction": 15, "schedCron": "rokG3zsx", "schedRange": ["WdcGZOCv", "yBkF87Vs", "yVaJMpUd"]}]}' \
    > test.out 2>&1
eval_tap $? 343 'AdminAddRolePermissionsV4' test.out

#- 344 AdminDeleteRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV4 \
    --roleId 'hMPd9n26' \
    --body '["2vKaMPzX", "ag6br6mP", "jfjDbCTC"]' \
    > test.out 2>&1
eval_tap $? 344 'AdminDeleteRolePermissionsV4' test.out

#- 345 AdminListAssignedUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminListAssignedUsersV4 \
    --roleId 'qVzGmQeA' \
    --after '2bxTRgKK' \
    --before 'rre77QUj' \
    --limit '53' \
    > test.out 2>&1
eval_tap $? 345 'AdminListAssignedUsersV4' test.out

#- 346 AdminAssignUserToRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAssignUserToRoleV4 \
    --roleId '0GfV0sjd' \
    --body '{"assignedNamespaces": ["ODF62cxf", "5uQKFZjN", "uu7tFDOx"], "namespace": "DKvJ2ste", "userId": "y3jPZWFV"}' \
    > test.out 2>&1
eval_tap $? 346 'AdminAssignUserToRoleV4' test.out

#- 347 AdminRevokeUserFromRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRevokeUserFromRoleV4 \
    --roleId 'vgc3oueB' \
    --body '{"namespace": "0UD8tXN0", "userId": "ALxDre4f"}' \
    > test.out 2>&1
eval_tap $? 347 'AdminRevokeUserFromRoleV4' test.out

#- 348 AdminInviteUserNewV4
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserNewV4 \
    --body '{"assignedNamespaces": ["Yq9lMx1A", "UdZP2qKz", "v4HJOCiH"], "emailAddresses": ["rlru32l0", "aZUS8LZQ", "8oz0yUjA"], "isAdmin": false, "isNewStudio": false, "languageTag": "Effwqf7Z", "namespace": "Lt2LaCpc", "roleId": "PJ0eMsrp"}' \
    > test.out 2>&1
eval_tap $? 348 'AdminInviteUserNewV4' test.out

#- 349 AdminUpdateMyUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateMyUserV4 \
    --body '{"avatarUrl": "crAfDfqD", "country": "b7PDjTnS", "dateOfBirth": "3Ir1vTC6", "displayName": "GvmMY308", "languageTag": "I6yvjA0w", "skipLoginQueue": false, "uniqueDisplayName": "m6zzJ4gn", "userName": "JqBXvZWO"}' \
    > test.out 2>&1
eval_tap $? 349 'AdminUpdateMyUserV4' test.out

#- 350 AdminDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyAuthenticatorV4 \
    --body '{"mfaToken": "R9hWfPsW"}' \
    > test.out 2>&1
eval_tap $? 350 'AdminDisableMyAuthenticatorV4' test.out

#- 351 AdminEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyAuthenticatorV4 \
    --code 'Xxc9ZXHo' \
    > test.out 2>&1
eval_tap $? 351 'AdminEnableMyAuthenticatorV4' test.out

#- 352 AdminGenerateMyAuthenticatorKeyV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateMyAuthenticatorKeyV4 \
    > test.out 2>&1
eval_tap $? 352 'AdminGenerateMyAuthenticatorKeyV4' test.out

#- 353 AdminGetMyBackupCodesV4
eval_tap 0 353 'AdminGetMyBackupCodesV4 # SKIP deprecated' test.out

#- 354 AdminGenerateMyBackupCodesV4
eval_tap 0 354 'AdminGenerateMyBackupCodesV4 # SKIP deprecated' test.out

#- 355 AdminDisableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyBackupCodesV4 \
    --body '{"mfaToken": "JVCrPHrd"}' \
    > test.out 2>&1
eval_tap $? 355 'AdminDisableMyBackupCodesV4' test.out

#- 356 AdminDownloadMyBackupCodesV4
eval_tap 0 356 'AdminDownloadMyBackupCodesV4 # SKIP deprecated' test.out

#- 357 AdminEnableMyBackupCodesV4
eval_tap 0 357 'AdminEnableMyBackupCodesV4 # SKIP deprecated' test.out

#- 358 AdminGetBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBackupCodesV4 \
    --languageTag 'wN8qvxKV' \
    > test.out 2>&1
eval_tap $? 358 'AdminGetBackupCodesV4' test.out

#- 359 AdminGenerateBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateBackupCodesV4 \
    --languageTag 'JQPOSZdg' \
    > test.out 2>&1
eval_tap $? 359 'AdminGenerateBackupCodesV4' test.out

#- 360 AdminEnableBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableBackupCodesV4 \
    --languageTag 'Cr08LRnC' \
    > test.out 2>&1
eval_tap $? 360 'AdminEnableBackupCodesV4' test.out

#- 361 AdminChallengeMyMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminChallengeMyMFAV4 \
    --code 'np6iCyxr' \
    --factor 'kRE9WBOn' \
    > test.out 2>&1
eval_tap $? 361 'AdminChallengeMyMFAV4' test.out

#- 362 AdminSendMyMFAEmailCodeV4
./ng net.accelbyte.sdk.cli.Main iam adminSendMyMFAEmailCodeV4 \
    --action 'YFBkesIT' \
    > test.out 2>&1
eval_tap $? 362 'AdminSendMyMFAEmailCodeV4' test.out

#- 363 AdminDisableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyEmailV4 \
    --body '{"mfaToken": "LYVAMi5U"}' \
    > test.out 2>&1
eval_tap $? 363 'AdminDisableMyEmailV4' test.out

#- 364 AdminEnableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyEmailV4 \
    --code 'daDHesj1' \
    > test.out 2>&1
eval_tap $? 364 'AdminEnableMyEmailV4' test.out

#- 365 AdminGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyEnabledFactorsV4 \
    > test.out 2>&1
eval_tap $? 365 'AdminGetMyEnabledFactorsV4' test.out

#- 366 AdminMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam adminMakeFactorMyDefaultV4 \
    --factor 'egvOUtQu' \
    > test.out 2>&1
eval_tap $? 366 'AdminMakeFactorMyDefaultV4' test.out

#- 367 AdminGetMyMFAStatusV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyMFAStatusV4 \
    > test.out 2>&1
eval_tap $? 367 'AdminGetMyMFAStatusV4' test.out

#- 368 AdminInviteUserV4
eval_tap 0 368 'AdminInviteUserV4 # SKIP deprecated' test.out

#- 369 AuthenticationWithPlatformLinkV4
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV4 \
    --extendExp  \
    --clientId 'j5c6DzOk' \
    --linkingToken 'u1dhIidY' \
    --password '9QU7My1S' \
    --username 'SkAXLPw9' \
    > test.out 2>&1
eval_tap $? 369 'AuthenticationWithPlatformLinkV4' test.out

#- 370 GenerateTokenByNewHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV4 \
    --additionalData 'hr5gfz44' \
    --extendExp  \
    --linkingToken 'c4WfLstK' \
    > test.out 2>&1
eval_tap $? 370 'GenerateTokenByNewHeadlessAccountV4' test.out

#- 371 Verify2faCodeV4
./ng net.accelbyte.sdk.cli.Main iam verify2faCodeV4 \
    --code '3kCX8L5x' \
    --factor 'NUQvyXrm' \
    --mfaToken 'Lo8740zH' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 371 'Verify2faCodeV4' test.out

#- 372 PlatformTokenGrantV4
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV4 \
    --platformId 'KGdHWylA' \
    --codeChallenge 'BivEyZOK' \
    --codeChallengeMethod 'plain' \
    --additionalData 'yTXR4UdY' \
    --clientId 'ifSFT4Wa' \
    --createHeadless  \
    --deviceId '8wdfuqw6' \
    --macAddress 'mNZL8W6p' \
    --platformToken 'p8WfSQd3' \
    --serviceLabel '0.6037384072164921' \
    --skipSetCookie  \
    > test.out 2>&1
eval_tap $? 372 'PlatformTokenGrantV4' test.out

#- 373 SimultaneousLoginV4
./ng net.accelbyte.sdk.cli.Main iam simultaneousLoginV4 \
    --codeChallenge '93IWUGaJ' \
    --codeChallengeMethod 'plain' \
    --simultaneousPlatform 'FFYDqGwl' \
    --simultaneousTicket '20M5D4qa' \
    --nativePlatform 'steam' \
    --nativePlatformTicket 'vlG0Jg2U' \
    > test.out 2>&1
eval_tap $? 373 'SimultaneousLoginV4' test.out

#- 374 TokenGrantV4
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV4 \
    --codeChallenge 's9vVDxR1' \
    --codeChallengeMethod 'plain' \
    --additionalData 'zqMsUZI3' \
    --clientId 'YiNQ0NoJ' \
    --clientSecret '4zUIXpPt' \
    --code 'Hj98AkfE' \
    --codeVerifier 'SAq8n6gt' \
    --extendNamespace 'TMnjiP3h' \
    --extendExp  \
    --loginQueueTicket 'ymAR5ezF' \
    --password 'XkwxV8Sf' \
    --redirectUri 'ozqUuFH1' \
    --refreshToken 'B1zPc0XM' \
    --username 'cnmrouu2' \
    --grantType 'urn:ietf:params:oauth:grant-type:login_queue_ticket' \
    > test.out 2>&1
eval_tap $? 374 'TokenGrantV4' test.out

#- 375 RequestTargetTokenResponseV4
./ng net.accelbyte.sdk.cli.Main iam requestTargetTokenResponseV4 \
    --additionalData 'cJ0nLaKh' \
    --code 'RDS7T5K1' \
    > test.out 2>&1
eval_tap $? 375 'RequestTargetTokenResponseV4' test.out

#- 376 PublicListUserIDByPlatformUserIDsV4
./ng net.accelbyte.sdk.cli.Main iam publicListUserIDByPlatformUserIDsV4 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'GdI3yRjh' \
    --rawPUID  \
    --body '{"platformUserIds": ["Dh2ZjARx", "h82mIq81", "rDIal91r"]}' \
    > test.out 2>&1
eval_tap $? 376 'PublicListUserIDByPlatformUserIDsV4' test.out

#- 377 PublicCreateTestUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateTestUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "XsptgWfB", "policyId": "mMePLnCy", "policyVersionId": "ztmX3Q7f"}, {"isAccepted": true, "localizedPolicyVersionId": "YWojbbi1", "policyId": "QWvfaOM7", "policyVersionId": "rbYCBUcK"}, {"isAccepted": true, "localizedPolicyVersionId": "Sz9wXBcU", "policyId": "shMcu8Nf", "policyVersionId": "YFx58l4r"}], "authType": "EMAILPASSWD", "country": "ldjHDyyb", "dateOfBirth": "jkjQBSPK", "displayName": "tPvgXtTA", "emailAddress": "46KVF1Hw", "password": "iQSLsG8y", "passwordMD5Sum": "e93hnRlO", "uniqueDisplayName": "05TIzgNF", "username": "MmKTiRzP", "verified": true}' \
    > test.out 2>&1
eval_tap $? 377 'PublicCreateTestUserV4' test.out

#- 378 PublicCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "sgyBrYUG", "policyId": "TYhy1VZg", "policyVersionId": "hPgIcI0x"}, {"isAccepted": true, "localizedPolicyVersionId": "vIbue7J6", "policyId": "az3gAF2E", "policyVersionId": "s6GaGykw"}, {"isAccepted": true, "localizedPolicyVersionId": "Hfzb0NL5", "policyId": "6Bztlcf3", "policyVersionId": "ylhNs8Nd"}], "authType": "EMAILPASSWD", "code": "U9B77VGc", "country": "C973zfq4", "dateOfBirth": "2dVw0UFH", "displayName": "YxEZP4zL", "emailAddress": "qRWWVEEL", "password": "8J45rDI3", "passwordMD5Sum": "P9R0wDVy", "reachMinimumAge": true, "uniqueDisplayName": "kXjfhEXF", "username": "K0Joma25"}' \
    > test.out 2>&1
eval_tap $? 378 'PublicCreateUserV4' test.out

#- 379 CreateUserFromInvitationV4
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV4 \
    --invitationId '3jfiff8c' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "s7DPptuP", "policyId": "jzaplDxx", "policyVersionId": "TnBGEVQY"}, {"isAccepted": false, "localizedPolicyVersionId": "nGTL9Brj", "policyId": "zgDmOagn", "policyVersionId": "Wip7XidW"}, {"isAccepted": true, "localizedPolicyVersionId": "cvrOneed", "policyId": "dACuMRAs", "policyVersionId": "aTn1AvzT"}], "authType": "EMAILPASSWD", "code": "Zf77zGoc", "country": "Qi18BEco", "dateOfBirth": "ScikRWUd", "displayName": "X06fmY82", "emailAddress": "cr2EPmTR", "password": "Vh5u6ISV", "passwordMD5Sum": "EPu5nUVT", "reachMinimumAge": false, "uniqueDisplayName": "mrChuL2g", "username": "A5gXK9zL"}' \
    > test.out 2>&1
eval_tap $? 379 'CreateUserFromInvitationV4' test.out

#- 380 PublicUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "RWDIiY3b", "country": "PGDXiXWe", "dateOfBirth": "XGcF9XEQ", "displayName": "QuOVQ0BF", "languageTag": "5DjN16Ql", "uniqueDisplayName": "tqLZuYlA", "userName": "fol1oN1p"}' \
    > test.out 2>&1
eval_tap $? 380 'PublicUpdateUserV4' test.out

#- 381 PublicUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "DBi3K9wc", "emailAddress": "WN1dYSqD"}' \
    > test.out 2>&1
eval_tap $? 381 'PublicUpdateUserEmailAddressV4' test.out

#- 382 PublicUpgradeHeadlessAccountWithVerificationCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountWithVerificationCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "gX5q9TdK", "country": "89xTG77F", "dateOfBirth": "qDrNValH", "displayName": "DAAk4uMa", "emailAddress": "JG9p9aqx", "password": "TZrMgQ8y", "reachMinimumAge": true, "uniqueDisplayName": "XWoTwFLP", "username": "WnWMJWst", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 382 'PublicUpgradeHeadlessAccountWithVerificationCodeV4' test.out

#- 383 PublicUpgradeHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "wB2Tdd2I", "password": "fvT3t0Av", "username": "PYSonggL"}' \
    > test.out 2>&1
eval_tap $? 383 'PublicUpgradeHeadlessAccountV4' test.out

#- 384 PublicDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"mfaToken": "JVSfMH6M"}' \
    > test.out 2>&1
eval_tap $? 384 'PublicDisableMyAuthenticatorV4' test.out

#- 385 PublicEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'pDnUv4o3' \
    > test.out 2>&1
eval_tap $? 385 'PublicEnableMyAuthenticatorV4' test.out

#- 386 PublicGenerateMyAuthenticatorKeyV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateMyAuthenticatorKeyV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 386 'PublicGenerateMyAuthenticatorKeyV4' test.out

#- 387 PublicGetMyBackupCodesV4
eval_tap 0 387 'PublicGetMyBackupCodesV4 # SKIP deprecated' test.out

#- 388 PublicGenerateMyBackupCodesV4
eval_tap 0 388 'PublicGenerateMyBackupCodesV4 # SKIP deprecated' test.out

#- 389 PublicDisableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"mfaToken": "NhrSG3um"}' \
    > test.out 2>&1
eval_tap $? 389 'PublicDisableMyBackupCodesV4' test.out

#- 390 PublicDownloadMyBackupCodesV4
eval_tap 0 390 'PublicDownloadMyBackupCodesV4 # SKIP deprecated' test.out

#- 391 PublicEnableMyBackupCodesV4
eval_tap 0 391 'PublicEnableMyBackupCodesV4 # SKIP deprecated' test.out

#- 392 PublicGetBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGetBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --languageTag 'F0npCB9n' \
    > test.out 2>&1
eval_tap $? 392 'PublicGetBackupCodesV4' test.out

#- 393 PublicGenerateBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --languageTag 'wvVywXDn' \
    > test.out 2>&1
eval_tap $? 393 'PublicGenerateBackupCodesV4' test.out

#- 394 PublicEnableBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --languageTag 'Y4wxaLZX' \
    > test.out 2>&1
eval_tap $? 394 'PublicEnableBackupCodesV4' test.out

#- 395 PublicChallengeMyMFAV4
./ng net.accelbyte.sdk.cli.Main iam publicChallengeMyMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'cU0D75Oo' \
    --factor 'KDmEsOfI' \
    > test.out 2>&1
eval_tap $? 395 'PublicChallengeMyMFAV4' test.out

#- 396 PublicRemoveTrustedDeviceV4
./ng net.accelbyte.sdk.cli.Main iam publicRemoveTrustedDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceToken '9pqoneWh' \
    > test.out 2>&1
eval_tap $? 396 'PublicRemoveTrustedDeviceV4' test.out

#- 397 PublicSendMyMFAEmailCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicSendMyMFAEmailCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --action '4Awnka2f' \
    > test.out 2>&1
eval_tap $? 397 'PublicSendMyMFAEmailCodeV4' test.out

#- 398 PublicDisableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyEmailV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"mfaToken": "hYCfDxDH"}' \
    > test.out 2>&1
eval_tap $? 398 'PublicDisableMyEmailV4' test.out

#- 399 PublicEnableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyEmailV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'EXFAOxOv' \
    > test.out 2>&1
eval_tap $? 399 'PublicEnableMyEmailV4' test.out

#- 400 PublicGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam publicGetMyEnabledFactorsV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 400 'PublicGetMyEnabledFactorsV4' test.out

#- 401 PublicMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam publicMakeFactorMyDefaultV4 \
    --namespace "$AB_NAMESPACE" \
    --factor 'kpEQUJme' \
    > test.out 2>&1
eval_tap $? 401 'PublicMakeFactorMyDefaultV4' test.out

#- 402 PublicGetMyMFAStatusV4
./ng net.accelbyte.sdk.cli.Main iam publicGetMyMFAStatusV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 402 'PublicGetMyMFAStatusV4' test.out

#- 403 PublicGetUserPublicInfoByUserIdV4
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPublicInfoByUserIdV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ExJsIfc4' \
    > test.out 2>&1
eval_tap $? 403 'PublicGetUserPublicInfoByUserIdV4' test.out

#- 404 PublicInviteUserV4
./ng net.accelbyte.sdk.cli.Main iam publicInviteUserV4 \
    --body '{"additionalData": "0LvKkdPw", "emailAddress": "OUqDc2Vy", "languageTag": "6sdYMeZb", "namespace": "jQwoo3YB", "namespaceDisplayName": "pfzIi2mN"}' \
    > test.out 2>&1
eval_tap $? 404 'PublicInviteUserV4' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
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
echo "1..435"

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
    --body '{"modules": [{"docLink": "r5DgeKDl", "groups": [{"group": "6QDNC6K5", "groupId": "JI5VqsPD", "permissions": [{"allowedActions": [68, 55, 85], "resource": "tOQdx9aa"}, {"allowedActions": [45, 23, 89], "resource": "Rj1kwtlB"}, {"allowedActions": [78, 11, 35], "resource": "844N1ueF"}]}, {"group": "atKgU4fT", "groupId": "HpipsxwL", "permissions": [{"allowedActions": [22, 88, 65], "resource": "bGrURv97"}, {"allowedActions": [90, 7, 78], "resource": "3pkk2LRx"}, {"allowedActions": [28, 8, 63], "resource": "oktR63OK"}]}, {"group": "ANTAkajk", "groupId": "lg6HIw2c", "permissions": [{"allowedActions": [16, 6, 74], "resource": "ETpmEt6J"}, {"allowedActions": [82, 56, 16], "resource": "RAF1dDH4"}, {"allowedActions": [11, 81, 44], "resource": "hdZvLdiB"}]}], "module": "0giSCuDf", "moduleId": "Bc6WcaCl"}, {"docLink": "buc9dabv", "groups": [{"group": "LIiamJs3", "groupId": "3tXhIuNU", "permissions": [{"allowedActions": [50, 48, 60], "resource": "Ef1qnejf"}, {"allowedActions": [49, 57, 9], "resource": "aUUJUsiv"}, {"allowedActions": [46, 94, 60], "resource": "CZaGVYTz"}]}, {"group": "JPSVP10Z", "groupId": "mlYxTON5", "permissions": [{"allowedActions": [75, 85, 27], "resource": "hr2qiSye"}, {"allowedActions": [93, 59, 33], "resource": "qh1CfSYM"}, {"allowedActions": [67, 77, 12], "resource": "HWr5nfby"}]}, {"group": "M2zbJeOI", "groupId": "6bemrfxS", "permissions": [{"allowedActions": [13, 9, 98], "resource": "oDiM2sWX"}, {"allowedActions": [45, 73, 70], "resource": "go4vl4f6"}, {"allowedActions": [8, 90, 21], "resource": "Z4g4Am0p"}]}], "module": "Lcjhle1e", "moduleId": "LpYcdrM9"}, {"docLink": "FrgWJFnj", "groups": [{"group": "KipgZ6k8", "groupId": "HD2Z21a6", "permissions": [{"allowedActions": [44, 18, 87], "resource": "nTeI3Ows"}, {"allowedActions": [96, 19, 23], "resource": "PQOErFkS"}, {"allowedActions": [88, 80, 7], "resource": "JcQvdNpD"}]}, {"group": "lnEyNFrV", "groupId": "UECD6ker", "permissions": [{"allowedActions": [3, 0, 35], "resource": "V2ZIPTvS"}, {"allowedActions": [100, 50, 26], "resource": "RTleDbSM"}, {"allowedActions": [37, 99, 62], "resource": "55KccKDZ"}]}, {"group": "SBFLgmBS", "groupId": "buiE9vFU", "permissions": [{"allowedActions": [70, 73, 58], "resource": "aEDWq0W3"}, {"allowedActions": [96, 50, 29], "resource": "pW6EtAyo"}, {"allowedActions": [36, 55, 17], "resource": "yZ1yzAC8"}]}], "module": "sKLzqwOz", "moduleId": "1OB9Ru7Z"}]}' \
    > test.out 2>&1
eval_tap $? 109 'AdminUpdateAvailablePermissionsByModule' test.out

#- 110 AdminDeleteConfigPermissionsByGroup
./ng net.accelbyte.sdk.cli.Main iam adminDeleteConfigPermissionsByGroup \
    --forceDelete  \
    --body '{"groupId": "7vAg6fuy", "moduleId": "DOSTqKrC"}' \
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
    --body '[{"field": "6AioiON6", "validation": {"allowAllSpecialCharacters": true, "allowDigit": false, "allowLetter": false, "allowSpace": false, "allowUnicode": true, "avatarConfig": {"allowedPrefixes": ["dLkH3R5G", "qtmI2aoG", "UNKs3xOC"], "preferRegex": true, "regex": "DaW28tQn"}, "blockedWord": ["FPGJGhWO", "Mdlm57QW", "65l6hcNd"], "description": [{"language": "aGVTLnK8", "message": ["sSO3vRGP", "Ovlnhtfa", "2XUMW0WU"]}, {"language": "PR0fJVkO", "message": ["aFOPhai4", "6PfgeUyr", "iLQiMZI4"]}, {"language": "uf26b2Kw", "message": ["9nC54T2h", "TckBjUb1", "mCHFoSWF"]}], "isCustomRegex": true, "letterCase": "etcqnl5c", "maxLength": 92, "maxRepeatingAlphaNum": 80, "maxRepeatingSpecialCharacter": 38, "minCharType": 27, "minLength": 58, "profanityFilter": "HahTJhhW", "regex": "m6xcJQep", "specialCharacterLocation": "IqmhxEJv", "specialCharacters": ["FpMfF3x6", "wlKXOJXw", "RqI63jyc"]}}, {"field": "IIUskI9y", "validation": {"allowAllSpecialCharacters": true, "allowDigit": true, "allowLetter": true, "allowSpace": false, "allowUnicode": false, "avatarConfig": {"allowedPrefixes": ["Bx3M6dbr", "PxPyvAAC", "hruInDMs"], "preferRegex": true, "regex": "vWdNHwKb"}, "blockedWord": ["u6LDmtNJ", "No0WZCG5", "IbVoqnQN"], "description": [{"language": "kf1frnu1", "message": ["fvctXQLG", "CvpcqVKC", "iweYJw6b"]}, {"language": "zx6jQTb0", "message": ["BSqMQLT4", "qgoK5oI8", "RAuhK4xn"]}, {"language": "TY6VGTno", "message": ["88mY2LRm", "kLP97kp9", "mgG4o7iy"]}], "isCustomRegex": true, "letterCase": "qPqUfrS7", "maxLength": 100, "maxRepeatingAlphaNum": 96, "maxRepeatingSpecialCharacter": 2, "minCharType": 89, "minLength": 100, "profanityFilter": "6O5wtydM", "regex": "MWxwO6rZ", "specialCharacterLocation": "EVqKy152", "specialCharacters": ["ae4BueuY", "IrDp1oE5", "n3MkFB8z"]}}, {"field": "86WCT3nd", "validation": {"allowAllSpecialCharacters": true, "allowDigit": true, "allowLetter": false, "allowSpace": false, "allowUnicode": false, "avatarConfig": {"allowedPrefixes": ["onCwFPOY", "1YVidDuC", "k2J9rK0x"], "preferRegex": false, "regex": "IfE1RQ2y"}, "blockedWord": ["8AQ9A4VL", "eAWPBOWb", "dykkq7tL"], "description": [{"language": "40K6T0gl", "message": ["WuMFSiR2", "I6z57xF7", "fMqGoyZS"]}, {"language": "dXE8oxgy", "message": ["tkKgf88A", "p44azQmF", "cwNwdI1C"]}, {"language": "kDpqDWQs", "message": ["C7Mpci5v", "orzOv8xg", "BnUWnPM0"]}], "isCustomRegex": false, "letterCase": "ZeKMoamX", "maxLength": 88, "maxRepeatingAlphaNum": 8, "maxRepeatingSpecialCharacter": 44, "minCharType": 99, "minLength": 70, "profanityFilter": "EFckxlKn", "regex": "EjDVo476", "specialCharacterLocation": "WVIYobGE", "specialCharacters": ["XmR65jpo", "0HC0pD93", "RWEv6pq2"]}}]' \
    > test.out 2>&1
eval_tap $? 113 'AdminUpdateInputValidations' test.out

#- 114 AdminResetInputValidations
./ng net.accelbyte.sdk.cli.Main iam adminResetInputValidations \
    --field '8YVIkqDv' \
    > test.out 2>&1
eval_tap $? 114 'AdminResetInputValidations' test.out

#- 115 ListAdminsV3
./ng net.accelbyte.sdk.cli.Main iam listAdminsV3 \
    --namespace "$AB_NAMESPACE" \
    --after 'MXbSFvBE' \
    --before 'lRApCsjJ' \
    --endDate '7n7gsL1d' \
    --limit '94' \
    --query '6sUuHbPn' \
    --roleId 'fXmOcVOL' \
    --startDate 'xOSk1zxr' \
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
    --body '{"ageRestriction": 13, "enable": true}' \
    > test.out 2>&1
eval_tap $? 117 'AdminUpdateAgeRestrictionConfigV3' test.out

#- 118 AdminGetListCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminGetListCountryAgeRestrictionV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 118 'AdminGetListCountryAgeRestrictionV3' test.out

#- 119 AdminUpdateCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateCountryAgeRestrictionV3 \
    --countryCode 'khzgXWxQ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ageRestriction": 29}' \
    > test.out 2>&1
eval_tap $? 119 'AdminUpdateCountryAgeRestrictionV3' test.out

#- 120 AdminGetBannedUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType 'iWbQKXLm' \
    --limit '80' \
    --offset '3' \
    > test.out 2>&1
eval_tap $? 120 'AdminGetBannedUsersV3' test.out

#- 121 AdminBanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"ban": "LLcOEAna", "comment": "yK7bEuLm", "endDate": "yuLcyLjC", "reason": "BVLi6kUO", "skipNotif": true, "userIds": ["S8Ba7QLJ", "DttzrT8c", "cFo4vJGL"]}' \
    > test.out 2>&1
eval_tap $? 121 'AdminBanUserBulkV3' test.out

#- 122 AdminUnbanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminUnbanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"bans": [{"banId": "UQLWwpQX", "userId": "V2FXrJH8"}, {"banId": "R0b5Rid9", "userId": "ZlnGGePN"}, {"banId": "12vZMvB8", "userId": "V9UXjDXf"}]}' \
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
    --clientId 'LoiMXk3j' \
    --clientName 'VnkritCq' \
    --clientType 'zU50QSsj' \
    --limit '46' \
    --offset '24' \
    --skipLoginQueue  \
    > test.out 2>&1
eval_tap $? 124 'AdminGetClientsByNamespaceV3' test.out

#- 125 AdminBulkUpdateClientsV3
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateClientsV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientIds": ["UlStqy8r", "EIToiftI", "IoNVHTNx"], "clientUpdateRequest": {"audiences": ["CxZuG2Y4", "Xp268j9W", "Hwv9u8hT"], "baseUri": "JyYyOY6I", "clientName": "CfpVOEO7", "clientPermissions": [{"action": 33, "resource": "ZC8oxgz2", "schedAction": 9, "schedCron": "EYoo4pnt", "schedRange": ["iM4Mw7za", "tyFatPHL", "j2WYKUyE"]}, {"action": 70, "resource": "zf2igQPA", "schedAction": 18, "schedCron": "MuPC5mBb", "schedRange": ["7ifesEhy", "tAwgLyAA", "UzbKZB04"]}, {"action": 39, "resource": "LDu6QIGD", "schedAction": 68, "schedCron": "jkDYAeDa", "schedRange": ["dKGJ6j0k", "l9I0kSoK", "Esv4yaKp"]}], "clientPlatform": "2MfEkW5X", "deletable": false, "description": "sZyyZfWo", "modulePermissions": [{"moduleId": "cNyIGkBA", "selectedGroups": [{"groupId": "Us4GKWG8", "selectedActions": [69, 54, 71]}, {"groupId": "kEjXMrs8", "selectedActions": [89, 85, 79]}, {"groupId": "QEZqF5hr", "selectedActions": [32, 50, 43]}]}, {"moduleId": "NSS2PuB1", "selectedGroups": [{"groupId": "4cqYGrQ0", "selectedActions": [91, 38, 33]}, {"groupId": "BlQslLNK", "selectedActions": [41, 9, 68]}, {"groupId": "s2iMWHmc", "selectedActions": [58, 41, 71]}]}, {"moduleId": "idTVTcLd", "selectedGroups": [{"groupId": "dXOzNiUV", "selectedActions": [97, 31, 48]}, {"groupId": "JNnzN83O", "selectedActions": [66, 77, 42]}, {"groupId": "o6jNB4Tx", "selectedActions": [44, 90, 33]}]}], "namespace": "VtOmZhQA", "oauthAccessTokenExpiration": 26, "oauthAccessTokenExpirationTimeUnit": "17m9LyFW", "oauthRefreshTokenExpiration": 80, "oauthRefreshTokenExpirationTimeUnit": "8k2Zr8WQ", "redirectUri": "2BDivvxU", "scopes": ["aB72rvIV", "UrvWf8uD", "8vumhXGV"], "skipLoginQueue": true, "twoFactorEnabled": true}}' \
    > test.out 2>&1
eval_tap $? 125 'AdminBulkUpdateClientsV3' test.out

#- 126 AdminCreateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateClientV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["qjwoqHIW", "L0Xfg9zh", "3v0Xshh3"], "baseUri": "uAZ7CG7Z", "clientId": "S2i1l0Tp", "clientName": "p4YruoUX", "clientPermissions": [{"action": 64, "resource": "CBMWIw5e", "schedAction": 57, "schedCron": "gclxtxdo", "schedRange": ["uuDcYkV2", "aFlGgXgZ", "qCi078xt"]}, {"action": 0, "resource": "0AUsgeI6", "schedAction": 41, "schedCron": "LQo8jCaV", "schedRange": ["wuNOnt1p", "pHm3145L", "DWYkS72h"]}, {"action": 61, "resource": "0IGLKeaz", "schedAction": 47, "schedCron": "MdjYTg3G", "schedRange": ["OI1yV9j8", "5gTQoDyl", "RcIsGp1N"]}], "clientPlatform": "JZtz60gd", "deletable": true, "description": "WLpBbsqr", "modulePermissions": [{"moduleId": "Sh9GzITu", "selectedGroups": [{"groupId": "JBjUQYo9", "selectedActions": [43, 100, 51]}, {"groupId": "mxFo5VhU", "selectedActions": [32, 89, 5]}, {"groupId": "JhAWn7Bt", "selectedActions": [93, 76, 41]}]}, {"moduleId": "0y3iG1xo", "selectedGroups": [{"groupId": "6ppmaMcD", "selectedActions": [100, 91, 32]}, {"groupId": "6NdbaC3S", "selectedActions": [24, 68, 76]}, {"groupId": "AFJlYkcF", "selectedActions": [71, 11, 91]}]}, {"moduleId": "4x2MyXKB", "selectedGroups": [{"groupId": "KtGfE7zc", "selectedActions": [89, 56, 20]}, {"groupId": "PnlAVESs", "selectedActions": [39, 52, 97]}, {"groupId": "TfXUIRET", "selectedActions": [81, 54, 15]}]}], "namespace": "etccepkp", "oauthAccessTokenExpiration": 69, "oauthAccessTokenExpirationTimeUnit": "sebJ01jl", "oauthClientType": "vNisYQX0", "oauthRefreshTokenExpiration": 50, "oauthRefreshTokenExpirationTimeUnit": "B4UTzJkS", "parentNamespace": "dZUe7AIm", "redirectUri": "8B9BDNZq", "scopes": ["Hz0kRbY8", "FZtzAaSn", "CQ9YndVD"], "secret": "oYksIhWB", "skipLoginQueue": true, "twoFactorEnabled": false}' \
    > test.out 2>&1
eval_tap $? 126 'AdminCreateClientV3' test.out

#- 127 AdminGetClientsbyNamespacebyIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetClientsbyNamespacebyIDV3 \
    --clientId 'Tc7d7x8d' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 127 'AdminGetClientsbyNamespacebyIDV3' test.out

#- 128 AdminDeleteClientV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientV3 \
    --clientId '82ZG7QYl' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 128 'AdminDeleteClientV3' test.out

#- 129 AdminUpdateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientV3 \
    --clientId 'G7YLg9NO' \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["3Y4I1V68", "T6TY6hQN", "VA2oNxeg"], "baseUri": "uy4ba8xh", "clientName": "GzsOSo2r", "clientPermissions": [{"action": 31, "resource": "puvZTOTH", "schedAction": 3, "schedCron": "XNZZom6u", "schedRange": ["4MpDOebZ", "tForlMiZ", "zjDgA5Kh"]}, {"action": 26, "resource": "Edku7UiD", "schedAction": 85, "schedCron": "ehaJPRsc", "schedRange": ["Wo9QeCQW", "rnlskqEG", "CoAWn2mE"]}, {"action": 42, "resource": "PvBnkhYU", "schedAction": 10, "schedCron": "ADvKvR1Q", "schedRange": ["jfrwlCKh", "mCDksvo1", "Xycr7lin"]}], "clientPlatform": "jzcJIbCU", "deletable": false, "description": "wdPEI7Ll", "modulePermissions": [{"moduleId": "pxPeh5h0", "selectedGroups": [{"groupId": "LhYi2RPw", "selectedActions": [33, 85, 76]}, {"groupId": "l8TaqWx4", "selectedActions": [11, 5, 66]}, {"groupId": "VbOcV6UP", "selectedActions": [30, 38, 58]}]}, {"moduleId": "AKmVblQT", "selectedGroups": [{"groupId": "VrRnN8j9", "selectedActions": [12, 84, 47]}, {"groupId": "J8LPGCfS", "selectedActions": [42, 2, 48]}, {"groupId": "nULFoFqH", "selectedActions": [16, 21, 26]}]}, {"moduleId": "qtsjj7e2", "selectedGroups": [{"groupId": "ZQOElCnt", "selectedActions": [79, 53, 91]}, {"groupId": "KhkFQtDU", "selectedActions": [51, 93, 25]}, {"groupId": "AC9zDbDJ", "selectedActions": [86, 40, 19]}]}], "namespace": "LM7tKgz7", "oauthAccessTokenExpiration": 26, "oauthAccessTokenExpirationTimeUnit": "hOJ36ZcQ", "oauthRefreshTokenExpiration": 85, "oauthRefreshTokenExpirationTimeUnit": "E699gSzy", "redirectUri": "nrC5B0h1", "scopes": ["rJygmtFL", "Naze69Hb", "xWLVouVD"], "skipLoginQueue": false, "twoFactorEnabled": true}' \
    > test.out 2>&1
eval_tap $? 129 'AdminUpdateClientV3' test.out

#- 130 AdminUpdateClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientPermissionV3 \
    --clientId 'xQfriPva' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 20, "resource": "mbN61RR3"}, {"action": 82, "resource": "Eqwms1Sb"}, {"action": 7, "resource": "kxFwmAUF"}]}' \
    > test.out 2>&1
eval_tap $? 130 'AdminUpdateClientPermissionV3' test.out

#- 131 AdminAddClientPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddClientPermissionsV3 \
    --clientId 'w3Bc473s' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 53, "resource": "LcwNlP8X"}, {"action": 92, "resource": "lw54YhcX"}, {"action": 33, "resource": "ieycpzvX"}]}' \
    > test.out 2>&1
eval_tap $? 131 'AdminAddClientPermissionsV3' test.out

#- 132 AdminDeleteClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientPermissionV3 \
    --action '13' \
    --clientId 'rI9gCbb5' \
    --namespace "$AB_NAMESPACE" \
    --resource 'vc1OWHix' \
    > test.out 2>&1
eval_tap $? 132 'AdminDeleteClientPermissionV3' test.out

#- 133 AdminGetConfigValueV3
./ng net.accelbyte.sdk.cli.Main iam adminGetConfigValueV3 \
    --configKey 'QjZ5XflB' \
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
    --body '{"blacklist": ["zhs2roA5", "RPRlKzpk", "PT5VFjDA"]}' \
    > test.out 2>&1
eval_tap $? 136 'AdminAddCountryBlacklistV3' test.out

#- 137 AdminGetLoginAllowlistV3
./ng net.accelbyte.sdk.cli.Main iam adminGetLoginAllowlistV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 137 'AdminGetLoginAllowlistV3' test.out

#- 138 AdminUpdateLoginAllowlistV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateLoginAllowlistV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"active": true, "roleIds": ["SzzWM7Ah", "Q4SH7M2J", "vcyQEDjE"]}' \
    > test.out 2>&1
eval_tap $? 138 'AdminUpdateLoginAllowlistV3' test.out

#- 139 RetrieveAllThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveAllThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 139 'RetrieveAllThirdPartyLoginPlatformCredentialV3' test.out

#- 140 RetrieveAllActiveThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveAllActiveThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 140 'RetrieveAllActiveThirdPartyLoginPlatformCredentialV3' test.out

#- 141 RetrieveAllSSOLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveAllSSOLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '60' \
    --offset '50' \
    > test.out 2>&1
eval_tap $? 141 'RetrieveAllSSOLoginPlatformCredentialV3' test.out

#- 142 RetrieveThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'sAPlVK7l' \
    > test.out 2>&1
eval_tap $? 142 'RetrieveThirdPartyLoginPlatformCredentialV3' test.out

#- 143 AddThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam addThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'LJ3d0xB9' \
    --body '{"ACSURL": "GaQyfqjx", "AWSCognitoRegion": "fjmbXzku", "AWSCognitoUserPool": "MpHjIA1E", "AllowedClients": ["cnAEIzpB", "m7hsDbbo", "olPkZchC"], "AppId": "WxVQTwRT", "AuthorizationEndpoint": "cmNFRymI", "ClientId": "kJb1ZPEY", "EmptyStrFieldList": ["5zFHHipw", "apaslNmd", "YVaZDOXI"], "EnableServerLicenseValidation": false, "Environment": "7TJWVMiy", "FederationMetadataURL": "IEuKHDQe", "GenericOauthFlow": false, "IncludePUID": false, "IsActive": true, "Issuer": "GqnLF8LW", "JWKSEndpoint": "s03Zj2Lf", "KeyID": "ZO52ld85", "LogoURL": "cJrJalTV", "NetflixCertificates": {"encryptedPrivateKey": "1nqJdifx", "encryptedPrivateKeyName": "Nkx4rznA", "publicCertificate": "VvS0aOtI", "publicCertificateName": "9UKBpTrE", "rootCertificate": "PMLn3CTk", "rootCertificateName": "QYbhTBC1"}, "OrganizationId": "gB5HYaU1", "PlatformName": "YMhmOc4b", "RedirectUri": "MNOoO7Vu", "RegisteredDomains": [{"affectedClientIDs": ["kzrgnVWy", "lTsgm8p9", "XeOkltSp"], "domain": "s4iPKpOR", "namespaces": ["ZVEI242K", "aFmqnLW0", "agixfV0y"], "roleId": "kDf8nXPP", "ssoCfg": {"googleKey": {"lZMvJeoh": {}, "OZols7HA": {}, "0nHjuu5S": {}}, "groupConfigs": [{"assignNamespaces": ["eoOCzYOn", "16DOLC5v", "yPNurCos"], "group": "aJ5F7HmI", "roleId": "PlA3LkLv"}, {"assignNamespaces": ["QfIiUZ5s", "DhkF8SyU", "UfxvtBu2"], "group": "co60RuKk", "roleId": "bgUnVjyT"}, {"assignNamespaces": ["kxiLlYJA", "dnaBhpPU", "rlkqdGKy"], "group": "pYhVcPFw", "roleId": "0bYttYvH"}]}}, {"affectedClientIDs": ["mRH1dkrG", "7jusTkIv", "VRUlafh7"], "domain": "5SqXEcRr", "namespaces": ["kvlHoNvb", "txrHpGi9", "0T2aUFkn"], "roleId": "C7USEWsG", "ssoCfg": {"googleKey": {"1l63RXhl": {}, "eQ79Qy1E": {}, "DIrBYm5C": {}}, "groupConfigs": [{"assignNamespaces": ["5ehSTbN0", "xjU3N0Sp", "fhyJ8SES"], "group": "FNAG8byd", "roleId": "lw5ra1D4"}, {"assignNamespaces": ["qUCgBq5E", "qiEa3kyk", "XgUM3B4F"], "group": "wjYv9mWk", "roleId": "sQSCvX0o"}, {"assignNamespaces": ["7gpNhdZ1", "k1N7FrlA", "QuXSYkJs"], "group": "QP8BYLuT", "roleId": "An7Cvq6R"}]}}, {"affectedClientIDs": ["EbbiCbrv", "h0WRpJRp", "PUF90b4k"], "domain": "FAgavjmN", "namespaces": ["heEOW0KZ", "nMQyx0FM", "TuS1LDsY"], "roleId": "zVzKibQB", "ssoCfg": {"googleKey": {"Dl9Ic3BJ": {}, "kkSjN7ul": {}, "HJW0FRSd": {}}, "groupConfigs": [{"assignNamespaces": ["Ov9CpqAM", "NWf1lB1g", "UedwaOgx"], "group": "JTmBTo5k", "roleId": "v3TJClBC"}, {"assignNamespaces": ["SzdS8eiq", "MOPDRWeq", "jxoVmUfc"], "group": "TsuwzfGW", "roleId": "lQcxrVs0"}, {"assignNamespaces": ["E3fkR1fc", "KWlIZdVS", "tBINFbA1"], "group": "xERHWTJS", "roleId": "fGr3XDZN"}]}}], "Secret": "VAFGJS0Y", "TeamID": "BcZpgpNT", "TokenAuthenticationType": "PLCsLS1E", "TokenClaimsMapping": {"Kdtv5cOO": "67I6oBxR", "d15YrocF": "gLBllXQb", "znH1ifDb": "iCVQyhJG"}, "TokenEndpoint": "cSbZXXF6", "UserInfoEndpoint": "r1DGigL3", "UserInfoHTTPMethod": "ycknQCZd", "googleAdminConsoleKey": "Sohmb4SK", "scopes": ["OhBIQ2i3", "xpiUABhX", "BMt9vGuA"]}' \
    > test.out 2>&1
eval_tap $? 143 'AddThirdPartyLoginPlatformCredentialV3' test.out

#- 144 DeleteThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Qy9PF1jn' \
    > test.out 2>&1
eval_tap $? 144 'DeleteThirdPartyLoginPlatformCredentialV3' test.out

#- 145 UpdateThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Mpui1aoj' \
    --body '{"ACSURL": "jj29X6xm", "AWSCognitoRegion": "MR5l24cB", "AWSCognitoUserPool": "e8sa7uOy", "AllowedClients": ["hf6iPh1h", "dIglwaNg", "1R1cjxBe"], "AppId": "8Ki1jDfx", "AuthorizationEndpoint": "Glwcg0s6", "ClientId": "570VXiqm", "EmptyStrFieldList": ["YVJx3h3A", "BKaFFzW2", "E0CRvqlR"], "EnableServerLicenseValidation": false, "Environment": "3Vkv7wxK", "FederationMetadataURL": "2hxtOA1k", "GenericOauthFlow": false, "IncludePUID": false, "IsActive": true, "Issuer": "pEaEmLI1", "JWKSEndpoint": "hYPaF4ro", "KeyID": "Fcoe3eq0", "LogoURL": "MRcA7RSC", "NetflixCertificates": {"encryptedPrivateKey": "EP4TMJ4c", "encryptedPrivateKeyName": "8srhMDUy", "publicCertificate": "KD1SJ8Mo", "publicCertificateName": "WfiztPaC", "rootCertificate": "1ozXTGCr", "rootCertificateName": "b7gAldPr"}, "OrganizationId": "dBofpNhd", "PlatformName": "Tx0pBoN5", "RedirectUri": "vSbTrZ2Y", "RegisteredDomains": [{"affectedClientIDs": ["0trEPkGb", "kZfIAGI7", "hz11DbiU"], "domain": "PhWW61Tg", "namespaces": ["fTdEN4RP", "Ar5UGbCn", "mrmYjjqD"], "roleId": "CldWxYIa", "ssoCfg": {"googleKey": {"x95zBTQD": {}, "g2NIP6bz": {}, "f1RNJ4Ol": {}}, "groupConfigs": [{"assignNamespaces": ["VC2ALcFB", "HCfRBVTf", "84ZAazIF"], "group": "BP7Xw5W7", "roleId": "pM5VMDVY"}, {"assignNamespaces": ["RdWfkePi", "7zcIBSbc", "t8wvgQyW"], "group": "airNfiOo", "roleId": "29CWMSTG"}, {"assignNamespaces": ["NHrK1Mt3", "oo0Qc1qy", "JuorsTtC"], "group": "B2wk4qpH", "roleId": "tMwFAQKF"}]}}, {"affectedClientIDs": ["Vjx0I7zH", "TNrDyUhb", "CAea5YnB"], "domain": "NTkMiOlW", "namespaces": ["8bmUJQxW", "SMlNaAsu", "Rjy10W1L"], "roleId": "tkolNkVO", "ssoCfg": {"googleKey": {"UBw08mpd": {}, "0ovCfJMq": {}, "x6wJY4Se": {}}, "groupConfigs": [{"assignNamespaces": ["xOz4iqpC", "WPUyFI5q", "AmAYNooD"], "group": "JjN4lryZ", "roleId": "yXC8rFDT"}, {"assignNamespaces": ["rpywlX9J", "SchgPIkd", "X6lbYAaG"], "group": "dpY5TMcd", "roleId": "gvt9giQ2"}, {"assignNamespaces": ["UdwpuZTG", "wwBYAGli", "RojNAO8u"], "group": "VdWZKjAA", "roleId": "t52c4K1F"}]}}, {"affectedClientIDs": ["Bq6XE7Ia", "uNUdFsqJ", "aa7h0ilv"], "domain": "nV3M0EeO", "namespaces": ["R0snmB9t", "P6FetiLq", "AKx2QF37"], "roleId": "11Eg1Gyd", "ssoCfg": {"googleKey": {"83MXqeAQ": {}, "9peDbmQT": {}, "eL148MOc": {}}, "groupConfigs": [{"assignNamespaces": ["KpBDYTfw", "jhYnCNpE", "aT4sxznJ"], "group": "MERGJT69", "roleId": "xTEb9oSY"}, {"assignNamespaces": ["zsOoVm0v", "GKwKtp2m", "Lcj4B4gp"], "group": "0tKblcGN", "roleId": "vrcIYhoX"}, {"assignNamespaces": ["KyYaKipa", "wfiJYeKL", "jNbvzrK2"], "group": "3c3xLFl0", "roleId": "wixMDXZT"}]}}], "Secret": "tx78JzOQ", "TeamID": "Kt0FRUQg", "TokenAuthenticationType": "fy4aj0Uh", "TokenClaimsMapping": {"UKOhkDGb": "EZjNahYp", "wdSKn5Ab": "wGVju5RS", "LFSJA2YT": "6hjapQ3O"}, "TokenEndpoint": "vkH4Ucev", "UserInfoEndpoint": "rSJG1Opj", "UserInfoHTTPMethod": "1qQv0iJP", "googleAdminConsoleKey": "KU08rOvD", "scopes": ["eFTpD8Rh", "gzgm3Q4a", "JUp0JFjK"]}' \
    > test.out 2>&1
eval_tap $? 145 'UpdateThirdPartyLoginPlatformCredentialV3' test.out

#- 146 UpdateThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '43au2pgU' \
    --body '{"affectedClientIDs": ["1yG96ZoE", "6l8d10oI", "zsxmfBfd"], "assignedNamespaces": ["0qdF5fpg", "G6r7EjJe", "o8BPMKZb"], "domain": "tr514B4n", "roleId": "d2Dvt4a6", "ssoCfg": {"googleKey": {"eF65v4jI": {}, "wE68aoFe": {}, "iqMfc6RB": {}}, "groupConfigs": [{"assignNamespaces": ["paooMgec", "dFlKvpSn", "HIgZwCSP"], "group": "vYjUtsVE", "roleId": "1SYd9evn"}, {"assignNamespaces": ["ylIU5XVS", "JdX3ruIg", "VfGqJVNc"], "group": "10Gab18S", "roleId": "CD61Y66p"}, {"assignNamespaces": ["8MRGxMGR", "WGvIkzmV", "cy07HSEc"], "group": "EzqcBRTv", "roleId": "UMvhzcjZ"}]}}' \
    > test.out 2>&1
eval_tap $? 146 'UpdateThirdPartyLoginPlatformDomainV3' test.out

#- 147 DeleteThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Bvpy4BV1' \
    --body '{"domain": "k4liuHH4", "ssoGroups": ["wwMOd0BL", "rjLHlfo2", "CnVsW1mt"]}' \
    > test.out 2>&1
eval_tap $? 147 'DeleteThirdPartyLoginPlatformDomainV3' test.out

#- 148 PartialUpdateThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam partialUpdateThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'mv8oPREP' \
    --body '{"affectedClientIDs": ["kZlmvbuh", "jHv3rC7F", "09gmYehv"], "assignedNamespaces": ["1NQImG4U", "QGO4Nk8l", "0LeQIOZx"], "domain": "ZOJIcVOA", "roleId": "Ba7Ovxd0", "ssoCfg": {"googleKey": {"nm7Mh9vg": {}, "kIpsVl4T": {}, "JHrL2BN2": {}}, "groupConfigs": [{"assignNamespaces": ["7C6v94aq", "OdwYbmBH", "hEHai2kr"], "group": "Nkwq3bpP", "roleId": "3G1WkHGk"}, {"assignNamespaces": ["SgnsBWbl", "U1ZZBZRY", "pG4R7m4e"], "group": "weY3jMDz", "roleId": "B5LEEC4L"}, {"assignNamespaces": ["8e2LW0Uy", "PCWJtgPk", "uHZGyXqT"], "group": "LJ7Tw4nN", "roleId": "7ekWecAd"}]}}' \
    > test.out 2>&1
eval_tap $? 148 'PartialUpdateThirdPartyLoginPlatformDomainV3' test.out

#- 149 RetrieveSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam retrieveSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'BWGcFk16' \
    > test.out 2>&1
eval_tap $? 149 'RetrieveSSOLoginPlatformCredential' test.out

#- 150 AddSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam addSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'THSbQEGg' \
    --body '{"acsUrl": "gcLiJSqC", "apiKey": "BUy43ppa", "appId": "QN5UsBnM", "federationMetadataUrl": "j8utoEp1", "isActive": false, "redirectUri": "BHkrP8MI", "secret": "cTmYyth8", "ssoUrl": "MowWsYdx"}' \
    > test.out 2>&1
eval_tap $? 150 'AddSSOLoginPlatformCredential' test.out

#- 151 DeleteSSOLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteSSOLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '9YVClEw0' \
    > test.out 2>&1
eval_tap $? 151 'DeleteSSOLoginPlatformCredentialV3' test.out

#- 152 UpdateSSOPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam updateSSOPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'JC31PL7P' \
    --body '{"acsUrl": "xQvp8XMM", "apiKey": "5en5tF0H", "appId": "BqG3uaAa", "federationMetadataUrl": "w7aGMcO9", "isActive": true, "redirectUri": "0HJ3sE1v", "secret": "GpJOgJPm", "ssoUrl": "sLgaMWJK"}' \
    > test.out 2>&1
eval_tap $? 152 'UpdateSSOPlatformCredential' test.out

#- 153 AdminListUserIDByPlatformUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByPlatformUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'EAKDHFoP' \
    --rawPID  \
    --rawPUID  \
    --body '{"platformUserIds": ["MrYm4Yv8", "Czacslyf", "QwYIq4W5"]}' \
    > test.out 2>&1
eval_tap $? 153 'AdminListUserIDByPlatformUserIDsV3' test.out

#- 154 AdminGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'dljoFIrS' \
    --platformUserId 'uLFCo6U4' \
    --pidType 'VSZjpJNf' \
    > test.out 2>&1
eval_tap $? 154 'AdminGetUserByPlatformUserIDV3' test.out

#- 155 AdminGetProfileUpdateStrategyV3
./ng net.accelbyte.sdk.cli.Main iam adminGetProfileUpdateStrategyV3 \
    --namespace "$AB_NAMESPACE" \
    --field 'username' \
    > test.out 2>&1
eval_tap $? 155 'AdminGetProfileUpdateStrategyV3' test.out

#- 156 AdminUpdateProfileUpdateStrategyV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateProfileUpdateStrategyV3 \
    --namespace "$AB_NAMESPACE" \
    --field 'country' \
    --body '{"config": {"minimumAllowedInterval": 64}, "type": "qWYkiEid"}' \
    > test.out 2>&1
eval_tap $? 156 'AdminUpdateProfileUpdateStrategyV3' test.out

#- 157 AdminGetRoleOverrideConfigV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleOverrideConfigV3 \
    --namespace "$AB_NAMESPACE" \
    --identity 'USER' \
    > test.out 2>&1
eval_tap $? 157 'AdminGetRoleOverrideConfigV3' test.out

#- 158 AdminUpdateRoleOverrideConfigV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleOverrideConfigV3 \
    --namespace "$AB_NAMESPACE" \
    --identity 'GAME_ADMIN' \
    --body '{"additions": [{"actions": [80, 48, 13], "resource": "7qc4upvd"}, {"actions": [57, 92, 28], "resource": "xz0MLT4U"}, {"actions": [14, 11, 8], "resource": "7YYmkKpn"}], "exclusions": [{"actions": [75, 46, 87], "resource": "2Ns1Lm4u"}, {"actions": [38, 65, 32], "resource": "cNAu5kCu"}, {"actions": [76, 74, 89], "resource": "KLhYcCwN"}], "overrides": [{"actions": [73, 50, 45], "resource": "0fSuVsXC"}, {"actions": [83, 75, 62], "resource": "Xxlx9OUC"}, {"actions": [21, 13, 41], "resource": "5S09pWTl"}], "replacements": [{"replacement": {"actions": [29, 55, 51], "resource": "u2KTWtKN"}, "target": "ZR1sGJfU"}, {"replacement": {"actions": [14, 34, 93], "resource": "vS7YKK7r"}, "target": "l7LCS8Lt"}, {"replacement": {"actions": [92, 63, 0], "resource": "IwFlzzMw"}, "target": "gxLtqjnH"}]}' \
    > test.out 2>&1
eval_tap $? 158 'AdminUpdateRoleOverrideConfigV3' test.out

#- 159 AdminGetRoleSourceV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleSourceV3 \
    --namespace "$AB_NAMESPACE" \
    --identity 'USER' \
    > test.out 2>&1
eval_tap $? 159 'AdminGetRoleSourceV3' test.out

#- 160 AdminChangeRoleOverrideConfigStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminChangeRoleOverrideConfigStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --identity 'GAME_ADMIN' \
    --body '{"active": false}' \
    > test.out 2>&1
eval_tap $? 160 'AdminChangeRoleOverrideConfigStatusV3' test.out

#- 161 AdminGetRoleNamespacePermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleNamespacePermissionV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'stQDtazH' \
    > test.out 2>&1
eval_tap $? 161 'AdminGetRoleNamespacePermissionV3' test.out

#- 162 GetAdminUsersByRoleIdV3
./ng net.accelbyte.sdk.cli.Main iam getAdminUsersByRoleIdV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'MKR51MxI' \
    --after '20' \
    --before '94' \
    --limit '73' \
    > test.out 2>&1
eval_tap $? 162 'GetAdminUsersByRoleIdV3' test.out

#- 163 AdminQueryTagV3
./ng net.accelbyte.sdk.cli.Main iam adminQueryTagV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '64' \
    --offset '24' \
    --tagName 'YKeWYFOb' \
    > test.out 2>&1
eval_tap $? 163 'AdminQueryTagV3' test.out

#- 164 AdminCreateTagV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateTagV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"tagName": "QRflNTFW"}' \
    > test.out 2>&1
eval_tap $? 164 'AdminCreateTagV3' test.out

#- 165 AdminUpdateTagV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateTagV3 \
    --namespace "$AB_NAMESPACE" \
    --tagId 'OgS4GyfF' \
    --body '{"tagName": "ATh2hDNP"}' \
    > test.out 2>&1
eval_tap $? 165 'AdminUpdateTagV3' test.out

#- 166 AdminDeleteTagV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteTagV3 \
    --namespace "$AB_NAMESPACE" \
    --tagId 'QtI0Xhlg' \
    > test.out 2>&1
eval_tap $? 166 'AdminDeleteTagV3' test.out

#- 167 AdminGetUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --emailAddress 'tKdtq4IH' \
    > test.out 2>&1
eval_tap $? 167 'AdminGetUserByEmailAddressV3' test.out

#- 168 AdminBulkUpdateUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"updateRequest": {"skipLoginQueue": false}, "userIds": ["u65q9422", "AxokkY5e", "uD50OlLc"]}' \
    > test.out 2>&1
eval_tap $? 168 'AdminBulkUpdateUsersV3' test.out

#- 169 AdminGetBulkUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType 'kmuhKhOW' \
    --body '{"bulkUserId": ["DHfkw9S1", "8opSPoJK", "wiLzszii"]}' \
    > test.out 2>&1
eval_tap $? 169 'AdminGetBulkUserBanV3' test.out

#- 170 AdminListUserIDByUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"findByPublisherNamespace": false, "userIds": ["DXdtuNB2", "tjb7uyVY", "rt7dnMXG"]}' \
    > test.out 2>&1
eval_tap $? 170 'AdminListUserIDByUserIDsV3' test.out

#- 171 AdminBulkGetUsersPlatform
./ng net.accelbyte.sdk.cli.Main iam adminBulkGetUsersPlatform \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["TfzkskDi", "fJWu1lNg", "ahkL29uf"]}' \
    > test.out 2>&1
eval_tap $? 171 'AdminBulkGetUsersPlatform' test.out

#- 172 AdminCursorGetUserV3
./ng net.accelbyte.sdk.cli.Main iam adminCursorGetUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"cursor": {"cursorTime": "gsVaGUBL", "userId": "qFJVsNBz"}, "fields": ["fl5dMwjW", "TT2t3W7q", "kFjet6wR"], "limit": 59}' \
    > test.out 2>&1
eval_tap $? 172 'AdminCursorGetUserV3' test.out

#- 173 AdminInviteUserV3
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddresses": ["GVFGCeVB", "IwWb2vne", "LpRZdb5F"], "isAdmin": false, "languageTag": "wI2EC9SZ", "namespace": "6ehNkNOx", "roles": ["usPB1jGJ", "LcnuEJ7x", "PaoXdCHQ"]}' \
    > test.out 2>&1
eval_tap $? 173 'AdminInviteUserV3' test.out

#- 174 AdminQueryThirdPlatformLinkHistoryV3
./ng net.accelbyte.sdk.cli.Main iam adminQueryThirdPlatformLinkHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '20' \
    --offset '92' \
    --platformUserId 'vwQKtYwx' \
    --platformId 'Hu6UJkOc' \
    > test.out 2>&1
eval_tap $? 174 'AdminQueryThirdPlatformLinkHistoryV3' test.out

#- 175 AdminListUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminListUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '21' \
    --offset '27' \
    > test.out 2>&1
eval_tap $? 175 'AdminListUsersV3' test.out

#- 176 AdminSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam adminSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'YsqDqo0I' \
    --endDate 'vWqijtb0' \
    --includeTotal  \
    --limit '8' \
    --offset '22' \
    --platformBy 'KVffLBmN' \
    --platformId 'A7eISaqg' \
    --query 'CSjJoT1j' \
    --roleIds 'z5rtWf4Z' \
    --skipLoginQueue  \
    --startDate 'GNem3YI8' \
    --tagIds 'eMFXph2b' \
    --testAccount  \
    > test.out 2>&1
eval_tap $? 176 'AdminSearchUserV3' test.out

#- 177 AdminGetBulkUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"listEmailAddressRequest": ["TKv0VGg3", "AtumH99N", "rzeFER0Y"]}' \
    > test.out 2>&1
eval_tap $? 177 'AdminGetBulkUserByEmailAddressV3' test.out

#- 178 AdminGetUserByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'cb0YJmnZ' \
    > test.out 2>&1
eval_tap $? 178 'AdminGetUserByUserIdV3' test.out

#- 179 AdminUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'CPBNsa0r' \
    --body '{"avatarUrl": "2ifYkxBa", "country": "ViATWQZ4", "dateOfBirth": "OgYZRiZ2", "displayName": "3YW9mFci", "languageTag": "XtxJG48I", "skipLoginQueue": false, "tags": ["7M2noMKO", "GHlsX3Hq", "ZsNbB2Jw"], "uniqueDisplayName": "GFl7p6UV", "userName": "UfXQA4t0"}' \
    > test.out 2>&1
eval_tap $? 179 'AdminUpdateUserV3' test.out

#- 180 AdminGetUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '3G8CSkIx' \
    --activeOnly  \
    --after '1DxKnkzu' \
    --before 'iRLZXjdv' \
    --limit '94' \
    > test.out 2>&1
eval_tap $? 180 'AdminGetUserBanV3' test.out

#- 181 AdminBanUserV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'UECzLKhP' \
    --body '{"ban": "Z1KddcQ0", "comment": "oexWboVD", "endDate": "Hl40qka4", "reason": "vbthONjd", "skipNotif": true}' \
    > test.out 2>&1
eval_tap $? 181 'AdminBanUserV3' test.out

#- 182 AdminGetUserBanSummaryV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanSummaryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'USIj3wxy' \
    > test.out 2>&1
eval_tap $? 182 'AdminGetUserBanSummaryV3' test.out

#- 183 AdminUpdateUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserBanV3 \
    --banId 'ScX4oLOy' \
    --namespace "$AB_NAMESPACE" \
    --userId 'wD9TqN7x' \
    --body '{"enabled": false, "skipNotif": true}' \
    > test.out 2>&1
eval_tap $? 183 'AdminUpdateUserBanV3' test.out

#- 184 AdminSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Nx2CSLh9' \
    --body '{"context": "RuMj8Zwf", "emailAddress": "FpY82sGH", "languageTag": "hh5R8QTl", "upgradeToken": "D7rlCqBG"}' \
    > test.out 2>&1
eval_tap $? 184 'AdminSendVerificationCodeV3' test.out

#- 185 AdminVerifyAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'FNCOqj33' \
    --body '{"Code": "Gx9PmwGS", "ContactType": "esxHQE8F", "LanguageTag": "sX6nSUt5", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 185 'AdminVerifyAccountV3' test.out

#- 186 GetUserVerificationCode
./ng net.accelbyte.sdk.cli.Main iam getUserVerificationCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'SHCxqEwQ' \
    > test.out 2>&1
eval_tap $? 186 'GetUserVerificationCode' test.out

#- 187 AdminGetUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '3k6UKEdi' \
    > test.out 2>&1
eval_tap $? 187 'AdminGetUserDeletionStatusV3' test.out

#- 188 AdminUpdateUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'gBf6qm0t' \
    --body '{"deletionDate": 37, "enabled": false}' \
    > test.out 2>&1
eval_tap $? 188 'AdminUpdateUserDeletionStatusV3' test.out

#- 189 AdminListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'FJjxlyU6' \
    > test.out 2>&1
eval_tap $? 189 'AdminListUserAllPlatformAccountsDistinctV3' test.out

#- 190 AdminUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'im3K9mmn' \
    --body '{"code": "jRGbN4By", "country": "viCQhM4T", "dateOfBirth": "pjC91FrR", "displayName": "DfbqYBPX", "emailAddress": "vap36jJ2", "password": "bL2kk2S4", "uniqueDisplayName": "pWOP9vkW", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 190 'AdminUpgradeHeadlessAccountV3' test.out

#- 191 AdminDeleteUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'FlOac71W' \
    > test.out 2>&1
eval_tap $? 191 'AdminDeleteUserInformationV3' test.out

#- 192 AdminGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'nB9vNm0A' \
    --after '0.4277346773013271' \
    --before '0.04472834057532249' \
    --limit '94' \
    > test.out 2>&1
eval_tap $? 192 'AdminGetUserLoginHistoriesV3' test.out

#- 193 AdminResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam adminResetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'uGN2wSPX' \
    --body '{"languageTag": "eKnsG52t", "mfaToken": "k4yZasaC", "newPassword": "pxaYaNqx", "oldPassword": "uR58tGfr"}' \
    > test.out 2>&1
eval_tap $? 193 'AdminResetPasswordV3' test.out

#- 194 AdminUpdateUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserPermissionV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'LKaLf3yS' \
    --body '{"Permissions": [{"Action": 68, "Resource": "syNA8EOB", "SchedAction": 36, "SchedCron": "YH1CHp6d", "SchedRange": ["12mGyP9E", "nmluAMcw", "VNY0b2Ku"]}, {"Action": 50, "Resource": "Mt1nnR8k", "SchedAction": 45, "SchedCron": "SPf8bg4V", "SchedRange": ["8Hf7r5Pb", "tuN4r6bz", "3EQzYTop"]}, {"Action": 23, "Resource": "sJzLqZcX", "SchedAction": 27, "SchedCron": "9pEldCxG", "SchedRange": ["MStGFqyo", "9V04crFE", "SndyD3db"]}]}' \
    > test.out 2>&1
eval_tap $? 194 'AdminUpdateUserPermissionV3' test.out

#- 195 AdminAddUserPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserPermissionsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'nKI2dZdk' \
    --body '{"Permissions": [{"Action": 68, "Resource": "YmIdhSkO", "SchedAction": 58, "SchedCron": "hq8uxMwX", "SchedRange": ["z1Sxi2NI", "eQLOhj0H", "gjineErw"]}, {"Action": 75, "Resource": "WHsf8meD", "SchedAction": 60, "SchedCron": "CZpkvdZm", "SchedRange": ["3O3997I3", "6SyQbf7n", "N3trv2hF"]}, {"Action": 25, "Resource": "NH7Gx9je", "SchedAction": 36, "SchedCron": "fFJ5GgyV", "SchedRange": ["L6wJm1Sx", "tUk9T1E9", "FBDfbx1e"]}]}' \
    > test.out 2>&1
eval_tap $? 195 'AdminAddUserPermissionsV3' test.out

#- 196 AdminDeleteUserPermissionBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'PwuTDOnr' \
    --body '[{"Action": 86, "Resource": "qkHb9EAo"}, {"Action": 49, "Resource": "SGwXzVC5"}, {"Action": 89, "Resource": "19ArAvNB"}]' \
    > test.out 2>&1
eval_tap $? 196 'AdminDeleteUserPermissionBulkV3' test.out

#- 197 AdminDeleteUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionV3 \
    --action '72' \
    --namespace "$AB_NAMESPACE" \
    --resource 'Cual9lub' \
    --userId 'voh2N7Be' \
    > test.out 2>&1
eval_tap $? 197 'AdminDeleteUserPermissionV3' test.out

#- 198 AdminGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '4jykh4CO' \
    --after 'he8IbsOl' \
    --before 'JvDQVaxO' \
    --limit '55' \
    --platformId 'WRzI0pOm' \
    --targetNamespace 'zR4n3QBi' \
    > test.out 2>&1
eval_tap $? 198 'AdminGetUserPlatformAccountsV3' test.out

#- 199 AdminListAllDistinctPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminListAllDistinctPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'MsseJyhH' \
    --status 'uEFSKSVg' \
    > test.out 2>&1
eval_tap $? 199 'AdminListAllDistinctPlatformAccountsV3' test.out

#- 200 AdminGetListJusticePlatformAccounts
./ng net.accelbyte.sdk.cli.Main iam adminGetListJusticePlatformAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'QCKadA0h' \
    > test.out 2>&1
eval_tap $? 200 'AdminGetListJusticePlatformAccounts' test.out

#- 201 AdminGetUserMapping
./ng net.accelbyte.sdk.cli.Main iam adminGetUserMapping \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace '8x3lETnM' \
    --userId 'zjfbSVte' \
    > test.out 2>&1
eval_tap $? 201 'AdminGetUserMapping' test.out

#- 202 AdminCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam adminCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'ALTdBatO' \
    --userId 'YN1SPAMa' \
    > test.out 2>&1
eval_tap $? 202 'AdminCreateJusticeUser' test.out

#- 203 AdminLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'KmqlG4Hr' \
    --skipConflict  \
    --body '{"platformId": "GNPKOFbZ", "platformUserId": "bFcGsrRR"}' \
    > test.out 2>&1
eval_tap $? 203 'AdminLinkPlatformAccount' test.out

#- 204 AdminGetUserLinkHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLinkHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'FiIG68Zn' \
    --platformId 'X7OcwaVp' \
    > test.out 2>&1
eval_tap $? 204 'AdminGetUserLinkHistoriesV3' test.out

#- 205 AdminPlatformUnlinkV3
eval_tap 0 205 'AdminPlatformUnlinkV3 # SKIP deprecated' test.out

#- 206 AdminPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'oUCW8tPt' \
    --userId 'ME0m1tcZ' \
    > test.out 2>&1
eval_tap $? 206 'AdminPlatformUnlinkAllV3' test.out

#- 207 AdminPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'rxLE1W4O' \
    --userId 'SHM4QCt0' \
    --ticket 'Kg0gWxE9' \
    > test.out 2>&1
eval_tap $? 207 'AdminPlatformLinkV3' test.out

#- 208 AdminDeleteUserLinkingHistoryByPlatformIDV3
eval_tap 0 208 'AdminDeleteUserLinkingHistoryByPlatformIDV3 # SKIP deprecated' test.out

#- 209 AdminDeleteUserLinkingRestrictionByPlatformIDV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserLinkingRestrictionByPlatformIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'K96gG2ez' \
    --userId 'UimOEtuY' \
    > test.out 2>&1
eval_tap $? 209 'AdminDeleteUserLinkingRestrictionByPlatformIDV3' test.out

#- 210 AdminGetThirdPartyPlatformTokenLinkStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetThirdPartyPlatformTokenLinkStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'xkKDD9II' \
    --userId 'JtGGFfko' \
    --platformToken '98feYkA1' \
    > test.out 2>&1
eval_tap $? 210 'AdminGetThirdPartyPlatformTokenLinkStatusV3' test.out

#- 211 AdminGetUserSinglePlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminGetUserSinglePlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --platformId 'buvCUo9b' \
    --userId 'dICdsiC9' \
    --crossNamespace  \
    > test.out 2>&1
eval_tap $? 211 'AdminGetUserSinglePlatformAccount' test.out

#- 212 AdminDeleteUserRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRolesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'W4EpAKdk' \
    --body '["pOPSYPic", "cOVpzwqE", "jH00OAKw"]' \
    > test.out 2>&1
eval_tap $? 212 'AdminDeleteUserRolesV3' test.out

#- 213 AdminSaveUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminSaveUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'SNGFw3Dj' \
    --body '[{"namespace": "rejXlrw1", "roleId": "uPT1lUxV"}, {"namespace": "8ggA3ar7", "roleId": "FYf3bb81"}, {"namespace": "A1PHXqrN", "roleId": "F0HNVnsO"}]' \
    > test.out 2>&1
eval_tap $? 213 'AdminSaveUserRoleV3' test.out

#- 214 AdminAddUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'TZUX0kuI' \
    --userId 'y4CIDHQE' \
    > test.out 2>&1
eval_tap $? 214 'AdminAddUserRoleV3' test.out

#- 215 AdminDeleteUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'Lwc55YFG' \
    --userId '63X6zxtD' \
    > test.out 2>&1
eval_tap $? 215 'AdminDeleteUserRoleV3' test.out

#- 216 AdminGetUserStateByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserStateByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'CCpHssVi' \
    > test.out 2>&1
eval_tap $? 216 'AdminGetUserStateByUserIdV3' test.out

#- 217 AdminUpdateUserStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'bWFXTvN1' \
    --body '{"enabled": false, "reason": "nkEzz3YE"}' \
    > test.out 2>&1
eval_tap $? 217 'AdminUpdateUserStatusV3' test.out

#- 218 AdminTrustlyUpdateUserIdentity
./ng net.accelbyte.sdk.cli.Main iam adminTrustlyUpdateUserIdentity \
    --namespace "$AB_NAMESPACE" \
    --userId 'eswbflRP' \
    --body '{"emailAddress": "DUcV6zfF", "password": "5EfwHd6s"}' \
    > test.out 2>&1
eval_tap $? 218 'AdminTrustlyUpdateUserIdentity' test.out

#- 219 AdminVerifyUserWithoutVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyUserWithoutVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '94jdPZE0' \
    > test.out 2>&1
eval_tap $? 219 'AdminVerifyUserWithoutVerificationCodeV3' test.out

#- 220 AdminUpdateClientSecretV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientSecretV3 \
    --clientId 'JRMOOyrw' \
    --namespace "$AB_NAMESPACE" \
    --body '{"newSecret": "kW4jIGNY"}' \
    > test.out 2>&1
eval_tap $? 220 'AdminUpdateClientSecretV3' test.out

#- 221 AdminCheckThirdPartyLoginPlatformAvailabilityV3
./ng net.accelbyte.sdk.cli.Main iam adminCheckThirdPartyLoginPlatformAvailabilityV3 \
    --platformId 'CY0EwNu6' \
    > test.out 2>&1
eval_tap $? 221 'AdminCheckThirdPartyLoginPlatformAvailabilityV3' test.out

#- 222 AdminGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV3 \
    --after 'jdNx9tJj' \
    --before 'G4kYHbLe' \
    --isWildcard  \
    --limit '74' \
    > test.out 2>&1
eval_tap $? 222 'AdminGetRolesV3' test.out

#- 223 AdminCreateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV3 \
    --body '{"adminRole": false, "deletable": false, "isWildcard": false, "managers": [{"displayName": "Ah0hQN9N", "namespace": "pRGr3B4I", "userId": "FpCVM2ee"}, {"displayName": "v3EVARQh", "namespace": "2cVHT2Ms", "userId": "DYN7Dpo8"}, {"displayName": "oAyqYVMa", "namespace": "mPOSSnbz", "userId": "w1rBVFdC"}], "members": [{"displayName": "GbIAxRsK", "namespace": "CxuGLuVr", "userId": "kXrJ7EAS"}, {"displayName": "eioDF2nI", "namespace": "foqwbSwt", "userId": "732eQBZG"}, {"displayName": "AN1zvPeB", "namespace": "KRpPutcn", "userId": "ggDARV2J"}], "permissions": [{"action": 16, "resource": "aJx4vv5Z", "schedAction": 27, "schedCron": "MP0NjROu", "schedRange": ["z3JpezFA", "BKEx5kOG", "viWlmDr2"]}, {"action": 38, "resource": "O5ox7dVu", "schedAction": 93, "schedCron": "BWWPHGrk", "schedRange": ["TtoS5jtb", "IBpCnxqu", "gzMKqwEI"]}, {"action": 55, "resource": "1vLDg7U4", "schedAction": 35, "schedCron": "d0eArwQN", "schedRange": ["qXdlECGV", "KLzAdiJb", "tu6VPAVx"]}], "roleName": "ic3FCFva"}' \
    > test.out 2>&1
eval_tap $? 223 'AdminCreateRoleV3' test.out

#- 224 AdminGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV3 \
    --roleId 'gkt3xGdf' \
    > test.out 2>&1
eval_tap $? 224 'AdminGetRoleV3' test.out

#- 225 AdminDeleteRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV3 \
    --roleId 'KBNQZfRp' \
    > test.out 2>&1
eval_tap $? 225 'AdminDeleteRoleV3' test.out

#- 226 AdminUpdateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV3 \
    --roleId 'kwFrfFj0' \
    --body '{"deletable": true, "isWildcard": false, "roleName": "JiNpF4xT"}' \
    > test.out 2>&1
eval_tap $? 226 'AdminUpdateRoleV3' test.out

#- 227 AdminGetRoleAdminStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleAdminStatusV3 \
    --roleId 'jt95ZoIn' \
    > test.out 2>&1
eval_tap $? 227 'AdminGetRoleAdminStatusV3' test.out

#- 228 AdminUpdateAdminRoleStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateAdminRoleStatusV3 \
    --roleId '3lcIpV9C' \
    > test.out 2>&1
eval_tap $? 228 'AdminUpdateAdminRoleStatusV3' test.out

#- 229 AdminRemoveRoleAdminV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleAdminV3 \
    --roleId 'Mm3AT6rD' \
    > test.out 2>&1
eval_tap $? 229 'AdminRemoveRoleAdminV3' test.out

#- 230 AdminGetRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleManagersV3 \
    --roleId 'nIG0iADS' \
    --after 'PuJY7jyd' \
    --before 'wZIIWEMa' \
    --limit '18' \
    > test.out 2>&1
eval_tap $? 230 'AdminGetRoleManagersV3' test.out

#- 231 AdminAddRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleManagersV3 \
    --roleId 'JC4Vv4CV' \
    --body '{"managers": [{"displayName": "3LoJcCJN", "namespace": "HvSdD8I0", "userId": "t5983Fb5"}, {"displayName": "dvdEHZoY", "namespace": "WJ0dHNiZ", "userId": "PGKgnLdE"}, {"displayName": "kp83oNxH", "namespace": "gvl8nS7A", "userId": "OuxB9eQe"}]}' \
    > test.out 2>&1
eval_tap $? 231 'AdminAddRoleManagersV3' test.out

#- 232 AdminRemoveRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleManagersV3 \
    --roleId 'ih6ZUJbD' \
    --body '{"managers": [{"displayName": "ihIWJxvf", "namespace": "8qnUAIex", "userId": "dxA6qjdS"}, {"displayName": "GjZclB05", "namespace": "cBiCE80v", "userId": "2TOpNMic"}, {"displayName": "vljhQVtP", "namespace": "JiSK9IDy", "userId": "WBGrU6EB"}]}' \
    > test.out 2>&1
eval_tap $? 232 'AdminRemoveRoleManagersV3' test.out

#- 233 AdminGetRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleMembersV3 \
    --roleId 'vRQ4gISq' \
    --after 'eTpIQhrr' \
    --before 'bv2KNa5w' \
    --limit '65' \
    > test.out 2>&1
eval_tap $? 233 'AdminGetRoleMembersV3' test.out

#- 234 AdminAddRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleMembersV3 \
    --roleId 'WYTIZEYa' \
    --body '{"members": [{"displayName": "JiHbQ90u", "namespace": "szohASvv", "userId": "l8AbzEUR"}, {"displayName": "mPgiuY7P", "namespace": "DGyPYrtH", "userId": "wBK3nlEh"}, {"displayName": "O7PEJFw5", "namespace": "oaPqlJrU", "userId": "73GfF0Lx"}]}' \
    > test.out 2>&1
eval_tap $? 234 'AdminAddRoleMembersV3' test.out

#- 235 AdminRemoveRoleMembersV3
eval_tap 0 235 'AdminRemoveRoleMembersV3 # SKIP deprecated' test.out

#- 236 AdminUpdateRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV3 \
    --roleId 'Sp2zMe7J' \
    --body '{"permissions": [{"action": 97, "resource": "qJ7zQ7pw", "schedAction": 42, "schedCron": "NuUr1rRF", "schedRange": ["e0Lrefc7", "1BizvVmi", "G32OXpDd"]}, {"action": 57, "resource": "Rhe8LFQV", "schedAction": 66, "schedCron": "4jWAWlvn", "schedRange": ["C06mXVZf", "MDRkbhdu", "25EBOJpJ"]}, {"action": 15, "resource": "8pmXWv38", "schedAction": 55, "schedCron": "9LgPRAkY", "schedRange": ["f5cjsGSG", "Pf5VOb4n", "1UwkhyM4"]}]}' \
    > test.out 2>&1
eval_tap $? 236 'AdminUpdateRolePermissionsV3' test.out

#- 237 AdminAddRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV3 \
    --roleId '5c6W5BbO' \
    --body '{"permissions": [{"action": 55, "resource": "Mlz0WGgi", "schedAction": 58, "schedCron": "l84G2xND", "schedRange": ["fFgUzUAf", "IM3Qrc2k", "dg9ZLoEa"]}, {"action": 53, "resource": "psY0jjuP", "schedAction": 9, "schedCron": "THjQVrXB", "schedRange": ["IksDEfFq", "HjKm5xEP", "WHsmIN7g"]}, {"action": 46, "resource": "aJSRI2zZ", "schedAction": 72, "schedCron": "RknPiX6G", "schedRange": ["5Ig4PvNK", "YllIlqlE", "mYSYOT3r"]}]}' \
    > test.out 2>&1
eval_tap $? 237 'AdminAddRolePermissionsV3' test.out

#- 238 AdminDeleteRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV3 \
    --roleId 'LBFsSafb' \
    --body '["Pesh44Mb", "VZrNpji0", "G0A4HohJ"]' \
    > test.out 2>&1
eval_tap $? 238 'AdminDeleteRolePermissionsV3' test.out

#- 239 AdminDeleteRolePermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionV3 \
    --action '6' \
    --resource 'cvpcYN8P' \
    --roleId 'FSZb0qGe' \
    > test.out 2>&1
eval_tap $? 239 'AdminDeleteRolePermissionV3' test.out

#- 240 AdminGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam adminGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 240 'AdminGetMyUserV3' test.out

#- 241 UserAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam userAuthenticationV3 \
    --clientId 'FoOF5Twx' \
    --extendExp  \
    --redirectUri '8XNJtEkJ' \
    --password '8jBA9mfX' \
    --requestId 'VLY8YTUe' \
    --userName 'Wgf1EapL' \
    > test.out 2>&1
eval_tap $? 241 'UserAuthenticationV3' test.out

#- 242 AuthenticationWithPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV3 \
    --extendExp  \
    --clientId 'Ir8DNmWh' \
    --linkingToken 'Td3ZQ1AI' \
    --password 'JIUx5kQs' \
    --username 'HF7pa339' \
    > test.out 2>&1
eval_tap $? 242 'AuthenticationWithPlatformLinkV3' test.out

#- 243 AuthenticateAndLinkForwardV3
./ng net.accelbyte.sdk.cli.Main iam authenticateAndLinkForwardV3 \
    --extendExp  \
    --clientId 'HvKQfLYd' \
    --linkingToken 'S8Li2ral' \
    --password '5z6Ess8v' \
    --username 'NRc2TLiS' \
    > test.out 2>&1
eval_tap $? 243 'AuthenticateAndLinkForwardV3' test.out

#- 244 PublicGetSystemConfigV3
./ng net.accelbyte.sdk.cli.Main iam publicGetSystemConfigV3 \
    > test.out 2>&1
eval_tap $? 244 'PublicGetSystemConfigV3' test.out

#- 245 GenerateTokenByNewHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV3 \
    --additionalData '4XOjJKOr' \
    --extendExp  \
    --linkingToken '0LzbQK0N' \
    > test.out 2>&1
eval_tap $? 245 'GenerateTokenByNewHeadlessAccountV3' test.out

#- 246 RequestOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam requestOneTimeLinkingCodeV3 \
    --redirectUri 'JNO69NmW' \
    --state 'SrbR0evJ' \
    --platformId 'oMkANWa2' \
    > test.out 2>&1
eval_tap $? 246 'RequestOneTimeLinkingCodeV3' test.out

#- 247 ValidateOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam validateOneTimeLinkingCodeV3 \
    --oneTimeLinkCode 'Vj7WVLPT' \
    > test.out 2>&1
eval_tap $? 247 'ValidateOneTimeLinkingCodeV3' test.out

#- 248 RequestTokenByOneTimeLinkCodeResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTokenByOneTimeLinkCodeResponseV3 \
    --additionalData 'Ol5cbF4O' \
    --isTransient  \
    --clientId 'q5q5rIHy' \
    --oneTimeLinkCode 'm7vZAF5R' \
    > test.out 2>&1
eval_tap $? 248 'RequestTokenByOneTimeLinkCodeResponseV3' test.out

#- 249 GetCountryLocationV3
./ng net.accelbyte.sdk.cli.Main iam getCountryLocationV3 \
    > test.out 2>&1
eval_tap $? 249 'GetCountryLocationV3' test.out

#- 250 Logout
./ng net.accelbyte.sdk.cli.Main iam logout \
    > test.out 2>&1
eval_tap $? 250 'Logout' test.out

#- 251 RequestTokenExchangeCodeV3
./ng net.accelbyte.sdk.cli.Main iam requestTokenExchangeCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --codeChallenge 'wYy3jYsj' \
    --codeChallengeMethod 'plain' \
    --clientId 'wkLyqrMg' \
    > test.out 2>&1
eval_tap $? 251 'RequestTokenExchangeCodeV3' test.out

#- 252 AdminRetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam adminRetrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'AEDTqoB7' \
    --userId 'Xg0sIVQf' \
    --platformUserId 'xtpfpZD4' \
    > test.out 2>&1
eval_tap $? 252 'AdminRetrieveUserThirdPartyPlatformTokenV3' test.out

#- 253 RevokeUserV3
./ng net.accelbyte.sdk.cli.Main iam revokeUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'yxWC2zbj' \
    --includeGameNamespace  \
    > test.out 2>&1
eval_tap $? 253 'RevokeUserV3' test.out

#- 254 AuthorizeV3
./ng net.accelbyte.sdk.cli.Main iam authorizeV3 \
    --blockedPlatformId 'ZMx2cMTo' \
    --codeChallenge 'ZrldtcHd' \
    --codeChallengeMethod 'S256' \
    --createHeadless  \
    --loginWebBased  \
    --nonce 'i3as2lFQ' \
    --oneTimeLinkCode 'bxYVqyWw' \
    --redirectUri 'i323eeIH' \
    --scope 'FWofy9qR' \
    --state '9BJFzJyo' \
    --targetAuthPage '3tu9Ftgb' \
    --useRedirectUriAsLoginUrlWhenLocked  \
    --clientId 'vhht4n9y' \
    --responseType 'code' \
    > test.out 2>&1
eval_tap $? 254 'AuthorizeV3' test.out

#- 255 TokenIntrospectionV3
./ng net.accelbyte.sdk.cli.Main iam tokenIntrospectionV3 \
    --token 'mXTTtqfu' \
    > test.out 2>&1
eval_tap $? 255 'TokenIntrospectionV3' test.out

#- 256 GetJWKSV3
./ng net.accelbyte.sdk.cli.Main iam getJWKSV3 \
    > test.out 2>&1
eval_tap $? 256 'GetJWKSV3' test.out

#- 257 SendMFAAuthenticationCode
./ng net.accelbyte.sdk.cli.Main iam sendMFAAuthenticationCode \
    --clientId 'Orl8UZwd' \
    --factor 'S2B3tDSE' \
    --mfaToken 'ffcYMhz3' \
    > test.out 2>&1
eval_tap $? 257 'SendMFAAuthenticationCode' test.out

#- 258 Change2faMethod
./ng net.accelbyte.sdk.cli.Main iam change2faMethod \
    --factor 'MmFJZX2G' \
    --mfaToken 'YR4JE8WG' \
    > test.out 2>&1
eval_tap $? 258 'Change2faMethod' test.out

#- 259 Verify2faCode
./ng net.accelbyte.sdk.cli.Main iam verify2faCode \
    --code 'RT1FAB6o' \
    --factor 'JDYJhMsg' \
    --mfaToken 'mDrck9ru' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 259 'Verify2faCode' test.out

#- 260 Verify2faCodeForward
./ng net.accelbyte.sdk.cli.Main iam verify2faCodeForward \
    --defaultFactor 'EAaOeSwC' \
    --factors 'WbZucVck' \
    --rememberDevice  \
    --clientId 'gjBxu93B' \
    --code 'ncfyvRAN' \
    --factor 'glytNRBx' \
    --mfaToken 'uiK584Xx' \
    > test.out 2>&1
eval_tap $? 260 'Verify2faCodeForward' test.out

#- 261 RetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam retrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '0ixc0nNf' \
    --userId '9yXpRY9l' \
    > test.out 2>&1
eval_tap $? 261 'RetrieveUserThirdPartyPlatformTokenV3' test.out

#- 262 AuthCodeRequestV3
./ng net.accelbyte.sdk.cli.Main iam authCodeRequestV3 \
    --platformId 'yHACj2Bf' \
    --clientId 'OSHT8sN8' \
    --redirectUri 'ujzpz35x' \
    --requestId 'NwyNGwo4' \
    > test.out 2>&1
eval_tap $? 262 'AuthCodeRequestV3' test.out

#- 263 PlatformTokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV3 \
    --platformId 'JrF4bwVd' \
    --additionalData 'DM4mARM6' \
    --clientId 'Mt3bQIFS' \
    --createHeadless  \
    --deviceId 'r87KepSw' \
    --macAddress 'MLK1sH3O' \
    --platformToken 'CNiwdotC' \
    --serviceLabel '0.3203724551165342' \
    --skipSetCookie  \
    > test.out 2>&1
eval_tap $? 263 'PlatformTokenGrantV3' test.out

#- 264 GetRevocationListV3
./ng net.accelbyte.sdk.cli.Main iam getRevocationListV3 \
    > test.out 2>&1
eval_tap $? 264 'GetRevocationListV3' test.out

#- 265 TokenRevocationV3
./ng net.accelbyte.sdk.cli.Main iam tokenRevocationV3 \
    --token 'PqMUObmd' \
    > test.out 2>&1
eval_tap $? 265 'TokenRevocationV3' test.out

#- 266 SimultaneousLoginV3
./ng net.accelbyte.sdk.cli.Main iam simultaneousLoginV3 \
    --simultaneousPlatform 'oDcBxmqn' \
    --simultaneousTicket 'fGx3tN5w' \
    --nativePlatform 'steam' \
    --nativePlatformTicket 'zqCxkS0Y' \
    > test.out 2>&1
eval_tap $? 266 'SimultaneousLoginV3' test.out

#- 267 TokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV3 \
    --additionalData '92haYiLj' \
    --clientId 'sxRdaEfM' \
    --clientSecret 'PAtVkwPF' \
    --code 'ypJjsYXu' \
    --codeVerifier 'XzcMlDS0' \
    --extendNamespace 'Cs7uWs2j' \
    --extendExp  \
    --password 'LMOLBhAZ' \
    --redirectUri 'm7CKZ4zD' \
    --refreshToken 'ieFQIoME' \
    --scope 'ZyJs0yrR' \
    --username 'CWY3QqH6' \
    --grantType 'urn:ietf:params:oauth:grant-type:extend_client_credentials' \
    > test.out 2>&1
eval_tap $? 267 'TokenGrantV3' test.out

#- 268 VerifyTokenV3
./ng net.accelbyte.sdk.cli.Main iam verifyTokenV3 \
    --token 'ltwerYte' \
    > test.out 2>&1
eval_tap $? 268 'VerifyTokenV3' test.out

#- 269 PlatformAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticationV3 \
    --platformId 'dGiHOx2l' \
    --code 'd4TyIK2q' \
    --error 'lCcX4HvA' \
    --openidAssocHandle '1nCTNHvu' \
    --openidClaimedId 'Tqh8BhlP' \
    --openidIdentity 'DVRrMSNc' \
    --openidMode 'HFu5PFgE' \
    --openidNs '2qOKiMvZ' \
    --openidOpEndpoint 'Ac2zVAl7' \
    --openidResponseNonce '3YLlGGdF' \
    --openidReturnTo 'rpVi0At3' \
    --openidSig '1bq6ioCC' \
    --openidSigned 'Vmm3Jv9Y' \
    --state 'aZh113bt' \
    > test.out 2>&1
eval_tap $? 269 'PlatformAuthenticationV3' test.out

#- 270 PlatformTokenRefreshV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenRefreshV3 \
    --platformId '8I1aBw4o' \
    --platformToken '9GKgBglu' \
    > test.out 2>&1
eval_tap $? 270 'PlatformTokenRefreshV3' test.out

#- 271 PublicGetInputValidations
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidations \
    --defaultOnEmpty  \
    --languageCode '9eeqFomu' \
    > test.out 2>&1
eval_tap $? 271 'PublicGetInputValidations' test.out

#- 272 PublicGetInputValidationByField
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidationByField \
    --field '7kShAppN' \
    > test.out 2>&1
eval_tap $? 272 'PublicGetInputValidationByField' test.out

#- 273 PublicGetCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam publicGetCountryAgeRestrictionV3 \
    --countryCode 'OhT58wdt' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 273 'PublicGetCountryAgeRestrictionV3' test.out

#- 274 PublicGetConfigValueV3
./ng net.accelbyte.sdk.cli.Main iam publicGetConfigValueV3 \
    --configKey 'gFpLwP7M' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 274 'PublicGetConfigValueV3' test.out

#- 275 PublicGetCountryListV3
./ng net.accelbyte.sdk.cli.Main iam publicGetCountryListV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 275 'PublicGetCountryListV3' test.out

#- 276 RetrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3
./ng net.accelbyte.sdk.cli.Main iam retrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 276 'RetrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3' test.out

#- 277 RetrieveActiveOIDCClientsPublicV3
./ng net.accelbyte.sdk.cli.Main iam retrieveActiveOIDCClientsPublicV3 \
    --namespace "$AB_NAMESPACE" \
    --clientId 'x51QBduO' \
    > test.out 2>&1
eval_tap $? 277 'RetrieveActiveOIDCClientsPublicV3' test.out

#- 278 PublicListUserIDByPlatformUserIDsV3
eval_tap 0 278 'PublicListUserIDByPlatformUserIDsV3 # SKIP deprecated' test.out

#- 279 PublicGetUserByPlatformUserIDV3
eval_tap 0 279 'PublicGetUserByPlatformUserIDV3 # SKIP deprecated' test.out

#- 280 PublicGetProfileUpdateStrategyV3
./ng net.accelbyte.sdk.cli.Main iam publicGetProfileUpdateStrategyV3 \
    --namespace "$AB_NAMESPACE" \
    --field 'username' \
    > test.out 2>&1
eval_tap $? 280 'PublicGetProfileUpdateStrategyV3' test.out

#- 281 PublicGetAsyncStatus
./ng net.accelbyte.sdk.cli.Main iam publicGetAsyncStatus \
    --namespace "$AB_NAMESPACE" \
    --requestId 'VIZdBDdx' \
    > test.out 2>&1
eval_tap $? 281 'PublicGetAsyncStatus' test.out

#- 282 PublicSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam publicSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'NKWtnKjW' \
    --limit '24' \
    --offset '89' \
    --platformBy 'u7kQyxlj' \
    --platformId 'u5LwruFe' \
    --query 'YK2hIGMM' \
    > test.out 2>&1
eval_tap $? 282 'PublicSearchUserV3' test.out

#- 283 PublicCreateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "jYfNqnjH", "acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "PllycV1o", "policyId": "r9VmCxJa", "policyVersionId": "4NdIXuz7"}, {"isAccepted": true, "localizedPolicyVersionId": "ffD8SVWc", "policyId": "ggKlDOOY", "policyVersionId": "BEY2TrKc"}, {"isAccepted": false, "localizedPolicyVersionId": "eSqptWqn", "policyId": "RAJ1Ku8J", "policyVersionId": "0Rnfuvno"}], "authType": "Jt0lVLwW", "code": "RCZzsg76", "country": "E3ELLaSs", "dateOfBirth": "rcSsdzRv", "displayName": "ZYXwPbIC", "emailAddress": "xZC6GoQ8", "password": "pNH1XlCh", "reachMinimumAge": false, "uniqueDisplayName": "1Au9jbue"}' \
    > test.out 2>&1
eval_tap $? 283 'PublicCreateUserV3' test.out

#- 284 CheckUserAvailability
./ng net.accelbyte.sdk.cli.Main iam checkUserAvailability \
    --namespace "$AB_NAMESPACE" \
    --field 'ZAoUqIcQ' \
    --query 'kGLxSC5X' \
    > test.out 2>&1
eval_tap $? 284 'CheckUserAvailability' test.out

#- 285 PublicBulkGetUsers
eval_tap 0 285 'PublicBulkGetUsers # SKIP deprecated' test.out

#- 286 PublicSendRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicSendRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "XlbLghib", "languageTag": "2xbFU0T4"}' \
    > test.out 2>&1
eval_tap $? 286 'PublicSendRegistrationCode' test.out

#- 287 PublicVerifyRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicVerifyRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "J3fnyPqD", "emailAddress": "RR2PPeXx"}' \
    > test.out 2>&1
eval_tap $? 287 'PublicVerifyRegistrationCode' test.out

#- 288 PublicForgotPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicForgotPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "vlMZSlhi", "languageTag": "TqJa35GT"}' \
    > test.out 2>&1
eval_tap $? 288 'PublicForgotPasswordV3' test.out

#- 289 PublicValidateUserInput
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserInput \
    --namespace "$AB_NAMESPACE" \
    --body '{"displayName": "AX9vQiT0", "password": "6fuDhYsL", "uniqueDisplayName": "Zx6z2V9q", "username": "h8mZHpK7"}' \
    > test.out 2>&1
eval_tap $? 289 'PublicValidateUserInput' test.out

#- 290 GetAdminInvitationV3
./ng net.accelbyte.sdk.cli.Main iam getAdminInvitationV3 \
    --invitationId 'cJ5sry3U' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 290 'GetAdminInvitationV3' test.out

#- 291 CreateUserFromInvitationV3
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV3 \
    --invitationId 'fJKQsMMk' \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "VPtfNBIz", "acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "p79YR5io", "policyId": "rWzrTWwz", "policyVersionId": "rgEBSsNi"}, {"isAccepted": false, "localizedPolicyVersionId": "IzpabpkP", "policyId": "6J4R9APQ", "policyVersionId": "ixoGZcjS"}, {"isAccepted": false, "localizedPolicyVersionId": "vUUxGmiW", "policyId": "0rweOjSB", "policyVersionId": "FVRS7Snn"}], "authType": "7UgcaTbc", "code": "I9ft6WIR", "country": "rrh4AWvS", "dateOfBirth": "wCiJDdoE", "displayName": "SCsevTkl", "emailAddress": "MhwZh82L", "password": "iMoyNRIW", "reachMinimumAge": true, "uniqueDisplayName": "jo3Ewxrq"}' \
    > test.out 2>&1
eval_tap $? 291 'CreateUserFromInvitationV3' test.out

#- 292 UpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam updateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "KxGSI5Qq", "country": "TR4t2dOF", "dateOfBirth": "sBhSpcrQ", "displayName": "oHkWXNKm", "languageTag": "872dNk0D", "uniqueDisplayName": "xh7fiwF6", "userName": "2tpy09C1"}' \
    > test.out 2>&1
eval_tap $? 292 'UpdateUserV3' test.out

#- 293 PublicPartialUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicPartialUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "8vpzEH6B", "country": "c6I1gsHY", "dateOfBirth": "qDiY13wm", "displayName": "Dlw41TVZ", "languageTag": "Vq6iWnq9", "uniqueDisplayName": "q8btcYdH", "userName": "vrcctr5L"}' \
    > test.out 2>&1
eval_tap $? 293 'PublicPartialUpdateUserV3' test.out

#- 294 PublicSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"context": "2UzrKkQs", "emailAddress": "BYhTR5TF", "languageTag": "bGaDM4Z0", "upgradeToken": "YvJnGd9j"}' \
    > test.out 2>&1
eval_tap $? 294 'PublicSendVerificationCodeV3' test.out

#- 295 PublicUserVerificationV3
./ng net.accelbyte.sdk.cli.Main iam publicUserVerificationV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "cv0y51Sz", "contactType": "9vP7vdBH", "languageTag": "zdEWvtXD", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 295 'PublicUserVerificationV3' test.out

#- 296 PublicUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "2o1Bp94Y", "country": "fiR0hD0M", "dateOfBirth": "rCzA8GTw", "displayName": "BqdRVYuf", "emailAddress": "Z1X7duge", "password": "ZKz1XHPl", "uniqueDisplayName": "K90xrOlW", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 296 'PublicUpgradeHeadlessAccountV3' test.out

#- 297 PublicVerifyHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --needVerificationCode  \
    --body '{"emailAddress": "w8rw84Ei", "password": "YUqoQuyx"}' \
    > test.out 2>&1
eval_tap $? 297 'PublicVerifyHeadlessAccountV3' test.out

#- 298 PublicUpdatePasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicUpdatePasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"languageTag": "lMpxx1X1", "mfaToken": "S0VG7NZ3", "newPassword": "txt8NB82", "oldPassword": "wbbkG43p"}' \
    > test.out 2>&1
eval_tap $? 298 'PublicUpdatePasswordV3' test.out

#- 299 PublicCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam publicCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'C4nFxVVl' \
    > test.out 2>&1
eval_tap $? 299 'PublicCreateJusticeUser' test.out

#- 300 PublicPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '60Rj6HFm' \
    --redirectUri 'rUw2oMGE' \
    --ticket 'Cpq3vQaq' \
    > test.out 2>&1
eval_tap $? 300 'PublicPlatformLinkV3' test.out

#- 301 PublicPlatformUnlinkV3
eval_tap 0 301 'PublicPlatformUnlinkV3 # SKIP deprecated' test.out

#- 302 PublicPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'BFdPYjZl' \
    > test.out 2>&1
eval_tap $? 302 'PublicPlatformUnlinkAllV3' test.out

#- 303 PublicForcePlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicForcePlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'rKJe0HPs' \
    --ticket 'hLnfOxBV' \
    > test.out 2>&1
eval_tap $? 303 'PublicForcePlatformLinkV3' test.out

#- 304 PublicWebLinkPlatform
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatform \
    --namespace "$AB_NAMESPACE" \
    --platformId 'xhftAYjm' \
    --clientId 'IkvZWEHU' \
    --redirectUri 'OJB0qBfD' \
    > test.out 2>&1
eval_tap $? 304 'PublicWebLinkPlatform' test.out

#- 305 PublicWebLinkPlatformEstablish
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatformEstablish \
    --namespace "$AB_NAMESPACE" \
    --platformId 'W0oOuXGg' \
    --code 'sKk0kIdd' \
    --state 'WSDWFFQp' \
    > test.out 2>&1
eval_tap $? 305 'PublicWebLinkPlatformEstablish' test.out

#- 306 PublicProcessWebLinkPlatformV3
./ng net.accelbyte.sdk.cli.Main iam publicProcessWebLinkPlatformV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'tFJn8u7L' \
    --code 'hjHN5DVJ' \
    --state 'QzshTNXc' \
    > test.out 2>&1
eval_tap $? 306 'PublicProcessWebLinkPlatformV3' test.out

#- 307 PublicGetUsersPlatformInfosV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUsersPlatformInfosV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"platformId": "ISACQ4Jq", "userIds": ["U5TnOGpt", "eZjNaW6F", "fG5Jzibc"]}' \
    > test.out 2>&1
eval_tap $? 307 'PublicGetUsersPlatformInfosV3' test.out

#- 308 ResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam resetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientId": "zRqhaGLg", "code": "7QfBCdOK", "emailAddress": "JGSxHCHn", "languageTag": "waR0ttDE", "newPassword": "MCvfmoqE"}' \
    > test.out 2>&1
eval_tap $? 308 'ResetPasswordV3' test.out

#- 309 PublicGetUserByUserIdV3
eval_tap 0 309 'PublicGetUserByUserIdV3 # SKIP deprecated' test.out

#- 310 PublicGetUserBanHistoryV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserBanHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'odkSPCQY' \
    --activeOnly  \
    --after 'ZEJKl3Rj' \
    --before 'EPDqrRUQ' \
    --limit '53' \
    > test.out 2>&1
eval_tap $? 310 'PublicGetUserBanHistoryV3' test.out

#- 311 PublicListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ukP9kLV1' \
    > test.out 2>&1
eval_tap $? 311 'PublicListUserAllPlatformAccountsDistinctV3' test.out

#- 312 PublicGetUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'mnINpFCt' \
    > test.out 2>&1
eval_tap $? 312 'PublicGetUserInformationV3' test.out

#- 313 PublicGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ASDHutz5' \
    --after '0.17953007596530624' \
    --before '0.09444840406264254' \
    --limit '90' \
    > test.out 2>&1
eval_tap $? 313 'PublicGetUserLoginHistoriesV3' test.out

#- 314 PublicGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Q8T8uGrT' \
    --after 'c4dfzVKc' \
    --before 'InG3XAL5' \
    --limit '61' \
    --platformId 'wqKVjzwD' \
    > test.out 2>&1
eval_tap $? 314 'PublicGetUserPlatformAccountsV3' test.out

#- 315 PublicListJusticePlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicListJusticePlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'KrpWKz01' \
    > test.out 2>&1
eval_tap $? 315 'PublicListJusticePlatformAccountsV3' test.out

#- 316 PublicLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam publicLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'fffsRcKh' \
    --body '{"platformId": "Run7dFMS", "platformUserId": "A6dNoFe2"}' \
    > test.out 2>&1
eval_tap $? 316 'PublicLinkPlatformAccount' test.out

#- 317 PublicForceLinkPlatformWithProgression
./ng net.accelbyte.sdk.cli.Main iam publicForceLinkPlatformWithProgression \
    --namespace "$AB_NAMESPACE" \
    --userId 'F7LlWEpR' \
    --body '{"chosenNamespaces": ["CwFIpgOJ", "qFyzSLJ8", "DYkG9eWV"], "requestId": "V4NiRMh7"}' \
    > test.out 2>&1
eval_tap $? 317 'PublicForceLinkPlatformWithProgression' test.out

#- 318 PublicGetPublisherUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetPublisherUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'E5Ajfxb4' \
    > test.out 2>&1
eval_tap $? 318 'PublicGetPublisherUserV3' test.out

#- 319 PublicValidateUserByUserIDAndPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserByUserIDAndPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZkLUIWOD' \
    --password 'v9Lk5pTo' \
    > test.out 2>&1
eval_tap $? 319 'PublicValidateUserByUserIDAndPasswordV3' test.out

#- 320 PublicGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRolesV3 \
    --after 'T9iBh1eK' \
    --before 'eODa9GDy' \
    --isWildcard  \
    --limit '31' \
    > test.out 2>&1
eval_tap $? 320 'PublicGetRolesV3' test.out

#- 321 PublicGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRoleV3 \
    --roleId '0KeAsJSB' \
    > test.out 2>&1
eval_tap $? 321 'PublicGetRoleV3' test.out

#- 322 PublicForgotPasswordWithoutNamespaceV3
./ng net.accelbyte.sdk.cli.Main iam publicForgotPasswordWithoutNamespaceV3 \
    --body '{"clientId": "TRr217tt", "emailAddress": "tWilp0xk", "languageTag": "1sH6hD2q"}' \
    > test.out 2>&1
eval_tap $? 322 'PublicForgotPasswordWithoutNamespaceV3' test.out

#- 323 PublicGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyUserV3 \
    --includeAllPlatforms  \
    > test.out 2>&1
eval_tap $? 323 'PublicGetMyUserV3' test.out

#- 324 PublicSendCodeForwardV3
./ng net.accelbyte.sdk.cli.Main iam publicSendCodeForwardV3 \
    --body '{"context": "FCKkm70K", "emailAddress": "BQFa6OOJ", "languageTag": "d9nfulXl", "upgradeToken": "Sht8qp9V"}' \
    > test.out 2>&1
eval_tap $? 324 'PublicSendCodeForwardV3' test.out

#- 325 PublicGetLinkHeadlessAccountToMyAccountConflictV3
./ng net.accelbyte.sdk.cli.Main iam publicGetLinkHeadlessAccountToMyAccountConflictV3 \
    --oneTimeLinkCode 'gtD33il7' \
    > test.out 2>&1
eval_tap $? 325 'PublicGetLinkHeadlessAccountToMyAccountConflictV3' test.out

#- 326 LinkHeadlessAccountToMyAccountV3
./ng net.accelbyte.sdk.cli.Main iam linkHeadlessAccountToMyAccountV3 \
    --body '{"chosenNamespaces": ["TcKoQBxt", "rFfZqvJd", "LT5vB4iV"], "oneTimeLinkCode": "Hsb6FXip"}' \
    > test.out 2>&1
eval_tap $? 326 'LinkHeadlessAccountToMyAccountV3' test.out

#- 327 PublicGetMyRedirectionAfterLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyRedirectionAfterLinkV3 \
    --oneTimeLinkCode 'UKEy5zam' \
    > test.out 2>&1
eval_tap $? 327 'PublicGetMyRedirectionAfterLinkV3' test.out

#- 328 PublicGetMyProfileAllowUpdateStatusV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyProfileAllowUpdateStatusV3 \
    > test.out 2>&1
eval_tap $? 328 'PublicGetMyProfileAllowUpdateStatusV3' test.out

#- 329 PublicSendVerificationLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationLinkV3 \
    --body '{"languageTag": "uo674mJ8"}' \
    > test.out 2>&1
eval_tap $? 329 'PublicSendVerificationLinkV3' test.out

#- 330 PublicGetOpenidUserInfoV3
./ng net.accelbyte.sdk.cli.Main iam publicGetOpenidUserInfoV3 \
    > test.out 2>&1
eval_tap $? 330 'PublicGetOpenidUserInfoV3' test.out

#- 331 PublicVerifyUserByLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyUserByLinkV3 \
    --code 'mCZnGzG2' \
    > test.out 2>&1
eval_tap $? 331 'PublicVerifyUserByLinkV3' test.out

#- 332 PlatformAuthenticateSAMLV3Handler
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticateSAMLV3Handler \
    --platformId 'xWZ4sZcx' \
    --code 'W48cDU5G' \
    --error 'CsScvzQe' \
    --state 'vPq0EQej' \
    > test.out 2>&1
eval_tap $? 332 'PlatformAuthenticateSAMLV3Handler' test.out

#- 333 LoginSSOClient
./ng net.accelbyte.sdk.cli.Main iam loginSSOClient \
    --platformId 'D2U2Io2f' \
    --payload 'qleuUGcz' \
    > test.out 2>&1
eval_tap $? 333 'LoginSSOClient' test.out

#- 334 LogoutSSOClient
./ng net.accelbyte.sdk.cli.Main iam logoutSSOClient \
    --platformId 'vdGmbO3N' \
    > test.out 2>&1
eval_tap $? 334 'LogoutSSOClient' test.out

#- 335 RequestTargetTokenResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTargetTokenResponseV3 \
    --additionalData 'gaOMWlXx' \
    --code 'rhmJH3eT' \
    > test.out 2>&1
eval_tap $? 335 'RequestTargetTokenResponseV3' test.out

#- 336 UpgradeAndAuthenticateForwardV3
./ng net.accelbyte.sdk.cli.Main iam upgradeAndAuthenticateForwardV3 \
    --clientId '1w7F6E2Q' \
    --upgradeSuccessToken '7xQiBxzR' \
    > test.out 2>&1
eval_tap $? 336 'UpgradeAndAuthenticateForwardV3' test.out

#- 337 AdminListInvitationHistoriesV4
./ng net.accelbyte.sdk.cli.Main iam adminListInvitationHistoriesV4 \
    --limit '31' \
    --namespace "$AB_NAMESPACE" \
    --offset '83' \
    > test.out 2>&1
eval_tap $? 337 'AdminListInvitationHistoriesV4' test.out

#- 338 AdminGetDevicesByUserV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDevicesByUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'KuSM8eeZ' \
    > test.out 2>&1
eval_tap $? 338 'AdminGetDevicesByUserV4' test.out

#- 339 AdminGetBannedDevicesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedDevicesV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceType 'Qwo4NL5I' \
    --endDate 'VSKjU0kX' \
    --limit '94' \
    --offset '17' \
    --startDate 'HaYL3Mbd' \
    > test.out 2>&1
eval_tap $? 339 'AdminGetBannedDevicesV4' test.out

#- 340 AdminGetUserDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeviceBansV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'dyKnZ6at' \
    > test.out 2>&1
eval_tap $? 340 'AdminGetUserDeviceBansV4' test.out

#- 341 AdminBanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminBanDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"comment": "x9WE08sQ", "deviceId": "sqRjPm3p", "deviceType": "XzbGbceD", "enabled": true, "endDate": "lx0nn4Rw", "ext": {"jL0guHAS": {}, "kt8OEulk": {}, "F2BHxaXJ": {}}, "reason": "5CYE92JN"}' \
    > test.out 2>&1
eval_tap $? 341 'AdminBanDeviceV4' test.out

#- 342 AdminGetDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBanV4 \
    --banId 'WhCD0tUU' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 342 'AdminGetDeviceBanV4' test.out

#- 343 AdminUpdateDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateDeviceBanV4 \
    --banId 'NmG6W8yg' \
    --namespace "$AB_NAMESPACE" \
    --body '{"enabled": false}' \
    > test.out 2>&1
eval_tap $? 343 'AdminUpdateDeviceBanV4' test.out

#- 344 AdminGenerateReportV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateReportV4 \
    --namespace "$AB_NAMESPACE" \
    --endDate 'cyuaIo2y' \
    --startDate 'pLXdoVuv' \
    --deviceType 'v6pdCvhr' \
    > test.out 2>&1
eval_tap $? 344 'AdminGenerateReportV4' test.out

#- 345 AdminGetDeviceTypesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceTypesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 345 'AdminGetDeviceTypesV4' test.out

#- 346 AdminGetDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBansV4 \
    --deviceId 'zhUyK8Yd' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 346 'AdminGetDeviceBansV4' test.out

#- 347 AdminDecryptDeviceV4
eval_tap 0 347 'AdminDecryptDeviceV4 # SKIP deprecated' test.out

#- 348 AdminUnbanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminUnbanDeviceV4 \
    --deviceId 'Xh8jILkp' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 348 'AdminUnbanDeviceV4' test.out

#- 349 AdminGetUsersByDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUsersByDeviceV4 \
    --deviceId 'qecXSj0o' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 349 'AdminGetUsersByDeviceV4' test.out

#- 350 AdminGetNamespaceInvitationHistoryV4
./ng net.accelbyte.sdk.cli.Main iam adminGetNamespaceInvitationHistoryV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 350 'AdminGetNamespaceInvitationHistoryV4' test.out

#- 351 AdminGetNamespaceUserInvitationHistoryV4
./ng net.accelbyte.sdk.cli.Main iam adminGetNamespaceUserInvitationHistoryV4 \
    --namespace "$AB_NAMESPACE" \
    --limit '68' \
    --offset '13' \
    > test.out 2>&1
eval_tap $? 351 'AdminGetNamespaceUserInvitationHistoryV4' test.out

#- 352 AdminCreateTestUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateTestUsersV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 19, "userInfo": {"country": "IXR8n94u"}}' \
    > test.out 2>&1
eval_tap $? 352 'AdminCreateTestUsersV4' test.out

#- 353 AdminCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "lFz9tajy", "policyId": "esfKzoEp", "policyVersionId": "uchVMXV3"}, {"isAccepted": true, "localizedPolicyVersionId": "zxNzqDM1", "policyId": "c98fjjnr", "policyVersionId": "xBpvYvBq"}, {"isAccepted": true, "localizedPolicyVersionId": "DNh8lzaC", "policyId": "KaId1hbu", "policyVersionId": "ai9Kh68n"}], "authType": "EMAILPASSWD", "code": "USxCc5pw", "country": "RwaWpwgJ", "dateOfBirth": "tfscyqFC", "displayName": "SmAUcG4R", "emailAddress": "eerzE2jW", "password": "2s7ftjNL", "passwordMD5Sum": "NvbGOxnb", "reachMinimumAge": true, "uniqueDisplayName": "VxcV7sKY", "username": "1QFelELb"}' \
    > test.out 2>&1
eval_tap $? 353 'AdminCreateUserV4' test.out

#- 354 AdminBulkUpdateUserAccountTypeV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateUserAccountTypeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"testAccount": true, "userIds": ["uF6OcMqX", "fWjn4KCK", "xtOgffgO"]}' \
    > test.out 2>&1
eval_tap $? 354 'AdminBulkUpdateUserAccountTypeV4' test.out

#- 355 AdminBulkCheckValidUserIDV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkCheckValidUserIDV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["Va6vc6YQ", "2mIV07ma", "pCi6x7PS"]}' \
    > test.out 2>&1
eval_tap $? 355 'AdminBulkCheckValidUserIDV4' test.out

#- 356 AdminUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Xp4ubzIu' \
    --body '{"avatarUrl": "1YRRRQto", "country": "HyGaJcoN", "dateOfBirth": "cUIvoZK5", "displayName": "ZaaCOq94", "languageTag": "TebigILw", "skipLoginQueue": true, "tags": ["npnrEukC", "0u0i3Si8", "L6zEbxDo"], "uniqueDisplayName": "mdutwaIT", "userName": "kZDJcLgm"}' \
    > test.out 2>&1
eval_tap $? 356 'AdminUpdateUserV4' test.out

#- 357 AdminUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'hFc7Dx6H' \
    --body '{"code": "13yOQZGN", "emailAddress": "qS0sC92M"}' \
    > test.out 2>&1
eval_tap $? 357 'AdminUpdateUserEmailAddressV4' test.out

#- 358 AdminDisableUserMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableUserMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'gYqXqE30' \
    --body '{"factor": "4Ku990gV", "mfaToken": "86MD3P7J"}' \
    > test.out 2>&1
eval_tap $? 358 'AdminDisableUserMFAV4' test.out

#- 359 AdminGetUserMFAStatusV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUserMFAStatusV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'rk9uKAJy' \
    > test.out 2>&1
eval_tap $? 359 'AdminGetUserMFAStatusV4' test.out

#- 360 AdminListUserRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminListUserRolesV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'jeSZZSbO' \
    > test.out 2>&1
eval_tap $? 360 'AdminListUserRolesV4' test.out

#- 361 AdminUpdateUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'R1vnWxGh' \
    --body '{"assignedNamespaces": ["IrUvrXLv", "S2AZZ3BB", "XGe2aMEQ"], "roleId": "Nwh4FmEk"}' \
    > test.out 2>&1
eval_tap $? 361 'AdminUpdateUserRoleV4' test.out

#- 362 AdminAddUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Dj6NvmLd' \
    --body '{"assignedNamespaces": ["yJCAzUHD", "tANdDgQ0", "4opIpMWD"], "roleId": "3d3JHcE7"}' \
    > test.out 2>&1
eval_tap $? 362 'AdminAddUserRoleV4' test.out

#- 363 AdminRemoveUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRemoveUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'B4L5MQKq' \
    --body '{"assignedNamespaces": ["kuUC64fU", "7XT9c9ep", "TxBv6QLt"], "roleId": "GnHKYLYJ"}' \
    > test.out 2>&1
eval_tap $? 363 'AdminRemoveUserRoleV4' test.out

#- 364 AdminGetRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV4 \
    --adminRole  \
    --isWildcard  \
    --limit '20' \
    --offset '55' \
    > test.out 2>&1
eval_tap $? 364 'AdminGetRolesV4' test.out

#- 365 AdminCreateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV4 \
    --body '{"adminRole": false, "deletable": true, "isWildcard": false, "roleName": "gLj97XWU"}' \
    > test.out 2>&1
eval_tap $? 365 'AdminCreateRoleV4' test.out

#- 366 AdminGetRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV4 \
    --roleId 'Ydflpfb5' \
    > test.out 2>&1
eval_tap $? 366 'AdminGetRoleV4' test.out

#- 367 AdminDeleteRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV4 \
    --roleId 'JObwSDQa' \
    > test.out 2>&1
eval_tap $? 367 'AdminDeleteRoleV4' test.out

#- 368 AdminUpdateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV4 \
    --roleId '4i1378dk' \
    --body '{"adminRole": true, "deletable": false, "isWildcard": false, "roleName": "cqB3dI9q"}' \
    > test.out 2>&1
eval_tap $? 368 'AdminUpdateRoleV4' test.out

#- 369 AdminUpdateRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV4 \
    --roleId 'u79e8KmP' \
    --body '{"permissions": [{"action": 92, "resource": "iT9BYCBi", "schedAction": 18, "schedCron": "5sy2LPS8", "schedRange": ["JtxWaZEt", "KB88huwV", "5gdYaPmA"]}, {"action": 36, "resource": "iyEppqGo", "schedAction": 14, "schedCron": "rOSjjZLR", "schedRange": ["ao3Nj9Yc", "6a4tw99A", "Z2AoZNW1"]}, {"action": 86, "resource": "3M8dMccZ", "schedAction": 100, "schedCron": "5ExIeMSr", "schedRange": ["wihTvvRK", "JBnN1nak", "x5as56D6"]}]}' \
    > test.out 2>&1
eval_tap $? 369 'AdminUpdateRolePermissionsV4' test.out

#- 370 AdminAddRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV4 \
    --roleId 'iqjgxJoM' \
    --body '{"permissions": [{"action": 50, "resource": "WRUNk1mW", "schedAction": 16, "schedCron": "MZOurs1b", "schedRange": ["ZA8FbJvf", "W1Rt2JzF", "Kad8ioPh"]}, {"action": 16, "resource": "IgABoArY", "schedAction": 10, "schedCron": "FKAxkkLA", "schedRange": ["xb3vkMZZ", "Zbb92qxV", "ka6eOscs"]}, {"action": 27, "resource": "2iQqz3Jd", "schedAction": 38, "schedCron": "LStyrYaw", "schedRange": ["kWaDZrBB", "yDJVMPKx", "El71goqm"]}]}' \
    > test.out 2>&1
eval_tap $? 370 'AdminAddRolePermissionsV4' test.out

#- 371 AdminDeleteRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV4 \
    --roleId 'KTVpELFg' \
    --body '["zILgkUIN", "TaUP4jJo", "wm1oKKeu"]' \
    > test.out 2>&1
eval_tap $? 371 'AdminDeleteRolePermissionsV4' test.out

#- 372 AdminListAssignedUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminListAssignedUsersV4 \
    --roleId 'JKSNx3qa' \
    --after 'EYB8c27X' \
    --before 'tyGO8Kkt' \
    --limit '71' \
    > test.out 2>&1
eval_tap $? 372 'AdminListAssignedUsersV4' test.out

#- 373 AdminAssignUserToRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAssignUserToRoleV4 \
    --roleId 'ztbDB0wD' \
    --body '{"assignedNamespaces": ["My8L9Frs", "dUVAk68F", "FC9UdNRW"], "namespace": "JaM6F8eK", "userId": "XIWiQO4L"}' \
    > test.out 2>&1
eval_tap $? 373 'AdminAssignUserToRoleV4' test.out

#- 374 AdminRevokeUserFromRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRevokeUserFromRoleV4 \
    --roleId 'T3u2EMs2' \
    --body '{"namespace": "H27ys7e6", "userId": "XQDUiq77"}' \
    > test.out 2>&1
eval_tap $? 374 'AdminRevokeUserFromRoleV4' test.out

#- 375 AdminInviteUserNewV4
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserNewV4 \
    --body '{"assignedNamespaces": ["vD3qV5Rz", "8Saw0INQ", "E1g96tI6"], "emailAddresses": ["NKihpTAW", "p39rg6hj", "tuT2as3B"], "isAdmin": true, "isNewStudio": true, "languageTag": "Qdp9BeTq", "namespace": "OLVNbUUP", "roleId": "baXwc2Iz"}' \
    > test.out 2>&1
eval_tap $? 375 'AdminInviteUserNewV4' test.out

#- 376 AdminUpdateMyUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateMyUserV4 \
    --body '{"avatarUrl": "QKDKAC4U", "country": "V8Cf2nk3", "dateOfBirth": "vtOnKoun", "displayName": "XYK67UNm", "languageTag": "ds0hcG6d", "skipLoginQueue": true, "tags": ["VIAjERyY", "kI088MV5", "rcTwysF8"], "uniqueDisplayName": "KlCNy3vT", "userName": "JsW9BT8I"}' \
    > test.out 2>&1
eval_tap $? 376 'AdminUpdateMyUserV4' test.out

#- 377 AdminDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyAuthenticatorV4 \
    --body '{"factor": "wdX6Gmnr", "mfaToken": "l4Z6QEd0"}' \
    > test.out 2>&1
eval_tap $? 377 'AdminDisableMyAuthenticatorV4' test.out

#- 378 AdminEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyAuthenticatorV4 \
    --code 'MCd5h8ig' \
    > test.out 2>&1
eval_tap $? 378 'AdminEnableMyAuthenticatorV4' test.out

#- 379 AdminGenerateMyAuthenticatorKeyV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateMyAuthenticatorKeyV4 \
    > test.out 2>&1
eval_tap $? 379 'AdminGenerateMyAuthenticatorKeyV4' test.out

#- 380 AdminGetMyBackupCodesV4
eval_tap 0 380 'AdminGetMyBackupCodesV4 # SKIP deprecated' test.out

#- 381 AdminGenerateMyBackupCodesV4
eval_tap 0 381 'AdminGenerateMyBackupCodesV4 # SKIP deprecated' test.out

#- 382 AdminDisableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyBackupCodesV4 \
    --body '{"factor": "we9oOxsM", "mfaToken": "QUAObHwo"}' \
    > test.out 2>&1
eval_tap $? 382 'AdminDisableMyBackupCodesV4' test.out

#- 383 AdminDownloadMyBackupCodesV4
eval_tap 0 383 'AdminDownloadMyBackupCodesV4 # SKIP deprecated' test.out

#- 384 AdminEnableMyBackupCodesV4
eval_tap 0 384 'AdminEnableMyBackupCodesV4 # SKIP deprecated' test.out

#- 385 AdminGetBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBackupCodesV4 \
    --languageTag '64jccdqB' \
    > test.out 2>&1
eval_tap $? 385 'AdminGetBackupCodesV4' test.out

#- 386 AdminGenerateBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateBackupCodesV4 \
    --languageTag '7UFUIoHa' \
    > test.out 2>&1
eval_tap $? 386 'AdminGenerateBackupCodesV4' test.out

#- 387 AdminEnableBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableBackupCodesV4 \
    --languageTag 'DPZ9ow8o' \
    > test.out 2>&1
eval_tap $? 387 'AdminEnableBackupCodesV4' test.out

#- 388 AdminChallengeMyMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminChallengeMyMFAV4 \
    --code 'wPtVSmVx' \
    --factor 'zwmPTDCJ' \
    > test.out 2>&1
eval_tap $? 388 'AdminChallengeMyMFAV4' test.out

#- 389 AdminSendMyMFAEmailCodeV4
./ng net.accelbyte.sdk.cli.Main iam adminSendMyMFAEmailCodeV4 \
    --action 'uaT7Ajaa' \
    --languageTag 'vYc660NO' \
    > test.out 2>&1
eval_tap $? 389 'AdminSendMyMFAEmailCodeV4' test.out

#- 390 AdminDisableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyEmailV4 \
    --body '{"factor": "j6PvkOX2", "mfaToken": "me4IAWl1"}' \
    > test.out 2>&1
eval_tap $? 390 'AdminDisableMyEmailV4' test.out

#- 391 AdminEnableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyEmailV4 \
    --code 'yJgRDZLB' \
    > test.out 2>&1
eval_tap $? 391 'AdminEnableMyEmailV4' test.out

#- 392 AdminGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyEnabledFactorsV4 \
    > test.out 2>&1
eval_tap $? 392 'AdminGetMyEnabledFactorsV4' test.out

#- 393 AdminMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam adminMakeFactorMyDefaultV4 \
    --factor 'nZ3IfKaG' \
    > test.out 2>&1
eval_tap $? 393 'AdminMakeFactorMyDefaultV4' test.out

#- 394 AdminGetMyOwnMFAStatusV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyOwnMFAStatusV4 \
    > test.out 2>&1
eval_tap $? 394 'AdminGetMyOwnMFAStatusV4' test.out

#- 395 AdminGetMyMFAStatusV4
eval_tap 0 395 'AdminGetMyMFAStatusV4 # SKIP deprecated' test.out

#- 396 AdminInviteUserV4
eval_tap 0 396 'AdminInviteUserV4 # SKIP deprecated' test.out

#- 397 AuthenticationWithPlatformLinkV4
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV4 \
    --extendExp  \
    --clientId 'fma2xGYb' \
    --linkingToken 'nXpxXraS' \
    --password 'pu6FrxP0' \
    --username 'mLkhGd4e' \
    > test.out 2>&1
eval_tap $? 397 'AuthenticationWithPlatformLinkV4' test.out

#- 398 GenerateTokenByNewHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV4 \
    --additionalData 'MxrVDJeA' \
    --extendExp  \
    --linkingToken 'uqO5ZQrd' \
    > test.out 2>&1
eval_tap $? 398 'GenerateTokenByNewHeadlessAccountV4' test.out

#- 399 Verify2faCodeV4
./ng net.accelbyte.sdk.cli.Main iam verify2faCodeV4 \
    --code 'S5K16e5R' \
    --factor 'PnHFvzR6' \
    --mfaToken 'F4IJgnKz' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 399 'Verify2faCodeV4' test.out

#- 400 PlatformTokenGrantV4
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV4 \
    --platformId 'HC9EQM9o' \
    --codeChallenge '0Dh8hBpI' \
    --codeChallengeMethod 'plain' \
    --additionalData 'iB9C1mMJ' \
    --clientId 'ArCrkS2p' \
    --createHeadless  \
    --deviceId 'ib8KHY8a' \
    --macAddress 'hd3FEqNn' \
    --platformToken '2X9R1ztu' \
    --serviceLabel '0.874141962697775' \
    --skipSetCookie  \
    > test.out 2>&1
eval_tap $? 400 'PlatformTokenGrantV4' test.out

#- 401 SimultaneousLoginV4
./ng net.accelbyte.sdk.cli.Main iam simultaneousLoginV4 \
    --codeChallenge 'ItYFejva' \
    --codeChallengeMethod 'plain' \
    --simultaneousPlatform 'olYBX9QQ' \
    --simultaneousTicket 'DycmXOlo' \
    --nativePlatform 'steam' \
    --nativePlatformTicket 'SJ7JZiho' \
    > test.out 2>&1
eval_tap $? 401 'SimultaneousLoginV4' test.out

#- 402 TokenGrantV4
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV4 \
    --codeChallenge 'njc9aQ2x' \
    --codeChallengeMethod 'S256' \
    --additionalData 'JhMaonXA' \
    --clientId '1fLnLQ7z' \
    --clientSecret '6egXHWaW' \
    --code 'pHnON7qJ' \
    --codeVerifier '9WMNYoja' \
    --extendNamespace '5p1gXu6f' \
    --extendExp  \
    --loginQueueTicket '4comfe6E' \
    --password 'iFvjndbu' \
    --redirectUri '8atgv40i' \
    --refreshToken '1IhJAhbT' \
    --scope 'McAA3x5o' \
    --username 'GARzNNCo' \
    --grantType 'authorization_code' \
    > test.out 2>&1
eval_tap $? 402 'TokenGrantV4' test.out

#- 403 RequestTargetTokenResponseV4
./ng net.accelbyte.sdk.cli.Main iam requestTargetTokenResponseV4 \
    --additionalData 'kdhAqa0x' \
    --code 'BtcAdZVw' \
    > test.out 2>&1
eval_tap $? 403 'RequestTargetTokenResponseV4' test.out

#- 404 PublicListUserIDByPlatformUserIDsV4
./ng net.accelbyte.sdk.cli.Main iam publicListUserIDByPlatformUserIDsV4 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Ts200haR' \
    --rawPUID  \
    --body '{"pidType": "YziKKOkF", "platformUserIds": ["orzF9Juf", "sY1Ux4in", "9jUmeZuP"]}' \
    > test.out 2>&1
eval_tap $? 404 'PublicListUserIDByPlatformUserIDsV4' test.out

#- 405 PublicGetUserByPlatformUserIDV4
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByPlatformUserIDV4 \
    --namespace "$AB_NAMESPACE" \
    --platformId '6OeZ4JoX' \
    --platformUserId 'gfNMHT2d' \
    > test.out 2>&1
eval_tap $? 405 'PublicGetUserByPlatformUserIDV4' test.out

#- 406 PublicCreateTestUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateTestUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "tcosR87s", "policyId": "Dy1wLZmh", "policyVersionId": "q5TPaQpR"}, {"isAccepted": false, "localizedPolicyVersionId": "VRLUDc7t", "policyId": "MBhNGE4k", "policyVersionId": "ZjAAufYm"}, {"isAccepted": true, "localizedPolicyVersionId": "oYr1sYZJ", "policyId": "g9FBtSy2", "policyVersionId": "wmGk3ETL"}], "authType": "EMAILPASSWD", "country": "LxOhX7Pz", "dateOfBirth": "bYOXAeMt", "displayName": "Hbeuaq9p", "emailAddress": "Ph5rMuso", "password": "px6BQA3j", "passwordMD5Sum": "K9NwuKT8", "uniqueDisplayName": "Cz0biuhb", "username": "sWtcXXWD", "verified": false}' \
    > test.out 2>&1
eval_tap $? 406 'PublicCreateTestUserV4' test.out

#- 407 PublicCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "ZW2OwoDI", "policyId": "esDQuDNK", "policyVersionId": "xCs75fDW"}, {"isAccepted": true, "localizedPolicyVersionId": "ZDmIOLZw", "policyId": "EinrM0HP", "policyVersionId": "DOkpayQI"}, {"isAccepted": false, "localizedPolicyVersionId": "q5EFSwSh", "policyId": "L0xz3wHa", "policyVersionId": "yBh9bUdl"}], "authType": "EMAILPASSWD", "code": "9qEovc6e", "country": "Sd8gNtRa", "dateOfBirth": "A2M860Rh", "displayName": "mGgnEfOU", "emailAddress": "LtKEIzIt", "password": "hRDjDOe6", "passwordMD5Sum": "Uoc5PduI", "reachMinimumAge": true, "uniqueDisplayName": "TPdkA3Xx", "username": "wtGqYpYe"}' \
    > test.out 2>&1
eval_tap $? 407 'PublicCreateUserV4' test.out

#- 408 CreateUserFromInvitationV4
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV4 \
    --invitationId 'bcO1zAzy' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "7XcJOJhp", "policyId": "O1HFcP25", "policyVersionId": "JFVF7ybR"}, {"isAccepted": false, "localizedPolicyVersionId": "FhN7urAT", "policyId": "GkIGxj8L", "policyVersionId": "5IiPbreh"}, {"isAccepted": false, "localizedPolicyVersionId": "UMNs047u", "policyId": "SCjeA0W8", "policyVersionId": "oje9S5VQ"}], "authType": "EMAILPASSWD", "code": "djiaCc7p", "country": "Djtdz8Et", "dateOfBirth": "iTT9Luha", "displayName": "JVHxoA56", "emailAddress": "EggGglW1", "password": "Sb5bLIqi", "passwordMD5Sum": "o9TmmpVQ", "reachMinimumAge": false, "uniqueDisplayName": "xLxfmZSK", "username": "4AYwWDKE"}' \
    > test.out 2>&1
eval_tap $? 408 'CreateUserFromInvitationV4' test.out

#- 409 PublicUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "r1BPOy6C", "country": "ZNwGIoVJ", "dateOfBirth": "EW1zKfKY", "displayName": "B8eWixzT", "languageTag": "z5SPRJZ9", "uniqueDisplayName": "gMNDWOmV", "userName": "3TVUzVCb"}' \
    > test.out 2>&1
eval_tap $? 409 'PublicUpdateUserV4' test.out

#- 410 PublicUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "FSOH1Hw0", "emailAddress": "saHxtjOb"}' \
    > test.out 2>&1
eval_tap $? 410 'PublicUpdateUserEmailAddressV4' test.out

#- 411 PublicUpgradeHeadlessAccountWithVerificationCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountWithVerificationCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "Tn813juV", "country": "Yo34xjkH", "dateOfBirth": "m3wFGGlC", "displayName": "fWVIr1ep", "emailAddress": "o6vCsjK2", "password": "kDIo9hrW", "reachMinimumAge": false, "uniqueDisplayName": "1u0T7K3L", "username": "UuUDCg1U", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 411 'PublicUpgradeHeadlessAccountWithVerificationCodeV4' test.out

#- 412 PublicUpgradeHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"dateOfBirth": "EOsef2FI", "displayName": "nOiMMBpB", "emailAddress": "pgIeBhXa", "password": "M7WiYT1O", "uniqueDisplayName": "lCvxgSkJ", "username": "SsHZ2sty"}' \
    > test.out 2>&1
eval_tap $? 412 'PublicUpgradeHeadlessAccountV4' test.out

#- 413 PublicDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"factor": "87eyUGgu", "mfaToken": "A3SsZvOm"}' \
    > test.out 2>&1
eval_tap $? 413 'PublicDisableMyAuthenticatorV4' test.out

#- 414 PublicEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    --code '5uBCiFrM' \
    > test.out 2>&1
eval_tap $? 414 'PublicEnableMyAuthenticatorV4' test.out

#- 415 PublicGenerateMyAuthenticatorKeyV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateMyAuthenticatorKeyV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 415 'PublicGenerateMyAuthenticatorKeyV4' test.out

#- 416 PublicGetMyBackupCodesV4
eval_tap 0 416 'PublicGetMyBackupCodesV4 # SKIP deprecated' test.out

#- 417 PublicGenerateMyBackupCodesV4
eval_tap 0 417 'PublicGenerateMyBackupCodesV4 # SKIP deprecated' test.out

#- 418 PublicDisableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"factor": "lJaTk3Kq", "mfaToken": "uZx0jQQr"}' \
    > test.out 2>&1
eval_tap $? 418 'PublicDisableMyBackupCodesV4' test.out

#- 419 PublicDownloadMyBackupCodesV4
eval_tap 0 419 'PublicDownloadMyBackupCodesV4 # SKIP deprecated' test.out

#- 420 PublicEnableMyBackupCodesV4
eval_tap 0 420 'PublicEnableMyBackupCodesV4 # SKIP deprecated' test.out

#- 421 PublicGetBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGetBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --languageTag '01R4nxVv' \
    > test.out 2>&1
eval_tap $? 421 'PublicGetBackupCodesV4' test.out

#- 422 PublicGenerateBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --languageTag 'HbxUXhM9' \
    > test.out 2>&1
eval_tap $? 422 'PublicGenerateBackupCodesV4' test.out

#- 423 PublicEnableBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --languageTag 'TZkK41Ne' \
    > test.out 2>&1
eval_tap $? 423 'PublicEnableBackupCodesV4' test.out

#- 424 PublicChallengeMyMFAV4
./ng net.accelbyte.sdk.cli.Main iam publicChallengeMyMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'bX6PXbWS' \
    --factor 'dNylts2x' \
    > test.out 2>&1
eval_tap $? 424 'PublicChallengeMyMFAV4' test.out

#- 425 PublicRemoveTrustedDeviceV4
./ng net.accelbyte.sdk.cli.Main iam publicRemoveTrustedDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceToken 'bVAffPqV' \
    > test.out 2>&1
eval_tap $? 425 'PublicRemoveTrustedDeviceV4' test.out

#- 426 PublicSendMyMFAEmailCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicSendMyMFAEmailCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --action 'QcSU14b6' \
    --languageTag '2JdBPx8e' \
    > test.out 2>&1
eval_tap $? 426 'PublicSendMyMFAEmailCodeV4' test.out

#- 427 PublicDisableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyEmailV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"factor": "Rl6StEEp", "mfaToken": "RQyR7ZTC"}' \
    > test.out 2>&1
eval_tap $? 427 'PublicDisableMyEmailV4' test.out

#- 428 PublicEnableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyEmailV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'Txhp4Fmn' \
    > test.out 2>&1
eval_tap $? 428 'PublicEnableMyEmailV4' test.out

#- 429 PublicGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam publicGetMyEnabledFactorsV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 429 'PublicGetMyEnabledFactorsV4' test.out

#- 430 PublicMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam publicMakeFactorMyDefaultV4 \
    --namespace "$AB_NAMESPACE" \
    --factor '5pKm068M' \
    > test.out 2>&1
eval_tap $? 430 'PublicMakeFactorMyDefaultV4' test.out

#- 431 PublicGetMyOwnMFAStatusV4
./ng net.accelbyte.sdk.cli.Main iam publicGetMyOwnMFAStatusV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 431 'PublicGetMyOwnMFAStatusV4' test.out

#- 432 PublicGetMyMFAStatusV4
eval_tap 0 432 'PublicGetMyMFAStatusV4 # SKIP deprecated' test.out

#- 433 PublicGetUserPublicInfoByUserIdV4
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPublicInfoByUserIdV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'vFnxduYo' \
    > test.out 2>&1
eval_tap $? 433 'PublicGetUserPublicInfoByUserIdV4' test.out

#- 434 PublicInviteUserV4
./ng net.accelbyte.sdk.cli.Main iam publicInviteUserV4 \
    --body '{"additionalData": "ZADsZ3y2", "emailAddress": "CRZwwZh9", "languageTag": "h6B9EOiO", "namespace": "mT5TmGCa", "namespaceDisplayName": "DwxTC6HV"}' \
    > test.out 2>&1
eval_tap $? 434 'PublicInviteUserV4' test.out

#- 435 PublicUpgradeHeadlessWithCodeV4Forward
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessWithCodeV4Forward \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "YkRql6FM", "policyId": "l0xBZjLG", "policyVersionId": "QIAumWxN"}, {"isAccepted": false, "localizedPolicyVersionId": "TU1n8Mzp", "policyId": "OcvmXrru", "policyVersionId": "Po0uJWzu"}, {"isAccepted": false, "localizedPolicyVersionId": "1LEPgOnb", "policyId": "0sPpHEEC", "policyVersionId": "LQpkdj1O"}], "code": "CKWtYGy4", "country": "i3QUgZR6", "dateOfBirth": "PrpdvajP", "displayName": "W0tzrKMs", "emailAddress": "GK9O7Eof", "password": "OZNKpS4P", "reachMinimumAge": true, "uniqueDisplayName": "TTczqonf", "username": "3V37Zj9B", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 435 'PublicUpgradeHeadlessWithCodeV4Forward' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
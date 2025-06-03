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
    --body '{"modules": [{"docLink": "7XM4xP5u", "groups": [{"group": "gfbVgQ3M", "groupId": "QR9nMcX1", "permissions": [{"allowedActions": [14, 22, 99], "resource": "6R46eaQe"}, {"allowedActions": [63, 85, 61], "resource": "XFicXcGC"}, {"allowedActions": [59, 76, 24], "resource": "SK2HUyWj"}]}, {"group": "wWu2qpxw", "groupId": "t5pA9yC2", "permissions": [{"allowedActions": [44, 87, 39], "resource": "wuHyJN0P"}, {"allowedActions": [61, 35, 40], "resource": "9Q9YwGd7"}, {"allowedActions": [83, 19, 32], "resource": "ZdP8B8uF"}]}, {"group": "mj1IgzAF", "groupId": "LzEEhCaL", "permissions": [{"allowedActions": [14, 18, 75], "resource": "vvVHBvOG"}, {"allowedActions": [66, 74, 47], "resource": "pthez8bO"}, {"allowedActions": [93, 64, 59], "resource": "FliLeXm8"}]}], "module": "04Je7XMB", "moduleId": "sKbZI8zi"}, {"docLink": "m7EAa3zn", "groups": [{"group": "smCS7SJU", "groupId": "IpGAUwLA", "permissions": [{"allowedActions": [70, 72, 34], "resource": "kQhNg0b2"}, {"allowedActions": [50, 42, 4], "resource": "UPRKV8F0"}, {"allowedActions": [70, 33, 55], "resource": "Y5DW93oe"}]}, {"group": "ohvdl2zi", "groupId": "bXGXExTp", "permissions": [{"allowedActions": [23, 44, 58], "resource": "9DB78qIN"}, {"allowedActions": [93, 29, 36], "resource": "T1C1SY3r"}, {"allowedActions": [97, 96, 80], "resource": "2ESP4D70"}]}, {"group": "fU3aS5eP", "groupId": "7LwwdIOi", "permissions": [{"allowedActions": [22, 2, 87], "resource": "HrETGHrF"}, {"allowedActions": [64, 75, 85], "resource": "nEsNZmwQ"}, {"allowedActions": [51, 12, 49], "resource": "PSYj0AWJ"}]}], "module": "EMdb46SF", "moduleId": "BMAPxpC0"}, {"docLink": "Hsk3sEFf", "groups": [{"group": "4gg1rUJa", "groupId": "Y5R6eWr5", "permissions": [{"allowedActions": [55, 46, 72], "resource": "l0dpDiqy"}, {"allowedActions": [56, 84, 65], "resource": "FAAUflkU"}, {"allowedActions": [27, 69, 28], "resource": "hGpTiXq3"}]}, {"group": "UjjgNxwp", "groupId": "sXwx3l8i", "permissions": [{"allowedActions": [0, 57, 69], "resource": "b67mbO0f"}, {"allowedActions": [58, 48, 42], "resource": "aoIskhLb"}, {"allowedActions": [2, 85, 82], "resource": "hz9U8TYR"}]}, {"group": "oKn79o1T", "groupId": "0zADAAoM", "permissions": [{"allowedActions": [33, 83, 39], "resource": "whHHXBjs"}, {"allowedActions": [12, 28, 25], "resource": "Q9BCtDq4"}, {"allowedActions": [98, 34, 25], "resource": "teQJSmnp"}]}], "module": "4NMtNjQp", "moduleId": "xJgWv8Rz"}]}' \
    > test.out 2>&1
eval_tap $? 109 'AdminUpdateAvailablePermissionsByModule' test.out

#- 110 AdminDeleteConfigPermissionsByGroup
./ng net.accelbyte.sdk.cli.Main iam adminDeleteConfigPermissionsByGroup \
    --forceDelete  \
    --body '{"groupId": "pOtM6NTT", "moduleId": "8fElNCp3"}' \
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
    --body '[{"field": "hVEjnUpa", "validation": {"allowAllSpecialCharacters": true, "allowDigit": false, "allowLetter": false, "allowSpace": true, "allowUnicode": false, "avatarConfig": {"allowedPrefixes": ["LXPl0uWU", "jBif4m4t", "NU6F6hhL"], "preferRegex": true, "regex": "0yLZDhCM"}, "blockedWord": ["UyMavxxG", "IFL93g7t", "JRCXARm0"], "description": [{"language": "ck7jKJ2S", "message": ["pISUBCjI", "bx6JumFX", "sd2CRIl0"]}, {"language": "VBvvalkc", "message": ["4a1ozcCV", "mmmVtWDk", "EEzTHDV7"]}, {"language": "faD1ix50", "message": ["KyranjnL", "yOVNEgNY", "5jqAF3R5"]}], "isCustomRegex": true, "letterCase": "cykZ6zP2", "maxLength": 57, "maxRepeatingAlphaNum": 47, "maxRepeatingSpecialCharacter": 20, "minCharType": 73, "minLength": 15, "profanityFilter": "IAJSdOUK", "regex": "jhV0jibt", "specialCharacterLocation": "fIp75lr3", "specialCharacters": ["XX1PIufv", "45iQJ6kd", "ZfMueWFX"]}}, {"field": "0TRhROaz", "validation": {"allowAllSpecialCharacters": true, "allowDigit": false, "allowLetter": true, "allowSpace": true, "allowUnicode": false, "avatarConfig": {"allowedPrefixes": ["ntFygtBc", "XKpKi1Eq", "SSJScp9z"], "preferRegex": true, "regex": "aOgl2TM0"}, "blockedWord": ["AUQCa7zG", "ozKCj5c0", "TYM6cY9l"], "description": [{"language": "h86MmdXQ", "message": ["nAdRWgrZ", "Qa5VwUMv", "0LK3Qtaj"]}, {"language": "4XT6ZHMR", "message": ["3Ogouflb", "Ea3Op4Fg", "3ZUPEMb2"]}, {"language": "0ALGsRje", "message": ["RudEQ6oL", "Rq7DBpK9", "FTELXhuP"]}], "isCustomRegex": false, "letterCase": "zGIUIVHr", "maxLength": 8, "maxRepeatingAlphaNum": 24, "maxRepeatingSpecialCharacter": 46, "minCharType": 12, "minLength": 50, "profanityFilter": "1madQpDb", "regex": "nh05LgyV", "specialCharacterLocation": "szxPEQQE", "specialCharacters": ["vbBFltHE", "BDdZlG08", "hqqNUVDD"]}}, {"field": "jvtMOZfd", "validation": {"allowAllSpecialCharacters": true, "allowDigit": true, "allowLetter": true, "allowSpace": true, "allowUnicode": false, "avatarConfig": {"allowedPrefixes": ["bKnjKcKw", "qK5MqutK", "96kfKfva"], "preferRegex": false, "regex": "2xevEy1c"}, "blockedWord": ["NiJls67n", "VigIr7ob", "tEmkeOMB"], "description": [{"language": "DPAdg5Xi", "message": ["b31C0Gds", "5WPGhPug", "TzqC6qgo"]}, {"language": "S4qzGFhG", "message": ["oiS930FO", "8X93FBAo", "tpk1w0MX"]}, {"language": "WPJFeGKw", "message": ["VmE5zOua", "MbnjDhmy", "P2foGAGM"]}], "isCustomRegex": false, "letterCase": "UDlouTvy", "maxLength": 84, "maxRepeatingAlphaNum": 56, "maxRepeatingSpecialCharacter": 98, "minCharType": 3, "minLength": 90, "profanityFilter": "topK2Ek5", "regex": "uids1Lsl", "specialCharacterLocation": "zBTr8Lkm", "specialCharacters": ["PzfUPXun", "C5z0I3Wp", "UPcUPenT"]}}]' \
    > test.out 2>&1
eval_tap $? 113 'AdminUpdateInputValidations' test.out

#- 114 AdminResetInputValidations
./ng net.accelbyte.sdk.cli.Main iam adminResetInputValidations \
    --field '7Akr5Sua' \
    > test.out 2>&1
eval_tap $? 114 'AdminResetInputValidations' test.out

#- 115 ListAdminsV3
./ng net.accelbyte.sdk.cli.Main iam listAdminsV3 \
    --namespace "$AB_NAMESPACE" \
    --after '64VF8sr4' \
    --before 'IxjQ1Q5c' \
    --endDate 'nsl9iXsq' \
    --limit '84' \
    --query 'udNknO9R' \
    --roleId 'mIEl3uEG' \
    --startDate '8PNeEQFI' \
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
    --body '{"ageRestriction": 89, "enable": false}' \
    > test.out 2>&1
eval_tap $? 117 'AdminUpdateAgeRestrictionConfigV3' test.out

#- 118 AdminGetListCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminGetListCountryAgeRestrictionV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 118 'AdminGetListCountryAgeRestrictionV3' test.out

#- 119 AdminUpdateCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateCountryAgeRestrictionV3 \
    --countryCode 'WbFN3VSQ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ageRestriction": 74}' \
    > test.out 2>&1
eval_tap $? 119 'AdminUpdateCountryAgeRestrictionV3' test.out

#- 120 AdminGetBannedUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType 'MSO7xRkJ' \
    --limit '9' \
    --offset '35' \
    > test.out 2>&1
eval_tap $? 120 'AdminGetBannedUsersV3' test.out

#- 121 AdminBanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"ban": "DjVplnLV", "comment": "WdSu5Mu4", "endDate": "GbF4bJXE", "reason": "lNS5dajo", "skipNotif": false, "userIds": ["X5sjhNVG", "fMOBVsiV", "Hgo30HNL"]}' \
    > test.out 2>&1
eval_tap $? 121 'AdminBanUserBulkV3' test.out

#- 122 AdminUnbanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminUnbanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"bans": [{"banId": "Z6L9mZvm", "userId": "sCkC8YZ5"}, {"banId": "5Abj8Ovx", "userId": "0GuFZ5j5"}, {"banId": "pPufp4hP", "userId": "Pe9qK64d"}]}' \
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
    --clientId 't63AThwc' \
    --clientName '3dhSjqYF' \
    --clientType 'rF5WQlQe' \
    --limit '24' \
    --offset '58' \
    --skipLoginQueue  \
    > test.out 2>&1
eval_tap $? 124 'AdminGetClientsByNamespaceV3' test.out

#- 125 AdminBulkUpdateClientsV3
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateClientsV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientIds": ["6sS5Y8Jo", "tqxlwlYp", "f40GpMvN"], "clientUpdateRequest": {"audiences": ["90Cl7Gdc", "vB7bnEyx", "k2sKUkl4"], "baseUri": "aQFHYmO7", "clientName": "eEZfQxMN", "clientPermissions": [{"action": 94, "resource": "MiTjCZ7i", "schedAction": 58, "schedCron": "L60X4ymz", "schedRange": ["OvwybI5u", "IzCjbcY4", "TFX9f3dl"]}, {"action": 10, "resource": "f80YhVvG", "schedAction": 80, "schedCron": "PM8JowE4", "schedRange": ["SVOlGShJ", "uZZykBLT", "XlTJYSKp"]}, {"action": 32, "resource": "edyqwIjA", "schedAction": 40, "schedCron": "0VNbmBIT", "schedRange": ["djDCit4b", "DXPuD7nj", "hm4hYkk9"]}], "clientPlatform": "Did0uwcr", "deletable": false, "description": "JmyMdhKn", "modulePermissions": [{"moduleId": "M6ihgPet", "selectedGroups": [{"groupId": "ekeHtwbB", "selectedActions": [94, 78, 83]}, {"groupId": "F12OquiH", "selectedActions": [15, 78, 90]}, {"groupId": "HUDrCgeM", "selectedActions": [35, 36, 70]}]}, {"moduleId": "DilPJcEQ", "selectedGroups": [{"groupId": "SEbOF1h9", "selectedActions": [35, 69, 74]}, {"groupId": "cPPJiJ5H", "selectedActions": [79, 13, 74]}, {"groupId": "HQfyo7GE", "selectedActions": [4, 65, 7]}]}, {"moduleId": "DPNxpzp1", "selectedGroups": [{"groupId": "cxbJPc6z", "selectedActions": [83, 29, 60]}, {"groupId": "dOxWhry5", "selectedActions": [52, 90, 51]}, {"groupId": "SPszhZPV", "selectedActions": [13, 6, 18]}]}], "namespace": "pZ98YA8I", "oauthAccessTokenExpiration": 29, "oauthAccessTokenExpirationTimeUnit": "ceWuvWWA", "oauthRefreshTokenExpiration": 96, "oauthRefreshTokenExpirationTimeUnit": "IfHl82Z6", "redirectUri": "l3sfih38", "scopes": ["LiHh6DNp", "xPGEjB6C", "0DYr0yff"], "skipLoginQueue": false, "twoFactorEnabled": false}}' \
    > test.out 2>&1
eval_tap $? 125 'AdminBulkUpdateClientsV3' test.out

#- 126 AdminCreateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateClientV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["2DZnozPe", "O9rVNZIJ", "9HuG2aEp"], "baseUri": "s7JMD3M7", "clientId": "pO6Kxbgc", "clientName": "JVgc4Vm1", "clientPermissions": [{"action": 37, "resource": "9u04YgC5", "schedAction": 45, "schedCron": "LZaoh4vU", "schedRange": ["JTzBWvT9", "Lxn38LSm", "RqEg6sOF"]}, {"action": 50, "resource": "RHpmZVt7", "schedAction": 22, "schedCron": "UJtxYHMQ", "schedRange": ["rPeF6cUw", "DPfxJtds", "DjQVdWhX"]}, {"action": 8, "resource": "h3OXb7mU", "schedAction": 7, "schedCron": "VKyKYylG", "schedRange": ["b5DcngQy", "iSFn7YB3", "FHHCjEMz"]}], "clientPlatform": "TFEzqJk5", "deletable": true, "description": "cGKPuW1N", "modulePermissions": [{"moduleId": "uDFUvugf", "selectedGroups": [{"groupId": "ow4BFen7", "selectedActions": [98, 52, 10]}, {"groupId": "cQagPBUi", "selectedActions": [28, 97, 29]}, {"groupId": "UNwh1bxO", "selectedActions": [44, 97, 38]}]}, {"moduleId": "BAFV9YEF", "selectedGroups": [{"groupId": "pv8O6avH", "selectedActions": [48, 42, 66]}, {"groupId": "Evpfczjo", "selectedActions": [56, 64, 98]}, {"groupId": "8yHA0Q8y", "selectedActions": [81, 19, 48]}]}, {"moduleId": "1Ys5gb21", "selectedGroups": [{"groupId": "qvwOs4ve", "selectedActions": [94, 22, 28]}, {"groupId": "EnXgvDlQ", "selectedActions": [34, 49, 71]}, {"groupId": "iRZafBc3", "selectedActions": [20, 47, 38]}]}], "namespace": "XvBabouf", "oauthAccessTokenExpiration": 24, "oauthAccessTokenExpirationTimeUnit": "AvD9tlpZ", "oauthClientType": "4NBTU1Wm", "oauthRefreshTokenExpiration": 30, "oauthRefreshTokenExpirationTimeUnit": "Bj1NP1vQ", "parentNamespace": "miZ8XOZN", "redirectUri": "S5pUI1K3", "scopes": ["1gfLcDmz", "M5evCxuc", "a5x00Mer"], "secret": "Jzu5XsvV", "skipLoginQueue": true, "twoFactorEnabled": false}' \
    > test.out 2>&1
eval_tap $? 126 'AdminCreateClientV3' test.out

#- 127 AdminGetClientsbyNamespacebyIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetClientsbyNamespacebyIDV3 \
    --clientId 'jvnkibOH' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 127 'AdminGetClientsbyNamespacebyIDV3' test.out

#- 128 AdminDeleteClientV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientV3 \
    --clientId 'VDXstrP4' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 128 'AdminDeleteClientV3' test.out

#- 129 AdminUpdateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientV3 \
    --clientId 'yMQRSXVS' \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["Gsg3jd1n", "LFsxTYX2", "uMnoTpfY"], "baseUri": "4jg2CLaP", "clientName": "W78GYeyJ", "clientPermissions": [{"action": 28, "resource": "UUdcviu5", "schedAction": 34, "schedCron": "CcFg9iXg", "schedRange": ["icekWZ0W", "unweehoY", "N5FP2C8u"]}, {"action": 13, "resource": "cdm4zviV", "schedAction": 56, "schedCron": "OSK66EY0", "schedRange": ["ZNhjgazC", "1lylHEMw", "dtfvuYNW"]}, {"action": 88, "resource": "Wo5gvwyX", "schedAction": 62, "schedCron": "FJqCXnKD", "schedRange": ["fxKg0Ncg", "lBChoVo9", "6HfORRax"]}], "clientPlatform": "EXylv2xc", "deletable": false, "description": "z59DQWuR", "modulePermissions": [{"moduleId": "mEg7tEeZ", "selectedGroups": [{"groupId": "cLS6ix16", "selectedActions": [14, 53, 45]}, {"groupId": "vUnlzElN", "selectedActions": [94, 88, 90]}, {"groupId": "Goi3jM4D", "selectedActions": [76, 99, 32]}]}, {"moduleId": "PpR5vaNj", "selectedGroups": [{"groupId": "bIatIcWj", "selectedActions": [43, 68, 44]}, {"groupId": "q7uwfiDX", "selectedActions": [82, 61, 99]}, {"groupId": "5mXK9vpn", "selectedActions": [8, 68, 21]}]}, {"moduleId": "dLxhtAE2", "selectedGroups": [{"groupId": "lx3hFHeo", "selectedActions": [63, 82, 65]}, {"groupId": "M3DVBsM3", "selectedActions": [47, 86, 21]}, {"groupId": "S9ZRIV0Y", "selectedActions": [40, 14, 5]}]}], "namespace": "R3dhGdrC", "oauthAccessTokenExpiration": 100, "oauthAccessTokenExpirationTimeUnit": "12flcaWg", "oauthRefreshTokenExpiration": 86, "oauthRefreshTokenExpirationTimeUnit": "E7cdT8cZ", "redirectUri": "D9UPTwuL", "scopes": ["vj45DRZW", "ZZZO5rRa", "gaQdbODB"], "skipLoginQueue": false, "twoFactorEnabled": false}' \
    > test.out 2>&1
eval_tap $? 129 'AdminUpdateClientV3' test.out

#- 130 AdminUpdateClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientPermissionV3 \
    --clientId 'FbTFbuMe' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 55, "resource": "O2lECUvz"}, {"action": 13, "resource": "9rkdxyIX"}, {"action": 45, "resource": "wchJ28Ex"}]}' \
    > test.out 2>&1
eval_tap $? 130 'AdminUpdateClientPermissionV3' test.out

#- 131 AdminAddClientPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddClientPermissionsV3 \
    --clientId 'TyLUn1vJ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 66, "resource": "uYAZMIlS"}, {"action": 39, "resource": "TxcBWlQS"}, {"action": 84, "resource": "80Q5tIj0"}]}' \
    > test.out 2>&1
eval_tap $? 131 'AdminAddClientPermissionsV3' test.out

#- 132 AdminDeleteClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientPermissionV3 \
    --action '94' \
    --clientId '1B9mRAMi' \
    --namespace "$AB_NAMESPACE" \
    --resource 'AFJqIeLc' \
    > test.out 2>&1
eval_tap $? 132 'AdminDeleteClientPermissionV3' test.out

#- 133 AdminGetConfigValueV3
./ng net.accelbyte.sdk.cli.Main iam adminGetConfigValueV3 \
    --configKey 'pPCub9XK' \
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
    --body '{"blacklist": ["Zimt67NW", "tftLPO4z", "duaQMjQt"]}' \
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
    --body '{"active": true, "roleIds": ["NLxYUNNv", "eiz1IYqZ", "TfOgwuFB"]}' \
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
    --limit '76' \
    --offset '78' \
    > test.out 2>&1
eval_tap $? 141 'RetrieveAllSSOLoginPlatformCredentialV3' test.out

#- 142 RetrieveThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'EEIPJ0iA' \
    > test.out 2>&1
eval_tap $? 142 'RetrieveThirdPartyLoginPlatformCredentialV3' test.out

#- 143 AddThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam addThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '6IYLiByb' \
    --body '{"ACSURL": "al0gnS64", "AWSCognitoRegion": "mwSjA3MR", "AWSCognitoUserPool": "7xB4Lq59", "AllowedClients": ["KVKFu0R5", "20h9qt3x", "DDeCDPSi"], "AppId": "oCK9pmjR", "AuthorizationEndpoint": "VjvIDGfi", "ClientId": "ZM3Kg0bt", "EmptyStrFieldList": ["ityMGEAn", "nd8WeEm8", "MqnbHVxj"], "EnableServerLicenseValidation": true, "Environment": "yo3N2NPQ", "FederationMetadataURL": "t3e7aXDs", "GenericOauthFlow": false, "IncludePUID": true, "IsActive": false, "Issuer": "vrotGf4N", "JWKSEndpoint": "M8szUsO6", "KeyID": "lxB5T7qB", "LogoURL": "4DL6rdIe", "NetflixCertificates": {"encryptedPrivateKey": "U5gYBr7l", "encryptedPrivateKeyName": "tw1fpxCG", "publicCertificate": "UDXPX9h3", "publicCertificateName": "U1gjJVwv", "rootCertificate": "P1zCURMH", "rootCertificateName": "lDxAhDf9"}, "OrganizationId": "p2KWBhfx", "PlatformName": "cS8bbkWH", "RedirectUri": "Db2EHlED", "RegisteredDomains": [{"affectedClientIDs": ["PI5eIXp5", "uJdZw0rZ", "yjhNyUHR"], "domain": "swbBfDy3", "namespaces": ["55pMoUXh", "tHiRApyp", "k6FKkPDH"], "roleId": "aU2mmIQ4", "ssoCfg": {"googleKey": {"1yNkUvwK": {}, "Zgk0Dwph": {}, "ECEptrqB": {}}, "groupConfigs": [{"assignNamespaces": ["Bkh5tWH0", "YWEVLpP9", "TkQGynOI"], "group": "o5W8WMSk", "roleId": "sviCqDuT"}, {"assignNamespaces": ["NUXCO4U4", "b8Ub5uqU", "ZXRfyIde"], "group": "kSSLEdPd", "roleId": "NY334hR8"}, {"assignNamespaces": ["jzd15F8j", "qcbR9i89", "MxSCOntn"], "group": "ZxiHEowE", "roleId": "27Q0I7Ty"}]}}, {"affectedClientIDs": ["80b5hVeB", "yxNXF1fw", "F8TgUBeA"], "domain": "CpmJpXOm", "namespaces": ["g5TPhIsX", "esQBAfTH", "8YR8XUvO"], "roleId": "fdbVDXxp", "ssoCfg": {"googleKey": {"5LSXosBH": {}, "HcxhBIMs": {}, "gLdExRFk": {}}, "groupConfigs": [{"assignNamespaces": ["m2QizMLd", "B6BhjpZs", "vi3ZFyTV"], "group": "9eidqDBt", "roleId": "TgxI9zxD"}, {"assignNamespaces": ["zOAbWcxZ", "ehDjUXro", "zaPc34cm"], "group": "pSd8cCcH", "roleId": "6R0oc13C"}, {"assignNamespaces": ["X7lksplH", "j5m1T5vi", "5qUwySF9"], "group": "1mFnA5KH", "roleId": "l90uf7AE"}]}}, {"affectedClientIDs": ["fHUmS8qh", "AxktNrYh", "C5KYm0KI"], "domain": "0kxeVMdh", "namespaces": ["B9IDxvmH", "9CHghaOy", "mj6I0Tv1"], "roleId": "2SLOpYiY", "ssoCfg": {"googleKey": {"fcZqkOKh": {}, "WXMj4ylq": {}, "6J9eO3Jc": {}}, "groupConfigs": [{"assignNamespaces": ["hHjX0Ym4", "f2tuicB9", "zjNq1W9f"], "group": "c2mYsd7h", "roleId": "UFmd7iVt"}, {"assignNamespaces": ["PLzft0Dn", "5dtPXoer", "Pwv1CPxW"], "group": "4IDvYhPE", "roleId": "pXfYEfsJ"}, {"assignNamespaces": ["HUJivnma", "m7rQyk9R", "zJRF9d5n"], "group": "RgEPRdhA", "roleId": "6EUtCGZX"}]}}], "Secret": "4hEMIJ6Y", "TeamID": "vTNWnCiY", "TokenAuthenticationType": "ToFth8eG", "TokenClaimsMapping": {"KQ8KrDeQ": "URCPoNgP", "lweO8Lrt": "WV3jxdoB", "ASAr3G11": "2LnOj2k5"}, "TokenEndpoint": "RqWDAjLd", "UserInfoEndpoint": "w8VJKcIV", "UserInfoHTTPMethod": "quEBzEwB", "googleAdminConsoleKey": "AtpSHZfc", "scopes": ["pt4AiRfD", "xbnqKGuG", "fKx8LrnF"]}' \
    > test.out 2>&1
eval_tap $? 143 'AddThirdPartyLoginPlatformCredentialV3' test.out

#- 144 DeleteThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'hMfAvIL4' \
    > test.out 2>&1
eval_tap $? 144 'DeleteThirdPartyLoginPlatformCredentialV3' test.out

#- 145 UpdateThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'sk3J66at' \
    --body '{"ACSURL": "s3I27pq0", "AWSCognitoRegion": "jJIBBD34", "AWSCognitoUserPool": "JPVrcJpH", "AllowedClients": ["bh9DxPC1", "sjJho5Jt", "D6hduyMQ"], "AppId": "ERCSySFT", "AuthorizationEndpoint": "Yll6f994", "ClientId": "Qxe6fHQa", "EmptyStrFieldList": ["Qm9NJxBa", "eXL0t0Nh", "CrLd2sub"], "EnableServerLicenseValidation": true, "Environment": "MDqpUbZI", "FederationMetadataURL": "SeXtacFO", "GenericOauthFlow": false, "IncludePUID": true, "IsActive": true, "Issuer": "3zZnp3xu", "JWKSEndpoint": "BhKiJwml", "KeyID": "BhEq93BO", "LogoURL": "cSLpVsVL", "NetflixCertificates": {"encryptedPrivateKey": "6NIdtwXv", "encryptedPrivateKeyName": "ottBYbna", "publicCertificate": "cSwIxAgV", "publicCertificateName": "PHOuVfJR", "rootCertificate": "BKb1Xgzk", "rootCertificateName": "X7P0jyL1"}, "OrganizationId": "hlrWQLBQ", "PlatformName": "A4U13jIF", "RedirectUri": "6r3bzJ3f", "RegisteredDomains": [{"affectedClientIDs": ["g2asqJmo", "zB8HPKhZ", "bCIjNBTP"], "domain": "erMMoZVB", "namespaces": ["goAa0vYu", "3LnJxBeH", "N0UQwNQn"], "roleId": "bQfNT4tO", "ssoCfg": {"googleKey": {"11DBSPeK": {}, "E0kTj2Pv": {}, "d5utv2cL": {}}, "groupConfigs": [{"assignNamespaces": ["9frZtAlC", "hO0ykGom", "tie3H9te"], "group": "v3WUpUNl", "roleId": "czsjABmP"}, {"assignNamespaces": ["N7OI8NAT", "V34kUAEg", "cqxlUfdW"], "group": "DPK1sQhu", "roleId": "qeGa4Zsx"}, {"assignNamespaces": ["AMtyaEq6", "7zPvxXKm", "EvKq3LQc"], "group": "GfkFpjHT", "roleId": "OBoMgrgc"}]}}, {"affectedClientIDs": ["bdG6tHwB", "d7emJqzJ", "iUE478H5"], "domain": "XA4wJhDG", "namespaces": ["IyEwkkCC", "dZ0IGK2t", "AtvquXIK"], "roleId": "M7kAGB7t", "ssoCfg": {"googleKey": {"Mc05LOcO": {}, "MP4qy1Zq": {}, "14tF7HdN": {}}, "groupConfigs": [{"assignNamespaces": ["tIVbpnrN", "BuzbDyG2", "8ThfWN5t"], "group": "lkCxJkMe", "roleId": "Zg1jrwAO"}, {"assignNamespaces": ["gxqbpNe7", "jilmdHms", "lxeyWS38"], "group": "evZwzmlr", "roleId": "AmFOQ1Yo"}, {"assignNamespaces": ["Th6jLXii", "RN2MfXyi", "Ie0TAx1A"], "group": "qalLvXyy", "roleId": "blDwCq3A"}]}}, {"affectedClientIDs": ["Zym1zezH", "SZhy2lrH", "ckOtgyNh"], "domain": "PSM7aE5Q", "namespaces": ["gm8hEkCA", "N5l9l7IW", "lZZBEHP6"], "roleId": "ESgHdEQ8", "ssoCfg": {"googleKey": {"aMnE5DoU": {}, "tflThccj": {}, "dewtJRcK": {}}, "groupConfigs": [{"assignNamespaces": ["7YAkojup", "Z2VzG236", "ZiVAJTsE"], "group": "9LKUjXgP", "roleId": "NLupWT2l"}, {"assignNamespaces": ["jwWJG88T", "W2ocgujt", "IljhQYap"], "group": "Y0JZWfQX", "roleId": "EDfTzbi3"}, {"assignNamespaces": ["cnwk2o7L", "ElXtFXZZ", "AjB2isRD"], "group": "mImpMx56", "roleId": "hAhS8UJx"}]}}], "Secret": "c3rz96bs", "TeamID": "Ga0yD6JH", "TokenAuthenticationType": "UhhPg7XD", "TokenClaimsMapping": {"XTqUDH9W": "1fWwzJix", "RJPHNDvd": "hiH1Fqyn", "XEl6vqT1": "7jaitdC3"}, "TokenEndpoint": "hSN3GzDG", "UserInfoEndpoint": "zDnQuQ7s", "UserInfoHTTPMethod": "eW8Rk0yf", "googleAdminConsoleKey": "sEOGl6Jg", "scopes": ["hFxPCWve", "M3d5rwim", "DHfoP1ka"]}' \
    > test.out 2>&1
eval_tap $? 145 'UpdateThirdPartyLoginPlatformCredentialV3' test.out

#- 146 UpdateThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '6i6V959T' \
    --body '{"affectedClientIDs": ["QKzBzQqB", "wYwDc3R7", "kMjwRmLe"], "assignedNamespaces": ["ibe02NKs", "Dlsaawc6", "M6TfYgRz"], "domain": "PIoCc4uT", "roleId": "nIgeWue1", "ssoCfg": {"googleKey": {"Fsn2hVXH": {}, "LkQHO7Ia": {}, "97TQUyMq": {}}, "groupConfigs": [{"assignNamespaces": ["o7Kusx6r", "BP5iSack", "o5n5j659"], "group": "Zj3E8I5I", "roleId": "ycmxgpTC"}, {"assignNamespaces": ["A502UfGz", "CNm0BVuY", "kxWXVlpi"], "group": "qqFIDCN5", "roleId": "PSNl7IGB"}, {"assignNamespaces": ["XNqmywYW", "ah2X7TqI", "k214C7lx"], "group": "7a0ZEPK2", "roleId": "k1d124Tt"}]}}' \
    > test.out 2>&1
eval_tap $? 146 'UpdateThirdPartyLoginPlatformDomainV3' test.out

#- 147 DeleteThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '554bGogh' \
    --body '{"domain": "tb4zVoE7", "ssoGroups": ["THZ238K9", "EVQEoZ1t", "q3lHHTnI"]}' \
    > test.out 2>&1
eval_tap $? 147 'DeleteThirdPartyLoginPlatformDomainV3' test.out

#- 148 PartialUpdateThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam partialUpdateThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'QHIsleSf' \
    --body '{"affectedClientIDs": ["TG7js7lK", "QvmXgxpw", "GVdek528"], "assignedNamespaces": ["9KcPIKR5", "lyc1snLm", "c8a2Q4ZZ"], "domain": "ImHhaSVT", "roleId": "lPpMZvsW", "ssoCfg": {"googleKey": {"mM57xnmf": {}, "QNV3RZxx": {}, "UTypOplS": {}}, "groupConfigs": [{"assignNamespaces": ["IgE0iHbQ", "mNh7IjRR", "713LZtH6"], "group": "kKDvMsZ2", "roleId": "z5yDtWGg"}, {"assignNamespaces": ["p2maeVL9", "t5CyM74c", "fznL0prT"], "group": "sJkVUeyF", "roleId": "vvbRSRgU"}, {"assignNamespaces": ["10Ctfvuq", "zZ5vf0gR", "3rwICt8J"], "group": "PKM4s90I", "roleId": "HP0AeZTv"}]}}' \
    > test.out 2>&1
eval_tap $? 148 'PartialUpdateThirdPartyLoginPlatformDomainV3' test.out

#- 149 RetrieveSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam retrieveSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'AkuSsFdp' \
    > test.out 2>&1
eval_tap $? 149 'RetrieveSSOLoginPlatformCredential' test.out

#- 150 AddSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam addSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'KXXaXfva' \
    --body '{"acsUrl": "nREpP85s", "apiKey": "kp3SjDTl", "appId": "3Z1sP4lC", "federationMetadataUrl": "9QSBhFnO", "isActive": false, "redirectUri": "HnL6z46n", "secret": "pfOjWQM9", "ssoUrl": "iF1M7K3t"}' \
    > test.out 2>&1
eval_tap $? 150 'AddSSOLoginPlatformCredential' test.out

#- 151 DeleteSSOLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteSSOLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'R25XgsuE' \
    > test.out 2>&1
eval_tap $? 151 'DeleteSSOLoginPlatformCredentialV3' test.out

#- 152 UpdateSSOPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam updateSSOPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'hEpHDjK6' \
    --body '{"acsUrl": "tHtKaTEW", "apiKey": "utUzQ4lc", "appId": "W8gb2P1V", "federationMetadataUrl": "xjNbRcDV", "isActive": true, "redirectUri": "VwJGMbwE", "secret": "alGdjfrU", "ssoUrl": "IzATnQL9"}' \
    > test.out 2>&1
eval_tap $? 152 'UpdateSSOPlatformCredential' test.out

#- 153 AdminListUserIDByPlatformUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByPlatformUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'cOlX3HiK' \
    --rawPID  \
    --rawPUID  \
    --body '{"platformUserIds": ["0bdZuJyS", "dTs17O5p", "IhG4Lv2w"]}' \
    > test.out 2>&1
eval_tap $? 153 'AdminListUserIDByPlatformUserIDsV3' test.out

#- 154 AdminGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '10gALlBK' \
    --platformUserId 'YslshZBU' \
    --pidType 'qfAY9214' \
    > test.out 2>&1
eval_tap $? 154 'AdminGetUserByPlatformUserIDV3' test.out

#- 155 AdminGetProfileUpdateStrategyV3
./ng net.accelbyte.sdk.cli.Main iam adminGetProfileUpdateStrategyV3 \
    --namespace "$AB_NAMESPACE" \
    --field 'dob' \
    > test.out 2>&1
eval_tap $? 155 'AdminGetProfileUpdateStrategyV3' test.out

#- 156 AdminUpdateProfileUpdateStrategyV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateProfileUpdateStrategyV3 \
    --namespace "$AB_NAMESPACE" \
    --field 'country' \
    --body '{"config": {"minimumAllowedInterval": 25}, "type": "FMkeBqyN"}' \
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
    --body '{"additions": [{"actions": [66, 83, 18], "resource": "dGB1tf9y"}, {"actions": [19, 72, 35], "resource": "bwdbSP7N"}, {"actions": [17, 46, 37], "resource": "8KMQ7QeT"}], "exclusions": [{"actions": [88, 50, 22], "resource": "r8TULLkj"}, {"actions": [90, 35, 60], "resource": "yrzFtnIp"}, {"actions": [24, 93, 79], "resource": "SasXZn02"}], "overrides": [{"actions": [45, 23, 40], "resource": "FCi4ABGi"}, {"actions": [30, 16, 21], "resource": "FREwCZeF"}, {"actions": [84, 45, 71], "resource": "YzosC6qB"}], "replacements": [{"replacement": {"actions": [76, 87, 12], "resource": "UksyxKvx"}, "target": "MAPngV38"}, {"replacement": {"actions": [39, 33, 62], "resource": "PxIlx8lh"}, "target": "nEJ0Tjpa"}, {"replacement": {"actions": [52, 92, 67], "resource": "FxSKBQ9p"}, "target": "2a9dbcyK"}]}' \
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
    --identity 'VIEW_ONLY' \
    --body '{"active": false}' \
    > test.out 2>&1
eval_tap $? 160 'AdminChangeRoleOverrideConfigStatusV3' test.out

#- 161 AdminGetRoleNamespacePermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleNamespacePermissionV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'sf7eyhzH' \
    > test.out 2>&1
eval_tap $? 161 'AdminGetRoleNamespacePermissionV3' test.out

#- 162 GetAdminUsersByRoleIdV3
./ng net.accelbyte.sdk.cli.Main iam getAdminUsersByRoleIdV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'y3NZnFQc' \
    --after '57' \
    --before '10' \
    --limit '91' \
    > test.out 2>&1
eval_tap $? 162 'GetAdminUsersByRoleIdV3' test.out

#- 163 AdminQueryTagV3
./ng net.accelbyte.sdk.cli.Main iam adminQueryTagV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '13' \
    --offset '36' \
    --tagName 'a9rA323X' \
    > test.out 2>&1
eval_tap $? 163 'AdminQueryTagV3' test.out

#- 164 AdminCreateTagV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateTagV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"tagName": "4pKgPrLZ"}' \
    > test.out 2>&1
eval_tap $? 164 'AdminCreateTagV3' test.out

#- 165 AdminUpdateTagV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateTagV3 \
    --namespace "$AB_NAMESPACE" \
    --tagId 'tVgDn8vI' \
    --body '{"tagName": "0nzrjAgy"}' \
    > test.out 2>&1
eval_tap $? 165 'AdminUpdateTagV3' test.out

#- 166 AdminDeleteTagV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteTagV3 \
    --namespace "$AB_NAMESPACE" \
    --tagId 'h0sfQLf9' \
    > test.out 2>&1
eval_tap $? 166 'AdminDeleteTagV3' test.out

#- 167 AdminGetUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --emailAddress 'xJwhdn4m' \
    > test.out 2>&1
eval_tap $? 167 'AdminGetUserByEmailAddressV3' test.out

#- 168 AdminBulkUpdateUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"updateRequest": {"skipLoginQueue": true}, "userIds": ["y6evX6c8", "0Wn7n6aQ", "UBHBMurg"]}' \
    > test.out 2>&1
eval_tap $? 168 'AdminBulkUpdateUsersV3' test.out

#- 169 AdminGetBulkUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType 'oG5sshML' \
    --body '{"bulkUserId": ["IBQqecni", "oLDp6590", "ao800rOE"]}' \
    > test.out 2>&1
eval_tap $? 169 'AdminGetBulkUserBanV3' test.out

#- 170 AdminListUserIDByUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"findByPublisherNamespace": true, "userIds": ["S6voBglJ", "gxM3X2iC", "lZPTos3V"]}' \
    > test.out 2>&1
eval_tap $? 170 'AdminListUserIDByUserIDsV3' test.out

#- 171 AdminBulkGetUsersPlatform
./ng net.accelbyte.sdk.cli.Main iam adminBulkGetUsersPlatform \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["HBmqt6l3", "za5h9has", "HGaB9XiB"]}' \
    > test.out 2>&1
eval_tap $? 171 'AdminBulkGetUsersPlatform' test.out

#- 172 AdminCursorGetUserV3
./ng net.accelbyte.sdk.cli.Main iam adminCursorGetUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"cursor": {"cursorTime": "NoMi9CAI", "userId": "UD4TqOMG"}, "fields": ["QV3XE4QY", "SlRldHkP", "BSXNfdUA"], "limit": 65}' \
    > test.out 2>&1
eval_tap $? 172 'AdminCursorGetUserV3' test.out

#- 173 AdminInviteUserV3
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddresses": ["27Ofz6gK", "ixeRKqUA", "iQXzxL4e"], "isAdmin": false, "languageTag": "zjY052pg", "namespace": "9y3qLZbV", "roles": ["uLsF0zyW", "dneOqnuJ", "eMw4qEUU"]}' \
    > test.out 2>&1
eval_tap $? 173 'AdminInviteUserV3' test.out

#- 174 AdminQueryThirdPlatformLinkHistoryV3
./ng net.accelbyte.sdk.cli.Main iam adminQueryThirdPlatformLinkHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '17' \
    --offset '55' \
    --platformUserId 'r0iaEu10' \
    --platformId 'OWfGlsQb' \
    > test.out 2>&1
eval_tap $? 174 'AdminQueryThirdPlatformLinkHistoryV3' test.out

#- 175 AdminListUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminListUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '96' \
    --offset '45' \
    > test.out 2>&1
eval_tap $? 175 'AdminListUsersV3' test.out

#- 176 AdminSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam adminSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'rjN0Qo7f' \
    --endDate 'GEawJ5gk' \
    --includeTotal  \
    --limit '6' \
    --offset '78' \
    --platformBy 'XC7x2nCB' \
    --platformId 'ofla088N' \
    --query 'z5yuy4CX' \
    --roleIds 'IMvIyWtQ' \
    --selectedFields 'f4jzLyL4' \
    --skipLoginQueue  \
    --startDate 'kMvu29Hc' \
    --tagIds '4IhoUXiA' \
    --testAccount  \
    > test.out 2>&1
eval_tap $? 176 'AdminSearchUserV3' test.out

#- 177 AdminGetBulkUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"listEmailAddressRequest": ["Bs9hNoYa", "L092olPs", "WmMAoUiY"]}' \
    > test.out 2>&1
eval_tap $? 177 'AdminGetBulkUserByEmailAddressV3' test.out

#- 178 AdminGetUserByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ObxYEBjv' \
    > test.out 2>&1
eval_tap $? 178 'AdminGetUserByUserIdV3' test.out

#- 179 AdminUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'TD3cYzhJ' \
    --body '{"avatarUrl": "uRfUBjUn", "country": "Yf6JLY1X", "dateOfBirth": "xeX1nbUH", "displayName": "nS7u4roF", "languageTag": "MHX0rEIC", "skipLoginQueue": true, "tags": ["ok0nWSgW", "k4DzxnBq", "G5qBxdZ5"], "uniqueDisplayName": "6q8JtzeN", "userName": "VGhUwFlB"}' \
    > test.out 2>&1
eval_tap $? 179 'AdminUpdateUserV3' test.out

#- 180 AdminGetUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'U2RG6Sjg' \
    --activeOnly  \
    --after 'q8GxE1Rl' \
    --before 'Wr821Avo' \
    --limit '57' \
    > test.out 2>&1
eval_tap $? 180 'AdminGetUserBanV3' test.out

#- 181 AdminBanUserV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'a0pj54xx' \
    --body '{"ban": "Zuur9uQv", "comment": "jCmAmjMX", "endDate": "3b84HLRw", "reason": "wKMts2we", "skipNotif": false}' \
    > test.out 2>&1
eval_tap $? 181 'AdminBanUserV3' test.out

#- 182 AdminGetUserBanSummaryV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanSummaryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '2OpSG0gC' \
    > test.out 2>&1
eval_tap $? 182 'AdminGetUserBanSummaryV3' test.out

#- 183 AdminUpdateUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserBanV3 \
    --banId 'DTGPqkwT' \
    --namespace "$AB_NAMESPACE" \
    --userId 'vlLcwTMZ' \
    --body '{"enabled": true, "skipNotif": false}' \
    > test.out 2>&1
eval_tap $? 183 'AdminUpdateUserBanV3' test.out

#- 184 AdminSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '0skAIfSk' \
    --body '{"context": "57G3eRaT", "emailAddress": "SYd9B0GL", "languageTag": "LUqBqokT", "upgradeToken": "d66y5Glu"}' \
    > test.out 2>&1
eval_tap $? 184 'AdminSendVerificationCodeV3' test.out

#- 185 AdminVerifyAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'g2fwnmmV' \
    --body '{"Code": "9QHGoBkd", "ContactType": "HLywuEJD", "LanguageTag": "yvfDNWdG", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 185 'AdminVerifyAccountV3' test.out

#- 186 GetUserVerificationCode
./ng net.accelbyte.sdk.cli.Main iam getUserVerificationCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'oBwzG2aZ' \
    > test.out 2>&1
eval_tap $? 186 'GetUserVerificationCode' test.out

#- 187 AdminGetUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Y8Mrpcq1' \
    > test.out 2>&1
eval_tap $? 187 'AdminGetUserDeletionStatusV3' test.out

#- 188 AdminUpdateUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '95CQNPoa' \
    --body '{"deletionDate": 74, "enabled": true}' \
    > test.out 2>&1
eval_tap $? 188 'AdminUpdateUserDeletionStatusV3' test.out

#- 189 AdminListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Lutp8iZr' \
    > test.out 2>&1
eval_tap $? 189 'AdminListUserAllPlatformAccountsDistinctV3' test.out

#- 190 AdminUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '9kASlz3r' \
    --body '{"code": "aYaMCV9o", "country": "U0lGp12O", "dateOfBirth": "0jZLOMQI", "displayName": "36wpv0eZ", "emailAddress": "GaK35IPw", "password": "FhLsltO0", "uniqueDisplayName": "YXjLGK5t", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 190 'AdminUpgradeHeadlessAccountV3' test.out

#- 191 AdminDeleteUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '557QNY14' \
    > test.out 2>&1
eval_tap $? 191 'AdminDeleteUserInformationV3' test.out

#- 192 AdminGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '0pqudOIE' \
    --after '0.988562418374768' \
    --before '0.38644048280693666' \
    --limit '71' \
    > test.out 2>&1
eval_tap $? 192 'AdminGetUserLoginHistoriesV3' test.out

#- 193 AdminResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam adminResetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'rlwPb0YY' \
    --body '{"languageTag": "aFoEvgfZ", "mfaToken": "nkKKfxon", "newPassword": "DNkTixgo", "oldPassword": "kUilGq6x"}' \
    > test.out 2>&1
eval_tap $? 193 'AdminResetPasswordV3' test.out

#- 194 AdminUpdateUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserPermissionV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '2ryMGQ6R' \
    --body '{"Permissions": [{"Action": 13, "Resource": "a8JBjSyH", "SchedAction": 63, "SchedCron": "BDweyBgN", "SchedRange": ["YA0f0d32", "ZFx3YCUL", "GfhXYhLo"]}, {"Action": 55, "Resource": "tkFV8WAC", "SchedAction": 85, "SchedCron": "w2tZz5Ef", "SchedRange": ["QvWQ92O5", "yspOT9tg", "1j4ptjR4"]}, {"Action": 62, "Resource": "0SIF15KH", "SchedAction": 41, "SchedCron": "umKHnCBj", "SchedRange": ["i8Un06ij", "oSlfRGun", "vHjYEqN2"]}]}' \
    > test.out 2>&1
eval_tap $? 194 'AdminUpdateUserPermissionV3' test.out

#- 195 AdminAddUserPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserPermissionsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'SDOhjTW9' \
    --body '{"Permissions": [{"Action": 21, "Resource": "zNoIWoFK", "SchedAction": 80, "SchedCron": "gHRsvdYU", "SchedRange": ["G9Pz1pKZ", "qbMdksS3", "I97KVz5m"]}, {"Action": 16, "Resource": "XbMOFbHB", "SchedAction": 39, "SchedCron": "u3YwQaoR", "SchedRange": ["94YlLif4", "jsYO3JQ4", "b494kaQm"]}, {"Action": 64, "Resource": "BgBh2M1Y", "SchedAction": 40, "SchedCron": "OIhMcnZm", "SchedRange": ["uqw3je33", "fMHSRpWt", "ArijCNsR"]}]}' \
    > test.out 2>&1
eval_tap $? 195 'AdminAddUserPermissionsV3' test.out

#- 196 AdminDeleteUserPermissionBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'XWIXB71d' \
    --body '[{"Action": 97, "Resource": "CJjObRYc"}, {"Action": 46, "Resource": "93myo5TD"}, {"Action": 1, "Resource": "u6yHdHFL"}]' \
    > test.out 2>&1
eval_tap $? 196 'AdminDeleteUserPermissionBulkV3' test.out

#- 197 AdminDeleteUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionV3 \
    --action '20' \
    --namespace "$AB_NAMESPACE" \
    --resource 'CUC8sNNE' \
    --userId 'bJaAlX1g' \
    > test.out 2>&1
eval_tap $? 197 'AdminDeleteUserPermissionV3' test.out

#- 198 AdminGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'KCsb0J8F' \
    --after '0AlDp2Hh' \
    --before 'rMEcJwZn' \
    --limit '12' \
    --platformId 'QpoqHsmF' \
    --targetNamespace 'BwXyOnnJ' \
    > test.out 2>&1
eval_tap $? 198 'AdminGetUserPlatformAccountsV3' test.out

#- 199 AdminListAllDistinctPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminListAllDistinctPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'uIN3mqhP' \
    --status 'jBxe8Rs4' \
    > test.out 2>&1
eval_tap $? 199 'AdminListAllDistinctPlatformAccountsV3' test.out

#- 200 AdminGetListJusticePlatformAccounts
./ng net.accelbyte.sdk.cli.Main iam adminGetListJusticePlatformAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'VsUs7wnp' \
    > test.out 2>&1
eval_tap $? 200 'AdminGetListJusticePlatformAccounts' test.out

#- 201 AdminGetUserMapping
./ng net.accelbyte.sdk.cli.Main iam adminGetUserMapping \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'o9zeJh98' \
    --userId '215OpWET' \
    > test.out 2>&1
eval_tap $? 201 'AdminGetUserMapping' test.out

#- 202 AdminCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam adminCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'ejB1o8Vt' \
    --userId 'v7aDAiwl' \
    > test.out 2>&1
eval_tap $? 202 'AdminCreateJusticeUser' test.out

#- 203 AdminLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'AumSJoft' \
    --skipConflict  \
    --body '{"platformId": "0zg1ib9g", "platformUserId": "MXEBAwDF"}' \
    > test.out 2>&1
eval_tap $? 203 'AdminLinkPlatformAccount' test.out

#- 204 AdminGetUserLinkHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLinkHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'lt3S1KXG' \
    --platformId 'NwBLXnKf' \
    > test.out 2>&1
eval_tap $? 204 'AdminGetUserLinkHistoriesV3' test.out

#- 205 AdminPlatformUnlinkV3
eval_tap 0 205 'AdminPlatformUnlinkV3 # SKIP deprecated' test.out

#- 206 AdminPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'QXLKtAsq' \
    --userId 'FKWMDPRb' \
    > test.out 2>&1
eval_tap $? 206 'AdminPlatformUnlinkAllV3' test.out

#- 207 AdminPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '1J5QrdKg' \
    --userId 'ErgBHi8o' \
    --ticket 'PD6Ojbna' \
    > test.out 2>&1
eval_tap $? 207 'AdminPlatformLinkV3' test.out

#- 208 AdminDeleteUserLinkingHistoryByPlatformIDV3
eval_tap 0 208 'AdminDeleteUserLinkingHistoryByPlatformIDV3 # SKIP deprecated' test.out

#- 209 AdminDeleteUserLinkingRestrictionByPlatformIDV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserLinkingRestrictionByPlatformIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'RjCSNTag' \
    --userId '4Enh1Djc' \
    > test.out 2>&1
eval_tap $? 209 'AdminDeleteUserLinkingRestrictionByPlatformIDV3' test.out

#- 210 AdminGetThirdPartyPlatformTokenLinkStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetThirdPartyPlatformTokenLinkStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'TpLKvgyl' \
    --userId 'eEU7vkdP' \
    --platformToken 'QgzTUOAQ' \
    > test.out 2>&1
eval_tap $? 210 'AdminGetThirdPartyPlatformTokenLinkStatusV3' test.out

#- 211 AdminGetUserSinglePlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminGetUserSinglePlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --platformId 'oFovcDBM' \
    --userId 'RBMsde6A' \
    --crossNamespace  \
    > test.out 2>&1
eval_tap $? 211 'AdminGetUserSinglePlatformAccount' test.out

#- 212 AdminDeleteUserRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRolesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'D8KCTats' \
    --body '["zJWkZlzl", "ZKZ8iudB", "iSjE6MDy"]' \
    > test.out 2>&1
eval_tap $? 212 'AdminDeleteUserRolesV3' test.out

#- 213 AdminSaveUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminSaveUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'RWSZyq15' \
    --body '[{"namespace": "3rWLFmoj", "roleId": "CtUqiRP5"}, {"namespace": "JO5h5A6B", "roleId": "ToEPm8uv"}, {"namespace": "BZwl2v4G", "roleId": "2jH6QLQy"}]' \
    > test.out 2>&1
eval_tap $? 213 'AdminSaveUserRoleV3' test.out

#- 214 AdminAddUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'SnrIouES' \
    --userId 'dgAu3nch' \
    > test.out 2>&1
eval_tap $? 214 'AdminAddUserRoleV3' test.out

#- 215 AdminDeleteUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'jontrd1j' \
    --userId 'hGjXMf0A' \
    > test.out 2>&1
eval_tap $? 215 'AdminDeleteUserRoleV3' test.out

#- 216 AdminGetUserStateByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserStateByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'VENkhy6E' \
    > test.out 2>&1
eval_tap $? 216 'AdminGetUserStateByUserIdV3' test.out

#- 217 AdminUpdateUserStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '0iTbEfX4' \
    --body '{"enabled": false, "reason": "B0Auilft"}' \
    > test.out 2>&1
eval_tap $? 217 'AdminUpdateUserStatusV3' test.out

#- 218 AdminTrustlyUpdateUserIdentity
./ng net.accelbyte.sdk.cli.Main iam adminTrustlyUpdateUserIdentity \
    --namespace "$AB_NAMESPACE" \
    --userId '5g9HsKfr' \
    --body '{"emailAddress": "XYMXhdwD", "password": "jCOgoQjS"}' \
    > test.out 2>&1
eval_tap $? 218 'AdminTrustlyUpdateUserIdentity' test.out

#- 219 AdminVerifyUserWithoutVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyUserWithoutVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '7iUrCfQk' \
    > test.out 2>&1
eval_tap $? 219 'AdminVerifyUserWithoutVerificationCodeV3' test.out

#- 220 AdminUpdateClientSecretV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientSecretV3 \
    --clientId 'eyKCB213' \
    --namespace "$AB_NAMESPACE" \
    --body '{"newSecret": "VQkgT47Y"}' \
    > test.out 2>&1
eval_tap $? 220 'AdminUpdateClientSecretV3' test.out

#- 221 AdminCheckThirdPartyLoginPlatformAvailabilityV3
./ng net.accelbyte.sdk.cli.Main iam adminCheckThirdPartyLoginPlatformAvailabilityV3 \
    --platformId 'HdNHLADt' \
    > test.out 2>&1
eval_tap $? 221 'AdminCheckThirdPartyLoginPlatformAvailabilityV3' test.out

#- 222 AdminGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV3 \
    --after 'dlNQ4WsE' \
    --before 'FlaL19Ov' \
    --isWildcard  \
    --limit '57' \
    > test.out 2>&1
eval_tap $? 222 'AdminGetRolesV3' test.out

#- 223 AdminCreateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV3 \
    --body '{"adminRole": false, "deletable": true, "isWildcard": false, "managers": [{"displayName": "gF4jOyBk", "namespace": "fEn0Fdpi", "userId": "o2oyTbL4"}, {"displayName": "JSZwQIoX", "namespace": "SklgfMML", "userId": "HFdn0bRS"}, {"displayName": "CvyCahbt", "namespace": "Lo5rZQLa", "userId": "H2G0gDF3"}], "members": [{"displayName": "wm5tLFlG", "namespace": "606aMNKZ", "userId": "GauyeOIl"}, {"displayName": "SksVFXD8", "namespace": "gfMfNUYZ", "userId": "2RLEh1qv"}, {"displayName": "k3ZzHfXw", "namespace": "4jVMZbNW", "userId": "f4kPqsMA"}], "permissions": [{"action": 64, "resource": "yQPqaqOm", "schedAction": 44, "schedCron": "GjR6WtXf", "schedRange": ["pq7mpr5D", "gE5m6D2j", "CXcUj8eC"]}, {"action": 5, "resource": "QtOBTsNQ", "schedAction": 91, "schedCron": "ttkWrIhH", "schedRange": ["zmAt4EYB", "T8EkX1dA", "ZmUtbIBH"]}, {"action": 61, "resource": "V5HdyqrG", "schedAction": 98, "schedCron": "exxXLDzO", "schedRange": ["IifisIRU", "EqSDCxlG", "0b16W0HX"]}], "roleName": "6FTTt34Y"}' \
    > test.out 2>&1
eval_tap $? 223 'AdminCreateRoleV3' test.out

#- 224 AdminGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV3 \
    --roleId '799sBjZE' \
    > test.out 2>&1
eval_tap $? 224 'AdminGetRoleV3' test.out

#- 225 AdminDeleteRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV3 \
    --roleId '9f801v2q' \
    > test.out 2>&1
eval_tap $? 225 'AdminDeleteRoleV3' test.out

#- 226 AdminUpdateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV3 \
    --roleId 'n6RE1cB8' \
    --body '{"deletable": true, "isWildcard": true, "roleName": "tsOME75F"}' \
    > test.out 2>&1
eval_tap $? 226 'AdminUpdateRoleV3' test.out

#- 227 AdminGetRoleAdminStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleAdminStatusV3 \
    --roleId 'Ga6sBbBC' \
    > test.out 2>&1
eval_tap $? 227 'AdminGetRoleAdminStatusV3' test.out

#- 228 AdminUpdateAdminRoleStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateAdminRoleStatusV3 \
    --roleId 'IPzYjOkv' \
    > test.out 2>&1
eval_tap $? 228 'AdminUpdateAdminRoleStatusV3' test.out

#- 229 AdminRemoveRoleAdminV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleAdminV3 \
    --roleId 'oNen2erI' \
    > test.out 2>&1
eval_tap $? 229 'AdminRemoveRoleAdminV3' test.out

#- 230 AdminGetRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleManagersV3 \
    --roleId 'DkIeGKQX' \
    --after 'dyUsKMJ7' \
    --before 'dJdNaGxC' \
    --limit '8' \
    > test.out 2>&1
eval_tap $? 230 'AdminGetRoleManagersV3' test.out

#- 231 AdminAddRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleManagersV3 \
    --roleId 'jwRZVIe6' \
    --body '{"managers": [{"displayName": "qbECaS1J", "namespace": "3VMeh5RT", "userId": "o6yxSFS8"}, {"displayName": "yqHdxBOt", "namespace": "cYbDQeVT", "userId": "yXw65i5n"}, {"displayName": "QgHURfpM", "namespace": "BgA41OJK", "userId": "TAnuEeQJ"}]}' \
    > test.out 2>&1
eval_tap $? 231 'AdminAddRoleManagersV3' test.out

#- 232 AdminRemoveRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleManagersV3 \
    --roleId 'LJMQJQR5' \
    --body '{"managers": [{"displayName": "xzjPwrUj", "namespace": "3mmzwwtV", "userId": "KsoU5QAD"}, {"displayName": "51DYIV0q", "namespace": "uZp5wozq", "userId": "rmOde67V"}, {"displayName": "mLEVyWie", "namespace": "uNryo1ET", "userId": "9DEKRjhG"}]}' \
    > test.out 2>&1
eval_tap $? 232 'AdminRemoveRoleManagersV3' test.out

#- 233 AdminGetRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleMembersV3 \
    --roleId 'VowfbrYN' \
    --after 'S7nzmZoX' \
    --before 'HfaoqMRY' \
    --limit '9' \
    > test.out 2>&1
eval_tap $? 233 'AdminGetRoleMembersV3' test.out

#- 234 AdminAddRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleMembersV3 \
    --roleId 'AkDyuJmo' \
    --body '{"members": [{"displayName": "dUKUjfhu", "namespace": "xWtCk6ZB", "userId": "wwZNynbF"}, {"displayName": "DjgqSzPN", "namespace": "MBUdVJ4z", "userId": "zoAFLoxs"}, {"displayName": "b6rEqnDV", "namespace": "W3MjDXx2", "userId": "gMxUkGEO"}]}' \
    > test.out 2>&1
eval_tap $? 234 'AdminAddRoleMembersV3' test.out

#- 235 AdminRemoveRoleMembersV3
eval_tap 0 235 'AdminRemoveRoleMembersV3 # SKIP deprecated' test.out

#- 236 AdminUpdateRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV3 \
    --roleId 'XC5LiwD3' \
    --body '{"permissions": [{"action": 60, "resource": "paK9Cinv", "schedAction": 5, "schedCron": "WB8EAH6h", "schedRange": ["F8OPGY7n", "zDHtybRK", "1UkeyxJ0"]}, {"action": 2, "resource": "jmsTCUwb", "schedAction": 16, "schedCron": "ASCc9alo", "schedRange": ["zMk4rKoz", "yJcfDeYg", "dG7Ubb4A"]}, {"action": 45, "resource": "JbmPLhiO", "schedAction": 30, "schedCron": "rATuIaAE", "schedRange": ["OLGIjRWV", "9peLL6VP", "cCHe4DvL"]}]}' \
    > test.out 2>&1
eval_tap $? 236 'AdminUpdateRolePermissionsV3' test.out

#- 237 AdminAddRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV3 \
    --roleId 'SAM6RUS1' \
    --body '{"permissions": [{"action": 73, "resource": "GchKycxD", "schedAction": 48, "schedCron": "n4e1FruK", "schedRange": ["Um4qAz2c", "ngX1Ovlo", "1Rr8YiiH"]}, {"action": 72, "resource": "d0FdwBv3", "schedAction": 97, "schedCron": "9QzaTrXQ", "schedRange": ["fUjr5efL", "kHoHxoOg", "iq0GGxnE"]}, {"action": 79, "resource": "rrg0Oag8", "schedAction": 92, "schedCron": "cvbyZJK5", "schedRange": ["1tBCQj6s", "zodw4rUD", "dMEdIjes"]}]}' \
    > test.out 2>&1
eval_tap $? 237 'AdminAddRolePermissionsV3' test.out

#- 238 AdminDeleteRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV3 \
    --roleId 'hELBN2eT' \
    --body '["d0pgtOAV", "hasQoK7S", "RCrLZnmP"]' \
    > test.out 2>&1
eval_tap $? 238 'AdminDeleteRolePermissionsV3' test.out

#- 239 AdminDeleteRolePermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionV3 \
    --action '34' \
    --resource '87bChywl' \
    --roleId 'mWWMDPgr' \
    > test.out 2>&1
eval_tap $? 239 'AdminDeleteRolePermissionV3' test.out

#- 240 AdminGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam adminGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 240 'AdminGetMyUserV3' test.out

#- 241 UserAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam userAuthenticationV3 \
    --clientId 'twv5TO0t' \
    --extendExp  \
    --redirectUri '9y1ipsB1' \
    --password 'xT85af8e' \
    --requestId 'OdSilJ5a' \
    --userName 'N7YbGUc8' \
    > test.out 2>&1
eval_tap $? 241 'UserAuthenticationV3' test.out

#- 242 AuthenticationWithPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV3 \
    --extendExp  \
    --clientId 'SDQgpV2e' \
    --linkingToken '3pRrFxLf' \
    --password 'DLr0EU5x' \
    --username 'fMf4eh38' \
    > test.out 2>&1
eval_tap $? 242 'AuthenticationWithPlatformLinkV3' test.out

#- 243 AuthenticateAndLinkForwardV3
./ng net.accelbyte.sdk.cli.Main iam authenticateAndLinkForwardV3 \
    --extendExp  \
    --clientId 'Xw1EHsjd' \
    --linkingToken 'nPOLrtjJ' \
    --password '8ykdcSdP' \
    --username 'lD6Q2IfS' \
    > test.out 2>&1
eval_tap $? 243 'AuthenticateAndLinkForwardV3' test.out

#- 244 PublicGetSystemConfigV3
./ng net.accelbyte.sdk.cli.Main iam publicGetSystemConfigV3 \
    > test.out 2>&1
eval_tap $? 244 'PublicGetSystemConfigV3' test.out

#- 245 GenerateTokenByNewHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV3 \
    --additionalData 'SgirEnDK' \
    --extendExp  \
    --linkingToken 'OdMNj8yt' \
    > test.out 2>&1
eval_tap $? 245 'GenerateTokenByNewHeadlessAccountV3' test.out

#- 246 RequestOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam requestOneTimeLinkingCodeV3 \
    --redirectUri 'z5v26ef0' \
    --state 'iHSdF41z' \
    --platformId '9PzmiiLG' \
    > test.out 2>&1
eval_tap $? 246 'RequestOneTimeLinkingCodeV3' test.out

#- 247 ValidateOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam validateOneTimeLinkingCodeV3 \
    --oneTimeLinkCode 'ywDh025i' \
    > test.out 2>&1
eval_tap $? 247 'ValidateOneTimeLinkingCodeV3' test.out

#- 248 RequestTokenByOneTimeLinkCodeResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTokenByOneTimeLinkCodeResponseV3 \
    --additionalData 'D1g1wHbx' \
    --isTransient  \
    --clientId 'TlUJSvN3' \
    --oneTimeLinkCode 'YsMBBknb' \
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
    --codeChallenge 'UcqtXyLe' \
    --codeChallengeMethod 'plain' \
    --clientId 'bQAq9BQk' \
    > test.out 2>&1
eval_tap $? 251 'RequestTokenExchangeCodeV3' test.out

#- 252 AdminRetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam adminRetrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'KGiyIvtC' \
    --userId 'fDmJkOLN' \
    --platformUserId 'buFdv4u5' \
    > test.out 2>&1
eval_tap $? 252 'AdminRetrieveUserThirdPartyPlatformTokenV3' test.out

#- 253 RevokeUserV3
./ng net.accelbyte.sdk.cli.Main iam revokeUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'j6p2WNLj' \
    --includeGameNamespace  \
    > test.out 2>&1
eval_tap $? 253 'RevokeUserV3' test.out

#- 254 AuthorizeV3
./ng net.accelbyte.sdk.cli.Main iam authorizeV3 \
    --blockedPlatformId 'zFqtKyFZ' \
    --codeChallenge 'W0fcTL9o' \
    --codeChallengeMethod 'plain' \
    --createHeadless  \
    --loginWebBased  \
    --nonce 'Vobim9Zi' \
    --oneTimeLinkCode 'slmM1xXq' \
    --redirectUri 'jWnTLuyv' \
    --scope '5sqEXCvR' \
    --state 'Y266SzVD' \
    --targetAuthPage 'lwtpTFAE' \
    --useRedirectUriAsLoginUrlWhenLocked  \
    --clientId 'ElnGa4ev' \
    --responseType 'code' \
    > test.out 2>&1
eval_tap $? 254 'AuthorizeV3' test.out

#- 255 TokenIntrospectionV3
./ng net.accelbyte.sdk.cli.Main iam tokenIntrospectionV3 \
    --token '7dNKVGhz' \
    > test.out 2>&1
eval_tap $? 255 'TokenIntrospectionV3' test.out

#- 256 GetJWKSV3
./ng net.accelbyte.sdk.cli.Main iam getJWKSV3 \
    > test.out 2>&1
eval_tap $? 256 'GetJWKSV3' test.out

#- 257 SendMFAAuthenticationCode
./ng net.accelbyte.sdk.cli.Main iam sendMFAAuthenticationCode \
    --clientId 'AfTuMsPI' \
    --factor 'T6Zu3ADQ' \
    --mfaToken 'B6rD5Yn6' \
    > test.out 2>&1
eval_tap $? 257 'SendMFAAuthenticationCode' test.out

#- 258 Change2faMethod
./ng net.accelbyte.sdk.cli.Main iam change2faMethod \
    --factor 'wfgaoJr1' \
    --mfaToken 'kSlcQy8k' \
    > test.out 2>&1
eval_tap $? 258 'Change2faMethod' test.out

#- 259 Verify2faCode
./ng net.accelbyte.sdk.cli.Main iam verify2faCode \
    --code '27p7dPD5' \
    --factor 'gdai091G' \
    --mfaToken '4d1ZuxrT' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 259 'Verify2faCode' test.out

#- 260 Verify2faCodeForward
./ng net.accelbyte.sdk.cli.Main iam verify2faCodeForward \
    --defaultFactor 'gIYGVJHU' \
    --factors '3NWSP14f' \
    --rememberDevice  \
    --clientId 'mwyZWzZr' \
    --code 'Z32rKdX7' \
    --factor 'E87pRcq6' \
    --mfaToken 'w3JSG9UG' \
    > test.out 2>&1
eval_tap $? 260 'Verify2faCodeForward' test.out

#- 261 RetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam retrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'SRwE7DB1' \
    --userId 'A7ueia5M' \
    > test.out 2>&1
eval_tap $? 261 'RetrieveUserThirdPartyPlatformTokenV3' test.out

#- 262 AuthCodeRequestV3
./ng net.accelbyte.sdk.cli.Main iam authCodeRequestV3 \
    --platformId 'htNnL377' \
    --clientId 'G6VG31yw' \
    --redirectUri 'hpJCsNUW' \
    --requestId 'bjOLUmTG' \
    > test.out 2>&1
eval_tap $? 262 'AuthCodeRequestV3' test.out

#- 263 PlatformTokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV3 \
    --platformId 'hUlEYixW' \
    --additionalData 'RlGDZ4Xw' \
    --clientId 'AmpTsIeM' \
    --createHeadless  \
    --deviceId 'DpJwSrT3' \
    --macAddress 'jO1G5Nif' \
    --platformToken 'lbo3lxxA' \
    --serviceLabel '0.7721959953659459' \
    --skipSetCookie  \
    > test.out 2>&1
eval_tap $? 263 'PlatformTokenGrantV3' test.out

#- 264 GetRevocationListV3
./ng net.accelbyte.sdk.cli.Main iam getRevocationListV3 \
    > test.out 2>&1
eval_tap $? 264 'GetRevocationListV3' test.out

#- 265 TokenRevocationV3
./ng net.accelbyte.sdk.cli.Main iam tokenRevocationV3 \
    --token 'WPS1LptD' \
    > test.out 2>&1
eval_tap $? 265 'TokenRevocationV3' test.out

#- 266 SimultaneousLoginV3
./ng net.accelbyte.sdk.cli.Main iam simultaneousLoginV3 \
    --simultaneousPlatform 'Iu27hkkJ' \
    --simultaneousTicket 'mHe5fnDO' \
    --nativePlatform 'epicgames' \
    --nativePlatformTicket 'LMzF52Yb' \
    > test.out 2>&1
eval_tap $? 266 'SimultaneousLoginV3' test.out

#- 267 TokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV3 \
    --additionalData 'wob9aCtq' \
    --clientId 'vUcF7sAk' \
    --clientSecret 'lafA31k2' \
    --code 'toJFIjMQ' \
    --codeVerifier 'igaEPVzY' \
    --extendNamespace 'cNJLpX7B' \
    --extendExp  \
    --password 'yABUpEUb' \
    --redirectUri 'NRWx3y59' \
    --refreshToken 'Es1LJ7xN' \
    --scope 'Y21slc3j' \
    --username '4xTKpku3' \
    --grantType 'urn:ietf:params:oauth:grant-type:extend_client_credentials' \
    > test.out 2>&1
eval_tap $? 267 'TokenGrantV3' test.out

#- 268 VerifyTokenV3
./ng net.accelbyte.sdk.cli.Main iam verifyTokenV3 \
    --token '78TbZgtf' \
    > test.out 2>&1
eval_tap $? 268 'VerifyTokenV3' test.out

#- 269 PlatformAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticationV3 \
    --platformId '7fYIPPK5' \
    --code 'ProDQk64' \
    --error 'no5TFO1E' \
    --openidAssocHandle 'So7ne199' \
    --openidClaimedId 'OykOFzQi' \
    --openidIdentity 'cHHMsy9J' \
    --openidMode 'eNMWQh42' \
    --openidNs 'PUg3IAJt' \
    --openidOpEndpoint '6UBITFMM' \
    --openidResponseNonce 'LAoDqiW7' \
    --openidReturnTo 'UeRxNQzI' \
    --openidSig '7V7uqR4p' \
    --openidSigned 'iXvImHey' \
    --state 'D7jOQL64' \
    > test.out 2>&1
eval_tap $? 269 'PlatformAuthenticationV3' test.out

#- 270 PlatformTokenRefreshV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenRefreshV3 \
    --platformId 'XcaifjtX' \
    --platformToken 'KM9JqDq0' \
    > test.out 2>&1
eval_tap $? 270 'PlatformTokenRefreshV3' test.out

#- 271 PublicGetInputValidations
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidations \
    --defaultOnEmpty  \
    --languageCode 'L2UG3hIT' \
    > test.out 2>&1
eval_tap $? 271 'PublicGetInputValidations' test.out

#- 272 PublicGetInputValidationByField
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidationByField \
    --field 'NzbsMsYY' \
    > test.out 2>&1
eval_tap $? 272 'PublicGetInputValidationByField' test.out

#- 273 PublicGetCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam publicGetCountryAgeRestrictionV3 \
    --countryCode 'bI6f87BY' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 273 'PublicGetCountryAgeRestrictionV3' test.out

#- 274 PublicGetConfigValueV3
./ng net.accelbyte.sdk.cli.Main iam publicGetConfigValueV3 \
    --configKey '3ujTu5Zn' \
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
    --clientId 'BOuBea0G' \
    > test.out 2>&1
eval_tap $? 277 'RetrieveActiveOIDCClientsPublicV3' test.out

#- 278 PublicListUserIDByPlatformUserIDsV3
eval_tap 0 278 'PublicListUserIDByPlatformUserIDsV3 # SKIP deprecated' test.out

#- 279 PublicGetUserByPlatformUserIDV3
eval_tap 0 279 'PublicGetUserByPlatformUserIDV3 # SKIP deprecated' test.out

#- 280 PublicGetProfileUpdateStrategyV3
./ng net.accelbyte.sdk.cli.Main iam publicGetProfileUpdateStrategyV3 \
    --namespace "$AB_NAMESPACE" \
    --field 'display_name' \
    > test.out 2>&1
eval_tap $? 280 'PublicGetProfileUpdateStrategyV3' test.out

#- 281 PublicGetAsyncStatus
./ng net.accelbyte.sdk.cli.Main iam publicGetAsyncStatus \
    --namespace "$AB_NAMESPACE" \
    --requestId 'DT2vpTTH' \
    > test.out 2>&1
eval_tap $? 281 'PublicGetAsyncStatus' test.out

#- 282 PublicSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam publicSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'xeOMgOZK' \
    --limit '41' \
    --offset '23' \
    --platformBy 'v40vJE7Z' \
    --platformId 'UGR14Y17' \
    --query 'EwUxzHPS' \
    > test.out 2>&1
eval_tap $? 282 'PublicSearchUserV3' test.out

#- 283 PublicCreateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "b4nfItuv", "acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "jA5p7VDt", "policyId": "eWFQDkLV", "policyVersionId": "AA6NSlT4"}, {"isAccepted": true, "localizedPolicyVersionId": "02YnbvQI", "policyId": "pjP44QY8", "policyVersionId": "k8FsKzVp"}, {"isAccepted": true, "localizedPolicyVersionId": "ukUdfYaO", "policyId": "ZkC890bR", "policyVersionId": "TPzEwhNp"}], "authType": "4tgMLbIk", "code": "uPDHPfMT", "country": "7McLbKZf", "dateOfBirth": "a3mR38z3", "displayName": "EhFc8Mh6", "emailAddress": "C5F6UZl9", "password": "11PPH0Wk", "reachMinimumAge": false, "uniqueDisplayName": "UV6d7Q4m"}' \
    > test.out 2>&1
eval_tap $? 283 'PublicCreateUserV3' test.out

#- 284 CheckUserAvailability
./ng net.accelbyte.sdk.cli.Main iam checkUserAvailability \
    --namespace "$AB_NAMESPACE" \
    --field 'no6YluO7' \
    --query 'T3rrora0' \
    > test.out 2>&1
eval_tap $? 284 'CheckUserAvailability' test.out

#- 285 PublicBulkGetUsers
eval_tap 0 285 'PublicBulkGetUsers # SKIP deprecated' test.out

#- 286 PublicSendRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicSendRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "R02EDzvm", "languageTag": "ahmWV6MI"}' \
    > test.out 2>&1
eval_tap $? 286 'PublicSendRegistrationCode' test.out

#- 287 PublicVerifyRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicVerifyRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "QqjgLY2Q", "emailAddress": "Y70SQcfP"}' \
    > test.out 2>&1
eval_tap $? 287 'PublicVerifyRegistrationCode' test.out

#- 288 PublicForgotPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicForgotPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "wfoH9T8l", "languageTag": "CkmljLTL"}' \
    > test.out 2>&1
eval_tap $? 288 'PublicForgotPasswordV3' test.out

#- 289 PublicValidateUserInput
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserInput \
    --namespace "$AB_NAMESPACE" \
    --body '{"displayName": "4c4zNL73", "password": "TLEvi0Ww", "uniqueDisplayName": "QxPkHoxi", "username": "Thr82dIO"}' \
    > test.out 2>&1
eval_tap $? 289 'PublicValidateUserInput' test.out

#- 290 GetAdminInvitationV3
./ng net.accelbyte.sdk.cli.Main iam getAdminInvitationV3 \
    --invitationId 'HDU0OBtx' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 290 'GetAdminInvitationV3' test.out

#- 291 CreateUserFromInvitationV3
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV3 \
    --invitationId '6XCkjP7G' \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "HJQGS6Kt", "acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "nsskNO8s", "policyId": "i7QZQQf7", "policyVersionId": "QPSBWktz"}, {"isAccepted": true, "localizedPolicyVersionId": "fiRwtvrY", "policyId": "XK28Zctw", "policyVersionId": "7bu33RTI"}, {"isAccepted": false, "localizedPolicyVersionId": "vA0wzID9", "policyId": "9IhxpMlp", "policyVersionId": "Lg53mTHX"}], "authType": "P0SzrfGh", "code": "nixJhgd7", "country": "C72XHCIE", "dateOfBirth": "vpuC53Cy", "displayName": "kZVQ6MJ8", "emailAddress": "GPsPDdK8", "password": "tI0MJd4g", "reachMinimumAge": false, "uniqueDisplayName": "Tara9818"}' \
    > test.out 2>&1
eval_tap $? 291 'CreateUserFromInvitationV3' test.out

#- 292 UpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam updateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "JkJef1Cn", "country": "L3xOV0uX", "dateOfBirth": "fPUAxHWo", "displayName": "Yf19izkW", "languageTag": "IM1pgk5M", "uniqueDisplayName": "pn1nCaQK", "userName": "Tv3Ud9zQ"}' \
    > test.out 2>&1
eval_tap $? 292 'UpdateUserV3' test.out

#- 293 PublicPartialUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicPartialUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "oudvtz2G", "country": "9tsCr8fx", "dateOfBirth": "ReGCSczp", "displayName": "5ATCFwOu", "languageTag": "VSLooD1W", "uniqueDisplayName": "DY3UcA6C", "userName": "Se8aENg7"}' \
    > test.out 2>&1
eval_tap $? 293 'PublicPartialUpdateUserV3' test.out

#- 294 PublicSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"context": "XsS0Up7c", "emailAddress": "IGrR75bK", "languageTag": "qNQL2gEI", "upgradeToken": "NqzFn1P0"}' \
    > test.out 2>&1
eval_tap $? 294 'PublicSendVerificationCodeV3' test.out

#- 295 PublicUserVerificationV3
./ng net.accelbyte.sdk.cli.Main iam publicUserVerificationV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "Ze6BBgK9", "contactType": "LYWFDv6x", "languageTag": "eRmcKLn6", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 295 'PublicUserVerificationV3' test.out

#- 296 PublicUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "2lPLXIbP", "country": "qARmQVYd", "dateOfBirth": "QgG5GvQX", "displayName": "povu2Z5j", "emailAddress": "DRnJR6qo", "password": "umCypnhs", "uniqueDisplayName": "0bTeKMcI", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 296 'PublicUpgradeHeadlessAccountV3' test.out

#- 297 PublicVerifyHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --needVerificationCode  \
    --body '{"emailAddress": "XT0oz3N2", "password": "qHX04tUY"}' \
    > test.out 2>&1
eval_tap $? 297 'PublicVerifyHeadlessAccountV3' test.out

#- 298 PublicUpdatePasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicUpdatePasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"languageTag": "wEmZ1Xzb", "mfaToken": "e9QFdasq", "newPassword": "tXPAGgMW", "oldPassword": "uhoH2l4Z"}' \
    > test.out 2>&1
eval_tap $? 298 'PublicUpdatePasswordV3' test.out

#- 299 PublicCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam publicCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'tRAYMgJu' \
    > test.out 2>&1
eval_tap $? 299 'PublicCreateJusticeUser' test.out

#- 300 PublicPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'UZACIbf1' \
    --redirectUri 'JKbAU9xx' \
    --ticket 'ts4jGRHb' \
    > test.out 2>&1
eval_tap $? 300 'PublicPlatformLinkV3' test.out

#- 301 PublicPlatformUnlinkV3
eval_tap 0 301 'PublicPlatformUnlinkV3 # SKIP deprecated' test.out

#- 302 PublicPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'MutvazRD' \
    > test.out 2>&1
eval_tap $? 302 'PublicPlatformUnlinkAllV3' test.out

#- 303 PublicForcePlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicForcePlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '1MZclqD6' \
    --ticket 'RkTFwSFo' \
    > test.out 2>&1
eval_tap $? 303 'PublicForcePlatformLinkV3' test.out

#- 304 PublicWebLinkPlatform
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatform \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Ix3l74EM' \
    --clientId '1eSdxYXS' \
    --redirectUri 'i9e2tMFk' \
    > test.out 2>&1
eval_tap $? 304 'PublicWebLinkPlatform' test.out

#- 305 PublicWebLinkPlatformEstablish
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatformEstablish \
    --namespace "$AB_NAMESPACE" \
    --platformId 'yfPGtg8K' \
    --code 'cRKe9JXM' \
    --state 'TsOujbBX' \
    > test.out 2>&1
eval_tap $? 305 'PublicWebLinkPlatformEstablish' test.out

#- 306 PublicProcessWebLinkPlatformV3
./ng net.accelbyte.sdk.cli.Main iam publicProcessWebLinkPlatformV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'IomtkIde' \
    --code 'e4TDej8H' \
    --state 'n8PVpUTG' \
    > test.out 2>&1
eval_tap $? 306 'PublicProcessWebLinkPlatformV3' test.out

#- 307 PublicGetUsersPlatformInfosV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUsersPlatformInfosV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"platformId": "cEppzERo", "userIds": ["GHc8gDLB", "1WR6n9gE", "bfq4wAwO"]}' \
    > test.out 2>&1
eval_tap $? 307 'PublicGetUsersPlatformInfosV3' test.out

#- 308 ResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam resetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientId": "cbnUY3ME", "code": "LckBXJDn", "emailAddress": "A45ZxeIh", "languageTag": "QbtWxkKh", "newPassword": "O3o3Elpt"}' \
    > test.out 2>&1
eval_tap $? 308 'ResetPasswordV3' test.out

#- 309 PublicGetUserByUserIdV3
eval_tap 0 309 'PublicGetUserByUserIdV3 # SKIP deprecated' test.out

#- 310 PublicGetUserBanHistoryV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserBanHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '2jsOqhwe' \
    --activeOnly  \
    --after 'KH61COQr' \
    --before 'VAn6yss6' \
    --limit '69' \
    > test.out 2>&1
eval_tap $? 310 'PublicGetUserBanHistoryV3' test.out

#- 311 PublicListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'aUnqnbTK' \
    > test.out 2>&1
eval_tap $? 311 'PublicListUserAllPlatformAccountsDistinctV3' test.out

#- 312 PublicGetUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '4fqEcnpb' \
    > test.out 2>&1
eval_tap $? 312 'PublicGetUserInformationV3' test.out

#- 313 PublicGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'kkjko2mY' \
    --after '0.8263686615955687' \
    --before '0.3208181886534571' \
    --limit '75' \
    > test.out 2>&1
eval_tap $? 313 'PublicGetUserLoginHistoriesV3' test.out

#- 314 PublicGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '2woAOd9i' \
    --after 'IsKePCaE' \
    --before '4XIIXZkR' \
    --limit '90' \
    --platformId 'ef1rupG8' \
    > test.out 2>&1
eval_tap $? 314 'PublicGetUserPlatformAccountsV3' test.out

#- 315 PublicListJusticePlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicListJusticePlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'W1THmPGl' \
    > test.out 2>&1
eval_tap $? 315 'PublicListJusticePlatformAccountsV3' test.out

#- 316 PublicLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam publicLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'Jqdw7XE8' \
    --body '{"platformId": "ODKt8H1k", "platformUserId": "75KcS3EF"}' \
    > test.out 2>&1
eval_tap $? 316 'PublicLinkPlatformAccount' test.out

#- 317 PublicForceLinkPlatformWithProgression
./ng net.accelbyte.sdk.cli.Main iam publicForceLinkPlatformWithProgression \
    --namespace "$AB_NAMESPACE" \
    --userId 'IlqjmRTd' \
    --body '{"chosenNamespaces": ["h4ShRlbF", "BIDEiBQ3", "srAZJnih"], "requestId": "Txay0JGS"}' \
    > test.out 2>&1
eval_tap $? 317 'PublicForceLinkPlatformWithProgression' test.out

#- 318 PublicGetPublisherUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetPublisherUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'brWlU4M8' \
    > test.out 2>&1
eval_tap $? 318 'PublicGetPublisherUserV3' test.out

#- 319 PublicValidateUserByUserIDAndPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserByUserIDAndPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '5g7iZfxs' \
    --password 'qaWPmB3L' \
    > test.out 2>&1
eval_tap $? 319 'PublicValidateUserByUserIDAndPasswordV3' test.out

#- 320 PublicGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRolesV3 \
    --after 'MChnCqiD' \
    --before 'eSEfk6Ws' \
    --isWildcard  \
    --limit '30' \
    > test.out 2>&1
eval_tap $? 320 'PublicGetRolesV3' test.out

#- 321 PublicGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRoleV3 \
    --roleId 'ecUYRvgE' \
    > test.out 2>&1
eval_tap $? 321 'PublicGetRoleV3' test.out

#- 322 PublicForgotPasswordWithoutNamespaceV3
./ng net.accelbyte.sdk.cli.Main iam publicForgotPasswordWithoutNamespaceV3 \
    --body '{"clientId": "1DFPg1Qk", "emailAddress": "T6nHKm4L", "languageTag": "1fi87RuD"}' \
    > test.out 2>&1
eval_tap $? 322 'PublicForgotPasswordWithoutNamespaceV3' test.out

#- 323 PublicGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyUserV3 \
    --includeAllPlatforms  \
    > test.out 2>&1
eval_tap $? 323 'PublicGetMyUserV3' test.out

#- 324 PublicSendCodeForwardV3
./ng net.accelbyte.sdk.cli.Main iam publicSendCodeForwardV3 \
    --body '{"context": "9Juk3ZUK", "emailAddress": "wXLtu458", "languageTag": "pRGSx02c", "upgradeToken": "PbVwB8x8"}' \
    > test.out 2>&1
eval_tap $? 324 'PublicSendCodeForwardV3' test.out

#- 325 PublicGetLinkHeadlessAccountToMyAccountConflictV3
./ng net.accelbyte.sdk.cli.Main iam publicGetLinkHeadlessAccountToMyAccountConflictV3 \
    --oneTimeLinkCode 'K5VeyfKg' \
    > test.out 2>&1
eval_tap $? 325 'PublicGetLinkHeadlessAccountToMyAccountConflictV3' test.out

#- 326 LinkHeadlessAccountToMyAccountV3
./ng net.accelbyte.sdk.cli.Main iam linkHeadlessAccountToMyAccountV3 \
    --body '{"chosenNamespaces": ["A5KmXPcE", "3QvWzZNU", "VH1T1VhR"], "oneTimeLinkCode": "bHADqO64"}' \
    > test.out 2>&1
eval_tap $? 326 'LinkHeadlessAccountToMyAccountV3' test.out

#- 327 PublicGetMyRedirectionAfterLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyRedirectionAfterLinkV3 \
    --oneTimeLinkCode 'ZcJF2toz' \
    > test.out 2>&1
eval_tap $? 327 'PublicGetMyRedirectionAfterLinkV3' test.out

#- 328 PublicGetMyProfileAllowUpdateStatusV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyProfileAllowUpdateStatusV3 \
    > test.out 2>&1
eval_tap $? 328 'PublicGetMyProfileAllowUpdateStatusV3' test.out

#- 329 PublicSendVerificationLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationLinkV3 \
    --body '{"languageTag": "TtOSYqS8"}' \
    > test.out 2>&1
eval_tap $? 329 'PublicSendVerificationLinkV3' test.out

#- 330 PublicGetOpenidUserInfoV3
./ng net.accelbyte.sdk.cli.Main iam publicGetOpenidUserInfoV3 \
    > test.out 2>&1
eval_tap $? 330 'PublicGetOpenidUserInfoV3' test.out

#- 331 PublicVerifyUserByLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyUserByLinkV3 \
    --code 'fyKpS21A' \
    > test.out 2>&1
eval_tap $? 331 'PublicVerifyUserByLinkV3' test.out

#- 332 PlatformAuthenticateSAMLV3Handler
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticateSAMLV3Handler \
    --platformId '4IDxAwro' \
    --code 'DhtK3aUl' \
    --error '306tbt6o' \
    --state 'JsazcC9d' \
    > test.out 2>&1
eval_tap $? 332 'PlatformAuthenticateSAMLV3Handler' test.out

#- 333 LoginSSOClient
./ng net.accelbyte.sdk.cli.Main iam loginSSOClient \
    --platformId 'd8WBAboR' \
    --payload 'dlB5SyNJ' \
    > test.out 2>&1
eval_tap $? 333 'LoginSSOClient' test.out

#- 334 LogoutSSOClient
./ng net.accelbyte.sdk.cli.Main iam logoutSSOClient \
    --platformId 'ZU1T2pU4' \
    > test.out 2>&1
eval_tap $? 334 'LogoutSSOClient' test.out

#- 335 RequestTargetTokenResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTargetTokenResponseV3 \
    --additionalData 'Xp0lpafo' \
    --code 'ju45NIYx' \
    > test.out 2>&1
eval_tap $? 335 'RequestTargetTokenResponseV3' test.out

#- 336 UpgradeAndAuthenticateForwardV3
./ng net.accelbyte.sdk.cli.Main iam upgradeAndAuthenticateForwardV3 \
    --clientId '1HvoMJef' \
    --upgradeSuccessToken '4uY9frVI' \
    > test.out 2>&1
eval_tap $? 336 'UpgradeAndAuthenticateForwardV3' test.out

#- 337 AdminListInvitationHistoriesV4
./ng net.accelbyte.sdk.cli.Main iam adminListInvitationHistoriesV4 \
    --limit '70' \
    --namespace "$AB_NAMESPACE" \
    --offset '79' \
    > test.out 2>&1
eval_tap $? 337 'AdminListInvitationHistoriesV4' test.out

#- 338 AdminGetDevicesByUserV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDevicesByUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'dwQuITmt' \
    > test.out 2>&1
eval_tap $? 338 'AdminGetDevicesByUserV4' test.out

#- 339 AdminGetBannedDevicesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedDevicesV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceType 'DJtny9zF' \
    --endDate 'bprFk0pJ' \
    --limit '61' \
    --offset '38' \
    --startDate 'ERfOa2Pr' \
    > test.out 2>&1
eval_tap $? 339 'AdminGetBannedDevicesV4' test.out

#- 340 AdminGetUserDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeviceBansV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'fbXlO8Iy' \
    > test.out 2>&1
eval_tap $? 340 'AdminGetUserDeviceBansV4' test.out

#- 341 AdminBanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminBanDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"comment": "hpzZ9o2e", "deviceId": "mGL6W0qq", "deviceType": "z6C3lzVF", "enabled": false, "endDate": "4WnVOTpE", "ext": {"64EqxUYe": {}, "GCjMIV7j": {}, "9EbkAuyE": {}}, "reason": "msmNzEVJ"}' \
    > test.out 2>&1
eval_tap $? 341 'AdminBanDeviceV4' test.out

#- 342 AdminGetDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBanV4 \
    --banId 'B0GfO9AN' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 342 'AdminGetDeviceBanV4' test.out

#- 343 AdminUpdateDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateDeviceBanV4 \
    --banId '5NI6BHAL' \
    --namespace "$AB_NAMESPACE" \
    --body '{"enabled": true}' \
    > test.out 2>&1
eval_tap $? 343 'AdminUpdateDeviceBanV4' test.out

#- 344 AdminGenerateReportV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateReportV4 \
    --namespace "$AB_NAMESPACE" \
    --endDate 'VPRUPyRU' \
    --startDate 'thRDetMm' \
    --deviceType 'W3bzBaYG' \
    > test.out 2>&1
eval_tap $? 344 'AdminGenerateReportV4' test.out

#- 345 AdminGetDeviceTypesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceTypesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 345 'AdminGetDeviceTypesV4' test.out

#- 346 AdminGetDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBansV4 \
    --deviceId 'VX4l6j2L' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 346 'AdminGetDeviceBansV4' test.out

#- 347 AdminDecryptDeviceV4
eval_tap 0 347 'AdminDecryptDeviceV4 # SKIP deprecated' test.out

#- 348 AdminUnbanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminUnbanDeviceV4 \
    --deviceId 'Y1osCbLV' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 348 'AdminUnbanDeviceV4' test.out

#- 349 AdminGetUsersByDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUsersByDeviceV4 \
    --deviceId 'XwrJiZuv' \
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
    --limit '23' \
    --offset '96' \
    > test.out 2>&1
eval_tap $? 351 'AdminGetNamespaceUserInvitationHistoryV4' test.out

#- 352 AdminCreateTestUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateTestUsersV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 56, "userInfo": {"country": "3FpRWD5Y"}}' \
    > test.out 2>&1
eval_tap $? 352 'AdminCreateTestUsersV4' test.out

#- 353 AdminCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "WRzvdtos", "policyId": "ju3Ty5WF", "policyVersionId": "LqhNtAQL"}, {"isAccepted": false, "localizedPolicyVersionId": "9A8BwoUl", "policyId": "c5SpelDu", "policyVersionId": "X5OdQrWK"}, {"isAccepted": true, "localizedPolicyVersionId": "geLkb7md", "policyId": "OkxVCDwk", "policyVersionId": "ljMLTa21"}], "authType": "EMAILPASSWD", "code": "JayMj3Vj", "country": "TF8waIfA", "dateOfBirth": "3mWpWhHK", "displayName": "iSd4Fx4M", "emailAddress": "H4KBhb3L", "password": "RECGJYvX", "passwordMD5Sum": "aA6lveVm", "reachMinimumAge": true, "uniqueDisplayName": "Kac7H0Ru", "username": "CzrFu7DM"}' \
    > test.out 2>&1
eval_tap $? 353 'AdminCreateUserV4' test.out

#- 354 AdminBulkUpdateUserAccountTypeV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateUserAccountTypeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"testAccount": true, "userIds": ["QnrgqZUR", "526Rbc3v", "U9gSSZVq"]}' \
    > test.out 2>&1
eval_tap $? 354 'AdminBulkUpdateUserAccountTypeV4' test.out

#- 355 AdminBulkCheckValidUserIDV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkCheckValidUserIDV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["GKzGl48H", "r8m1LelV", "0jWT8Ts7"]}' \
    > test.out 2>&1
eval_tap $? 355 'AdminBulkCheckValidUserIDV4' test.out

#- 356 AdminUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'pITwv1UD' \
    --body '{"avatarUrl": "QvmWhVP5", "country": "MmDcT0YF", "dateOfBirth": "T9gqc6RI", "displayName": "9Z5tznyo", "languageTag": "UiKM31ER", "skipLoginQueue": false, "tags": ["u2n6WPGu", "ZxudExRS", "u0GpXmy6"], "uniqueDisplayName": "B5rLmHEY", "userName": "xnMQyOWV"}' \
    > test.out 2>&1
eval_tap $? 356 'AdminUpdateUserV4' test.out

#- 357 AdminUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'KGQxPePh' \
    --body '{"code": "0r5FG3zR", "emailAddress": "DAmxI7si"}' \
    > test.out 2>&1
eval_tap $? 357 'AdminUpdateUserEmailAddressV4' test.out

#- 358 AdminDisableUserMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableUserMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'IsHAXNd0' \
    --body '{"factor": "JMWHwvce", "mfaToken": "tTGVkNVM"}' \
    > test.out 2>&1
eval_tap $? 358 'AdminDisableUserMFAV4' test.out

#- 359 AdminGetUserMFAStatusV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUserMFAStatusV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'fPHLHhLF' \
    > test.out 2>&1
eval_tap $? 359 'AdminGetUserMFAStatusV4' test.out

#- 360 AdminListUserRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminListUserRolesV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'wwCPL4KG' \
    > test.out 2>&1
eval_tap $? 360 'AdminListUserRolesV4' test.out

#- 361 AdminUpdateUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'IRbo4MrF' \
    --body '{"assignedNamespaces": ["qrs34Ddr", "QCwlt7B5", "2A7NoGad"], "roleId": "NTKIEWTA"}' \
    > test.out 2>&1
eval_tap $? 361 'AdminUpdateUserRoleV4' test.out

#- 362 AdminAddUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'uhCRdlnJ' \
    --body '{"assignedNamespaces": ["rzsjOwJy", "djDeBddL", "IZB5do0w"], "roleId": "RCDF4yzW"}' \
    > test.out 2>&1
eval_tap $? 362 'AdminAddUserRoleV4' test.out

#- 363 AdminRemoveUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRemoveUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'BUPbpNTg' \
    --body '{"assignedNamespaces": ["51AficI5", "8ZSssl0T", "zI9Kk152"], "roleId": "sp3dSvA4"}' \
    > test.out 2>&1
eval_tap $? 363 'AdminRemoveUserRoleV4' test.out

#- 364 AdminGetRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV4 \
    --adminRole  \
    --isWildcard  \
    --limit '20' \
    --offset '96' \
    > test.out 2>&1
eval_tap $? 364 'AdminGetRolesV4' test.out

#- 365 AdminCreateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV4 \
    --body '{"adminRole": true, "deletable": false, "isWildcard": true, "roleName": "6rHjaacW"}' \
    > test.out 2>&1
eval_tap $? 365 'AdminCreateRoleV4' test.out

#- 366 AdminGetRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV4 \
    --roleId 'WowjIXlR' \
    > test.out 2>&1
eval_tap $? 366 'AdminGetRoleV4' test.out

#- 367 AdminDeleteRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV4 \
    --roleId 'eGXXVKwW' \
    > test.out 2>&1
eval_tap $? 367 'AdminDeleteRoleV4' test.out

#- 368 AdminUpdateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV4 \
    --roleId 'uMk3fvks' \
    --body '{"adminRole": true, "deletable": true, "isWildcard": true, "roleName": "ygOR8Ra0"}' \
    > test.out 2>&1
eval_tap $? 368 'AdminUpdateRoleV4' test.out

#- 369 AdminUpdateRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV4 \
    --roleId 'ElX4sMdi' \
    --body '{"permissions": [{"action": 75, "resource": "L72UhjTV", "schedAction": 4, "schedCron": "8meovved", "schedRange": ["cmKQEjRg", "Rm0JM7rL", "l8aFlJuo"]}, {"action": 38, "resource": "8olofHMp", "schedAction": 91, "schedCron": "CTMi9nUl", "schedRange": ["OZYfmjot", "bbq6AEN7", "nUHKmQdg"]}, {"action": 8, "resource": "xQmP41tH", "schedAction": 24, "schedCron": "DqnZ3jn7", "schedRange": ["9t7TcI8w", "QA0OXZsx", "7BsN2hCX"]}]}' \
    > test.out 2>&1
eval_tap $? 369 'AdminUpdateRolePermissionsV4' test.out

#- 370 AdminAddRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV4 \
    --roleId 'gmV0JOP2' \
    --body '{"permissions": [{"action": 91, "resource": "GeVlHuDV", "schedAction": 50, "schedCron": "zE8ofwjt", "schedRange": ["xk8eMKyJ", "nVVTlYL0", "7IcDVJeR"]}, {"action": 23, "resource": "VWM9CJf1", "schedAction": 51, "schedCron": "O3rX5F3Z", "schedRange": ["leWwR4EH", "n9JfrcBe", "BVzW4PhC"]}, {"action": 82, "resource": "wLI3OhPS", "schedAction": 48, "schedCron": "nLCjcJRh", "schedRange": ["06f1kuY9", "4HXPiFn2", "VkGIpNrw"]}]}' \
    > test.out 2>&1
eval_tap $? 370 'AdminAddRolePermissionsV4' test.out

#- 371 AdminDeleteRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV4 \
    --roleId '3KzAxMsg' \
    --body '["B4tVwndU", "yxVMNl2c", "2v9FJrvY"]' \
    > test.out 2>&1
eval_tap $? 371 'AdminDeleteRolePermissionsV4' test.out

#- 372 AdminListAssignedUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminListAssignedUsersV4 \
    --roleId 'mBx53aEM' \
    --after 'HlA7HGZw' \
    --before '45pyZL1A' \
    --limit '29' \
    > test.out 2>&1
eval_tap $? 372 'AdminListAssignedUsersV4' test.out

#- 373 AdminAssignUserToRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAssignUserToRoleV4 \
    --roleId 'jXgT29yi' \
    --body '{"assignedNamespaces": ["ewoNgFcE", "cT8shZ7N", "R37RcCgg"], "namespace": "F6arytJx", "userId": "3RPkgCn0"}' \
    > test.out 2>&1
eval_tap $? 373 'AdminAssignUserToRoleV4' test.out

#- 374 AdminRevokeUserFromRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRevokeUserFromRoleV4 \
    --roleId 'jE1j9Iuo' \
    --body '{"namespace": "nxCAK3nR", "userId": "RaPX3DnS"}' \
    > test.out 2>&1
eval_tap $? 374 'AdminRevokeUserFromRoleV4' test.out

#- 375 AdminInviteUserNewV4
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserNewV4 \
    --body '{"assignedNamespaces": ["qC2lDvbq", "tgf11NcY", "KE1oGPqA"], "emailAddresses": ["ZaVmnJzN", "AZSGFwTn", "moiinPK7"], "isAdmin": false, "isNewStudio": false, "languageTag": "78cGeiI7", "namespace": "IV4PjNX3", "roleId": "Gefc9s9S"}' \
    > test.out 2>&1
eval_tap $? 375 'AdminInviteUserNewV4' test.out

#- 376 AdminUpdateMyUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateMyUserV4 \
    --body '{"avatarUrl": "Ri6o7MXe", "country": "9ke31SDy", "dateOfBirth": "HjcNlVqp", "displayName": "Zm7tlukG", "languageTag": "T1V9SyCS", "skipLoginQueue": true, "tags": ["OI6SWcR2", "2uYkKOAG", "maiqsumz"], "uniqueDisplayName": "MTlB0iSg", "userName": "j0aJew3f"}' \
    > test.out 2>&1
eval_tap $? 376 'AdminUpdateMyUserV4' test.out

#- 377 AdminDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyAuthenticatorV4 \
    --body '{"factor": "2oqnCLF0", "mfaToken": "kYEnJ99z"}' \
    > test.out 2>&1
eval_tap $? 377 'AdminDisableMyAuthenticatorV4' test.out

#- 378 AdminEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyAuthenticatorV4 \
    --code 'uBuwIc9A' \
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
    --body '{"factor": "Xu3jU7VH", "mfaToken": "0CmyqXeO"}' \
    > test.out 2>&1
eval_tap $? 382 'AdminDisableMyBackupCodesV4' test.out

#- 383 AdminDownloadMyBackupCodesV4
eval_tap 0 383 'AdminDownloadMyBackupCodesV4 # SKIP deprecated' test.out

#- 384 AdminEnableMyBackupCodesV4
eval_tap 0 384 'AdminEnableMyBackupCodesV4 # SKIP deprecated' test.out

#- 385 AdminGetBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBackupCodesV4 \
    --languageTag '6oat16ul' \
    > test.out 2>&1
eval_tap $? 385 'AdminGetBackupCodesV4' test.out

#- 386 AdminGenerateBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateBackupCodesV4 \
    --languageTag '3WfUElRd' \
    > test.out 2>&1
eval_tap $? 386 'AdminGenerateBackupCodesV4' test.out

#- 387 AdminEnableBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableBackupCodesV4 \
    --languageTag '8IpnPllA' \
    > test.out 2>&1
eval_tap $? 387 'AdminEnableBackupCodesV4' test.out

#- 388 AdminChallengeMyMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminChallengeMyMFAV4 \
    --code 'hUNWxhZG' \
    --factor 'IdpMZjDv' \
    > test.out 2>&1
eval_tap $? 388 'AdminChallengeMyMFAV4' test.out

#- 389 AdminSendMyMFAEmailCodeV4
./ng net.accelbyte.sdk.cli.Main iam adminSendMyMFAEmailCodeV4 \
    --action 'VDXwdc8Y' \
    --languageTag 'lvPRNeF1' \
    > test.out 2>&1
eval_tap $? 389 'AdminSendMyMFAEmailCodeV4' test.out

#- 390 AdminDisableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyEmailV4 \
    --body '{"factor": "lKAcvKmq", "mfaToken": "u8RrMcnL"}' \
    > test.out 2>&1
eval_tap $? 390 'AdminDisableMyEmailV4' test.out

#- 391 AdminEnableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyEmailV4 \
    --code 'kq7M6Ii7' \
    > test.out 2>&1
eval_tap $? 391 'AdminEnableMyEmailV4' test.out

#- 392 AdminGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyEnabledFactorsV4 \
    > test.out 2>&1
eval_tap $? 392 'AdminGetMyEnabledFactorsV4' test.out

#- 393 AdminMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam adminMakeFactorMyDefaultV4 \
    --factor '1InKt5dG' \
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
    --clientId '8syDvw3Y' \
    --linkingToken 'I3MtJhpX' \
    --password '8Yg42Le1' \
    --username 'gNR2DUNv' \
    > test.out 2>&1
eval_tap $? 397 'AuthenticationWithPlatformLinkV4' test.out

#- 398 GenerateTokenByNewHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV4 \
    --additionalData '2K07H2KP' \
    --extendExp  \
    --linkingToken 'dzQRwahY' \
    > test.out 2>&1
eval_tap $? 398 'GenerateTokenByNewHeadlessAccountV4' test.out

#- 399 Verify2faCodeV4
./ng net.accelbyte.sdk.cli.Main iam verify2faCodeV4 \
    --code 'zosGMexL' \
    --factor '5DLNTzRt' \
    --mfaToken 'A2FhVQGC' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 399 'Verify2faCodeV4' test.out

#- 400 PlatformTokenGrantV4
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV4 \
    --platformId 'zy58tJzA' \
    --codeChallenge 'DDN6PlVv' \
    --codeChallengeMethod 'S256' \
    --additionalData 'eNupMclV' \
    --clientId 'DrxdzA7k' \
    --createHeadless  \
    --deviceId 'UAaEqsjN' \
    --macAddress 'Fr6QSTUH' \
    --platformToken '65mc6K8a' \
    --serviceLabel '0.505652095148923' \
    --skipSetCookie  \
    > test.out 2>&1
eval_tap $? 400 'PlatformTokenGrantV4' test.out

#- 401 SimultaneousLoginV4
./ng net.accelbyte.sdk.cli.Main iam simultaneousLoginV4 \
    --codeChallenge 'PA96VdH6' \
    --codeChallengeMethod 'plain' \
    --simultaneousPlatform '1QK6j7kM' \
    --simultaneousTicket 'xJLVVqab' \
    --nativePlatform 'epicgames' \
    --nativePlatformTicket 'PzXKADv3' \
    > test.out 2>&1
eval_tap $? 401 'SimultaneousLoginV4' test.out

#- 402 TokenGrantV4
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV4 \
    --codeChallenge 'qgLUleuM' \
    --codeChallengeMethod 'S256' \
    --additionalData 'vU0McY8w' \
    --clientId 'f3VEBvih' \
    --clientSecret 'FR8g07aG' \
    --code '9YKIvN4Z' \
    --codeVerifier 'TnPRuCn7' \
    --extendNamespace 'lzppubFo' \
    --extendExp  \
    --loginQueueTicket 'dZSWHcv3' \
    --password 'okha7fGf' \
    --redirectUri 'c2RIk8YB' \
    --refreshToken 'OhDf1A6A' \
    --scope 'fqim8JEY' \
    --username 'PoDjJfwI' \
    --grantType 'client_credentials' \
    > test.out 2>&1
eval_tap $? 402 'TokenGrantV4' test.out

#- 403 RequestTargetTokenResponseV4
./ng net.accelbyte.sdk.cli.Main iam requestTargetTokenResponseV4 \
    --additionalData 'go0yx24s' \
    --code 'jzSmkRXc' \
    > test.out 2>&1
eval_tap $? 403 'RequestTargetTokenResponseV4' test.out

#- 404 PublicListUserIDByPlatformUserIDsV4
./ng net.accelbyte.sdk.cli.Main iam publicListUserIDByPlatformUserIDsV4 \
    --namespace "$AB_NAMESPACE" \
    --platformId '6J5vmngn' \
    --rawPUID  \
    --body '{"pidType": "xt8hDFsg", "platformUserIds": ["bp7KQ6Wx", "9zls7i1T", "dT3P9FPJ"]}' \
    > test.out 2>&1
eval_tap $? 404 'PublicListUserIDByPlatformUserIDsV4' test.out

#- 405 PublicGetUserByPlatformUserIDV4
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByPlatformUserIDV4 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'RvrHv68S' \
    --platformUserId 'pH41zgdC' \
    > test.out 2>&1
eval_tap $? 405 'PublicGetUserByPlatformUserIDV4' test.out

#- 406 PublicCreateTestUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateTestUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "WBMeYjoV", "policyId": "xmjK87iu", "policyVersionId": "GN2tfZck"}, {"isAccepted": false, "localizedPolicyVersionId": "xf592Ba4", "policyId": "C7JKyL1B", "policyVersionId": "pOVTxz5O"}, {"isAccepted": true, "localizedPolicyVersionId": "NVekJ3dD", "policyId": "Nbcw4P6Y", "policyVersionId": "Y76aw7Ke"}], "authType": "EMAILPASSWD", "country": "wp6zXCFa", "dateOfBirth": "wAsMjPUf", "displayName": "uDI6NDWU", "emailAddress": "B3ppUeK1", "password": "tdCtmV3D", "passwordMD5Sum": "gHUREqGi", "uniqueDisplayName": "l7bXmy01", "username": "DxII6Ysp", "verified": false}' \
    > test.out 2>&1
eval_tap $? 406 'PublicCreateTestUserV4' test.out

#- 407 PublicCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "wUHsIXeU", "policyId": "ur6U5l0C", "policyVersionId": "EPklkVlW"}, {"isAccepted": true, "localizedPolicyVersionId": "T2SWKzd4", "policyId": "eKIcOzIL", "policyVersionId": "3OGOSF8G"}, {"isAccepted": true, "localizedPolicyVersionId": "SXm8I3j1", "policyId": "AywMHKHZ", "policyVersionId": "LJRL3nef"}], "authType": "EMAILPASSWD", "code": "1NUrPsnt", "country": "fBoeTOG2", "dateOfBirth": "C0ZFXsDC", "displayName": "yG2ufL6U", "emailAddress": "QDYmYixg", "password": "eTYVq7D9", "passwordMD5Sum": "qvXEDBGA", "reachMinimumAge": true, "uniqueDisplayName": "NIs9F2Ss", "username": "a0uwBB2e"}' \
    > test.out 2>&1
eval_tap $? 407 'PublicCreateUserV4' test.out

#- 408 CreateUserFromInvitationV4
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV4 \
    --invitationId 'y4GzsfyZ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "lWfdYep9", "policyId": "zTkNcTEf", "policyVersionId": "LwvgM6Xj"}, {"isAccepted": false, "localizedPolicyVersionId": "b0wmxy3t", "policyId": "Aa0kmoEm", "policyVersionId": "qR3KAoF8"}, {"isAccepted": false, "localizedPolicyVersionId": "iQqjE6Lp", "policyId": "HUSl4nRc", "policyVersionId": "9375wNBg"}], "authType": "EMAILPASSWD", "code": "0sbVU8uS", "country": "hWctSr18", "dateOfBirth": "HaZACVzT", "displayName": "GJTjmipb", "emailAddress": "EaxYLpFu", "password": "PXRW9FbW", "passwordMD5Sum": "125dYu45", "reachMinimumAge": false, "uniqueDisplayName": "L7XmG52s", "username": "WXPrKUZe"}' \
    > test.out 2>&1
eval_tap $? 408 'CreateUserFromInvitationV4' test.out

#- 409 PublicUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "dtYsQhUm", "country": "fqUcKOCx", "dateOfBirth": "GqZXBnAf", "displayName": "ZUZHi2p7", "languageTag": "0eMbILrw", "uniqueDisplayName": "b8Ku7BOe", "userName": "YZTmgw9e"}' \
    > test.out 2>&1
eval_tap $? 409 'PublicUpdateUserV4' test.out

#- 410 PublicUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "qEEY55DN", "emailAddress": "IwUHSroH"}' \
    > test.out 2>&1
eval_tap $? 410 'PublicUpdateUserEmailAddressV4' test.out

#- 411 PublicUpgradeHeadlessAccountWithVerificationCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountWithVerificationCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "DpOHsRV1", "country": "GIXKPQFW", "dateOfBirth": "r4fQe2Ju", "displayName": "Hxc87t7a", "emailAddress": "8Bs1madE", "password": "zia1OJfq", "reachMinimumAge": false, "uniqueDisplayName": "kuaxnYcR", "username": "xKa1rZaQ", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 411 'PublicUpgradeHeadlessAccountWithVerificationCodeV4' test.out

#- 412 PublicUpgradeHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"dateOfBirth": "bDd5gDmS", "displayName": "GsHNL25y", "emailAddress": "yDeY5zuK", "password": "iKHTzoLg", "uniqueDisplayName": "wPdMYPpE", "username": "DkWESFq1"}' \
    > test.out 2>&1
eval_tap $? 412 'PublicUpgradeHeadlessAccountV4' test.out

#- 413 PublicDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"factor": "0oErZ4rp", "mfaToken": "WMgRsY0c"}' \
    > test.out 2>&1
eval_tap $? 413 'PublicDisableMyAuthenticatorV4' test.out

#- 414 PublicEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'G3Pk8Pv0' \
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
    --body '{"factor": "A1yfjP0y", "mfaToken": "9mwvenbz"}' \
    > test.out 2>&1
eval_tap $? 418 'PublicDisableMyBackupCodesV4' test.out

#- 419 PublicDownloadMyBackupCodesV4
eval_tap 0 419 'PublicDownloadMyBackupCodesV4 # SKIP deprecated' test.out

#- 420 PublicEnableMyBackupCodesV4
eval_tap 0 420 'PublicEnableMyBackupCodesV4 # SKIP deprecated' test.out

#- 421 PublicGetBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGetBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --languageTag 'tzI0smt1' \
    > test.out 2>&1
eval_tap $? 421 'PublicGetBackupCodesV4' test.out

#- 422 PublicGenerateBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --languageTag 'JZyVlwpw' \
    > test.out 2>&1
eval_tap $? 422 'PublicGenerateBackupCodesV4' test.out

#- 423 PublicEnableBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --languageTag '1obLEoUD' \
    > test.out 2>&1
eval_tap $? 423 'PublicEnableBackupCodesV4' test.out

#- 424 PublicChallengeMyMFAV4
./ng net.accelbyte.sdk.cli.Main iam publicChallengeMyMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'xGl17spa' \
    --factor '6D6vkXWd' \
    > test.out 2>&1
eval_tap $? 424 'PublicChallengeMyMFAV4' test.out

#- 425 PublicRemoveTrustedDeviceV4
./ng net.accelbyte.sdk.cli.Main iam publicRemoveTrustedDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceToken 'ZDfCcE2i' \
    > test.out 2>&1
eval_tap $? 425 'PublicRemoveTrustedDeviceV4' test.out

#- 426 PublicSendMyMFAEmailCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicSendMyMFAEmailCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --action 'sRwQyYAo' \
    --languageTag 'iTbfmeWJ' \
    > test.out 2>&1
eval_tap $? 426 'PublicSendMyMFAEmailCodeV4' test.out

#- 427 PublicDisableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyEmailV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"factor": "qYgDUL42", "mfaToken": "sVs66j26"}' \
    > test.out 2>&1
eval_tap $? 427 'PublicDisableMyEmailV4' test.out

#- 428 PublicEnableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyEmailV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'CbIXmsfy' \
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
    --factor 'xv9oadFR' \
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
    --userId 'Bb44DJBM' \
    > test.out 2>&1
eval_tap $? 433 'PublicGetUserPublicInfoByUserIdV4' test.out

#- 434 PublicInviteUserV4
./ng net.accelbyte.sdk.cli.Main iam publicInviteUserV4 \
    --body '{"additionalData": "YSErZgMU", "emailAddress": "bIV3igBx", "languageTag": "VFQl52HE", "namespace": "wwW1i1bB", "namespaceDisplayName": "mKZOaOBM"}' \
    > test.out 2>&1
eval_tap $? 434 'PublicInviteUserV4' test.out

#- 435 PublicUpgradeHeadlessWithCodeV4Forward
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessWithCodeV4Forward \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "4ldjRRjQ", "policyId": "l2wyhgNt", "policyVersionId": "FEOsxjWC"}, {"isAccepted": true, "localizedPolicyVersionId": "v5fCWBqV", "policyId": "p9vJTY3e", "policyVersionId": "tADHYAYh"}, {"isAccepted": true, "localizedPolicyVersionId": "HBSl98DO", "policyId": "dLJ8Dl1d", "policyVersionId": "iiYpMssz"}], "code": "3Tm0324w", "country": "ifnzSXQ9", "dateOfBirth": "h31YfTPY", "displayName": "36RVOm3f", "emailAddress": "yggMNUXY", "password": "1gi18OWw", "reachMinimumAge": false, "uniqueDisplayName": "gnj666Gg", "username": "8vlvRtUR", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 435 'PublicUpgradeHeadlessWithCodeV4Forward' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
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
    --body '{"modules": [{"docLink": "atOyL2Ub", "groups": [{"group": "FE2MbnsJ", "groupId": "kDIORAFH", "permissions": [{"allowedActions": [42, 39, 34], "resource": "YQKMarwQ"}, {"allowedActions": [58, 63, 98], "resource": "0Btm883t"}, {"allowedActions": [66, 37, 24], "resource": "MeqvkMlt"}]}, {"group": "UTTjFLiB", "groupId": "dFP3F6VI", "permissions": [{"allowedActions": [76, 22, 92], "resource": "NAaq4RFy"}, {"allowedActions": [91, 60, 99], "resource": "8sSXmSvz"}, {"allowedActions": [16, 72, 88], "resource": "oUADgm0d"}]}, {"group": "hGRfx1cm", "groupId": "ebwfII9r", "permissions": [{"allowedActions": [6, 20, 44], "resource": "lb5GSUnN"}, {"allowedActions": [6, 32, 93], "resource": "vWgJo8Bj"}, {"allowedActions": [97, 50, 7], "resource": "Gv7nyAGw"}]}], "module": "pSzw0kGz", "moduleId": "bEQYBltf"}, {"docLink": "8D5mQ6HY", "groups": [{"group": "ijFj31zR", "groupId": "lRj0RhxR", "permissions": [{"allowedActions": [84, 15, 48], "resource": "HI7C5QYk"}, {"allowedActions": [62, 60, 50], "resource": "bqfQlAga"}, {"allowedActions": [50, 89, 34], "resource": "A7y4egGZ"}]}, {"group": "ykljiZrI", "groupId": "p7jabc5Y", "permissions": [{"allowedActions": [23, 60, 60], "resource": "YDRnLabm"}, {"allowedActions": [6, 15, 81], "resource": "EPKMDwr3"}, {"allowedActions": [4, 65, 16], "resource": "rQZEz4EA"}]}, {"group": "92dg0OZj", "groupId": "8bUVZVij", "permissions": [{"allowedActions": [24, 36, 9], "resource": "tYRIMbrD"}, {"allowedActions": [87, 68, 33], "resource": "QmmgvMmq"}, {"allowedActions": [46, 97, 80], "resource": "0X5ZeptP"}]}], "module": "Hs2UwsY4", "moduleId": "WDYH0rPE"}, {"docLink": "GxBQLY1m", "groups": [{"group": "k87yJhkQ", "groupId": "fpOgnpnO", "permissions": [{"allowedActions": [29, 59, 1], "resource": "cGB4pgjv"}, {"allowedActions": [86, 1, 94], "resource": "3Sy0mLCX"}, {"allowedActions": [51, 52, 46], "resource": "w6xMPwsn"}]}, {"group": "hzchKZ7A", "groupId": "RPUKLusQ", "permissions": [{"allowedActions": [29, 94, 86], "resource": "XDutHNpc"}, {"allowedActions": [49, 88, 74], "resource": "ocwLspV8"}, {"allowedActions": [6, 37, 91], "resource": "IQYpPuUo"}]}, {"group": "fvNy8YDk", "groupId": "m5CjoArL", "permissions": [{"allowedActions": [92, 87, 24], "resource": "ZSaF4WHj"}, {"allowedActions": [75, 92, 87], "resource": "QsPycE5d"}, {"allowedActions": [67, 2, 31], "resource": "btILMevn"}]}], "module": "aAyM2kVv", "moduleId": "Nfiu4bQ5"}]}' \
    > test.out 2>&1
eval_tap $? 109 'AdminUpdateAvailablePermissionsByModule' test.out

#- 110 AdminDeleteConfigPermissionsByGroup
./ng net.accelbyte.sdk.cli.Main iam adminDeleteConfigPermissionsByGroup \
    --forceDelete  \
    --body '{"groupId": "rj7KXqx5", "moduleId": "x18gVwY3"}' \
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
    --body '[{"field": "qXyPSYYn", "validation": {"allowAllSpecialCharacters": false, "allowDigit": true, "allowLetter": true, "allowSpace": false, "allowUnicode": false, "avatarConfig": {"allowedPrefixes": ["tbgJJhH9", "uZI5KdT8", "e4sVvC1t"], "preferRegex": false, "regex": "eLx2tjGl"}, "blockedWord": ["Y4BCy4Yb", "QKt94S1V", "QAgtvVGl"], "description": [{"language": "eaueGcUE", "message": ["eAc0qjdf", "S5ACcDCC", "Eond97Wy"]}, {"language": "5RvSmd82", "message": ["lAPd6lWC", "oRmgkVRm", "ZXnGVNY6"]}, {"language": "KxG2oomY", "message": ["XkJqo4Cs", "XW4BGI0j", "bJj6ytMq"]}], "isCustomRegex": false, "letterCase": "bdf3Ld1E", "maxLength": 6, "maxRepeatingAlphaNum": 43, "maxRepeatingSpecialCharacter": 70, "minCharType": 34, "minLength": 95, "profanityFilter": "bUcLeRVS", "regex": "9ZuwqyVY", "specialCharacterLocation": "b7hQhFRR", "specialCharacters": ["82sdYihS", "OK0h0uWt", "xifeEKD2"]}}, {"field": "Xn3DLLZ3", "validation": {"allowAllSpecialCharacters": true, "allowDigit": true, "allowLetter": true, "allowSpace": false, "allowUnicode": false, "avatarConfig": {"allowedPrefixes": ["qhgtXKrM", "zqD8XYKE", "oHF9jPNB"], "preferRegex": false, "regex": "TjvHD69m"}, "blockedWord": ["CsyBGwsH", "oKQ0qBT3", "2OuJ6rhv"], "description": [{"language": "RU5x29ec", "message": ["1OLAsP0s", "SblVoqvL", "fDyjLLZF"]}, {"language": "6Bd5Vg4o", "message": ["FOtqx7rM", "Zy0WFlvu", "SL6T52MJ"]}, {"language": "o0VHHNzc", "message": ["ACYM72WA", "Wb6gcCZi", "O0goWUza"]}], "isCustomRegex": true, "letterCase": "wERjbmtB", "maxLength": 69, "maxRepeatingAlphaNum": 23, "maxRepeatingSpecialCharacter": 39, "minCharType": 67, "minLength": 13, "profanityFilter": "GWt0YWIn", "regex": "bMO5sNff", "specialCharacterLocation": "CyJ5inrP", "specialCharacters": ["p0yIFn04", "hbnmfYrd", "b6bzk37Z"]}}, {"field": "lL0Gll4E", "validation": {"allowAllSpecialCharacters": false, "allowDigit": false, "allowLetter": true, "allowSpace": true, "allowUnicode": false, "avatarConfig": {"allowedPrefixes": ["sPWUGvFZ", "zbKe43Sc", "o1ZESWYF"], "preferRegex": false, "regex": "xUQ258c8"}, "blockedWord": ["AqoDnELl", "v2xM6axU", "OiPJIPeG"], "description": [{"language": "WoRejjD5", "message": ["nJz61s5U", "kkX8EPyH", "gD7FYp6u"]}, {"language": "y1q0pWuG", "message": ["JZdvXzQ7", "sf1jhakh", "cAJV2IU8"]}, {"language": "gjz1K513", "message": ["AE2cKfoY", "XqPUJWho", "WY6EDaKn"]}], "isCustomRegex": true, "letterCase": "Lo6Libmp", "maxLength": 22, "maxRepeatingAlphaNum": 64, "maxRepeatingSpecialCharacter": 2, "minCharType": 31, "minLength": 40, "profanityFilter": "GVxSYdqb", "regex": "af1B9Y1b", "specialCharacterLocation": "nqKEekCi", "specialCharacters": ["QC74zShb", "NNOd6JMe", "pxjYy5n1"]}}]' \
    > test.out 2>&1
eval_tap $? 113 'AdminUpdateInputValidations' test.out

#- 114 AdminResetInputValidations
./ng net.accelbyte.sdk.cli.Main iam adminResetInputValidations \
    --field 'WQ4hXYJb' \
    > test.out 2>&1
eval_tap $? 114 'AdminResetInputValidations' test.out

#- 115 ListAdminsV3
./ng net.accelbyte.sdk.cli.Main iam listAdminsV3 \
    --namespace "$AB_NAMESPACE" \
    --after '3nG51U5X' \
    --before 'qIr3Lov1' \
    --endDate 'BO0MjeiD' \
    --limit '78' \
    --query 'tBrl3OdH' \
    --roleId 'RkI2TUZW' \
    --startDate '2MqRxRDa' \
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
    --body '{"ageRestriction": 76, "enable": true}' \
    > test.out 2>&1
eval_tap $? 117 'AdminUpdateAgeRestrictionConfigV3' test.out

#- 118 AdminGetListCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminGetListCountryAgeRestrictionV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 118 'AdminGetListCountryAgeRestrictionV3' test.out

#- 119 AdminUpdateCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateCountryAgeRestrictionV3 \
    --countryCode 'mykyThm8' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ageRestriction": 40}' \
    > test.out 2>&1
eval_tap $? 119 'AdminUpdateCountryAgeRestrictionV3' test.out

#- 120 AdminGetBannedUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType 'wkium8HF' \
    --limit '76' \
    --offset '74' \
    > test.out 2>&1
eval_tap $? 120 'AdminGetBannedUsersV3' test.out

#- 121 AdminBanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"ban": "xAbYabf4", "comment": "w2JnoXeS", "endDate": "FGzmu48G", "reason": "Gg6Q4hNq", "skipNotif": true, "userIds": ["30fv0SGB", "HHXyGcrP", "CbxrEQG4"]}' \
    > test.out 2>&1
eval_tap $? 121 'AdminBanUserBulkV3' test.out

#- 122 AdminUnbanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminUnbanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"bans": [{"banId": "k0g3HzDB", "userId": "MUQmlUVu"}, {"banId": "aRRk3u4W", "userId": "m2IoN4h8"}, {"banId": "MMCxcRH5", "userId": "BjOI2h4o"}]}' \
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
    --clientId 'Cr7bZagl' \
    --clientName 'T060RkgG' \
    --clientType 'PsxLmLlm' \
    --limit '79' \
    --offset '68' \
    --skipLoginQueue  \
    > test.out 2>&1
eval_tap $? 124 'AdminGetClientsByNamespaceV3' test.out

#- 125 AdminBulkUpdateClientsV3
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateClientsV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientIds": ["w4plIU6m", "PLnV7v2N", "Najb7Q3h"], "clientUpdateRequest": {"audiences": ["PgcqOWl1", "9mcbv6pz", "bu6jbYbB"], "baseUri": "G3msmY3k", "clientName": "tEukZ4NN", "clientPermissions": [{"action": 7, "resource": "W3OkOxa0", "schedAction": 3, "schedCron": "mGLpuulK", "schedRange": ["sXDAYQIM", "fZaN9ska", "6oIQYhvl"]}, {"action": 44, "resource": "fcvumQPv", "schedAction": 76, "schedCron": "51iFZvyo", "schedRange": ["kqTCEgeR", "LkJhEPpD", "nX4Ud8jA"]}, {"action": 99, "resource": "OCUMsjet", "schedAction": 98, "schedCron": "3wmYoRUC", "schedRange": ["zm8LrvNI", "Crfd5zKy", "w8RJMqT9"]}], "clientPlatform": "VheAA5m3", "deletable": false, "description": "sksRl34t", "modulePermissions": [{"moduleId": "vPuVltQp", "selectedGroups": [{"groupId": "WTVamroA", "selectedActions": [72, 8, 62]}, {"groupId": "n6aIebKn", "selectedActions": [94, 97, 15]}, {"groupId": "okS4Zp2e", "selectedActions": [29, 95, 37]}]}, {"moduleId": "4hxm2V8q", "selectedGroups": [{"groupId": "HBDoQin6", "selectedActions": [36, 92, 84]}, {"groupId": "E6LyVBOc", "selectedActions": [7, 49, 92]}, {"groupId": "xLzpLWKg", "selectedActions": [16, 8, 1]}]}, {"moduleId": "d5FN9FoL", "selectedGroups": [{"groupId": "kuIOF85P", "selectedActions": [96, 22, 39]}, {"groupId": "X7m6UwYo", "selectedActions": [88, 33, 49]}, {"groupId": "ULs5sRU7", "selectedActions": [42, 77, 30]}]}], "namespace": "48IRQyXP", "oauthAccessTokenExpiration": 81, "oauthAccessTokenExpirationTimeUnit": "hiB5ffa1", "oauthRefreshTokenExpiration": 75, "oauthRefreshTokenExpirationTimeUnit": "JmlMu6T6", "redirectUri": "C8PTPhZP", "scopes": ["SxVJjpyY", "T86bOGWZ", "JpiGfbBx"], "skipLoginQueue": false, "twoFactorEnabled": false}}' \
    > test.out 2>&1
eval_tap $? 125 'AdminBulkUpdateClientsV3' test.out

#- 126 AdminCreateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateClientV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["8D4A5vtJ", "pMRF1D4x", "V5m2qH5w"], "baseUri": "ZktXbD37", "clientId": "0YWFGVvE", "clientName": "BjyABDGn", "clientPermissions": [{"action": 3, "resource": "G2V3YCZK", "schedAction": 29, "schedCron": "fPTdUPod", "schedRange": ["kZXsNlEp", "pmPyXZ38", "EdrxupwC"]}, {"action": 17, "resource": "CvdYCiVX", "schedAction": 35, "schedCron": "cKH98YWH", "schedRange": ["XsCF4XNm", "eCUX7Xqr", "yUK9wuid"]}, {"action": 28, "resource": "oGTnpT55", "schedAction": 24, "schedCron": "mOyM4Q35", "schedRange": ["tgnONELN", "ULWCoLF5", "lp6v7yqS"]}], "clientPlatform": "wNvVWpzy", "deletable": true, "description": "w49DDxnv", "modulePermissions": [{"moduleId": "4khWJAMz", "selectedGroups": [{"groupId": "breuPZ3I", "selectedActions": [32, 77, 0]}, {"groupId": "9zRtMPmv", "selectedActions": [20, 92, 83]}, {"groupId": "WI9Van7N", "selectedActions": [84, 46, 23]}]}, {"moduleId": "5qaDGoUV", "selectedGroups": [{"groupId": "Gj0HoCzJ", "selectedActions": [80, 43, 56]}, {"groupId": "Nqq6mEFo", "selectedActions": [15, 4, 73]}, {"groupId": "oTWnSZav", "selectedActions": [16, 14, 6]}]}, {"moduleId": "egfUzPd5", "selectedGroups": [{"groupId": "9lWaq1Iv", "selectedActions": [23, 87, 48]}, {"groupId": "AIljAw4l", "selectedActions": [76, 72, 100]}, {"groupId": "nklv9nKW", "selectedActions": [66, 64, 24]}]}], "namespace": "cfHIVLi7", "oauthAccessTokenExpiration": 51, "oauthAccessTokenExpirationTimeUnit": "KoCVmCfx", "oauthClientType": "AgCWKB9s", "oauthRefreshTokenExpiration": 20, "oauthRefreshTokenExpirationTimeUnit": "nHnj7mM5", "parentNamespace": "zMaF8uzr", "redirectUri": "KnI2BaJZ", "scopes": ["rCSjycuh", "HWHsJrge", "lmUqspO2"], "secret": "LFLaf7bt", "skipLoginQueue": true, "twoFactorEnabled": false}' \
    > test.out 2>&1
eval_tap $? 126 'AdminCreateClientV3' test.out

#- 127 AdminGetClientsbyNamespacebyIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetClientsbyNamespacebyIDV3 \
    --clientId 'CDKnRVW5' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 127 'AdminGetClientsbyNamespacebyIDV3' test.out

#- 128 AdminDeleteClientV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientV3 \
    --clientId 'SBzrPIfB' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 128 'AdminDeleteClientV3' test.out

#- 129 AdminUpdateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientV3 \
    --clientId 'nMcBlkJ3' \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["UqEaA9SE", "3cLqg7B3", "BNvg6KLM"], "baseUri": "R6eDeOw5", "clientName": "4nfDKVQ4", "clientPermissions": [{"action": 93, "resource": "hPQCgrzB", "schedAction": 63, "schedCron": "8KgsyM4q", "schedRange": ["le0IxPPe", "nc1jtQkP", "HZGtyh1i"]}, {"action": 38, "resource": "TfesHlrM", "schedAction": 30, "schedCron": "iuYMO5zV", "schedRange": ["unr6qECZ", "K2wjcbgV", "odRArcK6"]}, {"action": 5, "resource": "DF6QgaBK", "schedAction": 85, "schedCron": "VKENcqHI", "schedRange": ["T3i8kTif", "ghRJo6oi", "x5adqsyc"]}], "clientPlatform": "nlAtmkL4", "deletable": false, "description": "wHk8bDzv", "modulePermissions": [{"moduleId": "byVlA7TG", "selectedGroups": [{"groupId": "TxQ1QFrB", "selectedActions": [0, 76, 41]}, {"groupId": "cexlFUjx", "selectedActions": [65, 5, 64]}, {"groupId": "hTimmFNn", "selectedActions": [23, 46, 33]}]}, {"moduleId": "8X80Cdl9", "selectedGroups": [{"groupId": "X9MJGC4h", "selectedActions": [55, 57, 88]}, {"groupId": "Xf7pxvwO", "selectedActions": [85, 50, 70]}, {"groupId": "6vcAYeTM", "selectedActions": [71, 77, 32]}]}, {"moduleId": "caupf2cl", "selectedGroups": [{"groupId": "7aSePGY1", "selectedActions": [32, 32, 37]}, {"groupId": "Ks3TGZQs", "selectedActions": [51, 6, 27]}, {"groupId": "rVWRuklo", "selectedActions": [38, 26, 43]}]}], "namespace": "nuoVBgKI", "oauthAccessTokenExpiration": 95, "oauthAccessTokenExpirationTimeUnit": "k3RhWHGN", "oauthRefreshTokenExpiration": 31, "oauthRefreshTokenExpirationTimeUnit": "nq8K559e", "redirectUri": "AceFhric", "scopes": ["BUZoiOAi", "LoXNJdGq", "xyqNqwDU"], "skipLoginQueue": true, "twoFactorEnabled": false}' \
    > test.out 2>&1
eval_tap $? 129 'AdminUpdateClientV3' test.out

#- 130 AdminUpdateClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientPermissionV3 \
    --clientId 'Qtp0KpQQ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 51, "resource": "J1q7nYbO"}, {"action": 79, "resource": "NtUwS2vv"}, {"action": 9, "resource": "NKoZ3u5M"}]}' \
    > test.out 2>&1
eval_tap $? 130 'AdminUpdateClientPermissionV3' test.out

#- 131 AdminAddClientPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddClientPermissionsV3 \
    --clientId 'dKnyOSU5' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 82, "resource": "LYM77UFP"}, {"action": 80, "resource": "QPOeE4vm"}, {"action": 57, "resource": "EhgEwqzV"}]}' \
    > test.out 2>&1
eval_tap $? 131 'AdminAddClientPermissionsV3' test.out

#- 132 AdminDeleteClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientPermissionV3 \
    --action '25' \
    --clientId 'XodXd3VY' \
    --namespace "$AB_NAMESPACE" \
    --resource '0NcBazFT' \
    > test.out 2>&1
eval_tap $? 132 'AdminDeleteClientPermissionV3' test.out

#- 133 AdminGetConfigValueV3
./ng net.accelbyte.sdk.cli.Main iam adminGetConfigValueV3 \
    --configKey 'qVTlFj3z' \
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
    --body '{"blacklist": ["dSBeZXEg", "hqGdUsQC", "OqvQ3Cwi"]}' \
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
    --body '{"active": false, "roleIds": ["8Nvi6Sn0", "twWREVp9", "5kOxHKQp"]}' \
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
    --limit '49' \
    --offset '87' \
    > test.out 2>&1
eval_tap $? 141 'RetrieveAllSSOLoginPlatformCredentialV3' test.out

#- 142 RetrieveThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'KthzWF6K' \
    > test.out 2>&1
eval_tap $? 142 'RetrieveThirdPartyLoginPlatformCredentialV3' test.out

#- 143 AddThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam addThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'cycxmuXd' \
    --body '{"ACSURL": "Ky8LAc0S", "AWSCognitoRegion": "OsKVXXVT", "AWSCognitoUserPool": "iwT2kEEa", "AllowedClients": ["g7Kh3yTP", "64O5akm5", "tHtmApUU"], "AppId": "greZ0tVf", "AuthorizationEndpoint": "3yqhJSrf", "ClientId": "IOiO0S4n", "EmptyStrFieldList": ["iD3poDn5", "F6cXHLSr", "pTeXc0tl"], "EnableServerLicenseValidation": false, "Environment": "E5zo4oNK", "FederationMetadataURL": "4RTAic5g", "GenericOauthFlow": true, "IncludePUID": false, "IsActive": true, "Issuer": "FfhkvA10", "JWKSEndpoint": "7BQu9T0a", "KeyID": "xEiO1VPq", "LogoURL": "mZ5fn0ck", "NetflixCertificates": {"encryptedPrivateKey": "AoW1Ci0Z", "encryptedPrivateKeyName": "s8j0ebUf", "publicCertificate": "GQAk59Rf", "publicCertificateName": "6nloSxrV", "rootCertificate": "PibUMxUC", "rootCertificateName": "rogwYw9j"}, "OrganizationId": "5st93m2B", "PlatformName": "irReSCNh", "PrivateKey": "kRiEv1NQ", "RedirectUri": "7qOoTp7b", "RegisteredDomains": [{"affectedClientIDs": ["XJyLLbJ9", "GoQAFZdt", "M5fb9owO"], "domain": "f4m1OKHo", "namespaces": ["H1IVnLqZ", "M3AiIMbh", "tNwDKdLD"], "roleId": "B6N7NWKt", "ssoCfg": {"googleKey": {"CgDdoFWX": {}, "6VRSIjyl": {}, "xHkMf2eK": {}}, "groupConfigs": [{"assignNamespaces": ["GoKWoap0", "92ToSzau", "5BDzswIl"], "group": "zIV5rHUK", "roleId": "WBfXM8Vq"}, {"assignNamespaces": ["dR8zNJ9i", "fTq4xXgC", "PLfLvBw2"], "group": "xOhgqstu", "roleId": "gxuqguZl"}, {"assignNamespaces": ["ikWSHhGL", "x4culYtu", "FrkiWuqR"], "group": "oaCBFgw1", "roleId": "48aH8mDI"}]}}, {"affectedClientIDs": ["uz4mUoJM", "fERjRjat", "PugN3sxz"], "domain": "osMwArpI", "namespaces": ["r6ABJNkj", "v9b01FOw", "3KgD6IMl"], "roleId": "Ye46MCwZ", "ssoCfg": {"googleKey": {"kc4nhlAV": {}, "EsGoctRG": {}, "xrAkpsNB": {}}, "groupConfigs": [{"assignNamespaces": ["in0xOJtX", "ndfKZHw3", "kxFK5wPT"], "group": "wPR19LAA", "roleId": "LOfJmqub"}, {"assignNamespaces": ["zuGWrcsO", "r2N2ODzN", "vvyoVA6v"], "group": "GV2Kv6ZH", "roleId": "RgkXa8pn"}, {"assignNamespaces": ["tR7bqTH5", "Wz2fU3QF", "HLvM9Bed"], "group": "j592gcy0", "roleId": "o8lggQ9s"}]}}, {"affectedClientIDs": ["TKMLUvud", "vJ9fX8YG", "faNJKeYB"], "domain": "hQykacsJ", "namespaces": ["10JnhWH1", "KvRWDNMO", "gWrzbckn"], "roleId": "KYPdYxjk", "ssoCfg": {"googleKey": {"PGoRQyNL": {}, "cFIUYGLF": {}, "GTquS7No": {}}, "groupConfigs": [{"assignNamespaces": ["IhxXS1mT", "yAm1MMp7", "7Z6bZe0b"], "group": "2CA6Kg7a", "roleId": "KcPsOsy1"}, {"assignNamespaces": ["oOGyj4Ap", "rjaiJ0MN", "ffLYDM5c"], "group": "xElz0QPv", "roleId": "EyL2oD9Z"}, {"assignNamespaces": ["i57rc7AT", "oJd1qBV1", "8yayqHRp"], "group": "cTEX8ESz", "roleId": "bjM4yUxr"}]}}], "RelyingParty": "I70j5vKY", "SandboxId": "ugg4iF2H", "Secret": "jBuWfHPN", "TeamID": "mSuKabFb", "TokenAuthenticationType": "dcDLt2J4", "TokenClaimsMapping": {"CVQleyC3": "aF024KeS", "slMAnkl6": "7Td9LPI3", "ieh1PBxj": "79MIPLlS"}, "TokenEndpoint": "mEqohcHX", "UserInfoEndpoint": "0OTjiIQu", "UserInfoHTTPMethod": "lN4IKG15", "googleAdminConsoleKey": "R05Cwfpd", "scopes": ["WPUWBIxQ", "YUsbAQ6e", "0qkwG5IL"]}' \
    > test.out 2>&1
eval_tap $? 143 'AddThirdPartyLoginPlatformCredentialV3' test.out

#- 144 DeleteThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'FGGOjpw8' \
    > test.out 2>&1
eval_tap $? 144 'DeleteThirdPartyLoginPlatformCredentialV3' test.out

#- 145 UpdateThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'zB6ho4x6' \
    --body '{"ACSURL": "srW1Ly02", "AWSCognitoRegion": "2pbkcM5r", "AWSCognitoUserPool": "VHLtZJX5", "AllowedClients": ["oJDq4z7R", "GOw73C35", "llubLWbS"], "AppId": "Bo9xQIU5", "AuthorizationEndpoint": "VXnsJmhS", "ClientId": "6hx2ZepP", "EmptyStrFieldList": ["AXPTTb37", "dqu8dZk1", "Ig1fjnRT"], "EnableServerLicenseValidation": false, "Environment": "HTp3Vjg8", "FederationMetadataURL": "YK82DnC5", "GenericOauthFlow": false, "IncludePUID": true, "IsActive": true, "Issuer": "1ckA4KU5", "JWKSEndpoint": "1KlOYe65", "KeyID": "Ddjr4Gqv", "LogoURL": "1Mllzj2p", "NetflixCertificates": {"encryptedPrivateKey": "dighA6lU", "encryptedPrivateKeyName": "iQe1MqNo", "publicCertificate": "b4PaWqWc", "publicCertificateName": "NTjBh4PW", "rootCertificate": "0ULdWmPI", "rootCertificateName": "7iAuiaje"}, "OrganizationId": "Mcyd1MaT", "PlatformName": "uKjROXp3", "PrivateKey": "hoU7JRjh", "RedirectUri": "UtXT2Qwk", "RegisteredDomains": [{"affectedClientIDs": ["JIIgz7KW", "Ik9ZiKvI", "wRvwwCHL"], "domain": "v7nWqGI6", "namespaces": ["bEP4lldy", "yRdfRmxw", "i7oQP1yS"], "roleId": "2whqsRkO", "ssoCfg": {"googleKey": {"X8thYsa8": {}, "DSCDboKh": {}, "8luHW8Rp": {}}, "groupConfigs": [{"assignNamespaces": ["5WO3Oqcc", "UjlARILv", "JioOoQ0H"], "group": "FWqmqVo9", "roleId": "i7oR2IQ7"}, {"assignNamespaces": ["g9XrOCa1", "ZEZDQkRu", "ZOJZ1Vhu"], "group": "gsEgGcYv", "roleId": "MmqWLWRw"}, {"assignNamespaces": ["6Z52m2VI", "zEXA29nm", "z9MyC5qt"], "group": "5U0h0OiT", "roleId": "zHR2d0q8"}]}}, {"affectedClientIDs": ["1WFFmiWW", "AfBGKTnk", "L7FP4Qdp"], "domain": "JnM3Os5q", "namespaces": ["vt400BZc", "7rXlKF5M", "Rvu1eH7l"], "roleId": "pvxgNIi3", "ssoCfg": {"googleKey": {"YJOuAP4V": {}, "gI672sy8": {}, "2Xvwwkrk": {}}, "groupConfigs": [{"assignNamespaces": ["uW62Zb6i", "ftpfd8h3", "fLrz4zca"], "group": "XkvFzjMs", "roleId": "H6cwn2VT"}, {"assignNamespaces": ["bvAUOaJ6", "qSIYRCPL", "5fUo4hTJ"], "group": "CNerhgsU", "roleId": "026ndvIp"}, {"assignNamespaces": ["cRdoNsCW", "CVretM1w", "wUYgZywx"], "group": "1CJs7iI6", "roleId": "gecCBSeN"}]}}, {"affectedClientIDs": ["HXElZEip", "FZCH4jUZ", "JbrMDPI4"], "domain": "zNubfYef", "namespaces": ["OPjUWLtz", "dmHWGomR", "7qddMMoP"], "roleId": "KwoUuC2f", "ssoCfg": {"googleKey": {"jlAuKoOU": {}, "wxCxQGm8": {}, "TGNkW3iO": {}}, "groupConfigs": [{"assignNamespaces": ["OesaQbob", "CaGXrz1S", "IpKWDPu6"], "group": "C2U2x6kT", "roleId": "O0sNRMNE"}, {"assignNamespaces": ["UaZQ5X9B", "mSyROQem", "0qtDPTYe"], "group": "hubfssgk", "roleId": "iXTdxg84"}, {"assignNamespaces": ["58wUInqv", "S0ygOaoq", "T3B5xbps"], "group": "tzooQOUZ", "roleId": "4lqW5VU1"}]}}], "RelyingParty": "5MpZdpMn", "SandboxId": "9NGKrTZB", "Secret": "6uAdzDw0", "TeamID": "sqLsEp3v", "TokenAuthenticationType": "3qAaPfwY", "TokenClaimsMapping": {"4yqrXmYL": "WSFwtOvn", "MM23QuH3": "4pQBp5jm", "wUYxI1cy": "EzGUwOSZ"}, "TokenEndpoint": "4iqnRtXc", "UserInfoEndpoint": "jw6sBWij", "UserInfoHTTPMethod": "lR2ZP0R6", "googleAdminConsoleKey": "oqHsAqD4", "scopes": ["mLSL9WcN", "mIExDvsN", "rgQD6juD"]}' \
    > test.out 2>&1
eval_tap $? 145 'UpdateThirdPartyLoginPlatformCredentialV3' test.out

#- 146 UpdateThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Rwp36DKV' \
    --body '{"affectedClientIDs": ["270vIrnO", "TigwdZNi", "oPj1etsl"], "assignedNamespaces": ["2Vl1gqQK", "iULI8nnj", "ueIs76B6"], "domain": "YhccQART", "roleId": "Qs6E15h7", "ssoCfg": {"googleKey": {"ZiOhcMlc": {}, "TjnrNc9C": {}, "c578Xosw": {}}, "groupConfigs": [{"assignNamespaces": ["zBn7bxvl", "u9JjMPwC", "5H6w9Z4W"], "group": "5NK8Wcsp", "roleId": "E0uKXJQw"}, {"assignNamespaces": ["dnAPHPs4", "v1iVfByR", "akgo0hHd"], "group": "WFzj3UbO", "roleId": "7355V1dx"}, {"assignNamespaces": ["lVVnC0mR", "dAfpa3Nr", "OCBanzEa"], "group": "Jf6zGwTj", "roleId": "iMqtEvkf"}]}}' \
    > test.out 2>&1
eval_tap $? 146 'UpdateThirdPartyLoginPlatformDomainV3' test.out

#- 147 DeleteThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'cJkNiILg' \
    --body '{"domain": "hpEKwWhD", "ssoGroups": ["ERVM57JZ", "Cf9ifTss", "Q9T1EvQh"]}' \
    > test.out 2>&1
eval_tap $? 147 'DeleteThirdPartyLoginPlatformDomainV3' test.out

#- 148 PartialUpdateThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam partialUpdateThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Miy3MKEN' \
    --body '{"affectedClientIDs": ["A27Jp6DO", "iI7197gL", "HFLHutyb"], "assignedNamespaces": ["goEchUVl", "BXuHpHwu", "2rt8nh1W"], "domain": "rW1hgawK", "roleId": "5JtRrRJ8", "ssoCfg": {"googleKey": {"5JKfCSPl": {}, "TpFNBoFN": {}, "cSkW20y5": {}}, "groupConfigs": [{"assignNamespaces": ["piDnVoQu", "TbHmQB6Y", "LIujoHY5"], "group": "EQxjHDsl", "roleId": "3oYg00D9"}, {"assignNamespaces": ["eUot4IQr", "mtUHcpZ4", "1zNe3Rb8"], "group": "P3SHMb7D", "roleId": "8NyVHC0y"}, {"assignNamespaces": ["utXqQ8r3", "dNswAjaJ", "AARG3k4K"], "group": "rHKOgybF", "roleId": "zoA5xgSZ"}]}}' \
    > test.out 2>&1
eval_tap $? 148 'PartialUpdateThirdPartyLoginPlatformDomainV3' test.out

#- 149 RetrieveSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam retrieveSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'OiJZsy0Y' \
    > test.out 2>&1
eval_tap $? 149 'RetrieveSSOLoginPlatformCredential' test.out

#- 150 AddSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam addSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'eLw2YHfr' \
    --body '{"acsUrl": "SnR2fAta", "apiKey": "xEnlWZBE", "appId": "P3AEFSqa", "federationMetadataUrl": "xHW7CTJR", "isActive": false, "redirectUri": "3FtzY5fn", "secret": "KQhEvrlG", "ssoUrl": "6mp1ew4d"}' \
    > test.out 2>&1
eval_tap $? 150 'AddSSOLoginPlatformCredential' test.out

#- 151 DeleteSSOLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteSSOLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'AJUe5UeG' \
    > test.out 2>&1
eval_tap $? 151 'DeleteSSOLoginPlatformCredentialV3' test.out

#- 152 UpdateSSOPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam updateSSOPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'oLLvMHvG' \
    --body '{"acsUrl": "7vjbsT7X", "apiKey": "4PE6UMq3", "appId": "LjBC6q5I", "federationMetadataUrl": "jmSNYfWn", "isActive": true, "redirectUri": "ByAeBb3Q", "secret": "ZU4v1nKF", "ssoUrl": "XvWNdA5r"}' \
    > test.out 2>&1
eval_tap $? 152 'UpdateSSOPlatformCredential' test.out

#- 153 AdminListUserIDByPlatformUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByPlatformUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'ie6B0i37' \
    --rawPID  \
    --rawPUID  \
    --body '{"platformUserIds": ["0EpqtNeK", "kM2iP8o3", "CijRwOFi"]}' \
    > test.out 2>&1
eval_tap $? 153 'AdminListUserIDByPlatformUserIDsV3' test.out

#- 154 AdminGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '4n49rPvj' \
    --platformUserId 'XvkvVaOT' \
    --pidType 'UfyoGGx3' \
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
    --body '{"config": {"minimumAllowedInterval": 83}, "type": "sDLR6H6W"}' \
    > test.out 2>&1
eval_tap $? 156 'AdminUpdateProfileUpdateStrategyV3' test.out

#- 157 AdminGetRoleOverrideConfigV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleOverrideConfigV3 \
    --namespace "$AB_NAMESPACE" \
    --identity 'GAME_ADMIN' \
    > test.out 2>&1
eval_tap $? 157 'AdminGetRoleOverrideConfigV3' test.out

#- 158 AdminUpdateRoleOverrideConfigV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleOverrideConfigV3 \
    --namespace "$AB_NAMESPACE" \
    --identity 'USER' \
    --body '{"additions": [{"actions": [77, 32, 73], "resource": "I4x2BImZ"}, {"actions": [30, 41, 8], "resource": "e7xQGmqm"}, {"actions": [51, 17, 22], "resource": "pIhlbPU8"}], "exclusions": [{"actions": [59, 11, 75], "resource": "2brinpzZ"}, {"actions": [50, 67, 81], "resource": "VlETtFaB"}, {"actions": [84, 38, 47], "resource": "KX2OQ1fY"}], "overrides": [{"actions": [44, 3, 26], "resource": "u5SmuT37"}, {"actions": [37, 22, 74], "resource": "Ol2JGWMt"}, {"actions": [87, 95, 2], "resource": "nKhbsC8Q"}], "replacements": [{"replacement": {"actions": [79, 26, 42], "resource": "2njMR473"}, "target": "CARtwRYV"}, {"replacement": {"actions": [13, 70, 65], "resource": "fXvL8t37"}, "target": "2CbgOaKw"}, {"replacement": {"actions": [5, 38, 61], "resource": "UAb0b1YO"}, "target": "zZGg0gDY"}]}' \
    > test.out 2>&1
eval_tap $? 158 'AdminUpdateRoleOverrideConfigV3' test.out

#- 159 AdminGetRoleSourceV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleSourceV3 \
    --namespace "$AB_NAMESPACE" \
    --identity 'GAME_ADMIN' \
    > test.out 2>&1
eval_tap $? 159 'AdminGetRoleSourceV3' test.out

#- 160 AdminChangeRoleOverrideConfigStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminChangeRoleOverrideConfigStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --identity 'VIEW_ONLY' \
    --body '{"active": true}' \
    > test.out 2>&1
eval_tap $? 160 'AdminChangeRoleOverrideConfigStatusV3' test.out

#- 161 AdminGetRoleNamespacePermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleNamespacePermissionV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'DJZlFH9C' \
    > test.out 2>&1
eval_tap $? 161 'AdminGetRoleNamespacePermissionV3' test.out

#- 162 GetAdminUsersByRoleIdV3
./ng net.accelbyte.sdk.cli.Main iam getAdminUsersByRoleIdV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'R5zeoRtm' \
    --after '83' \
    --before '26' \
    --limit '3' \
    > test.out 2>&1
eval_tap $? 162 'GetAdminUsersByRoleIdV3' test.out

#- 163 AdminQueryTagV3
./ng net.accelbyte.sdk.cli.Main iam adminQueryTagV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '27' \
    --offset '42' \
    --tagName 'ONVhYYHn' \
    > test.out 2>&1
eval_tap $? 163 'AdminQueryTagV3' test.out

#- 164 AdminCreateTagV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateTagV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"tagName": "PmirmiYe"}' \
    > test.out 2>&1
eval_tap $? 164 'AdminCreateTagV3' test.out

#- 165 AdminUpdateTagV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateTagV3 \
    --namespace "$AB_NAMESPACE" \
    --tagId '2upLXN0p' \
    --body '{"tagName": "QU0Rd8HF"}' \
    > test.out 2>&1
eval_tap $? 165 'AdminUpdateTagV3' test.out

#- 166 AdminDeleteTagV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteTagV3 \
    --namespace "$AB_NAMESPACE" \
    --tagId 'lSDXcu2T' \
    > test.out 2>&1
eval_tap $? 166 'AdminDeleteTagV3' test.out

#- 167 AdminGetUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --emailAddress 'Zin76qRS' \
    > test.out 2>&1
eval_tap $? 167 'AdminGetUserByEmailAddressV3' test.out

#- 168 AdminBulkUpdateUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"updateRequest": {"skipLoginQueue": false}, "userIds": ["eeTMynRu", "QvEbh1Bk", "R1Dn6TNw"]}' \
    > test.out 2>&1
eval_tap $? 168 'AdminBulkUpdateUsersV3' test.out

#- 169 AdminGetBulkUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType 'VFbEjEDw' \
    --body '{"bulkUserId": ["5idsBrlv", "BWWuUKZa", "NqhJhWFS"]}' \
    > test.out 2>&1
eval_tap $? 169 'AdminGetBulkUserBanV3' test.out

#- 170 AdminListUserIDByUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"findByPublisherNamespace": false, "userIds": ["ZxawT8iI", "pJ56z3Bz", "a2JorRse"]}' \
    > test.out 2>&1
eval_tap $? 170 'AdminListUserIDByUserIDsV3' test.out

#- 171 AdminBulkGetUsersPlatform
./ng net.accelbyte.sdk.cli.Main iam adminBulkGetUsersPlatform \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["PywMS9ua", "uMkwJbFa", "Dv5PyPCO"]}' \
    > test.out 2>&1
eval_tap $? 171 'AdminBulkGetUsersPlatform' test.out

#- 172 AdminCursorGetUserV3
./ng net.accelbyte.sdk.cli.Main iam adminCursorGetUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"cursor": {"cursorTime": "bBm0cDn7", "userId": "Tww1nmVV"}, "fields": ["NnpZEaKJ", "fTNJTyYH", "AGMPgcb4"], "limit": 10}' \
    > test.out 2>&1
eval_tap $? 172 'AdminCursorGetUserV3' test.out

#- 173 AdminInviteUserV3
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddresses": ["kyug2ogb", "vbbuVK3Y", "gsBYHFNx"], "isAdmin": true, "languageTag": "3r1ftj3o", "namespace": "cPMBiBYm", "roles": ["92qI4F9U", "DWAvenn1", "soTpiTbe"]}' \
    > test.out 2>&1
eval_tap $? 173 'AdminInviteUserV3' test.out

#- 174 AdminQueryThirdPlatformLinkHistoryV3
./ng net.accelbyte.sdk.cli.Main iam adminQueryThirdPlatformLinkHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '84' \
    --offset '2' \
    --platformUserId 'fRTP5cdM' \
    --platformId 'miInkW7w' \
    > test.out 2>&1
eval_tap $? 174 'AdminQueryThirdPlatformLinkHistoryV3' test.out

#- 175 AdminListUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminListUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '69' \
    --offset '55' \
    > test.out 2>&1
eval_tap $? 175 'AdminListUsersV3' test.out

#- 176 AdminSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam adminSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'NNFYyuO0' \
    --endDate 'kV2PGVnZ' \
    --includeTotal  \
    --limit '91' \
    --offset '35' \
    --platformBy 'dB9vWLX2' \
    --platformId 'maMukRmp' \
    --query '1KVQHt66' \
    --roleIds 'U5swrUFO' \
    --selectedFields '4r2LeQvM' \
    --skipLoginQueue  \
    --startDate 'EI0qDz4o' \
    --tagIds 'IUbOSY7P' \
    --testAccount  \
    > test.out 2>&1
eval_tap $? 176 'AdminSearchUserV3' test.out

#- 177 AdminGetBulkUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"listEmailAddressRequest": ["QFkKuebj", "JZNjp69i", "7PjaAziK"]}' \
    > test.out 2>&1
eval_tap $? 177 'AdminGetBulkUserByEmailAddressV3' test.out

#- 178 AdminGetUserByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'dFIrsupP' \
    > test.out 2>&1
eval_tap $? 178 'AdminGetUserByUserIdV3' test.out

#- 179 AdminUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'msQ3lCDk' \
    --body '{"avatarUrl": "J5WtLcX6", "country": "b44UDfpV", "dateOfBirth": "unXxcFlY", "displayName": "xEiW6qf7", "languageTag": "7ScOOlZE", "skipLoginQueue": true, "tags": ["2nuYaVty", "i6gAoelu", "PDypnTmt"], "uniqueDisplayName": "rSMXFasO", "userName": "XsFZ9w4g"}' \
    > test.out 2>&1
eval_tap $? 179 'AdminUpdateUserV3' test.out

#- 180 AdminGetUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'g9Mv9Ny4' \
    --activeOnly  \
    --after 'KryCupGQ' \
    --before 'pBX87ghH' \
    --limit '29' \
    > test.out 2>&1
eval_tap $? 180 'AdminGetUserBanV3' test.out

#- 181 AdminBanUserV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'O261x4jV' \
    --body '{"ban": "XfHay1S9", "comment": "6OKXVv8g", "endDate": "pZmPmm1q", "reason": "tjKn65kE", "skipNotif": false}' \
    > test.out 2>&1
eval_tap $? 181 'AdminBanUserV3' test.out

#- 182 AdminGetUserBanSummaryV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanSummaryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'KChmE5sD' \
    > test.out 2>&1
eval_tap $? 182 'AdminGetUserBanSummaryV3' test.out

#- 183 AdminUpdateUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserBanV3 \
    --banId 'hrinZHiV' \
    --namespace "$AB_NAMESPACE" \
    --userId 'eqTDvut2' \
    --body '{"enabled": false, "skipNotif": false}' \
    > test.out 2>&1
eval_tap $? 183 'AdminUpdateUserBanV3' test.out

#- 184 AdminSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'rFNInqiU' \
    --body '{"context": "VLtEVpjn", "emailAddress": "My8TtWat", "languageTag": "JCAWwr9Z", "upgradeToken": "pXuKB55X"}' \
    > test.out 2>&1
eval_tap $? 184 'AdminSendVerificationCodeV3' test.out

#- 185 AdminVerifyAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '2Cqoc4bF' \
    --body '{"Code": "I0h84Rw6", "ContactType": "1Nha0zKg", "LanguageTag": "6dvATKbJ", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 185 'AdminVerifyAccountV3' test.out

#- 186 GetUserVerificationCode
./ng net.accelbyte.sdk.cli.Main iam getUserVerificationCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'dpOZCGWo' \
    > test.out 2>&1
eval_tap $? 186 'GetUserVerificationCode' test.out

#- 187 AdminGetUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Oez84PxB' \
    > test.out 2>&1
eval_tap $? 187 'AdminGetUserDeletionStatusV3' test.out

#- 188 AdminUpdateUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'aBJ0EJr5' \
    --body '{"deletionDate": 66, "enabled": false}' \
    > test.out 2>&1
eval_tap $? 188 'AdminUpdateUserDeletionStatusV3' test.out

#- 189 AdminListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Nsz3Je9F' \
    > test.out 2>&1
eval_tap $? 189 'AdminListUserAllPlatformAccountsDistinctV3' test.out

#- 190 AdminUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'SSOk93Ic' \
    --body '{"code": "tHjzZoy2", "country": "QEztk0HK", "dateOfBirth": "ED9WKInH", "displayName": "Kf9PVmT6", "emailAddress": "GIGYjzmM", "password": "SviiLqO6", "uniqueDisplayName": "ef9qLnD5", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 190 'AdminUpgradeHeadlessAccountV3' test.out

#- 191 AdminDeleteUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'PpdEuaVj' \
    > test.out 2>&1
eval_tap $? 191 'AdminDeleteUserInformationV3' test.out

#- 192 AdminGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ng6fEC4B' \
    --after '0.6248602569355262' \
    --before '0.7058850195377541' \
    --limit '19' \
    > test.out 2>&1
eval_tap $? 192 'AdminGetUserLoginHistoriesV3' test.out

#- 193 AdminResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam adminResetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'KIMEPYr5' \
    --body '{"languageTag": "WoRPZXu2", "mfaToken": "gHClBKRd", "newPassword": "zy3usY2A", "oldPassword": "cLNKwlim"}' \
    > test.out 2>&1
eval_tap $? 193 'AdminResetPasswordV3' test.out

#- 194 AdminUpdateUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserPermissionV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'aRO5DVX8' \
    --body '{"Permissions": [{"Action": 35, "Resource": "TDAmRW4I", "SchedAction": 11, "SchedCron": "Fi3sDnuQ", "SchedRange": ["0k3XiJRQ", "AQZtFjhy", "9Fwsac8g"]}, {"Action": 41, "Resource": "FqDVigaS", "SchedAction": 27, "SchedCron": "oA0wQLTY", "SchedRange": ["qxXMllsy", "5FTbsWRS", "Q6vGOMio"]}, {"Action": 26, "Resource": "sHGAs0k8", "SchedAction": 75, "SchedCron": "7rOjSDIJ", "SchedRange": ["v6WuKyuP", "tKcvOZBg", "eNNgwGwv"]}]}' \
    > test.out 2>&1
eval_tap $? 194 'AdminUpdateUserPermissionV3' test.out

#- 195 AdminAddUserPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserPermissionsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Yem5Ukky' \
    --body '{"Permissions": [{"Action": 70, "Resource": "0yD12u2k", "SchedAction": 67, "SchedCron": "jZp0waRk", "SchedRange": ["wRme6Bn6", "ytFHt1s7", "ulDcGolR"]}, {"Action": 68, "Resource": "c0WJNkix", "SchedAction": 97, "SchedCron": "Kzi5yida", "SchedRange": ["JFrlnl4Z", "b0iabGoN", "tVxwdx1r"]}, {"Action": 92, "Resource": "H4ygGcSa", "SchedAction": 29, "SchedCron": "r5uvcTDG", "SchedRange": ["tS9h38bK", "9ftEvMoj", "aa5V762m"]}]}' \
    > test.out 2>&1
eval_tap $? 195 'AdminAddUserPermissionsV3' test.out

#- 196 AdminDeleteUserPermissionBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ncqKzqVS' \
    --body '[{"Action": 3, "Resource": "PsQXMcew"}, {"Action": 83, "Resource": "Su3Upp0m"}, {"Action": 99, "Resource": "8fbIz7r7"}]' \
    > test.out 2>&1
eval_tap $? 196 'AdminDeleteUserPermissionBulkV3' test.out

#- 197 AdminDeleteUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionV3 \
    --action '35' \
    --namespace "$AB_NAMESPACE" \
    --resource 'JLRR7gNA' \
    --userId 'hfdjxX1x' \
    > test.out 2>&1
eval_tap $? 197 'AdminDeleteUserPermissionV3' test.out

#- 198 AdminGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'tYHUN4NY' \
    --after 'VYEZQCLt' \
    --before 'CXbfEFNG' \
    --limit '5' \
    --platformId 'dnCBE8Tz' \
    --targetNamespace '1Wfvxy8W' \
    > test.out 2>&1
eval_tap $? 198 'AdminGetUserPlatformAccountsV3' test.out

#- 199 AdminListAllDistinctPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminListAllDistinctPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'PUXTnZRu' \
    --status 'VW25jsRO' \
    > test.out 2>&1
eval_tap $? 199 'AdminListAllDistinctPlatformAccountsV3' test.out

#- 200 AdminGetListJusticePlatformAccounts
./ng net.accelbyte.sdk.cli.Main iam adminGetListJusticePlatformAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'HB07QHCL' \
    > test.out 2>&1
eval_tap $? 200 'AdminGetListJusticePlatformAccounts' test.out

#- 201 AdminGetUserMapping
./ng net.accelbyte.sdk.cli.Main iam adminGetUserMapping \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'iSDq1Esa' \
    --userId 'E2fKtDjF' \
    --createIfNotFound  \
    > test.out 2>&1
eval_tap $? 201 'AdminGetUserMapping' test.out

#- 202 AdminCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam adminCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'r2qk3q0d' \
    --userId '2rxixikf' \
    > test.out 2>&1
eval_tap $? 202 'AdminCreateJusticeUser' test.out

#- 203 AdminLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId '3mhFcrqq' \
    --skipConflict  \
    --body '{"platformId": "SmUOVtMO", "platformUserId": "TIjZr8eD"}' \
    > test.out 2>&1
eval_tap $? 203 'AdminLinkPlatformAccount' test.out

#- 204 AdminGetUserLinkHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLinkHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'fIrV8q3z' \
    --platformId '1KmwuBOR' \
    > test.out 2>&1
eval_tap $? 204 'AdminGetUserLinkHistoriesV3' test.out

#- 205 AdminPlatformUnlinkV3
eval_tap 0 205 'AdminPlatformUnlinkV3 # SKIP deprecated' test.out

#- 206 AdminPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'MCSamYfK' \
    --userId 'qwKFdr2N' \
    > test.out 2>&1
eval_tap $? 206 'AdminPlatformUnlinkAllV3' test.out

#- 207 AdminPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '4gspKJ5v' \
    --userId 'oq5K2f4d' \
    --ticket 'fcXrBdAF' \
    > test.out 2>&1
eval_tap $? 207 'AdminPlatformLinkV3' test.out

#- 208 AdminDeleteUserLinkingHistoryByPlatformIDV3
eval_tap 0 208 'AdminDeleteUserLinkingHistoryByPlatformIDV3 # SKIP deprecated' test.out

#- 209 AdminDeleteUserLinkingRestrictionByPlatformIDV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserLinkingRestrictionByPlatformIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'ljTuRHEm' \
    --userId 'x8rQQIMF' \
    > test.out 2>&1
eval_tap $? 209 'AdminDeleteUserLinkingRestrictionByPlatformIDV3' test.out

#- 210 AdminGetThirdPartyPlatformTokenLinkStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetThirdPartyPlatformTokenLinkStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'fnBPQVWZ' \
    --userId 'n6aLyMli' \
    --platformToken 'KSdWygqY' \
    > test.out 2>&1
eval_tap $? 210 'AdminGetThirdPartyPlatformTokenLinkStatusV3' test.out

#- 211 AdminGetUserSinglePlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminGetUserSinglePlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --platformId 'TpU3WxJx' \
    --userId 'IujWNpAc' \
    --crossNamespace  \
    > test.out 2>&1
eval_tap $? 211 'AdminGetUserSinglePlatformAccount' test.out

#- 212 AdminDeleteUserRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRolesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '6ySRTQaf' \
    --body '["hggSq8zA", "bPQhFEp8", "vOzvBxTw"]' \
    > test.out 2>&1
eval_tap $? 212 'AdminDeleteUserRolesV3' test.out

#- 213 AdminSaveUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminSaveUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZvCDe8Kp' \
    --body '[{"namespace": "9Y3o4Z49", "roleId": "SAWdodZV"}, {"namespace": "8KY2DZBG", "roleId": "C4vqZ9p1"}, {"namespace": "Zt1hbTTV", "roleId": "TFIY9mgH"}]' \
    > test.out 2>&1
eval_tap $? 213 'AdminSaveUserRoleV3' test.out

#- 214 AdminAddUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'NyeEfehT' \
    --userId 'SiW3nAv2' \
    > test.out 2>&1
eval_tap $? 214 'AdminAddUserRoleV3' test.out

#- 215 AdminDeleteUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId '0wB4sQ6j' \
    --userId 'PwF5oR9L' \
    > test.out 2>&1
eval_tap $? 215 'AdminDeleteUserRoleV3' test.out

#- 216 AdminGetUserStateByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserStateByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '0NdYmKbl' \
    > test.out 2>&1
eval_tap $? 216 'AdminGetUserStateByUserIdV3' test.out

#- 217 AdminUpdateUserStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'VLCbLB5z' \
    --body '{"enabled": false, "reason": "nMnRgGlT"}' \
    > test.out 2>&1
eval_tap $? 217 'AdminUpdateUserStatusV3' test.out

#- 218 AdminTrustlyUpdateUserIdentity
./ng net.accelbyte.sdk.cli.Main iam adminTrustlyUpdateUserIdentity \
    --namespace "$AB_NAMESPACE" \
    --userId '4t02LyLL' \
    --body '{"emailAddress": "7QPpJSVp", "password": "OShqr7Mb"}' \
    > test.out 2>&1
eval_tap $? 218 'AdminTrustlyUpdateUserIdentity' test.out

#- 219 AdminVerifyUserWithoutVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyUserWithoutVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'GVRp1SXv' \
    > test.out 2>&1
eval_tap $? 219 'AdminVerifyUserWithoutVerificationCodeV3' test.out

#- 220 AdminUpdateClientSecretV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientSecretV3 \
    --clientId 'x3hLq8j2' \
    --namespace "$AB_NAMESPACE" \
    --body '{"newSecret": "5RqALCSY"}' \
    > test.out 2>&1
eval_tap $? 220 'AdminUpdateClientSecretV3' test.out

#- 221 AdminCheckThirdPartyLoginPlatformAvailabilityV3
./ng net.accelbyte.sdk.cli.Main iam adminCheckThirdPartyLoginPlatformAvailabilityV3 \
    --platformId 'tsas5CO2' \
    > test.out 2>&1
eval_tap $? 221 'AdminCheckThirdPartyLoginPlatformAvailabilityV3' test.out

#- 222 AdminGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV3 \
    --after 'wz4pRZoP' \
    --before 'uaLH7gB7' \
    --isWildcard  \
    --limit '59' \
    > test.out 2>&1
eval_tap $? 222 'AdminGetRolesV3' test.out

#- 223 AdminCreateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV3 \
    --body '{"adminRole": true, "deletable": true, "isWildcard": true, "managers": [{"displayName": "LBYzvsLn", "namespace": "weQXbWEI", "userId": "4mZgE8s1"}, {"displayName": "SW9m9u0t", "namespace": "txaVemx3", "userId": "qgETaHTu"}, {"displayName": "OO4W29Gi", "namespace": "bpU5pZt7", "userId": "Td60NF9C"}], "members": [{"displayName": "PrHtTzHc", "namespace": "pAZuaLXU", "userId": "zSANZI32"}, {"displayName": "gCSMAEiz", "namespace": "6BPl09u1", "userId": "OXr2N3cC"}, {"displayName": "qFccrXsz", "namespace": "48LIeFqv", "userId": "2Jy93KqP"}], "permissions": [{"action": 64, "resource": "ycHM2Oz9", "schedAction": 43, "schedCron": "9t5vxUcC", "schedRange": ["vgdIfTgF", "dpC9O7kH", "bdBMAlPu"]}, {"action": 62, "resource": "jJ0bZJT1", "schedAction": 87, "schedCron": "XvAS41hw", "schedRange": ["D6ruTX7J", "DHZhGQDO", "TUTwEQ5j"]}, {"action": 41, "resource": "dJ3HsRPH", "schedAction": 33, "schedCron": "jcLtSJfx", "schedRange": ["cTHAS7IG", "7eY7zrsT", "lPiwd8Tg"]}], "roleName": "9zcIMBRa"}' \
    > test.out 2>&1
eval_tap $? 223 'AdminCreateRoleV3' test.out

#- 224 AdminGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV3 \
    --roleId '2nCBS0En' \
    > test.out 2>&1
eval_tap $? 224 'AdminGetRoleV3' test.out

#- 225 AdminDeleteRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV3 \
    --roleId 'wUHeM4eP' \
    > test.out 2>&1
eval_tap $? 225 'AdminDeleteRoleV3' test.out

#- 226 AdminUpdateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV3 \
    --roleId 'dCIDDBaB' \
    --body '{"deletable": false, "isWildcard": true, "roleName": "xg7KGtss"}' \
    > test.out 2>&1
eval_tap $? 226 'AdminUpdateRoleV3' test.out

#- 227 AdminGetRoleAdminStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleAdminStatusV3 \
    --roleId 'ueZI2Rb9' \
    > test.out 2>&1
eval_tap $? 227 'AdminGetRoleAdminStatusV3' test.out

#- 228 AdminUpdateAdminRoleStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateAdminRoleStatusV3 \
    --roleId 'Qy43yOb5' \
    > test.out 2>&1
eval_tap $? 228 'AdminUpdateAdminRoleStatusV3' test.out

#- 229 AdminRemoveRoleAdminV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleAdminV3 \
    --roleId 'yysoJSwq' \
    > test.out 2>&1
eval_tap $? 229 'AdminRemoveRoleAdminV3' test.out

#- 230 AdminGetRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleManagersV3 \
    --roleId 'nLTSaCaV' \
    --after 'zWwbDjiE' \
    --before 'arwCDJ9t' \
    --limit '14' \
    > test.out 2>&1
eval_tap $? 230 'AdminGetRoleManagersV3' test.out

#- 231 AdminAddRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleManagersV3 \
    --roleId '7wSBG4dj' \
    --body '{"managers": [{"displayName": "3QSresvH", "namespace": "5vWemS3r", "userId": "GnI9oAHT"}, {"displayName": "qyfQbpwM", "namespace": "Rtz4TgH2", "userId": "qTaGDVoH"}, {"displayName": "yaWMHlF6", "namespace": "tzb2y6nf", "userId": "HYxWcnnu"}]}' \
    > test.out 2>&1
eval_tap $? 231 'AdminAddRoleManagersV3' test.out

#- 232 AdminRemoveRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleManagersV3 \
    --roleId 'cngAMOcC' \
    --body '{"managers": [{"displayName": "1HhliSOv", "namespace": "thFX0xh8", "userId": "2kV9aNJk"}, {"displayName": "w4qwsmkw", "namespace": "1qDlc1AL", "userId": "bobWT86E"}, {"displayName": "mNGTKNYz", "namespace": "31eYZbbH", "userId": "Tr5lWgYs"}]}' \
    > test.out 2>&1
eval_tap $? 232 'AdminRemoveRoleManagersV3' test.out

#- 233 AdminGetRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleMembersV3 \
    --roleId 'FfBCGTa4' \
    --after 'EQ5FrAmd' \
    --before 'ifKZIYp9' \
    --limit '10' \
    > test.out 2>&1
eval_tap $? 233 'AdminGetRoleMembersV3' test.out

#- 234 AdminAddRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleMembersV3 \
    --roleId 'ODKOj5c4' \
    --body '{"members": [{"displayName": "eXXD9yIN", "namespace": "9DBc99z7", "userId": "1YLkpHRr"}, {"displayName": "RIAlXZJW", "namespace": "ZjjAJifG", "userId": "HMD6Sj4K"}, {"displayName": "VfixrUH3", "namespace": "chBEheWh", "userId": "gH40DNTj"}]}' \
    > test.out 2>&1
eval_tap $? 234 'AdminAddRoleMembersV3' test.out

#- 235 AdminRemoveRoleMembersV3
eval_tap 0 235 'AdminRemoveRoleMembersV3 # SKIP deprecated' test.out

#- 236 AdminUpdateRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV3 \
    --roleId 'cJuK7uvj' \
    --body '{"permissions": [{"action": 17, "resource": "kintpWqO", "schedAction": 94, "schedCron": "XR0XJ7c2", "schedRange": ["rarGELIW", "CVvaWQG2", "paiuGGNe"]}, {"action": 91, "resource": "VwwioVFv", "schedAction": 90, "schedCron": "CRZt7Sfm", "schedRange": ["Otz7H2OU", "Z7sbGBJN", "KiCk1j69"]}, {"action": 25, "resource": "8fMXzWLp", "schedAction": 97, "schedCron": "gX6FvDfG", "schedRange": ["z7Yd0SLZ", "0teRsrJr", "4h26vgEx"]}]}' \
    > test.out 2>&1
eval_tap $? 236 'AdminUpdateRolePermissionsV3' test.out

#- 237 AdminAddRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV3 \
    --roleId '87jDZ6LF' \
    --body '{"permissions": [{"action": 50, "resource": "DqfhCxxk", "schedAction": 74, "schedCron": "JI8mbC6i", "schedRange": ["83k6s7Ps", "C7rByNVe", "fkUykj8D"]}, {"action": 60, "resource": "gdXUE29g", "schedAction": 21, "schedCron": "htnI9vVf", "schedRange": ["ICDNTQ8y", "05dxBlBF", "YbnkgOo8"]}, {"action": 72, "resource": "uPKgUStH", "schedAction": 60, "schedCron": "krvYzkMl", "schedRange": ["CNLDul99", "yFHj0cxf", "ysBzwrbB"]}]}' \
    > test.out 2>&1
eval_tap $? 237 'AdminAddRolePermissionsV3' test.out

#- 238 AdminDeleteRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV3 \
    --roleId '7ZN3hbFg' \
    --body '["m2EQmQcc", "DlFpR2go", "sfMsFncY"]' \
    > test.out 2>&1
eval_tap $? 238 'AdminDeleteRolePermissionsV3' test.out

#- 239 AdminDeleteRolePermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionV3 \
    --action '25' \
    --resource '7rwwhk9V' \
    --roleId 'zYH8Zh3e' \
    > test.out 2>&1
eval_tap $? 239 'AdminDeleteRolePermissionV3' test.out

#- 240 AdminGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam adminGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 240 'AdminGetMyUserV3' test.out

#- 241 UserAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam userAuthenticationV3 \
    --clientId 'VoYsqqkX' \
    --extendExp  \
    --redirectUri 'g5wBbM0L' \
    --password 'qRn3DrFo' \
    --requestId '1cK8oXTm' \
    --userName '71gmFjsi' \
    > test.out 2>&1
eval_tap $? 241 'UserAuthenticationV3' test.out

#- 242 AuthenticationWithPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV3 \
    --extendExp  \
    --clientId 'ZLT9Fc3l' \
    --linkingToken 'yeuwWsSC' \
    --password '6RVlKo5F' \
    --username 'nzUy2swf' \
    > test.out 2>&1
eval_tap $? 242 'AuthenticationWithPlatformLinkV3' test.out

#- 243 AuthenticateAndLinkForwardV3
./ng net.accelbyte.sdk.cli.Main iam authenticateAndLinkForwardV3 \
    --extendExp  \
    --clientId '7Nyq3nQy' \
    --linkingToken 'M1VCnYxT' \
    --password '2qbWUNSk' \
    --username 'VukltKCK' \
    > test.out 2>&1
eval_tap $? 243 'AuthenticateAndLinkForwardV3' test.out

#- 244 PublicGetSystemConfigV3
./ng net.accelbyte.sdk.cli.Main iam publicGetSystemConfigV3 \
    > test.out 2>&1
eval_tap $? 244 'PublicGetSystemConfigV3' test.out

#- 245 GenerateTokenByNewHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV3 \
    --additionalData 'rvFLrnM3' \
    --extendExp  \
    --linkingToken '27ckHals' \
    > test.out 2>&1
eval_tap $? 245 'GenerateTokenByNewHeadlessAccountV3' test.out

#- 246 RequestOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam requestOneTimeLinkingCodeV3 \
    --redirectUri 'VxxFgsA4' \
    --state 't3sjeQL1' \
    --platformId 'eEzXzXhd' \
    > test.out 2>&1
eval_tap $? 246 'RequestOneTimeLinkingCodeV3' test.out

#- 247 ValidateOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam validateOneTimeLinkingCodeV3 \
    --oneTimeLinkCode 'p0UELh3u' \
    > test.out 2>&1
eval_tap $? 247 'ValidateOneTimeLinkingCodeV3' test.out

#- 248 RequestTokenByOneTimeLinkCodeResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTokenByOneTimeLinkCodeResponseV3 \
    --additionalData '4l3Yfd9N' \
    --isTransient  \
    --clientId '23kj5lXQ' \
    --oneTimeLinkCode 'LhJpM4ct' \
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
    --codeChallenge 'ZoJsooIR' \
    --codeChallengeMethod 'S256' \
    --clientId 'zdRqaLSS' \
    > test.out 2>&1
eval_tap $? 251 'RequestTokenExchangeCodeV3' test.out

#- 252 AdminRetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam adminRetrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '4JpPNqpA' \
    --userId 'aJwS0AS0' \
    --platformUserId 'X7cj17QS' \
    > test.out 2>&1
eval_tap $? 252 'AdminRetrieveUserThirdPartyPlatformTokenV3' test.out

#- 253 RevokeUserV3
./ng net.accelbyte.sdk.cli.Main iam revokeUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '3vPsVP3D' \
    --includeGameNamespace  \
    > test.out 2>&1
eval_tap $? 253 'RevokeUserV3' test.out

#- 254 AuthorizeV3
./ng net.accelbyte.sdk.cli.Main iam authorizeV3 \
    --blockedPlatformId 'Kmdh47R6' \
    --codeChallenge 'yGIrNS7L' \
    --codeChallengeMethod 'S256' \
    --createHeadless  \
    --loginWebBased  \
    --nonce 'KBYZ6Nzq' \
    --oneTimeLinkCode 'CVqy5Gj1' \
    --redirectUri 'wLIJGTi8' \
    --scope '6RijS7hf' \
    --state 'EvtsPzAz' \
    --targetAuthPage 'zheNMfJY' \
    --useRedirectUriAsLoginUrlWhenLocked  \
    --clientId 'mFiGxKpv' \
    --responseType 'code' \
    > test.out 2>&1
eval_tap $? 254 'AuthorizeV3' test.out

#- 255 TokenIntrospectionV3
./ng net.accelbyte.sdk.cli.Main iam tokenIntrospectionV3 \
    --token 'qVZAUb0C' \
    > test.out 2>&1
eval_tap $? 255 'TokenIntrospectionV3' test.out

#- 256 GetJWKSV3
./ng net.accelbyte.sdk.cli.Main iam getJWKSV3 \
    > test.out 2>&1
eval_tap $? 256 'GetJWKSV3' test.out

#- 257 SendMFAAuthenticationCode
./ng net.accelbyte.sdk.cli.Main iam sendMFAAuthenticationCode \
    --clientId 'id6PHZJN' \
    --factor 'pTKId2tA' \
    --mfaToken 'iEm0DPmz' \
    > test.out 2>&1
eval_tap $? 257 'SendMFAAuthenticationCode' test.out

#- 258 Change2faMethod
./ng net.accelbyte.sdk.cli.Main iam change2faMethod \
    --factor 'pybSCKKN' \
    --mfaToken 'ORpi0IS2' \
    > test.out 2>&1
eval_tap $? 258 'Change2faMethod' test.out

#- 259 Verify2faCode
./ng net.accelbyte.sdk.cli.Main iam verify2faCode \
    --code 'PG2s7xgh' \
    --factor 'CyBwGHPd' \
    --mfaToken 'wq9N3Kxg' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 259 'Verify2faCode' test.out

#- 260 Verify2faCodeForward
./ng net.accelbyte.sdk.cli.Main iam verify2faCodeForward \
    --defaultFactor 'gM04JI7N' \
    --factors 'dn1OK9oY' \
    --rememberDevice  \
    --clientId 'bUyZrS24' \
    --code 'ST9GrDcE' \
    --factor '9TY8Cyxs' \
    --mfaToken '0H8Vhb7J' \
    > test.out 2>&1
eval_tap $? 260 'Verify2faCodeForward' test.out

#- 261 RetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam retrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '8ovAcRyx' \
    --userId 'FaV0jbKO' \
    > test.out 2>&1
eval_tap $? 261 'RetrieveUserThirdPartyPlatformTokenV3' test.out

#- 262 AuthCodeRequestV3
./ng net.accelbyte.sdk.cli.Main iam authCodeRequestV3 \
    --platformId 'mI6XO5hx' \
    --clientId '0sC3vgz4' \
    --redirectUri 'lQ8OEdc7' \
    --requestId 'V9rZeaBz' \
    > test.out 2>&1
eval_tap $? 262 'AuthCodeRequestV3' test.out

#- 263 PlatformTokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV3 \
    --platformId 'ri12nEDN' \
    --additionalData 'jT4nmElp' \
    --clientId 'T9XyVksl' \
    --createHeadless  \
    --deviceId 'yi176aRR' \
    --macAddress 'DwyHI7L0' \
    --platformToken 'GuD67tF7' \
    --serviceLabel '0.5959753673147327' \
    --skipSetCookie  \
    > test.out 2>&1
eval_tap $? 263 'PlatformTokenGrantV3' test.out

#- 264 GetRevocationListV3
./ng net.accelbyte.sdk.cli.Main iam getRevocationListV3 \
    > test.out 2>&1
eval_tap $? 264 'GetRevocationListV3' test.out

#- 265 TokenRevocationV3
./ng net.accelbyte.sdk.cli.Main iam tokenRevocationV3 \
    --token 'XJCoDkG0' \
    > test.out 2>&1
eval_tap $? 265 'TokenRevocationV3' test.out

#- 266 SimultaneousLoginV3
./ng net.accelbyte.sdk.cli.Main iam simultaneousLoginV3 \
    --simultaneousPlatform 'pTObAYJH' \
    --simultaneousTicket 'yiQY3ZFe' \
    --nativePlatform 'steam' \
    --nativePlatformTicket '3PMY2sjK' \
    > test.out 2>&1
eval_tap $? 266 'SimultaneousLoginV3' test.out

#- 267 TokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV3 \
    --additionalData 'f3WiU87k' \
    --clientId 'tsSyMXFt' \
    --clientSecret 'l6jDrki3' \
    --code 'k0Wp7ElO' \
    --codeVerifier 'zonnvlhu' \
    --extendNamespace 'FG33Onns' \
    --extendExp  \
    --password '2MbRIZgS' \
    --redirectUri 'BoK3eYXU' \
    --refreshToken '4BYWKlpx' \
    --scope 'UjGSwAHl' \
    --username 'kiR3G04P' \
    --grantType 'refresh_token' \
    > test.out 2>&1
eval_tap $? 267 'TokenGrantV3' test.out

#- 268 VerifyTokenV3
./ng net.accelbyte.sdk.cli.Main iam verifyTokenV3 \
    --token 'IGWSyPqx' \
    > test.out 2>&1
eval_tap $? 268 'VerifyTokenV3' test.out

#- 269 PlatformAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticationV3 \
    --platformId 'gNh3K4lN' \
    --code 'moiqUnpb' \
    --error 'R4l5UCjz' \
    --openidAssocHandle 'cfKWEf2N' \
    --openidClaimedId 'FFce3PEx' \
    --openidIdentity 'sMbGeI0Q' \
    --openidMode 'PX2jCnkG' \
    --openidNs 'doVLYNxl' \
    --openidOpEndpoint 'YWvT0Nxo' \
    --openidResponseNonce 'frHfQLyv' \
    --openidReturnTo 'LSqu8miL' \
    --openidSig '0Kc0NsGN' \
    --openidSigned 'UOLT9xR5' \
    --state 'P4TW8Cto' \
    > test.out 2>&1
eval_tap $? 269 'PlatformAuthenticationV3' test.out

#- 270 PlatformTokenRefreshV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenRefreshV3 \
    --platformId '8r0GfEoQ' \
    --platformToken 'imthMMvR' \
    > test.out 2>&1
eval_tap $? 270 'PlatformTokenRefreshV3' test.out

#- 271 PublicGetInputValidations
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidations \
    --defaultOnEmpty  \
    --languageCode 'kgoSRUZ8' \
    > test.out 2>&1
eval_tap $? 271 'PublicGetInputValidations' test.out

#- 272 PublicGetInputValidationByField
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidationByField \
    --field '06xT5Tv4' \
    > test.out 2>&1
eval_tap $? 272 'PublicGetInputValidationByField' test.out

#- 273 PublicGetCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam publicGetCountryAgeRestrictionV3 \
    --countryCode '08UKt9Ms' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 273 'PublicGetCountryAgeRestrictionV3' test.out

#- 274 PublicGetConfigValueV3
./ng net.accelbyte.sdk.cli.Main iam publicGetConfigValueV3 \
    --configKey 'b03BDgcT' \
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
    --clientId 'cyvEs6PY' \
    > test.out 2>&1
eval_tap $? 277 'RetrieveActiveOIDCClientsPublicV3' test.out

#- 278 PublicListUserIDByPlatformUserIDsV3
eval_tap 0 278 'PublicListUserIDByPlatformUserIDsV3 # SKIP deprecated' test.out

#- 279 PublicGetUserByPlatformUserIDV3
eval_tap 0 279 'PublicGetUserByPlatformUserIDV3 # SKIP deprecated' test.out

#- 280 PublicGetProfileUpdateStrategyV3
./ng net.accelbyte.sdk.cli.Main iam publicGetProfileUpdateStrategyV3 \
    --namespace "$AB_NAMESPACE" \
    --field 'country' \
    > test.out 2>&1
eval_tap $? 280 'PublicGetProfileUpdateStrategyV3' test.out

#- 281 PublicGetAsyncStatus
./ng net.accelbyte.sdk.cli.Main iam publicGetAsyncStatus \
    --namespace "$AB_NAMESPACE" \
    --requestId 'TRUYff9D' \
    > test.out 2>&1
eval_tap $? 281 'PublicGetAsyncStatus' test.out

#- 282 PublicSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam publicSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'BdteLiIh' \
    --limit '68' \
    --offset '44' \
    --platformBy 'Yi8TDesp' \
    --platformId 'BL92LLI3' \
    --query 'vdfhRobr' \
    > test.out 2>&1
eval_tap $? 282 'PublicSearchUserV3' test.out

#- 283 PublicCreateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "Dyf4pjmN", "acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "dgmPJyh6", "policyId": "1eePN67g", "policyVersionId": "3I1dkJw9"}, {"isAccepted": false, "localizedPolicyVersionId": "ack62iZn", "policyId": "t9uFXgns", "policyVersionId": "4mwMl2sv"}, {"isAccepted": true, "localizedPolicyVersionId": "06v9JO2v", "policyId": "SyiQPVeo", "policyVersionId": "lwAbQ5V9"}], "authType": "zVIqQepz", "code": "yrhem7W4", "country": "JfXeop4s", "dateOfBirth": "4WLu3JAT", "displayName": "LxsYuhb8", "emailAddress": "ZbqICr7D", "password": "7KHCZtpf", "reachMinimumAge": false, "uniqueDisplayName": "NHpmKwCS"}' \
    > test.out 2>&1
eval_tap $? 283 'PublicCreateUserV3' test.out

#- 284 CheckUserAvailability
./ng net.accelbyte.sdk.cli.Main iam checkUserAvailability \
    --namespace "$AB_NAMESPACE" \
    --field 'C4jZd10x' \
    --query 'fqt3fLUT' \
    > test.out 2>&1
eval_tap $? 284 'CheckUserAvailability' test.out

#- 285 PublicBulkGetUsers
eval_tap 0 285 'PublicBulkGetUsers # SKIP deprecated' test.out

#- 286 PublicSendRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicSendRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "2K8Nbndk", "languageTag": "I8OgULLF"}' \
    > test.out 2>&1
eval_tap $? 286 'PublicSendRegistrationCode' test.out

#- 287 PublicVerifyRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicVerifyRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "YZObFWy0", "emailAddress": "NI9ZhahZ"}' \
    > test.out 2>&1
eval_tap $? 287 'PublicVerifyRegistrationCode' test.out

#- 288 PublicForgotPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicForgotPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "84tEOGPX", "languageTag": "7Ae8YMrS"}' \
    > test.out 2>&1
eval_tap $? 288 'PublicForgotPasswordV3' test.out

#- 289 PublicValidateUserInput
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserInput \
    --namespace "$AB_NAMESPACE" \
    --body '{"displayName": "UeJdO14b", "password": "GDGwhDTu", "uniqueDisplayName": "LLzKM2CU", "username": "Dd7lmt6e"}' \
    > test.out 2>&1
eval_tap $? 289 'PublicValidateUserInput' test.out

#- 290 GetAdminInvitationV3
./ng net.accelbyte.sdk.cli.Main iam getAdminInvitationV3 \
    --invitationId 'keIent2T' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 290 'GetAdminInvitationV3' test.out

#- 291 CreateUserFromInvitationV3
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV3 \
    --invitationId 'YlndPRJ1' \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "O9JhBnrD", "acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "ZgwH62Ir", "policyId": "rZSYjhb3", "policyVersionId": "vBqBhI3F"}, {"isAccepted": true, "localizedPolicyVersionId": "7XGtDDw1", "policyId": "swv2Mxy8", "policyVersionId": "FgGGsvqE"}, {"isAccepted": false, "localizedPolicyVersionId": "0x9vYPsF", "policyId": "7Xk5Fl1r", "policyVersionId": "iFem7A5W"}], "authType": "DYLXxGNn", "code": "e5VNbc4b", "country": "8l7k1vys", "dateOfBirth": "yuDLM4mg", "displayName": "WttPShii", "emailAddress": "HJtLSuDx", "password": "MZQY0TU5", "reachMinimumAge": false, "uniqueDisplayName": "PO7Au91r"}' \
    > test.out 2>&1
eval_tap $? 291 'CreateUserFromInvitationV3' test.out

#- 292 UpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam updateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "9V3Pm6Zf", "country": "DfyGF0gv", "dateOfBirth": "7kwu09O9", "displayName": "HxfJzEle", "languageTag": "oWRyv4j3", "uniqueDisplayName": "syMA6yG9", "userName": "lS2OAoRO"}' \
    > test.out 2>&1
eval_tap $? 292 'UpdateUserV3' test.out

#- 293 PublicPartialUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicPartialUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "ekdPyCpN", "country": "8wTJOrFw", "dateOfBirth": "E120gufg", "displayName": "TjuskaJk", "languageTag": "j7F05sqI", "uniqueDisplayName": "Z2SpVhH8", "userName": "IVGfI4PN"}' \
    > test.out 2>&1
eval_tap $? 293 'PublicPartialUpdateUserV3' test.out

#- 294 PublicSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"context": "u5yeqsZH", "emailAddress": "83ql1mYA", "languageTag": "NdtDwyu5", "upgradeToken": "Tx76hD8R"}' \
    > test.out 2>&1
eval_tap $? 294 'PublicSendVerificationCodeV3' test.out

#- 295 PublicUserVerificationV3
./ng net.accelbyte.sdk.cli.Main iam publicUserVerificationV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "368tvUhE", "contactType": "6Ak8OMso", "languageTag": "mDOKboko", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 295 'PublicUserVerificationV3' test.out

#- 296 PublicUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "jBZELqIg", "country": "4FYTBp31", "dateOfBirth": "vzP1RtBo", "displayName": "dBjyRdP6", "emailAddress": "uizG8Wvo", "password": "8GutObGY", "uniqueDisplayName": "yAmwK9mz", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 296 'PublicUpgradeHeadlessAccountV3' test.out

#- 297 PublicVerifyHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --needVerificationCode  \
    --body '{"emailAddress": "967sJqtf", "password": "gkYyrHSs"}' \
    > test.out 2>&1
eval_tap $? 297 'PublicVerifyHeadlessAccountV3' test.out

#- 298 PublicUpdatePasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicUpdatePasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"languageTag": "yqbZOTWn", "mfaToken": "DdYN1MOB", "newPassword": "zpoIeKtp", "oldPassword": "TYrxp8sD"}' \
    > test.out 2>&1
eval_tap $? 298 'PublicUpdatePasswordV3' test.out

#- 299 PublicCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam publicCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'eaEJMizB' \
    > test.out 2>&1
eval_tap $? 299 'PublicCreateJusticeUser' test.out

#- 300 PublicPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'mXQNopkA' \
    --redirectUri 'rKM7YJO2' \
    --ticket 'NDvZMTgC' \
    > test.out 2>&1
eval_tap $? 300 'PublicPlatformLinkV3' test.out

#- 301 PublicPlatformUnlinkV3
eval_tap 0 301 'PublicPlatformUnlinkV3 # SKIP deprecated' test.out

#- 302 PublicPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '9PRhgp6u' \
    > test.out 2>&1
eval_tap $? 302 'PublicPlatformUnlinkAllV3' test.out

#- 303 PublicForcePlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicForcePlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'oraXFeg6' \
    --ticket 'kdgCXK9l' \
    > test.out 2>&1
eval_tap $? 303 'PublicForcePlatformLinkV3' test.out

#- 304 PublicWebLinkPlatform
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatform \
    --namespace "$AB_NAMESPACE" \
    --platformId 'DK1DJ5qR' \
    --clientId 'u8QYeqes' \
    --redirectUri 'WuAjK1HO' \
    > test.out 2>&1
eval_tap $? 304 'PublicWebLinkPlatform' test.out

#- 305 PublicWebLinkPlatformEstablish
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatformEstablish \
    --namespace "$AB_NAMESPACE" \
    --platformId 'MpBEx87u' \
    --code 'kV41gjnt' \
    --state 'JmpNNzUa' \
    > test.out 2>&1
eval_tap $? 305 'PublicWebLinkPlatformEstablish' test.out

#- 306 PublicProcessWebLinkPlatformV3
./ng net.accelbyte.sdk.cli.Main iam publicProcessWebLinkPlatformV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'TKR2MRqq' \
    --code 'VzdhtH7t' \
    --state 'NkuU5KY2' \
    > test.out 2>&1
eval_tap $? 306 'PublicProcessWebLinkPlatformV3' test.out

#- 307 PublicGetUsersPlatformInfosV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUsersPlatformInfosV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"platformId": "rO52AlMy", "userIds": ["sPlvUlMC", "lAblugKc", "Lx1HiKiL"]}' \
    > test.out 2>&1
eval_tap $? 307 'PublicGetUsersPlatformInfosV3' test.out

#- 308 ResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam resetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientId": "SECj5V72", "code": "4g32FWJt", "emailAddress": "MF4hyNkZ", "languageTag": "DpJuuxaD", "newPassword": "9oixoZjh"}' \
    > test.out 2>&1
eval_tap $? 308 'ResetPasswordV3' test.out

#- 309 PublicGetUserByUserIdV3
eval_tap 0 309 'PublicGetUserByUserIdV3 # SKIP deprecated' test.out

#- 310 PublicGetUserBanHistoryV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserBanHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'q73ndYPT' \
    --activeOnly  \
    --limit '14' \
    --offset '95' \
    > test.out 2>&1
eval_tap $? 310 'PublicGetUserBanHistoryV3' test.out

#- 311 PublicListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'oKPAd033' \
    > test.out 2>&1
eval_tap $? 311 'PublicListUserAllPlatformAccountsDistinctV3' test.out

#- 312 PublicGetUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'aLf2QVBk' \
    > test.out 2>&1
eval_tap $? 312 'PublicGetUserInformationV3' test.out

#- 313 PublicGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '4Ln2hKpj' \
    --after '0.44656921722646115' \
    --before '0.02759637904039014' \
    --limit '23' \
    > test.out 2>&1
eval_tap $? 313 'PublicGetUserLoginHistoriesV3' test.out

#- 314 PublicGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'dwMXmmh2' \
    --after 'ti7EMCir' \
    --before 'GfmGxpsu' \
    --limit '63' \
    --platformId 'tUfScFUt' \
    > test.out 2>&1
eval_tap $? 314 'PublicGetUserPlatformAccountsV3' test.out

#- 315 PublicListJusticePlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicListJusticePlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '7Dda9LMM' \
    > test.out 2>&1
eval_tap $? 315 'PublicListJusticePlatformAccountsV3' test.out

#- 316 PublicLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam publicLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'ILlwdjD0' \
    --body '{"platformId": "bqQ6xdjP", "platformUserId": "5AftX3EI"}' \
    > test.out 2>&1
eval_tap $? 316 'PublicLinkPlatformAccount' test.out

#- 317 PublicForceLinkPlatformWithProgression
./ng net.accelbyte.sdk.cli.Main iam publicForceLinkPlatformWithProgression \
    --namespace "$AB_NAMESPACE" \
    --userId 'xCXd4ltX' \
    --body '{"chosenNamespaces": ["KeA8mLOy", "GawaeMJo", "nhp6f5fd"], "requestId": "vTn8YJYX"}' \
    > test.out 2>&1
eval_tap $? 317 'PublicForceLinkPlatformWithProgression' test.out

#- 318 PublicGetPublisherUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetPublisherUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'soqbbJaU' \
    > test.out 2>&1
eval_tap $? 318 'PublicGetPublisherUserV3' test.out

#- 319 PublicValidateUserByUserIDAndPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserByUserIDAndPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Dh2tnTgX' \
    --password 't6aaNqoe' \
    > test.out 2>&1
eval_tap $? 319 'PublicValidateUserByUserIDAndPasswordV3' test.out

#- 320 PublicGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRolesV3 \
    --after 'JAgAKB5E' \
    --before 'eAwuEkEQ' \
    --isWildcard  \
    --limit '65' \
    > test.out 2>&1
eval_tap $? 320 'PublicGetRolesV3' test.out

#- 321 PublicGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRoleV3 \
    --roleId 'FL5xicSD' \
    > test.out 2>&1
eval_tap $? 321 'PublicGetRoleV3' test.out

#- 322 PublicForgotPasswordWithoutNamespaceV3
./ng net.accelbyte.sdk.cli.Main iam publicForgotPasswordWithoutNamespaceV3 \
    --body '{"clientId": "pw2Ihsfb", "emailAddress": "WNPk4P8d", "languageTag": "mGgd4dcL"}' \
    > test.out 2>&1
eval_tap $? 322 'PublicForgotPasswordWithoutNamespaceV3' test.out

#- 323 PublicGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyUserV3 \
    --includeAllPlatforms  \
    > test.out 2>&1
eval_tap $? 323 'PublicGetMyUserV3' test.out

#- 324 PublicSendCodeForwardV3
./ng net.accelbyte.sdk.cli.Main iam publicSendCodeForwardV3 \
    --body '{"context": "z62DrK3B", "emailAddress": "YxIyCNbl", "languageTag": "8vqemCcF", "upgradeToken": "uz9t30ey"}' \
    > test.out 2>&1
eval_tap $? 324 'PublicSendCodeForwardV3' test.out

#- 325 PublicGetLinkHeadlessAccountToMyAccountConflictV3
./ng net.accelbyte.sdk.cli.Main iam publicGetLinkHeadlessAccountToMyAccountConflictV3 \
    --oneTimeLinkCode 'ed58h5Yz' \
    > test.out 2>&1
eval_tap $? 325 'PublicGetLinkHeadlessAccountToMyAccountConflictV3' test.out

#- 326 LinkHeadlessAccountToMyAccountV3
./ng net.accelbyte.sdk.cli.Main iam linkHeadlessAccountToMyAccountV3 \
    --body '{"chosenNamespaces": ["xKVF80Vu", "ec4vUQ2C", "nBewx23M"], "oneTimeLinkCode": "xSg1tN50"}' \
    > test.out 2>&1
eval_tap $? 326 'LinkHeadlessAccountToMyAccountV3' test.out

#- 327 PublicGetMyRedirectionAfterLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyRedirectionAfterLinkV3 \
    --oneTimeLinkCode 'S5gC0xvm' \
    > test.out 2>&1
eval_tap $? 327 'PublicGetMyRedirectionAfterLinkV3' test.out

#- 328 PublicGetMyProfileAllowUpdateStatusV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyProfileAllowUpdateStatusV3 \
    > test.out 2>&1
eval_tap $? 328 'PublicGetMyProfileAllowUpdateStatusV3' test.out

#- 329 PublicSendVerificationLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationLinkV3 \
    --body '{"languageTag": "q6niT7Xk"}' \
    > test.out 2>&1
eval_tap $? 329 'PublicSendVerificationLinkV3' test.out

#- 330 PublicGetOpenidUserInfoV3
./ng net.accelbyte.sdk.cli.Main iam publicGetOpenidUserInfoV3 \
    > test.out 2>&1
eval_tap $? 330 'PublicGetOpenidUserInfoV3' test.out

#- 331 PublicVerifyUserByLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyUserByLinkV3 \
    --code 'rnlq5q6K' \
    > test.out 2>&1
eval_tap $? 331 'PublicVerifyUserByLinkV3' test.out

#- 332 PlatformAuthenticateSAMLV3Handler
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticateSAMLV3Handler \
    --platformId 'wTTFdI4g' \
    --code 'Pbp0GXOY' \
    --error 'TTBWbvzD' \
    --state 'OT0bK5M1' \
    > test.out 2>&1
eval_tap $? 332 'PlatformAuthenticateSAMLV3Handler' test.out

#- 333 LoginSSOClient
./ng net.accelbyte.sdk.cli.Main iam loginSSOClient \
    --platformId 'tlUtd15b' \
    --payload 'dhPwjVjw' \
    > test.out 2>&1
eval_tap $? 333 'LoginSSOClient' test.out

#- 334 LogoutSSOClient
./ng net.accelbyte.sdk.cli.Main iam logoutSSOClient \
    --platformId 'iM8LxzJN' \
    > test.out 2>&1
eval_tap $? 334 'LogoutSSOClient' test.out

#- 335 RequestTargetTokenResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTargetTokenResponseV3 \
    --additionalData 'JRnKRFat' \
    --code '4OsNHpWJ' \
    > test.out 2>&1
eval_tap $? 335 'RequestTargetTokenResponseV3' test.out

#- 336 UpgradeAndAuthenticateForwardV3
./ng net.accelbyte.sdk.cli.Main iam upgradeAndAuthenticateForwardV3 \
    --clientId 'N68qvoON' \
    --upgradeSuccessToken 'lahigqFM' \
    > test.out 2>&1
eval_tap $? 336 'UpgradeAndAuthenticateForwardV3' test.out

#- 337 AdminListInvitationHistoriesV4
./ng net.accelbyte.sdk.cli.Main iam adminListInvitationHistoriesV4 \
    --limit '55' \
    --namespace "$AB_NAMESPACE" \
    --offset '69' \
    > test.out 2>&1
eval_tap $? 337 'AdminListInvitationHistoriesV4' test.out

#- 338 AdminGetDevicesByUserV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDevicesByUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'DMJNf5fi' \
    > test.out 2>&1
eval_tap $? 338 'AdminGetDevicesByUserV4' test.out

#- 339 AdminGetBannedDevicesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedDevicesV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceType 'gYWgfufL' \
    --endDate 'KE01WyAA' \
    --limit '51' \
    --offset '48' \
    --startDate 'A2Yc5K8p' \
    > test.out 2>&1
eval_tap $? 339 'AdminGetBannedDevicesV4' test.out

#- 340 AdminGetUserDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeviceBansV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'EACStpv2' \
    > test.out 2>&1
eval_tap $? 340 'AdminGetUserDeviceBansV4' test.out

#- 341 AdminBanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminBanDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"comment": "kjcP0oB5", "deviceId": "xVbtu8H8", "deviceType": "BBebsydK", "enabled": true, "endDate": "WRGpGGuM", "ext": {"pXfY0Oy4": {}, "OciYcbaV": {}, "hkjuREDT": {}}, "reason": "RPEm9AaB"}' \
    > test.out 2>&1
eval_tap $? 341 'AdminBanDeviceV4' test.out

#- 342 AdminGetDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBanV4 \
    --banId 'DECgeW39' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 342 'AdminGetDeviceBanV4' test.out

#- 343 AdminUpdateDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateDeviceBanV4 \
    --banId 'rlISawmu' \
    --namespace "$AB_NAMESPACE" \
    --body '{"enabled": true}' \
    > test.out 2>&1
eval_tap $? 343 'AdminUpdateDeviceBanV4' test.out

#- 344 AdminGenerateReportV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateReportV4 \
    --namespace "$AB_NAMESPACE" \
    --endDate 'vi1uiStv' \
    --startDate 'ZEfOKCln' \
    --deviceType 'MkTK2kbF' \
    > test.out 2>&1
eval_tap $? 344 'AdminGenerateReportV4' test.out

#- 345 AdminGetDeviceTypesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceTypesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 345 'AdminGetDeviceTypesV4' test.out

#- 346 AdminGetDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBansV4 \
    --deviceId 'FMog6Kzq' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 346 'AdminGetDeviceBansV4' test.out

#- 347 AdminDecryptDeviceV4
eval_tap 0 347 'AdminDecryptDeviceV4 # SKIP deprecated' test.out

#- 348 AdminUnbanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminUnbanDeviceV4 \
    --deviceId 'ocI4xoqi' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 348 'AdminUnbanDeviceV4' test.out

#- 349 AdminGetUsersByDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUsersByDeviceV4 \
    --deviceId 'eu18wLaT' \
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
    --limit '53' \
    --offset '55' \
    > test.out 2>&1
eval_tap $? 351 'AdminGetNamespaceUserInvitationHistoryV4' test.out

#- 352 AdminCreateTestUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateTestUsersV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "rQEVX2LS", "policyId": "WrTVGTli", "policyVersionId": "WIplRwid"}, {"isAccepted": false, "localizedPolicyVersionId": "6NKF2mEM", "policyId": "gpPHrOlJ", "policyVersionId": "2H9e7xiV"}, {"isAccepted": false, "localizedPolicyVersionId": "WaauiyQF", "policyId": "kNC2sJRO", "policyVersionId": "WjxDs6ul"}], "count": 76, "userInfo": {"country": "PEBYwCkk"}}' \
    > test.out 2>&1
eval_tap $? 352 'AdminCreateTestUsersV4' test.out

#- 353 AdminCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "ksImkPQq", "policyId": "GJxXpDvA", "policyVersionId": "Z1dnLCZa"}, {"isAccepted": false, "localizedPolicyVersionId": "wv52VoyI", "policyId": "UK74Exhf", "policyVersionId": "oTV4W7AY"}, {"isAccepted": false, "localizedPolicyVersionId": "8OSzyfVl", "policyId": "VsgNiHhs", "policyVersionId": "OsOeOfT6"}], "authType": "EMAILPASSWD", "code": "PUENG7jN", "country": "gvY85ZwQ", "dateOfBirth": "8YVktWjU", "displayName": "t5o5rWF0", "emailAddress": "ISAlcaco", "password": "jsNUi0Nw", "passwordMD5Sum": "73PmYK8D", "reachMinimumAge": false, "uniqueDisplayName": "Q4cBwMzj", "username": "Q3yZhW3w"}' \
    > test.out 2>&1
eval_tap $? 353 'AdminCreateUserV4' test.out

#- 354 AdminBulkUpdateUserAccountTypeV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateUserAccountTypeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"testAccount": false, "userIds": ["TAxNZdz0", "0zFuslha", "qs23GFTg"]}' \
    > test.out 2>&1
eval_tap $? 354 'AdminBulkUpdateUserAccountTypeV4' test.out

#- 355 AdminBulkCheckValidUserIDV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkCheckValidUserIDV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["iqjpCzj2", "duyfZhFQ", "QALNi36z"]}' \
    > test.out 2>&1
eval_tap $? 355 'AdminBulkCheckValidUserIDV4' test.out

#- 356 AdminUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'mRQHPGXL' \
    --body '{"avatarUrl": "jmlQBsBE", "country": "xyVqt1uh", "dateOfBirth": "JFy1AH5j", "displayName": "JmG13OEc", "languageTag": "kJ3YCBCd", "skipLoginQueue": false, "tags": ["BceEtNMK", "AGWB0LzY", "oDBUoC8u"], "uniqueDisplayName": "ExkaAR9J", "userName": "6l1KTuhg"}' \
    > test.out 2>&1
eval_tap $? 356 'AdminUpdateUserV4' test.out

#- 357 AdminUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'qmKmm7o1' \
    --body '{"code": "P8zUrlQ6", "emailAddress": "0A2CBaSC"}' \
    > test.out 2>&1
eval_tap $? 357 'AdminUpdateUserEmailAddressV4' test.out

#- 358 AdminDisableUserMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableUserMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'kJD6uGrY' \
    --body '{"factor": "Icl0Sef8", "mfaToken": "TriSI1aQ"}' \
    > test.out 2>&1
eval_tap $? 358 'AdminDisableUserMFAV4' test.out

#- 359 AdminGetUserMFAStatusV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUserMFAStatusV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '2FMPilbQ' \
    > test.out 2>&1
eval_tap $? 359 'AdminGetUserMFAStatusV4' test.out

#- 360 AdminListUserRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminListUserRolesV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'mb8JnoHg' \
    > test.out 2>&1
eval_tap $? 360 'AdminListUserRolesV4' test.out

#- 361 AdminUpdateUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'IrGSborX' \
    --body '{"assignedNamespaces": ["f5mNCCKx", "aYa9eM41", "cgfOr0JK"], "roleId": "RorcRXi5"}' \
    > test.out 2>&1
eval_tap $? 361 'AdminUpdateUserRoleV4' test.out

#- 362 AdminAddUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'm5jZumpj' \
    --body '{"assignedNamespaces": ["okjHCmCB", "ewimkqhe", "EE2PqokW"], "roleId": "KNAv6Cwa"}' \
    > test.out 2>&1
eval_tap $? 362 'AdminAddUserRoleV4' test.out

#- 363 AdminRemoveUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRemoveUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'WlvrWrWG' \
    --body '{"assignedNamespaces": ["I6oOQWnf", "Bg01hEfw", "YIAsi4o2"], "roleId": "TeCaGTgG"}' \
    > test.out 2>&1
eval_tap $? 363 'AdminRemoveUserRoleV4' test.out

#- 364 AdminGetRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV4 \
    --adminRole  \
    --isWildcard  \
    --limit '57' \
    --offset '20' \
    > test.out 2>&1
eval_tap $? 364 'AdminGetRolesV4' test.out

#- 365 AdminCreateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV4 \
    --body '{"adminRole": true, "deletable": false, "isWildcard": false, "roleName": "xxxAh7Lu"}' \
    > test.out 2>&1
eval_tap $? 365 'AdminCreateRoleV4' test.out

#- 366 AdminGetRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV4 \
    --roleId 'smqenRBc' \
    > test.out 2>&1
eval_tap $? 366 'AdminGetRoleV4' test.out

#- 367 AdminDeleteRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV4 \
    --roleId 'hHEHp0vH' \
    > test.out 2>&1
eval_tap $? 367 'AdminDeleteRoleV4' test.out

#- 368 AdminUpdateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV4 \
    --roleId 'KPUKkiK6' \
    --body '{"adminRole": true, "deletable": true, "isWildcard": false, "roleName": "S07deRSE"}' \
    > test.out 2>&1
eval_tap $? 368 'AdminUpdateRoleV4' test.out

#- 369 AdminUpdateRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV4 \
    --roleId 'OjurgUcq' \
    --body '{"permissions": [{"action": 53, "resource": "4OtzVKF4", "schedAction": 97, "schedCron": "FtvacWFm", "schedRange": ["P2hhg6sn", "HXbYyHtN", "qRudggp0"]}, {"action": 39, "resource": "aczSuGi5", "schedAction": 92, "schedCron": "nKdMib0B", "schedRange": ["FLziU91r", "sb1Rc9W7", "Tam1j79o"]}, {"action": 65, "resource": "K5QhGMCl", "schedAction": 9, "schedCron": "FNB9SRwv", "schedRange": ["CA5dtqlm", "ywEqSAyV", "aJNvujmc"]}]}' \
    > test.out 2>&1
eval_tap $? 369 'AdminUpdateRolePermissionsV4' test.out

#- 370 AdminAddRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV4 \
    --roleId 'mHeQYO23' \
    --body '{"permissions": [{"action": 99, "resource": "KSASdepc", "schedAction": 52, "schedCron": "EVYhJ1rZ", "schedRange": ["ms4QSOc9", "GR7v9Yf5", "RUqk6tYP"]}, {"action": 85, "resource": "yXI0ih9k", "schedAction": 30, "schedCron": "n2ZjCEUv", "schedRange": ["N5hBF30g", "L5gAR8Qn", "dhNnMT4g"]}, {"action": 22, "resource": "X4s2NFcC", "schedAction": 70, "schedCron": "qyptuTIS", "schedRange": ["ySkfoMZy", "m5DuahHI", "Kw3SqdMW"]}]}' \
    > test.out 2>&1
eval_tap $? 370 'AdminAddRolePermissionsV4' test.out

#- 371 AdminDeleteRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV4 \
    --roleId '77YJ0BTi' \
    --body '["KvzaRKhU", "wCdjFpRa", "rYYOPPIB"]' \
    > test.out 2>&1
eval_tap $? 371 'AdminDeleteRolePermissionsV4' test.out

#- 372 AdminListAssignedUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminListAssignedUsersV4 \
    --roleId 'jSDlJ0MA' \
    --after 'rKzRI1pI' \
    --before 'VrX28bna' \
    --limit '63' \
    > test.out 2>&1
eval_tap $? 372 'AdminListAssignedUsersV4' test.out

#- 373 AdminAssignUserToRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAssignUserToRoleV4 \
    --roleId 'CC8OXWdy' \
    --body '{"assignedNamespaces": ["S1vFDDSF", "f3BcrMMj", "kc6wPJJQ"], "namespace": "OcgDXZTb", "userId": "Iym53xaz"}' \
    > test.out 2>&1
eval_tap $? 373 'AdminAssignUserToRoleV4' test.out

#- 374 AdminRevokeUserFromRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRevokeUserFromRoleV4 \
    --roleId 'TCQJBNiS' \
    --body '{"namespace": "gLdBtQZi", "userId": "NrTCkAmc"}' \
    > test.out 2>&1
eval_tap $? 374 'AdminRevokeUserFromRoleV4' test.out

#- 375 AdminInviteUserNewV4
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserNewV4 \
    --body '{"assignedNamespaces": ["l2sMP8RP", "day2q5qn", "hXIHA2iW"], "emailAddresses": ["1oCYr2Ur", "mXUdyJIs", "LjlISe3I"], "isAdmin": true, "isNewStudio": true, "languageTag": "sJok93f0", "namespace": "yFhqIhVG", "roleId": "jnMWJlt8"}' \
    > test.out 2>&1
eval_tap $? 375 'AdminInviteUserNewV4' test.out

#- 376 AdminUpdateMyUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateMyUserV4 \
    --body '{"avatarUrl": "SOyqqJMw", "country": "Jw2xyufj", "dateOfBirth": "QdQx8qmj", "displayName": "GFQAMCi5", "languageTag": "YVBavZSs", "skipLoginQueue": true, "tags": ["VaadZdX7", "dRkvNRoX", "IWkQNMRB"], "uniqueDisplayName": "6ATyRXXp", "userName": "ZI9TSRnU"}' \
    > test.out 2>&1
eval_tap $? 376 'AdminUpdateMyUserV4' test.out

#- 377 AdminDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyAuthenticatorV4 \
    --body '{"factor": "lsWrxMRC", "mfaToken": "cZ2wyrBo"}' \
    > test.out 2>&1
eval_tap $? 377 'AdminDisableMyAuthenticatorV4' test.out

#- 378 AdminEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyAuthenticatorV4 \
    --code '9KzxW3Xf' \
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
    --body '{"factor": "IClE9arL", "mfaToken": "Mnq4xnqw"}' \
    > test.out 2>&1
eval_tap $? 382 'AdminDisableMyBackupCodesV4' test.out

#- 383 AdminDownloadMyBackupCodesV4
eval_tap 0 383 'AdminDownloadMyBackupCodesV4 # SKIP deprecated' test.out

#- 384 AdminEnableMyBackupCodesV4
eval_tap 0 384 'AdminEnableMyBackupCodesV4 # SKIP deprecated' test.out

#- 385 AdminGetBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBackupCodesV4 \
    --languageTag 'q3lZvYJ0' \
    > test.out 2>&1
eval_tap $? 385 'AdminGetBackupCodesV4' test.out

#- 386 AdminGenerateBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateBackupCodesV4 \
    --languageTag 'pJn2Ff8W' \
    > test.out 2>&1
eval_tap $? 386 'AdminGenerateBackupCodesV4' test.out

#- 387 AdminEnableBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableBackupCodesV4 \
    --languageTag '6B8pTojP' \
    > test.out 2>&1
eval_tap $? 387 'AdminEnableBackupCodesV4' test.out

#- 388 AdminChallengeMyMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminChallengeMyMFAV4 \
    --code '49a1qktA' \
    --factor '8fMJeZUd' \
    > test.out 2>&1
eval_tap $? 388 'AdminChallengeMyMFAV4' test.out

#- 389 AdminSendMyMFAEmailCodeV4
./ng net.accelbyte.sdk.cli.Main iam adminSendMyMFAEmailCodeV4 \
    --action 'jD0H4KjZ' \
    --languageTag 'SICZaGNU' \
    > test.out 2>&1
eval_tap $? 389 'AdminSendMyMFAEmailCodeV4' test.out

#- 390 AdminDisableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyEmailV4 \
    --body '{"factor": "53xEHkxf", "mfaToken": "usceJ7ao"}' \
    > test.out 2>&1
eval_tap $? 390 'AdminDisableMyEmailV4' test.out

#- 391 AdminEnableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyEmailV4 \
    --code 'Ge2iW3hr' \
    > test.out 2>&1
eval_tap $? 391 'AdminEnableMyEmailV4' test.out

#- 392 AdminGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyEnabledFactorsV4 \
    > test.out 2>&1
eval_tap $? 392 'AdminGetMyEnabledFactorsV4' test.out

#- 393 AdminMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam adminMakeFactorMyDefaultV4 \
    --factor 'oSjfBIvU' \
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
    --clientId 'y6efQiWe' \
    --linkingToken 'Dwwp01ZH' \
    --password 'x004fMgO' \
    --username 'ehELqiFk' \
    > test.out 2>&1
eval_tap $? 397 'AuthenticationWithPlatformLinkV4' test.out

#- 398 GenerateTokenByNewHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV4 \
    --additionalData 'vqlsFGnT' \
    --extendExp  \
    --linkingToken 'T2UMDWuN' \
    > test.out 2>&1
eval_tap $? 398 'GenerateTokenByNewHeadlessAccountV4' test.out

#- 399 Verify2faCodeV4
./ng net.accelbyte.sdk.cli.Main iam verify2faCodeV4 \
    --code 'eA9zHqLH' \
    --factor 'y4FKXNPU' \
    --mfaToken 'csjYlpVY' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 399 'Verify2faCodeV4' test.out

#- 400 PlatformTokenGrantV4
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV4 \
    --platformId 'NDNyIqS3' \
    --codeChallenge 'gY0BC7cf' \
    --codeChallengeMethod 'plain' \
    --additionalData 'QSDXsVy3' \
    --clientId 'LrFwXMfK' \
    --createHeadless  \
    --deviceId 'lgFgShbi' \
    --macAddress '4x35BHc9' \
    --platformToken 'ppIwlqGy' \
    --serviceLabel '0.4645072146943111' \
    --skipSetCookie  \
    > test.out 2>&1
eval_tap $? 400 'PlatformTokenGrantV4' test.out

#- 401 SimultaneousLoginV4
./ng net.accelbyte.sdk.cli.Main iam simultaneousLoginV4 \
    --codeChallenge 'meZF17gt' \
    --codeChallengeMethod 'plain' \
    --simultaneousPlatform 'GggkhOPL' \
    --simultaneousTicket '0E6PZxN9' \
    --nativePlatform 'epicgames' \
    --nativePlatformTicket 'r8Zxu3FG' \
    > test.out 2>&1
eval_tap $? 401 'SimultaneousLoginV4' test.out

#- 402 TokenGrantV4
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV4 \
    --codeChallenge 'IiyioURP' \
    --codeChallengeMethod 'S256' \
    --additionalData 'Ly0B42wr' \
    --clientId 'fSsf5qBw' \
    --clientSecret 'CzWh8ktB' \
    --code '7KVn895e' \
    --codeVerifier 'BOfE18c2' \
    --extendNamespace '4akzFZzk' \
    --extendExp  \
    --loginQueueTicket '7hAGjdkP' \
    --password 'wRKB1Hxi' \
    --redirectUri 'q33ETjfg' \
    --refreshToken '78Hj45zA' \
    --scope 'IwAsc3Ed' \
    --username 'nNBGJ7jT' \
    --grantType 'password' \
    > test.out 2>&1
eval_tap $? 402 'TokenGrantV4' test.out

#- 403 RequestTargetTokenResponseV4
./ng net.accelbyte.sdk.cli.Main iam requestTargetTokenResponseV4 \
    --additionalData 'lfNBjHV6' \
    --code '6KWWDgz7' \
    > test.out 2>&1
eval_tap $? 403 'RequestTargetTokenResponseV4' test.out

#- 404 PublicListUserIDByPlatformUserIDsV4
./ng net.accelbyte.sdk.cli.Main iam publicListUserIDByPlatformUserIDsV4 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'mDPzZphd' \
    --rawPUID  \
    --body '{"pidType": "5EIfGGgn", "platformUserIds": ["YVAwBWuE", "yQy5Xya0", "2Putnsn4"]}' \
    > test.out 2>&1
eval_tap $? 404 'PublicListUserIDByPlatformUserIDsV4' test.out

#- 405 PublicGetUserByPlatformUserIDV4
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByPlatformUserIDV4 \
    --namespace "$AB_NAMESPACE" \
    --platformId '0tXVYAcW' \
    --platformUserId 'qODePwJ0' \
    > test.out 2>&1
eval_tap $? 405 'PublicGetUserByPlatformUserIDV4' test.out

#- 406 PublicCreateTestUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateTestUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "LrRB7QCE", "policyId": "Fd5wzUwo", "policyVersionId": "yylH5uMM"}, {"isAccepted": true, "localizedPolicyVersionId": "ycpFr8lA", "policyId": "PC5kSMzp", "policyVersionId": "O6XBAkdw"}, {"isAccepted": false, "localizedPolicyVersionId": "f3QAwamt", "policyId": "qAiS0P70", "policyVersionId": "7pdumCpk"}], "authType": "EMAILPASSWD", "country": "vc4PEY4a", "dateOfBirth": "AAQwyoVZ", "displayName": "fq5rkAib", "emailAddress": "zWkjbhQL", "password": "ERts6Ivq", "passwordMD5Sum": "9NlQ0rjC", "uniqueDisplayName": "eZDMl04m", "username": "2cOg0CLE", "verified": false}' \
    > test.out 2>&1
eval_tap $? 406 'PublicCreateTestUserV4' test.out

#- 407 PublicCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "pKFPQj2k", "policyId": "hZVTBJgl", "policyVersionId": "F80F0AUj"}, {"isAccepted": true, "localizedPolicyVersionId": "XeLBTeod", "policyId": "9x7TU9MM", "policyVersionId": "FOCzhcQS"}, {"isAccepted": false, "localizedPolicyVersionId": "GvQp2b2g", "policyId": "GjKLmIh6", "policyVersionId": "zV0hWt7p"}], "authType": "EMAILPASSWD", "code": "XcqylsqJ", "country": "anTNfIQ3", "dateOfBirth": "pl6ObEUq", "displayName": "GkOoLlf5", "emailAddress": "siuZKEsC", "password": "CUR86d6w", "passwordMD5Sum": "Bn8r6hOu", "reachMinimumAge": false, "uniqueDisplayName": "RCNjpzog", "username": "vSGGBMJX"}' \
    > test.out 2>&1
eval_tap $? 407 'PublicCreateUserV4' test.out

#- 408 CreateUserFromInvitationV4
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV4 \
    --invitationId 'D5FH6MUx' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "tjdwsybx", "policyId": "hlTD0CEO", "policyVersionId": "85MqQtoP"}, {"isAccepted": false, "localizedPolicyVersionId": "Uktoc9rP", "policyId": "IfS3Myfq", "policyVersionId": "bJUeSkbL"}, {"isAccepted": true, "localizedPolicyVersionId": "uQ3UZT77", "policyId": "1DLrEcBq", "policyVersionId": "kD55eU78"}], "authType": "EMAILPASSWD", "code": "Pqb5KbYm", "country": "fj34YTqk", "dateOfBirth": "vl6lRBvA", "displayName": "l8ikBNdj", "emailAddress": "RbbO5bMh", "password": "Ob716OMV", "passwordMD5Sum": "T9E6Yskw", "reachMinimumAge": true, "uniqueDisplayName": "oGDlKI6K", "username": "sWRE7MYs"}' \
    > test.out 2>&1
eval_tap $? 408 'CreateUserFromInvitationV4' test.out

#- 409 PublicUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "LABveHoM", "country": "7TD44x2L", "dateOfBirth": "wZLdsdjm", "displayName": "8thuNU3d", "languageTag": "eGLAfg4b", "uniqueDisplayName": "gsIKPmGu", "userName": "aCZVWFtP"}' \
    > test.out 2>&1
eval_tap $? 409 'PublicUpdateUserV4' test.out

#- 410 PublicUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "ipdNBYV1", "emailAddress": "I5h71VVb"}' \
    > test.out 2>&1
eval_tap $? 410 'PublicUpdateUserEmailAddressV4' test.out

#- 411 PublicUpgradeHeadlessAccountWithVerificationCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountWithVerificationCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "yj4p66ux", "country": "dbc7Ikj3", "dateOfBirth": "Nf3XiPAy", "displayName": "9L6bFYEb", "emailAddress": "uH6aisIE", "password": "slqFNG2R", "reachMinimumAge": true, "uniqueDisplayName": "AMJNr97U", "username": "nAeScTA5", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 411 'PublicUpgradeHeadlessAccountWithVerificationCodeV4' test.out

#- 412 PublicUpgradeHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"dateOfBirth": "byTM3U5W", "displayName": "tuQ3SBYx", "emailAddress": "pTDU82UP", "password": "g3RNhYNx", "uniqueDisplayName": "UuDBKRWp", "username": "kDzyiU7w"}' \
    > test.out 2>&1
eval_tap $? 412 'PublicUpgradeHeadlessAccountV4' test.out

#- 413 PublicDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"factor": "KhhoYi64", "mfaToken": "g48p8emf"}' \
    > test.out 2>&1
eval_tap $? 413 'PublicDisableMyAuthenticatorV4' test.out

#- 414 PublicEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'lPxIq7jP' \
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
    --body '{"factor": "1dpCAGms", "mfaToken": "pLfDrS5Y"}' \
    > test.out 2>&1
eval_tap $? 418 'PublicDisableMyBackupCodesV4' test.out

#- 419 PublicDownloadMyBackupCodesV4
eval_tap 0 419 'PublicDownloadMyBackupCodesV4 # SKIP deprecated' test.out

#- 420 PublicEnableMyBackupCodesV4
eval_tap 0 420 'PublicEnableMyBackupCodesV4 # SKIP deprecated' test.out

#- 421 PublicGetBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGetBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --languageTag 'Ql9iW6aa' \
    > test.out 2>&1
eval_tap $? 421 'PublicGetBackupCodesV4' test.out

#- 422 PublicGenerateBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --languageTag 'FezeKAF3' \
    > test.out 2>&1
eval_tap $? 422 'PublicGenerateBackupCodesV4' test.out

#- 423 PublicEnableBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --languageTag 'PLX4uowZ' \
    > test.out 2>&1
eval_tap $? 423 'PublicEnableBackupCodesV4' test.out

#- 424 PublicChallengeMyMFAV4
./ng net.accelbyte.sdk.cli.Main iam publicChallengeMyMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'OMXnrKGa' \
    --factor 'SLiOL1Mv' \
    > test.out 2>&1
eval_tap $? 424 'PublicChallengeMyMFAV4' test.out

#- 425 PublicRemoveTrustedDeviceV4
./ng net.accelbyte.sdk.cli.Main iam publicRemoveTrustedDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceToken 'bkRDgPkS' \
    > test.out 2>&1
eval_tap $? 425 'PublicRemoveTrustedDeviceV4' test.out

#- 426 PublicSendMyMFAEmailCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicSendMyMFAEmailCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --action 'aeKn0ZdA' \
    --languageTag 'ERwWi4fB' \
    > test.out 2>&1
eval_tap $? 426 'PublicSendMyMFAEmailCodeV4' test.out

#- 427 PublicDisableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyEmailV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"factor": "ty7bB99w", "mfaToken": "Eb9ZdCXf"}' \
    > test.out 2>&1
eval_tap $? 427 'PublicDisableMyEmailV4' test.out

#- 428 PublicEnableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyEmailV4 \
    --namespace "$AB_NAMESPACE" \
    --code '9Wy0VIM9' \
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
    --factor '2xJdSbKx' \
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
    --userId '8YYg2af1' \
    > test.out 2>&1
eval_tap $? 433 'PublicGetUserPublicInfoByUserIdV4' test.out

#- 434 PublicInviteUserV4
./ng net.accelbyte.sdk.cli.Main iam publicInviteUserV4 \
    --body '{"additionalData": "UjvrZg1R", "emailAddress": "nmtcG3d2", "languageTag": "6Jv0WVYs", "namespace": "XsXgRSj6", "namespaceDisplayName": "VI1sFcyZ"}' \
    > test.out 2>&1
eval_tap $? 434 'PublicInviteUserV4' test.out

#- 435 PublicUpgradeHeadlessWithCodeV4Forward
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessWithCodeV4Forward \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "Y5Be6o4o", "policyId": "BBdeGnba", "policyVersionId": "T8VX2N05"}, {"isAccepted": false, "localizedPolicyVersionId": "iufXW4QL", "policyId": "GIKlfj9R", "policyVersionId": "us6BoySQ"}, {"isAccepted": false, "localizedPolicyVersionId": "kBjyaVYK", "policyId": "yR2uywhO", "policyVersionId": "DsdS1ota"}], "code": "5DBtff6A", "country": "oiKmZwU8", "dateOfBirth": "QGSOcoy6", "displayName": "XnAnh6gO", "emailAddress": "wNR76Blk", "password": "9U6I7NRW", "reachMinimumAge": true, "uniqueDisplayName": "uFKJuAN1", "username": "M34Lr5hH", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 435 'PublicUpgradeHeadlessWithCodeV4Forward' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
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
echo "1..394"

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
    --body '{"modules": [{"docLink": "DipZvycr", "groups": [{"group": "iw26wUns", "groupId": "Bw3R90uG", "permissions": [{"allowedActions": [27, 23, 95], "resource": "Rt8X6mW6"}, {"allowedActions": [17, 6, 99], "resource": "786UsfW2"}, {"allowedActions": [10, 95, 15], "resource": "OYWxtmoR"}]}, {"group": "WUgDzkVg", "groupId": "l1z3O3wR", "permissions": [{"allowedActions": [87, 89, 13], "resource": "swU6dfmP"}, {"allowedActions": [95, 64, 78], "resource": "e0UW3U5J"}, {"allowedActions": [89, 4, 87], "resource": "l3kRKXmY"}]}, {"group": "b2q2gASP", "groupId": "fzLrKugm", "permissions": [{"allowedActions": [4, 54, 71], "resource": "4Qzq2c8T"}, {"allowedActions": [93, 92, 2], "resource": "XT4ZbcOT"}, {"allowedActions": [31, 54, 40], "resource": "ypmHURbd"}]}], "module": "gaLy7tWg", "moduleId": "ZUE7tu00"}, {"docLink": "JI7Ruopg", "groups": [{"group": "TFLq1ljq", "groupId": "p6Ve48sy", "permissions": [{"allowedActions": [75, 64, 93], "resource": "j54sTMNS"}, {"allowedActions": [40, 60, 86], "resource": "ZqOeGID7"}, {"allowedActions": [85, 17, 15], "resource": "2yAa8Ri8"}]}, {"group": "bNlnA8bU", "groupId": "yTXL8H7a", "permissions": [{"allowedActions": [43, 71, 88], "resource": "WDHe05dO"}, {"allowedActions": [71, 79, 64], "resource": "XOAivrV5"}, {"allowedActions": [98, 9, 42], "resource": "0VqAQjkm"}]}, {"group": "mS5Rrjw4", "groupId": "EymvQiOj", "permissions": [{"allowedActions": [29, 39, 12], "resource": "xzDUFQSY"}, {"allowedActions": [16, 87, 72], "resource": "0Q9zFkiy"}, {"allowedActions": [24, 93, 66], "resource": "oXkvITrJ"}]}], "module": "d7T2t5n7", "moduleId": "kD3q77XY"}, {"docLink": "u3pTR07k", "groups": [{"group": "KU11NqX5", "groupId": "2RQ4Oj2l", "permissions": [{"allowedActions": [100, 41, 74], "resource": "kik0oCsV"}, {"allowedActions": [10, 43, 23], "resource": "EDMpet4n"}, {"allowedActions": [21, 71, 40], "resource": "lCDMNBdN"}]}, {"group": "BQE2wR8n", "groupId": "opsW4Z5t", "permissions": [{"allowedActions": [5, 98, 34], "resource": "kbNLodD5"}, {"allowedActions": [97, 33, 44], "resource": "EzJgC7xU"}, {"allowedActions": [20, 25, 44], "resource": "g5gmw4Dd"}]}, {"group": "vKHkHQcD", "groupId": "okrcMwS0", "permissions": [{"allowedActions": [75, 41, 9], "resource": "3OVEW2I3"}, {"allowedActions": [96, 38, 70], "resource": "70pwH9IF"}, {"allowedActions": [42, 86, 81], "resource": "x11su1wY"}]}], "module": "O3y0JIxm", "moduleId": "MBTSh84h"}]}' \
    > test.out 2>&1
eval_tap $? 109 'AdminUpdateAvailablePermissionsByModule' test.out

#- 110 AdminDeleteConfigPermissionsByGroup
./ng net.accelbyte.sdk.cli.Main iam adminDeleteConfigPermissionsByGroup \
    --forceDelete  \
    --body '{"groupId": "i5Fyx87M", "moduleId": "N6Xerxp5"}' \
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
    --body '[{"field": "Wrb22E10", "validation": {"allowAllSpecialCharacters": false, "allowDigit": false, "allowLetter": false, "allowSpace": true, "allowUnicode": true, "avatarConfig": {"allowedPrefixes": ["DWcmG9wz", "oQGkxIig", "ZXXmOzdD"], "preferRegex": true, "regex": "UTnJJsBY"}, "blockedWord": ["LhPxfNPl", "e3v6urrc", "MAvYJZ2f"], "description": [{"language": "cBXiBnpC", "message": ["uT92M7v9", "sMHrP9f1", "Ol7capHU"]}, {"language": "awBSQJn3", "message": ["cDaGVevP", "5WLhm9KM", "lhdZHwiO"]}, {"language": "y7d0phOM", "message": ["qfXau0pO", "Fh7U6ANU", "BLoqr2Mz"]}], "isCustomRegex": true, "letterCase": "6pBwlRxu", "maxLength": 32, "maxRepeatingAlphaNum": 40, "maxRepeatingSpecialCharacter": 13, "minCharType": 48, "minLength": 5, "regex": "maPrHYX0", "specialCharacterLocation": "M7pS233H", "specialCharacters": ["GOZcgziz", "H20kjm6R", "hMv1T8Gv"]}}, {"field": "FHl9O04v", "validation": {"allowAllSpecialCharacters": true, "allowDigit": true, "allowLetter": true, "allowSpace": false, "allowUnicode": false, "avatarConfig": {"allowedPrefixes": ["murHadDz", "ZtJ7gv6g", "36Um6Y6j"], "preferRegex": true, "regex": "DVZFz9G6"}, "blockedWord": ["YQXRVm7z", "zDB88a05", "hjBvBtUu"], "description": [{"language": "BjAjbvDi", "message": ["bKky4QaH", "IZj3RBlU", "4jTGpjII"]}, {"language": "I1IcakOx", "message": ["6zPHkeaQ", "XR4AHZRf", "k7BiperV"]}, {"language": "nyYyFsO5", "message": ["1XUJwGuf", "wBrxBGMx", "r9tTRjj4"]}], "isCustomRegex": false, "letterCase": "PMiwDI8o", "maxLength": 85, "maxRepeatingAlphaNum": 77, "maxRepeatingSpecialCharacter": 56, "minCharType": 22, "minLength": 76, "regex": "mdb4F0By", "specialCharacterLocation": "CPDJnFjb", "specialCharacters": ["YDYQDH2S", "LgdHPNZy", "zXl3P4od"]}}, {"field": "DVdSeP6q", "validation": {"allowAllSpecialCharacters": true, "allowDigit": false, "allowLetter": true, "allowSpace": false, "allowUnicode": true, "avatarConfig": {"allowedPrefixes": ["iQQbdbsf", "0uJOO32r", "3nOMjl48"], "preferRegex": false, "regex": "MPTZTsbl"}, "blockedWord": ["oJ9IMvuC", "wpCqFjhd", "U4H0WfLS"], "description": [{"language": "L3rByJG4", "message": ["WAksCOKd", "6dhBFF4n", "efF9ZnCC"]}, {"language": "XAeHpDAw", "message": ["PLtiWsZR", "AujZ6J7F", "V5ZEK3ZP"]}, {"language": "l43SwCpC", "message": ["O1L84XT0", "8U7dWH1S", "wkS1DT4l"]}], "isCustomRegex": false, "letterCase": "uIqWmiJG", "maxLength": 13, "maxRepeatingAlphaNum": 98, "maxRepeatingSpecialCharacter": 84, "minCharType": 19, "minLength": 40, "regex": "8yBrSpkE", "specialCharacterLocation": "Q80BdxmO", "specialCharacters": ["DcbbBh3W", "UH9L4oRB", "SsnDUx3z"]}}]' \
    > test.out 2>&1
eval_tap $? 113 'AdminUpdateInputValidations' test.out

#- 114 AdminResetInputValidations
./ng net.accelbyte.sdk.cli.Main iam adminResetInputValidations \
    --field 'Gzv6hDkv' \
    > test.out 2>&1
eval_tap $? 114 'AdminResetInputValidations' test.out

#- 115 ListAdminsV3
./ng net.accelbyte.sdk.cli.Main iam listAdminsV3 \
    --namespace "$AB_NAMESPACE" \
    --after 'ts4qrEg4' \
    --before '9HYzSVo5' \
    --endDate 'MSXZY8Jn' \
    --limit '47' \
    --query 'E63uHIeY' \
    --roleId 'HW55DmW3' \
    --startDate 'n0tW8LEy' \
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
    --body '{"ageRestriction": 2, "enable": true}' \
    > test.out 2>&1
eval_tap $? 117 'AdminUpdateAgeRestrictionConfigV3' test.out

#- 118 AdminGetListCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminGetListCountryAgeRestrictionV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 118 'AdminGetListCountryAgeRestrictionV3' test.out

#- 119 AdminUpdateCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateCountryAgeRestrictionV3 \
    --countryCode 'nfkL8ue7' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ageRestriction": 46}' \
    > test.out 2>&1
eval_tap $? 119 'AdminUpdateCountryAgeRestrictionV3' test.out

#- 120 AdminGetBannedUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType 'pyk2dR61' \
    --limit '59' \
    --offset '92' \
    > test.out 2>&1
eval_tap $? 120 'AdminGetBannedUsersV3' test.out

#- 121 AdminBanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"ban": "BFl810eU", "comment": "3FsUgSKv", "endDate": "TfxmQwlp", "reason": "n398BDHq", "skipNotif": true, "userIds": ["ZmpANuUc", "0StSyH46", "GR2PkaYF"]}' \
    > test.out 2>&1
eval_tap $? 121 'AdminBanUserBulkV3' test.out

#- 122 AdminUnbanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminUnbanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"bans": [{"banId": "Wddup4TC", "userId": "TzWoj5Kv"}, {"banId": "seNtZOio", "userId": "4I3qCq6p"}, {"banId": "B60aKKbs", "userId": "romwlptW"}]}' \
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
    --clientId 'YmK5pb33' \
    --clientName 'jNVoM5Gj' \
    --clientType 'RVuvAUaR' \
    --limit '21' \
    --offset '24' \
    --skipLoginQueue  \
    > test.out 2>&1
eval_tap $? 124 'AdminGetClientsByNamespaceV3' test.out

#- 125 AdminBulkUpdateClientsV3
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateClientsV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientIds": ["DytYOTV4", "GItz06Zf", "amYLov9c"], "clientUpdateRequest": {"audiences": ["Rib5EnRA", "qRvoRgpl", "0E8LWh5B"], "baseUri": "CEDzTxZv", "clientName": "nsqXNMnS", "clientPermissions": [{"action": 93, "resource": "5UAKym9C", "schedAction": 57, "schedCron": "VsdoHSOY", "schedRange": ["8TR2z5tz", "kUyTE5bP", "FBf3S5YV"]}, {"action": 90, "resource": "cau2I8AF", "schedAction": 41, "schedCron": "DInnmF3C", "schedRange": ["f1HuTny1", "JY5uG2Pc", "sYwgAMpL"]}, {"action": 88, "resource": "dHAIuuQy", "schedAction": 76, "schedCron": "MiTMNVL3", "schedRange": ["cTPnk4uB", "YE6txTFu", "wxJx6myf"]}], "clientPlatform": "3pBpJpxm", "deletable": false, "description": "BUZ3aVwe", "modulePermissions": [{"moduleId": "m7WDSwXp", "selectedGroups": [{"groupId": "hPAYck1l", "selectedActions": [56, 43, 83]}, {"groupId": "RfRFc5r5", "selectedActions": [87, 11, 38]}, {"groupId": "SVpt8CEs", "selectedActions": [79, 58, 0]}]}, {"moduleId": "RoMcW5e9", "selectedGroups": [{"groupId": "iFEJVxwy", "selectedActions": [17, 16, 34]}, {"groupId": "9ANWRHV9", "selectedActions": [2, 97, 88]}, {"groupId": "GATFr3Es", "selectedActions": [35, 42, 89]}]}, {"moduleId": "Oey55MmI", "selectedGroups": [{"groupId": "ZVjkqWKd", "selectedActions": [63, 100, 11]}, {"groupId": "CCZGxVCp", "selectedActions": [90, 93, 40]}, {"groupId": "X9SL0vqi", "selectedActions": [85, 97, 74]}]}], "namespace": "awmuFW0b", "oauthAccessTokenExpiration": 90, "oauthAccessTokenExpirationTimeUnit": "M3bIqLiu", "oauthRefreshTokenExpiration": 10, "oauthRefreshTokenExpirationTimeUnit": "3jK2XypU", "redirectUri": "ciM8xoW6", "scopes": ["53h4tCfT", "nQOQeVM6", "PkkRNOgN"], "skipLoginQueue": true, "twoFactorEnabled": false}}' \
    > test.out 2>&1
eval_tap $? 125 'AdminBulkUpdateClientsV3' test.out

#- 126 AdminCreateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateClientV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["YuUY9glC", "tL0eBpZc", "bqFnvjYF"], "baseUri": "4L9F34ZE", "clientId": "5Q0SEDtk", "clientName": "ZCS4mKLv", "clientPermissions": [{"action": 26, "resource": "VEjWU7GD", "schedAction": 11, "schedCron": "jjSZKEsP", "schedRange": ["YXf7eLUN", "YeChNH2k", "ofGdKNPb"]}, {"action": 89, "resource": "d0mRmh49", "schedAction": 59, "schedCron": "cj5RRqVW", "schedRange": ["bUNGZHFL", "TJykidrI", "sjh7L46V"]}, {"action": 80, "resource": "94OKLqL2", "schedAction": 58, "schedCron": "AHMehzDA", "schedRange": ["nDZCVTC2", "P3HAIK0k", "9Ejxy7gl"]}], "clientPlatform": "MF5yysbk", "deletable": true, "description": "cadsfaNz", "modulePermissions": [{"moduleId": "BzXrxRj4", "selectedGroups": [{"groupId": "laTiDoKK", "selectedActions": [62, 77, 39]}, {"groupId": "AnT7JaGV", "selectedActions": [72, 89, 22]}, {"groupId": "tSXBQItk", "selectedActions": [65, 76, 34]}]}, {"moduleId": "CvIuxCka", "selectedGroups": [{"groupId": "4QaI1eKs", "selectedActions": [47, 8, 97]}, {"groupId": "7233to8C", "selectedActions": [83, 15, 67]}, {"groupId": "SFFzl6yF", "selectedActions": [22, 80, 18]}]}, {"moduleId": "FoXHi0G8", "selectedGroups": [{"groupId": "fdXO1vjE", "selectedActions": [91, 65, 75]}, {"groupId": "HbRV2gCT", "selectedActions": [82, 48, 9]}, {"groupId": "k73Z4dxE", "selectedActions": [39, 72, 93]}]}], "namespace": "rPtHB6y0", "oauthAccessTokenExpiration": 66, "oauthAccessTokenExpirationTimeUnit": "6BwrioD8", "oauthClientType": "QqIR1sRj", "oauthRefreshTokenExpiration": 55, "oauthRefreshTokenExpirationTimeUnit": "9YuYnfZP", "parentNamespace": "RByVDpEG", "redirectUri": "ileHlYlQ", "scopes": ["GGjXz5Bx", "DEYg4oNV", "Qzz9vPBJ"], "secret": "Qt3suoQt", "skipLoginQueue": true, "twoFactorEnabled": false}' \
    > test.out 2>&1
eval_tap $? 126 'AdminCreateClientV3' test.out

#- 127 AdminGetClientsbyNamespacebyIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetClientsbyNamespacebyIDV3 \
    --clientId 'xWKPS5Wo' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 127 'AdminGetClientsbyNamespacebyIDV3' test.out

#- 128 AdminDeleteClientV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientV3 \
    --clientId 'wtO89b6O' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 128 'AdminDeleteClientV3' test.out

#- 129 AdminUpdateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientV3 \
    --clientId 'LEFXF95M' \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["kApNWeZ0", "63ICAVyj", "d3v9za7s"], "baseUri": "IRWwtBit", "clientName": "Y4kYtItI", "clientPermissions": [{"action": 83, "resource": "jzjPXFCh", "schedAction": 6, "schedCron": "ZAQio2RJ", "schedRange": ["ZxUgmNS2", "RsJWQ1Nw", "PbkMDjln"]}, {"action": 62, "resource": "isKRGcve", "schedAction": 78, "schedCron": "9qXaisaX", "schedRange": ["A1x3S0IG", "jVmHTDHq", "blr6lscY"]}, {"action": 51, "resource": "RhZfvIM2", "schedAction": 78, "schedCron": "ApP6lgDe", "schedRange": ["LiVm4gWY", "ogkSbPYR", "krtv6gyK"]}], "clientPlatform": "PCN46JX8", "deletable": false, "description": "KGNDTXPP", "modulePermissions": [{"moduleId": "Fbi2Mhkl", "selectedGroups": [{"groupId": "v9hUl93R", "selectedActions": [84, 81, 45]}, {"groupId": "SdYCQHCF", "selectedActions": [18, 36, 64]}, {"groupId": "IFTjmxWw", "selectedActions": [35, 44, 13]}]}, {"moduleId": "JKrW2A0r", "selectedGroups": [{"groupId": "z2ibAkaL", "selectedActions": [78, 12, 25]}, {"groupId": "94sVD4X6", "selectedActions": [4, 15, 34]}, {"groupId": "Lj7suH5o", "selectedActions": [39, 5, 66]}]}, {"moduleId": "tpFZq2ba", "selectedGroups": [{"groupId": "cdvuQHil", "selectedActions": [0, 57, 23]}, {"groupId": "8ijcNCzP", "selectedActions": [7, 20, 39]}, {"groupId": "sPVfpPkR", "selectedActions": [56, 54, 87]}]}], "namespace": "lRwCZYvd", "oauthAccessTokenExpiration": 73, "oauthAccessTokenExpirationTimeUnit": "gcw6dSNF", "oauthRefreshTokenExpiration": 55, "oauthRefreshTokenExpirationTimeUnit": "Qcb5Zqtu", "redirectUri": "xSM96pTq", "scopes": ["VM8ohf25", "l5BPNntb", "sTESDJQ4"], "skipLoginQueue": false, "twoFactorEnabled": true}' \
    > test.out 2>&1
eval_tap $? 129 'AdminUpdateClientV3' test.out

#- 130 AdminUpdateClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientPermissionV3 \
    --clientId 'YhWWyDj5' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 69, "resource": "AsSU2uNa"}, {"action": 44, "resource": "6mXCXvMu"}, {"action": 28, "resource": "Gir1SyP7"}]}' \
    > test.out 2>&1
eval_tap $? 130 'AdminUpdateClientPermissionV3' test.out

#- 131 AdminAddClientPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddClientPermissionsV3 \
    --clientId 'V1gY9KGK' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 4, "resource": "rSdNNAgW"}, {"action": 41, "resource": "VjIq3KO3"}, {"action": 54, "resource": "Crm1uNG5"}]}' \
    > test.out 2>&1
eval_tap $? 131 'AdminAddClientPermissionsV3' test.out

#- 132 AdminDeleteClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientPermissionV3 \
    --action '43' \
    --clientId 'zJ9vSpsj' \
    --namespace "$AB_NAMESPACE" \
    --resource '5Qd8ka46' \
    > test.out 2>&1
eval_tap $? 132 'AdminDeleteClientPermissionV3' test.out

#- 133 AdminGetConfigValueV3
./ng net.accelbyte.sdk.cli.Main iam adminGetConfigValueV3 \
    --configKey 'Dbflq7HS' \
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
    --body '{"blacklist": ["GguOvQ1E", "bsCBQwEF", "6IJjd685"]}' \
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
    --limit '80' \
    --offset '23' \
    > test.out 2>&1
eval_tap $? 139 'RetrieveAllSSOLoginPlatformCredentialV3' test.out

#- 140 RetrieveThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'nuNQde6b' \
    > test.out 2>&1
eval_tap $? 140 'RetrieveThirdPartyLoginPlatformCredentialV3' test.out

#- 141 AddThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam addThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'RM0HlVGy' \
    --body '{"ACSURL": "On0F1OTm", "AWSCognitoRegion": "d5IuROTM", "AWSCognitoUserPool": "TSPUXR26", "AllowedClients": ["UnzDOUgR", "rNhNq5Me", "nZS1XG6g"], "AppId": "fzuAIATn", "AuthorizationEndpoint": "7Fjj7OU0", "ClientId": "BAeG2s3V", "Environment": "zkD1c4Tr", "FederationMetadataURL": "GKS8YDpL", "GenericOauthFlow": false, "IsActive": true, "Issuer": "9UbvHnvZ", "JWKSEndpoint": "Shxvi9yx", "KeyID": "snCS9dZT", "NetflixCertificates": {"encryptedPrivateKey": "DLTKNC1c", "encryptedPrivateKeyName": "uhzTu7Xv", "publicCertificate": "88lkFVLD", "publicCertificateName": "NOxmaRGl", "rootCertificate": "EQgYtSQP", "rootCertificateName": "5gJ9BVrO"}, "OrganizationId": "OVY3gstF", "PlatformName": "DggnX6Mz", "RedirectUri": "U4tBE5ST", "RegisteredDomains": [{"affectedClientIDs": ["ucuuEZTv", "B7otMXLK", "9GcWLMtq"], "domain": "LPvWUUoZ", "namespaces": ["Ke6XhrQ8", "tB3bZI4a", "qmGJXAgS"], "roleId": "6kjOSpUr"}, {"affectedClientIDs": ["0i8ZbZrg", "9XN7ROGO", "BSPnpVLt"], "domain": "mYNhtfHN", "namespaces": ["WbhNhsN9", "A4SboDRW", "AWwsAgW3"], "roleId": "u1YAQAdy"}, {"affectedClientIDs": ["0mbVG32j", "e2XbHZOw", "YK8bZoG4"], "domain": "LPWNYgig", "namespaces": ["wjOemNXA", "wWeoZ46f", "0VQCD5uW"], "roleId": "bDDf7gHP"}], "Secret": "HXYsQCbA", "TeamID": "PSjRCMoF", "TokenAuthenticationType": "qsLZsdAR", "TokenClaimsMapping": {"TBMlChFl": "cVwg4NML", "w99iN3yI": "yVh8Gi09", "cDrMM7la": "qCF7NUeg"}, "TokenEndpoint": "9iysv2Jz", "UserInfoEndpoint": "ezNONtul", "UserInfoHTTPMethod": "uhxmhWj7", "scopes": ["Av3p5CPt", "OZ7gbN7s", "UfrDSVHG"]}' \
    > test.out 2>&1
eval_tap $? 141 'AddThirdPartyLoginPlatformCredentialV3' test.out

#- 142 DeleteThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'ENt2HZai' \
    > test.out 2>&1
eval_tap $? 142 'DeleteThirdPartyLoginPlatformCredentialV3' test.out

#- 143 UpdateThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'niSlPyAc' \
    --body '{"ACSURL": "Mb3kSkQw", "AWSCognitoRegion": "y8UGJylT", "AWSCognitoUserPool": "3VLClTE5", "AllowedClients": ["7VJD0u1Q", "hRJ62Nop", "8zfqoYt9"], "AppId": "1GhhI6Ub", "AuthorizationEndpoint": "YYmtWccv", "ClientId": "YVLYfr7x", "Environment": "ryJGow6O", "FederationMetadataURL": "jBGstWpD", "GenericOauthFlow": false, "IsActive": false, "Issuer": "rZpWXhNC", "JWKSEndpoint": "i0eSTKNW", "KeyID": "zYCWCy4F", "NetflixCertificates": {"encryptedPrivateKey": "bWv2dMpM", "encryptedPrivateKeyName": "uNaHLt7w", "publicCertificate": "m5mS1BzZ", "publicCertificateName": "ZlMaHEVi", "rootCertificate": "3wojMdpX", "rootCertificateName": "5WRxBXNT"}, "OrganizationId": "2dInneZW", "PlatformName": "BD8QfIhr", "RedirectUri": "ye3NvrCZ", "RegisteredDomains": [{"affectedClientIDs": ["JhkIvlCD", "JRv8u2QR", "VmhImcHj"], "domain": "1kD0CY8Z", "namespaces": ["L6ZSpIAk", "6YeLDpZk", "m8Jhfyt7"], "roleId": "mxUnZr7Z"}, {"affectedClientIDs": ["ZGzQuUw0", "EcVJXMdt", "42Esd0Em"], "domain": "GaAc8ElK", "namespaces": ["R8zP015Z", "k7trhci3", "h3crsSnr"], "roleId": "tuwbvlTS"}, {"affectedClientIDs": ["vj1inGis", "p8JprLfv", "g7o62t7q"], "domain": "NzkGkF9V", "namespaces": ["k1UIwgJU", "sabqvxeu", "pAzLqKCG"], "roleId": "J7ecEl9R"}], "Secret": "k9htcyDd", "TeamID": "aywJtlC9", "TokenAuthenticationType": "TUTGBqKJ", "TokenClaimsMapping": {"pdSdsM7r": "YKfKKRWh", "xfObjtBN": "p5ReKgJw", "h27LvzOL": "MKD0j1Rl"}, "TokenEndpoint": "fxb1lcZD", "UserInfoEndpoint": "Lm3OlIM1", "UserInfoHTTPMethod": "IihqVST9", "scopes": ["Cap4OkPq", "H51sXLEl", "hTtIygy7"]}' \
    > test.out 2>&1
eval_tap $? 143 'UpdateThirdPartyLoginPlatformCredentialV3' test.out

#- 144 UpdateThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'dDnXW605' \
    --body '{"affectedClientIDs": ["UB5JiOG4", "whtjBxOz", "5n3KiL6P"], "assignedNamespaces": ["slAaMLI3", "a6HsnDy2", "SnRBPEKQ"], "domain": "FAORYENK", "roleId": "T7cmF8gU"}' \
    > test.out 2>&1
eval_tap $? 144 'UpdateThirdPartyLoginPlatformDomainV3' test.out

#- 145 DeleteThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'erJZOv4A' \
    --body '{"domain": "nJsZ8Zwf"}' \
    > test.out 2>&1
eval_tap $? 145 'DeleteThirdPartyLoginPlatformDomainV3' test.out

#- 146 RetrieveSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam retrieveSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId '1Tn9Jdzc' \
    > test.out 2>&1
eval_tap $? 146 'RetrieveSSOLoginPlatformCredential' test.out

#- 147 AddSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam addSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'w8cNHqqU' \
    --body '{"acsUrl": "fQ4lmIDc", "apiKey": "MKXPE4iu", "appId": "GKt7XeTr", "federationMetadataUrl": "0coZsv6o", "isActive": true, "redirectUri": "nXeBYgyx", "secret": "S51eLp2z", "ssoUrl": "FgAyLfPt"}' \
    > test.out 2>&1
eval_tap $? 147 'AddSSOLoginPlatformCredential' test.out

#- 148 DeleteSSOLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteSSOLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'cLuUyYqa' \
    > test.out 2>&1
eval_tap $? 148 'DeleteSSOLoginPlatformCredentialV3' test.out

#- 149 UpdateSSOPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam updateSSOPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'B3AMBHmJ' \
    --body '{"acsUrl": "bNI7xIDX", "apiKey": "mSz5cCL3", "appId": "TIl34Pvv", "federationMetadataUrl": "YfUEaqu6", "isActive": false, "redirectUri": "u4RkJimB", "secret": "Dm2NVzjN", "ssoUrl": "aOscIeps"}' \
    > test.out 2>&1
eval_tap $? 149 'UpdateSSOPlatformCredential' test.out

#- 150 AdminListUserIDByPlatformUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByPlatformUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'ZuhpLHaZ' \
    --rawPID  \
    --body '{"platformUserIds": ["B5LGkeW8", "h8nD5nTc", "HADxVaMB"]}' \
    > test.out 2>&1
eval_tap $? 150 'AdminListUserIDByPlatformUserIDsV3' test.out

#- 151 AdminGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'fGq0Ozli' \
    --platformUserId 'AssiHHij' \
    > test.out 2>&1
eval_tap $? 151 'AdminGetUserByPlatformUserIDV3' test.out

#- 152 GetAdminUsersByRoleIdV3
./ng net.accelbyte.sdk.cli.Main iam getAdminUsersByRoleIdV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'nOe8lZY1' \
    --after '98' \
    --before '50' \
    --limit '87' \
    > test.out 2>&1
eval_tap $? 152 'GetAdminUsersByRoleIdV3' test.out

#- 153 AdminGetUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --emailAddress 'YohtcnU3' \
    > test.out 2>&1
eval_tap $? 153 'AdminGetUserByEmailAddressV3' test.out

#- 154 AdminBulkUpdateUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"updateRequest": {"skipLoginQueue": false}, "userIds": ["AFisOFom", "VuIkhfyI", "xomabjGU"]}' \
    > test.out 2>&1
eval_tap $? 154 'AdminBulkUpdateUsersV3' test.out

#- 155 AdminGetBulkUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType 'qRRy5pkz' \
    --body '{"bulkUserId": ["R1nO2wW1", "3bWcWSkB", "Y3JW5712"]}' \
    > test.out 2>&1
eval_tap $? 155 'AdminGetBulkUserBanV3' test.out

#- 156 AdminListUserIDByUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["qScoqdAU", "dnx0fvGy", "bjKb7hC3"]}' \
    > test.out 2>&1
eval_tap $? 156 'AdminListUserIDByUserIDsV3' test.out

#- 157 AdminBulkGetUsersPlatform
./ng net.accelbyte.sdk.cli.Main iam adminBulkGetUsersPlatform \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["xSRKqxhJ", "UHHhKP73", "Ib3n03ov"]}' \
    > test.out 2>&1
eval_tap $? 157 'AdminBulkGetUsersPlatform' test.out

#- 158 AdminInviteUserV3
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddresses": ["TbnIf2Gk", "AtXTUWBr", "Uf1qZKcN"], "isAdmin": true, "namespace": "RsivcLnh", "roles": ["5XXudfUL", "amf7sbdy", "Ntn5UqvU"]}' \
    > test.out 2>&1
eval_tap $? 158 'AdminInviteUserV3' test.out

#- 159 AdminQueryThirdPlatformLinkHistoryV3
./ng net.accelbyte.sdk.cli.Main iam adminQueryThirdPlatformLinkHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '60' \
    --offset '67' \
    --platformUserId 'HluDKpQ9' \
    --platformId '3xwPl1sr' \
    > test.out 2>&1
eval_tap $? 159 'AdminQueryThirdPlatformLinkHistoryV3' test.out

#- 160 AdminListUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminListUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '100' \
    --offset '66' \
    > test.out 2>&1
eval_tap $? 160 'AdminListUsersV3' test.out

#- 161 AdminSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam adminSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'cBR2hlYA' \
    --endDate 'VjTosuFA' \
    --includeTotal  \
    --limit '63' \
    --offset '62' \
    --platformBy 'iVhZbuHj' \
    --platformId '8psoxcfj' \
    --query 'LviPIlTs' \
    --roleIds '5KWNxWY5' \
    --skipLoginQueue  \
    --startDate 'btfTEqDX' \
    --testAccount  \
    > test.out 2>&1
eval_tap $? 161 'AdminSearchUserV3' test.out

#- 162 AdminGetBulkUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"listEmailAddressRequest": ["rFWTKhTI", "YJFZuQe8", "Fuu2ovvj"]}' \
    > test.out 2>&1
eval_tap $? 162 'AdminGetBulkUserByEmailAddressV3' test.out

#- 163 AdminGetUserByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'DEFpW9pk' \
    > test.out 2>&1
eval_tap $? 163 'AdminGetUserByUserIdV3' test.out

#- 164 AdminUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'UMEvQ8Qh' \
    --body '{"avatarUrl": "jULRzjzJ", "country": "OC9yco63", "dateOfBirth": "Ab73sVsA", "displayName": "3gUxVRIm", "languageTag": "jZWPwqkz", "skipLoginQueue": true, "uniqueDisplayName": "1r9B4ulQ", "userName": "LmryT8OH"}' \
    > test.out 2>&1
eval_tap $? 164 'AdminUpdateUserV3' test.out

#- 165 AdminGetUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'FjaPew7L' \
    --activeOnly  \
    --after 'mQ7X20pI' \
    --before 'u2KgBBAJ' \
    --limit '39' \
    > test.out 2>&1
eval_tap $? 165 'AdminGetUserBanV3' test.out

#- 166 AdminBanUserV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'LoBOGmz7' \
    --body '{"ban": "sovFnKar", "comment": "zyVr6y0A", "endDate": "zPubh4rr", "reason": "XF6SFCXh", "skipNotif": false}' \
    > test.out 2>&1
eval_tap $? 166 'AdminBanUserV3' test.out

#- 167 AdminUpdateUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserBanV3 \
    --banId 'ziti8W4f' \
    --namespace "$AB_NAMESPACE" \
    --userId 'gwztbovj' \
    --body '{"enabled": true, "skipNotif": true}' \
    > test.out 2>&1
eval_tap $? 167 'AdminUpdateUserBanV3' test.out

#- 168 AdminSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ks41XFez' \
    --body '{"context": "06bFgTWn", "emailAddress": "nH6uCbff", "languageTag": "ASsSDRUC"}' \
    > test.out 2>&1
eval_tap $? 168 'AdminSendVerificationCodeV3' test.out

#- 169 AdminVerifyAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ijuvq4EI' \
    --body '{"Code": "6DnHIpgu", "ContactType": "plnDQxsM", "LanguageTag": "nimnB4vu", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 169 'AdminVerifyAccountV3' test.out

#- 170 GetUserVerificationCode
./ng net.accelbyte.sdk.cli.Main iam getUserVerificationCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'UqtnR0dU' \
    > test.out 2>&1
eval_tap $? 170 'GetUserVerificationCode' test.out

#- 171 AdminGetUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '57fp7Hmz' \
    > test.out 2>&1
eval_tap $? 171 'AdminGetUserDeletionStatusV3' test.out

#- 172 AdminUpdateUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'iSG2XEZG' \
    --body '{"deletionDate": 60, "enabled": true}' \
    > test.out 2>&1
eval_tap $? 172 'AdminUpdateUserDeletionStatusV3' test.out

#- 173 AdminListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'a82Q84bW' \
    > test.out 2>&1
eval_tap $? 173 'AdminListUserAllPlatformAccountsDistinctV3' test.out

#- 174 AdminUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'WBE2qXrG' \
    --body '{"code": "Fd1a6pVU", "country": "8AT99pLC", "dateOfBirth": "Yc4fs4KG", "displayName": "ZD1j0UE0", "emailAddress": "MBy1y9y2", "password": "YpR23zFN", "uniqueDisplayName": "6VoSR2RO", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 174 'AdminUpgradeHeadlessAccountV3' test.out

#- 175 AdminDeleteUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'yLpMeQPa' \
    > test.out 2>&1
eval_tap $? 175 'AdminDeleteUserInformationV3' test.out

#- 176 AdminGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'yalN0Cfa' \
    --after '0.5886554495262258' \
    --before '0.8851765248435611' \
    --limit '87' \
    > test.out 2>&1
eval_tap $? 176 'AdminGetUserLoginHistoriesV3' test.out

#- 177 AdminResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam adminResetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '7iUs9ouH' \
    --body '{"languageTag": "xGS2Jg1i", "newPassword": "cuT5M9fb", "oldPassword": "Xqi8hjwX"}' \
    > test.out 2>&1
eval_tap $? 177 'AdminResetPasswordV3' test.out

#- 178 AdminUpdateUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserPermissionV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'eJORYDsh' \
    --body '{"Permissions": [{"Action": 33, "Resource": "Frnr57kS", "SchedAction": 27, "SchedCron": "yVZcZ8y8", "SchedRange": ["qTCFcqi6", "zzX5bVHe", "kRG7IgEm"]}, {"Action": 54, "Resource": "wlPK2vZZ", "SchedAction": 83, "SchedCron": "6jKqwW72", "SchedRange": ["G8BAvgCf", "Z3iyEvtZ", "PuYkbtP0"]}, {"Action": 91, "Resource": "iojY3lOu", "SchedAction": 100, "SchedCron": "KfzPCZpm", "SchedRange": ["kilWSg5h", "Espcli9Z", "YUFjj2YX"]}]}' \
    > test.out 2>&1
eval_tap $? 178 'AdminUpdateUserPermissionV3' test.out

#- 179 AdminAddUserPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserPermissionsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '3jvMMZdY' \
    --body '{"Permissions": [{"Action": 81, "Resource": "rzk0Hgr3", "SchedAction": 65, "SchedCron": "lvJibeGU", "SchedRange": ["Ys4XHo6f", "EJhCzgA8", "sk2yAklr"]}, {"Action": 86, "Resource": "nPzzEX9b", "SchedAction": 32, "SchedCron": "fMzeqBz0", "SchedRange": ["qhxrjTLV", "vkJRUmym", "1CKG8cOW"]}, {"Action": 93, "Resource": "o0YFvEfJ", "SchedAction": 29, "SchedCron": "cp6PeCcd", "SchedRange": ["PUi0XLOc", "js0nFfKU", "fZ09ksVH"]}]}' \
    > test.out 2>&1
eval_tap $? 179 'AdminAddUserPermissionsV3' test.out

#- 180 AdminDeleteUserPermissionBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '3KkVzsw2' \
    --body '[{"Action": 46, "Resource": "0Q3sovC1"}, {"Action": 11, "Resource": "sukQFVuu"}, {"Action": 99, "Resource": "k7Y8KMB4"}]' \
    > test.out 2>&1
eval_tap $? 180 'AdminDeleteUserPermissionBulkV3' test.out

#- 181 AdminDeleteUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionV3 \
    --action '77' \
    --namespace "$AB_NAMESPACE" \
    --resource '8BMyEgru' \
    --userId 'pgcPrbAZ' \
    > test.out 2>&1
eval_tap $? 181 'AdminDeleteUserPermissionV3' test.out

#- 182 AdminGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'oZUkjFKZ' \
    --after 'LaPhyoii' \
    --before 't127snab' \
    --limit '36' \
    --platformId 'fCDA6VxU' \
    > test.out 2>&1
eval_tap $? 182 'AdminGetUserPlatformAccountsV3' test.out

#- 183 AdminGetListJusticePlatformAccounts
./ng net.accelbyte.sdk.cli.Main iam adminGetListJusticePlatformAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'VD9GFt8s' \
    > test.out 2>&1
eval_tap $? 183 'AdminGetListJusticePlatformAccounts' test.out

#- 184 AdminGetUserMapping
./ng net.accelbyte.sdk.cli.Main iam adminGetUserMapping \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'bBtbACwv' \
    --userId 'KXzPeKxv' \
    > test.out 2>&1
eval_tap $? 184 'AdminGetUserMapping' test.out

#- 185 AdminCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam adminCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'YwvgSdEa' \
    --userId 'PbU7Xbnx' \
    > test.out 2>&1
eval_tap $? 185 'AdminCreateJusticeUser' test.out

#- 186 AdminLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'GBdVvYp7' \
    --skipConflict  \
    --body '{"platformId": "FvQH66SO", "platformUserId": "FhZGnRTs"}' \
    > test.out 2>&1
eval_tap $? 186 'AdminLinkPlatformAccount' test.out

#- 187 AdminPlatformUnlinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformUnlinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'M89FXiJc' \
    --userId 'HyNrlqPp' \
    --body '{"platformNamespace": "7izmAlrX"}' \
    > test.out 2>&1
eval_tap $? 187 'AdminPlatformUnlinkV3' test.out

#- 188 AdminPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'SvOIfjU1' \
    --userId 'PkfsipNG' \
    > test.out 2>&1
eval_tap $? 188 'AdminPlatformUnlinkAllV3' test.out

#- 189 AdminPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'xVrKkl0E' \
    --userId 'VKfc8n66' \
    --ticket 'mUNmycXb' \
    > test.out 2>&1
eval_tap $? 189 'AdminPlatformLinkV3' test.out

#- 190 AdminDeleteUserLinkingHistoryByPlatformIDV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserLinkingHistoryByPlatformIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'ttIjxo3v' \
    --userId 'gYtLt9HG' \
    > test.out 2>&1
eval_tap $? 190 'AdminDeleteUserLinkingHistoryByPlatformIDV3' test.out

#- 191 AdminGetThirdPartyPlatformTokenLinkStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetThirdPartyPlatformTokenLinkStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'NhQHUsAZ' \
    --userId 'VjcFeyEh' \
    --platformToken 'ssCHNJx3' \
    > test.out 2>&1
eval_tap $? 191 'AdminGetThirdPartyPlatformTokenLinkStatusV3' test.out

#- 192 AdminGetUserSinglePlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminGetUserSinglePlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --platformId 'FXGTEgVn' \
    --userId 'ImH7l0Pq' \
    > test.out 2>&1
eval_tap $? 192 'AdminGetUserSinglePlatformAccount' test.out

#- 193 AdminDeleteUserRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRolesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'uW0rzVeM' \
    --body '["Zxxnlkfo", "QvjeCpyB", "wCHy0iIf"]' \
    > test.out 2>&1
eval_tap $? 193 'AdminDeleteUserRolesV3' test.out

#- 194 AdminSaveUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminSaveUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'CW6dJYX5' \
    --body '[{"namespace": "9mYnDuYy", "roleId": "ufKSBtRl"}, {"namespace": "fW414itz", "roleId": "z2ueDs8V"}, {"namespace": "eJFIjxWt", "roleId": "GCbGxwu0"}]' \
    > test.out 2>&1
eval_tap $? 194 'AdminSaveUserRoleV3' test.out

#- 195 AdminAddUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'wyikpPcv' \
    --userId 'syqNsRox' \
    > test.out 2>&1
eval_tap $? 195 'AdminAddUserRoleV3' test.out

#- 196 AdminDeleteUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'NXpqXWJn' \
    --userId 'BO71JkGJ' \
    > test.out 2>&1
eval_tap $? 196 'AdminDeleteUserRoleV3' test.out

#- 197 AdminUpdateUserStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'VfVMFEg1' \
    --body '{"enabled": false, "reason": "AfytAVbe"}' \
    > test.out 2>&1
eval_tap $? 197 'AdminUpdateUserStatusV3' test.out

#- 198 AdminTrustlyUpdateUserIdentity
./ng net.accelbyte.sdk.cli.Main iam adminTrustlyUpdateUserIdentity \
    --namespace "$AB_NAMESPACE" \
    --userId 'eUdsOhYx' \
    --body '{"emailAddress": "AUu2TVYl", "password": "NjJZ3V8L"}' \
    > test.out 2>&1
eval_tap $? 198 'AdminTrustlyUpdateUserIdentity' test.out

#- 199 AdminVerifyUserWithoutVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyUserWithoutVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'JRUj6Xen' \
    > test.out 2>&1
eval_tap $? 199 'AdminVerifyUserWithoutVerificationCodeV3' test.out

#- 200 AdminUpdateClientSecretV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientSecretV3 \
    --clientId 'x0Lld520' \
    --namespace "$AB_NAMESPACE" \
    --body '{"newSecret": "gHxG8IeD"}' \
    > test.out 2>&1
eval_tap $? 200 'AdminUpdateClientSecretV3' test.out

#- 201 AdminCheckThirdPartyLoginPlatformAvailabilityV3
./ng net.accelbyte.sdk.cli.Main iam adminCheckThirdPartyLoginPlatformAvailabilityV3 \
    --platformId 'KroVC5sn' \
    > test.out 2>&1
eval_tap $? 201 'AdminCheckThirdPartyLoginPlatformAvailabilityV3' test.out

#- 202 AdminGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV3 \
    --after 'RDxOxJZr' \
    --before 'jHyaWG9B' \
    --isWildcard  \
    --limit '49' \
    > test.out 2>&1
eval_tap $? 202 'AdminGetRolesV3' test.out

#- 203 AdminCreateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV3 \
    --body '{"adminRole": false, "deletable": true, "isWildcard": false, "managers": [{"displayName": "AgXQJVQO", "namespace": "o9lKtxrb", "userId": "1qDKbR1r"}, {"displayName": "Rlq8HF10", "namespace": "wPScWoH2", "userId": "ekyRejNy"}, {"displayName": "n0UxfWFu", "namespace": "if5ikuM8", "userId": "yTAWHAwZ"}], "members": [{"displayName": "28ywBf3V", "namespace": "JvT3ZxXd", "userId": "03ujXfgp"}, {"displayName": "sQ4YvPA6", "namespace": "a9gUEid5", "userId": "pU5wj5CU"}, {"displayName": "DUPyDVTW", "namespace": "8Wt2YC0r", "userId": "Gw1HihKp"}], "permissions": [{"action": 8, "resource": "Rxu39yrg", "schedAction": 22, "schedCron": "aw8FAQuM", "schedRange": ["GtdSguLj", "YeMTylu6", "BjuAKHJP"]}, {"action": 45, "resource": "xudeoRcr", "schedAction": 69, "schedCron": "vXNmdOsw", "schedRange": ["ubQwQJAI", "CdgkL49n", "WKaNmTDt"]}, {"action": 25, "resource": "nvUxYML2", "schedAction": 17, "schedCron": "fs56oesQ", "schedRange": ["hSvH2MRQ", "HVu8se7M", "OEW5tndZ"]}], "roleName": "VI96PYJm"}' \
    > test.out 2>&1
eval_tap $? 203 'AdminCreateRoleV3' test.out

#- 204 AdminGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV3 \
    --roleId 'zY4qAgXu' \
    > test.out 2>&1
eval_tap $? 204 'AdminGetRoleV3' test.out

#- 205 AdminDeleteRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV3 \
    --roleId 'RLxDvR52' \
    > test.out 2>&1
eval_tap $? 205 'AdminDeleteRoleV3' test.out

#- 206 AdminUpdateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV3 \
    --roleId 'OyUp3evK' \
    --body '{"deletable": true, "isWildcard": false, "roleName": "Cr7i8DMV"}' \
    > test.out 2>&1
eval_tap $? 206 'AdminUpdateRoleV3' test.out

#- 207 AdminGetRoleAdminStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleAdminStatusV3 \
    --roleId '0DK0h0II' \
    > test.out 2>&1
eval_tap $? 207 'AdminGetRoleAdminStatusV3' test.out

#- 208 AdminUpdateAdminRoleStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateAdminRoleStatusV3 \
    --roleId '83FjvOsA' \
    > test.out 2>&1
eval_tap $? 208 'AdminUpdateAdminRoleStatusV3' test.out

#- 209 AdminRemoveRoleAdminV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleAdminV3 \
    --roleId 'kqGgk7QA' \
    > test.out 2>&1
eval_tap $? 209 'AdminRemoveRoleAdminV3' test.out

#- 210 AdminGetRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleManagersV3 \
    --roleId 'yeGaAJwQ' \
    --after 'P5Y7YhcH' \
    --before 'cWPereyV' \
    --limit '48' \
    > test.out 2>&1
eval_tap $? 210 'AdminGetRoleManagersV3' test.out

#- 211 AdminAddRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleManagersV3 \
    --roleId 'uL4Cirvl' \
    --body '{"managers": [{"displayName": "nDha8xqU", "namespace": "XJHbS1Ir", "userId": "URTQdKo3"}, {"displayName": "K5TELifO", "namespace": "RXq14DVV", "userId": "BLNjNEPr"}, {"displayName": "wvyHF3yB", "namespace": "AtTqJwQa", "userId": "0rBHx8pa"}]}' \
    > test.out 2>&1
eval_tap $? 211 'AdminAddRoleManagersV3' test.out

#- 212 AdminRemoveRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleManagersV3 \
    --roleId '6rhzMYCK' \
    --body '{"managers": [{"displayName": "qafgvGsD", "namespace": "2irJYZZH", "userId": "8B4yoPJi"}, {"displayName": "hk1Ks9Nf", "namespace": "tnTsCoZ4", "userId": "vsiWyNI8"}, {"displayName": "bVaW2UhA", "namespace": "NbgAXLcX", "userId": "BqCAgCDy"}]}' \
    > test.out 2>&1
eval_tap $? 212 'AdminRemoveRoleManagersV3' test.out

#- 213 AdminGetRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleMembersV3 \
    --roleId 'b8YIDk9I' \
    --after '7CmuoQwe' \
    --before 'S99l2F39' \
    --limit '23' \
    > test.out 2>&1
eval_tap $? 213 'AdminGetRoleMembersV3' test.out

#- 214 AdminAddRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleMembersV3 \
    --roleId 'OSUUB3pb' \
    --body '{"members": [{"displayName": "LsfJ4kVX", "namespace": "v2hMai9w", "userId": "xDta5mjR"}, {"displayName": "iuI7EZg4", "namespace": "BhzE2xGz", "userId": "KV6o0M5o"}, {"displayName": "sbFS8cfO", "namespace": "kT06x7Rk", "userId": "oU3lCUWE"}]}' \
    > test.out 2>&1
eval_tap $? 214 'AdminAddRoleMembersV3' test.out

#- 215 AdminRemoveRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleMembersV3 \
    --roleId 'tYIUVvES' \
    --body '{"members": [{"displayName": "puwDEmAQ", "namespace": "c4cBDQgY", "userId": "5oLSdL33"}, {"displayName": "yr0KAMSR", "namespace": "4VfaCLb5", "userId": "wVaCbXnt"}, {"displayName": "r6yWSqVO", "namespace": "ZuTgP9b9", "userId": "aoYAdmjt"}]}' \
    > test.out 2>&1
eval_tap $? 215 'AdminRemoveRoleMembersV3' test.out

#- 216 AdminUpdateRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV3 \
    --roleId 'Yia2Zg1I' \
    --body '{"permissions": [{"action": 6, "resource": "XP5G8pM6", "schedAction": 81, "schedCron": "rAswJcvF", "schedRange": ["Xq0hFoiU", "aWLn8Jqf", "FgTKx3kO"]}, {"action": 52, "resource": "TYCx7OGU", "schedAction": 58, "schedCron": "sMYuuRpk", "schedRange": ["q67sNiZy", "U45TkPIH", "dMAkMRiY"]}, {"action": 65, "resource": "Bt6eh5oZ", "schedAction": 34, "schedCron": "13nkNTiH", "schedRange": ["iF8VGsWq", "VTWJixSW", "4MJ8D9LE"]}]}' \
    > test.out 2>&1
eval_tap $? 216 'AdminUpdateRolePermissionsV3' test.out

#- 217 AdminAddRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV3 \
    --roleId 'tifjmfwy' \
    --body '{"permissions": [{"action": 76, "resource": "lOgHRaGm", "schedAction": 39, "schedCron": "0LzOAnI5", "schedRange": ["HKqHXB12", "Zadqq0Yn", "irpi1Btp"]}, {"action": 1, "resource": "UALUs77f", "schedAction": 72, "schedCron": "k9aStryL", "schedRange": ["Dbr8OJVW", "3VjXvc00", "CWGZi0zj"]}, {"action": 37, "resource": "41RXyZlv", "schedAction": 74, "schedCron": "28sX0Zgr", "schedRange": ["uxAy73xM", "RgNnsYBY", "wA37CIaI"]}]}' \
    > test.out 2>&1
eval_tap $? 217 'AdminAddRolePermissionsV3' test.out

#- 218 AdminDeleteRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV3 \
    --roleId 'izzcQk2B' \
    --body '["tbUERpsG", "d9POa3H8", "slScaAMx"]' \
    > test.out 2>&1
eval_tap $? 218 'AdminDeleteRolePermissionsV3' test.out

#- 219 AdminDeleteRolePermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionV3 \
    --action '4' \
    --resource 'Z6WuO9ka' \
    --roleId '0KgYL8e8' \
    > test.out 2>&1
eval_tap $? 219 'AdminDeleteRolePermissionV3' test.out

#- 220 AdminGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam adminGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 220 'AdminGetMyUserV3' test.out

#- 221 UserAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam userAuthenticationV3 \
    --clientId 'acqyIm1r' \
    --extendExp  \
    --redirectUri 'tY9dZkjb' \
    --password 'OGzBUCCR' \
    --requestId 'IpfmfT3m' \
    --userName 'vA9jA10t' \
    > test.out 2>&1
eval_tap $? 221 'UserAuthenticationV3' test.out

#- 222 AuthenticationWithPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV3 \
    --extendExp  \
    --clientId 'suncK8iI' \
    --linkingToken 'CK5vuInc' \
    --password 't7vVFkev' \
    --username 'JQ3aGi3R' \
    > test.out 2>&1
eval_tap $? 222 'AuthenticationWithPlatformLinkV3' test.out

#- 223 GenerateTokenByNewHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV3 \
    --additionalData 'ZIDyRGWv' \
    --extendExp  \
    --linkingToken '1f6Kxq7c' \
    > test.out 2>&1
eval_tap $? 223 'GenerateTokenByNewHeadlessAccountV3' test.out

#- 224 RequestOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam requestOneTimeLinkingCodeV3 \
    --platformId 'xGu57n4Z' \
    > test.out 2>&1
eval_tap $? 224 'RequestOneTimeLinkingCodeV3' test.out

#- 225 ValidateOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam validateOneTimeLinkingCodeV3 \
    --oneTimeLinkCode '4bWKLU6n' \
    > test.out 2>&1
eval_tap $? 225 'ValidateOneTimeLinkingCodeV3' test.out

#- 226 RequestTokenByOneTimeLinkCodeResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTokenByOneTimeLinkCodeResponseV3 \
    --additionalData 'MpYS7Ta8' \
    --isTransient  \
    --clientId 'Gi6gE5F8' \
    --oneTimeLinkCode 'CoVNR6Ou' \
    > test.out 2>&1
eval_tap $? 226 'RequestTokenByOneTimeLinkCodeResponseV3' test.out

#- 227 GetCountryLocationV3
./ng net.accelbyte.sdk.cli.Main iam getCountryLocationV3 \
    > test.out 2>&1
eval_tap $? 227 'GetCountryLocationV3' test.out

#- 228 Logout
./ng net.accelbyte.sdk.cli.Main iam logout \
    > test.out 2>&1
eval_tap $? 228 'Logout' test.out

#- 229 RequestTokenExchangeCodeV3
./ng net.accelbyte.sdk.cli.Main iam requestTokenExchangeCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --codeChallenge 'vioJWSXP' \
    --codeChallengeMethod 'S256' \
    --clientId 'YLYjrXmc' \
    > test.out 2>&1
eval_tap $? 229 'RequestTokenExchangeCodeV3' test.out

#- 230 AdminRetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam adminRetrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'oKjtLUjv' \
    --userId 'jraol4q2' \
    --platformUserId 'fn7OosDO' \
    > test.out 2>&1
eval_tap $? 230 'AdminRetrieveUserThirdPartyPlatformTokenV3' test.out

#- 231 RevokeUserV3
./ng net.accelbyte.sdk.cli.Main iam revokeUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '6oTXugGQ' \
    --includeGameNamespace  \
    > test.out 2>&1
eval_tap $? 231 'RevokeUserV3' test.out

#- 232 AuthorizeV3
./ng net.accelbyte.sdk.cli.Main iam authorizeV3 \
    --codeChallenge 'Zk0v2Tw0' \
    --codeChallengeMethod 'S256' \
    --createHeadless  \
    --oneTimeLinkCode '1rGbxmx2' \
    --redirectUri 'jZER9Dq8' \
    --scope '5Dq2KMH4' \
    --state '0lR09QiQ' \
    --targetAuthPage 'EY3bKJXr' \
    --useRedirectUriAsLoginUrlWhenLocked  \
    --clientId 'FG7W0FRy' \
    --responseType 'code' \
    > test.out 2>&1
eval_tap $? 232 'AuthorizeV3' test.out

#- 233 TokenIntrospectionV3
./ng net.accelbyte.sdk.cli.Main iam tokenIntrospectionV3 \
    --token 'HQvcNxUV' \
    > test.out 2>&1
eval_tap $? 233 'TokenIntrospectionV3' test.out

#- 234 GetJWKSV3
./ng net.accelbyte.sdk.cli.Main iam getJWKSV3 \
    > test.out 2>&1
eval_tap $? 234 'GetJWKSV3' test.out

#- 235 SendMFAAuthenticationCode
./ng net.accelbyte.sdk.cli.Main iam sendMFAAuthenticationCode \
    --clientId '2MDT8Kmt' \
    --factor 'pKNrtU40' \
    --mfaToken 'Mn22mY0y' \
    > test.out 2>&1
eval_tap $? 235 'SendMFAAuthenticationCode' test.out

#- 236 Change2faMethod
./ng net.accelbyte.sdk.cli.Main iam change2faMethod \
    --factor 'iHoXXUEs' \
    --mfaToken 'S5pIjb4b' \
    > test.out 2>&1
eval_tap $? 236 'Change2faMethod' test.out

#- 237 Verify2faCode
./ng net.accelbyte.sdk.cli.Main iam verify2faCode \
    --code '0Bpc4wH8' \
    --factor 'xg9C5KP3' \
    --mfaToken '0HJV0mSg' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 237 'Verify2faCode' test.out

#- 238 RetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam retrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Y6QXObek' \
    --userId '9UyfKKoS' \
    > test.out 2>&1
eval_tap $? 238 'RetrieveUserThirdPartyPlatformTokenV3' test.out

#- 239 AuthCodeRequestV3
./ng net.accelbyte.sdk.cli.Main iam authCodeRequestV3 \
    --platformId 'lQ1qbhy9' \
    --clientId 'nkWFtQcX' \
    --redirectUri 'jjHw4zHw' \
    --requestId 'Uxgy09Ws' \
    > test.out 2>&1
eval_tap $? 239 'AuthCodeRequestV3' test.out

#- 240 PlatformTokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV3 \
    --platformId 'eSGUebcT' \
    --additionalData 'FL8rfV4k' \
    --clientId 'xCWG2YsF' \
    --createHeadless  \
    --deviceId '7NyuWXfi' \
    --macAddress 'BkrNnSxU' \
    --platformToken 'XMJUet0U' \
    --skipSetCookie  \
    > test.out 2>&1
eval_tap $? 240 'PlatformTokenGrantV3' test.out

#- 241 GetRevocationListV3
./ng net.accelbyte.sdk.cli.Main iam getRevocationListV3 \
    > test.out 2>&1
eval_tap $? 241 'GetRevocationListV3' test.out

#- 242 TokenRevocationV3
./ng net.accelbyte.sdk.cli.Main iam tokenRevocationV3 \
    --token 'LYoORfe1' \
    > test.out 2>&1
eval_tap $? 242 'TokenRevocationV3' test.out

#- 243 SimultaneousLoginV3
./ng net.accelbyte.sdk.cli.Main iam simultaneousLoginV3 \
    --simultaneousPlatform 'JJCsT6m6' \
    --simultaneousTicket 'x3YvWEed' \
    --nativePlatform 'steam' \
    --nativePlatformTicket 'TF2Ik9On' \
    > test.out 2>&1
eval_tap $? 243 'SimultaneousLoginV3' test.out

#- 244 TokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV3 \
    --additionalData 'MlRwRU94' \
    --clientId 'Qa2Qsxra' \
    --code 'tcg6KC3c' \
    --codeVerifier 'MsARTFnJ' \
    --extendNamespace 'dEwYDc5v' \
    --extendExp  \
    --password 'ZA6h1u0s' \
    --redirectUri 'L9KYXXsR' \
    --refreshToken 'yToS5M4D' \
    --username 'Pj26YXgm' \
    --grantType 'refresh_token' \
    > test.out 2>&1
eval_tap $? 244 'TokenGrantV3' test.out

#- 245 VerifyTokenV3
./ng net.accelbyte.sdk.cli.Main iam verifyTokenV3 \
    --token 'tVzCQ4dp' \
    > test.out 2>&1
eval_tap $? 245 'VerifyTokenV3' test.out

#- 246 PlatformAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticationV3 \
    --platformId 'ZALe1f86' \
    --code 're8L9zBM' \
    --error 'W3BOFi6j' \
    --openidAssocHandle 'xsCg0F5v' \
    --openidClaimedId 'B8XOYJur' \
    --openidIdentity 'v4iyRzTZ' \
    --openidMode 'XNKKKjMa' \
    --openidNs 'TQ1Pq2jS' \
    --openidOpEndpoint 'Y9shovJG' \
    --openidResponseNonce '3FmkD65F' \
    --openidReturnTo 'kffC2TIW' \
    --openidSig 'X6U5MUkm' \
    --openidSigned 'wz6eaI8h' \
    --state 'Bixazy3Y' \
    > test.out 2>&1
eval_tap $? 246 'PlatformAuthenticationV3' test.out

#- 247 PlatformTokenRefreshV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenRefreshV3 \
    --platformId 'pZbxkapt' \
    --platformToken 'GPXLydPA' \
    > test.out 2>&1
eval_tap $? 247 'PlatformTokenRefreshV3' test.out

#- 248 PublicGetInputValidations
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidations \
    --defaultOnEmpty  \
    --languageCode 'BO31xZS5' \
    > test.out 2>&1
eval_tap $? 248 'PublicGetInputValidations' test.out

#- 249 PublicGetInputValidationByField
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidationByField \
    --field 'JCiILpaq' \
    > test.out 2>&1
eval_tap $? 249 'PublicGetInputValidationByField' test.out

#- 250 PublicGetCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam publicGetCountryAgeRestrictionV3 \
    --countryCode 'ihCMj7J2' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 250 'PublicGetCountryAgeRestrictionV3' test.out

#- 251 PublicGetConfigValueV3
./ng net.accelbyte.sdk.cli.Main iam publicGetConfigValueV3 \
    --configKey 'qc42L9hS' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 251 'PublicGetConfigValueV3' test.out

#- 252 PublicGetCountryListV3
./ng net.accelbyte.sdk.cli.Main iam publicGetCountryListV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 252 'PublicGetCountryListV3' test.out

#- 253 RetrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3
./ng net.accelbyte.sdk.cli.Main iam retrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 253 'RetrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3' test.out

#- 254 RetrieveActiveOIDCClientsPublicV3
./ng net.accelbyte.sdk.cli.Main iam retrieveActiveOIDCClientsPublicV3 \
    --namespace "$AB_NAMESPACE" \
    --clientId 'Qrle9iA9' \
    > test.out 2>&1
eval_tap $? 254 'RetrieveActiveOIDCClientsPublicV3' test.out

#- 255 PublicListUserIDByPlatformUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserIDByPlatformUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'dOzbq5ez' \
    --rawPID  \
    --body '{"platformUserIds": ["QlUljm0U", "u5X8oVDQ", "vbGouNmd"]}' \
    > test.out 2>&1
eval_tap $? 255 'PublicListUserIDByPlatformUserIDsV3' test.out

#- 256 PublicGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'dL8FtgrS' \
    --platformUserId 'pZjYxrab' \
    > test.out 2>&1
eval_tap $? 256 'PublicGetUserByPlatformUserIDV3' test.out

#- 257 PublicGetAsyncStatus
./ng net.accelbyte.sdk.cli.Main iam publicGetAsyncStatus \
    --namespace "$AB_NAMESPACE" \
    --requestId '28UN0iFX' \
    > test.out 2>&1
eval_tap $? 257 'PublicGetAsyncStatus' test.out

#- 258 PublicSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam publicSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by '7fns8fNg' \
    --limit '2' \
    --offset '100' \
    --platformBy 'OeA8JKCI' \
    --platformId 'EUrts8Ra' \
    --query 'wCixJLvF' \
    > test.out 2>&1
eval_tap $? 258 'PublicSearchUserV3' test.out

#- 259 PublicCreateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "WDC5SdVO", "acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "E2h0Ygiq", "policyId": "2n84uaxy", "policyVersionId": "EPw3H9Ne"}, {"isAccepted": true, "localizedPolicyVersionId": "aQd65NaJ", "policyId": "o2YiUOwB", "policyVersionId": "bGbIgddt"}, {"isAccepted": false, "localizedPolicyVersionId": "KVvQuwex", "policyId": "3YxI2jCh", "policyVersionId": "B53FPZJ2"}], "authType": "5PS3UK9m", "code": "7CmuheVb", "country": "aoIl0BzN", "dateOfBirth": "G3KKqlH6", "displayName": "1dZjcyRU", "emailAddress": "UYYlnYZs", "password": "9xPmT7OR", "reachMinimumAge": true, "uniqueDisplayName": "lgExFJd3"}' \
    > test.out 2>&1
eval_tap $? 259 'PublicCreateUserV3' test.out

#- 260 CheckUserAvailability
./ng net.accelbyte.sdk.cli.Main iam checkUserAvailability \
    --namespace "$AB_NAMESPACE" \
    --field 'DbqDzOO9' \
    --query 'TsfQGa4Z' \
    > test.out 2>&1
eval_tap $? 260 'CheckUserAvailability' test.out

#- 261 PublicBulkGetUsers
./ng net.accelbyte.sdk.cli.Main iam publicBulkGetUsers \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["IEVoxFKm", "kQWFi6va", "ZK0YwnaC"]}' \
    > test.out 2>&1
eval_tap $? 261 'PublicBulkGetUsers' test.out

#- 262 PublicSendRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicSendRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "Prvq5g4E", "languageTag": "kjP96Rdn"}' \
    > test.out 2>&1
eval_tap $? 262 'PublicSendRegistrationCode' test.out

#- 263 PublicVerifyRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicVerifyRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "jyGEzKC4", "emailAddress": "bWP5WpWZ"}' \
    > test.out 2>&1
eval_tap $? 263 'PublicVerifyRegistrationCode' test.out

#- 264 PublicForgotPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicForgotPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "hCjjTwW1", "languageTag": "21K3viNU"}' \
    > test.out 2>&1
eval_tap $? 264 'PublicForgotPasswordV3' test.out

#- 265 GetAdminInvitationV3
./ng net.accelbyte.sdk.cli.Main iam getAdminInvitationV3 \
    --invitationId 'exsdlqIy' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 265 'GetAdminInvitationV3' test.out

#- 266 CreateUserFromInvitationV3
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV3 \
    --invitationId 'qmIebn7l' \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "7riIXQf4", "acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "LATNCZos", "policyId": "vYr0VZDz", "policyVersionId": "gJNNu8LL"}, {"isAccepted": false, "localizedPolicyVersionId": "KwDE9vGC", "policyId": "A8VAWcns", "policyVersionId": "revDCRZN"}, {"isAccepted": true, "localizedPolicyVersionId": "Oh9Cv46n", "policyId": "znSC6EIw", "policyVersionId": "Ok40SGMz"}], "authType": "ZQ4er8uS", "code": "pIVOBlUp", "country": "4cLEXNBz", "dateOfBirth": "TlwBCGv6", "displayName": "4UcPIy8q", "emailAddress": "Slnc4F9s", "password": "P8MO01Sg", "reachMinimumAge": true, "uniqueDisplayName": "0bGOSKYR"}' \
    > test.out 2>&1
eval_tap $? 266 'CreateUserFromInvitationV3' test.out

#- 267 UpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam updateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "D2roFh2v", "country": "SdNkN9Y0", "dateOfBirth": "lnfzNhvx", "displayName": "gWMWKpo6", "languageTag": "YrW8ANd0", "uniqueDisplayName": "gk7NNBru", "userName": "UPv9BsoD"}' \
    > test.out 2>&1
eval_tap $? 267 'UpdateUserV3' test.out

#- 268 PublicPartialUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicPartialUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "WezQosOy", "country": "Fle5S7uy", "dateOfBirth": "xSf5i8wa", "displayName": "PwBxCPiS", "languageTag": "D68kPEJh", "uniqueDisplayName": "wYo2tBDk", "userName": "iRiWBGDN"}' \
    > test.out 2>&1
eval_tap $? 268 'PublicPartialUpdateUserV3' test.out

#- 269 PublicSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"context": "BQi8bbcE", "emailAddress": "iXiUNaiE", "languageTag": "TS7t8woA"}' \
    > test.out 2>&1
eval_tap $? 269 'PublicSendVerificationCodeV3' test.out

#- 270 PublicUserVerificationV3
./ng net.accelbyte.sdk.cli.Main iam publicUserVerificationV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "g3Kr9DSe", "contactType": "kil7sgUz", "languageTag": "bkaUfK8M", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 270 'PublicUserVerificationV3' test.out

#- 271 PublicUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "RXp28diP", "country": "NdoCiKD8", "dateOfBirth": "YzdXhXJZ", "displayName": "KDKYhLJH", "emailAddress": "ipXVw0mb", "password": "D9p9zOmO", "uniqueDisplayName": "pOP40bew", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 271 'PublicUpgradeHeadlessAccountV3' test.out

#- 272 PublicVerifyHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --needVerificationCode  \
    --body '{"emailAddress": "JkyGE3kJ", "password": "dc8eOWQm"}' \
    > test.out 2>&1
eval_tap $? 272 'PublicVerifyHeadlessAccountV3' test.out

#- 273 PublicUpdatePasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicUpdatePasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"languageTag": "tAFomEpU", "newPassword": "r6Ec86Zs", "oldPassword": "LkZAE9xl"}' \
    > test.out 2>&1
eval_tap $? 273 'PublicUpdatePasswordV3' test.out

#- 274 PublicCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam publicCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'rXt76Fkm' \
    > test.out 2>&1
eval_tap $? 274 'PublicCreateJusticeUser' test.out

#- 275 PublicPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'hfjJLsKv' \
    --redirectUri 'jwgflyKa' \
    --ticket 'SYyvFoxQ' \
    > test.out 2>&1
eval_tap $? 275 'PublicPlatformLinkV3' test.out

#- 276 PublicPlatformUnlinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Dx9WL6nC' \
    --body '{"platformNamespace": "7g1Gjiwc"}' \
    > test.out 2>&1
eval_tap $? 276 'PublicPlatformUnlinkV3' test.out

#- 277 PublicPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Suc8f2Tc' \
    > test.out 2>&1
eval_tap $? 277 'PublicPlatformUnlinkAllV3' test.out

#- 278 PublicForcePlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicForcePlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'BXUto1yE' \
    --ticket 'mnWD6L2X' \
    > test.out 2>&1
eval_tap $? 278 'PublicForcePlatformLinkV3' test.out

#- 279 PublicWebLinkPlatform
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatform \
    --namespace "$AB_NAMESPACE" \
    --platformId 'RTg6lDTU' \
    --clientId 'migrclpr' \
    --redirectUri 'HxkmuCKI' \
    > test.out 2>&1
eval_tap $? 279 'PublicWebLinkPlatform' test.out

#- 280 PublicWebLinkPlatformEstablish
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatformEstablish \
    --namespace "$AB_NAMESPACE" \
    --platformId '3mR7k2Pn' \
    --code 'Ypip9t23' \
    --state 'iPMiYbQe' \
    > test.out 2>&1
eval_tap $? 280 'PublicWebLinkPlatformEstablish' test.out

#- 281 PublicProcessWebLinkPlatformV3
./ng net.accelbyte.sdk.cli.Main iam publicProcessWebLinkPlatformV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'kQrOJ61G' \
    --code 'XpNOuuYn' \
    --state 'TCQdzzgx' \
    > test.out 2>&1
eval_tap $? 281 'PublicProcessWebLinkPlatformV3' test.out

#- 282 PublicGetUsersPlatformInfosV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUsersPlatformInfosV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"platformId": "UCtqk4fU", "userIds": ["nBJYKxPt", "e0hwEkQF", "p9MOcZjH"]}' \
    > test.out 2>&1
eval_tap $? 282 'PublicGetUsersPlatformInfosV3' test.out

#- 283 ResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam resetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "HKK8DL27", "emailAddress": "mnIXiIB4", "newPassword": "BiiMBqDB"}' \
    > test.out 2>&1
eval_tap $? 283 'ResetPasswordV3' test.out

#- 284 PublicGetUserByUserIdV3
eval_tap 0 284 'PublicGetUserByUserIdV3 # SKIP deprecated' test.out

#- 285 PublicGetUserBanHistoryV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserBanHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'wUH2QPvs' \
    --activeOnly  \
    --after 'e9XKF3TS' \
    --before 'XgrZlBz5' \
    --limit '53' \
    > test.out 2>&1
eval_tap $? 285 'PublicGetUserBanHistoryV3' test.out

#- 286 PublicListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'fl8fIbab' \
    > test.out 2>&1
eval_tap $? 286 'PublicListUserAllPlatformAccountsDistinctV3' test.out

#- 287 PublicGetUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '0ikGKGMs' \
    > test.out 2>&1
eval_tap $? 287 'PublicGetUserInformationV3' test.out

#- 288 PublicGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'HJ1b9sbB' \
    --after '0.5000249854189968' \
    --before '0.9056562739027811' \
    --limit '29' \
    > test.out 2>&1
eval_tap $? 288 'PublicGetUserLoginHistoriesV3' test.out

#- 289 PublicGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'wTDnbN2F' \
    --after 'yYqnmh5d' \
    --before 'A03Vb6Ti' \
    --limit '91' \
    --platformId 'iOjCUMWI' \
    > test.out 2>&1
eval_tap $? 289 'PublicGetUserPlatformAccountsV3' test.out

#- 290 PublicListJusticePlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicListJusticePlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'kK3cwF7L' \
    > test.out 2>&1
eval_tap $? 290 'PublicListJusticePlatformAccountsV3' test.out

#- 291 PublicLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam publicLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'HMll0jnO' \
    --body '{"platformId": "rp0YFlQn", "platformUserId": "Vd36EDHQ"}' \
    > test.out 2>&1
eval_tap $? 291 'PublicLinkPlatformAccount' test.out

#- 292 PublicForceLinkPlatformWithProgression
./ng net.accelbyte.sdk.cli.Main iam publicForceLinkPlatformWithProgression \
    --namespace "$AB_NAMESPACE" \
    --userId 'xRL9XOWn' \
    --body '{"chosenNamespaces": ["l0nOXq1m", "6uspgaI6", "cdvNVAmo"], "requestId": "EOs77trm"}' \
    > test.out 2>&1
eval_tap $? 292 'PublicForceLinkPlatformWithProgression' test.out

#- 293 PublicGetPublisherUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetPublisherUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '3k6Ipl0d' \
    > test.out 2>&1
eval_tap $? 293 'PublicGetPublisherUserV3' test.out

#- 294 PublicValidateUserByUserIDAndPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserByUserIDAndPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'dLRdyrqx' \
    --password 'q4RH7mnA' \
    > test.out 2>&1
eval_tap $? 294 'PublicValidateUserByUserIDAndPasswordV3' test.out

#- 295 PublicGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRolesV3 \
    --after 'NI8LnPA9' \
    --before 'pEChjqzz' \
    --isWildcard  \
    --limit '94' \
    > test.out 2>&1
eval_tap $? 295 'PublicGetRolesV3' test.out

#- 296 PublicGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRoleV3 \
    --roleId 'ybFu5SDq' \
    > test.out 2>&1
eval_tap $? 296 'PublicGetRoleV3' test.out

#- 297 PublicGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyUserV3 \
    --includeAllPlatforms  \
    > test.out 2>&1
eval_tap $? 297 'PublicGetMyUserV3' test.out

#- 298 PublicGetLinkHeadlessAccountToMyAccountConflictV3
./ng net.accelbyte.sdk.cli.Main iam publicGetLinkHeadlessAccountToMyAccountConflictV3 \
    --oneTimeLinkCode 'MMLx4lPn' \
    > test.out 2>&1
eval_tap $? 298 'PublicGetLinkHeadlessAccountToMyAccountConflictV3' test.out

#- 299 LinkHeadlessAccountToMyAccountV3
./ng net.accelbyte.sdk.cli.Main iam linkHeadlessAccountToMyAccountV3 \
    --body '{"chosenNamespaces": ["AQPnwvW3", "KDPqhAyC", "u8O9xixu"], "oneTimeLinkCode": "8Zuja3fr"}' \
    > test.out 2>&1
eval_tap $? 299 'LinkHeadlessAccountToMyAccountV3' test.out

#- 300 PublicSendVerificationLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationLinkV3 \
    --body '{"languageTag": "Hh60zqZF"}' \
    > test.out 2>&1
eval_tap $? 300 'PublicSendVerificationLinkV3' test.out

#- 301 PublicVerifyUserByLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyUserByLinkV3 \
    --code 'qeEUDxch' \
    > test.out 2>&1
eval_tap $? 301 'PublicVerifyUserByLinkV3' test.out

#- 302 PlatformAuthenticateSAMLV3Handler
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticateSAMLV3Handler \
    --platformId '2rruUxaB' \
    --code '903j376k' \
    --error 'Hd0cHxKO' \
    --state 'e3I7BdIF' \
    > test.out 2>&1
eval_tap $? 302 'PlatformAuthenticateSAMLV3Handler' test.out

#- 303 LoginSSOClient
./ng net.accelbyte.sdk.cli.Main iam loginSSOClient \
    --platformId 'aLQoV2TH' \
    --payload 'Knf5RGNT' \
    > test.out 2>&1
eval_tap $? 303 'LoginSSOClient' test.out

#- 304 LogoutSSOClient
./ng net.accelbyte.sdk.cli.Main iam logoutSSOClient \
    --platformId 'U2Ixn2pz' \
    > test.out 2>&1
eval_tap $? 304 'LogoutSSOClient' test.out

#- 305 RequestTargetTokenResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTargetTokenResponseV3 \
    --additionalData 'kbkFogWD' \
    --code 'T505oWI3' \
    > test.out 2>&1
eval_tap $? 305 'RequestTargetTokenResponseV3' test.out

#- 306 AdminListInvitationHistoriesV4
./ng net.accelbyte.sdk.cli.Main iam adminListInvitationHistoriesV4 \
    --limit '33' \
    --namespace "$AB_NAMESPACE" \
    --offset '22' \
    > test.out 2>&1
eval_tap $? 306 'AdminListInvitationHistoriesV4' test.out

#- 307 AdminGetDevicesByUserV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDevicesByUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Iho6DXZL' \
    > test.out 2>&1
eval_tap $? 307 'AdminGetDevicesByUserV4' test.out

#- 308 AdminGetBannedDevicesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedDevicesV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceType 'Rz5LlcJ3' \
    --endDate 'zhXUFpXT' \
    --limit '37' \
    --offset '0' \
    --startDate 'MJnZLT1p' \
    > test.out 2>&1
eval_tap $? 308 'AdminGetBannedDevicesV4' test.out

#- 309 AdminGetUserDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeviceBansV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'c910OoSG' \
    > test.out 2>&1
eval_tap $? 309 'AdminGetUserDeviceBansV4' test.out

#- 310 AdminBanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminBanDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"comment": "mfSMspXR", "deviceId": "bWzIkPFR", "deviceType": "gBwHMOGV", "enabled": false, "endDate": "cnDCOxDK", "ext": {"hUiGPbOP": {}, "bcpaRNgx": {}, "X6TsHjeK": {}}, "reason": "xbqNoL8O"}' \
    > test.out 2>&1
eval_tap $? 310 'AdminBanDeviceV4' test.out

#- 311 AdminGetDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBanV4 \
    --banId '7Zta4cgz' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 311 'AdminGetDeviceBanV4' test.out

#- 312 AdminUpdateDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateDeviceBanV4 \
    --banId 'tTTFrz3d' \
    --namespace "$AB_NAMESPACE" \
    --body '{"enabled": true}' \
    > test.out 2>&1
eval_tap $? 312 'AdminUpdateDeviceBanV4' test.out

#- 313 AdminGenerateReportV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateReportV4 \
    --namespace "$AB_NAMESPACE" \
    --endDate 'SsukE6LA' \
    --startDate 'HrLLe9bI' \
    --deviceType 'qf75vcez' \
    > test.out 2>&1
eval_tap $? 313 'AdminGenerateReportV4' test.out

#- 314 AdminGetDeviceTypesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceTypesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 314 'AdminGetDeviceTypesV4' test.out

#- 315 AdminGetDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBansV4 \
    --deviceId 'xq4dvZJy' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 315 'AdminGetDeviceBansV4' test.out

#- 316 AdminDecryptDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminDecryptDeviceV4 \
    --deviceId '0YxZphUJ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 316 'AdminDecryptDeviceV4' test.out

#- 317 AdminUnbanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminUnbanDeviceV4 \
    --deviceId 'v9vhaAWD' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 317 'AdminUnbanDeviceV4' test.out

#- 318 AdminGetUsersByDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUsersByDeviceV4 \
    --deviceId 'qOTYormu' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 318 'AdminGetUsersByDeviceV4' test.out

#- 319 AdminGetNamespaceInvitationHistoryV4
./ng net.accelbyte.sdk.cli.Main iam adminGetNamespaceInvitationHistoryV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 319 'AdminGetNamespaceInvitationHistoryV4' test.out

#- 320 AdminGetNamespaceUserInvitationHistoryV4
./ng net.accelbyte.sdk.cli.Main iam adminGetNamespaceUserInvitationHistoryV4 \
    --namespace "$AB_NAMESPACE" \
    --limit '62' \
    --offset '65' \
    > test.out 2>&1
eval_tap $? 320 'AdminGetNamespaceUserInvitationHistoryV4' test.out

#- 321 AdminCreateTestUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateTestUsersV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 27}' \
    > test.out 2>&1
eval_tap $? 321 'AdminCreateTestUsersV4' test.out

#- 322 AdminCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "pkCqPndJ", "policyId": "x8daMxXH", "policyVersionId": "DcdpWS8I"}, {"isAccepted": true, "localizedPolicyVersionId": "jAfn5b58", "policyId": "50LlPFfH", "policyVersionId": "I2xIIAwq"}, {"isAccepted": false, "localizedPolicyVersionId": "ASx5BTK0", "policyId": "i3Dfwl9z", "policyVersionId": "pm1eEbRE"}], "authType": "EMAILPASSWD", "code": "dpTYkkDd", "country": "Vim2QJ3j", "dateOfBirth": "BteafdBc", "displayName": "XkTQHfsF", "emailAddress": "vGNNv2WV", "password": "ojVOAc4s", "passwordMD5Sum": "LUoIwzLX", "reachMinimumAge": true, "uniqueDisplayName": "dWfmSEa7", "username": "SqWm5a1i"}' \
    > test.out 2>&1
eval_tap $? 322 'AdminCreateUserV4' test.out

#- 323 AdminBulkUpdateUserAccountTypeV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateUserAccountTypeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"testAccount": true, "userIds": ["jI4kF3nZ", "F5iNscJa", "BjjSV82B"]}' \
    > test.out 2>&1
eval_tap $? 323 'AdminBulkUpdateUserAccountTypeV4' test.out

#- 324 AdminBulkCheckValidUserIDV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkCheckValidUserIDV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["Hom532CC", "Q3OojXqK", "5og6w1th"]}' \
    > test.out 2>&1
eval_tap $? 324 'AdminBulkCheckValidUserIDV4' test.out

#- 325 AdminUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '80yvebQc' \
    --body '{"avatarUrl": "czMmxlvg", "country": "JDqmLsgk", "dateOfBirth": "2VZqcIvQ", "displayName": "6DavI0DI", "languageTag": "rQNagLl8", "skipLoginQueue": false, "uniqueDisplayName": "DVe2LImq", "userName": "4qXrNNVp"}' \
    > test.out 2>&1
eval_tap $? 325 'AdminUpdateUserV4' test.out

#- 326 AdminUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'WSf4Qvui' \
    --body '{"code": "RXcm5v4u", "emailAddress": "ghmuIYSS"}' \
    > test.out 2>&1
eval_tap $? 326 'AdminUpdateUserEmailAddressV4' test.out

#- 327 AdminDisableUserMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableUserMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '7bBkhFjs' \
    > test.out 2>&1
eval_tap $? 327 'AdminDisableUserMFAV4' test.out

#- 328 AdminListUserRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminListUserRolesV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'JQJeBeVn' \
    > test.out 2>&1
eval_tap $? 328 'AdminListUserRolesV4' test.out

#- 329 AdminUpdateUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '691DAmgU' \
    --body '{"assignedNamespaces": ["sIC5PYCX", "YIVtlhr8", "002We53U"], "roleId": "6ahpQuhO"}' \
    > test.out 2>&1
eval_tap $? 329 'AdminUpdateUserRoleV4' test.out

#- 330 AdminAddUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'W8LO4pv1' \
    --body '{"assignedNamespaces": ["HLPiG8Y9", "XWd3e0sx", "g5h0MCm9"], "roleId": "rcPKhEqf"}' \
    > test.out 2>&1
eval_tap $? 330 'AdminAddUserRoleV4' test.out

#- 331 AdminRemoveUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRemoveUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'sNDP3HTo' \
    --body '{"assignedNamespaces": ["gPgvrsxi", "alcN2uRP", "Ef8y49Qc"], "roleId": "PPyR4VRf"}' \
    > test.out 2>&1
eval_tap $? 331 'AdminRemoveUserRoleV4' test.out

#- 332 AdminGetRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV4 \
    --adminRole  \
    --isWildcard  \
    --limit '21' \
    --offset '62' \
    > test.out 2>&1
eval_tap $? 332 'AdminGetRolesV4' test.out

#- 333 AdminCreateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV4 \
    --body '{"adminRole": true, "deletable": true, "isWildcard": true, "roleName": "rgh4kZ8Q"}' \
    > test.out 2>&1
eval_tap $? 333 'AdminCreateRoleV4' test.out

#- 334 AdminGetRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV4 \
    --roleId 'AlSOyBCi' \
    > test.out 2>&1
eval_tap $? 334 'AdminGetRoleV4' test.out

#- 335 AdminDeleteRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV4 \
    --roleId 'VTpsCzBO' \
    > test.out 2>&1
eval_tap $? 335 'AdminDeleteRoleV4' test.out

#- 336 AdminUpdateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV4 \
    --roleId 'd9Q0apX4' \
    --body '{"adminRole": false, "deletable": true, "isWildcard": true, "roleName": "U9wTXZgf"}' \
    > test.out 2>&1
eval_tap $? 336 'AdminUpdateRoleV4' test.out

#- 337 AdminUpdateRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV4 \
    --roleId 'ETAFfKfT' \
    --body '{"permissions": [{"action": 58, "resource": "mO10zeYC", "schedAction": 72, "schedCron": "xy7HWZXL", "schedRange": ["fUMC9Wa4", "aHkPu8uu", "hELkYBBf"]}, {"action": 1, "resource": "Hket22oz", "schedAction": 11, "schedCron": "NYZQ8ngh", "schedRange": ["VRjfKkyO", "x6uCKvKP", "RUn0T8HS"]}, {"action": 42, "resource": "41uk3o29", "schedAction": 22, "schedCron": "tf6hZyg6", "schedRange": ["GQMO5E7n", "njwO92o3", "8gbWK46Y"]}]}' \
    > test.out 2>&1
eval_tap $? 337 'AdminUpdateRolePermissionsV4' test.out

#- 338 AdminAddRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV4 \
    --roleId 'j0P7KoSg' \
    --body '{"permissions": [{"action": 30, "resource": "VfwsrEQB", "schedAction": 58, "schedCron": "3K3qdHbF", "schedRange": ["GULUXpa6", "wNDVEjGU", "DidqyTPg"]}, {"action": 60, "resource": "MoO2SQ5V", "schedAction": 84, "schedCron": "Ah940uE2", "schedRange": ["4lJmozCJ", "9r4ctYri", "6LsNCcAA"]}, {"action": 97, "resource": "B0NKLbsx", "schedAction": 22, "schedCron": "GifsX83d", "schedRange": ["lFpOtVSK", "DLG1hU1K", "SO2nwxqp"]}]}' \
    > test.out 2>&1
eval_tap $? 338 'AdminAddRolePermissionsV4' test.out

#- 339 AdminDeleteRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV4 \
    --roleId '6ujbPVFd' \
    --body '["XRzlGMjI", "5t5zOA5t", "pPub26X8"]' \
    > test.out 2>&1
eval_tap $? 339 'AdminDeleteRolePermissionsV4' test.out

#- 340 AdminListAssignedUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminListAssignedUsersV4 \
    --roleId 'LJcqGxXF' \
    --after 'wKtFgnVQ' \
    --before '4KUQoBW1' \
    --limit '14' \
    > test.out 2>&1
eval_tap $? 340 'AdminListAssignedUsersV4' test.out

#- 341 AdminAssignUserToRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAssignUserToRoleV4 \
    --roleId 'fU4WQzxg' \
    --body '{"assignedNamespaces": ["xT5WaARz", "DrIQvecv", "rujZ9Vti"], "namespace": "GE1dOQhW", "userId": "ZgOx5TUC"}' \
    > test.out 2>&1
eval_tap $? 341 'AdminAssignUserToRoleV4' test.out

#- 342 AdminRevokeUserFromRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRevokeUserFromRoleV4 \
    --roleId 'Xxw0gmxW' \
    --body '{"namespace": "9E2SOXnf", "userId": "Dgc4ZWgb"}' \
    > test.out 2>&1
eval_tap $? 342 'AdminRevokeUserFromRoleV4' test.out

#- 343 AdminInviteUserNewV4
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserNewV4 \
    --body '{"assignedNamespaces": ["LI6KGgpZ", "sLtjBfoK", "Nwjnv6O8"], "emailAddresses": ["2x7ivP8B", "Ky8Au1G5", "B6XA0Wmu"], "isAdmin": true, "isNewStudio": true, "namespace": "qngpeUdh", "roleId": "kAXog38a"}' \
    > test.out 2>&1
eval_tap $? 343 'AdminInviteUserNewV4' test.out

#- 344 AdminUpdateMyUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateMyUserV4 \
    --body '{"avatarUrl": "9FMIq6ku", "country": "xh7OPe8F", "dateOfBirth": "URtAVESU", "displayName": "j8526E6Q", "languageTag": "UlFPH33l", "skipLoginQueue": false, "uniqueDisplayName": "AKONd1vR", "userName": "6XBv5kzX"}' \
    > test.out 2>&1
eval_tap $? 344 'AdminUpdateMyUserV4' test.out

#- 345 AdminDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyAuthenticatorV4 \
    > test.out 2>&1
eval_tap $? 345 'AdminDisableMyAuthenticatorV4' test.out

#- 346 AdminEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyAuthenticatorV4 \
    --code 'yC3lfXFM' \
    > test.out 2>&1
eval_tap $? 346 'AdminEnableMyAuthenticatorV4' test.out

#- 347 AdminGenerateMyAuthenticatorKeyV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateMyAuthenticatorKeyV4 \
    > test.out 2>&1
eval_tap $? 347 'AdminGenerateMyAuthenticatorKeyV4' test.out

#- 348 AdminGetMyBackupCodesV4
eval_tap 0 348 'AdminGetMyBackupCodesV4 # SKIP deprecated' test.out

#- 349 AdminGenerateMyBackupCodesV4
eval_tap 0 349 'AdminGenerateMyBackupCodesV4 # SKIP deprecated' test.out

#- 350 AdminDisableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 350 'AdminDisableMyBackupCodesV4' test.out

#- 351 AdminDownloadMyBackupCodesV4
eval_tap 0 351 'AdminDownloadMyBackupCodesV4 # SKIP deprecated' test.out

#- 352 AdminEnableMyBackupCodesV4
eval_tap 0 352 'AdminEnableMyBackupCodesV4 # SKIP deprecated' test.out

#- 353 AdminGetBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 353 'AdminGetBackupCodesV4' test.out

#- 354 AdminGenerateBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 354 'AdminGenerateBackupCodesV4' test.out

#- 355 AdminEnableBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 355 'AdminEnableBackupCodesV4' test.out

#- 356 AdminSendMyMFAEmailCodeV4
./ng net.accelbyte.sdk.cli.Main iam adminSendMyMFAEmailCodeV4 \
    > test.out 2>&1
eval_tap $? 356 'AdminSendMyMFAEmailCodeV4' test.out

#- 357 AdminDisableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyEmailV4 \
    > test.out 2>&1
eval_tap $? 357 'AdminDisableMyEmailV4' test.out

#- 358 AdminEnableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyEmailV4 \
    --code 'YJRfeE3e' \
    > test.out 2>&1
eval_tap $? 358 'AdminEnableMyEmailV4' test.out

#- 359 AdminGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyEnabledFactorsV4 \
    > test.out 2>&1
eval_tap $? 359 'AdminGetMyEnabledFactorsV4' test.out

#- 360 AdminMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam adminMakeFactorMyDefaultV4 \
    --factor 'UVEJkxgD' \
    > test.out 2>&1
eval_tap $? 360 'AdminMakeFactorMyDefaultV4' test.out

#- 361 AdminInviteUserV4
eval_tap 0 361 'AdminInviteUserV4 # SKIP deprecated' test.out

#- 362 AuthenticationWithPlatformLinkV4
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV4 \
    --extendExp  \
    --clientId 'sV96GwMS' \
    --linkingToken '1b8faUIk' \
    --password 'NWpQDrvT' \
    --username 'CglmfHT5' \
    > test.out 2>&1
eval_tap $? 362 'AuthenticationWithPlatformLinkV4' test.out

#- 363 GenerateTokenByNewHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV4 \
    --additionalData 'EZp1Y8Nt' \
    --extendExp  \
    --linkingToken 'TywHHHKb' \
    > test.out 2>&1
eval_tap $? 363 'GenerateTokenByNewHeadlessAccountV4' test.out

#- 364 Verify2faCodeV4
./ng net.accelbyte.sdk.cli.Main iam verify2faCodeV4 \
    --code 'HqBejoDN' \
    --factor 'zzYgcpRi' \
    --mfaToken 'esJ6bSQ4' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 364 'Verify2faCodeV4' test.out

#- 365 PlatformTokenGrantV4
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV4 \
    --platformId '0mKBY735' \
    --codeChallenge '7mNUFbnm' \
    --codeChallengeMethod 'S256' \
    --additionalData 'a12bPvSp' \
    --clientId 'Wvya1HpT' \
    --createHeadless  \
    --deviceId 'EBTdmBIm' \
    --macAddress 'vClbMEu9' \
    --platformToken 'ju1lhDPV' \
    --skipSetCookie  \
    > test.out 2>&1
eval_tap $? 365 'PlatformTokenGrantV4' test.out

#- 366 SimultaneousLoginV4
./ng net.accelbyte.sdk.cli.Main iam simultaneousLoginV4 \
    --codeChallenge 'QR9f8bfJ' \
    --codeChallengeMethod 'plain' \
    --simultaneousPlatform 'F0kdjIAA' \
    --simultaneousTicket '2wKulkTH' \
    --nativePlatform 'epicgames' \
    --nativePlatformTicket 'hpRzuWDa' \
    > test.out 2>&1
eval_tap $? 366 'SimultaneousLoginV4' test.out

#- 367 TokenGrantV4
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV4 \
    --codeChallenge 'CRWWuFwm' \
    --codeChallengeMethod 'plain' \
    --additionalData 'HREC9TRt' \
    --clientId 'FKxHLJMi' \
    --code '4x1qNTjW' \
    --codeVerifier '09R7kgNH' \
    --extendNamespace 'FYpnkzb9' \
    --extendExp  \
    --loginQueueTicket 'aVTC3CgP' \
    --password 'v2VBo3y7' \
    --redirectUri 'k3TFiF8N' \
    --refreshToken 'A48gAS2Y' \
    --username 'y7cCHQOe' \
    --grantType 'refresh_token' \
    > test.out 2>&1
eval_tap $? 367 'TokenGrantV4' test.out

#- 368 RequestTargetTokenResponseV4
./ng net.accelbyte.sdk.cli.Main iam requestTargetTokenResponseV4 \
    --additionalData 'JQsL831L' \
    --code 'ClDMaFKc' \
    > test.out 2>&1
eval_tap $? 368 'RequestTargetTokenResponseV4' test.out

#- 369 PublicCreateTestUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateTestUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "3aN0Fwhc", "policyId": "ViTkKXtW", "policyVersionId": "B8ys5B1M"}, {"isAccepted": true, "localizedPolicyVersionId": "DGDNAL2I", "policyId": "BpxJYjeu", "policyVersionId": "4NWE3US8"}, {"isAccepted": true, "localizedPolicyVersionId": "GSjjao5Y", "policyId": "dCEJ57Gn", "policyVersionId": "6B90lSMR"}], "authType": "EMAILPASSWD", "country": "m0KdDXdP", "dateOfBirth": "bJ2CadAV", "displayName": "zWslL0uf", "emailAddress": "2JcXxv87", "password": "ZuCgDQJD", "passwordMD5Sum": "2pvd8ayO", "uniqueDisplayName": "L9h1f6he", "username": "tSK2iDUl", "verified": false}' \
    > test.out 2>&1
eval_tap $? 369 'PublicCreateTestUserV4' test.out

#- 370 PublicCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "FBxa2tlx", "policyId": "KhgEwJnS", "policyVersionId": "4aDcDPfi"}, {"isAccepted": false, "localizedPolicyVersionId": "g2GVsebH", "policyId": "hhgXGaFF", "policyVersionId": "umPe7NMF"}, {"isAccepted": true, "localizedPolicyVersionId": "NRAe5IHG", "policyId": "w2wbNAel", "policyVersionId": "OQWBWJ3H"}], "authType": "EMAILPASSWD", "code": "GuyXmYJj", "country": "sIve7can", "dateOfBirth": "p3gGb5EM", "displayName": "JcQpF81N", "emailAddress": "eyF5evkh", "password": "EQmOaGu8", "passwordMD5Sum": "t3ztIeNO", "reachMinimumAge": false, "uniqueDisplayName": "lvMvJkA2", "username": "FUOsTmQ2"}' \
    > test.out 2>&1
eval_tap $? 370 'PublicCreateUserV4' test.out

#- 371 CreateUserFromInvitationV4
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV4 \
    --invitationId 'vN5SvxE1' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "fxaBgHue", "policyId": "E3d8qrcu", "policyVersionId": "AXSz2B98"}, {"isAccepted": true, "localizedPolicyVersionId": "Fu61I5jt", "policyId": "kYkznT74", "policyVersionId": "7c2phWZD"}, {"isAccepted": true, "localizedPolicyVersionId": "sB0MZNR0", "policyId": "FwzXZ5WU", "policyVersionId": "wgovnst9"}], "authType": "EMAILPASSWD", "code": "5v1DPiIj", "country": "dW32q21W", "dateOfBirth": "RO4Lh53H", "displayName": "0bXPR8Zt", "emailAddress": "Uy8LfzAO", "password": "yyzjoTLO", "passwordMD5Sum": "ZDpLJ2MA", "reachMinimumAge": true, "uniqueDisplayName": "P11nWCbG", "username": "BS2GcDXJ"}' \
    > test.out 2>&1
eval_tap $? 371 'CreateUserFromInvitationV4' test.out

#- 372 PublicUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "eLjCYXb7", "country": "ZVRO0NkE", "dateOfBirth": "KXlZ1fi7", "displayName": "RLxOMGmw", "languageTag": "Uc3PpyMm", "uniqueDisplayName": "YghRZPjm", "userName": "pRdmiOes"}' \
    > test.out 2>&1
eval_tap $? 372 'PublicUpdateUserV4' test.out

#- 373 PublicUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "TXzymwA9", "emailAddress": "rf64HRAx"}' \
    > test.out 2>&1
eval_tap $? 373 'PublicUpdateUserEmailAddressV4' test.out

#- 374 PublicUpgradeHeadlessAccountWithVerificationCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountWithVerificationCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "Ur27aL5z", "country": "mnD2qiUY", "dateOfBirth": "ltcAIGEA", "displayName": "xUq2heLB", "emailAddress": "Jh256D90", "password": "hZllJFuB", "reachMinimumAge": true, "uniqueDisplayName": "suT91fQy", "username": "iYgtL5TW", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 374 'PublicUpgradeHeadlessAccountWithVerificationCodeV4' test.out

#- 375 PublicUpgradeHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "6m7eLGO3", "password": "jPW8yIhZ", "username": "NTmNUBuf"}' \
    > test.out 2>&1
eval_tap $? 375 'PublicUpgradeHeadlessAccountV4' test.out

#- 376 PublicDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 376 'PublicDisableMyAuthenticatorV4' test.out

#- 377 PublicEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'iTwddsdN' \
    > test.out 2>&1
eval_tap $? 377 'PublicEnableMyAuthenticatorV4' test.out

#- 378 PublicGenerateMyAuthenticatorKeyV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateMyAuthenticatorKeyV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 378 'PublicGenerateMyAuthenticatorKeyV4' test.out

#- 379 PublicGetMyBackupCodesV4
eval_tap 0 379 'PublicGetMyBackupCodesV4 # SKIP deprecated' test.out

#- 380 PublicGenerateMyBackupCodesV4
eval_tap 0 380 'PublicGenerateMyBackupCodesV4 # SKIP deprecated' test.out

#- 381 PublicDisableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 381 'PublicDisableMyBackupCodesV4' test.out

#- 382 PublicDownloadMyBackupCodesV4
eval_tap 0 382 'PublicDownloadMyBackupCodesV4 # SKIP deprecated' test.out

#- 383 PublicEnableMyBackupCodesV4
eval_tap 0 383 'PublicEnableMyBackupCodesV4 # SKIP deprecated' test.out

#- 384 PublicGetBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGetBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 384 'PublicGetBackupCodesV4' test.out

#- 385 PublicGenerateBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 385 'PublicGenerateBackupCodesV4' test.out

#- 386 PublicEnableBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 386 'PublicEnableBackupCodesV4' test.out

#- 387 PublicRemoveTrustedDeviceV4
./ng net.accelbyte.sdk.cli.Main iam publicRemoveTrustedDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceToken 'FMZIiYWz' \
    > test.out 2>&1
eval_tap $? 387 'PublicRemoveTrustedDeviceV4' test.out

#- 388 PublicSendMyMFAEmailCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicSendMyMFAEmailCodeV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 388 'PublicSendMyMFAEmailCodeV4' test.out

#- 389 PublicDisableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyEmailV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 389 'PublicDisableMyEmailV4' test.out

#- 390 PublicEnableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyEmailV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'Lm6dDTBl' \
    > test.out 2>&1
eval_tap $? 390 'PublicEnableMyEmailV4' test.out

#- 391 PublicGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam publicGetMyEnabledFactorsV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 391 'PublicGetMyEnabledFactorsV4' test.out

#- 392 PublicMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam publicMakeFactorMyDefaultV4 \
    --namespace "$AB_NAMESPACE" \
    --factor 'kEfSI27y' \
    > test.out 2>&1
eval_tap $? 392 'PublicMakeFactorMyDefaultV4' test.out

#- 393 PublicGetUserPublicInfoByUserIdV4
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPublicInfoByUserIdV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZrVWd0Fz' \
    > test.out 2>&1
eval_tap $? 393 'PublicGetUserPublicInfoByUserIdV4' test.out

#- 394 PublicInviteUserV4
./ng net.accelbyte.sdk.cli.Main iam publicInviteUserV4 \
    --body '{"additionalData": "yxkWYKSe", "emailAddress": "cElYQQPG", "namespace": "sznfeJEQ", "namespaceDisplayName": "ajs6bHgW"}' \
    > test.out 2>&1
eval_tap $? 394 'PublicInviteUserV4' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
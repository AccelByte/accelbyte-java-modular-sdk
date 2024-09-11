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
echo "1..411"

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
    --body '{"modules": [{"docLink": "A4jfGZ9l", "groups": [{"group": "Xx4HYs10", "groupId": "3zwSuRqs", "permissions": [{"allowedActions": [92, 76, 92], "resource": "NJEYEXES"}, {"allowedActions": [51, 99, 35], "resource": "k3E32EgT"}, {"allowedActions": [12, 8, 70], "resource": "OBLEbwWP"}]}, {"group": "6upDb5oD", "groupId": "yCp4TKq7", "permissions": [{"allowedActions": [53, 78, 86], "resource": "Hk3vZ32d"}, {"allowedActions": [7, 1, 45], "resource": "PhlLjWqb"}, {"allowedActions": [69, 81, 29], "resource": "StAXFbju"}]}, {"group": "1V3bbz7Z", "groupId": "ANHd8exl", "permissions": [{"allowedActions": [52, 4, 65], "resource": "qCGkj3gi"}, {"allowedActions": [93, 69, 36], "resource": "Wc2Z8SR3"}, {"allowedActions": [79, 51, 11], "resource": "CaKZBLwZ"}]}], "module": "OBPJAia0", "moduleId": "uUzcEnrT"}, {"docLink": "gYBBo6i7", "groups": [{"group": "ifODp6gh", "groupId": "Fd0ymftI", "permissions": [{"allowedActions": [10, 94, 54], "resource": "3e5CKjMO"}, {"allowedActions": [28, 85, 17], "resource": "jYUczdjD"}, {"allowedActions": [28, 67, 63], "resource": "q02GQPKe"}]}, {"group": "bnQbQruO", "groupId": "5hNLI8oM", "permissions": [{"allowedActions": [10, 7, 48], "resource": "M5sWeWc8"}, {"allowedActions": [50, 92, 61], "resource": "MUjqChqM"}, {"allowedActions": [61, 93, 9], "resource": "3iJvlaIZ"}]}, {"group": "O491NGF7", "groupId": "ctVRtYQO", "permissions": [{"allowedActions": [72, 67, 56], "resource": "OoJUmnQF"}, {"allowedActions": [56, 81, 74], "resource": "TXgtWypE"}, {"allowedActions": [84, 68, 63], "resource": "pFMNyErh"}]}], "module": "xJEpt015", "moduleId": "pCj1eZPz"}, {"docLink": "U57I22Mk", "groups": [{"group": "soMei8rw", "groupId": "0p6VmMjN", "permissions": [{"allowedActions": [99, 100, 11], "resource": "xLugvsnv"}, {"allowedActions": [45, 38, 40], "resource": "9XKvBJML"}, {"allowedActions": [74, 80, 54], "resource": "vDC9YScw"}]}, {"group": "m13xVbX1", "groupId": "RB7mdJNn", "permissions": [{"allowedActions": [71, 87, 98], "resource": "TjhIaYHR"}, {"allowedActions": [43, 27, 8], "resource": "3JfbmiXQ"}, {"allowedActions": [56, 80, 7], "resource": "hPYqmrQq"}]}, {"group": "BpOcLtrO", "groupId": "CS1QdIbe", "permissions": [{"allowedActions": [66, 56, 35], "resource": "2VDmG8UG"}, {"allowedActions": [20, 3, 70], "resource": "EQ9170Ok"}, {"allowedActions": [20, 35, 29], "resource": "qEMitdV8"}]}], "module": "oFXWJLRT", "moduleId": "IWX16UWg"}]}' \
    > test.out 2>&1
eval_tap $? 109 'AdminUpdateAvailablePermissionsByModule' test.out

#- 110 AdminDeleteConfigPermissionsByGroup
./ng net.accelbyte.sdk.cli.Main iam adminDeleteConfigPermissionsByGroup \
    --forceDelete  \
    --body '{"groupId": "ZCHReyM6", "moduleId": "hDAeOaPJ"}' \
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
    --body '[{"field": "tREKHA7w", "validation": {"allowAllSpecialCharacters": false, "allowDigit": true, "allowLetter": false, "allowSpace": true, "allowUnicode": false, "avatarConfig": {"allowedPrefixes": ["9CbEuNxq", "aAC0GSYf", "cZNcjNgl"], "preferRegex": false, "regex": "YceESTZb"}, "blockedWord": ["LsWDqkXR", "8hqy8N7H", "KHIZWefN"], "description": [{"language": "TQvwj56X", "message": ["xDMEYDIl", "CLVp0fhB", "Pq7kSIvc"]}, {"language": "LNoJIJMI", "message": ["KUd6pCL9", "twANRepN", "Z8RCh1oM"]}, {"language": "6CKrL6Ka", "message": ["MXvExPM3", "nIRmm4dH", "7Y7brmpS"]}], "isCustomRegex": false, "letterCase": "dOQj2Djd", "maxLength": 31, "maxRepeatingAlphaNum": 8, "maxRepeatingSpecialCharacter": 57, "minCharType": 96, "minLength": 9, "profanityFilter": "MkEN8grn", "regex": "ehm8eEkI", "specialCharacterLocation": "9OYWkTuU", "specialCharacters": ["X9thV79z", "ZcxlGhXD", "jGCv3WYl"]}}, {"field": "pecCOWzk", "validation": {"allowAllSpecialCharacters": true, "allowDigit": true, "allowLetter": false, "allowSpace": false, "allowUnicode": false, "avatarConfig": {"allowedPrefixes": ["8Rj8Hm8E", "xVtZSVpz", "0tpHrRlQ"], "preferRegex": false, "regex": "Dbpqx049"}, "blockedWord": ["Ub3e3SvE", "mAfxfoo9", "WAzCIwoh"], "description": [{"language": "EzYhiCi1", "message": ["1Mf04Cl0", "RJiAyNfw", "YTN520W8"]}, {"language": "8Lte8b33", "message": ["0sNZlbv8", "w75xqJPl", "NXPHjNbJ"]}, {"language": "jeFCqaS2", "message": ["TfdG83o6", "KFkfYmio", "So0AgZxL"]}], "isCustomRegex": true, "letterCase": "XD3dOlNF", "maxLength": 12, "maxRepeatingAlphaNum": 80, "maxRepeatingSpecialCharacter": 82, "minCharType": 4, "minLength": 46, "profanityFilter": "x3mA4R7G", "regex": "WpfsLA9C", "specialCharacterLocation": "1R7GlNpl", "specialCharacters": ["9n3rqQXX", "FjrIdfMY", "jVemLmzA"]}}, {"field": "pwT7KEJz", "validation": {"allowAllSpecialCharacters": true, "allowDigit": false, "allowLetter": true, "allowSpace": false, "allowUnicode": true, "avatarConfig": {"allowedPrefixes": ["qkMKSVK8", "4EImHufF", "a267AKNt"], "preferRegex": true, "regex": "YVC5IyQK"}, "blockedWord": ["1OM24tJW", "RIRtMcUs", "fBw2zg1G"], "description": [{"language": "GXCsQ2An", "message": ["0bzIeDTt", "qZICL5Wy", "9I2gEnJZ"]}, {"language": "hxgWYVcO", "message": ["bSjsdSq0", "uV91drzC", "7kapJq7j"]}, {"language": "Vz1U0nzv", "message": ["J0oVXbZ6", "Q19JdNhP", "PO2BKfRA"]}], "isCustomRegex": true, "letterCase": "QiTTTh7Z", "maxLength": 26, "maxRepeatingAlphaNum": 68, "maxRepeatingSpecialCharacter": 83, "minCharType": 53, "minLength": 18, "profanityFilter": "wgc26gdG", "regex": "i1GLzAzk", "specialCharacterLocation": "cQdhE6yM", "specialCharacters": ["FeuPT1fC", "x0zIkYYu", "mkoS6HEn"]}}]' \
    > test.out 2>&1
eval_tap $? 113 'AdminUpdateInputValidations' test.out

#- 114 AdminResetInputValidations
./ng net.accelbyte.sdk.cli.Main iam adminResetInputValidations \
    --field 'id5ztxxT' \
    > test.out 2>&1
eval_tap $? 114 'AdminResetInputValidations' test.out

#- 115 ListAdminsV3
./ng net.accelbyte.sdk.cli.Main iam listAdminsV3 \
    --namespace "$AB_NAMESPACE" \
    --after 'qmrtcCRR' \
    --before 'cEvMcz4i' \
    --endDate 'hMcpQJJm' \
    --limit '47' \
    --query 'oVaJrpir' \
    --roleId 'uLAoGdFY' \
    --startDate 'jD6a2fYV' \
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
    --body '{"ageRestriction": 41, "enable": false}' \
    > test.out 2>&1
eval_tap $? 117 'AdminUpdateAgeRestrictionConfigV3' test.out

#- 118 AdminGetListCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminGetListCountryAgeRestrictionV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 118 'AdminGetListCountryAgeRestrictionV3' test.out

#- 119 AdminUpdateCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateCountryAgeRestrictionV3 \
    --countryCode 'p502KtpT' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ageRestriction": 39}' \
    > test.out 2>&1
eval_tap $? 119 'AdminUpdateCountryAgeRestrictionV3' test.out

#- 120 AdminGetBannedUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType 'jpahhQVn' \
    --limit '76' \
    --offset '30' \
    > test.out 2>&1
eval_tap $? 120 'AdminGetBannedUsersV3' test.out

#- 121 AdminBanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"ban": "VR0kwdst", "comment": "4ZDxaB57", "endDate": "eWrichTH", "reason": "LyTR1fiE", "skipNotif": true, "userIds": ["lCQ8htNl", "zctDrJS8", "GQs8j4G0"]}' \
    > test.out 2>&1
eval_tap $? 121 'AdminBanUserBulkV3' test.out

#- 122 AdminUnbanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminUnbanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"bans": [{"banId": "5GJpLIN6", "userId": "9sZ6JZ1R"}, {"banId": "82FuHS0U", "userId": "5urBuDZh"}, {"banId": "Pav0HmKU", "userId": "QP7BmAHh"}]}' \
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
    --clientId '9mj86zTj' \
    --clientName 'eif4F5uD' \
    --clientType 'uAyzszla' \
    --limit '59' \
    --offset '56' \
    --skipLoginQueue  \
    > test.out 2>&1
eval_tap $? 124 'AdminGetClientsByNamespaceV3' test.out

#- 125 AdminBulkUpdateClientsV3
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateClientsV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientIds": ["h2MuzzPq", "RWiNlfUS", "0WKByMZ8"], "clientUpdateRequest": {"audiences": ["NXNQIY00", "UL1WyHiX", "QDw3gJN6"], "baseUri": "oMv5n3hS", "clientName": "XOXyEMzG", "clientPermissions": [{"action": 8, "resource": "4gArU7d8", "schedAction": 62, "schedCron": "2po2dUdU", "schedRange": ["xrG1ycY1", "bkQtUDpE", "XpbghI2A"]}, {"action": 90, "resource": "YQ2d20Mj", "schedAction": 93, "schedCron": "lTCrKdkB", "schedRange": ["fS5GZcC3", "qzRpftp3", "oMTvJJBG"]}, {"action": 58, "resource": "p3Bm6TT8", "schedAction": 85, "schedCron": "L7a7TmUC", "schedRange": ["rqfeW3LN", "JVZcFoit", "qsFPpH4g"]}], "clientPlatform": "wP3Fphih", "deletable": true, "description": "fRrPf65N", "modulePermissions": [{"moduleId": "VsbBquTY", "selectedGroups": [{"groupId": "yGWBM4rL", "selectedActions": [65, 91, 78]}, {"groupId": "GsxFW8tn", "selectedActions": [83, 84, 64]}, {"groupId": "Bdr8q0R8", "selectedActions": [93, 62, 53]}]}, {"moduleId": "ZHy7Dgfx", "selectedGroups": [{"groupId": "P6lJxvUy", "selectedActions": [30, 35, 65]}, {"groupId": "DyjPPJKV", "selectedActions": [19, 5, 14]}, {"groupId": "XTBvoV09", "selectedActions": [69, 6, 12]}]}, {"moduleId": "YdBmnuQU", "selectedGroups": [{"groupId": "y5NgBDcp", "selectedActions": [87, 74, 81]}, {"groupId": "OvfkMaOa", "selectedActions": [83, 67, 59]}, {"groupId": "PT31jVck", "selectedActions": [76, 62, 72]}]}], "namespace": "pnCiZ5XU", "oauthAccessTokenExpiration": 21, "oauthAccessTokenExpirationTimeUnit": "CBMAYDpA", "oauthRefreshTokenExpiration": 39, "oauthRefreshTokenExpirationTimeUnit": "nN3Rsnja", "redirectUri": "QBdUHPmH", "scopes": ["YVV1LuS3", "XPCqlC15", "WSMxVjem"], "skipLoginQueue": true, "twoFactorEnabled": true}}' \
    > test.out 2>&1
eval_tap $? 125 'AdminBulkUpdateClientsV3' test.out

#- 126 AdminCreateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateClientV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["gpas70HF", "ghcLSl8m", "CMaceA4o"], "baseUri": "22c8Tl8q", "clientId": "ZjtiDg02", "clientName": "iJ94dsKc", "clientPermissions": [{"action": 61, "resource": "69YarZEk", "schedAction": 61, "schedCron": "iYcs1sax", "schedRange": ["PRc2TDSD", "Jfgg96GC", "Bz0UKx1v"]}, {"action": 22, "resource": "fEbMcnc5", "schedAction": 93, "schedCron": "M20Apuzn", "schedRange": ["55rkpT8z", "bnvGwbTU", "TOJH8Xv6"]}, {"action": 62, "resource": "UJ7U14XN", "schedAction": 92, "schedCron": "wocM3hyy", "schedRange": ["01epNAmg", "BhozzCgZ", "uk73OSjn"]}], "clientPlatform": "vSJneQQP", "deletable": true, "description": "67rlWKdx", "modulePermissions": [{"moduleId": "cvyLd9cG", "selectedGroups": [{"groupId": "WhVPhuvX", "selectedActions": [75, 82, 2]}, {"groupId": "l6tTCDKh", "selectedActions": [76, 16, 13]}, {"groupId": "mLm2TuEO", "selectedActions": [44, 42, 40]}]}, {"moduleId": "J4BWb69a", "selectedGroups": [{"groupId": "JfJk4PWm", "selectedActions": [81, 45, 34]}, {"groupId": "6BQankvC", "selectedActions": [71, 97, 39]}, {"groupId": "XtGoh0Rj", "selectedActions": [61, 33, 58]}]}, {"moduleId": "jk8CbtCp", "selectedGroups": [{"groupId": "kOVJ7JY7", "selectedActions": [81, 35, 38]}, {"groupId": "yYmYyaNX", "selectedActions": [22, 67, 33]}, {"groupId": "vEKi6ISs", "selectedActions": [1, 17, 68]}]}], "namespace": "wb6PseXZ", "oauthAccessTokenExpiration": 89, "oauthAccessTokenExpirationTimeUnit": "i6BXObgj", "oauthClientType": "WtybCYPQ", "oauthRefreshTokenExpiration": 70, "oauthRefreshTokenExpirationTimeUnit": "vPnTPhLh", "parentNamespace": "XHxP5QJu", "redirectUri": "9SOn3R6g", "scopes": ["yWxUenPD", "vkM9pNLj", "FdD9GDB1"], "secret": "Q1y7xND3", "skipLoginQueue": true, "twoFactorEnabled": true}' \
    > test.out 2>&1
eval_tap $? 126 'AdminCreateClientV3' test.out

#- 127 AdminGetClientsbyNamespacebyIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetClientsbyNamespacebyIDV3 \
    --clientId 'ZbINEWnL' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 127 'AdminGetClientsbyNamespacebyIDV3' test.out

#- 128 AdminDeleteClientV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientV3 \
    --clientId 'XkmriyaS' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 128 'AdminDeleteClientV3' test.out

#- 129 AdminUpdateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientV3 \
    --clientId 'LijZ3ONB' \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["E2XNe6yV", "QVPYdHjr", "ZeciTrq7"], "baseUri": "sVKxTgTH", "clientName": "W1RhAPzd", "clientPermissions": [{"action": 21, "resource": "qHSISw4O", "schedAction": 80, "schedCron": "1OYMF6Yr", "schedRange": ["YUIeydL2", "Wlf13PGh", "N0iJgcfl"]}, {"action": 44, "resource": "0LJ5ZKiK", "schedAction": 68, "schedCron": "bcjdPnwR", "schedRange": ["hKJ7SXKg", "i7MrdmS7", "sYqVCkmj"]}, {"action": 50, "resource": "ihrbETfh", "schedAction": 97, "schedCron": "clzPXazw", "schedRange": ["twjprnv9", "mImEaASV", "ZjZTZGeD"]}], "clientPlatform": "kNTIEjgF", "deletable": false, "description": "2Sc1GrVx", "modulePermissions": [{"moduleId": "62lY9Q34", "selectedGroups": [{"groupId": "mmU91enw", "selectedActions": [0, 89, 61]}, {"groupId": "u73lqhG3", "selectedActions": [3, 40, 33]}, {"groupId": "hy4jCvmF", "selectedActions": [95, 91, 0]}]}, {"moduleId": "O9TwFR6c", "selectedGroups": [{"groupId": "n368sUyx", "selectedActions": [26, 32, 68]}, {"groupId": "VDs6uBfE", "selectedActions": [45, 14, 18]}, {"groupId": "hTJgW13X", "selectedActions": [10, 70, 85]}]}, {"moduleId": "krShzfk3", "selectedGroups": [{"groupId": "SxxAuimB", "selectedActions": [1, 50, 76]}, {"groupId": "taH5yyvG", "selectedActions": [6, 53, 80]}, {"groupId": "GGemyCno", "selectedActions": [37, 99, 77]}]}], "namespace": "zDouFZ6n", "oauthAccessTokenExpiration": 87, "oauthAccessTokenExpirationTimeUnit": "IUNy7Gkd", "oauthRefreshTokenExpiration": 43, "oauthRefreshTokenExpirationTimeUnit": "vU3HuZdx", "redirectUri": "QyXHj3GE", "scopes": ["Tfgczdmy", "bBL9MDNs", "K8inLZCB"], "skipLoginQueue": false, "twoFactorEnabled": true}' \
    > test.out 2>&1
eval_tap $? 129 'AdminUpdateClientV3' test.out

#- 130 AdminUpdateClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientPermissionV3 \
    --clientId 'eHZLO2p9' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 81, "resource": "FsXlBw91"}, {"action": 88, "resource": "Vi9eBFX7"}, {"action": 57, "resource": "QE9zgrwU"}]}' \
    > test.out 2>&1
eval_tap $? 130 'AdminUpdateClientPermissionV3' test.out

#- 131 AdminAddClientPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddClientPermissionsV3 \
    --clientId 'xgavSxte' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 0, "resource": "h5XbpX4d"}, {"action": 82, "resource": "Iejgay6O"}, {"action": 43, "resource": "8z3F2Een"}]}' \
    > test.out 2>&1
eval_tap $? 131 'AdminAddClientPermissionsV3' test.out

#- 132 AdminDeleteClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientPermissionV3 \
    --action '42' \
    --clientId 'Ytqcznst' \
    --namespace "$AB_NAMESPACE" \
    --resource 'Ng8lsuAO' \
    > test.out 2>&1
eval_tap $? 132 'AdminDeleteClientPermissionV3' test.out

#- 133 AdminGetConfigValueV3
./ng net.accelbyte.sdk.cli.Main iam adminGetConfigValueV3 \
    --configKey '8VVBSXmC' \
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
    --body '{"blacklist": ["35ZxGsU4", "ujUzgyi8", "elV6KOQb"]}' \
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
    --limit '41' \
    --offset '24' \
    > test.out 2>&1
eval_tap $? 139 'RetrieveAllSSOLoginPlatformCredentialV3' test.out

#- 140 RetrieveThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'E3eBuDi8' \
    > test.out 2>&1
eval_tap $? 140 'RetrieveThirdPartyLoginPlatformCredentialV3' test.out

#- 141 AddThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam addThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'GMoXtmkP' \
    --body '{"ACSURL": "6VL0D29F", "AWSCognitoRegion": "uJr99vue", "AWSCognitoUserPool": "UHVITL8w", "AllowedClients": ["g28cKmQg", "OQnZOe9f", "1unXkrag"], "AppId": "fE40ifMO", "AuthorizationEndpoint": "EX51HViH", "ClientId": "ZjsUXZOB", "EmptyStrFieldList": ["pzE08Vjb", "eVrZiYMU", "3Y4hHQEr"], "EnableServerLicenseValidation": false, "Environment": "zwJ5KxtI", "FederationMetadataURL": "z3aosrzM", "GenericOauthFlow": false, "IncludePUID": true, "IsActive": true, "Issuer": "PbDx0jAB", "JWKSEndpoint": "QRI7Fu5x", "KeyID": "uiaVxyEv", "LogoURL": "9labSiPc", "NetflixCertificates": {"encryptedPrivateKey": "TfkBNomx", "encryptedPrivateKeyName": "2BX6iUea", "publicCertificate": "OGFZSb2L", "publicCertificateName": "HUkY7Xp0", "rootCertificate": "lfCj66Hi", "rootCertificateName": "YP0sso4N"}, "OrganizationId": "MdMg6qDG", "PlatformName": "Bc98MjDW", "RedirectUri": "hORnU4lR", "RegisteredDomains": [{"affectedClientIDs": ["ysRrf22w", "wvBRsMPs", "sN593eaS"], "domain": "ddvO2Sos", "namespaces": ["aY0grLXm", "OuFWjAuf", "A1zyqafQ"], "roleId": "19XniKf6"}, {"affectedClientIDs": ["TUbHMExg", "DpXsQrKx", "ZhakvUrE"], "domain": "VL3vIkp1", "namespaces": ["fuL53bXu", "kezYqlVf", "3pA4zPVK"], "roleId": "dOGLV7Tr"}, {"affectedClientIDs": ["B5M1nHs8", "vor0tINK", "TLdhPlUW"], "domain": "ttjabXaR", "namespaces": ["5yAVNMYp", "sUZLkNvm", "0jeA64oU"], "roleId": "Q3denoMh"}], "Secret": "pOYiv8ZD", "TeamID": "8MnNtfwB", "TokenAuthenticationType": "85yujrU3", "TokenClaimsMapping": {"zJvN8U1t": "jCtyghYw", "EKmMDdXB": "nKwbuI8f", "8H0lONDf": "gTyYdiOz"}, "TokenEndpoint": "cMYJ8d42", "UserInfoEndpoint": "6i5zock6", "UserInfoHTTPMethod": "9vxlOUJw", "scopes": ["CZxrWOvK", "flEbEhv4", "JnjtuclV"]}' \
    > test.out 2>&1
eval_tap $? 141 'AddThirdPartyLoginPlatformCredentialV3' test.out

#- 142 DeleteThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'i7z23dYQ' \
    > test.out 2>&1
eval_tap $? 142 'DeleteThirdPartyLoginPlatformCredentialV3' test.out

#- 143 UpdateThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'I7FXszJ5' \
    --body '{"ACSURL": "czdMPyB6", "AWSCognitoRegion": "aLANBM66", "AWSCognitoUserPool": "Fay2Ebue", "AllowedClients": ["eOrLNEiN", "1yRYlPe2", "KMCRX2WK"], "AppId": "6rPEhxZ7", "AuthorizationEndpoint": "JpdBCu3k", "ClientId": "Gs5orRtE", "EmptyStrFieldList": ["8GqiBUAw", "gdGavEsC", "O71153y1"], "EnableServerLicenseValidation": false, "Environment": "9gsNDSg7", "FederationMetadataURL": "zUW1k1y4", "GenericOauthFlow": false, "IncludePUID": false, "IsActive": true, "Issuer": "R9JrwUyg", "JWKSEndpoint": "XAQB9sPL", "KeyID": "ZHXzZZBc", "LogoURL": "gf6sM0y8", "NetflixCertificates": {"encryptedPrivateKey": "fYmLOIhX", "encryptedPrivateKeyName": "v333TFxQ", "publicCertificate": "zYvf5ky9", "publicCertificateName": "RhWu3vjQ", "rootCertificate": "SxuiYuFS", "rootCertificateName": "0kBxXyf6"}, "OrganizationId": "qL6bz6K6", "PlatformName": "oFQoMqMl", "RedirectUri": "gUBAtJ6A", "RegisteredDomains": [{"affectedClientIDs": ["5GYfgLsB", "efwmU9cf", "rL250Zzd"], "domain": "xkKu2f1H", "namespaces": ["aMo70njS", "RZO5djfR", "rnp9njQU"], "roleId": "NRuTiDci"}, {"affectedClientIDs": ["F4GlnQQt", "rtHd5BJJ", "ih7ccq2M"], "domain": "HHtC5G5j", "namespaces": ["gyO8TUO5", "c7LrYLLC", "C1zsvxET"], "roleId": "hDOrb7Kh"}, {"affectedClientIDs": ["PyAoqpYV", "00tVmUbp", "j90TTvf5"], "domain": "SU0KYTN3", "namespaces": ["3V4LesXb", "qW34wN06", "hK2yXjyJ"], "roleId": "1zoMBuC4"}], "Secret": "bkjwhXZc", "TeamID": "vezIvcuR", "TokenAuthenticationType": "CjKdC38o", "TokenClaimsMapping": {"6ycqvMiD": "IoBz6zoZ", "fBeq3cB9": "OHDUq4n5", "iRlz2Y6W": "NwCOdKGm"}, "TokenEndpoint": "uJqu7RAb", "UserInfoEndpoint": "boMnNZBV", "UserInfoHTTPMethod": "ochIY0Rc", "scopes": ["FEKjvZGc", "BftM5lHd", "VXtswHQ0"]}' \
    > test.out 2>&1
eval_tap $? 143 'UpdateThirdPartyLoginPlatformCredentialV3' test.out

#- 144 UpdateThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'V1uOv98H' \
    --body '{"affectedClientIDs": ["vvknBPkU", "LwvmkWQt", "Mi0k4dyP"], "assignedNamespaces": ["HgNDDWuW", "9S8OHGKf", "1NNVSpCk"], "domain": "5gf1uXsq", "roleId": "iFsZUTly"}' \
    > test.out 2>&1
eval_tap $? 144 'UpdateThirdPartyLoginPlatformDomainV3' test.out

#- 145 DeleteThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'SixCeedt' \
    --body '{"domain": "sp48egXZ"}' \
    > test.out 2>&1
eval_tap $? 145 'DeleteThirdPartyLoginPlatformDomainV3' test.out

#- 146 RetrieveSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam retrieveSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'ByMe3hFa' \
    > test.out 2>&1
eval_tap $? 146 'RetrieveSSOLoginPlatformCredential' test.out

#- 147 AddSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam addSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'lyroUAfa' \
    --body '{"acsUrl": "Y863db1Z", "apiKey": "DLbxAORI", "appId": "Cbp65vk0", "federationMetadataUrl": "yZLmwWyC", "isActive": false, "redirectUri": "unQqNq8d", "secret": "t3IYizGB", "ssoUrl": "qodmGsTE"}' \
    > test.out 2>&1
eval_tap $? 147 'AddSSOLoginPlatformCredential' test.out

#- 148 DeleteSSOLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteSSOLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'G1shJXWt' \
    > test.out 2>&1
eval_tap $? 148 'DeleteSSOLoginPlatformCredentialV3' test.out

#- 149 UpdateSSOPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam updateSSOPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'IRbYVAqE' \
    --body '{"acsUrl": "BQnAly6E", "apiKey": "32tPNft3", "appId": "PoFGiVmp", "federationMetadataUrl": "6hBQtpzI", "isActive": true, "redirectUri": "OcICGlbQ", "secret": "QRKIAA29", "ssoUrl": "t5DSC9Bn"}' \
    > test.out 2>&1
eval_tap $? 149 'UpdateSSOPlatformCredential' test.out

#- 150 AdminListUserIDByPlatformUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByPlatformUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'UIouXdTD' \
    --rawPID  \
    --rawPUID  \
    --body '{"platformUserIds": ["Sk4hR2aC", "DoC2yLkK", "vFNLbD1q"]}' \
    > test.out 2>&1
eval_tap $? 150 'AdminListUserIDByPlatformUserIDsV3' test.out

#- 151 AdminGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '6YkCbkqb' \
    --platformUserId 'uWNJ4knn' \
    > test.out 2>&1
eval_tap $? 151 'AdminGetUserByPlatformUserIDV3' test.out

#- 152 AdminGetRoleOverrideConfigV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleOverrideConfigV3 \
    --namespace "$AB_NAMESPACE" \
    --identity 'GAME_ADMIN' \
    > test.out 2>&1
eval_tap $? 152 'AdminGetRoleOverrideConfigV3' test.out

#- 153 AdminUpdateRoleOverrideConfigV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleOverrideConfigV3 \
    --namespace "$AB_NAMESPACE" \
    --identity 'USER' \
    --body '{"additions": [{"actions": [86, 14, 38], "resource": "dYIw6bHb"}, {"actions": [46, 97, 24], "resource": "xbJ2qTjd"}, {"actions": [82, 44, 36], "resource": "hfB07PLa"}], "exclusions": [{"actions": [85, 12, 6], "resource": "1eTIhwMg"}, {"actions": [72, 54, 6], "resource": "S50eCj8K"}, {"actions": [62, 25, 49], "resource": "eDxp2rAu"}], "overrides": [{"actions": [26, 38, 69], "resource": "BoWwwDW1"}, {"actions": [77, 83, 13], "resource": "tm4OTkVo"}, {"actions": [0, 94, 99], "resource": "k9PRKz9c"}], "replacements": [{"replacement": {"actions": [7, 53, 48], "resource": "yhDToW8m"}, "target": "WBPYgh8m"}, {"replacement": {"actions": [66, 69, 21], "resource": "MdN1b8K7"}, "target": "nj7IhAmU"}, {"replacement": {"actions": [85, 1, 21], "resource": "N5jdOG2k"}, "target": "LpGvslU7"}]}' \
    > test.out 2>&1
eval_tap $? 153 'AdminUpdateRoleOverrideConfigV3' test.out

#- 154 AdminGetRoleSourceV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleSourceV3 \
    --namespace "$AB_NAMESPACE" \
    --identity 'GAME_ADMIN' \
    > test.out 2>&1
eval_tap $? 154 'AdminGetRoleSourceV3' test.out

#- 155 AdminChangeRoleOverrideConfigStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminChangeRoleOverrideConfigStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --identity 'USER' \
    --body '{"active": true}' \
    > test.out 2>&1
eval_tap $? 155 'AdminChangeRoleOverrideConfigStatusV3' test.out

#- 156 AdminGetRoleNamespacePermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleNamespacePermissionV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'QnBiWrci' \
    > test.out 2>&1
eval_tap $? 156 'AdminGetRoleNamespacePermissionV3' test.out

#- 157 GetAdminUsersByRoleIdV3
./ng net.accelbyte.sdk.cli.Main iam getAdminUsersByRoleIdV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'CPlkXHrj' \
    --after '86' \
    --before '60' \
    --limit '57' \
    > test.out 2>&1
eval_tap $? 157 'GetAdminUsersByRoleIdV3' test.out

#- 158 AdminGetUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --emailAddress 'nX7MrhWp' \
    > test.out 2>&1
eval_tap $? 158 'AdminGetUserByEmailAddressV3' test.out

#- 159 AdminBulkUpdateUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"updateRequest": {"skipLoginQueue": true}, "userIds": ["hBOYLiAL", "a05wWQwz", "P3S5PkSv"]}' \
    > test.out 2>&1
eval_tap $? 159 'AdminBulkUpdateUsersV3' test.out

#- 160 AdminGetBulkUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType 'YFXvxJXU' \
    --body '{"bulkUserId": ["ySamdg2u", "mAxAmhNd", "wxu7s0HM"]}' \
    > test.out 2>&1
eval_tap $? 160 'AdminGetBulkUserBanV3' test.out

#- 161 AdminListUserIDByUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["hIL9i17s", "lokqBQ4y", "REqgpLOe"]}' \
    > test.out 2>&1
eval_tap $? 161 'AdminListUserIDByUserIDsV3' test.out

#- 162 AdminBulkGetUsersPlatform
./ng net.accelbyte.sdk.cli.Main iam adminBulkGetUsersPlatform \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["36G3swcK", "2FSncoUU", "sgPQpzQS"]}' \
    > test.out 2>&1
eval_tap $? 162 'AdminBulkGetUsersPlatform' test.out

#- 163 AdminInviteUserV3
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddresses": ["7vWLdWMG", "S7D7qsTy", "TnrhJffO"], "isAdmin": false, "languageTag": "qdYstIup", "namespace": "ynJXgent", "roles": ["G05E8HHS", "908zEk3V", "fQ0kZJpU"]}' \
    > test.out 2>&1
eval_tap $? 163 'AdminInviteUserV3' test.out

#- 164 AdminQueryThirdPlatformLinkHistoryV3
./ng net.accelbyte.sdk.cli.Main iam adminQueryThirdPlatformLinkHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '82' \
    --offset '72' \
    --platformUserId 'NaMSzI5h' \
    --platformId 'UvH4C7A4' \
    > test.out 2>&1
eval_tap $? 164 'AdminQueryThirdPlatformLinkHistoryV3' test.out

#- 165 AdminListUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminListUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '55' \
    --offset '55' \
    > test.out 2>&1
eval_tap $? 165 'AdminListUsersV3' test.out

#- 166 AdminSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam adminSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by '4KYMChdK' \
    --endDate '4Sv4JRIL' \
    --includeTotal  \
    --limit '83' \
    --offset '99' \
    --platformBy 'sDz4oCzr' \
    --platformId '3dJkDT8U' \
    --query 'E38fNu0x' \
    --roleIds '1coLYbXO' \
    --skipLoginQueue  \
    --startDate 'NYh8jjYz' \
    --testAccount  \
    > test.out 2>&1
eval_tap $? 166 'AdminSearchUserV3' test.out

#- 167 AdminGetBulkUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"listEmailAddressRequest": ["MfSbhPjm", "GwQCAGjE", "NcPTmbag"]}' \
    > test.out 2>&1
eval_tap $? 167 'AdminGetBulkUserByEmailAddressV3' test.out

#- 168 AdminGetUserByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'bxfdcoF8' \
    > test.out 2>&1
eval_tap $? 168 'AdminGetUserByUserIdV3' test.out

#- 169 AdminUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'SEjVh5XC' \
    --body '{"avatarUrl": "mrXye5nj", "country": "2QLMajub", "dateOfBirth": "9kR9R9hH", "displayName": "NbTspIZ6", "languageTag": "NdJKeQOE", "skipLoginQueue": false, "uniqueDisplayName": "RmOzkfw8", "userName": "ON9HrOSQ"}' \
    > test.out 2>&1
eval_tap $? 169 'AdminUpdateUserV3' test.out

#- 170 AdminGetUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '5mQ5pxdw' \
    --activeOnly  \
    --after '3YDCOIxb' \
    --before '7utjSfJR' \
    --limit '45' \
    > test.out 2>&1
eval_tap $? 170 'AdminGetUserBanV3' test.out

#- 171 AdminBanUserV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'lrDajZUm' \
    --body '{"ban": "u6TEZGIB", "comment": "VA5QFYOK", "endDate": "Y4O94o1s", "reason": "LbefNgoB", "skipNotif": true}' \
    > test.out 2>&1
eval_tap $? 171 'AdminBanUserV3' test.out

#- 172 AdminGetUserBanSummaryV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanSummaryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'REMmMI5h' \
    > test.out 2>&1
eval_tap $? 172 'AdminGetUserBanSummaryV3' test.out

#- 173 AdminUpdateUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserBanV3 \
    --banId 'ZsvNyeH3' \
    --namespace "$AB_NAMESPACE" \
    --userId 'b4D7UiMt' \
    --body '{"enabled": true, "skipNotif": true}' \
    > test.out 2>&1
eval_tap $? 173 'AdminUpdateUserBanV3' test.out

#- 174 AdminSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 's5jFVebl' \
    --body '{"context": "SnVoxJPM", "emailAddress": "D5v5qa0C", "languageTag": "nRIU6vS7"}' \
    > test.out 2>&1
eval_tap $? 174 'AdminSendVerificationCodeV3' test.out

#- 175 AdminVerifyAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'CmNpBprH' \
    --body '{"Code": "pu44EWG4", "ContactType": "fPx02XjD", "LanguageTag": "eRKqT04c", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 175 'AdminVerifyAccountV3' test.out

#- 176 GetUserVerificationCode
./ng net.accelbyte.sdk.cli.Main iam getUserVerificationCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'BHETb7HL' \
    > test.out 2>&1
eval_tap $? 176 'GetUserVerificationCode' test.out

#- 177 AdminGetUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Fk65m1mx' \
    > test.out 2>&1
eval_tap $? 177 'AdminGetUserDeletionStatusV3' test.out

#- 178 AdminUpdateUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '2XKlDNQl' \
    --body '{"deletionDate": 49, "enabled": true}' \
    > test.out 2>&1
eval_tap $? 178 'AdminUpdateUserDeletionStatusV3' test.out

#- 179 AdminListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Y4zmbsut' \
    > test.out 2>&1
eval_tap $? 179 'AdminListUserAllPlatformAccountsDistinctV3' test.out

#- 180 AdminUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'mQqBlWxo' \
    --body '{"code": "nj5I4VcH", "country": "MGQqE8wV", "dateOfBirth": "9ZsILOK1", "displayName": "KpT3ZYwQ", "emailAddress": "wdjbFBIF", "password": "hPwKCuE7", "uniqueDisplayName": "Ds8dJ0pD", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 180 'AdminUpgradeHeadlessAccountV3' test.out

#- 181 AdminDeleteUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'H9olGBrc' \
    > test.out 2>&1
eval_tap $? 181 'AdminDeleteUserInformationV3' test.out

#- 182 AdminGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'jCAtNjFP' \
    --after '0.3755642647660751' \
    --before '0.05894766568748566' \
    --limit '16' \
    > test.out 2>&1
eval_tap $? 182 'AdminGetUserLoginHistoriesV3' test.out

#- 183 AdminResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam adminResetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'L1h6Sbhq' \
    --body '{"languageTag": "EajUWtQD", "mfaToken": "4s1EnM4R", "newPassword": "vd5Zipy7", "oldPassword": "nTH8KlAw"}' \
    > test.out 2>&1
eval_tap $? 183 'AdminResetPasswordV3' test.out

#- 184 AdminUpdateUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserPermissionV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '8h4SkWId' \
    --body '{"Permissions": [{"Action": 6, "Resource": "pPf7A0mL", "SchedAction": 76, "SchedCron": "CqdFQU9C", "SchedRange": ["Pkdr99nO", "9FkvN1QG", "bU78rfVu"]}, {"Action": 59, "Resource": "d9Ong168", "SchedAction": 61, "SchedCron": "4PRRD6g2", "SchedRange": ["FmR1ckgG", "65MXMooZ", "62FR4K7J"]}, {"Action": 56, "Resource": "7gESmzpq", "SchedAction": 11, "SchedCron": "5GnabYqo", "SchedRange": ["DYAySIBu", "Zd9oltCd", "ce4i77T0"]}]}' \
    > test.out 2>&1
eval_tap $? 184 'AdminUpdateUserPermissionV3' test.out

#- 185 AdminAddUserPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserPermissionsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'DFsOk5rS' \
    --body '{"Permissions": [{"Action": 48, "Resource": "aJMSw9fU", "SchedAction": 36, "SchedCron": "KnA1sZom", "SchedRange": ["fpaEMU21", "YZLtcnkL", "OPF6dyxD"]}, {"Action": 58, "Resource": "TWJPkrWK", "SchedAction": 92, "SchedCron": "1YV7Ptmz", "SchedRange": ["dYkNp527", "YkPJ1BWH", "O7L70szz"]}, {"Action": 13, "Resource": "BFriiOAW", "SchedAction": 13, "SchedCron": "jFcPWDSY", "SchedRange": ["918j8j4P", "O31P8Yp2", "MSQxMeix"]}]}' \
    > test.out 2>&1
eval_tap $? 185 'AdminAddUserPermissionsV3' test.out

#- 186 AdminDeleteUserPermissionBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'lUHMqvoD' \
    --body '[{"Action": 22, "Resource": "QvRcQHDd"}, {"Action": 26, "Resource": "ow8xjEzn"}, {"Action": 18, "Resource": "VmMY6jGY"}]' \
    > test.out 2>&1
eval_tap $? 186 'AdminDeleteUserPermissionBulkV3' test.out

#- 187 AdminDeleteUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionV3 \
    --action '45' \
    --namespace "$AB_NAMESPACE" \
    --resource 'eNtIq4B9' \
    --userId 'q42XZ8pA' \
    > test.out 2>&1
eval_tap $? 187 'AdminDeleteUserPermissionV3' test.out

#- 188 AdminGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '9XxYNbQ9' \
    --after 'TStRj2FW' \
    --before 'YGqQNLnJ' \
    --limit '100' \
    --platformId 'IPJkS9q3' \
    --targetNamespace 'BMq0fHgR' \
    > test.out 2>&1
eval_tap $? 188 'AdminGetUserPlatformAccountsV3' test.out

#- 189 AdminListAllDistinctPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminListAllDistinctPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'B4o2uwdY' \
    --status 'JdWMZQ66' \
    > test.out 2>&1
eval_tap $? 189 'AdminListAllDistinctPlatformAccountsV3' test.out

#- 190 AdminGetListJusticePlatformAccounts
./ng net.accelbyte.sdk.cli.Main iam adminGetListJusticePlatformAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'DF9Xi52N' \
    > test.out 2>&1
eval_tap $? 190 'AdminGetListJusticePlatformAccounts' test.out

#- 191 AdminGetUserMapping
./ng net.accelbyte.sdk.cli.Main iam adminGetUserMapping \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'pvgn7PZ7' \
    --userId 'mBIWVH4o' \
    > test.out 2>&1
eval_tap $? 191 'AdminGetUserMapping' test.out

#- 192 AdminCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam adminCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'vmbi6b8w' \
    --userId 'd6YCznSb' \
    > test.out 2>&1
eval_tap $? 192 'AdminCreateJusticeUser' test.out

#- 193 AdminLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'LMdwduKM' \
    --skipConflict  \
    --body '{"platformId": "ig5CwWDl", "platformUserId": "sqj8i5Lj"}' \
    > test.out 2>&1
eval_tap $? 193 'AdminLinkPlatformAccount' test.out

#- 194 AdminGetUserLinkHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLinkHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'kDT5dZMe' \
    --platformId '9pDO90Lu' \
    > test.out 2>&1
eval_tap $? 194 'AdminGetUserLinkHistoriesV3' test.out

#- 195 AdminPlatformUnlinkV3
eval_tap 0 195 'AdminPlatformUnlinkV3 # SKIP deprecated' test.out

#- 196 AdminPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'CxRn7Qrv' \
    --userId 'igaHQiTb' \
    > test.out 2>&1
eval_tap $? 196 'AdminPlatformUnlinkAllV3' test.out

#- 197 AdminPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'ZbHXAz9j' \
    --userId 'UD1le3VK' \
    --ticket '99FPgP5J' \
    > test.out 2>&1
eval_tap $? 197 'AdminPlatformLinkV3' test.out

#- 198 AdminDeleteUserLinkingHistoryByPlatformIDV3
eval_tap 0 198 'AdminDeleteUserLinkingHistoryByPlatformIDV3 # SKIP deprecated' test.out

#- 199 AdminDeleteUserLinkingRestrictionByPlatformIDV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserLinkingRestrictionByPlatformIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'mF32TY0W' \
    --userId 'FSstNN3a' \
    > test.out 2>&1
eval_tap $? 199 'AdminDeleteUserLinkingRestrictionByPlatformIDV3' test.out

#- 200 AdminGetThirdPartyPlatformTokenLinkStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetThirdPartyPlatformTokenLinkStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'xdZptuHm' \
    --userId 'KIjcCKjK' \
    --platformToken 'evcXqG8F' \
    > test.out 2>&1
eval_tap $? 200 'AdminGetThirdPartyPlatformTokenLinkStatusV3' test.out

#- 201 AdminGetUserSinglePlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminGetUserSinglePlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --platformId 'mFVeA6GS' \
    --userId 'aaBEcH4G' \
    --crossNamespace  \
    > test.out 2>&1
eval_tap $? 201 'AdminGetUserSinglePlatformAccount' test.out

#- 202 AdminDeleteUserRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRolesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '26g7lbpI' \
    --body '["BQn15RGT", "tI8nrW0p", "74lO68S8"]' \
    > test.out 2>&1
eval_tap $? 202 'AdminDeleteUserRolesV3' test.out

#- 203 AdminSaveUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminSaveUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'kLfZatPe' \
    --body '[{"namespace": "pMZPmVpA", "roleId": "Zn0Dt0HZ"}, {"namespace": "5eJPZQF8", "roleId": "TfMGaekU"}, {"namespace": "wrphLeQv", "roleId": "DGRC85zd"}]' \
    > test.out 2>&1
eval_tap $? 203 'AdminSaveUserRoleV3' test.out

#- 204 AdminAddUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId '13MPgJYK' \
    --userId '9fmD8jC0' \
    > test.out 2>&1
eval_tap $? 204 'AdminAddUserRoleV3' test.out

#- 205 AdminDeleteUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'WLhH0pby' \
    --userId 'zWeP2598' \
    > test.out 2>&1
eval_tap $? 205 'AdminDeleteUserRoleV3' test.out

#- 206 AdminUpdateUserStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'n7u5uRrl' \
    --body '{"enabled": false, "reason": "SOgvsZpQ"}' \
    > test.out 2>&1
eval_tap $? 206 'AdminUpdateUserStatusV3' test.out

#- 207 AdminTrustlyUpdateUserIdentity
./ng net.accelbyte.sdk.cli.Main iam adminTrustlyUpdateUserIdentity \
    --namespace "$AB_NAMESPACE" \
    --userId 'E7RqtehK' \
    --body '{"emailAddress": "2qt3T3oB", "password": "Qsqm8Fr9"}' \
    > test.out 2>&1
eval_tap $? 207 'AdminTrustlyUpdateUserIdentity' test.out

#- 208 AdminVerifyUserWithoutVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyUserWithoutVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'U6Ue0rrH' \
    > test.out 2>&1
eval_tap $? 208 'AdminVerifyUserWithoutVerificationCodeV3' test.out

#- 209 AdminUpdateClientSecretV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientSecretV3 \
    --clientId 'QLHxMx0W' \
    --namespace "$AB_NAMESPACE" \
    --body '{"newSecret": "bhiofpz7"}' \
    > test.out 2>&1
eval_tap $? 209 'AdminUpdateClientSecretV3' test.out

#- 210 AdminCheckThirdPartyLoginPlatformAvailabilityV3
./ng net.accelbyte.sdk.cli.Main iam adminCheckThirdPartyLoginPlatformAvailabilityV3 \
    --platformId '4BlFJHrD' \
    > test.out 2>&1
eval_tap $? 210 'AdminCheckThirdPartyLoginPlatformAvailabilityV3' test.out

#- 211 AdminGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV3 \
    --after 'zClObcZg' \
    --before 'JT8f4WJB' \
    --isWildcard  \
    --limit '61' \
    > test.out 2>&1
eval_tap $? 211 'AdminGetRolesV3' test.out

#- 212 AdminCreateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV3 \
    --body '{"adminRole": true, "deletable": true, "isWildcard": true, "managers": [{"displayName": "Epy3B8r5", "namespace": "m2Q7INQ7", "userId": "ebuBOUQh"}, {"displayName": "CdDBeRQe", "namespace": "YVo7f1PM", "userId": "tLPFfCCz"}, {"displayName": "AgG8GkdO", "namespace": "xNCGSg7n", "userId": "J6VM5Qjx"}], "members": [{"displayName": "6QXoXB4O", "namespace": "xT7Ea6dy", "userId": "uUNBImKB"}, {"displayName": "PezSx8iQ", "namespace": "67YM0ffz", "userId": "F04aVbb9"}, {"displayName": "ixkEL9Nd", "namespace": "JbZrbwId", "userId": "CuQ4sjzG"}], "permissions": [{"action": 60, "resource": "tn9ja6C3", "schedAction": 17, "schedCron": "NX9WwQSV", "schedRange": ["7clYBqIQ", "ejnVhi5Y", "ym43OUej"]}, {"action": 38, "resource": "soUO2JjV", "schedAction": 62, "schedCron": "FhxLKxEN", "schedRange": ["La8bmxO4", "sKCqmxnt", "qj9REFmR"]}, {"action": 11, "resource": "kLEFznTY", "schedAction": 97, "schedCron": "T8arN9Eq", "schedRange": ["ePDBk4Yj", "EVTkRpPs", "jOsoUMY9"]}], "roleName": "ydVAPk6p"}' \
    > test.out 2>&1
eval_tap $? 212 'AdminCreateRoleV3' test.out

#- 213 AdminGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV3 \
    --roleId 'opEMd2VD' \
    > test.out 2>&1
eval_tap $? 213 'AdminGetRoleV3' test.out

#- 214 AdminDeleteRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV3 \
    --roleId 'x5egNGJp' \
    > test.out 2>&1
eval_tap $? 214 'AdminDeleteRoleV3' test.out

#- 215 AdminUpdateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV3 \
    --roleId 'pgnPVDS3' \
    --body '{"deletable": true, "isWildcard": true, "roleName": "4DuBZ4JQ"}' \
    > test.out 2>&1
eval_tap $? 215 'AdminUpdateRoleV3' test.out

#- 216 AdminGetRoleAdminStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleAdminStatusV3 \
    --roleId '8zTBu2Gn' \
    > test.out 2>&1
eval_tap $? 216 'AdminGetRoleAdminStatusV3' test.out

#- 217 AdminUpdateAdminRoleStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateAdminRoleStatusV3 \
    --roleId 'beijON5x' \
    > test.out 2>&1
eval_tap $? 217 'AdminUpdateAdminRoleStatusV3' test.out

#- 218 AdminRemoveRoleAdminV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleAdminV3 \
    --roleId 'VZYeEwaX' \
    > test.out 2>&1
eval_tap $? 218 'AdminRemoveRoleAdminV3' test.out

#- 219 AdminGetRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleManagersV3 \
    --roleId 'PVdH0V1x' \
    --after '3SIyzsnA' \
    --before '8jOJHCOt' \
    --limit '35' \
    > test.out 2>&1
eval_tap $? 219 'AdminGetRoleManagersV3' test.out

#- 220 AdminAddRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleManagersV3 \
    --roleId 'C1M3J0R6' \
    --body '{"managers": [{"displayName": "WY8hgaC8", "namespace": "nl9G51SH", "userId": "G1scqspB"}, {"displayName": "emOOZvdX", "namespace": "NAmbMsIv", "userId": "mWRYQDP0"}, {"displayName": "8965Aq3B", "namespace": "ESg1VRBT", "userId": "qOGuxvn8"}]}' \
    > test.out 2>&1
eval_tap $? 220 'AdminAddRoleManagersV3' test.out

#- 221 AdminRemoveRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleManagersV3 \
    --roleId 'G9lZkdqs' \
    --body '{"managers": [{"displayName": "tTE2ot6u", "namespace": "7Bojrfhn", "userId": "kzDBw9ph"}, {"displayName": "cpXIQ6z0", "namespace": "r5QIyqrN", "userId": "mgLJcGXn"}, {"displayName": "br2Rn4Qh", "namespace": "qKjYJeCO", "userId": "mrndss9o"}]}' \
    > test.out 2>&1
eval_tap $? 221 'AdminRemoveRoleManagersV3' test.out

#- 222 AdminGetRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleMembersV3 \
    --roleId 'hla8UtMU' \
    --after 'AKzum1tF' \
    --before '3cZgvNMT' \
    --limit '77' \
    > test.out 2>&1
eval_tap $? 222 'AdminGetRoleMembersV3' test.out

#- 223 AdminAddRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleMembersV3 \
    --roleId 'ebt2853h' \
    --body '{"members": [{"displayName": "PcMHSU2S", "namespace": "JZHCQO33", "userId": "Dsj6tqtN"}, {"displayName": "nqDbC3yu", "namespace": "GBRQ15PH", "userId": "ageuAqPd"}, {"displayName": "3hVTgoLp", "namespace": "HJIzjUpC", "userId": "ha85fvRk"}]}' \
    > test.out 2>&1
eval_tap $? 223 'AdminAddRoleMembersV3' test.out

#- 224 AdminRemoveRoleMembersV3
eval_tap 0 224 'AdminRemoveRoleMembersV3 # SKIP deprecated' test.out

#- 225 AdminUpdateRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV3 \
    --roleId 'bdnydcxx' \
    --body '{"permissions": [{"action": 25, "resource": "olo4jDGC", "schedAction": 60, "schedCron": "SJp28CHi", "schedRange": ["rxyIqexe", "hLb2cGPa", "oGJwnze0"]}, {"action": 7, "resource": "MxNAENLk", "schedAction": 18, "schedCron": "ekrOPhDh", "schedRange": ["2Ovpb0VI", "QiPFkc81", "0g6PIvUq"]}, {"action": 97, "resource": "Z4Q8J8T0", "schedAction": 49, "schedCron": "fiViR4AX", "schedRange": ["4nCQjQn3", "aMo8lxOJ", "nMsV1gpm"]}]}' \
    > test.out 2>&1
eval_tap $? 225 'AdminUpdateRolePermissionsV3' test.out

#- 226 AdminAddRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV3 \
    --roleId 'TZxIBuPq' \
    --body '{"permissions": [{"action": 47, "resource": "OOxi13cL", "schedAction": 4, "schedCron": "e5X8G2t5", "schedRange": ["0THIPiQK", "I1WGFCo4", "RefqDESb"]}, {"action": 49, "resource": "jyMXbmOS", "schedAction": 53, "schedCron": "IhlHzsHu", "schedRange": ["mtFWBqiz", "HHzlJTkZ", "BLFic2XB"]}, {"action": 100, "resource": "JdEdm3Vg", "schedAction": 34, "schedCron": "KvSPqpD3", "schedRange": ["g9NCqJIY", "1Uwmu8PW", "Kff9FmjT"]}]}' \
    > test.out 2>&1
eval_tap $? 226 'AdminAddRolePermissionsV3' test.out

#- 227 AdminDeleteRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV3 \
    --roleId 'Yf0cZm0G' \
    --body '["K0pGvvw0", "9f1mSnx2", "eMX7k3OO"]' \
    > test.out 2>&1
eval_tap $? 227 'AdminDeleteRolePermissionsV3' test.out

#- 228 AdminDeleteRolePermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionV3 \
    --action '100' \
    --resource 'D9pFa8fv' \
    --roleId 'ZNzQNCk5' \
    > test.out 2>&1
eval_tap $? 228 'AdminDeleteRolePermissionV3' test.out

#- 229 AdminGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam adminGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 229 'AdminGetMyUserV3' test.out

#- 230 UserAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam userAuthenticationV3 \
    --clientId 'WFMja5Mu' \
    --extendExp  \
    --redirectUri 'Nsj4sx0f' \
    --password 'oBmdhoZo' \
    --requestId '1BRdQrVV' \
    --userName '4kKkqE78' \
    > test.out 2>&1
eval_tap $? 230 'UserAuthenticationV3' test.out

#- 231 AuthenticationWithPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV3 \
    --extendExp  \
    --clientId 'xxfgNS6y' \
    --linkingToken 'egCgexY6' \
    --password 'q7iGHFVA' \
    --username 'EHItFy0J' \
    > test.out 2>&1
eval_tap $? 231 'AuthenticationWithPlatformLinkV3' test.out

#- 232 GenerateTokenByNewHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV3 \
    --additionalData '90IwxKtS' \
    --extendExp  \
    --linkingToken 'JVmQBlTD' \
    > test.out 2>&1
eval_tap $? 232 'GenerateTokenByNewHeadlessAccountV3' test.out

#- 233 RequestOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam requestOneTimeLinkingCodeV3 \
    --platformId 'Z50vN8tx' \
    > test.out 2>&1
eval_tap $? 233 'RequestOneTimeLinkingCodeV3' test.out

#- 234 ValidateOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam validateOneTimeLinkingCodeV3 \
    --oneTimeLinkCode 'd4LgfEVA' \
    > test.out 2>&1
eval_tap $? 234 'ValidateOneTimeLinkingCodeV3' test.out

#- 235 RequestTokenByOneTimeLinkCodeResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTokenByOneTimeLinkCodeResponseV3 \
    --additionalData '77fbuKB7' \
    --isTransient  \
    --clientId 'qPFL601k' \
    --oneTimeLinkCode 'W6D2nftF' \
    > test.out 2>&1
eval_tap $? 235 'RequestTokenByOneTimeLinkCodeResponseV3' test.out

#- 236 GetCountryLocationV3
./ng net.accelbyte.sdk.cli.Main iam getCountryLocationV3 \
    > test.out 2>&1
eval_tap $? 236 'GetCountryLocationV3' test.out

#- 237 Logout
./ng net.accelbyte.sdk.cli.Main iam logout \
    > test.out 2>&1
eval_tap $? 237 'Logout' test.out

#- 238 RequestTokenExchangeCodeV3
./ng net.accelbyte.sdk.cli.Main iam requestTokenExchangeCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --codeChallenge 'Nmi8aLCh' \
    --codeChallengeMethod 'S256' \
    --clientId 'oN7gtxFH' \
    > test.out 2>&1
eval_tap $? 238 'RequestTokenExchangeCodeV3' test.out

#- 239 AdminRetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam adminRetrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'a02ZiHC9' \
    --userId 'uh87gGiN' \
    --platformUserId 'vYcqZlRp' \
    > test.out 2>&1
eval_tap $? 239 'AdminRetrieveUserThirdPartyPlatformTokenV3' test.out

#- 240 RevokeUserV3
./ng net.accelbyte.sdk.cli.Main iam revokeUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'r2wAWpp4' \
    --includeGameNamespace  \
    > test.out 2>&1
eval_tap $? 240 'RevokeUserV3' test.out

#- 241 AuthorizeV3
./ng net.accelbyte.sdk.cli.Main iam authorizeV3 \
    --codeChallenge 'WGBYQic2' \
    --codeChallengeMethod 'S256' \
    --createHeadless  \
    --oneTimeLinkCode 'vNiSnFd9' \
    --redirectUri 'loriSO9B' \
    --scope 'k0b6Vavb' \
    --state '5kYIRzUB' \
    --targetAuthPage 'zYRh6Gni' \
    --useRedirectUriAsLoginUrlWhenLocked  \
    --clientId 'W8ZUsTMO' \
    --responseType 'code' \
    > test.out 2>&1
eval_tap $? 241 'AuthorizeV3' test.out

#- 242 TokenIntrospectionV3
./ng net.accelbyte.sdk.cli.Main iam tokenIntrospectionV3 \
    --token 'CPgwbgWH' \
    > test.out 2>&1
eval_tap $? 242 'TokenIntrospectionV3' test.out

#- 243 GetJWKSV3
./ng net.accelbyte.sdk.cli.Main iam getJWKSV3 \
    > test.out 2>&1
eval_tap $? 243 'GetJWKSV3' test.out

#- 244 SendMFAAuthenticationCode
./ng net.accelbyte.sdk.cli.Main iam sendMFAAuthenticationCode \
    --clientId 'ULuBWfx9' \
    --factor 'XaIOz1Ym' \
    --mfaToken 'xTJhg6AD' \
    > test.out 2>&1
eval_tap $? 244 'SendMFAAuthenticationCode' test.out

#- 245 Change2faMethod
./ng net.accelbyte.sdk.cli.Main iam change2faMethod \
    --factor 'B1LtPisb' \
    --mfaToken 'URIlEuSM' \
    > test.out 2>&1
eval_tap $? 245 'Change2faMethod' test.out

#- 246 Verify2faCode
./ng net.accelbyte.sdk.cli.Main iam verify2faCode \
    --code 'DhN69V84' \
    --factor 'mjmJSLXK' \
    --mfaToken 'vFfY0Zq4' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 246 'Verify2faCode' test.out

#- 247 RetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam retrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'TNkIH2KO' \
    --userId 'BcgSU0Aj' \
    > test.out 2>&1
eval_tap $? 247 'RetrieveUserThirdPartyPlatformTokenV3' test.out

#- 248 AuthCodeRequestV3
./ng net.accelbyte.sdk.cli.Main iam authCodeRequestV3 \
    --platformId 'K5Ip7gcS' \
    --clientId '4IieNp5Y' \
    --redirectUri 'bHO1A6c3' \
    --requestId 'YmEqTifK' \
    > test.out 2>&1
eval_tap $? 248 'AuthCodeRequestV3' test.out

#- 249 PlatformTokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV3 \
    --platformId 'vAtGDGN4' \
    --additionalData 'RkBeVe9B' \
    --clientId 'omQli5qn' \
    --createHeadless  \
    --deviceId 'Ip9lSdbT' \
    --macAddress 'pnOYl3aA' \
    --platformToken 'xZgs7W7w' \
    --serviceLabel '0.6061943052954206' \
    --skipSetCookie  \
    > test.out 2>&1
eval_tap $? 249 'PlatformTokenGrantV3' test.out

#- 250 GetRevocationListV3
./ng net.accelbyte.sdk.cli.Main iam getRevocationListV3 \
    > test.out 2>&1
eval_tap $? 250 'GetRevocationListV3' test.out

#- 251 TokenRevocationV3
./ng net.accelbyte.sdk.cli.Main iam tokenRevocationV3 \
    --token 'Cu8mdP0j' \
    > test.out 2>&1
eval_tap $? 251 'TokenRevocationV3' test.out

#- 252 SimultaneousLoginV3
./ng net.accelbyte.sdk.cli.Main iam simultaneousLoginV3 \
    --simultaneousPlatform 'vSH7GXjN' \
    --simultaneousTicket '3VLLjYeC' \
    --nativePlatform 'steam' \
    --nativePlatformTicket 'PuypcEha' \
    > test.out 2>&1
eval_tap $? 252 'SimultaneousLoginV3' test.out

#- 253 TokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV3 \
    --additionalData 'M4pXID7L' \
    --clientId 'RD4NQwM3' \
    --clientSecret 'feWnjDql' \
    --code 'klgijUyN' \
    --codeVerifier 'RAgisWPi' \
    --extendNamespace 'PoZ61k9e' \
    --extendExp  \
    --password 'GMkFlyyy' \
    --redirectUri '49pn9RVg' \
    --refreshToken 'VmUgG2Vg' \
    --username 'okmTyCbA' \
    --grantType 'authorization_code' \
    > test.out 2>&1
eval_tap $? 253 'TokenGrantV3' test.out

#- 254 VerifyTokenV3
./ng net.accelbyte.sdk.cli.Main iam verifyTokenV3 \
    --token 'SXaCdjKI' \
    > test.out 2>&1
eval_tap $? 254 'VerifyTokenV3' test.out

#- 255 PlatformAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticationV3 \
    --platformId 'nFBgtF4M' \
    --code 'iIkvOI5I' \
    --error 'mXTY0HeL' \
    --openidAssocHandle 'Usbes7U3' \
    --openidClaimedId 'c1HzhHQk' \
    --openidIdentity '5OJzeHG8' \
    --openidMode 'xzlxYn0T' \
    --openidNs 'tEoYFJIe' \
    --openidOpEndpoint 'kng8KX2l' \
    --openidResponseNonce 's6jrMnSN' \
    --openidReturnTo 't7raYdXM' \
    --openidSig 'yYtvAK1F' \
    --openidSigned 'qMXw7uTZ' \
    --state 'ub7Sjcue' \
    > test.out 2>&1
eval_tap $? 255 'PlatformAuthenticationV3' test.out

#- 256 PlatformTokenRefreshV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenRefreshV3 \
    --platformId '8ncC2iWH' \
    --platformToken '9fjrXtUR' \
    > test.out 2>&1
eval_tap $? 256 'PlatformTokenRefreshV3' test.out

#- 257 PublicGetInputValidations
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidations \
    --defaultOnEmpty  \
    --languageCode 'iE39kgkC' \
    > test.out 2>&1
eval_tap $? 257 'PublicGetInputValidations' test.out

#- 258 PublicGetInputValidationByField
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidationByField \
    --field 'uLxhx2AV' \
    > test.out 2>&1
eval_tap $? 258 'PublicGetInputValidationByField' test.out

#- 259 PublicGetCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam publicGetCountryAgeRestrictionV3 \
    --countryCode '28mPuJpn' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 259 'PublicGetCountryAgeRestrictionV3' test.out

#- 260 PublicGetConfigValueV3
./ng net.accelbyte.sdk.cli.Main iam publicGetConfigValueV3 \
    --configKey 'QMO7A2Fk' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 260 'PublicGetConfigValueV3' test.out

#- 261 PublicGetCountryListV3
./ng net.accelbyte.sdk.cli.Main iam publicGetCountryListV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 261 'PublicGetCountryListV3' test.out

#- 262 RetrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3
./ng net.accelbyte.sdk.cli.Main iam retrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 262 'RetrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3' test.out

#- 263 RetrieveActiveOIDCClientsPublicV3
./ng net.accelbyte.sdk.cli.Main iam retrieveActiveOIDCClientsPublicV3 \
    --namespace "$AB_NAMESPACE" \
    --clientId 'jnv1hU2W' \
    > test.out 2>&1
eval_tap $? 263 'RetrieveActiveOIDCClientsPublicV3' test.out

#- 264 PublicListUserIDByPlatformUserIDsV3
eval_tap 0 264 'PublicListUserIDByPlatformUserIDsV3 # SKIP deprecated' test.out

#- 265 PublicGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'lCvpRfWk' \
    --platformUserId 'b8SpQjLv' \
    > test.out 2>&1
eval_tap $? 265 'PublicGetUserByPlatformUserIDV3' test.out

#- 266 PublicGetAsyncStatus
./ng net.accelbyte.sdk.cli.Main iam publicGetAsyncStatus \
    --namespace "$AB_NAMESPACE" \
    --requestId 'UeUHE96Y' \
    > test.out 2>&1
eval_tap $? 266 'PublicGetAsyncStatus' test.out

#- 267 PublicSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam publicSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'ko3LcH8k' \
    --limit '93' \
    --offset '85' \
    --platformBy 'r45aRLHw' \
    --platformId 'xhkl7GP9' \
    --query 'jKTGTLWR' \
    > test.out 2>&1
eval_tap $? 267 'PublicSearchUserV3' test.out

#- 268 PublicCreateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "8N8pdiXG", "acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "dm9f45aA", "policyId": "fQeeUu4v", "policyVersionId": "BSAfDQfS"}, {"isAccepted": true, "localizedPolicyVersionId": "B4cSFnkt", "policyId": "wl7eNsBD", "policyVersionId": "mwTDRGBh"}, {"isAccepted": false, "localizedPolicyVersionId": "15Q0u0y6", "policyId": "sXYtZdRf", "policyVersionId": "zDZncO0v"}], "authType": "ziIklr8t", "code": "XzoU7ITI", "country": "bGhibl31", "dateOfBirth": "kKdg53ai", "displayName": "wjDBtFN1", "emailAddress": "SEQq5wXo", "password": "uODAClKg", "reachMinimumAge": false, "uniqueDisplayName": "sX7j59ye"}' \
    > test.out 2>&1
eval_tap $? 268 'PublicCreateUserV3' test.out

#- 269 CheckUserAvailability
./ng net.accelbyte.sdk.cli.Main iam checkUserAvailability \
    --namespace "$AB_NAMESPACE" \
    --field 'fkHEROjz' \
    --query 'XXq8n9RF' \
    > test.out 2>&1
eval_tap $? 269 'CheckUserAvailability' test.out

#- 270 PublicBulkGetUsers
./ng net.accelbyte.sdk.cli.Main iam publicBulkGetUsers \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["taCSYxh8", "HLEhAMzP", "5AWfW8eF"]}' \
    > test.out 2>&1
eval_tap $? 270 'PublicBulkGetUsers' test.out

#- 271 PublicSendRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicSendRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "uzr8Hbdz", "languageTag": "0QzPWDUf"}' \
    > test.out 2>&1
eval_tap $? 271 'PublicSendRegistrationCode' test.out

#- 272 PublicVerifyRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicVerifyRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "jmGXiVEa", "emailAddress": "nUsqRC59"}' \
    > test.out 2>&1
eval_tap $? 272 'PublicVerifyRegistrationCode' test.out

#- 273 PublicForgotPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicForgotPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "bNWBfYmG", "languageTag": "lDnqGC8L"}' \
    > test.out 2>&1
eval_tap $? 273 'PublicForgotPasswordV3' test.out

#- 274 PublicValidateUserInput
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserInput \
    --namespace "$AB_NAMESPACE" \
    --body '{"displayName": "NFYHIIdC", "password": "15sjc7PQ", "uniqueDisplayName": "Lp1fZTQQ", "username": "JSRP8C5l"}' \
    > test.out 2>&1
eval_tap $? 274 'PublicValidateUserInput' test.out

#- 275 GetAdminInvitationV3
./ng net.accelbyte.sdk.cli.Main iam getAdminInvitationV3 \
    --invitationId 'je4PLfZM' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 275 'GetAdminInvitationV3' test.out

#- 276 CreateUserFromInvitationV3
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV3 \
    --invitationId 'hAPossyi' \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "a1p18jI9", "acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "NPHJCpR0", "policyId": "GXhQhfDZ", "policyVersionId": "fpUSUosG"}, {"isAccepted": true, "localizedPolicyVersionId": "61faVcqp", "policyId": "7y7DFjvt", "policyVersionId": "TnPhcB2W"}, {"isAccepted": false, "localizedPolicyVersionId": "7OPgplWt", "policyId": "5Ct7axNe", "policyVersionId": "fdGWo1c3"}], "authType": "62C4OAFg", "code": "zBwSKORd", "country": "xGB8gbkW", "dateOfBirth": "IQf6aOSO", "displayName": "DXayvXum", "emailAddress": "e1zeISc4", "password": "NOZYI1da", "reachMinimumAge": true, "uniqueDisplayName": "n3Jg45Hy"}' \
    > test.out 2>&1
eval_tap $? 276 'CreateUserFromInvitationV3' test.out

#- 277 UpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam updateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "qEKwThmF", "country": "PX3HEggz", "dateOfBirth": "X6AngyZX", "displayName": "vHcIVDM3", "languageTag": "0uL8wNG4", "uniqueDisplayName": "X6JJUHjK", "userName": "Kpre1QwH"}' \
    > test.out 2>&1
eval_tap $? 277 'UpdateUserV3' test.out

#- 278 PublicPartialUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicPartialUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "pinpiHVQ", "country": "5CUaFP2E", "dateOfBirth": "WkfH11wF", "displayName": "ICjzzTQ6", "languageTag": "EVoCaAhc", "uniqueDisplayName": "1MBEiIM7", "userName": "yeeMYbLC"}' \
    > test.out 2>&1
eval_tap $? 278 'PublicPartialUpdateUserV3' test.out

#- 279 PublicSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"context": "K6cDQgFe", "emailAddress": "seGjGMB5", "languageTag": "8aoghV6p"}' \
    > test.out 2>&1
eval_tap $? 279 'PublicSendVerificationCodeV3' test.out

#- 280 PublicUserVerificationV3
./ng net.accelbyte.sdk.cli.Main iam publicUserVerificationV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "BVFZYuFO", "contactType": "pNwbLqg1", "languageTag": "ArOMbVjz", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 280 'PublicUserVerificationV3' test.out

#- 281 PublicUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "fHfhCqLL", "country": "enLOJ1a1", "dateOfBirth": "LX1RpFB3", "displayName": "sIydsXdW", "emailAddress": "bwJ6nRX1", "password": "kMChVzVH", "uniqueDisplayName": "dZ6ow7Ar", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 281 'PublicUpgradeHeadlessAccountV3' test.out

#- 282 PublicVerifyHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --needVerificationCode  \
    --body '{"emailAddress": "UPXheUA5", "password": "DJPbQUfY"}' \
    > test.out 2>&1
eval_tap $? 282 'PublicVerifyHeadlessAccountV3' test.out

#- 283 PublicUpdatePasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicUpdatePasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"languageTag": "6r1himsM", "mfaToken": "EN05TPtE", "newPassword": "f3u8fdnC", "oldPassword": "iG4x7j0e"}' \
    > test.out 2>&1
eval_tap $? 283 'PublicUpdatePasswordV3' test.out

#- 284 PublicCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam publicCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace '4pW9p4q7' \
    > test.out 2>&1
eval_tap $? 284 'PublicCreateJusticeUser' test.out

#- 285 PublicPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'vUWY1bsu' \
    --redirectUri 'p44PNDKR' \
    --ticket 'lU7nEBrq' \
    > test.out 2>&1
eval_tap $? 285 'PublicPlatformLinkV3' test.out

#- 286 PublicPlatformUnlinkV3
eval_tap 0 286 'PublicPlatformUnlinkV3 # SKIP deprecated' test.out

#- 287 PublicPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'hMYIxg8X' \
    > test.out 2>&1
eval_tap $? 287 'PublicPlatformUnlinkAllV3' test.out

#- 288 PublicForcePlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicForcePlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '4k1W8ehy' \
    --ticket 'oEEizSYd' \
    > test.out 2>&1
eval_tap $? 288 'PublicForcePlatformLinkV3' test.out

#- 289 PublicWebLinkPlatform
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatform \
    --namespace "$AB_NAMESPACE" \
    --platformId 'jF0ECA1Q' \
    --clientId 'bIlD7ewL' \
    --redirectUri 'TypZGNZ0' \
    > test.out 2>&1
eval_tap $? 289 'PublicWebLinkPlatform' test.out

#- 290 PublicWebLinkPlatformEstablish
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatformEstablish \
    --namespace "$AB_NAMESPACE" \
    --platformId 'r2qHrQsf' \
    --code 'OYEQZrI9' \
    --state 'fvjz1YyG' \
    > test.out 2>&1
eval_tap $? 290 'PublicWebLinkPlatformEstablish' test.out

#- 291 PublicProcessWebLinkPlatformV3
./ng net.accelbyte.sdk.cli.Main iam publicProcessWebLinkPlatformV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '8efqTJ9J' \
    --code 'wsJPOS8h' \
    --state '3Sok27Xq' \
    > test.out 2>&1
eval_tap $? 291 'PublicProcessWebLinkPlatformV3' test.out

#- 292 PublicGetUsersPlatformInfosV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUsersPlatformInfosV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"platformId": "Hn28Z5ON", "userIds": ["uENr8R8l", "QXAAaBUl", "ZEzREwJR"]}' \
    > test.out 2>&1
eval_tap $? 292 'PublicGetUsersPlatformInfosV3' test.out

#- 293 ResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam resetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientId": "ZCzqkNdp", "code": "65R3dZhm", "emailAddress": "tk0YyuNy", "languageTag": "YumYMk74", "newPassword": "f8I6ta7F"}' \
    > test.out 2>&1
eval_tap $? 293 'ResetPasswordV3' test.out

#- 294 PublicGetUserByUserIdV3
eval_tap 0 294 'PublicGetUserByUserIdV3 # SKIP deprecated' test.out

#- 295 PublicGetUserBanHistoryV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserBanHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'werjhlBj' \
    --activeOnly  \
    --after 'i5CuTmlb' \
    --before '5tRAj3hv' \
    --limit '6' \
    > test.out 2>&1
eval_tap $? 295 'PublicGetUserBanHistoryV3' test.out

#- 296 PublicListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'vrJoccio' \
    > test.out 2>&1
eval_tap $? 296 'PublicListUserAllPlatformAccountsDistinctV3' test.out

#- 297 PublicGetUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '8yEV0MHk' \
    > test.out 2>&1
eval_tap $? 297 'PublicGetUserInformationV3' test.out

#- 298 PublicGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'REDwys5c' \
    --after '0.24507532558803957' \
    --before '0.39123691349081746' \
    --limit '90' \
    > test.out 2>&1
eval_tap $? 298 'PublicGetUserLoginHistoriesV3' test.out

#- 299 PublicGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'D0fdelIb' \
    --after 'bCs8i9tX' \
    --before 'pK3JDtNX' \
    --limit '4' \
    --platformId 'nVriAr1u' \
    > test.out 2>&1
eval_tap $? 299 'PublicGetUserPlatformAccountsV3' test.out

#- 300 PublicListJusticePlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicListJusticePlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ATo7u5eT' \
    > test.out 2>&1
eval_tap $? 300 'PublicListJusticePlatformAccountsV3' test.out

#- 301 PublicLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam publicLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId '2ihlW2vG' \
    --body '{"platformId": "4oMhvzgf", "platformUserId": "ojnfGTow"}' \
    > test.out 2>&1
eval_tap $? 301 'PublicLinkPlatformAccount' test.out

#- 302 PublicForceLinkPlatformWithProgression
./ng net.accelbyte.sdk.cli.Main iam publicForceLinkPlatformWithProgression \
    --namespace "$AB_NAMESPACE" \
    --userId '30FT4DK6' \
    --body '{"chosenNamespaces": ["ledo2vJH", "LN2RYbYv", "fUQbE8zb"], "requestId": "JJmZTC9a"}' \
    > test.out 2>&1
eval_tap $? 302 'PublicForceLinkPlatformWithProgression' test.out

#- 303 PublicGetPublisherUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetPublisherUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'q3VGrIGB' \
    > test.out 2>&1
eval_tap $? 303 'PublicGetPublisherUserV3' test.out

#- 304 PublicValidateUserByUserIDAndPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserByUserIDAndPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'kycvsZNs' \
    --password 'MoUMibhy' \
    > test.out 2>&1
eval_tap $? 304 'PublicValidateUserByUserIDAndPasswordV3' test.out

#- 305 PublicGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRolesV3 \
    --after 'cPiC3IE2' \
    --before 'LUE8PXxU' \
    --isWildcard  \
    --limit '17' \
    > test.out 2>&1
eval_tap $? 305 'PublicGetRolesV3' test.out

#- 306 PublicGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRoleV3 \
    --roleId 'FPO81cWT' \
    > test.out 2>&1
eval_tap $? 306 'PublicGetRoleV3' test.out

#- 307 PublicGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyUserV3 \
    --includeAllPlatforms  \
    > test.out 2>&1
eval_tap $? 307 'PublicGetMyUserV3' test.out

#- 308 PublicGetLinkHeadlessAccountToMyAccountConflictV3
./ng net.accelbyte.sdk.cli.Main iam publicGetLinkHeadlessAccountToMyAccountConflictV3 \
    --oneTimeLinkCode '20K8TEmS' \
    > test.out 2>&1
eval_tap $? 308 'PublicGetLinkHeadlessAccountToMyAccountConflictV3' test.out

#- 309 LinkHeadlessAccountToMyAccountV3
./ng net.accelbyte.sdk.cli.Main iam linkHeadlessAccountToMyAccountV3 \
    --body '{"chosenNamespaces": ["7J4SKJ7j", "wzWO8cSy", "fdQBXRmy"], "oneTimeLinkCode": "3DB6Dqm8"}' \
    > test.out 2>&1
eval_tap $? 309 'LinkHeadlessAccountToMyAccountV3' test.out

#- 310 PublicSendVerificationLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationLinkV3 \
    --body '{"languageTag": "h5k4CzkD"}' \
    > test.out 2>&1
eval_tap $? 310 'PublicSendVerificationLinkV3' test.out

#- 311 PublicVerifyUserByLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyUserByLinkV3 \
    --code '9TMwotku' \
    > test.out 2>&1
eval_tap $? 311 'PublicVerifyUserByLinkV3' test.out

#- 312 PlatformAuthenticateSAMLV3Handler
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticateSAMLV3Handler \
    --platformId 'I1fzJmWb' \
    --code '95V7bwjJ' \
    --error 'ELEufqOO' \
    --state '6A59d0g5' \
    > test.out 2>&1
eval_tap $? 312 'PlatformAuthenticateSAMLV3Handler' test.out

#- 313 LoginSSOClient
./ng net.accelbyte.sdk.cli.Main iam loginSSOClient \
    --platformId 'zSvug5n0' \
    --payload 'axZaiC8B' \
    > test.out 2>&1
eval_tap $? 313 'LoginSSOClient' test.out

#- 314 LogoutSSOClient
./ng net.accelbyte.sdk.cli.Main iam logoutSSOClient \
    --platformId '15F6XATB' \
    > test.out 2>&1
eval_tap $? 314 'LogoutSSOClient' test.out

#- 315 RequestTargetTokenResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTargetTokenResponseV3 \
    --additionalData 'XeyTMah0' \
    --code 'hmZzJeuK' \
    > test.out 2>&1
eval_tap $? 315 'RequestTargetTokenResponseV3' test.out

#- 316 AdminListInvitationHistoriesV4
./ng net.accelbyte.sdk.cli.Main iam adminListInvitationHistoriesV4 \
    --limit '56' \
    --namespace "$AB_NAMESPACE" \
    --offset '80' \
    > test.out 2>&1
eval_tap $? 316 'AdminListInvitationHistoriesV4' test.out

#- 317 AdminGetDevicesByUserV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDevicesByUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'mlSMTDYw' \
    > test.out 2>&1
eval_tap $? 317 'AdminGetDevicesByUserV4' test.out

#- 318 AdminGetBannedDevicesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedDevicesV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceType 'cLLBROzq' \
    --endDate 'Q0XhaBtW' \
    --limit '23' \
    --offset '50' \
    --startDate 'MEbrSLIu' \
    > test.out 2>&1
eval_tap $? 318 'AdminGetBannedDevicesV4' test.out

#- 319 AdminGetUserDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeviceBansV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '6QqCkOR5' \
    > test.out 2>&1
eval_tap $? 319 'AdminGetUserDeviceBansV4' test.out

#- 320 AdminBanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminBanDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"comment": "FigXiqVM", "deviceId": "dW7ALM6n", "deviceType": "etPWKRm9", "enabled": false, "endDate": "d5fXl55f", "ext": {"fs8hNjgu": {}, "1FaTiAn5": {}, "SujaeZn4": {}}, "reason": "7AsFprk6"}' \
    > test.out 2>&1
eval_tap $? 320 'AdminBanDeviceV4' test.out

#- 321 AdminGetDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBanV4 \
    --banId 'lvgr190f' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 321 'AdminGetDeviceBanV4' test.out

#- 322 AdminUpdateDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateDeviceBanV4 \
    --banId '36jNREPE' \
    --namespace "$AB_NAMESPACE" \
    --body '{"enabled": true}' \
    > test.out 2>&1
eval_tap $? 322 'AdminUpdateDeviceBanV4' test.out

#- 323 AdminGenerateReportV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateReportV4 \
    --namespace "$AB_NAMESPACE" \
    --endDate '02K6bGWj' \
    --startDate 'PpsdS2XO' \
    --deviceType 'BZ9kPG8c' \
    > test.out 2>&1
eval_tap $? 323 'AdminGenerateReportV4' test.out

#- 324 AdminGetDeviceTypesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceTypesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 324 'AdminGetDeviceTypesV4' test.out

#- 325 AdminGetDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBansV4 \
    --deviceId '7n1lRYMG' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 325 'AdminGetDeviceBansV4' test.out

#- 326 AdminDecryptDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminDecryptDeviceV4 \
    --deviceId 'cSq1GgSM' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 326 'AdminDecryptDeviceV4' test.out

#- 327 AdminUnbanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminUnbanDeviceV4 \
    --deviceId 'tmpvEhjU' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 327 'AdminUnbanDeviceV4' test.out

#- 328 AdminGetUsersByDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUsersByDeviceV4 \
    --deviceId 'B7CC53BB' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 328 'AdminGetUsersByDeviceV4' test.out

#- 329 AdminGetNamespaceInvitationHistoryV4
./ng net.accelbyte.sdk.cli.Main iam adminGetNamespaceInvitationHistoryV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 329 'AdminGetNamespaceInvitationHistoryV4' test.out

#- 330 AdminGetNamespaceUserInvitationHistoryV4
./ng net.accelbyte.sdk.cli.Main iam adminGetNamespaceUserInvitationHistoryV4 \
    --namespace "$AB_NAMESPACE" \
    --limit '58' \
    --offset '42' \
    > test.out 2>&1
eval_tap $? 330 'AdminGetNamespaceUserInvitationHistoryV4' test.out

#- 331 AdminCreateTestUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateTestUsersV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 57}' \
    > test.out 2>&1
eval_tap $? 331 'AdminCreateTestUsersV4' test.out

#- 332 AdminCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "8pfFQuNZ", "policyId": "NLxCz3dS", "policyVersionId": "0SOCQ6dn"}, {"isAccepted": false, "localizedPolicyVersionId": "gLwm6kTz", "policyId": "LmZ4ObRV", "policyVersionId": "LV6pBko7"}, {"isAccepted": false, "localizedPolicyVersionId": "AulPi37X", "policyId": "Ku7WNeJA", "policyVersionId": "GDgy5Cuw"}], "authType": "EMAILPASSWD", "code": "9cur93U9", "country": "5WnNEoc8", "dateOfBirth": "vy3Aifyo", "displayName": "mI5OeLPJ", "emailAddress": "kCabZlQg", "password": "bKe4VUxD", "passwordMD5Sum": "mYvpUzCL", "reachMinimumAge": false, "uniqueDisplayName": "jZnUurWm", "username": "iNjMHKrW"}' \
    > test.out 2>&1
eval_tap $? 332 'AdminCreateUserV4' test.out

#- 333 AdminBulkUpdateUserAccountTypeV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateUserAccountTypeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"testAccount": true, "userIds": ["B51uD94S", "ZmI7NtnU", "GZm4vWab"]}' \
    > test.out 2>&1
eval_tap $? 333 'AdminBulkUpdateUserAccountTypeV4' test.out

#- 334 AdminBulkCheckValidUserIDV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkCheckValidUserIDV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["xWiijt9X", "noNbbjNk", "oexGJsMM"]}' \
    > test.out 2>&1
eval_tap $? 334 'AdminBulkCheckValidUserIDV4' test.out

#- 335 AdminUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'hAiOvDb1' \
    --body '{"avatarUrl": "N95UDQhe", "country": "VkZOj5DY", "dateOfBirth": "FhnQs6oA", "displayName": "4WdWmeqi", "languageTag": "U1pJybII", "skipLoginQueue": true, "uniqueDisplayName": "qAyroYL9", "userName": "uxJE6oez"}' \
    > test.out 2>&1
eval_tap $? 335 'AdminUpdateUserV4' test.out

#- 336 AdminUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 't47lYBtd' \
    --body '{"code": "wnzmlcmK", "emailAddress": "fDiCX1LX"}' \
    > test.out 2>&1
eval_tap $? 336 'AdminUpdateUserEmailAddressV4' test.out

#- 337 AdminDisableUserMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableUserMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZFTJELij' \
    > test.out 2>&1
eval_tap $? 337 'AdminDisableUserMFAV4' test.out

#- 338 AdminListUserRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminListUserRolesV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'L4n8yWXg' \
    > test.out 2>&1
eval_tap $? 338 'AdminListUserRolesV4' test.out

#- 339 AdminUpdateUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'P6stCZ3O' \
    --body '{"assignedNamespaces": ["xIh0AKgS", "Dm7TBl4j", "HCPKAf5c"], "roleId": "CrXvz6dg"}' \
    > test.out 2>&1
eval_tap $? 339 'AdminUpdateUserRoleV4' test.out

#- 340 AdminAddUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'qHwAjb22' \
    --body '{"assignedNamespaces": ["PSMjlhHA", "2iRtPCR0", "s2VDQVAR"], "roleId": "U7VhsLxs"}' \
    > test.out 2>&1
eval_tap $? 340 'AdminAddUserRoleV4' test.out

#- 341 AdminRemoveUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRemoveUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'scpVD8te' \
    --body '{"assignedNamespaces": ["YqHl4FKJ", "bHBhG3jj", "o4Sb8OwD"], "roleId": "V4yZnIDn"}' \
    > test.out 2>&1
eval_tap $? 341 'AdminRemoveUserRoleV4' test.out

#- 342 AdminGetRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV4 \
    --adminRole  \
    --isWildcard  \
    --limit '54' \
    --offset '79' \
    > test.out 2>&1
eval_tap $? 342 'AdminGetRolesV4' test.out

#- 343 AdminCreateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV4 \
    --body '{"adminRole": true, "deletable": false, "isWildcard": true, "roleName": "yXzxCFem"}' \
    > test.out 2>&1
eval_tap $? 343 'AdminCreateRoleV4' test.out

#- 344 AdminGetRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV4 \
    --roleId 'ymCQAvrv' \
    > test.out 2>&1
eval_tap $? 344 'AdminGetRoleV4' test.out

#- 345 AdminDeleteRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV4 \
    --roleId 'QipygrjG' \
    > test.out 2>&1
eval_tap $? 345 'AdminDeleteRoleV4' test.out

#- 346 AdminUpdateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV4 \
    --roleId 'hff5Md7U' \
    --body '{"adminRole": false, "deletable": true, "isWildcard": true, "roleName": "uDMUBo2x"}' \
    > test.out 2>&1
eval_tap $? 346 'AdminUpdateRoleV4' test.out

#- 347 AdminUpdateRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV4 \
    --roleId 'TlLEtEAS' \
    --body '{"permissions": [{"action": 90, "resource": "79fqVTea", "schedAction": 22, "schedCron": "eOXPC8EJ", "schedRange": ["04dcZYK7", "V8eK3U7Q", "gQVROcpB"]}, {"action": 16, "resource": "M5iGoyIe", "schedAction": 79, "schedCron": "4kn3XEjO", "schedRange": ["T2Tnnrkr", "SbSzHlNk", "zfgHl9GE"]}, {"action": 71, "resource": "0B5JLYqW", "schedAction": 8, "schedCron": "TPT9R6XM", "schedRange": ["VTfUyhbc", "hyxQmb0h", "MaFHOaxB"]}]}' \
    > test.out 2>&1
eval_tap $? 347 'AdminUpdateRolePermissionsV4' test.out

#- 348 AdminAddRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV4 \
    --roleId 'KD7x1WxV' \
    --body '{"permissions": [{"action": 5, "resource": "nhVkaXOx", "schedAction": 92, "schedCron": "1orgENoh", "schedRange": ["p7yfaxpe", "0G9s87Kq", "oWJyJd7J"]}, {"action": 4, "resource": "JHXlNQqJ", "schedAction": 77, "schedCron": "0pCV4X7L", "schedRange": ["7T6sQMAH", "f9V0BqdB", "dCreICyy"]}, {"action": 30, "resource": "BfGDDfoj", "schedAction": 48, "schedCron": "iOvgD8XB", "schedRange": ["SWnwQA8l", "D6ibtheJ", "uxkF2NrJ"]}]}' \
    > test.out 2>&1
eval_tap $? 348 'AdminAddRolePermissionsV4' test.out

#- 349 AdminDeleteRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV4 \
    --roleId 'TF2VRw63' \
    --body '["EtT0Gvdi", "Cw64iYVq", "8QoOedqu"]' \
    > test.out 2>&1
eval_tap $? 349 'AdminDeleteRolePermissionsV4' test.out

#- 350 AdminListAssignedUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminListAssignedUsersV4 \
    --roleId '68bBgiRi' \
    --after 'wNebHOAd' \
    --before 'lwEBygdn' \
    --limit '3' \
    > test.out 2>&1
eval_tap $? 350 'AdminListAssignedUsersV4' test.out

#- 351 AdminAssignUserToRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAssignUserToRoleV4 \
    --roleId '7s4BdfBd' \
    --body '{"assignedNamespaces": ["ssa3Hml1", "42AEV6Ht", "zkNbYVXQ"], "namespace": "QbEYMBhN", "userId": "RlI57YPa"}' \
    > test.out 2>&1
eval_tap $? 351 'AdminAssignUserToRoleV4' test.out

#- 352 AdminRevokeUserFromRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRevokeUserFromRoleV4 \
    --roleId 'XLobWFKN' \
    --body '{"namespace": "3SRC8ucu", "userId": "u22Slbx7"}' \
    > test.out 2>&1
eval_tap $? 352 'AdminRevokeUserFromRoleV4' test.out

#- 353 AdminInviteUserNewV4
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserNewV4 \
    --body '{"assignedNamespaces": ["XKwvdgde", "KpdUN77d", "vSwH4p4q"], "emailAddresses": ["7NbtHequ", "2Jym3tPv", "iz7G5yMX"], "isAdmin": true, "isNewStudio": false, "languageTag": "6bA5n2hk", "namespace": "Zindh9qd", "roleId": "3JODCyO7"}' \
    > test.out 2>&1
eval_tap $? 353 'AdminInviteUserNewV4' test.out

#- 354 AdminUpdateMyUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateMyUserV4 \
    --body '{"avatarUrl": "R4UueFhF", "country": "SClI5X5n", "dateOfBirth": "rpMa26ox", "displayName": "HvB3FsBd", "languageTag": "rLSsYXdM", "skipLoginQueue": false, "uniqueDisplayName": "moeS20wL", "userName": "eZBoQgHr"}' \
    > test.out 2>&1
eval_tap $? 354 'AdminUpdateMyUserV4' test.out

#- 355 AdminDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyAuthenticatorV4 \
    --body '{"mfaToken": "Qru4VcAZ"}' \
    > test.out 2>&1
eval_tap $? 355 'AdminDisableMyAuthenticatorV4' test.out

#- 356 AdminEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyAuthenticatorV4 \
    --code '8mahSpLH' \
    > test.out 2>&1
eval_tap $? 356 'AdminEnableMyAuthenticatorV4' test.out

#- 357 AdminGenerateMyAuthenticatorKeyV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateMyAuthenticatorKeyV4 \
    > test.out 2>&1
eval_tap $? 357 'AdminGenerateMyAuthenticatorKeyV4' test.out

#- 358 AdminGetMyBackupCodesV4
eval_tap 0 358 'AdminGetMyBackupCodesV4 # SKIP deprecated' test.out

#- 359 AdminGenerateMyBackupCodesV4
eval_tap 0 359 'AdminGenerateMyBackupCodesV4 # SKIP deprecated' test.out

#- 360 AdminDisableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyBackupCodesV4 \
    --body '{"mfaToken": "VAUjsLDX"}' \
    > test.out 2>&1
eval_tap $? 360 'AdminDisableMyBackupCodesV4' test.out

#- 361 AdminDownloadMyBackupCodesV4
eval_tap 0 361 'AdminDownloadMyBackupCodesV4 # SKIP deprecated' test.out

#- 362 AdminEnableMyBackupCodesV4
eval_tap 0 362 'AdminEnableMyBackupCodesV4 # SKIP deprecated' test.out

#- 363 AdminGetBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBackupCodesV4 \
    --languageTag 'SGD7c5ld' \
    > test.out 2>&1
eval_tap $? 363 'AdminGetBackupCodesV4' test.out

#- 364 AdminGenerateBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateBackupCodesV4 \
    --languageTag 'nDMkmV87' \
    > test.out 2>&1
eval_tap $? 364 'AdminGenerateBackupCodesV4' test.out

#- 365 AdminEnableBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableBackupCodesV4 \
    --languageTag '7sklVxAl' \
    > test.out 2>&1
eval_tap $? 365 'AdminEnableBackupCodesV4' test.out

#- 366 AdminChallengeMyMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminChallengeMyMFAV4 \
    --code 'SqxuBV2S' \
    --factor 'RSZGz4a2' \
    > test.out 2>&1
eval_tap $? 366 'AdminChallengeMyMFAV4' test.out

#- 367 AdminSendMyMFAEmailCodeV4
./ng net.accelbyte.sdk.cli.Main iam adminSendMyMFAEmailCodeV4 \
    --action 'MVprSmLb' \
    --languageTag 'WY04QRmZ' \
    > test.out 2>&1
eval_tap $? 367 'AdminSendMyMFAEmailCodeV4' test.out

#- 368 AdminDisableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyEmailV4 \
    --body '{"mfaToken": "bIVGwOp9"}' \
    > test.out 2>&1
eval_tap $? 368 'AdminDisableMyEmailV4' test.out

#- 369 AdminEnableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyEmailV4 \
    --code 'MFOyERqz' \
    > test.out 2>&1
eval_tap $? 369 'AdminEnableMyEmailV4' test.out

#- 370 AdminGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyEnabledFactorsV4 \
    > test.out 2>&1
eval_tap $? 370 'AdminGetMyEnabledFactorsV4' test.out

#- 371 AdminMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam adminMakeFactorMyDefaultV4 \
    --factor '5SVKGSqY' \
    > test.out 2>&1
eval_tap $? 371 'AdminMakeFactorMyDefaultV4' test.out

#- 372 AdminGetMyOwnMFAStatusV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyOwnMFAStatusV4 \
    > test.out 2>&1
eval_tap $? 372 'AdminGetMyOwnMFAStatusV4' test.out

#- 373 AdminGetMyMFAStatusV4
eval_tap 0 373 'AdminGetMyMFAStatusV4 # SKIP deprecated' test.out

#- 374 AdminInviteUserV4
eval_tap 0 374 'AdminInviteUserV4 # SKIP deprecated' test.out

#- 375 AuthenticationWithPlatformLinkV4
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV4 \
    --extendExp  \
    --clientId 'LhrKIt1Z' \
    --linkingToken 'jzJGcFFL' \
    --password 'NTi2cJJJ' \
    --username 'lZIzF89J' \
    > test.out 2>&1
eval_tap $? 375 'AuthenticationWithPlatformLinkV4' test.out

#- 376 GenerateTokenByNewHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV4 \
    --additionalData 'wGbtALKu' \
    --extendExp  \
    --linkingToken 'WHJwk58C' \
    > test.out 2>&1
eval_tap $? 376 'GenerateTokenByNewHeadlessAccountV4' test.out

#- 377 Verify2faCodeV4
./ng net.accelbyte.sdk.cli.Main iam verify2faCodeV4 \
    --code 'Xq35O4CL' \
    --factor 'EOfqFcYV' \
    --mfaToken 'NNMcxMua' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 377 'Verify2faCodeV4' test.out

#- 378 PlatformTokenGrantV4
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV4 \
    --platformId '4YdNPbhe' \
    --codeChallenge 'CgQl1pze' \
    --codeChallengeMethod 'plain' \
    --additionalData 'lIwTrc3S' \
    --clientId '4ZxhtsZ9' \
    --createHeadless  \
    --deviceId 'xAm2VtGY' \
    --macAddress 'VhVfjvFC' \
    --platformToken 'ZETt7K62' \
    --serviceLabel '0.8370119046184268' \
    --skipSetCookie  \
    > test.out 2>&1
eval_tap $? 378 'PlatformTokenGrantV4' test.out

#- 379 SimultaneousLoginV4
./ng net.accelbyte.sdk.cli.Main iam simultaneousLoginV4 \
    --codeChallenge 'gGP52wC9' \
    --codeChallengeMethod 'plain' \
    --simultaneousPlatform 'dIaL5S7J' \
    --simultaneousTicket 'MJ7ys8hf' \
    --nativePlatform 'steam' \
    --nativePlatformTicket 'KhGH7z5s' \
    > test.out 2>&1
eval_tap $? 379 'SimultaneousLoginV4' test.out

#- 380 TokenGrantV4
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV4 \
    --codeChallenge 'NZq2GCup' \
    --codeChallengeMethod 'S256' \
    --additionalData 'miD7ITqD' \
    --clientId 'n4dsAzwu' \
    --clientSecret 'xjk4H8gT' \
    --code 'R0ElcmnT' \
    --codeVerifier 'RyIGPrBc' \
    --extendNamespace 'EnPCOdrR' \
    --extendExp  \
    --loginQueueTicket 'YZIuaZ95' \
    --password 'lXa1Wh1j' \
    --redirectUri 'g7OVZoLI' \
    --refreshToken 'IrQsbjKo' \
    --username 'uPgUnGn2' \
    --grantType 'client_credentials' \
    > test.out 2>&1
eval_tap $? 380 'TokenGrantV4' test.out

#- 381 RequestTargetTokenResponseV4
./ng net.accelbyte.sdk.cli.Main iam requestTargetTokenResponseV4 \
    --additionalData 'xPCiLpVs' \
    --code '0w3ddoF7' \
    > test.out 2>&1
eval_tap $? 381 'RequestTargetTokenResponseV4' test.out

#- 382 PublicListUserIDByPlatformUserIDsV4
./ng net.accelbyte.sdk.cli.Main iam publicListUserIDByPlatformUserIDsV4 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'OTcIdUSH' \
    --rawPUID  \
    --body '{"platformUserIds": ["OLLMJOXg", "qkv0ORYN", "nXqvvdH9"]}' \
    > test.out 2>&1
eval_tap $? 382 'PublicListUserIDByPlatformUserIDsV4' test.out

#- 383 PublicCreateTestUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateTestUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "63VpHGZY", "policyId": "iMGQCfgu", "policyVersionId": "1KUWpP8j"}, {"isAccepted": true, "localizedPolicyVersionId": "FPuoT3zR", "policyId": "VhhK0VO6", "policyVersionId": "1EN7sHRp"}, {"isAccepted": true, "localizedPolicyVersionId": "ETp0OBZH", "policyId": "8gaBmk7j", "policyVersionId": "rMWbGecy"}], "authType": "EMAILPASSWD", "country": "iOWTi2UT", "dateOfBirth": "oKAHqfYO", "displayName": "9nhhrx1n", "emailAddress": "gYHdC4ih", "password": "WBDOJcRZ", "passwordMD5Sum": "zuqjCaeT", "uniqueDisplayName": "YC6sBtsi", "username": "QPQto1KJ", "verified": true}' \
    > test.out 2>&1
eval_tap $? 383 'PublicCreateTestUserV4' test.out

#- 384 PublicCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "PXRGBQrz", "policyId": "nNVQr4Rr", "policyVersionId": "nadeU8Gb"}, {"isAccepted": true, "localizedPolicyVersionId": "8FSrniB9", "policyId": "Mq8v9Bke", "policyVersionId": "9BptLUAy"}, {"isAccepted": false, "localizedPolicyVersionId": "NxJVFv6l", "policyId": "Y61tEfe9", "policyVersionId": "Ry2pleSI"}], "authType": "EMAILPASSWD", "code": "OmXxetyn", "country": "Vgn4at8T", "dateOfBirth": "jIkLR2mB", "displayName": "HF9tqgaw", "emailAddress": "M2UDcVZp", "password": "cJZvwFIy", "passwordMD5Sum": "lHnhBD8B", "reachMinimumAge": false, "uniqueDisplayName": "oEBI41dY", "username": "SY3Fkp8l"}' \
    > test.out 2>&1
eval_tap $? 384 'PublicCreateUserV4' test.out

#- 385 CreateUserFromInvitationV4
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV4 \
    --invitationId 'F0bZFRS8' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "PNtDAVzm", "policyId": "oXy0gfHL", "policyVersionId": "BHWv7avS"}, {"isAccepted": false, "localizedPolicyVersionId": "D9eqzwE6", "policyId": "xMtzREtm", "policyVersionId": "tBEZXLm7"}, {"isAccepted": false, "localizedPolicyVersionId": "leFPpOxx", "policyId": "Mw865tEH", "policyVersionId": "kUF8KAAa"}], "authType": "EMAILPASSWD", "code": "h29oozmb", "country": "F6QpDH8d", "dateOfBirth": "YtIhoQeW", "displayName": "tePF6zCI", "emailAddress": "I0zJWhzd", "password": "cWfGOo02", "passwordMD5Sum": "F6uX2ijn", "reachMinimumAge": true, "uniqueDisplayName": "CuZXS4r1", "username": "akdx6eA4"}' \
    > test.out 2>&1
eval_tap $? 385 'CreateUserFromInvitationV4' test.out

#- 386 PublicUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "WgRYntc5", "country": "GaHG1AGK", "dateOfBirth": "zfnnwfhb", "displayName": "kRqhMxv1", "languageTag": "efmAnncJ", "uniqueDisplayName": "uhIJdydB", "userName": "3WPBcE7B"}' \
    > test.out 2>&1
eval_tap $? 386 'PublicUpdateUserV4' test.out

#- 387 PublicUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "smmFD5OS", "emailAddress": "kn06AwWw"}' \
    > test.out 2>&1
eval_tap $? 387 'PublicUpdateUserEmailAddressV4' test.out

#- 388 PublicUpgradeHeadlessAccountWithVerificationCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountWithVerificationCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "kJ9m95zb", "country": "mqgo4UYM", "dateOfBirth": "nUVg3Nht", "displayName": "kX6BqqBr", "emailAddress": "VleRrvGz", "password": "dPxYsxMA", "reachMinimumAge": false, "uniqueDisplayName": "FMW4wvKQ", "username": "4LaCDlFA", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 388 'PublicUpgradeHeadlessAccountWithVerificationCodeV4' test.out

#- 389 PublicUpgradeHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "5KldUdp0", "password": "bTfV6fex", "username": "ilftJ61q"}' \
    > test.out 2>&1
eval_tap $? 389 'PublicUpgradeHeadlessAccountV4' test.out

#- 390 PublicDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"mfaToken": "DwAYPTHH"}' \
    > test.out 2>&1
eval_tap $? 390 'PublicDisableMyAuthenticatorV4' test.out

#- 391 PublicEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'tLLRtsR6' \
    > test.out 2>&1
eval_tap $? 391 'PublicEnableMyAuthenticatorV4' test.out

#- 392 PublicGenerateMyAuthenticatorKeyV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateMyAuthenticatorKeyV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 392 'PublicGenerateMyAuthenticatorKeyV4' test.out

#- 393 PublicGetMyBackupCodesV4
eval_tap 0 393 'PublicGetMyBackupCodesV4 # SKIP deprecated' test.out

#- 394 PublicGenerateMyBackupCodesV4
eval_tap 0 394 'PublicGenerateMyBackupCodesV4 # SKIP deprecated' test.out

#- 395 PublicDisableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"mfaToken": "PQ1ocYTC"}' \
    > test.out 2>&1
eval_tap $? 395 'PublicDisableMyBackupCodesV4' test.out

#- 396 PublicDownloadMyBackupCodesV4
eval_tap 0 396 'PublicDownloadMyBackupCodesV4 # SKIP deprecated' test.out

#- 397 PublicEnableMyBackupCodesV4
eval_tap 0 397 'PublicEnableMyBackupCodesV4 # SKIP deprecated' test.out

#- 398 PublicGetBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGetBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --languageTag 'nA3WY4lO' \
    > test.out 2>&1
eval_tap $? 398 'PublicGetBackupCodesV4' test.out

#- 399 PublicGenerateBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --languageTag 'ar257kfW' \
    > test.out 2>&1
eval_tap $? 399 'PublicGenerateBackupCodesV4' test.out

#- 400 PublicEnableBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --languageTag 'pRuhkRYN' \
    > test.out 2>&1
eval_tap $? 400 'PublicEnableBackupCodesV4' test.out

#- 401 PublicChallengeMyMFAV4
./ng net.accelbyte.sdk.cli.Main iam publicChallengeMyMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'qaIBHdAb' \
    --factor 'lpuhw2Py' \
    > test.out 2>&1
eval_tap $? 401 'PublicChallengeMyMFAV4' test.out

#- 402 PublicRemoveTrustedDeviceV4
./ng net.accelbyte.sdk.cli.Main iam publicRemoveTrustedDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceToken 'aJnSDYhw' \
    > test.out 2>&1
eval_tap $? 402 'PublicRemoveTrustedDeviceV4' test.out

#- 403 PublicSendMyMFAEmailCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicSendMyMFAEmailCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --action '1rVd7VK5' \
    --languageTag 'l5Q5GPYz' \
    > test.out 2>&1
eval_tap $? 403 'PublicSendMyMFAEmailCodeV4' test.out

#- 404 PublicDisableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyEmailV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"mfaToken": "JPHsYVi3"}' \
    > test.out 2>&1
eval_tap $? 404 'PublicDisableMyEmailV4' test.out

#- 405 PublicEnableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyEmailV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'wpRka3FV' \
    > test.out 2>&1
eval_tap $? 405 'PublicEnableMyEmailV4' test.out

#- 406 PublicGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam publicGetMyEnabledFactorsV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 406 'PublicGetMyEnabledFactorsV4' test.out

#- 407 PublicMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam publicMakeFactorMyDefaultV4 \
    --namespace "$AB_NAMESPACE" \
    --factor '8pd6nw8K' \
    > test.out 2>&1
eval_tap $? 407 'PublicMakeFactorMyDefaultV4' test.out

#- 408 PublicGetMyOwnMFAStatusV4
./ng net.accelbyte.sdk.cli.Main iam publicGetMyOwnMFAStatusV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 408 'PublicGetMyOwnMFAStatusV4' test.out

#- 409 PublicGetMyMFAStatusV4
eval_tap 0 409 'PublicGetMyMFAStatusV4 # SKIP deprecated' test.out

#- 410 PublicGetUserPublicInfoByUserIdV4
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPublicInfoByUserIdV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'L23yNxZ2' \
    > test.out 2>&1
eval_tap $? 410 'PublicGetUserPublicInfoByUserIdV4' test.out

#- 411 PublicInviteUserV4
./ng net.accelbyte.sdk.cli.Main iam publicInviteUserV4 \
    --body '{"additionalData": "accwsGxL", "emailAddress": "LFadkdiK", "languageTag": "4b5QX2O3", "namespace": "lzOg8v84", "namespaceDisplayName": "hHC21f4g"}' \
    > test.out 2>&1
eval_tap $? 411 'PublicInviteUserV4' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
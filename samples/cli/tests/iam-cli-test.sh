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
echo "1..428"

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
    --body '{"modules": [{"docLink": "wZp30DDE", "groups": [{"group": "SIZhKFxv", "groupId": "dD7AiBeo", "permissions": [{"allowedActions": [84, 10, 33], "resource": "fnEYgrab"}, {"allowedActions": [80, 16, 47], "resource": "tEBipARu"}, {"allowedActions": [84, 41, 80], "resource": "SbsHQpW3"}]}, {"group": "gQ2AtKI3", "groupId": "BeAi1woM", "permissions": [{"allowedActions": [53, 0, 64], "resource": "ikVBPS9B"}, {"allowedActions": [79, 44, 70], "resource": "u6VntsaF"}, {"allowedActions": [59, 89, 80], "resource": "ohK6rblH"}]}, {"group": "NqbB9DKI", "groupId": "qMOwdnxL", "permissions": [{"allowedActions": [78, 49, 40], "resource": "F274FMzX"}, {"allowedActions": [94, 19, 74], "resource": "b3T0kEu4"}, {"allowedActions": [92, 59, 97], "resource": "HM7R0YNS"}]}], "module": "eB5gVkFU", "moduleId": "tJMJlRr5"}, {"docLink": "uxPFn6jY", "groups": [{"group": "cifOy8lt", "groupId": "R3ESaEfq", "permissions": [{"allowedActions": [66, 95, 43], "resource": "kytd3rr8"}, {"allowedActions": [18, 87, 70], "resource": "mX0pg7WL"}, {"allowedActions": [35, 59, 47], "resource": "2ZD9wiiq"}]}, {"group": "geLjPkIh", "groupId": "iR3NWxgQ", "permissions": [{"allowedActions": [21, 33, 48], "resource": "WuznHQfM"}, {"allowedActions": [85, 10, 71], "resource": "TH6wzsQm"}, {"allowedActions": [72, 10, 21], "resource": "zGqaYB52"}]}, {"group": "gsgUx8Ai", "groupId": "Cve8NZ7E", "permissions": [{"allowedActions": [76, 87, 37], "resource": "0SneJ0Ot"}, {"allowedActions": [38, 24, 71], "resource": "L27yCsmF"}, {"allowedActions": [8, 57, 41], "resource": "1KvIKsk0"}]}], "module": "6B6v3Z1G", "moduleId": "mudLMb8B"}, {"docLink": "RkW4cScy", "groups": [{"group": "EjK7Vcwo", "groupId": "H6RNQ7z0", "permissions": [{"allowedActions": [2, 63, 76], "resource": "Ax3mnERb"}, {"allowedActions": [83, 41, 25], "resource": "y22uylkk"}, {"allowedActions": [98, 32, 91], "resource": "LnPfZ3pL"}]}, {"group": "ZqxsuE7J", "groupId": "lee6fvSq", "permissions": [{"allowedActions": [62, 15, 0], "resource": "R6R0jpUB"}, {"allowedActions": [81, 45, 15], "resource": "9Alxoc3k"}, {"allowedActions": [54, 69, 18], "resource": "dYJb8xXI"}]}, {"group": "aPtG1udT", "groupId": "tv75DzVT", "permissions": [{"allowedActions": [65, 92, 1], "resource": "lZNmACHe"}, {"allowedActions": [37, 12, 34], "resource": "SewEKChe"}, {"allowedActions": [26, 97, 12], "resource": "VigHKwmg"}]}], "module": "ovAm34Nz", "moduleId": "LenpswO3"}]}' \
    > test.out 2>&1
eval_tap $? 109 'AdminUpdateAvailablePermissionsByModule' test.out

#- 110 AdminDeleteConfigPermissionsByGroup
./ng net.accelbyte.sdk.cli.Main iam adminDeleteConfigPermissionsByGroup \
    --forceDelete  \
    --body '{"groupId": "INDP0Q45", "moduleId": "E35PWhF7"}' \
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
    --body '[{"field": "S1YdQ2yF", "validation": {"allowAllSpecialCharacters": false, "allowDigit": true, "allowLetter": false, "allowSpace": true, "allowUnicode": false, "avatarConfig": {"allowedPrefixes": ["5L86Aduo", "ZXpJWr4p", "zRHf326M"], "preferRegex": false, "regex": "N0LglrYP"}, "blockedWord": ["WVgzioE6", "GQae4GLZ", "GHc5zMlh"], "description": [{"language": "NsrDMMlq", "message": ["Lhp7dDpR", "UPljeEjR", "KxoI1BfN"]}, {"language": "l9mrtA4H", "message": ["2KgqbQkc", "EaJxkkv7", "yxHabd8e"]}, {"language": "szF8cj6A", "message": ["lNGTDf0K", "xFaEOEvq", "kxriBbLc"]}], "isCustomRegex": true, "letterCase": "NmFhZqVf", "maxLength": 49, "maxRepeatingAlphaNum": 95, "maxRepeatingSpecialCharacter": 2, "minCharType": 28, "minLength": 12, "profanityFilter": "7Ynv9M4F", "regex": "vrI0TpME", "specialCharacterLocation": "BSqRn5RI", "specialCharacters": ["YreleAPY", "hqVrA8ti", "mvVUa0Mj"]}}, {"field": "VdlEvvLX", "validation": {"allowAllSpecialCharacters": true, "allowDigit": false, "allowLetter": true, "allowSpace": false, "allowUnicode": false, "avatarConfig": {"allowedPrefixes": ["oZDamWfF", "67ILqEkA", "4oPjdljo"], "preferRegex": true, "regex": "HyZ786aS"}, "blockedWord": ["5RMOJld5", "d4VJQ21w", "auRuEWxa"], "description": [{"language": "5DokIVze", "message": ["TbfrSLuQ", "9sGxrjCg", "bwYwFWYC"]}, {"language": "tv1NTs8b", "message": ["52oIA60r", "xgDWU2xj", "19ESgDx0"]}, {"language": "slCY8fHx", "message": ["RaC33tJH", "dEvBXe4R", "JTFELyaT"]}], "isCustomRegex": false, "letterCase": "If9TF5kZ", "maxLength": 28, "maxRepeatingAlphaNum": 6, "maxRepeatingSpecialCharacter": 96, "minCharType": 86, "minLength": 78, "profanityFilter": "8gjsP04E", "regex": "DzYFyrTf", "specialCharacterLocation": "5nEysbEU", "specialCharacters": ["wsEYml7T", "Bv3mXebm", "HaVLlJee"]}}, {"field": "3dvtfBsm", "validation": {"allowAllSpecialCharacters": true, "allowDigit": false, "allowLetter": false, "allowSpace": true, "allowUnicode": false, "avatarConfig": {"allowedPrefixes": ["74YdcWPV", "mRKbRxez", "F48JgU1e"], "preferRegex": false, "regex": "8gIwCXbO"}, "blockedWord": ["ieu4zwuh", "36Q1xueh", "03kwD9j6"], "description": [{"language": "leOk5b7k", "message": ["gZvctbFQ", "8vN1wMYR", "eRSMZMpJ"]}, {"language": "kYWjI0JU", "message": ["LHVxYqoi", "StvOutqt", "GxI8R8TM"]}, {"language": "ahYlfgdu", "message": ["meg4Nq1d", "u95D9Jdc", "ltBdJ3cs"]}], "isCustomRegex": true, "letterCase": "tuqpnLHW", "maxLength": 90, "maxRepeatingAlphaNum": 47, "maxRepeatingSpecialCharacter": 100, "minCharType": 71, "minLength": 95, "profanityFilter": "kKIaHVyH", "regex": "6xKViokE", "specialCharacterLocation": "hUH5sBEU", "specialCharacters": ["dH81DxKm", "KMB0dCKF", "ft0AJWZh"]}}]' \
    > test.out 2>&1
eval_tap $? 113 'AdminUpdateInputValidations' test.out

#- 114 AdminResetInputValidations
./ng net.accelbyte.sdk.cli.Main iam adminResetInputValidations \
    --field 'LlJCMBBI' \
    > test.out 2>&1
eval_tap $? 114 'AdminResetInputValidations' test.out

#- 115 ListAdminsV3
./ng net.accelbyte.sdk.cli.Main iam listAdminsV3 \
    --namespace "$AB_NAMESPACE" \
    --after '028eBM5n' \
    --before 'sSdJpAOP' \
    --endDate 'xspBFl1f' \
    --limit '43' \
    --query 'r0wFeLnN' \
    --roleId 'k7qACZbT' \
    --startDate 'Bl0xHyqM' \
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
    --body '{"ageRestriction": 21, "enable": true}' \
    > test.out 2>&1
eval_tap $? 117 'AdminUpdateAgeRestrictionConfigV3' test.out

#- 118 AdminGetListCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminGetListCountryAgeRestrictionV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 118 'AdminGetListCountryAgeRestrictionV3' test.out

#- 119 AdminUpdateCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateCountryAgeRestrictionV3 \
    --countryCode 'nvfsQfAp' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ageRestriction": 74}' \
    > test.out 2>&1
eval_tap $? 119 'AdminUpdateCountryAgeRestrictionV3' test.out

#- 120 AdminGetBannedUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType 'aV5MjJpO' \
    --limit '0' \
    --offset '58' \
    > test.out 2>&1
eval_tap $? 120 'AdminGetBannedUsersV3' test.out

#- 121 AdminBanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"ban": "SbqGoyX8", "comment": "QEuwWcYV", "endDate": "0Ib8SMNI", "reason": "DHXotqol", "skipNotif": true, "userIds": ["1J0M3bg6", "oejZaQy8", "mYwsMnht"]}' \
    > test.out 2>&1
eval_tap $? 121 'AdminBanUserBulkV3' test.out

#- 122 AdminUnbanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminUnbanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"bans": [{"banId": "25eg8N42", "userId": "dBwjlKUh"}, {"banId": "gZtJV0hj", "userId": "qs6DwvnU"}, {"banId": "7Pc42QBe", "userId": "yXfyHZ0D"}]}' \
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
    --clientId 'JM3rvawF' \
    --clientName 'MWnnt9Fi' \
    --clientType '1OCinAiM' \
    --limit '64' \
    --offset '81' \
    --skipLoginQueue  \
    > test.out 2>&1
eval_tap $? 124 'AdminGetClientsByNamespaceV3' test.out

#- 125 AdminBulkUpdateClientsV3
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateClientsV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientIds": ["ZG32kLue", "TABgFeLO", "bGz4g0vg"], "clientUpdateRequest": {"audiences": ["cEDri8iI", "vfRGJ9if", "nPFukzec"], "baseUri": "W1YgMaeo", "clientName": "jIEwLEIn", "clientPermissions": [{"action": 79, "resource": "baCrB6Pd", "schedAction": 62, "schedCron": "vqnClZ2d", "schedRange": ["NRyz8HES", "CMk1rZWS", "iBPSjLbB"]}, {"action": 59, "resource": "gQMe2FHT", "schedAction": 71, "schedCron": "SERLwitb", "schedRange": ["KsL1omgx", "j1ceo3tp", "PtaAU7aO"]}, {"action": 13, "resource": "qJBeUx2L", "schedAction": 40, "schedCron": "AZncbzPI", "schedRange": ["spfemxbe", "moWZvK1O", "Rpkx2MSq"]}], "clientPlatform": "JHI7OtgK", "deletable": true, "description": "y6lBYBlb", "modulePermissions": [{"moduleId": "tXWJX66f", "selectedGroups": [{"groupId": "Lhp9G0FE", "selectedActions": [76, 92, 56]}, {"groupId": "zv8jfXZd", "selectedActions": [49, 27, 74]}, {"groupId": "7SqwGDV0", "selectedActions": [29, 55, 41]}]}, {"moduleId": "1DM8ewTU", "selectedGroups": [{"groupId": "gkOYDPlE", "selectedActions": [91, 38, 59]}, {"groupId": "q9Y1D4rp", "selectedActions": [55, 31, 59]}, {"groupId": "XHPidQCS", "selectedActions": [55, 49, 93]}]}, {"moduleId": "AbGTf80G", "selectedGroups": [{"groupId": "Ifj2LRLB", "selectedActions": [22, 32, 12]}, {"groupId": "A38tydmb", "selectedActions": [97, 25, 27]}, {"groupId": "vLYGFvmx", "selectedActions": [60, 40, 81]}]}], "namespace": "O62KLuVM", "oauthAccessTokenExpiration": 28, "oauthAccessTokenExpirationTimeUnit": "g0zpgpiW", "oauthRefreshTokenExpiration": 40, "oauthRefreshTokenExpirationTimeUnit": "emdcvSKm", "redirectUri": "8vXt5mM2", "scopes": ["So11H5a1", "sjNhZcBt", "kgtgKGC3"], "skipLoginQueue": true, "twoFactorEnabled": true}}' \
    > test.out 2>&1
eval_tap $? 125 'AdminBulkUpdateClientsV3' test.out

#- 126 AdminCreateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateClientV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["32YYVhVT", "gAdQISTT", "X7xyy52m"], "baseUri": "tffJ2481", "clientId": "B8IyZvOc", "clientName": "OH12CkLI", "clientPermissions": [{"action": 80, "resource": "tEDg2MoM", "schedAction": 83, "schedCron": "DtqBMHYm", "schedRange": ["qtkiFMZM", "X4VfKBmL", "M1aqp6Vc"]}, {"action": 100, "resource": "l3Ks6Wpv", "schedAction": 61, "schedCron": "FOm62oyd", "schedRange": ["KIHTQYM0", "G6Mlbv5P", "q0vgeVWa"]}, {"action": 57, "resource": "yEFUOBhM", "schedAction": 23, "schedCron": "xAFzD609", "schedRange": ["gYIZ8FVY", "yCCmxHE7", "hRxQIyvt"]}], "clientPlatform": "N2DQ7yE7", "deletable": false, "description": "uwMDk3dA", "modulePermissions": [{"moduleId": "6I5TWJ2U", "selectedGroups": [{"groupId": "K9GojSa4", "selectedActions": [10, 60, 37]}, {"groupId": "K4Zv67N8", "selectedActions": [45, 19, 8]}, {"groupId": "8SEnN7hq", "selectedActions": [12, 88, 43]}]}, {"moduleId": "Lsg1F5Ta", "selectedGroups": [{"groupId": "5QzZZIWA", "selectedActions": [54, 77, 6]}, {"groupId": "vdaNDhGX", "selectedActions": [74, 42, 100]}, {"groupId": "AOLC3g6g", "selectedActions": [47, 58, 96]}]}, {"moduleId": "2ABwNfIY", "selectedGroups": [{"groupId": "GVUByN18", "selectedActions": [57, 66, 22]}, {"groupId": "65uMxY6T", "selectedActions": [87, 69, 64]}, {"groupId": "sI0OiTWd", "selectedActions": [27, 89, 8]}]}], "namespace": "iSWoX6E7", "oauthAccessTokenExpiration": 22, "oauthAccessTokenExpirationTimeUnit": "NE0PWifQ", "oauthClientType": "DdWKu2zB", "oauthRefreshTokenExpiration": 91, "oauthRefreshTokenExpirationTimeUnit": "CwKSoMjW", "parentNamespace": "EG9lKyie", "redirectUri": "tfxdbvEr", "scopes": ["eRlRHkmf", "5hJCziOk", "BZMjrEja"], "secret": "6g21WwPC", "skipLoginQueue": true, "twoFactorEnabled": false}' \
    > test.out 2>&1
eval_tap $? 126 'AdminCreateClientV3' test.out

#- 127 AdminGetClientsbyNamespacebyIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetClientsbyNamespacebyIDV3 \
    --clientId 'vCBTtj9S' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 127 'AdminGetClientsbyNamespacebyIDV3' test.out

#- 128 AdminDeleteClientV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientV3 \
    --clientId 'CT2M6wp6' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 128 'AdminDeleteClientV3' test.out

#- 129 AdminUpdateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientV3 \
    --clientId '70a8vh4n' \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["mosGniEi", "9JiRxeSl", "AlFnuelt"], "baseUri": "aupPOoW5", "clientName": "C6KSenhK", "clientPermissions": [{"action": 20, "resource": "Cqw63SEj", "schedAction": 94, "schedCron": "FsXpUEhO", "schedRange": ["NaqUPIQR", "NIaBgzxZ", "ZWS6pcm1"]}, {"action": 39, "resource": "6q4dfjAr", "schedAction": 7, "schedCron": "F9qRDGwt", "schedRange": ["UoaKVX4y", "8UaK9fdq", "wHguinBq"]}, {"action": 82, "resource": "8xtKOCfk", "schedAction": 55, "schedCron": "oGz6yCDd", "schedRange": ["aL3jGigh", "RL04ttdE", "vabfb96l"]}], "clientPlatform": "1BX01Jw1", "deletable": true, "description": "7fItvk1Z", "modulePermissions": [{"moduleId": "jJ3OTVb8", "selectedGroups": [{"groupId": "ICY1giGh", "selectedActions": [4, 59, 16]}, {"groupId": "ChWK6yWB", "selectedActions": [9, 29, 39]}, {"groupId": "mVk11aZH", "selectedActions": [61, 48, 21]}]}, {"moduleId": "0TefSnzc", "selectedGroups": [{"groupId": "qdFFL0MX", "selectedActions": [76, 94, 99]}, {"groupId": "rtrFR3Ep", "selectedActions": [58, 45, 87]}, {"groupId": "ZjF3YAtK", "selectedActions": [44, 16, 58]}]}, {"moduleId": "7WY4k4HR", "selectedGroups": [{"groupId": "TxZnG6Km", "selectedActions": [56, 50, 2]}, {"groupId": "7DO1aXjF", "selectedActions": [34, 29, 87]}, {"groupId": "S1H8wCZH", "selectedActions": [97, 72, 45]}]}], "namespace": "rx3tr3ur", "oauthAccessTokenExpiration": 100, "oauthAccessTokenExpirationTimeUnit": "xT9qlDaD", "oauthRefreshTokenExpiration": 48, "oauthRefreshTokenExpirationTimeUnit": "XixV6Nni", "redirectUri": "XYYeu4jv", "scopes": ["bo7eUnNd", "gTwSTqup", "FlyMcvoX"], "skipLoginQueue": false, "twoFactorEnabled": true}' \
    > test.out 2>&1
eval_tap $? 129 'AdminUpdateClientV3' test.out

#- 130 AdminUpdateClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientPermissionV3 \
    --clientId 'zP9ByzrV' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 66, "resource": "sKK3wEMT"}, {"action": 4, "resource": "jGXZ7uu3"}, {"action": 78, "resource": "RAkMpoEc"}]}' \
    > test.out 2>&1
eval_tap $? 130 'AdminUpdateClientPermissionV3' test.out

#- 131 AdminAddClientPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddClientPermissionsV3 \
    --clientId 'P7CliMWF' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 37, "resource": "OR7p8u17"}, {"action": 76, "resource": "6Avb7JZf"}, {"action": 93, "resource": "mLKxxNnO"}]}' \
    > test.out 2>&1
eval_tap $? 131 'AdminAddClientPermissionsV3' test.out

#- 132 AdminDeleteClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientPermissionV3 \
    --action '6' \
    --clientId 'b7Ag7GR8' \
    --namespace "$AB_NAMESPACE" \
    --resource 'EZtVUY3p' \
    > test.out 2>&1
eval_tap $? 132 'AdminDeleteClientPermissionV3' test.out

#- 133 AdminGetConfigValueV3
./ng net.accelbyte.sdk.cli.Main iam adminGetConfigValueV3 \
    --configKey 'rw4QdvYo' \
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
    --body '{"blacklist": ["csyYyFzI", "FBHTUrCc", "0mjxs6yW"]}' \
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
    --body '{"active": true, "roleIds": ["ae3FJecb", "7ab9u7vR", "syTWjOX8"]}' \
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
    --limit '84' \
    --offset '87' \
    > test.out 2>&1
eval_tap $? 141 'RetrieveAllSSOLoginPlatformCredentialV3' test.out

#- 142 RetrieveThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'mIgDb76V' \
    > test.out 2>&1
eval_tap $? 142 'RetrieveThirdPartyLoginPlatformCredentialV3' test.out

#- 143 AddThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam addThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'FhBu16iC' \
    --body '{"ACSURL": "J85QKhUQ", "AWSCognitoRegion": "usHZ0qIB", "AWSCognitoUserPool": "pVUAdrza", "AllowedClients": ["HqH9z8lp", "hMakykwr", "tbs4gHMD"], "AppId": "xkWX4ugu", "AuthorizationEndpoint": "Rh0W6Di0", "ClientId": "pq3CDW4R", "EmptyStrFieldList": ["aEUvXfRh", "vqOM1OFA", "7qIasjeL"], "EnableServerLicenseValidation": true, "Environment": "C5swNX38", "FederationMetadataURL": "JkuJydRL", "GenericOauthFlow": true, "IncludePUID": true, "IsActive": false, "Issuer": "3VXD3pgq", "JWKSEndpoint": "oQhFqgjz", "KeyID": "Gtn2mFM5", "LogoURL": "WPnUZKL8", "NetflixCertificates": {"encryptedPrivateKey": "9vUzzkmR", "encryptedPrivateKeyName": "kaxVTPOt", "publicCertificate": "fcaGHA4s", "publicCertificateName": "cwrHNKLw", "rootCertificate": "QTKIvSrr", "rootCertificateName": "vT0hotqi"}, "OrganizationId": "ELElpU7x", "PlatformName": "rU6NYRKn", "RedirectUri": "mRCI6ENE", "RegisteredDomains": [{"affectedClientIDs": ["DPlkcffn", "tV51laKA", "FMvsUUb5"], "domain": "mJl5bBBy", "namespaces": ["ZILd4ILc", "ELbTOYgP", "qTQm8yiU"], "roleId": "ybov09Hk", "ssoCfg": {"googleKey": {"ldjN0e5F": {}, "paAcseLc": {}, "jRZ7pUwc": {}}, "groupConfigs": [{"assignNamespaces": ["ALhGzPQ3", "7m9W7mth", "MT08ao9T"], "group": "1iFRKLsj", "roleId": "IvYWyBnQ"}, {"assignNamespaces": ["UGpnzyUZ", "K0Deiix2", "Y4iu3lbP"], "group": "tRWW68sa", "roleId": "qUa7auSv"}, {"assignNamespaces": ["QAO7XgHo", "63Ar9r6R", "6k4819VB"], "group": "N34wvOPN", "roleId": "JDxjHFBc"}]}}, {"affectedClientIDs": ["ufBPl0hP", "QgZpXhkh", "etiN1iUR"], "domain": "KOSX3cwJ", "namespaces": ["hZgtI7yQ", "28zlaINQ", "2LDJiVcD"], "roleId": "GvJ1e8aj", "ssoCfg": {"googleKey": {"657LgErJ": {}, "BP3nrJ8F": {}, "Kpx2pFAy": {}}, "groupConfigs": [{"assignNamespaces": ["zXdVxoqK", "Z59OKyAu", "Y5hxgRNS"], "group": "bcNe1uQQ", "roleId": "QXTYqa7S"}, {"assignNamespaces": ["LgzJM9hC", "zgsaqzrK", "qk3Yv26c"], "group": "v1y0hbN8", "roleId": "mOTcXOrp"}, {"assignNamespaces": ["38OIfebN", "tTMfnvy9", "qqxfyNk1"], "group": "XrI7wFoj", "roleId": "DvUfzAOl"}]}}, {"affectedClientIDs": ["TpwYqO1m", "6ALIl9MW", "U4d5Qk3Y"], "domain": "KfAaBMlB", "namespaces": ["M79KMCbJ", "vDmvrGxL", "rEo1D1V7"], "roleId": "BMGui3K7", "ssoCfg": {"googleKey": {"IVyzbgz8": {}, "YH8MQ6Wk": {}, "WwKSLb7p": {}}, "groupConfigs": [{"assignNamespaces": ["Q3Q3Riwe", "u1K7qjoz", "d2Pen5wL"], "group": "4Gt6FUDG", "roleId": "qiHs6GRH"}, {"assignNamespaces": ["00LwQZV5", "9EILTH40", "G1DgSty2"], "group": "sehiEcb7", "roleId": "QQFOpC3J"}, {"assignNamespaces": ["eofV9Y8N", "r28pIiwO", "40w0lOAW"], "group": "CyaKohRx", "roleId": "HtWtad12"}]}}], "Secret": "sG9etLA7", "TeamID": "wSppwRdE", "TokenAuthenticationType": "L4o0ro4m", "TokenClaimsMapping": {"RrBGvOMq": "XCfucIH3", "nyLsMqs7": "Aiohgtko", "zUPUBQwH": "ZtuwTKAd"}, "TokenEndpoint": "VUAmRheW", "UserInfoEndpoint": "qora0oxa", "UserInfoHTTPMethod": "kuyRB2zd", "googleAdminConsoleKey": "i7AiM4MO", "scopes": ["xFY5ZrDA", "lH4XfgjO", "ttgRZIfp"]}' \
    > test.out 2>&1
eval_tap $? 143 'AddThirdPartyLoginPlatformCredentialV3' test.out

#- 144 DeleteThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'GqtLKFxf' \
    > test.out 2>&1
eval_tap $? 144 'DeleteThirdPartyLoginPlatformCredentialV3' test.out

#- 145 UpdateThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'GEWIIqW3' \
    --body '{"ACSURL": "0yHceXnf", "AWSCognitoRegion": "semtB8Fa", "AWSCognitoUserPool": "pFJK2VJl", "AllowedClients": ["MK5MpXwO", "BxypZJU0", "j2sueIXc"], "AppId": "ZIMys4gY", "AuthorizationEndpoint": "d8a2jBs3", "ClientId": "DJDyqhBC", "EmptyStrFieldList": ["h54u9gjp", "6DSycLvJ", "An9eLH42"], "EnableServerLicenseValidation": true, "Environment": "gBUxiQqq", "FederationMetadataURL": "7SWAw2YP", "GenericOauthFlow": false, "IncludePUID": false, "IsActive": false, "Issuer": "bvVx2TMi", "JWKSEndpoint": "oxkwf5BE", "KeyID": "5ATrfA5I", "LogoURL": "5OezS4N8", "NetflixCertificates": {"encryptedPrivateKey": "lc75BKR2", "encryptedPrivateKeyName": "Ak3ZhqP6", "publicCertificate": "Euk7Gukg", "publicCertificateName": "Zjm1e7Th", "rootCertificate": "KfGwkjjZ", "rootCertificateName": "yFQPcUnB"}, "OrganizationId": "YNPP41l3", "PlatformName": "3dQjNc3A", "RedirectUri": "ZamKNbEA", "RegisteredDomains": [{"affectedClientIDs": ["gxJtr4dw", "kOoMOtTq", "gznTYsCm"], "domain": "FxLU6qBa", "namespaces": ["g46MFalG", "1qYNpVuq", "gmmdtF4p"], "roleId": "R5VljNLh", "ssoCfg": {"googleKey": {"GDjG8T5H": {}, "UXmVln9U": {}, "sgqFiF3A": {}}, "groupConfigs": [{"assignNamespaces": ["5L0VqOGJ", "REVsMhgh", "d9n0MO6L"], "group": "5CiCxZRg", "roleId": "gGGdgVEW"}, {"assignNamespaces": ["qWESsVCM", "ztOMmNtQ", "nrq5vSfb"], "group": "2dGK8yif", "roleId": "boWYAdgA"}, {"assignNamespaces": ["Tg61hNiW", "PhWnW2k9", "AyMWn4Yn"], "group": "bRL2EWJU", "roleId": "uQo6V6qJ"}]}}, {"affectedClientIDs": ["LJ2VQ5cr", "KihlYnvz", "uPUTqGc4"], "domain": "pHB7mnjm", "namespaces": ["Nk6WV0JP", "wdDVT7Xm", "nWhXnplg"], "roleId": "QI4LzUwz", "ssoCfg": {"googleKey": {"Sb8RqVe2": {}, "4JnUv5ZX": {}, "TRjNJhuL": {}}, "groupConfigs": [{"assignNamespaces": ["H4sFAlEX", "05kGetIW", "ZofFhvly"], "group": "mFwAqU7n", "roleId": "nxFBHif8"}, {"assignNamespaces": ["eAurVeae", "Tkn36Q73", "wo3yW4cE"], "group": "td2PPSeS", "roleId": "akxmZTIE"}, {"assignNamespaces": ["Ld4hCQoh", "zqTMgJ21", "9arypUu6"], "group": "S9aZJCyd", "roleId": "FHxymMs4"}]}}, {"affectedClientIDs": ["Qgmwk9dp", "hCG4cqaN", "9IyeF4pr"], "domain": "UX8yA5Bq", "namespaces": ["c2AKprip", "YjMmiltC", "5gFVNdID"], "roleId": "sq3IXSHJ", "ssoCfg": {"googleKey": {"5wqSYfsj": {}, "HxVfO4nj": {}, "lfZatpcC": {}}, "groupConfigs": [{"assignNamespaces": ["7bm1RPL1", "I4PLoXPb", "vumgVrH4"], "group": "wF2CMPZX", "roleId": "iqwrsRhd"}, {"assignNamespaces": ["TwHazozO", "LmYo5Rb3", "TMZiPmUG"], "group": "OOsfcLlk", "roleId": "DLZiBd5L"}, {"assignNamespaces": ["W6pdmhyJ", "8ay8BbUW", "ike095hV"], "group": "fidfnc4J", "roleId": "DfbGuREb"}]}}], "Secret": "kBnJjWow", "TeamID": "D9KDnhZZ", "TokenAuthenticationType": "5xRqgOeA", "TokenClaimsMapping": {"Fu7Q6zDE": "KXBK5gjS", "84zhARUb": "vcY1Jeeb", "fUqCfVvW": "hmFMdGjo"}, "TokenEndpoint": "dgxxcCuy", "UserInfoEndpoint": "pQKhWm0Z", "UserInfoHTTPMethod": "nKJzBEYU", "googleAdminConsoleKey": "QfdkF1rp", "scopes": ["GJoYdWse", "cqTCm0yJ", "B0LkBQEX"]}' \
    > test.out 2>&1
eval_tap $? 145 'UpdateThirdPartyLoginPlatformCredentialV3' test.out

#- 146 UpdateThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'uEH345hk' \
    --body '{"affectedClientIDs": ["u9oaGwjm", "RxSLLNhH", "PnVwoD43"], "assignedNamespaces": ["gIVOovIr", "YXu7dTNP", "lja4X2HW"], "domain": "Gg9hD3ZV", "roleId": "HGAGOeX5", "ssoCfg": {"googleKey": {"5VQpm2FB": {}, "s7mDslm3": {}, "ROORp9lO": {}}, "groupConfigs": [{"assignNamespaces": ["0XPIBn4f", "dR6Llz0l", "1ZanddJL"], "group": "lRgx9VoS", "roleId": "ZSLZfQw4"}, {"assignNamespaces": ["6bkmTdKg", "0cpaGbXd", "3VMw5xcr"], "group": "xwEKgmAT", "roleId": "Bo3NsPmP"}, {"assignNamespaces": ["M2FVk2hK", "LxGd8iw9", "D55EYo5x"], "group": "GM1G7Cbg", "roleId": "Jxm9YEso"}]}}' \
    > test.out 2>&1
eval_tap $? 146 'UpdateThirdPartyLoginPlatformDomainV3' test.out

#- 147 DeleteThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'nVVz65pa' \
    --body '{"domain": "4EoXpCyz", "ssoGroups": ["pCT4k6JV", "UnSpzaeV", "LKt1tSkd"]}' \
    > test.out 2>&1
eval_tap $? 147 'DeleteThirdPartyLoginPlatformDomainV3' test.out

#- 148 PartialUpdateThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam partialUpdateThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Sd7IgAVP' \
    --body '{"affectedClientIDs": ["n0siMGXv", "TmIY1BOr", "mXfZOzpx"], "assignedNamespaces": ["6ADX71wN", "DMyby6B8", "rsIOKhie"], "domain": "cj7awQBQ", "roleId": "vOQ12erJ", "ssoCfg": {"googleKey": {"jhE54mMB": {}, "fTuFXFqj": {}, "4vmBLfcC": {}}, "groupConfigs": [{"assignNamespaces": ["aDyRYjN8", "5uaVKbzp", "kJQl2FFs"], "group": "dERmTdiO", "roleId": "j2c0iRbH"}, {"assignNamespaces": ["WKOYkdGN", "HjXSN6u3", "qWCYviJy"], "group": "hU3zosKY", "roleId": "pEKN5nPX"}, {"assignNamespaces": ["6NUaXlMr", "L8wV6BLv", "iZDkJPu8"], "group": "XZCo2wfz", "roleId": "q0oesYXd"}]}}' \
    > test.out 2>&1
eval_tap $? 148 'PartialUpdateThirdPartyLoginPlatformDomainV3' test.out

#- 149 RetrieveSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam retrieveSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId '97SyyDs3' \
    > test.out 2>&1
eval_tap $? 149 'RetrieveSSOLoginPlatformCredential' test.out

#- 150 AddSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam addSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId '3hJnWdC6' \
    --body '{"acsUrl": "ACZU0w87", "apiKey": "8uMudik9", "appId": "thOFVpCb", "federationMetadataUrl": "e14KGKxb", "isActive": true, "redirectUri": "sK4e4OF5", "secret": "cwLqvgNW", "ssoUrl": "6RDhIBKQ"}' \
    > test.out 2>&1
eval_tap $? 150 'AddSSOLoginPlatformCredential' test.out

#- 151 DeleteSSOLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteSSOLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'w0SJPa5U' \
    > test.out 2>&1
eval_tap $? 151 'DeleteSSOLoginPlatformCredentialV3' test.out

#- 152 UpdateSSOPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam updateSSOPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'gzSfRy2g' \
    --body '{"acsUrl": "tEBD31vs", "apiKey": "imC4FCbD", "appId": "SZxp2PRZ", "federationMetadataUrl": "H9hpEUpd", "isActive": false, "redirectUri": "R79b2x1s", "secret": "ZOoaKFOY", "ssoUrl": "pDX9I6dH"}' \
    > test.out 2>&1
eval_tap $? 152 'UpdateSSOPlatformCredential' test.out

#- 153 AdminListUserIDByPlatformUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByPlatformUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'iSmyixue' \
    --rawPID  \
    --rawPUID  \
    --body '{"platformUserIds": ["6ZdJFlms", "EArw7wMB", "QNSZG496"]}' \
    > test.out 2>&1
eval_tap $? 153 'AdminListUserIDByPlatformUserIDsV3' test.out

#- 154 AdminGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'yELI3SDu' \
    --platformUserId 'DhHGmiyu' \
    > test.out 2>&1
eval_tap $? 154 'AdminGetUserByPlatformUserIDV3' test.out

#- 155 AdminGetProfileUpdateStrategyV3
./ng net.accelbyte.sdk.cli.Main iam adminGetProfileUpdateStrategyV3 \
    --namespace "$AB_NAMESPACE" \
    --field 'display_name' \
    > test.out 2>&1
eval_tap $? 155 'AdminGetProfileUpdateStrategyV3' test.out

#- 156 AdminUpdateProfileUpdateStrategyV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateProfileUpdateStrategyV3 \
    --namespace "$AB_NAMESPACE" \
    --field 'display_name' \
    --body '{"config": {"minimumAllowedInterval": 62}, "type": "3hRTlIke"}' \
    > test.out 2>&1
eval_tap $? 156 'AdminUpdateProfileUpdateStrategyV3' test.out

#- 157 AdminGetRoleOverrideConfigV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleOverrideConfigV3 \
    --namespace "$AB_NAMESPACE" \
    --identity 'VIEW_ONLY' \
    > test.out 2>&1
eval_tap $? 157 'AdminGetRoleOverrideConfigV3' test.out

#- 158 AdminUpdateRoleOverrideConfigV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleOverrideConfigV3 \
    --namespace "$AB_NAMESPACE" \
    --identity 'GAME_ADMIN' \
    --body '{"additions": [{"actions": [61, 15, 84], "resource": "C59Szf9b"}, {"actions": [34, 98, 55], "resource": "LEFV09v4"}, {"actions": [87, 7, 86], "resource": "nrVI4qXt"}], "exclusions": [{"actions": [90, 52, 94], "resource": "ZCMPv2xs"}, {"actions": [15, 15, 37], "resource": "ZTc68YGN"}, {"actions": [10, 96, 5], "resource": "zLmW1n6Y"}], "overrides": [{"actions": [70, 86, 50], "resource": "JCNvbiv8"}, {"actions": [67, 14, 81], "resource": "7RxmgJM7"}, {"actions": [99, 22, 97], "resource": "8BPhR9CR"}], "replacements": [{"replacement": {"actions": [68, 18, 86], "resource": "q4n7CmcV"}, "target": "5HSITIm5"}, {"replacement": {"actions": [36, 10, 26], "resource": "8atmBfxq"}, "target": "3D5Owj4h"}, {"replacement": {"actions": [81, 62, 39], "resource": "EhUBAWlr"}, "target": "4dvy7Jhl"}]}' \
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
    --identity 'GAME_ADMIN' \
    --body '{"active": true}' \
    > test.out 2>&1
eval_tap $? 160 'AdminChangeRoleOverrideConfigStatusV3' test.out

#- 161 AdminGetRoleNamespacePermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleNamespacePermissionV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'hpAdcj0o' \
    > test.out 2>&1
eval_tap $? 161 'AdminGetRoleNamespacePermissionV3' test.out

#- 162 GetAdminUsersByRoleIdV3
./ng net.accelbyte.sdk.cli.Main iam getAdminUsersByRoleIdV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'jdBKFTzE' \
    --after '16' \
    --before '73' \
    --limit '72' \
    > test.out 2>&1
eval_tap $? 162 'GetAdminUsersByRoleIdV3' test.out

#- 163 AdminGetUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --emailAddress '30ezf3qM' \
    > test.out 2>&1
eval_tap $? 163 'AdminGetUserByEmailAddressV3' test.out

#- 164 AdminBulkUpdateUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"updateRequest": {"skipLoginQueue": true}, "userIds": ["ZqvHyIdZ", "LzE6nTF1", "Z0wOWRuT"]}' \
    > test.out 2>&1
eval_tap $? 164 'AdminBulkUpdateUsersV3' test.out

#- 165 AdminGetBulkUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType 'WP5jWxYi' \
    --body '{"bulkUserId": ["9w2IJkrE", "tNwQpdpA", "0dLGgDf8"]}' \
    > test.out 2>&1
eval_tap $? 165 'AdminGetBulkUserBanV3' test.out

#- 166 AdminListUserIDByUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["8uz7lzQX", "vBQuXF0F", "aPEDWXGz"]}' \
    > test.out 2>&1
eval_tap $? 166 'AdminListUserIDByUserIDsV3' test.out

#- 167 AdminBulkGetUsersPlatform
./ng net.accelbyte.sdk.cli.Main iam adminBulkGetUsersPlatform \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["dGh8Le8b", "rACzoENZ", "rP9MQv38"]}' \
    > test.out 2>&1
eval_tap $? 167 'AdminBulkGetUsersPlatform' test.out

#- 168 AdminInviteUserV3
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddresses": ["tjQlAcLS", "abytHQiq", "LPUxnCxU"], "isAdmin": false, "languageTag": "cW76lF7d", "namespace": "ZFTUDEXf", "roles": ["UQHOu17y", "pxphNFGN", "2wboFRBa"]}' \
    > test.out 2>&1
eval_tap $? 168 'AdminInviteUserV3' test.out

#- 169 AdminQueryThirdPlatformLinkHistoryV3
./ng net.accelbyte.sdk.cli.Main iam adminQueryThirdPlatformLinkHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '7' \
    --offset '56' \
    --platformUserId 'jU9qHkLv' \
    --platformId 'Lq3CdoDV' \
    > test.out 2>&1
eval_tap $? 169 'AdminQueryThirdPlatformLinkHistoryV3' test.out

#- 170 AdminListUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminListUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '17' \
    --offset '68' \
    > test.out 2>&1
eval_tap $? 170 'AdminListUsersV3' test.out

#- 171 AdminSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam adminSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'o9lOHUp1' \
    --endDate 'JMDLwLfU' \
    --includeTotal  \
    --limit '32' \
    --offset '96' \
    --platformBy 'EP0E9a3z' \
    --platformId 'wdeFPZa1' \
    --query 'UOyJDwqJ' \
    --roleIds 'kdTnsZWe' \
    --skipLoginQueue  \
    --startDate 'PoWqWKH4' \
    --testAccount  \
    > test.out 2>&1
eval_tap $? 171 'AdminSearchUserV3' test.out

#- 172 AdminGetBulkUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"listEmailAddressRequest": ["7Wex8gxh", "Yjp38A89", "apnXXAzh"]}' \
    > test.out 2>&1
eval_tap $? 172 'AdminGetBulkUserByEmailAddressV3' test.out

#- 173 AdminGetUserByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'FETatftx' \
    > test.out 2>&1
eval_tap $? 173 'AdminGetUserByUserIdV3' test.out

#- 174 AdminUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'wAeOTWsJ' \
    --body '{"avatarUrl": "9LJdoHfj", "country": "PFUwYani", "dateOfBirth": "mIlboel8", "displayName": "vmh7L6Wt", "languageTag": "OPgTgW1D", "skipLoginQueue": true, "uniqueDisplayName": "mSCYlCbj", "userName": "68Zawk4m"}' \
    > test.out 2>&1
eval_tap $? 174 'AdminUpdateUserV3' test.out

#- 175 AdminGetUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'sHOihfqC' \
    --activeOnly  \
    --after 'Oi4rIzC6' \
    --before '4t7XopWm' \
    --limit '61' \
    > test.out 2>&1
eval_tap $? 175 'AdminGetUserBanV3' test.out

#- 176 AdminBanUserV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'jLhzqHBW' \
    --body '{"ban": "1ApzhHFW", "comment": "t10O0NI3", "endDate": "ZrZuXViJ", "reason": "bJqky3HJ", "skipNotif": true}' \
    > test.out 2>&1
eval_tap $? 176 'AdminBanUserV3' test.out

#- 177 AdminGetUserBanSummaryV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanSummaryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'yPMYlemh' \
    > test.out 2>&1
eval_tap $? 177 'AdminGetUserBanSummaryV3' test.out

#- 178 AdminUpdateUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserBanV3 \
    --banId 'Q7eT219T' \
    --namespace "$AB_NAMESPACE" \
    --userId 'vavnOlWd' \
    --body '{"enabled": true, "skipNotif": false}' \
    > test.out 2>&1
eval_tap $? 178 'AdminUpdateUserBanV3' test.out

#- 179 AdminSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'fbceBjke' \
    --body '{"context": "uagtMThv", "emailAddress": "jVJxiea5", "languageTag": "aiSy0oNj", "upgradeToken": "O1qEG26q"}' \
    > test.out 2>&1
eval_tap $? 179 'AdminSendVerificationCodeV3' test.out

#- 180 AdminVerifyAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'kPWXtjSz' \
    --body '{"Code": "uF1eFKUT", "ContactType": "R3u1hrue", "LanguageTag": "QQ6SGNUZ", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 180 'AdminVerifyAccountV3' test.out

#- 181 GetUserVerificationCode
./ng net.accelbyte.sdk.cli.Main iam getUserVerificationCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'tltJT67z' \
    > test.out 2>&1
eval_tap $? 181 'GetUserVerificationCode' test.out

#- 182 AdminGetUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'zyfSb9QR' \
    > test.out 2>&1
eval_tap $? 182 'AdminGetUserDeletionStatusV3' test.out

#- 183 AdminUpdateUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'aJN34xel' \
    --body '{"deletionDate": 82, "enabled": true}' \
    > test.out 2>&1
eval_tap $? 183 'AdminUpdateUserDeletionStatusV3' test.out

#- 184 AdminListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'b3JLJmNT' \
    > test.out 2>&1
eval_tap $? 184 'AdminListUserAllPlatformAccountsDistinctV3' test.out

#- 185 AdminUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'x8S5mSlg' \
    --body '{"code": "RGWpVP62", "country": "Qd9e9lJn", "dateOfBirth": "174bfbxQ", "displayName": "NefgriF7", "emailAddress": "6JZq0EGX", "password": "XRh9315j", "uniqueDisplayName": "Mtv8pjdx", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 185 'AdminUpgradeHeadlessAccountV3' test.out

#- 186 AdminDeleteUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'a5fPZVgh' \
    > test.out 2>&1
eval_tap $? 186 'AdminDeleteUserInformationV3' test.out

#- 187 AdminGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'mZZMNdcZ' \
    --after '0.4334456973117504' \
    --before '0.30338856789699653' \
    --limit '31' \
    > test.out 2>&1
eval_tap $? 187 'AdminGetUserLoginHistoriesV3' test.out

#- 188 AdminResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam adminResetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'XzvYKBqC' \
    --body '{"languageTag": "EQ8GdGdy", "mfaToken": "9LDAUwFm", "newPassword": "7rWqGQN9", "oldPassword": "rtcf1GBW"}' \
    > test.out 2>&1
eval_tap $? 188 'AdminResetPasswordV3' test.out

#- 189 AdminUpdateUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserPermissionV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'dUWK3k7b' \
    --body '{"Permissions": [{"Action": 85, "Resource": "cNaL6Fp2", "SchedAction": 9, "SchedCron": "MpfD6f7P", "SchedRange": ["wrBsygXz", "JFIeTN4T", "Pj9EgeN4"]}, {"Action": 99, "Resource": "w42JWram", "SchedAction": 41, "SchedCron": "GEa3VwFx", "SchedRange": ["yY3ThMQA", "xoiyUfeD", "gb84W8Vh"]}, {"Action": 57, "Resource": "47f9alul", "SchedAction": 21, "SchedCron": "g8ujuNzh", "SchedRange": ["NvMweVug", "AMThNHD6", "9XLJlTr7"]}]}' \
    > test.out 2>&1
eval_tap $? 189 'AdminUpdateUserPermissionV3' test.out

#- 190 AdminAddUserPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserPermissionsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'lWxXlSkf' \
    --body '{"Permissions": [{"Action": 26, "Resource": "vWCm0uMW", "SchedAction": 63, "SchedCron": "0t0Jqtkp", "SchedRange": ["X8IwsKsN", "d1lTjLet", "kQpf7Sid"]}, {"Action": 89, "Resource": "Zoreo9Ch", "SchedAction": 11, "SchedCron": "ib6c4lYx", "SchedRange": ["9sKM6vxI", "BTx3o8rW", "PrwqJkQb"]}, {"Action": 16, "Resource": "BQQnMlkZ", "SchedAction": 29, "SchedCron": "e5fIArzf", "SchedRange": ["fitXL897", "w3fgGJ2Y", "MNc5AKbm"]}]}' \
    > test.out 2>&1
eval_tap $? 190 'AdminAddUserPermissionsV3' test.out

#- 191 AdminDeleteUserPermissionBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'HRIoxtU9' \
    --body '[{"Action": 40, "Resource": "YQc2Dgtd"}, {"Action": 71, "Resource": "TvaNBj6x"}, {"Action": 35, "Resource": "8NDv6xv7"}]' \
    > test.out 2>&1
eval_tap $? 191 'AdminDeleteUserPermissionBulkV3' test.out

#- 192 AdminDeleteUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionV3 \
    --action '58' \
    --namespace "$AB_NAMESPACE" \
    --resource '9bjvFypW' \
    --userId 'DWMatcqQ' \
    > test.out 2>&1
eval_tap $? 192 'AdminDeleteUserPermissionV3' test.out

#- 193 AdminGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '8PMjE5ZB' \
    --after 'Uf8N9RSk' \
    --before 'OVIK1aXe' \
    --limit '1' \
    --platformId 'R2fSL3I3' \
    --targetNamespace '8qFaQcQj' \
    > test.out 2>&1
eval_tap $? 193 'AdminGetUserPlatformAccountsV3' test.out

#- 194 AdminListAllDistinctPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminListAllDistinctPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ANF8UbB2' \
    --status 'YtUKnVPL' \
    > test.out 2>&1
eval_tap $? 194 'AdminListAllDistinctPlatformAccountsV3' test.out

#- 195 AdminGetListJusticePlatformAccounts
./ng net.accelbyte.sdk.cli.Main iam adminGetListJusticePlatformAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'QGY8kNLp' \
    > test.out 2>&1
eval_tap $? 195 'AdminGetListJusticePlatformAccounts' test.out

#- 196 AdminGetUserMapping
./ng net.accelbyte.sdk.cli.Main iam adminGetUserMapping \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'UfanLWHE' \
    --userId '2lwAG4zd' \
    > test.out 2>&1
eval_tap $? 196 'AdminGetUserMapping' test.out

#- 197 AdminCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam adminCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'PItJsyyq' \
    --userId 'oqBtVMTm' \
    > test.out 2>&1
eval_tap $? 197 'AdminCreateJusticeUser' test.out

#- 198 AdminLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'U2X6Orkf' \
    --skipConflict  \
    --body '{"platformId": "6NoJIuLJ", "platformUserId": "T1ccPOqQ"}' \
    > test.out 2>&1
eval_tap $? 198 'AdminLinkPlatformAccount' test.out

#- 199 AdminGetUserLinkHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLinkHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'T4jxdrNe' \
    --platformId 'WlSj73Zy' \
    > test.out 2>&1
eval_tap $? 199 'AdminGetUserLinkHistoriesV3' test.out

#- 200 AdminPlatformUnlinkV3
eval_tap 0 200 'AdminPlatformUnlinkV3 # SKIP deprecated' test.out

#- 201 AdminPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Z8vE96nY' \
    --userId '0OxWsDwp' \
    > test.out 2>&1
eval_tap $? 201 'AdminPlatformUnlinkAllV3' test.out

#- 202 AdminPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '9PEpTOnw' \
    --userId 'awmNnOWv' \
    --ticket 'qyaE2MrZ' \
    > test.out 2>&1
eval_tap $? 202 'AdminPlatformLinkV3' test.out

#- 203 AdminDeleteUserLinkingHistoryByPlatformIDV3
eval_tap 0 203 'AdminDeleteUserLinkingHistoryByPlatformIDV3 # SKIP deprecated' test.out

#- 204 AdminDeleteUserLinkingRestrictionByPlatformIDV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserLinkingRestrictionByPlatformIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'sMjUQLMX' \
    --userId 'foWGDwyE' \
    > test.out 2>&1
eval_tap $? 204 'AdminDeleteUserLinkingRestrictionByPlatformIDV3' test.out

#- 205 AdminGetThirdPartyPlatformTokenLinkStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetThirdPartyPlatformTokenLinkStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'P5Mq27L2' \
    --userId '7oyqoMR7' \
    --platformToken 'alGjvFld' \
    > test.out 2>&1
eval_tap $? 205 'AdminGetThirdPartyPlatformTokenLinkStatusV3' test.out

#- 206 AdminGetUserSinglePlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminGetUserSinglePlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --platformId 'JexM3RMR' \
    --userId 'TXQ85uVB' \
    --crossNamespace  \
    > test.out 2>&1
eval_tap $? 206 'AdminGetUserSinglePlatformAccount' test.out

#- 207 AdminDeleteUserRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRolesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '0MtxbX3Z' \
    --body '["J8Ix5gkg", "tYMzY0Ze", "iuHTp1Sx"]' \
    > test.out 2>&1
eval_tap $? 207 'AdminDeleteUserRolesV3' test.out

#- 208 AdminSaveUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminSaveUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '8Ade8UOz' \
    --body '[{"namespace": "HweoX5Gw", "roleId": "WFDuxrLZ"}, {"namespace": "ObE7ajuh", "roleId": "oGgD17xX"}, {"namespace": "GdaBTlT8", "roleId": "7CNFr8LV"}]' \
    > test.out 2>&1
eval_tap $? 208 'AdminSaveUserRoleV3' test.out

#- 209 AdminAddUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'm6hecpEx' \
    --userId 'TjkOvVKD' \
    > test.out 2>&1
eval_tap $? 209 'AdminAddUserRoleV3' test.out

#- 210 AdminDeleteUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'EKF9g2Dh' \
    --userId '83xk9BVH' \
    > test.out 2>&1
eval_tap $? 210 'AdminDeleteUserRoleV3' test.out

#- 211 AdminGetUserStateByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserStateByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'dla5Ctz6' \
    > test.out 2>&1
eval_tap $? 211 'AdminGetUserStateByUserIdV3' test.out

#- 212 AdminUpdateUserStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'CjZ39OoE' \
    --body '{"enabled": true, "reason": "W9fwYtzK"}' \
    > test.out 2>&1
eval_tap $? 212 'AdminUpdateUserStatusV3' test.out

#- 213 AdminTrustlyUpdateUserIdentity
./ng net.accelbyte.sdk.cli.Main iam adminTrustlyUpdateUserIdentity \
    --namespace "$AB_NAMESPACE" \
    --userId 'RBr1wCHg' \
    --body '{"emailAddress": "KJZcXKwS", "password": "POZfcurp"}' \
    > test.out 2>&1
eval_tap $? 213 'AdminTrustlyUpdateUserIdentity' test.out

#- 214 AdminVerifyUserWithoutVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyUserWithoutVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'qT4OwQ5V' \
    > test.out 2>&1
eval_tap $? 214 'AdminVerifyUserWithoutVerificationCodeV3' test.out

#- 215 AdminUpdateClientSecretV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientSecretV3 \
    --clientId 'qlT9vuvj' \
    --namespace "$AB_NAMESPACE" \
    --body '{"newSecret": "UMRZnXSc"}' \
    > test.out 2>&1
eval_tap $? 215 'AdminUpdateClientSecretV3' test.out

#- 216 AdminCheckThirdPartyLoginPlatformAvailabilityV3
./ng net.accelbyte.sdk.cli.Main iam adminCheckThirdPartyLoginPlatformAvailabilityV3 \
    --platformId 'PdyOLA3A' \
    > test.out 2>&1
eval_tap $? 216 'AdminCheckThirdPartyLoginPlatformAvailabilityV3' test.out

#- 217 AdminGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV3 \
    --after 'HxSdynwf' \
    --before 'w4iQqigm' \
    --isWildcard  \
    --limit '5' \
    > test.out 2>&1
eval_tap $? 217 'AdminGetRolesV3' test.out

#- 218 AdminCreateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV3 \
    --body '{"adminRole": true, "deletable": true, "isWildcard": true, "managers": [{"displayName": "9m0NKrk1", "namespace": "MZ7v0sf7", "userId": "CnM2TqnW"}, {"displayName": "FOBpPjk0", "namespace": "zekVXCxP", "userId": "gTwVu4Jm"}, {"displayName": "7b2ptW8d", "namespace": "ExMrSA97", "userId": "pBECtZlF"}], "members": [{"displayName": "uPglTta9", "namespace": "OusfkIQC", "userId": "G8fomPDn"}, {"displayName": "wAkLJHWt", "namespace": "M0gy5EuB", "userId": "CIB7AsiX"}, {"displayName": "wIlvkFci", "namespace": "FSWrlHsg", "userId": "ldW0x9fJ"}], "permissions": [{"action": 52, "resource": "l6Fs1cam", "schedAction": 58, "schedCron": "SYU4Ax5j", "schedRange": ["HARrPZ0K", "fZBThl42", "DKHSHsbx"]}, {"action": 19, "resource": "Ur1GaU3D", "schedAction": 55, "schedCron": "QStn9bzL", "schedRange": ["0l6U6NxF", "H92yCrUO", "UdeVSURW"]}, {"action": 70, "resource": "BoM62Knr", "schedAction": 56, "schedCron": "VedKhSYF", "schedRange": ["sbSYJXTS", "xYXWd8d8", "kAhWxyeH"]}], "roleName": "XBPGJJca"}' \
    > test.out 2>&1
eval_tap $? 218 'AdminCreateRoleV3' test.out

#- 219 AdminGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV3 \
    --roleId 'ar0XY9Xv' \
    > test.out 2>&1
eval_tap $? 219 'AdminGetRoleV3' test.out

#- 220 AdminDeleteRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV3 \
    --roleId 'A94HNUBC' \
    > test.out 2>&1
eval_tap $? 220 'AdminDeleteRoleV3' test.out

#- 221 AdminUpdateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV3 \
    --roleId 'wVgJMFzz' \
    --body '{"deletable": false, "isWildcard": true, "roleName": "1rToVaPp"}' \
    > test.out 2>&1
eval_tap $? 221 'AdminUpdateRoleV3' test.out

#- 222 AdminGetRoleAdminStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleAdminStatusV3 \
    --roleId 'w3LSJu8b' \
    > test.out 2>&1
eval_tap $? 222 'AdminGetRoleAdminStatusV3' test.out

#- 223 AdminUpdateAdminRoleStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateAdminRoleStatusV3 \
    --roleId 'gEdan26c' \
    > test.out 2>&1
eval_tap $? 223 'AdminUpdateAdminRoleStatusV3' test.out

#- 224 AdminRemoveRoleAdminV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleAdminV3 \
    --roleId 'AjnesVPU' \
    > test.out 2>&1
eval_tap $? 224 'AdminRemoveRoleAdminV3' test.out

#- 225 AdminGetRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleManagersV3 \
    --roleId 'rydglt90' \
    --after 'jhSDc9Lh' \
    --before 'tuUxLnNx' \
    --limit '73' \
    > test.out 2>&1
eval_tap $? 225 'AdminGetRoleManagersV3' test.out

#- 226 AdminAddRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleManagersV3 \
    --roleId 'VDL6NdB6' \
    --body '{"managers": [{"displayName": "VCrpSSQm", "namespace": "DwfbkNVy", "userId": "tCfw1pAr"}, {"displayName": "3fAd8mQ8", "namespace": "rmibamHP", "userId": "MMyKAuVE"}, {"displayName": "Fc5p4xWg", "namespace": "RlKqtRlO", "userId": "9st8QXvb"}]}' \
    > test.out 2>&1
eval_tap $? 226 'AdminAddRoleManagersV3' test.out

#- 227 AdminRemoveRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleManagersV3 \
    --roleId 'TgafiwjE' \
    --body '{"managers": [{"displayName": "MGdwMAvt", "namespace": "sdAxmu0u", "userId": "wmiblRVL"}, {"displayName": "BqMl4P3z", "namespace": "2yJ2L83j", "userId": "nj6OdSHf"}, {"displayName": "xH6cz7xZ", "namespace": "UeuRsS6i", "userId": "vsSSz0nt"}]}' \
    > test.out 2>&1
eval_tap $? 227 'AdminRemoveRoleManagersV3' test.out

#- 228 AdminGetRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleMembersV3 \
    --roleId 'JPjLha6j' \
    --after 'rFZPwlLp' \
    --before 'heI2nAIf' \
    --limit '27' \
    > test.out 2>&1
eval_tap $? 228 'AdminGetRoleMembersV3' test.out

#- 229 AdminAddRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleMembersV3 \
    --roleId 'eRDsMKbu' \
    --body '{"members": [{"displayName": "PgjnyQ9x", "namespace": "04CSuO3t", "userId": "Df7OpZIf"}, {"displayName": "r5aWifDA", "namespace": "jYY6m1xC", "userId": "6w755ZnH"}, {"displayName": "VIQEE0AO", "namespace": "MWJdrcBk", "userId": "5CiHqQui"}]}' \
    > test.out 2>&1
eval_tap $? 229 'AdminAddRoleMembersV3' test.out

#- 230 AdminRemoveRoleMembersV3
eval_tap 0 230 'AdminRemoveRoleMembersV3 # SKIP deprecated' test.out

#- 231 AdminUpdateRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV3 \
    --roleId 'I8lFqSJZ' \
    --body '{"permissions": [{"action": 29, "resource": "W2vzOpWx", "schedAction": 31, "schedCron": "he6SDmw2", "schedRange": ["JoFpgNYb", "4yCoPra1", "NrPFuhZY"]}, {"action": 43, "resource": "czDi7ZcT", "schedAction": 97, "schedCron": "oC8Xo8P6", "schedRange": ["kE20Da4X", "IcYncgjI", "WV4tC9lX"]}, {"action": 13, "resource": "UjrOEQ9u", "schedAction": 39, "schedCron": "8ENWc43B", "schedRange": ["tmgXEuMj", "2uqB0hhw", "8YfNvk2f"]}]}' \
    > test.out 2>&1
eval_tap $? 231 'AdminUpdateRolePermissionsV3' test.out

#- 232 AdminAddRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV3 \
    --roleId 'DO7RcSUW' \
    --body '{"permissions": [{"action": 51, "resource": "HDIL09Y5", "schedAction": 76, "schedCron": "RZwRHDtq", "schedRange": ["WZPwOedl", "vZNbtvYf", "o0RkLUiT"]}, {"action": 49, "resource": "oMVSpagE", "schedAction": 62, "schedCron": "Q2boPAIc", "schedRange": ["San7HNxO", "qcxAElwE", "1kll0koG"]}, {"action": 75, "resource": "locjHYVq", "schedAction": 45, "schedCron": "KI2AgEoY", "schedRange": ["xW0TsbAF", "nFYICscR", "PT4OR3ua"]}]}' \
    > test.out 2>&1
eval_tap $? 232 'AdminAddRolePermissionsV3' test.out

#- 233 AdminDeleteRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV3 \
    --roleId 'fQ8N0DAI' \
    --body '["nx5TFv3p", "RaRArbeI", "XsN5mHSR"]' \
    > test.out 2>&1
eval_tap $? 233 'AdminDeleteRolePermissionsV3' test.out

#- 234 AdminDeleteRolePermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionV3 \
    --action '8' \
    --resource 'OZNmYjwi' \
    --roleId 'lKjQ9Ge7' \
    > test.out 2>&1
eval_tap $? 234 'AdminDeleteRolePermissionV3' test.out

#- 235 AdminGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam adminGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 235 'AdminGetMyUserV3' test.out

#- 236 UserAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam userAuthenticationV3 \
    --clientId 'O7jvHSxq' \
    --extendExp  \
    --redirectUri 'KhxOHABj' \
    --password 'T5i7PZDV' \
    --requestId 'yM2NfBEA' \
    --userName 'fxmFUyr1' \
    > test.out 2>&1
eval_tap $? 236 'UserAuthenticationV3' test.out

#- 237 AuthenticationWithPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV3 \
    --extendExp  \
    --clientId 'ACeIk112' \
    --linkingToken 'Uzs4WYH4' \
    --password 'ETRhQF2k' \
    --username 'H4xhuXy9' \
    > test.out 2>&1
eval_tap $? 237 'AuthenticationWithPlatformLinkV3' test.out

#- 238 AuthenticateAndLinkForwardV3
./ng net.accelbyte.sdk.cli.Main iam authenticateAndLinkForwardV3 \
    --extendExp  \
    --clientId 'xszD4rPc' \
    --linkingToken 'QpQ0DOyg' \
    --password 'c6eqYtk6' \
    --username 'Lywh7XJl' \
    > test.out 2>&1
eval_tap $? 238 'AuthenticateAndLinkForwardV3' test.out

#- 239 GenerateTokenByNewHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV3 \
    --additionalData 'lnAQS0HT' \
    --extendExp  \
    --linkingToken 'YsJerp4u' \
    > test.out 2>&1
eval_tap $? 239 'GenerateTokenByNewHeadlessAccountV3' test.out

#- 240 RequestOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam requestOneTimeLinkingCodeV3 \
    --redirectUri '87OxW45q' \
    --state 'IiP9tJSB' \
    --platformId 'QhD1I1iZ' \
    > test.out 2>&1
eval_tap $? 240 'RequestOneTimeLinkingCodeV3' test.out

#- 241 ValidateOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam validateOneTimeLinkingCodeV3 \
    --oneTimeLinkCode 'qTghMjlx' \
    > test.out 2>&1
eval_tap $? 241 'ValidateOneTimeLinkingCodeV3' test.out

#- 242 RequestTokenByOneTimeLinkCodeResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTokenByOneTimeLinkCodeResponseV3 \
    --additionalData 'wm6Oph28' \
    --isTransient  \
    --clientId 'exHpWLd1' \
    --oneTimeLinkCode 'YNlbtS5M' \
    > test.out 2>&1
eval_tap $? 242 'RequestTokenByOneTimeLinkCodeResponseV3' test.out

#- 243 GetCountryLocationV3
./ng net.accelbyte.sdk.cli.Main iam getCountryLocationV3 \
    > test.out 2>&1
eval_tap $? 243 'GetCountryLocationV3' test.out

#- 244 Logout
./ng net.accelbyte.sdk.cli.Main iam logout \
    > test.out 2>&1
eval_tap $? 244 'Logout' test.out

#- 245 RequestTokenExchangeCodeV3
./ng net.accelbyte.sdk.cli.Main iam requestTokenExchangeCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --codeChallenge 'DBbhCQGT' \
    --codeChallengeMethod 'plain' \
    --clientId 'St6qbbLr' \
    > test.out 2>&1
eval_tap $? 245 'RequestTokenExchangeCodeV3' test.out

#- 246 AdminRetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam adminRetrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'z5IvrEuI' \
    --userId 'AOhHMQOA' \
    --platformUserId 'qlhIsMBc' \
    > test.out 2>&1
eval_tap $? 246 'AdminRetrieveUserThirdPartyPlatformTokenV3' test.out

#- 247 RevokeUserV3
./ng net.accelbyte.sdk.cli.Main iam revokeUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'koM2gaDF' \
    --includeGameNamespace  \
    > test.out 2>&1
eval_tap $? 247 'RevokeUserV3' test.out

#- 248 AuthorizeV3
./ng net.accelbyte.sdk.cli.Main iam authorizeV3 \
    --blockedPlatformId 'DccshapN' \
    --codeChallenge 'xm1KYUMo' \
    --codeChallengeMethod 'S256' \
    --createHeadless  \
    --loginWebBased  \
    --nonce 'Ud8Atb9n' \
    --oneTimeLinkCode 'lUN5aLl5' \
    --redirectUri 'yXNEuEqg' \
    --scope 'cPFEACC8' \
    --state 'eXPMvsHC' \
    --targetAuthPage 'cSVygKcT' \
    --useRedirectUriAsLoginUrlWhenLocked  \
    --clientId 'qjooRc9u' \
    --responseType 'code' \
    > test.out 2>&1
eval_tap $? 248 'AuthorizeV3' test.out

#- 249 TokenIntrospectionV3
./ng net.accelbyte.sdk.cli.Main iam tokenIntrospectionV3 \
    --token 'TjuSC6Yj' \
    > test.out 2>&1
eval_tap $? 249 'TokenIntrospectionV3' test.out

#- 250 GetJWKSV3
./ng net.accelbyte.sdk.cli.Main iam getJWKSV3 \
    > test.out 2>&1
eval_tap $? 250 'GetJWKSV3' test.out

#- 251 SendMFAAuthenticationCode
./ng net.accelbyte.sdk.cli.Main iam sendMFAAuthenticationCode \
    --clientId 'iZ98PJvN' \
    --factor 'h4GocCn8' \
    --mfaToken '2mnUnMYz' \
    > test.out 2>&1
eval_tap $? 251 'SendMFAAuthenticationCode' test.out

#- 252 Change2faMethod
./ng net.accelbyte.sdk.cli.Main iam change2faMethod \
    --factor '5DjZewRi' \
    --mfaToken '7Dl0i0f6' \
    > test.out 2>&1
eval_tap $? 252 'Change2faMethod' test.out

#- 253 Verify2faCode
./ng net.accelbyte.sdk.cli.Main iam verify2faCode \
    --code 'AdUuxlkL' \
    --factor 'QtWhI040' \
    --mfaToken 'OBQ3Fm5Q' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 253 'Verify2faCode' test.out

#- 254 Verify2faCodeForward
./ng net.accelbyte.sdk.cli.Main iam verify2faCodeForward \
    --defaultFactor 'grNErvQs' \
    --factors '7vMuK14k' \
    --rememberDevice  \
    --clientId 'YIOK3xcZ' \
    --code '5dTHItTd' \
    --factor 'FefKMXds' \
    --mfaToken 'WTIWcJgL' \
    > test.out 2>&1
eval_tap $? 254 'Verify2faCodeForward' test.out

#- 255 RetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam retrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'D18y5w59' \
    --userId 'jcnTnrmH' \
    > test.out 2>&1
eval_tap $? 255 'RetrieveUserThirdPartyPlatformTokenV3' test.out

#- 256 AuthCodeRequestV3
./ng net.accelbyte.sdk.cli.Main iam authCodeRequestV3 \
    --platformId 'UbO8xcEW' \
    --clientId 'saLfA4u4' \
    --redirectUri 'H9t7FFSb' \
    --requestId 'BjgWVkNB' \
    > test.out 2>&1
eval_tap $? 256 'AuthCodeRequestV3' test.out

#- 257 PlatformTokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV3 \
    --platformId 'Yn1Tu0Zd' \
    --additionalData '9N0XGhEG' \
    --clientId '4hVfyxER' \
    --createHeadless  \
    --deviceId 'Per8pXAV' \
    --macAddress 'dFjdED2d' \
    --platformToken '3qKQvPqj' \
    --serviceLabel '0.6142389857104402' \
    --skipSetCookie  \
    > test.out 2>&1
eval_tap $? 257 'PlatformTokenGrantV3' test.out

#- 258 GetRevocationListV3
./ng net.accelbyte.sdk.cli.Main iam getRevocationListV3 \
    > test.out 2>&1
eval_tap $? 258 'GetRevocationListV3' test.out

#- 259 TokenRevocationV3
./ng net.accelbyte.sdk.cli.Main iam tokenRevocationV3 \
    --token 't4K7nn6G' \
    > test.out 2>&1
eval_tap $? 259 'TokenRevocationV3' test.out

#- 260 SimultaneousLoginV3
./ng net.accelbyte.sdk.cli.Main iam simultaneousLoginV3 \
    --simultaneousPlatform 'tWgUbrB5' \
    --simultaneousTicket 'Bz5IjnYZ' \
    --nativePlatform 'steam' \
    --nativePlatformTicket 'dPyvJjMt' \
    > test.out 2>&1
eval_tap $? 260 'SimultaneousLoginV3' test.out

#- 261 TokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV3 \
    --additionalData 'inxR2L56' \
    --clientId 'gYMMqbo2' \
    --clientSecret 'wvrdVdPu' \
    --code '8qIE0rrf' \
    --codeVerifier '1aSHkNka' \
    --extendNamespace 'H9govAiH' \
    --extendExp  \
    --password 'rGkCq4E2' \
    --redirectUri 'pcsLHjJp' \
    --refreshToken 'YsYsNEMp' \
    --username 'a5G7eaAE' \
    --grantType 'password' \
    > test.out 2>&1
eval_tap $? 261 'TokenGrantV3' test.out

#- 262 VerifyTokenV3
./ng net.accelbyte.sdk.cli.Main iam verifyTokenV3 \
    --token 'AnlWwnUL' \
    > test.out 2>&1
eval_tap $? 262 'VerifyTokenV3' test.out

#- 263 PlatformAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticationV3 \
    --platformId 'OgglWzEz' \
    --code '8yZdsgHD' \
    --error 'xyjpRJa7' \
    --openidAssocHandle 'D1czZCIR' \
    --openidClaimedId 'oeF1jInf' \
    --openidIdentity 'yn5fF8RV' \
    --openidMode 'dl6x6XEA' \
    --openidNs 'wL0vrqjc' \
    --openidOpEndpoint 'ttwJbHvf' \
    --openidResponseNonce 'I40dG3F1' \
    --openidReturnTo 'RIwyOQbh' \
    --openidSig 'eNuBI4Mj' \
    --openidSigned 'BQfsal8r' \
    --state 'VH6rm1w5' \
    > test.out 2>&1
eval_tap $? 263 'PlatformAuthenticationV3' test.out

#- 264 PlatformTokenRefreshV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenRefreshV3 \
    --platformId 'vsnkvRnN' \
    --platformToken 'zw0sJVKY' \
    > test.out 2>&1
eval_tap $? 264 'PlatformTokenRefreshV3' test.out

#- 265 PublicGetInputValidations
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidations \
    --defaultOnEmpty  \
    --languageCode 'crBJ1T81' \
    > test.out 2>&1
eval_tap $? 265 'PublicGetInputValidations' test.out

#- 266 PublicGetInputValidationByField
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidationByField \
    --field 'jTcfTjBh' \
    > test.out 2>&1
eval_tap $? 266 'PublicGetInputValidationByField' test.out

#- 267 PublicGetCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam publicGetCountryAgeRestrictionV3 \
    --countryCode 'tf1SOZf8' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 267 'PublicGetCountryAgeRestrictionV3' test.out

#- 268 PublicGetConfigValueV3
./ng net.accelbyte.sdk.cli.Main iam publicGetConfigValueV3 \
    --configKey 'cPpSXeUB' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 268 'PublicGetConfigValueV3' test.out

#- 269 PublicGetCountryListV3
./ng net.accelbyte.sdk.cli.Main iam publicGetCountryListV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 269 'PublicGetCountryListV3' test.out

#- 270 RetrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3
./ng net.accelbyte.sdk.cli.Main iam retrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 270 'RetrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3' test.out

#- 271 RetrieveActiveOIDCClientsPublicV3
./ng net.accelbyte.sdk.cli.Main iam retrieveActiveOIDCClientsPublicV3 \
    --namespace "$AB_NAMESPACE" \
    --clientId 'tA6Wr8ci' \
    > test.out 2>&1
eval_tap $? 271 'RetrieveActiveOIDCClientsPublicV3' test.out

#- 272 PublicListUserIDByPlatformUserIDsV3
eval_tap 0 272 'PublicListUserIDByPlatformUserIDsV3 # SKIP deprecated' test.out

#- 273 PublicGetUserByPlatformUserIDV3
eval_tap 0 273 'PublicGetUserByPlatformUserIDV3 # SKIP deprecated' test.out

#- 274 PublicGetProfileUpdateStrategyV3
./ng net.accelbyte.sdk.cli.Main iam publicGetProfileUpdateStrategyV3 \
    --namespace "$AB_NAMESPACE" \
    --field 'username' \
    > test.out 2>&1
eval_tap $? 274 'PublicGetProfileUpdateStrategyV3' test.out

#- 275 PublicGetAsyncStatus
./ng net.accelbyte.sdk.cli.Main iam publicGetAsyncStatus \
    --namespace "$AB_NAMESPACE" \
    --requestId 'G5vb46No' \
    > test.out 2>&1
eval_tap $? 275 'PublicGetAsyncStatus' test.out

#- 276 PublicSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam publicSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'DbPztzzA' \
    --limit '86' \
    --offset '52' \
    --platformBy 'DLOjowKE' \
    --platformId 'fVXIPSIH' \
    --query 'c4SXLM1N' \
    > test.out 2>&1
eval_tap $? 276 'PublicSearchUserV3' test.out

#- 277 PublicCreateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "V5IPm96e", "acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "MBSt9pK4", "policyId": "FDPUBEFN", "policyVersionId": "ElNct5h9"}, {"isAccepted": true, "localizedPolicyVersionId": "EJuwxs8T", "policyId": "3JVb3lAm", "policyVersionId": "LsEVpvzc"}, {"isAccepted": false, "localizedPolicyVersionId": "29x4zAth", "policyId": "iJdMcSai", "policyVersionId": "AcPhIuFo"}], "authType": "Gg68uQlP", "code": "DBQqT6UN", "country": "UYnlUh2S", "dateOfBirth": "Qbqb1NBV", "displayName": "E73m8yqK", "emailAddress": "qai3svHJ", "password": "f66UoBwB", "reachMinimumAge": true, "uniqueDisplayName": "hfPMbuV8"}' \
    > test.out 2>&1
eval_tap $? 277 'PublicCreateUserV3' test.out

#- 278 CheckUserAvailability
./ng net.accelbyte.sdk.cli.Main iam checkUserAvailability \
    --namespace "$AB_NAMESPACE" \
    --field 'wEnJUSYj' \
    --query 'axnPihwQ' \
    > test.out 2>&1
eval_tap $? 278 'CheckUserAvailability' test.out

#- 279 PublicBulkGetUsers
eval_tap 0 279 'PublicBulkGetUsers # SKIP deprecated' test.out

#- 280 PublicSendRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicSendRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "7hKBMqkd", "languageTag": "X6OV3JnQ"}' \
    > test.out 2>&1
eval_tap $? 280 'PublicSendRegistrationCode' test.out

#- 281 PublicVerifyRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicVerifyRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "gJ0vIThB", "emailAddress": "6akYqzhn"}' \
    > test.out 2>&1
eval_tap $? 281 'PublicVerifyRegistrationCode' test.out

#- 282 PublicForgotPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicForgotPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "oCWm2xik", "languageTag": "4s9sja3B"}' \
    > test.out 2>&1
eval_tap $? 282 'PublicForgotPasswordV3' test.out

#- 283 PublicValidateUserInput
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserInput \
    --namespace "$AB_NAMESPACE" \
    --body '{"displayName": "ZOKbQF3c", "password": "1euclFCQ", "uniqueDisplayName": "6MKUxP5R", "username": "9hdJKmbs"}' \
    > test.out 2>&1
eval_tap $? 283 'PublicValidateUserInput' test.out

#- 284 GetAdminInvitationV3
./ng net.accelbyte.sdk.cli.Main iam getAdminInvitationV3 \
    --invitationId '9VX5UHm6' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 284 'GetAdminInvitationV3' test.out

#- 285 CreateUserFromInvitationV3
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV3 \
    --invitationId 'nfdciZDK' \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "PWUwMZjh", "acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "cpcyK9vW", "policyId": "IqNKFerE", "policyVersionId": "jlst9qwo"}, {"isAccepted": true, "localizedPolicyVersionId": "HvuNJ49t", "policyId": "y0hgxwme", "policyVersionId": "YSY3U2hr"}, {"isAccepted": false, "localizedPolicyVersionId": "I9pwKkvJ", "policyId": "ANP4XZ4U", "policyVersionId": "ReGYAxjU"}], "authType": "teAGX1Jf", "code": "s8WG786b", "country": "bYKdO4fz", "dateOfBirth": "0QM66fc0", "displayName": "JEiczNLy", "emailAddress": "ziCKGFxJ", "password": "LGuI1D39", "reachMinimumAge": true, "uniqueDisplayName": "RDksHDUf"}' \
    > test.out 2>&1
eval_tap $? 285 'CreateUserFromInvitationV3' test.out

#- 286 UpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam updateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "AEoqUqzV", "country": "qysMicrg", "dateOfBirth": "KXmvLNDi", "displayName": "SwPS8o6k", "languageTag": "nEWi2FYh", "uniqueDisplayName": "R2MBe3PY", "userName": "WdmMNSPj"}' \
    > test.out 2>&1
eval_tap $? 286 'UpdateUserV3' test.out

#- 287 PublicPartialUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicPartialUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "jv5mDAiy", "country": "qxDC5piZ", "dateOfBirth": "VfpF5Yf1", "displayName": "y4RUJORt", "languageTag": "VPzMCaXM", "uniqueDisplayName": "bvrpWm4H", "userName": "rAJM4ZwS"}' \
    > test.out 2>&1
eval_tap $? 287 'PublicPartialUpdateUserV3' test.out

#- 288 PublicSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"context": "gKBp6QJX", "emailAddress": "M4A4KbA0", "languageTag": "mssdjujm", "upgradeToken": "v3uCy4Qj"}' \
    > test.out 2>&1
eval_tap $? 288 'PublicSendVerificationCodeV3' test.out

#- 289 PublicUserVerificationV3
./ng net.accelbyte.sdk.cli.Main iam publicUserVerificationV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "Y0iIKLV1", "contactType": "UnV687Wx", "languageTag": "5iwSjiVj", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 289 'PublicUserVerificationV3' test.out

#- 290 PublicUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "QirnfpqP", "country": "lYtHRVZR", "dateOfBirth": "vWIRZFMe", "displayName": "1QYPB8DD", "emailAddress": "W8j4x5mQ", "password": "Yc49GWe3", "uniqueDisplayName": "Z06mTxR4", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 290 'PublicUpgradeHeadlessAccountV3' test.out

#- 291 PublicVerifyHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --needVerificationCode  \
    --body '{"emailAddress": "anwSqaTm", "password": "AwtCI4wy"}' \
    > test.out 2>&1
eval_tap $? 291 'PublicVerifyHeadlessAccountV3' test.out

#- 292 PublicUpdatePasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicUpdatePasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"languageTag": "qxnZmtKD", "mfaToken": "SorZlOCD", "newPassword": "HyQN4BOu", "oldPassword": "FPBzusLJ"}' \
    > test.out 2>&1
eval_tap $? 292 'PublicUpdatePasswordV3' test.out

#- 293 PublicCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam publicCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'jbmI3z9d' \
    > test.out 2>&1
eval_tap $? 293 'PublicCreateJusticeUser' test.out

#- 294 PublicPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Ij2DoOi3' \
    --redirectUri 'IPcfTwNk' \
    --ticket 'KzT6DsYk' \
    > test.out 2>&1
eval_tap $? 294 'PublicPlatformLinkV3' test.out

#- 295 PublicPlatformUnlinkV3
eval_tap 0 295 'PublicPlatformUnlinkV3 # SKIP deprecated' test.out

#- 296 PublicPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Ej8hjiHx' \
    > test.out 2>&1
eval_tap $? 296 'PublicPlatformUnlinkAllV3' test.out

#- 297 PublicForcePlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicForcePlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '8gY7gDVT' \
    --ticket '9IV6a7IL' \
    > test.out 2>&1
eval_tap $? 297 'PublicForcePlatformLinkV3' test.out

#- 298 PublicWebLinkPlatform
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatform \
    --namespace "$AB_NAMESPACE" \
    --platformId 'qkSXcibh' \
    --clientId '0g45bNlL' \
    --redirectUri 'kHUyGpEp' \
    > test.out 2>&1
eval_tap $? 298 'PublicWebLinkPlatform' test.out

#- 299 PublicWebLinkPlatformEstablish
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatformEstablish \
    --namespace "$AB_NAMESPACE" \
    --platformId 'GWW6a6FY' \
    --code 'bkhUrKZL' \
    --state 'iTHljuPi' \
    > test.out 2>&1
eval_tap $? 299 'PublicWebLinkPlatformEstablish' test.out

#- 300 PublicProcessWebLinkPlatformV3
./ng net.accelbyte.sdk.cli.Main iam publicProcessWebLinkPlatformV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '7Jf491OY' \
    --code 'VMemmTXF' \
    --state 'Emhn4xqm' \
    > test.out 2>&1
eval_tap $? 300 'PublicProcessWebLinkPlatformV3' test.out

#- 301 PublicGetUsersPlatformInfosV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUsersPlatformInfosV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"platformId": "O8h5XVQV", "userIds": ["KiDdgAP2", "TDWOixiw", "TqDIlCrd"]}' \
    > test.out 2>&1
eval_tap $? 301 'PublicGetUsersPlatformInfosV3' test.out

#- 302 ResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam resetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientId": "giQFhwF4", "code": "sIpY39UV", "emailAddress": "ReC6eidd", "languageTag": "ayru4QcT", "newPassword": "rrBfhbr1"}' \
    > test.out 2>&1
eval_tap $? 302 'ResetPasswordV3' test.out

#- 303 PublicGetUserByUserIdV3
eval_tap 0 303 'PublicGetUserByUserIdV3 # SKIP deprecated' test.out

#- 304 PublicGetUserBanHistoryV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserBanHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'mVmfglTs' \
    --activeOnly  \
    --after 'dYGWKQVF' \
    --before 'Ok1trWYb' \
    --limit '95' \
    > test.out 2>&1
eval_tap $? 304 'PublicGetUserBanHistoryV3' test.out

#- 305 PublicListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'euvoQeoI' \
    > test.out 2>&1
eval_tap $? 305 'PublicListUserAllPlatformAccountsDistinctV3' test.out

#- 306 PublicGetUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'HvvKFDxv' \
    > test.out 2>&1
eval_tap $? 306 'PublicGetUserInformationV3' test.out

#- 307 PublicGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'PR7iUv9S' \
    --after '0.3800872442428248' \
    --before '0.775663841904502' \
    --limit '92' \
    > test.out 2>&1
eval_tap $? 307 'PublicGetUserLoginHistoriesV3' test.out

#- 308 PublicGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'z40Xjve3' \
    --after 'n3dMz0dy' \
    --before 'LqulTuXc' \
    --limit '32' \
    --platformId 'xqCtzvjM' \
    > test.out 2>&1
eval_tap $? 308 'PublicGetUserPlatformAccountsV3' test.out

#- 309 PublicListJusticePlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicListJusticePlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'BORc8irR' \
    > test.out 2>&1
eval_tap $? 309 'PublicListJusticePlatformAccountsV3' test.out

#- 310 PublicLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam publicLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'LDYf55cw' \
    --body '{"platformId": "HBIA3WZX", "platformUserId": "ysAFsV8i"}' \
    > test.out 2>&1
eval_tap $? 310 'PublicLinkPlatformAccount' test.out

#- 311 PublicForceLinkPlatformWithProgression
./ng net.accelbyte.sdk.cli.Main iam publicForceLinkPlatformWithProgression \
    --namespace "$AB_NAMESPACE" \
    --userId 'WZOTueUM' \
    --body '{"chosenNamespaces": ["nqEuoTy7", "1cF4CNQP", "aEOdZVWI"], "requestId": "Jp1x5fMk"}' \
    > test.out 2>&1
eval_tap $? 311 'PublicForceLinkPlatformWithProgression' test.out

#- 312 PublicGetPublisherUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetPublisherUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'jQB1myBB' \
    > test.out 2>&1
eval_tap $? 312 'PublicGetPublisherUserV3' test.out

#- 313 PublicValidateUserByUserIDAndPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserByUserIDAndPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'iddeZ2xK' \
    --password 'c1zdeMO7' \
    > test.out 2>&1
eval_tap $? 313 'PublicValidateUserByUserIDAndPasswordV3' test.out

#- 314 PublicGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRolesV3 \
    --after '7P4Qgwmm' \
    --before 'QExaAGxq' \
    --isWildcard  \
    --limit '74' \
    > test.out 2>&1
eval_tap $? 314 'PublicGetRolesV3' test.out

#- 315 PublicGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRoleV3 \
    --roleId 'Hj3udWrB' \
    > test.out 2>&1
eval_tap $? 315 'PublicGetRoleV3' test.out

#- 316 PublicGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyUserV3 \
    --includeAllPlatforms  \
    > test.out 2>&1
eval_tap $? 316 'PublicGetMyUserV3' test.out

#- 317 PublicSendCodeForwardV3
./ng net.accelbyte.sdk.cli.Main iam publicSendCodeForwardV3 \
    --body '{"context": "u7prs8vM", "emailAddress": "s0vqfkx2", "languageTag": "EVqpZ3f7", "upgradeToken": "ohUb3dPD"}' \
    > test.out 2>&1
eval_tap $? 317 'PublicSendCodeForwardV3' test.out

#- 318 PublicGetLinkHeadlessAccountToMyAccountConflictV3
./ng net.accelbyte.sdk.cli.Main iam publicGetLinkHeadlessAccountToMyAccountConflictV3 \
    --oneTimeLinkCode 'j2565dwL' \
    > test.out 2>&1
eval_tap $? 318 'PublicGetLinkHeadlessAccountToMyAccountConflictV3' test.out

#- 319 LinkHeadlessAccountToMyAccountV3
./ng net.accelbyte.sdk.cli.Main iam linkHeadlessAccountToMyAccountV3 \
    --body '{"chosenNamespaces": ["QEDHjJOo", "L1VW3tKt", "HG7ai0X6"], "oneTimeLinkCode": "2PFS0mtT"}' \
    > test.out 2>&1
eval_tap $? 319 'LinkHeadlessAccountToMyAccountV3' test.out

#- 320 PublicGetMyRedirectionAfterLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyRedirectionAfterLinkV3 \
    --oneTimeLinkCode 'QCAwLp0W' \
    > test.out 2>&1
eval_tap $? 320 'PublicGetMyRedirectionAfterLinkV3' test.out

#- 321 PublicGetMyProfileAllowUpdateStatusV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyProfileAllowUpdateStatusV3 \
    > test.out 2>&1
eval_tap $? 321 'PublicGetMyProfileAllowUpdateStatusV3' test.out

#- 322 PublicSendVerificationLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationLinkV3 \
    --body '{"languageTag": "4o9iMksw"}' \
    > test.out 2>&1
eval_tap $? 322 'PublicSendVerificationLinkV3' test.out

#- 323 PublicGetOpenidUserInfoV3
./ng net.accelbyte.sdk.cli.Main iam publicGetOpenidUserInfoV3 \
    > test.out 2>&1
eval_tap $? 323 'PublicGetOpenidUserInfoV3' test.out

#- 324 PublicVerifyUserByLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyUserByLinkV3 \
    --code '3PGzPK13' \
    > test.out 2>&1
eval_tap $? 324 'PublicVerifyUserByLinkV3' test.out

#- 325 PlatformAuthenticateSAMLV3Handler
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticateSAMLV3Handler \
    --platformId 'RhbFSAom' \
    --code 'j1NccZDC' \
    --error 'c6LbV9fh' \
    --state 'RB13BWnS' \
    > test.out 2>&1
eval_tap $? 325 'PlatformAuthenticateSAMLV3Handler' test.out

#- 326 LoginSSOClient
./ng net.accelbyte.sdk.cli.Main iam loginSSOClient \
    --platformId 'OJZDB0my' \
    --payload 'l9FhPwGz' \
    > test.out 2>&1
eval_tap $? 326 'LoginSSOClient' test.out

#- 327 LogoutSSOClient
./ng net.accelbyte.sdk.cli.Main iam logoutSSOClient \
    --platformId 'LMWj28y1' \
    > test.out 2>&1
eval_tap $? 327 'LogoutSSOClient' test.out

#- 328 RequestTargetTokenResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTargetTokenResponseV3 \
    --additionalData 'ELQP7CP9' \
    --code 'gdMqLqyW' \
    > test.out 2>&1
eval_tap $? 328 'RequestTargetTokenResponseV3' test.out

#- 329 UpgradeAndAuthenticateForwardV3
./ng net.accelbyte.sdk.cli.Main iam upgradeAndAuthenticateForwardV3 \
    --clientId '8CAJLhk3' \
    --upgradeSuccessToken '7qmZc6Ep' \
    > test.out 2>&1
eval_tap $? 329 'UpgradeAndAuthenticateForwardV3' test.out

#- 330 AdminListInvitationHistoriesV4
./ng net.accelbyte.sdk.cli.Main iam adminListInvitationHistoriesV4 \
    --limit '48' \
    --namespace "$AB_NAMESPACE" \
    --offset '1' \
    > test.out 2>&1
eval_tap $? 330 'AdminListInvitationHistoriesV4' test.out

#- 331 AdminGetDevicesByUserV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDevicesByUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '6m252Q4T' \
    > test.out 2>&1
eval_tap $? 331 'AdminGetDevicesByUserV4' test.out

#- 332 AdminGetBannedDevicesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedDevicesV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceType 'EQMCAsij' \
    --endDate 'J6PsgDJ8' \
    --limit '48' \
    --offset '71' \
    --startDate 'z2KN0lra' \
    > test.out 2>&1
eval_tap $? 332 'AdminGetBannedDevicesV4' test.out

#- 333 AdminGetUserDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeviceBansV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '9k6R3CKB' \
    > test.out 2>&1
eval_tap $? 333 'AdminGetUserDeviceBansV4' test.out

#- 334 AdminBanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminBanDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"comment": "q2JkUtR5", "deviceId": "VUaVR3tX", "deviceType": "jThV22MX", "enabled": true, "endDate": "hvHTsyf4", "ext": {"AVraX6lW": {}, "H1eWd4oj": {}, "4WmRUmI6": {}}, "reason": "U1StOFjw"}' \
    > test.out 2>&1
eval_tap $? 334 'AdminBanDeviceV4' test.out

#- 335 AdminGetDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBanV4 \
    --banId 'iVZgZffO' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 335 'AdminGetDeviceBanV4' test.out

#- 336 AdminUpdateDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateDeviceBanV4 \
    --banId 'f2wgh7S0' \
    --namespace "$AB_NAMESPACE" \
    --body '{"enabled": true}' \
    > test.out 2>&1
eval_tap $? 336 'AdminUpdateDeviceBanV4' test.out

#- 337 AdminGenerateReportV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateReportV4 \
    --namespace "$AB_NAMESPACE" \
    --endDate 'dFEKwFHH' \
    --startDate 'pqQZI2l2' \
    --deviceType 'xaOBGII9' \
    > test.out 2>&1
eval_tap $? 337 'AdminGenerateReportV4' test.out

#- 338 AdminGetDeviceTypesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceTypesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 338 'AdminGetDeviceTypesV4' test.out

#- 339 AdminGetDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBansV4 \
    --deviceId 'DwjAdpLi' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 339 'AdminGetDeviceBansV4' test.out

#- 340 AdminDecryptDeviceV4
eval_tap 0 340 'AdminDecryptDeviceV4 # SKIP deprecated' test.out

#- 341 AdminUnbanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminUnbanDeviceV4 \
    --deviceId 'XN3oQzwC' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 341 'AdminUnbanDeviceV4' test.out

#- 342 AdminGetUsersByDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUsersByDeviceV4 \
    --deviceId 'rIqPqXJE' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 342 'AdminGetUsersByDeviceV4' test.out

#- 343 AdminGetNamespaceInvitationHistoryV4
./ng net.accelbyte.sdk.cli.Main iam adminGetNamespaceInvitationHistoryV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 343 'AdminGetNamespaceInvitationHistoryV4' test.out

#- 344 AdminGetNamespaceUserInvitationHistoryV4
./ng net.accelbyte.sdk.cli.Main iam adminGetNamespaceUserInvitationHistoryV4 \
    --namespace "$AB_NAMESPACE" \
    --limit '4' \
    --offset '59' \
    > test.out 2>&1
eval_tap $? 344 'AdminGetNamespaceUserInvitationHistoryV4' test.out

#- 345 AdminCreateTestUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateTestUsersV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 73, "userInfo": {"country": "tosbo417"}}' \
    > test.out 2>&1
eval_tap $? 345 'AdminCreateTestUsersV4' test.out

#- 346 AdminCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "CtAl4Hta", "policyId": "VNAFZRRb", "policyVersionId": "ZNJfTcux"}, {"isAccepted": false, "localizedPolicyVersionId": "nRPynL4r", "policyId": "IFCjRA1g", "policyVersionId": "OR2d1boi"}, {"isAccepted": true, "localizedPolicyVersionId": "P0TvNLuj", "policyId": "PswjDzs6", "policyVersionId": "VAkYlD5f"}], "authType": "EMAILPASSWD", "code": "EbbD71HB", "country": "0JR0rU8r", "dateOfBirth": "t7nyJphL", "displayName": "lLnxKi3M", "emailAddress": "gWyLgS5F", "password": "dNoCPCVv", "passwordMD5Sum": "Ot7nIypR", "reachMinimumAge": false, "uniqueDisplayName": "r8hqDIES", "username": "1KQQzV7V"}' \
    > test.out 2>&1
eval_tap $? 346 'AdminCreateUserV4' test.out

#- 347 AdminBulkUpdateUserAccountTypeV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateUserAccountTypeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"testAccount": false, "userIds": ["KSmIP8JB", "TPN643Qa", "WBbubVim"]}' \
    > test.out 2>&1
eval_tap $? 347 'AdminBulkUpdateUserAccountTypeV4' test.out

#- 348 AdminBulkCheckValidUserIDV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkCheckValidUserIDV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["9SrKssCo", "A92Tc060", "8rxG0kbw"]}' \
    > test.out 2>&1
eval_tap $? 348 'AdminBulkCheckValidUserIDV4' test.out

#- 349 AdminUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'qrsNRxuz' \
    --body '{"avatarUrl": "E7pNduef", "country": "46m7pHfU", "dateOfBirth": "B41BZLwj", "displayName": "8DJpGiI0", "languageTag": "IlPPoQ6R", "skipLoginQueue": false, "uniqueDisplayName": "UC8w0eKU", "userName": "WV3OLCqc"}' \
    > test.out 2>&1
eval_tap $? 349 'AdminUpdateUserV4' test.out

#- 350 AdminUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Q6lSGD22' \
    --body '{"code": "mMoRtXVN", "emailAddress": "qKzSqd53"}' \
    > test.out 2>&1
eval_tap $? 350 'AdminUpdateUserEmailAddressV4' test.out

#- 351 AdminDisableUserMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableUserMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'q8wOiUzu' \
    --body '{"factor": "ccF9jwGR", "mfaToken": "KSt6pDkR"}' \
    > test.out 2>&1
eval_tap $? 351 'AdminDisableUserMFAV4' test.out

#- 352 AdminGetUserMFAStatusV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUserMFAStatusV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Wh4fp4Kw' \
    > test.out 2>&1
eval_tap $? 352 'AdminGetUserMFAStatusV4' test.out

#- 353 AdminListUserRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminListUserRolesV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'xgkwaBh1' \
    > test.out 2>&1
eval_tap $? 353 'AdminListUserRolesV4' test.out

#- 354 AdminUpdateUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ArvHOKL7' \
    --body '{"assignedNamespaces": ["TGKiJntZ", "IpJjaUWF", "Bd0KTpFD"], "roleId": "5ia5XGJM"}' \
    > test.out 2>&1
eval_tap $? 354 'AdminUpdateUserRoleV4' test.out

#- 355 AdminAddUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'sVzWdRAb' \
    --body '{"assignedNamespaces": ["s44feFEC", "PRUezhZe", "zupUsgaO"], "roleId": "3Sy5HJrt"}' \
    > test.out 2>&1
eval_tap $? 355 'AdminAddUserRoleV4' test.out

#- 356 AdminRemoveUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRemoveUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'XzLKlVjT' \
    --body '{"assignedNamespaces": ["iDukRTnn", "k77nXwF8", "l5Nt7oJY"], "roleId": "dVkn6W2x"}' \
    > test.out 2>&1
eval_tap $? 356 'AdminRemoveUserRoleV4' test.out

#- 357 AdminGetRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV4 \
    --adminRole  \
    --isWildcard  \
    --limit '60' \
    --offset '23' \
    > test.out 2>&1
eval_tap $? 357 'AdminGetRolesV4' test.out

#- 358 AdminCreateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV4 \
    --body '{"adminRole": false, "deletable": false, "isWildcard": true, "roleName": "wWB98Fzb"}' \
    > test.out 2>&1
eval_tap $? 358 'AdminCreateRoleV4' test.out

#- 359 AdminGetRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV4 \
    --roleId 'KpThmrgW' \
    > test.out 2>&1
eval_tap $? 359 'AdminGetRoleV4' test.out

#- 360 AdminDeleteRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV4 \
    --roleId '61qkI3CR' \
    > test.out 2>&1
eval_tap $? 360 'AdminDeleteRoleV4' test.out

#- 361 AdminUpdateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV4 \
    --roleId 'PMUwhxgN' \
    --body '{"adminRole": false, "deletable": false, "isWildcard": true, "roleName": "bwW2mivr"}' \
    > test.out 2>&1
eval_tap $? 361 'AdminUpdateRoleV4' test.out

#- 362 AdminUpdateRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV4 \
    --roleId '6jKi0hnS' \
    --body '{"permissions": [{"action": 97, "resource": "7OFuJr31", "schedAction": 34, "schedCron": "9ofHoPd2", "schedRange": ["8oSt26ss", "xlhTrmdw", "Qn8GyP5D"]}, {"action": 78, "resource": "pj9c0dY9", "schedAction": 57, "schedCron": "R3U49tsa", "schedRange": ["YQXfJoza", "QdTejAuQ", "Ciy3tmyB"]}, {"action": 37, "resource": "QcERik4W", "schedAction": 23, "schedCron": "8eqyrBxI", "schedRange": ["mMdDBhzW", "ffPxHtNV", "Gy4QhnrO"]}]}' \
    > test.out 2>&1
eval_tap $? 362 'AdminUpdateRolePermissionsV4' test.out

#- 363 AdminAddRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV4 \
    --roleId 'gBO3TeZo' \
    --body '{"permissions": [{"action": 69, "resource": "iRmmvnGj", "schedAction": 38, "schedCron": "7xpLlp6K", "schedRange": ["eeoHUY3h", "19QuXofQ", "JZRpqVRH"]}, {"action": 65, "resource": "Lj4WrWdm", "schedAction": 93, "schedCron": "Qh1cf6AK", "schedRange": ["pDqg280D", "G1rdKrw6", "91QOHgu3"]}, {"action": 68, "resource": "qyBxv2jy", "schedAction": 31, "schedCron": "rR3uRbtD", "schedRange": ["DPjUU2eQ", "Q6Kt90WP", "wb0iga4A"]}]}' \
    > test.out 2>&1
eval_tap $? 363 'AdminAddRolePermissionsV4' test.out

#- 364 AdminDeleteRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV4 \
    --roleId 'QycU1gGV' \
    --body '["VZCkWkMY", "0QeOa33s", "D3PXyjXl"]' \
    > test.out 2>&1
eval_tap $? 364 'AdminDeleteRolePermissionsV4' test.out

#- 365 AdminListAssignedUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminListAssignedUsersV4 \
    --roleId 'JzEHo2V7' \
    --after 'NqBzhaEY' \
    --before 'RWZ0xOGG' \
    --limit '46' \
    > test.out 2>&1
eval_tap $? 365 'AdminListAssignedUsersV4' test.out

#- 366 AdminAssignUserToRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAssignUserToRoleV4 \
    --roleId 'K5vX2m40' \
    --body '{"assignedNamespaces": ["XdHMx1zZ", "uN7XP3X8", "K51Fwqoj"], "namespace": "h2LPq57C", "userId": "8rv4xYuE"}' \
    > test.out 2>&1
eval_tap $? 366 'AdminAssignUserToRoleV4' test.out

#- 367 AdminRevokeUserFromRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRevokeUserFromRoleV4 \
    --roleId 'HywrvQrs' \
    --body '{"namespace": "dQf1TUvQ", "userId": "PwG562nV"}' \
    > test.out 2>&1
eval_tap $? 367 'AdminRevokeUserFromRoleV4' test.out

#- 368 AdminInviteUserNewV4
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserNewV4 \
    --body '{"assignedNamespaces": ["wiqnQU0M", "149c8Ygu", "f8X2v47m"], "emailAddresses": ["Smz4HpQ8", "Ab5Zp9Ty", "cAgVevPL"], "isAdmin": true, "isNewStudio": false, "languageTag": "O455OVm9", "namespace": "3uPlC2sA", "roleId": "9jqrcWyn"}' \
    > test.out 2>&1
eval_tap $? 368 'AdminInviteUserNewV4' test.out

#- 369 AdminUpdateMyUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateMyUserV4 \
    --body '{"avatarUrl": "AJEHAb9U", "country": "xJGyHL9F", "dateOfBirth": "t9nRR5zO", "displayName": "BeCqqyK4", "languageTag": "eW6CtUJD", "skipLoginQueue": false, "uniqueDisplayName": "rq3GChSH", "userName": "4W6foc6d"}' \
    > test.out 2>&1
eval_tap $? 369 'AdminUpdateMyUserV4' test.out

#- 370 AdminDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyAuthenticatorV4 \
    --body '{"factor": "aa2mFdIn", "mfaToken": "7xm6emqw"}' \
    > test.out 2>&1
eval_tap $? 370 'AdminDisableMyAuthenticatorV4' test.out

#- 371 AdminEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyAuthenticatorV4 \
    --code '8K2qdWnG' \
    > test.out 2>&1
eval_tap $? 371 'AdminEnableMyAuthenticatorV4' test.out

#- 372 AdminGenerateMyAuthenticatorKeyV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateMyAuthenticatorKeyV4 \
    > test.out 2>&1
eval_tap $? 372 'AdminGenerateMyAuthenticatorKeyV4' test.out

#- 373 AdminGetMyBackupCodesV4
eval_tap 0 373 'AdminGetMyBackupCodesV4 # SKIP deprecated' test.out

#- 374 AdminGenerateMyBackupCodesV4
eval_tap 0 374 'AdminGenerateMyBackupCodesV4 # SKIP deprecated' test.out

#- 375 AdminDisableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyBackupCodesV4 \
    --body '{"factor": "VRvWdrg9", "mfaToken": "84XqRLCi"}' \
    > test.out 2>&1
eval_tap $? 375 'AdminDisableMyBackupCodesV4' test.out

#- 376 AdminDownloadMyBackupCodesV4
eval_tap 0 376 'AdminDownloadMyBackupCodesV4 # SKIP deprecated' test.out

#- 377 AdminEnableMyBackupCodesV4
eval_tap 0 377 'AdminEnableMyBackupCodesV4 # SKIP deprecated' test.out

#- 378 AdminGetBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBackupCodesV4 \
    --languageTag 'Io5clD3k' \
    > test.out 2>&1
eval_tap $? 378 'AdminGetBackupCodesV4' test.out

#- 379 AdminGenerateBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateBackupCodesV4 \
    --languageTag 'XPekONtD' \
    > test.out 2>&1
eval_tap $? 379 'AdminGenerateBackupCodesV4' test.out

#- 380 AdminEnableBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableBackupCodesV4 \
    --languageTag '3GAHKnat' \
    > test.out 2>&1
eval_tap $? 380 'AdminEnableBackupCodesV4' test.out

#- 381 AdminChallengeMyMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminChallengeMyMFAV4 \
    --code 'g9jf4hvj' \
    --factor 'vaKGV5sG' \
    > test.out 2>&1
eval_tap $? 381 'AdminChallengeMyMFAV4' test.out

#- 382 AdminSendMyMFAEmailCodeV4
./ng net.accelbyte.sdk.cli.Main iam adminSendMyMFAEmailCodeV4 \
    --action 'DmbHUIEk' \
    --languageTag 'Br3y2hJH' \
    > test.out 2>&1
eval_tap $? 382 'AdminSendMyMFAEmailCodeV4' test.out

#- 383 AdminDisableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyEmailV4 \
    --body '{"factor": "SlBbkSRK", "mfaToken": "oFLbNwuC"}' \
    > test.out 2>&1
eval_tap $? 383 'AdminDisableMyEmailV4' test.out

#- 384 AdminEnableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyEmailV4 \
    --code 'qEyrwKmQ' \
    > test.out 2>&1
eval_tap $? 384 'AdminEnableMyEmailV4' test.out

#- 385 AdminGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyEnabledFactorsV4 \
    > test.out 2>&1
eval_tap $? 385 'AdminGetMyEnabledFactorsV4' test.out

#- 386 AdminMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam adminMakeFactorMyDefaultV4 \
    --factor 'f0sBQIrI' \
    > test.out 2>&1
eval_tap $? 386 'AdminMakeFactorMyDefaultV4' test.out

#- 387 AdminGetMyOwnMFAStatusV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyOwnMFAStatusV4 \
    > test.out 2>&1
eval_tap $? 387 'AdminGetMyOwnMFAStatusV4' test.out

#- 388 AdminGetMyMFAStatusV4
eval_tap 0 388 'AdminGetMyMFAStatusV4 # SKIP deprecated' test.out

#- 389 AdminInviteUserV4
eval_tap 0 389 'AdminInviteUserV4 # SKIP deprecated' test.out

#- 390 AuthenticationWithPlatformLinkV4
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV4 \
    --extendExp  \
    --clientId 'LEYwdUa5' \
    --linkingToken 'Puh43dTC' \
    --password 'eaeNkeuO' \
    --username 'dGx75gQX' \
    > test.out 2>&1
eval_tap $? 390 'AuthenticationWithPlatformLinkV4' test.out

#- 391 GenerateTokenByNewHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV4 \
    --additionalData 'LYf1tyRT' \
    --extendExp  \
    --linkingToken '3l9ks8sS' \
    > test.out 2>&1
eval_tap $? 391 'GenerateTokenByNewHeadlessAccountV4' test.out

#- 392 Verify2faCodeV4
./ng net.accelbyte.sdk.cli.Main iam verify2faCodeV4 \
    --code 'rEyCQ5LC' \
    --factor 'mSSVJNBY' \
    --mfaToken 'opfhs1GR' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 392 'Verify2faCodeV4' test.out

#- 393 PlatformTokenGrantV4
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV4 \
    --platformId 'L7kN4F9s' \
    --codeChallenge 'qAcQTkLk' \
    --codeChallengeMethod 'S256' \
    --additionalData 'iLHaaBOW' \
    --clientId '0XOGFS1K' \
    --createHeadless  \
    --deviceId 'ory8b1ON' \
    --macAddress 'szFEO2g1' \
    --platformToken 'zSRXemdI' \
    --serviceLabel '0.06764117402509917' \
    --skipSetCookie  \
    > test.out 2>&1
eval_tap $? 393 'PlatformTokenGrantV4' test.out

#- 394 SimultaneousLoginV4
./ng net.accelbyte.sdk.cli.Main iam simultaneousLoginV4 \
    --codeChallenge 'G6S3AUAc' \
    --codeChallengeMethod 'plain' \
    --simultaneousPlatform 'CsTfegSL' \
    --simultaneousTicket 'kYQluO2X' \
    --nativePlatform 'epicgames' \
    --nativePlatformTicket '2HcUo9lJ' \
    > test.out 2>&1
eval_tap $? 394 'SimultaneousLoginV4' test.out

#- 395 TokenGrantV4
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV4 \
    --codeChallenge '9KBe55Ud' \
    --codeChallengeMethod 'plain' \
    --additionalData 'Np2urdSD' \
    --clientId '0w5e6Xav' \
    --clientSecret 'SHvVBYXk' \
    --code 'pYC1gEXk' \
    --codeVerifier '2u5ZdWZA' \
    --extendNamespace 'Tw9txLHk' \
    --extendExp  \
    --loginQueueTicket 'iwyDzMLW' \
    --password 'FTIUpDRG' \
    --redirectUri 'N6EUKWAR' \
    --refreshToken '70YG4qIB' \
    --username 'FgpsjnCG' \
    --grantType 'authorization_code' \
    > test.out 2>&1
eval_tap $? 395 'TokenGrantV4' test.out

#- 396 RequestTargetTokenResponseV4
./ng net.accelbyte.sdk.cli.Main iam requestTargetTokenResponseV4 \
    --additionalData '60yxQWMn' \
    --code 'Eh4lU8Wr' \
    > test.out 2>&1
eval_tap $? 396 'RequestTargetTokenResponseV4' test.out

#- 397 PublicListUserIDByPlatformUserIDsV4
./ng net.accelbyte.sdk.cli.Main iam publicListUserIDByPlatformUserIDsV4 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Cz2IPBLl' \
    --rawPUID  \
    --body '{"pidType": "mRWHLqn3", "platformUserIds": ["ZjqpV4Ui", "Hg5D9pyL", "Bsz0Cdu3"]}' \
    > test.out 2>&1
eval_tap $? 397 'PublicListUserIDByPlatformUserIDsV4' test.out

#- 398 PublicGetUserByPlatformUserIDV4
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByPlatformUserIDV4 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'zMZNrArn' \
    --platformUserId '8K2wnqJS' \
    > test.out 2>&1
eval_tap $? 398 'PublicGetUserByPlatformUserIDV4' test.out

#- 399 PublicCreateTestUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateTestUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "PU6qZli8", "policyId": "pXwCHDK8", "policyVersionId": "Fp189d6U"}, {"isAccepted": true, "localizedPolicyVersionId": "B0XkKwO9", "policyId": "y4NRPltV", "policyVersionId": "lIjpmBIY"}, {"isAccepted": false, "localizedPolicyVersionId": "lxvvQDu2", "policyId": "KAjZV3R7", "policyVersionId": "iLy7RN4R"}], "authType": "EMAILPASSWD", "country": "pdVwqxX0", "dateOfBirth": "Gd2icBGZ", "displayName": "Lxa4JE0p", "emailAddress": "iA6krZQ5", "password": "rSzovZoU", "passwordMD5Sum": "ipaSjtX1", "uniqueDisplayName": "ipzRW2kB", "username": "lh0PbIvl", "verified": true}' \
    > test.out 2>&1
eval_tap $? 399 'PublicCreateTestUserV4' test.out

#- 400 PublicCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "Y00rkI7l", "policyId": "nbS1UpMI", "policyVersionId": "AwMJaOVq"}, {"isAccepted": true, "localizedPolicyVersionId": "jMMv0TJh", "policyId": "zFDfakj5", "policyVersionId": "QuLbPxhb"}, {"isAccepted": false, "localizedPolicyVersionId": "iFvqektd", "policyId": "mjdZKzUn", "policyVersionId": "RssfmeoI"}], "authType": "EMAILPASSWD", "code": "FY9QwL1A", "country": "j4mvER5W", "dateOfBirth": "XqvaazLT", "displayName": "rgcbfyxm", "emailAddress": "jwTBViYW", "password": "ENl4kisy", "passwordMD5Sum": "O5ATuHnL", "reachMinimumAge": false, "uniqueDisplayName": "91z84tvy", "username": "5lbTHE3O"}' \
    > test.out 2>&1
eval_tap $? 400 'PublicCreateUserV4' test.out

#- 401 CreateUserFromInvitationV4
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV4 \
    --invitationId '0happWM5' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "B4uHF2rW", "policyId": "602Oi9OZ", "policyVersionId": "sEI3Q4yq"}, {"isAccepted": false, "localizedPolicyVersionId": "blDgOtHb", "policyId": "FigqUuWb", "policyVersionId": "MKR68JBR"}, {"isAccepted": true, "localizedPolicyVersionId": "gcrYnis3", "policyId": "JEaSjBxC", "policyVersionId": "zjwoUql8"}], "authType": "EMAILPASSWD", "code": "i3eiJYkZ", "country": "PwI6TcKz", "dateOfBirth": "nlSgTQoW", "displayName": "bXzU3z2i", "emailAddress": "sZuwzS9Y", "password": "elf3mttZ", "passwordMD5Sum": "uSP4kNbY", "reachMinimumAge": true, "uniqueDisplayName": "jgFiTNNB", "username": "FJrRvRWR"}' \
    > test.out 2>&1
eval_tap $? 401 'CreateUserFromInvitationV4' test.out

#- 402 PublicUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "j15OsluQ", "country": "ZgJXYr6B", "dateOfBirth": "snhvEmaq", "displayName": "3RIEEKf7", "languageTag": "4Lvi045q", "uniqueDisplayName": "QQLNoyVy", "userName": "nuDG7QR6"}' \
    > test.out 2>&1
eval_tap $? 402 'PublicUpdateUserV4' test.out

#- 403 PublicUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "9xABFbac", "emailAddress": "0M2oIG7s"}' \
    > test.out 2>&1
eval_tap $? 403 'PublicUpdateUserEmailAddressV4' test.out

#- 404 PublicUpgradeHeadlessAccountWithVerificationCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountWithVerificationCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "7pXGeI0X", "country": "qGgN0Ft9", "dateOfBirth": "o1bXg5TQ", "displayName": "ccqtYLou", "emailAddress": "NSjm3Ung", "password": "rreOhkOL", "reachMinimumAge": true, "uniqueDisplayName": "ytMw9kyQ", "username": "6BjQadwj", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 404 'PublicUpgradeHeadlessAccountWithVerificationCodeV4' test.out

#- 405 PublicUpgradeHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"dateOfBirth": "mwa7en1m", "displayName": "Q2YRp3kJ", "emailAddress": "nMGS2dUU", "password": "HcFy2U1T", "uniqueDisplayName": "BKjvgVtS", "username": "ik0bVBJu"}' \
    > test.out 2>&1
eval_tap $? 405 'PublicUpgradeHeadlessAccountV4' test.out

#- 406 PublicDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"factor": "GNZBxqTA", "mfaToken": "eKQaiBUT"}' \
    > test.out 2>&1
eval_tap $? 406 'PublicDisableMyAuthenticatorV4' test.out

#- 407 PublicEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'rZ5aTTjD' \
    > test.out 2>&1
eval_tap $? 407 'PublicEnableMyAuthenticatorV4' test.out

#- 408 PublicGenerateMyAuthenticatorKeyV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateMyAuthenticatorKeyV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 408 'PublicGenerateMyAuthenticatorKeyV4' test.out

#- 409 PublicGetMyBackupCodesV4
eval_tap 0 409 'PublicGetMyBackupCodesV4 # SKIP deprecated' test.out

#- 410 PublicGenerateMyBackupCodesV4
eval_tap 0 410 'PublicGenerateMyBackupCodesV4 # SKIP deprecated' test.out

#- 411 PublicDisableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"factor": "kVWDrv0x", "mfaToken": "SvEjlCdP"}' \
    > test.out 2>&1
eval_tap $? 411 'PublicDisableMyBackupCodesV4' test.out

#- 412 PublicDownloadMyBackupCodesV4
eval_tap 0 412 'PublicDownloadMyBackupCodesV4 # SKIP deprecated' test.out

#- 413 PublicEnableMyBackupCodesV4
eval_tap 0 413 'PublicEnableMyBackupCodesV4 # SKIP deprecated' test.out

#- 414 PublicGetBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGetBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --languageTag 'Pdfejooz' \
    > test.out 2>&1
eval_tap $? 414 'PublicGetBackupCodesV4' test.out

#- 415 PublicGenerateBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --languageTag 'mdULcPsB' \
    > test.out 2>&1
eval_tap $? 415 'PublicGenerateBackupCodesV4' test.out

#- 416 PublicEnableBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --languageTag 'SnmvQez3' \
    > test.out 2>&1
eval_tap $? 416 'PublicEnableBackupCodesV4' test.out

#- 417 PublicChallengeMyMFAV4
./ng net.accelbyte.sdk.cli.Main iam publicChallengeMyMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'QLIwLSsS' \
    --factor 'SNsLreNJ' \
    > test.out 2>&1
eval_tap $? 417 'PublicChallengeMyMFAV4' test.out

#- 418 PublicRemoveTrustedDeviceV4
./ng net.accelbyte.sdk.cli.Main iam publicRemoveTrustedDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceToken 'LRiovPn1' \
    > test.out 2>&1
eval_tap $? 418 'PublicRemoveTrustedDeviceV4' test.out

#- 419 PublicSendMyMFAEmailCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicSendMyMFAEmailCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --action 'UTzCMav3' \
    --languageTag 'o18vstnr' \
    > test.out 2>&1
eval_tap $? 419 'PublicSendMyMFAEmailCodeV4' test.out

#- 420 PublicDisableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyEmailV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"factor": "tocaXFGf", "mfaToken": "WnI4mstz"}' \
    > test.out 2>&1
eval_tap $? 420 'PublicDisableMyEmailV4' test.out

#- 421 PublicEnableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyEmailV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'mzpvggGo' \
    > test.out 2>&1
eval_tap $? 421 'PublicEnableMyEmailV4' test.out

#- 422 PublicGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam publicGetMyEnabledFactorsV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 422 'PublicGetMyEnabledFactorsV4' test.out

#- 423 PublicMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam publicMakeFactorMyDefaultV4 \
    --namespace "$AB_NAMESPACE" \
    --factor 'aSPlXcAx' \
    > test.out 2>&1
eval_tap $? 423 'PublicMakeFactorMyDefaultV4' test.out

#- 424 PublicGetMyOwnMFAStatusV4
./ng net.accelbyte.sdk.cli.Main iam publicGetMyOwnMFAStatusV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 424 'PublicGetMyOwnMFAStatusV4' test.out

#- 425 PublicGetMyMFAStatusV4
eval_tap 0 425 'PublicGetMyMFAStatusV4 # SKIP deprecated' test.out

#- 426 PublicGetUserPublicInfoByUserIdV4
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPublicInfoByUserIdV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'VBIpFh9H' \
    > test.out 2>&1
eval_tap $? 426 'PublicGetUserPublicInfoByUserIdV4' test.out

#- 427 PublicInviteUserV4
./ng net.accelbyte.sdk.cli.Main iam publicInviteUserV4 \
    --body '{"additionalData": "tLRvAb0e", "emailAddress": "e8gdWTPn", "languageTag": "iMpZRiea", "namespace": "p2zXXgK5", "namespaceDisplayName": "bhw38Dma"}' \
    > test.out 2>&1
eval_tap $? 427 'PublicInviteUserV4' test.out

#- 428 PublicUpgradeHeadlessWithCodeV4Forward
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessWithCodeV4Forward \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "XxFOG7JD", "policyId": "TRVHqZn1", "policyVersionId": "6PirX6dA"}, {"isAccepted": true, "localizedPolicyVersionId": "GmA3OJaX", "policyId": "h2Ww2w2Y", "policyVersionId": "1yrRyGQI"}, {"isAccepted": false, "localizedPolicyVersionId": "elhg2a4e", "policyId": "qFZnU7bF", "policyVersionId": "3IvvBYhE"}], "code": "bSTU6Qk2", "country": "jk321qGR", "dateOfBirth": "JRBgDP0g", "displayName": "Kj4fXd71", "emailAddress": "F6aNg516", "password": "eOGPnrdj", "reachMinimumAge": true, "uniqueDisplayName": "r5L1E9Ok", "username": "EOMGJw6s", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 428 'PublicUpgradeHeadlessWithCodeV4Forward' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
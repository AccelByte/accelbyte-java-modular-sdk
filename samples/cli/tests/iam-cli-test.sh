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
    --body '{"modules": [{"docLink": "t8UPCONx", "groups": [{"group": "sVXPqT1B", "groupId": "kDdQSDLv", "permissions": [{"allowedActions": [24, 82, 47], "resource": "CyAajWh5"}, {"allowedActions": [20, 25, 85], "resource": "ptoCy2oO"}, {"allowedActions": [63, 44, 2], "resource": "EPpb9qD7"}]}, {"group": "6q47yyeM", "groupId": "0ZgiPLqA", "permissions": [{"allowedActions": [55, 43, 53], "resource": "MjnC5zni"}, {"allowedActions": [54, 71, 84], "resource": "XLwCE4fC"}, {"allowedActions": [35, 96, 64], "resource": "53sUfRcm"}]}, {"group": "tXoiCvO0", "groupId": "79IGwdnw", "permissions": [{"allowedActions": [19, 87, 82], "resource": "a81DfIFp"}, {"allowedActions": [24, 73, 39], "resource": "O0hsFWDu"}, {"allowedActions": [47, 73, 42], "resource": "cMKGe1AH"}]}], "module": "KQrYK5ea", "moduleId": "82RCfIFa"}, {"docLink": "Kv5LN8Iz", "groups": [{"group": "6tCpjlWf", "groupId": "8HWMmCXQ", "permissions": [{"allowedActions": [2, 45, 24], "resource": "s62vMG19"}, {"allowedActions": [26, 89, 50], "resource": "UFbTebYb"}, {"allowedActions": [15, 50, 37], "resource": "MYZFcRzs"}]}, {"group": "ktsrGUeC", "groupId": "wDRgB5IY", "permissions": [{"allowedActions": [31, 36, 21], "resource": "qb64WpjD"}, {"allowedActions": [72, 49, 10], "resource": "FGw4S9HL"}, {"allowedActions": [9, 56, 52], "resource": "T0O5qgXx"}]}, {"group": "hJ0YFSJc", "groupId": "ew3sljvZ", "permissions": [{"allowedActions": [97, 93, 25], "resource": "cU3BrKqQ"}, {"allowedActions": [32, 23, 82], "resource": "TFTeiaYP"}, {"allowedActions": [63, 7, 62], "resource": "JUq5XEEe"}]}], "module": "vyz5z7ZD", "moduleId": "CBIPltoY"}, {"docLink": "DEa78VOm", "groups": [{"group": "uezBugrB", "groupId": "CXHQN8oP", "permissions": [{"allowedActions": [87, 73, 83], "resource": "Rhl3HCQy"}, {"allowedActions": [90, 68, 81], "resource": "6yW5p2cE"}, {"allowedActions": [16, 45, 95], "resource": "wLlk7PbB"}]}, {"group": "MdwbT6di", "groupId": "VdUbuEWx", "permissions": [{"allowedActions": [80, 57, 85], "resource": "pbEIaYQy"}, {"allowedActions": [63, 72, 42], "resource": "zlSZH066"}, {"allowedActions": [95, 38, 29], "resource": "wZeh3ZSF"}]}, {"group": "SX7HxYo5", "groupId": "ImaAQaMg", "permissions": [{"allowedActions": [82, 72, 66], "resource": "1NkAgeoQ"}, {"allowedActions": [63, 47, 78], "resource": "91RM2v2z"}, {"allowedActions": [82, 22, 5], "resource": "nkLbTt8c"}]}], "module": "KCEFWhux", "moduleId": "RVGUhs8C"}]}' \
    > test.out 2>&1
eval_tap $? 109 'AdminUpdateAvailablePermissionsByModule' test.out

#- 110 AdminDeleteConfigPermissionsByGroup
./ng net.accelbyte.sdk.cli.Main iam adminDeleteConfigPermissionsByGroup \
    --forceDelete  \
    --body '{"groupId": "KEAZGKOq", "moduleId": "aQ8zcMtg"}' \
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
    --body '[{"field": "mzY0IUXV", "validation": {"allowAllSpecialCharacters": true, "allowDigit": false, "allowLetter": true, "allowSpace": true, "allowUnicode": false, "avatarConfig": {"allowedPrefixes": ["muaQGvb7", "MZDzZ2mm", "kMtgKjVl"], "preferRegex": true, "regex": "DX4bQPFO"}, "blockedWord": ["Z59YLLX5", "dKA6bxZ7", "IrhPDlgL"], "description": [{"language": "922nTxdD", "message": ["05dKdf5i", "fX2YMWx0", "ZsqwJ143"]}, {"language": "DZKkRJRd", "message": ["4tp7fbAW", "C5sBCydR", "HSxQOj35"]}, {"language": "W7DCLBFB", "message": ["czmivaDf", "MUUJytvX", "kTxHf875"]}], "isCustomRegex": false, "letterCase": "5eSUbwXu", "maxLength": 92, "maxRepeatingAlphaNum": 92, "maxRepeatingSpecialCharacter": 74, "minCharType": 68, "minLength": 67, "regex": "Duiaos1Y", "specialCharacterLocation": "IZC0fIg3", "specialCharacters": ["NpTrI8F7", "QjOZ9Om2", "iR3UFXZa"]}}, {"field": "giTpTPmW", "validation": {"allowAllSpecialCharacters": true, "allowDigit": true, "allowLetter": true, "allowSpace": false, "allowUnicode": false, "avatarConfig": {"allowedPrefixes": ["auXxRovO", "1utvZzdn", "VhFkE27M"], "preferRegex": true, "regex": "wC2odMgI"}, "blockedWord": ["3BsVO46V", "kOTZq6Qq", "OSC8gn0u"], "description": [{"language": "lU9DIfTW", "message": ["233hit6P", "M8gq8gRZ", "H9Hofv2r"]}, {"language": "Dge1ITHW", "message": ["tqJ04z6h", "7upWBHjc", "jgSZWddJ"]}, {"language": "WB4zyFdc", "message": ["UNWxL0Vx", "8XKC3jYw", "h94eGspz"]}], "isCustomRegex": false, "letterCase": "oI6T8l6m", "maxLength": 32, "maxRepeatingAlphaNum": 44, "maxRepeatingSpecialCharacter": 91, "minCharType": 79, "minLength": 41, "regex": "6GVT9hpx", "specialCharacterLocation": "unEIu8IJ", "specialCharacters": ["BjEucJHD", "X8OUY781", "66Vhs0SK"]}}, {"field": "3MUSLh3z", "validation": {"allowAllSpecialCharacters": false, "allowDigit": true, "allowLetter": true, "allowSpace": true, "allowUnicode": false, "avatarConfig": {"allowedPrefixes": ["7kiy6zFr", "l4v12wMj", "9bH16SpD"], "preferRegex": false, "regex": "TR1rCYmz"}, "blockedWord": ["eDaHob9w", "YFCa6EoY", "N55DZ3hH"], "description": [{"language": "PQe7AOOt", "message": ["AG6poE42", "nIo2HisG", "4vEPho8V"]}, {"language": "0FZ5UDRJ", "message": ["7CaHOcBI", "3eozruGE", "w8H0EbiO"]}, {"language": "cncTodyW", "message": ["Uhx1xjSu", "3nwLt31j", "AF8FIkXo"]}], "isCustomRegex": false, "letterCase": "g40q8YKe", "maxLength": 99, "maxRepeatingAlphaNum": 74, "maxRepeatingSpecialCharacter": 70, "minCharType": 8, "minLength": 38, "regex": "g80IbveR", "specialCharacterLocation": "XWKSuMTW", "specialCharacters": ["XSReeK9H", "59JM90vC", "2pFA0M5A"]}}]' \
    > test.out 2>&1
eval_tap $? 113 'AdminUpdateInputValidations' test.out

#- 114 AdminResetInputValidations
./ng net.accelbyte.sdk.cli.Main iam adminResetInputValidations \
    --field 'TjQ5vJkr' \
    > test.out 2>&1
eval_tap $? 114 'AdminResetInputValidations' test.out

#- 115 ListAdminsV3
./ng net.accelbyte.sdk.cli.Main iam listAdminsV3 \
    --namespace "$AB_NAMESPACE" \
    --after '5j4uIvGl' \
    --before '5Pf0QsyP' \
    --endDate '3cYEqoWI' \
    --limit '2' \
    --query 'e5q2YZmV' \
    --roleId 'bUkD2rvb' \
    --startDate '9jZljQcz' \
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
    --body '{"ageRestriction": 39, "enable": true}' \
    > test.out 2>&1
eval_tap $? 117 'AdminUpdateAgeRestrictionConfigV3' test.out

#- 118 AdminGetListCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminGetListCountryAgeRestrictionV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 118 'AdminGetListCountryAgeRestrictionV3' test.out

#- 119 AdminUpdateCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateCountryAgeRestrictionV3 \
    --countryCode 'tK0r5hoA' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ageRestriction": 69}' \
    > test.out 2>&1
eval_tap $? 119 'AdminUpdateCountryAgeRestrictionV3' test.out

#- 120 AdminGetBannedUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType 'HvExo23y' \
    --limit '45' \
    --offset '47' \
    > test.out 2>&1
eval_tap $? 120 'AdminGetBannedUsersV3' test.out

#- 121 AdminBanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"ban": "40Q4qK5i", "comment": "dMCNeC3P", "endDate": "duvnVTDb", "reason": "yE1h3r1O", "skipNotif": true, "userIds": ["sstn7UcM", "fH2MQ5QL", "yz47EGBu"]}' \
    > test.out 2>&1
eval_tap $? 121 'AdminBanUserBulkV3' test.out

#- 122 AdminUnbanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminUnbanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"bans": [{"banId": "riDdkOcu", "userId": "hpYoymoM"}, {"banId": "6FFxKXYM", "userId": "9CGGJRuJ"}, {"banId": "v4JZ2ONk", "userId": "7c7ELeUF"}]}' \
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
    --clientId 'JiSMwXcf' \
    --clientName 'LvnP4h2M' \
    --clientType '5gmUK3Id' \
    --limit '26' \
    --offset '63' \
    --skipLoginQueue  \
    > test.out 2>&1
eval_tap $? 124 'AdminGetClientsByNamespaceV3' test.out

#- 125 AdminBulkUpdateClientsV3
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateClientsV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientIds": ["felw7Uzy", "7VyyCAUw", "6Iafnoeh"], "clientUpdateRequest": {"audiences": ["Rs6kFlhK", "IcQphF2W", "7XTxJwMa"], "baseUri": "k3A5QtKG", "clientName": "YtIWnJSG", "clientPermissions": [{"action": 33, "resource": "MzndLuG8", "schedAction": 8, "schedCron": "WIukaQUC", "schedRange": ["AveVm90G", "HSgM8j2C", "MzE42J88"]}, {"action": 7, "resource": "l8C1ZkVL", "schedAction": 48, "schedCron": "LKCSuo0b", "schedRange": ["nrIyGMWC", "Y8WKektH", "6VO74aDF"]}, {"action": 23, "resource": "h9umQUa4", "schedAction": 41, "schedCron": "TpO73TVJ", "schedRange": ["v8Yndf25", "bolhWGl3", "mEoRQM8d"]}], "clientPlatform": "IGAnP6My", "deletable": false, "description": "1fVSbCXd", "modulePermissions": [{"moduleId": "zdgyVnQn", "selectedGroups": [{"groupId": "Nzu6ADuz", "selectedActions": [95, 77, 35]}, {"groupId": "rVL9UvTe", "selectedActions": [95, 77, 76]}, {"groupId": "63c2pzqK", "selectedActions": [13, 28, 47]}]}, {"moduleId": "nHtk8Mjz", "selectedGroups": [{"groupId": "ysVpJ0su", "selectedActions": [6, 2, 47]}, {"groupId": "BVlo9OBT", "selectedActions": [57, 97, 52]}, {"groupId": "BUXJH84O", "selectedActions": [35, 4, 53]}]}, {"moduleId": "jrGrlF8F", "selectedGroups": [{"groupId": "GeeiGI6z", "selectedActions": [26, 13, 10]}, {"groupId": "OW0yyLhx", "selectedActions": [19, 80, 55]}, {"groupId": "zniCm8gF", "selectedActions": [99, 22, 81]}]}], "namespace": "xry6Y7s3", "oauthAccessTokenExpiration": 38, "oauthAccessTokenExpirationTimeUnit": "2yZCU7Hn", "oauthRefreshTokenExpiration": 88, "oauthRefreshTokenExpirationTimeUnit": "6XytQRNI", "redirectUri": "xgkchfeS", "scopes": ["tIsgRkQH", "GarLIu3y", "dYs3JkAe"], "skipLoginQueue": false, "twoFactorEnabled": false}}' \
    > test.out 2>&1
eval_tap $? 125 'AdminBulkUpdateClientsV3' test.out

#- 126 AdminCreateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateClientV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["KAOUTngi", "NFSw60dv", "Os7x3meX"], "baseUri": "WOIQVKA4", "clientId": "J9warsX0", "clientName": "1QAuyqc3", "clientPermissions": [{"action": 43, "resource": "twp3faYJ", "schedAction": 12, "schedCron": "cTVFadLb", "schedRange": ["jLjEYAdw", "e3lTWvsF", "eB70yL66"]}, {"action": 79, "resource": "84pc7Jwx", "schedAction": 73, "schedCron": "ARQ145wz", "schedRange": ["rC0V6i4d", "fqa1xzrs", "hhGIKIok"]}, {"action": 28, "resource": "hyJGB1kR", "schedAction": 20, "schedCron": "qyaaykqy", "schedRange": ["KLBk4BmP", "wYpYPooA", "GAvtJM60"]}], "clientPlatform": "EKDgz1TK", "deletable": true, "description": "M65PtGGo", "modulePermissions": [{"moduleId": "jQoPiBhG", "selectedGroups": [{"groupId": "4oOaUckr", "selectedActions": [56, 15, 28]}, {"groupId": "N4olU5qT", "selectedActions": [50, 76, 65]}, {"groupId": "F3NMtgNx", "selectedActions": [98, 76, 39]}]}, {"moduleId": "mn7DDxt5", "selectedGroups": [{"groupId": "OCaOdOw1", "selectedActions": [43, 31, 3]}, {"groupId": "oXSUPWHd", "selectedActions": [13, 24, 40]}, {"groupId": "ROyEAZJn", "selectedActions": [53, 82, 88]}]}, {"moduleId": "ov6A234p", "selectedGroups": [{"groupId": "jYnd2hyn", "selectedActions": [95, 92, 76]}, {"groupId": "HtCMnhtR", "selectedActions": [37, 87, 59]}, {"groupId": "df2HaVJY", "selectedActions": [77, 39, 11]}]}], "namespace": "ZzaaoMcM", "oauthAccessTokenExpiration": 17, "oauthAccessTokenExpirationTimeUnit": "MGHsQVnO", "oauthClientType": "AnyWTgCl", "oauthRefreshTokenExpiration": 63, "oauthRefreshTokenExpirationTimeUnit": "9DiGR1Cu", "parentNamespace": "OYJts1Q4", "redirectUri": "RTp66KMY", "scopes": ["CoVicIYU", "WWnQx5Ys", "VEMgrB6g"], "secret": "6USi0jbw", "skipLoginQueue": true, "twoFactorEnabled": true}' \
    > test.out 2>&1
eval_tap $? 126 'AdminCreateClientV3' test.out

#- 127 AdminGetClientsbyNamespacebyIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetClientsbyNamespacebyIDV3 \
    --clientId 'Hwq8544R' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 127 'AdminGetClientsbyNamespacebyIDV3' test.out

#- 128 AdminDeleteClientV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientV3 \
    --clientId 'iOJdUUo8' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 128 'AdminDeleteClientV3' test.out

#- 129 AdminUpdateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientV3 \
    --clientId 'h3RnY1tP' \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["72JOMY8J", "mrQe1n4v", "XM3Rbqut"], "baseUri": "6tRnnupY", "clientName": "A7HCHawl", "clientPermissions": [{"action": 69, "resource": "xJoOiaK2", "schedAction": 14, "schedCron": "uEDrSvRV", "schedRange": ["7CgobW0L", "yXMw3j3h", "8zkoMCln"]}, {"action": 66, "resource": "QcqJCzM9", "schedAction": 55, "schedCron": "Sgf0dus0", "schedRange": ["WSqBCUlY", "FCrsOZod", "qizc3VE4"]}, {"action": 45, "resource": "BqEDt0Yx", "schedAction": 83, "schedCron": "WFTFhbCa", "schedRange": ["JiKxgeqm", "GAcqXvmI", "OtqoDJnf"]}], "clientPlatform": "S9YYTier", "deletable": false, "description": "ZpsBwtE2", "modulePermissions": [{"moduleId": "H1kOUJ1n", "selectedGroups": [{"groupId": "2qcbpyd6", "selectedActions": [0, 17, 38]}, {"groupId": "kZKpoSPq", "selectedActions": [61, 12, 60]}, {"groupId": "yJuzNMLF", "selectedActions": [8, 79, 64]}]}, {"moduleId": "PHYPgBbs", "selectedGroups": [{"groupId": "4JgNLlXb", "selectedActions": [50, 99, 99]}, {"groupId": "WBz1OfBJ", "selectedActions": [51, 19, 43]}, {"groupId": "ImibqQOr", "selectedActions": [29, 8, 48]}]}, {"moduleId": "RCXEM44H", "selectedGroups": [{"groupId": "GRxvKW5l", "selectedActions": [95, 36, 56]}, {"groupId": "mqphBt6m", "selectedActions": [54, 11, 46]}, {"groupId": "21o7eKPO", "selectedActions": [13, 41, 44]}]}], "namespace": "DnDCk3P3", "oauthAccessTokenExpiration": 73, "oauthAccessTokenExpirationTimeUnit": "EaHetwWC", "oauthRefreshTokenExpiration": 25, "oauthRefreshTokenExpirationTimeUnit": "oPH0RiCv", "redirectUri": "AKXrfC6t", "scopes": ["nwsqcQTT", "s7c5RjOR", "LZAAQehs"], "skipLoginQueue": false, "twoFactorEnabled": true}' \
    > test.out 2>&1
eval_tap $? 129 'AdminUpdateClientV3' test.out

#- 130 AdminUpdateClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientPermissionV3 \
    --clientId 'XrbCqOQJ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 100, "resource": "2YF3BTO9"}, {"action": 23, "resource": "WVS8Mkqq"}, {"action": 64, "resource": "BlzOkuvr"}]}' \
    > test.out 2>&1
eval_tap $? 130 'AdminUpdateClientPermissionV3' test.out

#- 131 AdminAddClientPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddClientPermissionsV3 \
    --clientId 'ZbCnuM54' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 50, "resource": "eIxwwd2p"}, {"action": 70, "resource": "OfXUdoDD"}, {"action": 67, "resource": "i6V0N832"}]}' \
    > test.out 2>&1
eval_tap $? 131 'AdminAddClientPermissionsV3' test.out

#- 132 AdminDeleteClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientPermissionV3 \
    --action '69' \
    --clientId 'Cz16Q8cR' \
    --namespace "$AB_NAMESPACE" \
    --resource 'tsNpIlYF' \
    > test.out 2>&1
eval_tap $? 132 'AdminDeleteClientPermissionV3' test.out

#- 133 AdminGetConfigValueV3
./ng net.accelbyte.sdk.cli.Main iam adminGetConfigValueV3 \
    --configKey 'GVcEXeJm' \
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
    --body '{"blacklist": ["9zqJdd1Z", "6nduUcg1", "dKsGRSxf"]}' \
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
    --limit '84' \
    --offset '52' \
    > test.out 2>&1
eval_tap $? 139 'RetrieveAllSSOLoginPlatformCredentialV3' test.out

#- 140 RetrieveThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'pLxm72MO' \
    > test.out 2>&1
eval_tap $? 140 'RetrieveThirdPartyLoginPlatformCredentialV3' test.out

#- 141 AddThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam addThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'ENP4euq6' \
    --body '{"ACSURL": "PijFgi3r", "AWSCognitoRegion": "qNE6pyyp", "AWSCognitoUserPool": "IOCiA5rh", "AllowedClients": ["GVaMFOuj", "hH2lJwQO", "s2dxeGvg"], "AppId": "gE9WCTFw", "AuthorizationEndpoint": "9ILQ9m7R", "ClientId": "Ily8KRhc", "Environment": "DsYAKSS0", "FederationMetadataURL": "d5ebCDgS", "GenericOauthFlow": false, "IsActive": false, "Issuer": "rdQeEQfM", "JWKSEndpoint": "CMkuHjRF", "KeyID": "ZKYzA3ug", "NetflixCertificates": {"encryptedPrivateKey": "dMdvPYab", "encryptedPrivateKeyName": "n9HZ2Htx", "publicCertificate": "m6WuJmhK", "publicCertificateName": "qFdOhugK", "rootCertificate": "OyBY2fW2", "rootCertificateName": "KjI7ITYW"}, "OrganizationId": "kay1idsX", "PlatformName": "SrmQr78m", "RedirectUri": "0l65t5l2", "RegisteredDomains": [{"affectedClientIDs": ["Y1OLidsF", "WjVEE3hY", "dXS27gw3"], "domain": "E0QpkOOF", "namespaces": ["IELaPhky", "vO6zrlkV", "EPxHbTye"], "roleId": "gOkt0aBe"}, {"affectedClientIDs": ["aGcEVkz0", "xcYNLWE0", "PMKmuqDs"], "domain": "lhsLbE7y", "namespaces": ["D1OhJkyp", "h3pCDkUr", "aMkTzYdX"], "roleId": "419O1ZnM"}, {"affectedClientIDs": ["NhoWBKM6", "AfwFRPld", "XOJVtOOx"], "domain": "RsDi9u0Z", "namespaces": ["wbKR3N4P", "ZFnLeTnY", "d6dmD5Fu"], "roleId": "PrAwWV1Q"}], "Secret": "Hi0czmil", "TeamID": "soyO2duC", "TokenAuthenticationType": "3QIEOSMH", "TokenClaimsMapping": {"9BtmDMbe": "sy0LGrhl", "qFy2e36x": "Upl0HazI", "ib5R0jC1": "r2d7HdaN"}, "TokenEndpoint": "slNxhL8g", "UserInfoEndpoint": "r02RusII", "UserInfoHTTPMethod": "N8FDdDWy", "scopes": ["PvsK25RB", "MKqf5uXb", "CS8FjpXe"]}' \
    > test.out 2>&1
eval_tap $? 141 'AddThirdPartyLoginPlatformCredentialV3' test.out

#- 142 DeleteThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'DHJG2Hbl' \
    > test.out 2>&1
eval_tap $? 142 'DeleteThirdPartyLoginPlatformCredentialV3' test.out

#- 143 UpdateThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'HIV0tyfV' \
    --body '{"ACSURL": "qYdL6Fnx", "AWSCognitoRegion": "9iWzSJqX", "AWSCognitoUserPool": "XrBOFrgL", "AllowedClients": ["1dDKB1fT", "AdXGDIcc", "ykXdkLL1"], "AppId": "3jtG3mS2", "AuthorizationEndpoint": "sCXWKGUq", "ClientId": "YJPwP1lT", "Environment": "8pHOvBkF", "FederationMetadataURL": "j53PVyIu", "GenericOauthFlow": false, "IsActive": false, "Issuer": "4esAiFW1", "JWKSEndpoint": "pUTTqxV3", "KeyID": "qmHQD3ET", "NetflixCertificates": {"encryptedPrivateKey": "Cvawdqpr", "encryptedPrivateKeyName": "tIWrvQi1", "publicCertificate": "k284OG7i", "publicCertificateName": "09ufAUy4", "rootCertificate": "vxTuGdLp", "rootCertificateName": "fyKzLKW2"}, "OrganizationId": "ZqrOCQij", "PlatformName": "DTtRsy6P", "RedirectUri": "P6U7yhIr", "RegisteredDomains": [{"affectedClientIDs": ["6v47YkTU", "29ytcsXX", "bf4GVdGU"], "domain": "NTjwaJoo", "namespaces": ["xYKAbyWi", "QeeoQMDm", "1sUGjudt"], "roleId": "Rd9xemzE"}, {"affectedClientIDs": ["EK4vWPlp", "OJI6ovjN", "utsLHoNR"], "domain": "A3Jwmdob", "namespaces": ["dpExjOBg", "W8GkTguQ", "UDuieuFT"], "roleId": "nErvfohn"}, {"affectedClientIDs": ["71AXKKRH", "tefH95b4", "cSWWLco7"], "domain": "DTmQanny", "namespaces": ["CVzF936E", "ROoFvMRr", "RDyg8evG"], "roleId": "kM6pxc61"}], "Secret": "d7NCffIa", "TeamID": "3PgIdUyL", "TokenAuthenticationType": "pWBfTmpT", "TokenClaimsMapping": {"qEBR0Lsu": "zpRTGyMB", "9UCd33MY": "jfl7drrc", "kP9GbAA0": "A5FKW32j"}, "TokenEndpoint": "Y2bDSFun", "UserInfoEndpoint": "LWvRGLpU", "UserInfoHTTPMethod": "Sj2F4dE9", "scopes": ["ffExiwGz", "lWPAJVYs", "aMFCEX0k"]}' \
    > test.out 2>&1
eval_tap $? 143 'UpdateThirdPartyLoginPlatformCredentialV3' test.out

#- 144 UpdateThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'ZJlJQWmi' \
    --body '{"affectedClientIDs": ["5RISWKwN", "nTRDTVHa", "TmrmtsdR"], "assignedNamespaces": ["MoNaTDSW", "cDjgMoES", "4ZNZaXQ8"], "domain": "8cBCcCfU", "roleId": "p1ReeYXf"}' \
    > test.out 2>&1
eval_tap $? 144 'UpdateThirdPartyLoginPlatformDomainV3' test.out

#- 145 DeleteThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'rrh1SI7K' \
    --body '{"domain": "K9ecv1cE"}' \
    > test.out 2>&1
eval_tap $? 145 'DeleteThirdPartyLoginPlatformDomainV3' test.out

#- 146 RetrieveSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam retrieveSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'K59rdcrT' \
    > test.out 2>&1
eval_tap $? 146 'RetrieveSSOLoginPlatformCredential' test.out

#- 147 AddSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam addSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'LelSxX60' \
    --body '{"acsUrl": "nI6FQXmX", "apiKey": "JuYsPis0", "appId": "gJfLxruV", "federationMetadataUrl": "R4vnxWtt", "isActive": true, "redirectUri": "TjTeVERz", "secret": "XHbIgDtH", "ssoUrl": "GflcUfDI"}' \
    > test.out 2>&1
eval_tap $? 147 'AddSSOLoginPlatformCredential' test.out

#- 148 DeleteSSOLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteSSOLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '9ACSPqVX' \
    > test.out 2>&1
eval_tap $? 148 'DeleteSSOLoginPlatformCredentialV3' test.out

#- 149 UpdateSSOPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam updateSSOPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'WQs251lK' \
    --body '{"acsUrl": "qNSy0P3i", "apiKey": "leDRwv2J", "appId": "Jjn8tuGA", "federationMetadataUrl": "lhHs0D2q", "isActive": false, "redirectUri": "bnjbU5Rf", "secret": "ee6UtgrV", "ssoUrl": "CkmL6u7P"}' \
    > test.out 2>&1
eval_tap $? 149 'UpdateSSOPlatformCredential' test.out

#- 150 AdminListUserIDByPlatformUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByPlatformUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'wRHuw9Sf' \
    --rawPID  \
    --body '{"platformUserIds": ["UvmnI3S1", "1Fp8LdrG", "CC84TAml"]}' \
    > test.out 2>&1
eval_tap $? 150 'AdminListUserIDByPlatformUserIDsV3' test.out

#- 151 AdminGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'UXuNGnqj' \
    --platformUserId 'EPQhBA94' \
    > test.out 2>&1
eval_tap $? 151 'AdminGetUserByPlatformUserIDV3' test.out

#- 152 GetAdminUsersByRoleIdV3
./ng net.accelbyte.sdk.cli.Main iam getAdminUsersByRoleIdV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'gHvZG6ij' \
    --after '49' \
    --before '26' \
    --limit '22' \
    > test.out 2>&1
eval_tap $? 152 'GetAdminUsersByRoleIdV3' test.out

#- 153 AdminGetUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --emailAddress 'SvOuKPi0' \
    > test.out 2>&1
eval_tap $? 153 'AdminGetUserByEmailAddressV3' test.out

#- 154 AdminBulkUpdateUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"updateRequest": {"skipLoginQueue": true}, "userIds": ["jnl8BRgI", "lwQlHgvq", "n8bX0Yt1"]}' \
    > test.out 2>&1
eval_tap $? 154 'AdminBulkUpdateUsersV3' test.out

#- 155 AdminGetBulkUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType 'QbH774Pz' \
    --body '{"bulkUserId": ["JwdJfH7a", "eZqul2AA", "nyBGCkf0"]}' \
    > test.out 2>&1
eval_tap $? 155 'AdminGetBulkUserBanV3' test.out

#- 156 AdminListUserIDByUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["EB2qqGpa", "PNzdwtrR", "B9vLz09O"]}' \
    > test.out 2>&1
eval_tap $? 156 'AdminListUserIDByUserIDsV3' test.out

#- 157 AdminBulkGetUsersPlatform
./ng net.accelbyte.sdk.cli.Main iam adminBulkGetUsersPlatform \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["gfdP7PNr", "NFXNfIvN", "8O4pM8c1"]}' \
    > test.out 2>&1
eval_tap $? 157 'AdminBulkGetUsersPlatform' test.out

#- 158 AdminInviteUserV3
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddresses": ["5n9A0LYi", "eM6qYErH", "elkPZC3N"], "isAdmin": true, "namespace": "iNgr037R", "roles": ["duchBlah", "W9BMskt0", "bR6EKl75"]}' \
    > test.out 2>&1
eval_tap $? 158 'AdminInviteUserV3' test.out

#- 159 AdminQueryThirdPlatformLinkHistoryV3
./ng net.accelbyte.sdk.cli.Main iam adminQueryThirdPlatformLinkHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '39' \
    --offset '98' \
    --platformUserId '1kKCKupJ' \
    --platformId 'iMn4DVle' \
    > test.out 2>&1
eval_tap $? 159 'AdminQueryThirdPlatformLinkHistoryV3' test.out

#- 160 AdminListUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminListUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '70' \
    --offset '11' \
    > test.out 2>&1
eval_tap $? 160 'AdminListUsersV3' test.out

#- 161 AdminSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam adminSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'QbPmyXi9' \
    --endDate 'jbGE2Q6U' \
    --includeTotal  \
    --limit '89' \
    --offset '93' \
    --platformBy '7G6MFx0i' \
    --platformId 'Er7vVKMi' \
    --query 'M0Lbggjy' \
    --roleIds '261daq2Z' \
    --skipLoginQueue  \
    --startDate '38rNAAji' \
    --testAccount  \
    > test.out 2>&1
eval_tap $? 161 'AdminSearchUserV3' test.out

#- 162 AdminGetBulkUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"listEmailAddressRequest": ["VhULkhMI", "biMtGMxh", "G3d5oP7a"]}' \
    > test.out 2>&1
eval_tap $? 162 'AdminGetBulkUserByEmailAddressV3' test.out

#- 163 AdminGetUserByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'dce650lS' \
    > test.out 2>&1
eval_tap $? 163 'AdminGetUserByUserIdV3' test.out

#- 164 AdminUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'CBwiV3Fy' \
    --body '{"avatarUrl": "zaDfSE5z", "country": "GXXmttcD", "dateOfBirth": "UCb8tyuB", "displayName": "atyDjyr2", "languageTag": "83ykqDKC", "skipLoginQueue": true, "uniqueDisplayName": "Fpqp74VJ", "userName": "uDhv6fIn"}' \
    > test.out 2>&1
eval_tap $? 164 'AdminUpdateUserV3' test.out

#- 165 AdminGetUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '6YV64dtH' \
    --activeOnly  \
    --after 'VgrVMd9r' \
    --before 'Yq32yIsb' \
    --limit '38' \
    > test.out 2>&1
eval_tap $? 165 'AdminGetUserBanV3' test.out

#- 166 AdminBanUserV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'oPLwpKno' \
    --body '{"ban": "BXJ5jmEg", "comment": "QJlFyl8R", "endDate": "2w9UfYJm", "reason": "Fyx5G7B0", "skipNotif": true}' \
    > test.out 2>&1
eval_tap $? 166 'AdminBanUserV3' test.out

#- 167 AdminUpdateUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserBanV3 \
    --banId 'GKVO68iI' \
    --namespace "$AB_NAMESPACE" \
    --userId 'kLo16FvD' \
    --body '{"enabled": false, "skipNotif": true}' \
    > test.out 2>&1
eval_tap $? 167 'AdminUpdateUserBanV3' test.out

#- 168 AdminSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '6V3JKVKq' \
    --body '{"context": "lV2zSTfb", "emailAddress": "rwvQvS1S", "languageTag": "dubSfJif"}' \
    > test.out 2>&1
eval_tap $? 168 'AdminSendVerificationCodeV3' test.out

#- 169 AdminVerifyAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'KDNYmsHt' \
    --body '{"Code": "aO9P9nFm", "ContactType": "qdpSgasm", "LanguageTag": "cyfQWyue", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 169 'AdminVerifyAccountV3' test.out

#- 170 GetUserVerificationCode
./ng net.accelbyte.sdk.cli.Main iam getUserVerificationCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'LNesrWE9' \
    > test.out 2>&1
eval_tap $? 170 'GetUserVerificationCode' test.out

#- 171 AdminGetUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'doDLNtJZ' \
    > test.out 2>&1
eval_tap $? 171 'AdminGetUserDeletionStatusV3' test.out

#- 172 AdminUpdateUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'uwSxTZlg' \
    --body '{"deletionDate": 71, "enabled": true}' \
    > test.out 2>&1
eval_tap $? 172 'AdminUpdateUserDeletionStatusV3' test.out

#- 173 AdminListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'YmS3l7zH' \
    > test.out 2>&1
eval_tap $? 173 'AdminListUserAllPlatformAccountsDistinctV3' test.out

#- 174 AdminUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'iNTkSnpx' \
    --body '{"code": "ahRRxlrh", "country": "2VnpHLTi", "dateOfBirth": "3sHYvZA0", "displayName": "Njg7Pe8i", "emailAddress": "XQPpWW2d", "password": "JYJiRjX5", "uniqueDisplayName": "OE8W9tYA", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 174 'AdminUpgradeHeadlessAccountV3' test.out

#- 175 AdminDeleteUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'FcG6dUB2' \
    > test.out 2>&1
eval_tap $? 175 'AdminDeleteUserInformationV3' test.out

#- 176 AdminGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '5ELsOauf' \
    --after '0.40151154750407425' \
    --before '0.012375040530852921' \
    --limit '74' \
    > test.out 2>&1
eval_tap $? 176 'AdminGetUserLoginHistoriesV3' test.out

#- 177 AdminResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam adminResetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'D7rOHbe8' \
    --body '{"languageTag": "0NDCZ5OK", "newPassword": "MAotap60", "oldPassword": "C2MMdHLD"}' \
    > test.out 2>&1
eval_tap $? 177 'AdminResetPasswordV3' test.out

#- 178 AdminUpdateUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserPermissionV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Xo0Nnq5w' \
    --body '{"Permissions": [{"Action": 8, "Resource": "WCiK5soP", "SchedAction": 19, "SchedCron": "pByxvSKp", "SchedRange": ["jkZftLen", "Aj2EaiUi", "7v3IuWbX"]}, {"Action": 96, "Resource": "zewQqSJM", "SchedAction": 81, "SchedCron": "8q9BXiBl", "SchedRange": ["hpFdJKsq", "OfgX9Hyq", "3pUfzrPO"]}, {"Action": 49, "Resource": "bpoq1L9S", "SchedAction": 60, "SchedCron": "SrGrnw5y", "SchedRange": ["v7RuAalu", "by6eHhvh", "yyYe0z6J"]}]}' \
    > test.out 2>&1
eval_tap $? 178 'AdminUpdateUserPermissionV3' test.out

#- 179 AdminAddUserPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserPermissionsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 't5aWk7Zl' \
    --body '{"Permissions": [{"Action": 3, "Resource": "k0MtyQfq", "SchedAction": 36, "SchedCron": "axD06FCH", "SchedRange": ["XBJcCO0R", "IenPdaP5", "6jOcuAfn"]}, {"Action": 12, "Resource": "fvwaEv5Y", "SchedAction": 65, "SchedCron": "VHxwkT6c", "SchedRange": ["rPsQwP4J", "UiiAtokF", "eBesEU9R"]}, {"Action": 21, "Resource": "0WTcpk3z", "SchedAction": 83, "SchedCron": "bDvqgfdd", "SchedRange": ["kdIyfaTE", "ejkNUk8J", "EwVLa513"]}]}' \
    > test.out 2>&1
eval_tap $? 179 'AdminAddUserPermissionsV3' test.out

#- 180 AdminDeleteUserPermissionBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'wvFzgYXY' \
    --body '[{"Action": 60, "Resource": "8p88m2Ip"}, {"Action": 10, "Resource": "nGHuuTl0"}, {"Action": 28, "Resource": "b9CngF2Z"}]' \
    > test.out 2>&1
eval_tap $? 180 'AdminDeleteUserPermissionBulkV3' test.out

#- 181 AdminDeleteUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionV3 \
    --action '30' \
    --namespace "$AB_NAMESPACE" \
    --resource 'LKGHOqqy' \
    --userId '6OSaszkk' \
    > test.out 2>&1
eval_tap $? 181 'AdminDeleteUserPermissionV3' test.out

#- 182 AdminGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'TOXd8dFg' \
    --after 'itZrzbip' \
    --before '38z4Fb8M' \
    --limit '71' \
    --platformId '36IN5oaI' \
    > test.out 2>&1
eval_tap $? 182 'AdminGetUserPlatformAccountsV3' test.out

#- 183 AdminGetListJusticePlatformAccounts
./ng net.accelbyte.sdk.cli.Main iam adminGetListJusticePlatformAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'iuK0AsPD' \
    > test.out 2>&1
eval_tap $? 183 'AdminGetListJusticePlatformAccounts' test.out

#- 184 AdminGetUserMapping
./ng net.accelbyte.sdk.cli.Main iam adminGetUserMapping \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'dA2sWZpe' \
    --userId '8FFEKAuU' \
    > test.out 2>&1
eval_tap $? 184 'AdminGetUserMapping' test.out

#- 185 AdminCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam adminCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'Ac1CYaB6' \
    --userId '9BJ4Px5I' \
    > test.out 2>&1
eval_tap $? 185 'AdminCreateJusticeUser' test.out

#- 186 AdminLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'LAQ1Rvjj' \
    --skipConflict  \
    --body '{"platformId": "MOb4BVuu", "platformUserId": "RvfNEg48"}' \
    > test.out 2>&1
eval_tap $? 186 'AdminLinkPlatformAccount' test.out

#- 187 AdminPlatformUnlinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformUnlinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Hq5FPc3U' \
    --userId 'Pi1dJgQc' \
    --body '{"platformNamespace": "n8hGKE4O"}' \
    > test.out 2>&1
eval_tap $? 187 'AdminPlatformUnlinkV3' test.out

#- 188 AdminPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'ePZPQQXX' \
    --userId 'w6cPcX99' \
    > test.out 2>&1
eval_tap $? 188 'AdminPlatformUnlinkAllV3' test.out

#- 189 AdminPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'HACRMebT' \
    --userId 'hUqyXCqG' \
    --ticket 'rrYkGr5U' \
    > test.out 2>&1
eval_tap $? 189 'AdminPlatformLinkV3' test.out

#- 190 AdminDeleteUserLinkingHistoryByPlatformIDV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserLinkingHistoryByPlatformIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'LTKtwrEd' \
    --userId 'DoDwRNPM' \
    > test.out 2>&1
eval_tap $? 190 'AdminDeleteUserLinkingHistoryByPlatformIDV3' test.out

#- 191 AdminGetThirdPartyPlatformTokenLinkStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetThirdPartyPlatformTokenLinkStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Z9Zmj2QU' \
    --userId 'gbAbPtL7' \
    --platformToken 'pIdidOZx' \
    > test.out 2>&1
eval_tap $? 191 'AdminGetThirdPartyPlatformTokenLinkStatusV3' test.out

#- 192 AdminGetUserSinglePlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminGetUserSinglePlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --platformId 'VrFWvi3c' \
    --userId 'nBJDjGpq' \
    > test.out 2>&1
eval_tap $? 192 'AdminGetUserSinglePlatformAccount' test.out

#- 193 AdminDeleteUserRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRolesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'WJ4OT95X' \
    --body '["PaUtSduG", "Wh2vALpN", "RMHFG17V"]' \
    > test.out 2>&1
eval_tap $? 193 'AdminDeleteUserRolesV3' test.out

#- 194 AdminSaveUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminSaveUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'u9gN83xK' \
    --body '[{"namespace": "go9MxiUY", "roleId": "bqH85HKs"}, {"namespace": "pWFIBKv9", "roleId": "zEzX2Iv0"}, {"namespace": "ATCgf2TV", "roleId": "ooahwLoo"}]' \
    > test.out 2>&1
eval_tap $? 194 'AdminSaveUserRoleV3' test.out

#- 195 AdminAddUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'uBafvHsn' \
    --userId '6bnweuq1' \
    > test.out 2>&1
eval_tap $? 195 'AdminAddUserRoleV3' test.out

#- 196 AdminDeleteUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'WfU3AVQf' \
    --userId 'Hufr6RFL' \
    > test.out 2>&1
eval_tap $? 196 'AdminDeleteUserRoleV3' test.out

#- 197 AdminUpdateUserStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '4KYK4V8h' \
    --body '{"enabled": true, "reason": "WnsIomCt"}' \
    > test.out 2>&1
eval_tap $? 197 'AdminUpdateUserStatusV3' test.out

#- 198 AdminTrustlyUpdateUserIdentity
./ng net.accelbyte.sdk.cli.Main iam adminTrustlyUpdateUserIdentity \
    --namespace "$AB_NAMESPACE" \
    --userId 'lgm1pPSD' \
    --body '{"emailAddress": "nnfka5cI", "password": "hCWmPUvn"}' \
    > test.out 2>&1
eval_tap $? 198 'AdminTrustlyUpdateUserIdentity' test.out

#- 199 AdminVerifyUserWithoutVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyUserWithoutVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'vaCFSSt4' \
    > test.out 2>&1
eval_tap $? 199 'AdminVerifyUserWithoutVerificationCodeV3' test.out

#- 200 AdminUpdateClientSecretV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientSecretV3 \
    --clientId 'Hmk1MGAm' \
    --namespace "$AB_NAMESPACE" \
    --body '{"newSecret": "A3hVn45q"}' \
    > test.out 2>&1
eval_tap $? 200 'AdminUpdateClientSecretV3' test.out

#- 201 AdminCheckThirdPartyLoginPlatformAvailabilityV3
./ng net.accelbyte.sdk.cli.Main iam adminCheckThirdPartyLoginPlatformAvailabilityV3 \
    --platformId 'eYC8xMll' \
    > test.out 2>&1
eval_tap $? 201 'AdminCheckThirdPartyLoginPlatformAvailabilityV3' test.out

#- 202 AdminGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV3 \
    --after 'EH1MBdIG' \
    --before 'MDJ9cGeY' \
    --isWildcard  \
    --limit '49' \
    > test.out 2>&1
eval_tap $? 202 'AdminGetRolesV3' test.out

#- 203 AdminCreateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV3 \
    --body '{"adminRole": true, "deletable": true, "isWildcard": true, "managers": [{"displayName": "Z1xXEcV9", "namespace": "P3Iyqqki", "userId": "LZwgfz2W"}, {"displayName": "0kNmHqrm", "namespace": "KMA8UHkL", "userId": "riCdnMqS"}, {"displayName": "8U8atPTw", "namespace": "ua8hTKzN", "userId": "usB6UcCc"}], "members": [{"displayName": "D1rk4K8L", "namespace": "iCIfppGw", "userId": "76CNu4ny"}, {"displayName": "dPHw77VH", "namespace": "Ysgckowl", "userId": "C1BzO40r"}, {"displayName": "JVUoPm8V", "namespace": "LcM0p2JM", "userId": "JH5ry9Do"}], "permissions": [{"action": 62, "resource": "ha5VVX7x", "schedAction": 73, "schedCron": "ROuwpJvl", "schedRange": ["RKmZbNuW", "rL6WvA36", "28iBt2VT"]}, {"action": 32, "resource": "l5ZNc6Go", "schedAction": 21, "schedCron": "9dYZTumR", "schedRange": ["3rOSesda", "v3OG89Uj", "GbujYh50"]}, {"action": 24, "resource": "aL1CtU5Y", "schedAction": 26, "schedCron": "oKyuZT5p", "schedRange": ["SSaYtG0U", "QTPlC07S", "RXbbBbMp"]}], "roleName": "nWK7G6Hy"}' \
    > test.out 2>&1
eval_tap $? 203 'AdminCreateRoleV3' test.out

#- 204 AdminGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV3 \
    --roleId 'tfueyCRk' \
    > test.out 2>&1
eval_tap $? 204 'AdminGetRoleV3' test.out

#- 205 AdminDeleteRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV3 \
    --roleId 'v7YrdtjT' \
    > test.out 2>&1
eval_tap $? 205 'AdminDeleteRoleV3' test.out

#- 206 AdminUpdateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV3 \
    --roleId 'lH7R57tF' \
    --body '{"deletable": false, "isWildcard": false, "roleName": "5K0onVHA"}' \
    > test.out 2>&1
eval_tap $? 206 'AdminUpdateRoleV3' test.out

#- 207 AdminGetRoleAdminStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleAdminStatusV3 \
    --roleId 'cWlwN67r' \
    > test.out 2>&1
eval_tap $? 207 'AdminGetRoleAdminStatusV3' test.out

#- 208 AdminUpdateAdminRoleStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateAdminRoleStatusV3 \
    --roleId 'lgBBz1WK' \
    > test.out 2>&1
eval_tap $? 208 'AdminUpdateAdminRoleStatusV3' test.out

#- 209 AdminRemoveRoleAdminV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleAdminV3 \
    --roleId 'gJQFeOrg' \
    > test.out 2>&1
eval_tap $? 209 'AdminRemoveRoleAdminV3' test.out

#- 210 AdminGetRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleManagersV3 \
    --roleId 'lEaDPeKJ' \
    --after 'CDFfcscF' \
    --before 'fmycrNaL' \
    --limit '63' \
    > test.out 2>&1
eval_tap $? 210 'AdminGetRoleManagersV3' test.out

#- 211 AdminAddRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleManagersV3 \
    --roleId 'OztcDGOt' \
    --body '{"managers": [{"displayName": "gLJsBRL3", "namespace": "LnTrRG90", "userId": "jzMkklEr"}, {"displayName": "JvLFH2m7", "namespace": "Gzr6MxG2", "userId": "p7EJL1Lj"}, {"displayName": "8UOEvg5j", "namespace": "Z9gjgqif", "userId": "x5aEoYHI"}]}' \
    > test.out 2>&1
eval_tap $? 211 'AdminAddRoleManagersV3' test.out

#- 212 AdminRemoveRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleManagersV3 \
    --roleId 'qVaQwGop' \
    --body '{"managers": [{"displayName": "vQgmyMC6", "namespace": "VyyGUJDs", "userId": "udAjbok8"}, {"displayName": "XyVI8uU8", "namespace": "HKTnGRTK", "userId": "kWAUPDq6"}, {"displayName": "orPw3rGV", "namespace": "li0wdyt0", "userId": "BCtriwA3"}]}' \
    > test.out 2>&1
eval_tap $? 212 'AdminRemoveRoleManagersV3' test.out

#- 213 AdminGetRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleMembersV3 \
    --roleId 'ASFvLXID' \
    --after 'A7cZKs1X' \
    --before 'koQ7VRMA' \
    --limit '54' \
    > test.out 2>&1
eval_tap $? 213 'AdminGetRoleMembersV3' test.out

#- 214 AdminAddRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleMembersV3 \
    --roleId 'CzFjai8F' \
    --body '{"members": [{"displayName": "iOu9jRyE", "namespace": "SDpU4hmd", "userId": "uh4jCBTP"}, {"displayName": "oPzL3Buj", "namespace": "Faw8sJUd", "userId": "N5T6imHm"}, {"displayName": "d6Y7wYdU", "namespace": "u2I9Na1K", "userId": "cVu3pbOk"}]}' \
    > test.out 2>&1
eval_tap $? 214 'AdminAddRoleMembersV3' test.out

#- 215 AdminRemoveRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleMembersV3 \
    --roleId 'nc6mEPui' \
    --body '{"members": [{"displayName": "yhgtej48", "namespace": "GAg9r8Ox", "userId": "qJgcZvTY"}, {"displayName": "Bkeaqi1Y", "namespace": "FX5R2wG4", "userId": "XIdZqqbF"}, {"displayName": "Kkt13OrS", "namespace": "bd5myItn", "userId": "Af4unSKi"}]}' \
    > test.out 2>&1
eval_tap $? 215 'AdminRemoveRoleMembersV3' test.out

#- 216 AdminUpdateRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV3 \
    --roleId 'KB2q3tfa' \
    --body '{"permissions": [{"action": 47, "resource": "g1nQJHU3", "schedAction": 82, "schedCron": "RV80YeZ1", "schedRange": ["erIktCpA", "Qf5volPU", "ONh1xGlu"]}, {"action": 29, "resource": "QAnT2T9I", "schedAction": 61, "schedCron": "ke7pNsF1", "schedRange": ["qnfyRIGw", "4tBmFv42", "EGnY1Ko6"]}, {"action": 56, "resource": "muxn6chA", "schedAction": 1, "schedCron": "LwnTzWDE", "schedRange": ["5SaVwS2t", "9O3bwTJS", "XfQ0j3Ob"]}]}' \
    > test.out 2>&1
eval_tap $? 216 'AdminUpdateRolePermissionsV3' test.out

#- 217 AdminAddRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV3 \
    --roleId '37xZ9kgF' \
    --body '{"permissions": [{"action": 9, "resource": "Pi9jAPT8", "schedAction": 70, "schedCron": "W3OP5AeH", "schedRange": ["ChdFYOjY", "4kF62fGY", "YgxsvHE4"]}, {"action": 52, "resource": "yWQ1HiwA", "schedAction": 54, "schedCron": "5uPuhonI", "schedRange": ["wdHHZnl4", "Grfm2pEn", "qwdpmud1"]}, {"action": 54, "resource": "lFhWbhr5", "schedAction": 91, "schedCron": "37J2G4uc", "schedRange": ["TTuBIJGa", "aoIY9LeH", "ohgvGnJe"]}]}' \
    > test.out 2>&1
eval_tap $? 217 'AdminAddRolePermissionsV3' test.out

#- 218 AdminDeleteRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV3 \
    --roleId 'JaYu6ILE' \
    --body '["hIEbLqKr", "8p8MnHyW", "zW6sGEm4"]' \
    > test.out 2>&1
eval_tap $? 218 'AdminDeleteRolePermissionsV3' test.out

#- 219 AdminDeleteRolePermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionV3 \
    --action '57' \
    --resource 'KVxmgs2F' \
    --roleId 'pxEaFSQK' \
    > test.out 2>&1
eval_tap $? 219 'AdminDeleteRolePermissionV3' test.out

#- 220 AdminGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam adminGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 220 'AdminGetMyUserV3' test.out

#- 221 UserAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam userAuthenticationV3 \
    --clientId 'FOHSFkq1' \
    --extendExp  \
    --redirectUri 'cxXF1OHR' \
    --password 'kmgE0S4b' \
    --requestId '5vce0CLz' \
    --userName 'nPdGzm5B' \
    > test.out 2>&1
eval_tap $? 221 'UserAuthenticationV3' test.out

#- 222 AuthenticationWithPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV3 \
    --extendExp  \
    --clientId '4kbPZdPT' \
    --linkingToken 'D7dgXIt4' \
    --password 'HNP87OvJ' \
    --username 'Sgnx1VCB' \
    > test.out 2>&1
eval_tap $? 222 'AuthenticationWithPlatformLinkV3' test.out

#- 223 GenerateTokenByNewHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV3 \
    --additionalData 'ELlIJrHt' \
    --extendExp  \
    --linkingToken 'jJML95AP' \
    > test.out 2>&1
eval_tap $? 223 'GenerateTokenByNewHeadlessAccountV3' test.out

#- 224 RequestOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam requestOneTimeLinkingCodeV3 \
    --platformId 'RMuCydOX' \
    > test.out 2>&1
eval_tap $? 224 'RequestOneTimeLinkingCodeV3' test.out

#- 225 ValidateOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam validateOneTimeLinkingCodeV3 \
    --oneTimeLinkCode 'xzhIYlxQ' \
    > test.out 2>&1
eval_tap $? 225 'ValidateOneTimeLinkingCodeV3' test.out

#- 226 RequestTokenByOneTimeLinkCodeResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTokenByOneTimeLinkCodeResponseV3 \
    --additionalData 'GnBTyJyR' \
    --isTransient  \
    --clientId 'KKAZwAAG' \
    --oneTimeLinkCode 'IKcS8KFe' \
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
    --codeChallenge '9osOATVL' \
    --codeChallengeMethod 'S256' \
    --clientId 'CzOS5X6z' \
    > test.out 2>&1
eval_tap $? 229 'RequestTokenExchangeCodeV3' test.out

#- 230 AdminRetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam adminRetrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'D2f5xLSV' \
    --userId 'tUVwtOIe' \
    --platformUserId 'wqslgm20' \
    > test.out 2>&1
eval_tap $? 230 'AdminRetrieveUserThirdPartyPlatformTokenV3' test.out

#- 231 RevokeUserV3
./ng net.accelbyte.sdk.cli.Main iam revokeUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '4xMEUonU' \
    --includeGameNamespace  \
    > test.out 2>&1
eval_tap $? 231 'RevokeUserV3' test.out

#- 232 AuthorizeV3
./ng net.accelbyte.sdk.cli.Main iam authorizeV3 \
    --codeChallenge 'sOLnPSd2' \
    --codeChallengeMethod 'S256' \
    --createHeadless  \
    --oneTimeLinkCode 'QQqEhjpW' \
    --redirectUri 'nrPIvUZI' \
    --scope '39M07YKx' \
    --state 'q9v49uFM' \
    --targetAuthPage 'TV4FarRg' \
    --useRedirectUriAsLoginUrlWhenLocked  \
    --clientId '0sNvOVOE' \
    --responseType 'code' \
    > test.out 2>&1
eval_tap $? 232 'AuthorizeV3' test.out

#- 233 TokenIntrospectionV3
./ng net.accelbyte.sdk.cli.Main iam tokenIntrospectionV3 \
    --token 'SonVhvs9' \
    > test.out 2>&1
eval_tap $? 233 'TokenIntrospectionV3' test.out

#- 234 GetJWKSV3
./ng net.accelbyte.sdk.cli.Main iam getJWKSV3 \
    > test.out 2>&1
eval_tap $? 234 'GetJWKSV3' test.out

#- 235 SendMFAAuthenticationCode
./ng net.accelbyte.sdk.cli.Main iam sendMFAAuthenticationCode \
    --clientId 'c2f6osiu' \
    --factor 'lISaTSTZ' \
    --mfaToken 'mUwmiazj' \
    > test.out 2>&1
eval_tap $? 235 'SendMFAAuthenticationCode' test.out

#- 236 Change2faMethod
./ng net.accelbyte.sdk.cli.Main iam change2faMethod \
    --factor 'FMhlqALz' \
    --mfaToken 'nbkSPaB3' \
    > test.out 2>&1
eval_tap $? 236 'Change2faMethod' test.out

#- 237 Verify2faCode
./ng net.accelbyte.sdk.cli.Main iam verify2faCode \
    --code 'lSMrKPtJ' \
    --factor 'BIzH1Fhm' \
    --mfaToken 'VZNX268K' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 237 'Verify2faCode' test.out

#- 238 RetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam retrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Mto557r8' \
    --userId '0fCf4cyV' \
    > test.out 2>&1
eval_tap $? 238 'RetrieveUserThirdPartyPlatformTokenV3' test.out

#- 239 AuthCodeRequestV3
./ng net.accelbyte.sdk.cli.Main iam authCodeRequestV3 \
    --platformId 'eqdx373l' \
    --clientId 'EEb8YN1Y' \
    --redirectUri 'DzC8ygV2' \
    --requestId 'pbOLgGsE' \
    > test.out 2>&1
eval_tap $? 239 'AuthCodeRequestV3' test.out

#- 240 PlatformTokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV3 \
    --platformId 'ca3mVhsV' \
    --additionalData 'rB4N9cBx' \
    --clientId 'JGTKp72W' \
    --createHeadless  \
    --deviceId 'GFERWRb0' \
    --macAddress 'zQ95laLc' \
    --platformToken 'vUVlxkrb' \
    --skipSetCookie  \
    > test.out 2>&1
eval_tap $? 240 'PlatformTokenGrantV3' test.out

#- 241 GetRevocationListV3
./ng net.accelbyte.sdk.cli.Main iam getRevocationListV3 \
    > test.out 2>&1
eval_tap $? 241 'GetRevocationListV3' test.out

#- 242 TokenRevocationV3
./ng net.accelbyte.sdk.cli.Main iam tokenRevocationV3 \
    --token 'PdCJvt4C' \
    > test.out 2>&1
eval_tap $? 242 'TokenRevocationV3' test.out

#- 243 SimultaneousLoginV3
./ng net.accelbyte.sdk.cli.Main iam simultaneousLoginV3 \
    --simultaneousPlatform 'GBpCOW2x' \
    --simultaneousTicket 'lkAW6nDm' \
    --nativePlatform 'steam' \
    --nativePlatformTicket '1sHtCiC9' \
    > test.out 2>&1
eval_tap $? 243 'SimultaneousLoginV3' test.out

#- 244 TokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV3 \
    --additionalData '4xtH3DSF' \
    --clientId 'kV9HExPZ' \
    --code 'Z9a3F784' \
    --codeVerifier 'eHcJp2dq' \
    --extendNamespace '4PL2v5Gq' \
    --extendExp  \
    --password '0aDJNCDT' \
    --redirectUri 'mBJmO8sc' \
    --refreshToken 'ODxa9LVP' \
    --username 'JwSqRAuu' \
    --grantType 'refresh_token' \
    > test.out 2>&1
eval_tap $? 244 'TokenGrantV3' test.out

#- 245 VerifyTokenV3
./ng net.accelbyte.sdk.cli.Main iam verifyTokenV3 \
    --token '7XXpXr0J' \
    > test.out 2>&1
eval_tap $? 245 'VerifyTokenV3' test.out

#- 246 PlatformAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticationV3 \
    --platformId 'hKe8sK8d' \
    --code 'wxQr0ZRx' \
    --error 'dIXpcmCO' \
    --openidAssocHandle 'KB3TjWaX' \
    --openidClaimedId '1Pdr6Has' \
    --openidIdentity 'IfoJ2Ihd' \
    --openidMode 'Rc9v4hFl' \
    --openidNs '391oKew5' \
    --openidOpEndpoint 'yjKTHLNM' \
    --openidResponseNonce 'qAXBDP4G' \
    --openidReturnTo '6Y63NKmt' \
    --openidSig '9q791ric' \
    --openidSigned 'FTE0vKAe' \
    --state '9k7AX7Cu' \
    > test.out 2>&1
eval_tap $? 246 'PlatformAuthenticationV3' test.out

#- 247 PlatformTokenRefreshV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenRefreshV3 \
    --platformId 'JxRmoHsz' \
    --platformToken 'edHnzQel' \
    > test.out 2>&1
eval_tap $? 247 'PlatformTokenRefreshV3' test.out

#- 248 PublicGetInputValidations
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidations \
    --defaultOnEmpty  \
    --languageCode 'wfVvzqfl' \
    > test.out 2>&1
eval_tap $? 248 'PublicGetInputValidations' test.out

#- 249 PublicGetInputValidationByField
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidationByField \
    --field '2Dg2CFjA' \
    > test.out 2>&1
eval_tap $? 249 'PublicGetInputValidationByField' test.out

#- 250 PublicGetCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam publicGetCountryAgeRestrictionV3 \
    --countryCode 'iaOiNBHc' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 250 'PublicGetCountryAgeRestrictionV3' test.out

#- 251 PublicGetConfigValueV3
./ng net.accelbyte.sdk.cli.Main iam publicGetConfigValueV3 \
    --configKey 'CTC5IwBy' \
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
    --clientId 'GnRDUmDj' \
    > test.out 2>&1
eval_tap $? 254 'RetrieveActiveOIDCClientsPublicV3' test.out

#- 255 PublicListUserIDByPlatformUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserIDByPlatformUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'qvvHl778' \
    --rawPID  \
    --body '{"platformUserIds": ["7fMz7HuX", "4ExnUxJa", "UiUph0tO"]}' \
    > test.out 2>&1
eval_tap $? 255 'PublicListUserIDByPlatformUserIDsV3' test.out

#- 256 PublicGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'FfekOFxw' \
    --platformUserId 'tHTCGysu' \
    > test.out 2>&1
eval_tap $? 256 'PublicGetUserByPlatformUserIDV3' test.out

#- 257 PublicGetAsyncStatus
./ng net.accelbyte.sdk.cli.Main iam publicGetAsyncStatus \
    --namespace "$AB_NAMESPACE" \
    --requestId 'rAM0yfP7' \
    > test.out 2>&1
eval_tap $? 257 'PublicGetAsyncStatus' test.out

#- 258 PublicSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam publicSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'eB8mLyA6' \
    --limit '30' \
    --offset '18' \
    --platformBy '2bwgMMmb' \
    --platformId 'cEIzXnXh' \
    --query 'iIRfSmCI' \
    > test.out 2>&1
eval_tap $? 258 'PublicSearchUserV3' test.out

#- 259 PublicCreateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "jaDSvdp1", "acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "tn1LJclO", "policyId": "vYRRuTAm", "policyVersionId": "1ZqG0wE8"}, {"isAccepted": true, "localizedPolicyVersionId": "JTNkKQxk", "policyId": "SdGlpLuk", "policyVersionId": "1uHx1ojM"}, {"isAccepted": true, "localizedPolicyVersionId": "GdsgEolW", "policyId": "vuDDplhA", "policyVersionId": "7e6knQhc"}], "authType": "DAtURq5Q", "code": "oZD6f5IA", "country": "xEPyUkNJ", "dateOfBirth": "Ydh5q1cv", "displayName": "Y5sfpI7S", "emailAddress": "CKUcDcQs", "password": "ZkFJ8V5N", "reachMinimumAge": false, "uniqueDisplayName": "LEXSeyku"}' \
    > test.out 2>&1
eval_tap $? 259 'PublicCreateUserV3' test.out

#- 260 CheckUserAvailability
./ng net.accelbyte.sdk.cli.Main iam checkUserAvailability \
    --namespace "$AB_NAMESPACE" \
    --field 'Hg0G6Dn3' \
    --query 'PtfL0jvm' \
    > test.out 2>&1
eval_tap $? 260 'CheckUserAvailability' test.out

#- 261 PublicBulkGetUsers
./ng net.accelbyte.sdk.cli.Main iam publicBulkGetUsers \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["SMFxjgWE", "zVoDrQ99", "nmn4M19E"]}' \
    > test.out 2>&1
eval_tap $? 261 'PublicBulkGetUsers' test.out

#- 262 PublicSendRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicSendRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "hBdE8q7G", "languageTag": "3SPlNCvd"}' \
    > test.out 2>&1
eval_tap $? 262 'PublicSendRegistrationCode' test.out

#- 263 PublicVerifyRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicVerifyRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "fnG9pmYk", "emailAddress": "8wv85pzF"}' \
    > test.out 2>&1
eval_tap $? 263 'PublicVerifyRegistrationCode' test.out

#- 264 PublicForgotPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicForgotPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "lv9p6Sdl", "languageTag": "2NBwDAhj"}' \
    > test.out 2>&1
eval_tap $? 264 'PublicForgotPasswordV3' test.out

#- 265 GetAdminInvitationV3
./ng net.accelbyte.sdk.cli.Main iam getAdminInvitationV3 \
    --invitationId 'DOwdrtIM' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 265 'GetAdminInvitationV3' test.out

#- 266 CreateUserFromInvitationV3
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV3 \
    --invitationId 'o2j5Pb35' \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "ETpe2eZs", "acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "sizw8iZi", "policyId": "CKAE9uhN", "policyVersionId": "6zZtOA0T"}, {"isAccepted": false, "localizedPolicyVersionId": "BOw25HVH", "policyId": "xC3XxKct", "policyVersionId": "Col14AJv"}, {"isAccepted": false, "localizedPolicyVersionId": "Kxf3TS4a", "policyId": "dny6xUXe", "policyVersionId": "R0yRchcd"}], "authType": "0jC54Xdy", "code": "sl4OD9YA", "country": "OzeHywV6", "dateOfBirth": "Vmsb2Usc", "displayName": "PZochn1A", "emailAddress": "gxyznkZA", "password": "qpmJuomN", "reachMinimumAge": false, "uniqueDisplayName": "M3odQI5g"}' \
    > test.out 2>&1
eval_tap $? 266 'CreateUserFromInvitationV3' test.out

#- 267 UpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam updateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "T9lU53ld", "country": "MOAiXHNN", "dateOfBirth": "z6sQcZMw", "displayName": "gu1xeBCv", "languageTag": "HPjX8Aeg", "uniqueDisplayName": "hRJVpGFt", "userName": "Ga3szM1t"}' \
    > test.out 2>&1
eval_tap $? 267 'UpdateUserV3' test.out

#- 268 PublicPartialUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicPartialUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "iMhxmx59", "country": "Lp7I45de", "dateOfBirth": "ysVQYfq0", "displayName": "dHF2uUJi", "languageTag": "XIzOFlXn", "uniqueDisplayName": "tVtftCIr", "userName": "iGH345Wq"}' \
    > test.out 2>&1
eval_tap $? 268 'PublicPartialUpdateUserV3' test.out

#- 269 PublicSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"context": "uzJy36PK", "emailAddress": "QMASJuDS", "languageTag": "5r0eZo0i"}' \
    > test.out 2>&1
eval_tap $? 269 'PublicSendVerificationCodeV3' test.out

#- 270 PublicUserVerificationV3
./ng net.accelbyte.sdk.cli.Main iam publicUserVerificationV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "j0CRdgOR", "contactType": "vHYm5GCa", "languageTag": "epkNhBrH", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 270 'PublicUserVerificationV3' test.out

#- 271 PublicUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "nmTxmJsd", "country": "iAwdwwZE", "dateOfBirth": "7o8ZRBOj", "displayName": "qzdMTyxU", "emailAddress": "KIr22jze", "password": "gYfjdqkG", "uniqueDisplayName": "eVECg9Hg", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 271 'PublicUpgradeHeadlessAccountV3' test.out

#- 272 PublicVerifyHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --needVerificationCode  \
    --body '{"emailAddress": "PzMd1rhH", "password": "uxJ5Rl9n"}' \
    > test.out 2>&1
eval_tap $? 272 'PublicVerifyHeadlessAccountV3' test.out

#- 273 PublicUpdatePasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicUpdatePasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"languageTag": "351O4tbO", "newPassword": "8DdoNStG", "oldPassword": "lGCd4D7O"}' \
    > test.out 2>&1
eval_tap $? 273 'PublicUpdatePasswordV3' test.out

#- 274 PublicCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam publicCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace '79phtxt7' \
    > test.out 2>&1
eval_tap $? 274 'PublicCreateJusticeUser' test.out

#- 275 PublicPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'I8yhFNVg' \
    --redirectUri '1QsuwW99' \
    --ticket 'HiIl1oo4' \
    > test.out 2>&1
eval_tap $? 275 'PublicPlatformLinkV3' test.out

#- 276 PublicPlatformUnlinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'G3UimVKS' \
    --body '{"platformNamespace": "jFyQpzLo"}' \
    > test.out 2>&1
eval_tap $? 276 'PublicPlatformUnlinkV3' test.out

#- 277 PublicPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '1QLbMKph' \
    > test.out 2>&1
eval_tap $? 277 'PublicPlatformUnlinkAllV3' test.out

#- 278 PublicForcePlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicForcePlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '4BOb4nnQ' \
    --ticket 'oOLAj7gc' \
    > test.out 2>&1
eval_tap $? 278 'PublicForcePlatformLinkV3' test.out

#- 279 PublicWebLinkPlatform
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatform \
    --namespace "$AB_NAMESPACE" \
    --platformId 'owwVbdG6' \
    --clientId 'dLRjpjxD' \
    --redirectUri 'uow1feiX' \
    > test.out 2>&1
eval_tap $? 279 'PublicWebLinkPlatform' test.out

#- 280 PublicWebLinkPlatformEstablish
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatformEstablish \
    --namespace "$AB_NAMESPACE" \
    --platformId 'SGPIp1LD' \
    --code 'x4Lii3ve' \
    --state '16YXMzAo' \
    > test.out 2>&1
eval_tap $? 280 'PublicWebLinkPlatformEstablish' test.out

#- 281 PublicProcessWebLinkPlatformV3
./ng net.accelbyte.sdk.cli.Main iam publicProcessWebLinkPlatformV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'OsKPQ80g' \
    --code 'zx91DRBA' \
    --state 'sHAN97u7' \
    > test.out 2>&1
eval_tap $? 281 'PublicProcessWebLinkPlatformV3' test.out

#- 282 PublicGetUsersPlatformInfosV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUsersPlatformInfosV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"platformId": "J3lyaceG", "userIds": ["sYAvaLoH", "odlFo3Li", "cKlTbZY5"]}' \
    > test.out 2>&1
eval_tap $? 282 'PublicGetUsersPlatformInfosV3' test.out

#- 283 ResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam resetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "iSixVIxN", "emailAddress": "otZbtMzI", "newPassword": "KSUxi2UP"}' \
    > test.out 2>&1
eval_tap $? 283 'ResetPasswordV3' test.out

#- 284 PublicGetUserByUserIdV3
eval_tap 0 284 'PublicGetUserByUserIdV3 # SKIP deprecated' test.out

#- 285 PublicGetUserBanHistoryV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserBanHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'pVCvqFYp' \
    --activeOnly  \
    --after 'KakOepUF' \
    --before 'vICvPKdd' \
    --limit '2' \
    > test.out 2>&1
eval_tap $? 285 'PublicGetUserBanHistoryV3' test.out

#- 286 PublicListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'fXauRsSw' \
    > test.out 2>&1
eval_tap $? 286 'PublicListUserAllPlatformAccountsDistinctV3' test.out

#- 287 PublicGetUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'QIBn6mWO' \
    > test.out 2>&1
eval_tap $? 287 'PublicGetUserInformationV3' test.out

#- 288 PublicGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'rON4Rwy1' \
    --after '0.2460062445186968' \
    --before '0.13380999362782942' \
    --limit '54' \
    > test.out 2>&1
eval_tap $? 288 'PublicGetUserLoginHistoriesV3' test.out

#- 289 PublicGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'gjXSsZI0' \
    --after 'hKerZNIC' \
    --before '6EZv5auS' \
    --limit '15' \
    --platformId 'mGTw1uH5' \
    > test.out 2>&1
eval_tap $? 289 'PublicGetUserPlatformAccountsV3' test.out

#- 290 PublicListJusticePlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicListJusticePlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'JTwa3ijM' \
    > test.out 2>&1
eval_tap $? 290 'PublicListJusticePlatformAccountsV3' test.out

#- 291 PublicLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam publicLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'XP8kSEXE' \
    --body '{"platformId": "J1xsV7jz", "platformUserId": "K5SRBWRd"}' \
    > test.out 2>&1
eval_tap $? 291 'PublicLinkPlatformAccount' test.out

#- 292 PublicForceLinkPlatformWithProgression
./ng net.accelbyte.sdk.cli.Main iam publicForceLinkPlatformWithProgression \
    --namespace "$AB_NAMESPACE" \
    --userId 'IfW6mU3d' \
    --body '{"chosenNamespaces": ["frxxePey", "mdp00Yfp", "NLsRgbsG"], "requestId": "otsRvmPe"}' \
    > test.out 2>&1
eval_tap $? 292 'PublicForceLinkPlatformWithProgression' test.out

#- 293 PublicGetPublisherUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetPublisherUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'USJOJAVw' \
    > test.out 2>&1
eval_tap $? 293 'PublicGetPublisherUserV3' test.out

#- 294 PublicValidateUserByUserIDAndPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserByUserIDAndPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'JHUWbXGC' \
    --password '1YyBd41S' \
    > test.out 2>&1
eval_tap $? 294 'PublicValidateUserByUserIDAndPasswordV3' test.out

#- 295 PublicGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRolesV3 \
    --after 'UuAIp3BX' \
    --before 'cTfOoNym' \
    --isWildcard  \
    --limit '36' \
    > test.out 2>&1
eval_tap $? 295 'PublicGetRolesV3' test.out

#- 296 PublicGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRoleV3 \
    --roleId 'muunKFU3' \
    > test.out 2>&1
eval_tap $? 296 'PublicGetRoleV3' test.out

#- 297 PublicGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyUserV3 \
    --includeAllPlatforms  \
    > test.out 2>&1
eval_tap $? 297 'PublicGetMyUserV3' test.out

#- 298 PublicGetLinkHeadlessAccountToMyAccountConflictV3
./ng net.accelbyte.sdk.cli.Main iam publicGetLinkHeadlessAccountToMyAccountConflictV3 \
    --oneTimeLinkCode 'PeSN0jHJ' \
    > test.out 2>&1
eval_tap $? 298 'PublicGetLinkHeadlessAccountToMyAccountConflictV3' test.out

#- 299 LinkHeadlessAccountToMyAccountV3
./ng net.accelbyte.sdk.cli.Main iam linkHeadlessAccountToMyAccountV3 \
    --body '{"chosenNamespaces": ["QRGAPGgh", "1VPytuZS", "oEAnX8FJ"], "oneTimeLinkCode": "3AW7OJ1s"}' \
    > test.out 2>&1
eval_tap $? 299 'LinkHeadlessAccountToMyAccountV3' test.out

#- 300 PublicSendVerificationLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationLinkV3 \
    --body '{"languageTag": "3kaqdcAf"}' \
    > test.out 2>&1
eval_tap $? 300 'PublicSendVerificationLinkV3' test.out

#- 301 PublicVerifyUserByLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyUserByLinkV3 \
    --code 'K2tvjM3z' \
    > test.out 2>&1
eval_tap $? 301 'PublicVerifyUserByLinkV3' test.out

#- 302 PlatformAuthenticateSAMLV3Handler
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticateSAMLV3Handler \
    --platformId 'yLqVbU1Y' \
    --code 'pdkEL2Vv' \
    --error 'qhVug5a2' \
    --state '4aB7Fsfb' \
    > test.out 2>&1
eval_tap $? 302 'PlatformAuthenticateSAMLV3Handler' test.out

#- 303 LoginSSOClient
./ng net.accelbyte.sdk.cli.Main iam loginSSOClient \
    --platformId 'iVmfzrCy' \
    --payload 'UyEk3vWN' \
    > test.out 2>&1
eval_tap $? 303 'LoginSSOClient' test.out

#- 304 LogoutSSOClient
./ng net.accelbyte.sdk.cli.Main iam logoutSSOClient \
    --platformId 'PMWVKcJZ' \
    > test.out 2>&1
eval_tap $? 304 'LogoutSSOClient' test.out

#- 305 RequestTargetTokenResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTargetTokenResponseV3 \
    --additionalData 'ii6lh6FA' \
    --code 'Tqosla0O' \
    > test.out 2>&1
eval_tap $? 305 'RequestTargetTokenResponseV3' test.out

#- 306 AdminListInvitationHistoriesV4
./ng net.accelbyte.sdk.cli.Main iam adminListInvitationHistoriesV4 \
    --limit '92' \
    --namespace "$AB_NAMESPACE" \
    --offset '20' \
    > test.out 2>&1
eval_tap $? 306 'AdminListInvitationHistoriesV4' test.out

#- 307 AdminGetDevicesByUserV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDevicesByUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '4U0IxEX9' \
    > test.out 2>&1
eval_tap $? 307 'AdminGetDevicesByUserV4' test.out

#- 308 AdminGetBannedDevicesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedDevicesV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceType '5U951bKM' \
    --endDate 'WOljy5nL' \
    --limit '98' \
    --offset '11' \
    --startDate '7ITcTVUs' \
    > test.out 2>&1
eval_tap $? 308 'AdminGetBannedDevicesV4' test.out

#- 309 AdminGetUserDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeviceBansV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Wum2ADLm' \
    > test.out 2>&1
eval_tap $? 309 'AdminGetUserDeviceBansV4' test.out

#- 310 AdminBanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminBanDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"comment": "92zfxCzy", "deviceId": "ln6IL9Pl", "deviceType": "zoFbPg1B", "enabled": true, "endDate": "OT0xR3NH", "ext": {"y96PFdoj": {}, "KNdjOdW4": {}, "DVOQTBDe": {}}, "reason": "d0Meiq0O"}' \
    > test.out 2>&1
eval_tap $? 310 'AdminBanDeviceV4' test.out

#- 311 AdminGetDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBanV4 \
    --banId 'gsufpmiJ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 311 'AdminGetDeviceBanV4' test.out

#- 312 AdminUpdateDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateDeviceBanV4 \
    --banId 'mBXRo0KN' \
    --namespace "$AB_NAMESPACE" \
    --body '{"enabled": false}' \
    > test.out 2>&1
eval_tap $? 312 'AdminUpdateDeviceBanV4' test.out

#- 313 AdminGenerateReportV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateReportV4 \
    --namespace "$AB_NAMESPACE" \
    --endDate 'KB28MiCx' \
    --startDate '9iDcVh9q' \
    --deviceType 'SEGkzU3V' \
    > test.out 2>&1
eval_tap $? 313 'AdminGenerateReportV4' test.out

#- 314 AdminGetDeviceTypesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceTypesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 314 'AdminGetDeviceTypesV4' test.out

#- 315 AdminGetDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBansV4 \
    --deviceId 'ArIcHbp3' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 315 'AdminGetDeviceBansV4' test.out

#- 316 AdminDecryptDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminDecryptDeviceV4 \
    --deviceId 'SwGRqwLk' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 316 'AdminDecryptDeviceV4' test.out

#- 317 AdminUnbanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminUnbanDeviceV4 \
    --deviceId 'WIcz7RHO' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 317 'AdminUnbanDeviceV4' test.out

#- 318 AdminGetUsersByDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUsersByDeviceV4 \
    --deviceId 'fQDJ29QF' \
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
    --limit '2' \
    --offset '68' \
    > test.out 2>&1
eval_tap $? 320 'AdminGetNamespaceUserInvitationHistoryV4' test.out

#- 321 AdminCreateTestUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateTestUsersV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 78}' \
    > test.out 2>&1
eval_tap $? 321 'AdminCreateTestUsersV4' test.out

#- 322 AdminCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "U0GUie3c", "policyId": "DNVLPJbZ", "policyVersionId": "15n7Tc3O"}, {"isAccepted": true, "localizedPolicyVersionId": "KQg95Ji3", "policyId": "f7Myrzpk", "policyVersionId": "M5sDjhiI"}, {"isAccepted": true, "localizedPolicyVersionId": "cNPfPbRg", "policyId": "JGHqDNqg", "policyVersionId": "lSxr0Ni7"}], "authType": "EMAILPASSWD", "code": "HaIyr1FN", "country": "JaOOdC2U", "dateOfBirth": "nuxMhFgz", "displayName": "GEMnonB4", "emailAddress": "y267J2IY", "password": "Nu6bce47", "passwordMD5Sum": "SAzqgQ8J", "reachMinimumAge": false, "uniqueDisplayName": "6xiXSsFv", "username": "1xENny2C"}' \
    > test.out 2>&1
eval_tap $? 322 'AdminCreateUserV4' test.out

#- 323 AdminBulkUpdateUserAccountTypeV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateUserAccountTypeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"testAccount": false, "userIds": ["eN7jOdBh", "Lvy1jYM2", "hBYWB601"]}' \
    > test.out 2>&1
eval_tap $? 323 'AdminBulkUpdateUserAccountTypeV4' test.out

#- 324 AdminBulkCheckValidUserIDV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkCheckValidUserIDV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["bJD6PiIy", "mxAQUPeY", "mzSV9dkP"]}' \
    > test.out 2>&1
eval_tap $? 324 'AdminBulkCheckValidUserIDV4' test.out

#- 325 AdminUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'JJLAzT3t' \
    --body '{"avatarUrl": "4DfCbcvv", "country": "Gov6nxVs", "dateOfBirth": "7xWgJaAg", "displayName": "SKSVva2f", "languageTag": "nlMxtH0j", "skipLoginQueue": true, "uniqueDisplayName": "GU16fEi4", "userName": "EdY0nMPz"}' \
    > test.out 2>&1
eval_tap $? 325 'AdminUpdateUserV4' test.out

#- 326 AdminUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'jqpW5jd7' \
    --body '{"code": "BIMxJhVw", "emailAddress": "D1yecZaA"}' \
    > test.out 2>&1
eval_tap $? 326 'AdminUpdateUserEmailAddressV4' test.out

#- 327 AdminDisableUserMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableUserMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'r27VFi3k' \
    > test.out 2>&1
eval_tap $? 327 'AdminDisableUserMFAV4' test.out

#- 328 AdminListUserRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminListUserRolesV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'eMqJSGnf' \
    > test.out 2>&1
eval_tap $? 328 'AdminListUserRolesV4' test.out

#- 329 AdminUpdateUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'UUhsXkDb' \
    --body '{"assignedNamespaces": ["DfWk026R", "glEMV7k0", "j5HzaVPz"], "roleId": "Z7R88efx"}' \
    > test.out 2>&1
eval_tap $? 329 'AdminUpdateUserRoleV4' test.out

#- 330 AdminAddUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'OWmXYcK1' \
    --body '{"assignedNamespaces": ["Jp9l1ihL", "W4H9vH3K", "CavyPNJF"], "roleId": "tdGRHgNd"}' \
    > test.out 2>&1
eval_tap $? 330 'AdminAddUserRoleV4' test.out

#- 331 AdminRemoveUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRemoveUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'WzsnqGNZ' \
    --body '{"assignedNamespaces": ["V452hKlT", "RgAIm5m1", "7KQSX47g"], "roleId": "zNu0OfNq"}' \
    > test.out 2>&1
eval_tap $? 331 'AdminRemoveUserRoleV4' test.out

#- 332 AdminGetRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV4 \
    --adminRole  \
    --isWildcard  \
    --limit '72' \
    --offset '68' \
    > test.out 2>&1
eval_tap $? 332 'AdminGetRolesV4' test.out

#- 333 AdminCreateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV4 \
    --body '{"adminRole": false, "deletable": true, "isWildcard": false, "roleName": "wwN410Nn"}' \
    > test.out 2>&1
eval_tap $? 333 'AdminCreateRoleV4' test.out

#- 334 AdminGetRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV4 \
    --roleId 'z35Vbl9f' \
    > test.out 2>&1
eval_tap $? 334 'AdminGetRoleV4' test.out

#- 335 AdminDeleteRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV4 \
    --roleId 'zRJBruOy' \
    > test.out 2>&1
eval_tap $? 335 'AdminDeleteRoleV4' test.out

#- 336 AdminUpdateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV4 \
    --roleId 'L5hhNSrn' \
    --body '{"adminRole": false, "deletable": true, "isWildcard": false, "roleName": "57XqJhko"}' \
    > test.out 2>&1
eval_tap $? 336 'AdminUpdateRoleV4' test.out

#- 337 AdminUpdateRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV4 \
    --roleId 'OAf13Nrv' \
    --body '{"permissions": [{"action": 1, "resource": "9EQY5cGN", "schedAction": 17, "schedCron": "xiuBnOHb", "schedRange": ["5uM0bonQ", "RTiZg4C4", "Jy8xdi4d"]}, {"action": 25, "resource": "bB3vLmxP", "schedAction": 20, "schedCron": "5OONsKLR", "schedRange": ["h8orIKjd", "0pMknIt0", "aR4N9sP9"]}, {"action": 74, "resource": "z9lgO4D2", "schedAction": 95, "schedCron": "A7tw9Tbu", "schedRange": ["NeLeQ8TI", "c1glOmmi", "qPpyaPfV"]}]}' \
    > test.out 2>&1
eval_tap $? 337 'AdminUpdateRolePermissionsV4' test.out

#- 338 AdminAddRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV4 \
    --roleId 'OFko58Kw' \
    --body '{"permissions": [{"action": 50, "resource": "easX1bHx", "schedAction": 88, "schedCron": "Nx29qEuq", "schedRange": ["nQ4G7arz", "d2KG9sQw", "c1w8MBbN"]}, {"action": 28, "resource": "Vtt7Xlq1", "schedAction": 48, "schedCron": "bOkoxl0Q", "schedRange": ["XkL68LfU", "81fHMRUi", "q8u47bDG"]}, {"action": 5, "resource": "HI0mxs20", "schedAction": 19, "schedCron": "p7fyIxPJ", "schedRange": ["KfEoJ6nC", "pHNrqb68", "jNAPdCfZ"]}]}' \
    > test.out 2>&1
eval_tap $? 338 'AdminAddRolePermissionsV4' test.out

#- 339 AdminDeleteRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV4 \
    --roleId 'KaNO3BZM' \
    --body '["6nEtE6kv", "Efj1g6De", "uxJbHBKQ"]' \
    > test.out 2>&1
eval_tap $? 339 'AdminDeleteRolePermissionsV4' test.out

#- 340 AdminListAssignedUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminListAssignedUsersV4 \
    --roleId 'tgw1vTMY' \
    --after 'KUDxG8Sa' \
    --before 'fXRGy6E1' \
    --limit '45' \
    > test.out 2>&1
eval_tap $? 340 'AdminListAssignedUsersV4' test.out

#- 341 AdminAssignUserToRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAssignUserToRoleV4 \
    --roleId 'eQiyLsVx' \
    --body '{"assignedNamespaces": ["iumibnMF", "LvUNUzZv", "oHcggMk8"], "namespace": "n8KN2MEj", "userId": "5h8S2caE"}' \
    > test.out 2>&1
eval_tap $? 341 'AdminAssignUserToRoleV4' test.out

#- 342 AdminRevokeUserFromRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRevokeUserFromRoleV4 \
    --roleId '393ml9O2' \
    --body '{"namespace": "rvf1stzl", "userId": "3xXHwHsu"}' \
    > test.out 2>&1
eval_tap $? 342 'AdminRevokeUserFromRoleV4' test.out

#- 343 AdminInviteUserNewV4
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserNewV4 \
    --body '{"assignedNamespaces": ["OswEAsNP", "5UQBxhBR", "QdeFj1oE"], "emailAddresses": ["RuUVmscA", "1dPWUcz2", "nipznkM7"], "isAdmin": true, "isNewStudio": true, "namespace": "KyRnngCp", "roleId": "JRO0chJo"}' \
    > test.out 2>&1
eval_tap $? 343 'AdminInviteUserNewV4' test.out

#- 344 AdminUpdateMyUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateMyUserV4 \
    --body '{"avatarUrl": "AShUkNi2", "country": "D2eSR1Ad", "dateOfBirth": "O3E94fZV", "displayName": "806gUzhL", "languageTag": "OMV42jSY", "skipLoginQueue": false, "uniqueDisplayName": "C1fgAxzG", "userName": "K3byeSKu"}' \
    > test.out 2>&1
eval_tap $? 344 'AdminUpdateMyUserV4' test.out

#- 345 AdminDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyAuthenticatorV4 \
    > test.out 2>&1
eval_tap $? 345 'AdminDisableMyAuthenticatorV4' test.out

#- 346 AdminEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyAuthenticatorV4 \
    --code 'U8UTmtVX' \
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
    --code 'bhmLd0s3' \
    > test.out 2>&1
eval_tap $? 358 'AdminEnableMyEmailV4' test.out

#- 359 AdminGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyEnabledFactorsV4 \
    > test.out 2>&1
eval_tap $? 359 'AdminGetMyEnabledFactorsV4' test.out

#- 360 AdminMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam adminMakeFactorMyDefaultV4 \
    --factor 'DpC8OSsA' \
    > test.out 2>&1
eval_tap $? 360 'AdminMakeFactorMyDefaultV4' test.out

#- 361 AdminInviteUserV4
eval_tap 0 361 'AdminInviteUserV4 # SKIP deprecated' test.out

#- 362 AuthenticationWithPlatformLinkV4
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV4 \
    --extendExp  \
    --clientId 'J5YJfSa0' \
    --linkingToken 'PsDzhRaQ' \
    --password 'ASvj3oK4' \
    --username '6sJsJMoQ' \
    > test.out 2>&1
eval_tap $? 362 'AuthenticationWithPlatformLinkV4' test.out

#- 363 GenerateTokenByNewHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV4 \
    --additionalData 'riWdwyh5' \
    --extendExp  \
    --linkingToken '1GYWeYOu' \
    > test.out 2>&1
eval_tap $? 363 'GenerateTokenByNewHeadlessAccountV4' test.out

#- 364 Verify2faCodeV4
./ng net.accelbyte.sdk.cli.Main iam verify2faCodeV4 \
    --code 'MvMLccjr' \
    --factor 'NSdoXrfr' \
    --mfaToken 'dPpd0p4R' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 364 'Verify2faCodeV4' test.out

#- 365 PlatformTokenGrantV4
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV4 \
    --platformId '0UHeqqYg' \
    --codeChallenge 'ZAGIaDSX' \
    --codeChallengeMethod 'plain' \
    --additionalData '5F5Tpd8q' \
    --clientId 'c7Me6Enw' \
    --createHeadless  \
    --deviceId 'meoL3t51' \
    --macAddress 'FTYEtsJS' \
    --platformToken 'P1q6SuLK' \
    --skipSetCookie  \
    > test.out 2>&1
eval_tap $? 365 'PlatformTokenGrantV4' test.out

#- 366 SimultaneousLoginV4
./ng net.accelbyte.sdk.cli.Main iam simultaneousLoginV4 \
    --codeChallenge 'TZQQXpe8' \
    --codeChallengeMethod 'plain' \
    --simultaneousPlatform 'q8pACuY6' \
    --simultaneousTicket 'kI7Lcgpj' \
    --nativePlatform 'epicgames' \
    --nativePlatformTicket 'nfE7TWSC' \
    > test.out 2>&1
eval_tap $? 366 'SimultaneousLoginV4' test.out

#- 367 TokenGrantV4
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV4 \
    --codeChallenge 'qQpu9lQ0' \
    --codeChallengeMethod 'plain' \
    --additionalData 'MwreYLfH' \
    --clientId '3wcg3RMI' \
    --code 'OTgVIUAs' \
    --codeVerifier 'Cxqm6LkD' \
    --extendNamespace 'r4MQK1Gz' \
    --extendExp  \
    --loginQueueTicket 'iL9RSTti' \
    --password 'IbwftBrU' \
    --redirectUri '76eIj4KD' \
    --refreshToken '2Xlo5Rdd' \
    --username 'mAuxZ6RE' \
    --grantType 'urn:ietf:params:oauth:grant-type:login_queue_ticket' \
    > test.out 2>&1
eval_tap $? 367 'TokenGrantV4' test.out

#- 368 RequestTargetTokenResponseV4
./ng net.accelbyte.sdk.cli.Main iam requestTargetTokenResponseV4 \
    --additionalData 'd00xDegR' \
    --code 'BYPJACqL' \
    > test.out 2>&1
eval_tap $? 368 'RequestTargetTokenResponseV4' test.out

#- 369 PublicCreateTestUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateTestUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "N9o9euMe", "policyId": "D8EP66ax", "policyVersionId": "yAmOH0Tp"}, {"isAccepted": true, "localizedPolicyVersionId": "R1vkq3jb", "policyId": "4fEDfovD", "policyVersionId": "RRbWHuPH"}, {"isAccepted": false, "localizedPolicyVersionId": "hJtKMhmf", "policyId": "ayYOtPSe", "policyVersionId": "qvfFWI12"}], "authType": "EMAILPASSWD", "country": "wjXAfuSr", "dateOfBirth": "OGZjusVP", "displayName": "SI4YtqNf", "emailAddress": "T4Q9AWaL", "password": "4z7LciJ3", "passwordMD5Sum": "DfNb4BCe", "uniqueDisplayName": "ry00X5o8", "username": "2Vjk9zHn", "verified": true}' \
    > test.out 2>&1
eval_tap $? 369 'PublicCreateTestUserV4' test.out

#- 370 PublicCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "BHkcQYIz", "policyId": "yKUApOrf", "policyVersionId": "IxZmmxv3"}, {"isAccepted": true, "localizedPolicyVersionId": "jpzXwuVD", "policyId": "mdT3D5fl", "policyVersionId": "JxRUpMly"}, {"isAccepted": true, "localizedPolicyVersionId": "JBvsMOqc", "policyId": "z7oxNcgA", "policyVersionId": "kAMJPTAD"}], "authType": "EMAILPASSWD", "code": "SyWcfjq7", "country": "cnseBNpO", "dateOfBirth": "VF3Z5tLg", "displayName": "wvJM6HSg", "emailAddress": "RMAmhaTA", "password": "1yscVRnw", "passwordMD5Sum": "aLTwnYzo", "reachMinimumAge": true, "uniqueDisplayName": "QpJngLFo", "username": "UvJzFEF7"}' \
    > test.out 2>&1
eval_tap $? 370 'PublicCreateUserV4' test.out

#- 371 CreateUserFromInvitationV4
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV4 \
    --invitationId 'kJExINeC' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "TJh85i0t", "policyId": "JBBTbj4M", "policyVersionId": "0lhID8tz"}, {"isAccepted": false, "localizedPolicyVersionId": "kOCg86h7", "policyId": "f7j07tWH", "policyVersionId": "04LsGGUF"}, {"isAccepted": false, "localizedPolicyVersionId": "UrgB4Fxw", "policyId": "7RTrspPR", "policyVersionId": "xSi5OZSn"}], "authType": "EMAILPASSWD", "code": "gT0dzevu", "country": "JKjvSJKS", "dateOfBirth": "7jtdkEyJ", "displayName": "XGxEXb5E", "emailAddress": "H43ECEtI", "password": "SkQyxCMj", "passwordMD5Sum": "XqkouSGv", "reachMinimumAge": true, "uniqueDisplayName": "jv65WW1I", "username": "AkJYetHn"}' \
    > test.out 2>&1
eval_tap $? 371 'CreateUserFromInvitationV4' test.out

#- 372 PublicUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "vO6G4sCl", "country": "nUtarGQp", "dateOfBirth": "SOklj8sY", "displayName": "0tC4ytm3", "languageTag": "iJxeXQlQ", "uniqueDisplayName": "kZodO3MJ", "userName": "ocGZFlId"}' \
    > test.out 2>&1
eval_tap $? 372 'PublicUpdateUserV4' test.out

#- 373 PublicUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "ESvqlCgq", "emailAddress": "EDi4Je5Q"}' \
    > test.out 2>&1
eval_tap $? 373 'PublicUpdateUserEmailAddressV4' test.out

#- 374 PublicUpgradeHeadlessAccountWithVerificationCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountWithVerificationCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "l1qQZyYi", "country": "J1bl7tGA", "dateOfBirth": "MM1WibnT", "displayName": "SuILnz9I", "emailAddress": "JNb5azR7", "password": "L87LKBXi", "reachMinimumAge": false, "uniqueDisplayName": "3ocrRisK", "username": "27696k3q", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 374 'PublicUpgradeHeadlessAccountWithVerificationCodeV4' test.out

#- 375 PublicUpgradeHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "C2RYz91I", "password": "Oef6emp8", "username": "F7Fql17l"}' \
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
    --code 'W14qi8Im' \
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
    --deviceToken '408WyGtB' \
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
    --code 'rYqyoflB' \
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
    --factor '3ItVgCMQ' \
    > test.out 2>&1
eval_tap $? 392 'PublicMakeFactorMyDefaultV4' test.out

#- 393 PublicGetUserPublicInfoByUserIdV4
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPublicInfoByUserIdV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Gl05lgtU' \
    > test.out 2>&1
eval_tap $? 393 'PublicGetUserPublicInfoByUserIdV4' test.out

#- 394 PublicInviteUserV4
./ng net.accelbyte.sdk.cli.Main iam publicInviteUserV4 \
    --body '{"additionalData": "LGOlQnh3", "emailAddress": "DVFr45LJ", "namespace": "zdchF5wz", "namespaceDisplayName": "7hiY6RLy"}' \
    > test.out 2>&1
eval_tap $? 394 'PublicInviteUserV4' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
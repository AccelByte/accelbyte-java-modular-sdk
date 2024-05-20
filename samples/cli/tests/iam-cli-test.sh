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
echo "1..395"

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
    --body '{"modules": [{"docLink": "giRUB3Ia", "groups": [{"group": "UYTT1hhZ", "groupId": "GT97F4G2", "permissions": [{"allowedActions": [66, 18, 89], "resource": "sKjIwNNF"}, {"allowedActions": [52, 10, 3], "resource": "LwaJT4bs"}, {"allowedActions": [60, 63, 37], "resource": "q47xyP5c"}]}, {"group": "t9VvBCgd", "groupId": "4US2wCPW", "permissions": [{"allowedActions": [16, 87, 33], "resource": "BMeazeuO"}, {"allowedActions": [70, 71, 47], "resource": "f6Vf75A4"}, {"allowedActions": [56, 85, 99], "resource": "QqG7hMf5"}]}, {"group": "xknp0pPE", "groupId": "EwzGrRIe", "permissions": [{"allowedActions": [23, 87, 31], "resource": "Jrt9kq4B"}, {"allowedActions": [16, 29, 28], "resource": "a8BnTbSP"}, {"allowedActions": [23, 38, 99], "resource": "WbapCIqM"}]}], "module": "1P4yNfmo", "moduleId": "E41rbh2q"}, {"docLink": "eWz5yZrv", "groups": [{"group": "lwsZSfYI", "groupId": "bUxN8Bjm", "permissions": [{"allowedActions": [20, 53, 5], "resource": "d2LDmbfI"}, {"allowedActions": [93, 83, 41], "resource": "gbrLkD4f"}, {"allowedActions": [98, 74, 13], "resource": "xGYB3xP1"}]}, {"group": "zEn4SCAf", "groupId": "kEUhyq0Q", "permissions": [{"allowedActions": [85, 2, 12], "resource": "rwJVyGek"}, {"allowedActions": [57, 38, 21], "resource": "IJ0LjQsc"}, {"allowedActions": [30, 99, 65], "resource": "M7FWK8dI"}]}, {"group": "7usVFZeP", "groupId": "1H6nPEDr", "permissions": [{"allowedActions": [42, 59, 13], "resource": "nMvfcgF2"}, {"allowedActions": [65, 30, 38], "resource": "fABXGlYG"}, {"allowedActions": [76, 92, 97], "resource": "wCorhaFd"}]}], "module": "U47DutX7", "moduleId": "wPyIz0zE"}, {"docLink": "EThh5b2O", "groups": [{"group": "juPHWYZW", "groupId": "r4YFjkjC", "permissions": [{"allowedActions": [39, 75, 50], "resource": "MsRJhwmw"}, {"allowedActions": [18, 72, 16], "resource": "gHh8Uh4O"}, {"allowedActions": [1, 97, 49], "resource": "igEm78rt"}]}, {"group": "Uv6rf6SR", "groupId": "QpHlYcZJ", "permissions": [{"allowedActions": [86, 21, 2], "resource": "f4IA603h"}, {"allowedActions": [17, 5, 28], "resource": "FzGyA47g"}, {"allowedActions": [15, 75, 61], "resource": "7iaBhs4H"}]}, {"group": "1I3zT4vs", "groupId": "05vhDDpM", "permissions": [{"allowedActions": [30, 31, 88], "resource": "Yh9vcfjC"}, {"allowedActions": [23, 28, 77], "resource": "RSB1bNjF"}, {"allowedActions": [64, 7, 22], "resource": "r4KUz50U"}]}], "module": "oWKBJJeG", "moduleId": "SFP4KqvV"}]}' \
    > test.out 2>&1
eval_tap $? 109 'AdminUpdateAvailablePermissionsByModule' test.out

#- 110 AdminDeleteConfigPermissionsByGroup
./ng net.accelbyte.sdk.cli.Main iam adminDeleteConfigPermissionsByGroup \
    --forceDelete  \
    --body '{"groupId": "wVRnYcQa", "moduleId": "7o40K9IF"}' \
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
    --body '[{"field": "sf3suvwI", "validation": {"allowAllSpecialCharacters": false, "allowDigit": true, "allowLetter": false, "allowSpace": true, "allowUnicode": false, "avatarConfig": {"allowedPrefixes": ["2ON1sTYA", "DNw7Q7Et", "6jwV5Idb"], "preferRegex": false, "regex": "rDCYC27B"}, "blockedWord": ["wSLVRs4O", "yUKNUA08", "IwOZihXk"], "description": [{"language": "PtSOEKhx", "message": ["QmbuAdz1", "IOCrB1Zh", "0sRXAmNt"]}, {"language": "CY0KR048", "message": ["aRgHvw84", "xQXrtJGB", "HvnbdNs1"]}, {"language": "4uX5uHlR", "message": ["i6DqOTpR", "P1UPMYAT", "JJIu0ClC"]}], "isCustomRegex": true, "letterCase": "JU2k9wlc", "maxLength": 5, "maxRepeatingAlphaNum": 34, "maxRepeatingSpecialCharacter": 59, "minCharType": 34, "minLength": 20, "regex": "saEjIXlT", "specialCharacterLocation": "VcG50S97", "specialCharacters": ["s8WuzjVc", "MBzbk7Z9", "HnQ0MF0U"]}}, {"field": "EdzzzNPv", "validation": {"allowAllSpecialCharacters": false, "allowDigit": false, "allowLetter": false, "allowSpace": true, "allowUnicode": true, "avatarConfig": {"allowedPrefixes": ["a4VZJVZr", "IFyELFYi", "ZlBddXni"], "preferRegex": true, "regex": "dJhgU91t"}, "blockedWord": ["A0J8XQm5", "4kiFJAMy", "lorTyRL5"], "description": [{"language": "RNMvjcLP", "message": ["ZoTmUm48", "TAOxamod", "6bT9GXg5"]}, {"language": "AKkMD5rL", "message": ["GSA6HzZa", "NoWkzgU1", "0FrJ3NVG"]}, {"language": "xTnsO2q7", "message": ["IYc3r3E9", "nahiXoBu", "3VS6XaON"]}], "isCustomRegex": false, "letterCase": "cY5QkIUt", "maxLength": 64, "maxRepeatingAlphaNum": 36, "maxRepeatingSpecialCharacter": 47, "minCharType": 20, "minLength": 52, "regex": "7p10D2lL", "specialCharacterLocation": "s0AxtaSy", "specialCharacters": ["yjvkTQhI", "v59Ys0We", "ymtipT0P"]}}, {"field": "5xjN4Io6", "validation": {"allowAllSpecialCharacters": true, "allowDigit": true, "allowLetter": true, "allowSpace": false, "allowUnicode": true, "avatarConfig": {"allowedPrefixes": ["VEK0YsPU", "nryf8uh8", "ZkzEdAbM"], "preferRegex": false, "regex": "kXtBQ37i"}, "blockedWord": ["FhHdlCGn", "PTZiDgvH", "0uCkSoAT"], "description": [{"language": "lBHgSZGB", "message": ["eOD65fuj", "iXBn7hjr", "JCLLcxpM"]}, {"language": "exDL0Js3", "message": ["zXw7cZar", "TSHJEXEJ", "Y6isztF5"]}, {"language": "bs0rlZVn", "message": ["3vZl3H6V", "aEr4QnCo", "lrCTS3AY"]}], "isCustomRegex": true, "letterCase": "b9487JjM", "maxLength": 85, "maxRepeatingAlphaNum": 83, "maxRepeatingSpecialCharacter": 53, "minCharType": 34, "minLength": 66, "regex": "iYJ19iFW", "specialCharacterLocation": "6HcXSj5g", "specialCharacters": ["xiEUWeCR", "5NYaIE1K", "Z48SN8Vs"]}}]' \
    > test.out 2>&1
eval_tap $? 113 'AdminUpdateInputValidations' test.out

#- 114 AdminResetInputValidations
./ng net.accelbyte.sdk.cli.Main iam adminResetInputValidations \
    --field 'Mg1foo7O' \
    > test.out 2>&1
eval_tap $? 114 'AdminResetInputValidations' test.out

#- 115 ListAdminsV3
./ng net.accelbyte.sdk.cli.Main iam listAdminsV3 \
    --namespace "$AB_NAMESPACE" \
    --after 'wSKtqljM' \
    --before 'PCU3clvw' \
    --endDate 'gT36H8tA' \
    --limit '30' \
    --query 'lZDFHk2k' \
    --roleId 'xNXe4ah4' \
    --startDate '0Sqbf7Dq' \
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
    --body '{"ageRestriction": 73, "enable": true}' \
    > test.out 2>&1
eval_tap $? 117 'AdminUpdateAgeRestrictionConfigV3' test.out

#- 118 AdminGetListCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminGetListCountryAgeRestrictionV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 118 'AdminGetListCountryAgeRestrictionV3' test.out

#- 119 AdminUpdateCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateCountryAgeRestrictionV3 \
    --countryCode 'ESa7DP2X' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ageRestriction": 88}' \
    > test.out 2>&1
eval_tap $? 119 'AdminUpdateCountryAgeRestrictionV3' test.out

#- 120 AdminGetBannedUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType 'hKu9Yhds' \
    --limit '73' \
    --offset '27' \
    > test.out 2>&1
eval_tap $? 120 'AdminGetBannedUsersV3' test.out

#- 121 AdminBanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"ban": "THTzksaz", "comment": "2S5JSvdP", "endDate": "DNbr4BCH", "reason": "OVgB98Ez", "skipNotif": false, "userIds": ["BWUwSx6n", "oPw5mquV", "e1CuXbYE"]}' \
    > test.out 2>&1
eval_tap $? 121 'AdminBanUserBulkV3' test.out

#- 122 AdminUnbanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminUnbanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"bans": [{"banId": "M0Urstnq", "userId": "SooznEaT"}, {"banId": "3nLcVkek", "userId": "wCnQAHNZ"}, {"banId": "QYJKMFG8", "userId": "XMsDBNoI"}]}' \
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
    --clientId 'yDqz014I' \
    --clientName 'vX62TrqS' \
    --clientType 'UGqCkkg1' \
    --limit '4' \
    --offset '18' \
    --skipLoginQueue  \
    > test.out 2>&1
eval_tap $? 124 'AdminGetClientsByNamespaceV3' test.out

#- 125 AdminBulkUpdateClientsV3
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateClientsV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientIds": ["KCNyu2kS", "uhp03YIP", "cjROfvQW"], "clientUpdateRequest": {"audiences": ["NEgiB87X", "g0hAgdj9", "edDS53ye"], "baseUri": "6zOjkSs4", "clientName": "L4z9DKKw", "clientPermissions": [{"action": 45, "resource": "HwgPj0kE", "schedAction": 50, "schedCron": "JsO0DVT6", "schedRange": ["srqNvJMp", "h8MEWPUn", "b5CpStTf"]}, {"action": 12, "resource": "AMWaOeJo", "schedAction": 55, "schedCron": "6A4SMYQV", "schedRange": ["nJU7ERAW", "c2Y2hIBa", "y4qyVv64"]}, {"action": 22, "resource": "TSDeOar4", "schedAction": 5, "schedCron": "yeKH2erE", "schedRange": ["v5T7akb8", "p4hJagWU", "WRH5DoqR"]}], "clientPlatform": "DB25mF2g", "deletable": true, "description": "Hvb6O12C", "modulePermissions": [{"moduleId": "SD8fLUZQ", "selectedGroups": [{"groupId": "Xq16TyU7", "selectedActions": [35, 57, 87]}, {"groupId": "YrUkA42K", "selectedActions": [39, 4, 79]}, {"groupId": "XZW8C3dU", "selectedActions": [74, 34, 8]}]}, {"moduleId": "TjSieszY", "selectedGroups": [{"groupId": "b3uZtGb5", "selectedActions": [49, 62, 100]}, {"groupId": "A1yag4YM", "selectedActions": [52, 14, 75]}, {"groupId": "CRScqwLH", "selectedActions": [40, 92, 72]}]}, {"moduleId": "WOC2hjNF", "selectedGroups": [{"groupId": "5TeDB1Ik", "selectedActions": [52, 82, 60]}, {"groupId": "6MCTczZf", "selectedActions": [81, 69, 24]}, {"groupId": "4ONlHAs3", "selectedActions": [34, 9, 18]}]}], "namespace": "LRpV0BzN", "oauthAccessTokenExpiration": 57, "oauthAccessTokenExpirationTimeUnit": "IInOQG9K", "oauthRefreshTokenExpiration": 56, "oauthRefreshTokenExpirationTimeUnit": "VpZJx0o4", "redirectUri": "fKtVqTDQ", "scopes": ["ZsFCUDZY", "Zt0YOZyd", "deyDrtjK"], "skipLoginQueue": false, "twoFactorEnabled": true}}' \
    > test.out 2>&1
eval_tap $? 125 'AdminBulkUpdateClientsV3' test.out

#- 126 AdminCreateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateClientV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["pwlAfzrn", "TszFMQ6h", "wKAhaal2"], "baseUri": "8l5ES5KF", "clientId": "Dgv7aUEG", "clientName": "HDMWRLyb", "clientPermissions": [{"action": 24, "resource": "akDzbI1V", "schedAction": 9, "schedCron": "qInWV6kw", "schedRange": ["sv6dYg3W", "GgU6H1jI", "GOeJkpwA"]}, {"action": 24, "resource": "kdgRnf2C", "schedAction": 52, "schedCron": "TzG8IlrN", "schedRange": ["d9hzsygt", "7F2aFbNJ", "DOfZLMwD"]}, {"action": 61, "resource": "Su6VNh0g", "schedAction": 20, "schedCron": "kZufZnCA", "schedRange": ["kYgayK3l", "2g145g7Y", "8RTC6Ndz"]}], "clientPlatform": "mjugHb0p", "deletable": false, "description": "hVA81ch6", "modulePermissions": [{"moduleId": "ET4ozOrX", "selectedGroups": [{"groupId": "odFFXmKi", "selectedActions": [43, 50, 70]}, {"groupId": "maw0V2Z0", "selectedActions": [39, 0, 78]}, {"groupId": "GeA7HuQt", "selectedActions": [5, 49, 21]}]}, {"moduleId": "TFmAKGyv", "selectedGroups": [{"groupId": "CTyvRchm", "selectedActions": [100, 90, 93]}, {"groupId": "aCvbPEQV", "selectedActions": [67, 75, 3]}, {"groupId": "jezaYV5d", "selectedActions": [94, 42, 100]}]}, {"moduleId": "Nf7AeRDL", "selectedGroups": [{"groupId": "Hk4PUSTM", "selectedActions": [9, 69, 8]}, {"groupId": "of8FflZI", "selectedActions": [61, 37, 100]}, {"groupId": "YlIdquZJ", "selectedActions": [60, 5, 0]}]}], "namespace": "F0NQqTbx", "oauthAccessTokenExpiration": 3, "oauthAccessTokenExpirationTimeUnit": "MVes0w11", "oauthClientType": "cCaPXmVK", "oauthRefreshTokenExpiration": 83, "oauthRefreshTokenExpirationTimeUnit": "UKMfgaCx", "parentNamespace": "Z3gTDAiL", "redirectUri": "6RfonOJn", "scopes": ["AMiGWNNF", "8uDZK2JC", "6Fl5SbFc"], "secret": "sxiAnxhR", "skipLoginQueue": false, "twoFactorEnabled": false}' \
    > test.out 2>&1
eval_tap $? 126 'AdminCreateClientV3' test.out

#- 127 AdminGetClientsbyNamespacebyIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetClientsbyNamespacebyIDV3 \
    --clientId 'wMdoXNF6' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 127 'AdminGetClientsbyNamespacebyIDV3' test.out

#- 128 AdminDeleteClientV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientV3 \
    --clientId 'JfggvyTV' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 128 'AdminDeleteClientV3' test.out

#- 129 AdminUpdateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientV3 \
    --clientId 'ZsQsYZ6T' \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["byPiIsis", "tgx2ajMs", "nh1OfzqP"], "baseUri": "Ph7lz64g", "clientName": "CnZofCBL", "clientPermissions": [{"action": 4, "resource": "BJs3bSW1", "schedAction": 18, "schedCron": "3dXP26Q9", "schedRange": ["BhvqNdty", "bywtPxUa", "jkTd52eZ"]}, {"action": 65, "resource": "yGwot3E8", "schedAction": 59, "schedCron": "a9gKnwEH", "schedRange": ["iPD8snJJ", "g7375VeO", "9KiOYxFB"]}, {"action": 39, "resource": "CbCeJRpa", "schedAction": 99, "schedCron": "f9WsZleZ", "schedRange": ["S6eM6PiG", "8u7IKQkm", "0FVmtpSg"]}], "clientPlatform": "FRYwaQgz", "deletable": false, "description": "WE5flyr0", "modulePermissions": [{"moduleId": "Uu2S5HuZ", "selectedGroups": [{"groupId": "vrtyf9wB", "selectedActions": [49, 1, 78]}, {"groupId": "V3mStW3h", "selectedActions": [82, 55, 65]}, {"groupId": "l3IRmTqn", "selectedActions": [12, 59, 42]}]}, {"moduleId": "MSmou4rr", "selectedGroups": [{"groupId": "sU0gl3w4", "selectedActions": [49, 53, 4]}, {"groupId": "BoWxZ0xb", "selectedActions": [18, 65, 35]}, {"groupId": "DzrXOfWA", "selectedActions": [47, 58, 100]}]}, {"moduleId": "ofLwvgWz", "selectedGroups": [{"groupId": "JAj3VJKw", "selectedActions": [7, 60, 16]}, {"groupId": "bRf0jf4e", "selectedActions": [70, 73, 10]}, {"groupId": "qSBGIYKk", "selectedActions": [37, 98, 60]}]}], "namespace": "ADXxrowF", "oauthAccessTokenExpiration": 9, "oauthAccessTokenExpirationTimeUnit": "eaQd2T0m", "oauthRefreshTokenExpiration": 46, "oauthRefreshTokenExpirationTimeUnit": "GzCWYyxI", "redirectUri": "86PFdzTI", "scopes": ["Y3VTfU39", "XIqCE7tL", "CcNJ9u8n"], "skipLoginQueue": true, "twoFactorEnabled": false}' \
    > test.out 2>&1
eval_tap $? 129 'AdminUpdateClientV3' test.out

#- 130 AdminUpdateClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientPermissionV3 \
    --clientId 'BTcrUL6c' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 94, "resource": "auLPHxFU"}, {"action": 51, "resource": "r7YMu5xD"}, {"action": 59, "resource": "J7RCx5hW"}]}' \
    > test.out 2>&1
eval_tap $? 130 'AdminUpdateClientPermissionV3' test.out

#- 131 AdminAddClientPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddClientPermissionsV3 \
    --clientId 'LMTdaL6q' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 97, "resource": "d4iqs0zQ"}, {"action": 92, "resource": "JF5KyAqQ"}, {"action": 23, "resource": "PCvZUzfA"}]}' \
    > test.out 2>&1
eval_tap $? 131 'AdminAddClientPermissionsV3' test.out

#- 132 AdminDeleteClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientPermissionV3 \
    --action '30' \
    --clientId 'PWBM4f5B' \
    --namespace "$AB_NAMESPACE" \
    --resource '1NuRGt8H' \
    > test.out 2>&1
eval_tap $? 132 'AdminDeleteClientPermissionV3' test.out

#- 133 AdminGetConfigValueV3
./ng net.accelbyte.sdk.cli.Main iam adminGetConfigValueV3 \
    --configKey 'wNjGygin' \
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
    --body '{"blacklist": ["Rq4sFXfQ", "Y2kZFCco", "73qN2jIG"]}' \
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
    --limit '78' \
    --offset '7' \
    > test.out 2>&1
eval_tap $? 139 'RetrieveAllSSOLoginPlatformCredentialV3' test.out

#- 140 RetrieveThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'DeMs6flg' \
    > test.out 2>&1
eval_tap $? 140 'RetrieveThirdPartyLoginPlatformCredentialV3' test.out

#- 141 AddThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam addThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '6cIhKhpP' \
    --body '{"ACSURL": "C1UXRj4P", "AWSCognitoRegion": "o6WjaNQB", "AWSCognitoUserPool": "NxzQMv9G", "AllowedClients": ["9JMT0Qh1", "8ifpobvp", "FqrHKshi"], "AppId": "hJdfgB2p", "AuthorizationEndpoint": "Gklz4VYv", "ClientId": "EaUIKv5S", "Environment": "cLxMfpbg", "FederationMetadataURL": "hZMzNw5G", "GenericOauthFlow": true, "IsActive": true, "Issuer": "c1sJXD3b", "JWKSEndpoint": "IZx1dNMQ", "KeyID": "0zntZkr1", "LogoURL": "kDsP8Lw7", "NetflixCertificates": {"encryptedPrivateKey": "kRGSSyai", "encryptedPrivateKeyName": "SY0tvnWL", "publicCertificate": "tyo4w67q", "publicCertificateName": "RQDm25eY", "rootCertificate": "LWRP9UIb", "rootCertificateName": "36JlAeye"}, "OrganizationId": "lGMVMhBi", "PlatformName": "e3cKPFr8", "RedirectUri": "lg13vU1b", "RegisteredDomains": [{"affectedClientIDs": ["3mWoWWG8", "cDeybcbw", "GJgA5nKG"], "domain": "yTGI3tAY", "namespaces": ["XhQykc34", "b4yBhCNa", "pf4RWAQw"], "roleId": "SzJps8zH"}, {"affectedClientIDs": ["oXlm5Btq", "wJMZBotp", "E45792CF"], "domain": "VUHurQU3", "namespaces": ["FST73O9F", "kHW2D1bG", "81OC4I0g"], "roleId": "UTWFDDai"}, {"affectedClientIDs": ["O475YETA", "fSrcvZGk", "FOk7MW8t"], "domain": "OwN9za7M", "namespaces": ["xIAZVsoT", "YkFlA34s", "7sgtRYaF"], "roleId": "mc55gl7N"}], "Secret": "1SDXn3ml", "TeamID": "MSCJDBg4", "TokenAuthenticationType": "Bb01kl2P", "TokenClaimsMapping": {"V1STLuvk": "IccSlxiP", "JWU5p70F": "KQpikOqo", "YujIq2WS": "yRfLlqaC"}, "TokenEndpoint": "fAUswEfc", "UserInfoEndpoint": "popRZCQe", "UserInfoHTTPMethod": "51t6QNOU", "scopes": ["blRJ7c2A", "sau2KeUZ", "13dLUtZc"]}' \
    > test.out 2>&1
eval_tap $? 141 'AddThirdPartyLoginPlatformCredentialV3' test.out

#- 142 DeleteThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'ZW0L9YkQ' \
    > test.out 2>&1
eval_tap $? 142 'DeleteThirdPartyLoginPlatformCredentialV3' test.out

#- 143 UpdateThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Xq3Xal4F' \
    --body '{"ACSURL": "vLGd4zrf", "AWSCognitoRegion": "Y6xP739O", "AWSCognitoUserPool": "T6mJrnWl", "AllowedClients": ["l490Hc7Q", "hzDwTCeY", "MvOZHi9I"], "AppId": "t3OL2WbW", "AuthorizationEndpoint": "Rj7QWE4j", "ClientId": "UCJzRB6G", "Environment": "2O3CiJCv", "FederationMetadataURL": "s079fPNK", "GenericOauthFlow": true, "IsActive": true, "Issuer": "DM67d38P", "JWKSEndpoint": "rtarZsau", "KeyID": "sukvfeeb", "LogoURL": "AjXoZxpK", "NetflixCertificates": {"encryptedPrivateKey": "YA5iDDOa", "encryptedPrivateKeyName": "xr12rKze", "publicCertificate": "RRJYvg7G", "publicCertificateName": "Sx3RMOpj", "rootCertificate": "2klbeODz", "rootCertificateName": "oD10NnzB"}, "OrganizationId": "rlqeBFtc", "PlatformName": "ebRPu2n6", "RedirectUri": "PTT2B0rc", "RegisteredDomains": [{"affectedClientIDs": ["ivyAc1jM", "8t4uL5lq", "f35CxcGt"], "domain": "5SoJOwYx", "namespaces": ["3BZuJQAw", "3U7gvihS", "INzZyINz"], "roleId": "ULGdlnvp"}, {"affectedClientIDs": ["i3mPSnOF", "lp7rdOhg", "WGZn9DFk"], "domain": "qIJuXNEC", "namespaces": ["fcQNr7H6", "EwovfAru", "bQ1P5dtR"], "roleId": "FrqXiJ2d"}, {"affectedClientIDs": ["8D6SzGCu", "CmSQAW75", "JIrp1urd"], "domain": "muNidYuM", "namespaces": ["8AjrXzwx", "hKuwrEqG", "rOVNqTyn"], "roleId": "fYDPzm5u"}], "Secret": "hiwQNGZ1", "TeamID": "QQaU3Cp9", "TokenAuthenticationType": "vZlhJcRN", "TokenClaimsMapping": {"V3QyT1SE": "M0mHityA", "KAcF0CBv": "WEGNLvGK", "BsCDUYw5": "SldOVUv3"}, "TokenEndpoint": "ou4c4J88", "UserInfoEndpoint": "XtCTbYGy", "UserInfoHTTPMethod": "jAvGFRx2", "scopes": ["nho1ZVxi", "TRuOjn6A", "3MnjGjdY"]}' \
    > test.out 2>&1
eval_tap $? 143 'UpdateThirdPartyLoginPlatformCredentialV3' test.out

#- 144 UpdateThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'ZCxAPXW8' \
    --body '{"affectedClientIDs": ["l1G0GKcT", "H5qWrlf9", "x3HxggUF"], "assignedNamespaces": ["hsgZ981r", "7eEby00s", "6LEF0Yqr"], "domain": "PdOwwifD", "roleId": "PZ8UyuHn"}' \
    > test.out 2>&1
eval_tap $? 144 'UpdateThirdPartyLoginPlatformDomainV3' test.out

#- 145 DeleteThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'ZoWtz1jg' \
    --body '{"domain": "QC3iSexu"}' \
    > test.out 2>&1
eval_tap $? 145 'DeleteThirdPartyLoginPlatformDomainV3' test.out

#- 146 RetrieveSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam retrieveSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'HZ67hYe7' \
    > test.out 2>&1
eval_tap $? 146 'RetrieveSSOLoginPlatformCredential' test.out

#- 147 AddSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam addSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Bg34YH0P' \
    --body '{"acsUrl": "jXZI3bbF", "apiKey": "kJCWacsQ", "appId": "FEtxMFP8", "federationMetadataUrl": "jesnxvAu", "isActive": false, "redirectUri": "6voWY1Nl", "secret": "ZDVDiuz3", "ssoUrl": "aRW14YIi"}' \
    > test.out 2>&1
eval_tap $? 147 'AddSSOLoginPlatformCredential' test.out

#- 148 DeleteSSOLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteSSOLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'GobJlacs' \
    > test.out 2>&1
eval_tap $? 148 'DeleteSSOLoginPlatformCredentialV3' test.out

#- 149 UpdateSSOPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam updateSSOPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'wgA4Deeb' \
    --body '{"acsUrl": "JkCYIoa9", "apiKey": "WzROcS81", "appId": "aQITIhjc", "federationMetadataUrl": "kE7H45uX", "isActive": true, "redirectUri": "AqzMnhfH", "secret": "bsFGs4mo", "ssoUrl": "sG4oIGUB"}' \
    > test.out 2>&1
eval_tap $? 149 'UpdateSSOPlatformCredential' test.out

#- 150 AdminListUserIDByPlatformUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByPlatformUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'JJPNeNzb' \
    --rawPID  \
    --body '{"platformUserIds": ["ATI9SyXY", "AJoj8jFK", "bs4wPt6D"]}' \
    > test.out 2>&1
eval_tap $? 150 'AdminListUserIDByPlatformUserIDsV3' test.out

#- 151 AdminGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'LzGtQAR5' \
    --platformUserId '5y8Hfxxu' \
    > test.out 2>&1
eval_tap $? 151 'AdminGetUserByPlatformUserIDV3' test.out

#- 152 GetAdminUsersByRoleIdV3
./ng net.accelbyte.sdk.cli.Main iam getAdminUsersByRoleIdV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'bWQoU7LN' \
    --after '88' \
    --before '16' \
    --limit '36' \
    > test.out 2>&1
eval_tap $? 152 'GetAdminUsersByRoleIdV3' test.out

#- 153 AdminGetUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --emailAddress 'nSs7V53c' \
    > test.out 2>&1
eval_tap $? 153 'AdminGetUserByEmailAddressV3' test.out

#- 154 AdminBulkUpdateUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"updateRequest": {"skipLoginQueue": false}, "userIds": ["ssCE1132", "XuNo2hIR", "eK4WSekE"]}' \
    > test.out 2>&1
eval_tap $? 154 'AdminBulkUpdateUsersV3' test.out

#- 155 AdminGetBulkUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType 'Ch9Eb15n' \
    --body '{"bulkUserId": ["R2bbR78c", "3TYZEOM2", "T9lAZiwF"]}' \
    > test.out 2>&1
eval_tap $? 155 'AdminGetBulkUserBanV3' test.out

#- 156 AdminListUserIDByUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["KVoUlliH", "ZHscI1Uy", "KESVo9qD"]}' \
    > test.out 2>&1
eval_tap $? 156 'AdminListUserIDByUserIDsV3' test.out

#- 157 AdminBulkGetUsersPlatform
./ng net.accelbyte.sdk.cli.Main iam adminBulkGetUsersPlatform \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["snofMV69", "NzueOABM", "JSSHKfnT"]}' \
    > test.out 2>&1
eval_tap $? 157 'AdminBulkGetUsersPlatform' test.out

#- 158 AdminInviteUserV3
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddresses": ["AqVyFjSw", "pMhIh38D", "Wf9d0CRn"], "isAdmin": false, "namespace": "RLQKxina", "roles": ["SNpwBM8a", "BYYTUHCi", "CWUI0Pzg"]}' \
    > test.out 2>&1
eval_tap $? 158 'AdminInviteUserV3' test.out

#- 159 AdminQueryThirdPlatformLinkHistoryV3
./ng net.accelbyte.sdk.cli.Main iam adminQueryThirdPlatformLinkHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '19' \
    --offset '49' \
    --platformUserId '7SRjOZK0' \
    --platformId 'RZvn3tYA' \
    > test.out 2>&1
eval_tap $? 159 'AdminQueryThirdPlatformLinkHistoryV3' test.out

#- 160 AdminListUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminListUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '49' \
    --offset '45' \
    > test.out 2>&1
eval_tap $? 160 'AdminListUsersV3' test.out

#- 161 AdminSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam adminSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'xQQveTuN' \
    --endDate 'gonQFWl6' \
    --includeTotal  \
    --limit '45' \
    --offset '17' \
    --platformBy 'Xz5nqPnI' \
    --platformId 'pfCreskr' \
    --query 'uWJ0czdr' \
    --roleIds 'RgNQPnkq' \
    --skipLoginQueue  \
    --startDate 'VbeG3LiC' \
    --testAccount  \
    > test.out 2>&1
eval_tap $? 161 'AdminSearchUserV3' test.out

#- 162 AdminGetBulkUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"listEmailAddressRequest": ["iSv4oCCG", "wfhQNuqO", "PjoGD8w1"]}' \
    > test.out 2>&1
eval_tap $? 162 'AdminGetBulkUserByEmailAddressV3' test.out

#- 163 AdminGetUserByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'MjkYehkt' \
    > test.out 2>&1
eval_tap $? 163 'AdminGetUserByUserIdV3' test.out

#- 164 AdminUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'FHAvxXKt' \
    --body '{"avatarUrl": "RvJ5Qeuh", "country": "JnXn1mLV", "dateOfBirth": "hkyEhfm2", "displayName": "mxCDVCmV", "languageTag": "GGPkNgby", "skipLoginQueue": true, "uniqueDisplayName": "6Q6OnrnE", "userName": "UHPZkyvL"}' \
    > test.out 2>&1
eval_tap $? 164 'AdminUpdateUserV3' test.out

#- 165 AdminGetUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'zbHiJY7Y' \
    --activeOnly  \
    --after 'Twa1b5c4' \
    --before '4utKVGPV' \
    --limit '90' \
    > test.out 2>&1
eval_tap $? 165 'AdminGetUserBanV3' test.out

#- 166 AdminBanUserV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'RvYarfCn' \
    --body '{"ban": "9my2ETnI", "comment": "3QZRoC8I", "endDate": "AJnWpXuN", "reason": "DxQYmWHi", "skipNotif": true}' \
    > test.out 2>&1
eval_tap $? 166 'AdminBanUserV3' test.out

#- 167 AdminGetUserBanSummaryV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanSummaryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'qd1HbNt9' \
    > test.out 2>&1
eval_tap $? 167 'AdminGetUserBanSummaryV3' test.out

#- 168 AdminUpdateUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserBanV3 \
    --banId 'PM1s35vh' \
    --namespace "$AB_NAMESPACE" \
    --userId 'BkDjN2Ek' \
    --body '{"enabled": false, "skipNotif": false}' \
    > test.out 2>&1
eval_tap $? 168 'AdminUpdateUserBanV3' test.out

#- 169 AdminSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'zgtc8Tc0' \
    --body '{"context": "Nnr4FdIH", "emailAddress": "yvUmO11c", "languageTag": "n5UHMUs9"}' \
    > test.out 2>&1
eval_tap $? 169 'AdminSendVerificationCodeV3' test.out

#- 170 AdminVerifyAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'JHM89K8T' \
    --body '{"Code": "ghCJwKEm", "ContactType": "dnIVMROi", "LanguageTag": "KeVuD1fz", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 170 'AdminVerifyAccountV3' test.out

#- 171 GetUserVerificationCode
./ng net.accelbyte.sdk.cli.Main iam getUserVerificationCode \
    --namespace "$AB_NAMESPACE" \
    --userId '6Ui06el5' \
    > test.out 2>&1
eval_tap $? 171 'GetUserVerificationCode' test.out

#- 172 AdminGetUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'FWhIU3lL' \
    > test.out 2>&1
eval_tap $? 172 'AdminGetUserDeletionStatusV3' test.out

#- 173 AdminUpdateUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'pq3dAvRW' \
    --body '{"deletionDate": 20, "enabled": true}' \
    > test.out 2>&1
eval_tap $? 173 'AdminUpdateUserDeletionStatusV3' test.out

#- 174 AdminListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'jWggIUiu' \
    > test.out 2>&1
eval_tap $? 174 'AdminListUserAllPlatformAccountsDistinctV3' test.out

#- 175 AdminUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'X6JI4Zv1' \
    --body '{"code": "UM4qpqQn", "country": "gW9IJ7Ni", "dateOfBirth": "tt8jKYFo", "displayName": "vsbhBBTd", "emailAddress": "V6pTd0Gx", "password": "5rUW1xt2", "uniqueDisplayName": "4ZjADPN1", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 175 'AdminUpgradeHeadlessAccountV3' test.out

#- 176 AdminDeleteUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'hT56fZ9S' \
    > test.out 2>&1
eval_tap $? 176 'AdminDeleteUserInformationV3' test.out

#- 177 AdminGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 't34evntw' \
    --after '0.23969894151705262' \
    --before '0.7209208700742096' \
    --limit '59' \
    > test.out 2>&1
eval_tap $? 177 'AdminGetUserLoginHistoriesV3' test.out

#- 178 AdminResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam adminResetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '7cGXeJBA' \
    --body '{"languageTag": "IbLPf1Wz", "newPassword": "CanNtPGO", "oldPassword": "hPEZhhQj"}' \
    > test.out 2>&1
eval_tap $? 178 'AdminResetPasswordV3' test.out

#- 179 AdminUpdateUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserPermissionV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'MTiuH3d8' \
    --body '{"Permissions": [{"Action": 88, "Resource": "vtd0UKQd", "SchedAction": 50, "SchedCron": "2h1Pm7MC", "SchedRange": ["H3J6AA2v", "NeaS0pn1", "dymMULhZ"]}, {"Action": 54, "Resource": "kMpHCwzL", "SchedAction": 63, "SchedCron": "1mboE1kB", "SchedRange": ["B9AtxWjt", "zyATpjup", "bEKgvNTu"]}, {"Action": 15, "Resource": "OjffARDk", "SchedAction": 99, "SchedCron": "ZoQ3gPm1", "SchedRange": ["9UpkjS0O", "VICFsOxZ", "KFdV7Vz7"]}]}' \
    > test.out 2>&1
eval_tap $? 179 'AdminUpdateUserPermissionV3' test.out

#- 180 AdminAddUserPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserPermissionsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'aZlwT7wy' \
    --body '{"Permissions": [{"Action": 21, "Resource": "NGiQSy1v", "SchedAction": 88, "SchedCron": "ir1KcWcI", "SchedRange": ["Hd9j72Rl", "ojt4uOVC", "d8FOLKR2"]}, {"Action": 34, "Resource": "4dKTDdAd", "SchedAction": 45, "SchedCron": "K8M687Pn", "SchedRange": ["4mTNxuNm", "p15qphba", "8vrVCJ6T"]}, {"Action": 57, "Resource": "5Sbg9wtc", "SchedAction": 17, "SchedCron": "Tg9V79mN", "SchedRange": ["Wp5aAsZG", "CNegbqfu", "c6ff0Odz"]}]}' \
    > test.out 2>&1
eval_tap $? 180 'AdminAddUserPermissionsV3' test.out

#- 181 AdminDeleteUserPermissionBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'l6wPiRH4' \
    --body '[{"Action": 39, "Resource": "AUjUqSd7"}, {"Action": 1, "Resource": "cBZ2agSq"}, {"Action": 13, "Resource": "ayG0JwLc"}]' \
    > test.out 2>&1
eval_tap $? 181 'AdminDeleteUserPermissionBulkV3' test.out

#- 182 AdminDeleteUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionV3 \
    --action '89' \
    --namespace "$AB_NAMESPACE" \
    --resource 'HcThwYbq' \
    --userId 'nIB3in9L' \
    > test.out 2>&1
eval_tap $? 182 'AdminDeleteUserPermissionV3' test.out

#- 183 AdminGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'o0rtCrBe' \
    --after 'zvDD4DXg' \
    --before '714LPUnj' \
    --limit '30' \
    --platformId 'z03MYDMT' \
    > test.out 2>&1
eval_tap $? 183 'AdminGetUserPlatformAccountsV3' test.out

#- 184 AdminGetListJusticePlatformAccounts
./ng net.accelbyte.sdk.cli.Main iam adminGetListJusticePlatformAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'CZ6Ew2pz' \
    > test.out 2>&1
eval_tap $? 184 'AdminGetListJusticePlatformAccounts' test.out

#- 185 AdminGetUserMapping
./ng net.accelbyte.sdk.cli.Main iam adminGetUserMapping \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'SkCUPpEN' \
    --userId 'c0PooPQ5' \
    > test.out 2>&1
eval_tap $? 185 'AdminGetUserMapping' test.out

#- 186 AdminCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam adminCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace '9lTznfGy' \
    --userId 'Nozcrgxp' \
    > test.out 2>&1
eval_tap $? 186 'AdminCreateJusticeUser' test.out

#- 187 AdminLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'B2GQPQYZ' \
    --skipConflict  \
    --body '{"platformId": "sDOr4uPE", "platformUserId": "46J4PwyO"}' \
    > test.out 2>&1
eval_tap $? 187 'AdminLinkPlatformAccount' test.out

#- 188 AdminPlatformUnlinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformUnlinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'NrNJ80jd' \
    --userId 'jJEU0OVQ' \
    --body '{"platformNamespace": "gkZ4R8if"}' \
    > test.out 2>&1
eval_tap $? 188 'AdminPlatformUnlinkV3' test.out

#- 189 AdminPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'VtX8GlrZ' \
    --userId 'n5Ftg4H3' \
    > test.out 2>&1
eval_tap $? 189 'AdminPlatformUnlinkAllV3' test.out

#- 190 AdminPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'wBM8s6OJ' \
    --userId 'u8u8K3Vd' \
    --ticket 'hC12Mjro' \
    > test.out 2>&1
eval_tap $? 190 'AdminPlatformLinkV3' test.out

#- 191 AdminDeleteUserLinkingHistoryByPlatformIDV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserLinkingHistoryByPlatformIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'NAhcasi9' \
    --userId 'ycKcDtQq' \
    > test.out 2>&1
eval_tap $? 191 'AdminDeleteUserLinkingHistoryByPlatformIDV3' test.out

#- 192 AdminGetThirdPartyPlatformTokenLinkStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetThirdPartyPlatformTokenLinkStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'yNSolTLU' \
    --userId 'FTvgQWeO' \
    --platformToken '7lZehwSk' \
    > test.out 2>&1
eval_tap $? 192 'AdminGetThirdPartyPlatformTokenLinkStatusV3' test.out

#- 193 AdminGetUserSinglePlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminGetUserSinglePlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --platformId 'f51iJnQd' \
    --userId 'b6zWS6PX' \
    > test.out 2>&1
eval_tap $? 193 'AdminGetUserSinglePlatformAccount' test.out

#- 194 AdminDeleteUserRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRolesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '2YtaD64e' \
    --body '["xWZs2c0w", "Cpth7U0F", "GPrg9vX9"]' \
    > test.out 2>&1
eval_tap $? 194 'AdminDeleteUserRolesV3' test.out

#- 195 AdminSaveUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminSaveUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ECuiVYOO' \
    --body '[{"namespace": "2n5xlvr9", "roleId": "VtdADTTp"}, {"namespace": "9FRScjxG", "roleId": "OIagBtxG"}, {"namespace": "tNH2LzQ6", "roleId": "3q39V3XY"}]' \
    > test.out 2>&1
eval_tap $? 195 'AdminSaveUserRoleV3' test.out

#- 196 AdminAddUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'Apck40sR' \
    --userId 'nXwPg7Ey' \
    > test.out 2>&1
eval_tap $? 196 'AdminAddUserRoleV3' test.out

#- 197 AdminDeleteUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'eejqx6W2' \
    --userId '64n3c2ue' \
    > test.out 2>&1
eval_tap $? 197 'AdminDeleteUserRoleV3' test.out

#- 198 AdminUpdateUserStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'hSylJZBA' \
    --body '{"enabled": false, "reason": "KO6kHi0j"}' \
    > test.out 2>&1
eval_tap $? 198 'AdminUpdateUserStatusV3' test.out

#- 199 AdminTrustlyUpdateUserIdentity
./ng net.accelbyte.sdk.cli.Main iam adminTrustlyUpdateUserIdentity \
    --namespace "$AB_NAMESPACE" \
    --userId 'WlUh1ygz' \
    --body '{"emailAddress": "EBlgBeZL", "password": "bCthLe7w"}' \
    > test.out 2>&1
eval_tap $? 199 'AdminTrustlyUpdateUserIdentity' test.out

#- 200 AdminVerifyUserWithoutVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyUserWithoutVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'e1AGQ61k' \
    > test.out 2>&1
eval_tap $? 200 'AdminVerifyUserWithoutVerificationCodeV3' test.out

#- 201 AdminUpdateClientSecretV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientSecretV3 \
    --clientId 'JWc4aF68' \
    --namespace "$AB_NAMESPACE" \
    --body '{"newSecret": "JnC9LZ8T"}' \
    > test.out 2>&1
eval_tap $? 201 'AdminUpdateClientSecretV3' test.out

#- 202 AdminCheckThirdPartyLoginPlatformAvailabilityV3
./ng net.accelbyte.sdk.cli.Main iam adminCheckThirdPartyLoginPlatformAvailabilityV3 \
    --platformId 'Y1Ablb4J' \
    > test.out 2>&1
eval_tap $? 202 'AdminCheckThirdPartyLoginPlatformAvailabilityV3' test.out

#- 203 AdminGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV3 \
    --after 'cnysU4Qx' \
    --before 'BNQjIp1x' \
    --isWildcard  \
    --limit '82' \
    > test.out 2>&1
eval_tap $? 203 'AdminGetRolesV3' test.out

#- 204 AdminCreateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV3 \
    --body '{"adminRole": false, "deletable": true, "isWildcard": true, "managers": [{"displayName": "BVPmVhvp", "namespace": "EQsEXkgG", "userId": "NYmVEJkl"}, {"displayName": "1xnIrc6d", "namespace": "xvaZ1rWw", "userId": "wHbmnBof"}, {"displayName": "k6ESejbr", "namespace": "zpCgASMi", "userId": "iRct85mk"}], "members": [{"displayName": "XwP7THHN", "namespace": "nlCL0N6d", "userId": "YM6FAwbC"}, {"displayName": "mNSQsYUO", "namespace": "6bwtUk0i", "userId": "z6rrF2MU"}, {"displayName": "lsEapJrN", "namespace": "uLsxBmA4", "userId": "7Vs64UGt"}], "permissions": [{"action": 84, "resource": "Owq1MCng", "schedAction": 26, "schedCron": "pTnsdziN", "schedRange": ["K7UZNIOr", "2kV6H8fk", "BDEpKo4e"]}, {"action": 15, "resource": "8xqbACoB", "schedAction": 57, "schedCron": "UO15RVPN", "schedRange": ["sESOBrpC", "rAhAkk79", "j8783piF"]}, {"action": 37, "resource": "m22STNad", "schedAction": 58, "schedCron": "BCcOon7e", "schedRange": ["0WkGv7ES", "IYPpNSUZ", "SaEGuQWm"]}], "roleName": "AlLH5x5f"}' \
    > test.out 2>&1
eval_tap $? 204 'AdminCreateRoleV3' test.out

#- 205 AdminGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV3 \
    --roleId 'HmvUonXh' \
    > test.out 2>&1
eval_tap $? 205 'AdminGetRoleV3' test.out

#- 206 AdminDeleteRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV3 \
    --roleId '8BQrNd9h' \
    > test.out 2>&1
eval_tap $? 206 'AdminDeleteRoleV3' test.out

#- 207 AdminUpdateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV3 \
    --roleId 'qc1uZZNc' \
    --body '{"deletable": true, "isWildcard": true, "roleName": "Qqqx1Rjt"}' \
    > test.out 2>&1
eval_tap $? 207 'AdminUpdateRoleV3' test.out

#- 208 AdminGetRoleAdminStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleAdminStatusV3 \
    --roleId 'khaeLd7w' \
    > test.out 2>&1
eval_tap $? 208 'AdminGetRoleAdminStatusV3' test.out

#- 209 AdminUpdateAdminRoleStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateAdminRoleStatusV3 \
    --roleId 'l3ptYIMp' \
    > test.out 2>&1
eval_tap $? 209 'AdminUpdateAdminRoleStatusV3' test.out

#- 210 AdminRemoveRoleAdminV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleAdminV3 \
    --roleId 'rkF7UzSa' \
    > test.out 2>&1
eval_tap $? 210 'AdminRemoveRoleAdminV3' test.out

#- 211 AdminGetRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleManagersV3 \
    --roleId '21ESMpam' \
    --after 'zLtmlB5U' \
    --before '1KENxIME' \
    --limit '49' \
    > test.out 2>&1
eval_tap $? 211 'AdminGetRoleManagersV3' test.out

#- 212 AdminAddRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleManagersV3 \
    --roleId 'dyJhdZ9D' \
    --body '{"managers": [{"displayName": "TgYWC5Hg", "namespace": "fTP3Stto", "userId": "Jwa5PPYU"}, {"displayName": "VLlMZ4yi", "namespace": "qMZeSeVc", "userId": "RuvQaCcD"}, {"displayName": "AP0hrHEm", "namespace": "nR7C2fgj", "userId": "ddwlL4fN"}]}' \
    > test.out 2>&1
eval_tap $? 212 'AdminAddRoleManagersV3' test.out

#- 213 AdminRemoveRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleManagersV3 \
    --roleId 'SmyqlpZH' \
    --body '{"managers": [{"displayName": "fQWZRkeN", "namespace": "1HbZgLRP", "userId": "KtmDlIEP"}, {"displayName": "xTSjuYiY", "namespace": "gt7YG1Cu", "userId": "Jg0A6g6I"}, {"displayName": "AJRUquUj", "namespace": "4uCAyxo8", "userId": "byhIMWgT"}]}' \
    > test.out 2>&1
eval_tap $? 213 'AdminRemoveRoleManagersV3' test.out

#- 214 AdminGetRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleMembersV3 \
    --roleId 'FfImVOxQ' \
    --after '1Yz4d6Mt' \
    --before '5dpMKYOH' \
    --limit '86' \
    > test.out 2>&1
eval_tap $? 214 'AdminGetRoleMembersV3' test.out

#- 215 AdminAddRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleMembersV3 \
    --roleId 'poXBeoG1' \
    --body '{"members": [{"displayName": "cIBhkFgR", "namespace": "7aWBHBCc", "userId": "8ArISiJA"}, {"displayName": "kgIoBcKq", "namespace": "dTGnxO43", "userId": "DI0sC6PY"}, {"displayName": "feZKlhzi", "namespace": "NuIjhJl9", "userId": "oA1cIn9G"}]}' \
    > test.out 2>&1
eval_tap $? 215 'AdminAddRoleMembersV3' test.out

#- 216 AdminRemoveRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleMembersV3 \
    --roleId 'bT2YnQcF' \
    --body '{"members": [{"displayName": "ALz8926I", "namespace": "xspW5goU", "userId": "VJlwTyE8"}, {"displayName": "mn2cSsnK", "namespace": "HaT60Eyr", "userId": "q5RO655o"}, {"displayName": "4JwNPBSD", "namespace": "ShpLf8Py", "userId": "Nqy7I3c6"}]}' \
    > test.out 2>&1
eval_tap $? 216 'AdminRemoveRoleMembersV3' test.out

#- 217 AdminUpdateRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV3 \
    --roleId 'f1onkD8s' \
    --body '{"permissions": [{"action": 32, "resource": "KgGvKuqf", "schedAction": 56, "schedCron": "Y3taIjKm", "schedRange": ["76UVf4Sb", "8SGAvzop", "EPsGYouh"]}, {"action": 39, "resource": "DXYZhOju", "schedAction": 32, "schedCron": "4lVkw0gx", "schedRange": ["QfWazHjF", "1ElqWTwG", "UHNWWnvF"]}, {"action": 62, "resource": "lOhp21QZ", "schedAction": 4, "schedCron": "Mb0teEzc", "schedRange": ["70Ggv8BU", "vp7cBttw", "Wctga4Ir"]}]}' \
    > test.out 2>&1
eval_tap $? 217 'AdminUpdateRolePermissionsV3' test.out

#- 218 AdminAddRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV3 \
    --roleId 'AQxJd59a' \
    --body '{"permissions": [{"action": 16, "resource": "RPiyt8gl", "schedAction": 55, "schedCron": "2NEYUy8x", "schedRange": ["3ZhINEyN", "LN7vTK5t", "UmewoqUz"]}, {"action": 64, "resource": "fTkonSxK", "schedAction": 59, "schedCron": "VoYoqtcl", "schedRange": ["6LTrDtUT", "dNIpLkXb", "NxhDTGFX"]}, {"action": 30, "resource": "H5F15vUX", "schedAction": 25, "schedCron": "aLuo14So", "schedRange": ["5v4VBnYY", "xYMn2Djn", "AomGtp0L"]}]}' \
    > test.out 2>&1
eval_tap $? 218 'AdminAddRolePermissionsV3' test.out

#- 219 AdminDeleteRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV3 \
    --roleId 'Nm1TGjWJ' \
    --body '["hWbWiePW", "OOJkH5CV", "jiV7LU1h"]' \
    > test.out 2>&1
eval_tap $? 219 'AdminDeleteRolePermissionsV3' test.out

#- 220 AdminDeleteRolePermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionV3 \
    --action '29' \
    --resource 'RxtLDwtb' \
    --roleId 'areTjnK9' \
    > test.out 2>&1
eval_tap $? 220 'AdminDeleteRolePermissionV3' test.out

#- 221 AdminGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam adminGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 221 'AdminGetMyUserV3' test.out

#- 222 UserAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam userAuthenticationV3 \
    --clientId 'fWKMB23v' \
    --extendExp  \
    --redirectUri '7t3KCzN2' \
    --password '03YjMCyJ' \
    --requestId 'JvH5PG28' \
    --userName '92QstVLH' \
    > test.out 2>&1
eval_tap $? 222 'UserAuthenticationV3' test.out

#- 223 AuthenticationWithPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV3 \
    --extendExp  \
    --clientId 'vBBIBm4U' \
    --linkingToken 'Cbmtzrlr' \
    --password 'AtFqhSh4' \
    --username 'ZEW1pcRo' \
    > test.out 2>&1
eval_tap $? 223 'AuthenticationWithPlatformLinkV3' test.out

#- 224 GenerateTokenByNewHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV3 \
    --additionalData '65oWpO3d' \
    --extendExp  \
    --linkingToken 'cTtigw8i' \
    > test.out 2>&1
eval_tap $? 224 'GenerateTokenByNewHeadlessAccountV3' test.out

#- 225 RequestOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam requestOneTimeLinkingCodeV3 \
    --platformId 'EZ3hbMKR' \
    > test.out 2>&1
eval_tap $? 225 'RequestOneTimeLinkingCodeV3' test.out

#- 226 ValidateOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam validateOneTimeLinkingCodeV3 \
    --oneTimeLinkCode 'ON01FYBu' \
    > test.out 2>&1
eval_tap $? 226 'ValidateOneTimeLinkingCodeV3' test.out

#- 227 RequestTokenByOneTimeLinkCodeResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTokenByOneTimeLinkCodeResponseV3 \
    --additionalData 'iQUCNAVS' \
    --isTransient  \
    --clientId 'FaKxO2hw' \
    --oneTimeLinkCode 'gayHhRSr' \
    > test.out 2>&1
eval_tap $? 227 'RequestTokenByOneTimeLinkCodeResponseV3' test.out

#- 228 GetCountryLocationV3
./ng net.accelbyte.sdk.cli.Main iam getCountryLocationV3 \
    > test.out 2>&1
eval_tap $? 228 'GetCountryLocationV3' test.out

#- 229 Logout
./ng net.accelbyte.sdk.cli.Main iam logout \
    > test.out 2>&1
eval_tap $? 229 'Logout' test.out

#- 230 RequestTokenExchangeCodeV3
./ng net.accelbyte.sdk.cli.Main iam requestTokenExchangeCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --codeChallenge 'vtHm4Enk' \
    --codeChallengeMethod 'S256' \
    --clientId 'I5kXFYw5' \
    > test.out 2>&1
eval_tap $? 230 'RequestTokenExchangeCodeV3' test.out

#- 231 AdminRetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam adminRetrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'KIRxdamI' \
    --userId 'xVDTz8zE' \
    --platformUserId 'WXxJiz5q' \
    > test.out 2>&1
eval_tap $? 231 'AdminRetrieveUserThirdPartyPlatformTokenV3' test.out

#- 232 RevokeUserV3
./ng net.accelbyte.sdk.cli.Main iam revokeUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'lcnjkkJG' \
    --includeGameNamespace  \
    > test.out 2>&1
eval_tap $? 232 'RevokeUserV3' test.out

#- 233 AuthorizeV3
./ng net.accelbyte.sdk.cli.Main iam authorizeV3 \
    --codeChallenge 'e4X5JIb8' \
    --codeChallengeMethod 'plain' \
    --createHeadless  \
    --oneTimeLinkCode 'xhr1ORCj' \
    --redirectUri 'ydm5fnnU' \
    --scope 'R3plyBUF' \
    --state 'vFzfn012' \
    --targetAuthPage '7nIlvTue' \
    --useRedirectUriAsLoginUrlWhenLocked  \
    --clientId 'PZhtcKq6' \
    --responseType 'code' \
    > test.out 2>&1
eval_tap $? 233 'AuthorizeV3' test.out

#- 234 TokenIntrospectionV3
./ng net.accelbyte.sdk.cli.Main iam tokenIntrospectionV3 \
    --token 'tC197grz' \
    > test.out 2>&1
eval_tap $? 234 'TokenIntrospectionV3' test.out

#- 235 GetJWKSV3
./ng net.accelbyte.sdk.cli.Main iam getJWKSV3 \
    > test.out 2>&1
eval_tap $? 235 'GetJWKSV3' test.out

#- 236 SendMFAAuthenticationCode
./ng net.accelbyte.sdk.cli.Main iam sendMFAAuthenticationCode \
    --clientId 'Y5Dc4GuR' \
    --factor 'HJ6kLLlE' \
    --mfaToken 'RSoBQLwX' \
    > test.out 2>&1
eval_tap $? 236 'SendMFAAuthenticationCode' test.out

#- 237 Change2faMethod
./ng net.accelbyte.sdk.cli.Main iam change2faMethod \
    --factor 'QUZuytIH' \
    --mfaToken 'S6tIBHFN' \
    > test.out 2>&1
eval_tap $? 237 'Change2faMethod' test.out

#- 238 Verify2faCode
./ng net.accelbyte.sdk.cli.Main iam verify2faCode \
    --code 'zfVvN3f2' \
    --factor 'FfP7FkLp' \
    --mfaToken 'WfG8aMOK' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 238 'Verify2faCode' test.out

#- 239 RetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam retrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'ZXOwYdvT' \
    --userId 'YqrmoLFv' \
    > test.out 2>&1
eval_tap $? 239 'RetrieveUserThirdPartyPlatformTokenV3' test.out

#- 240 AuthCodeRequestV3
./ng net.accelbyte.sdk.cli.Main iam authCodeRequestV3 \
    --platformId '2nsRvFwU' \
    --clientId 'TjiCPm8Q' \
    --redirectUri 'JIfI1yPK' \
    --requestId 'hUB9izDB' \
    > test.out 2>&1
eval_tap $? 240 'AuthCodeRequestV3' test.out

#- 241 PlatformTokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV3 \
    --platformId 'JQl9oqVF' \
    --additionalData 'F2t4QT2q' \
    --clientId 'T5r3YTG8' \
    --createHeadless  \
    --deviceId 'LW0v7hf2' \
    --macAddress 'mAwEZrIj' \
    --platformToken 'tV4O55p5' \
    --skipSetCookie  \
    > test.out 2>&1
eval_tap $? 241 'PlatformTokenGrantV3' test.out

#- 242 GetRevocationListV3
./ng net.accelbyte.sdk.cli.Main iam getRevocationListV3 \
    > test.out 2>&1
eval_tap $? 242 'GetRevocationListV3' test.out

#- 243 TokenRevocationV3
./ng net.accelbyte.sdk.cli.Main iam tokenRevocationV3 \
    --token 'fVWihEnh' \
    > test.out 2>&1
eval_tap $? 243 'TokenRevocationV3' test.out

#- 244 SimultaneousLoginV3
./ng net.accelbyte.sdk.cli.Main iam simultaneousLoginV3 \
    --simultaneousPlatform 'lzVzX868' \
    --simultaneousTicket 'RRXvyhuL' \
    --nativePlatform 'epicgames' \
    --nativePlatformTicket 'RZVDV40K' \
    > test.out 2>&1
eval_tap $? 244 'SimultaneousLoginV3' test.out

#- 245 TokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV3 \
    --additionalData 'Dx6hSKPH' \
    --clientId 'qBWFI2IS' \
    --code 'FSe5CbOX' \
    --codeVerifier '943t4Vxd' \
    --extendNamespace 'vHZO4djS' \
    --extendExp  \
    --password '1tBbhKTW' \
    --redirectUri 'nXK34ipV' \
    --refreshToken 'EWHyy88h' \
    --username 'kNEAb149' \
    --grantType 'urn:ietf:params:oauth:grant-type:extend_client_credentials' \
    > test.out 2>&1
eval_tap $? 245 'TokenGrantV3' test.out

#- 246 VerifyTokenV3
./ng net.accelbyte.sdk.cli.Main iam verifyTokenV3 \
    --token '1XTli5kU' \
    > test.out 2>&1
eval_tap $? 246 'VerifyTokenV3' test.out

#- 247 PlatformAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticationV3 \
    --platformId '8cPmXhUj' \
    --code 'qbU5djh1' \
    --error 'PzubfoB6' \
    --openidAssocHandle '5sfuWGC2' \
    --openidClaimedId '7KRs8LM4' \
    --openidIdentity '3TXNe3Hj' \
    --openidMode 'p1efPDfS' \
    --openidNs 'B3hrFsyL' \
    --openidOpEndpoint 'CbHSEz0H' \
    --openidResponseNonce '7GCsToz9' \
    --openidReturnTo 'up3UnaV2' \
    --openidSig 'u1fBV1q7' \
    --openidSigned '72BVXkFO' \
    --state '6ZAFFP7y' \
    > test.out 2>&1
eval_tap $? 247 'PlatformAuthenticationV3' test.out

#- 248 PlatformTokenRefreshV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenRefreshV3 \
    --platformId 'fGyKI92u' \
    --platformToken 'Q60oI9bS' \
    > test.out 2>&1
eval_tap $? 248 'PlatformTokenRefreshV3' test.out

#- 249 PublicGetInputValidations
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidations \
    --defaultOnEmpty  \
    --languageCode 'Rc64K2l8' \
    > test.out 2>&1
eval_tap $? 249 'PublicGetInputValidations' test.out

#- 250 PublicGetInputValidationByField
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidationByField \
    --field '5VgUO1C8' \
    > test.out 2>&1
eval_tap $? 250 'PublicGetInputValidationByField' test.out

#- 251 PublicGetCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam publicGetCountryAgeRestrictionV3 \
    --countryCode 'RX1n95ej' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 251 'PublicGetCountryAgeRestrictionV3' test.out

#- 252 PublicGetConfigValueV3
./ng net.accelbyte.sdk.cli.Main iam publicGetConfigValueV3 \
    --configKey 'ZWuJX48u' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 252 'PublicGetConfigValueV3' test.out

#- 253 PublicGetCountryListV3
./ng net.accelbyte.sdk.cli.Main iam publicGetCountryListV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 253 'PublicGetCountryListV3' test.out

#- 254 RetrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3
./ng net.accelbyte.sdk.cli.Main iam retrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 254 'RetrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3' test.out

#- 255 RetrieveActiveOIDCClientsPublicV3
./ng net.accelbyte.sdk.cli.Main iam retrieveActiveOIDCClientsPublicV3 \
    --namespace "$AB_NAMESPACE" \
    --clientId 'EhOq97kY' \
    > test.out 2>&1
eval_tap $? 255 'RetrieveActiveOIDCClientsPublicV3' test.out

#- 256 PublicListUserIDByPlatformUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserIDByPlatformUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '4G1A6TBg' \
    --rawPID  \
    --body '{"platformUserIds": ["UvPW7QiS", "Wtk71fV0", "0cQZTSFi"]}' \
    > test.out 2>&1
eval_tap $? 256 'PublicListUserIDByPlatformUserIDsV3' test.out

#- 257 PublicGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'SfHpm2bj' \
    --platformUserId 'n5wjKLDU' \
    > test.out 2>&1
eval_tap $? 257 'PublicGetUserByPlatformUserIDV3' test.out

#- 258 PublicGetAsyncStatus
./ng net.accelbyte.sdk.cli.Main iam publicGetAsyncStatus \
    --namespace "$AB_NAMESPACE" \
    --requestId 'wHradb5k' \
    > test.out 2>&1
eval_tap $? 258 'PublicGetAsyncStatus' test.out

#- 259 PublicSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam publicSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'QWxi6Ezx' \
    --limit '65' \
    --offset '69' \
    --platformBy 'zEHmdalA' \
    --platformId 'q9DGANqL' \
    --query 'Pw2K6OrM' \
    > test.out 2>&1
eval_tap $? 259 'PublicSearchUserV3' test.out

#- 260 PublicCreateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "nSDG0u4e", "acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "gsudsUG1", "policyId": "X4Z4rSS3", "policyVersionId": "xHw5Ebo6"}, {"isAccepted": false, "localizedPolicyVersionId": "nm3Ca4eN", "policyId": "N8Ss3nGX", "policyVersionId": "BceJ63iw"}, {"isAccepted": true, "localizedPolicyVersionId": "L13wsI0w", "policyId": "Z6hmvViq", "policyVersionId": "dNqeHhBK"}], "authType": "2GAPrezX", "code": "0WeLGUD0", "country": "UZpS14yZ", "dateOfBirth": "hgmGXuJK", "displayName": "JhwUZsLy", "emailAddress": "0QR4ePAk", "password": "K4z7FIhR", "reachMinimumAge": true, "uniqueDisplayName": "d6mGPBL4"}' \
    > test.out 2>&1
eval_tap $? 260 'PublicCreateUserV3' test.out

#- 261 CheckUserAvailability
./ng net.accelbyte.sdk.cli.Main iam checkUserAvailability \
    --namespace "$AB_NAMESPACE" \
    --field 'WtTxsvJP' \
    --query 'nqq39fq2' \
    > test.out 2>&1
eval_tap $? 261 'CheckUserAvailability' test.out

#- 262 PublicBulkGetUsers
./ng net.accelbyte.sdk.cli.Main iam publicBulkGetUsers \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["gZocBawS", "QerZEaRJ", "9CHkD1vu"]}' \
    > test.out 2>&1
eval_tap $? 262 'PublicBulkGetUsers' test.out

#- 263 PublicSendRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicSendRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "QiaHySe0", "languageTag": "YGcjGz4Y"}' \
    > test.out 2>&1
eval_tap $? 263 'PublicSendRegistrationCode' test.out

#- 264 PublicVerifyRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicVerifyRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "F1fzfhVf", "emailAddress": "8iWVn4qH"}' \
    > test.out 2>&1
eval_tap $? 264 'PublicVerifyRegistrationCode' test.out

#- 265 PublicForgotPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicForgotPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "qlRtgAk1", "languageTag": "trM4QtPk"}' \
    > test.out 2>&1
eval_tap $? 265 'PublicForgotPasswordV3' test.out

#- 266 GetAdminInvitationV3
./ng net.accelbyte.sdk.cli.Main iam getAdminInvitationV3 \
    --invitationId '86VMU4nK' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 266 'GetAdminInvitationV3' test.out

#- 267 CreateUserFromInvitationV3
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV3 \
    --invitationId '8zw7rN5O' \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "1BtOpJGf", "acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "a8cXh8kd", "policyId": "lpBZh4xD", "policyVersionId": "iCafq4M0"}, {"isAccepted": true, "localizedPolicyVersionId": "m4nf9Vb3", "policyId": "qrs3tfaF", "policyVersionId": "BRQ9m9mD"}, {"isAccepted": false, "localizedPolicyVersionId": "icHnvETp", "policyId": "RG7yt9DO", "policyVersionId": "6ds9SYsb"}], "authType": "Wc3SCUzd", "code": "FBAtgISm", "country": "YsvVeIyQ", "dateOfBirth": "CUt7KJbR", "displayName": "CIdhY3Te", "emailAddress": "LYj906N5", "password": "qC0DUQUq", "reachMinimumAge": true, "uniqueDisplayName": "d4yXhdh0"}' \
    > test.out 2>&1
eval_tap $? 267 'CreateUserFromInvitationV3' test.out

#- 268 UpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam updateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "AOv7kRz7", "country": "NvCh3Vxh", "dateOfBirth": "Pzz0aeS1", "displayName": "qQLYtLQK", "languageTag": "ICp1yyTj", "uniqueDisplayName": "MR3Mx0od", "userName": "ec8F489y"}' \
    > test.out 2>&1
eval_tap $? 268 'UpdateUserV3' test.out

#- 269 PublicPartialUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicPartialUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "t3i6HKLk", "country": "HdUwU966", "dateOfBirth": "Y5fjpPcj", "displayName": "OtqXoBik", "languageTag": "w5Mz5pWv", "uniqueDisplayName": "zzvumwss", "userName": "gNqkB5Bm"}' \
    > test.out 2>&1
eval_tap $? 269 'PublicPartialUpdateUserV3' test.out

#- 270 PublicSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"context": "lcgvfTJs", "emailAddress": "zSvDHR0I", "languageTag": "dzszuz5m"}' \
    > test.out 2>&1
eval_tap $? 270 'PublicSendVerificationCodeV3' test.out

#- 271 PublicUserVerificationV3
./ng net.accelbyte.sdk.cli.Main iam publicUserVerificationV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "83bQ5PYP", "contactType": "Xlq3TmnD", "languageTag": "ZFkCAAQ3", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 271 'PublicUserVerificationV3' test.out

#- 272 PublicUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "cZq2LFjf", "country": "oGF480b5", "dateOfBirth": "u0yQBdFm", "displayName": "IyOBBzky", "emailAddress": "y4eSZ8jS", "password": "Ve1Bv4ih", "uniqueDisplayName": "oXlXu5ku", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 272 'PublicUpgradeHeadlessAccountV3' test.out

#- 273 PublicVerifyHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --needVerificationCode  \
    --body '{"emailAddress": "cilxoei1", "password": "MVxrgXVV"}' \
    > test.out 2>&1
eval_tap $? 273 'PublicVerifyHeadlessAccountV3' test.out

#- 274 PublicUpdatePasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicUpdatePasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"languageTag": "nnE904Z6", "newPassword": "9HuoCpmk", "oldPassword": "iZuzmwvW"}' \
    > test.out 2>&1
eval_tap $? 274 'PublicUpdatePasswordV3' test.out

#- 275 PublicCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam publicCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'drxdgDaU' \
    > test.out 2>&1
eval_tap $? 275 'PublicCreateJusticeUser' test.out

#- 276 PublicPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '1TZ7lH57' \
    --redirectUri 'eoZUYTN2' \
    --ticket 'aJ7sm1qO' \
    > test.out 2>&1
eval_tap $? 276 'PublicPlatformLinkV3' test.out

#- 277 PublicPlatformUnlinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'YiEbgoAk' \
    --body '{"platformNamespace": "VINhW1ND"}' \
    > test.out 2>&1
eval_tap $? 277 'PublicPlatformUnlinkV3' test.out

#- 278 PublicPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'BktwmBm7' \
    > test.out 2>&1
eval_tap $? 278 'PublicPlatformUnlinkAllV3' test.out

#- 279 PublicForcePlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicForcePlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '3r4tA0kt' \
    --ticket 'OT0SGJ8t' \
    > test.out 2>&1
eval_tap $? 279 'PublicForcePlatformLinkV3' test.out

#- 280 PublicWebLinkPlatform
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatform \
    --namespace "$AB_NAMESPACE" \
    --platformId 'CRtOhBit' \
    --clientId 'LICDfTYQ' \
    --redirectUri 'LlDfVY5r' \
    > test.out 2>&1
eval_tap $? 280 'PublicWebLinkPlatform' test.out

#- 281 PublicWebLinkPlatformEstablish
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatformEstablish \
    --namespace "$AB_NAMESPACE" \
    --platformId 'fkzKIdHL' \
    --code 'kTPUmWzo' \
    --state 'mbYQ9tyW' \
    > test.out 2>&1
eval_tap $? 281 'PublicWebLinkPlatformEstablish' test.out

#- 282 PublicProcessWebLinkPlatformV3
./ng net.accelbyte.sdk.cli.Main iam publicProcessWebLinkPlatformV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '42XX4J7o' \
    --code 'FsYniJ4I' \
    --state 'NcNgrBR4' \
    > test.out 2>&1
eval_tap $? 282 'PublicProcessWebLinkPlatformV3' test.out

#- 283 PublicGetUsersPlatformInfosV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUsersPlatformInfosV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"platformId": "c4XnkJXm", "userIds": ["6EwAFrfP", "NBPYXjJS", "BqEdXjmT"]}' \
    > test.out 2>&1
eval_tap $? 283 'PublicGetUsersPlatformInfosV3' test.out

#- 284 ResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam resetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "fR4Pxeix", "emailAddress": "yrqSJHbh", "newPassword": "5T91ngXY"}' \
    > test.out 2>&1
eval_tap $? 284 'ResetPasswordV3' test.out

#- 285 PublicGetUserByUserIdV3
eval_tap 0 285 'PublicGetUserByUserIdV3 # SKIP deprecated' test.out

#- 286 PublicGetUserBanHistoryV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserBanHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'DGJMyF9w' \
    --activeOnly  \
    --after 'ftD8HbZC' \
    --before 'i11qaDmB' \
    --limit '7' \
    > test.out 2>&1
eval_tap $? 286 'PublicGetUserBanHistoryV3' test.out

#- 287 PublicListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Qjtyg7wx' \
    > test.out 2>&1
eval_tap $? 287 'PublicListUserAllPlatformAccountsDistinctV3' test.out

#- 288 PublicGetUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'rggW3CSi' \
    > test.out 2>&1
eval_tap $? 288 'PublicGetUserInformationV3' test.out

#- 289 PublicGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'A52n3rNK' \
    --after '0.8953707701828252' \
    --before '0.79237898506646' \
    --limit '91' \
    > test.out 2>&1
eval_tap $? 289 'PublicGetUserLoginHistoriesV3' test.out

#- 290 PublicGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'cAziPwHp' \
    --after 'uVhkyZhq' \
    --before 'GO1vU69B' \
    --limit '36' \
    --platformId 'yKCId0BB' \
    > test.out 2>&1
eval_tap $? 290 'PublicGetUserPlatformAccountsV3' test.out

#- 291 PublicListJusticePlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicListJusticePlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'HYlQtX8O' \
    > test.out 2>&1
eval_tap $? 291 'PublicListJusticePlatformAccountsV3' test.out

#- 292 PublicLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam publicLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'w4QrOKfr' \
    --body '{"platformId": "oveJbqQ7", "platformUserId": "DTWLW0na"}' \
    > test.out 2>&1
eval_tap $? 292 'PublicLinkPlatformAccount' test.out

#- 293 PublicForceLinkPlatformWithProgression
./ng net.accelbyte.sdk.cli.Main iam publicForceLinkPlatformWithProgression \
    --namespace "$AB_NAMESPACE" \
    --userId 'se5Ewl2M' \
    --body '{"chosenNamespaces": ["qjpJFrsG", "8BSwibnO", "i2556yux"], "requestId": "94Fw7h0c"}' \
    > test.out 2>&1
eval_tap $? 293 'PublicForceLinkPlatformWithProgression' test.out

#- 294 PublicGetPublisherUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetPublisherUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'gGxium0k' \
    > test.out 2>&1
eval_tap $? 294 'PublicGetPublisherUserV3' test.out

#- 295 PublicValidateUserByUserIDAndPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserByUserIDAndPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '3AfBzN6W' \
    --password 'a1ejdVS8' \
    > test.out 2>&1
eval_tap $? 295 'PublicValidateUserByUserIDAndPasswordV3' test.out

#- 296 PublicGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRolesV3 \
    --after 'Z6znfHI6' \
    --before 'kSZHeC9K' \
    --isWildcard  \
    --limit '87' \
    > test.out 2>&1
eval_tap $? 296 'PublicGetRolesV3' test.out

#- 297 PublicGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRoleV3 \
    --roleId 'hvJIRQcx' \
    > test.out 2>&1
eval_tap $? 297 'PublicGetRoleV3' test.out

#- 298 PublicGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyUserV3 \
    --includeAllPlatforms  \
    > test.out 2>&1
eval_tap $? 298 'PublicGetMyUserV3' test.out

#- 299 PublicGetLinkHeadlessAccountToMyAccountConflictV3
./ng net.accelbyte.sdk.cli.Main iam publicGetLinkHeadlessAccountToMyAccountConflictV3 \
    --oneTimeLinkCode 'PMCWlSsS' \
    > test.out 2>&1
eval_tap $? 299 'PublicGetLinkHeadlessAccountToMyAccountConflictV3' test.out

#- 300 LinkHeadlessAccountToMyAccountV3
./ng net.accelbyte.sdk.cli.Main iam linkHeadlessAccountToMyAccountV3 \
    --body '{"chosenNamespaces": ["vyejs5Io", "Z8lqNzbo", "lykREUJc"], "oneTimeLinkCode": "VfMhm44F"}' \
    > test.out 2>&1
eval_tap $? 300 'LinkHeadlessAccountToMyAccountV3' test.out

#- 301 PublicSendVerificationLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationLinkV3 \
    --body '{"languageTag": "VOIANC6O"}' \
    > test.out 2>&1
eval_tap $? 301 'PublicSendVerificationLinkV3' test.out

#- 302 PublicVerifyUserByLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyUserByLinkV3 \
    --code 'M8tdg403' \
    > test.out 2>&1
eval_tap $? 302 'PublicVerifyUserByLinkV3' test.out

#- 303 PlatformAuthenticateSAMLV3Handler
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticateSAMLV3Handler \
    --platformId '0IJKlqw4' \
    --code '3fSjXKP9' \
    --error '0AHfBGQq' \
    --state 'CYTZNoQY' \
    > test.out 2>&1
eval_tap $? 303 'PlatformAuthenticateSAMLV3Handler' test.out

#- 304 LoginSSOClient
./ng net.accelbyte.sdk.cli.Main iam loginSSOClient \
    --platformId 'L5Taaqkh' \
    --payload 'deO4sL7K' \
    > test.out 2>&1
eval_tap $? 304 'LoginSSOClient' test.out

#- 305 LogoutSSOClient
./ng net.accelbyte.sdk.cli.Main iam logoutSSOClient \
    --platformId 'MYriWIQA' \
    > test.out 2>&1
eval_tap $? 305 'LogoutSSOClient' test.out

#- 306 RequestTargetTokenResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTargetTokenResponseV3 \
    --additionalData 'Z7aX4lTO' \
    --code 'XYmRWs1S' \
    > test.out 2>&1
eval_tap $? 306 'RequestTargetTokenResponseV3' test.out

#- 307 AdminListInvitationHistoriesV4
./ng net.accelbyte.sdk.cli.Main iam adminListInvitationHistoriesV4 \
    --limit '61' \
    --namespace "$AB_NAMESPACE" \
    --offset '83' \
    > test.out 2>&1
eval_tap $? 307 'AdminListInvitationHistoriesV4' test.out

#- 308 AdminGetDevicesByUserV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDevicesByUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'n2M4ow2X' \
    > test.out 2>&1
eval_tap $? 308 'AdminGetDevicesByUserV4' test.out

#- 309 AdminGetBannedDevicesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedDevicesV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceType 'P0oo9cXF' \
    --endDate 'Q6q7sV2S' \
    --limit '93' \
    --offset '80' \
    --startDate 'pg1fXZw0' \
    > test.out 2>&1
eval_tap $? 309 'AdminGetBannedDevicesV4' test.out

#- 310 AdminGetUserDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeviceBansV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'DxRUuL8p' \
    > test.out 2>&1
eval_tap $? 310 'AdminGetUserDeviceBansV4' test.out

#- 311 AdminBanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminBanDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"comment": "eE9DWaSb", "deviceId": "Rcb6cPwO", "deviceType": "xs97i17Z", "enabled": true, "endDate": "XacCEp8p", "ext": {"NLuPobfU": {}, "VAqMnJXb": {}, "rqjh6Y4x": {}}, "reason": "0WkIBToJ"}' \
    > test.out 2>&1
eval_tap $? 311 'AdminBanDeviceV4' test.out

#- 312 AdminGetDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBanV4 \
    --banId 'gX9N6pmY' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 312 'AdminGetDeviceBanV4' test.out

#- 313 AdminUpdateDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateDeviceBanV4 \
    --banId 'wrSYAjal' \
    --namespace "$AB_NAMESPACE" \
    --body '{"enabled": false}' \
    > test.out 2>&1
eval_tap $? 313 'AdminUpdateDeviceBanV4' test.out

#- 314 AdminGenerateReportV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateReportV4 \
    --namespace "$AB_NAMESPACE" \
    --endDate 'HyZuRGxi' \
    --startDate 'yTuH80E9' \
    --deviceType 'zpNLG15z' \
    > test.out 2>&1
eval_tap $? 314 'AdminGenerateReportV4' test.out

#- 315 AdminGetDeviceTypesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceTypesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 315 'AdminGetDeviceTypesV4' test.out

#- 316 AdminGetDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBansV4 \
    --deviceId '5z3mRgwl' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 316 'AdminGetDeviceBansV4' test.out

#- 317 AdminDecryptDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminDecryptDeviceV4 \
    --deviceId 'pVNrwHoN' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 317 'AdminDecryptDeviceV4' test.out

#- 318 AdminUnbanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminUnbanDeviceV4 \
    --deviceId 'vMkRO0X2' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 318 'AdminUnbanDeviceV4' test.out

#- 319 AdminGetUsersByDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUsersByDeviceV4 \
    --deviceId 'aPd4sFab' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 319 'AdminGetUsersByDeviceV4' test.out

#- 320 AdminGetNamespaceInvitationHistoryV4
./ng net.accelbyte.sdk.cli.Main iam adminGetNamespaceInvitationHistoryV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 320 'AdminGetNamespaceInvitationHistoryV4' test.out

#- 321 AdminGetNamespaceUserInvitationHistoryV4
./ng net.accelbyte.sdk.cli.Main iam adminGetNamespaceUserInvitationHistoryV4 \
    --namespace "$AB_NAMESPACE" \
    --limit '24' \
    --offset '6' \
    > test.out 2>&1
eval_tap $? 321 'AdminGetNamespaceUserInvitationHistoryV4' test.out

#- 322 AdminCreateTestUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateTestUsersV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 50}' \
    > test.out 2>&1
eval_tap $? 322 'AdminCreateTestUsersV4' test.out

#- 323 AdminCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "ZTipT4oj", "policyId": "rHrEkspt", "policyVersionId": "6khoJqv1"}, {"isAccepted": true, "localizedPolicyVersionId": "Ny21MDFH", "policyId": "CE5FUXup", "policyVersionId": "FHgIAghB"}, {"isAccepted": false, "localizedPolicyVersionId": "4CPFvyjv", "policyId": "eqTDGL5q", "policyVersionId": "54JhAVdw"}], "authType": "EMAILPASSWD", "code": "AlvOsg9X", "country": "Dsp2RzXQ", "dateOfBirth": "ebvupnDm", "displayName": "TOKFwkTC", "emailAddress": "dyezqekG", "password": "aWQIjS49", "passwordMD5Sum": "1XCorHYv", "reachMinimumAge": true, "uniqueDisplayName": "t47HcnqS", "username": "1HHio4A0"}' \
    > test.out 2>&1
eval_tap $? 323 'AdminCreateUserV4' test.out

#- 324 AdminBulkUpdateUserAccountTypeV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateUserAccountTypeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"testAccount": false, "userIds": ["D7GZlVQT", "jWzOEKgN", "yFSYk7c5"]}' \
    > test.out 2>&1
eval_tap $? 324 'AdminBulkUpdateUserAccountTypeV4' test.out

#- 325 AdminBulkCheckValidUserIDV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkCheckValidUserIDV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["WG3jpaCK", "KA6wyWf7", "lkoGTT4E"]}' \
    > test.out 2>&1
eval_tap $? 325 'AdminBulkCheckValidUserIDV4' test.out

#- 326 AdminUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'mLTYB6EE' \
    --body '{"avatarUrl": "0Byr0pVn", "country": "Jz1fdrLU", "dateOfBirth": "GT2IL2C5", "displayName": "YojlLmAj", "languageTag": "2ExLpCrJ", "skipLoginQueue": true, "uniqueDisplayName": "WNQDXrXW", "userName": "R2JBc2fp"}' \
    > test.out 2>&1
eval_tap $? 326 'AdminUpdateUserV4' test.out

#- 327 AdminUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'RFwXh22L' \
    --body '{"code": "herfUpKN", "emailAddress": "IOZDoHsU"}' \
    > test.out 2>&1
eval_tap $? 327 'AdminUpdateUserEmailAddressV4' test.out

#- 328 AdminDisableUserMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableUserMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'RMcNre2M' \
    > test.out 2>&1
eval_tap $? 328 'AdminDisableUserMFAV4' test.out

#- 329 AdminListUserRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminListUserRolesV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'kbMIjbMM' \
    > test.out 2>&1
eval_tap $? 329 'AdminListUserRolesV4' test.out

#- 330 AdminUpdateUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'iXQBRDMF' \
    --body '{"assignedNamespaces": ["xlULKno7", "eSaJ7KSc", "DgL2cNSy"], "roleId": "FBe4Eow9"}' \
    > test.out 2>&1
eval_tap $? 330 'AdminUpdateUserRoleV4' test.out

#- 331 AdminAddUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'l0OMmEnf' \
    --body '{"assignedNamespaces": ["YlEUFJr7", "ByLQhy6g", "uFquZjfi"], "roleId": "Tmw7MUln"}' \
    > test.out 2>&1
eval_tap $? 331 'AdminAddUserRoleV4' test.out

#- 332 AdminRemoveUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRemoveUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '4ytjM2RC' \
    --body '{"assignedNamespaces": ["cqJqoqGc", "0pTTfJO7", "h6CTZBSd"], "roleId": "oVAPMZZD"}' \
    > test.out 2>&1
eval_tap $? 332 'AdminRemoveUserRoleV4' test.out

#- 333 AdminGetRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV4 \
    --adminRole  \
    --isWildcard  \
    --limit '95' \
    --offset '42' \
    > test.out 2>&1
eval_tap $? 333 'AdminGetRolesV4' test.out

#- 334 AdminCreateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV4 \
    --body '{"adminRole": true, "deletable": false, "isWildcard": false, "roleName": "s5zuDhie"}' \
    > test.out 2>&1
eval_tap $? 334 'AdminCreateRoleV4' test.out

#- 335 AdminGetRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV4 \
    --roleId 'Uh9HOA43' \
    > test.out 2>&1
eval_tap $? 335 'AdminGetRoleV4' test.out

#- 336 AdminDeleteRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV4 \
    --roleId 'DksJx4Su' \
    > test.out 2>&1
eval_tap $? 336 'AdminDeleteRoleV4' test.out

#- 337 AdminUpdateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV4 \
    --roleId 'EQRNNyMn' \
    --body '{"adminRole": true, "deletable": false, "isWildcard": true, "roleName": "6Z4ECl0j"}' \
    > test.out 2>&1
eval_tap $? 337 'AdminUpdateRoleV4' test.out

#- 338 AdminUpdateRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV4 \
    --roleId 'pUsNIlc0' \
    --body '{"permissions": [{"action": 98, "resource": "WdN5hnTs", "schedAction": 79, "schedCron": "HUm3IzbB", "schedRange": ["ap9siILA", "juPKjYn4", "BIFcfQMN"]}, {"action": 92, "resource": "AvAWWK30", "schedAction": 23, "schedCron": "lk8hF6sL", "schedRange": ["nVeFRhSU", "XqG7Bso8", "g5cbfSRi"]}, {"action": 92, "resource": "oTiKx72d", "schedAction": 97, "schedCron": "VnXuJ7j2", "schedRange": ["x6ZhWz86", "RFJJ6owf", "AZceR506"]}]}' \
    > test.out 2>&1
eval_tap $? 338 'AdminUpdateRolePermissionsV4' test.out

#- 339 AdminAddRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV4 \
    --roleId 'gEhOjveC' \
    --body '{"permissions": [{"action": 35, "resource": "PTANUOQs", "schedAction": 44, "schedCron": "8qHPaKT8", "schedRange": ["nl5W2O6Z", "GU0qyZ5G", "823FeUK8"]}, {"action": 100, "resource": "qKRTYwmN", "schedAction": 81, "schedCron": "71cfKeGw", "schedRange": ["PbURb4dA", "5UkSLCBn", "1e8LngNw"]}, {"action": 31, "resource": "6iH7rNaG", "schedAction": 30, "schedCron": "3wsleqpW", "schedRange": ["VuYkJyaR", "smyhsWnt", "bp5eWRaN"]}]}' \
    > test.out 2>&1
eval_tap $? 339 'AdminAddRolePermissionsV4' test.out

#- 340 AdminDeleteRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV4 \
    --roleId 'PiCNZaHn' \
    --body '["gtIQdwpm", "P5EiuCii", "S1tZMnQR"]' \
    > test.out 2>&1
eval_tap $? 340 'AdminDeleteRolePermissionsV4' test.out

#- 341 AdminListAssignedUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminListAssignedUsersV4 \
    --roleId 'wSc9lKcT' \
    --after 'mXQPpVgF' \
    --before '1CYIp61j' \
    --limit '18' \
    > test.out 2>&1
eval_tap $? 341 'AdminListAssignedUsersV4' test.out

#- 342 AdminAssignUserToRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAssignUserToRoleV4 \
    --roleId 'pxpg63BU' \
    --body '{"assignedNamespaces": ["903BIwJp", "3gRcmS7P", "sA5U9JBA"], "namespace": "PL0hYzuU", "userId": "Ny8uab3F"}' \
    > test.out 2>&1
eval_tap $? 342 'AdminAssignUserToRoleV4' test.out

#- 343 AdminRevokeUserFromRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRevokeUserFromRoleV4 \
    --roleId 'Ld5BRISi' \
    --body '{"namespace": "IUqBrH1I", "userId": "cgdYEwU0"}' \
    > test.out 2>&1
eval_tap $? 343 'AdminRevokeUserFromRoleV4' test.out

#- 344 AdminInviteUserNewV4
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserNewV4 \
    --body '{"assignedNamespaces": ["n95Hkbzo", "SVsL2oou", "qY3pH8Q0"], "emailAddresses": ["JFQ5JBEQ", "DJUiMa4f", "CbcjESWB"], "isAdmin": false, "isNewStudio": true, "namespace": "gZbeCPUx", "roleId": "lqKg3AaA"}' \
    > test.out 2>&1
eval_tap $? 344 'AdminInviteUserNewV4' test.out

#- 345 AdminUpdateMyUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateMyUserV4 \
    --body '{"avatarUrl": "DEJJelh4", "country": "Uqg1aBWa", "dateOfBirth": "tfM6y7hp", "displayName": "5BPGW1wT", "languageTag": "ap6PMRQ4", "skipLoginQueue": true, "uniqueDisplayName": "OwsB1NFT", "userName": "YQh1kHZH"}' \
    > test.out 2>&1
eval_tap $? 345 'AdminUpdateMyUserV4' test.out

#- 346 AdminDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyAuthenticatorV4 \
    > test.out 2>&1
eval_tap $? 346 'AdminDisableMyAuthenticatorV4' test.out

#- 347 AdminEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyAuthenticatorV4 \
    --code '08Bxj18r' \
    > test.out 2>&1
eval_tap $? 347 'AdminEnableMyAuthenticatorV4' test.out

#- 348 AdminGenerateMyAuthenticatorKeyV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateMyAuthenticatorKeyV4 \
    > test.out 2>&1
eval_tap $? 348 'AdminGenerateMyAuthenticatorKeyV4' test.out

#- 349 AdminGetMyBackupCodesV4
eval_tap 0 349 'AdminGetMyBackupCodesV4 # SKIP deprecated' test.out

#- 350 AdminGenerateMyBackupCodesV4
eval_tap 0 350 'AdminGenerateMyBackupCodesV4 # SKIP deprecated' test.out

#- 351 AdminDisableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 351 'AdminDisableMyBackupCodesV4' test.out

#- 352 AdminDownloadMyBackupCodesV4
eval_tap 0 352 'AdminDownloadMyBackupCodesV4 # SKIP deprecated' test.out

#- 353 AdminEnableMyBackupCodesV4
eval_tap 0 353 'AdminEnableMyBackupCodesV4 # SKIP deprecated' test.out

#- 354 AdminGetBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 354 'AdminGetBackupCodesV4' test.out

#- 355 AdminGenerateBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 355 'AdminGenerateBackupCodesV4' test.out

#- 356 AdminEnableBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 356 'AdminEnableBackupCodesV4' test.out

#- 357 AdminSendMyMFAEmailCodeV4
./ng net.accelbyte.sdk.cli.Main iam adminSendMyMFAEmailCodeV4 \
    > test.out 2>&1
eval_tap $? 357 'AdminSendMyMFAEmailCodeV4' test.out

#- 358 AdminDisableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyEmailV4 \
    > test.out 2>&1
eval_tap $? 358 'AdminDisableMyEmailV4' test.out

#- 359 AdminEnableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyEmailV4 \
    --code 'oexRIVCV' \
    > test.out 2>&1
eval_tap $? 359 'AdminEnableMyEmailV4' test.out

#- 360 AdminGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyEnabledFactorsV4 \
    > test.out 2>&1
eval_tap $? 360 'AdminGetMyEnabledFactorsV4' test.out

#- 361 AdminMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam adminMakeFactorMyDefaultV4 \
    --factor 'gJqTadPt' \
    > test.out 2>&1
eval_tap $? 361 'AdminMakeFactorMyDefaultV4' test.out

#- 362 AdminInviteUserV4
eval_tap 0 362 'AdminInviteUserV4 # SKIP deprecated' test.out

#- 363 AuthenticationWithPlatformLinkV4
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV4 \
    --extendExp  \
    --clientId 'kV9U9lav' \
    --linkingToken 'yrj8IWF0' \
    --password 'ZNdysMfQ' \
    --username '962KovjS' \
    > test.out 2>&1
eval_tap $? 363 'AuthenticationWithPlatformLinkV4' test.out

#- 364 GenerateTokenByNewHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV4 \
    --additionalData 'slPHEbpa' \
    --extendExp  \
    --linkingToken 'akbBrcNS' \
    > test.out 2>&1
eval_tap $? 364 'GenerateTokenByNewHeadlessAccountV4' test.out

#- 365 Verify2faCodeV4
./ng net.accelbyte.sdk.cli.Main iam verify2faCodeV4 \
    --code 'v7zQqp2d' \
    --factor 'O0YmPgbv' \
    --mfaToken 'H1f0Z122' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 365 'Verify2faCodeV4' test.out

#- 366 PlatformTokenGrantV4
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV4 \
    --platformId '6mj4bf67' \
    --codeChallenge 'Ob6jWwWX' \
    --codeChallengeMethod 'S256' \
    --additionalData '9ZCceIIb' \
    --clientId 'nuNRCOFZ' \
    --createHeadless  \
    --deviceId '4GwODDNy' \
    --macAddress '1VWq1dKs' \
    --platformToken 'rxJPemH1' \
    --skipSetCookie  \
    > test.out 2>&1
eval_tap $? 366 'PlatformTokenGrantV4' test.out

#- 367 SimultaneousLoginV4
./ng net.accelbyte.sdk.cli.Main iam simultaneousLoginV4 \
    --codeChallenge 'ZWYLL0hB' \
    --codeChallengeMethod 'plain' \
    --simultaneousPlatform 'WSveswQw' \
    --simultaneousTicket 'WuSX6sHc' \
    --nativePlatform 'epicgames' \
    --nativePlatformTicket 'od24I6HY' \
    > test.out 2>&1
eval_tap $? 367 'SimultaneousLoginV4' test.out

#- 368 TokenGrantV4
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV4 \
    --codeChallenge 'et9BRav4' \
    --codeChallengeMethod 'S256' \
    --additionalData 'Sf5wBXBE' \
    --clientId '4GdtEHSG' \
    --code '4FjlOaKM' \
    --codeVerifier 'jbfR3pYB' \
    --extendNamespace 'QO4EG54A' \
    --extendExp  \
    --loginQueueTicket 'HNqkZTtc' \
    --password 'J5HANalr' \
    --redirectUri 'iUTgMyY9' \
    --refreshToken 'NfdBtBGV' \
    --username 'tCwYM4Yk' \
    --grantType 'refresh_token' \
    > test.out 2>&1
eval_tap $? 368 'TokenGrantV4' test.out

#- 369 RequestTargetTokenResponseV4
./ng net.accelbyte.sdk.cli.Main iam requestTargetTokenResponseV4 \
    --additionalData '6eVhBFYW' \
    --code '3SF5RHvw' \
    > test.out 2>&1
eval_tap $? 369 'RequestTargetTokenResponseV4' test.out

#- 370 PublicCreateTestUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateTestUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "wLdRcb95", "policyId": "Ht2bDktf", "policyVersionId": "FkxvD4Bg"}, {"isAccepted": true, "localizedPolicyVersionId": "E4CuiEDU", "policyId": "3qVZSB8S", "policyVersionId": "vWhz0ONJ"}, {"isAccepted": true, "localizedPolicyVersionId": "l2EQIG08", "policyId": "njxmCGIi", "policyVersionId": "uxMDskLk"}], "authType": "EMAILPASSWD", "country": "KaZkacpK", "dateOfBirth": "Kh49dd2w", "displayName": "RXRsBq0B", "emailAddress": "DcwpADAP", "password": "fqUrsbNi", "passwordMD5Sum": "7vdWi5i0", "uniqueDisplayName": "g5BnnyfU", "username": "FS7N1XSo", "verified": true}' \
    > test.out 2>&1
eval_tap $? 370 'PublicCreateTestUserV4' test.out

#- 371 PublicCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "FiSJRake", "policyId": "bQL5Tw7e", "policyVersionId": "ahuMXYPY"}, {"isAccepted": false, "localizedPolicyVersionId": "RmFSovQs", "policyId": "FC9jP2oE", "policyVersionId": "WhkZ7s6V"}, {"isAccepted": true, "localizedPolicyVersionId": "xCsSRUsi", "policyId": "AV5tUW59", "policyVersionId": "2GW35dfN"}], "authType": "EMAILPASSWD", "code": "N7yJHJyZ", "country": "ePxyFJYD", "dateOfBirth": "WVohimvv", "displayName": "Bjcnidp4", "emailAddress": "XfdW8IxG", "password": "wD5cYy0C", "passwordMD5Sum": "TqAsgbBZ", "reachMinimumAge": false, "uniqueDisplayName": "m3hIyx1O", "username": "BEoBCPY6"}' \
    > test.out 2>&1
eval_tap $? 371 'PublicCreateUserV4' test.out

#- 372 CreateUserFromInvitationV4
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV4 \
    --invitationId 'zjFW58gl' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "04V538Kq", "policyId": "tZ8WLyYH", "policyVersionId": "Xsh9jdDd"}, {"isAccepted": false, "localizedPolicyVersionId": "dmrnmpx9", "policyId": "XsoJMxLV", "policyVersionId": "TCPD2XNh"}, {"isAccepted": true, "localizedPolicyVersionId": "4AAt4Wzd", "policyId": "8rZZoxeZ", "policyVersionId": "Am7ULW4G"}], "authType": "EMAILPASSWD", "code": "AQLcRiWl", "country": "29asqejF", "dateOfBirth": "NQ7nV7KQ", "displayName": "Fp4AHOzf", "emailAddress": "0wxcdHpx", "password": "0F4rwh0v", "passwordMD5Sum": "kIVBjbu6", "reachMinimumAge": true, "uniqueDisplayName": "FxvU7j9A", "username": "BKG3uWq8"}' \
    > test.out 2>&1
eval_tap $? 372 'CreateUserFromInvitationV4' test.out

#- 373 PublicUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "GDNWkMQj", "country": "hr9pitLU", "dateOfBirth": "rGa9PAmw", "displayName": "FQpolHXR", "languageTag": "8LykqtmI", "uniqueDisplayName": "05mFJFZ8", "userName": "kUCDDTs1"}' \
    > test.out 2>&1
eval_tap $? 373 'PublicUpdateUserV4' test.out

#- 374 PublicUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "fy15HA9q", "emailAddress": "QpDq4tXa"}' \
    > test.out 2>&1
eval_tap $? 374 'PublicUpdateUserEmailAddressV4' test.out

#- 375 PublicUpgradeHeadlessAccountWithVerificationCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountWithVerificationCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "HRFKN3cF", "country": "x2Gx93Js", "dateOfBirth": "42MS7gyS", "displayName": "tvn8N2ax", "emailAddress": "Cwwt34IS", "password": "Ef9IehQt", "reachMinimumAge": false, "uniqueDisplayName": "mtyTebjM", "username": "XFZ6GNns", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 375 'PublicUpgradeHeadlessAccountWithVerificationCodeV4' test.out

#- 376 PublicUpgradeHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "AK6lXLII", "password": "hw29Okvs", "username": "NVO8gEB4"}' \
    > test.out 2>&1
eval_tap $? 376 'PublicUpgradeHeadlessAccountV4' test.out

#- 377 PublicDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 377 'PublicDisableMyAuthenticatorV4' test.out

#- 378 PublicEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'DXFNE4e2' \
    > test.out 2>&1
eval_tap $? 378 'PublicEnableMyAuthenticatorV4' test.out

#- 379 PublicGenerateMyAuthenticatorKeyV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateMyAuthenticatorKeyV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 379 'PublicGenerateMyAuthenticatorKeyV4' test.out

#- 380 PublicGetMyBackupCodesV4
eval_tap 0 380 'PublicGetMyBackupCodesV4 # SKIP deprecated' test.out

#- 381 PublicGenerateMyBackupCodesV4
eval_tap 0 381 'PublicGenerateMyBackupCodesV4 # SKIP deprecated' test.out

#- 382 PublicDisableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 382 'PublicDisableMyBackupCodesV4' test.out

#- 383 PublicDownloadMyBackupCodesV4
eval_tap 0 383 'PublicDownloadMyBackupCodesV4 # SKIP deprecated' test.out

#- 384 PublicEnableMyBackupCodesV4
eval_tap 0 384 'PublicEnableMyBackupCodesV4 # SKIP deprecated' test.out

#- 385 PublicGetBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGetBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 385 'PublicGetBackupCodesV4' test.out

#- 386 PublicGenerateBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 386 'PublicGenerateBackupCodesV4' test.out

#- 387 PublicEnableBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 387 'PublicEnableBackupCodesV4' test.out

#- 388 PublicRemoveTrustedDeviceV4
./ng net.accelbyte.sdk.cli.Main iam publicRemoveTrustedDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceToken 'HbHIStuf' \
    > test.out 2>&1
eval_tap $? 388 'PublicRemoveTrustedDeviceV4' test.out

#- 389 PublicSendMyMFAEmailCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicSendMyMFAEmailCodeV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 389 'PublicSendMyMFAEmailCodeV4' test.out

#- 390 PublicDisableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyEmailV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 390 'PublicDisableMyEmailV4' test.out

#- 391 PublicEnableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyEmailV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'jsHgW6Bq' \
    > test.out 2>&1
eval_tap $? 391 'PublicEnableMyEmailV4' test.out

#- 392 PublicGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam publicGetMyEnabledFactorsV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 392 'PublicGetMyEnabledFactorsV4' test.out

#- 393 PublicMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam publicMakeFactorMyDefaultV4 \
    --namespace "$AB_NAMESPACE" \
    --factor '0AfVxqBC' \
    > test.out 2>&1
eval_tap $? 393 'PublicMakeFactorMyDefaultV4' test.out

#- 394 PublicGetUserPublicInfoByUserIdV4
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPublicInfoByUserIdV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Kua8pFvZ' \
    > test.out 2>&1
eval_tap $? 394 'PublicGetUserPublicInfoByUserIdV4' test.out

#- 395 PublicInviteUserV4
./ng net.accelbyte.sdk.cli.Main iam publicInviteUserV4 \
    --body '{"additionalData": "ZwdXg2T5", "emailAddress": "OCVJi4wR", "namespace": "6GBo9oZL", "namespaceDisplayName": "2njW5aQm"}' \
    > test.out 2>&1
eval_tap $? 395 'PublicInviteUserV4' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
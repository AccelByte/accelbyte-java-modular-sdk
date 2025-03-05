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
echo "1..432"

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
    --body '{"modules": [{"docLink": "GhP5WDkv", "groups": [{"group": "1u13QwPG", "groupId": "fGIB5747", "permissions": [{"allowedActions": [5, 97, 62], "resource": "mULHEwEa"}, {"allowedActions": [86, 41, 65], "resource": "dNkIBfO8"}, {"allowedActions": [9, 20, 20], "resource": "Dt4wASR2"}]}, {"group": "OFSpWr4r", "groupId": "oUPQ3gNm", "permissions": [{"allowedActions": [55, 11, 80], "resource": "PAX7iihy"}, {"allowedActions": [79, 41, 92], "resource": "AxMYiMfw"}, {"allowedActions": [18, 19, 9], "resource": "qdtnuXAp"}]}, {"group": "lw7InThf", "groupId": "k7qDP0Dv", "permissions": [{"allowedActions": [34, 90, 53], "resource": "sVMwu08L"}, {"allowedActions": [66, 76, 68], "resource": "3LyNOv14"}, {"allowedActions": [19, 50, 100], "resource": "F1Yl1vt6"}]}], "module": "cLqG25zI", "moduleId": "7kSo8qNE"}, {"docLink": "6jAm93G0", "groups": [{"group": "d52Nm7HN", "groupId": "bcJpnrEF", "permissions": [{"allowedActions": [4, 62, 46], "resource": "gensO6c9"}, {"allowedActions": [59, 38, 53], "resource": "OKEQ6Ifi"}, {"allowedActions": [50, 61, 48], "resource": "ihtdAo7a"}]}, {"group": "jtZ6kxL7", "groupId": "gXxcyPpT", "permissions": [{"allowedActions": [86, 17, 69], "resource": "b9y0gcgL"}, {"allowedActions": [50, 100, 61], "resource": "F7T1gdit"}, {"allowedActions": [72, 67, 63], "resource": "8c7E1h9x"}]}, {"group": "U5i10esp", "groupId": "N0yURnEJ", "permissions": [{"allowedActions": [63, 6, 33], "resource": "u9TW7OK2"}, {"allowedActions": [3, 47, 16], "resource": "RLIWkTYh"}, {"allowedActions": [98, 75, 40], "resource": "OcTlAyIw"}]}], "module": "ehLIAP7T", "moduleId": "O0XULWzE"}, {"docLink": "eiU7TjT0", "groups": [{"group": "KH63QdMO", "groupId": "mKmMN7f2", "permissions": [{"allowedActions": [82, 11, 50], "resource": "RKubNktP"}, {"allowedActions": [47, 21, 30], "resource": "hZASL7hl"}, {"allowedActions": [57, 39, 100], "resource": "ip3StvKZ"}]}, {"group": "l4XaVGmh", "groupId": "bhU0gV5F", "permissions": [{"allowedActions": [49, 8, 7], "resource": "EsbVqOYq"}, {"allowedActions": [59, 78, 91], "resource": "SzPWOqQQ"}, {"allowedActions": [84, 34, 55], "resource": "zOR0nAP5"}]}, {"group": "Vd3w7uJe", "groupId": "fAU1OLBz", "permissions": [{"allowedActions": [30, 53, 59], "resource": "ZXYdTQZf"}, {"allowedActions": [52, 56, 37], "resource": "weAnR6mU"}, {"allowedActions": [51, 15, 33], "resource": "vN7iNXYD"}]}], "module": "e8fap6Td", "moduleId": "IiCKZMIe"}]}' \
    > test.out 2>&1
eval_tap $? 109 'AdminUpdateAvailablePermissionsByModule' test.out

#- 110 AdminDeleteConfigPermissionsByGroup
./ng net.accelbyte.sdk.cli.Main iam adminDeleteConfigPermissionsByGroup \
    --forceDelete  \
    --body '{"groupId": "ZihIPKH9", "moduleId": "FNfBH3By"}' \
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
    --body '[{"field": "lYIwjAOd", "validation": {"allowAllSpecialCharacters": false, "allowDigit": false, "allowLetter": true, "allowSpace": false, "allowUnicode": true, "avatarConfig": {"allowedPrefixes": ["IpseVJFB", "XuLhinOg", "AdSLCCOB"], "preferRegex": false, "regex": "Wr56QL6D"}, "blockedWord": ["h0L9itV2", "6sZom0Jg", "rayUSWPt"], "description": [{"language": "ekGOKoYy", "message": ["m3dSmTTt", "xvHEKqxK", "s9dH735u"]}, {"language": "P7fHWiSN", "message": ["LsXFBEdw", "q0VwI7E0", "92HhNKHl"]}, {"language": "r3i0XPBS", "message": ["yvx9XcX1", "VBeGFRW5", "XjJM9HhP"]}], "isCustomRegex": true, "letterCase": "aMQWnKdP", "maxLength": 14, "maxRepeatingAlphaNum": 1, "maxRepeatingSpecialCharacter": 36, "minCharType": 0, "minLength": 55, "profanityFilter": "ZaGASME5", "regex": "NoNYxKk7", "specialCharacterLocation": "WwlOOFNV", "specialCharacters": ["BK7g0W6A", "vLvnSgV3", "PQpMPSRj"]}}, {"field": "CsSNGRH5", "validation": {"allowAllSpecialCharacters": false, "allowDigit": true, "allowLetter": false, "allowSpace": true, "allowUnicode": true, "avatarConfig": {"allowedPrefixes": ["BR4M2phr", "Ff5Gn20u", "0VqXpgOk"], "preferRegex": false, "regex": "wEjtN3k2"}, "blockedWord": ["RtkMkwN7", "5Ij0jmE9", "MdBzTi5m"], "description": [{"language": "yJKelV0y", "message": ["TVRQMDgt", "rMPqJqgX", "QQcRAMwd"]}, {"language": "RE7Lf9p8", "message": ["BYRQITl3", "hksorJ21", "p5UCuY8k"]}, {"language": "CT5toJbi", "message": ["p1CBtD1S", "zIQE5tLs", "AaMXmwaS"]}], "isCustomRegex": false, "letterCase": "3jEbOd6E", "maxLength": 91, "maxRepeatingAlphaNum": 8, "maxRepeatingSpecialCharacter": 43, "minCharType": 81, "minLength": 40, "profanityFilter": "YH1OBmZY", "regex": "ehbOeWk6", "specialCharacterLocation": "iABF3dYK", "specialCharacters": ["st8tKr9e", "Cb0fPvO0", "2MUZPKgk"]}}, {"field": "O5O5jMcg", "validation": {"allowAllSpecialCharacters": true, "allowDigit": true, "allowLetter": true, "allowSpace": true, "allowUnicode": true, "avatarConfig": {"allowedPrefixes": ["nTDfu3Su", "GExONkyL", "RyWBtCwc"], "preferRegex": false, "regex": "DTQ2WHrF"}, "blockedWord": ["jwYYIuVH", "pchGixK9", "7I0t4NQd"], "description": [{"language": "OxRofzBz", "message": ["gI1MCBEY", "n9dZR2lp", "w4CqDMrq"]}, {"language": "ZcDepmmm", "message": ["02l9dSF5", "1DGtErlx", "Bwj39Q6A"]}, {"language": "9v2siu1G", "message": ["RcKAyQHc", "xiHb8lJu", "NFfxjmj9"]}], "isCustomRegex": false, "letterCase": "DOmuzQGu", "maxLength": 36, "maxRepeatingAlphaNum": 44, "maxRepeatingSpecialCharacter": 25, "minCharType": 12, "minLength": 71, "profanityFilter": "6aKdzsSg", "regex": "iHopUg4c", "specialCharacterLocation": "RQXWOjE3", "specialCharacters": ["vUqVSTBp", "JE35gfed", "F00y1bQ3"]}}]' \
    > test.out 2>&1
eval_tap $? 113 'AdminUpdateInputValidations' test.out

#- 114 AdminResetInputValidations
./ng net.accelbyte.sdk.cli.Main iam adminResetInputValidations \
    --field '1pd3gZVn' \
    > test.out 2>&1
eval_tap $? 114 'AdminResetInputValidations' test.out

#- 115 ListAdminsV3
./ng net.accelbyte.sdk.cli.Main iam listAdminsV3 \
    --namespace "$AB_NAMESPACE" \
    --after 'Hgph8kmR' \
    --before 'Ut3J2oTe' \
    --endDate 'GI4IyASp' \
    --limit '73' \
    --query '0RIqagpG' \
    --roleId 'kNlXgiMF' \
    --startDate 'YF4Dur6t' \
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
    --body '{"ageRestriction": 31, "enable": true}' \
    > test.out 2>&1
eval_tap $? 117 'AdminUpdateAgeRestrictionConfigV3' test.out

#- 118 AdminGetListCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminGetListCountryAgeRestrictionV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 118 'AdminGetListCountryAgeRestrictionV3' test.out

#- 119 AdminUpdateCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateCountryAgeRestrictionV3 \
    --countryCode 'u1jdbDDB' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ageRestriction": 93}' \
    > test.out 2>&1
eval_tap $? 119 'AdminUpdateCountryAgeRestrictionV3' test.out

#- 120 AdminGetBannedUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType 'wiS7u6CA' \
    --limit '42' \
    --offset '84' \
    > test.out 2>&1
eval_tap $? 120 'AdminGetBannedUsersV3' test.out

#- 121 AdminBanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"ban": "lYAHeGT5", "comment": "Dd1Otdgh", "endDate": "WSulKmaX", "reason": "8ShQPvgQ", "skipNotif": true, "userIds": ["X2Mvfn0n", "rBmK1HGw", "vA85tzLd"]}' \
    > test.out 2>&1
eval_tap $? 121 'AdminBanUserBulkV3' test.out

#- 122 AdminUnbanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminUnbanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"bans": [{"banId": "CwmByZz5", "userId": "BaU4xkTF"}, {"banId": "zV26riiD", "userId": "lWrtnd7l"}, {"banId": "yDJPb1t8", "userId": "TYSAceSk"}]}' \
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
    --clientId 'y5ZOiL9i' \
    --clientName 'baRoqONw' \
    --clientType 'etE2c42m' \
    --limit '62' \
    --offset '47' \
    --skipLoginQueue  \
    > test.out 2>&1
eval_tap $? 124 'AdminGetClientsByNamespaceV3' test.out

#- 125 AdminBulkUpdateClientsV3
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateClientsV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientIds": ["wihE8nAT", "suPEuSTl", "10IfMOXQ"], "clientUpdateRequest": {"audiences": ["QoFUczJW", "kEroIusm", "ozGwB1pf"], "baseUri": "Ki9SRz2H", "clientName": "VWEFbSbC", "clientPermissions": [{"action": 87, "resource": "nSNWF6u7", "schedAction": 37, "schedCron": "EbdFdrWU", "schedRange": ["FioSn61Q", "8HUrbQuJ", "6Lt5y1qE"]}, {"action": 43, "resource": "kj7QhaZs", "schedAction": 55, "schedCron": "eewcO25F", "schedRange": ["SEq1wfLl", "cu9QlwXx", "bJK4jXc0"]}, {"action": 80, "resource": "SayjTbjK", "schedAction": 35, "schedCron": "ZU7LvsQp", "schedRange": ["fYmx5ZEW", "nQKQt1ok", "ahb5ZOvb"]}], "clientPlatform": "qSXfUMkT", "deletable": true, "description": "u9b1eeu2", "modulePermissions": [{"moduleId": "5iLHkDEv", "selectedGroups": [{"groupId": "muZlD0ZS", "selectedActions": [58, 63, 4]}, {"groupId": "76W6LzYT", "selectedActions": [1, 30, 87]}, {"groupId": "OlO5MhzA", "selectedActions": [19, 9, 10]}]}, {"moduleId": "GGmVxhmv", "selectedGroups": [{"groupId": "8MiaSqJN", "selectedActions": [15, 59, 45]}, {"groupId": "sTXA6bIp", "selectedActions": [45, 8, 40]}, {"groupId": "CO953hDc", "selectedActions": [70, 93, 56]}]}, {"moduleId": "VByxDajx", "selectedGroups": [{"groupId": "WoBMFjBe", "selectedActions": [54, 66, 26]}, {"groupId": "p8FwDCVT", "selectedActions": [68, 39, 56]}, {"groupId": "vmEHnSIJ", "selectedActions": [50, 90, 92]}]}], "namespace": "kYLXJTml", "oauthAccessTokenExpiration": 9, "oauthAccessTokenExpirationTimeUnit": "w8MYmuJZ", "oauthRefreshTokenExpiration": 40, "oauthRefreshTokenExpirationTimeUnit": "ICu1YFfA", "redirectUri": "zWHit4M8", "scopes": ["mkZQYodd", "TpXpai4E", "VGxgEWxw"], "skipLoginQueue": true, "twoFactorEnabled": true}}' \
    > test.out 2>&1
eval_tap $? 125 'AdminBulkUpdateClientsV3' test.out

#- 126 AdminCreateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateClientV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["uWJZD5Gd", "xrwGeamR", "MEB42wPR"], "baseUri": "OZiMNOJ8", "clientId": "qn3gpxzs", "clientName": "PmXsp5MZ", "clientPermissions": [{"action": 2, "resource": "AKVjB6Fa", "schedAction": 84, "schedCron": "mZqUwBJg", "schedRange": ["cxbmdMxU", "Snc9oGFZ", "rUA8E8ot"]}, {"action": 87, "resource": "0HtDFSIV", "schedAction": 84, "schedCron": "CHjSjtKg", "schedRange": ["RtVhrfUp", "DNpVkR2W", "qUk1MZgf"]}, {"action": 47, "resource": "2rZBaPtM", "schedAction": 77, "schedCron": "EFxPoOvP", "schedRange": ["igRuRg1A", "9shsZ1KZ", "Ygi1wCeT"]}], "clientPlatform": "4Osv1AvN", "deletable": false, "description": "dWxWwLUB", "modulePermissions": [{"moduleId": "xdCKtgTh", "selectedGroups": [{"groupId": "x4V2rCPs", "selectedActions": [11, 44, 27]}, {"groupId": "j8Zvqxhv", "selectedActions": [91, 71, 67]}, {"groupId": "X5eN2sUM", "selectedActions": [2, 97, 93]}]}, {"moduleId": "tIez3Gt9", "selectedGroups": [{"groupId": "t1eRl2Ih", "selectedActions": [11, 11, 31]}, {"groupId": "XwhlxVKm", "selectedActions": [90, 43, 59]}, {"groupId": "rn2ikkAK", "selectedActions": [95, 25, 44]}]}, {"moduleId": "valsFvlk", "selectedGroups": [{"groupId": "DbG0lfFw", "selectedActions": [74, 15, 2]}, {"groupId": "GiAdYOYy", "selectedActions": [68, 48, 26]}, {"groupId": "KQzqp5Tb", "selectedActions": [20, 33, 45]}]}], "namespace": "01we8GXD", "oauthAccessTokenExpiration": 69, "oauthAccessTokenExpirationTimeUnit": "lDllOLtA", "oauthClientType": "djgyp23D", "oauthRefreshTokenExpiration": 2, "oauthRefreshTokenExpirationTimeUnit": "KkTUHNke", "parentNamespace": "Q8hnxCJp", "redirectUri": "BvU2gfm2", "scopes": ["KaGHtNGQ", "GLzWTn9Q", "wTuP01n5"], "secret": "5sIa1PtI", "skipLoginQueue": true, "twoFactorEnabled": true}' \
    > test.out 2>&1
eval_tap $? 126 'AdminCreateClientV3' test.out

#- 127 AdminGetClientsbyNamespacebyIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetClientsbyNamespacebyIDV3 \
    --clientId 'nMiAbJeV' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 127 'AdminGetClientsbyNamespacebyIDV3' test.out

#- 128 AdminDeleteClientV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientV3 \
    --clientId 'K2mxCAP7' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 128 'AdminDeleteClientV3' test.out

#- 129 AdminUpdateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientV3 \
    --clientId 'Ca34VZkO' \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["5f1ZUG94", "hbBW5Zvf", "mOwT2NLB"], "baseUri": "5GHurZG5", "clientName": "lntKD8Ag", "clientPermissions": [{"action": 9, "resource": "SDmlCt8s", "schedAction": 9, "schedCron": "EbvSlU5p", "schedRange": ["qO4adL2s", "8Qfbr9KF", "bbpEwaeP"]}, {"action": 66, "resource": "9ZEam8es", "schedAction": 62, "schedCron": "GHDF5cDW", "schedRange": ["DlmIzucE", "QUwZPU2w", "IT6pwH21"]}, {"action": 59, "resource": "WE6iwDNv", "schedAction": 3, "schedCron": "XDUvOguU", "schedRange": ["T8POKQAU", "NdOGKJGg", "21Oxn2ou"]}], "clientPlatform": "zgakw3XA", "deletable": true, "description": "Gc7blPGC", "modulePermissions": [{"moduleId": "4KzWneAG", "selectedGroups": [{"groupId": "eF27daiu", "selectedActions": [36, 1, 21]}, {"groupId": "akbegTCw", "selectedActions": [0, 67, 80]}, {"groupId": "InrH6DQd", "selectedActions": [32, 23, 34]}]}, {"moduleId": "l7R4N2Pf", "selectedGroups": [{"groupId": "lJqUKi4y", "selectedActions": [55, 44, 79]}, {"groupId": "o9EW5mUB", "selectedActions": [50, 30, 8]}, {"groupId": "k89uGnzF", "selectedActions": [95, 63, 87]}]}, {"moduleId": "zV0WVJOa", "selectedGroups": [{"groupId": "ZzCiGiLN", "selectedActions": [76, 88, 54]}, {"groupId": "Jy2civ3e", "selectedActions": [91, 26, 66]}, {"groupId": "02GTChaV", "selectedActions": [28, 16, 1]}]}], "namespace": "SzlCmPlM", "oauthAccessTokenExpiration": 32, "oauthAccessTokenExpirationTimeUnit": "pCUsflJb", "oauthRefreshTokenExpiration": 32, "oauthRefreshTokenExpirationTimeUnit": "CPe9eDqM", "redirectUri": "ynBft0ug", "scopes": ["VVEAs9aw", "c4wKM3Bo", "YkVTb3oc"], "skipLoginQueue": false, "twoFactorEnabled": true}' \
    > test.out 2>&1
eval_tap $? 129 'AdminUpdateClientV3' test.out

#- 130 AdminUpdateClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientPermissionV3 \
    --clientId 'cYDR74lA' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 70, "resource": "QgRMcPQI"}, {"action": 10, "resource": "DiybqrhT"}, {"action": 74, "resource": "IX00g8en"}]}' \
    > test.out 2>&1
eval_tap $? 130 'AdminUpdateClientPermissionV3' test.out

#- 131 AdminAddClientPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddClientPermissionsV3 \
    --clientId '0Jeuuta8' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 58, "resource": "2viZLNFQ"}, {"action": 19, "resource": "jC2aP7NF"}, {"action": 1, "resource": "35QRdokk"}]}' \
    > test.out 2>&1
eval_tap $? 131 'AdminAddClientPermissionsV3' test.out

#- 132 AdminDeleteClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientPermissionV3 \
    --action '84' \
    --clientId 'jR2ZjVeu' \
    --namespace "$AB_NAMESPACE" \
    --resource 'k9yEgi6b' \
    > test.out 2>&1
eval_tap $? 132 'AdminDeleteClientPermissionV3' test.out

#- 133 AdminGetConfigValueV3
./ng net.accelbyte.sdk.cli.Main iam adminGetConfigValueV3 \
    --configKey 'TGE8M2RZ' \
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
    --body '{"blacklist": ["WbqYEGKq", "g6IqOeyq", "HJyMFI6I"]}' \
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
    --body '{"active": false, "roleIds": ["NY3G3ZDS", "YGrmKmCx", "oYJ0zvsF"]}' \
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
    --limit '80' \
    --offset '38' \
    > test.out 2>&1
eval_tap $? 141 'RetrieveAllSSOLoginPlatformCredentialV3' test.out

#- 142 RetrieveThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'vSh8cPsu' \
    > test.out 2>&1
eval_tap $? 142 'RetrieveThirdPartyLoginPlatformCredentialV3' test.out

#- 143 AddThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam addThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'x2qXW2Hz' \
    --body '{"ACSURL": "LGwiVqvM", "AWSCognitoRegion": "SkgrUps8", "AWSCognitoUserPool": "cQ8044tn", "AllowedClients": ["ALifAMA8", "JGK7ybyl", "9A7ARLfm"], "AppId": "Xu3Npf68", "AuthorizationEndpoint": "0r3GEtTC", "ClientId": "fVMJDnue", "EmptyStrFieldList": ["M589ZpiS", "JylCF6Un", "NrCLvcfW"], "EnableServerLicenseValidation": false, "Environment": "P3EEsnVB", "FederationMetadataURL": "dl119Zsg", "GenericOauthFlow": true, "IncludePUID": true, "IsActive": true, "Issuer": "G1IpB4Ip", "JWKSEndpoint": "wvnWK8je", "KeyID": "NKlM0gxH", "LogoURL": "TmEesAUQ", "NetflixCertificates": {"encryptedPrivateKey": "fsPP9l94", "encryptedPrivateKeyName": "QHRqe0O7", "publicCertificate": "P2STtTUA", "publicCertificateName": "YIIjrWBd", "rootCertificate": "FIARviYg", "rootCertificateName": "pbHiI5Dq"}, "OrganizationId": "H2jBCtec", "PlatformName": "XdN8Ruyg", "RedirectUri": "AryHrzUj", "RegisteredDomains": [{"affectedClientIDs": ["XhGxSi19", "WKxbTHBB", "lIIQvZFk"], "domain": "HovfMRcj", "namespaces": ["n5Nz9Sy2", "0w02ANdL", "DaN1fwIG"], "roleId": "mTE7syYu", "ssoCfg": {"googleKey": {"118iOC4t": {}, "TyOvS9on": {}, "9PTKX0fB": {}}, "groupConfigs": [{"assignNamespaces": ["yfmsNOJI", "ZQpuFJ5a", "jcfVMxZb"], "group": "82qw9pkS", "roleId": "AbZ5WAtZ"}, {"assignNamespaces": ["57G0pJiU", "hR1VnyKn", "JTU8szyd"], "group": "toT8SuwC", "roleId": "KkJKzBId"}, {"assignNamespaces": ["l304Nrwm", "mIx4BdLr", "NRPnMayB"], "group": "zvkSZ67O", "roleId": "3fVOKz1Z"}]}}, {"affectedClientIDs": ["LQQcXvY7", "1r1xw3cQ", "t49Q6Mey"], "domain": "bnEmXKpB", "namespaces": ["tekpVC9L", "EVJrXZTl", "JSHs8IHO"], "roleId": "BqDGVI5V", "ssoCfg": {"googleKey": {"12zpLfAl": {}, "ekMeScmw": {}, "OeNZADnM": {}}, "groupConfigs": [{"assignNamespaces": ["WwcY6jxK", "muUqjzWc", "wPt2eftM"], "group": "4lLRRjMU", "roleId": "O31WESZU"}, {"assignNamespaces": ["NFJKd4sW", "IBXCmgJT", "pYKuvFXh"], "group": "vxFziglw", "roleId": "AAGrr9iP"}, {"assignNamespaces": ["ADUcIpnL", "kmHAR4DA", "Yu7dgxhC"], "group": "gWmI4rxF", "roleId": "geIA21nS"}]}}, {"affectedClientIDs": ["VYXM2mbP", "2QaUhhh1", "FLwyMA3q"], "domain": "WHiKi95N", "namespaces": ["3zV4Yy66", "v2E9rvHM", "PjVaNbI2"], "roleId": "70S7jyY7", "ssoCfg": {"googleKey": {"HuBu8Khk": {}, "ifyBL1sK": {}, "tr2IalYF": {}}, "groupConfigs": [{"assignNamespaces": ["DyxW7xAa", "vVGP1zOL", "WSoKdOFP"], "group": "RrL9x4Sd", "roleId": "IFTfra0J"}, {"assignNamespaces": ["YoZuBeiE", "zjYV2gA6", "OILM1JNS"], "group": "rAqSfBmV", "roleId": "rh7w2rdo"}, {"assignNamespaces": ["3pLrbBNW", "yZRmiJ0E", "w6tz99Sy"], "group": "lJ5gH5AD", "roleId": "cvQ2bdDp"}]}}], "Secret": "mFUJdNI9", "TeamID": "DvMzq0LA", "TokenAuthenticationType": "VE9cAdQc", "TokenClaimsMapping": {"PEomXZbc": "lEU7EWTt", "1V2fUlzt": "dI6KEpwP", "hvGIeqJ3": "INQ5AAzP"}, "TokenEndpoint": "ZrY1RV5G", "UserInfoEndpoint": "A8HKgMJg", "UserInfoHTTPMethod": "RJDjPi86", "googleAdminConsoleKey": "1ac4ZTut", "scopes": ["JnM324SH", "sQ0fwadR", "8VSk8wz1"]}' \
    > test.out 2>&1
eval_tap $? 143 'AddThirdPartyLoginPlatformCredentialV3' test.out

#- 144 DeleteThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'e1gyE0II' \
    > test.out 2>&1
eval_tap $? 144 'DeleteThirdPartyLoginPlatformCredentialV3' test.out

#- 145 UpdateThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'sLTGEs06' \
    --body '{"ACSURL": "xc94nxrr", "AWSCognitoRegion": "di5Ev5SA", "AWSCognitoUserPool": "YRVPp1rS", "AllowedClients": ["r2RUSuim", "9wF79No7", "80dabgVg"], "AppId": "8pzzahQb", "AuthorizationEndpoint": "vH1zaemY", "ClientId": "DzYPySnw", "EmptyStrFieldList": ["JcoPqR00", "Vc34orjX", "Gxs9JQAk"], "EnableServerLicenseValidation": true, "Environment": "qgVUoIl1", "FederationMetadataURL": "rmX3KbKz", "GenericOauthFlow": false, "IncludePUID": true, "IsActive": true, "Issuer": "rdJxMyj6", "JWKSEndpoint": "rOziamVX", "KeyID": "EuDsliwa", "LogoURL": "sGIZg0Z9", "NetflixCertificates": {"encryptedPrivateKey": "yuwNu5T5", "encryptedPrivateKeyName": "9ei9KC8c", "publicCertificate": "jki5qS2t", "publicCertificateName": "nXyPY1bD", "rootCertificate": "0Ssteu1p", "rootCertificateName": "qDAzcUpl"}, "OrganizationId": "DT2hp5J8", "PlatformName": "Lr8uQCLv", "RedirectUri": "zBGd3vHt", "RegisteredDomains": [{"affectedClientIDs": ["QcnuV4zH", "zmwa3ABs", "VA8z3dmG"], "domain": "sqD12sGv", "namespaces": ["6lzk9peI", "WKmkmFHb", "5kg1xIIp"], "roleId": "TpteMd96", "ssoCfg": {"googleKey": {"Pr5IlRYs": {}, "9j64nE1a": {}, "SFplP01C": {}}, "groupConfigs": [{"assignNamespaces": ["r95cgYz2", "WkFeX3jd", "fIxRHhdy"], "group": "tUaPoL8h", "roleId": "tGE3CbSh"}, {"assignNamespaces": ["gbiYVzxT", "0Yp1TrAK", "xCoqrgph"], "group": "6mE8eaP1", "roleId": "5BKK9Uwo"}, {"assignNamespaces": ["wkcyt62T", "lJKxbx2D", "gr5EgTEu"], "group": "57QjuMLY", "roleId": "ZE0XmhGe"}]}}, {"affectedClientIDs": ["Obk2RYT4", "bFHkaHz4", "nN5rIwPP"], "domain": "Sem4lfJQ", "namespaces": ["7L9caqN0", "AXLpEmm3", "XNnyD7NH"], "roleId": "xL0S23ad", "ssoCfg": {"googleKey": {"9CtpXkte": {}, "P025g0Ei": {}, "b985XGA7": {}}, "groupConfigs": [{"assignNamespaces": ["6pJ7raFw", "wbXtButb", "4WcChadm"], "group": "vMdZX2Ap", "roleId": "Mzow0ejL"}, {"assignNamespaces": ["VyRxKCni", "6veenaYd", "kvjnKJnT"], "group": "bjVOGxpv", "roleId": "GGvR5iGH"}, {"assignNamespaces": ["u0lDyr1v", "qEmlbvE5", "5JSKYEtn"], "group": "Y6UCWe8v", "roleId": "WR8aCIly"}]}}, {"affectedClientIDs": ["Z9lcFfYV", "9z3lLcDz", "7drk9Vdj"], "domain": "M9gUYm6s", "namespaces": ["owQsul0D", "DZzEejWs", "6biTxyXN"], "roleId": "2iD8Kcau", "ssoCfg": {"googleKey": {"aZEm1oeJ": {}, "2wyi4OWE": {}, "DifwlQCC": {}}, "groupConfigs": [{"assignNamespaces": ["OOnPk7tk", "aN3WjV5u", "OgJej6FW"], "group": "OsvIFjdj", "roleId": "aXCrztwU"}, {"assignNamespaces": ["NyTVgElb", "NlVkzw4V", "SONC5mjU"], "group": "DncYRlgg", "roleId": "VQ0GzeNV"}, {"assignNamespaces": ["UYwmEGrw", "iLdJmvME", "Aji4pzgj"], "group": "FTwU4g5Z", "roleId": "ndKdNu5C"}]}}], "Secret": "QQhUA3WG", "TeamID": "a1LP1Arl", "TokenAuthenticationType": "fwGXxF1I", "TokenClaimsMapping": {"itoVuXvH": "jIBALzFJ", "OfH8b5Ny": "qXgmUDYK", "6ZjwJ32k": "iKs2mA2h"}, "TokenEndpoint": "sPUb6u9M", "UserInfoEndpoint": "pEKtVfZC", "UserInfoHTTPMethod": "8SHrvR3P", "googleAdminConsoleKey": "rex82Za7", "scopes": ["BbxWIOlg", "MKOBPWT2", "OxmNGXjg"]}' \
    > test.out 2>&1
eval_tap $? 145 'UpdateThirdPartyLoginPlatformCredentialV3' test.out

#- 146 UpdateThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'XxlpfyJC' \
    --body '{"affectedClientIDs": ["uFXxseTL", "24Iclw3X", "dhCCcnln"], "assignedNamespaces": ["ECNlmKG7", "a5kxXjGi", "yjr7MTX0"], "domain": "fgmmEbOD", "roleId": "FYYgavKt", "ssoCfg": {"googleKey": {"JHH3lPD8": {}, "nbZzBSwU": {}, "h4Eucv0t": {}}, "groupConfigs": [{"assignNamespaces": ["ZPW3Truq", "ZBB6sQ9X", "8aMOwfk9"], "group": "yoNUpm9d", "roleId": "dyf4BoDF"}, {"assignNamespaces": ["gd7gLR5Q", "ReiuYFLo", "bFw4iTct"], "group": "tjhgIPGX", "roleId": "YuxM7ZCs"}, {"assignNamespaces": ["grHvUHSG", "PhbSeA9u", "OdNyap1b"], "group": "BIj5fhkl", "roleId": "BMk7iQX9"}]}}' \
    > test.out 2>&1
eval_tap $? 146 'UpdateThirdPartyLoginPlatformDomainV3' test.out

#- 147 DeleteThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '1LZ4lKu7' \
    --body '{"domain": "3SkF0ori", "ssoGroups": ["omBzStv1", "NqqmcKMT", "VnLiUOT3"]}' \
    > test.out 2>&1
eval_tap $? 147 'DeleteThirdPartyLoginPlatformDomainV3' test.out

#- 148 PartialUpdateThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam partialUpdateThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'L9iKB7Bt' \
    --body '{"affectedClientIDs": ["vn7FNyV4", "rhce27kn", "IEVnOSH9"], "assignedNamespaces": ["nJTc0bgM", "RF3EaNHb", "2BEojwsQ"], "domain": "alq4ntdN", "roleId": "9yE3xmpT", "ssoCfg": {"googleKey": {"I7pEeofM": {}, "mZ8XFQlK": {}, "slsNAn5D": {}}, "groupConfigs": [{"assignNamespaces": ["e7Z6usdY", "u6tsZIC9", "5c7bPy1N"], "group": "q7KX1j9P", "roleId": "B7DE00eT"}, {"assignNamespaces": ["gWWqAdm2", "c0mGtvr6", "hhFiJZGR"], "group": "H3oo29I4", "roleId": "g8gK1Fqj"}, {"assignNamespaces": ["fP6QXuOS", "aKkjM35I", "wohSpTgG"], "group": "OQhJ6W5F", "roleId": "WJw01GLl"}]}}' \
    > test.out 2>&1
eval_tap $? 148 'PartialUpdateThirdPartyLoginPlatformDomainV3' test.out

#- 149 RetrieveSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam retrieveSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId '88JG46Nn' \
    > test.out 2>&1
eval_tap $? 149 'RetrieveSSOLoginPlatformCredential' test.out

#- 150 AddSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam addSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId '6OyI80sv' \
    --body '{"acsUrl": "q1Po5wFi", "apiKey": "RkS3hGvC", "appId": "YWDISZOE", "federationMetadataUrl": "3KmCvR3G", "isActive": false, "redirectUri": "uN0SRF7v", "secret": "awKKYdmY", "ssoUrl": "S6y2svNp"}' \
    > test.out 2>&1
eval_tap $? 150 'AddSSOLoginPlatformCredential' test.out

#- 151 DeleteSSOLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteSSOLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '8cZGvU0C' \
    > test.out 2>&1
eval_tap $? 151 'DeleteSSOLoginPlatformCredentialV3' test.out

#- 152 UpdateSSOPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam updateSSOPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'DvB897l8' \
    --body '{"acsUrl": "Foka0C6x", "apiKey": "qmwWVaXl", "appId": "78vE9YIr", "federationMetadataUrl": "FGg5JyFb", "isActive": true, "redirectUri": "g7E2Ux7U", "secret": "WnzJFFHI", "ssoUrl": "GaVnzNwt"}' \
    > test.out 2>&1
eval_tap $? 152 'UpdateSSOPlatformCredential' test.out

#- 153 AdminListUserIDByPlatformUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByPlatformUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'GLsbnIFk' \
    --rawPID  \
    --rawPUID  \
    --body '{"platformUserIds": ["sTYGrVAp", "pJp2Gdum", "a4EOp8N4"]}' \
    > test.out 2>&1
eval_tap $? 153 'AdminListUserIDByPlatformUserIDsV3' test.out

#- 154 AdminGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '86gitpaS' \
    --platformUserId 'JjnYRZH1' \
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
    --field 'country' \
    --body '{"config": {"minimumAllowedInterval": 32}, "type": "Y5fQP3lZ"}' \
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
    --body '{"additions": [{"actions": [51, 6, 43], "resource": "L4OQagra"}, {"actions": [24, 64, 71], "resource": "1MJomyoO"}, {"actions": [16, 96, 80], "resource": "4KRg7Bs8"}], "exclusions": [{"actions": [27, 16, 9], "resource": "oRWAVt5y"}, {"actions": [71, 42, 52], "resource": "KN9ifrHR"}, {"actions": [70, 67, 16], "resource": "z92DmUmn"}], "overrides": [{"actions": [68, 17, 15], "resource": "adfR8Skw"}, {"actions": [53, 45, 26], "resource": "p6JzdrgZ"}, {"actions": [83, 20, 7], "resource": "4zEkk39N"}], "replacements": [{"replacement": {"actions": [46, 75, 83], "resource": "Wvw9eeJH"}, "target": "3GKS1FQH"}, {"replacement": {"actions": [99, 11, 52], "resource": "j1fO9UjI"}, "target": "9WhheXZo"}, {"replacement": {"actions": [38, 65, 95], "resource": "btll4ZV8"}, "target": "fvHurkf8"}]}' \
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
    --body '{"active": false}' \
    > test.out 2>&1
eval_tap $? 160 'AdminChangeRoleOverrideConfigStatusV3' test.out

#- 161 AdminGetRoleNamespacePermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleNamespacePermissionV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'KyNnP51R' \
    > test.out 2>&1
eval_tap $? 161 'AdminGetRoleNamespacePermissionV3' test.out

#- 162 GetAdminUsersByRoleIdV3
./ng net.accelbyte.sdk.cli.Main iam getAdminUsersByRoleIdV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'IxRFRxx8' \
    --after '28' \
    --before '7' \
    --limit '76' \
    > test.out 2>&1
eval_tap $? 162 'GetAdminUsersByRoleIdV3' test.out

#- 163 AdminQueryTagV3
./ng net.accelbyte.sdk.cli.Main iam adminQueryTagV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '22' \
    --offset '63' \
    --tagName '3guGHxcw' \
    > test.out 2>&1
eval_tap $? 163 'AdminQueryTagV3' test.out

#- 164 AdminCreateTagV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateTagV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"tagName": "js49UAuS"}' \
    > test.out 2>&1
eval_tap $? 164 'AdminCreateTagV3' test.out

#- 165 AdminUpdateTagV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateTagV3 \
    --namespace "$AB_NAMESPACE" \
    --tagId 's9Qm6VyV' \
    --body '{"tagName": "VLY8oRv0"}' \
    > test.out 2>&1
eval_tap $? 165 'AdminUpdateTagV3' test.out

#- 166 AdminDeleteTagV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteTagV3 \
    --namespace "$AB_NAMESPACE" \
    --tagId 'oEQw867J' \
    > test.out 2>&1
eval_tap $? 166 'AdminDeleteTagV3' test.out

#- 167 AdminGetUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --emailAddress 'a2OcV7Zt' \
    > test.out 2>&1
eval_tap $? 167 'AdminGetUserByEmailAddressV3' test.out

#- 168 AdminBulkUpdateUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"updateRequest": {"skipLoginQueue": false}, "userIds": ["3VAXn3kX", "ip8ePmO9", "xifQ1QQf"]}' \
    > test.out 2>&1
eval_tap $? 168 'AdminBulkUpdateUsersV3' test.out

#- 169 AdminGetBulkUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType 'ai9dLWww' \
    --body '{"bulkUserId": ["fevH7hHO", "Nr2dfcF5", "lS7OVQQQ"]}' \
    > test.out 2>&1
eval_tap $? 169 'AdminGetBulkUserBanV3' test.out

#- 170 AdminListUserIDByUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["y2Nn8fKg", "bSsVKQ0j", "IcEYhIAZ"]}' \
    > test.out 2>&1
eval_tap $? 170 'AdminListUserIDByUserIDsV3' test.out

#- 171 AdminBulkGetUsersPlatform
./ng net.accelbyte.sdk.cli.Main iam adminBulkGetUsersPlatform \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["ZshszbdG", "LxgfnG71", "txbOYemx"]}' \
    > test.out 2>&1
eval_tap $? 171 'AdminBulkGetUsersPlatform' test.out

#- 172 AdminInviteUserV3
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddresses": ["BvaSSmLj", "KpAx3306", "rRZjePMO"], "isAdmin": false, "languageTag": "rAbK3lj7", "namespace": "bJISsuIs", "roles": ["zhyMOlNr", "AGOxwl8w", "VFhc7YM1"]}' \
    > test.out 2>&1
eval_tap $? 172 'AdminInviteUserV3' test.out

#- 173 AdminQueryThirdPlatformLinkHistoryV3
./ng net.accelbyte.sdk.cli.Main iam adminQueryThirdPlatformLinkHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '48' \
    --offset '6' \
    --platformUserId 'g8l1OtP0' \
    --platformId 'uI1tbXsF' \
    > test.out 2>&1
eval_tap $? 173 'AdminQueryThirdPlatformLinkHistoryV3' test.out

#- 174 AdminListUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminListUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '62' \
    --offset '100' \
    > test.out 2>&1
eval_tap $? 174 'AdminListUsersV3' test.out

#- 175 AdminSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam adminSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'p8JdBE73' \
    --endDate 'xa0AD98q' \
    --includeTotal  \
    --limit '49' \
    --offset '57' \
    --platformBy 'XmmLOdY1' \
    --platformId '2hrcweGJ' \
    --query 'H8GYZ9HI' \
    --roleIds 'inKAuda3' \
    --skipLoginQueue  \
    --startDate 'bUFWWXDW' \
    --testAccount  \
    > test.out 2>&1
eval_tap $? 175 'AdminSearchUserV3' test.out

#- 176 AdminGetBulkUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"listEmailAddressRequest": ["SQvthqmS", "5q8ckFJZ", "Y4NqyFVv"]}' \
    > test.out 2>&1
eval_tap $? 176 'AdminGetBulkUserByEmailAddressV3' test.out

#- 177 AdminGetUserByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'DfniCjpV' \
    > test.out 2>&1
eval_tap $? 177 'AdminGetUserByUserIdV3' test.out

#- 178 AdminUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Vwop73js' \
    --body '{"avatarUrl": "iBAnkfv5", "country": "Qs1uGFPb", "dateOfBirth": "bmr0rqEF", "displayName": "gi1d1Vgk", "languageTag": "nx8MFVK1", "skipLoginQueue": true, "tags": ["TPBIsbQx", "3cBLAbaT", "8iKOpuxm"], "uniqueDisplayName": "Z6fvgHDp", "userName": "Unk1L6to"}' \
    > test.out 2>&1
eval_tap $? 178 'AdminUpdateUserV3' test.out

#- 179 AdminGetUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'xcerJDpB' \
    --activeOnly  \
    --after 'cEsvPpse' \
    --before 'hYeBaP72' \
    --limit '89' \
    > test.out 2>&1
eval_tap $? 179 'AdminGetUserBanV3' test.out

#- 180 AdminBanUserV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'DDOEnXUB' \
    --body '{"ban": "ieELTgnF", "comment": "3JuXQ7B1", "endDate": "w6prGF8f", "reason": "ivcbXalM", "skipNotif": false}' \
    > test.out 2>&1
eval_tap $? 180 'AdminBanUserV3' test.out

#- 181 AdminGetUserBanSummaryV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanSummaryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'KywEUrde' \
    > test.out 2>&1
eval_tap $? 181 'AdminGetUserBanSummaryV3' test.out

#- 182 AdminUpdateUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserBanV3 \
    --banId 'dzjmmUpr' \
    --namespace "$AB_NAMESPACE" \
    --userId 'HAWVZf11' \
    --body '{"enabled": false, "skipNotif": false}' \
    > test.out 2>&1
eval_tap $? 182 'AdminUpdateUserBanV3' test.out

#- 183 AdminSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '0DVISG6O' \
    --body '{"context": "lAjxtSbQ", "emailAddress": "YSU6j5hC", "languageTag": "gmt915BQ", "upgradeToken": "vWCZtPaA"}' \
    > test.out 2>&1
eval_tap $? 183 'AdminSendVerificationCodeV3' test.out

#- 184 AdminVerifyAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'o3vWCOJY' \
    --body '{"Code": "uAykjZj6", "ContactType": "JXXN5Nnb", "LanguageTag": "Myz01OFK", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 184 'AdminVerifyAccountV3' test.out

#- 185 GetUserVerificationCode
./ng net.accelbyte.sdk.cli.Main iam getUserVerificationCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'SbZe7h1B' \
    > test.out 2>&1
eval_tap $? 185 'GetUserVerificationCode' test.out

#- 186 AdminGetUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'SQbQ7Rfh' \
    > test.out 2>&1
eval_tap $? 186 'AdminGetUserDeletionStatusV3' test.out

#- 187 AdminUpdateUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '4ZYfXKNO' \
    --body '{"deletionDate": 33, "enabled": true}' \
    > test.out 2>&1
eval_tap $? 187 'AdminUpdateUserDeletionStatusV3' test.out

#- 188 AdminListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '9vLGCQ3P' \
    > test.out 2>&1
eval_tap $? 188 'AdminListUserAllPlatformAccountsDistinctV3' test.out

#- 189 AdminUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '2NdM2PQ8' \
    --body '{"code": "0dAGYRRv", "country": "Uq5XCsHV", "dateOfBirth": "qCnMAMTt", "displayName": "RemaMBxA", "emailAddress": "b8E3vVuK", "password": "VUiZHR10", "uniqueDisplayName": "RkKN3hiU", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 189 'AdminUpgradeHeadlessAccountV3' test.out

#- 190 AdminDeleteUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'zgLTQg4b' \
    > test.out 2>&1
eval_tap $? 190 'AdminDeleteUserInformationV3' test.out

#- 191 AdminGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '6ena2HIA' \
    --after '0.49449917059347137' \
    --before '0.4803134397249629' \
    --limit '89' \
    > test.out 2>&1
eval_tap $? 191 'AdminGetUserLoginHistoriesV3' test.out

#- 192 AdminResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam adminResetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '65Ph8rgc' \
    --body '{"languageTag": "T6J3yVRV", "mfaToken": "9Xp2CMEP", "newPassword": "aAA82JS6", "oldPassword": "Lbh6osZV"}' \
    > test.out 2>&1
eval_tap $? 192 'AdminResetPasswordV3' test.out

#- 193 AdminUpdateUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserPermissionV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'EaipxKvM' \
    --body '{"Permissions": [{"Action": 20, "Resource": "o7dOiOx8", "SchedAction": 53, "SchedCron": "86NT5B85", "SchedRange": ["FwI5WUsX", "33hnOmTK", "nNhuf9xo"]}, {"Action": 57, "Resource": "CPywcZTI", "SchedAction": 100, "SchedCron": "naM1RNWC", "SchedRange": ["A6LGLPDU", "yOv9DW93", "Rr338BAG"]}, {"Action": 90, "Resource": "vtLaqGtW", "SchedAction": 31, "SchedCron": "Z2ZMysn9", "SchedRange": ["ozOrIXx7", "IyFff55P", "7TnVi3aO"]}]}' \
    > test.out 2>&1
eval_tap $? 193 'AdminUpdateUserPermissionV3' test.out

#- 194 AdminAddUserPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserPermissionsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'q71KmtvF' \
    --body '{"Permissions": [{"Action": 9, "Resource": "gIupTCBX", "SchedAction": 81, "SchedCron": "ppjm5hyy", "SchedRange": ["A4gCZev4", "gE6QASTn", "SmW81sGP"]}, {"Action": 96, "Resource": "vpPtzDAt", "SchedAction": 19, "SchedCron": "jt284i2h", "SchedRange": ["ynvA2RDY", "9Kcu6qfP", "0ElTJqT2"]}, {"Action": 28, "Resource": "YKLkIzXu", "SchedAction": 12, "SchedCron": "LB07GrMu", "SchedRange": ["E5wVA9kV", "kHbBvEly", "TE7iR4S4"]}]}' \
    > test.out 2>&1
eval_tap $? 194 'AdminAddUserPermissionsV3' test.out

#- 195 AdminDeleteUserPermissionBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'BGnPuHfG' \
    --body '[{"Action": 73, "Resource": "i9BU1S1m"}, {"Action": 75, "Resource": "YxxAfobp"}, {"Action": 55, "Resource": "cWFMu8zy"}]' \
    > test.out 2>&1
eval_tap $? 195 'AdminDeleteUserPermissionBulkV3' test.out

#- 196 AdminDeleteUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionV3 \
    --action '18' \
    --namespace "$AB_NAMESPACE" \
    --resource 'S6KzNBuB' \
    --userId 'nEFhSQB0' \
    > test.out 2>&1
eval_tap $? 196 'AdminDeleteUserPermissionV3' test.out

#- 197 AdminGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'JgY4IhBY' \
    --after 'fjJnG7nw' \
    --before 'N1P9nJA9' \
    --limit '62' \
    --platformId 'XNHpwWwJ' \
    --targetNamespace 'KuYF6xwV' \
    > test.out 2>&1
eval_tap $? 197 'AdminGetUserPlatformAccountsV3' test.out

#- 198 AdminListAllDistinctPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminListAllDistinctPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'yqW16cBr' \
    --status 'RFWIGSx4' \
    > test.out 2>&1
eval_tap $? 198 'AdminListAllDistinctPlatformAccountsV3' test.out

#- 199 AdminGetListJusticePlatformAccounts
./ng net.accelbyte.sdk.cli.Main iam adminGetListJusticePlatformAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'G5NwjNFI' \
    > test.out 2>&1
eval_tap $? 199 'AdminGetListJusticePlatformAccounts' test.out

#- 200 AdminGetUserMapping
./ng net.accelbyte.sdk.cli.Main iam adminGetUserMapping \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'OGQ80fry' \
    --userId 'nyLbK0lu' \
    > test.out 2>&1
eval_tap $? 200 'AdminGetUserMapping' test.out

#- 201 AdminCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam adminCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'mV0OuZkz' \
    --userId 'J3BIkAIv' \
    > test.out 2>&1
eval_tap $? 201 'AdminCreateJusticeUser' test.out

#- 202 AdminLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'fPpeaz2Y' \
    --skipConflict  \
    --body '{"platformId": "wW68pJas", "platformUserId": "T6VYA8bJ"}' \
    > test.out 2>&1
eval_tap $? 202 'AdminLinkPlatformAccount' test.out

#- 203 AdminGetUserLinkHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLinkHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'e05wuzY3' \
    --platformId 'bP7uhVU7' \
    > test.out 2>&1
eval_tap $? 203 'AdminGetUserLinkHistoriesV3' test.out

#- 204 AdminPlatformUnlinkV3
eval_tap 0 204 'AdminPlatformUnlinkV3 # SKIP deprecated' test.out

#- 205 AdminPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'B222Fx8Z' \
    --userId 'LE0pNfby' \
    > test.out 2>&1
eval_tap $? 205 'AdminPlatformUnlinkAllV3' test.out

#- 206 AdminPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'REBb0YPV' \
    --userId 'Uea1AL9K' \
    --ticket 'ENLp0aMw' \
    > test.out 2>&1
eval_tap $? 206 'AdminPlatformLinkV3' test.out

#- 207 AdminDeleteUserLinkingHistoryByPlatformIDV3
eval_tap 0 207 'AdminDeleteUserLinkingHistoryByPlatformIDV3 # SKIP deprecated' test.out

#- 208 AdminDeleteUserLinkingRestrictionByPlatformIDV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserLinkingRestrictionByPlatformIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'XNn7xp0c' \
    --userId '8VTlZyZc' \
    > test.out 2>&1
eval_tap $? 208 'AdminDeleteUserLinkingRestrictionByPlatformIDV3' test.out

#- 209 AdminGetThirdPartyPlatformTokenLinkStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetThirdPartyPlatformTokenLinkStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'fhxSmIhd' \
    --userId 'WvLQ5lFf' \
    --platformToken 'dQuyiIYV' \
    > test.out 2>&1
eval_tap $? 209 'AdminGetThirdPartyPlatformTokenLinkStatusV3' test.out

#- 210 AdminGetUserSinglePlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminGetUserSinglePlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --platformId 'b0ZRqLqx' \
    --userId 'lzM7TyVt' \
    --crossNamespace  \
    > test.out 2>&1
eval_tap $? 210 'AdminGetUserSinglePlatformAccount' test.out

#- 211 AdminDeleteUserRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRolesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Kc9HnktT' \
    --body '["D85YIg3y", "nqosRIUO", "01q6kpDN"]' \
    > test.out 2>&1
eval_tap $? 211 'AdminDeleteUserRolesV3' test.out

#- 212 AdminSaveUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminSaveUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'eiOEpElO' \
    --body '[{"namespace": "x0kR2k6O", "roleId": "kOgKeaZw"}, {"namespace": "3mOa5i9u", "roleId": "HKaFI24B"}, {"namespace": "4I5KMFPL", "roleId": "Ukc50GuR"}]' \
    > test.out 2>&1
eval_tap $? 212 'AdminSaveUserRoleV3' test.out

#- 213 AdminAddUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'ChtVaT1f' \
    --userId 'inOTQBb9' \
    > test.out 2>&1
eval_tap $? 213 'AdminAddUserRoleV3' test.out

#- 214 AdminDeleteUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'q5oHihLk' \
    --userId 'x3Vkzavg' \
    > test.out 2>&1
eval_tap $? 214 'AdminDeleteUserRoleV3' test.out

#- 215 AdminGetUserStateByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserStateByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'jvWEJCdN' \
    > test.out 2>&1
eval_tap $? 215 'AdminGetUserStateByUserIdV3' test.out

#- 216 AdminUpdateUserStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'w97pkL6y' \
    --body '{"enabled": true, "reason": "bRBjd7CM"}' \
    > test.out 2>&1
eval_tap $? 216 'AdminUpdateUserStatusV3' test.out

#- 217 AdminTrustlyUpdateUserIdentity
./ng net.accelbyte.sdk.cli.Main iam adminTrustlyUpdateUserIdentity \
    --namespace "$AB_NAMESPACE" \
    --userId '5NqRkBth' \
    --body '{"emailAddress": "BKj9wwze", "password": "ThewBxX9"}' \
    > test.out 2>&1
eval_tap $? 217 'AdminTrustlyUpdateUserIdentity' test.out

#- 218 AdminVerifyUserWithoutVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyUserWithoutVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'cB60cVMc' \
    > test.out 2>&1
eval_tap $? 218 'AdminVerifyUserWithoutVerificationCodeV3' test.out

#- 219 AdminUpdateClientSecretV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientSecretV3 \
    --clientId 'YCDh8I06' \
    --namespace "$AB_NAMESPACE" \
    --body '{"newSecret": "PDkA9Qxt"}' \
    > test.out 2>&1
eval_tap $? 219 'AdminUpdateClientSecretV3' test.out

#- 220 AdminCheckThirdPartyLoginPlatformAvailabilityV3
./ng net.accelbyte.sdk.cli.Main iam adminCheckThirdPartyLoginPlatformAvailabilityV3 \
    --platformId 'P21haGff' \
    > test.out 2>&1
eval_tap $? 220 'AdminCheckThirdPartyLoginPlatformAvailabilityV3' test.out

#- 221 AdminGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV3 \
    --after 'blrd4ghi' \
    --before 'j20dWPPr' \
    --isWildcard  \
    --limit '40' \
    > test.out 2>&1
eval_tap $? 221 'AdminGetRolesV3' test.out

#- 222 AdminCreateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV3 \
    --body '{"adminRole": true, "deletable": false, "isWildcard": true, "managers": [{"displayName": "A46ZxMNM", "namespace": "glkkiXql", "userId": "zgnkKyqQ"}, {"displayName": "9J3fhWK9", "namespace": "lL2jghPk", "userId": "2kQSGcIQ"}, {"displayName": "S8p7Eoop", "namespace": "Ss36B2td", "userId": "9QLekMGP"}], "members": [{"displayName": "04bDMvGt", "namespace": "GA06U5ai", "userId": "TdqbYh5g"}, {"displayName": "uo4xkLSB", "namespace": "27Eix4jy", "userId": "iIxlCbTY"}, {"displayName": "vRrxcQEX", "namespace": "iMtxOjvG", "userId": "UvvcO0x2"}], "permissions": [{"action": 61, "resource": "a6Xa04ug", "schedAction": 8, "schedCron": "a5JZVwde", "schedRange": ["Njzd4C2i", "qb6Q46BT", "MeJx0Bz0"]}, {"action": 53, "resource": "rVcwirgx", "schedAction": 57, "schedCron": "TuejiLzS", "schedRange": ["JYkeiE1M", "QbG1RYQu", "wSJzcyXs"]}, {"action": 35, "resource": "AAn4Iy53", "schedAction": 71, "schedCron": "D1BlZzhk", "schedRange": ["oOkRwgxd", "BXP4s1Yt", "2hyeIwXl"]}], "roleName": "Gqwqdluu"}' \
    > test.out 2>&1
eval_tap $? 222 'AdminCreateRoleV3' test.out

#- 223 AdminGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV3 \
    --roleId 'lxLlp1YJ' \
    > test.out 2>&1
eval_tap $? 223 'AdminGetRoleV3' test.out

#- 224 AdminDeleteRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV3 \
    --roleId 'kGHMEzpc' \
    > test.out 2>&1
eval_tap $? 224 'AdminDeleteRoleV3' test.out

#- 225 AdminUpdateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV3 \
    --roleId 'UvJrDBPQ' \
    --body '{"deletable": false, "isWildcard": false, "roleName": "R2nW4keu"}' \
    > test.out 2>&1
eval_tap $? 225 'AdminUpdateRoleV3' test.out

#- 226 AdminGetRoleAdminStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleAdminStatusV3 \
    --roleId '0TYcq0aP' \
    > test.out 2>&1
eval_tap $? 226 'AdminGetRoleAdminStatusV3' test.out

#- 227 AdminUpdateAdminRoleStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateAdminRoleStatusV3 \
    --roleId 'QuLrDpOk' \
    > test.out 2>&1
eval_tap $? 227 'AdminUpdateAdminRoleStatusV3' test.out

#- 228 AdminRemoveRoleAdminV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleAdminV3 \
    --roleId 'edykbGcD' \
    > test.out 2>&1
eval_tap $? 228 'AdminRemoveRoleAdminV3' test.out

#- 229 AdminGetRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleManagersV3 \
    --roleId 'LJZ71InP' \
    --after '5BbEUxud' \
    --before 'YrEQhx0E' \
    --limit '14' \
    > test.out 2>&1
eval_tap $? 229 'AdminGetRoleManagersV3' test.out

#- 230 AdminAddRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleManagersV3 \
    --roleId 'zKdtUdtM' \
    --body '{"managers": [{"displayName": "An660CZO", "namespace": "mD4v0LN9", "userId": "h9yQF3fp"}, {"displayName": "BWQox3iT", "namespace": "e1oDmIOA", "userId": "OR6xrf1q"}, {"displayName": "DJoVVyJR", "namespace": "Cr8eNAcF", "userId": "BXiZY1xI"}]}' \
    > test.out 2>&1
eval_tap $? 230 'AdminAddRoleManagersV3' test.out

#- 231 AdminRemoveRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleManagersV3 \
    --roleId 'tjgGTMX4' \
    --body '{"managers": [{"displayName": "Eth7LQGI", "namespace": "M3W29AyG", "userId": "0TjhiBbG"}, {"displayName": "waXwC9XG", "namespace": "JvUAyRDm", "userId": "dfX83KX2"}, {"displayName": "1FOrWj4j", "namespace": "25bB3RFN", "userId": "VOK7ywO7"}]}' \
    > test.out 2>&1
eval_tap $? 231 'AdminRemoveRoleManagersV3' test.out

#- 232 AdminGetRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleMembersV3 \
    --roleId 'mXhH1PIO' \
    --after 'k1corxqz' \
    --before 'ydijFpWe' \
    --limit '56' \
    > test.out 2>&1
eval_tap $? 232 'AdminGetRoleMembersV3' test.out

#- 233 AdminAddRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleMembersV3 \
    --roleId 'YLM4r4dR' \
    --body '{"members": [{"displayName": "wdhLof9D", "namespace": "Vqakr9iE", "userId": "aVKYDzjz"}, {"displayName": "8NXCLRnX", "namespace": "82qiVw8F", "userId": "bCRKZ1NH"}, {"displayName": "EQwKuqSa", "namespace": "o44PVtHp", "userId": "AznmU1tY"}]}' \
    > test.out 2>&1
eval_tap $? 233 'AdminAddRoleMembersV3' test.out

#- 234 AdminRemoveRoleMembersV3
eval_tap 0 234 'AdminRemoveRoleMembersV3 # SKIP deprecated' test.out

#- 235 AdminUpdateRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV3 \
    --roleId '0dzcA7dy' \
    --body '{"permissions": [{"action": 14, "resource": "7Htqk7tg", "schedAction": 67, "schedCron": "ItYwFah4", "schedRange": ["9ebbB06D", "cfqmeYbv", "geGzw5Ac"]}, {"action": 59, "resource": "5bARufiS", "schedAction": 84, "schedCron": "uLjXKl4c", "schedRange": ["PGuzR924", "Hz3lJ7W7", "MCPGWyov"]}, {"action": 1, "resource": "sCFSHlzx", "schedAction": 23, "schedCron": "UAG7rFYO", "schedRange": ["I3YyhQuv", "1WiZa18J", "SLoFIfEg"]}]}' \
    > test.out 2>&1
eval_tap $? 235 'AdminUpdateRolePermissionsV3' test.out

#- 236 AdminAddRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV3 \
    --roleId '7bPij39Z' \
    --body '{"permissions": [{"action": 33, "resource": "wS3whLue", "schedAction": 43, "schedCron": "ihWLIwwz", "schedRange": ["2qf2QEJg", "XppcpZOg", "Yc09yllm"]}, {"action": 20, "resource": "C5oLommw", "schedAction": 8, "schedCron": "nFFP3Dk1", "schedRange": ["lgoiCAFD", "coh2GCxw", "T52sySdz"]}, {"action": 33, "resource": "Yj1hLjeW", "schedAction": 14, "schedCron": "1zeMGirQ", "schedRange": ["k1yMPYeR", "zQTstKfM", "ZrcPkpfr"]}]}' \
    > test.out 2>&1
eval_tap $? 236 'AdminAddRolePermissionsV3' test.out

#- 237 AdminDeleteRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV3 \
    --roleId 'uwi29Le8' \
    --body '["1zDek02l", "O26wJG0s", "NW5Ei57k"]' \
    > test.out 2>&1
eval_tap $? 237 'AdminDeleteRolePermissionsV3' test.out

#- 238 AdminDeleteRolePermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionV3 \
    --action '78' \
    --resource 'AtlgUorQ' \
    --roleId 'Uc8qyw2Z' \
    > test.out 2>&1
eval_tap $? 238 'AdminDeleteRolePermissionV3' test.out

#- 239 AdminGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam adminGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 239 'AdminGetMyUserV3' test.out

#- 240 UserAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam userAuthenticationV3 \
    --clientId 'IanW4H2o' \
    --extendExp  \
    --redirectUri 'oy6oc6DV' \
    --password 'zeiP3ApL' \
    --requestId '6A21ab3h' \
    --userName '0v6OxzQP' \
    > test.out 2>&1
eval_tap $? 240 'UserAuthenticationV3' test.out

#- 241 AuthenticationWithPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV3 \
    --extendExp  \
    --clientId 'u4AyMJtd' \
    --linkingToken 'kjBstTfL' \
    --password 'YR9PWrVH' \
    --username 'z0Qj5IVp' \
    > test.out 2>&1
eval_tap $? 241 'AuthenticationWithPlatformLinkV3' test.out

#- 242 AuthenticateAndLinkForwardV3
./ng net.accelbyte.sdk.cli.Main iam authenticateAndLinkForwardV3 \
    --extendExp  \
    --clientId 'tVv8xeTB' \
    --linkingToken 'Yrfm9Vc9' \
    --password 'zDrRuRYD' \
    --username 'rejhBQoO' \
    > test.out 2>&1
eval_tap $? 242 'AuthenticateAndLinkForwardV3' test.out

#- 243 GenerateTokenByNewHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV3 \
    --additionalData 'NfErAg9M' \
    --extendExp  \
    --linkingToken 'QHANiADj' \
    > test.out 2>&1
eval_tap $? 243 'GenerateTokenByNewHeadlessAccountV3' test.out

#- 244 RequestOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam requestOneTimeLinkingCodeV3 \
    --redirectUri 'tbfvjjWP' \
    --state 'mcA6JWY6' \
    --platformId 'OgwYtmHI' \
    > test.out 2>&1
eval_tap $? 244 'RequestOneTimeLinkingCodeV3' test.out

#- 245 ValidateOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam validateOneTimeLinkingCodeV3 \
    --oneTimeLinkCode 'pa9k30aK' \
    > test.out 2>&1
eval_tap $? 245 'ValidateOneTimeLinkingCodeV3' test.out

#- 246 RequestTokenByOneTimeLinkCodeResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTokenByOneTimeLinkCodeResponseV3 \
    --additionalData 'Pr8iYLmE' \
    --isTransient  \
    --clientId 'myPu0bcD' \
    --oneTimeLinkCode 'yMCIHfIR' \
    > test.out 2>&1
eval_tap $? 246 'RequestTokenByOneTimeLinkCodeResponseV3' test.out

#- 247 GetCountryLocationV3
./ng net.accelbyte.sdk.cli.Main iam getCountryLocationV3 \
    > test.out 2>&1
eval_tap $? 247 'GetCountryLocationV3' test.out

#- 248 Logout
./ng net.accelbyte.sdk.cli.Main iam logout \
    > test.out 2>&1
eval_tap $? 248 'Logout' test.out

#- 249 RequestTokenExchangeCodeV3
./ng net.accelbyte.sdk.cli.Main iam requestTokenExchangeCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --codeChallenge '818D3icK' \
    --codeChallengeMethod 'plain' \
    --clientId 'CqBy3psH' \
    > test.out 2>&1
eval_tap $? 249 'RequestTokenExchangeCodeV3' test.out

#- 250 AdminRetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam adminRetrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'fTOcA3dW' \
    --userId 'QS99IPH4' \
    --platformUserId 'CIFV0xPu' \
    > test.out 2>&1
eval_tap $? 250 'AdminRetrieveUserThirdPartyPlatformTokenV3' test.out

#- 251 RevokeUserV3
./ng net.accelbyte.sdk.cli.Main iam revokeUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'dfEC1OGA' \
    --includeGameNamespace  \
    > test.out 2>&1
eval_tap $? 251 'RevokeUserV3' test.out

#- 252 AuthorizeV3
./ng net.accelbyte.sdk.cli.Main iam authorizeV3 \
    --blockedPlatformId 'fun9dEJz' \
    --codeChallenge 'OZqYHXEP' \
    --codeChallengeMethod 'S256' \
    --createHeadless  \
    --loginWebBased  \
    --nonce 'RLIVp5h3' \
    --oneTimeLinkCode 'a9suW3hL' \
    --redirectUri 'apO8wbRt' \
    --scope 'R67g3qz4' \
    --state 'qM5N02hq' \
    --targetAuthPage '4BsjTNgy' \
    --useRedirectUriAsLoginUrlWhenLocked  \
    --clientId 'fKQel8Vn' \
    --responseType 'code' \
    > test.out 2>&1
eval_tap $? 252 'AuthorizeV3' test.out

#- 253 TokenIntrospectionV3
./ng net.accelbyte.sdk.cli.Main iam tokenIntrospectionV3 \
    --token 'pkyhKHB8' \
    > test.out 2>&1
eval_tap $? 253 'TokenIntrospectionV3' test.out

#- 254 GetJWKSV3
./ng net.accelbyte.sdk.cli.Main iam getJWKSV3 \
    > test.out 2>&1
eval_tap $? 254 'GetJWKSV3' test.out

#- 255 SendMFAAuthenticationCode
./ng net.accelbyte.sdk.cli.Main iam sendMFAAuthenticationCode \
    --clientId 'DgMvBV6q' \
    --factor 'ikh5GvzZ' \
    --mfaToken 'bKY225mg' \
    > test.out 2>&1
eval_tap $? 255 'SendMFAAuthenticationCode' test.out

#- 256 Change2faMethod
./ng net.accelbyte.sdk.cli.Main iam change2faMethod \
    --factor 'Q7f07o2m' \
    --mfaToken '6gZLSTFK' \
    > test.out 2>&1
eval_tap $? 256 'Change2faMethod' test.out

#- 257 Verify2faCode
./ng net.accelbyte.sdk.cli.Main iam verify2faCode \
    --code 'lkTROv1n' \
    --factor 'Ow6lZRjg' \
    --mfaToken 'W1XzsXD5' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 257 'Verify2faCode' test.out

#- 258 Verify2faCodeForward
./ng net.accelbyte.sdk.cli.Main iam verify2faCodeForward \
    --defaultFactor 'kuCekRyJ' \
    --factors 'yp1lU1Az' \
    --rememberDevice  \
    --clientId 'Fvi7ep0U' \
    --code 'ocmojJre' \
    --factor 'IBr5BLN0' \
    --mfaToken '7WplkS92' \
    > test.out 2>&1
eval_tap $? 258 'Verify2faCodeForward' test.out

#- 259 RetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam retrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'KgrTWC6R' \
    --userId 'jbGzmz9X' \
    > test.out 2>&1
eval_tap $? 259 'RetrieveUserThirdPartyPlatformTokenV3' test.out

#- 260 AuthCodeRequestV3
./ng net.accelbyte.sdk.cli.Main iam authCodeRequestV3 \
    --platformId 'PzB8BxOf' \
    --clientId 'Kaw1ajQ8' \
    --redirectUri 'RRini36D' \
    --requestId 'u4uW0mSX' \
    > test.out 2>&1
eval_tap $? 260 'AuthCodeRequestV3' test.out

#- 261 PlatformTokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV3 \
    --platformId 'BnDyumra' \
    --additionalData 'jQOeUV9v' \
    --clientId 'CfNYfn67' \
    --createHeadless  \
    --deviceId 'pwdwFUAT' \
    --macAddress 'v2yycbDq' \
    --platformToken 'ldA2Klrl' \
    --serviceLabel '0.02846010151316347' \
    --skipSetCookie  \
    > test.out 2>&1
eval_tap $? 261 'PlatformTokenGrantV3' test.out

#- 262 GetRevocationListV3
./ng net.accelbyte.sdk.cli.Main iam getRevocationListV3 \
    > test.out 2>&1
eval_tap $? 262 'GetRevocationListV3' test.out

#- 263 TokenRevocationV3
./ng net.accelbyte.sdk.cli.Main iam tokenRevocationV3 \
    --token 'ByTf5tWD' \
    > test.out 2>&1
eval_tap $? 263 'TokenRevocationV3' test.out

#- 264 SimultaneousLoginV3
./ng net.accelbyte.sdk.cli.Main iam simultaneousLoginV3 \
    --simultaneousPlatform 'cDyGKjRT' \
    --simultaneousTicket 'OY3EeT7j' \
    --nativePlatform 'steam' \
    --nativePlatformTicket 'k6Xly3dr' \
    > test.out 2>&1
eval_tap $? 264 'SimultaneousLoginV3' test.out

#- 265 TokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV3 \
    --additionalData 'emD51PMp' \
    --clientId 'QG3Q0JrK' \
    --clientSecret '1S9hGbhE' \
    --code 'u2cWI4bk' \
    --codeVerifier 'ssSBZMsn' \
    --extendNamespace 'NVw3WYYQ' \
    --extendExp  \
    --password '8IHzcfG6' \
    --redirectUri 'ZVTVUYIE' \
    --refreshToken '7GprY9JB' \
    --scope 'c3Mpkja3' \
    --username '02gXXM3G' \
    --grantType 'refresh_token' \
    > test.out 2>&1
eval_tap $? 265 'TokenGrantV3' test.out

#- 266 VerifyTokenV3
./ng net.accelbyte.sdk.cli.Main iam verifyTokenV3 \
    --token 'bakiewtm' \
    > test.out 2>&1
eval_tap $? 266 'VerifyTokenV3' test.out

#- 267 PlatformAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticationV3 \
    --platformId '7cbtptQy' \
    --code '6TQm8UWE' \
    --error 'Ygr94lag' \
    --openidAssocHandle 'URsbuahv' \
    --openidClaimedId '61WU01w1' \
    --openidIdentity 'uUeNbrnu' \
    --openidMode 'aIZSpXfS' \
    --openidNs 'cOSmcjy8' \
    --openidOpEndpoint 'y5hbtGEv' \
    --openidResponseNonce 'FteING2Q' \
    --openidReturnTo 'vp1NMEQX' \
    --openidSig 'DtGUkC56' \
    --openidSigned 'wHdx6mAG' \
    --state 'jIiCwUSp' \
    > test.out 2>&1
eval_tap $? 267 'PlatformAuthenticationV3' test.out

#- 268 PlatformTokenRefreshV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenRefreshV3 \
    --platformId '6nF7CuJx' \
    --platformToken '0BM7RrPm' \
    > test.out 2>&1
eval_tap $? 268 'PlatformTokenRefreshV3' test.out

#- 269 PublicGetInputValidations
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidations \
    --defaultOnEmpty  \
    --languageCode '5EBRabwj' \
    > test.out 2>&1
eval_tap $? 269 'PublicGetInputValidations' test.out

#- 270 PublicGetInputValidationByField
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidationByField \
    --field 'qJm3PC1l' \
    > test.out 2>&1
eval_tap $? 270 'PublicGetInputValidationByField' test.out

#- 271 PublicGetCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam publicGetCountryAgeRestrictionV3 \
    --countryCode 'HKVKk5Xp' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 271 'PublicGetCountryAgeRestrictionV3' test.out

#- 272 PublicGetConfigValueV3
./ng net.accelbyte.sdk.cli.Main iam publicGetConfigValueV3 \
    --configKey 'qyna81oT' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 272 'PublicGetConfigValueV3' test.out

#- 273 PublicGetCountryListV3
./ng net.accelbyte.sdk.cli.Main iam publicGetCountryListV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 273 'PublicGetCountryListV3' test.out

#- 274 RetrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3
./ng net.accelbyte.sdk.cli.Main iam retrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 274 'RetrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3' test.out

#- 275 RetrieveActiveOIDCClientsPublicV3
./ng net.accelbyte.sdk.cli.Main iam retrieveActiveOIDCClientsPublicV3 \
    --namespace "$AB_NAMESPACE" \
    --clientId 'pZzt2JwN' \
    > test.out 2>&1
eval_tap $? 275 'RetrieveActiveOIDCClientsPublicV3' test.out

#- 276 PublicListUserIDByPlatformUserIDsV3
eval_tap 0 276 'PublicListUserIDByPlatformUserIDsV3 # SKIP deprecated' test.out

#- 277 PublicGetUserByPlatformUserIDV3
eval_tap 0 277 'PublicGetUserByPlatformUserIDV3 # SKIP deprecated' test.out

#- 278 PublicGetProfileUpdateStrategyV3
./ng net.accelbyte.sdk.cli.Main iam publicGetProfileUpdateStrategyV3 \
    --namespace "$AB_NAMESPACE" \
    --field 'dob' \
    > test.out 2>&1
eval_tap $? 278 'PublicGetProfileUpdateStrategyV3' test.out

#- 279 PublicGetAsyncStatus
./ng net.accelbyte.sdk.cli.Main iam publicGetAsyncStatus \
    --namespace "$AB_NAMESPACE" \
    --requestId 'Rqa25JHU' \
    > test.out 2>&1
eval_tap $? 279 'PublicGetAsyncStatus' test.out

#- 280 PublicSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam publicSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'tdeIebYJ' \
    --limit '73' \
    --offset '25' \
    --platformBy 'wAsoFczX' \
    --platformId 'ITtcyPQQ' \
    --query 'BXzsf49j' \
    > test.out 2>&1
eval_tap $? 280 'PublicSearchUserV3' test.out

#- 281 PublicCreateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "jcgBDhIF", "acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "6xaiho7E", "policyId": "azX65XWI", "policyVersionId": "f83rX0JZ"}, {"isAccepted": true, "localizedPolicyVersionId": "eB8LUU6Q", "policyId": "HiKbXvdW", "policyVersionId": "TifBvP0c"}, {"isAccepted": false, "localizedPolicyVersionId": "iz024yqh", "policyId": "mxQhHmqM", "policyVersionId": "hXwp8cSD"}], "authType": "KnNZyx2U", "code": "VHm0zhcQ", "country": "P3PB7oke", "dateOfBirth": "q4i2mM7L", "displayName": "C1CeBIdO", "emailAddress": "BGLBhGYL", "password": "76u81WMN", "reachMinimumAge": true, "uniqueDisplayName": "ZiNsqlGD"}' \
    > test.out 2>&1
eval_tap $? 281 'PublicCreateUserV3' test.out

#- 282 CheckUserAvailability
./ng net.accelbyte.sdk.cli.Main iam checkUserAvailability \
    --namespace "$AB_NAMESPACE" \
    --field 'e9s25R4o' \
    --query '14XXS0u2' \
    > test.out 2>&1
eval_tap $? 282 'CheckUserAvailability' test.out

#- 283 PublicBulkGetUsers
eval_tap 0 283 'PublicBulkGetUsers # SKIP deprecated' test.out

#- 284 PublicSendRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicSendRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "EaMGPUhm", "languageTag": "aKeVSwzQ"}' \
    > test.out 2>&1
eval_tap $? 284 'PublicSendRegistrationCode' test.out

#- 285 PublicVerifyRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicVerifyRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "7DjJnseI", "emailAddress": "rEGbFpk8"}' \
    > test.out 2>&1
eval_tap $? 285 'PublicVerifyRegistrationCode' test.out

#- 286 PublicForgotPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicForgotPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "DglVJnGv", "languageTag": "aIAbmH3O"}' \
    > test.out 2>&1
eval_tap $? 286 'PublicForgotPasswordV3' test.out

#- 287 PublicValidateUserInput
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserInput \
    --namespace "$AB_NAMESPACE" \
    --body '{"displayName": "4Mi7nHQN", "password": "4CVdsYeK", "uniqueDisplayName": "FnqG6em0", "username": "SsQlZ1ov"}' \
    > test.out 2>&1
eval_tap $? 287 'PublicValidateUserInput' test.out

#- 288 GetAdminInvitationV3
./ng net.accelbyte.sdk.cli.Main iam getAdminInvitationV3 \
    --invitationId 'bjmb5pa8' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 288 'GetAdminInvitationV3' test.out

#- 289 CreateUserFromInvitationV3
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV3 \
    --invitationId 'ZXPPmy9K' \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "Dullcwjf", "acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "6ZvD2vw4", "policyId": "r4UR3hSr", "policyVersionId": "e172mhUP"}, {"isAccepted": true, "localizedPolicyVersionId": "6RqsAUuK", "policyId": "E0uIpAai", "policyVersionId": "g5eUr56h"}, {"isAccepted": true, "localizedPolicyVersionId": "nRf6KgTf", "policyId": "xX5074xD", "policyVersionId": "AlPKvMF5"}], "authType": "lUJrNl7B", "code": "RNAYbEfZ", "country": "Dyxo7lVn", "dateOfBirth": "DD89BXP6", "displayName": "eiyIagqv", "emailAddress": "n0lcpMKl", "password": "XTZiwuV9", "reachMinimumAge": false, "uniqueDisplayName": "OiUps7Vj"}' \
    > test.out 2>&1
eval_tap $? 289 'CreateUserFromInvitationV3' test.out

#- 290 UpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam updateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "BEJYDfCS", "country": "jI6oLiym", "dateOfBirth": "aNIoo9g1", "displayName": "GwlVssdR", "languageTag": "DkDbgsdr", "uniqueDisplayName": "6j0xGfT8", "userName": "9rBtJizJ"}' \
    > test.out 2>&1
eval_tap $? 290 'UpdateUserV3' test.out

#- 291 PublicPartialUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicPartialUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "CmHVs5qQ", "country": "7ilScHOz", "dateOfBirth": "SwpRZrqr", "displayName": "gOb24Vgx", "languageTag": "JSfRcUxx", "uniqueDisplayName": "tYy0tyvT", "userName": "0hq3Zi5U"}' \
    > test.out 2>&1
eval_tap $? 291 'PublicPartialUpdateUserV3' test.out

#- 292 PublicSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"context": "nBfMYpSr", "emailAddress": "fv7YPRDf", "languageTag": "ifJcolq5", "upgradeToken": "b8KNoAs6"}' \
    > test.out 2>&1
eval_tap $? 292 'PublicSendVerificationCodeV3' test.out

#- 293 PublicUserVerificationV3
./ng net.accelbyte.sdk.cli.Main iam publicUserVerificationV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "y3NEUERm", "contactType": "IoX16Z3i", "languageTag": "rJ1TpwJl", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 293 'PublicUserVerificationV3' test.out

#- 294 PublicUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "m2AAs4aj", "country": "eTXoS43g", "dateOfBirth": "aSdFdR5E", "displayName": "HXFocPL8", "emailAddress": "mPUfM6rd", "password": "MziDcbyl", "uniqueDisplayName": "78coJGip", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 294 'PublicUpgradeHeadlessAccountV3' test.out

#- 295 PublicVerifyHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --needVerificationCode  \
    --body '{"emailAddress": "hdsXGCpg", "password": "AB2s0xFi"}' \
    > test.out 2>&1
eval_tap $? 295 'PublicVerifyHeadlessAccountV3' test.out

#- 296 PublicUpdatePasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicUpdatePasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"languageTag": "DTnBtDYS", "mfaToken": "GUZMMIfa", "newPassword": "Dnc4JUIn", "oldPassword": "CbYY82nS"}' \
    > test.out 2>&1
eval_tap $? 296 'PublicUpdatePasswordV3' test.out

#- 297 PublicCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam publicCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'bkNyzPrt' \
    > test.out 2>&1
eval_tap $? 297 'PublicCreateJusticeUser' test.out

#- 298 PublicPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'SYb3TAU9' \
    --redirectUri 'NPIALOwk' \
    --ticket 'I1wJFHAP' \
    > test.out 2>&1
eval_tap $? 298 'PublicPlatformLinkV3' test.out

#- 299 PublicPlatformUnlinkV3
eval_tap 0 299 'PublicPlatformUnlinkV3 # SKIP deprecated' test.out

#- 300 PublicPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'HmSAAaRI' \
    > test.out 2>&1
eval_tap $? 300 'PublicPlatformUnlinkAllV3' test.out

#- 301 PublicForcePlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicForcePlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'v6JSRKGz' \
    --ticket '50Eas3ni' \
    > test.out 2>&1
eval_tap $? 301 'PublicForcePlatformLinkV3' test.out

#- 302 PublicWebLinkPlatform
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatform \
    --namespace "$AB_NAMESPACE" \
    --platformId 'KiPgqMMI' \
    --clientId 'owBCiGUU' \
    --redirectUri 'RBpwQfaS' \
    > test.out 2>&1
eval_tap $? 302 'PublicWebLinkPlatform' test.out

#- 303 PublicWebLinkPlatformEstablish
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatformEstablish \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Lg1KcaBK' \
    --code 'uBB2z47z' \
    --state 'k3TPkH1c' \
    > test.out 2>&1
eval_tap $? 303 'PublicWebLinkPlatformEstablish' test.out

#- 304 PublicProcessWebLinkPlatformV3
./ng net.accelbyte.sdk.cli.Main iam publicProcessWebLinkPlatformV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '0X8jOhyu' \
    --code 'dFeyKFGy' \
    --state 'hC8slZhd' \
    > test.out 2>&1
eval_tap $? 304 'PublicProcessWebLinkPlatformV3' test.out

#- 305 PublicGetUsersPlatformInfosV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUsersPlatformInfosV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"platformId": "TSYi9xU6", "userIds": ["vWSLRoUg", "EMqPxee9", "kslk4J4N"]}' \
    > test.out 2>&1
eval_tap $? 305 'PublicGetUsersPlatformInfosV3' test.out

#- 306 ResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam resetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientId": "QKdlmLtz", "code": "OWY5de6i", "emailAddress": "2x7kKczo", "languageTag": "i9b81Fqg", "newPassword": "ePvIyyLJ"}' \
    > test.out 2>&1
eval_tap $? 306 'ResetPasswordV3' test.out

#- 307 PublicGetUserByUserIdV3
eval_tap 0 307 'PublicGetUserByUserIdV3 # SKIP deprecated' test.out

#- 308 PublicGetUserBanHistoryV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserBanHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'JhjBfd9S' \
    --activeOnly  \
    --after '6Q3Zxj6R' \
    --before 'YwsD7Es4' \
    --limit '23' \
    > test.out 2>&1
eval_tap $? 308 'PublicGetUserBanHistoryV3' test.out

#- 309 PublicListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'CKjW3DWi' \
    > test.out 2>&1
eval_tap $? 309 'PublicListUserAllPlatformAccountsDistinctV3' test.out

#- 310 PublicGetUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '0Yywu1qt' \
    > test.out 2>&1
eval_tap $? 310 'PublicGetUserInformationV3' test.out

#- 311 PublicGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Q9GYwQ7d' \
    --after '0.8978863956691148' \
    --before '0.48871423630458954' \
    --limit '88' \
    > test.out 2>&1
eval_tap $? 311 'PublicGetUserLoginHistoriesV3' test.out

#- 312 PublicGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'xP2gKymi' \
    --after 'd1Mos5pg' \
    --before 'HAi1fouC' \
    --limit '31' \
    --platformId 'XkyPgVO4' \
    > test.out 2>&1
eval_tap $? 312 'PublicGetUserPlatformAccountsV3' test.out

#- 313 PublicListJusticePlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicListJusticePlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'v2t7dzAe' \
    > test.out 2>&1
eval_tap $? 313 'PublicListJusticePlatformAccountsV3' test.out

#- 314 PublicLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam publicLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'yAC1aNRs' \
    --body '{"platformId": "2IYJUDqu", "platformUserId": "UVb3W2TM"}' \
    > test.out 2>&1
eval_tap $? 314 'PublicLinkPlatformAccount' test.out

#- 315 PublicForceLinkPlatformWithProgression
./ng net.accelbyte.sdk.cli.Main iam publicForceLinkPlatformWithProgression \
    --namespace "$AB_NAMESPACE" \
    --userId 'AIYZDnHk' \
    --body '{"chosenNamespaces": ["AYOFzZ4f", "GfmQbBTq", "02qobXgz"], "requestId": "Ja4g8ch3"}' \
    > test.out 2>&1
eval_tap $? 315 'PublicForceLinkPlatformWithProgression' test.out

#- 316 PublicGetPublisherUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetPublisherUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'L8JSvjTP' \
    > test.out 2>&1
eval_tap $? 316 'PublicGetPublisherUserV3' test.out

#- 317 PublicValidateUserByUserIDAndPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserByUserIDAndPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'E6rsC6Pw' \
    --password 'bXG9IW8L' \
    > test.out 2>&1
eval_tap $? 317 'PublicValidateUserByUserIDAndPasswordV3' test.out

#- 318 PublicGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRolesV3 \
    --after 'JLB09qbP' \
    --before '1VQxulAe' \
    --isWildcard  \
    --limit '42' \
    > test.out 2>&1
eval_tap $? 318 'PublicGetRolesV3' test.out

#- 319 PublicGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRoleV3 \
    --roleId '1JYceLdi' \
    > test.out 2>&1
eval_tap $? 319 'PublicGetRoleV3' test.out

#- 320 PublicGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyUserV3 \
    --includeAllPlatforms  \
    > test.out 2>&1
eval_tap $? 320 'PublicGetMyUserV3' test.out

#- 321 PublicSendCodeForwardV3
./ng net.accelbyte.sdk.cli.Main iam publicSendCodeForwardV3 \
    --body '{"context": "G3PeQ0RY", "emailAddress": "ZY9cXFZa", "languageTag": "59MRmpJe", "upgradeToken": "H4PyltkC"}' \
    > test.out 2>&1
eval_tap $? 321 'PublicSendCodeForwardV3' test.out

#- 322 PublicGetLinkHeadlessAccountToMyAccountConflictV3
./ng net.accelbyte.sdk.cli.Main iam publicGetLinkHeadlessAccountToMyAccountConflictV3 \
    --oneTimeLinkCode 'd5CRx3ZA' \
    > test.out 2>&1
eval_tap $? 322 'PublicGetLinkHeadlessAccountToMyAccountConflictV3' test.out

#- 323 LinkHeadlessAccountToMyAccountV3
./ng net.accelbyte.sdk.cli.Main iam linkHeadlessAccountToMyAccountV3 \
    --body '{"chosenNamespaces": ["3scvkoVb", "SE2aZJbW", "WYZ3wYjB"], "oneTimeLinkCode": "XZvXSP48"}' \
    > test.out 2>&1
eval_tap $? 323 'LinkHeadlessAccountToMyAccountV3' test.out

#- 324 PublicGetMyRedirectionAfterLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyRedirectionAfterLinkV3 \
    --oneTimeLinkCode 'LxyVe2sN' \
    > test.out 2>&1
eval_tap $? 324 'PublicGetMyRedirectionAfterLinkV3' test.out

#- 325 PublicGetMyProfileAllowUpdateStatusV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyProfileAllowUpdateStatusV3 \
    > test.out 2>&1
eval_tap $? 325 'PublicGetMyProfileAllowUpdateStatusV3' test.out

#- 326 PublicSendVerificationLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationLinkV3 \
    --body '{"languageTag": "EJfPIygs"}' \
    > test.out 2>&1
eval_tap $? 326 'PublicSendVerificationLinkV3' test.out

#- 327 PublicGetOpenidUserInfoV3
./ng net.accelbyte.sdk.cli.Main iam publicGetOpenidUserInfoV3 \
    > test.out 2>&1
eval_tap $? 327 'PublicGetOpenidUserInfoV3' test.out

#- 328 PublicVerifyUserByLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyUserByLinkV3 \
    --code 'BSXjPzQ9' \
    > test.out 2>&1
eval_tap $? 328 'PublicVerifyUserByLinkV3' test.out

#- 329 PlatformAuthenticateSAMLV3Handler
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticateSAMLV3Handler \
    --platformId 'fqeTza3b' \
    --code 'qkTK2CtH' \
    --error 'wtskXLgX' \
    --state 'sUAtxk5K' \
    > test.out 2>&1
eval_tap $? 329 'PlatformAuthenticateSAMLV3Handler' test.out

#- 330 LoginSSOClient
./ng net.accelbyte.sdk.cli.Main iam loginSSOClient \
    --platformId 'Yev9xCZq' \
    --payload 'aABFU3vB' \
    > test.out 2>&1
eval_tap $? 330 'LoginSSOClient' test.out

#- 331 LogoutSSOClient
./ng net.accelbyte.sdk.cli.Main iam logoutSSOClient \
    --platformId 'WK1PhFgK' \
    > test.out 2>&1
eval_tap $? 331 'LogoutSSOClient' test.out

#- 332 RequestTargetTokenResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTargetTokenResponseV3 \
    --additionalData '8gOJ4G8X' \
    --code '17pjLShJ' \
    > test.out 2>&1
eval_tap $? 332 'RequestTargetTokenResponseV3' test.out

#- 333 UpgradeAndAuthenticateForwardV3
./ng net.accelbyte.sdk.cli.Main iam upgradeAndAuthenticateForwardV3 \
    --clientId '4Y6bjVcj' \
    --upgradeSuccessToken 'SZZZDC02' \
    > test.out 2>&1
eval_tap $? 333 'UpgradeAndAuthenticateForwardV3' test.out

#- 334 AdminListInvitationHistoriesV4
./ng net.accelbyte.sdk.cli.Main iam adminListInvitationHistoriesV4 \
    --limit '63' \
    --namespace "$AB_NAMESPACE" \
    --offset '19' \
    > test.out 2>&1
eval_tap $? 334 'AdminListInvitationHistoriesV4' test.out

#- 335 AdminGetDevicesByUserV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDevicesByUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'TwIz9DP3' \
    > test.out 2>&1
eval_tap $? 335 'AdminGetDevicesByUserV4' test.out

#- 336 AdminGetBannedDevicesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedDevicesV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceType 'oBZsBQA8' \
    --endDate 'jcziXgNr' \
    --limit '48' \
    --offset '33' \
    --startDate 'kkiN5zj0' \
    > test.out 2>&1
eval_tap $? 336 'AdminGetBannedDevicesV4' test.out

#- 337 AdminGetUserDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeviceBansV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'M6oJSyMD' \
    > test.out 2>&1
eval_tap $? 337 'AdminGetUserDeviceBansV4' test.out

#- 338 AdminBanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminBanDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"comment": "t3ZYREqG", "deviceId": "VRqgkynT", "deviceType": "V8M1dY7W", "enabled": true, "endDate": "Uydjir43", "ext": {"xHUutPKk": {}, "NGyfQn79": {}, "LCTBlTaP": {}}, "reason": "Gn2MWiaz"}' \
    > test.out 2>&1
eval_tap $? 338 'AdminBanDeviceV4' test.out

#- 339 AdminGetDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBanV4 \
    --banId 'GmflyoMq' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 339 'AdminGetDeviceBanV4' test.out

#- 340 AdminUpdateDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateDeviceBanV4 \
    --banId 'RpvhHu76' \
    --namespace "$AB_NAMESPACE" \
    --body '{"enabled": false}' \
    > test.out 2>&1
eval_tap $? 340 'AdminUpdateDeviceBanV4' test.out

#- 341 AdminGenerateReportV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateReportV4 \
    --namespace "$AB_NAMESPACE" \
    --endDate '0KMCq3tp' \
    --startDate '7vNUGUIB' \
    --deviceType 'l04qKG9u' \
    > test.out 2>&1
eval_tap $? 341 'AdminGenerateReportV4' test.out

#- 342 AdminGetDeviceTypesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceTypesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 342 'AdminGetDeviceTypesV4' test.out

#- 343 AdminGetDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBansV4 \
    --deviceId '6zVH1CR4' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 343 'AdminGetDeviceBansV4' test.out

#- 344 AdminDecryptDeviceV4
eval_tap 0 344 'AdminDecryptDeviceV4 # SKIP deprecated' test.out

#- 345 AdminUnbanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminUnbanDeviceV4 \
    --deviceId 'FhcYEo1p' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 345 'AdminUnbanDeviceV4' test.out

#- 346 AdminGetUsersByDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUsersByDeviceV4 \
    --deviceId 'Zgmcrbuo' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 346 'AdminGetUsersByDeviceV4' test.out

#- 347 AdminGetNamespaceInvitationHistoryV4
./ng net.accelbyte.sdk.cli.Main iam adminGetNamespaceInvitationHistoryV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 347 'AdminGetNamespaceInvitationHistoryV4' test.out

#- 348 AdminGetNamespaceUserInvitationHistoryV4
./ng net.accelbyte.sdk.cli.Main iam adminGetNamespaceUserInvitationHistoryV4 \
    --namespace "$AB_NAMESPACE" \
    --limit '14' \
    --offset '65' \
    > test.out 2>&1
eval_tap $? 348 'AdminGetNamespaceUserInvitationHistoryV4' test.out

#- 349 AdminCreateTestUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateTestUsersV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 76, "userInfo": {"country": "E1Dc0yaZ"}}' \
    > test.out 2>&1
eval_tap $? 349 'AdminCreateTestUsersV4' test.out

#- 350 AdminCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "8WSSQ0Zy", "policyId": "NAjY608q", "policyVersionId": "LpN3IEvA"}, {"isAccepted": true, "localizedPolicyVersionId": "xfPls0i1", "policyId": "Km5SjlWz", "policyVersionId": "0GVZRapE"}, {"isAccepted": true, "localizedPolicyVersionId": "gLAcEi9Y", "policyId": "JpevX6fP", "policyVersionId": "BmsY4ksk"}], "authType": "EMAILPASSWD", "code": "TTrzBDpx", "country": "aHmi7Ib5", "dateOfBirth": "PjSlyRUv", "displayName": "Oyh52Yqp", "emailAddress": "yqj2Puzc", "password": "csLqGvxr", "passwordMD5Sum": "dECF5xCq", "reachMinimumAge": false, "uniqueDisplayName": "8emPzCbi", "username": "PjEiGqVR"}' \
    > test.out 2>&1
eval_tap $? 350 'AdminCreateUserV4' test.out

#- 351 AdminBulkUpdateUserAccountTypeV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateUserAccountTypeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"testAccount": true, "userIds": ["rKq1WJab", "bpLPUjJE", "zfSvbFkC"]}' \
    > test.out 2>&1
eval_tap $? 351 'AdminBulkUpdateUserAccountTypeV4' test.out

#- 352 AdminBulkCheckValidUserIDV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkCheckValidUserIDV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["c3RjamOV", "77nIqdcQ", "6xMJ91Tr"]}' \
    > test.out 2>&1
eval_tap $? 352 'AdminBulkCheckValidUserIDV4' test.out

#- 353 AdminUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'lf9r7Kyl' \
    --body '{"avatarUrl": "JIhYjy4l", "country": "H13hgnX9", "dateOfBirth": "9ma8fSyA", "displayName": "YQcQqQpt", "languageTag": "ZhHBn4ve", "skipLoginQueue": false, "tags": ["WiLMD4cV", "DC8oqntQ", "NLWuZ6Rb"], "uniqueDisplayName": "zqVQv3VK", "userName": "a9qBI66w"}' \
    > test.out 2>&1
eval_tap $? 353 'AdminUpdateUserV4' test.out

#- 354 AdminUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'QmnSKjBo' \
    --body '{"code": "CtkDKAz9", "emailAddress": "wYaGC3Vz"}' \
    > test.out 2>&1
eval_tap $? 354 'AdminUpdateUserEmailAddressV4' test.out

#- 355 AdminDisableUserMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableUserMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'wp8xEm8K' \
    --body '{"factor": "PpcJkFeQ", "mfaToken": "Pxlls6rN"}' \
    > test.out 2>&1
eval_tap $? 355 'AdminDisableUserMFAV4' test.out

#- 356 AdminGetUserMFAStatusV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUserMFAStatusV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '2qg8KlJ0' \
    > test.out 2>&1
eval_tap $? 356 'AdminGetUserMFAStatusV4' test.out

#- 357 AdminListUserRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminListUserRolesV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'rU5hicSw' \
    > test.out 2>&1
eval_tap $? 357 'AdminListUserRolesV4' test.out

#- 358 AdminUpdateUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'kqebfjtC' \
    --body '{"assignedNamespaces": ["UmN4fvzt", "l7EeGUsk", "yS88ilpc"], "roleId": "QMofkd5Y"}' \
    > test.out 2>&1
eval_tap $? 358 'AdminUpdateUserRoleV4' test.out

#- 359 AdminAddUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '3gZppfSY' \
    --body '{"assignedNamespaces": ["WdTZLuZE", "aS39XewE", "h6UWw1jR"], "roleId": "h7ygJwu7"}' \
    > test.out 2>&1
eval_tap $? 359 'AdminAddUserRoleV4' test.out

#- 360 AdminRemoveUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRemoveUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '7nIZToqQ' \
    --body '{"assignedNamespaces": ["lbaWp9LY", "oCPqRNLL", "rT0objeu"], "roleId": "v0Ov2vtW"}' \
    > test.out 2>&1
eval_tap $? 360 'AdminRemoveUserRoleV4' test.out

#- 361 AdminGetRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV4 \
    --adminRole  \
    --isWildcard  \
    --limit '97' \
    --offset '40' \
    > test.out 2>&1
eval_tap $? 361 'AdminGetRolesV4' test.out

#- 362 AdminCreateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV4 \
    --body '{"adminRole": true, "deletable": false, "isWildcard": true, "roleName": "pI9XImSi"}' \
    > test.out 2>&1
eval_tap $? 362 'AdminCreateRoleV4' test.out

#- 363 AdminGetRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV4 \
    --roleId 'pWQgbMnM' \
    > test.out 2>&1
eval_tap $? 363 'AdminGetRoleV4' test.out

#- 364 AdminDeleteRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV4 \
    --roleId 'RIgNrVEJ' \
    > test.out 2>&1
eval_tap $? 364 'AdminDeleteRoleV4' test.out

#- 365 AdminUpdateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV4 \
    --roleId 'q2WJEjKp' \
    --body '{"adminRole": true, "deletable": true, "isWildcard": false, "roleName": "ZkToKLwS"}' \
    > test.out 2>&1
eval_tap $? 365 'AdminUpdateRoleV4' test.out

#- 366 AdminUpdateRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV4 \
    --roleId 'oxMGfTM0' \
    --body '{"permissions": [{"action": 16, "resource": "fsGARLEn", "schedAction": 18, "schedCron": "LCAYkMDk", "schedRange": ["9PBu3xnc", "4I3UPOhD", "ifJNvvuz"]}, {"action": 64, "resource": "lk2dy8eW", "schedAction": 80, "schedCron": "xlovzsWo", "schedRange": ["KGJyTdTK", "xBomdn5g", "8ZepEWUx"]}, {"action": 41, "resource": "HsZyOmIl", "schedAction": 59, "schedCron": "GvSZy5RL", "schedRange": ["etLpTp0S", "d608RYB7", "vhACyfXM"]}]}' \
    > test.out 2>&1
eval_tap $? 366 'AdminUpdateRolePermissionsV4' test.out

#- 367 AdminAddRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV4 \
    --roleId 'Dw721S7K' \
    --body '{"permissions": [{"action": 24, "resource": "BUuA8rlP", "schedAction": 23, "schedCron": "QOXpkyDb", "schedRange": ["gapLARVD", "w34Kd5BX", "HE1BveEl"]}, {"action": 100, "resource": "tJEnt25U", "schedAction": 57, "schedCron": "4zRjRLVI", "schedRange": ["fquKnoaZ", "Oxt4Uw1f", "MLL4PajE"]}, {"action": 69, "resource": "EG0gKFL7", "schedAction": 15, "schedCron": "2SUZzidq", "schedRange": ["k8Vq5tAi", "ccSZx8wt", "Vibu6LPf"]}]}' \
    > test.out 2>&1
eval_tap $? 367 'AdminAddRolePermissionsV4' test.out

#- 368 AdminDeleteRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV4 \
    --roleId '4a4AyrTK' \
    --body '["qqTVel1i", "qVeNZCxp", "z4ebkZgz"]' \
    > test.out 2>&1
eval_tap $? 368 'AdminDeleteRolePermissionsV4' test.out

#- 369 AdminListAssignedUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminListAssignedUsersV4 \
    --roleId 'qXX0Crqn' \
    --after 'sWeb8LE1' \
    --before 'iASPyfXA' \
    --limit '28' \
    > test.out 2>&1
eval_tap $? 369 'AdminListAssignedUsersV4' test.out

#- 370 AdminAssignUserToRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAssignUserToRoleV4 \
    --roleId 'MXJLeRwY' \
    --body '{"assignedNamespaces": ["R52R9d2d", "tFkRJO7B", "hxaiYFhi"], "namespace": "pDqiSRr8", "userId": "mVtHPrrX"}' \
    > test.out 2>&1
eval_tap $? 370 'AdminAssignUserToRoleV4' test.out

#- 371 AdminRevokeUserFromRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRevokeUserFromRoleV4 \
    --roleId 'QJrv6ekL' \
    --body '{"namespace": "S2AKwiX2", "userId": "jNFOF84T"}' \
    > test.out 2>&1
eval_tap $? 371 'AdminRevokeUserFromRoleV4' test.out

#- 372 AdminInviteUserNewV4
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserNewV4 \
    --body '{"assignedNamespaces": ["seKjprjO", "VAf0Dyoi", "iiSUa8s0"], "emailAddresses": ["PCTDgyd1", "SryYf8gi", "G8WvMYJL"], "isAdmin": true, "isNewStudio": true, "languageTag": "yhDJ37SB", "namespace": "2wYJpxQq", "roleId": "cukR5wLX"}' \
    > test.out 2>&1
eval_tap $? 372 'AdminInviteUserNewV4' test.out

#- 373 AdminUpdateMyUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateMyUserV4 \
    --body '{"avatarUrl": "sD35cCkJ", "country": "oMCDTVA5", "dateOfBirth": "PrkKP0kK", "displayName": "SyMzkb4D", "languageTag": "sqBvEtId", "skipLoginQueue": true, "tags": ["8FGDgdiz", "iUCwZRVW", "HTzrUQox"], "uniqueDisplayName": "1HHC8mQT", "userName": "WyCLnZrP"}' \
    > test.out 2>&1
eval_tap $? 373 'AdminUpdateMyUserV4' test.out

#- 374 AdminDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyAuthenticatorV4 \
    --body '{"factor": "znn2WMuZ", "mfaToken": "vBg7gUfj"}' \
    > test.out 2>&1
eval_tap $? 374 'AdminDisableMyAuthenticatorV4' test.out

#- 375 AdminEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyAuthenticatorV4 \
    --code 'ThFk1hwz' \
    > test.out 2>&1
eval_tap $? 375 'AdminEnableMyAuthenticatorV4' test.out

#- 376 AdminGenerateMyAuthenticatorKeyV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateMyAuthenticatorKeyV4 \
    > test.out 2>&1
eval_tap $? 376 'AdminGenerateMyAuthenticatorKeyV4' test.out

#- 377 AdminGetMyBackupCodesV4
eval_tap 0 377 'AdminGetMyBackupCodesV4 # SKIP deprecated' test.out

#- 378 AdminGenerateMyBackupCodesV4
eval_tap 0 378 'AdminGenerateMyBackupCodesV4 # SKIP deprecated' test.out

#- 379 AdminDisableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyBackupCodesV4 \
    --body '{"factor": "T39CZ18g", "mfaToken": "g62h0Qnn"}' \
    > test.out 2>&1
eval_tap $? 379 'AdminDisableMyBackupCodesV4' test.out

#- 380 AdminDownloadMyBackupCodesV4
eval_tap 0 380 'AdminDownloadMyBackupCodesV4 # SKIP deprecated' test.out

#- 381 AdminEnableMyBackupCodesV4
eval_tap 0 381 'AdminEnableMyBackupCodesV4 # SKIP deprecated' test.out

#- 382 AdminGetBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBackupCodesV4 \
    --languageTag 'pPlE3z3V' \
    > test.out 2>&1
eval_tap $? 382 'AdminGetBackupCodesV4' test.out

#- 383 AdminGenerateBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateBackupCodesV4 \
    --languageTag 'Akgk1D9O' \
    > test.out 2>&1
eval_tap $? 383 'AdminGenerateBackupCodesV4' test.out

#- 384 AdminEnableBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableBackupCodesV4 \
    --languageTag 'k1kNcb8p' \
    > test.out 2>&1
eval_tap $? 384 'AdminEnableBackupCodesV4' test.out

#- 385 AdminChallengeMyMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminChallengeMyMFAV4 \
    --code 'eO9YXYl0' \
    --factor 'uUFEMCL6' \
    > test.out 2>&1
eval_tap $? 385 'AdminChallengeMyMFAV4' test.out

#- 386 AdminSendMyMFAEmailCodeV4
./ng net.accelbyte.sdk.cli.Main iam adminSendMyMFAEmailCodeV4 \
    --action 'QvUsQjxq' \
    --languageTag 'awz6j3br' \
    > test.out 2>&1
eval_tap $? 386 'AdminSendMyMFAEmailCodeV4' test.out

#- 387 AdminDisableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyEmailV4 \
    --body '{"factor": "tw3C2w2i", "mfaToken": "brTckCr6"}' \
    > test.out 2>&1
eval_tap $? 387 'AdminDisableMyEmailV4' test.out

#- 388 AdminEnableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyEmailV4 \
    --code 'dQQ8Wx2U' \
    > test.out 2>&1
eval_tap $? 388 'AdminEnableMyEmailV4' test.out

#- 389 AdminGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyEnabledFactorsV4 \
    > test.out 2>&1
eval_tap $? 389 'AdminGetMyEnabledFactorsV4' test.out

#- 390 AdminMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam adminMakeFactorMyDefaultV4 \
    --factor 'ACIuxTpT' \
    > test.out 2>&1
eval_tap $? 390 'AdminMakeFactorMyDefaultV4' test.out

#- 391 AdminGetMyOwnMFAStatusV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyOwnMFAStatusV4 \
    > test.out 2>&1
eval_tap $? 391 'AdminGetMyOwnMFAStatusV4' test.out

#- 392 AdminGetMyMFAStatusV4
eval_tap 0 392 'AdminGetMyMFAStatusV4 # SKIP deprecated' test.out

#- 393 AdminInviteUserV4
eval_tap 0 393 'AdminInviteUserV4 # SKIP deprecated' test.out

#- 394 AuthenticationWithPlatformLinkV4
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV4 \
    --extendExp  \
    --clientId 'NWvyoylt' \
    --linkingToken 'pPUXQpoL' \
    --password '9SRWYMs1' \
    --username 'Gyhrl9tQ' \
    > test.out 2>&1
eval_tap $? 394 'AuthenticationWithPlatformLinkV4' test.out

#- 395 GenerateTokenByNewHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV4 \
    --additionalData 'vSaXb2PK' \
    --extendExp  \
    --linkingToken 'VxVJmSfq' \
    > test.out 2>&1
eval_tap $? 395 'GenerateTokenByNewHeadlessAccountV4' test.out

#- 396 Verify2faCodeV4
./ng net.accelbyte.sdk.cli.Main iam verify2faCodeV4 \
    --code 'CCK0D1ae' \
    --factor 'SFOKrqP6' \
    --mfaToken 'XyCbCA5G' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 396 'Verify2faCodeV4' test.out

#- 397 PlatformTokenGrantV4
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV4 \
    --platformId 'A1siW8pD' \
    --codeChallenge 'bRaDIqlv' \
    --codeChallengeMethod 'S256' \
    --additionalData 'ukOJG0B5' \
    --clientId 'hGWynfoo' \
    --createHeadless  \
    --deviceId 'dHtQ6bfP' \
    --macAddress 'fTrfW9W8' \
    --platformToken 'gWw0xPbr' \
    --serviceLabel '0.03275724479476938' \
    --skipSetCookie  \
    > test.out 2>&1
eval_tap $? 397 'PlatformTokenGrantV4' test.out

#- 398 SimultaneousLoginV4
./ng net.accelbyte.sdk.cli.Main iam simultaneousLoginV4 \
    --codeChallenge 'MPIspAsb' \
    --codeChallengeMethod 'plain' \
    --simultaneousPlatform 'CzFy5cKk' \
    --simultaneousTicket 'qhqGTHKn' \
    --nativePlatform 'steam' \
    --nativePlatformTicket 'hOYm6PUW' \
    > test.out 2>&1
eval_tap $? 398 'SimultaneousLoginV4' test.out

#- 399 TokenGrantV4
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV4 \
    --codeChallenge 'lLrgOKpj' \
    --codeChallengeMethod 'S256' \
    --additionalData 'CJobGpfk' \
    --clientId 'uK7nXdNx' \
    --clientSecret 'eFXS0NbE' \
    --code 'fJks8V4U' \
    --codeVerifier 'Ntun4TXw' \
    --extendNamespace 'teItWLl1' \
    --extendExp  \
    --loginQueueTicket 'cUD6SRrS' \
    --password 'QvZrCMDe' \
    --redirectUri 'g8sjBxp1' \
    --refreshToken 'zS3GxMmm' \
    --scope '0YlPWLUv' \
    --username 'xOA4AK83' \
    --grantType 'urn:ietf:params:oauth:grant-type:extend_client_credentials' \
    > test.out 2>&1
eval_tap $? 399 'TokenGrantV4' test.out

#- 400 RequestTargetTokenResponseV4
./ng net.accelbyte.sdk.cli.Main iam requestTargetTokenResponseV4 \
    --additionalData 'RbFQ525Q' \
    --code 'skvLo3jo' \
    > test.out 2>&1
eval_tap $? 400 'RequestTargetTokenResponseV4' test.out

#- 401 PublicListUserIDByPlatformUserIDsV4
./ng net.accelbyte.sdk.cli.Main iam publicListUserIDByPlatformUserIDsV4 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'RqN1jave' \
    --rawPUID  \
    --body '{"pidType": "H35cOTW3", "platformUserIds": ["WlRpAJkf", "40m6CMOo", "XAuid3Hm"]}' \
    > test.out 2>&1
eval_tap $? 401 'PublicListUserIDByPlatformUserIDsV4' test.out

#- 402 PublicGetUserByPlatformUserIDV4
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByPlatformUserIDV4 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'EOxPMy40' \
    --platformUserId 'JsNUJeYY' \
    > test.out 2>&1
eval_tap $? 402 'PublicGetUserByPlatformUserIDV4' test.out

#- 403 PublicCreateTestUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateTestUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "bhI9z1Jl", "policyId": "Ju4KKdeE", "policyVersionId": "IIyTDLWm"}, {"isAccepted": true, "localizedPolicyVersionId": "lHEHOKxJ", "policyId": "YywN86fZ", "policyVersionId": "PoEH8IGJ"}, {"isAccepted": true, "localizedPolicyVersionId": "g3C23hLa", "policyId": "oi5t0qwF", "policyVersionId": "b5ufKm06"}], "authType": "EMAILPASSWD", "country": "ndIBcZiC", "dateOfBirth": "D1eIgrQ4", "displayName": "LnGpwpRG", "emailAddress": "cwrCKdF7", "password": "SgeeVayX", "passwordMD5Sum": "WoOALQ4C", "uniqueDisplayName": "W2PQN2kj", "username": "NhmsOv7t", "verified": false}' \
    > test.out 2>&1
eval_tap $? 403 'PublicCreateTestUserV4' test.out

#- 404 PublicCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "N5n3GQKQ", "policyId": "9m5D04po", "policyVersionId": "Z7YbklA7"}, {"isAccepted": true, "localizedPolicyVersionId": "vd2ipDSF", "policyId": "3uH7Watw", "policyVersionId": "M90IGjjJ"}, {"isAccepted": true, "localizedPolicyVersionId": "7on6l0MO", "policyId": "HrSITtWm", "policyVersionId": "Gdp7GIFM"}], "authType": "EMAILPASSWD", "code": "RULSe7W5", "country": "iL2nh0mt", "dateOfBirth": "MBzCRKKU", "displayName": "3JXMC1xS", "emailAddress": "dQV15XyZ", "password": "QqOPxwuF", "passwordMD5Sum": "RCtJ2DYs", "reachMinimumAge": false, "uniqueDisplayName": "jyCG4r9V", "username": "FrJPZHZa"}' \
    > test.out 2>&1
eval_tap $? 404 'PublicCreateUserV4' test.out

#- 405 CreateUserFromInvitationV4
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV4 \
    --invitationId 'r0K3mo78' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "5beLYXIK", "policyId": "K6H0cE2K", "policyVersionId": "iHRv0aSk"}, {"isAccepted": true, "localizedPolicyVersionId": "hdrvJSK6", "policyId": "xRlExgyf", "policyVersionId": "IW7EWsLy"}, {"isAccepted": false, "localizedPolicyVersionId": "eRhfHzik", "policyId": "bW9gJc7e", "policyVersionId": "6ROqGQ5Q"}], "authType": "EMAILPASSWD", "code": "94rBff0b", "country": "36xU3Shy", "dateOfBirth": "6sTT3hKM", "displayName": "1L8wsca5", "emailAddress": "q2yz4Drx", "password": "YiiAPZMV", "passwordMD5Sum": "mKulfhLa", "reachMinimumAge": false, "uniqueDisplayName": "m5MBtNyu", "username": "EvZEjfXN"}' \
    > test.out 2>&1
eval_tap $? 405 'CreateUserFromInvitationV4' test.out

#- 406 PublicUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "OzzfDbLG", "country": "D3QcSNs0", "dateOfBirth": "aMdYtuj3", "displayName": "bYCnGNuW", "languageTag": "EUBwHT06", "uniqueDisplayName": "gOJWRryb", "userName": "JeZb0NlN"}' \
    > test.out 2>&1
eval_tap $? 406 'PublicUpdateUserV4' test.out

#- 407 PublicUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "yE4pKWyh", "emailAddress": "Xesl6Mxn"}' \
    > test.out 2>&1
eval_tap $? 407 'PublicUpdateUserEmailAddressV4' test.out

#- 408 PublicUpgradeHeadlessAccountWithVerificationCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountWithVerificationCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "FF0Qwpzu", "country": "0Mxnsjtz", "dateOfBirth": "hTG0Y7wR", "displayName": "gLHDeG1x", "emailAddress": "ry40eerq", "password": "hgCt4t8W", "reachMinimumAge": false, "uniqueDisplayName": "ukVtjHSw", "username": "nxDVcJeA", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 408 'PublicUpgradeHeadlessAccountWithVerificationCodeV4' test.out

#- 409 PublicUpgradeHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"dateOfBirth": "YkpvaQY3", "displayName": "iPL7hkEI", "emailAddress": "42vAipaM", "password": "Qxc0a8dm", "uniqueDisplayName": "LPH02I1V", "username": "aRClJrCi"}' \
    > test.out 2>&1
eval_tap $? 409 'PublicUpgradeHeadlessAccountV4' test.out

#- 410 PublicDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"factor": "uAnobDnT", "mfaToken": "jpixfDyI"}' \
    > test.out 2>&1
eval_tap $? 410 'PublicDisableMyAuthenticatorV4' test.out

#- 411 PublicEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    --code '3Ad91EN7' \
    > test.out 2>&1
eval_tap $? 411 'PublicEnableMyAuthenticatorV4' test.out

#- 412 PublicGenerateMyAuthenticatorKeyV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateMyAuthenticatorKeyV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 412 'PublicGenerateMyAuthenticatorKeyV4' test.out

#- 413 PublicGetMyBackupCodesV4
eval_tap 0 413 'PublicGetMyBackupCodesV4 # SKIP deprecated' test.out

#- 414 PublicGenerateMyBackupCodesV4
eval_tap 0 414 'PublicGenerateMyBackupCodesV4 # SKIP deprecated' test.out

#- 415 PublicDisableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"factor": "MPoqVyik", "mfaToken": "T8UkfQi9"}' \
    > test.out 2>&1
eval_tap $? 415 'PublicDisableMyBackupCodesV4' test.out

#- 416 PublicDownloadMyBackupCodesV4
eval_tap 0 416 'PublicDownloadMyBackupCodesV4 # SKIP deprecated' test.out

#- 417 PublicEnableMyBackupCodesV4
eval_tap 0 417 'PublicEnableMyBackupCodesV4 # SKIP deprecated' test.out

#- 418 PublicGetBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGetBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --languageTag 'zZvM8UJc' \
    > test.out 2>&1
eval_tap $? 418 'PublicGetBackupCodesV4' test.out

#- 419 PublicGenerateBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --languageTag 'ueg9gXkY' \
    > test.out 2>&1
eval_tap $? 419 'PublicGenerateBackupCodesV4' test.out

#- 420 PublicEnableBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --languageTag 'EpOdrkrA' \
    > test.out 2>&1
eval_tap $? 420 'PublicEnableBackupCodesV4' test.out

#- 421 PublicChallengeMyMFAV4
./ng net.accelbyte.sdk.cli.Main iam publicChallengeMyMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'WpjFbUwa' \
    --factor 'c84F8ea4' \
    > test.out 2>&1
eval_tap $? 421 'PublicChallengeMyMFAV4' test.out

#- 422 PublicRemoveTrustedDeviceV4
./ng net.accelbyte.sdk.cli.Main iam publicRemoveTrustedDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceToken 'HsaRCslv' \
    > test.out 2>&1
eval_tap $? 422 'PublicRemoveTrustedDeviceV4' test.out

#- 423 PublicSendMyMFAEmailCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicSendMyMFAEmailCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --action 'rD0zq5bt' \
    --languageTag 'ocTDeHaS' \
    > test.out 2>&1
eval_tap $? 423 'PublicSendMyMFAEmailCodeV4' test.out

#- 424 PublicDisableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyEmailV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"factor": "qhtD9Ucz", "mfaToken": "DHBcGghd"}' \
    > test.out 2>&1
eval_tap $? 424 'PublicDisableMyEmailV4' test.out

#- 425 PublicEnableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyEmailV4 \
    --namespace "$AB_NAMESPACE" \
    --code '2tGHMS4f' \
    > test.out 2>&1
eval_tap $? 425 'PublicEnableMyEmailV4' test.out

#- 426 PublicGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam publicGetMyEnabledFactorsV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 426 'PublicGetMyEnabledFactorsV4' test.out

#- 427 PublicMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam publicMakeFactorMyDefaultV4 \
    --namespace "$AB_NAMESPACE" \
    --factor 'amfbCbbW' \
    > test.out 2>&1
eval_tap $? 427 'PublicMakeFactorMyDefaultV4' test.out

#- 428 PublicGetMyOwnMFAStatusV4
./ng net.accelbyte.sdk.cli.Main iam publicGetMyOwnMFAStatusV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 428 'PublicGetMyOwnMFAStatusV4' test.out

#- 429 PublicGetMyMFAStatusV4
eval_tap 0 429 'PublicGetMyMFAStatusV4 # SKIP deprecated' test.out

#- 430 PublicGetUserPublicInfoByUserIdV4
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPublicInfoByUserIdV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'qiCH6T5b' \
    > test.out 2>&1
eval_tap $? 430 'PublicGetUserPublicInfoByUserIdV4' test.out

#- 431 PublicInviteUserV4
./ng net.accelbyte.sdk.cli.Main iam publicInviteUserV4 \
    --body '{"additionalData": "0x6KiM9X", "emailAddress": "P3TDoslR", "languageTag": "Qz9788LE", "namespace": "lvssNuwj", "namespaceDisplayName": "rBkaCK9x"}' \
    > test.out 2>&1
eval_tap $? 431 'PublicInviteUserV4' test.out

#- 432 PublicUpgradeHeadlessWithCodeV4Forward
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessWithCodeV4Forward \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "GaEJQ0Pf", "policyId": "5HjobF5h", "policyVersionId": "IpyQRUAP"}, {"isAccepted": false, "localizedPolicyVersionId": "Ka3JKHEl", "policyId": "FkAIdLCd", "policyVersionId": "O7MjAu0a"}, {"isAccepted": false, "localizedPolicyVersionId": "MbmN2m9j", "policyId": "QeBC4rXi", "policyVersionId": "CJJQux04"}], "code": "luP5yWei", "country": "Q6XsLzbD", "dateOfBirth": "ZkQMrfKC", "displayName": "UFIS2PP7", "emailAddress": "R0GMFReQ", "password": "jTee86vi", "reachMinimumAge": true, "uniqueDisplayName": "rROLe7Bd", "username": "Rf8rc5QW", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 432 'PublicUpgradeHeadlessWithCodeV4Forward' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
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
echo "1..418"

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
    --body '{"modules": [{"docLink": "o9sbQheG", "groups": [{"group": "RR2z2lUb", "groupId": "5c1i0G5l", "permissions": [{"allowedActions": [54, 58, 85], "resource": "HAmqDUGk"}, {"allowedActions": [63, 61, 35], "resource": "LIPbgxoD"}, {"allowedActions": [58, 71, 34], "resource": "vtVYFoFx"}]}, {"group": "qkOeritL", "groupId": "wmpxcStw", "permissions": [{"allowedActions": [77, 57, 58], "resource": "izyYyBXB"}, {"allowedActions": [90, 17, 96], "resource": "ZT2Kr7Nj"}, {"allowedActions": [78, 60, 29], "resource": "8b8ddBsR"}]}, {"group": "kbvVbMWq", "groupId": "x8MSGkef", "permissions": [{"allowedActions": [15, 74, 56], "resource": "CQuWDb5F"}, {"allowedActions": [99, 97, 96], "resource": "I5MK94nR"}, {"allowedActions": [16, 32, 94], "resource": "LJfYTESC"}]}], "module": "xvOQVe4E", "moduleId": "veD36Hyo"}, {"docLink": "Len9bRbw", "groups": [{"group": "FLEiZV95", "groupId": "4ijsDWZm", "permissions": [{"allowedActions": [72, 62, 59], "resource": "lOZOm0Ka"}, {"allowedActions": [14, 92, 45], "resource": "70YzOmiI"}, {"allowedActions": [47, 86, 100], "resource": "XsYWmPqL"}]}, {"group": "DQuzyl1k", "groupId": "imIT8ELS", "permissions": [{"allowedActions": [13, 33, 57], "resource": "5hm1xHoj"}, {"allowedActions": [89, 59, 61], "resource": "vsj3EPY5"}, {"allowedActions": [15, 29, 51], "resource": "pTib8U3R"}]}, {"group": "sl0fZq7l", "groupId": "O10IUjuE", "permissions": [{"allowedActions": [85, 36, 53], "resource": "RGVW4RxP"}, {"allowedActions": [18, 78, 61], "resource": "eiakm2mp"}, {"allowedActions": [34, 62, 64], "resource": "zZsWI3jr"}]}], "module": "lpJHHHUC", "moduleId": "csFrEAXZ"}, {"docLink": "cPBUpV7l", "groups": [{"group": "7fHE9tR0", "groupId": "JeND1753", "permissions": [{"allowedActions": [13, 73, 22], "resource": "6xJqlIPK"}, {"allowedActions": [14, 87, 73], "resource": "pECYkMii"}, {"allowedActions": [7, 69, 57], "resource": "PthaK7Rq"}]}, {"group": "y2fi6aIV", "groupId": "P7A6P4Sd", "permissions": [{"allowedActions": [43, 8, 62], "resource": "D38yJBUP"}, {"allowedActions": [65, 42, 87], "resource": "lScuPAWs"}, {"allowedActions": [8, 46, 96], "resource": "pUuM24SM"}]}, {"group": "5THWnBtR", "groupId": "lCbq9H3R", "permissions": [{"allowedActions": [47, 77, 100], "resource": "cxj0XMG6"}, {"allowedActions": [63, 27, 80], "resource": "lJwlsZCy"}, {"allowedActions": [35, 50, 36], "resource": "KuAq1mZJ"}]}], "module": "sTpx50Po", "moduleId": "rGDiAE2E"}]}' \
    > test.out 2>&1
eval_tap $? 109 'AdminUpdateAvailablePermissionsByModule' test.out

#- 110 AdminDeleteConfigPermissionsByGroup
./ng net.accelbyte.sdk.cli.Main iam adminDeleteConfigPermissionsByGroup \
    --forceDelete  \
    --body '{"groupId": "ZF2advEQ", "moduleId": "kcCrhNms"}' \
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
    --body '[{"field": "frisOil5", "validation": {"allowAllSpecialCharacters": true, "allowDigit": true, "allowLetter": false, "allowSpace": true, "allowUnicode": true, "avatarConfig": {"allowedPrefixes": ["YRaZPEDn", "uBOcLpfM", "HP5cnahe"], "preferRegex": false, "regex": "oUB9e7Xq"}, "blockedWord": ["DSey6meG", "ZXas0XSk", "4Rtetuaz"], "description": [{"language": "tcPTfrpU", "message": ["PB6TXs1a", "1Qfl7ZCL", "68LPRs7O"]}, {"language": "OTQ5wuNa", "message": ["VnF8EHpP", "WtZepmln", "hsHULN4M"]}, {"language": "dSYJeE0F", "message": ["WhCl0Lt0", "2jJXc2qw", "Mn7omAYO"]}], "isCustomRegex": false, "letterCase": "QwZd9Drw", "maxLength": 25, "maxRepeatingAlphaNum": 33, "maxRepeatingSpecialCharacter": 57, "minCharType": 79, "minLength": 71, "profanityFilter": "qHVLpaUv", "regex": "yUu7SzVa", "specialCharacterLocation": "aMkRnCBv", "specialCharacters": ["lVSkjVaZ", "OYxsR6Jy", "pQbnuh3y"]}}, {"field": "vepLJHkg", "validation": {"allowAllSpecialCharacters": false, "allowDigit": false, "allowLetter": true, "allowSpace": false, "allowUnicode": true, "avatarConfig": {"allowedPrefixes": ["xvqysAqE", "04BQDObw", "N10FZoXs"], "preferRegex": true, "regex": "p52v9VFU"}, "blockedWord": ["YME9Zwbo", "B90j7bnz", "ZmEuIt92"], "description": [{"language": "xASM5eLN", "message": ["pzxgDik9", "IdGGz1Wm", "XMNooaTp"]}, {"language": "3cXeTsrU", "message": ["mnHmRXZh", "SIUIHjmO", "qiMQwGMd"]}, {"language": "1rX6PINV", "message": ["mSRPYOjt", "XpbSMpcR", "nFAjBDiS"]}], "isCustomRegex": true, "letterCase": "3qEeZw59", "maxLength": 97, "maxRepeatingAlphaNum": 73, "maxRepeatingSpecialCharacter": 72, "minCharType": 27, "minLength": 4, "profanityFilter": "p3ZK3dqn", "regex": "BkKS9JMV", "specialCharacterLocation": "MWBOclyA", "specialCharacters": ["COPChFgf", "p1k0Be5x", "In3mNKsR"]}}, {"field": "jpG4hCZO", "validation": {"allowAllSpecialCharacters": false, "allowDigit": true, "allowLetter": false, "allowSpace": true, "allowUnicode": true, "avatarConfig": {"allowedPrefixes": ["P2aloNrV", "gk15uFQO", "pGryUc5D"], "preferRegex": true, "regex": "VhMd70qR"}, "blockedWord": ["baFn44ZS", "7tqAs5Ed", "xwWhc0K2"], "description": [{"language": "NziBJno1", "message": ["QVlkrl5I", "17DUvalP", "lQaBjKIM"]}, {"language": "u3jCO31Y", "message": ["yYsvgvqA", "8Ax1cYQY", "4CwmGdIH"]}, {"language": "nXff2mS8", "message": ["9SmkDuwB", "PU7O2ixV", "5MPJNaif"]}], "isCustomRegex": true, "letterCase": "469yDU4d", "maxLength": 39, "maxRepeatingAlphaNum": 84, "maxRepeatingSpecialCharacter": 72, "minCharType": 97, "minLength": 63, "profanityFilter": "YRmAh5u1", "regex": "guLVcA1Q", "specialCharacterLocation": "bCifcPCv", "specialCharacters": ["hk17sIaS", "1JYeNctl", "baPS5sNe"]}}]' \
    > test.out 2>&1
eval_tap $? 113 'AdminUpdateInputValidations' test.out

#- 114 AdminResetInputValidations
./ng net.accelbyte.sdk.cli.Main iam adminResetInputValidations \
    --field '1QQtmc1n' \
    > test.out 2>&1
eval_tap $? 114 'AdminResetInputValidations' test.out

#- 115 ListAdminsV3
./ng net.accelbyte.sdk.cli.Main iam listAdminsV3 \
    --namespace "$AB_NAMESPACE" \
    --after 'xiFiiefi' \
    --before '7XMmisbO' \
    --endDate 'hvgxXcAE' \
    --limit '100' \
    --query 'yc4OD9XN' \
    --roleId '1WRczHKN' \
    --startDate 'GGHC2h4w' \
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
    --body '{"ageRestriction": 94, "enable": true}' \
    > test.out 2>&1
eval_tap $? 117 'AdminUpdateAgeRestrictionConfigV3' test.out

#- 118 AdminGetListCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminGetListCountryAgeRestrictionV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 118 'AdminGetListCountryAgeRestrictionV3' test.out

#- 119 AdminUpdateCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateCountryAgeRestrictionV3 \
    --countryCode 'jAyBUgAn' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ageRestriction": 24}' \
    > test.out 2>&1
eval_tap $? 119 'AdminUpdateCountryAgeRestrictionV3' test.out

#- 120 AdminGetBannedUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType 'lcPY73H3' \
    --limit '54' \
    --offset '60' \
    > test.out 2>&1
eval_tap $? 120 'AdminGetBannedUsersV3' test.out

#- 121 AdminBanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"ban": "BMCftyck", "comment": "R2BZH5NX", "endDate": "QfBogJKa", "reason": "6TbPQ4jA", "skipNotif": true, "userIds": ["62po3vjF", "CjAlFIvk", "P5FxHub2"]}' \
    > test.out 2>&1
eval_tap $? 121 'AdminBanUserBulkV3' test.out

#- 122 AdminUnbanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminUnbanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"bans": [{"banId": "LnI7FwfX", "userId": "7MKlvzjQ"}, {"banId": "kCESlHOc", "userId": "GQs3IEnh"}, {"banId": "sAxru6aN", "userId": "Nr63Syjo"}]}' \
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
    --clientId '2ilM7Yxz' \
    --clientName 'aKJg9khn' \
    --clientType 'vUhQcDDU' \
    --limit '31' \
    --offset '63' \
    --skipLoginQueue  \
    > test.out 2>&1
eval_tap $? 124 'AdminGetClientsByNamespaceV3' test.out

#- 125 AdminBulkUpdateClientsV3
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateClientsV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientIds": ["jAqBArR4", "cdgRNVUH", "nhW6hdIv"], "clientUpdateRequest": {"audiences": ["SPfga2gK", "Lr4LbAnD", "EGPZj0Kl"], "baseUri": "KJfzmF0I", "clientName": "4YPzhXJU", "clientPermissions": [{"action": 69, "resource": "fazj639l", "schedAction": 66, "schedCron": "uGpru0Oz", "schedRange": ["CkTrItKr", "lxYlNL8r", "IYZUv8t5"]}, {"action": 39, "resource": "3kxMHRhm", "schedAction": 5, "schedCron": "7QfDIW9i", "schedRange": ["DzxygJT0", "NsPRexfd", "9k6ZG1fa"]}, {"action": 99, "resource": "JdupZxxz", "schedAction": 89, "schedCron": "DadeT7qE", "schedRange": ["uq0xI2qp", "NS3peCwG", "WquTNMKb"]}], "clientPlatform": "Z7eng4Ap", "deletable": false, "description": "Wx9WSanA", "modulePermissions": [{"moduleId": "PBDpocrz", "selectedGroups": [{"groupId": "gRhCBYyF", "selectedActions": [18, 62, 17]}, {"groupId": "lY35xGCw", "selectedActions": [60, 58, 37]}, {"groupId": "1Try783v", "selectedActions": [32, 72, 64]}]}, {"moduleId": "9efCSJTq", "selectedGroups": [{"groupId": "oyaLu4RN", "selectedActions": [68, 75, 60]}, {"groupId": "S8Y9FOgu", "selectedActions": [79, 55, 75]}, {"groupId": "Znwr7LIz", "selectedActions": [25, 96, 96]}]}, {"moduleId": "H74x4uma", "selectedGroups": [{"groupId": "5TWGEQwy", "selectedActions": [22, 49, 63]}, {"groupId": "qYO41CWV", "selectedActions": [49, 52, 15]}, {"groupId": "PDRtEoMi", "selectedActions": [97, 10, 1]}]}], "namespace": "6QJvrj5m", "oauthAccessTokenExpiration": 94, "oauthAccessTokenExpirationTimeUnit": "aOPMl8WZ", "oauthRefreshTokenExpiration": 66, "oauthRefreshTokenExpirationTimeUnit": "OKH2NzFo", "redirectUri": "DPqOZQwf", "scopes": ["ZtyQSPFG", "nL0PkWbm", "BRperbSl"], "skipLoginQueue": false, "twoFactorEnabled": false}}' \
    > test.out 2>&1
eval_tap $? 125 'AdminBulkUpdateClientsV3' test.out

#- 126 AdminCreateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateClientV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["cILr8V7c", "cLhiMxzf", "ABgRvDiY"], "baseUri": "bhJJfo3M", "clientId": "DJ0m50Zc", "clientName": "IODKNNBj", "clientPermissions": [{"action": 62, "resource": "g7ftJvIl", "schedAction": 25, "schedCron": "I5O3Yakg", "schedRange": ["1rajO8kk", "PkOS87yc", "zYBR81iK"]}, {"action": 28, "resource": "u98nhTEf", "schedAction": 25, "schedCron": "KXQAzWbu", "schedRange": ["sNa0nGR3", "NTer5yOx", "EIG6L7dT"]}, {"action": 27, "resource": "nbIo4dDZ", "schedAction": 79, "schedCron": "JELR4dVc", "schedRange": ["tyAm7F9N", "5hY3e5oL", "ajEd95W7"]}], "clientPlatform": "kpcTpzCP", "deletable": false, "description": "SZuXMOQK", "modulePermissions": [{"moduleId": "0yFFVdH0", "selectedGroups": [{"groupId": "pk2CfynU", "selectedActions": [76, 39, 39]}, {"groupId": "uwzVNIwq", "selectedActions": [72, 27, 98]}, {"groupId": "GcLLv4WD", "selectedActions": [54, 48, 90]}]}, {"moduleId": "cYGumhMV", "selectedGroups": [{"groupId": "Xe4An2xP", "selectedActions": [77, 97, 7]}, {"groupId": "4WkUCMYo", "selectedActions": [82, 96, 14]}, {"groupId": "YQvd351R", "selectedActions": [72, 63, 75]}]}, {"moduleId": "9S9SrUSo", "selectedGroups": [{"groupId": "oIOtAxwV", "selectedActions": [58, 6, 91]}, {"groupId": "E7fdurYZ", "selectedActions": [69, 59, 83]}, {"groupId": "xjfjyvZk", "selectedActions": [39, 2, 99]}]}], "namespace": "F5Z7UamV", "oauthAccessTokenExpiration": 10, "oauthAccessTokenExpirationTimeUnit": "PaVaVmMm", "oauthClientType": "WvjjMyxG", "oauthRefreshTokenExpiration": 27, "oauthRefreshTokenExpirationTimeUnit": "eZK8Ct12", "parentNamespace": "1MJtpD50", "redirectUri": "ZaWukO4n", "scopes": ["a9GyrmPx", "xSEbptuO", "NtsdtSZS"], "secret": "IvmUcGwH", "skipLoginQueue": false, "twoFactorEnabled": true}' \
    > test.out 2>&1
eval_tap $? 126 'AdminCreateClientV3' test.out

#- 127 AdminGetClientsbyNamespacebyIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetClientsbyNamespacebyIDV3 \
    --clientId 'CfnBLfVa' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 127 'AdminGetClientsbyNamespacebyIDV3' test.out

#- 128 AdminDeleteClientV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientV3 \
    --clientId '1FzC6MrN' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 128 'AdminDeleteClientV3' test.out

#- 129 AdminUpdateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientV3 \
    --clientId 'C3JdPzNe' \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["k0adQXpP", "sem7gjJi", "pcVNIMl8"], "baseUri": "jMCg5CTU", "clientName": "ZVrvGeN6", "clientPermissions": [{"action": 55, "resource": "K8xXjky6", "schedAction": 92, "schedCron": "t9rIW8zi", "schedRange": ["weCM2oZG", "GblbfHk0", "62eu4GFK"]}, {"action": 12, "resource": "fXJBPzXz", "schedAction": 52, "schedCron": "Fgt7MSyy", "schedRange": ["xowUZ8Dn", "bULe58qw", "3TwUvJXX"]}, {"action": 81, "resource": "aEEInHBR", "schedAction": 88, "schedCron": "ESzcG4Sr", "schedRange": ["Y34x96E4", "PCXIXBzH", "CSSV4piR"]}], "clientPlatform": "kXOASven", "deletable": true, "description": "TQwyhDTU", "modulePermissions": [{"moduleId": "zR0rI6dq", "selectedGroups": [{"groupId": "2VV50IoV", "selectedActions": [39, 28, 25]}, {"groupId": "gF0v1Jq1", "selectedActions": [89, 42, 53]}, {"groupId": "K7az07aA", "selectedActions": [11, 81, 30]}]}, {"moduleId": "97AJI0Zs", "selectedGroups": [{"groupId": "umk3atjG", "selectedActions": [53, 97, 29]}, {"groupId": "5sUj5JBv", "selectedActions": [78, 48, 10]}, {"groupId": "IkLWBLdn", "selectedActions": [48, 39, 27]}]}, {"moduleId": "KkOIuIRi", "selectedGroups": [{"groupId": "ggA8UcUs", "selectedActions": [68, 91, 55]}, {"groupId": "GaLCQzBH", "selectedActions": [45, 17, 87]}, {"groupId": "46MIQAuN", "selectedActions": [96, 20, 28]}]}], "namespace": "yedojA7g", "oauthAccessTokenExpiration": 15, "oauthAccessTokenExpirationTimeUnit": "8cWYmXz2", "oauthRefreshTokenExpiration": 29, "oauthRefreshTokenExpirationTimeUnit": "8Gc6xpW6", "redirectUri": "jF9KkMJO", "scopes": ["mzJd1rDu", "mx88quVy", "MfBxxKA5"], "skipLoginQueue": false, "twoFactorEnabled": false}' \
    > test.out 2>&1
eval_tap $? 129 'AdminUpdateClientV3' test.out

#- 130 AdminUpdateClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientPermissionV3 \
    --clientId 'n1buF29R' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 95, "resource": "LN6lwSpy"}, {"action": 24, "resource": "jxm8903H"}, {"action": 99, "resource": "gtXhNQvv"}]}' \
    > test.out 2>&1
eval_tap $? 130 'AdminUpdateClientPermissionV3' test.out

#- 131 AdminAddClientPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddClientPermissionsV3 \
    --clientId '7F50LA8q' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 77, "resource": "HiXtirk8"}, {"action": 28, "resource": "ePPpKdbR"}, {"action": 86, "resource": "nW4GoMZZ"}]}' \
    > test.out 2>&1
eval_tap $? 131 'AdminAddClientPermissionsV3' test.out

#- 132 AdminDeleteClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientPermissionV3 \
    --action '12' \
    --clientId 'DW9cBWXt' \
    --namespace "$AB_NAMESPACE" \
    --resource 'kxDNbwrf' \
    > test.out 2>&1
eval_tap $? 132 'AdminDeleteClientPermissionV3' test.out

#- 133 AdminGetConfigValueV3
./ng net.accelbyte.sdk.cli.Main iam adminGetConfigValueV3 \
    --configKey 'fMdwkjJJ' \
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
    --body '{"blacklist": ["jTjJdyVt", "SVjiQOfh", "rRGINzLl"]}' \
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
    --body '{"active": false, "roleIds": ["fuPnxdtE", "VD6vzMzY", "U8mRwHWx"]}' \
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
    --limit '7' \
    --offset '22' \
    > test.out 2>&1
eval_tap $? 141 'RetrieveAllSSOLoginPlatformCredentialV3' test.out

#- 142 RetrieveThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'w7kX3rvC' \
    > test.out 2>&1
eval_tap $? 142 'RetrieveThirdPartyLoginPlatformCredentialV3' test.out

#- 143 AddThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam addThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '33eA101P' \
    --body '{"ACSURL": "ZvwJhzs5", "AWSCognitoRegion": "7AHKsosT", "AWSCognitoUserPool": "DO4n1naz", "AllowedClients": ["O0kgiMap", "0gOu7EF6", "doI59ms6"], "AppId": "kFrYzCYe", "AuthorizationEndpoint": "aD8Kynxj", "ClientId": "237DkrO3", "EmptyStrFieldList": ["rRTThnkR", "vc0D5jGm", "5HnwiduS"], "EnableServerLicenseValidation": true, "Environment": "vTthFYQS", "FederationMetadataURL": "xM2wJBLf", "GenericOauthFlow": true, "IncludePUID": true, "IsActive": false, "Issuer": "BTOKWqHz", "JWKSEndpoint": "kNFBk6RP", "KeyID": "Ybop9J1A", "LogoURL": "qx57oMfK", "NetflixCertificates": {"encryptedPrivateKey": "cLAtKieR", "encryptedPrivateKeyName": "TkGjzGsT", "publicCertificate": "ibO074ph", "publicCertificateName": "y2QeDaqm", "rootCertificate": "0ZoD0XN1", "rootCertificateName": "BVTk3SQF"}, "OrganizationId": "VKgUGtIW", "PlatformName": "m1G2wLrO", "RedirectUri": "vx56jMel", "RegisteredDomains": [{"affectedClientIDs": ["lzSX10Fx", "ETeH4oBD", "ka18YiH3"], "domain": "NXIqjg6N", "namespaces": ["UsUZuirb", "xJx5TcL4", "3dqUecUQ"], "roleId": "jm9xFqWe"}, {"affectedClientIDs": ["XLlsAQKH", "oPPZpF1q", "lL2lFc2R"], "domain": "PFIEaHBc", "namespaces": ["ZVqUW7Hn", "AyZr3cJH", "ifnalYLc"], "roleId": "AMXs5LH0"}, {"affectedClientIDs": ["PiC6rrm5", "cuNMuchl", "ZFk78Wq3"], "domain": "O0aZ0yPU", "namespaces": ["O7fccXjA", "VhIwV5d6", "iwe5KC0B"], "roleId": "gVWPZ4vl"}], "Secret": "eki09XpL", "TeamID": "ELcQpADg", "TokenAuthenticationType": "VRN4TUFG", "TokenClaimsMapping": {"h8OGPFOj": "NxVO3G4Z", "qp1r4jw4": "9Xz1i7cJ", "ux9KMaJ3": "JTzNS86O"}, "TokenEndpoint": "j6JA2DQx", "UserInfoEndpoint": "sPKhW00z", "UserInfoHTTPMethod": "qZbd7BRG", "scopes": ["G8whgAZ3", "JVaplTxs", "st9pPCWU"]}' \
    > test.out 2>&1
eval_tap $? 143 'AddThirdPartyLoginPlatformCredentialV3' test.out

#- 144 DeleteThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'XHK35Wb3' \
    > test.out 2>&1
eval_tap $? 144 'DeleteThirdPartyLoginPlatformCredentialV3' test.out

#- 145 UpdateThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'tRbXiZMk' \
    --body '{"ACSURL": "r3zNG59j", "AWSCognitoRegion": "mMNe9QS7", "AWSCognitoUserPool": "QK9D8dGC", "AllowedClients": ["kIVOGVvH", "spItOTEo", "gLQ7L6qO"], "AppId": "k43SziQF", "AuthorizationEndpoint": "sq7KnJUG", "ClientId": "RylDE6er", "EmptyStrFieldList": ["N0ieTcly", "rMxQwYwF", "uIfL9kEg"], "EnableServerLicenseValidation": true, "Environment": "dpXhutMl", "FederationMetadataURL": "ygEHYqEG", "GenericOauthFlow": false, "IncludePUID": true, "IsActive": true, "Issuer": "I2vcw6xT", "JWKSEndpoint": "uM77aVdU", "KeyID": "KphHWN2s", "LogoURL": "QUOiZIdX", "NetflixCertificates": {"encryptedPrivateKey": "smzGNlkX", "encryptedPrivateKeyName": "fVsdsfCo", "publicCertificate": "VBGURGi5", "publicCertificateName": "yeuGkn5l", "rootCertificate": "XGNYbZWi", "rootCertificateName": "LDsUFXW8"}, "OrganizationId": "zGgnoK37", "PlatformName": "WvOPJ4GL", "RedirectUri": "A8Gh85vs", "RegisteredDomains": [{"affectedClientIDs": ["llpn2tMq", "M818avXY", "TO3Y4eQa"], "domain": "1CQNpsEr", "namespaces": ["W0jkK8Bk", "R0jz66VN", "vScV2Lpl"], "roleId": "fSOgkumP"}, {"affectedClientIDs": ["TMjY3BQV", "mvCWl6Pb", "7f8KOeGX"], "domain": "iKVSiAUM", "namespaces": ["uGSGjASo", "GTm0kZC5", "2x3ymPDR"], "roleId": "tmLoZjVp"}, {"affectedClientIDs": ["YUGqAsnt", "nTXRhjEm", "MX1oLTvB"], "domain": "41lIjOc6", "namespaces": ["Hq9g9F5o", "RTwlJwjY", "vgdUCkoM"], "roleId": "2ci7Thvz"}], "Secret": "TZsiK8Rn", "TeamID": "sbd4NX4T", "TokenAuthenticationType": "B9pzWQ4y", "TokenClaimsMapping": {"BH6QtEcX": "Tm7AEiNV", "wrl2LfMz": "eDVxgHaZ", "cZ6pqhlL": "813qomBj"}, "TokenEndpoint": "nHY9sR0V", "UserInfoEndpoint": "13N09LJe", "UserInfoHTTPMethod": "5jNa7ub9", "scopes": ["n7BmqGcE", "beSZHzs7", "Qk6exJkd"]}' \
    > test.out 2>&1
eval_tap $? 145 'UpdateThirdPartyLoginPlatformCredentialV3' test.out

#- 146 UpdateThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'aq8y5q7V' \
    --body '{"affectedClientIDs": ["lwpzMJmd", "9tAlZMQf", "atnmESIT"], "assignedNamespaces": ["l7SgkVy5", "sBAzA0gP", "RCF6CXt7"], "domain": "WSFXB7Lv", "roleId": "O5dRi9fW"}' \
    > test.out 2>&1
eval_tap $? 146 'UpdateThirdPartyLoginPlatformDomainV3' test.out

#- 147 DeleteThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '9lIBONG8' \
    --body '{"domain": "DgKGkLOt"}' \
    > test.out 2>&1
eval_tap $? 147 'DeleteThirdPartyLoginPlatformDomainV3' test.out

#- 148 RetrieveSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam retrieveSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'yfY9kWuB' \
    > test.out 2>&1
eval_tap $? 148 'RetrieveSSOLoginPlatformCredential' test.out

#- 149 AddSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam addSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'kb1CKj3m' \
    --body '{"acsUrl": "COAf0Igr", "apiKey": "Kymy7ZW5", "appId": "ZJyiEufb", "federationMetadataUrl": "4j5YPPBA", "isActive": false, "redirectUri": "si5YoW3L", "secret": "OZHAwk2r", "ssoUrl": "Otx6ucQM"}' \
    > test.out 2>&1
eval_tap $? 149 'AddSSOLoginPlatformCredential' test.out

#- 150 DeleteSSOLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteSSOLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'bKp04YGN' \
    > test.out 2>&1
eval_tap $? 150 'DeleteSSOLoginPlatformCredentialV3' test.out

#- 151 UpdateSSOPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam updateSSOPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'MJsaiJyb' \
    --body '{"acsUrl": "GVtitkWr", "apiKey": "Iz9XsBy2", "appId": "0DMfgdHn", "federationMetadataUrl": "AeDPstKj", "isActive": false, "redirectUri": "hLox6vcz", "secret": "v0yEr0os", "ssoUrl": "nHItcYIU"}' \
    > test.out 2>&1
eval_tap $? 151 'UpdateSSOPlatformCredential' test.out

#- 152 AdminListUserIDByPlatformUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByPlatformUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'yjiKRPOr' \
    --rawPID  \
    --rawPUID  \
    --body '{"platformUserIds": ["EEY1LEU6", "8THr0I47", "s0EsJmHx"]}' \
    > test.out 2>&1
eval_tap $? 152 'AdminListUserIDByPlatformUserIDsV3' test.out

#- 153 AdminGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'DjdE21hz' \
    --platformUserId 'd5iYaEuL' \
    > test.out 2>&1
eval_tap $? 153 'AdminGetUserByPlatformUserIDV3' test.out

#- 154 AdminGetProfileUpdateStrategyV3
./ng net.accelbyte.sdk.cli.Main iam adminGetProfileUpdateStrategyV3 \
    --namespace "$AB_NAMESPACE" \
    --field 'dob' \
    > test.out 2>&1
eval_tap $? 154 'AdminGetProfileUpdateStrategyV3' test.out

#- 155 AdminUpdateProfileUpdateStrategyV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateProfileUpdateStrategyV3 \
    --namespace "$AB_NAMESPACE" \
    --field 'username' \
    --body '{"config": {"minimumAllowedInterval": 72}, "type": "LyeWi8JA"}' \
    > test.out 2>&1
eval_tap $? 155 'AdminUpdateProfileUpdateStrategyV3' test.out

#- 156 AdminGetRoleOverrideConfigV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleOverrideConfigV3 \
    --namespace "$AB_NAMESPACE" \
    --identity 'VIEW_ONLY' \
    > test.out 2>&1
eval_tap $? 156 'AdminGetRoleOverrideConfigV3' test.out

#- 157 AdminUpdateRoleOverrideConfigV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleOverrideConfigV3 \
    --namespace "$AB_NAMESPACE" \
    --identity 'USER' \
    --body '{"additions": [{"actions": [95, 75, 26], "resource": "iylmP0Oc"}, {"actions": [89, 4, 27], "resource": "Cha4zEpc"}, {"actions": [53, 53, 47], "resource": "BBTprpkt"}], "exclusions": [{"actions": [25, 6, 96], "resource": "TbUEYOXX"}, {"actions": [16, 5, 76], "resource": "kGTcQTMW"}, {"actions": [93, 51, 14], "resource": "g52tYR8H"}], "overrides": [{"actions": [18, 72, 44], "resource": "MhDkByQU"}, {"actions": [85, 54, 98], "resource": "ANndf9WJ"}, {"actions": [39, 92, 35], "resource": "nT8Oik6t"}], "replacements": [{"replacement": {"actions": [31, 55, 25], "resource": "AobSr2yT"}, "target": "bgaqvajf"}, {"replacement": {"actions": [91, 100, 49], "resource": "Vg8M7xz5"}, "target": "bBC2ul6O"}, {"replacement": {"actions": [55, 1, 57], "resource": "FSQTmeuk"}, "target": "W4yyhIJf"}]}' \
    > test.out 2>&1
eval_tap $? 157 'AdminUpdateRoleOverrideConfigV3' test.out

#- 158 AdminGetRoleSourceV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleSourceV3 \
    --namespace "$AB_NAMESPACE" \
    --identity 'USER' \
    > test.out 2>&1
eval_tap $? 158 'AdminGetRoleSourceV3' test.out

#- 159 AdminChangeRoleOverrideConfigStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminChangeRoleOverrideConfigStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --identity 'USER' \
    --body '{"active": false}' \
    > test.out 2>&1
eval_tap $? 159 'AdminChangeRoleOverrideConfigStatusV3' test.out

#- 160 AdminGetRoleNamespacePermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleNamespacePermissionV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'xGjyY0zH' \
    > test.out 2>&1
eval_tap $? 160 'AdminGetRoleNamespacePermissionV3' test.out

#- 161 GetAdminUsersByRoleIdV3
./ng net.accelbyte.sdk.cli.Main iam getAdminUsersByRoleIdV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'S60l1egt' \
    --after '39' \
    --before '83' \
    --limit '51' \
    > test.out 2>&1
eval_tap $? 161 'GetAdminUsersByRoleIdV3' test.out

#- 162 AdminGetUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --emailAddress 'FuXDXyPz' \
    > test.out 2>&1
eval_tap $? 162 'AdminGetUserByEmailAddressV3' test.out

#- 163 AdminBulkUpdateUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"updateRequest": {"skipLoginQueue": false}, "userIds": ["VjG5cPtt", "Ru7lIAXJ", "RK9KI8Fu"]}' \
    > test.out 2>&1
eval_tap $? 163 'AdminBulkUpdateUsersV3' test.out

#- 164 AdminGetBulkUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType 'fBftr16N' \
    --body '{"bulkUserId": ["d0xiOBZF", "51SAPFTJ", "ywxRrlZk"]}' \
    > test.out 2>&1
eval_tap $? 164 'AdminGetBulkUserBanV3' test.out

#- 165 AdminListUserIDByUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["3jnKnEBw", "bWCEuly5", "UIyzPv4k"]}' \
    > test.out 2>&1
eval_tap $? 165 'AdminListUserIDByUserIDsV3' test.out

#- 166 AdminBulkGetUsersPlatform
./ng net.accelbyte.sdk.cli.Main iam adminBulkGetUsersPlatform \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["IyvFY79V", "Y8mxFqjk", "v2DeKYyl"]}' \
    > test.out 2>&1
eval_tap $? 166 'AdminBulkGetUsersPlatform' test.out

#- 167 AdminInviteUserV3
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddresses": ["74MTm9bw", "xCQOF8up", "nEHiL6BD"], "isAdmin": true, "languageTag": "TV7SlUvS", "namespace": "h5IiN0Ja", "roles": ["yLEwOQrb", "NNWZm7eH", "rHwxCWrR"]}' \
    > test.out 2>&1
eval_tap $? 167 'AdminInviteUserV3' test.out

#- 168 AdminQueryThirdPlatformLinkHistoryV3
./ng net.accelbyte.sdk.cli.Main iam adminQueryThirdPlatformLinkHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '45' \
    --offset '32' \
    --platformUserId 'hGsoBJzz' \
    --platformId 'kK24bOJ0' \
    > test.out 2>&1
eval_tap $? 168 'AdminQueryThirdPlatformLinkHistoryV3' test.out

#- 169 AdminListUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminListUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '6' \
    --offset '52' \
    > test.out 2>&1
eval_tap $? 169 'AdminListUsersV3' test.out

#- 170 AdminSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam adminSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'zt6tyxzB' \
    --endDate 'NwESRMvS' \
    --includeTotal  \
    --limit '15' \
    --offset '84' \
    --platformBy 'GiQZohxw' \
    --platformId 'C02aImKa' \
    --query 'je7cBVwJ' \
    --roleIds 'bRof7UHg' \
    --skipLoginQueue  \
    --startDate 'sDA7T0X1' \
    --testAccount  \
    > test.out 2>&1
eval_tap $? 170 'AdminSearchUserV3' test.out

#- 171 AdminGetBulkUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"listEmailAddressRequest": ["0wjG8S0f", "qSflYyU4", "lz2ZdvBU"]}' \
    > test.out 2>&1
eval_tap $? 171 'AdminGetBulkUserByEmailAddressV3' test.out

#- 172 AdminGetUserByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'YHiqPRB2' \
    > test.out 2>&1
eval_tap $? 172 'AdminGetUserByUserIdV3' test.out

#- 173 AdminUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'BeBb74jK' \
    --body '{"avatarUrl": "f0RTnozt", "country": "MvnXzs6T", "dateOfBirth": "9pOBd3lS", "displayName": "YOyF6Mfa", "languageTag": "iVegY3YM", "skipLoginQueue": false, "uniqueDisplayName": "c04mrJQO", "userName": "5wJ8JhjK"}' \
    > test.out 2>&1
eval_tap $? 173 'AdminUpdateUserV3' test.out

#- 174 AdminGetUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'DckBG6VH' \
    --activeOnly  \
    --after 'miUtWPjI' \
    --before '50dPjHdy' \
    --limit '32' \
    > test.out 2>&1
eval_tap $? 174 'AdminGetUserBanV3' test.out

#- 175 AdminBanUserV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'tZY4Y8yy' \
    --body '{"ban": "P6cIRPLV", "comment": "H8REI3kx", "endDate": "pqy3vtP8", "reason": "XEH1oTgs", "skipNotif": false}' \
    > test.out 2>&1
eval_tap $? 175 'AdminBanUserV3' test.out

#- 176 AdminGetUserBanSummaryV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanSummaryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Kk3gtgJo' \
    > test.out 2>&1
eval_tap $? 176 'AdminGetUserBanSummaryV3' test.out

#- 177 AdminUpdateUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserBanV3 \
    --banId 'INdk4gRQ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'D3u0a3I6' \
    --body '{"enabled": false, "skipNotif": true}' \
    > test.out 2>&1
eval_tap $? 177 'AdminUpdateUserBanV3' test.out

#- 178 AdminSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'cPHPot5Z' \
    --body '{"context": "AyVVF7rA", "emailAddress": "XDf4SDRc", "languageTag": "RhUoONPy"}' \
    > test.out 2>&1
eval_tap $? 178 'AdminSendVerificationCodeV3' test.out

#- 179 AdminVerifyAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'sKcD0nQC' \
    --body '{"Code": "LD8zOA0j", "ContactType": "hCRv4IOC", "LanguageTag": "AqZ1t4hb", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 179 'AdminVerifyAccountV3' test.out

#- 180 GetUserVerificationCode
./ng net.accelbyte.sdk.cli.Main iam getUserVerificationCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'DAa0J4Rn' \
    > test.out 2>&1
eval_tap $? 180 'GetUserVerificationCode' test.out

#- 181 AdminGetUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'sh25IYl3' \
    > test.out 2>&1
eval_tap $? 181 'AdminGetUserDeletionStatusV3' test.out

#- 182 AdminUpdateUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'M89Cc0LS' \
    --body '{"deletionDate": 69, "enabled": true}' \
    > test.out 2>&1
eval_tap $? 182 'AdminUpdateUserDeletionStatusV3' test.out

#- 183 AdminListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '63PH2dE1' \
    > test.out 2>&1
eval_tap $? 183 'AdminListUserAllPlatformAccountsDistinctV3' test.out

#- 184 AdminUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'pvynIM4e' \
    --body '{"code": "CbV29Whb", "country": "ANRxkEcz", "dateOfBirth": "IQZXBqC4", "displayName": "D3E6xeUl", "emailAddress": "V7wEpawK", "password": "8pjgqhpp", "uniqueDisplayName": "Rua4npH2", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 184 'AdminUpgradeHeadlessAccountV3' test.out

#- 185 AdminDeleteUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'sfQ1gbxX' \
    > test.out 2>&1
eval_tap $? 185 'AdminDeleteUserInformationV3' test.out

#- 186 AdminGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Et1j8GDO' \
    --after '0.8278462056089649' \
    --before '0.10512693870328349' \
    --limit '44' \
    > test.out 2>&1
eval_tap $? 186 'AdminGetUserLoginHistoriesV3' test.out

#- 187 AdminResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam adminResetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Yn1uoknS' \
    --body '{"languageTag": "6yVdlBNL", "mfaToken": "HL9bEuf5", "newPassword": "q2XXnXjs", "oldPassword": "BV5IJdGQ"}' \
    > test.out 2>&1
eval_tap $? 187 'AdminResetPasswordV3' test.out

#- 188 AdminUpdateUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserPermissionV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'MjH9K3Rw' \
    --body '{"Permissions": [{"Action": 99, "Resource": "nAGjgqoV", "SchedAction": 60, "SchedCron": "aoCsAsT3", "SchedRange": ["EnlaU799", "p9qDEfxS", "AIph62FO"]}, {"Action": 39, "Resource": "ewPyuEAw", "SchedAction": 41, "SchedCron": "GEynGhDf", "SchedRange": ["cmNWMJmM", "mZxeBkd4", "2rQHD4Cq"]}, {"Action": 25, "Resource": "VNwMtk9Y", "SchedAction": 89, "SchedCron": "VunDeQBf", "SchedRange": ["Pj4J2FjS", "7toETPNG", "75Eylnqh"]}]}' \
    > test.out 2>&1
eval_tap $? 188 'AdminUpdateUserPermissionV3' test.out

#- 189 AdminAddUserPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserPermissionsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ahkrG5Z2' \
    --body '{"Permissions": [{"Action": 12, "Resource": "mHhdQDa7", "SchedAction": 63, "SchedCron": "MZ5qWHoL", "SchedRange": ["DQOpBOpj", "c9DfHEZK", "YLx94gMs"]}, {"Action": 88, "Resource": "YukKYFmf", "SchedAction": 80, "SchedCron": "jcimJC1V", "SchedRange": ["lbbIVKy4", "ZaExOkOu", "QbDIdDOM"]}, {"Action": 84, "Resource": "eWneBqll", "SchedAction": 42, "SchedCron": "sF40eJiV", "SchedRange": ["lBQCtlcR", "k8RAbNA6", "7q4Ogy3F"]}]}' \
    > test.out 2>&1
eval_tap $? 189 'AdminAddUserPermissionsV3' test.out

#- 190 AdminDeleteUserPermissionBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'SAMkAlhY' \
    --body '[{"Action": 35, "Resource": "ib3zvPIS"}, {"Action": 35, "Resource": "3Wxi3toZ"}, {"Action": 16, "Resource": "AvRLBWnB"}]' \
    > test.out 2>&1
eval_tap $? 190 'AdminDeleteUserPermissionBulkV3' test.out

#- 191 AdminDeleteUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionV3 \
    --action '52' \
    --namespace "$AB_NAMESPACE" \
    --resource 'mTUxEZUC' \
    --userId '7B69pZkh' \
    > test.out 2>&1
eval_tap $? 191 'AdminDeleteUserPermissionV3' test.out

#- 192 AdminGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '3w0dPoXo' \
    --after 'c2Tamo2A' \
    --before 'AINn9a4s' \
    --limit '49' \
    --platformId 'PXXdBmJQ' \
    --targetNamespace 'u8FqpU6g' \
    > test.out 2>&1
eval_tap $? 192 'AdminGetUserPlatformAccountsV3' test.out

#- 193 AdminListAllDistinctPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminListAllDistinctPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'XTI3SUJY' \
    --status 'a0nL6Et1' \
    > test.out 2>&1
eval_tap $? 193 'AdminListAllDistinctPlatformAccountsV3' test.out

#- 194 AdminGetListJusticePlatformAccounts
./ng net.accelbyte.sdk.cli.Main iam adminGetListJusticePlatformAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'BhNYjbC7' \
    > test.out 2>&1
eval_tap $? 194 'AdminGetListJusticePlatformAccounts' test.out

#- 195 AdminGetUserMapping
./ng net.accelbyte.sdk.cli.Main iam adminGetUserMapping \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'rHMClJCU' \
    --userId 'zAyVTk4X' \
    > test.out 2>&1
eval_tap $? 195 'AdminGetUserMapping' test.out

#- 196 AdminCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam adminCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace '8HGfaLiF' \
    --userId 'A4qGm86a' \
    > test.out 2>&1
eval_tap $? 196 'AdminCreateJusticeUser' test.out

#- 197 AdminLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId '57htGhfN' \
    --skipConflict  \
    --body '{"platformId": "hxaY9WLf", "platformUserId": "N9MUVvrj"}' \
    > test.out 2>&1
eval_tap $? 197 'AdminLinkPlatformAccount' test.out

#- 198 AdminGetUserLinkHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLinkHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'QycJYE1b' \
    --platformId 'XyapY3j5' \
    > test.out 2>&1
eval_tap $? 198 'AdminGetUserLinkHistoriesV3' test.out

#- 199 AdminPlatformUnlinkV3
eval_tap 0 199 'AdminPlatformUnlinkV3 # SKIP deprecated' test.out

#- 200 AdminPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'JyqI4Crc' \
    --userId 'UpcTRHR4' \
    > test.out 2>&1
eval_tap $? 200 'AdminPlatformUnlinkAllV3' test.out

#- 201 AdminPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'fdCYF2dp' \
    --userId '22rtqhxS' \
    --ticket 'SyuyzCbH' \
    > test.out 2>&1
eval_tap $? 201 'AdminPlatformLinkV3' test.out

#- 202 AdminDeleteUserLinkingHistoryByPlatformIDV3
eval_tap 0 202 'AdminDeleteUserLinkingHistoryByPlatformIDV3 # SKIP deprecated' test.out

#- 203 AdminDeleteUserLinkingRestrictionByPlatformIDV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserLinkingRestrictionByPlatformIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'OadGFNZ1' \
    --userId 'Jjhv3Xpz' \
    > test.out 2>&1
eval_tap $? 203 'AdminDeleteUserLinkingRestrictionByPlatformIDV3' test.out

#- 204 AdminGetThirdPartyPlatformTokenLinkStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetThirdPartyPlatformTokenLinkStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'z2kffWi0' \
    --userId '1hF8dtjj' \
    --platformToken 't6qCjMc5' \
    > test.out 2>&1
eval_tap $? 204 'AdminGetThirdPartyPlatformTokenLinkStatusV3' test.out

#- 205 AdminGetUserSinglePlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminGetUserSinglePlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --platformId '4SBnL8vV' \
    --userId 'zQSGyVUi' \
    --crossNamespace  \
    > test.out 2>&1
eval_tap $? 205 'AdminGetUserSinglePlatformAccount' test.out

#- 206 AdminDeleteUserRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRolesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'PSHgZQWK' \
    --body '["gewT9rn5", "6iPA8yKk", "5LGybwbG"]' \
    > test.out 2>&1
eval_tap $? 206 'AdminDeleteUserRolesV3' test.out

#- 207 AdminSaveUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminSaveUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'DxmuzKgL' \
    --body '[{"namespace": "U2PzpQsT", "roleId": "O9I86WTG"}, {"namespace": "Y65kI0su", "roleId": "Rd39QL9z"}, {"namespace": "OpAVFYkI", "roleId": "Dr7WHu1x"}]' \
    > test.out 2>&1
eval_tap $? 207 'AdminSaveUserRoleV3' test.out

#- 208 AdminAddUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'ZA9OFu0F' \
    --userId 'GqaB0H4F' \
    > test.out 2>&1
eval_tap $? 208 'AdminAddUserRoleV3' test.out

#- 209 AdminDeleteUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'OYVKUZpD' \
    --userId 'M6Zqk7l2' \
    > test.out 2>&1
eval_tap $? 209 'AdminDeleteUserRoleV3' test.out

#- 210 AdminUpdateUserStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'D42f54ry' \
    --body '{"enabled": true, "reason": "3WUg7z0L"}' \
    > test.out 2>&1
eval_tap $? 210 'AdminUpdateUserStatusV3' test.out

#- 211 AdminTrustlyUpdateUserIdentity
./ng net.accelbyte.sdk.cli.Main iam adminTrustlyUpdateUserIdentity \
    --namespace "$AB_NAMESPACE" \
    --userId '4Pcrp2Ic' \
    --body '{"emailAddress": "xXmrQzB4", "password": "6mnEid9o"}' \
    > test.out 2>&1
eval_tap $? 211 'AdminTrustlyUpdateUserIdentity' test.out

#- 212 AdminVerifyUserWithoutVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyUserWithoutVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'I76bJGTk' \
    > test.out 2>&1
eval_tap $? 212 'AdminVerifyUserWithoutVerificationCodeV3' test.out

#- 213 AdminUpdateClientSecretV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientSecretV3 \
    --clientId 'O5sjBA1N' \
    --namespace "$AB_NAMESPACE" \
    --body '{"newSecret": "UgDHKqw2"}' \
    > test.out 2>&1
eval_tap $? 213 'AdminUpdateClientSecretV3' test.out

#- 214 AdminCheckThirdPartyLoginPlatformAvailabilityV3
./ng net.accelbyte.sdk.cli.Main iam adminCheckThirdPartyLoginPlatformAvailabilityV3 \
    --platformId 'o2HPIMji' \
    > test.out 2>&1
eval_tap $? 214 'AdminCheckThirdPartyLoginPlatformAvailabilityV3' test.out

#- 215 AdminGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV3 \
    --after 'OqlbFz5u' \
    --before 'X6lryBqZ' \
    --isWildcard  \
    --limit '32' \
    > test.out 2>&1
eval_tap $? 215 'AdminGetRolesV3' test.out

#- 216 AdminCreateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV3 \
    --body '{"adminRole": true, "deletable": false, "isWildcard": true, "managers": [{"displayName": "73InqoKa", "namespace": "ygrcCG3e", "userId": "MaaQG7ve"}, {"displayName": "cVlwWbLs", "namespace": "OolvHqQ6", "userId": "IyrECHQF"}, {"displayName": "6ykUOze4", "namespace": "vvWGbgQH", "userId": "S3SYbapr"}], "members": [{"displayName": "4UqpE6I5", "namespace": "QaKrJkrr", "userId": "O5UZTsMl"}, {"displayName": "qZTjyvFi", "namespace": "m5lsl36A", "userId": "Nsxkl49q"}, {"displayName": "U0IES3ol", "namespace": "YmEvCzl6", "userId": "A5TJ4hAt"}], "permissions": [{"action": 93, "resource": "rq96myGH", "schedAction": 26, "schedCron": "wOxBhTbK", "schedRange": ["FKl6M98d", "DBUQdXAK", "CRCdh9lc"]}, {"action": 21, "resource": "sru4WnUK", "schedAction": 1, "schedCron": "pnHODJGq", "schedRange": ["CqhTIpqy", "9dhk1ITm", "cZvUKAxC"]}, {"action": 75, "resource": "8epPmCV4", "schedAction": 2, "schedCron": "VWjUO7p7", "schedRange": ["r3QZTaNp", "JnAQ2SVv", "4R0uLL8o"]}], "roleName": "qlaqmPwC"}' \
    > test.out 2>&1
eval_tap $? 216 'AdminCreateRoleV3' test.out

#- 217 AdminGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV3 \
    --roleId '3vityNlF' \
    > test.out 2>&1
eval_tap $? 217 'AdminGetRoleV3' test.out

#- 218 AdminDeleteRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV3 \
    --roleId '1MDYRRPN' \
    > test.out 2>&1
eval_tap $? 218 'AdminDeleteRoleV3' test.out

#- 219 AdminUpdateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV3 \
    --roleId 'FuGtp2Mj' \
    --body '{"deletable": false, "isWildcard": false, "roleName": "PBUUvsOV"}' \
    > test.out 2>&1
eval_tap $? 219 'AdminUpdateRoleV3' test.out

#- 220 AdminGetRoleAdminStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleAdminStatusV3 \
    --roleId 'XbojkxCi' \
    > test.out 2>&1
eval_tap $? 220 'AdminGetRoleAdminStatusV3' test.out

#- 221 AdminUpdateAdminRoleStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateAdminRoleStatusV3 \
    --roleId '1pP25eMe' \
    > test.out 2>&1
eval_tap $? 221 'AdminUpdateAdminRoleStatusV3' test.out

#- 222 AdminRemoveRoleAdminV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleAdminV3 \
    --roleId 't1MM0sEQ' \
    > test.out 2>&1
eval_tap $? 222 'AdminRemoveRoleAdminV3' test.out

#- 223 AdminGetRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleManagersV3 \
    --roleId 'KtatfbgZ' \
    --after 'DUQdifzy' \
    --before 'LmxfCAWR' \
    --limit '0' \
    > test.out 2>&1
eval_tap $? 223 'AdminGetRoleManagersV3' test.out

#- 224 AdminAddRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleManagersV3 \
    --roleId 'JMpgsTxv' \
    --body '{"managers": [{"displayName": "X9LhH06u", "namespace": "7sHWiVwy", "userId": "TTk5QGeG"}, {"displayName": "TF6jrzwM", "namespace": "sNiyAVk9", "userId": "PrUgvbxZ"}, {"displayName": "Z6eJ7Xoq", "namespace": "sFnNqWhh", "userId": "tbdHJZRL"}]}' \
    > test.out 2>&1
eval_tap $? 224 'AdminAddRoleManagersV3' test.out

#- 225 AdminRemoveRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleManagersV3 \
    --roleId 'vGZePMql' \
    --body '{"managers": [{"displayName": "zu7uxjYf", "namespace": "1Nz48Rog", "userId": "jHzbgjHt"}, {"displayName": "1wfd0EJW", "namespace": "iIhQPWfK", "userId": "0KAOgonH"}, {"displayName": "wVUv6FzG", "namespace": "lK9vAU45", "userId": "ifNG52yY"}]}' \
    > test.out 2>&1
eval_tap $? 225 'AdminRemoveRoleManagersV3' test.out

#- 226 AdminGetRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleMembersV3 \
    --roleId 'eWlkmv3S' \
    --after 'R6ZgUX64' \
    --before 'qkOKk7C2' \
    --limit '93' \
    > test.out 2>&1
eval_tap $? 226 'AdminGetRoleMembersV3' test.out

#- 227 AdminAddRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleMembersV3 \
    --roleId 'm4g4JVI4' \
    --body '{"members": [{"displayName": "NuWVp8ea", "namespace": "CmFiMXv8", "userId": "w2NLXz6k"}, {"displayName": "7vTOxS9L", "namespace": "JoibYOoz", "userId": "RXefqBVc"}, {"displayName": "PSV9v2Wk", "namespace": "QPxlHnHv", "userId": "RKS4QHPB"}]}' \
    > test.out 2>&1
eval_tap $? 227 'AdminAddRoleMembersV3' test.out

#- 228 AdminRemoveRoleMembersV3
eval_tap 0 228 'AdminRemoveRoleMembersV3 # SKIP deprecated' test.out

#- 229 AdminUpdateRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV3 \
    --roleId 'sYAfFToX' \
    --body '{"permissions": [{"action": 0, "resource": "s4WbpiSE", "schedAction": 23, "schedCron": "87rm0haf", "schedRange": ["AOuJqsbQ", "LurrtNwc", "xWe3TnEo"]}, {"action": 78, "resource": "nimiHyAn", "schedAction": 2, "schedCron": "94pqZFWD", "schedRange": ["uQCcVlFV", "js1mkrHQ", "sLfQNR0w"]}, {"action": 81, "resource": "Uvd2W3o2", "schedAction": 56, "schedCron": "7N9mvhXN", "schedRange": ["fTfvsPbO", "0v25fSt7", "vGq3cwKY"]}]}' \
    > test.out 2>&1
eval_tap $? 229 'AdminUpdateRolePermissionsV3' test.out

#- 230 AdminAddRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV3 \
    --roleId 'D2dmUSC1' \
    --body '{"permissions": [{"action": 43, "resource": "1VEZ17bP", "schedAction": 50, "schedCron": "Ob2gKr7v", "schedRange": ["urGKz5Qi", "VFpnkFrO", "9RD3e70w"]}, {"action": 76, "resource": "es2nnIWe", "schedAction": 47, "schedCron": "4M4Rziqn", "schedRange": ["H5xzt5Az", "IWAP4LWR", "y8FlWl3c"]}, {"action": 64, "resource": "6FR9725j", "schedAction": 10, "schedCron": "LBVmvNfB", "schedRange": ["Tu2COnpm", "jvlC6wit", "4ARUaQre"]}]}' \
    > test.out 2>&1
eval_tap $? 230 'AdminAddRolePermissionsV3' test.out

#- 231 AdminDeleteRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV3 \
    --roleId '4IEq9UKx' \
    --body '["7m7Lujeo", "eyHOqbzf", "3SbNI9C2"]' \
    > test.out 2>&1
eval_tap $? 231 'AdminDeleteRolePermissionsV3' test.out

#- 232 AdminDeleteRolePermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionV3 \
    --action '66' \
    --resource '0HlSQX3u' \
    --roleId '5nR2rBlR' \
    > test.out 2>&1
eval_tap $? 232 'AdminDeleteRolePermissionV3' test.out

#- 233 AdminGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam adminGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 233 'AdminGetMyUserV3' test.out

#- 234 UserAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam userAuthenticationV3 \
    --clientId 'WaCiHDBf' \
    --extendExp  \
    --redirectUri 'd2572NX2' \
    --password 'SkR7Lthj' \
    --requestId 'cQtvULcU' \
    --userName 'CmejIYO5' \
    > test.out 2>&1
eval_tap $? 234 'UserAuthenticationV3' test.out

#- 235 AuthenticationWithPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV3 \
    --extendExp  \
    --clientId 'RR8hJsrw' \
    --linkingToken 'NSrIh6zn' \
    --password 'mhfXYUqP' \
    --username 'izNhqu03' \
    > test.out 2>&1
eval_tap $? 235 'AuthenticationWithPlatformLinkV3' test.out

#- 236 GenerateTokenByNewHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV3 \
    --additionalData 'UaBYwOWA' \
    --extendExp  \
    --linkingToken '8tKECMiO' \
    > test.out 2>&1
eval_tap $? 236 'GenerateTokenByNewHeadlessAccountV3' test.out

#- 237 RequestOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam requestOneTimeLinkingCodeV3 \
    --platformId 'iiDvFXqG' \
    > test.out 2>&1
eval_tap $? 237 'RequestOneTimeLinkingCodeV3' test.out

#- 238 ValidateOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam validateOneTimeLinkingCodeV3 \
    --oneTimeLinkCode 'L672SwAZ' \
    > test.out 2>&1
eval_tap $? 238 'ValidateOneTimeLinkingCodeV3' test.out

#- 239 RequestTokenByOneTimeLinkCodeResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTokenByOneTimeLinkCodeResponseV3 \
    --additionalData '0y8YXbk2' \
    --isTransient  \
    --clientId 'hrXxBlQQ' \
    --oneTimeLinkCode 'inNQQJZ2' \
    > test.out 2>&1
eval_tap $? 239 'RequestTokenByOneTimeLinkCodeResponseV3' test.out

#- 240 GetCountryLocationV3
./ng net.accelbyte.sdk.cli.Main iam getCountryLocationV3 \
    > test.out 2>&1
eval_tap $? 240 'GetCountryLocationV3' test.out

#- 241 Logout
./ng net.accelbyte.sdk.cli.Main iam logout \
    > test.out 2>&1
eval_tap $? 241 'Logout' test.out

#- 242 RequestTokenExchangeCodeV3
./ng net.accelbyte.sdk.cli.Main iam requestTokenExchangeCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --codeChallenge 'JWaI16c8' \
    --codeChallengeMethod 'S256' \
    --clientId 'SVqOHCRF' \
    > test.out 2>&1
eval_tap $? 242 'RequestTokenExchangeCodeV3' test.out

#- 243 AdminRetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam adminRetrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Phx2GMzY' \
    --userId 'AT6x1jk3' \
    --platformUserId 'cQWrSsKv' \
    > test.out 2>&1
eval_tap $? 243 'AdminRetrieveUserThirdPartyPlatformTokenV3' test.out

#- 244 RevokeUserV3
./ng net.accelbyte.sdk.cli.Main iam revokeUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '6KgO6f8d' \
    --includeGameNamespace  \
    > test.out 2>&1
eval_tap $? 244 'RevokeUserV3' test.out

#- 245 AuthorizeV3
./ng net.accelbyte.sdk.cli.Main iam authorizeV3 \
    --codeChallenge 'xP98ULyn' \
    --codeChallengeMethod 'plain' \
    --createHeadless  \
    --oneTimeLinkCode 'hFMYhGgC' \
    --redirectUri '7cyDmyFO' \
    --scope 'LAGR19Sl' \
    --state 'm1Or2ZJJ' \
    --targetAuthPage '3cqZGJxs' \
    --useRedirectUriAsLoginUrlWhenLocked  \
    --clientId 'sCNn5nV0' \
    --responseType 'code' \
    > test.out 2>&1
eval_tap $? 245 'AuthorizeV3' test.out

#- 246 TokenIntrospectionV3
./ng net.accelbyte.sdk.cli.Main iam tokenIntrospectionV3 \
    --token 'PH2WPpg1' \
    > test.out 2>&1
eval_tap $? 246 'TokenIntrospectionV3' test.out

#- 247 GetJWKSV3
./ng net.accelbyte.sdk.cli.Main iam getJWKSV3 \
    > test.out 2>&1
eval_tap $? 247 'GetJWKSV3' test.out

#- 248 SendMFAAuthenticationCode
./ng net.accelbyte.sdk.cli.Main iam sendMFAAuthenticationCode \
    --clientId 'M5Ij66Pz' \
    --factor 'WC8ZW0wB' \
    --mfaToken 'NWR5oSbT' \
    > test.out 2>&1
eval_tap $? 248 'SendMFAAuthenticationCode' test.out

#- 249 Change2faMethod
./ng net.accelbyte.sdk.cli.Main iam change2faMethod \
    --factor 'PQsILsES' \
    --mfaToken '2d7al8f9' \
    > test.out 2>&1
eval_tap $? 249 'Change2faMethod' test.out

#- 250 Verify2faCode
./ng net.accelbyte.sdk.cli.Main iam verify2faCode \
    --code 'd4MfdnPF' \
    --factor 'YSHMG7v8' \
    --mfaToken 'uswzlEXO' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 250 'Verify2faCode' test.out

#- 251 RetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam retrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'UWW0GqGD' \
    --userId 'zJAWCpqq' \
    > test.out 2>&1
eval_tap $? 251 'RetrieveUserThirdPartyPlatformTokenV3' test.out

#- 252 AuthCodeRequestV3
./ng net.accelbyte.sdk.cli.Main iam authCodeRequestV3 \
    --platformId 'RB8s1PqA' \
    --clientId 'GANqa9Db' \
    --redirectUri 'XO90jQLd' \
    --requestId 'jvABBI37' \
    > test.out 2>&1
eval_tap $? 252 'AuthCodeRequestV3' test.out

#- 253 PlatformTokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV3 \
    --platformId 'voAY1lse' \
    --additionalData 'pZWkguBh' \
    --clientId 'LxBbP5lA' \
    --createHeadless  \
    --deviceId 'bDSM23od' \
    --macAddress '5Q6tYOOA' \
    --platformToken 'jwhjDTxv' \
    --serviceLabel '0.14604383332568416' \
    --skipSetCookie  \
    > test.out 2>&1
eval_tap $? 253 'PlatformTokenGrantV3' test.out

#- 254 GetRevocationListV3
./ng net.accelbyte.sdk.cli.Main iam getRevocationListV3 \
    > test.out 2>&1
eval_tap $? 254 'GetRevocationListV3' test.out

#- 255 TokenRevocationV3
./ng net.accelbyte.sdk.cli.Main iam tokenRevocationV3 \
    --token 'XvXY5P8r' \
    > test.out 2>&1
eval_tap $? 255 'TokenRevocationV3' test.out

#- 256 SimultaneousLoginV3
./ng net.accelbyte.sdk.cli.Main iam simultaneousLoginV3 \
    --simultaneousPlatform 'smHfcSkN' \
    --simultaneousTicket 'vJhppQCD' \
    --nativePlatform 'steam' \
    --nativePlatformTicket 'b8yAZXPf' \
    > test.out 2>&1
eval_tap $? 256 'SimultaneousLoginV3' test.out

#- 257 TokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV3 \
    --additionalData 'ZzqcZ9QO' \
    --clientId '2dwy8JFT' \
    --clientSecret 'N1bO9fIk' \
    --code 'Xt6w3sP7' \
    --codeVerifier 'NREoqYBx' \
    --extendNamespace 'NAVRRARZ' \
    --extendExp  \
    --password 'KVwIhjyT' \
    --redirectUri 'JcxJ4wCc' \
    --refreshToken 'mhQZFwUc' \
    --username '0nCvgUKp' \
    --grantType 'password' \
    > test.out 2>&1
eval_tap $? 257 'TokenGrantV3' test.out

#- 258 VerifyTokenV3
./ng net.accelbyte.sdk.cli.Main iam verifyTokenV3 \
    --token 'mxCEUbSR' \
    > test.out 2>&1
eval_tap $? 258 'VerifyTokenV3' test.out

#- 259 PlatformAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticationV3 \
    --platformId 'CzJBShxn' \
    --code '4it3Tv4M' \
    --error 'o5YidVAx' \
    --openidAssocHandle 'LYMl1Q26' \
    --openidClaimedId '3WLKQPb4' \
    --openidIdentity 'KZHhDdEa' \
    --openidMode 'Zzm1HI6d' \
    --openidNs '6kLemsTK' \
    --openidOpEndpoint 'ZwAfTFLx' \
    --openidResponseNonce 'GyuWrr9D' \
    --openidReturnTo 'A6uHCyN8' \
    --openidSig '4LIk1ENg' \
    --openidSigned '1yBcxTRx' \
    --state 'djkmUzF7' \
    > test.out 2>&1
eval_tap $? 259 'PlatformAuthenticationV3' test.out

#- 260 PlatformTokenRefreshV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenRefreshV3 \
    --platformId 'scaUUARB' \
    --platformToken 'StiYYy2q' \
    > test.out 2>&1
eval_tap $? 260 'PlatformTokenRefreshV3' test.out

#- 261 PublicGetInputValidations
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidations \
    --defaultOnEmpty  \
    --languageCode 'IJESXUep' \
    > test.out 2>&1
eval_tap $? 261 'PublicGetInputValidations' test.out

#- 262 PublicGetInputValidationByField
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidationByField \
    --field 'rFR6CnbS' \
    > test.out 2>&1
eval_tap $? 262 'PublicGetInputValidationByField' test.out

#- 263 PublicGetCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam publicGetCountryAgeRestrictionV3 \
    --countryCode 'fxfRGqnA' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 263 'PublicGetCountryAgeRestrictionV3' test.out

#- 264 PublicGetConfigValueV3
./ng net.accelbyte.sdk.cli.Main iam publicGetConfigValueV3 \
    --configKey 'FvczvlZS' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 264 'PublicGetConfigValueV3' test.out

#- 265 PublicGetCountryListV3
./ng net.accelbyte.sdk.cli.Main iam publicGetCountryListV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 265 'PublicGetCountryListV3' test.out

#- 266 RetrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3
./ng net.accelbyte.sdk.cli.Main iam retrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 266 'RetrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3' test.out

#- 267 RetrieveActiveOIDCClientsPublicV3
./ng net.accelbyte.sdk.cli.Main iam retrieveActiveOIDCClientsPublicV3 \
    --namespace "$AB_NAMESPACE" \
    --clientId 'x75WyKj6' \
    > test.out 2>&1
eval_tap $? 267 'RetrieveActiveOIDCClientsPublicV3' test.out

#- 268 PublicListUserIDByPlatformUserIDsV3
eval_tap 0 268 'PublicListUserIDByPlatformUserIDsV3 # SKIP deprecated' test.out

#- 269 PublicGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'fej0N4dK' \
    --platformUserId 'imKLQ69H' \
    > test.out 2>&1
eval_tap $? 269 'PublicGetUserByPlatformUserIDV3' test.out

#- 270 PublicGetProfileUpdateStrategyV3
./ng net.accelbyte.sdk.cli.Main iam publicGetProfileUpdateStrategyV3 \
    --namespace "$AB_NAMESPACE" \
    --field 'display_name' \
    > test.out 2>&1
eval_tap $? 270 'PublicGetProfileUpdateStrategyV3' test.out

#- 271 PublicGetAsyncStatus
./ng net.accelbyte.sdk.cli.Main iam publicGetAsyncStatus \
    --namespace "$AB_NAMESPACE" \
    --requestId 'NMJdJnsA' \
    > test.out 2>&1
eval_tap $? 271 'PublicGetAsyncStatus' test.out

#- 272 PublicSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam publicSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'AtWPuHHN' \
    --limit '26' \
    --offset '26' \
    --platformBy '3F6I0TG3' \
    --platformId 'eyfZ74db' \
    --query 'azic8nZ1' \
    > test.out 2>&1
eval_tap $? 272 'PublicSearchUserV3' test.out

#- 273 PublicCreateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "d7CRR7lv", "acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "lrz0HZkR", "policyId": "4kkBNpct", "policyVersionId": "GT6J97Bd"}, {"isAccepted": true, "localizedPolicyVersionId": "DkmCtZXY", "policyId": "ae3bl2cW", "policyVersionId": "56r3RQgL"}, {"isAccepted": false, "localizedPolicyVersionId": "MdJwYdN7", "policyId": "uCSes3Lx", "policyVersionId": "gJNclq0N"}], "authType": "s6Lx0J99", "code": "UYdUve5A", "country": "8rsBWTYr", "dateOfBirth": "GizJlWvi", "displayName": "QZUZKlg6", "emailAddress": "QU77tBcf", "password": "LnkQCWzA", "reachMinimumAge": false, "uniqueDisplayName": "MI3G8wQV"}' \
    > test.out 2>&1
eval_tap $? 273 'PublicCreateUserV3' test.out

#- 274 CheckUserAvailability
./ng net.accelbyte.sdk.cli.Main iam checkUserAvailability \
    --namespace "$AB_NAMESPACE" \
    --field 'CabaaeI9' \
    --query '4fe4gz1A' \
    > test.out 2>&1
eval_tap $? 274 'CheckUserAvailability' test.out

#- 275 PublicBulkGetUsers
./ng net.accelbyte.sdk.cli.Main iam publicBulkGetUsers \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["Pj3Zj0VD", "Bb2w7ceZ", "f8AHTvlb"]}' \
    > test.out 2>&1
eval_tap $? 275 'PublicBulkGetUsers' test.out

#- 276 PublicSendRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicSendRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "QqqeWG5K", "languageTag": "PIqvltE7"}' \
    > test.out 2>&1
eval_tap $? 276 'PublicSendRegistrationCode' test.out

#- 277 PublicVerifyRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicVerifyRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "auewE4fI", "emailAddress": "ESe4y209"}' \
    > test.out 2>&1
eval_tap $? 277 'PublicVerifyRegistrationCode' test.out

#- 278 PublicForgotPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicForgotPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "GyHT4AkI", "languageTag": "P7pT3uGE"}' \
    > test.out 2>&1
eval_tap $? 278 'PublicForgotPasswordV3' test.out

#- 279 PublicValidateUserInput
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserInput \
    --namespace "$AB_NAMESPACE" \
    --body '{"displayName": "1pbdS1Gg", "password": "PFdOBYIj", "uniqueDisplayName": "iY4mg4ms", "username": "x8Zuzu2I"}' \
    > test.out 2>&1
eval_tap $? 279 'PublicValidateUserInput' test.out

#- 280 GetAdminInvitationV3
./ng net.accelbyte.sdk.cli.Main iam getAdminInvitationV3 \
    --invitationId 'dBndNMAK' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 280 'GetAdminInvitationV3' test.out

#- 281 CreateUserFromInvitationV3
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV3 \
    --invitationId 'rc3HLIjy' \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "s6UPm45k", "acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "EK9dSbtp", "policyId": "hIVq8TRb", "policyVersionId": "jGbOgeXL"}, {"isAccepted": true, "localizedPolicyVersionId": "bhSniA7R", "policyId": "CmeDTTrG", "policyVersionId": "QwdxoYrA"}, {"isAccepted": true, "localizedPolicyVersionId": "gqluMD4q", "policyId": "I0pt6dJv", "policyVersionId": "MFrgVYTU"}], "authType": "D0kbj83x", "code": "8PX0JKTl", "country": "BOAlXtRx", "dateOfBirth": "KCSCKqUO", "displayName": "kNIgDuyc", "emailAddress": "tANUQIVb", "password": "kFfCIMWa", "reachMinimumAge": true, "uniqueDisplayName": "K16mYbY4"}' \
    > test.out 2>&1
eval_tap $? 281 'CreateUserFromInvitationV3' test.out

#- 282 UpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam updateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "CKGlKXWK", "country": "hsETypiE", "dateOfBirth": "QlaNnSAD", "displayName": "TnO8AkIC", "languageTag": "JXgTStXe", "uniqueDisplayName": "XqBwqUBh", "userName": "l3uwLKdP"}' \
    > test.out 2>&1
eval_tap $? 282 'UpdateUserV3' test.out

#- 283 PublicPartialUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicPartialUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "myjy2fCq", "country": "sz1gfXm2", "dateOfBirth": "UfpkquZV", "displayName": "kgXZFxoF", "languageTag": "TECrRMzj", "uniqueDisplayName": "mYlkgWEQ", "userName": "yX7DbeiB"}' \
    > test.out 2>&1
eval_tap $? 283 'PublicPartialUpdateUserV3' test.out

#- 284 PublicSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"context": "0NrUnt0t", "emailAddress": "kcr6TuW5", "languageTag": "ZYQQoDlp"}' \
    > test.out 2>&1
eval_tap $? 284 'PublicSendVerificationCodeV3' test.out

#- 285 PublicUserVerificationV3
./ng net.accelbyte.sdk.cli.Main iam publicUserVerificationV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "yrCgknvV", "contactType": "hMUXbPMX", "languageTag": "aGTryF4P", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 285 'PublicUserVerificationV3' test.out

#- 286 PublicUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "v3w2GXTo", "country": "p8POAOVr", "dateOfBirth": "RoFyyjuF", "displayName": "fDkMQ27j", "emailAddress": "t13lqJJo", "password": "s8KnU3Hb", "uniqueDisplayName": "9AC2qkht", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 286 'PublicUpgradeHeadlessAccountV3' test.out

#- 287 PublicVerifyHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --needVerificationCode  \
    --body '{"emailAddress": "r0IylYH7", "password": "5PSEabTJ"}' \
    > test.out 2>&1
eval_tap $? 287 'PublicVerifyHeadlessAccountV3' test.out

#- 288 PublicUpdatePasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicUpdatePasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"languageTag": "j9PA2AFU", "mfaToken": "xTShfGbv", "newPassword": "DCvdIJeO", "oldPassword": "Q14RIHwr"}' \
    > test.out 2>&1
eval_tap $? 288 'PublicUpdatePasswordV3' test.out

#- 289 PublicCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam publicCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace '6FPDOrk8' \
    > test.out 2>&1
eval_tap $? 289 'PublicCreateJusticeUser' test.out

#- 290 PublicPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'ytNHBS7L' \
    --redirectUri 'sDqrJU2R' \
    --ticket 'gAGtBMdk' \
    > test.out 2>&1
eval_tap $? 290 'PublicPlatformLinkV3' test.out

#- 291 PublicPlatformUnlinkV3
eval_tap 0 291 'PublicPlatformUnlinkV3 # SKIP deprecated' test.out

#- 292 PublicPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'lT1R3XJz' \
    > test.out 2>&1
eval_tap $? 292 'PublicPlatformUnlinkAllV3' test.out

#- 293 PublicForcePlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicForcePlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'XM7aLOwX' \
    --ticket 'E7t5upWB' \
    > test.out 2>&1
eval_tap $? 293 'PublicForcePlatformLinkV3' test.out

#- 294 PublicWebLinkPlatform
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatform \
    --namespace "$AB_NAMESPACE" \
    --platformId 'bi5CUuyT' \
    --clientId 'fuvThAd7' \
    --redirectUri 'ueJc0sKW' \
    > test.out 2>&1
eval_tap $? 294 'PublicWebLinkPlatform' test.out

#- 295 PublicWebLinkPlatformEstablish
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatformEstablish \
    --namespace "$AB_NAMESPACE" \
    --platformId 'UZqT5XFZ' \
    --code '6GSQgine' \
    --state '0YUlokqH' \
    > test.out 2>&1
eval_tap $? 295 'PublicWebLinkPlatformEstablish' test.out

#- 296 PublicProcessWebLinkPlatformV3
./ng net.accelbyte.sdk.cli.Main iam publicProcessWebLinkPlatformV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'jXOkedQy' \
    --code 'aywmoB5F' \
    --state '2JIjnr1K' \
    > test.out 2>&1
eval_tap $? 296 'PublicProcessWebLinkPlatformV3' test.out

#- 297 PublicGetUsersPlatformInfosV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUsersPlatformInfosV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"platformId": "juDSZ6uf", "userIds": ["L45EsAGe", "1o0ByuWj", "tbhq9atQ"]}' \
    > test.out 2>&1
eval_tap $? 297 'PublicGetUsersPlatformInfosV3' test.out

#- 298 ResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam resetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientId": "UNou6FUD", "code": "o76T6BOM", "emailAddress": "tHo9yD19", "languageTag": "GG3AvdiW", "newPassword": "jIfmA9nI"}' \
    > test.out 2>&1
eval_tap $? 298 'ResetPasswordV3' test.out

#- 299 PublicGetUserByUserIdV3
eval_tap 0 299 'PublicGetUserByUserIdV3 # SKIP deprecated' test.out

#- 300 PublicGetUserBanHistoryV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserBanHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ahtr7MJl' \
    --activeOnly  \
    --after '9xfmNPyo' \
    --before 'k3LmzQIG' \
    --limit '97' \
    > test.out 2>&1
eval_tap $? 300 'PublicGetUserBanHistoryV3' test.out

#- 301 PublicListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '0e9Uul7h' \
    > test.out 2>&1
eval_tap $? 301 'PublicListUserAllPlatformAccountsDistinctV3' test.out

#- 302 PublicGetUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'vLx5LNhn' \
    > test.out 2>&1
eval_tap $? 302 'PublicGetUserInformationV3' test.out

#- 303 PublicGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'NlDAHB4c' \
    --after '0.673534555722739' \
    --before '0.06627686841579095' \
    --limit '29' \
    > test.out 2>&1
eval_tap $? 303 'PublicGetUserLoginHistoriesV3' test.out

#- 304 PublicGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Da4CoCfX' \
    --after 'cnkDqX8s' \
    --before 'bY6eCrxy' \
    --limit '15' \
    --platformId 'wZ3a2X4g' \
    > test.out 2>&1
eval_tap $? 304 'PublicGetUserPlatformAccountsV3' test.out

#- 305 PublicListJusticePlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicListJusticePlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'vY4qqjFB' \
    > test.out 2>&1
eval_tap $? 305 'PublicListJusticePlatformAccountsV3' test.out

#- 306 PublicLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam publicLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'FBEbN2yW' \
    --body '{"platformId": "xY63vDWP", "platformUserId": "5O7lCT3e"}' \
    > test.out 2>&1
eval_tap $? 306 'PublicLinkPlatformAccount' test.out

#- 307 PublicForceLinkPlatformWithProgression
./ng net.accelbyte.sdk.cli.Main iam publicForceLinkPlatformWithProgression \
    --namespace "$AB_NAMESPACE" \
    --userId 'x5iasdAV' \
    --body '{"chosenNamespaces": ["qLvlyomh", "TM5Cdnqm", "loOVpG2O"], "requestId": "hnxHwgMT"}' \
    > test.out 2>&1
eval_tap $? 307 'PublicForceLinkPlatformWithProgression' test.out

#- 308 PublicGetPublisherUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetPublisherUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'tMEQcZWU' \
    > test.out 2>&1
eval_tap $? 308 'PublicGetPublisherUserV3' test.out

#- 309 PublicValidateUserByUserIDAndPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserByUserIDAndPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'wXIv9XHc' \
    --password 'G3TY8JeW' \
    > test.out 2>&1
eval_tap $? 309 'PublicValidateUserByUserIDAndPasswordV3' test.out

#- 310 PublicGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRolesV3 \
    --after '9ONS8wQL' \
    --before '4gkjiXXX' \
    --isWildcard  \
    --limit '77' \
    > test.out 2>&1
eval_tap $? 310 'PublicGetRolesV3' test.out

#- 311 PublicGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRoleV3 \
    --roleId 'jteTulaz' \
    > test.out 2>&1
eval_tap $? 311 'PublicGetRoleV3' test.out

#- 312 PublicGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyUserV3 \
    --includeAllPlatforms  \
    > test.out 2>&1
eval_tap $? 312 'PublicGetMyUserV3' test.out

#- 313 PublicGetLinkHeadlessAccountToMyAccountConflictV3
./ng net.accelbyte.sdk.cli.Main iam publicGetLinkHeadlessAccountToMyAccountConflictV3 \
    --oneTimeLinkCode 'pjmTuQHv' \
    > test.out 2>&1
eval_tap $? 313 'PublicGetLinkHeadlessAccountToMyAccountConflictV3' test.out

#- 314 LinkHeadlessAccountToMyAccountV3
./ng net.accelbyte.sdk.cli.Main iam linkHeadlessAccountToMyAccountV3 \
    --body '{"chosenNamespaces": ["CS5e5hLT", "CJ2tEf0W", "L2fDmFvM"], "oneTimeLinkCode": "SgmOPZtd"}' \
    > test.out 2>&1
eval_tap $? 314 'LinkHeadlessAccountToMyAccountV3' test.out

#- 315 PublicGetMyProfileAllowUpdateStatusV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyProfileAllowUpdateStatusV3 \
    > test.out 2>&1
eval_tap $? 315 'PublicGetMyProfileAllowUpdateStatusV3' test.out

#- 316 PublicSendVerificationLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationLinkV3 \
    --body '{"languageTag": "IgSHzT0H"}' \
    > test.out 2>&1
eval_tap $? 316 'PublicSendVerificationLinkV3' test.out

#- 317 PublicVerifyUserByLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyUserByLinkV3 \
    --code '5nVzXZ1g' \
    > test.out 2>&1
eval_tap $? 317 'PublicVerifyUserByLinkV3' test.out

#- 318 PlatformAuthenticateSAMLV3Handler
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticateSAMLV3Handler \
    --platformId 'j64ltKcF' \
    --code 'XjzfiyrD' \
    --error 'OeKBZAB2' \
    --state 'tv8kpit1' \
    > test.out 2>&1
eval_tap $? 318 'PlatformAuthenticateSAMLV3Handler' test.out

#- 319 LoginSSOClient
./ng net.accelbyte.sdk.cli.Main iam loginSSOClient \
    --platformId '2Ur05rhP' \
    --payload 'PqopLI7t' \
    > test.out 2>&1
eval_tap $? 319 'LoginSSOClient' test.out

#- 320 LogoutSSOClient
./ng net.accelbyte.sdk.cli.Main iam logoutSSOClient \
    --platformId 'pYqibbcM' \
    > test.out 2>&1
eval_tap $? 320 'LogoutSSOClient' test.out

#- 321 RequestTargetTokenResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTargetTokenResponseV3 \
    --additionalData 'CzpeTCAn' \
    --code '5XsOIPvI' \
    > test.out 2>&1
eval_tap $? 321 'RequestTargetTokenResponseV3' test.out

#- 322 AdminListInvitationHistoriesV4
./ng net.accelbyte.sdk.cli.Main iam adminListInvitationHistoriesV4 \
    --limit '72' \
    --namespace "$AB_NAMESPACE" \
    --offset '87' \
    > test.out 2>&1
eval_tap $? 322 'AdminListInvitationHistoriesV4' test.out

#- 323 AdminGetDevicesByUserV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDevicesByUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'QoGWz4lG' \
    > test.out 2>&1
eval_tap $? 323 'AdminGetDevicesByUserV4' test.out

#- 324 AdminGetBannedDevicesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedDevicesV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceType 'FlD2qvnr' \
    --endDate 'ZAXQ0uHy' \
    --limit '62' \
    --offset '29' \
    --startDate 'uAqHwS38' \
    > test.out 2>&1
eval_tap $? 324 'AdminGetBannedDevicesV4' test.out

#- 325 AdminGetUserDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeviceBansV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'hKmSNU29' \
    > test.out 2>&1
eval_tap $? 325 'AdminGetUserDeviceBansV4' test.out

#- 326 AdminBanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminBanDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"comment": "DWrzv22J", "deviceId": "uKdE6JGy", "deviceType": "cO8WnI5J", "enabled": true, "endDate": "PUPnFtLE", "ext": {"WARAdqPG": {}, "N7YE770G": {}, "50yUMY7x": {}}, "reason": "5yNioqLq"}' \
    > test.out 2>&1
eval_tap $? 326 'AdminBanDeviceV4' test.out

#- 327 AdminGetDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBanV4 \
    --banId '5cfnlkzO' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 327 'AdminGetDeviceBanV4' test.out

#- 328 AdminUpdateDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateDeviceBanV4 \
    --banId 'VrMdY8V3' \
    --namespace "$AB_NAMESPACE" \
    --body '{"enabled": true}' \
    > test.out 2>&1
eval_tap $? 328 'AdminUpdateDeviceBanV4' test.out

#- 329 AdminGenerateReportV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateReportV4 \
    --namespace "$AB_NAMESPACE" \
    --endDate 'BsLXLzT7' \
    --startDate 'PSJwUnHc' \
    --deviceType 'ZPQBLzRH' \
    > test.out 2>&1
eval_tap $? 329 'AdminGenerateReportV4' test.out

#- 330 AdminGetDeviceTypesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceTypesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 330 'AdminGetDeviceTypesV4' test.out

#- 331 AdminGetDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBansV4 \
    --deviceId 'WEHgfZlE' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 331 'AdminGetDeviceBansV4' test.out

#- 332 AdminDecryptDeviceV4
eval_tap 0 332 'AdminDecryptDeviceV4 # SKIP deprecated' test.out

#- 333 AdminUnbanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminUnbanDeviceV4 \
    --deviceId '0claSmGE' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 333 'AdminUnbanDeviceV4' test.out

#- 334 AdminGetUsersByDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUsersByDeviceV4 \
    --deviceId 'E5aUkP43' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 334 'AdminGetUsersByDeviceV4' test.out

#- 335 AdminGetNamespaceInvitationHistoryV4
./ng net.accelbyte.sdk.cli.Main iam adminGetNamespaceInvitationHistoryV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 335 'AdminGetNamespaceInvitationHistoryV4' test.out

#- 336 AdminGetNamespaceUserInvitationHistoryV4
./ng net.accelbyte.sdk.cli.Main iam adminGetNamespaceUserInvitationHistoryV4 \
    --namespace "$AB_NAMESPACE" \
    --limit '50' \
    --offset '21' \
    > test.out 2>&1
eval_tap $? 336 'AdminGetNamespaceUserInvitationHistoryV4' test.out

#- 337 AdminCreateTestUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateTestUsersV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 0, "userInfo": {"country": "xlE6Gtlm"}}' \
    > test.out 2>&1
eval_tap $? 337 'AdminCreateTestUsersV4' test.out

#- 338 AdminCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "OLfIOcY4", "policyId": "WCWof6jI", "policyVersionId": "DlY7Uyjy"}, {"isAccepted": true, "localizedPolicyVersionId": "zKoi0zd6", "policyId": "lRG3RE0W", "policyVersionId": "Tr8Ic3OI"}, {"isAccepted": false, "localizedPolicyVersionId": "BnhQw4N0", "policyId": "cY1QupVX", "policyVersionId": "YB9jfWcr"}], "authType": "EMAILPASSWD", "code": "rrOXdNFG", "country": "B8U21h3L", "dateOfBirth": "f4TU5oUw", "displayName": "1LnzGRMT", "emailAddress": "wmjsEECg", "password": "rvZzZ8Kx", "passwordMD5Sum": "k64Fw0d7", "reachMinimumAge": false, "uniqueDisplayName": "Vpn2XXnB", "username": "Du6RWDKT"}' \
    > test.out 2>&1
eval_tap $? 338 'AdminCreateUserV4' test.out

#- 339 AdminBulkUpdateUserAccountTypeV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateUserAccountTypeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"testAccount": true, "userIds": ["gAJMB8EF", "RXpmxBta", "ZDsF5ZKw"]}' \
    > test.out 2>&1
eval_tap $? 339 'AdminBulkUpdateUserAccountTypeV4' test.out

#- 340 AdminBulkCheckValidUserIDV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkCheckValidUserIDV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["xSPmBJTW", "gzdVi25O", "YRnK4eT8"]}' \
    > test.out 2>&1
eval_tap $? 340 'AdminBulkCheckValidUserIDV4' test.out

#- 341 AdminUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'jxLBfzIE' \
    --body '{"avatarUrl": "fROjMr9P", "country": "v7oJu1U1", "dateOfBirth": "SXIEPp2m", "displayName": "tAOWvU2j", "languageTag": "zZTgBZDR", "skipLoginQueue": false, "uniqueDisplayName": "Vp1fobc5", "userName": "mCRnyLLE"}' \
    > test.out 2>&1
eval_tap $? 341 'AdminUpdateUserV4' test.out

#- 342 AdminUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'DUzRcN7c' \
    --body '{"code": "AzDNZv6B", "emailAddress": "n5By3bZv"}' \
    > test.out 2>&1
eval_tap $? 342 'AdminUpdateUserEmailAddressV4' test.out

#- 343 AdminDisableUserMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableUserMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '7MqyUbcb' \
    --body '{"factor": "XDlRrnlw", "mfaToken": "9Q1vPVaI"}' \
    > test.out 2>&1
eval_tap $? 343 'AdminDisableUserMFAV4' test.out

#- 344 AdminGetUserMFAStatusV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUserMFAStatusV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ahwQQHu8' \
    > test.out 2>&1
eval_tap $? 344 'AdminGetUserMFAStatusV4' test.out

#- 345 AdminListUserRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminListUserRolesV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '6J11BTXI' \
    > test.out 2>&1
eval_tap $? 345 'AdminListUserRolesV4' test.out

#- 346 AdminUpdateUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'LJaCzQ5v' \
    --body '{"assignedNamespaces": ["SSNC0Xcq", "tt7obxn5", "21Bw54zd"], "roleId": "E6ayXrZs"}' \
    > test.out 2>&1
eval_tap $? 346 'AdminUpdateUserRoleV4' test.out

#- 347 AdminAddUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'fQnSwT4P' \
    --body '{"assignedNamespaces": ["6utAzZoJ", "mC1Rn3eq", "slcO8j98"], "roleId": "pW8BAkOY"}' \
    > test.out 2>&1
eval_tap $? 347 'AdminAddUserRoleV4' test.out

#- 348 AdminRemoveUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRemoveUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'XGR1JEtd' \
    --body '{"assignedNamespaces": ["20K46GJu", "UAFAKqIK", "uhI5Nyl0"], "roleId": "SMh4TKyb"}' \
    > test.out 2>&1
eval_tap $? 348 'AdminRemoveUserRoleV4' test.out

#- 349 AdminGetRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV4 \
    --adminRole  \
    --isWildcard  \
    --limit '40' \
    --offset '99' \
    > test.out 2>&1
eval_tap $? 349 'AdminGetRolesV4' test.out

#- 350 AdminCreateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV4 \
    --body '{"adminRole": false, "deletable": false, "isWildcard": false, "roleName": "2GbD9Vfu"}' \
    > test.out 2>&1
eval_tap $? 350 'AdminCreateRoleV4' test.out

#- 351 AdminGetRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV4 \
    --roleId '1V5xPuIV' \
    > test.out 2>&1
eval_tap $? 351 'AdminGetRoleV4' test.out

#- 352 AdminDeleteRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV4 \
    --roleId 'f5kJcUim' \
    > test.out 2>&1
eval_tap $? 352 'AdminDeleteRoleV4' test.out

#- 353 AdminUpdateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV4 \
    --roleId 'CCPAwawf' \
    --body '{"adminRole": false, "deletable": false, "isWildcard": false, "roleName": "MJgPOHoA"}' \
    > test.out 2>&1
eval_tap $? 353 'AdminUpdateRoleV4' test.out

#- 354 AdminUpdateRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV4 \
    --roleId 'wLZ95SZ7' \
    --body '{"permissions": [{"action": 9, "resource": "zYg0OGVz", "schedAction": 28, "schedCron": "898YBkYF", "schedRange": ["73N36Pxx", "amsgkYr9", "H4fB1HY8"]}, {"action": 13, "resource": "yjDwlOrQ", "schedAction": 100, "schedCron": "JAaVqs2Q", "schedRange": ["L3kqmO15", "FRG6zUwk", "hDZRFi40"]}, {"action": 74, "resource": "7PfipfxL", "schedAction": 20, "schedCron": "4BHT7dZZ", "schedRange": ["DbFagRC9", "m6MH6MZa", "Nubw4m8F"]}]}' \
    > test.out 2>&1
eval_tap $? 354 'AdminUpdateRolePermissionsV4' test.out

#- 355 AdminAddRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV4 \
    --roleId 'C1xUWU0B' \
    --body '{"permissions": [{"action": 96, "resource": "nX96nMBk", "schedAction": 48, "schedCron": "VhkWyOvu", "schedRange": ["kVfAYzj0", "TCS5VhGb", "E7eyd7g7"]}, {"action": 28, "resource": "FH376H8m", "schedAction": 13, "schedCron": "RZi5S4HM", "schedRange": ["49Hm3OKZ", "BsW9RdvD", "5w4Wh0sW"]}, {"action": 69, "resource": "tXFl5y09", "schedAction": 38, "schedCron": "NDUeaH3P", "schedRange": ["lMqU8Dbr", "31ZpOvmt", "zhEob5jX"]}]}' \
    > test.out 2>&1
eval_tap $? 355 'AdminAddRolePermissionsV4' test.out

#- 356 AdminDeleteRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV4 \
    --roleId '71vUpYOd' \
    --body '["1KH7dsox", "lKoODYxw", "ASUUQnJZ"]' \
    > test.out 2>&1
eval_tap $? 356 'AdminDeleteRolePermissionsV4' test.out

#- 357 AdminListAssignedUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminListAssignedUsersV4 \
    --roleId 'Qcy5Lfrl' \
    --after 'tQpMRQrl' \
    --before 'petviej7' \
    --limit '20' \
    > test.out 2>&1
eval_tap $? 357 'AdminListAssignedUsersV4' test.out

#- 358 AdminAssignUserToRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAssignUserToRoleV4 \
    --roleId 'p6wcAoAX' \
    --body '{"assignedNamespaces": ["PMPY6opt", "6l8hzLID", "2p6J6Pgj"], "namespace": "jNhxnZnt", "userId": "TvenPSS9"}' \
    > test.out 2>&1
eval_tap $? 358 'AdminAssignUserToRoleV4' test.out

#- 359 AdminRevokeUserFromRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRevokeUserFromRoleV4 \
    --roleId '2U3DbQO5' \
    --body '{"namespace": "3l0IjG3G", "userId": "IDpEJFgM"}' \
    > test.out 2>&1
eval_tap $? 359 'AdminRevokeUserFromRoleV4' test.out

#- 360 AdminInviteUserNewV4
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserNewV4 \
    --body '{"assignedNamespaces": ["aiutKxMW", "gHYdKsW3", "N6iq2jb9"], "emailAddresses": ["QG0Yx0io", "3LZlpjd2", "voeHHyu0"], "isAdmin": false, "isNewStudio": false, "languageTag": "oaAqdYKq", "namespace": "rhgABWe0", "roleId": "RyoHDO43"}' \
    > test.out 2>&1
eval_tap $? 360 'AdminInviteUserNewV4' test.out

#- 361 AdminUpdateMyUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateMyUserV4 \
    --body '{"avatarUrl": "wK8QGf5g", "country": "pN6CqBub", "dateOfBirth": "esbW6zRa", "displayName": "zSrQvk5P", "languageTag": "F66Vqhn3", "skipLoginQueue": false, "uniqueDisplayName": "k1VC2GL9", "userName": "pvfl1qGl"}' \
    > test.out 2>&1
eval_tap $? 361 'AdminUpdateMyUserV4' test.out

#- 362 AdminDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyAuthenticatorV4 \
    --body '{"factor": "9jDcAkhN", "mfaToken": "6ZbTJNjy"}' \
    > test.out 2>&1
eval_tap $? 362 'AdminDisableMyAuthenticatorV4' test.out

#- 363 AdminEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyAuthenticatorV4 \
    --code 'VxUrpts7' \
    > test.out 2>&1
eval_tap $? 363 'AdminEnableMyAuthenticatorV4' test.out

#- 364 AdminGenerateMyAuthenticatorKeyV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateMyAuthenticatorKeyV4 \
    > test.out 2>&1
eval_tap $? 364 'AdminGenerateMyAuthenticatorKeyV4' test.out

#- 365 AdminGetMyBackupCodesV4
eval_tap 0 365 'AdminGetMyBackupCodesV4 # SKIP deprecated' test.out

#- 366 AdminGenerateMyBackupCodesV4
eval_tap 0 366 'AdminGenerateMyBackupCodesV4 # SKIP deprecated' test.out

#- 367 AdminDisableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyBackupCodesV4 \
    --body '{"factor": "9wsiA1JZ", "mfaToken": "sVidK5Ok"}' \
    > test.out 2>&1
eval_tap $? 367 'AdminDisableMyBackupCodesV4' test.out

#- 368 AdminDownloadMyBackupCodesV4
eval_tap 0 368 'AdminDownloadMyBackupCodesV4 # SKIP deprecated' test.out

#- 369 AdminEnableMyBackupCodesV4
eval_tap 0 369 'AdminEnableMyBackupCodesV4 # SKIP deprecated' test.out

#- 370 AdminGetBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBackupCodesV4 \
    --languageTag 'Ev5ESEp6' \
    > test.out 2>&1
eval_tap $? 370 'AdminGetBackupCodesV4' test.out

#- 371 AdminGenerateBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateBackupCodesV4 \
    --languageTag 'KyNXLdQp' \
    > test.out 2>&1
eval_tap $? 371 'AdminGenerateBackupCodesV4' test.out

#- 372 AdminEnableBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableBackupCodesV4 \
    --languageTag 'ZArJOTQv' \
    > test.out 2>&1
eval_tap $? 372 'AdminEnableBackupCodesV4' test.out

#- 373 AdminChallengeMyMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminChallengeMyMFAV4 \
    --code 'guh7mvKT' \
    --factor 'TUXis2fb' \
    > test.out 2>&1
eval_tap $? 373 'AdminChallengeMyMFAV4' test.out

#- 374 AdminSendMyMFAEmailCodeV4
./ng net.accelbyte.sdk.cli.Main iam adminSendMyMFAEmailCodeV4 \
    --action 'ys8kySgy' \
    --languageTag 'OiU6K7B7' \
    > test.out 2>&1
eval_tap $? 374 'AdminSendMyMFAEmailCodeV4' test.out

#- 375 AdminDisableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyEmailV4 \
    --body '{"factor": "39RUD3Ex", "mfaToken": "m0QGXgc2"}' \
    > test.out 2>&1
eval_tap $? 375 'AdminDisableMyEmailV4' test.out

#- 376 AdminEnableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyEmailV4 \
    --code 'KxUj2Ogr' \
    > test.out 2>&1
eval_tap $? 376 'AdminEnableMyEmailV4' test.out

#- 377 AdminGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyEnabledFactorsV4 \
    > test.out 2>&1
eval_tap $? 377 'AdminGetMyEnabledFactorsV4' test.out

#- 378 AdminMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam adminMakeFactorMyDefaultV4 \
    --factor 'Rq0Q5xPj' \
    > test.out 2>&1
eval_tap $? 378 'AdminMakeFactorMyDefaultV4' test.out

#- 379 AdminGetMyOwnMFAStatusV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyOwnMFAStatusV4 \
    > test.out 2>&1
eval_tap $? 379 'AdminGetMyOwnMFAStatusV4' test.out

#- 380 AdminGetMyMFAStatusV4
eval_tap 0 380 'AdminGetMyMFAStatusV4 # SKIP deprecated' test.out

#- 381 AdminInviteUserV4
eval_tap 0 381 'AdminInviteUserV4 # SKIP deprecated' test.out

#- 382 AuthenticationWithPlatformLinkV4
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV4 \
    --extendExp  \
    --clientId 'TcKeZdxN' \
    --linkingToken 'KSPLtsLE' \
    --password 'GEm4Xk1I' \
    --username 'asY5ezOT' \
    > test.out 2>&1
eval_tap $? 382 'AuthenticationWithPlatformLinkV4' test.out

#- 383 GenerateTokenByNewHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV4 \
    --additionalData 'HvfBtWcl' \
    --extendExp  \
    --linkingToken 'V8c6vENP' \
    > test.out 2>&1
eval_tap $? 383 'GenerateTokenByNewHeadlessAccountV4' test.out

#- 384 Verify2faCodeV4
./ng net.accelbyte.sdk.cli.Main iam verify2faCodeV4 \
    --code '3oFSL5OI' \
    --factor 'V160dnnR' \
    --mfaToken 'sPGQYXmZ' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 384 'Verify2faCodeV4' test.out

#- 385 PlatformTokenGrantV4
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV4 \
    --platformId 'hD3rW5tV' \
    --codeChallenge 'd6yKKOD7' \
    --codeChallengeMethod 'plain' \
    --additionalData 'KfAWf8i2' \
    --clientId 'xsmDmZhd' \
    --createHeadless  \
    --deviceId 'oN1GPu9o' \
    --macAddress 'CXeysD77' \
    --platformToken 'XIChOjiZ' \
    --serviceLabel '0.8170461999425298' \
    --skipSetCookie  \
    > test.out 2>&1
eval_tap $? 385 'PlatformTokenGrantV4' test.out

#- 386 SimultaneousLoginV4
./ng net.accelbyte.sdk.cli.Main iam simultaneousLoginV4 \
    --codeChallenge 'Il5RBMfb' \
    --codeChallengeMethod 'S256' \
    --simultaneousPlatform 'ZcTh64wI' \
    --simultaneousTicket 'dc9vzVot' \
    --nativePlatform 'epicgames' \
    --nativePlatformTicket 'xHVnstVR' \
    > test.out 2>&1
eval_tap $? 386 'SimultaneousLoginV4' test.out

#- 387 TokenGrantV4
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV4 \
    --codeChallenge 'zIB3DnG2' \
    --codeChallengeMethod 'S256' \
    --additionalData 'jYivnVtF' \
    --clientId 'sZVgCpAo' \
    --clientSecret 'MQuuQEzc' \
    --code 'M9r45yqY' \
    --codeVerifier 'idrO6VDu' \
    --extendNamespace 'PCUrq9X9' \
    --extendExp  \
    --loginQueueTicket 'DV9h6m85' \
    --password '8qoqFuHI' \
    --redirectUri 'otPkFC89' \
    --refreshToken 'u2vVTBdV' \
    --username 'BEi4kvoU' \
    --grantType 'refresh_token' \
    > test.out 2>&1
eval_tap $? 387 'TokenGrantV4' test.out

#- 388 RequestTargetTokenResponseV4
./ng net.accelbyte.sdk.cli.Main iam requestTargetTokenResponseV4 \
    --additionalData 'gWkMgrjq' \
    --code 'iYqvgTSu' \
    > test.out 2>&1
eval_tap $? 388 'RequestTargetTokenResponseV4' test.out

#- 389 PublicListUserIDByPlatformUserIDsV4
./ng net.accelbyte.sdk.cli.Main iam publicListUserIDByPlatformUserIDsV4 \
    --namespace "$AB_NAMESPACE" \
    --platformId '2FpnWWvV' \
    --rawPUID  \
    --body '{"pidType": "KlgMnQLQ", "platformUserIds": ["2YBWIlDa", "1axXlVRg", "4XtRGZzf"]}' \
    > test.out 2>&1
eval_tap $? 389 'PublicListUserIDByPlatformUserIDsV4' test.out

#- 390 PublicCreateTestUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateTestUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "EZh5taPj", "policyId": "Er52p8DD", "policyVersionId": "es03enAY"}, {"isAccepted": true, "localizedPolicyVersionId": "VgWZKOLi", "policyId": "UCqowB8w", "policyVersionId": "AajtqA40"}, {"isAccepted": true, "localizedPolicyVersionId": "Y9knVot0", "policyId": "7bUDrx0j", "policyVersionId": "85XTvwcT"}], "authType": "EMAILPASSWD", "country": "KGDiL3JX", "dateOfBirth": "qO1owDU9", "displayName": "sPvMiSlI", "emailAddress": "u5nYEHHG", "password": "tMdelh5C", "passwordMD5Sum": "7gCBLz5X", "uniqueDisplayName": "c7GLlR8Z", "username": "pea9tg5o", "verified": true}' \
    > test.out 2>&1
eval_tap $? 390 'PublicCreateTestUserV4' test.out

#- 391 PublicCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "m022Bp7x", "policyId": "ThIT2PjV", "policyVersionId": "gQNq1tmZ"}, {"isAccepted": false, "localizedPolicyVersionId": "udI9w6Pq", "policyId": "oiFHAPC9", "policyVersionId": "p8WpwLka"}, {"isAccepted": true, "localizedPolicyVersionId": "l8YmYPXl", "policyId": "XXgka3Xc", "policyVersionId": "bYlOkql3"}], "authType": "EMAILPASSWD", "code": "jOSidQ42", "country": "ngVphEwn", "dateOfBirth": "tv57pMnI", "displayName": "OU0VzzZ9", "emailAddress": "2AzDZS4Z", "password": "ZhOIhgT0", "passwordMD5Sum": "1DeWMSuU", "reachMinimumAge": false, "uniqueDisplayName": "5hWCtdOY", "username": "fKEf1q4a"}' \
    > test.out 2>&1
eval_tap $? 391 'PublicCreateUserV4' test.out

#- 392 CreateUserFromInvitationV4
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV4 \
    --invitationId 'A8dtAAXA' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "DX1uKzjy", "policyId": "VX6Lx3ml", "policyVersionId": "IiGBVQns"}, {"isAccepted": false, "localizedPolicyVersionId": "l3YbWb6J", "policyId": "NVM5agZG", "policyVersionId": "rTZTlJrI"}, {"isAccepted": false, "localizedPolicyVersionId": "BWxpXjuN", "policyId": "HjNGIFao", "policyVersionId": "bnYyWzkA"}], "authType": "EMAILPASSWD", "code": "jszeW70n", "country": "u9Q72yGf", "dateOfBirth": "grf40Fjk", "displayName": "3CzzkgO7", "emailAddress": "AnGbCDQs", "password": "Z0sYaTzA", "passwordMD5Sum": "mxnZG6xH", "reachMinimumAge": true, "uniqueDisplayName": "UUhobUVk", "username": "QqnGzgTa"}' \
    > test.out 2>&1
eval_tap $? 392 'CreateUserFromInvitationV4' test.out

#- 393 PublicUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "3lIaTJHp", "country": "qXHDn2L5", "dateOfBirth": "FOh8Frfp", "displayName": "hkRKwtIQ", "languageTag": "sCFYjysY", "uniqueDisplayName": "HSOrUOVh", "userName": "27I74Jfs"}' \
    > test.out 2>&1
eval_tap $? 393 'PublicUpdateUserV4' test.out

#- 394 PublicUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "Euk0XXWs", "emailAddress": "FMVZMyyz"}' \
    > test.out 2>&1
eval_tap $? 394 'PublicUpdateUserEmailAddressV4' test.out

#- 395 PublicUpgradeHeadlessAccountWithVerificationCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountWithVerificationCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "BXcN8d2Y", "country": "KgEMuVDS", "dateOfBirth": "WQAmDb3m", "displayName": "1IaRE3Ik", "emailAddress": "PrbFa3Zx", "password": "FW3t6JmB", "reachMinimumAge": true, "uniqueDisplayName": "3Lyqm95t", "username": "T17AztBl", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 395 'PublicUpgradeHeadlessAccountWithVerificationCodeV4' test.out

#- 396 PublicUpgradeHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"dateOfBirth": "7AdVVfGv", "displayName": "Yr9uW1Zi", "emailAddress": "QBdQ4Tmg", "password": "fyEXnvj9", "uniqueDisplayName": "gle3ZmP9", "username": "lDs5fZw7"}' \
    > test.out 2>&1
eval_tap $? 396 'PublicUpgradeHeadlessAccountV4' test.out

#- 397 PublicDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"factor": "gssDvX7U", "mfaToken": "zG2mN5Uu"}' \
    > test.out 2>&1
eval_tap $? 397 'PublicDisableMyAuthenticatorV4' test.out

#- 398 PublicEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'o2loiyZt' \
    > test.out 2>&1
eval_tap $? 398 'PublicEnableMyAuthenticatorV4' test.out

#- 399 PublicGenerateMyAuthenticatorKeyV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateMyAuthenticatorKeyV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 399 'PublicGenerateMyAuthenticatorKeyV4' test.out

#- 400 PublicGetMyBackupCodesV4
eval_tap 0 400 'PublicGetMyBackupCodesV4 # SKIP deprecated' test.out

#- 401 PublicGenerateMyBackupCodesV4
eval_tap 0 401 'PublicGenerateMyBackupCodesV4 # SKIP deprecated' test.out

#- 402 PublicDisableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"factor": "YLEeSjzC", "mfaToken": "WAGGPOzc"}' \
    > test.out 2>&1
eval_tap $? 402 'PublicDisableMyBackupCodesV4' test.out

#- 403 PublicDownloadMyBackupCodesV4
eval_tap 0 403 'PublicDownloadMyBackupCodesV4 # SKIP deprecated' test.out

#- 404 PublicEnableMyBackupCodesV4
eval_tap 0 404 'PublicEnableMyBackupCodesV4 # SKIP deprecated' test.out

#- 405 PublicGetBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGetBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --languageTag 'w36wxNJa' \
    > test.out 2>&1
eval_tap $? 405 'PublicGetBackupCodesV4' test.out

#- 406 PublicGenerateBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --languageTag 'hdOWTDiE' \
    > test.out 2>&1
eval_tap $? 406 'PublicGenerateBackupCodesV4' test.out

#- 407 PublicEnableBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --languageTag '5ZrdV7Zt' \
    > test.out 2>&1
eval_tap $? 407 'PublicEnableBackupCodesV4' test.out

#- 408 PublicChallengeMyMFAV4
./ng net.accelbyte.sdk.cli.Main iam publicChallengeMyMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'HMl8mMX4' \
    --factor 'yzFxleIn' \
    > test.out 2>&1
eval_tap $? 408 'PublicChallengeMyMFAV4' test.out

#- 409 PublicRemoveTrustedDeviceV4
./ng net.accelbyte.sdk.cli.Main iam publicRemoveTrustedDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceToken 'g5vwsKWR' \
    > test.out 2>&1
eval_tap $? 409 'PublicRemoveTrustedDeviceV4' test.out

#- 410 PublicSendMyMFAEmailCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicSendMyMFAEmailCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --action 'LLWt1rdY' \
    --languageTag '3myOHHMk' \
    > test.out 2>&1
eval_tap $? 410 'PublicSendMyMFAEmailCodeV4' test.out

#- 411 PublicDisableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyEmailV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"factor": "VRsKWHMV", "mfaToken": "4TIGbCTl"}' \
    > test.out 2>&1
eval_tap $? 411 'PublicDisableMyEmailV4' test.out

#- 412 PublicEnableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyEmailV4 \
    --namespace "$AB_NAMESPACE" \
    --code '6i8lT8PE' \
    > test.out 2>&1
eval_tap $? 412 'PublicEnableMyEmailV4' test.out

#- 413 PublicGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam publicGetMyEnabledFactorsV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 413 'PublicGetMyEnabledFactorsV4' test.out

#- 414 PublicMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam publicMakeFactorMyDefaultV4 \
    --namespace "$AB_NAMESPACE" \
    --factor 'O8g1tTWu' \
    > test.out 2>&1
eval_tap $? 414 'PublicMakeFactorMyDefaultV4' test.out

#- 415 PublicGetMyOwnMFAStatusV4
./ng net.accelbyte.sdk.cli.Main iam publicGetMyOwnMFAStatusV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 415 'PublicGetMyOwnMFAStatusV4' test.out

#- 416 PublicGetMyMFAStatusV4
eval_tap 0 416 'PublicGetMyMFAStatusV4 # SKIP deprecated' test.out

#- 417 PublicGetUserPublicInfoByUserIdV4
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPublicInfoByUserIdV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Bumw47Iq' \
    > test.out 2>&1
eval_tap $? 417 'PublicGetUserPublicInfoByUserIdV4' test.out

#- 418 PublicInviteUserV4
./ng net.accelbyte.sdk.cli.Main iam publicInviteUserV4 \
    --body '{"additionalData": "etF7AH9S", "emailAddress": "f6nul3g1", "languageTag": "4WQvMWPJ", "namespace": "kC0XoLOW", "namespaceDisplayName": "JnhTFHaR"}' \
    > test.out 2>&1
eval_tap $? 418 'PublicInviteUserV4' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
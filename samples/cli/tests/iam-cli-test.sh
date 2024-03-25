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
    --body '{"modules": [{"docLink": "Kxv1H8k5", "groups": [{"group": "ziOdp9sl", "groupId": "LFNKEEyA", "permissions": [{"allowedActions": [27, 99, 100], "resource": "R1mKzdzu"}, {"allowedActions": [75, 10, 76], "resource": "EeSKPNOL"}, {"allowedActions": [36, 0, 23], "resource": "eRAkPWfD"}]}, {"group": "Owv5sXLU", "groupId": "WT8yR7QB", "permissions": [{"allowedActions": [34, 12, 41], "resource": "wpYYbnaF"}, {"allowedActions": [87, 79, 31], "resource": "kibl0Wpb"}, {"allowedActions": [15, 43, 6], "resource": "8rmwIZ0p"}]}, {"group": "Pr088t78", "groupId": "xowKkdMa", "permissions": [{"allowedActions": [81, 6, 100], "resource": "15YDRyDb"}, {"allowedActions": [16, 42, 24], "resource": "DsieZ3sT"}, {"allowedActions": [83, 87, 84], "resource": "Tc9wA4uT"}]}], "module": "ZnoQo7sU", "moduleId": "DNGnzqwi"}, {"docLink": "G2mhuv2o", "groups": [{"group": "I5swyzLA", "groupId": "swGfvYEa", "permissions": [{"allowedActions": [44, 46, 27], "resource": "6XCD4sy7"}, {"allowedActions": [9, 48, 65], "resource": "q032D1En"}, {"allowedActions": [88, 14, 79], "resource": "JcANYvvF"}]}, {"group": "ZCRj7SfW", "groupId": "ir9RGHpb", "permissions": [{"allowedActions": [75, 20, 83], "resource": "pSrtBywz"}, {"allowedActions": [38, 92, 27], "resource": "LJoFtF74"}, {"allowedActions": [21, 1, 2], "resource": "EB1pVKNY"}]}, {"group": "FApUzNvh", "groupId": "Mr7kw4uY", "permissions": [{"allowedActions": [67, 10, 36], "resource": "FXrbwEYC"}, {"allowedActions": [88, 81, 36], "resource": "91PuL8m9"}, {"allowedActions": [38, 44, 42], "resource": "xzpgom7W"}]}], "module": "OSz8zRU1", "moduleId": "CLvx6A50"}, {"docLink": "GJcJ4HHv", "groups": [{"group": "1C64DuVx", "groupId": "w9XMeJo5", "permissions": [{"allowedActions": [18, 1, 85], "resource": "yjG6QugW"}, {"allowedActions": [57, 60, 98], "resource": "9t92IO4t"}, {"allowedActions": [2, 90, 43], "resource": "7HmMU3CJ"}]}, {"group": "y9AAGUgq", "groupId": "OKxcoAZm", "permissions": [{"allowedActions": [86, 15, 36], "resource": "4PbdveQ7"}, {"allowedActions": [83, 16, 100], "resource": "kh9gETHX"}, {"allowedActions": [58, 64, 42], "resource": "h6tUwjBQ"}]}, {"group": "txk5vv7D", "groupId": "ODRBc6XD", "permissions": [{"allowedActions": [39, 16, 41], "resource": "JLyQXMOE"}, {"allowedActions": [71, 25, 11], "resource": "l2yMA1UX"}, {"allowedActions": [75, 94, 93], "resource": "G6oIIM4C"}]}], "module": "f3xUDVvl", "moduleId": "kIP1sJWQ"}]}' \
    > test.out 2>&1
eval_tap $? 109 'AdminUpdateAvailablePermissionsByModule' test.out

#- 110 AdminDeleteConfigPermissionsByGroup
./ng net.accelbyte.sdk.cli.Main iam adminDeleteConfigPermissionsByGroup \
    --forceDelete  \
    --body '{"groupId": "sEpfLz6C", "moduleId": "j9HCGLVV"}' \
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
    --body '[{"field": "HroW3blU", "validation": {"allowAllSpecialCharacters": false, "allowDigit": true, "allowLetter": true, "allowSpace": true, "allowUnicode": false, "avatarConfig": {"allowedPrefixes": ["c9SoN76j", "B4I6nW7V", "G3coRYrj"], "preferRegex": true, "regex": "Edglwpev"}, "blockedWord": ["LgU696T3", "3JP5BVoU", "IeEpWpoo"], "description": [{"language": "u0k7lPxp", "message": ["e937XUmk", "QCrNI6O5", "Gfjh2FP1"]}, {"language": "JeAx87Ih", "message": ["uLaVnamF", "lmsoJ9o4", "GiDwp5Wh"]}, {"language": "63NUeUul", "message": ["nsiFzINg", "AWMBdOZo", "hayF5kWJ"]}], "isCustomRegex": true, "letterCase": "STHs3nUi", "maxLength": 25, "maxRepeatingAlphaNum": 91, "maxRepeatingSpecialCharacter": 8, "minCharType": 97, "minLength": 41, "regex": "YrBQGUrE", "specialCharacterLocation": "0N7v1fMN", "specialCharacters": ["qq6lTnOr", "dcjfMV28", "NHpLqtOx"]}}, {"field": "qfvv23Ri", "validation": {"allowAllSpecialCharacters": false, "allowDigit": true, "allowLetter": false, "allowSpace": false, "allowUnicode": true, "avatarConfig": {"allowedPrefixes": ["yjdYte1n", "JadsfPZC", "pKO7MWep"], "preferRegex": false, "regex": "zpYCNpVH"}, "blockedWord": ["YDGwEmyp", "XMACRyoT", "r3yMNaji"], "description": [{"language": "ptRXy6Ar", "message": ["SBwQixvM", "qsbQpYdy", "oxLFXx9K"]}, {"language": "gBI3KXxg", "message": ["KnujytLQ", "v7XJ0YyS", "IeA3Ppoo"]}, {"language": "quSk13I5", "message": ["TFCT3aJ7", "t0yd6iWY", "OLPptyMP"]}], "isCustomRegex": false, "letterCase": "ppV8C2Zo", "maxLength": 4, "maxRepeatingAlphaNum": 46, "maxRepeatingSpecialCharacter": 18, "minCharType": 70, "minLength": 90, "regex": "BBWb14lW", "specialCharacterLocation": "Iw6VU0Sn", "specialCharacters": ["Ji7bDnda", "z28gjTAs", "3S9EXqw1"]}}, {"field": "akKYR61w", "validation": {"allowAllSpecialCharacters": true, "allowDigit": true, "allowLetter": true, "allowSpace": true, "allowUnicode": false, "avatarConfig": {"allowedPrefixes": ["bliyPjkK", "yIc6yzMH", "ouqdBy12"], "preferRegex": false, "regex": "w37GKVLP"}, "blockedWord": ["4930VbPu", "6tCxHzH6", "zd0obtJI"], "description": [{"language": "zbE7PZ9F", "message": ["ibZaOhWi", "pr10LEYb", "0H7CRE7g"]}, {"language": "cSxeoKrC", "message": ["0L69VDxq", "WyXdLAvo", "MX4Paiuz"]}, {"language": "rT2283lk", "message": ["zAZwdhbs", "6B67sktR", "NoNrHNvv"]}], "isCustomRegex": false, "letterCase": "EWaKpuvp", "maxLength": 11, "maxRepeatingAlphaNum": 3, "maxRepeatingSpecialCharacter": 61, "minCharType": 11, "minLength": 44, "regex": "XkXJNex8", "specialCharacterLocation": "mupU3unm", "specialCharacters": ["lvun7I3D", "9bYPmpCR", "pdG8bkoA"]}}]' \
    > test.out 2>&1
eval_tap $? 113 'AdminUpdateInputValidations' test.out

#- 114 AdminResetInputValidations
./ng net.accelbyte.sdk.cli.Main iam adminResetInputValidations \
    --field 'lnBCDZRF' \
    > test.out 2>&1
eval_tap $? 114 'AdminResetInputValidations' test.out

#- 115 ListAdminsV3
./ng net.accelbyte.sdk.cli.Main iam listAdminsV3 \
    --namespace "$AB_NAMESPACE" \
    --after 'cJxChEtn' \
    --before '9HbWxque' \
    --endDate 'lU3oCGiH' \
    --limit '38' \
    --query 'pSbesJH3' \
    --roleId 'V5jjFC9X' \
    --startDate '7UhIOdmK' \
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
    --body '{"ageRestriction": 17, "enable": true}' \
    > test.out 2>&1
eval_tap $? 117 'AdminUpdateAgeRestrictionConfigV3' test.out

#- 118 AdminGetListCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminGetListCountryAgeRestrictionV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 118 'AdminGetListCountryAgeRestrictionV3' test.out

#- 119 AdminUpdateCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateCountryAgeRestrictionV3 \
    --countryCode 'Jeqf2q74' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ageRestriction": 93}' \
    > test.out 2>&1
eval_tap $? 119 'AdminUpdateCountryAgeRestrictionV3' test.out

#- 120 AdminGetBannedUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType 'rYsMuWBS' \
    --limit '62' \
    --offset '9' \
    > test.out 2>&1
eval_tap $? 120 'AdminGetBannedUsersV3' test.out

#- 121 AdminBanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"ban": "RtJ8raGS", "comment": "94gNATLl", "endDate": "jgZDtUqn", "reason": "z0WhNAO5", "skipNotif": false, "userIds": ["WGPctcDM", "f5F4uMSy", "YDfuPhRr"]}' \
    > test.out 2>&1
eval_tap $? 121 'AdminBanUserBulkV3' test.out

#- 122 AdminUnbanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminUnbanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"bans": [{"banId": "UoQGZ059", "userId": "LiLFAwRV"}, {"banId": "5QhiRQDL", "userId": "ASSD9AS2"}, {"banId": "VHYNIqNL", "userId": "ew5ylI4G"}]}' \
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
    --clientId 'Og25o84r' \
    --clientName 'xCFOzYQX' \
    --clientType 'hWlIu48L' \
    --limit '49' \
    --offset '6' \
    --skipLoginQueue  \
    > test.out 2>&1
eval_tap $? 124 'AdminGetClientsByNamespaceV3' test.out

#- 125 AdminBulkUpdateClientsV3
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateClientsV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientIds": ["XXT8HJKu", "k7N4nyuq", "kCv8vL4P"], "clientUpdateRequest": {"audiences": ["3wftjVaZ", "11AmXO05", "Q0KADxvM"], "baseUri": "uUL91JhJ", "clientName": "5x8mZVJJ", "clientPermissions": [{"action": 67, "resource": "qRfpoUrJ", "schedAction": 43, "schedCron": "xxLiSVad", "schedRange": ["fv5K4bDu", "y8blDcDV", "8uQDgSdf"]}, {"action": 65, "resource": "Tv4y0bvC", "schedAction": 46, "schedCron": "6zIBbna0", "schedRange": ["GRqEWeWG", "XjUPTEUo", "8cJrb5VD"]}, {"action": 36, "resource": "WDsaaJhP", "schedAction": 11, "schedCron": "TUljc9jh", "schedRange": ["xtAHherl", "7C2fI6FO", "yi5lojwj"]}], "clientPlatform": "aEN6KlpG", "deletable": false, "description": "XtACbFiu", "modulePermissions": [{"moduleId": "DdPSXSxJ", "selectedGroups": [{"groupId": "xtyjLC9p", "selectedActions": [73, 95, 66]}, {"groupId": "AHcUV2us", "selectedActions": [62, 13, 10]}, {"groupId": "FvuMDNsz", "selectedActions": [72, 45, 55]}]}, {"moduleId": "vBhqCsAo", "selectedGroups": [{"groupId": "NlfdiOMy", "selectedActions": [1, 84, 68]}, {"groupId": "uSkd6Vij", "selectedActions": [98, 45, 60]}, {"groupId": "07OEUNGM", "selectedActions": [65, 33, 77]}]}, {"moduleId": "YMpYNjfV", "selectedGroups": [{"groupId": "IjPNwwrW", "selectedActions": [94, 91, 57]}, {"groupId": "x14JAYz4", "selectedActions": [30, 12, 51]}, {"groupId": "rZw5PCGW", "selectedActions": [22, 5, 95]}]}], "namespace": "cf6ots0N", "oauthAccessTokenExpiration": 26, "oauthAccessTokenExpirationTimeUnit": "asn7zadz", "oauthRefreshTokenExpiration": 18, "oauthRefreshTokenExpirationTimeUnit": "yWY5Md7j", "redirectUri": "39EHdcfG", "scopes": ["Q7M63hpv", "6zAJxnfN", "BCmEil2M"], "skipLoginQueue": true, "twoFactorEnabled": true}}' \
    > test.out 2>&1
eval_tap $? 125 'AdminBulkUpdateClientsV3' test.out

#- 126 AdminCreateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateClientV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["N1lpN834", "UhiNU2fY", "FjFx1gEm"], "baseUri": "TSOs52w1", "clientId": "mxIMY6Yn", "clientName": "4PjBudfX", "clientPermissions": [{"action": 37, "resource": "A8QTqVJI", "schedAction": 94, "schedCron": "lvinX5J0", "schedRange": ["guvFTUdQ", "hhU1jDXy", "RgsqRPjt"]}, {"action": 46, "resource": "sWkuA1ch", "schedAction": 3, "schedCron": "pEotdH4k", "schedRange": ["GivfNcnS", "sKDN4sRb", "erD6ctzk"]}, {"action": 91, "resource": "BzLhhLfk", "schedAction": 99, "schedCron": "plrySiCS", "schedRange": ["tPtW5RZp", "HU6E2VyI", "R6dt7Bpe"]}], "clientPlatform": "aw2NZWV6", "deletable": false, "description": "CsmpxnSJ", "modulePermissions": [{"moduleId": "5fpXu6eT", "selectedGroups": [{"groupId": "b0h6nRHG", "selectedActions": [19, 83, 64]}, {"groupId": "gZiTLVUd", "selectedActions": [41, 53, 81]}, {"groupId": "UoV52bl6", "selectedActions": [29, 57, 68]}]}, {"moduleId": "qz3QAyCg", "selectedGroups": [{"groupId": "WPq57Dao", "selectedActions": [96, 41, 58]}, {"groupId": "2d3rfHW0", "selectedActions": [88, 14, 43]}, {"groupId": "4WSx1QSy", "selectedActions": [88, 35, 46]}]}, {"moduleId": "oU4iYTiw", "selectedGroups": [{"groupId": "by0gFEux", "selectedActions": [49, 89, 58]}, {"groupId": "MmmoBvtl", "selectedActions": [85, 53, 64]}, {"groupId": "gZwmF8aq", "selectedActions": [17, 7, 60]}]}], "namespace": "lP1jgzIQ", "oauthAccessTokenExpiration": 21, "oauthAccessTokenExpirationTimeUnit": "jhvcFvvl", "oauthClientType": "80hQD2CF", "oauthRefreshTokenExpiration": 62, "oauthRefreshTokenExpirationTimeUnit": "uFuw6x49", "parentNamespace": "J37k3sqp", "redirectUri": "qPoCQ3pl", "scopes": ["MYOEmpSq", "ZNSemr9E", "aSED8m09"], "secret": "0OSmkxHS", "skipLoginQueue": false, "twoFactorEnabled": false}' \
    > test.out 2>&1
eval_tap $? 126 'AdminCreateClientV3' test.out

#- 127 AdminGetClientsbyNamespacebyIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetClientsbyNamespacebyIDV3 \
    --clientId 'jMG8JzZK' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 127 'AdminGetClientsbyNamespacebyIDV3' test.out

#- 128 AdminDeleteClientV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientV3 \
    --clientId 'G72pQImc' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 128 'AdminDeleteClientV3' test.out

#- 129 AdminUpdateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientV3 \
    --clientId 'xmoZAMQ7' \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["hxIzz7oH", "NVaJ2GgZ", "tm2KpOR4"], "baseUri": "nCclbxzw", "clientName": "Wy5yGp8j", "clientPermissions": [{"action": 74, "resource": "jUoxtgbM", "schedAction": 52, "schedCron": "QVygDoil", "schedRange": ["rscJzDza", "qUaqpHQr", "3yu9mW5i"]}, {"action": 48, "resource": "dEVmwSfQ", "schedAction": 15, "schedCron": "vBMOgLJK", "schedRange": ["twY5d0eu", "roTSOeA8", "LX3ciV7B"]}, {"action": 46, "resource": "IqNZyR2N", "schedAction": 16, "schedCron": "RH2UvC5L", "schedRange": ["3ipcHlIM", "1xhbTMgC", "qSiSZFY0"]}], "clientPlatform": "Gl1cxRQr", "deletable": true, "description": "o0cVkRZi", "modulePermissions": [{"moduleId": "FRvRzsle", "selectedGroups": [{"groupId": "5psaZ23e", "selectedActions": [44, 38, 34]}, {"groupId": "T3fC9dOo", "selectedActions": [28, 13, 57]}, {"groupId": "IoVAcZhA", "selectedActions": [51, 53, 5]}]}, {"moduleId": "VMd6qeOZ", "selectedGroups": [{"groupId": "L3MxirVG", "selectedActions": [20, 5, 52]}, {"groupId": "pwUp0WxR", "selectedActions": [47, 36, 43]}, {"groupId": "pHKn9MMp", "selectedActions": [24, 64, 64]}]}, {"moduleId": "S5TfGixH", "selectedGroups": [{"groupId": "FsowlJKz", "selectedActions": [24, 31, 11]}, {"groupId": "n4rYpy1l", "selectedActions": [8, 62, 60]}, {"groupId": "k3Ofd88Z", "selectedActions": [81, 45, 93]}]}], "namespace": "qk4auVjR", "oauthAccessTokenExpiration": 65, "oauthAccessTokenExpirationTimeUnit": "n184upHm", "oauthRefreshTokenExpiration": 63, "oauthRefreshTokenExpirationTimeUnit": "9xsLCy8a", "redirectUri": "hESoCaCy", "scopes": ["uo9bCqEt", "r8dBUPv3", "4GPlo7jj"], "skipLoginQueue": false, "twoFactorEnabled": true}' \
    > test.out 2>&1
eval_tap $? 129 'AdminUpdateClientV3' test.out

#- 130 AdminUpdateClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientPermissionV3 \
    --clientId 'wmMp5f7g' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 96, "resource": "evPHXGjW"}, {"action": 9, "resource": "ZIl8hOyq"}, {"action": 40, "resource": "WWDivsug"}]}' \
    > test.out 2>&1
eval_tap $? 130 'AdminUpdateClientPermissionV3' test.out

#- 131 AdminAddClientPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddClientPermissionsV3 \
    --clientId '5szVgcLz' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 9, "resource": "3zqGYXtO"}, {"action": 35, "resource": "aQ5WGSPL"}, {"action": 6, "resource": "DwVvERR9"}]}' \
    > test.out 2>&1
eval_tap $? 131 'AdminAddClientPermissionsV3' test.out

#- 132 AdminDeleteClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientPermissionV3 \
    --action '0' \
    --clientId 'yoYcvPGA' \
    --namespace "$AB_NAMESPACE" \
    --resource 'MVfKVTSj' \
    > test.out 2>&1
eval_tap $? 132 'AdminDeleteClientPermissionV3' test.out

#- 133 AdminGetConfigValueV3
./ng net.accelbyte.sdk.cli.Main iam adminGetConfigValueV3 \
    --configKey '4jFSmKGf' \
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
    --body '{"blacklist": ["RAL7EoO6", "RpgyeVWT", "3SCNLXbs"]}' \
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
    --limit '60' \
    --offset '46' \
    > test.out 2>&1
eval_tap $? 139 'RetrieveAllSSOLoginPlatformCredentialV3' test.out

#- 140 RetrieveThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '7cypxZLg' \
    > test.out 2>&1
eval_tap $? 140 'RetrieveThirdPartyLoginPlatformCredentialV3' test.out

#- 141 AddThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam addThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '7c3gzRjW' \
    --body '{"ACSURL": "Ljk2dF3v", "AWSCognitoRegion": "Ta2i9tyT", "AWSCognitoUserPool": "flTng3Kf", "AllowedClients": ["lVInhxuT", "T9gR0inw", "mPfy1pe4"], "AppId": "ON4iZX6N", "AuthorizationEndpoint": "CoQ3UVFV", "ClientId": "2nByIgTw", "Environment": "KCyK7yXB", "FederationMetadataURL": "neu9ReiL", "GenericOauthFlow": false, "IsActive": true, "Issuer": "kyF62NuN", "JWKSEndpoint": "gPpFfYrQ", "KeyID": "ObjkGx9b", "NetflixCertificates": {"encryptedPrivateKey": "JhzVIR3O", "encryptedPrivateKeyName": "SjHchMva", "publicCertificate": "khFuYHRs", "publicCertificateName": "oOUgOfte", "rootCertificate": "Ml7suEYe", "rootCertificateName": "Dggi8KOj"}, "OrganizationId": "iAZUtzFo", "PlatformName": "Jjd8RoCj", "RedirectUri": "6VuKoTQP", "RegisteredDomains": [{"affectedClientIDs": ["U3jLlMsb", "bXnBTqo1", "jtTVkV0Z"], "domain": "iOznoUb3", "namespaces": ["RspKxF8K", "5usR1GQi", "Tt3k5vZV"], "roleId": "bQ3itcgu"}, {"affectedClientIDs": ["h7WN7egZ", "3E012zYJ", "f2IrfGlJ"], "domain": "iT7j7J0Z", "namespaces": ["JqzpAFHp", "JBVPMeQj", "oKpCtCti"], "roleId": "qQMrcAn2"}, {"affectedClientIDs": ["R4KAgYnW", "9QmwWCUq", "dWG8EhuI"], "domain": "Vu9ChQ2C", "namespaces": ["DH9VWxAB", "i9xKQBwk", "Mtenm606"], "roleId": "Bx9G0nGb"}], "Secret": "nHUPHDAq", "TeamID": "JdROoJPy", "TokenAuthenticationType": "OKc1yMSv", "TokenClaimsMapping": {"4CMKDAvJ": "mR9BCRxf", "MChgouwP": "W5flBpZT", "j3yqhZ36": "3afhoiE8"}, "TokenEndpoint": "kuwndfZT", "UserInfoEndpoint": "wfQK1qs4", "UserInfoHTTPMethod": "ytcnMjl3", "scopes": ["30iFbnbT", "VHyBYoCI", "T8GbfHPs"]}' \
    > test.out 2>&1
eval_tap $? 141 'AddThirdPartyLoginPlatformCredentialV3' test.out

#- 142 DeleteThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'mcuUVKOF' \
    > test.out 2>&1
eval_tap $? 142 'DeleteThirdPartyLoginPlatformCredentialV3' test.out

#- 143 UpdateThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'fq40T9ei' \
    --body '{"ACSURL": "rmMzQfwZ", "AWSCognitoRegion": "wqSTFZLD", "AWSCognitoUserPool": "66YGquHq", "AllowedClients": ["x7JlYKed", "4wvzmnIJ", "sZ6FfUC7"], "AppId": "L7Iiu009", "AuthorizationEndpoint": "G561WWXL", "ClientId": "3W6Ja7YJ", "Environment": "UqmEfN5E", "FederationMetadataURL": "xyXdGzU4", "GenericOauthFlow": false, "IsActive": true, "Issuer": "MoGVf14K", "JWKSEndpoint": "6dw8p05h", "KeyID": "W8NluJb1", "NetflixCertificates": {"encryptedPrivateKey": "RCA1LQ0x", "encryptedPrivateKeyName": "MTGRRNbz", "publicCertificate": "5iOAkboG", "publicCertificateName": "ajBb4PUc", "rootCertificate": "P0XyXyo9", "rootCertificateName": "JZFiCBeF"}, "OrganizationId": "o3eCiEIw", "PlatformName": "Sjf8R52T", "RedirectUri": "D4OE1t4X", "RegisteredDomains": [{"affectedClientIDs": ["vavhDkDJ", "QBFqifIU", "kYw9paba"], "domain": "BA6kATx3", "namespaces": ["CPQxtfUR", "TsUg4lcu", "xNZ8p6gz"], "roleId": "Oc3KWnC2"}, {"affectedClientIDs": ["KqfFYx6Q", "GsH2NsEU", "sPkR8ExS"], "domain": "HuWizuAw", "namespaces": ["AkqqF2My", "nA8DSO3G", "fw68IU7h"], "roleId": "mw5kUaJv"}, {"affectedClientIDs": ["JAXb52P3", "mCn7I4JC", "kCYJ5u6e"], "domain": "tzlTWIcv", "namespaces": ["1PE4WXVI", "QSHZgX9N", "SbMtAxVP"], "roleId": "YXhWjwzM"}], "Secret": "xE2IkrBD", "TeamID": "dE5tob4N", "TokenAuthenticationType": "iRU2E01E", "TokenClaimsMapping": {"HaA9dOO7": "aarQ8RJq", "L6Kbt18K": "h2A96mw6", "TOmcHcYx": "W0dWGZHE"}, "TokenEndpoint": "c3rRWZiS", "UserInfoEndpoint": "L0Sb0gu1", "UserInfoHTTPMethod": "o3TslPwS", "scopes": ["G8oxXImT", "VCYj5FEs", "SpuYFDEi"]}' \
    > test.out 2>&1
eval_tap $? 143 'UpdateThirdPartyLoginPlatformCredentialV3' test.out

#- 144 UpdateThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'ot3JySOY' \
    --body '{"affectedClientIDs": ["5j7bknH5", "ZXBy9AC3", "gg6pnqAc"], "assignedNamespaces": ["3E9D3jty", "YmbV53X0", "df19fu3l"], "domain": "jWF26ZLL", "roleId": "6mYYbytg"}' \
    > test.out 2>&1
eval_tap $? 144 'UpdateThirdPartyLoginPlatformDomainV3' test.out

#- 145 DeleteThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'sGavmtSd' \
    --body '{"domain": "T2j2VtIo"}' \
    > test.out 2>&1
eval_tap $? 145 'DeleteThirdPartyLoginPlatformDomainV3' test.out

#- 146 RetrieveSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam retrieveSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId '4tovuJfY' \
    > test.out 2>&1
eval_tap $? 146 'RetrieveSSOLoginPlatformCredential' test.out

#- 147 AddSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam addSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'RR2DveXo' \
    --body '{"acsUrl": "d0XJ8ZZF", "apiKey": "o8EIxBwT", "appId": "eq3ZEqqC", "federationMetadataUrl": "1zvQDG5x", "isActive": true, "redirectUri": "jksxvOhr", "secret": "KgicVOjG", "ssoUrl": "S9O5uOTq"}' \
    > test.out 2>&1
eval_tap $? 147 'AddSSOLoginPlatformCredential' test.out

#- 148 DeleteSSOLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteSSOLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Vssj5hdj' \
    > test.out 2>&1
eval_tap $? 148 'DeleteSSOLoginPlatformCredentialV3' test.out

#- 149 UpdateSSOPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam updateSSOPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'UHCO6JnD' \
    --body '{"acsUrl": "Lxurn93Y", "apiKey": "I1svoTa3", "appId": "WdyuBrO1", "federationMetadataUrl": "g581fMKS", "isActive": false, "redirectUri": "L9rFQVHs", "secret": "Dm9l39r5", "ssoUrl": "Sr2F8bG1"}' \
    > test.out 2>&1
eval_tap $? 149 'UpdateSSOPlatformCredential' test.out

#- 150 AdminListUserIDByPlatformUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByPlatformUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Y2wl3Y7C' \
    --rawPID  \
    --body '{"platformUserIds": ["2xmWYRRO", "MRE8lcD3", "B35SopIs"]}' \
    > test.out 2>&1
eval_tap $? 150 'AdminListUserIDByPlatformUserIDsV3' test.out

#- 151 AdminGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'OIr3fA7P' \
    --platformUserId 'DwgILm0D' \
    > test.out 2>&1
eval_tap $? 151 'AdminGetUserByPlatformUserIDV3' test.out

#- 152 GetAdminUsersByRoleIdV3
./ng net.accelbyte.sdk.cli.Main iam getAdminUsersByRoleIdV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'vxl27TRz' \
    --after '0' \
    --before '78' \
    --limit '41' \
    > test.out 2>&1
eval_tap $? 152 'GetAdminUsersByRoleIdV3' test.out

#- 153 AdminGetUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --emailAddress 'Nn3gmGvf' \
    > test.out 2>&1
eval_tap $? 153 'AdminGetUserByEmailAddressV3' test.out

#- 154 AdminBulkUpdateUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"updateRequest": {"skipLoginQueue": false}, "userIds": ["mmGP9Pua", "l8DnR5dA", "seY7lcek"]}' \
    > test.out 2>&1
eval_tap $? 154 'AdminBulkUpdateUsersV3' test.out

#- 155 AdminGetBulkUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType 'FxGspuPO' \
    --body '{"bulkUserId": ["eEpCxEzP", "7y0Fv7EY", "eTgJZLlz"]}' \
    > test.out 2>&1
eval_tap $? 155 'AdminGetBulkUserBanV3' test.out

#- 156 AdminListUserIDByUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["INHlHKhR", "YSG13nAE", "w0w9Ufky"]}' \
    > test.out 2>&1
eval_tap $? 156 'AdminListUserIDByUserIDsV3' test.out

#- 157 AdminBulkGetUsersPlatform
./ng net.accelbyte.sdk.cli.Main iam adminBulkGetUsersPlatform \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["rgAMjHj2", "EzdhubYr", "1MQqZ965"]}' \
    > test.out 2>&1
eval_tap $? 157 'AdminBulkGetUsersPlatform' test.out

#- 158 AdminInviteUserV3
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddresses": ["F2WUQkL5", "Xt0sWAgh", "gzwW9E8y"], "isAdmin": false, "namespace": "YNXKujCm", "roles": ["JmOWInks", "va6Vy5Cw", "vfBE54Vy"]}' \
    > test.out 2>&1
eval_tap $? 158 'AdminInviteUserV3' test.out

#- 159 AdminQueryThirdPlatformLinkHistoryV3
./ng net.accelbyte.sdk.cli.Main iam adminQueryThirdPlatformLinkHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '48' \
    --offset '92' \
    --platformUserId 'SkhOuXam' \
    --platformId 'M9gVwFbJ' \
    > test.out 2>&1
eval_tap $? 159 'AdminQueryThirdPlatformLinkHistoryV3' test.out

#- 160 AdminListUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminListUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '71' \
    --offset '9' \
    > test.out 2>&1
eval_tap $? 160 'AdminListUsersV3' test.out

#- 161 AdminSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam adminSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by '18IYl7HL' \
    --endDate 'KgXgvI97' \
    --includeTotal  \
    --limit '72' \
    --offset '26' \
    --platformBy 'LaZcwYwa' \
    --platformId 'zSnGZIBP' \
    --query 'aPQSlHlq' \
    --roleIds '0gPTX9Wp' \
    --skipLoginQueue  \
    --startDate 'tpOe3wvB' \
    --testAccount  \
    > test.out 2>&1
eval_tap $? 161 'AdminSearchUserV3' test.out

#- 162 AdminGetBulkUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"listEmailAddressRequest": ["NUzjD5VN", "gvXF1H4H", "BDfWf01M"]}' \
    > test.out 2>&1
eval_tap $? 162 'AdminGetBulkUserByEmailAddressV3' test.out

#- 163 AdminGetUserByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'abjvvQp9' \
    > test.out 2>&1
eval_tap $? 163 'AdminGetUserByUserIdV3' test.out

#- 164 AdminUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '0kDIVGRO' \
    --body '{"avatarUrl": "UHlVgvzs", "country": "vFGoUdRW", "dateOfBirth": "IZWHz7u9", "displayName": "LLWDJEw6", "languageTag": "VqIcEfLg", "skipLoginQueue": false, "uniqueDisplayName": "yzxDxGp6", "userName": "fAnt9hDv"}' \
    > test.out 2>&1
eval_tap $? 164 'AdminUpdateUserV3' test.out

#- 165 AdminGetUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'lqBc3jui' \
    --activeOnly  \
    --after 'yqS3xtZ1' \
    --before 'knqjI6Vd' \
    --limit '71' \
    > test.out 2>&1
eval_tap $? 165 'AdminGetUserBanV3' test.out

#- 166 AdminBanUserV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ks64SIPk' \
    --body '{"ban": "b5XPK86K", "comment": "bb8qQcZx", "endDate": "wGTRPZRe", "reason": "PUfze4Ey", "skipNotif": false}' \
    > test.out 2>&1
eval_tap $? 166 'AdminBanUserV3' test.out

#- 167 AdminUpdateUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserBanV3 \
    --banId 'PwakywaV' \
    --namespace "$AB_NAMESPACE" \
    --userId 'xgYIKg2R' \
    --body '{"enabled": false, "skipNotif": false}' \
    > test.out 2>&1
eval_tap $? 167 'AdminUpdateUserBanV3' test.out

#- 168 AdminSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '6pX92dn4' \
    --body '{"context": "G7ujEPNJ", "emailAddress": "edAj68q4", "languageTag": "YOb3HxC8"}' \
    > test.out 2>&1
eval_tap $? 168 'AdminSendVerificationCodeV3' test.out

#- 169 AdminVerifyAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ukUgN0A3' \
    --body '{"Code": "9PZXwfjK", "ContactType": "mwGsj1GH", "LanguageTag": "mG5h22jO", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 169 'AdminVerifyAccountV3' test.out

#- 170 GetUserVerificationCode
./ng net.accelbyte.sdk.cli.Main iam getUserVerificationCode \
    --namespace "$AB_NAMESPACE" \
    --userId '2v0KXRea' \
    > test.out 2>&1
eval_tap $? 170 'GetUserVerificationCode' test.out

#- 171 AdminGetUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '0xuuknLQ' \
    > test.out 2>&1
eval_tap $? 171 'AdminGetUserDeletionStatusV3' test.out

#- 172 AdminUpdateUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '2ms49Zlt' \
    --body '{"deletionDate": 41, "enabled": false}' \
    > test.out 2>&1
eval_tap $? 172 'AdminUpdateUserDeletionStatusV3' test.out

#- 173 AdminListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'hBF45QmJ' \
    > test.out 2>&1
eval_tap $? 173 'AdminListUserAllPlatformAccountsDistinctV3' test.out

#- 174 AdminUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '5HhbggCI' \
    --body '{"code": "E1iWvlqv", "country": "P3yUQqFq", "dateOfBirth": "o9cxEG5q", "displayName": "CMF2wZqy", "emailAddress": "HYmBiz6P", "password": "peN1J9qY", "uniqueDisplayName": "qaOROwWs", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 174 'AdminUpgradeHeadlessAccountV3' test.out

#- 175 AdminDeleteUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'fwQLcLd8' \
    > test.out 2>&1
eval_tap $? 175 'AdminDeleteUserInformationV3' test.out

#- 176 AdminGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'itxGrrl6' \
    --after '0.6899595644291445' \
    --before '0.3378578157205556' \
    --limit '88' \
    > test.out 2>&1
eval_tap $? 176 'AdminGetUserLoginHistoriesV3' test.out

#- 177 AdminResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam adminResetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'HlP5d9aM' \
    --body '{"languageTag": "5EyeW523", "newPassword": "T0DfEhxc", "oldPassword": "FNTtSffA"}' \
    > test.out 2>&1
eval_tap $? 177 'AdminResetPasswordV3' test.out

#- 178 AdminUpdateUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserPermissionV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'sao1fV8j' \
    --body '{"Permissions": [{"Action": 34, "Resource": "3GSuoVQM", "SchedAction": 5, "SchedCron": "AVoD9bwe", "SchedRange": ["CL6h2rlS", "wAqYJ4cP", "8VdWNVnc"]}, {"Action": 89, "Resource": "tTE1NHvA", "SchedAction": 82, "SchedCron": "bluerS8W", "SchedRange": ["l9Y91xj5", "IgOdAkDa", "CIEWexZh"]}, {"Action": 65, "Resource": "zJIOwohY", "SchedAction": 96, "SchedCron": "ALGbZj5p", "SchedRange": ["G1x40vNQ", "ZL8lI9Zw", "UvILBbtl"]}]}' \
    > test.out 2>&1
eval_tap $? 178 'AdminUpdateUserPermissionV3' test.out

#- 179 AdminAddUserPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserPermissionsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'yMfxAKMY' \
    --body '{"Permissions": [{"Action": 93, "Resource": "Svl81LiE", "SchedAction": 19, "SchedCron": "EBjOgYLX", "SchedRange": ["GTqIysc6", "XaH00cZT", "G7pAiFNC"]}, {"Action": 16, "Resource": "6WpQvYrQ", "SchedAction": 84, "SchedCron": "g9DvccFS", "SchedRange": ["FWCPHuPe", "7Z8C17NB", "KqTKctmB"]}, {"Action": 80, "Resource": "ywT8V439", "SchedAction": 85, "SchedCron": "dcSM654d", "SchedRange": ["w2BAfZdQ", "fgM0TR0P", "nVGBG4dE"]}]}' \
    > test.out 2>&1
eval_tap $? 179 'AdminAddUserPermissionsV3' test.out

#- 180 AdminDeleteUserPermissionBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'R6WHfHGw' \
    --body '[{"Action": 15, "Resource": "ecB6j104"}, {"Action": 8, "Resource": "qqHaJNAK"}, {"Action": 7, "Resource": "U0w5d4Yj"}]' \
    > test.out 2>&1
eval_tap $? 180 'AdminDeleteUserPermissionBulkV3' test.out

#- 181 AdminDeleteUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionV3 \
    --action '40' \
    --namespace "$AB_NAMESPACE" \
    --resource 'GTNQTVoO' \
    --userId 'YDEcEd9h' \
    > test.out 2>&1
eval_tap $? 181 'AdminDeleteUserPermissionV3' test.out

#- 182 AdminGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'XwzFyenk' \
    --after 'uFuIrICQ' \
    --before 'B0qHsC1u' \
    --limit '72' \
    --platformId 'cmoBvtSw' \
    > test.out 2>&1
eval_tap $? 182 'AdminGetUserPlatformAccountsV3' test.out

#- 183 AdminGetListJusticePlatformAccounts
./ng net.accelbyte.sdk.cli.Main iam adminGetListJusticePlatformAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'edaijkgz' \
    > test.out 2>&1
eval_tap $? 183 'AdminGetListJusticePlatformAccounts' test.out

#- 184 AdminGetUserMapping
./ng net.accelbyte.sdk.cli.Main iam adminGetUserMapping \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'KniElhn0' \
    --userId '97dxtjw4' \
    > test.out 2>&1
eval_tap $? 184 'AdminGetUserMapping' test.out

#- 185 AdminCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam adminCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace '21gwSnmh' \
    --userId 'BhKfGzBE' \
    > test.out 2>&1
eval_tap $? 185 'AdminCreateJusticeUser' test.out

#- 186 AdminLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'DCYFEd3q' \
    --skipConflict  \
    --body '{"platformId": "31aMxTEe", "platformUserId": "DQHX67Z1"}' \
    > test.out 2>&1
eval_tap $? 186 'AdminLinkPlatformAccount' test.out

#- 187 AdminPlatformUnlinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformUnlinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'FZrW1ZeG' \
    --userId 'I6GQMwXX' \
    --body '{"platformNamespace": "9m9JO8Hk"}' \
    > test.out 2>&1
eval_tap $? 187 'AdminPlatformUnlinkV3' test.out

#- 188 AdminPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'ZC7r4YDx' \
    --userId 'XflDtDYT' \
    > test.out 2>&1
eval_tap $? 188 'AdminPlatformUnlinkAllV3' test.out

#- 189 AdminPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'J1y2mdpC' \
    --userId 'VSURC3DD' \
    --ticket 'nznNWBt0' \
    > test.out 2>&1
eval_tap $? 189 'AdminPlatformLinkV3' test.out

#- 190 AdminDeleteUserLinkingHistoryByPlatformIDV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserLinkingHistoryByPlatformIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Z8WX6vYX' \
    --userId 'QDHdmYQR' \
    > test.out 2>&1
eval_tap $? 190 'AdminDeleteUserLinkingHistoryByPlatformIDV3' test.out

#- 191 AdminGetThirdPartyPlatformTokenLinkStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetThirdPartyPlatformTokenLinkStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'nmWeQQUM' \
    --userId 'iVL1SejF' \
    --platformToken 'WXroyPn4' \
    > test.out 2>&1
eval_tap $? 191 'AdminGetThirdPartyPlatformTokenLinkStatusV3' test.out

#- 192 AdminGetUserSinglePlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminGetUserSinglePlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --platformId '1b2jMHMe' \
    --userId 'pM9Ds4BQ' \
    > test.out 2>&1
eval_tap $? 192 'AdminGetUserSinglePlatformAccount' test.out

#- 193 AdminDeleteUserRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRolesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZmDilWZo' \
    --body '["OY3R5Ki8", "C9X9YSMI", "WOI72YKe"]' \
    > test.out 2>&1
eval_tap $? 193 'AdminDeleteUserRolesV3' test.out

#- 194 AdminSaveUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminSaveUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'GxF35X0f' \
    --body '[{"namespace": "yB6zxb26", "roleId": "w9rsJqrr"}, {"namespace": "7rzv9QBD", "roleId": "jW5L62Ug"}, {"namespace": "ZJb2F8OU", "roleId": "CnAgvvUI"}]' \
    > test.out 2>&1
eval_tap $? 194 'AdminSaveUserRoleV3' test.out

#- 195 AdminAddUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'fpqn3CfH' \
    --userId 'SMHKfIrl' \
    > test.out 2>&1
eval_tap $? 195 'AdminAddUserRoleV3' test.out

#- 196 AdminDeleteUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'MFWCN9Hx' \
    --userId 'qcigQGAI' \
    > test.out 2>&1
eval_tap $? 196 'AdminDeleteUserRoleV3' test.out

#- 197 AdminUpdateUserStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '4QY8YeMJ' \
    --body '{"enabled": true, "reason": "XIMro3bU"}' \
    > test.out 2>&1
eval_tap $? 197 'AdminUpdateUserStatusV3' test.out

#- 198 AdminTrustlyUpdateUserIdentity
./ng net.accelbyte.sdk.cli.Main iam adminTrustlyUpdateUserIdentity \
    --namespace "$AB_NAMESPACE" \
    --userId 'KG746OUQ' \
    --body '{"emailAddress": "leWTRkj7", "password": "mUcXgO0k"}' \
    > test.out 2>&1
eval_tap $? 198 'AdminTrustlyUpdateUserIdentity' test.out

#- 199 AdminVerifyUserWithoutVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyUserWithoutVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '7UTE7K0n' \
    > test.out 2>&1
eval_tap $? 199 'AdminVerifyUserWithoutVerificationCodeV3' test.out

#- 200 AdminUpdateClientSecretV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientSecretV3 \
    --clientId 'AcLZ3fEE' \
    --namespace "$AB_NAMESPACE" \
    --body '{"newSecret": "ALzHj4B2"}' \
    > test.out 2>&1
eval_tap $? 200 'AdminUpdateClientSecretV3' test.out

#- 201 AdminCheckThirdPartyLoginPlatformAvailabilityV3
./ng net.accelbyte.sdk.cli.Main iam adminCheckThirdPartyLoginPlatformAvailabilityV3 \
    --platformId '9Y0lIqXE' \
    > test.out 2>&1
eval_tap $? 201 'AdminCheckThirdPartyLoginPlatformAvailabilityV3' test.out

#- 202 AdminGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV3 \
    --after 'ujFDFeqk' \
    --before 'HFqZt5Wm' \
    --isWildcard  \
    --limit '39' \
    > test.out 2>&1
eval_tap $? 202 'AdminGetRolesV3' test.out

#- 203 AdminCreateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV3 \
    --body '{"adminRole": true, "deletable": false, "isWildcard": false, "managers": [{"displayName": "XQlBcECV", "namespace": "94p3gVAo", "userId": "vVq3JLzc"}, {"displayName": "JfMl1ids", "namespace": "W8nmiMN1", "userId": "OKH3xKFk"}, {"displayName": "zwmS2AE3", "namespace": "CyMBhK7e", "userId": "U4fRA67c"}], "members": [{"displayName": "DEHymbUy", "namespace": "QMbGe2Q0", "userId": "LsCvCFHZ"}, {"displayName": "xIOSNVms", "namespace": "uY5HTJQF", "userId": "tvNkQFWT"}, {"displayName": "k3ZTbnAA", "namespace": "sLGwNpLD", "userId": "iVL2BjQB"}], "permissions": [{"action": 95, "resource": "adDUUNsX", "schedAction": 49, "schedCron": "wTQL3b12", "schedRange": ["MKxDHAKr", "8CEOc8Fl", "RTiqyEUl"]}, {"action": 95, "resource": "Cb5YtCUi", "schedAction": 24, "schedCron": "o2zALjo3", "schedRange": ["SaEaCmQK", "TfgrRUIc", "A9F0AVHU"]}, {"action": 50, "resource": "TvGQ4zui", "schedAction": 86, "schedCron": "SxcAxnR5", "schedRange": ["KWGRB9EX", "KZSS3OCL", "hTXUVdcl"]}], "roleName": "2NWPYESA"}' \
    > test.out 2>&1
eval_tap $? 203 'AdminCreateRoleV3' test.out

#- 204 AdminGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV3 \
    --roleId '10nGjfY0' \
    > test.out 2>&1
eval_tap $? 204 'AdminGetRoleV3' test.out

#- 205 AdminDeleteRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV3 \
    --roleId '3X1uIRxe' \
    > test.out 2>&1
eval_tap $? 205 'AdminDeleteRoleV3' test.out

#- 206 AdminUpdateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV3 \
    --roleId 'kM0LtEnj' \
    --body '{"deletable": true, "isWildcard": false, "roleName": "YnnoDygW"}' \
    > test.out 2>&1
eval_tap $? 206 'AdminUpdateRoleV3' test.out

#- 207 AdminGetRoleAdminStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleAdminStatusV3 \
    --roleId 'ND69kZ8B' \
    > test.out 2>&1
eval_tap $? 207 'AdminGetRoleAdminStatusV3' test.out

#- 208 AdminUpdateAdminRoleStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateAdminRoleStatusV3 \
    --roleId 'XXAFJpVu' \
    > test.out 2>&1
eval_tap $? 208 'AdminUpdateAdminRoleStatusV3' test.out

#- 209 AdminRemoveRoleAdminV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleAdminV3 \
    --roleId 'HDZh6pJv' \
    > test.out 2>&1
eval_tap $? 209 'AdminRemoveRoleAdminV3' test.out

#- 210 AdminGetRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleManagersV3 \
    --roleId 'KKKMJn28' \
    --after 'RXecIkrC' \
    --before '1uAsAxpJ' \
    --limit '73' \
    > test.out 2>&1
eval_tap $? 210 'AdminGetRoleManagersV3' test.out

#- 211 AdminAddRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleManagersV3 \
    --roleId 'jXsRTl1z' \
    --body '{"managers": [{"displayName": "Uma3xX8q", "namespace": "2DF90d6j", "userId": "kK8xQYBL"}, {"displayName": "O1kP94F8", "namespace": "jzJgWYtg", "userId": "qXk6X0xf"}, {"displayName": "ft2tCcXY", "namespace": "B4wPJypp", "userId": "tXa6s83y"}]}' \
    > test.out 2>&1
eval_tap $? 211 'AdminAddRoleManagersV3' test.out

#- 212 AdminRemoveRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleManagersV3 \
    --roleId 'WsQHTAUU' \
    --body '{"managers": [{"displayName": "OTVW0BL6", "namespace": "7T6jd13w", "userId": "D3ePJAHE"}, {"displayName": "mBn2ElCH", "namespace": "kS4ZnpyN", "userId": "npKyq2w2"}, {"displayName": "s60NxjGj", "namespace": "NK7evW0M", "userId": "6Zw3DiDQ"}]}' \
    > test.out 2>&1
eval_tap $? 212 'AdminRemoveRoleManagersV3' test.out

#- 213 AdminGetRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleMembersV3 \
    --roleId '2aCty3nc' \
    --after 'e82HKzXz' \
    --before 'tGBaGdsi' \
    --limit '41' \
    > test.out 2>&1
eval_tap $? 213 'AdminGetRoleMembersV3' test.out

#- 214 AdminAddRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleMembersV3 \
    --roleId 'EjZcHdlu' \
    --body '{"members": [{"displayName": "hMdHhBIB", "namespace": "K9t5J1zQ", "userId": "HS3ijpaA"}, {"displayName": "xxtD0N8r", "namespace": "WawVCRtH", "userId": "HWoB3PN1"}, {"displayName": "h1QIwzmh", "namespace": "QGu5kyPA", "userId": "mlcH3eAz"}]}' \
    > test.out 2>&1
eval_tap $? 214 'AdminAddRoleMembersV3' test.out

#- 215 AdminRemoveRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleMembersV3 \
    --roleId 'DMCW0JMb' \
    --body '{"members": [{"displayName": "UhXkazxl", "namespace": "htDmNGJz", "userId": "kfKaBrrg"}, {"displayName": "9m3SzLo0", "namespace": "VWXly9WK", "userId": "U8MyyIzJ"}, {"displayName": "odyB1MK1", "namespace": "6r7GInbW", "userId": "7MyPlpdH"}]}' \
    > test.out 2>&1
eval_tap $? 215 'AdminRemoveRoleMembersV3' test.out

#- 216 AdminUpdateRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV3 \
    --roleId 'NiLLv6dv' \
    --body '{"permissions": [{"action": 24, "resource": "r0Cy16u3", "schedAction": 47, "schedCron": "6vUHVTKw", "schedRange": ["jag8XXMA", "azmdR8n7", "03VVfZR7"]}, {"action": 33, "resource": "wWabH3Gr", "schedAction": 52, "schedCron": "FVZeyMO8", "schedRange": ["ApaYDANd", "ETbj3hrU", "Ne2PeTgE"]}, {"action": 46, "resource": "uB0GYkMi", "schedAction": 46, "schedCron": "GBv2ogDY", "schedRange": ["atY6XqLC", "81k23kK1", "yN1Li1t7"]}]}' \
    > test.out 2>&1
eval_tap $? 216 'AdminUpdateRolePermissionsV3' test.out

#- 217 AdminAddRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV3 \
    --roleId 'w9gdnQTA' \
    --body '{"permissions": [{"action": 47, "resource": "is1Myv6S", "schedAction": 42, "schedCron": "10Ln0qII", "schedRange": ["gkSXpI1L", "GtuyCB4b", "YqxkVJxS"]}, {"action": 11, "resource": "LO2zInro", "schedAction": 7, "schedCron": "Pe7XvfPP", "schedRange": ["OtftchDF", "ek7dCbJ3", "lmi4cbvz"]}, {"action": 73, "resource": "ZQKOcU2p", "schedAction": 82, "schedCron": "Z2RgiN2W", "schedRange": ["fgXxQD0k", "chMHwwuY", "t284udJP"]}]}' \
    > test.out 2>&1
eval_tap $? 217 'AdminAddRolePermissionsV3' test.out

#- 218 AdminDeleteRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV3 \
    --roleId '09az62SO' \
    --body '["UIzLgyze", "TTkgXcDi", "cARuQL9E"]' \
    > test.out 2>&1
eval_tap $? 218 'AdminDeleteRolePermissionsV3' test.out

#- 219 AdminDeleteRolePermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionV3 \
    --action '16' \
    --resource 'id5fKLhW' \
    --roleId 'PGxjyWnO' \
    > test.out 2>&1
eval_tap $? 219 'AdminDeleteRolePermissionV3' test.out

#- 220 AdminGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam adminGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 220 'AdminGetMyUserV3' test.out

#- 221 UserAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam userAuthenticationV3 \
    --clientId 'FfoDefBy' \
    --extendExp  \
    --redirectUri 'aNQp8zkS' \
    --password 'aXeYip2A' \
    --requestId 'MYpeHfqy' \
    --userName 'RUsTkS0w' \
    > test.out 2>&1
eval_tap $? 221 'UserAuthenticationV3' test.out

#- 222 AuthenticationWithPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV3 \
    --extendExp  \
    --clientId 'LJyAlwm1' \
    --linkingToken 'zHirNHpZ' \
    --password 'olzJ7F6N' \
    --username 'V8ukPr7u' \
    > test.out 2>&1
eval_tap $? 222 'AuthenticationWithPlatformLinkV3' test.out

#- 223 GenerateTokenByNewHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV3 \
    --additionalData 'hWkrTTql' \
    --extendExp  \
    --linkingToken 'BKv5iZmp' \
    > test.out 2>&1
eval_tap $? 223 'GenerateTokenByNewHeadlessAccountV3' test.out

#- 224 RequestOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam requestOneTimeLinkingCodeV3 \
    --platformId '0gb7Jlh9' \
    > test.out 2>&1
eval_tap $? 224 'RequestOneTimeLinkingCodeV3' test.out

#- 225 ValidateOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam validateOneTimeLinkingCodeV3 \
    --oneTimeLinkCode 'MgLoGoSS' \
    > test.out 2>&1
eval_tap $? 225 'ValidateOneTimeLinkingCodeV3' test.out

#- 226 RequestTokenByOneTimeLinkCodeResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTokenByOneTimeLinkCodeResponseV3 \
    --additionalData 'SdIC3Q1E' \
    --isTransient  \
    --clientId 'LdSD0dGZ' \
    --oneTimeLinkCode 'i0guVE6c' \
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
    --codeChallenge 'gPq13UdS' \
    --codeChallengeMethod 'S256' \
    --clientId 'Aa24z4yH' \
    > test.out 2>&1
eval_tap $? 229 'RequestTokenExchangeCodeV3' test.out

#- 230 AdminRetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam adminRetrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '05aaEy3A' \
    --userId 'KUPS7WW6' \
    > test.out 2>&1
eval_tap $? 230 'AdminRetrieveUserThirdPartyPlatformTokenV3' test.out

#- 231 RevokeUserV3
./ng net.accelbyte.sdk.cli.Main iam revokeUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '0d5tb3VI' \
    --includeGameNamespace  \
    > test.out 2>&1
eval_tap $? 231 'RevokeUserV3' test.out

#- 232 AuthorizeV3
./ng net.accelbyte.sdk.cli.Main iam authorizeV3 \
    --codeChallenge 'eQyK4Ted' \
    --codeChallengeMethod 'plain' \
    --createHeadless  \
    --oneTimeLinkCode 'iN7bwj8K' \
    --redirectUri 'SI0khE7p' \
    --scope 'oTW9OGUi' \
    --state 'tyWeZSWF' \
    --targetAuthPage 'lSVd0JxI' \
    --useRedirectUriAsLoginUrlWhenLocked  \
    --clientId 'xspV1YMa' \
    --responseType 'code' \
    > test.out 2>&1
eval_tap $? 232 'AuthorizeV3' test.out

#- 233 TokenIntrospectionV3
./ng net.accelbyte.sdk.cli.Main iam tokenIntrospectionV3 \
    --token '9la7gjLv' \
    > test.out 2>&1
eval_tap $? 233 'TokenIntrospectionV3' test.out

#- 234 GetJWKSV3
./ng net.accelbyte.sdk.cli.Main iam getJWKSV3 \
    > test.out 2>&1
eval_tap $? 234 'GetJWKSV3' test.out

#- 235 SendMFAAuthenticationCode
./ng net.accelbyte.sdk.cli.Main iam sendMFAAuthenticationCode \
    --clientId 'mEfpF9Nr' \
    --factor '3EaImJA8' \
    --mfaToken 'dzpGKmjq' \
    > test.out 2>&1
eval_tap $? 235 'SendMFAAuthenticationCode' test.out

#- 236 Change2faMethod
./ng net.accelbyte.sdk.cli.Main iam change2faMethod \
    --factor 'wQgJ60Ab' \
    --mfaToken 'kLNkiGk8' \
    > test.out 2>&1
eval_tap $? 236 'Change2faMethod' test.out

#- 237 Verify2faCode
./ng net.accelbyte.sdk.cli.Main iam verify2faCode \
    --code 'dWIk8lwF' \
    --factor 'MN1uRf1D' \
    --mfaToken 'pLvjiSzQ' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 237 'Verify2faCode' test.out

#- 238 RetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam retrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'RieHXqxZ' \
    --userId '0cs0Awpz' \
    > test.out 2>&1
eval_tap $? 238 'RetrieveUserThirdPartyPlatformTokenV3' test.out

#- 239 AuthCodeRequestV3
./ng net.accelbyte.sdk.cli.Main iam authCodeRequestV3 \
    --platformId 'FOXAyDhr' \
    --clientId 'oybrCTgv' \
    --redirectUri 'D98Syft6' \
    --requestId '80JIh1VY' \
    > test.out 2>&1
eval_tap $? 239 'AuthCodeRequestV3' test.out

#- 240 PlatformTokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV3 \
    --platformId 'N59OOa8R' \
    --additionalData 'tA7yNzKs' \
    --clientId '6uLAlNyo' \
    --createHeadless  \
    --deviceId 'KMW6gRaZ' \
    --macAddress 'k09TYDAv' \
    --platformToken 'S1PkLYWT' \
    --skipSetCookie  \
    > test.out 2>&1
eval_tap $? 240 'PlatformTokenGrantV3' test.out

#- 241 GetRevocationListV3
./ng net.accelbyte.sdk.cli.Main iam getRevocationListV3 \
    > test.out 2>&1
eval_tap $? 241 'GetRevocationListV3' test.out

#- 242 TokenRevocationV3
./ng net.accelbyte.sdk.cli.Main iam tokenRevocationV3 \
    --token 'UPYgy8SX' \
    > test.out 2>&1
eval_tap $? 242 'TokenRevocationV3' test.out

#- 243 SimultaneousLoginV3
./ng net.accelbyte.sdk.cli.Main iam simultaneousLoginV3 \
    --simultaneousPlatform '1WLmLHRP' \
    --simultaneousTicket 'Au7DmxdW' \
    --nativePlatform 'epicgames' \
    --nativePlatformTicket 'jihSricI' \
    > test.out 2>&1
eval_tap $? 243 'SimultaneousLoginV3' test.out

#- 244 TokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV3 \
    --additionalData 'Ep9kCcri' \
    --clientId 'Gr3soNgq' \
    --code 'Lkr9R4ya' \
    --codeVerifier 'Ud7jLRoW' \
    --extendNamespace 'iILmamgf' \
    --extendExp  \
    --password 'BonaWKFp' \
    --redirectUri 'P2vZZrHk' \
    --refreshToken 'qhAqVbl4' \
    --username 'ZZ6xI8vP' \
    --grantType 'urn:ietf:params:oauth:grant-type:extend_client_credentials' \
    > test.out 2>&1
eval_tap $? 244 'TokenGrantV3' test.out

#- 245 VerifyTokenV3
./ng net.accelbyte.sdk.cli.Main iam verifyTokenV3 \
    --token 'mEPRRrec' \
    > test.out 2>&1
eval_tap $? 245 'VerifyTokenV3' test.out

#- 246 PlatformAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticationV3 \
    --platformId 'CXMBdd3n' \
    --code 'SLRl4Omn' \
    --error 'ymHhLAmC' \
    --openidAssocHandle 'N3drlvgB' \
    --openidClaimedId 'yGLxmLT3' \
    --openidIdentity '1di0wBpi' \
    --openidMode 'waEMfz3V' \
    --openidNs 'SX9OljGy' \
    --openidOpEndpoint '3vgYuL7R' \
    --openidResponseNonce 'EeiFyUgB' \
    --openidReturnTo 'RSfiO18K' \
    --openidSig 'angwo8nq' \
    --openidSigned 'KgiwHegg' \
    --state 'DDfmSCuE' \
    > test.out 2>&1
eval_tap $? 246 'PlatformAuthenticationV3' test.out

#- 247 PlatformTokenRefreshV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenRefreshV3 \
    --platformId 'notbOUDL' \
    --platformToken 'bOZSVjMn' \
    > test.out 2>&1
eval_tap $? 247 'PlatformTokenRefreshV3' test.out

#- 248 PublicGetInputValidations
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidations \
    --defaultOnEmpty  \
    --languageCode 'aAcsUPcG' \
    > test.out 2>&1
eval_tap $? 248 'PublicGetInputValidations' test.out

#- 249 PublicGetInputValidationByField
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidationByField \
    --field 'dBXhv5a6' \
    > test.out 2>&1
eval_tap $? 249 'PublicGetInputValidationByField' test.out

#- 250 PublicGetCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam publicGetCountryAgeRestrictionV3 \
    --countryCode 'IPnOd30Y' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 250 'PublicGetCountryAgeRestrictionV3' test.out

#- 251 PublicGetConfigValueV3
./ng net.accelbyte.sdk.cli.Main iam publicGetConfigValueV3 \
    --configKey 'iMMOJtQa' \
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
    --clientId 'eL31gjSr' \
    > test.out 2>&1
eval_tap $? 254 'RetrieveActiveOIDCClientsPublicV3' test.out

#- 255 PublicListUserIDByPlatformUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserIDByPlatformUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '9C9lhGs0' \
    --rawPID  \
    --body '{"platformUserIds": ["1eC2ehXe", "uTuyKjKT", "JI6r2wPT"]}' \
    > test.out 2>&1
eval_tap $? 255 'PublicListUserIDByPlatformUserIDsV3' test.out

#- 256 PublicGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'nYla092M' \
    --platformUserId 'cYDL1CNi' \
    > test.out 2>&1
eval_tap $? 256 'PublicGetUserByPlatformUserIDV3' test.out

#- 257 PublicGetAsyncStatus
./ng net.accelbyte.sdk.cli.Main iam publicGetAsyncStatus \
    --namespace "$AB_NAMESPACE" \
    --requestId 'X6PYS8SN' \
    > test.out 2>&1
eval_tap $? 257 'PublicGetAsyncStatus' test.out

#- 258 PublicSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam publicSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'xnhgqjcK' \
    --limit '23' \
    --offset '15' \
    --platformBy '5JMooQua' \
    --platformId 'dFWPIA6c' \
    --query 'vikg6ovz' \
    > test.out 2>&1
eval_tap $? 258 'PublicSearchUserV3' test.out

#- 259 PublicCreateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "8KIPKcq6", "acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "OtT8RXJW", "policyId": "HXszCRmM", "policyVersionId": "b5ijPhfi"}, {"isAccepted": true, "localizedPolicyVersionId": "jJ0PYUJ7", "policyId": "2iinVaHH", "policyVersionId": "prjDbczM"}, {"isAccepted": true, "localizedPolicyVersionId": "qaY9kRW8", "policyId": "YVLdn0TY", "policyVersionId": "aI0f3b9j"}], "authType": "nNdAZmzx", "code": "iErsLhys", "country": "8mKy7HKD", "dateOfBirth": "ZsGw64H8", "displayName": "tMmnc7Er", "emailAddress": "qzAGbthf", "password": "Hm8cgifc", "reachMinimumAge": true, "uniqueDisplayName": "QPb3gkEG"}' \
    > test.out 2>&1
eval_tap $? 259 'PublicCreateUserV3' test.out

#- 260 CheckUserAvailability
./ng net.accelbyte.sdk.cli.Main iam checkUserAvailability \
    --namespace "$AB_NAMESPACE" \
    --field 'vUa825VF' \
    --query 'TLRRHizK' \
    > test.out 2>&1
eval_tap $? 260 'CheckUserAvailability' test.out

#- 261 PublicBulkGetUsers
./ng net.accelbyte.sdk.cli.Main iam publicBulkGetUsers \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["DZGrSwUA", "1NKvr3r0", "Ei7hs0ya"]}' \
    > test.out 2>&1
eval_tap $? 261 'PublicBulkGetUsers' test.out

#- 262 PublicSendRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicSendRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "vZinkIWa", "languageTag": "yv8LhPgt"}' \
    > test.out 2>&1
eval_tap $? 262 'PublicSendRegistrationCode' test.out

#- 263 PublicVerifyRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicVerifyRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "xEydoioE", "emailAddress": "spxw1Fd0"}' \
    > test.out 2>&1
eval_tap $? 263 'PublicVerifyRegistrationCode' test.out

#- 264 PublicForgotPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicForgotPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "EZ68C0D8", "languageTag": "H1c3Iumu"}' \
    > test.out 2>&1
eval_tap $? 264 'PublicForgotPasswordV3' test.out

#- 265 GetAdminInvitationV3
./ng net.accelbyte.sdk.cli.Main iam getAdminInvitationV3 \
    --invitationId 'n4KltVSj' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 265 'GetAdminInvitationV3' test.out

#- 266 CreateUserFromInvitationV3
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV3 \
    --invitationId '2K9Y26j7' \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "Jdm2S6oF", "acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "Oo5iT5Jf", "policyId": "1Z9R6zag", "policyVersionId": "WCpX8LpB"}, {"isAccepted": false, "localizedPolicyVersionId": "SeUVfhxn", "policyId": "Iq2gSFcO", "policyVersionId": "PJyXJxtJ"}, {"isAccepted": true, "localizedPolicyVersionId": "OkIgOa9w", "policyId": "xiLTGizF", "policyVersionId": "Hm4TncuX"}], "authType": "JvN4q01Q", "code": "Ja204DkD", "country": "Zl8jbNh7", "dateOfBirth": "kPJRT8VQ", "displayName": "HYGo4Jm0", "emailAddress": "E2wkchoJ", "password": "HfdEVIVf", "reachMinimumAge": true, "uniqueDisplayName": "WRPYWebJ"}' \
    > test.out 2>&1
eval_tap $? 266 'CreateUserFromInvitationV3' test.out

#- 267 UpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam updateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "mzmtaz2V", "country": "B6NY6Lmi", "dateOfBirth": "dSolWu87", "displayName": "reZppA4g", "languageTag": "IutYLNVN", "uniqueDisplayName": "Uz54KkPX", "userName": "ZsRcl1NX"}' \
    > test.out 2>&1
eval_tap $? 267 'UpdateUserV3' test.out

#- 268 PublicPartialUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicPartialUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "gL9MRcXH", "country": "bo6y9Wjg", "dateOfBirth": "T0ODr3mr", "displayName": "ophIO8dN", "languageTag": "Uq1DZ2P2", "uniqueDisplayName": "zIQ6GrvM", "userName": "wkcN1OyV"}' \
    > test.out 2>&1
eval_tap $? 268 'PublicPartialUpdateUserV3' test.out

#- 269 PublicSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"context": "YgyHMQwt", "emailAddress": "VsROE6sN", "languageTag": "Uk1xw6ll"}' \
    > test.out 2>&1
eval_tap $? 269 'PublicSendVerificationCodeV3' test.out

#- 270 PublicUserVerificationV3
./ng net.accelbyte.sdk.cli.Main iam publicUserVerificationV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "Ygffkabn", "contactType": "v6cWQPaA", "languageTag": "cG5DuY95", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 270 'PublicUserVerificationV3' test.out

#- 271 PublicUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "gRkHBR5T", "country": "IiueNWf7", "dateOfBirth": "Vs4M74lb", "displayName": "G3TgI5X3", "emailAddress": "K2pObyCe", "password": "yfeATuBy", "uniqueDisplayName": "mGfyOrfF", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 271 'PublicUpgradeHeadlessAccountV3' test.out

#- 272 PublicVerifyHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --needVerificationCode  \
    --body '{"emailAddress": "dqOMvSFm", "password": "edUafqB6"}' \
    > test.out 2>&1
eval_tap $? 272 'PublicVerifyHeadlessAccountV3' test.out

#- 273 PublicUpdatePasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicUpdatePasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"languageTag": "WYFtxbwx", "newPassword": "cV46NvN6", "oldPassword": "Ie997ptc"}' \
    > test.out 2>&1
eval_tap $? 273 'PublicUpdatePasswordV3' test.out

#- 274 PublicCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam publicCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'a4WNHuog' \
    > test.out 2>&1
eval_tap $? 274 'PublicCreateJusticeUser' test.out

#- 275 PublicPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'x1EdzoqN' \
    --redirectUri 'Kg0rx5Dd' \
    --ticket 'UMbMVNkb' \
    > test.out 2>&1
eval_tap $? 275 'PublicPlatformLinkV3' test.out

#- 276 PublicPlatformUnlinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'BK2uZbjv' \
    --body '{"platformNamespace": "xPRkkm1W"}' \
    > test.out 2>&1
eval_tap $? 276 'PublicPlatformUnlinkV3' test.out

#- 277 PublicPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'jcVNE40Q' \
    > test.out 2>&1
eval_tap $? 277 'PublicPlatformUnlinkAllV3' test.out

#- 278 PublicForcePlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicForcePlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'LgrWzzhs' \
    --ticket 'NG5hQ9Th' \
    > test.out 2>&1
eval_tap $? 278 'PublicForcePlatformLinkV3' test.out

#- 279 PublicWebLinkPlatform
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatform \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Akca6wzx' \
    --clientId 'NWchNmZ8' \
    --redirectUri 'B2dXPi7d' \
    > test.out 2>&1
eval_tap $? 279 'PublicWebLinkPlatform' test.out

#- 280 PublicWebLinkPlatformEstablish
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatformEstablish \
    --namespace "$AB_NAMESPACE" \
    --platformId 'IxrXliLs' \
    --code 'iwtjaXOU' \
    --state '7bJP46LN' \
    > test.out 2>&1
eval_tap $? 280 'PublicWebLinkPlatformEstablish' test.out

#- 281 PublicProcessWebLinkPlatformV3
./ng net.accelbyte.sdk.cli.Main iam publicProcessWebLinkPlatformV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'l8q8mVOm' \
    --code 'd3UVNPAK' \
    --state '88xh7wWU' \
    > test.out 2>&1
eval_tap $? 281 'PublicProcessWebLinkPlatformV3' test.out

#- 282 PublicGetUsersPlatformInfosV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUsersPlatformInfosV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"platformId": "EDIkGkxP", "userIds": ["ZwzjppPj", "rMgIjaFz", "JHWL4V2D"]}' \
    > test.out 2>&1
eval_tap $? 282 'PublicGetUsersPlatformInfosV3' test.out

#- 283 ResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam resetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "qtEllO7r", "emailAddress": "q8ERgeJ8", "newPassword": "jdrRJh91"}' \
    > test.out 2>&1
eval_tap $? 283 'ResetPasswordV3' test.out

#- 284 PublicGetUserByUserIdV3
eval_tap 0 284 'PublicGetUserByUserIdV3 # SKIP deprecated' test.out

#- 285 PublicGetUserBanHistoryV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserBanHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '9FbyWq8v' \
    --activeOnly  \
    --after 'PeN8jsgB' \
    --before 'idu97gDx' \
    --limit '45' \
    > test.out 2>&1
eval_tap $? 285 'PublicGetUserBanHistoryV3' test.out

#- 286 PublicListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'UzTO61B8' \
    > test.out 2>&1
eval_tap $? 286 'PublicListUserAllPlatformAccountsDistinctV3' test.out

#- 287 PublicGetUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'vN5fMEFm' \
    > test.out 2>&1
eval_tap $? 287 'PublicGetUserInformationV3' test.out

#- 288 PublicGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'W0PqXVy4' \
    --after '0.062158030467238' \
    --before '0.34736638161849176' \
    --limit '59' \
    > test.out 2>&1
eval_tap $? 288 'PublicGetUserLoginHistoriesV3' test.out

#- 289 PublicGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'saiWDs0B' \
    --after '2FD8EFHC' \
    --before 'IMnxSiAD' \
    --limit '33' \
    --platformId 'udYp2plK' \
    > test.out 2>&1
eval_tap $? 289 'PublicGetUserPlatformAccountsV3' test.out

#- 290 PublicListJusticePlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicListJusticePlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'e9tIT0rE' \
    > test.out 2>&1
eval_tap $? 290 'PublicListJusticePlatformAccountsV3' test.out

#- 291 PublicLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam publicLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'AFUvVFCd' \
    --body '{"platformId": "q3VaVAVD", "platformUserId": "pGtfmNpL"}' \
    > test.out 2>&1
eval_tap $? 291 'PublicLinkPlatformAccount' test.out

#- 292 PublicForceLinkPlatformWithProgression
./ng net.accelbyte.sdk.cli.Main iam publicForceLinkPlatformWithProgression \
    --namespace "$AB_NAMESPACE" \
    --userId '8GfznbNJ' \
    --body '{"chosenNamespaces": ["5jlGIbIB", "WtUBIZa2", "Yg1xnNiE"], "requestId": "61ZbWWha"}' \
    > test.out 2>&1
eval_tap $? 292 'PublicForceLinkPlatformWithProgression' test.out

#- 293 PublicGetPublisherUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetPublisherUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'FFsscQum' \
    > test.out 2>&1
eval_tap $? 293 'PublicGetPublisherUserV3' test.out

#- 294 PublicValidateUserByUserIDAndPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserByUserIDAndPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'DH0A08qT' \
    --password 'GlXQXIos' \
    > test.out 2>&1
eval_tap $? 294 'PublicValidateUserByUserIDAndPasswordV3' test.out

#- 295 PublicGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRolesV3 \
    --after 'McqEzA4g' \
    --before 'F301IKxv' \
    --isWildcard  \
    --limit '42' \
    > test.out 2>&1
eval_tap $? 295 'PublicGetRolesV3' test.out

#- 296 PublicGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRoleV3 \
    --roleId 'haU2hbNO' \
    > test.out 2>&1
eval_tap $? 296 'PublicGetRoleV3' test.out

#- 297 PublicGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyUserV3 \
    --includeAllPlatforms  \
    > test.out 2>&1
eval_tap $? 297 'PublicGetMyUserV3' test.out

#- 298 PublicGetLinkHeadlessAccountToMyAccountConflictV3
./ng net.accelbyte.sdk.cli.Main iam publicGetLinkHeadlessAccountToMyAccountConflictV3 \
    --oneTimeLinkCode 'AkOWSmMH' \
    > test.out 2>&1
eval_tap $? 298 'PublicGetLinkHeadlessAccountToMyAccountConflictV3' test.out

#- 299 LinkHeadlessAccountToMyAccountV3
./ng net.accelbyte.sdk.cli.Main iam linkHeadlessAccountToMyAccountV3 \
    --body '{"chosenNamespaces": ["VCENMGFQ", "pu28tRg8", "7QoYxD4n"], "oneTimeLinkCode": "QRdGomId"}' \
    > test.out 2>&1
eval_tap $? 299 'LinkHeadlessAccountToMyAccountV3' test.out

#- 300 PublicSendVerificationLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationLinkV3 \
    --body '{"languageTag": "o1ZH0ZAF"}' \
    > test.out 2>&1
eval_tap $? 300 'PublicSendVerificationLinkV3' test.out

#- 301 PublicVerifyUserByLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyUserByLinkV3 \
    --code 'sOdBAVsI' \
    > test.out 2>&1
eval_tap $? 301 'PublicVerifyUserByLinkV3' test.out

#- 302 PlatformAuthenticateSAMLV3Handler
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticateSAMLV3Handler \
    --platformId 'Qpb5DeFP' \
    --code 'mAE6wftM' \
    --error 'P8HNVm7k' \
    --state '8sZCNyF9' \
    > test.out 2>&1
eval_tap $? 302 'PlatformAuthenticateSAMLV3Handler' test.out

#- 303 LoginSSOClient
./ng net.accelbyte.sdk.cli.Main iam loginSSOClient \
    --platformId 'Dt8QNt5v' \
    --payload 'kQ9DuO6B' \
    > test.out 2>&1
eval_tap $? 303 'LoginSSOClient' test.out

#- 304 LogoutSSOClient
./ng net.accelbyte.sdk.cli.Main iam logoutSSOClient \
    --platformId 'rs6eDlpA' \
    > test.out 2>&1
eval_tap $? 304 'LogoutSSOClient' test.out

#- 305 RequestTargetTokenResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTargetTokenResponseV3 \
    --additionalData '6SWSeBVJ' \
    --code 'OxIXzUGf' \
    > test.out 2>&1
eval_tap $? 305 'RequestTargetTokenResponseV3' test.out

#- 306 AdminListInvitationHistoriesV4
./ng net.accelbyte.sdk.cli.Main iam adminListInvitationHistoriesV4 \
    --limit '78' \
    --namespace "$AB_NAMESPACE" \
    --offset '45' \
    > test.out 2>&1
eval_tap $? 306 'AdminListInvitationHistoriesV4' test.out

#- 307 AdminGetDevicesByUserV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDevicesByUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'YF4q2A9f' \
    > test.out 2>&1
eval_tap $? 307 'AdminGetDevicesByUserV4' test.out

#- 308 AdminGetBannedDevicesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedDevicesV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceType 'GRxIAdaW' \
    --endDate 'aba7m2hn' \
    --limit '21' \
    --offset '59' \
    --startDate 'lfJy0rsn' \
    > test.out 2>&1
eval_tap $? 308 'AdminGetBannedDevicesV4' test.out

#- 309 AdminGetUserDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeviceBansV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'VezUtQM8' \
    > test.out 2>&1
eval_tap $? 309 'AdminGetUserDeviceBansV4' test.out

#- 310 AdminBanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminBanDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"comment": "i0Qfidwc", "deviceId": "SkgKzEIA", "deviceType": "R3eaLDGs", "enabled": true, "endDate": "W2QafHbf", "ext": {"Ezl9XQLG": {}, "JwrEGzpS": {}, "0ktDHKxe": {}}, "reason": "Ff4eFqJu"}' \
    > test.out 2>&1
eval_tap $? 310 'AdminBanDeviceV4' test.out

#- 311 AdminGetDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBanV4 \
    --banId 'nnbOVUMh' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 311 'AdminGetDeviceBanV4' test.out

#- 312 AdminUpdateDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateDeviceBanV4 \
    --banId 'FurWgwYo' \
    --namespace "$AB_NAMESPACE" \
    --body '{"enabled": false}' \
    > test.out 2>&1
eval_tap $? 312 'AdminUpdateDeviceBanV4' test.out

#- 313 AdminGenerateReportV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateReportV4 \
    --namespace "$AB_NAMESPACE" \
    --endDate 'js7MTHc8' \
    --startDate '7EKMvsZH' \
    --deviceType 'DnCkKugU' \
    > test.out 2>&1
eval_tap $? 313 'AdminGenerateReportV4' test.out

#- 314 AdminGetDeviceTypesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceTypesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 314 'AdminGetDeviceTypesV4' test.out

#- 315 AdminGetDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBansV4 \
    --deviceId 'TXzj83yo' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 315 'AdminGetDeviceBansV4' test.out

#- 316 AdminDecryptDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminDecryptDeviceV4 \
    --deviceId 'LNlB5ZDI' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 316 'AdminDecryptDeviceV4' test.out

#- 317 AdminUnbanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminUnbanDeviceV4 \
    --deviceId 'cTM0xt3b' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 317 'AdminUnbanDeviceV4' test.out

#- 318 AdminGetUsersByDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUsersByDeviceV4 \
    --deviceId 'CdZGr7DT' \
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
    --limit '30' \
    --offset '93' \
    > test.out 2>&1
eval_tap $? 320 'AdminGetNamespaceUserInvitationHistoryV4' test.out

#- 321 AdminCreateTestUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateTestUsersV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 7}' \
    > test.out 2>&1
eval_tap $? 321 'AdminCreateTestUsersV4' test.out

#- 322 AdminCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "2nSOZCdg", "policyId": "oo6Uj7ML", "policyVersionId": "WaOT1hTx"}, {"isAccepted": true, "localizedPolicyVersionId": "y10xdi81", "policyId": "SQR55n58", "policyVersionId": "7Memznve"}, {"isAccepted": true, "localizedPolicyVersionId": "t0vZjdZf", "policyId": "E2N2M5j2", "policyVersionId": "R0bhFArK"}], "authType": "EMAILPASSWD", "code": "AW0muU9G", "country": "tpC9PgIk", "dateOfBirth": "pSCXvqKa", "displayName": "4hE7UVSj", "emailAddress": "tdZTTTVS", "password": "GoTquzXF", "passwordMD5Sum": "BJWVqaFI", "reachMinimumAge": true, "uniqueDisplayName": "tr3FmDoh", "username": "ev3ULj54"}' \
    > test.out 2>&1
eval_tap $? 322 'AdminCreateUserV4' test.out

#- 323 AdminBulkUpdateUserAccountTypeV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateUserAccountTypeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"testAccount": true, "userIds": ["47agubUG", "vJgoIghr", "fuRn6ArK"]}' \
    > test.out 2>&1
eval_tap $? 323 'AdminBulkUpdateUserAccountTypeV4' test.out

#- 324 AdminBulkCheckValidUserIDV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkCheckValidUserIDV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["KTvmN6uE", "WKER9JX5", "oGySB5J4"]}' \
    > test.out 2>&1
eval_tap $? 324 'AdminBulkCheckValidUserIDV4' test.out

#- 325 AdminUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'sU4UqTC9' \
    --body '{"avatarUrl": "8oN26aLl", "country": "Hxf7YgrN", "dateOfBirth": "F0gjEw3L", "displayName": "Ts2ji9sg", "languageTag": "sanP8glB", "skipLoginQueue": true, "uniqueDisplayName": "TpHQ7At3", "userName": "ECzh9HV3"}' \
    > test.out 2>&1
eval_tap $? 325 'AdminUpdateUserV4' test.out

#- 326 AdminUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZuM3jwqX' \
    --body '{"code": "YJQJHOLx", "emailAddress": "3bFzNBUH"}' \
    > test.out 2>&1
eval_tap $? 326 'AdminUpdateUserEmailAddressV4' test.out

#- 327 AdminDisableUserMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableUserMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'DyiNgYkZ' \
    > test.out 2>&1
eval_tap $? 327 'AdminDisableUserMFAV4' test.out

#- 328 AdminListUserRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminListUserRolesV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Sd69vGu1' \
    > test.out 2>&1
eval_tap $? 328 'AdminListUserRolesV4' test.out

#- 329 AdminUpdateUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '6URfEPvL' \
    --body '{"assignedNamespaces": ["fYuTmfIM", "AWHGJqAI", "FBAnzcJt"], "roleId": "rkNqTYsp"}' \
    > test.out 2>&1
eval_tap $? 329 'AdminUpdateUserRoleV4' test.out

#- 330 AdminAddUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'CTFFNUxX' \
    --body '{"assignedNamespaces": ["ZM4Umwso", "urW9Cpzt", "sjZr98TP"], "roleId": "UNPWSFnu"}' \
    > test.out 2>&1
eval_tap $? 330 'AdminAddUserRoleV4' test.out

#- 331 AdminRemoveUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRemoveUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 's3w4ECrX' \
    --body '{"assignedNamespaces": ["GUruIc47", "SWlWW4m5", "0DwwMo8c"], "roleId": "7WOV3lAA"}' \
    > test.out 2>&1
eval_tap $? 331 'AdminRemoveUserRoleV4' test.out

#- 332 AdminGetRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV4 \
    --adminRole  \
    --isWildcard  \
    --limit '86' \
    --offset '95' \
    > test.out 2>&1
eval_tap $? 332 'AdminGetRolesV4' test.out

#- 333 AdminCreateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV4 \
    --body '{"adminRole": false, "deletable": true, "isWildcard": false, "roleName": "CP2oJDot"}' \
    > test.out 2>&1
eval_tap $? 333 'AdminCreateRoleV4' test.out

#- 334 AdminGetRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV4 \
    --roleId 'J5rAcOYK' \
    > test.out 2>&1
eval_tap $? 334 'AdminGetRoleV4' test.out

#- 335 AdminDeleteRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV4 \
    --roleId 'L4XBlupP' \
    > test.out 2>&1
eval_tap $? 335 'AdminDeleteRoleV4' test.out

#- 336 AdminUpdateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV4 \
    --roleId 'onbNRtso' \
    --body '{"adminRole": false, "deletable": true, "isWildcard": true, "roleName": "mo2YRYzB"}' \
    > test.out 2>&1
eval_tap $? 336 'AdminUpdateRoleV4' test.out

#- 337 AdminUpdateRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV4 \
    --roleId 'H39pShNm' \
    --body '{"permissions": [{"action": 76, "resource": "3n4JNzRF", "schedAction": 98, "schedCron": "Q1PQ2DhJ", "schedRange": ["TVEZDXny", "8WsMObvU", "xmOrE7UR"]}, {"action": 38, "resource": "htJ7m5Fr", "schedAction": 74, "schedCron": "ge0xN8TF", "schedRange": ["HxRopGqI", "xAk60MyN", "fOk4J3ku"]}, {"action": 25, "resource": "kZHim7vR", "schedAction": 97, "schedCron": "4NjmmlO9", "schedRange": ["eQvV9v2v", "7ud7DMiP", "G4WVlJ3j"]}]}' \
    > test.out 2>&1
eval_tap $? 337 'AdminUpdateRolePermissionsV4' test.out

#- 338 AdminAddRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV4 \
    --roleId 'McJOZmwQ' \
    --body '{"permissions": [{"action": 96, "resource": "Xq7exzvI", "schedAction": 3, "schedCron": "CJNBDQpJ", "schedRange": ["aUE9LWBY", "a2HD6Qju", "kPbodv7j"]}, {"action": 67, "resource": "H0srVSv1", "schedAction": 13, "schedCron": "VyUIh2SK", "schedRange": ["0ErWzOFj", "AhRbOZrw", "k8XDMgoc"]}, {"action": 14, "resource": "xibi2lee", "schedAction": 82, "schedCron": "uyYN27ir", "schedRange": ["WoEB9cbH", "ICiKHfVX", "6Ko0Ap0b"]}]}' \
    > test.out 2>&1
eval_tap $? 338 'AdminAddRolePermissionsV4' test.out

#- 339 AdminDeleteRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV4 \
    --roleId 'SS431YNW' \
    --body '["KwCdznVO", "mavUE9HS", "sWstaLGf"]' \
    > test.out 2>&1
eval_tap $? 339 'AdminDeleteRolePermissionsV4' test.out

#- 340 AdminListAssignedUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminListAssignedUsersV4 \
    --roleId '3nDZC6PE' \
    --after 'or4cqFRv' \
    --before 'x5IUMYh3' \
    --limit '1' \
    > test.out 2>&1
eval_tap $? 340 'AdminListAssignedUsersV4' test.out

#- 341 AdminAssignUserToRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAssignUserToRoleV4 \
    --roleId 'RuaPGNIX' \
    --body '{"assignedNamespaces": ["h0XusLaJ", "ua7kQ5jg", "jKa3OBGK"], "namespace": "7EzWHlc0", "userId": "buzb0Jch"}' \
    > test.out 2>&1
eval_tap $? 341 'AdminAssignUserToRoleV4' test.out

#- 342 AdminRevokeUserFromRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRevokeUserFromRoleV4 \
    --roleId 'tdqTceg4' \
    --body '{"namespace": "yIb00Wlb", "userId": "1tJkHagh"}' \
    > test.out 2>&1
eval_tap $? 342 'AdminRevokeUserFromRoleV4' test.out

#- 343 AdminInviteUserNewV4
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserNewV4 \
    --body '{"assignedNamespaces": ["zAXuYYRY", "iUchGjIM", "ZRoe5f1H"], "emailAddresses": ["nx90d0E0", "68GXslfp", "h4bkv4yW"], "isAdmin": false, "isNewStudio": true, "namespace": "JnTGrqS9", "roleId": "93APUmy9"}' \
    > test.out 2>&1
eval_tap $? 343 'AdminInviteUserNewV4' test.out

#- 344 AdminUpdateMyUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateMyUserV4 \
    --body '{"avatarUrl": "VUtnZqKO", "country": "qBYEVQOW", "dateOfBirth": "RdO3Xmso", "displayName": "TWUtoaLU", "languageTag": "Pv84Mg9L", "skipLoginQueue": true, "uniqueDisplayName": "bKdgrxxI", "userName": "XKxr3tQs"}' \
    > test.out 2>&1
eval_tap $? 344 'AdminUpdateMyUserV4' test.out

#- 345 AdminDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyAuthenticatorV4 \
    > test.out 2>&1
eval_tap $? 345 'AdminDisableMyAuthenticatorV4' test.out

#- 346 AdminEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyAuthenticatorV4 \
    --code 'IHWIwEML' \
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
    --code 'c6u6Ehe3' \
    > test.out 2>&1
eval_tap $? 358 'AdminEnableMyEmailV4' test.out

#- 359 AdminGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyEnabledFactorsV4 \
    > test.out 2>&1
eval_tap $? 359 'AdminGetMyEnabledFactorsV4' test.out

#- 360 AdminMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam adminMakeFactorMyDefaultV4 \
    --factor 'DMd0xeMq' \
    > test.out 2>&1
eval_tap $? 360 'AdminMakeFactorMyDefaultV4' test.out

#- 361 AdminInviteUserV4
eval_tap 0 361 'AdminInviteUserV4 # SKIP deprecated' test.out

#- 362 AuthenticationWithPlatformLinkV4
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV4 \
    --extendExp  \
    --clientId 'spHVNNmJ' \
    --linkingToken 'l2dh5HyP' \
    --password 'f9LXOoTT' \
    --username 'Yetsj1lv' \
    > test.out 2>&1
eval_tap $? 362 'AuthenticationWithPlatformLinkV4' test.out

#- 363 GenerateTokenByNewHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV4 \
    --additionalData 'zNdhJApB' \
    --extendExp  \
    --linkingToken 'DMDOs9n3' \
    > test.out 2>&1
eval_tap $? 363 'GenerateTokenByNewHeadlessAccountV4' test.out

#- 364 Verify2faCodeV4
./ng net.accelbyte.sdk.cli.Main iam verify2faCodeV4 \
    --code 'HTH8ZlLI' \
    --factor '4fHQ98sq' \
    --mfaToken 'bKN5PDRP' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 364 'Verify2faCodeV4' test.out

#- 365 PlatformTokenGrantV4
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV4 \
    --platformId 'tblyY73W' \
    --codeChallenge 'lr8SqQIC' \
    --codeChallengeMethod 'plain' \
    --additionalData '1skubnDp' \
    --clientId 'UI116QWk' \
    --createHeadless  \
    --deviceId 'lK7IntNW' \
    --macAddress 'CXUBdTGB' \
    --platformToken 'Sm6uPMpF' \
    --skipSetCookie  \
    > test.out 2>&1
eval_tap $? 365 'PlatformTokenGrantV4' test.out

#- 366 SimultaneousLoginV4
./ng net.accelbyte.sdk.cli.Main iam simultaneousLoginV4 \
    --codeChallenge 'bNknfSGB' \
    --codeChallengeMethod 'S256' \
    --simultaneousPlatform 'f6zRcsQX' \
    --simultaneousTicket 'yNo1fkm9' \
    --nativePlatform 'steam' \
    --nativePlatformTicket '4qeLrraL' \
    > test.out 2>&1
eval_tap $? 366 'SimultaneousLoginV4' test.out

#- 367 TokenGrantV4
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV4 \
    --codeChallenge 'qYZixRAX' \
    --codeChallengeMethod 'S256' \
    --additionalData '1fTxHFhb' \
    --clientId 'vzMfNhlE' \
    --code 'NsMNiUCt' \
    --codeVerifier 'EhpZbZ30' \
    --extendNamespace 'T2csdCc4' \
    --extendExp  \
    --loginQueueTicket '98oCOsfU' \
    --password 'TP1dFJeL' \
    --redirectUri '0n8Q6dZz' \
    --refreshToken 'NDexxCRD' \
    --username 'cVXOVoi8' \
    --grantType 'authorization_code' \
    > test.out 2>&1
eval_tap $? 367 'TokenGrantV4' test.out

#- 368 RequestTargetTokenResponseV4
./ng net.accelbyte.sdk.cli.Main iam requestTargetTokenResponseV4 \
    --additionalData 'lyAGxfrA' \
    --code 'Eyl6Yq0N' \
    > test.out 2>&1
eval_tap $? 368 'RequestTargetTokenResponseV4' test.out

#- 369 PublicCreateTestUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateTestUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "Yuec4UHS", "policyId": "RaGCX06K", "policyVersionId": "jbNA6dTf"}, {"isAccepted": true, "localizedPolicyVersionId": "TJfz8DlI", "policyId": "ISMlGmxy", "policyVersionId": "K2PFXvRJ"}, {"isAccepted": true, "localizedPolicyVersionId": "iNB4Z6kQ", "policyId": "4KVo2AAa", "policyVersionId": "dkAMBhoZ"}], "authType": "EMAILPASSWD", "country": "1N38N5Kp", "dateOfBirth": "nRUGuzDo", "displayName": "qDIlLksW", "emailAddress": "38HMpqhW", "password": "FUrLcIYi", "passwordMD5Sum": "S2flj38P", "uniqueDisplayName": "pQXrQj9k", "username": "rjtNytda", "verified": true}' \
    > test.out 2>&1
eval_tap $? 369 'PublicCreateTestUserV4' test.out

#- 370 PublicCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "BTCTgZoc", "policyId": "bHzIdjDx", "policyVersionId": "Da6YnwtR"}, {"isAccepted": true, "localizedPolicyVersionId": "qeNqxg3e", "policyId": "S1xUzRY5", "policyVersionId": "en2ewVd9"}, {"isAccepted": true, "localizedPolicyVersionId": "BZ3tPmCB", "policyId": "PZ4RYa0V", "policyVersionId": "PpvIniRE"}], "authType": "EMAILPASSWD", "code": "HhQ576MU", "country": "sxDgjqSR", "dateOfBirth": "iwQMY9hX", "displayName": "YZ5fZAbv", "emailAddress": "m7HLzGCx", "password": "wS5d5C2H", "passwordMD5Sum": "W13bRG1t", "reachMinimumAge": true, "uniqueDisplayName": "oJrmWX3d", "username": "8A23p8T1"}' \
    > test.out 2>&1
eval_tap $? 370 'PublicCreateUserV4' test.out

#- 371 CreateUserFromInvitationV4
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV4 \
    --invitationId 'M50GZSCd' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "of0ZeHcR", "policyId": "RHprG8bL", "policyVersionId": "GA9OZowq"}, {"isAccepted": true, "localizedPolicyVersionId": "lXVFLj6S", "policyId": "kCT09bhx", "policyVersionId": "vqI3g47G"}, {"isAccepted": true, "localizedPolicyVersionId": "77p9zPpF", "policyId": "M6Ia6wHY", "policyVersionId": "07nBRo41"}], "authType": "EMAILPASSWD", "code": "WIR5kixO", "country": "P1rk6xYs", "dateOfBirth": "MSuFF1EJ", "displayName": "vqNj39eM", "emailAddress": "cfT1Nh8M", "password": "5D0Qzy78", "passwordMD5Sum": "V9dT4Hb4", "reachMinimumAge": false, "uniqueDisplayName": "ypogbJ1r", "username": "nGwN92eE"}' \
    > test.out 2>&1
eval_tap $? 371 'CreateUserFromInvitationV4' test.out

#- 372 PublicUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "hh27aBak", "country": "4vdLTAxV", "dateOfBirth": "awNb6Hkq", "displayName": "iUpHgFET", "languageTag": "fg0HDmvf", "uniqueDisplayName": "wx1lMCIm", "userName": "PyRDlvzm"}' \
    > test.out 2>&1
eval_tap $? 372 'PublicUpdateUserV4' test.out

#- 373 PublicUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "amFjpdjy", "emailAddress": "FDys7NQ5"}' \
    > test.out 2>&1
eval_tap $? 373 'PublicUpdateUserEmailAddressV4' test.out

#- 374 PublicUpgradeHeadlessAccountWithVerificationCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountWithVerificationCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "KriVPzK0", "country": "s9BBmcvm", "dateOfBirth": "AZRuFuxy", "displayName": "naPw59Zp", "emailAddress": "UaCU3fRz", "password": "zeil0ybb", "reachMinimumAge": false, "uniqueDisplayName": "XMF2od4d", "username": "FOCW9Up6", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 374 'PublicUpgradeHeadlessAccountWithVerificationCodeV4' test.out

#- 375 PublicUpgradeHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "KGZFhHgo", "password": "hg7IGYMn", "username": "flKbpqEc"}' \
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
    --code 'NZu5MrRg' \
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
    --deviceToken 'Hf39JAkP' \
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
    --code '0s7gHC5H' \
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
    --factor 'YVcUqF3S' \
    > test.out 2>&1
eval_tap $? 392 'PublicMakeFactorMyDefaultV4' test.out

#- 393 PublicGetUserPublicInfoByUserIdV4
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPublicInfoByUserIdV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'gK8HKCKo' \
    > test.out 2>&1
eval_tap $? 393 'PublicGetUserPublicInfoByUserIdV4' test.out

#- 394 PublicInviteUserV4
./ng net.accelbyte.sdk.cli.Main iam publicInviteUserV4 \
    --body '{"additionalData": "mk5PE8Ar", "emailAddress": "6Wg8CmaQ", "namespace": "QX8CTzBF", "namespaceDisplayName": "AtIc45as"}' \
    > test.out 2>&1
eval_tap $? 394 'PublicInviteUserV4' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
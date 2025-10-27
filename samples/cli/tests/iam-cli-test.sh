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
    --body '{"modules": [{"docLink": "5VmlJ9gC", "groups": [{"group": "4C8BEKZn", "groupId": "s4316xpc", "permissions": [{"allowedActions": [73, 61, 90], "resource": "eSOtEb5q"}, {"allowedActions": [60, 10, 95], "resource": "eSIzVu32"}, {"allowedActions": [7, 92, 8], "resource": "3rSST0ij"}]}, {"group": "JkEbnnvR", "groupId": "W4zC41DV", "permissions": [{"allowedActions": [55, 13, 8], "resource": "T4N6S5uE"}, {"allowedActions": [60, 53, 5], "resource": "ng8r8j8e"}, {"allowedActions": [30, 68, 93], "resource": "ohYV6wQE"}]}, {"group": "US5VMriI", "groupId": "GLZLI44T", "permissions": [{"allowedActions": [0, 79, 5], "resource": "KaI0Tgbl"}, {"allowedActions": [8, 30, 86], "resource": "prEm55TX"}, {"allowedActions": [23, 67, 90], "resource": "toeCERjb"}]}], "module": "srQYa9fr", "moduleId": "TcnJ35qy"}, {"docLink": "j0tSxyXn", "groups": [{"group": "25VqSjCg", "groupId": "2PnjiaMB", "permissions": [{"allowedActions": [84, 37, 100], "resource": "4tIfoJP1"}, {"allowedActions": [66, 89, 68], "resource": "45HwrCsZ"}, {"allowedActions": [65, 79, 43], "resource": "mawl20ew"}]}, {"group": "VphsdKKY", "groupId": "MHZgYwUz", "permissions": [{"allowedActions": [87, 87, 94], "resource": "1rG5RhSX"}, {"allowedActions": [27, 32, 33], "resource": "FsRJRDMm"}, {"allowedActions": [23, 28, 60], "resource": "L8LWFd3w"}]}, {"group": "Ro1gFVtk", "groupId": "Xtv3k5EF", "permissions": [{"allowedActions": [26, 12, 91], "resource": "24RCr6W1"}, {"allowedActions": [39, 78, 25], "resource": "M9z532jG"}, {"allowedActions": [88, 67, 39], "resource": "UpCGj4hX"}]}], "module": "djihcwuG", "moduleId": "OSXITj5f"}, {"docLink": "cjDU1zzP", "groups": [{"group": "c0jCWn3u", "groupId": "nD4vO6zS", "permissions": [{"allowedActions": [72, 0, 35], "resource": "hybxUGvk"}, {"allowedActions": [34, 71, 74], "resource": "mqWuYRZ2"}, {"allowedActions": [97, 16, 5], "resource": "Kr5rLrQo"}]}, {"group": "kJUuPDhE", "groupId": "SwuSmurC", "permissions": [{"allowedActions": [56, 44, 80], "resource": "6stPurcm"}, {"allowedActions": [28, 42, 49], "resource": "3ilJYrVm"}, {"allowedActions": [70, 33, 7], "resource": "TBwUGYgP"}]}, {"group": "MawvOdVT", "groupId": "bYdJkvvg", "permissions": [{"allowedActions": [44, 12, 45], "resource": "EBnG3ZFJ"}, {"allowedActions": [52, 67, 45], "resource": "AjBsJ8nP"}, {"allowedActions": [0, 90, 49], "resource": "h8B0Em6d"}]}], "module": "p8129ggX", "moduleId": "ZNQIEtoN"}]}' \
    > test.out 2>&1
eval_tap $? 109 'AdminUpdateAvailablePermissionsByModule' test.out

#- 110 AdminDeleteConfigPermissionsByGroup
./ng net.accelbyte.sdk.cli.Main iam adminDeleteConfigPermissionsByGroup \
    --forceDelete  \
    --body '{"groupId": "mPizN6V0", "moduleId": "yQD380Ju"}' \
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
    --body '[{"field": "p4kGO0qA", "validation": {"allowAllSpecialCharacters": true, "allowDigit": true, "allowLetter": false, "allowSpace": false, "allowUnicode": true, "avatarConfig": {"allowedPrefixes": ["7jGM68K8", "AtM8qpfg", "TQCgCfUt"], "preferRegex": true, "regex": "Fc7FKsEt"}, "blockedWord": ["QKwcwjme", "R1PWEDNE", "JmpN0gcn"], "description": [{"language": "d9IwFO8X", "message": ["N4oICkT8", "4AWu1737", "kk3mV2wv"]}, {"language": "cl9hufDR", "message": ["e1nHT0ZY", "EBtXm5x4", "zsPgYnf4"]}, {"language": "2sk2wih8", "message": ["nL808GCI", "AlukFcnr", "KwSvGLWJ"]}], "isCustomRegex": true, "letterCase": "R2T9BbgF", "maxLength": 82, "maxRepeatingAlphaNum": 5, "maxRepeatingSpecialCharacter": 86, "minCharType": 44, "minLength": 61, "profanityFilter": "wNNpa2cB", "regex": "Ho3VkNR0", "specialCharacterLocation": "bz8cfyi0", "specialCharacters": ["YFE7gZKA", "hlO1laoY", "vulDIPLn"]}}, {"field": "WsoTEXaW", "validation": {"allowAllSpecialCharacters": false, "allowDigit": true, "allowLetter": true, "allowSpace": false, "allowUnicode": false, "avatarConfig": {"allowedPrefixes": ["wsis6dTS", "rXsvhrCK", "WA8MZbjd"], "preferRegex": true, "regex": "IUraz6Xn"}, "blockedWord": ["KCZ3kFxu", "h4l2Jd4b", "zlsd46ul"], "description": [{"language": "xHIcteNc", "message": ["qtF4kYTP", "KaNwlSap", "MLUQNvsg"]}, {"language": "VAh261Sq", "message": ["16WWEZwe", "w0mF9f8i", "oyPvsrKJ"]}, {"language": "x8jz0WH1", "message": ["U04txnDO", "59FQPLJM", "SZhLobiC"]}], "isCustomRegex": true, "letterCase": "Q9pWwjFP", "maxLength": 16, "maxRepeatingAlphaNum": 20, "maxRepeatingSpecialCharacter": 46, "minCharType": 48, "minLength": 14, "profanityFilter": "XafYMYdY", "regex": "UmXoIJAw", "specialCharacterLocation": "UOOoi2v7", "specialCharacters": ["CwSYwyuN", "x0elCqWk", "KFT96dqY"]}}, {"field": "tPGdlkZA", "validation": {"allowAllSpecialCharacters": true, "allowDigit": true, "allowLetter": true, "allowSpace": true, "allowUnicode": true, "avatarConfig": {"allowedPrefixes": ["YtYxW90O", "RBmvK649", "ZnaGKIu9"], "preferRegex": false, "regex": "PL2iyEIi"}, "blockedWord": ["GsuI5QMP", "7f6Iw1qD", "FHzwnN9X"], "description": [{"language": "dlF9B4FJ", "message": ["ntpDDl28", "fz842jFB", "iNfrEbHI"]}, {"language": "jIHYe05Y", "message": ["tT5Cp0gD", "xXm1YCiy", "BWRZnRaE"]}, {"language": "sRl4VCHY", "message": ["Ufg1vWUH", "CBbCo0PE", "8epfycZS"]}], "isCustomRegex": false, "letterCase": "8g64ju0k", "maxLength": 75, "maxRepeatingAlphaNum": 20, "maxRepeatingSpecialCharacter": 89, "minCharType": 41, "minLength": 60, "profanityFilter": "fDDH2o0K", "regex": "lY3M76d2", "specialCharacterLocation": "d9R4OFvp", "specialCharacters": ["8ZLFYYak", "k8ElCbRg", "kDFmjKUk"]}}]' \
    > test.out 2>&1
eval_tap $? 113 'AdminUpdateInputValidations' test.out

#- 114 AdminResetInputValidations
./ng net.accelbyte.sdk.cli.Main iam adminResetInputValidations \
    --field 'rjWxqVIZ' \
    > test.out 2>&1
eval_tap $? 114 'AdminResetInputValidations' test.out

#- 115 ListAdminsV3
./ng net.accelbyte.sdk.cli.Main iam listAdminsV3 \
    --namespace "$AB_NAMESPACE" \
    --after 'CUWTbaq6' \
    --before '1soKK8bj' \
    --endDate 'aGlv4Dqb' \
    --limit '81' \
    --query '8HzEu2XV' \
    --roleId 'B4WzVlsx' \
    --startDate 'eweXm2KN' \
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
    --body '{"ageRestriction": 35, "enable": false}' \
    > test.out 2>&1
eval_tap $? 117 'AdminUpdateAgeRestrictionConfigV3' test.out

#- 118 AdminGetListCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminGetListCountryAgeRestrictionV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 118 'AdminGetListCountryAgeRestrictionV3' test.out

#- 119 AdminUpdateCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateCountryAgeRestrictionV3 \
    --countryCode 'HRTMF4Ey' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ageRestriction": 30}' \
    > test.out 2>&1
eval_tap $? 119 'AdminUpdateCountryAgeRestrictionV3' test.out

#- 120 AdminGetBannedUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType 'U4xzYWPD' \
    --limit '51' \
    --offset '72' \
    > test.out 2>&1
eval_tap $? 120 'AdminGetBannedUsersV3' test.out

#- 121 AdminBanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"ban": "9qPi5NBa", "comment": "TwsDYe2Y", "endDate": "sFrWZ8vr", "reason": "fQzwOUpY", "skipNotif": true, "userIds": ["Y6prYdSG", "6kDzU2m7", "BS6dy13S"]}' \
    > test.out 2>&1
eval_tap $? 121 'AdminBanUserBulkV3' test.out

#- 122 AdminUnbanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminUnbanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"bans": [{"banId": "WEd6UEKJ", "userId": "h0C9JAbR"}, {"banId": "Z1nwjtG8", "userId": "VdPzMrjb"}, {"banId": "udLBA9ok", "userId": "tkhuTOhN"}]}' \
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
    --clientId 'qEqnWDg0' \
    --clientName 'yXt5aF2c' \
    --clientType 'Ql9LXfGy' \
    --limit '8' \
    --offset '90' \
    --skipLoginQueue  \
    > test.out 2>&1
eval_tap $? 124 'AdminGetClientsByNamespaceV3' test.out

#- 125 AdminBulkUpdateClientsV3
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateClientsV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientIds": ["RUnbIxBC", "HbJAU9ck", "sZsatlOt"], "clientUpdateRequest": {"audiences": ["bOIGr91G", "FXOS4Tzb", "Jq0fC3bv"], "baseUri": "3Obm4Gwt", "clientName": "g5tNRvf8", "clientPermissions": [{"action": 18, "resource": "zlwPTqgw", "schedAction": 13, "schedCron": "OAdB6sIy", "schedRange": ["uKip3G8X", "jqFimXtu", "nKeHOzJf"]}, {"action": 55, "resource": "DOZJSLVa", "schedAction": 79, "schedCron": "NysEuylV", "schedRange": ["RfdLVdIZ", "Fmk6mO4P", "j7JJv3zV"]}, {"action": 82, "resource": "bwqWsxEJ", "schedAction": 20, "schedCron": "7zZd5w5n", "schedRange": ["2aVPeLYN", "qUyAQYhy", "CPDbNpt6"]}], "clientPlatform": "sDhaiu00", "deletable": true, "description": "rwgngYLp", "modulePermissions": [{"moduleId": "O5AebiGx", "selectedGroups": [{"groupId": "JFVdbTnl", "selectedActions": [43, 100, 81]}, {"groupId": "OBc23u8i", "selectedActions": [67, 31, 74]}, {"groupId": "RGoPjBGO", "selectedActions": [37, 80, 17]}]}, {"moduleId": "nLXZ279F", "selectedGroups": [{"groupId": "iuq7YiSO", "selectedActions": [13, 39, 44]}, {"groupId": "K5OOcsHF", "selectedActions": [38, 16, 82]}, {"groupId": "9jITH95U", "selectedActions": [47, 30, 44]}]}, {"moduleId": "ZGoCAUTB", "selectedGroups": [{"groupId": "uBOIerQ1", "selectedActions": [23, 60, 88]}, {"groupId": "Ts2b3u6p", "selectedActions": [64, 21, 41]}, {"groupId": "hakPyjdy", "selectedActions": [6, 14, 59]}]}], "namespace": "emP1puLW", "oauthAccessTokenExpiration": 83, "oauthAccessTokenExpirationTimeUnit": "wPWFeV68", "oauthRefreshTokenExpiration": 84, "oauthRefreshTokenExpirationTimeUnit": "0zctzNms", "redirectUri": "c74vPmJR", "scopes": ["Qwn5qDaB", "cJJogWwq", "gPXXebkP"], "skipLoginQueue": true, "twoFactorEnabled": false}}' \
    > test.out 2>&1
eval_tap $? 125 'AdminBulkUpdateClientsV3' test.out

#- 126 AdminCreateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateClientV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["zo8SAqgr", "IGFiamFw", "q17XoL55"], "baseUri": "GAIVHw5K", "clientId": "5pAaioGY", "clientName": "haGTdAl2", "clientPermissions": [{"action": 54, "resource": "gHSV0Eg8", "schedAction": 96, "schedCron": "BvgQtR1M", "schedRange": ["HmI9Co57", "VVtEffyl", "U2IgcTqY"]}, {"action": 37, "resource": "sCzYJJpE", "schedAction": 19, "schedCron": "y8AJVoWL", "schedRange": ["V5Vhl0Yj", "GTKZ6Fkp", "4GHNf4pN"]}, {"action": 89, "resource": "oKOOsOVI", "schedAction": 57, "schedCron": "fUdutaq4", "schedRange": ["TscOvRaq", "8FERDroJ", "WBlOdT4v"]}], "clientPlatform": "194yU6yX", "deletable": true, "description": "kP7WrTn9", "modulePermissions": [{"moduleId": "OriUea4k", "selectedGroups": [{"groupId": "06WrVkAk", "selectedActions": [99, 55, 52]}, {"groupId": "tHSsT7MS", "selectedActions": [8, 99, 6]}, {"groupId": "2kKnmtS7", "selectedActions": [39, 61, 56]}]}, {"moduleId": "02wQCs9G", "selectedGroups": [{"groupId": "deVRtyTZ", "selectedActions": [5, 37, 44]}, {"groupId": "GjZ1zbDx", "selectedActions": [49, 87, 1]}, {"groupId": "nAuo34UY", "selectedActions": [47, 67, 54]}]}, {"moduleId": "PC5eyY78", "selectedGroups": [{"groupId": "X5ZYXUA1", "selectedActions": [12, 71, 100]}, {"groupId": "HfkIddeL", "selectedActions": [81, 69, 63]}, {"groupId": "X1IJAl03", "selectedActions": [7, 69, 49]}]}], "namespace": "Wa2lJaG0", "oauthAccessTokenExpiration": 58, "oauthAccessTokenExpirationTimeUnit": "PutOaKqj", "oauthClientType": "noSEl0T0", "oauthRefreshTokenExpiration": 0, "oauthRefreshTokenExpirationTimeUnit": "W39RCSHE", "parentNamespace": "iQHAkMYJ", "redirectUri": "Jht1FH0m", "scopes": ["6nE0TeZ0", "MKkG2m8c", "ZAeaZUI4"], "secret": "7TAFfake", "skipLoginQueue": true, "twoFactorEnabled": true}' \
    > test.out 2>&1
eval_tap $? 126 'AdminCreateClientV3' test.out

#- 127 AdminGetClientsbyNamespacebyIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetClientsbyNamespacebyIDV3 \
    --clientId 'ZLwDsrX9' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 127 'AdminGetClientsbyNamespacebyIDV3' test.out

#- 128 AdminDeleteClientV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientV3 \
    --clientId 'u0zrvmWL' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 128 'AdminDeleteClientV3' test.out

#- 129 AdminUpdateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientV3 \
    --clientId 'Rszd1lwL' \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["RugS5hvb", "0hpbIFJG", "eepMTYKU"], "baseUri": "1YDdQIdy", "clientName": "lQ6iPd8B", "clientPermissions": [{"action": 96, "resource": "C7GbbIYI", "schedAction": 96, "schedCron": "ZV0CohH1", "schedRange": ["9NEb4NID", "X1i7UeRB", "1pgKRNs2"]}, {"action": 86, "resource": "CC4pXq6t", "schedAction": 10, "schedCron": "8L1DWrVO", "schedRange": ["Jk785pxL", "QVhEYxIo", "Lo527VhL"]}, {"action": 59, "resource": "XNQhQYM6", "schedAction": 77, "schedCron": "2kbdTcrn", "schedRange": ["SEYiscso", "MMRcAECs", "Q0DVsQTg"]}], "clientPlatform": "1FZ3CILD", "deletable": false, "description": "jx0lsqwA", "modulePermissions": [{"moduleId": "M28gPBpI", "selectedGroups": [{"groupId": "NzUbOhdM", "selectedActions": [93, 57, 48]}, {"groupId": "Uwl4mc2M", "selectedActions": [42, 53, 2]}, {"groupId": "hZE3GdhH", "selectedActions": [3, 40, 60]}]}, {"moduleId": "7hoVDxEC", "selectedGroups": [{"groupId": "5jbaZF22", "selectedActions": [48, 97, 81]}, {"groupId": "EaWYSsBf", "selectedActions": [96, 83, 14]}, {"groupId": "xdcXICfN", "selectedActions": [43, 73, 76]}]}, {"moduleId": "L1uxc6gI", "selectedGroups": [{"groupId": "futoLiGP", "selectedActions": [74, 42, 88]}, {"groupId": "52fco6xh", "selectedActions": [54, 85, 39]}, {"groupId": "Ztgf5J5e", "selectedActions": [51, 95, 35]}]}], "namespace": "VF1nYFmz", "oauthAccessTokenExpiration": 37, "oauthAccessTokenExpirationTimeUnit": "09g59UGV", "oauthRefreshTokenExpiration": 64, "oauthRefreshTokenExpirationTimeUnit": "3n3rgqLt", "redirectUri": "kqV63WBI", "scopes": ["2KclhVyg", "4S6iBKc6", "VmBTy3Jr"], "skipLoginQueue": true, "twoFactorEnabled": false}' \
    > test.out 2>&1
eval_tap $? 129 'AdminUpdateClientV3' test.out

#- 130 AdminUpdateClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientPermissionV3 \
    --clientId 'GhGtb0Zo' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 42, "resource": "QbJrsKEb"}, {"action": 61, "resource": "vHfi54c7"}, {"action": 85, "resource": "mIifF9bT"}]}' \
    > test.out 2>&1
eval_tap $? 130 'AdminUpdateClientPermissionV3' test.out

#- 131 AdminAddClientPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddClientPermissionsV3 \
    --clientId '93ANIixT' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 28, "resource": "j2Io8DSd"}, {"action": 56, "resource": "o9hYHIxb"}, {"action": 12, "resource": "TWq9uGIy"}]}' \
    > test.out 2>&1
eval_tap $? 131 'AdminAddClientPermissionsV3' test.out

#- 132 AdminDeleteClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientPermissionV3 \
    --action '40' \
    --clientId '0BbsOOcK' \
    --namespace "$AB_NAMESPACE" \
    --resource 'yLF3gFzZ' \
    > test.out 2>&1
eval_tap $? 132 'AdminDeleteClientPermissionV3' test.out

#- 133 AdminGetConfigValueV3
./ng net.accelbyte.sdk.cli.Main iam adminGetConfigValueV3 \
    --configKey 'WjDdwART' \
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
    --body '{"blacklist": ["m1fNKkHE", "tnUATDFh", "uX6gTHtx"]}' \
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
    --body '{"active": true, "roleIds": ["1AfcykRv", "UqM9WWik", "BVXxiW46"]}' \
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
    --limit '88' \
    --offset '2' \
    > test.out 2>&1
eval_tap $? 141 'RetrieveAllSSOLoginPlatformCredentialV3' test.out

#- 142 RetrieveThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'c2FZN20m' \
    > test.out 2>&1
eval_tap $? 142 'RetrieveThirdPartyLoginPlatformCredentialV3' test.out

#- 143 AddThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam addThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'iAedwhU5' \
    --body '{"ACSURL": "sybHYLwI", "AWSCognitoRegion": "1aDYIJG9", "AWSCognitoUserPool": "8AgNLZKL", "AllowedClients": ["EEJY1i6o", "MloH8A3f", "jVW1Wcwq"], "AppId": "Q3bb8FGW", "AuthorizationEndpoint": "lKRmZOmo", "ClientId": "dzrqx2N4", "EmptyStrFieldList": ["rqQTs7ny", "zhDL4jJu", "KCMa4mpk"], "EnableServerLicenseValidation": false, "Environment": "UOtt3iLh", "FederationMetadataURL": "2r25d7g4", "GenericOauthFlow": true, "IncludePUID": false, "IsActive": true, "Issuer": "jyV9G7To", "JWKSEndpoint": "HJCwGGsQ", "KeyID": "JogB9HAG", "LogoURL": "Gk1pCbIt", "NetflixCertificates": {"encryptedPrivateKey": "eENw9atB", "encryptedPrivateKeyName": "bkpF2ZVf", "publicCertificate": "w4N3TKHR", "publicCertificateName": "9Xxm9Yq2", "rootCertificate": "8sPyzYQn", "rootCertificateName": "duXnAXDi"}, "OrganizationId": "yOaX7s3p", "PlatformName": "W7dfij3M", "PrivateKey": "zcQpL5Hs", "RedirectUri": "Fuv28EIa", "RegisteredDomains": [{"affectedClientIDs": ["H8T5MIZt", "7Z0mMYLG", "9MO6LIKP"], "domain": "0Y0Xl6MJ", "namespaces": ["8IrZDzAg", "z7iFxxzw", "WkH2kePe"], "roleId": "gZLJtjzm", "ssoCfg": {"googleKey": {"PwEWFkfF": {}, "LHLYOiai": {}, "u5xjIp9Z": {}}, "groupConfigs": [{"assignNamespaces": ["clCvkBkc", "x3KLQEN9", "XP4ll68S"], "group": "PuxLn6ov", "roleId": "BVwL6cv7"}, {"assignNamespaces": ["m57k9iWu", "tZ92eGOY", "SyJNy36i"], "group": "j7yCg5np", "roleId": "YcYVtUQG"}, {"assignNamespaces": ["s5hp5VlT", "Jcb3gWNm", "xaU9Zx4E"], "group": "NBjxwmUt", "roleId": "nAYlPaJq"}]}}, {"affectedClientIDs": ["DEel3EDk", "xdYoODWM", "Ym5iQPeA"], "domain": "E6441Vr9", "namespaces": ["heDV9MJI", "ug0YFcGq", "v0KsOKQC"], "roleId": "P1YiaGIg", "ssoCfg": {"googleKey": {"Y0XG6OYQ": {}, "Ibdill7v": {}, "iSYkF9gk": {}}, "groupConfigs": [{"assignNamespaces": ["0Ked6DhA", "UVJtDqlq", "blrAlAhJ"], "group": "iHNAhNSu", "roleId": "yHd07dx5"}, {"assignNamespaces": ["u3NrN0Pa", "pBVrjxNC", "fmKEa6y8"], "group": "rEa5iNIZ", "roleId": "YwmikdiD"}, {"assignNamespaces": ["wfjSWG9G", "OZy65be2", "Al0yBLia"], "group": "57cl9uvq", "roleId": "A9vYYvjk"}]}}, {"affectedClientIDs": ["HVZy8w53", "WiLsIKM6", "sDe6MigS"], "domain": "W4l4wGx5", "namespaces": ["F2vYkCDN", "fM7rInrC", "TqlpKGfn"], "roleId": "dmdKEbqC", "ssoCfg": {"googleKey": {"ui8BGWtK": {}, "tpwTFupu": {}, "1I9E6Ce1": {}}, "groupConfigs": [{"assignNamespaces": ["UtGsmyQ0", "EtMRx3AL", "U2T2irhE"], "group": "XxpHBdtG", "roleId": "Mool00Km"}, {"assignNamespaces": ["XLTwq31e", "7zIf9JdR", "3jGN8WEj"], "group": "ni3sA0XX", "roleId": "YYVIiAph"}, {"assignNamespaces": ["Wiq4NpIk", "4J2017Kr", "ZpAxVuHn"], "group": "cqYr32Wx", "roleId": "xq8bNpxL"}]}}], "RelyingParty": "F7V6NqyT", "SandboxId": "Ru9ITKjz", "Secret": "uaqapadz", "TeamID": "RevSkM4v", "TokenAuthenticationType": "AelO6ssY", "TokenClaimsMapping": {"yhe0eUUf": "Y0oV9c5b", "RF2TyePd": "zk8HVQZH", "HNDvRU6W": "J3uCovKu"}, "TokenEndpoint": "G1epPSBH", "UserInfoEndpoint": "bXHK0PSn", "UserInfoHTTPMethod": "9EyteHZY", "googleAdminConsoleKey": "zXgPaHfW", "scopes": ["Pfpny2k1", "seoOQ4b9", "dQQKnnHd"]}' \
    > test.out 2>&1
eval_tap $? 143 'AddThirdPartyLoginPlatformCredentialV3' test.out

#- 144 DeleteThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'W9A9Paqw' \
    > test.out 2>&1
eval_tap $? 144 'DeleteThirdPartyLoginPlatformCredentialV3' test.out

#- 145 UpdateThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'soQ9Jx4z' \
    --body '{"ACSURL": "EZ1i3L3l", "AWSCognitoRegion": "rgi5y9WB", "AWSCognitoUserPool": "vlv9XsXY", "AllowedClients": ["8Zg1PjY5", "kExe4kTK", "0NeFM6S3"], "AppId": "PdXFGx8m", "AuthorizationEndpoint": "UZYt7bRH", "ClientId": "klrJ8qyr", "EmptyStrFieldList": ["0qK7VEBC", "dGUdU6SC", "3pLuHF88"], "EnableServerLicenseValidation": true, "Environment": "oZSVDW4f", "FederationMetadataURL": "0TtUIzVz", "GenericOauthFlow": false, "IncludePUID": false, "IsActive": true, "Issuer": "MlJx47BP", "JWKSEndpoint": "LkULFhOw", "KeyID": "fBGKNu3L", "LogoURL": "krJ6Ew2d", "NetflixCertificates": {"encryptedPrivateKey": "QVYccOog", "encryptedPrivateKeyName": "sk9ATEWx", "publicCertificate": "gmzBBsnC", "publicCertificateName": "oTCInAIT", "rootCertificate": "6G6s1fND", "rootCertificateName": "7Vh9YgJD"}, "OrganizationId": "5M8g2PEa", "PlatformName": "V7dNvQSn", "PrivateKey": "e9ahasIu", "RedirectUri": "lGT24IG4", "RegisteredDomains": [{"affectedClientIDs": ["RHi6NSCZ", "X7QQQLPi", "zegU90po"], "domain": "EVLrVvLP", "namespaces": ["uRF5gqbz", "IRE4TH0X", "QWNrELeq"], "roleId": "392xBKzY", "ssoCfg": {"googleKey": {"7ktIi1e0": {}, "XNksAWkP": {}, "CeLm5duK": {}}, "groupConfigs": [{"assignNamespaces": ["AGoV2nMs", "BoTzVLeT", "DH8GgUF8"], "group": "hpcleUcR", "roleId": "JEpwVTiL"}, {"assignNamespaces": ["CFZftWmu", "eIxTPdDr", "TH30vJTS"], "group": "Ca7pLiYn", "roleId": "zI7Zmdra"}, {"assignNamespaces": ["mCMRANUb", "PUsWtvyp", "osDLctOq"], "group": "T9JvYot8", "roleId": "SIc4ljtD"}]}}, {"affectedClientIDs": ["6HJzAhJW", "zCvRxTgw", "uTKFQF0I"], "domain": "kFAsCxN5", "namespaces": ["kBSrYwgc", "2vzHrziz", "64SaPm4S"], "roleId": "RTUwREc5", "ssoCfg": {"googleKey": {"adZQ5D65": {}, "ve8CGequ": {}, "NtRlvwdr": {}}, "groupConfigs": [{"assignNamespaces": ["dfWXt9s5", "1OcdtUMJ", "2ckLNn5v"], "group": "Mxvn4GSX", "roleId": "EwMhq1Zj"}, {"assignNamespaces": ["bUFrla3t", "2kkfgdD2", "c4MaKbfn"], "group": "tKnp5Rry", "roleId": "g42SDjUG"}, {"assignNamespaces": ["cKH3UC12", "fri7aCHO", "YIjFnCZb"], "group": "cIKXeIdH", "roleId": "j2Z2hr2e"}]}}, {"affectedClientIDs": ["NY1cqaJs", "i9DkJlvQ", "kIxWxfGr"], "domain": "N7F2P6nq", "namespaces": ["o3C9UP2L", "46F2tXwT", "2R3apcbu"], "roleId": "NSFDCsjC", "ssoCfg": {"googleKey": {"YedSU5rH": {}, "NrccOrdc": {}, "Qt2nu1Kt": {}}, "groupConfigs": [{"assignNamespaces": ["ZhqbNbAY", "eOKbAaDf", "woPNaxhv"], "group": "DEeMyB56", "roleId": "pNJPn1co"}, {"assignNamespaces": ["9Ig3J5bb", "tyg5ppJa", "ANtLxPt2"], "group": "rQCP7ceX", "roleId": "45wWIOp8"}, {"assignNamespaces": ["KjLLPpRm", "FHTB5wKF", "RfDne97B"], "group": "xaXArryP", "roleId": "gUNdFuLL"}]}}], "RelyingParty": "LCZW2VsC", "SandboxId": "ktXjtkpB", "Secret": "Hny6SeQQ", "TeamID": "mDMiaiTC", "TokenAuthenticationType": "BU64cLxR", "TokenClaimsMapping": {"zGwN2M1c": "bqYlGdfU", "yL4s6Lm5": "0Gk7XiFf", "tEHM1TcK": "9x3WLR6f"}, "TokenEndpoint": "ucYWN4aH", "UserInfoEndpoint": "l88wxpwA", "UserInfoHTTPMethod": "LLaAABWE", "googleAdminConsoleKey": "E7WaGsmS", "scopes": ["5WfQ0Oet", "yijmtv89", "JjCWXgLs"]}' \
    > test.out 2>&1
eval_tap $? 145 'UpdateThirdPartyLoginPlatformCredentialV3' test.out

#- 146 UpdateThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'nitRCAWT' \
    --body '{"affectedClientIDs": ["xDAjw5CK", "rgvJCyTK", "LBwiJlpK"], "assignedNamespaces": ["RIkjYvRX", "UEyJxHNB", "BL462DWB"], "domain": "ezRZjA6T", "roleId": "AqUU2loe", "ssoCfg": {"googleKey": {"JSbFms8P": {}, "0HObrwlO": {}, "nwESeWth": {}}, "groupConfigs": [{"assignNamespaces": ["T5RLFroi", "dbAdjNuQ", "Pgh01Gwy"], "group": "1f7L2gqo", "roleId": "5zebXicO"}, {"assignNamespaces": ["fI7UWUJ3", "yrFu8nKI", "cfvp6oyb"], "group": "sascTmMq", "roleId": "QtQQsUB4"}, {"assignNamespaces": ["0rU0WsCA", "r2deiR4D", "45eneJeo"], "group": "Vi7nG7NL", "roleId": "wtj8RNkd"}]}}' \
    > test.out 2>&1
eval_tap $? 146 'UpdateThirdPartyLoginPlatformDomainV3' test.out

#- 147 DeleteThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'XpDmrdGn' \
    --body '{"domain": "CbLfGp8Y", "ssoGroups": ["rqW5v9I5", "WcNXA5vj", "R009Filt"]}' \
    > test.out 2>&1
eval_tap $? 147 'DeleteThirdPartyLoginPlatformDomainV3' test.out

#- 148 PartialUpdateThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam partialUpdateThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'tCEgjMfN' \
    --body '{"affectedClientIDs": ["JmUBtfMe", "IwF1hFE9", "43fIwy49"], "assignedNamespaces": ["BtAQ5DLU", "nNh6O59P", "DIFM6Csd"], "domain": "Ag8sEmRP", "roleId": "hIeA3IaM", "ssoCfg": {"googleKey": {"K6pFhRtn": {}, "kTrKbEpQ": {}, "lbgAXAbM": {}}, "groupConfigs": [{"assignNamespaces": ["f13iZI4L", "l5Mg0mVs", "RQaUeyk3"], "group": "hzn0vD6e", "roleId": "tF6DClnI"}, {"assignNamespaces": ["qe5RYhHq", "Sco83wOx", "XFAerjoL"], "group": "Mw7IcylW", "roleId": "nTPh9WNX"}, {"assignNamespaces": ["5dzdk77a", "tGpLCIsX", "EIsSqIg0"], "group": "9DThZUeT", "roleId": "qXJk1daA"}]}}' \
    > test.out 2>&1
eval_tap $? 148 'PartialUpdateThirdPartyLoginPlatformDomainV3' test.out

#- 149 RetrieveSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam retrieveSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'VDraJX53' \
    > test.out 2>&1
eval_tap $? 149 'RetrieveSSOLoginPlatformCredential' test.out

#- 150 AddSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam addSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'WckSkZa4' \
    --body '{"acsUrl": "u5uMkwqC", "apiKey": "uTQoQRET", "appId": "2wtHE2ki", "federationMetadataUrl": "bJlHOPm9", "isActive": true, "redirectUri": "BPTXWgmD", "secret": "lmwavasK", "ssoUrl": "ZqgEDnrB"}' \
    > test.out 2>&1
eval_tap $? 150 'AddSSOLoginPlatformCredential' test.out

#- 151 DeleteSSOLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteSSOLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'fawb4LyK' \
    > test.out 2>&1
eval_tap $? 151 'DeleteSSOLoginPlatformCredentialV3' test.out

#- 152 UpdateSSOPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam updateSSOPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'fXvumNZj' \
    --body '{"acsUrl": "91DsEO25", "apiKey": "Q8rWlJ07", "appId": "lHbvdSeO", "federationMetadataUrl": "JN2wGnVT", "isActive": false, "redirectUri": "hLZXf4P4", "secret": "lkH6TVAv", "ssoUrl": "prshiTSy"}' \
    > test.out 2>&1
eval_tap $? 152 'UpdateSSOPlatformCredential' test.out

#- 153 AdminListUserIDByPlatformUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByPlatformUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 's8MGpcjy' \
    --rawPID  \
    --rawPUID  \
    --body '{"platformUserIds": ["yH45DhiB", "QJt7i0DQ", "cLE47chs"]}' \
    > test.out 2>&1
eval_tap $? 153 'AdminListUserIDByPlatformUserIDsV3' test.out

#- 154 AdminGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'AXlERvcs' \
    --platformUserId 'm9NMuRYx' \
    --pidType 'GVcafoR1' \
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
    --field 'username' \
    --body '{"config": {"minimumAllowedInterval": 29}, "type": "aV0RarSB"}' \
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
    --identity 'GAME_ADMIN' \
    --body '{"additions": [{"actions": [97, 75, 1], "resource": "PrUqCXxE"}, {"actions": [69, 48, 47], "resource": "fBty0TBB"}, {"actions": [55, 73, 23], "resource": "RmpJ42y2"}], "exclusions": [{"actions": [2, 95, 34], "resource": "izMvf9hD"}, {"actions": [66, 43, 84], "resource": "QzsywMFm"}, {"actions": [74, 61, 57], "resource": "tGMD4aOM"}], "overrides": [{"actions": [33, 16, 95], "resource": "i4xsjLP7"}, {"actions": [23, 88, 50], "resource": "PEyQoluj"}, {"actions": [34, 31, 79], "resource": "vMq5kmqp"}], "replacements": [{"replacement": {"actions": [3, 97, 78], "resource": "UImpbO9i"}, "target": "H480yjsk"}, {"replacement": {"actions": [68, 4, 3], "resource": "KkKE0acX"}, "target": "ZzIXewUu"}, {"replacement": {"actions": [67, 37, 34], "resource": "ZviOZby7"}, "target": "6lQxArAR"}]}' \
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
    --identity 'GAME_ADMIN' \
    --body '{"active": true}' \
    > test.out 2>&1
eval_tap $? 160 'AdminChangeRoleOverrideConfigStatusV3' test.out

#- 161 AdminGetRoleNamespacePermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleNamespacePermissionV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId '2oTFrtUC' \
    > test.out 2>&1
eval_tap $? 161 'AdminGetRoleNamespacePermissionV3' test.out

#- 162 GetAdminUsersByRoleIdV3
./ng net.accelbyte.sdk.cli.Main iam getAdminUsersByRoleIdV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'bnUqASOF' \
    --after '24' \
    --before '29' \
    --limit '9' \
    > test.out 2>&1
eval_tap $? 162 'GetAdminUsersByRoleIdV3' test.out

#- 163 AdminQueryTagV3
./ng net.accelbyte.sdk.cli.Main iam adminQueryTagV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '36' \
    --offset '74' \
    --tagName 'lb7PVkUi' \
    > test.out 2>&1
eval_tap $? 163 'AdminQueryTagV3' test.out

#- 164 AdminCreateTagV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateTagV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"tagName": "PL3IGvgk"}' \
    > test.out 2>&1
eval_tap $? 164 'AdminCreateTagV3' test.out

#- 165 AdminUpdateTagV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateTagV3 \
    --namespace "$AB_NAMESPACE" \
    --tagId 'IQCRTuLJ' \
    --body '{"tagName": "7yuxjvgy"}' \
    > test.out 2>&1
eval_tap $? 165 'AdminUpdateTagV3' test.out

#- 166 AdminDeleteTagV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteTagV3 \
    --namespace "$AB_NAMESPACE" \
    --tagId 'wIVi1Mo7' \
    > test.out 2>&1
eval_tap $? 166 'AdminDeleteTagV3' test.out

#- 167 AdminGetUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --emailAddress 'JDfatq8b' \
    > test.out 2>&1
eval_tap $? 167 'AdminGetUserByEmailAddressV3' test.out

#- 168 AdminBulkUpdateUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"updateRequest": {"skipLoginQueue": false}, "userIds": ["9CSuUyGo", "GFZxG9mx", "SF1lVWbe"]}' \
    > test.out 2>&1
eval_tap $? 168 'AdminBulkUpdateUsersV3' test.out

#- 169 AdminGetBulkUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType 'fbTjSB66' \
    --body '{"bulkUserId": ["5vCpMVGk", "MZW6agrM", "6uljzitD"]}' \
    > test.out 2>&1
eval_tap $? 169 'AdminGetBulkUserBanV3' test.out

#- 170 AdminListUserIDByUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"findByPublisherNamespace": true, "userIds": ["he7h6fb3", "hEuEPTP8", "zp7mpHSl"]}' \
    > test.out 2>&1
eval_tap $? 170 'AdminListUserIDByUserIDsV3' test.out

#- 171 AdminBulkGetUsersPlatform
./ng net.accelbyte.sdk.cli.Main iam adminBulkGetUsersPlatform \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["5MRguZCN", "Kj7bbWfB", "UCEjS8Sq"]}' \
    > test.out 2>&1
eval_tap $? 171 'AdminBulkGetUsersPlatform' test.out

#- 172 AdminCursorGetUserV3
./ng net.accelbyte.sdk.cli.Main iam adminCursorGetUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"cursor": {"cursorTime": "JAat0bqR", "userId": "pfB1PIT3"}, "fields": ["x7ACOyVB", "O1nyEfyk", "YILG1jO8"], "limit": 51}' \
    > test.out 2>&1
eval_tap $? 172 'AdminCursorGetUserV3' test.out

#- 173 AdminInviteUserV3
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddresses": ["XLVwfq41", "IwB9CbRT", "vbh7qDzy"], "isAdmin": true, "languageTag": "91AwY27P", "namespace": "yFatgbJm", "roles": ["NyfYRthW", "7sZ6QqKB", "pYPWzJfR"]}' \
    > test.out 2>&1
eval_tap $? 173 'AdminInviteUserV3' test.out

#- 174 AdminQueryThirdPlatformLinkHistoryV3
./ng net.accelbyte.sdk.cli.Main iam adminQueryThirdPlatformLinkHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '96' \
    --offset '45' \
    --platformUserId 'PXyKBy9j' \
    --platformId 'sisZqn4w' \
    > test.out 2>&1
eval_tap $? 174 'AdminQueryThirdPlatformLinkHistoryV3' test.out

#- 175 AdminListUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminListUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '0' \
    --offset '72' \
    > test.out 2>&1
eval_tap $? 175 'AdminListUsersV3' test.out

#- 176 AdminSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam adminSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'Y50JBTwW' \
    --endDate 'rz91qXHQ' \
    --includeTotal  \
    --limit '62' \
    --offset '9' \
    --platformBy 'GQOM9Skn' \
    --platformId 'E4d0Y4Zo' \
    --query 'dAFoGx2P' \
    --roleIds 'AdSJI8lC' \
    --selectedFields '1BumfaAj' \
    --skipLoginQueue  \
    --startDate 'a9qiEm5I' \
    --tagIds '9tJuH3m4' \
    --testAccount  \
    > test.out 2>&1
eval_tap $? 176 'AdminSearchUserV3' test.out

#- 177 AdminGetBulkUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"listEmailAddressRequest": ["dTQFUUdI", "yEorIEW4", "Wx7idaFR"]}' \
    > test.out 2>&1
eval_tap $? 177 'AdminGetBulkUserByEmailAddressV3' test.out

#- 178 AdminGetUserByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ezA2WskA' \
    > test.out 2>&1
eval_tap $? 178 'AdminGetUserByUserIdV3' test.out

#- 179 AdminUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'zfsHzOX9' \
    --body '{"avatarUrl": "kCCKe7fS", "country": "LLSq7NHR", "dateOfBirth": "0prd3NBj", "displayName": "kctr5t1E", "languageTag": "6FtFBo2H", "skipLoginQueue": true, "tags": ["UkOY3I6b", "YuLT9LMO", "Htj41is8"], "uniqueDisplayName": "LH7oycQZ", "userName": "hBwm5auR"}' \
    > test.out 2>&1
eval_tap $? 179 'AdminUpdateUserV3' test.out

#- 180 AdminGetUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'EjG8Qv50' \
    --activeOnly  \
    --after '6Nz5WfCV' \
    --before 'W7QTq5Ev' \
    --limit '69' \
    > test.out 2>&1
eval_tap $? 180 'AdminGetUserBanV3' test.out

#- 181 AdminBanUserV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'MPd6imTg' \
    --body '{"ban": "QqrsiaST", "comment": "6Qbg1flT", "endDate": "8KLeBlcP", "reason": "JHOmrAh7", "skipNotif": false}' \
    > test.out 2>&1
eval_tap $? 181 'AdminBanUserV3' test.out

#- 182 AdminGetUserBanSummaryV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanSummaryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Vw9pZjEJ' \
    > test.out 2>&1
eval_tap $? 182 'AdminGetUserBanSummaryV3' test.out

#- 183 AdminUpdateUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserBanV3 \
    --banId 'tdz38Sxc' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Tn5ECx1i' \
    --body '{"enabled": false, "skipNotif": false}' \
    > test.out 2>&1
eval_tap $? 183 'AdminUpdateUserBanV3' test.out

#- 184 AdminSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '3tMYfaHK' \
    --body '{"context": "MYAHOT1E", "emailAddress": "hI7Ylxjx", "languageTag": "KOVFGzrA", "upgradeToken": "Mr5aplhm"}' \
    > test.out 2>&1
eval_tap $? 184 'AdminSendVerificationCodeV3' test.out

#- 185 AdminVerifyAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'NrKWHKgP' \
    --body '{"Code": "7knuwPov", "ContactType": "PVCqLX4h", "LanguageTag": "gcpDzUrz", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 185 'AdminVerifyAccountV3' test.out

#- 186 GetUserVerificationCode
./ng net.accelbyte.sdk.cli.Main iam getUserVerificationCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'asj2UwN4' \
    > test.out 2>&1
eval_tap $? 186 'GetUserVerificationCode' test.out

#- 187 AdminGetUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'nBfHe2Zl' \
    > test.out 2>&1
eval_tap $? 187 'AdminGetUserDeletionStatusV3' test.out

#- 188 AdminUpdateUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'o4ajE8Np' \
    --body '{"deletionDate": 11, "enabled": false}' \
    > test.out 2>&1
eval_tap $? 188 'AdminUpdateUserDeletionStatusV3' test.out

#- 189 AdminListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'F9DduREk' \
    > test.out 2>&1
eval_tap $? 189 'AdminListUserAllPlatformAccountsDistinctV3' test.out

#- 190 AdminUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'd6j20nXO' \
    --body '{"code": "TKefYXqo", "country": "TKzD2DmS", "dateOfBirth": "dUDWojmA", "displayName": "7UmtOLj7", "emailAddress": "3z4kY7eJ", "password": "ee55BkUE", "uniqueDisplayName": "709VOuHq", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 190 'AdminUpgradeHeadlessAccountV3' test.out

#- 191 AdminDeleteUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '3J3B3ESq' \
    > test.out 2>&1
eval_tap $? 191 'AdminDeleteUserInformationV3' test.out

#- 192 AdminGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'uAp5ibVn' \
    --after '0.09238321982866193' \
    --before '0.924712659548651' \
    --limit '60' \
    > test.out 2>&1
eval_tap $? 192 'AdminGetUserLoginHistoriesV3' test.out

#- 193 AdminResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam adminResetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'qL6yoBbJ' \
    --body '{"languageTag": "o9wP28Zv", "mfaToken": "fJGHc1HK", "newPassword": "nnfi9i17", "oldPassword": "j6Qy2VA1"}' \
    > test.out 2>&1
eval_tap $? 193 'AdminResetPasswordV3' test.out

#- 194 AdminUpdateUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserPermissionV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'L2ZCqOl2' \
    --body '{"Permissions": [{"Action": 46, "Resource": "SJZcxTWu", "SchedAction": 77, "SchedCron": "qHk6vwn1", "SchedRange": ["03gD0er5", "GNHvRD3u", "NYZUS6Ls"]}, {"Action": 67, "Resource": "mHyjCfRC", "SchedAction": 65, "SchedCron": "zt7hdldL", "SchedRange": ["3gC6WNhE", "LeeTfNbq", "ebYaGoRT"]}, {"Action": 28, "Resource": "SWdtpJmb", "SchedAction": 83, "SchedCron": "DOGsi1ec", "SchedRange": ["NGQTOpNd", "I0C6xVDN", "sVgwt13B"]}]}' \
    > test.out 2>&1
eval_tap $? 194 'AdminUpdateUserPermissionV3' test.out

#- 195 AdminAddUserPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserPermissionsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'uJJOV5M4' \
    --body '{"Permissions": [{"Action": 55, "Resource": "76TTiuDA", "SchedAction": 49, "SchedCron": "A2T8FSlP", "SchedRange": ["1ujZEJZj", "onNkcCup", "CT1UDToW"]}, {"Action": 8, "Resource": "MrVZU5xe", "SchedAction": 57, "SchedCron": "lJxsbs13", "SchedRange": ["l7Cz62J1", "nH8oF5Ij", "w3KnlpFS"]}, {"Action": 36, "Resource": "2DvANu5H", "SchedAction": 1, "SchedCron": "No1X6tBV", "SchedRange": ["FMGIHd5Z", "ocOOE41n", "wFFrBmk4"]}]}' \
    > test.out 2>&1
eval_tap $? 195 'AdminAddUserPermissionsV3' test.out

#- 196 AdminDeleteUserPermissionBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '84n5nwTO' \
    --body '[{"Action": 44, "Resource": "i6JiZFE0"}, {"Action": 99, "Resource": "SP0mAya7"}, {"Action": 85, "Resource": "sihw6LWn"}]' \
    > test.out 2>&1
eval_tap $? 196 'AdminDeleteUserPermissionBulkV3' test.out

#- 197 AdminDeleteUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionV3 \
    --action '86' \
    --namespace "$AB_NAMESPACE" \
    --resource 'xYkjsTYu' \
    --userId 'KIb9jkOC' \
    > test.out 2>&1
eval_tap $? 197 'AdminDeleteUserPermissionV3' test.out

#- 198 AdminGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'cbcDwp2r' \
    --after 'hxI2kvxA' \
    --before 'G7Wwgr14' \
    --limit '55' \
    --platformId '3tc4G1AN' \
    --targetNamespace 'lQgdFdDj' \
    > test.out 2>&1
eval_tap $? 198 'AdminGetUserPlatformAccountsV3' test.out

#- 199 AdminListAllDistinctPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminListAllDistinctPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'xjuD1PkD' \
    --status 'AGSEAIu2' \
    > test.out 2>&1
eval_tap $? 199 'AdminListAllDistinctPlatformAccountsV3' test.out

#- 200 AdminGetListJusticePlatformAccounts
./ng net.accelbyte.sdk.cli.Main iam adminGetListJusticePlatformAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'JhzgRudO' \
    > test.out 2>&1
eval_tap $? 200 'AdminGetListJusticePlatformAccounts' test.out

#- 201 AdminGetUserMapping
./ng net.accelbyte.sdk.cli.Main iam adminGetUserMapping \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'NyTWmqTN' \
    --userId 'Heud6i79' \
    --createIfNotFound  \
    > test.out 2>&1
eval_tap $? 201 'AdminGetUserMapping' test.out

#- 202 AdminCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam adminCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace '4JMotIbN' \
    --userId 'n7PPAsHZ' \
    > test.out 2>&1
eval_tap $? 202 'AdminCreateJusticeUser' test.out

#- 203 AdminLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'lsLXDpkK' \
    --skipConflict  \
    --body '{"platformId": "mrt8MqHi", "platformUserId": "3sYuKmE5"}' \
    > test.out 2>&1
eval_tap $? 203 'AdminLinkPlatformAccount' test.out

#- 204 AdminGetUserLinkHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLinkHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'QbXwba7L' \
    --platformId '98cgDx3S' \
    > test.out 2>&1
eval_tap $? 204 'AdminGetUserLinkHistoriesV3' test.out

#- 205 AdminPlatformUnlinkV3
eval_tap 0 205 'AdminPlatformUnlinkV3 # SKIP deprecated' test.out

#- 206 AdminPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Aa5DFbQM' \
    --userId 'n0nsNJmZ' \
    > test.out 2>&1
eval_tap $? 206 'AdminPlatformUnlinkAllV3' test.out

#- 207 AdminPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'izruUkqA' \
    --userId 'Rtaao9F4' \
    --ticket 'VegocjqU' \
    > test.out 2>&1
eval_tap $? 207 'AdminPlatformLinkV3' test.out

#- 208 AdminDeleteUserLinkingHistoryByPlatformIDV3
eval_tap 0 208 'AdminDeleteUserLinkingHistoryByPlatformIDV3 # SKIP deprecated' test.out

#- 209 AdminDeleteUserLinkingRestrictionByPlatformIDV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserLinkingRestrictionByPlatformIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'NNcXQFbJ' \
    --userId 'Uk5jC3QT' \
    > test.out 2>&1
eval_tap $? 209 'AdminDeleteUserLinkingRestrictionByPlatformIDV3' test.out

#- 210 AdminGetThirdPartyPlatformTokenLinkStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetThirdPartyPlatformTokenLinkStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'nBzisJkA' \
    --userId 'u3tZJReE' \
    --platformToken '10paXpG1' \
    > test.out 2>&1
eval_tap $? 210 'AdminGetThirdPartyPlatformTokenLinkStatusV3' test.out

#- 211 AdminGetUserSinglePlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminGetUserSinglePlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --platformId '11l4lnvk' \
    --userId 'MmTIxSjA' \
    --crossNamespace  \
    > test.out 2>&1
eval_tap $? 211 'AdminGetUserSinglePlatformAccount' test.out

#- 212 AdminDeleteUserRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRolesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '4HNzhDa8' \
    --body '["o7OtIfar", "Qsw2BF2I", "FSexj5KB"]' \
    > test.out 2>&1
eval_tap $? 212 'AdminDeleteUserRolesV3' test.out

#- 213 AdminSaveUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminSaveUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'A1H2IDRr' \
    --body '[{"namespace": "qWfgGqwJ", "roleId": "FbCVHkq5"}, {"namespace": "EwMMA56i", "roleId": "EnCHpU9m"}, {"namespace": "Px9eO28p", "roleId": "ngDRRVLO"}]' \
    > test.out 2>&1
eval_tap $? 213 'AdminSaveUserRoleV3' test.out

#- 214 AdminAddUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'Zz2WHbz7' \
    --userId 'PDRDS86V' \
    > test.out 2>&1
eval_tap $? 214 'AdminAddUserRoleV3' test.out

#- 215 AdminDeleteUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'wd0lhg7G' \
    --userId 'K7CZn3fW' \
    > test.out 2>&1
eval_tap $? 215 'AdminDeleteUserRoleV3' test.out

#- 216 AdminGetUserStateByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserStateByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '4ZhSQrxC' \
    > test.out 2>&1
eval_tap $? 216 'AdminGetUserStateByUserIdV3' test.out

#- 217 AdminUpdateUserStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '7g4AhU12' \
    --body '{"enabled": true, "reason": "WQQ97EWg"}' \
    > test.out 2>&1
eval_tap $? 217 'AdminUpdateUserStatusV3' test.out

#- 218 AdminTrustlyUpdateUserIdentity
./ng net.accelbyte.sdk.cli.Main iam adminTrustlyUpdateUserIdentity \
    --namespace "$AB_NAMESPACE" \
    --userId '0vh55Dyv' \
    --body '{"emailAddress": "rMTdmGy9", "password": "GfbAqMIi"}' \
    > test.out 2>&1
eval_tap $? 218 'AdminTrustlyUpdateUserIdentity' test.out

#- 219 AdminVerifyUserWithoutVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyUserWithoutVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ChjAmYek' \
    > test.out 2>&1
eval_tap $? 219 'AdminVerifyUserWithoutVerificationCodeV3' test.out

#- 220 AdminUpdateClientSecretV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientSecretV3 \
    --clientId 'fPNy1oUN' \
    --namespace "$AB_NAMESPACE" \
    --body '{"newSecret": "hczReXaK"}' \
    > test.out 2>&1
eval_tap $? 220 'AdminUpdateClientSecretV3' test.out

#- 221 AdminCheckThirdPartyLoginPlatformAvailabilityV3
./ng net.accelbyte.sdk.cli.Main iam adminCheckThirdPartyLoginPlatformAvailabilityV3 \
    --platformId 'tHjVJALX' \
    > test.out 2>&1
eval_tap $? 221 'AdminCheckThirdPartyLoginPlatformAvailabilityV3' test.out

#- 222 AdminGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV3 \
    --after 'boR3evDH' \
    --before 'fx09w564' \
    --isWildcard  \
    --limit '57' \
    > test.out 2>&1
eval_tap $? 222 'AdminGetRolesV3' test.out

#- 223 AdminCreateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV3 \
    --body '{"adminRole": true, "deletable": true, "isWildcard": false, "managers": [{"displayName": "NGUoea0F", "namespace": "7LsSJNyh", "userId": "qD0mlWzE"}, {"displayName": "rg8y31qY", "namespace": "jEgnEww5", "userId": "HIeTr1JO"}, {"displayName": "k09l5zie", "namespace": "UsM4v88Z", "userId": "vkkkbx6c"}], "members": [{"displayName": "zeVSfnfO", "namespace": "cTw0HoN3", "userId": "btZ4JYMt"}, {"displayName": "4zbkivSr", "namespace": "groRedQJ", "userId": "IILcUXdv"}, {"displayName": "4tEwKaPd", "namespace": "FkrxTUcj", "userId": "jPmSNxUn"}], "permissions": [{"action": 5, "resource": "JaOAD4p8", "schedAction": 67, "schedCron": "6ffnMCOr", "schedRange": ["7V8tZ7Eh", "McUig0Tk", "ucHGwkdR"]}, {"action": 32, "resource": "2creoJ02", "schedAction": 75, "schedCron": "Ra30QNeC", "schedRange": ["TBxg5iND", "DGRYqJBr", "CUsN0v7V"]}, {"action": 63, "resource": "KDvjn5i3", "schedAction": 55, "schedCron": "SWcYOe19", "schedRange": ["O1MLwoVh", "a1GeaXQe", "pC4cVEOy"]}], "roleName": "HRphAbM9"}' \
    > test.out 2>&1
eval_tap $? 223 'AdminCreateRoleV3' test.out

#- 224 AdminGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV3 \
    --roleId 'PGOLkmnX' \
    > test.out 2>&1
eval_tap $? 224 'AdminGetRoleV3' test.out

#- 225 AdminDeleteRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV3 \
    --roleId 'iLAT0mIq' \
    > test.out 2>&1
eval_tap $? 225 'AdminDeleteRoleV3' test.out

#- 226 AdminUpdateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV3 \
    --roleId 'ADqQ6IX8' \
    --body '{"deletable": false, "isWildcard": true, "roleName": "xSIQCvA4"}' \
    > test.out 2>&1
eval_tap $? 226 'AdminUpdateRoleV3' test.out

#- 227 AdminGetRoleAdminStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleAdminStatusV3 \
    --roleId 'X6zJYWd7' \
    > test.out 2>&1
eval_tap $? 227 'AdminGetRoleAdminStatusV3' test.out

#- 228 AdminUpdateAdminRoleStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateAdminRoleStatusV3 \
    --roleId 'DTwEf5hF' \
    > test.out 2>&1
eval_tap $? 228 'AdminUpdateAdminRoleStatusV3' test.out

#- 229 AdminRemoveRoleAdminV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleAdminV3 \
    --roleId 'rF29SqCM' \
    > test.out 2>&1
eval_tap $? 229 'AdminRemoveRoleAdminV3' test.out

#- 230 AdminGetRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleManagersV3 \
    --roleId 'yEm9csJO' \
    --after '3R0Te5BL' \
    --before 'QTRYTP9q' \
    --limit '79' \
    > test.out 2>&1
eval_tap $? 230 'AdminGetRoleManagersV3' test.out

#- 231 AdminAddRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleManagersV3 \
    --roleId 'E5sJQxk3' \
    --body '{"managers": [{"displayName": "tHf8mpV1", "namespace": "y2tl1LaR", "userId": "jLyzRJ0d"}, {"displayName": "xrU5qRDB", "namespace": "OnVuKtGd", "userId": "wFHeqyFy"}, {"displayName": "JuWhRqq4", "namespace": "5UxDfpJ5", "userId": "myWu4Hvn"}]}' \
    > test.out 2>&1
eval_tap $? 231 'AdminAddRoleManagersV3' test.out

#- 232 AdminRemoveRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleManagersV3 \
    --roleId 'WKEuuJwj' \
    --body '{"managers": [{"displayName": "iEsvgwVM", "namespace": "sXxYnNY0", "userId": "thlpfRpL"}, {"displayName": "r7Qc0RQl", "namespace": "FNfeliOI", "userId": "LMySciRl"}, {"displayName": "3lEy6mIb", "namespace": "cEvMXRu7", "userId": "T3ReMMBR"}]}' \
    > test.out 2>&1
eval_tap $? 232 'AdminRemoveRoleManagersV3' test.out

#- 233 AdminGetRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleMembersV3 \
    --roleId 'RlCkxdLN' \
    --after 'rcK01Qck' \
    --before 'otzzArPK' \
    --limit '68' \
    > test.out 2>&1
eval_tap $? 233 'AdminGetRoleMembersV3' test.out

#- 234 AdminAddRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleMembersV3 \
    --roleId 'P6l84iK4' \
    --body '{"members": [{"displayName": "C48fmJtg", "namespace": "QjkCLNhQ", "userId": "SKqKld9j"}, {"displayName": "b0jPmtT4", "namespace": "HtS2izzx", "userId": "bHMTGPNo"}, {"displayName": "6Pa3Ru8p", "namespace": "HLFgMVHu", "userId": "Iz98lysh"}]}' \
    > test.out 2>&1
eval_tap $? 234 'AdminAddRoleMembersV3' test.out

#- 235 AdminRemoveRoleMembersV3
eval_tap 0 235 'AdminRemoveRoleMembersV3 # SKIP deprecated' test.out

#- 236 AdminUpdateRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV3 \
    --roleId 'mSN3AnAh' \
    --body '{"permissions": [{"action": 87, "resource": "pEUpkrD6", "schedAction": 84, "schedCron": "x0qiapk9", "schedRange": ["B8Pq12nM", "XsGXIm0S", "oAyvMMdR"]}, {"action": 97, "resource": "vHZkotga", "schedAction": 30, "schedCron": "rX2rQOtY", "schedRange": ["erTo8RgA", "5VsZnkRm", "k9TuPAo0"]}, {"action": 37, "resource": "rH5JuKzR", "schedAction": 17, "schedCron": "ajAXhtH6", "schedRange": ["uGctI4Vz", "7lNDC4em", "aXJW1KPZ"]}]}' \
    > test.out 2>&1
eval_tap $? 236 'AdminUpdateRolePermissionsV3' test.out

#- 237 AdminAddRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV3 \
    --roleId 'Pxh7vqta' \
    --body '{"permissions": [{"action": 66, "resource": "BkJI2hRQ", "schedAction": 1, "schedCron": "11FQwma6", "schedRange": ["d3n3wWfY", "idNF0941", "P5LO35hi"]}, {"action": 3, "resource": "AxdEQlWc", "schedAction": 12, "schedCron": "ApKllQty", "schedRange": ["jwnhgiti", "Cs7wkQUq", "mgdMdepR"]}, {"action": 74, "resource": "40WyKEIM", "schedAction": 15, "schedCron": "YmbmJxeM", "schedRange": ["xeI6rHeC", "h6oeVaCr", "ApPsn8yb"]}]}' \
    > test.out 2>&1
eval_tap $? 237 'AdminAddRolePermissionsV3' test.out

#- 238 AdminDeleteRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV3 \
    --roleId 'jSmiMfCS' \
    --body '["LKavfYr0", "YeOwThV8", "7e221Sed"]' \
    > test.out 2>&1
eval_tap $? 238 'AdminDeleteRolePermissionsV3' test.out

#- 239 AdminDeleteRolePermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionV3 \
    --action '30' \
    --resource 'P7yyNYfr' \
    --roleId 'i1VhGhGX' \
    > test.out 2>&1
eval_tap $? 239 'AdminDeleteRolePermissionV3' test.out

#- 240 AdminGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam adminGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 240 'AdminGetMyUserV3' test.out

#- 241 UserAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam userAuthenticationV3 \
    --clientId '2XBmb251' \
    --extendExp  \
    --redirectUri '8J79gcPk' \
    --password 'WuA2rEup' \
    --requestId 'xtOhqHmz' \
    --userName 'DwoKCbkF' \
    > test.out 2>&1
eval_tap $? 241 'UserAuthenticationV3' test.out

#- 242 AuthenticationWithPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV3 \
    --extendExp  \
    --clientId 'fr3vFSAj' \
    --linkingToken 'UNuVFW0X' \
    --password 'nzQMplYS' \
    --username 'gR1qBFbf' \
    > test.out 2>&1
eval_tap $? 242 'AuthenticationWithPlatformLinkV3' test.out

#- 243 AuthenticateAndLinkForwardV3
./ng net.accelbyte.sdk.cli.Main iam authenticateAndLinkForwardV3 \
    --extendExp  \
    --clientId 'Ud8HWJSB' \
    --linkingToken 'Gu8SeUhA' \
    --password 'xDUv2dZK' \
    --username '5dP2esJl' \
    > test.out 2>&1
eval_tap $? 243 'AuthenticateAndLinkForwardV3' test.out

#- 244 PublicGetSystemConfigV3
./ng net.accelbyte.sdk.cli.Main iam publicGetSystemConfigV3 \
    > test.out 2>&1
eval_tap $? 244 'PublicGetSystemConfigV3' test.out

#- 245 GenerateTokenByNewHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV3 \
    --additionalData 'eah7c4ih' \
    --extendExp  \
    --linkingToken 'apsrUkNY' \
    > test.out 2>&1
eval_tap $? 245 'GenerateTokenByNewHeadlessAccountV3' test.out

#- 246 RequestOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam requestOneTimeLinkingCodeV3 \
    --redirectUri 'soq0tS1q' \
    --state 'EUjNEN8U' \
    --platformId 'SLOfECAN' \
    > test.out 2>&1
eval_tap $? 246 'RequestOneTimeLinkingCodeV3' test.out

#- 247 ValidateOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam validateOneTimeLinkingCodeV3 \
    --oneTimeLinkCode 's1yX7fDW' \
    > test.out 2>&1
eval_tap $? 247 'ValidateOneTimeLinkingCodeV3' test.out

#- 248 RequestTokenByOneTimeLinkCodeResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTokenByOneTimeLinkCodeResponseV3 \
    --additionalData 'SZL8nFdr' \
    --isTransient  \
    --clientId 'VmcFhPlZ' \
    --oneTimeLinkCode 'lyorrBG1' \
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
    --codeChallenge 'OFpgLkpy' \
    --codeChallengeMethod 'plain' \
    --clientId 'FemEkddY' \
    > test.out 2>&1
eval_tap $? 251 'RequestTokenExchangeCodeV3' test.out

#- 252 AdminRetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam adminRetrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'BprW35vG' \
    --userId 'QGMyUJM4' \
    --platformUserId 'HtdvjWkE' \
    > test.out 2>&1
eval_tap $? 252 'AdminRetrieveUserThirdPartyPlatformTokenV3' test.out

#- 253 RevokeUserV3
./ng net.accelbyte.sdk.cli.Main iam revokeUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'NA1F3dXV' \
    --includeGameNamespace  \
    > test.out 2>&1
eval_tap $? 253 'RevokeUserV3' test.out

#- 254 AuthorizeV3
./ng net.accelbyte.sdk.cli.Main iam authorizeV3 \
    --blockedPlatformId 'kcc224AV' \
    --codeChallenge '3QlAhId2' \
    --codeChallengeMethod 'plain' \
    --createHeadless  \
    --loginWebBased  \
    --nonce 'q8ToP2YM' \
    --oneTimeLinkCode '4ajLuRmO' \
    --redirectUri '6ZJdux4h' \
    --scope 'LZbFClFl' \
    --state 'CkVfjAcl' \
    --targetAuthPage 'ytOIVB2z' \
    --useRedirectUriAsLoginUrlWhenLocked  \
    --clientId 'MLQ9F721' \
    --responseType 'code' \
    > test.out 2>&1
eval_tap $? 254 'AuthorizeV3' test.out

#- 255 TokenIntrospectionV3
./ng net.accelbyte.sdk.cli.Main iam tokenIntrospectionV3 \
    --token 'xHOsbcLl' \
    > test.out 2>&1
eval_tap $? 255 'TokenIntrospectionV3' test.out

#- 256 GetJWKSV3
./ng net.accelbyte.sdk.cli.Main iam getJWKSV3 \
    > test.out 2>&1
eval_tap $? 256 'GetJWKSV3' test.out

#- 257 SendMFAAuthenticationCode
./ng net.accelbyte.sdk.cli.Main iam sendMFAAuthenticationCode \
    --clientId 'Z9BuUnGp' \
    --factor 'PlJubeXT' \
    --mfaToken 'HCPPoBvb' \
    > test.out 2>&1
eval_tap $? 257 'SendMFAAuthenticationCode' test.out

#- 258 Change2faMethod
./ng net.accelbyte.sdk.cli.Main iam change2faMethod \
    --factor 'zmTH9RrI' \
    --mfaToken 'a4B4fJ9H' \
    > test.out 2>&1
eval_tap $? 258 'Change2faMethod' test.out

#- 259 Verify2faCode
./ng net.accelbyte.sdk.cli.Main iam verify2faCode \
    --code 'O6ImOhAH' \
    --factor 'rua1TZzG' \
    --mfaToken 'JLUZcFVP' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 259 'Verify2faCode' test.out

#- 260 Verify2faCodeForward
./ng net.accelbyte.sdk.cli.Main iam verify2faCodeForward \
    --defaultFactor 'uxZKdero' \
    --factors 'j4itSdDg' \
    --rememberDevice  \
    --clientId 'fpfIYm7T' \
    --code 'EnMOfIrp' \
    --factor 'Q4GirRSy' \
    --mfaToken 'jrdSt85C' \
    > test.out 2>&1
eval_tap $? 260 'Verify2faCodeForward' test.out

#- 261 RetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam retrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'blb9mNZz' \
    --userId 'ZLKrKIjK' \
    > test.out 2>&1
eval_tap $? 261 'RetrieveUserThirdPartyPlatformTokenV3' test.out

#- 262 AuthCodeRequestV3
./ng net.accelbyte.sdk.cli.Main iam authCodeRequestV3 \
    --platformId 'ZPqh65SP' \
    --clientId '1o2JegQc' \
    --redirectUri 'RnDhg5Jy' \
    --requestId 'TjuYTT4c' \
    > test.out 2>&1
eval_tap $? 262 'AuthCodeRequestV3' test.out

#- 263 PlatformTokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV3 \
    --platformId 'vrEyJtMA' \
    --additionalData '4waSqShc' \
    --clientId 'xwG0K6BX' \
    --createHeadless  \
    --deviceId '1FC7l18b' \
    --macAddress 'mSAy8Irp' \
    --platformToken 'gkRM7T3o' \
    --serviceLabel '0.39582265456679666' \
    --skipSetCookie  \
    > test.out 2>&1
eval_tap $? 263 'PlatformTokenGrantV3' test.out

#- 264 GetRevocationListV3
./ng net.accelbyte.sdk.cli.Main iam getRevocationListV3 \
    > test.out 2>&1
eval_tap $? 264 'GetRevocationListV3' test.out

#- 265 TokenRevocationV3
./ng net.accelbyte.sdk.cli.Main iam tokenRevocationV3 \
    --token 'ciNyRMOV' \
    > test.out 2>&1
eval_tap $? 265 'TokenRevocationV3' test.out

#- 266 SimultaneousLoginV3
./ng net.accelbyte.sdk.cli.Main iam simultaneousLoginV3 \
    --simultaneousPlatform 'SaQ35Er9' \
    --simultaneousTicket 'tOUDvni9' \
    --nativePlatform 'steam' \
    --nativePlatformTicket '0wYtfQfp' \
    > test.out 2>&1
eval_tap $? 266 'SimultaneousLoginV3' test.out

#- 267 TokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV3 \
    --additionalData 'kkS4m2wD' \
    --clientId 'uZ72f9dF' \
    --clientSecret 'dQ0Dmgdu' \
    --code 'xd9tBThj' \
    --codeVerifier 'fcfeXPxP' \
    --extendNamespace 'iPNMS1Ws' \
    --extendExp  \
    --password 'W6URJqhB' \
    --redirectUri 'gKtbJ1Ka' \
    --refreshToken 'i5vrSFwh' \
    --scope 'PxgZJhE5' \
    --username 'jFPQXeFL' \
    --grantType 'authorization_code' \
    > test.out 2>&1
eval_tap $? 267 'TokenGrantV3' test.out

#- 268 VerifyTokenV3
./ng net.accelbyte.sdk.cli.Main iam verifyTokenV3 \
    --token 'KA78rswC' \
    > test.out 2>&1
eval_tap $? 268 'VerifyTokenV3' test.out

#- 269 PlatformAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticationV3 \
    --platformId 'ZgqTyl9R' \
    --code 'ugmDbxW3' \
    --error 'kbK1pOQT' \
    --openidAssocHandle 'fG3Aswwm' \
    --openidClaimedId 'FdvYSfwa' \
    --openidIdentity 'e0kIdjFC' \
    --openidMode 'DPHFpM9C' \
    --openidNs 'B9FgCVK6' \
    --openidOpEndpoint 'axoS3zNF' \
    --openidResponseNonce 'JOlmGEpP' \
    --openidReturnTo 'mCWepvOM' \
    --openidSig 'jLSjufps' \
    --openidSigned '0DzcWCY5' \
    --state 'mIpHWzgs' \
    > test.out 2>&1
eval_tap $? 269 'PlatformAuthenticationV3' test.out

#- 270 PlatformTokenRefreshV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenRefreshV3 \
    --platformId 'rEB9G9Xs' \
    --platformToken 'FhU55m9A' \
    > test.out 2>&1
eval_tap $? 270 'PlatformTokenRefreshV3' test.out

#- 271 PublicGetInputValidations
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidations \
    --defaultOnEmpty  \
    --languageCode 'SkDe1f5N' \
    > test.out 2>&1
eval_tap $? 271 'PublicGetInputValidations' test.out

#- 272 PublicGetInputValidationByField
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidationByField \
    --field 'Wjn7l5MJ' \
    > test.out 2>&1
eval_tap $? 272 'PublicGetInputValidationByField' test.out

#- 273 PublicGetCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam publicGetCountryAgeRestrictionV3 \
    --countryCode 'A9PcK8Sd' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 273 'PublicGetCountryAgeRestrictionV3' test.out

#- 274 PublicGetConfigValueV3
./ng net.accelbyte.sdk.cli.Main iam publicGetConfigValueV3 \
    --configKey 'gTT1eEVM' \
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
    --clientId 'g6L1R646' \
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
    --requestId 'hK9kZVfn' \
    > test.out 2>&1
eval_tap $? 281 'PublicGetAsyncStatus' test.out

#- 282 PublicSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam publicSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'YBj1vxgU' \
    --limit '3' \
    --offset '84' \
    --platformBy 'CCr5shVr' \
    --platformId 'bF05BdEy' \
    --query 'LfcP23NQ' \
    > test.out 2>&1
eval_tap $? 282 'PublicSearchUserV3' test.out

#- 283 PublicCreateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "mJNrLnoU", "acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "yGAhBRr5", "policyId": "hleulwWo", "policyVersionId": "NAjm0nWN"}, {"isAccepted": true, "localizedPolicyVersionId": "zq8w2L8E", "policyId": "5BvuBGgp", "policyVersionId": "iCa30NUv"}, {"isAccepted": true, "localizedPolicyVersionId": "FNVFeanS", "policyId": "kxBPzg9Z", "policyVersionId": "3ygsuC7g"}], "authType": "NWF2fHTm", "code": "6R3VAmF7", "country": "guseG0Wu", "dateOfBirth": "EMfXUCxI", "displayName": "QFp4NYql", "emailAddress": "OWWJP9ob", "password": "Ej9tIoij", "reachMinimumAge": false, "uniqueDisplayName": "1JahgfRE"}' \
    > test.out 2>&1
eval_tap $? 283 'PublicCreateUserV3' test.out

#- 284 CheckUserAvailability
./ng net.accelbyte.sdk.cli.Main iam checkUserAvailability \
    --namespace "$AB_NAMESPACE" \
    --field 'eLbVho1D' \
    --query 'YoRUiiOP' \
    > test.out 2>&1
eval_tap $? 284 'CheckUserAvailability' test.out

#- 285 PublicBulkGetUsers
eval_tap 0 285 'PublicBulkGetUsers # SKIP deprecated' test.out

#- 286 PublicSendRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicSendRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "uEBGtabD", "languageTag": "wAjoRqc0"}' \
    > test.out 2>&1
eval_tap $? 286 'PublicSendRegistrationCode' test.out

#- 287 PublicVerifyRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicVerifyRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "F2pZCgXU", "emailAddress": "wiLiuvy6"}' \
    > test.out 2>&1
eval_tap $? 287 'PublicVerifyRegistrationCode' test.out

#- 288 PublicForgotPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicForgotPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "yKRdxJf4", "languageTag": "gChdtW3r"}' \
    > test.out 2>&1
eval_tap $? 288 'PublicForgotPasswordV3' test.out

#- 289 PublicValidateUserInput
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserInput \
    --namespace "$AB_NAMESPACE" \
    --body '{"displayName": "syYUxpnq", "password": "aX8gIua4", "uniqueDisplayName": "ejJxj4eT", "username": "fcdzUe9t"}' \
    > test.out 2>&1
eval_tap $? 289 'PublicValidateUserInput' test.out

#- 290 GetAdminInvitationV3
./ng net.accelbyte.sdk.cli.Main iam getAdminInvitationV3 \
    --invitationId 'jPI1nmoM' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 290 'GetAdminInvitationV3' test.out

#- 291 CreateUserFromInvitationV3
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV3 \
    --invitationId 'BxmB2N9j' \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "axgRWwz3", "acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "MYDeFybN", "policyId": "gAmV7XW2", "policyVersionId": "AfA00ueA"}, {"isAccepted": true, "localizedPolicyVersionId": "3vRXRtH6", "policyId": "LQjGI8vZ", "policyVersionId": "qd5V6FIx"}, {"isAccepted": false, "localizedPolicyVersionId": "HOHObzHT", "policyId": "2W6345hE", "policyVersionId": "KuMXbGAA"}], "authType": "1QBBJkbQ", "code": "1aszfJOI", "country": "37IrYcEO", "dateOfBirth": "mlgmVNYp", "displayName": "nqKKnHkT", "emailAddress": "WIOXiYK1", "password": "krw3QnXo", "reachMinimumAge": false, "uniqueDisplayName": "9ov4bzTj"}' \
    > test.out 2>&1
eval_tap $? 291 'CreateUserFromInvitationV3' test.out

#- 292 UpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam updateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "DfVgxaCA", "country": "TbZZUVIG", "dateOfBirth": "K88kw7cN", "displayName": "Yx82sP28", "languageTag": "GUXNOZ47", "uniqueDisplayName": "5qcVw3a3", "userName": "aLkZLHv9"}' \
    > test.out 2>&1
eval_tap $? 292 'UpdateUserV3' test.out

#- 293 PublicPartialUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicPartialUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "he2yBCMu", "country": "51GnF6Qs", "dateOfBirth": "EB5F2h5T", "displayName": "n1Lf4maA", "languageTag": "VHV0v43L", "uniqueDisplayName": "g9jSaTF0", "userName": "DmpYF70Q"}' \
    > test.out 2>&1
eval_tap $? 293 'PublicPartialUpdateUserV3' test.out

#- 294 PublicSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"context": "p8290G1K", "emailAddress": "hTVURmL7", "languageTag": "J6YswRgw", "upgradeToken": "MVGXssby"}' \
    > test.out 2>&1
eval_tap $? 294 'PublicSendVerificationCodeV3' test.out

#- 295 PublicUserVerificationV3
./ng net.accelbyte.sdk.cli.Main iam publicUserVerificationV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "jVlRRQIG", "contactType": "juvi9sEX", "languageTag": "aiIvucuF", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 295 'PublicUserVerificationV3' test.out

#- 296 PublicUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "lpCx6wEn", "country": "VW3XlcMJ", "dateOfBirth": "xkaoqXx0", "displayName": "3bFRWWqx", "emailAddress": "n8DLDKKu", "password": "qfj9NzED", "uniqueDisplayName": "UfTvMORS", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 296 'PublicUpgradeHeadlessAccountV3' test.out

#- 297 PublicVerifyHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --needVerificationCode  \
    --body '{"emailAddress": "VJzQt59M", "password": "ilU0lMA7"}' \
    > test.out 2>&1
eval_tap $? 297 'PublicVerifyHeadlessAccountV3' test.out

#- 298 PublicUpdatePasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicUpdatePasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"languageTag": "KFQTpaA9", "mfaToken": "KAsw0xhK", "newPassword": "AsNOsAG0", "oldPassword": "3WsLF29a"}' \
    > test.out 2>&1
eval_tap $? 298 'PublicUpdatePasswordV3' test.out

#- 299 PublicCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam publicCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace '1ZLZ0iIh' \
    > test.out 2>&1
eval_tap $? 299 'PublicCreateJusticeUser' test.out

#- 300 PublicPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'U10o4Qf5' \
    --redirectUri 'MgGJBITm' \
    --ticket '6CrXBqvR' \
    > test.out 2>&1
eval_tap $? 300 'PublicPlatformLinkV3' test.out

#- 301 PublicPlatformUnlinkV3
eval_tap 0 301 'PublicPlatformUnlinkV3 # SKIP deprecated' test.out

#- 302 PublicPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 't7UiGN9j' \
    > test.out 2>&1
eval_tap $? 302 'PublicPlatformUnlinkAllV3' test.out

#- 303 PublicForcePlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicForcePlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'TwT6sY1X' \
    --ticket 'pTyCsaMc' \
    > test.out 2>&1
eval_tap $? 303 'PublicForcePlatformLinkV3' test.out

#- 304 PublicWebLinkPlatform
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatform \
    --namespace "$AB_NAMESPACE" \
    --platformId '6J4G3LxI' \
    --clientId '5hsWZmML' \
    --redirectUri 'b56yJirn' \
    > test.out 2>&1
eval_tap $? 304 'PublicWebLinkPlatform' test.out

#- 305 PublicWebLinkPlatformEstablish
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatformEstablish \
    --namespace "$AB_NAMESPACE" \
    --platformId '6PpwDjzT' \
    --code 'YTfgdC9U' \
    --state 'frrjreFD' \
    > test.out 2>&1
eval_tap $? 305 'PublicWebLinkPlatformEstablish' test.out

#- 306 PublicProcessWebLinkPlatformV3
./ng net.accelbyte.sdk.cli.Main iam publicProcessWebLinkPlatformV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'ORwo1Rmq' \
    --code '14XPJmcJ' \
    --state 'ALHt6KQe' \
    > test.out 2>&1
eval_tap $? 306 'PublicProcessWebLinkPlatformV3' test.out

#- 307 PublicGetUsersPlatformInfosV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUsersPlatformInfosV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"platformId": "fSE5k8Cs", "userIds": ["u5IluWDu", "e1aNKwfV", "UcNFaUpX"]}' \
    > test.out 2>&1
eval_tap $? 307 'PublicGetUsersPlatformInfosV3' test.out

#- 308 ResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam resetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientId": "ch5xur94", "code": "eqxARduQ", "emailAddress": "5ixbWjLT", "languageTag": "zVav3Qk2", "newPassword": "YczwFgeR"}' \
    > test.out 2>&1
eval_tap $? 308 'ResetPasswordV3' test.out

#- 309 PublicGetUserByUserIdV3
eval_tap 0 309 'PublicGetUserByUserIdV3 # SKIP deprecated' test.out

#- 310 PublicGetUserBanHistoryV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserBanHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'XDD6Cg5R' \
    --activeOnly  \
    --after 'yXySXAEM' \
    --before '2JXFbZKj' \
    --limit '74' \
    > test.out 2>&1
eval_tap $? 310 'PublicGetUserBanHistoryV3' test.out

#- 311 PublicListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'n4o7ynqz' \
    > test.out 2>&1
eval_tap $? 311 'PublicListUserAllPlatformAccountsDistinctV3' test.out

#- 312 PublicGetUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'd8ryRKNO' \
    > test.out 2>&1
eval_tap $? 312 'PublicGetUserInformationV3' test.out

#- 313 PublicGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'BGwkWmih' \
    --after '0.326505099431075' \
    --before '0.7047629743262654' \
    --limit '33' \
    > test.out 2>&1
eval_tap $? 313 'PublicGetUserLoginHistoriesV3' test.out

#- 314 PublicGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'POlKMrJh' \
    --after 'I6MjfPek' \
    --before 'f4I8iI1K' \
    --limit '9' \
    --platformId 'p0wi8ShY' \
    > test.out 2>&1
eval_tap $? 314 'PublicGetUserPlatformAccountsV3' test.out

#- 315 PublicListJusticePlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicListJusticePlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Zj1xVHEy' \
    > test.out 2>&1
eval_tap $? 315 'PublicListJusticePlatformAccountsV3' test.out

#- 316 PublicLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam publicLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'pVGg8m0W' \
    --body '{"platformId": "R23wRqCY", "platformUserId": "wknOuS88"}' \
    > test.out 2>&1
eval_tap $? 316 'PublicLinkPlatformAccount' test.out

#- 317 PublicForceLinkPlatformWithProgression
./ng net.accelbyte.sdk.cli.Main iam publicForceLinkPlatformWithProgression \
    --namespace "$AB_NAMESPACE" \
    --userId 'HQf7NbgF' \
    --body '{"chosenNamespaces": ["jdJnNrNI", "SB89wenV", "kHXiRWw5"], "requestId": "jvlP1Hlm"}' \
    > test.out 2>&1
eval_tap $? 317 'PublicForceLinkPlatformWithProgression' test.out

#- 318 PublicGetPublisherUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetPublisherUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '1QgaBpi4' \
    > test.out 2>&1
eval_tap $? 318 'PublicGetPublisherUserV3' test.out

#- 319 PublicValidateUserByUserIDAndPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserByUserIDAndPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'wfITxmWQ' \
    --password '6TtMvpGO' \
    > test.out 2>&1
eval_tap $? 319 'PublicValidateUserByUserIDAndPasswordV3' test.out

#- 320 PublicGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRolesV3 \
    --after 'gQHvMNbR' \
    --before 'Sc1rAotj' \
    --isWildcard  \
    --limit '29' \
    > test.out 2>&1
eval_tap $? 320 'PublicGetRolesV3' test.out

#- 321 PublicGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRoleV3 \
    --roleId '50IwL5XG' \
    > test.out 2>&1
eval_tap $? 321 'PublicGetRoleV3' test.out

#- 322 PublicForgotPasswordWithoutNamespaceV3
./ng net.accelbyte.sdk.cli.Main iam publicForgotPasswordWithoutNamespaceV3 \
    --body '{"clientId": "b2phk8bA", "emailAddress": "gWf7oWUz", "languageTag": "CdMgeMk3"}' \
    > test.out 2>&1
eval_tap $? 322 'PublicForgotPasswordWithoutNamespaceV3' test.out

#- 323 PublicGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyUserV3 \
    --includeAllPlatforms  \
    > test.out 2>&1
eval_tap $? 323 'PublicGetMyUserV3' test.out

#- 324 PublicSendCodeForwardV3
./ng net.accelbyte.sdk.cli.Main iam publicSendCodeForwardV3 \
    --body '{"context": "BYjl4UZa", "emailAddress": "8UU6oob0", "languageTag": "csjpr9qe", "upgradeToken": "sW0aPhin"}' \
    > test.out 2>&1
eval_tap $? 324 'PublicSendCodeForwardV3' test.out

#- 325 PublicGetLinkHeadlessAccountToMyAccountConflictV3
./ng net.accelbyte.sdk.cli.Main iam publicGetLinkHeadlessAccountToMyAccountConflictV3 \
    --oneTimeLinkCode 'o2Da7Z1c' \
    > test.out 2>&1
eval_tap $? 325 'PublicGetLinkHeadlessAccountToMyAccountConflictV3' test.out

#- 326 LinkHeadlessAccountToMyAccountV3
./ng net.accelbyte.sdk.cli.Main iam linkHeadlessAccountToMyAccountV3 \
    --body '{"chosenNamespaces": ["KsJyOxky", "teGrPvUu", "7h97mi1J"], "oneTimeLinkCode": "XrHBquYH"}' \
    > test.out 2>&1
eval_tap $? 326 'LinkHeadlessAccountToMyAccountV3' test.out

#- 327 PublicGetMyRedirectionAfterLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyRedirectionAfterLinkV3 \
    --oneTimeLinkCode '38giS5nT' \
    > test.out 2>&1
eval_tap $? 327 'PublicGetMyRedirectionAfterLinkV3' test.out

#- 328 PublicGetMyProfileAllowUpdateStatusV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyProfileAllowUpdateStatusV3 \
    > test.out 2>&1
eval_tap $? 328 'PublicGetMyProfileAllowUpdateStatusV3' test.out

#- 329 PublicSendVerificationLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationLinkV3 \
    --body '{"languageTag": "GROVpoMD"}' \
    > test.out 2>&1
eval_tap $? 329 'PublicSendVerificationLinkV3' test.out

#- 330 PublicGetOpenidUserInfoV3
./ng net.accelbyte.sdk.cli.Main iam publicGetOpenidUserInfoV3 \
    > test.out 2>&1
eval_tap $? 330 'PublicGetOpenidUserInfoV3' test.out

#- 331 PublicVerifyUserByLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyUserByLinkV3 \
    --code 'hMIHwZuh' \
    > test.out 2>&1
eval_tap $? 331 'PublicVerifyUserByLinkV3' test.out

#- 332 PlatformAuthenticateSAMLV3Handler
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticateSAMLV3Handler \
    --platformId '1gocnCkj' \
    --code 'lKTSVqx8' \
    --error 'lymjQGl1' \
    --state '2jgnuI81' \
    > test.out 2>&1
eval_tap $? 332 'PlatformAuthenticateSAMLV3Handler' test.out

#- 333 LoginSSOClient
./ng net.accelbyte.sdk.cli.Main iam loginSSOClient \
    --platformId 'P7fQERew' \
    --payload 'EHB8YbM5' \
    > test.out 2>&1
eval_tap $? 333 'LoginSSOClient' test.out

#- 334 LogoutSSOClient
./ng net.accelbyte.sdk.cli.Main iam logoutSSOClient \
    --platformId '0SlqUr6d' \
    > test.out 2>&1
eval_tap $? 334 'LogoutSSOClient' test.out

#- 335 RequestTargetTokenResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTargetTokenResponseV3 \
    --additionalData 'rvpFYiya' \
    --code 'nUmN4USG' \
    > test.out 2>&1
eval_tap $? 335 'RequestTargetTokenResponseV3' test.out

#- 336 UpgradeAndAuthenticateForwardV3
./ng net.accelbyte.sdk.cli.Main iam upgradeAndAuthenticateForwardV3 \
    --clientId 'J4KkCI8X' \
    --upgradeSuccessToken 'kxJ16RDw' \
    > test.out 2>&1
eval_tap $? 336 'UpgradeAndAuthenticateForwardV3' test.out

#- 337 AdminListInvitationHistoriesV4
./ng net.accelbyte.sdk.cli.Main iam adminListInvitationHistoriesV4 \
    --limit '72' \
    --namespace "$AB_NAMESPACE" \
    --offset '16' \
    > test.out 2>&1
eval_tap $? 337 'AdminListInvitationHistoriesV4' test.out

#- 338 AdminGetDevicesByUserV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDevicesByUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '5AuCnuu5' \
    > test.out 2>&1
eval_tap $? 338 'AdminGetDevicesByUserV4' test.out

#- 339 AdminGetBannedDevicesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedDevicesV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceType 'IQT4vdNJ' \
    --endDate 'KpggF4jz' \
    --limit '43' \
    --offset '9' \
    --startDate 'hZew5B5T' \
    > test.out 2>&1
eval_tap $? 339 'AdminGetBannedDevicesV4' test.out

#- 340 AdminGetUserDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeviceBansV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'O726DG2y' \
    > test.out 2>&1
eval_tap $? 340 'AdminGetUserDeviceBansV4' test.out

#- 341 AdminBanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminBanDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"comment": "3i3XY7Jv", "deviceId": "JQFGudZe", "deviceType": "th06esRA", "enabled": false, "endDate": "Hpo6aAO3", "ext": {"AZBNQnJ6": {}, "zcAjIvo8": {}, "MPm1u1Ej": {}}, "reason": "m4RspjmB"}' \
    > test.out 2>&1
eval_tap $? 341 'AdminBanDeviceV4' test.out

#- 342 AdminGetDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBanV4 \
    --banId 'l1uvmn8w' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 342 'AdminGetDeviceBanV4' test.out

#- 343 AdminUpdateDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateDeviceBanV4 \
    --banId 'pTIZt0DC' \
    --namespace "$AB_NAMESPACE" \
    --body '{"enabled": true}' \
    > test.out 2>&1
eval_tap $? 343 'AdminUpdateDeviceBanV4' test.out

#- 344 AdminGenerateReportV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateReportV4 \
    --namespace "$AB_NAMESPACE" \
    --endDate 'dKtHNZxa' \
    --startDate 'B3HyqLY4' \
    --deviceType 'uSYZSVfy' \
    > test.out 2>&1
eval_tap $? 344 'AdminGenerateReportV4' test.out

#- 345 AdminGetDeviceTypesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceTypesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 345 'AdminGetDeviceTypesV4' test.out

#- 346 AdminGetDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBansV4 \
    --deviceId 'hm4b0axc' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 346 'AdminGetDeviceBansV4' test.out

#- 347 AdminDecryptDeviceV4
eval_tap 0 347 'AdminDecryptDeviceV4 # SKIP deprecated' test.out

#- 348 AdminUnbanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminUnbanDeviceV4 \
    --deviceId 'GcHqnpDG' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 348 'AdminUnbanDeviceV4' test.out

#- 349 AdminGetUsersByDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUsersByDeviceV4 \
    --deviceId 'SpnD1QcZ' \
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
    --limit '25' \
    --offset '67' \
    > test.out 2>&1
eval_tap $? 351 'AdminGetNamespaceUserInvitationHistoryV4' test.out

#- 352 AdminCreateTestUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateTestUsersV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "p7vzR6Du", "policyId": "k2duXfgP", "policyVersionId": "X1zw9A8h"}, {"isAccepted": true, "localizedPolicyVersionId": "aAbioT4c", "policyId": "bQuCwavA", "policyVersionId": "KaNuvuZC"}, {"isAccepted": true, "localizedPolicyVersionId": "ER0O6C8E", "policyId": "L1DRwgYj", "policyVersionId": "YnNZIVyb"}], "count": 89, "userInfo": {"country": "CTRXqmGM"}}' \
    > test.out 2>&1
eval_tap $? 352 'AdminCreateTestUsersV4' test.out

#- 353 AdminCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "7evo4ABx", "policyId": "7bAx0bUx", "policyVersionId": "Hh72LpP6"}, {"isAccepted": false, "localizedPolicyVersionId": "o2mtEQvb", "policyId": "nYauHHPA", "policyVersionId": "Mry1Sa3C"}, {"isAccepted": true, "localizedPolicyVersionId": "Dz5mfdCX", "policyId": "xSXWtxSl", "policyVersionId": "n2ZpUvXn"}], "authType": "EMAILPASSWD", "code": "CbaQvKif", "country": "DUtycHB7", "dateOfBirth": "ijwBkwX7", "displayName": "0IH082R0", "emailAddress": "10nPOCO2", "password": "8q6ZOTDO", "passwordMD5Sum": "jY9upJb9", "reachMinimumAge": false, "uniqueDisplayName": "s6yDPrx6", "username": "PbLgIEL5"}' \
    > test.out 2>&1
eval_tap $? 353 'AdminCreateUserV4' test.out

#- 354 AdminBulkUpdateUserAccountTypeV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateUserAccountTypeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"testAccount": false, "userIds": ["9Bf6c17K", "5ehtiWWw", "LpSxNlFV"]}' \
    > test.out 2>&1
eval_tap $? 354 'AdminBulkUpdateUserAccountTypeV4' test.out

#- 355 AdminBulkCheckValidUserIDV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkCheckValidUserIDV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["riTq8o0E", "adGWDVeM", "2rwtdmxh"]}' \
    > test.out 2>&1
eval_tap $? 355 'AdminBulkCheckValidUserIDV4' test.out

#- 356 AdminUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'QfDlJBQc' \
    --body '{"avatarUrl": "7bLRXHPA", "country": "R7CdaICe", "dateOfBirth": "gx6LvEUH", "displayName": "ZtPZNb6j", "languageTag": "PvDfCiIr", "skipLoginQueue": false, "tags": ["V8Hj9sE7", "Z7cxaGew", "dcG9eHY3"], "uniqueDisplayName": "X3D0Uezr", "userName": "qSjzegp1"}' \
    > test.out 2>&1
eval_tap $? 356 'AdminUpdateUserV4' test.out

#- 357 AdminUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Zpv40d31' \
    --body '{"code": "DPrPGY8C", "emailAddress": "d7qLe45J"}' \
    > test.out 2>&1
eval_tap $? 357 'AdminUpdateUserEmailAddressV4' test.out

#- 358 AdminDisableUserMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableUserMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'sc2HJ3Qs' \
    --body '{"factor": "sJtxK55f", "mfaToken": "T1OvtGCS"}' \
    > test.out 2>&1
eval_tap $? 358 'AdminDisableUserMFAV4' test.out

#- 359 AdminGetUserMFAStatusV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUserMFAStatusV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'HNa9bEh9' \
    > test.out 2>&1
eval_tap $? 359 'AdminGetUserMFAStatusV4' test.out

#- 360 AdminListUserRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminListUserRolesV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '2YqUhy5q' \
    > test.out 2>&1
eval_tap $? 360 'AdminListUserRolesV4' test.out

#- 361 AdminUpdateUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'hJa64VV9' \
    --body '{"assignedNamespaces": ["7Jp30PtQ", "cS2M5UZ2", "vZkOKxdx"], "roleId": "EtUJzOZW"}' \
    > test.out 2>&1
eval_tap $? 361 'AdminUpdateUserRoleV4' test.out

#- 362 AdminAddUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'A3iWWIWv' \
    --body '{"assignedNamespaces": ["uHOcJx1y", "PsJIKghH", "aIVbG4RB"], "roleId": "kgqrZrwR"}' \
    > test.out 2>&1
eval_tap $? 362 'AdminAddUserRoleV4' test.out

#- 363 AdminRemoveUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRemoveUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'oLjB8cvh' \
    --body '{"assignedNamespaces": ["pIqHrKA6", "0BJ2CK8M", "osvPs5N2"], "roleId": "MaALlR51"}' \
    > test.out 2>&1
eval_tap $? 363 'AdminRemoveUserRoleV4' test.out

#- 364 AdminGetRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV4 \
    --adminRole  \
    --isWildcard  \
    --limit '88' \
    --offset '87' \
    > test.out 2>&1
eval_tap $? 364 'AdminGetRolesV4' test.out

#- 365 AdminCreateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV4 \
    --body '{"adminRole": false, "deletable": true, "isWildcard": true, "roleName": "gJcaZnsV"}' \
    > test.out 2>&1
eval_tap $? 365 'AdminCreateRoleV4' test.out

#- 366 AdminGetRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV4 \
    --roleId '2PLJWCdO' \
    > test.out 2>&1
eval_tap $? 366 'AdminGetRoleV4' test.out

#- 367 AdminDeleteRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV4 \
    --roleId 'txGwI9cv' \
    > test.out 2>&1
eval_tap $? 367 'AdminDeleteRoleV4' test.out

#- 368 AdminUpdateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV4 \
    --roleId 'NsEXNGiK' \
    --body '{"adminRole": false, "deletable": false, "isWildcard": true, "roleName": "AIkFdnpV"}' \
    > test.out 2>&1
eval_tap $? 368 'AdminUpdateRoleV4' test.out

#- 369 AdminUpdateRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV4 \
    --roleId 'kCMccoek' \
    --body '{"permissions": [{"action": 26, "resource": "64DTytN2", "schedAction": 96, "schedCron": "zZK974Ah", "schedRange": ["uCiom3sF", "kxqWAd5f", "MOPk8Z8i"]}, {"action": 99, "resource": "H8Q8LLit", "schedAction": 9, "schedCron": "gogK0tF6", "schedRange": ["gICPqhKw", "5IXFaWaM", "BZY6lP7d"]}, {"action": 98, "resource": "Bb0XdcZA", "schedAction": 82, "schedCron": "kgKmN5gZ", "schedRange": ["GLZtBhmY", "pGpEsQGD", "4JSYsaNj"]}]}' \
    > test.out 2>&1
eval_tap $? 369 'AdminUpdateRolePermissionsV4' test.out

#- 370 AdminAddRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV4 \
    --roleId 'MYVbnsdD' \
    --body '{"permissions": [{"action": 19, "resource": "FuTE5MML", "schedAction": 25, "schedCron": "HlrGGdHc", "schedRange": ["Um1gdlSO", "1fAc3HKh", "WI3Rq3aw"]}, {"action": 47, "resource": "ChhiUJ8n", "schedAction": 38, "schedCron": "4R0LhTTe", "schedRange": ["mPTu1IJ3", "KCZiIWgF", "IhiOptos"]}, {"action": 5, "resource": "4kQFHc8O", "schedAction": 86, "schedCron": "2Od07gAw", "schedRange": ["Rtpif3cP", "pjOgNDkA", "b43iDR9I"]}]}' \
    > test.out 2>&1
eval_tap $? 370 'AdminAddRolePermissionsV4' test.out

#- 371 AdminDeleteRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV4 \
    --roleId 'AAPNsOjH' \
    --body '["i2j4dy7X", "rewNfoRX", "fDtH54gm"]' \
    > test.out 2>&1
eval_tap $? 371 'AdminDeleteRolePermissionsV4' test.out

#- 372 AdminListAssignedUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminListAssignedUsersV4 \
    --roleId 'h1kIa13Y' \
    --after 'pW5UHcrG' \
    --before 'lZp4Urzh' \
    --limit '0' \
    > test.out 2>&1
eval_tap $? 372 'AdminListAssignedUsersV4' test.out

#- 373 AdminAssignUserToRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAssignUserToRoleV4 \
    --roleId 'kdYbwUho' \
    --body '{"assignedNamespaces": ["2tTskO3S", "hIonMvi5", "GSLfqoxS"], "namespace": "OUIzpt0M", "userId": "vnwg0JR3"}' \
    > test.out 2>&1
eval_tap $? 373 'AdminAssignUserToRoleV4' test.out

#- 374 AdminRevokeUserFromRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRevokeUserFromRoleV4 \
    --roleId 'DcfvMsjm' \
    --body '{"namespace": "ZOIIi0b3", "userId": "LylU8Ium"}' \
    > test.out 2>&1
eval_tap $? 374 'AdminRevokeUserFromRoleV4' test.out

#- 375 AdminInviteUserNewV4
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserNewV4 \
    --body '{"assignedNamespaces": ["dc8TAtBN", "LnEPLzpU", "0VOBGOf5"], "emailAddresses": ["lumvxhFh", "8yqttETK", "8emPtfS4"], "isAdmin": false, "isNewStudio": false, "languageTag": "zJkCmRCs", "namespace": "vi31a3oO", "roleId": "LJWhzKO2"}' \
    > test.out 2>&1
eval_tap $? 375 'AdminInviteUserNewV4' test.out

#- 376 AdminUpdateMyUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateMyUserV4 \
    --body '{"avatarUrl": "ExQYXWfK", "country": "SVFROyOt", "dateOfBirth": "gFpm03ME", "displayName": "r3qPrOtc", "languageTag": "tANuK4G8", "skipLoginQueue": false, "tags": ["63jmRYGf", "XGDLqBHR", "ky0IcG51"], "uniqueDisplayName": "rGPtl5mj", "userName": "sjFzPAcA"}' \
    > test.out 2>&1
eval_tap $? 376 'AdminUpdateMyUserV4' test.out

#- 377 AdminDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyAuthenticatorV4 \
    --body '{"factor": "NCdoIf5b", "mfaToken": "I6kXdfq1"}' \
    > test.out 2>&1
eval_tap $? 377 'AdminDisableMyAuthenticatorV4' test.out

#- 378 AdminEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyAuthenticatorV4 \
    --code 'FuxF9Hhl' \
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
    --body '{"factor": "oyKpQCgO", "mfaToken": "c0gmV7bV"}' \
    > test.out 2>&1
eval_tap $? 382 'AdminDisableMyBackupCodesV4' test.out

#- 383 AdminDownloadMyBackupCodesV4
eval_tap 0 383 'AdminDownloadMyBackupCodesV4 # SKIP deprecated' test.out

#- 384 AdminEnableMyBackupCodesV4
eval_tap 0 384 'AdminEnableMyBackupCodesV4 # SKIP deprecated' test.out

#- 385 AdminGetBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBackupCodesV4 \
    --languageTag 'PjGKaE2s' \
    > test.out 2>&1
eval_tap $? 385 'AdminGetBackupCodesV4' test.out

#- 386 AdminGenerateBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateBackupCodesV4 \
    --languageTag 'ChUsnqm2' \
    > test.out 2>&1
eval_tap $? 386 'AdminGenerateBackupCodesV4' test.out

#- 387 AdminEnableBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableBackupCodesV4 \
    --languageTag 'gtchQEoM' \
    > test.out 2>&1
eval_tap $? 387 'AdminEnableBackupCodesV4' test.out

#- 388 AdminChallengeMyMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminChallengeMyMFAV4 \
    --code 'lAgJ6uYO' \
    --factor '385chGLV' \
    > test.out 2>&1
eval_tap $? 388 'AdminChallengeMyMFAV4' test.out

#- 389 AdminSendMyMFAEmailCodeV4
./ng net.accelbyte.sdk.cli.Main iam adminSendMyMFAEmailCodeV4 \
    --action 'WzlsnZgB' \
    --languageTag 'HHeXfhw1' \
    > test.out 2>&1
eval_tap $? 389 'AdminSendMyMFAEmailCodeV4' test.out

#- 390 AdminDisableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyEmailV4 \
    --body '{"factor": "S4nAY19r", "mfaToken": "xughgdyJ"}' \
    > test.out 2>&1
eval_tap $? 390 'AdminDisableMyEmailV4' test.out

#- 391 AdminEnableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyEmailV4 \
    --code 'ChW5dTTA' \
    > test.out 2>&1
eval_tap $? 391 'AdminEnableMyEmailV4' test.out

#- 392 AdminGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyEnabledFactorsV4 \
    > test.out 2>&1
eval_tap $? 392 'AdminGetMyEnabledFactorsV4' test.out

#- 393 AdminMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam adminMakeFactorMyDefaultV4 \
    --factor 'yWI8KJ0z' \
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
    --clientId '1MpBg9yT' \
    --linkingToken 'S3gNqiTL' \
    --password 'NPjXAyd3' \
    --username 'aZDHJ7u7' \
    > test.out 2>&1
eval_tap $? 397 'AuthenticationWithPlatformLinkV4' test.out

#- 398 GenerateTokenByNewHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV4 \
    --additionalData 'QSEbBr9K' \
    --extendExp  \
    --linkingToken 'bXOXfEZB' \
    > test.out 2>&1
eval_tap $? 398 'GenerateTokenByNewHeadlessAccountV4' test.out

#- 399 Verify2faCodeV4
./ng net.accelbyte.sdk.cli.Main iam verify2faCodeV4 \
    --code 'vg3hxSsB' \
    --factor 'GwHX3pnb' \
    --mfaToken 'gryes5vs' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 399 'Verify2faCodeV4' test.out

#- 400 PlatformTokenGrantV4
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV4 \
    --platformId 'EQWt3pLr' \
    --codeChallenge 't8h2Ks6R' \
    --codeChallengeMethod 'S256' \
    --additionalData 'upknlDPA' \
    --clientId '91dKCwvM' \
    --createHeadless  \
    --deviceId 'v2ox3h9L' \
    --macAddress 'fvDscZ5C' \
    --platformToken 'GekhhXJg' \
    --serviceLabel '0.02539753900567454' \
    --skipSetCookie  \
    > test.out 2>&1
eval_tap $? 400 'PlatformTokenGrantV4' test.out

#- 401 SimultaneousLoginV4
./ng net.accelbyte.sdk.cli.Main iam simultaneousLoginV4 \
    --codeChallenge 'Lv6358D2' \
    --codeChallengeMethod 'plain' \
    --simultaneousPlatform 'h4mrOsay' \
    --simultaneousTicket 'LHODiorW' \
    --nativePlatform 'steam' \
    --nativePlatformTicket 'IbhnR0HH' \
    > test.out 2>&1
eval_tap $? 401 'SimultaneousLoginV4' test.out

#- 402 TokenGrantV4
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV4 \
    --codeChallenge '9708nRkV' \
    --codeChallengeMethod 'S256' \
    --additionalData 'PqpeCGCe' \
    --clientId 'QwijvYeW' \
    --clientSecret 'ztyh6OcT' \
    --code 'iB5kUrUD' \
    --codeVerifier '8z1oiar9' \
    --extendNamespace 'vJ48VBxj' \
    --extendExp  \
    --loginQueueTicket '5gDHcF2J' \
    --password 'oPYvyVCw' \
    --redirectUri 'PWn7JhY4' \
    --refreshToken 'KExsa89E' \
    --scope '2QzAGr1Z' \
    --username 'n09bzb3T' \
    --grantType 'client_credentials' \
    > test.out 2>&1
eval_tap $? 402 'TokenGrantV4' test.out

#- 403 RequestTargetTokenResponseV4
./ng net.accelbyte.sdk.cli.Main iam requestTargetTokenResponseV4 \
    --additionalData 'dpJr4bP2' \
    --code 'u34WPvIv' \
    > test.out 2>&1
eval_tap $? 403 'RequestTargetTokenResponseV4' test.out

#- 404 PublicListUserIDByPlatformUserIDsV4
./ng net.accelbyte.sdk.cli.Main iam publicListUserIDByPlatformUserIDsV4 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'q9TsrrVY' \
    --rawPUID  \
    --body '{"pidType": "jRdPFpBm", "platformUserIds": ["aKwXbVlM", "xylDVC0i", "bILePTIP"]}' \
    > test.out 2>&1
eval_tap $? 404 'PublicListUserIDByPlatformUserIDsV4' test.out

#- 405 PublicGetUserByPlatformUserIDV4
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByPlatformUserIDV4 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'rYDhSxQ3' \
    --platformUserId 'Bne70GKg' \
    > test.out 2>&1
eval_tap $? 405 'PublicGetUserByPlatformUserIDV4' test.out

#- 406 PublicCreateTestUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateTestUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "vvEpsqf1", "policyId": "lQ94M8TN", "policyVersionId": "uoTfWEcj"}, {"isAccepted": true, "localizedPolicyVersionId": "XJalJJjo", "policyId": "2T4ksHyD", "policyVersionId": "zPjszuJl"}, {"isAccepted": true, "localizedPolicyVersionId": "7t5veLBn", "policyId": "MBzdSZQC", "policyVersionId": "yiTevhmF"}], "authType": "EMAILPASSWD", "country": "BjRzvnXv", "dateOfBirth": "iVi0Afje", "displayName": "G145HIqh", "emailAddress": "NnLG7JHO", "password": "fIWk4djd", "passwordMD5Sum": "Q9HOF53a", "uniqueDisplayName": "xllHQRLk", "username": "YkLXuBSW", "verified": false}' \
    > test.out 2>&1
eval_tap $? 406 'PublicCreateTestUserV4' test.out

#- 407 PublicCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "p01jHakj", "policyId": "WDhnr6xn", "policyVersionId": "t4sTotGS"}, {"isAccepted": false, "localizedPolicyVersionId": "uzpPKp0U", "policyId": "UA3M03Pe", "policyVersionId": "akr7qtn0"}, {"isAccepted": true, "localizedPolicyVersionId": "1rWUUGLr", "policyId": "31mTPcoY", "policyVersionId": "xFEfSO2N"}], "authType": "EMAILPASSWD", "code": "jfKCYmkH", "country": "XLlANG15", "dateOfBirth": "Zsif0Md6", "displayName": "AXkNXhBN", "emailAddress": "xlvHfYWU", "password": "pTpJkIpt", "passwordMD5Sum": "L3TxNtdJ", "reachMinimumAge": true, "uniqueDisplayName": "ZCq372jv", "username": "AbGS9kRN"}' \
    > test.out 2>&1
eval_tap $? 407 'PublicCreateUserV4' test.out

#- 408 CreateUserFromInvitationV4
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV4 \
    --invitationId '27GZpgdH' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "FG6wFurJ", "policyId": "US9zMT2p", "policyVersionId": "pAwkXmBE"}, {"isAccepted": false, "localizedPolicyVersionId": "o1wJEZis", "policyId": "2w3A934y", "policyVersionId": "SZbaA0ht"}, {"isAccepted": false, "localizedPolicyVersionId": "dEeXeMAV", "policyId": "rYl8b0ZY", "policyVersionId": "kr2Vx356"}], "authType": "EMAILPASSWD", "code": "qB5AYiIL", "country": "qgXHIXUJ", "dateOfBirth": "MQ2I5aZV", "displayName": "GvljgreV", "emailAddress": "ygxXYD8t", "password": "TqwtMcy3", "passwordMD5Sum": "6OEVvUnt", "reachMinimumAge": false, "uniqueDisplayName": "lhxJyseu", "username": "HrVv4Eip"}' \
    > test.out 2>&1
eval_tap $? 408 'CreateUserFromInvitationV4' test.out

#- 409 PublicUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "F5K0TuEW", "country": "ckhtgiuU", "dateOfBirth": "2uaAE6XC", "displayName": "HaKxuW9n", "languageTag": "OaofSi4q", "uniqueDisplayName": "Np6Z8810", "userName": "fgB3iFTT"}' \
    > test.out 2>&1
eval_tap $? 409 'PublicUpdateUserV4' test.out

#- 410 PublicUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "DfcFUs55", "emailAddress": "CMFQfpJb"}' \
    > test.out 2>&1
eval_tap $? 410 'PublicUpdateUserEmailAddressV4' test.out

#- 411 PublicUpgradeHeadlessAccountWithVerificationCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountWithVerificationCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "EYG7kbfr", "country": "UJFOKQGj", "dateOfBirth": "s0fljsyx", "displayName": "Ucog5inh", "emailAddress": "rbHBxYHd", "password": "xOF2yew4", "reachMinimumAge": false, "uniqueDisplayName": "qSxe1gqq", "username": "d2kKRKAg", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 411 'PublicUpgradeHeadlessAccountWithVerificationCodeV4' test.out

#- 412 PublicUpgradeHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"dateOfBirth": "bKs1mw6u", "displayName": "RtOvQSEm", "emailAddress": "rtalLs71", "password": "lApJhzm0", "uniqueDisplayName": "QvQf1NW2", "username": "MNzmIhYf"}' \
    > test.out 2>&1
eval_tap $? 412 'PublicUpgradeHeadlessAccountV4' test.out

#- 413 PublicDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"factor": "EH8mU6NN", "mfaToken": "Aslwz0iA"}' \
    > test.out 2>&1
eval_tap $? 413 'PublicDisableMyAuthenticatorV4' test.out

#- 414 PublicEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'GYyi2Ymv' \
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
    --body '{"factor": "4nd2g1XD", "mfaToken": "ziKkz7f9"}' \
    > test.out 2>&1
eval_tap $? 418 'PublicDisableMyBackupCodesV4' test.out

#- 419 PublicDownloadMyBackupCodesV4
eval_tap 0 419 'PublicDownloadMyBackupCodesV4 # SKIP deprecated' test.out

#- 420 PublicEnableMyBackupCodesV4
eval_tap 0 420 'PublicEnableMyBackupCodesV4 # SKIP deprecated' test.out

#- 421 PublicGetBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGetBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --languageTag '48jdTMo2' \
    > test.out 2>&1
eval_tap $? 421 'PublicGetBackupCodesV4' test.out

#- 422 PublicGenerateBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --languageTag 'BvfkClNY' \
    > test.out 2>&1
eval_tap $? 422 'PublicGenerateBackupCodesV4' test.out

#- 423 PublicEnableBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --languageTag 'DSQNOT5I' \
    > test.out 2>&1
eval_tap $? 423 'PublicEnableBackupCodesV4' test.out

#- 424 PublicChallengeMyMFAV4
./ng net.accelbyte.sdk.cli.Main iam publicChallengeMyMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'ZEYoOleY' \
    --factor 'bhTORbGZ' \
    > test.out 2>&1
eval_tap $? 424 'PublicChallengeMyMFAV4' test.out

#- 425 PublicRemoveTrustedDeviceV4
./ng net.accelbyte.sdk.cli.Main iam publicRemoveTrustedDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceToken 'Pc5kKAUo' \
    > test.out 2>&1
eval_tap $? 425 'PublicRemoveTrustedDeviceV4' test.out

#- 426 PublicSendMyMFAEmailCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicSendMyMFAEmailCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --action '7QGi1ybK' \
    --languageTag 'I99yhsFe' \
    > test.out 2>&1
eval_tap $? 426 'PublicSendMyMFAEmailCodeV4' test.out

#- 427 PublicDisableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyEmailV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"factor": "ThLO6qsA", "mfaToken": "ofdWKDFK"}' \
    > test.out 2>&1
eval_tap $? 427 'PublicDisableMyEmailV4' test.out

#- 428 PublicEnableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyEmailV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'Ftc1kRq2' \
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
    --factor 'kIQ72rx6' \
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
    --userId 'LVevEOeH' \
    > test.out 2>&1
eval_tap $? 433 'PublicGetUserPublicInfoByUserIdV4' test.out

#- 434 PublicInviteUserV4
./ng net.accelbyte.sdk.cli.Main iam publicInviteUserV4 \
    --body '{"additionalData": "518YEEu2", "emailAddress": "2zXOkRim", "languageTag": "BZTFhuLV", "namespace": "7FUh6QYg", "namespaceDisplayName": "IYDOV1CA"}' \
    > test.out 2>&1
eval_tap $? 434 'PublicInviteUserV4' test.out

#- 435 PublicUpgradeHeadlessWithCodeV4Forward
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessWithCodeV4Forward \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "GpIjvqXb", "policyId": "bxOreLvp", "policyVersionId": "hiqYEJVc"}, {"isAccepted": false, "localizedPolicyVersionId": "gDrJDbPn", "policyId": "k82qYfnY", "policyVersionId": "59o0ndbk"}, {"isAccepted": false, "localizedPolicyVersionId": "BO6NtaW5", "policyId": "rYiBzmQA", "policyVersionId": "tzj4Yw9J"}], "code": "693b6oEq", "country": "ISJv4BM9", "dateOfBirth": "Zy78mp6W", "displayName": "B53xrkQ7", "emailAddress": "IWs3xkwG", "password": "T35ffLTj", "reachMinimumAge": false, "uniqueDisplayName": "edV44TTw", "username": "dXYhijiX", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 435 'PublicUpgradeHeadlessWithCodeV4Forward' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
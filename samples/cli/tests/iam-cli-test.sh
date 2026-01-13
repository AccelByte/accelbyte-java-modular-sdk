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
    --body '{"modules": [{"docLink": "l9HYNxLv", "groups": [{"group": "H4LAUKmY", "groupId": "BLp4vsji", "permissions": [{"allowedActions": [48, 59, 99], "resource": "qIKoSMI0"}, {"allowedActions": [54, 13, 41], "resource": "Cx2S4rZa"}, {"allowedActions": [83, 85, 50], "resource": "BrGNeIyD"}]}, {"group": "N65wfNuU", "groupId": "Ez5I0wIn", "permissions": [{"allowedActions": [89, 47, 52], "resource": "x0W4xDzs"}, {"allowedActions": [23, 39, 94], "resource": "M0CC8Tf6"}, {"allowedActions": [81, 78, 83], "resource": "OGgEvcV1"}]}, {"group": "Yw65oHea", "groupId": "XQaxRoeH", "permissions": [{"allowedActions": [99, 26, 19], "resource": "4o8QK98p"}, {"allowedActions": [79, 7, 53], "resource": "iN19PPj0"}, {"allowedActions": [2, 40, 90], "resource": "0xSGoW4O"}]}], "module": "0tlrMlBr", "moduleId": "yBILCXQn"}, {"docLink": "BOeub3mr", "groups": [{"group": "TihskYkY", "groupId": "u6MRM7v3", "permissions": [{"allowedActions": [68, 32, 54], "resource": "0UyaRluL"}, {"allowedActions": [12, 20, 90], "resource": "eCgt6w6c"}, {"allowedActions": [62, 30, 63], "resource": "xE0CPbPu"}]}, {"group": "iyrVMwYF", "groupId": "PuLBrnRw", "permissions": [{"allowedActions": [76, 93, 53], "resource": "nkKbDf01"}, {"allowedActions": [52, 33, 51], "resource": "Wnmk6Wjj"}, {"allowedActions": [68, 85, 37], "resource": "usP9PWdf"}]}, {"group": "rXelrhDF", "groupId": "1ADanoe8", "permissions": [{"allowedActions": [58, 64, 47], "resource": "eHh8Q6J5"}, {"allowedActions": [19, 16, 39], "resource": "lEn7lR1G"}, {"allowedActions": [24, 59, 98], "resource": "HtNl5XNl"}]}], "module": "EyR6HXHG", "moduleId": "tbmyFraT"}, {"docLink": "lwBS9z49", "groups": [{"group": "XptNgCtV", "groupId": "8Sb8CzVo", "permissions": [{"allowedActions": [70, 68, 23], "resource": "o7jn6pYy"}, {"allowedActions": [35, 28, 0], "resource": "jsxmYZjC"}, {"allowedActions": [72, 18, 68], "resource": "TPar7sd5"}]}, {"group": "OaUQOktE", "groupId": "bfvcihdL", "permissions": [{"allowedActions": [63, 62, 86], "resource": "L8p2aFlW"}, {"allowedActions": [93, 5, 38], "resource": "Gqh7Esrh"}, {"allowedActions": [82, 19, 34], "resource": "bQxGpP4y"}]}, {"group": "0MLkLrFo", "groupId": "b6dIFXBp", "permissions": [{"allowedActions": [58, 99, 91], "resource": "Pv1hfzHz"}, {"allowedActions": [0, 93, 40], "resource": "kCaa6yqc"}, {"allowedActions": [48, 39, 96], "resource": "kz7S1pPU"}]}], "module": "Uw6qM5YR", "moduleId": "oJEw1afi"}]}' \
    > test.out 2>&1
eval_tap $? 109 'AdminUpdateAvailablePermissionsByModule' test.out

#- 110 AdminDeleteConfigPermissionsByGroup
./ng net.accelbyte.sdk.cli.Main iam adminDeleteConfigPermissionsByGroup \
    --forceDelete  \
    --body '{"groupId": "oGC6hqlS", "moduleId": "TmDSmRzi"}' \
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
    --body '[{"field": "qrxILLSF", "validation": {"allowAllSpecialCharacters": true, "allowDigit": true, "allowLetter": false, "allowSpace": false, "allowUnicode": true, "avatarConfig": {"allowedPrefixes": ["SkOR6PWu", "Ykuedp1b", "w8PFbGYA"], "preferRegex": true, "regex": "MNJ4OOA6"}, "blockedWord": ["0ADp2Fg9", "J6vUBbJ4", "R8lzYmEx"], "description": [{"language": "V6uSTaTH", "message": ["oKGy6sN7", "Wz3X6cp8", "BkfvcjEo"]}, {"language": "0x8g472m", "message": ["7vQDtjJs", "Ao1HQSXj", "N4B4dTFh"]}, {"language": "TiFIY7us", "message": ["JrwG4EPk", "nFMQlrWO", "QQDrS0IG"]}], "isCustomRegex": true, "letterCase": "7IjbTt5Y", "maxLength": 13, "maxRepeatingAlphaNum": 40, "maxRepeatingSpecialCharacter": 86, "minCharType": 62, "minLength": 88, "profanityFilter": "Zrha8syy", "regex": "GDFEkgG6", "specialCharacterLocation": "rNfAGMVI", "specialCharacters": ["SnEELPcA", "UL5ijR9v", "bJX8wo9H"]}}, {"field": "yg4je7ih", "validation": {"allowAllSpecialCharacters": true, "allowDigit": false, "allowLetter": false, "allowSpace": true, "allowUnicode": false, "avatarConfig": {"allowedPrefixes": ["PYnTwW6o", "XBozwrNF", "2z5OlDxg"], "preferRegex": true, "regex": "uadTmUvl"}, "blockedWord": ["dUYbPoTE", "JC9uJGZa", "7xIs1al3"], "description": [{"language": "hXYc89bf", "message": ["82qB7Yh0", "XipZUq2C", "hn4naWAe"]}, {"language": "RIIFKa6v", "message": ["wzUcwpx9", "YduIhXaw", "ynWOCB2k"]}, {"language": "tFqR1nmV", "message": ["XqlunpoG", "mTD7e3eI", "X7dNNqs4"]}], "isCustomRegex": true, "letterCase": "1bZlPf2k", "maxLength": 70, "maxRepeatingAlphaNum": 78, "maxRepeatingSpecialCharacter": 28, "minCharType": 99, "minLength": 90, "profanityFilter": "G5TMNVXV", "regex": "96MCYor5", "specialCharacterLocation": "WHKlDVRX", "specialCharacters": ["O3ZZ05fR", "ANDmI5wX", "lZjWjI05"]}}, {"field": "TzvgUWPj", "validation": {"allowAllSpecialCharacters": true, "allowDigit": false, "allowLetter": true, "allowSpace": false, "allowUnicode": true, "avatarConfig": {"allowedPrefixes": ["MZaaIFK8", "0GEj7trv", "Rd1fgQiW"], "preferRegex": true, "regex": "gD7SAvFN"}, "blockedWord": ["fe7vwMIj", "cOgIQ7CF", "sJH30p2i"], "description": [{"language": "TDHbjfNj", "message": ["BRa3QVSq", "rBMu6VUL", "Q895gjM1"]}, {"language": "ZLo9sBvh", "message": ["aUhTmeq8", "US8YbCR3", "Bd6Xt7pV"]}, {"language": "YRfWHRoj", "message": ["bNAhfu7X", "8HjSPNw6", "SiBnh2vu"]}], "isCustomRegex": false, "letterCase": "LvHw6wFb", "maxLength": 57, "maxRepeatingAlphaNum": 76, "maxRepeatingSpecialCharacter": 98, "minCharType": 58, "minLength": 82, "profanityFilter": "gpIE4HHU", "regex": "wKkrbmdJ", "specialCharacterLocation": "8uS4bwJ6", "specialCharacters": ["mtc979sI", "9qFD0SOT", "0Osu5azL"]}}]' \
    > test.out 2>&1
eval_tap $? 113 'AdminUpdateInputValidations' test.out

#- 114 AdminResetInputValidations
./ng net.accelbyte.sdk.cli.Main iam adminResetInputValidations \
    --field 'wECkb5Z0' \
    > test.out 2>&1
eval_tap $? 114 'AdminResetInputValidations' test.out

#- 115 ListAdminsV3
./ng net.accelbyte.sdk.cli.Main iam listAdminsV3 \
    --namespace "$AB_NAMESPACE" \
    --after 'uKidIr9E' \
    --before 'sr6k8XDH' \
    --endDate '4ZhwgTH9' \
    --limit '23' \
    --query 'qDLMO8fj' \
    --roleId 'uv3Yt3vQ' \
    --startDate 'Lr3pvJgR' \
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
    --body '{"ageRestriction": 36, "enable": false}' \
    > test.out 2>&1
eval_tap $? 117 'AdminUpdateAgeRestrictionConfigV3' test.out

#- 118 AdminGetListCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminGetListCountryAgeRestrictionV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 118 'AdminGetListCountryAgeRestrictionV3' test.out

#- 119 AdminUpdateCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateCountryAgeRestrictionV3 \
    --countryCode '26w4W2f6' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ageRestriction": 58}' \
    > test.out 2>&1
eval_tap $? 119 'AdminUpdateCountryAgeRestrictionV3' test.out

#- 120 AdminGetBannedUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType 's4jesyBd' \
    --limit '30' \
    --offset '24' \
    > test.out 2>&1
eval_tap $? 120 'AdminGetBannedUsersV3' test.out

#- 121 AdminBanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"ban": "yH3cMcFT", "comment": "hUoFAeIp", "endDate": "DWbnLHfS", "reason": "qG2OZP8m", "skipNotif": true, "userIds": ["1nbddx83", "Lq13FiFQ", "JGqvLZOM"]}' \
    > test.out 2>&1
eval_tap $? 121 'AdminBanUserBulkV3' test.out

#- 122 AdminUnbanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminUnbanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"bans": [{"banId": "7Lb1yZj5", "userId": "mQp0q0I0"}, {"banId": "GGoke1cP", "userId": "qQUKhJHu"}, {"banId": "XMxyM5rM", "userId": "yj3jyEIP"}]}' \
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
    --clientId '724TGAEm' \
    --clientName 'JH9kDeCw' \
    --clientType '5KkVSTWI' \
    --limit '96' \
    --offset '82' \
    --skipLoginQueue  \
    > test.out 2>&1
eval_tap $? 124 'AdminGetClientsByNamespaceV3' test.out

#- 125 AdminBulkUpdateClientsV3
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateClientsV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientIds": ["6WDZIjsI", "0NvZ8K3E", "QGe3m4E5"], "clientUpdateRequest": {"audiences": ["xMMR47BI", "hiDeQoPr", "pZvq2kGN"], "baseUri": "KnR8GbfD", "clientName": "plIP4ZZ6", "clientPermissions": [{"action": 71, "resource": "O6QaLRQ8", "schedAction": 35, "schedCron": "kgpU5VWc", "schedRange": ["t1GT0bE0", "ScauPAgJ", "iIS9Nwer"]}, {"action": 74, "resource": "vj5V6NkH", "schedAction": 46, "schedCron": "5I1EXgSI", "schedRange": ["vSMApeg7", "YMN67b6H", "pPdDy5LH"]}, {"action": 30, "resource": "0N0AniE5", "schedAction": 46, "schedCron": "Nztxd26U", "schedRange": ["d9dMQTbm", "JA91Ugwf", "F4AYkqLe"]}], "clientPlatform": "YrSFrUmn", "deletable": true, "description": "kkwOWFma", "modulePermissions": [{"moduleId": "HjyqHz71", "selectedGroups": [{"groupId": "PXoF46aA", "selectedActions": [11, 25, 97]}, {"groupId": "idg2Ipin", "selectedActions": [52, 28, 53]}, {"groupId": "gdGWvRPP", "selectedActions": [73, 92, 83]}]}, {"moduleId": "8kf1Ef4D", "selectedGroups": [{"groupId": "6Jydm7vv", "selectedActions": [48, 89, 73]}, {"groupId": "iR213jdc", "selectedActions": [29, 31, 4]}, {"groupId": "8mD1EVz3", "selectedActions": [17, 67, 30]}]}, {"moduleId": "wW4FYpYM", "selectedGroups": [{"groupId": "hlJkDtl1", "selectedActions": [46, 32, 55]}, {"groupId": "rOTczv0x", "selectedActions": [86, 33, 14]}, {"groupId": "5nWZuRMS", "selectedActions": [53, 27, 43]}]}], "namespace": "r13deWhU", "oauthAccessTokenExpiration": 65, "oauthAccessTokenExpirationTimeUnit": "ZBHhZFtn", "oauthRefreshTokenExpiration": 78, "oauthRefreshTokenExpirationTimeUnit": "qxjNdQUD", "redirectUri": "vVf7uyxc", "scopes": ["X232qiNV", "nVyP1pj1", "8qUjosUr"], "skipLoginQueue": false, "twoFactorEnabled": true}}' \
    > test.out 2>&1
eval_tap $? 125 'AdminBulkUpdateClientsV3' test.out

#- 126 AdminCreateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateClientV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["XkMzDh5E", "md4CR27t", "NhXuA3H4"], "baseUri": "QVMQZCTp", "clientId": "eww8PBJF", "clientName": "282tc0en", "clientPermissions": [{"action": 54, "resource": "aTm7P51x", "schedAction": 20, "schedCron": "IZa90tXU", "schedRange": ["deNhqrW1", "X3ofSPUb", "e2hridrJ"]}, {"action": 60, "resource": "v9VzvtGg", "schedAction": 35, "schedCron": "Vn1h9WNH", "schedRange": ["hzeoRz5j", "kpJFK1dP", "XkWbzbEV"]}, {"action": 83, "resource": "SmKPT7fR", "schedAction": 24, "schedCron": "VzvidNmC", "schedRange": ["kBo4W8Fy", "RXd0so94", "nutjvNJ8"]}], "clientPlatform": "7KnKowxX", "deletable": false, "description": "z6B1Xxm7", "modulePermissions": [{"moduleId": "1dqlbHvF", "selectedGroups": [{"groupId": "jmrEwxN6", "selectedActions": [74, 17, 99]}, {"groupId": "mklhrzfQ", "selectedActions": [10, 49, 43]}, {"groupId": "5ZSO0sim", "selectedActions": [49, 44, 67]}]}, {"moduleId": "YUvm36rS", "selectedGroups": [{"groupId": "r5QtXU5c", "selectedActions": [39, 47, 70]}, {"groupId": "W2HWYQ2J", "selectedActions": [13, 43, 100]}, {"groupId": "lWkVyK5e", "selectedActions": [98, 53, 88]}]}, {"moduleId": "fESe27VC", "selectedGroups": [{"groupId": "NbMBl7qn", "selectedActions": [82, 43, 7]}, {"groupId": "rEtkMJRb", "selectedActions": [54, 9, 0]}, {"groupId": "WCgMfVon", "selectedActions": [56, 36, 2]}]}], "namespace": "nDFrqegT", "oauthAccessTokenExpiration": 47, "oauthAccessTokenExpirationTimeUnit": "2VwJvOaX", "oauthClientType": "uM4Yx53w", "oauthRefreshTokenExpiration": 73, "oauthRefreshTokenExpirationTimeUnit": "B80GMND0", "parentNamespace": "eKYRNN8w", "redirectUri": "jmmsSfwh", "scopes": ["fzDRlckD", "syFVwsuL", "DBkjSka6"], "secret": "KFC1QyGJ", "skipLoginQueue": false, "twoFactorEnabled": false}' \
    > test.out 2>&1
eval_tap $? 126 'AdminCreateClientV3' test.out

#- 127 AdminGetClientsbyNamespacebyIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetClientsbyNamespacebyIDV3 \
    --clientId 'xM6KqJuf' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 127 'AdminGetClientsbyNamespacebyIDV3' test.out

#- 128 AdminDeleteClientV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientV3 \
    --clientId 'd4rgOBJ9' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 128 'AdminDeleteClientV3' test.out

#- 129 AdminUpdateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientV3 \
    --clientId 'iO8Ovs7G' \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["4S3FtCbJ", "Ft9BWmLw", "Gb4JtR1O"], "baseUri": "c6F7MZbS", "clientName": "xrD9iBzi", "clientPermissions": [{"action": 19, "resource": "5SsGfrXZ", "schedAction": 100, "schedCron": "N9ID7q7U", "schedRange": ["mQDBqSc1", "qgwxaeq5", "EkIrwvL9"]}, {"action": 22, "resource": "suT87h81", "schedAction": 66, "schedCron": "H3xbxzCe", "schedRange": ["CWvVMiyZ", "aZIA4m7l", "PWjyaAP9"]}, {"action": 15, "resource": "qyUjH8SN", "schedAction": 83, "schedCron": "4KyYRujt", "schedRange": ["lKnlVxte", "HVyrzfAJ", "9pX1304o"]}], "clientPlatform": "ZInp8rVT", "deletable": false, "description": "gt7qw4QA", "modulePermissions": [{"moduleId": "fnKkKOd0", "selectedGroups": [{"groupId": "SAbyWLUb", "selectedActions": [37, 70, 73]}, {"groupId": "hcPH6b6X", "selectedActions": [88, 19, 80]}, {"groupId": "FCzfJByF", "selectedActions": [45, 79, 25]}]}, {"moduleId": "dJf8f86C", "selectedGroups": [{"groupId": "tnmrBoW6", "selectedActions": [62, 73, 18]}, {"groupId": "9qjCGvm8", "selectedActions": [85, 75, 87]}, {"groupId": "6t8jwI1d", "selectedActions": [68, 29, 51]}]}, {"moduleId": "HBsbCqpk", "selectedGroups": [{"groupId": "cInwkrwa", "selectedActions": [67, 80, 18]}, {"groupId": "FtcMvGP7", "selectedActions": [21, 6, 18]}, {"groupId": "4y9qRGEn", "selectedActions": [30, 5, 78]}]}], "namespace": "sV2Vp0QJ", "oauthAccessTokenExpiration": 60, "oauthAccessTokenExpirationTimeUnit": "R6ObokAX", "oauthRefreshTokenExpiration": 21, "oauthRefreshTokenExpirationTimeUnit": "wXOVABU3", "redirectUri": "FNmIZMMO", "scopes": ["Xg7qWFAu", "rj8q7yR6", "4CWbLHXO"], "skipLoginQueue": true, "twoFactorEnabled": false}' \
    > test.out 2>&1
eval_tap $? 129 'AdminUpdateClientV3' test.out

#- 130 AdminUpdateClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientPermissionV3 \
    --clientId 'iEYZcA5r' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 41, "resource": "X8dwUZb7"}, {"action": 2, "resource": "1szSa3up"}, {"action": 49, "resource": "IJ7mztlk"}]}' \
    > test.out 2>&1
eval_tap $? 130 'AdminUpdateClientPermissionV3' test.out

#- 131 AdminAddClientPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddClientPermissionsV3 \
    --clientId 'zpo35yHs' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 18, "resource": "ETfcxzDD"}, {"action": 74, "resource": "q9t1rPDN"}, {"action": 44, "resource": "jstHEcYa"}]}' \
    > test.out 2>&1
eval_tap $? 131 'AdminAddClientPermissionsV3' test.out

#- 132 AdminDeleteClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientPermissionV3 \
    --action '22' \
    --clientId 'drzWVtY7' \
    --namespace "$AB_NAMESPACE" \
    --resource 'kLUPn8Co' \
    > test.out 2>&1
eval_tap $? 132 'AdminDeleteClientPermissionV3' test.out

#- 133 AdminGetConfigValueV3
./ng net.accelbyte.sdk.cli.Main iam adminGetConfigValueV3 \
    --configKey 'TtEhJ3mI' \
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
    --body '{"blacklist": ["xw9aHwLL", "nwYh5VhP", "7SnwH70m"]}' \
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
    --body '{"active": true, "roleIds": ["u0wErCoj", "F12gPZyg", "kOdny9UD"]}' \
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
    --limit '68' \
    --offset '67' \
    > test.out 2>&1
eval_tap $? 141 'RetrieveAllSSOLoginPlatformCredentialV3' test.out

#- 142 RetrieveThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'GVMhXsZv' \
    > test.out 2>&1
eval_tap $? 142 'RetrieveThirdPartyLoginPlatformCredentialV3' test.out

#- 143 AddThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam addThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'MDuE2Gd0' \
    --body '{"ACSURL": "RRBMz7Pn", "AWSCognitoRegion": "T3BzIGM5", "AWSCognitoUserPool": "J1uxcEeB", "AllowedClients": ["BsdjQL3Z", "PBP4hy2i", "h2VAoABI"], "AppId": "Bt6tsYbe", "AuthorizationEndpoint": "L1JxBEsC", "ClientId": "yhHiJz5Q", "EmptyStrFieldList": ["Sn8TS5JT", "Zw2Uuddg", "proT6P4I"], "EnableServerLicenseValidation": false, "Environment": "ljOXD5Hx", "FederationMetadataURL": "VsnVOtpJ", "GenericOauthFlow": false, "IncludePUID": false, "IsActive": true, "Issuer": "O7kfWVa0", "JWKSEndpoint": "o9HikZn9", "KeyID": "G5ob4Kiy", "LogoURL": "0OKxrdSu", "NetflixCertificates": {"encryptedPrivateKey": "JWYlpBJb", "encryptedPrivateKeyName": "KIfj4Kl5", "publicCertificate": "84qcc6Rf", "publicCertificateName": "UpSPCom7", "rootCertificate": "ho9s3RGb", "rootCertificateName": "Xjg7fv6j"}, "OrganizationId": "UnqI2ZR9", "PlatformName": "61lhqye6", "PrivateKey": "fbWiOPA6", "RedirectUri": "kfLjYqal", "RegisteredDomains": [{"affectedClientIDs": ["MPIBx3zZ", "MQQIPKrq", "2yC5pRpE"], "domain": "N1N3PkvE", "namespaces": ["HOmbGB4n", "u7qoXzx1", "SotpQ16L"], "roleId": "2QjUkxvV", "ssoCfg": {"googleKey": {"RJN5mZ4E": {}, "jyIYMMAk": {}, "3WmdsAxi": {}}, "groupConfigs": [{"assignNamespaces": ["kEj48Gyt", "YCf6EmDu", "uoQ7YwOR"], "group": "OLafKDrY", "roleId": "jm7IqGJr"}, {"assignNamespaces": ["njF0CVOz", "d4Ea3WOk", "riaLSv23"], "group": "ewbwbq84", "roleId": "zeWuBFOv"}, {"assignNamespaces": ["1Y8Q4XnG", "Mv8BILWS", "iHf7G7GP"], "group": "hGhx13GO", "roleId": "Pgr4XRKv"}]}}, {"affectedClientIDs": ["S5L90ifI", "h0x49c4V", "VnhjzwjQ"], "domain": "CIDXuTqZ", "namespaces": ["KbRluA3P", "hooFKzeZ", "P5jMMtTS"], "roleId": "Ym68LMCd", "ssoCfg": {"googleKey": {"eWeAM8al": {}, "jllu4Kvu": {}, "sv4vii8U": {}}, "groupConfigs": [{"assignNamespaces": ["5Ekitbfn", "OwqOZUcA", "t4e0sIVx"], "group": "Z8snhipE", "roleId": "KtysNbHK"}, {"assignNamespaces": ["myW7aygg", "ESrrrx8v", "Ix0uC0tk"], "group": "LPeAM7dY", "roleId": "0AJX3NWn"}, {"assignNamespaces": ["hzc3UpIJ", "X0zFnEdB", "bliGxLFN"], "group": "1OPqaDVu", "roleId": "UqN1UxOz"}]}}, {"affectedClientIDs": ["IaNj8sjK", "jfL90mxJ", "6MrpLxAF"], "domain": "GIVBEVVn", "namespaces": ["j1XU9WXV", "AWS5MNgN", "B2XqnLHS"], "roleId": "CYpGaI4V", "ssoCfg": {"googleKey": {"02Ug0u5v": {}, "dbmX1Ug8": {}, "B6ubBrp3": {}}, "groupConfigs": [{"assignNamespaces": ["zFStitmH", "3XvxnV7E", "3Bd720mj"], "group": "DWr5vxay", "roleId": "pLv8FRV8"}, {"assignNamespaces": ["DhWt4fQi", "7EWVtTPG", "4EyNFlwb"], "group": "dfJAfpLT", "roleId": "fozkhQ2a"}, {"assignNamespaces": ["UKcnuPrG", "53pogJ3Z", "XWzekny7"], "group": "u1KizDQP", "roleId": "4fmvVHiy"}]}}], "RelyingParty": "AtBxhuC3", "SandboxId": "di5Sg2Un", "Secret": "p4ET8DDf", "TeamID": "HhY2bSWc", "TokenAuthenticationType": "TOca10Gh", "TokenClaimsMapping": {"t6pqnsDI": "pzzCE3wF", "6cbO2UfA": "TpUjqBYt", "TpujE4D4": "GII454lU"}, "TokenEndpoint": "FY7aJm1P", "UserInfoEndpoint": "Qn2CmdNI", "UserInfoHTTPMethod": "i155mxwe", "googleAdminConsoleKey": "lBHOTpig", "scopes": ["HROgVvoF", "FuxCxtCq", "cXomYPvs"]}' \
    > test.out 2>&1
eval_tap $? 143 'AddThirdPartyLoginPlatformCredentialV3' test.out

#- 144 DeleteThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Mxts3Y5z' \
    > test.out 2>&1
eval_tap $? 144 'DeleteThirdPartyLoginPlatformCredentialV3' test.out

#- 145 UpdateThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'dYWAN3NL' \
    --body '{"ACSURL": "ov2214t7", "AWSCognitoRegion": "uTIyofxw", "AWSCognitoUserPool": "cfItjKBu", "AllowedClients": ["0cdDL9XC", "g8QZfQOP", "EHVSiRyy"], "AppId": "jHwouoUB", "AuthorizationEndpoint": "OCiJ6A1x", "ClientId": "giJ7ZEis", "EmptyStrFieldList": ["AtdZjntc", "gPLHRN1X", "z164tXWK"], "EnableServerLicenseValidation": true, "Environment": "i2moKXUv", "FederationMetadataURL": "HR8Ts0e3", "GenericOauthFlow": false, "IncludePUID": false, "IsActive": false, "Issuer": "NXY9qCol", "JWKSEndpoint": "4eqYZ6Pq", "KeyID": "uoyEnEYa", "LogoURL": "CwbFHeyj", "NetflixCertificates": {"encryptedPrivateKey": "KDdUmO98", "encryptedPrivateKeyName": "fRJGaiDM", "publicCertificate": "K7fPCKVq", "publicCertificateName": "FqeyeOx2", "rootCertificate": "zlfcLeFv", "rootCertificateName": "3PXicEWp"}, "OrganizationId": "CT1XLgXy", "PlatformName": "1Kj1lfjS", "PrivateKey": "KAWO6uKj", "RedirectUri": "H6zQADZY", "RegisteredDomains": [{"affectedClientIDs": ["ktUafYuG", "xXuLh05P", "EczeRt3e"], "domain": "zNezlREw", "namespaces": ["tM28JtsJ", "LtMAk9I3", "9LtKJ1Z0"], "roleId": "8oZlDJES", "ssoCfg": {"googleKey": {"60mM6FkW": {}, "hbiIW4WR": {}, "0sXqZNFi": {}}, "groupConfigs": [{"assignNamespaces": ["oXROiO0B", "RKQiCKMV", "64cPtDCs"], "group": "3zjtNTit", "roleId": "PlLdDuX0"}, {"assignNamespaces": ["Ee2A2z3z", "kF3egE0a", "rdxx4EEt"], "group": "HtqZdddA", "roleId": "RU5gsQLM"}, {"assignNamespaces": ["BcDNXLPy", "hDyviNLB", "9rrugmGG"], "group": "695d5RpL", "roleId": "Uf8YzdQU"}]}}, {"affectedClientIDs": ["W1zvbAEo", "1jFBGgaY", "mVSWzrT7"], "domain": "qb0fue4T", "namespaces": ["2CcUkFnF", "Zu583BX1", "iqog8ULG"], "roleId": "18QcF8GS", "ssoCfg": {"googleKey": {"gOUxx51R": {}, "iTW6PT40": {}, "GjZyev5o": {}}, "groupConfigs": [{"assignNamespaces": ["jI6YOiUt", "y4prknC3", "GGY0yw85"], "group": "090qI92Z", "roleId": "bOG6NK9Z"}, {"assignNamespaces": ["ze7LQLu6", "KAtFKvwD", "O3NSXAvw"], "group": "pMl9Gi6Q", "roleId": "2tJGuE7l"}, {"assignNamespaces": ["L7kyTafE", "6Lq5zw22", "iIifG7Pf"], "group": "RMy6zD68", "roleId": "08IaIz9W"}]}}, {"affectedClientIDs": ["UZwlQuYz", "3yLnsE8d", "Zf7Bjrl7"], "domain": "kqPUyhZt", "namespaces": ["opw06IFO", "SLYGaYUf", "woyKfJyv"], "roleId": "FNqWeLTE", "ssoCfg": {"googleKey": {"5h515gpe": {}, "XAj4MJ3k": {}, "93cNE3Cq": {}}, "groupConfigs": [{"assignNamespaces": ["IDKVC9bo", "jrATT5lF", "WZCv7gYi"], "group": "yupvZcoS", "roleId": "gTv1rGpO"}, {"assignNamespaces": ["GcuMUU7k", "t7jBYBUg", "APaQpIyB"], "group": "KRgRkYqJ", "roleId": "klVtIHze"}, {"assignNamespaces": ["QRXHPIwF", "KoLU9cXK", "FXLw1lHV"], "group": "FIVwEOfI", "roleId": "OV1ToOei"}]}}], "RelyingParty": "uSXA2b0U", "SandboxId": "v6jfasQo", "Secret": "tx73OEh7", "TeamID": "qaFhCWHL", "TokenAuthenticationType": "YDi9Fvwg", "TokenClaimsMapping": {"VRNYXNP8": "afM5282O", "xF5KZnyB": "eUNlscW4", "deZ7r8XK": "sCU6hRQ8"}, "TokenEndpoint": "qUY7NCTT", "UserInfoEndpoint": "vCOBfiat", "UserInfoHTTPMethod": "qEZLrhvF", "googleAdminConsoleKey": "YKxc6yzZ", "scopes": ["gB4MPsNH", "8p9OOVy7", "5oOUx3T5"]}' \
    > test.out 2>&1
eval_tap $? 145 'UpdateThirdPartyLoginPlatformCredentialV3' test.out

#- 146 UpdateThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '38uVo13g' \
    --body '{"affectedClientIDs": ["p8ZdgvDu", "gtxRherv", "zgqv1fNq"], "assignedNamespaces": ["xBrnbbbm", "J2iijzyA", "OS5313zb"], "domain": "sEvbz6Ti", "roleId": "BKbMDakX", "ssoCfg": {"googleKey": {"accpZk3v": {}, "lswbLtKM": {}, "MvEk3Laj": {}}, "groupConfigs": [{"assignNamespaces": ["jhw8W2Gp", "ol7DjKQc", "1ULPdLv3"], "group": "Nb1cK0Pu", "roleId": "TLjkvgPV"}, {"assignNamespaces": ["fPwDydl8", "Frd8oxwM", "G0P5ariw"], "group": "TrZ1ajIh", "roleId": "ZmYDuyg3"}, {"assignNamespaces": ["cg5ISksP", "s10C5Wef", "2h6DMuXp"], "group": "ZvbkIw9r", "roleId": "rwdLYVm4"}]}}' \
    > test.out 2>&1
eval_tap $? 146 'UpdateThirdPartyLoginPlatformDomainV3' test.out

#- 147 DeleteThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'QfRpxDLe' \
    --body '{"domain": "mIFgQjSB", "ssoGroups": ["LklPiqrv", "MjuPVgTc", "slNsa7HD"]}' \
    > test.out 2>&1
eval_tap $? 147 'DeleteThirdPartyLoginPlatformDomainV3' test.out

#- 148 PartialUpdateThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam partialUpdateThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '67b9QkFs' \
    --body '{"affectedClientIDs": ["pjtC1inF", "ZUsW8NSn", "HoVupTdl"], "assignedNamespaces": ["0ay0sopW", "wQFwHBrM", "aY5wWmYu"], "domain": "QVc3lLKz", "roleId": "lN8rZVMr", "ssoCfg": {"googleKey": {"8PUnHPHC": {}, "kS0BKJAA": {}, "CAfKCKDA": {}}, "groupConfigs": [{"assignNamespaces": ["pGG71Mmm", "7XweDFjb", "svSXfQVe"], "group": "iMYrrHsa", "roleId": "ZNvLepO3"}, {"assignNamespaces": ["AqtdItLp", "msjmb2Vo", "Z6WCvHYn"], "group": "AixW7x6M", "roleId": "JDOpjWXn"}, {"assignNamespaces": ["cJv5BQKy", "5w38roJH", "a80uyHxS"], "group": "G0RloJTW", "roleId": "by7pFWi8"}]}}' \
    > test.out 2>&1
eval_tap $? 148 'PartialUpdateThirdPartyLoginPlatformDomainV3' test.out

#- 149 RetrieveSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam retrieveSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'do9NtzeC' \
    > test.out 2>&1
eval_tap $? 149 'RetrieveSSOLoginPlatformCredential' test.out

#- 150 AddSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam addSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'ceqDx5Em' \
    --body '{"acsUrl": "v8lOTMd5", "apiKey": "yNrDWHrp", "appId": "QPnFdqoU", "federationMetadataUrl": "BC2nqWWK", "isActive": true, "redirectUri": "m6Zp4FmO", "secret": "dXMEZ4jG", "ssoUrl": "jzy6lW7N"}' \
    > test.out 2>&1
eval_tap $? 150 'AddSSOLoginPlatformCredential' test.out

#- 151 DeleteSSOLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteSSOLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'wmWb7mSw' \
    > test.out 2>&1
eval_tap $? 151 'DeleteSSOLoginPlatformCredentialV3' test.out

#- 152 UpdateSSOPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam updateSSOPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'ZYaiY6Ti' \
    --body '{"acsUrl": "YdmtEcfk", "apiKey": "Du2iMmn1", "appId": "jT4XxQeF", "federationMetadataUrl": "0DgiyR8x", "isActive": true, "redirectUri": "B45XBiYC", "secret": "cFdz57pN", "ssoUrl": "vmyMCi57"}' \
    > test.out 2>&1
eval_tap $? 152 'UpdateSSOPlatformCredential' test.out

#- 153 AdminListUserIDByPlatformUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByPlatformUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'wbjEdP2j' \
    --rawPID  \
    --rawPUID  \
    --body '{"platformUserIds": ["RYKoInDA", "ijbyfftj", "fu6cXfX7"]}' \
    > test.out 2>&1
eval_tap $? 153 'AdminListUserIDByPlatformUserIDsV3' test.out

#- 154 AdminGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'BUcXgmmm' \
    --platformUserId 'GVwvXHLS' \
    --pidType 'L4foFuKW' \
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
    --field 'dob' \
    --body '{"config": {"minimumAllowedInterval": 7}, "type": "VAisNd1R"}' \
    > test.out 2>&1
eval_tap $? 156 'AdminUpdateProfileUpdateStrategyV3' test.out

#- 157 AdminGetRoleOverrideConfigV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleOverrideConfigV3 \
    --namespace "$AB_NAMESPACE" \
    --identity 'USER' \
    > test.out 2>&1
eval_tap $? 157 'AdminGetRoleOverrideConfigV3' test.out

#- 158 AdminUpdateRoleOverrideConfigV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleOverrideConfigV3 \
    --namespace "$AB_NAMESPACE" \
    --identity 'USER' \
    --body '{"additions": [{"actions": [38, 37, 97], "resource": "8IvDsn5c"}, {"actions": [55, 71, 70], "resource": "gP9lt4Pc"}, {"actions": [92, 60, 7], "resource": "7ETr14Zx"}], "exclusions": [{"actions": [87, 84, 51], "resource": "CJeh1lTc"}, {"actions": [64, 82, 95], "resource": "1OL6cGRx"}, {"actions": [89, 98, 76], "resource": "idkiidC1"}], "overrides": [{"actions": [5, 95, 65], "resource": "yG3UVV6M"}, {"actions": [45, 0, 47], "resource": "yyjZchOG"}, {"actions": [5, 77, 60], "resource": "UcfoVNZb"}], "replacements": [{"replacement": {"actions": [70, 22, 22], "resource": "y4MJJKex"}, "target": "Lvt6ownt"}, {"replacement": {"actions": [15, 94, 81], "resource": "xDnq9vFA"}, "target": "aOaAUWzO"}, {"replacement": {"actions": [7, 88, 30], "resource": "MKhyR6i1"}, "target": "DmCS4NpU"}]}' \
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
    --identity 'USER' \
    --body '{"active": false}' \
    > test.out 2>&1
eval_tap $? 160 'AdminChangeRoleOverrideConfigStatusV3' test.out

#- 161 AdminGetRoleNamespacePermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleNamespacePermissionV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'uCDC8zdA' \
    > test.out 2>&1
eval_tap $? 161 'AdminGetRoleNamespacePermissionV3' test.out

#- 162 GetAdminUsersByRoleIdV3
./ng net.accelbyte.sdk.cli.Main iam getAdminUsersByRoleIdV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'nWemiqmF' \
    --after '69' \
    --before '99' \
    --limit '34' \
    > test.out 2>&1
eval_tap $? 162 'GetAdminUsersByRoleIdV3' test.out

#- 163 AdminQueryTagV3
./ng net.accelbyte.sdk.cli.Main iam adminQueryTagV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '61' \
    --offset '22' \
    --tagName 'C0Tf0sLJ' \
    > test.out 2>&1
eval_tap $? 163 'AdminQueryTagV3' test.out

#- 164 AdminCreateTagV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateTagV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"tagName": "0iUafeE3"}' \
    > test.out 2>&1
eval_tap $? 164 'AdminCreateTagV3' test.out

#- 165 AdminUpdateTagV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateTagV3 \
    --namespace "$AB_NAMESPACE" \
    --tagId 'maRaF0y4' \
    --body '{"tagName": "kwiGV27q"}' \
    > test.out 2>&1
eval_tap $? 165 'AdminUpdateTagV3' test.out

#- 166 AdminDeleteTagV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteTagV3 \
    --namespace "$AB_NAMESPACE" \
    --tagId 'Yn4Mbrxf' \
    > test.out 2>&1
eval_tap $? 166 'AdminDeleteTagV3' test.out

#- 167 AdminGetUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --emailAddress 'YyVjBGqy' \
    > test.out 2>&1
eval_tap $? 167 'AdminGetUserByEmailAddressV3' test.out

#- 168 AdminBulkUpdateUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"updateRequest": {"skipLoginQueue": true}, "userIds": ["A34SYPtt", "q5veLrKO", "vcXhiMCY"]}' \
    > test.out 2>&1
eval_tap $? 168 'AdminBulkUpdateUsersV3' test.out

#- 169 AdminGetBulkUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType '1wY1nFCq' \
    --body '{"bulkUserId": ["RJiebD8N", "Re3sbbl2", "D9XXIEQ1"]}' \
    > test.out 2>&1
eval_tap $? 169 'AdminGetBulkUserBanV3' test.out

#- 170 AdminListUserIDByUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"findByPublisherNamespace": true, "userIds": ["9WOCmDTK", "NYreaLyT", "zfStz8pB"]}' \
    > test.out 2>&1
eval_tap $? 170 'AdminListUserIDByUserIDsV3' test.out

#- 171 AdminBulkGetUsersPlatform
./ng net.accelbyte.sdk.cli.Main iam adminBulkGetUsersPlatform \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["TI1lEMws", "XFzEbCYw", "ZpggqTg6"]}' \
    > test.out 2>&1
eval_tap $? 171 'AdminBulkGetUsersPlatform' test.out

#- 172 AdminCursorGetUserV3
./ng net.accelbyte.sdk.cli.Main iam adminCursorGetUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"cursor": {"cursorTime": "XArPE5Hd", "userId": "eCPsLQAv"}, "fields": ["TVu1pkre", "eRd5MkmG", "gFqfv05n"], "limit": 81}' \
    > test.out 2>&1
eval_tap $? 172 'AdminCursorGetUserV3' test.out

#- 173 AdminInviteUserV3
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddresses": ["dUTerjpU", "81NQ0csk", "m5umIuzj"], "isAdmin": true, "languageTag": "kCaH59BS", "namespace": "KJlNIvto", "roles": ["1CxIIGRa", "RokzAQRI", "WpalZ6w2"]}' \
    > test.out 2>&1
eval_tap $? 173 'AdminInviteUserV3' test.out

#- 174 AdminQueryThirdPlatformLinkHistoryV3
./ng net.accelbyte.sdk.cli.Main iam adminQueryThirdPlatformLinkHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '70' \
    --offset '39' \
    --platformUserId 'k3FAkHKg' \
    --platformId '4HXbkOpu' \
    > test.out 2>&1
eval_tap $? 174 'AdminQueryThirdPlatformLinkHistoryV3' test.out

#- 175 AdminListUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminListUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '87' \
    --offset '12' \
    > test.out 2>&1
eval_tap $? 175 'AdminListUsersV3' test.out

#- 176 AdminSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam adminSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'OFk0LkVz' \
    --endDate 'TwAT1NwH' \
    --includeTotal  \
    --limit '37' \
    --offset '54' \
    --platformBy 'kb9DIdxs' \
    --platformId 'VNfUtR2A' \
    --query 'EwnxanPb' \
    --roleIds 'RMnhJZdZ' \
    --selectedFields 'fID85WHJ' \
    --skipLoginQueue  \
    --startDate 'bGiV9rDf' \
    --tagIds 'a5zKa1ix' \
    --testAccount  \
    > test.out 2>&1
eval_tap $? 176 'AdminSearchUserV3' test.out

#- 177 AdminGetBulkUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"listEmailAddressRequest": ["NsdHfz2h", "7byJkEOi", "JCA7ylNu"]}' \
    > test.out 2>&1
eval_tap $? 177 'AdminGetBulkUserByEmailAddressV3' test.out

#- 178 AdminGetUserByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'w0xGvTFe' \
    > test.out 2>&1
eval_tap $? 178 'AdminGetUserByUserIdV3' test.out

#- 179 AdminUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'oBjM6K6P' \
    --body '{"avatarUrl": "cOVHi7bL", "country": "uTkUkN99", "dateOfBirth": "CRQc3lNL", "displayName": "VLsVLRHf", "languageTag": "wptSrl5k", "skipLoginQueue": true, "tags": ["VvPqQ5Sc", "zIUiTZMm", "E8GjOkXX"], "uniqueDisplayName": "7IVYzYyS", "userName": "1As9zIM3"}' \
    > test.out 2>&1
eval_tap $? 179 'AdminUpdateUserV3' test.out

#- 180 AdminGetUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'vZQBbouU' \
    --activeOnly  \
    --after 'Ct6DX2tc' \
    --before '1M59ywxJ' \
    --limit '2' \
    > test.out 2>&1
eval_tap $? 180 'AdminGetUserBanV3' test.out

#- 181 AdminBanUserV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'DCNQo60H' \
    --body '{"ban": "Uu3vLdDY", "comment": "mlEZ8uxA", "endDate": "iquLfPX7", "reason": "u8xukoYJ", "skipNotif": true}' \
    > test.out 2>&1
eval_tap $? 181 'AdminBanUserV3' test.out

#- 182 AdminGetUserBanSummaryV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanSummaryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'GW9lLKmp' \
    > test.out 2>&1
eval_tap $? 182 'AdminGetUserBanSummaryV3' test.out

#- 183 AdminUpdateUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserBanV3 \
    --banId 'qsNUpXL3' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZXlWaLBR' \
    --body '{"enabled": true, "skipNotif": false}' \
    > test.out 2>&1
eval_tap $? 183 'AdminUpdateUserBanV3' test.out

#- 184 AdminSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'jj1uBYb1' \
    --body '{"context": "iw88Si25", "emailAddress": "hsCvq6cx", "languageTag": "NhjkQUfF", "upgradeToken": "aS9GujYU"}' \
    > test.out 2>&1
eval_tap $? 184 'AdminSendVerificationCodeV3' test.out

#- 185 AdminVerifyAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'mNgjFopb' \
    --body '{"Code": "i4vJDP4h", "ContactType": "phkFwlYl", "LanguageTag": "IAIPdLZi", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 185 'AdminVerifyAccountV3' test.out

#- 186 GetUserVerificationCode
./ng net.accelbyte.sdk.cli.Main iam getUserVerificationCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'Mzw3EYb1' \
    > test.out 2>&1
eval_tap $? 186 'GetUserVerificationCode' test.out

#- 187 AdminGetUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'vAbmrEAE' \
    > test.out 2>&1
eval_tap $? 187 'AdminGetUserDeletionStatusV3' test.out

#- 188 AdminUpdateUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'HDeLOcH2' \
    --body '{"deletionDate": 15, "enabled": false}' \
    > test.out 2>&1
eval_tap $? 188 'AdminUpdateUserDeletionStatusV3' test.out

#- 189 AdminListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Qh2DFiaE' \
    > test.out 2>&1
eval_tap $? 189 'AdminListUserAllPlatformAccountsDistinctV3' test.out

#- 190 AdminUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '8LeS31nf' \
    --body '{"code": "rgkpTyyh", "country": "B4s4HJQW", "dateOfBirth": "oEHOlQXG", "displayName": "yuBgz774", "emailAddress": "4dbUmUPN", "password": "IiXMZAhV", "uniqueDisplayName": "7D1nYyAr", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 190 'AdminUpgradeHeadlessAccountV3' test.out

#- 191 AdminDeleteUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '7RVsyIVL' \
    > test.out 2>&1
eval_tap $? 191 'AdminDeleteUserInformationV3' test.out

#- 192 AdminGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'oQdWsfia' \
    --after '0.03976424357686259' \
    --before '0.42164701681356453' \
    --limit '45' \
    > test.out 2>&1
eval_tap $? 192 'AdminGetUserLoginHistoriesV3' test.out

#- 193 AdminResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam adminResetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'WXauSOOf' \
    --body '{"languageTag": "Ge9c9oar", "mfaToken": "9WT16K4p", "newPassword": "hR9aGELM", "oldPassword": "tih3OtEK"}' \
    > test.out 2>&1
eval_tap $? 193 'AdminResetPasswordV3' test.out

#- 194 AdminUpdateUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserPermissionV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'GgmwX999' \
    --body '{"Permissions": [{"Action": 2, "Resource": "3yU9OCP7", "SchedAction": 54, "SchedCron": "FtjCFczp", "SchedRange": ["rJeBViZ7", "aFcUpAxT", "ZL09Xswk"]}, {"Action": 26, "Resource": "uYFqNcCe", "SchedAction": 70, "SchedCron": "57bdEGZN", "SchedRange": ["OUUUGAvB", "0ImmRvzL", "sC2vMWj6"]}, {"Action": 68, "Resource": "2FBwtrFu", "SchedAction": 30, "SchedCron": "Coj2i61u", "SchedRange": ["4jdfuupK", "JEvaIZ4x", "Z4QGIgFf"]}]}' \
    > test.out 2>&1
eval_tap $? 194 'AdminUpdateUserPermissionV3' test.out

#- 195 AdminAddUserPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserPermissionsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '1rW77l6q' \
    --body '{"Permissions": [{"Action": 75, "Resource": "dAtOxg7n", "SchedAction": 42, "SchedCron": "SUAWCYoq", "SchedRange": ["bw2tnpdR", "as2qE6Ys", "2FGuybza"]}, {"Action": 41, "Resource": "X8alwAQB", "SchedAction": 55, "SchedCron": "x1BdLDMT", "SchedRange": ["aI2B7YTk", "BTY2IP7n", "QmzQBARE"]}, {"Action": 20, "Resource": "9t4cL9TL", "SchedAction": 42, "SchedCron": "4VGwBGWI", "SchedRange": ["d8Hn45QP", "jiKgf8pu", "Hlrn2lNt"]}]}' \
    > test.out 2>&1
eval_tap $? 195 'AdminAddUserPermissionsV3' test.out

#- 196 AdminDeleteUserPermissionBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'YVHox7em' \
    --body '[{"Action": 70, "Resource": "7lh1Sw1L"}, {"Action": 47, "Resource": "Uo7rgzyV"}, {"Action": 88, "Resource": "rlH7Rqhg"}]' \
    > test.out 2>&1
eval_tap $? 196 'AdminDeleteUserPermissionBulkV3' test.out

#- 197 AdminDeleteUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionV3 \
    --action '61' \
    --namespace "$AB_NAMESPACE" \
    --resource 'gJI2ZQa9' \
    --userId 'g8cK4U9m' \
    > test.out 2>&1
eval_tap $? 197 'AdminDeleteUserPermissionV3' test.out

#- 198 AdminGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'j2AOHb4z' \
    --after '09aKJ6xP' \
    --before 'kIPGkNqr' \
    --limit '65' \
    --platformId 'Juki7dw2' \
    --targetNamespace 'C69yUE5N' \
    > test.out 2>&1
eval_tap $? 198 'AdminGetUserPlatformAccountsV3' test.out

#- 199 AdminListAllDistinctPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminListAllDistinctPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'tkHuKFFf' \
    --status 'VtGZOvwT' \
    > test.out 2>&1
eval_tap $? 199 'AdminListAllDistinctPlatformAccountsV3' test.out

#- 200 AdminGetListJusticePlatformAccounts
./ng net.accelbyte.sdk.cli.Main iam adminGetListJusticePlatformAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId '96fHpdaH' \
    > test.out 2>&1
eval_tap $? 200 'AdminGetListJusticePlatformAccounts' test.out

#- 201 AdminGetUserMapping
./ng net.accelbyte.sdk.cli.Main iam adminGetUserMapping \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace '8VpN6T1C' \
    --userId 'ckWROAvw' \
    --createIfNotFound  \
    > test.out 2>&1
eval_tap $? 201 'AdminGetUserMapping' test.out

#- 202 AdminCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam adminCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'UIvinU1H' \
    --userId 'XqWrT80X' \
    > test.out 2>&1
eval_tap $? 202 'AdminCreateJusticeUser' test.out

#- 203 AdminLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId '0llN0mIV' \
    --skipConflict  \
    --body '{"platformId": "3mtGtPrT", "platformUserId": "Y5TM6htx"}' \
    > test.out 2>&1
eval_tap $? 203 'AdminLinkPlatformAccount' test.out

#- 204 AdminGetUserLinkHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLinkHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '58DLYSUn' \
    --platformId 'KgPwWW1T' \
    > test.out 2>&1
eval_tap $? 204 'AdminGetUserLinkHistoriesV3' test.out

#- 205 AdminPlatformUnlinkV3
eval_tap 0 205 'AdminPlatformUnlinkV3 # SKIP deprecated' test.out

#- 206 AdminPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'iw3jLVo2' \
    --userId '1aix3vO0' \
    > test.out 2>&1
eval_tap $? 206 'AdminPlatformUnlinkAllV3' test.out

#- 207 AdminPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'AdWMqsKK' \
    --userId 'ddzqAb8u' \
    --ticket 'knN2z5KS' \
    > test.out 2>&1
eval_tap $? 207 'AdminPlatformLinkV3' test.out

#- 208 AdminDeleteUserLinkingHistoryByPlatformIDV3
eval_tap 0 208 'AdminDeleteUserLinkingHistoryByPlatformIDV3 # SKIP deprecated' test.out

#- 209 AdminDeleteUserLinkingRestrictionByPlatformIDV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserLinkingRestrictionByPlatformIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'MMCKCkyH' \
    --userId 'Ss3mSATU' \
    > test.out 2>&1
eval_tap $? 209 'AdminDeleteUserLinkingRestrictionByPlatformIDV3' test.out

#- 210 AdminGetThirdPartyPlatformTokenLinkStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetThirdPartyPlatformTokenLinkStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'klBOMZaP' \
    --userId 'AWZGpROB' \
    --platformToken 'drx8OrIU' \
    > test.out 2>&1
eval_tap $? 210 'AdminGetThirdPartyPlatformTokenLinkStatusV3' test.out

#- 211 AdminGetUserSinglePlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminGetUserSinglePlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --platformId 'GF2OxJOp' \
    --userId 'yFYyTW5B' \
    --crossNamespace  \
    > test.out 2>&1
eval_tap $? 211 'AdminGetUserSinglePlatformAccount' test.out

#- 212 AdminDeleteUserRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRolesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'mmtPQtch' \
    --body '["p3bTmkzG", "Y8Y5Jz5f", "itEzQSkc"]' \
    > test.out 2>&1
eval_tap $? 212 'AdminDeleteUserRolesV3' test.out

#- 213 AdminSaveUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminSaveUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'TLyt82TG' \
    --body '[{"namespace": "YD5Mt15y", "roleId": "qZe1eUYc"}, {"namespace": "h1dyiDFP", "roleId": "fsDtofAo"}, {"namespace": "Tl6YZHrP", "roleId": "4GSxFoT5"}]' \
    > test.out 2>&1
eval_tap $? 213 'AdminSaveUserRoleV3' test.out

#- 214 AdminAddUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'SGDw0n8r' \
    --userId 'cQZlE7eK' \
    > test.out 2>&1
eval_tap $? 214 'AdminAddUserRoleV3' test.out

#- 215 AdminDeleteUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'ev5LcyDf' \
    --userId 'VNjPVT3o' \
    > test.out 2>&1
eval_tap $? 215 'AdminDeleteUserRoleV3' test.out

#- 216 AdminGetUserStateByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserStateByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'tV319fTV' \
    > test.out 2>&1
eval_tap $? 216 'AdminGetUserStateByUserIdV3' test.out

#- 217 AdminUpdateUserStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '0Wrn9mXp' \
    --body '{"enabled": false, "reason": "Em2udPnV"}' \
    > test.out 2>&1
eval_tap $? 217 'AdminUpdateUserStatusV3' test.out

#- 218 AdminTrustlyUpdateUserIdentity
./ng net.accelbyte.sdk.cli.Main iam adminTrustlyUpdateUserIdentity \
    --namespace "$AB_NAMESPACE" \
    --userId 'QtgYC1qQ' \
    --body '{"emailAddress": "up35FkYi", "password": "2HmdsFTp"}' \
    > test.out 2>&1
eval_tap $? 218 'AdminTrustlyUpdateUserIdentity' test.out

#- 219 AdminVerifyUserWithoutVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyUserWithoutVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '6AJkmL96' \
    > test.out 2>&1
eval_tap $? 219 'AdminVerifyUserWithoutVerificationCodeV3' test.out

#- 220 AdminUpdateClientSecretV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientSecretV3 \
    --clientId 'LjlrTmwy' \
    --namespace "$AB_NAMESPACE" \
    --body '{"newSecret": "tEPfs1xE"}' \
    > test.out 2>&1
eval_tap $? 220 'AdminUpdateClientSecretV3' test.out

#- 221 AdminCheckThirdPartyLoginPlatformAvailabilityV3
./ng net.accelbyte.sdk.cli.Main iam adminCheckThirdPartyLoginPlatformAvailabilityV3 \
    --platformId '8KWEBSlM' \
    > test.out 2>&1
eval_tap $? 221 'AdminCheckThirdPartyLoginPlatformAvailabilityV3' test.out

#- 222 AdminGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV3 \
    --after 'GnJU2aL2' \
    --before 'qhSQ5955' \
    --isWildcard  \
    --limit '76' \
    > test.out 2>&1
eval_tap $? 222 'AdminGetRolesV3' test.out

#- 223 AdminCreateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV3 \
    --body '{"adminRole": true, "deletable": false, "isWildcard": false, "managers": [{"displayName": "pVTY8NHp", "namespace": "XHuV85ES", "userId": "9PdCs6S7"}, {"displayName": "R8yLYQDr", "namespace": "JmZBuSRa", "userId": "WXEdoqqU"}, {"displayName": "feDjjRRJ", "namespace": "vNd1FFEN", "userId": "EzgjdYcs"}], "members": [{"displayName": "7sxBhM4S", "namespace": "0K6xMAt7", "userId": "Eynyjjkj"}, {"displayName": "scKFbkGN", "namespace": "uBpQaoMc", "userId": "QP46E4kE"}, {"displayName": "C8JGD8S3", "namespace": "xtVpeQuN", "userId": "V6PCV8C4"}], "permissions": [{"action": 62, "resource": "W0QZWZfn", "schedAction": 16, "schedCron": "53UEf9Ht", "schedRange": ["Hh4OVBw0", "3SGl4TQW", "kwSZ9tAN"]}, {"action": 73, "resource": "qXu1WZHu", "schedAction": 88, "schedCron": "nwMgbN0h", "schedRange": ["zKgDuBVk", "9elP1MOW", "zo7SmpmW"]}, {"action": 93, "resource": "S4anguia", "schedAction": 0, "schedCron": "zca2uBe4", "schedRange": ["6c90h2bx", "s8NHlyRx", "2kydN5u5"]}], "roleName": "dn5wnNaZ"}' \
    > test.out 2>&1
eval_tap $? 223 'AdminCreateRoleV3' test.out

#- 224 AdminGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV3 \
    --roleId 'd9cC3h0g' \
    > test.out 2>&1
eval_tap $? 224 'AdminGetRoleV3' test.out

#- 225 AdminDeleteRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV3 \
    --roleId 'GyBB3qY3' \
    > test.out 2>&1
eval_tap $? 225 'AdminDeleteRoleV3' test.out

#- 226 AdminUpdateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV3 \
    --roleId 'OQnIzMEY' \
    --body '{"deletable": false, "isWildcard": false, "roleName": "Yql1imG5"}' \
    > test.out 2>&1
eval_tap $? 226 'AdminUpdateRoleV3' test.out

#- 227 AdminGetRoleAdminStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleAdminStatusV3 \
    --roleId 'APWFn75W' \
    > test.out 2>&1
eval_tap $? 227 'AdminGetRoleAdminStatusV3' test.out

#- 228 AdminUpdateAdminRoleStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateAdminRoleStatusV3 \
    --roleId 'MzatWbVw' \
    > test.out 2>&1
eval_tap $? 228 'AdminUpdateAdminRoleStatusV3' test.out

#- 229 AdminRemoveRoleAdminV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleAdminV3 \
    --roleId 'zLQHyjDn' \
    > test.out 2>&1
eval_tap $? 229 'AdminRemoveRoleAdminV3' test.out

#- 230 AdminGetRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleManagersV3 \
    --roleId 'Ap5NChNy' \
    --after 'CuvGsYGN' \
    --before '7aSyJtOf' \
    --limit '45' \
    > test.out 2>&1
eval_tap $? 230 'AdminGetRoleManagersV3' test.out

#- 231 AdminAddRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleManagersV3 \
    --roleId 'vHXFBPzM' \
    --body '{"managers": [{"displayName": "76RP25zN", "namespace": "iv01ugoM", "userId": "co34GQut"}, {"displayName": "htqPKQYS", "namespace": "Py7bSa3h", "userId": "IACOrtGE"}, {"displayName": "hFESz62x", "namespace": "Vtbysjz4", "userId": "DroGuWYX"}]}' \
    > test.out 2>&1
eval_tap $? 231 'AdminAddRoleManagersV3' test.out

#- 232 AdminRemoveRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleManagersV3 \
    --roleId 'IsIIuib6' \
    --body '{"managers": [{"displayName": "qZGWeQFJ", "namespace": "ZHgmRG3z", "userId": "44zzA9SW"}, {"displayName": "PJe2EGvU", "namespace": "OOXPXUhb", "userId": "WpwJDjti"}, {"displayName": "YQDmR5SX", "namespace": "ZB3NltSP", "userId": "ekFRHlRU"}]}' \
    > test.out 2>&1
eval_tap $? 232 'AdminRemoveRoleManagersV3' test.out

#- 233 AdminGetRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleMembersV3 \
    --roleId 'EuZwwiGF' \
    --after 'yb1NMCaO' \
    --before '3NrXKl1Y' \
    --limit '41' \
    > test.out 2>&1
eval_tap $? 233 'AdminGetRoleMembersV3' test.out

#- 234 AdminAddRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleMembersV3 \
    --roleId 'qrTeM1Vt' \
    --body '{"members": [{"displayName": "pX1v3Lx2", "namespace": "XHVCbVkT", "userId": "JBh5CyBa"}, {"displayName": "GiEimupg", "namespace": "gTmZ39Jr", "userId": "AVVWQJRs"}, {"displayName": "i6tUYHUq", "namespace": "XZjugVCB", "userId": "RDIArOQv"}]}' \
    > test.out 2>&1
eval_tap $? 234 'AdminAddRoleMembersV3' test.out

#- 235 AdminRemoveRoleMembersV3
eval_tap 0 235 'AdminRemoveRoleMembersV3 # SKIP deprecated' test.out

#- 236 AdminUpdateRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV3 \
    --roleId '9wARtMXv' \
    --body '{"permissions": [{"action": 77, "resource": "v5uofizX", "schedAction": 97, "schedCron": "wwxgn6Ub", "schedRange": ["xHsLk90x", "W6ZtzsRT", "Rvf16i6Q"]}, {"action": 5, "resource": "10q9aCxd", "schedAction": 76, "schedCron": "9u79pVYs", "schedRange": ["qnmWfS4v", "h0OsAUX6", "7NPmWT3S"]}, {"action": 76, "resource": "Nc1CuPZQ", "schedAction": 57, "schedCron": "VuEoI8Eo", "schedRange": ["0ktnQPj0", "0PlGA9vi", "RWqImknK"]}]}' \
    > test.out 2>&1
eval_tap $? 236 'AdminUpdateRolePermissionsV3' test.out

#- 237 AdminAddRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV3 \
    --roleId 'doo7BlCm' \
    --body '{"permissions": [{"action": 31, "resource": "Bdq0SjfK", "schedAction": 25, "schedCron": "ej9ETguf", "schedRange": ["dP44xqMu", "bW4KRdbd", "Pld7SEYj"]}, {"action": 82, "resource": "uPlvNddQ", "schedAction": 31, "schedCron": "QH49xbkc", "schedRange": ["wQTxmkXU", "ZVvcFD2z", "hMmhvldM"]}, {"action": 30, "resource": "UaxDKbDE", "schedAction": 26, "schedCron": "FM8jWKte", "schedRange": ["Ki9KOU6U", "kSCXW9iv", "mCeVL3SC"]}]}' \
    > test.out 2>&1
eval_tap $? 237 'AdminAddRolePermissionsV3' test.out

#- 238 AdminDeleteRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV3 \
    --roleId 'KQbfK3jo' \
    --body '["T8gUpQTF", "yYGxjzSq", "p8VeA26s"]' \
    > test.out 2>&1
eval_tap $? 238 'AdminDeleteRolePermissionsV3' test.out

#- 239 AdminDeleteRolePermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionV3 \
    --action '16' \
    --resource '0eHovn8P' \
    --roleId 'aB0qroSv' \
    > test.out 2>&1
eval_tap $? 239 'AdminDeleteRolePermissionV3' test.out

#- 240 AdminGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam adminGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 240 'AdminGetMyUserV3' test.out

#- 241 UserAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam userAuthenticationV3 \
    --clientId 'uGPTZ1YT' \
    --extendExp  \
    --redirectUri '6mY41tPa' \
    --password 'TyRttXD8' \
    --requestId 'qEJKJR8o' \
    --userName '6xkkg9vQ' \
    > test.out 2>&1
eval_tap $? 241 'UserAuthenticationV3' test.out

#- 242 AuthenticationWithPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV3 \
    --extendExp  \
    --clientId 'PSQlftKP' \
    --linkingToken 'cWffYCTL' \
    --password 'lfTHvii5' \
    --username 'd16FERzY' \
    > test.out 2>&1
eval_tap $? 242 'AuthenticationWithPlatformLinkV3' test.out

#- 243 AuthenticateAndLinkForwardV3
./ng net.accelbyte.sdk.cli.Main iam authenticateAndLinkForwardV3 \
    --extendExp  \
    --clientId 'TKxKypoZ' \
    --linkingToken 'ZFkflexE' \
    --password 'lCDkWqcX' \
    --username 'SfjxeY3Q' \
    > test.out 2>&1
eval_tap $? 243 'AuthenticateAndLinkForwardV3' test.out

#- 244 PublicGetSystemConfigV3
./ng net.accelbyte.sdk.cli.Main iam publicGetSystemConfigV3 \
    > test.out 2>&1
eval_tap $? 244 'PublicGetSystemConfigV3' test.out

#- 245 GenerateTokenByNewHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV3 \
    --additionalData 'qAzY34Bv' \
    --extendExp  \
    --linkingToken 'Iih0QiFL' \
    > test.out 2>&1
eval_tap $? 245 'GenerateTokenByNewHeadlessAccountV3' test.out

#- 246 RequestOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam requestOneTimeLinkingCodeV3 \
    --redirectUri '00O2WIkU' \
    --state 'ad5WG0sh' \
    --platformId 'rl6GWS8w' \
    > test.out 2>&1
eval_tap $? 246 'RequestOneTimeLinkingCodeV3' test.out

#- 247 ValidateOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam validateOneTimeLinkingCodeV3 \
    --oneTimeLinkCode 'dudme8S8' \
    > test.out 2>&1
eval_tap $? 247 'ValidateOneTimeLinkingCodeV3' test.out

#- 248 RequestTokenByOneTimeLinkCodeResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTokenByOneTimeLinkCodeResponseV3 \
    --additionalData 'h1UUICK3' \
    --isTransient  \
    --clientId '9DGzAU86' \
    --oneTimeLinkCode 'rFN8l2W8' \
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
    --codeChallenge '36XEHnpo' \
    --codeChallengeMethod 'S256' \
    --clientId 'm8uhr9Sj' \
    > test.out 2>&1
eval_tap $? 251 'RequestTokenExchangeCodeV3' test.out

#- 252 AdminRetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam adminRetrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'QlHSmp5P' \
    --userId 'Oh6ojVJR' \
    --platformUserId 'aRoLJC3x' \
    > test.out 2>&1
eval_tap $? 252 'AdminRetrieveUserThirdPartyPlatformTokenV3' test.out

#- 253 RevokeUserV3
./ng net.accelbyte.sdk.cli.Main iam revokeUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'GEgKmXrd' \
    --includeGameNamespace  \
    > test.out 2>&1
eval_tap $? 253 'RevokeUserV3' test.out

#- 254 AuthorizeV3
./ng net.accelbyte.sdk.cli.Main iam authorizeV3 \
    --blockedPlatformId 'Ik2GQ7Xq' \
    --codeChallenge 'oZYKNvob' \
    --codeChallengeMethod 'S256' \
    --createHeadless  \
    --loginWebBased  \
    --nonce 'd6DR1Jtk' \
    --oneTimeLinkCode 'kNRZlhWp' \
    --redirectUri 'GY3mgBR4' \
    --scope 'OU05ayDW' \
    --state 'mLo0A3If' \
    --targetAuthPage 'Xm1z3akg' \
    --useRedirectUriAsLoginUrlWhenLocked  \
    --clientId 'jEzCo132' \
    --responseType 'code' \
    > test.out 2>&1
eval_tap $? 254 'AuthorizeV3' test.out

#- 255 TokenIntrospectionV3
./ng net.accelbyte.sdk.cli.Main iam tokenIntrospectionV3 \
    --token 'rp2Jrl2T' \
    > test.out 2>&1
eval_tap $? 255 'TokenIntrospectionV3' test.out

#- 256 GetJWKSV3
./ng net.accelbyte.sdk.cli.Main iam getJWKSV3 \
    > test.out 2>&1
eval_tap $? 256 'GetJWKSV3' test.out

#- 257 SendMFAAuthenticationCode
./ng net.accelbyte.sdk.cli.Main iam sendMFAAuthenticationCode \
    --clientId 'yET3eI8e' \
    --factor 'rNsGFOm5' \
    --mfaToken 'oED9B36t' \
    > test.out 2>&1
eval_tap $? 257 'SendMFAAuthenticationCode' test.out

#- 258 Change2faMethod
./ng net.accelbyte.sdk.cli.Main iam change2faMethod \
    --factor 'UOQoqOzJ' \
    --mfaToken 'msfUksTA' \
    > test.out 2>&1
eval_tap $? 258 'Change2faMethod' test.out

#- 259 Verify2faCode
./ng net.accelbyte.sdk.cli.Main iam verify2faCode \
    --code 'qFSywR11' \
    --factor 'jr9G6D3Y' \
    --mfaToken 'P1PV4x2v' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 259 'Verify2faCode' test.out

#- 260 Verify2faCodeForward
./ng net.accelbyte.sdk.cli.Main iam verify2faCodeForward \
    --defaultFactor 'RzWiMNpj' \
    --factors 'WCeulI1k' \
    --rememberDevice  \
    --clientId 'f1ztzWL4' \
    --code 'rYlFSRQm' \
    --factor 'mu1bdrzD' \
    --mfaToken 'qaok5Lfk' \
    > test.out 2>&1
eval_tap $? 260 'Verify2faCodeForward' test.out

#- 261 RetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam retrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'T9Ji2Nr1' \
    --userId '16T1IQWq' \
    > test.out 2>&1
eval_tap $? 261 'RetrieveUserThirdPartyPlatformTokenV3' test.out

#- 262 AuthCodeRequestV3
./ng net.accelbyte.sdk.cli.Main iam authCodeRequestV3 \
    --platformId 'AVhfIjUB' \
    --clientId 'K5tD2BMo' \
    --redirectUri 'CBu1UO3b' \
    --requestId 'wIKXPH7A' \
    > test.out 2>&1
eval_tap $? 262 'AuthCodeRequestV3' test.out

#- 263 PlatformTokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV3 \
    --platformId 'Hjs9eqG0' \
    --additionalData '91ouJOMB' \
    --clientId 'lfMTbDaa' \
    --createHeadless  \
    --deviceId 'Rhu9yMyd' \
    --macAddress 'THKgyqRm' \
    --platformToken 'PSBxgiC4' \
    --serviceLabel '0.043987499128399055' \
    --skipSetCookie  \
    > test.out 2>&1
eval_tap $? 263 'PlatformTokenGrantV3' test.out

#- 264 GetRevocationListV3
./ng net.accelbyte.sdk.cli.Main iam getRevocationListV3 \
    > test.out 2>&1
eval_tap $? 264 'GetRevocationListV3' test.out

#- 265 TokenRevocationV3
./ng net.accelbyte.sdk.cli.Main iam tokenRevocationV3 \
    --token 'mlLTdbHS' \
    > test.out 2>&1
eval_tap $? 265 'TokenRevocationV3' test.out

#- 266 SimultaneousLoginV3
./ng net.accelbyte.sdk.cli.Main iam simultaneousLoginV3 \
    --simultaneousPlatform 'QwWChrKC' \
    --simultaneousTicket 'dNhjsfc5' \
    --nativePlatform 'steam' \
    --nativePlatformTicket '4pdjkdD0' \
    > test.out 2>&1
eval_tap $? 266 'SimultaneousLoginV3' test.out

#- 267 TokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV3 \
    --additionalData 'mamIe5lk' \
    --clientId 'jYdcML5W' \
    --clientSecret '6AqlqtpZ' \
    --code 'kys7nTp2' \
    --codeVerifier '5BIZIB3R' \
    --extendNamespace 'E9mIEnMS' \
    --extendExp  \
    --password 'nVQyJubZ' \
    --redirectUri 'fqDNnW2W' \
    --refreshToken 'zb8VTl7k' \
    --scope 'i1TpoVph' \
    --username 'lwLZU5Ct' \
    --grantType 'client_credentials' \
    > test.out 2>&1
eval_tap $? 267 'TokenGrantV3' test.out

#- 268 VerifyTokenV3
./ng net.accelbyte.sdk.cli.Main iam verifyTokenV3 \
    --token 'z81X1LJv' \
    > test.out 2>&1
eval_tap $? 268 'VerifyTokenV3' test.out

#- 269 PlatformAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticationV3 \
    --platformId 'mAkrQ2KC' \
    --code 'qTNS9b8L' \
    --error 'mdgKAU6z' \
    --openidAssocHandle '0k1cZRmE' \
    --openidClaimedId 'sdGkJxiN' \
    --openidIdentity '29f74LC3' \
    --openidMode 'OuiZXdpF' \
    --openidNs '9jfoV7EI' \
    --openidOpEndpoint 'A6nJiTZj' \
    --openidResponseNonce 'UTeEk3lA' \
    --openidReturnTo 'WIlcwJax' \
    --openidSig 'dD3lnuzo' \
    --openidSigned 'qLAIcb1W' \
    --state 'FUsuSizb' \
    > test.out 2>&1
eval_tap $? 269 'PlatformAuthenticationV3' test.out

#- 270 PlatformTokenRefreshV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenRefreshV3 \
    --platformId '4lv1uUmJ' \
    --platformToken 'xyIQvSpP' \
    > test.out 2>&1
eval_tap $? 270 'PlatformTokenRefreshV3' test.out

#- 271 PublicGetInputValidations
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidations \
    --defaultOnEmpty  \
    --languageCode '1QIhH9vl' \
    > test.out 2>&1
eval_tap $? 271 'PublicGetInputValidations' test.out

#- 272 PublicGetInputValidationByField
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidationByField \
    --field 'J0hkIxGl' \
    > test.out 2>&1
eval_tap $? 272 'PublicGetInputValidationByField' test.out

#- 273 PublicGetCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam publicGetCountryAgeRestrictionV3 \
    --countryCode 'T4Xg5lYw' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 273 'PublicGetCountryAgeRestrictionV3' test.out

#- 274 PublicGetConfigValueV3
./ng net.accelbyte.sdk.cli.Main iam publicGetConfigValueV3 \
    --configKey 'V61OvqDJ' \
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
    --clientId 'LYDbnKy9' \
    > test.out 2>&1
eval_tap $? 277 'RetrieveActiveOIDCClientsPublicV3' test.out

#- 278 PublicListUserIDByPlatformUserIDsV3
eval_tap 0 278 'PublicListUserIDByPlatformUserIDsV3 # SKIP deprecated' test.out

#- 279 PublicGetUserByPlatformUserIDV3
eval_tap 0 279 'PublicGetUserByPlatformUserIDV3 # SKIP deprecated' test.out

#- 280 PublicGetProfileUpdateStrategyV3
./ng net.accelbyte.sdk.cli.Main iam publicGetProfileUpdateStrategyV3 \
    --namespace "$AB_NAMESPACE" \
    --field 'username' \
    > test.out 2>&1
eval_tap $? 280 'PublicGetProfileUpdateStrategyV3' test.out

#- 281 PublicGetAsyncStatus
./ng net.accelbyte.sdk.cli.Main iam publicGetAsyncStatus \
    --namespace "$AB_NAMESPACE" \
    --requestId 'szVekkiU' \
    > test.out 2>&1
eval_tap $? 281 'PublicGetAsyncStatus' test.out

#- 282 PublicSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam publicSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'fvLg8Dra' \
    --limit '76' \
    --offset '96' \
    --platformBy 'OLkSt69N' \
    --platformId 'ex82OUkR' \
    --query 'XObnHsPk' \
    > test.out 2>&1
eval_tap $? 282 'PublicSearchUserV3' test.out

#- 283 PublicCreateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "nPb0Kfp3", "acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "RD3HoKio", "policyId": "NTyDXrSK", "policyVersionId": "KbRHWG1p"}, {"isAccepted": false, "localizedPolicyVersionId": "nhelAkA2", "policyId": "hdpZq7GS", "policyVersionId": "pBwd4j69"}, {"isAccepted": true, "localizedPolicyVersionId": "SpSuZi2L", "policyId": "u05ky2V1", "policyVersionId": "sqMiQRtm"}], "authType": "cv24ZdEs", "code": "LfcpugVV", "country": "k2Mszflk", "dateOfBirth": "Z33WSIA4", "displayName": "4dk4EwCr", "emailAddress": "HmrRCR2w", "password": "a7uPafeE", "reachMinimumAge": true, "uniqueDisplayName": "S4bhgG4i"}' \
    > test.out 2>&1
eval_tap $? 283 'PublicCreateUserV3' test.out

#- 284 CheckUserAvailability
./ng net.accelbyte.sdk.cli.Main iam checkUserAvailability \
    --namespace "$AB_NAMESPACE" \
    --field 'I6MHilyA' \
    --query 'HHdZEIYN' \
    > test.out 2>&1
eval_tap $? 284 'CheckUserAvailability' test.out

#- 285 PublicBulkGetUsers
eval_tap 0 285 'PublicBulkGetUsers # SKIP deprecated' test.out

#- 286 PublicSendRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicSendRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "KNfKvMpi", "languageTag": "26uVzO8z"}' \
    > test.out 2>&1
eval_tap $? 286 'PublicSendRegistrationCode' test.out

#- 287 PublicVerifyRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicVerifyRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "OJTALdw4", "emailAddress": "MtG2LrCG"}' \
    > test.out 2>&1
eval_tap $? 287 'PublicVerifyRegistrationCode' test.out

#- 288 PublicForgotPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicForgotPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "WRuEcsYO", "languageTag": "xANU3O2x"}' \
    > test.out 2>&1
eval_tap $? 288 'PublicForgotPasswordV3' test.out

#- 289 PublicValidateUserInput
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserInput \
    --namespace "$AB_NAMESPACE" \
    --body '{"displayName": "jsRFkLhg", "password": "nS0zbzFK", "uniqueDisplayName": "X4BgbHCG", "username": "3DJizV3g"}' \
    > test.out 2>&1
eval_tap $? 289 'PublicValidateUserInput' test.out

#- 290 GetAdminInvitationV3
./ng net.accelbyte.sdk.cli.Main iam getAdminInvitationV3 \
    --invitationId '4PMWbyBY' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 290 'GetAdminInvitationV3' test.out

#- 291 CreateUserFromInvitationV3
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV3 \
    --invitationId 'tb2C3DJV' \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "Vqa3H9RQ", "acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "qFAOxV4i", "policyId": "d0okqR4j", "policyVersionId": "7NIzUbcN"}, {"isAccepted": true, "localizedPolicyVersionId": "mxfF4azN", "policyId": "TUOvSe3V", "policyVersionId": "YHNpDLpE"}, {"isAccepted": false, "localizedPolicyVersionId": "Js9yMp9a", "policyId": "xXSOMNRR", "policyVersionId": "n9A5UMkK"}], "authType": "a4mKGNck", "code": "94yfy12h", "country": "eArhJIlv", "dateOfBirth": "pSI0GOAE", "displayName": "yMwLQUmq", "emailAddress": "dE42IKcL", "password": "taeKbatq", "reachMinimumAge": true, "uniqueDisplayName": "xnlciVg8"}' \
    > test.out 2>&1
eval_tap $? 291 'CreateUserFromInvitationV3' test.out

#- 292 UpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam updateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "4d4MirWl", "country": "JsmRv9Iu", "dateOfBirth": "f0PdR2hr", "displayName": "jyWrfyzS", "languageTag": "gfVRtLwC", "uniqueDisplayName": "mccQXCe9", "userName": "qKtssExA"}' \
    > test.out 2>&1
eval_tap $? 292 'UpdateUserV3' test.out

#- 293 PublicPartialUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicPartialUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "E3g9LjRQ", "country": "QUhScz2K", "dateOfBirth": "DABdaM9i", "displayName": "27ytb9SY", "languageTag": "BrzLjCIH", "uniqueDisplayName": "t46sBUAd", "userName": "otjyUji5"}' \
    > test.out 2>&1
eval_tap $? 293 'PublicPartialUpdateUserV3' test.out

#- 294 PublicSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"context": "MFdiDLhB", "emailAddress": "dXKyafgN", "languageTag": "bn9ABOaA", "upgradeToken": "QzIm3jrQ"}' \
    > test.out 2>&1
eval_tap $? 294 'PublicSendVerificationCodeV3' test.out

#- 295 PublicUserVerificationV3
./ng net.accelbyte.sdk.cli.Main iam publicUserVerificationV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "Gf6GzRAE", "contactType": "FMFTB7mI", "languageTag": "kDwn2Up9", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 295 'PublicUserVerificationV3' test.out

#- 296 PublicUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "ZTJXWyra", "country": "gtw0RL7J", "dateOfBirth": "Ijh6vKbM", "displayName": "iuW9gHXR", "emailAddress": "LQo11wCY", "password": "csGsGM9O", "uniqueDisplayName": "Trz7vdby", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 296 'PublicUpgradeHeadlessAccountV3' test.out

#- 297 PublicVerifyHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --needVerificationCode  \
    --body '{"emailAddress": "4X0OLstW", "password": "cx7GDz7k"}' \
    > test.out 2>&1
eval_tap $? 297 'PublicVerifyHeadlessAccountV3' test.out

#- 298 PublicUpdatePasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicUpdatePasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"languageTag": "Vxmk2Bz6", "mfaToken": "pJCxBwsw", "newPassword": "UoGBdEU8", "oldPassword": "DtVDtCcg"}' \
    > test.out 2>&1
eval_tap $? 298 'PublicUpdatePasswordV3' test.out

#- 299 PublicCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam publicCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'Q0wo9oFl' \
    > test.out 2>&1
eval_tap $? 299 'PublicCreateJusticeUser' test.out

#- 300 PublicPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'OO0vOjzG' \
    --redirectUri 'XAi2Y8QN' \
    --ticket 'T3pojCil' \
    > test.out 2>&1
eval_tap $? 300 'PublicPlatformLinkV3' test.out

#- 301 PublicPlatformUnlinkV3
eval_tap 0 301 'PublicPlatformUnlinkV3 # SKIP deprecated' test.out

#- 302 PublicPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '6mYEH5pR' \
    > test.out 2>&1
eval_tap $? 302 'PublicPlatformUnlinkAllV3' test.out

#- 303 PublicForcePlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicForcePlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'J63p6MM3' \
    --ticket 'trqcUNMh' \
    > test.out 2>&1
eval_tap $? 303 'PublicForcePlatformLinkV3' test.out

#- 304 PublicWebLinkPlatform
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatform \
    --namespace "$AB_NAMESPACE" \
    --platformId 'WyISXgId' \
    --clientId '3Y3bkx6C' \
    --redirectUri 'xcARtSZx' \
    > test.out 2>&1
eval_tap $? 304 'PublicWebLinkPlatform' test.out

#- 305 PublicWebLinkPlatformEstablish
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatformEstablish \
    --namespace "$AB_NAMESPACE" \
    --platformId 'lKyPyPhO' \
    --code 'LzLa83QZ' \
    --state 'xbTHi29I' \
    > test.out 2>&1
eval_tap $? 305 'PublicWebLinkPlatformEstablish' test.out

#- 306 PublicProcessWebLinkPlatformV3
./ng net.accelbyte.sdk.cli.Main iam publicProcessWebLinkPlatformV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'mvTVrEJY' \
    --code 'hU4NPwZa' \
    --state 'pxGKMwuF' \
    > test.out 2>&1
eval_tap $? 306 'PublicProcessWebLinkPlatformV3' test.out

#- 307 PublicGetUsersPlatformInfosV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUsersPlatformInfosV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"platformId": "LjsBc8ur", "userIds": ["ctRP2GIj", "oWFXUNQS", "6dlepV7y"]}' \
    > test.out 2>&1
eval_tap $? 307 'PublicGetUsersPlatformInfosV3' test.out

#- 308 ResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam resetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientId": "5gQbLN2f", "code": "9FFADJ1z", "emailAddress": "pTcwkuFo", "languageTag": "4duejSoO", "newPassword": "KwVq0dJm"}' \
    > test.out 2>&1
eval_tap $? 308 'ResetPasswordV3' test.out

#- 309 PublicGetUserByUserIdV3
eval_tap 0 309 'PublicGetUserByUserIdV3 # SKIP deprecated' test.out

#- 310 PublicGetUserBanHistoryV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserBanHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'dsgFsl0x' \
    --activeOnly  \
    --limit '60' \
    --offset '87' \
    > test.out 2>&1
eval_tap $? 310 'PublicGetUserBanHistoryV3' test.out

#- 311 PublicListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'wUeAbD3i' \
    > test.out 2>&1
eval_tap $? 311 'PublicListUserAllPlatformAccountsDistinctV3' test.out

#- 312 PublicGetUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'RR4ExkMX' \
    > test.out 2>&1
eval_tap $? 312 'PublicGetUserInformationV3' test.out

#- 313 PublicGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'DnyCLSg1' \
    --after '0.6507161952786484' \
    --before '0.3507599467826277' \
    --limit '10' \
    > test.out 2>&1
eval_tap $? 313 'PublicGetUserLoginHistoriesV3' test.out

#- 314 PublicGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'TORfeLCf' \
    --after 'xl1XBmpT' \
    --before 'AMQzsoin' \
    --limit '40' \
    --platformId 'IAfGRXUf' \
    > test.out 2>&1
eval_tap $? 314 'PublicGetUserPlatformAccountsV3' test.out

#- 315 PublicListJusticePlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicListJusticePlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '3u1gnHkl' \
    > test.out 2>&1
eval_tap $? 315 'PublicListJusticePlatformAccountsV3' test.out

#- 316 PublicLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam publicLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'kf1llAf8' \
    --body '{"platformId": "cRQuglda", "platformUserId": "3wFuey7R"}' \
    > test.out 2>&1
eval_tap $? 316 'PublicLinkPlatformAccount' test.out

#- 317 PublicForceLinkPlatformWithProgression
./ng net.accelbyte.sdk.cli.Main iam publicForceLinkPlatformWithProgression \
    --namespace "$AB_NAMESPACE" \
    --userId '6CO5eugl' \
    --body '{"chosenNamespaces": ["gsazxOLl", "nDBrgGnC", "nTv1CBEg"], "requestId": "e0soOUyW"}' \
    > test.out 2>&1
eval_tap $? 317 'PublicForceLinkPlatformWithProgression' test.out

#- 318 PublicGetPublisherUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetPublisherUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ykL45wwE' \
    > test.out 2>&1
eval_tap $? 318 'PublicGetPublisherUserV3' test.out

#- 319 PublicValidateUserByUserIDAndPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserByUserIDAndPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZgdZ4CRi' \
    --password 'GK0d6k1w' \
    > test.out 2>&1
eval_tap $? 319 'PublicValidateUserByUserIDAndPasswordV3' test.out

#- 320 PublicGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRolesV3 \
    --after 'gZhG8zrV' \
    --before 'VZHSG8eP' \
    --isWildcard  \
    --limit '11' \
    > test.out 2>&1
eval_tap $? 320 'PublicGetRolesV3' test.out

#- 321 PublicGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRoleV3 \
    --roleId 'NI3dHZYH' \
    > test.out 2>&1
eval_tap $? 321 'PublicGetRoleV3' test.out

#- 322 PublicForgotPasswordWithoutNamespaceV3
./ng net.accelbyte.sdk.cli.Main iam publicForgotPasswordWithoutNamespaceV3 \
    --body '{"clientId": "4YiJ91Tv", "emailAddress": "M1R4dutg", "languageTag": "ReawiCRd"}' \
    > test.out 2>&1
eval_tap $? 322 'PublicForgotPasswordWithoutNamespaceV3' test.out

#- 323 PublicGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyUserV3 \
    --includeAllPlatforms  \
    > test.out 2>&1
eval_tap $? 323 'PublicGetMyUserV3' test.out

#- 324 PublicSendCodeForwardV3
./ng net.accelbyte.sdk.cli.Main iam publicSendCodeForwardV3 \
    --body '{"context": "C0MpkPBT", "emailAddress": "uqVPnGLo", "languageTag": "mfTdVhGy", "upgradeToken": "uK52kMwn"}' \
    > test.out 2>&1
eval_tap $? 324 'PublicSendCodeForwardV3' test.out

#- 325 PublicGetLinkHeadlessAccountToMyAccountConflictV3
./ng net.accelbyte.sdk.cli.Main iam publicGetLinkHeadlessAccountToMyAccountConflictV3 \
    --oneTimeLinkCode 'eot0fg8k' \
    > test.out 2>&1
eval_tap $? 325 'PublicGetLinkHeadlessAccountToMyAccountConflictV3' test.out

#- 326 LinkHeadlessAccountToMyAccountV3
./ng net.accelbyte.sdk.cli.Main iam linkHeadlessAccountToMyAccountV3 \
    --body '{"chosenNamespaces": ["ougmYJEL", "2WHeNIle", "FkqTIY2D"], "oneTimeLinkCode": "RZ9LsTVd"}' \
    > test.out 2>&1
eval_tap $? 326 'LinkHeadlessAccountToMyAccountV3' test.out

#- 327 PublicGetMyRedirectionAfterLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyRedirectionAfterLinkV3 \
    --oneTimeLinkCode 'yZYgA1YJ' \
    > test.out 2>&1
eval_tap $? 327 'PublicGetMyRedirectionAfterLinkV3' test.out

#- 328 PublicGetMyProfileAllowUpdateStatusV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyProfileAllowUpdateStatusV3 \
    > test.out 2>&1
eval_tap $? 328 'PublicGetMyProfileAllowUpdateStatusV3' test.out

#- 329 PublicSendVerificationLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationLinkV3 \
    --body '{"languageTag": "80UXVCx3"}' \
    > test.out 2>&1
eval_tap $? 329 'PublicSendVerificationLinkV3' test.out

#- 330 PublicGetOpenidUserInfoV3
./ng net.accelbyte.sdk.cli.Main iam publicGetOpenidUserInfoV3 \
    > test.out 2>&1
eval_tap $? 330 'PublicGetOpenidUserInfoV3' test.out

#- 331 PublicVerifyUserByLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyUserByLinkV3 \
    --code 'u2yw9EGv' \
    > test.out 2>&1
eval_tap $? 331 'PublicVerifyUserByLinkV3' test.out

#- 332 PlatformAuthenticateSAMLV3Handler
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticateSAMLV3Handler \
    --platformId 'fAVh7t50' \
    --code 'pm03h79j' \
    --error 'e4beAsi5' \
    --state 'PyPUAzS4' \
    > test.out 2>&1
eval_tap $? 332 'PlatformAuthenticateSAMLV3Handler' test.out

#- 333 LoginSSOClient
./ng net.accelbyte.sdk.cli.Main iam loginSSOClient \
    --platformId 'HTfkKrxd' \
    --payload '3nqJM4Qe' \
    > test.out 2>&1
eval_tap $? 333 'LoginSSOClient' test.out

#- 334 LogoutSSOClient
./ng net.accelbyte.sdk.cli.Main iam logoutSSOClient \
    --platformId 'BVyRmlaX' \
    > test.out 2>&1
eval_tap $? 334 'LogoutSSOClient' test.out

#- 335 RequestTargetTokenResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTargetTokenResponseV3 \
    --additionalData '4hFvCHSu' \
    --code 'rCY5vdvL' \
    > test.out 2>&1
eval_tap $? 335 'RequestTargetTokenResponseV3' test.out

#- 336 UpgradeAndAuthenticateForwardV3
./ng net.accelbyte.sdk.cli.Main iam upgradeAndAuthenticateForwardV3 \
    --clientId 'SP5RIxAx' \
    --upgradeSuccessToken 'DR9wMaLN' \
    > test.out 2>&1
eval_tap $? 336 'UpgradeAndAuthenticateForwardV3' test.out

#- 337 AdminListInvitationHistoriesV4
./ng net.accelbyte.sdk.cli.Main iam adminListInvitationHistoriesV4 \
    --limit '67' \
    --namespace "$AB_NAMESPACE" \
    --offset '19' \
    > test.out 2>&1
eval_tap $? 337 'AdminListInvitationHistoriesV4' test.out

#- 338 AdminGetDevicesByUserV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDevicesByUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Nr2pK6pg' \
    > test.out 2>&1
eval_tap $? 338 'AdminGetDevicesByUserV4' test.out

#- 339 AdminGetBannedDevicesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedDevicesV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceType 'vFnoerC7' \
    --endDate '9TxEn39n' \
    --limit '47' \
    --offset '23' \
    --startDate 'kheegU9B' \
    > test.out 2>&1
eval_tap $? 339 'AdminGetBannedDevicesV4' test.out

#- 340 AdminGetUserDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeviceBansV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'k1LdzVeC' \
    > test.out 2>&1
eval_tap $? 340 'AdminGetUserDeviceBansV4' test.out

#- 341 AdminBanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminBanDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"comment": "kd74a6KG", "deviceId": "AZCR8WIJ", "deviceType": "cYuiczrF", "enabled": false, "endDate": "3eGFlZlb", "ext": {"KUb4XoDY": {}, "FmKGqLmU": {}, "9PXSRdnW": {}}, "reason": "diXopxyi"}' \
    > test.out 2>&1
eval_tap $? 341 'AdminBanDeviceV4' test.out

#- 342 AdminGetDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBanV4 \
    --banId 'Y1PLbPDx' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 342 'AdminGetDeviceBanV4' test.out

#- 343 AdminUpdateDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateDeviceBanV4 \
    --banId 'j1g1K32a' \
    --namespace "$AB_NAMESPACE" \
    --body '{"enabled": false}' \
    > test.out 2>&1
eval_tap $? 343 'AdminUpdateDeviceBanV4' test.out

#- 344 AdminGenerateReportV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateReportV4 \
    --namespace "$AB_NAMESPACE" \
    --endDate 'asGTnfm6' \
    --startDate '5HjqSlhc' \
    --deviceType 'UgwatwWC' \
    > test.out 2>&1
eval_tap $? 344 'AdminGenerateReportV4' test.out

#- 345 AdminGetDeviceTypesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceTypesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 345 'AdminGetDeviceTypesV4' test.out

#- 346 AdminGetDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBansV4 \
    --deviceId 'dIlMfjyG' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 346 'AdminGetDeviceBansV4' test.out

#- 347 AdminDecryptDeviceV4
eval_tap 0 347 'AdminDecryptDeviceV4 # SKIP deprecated' test.out

#- 348 AdminUnbanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminUnbanDeviceV4 \
    --deviceId 'hnRuHTH9' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 348 'AdminUnbanDeviceV4' test.out

#- 349 AdminGetUsersByDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUsersByDeviceV4 \
    --deviceId 'lfb3l2i4' \
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
    --limit '42' \
    --offset '44' \
    > test.out 2>&1
eval_tap $? 351 'AdminGetNamespaceUserInvitationHistoryV4' test.out

#- 352 AdminCreateTestUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateTestUsersV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "nGQVBoXP", "policyId": "DTe0NH6U", "policyVersionId": "dTA7NOLF"}, {"isAccepted": true, "localizedPolicyVersionId": "kQJMIExJ", "policyId": "8YCRSYK8", "policyVersionId": "NTfPoejM"}, {"isAccepted": true, "localizedPolicyVersionId": "aixO6Da9", "policyId": "xzutWcIo", "policyVersionId": "fEv3gbT1"}], "count": 10, "userInfo": {"country": "BpirfPnU"}}' \
    > test.out 2>&1
eval_tap $? 352 'AdminCreateTestUsersV4' test.out

#- 353 AdminCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "LPjcNrMl", "policyId": "XWWSPfAE", "policyVersionId": "syRbEpvY"}, {"isAccepted": true, "localizedPolicyVersionId": "KkoB4xEe", "policyId": "gq5fPZjp", "policyVersionId": "QrqRgmWA"}, {"isAccepted": true, "localizedPolicyVersionId": "nZuvxkF3", "policyId": "yMH1H63N", "policyVersionId": "NxVYfnss"}], "authType": "EMAILPASSWD", "code": "sKd26Trc", "country": "wLIBXiIE", "dateOfBirth": "ZsD8vM2U", "displayName": "vQk9SeSA", "emailAddress": "tMNFnnSK", "password": "tNsa2JvW", "passwordMD5Sum": "Wlv76uiv", "reachMinimumAge": false, "uniqueDisplayName": "sM1E9up5", "username": "CMdjo7xC"}' \
    > test.out 2>&1
eval_tap $? 353 'AdminCreateUserV4' test.out

#- 354 AdminBulkUpdateUserAccountTypeV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateUserAccountTypeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"testAccount": true, "userIds": ["fDmW5vt3", "Dts02nr6", "UAPC5nXj"]}' \
    > test.out 2>&1
eval_tap $? 354 'AdminBulkUpdateUserAccountTypeV4' test.out

#- 355 AdminBulkCheckValidUserIDV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkCheckValidUserIDV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["VmIxI30x", "hewy9TEc", "6vNnJpLR"]}' \
    > test.out 2>&1
eval_tap $? 355 'AdminBulkCheckValidUserIDV4' test.out

#- 356 AdminUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'My1pwZQv' \
    --body '{"avatarUrl": "gD4u152s", "country": "VRQVRFY7", "dateOfBirth": "7mmGr5U9", "displayName": "Jhg0EuPh", "languageTag": "K6gPPPaD", "skipLoginQueue": true, "tags": ["5kmuUSj8", "ombTCFmr", "Fl1C6Erg"], "uniqueDisplayName": "KhkGWK8Q", "userName": "3g7I6SL8"}' \
    > test.out 2>&1
eval_tap $? 356 'AdminUpdateUserV4' test.out

#- 357 AdminUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '2epQ7Y9j' \
    --body '{"code": "rmqmLMOB", "emailAddress": "7p8naf14"}' \
    > test.out 2>&1
eval_tap $? 357 'AdminUpdateUserEmailAddressV4' test.out

#- 358 AdminDisableUserMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableUserMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'K7H0Bbbj' \
    --body '{"factor": "V39RwJCv", "mfaToken": "emd56Nun"}' \
    > test.out 2>&1
eval_tap $? 358 'AdminDisableUserMFAV4' test.out

#- 359 AdminGetUserMFAStatusV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUserMFAStatusV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'AuFAkbbX' \
    > test.out 2>&1
eval_tap $? 359 'AdminGetUserMFAStatusV4' test.out

#- 360 AdminListUserRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminListUserRolesV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'as7VOmPK' \
    > test.out 2>&1
eval_tap $? 360 'AdminListUserRolesV4' test.out

#- 361 AdminUpdateUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'DrK3WWmU' \
    --body '{"assignedNamespaces": ["gWvghn8F", "POTUKsCC", "8qFctspm"], "roleId": "ArL9luDs"}' \
    > test.out 2>&1
eval_tap $? 361 'AdminUpdateUserRoleV4' test.out

#- 362 AdminAddUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'NnJZVbrq' \
    --body '{"assignedNamespaces": ["C2brcSSL", "uBhoQHvL", "Qjj78hQn"], "roleId": "zgwPVLSt"}' \
    > test.out 2>&1
eval_tap $? 362 'AdminAddUserRoleV4' test.out

#- 363 AdminRemoveUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRemoveUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'DCxYLQZn' \
    --body '{"assignedNamespaces": ["x6rnngEj", "iZlfu0Ns", "mWRQYAk1"], "roleId": "u7P15l9G"}' \
    > test.out 2>&1
eval_tap $? 363 'AdminRemoveUserRoleV4' test.out

#- 364 AdminGetRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV4 \
    --adminRole  \
    --isWildcard  \
    --limit '54' \
    --offset '44' \
    > test.out 2>&1
eval_tap $? 364 'AdminGetRolesV4' test.out

#- 365 AdminCreateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV4 \
    --body '{"adminRole": false, "deletable": true, "isWildcard": true, "roleName": "yRxbNQPy"}' \
    > test.out 2>&1
eval_tap $? 365 'AdminCreateRoleV4' test.out

#- 366 AdminGetRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV4 \
    --roleId 'TBwUhQTW' \
    > test.out 2>&1
eval_tap $? 366 'AdminGetRoleV4' test.out

#- 367 AdminDeleteRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV4 \
    --roleId 'eBD6j0sr' \
    > test.out 2>&1
eval_tap $? 367 'AdminDeleteRoleV4' test.out

#- 368 AdminUpdateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV4 \
    --roleId 'i98Dthjl' \
    --body '{"adminRole": true, "deletable": false, "isWildcard": false, "roleName": "GkubqmRL"}' \
    > test.out 2>&1
eval_tap $? 368 'AdminUpdateRoleV4' test.out

#- 369 AdminUpdateRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV4 \
    --roleId 'XIKOPRi7' \
    --body '{"permissions": [{"action": 21, "resource": "16erNHSH", "schedAction": 23, "schedCron": "NKAOYXCh", "schedRange": ["enorAaxA", "AaqWRjlD", "JzybLaAr"]}, {"action": 100, "resource": "KWwzP3kl", "schedAction": 32, "schedCron": "bb5y5jNy", "schedRange": ["NiaYJyDz", "zqmsgYTI", "lBEKrOwv"]}, {"action": 58, "resource": "qJmcIg8F", "schedAction": 81, "schedCron": "L9U0LEcm", "schedRange": ["vIljjQjJ", "XoNoWzAe", "VcgiAI2z"]}]}' \
    > test.out 2>&1
eval_tap $? 369 'AdminUpdateRolePermissionsV4' test.out

#- 370 AdminAddRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV4 \
    --roleId 'UIuZh0cs' \
    --body '{"permissions": [{"action": 52, "resource": "j0dVUVV4", "schedAction": 48, "schedCron": "a65qdO6O", "schedRange": ["52peGkrR", "o1Rvoarz", "IwR0qm7s"]}, {"action": 47, "resource": "yqiAuRJR", "schedAction": 69, "schedCron": "k5sLMnU2", "schedRange": ["7SiTh0BQ", "pECzsn6l", "AJq1jMqY"]}, {"action": 10, "resource": "4GKWHDlp", "schedAction": 71, "schedCron": "DqStFRLP", "schedRange": ["4D5Ir5gO", "8jgfQhiq", "At0TPl0v"]}]}' \
    > test.out 2>&1
eval_tap $? 370 'AdminAddRolePermissionsV4' test.out

#- 371 AdminDeleteRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV4 \
    --roleId 'xdy6djie' \
    --body '["2XwE01xl", "r1tXj6Kp", "PniJxoIb"]' \
    > test.out 2>&1
eval_tap $? 371 'AdminDeleteRolePermissionsV4' test.out

#- 372 AdminListAssignedUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminListAssignedUsersV4 \
    --roleId 'uBb2zDvK' \
    --after 'D125h3bw' \
    --before 'wF8itwim' \
    --limit '6' \
    > test.out 2>&1
eval_tap $? 372 'AdminListAssignedUsersV4' test.out

#- 373 AdminAssignUserToRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAssignUserToRoleV4 \
    --roleId 'OOQFDs05' \
    --body '{"assignedNamespaces": ["p8MS8Zz4", "kD0LndDi", "f0BT2rRn"], "namespace": "7AlvYjud", "userId": "FmJ0eGm7"}' \
    > test.out 2>&1
eval_tap $? 373 'AdminAssignUserToRoleV4' test.out

#- 374 AdminRevokeUserFromRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRevokeUserFromRoleV4 \
    --roleId 'gqWjOPRU' \
    --body '{"namespace": "mEiUigqW", "userId": "g1X5DbZc"}' \
    > test.out 2>&1
eval_tap $? 374 'AdminRevokeUserFromRoleV4' test.out

#- 375 AdminInviteUserNewV4
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserNewV4 \
    --body '{"assignedNamespaces": ["0MiI5RgN", "u89UDxvw", "q3UV9Wql"], "emailAddresses": ["KlkJ0OOn", "ie9OJXDx", "kesHLEoV"], "isAdmin": true, "isNewStudio": true, "languageTag": "fURZg1fE", "namespace": "WxrLVX8E", "roleId": "fM5etVCd"}' \
    > test.out 2>&1
eval_tap $? 375 'AdminInviteUserNewV4' test.out

#- 376 AdminUpdateMyUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateMyUserV4 \
    --body '{"avatarUrl": "bPwBCXWB", "country": "bJ6T5hE9", "dateOfBirth": "pFLtYJYp", "displayName": "9LJvP2B2", "languageTag": "QYK7mDmF", "skipLoginQueue": false, "tags": ["a7MG9y1u", "x1YoG5IQ", "kGx7IHMA"], "uniqueDisplayName": "x5edA76m", "userName": "iWbUeGg2"}' \
    > test.out 2>&1
eval_tap $? 376 'AdminUpdateMyUserV4' test.out

#- 377 AdminDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyAuthenticatorV4 \
    --body '{"factor": "U4uviQ9m", "mfaToken": "m96BlODr"}' \
    > test.out 2>&1
eval_tap $? 377 'AdminDisableMyAuthenticatorV4' test.out

#- 378 AdminEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyAuthenticatorV4 \
    --code '9gZHSHKW' \
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
    --body '{"factor": "H9abYu6D", "mfaToken": "S5eUGluh"}' \
    > test.out 2>&1
eval_tap $? 382 'AdminDisableMyBackupCodesV4' test.out

#- 383 AdminDownloadMyBackupCodesV4
eval_tap 0 383 'AdminDownloadMyBackupCodesV4 # SKIP deprecated' test.out

#- 384 AdminEnableMyBackupCodesV4
eval_tap 0 384 'AdminEnableMyBackupCodesV4 # SKIP deprecated' test.out

#- 385 AdminGetBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBackupCodesV4 \
    --languageTag 'K9dLbehI' \
    > test.out 2>&1
eval_tap $? 385 'AdminGetBackupCodesV4' test.out

#- 386 AdminGenerateBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateBackupCodesV4 \
    --languageTag 'aE5GfED0' \
    > test.out 2>&1
eval_tap $? 386 'AdminGenerateBackupCodesV4' test.out

#- 387 AdminEnableBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableBackupCodesV4 \
    --languageTag 'moXw6mls' \
    > test.out 2>&1
eval_tap $? 387 'AdminEnableBackupCodesV4' test.out

#- 388 AdminChallengeMyMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminChallengeMyMFAV4 \
    --code 'cOsSatV9' \
    --factor 'MFgVlS7b' \
    > test.out 2>&1
eval_tap $? 388 'AdminChallengeMyMFAV4' test.out

#- 389 AdminSendMyMFAEmailCodeV4
./ng net.accelbyte.sdk.cli.Main iam adminSendMyMFAEmailCodeV4 \
    --action 'MenYdbrA' \
    --languageTag '3vj55Icf' \
    > test.out 2>&1
eval_tap $? 389 'AdminSendMyMFAEmailCodeV4' test.out

#- 390 AdminDisableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyEmailV4 \
    --body '{"factor": "10uejynF", "mfaToken": "gdmHSehG"}' \
    > test.out 2>&1
eval_tap $? 390 'AdminDisableMyEmailV4' test.out

#- 391 AdminEnableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyEmailV4 \
    --code 'mSpgfCyB' \
    > test.out 2>&1
eval_tap $? 391 'AdminEnableMyEmailV4' test.out

#- 392 AdminGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyEnabledFactorsV4 \
    > test.out 2>&1
eval_tap $? 392 'AdminGetMyEnabledFactorsV4' test.out

#- 393 AdminMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam adminMakeFactorMyDefaultV4 \
    --factor 'xGFrr0Uy' \
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
    --clientId 'lbmc0Bch' \
    --linkingToken 'nlBhedeq' \
    --password 'y2oANrBC' \
    --username 'BOf9IY2X' \
    > test.out 2>&1
eval_tap $? 397 'AuthenticationWithPlatformLinkV4' test.out

#- 398 GenerateTokenByNewHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV4 \
    --additionalData 'bi9Bpte0' \
    --extendExp  \
    --linkingToken '79rwRK8d' \
    > test.out 2>&1
eval_tap $? 398 'GenerateTokenByNewHeadlessAccountV4' test.out

#- 399 Verify2faCodeV4
./ng net.accelbyte.sdk.cli.Main iam verify2faCodeV4 \
    --code 'WExClDTO' \
    --factor 'hxrFvdNM' \
    --mfaToken 'vgU7a8Ki' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 399 'Verify2faCodeV4' test.out

#- 400 PlatformTokenGrantV4
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV4 \
    --platformId 'oimFqbVr' \
    --codeChallenge 'QL0r5Ie7' \
    --codeChallengeMethod 'plain' \
    --additionalData 'k5607Faw' \
    --clientId 'knExgk7y' \
    --createHeadless  \
    --deviceId 'SjJ4nJme' \
    --macAddress 'k1SAHFzG' \
    --platformToken 'Eu8mos9Y' \
    --serviceLabel '0.5532679280996109' \
    --skipSetCookie  \
    > test.out 2>&1
eval_tap $? 400 'PlatformTokenGrantV4' test.out

#- 401 SimultaneousLoginV4
./ng net.accelbyte.sdk.cli.Main iam simultaneousLoginV4 \
    --codeChallenge 'Z7XIboMp' \
    --codeChallengeMethod 'plain' \
    --simultaneousPlatform 'VVespOPa' \
    --simultaneousTicket '6B7lJROw' \
    --nativePlatform 'epicgames' \
    --nativePlatformTicket '0S9zzciD' \
    > test.out 2>&1
eval_tap $? 401 'SimultaneousLoginV4' test.out

#- 402 TokenGrantV4
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV4 \
    --codeChallenge 'X1K06a9M' \
    --codeChallengeMethod 'plain' \
    --additionalData 'puDeY0xd' \
    --clientId 'lsROCWJD' \
    --clientSecret 'Tju5bB1U' \
    --code 'N8NxUqI4' \
    --codeVerifier '5EyqAgnj' \
    --extendNamespace 'tHWXz1cv' \
    --extendExp  \
    --loginQueueTicket 'ttm7l2YP' \
    --password 'CKEF2gAq' \
    --redirectUri 'Ga81Izth' \
    --refreshToken '5ZEXAykj' \
    --scope '4SxGwMhW' \
    --username 'relbbNo6' \
    --grantType 'client_credentials' \
    > test.out 2>&1
eval_tap $? 402 'TokenGrantV4' test.out

#- 403 RequestTargetTokenResponseV4
./ng net.accelbyte.sdk.cli.Main iam requestTargetTokenResponseV4 \
    --additionalData 'dHnu4oer' \
    --code '4YErCEvB' \
    > test.out 2>&1
eval_tap $? 403 'RequestTargetTokenResponseV4' test.out

#- 404 PublicListUserIDByPlatformUserIDsV4
./ng net.accelbyte.sdk.cli.Main iam publicListUserIDByPlatformUserIDsV4 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Ppj3U0GR' \
    --rawPUID  \
    --body '{"pidType": "TZTcGZOb", "platformUserIds": ["BtJRtvEF", "lLRG3Qr8", "UivpXzh1"]}' \
    > test.out 2>&1
eval_tap $? 404 'PublicListUserIDByPlatformUserIDsV4' test.out

#- 405 PublicGetUserByPlatformUserIDV4
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByPlatformUserIDV4 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'LZ6QxTUn' \
    --platformUserId 'VSv5VMIH' \
    > test.out 2>&1
eval_tap $? 405 'PublicGetUserByPlatformUserIDV4' test.out

#- 406 PublicCreateTestUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateTestUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "dV4ieUTK", "policyId": "ud8dEAW0", "policyVersionId": "sA9yJcqY"}, {"isAccepted": false, "localizedPolicyVersionId": "855AffWH", "policyId": "lvKphJ7a", "policyVersionId": "ACiBomZ2"}, {"isAccepted": true, "localizedPolicyVersionId": "BgcXNzFp", "policyId": "kzw91VkZ", "policyVersionId": "tPori5JB"}], "authType": "EMAILPASSWD", "country": "S2miY7Dx", "dateOfBirth": "8UGkv3WQ", "displayName": "cwhVDcVO", "emailAddress": "a8qW7u3C", "password": "55iBJEY0", "passwordMD5Sum": "zRrnPPMr", "uniqueDisplayName": "SxN46QiB", "username": "DlgCE0GO", "verified": true}' \
    > test.out 2>&1
eval_tap $? 406 'PublicCreateTestUserV4' test.out

#- 407 PublicCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "I7mExbdX", "policyId": "biW99xb5", "policyVersionId": "OXOuNafI"}, {"isAccepted": true, "localizedPolicyVersionId": "j0tyYGNQ", "policyId": "0yCe9Jr8", "policyVersionId": "Dzol7q2i"}, {"isAccepted": true, "localizedPolicyVersionId": "jdybahsJ", "policyId": "YU1quFK1", "policyVersionId": "CnkC3W4h"}], "authType": "EMAILPASSWD", "code": "9Ngndkqt", "country": "bES4xROP", "dateOfBirth": "gEdJ0Xkv", "displayName": "B2YGJTmf", "emailAddress": "KMiiBO4A", "password": "QJamQB2a", "passwordMD5Sum": "Q1coeFSa", "reachMinimumAge": true, "uniqueDisplayName": "m4m21mwI", "username": "ooHgXsP0"}' \
    > test.out 2>&1
eval_tap $? 407 'PublicCreateUserV4' test.out

#- 408 CreateUserFromInvitationV4
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV4 \
    --invitationId 'OCo0Eq5Q' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "G3zZZNo0", "policyId": "q8qBvySY", "policyVersionId": "QEP1byK2"}, {"isAccepted": true, "localizedPolicyVersionId": "YsLUrCyX", "policyId": "u4W9kUy4", "policyVersionId": "sFZ2C5OY"}, {"isAccepted": false, "localizedPolicyVersionId": "h4C0RWop", "policyId": "XflBA375", "policyVersionId": "qJ0WmHpC"}], "authType": "EMAILPASSWD", "code": "K1wOkGg0", "country": "SO3WpiW7", "dateOfBirth": "jRIGSSOI", "displayName": "Bzd4PhnS", "emailAddress": "990rmzX2", "password": "2OY0Y7cW", "passwordMD5Sum": "zLjFxrnb", "reachMinimumAge": true, "uniqueDisplayName": "HQGalee4", "username": "A1SXGHjd"}' \
    > test.out 2>&1
eval_tap $? 408 'CreateUserFromInvitationV4' test.out

#- 409 PublicUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "5nFx2kSA", "country": "FOXxnmFd", "dateOfBirth": "5oBNFf1V", "displayName": "eZHqge0C", "languageTag": "ugquuJMe", "uniqueDisplayName": "BucPEZzR", "userName": "njmJB4j7"}' \
    > test.out 2>&1
eval_tap $? 409 'PublicUpdateUserV4' test.out

#- 410 PublicUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "QhU01djS", "emailAddress": "WdHd5M22"}' \
    > test.out 2>&1
eval_tap $? 410 'PublicUpdateUserEmailAddressV4' test.out

#- 411 PublicUpgradeHeadlessAccountWithVerificationCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountWithVerificationCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "BkWs7xjR", "country": "pQOlBiGY", "dateOfBirth": "rcxtsHuS", "displayName": "Dbtqwwxs", "emailAddress": "DeEdZ8uk", "password": "eQOpDOec", "reachMinimumAge": true, "uniqueDisplayName": "4GijgAvT", "username": "TONjAJfc", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 411 'PublicUpgradeHeadlessAccountWithVerificationCodeV4' test.out

#- 412 PublicUpgradeHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"dateOfBirth": "tg9BT8X6", "displayName": "i2XJ86Pe", "emailAddress": "WKWdDXql", "password": "EiSw9Vvk", "uniqueDisplayName": "TujrI84C", "username": "L8eMk38I"}' \
    > test.out 2>&1
eval_tap $? 412 'PublicUpgradeHeadlessAccountV4' test.out

#- 413 PublicDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"factor": "UBSZWvBH", "mfaToken": "XNSlqbOL"}' \
    > test.out 2>&1
eval_tap $? 413 'PublicDisableMyAuthenticatorV4' test.out

#- 414 PublicEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    --code '5a9uUXSC' \
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
    --body '{"factor": "Yh39VCEf", "mfaToken": "VW2HQiuH"}' \
    > test.out 2>&1
eval_tap $? 418 'PublicDisableMyBackupCodesV4' test.out

#- 419 PublicDownloadMyBackupCodesV4
eval_tap 0 419 'PublicDownloadMyBackupCodesV4 # SKIP deprecated' test.out

#- 420 PublicEnableMyBackupCodesV4
eval_tap 0 420 'PublicEnableMyBackupCodesV4 # SKIP deprecated' test.out

#- 421 PublicGetBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGetBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --languageTag 'x8nL8tLJ' \
    > test.out 2>&1
eval_tap $? 421 'PublicGetBackupCodesV4' test.out

#- 422 PublicGenerateBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --languageTag '9IJTksfg' \
    > test.out 2>&1
eval_tap $? 422 'PublicGenerateBackupCodesV4' test.out

#- 423 PublicEnableBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --languageTag 'b5xlHfYr' \
    > test.out 2>&1
eval_tap $? 423 'PublicEnableBackupCodesV4' test.out

#- 424 PublicChallengeMyMFAV4
./ng net.accelbyte.sdk.cli.Main iam publicChallengeMyMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'BjeEHCea' \
    --factor 'lzD8KMkR' \
    > test.out 2>&1
eval_tap $? 424 'PublicChallengeMyMFAV4' test.out

#- 425 PublicRemoveTrustedDeviceV4
./ng net.accelbyte.sdk.cli.Main iam publicRemoveTrustedDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceToken 'NpTE2dNM' \
    > test.out 2>&1
eval_tap $? 425 'PublicRemoveTrustedDeviceV4' test.out

#- 426 PublicSendMyMFAEmailCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicSendMyMFAEmailCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --action 'ZKjrCsuv' \
    --languageTag '7hhXb9Sc' \
    > test.out 2>&1
eval_tap $? 426 'PublicSendMyMFAEmailCodeV4' test.out

#- 427 PublicDisableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyEmailV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"factor": "Lb5E7oi3", "mfaToken": "3D2Tn8bQ"}' \
    > test.out 2>&1
eval_tap $? 427 'PublicDisableMyEmailV4' test.out

#- 428 PublicEnableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyEmailV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'qQnedASL' \
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
    --factor 'GeDfGI4n' \
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
    --userId '2alenOsa' \
    > test.out 2>&1
eval_tap $? 433 'PublicGetUserPublicInfoByUserIdV4' test.out

#- 434 PublicInviteUserV4
./ng net.accelbyte.sdk.cli.Main iam publicInviteUserV4 \
    --body '{"additionalData": "XCSthyns", "emailAddress": "8fhOe12L", "languageTag": "6ZswEqa3", "namespace": "g5WdQttp", "namespaceDisplayName": "nCm6Mk4Y"}' \
    > test.out 2>&1
eval_tap $? 434 'PublicInviteUserV4' test.out

#- 435 PublicUpgradeHeadlessWithCodeV4Forward
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessWithCodeV4Forward \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "gZybTtL0", "policyId": "mrP247xZ", "policyVersionId": "amJg8G6g"}, {"isAccepted": true, "localizedPolicyVersionId": "ZFrIagR4", "policyId": "dI8ue4CJ", "policyVersionId": "dCUyKa0R"}, {"isAccepted": true, "localizedPolicyVersionId": "xAOmtbhy", "policyId": "FvXzRqzr", "policyVersionId": "TGAis7A3"}], "code": "ie0DkjBD", "country": "EINvn1qs", "dateOfBirth": "7GXEAuIe", "displayName": "Pv5jtP78", "emailAddress": "s186zcfH", "password": "Lo8EQrge", "reachMinimumAge": false, "uniqueDisplayName": "bCRKsKWd", "username": "5zsNSB9F", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 435 'PublicUpgradeHeadlessWithCodeV4Forward' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
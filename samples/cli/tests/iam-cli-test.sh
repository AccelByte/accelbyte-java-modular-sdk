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
    --body '{"modules": [{"docLink": "kQu7PlBz", "groups": [{"group": "PRYMDz1W", "groupId": "uC2S3hwp", "permissions": [{"allowedActions": [23, 28, 65], "resource": "OQTf1Z37"}, {"allowedActions": [84, 51, 14], "resource": "wFQpMZrT"}, {"allowedActions": [85, 68, 54], "resource": "ytWC2fxo"}]}, {"group": "dOndhbIp", "groupId": "doAWn3L8", "permissions": [{"allowedActions": [87, 45, 20], "resource": "WnVpv7xd"}, {"allowedActions": [2, 33, 82], "resource": "lLwsGE8K"}, {"allowedActions": [95, 61, 79], "resource": "ObsMfV8Y"}]}, {"group": "HsRaaglF", "groupId": "YBHtHmPa", "permissions": [{"allowedActions": [14, 76, 32], "resource": "WdLQYTVg"}, {"allowedActions": [28, 58, 14], "resource": "QQeLcXMd"}, {"allowedActions": [37, 58, 49], "resource": "4cx5TSlk"}]}], "module": "b5NayPjv", "moduleId": "sqo0Qnsv"}, {"docLink": "RpMKY2nL", "groups": [{"group": "ci58izlU", "groupId": "uyFm1aI1", "permissions": [{"allowedActions": [13, 0, 52], "resource": "sOBj8BrR"}, {"allowedActions": [84, 44, 32], "resource": "7dyv2r3k"}, {"allowedActions": [67, 30, 88], "resource": "AvRxVnRb"}]}, {"group": "13n8U6gG", "groupId": "4eEWwhzo", "permissions": [{"allowedActions": [68, 52, 83], "resource": "0eLPxuiK"}, {"allowedActions": [98, 91, 7], "resource": "0VQnhUtR"}, {"allowedActions": [71, 94, 71], "resource": "0MClv37M"}]}, {"group": "KeIBke07", "groupId": "ujWLr3HX", "permissions": [{"allowedActions": [8, 64, 84], "resource": "Tij90LtZ"}, {"allowedActions": [10, 84, 54], "resource": "OS7Tnf2X"}, {"allowedActions": [55, 80, 38], "resource": "4cnXwbp4"}]}], "module": "FOy3LiPk", "moduleId": "YftVJS9N"}, {"docLink": "hlcb208a", "groups": [{"group": "pVrR55mX", "groupId": "IJV3HNty", "permissions": [{"allowedActions": [20, 6, 88], "resource": "FPIpN9ix"}, {"allowedActions": [82, 91, 96], "resource": "znw4Z0nN"}, {"allowedActions": [55, 8, 89], "resource": "VRY4eIPW"}]}, {"group": "HPZUls0D", "groupId": "J4rCk73e", "permissions": [{"allowedActions": [42, 23, 0], "resource": "yaYTRX9d"}, {"allowedActions": [66, 8, 32], "resource": "kTLzfcL2"}, {"allowedActions": [56, 82, 4], "resource": "KcUgd1sE"}]}, {"group": "YuOfKH9w", "groupId": "VSAO16A3", "permissions": [{"allowedActions": [22, 33, 58], "resource": "FFf2oRky"}, {"allowedActions": [17, 91, 84], "resource": "DhEKhf7G"}, {"allowedActions": [37, 69, 59], "resource": "4xdbWpsN"}]}], "module": "6oUP04R1", "moduleId": "9iv4GaFm"}]}' \
    > test.out 2>&1
eval_tap $? 109 'AdminUpdateAvailablePermissionsByModule' test.out

#- 110 AdminDeleteConfigPermissionsByGroup
./ng net.accelbyte.sdk.cli.Main iam adminDeleteConfigPermissionsByGroup \
    --forceDelete  \
    --body '{"groupId": "LRTTSRql", "moduleId": "jrp3y92l"}' \
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
    --body '[{"field": "ieGNhmB0", "validation": {"allowAllSpecialCharacters": true, "allowDigit": true, "allowLetter": true, "allowSpace": true, "allowUnicode": false, "avatarConfig": {"allowedPrefixes": ["Pr9nXfr1", "tHAUvOJp", "Q37IlDYY"], "preferRegex": false, "regex": "gEZPtR6B"}, "blockedWord": ["7uBIcB7P", "ql22vCwe", "mNxhdXvn"], "description": [{"language": "VKN5ovvH", "message": ["ac298EyQ", "oIbdAoIa", "XTWfZ7mc"]}, {"language": "KAyXPc6K", "message": ["8Vszb4RJ", "cyVE9rco", "PtUemLCo"]}, {"language": "Rl1b5aHr", "message": ["gA4qWjSI", "eFHbjvZn", "OYn63Q5m"]}], "isCustomRegex": false, "letterCase": "ddv7FCDC", "maxLength": 96, "maxRepeatingAlphaNum": 69, "maxRepeatingSpecialCharacter": 83, "minCharType": 75, "minLength": 89, "profanityFilter": "0BguXTvN", "regex": "a6AMKkmn", "specialCharacterLocation": "Ika0ccMd", "specialCharacters": ["mhy5voRM", "7KGeaR0v", "88oYS7ja"]}}, {"field": "y7XxY5cw", "validation": {"allowAllSpecialCharacters": true, "allowDigit": true, "allowLetter": true, "allowSpace": false, "allowUnicode": true, "avatarConfig": {"allowedPrefixes": ["ecQy4hj2", "y6gDFKJb", "SGIDX4r3"], "preferRegex": true, "regex": "7rIZgHaU"}, "blockedWord": ["rATUs9yv", "qMJaTXTc", "31ygd5xu"], "description": [{"language": "AjHGrN5o", "message": ["cLV571EZ", "yDgxvO4X", "7Wo3SXum"]}, {"language": "9Plboz7C", "message": ["XDuLIo35", "VBLZDeoZ", "JsyWyg9U"]}, {"language": "K08laUC9", "message": ["iwTENvbY", "GLQaVAnQ", "vqXlXudH"]}], "isCustomRegex": false, "letterCase": "rEi2eYsw", "maxLength": 69, "maxRepeatingAlphaNum": 14, "maxRepeatingSpecialCharacter": 92, "minCharType": 31, "minLength": 81, "profanityFilter": "G6IeyW3L", "regex": "h14euCUs", "specialCharacterLocation": "U9HBHdMa", "specialCharacters": ["PJbDqtiN", "VlgAwwBL", "MfXswPZT"]}}, {"field": "qbEvCvj1", "validation": {"allowAllSpecialCharacters": true, "allowDigit": false, "allowLetter": false, "allowSpace": false, "allowUnicode": false, "avatarConfig": {"allowedPrefixes": ["YCGJfaDX", "QhGkzvlJ", "WmkacLgJ"], "preferRegex": false, "regex": "yzFO76F5"}, "blockedWord": ["pzzJJgaL", "nJvqk7pj", "YBB8B5Hw"], "description": [{"language": "qYyJkw47", "message": ["0RVJgvRN", "uu2tL2LK", "nNGElftP"]}, {"language": "CMUWBuVt", "message": ["iOSxO8pX", "ZEPOjinO", "rkFIhPDr"]}, {"language": "PVwuoS1y", "message": ["Wk7MKCtl", "JNBPubIe", "YelYqBLp"]}], "isCustomRegex": true, "letterCase": "pv3psQh7", "maxLength": 58, "maxRepeatingAlphaNum": 35, "maxRepeatingSpecialCharacter": 53, "minCharType": 71, "minLength": 9, "profanityFilter": "6lPrgiDR", "regex": "CNpvWlvk", "specialCharacterLocation": "OZCIoOor", "specialCharacters": ["UVpFTV7F", "YdCdFNnj", "c8HUprEs"]}}]' \
    > test.out 2>&1
eval_tap $? 113 'AdminUpdateInputValidations' test.out

#- 114 AdminResetInputValidations
./ng net.accelbyte.sdk.cli.Main iam adminResetInputValidations \
    --field 'RoN1uzQD' \
    > test.out 2>&1
eval_tap $? 114 'AdminResetInputValidations' test.out

#- 115 ListAdminsV3
./ng net.accelbyte.sdk.cli.Main iam listAdminsV3 \
    --namespace "$AB_NAMESPACE" \
    --after '1dyXvYVa' \
    --before '3R2Nc2XM' \
    --endDate 'ix7ZYema' \
    --limit '2' \
    --query 'n1vTaP9R' \
    --roleId '4Oy0Fnz0' \
    --startDate 'bmv0TGop' \
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
    --body '{"ageRestriction": 87, "enable": false}' \
    > test.out 2>&1
eval_tap $? 117 'AdminUpdateAgeRestrictionConfigV3' test.out

#- 118 AdminGetListCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminGetListCountryAgeRestrictionV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 118 'AdminGetListCountryAgeRestrictionV3' test.out

#- 119 AdminUpdateCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateCountryAgeRestrictionV3 \
    --countryCode 'ujZ7ImDg' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ageRestriction": 46}' \
    > test.out 2>&1
eval_tap $? 119 'AdminUpdateCountryAgeRestrictionV3' test.out

#- 120 AdminGetBannedUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType 'QCYJ9UmX' \
    --limit '9' \
    --offset '32' \
    > test.out 2>&1
eval_tap $? 120 'AdminGetBannedUsersV3' test.out

#- 121 AdminBanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"ban": "z5HGFUz3", "comment": "dEslO2xs", "endDate": "aToqdwIy", "reason": "9yTnJIH8", "skipNotif": false, "userIds": ["GiGw58n3", "dHCGgHrp", "rl2h4B7c"]}' \
    > test.out 2>&1
eval_tap $? 121 'AdminBanUserBulkV3' test.out

#- 122 AdminUnbanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminUnbanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"bans": [{"banId": "HfR6YCDZ", "userId": "qelwPrp9"}, {"banId": "UxlUnP8M", "userId": "MBKj5xVM"}, {"banId": "y63YUmoX", "userId": "JGCqjOdI"}]}' \
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
    --clientId 'VLnJrm5A' \
    --clientName 'm1BgGKG6' \
    --clientType 'FCVI6LPc' \
    --limit '35' \
    --offset '34' \
    --skipLoginQueue  \
    > test.out 2>&1
eval_tap $? 124 'AdminGetClientsByNamespaceV3' test.out

#- 125 AdminBulkUpdateClientsV3
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateClientsV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientIds": ["lzhN53jO", "WwxN8SZ0", "zqEbsywa"], "clientUpdateRequest": {"audiences": ["MIpswoiy", "hJvNgEPh", "FqmJYjBm"], "baseUri": "BsfTY3cZ", "clientName": "YPygGKp6", "clientPermissions": [{"action": 46, "resource": "JGjb1Fzg", "schedAction": 15, "schedCron": "axstGB0q", "schedRange": ["oddGyFRr", "QtBrDQOQ", "5QoywCSe"]}, {"action": 93, "resource": "GHOuWNbT", "schedAction": 7, "schedCron": "UVELeasD", "schedRange": ["gS0kccir", "09P70J62", "F13kMtFX"]}, {"action": 96, "resource": "kdn8i92E", "schedAction": 81, "schedCron": "EjipF1K1", "schedRange": ["C3YSCPSW", "Pw3mxRv1", "x6tGVhTc"]}], "clientPlatform": "BxdRirWw", "deletable": true, "description": "U8E9h054", "modulePermissions": [{"moduleId": "nbjBYKzZ", "selectedGroups": [{"groupId": "h4Lo4dSu", "selectedActions": [77, 67, 100]}, {"groupId": "lO8NFXUo", "selectedActions": [18, 7, 26]}, {"groupId": "yAiITIjx", "selectedActions": [59, 29, 71]}]}, {"moduleId": "B0r1zDZq", "selectedGroups": [{"groupId": "wIbmTciU", "selectedActions": [94, 7, 22]}, {"groupId": "WBkCbWEQ", "selectedActions": [59, 16, 44]}, {"groupId": "8LRJuT49", "selectedActions": [36, 79, 43]}]}, {"moduleId": "mjFYe7tI", "selectedGroups": [{"groupId": "ItBCHhZf", "selectedActions": [93, 49, 80]}, {"groupId": "u86EUJ2i", "selectedActions": [80, 60, 43]}, {"groupId": "IHSq0YeS", "selectedActions": [37, 12, 30]}]}], "namespace": "oanMlPEs", "oauthAccessTokenExpiration": 61, "oauthAccessTokenExpirationTimeUnit": "y3OJCzkV", "oauthRefreshTokenExpiration": 15, "oauthRefreshTokenExpirationTimeUnit": "0OLBDIDf", "redirectUri": "SjA8RjbF", "scopes": ["KBpVAkHp", "MS0qfJ5I", "KkikrRrC"], "skipLoginQueue": true, "twoFactorEnabled": true}}' \
    > test.out 2>&1
eval_tap $? 125 'AdminBulkUpdateClientsV3' test.out

#- 126 AdminCreateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateClientV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["0ZhOXCr8", "HEtk502l", "LmXDTRZq"], "baseUri": "Xog83YGW", "clientId": "WngdPlEk", "clientName": "GE68FpvP", "clientPermissions": [{"action": 15, "resource": "1kka35JU", "schedAction": 31, "schedCron": "xMSPEJuF", "schedRange": ["tdVVtiV3", "hMMofk0z", "SgzHMeNI"]}, {"action": 36, "resource": "gAVQsSBG", "schedAction": 0, "schedCron": "h87nleso", "schedRange": ["oapKz0z7", "CZpHf9aU", "edsQCq2S"]}, {"action": 74, "resource": "fxldUyBe", "schedAction": 59, "schedCron": "5zbnIaEx", "schedRange": ["Ajf7pAWA", "8jAjsGlG", "SnRcM1f0"]}], "clientPlatform": "mfNlu4GC", "deletable": false, "description": "Nu4mMExk", "modulePermissions": [{"moduleId": "8eI76E6i", "selectedGroups": [{"groupId": "e4uVLGbT", "selectedActions": [57, 85, 93]}, {"groupId": "Uu02TZSq", "selectedActions": [50, 51, 31]}, {"groupId": "nHdsDsEp", "selectedActions": [52, 49, 9]}]}, {"moduleId": "pG2mcuqT", "selectedGroups": [{"groupId": "gheULfJN", "selectedActions": [10, 79, 15]}, {"groupId": "ib8CpujO", "selectedActions": [88, 23, 28]}, {"groupId": "cjvPOYpJ", "selectedActions": [16, 75, 96]}]}, {"moduleId": "nfWKKOfe", "selectedGroups": [{"groupId": "IvgWlQ2P", "selectedActions": [53, 26, 32]}, {"groupId": "z2Y5iD1h", "selectedActions": [16, 79, 24]}, {"groupId": "NnnYjEhv", "selectedActions": [59, 57, 20]}]}], "namespace": "MQStOT26", "oauthAccessTokenExpiration": 45, "oauthAccessTokenExpirationTimeUnit": "TDuOHO1U", "oauthClientType": "V9pHa2MD", "oauthRefreshTokenExpiration": 64, "oauthRefreshTokenExpirationTimeUnit": "ic1dmPzE", "parentNamespace": "FzDb2jG9", "redirectUri": "ZEOneuKa", "scopes": ["h1ngfMKP", "B5AojZNF", "K1A8T5Of"], "secret": "iOlClWvY", "skipLoginQueue": true, "twoFactorEnabled": false}' \
    > test.out 2>&1
eval_tap $? 126 'AdminCreateClientV3' test.out

#- 127 AdminGetClientsbyNamespacebyIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetClientsbyNamespacebyIDV3 \
    --clientId 'zcS161Zp' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 127 'AdminGetClientsbyNamespacebyIDV3' test.out

#- 128 AdminDeleteClientV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientV3 \
    --clientId 'uOcfDKVt' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 128 'AdminDeleteClientV3' test.out

#- 129 AdminUpdateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientV3 \
    --clientId 'fioawSZc' \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["GlwZQhZJ", "7DYVMxAB", "IErMDEtP"], "baseUri": "bMAonbiU", "clientName": "iKMBeH5h", "clientPermissions": [{"action": 45, "resource": "js7cNhxS", "schedAction": 91, "schedCron": "PSZugMVh", "schedRange": ["WAVUx9d9", "FI8szXnq", "IXKarLJu"]}, {"action": 36, "resource": "4ob0cgsT", "schedAction": 59, "schedCron": "Ajpo7cxC", "schedRange": ["xmwYqgDk", "CSFutiqI", "GyALaAPj"]}, {"action": 18, "resource": "CAQrLYNH", "schedAction": 81, "schedCron": "I1VrzbC8", "schedRange": ["rYc8eqtq", "OeM1Z0Eg", "UaAo7C6N"]}], "clientPlatform": "RgpARhpI", "deletable": true, "description": "XfOWDOo0", "modulePermissions": [{"moduleId": "5VJn3peK", "selectedGroups": [{"groupId": "aKwVtKDM", "selectedActions": [73, 78, 19]}, {"groupId": "vn0xpYYS", "selectedActions": [43, 8, 96]}, {"groupId": "dkQQwBJZ", "selectedActions": [34, 2, 5]}]}, {"moduleId": "prNbEmkB", "selectedGroups": [{"groupId": "842lMOI6", "selectedActions": [7, 52, 19]}, {"groupId": "abz4K6Nr", "selectedActions": [99, 40, 67]}, {"groupId": "R09Sy1YS", "selectedActions": [34, 15, 97]}]}, {"moduleId": "wIXYiu93", "selectedGroups": [{"groupId": "BiSFuOuJ", "selectedActions": [83, 3, 60]}, {"groupId": "MC8LI6N6", "selectedActions": [42, 23, 37]}, {"groupId": "mmei3yNx", "selectedActions": [16, 30, 18]}]}], "namespace": "MKSEHrbC", "oauthAccessTokenExpiration": 96, "oauthAccessTokenExpirationTimeUnit": "ENF7K6r7", "oauthRefreshTokenExpiration": 74, "oauthRefreshTokenExpirationTimeUnit": "AeN8EHMO", "redirectUri": "H0Y8m6qm", "scopes": ["0aYt0FRf", "6HJKkHmt", "g7fSasOH"], "skipLoginQueue": false, "twoFactorEnabled": true}' \
    > test.out 2>&1
eval_tap $? 129 'AdminUpdateClientV3' test.out

#- 130 AdminUpdateClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientPermissionV3 \
    --clientId '5LVARIfe' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 79, "resource": "JxwNLKIi"}, {"action": 27, "resource": "LWCF7GhE"}, {"action": 17, "resource": "8Rrs8mdn"}]}' \
    > test.out 2>&1
eval_tap $? 130 'AdminUpdateClientPermissionV3' test.out

#- 131 AdminAddClientPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddClientPermissionsV3 \
    --clientId 'gJBq7WXQ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 87, "resource": "rq7dvNnh"}, {"action": 18, "resource": "Xm1WaGbj"}, {"action": 2, "resource": "9SsMfTdJ"}]}' \
    > test.out 2>&1
eval_tap $? 131 'AdminAddClientPermissionsV3' test.out

#- 132 AdminDeleteClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientPermissionV3 \
    --action '25' \
    --clientId 'Ub8tjLbL' \
    --namespace "$AB_NAMESPACE" \
    --resource 'q8N26Deb' \
    > test.out 2>&1
eval_tap $? 132 'AdminDeleteClientPermissionV3' test.out

#- 133 AdminGetConfigValueV3
./ng net.accelbyte.sdk.cli.Main iam adminGetConfigValueV3 \
    --configKey 'SWzmCYSM' \
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
    --body '{"blacklist": ["ZEQZdE0D", "OvdBZoy6", "VhdMe4fz"]}' \
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
    --body '{"active": true, "roleIds": ["NpOaRVLg", "w0zyYChL", "7vroBmWI"]}' \
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
    --limit '83' \
    --offset '66' \
    > test.out 2>&1
eval_tap $? 141 'RetrieveAllSSOLoginPlatformCredentialV3' test.out

#- 142 RetrieveThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '4r59uCJX' \
    > test.out 2>&1
eval_tap $? 142 'RetrieveThirdPartyLoginPlatformCredentialV3' test.out

#- 143 AddThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam addThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'w4gbw6yL' \
    --body '{"ACSURL": "fjSCACX3", "AWSCognitoRegion": "LStdGY3H", "AWSCognitoUserPool": "iMb26edq", "AllowedClients": ["EwVM4AgQ", "wOUygGE1", "oKTSRYgz"], "AppId": "Lv1GnU9H", "AuthorizationEndpoint": "j52SCJ9M", "ClientId": "9aPpNmzk", "EmptyStrFieldList": ["f4s0KG7j", "0S5SDbUy", "qf8hmwEt"], "EnableServerLicenseValidation": true, "Environment": "cFq2AuUk", "FederationMetadataURL": "rHbSgCKz", "GenericOauthFlow": true, "IncludePUID": false, "IsActive": false, "Issuer": "ITwX4CJp", "JWKSEndpoint": "AUgRAVBx", "KeyID": "NlFrfzzi", "LogoURL": "WQKuJfIi", "NetflixCertificates": {"encryptedPrivateKey": "rhgeBVOF", "encryptedPrivateKeyName": "sRuGboeA", "publicCertificate": "EWykWkpX", "publicCertificateName": "CJ9fv2cQ", "rootCertificate": "KV89Hx6U", "rootCertificateName": "2zo9eTWv"}, "OrganizationId": "cHiB9BtN", "PlatformName": "7dYSInfz", "PrivateKey": "Q8BoFNFp", "RedirectUri": "o5uP4aeI", "RegisteredDomains": [{"affectedClientIDs": ["U6j11jNl", "cofd0SN4", "wL7wzhDG"], "domain": "pdLszbLu", "namespaces": ["t3hdazai", "r4LhU3Cs", "wVQWmRlJ"], "roleId": "8VQVUqhv", "ssoCfg": {"googleKey": {"UH7bFkBf": {}, "041jXnF9": {}, "kSXBvJhA": {}}, "groupConfigs": [{"assignNamespaces": ["jyfAt4FW", "aLp7Qqv9", "gF46xx8q"], "group": "YlMG5r9c", "roleId": "kzJzy98e"}, {"assignNamespaces": ["l3vDXwMm", "tm01VkVl", "rNKMLqYp"], "group": "Aood3CDc", "roleId": "IZgBcoIv"}, {"assignNamespaces": ["R3wwbEE0", "3lRT9vOY", "p7RM6LmV"], "group": "VZroCggU", "roleId": "8WmdCv07"}]}}, {"affectedClientIDs": ["6KzCRIYQ", "C7vSCalB", "KAC6bgWR"], "domain": "8219PaTk", "namespaces": ["We4l8oPZ", "UqdDBn7C", "38zNosrO"], "roleId": "CXtHfuIq", "ssoCfg": {"googleKey": {"xdd19Crj": {}, "EEpjoC8F": {}, "TlxpUb6W": {}}, "groupConfigs": [{"assignNamespaces": ["1KV7eFYI", "deokjd2S", "9y6j2cwV"], "group": "PAO5L0zJ", "roleId": "TUEZbpni"}, {"assignNamespaces": ["NAjwIe5e", "z36XPYne", "AmTTIhhn"], "group": "cQat70hh", "roleId": "VonPAFQM"}, {"assignNamespaces": ["tWHoMc7S", "Ry9HmBsr", "K1GXnnDZ"], "group": "PvvAUgrn", "roleId": "FCQeQ5xA"}]}}, {"affectedClientIDs": ["LBSvbRAQ", "yCIsDrc3", "QXqo5Juz"], "domain": "si8Vh5KM", "namespaces": ["GcZkbWFp", "PmxeYbKj", "AX5YtrOn"], "roleId": "7WXGFfTZ", "ssoCfg": {"googleKey": {"2NPIUXgI": {}, "ODBAC14C": {}, "fP81N9VA": {}}, "groupConfigs": [{"assignNamespaces": ["Zu2QUqWN", "Oaa88d6H", "DDH8K6Dv"], "group": "ViXnfz6z", "roleId": "C0Bu3J0l"}, {"assignNamespaces": ["Vsxm68nR", "RSlhqDKu", "p77pJcmg"], "group": "deVQ2jPs", "roleId": "psy2qdTf"}, {"assignNamespaces": ["hb1Tkys6", "EhoBfnR0", "h3Hlx4vw"], "group": "vDkXrXJv", "roleId": "FjkzJNAX"}]}}], "RelyingParty": "2AUTEmiL", "SandboxId": "nMHpNdAF", "Secret": "Otlkdqxi", "TeamID": "8VVvezAN", "TokenAuthenticationType": "VboFBtuA", "TokenClaimsMapping": {"VGnVgrdH": "H8SGlnzc", "uJoJygZp": "imMk5GwZ", "jQetqnb2": "x9oQvq8E"}, "TokenEndpoint": "yGlQoV1Q", "UserInfoEndpoint": "BnYxGCcY", "UserInfoHTTPMethod": "KyRhYkZ2", "googleAdminConsoleKey": "FepNV4Pw", "scopes": ["ImkenISw", "VM9KPh3b", "JRdPPW6i"]}' \
    > test.out 2>&1
eval_tap $? 143 'AddThirdPartyLoginPlatformCredentialV3' test.out

#- 144 DeleteThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'KTAIzp2N' \
    > test.out 2>&1
eval_tap $? 144 'DeleteThirdPartyLoginPlatformCredentialV3' test.out

#- 145 UpdateThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '2n9SxAUi' \
    --body '{"ACSURL": "lRgyMOhf", "AWSCognitoRegion": "MsemDg9m", "AWSCognitoUserPool": "XzhzVE2g", "AllowedClients": ["oIbJLhxZ", "nGSKNcNY", "ISkLSDZD"], "AppId": "ZJWf465i", "AuthorizationEndpoint": "czaCx7Gk", "ClientId": "HvREB7R0", "EmptyStrFieldList": ["2NsqHqok", "FooEEmDu", "dEP4uZhT"], "EnableServerLicenseValidation": true, "Environment": "90HwDate", "FederationMetadataURL": "RPSnTFIu", "GenericOauthFlow": true, "IncludePUID": false, "IsActive": true, "Issuer": "w7JSk2M8", "JWKSEndpoint": "RKhsS47K", "KeyID": "nqZzbBxe", "LogoURL": "pgCl876p", "NetflixCertificates": {"encryptedPrivateKey": "okdsAKtu", "encryptedPrivateKeyName": "WuKkvlBO", "publicCertificate": "bKfd3YRq", "publicCertificateName": "fCGgE68z", "rootCertificate": "MnxKstx5", "rootCertificateName": "NjcJxL8Z"}, "OrganizationId": "2ihQQ1ry", "PlatformName": "7YwdnwCQ", "PrivateKey": "b3w0yFpq", "RedirectUri": "KfxzLZq0", "RegisteredDomains": [{"affectedClientIDs": ["2dyY2Vl0", "sxi80AHr", "VouHvBp9"], "domain": "P71csq3i", "namespaces": ["TnKGQorI", "P0yxxEoo", "1BznjVat"], "roleId": "M0TF2sfv", "ssoCfg": {"googleKey": {"bCTeaaez": {}, "vzsmdatT": {}, "2LSg0AYx": {}}, "groupConfigs": [{"assignNamespaces": ["Q3YfrOod", "9RPBUgi3", "8icmed3z"], "group": "dKEwQNMm", "roleId": "yanXm6aS"}, {"assignNamespaces": ["veIpc1VL", "ilfXMtWa", "i6wlzx5o"], "group": "WfD0HjEQ", "roleId": "x5uy93t8"}, {"assignNamespaces": ["AZTdPbif", "z5XFDKwr", "cyrJZoii"], "group": "NlVmHOPZ", "roleId": "Ra9iJb3j"}]}}, {"affectedClientIDs": ["5iH7hAxj", "Ugwz7d6o", "DV1MaSkC"], "domain": "BnUnAsu7", "namespaces": ["KYCPDFPi", "Qqf74uVo", "f3wbw2ef"], "roleId": "Eo6iuHEx", "ssoCfg": {"googleKey": {"7LKxNvOo": {}, "2TTnlJuP": {}, "UYnSZJHb": {}}, "groupConfigs": [{"assignNamespaces": ["OZVOsz5e", "CBplcPIw", "zQaaFhAj"], "group": "xFt2QqZH", "roleId": "4zOiUEVY"}, {"assignNamespaces": ["nkxLZWuD", "NBKQzENz", "pN9ID1Va"], "group": "1z0eKhXm", "roleId": "cqKk2Rig"}, {"assignNamespaces": ["kYZXB0lt", "HVXhIr7Q", "tYmQzRBY"], "group": "pAGtSvIB", "roleId": "2DPiNRPH"}]}}, {"affectedClientIDs": ["rtcCTAwD", "40upt79N", "NCwo8g4T"], "domain": "ye8JjnOm", "namespaces": ["26iy0zle", "uQLIOKS3", "JbAEKlWv"], "roleId": "E6stBgut", "ssoCfg": {"googleKey": {"CsiRMZgm": {}, "ZHTBESPh": {}, "RY9QsmjK": {}}, "groupConfigs": [{"assignNamespaces": ["7lUL1sYY", "3DR1qDOg", "wtaD2yCZ"], "group": "QPZavtmb", "roleId": "YPnBwjqC"}, {"assignNamespaces": ["149QCVNu", "iG67nUPi", "gD4nQWdE"], "group": "LSOlJ5Zy", "roleId": "ySioGhcS"}, {"assignNamespaces": ["a6DPBaqN", "ZvFVQAp8", "ViwtroQL"], "group": "kxMpjcTU", "roleId": "791uQNya"}]}}], "RelyingParty": "6BWMbQmY", "SandboxId": "6nvhtMKk", "Secret": "1pWQ7bJ6", "TeamID": "ZJlTzz3f", "TokenAuthenticationType": "334VmTHh", "TokenClaimsMapping": {"MaRw8W03": "8bUupj1x", "QNFfsjfe": "Fd1lQYA0", "bSHTcdON": "yZE9rQKG"}, "TokenEndpoint": "5FueJZwm", "UserInfoEndpoint": "xmwu7hyP", "UserInfoHTTPMethod": "SxrjdS3e", "googleAdminConsoleKey": "MbQdMKkX", "scopes": ["zQ2YS0gU", "opHSnoyv", "xVDAXfBr"]}' \
    > test.out 2>&1
eval_tap $? 145 'UpdateThirdPartyLoginPlatformCredentialV3' test.out

#- 146 UpdateThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'PmWLlWNy' \
    --body '{"affectedClientIDs": ["OSpM6Iar", "77nsxTFz", "8Qawv1Ge"], "assignedNamespaces": ["TaS3fl1m", "nEx07SFr", "eLrqLnIU"], "domain": "qy6PpoSm", "roleId": "081W5djK", "ssoCfg": {"googleKey": {"lgiRLv3a": {}, "E2oE8HxC": {}, "yIAwR37c": {}}, "groupConfigs": [{"assignNamespaces": ["CgHk94Au", "gDEM8BzJ", "XqHWOQAg"], "group": "BmYGGGkI", "roleId": "EeFdM1hq"}, {"assignNamespaces": ["qMGF2tgh", "7Vk5jmIt", "B9rIh813"], "group": "EK4z5o2v", "roleId": "sDq9Ltob"}, {"assignNamespaces": ["yUnr1H2V", "YYSeSyy0", "YIC1KRNF"], "group": "W7qFEwXc", "roleId": "xJYk821f"}]}}' \
    > test.out 2>&1
eval_tap $? 146 'UpdateThirdPartyLoginPlatformDomainV3' test.out

#- 147 DeleteThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'BYn9MNFj' \
    --body '{"domain": "5ZGUEOh6", "ssoGroups": ["3WrtKGkK", "9oSWxwzO", "90Pt3F54"]}' \
    > test.out 2>&1
eval_tap $? 147 'DeleteThirdPartyLoginPlatformDomainV3' test.out

#- 148 PartialUpdateThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam partialUpdateThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'QPzSN5hu' \
    --body '{"affectedClientIDs": ["c8hyP0qC", "DC70A2Ca", "Uk56DGQ4"], "assignedNamespaces": ["OemyR1by", "3YrD4fEo", "r7vC5jIx"], "domain": "ozVdRXoD", "roleId": "qsOgiXFx", "ssoCfg": {"googleKey": {"m2F4R2Zz": {}, "CnTBroJ5": {}, "8YQj8ZCe": {}}, "groupConfigs": [{"assignNamespaces": ["11i1GDgv", "45TKecQv", "6ltmQvfH"], "group": "OHyS2CCI", "roleId": "pzMIKkPQ"}, {"assignNamespaces": ["xXA9lK4b", "drBxoaAH", "qtkHIbKT"], "group": "fxczrcai", "roleId": "26Eg8ps3"}, {"assignNamespaces": ["wf6c9Xss", "lw5CdT9N", "OH5zB6JF"], "group": "86Q7wUZR", "roleId": "M6v5ru9t"}]}}' \
    > test.out 2>&1
eval_tap $? 148 'PartialUpdateThirdPartyLoginPlatformDomainV3' test.out

#- 149 RetrieveSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam retrieveSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'deF68ARQ' \
    > test.out 2>&1
eval_tap $? 149 'RetrieveSSOLoginPlatformCredential' test.out

#- 150 AddSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam addSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'yo5eFNW3' \
    --body '{"acsUrl": "yre5ZiKg", "apiKey": "0muDlgiQ", "appId": "od1DKOlI", "federationMetadataUrl": "MSEcp8po", "isActive": true, "redirectUri": "0FOOZBec", "secret": "AwFa9DNh", "ssoUrl": "6ujobZbV"}' \
    > test.out 2>&1
eval_tap $? 150 'AddSSOLoginPlatformCredential' test.out

#- 151 DeleteSSOLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteSSOLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'kCxyfgph' \
    > test.out 2>&1
eval_tap $? 151 'DeleteSSOLoginPlatformCredentialV3' test.out

#- 152 UpdateSSOPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam updateSSOPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'HtL7B9JZ' \
    --body '{"acsUrl": "wmzMTZzP", "apiKey": "Jkbv3dJg", "appId": "Uy6EtDqj", "federationMetadataUrl": "XXZyIh2t", "isActive": false, "redirectUri": "9ZbN6UwD", "secret": "kQIhA0Oj", "ssoUrl": "eBbSfFvg"}' \
    > test.out 2>&1
eval_tap $? 152 'UpdateSSOPlatformCredential' test.out

#- 153 AdminListUserIDByPlatformUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByPlatformUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'KlBBNDI3' \
    --rawPID  \
    --rawPUID  \
    --body '{"platformUserIds": ["AntTqpDE", "Bc7lo5aW", "17dqmNp1"]}' \
    > test.out 2>&1
eval_tap $? 153 'AdminListUserIDByPlatformUserIDsV3' test.out

#- 154 AdminGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Fghsjz9m' \
    --platformUserId 'u7HLWKbf' \
    --pidType 'KHJYSIZB' \
    > test.out 2>&1
eval_tap $? 154 'AdminGetUserByPlatformUserIDV3' test.out

#- 155 AdminGetProfileUpdateStrategyV3
./ng net.accelbyte.sdk.cli.Main iam adminGetProfileUpdateStrategyV3 \
    --namespace "$AB_NAMESPACE" \
    --field 'country' \
    > test.out 2>&1
eval_tap $? 155 'AdminGetProfileUpdateStrategyV3' test.out

#- 156 AdminUpdateProfileUpdateStrategyV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateProfileUpdateStrategyV3 \
    --namespace "$AB_NAMESPACE" \
    --field 'display_name' \
    --body '{"config": {"minimumAllowedInterval": 48}, "type": "SuriJq8p"}' \
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
    --identity 'USER' \
    --body '{"additions": [{"actions": [85, 6, 62], "resource": "QHmCj6if"}, {"actions": [6, 22, 75], "resource": "MbeSAUsJ"}, {"actions": [20, 84, 61], "resource": "M3MwWEPs"}], "exclusions": [{"actions": [74, 90, 96], "resource": "fSypBVd6"}, {"actions": [65, 91, 86], "resource": "lVh8iPej"}, {"actions": [70, 44, 89], "resource": "piDTH8aJ"}], "overrides": [{"actions": [11, 69, 41], "resource": "XprBwX2k"}, {"actions": [23, 3, 49], "resource": "L4ddF4lN"}, {"actions": [13, 6, 29], "resource": "TOsiEULE"}], "replacements": [{"replacement": {"actions": [50, 4, 67], "resource": "4zLl6g0s"}, "target": "qy25c1m0"}, {"replacement": {"actions": [24, 76, 36], "resource": "ChLkMDTS"}, "target": "iPx2kvWx"}, {"replacement": {"actions": [20, 58, 67], "resource": "ugSk1Yzj"}, "target": "g9sp36ty"}]}' \
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
    --identity 'USER' \
    --body '{"active": true}' \
    > test.out 2>&1
eval_tap $? 160 'AdminChangeRoleOverrideConfigStatusV3' test.out

#- 161 AdminGetRoleNamespacePermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleNamespacePermissionV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId '9iTrSkNb' \
    > test.out 2>&1
eval_tap $? 161 'AdminGetRoleNamespacePermissionV3' test.out

#- 162 GetAdminUsersByRoleIdV3
./ng net.accelbyte.sdk.cli.Main iam getAdminUsersByRoleIdV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId '9stoJS8D' \
    --after '25' \
    --before '97' \
    --limit '72' \
    > test.out 2>&1
eval_tap $? 162 'GetAdminUsersByRoleIdV3' test.out

#- 163 AdminQueryTagV3
./ng net.accelbyte.sdk.cli.Main iam adminQueryTagV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '22' \
    --offset '39' \
    --tagName 'k7dJL23y' \
    > test.out 2>&1
eval_tap $? 163 'AdminQueryTagV3' test.out

#- 164 AdminCreateTagV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateTagV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"tagName": "w0ZyNjuz"}' \
    > test.out 2>&1
eval_tap $? 164 'AdminCreateTagV3' test.out

#- 165 AdminUpdateTagV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateTagV3 \
    --namespace "$AB_NAMESPACE" \
    --tagId 'Z1r3XzMb' \
    --body '{"tagName": "vjLyZiff"}' \
    > test.out 2>&1
eval_tap $? 165 'AdminUpdateTagV3' test.out

#- 166 AdminDeleteTagV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteTagV3 \
    --namespace "$AB_NAMESPACE" \
    --tagId 'UHsAJcxn' \
    > test.out 2>&1
eval_tap $? 166 'AdminDeleteTagV3' test.out

#- 167 AdminGetUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --emailAddress '1fFLyQBh' \
    > test.out 2>&1
eval_tap $? 167 'AdminGetUserByEmailAddressV3' test.out

#- 168 AdminBulkUpdateUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"updateRequest": {"skipLoginQueue": true}, "userIds": ["8EBMKNGL", "OFpHCjkf", "3rJXkYMh"]}' \
    > test.out 2>&1
eval_tap $? 168 'AdminBulkUpdateUsersV3' test.out

#- 169 AdminGetBulkUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType 'S1KZilo8' \
    --body '{"bulkUserId": ["sjWlJ87A", "7j4sPMCz", "qihnNCyk"]}' \
    > test.out 2>&1
eval_tap $? 169 'AdminGetBulkUserBanV3' test.out

#- 170 AdminListUserIDByUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"findByPublisherNamespace": true, "userIds": ["1CGcVgMZ", "ygr2yC5A", "dZzTGghN"]}' \
    > test.out 2>&1
eval_tap $? 170 'AdminListUserIDByUserIDsV3' test.out

#- 171 AdminBulkGetUsersPlatform
./ng net.accelbyte.sdk.cli.Main iam adminBulkGetUsersPlatform \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["x5ZT9iZY", "t29kBLKV", "QOBHMP0W"]}' \
    > test.out 2>&1
eval_tap $? 171 'AdminBulkGetUsersPlatform' test.out

#- 172 AdminCursorGetUserV3
./ng net.accelbyte.sdk.cli.Main iam adminCursorGetUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"cursor": {"cursorTime": "OlYV0LOy", "userId": "5ibJY397"}, "fields": ["Mvh0Q1Oy", "RnmH4qMP", "VgBzHu2V"], "limit": 25}' \
    > test.out 2>&1
eval_tap $? 172 'AdminCursorGetUserV3' test.out

#- 173 AdminInviteUserV3
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddresses": ["jQ3XpwoD", "bOmuuSpX", "hKxq10M3"], "isAdmin": false, "languageTag": "nUishGrY", "namespace": "9zEYPYsQ", "roles": ["0TYnPJdE", "1nq8BUjs", "VTm0XJxa"]}' \
    > test.out 2>&1
eval_tap $? 173 'AdminInviteUserV3' test.out

#- 174 AdminQueryThirdPlatformLinkHistoryV3
./ng net.accelbyte.sdk.cli.Main iam adminQueryThirdPlatformLinkHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '92' \
    --offset '15' \
    --platformUserId 'MXpsykHX' \
    --platformId 'gmtLjSFO' \
    > test.out 2>&1
eval_tap $? 174 'AdminQueryThirdPlatformLinkHistoryV3' test.out

#- 175 AdminListUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminListUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '88' \
    --offset '36' \
    > test.out 2>&1
eval_tap $? 175 'AdminListUsersV3' test.out

#- 176 AdminSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam adminSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'DwcVFhoE' \
    --endDate 'GHgUczPp' \
    --includeTotal  \
    --limit '47' \
    --offset '98' \
    --platformBy 'e9tFROO3' \
    --platformId 'BPCcL7jB' \
    --query 'JUkpFaCw' \
    --roleIds 'NiFbZ1KB' \
    --selectedFields '90654fo6' \
    --skipLoginQueue  \
    --startDate 'v3hobgs9' \
    --tagIds 'XlJzfYjn' \
    --testAccount  \
    > test.out 2>&1
eval_tap $? 176 'AdminSearchUserV3' test.out

#- 177 AdminGetBulkUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"listEmailAddressRequest": ["aA9A7lK8", "sZqMOKEi", "ytawuzyI"]}' \
    > test.out 2>&1
eval_tap $? 177 'AdminGetBulkUserByEmailAddressV3' test.out

#- 178 AdminGetUserByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'vfIX5Fpe' \
    > test.out 2>&1
eval_tap $? 178 'AdminGetUserByUserIdV3' test.out

#- 179 AdminUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'lfSKE6vR' \
    --body '{"avatarUrl": "CzJM6v0P", "country": "TTOoqjFC", "dateOfBirth": "VK5hLVUB", "displayName": "aU1zZdFp", "languageTag": "QJHQS2Ws", "skipLoginQueue": false, "tags": ["NAvk5NAB", "B4Cqzz8d", "RzLM2fvn"], "uniqueDisplayName": "GP29MTy0", "userName": "yPhODDKH"}' \
    > test.out 2>&1
eval_tap $? 179 'AdminUpdateUserV3' test.out

#- 180 AdminGetUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'pAagsVeP' \
    --activeOnly  \
    --after 'xxS5jspD' \
    --before 'MeLyQGi1' \
    --limit '39' \
    > test.out 2>&1
eval_tap $? 180 'AdminGetUserBanV3' test.out

#- 181 AdminBanUserV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'onnbnyN2' \
    --body '{"ban": "dehyTneQ", "comment": "kptmErbt", "endDate": "6RGibKCA", "reason": "B7uQ3XmD", "skipNotif": false}' \
    > test.out 2>&1
eval_tap $? 181 'AdminBanUserV3' test.out

#- 182 AdminGetUserBanSummaryV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanSummaryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'yHbe4FDF' \
    > test.out 2>&1
eval_tap $? 182 'AdminGetUserBanSummaryV3' test.out

#- 183 AdminUpdateUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserBanV3 \
    --banId 'u3BFhO4s' \
    --namespace "$AB_NAMESPACE" \
    --userId 'HVaGi0ds' \
    --body '{"enabled": true, "skipNotif": true}' \
    > test.out 2>&1
eval_tap $? 183 'AdminUpdateUserBanV3' test.out

#- 184 AdminSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'rnARnzpN' \
    --body '{"context": "uJ0mlnZo", "emailAddress": "31vHK36c", "languageTag": "tehDfLzG", "upgradeToken": "RBVSDHUR"}' \
    > test.out 2>&1
eval_tap $? 184 'AdminSendVerificationCodeV3' test.out

#- 185 AdminVerifyAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'WALX7At0' \
    --body '{"Code": "VQDkFbur", "ContactType": "vNOAbRY6", "LanguageTag": "oOO66Er3", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 185 'AdminVerifyAccountV3' test.out

#- 186 GetUserVerificationCode
./ng net.accelbyte.sdk.cli.Main iam getUserVerificationCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'oI5VLhhx' \
    > test.out 2>&1
eval_tap $? 186 'GetUserVerificationCode' test.out

#- 187 AdminGetUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '7FB79Ptd' \
    > test.out 2>&1
eval_tap $? 187 'AdminGetUserDeletionStatusV3' test.out

#- 188 AdminUpdateUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'NRdqShQq' \
    --body '{"deletionDate": 14, "enabled": true}' \
    > test.out 2>&1
eval_tap $? 188 'AdminUpdateUserDeletionStatusV3' test.out

#- 189 AdminListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'uiDoDA2h' \
    > test.out 2>&1
eval_tap $? 189 'AdminListUserAllPlatformAccountsDistinctV3' test.out

#- 190 AdminUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ltX4uOYi' \
    --body '{"code": "oKdoK3Hw", "country": "9GuRCr3L", "dateOfBirth": "6cSuOtwS", "displayName": "n4x3QoGi", "emailAddress": "MF85qt6o", "password": "EEeYFBCe", "uniqueDisplayName": "xUkxHo5m", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 190 'AdminUpgradeHeadlessAccountV3' test.out

#- 191 AdminDeleteUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Y3eW2PhX' \
    > test.out 2>&1
eval_tap $? 191 'AdminDeleteUserInformationV3' test.out

#- 192 AdminGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '1uKGGnAe' \
    --after '0.6804287021521402' \
    --before '0.018359704496511586' \
    --limit '41' \
    > test.out 2>&1
eval_tap $? 192 'AdminGetUserLoginHistoriesV3' test.out

#- 193 AdminResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam adminResetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'YScJkeTg' \
    --body '{"languageTag": "0Gl6N3bm", "mfaToken": "deSQMJrI", "newPassword": "GYuQSrwF", "oldPassword": "FkXaAMQA"}' \
    > test.out 2>&1
eval_tap $? 193 'AdminResetPasswordV3' test.out

#- 194 AdminUpdateUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserPermissionV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'xXwxJeMC' \
    --body '{"Permissions": [{"Action": 44, "Resource": "9IpefiCL", "SchedAction": 92, "SchedCron": "HF7xUYeI", "SchedRange": ["kvBL562M", "jRvTFNkr", "NKTi1pgm"]}, {"Action": 55, "Resource": "mn5kN3zX", "SchedAction": 46, "SchedCron": "vy0ts0pE", "SchedRange": ["P93eY34l", "Q06NK2Wx", "UOoIxO8U"]}, {"Action": 43, "Resource": "gF2Z01yh", "SchedAction": 50, "SchedCron": "kf3MNtQR", "SchedRange": ["k8WP37iU", "xdgK3I6u", "3E64aFrr"]}]}' \
    > test.out 2>&1
eval_tap $? 194 'AdminUpdateUserPermissionV3' test.out

#- 195 AdminAddUserPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserPermissionsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'iW91Z1JP' \
    --body '{"Permissions": [{"Action": 14, "Resource": "LFEwBzof", "SchedAction": 14, "SchedCron": "T4U7b3SD", "SchedRange": ["Ov5ybNSo", "PxGlHnnm", "BZyIhNls"]}, {"Action": 76, "Resource": "SekjnZ9Y", "SchedAction": 11, "SchedCron": "nsblmCKw", "SchedRange": ["szvUMMa4", "u4KuFntN", "LAgbZlNZ"]}, {"Action": 35, "Resource": "p4VR6dWH", "SchedAction": 87, "SchedCron": "XkRDtCNz", "SchedRange": ["O2EaasAT", "0xabmIps", "qWt8E9G6"]}]}' \
    > test.out 2>&1
eval_tap $? 195 'AdminAddUserPermissionsV3' test.out

#- 196 AdminDeleteUserPermissionBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'pbdUsgbn' \
    --body '[{"Action": 81, "Resource": "7lDv0c3a"}, {"Action": 90, "Resource": "NJwsg7YB"}, {"Action": 66, "Resource": "2x9QWxWt"}]' \
    > test.out 2>&1
eval_tap $? 196 'AdminDeleteUserPermissionBulkV3' test.out

#- 197 AdminDeleteUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionV3 \
    --action '82' \
    --namespace "$AB_NAMESPACE" \
    --resource 'IIoaV8CP' \
    --userId '2TdJZvWi' \
    > test.out 2>&1
eval_tap $? 197 'AdminDeleteUserPermissionV3' test.out

#- 198 AdminGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'UcG8iO1v' \
    --after 'oJZ89wF3' \
    --before '80n4usyJ' \
    --limit '83' \
    --platformId 'gAUlkMyy' \
    --targetNamespace 'eUUW9N7N' \
    > test.out 2>&1
eval_tap $? 198 'AdminGetUserPlatformAccountsV3' test.out

#- 199 AdminListAllDistinctPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminListAllDistinctPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'fVCtDYmS' \
    --status '7i3C1uNm' \
    > test.out 2>&1
eval_tap $? 199 'AdminListAllDistinctPlatformAccountsV3' test.out

#- 200 AdminGetListJusticePlatformAccounts
./ng net.accelbyte.sdk.cli.Main iam adminGetListJusticePlatformAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'EwETn4Dj' \
    > test.out 2>&1
eval_tap $? 200 'AdminGetListJusticePlatformAccounts' test.out

#- 201 AdminGetUserMapping
./ng net.accelbyte.sdk.cli.Main iam adminGetUserMapping \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'xVGciteT' \
    --userId 'lGVFTyZd' \
    --createIfNotFound  \
    > test.out 2>&1
eval_tap $? 201 'AdminGetUserMapping' test.out

#- 202 AdminCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam adminCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'WQo2pSFD' \
    --userId 'AaftqZYT' \
    > test.out 2>&1
eval_tap $? 202 'AdminCreateJusticeUser' test.out

#- 203 AdminLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId '0t3WUyIt' \
    --skipConflict  \
    --body '{"platformId": "hx4jWD7k", "platformUserId": "IbYkT9IO"}' \
    > test.out 2>&1
eval_tap $? 203 'AdminLinkPlatformAccount' test.out

#- 204 AdminGetUserLinkHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLinkHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'KatEXreP' \
    --platformId 'jmXJ3a7t' \
    > test.out 2>&1
eval_tap $? 204 'AdminGetUserLinkHistoriesV3' test.out

#- 205 AdminPlatformUnlinkV3
eval_tap 0 205 'AdminPlatformUnlinkV3 # SKIP deprecated' test.out

#- 206 AdminPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'a4ZRVQhk' \
    --userId 'b41Dl8Gm' \
    > test.out 2>&1
eval_tap $? 206 'AdminPlatformUnlinkAllV3' test.out

#- 207 AdminPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'fvRorvsU' \
    --userId '4U5luqE9' \
    --ticket 'dr0F5Oor' \
    > test.out 2>&1
eval_tap $? 207 'AdminPlatformLinkV3' test.out

#- 208 AdminDeleteUserLinkingHistoryByPlatformIDV3
eval_tap 0 208 'AdminDeleteUserLinkingHistoryByPlatformIDV3 # SKIP deprecated' test.out

#- 209 AdminDeleteUserLinkingRestrictionByPlatformIDV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserLinkingRestrictionByPlatformIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'nLFKRvsm' \
    --userId 'ulYcWU8S' \
    > test.out 2>&1
eval_tap $? 209 'AdminDeleteUserLinkingRestrictionByPlatformIDV3' test.out

#- 210 AdminGetThirdPartyPlatformTokenLinkStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetThirdPartyPlatformTokenLinkStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Hc1zOoAU' \
    --userId 'cpPZsLYi' \
    --platformToken 'e1c2vzpH' \
    > test.out 2>&1
eval_tap $? 210 'AdminGetThirdPartyPlatformTokenLinkStatusV3' test.out

#- 211 AdminGetUserSinglePlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminGetUserSinglePlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --platformId 'VLpnNTnJ' \
    --userId 'GUVWgzZ7' \
    --crossNamespace  \
    > test.out 2>&1
eval_tap $? 211 'AdminGetUserSinglePlatformAccount' test.out

#- 212 AdminDeleteUserRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRolesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '1gQWVjvK' \
    --body '["m6xBf3m4", "6eDnx3Wj", "aWx9bJmw"]' \
    > test.out 2>&1
eval_tap $? 212 'AdminDeleteUserRolesV3' test.out

#- 213 AdminSaveUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminSaveUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '8bdGkHHL' \
    --body '[{"namespace": "fAvHSv9L", "roleId": "phdtigQf"}, {"namespace": "dWArbWTg", "roleId": "nLEdFz4E"}, {"namespace": "biw0gtoH", "roleId": "nxgt1LN4"}]' \
    > test.out 2>&1
eval_tap $? 213 'AdminSaveUserRoleV3' test.out

#- 214 AdminAddUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId '71bkXmbK' \
    --userId 'uQXCPxTN' \
    > test.out 2>&1
eval_tap $? 214 'AdminAddUserRoleV3' test.out

#- 215 AdminDeleteUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'kLK4varL' \
    --userId 'vJSBiDT5' \
    > test.out 2>&1
eval_tap $? 215 'AdminDeleteUserRoleV3' test.out

#- 216 AdminGetUserStateByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserStateByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'UF5giQlG' \
    > test.out 2>&1
eval_tap $? 216 'AdminGetUserStateByUserIdV3' test.out

#- 217 AdminUpdateUserStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'aqoFz0SW' \
    --body '{"enabled": true, "reason": "oVrI1piB"}' \
    > test.out 2>&1
eval_tap $? 217 'AdminUpdateUserStatusV3' test.out

#- 218 AdminTrustlyUpdateUserIdentity
./ng net.accelbyte.sdk.cli.Main iam adminTrustlyUpdateUserIdentity \
    --namespace "$AB_NAMESPACE" \
    --userId 'gpLoNFdA' \
    --body '{"emailAddress": "M664rotd", "password": "ZjO3Wqr2"}' \
    > test.out 2>&1
eval_tap $? 218 'AdminTrustlyUpdateUserIdentity' test.out

#- 219 AdminVerifyUserWithoutVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyUserWithoutVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'hsig8QOh' \
    > test.out 2>&1
eval_tap $? 219 'AdminVerifyUserWithoutVerificationCodeV3' test.out

#- 220 AdminUpdateClientSecretV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientSecretV3 \
    --clientId 'Dvdpr9mk' \
    --namespace "$AB_NAMESPACE" \
    --body '{"newSecret": "37lGkA5H"}' \
    > test.out 2>&1
eval_tap $? 220 'AdminUpdateClientSecretV3' test.out

#- 221 AdminCheckThirdPartyLoginPlatformAvailabilityV3
./ng net.accelbyte.sdk.cli.Main iam adminCheckThirdPartyLoginPlatformAvailabilityV3 \
    --platformId 'oOZ3kFyZ' \
    > test.out 2>&1
eval_tap $? 221 'AdminCheckThirdPartyLoginPlatformAvailabilityV3' test.out

#- 222 AdminGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV3 \
    --after 'R61VkHV8' \
    --before '9yGfn8In' \
    --isWildcard  \
    --limit '100' \
    > test.out 2>&1
eval_tap $? 222 'AdminGetRolesV3' test.out

#- 223 AdminCreateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV3 \
    --body '{"adminRole": false, "deletable": true, "isWildcard": true, "managers": [{"displayName": "pogkbBw7", "namespace": "J6mORVDT", "userId": "ooaOUqop"}, {"displayName": "C1SzeXj2", "namespace": "LOcs2WEk", "userId": "uuhODDHJ"}, {"displayName": "aZV3S5tZ", "namespace": "S1lmj3pJ", "userId": "DdBIMEio"}], "members": [{"displayName": "H9hOaEBC", "namespace": "4Bwym9TH", "userId": "0zlltpHq"}, {"displayName": "VIbbMDXr", "namespace": "OLGCRYmp", "userId": "zsCg5XMX"}, {"displayName": "9mEp0aZB", "namespace": "UOrmSEL2", "userId": "W8kby7xf"}], "permissions": [{"action": 0, "resource": "v9RBJBTz", "schedAction": 95, "schedCron": "SWKav2Ij", "schedRange": ["V1zL5QVG", "TyBQXMXN", "YvqHzuKz"]}, {"action": 62, "resource": "vE49WOWc", "schedAction": 23, "schedCron": "twmBGW1C", "schedRange": ["6IzwRhfY", "WGgqFAw8", "kQjo6zAg"]}, {"action": 19, "resource": "zP9OS6gC", "schedAction": 24, "schedCron": "9wsn6quF", "schedRange": ["vG1vUvDK", "7fu5tlZS", "1RrRsHGI"]}], "roleName": "vLl8tB8S"}' \
    > test.out 2>&1
eval_tap $? 223 'AdminCreateRoleV3' test.out

#- 224 AdminGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV3 \
    --roleId 'MFz3QAYu' \
    > test.out 2>&1
eval_tap $? 224 'AdminGetRoleV3' test.out

#- 225 AdminDeleteRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV3 \
    --roleId 'YTdlWKMt' \
    > test.out 2>&1
eval_tap $? 225 'AdminDeleteRoleV3' test.out

#- 226 AdminUpdateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV3 \
    --roleId 'Q8RbBNbL' \
    --body '{"deletable": true, "isWildcard": true, "roleName": "FEq6MwoW"}' \
    > test.out 2>&1
eval_tap $? 226 'AdminUpdateRoleV3' test.out

#- 227 AdminGetRoleAdminStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleAdminStatusV3 \
    --roleId 'IuxGXrLq' \
    > test.out 2>&1
eval_tap $? 227 'AdminGetRoleAdminStatusV3' test.out

#- 228 AdminUpdateAdminRoleStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateAdminRoleStatusV3 \
    --roleId 'mHqzpuSa' \
    > test.out 2>&1
eval_tap $? 228 'AdminUpdateAdminRoleStatusV3' test.out

#- 229 AdminRemoveRoleAdminV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleAdminV3 \
    --roleId 'hgA9MTzQ' \
    > test.out 2>&1
eval_tap $? 229 'AdminRemoveRoleAdminV3' test.out

#- 230 AdminGetRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleManagersV3 \
    --roleId 'WAr3MMT4' \
    --after 'zTpWXFrT' \
    --before 'yyVUkWmK' \
    --limit '88' \
    > test.out 2>&1
eval_tap $? 230 'AdminGetRoleManagersV3' test.out

#- 231 AdminAddRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleManagersV3 \
    --roleId '4ZkZKHPB' \
    --body '{"managers": [{"displayName": "DGdAmLXi", "namespace": "ZQ0II01j", "userId": "vF4Qgdqx"}, {"displayName": "I9MPEIGR", "namespace": "dyvBzaDc", "userId": "wwF1U5o4"}, {"displayName": "ZSFA73rz", "namespace": "FvPd4mRY", "userId": "bSVoqLfc"}]}' \
    > test.out 2>&1
eval_tap $? 231 'AdminAddRoleManagersV3' test.out

#- 232 AdminRemoveRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleManagersV3 \
    --roleId '32QwkHui' \
    --body '{"managers": [{"displayName": "fDwKiMWY", "namespace": "ZopOxUPi", "userId": "0uDnHHNd"}, {"displayName": "mnknFyib", "namespace": "3v89X1Dv", "userId": "6EbmrkQZ"}, {"displayName": "1aMAA3sc", "namespace": "5GEtuyb0", "userId": "GbxQECyu"}]}' \
    > test.out 2>&1
eval_tap $? 232 'AdminRemoveRoleManagersV3' test.out

#- 233 AdminGetRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleMembersV3 \
    --roleId '2022Iblr' \
    --after 'RZFxQpNB' \
    --before 'lxqoKPWn' \
    --limit '85' \
    > test.out 2>&1
eval_tap $? 233 'AdminGetRoleMembersV3' test.out

#- 234 AdminAddRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleMembersV3 \
    --roleId 'hNZYFNfB' \
    --body '{"members": [{"displayName": "hfYIjOLF", "namespace": "C5NuxTuV", "userId": "e3abTmFA"}, {"displayName": "B1kS26CO", "namespace": "fGGbYk2O", "userId": "7TZyf65k"}, {"displayName": "wRwaZt8F", "namespace": "4mk8SjNQ", "userId": "bHCLgTp9"}]}' \
    > test.out 2>&1
eval_tap $? 234 'AdminAddRoleMembersV3' test.out

#- 235 AdminRemoveRoleMembersV3
eval_tap 0 235 'AdminRemoveRoleMembersV3 # SKIP deprecated' test.out

#- 236 AdminUpdateRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV3 \
    --roleId 'sQUwMl7d' \
    --body '{"permissions": [{"action": 41, "resource": "f3daMZQC", "schedAction": 96, "schedCron": "LnDsZrM6", "schedRange": ["QUlmYuGF", "Tj4vSsnY", "pKv1EpyI"]}, {"action": 29, "resource": "JSzx0ttm", "schedAction": 47, "schedCron": "SJkROxqr", "schedRange": ["IwV3wxCt", "f6VohaZJ", "r0IcIj0U"]}, {"action": 69, "resource": "zbc0lxWw", "schedAction": 50, "schedCron": "iO8HAQ3J", "schedRange": ["JZMUZPSR", "7NntsuaI", "milwDnmQ"]}]}' \
    > test.out 2>&1
eval_tap $? 236 'AdminUpdateRolePermissionsV3' test.out

#- 237 AdminAddRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV3 \
    --roleId 'vbYL5uyB' \
    --body '{"permissions": [{"action": 83, "resource": "OwSvteBs", "schedAction": 61, "schedCron": "caLrNTEi", "schedRange": ["O5iwMn2P", "bi1eMW7X", "M18ueLt3"]}, {"action": 57, "resource": "FKZQ6nxq", "schedAction": 80, "schedCron": "m1btT2BH", "schedRange": ["7O09Ipzm", "c2N6dOvC", "xER2tbql"]}, {"action": 97, "resource": "maUHFVd4", "schedAction": 59, "schedCron": "CQklmQo7", "schedRange": ["NFDjU4ZP", "uf5BqYk6", "Sd1Jf4En"]}]}' \
    > test.out 2>&1
eval_tap $? 237 'AdminAddRolePermissionsV3' test.out

#- 238 AdminDeleteRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV3 \
    --roleId '6hVitCXh' \
    --body '["Uqenf61X", "eHH1IJJs", "JkS398I4"]' \
    > test.out 2>&1
eval_tap $? 238 'AdminDeleteRolePermissionsV3' test.out

#- 239 AdminDeleteRolePermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionV3 \
    --action '50' \
    --resource '5oy71oXj' \
    --roleId '5NE7jDDi' \
    > test.out 2>&1
eval_tap $? 239 'AdminDeleteRolePermissionV3' test.out

#- 240 AdminGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam adminGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 240 'AdminGetMyUserV3' test.out

#- 241 UserAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam userAuthenticationV3 \
    --clientId 'SyDk8EFK' \
    --extendExp  \
    --redirectUri '639vhAPy' \
    --password 'IOgNMzIY' \
    --requestId 'TnOQLN8C' \
    --userName 'EiladEwt' \
    > test.out 2>&1
eval_tap $? 241 'UserAuthenticationV3' test.out

#- 242 AuthenticationWithPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV3 \
    --extendExp  \
    --clientId 'Oo78MQ15' \
    --linkingToken 'fmG5VVlI' \
    --password 'zgbcGn24' \
    --username '42CiIeBM' \
    > test.out 2>&1
eval_tap $? 242 'AuthenticationWithPlatformLinkV3' test.out

#- 243 AuthenticateAndLinkForwardV3
./ng net.accelbyte.sdk.cli.Main iam authenticateAndLinkForwardV3 \
    --extendExp  \
    --clientId 'ZYAGf7l7' \
    --linkingToken '96bqYyHU' \
    --password 'sw7TkZDZ' \
    --username 'x22y70wf' \
    > test.out 2>&1
eval_tap $? 243 'AuthenticateAndLinkForwardV3' test.out

#- 244 PublicGetSystemConfigV3
./ng net.accelbyte.sdk.cli.Main iam publicGetSystemConfigV3 \
    > test.out 2>&1
eval_tap $? 244 'PublicGetSystemConfigV3' test.out

#- 245 GenerateTokenByNewHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV3 \
    --additionalData 'xUSb6baU' \
    --extendExp  \
    --linkingToken 'NgfliL3G' \
    > test.out 2>&1
eval_tap $? 245 'GenerateTokenByNewHeadlessAccountV3' test.out

#- 246 RequestOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam requestOneTimeLinkingCodeV3 \
    --redirectUri 'qxRElZe2' \
    --state 'tq48Voti' \
    --platformId 'yGtXMmdJ' \
    > test.out 2>&1
eval_tap $? 246 'RequestOneTimeLinkingCodeV3' test.out

#- 247 ValidateOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam validateOneTimeLinkingCodeV3 \
    --oneTimeLinkCode 'KnXOlxcE' \
    > test.out 2>&1
eval_tap $? 247 'ValidateOneTimeLinkingCodeV3' test.out

#- 248 RequestTokenByOneTimeLinkCodeResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTokenByOneTimeLinkCodeResponseV3 \
    --additionalData 'Ji28ld7y' \
    --isTransient  \
    --clientId 'T5k1h5sz' \
    --oneTimeLinkCode 'dldE9HNJ' \
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
    --codeChallenge 'neQ1UCzg' \
    --codeChallengeMethod 'S256' \
    --clientId 'AVCylTC4' \
    > test.out 2>&1
eval_tap $? 251 'RequestTokenExchangeCodeV3' test.out

#- 252 AdminRetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam adminRetrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'QdDzNazN' \
    --userId 'hLlrxfOL' \
    --platformUserId 'Zbi5pwpy' \
    > test.out 2>&1
eval_tap $? 252 'AdminRetrieveUserThirdPartyPlatformTokenV3' test.out

#- 253 RevokeUserV3
./ng net.accelbyte.sdk.cli.Main iam revokeUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'UkPIgKkr' \
    --includeGameNamespace  \
    > test.out 2>&1
eval_tap $? 253 'RevokeUserV3' test.out

#- 254 AuthorizeV3
./ng net.accelbyte.sdk.cli.Main iam authorizeV3 \
    --blockedPlatformId 'vlIgEbUl' \
    --codeChallenge '7xHpVz9y' \
    --codeChallengeMethod 'plain' \
    --createHeadless  \
    --loginWebBased  \
    --nonce '9hbxuNgk' \
    --oneTimeLinkCode 'cZU0rx2E' \
    --redirectUri 'XyvKvO6V' \
    --scope 'cK3doGxX' \
    --state '1LF5uY7L' \
    --targetAuthPage 'R4Wtbwon' \
    --useRedirectUriAsLoginUrlWhenLocked  \
    --clientId 'oIGvu0FQ' \
    --responseType 'code' \
    > test.out 2>&1
eval_tap $? 254 'AuthorizeV3' test.out

#- 255 TokenIntrospectionV3
./ng net.accelbyte.sdk.cli.Main iam tokenIntrospectionV3 \
    --token 'n7Y09WWf' \
    > test.out 2>&1
eval_tap $? 255 'TokenIntrospectionV3' test.out

#- 256 GetJWKSV3
./ng net.accelbyte.sdk.cli.Main iam getJWKSV3 \
    > test.out 2>&1
eval_tap $? 256 'GetJWKSV3' test.out

#- 257 SendMFAAuthenticationCode
./ng net.accelbyte.sdk.cli.Main iam sendMFAAuthenticationCode \
    --clientId 'INoKS10v' \
    --factor 'YXAZCbml' \
    --mfaToken '469xE5Vl' \
    > test.out 2>&1
eval_tap $? 257 'SendMFAAuthenticationCode' test.out

#- 258 Change2faMethod
./ng net.accelbyte.sdk.cli.Main iam change2faMethod \
    --factor 'tQRsLYpW' \
    --mfaToken 'GxWNaajp' \
    > test.out 2>&1
eval_tap $? 258 'Change2faMethod' test.out

#- 259 Verify2faCode
./ng net.accelbyte.sdk.cli.Main iam verify2faCode \
    --code 'orGhsUWK' \
    --factor '9HPzSgbB' \
    --mfaToken 'WznuaQ6T' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 259 'Verify2faCode' test.out

#- 260 Verify2faCodeForward
./ng net.accelbyte.sdk.cli.Main iam verify2faCodeForward \
    --defaultFactor 'hGzOhkkl' \
    --factors 'ACDKZanC' \
    --rememberDevice  \
    --clientId '5opxcKED' \
    --code 'ncUqBxUk' \
    --factor 'cucbrj0e' \
    --mfaToken 'ugFA7T3T' \
    > test.out 2>&1
eval_tap $? 260 'Verify2faCodeForward' test.out

#- 261 RetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam retrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Ev1KSuwU' \
    --userId 'ezmU1xu8' \
    > test.out 2>&1
eval_tap $? 261 'RetrieveUserThirdPartyPlatformTokenV3' test.out

#- 262 AuthCodeRequestV3
./ng net.accelbyte.sdk.cli.Main iam authCodeRequestV3 \
    --platformId 'Q3cW4Ug8' \
    --clientId 'XQQAWONB' \
    --redirectUri '5toWkggh' \
    --requestId 'tkQGOc3Y' \
    > test.out 2>&1
eval_tap $? 262 'AuthCodeRequestV3' test.out

#- 263 PlatformTokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV3 \
    --platformId 'mTJuJSk6' \
    --additionalData 'rl7LvdXT' \
    --clientId 'T6tK2mhJ' \
    --createHeadless  \
    --deviceId 'uMHJEUnm' \
    --macAddress '41piNb2d' \
    --platformToken '7Y17bXsN' \
    --serviceLabel '0.2924908800974876' \
    --skipSetCookie  \
    > test.out 2>&1
eval_tap $? 263 'PlatformTokenGrantV3' test.out

#- 264 GetRevocationListV3
./ng net.accelbyte.sdk.cli.Main iam getRevocationListV3 \
    > test.out 2>&1
eval_tap $? 264 'GetRevocationListV3' test.out

#- 265 TokenRevocationV3
./ng net.accelbyte.sdk.cli.Main iam tokenRevocationV3 \
    --token 'iiKPtR4Y' \
    > test.out 2>&1
eval_tap $? 265 'TokenRevocationV3' test.out

#- 266 SimultaneousLoginV3
./ng net.accelbyte.sdk.cli.Main iam simultaneousLoginV3 \
    --simultaneousPlatform 'IFW2C3tg' \
    --simultaneousTicket 'YeXP9cu1' \
    --nativePlatform 'steam' \
    --nativePlatformTicket 'HyZwQPsI' \
    > test.out 2>&1
eval_tap $? 266 'SimultaneousLoginV3' test.out

#- 267 TokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV3 \
    --additionalData 'tlbexphQ' \
    --clientId 'nAgl00p9' \
    --clientSecret 'sdFGslyZ' \
    --code 'P4EFJ8Zb' \
    --codeVerifier 'wy1NtUJZ' \
    --extendNamespace 'W2npNdXJ' \
    --extendExp  \
    --password '9mLDWuow' \
    --redirectUri '14dHQlUD' \
    --refreshToken '1PLJqFzr' \
    --scope 'n2LYHHl7' \
    --username 'sMk9nwTY' \
    --grantType 'urn:ietf:params:oauth:grant-type:extend_client_credentials' \
    > test.out 2>&1
eval_tap $? 267 'TokenGrantV3' test.out

#- 268 VerifyTokenV3
./ng net.accelbyte.sdk.cli.Main iam verifyTokenV3 \
    --token 'KxsyEwQT' \
    > test.out 2>&1
eval_tap $? 268 'VerifyTokenV3' test.out

#- 269 PlatformAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticationV3 \
    --platformId '1alAl6P2' \
    --code 'GYZqFawy' \
    --error 'KVyfsiAs' \
    --openidAssocHandle 'jlNwu2EN' \
    --openidClaimedId 'q5cngo60' \
    --openidIdentity 'DqGgs1Rx' \
    --openidMode '9CdcJF42' \
    --openidNs 'AoSc8Bzu' \
    --openidOpEndpoint 'AfYWKcAH' \
    --openidResponseNonce 'cWITO49J' \
    --openidReturnTo '7922oL0t' \
    --openidSig '7TlnCYoQ' \
    --openidSigned 'ymE3cgZc' \
    --state 'KX2XZXhn' \
    > test.out 2>&1
eval_tap $? 269 'PlatformAuthenticationV3' test.out

#- 270 PlatformTokenRefreshV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenRefreshV3 \
    --platformId 'tES5ROLR' \
    --platformToken 'h87jnIKN' \
    > test.out 2>&1
eval_tap $? 270 'PlatformTokenRefreshV3' test.out

#- 271 PublicGetInputValidations
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidations \
    --defaultOnEmpty  \
    --languageCode 'ScYyjFch' \
    > test.out 2>&1
eval_tap $? 271 'PublicGetInputValidations' test.out

#- 272 PublicGetInputValidationByField
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidationByField \
    --field '85yzkFML' \
    > test.out 2>&1
eval_tap $? 272 'PublicGetInputValidationByField' test.out

#- 273 PublicGetCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam publicGetCountryAgeRestrictionV3 \
    --countryCode 'BtH2z01s' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 273 'PublicGetCountryAgeRestrictionV3' test.out

#- 274 PublicGetConfigValueV3
./ng net.accelbyte.sdk.cli.Main iam publicGetConfigValueV3 \
    --configKey '5GKmnP6w' \
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
    --clientId 'ElzXIdZ9' \
    > test.out 2>&1
eval_tap $? 277 'RetrieveActiveOIDCClientsPublicV3' test.out

#- 278 PublicListUserIDByPlatformUserIDsV3
eval_tap 0 278 'PublicListUserIDByPlatformUserIDsV3 # SKIP deprecated' test.out

#- 279 PublicGetUserByPlatformUserIDV3
eval_tap 0 279 'PublicGetUserByPlatformUserIDV3 # SKIP deprecated' test.out

#- 280 PublicGetProfileUpdateStrategyV3
./ng net.accelbyte.sdk.cli.Main iam publicGetProfileUpdateStrategyV3 \
    --namespace "$AB_NAMESPACE" \
    --field 'dob' \
    > test.out 2>&1
eval_tap $? 280 'PublicGetProfileUpdateStrategyV3' test.out

#- 281 PublicGetAsyncStatus
./ng net.accelbyte.sdk.cli.Main iam publicGetAsyncStatus \
    --namespace "$AB_NAMESPACE" \
    --requestId '79yvkLu4' \
    > test.out 2>&1
eval_tap $? 281 'PublicGetAsyncStatus' test.out

#- 282 PublicSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam publicSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by '64AlXdXK' \
    --limit '62' \
    --offset '98' \
    --platformBy 'qnZNYjAu' \
    --platformId 'fxopwKjU' \
    --query 'cXSDGXjH' \
    > test.out 2>&1
eval_tap $? 282 'PublicSearchUserV3' test.out

#- 283 PublicCreateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "1YxagbST", "acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "0VRnYWE6", "policyId": "5pvIMUaM", "policyVersionId": "P4QpDlCh"}, {"isAccepted": true, "localizedPolicyVersionId": "IAK784Yy", "policyId": "pZERlbS4", "policyVersionId": "67xgPI7L"}, {"isAccepted": true, "localizedPolicyVersionId": "yecwJCPW", "policyId": "48pL7pqX", "policyVersionId": "LTmSywR7"}], "authType": "0bSoyglq", "code": "8uMAvWBZ", "country": "Ox5rjNDv", "dateOfBirth": "bxfvkkJI", "displayName": "KIcbch88", "emailAddress": "d2sZa2nn", "password": "DUCthvj7", "reachMinimumAge": false, "uniqueDisplayName": "75JUertN"}' \
    > test.out 2>&1
eval_tap $? 283 'PublicCreateUserV3' test.out

#- 284 CheckUserAvailability
./ng net.accelbyte.sdk.cli.Main iam checkUserAvailability \
    --namespace "$AB_NAMESPACE" \
    --field '7EvpVkud' \
    --query 'GbEaciVI' \
    > test.out 2>&1
eval_tap $? 284 'CheckUserAvailability' test.out

#- 285 PublicBulkGetUsers
eval_tap 0 285 'PublicBulkGetUsers # SKIP deprecated' test.out

#- 286 PublicSendRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicSendRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "QPfRSrBT", "languageTag": "RIuiSqKj"}' \
    > test.out 2>&1
eval_tap $? 286 'PublicSendRegistrationCode' test.out

#- 287 PublicVerifyRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicVerifyRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "gqeQitLj", "emailAddress": "T1Mesp03"}' \
    > test.out 2>&1
eval_tap $? 287 'PublicVerifyRegistrationCode' test.out

#- 288 PublicForgotPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicForgotPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "1vaSxnFN", "languageTag": "D7SBWHQ4"}' \
    > test.out 2>&1
eval_tap $? 288 'PublicForgotPasswordV3' test.out

#- 289 PublicValidateUserInput
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserInput \
    --namespace "$AB_NAMESPACE" \
    --body '{"displayName": "NDG8RrA4", "password": "isRYkpyG", "uniqueDisplayName": "boAmw4xX", "username": "d3cM4LS4"}' \
    > test.out 2>&1
eval_tap $? 289 'PublicValidateUserInput' test.out

#- 290 GetAdminInvitationV3
./ng net.accelbyte.sdk.cli.Main iam getAdminInvitationV3 \
    --invitationId 'GMKw1J3n' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 290 'GetAdminInvitationV3' test.out

#- 291 CreateUserFromInvitationV3
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV3 \
    --invitationId 'UMGxDCGq' \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "jaXIW90E", "acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "IIYO84S6", "policyId": "Pq5eOiaO", "policyVersionId": "YU5pz6ki"}, {"isAccepted": true, "localizedPolicyVersionId": "sddw8sBH", "policyId": "nODNiLpJ", "policyVersionId": "Z961sEME"}, {"isAccepted": true, "localizedPolicyVersionId": "2JXrGZRR", "policyId": "7o1MOIel", "policyVersionId": "lX7rJySg"}], "authType": "jllFFhuh", "code": "Ddu8Eoio", "country": "H1Dbj81Q", "dateOfBirth": "bkdbkPp6", "displayName": "dBvYG6Kv", "emailAddress": "ROBxQPVe", "password": "ibiQwUlx", "reachMinimumAge": true, "uniqueDisplayName": "4gLjXTFO"}' \
    > test.out 2>&1
eval_tap $? 291 'CreateUserFromInvitationV3' test.out

#- 292 UpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam updateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "jEZKBuNd", "country": "cM0WhT2Y", "dateOfBirth": "B3lbAYw1", "displayName": "IoCxDknI", "languageTag": "Lf6jU5bc", "uniqueDisplayName": "YfGrw2mM", "userName": "dZp1Lyy1"}' \
    > test.out 2>&1
eval_tap $? 292 'UpdateUserV3' test.out

#- 293 PublicPartialUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicPartialUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "V9DkHxmJ", "country": "xhusuuBr", "dateOfBirth": "YbWTpQFe", "displayName": "G5Ndv5z4", "languageTag": "smsSdDgh", "uniqueDisplayName": "SJCoU3Xm", "userName": "SIThCY4M"}' \
    > test.out 2>&1
eval_tap $? 293 'PublicPartialUpdateUserV3' test.out

#- 294 PublicSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"context": "L43iGzpF", "emailAddress": "zgZ471Ve", "languageTag": "bSXuXBM2", "upgradeToken": "GMs0J3Ro"}' \
    > test.out 2>&1
eval_tap $? 294 'PublicSendVerificationCodeV3' test.out

#- 295 PublicUserVerificationV3
./ng net.accelbyte.sdk.cli.Main iam publicUserVerificationV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "bXRe09yi", "contactType": "HQNZ4Ecg", "languageTag": "vmAdavWZ", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 295 'PublicUserVerificationV3' test.out

#- 296 PublicUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "eAuTlNIM", "country": "R0dLnVR8", "dateOfBirth": "zuPBYb5D", "displayName": "b7JvevhB", "emailAddress": "A6fCRwiA", "password": "BPJrBkyt", "uniqueDisplayName": "DwPWlYMm", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 296 'PublicUpgradeHeadlessAccountV3' test.out

#- 297 PublicVerifyHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --needVerificationCode  \
    --body '{"emailAddress": "rsDgIveP", "password": "4WkTuLQA"}' \
    > test.out 2>&1
eval_tap $? 297 'PublicVerifyHeadlessAccountV3' test.out

#- 298 PublicUpdatePasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicUpdatePasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"languageTag": "G6YR0JSW", "mfaToken": "Levok4bT", "newPassword": "C976qWXs", "oldPassword": "2ogqRgmw"}' \
    > test.out 2>&1
eval_tap $? 298 'PublicUpdatePasswordV3' test.out

#- 299 PublicCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam publicCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'TsbCsJnG' \
    > test.out 2>&1
eval_tap $? 299 'PublicCreateJusticeUser' test.out

#- 300 PublicPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'QFKgd6Ri' \
    --redirectUri 'uLRKTcJu' \
    --ticket 'NzKXFF4U' \
    > test.out 2>&1
eval_tap $? 300 'PublicPlatformLinkV3' test.out

#- 301 PublicPlatformUnlinkV3
eval_tap 0 301 'PublicPlatformUnlinkV3 # SKIP deprecated' test.out

#- 302 PublicPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '3cJ7f9KF' \
    > test.out 2>&1
eval_tap $? 302 'PublicPlatformUnlinkAllV3' test.out

#- 303 PublicForcePlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicForcePlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'kZyiLLV9' \
    --ticket 'lTlScfwM' \
    > test.out 2>&1
eval_tap $? 303 'PublicForcePlatformLinkV3' test.out

#- 304 PublicWebLinkPlatform
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatform \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Wu1BWAaa' \
    --clientId '7VPlHgfN' \
    --redirectUri '77WuPaWD' \
    > test.out 2>&1
eval_tap $? 304 'PublicWebLinkPlatform' test.out

#- 305 PublicWebLinkPlatformEstablish
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatformEstablish \
    --namespace "$AB_NAMESPACE" \
    --platformId 'PwvdfQVV' \
    --code 'ldfYUhfQ' \
    --state 'MQzIl9FK' \
    > test.out 2>&1
eval_tap $? 305 'PublicWebLinkPlatformEstablish' test.out

#- 306 PublicProcessWebLinkPlatformV3
./ng net.accelbyte.sdk.cli.Main iam publicProcessWebLinkPlatformV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'VE8AhEl2' \
    --code 'f1TJuTwz' \
    --state 'iqYgkAh9' \
    > test.out 2>&1
eval_tap $? 306 'PublicProcessWebLinkPlatformV3' test.out

#- 307 PublicGetUsersPlatformInfosV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUsersPlatformInfosV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"platformId": "ZZvqCftp", "userIds": ["5Klt7b4y", "0m0QcStw", "hjla8vRf"]}' \
    > test.out 2>&1
eval_tap $? 307 'PublicGetUsersPlatformInfosV3' test.out

#- 308 ResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam resetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientId": "JkRZk1jY", "code": "vCq2vyav", "emailAddress": "fnpj6DvH", "languageTag": "1i2Q6fqY", "newPassword": "9OFI7Yhb"}' \
    > test.out 2>&1
eval_tap $? 308 'ResetPasswordV3' test.out

#- 309 PublicGetUserByUserIdV3
eval_tap 0 309 'PublicGetUserByUserIdV3 # SKIP deprecated' test.out

#- 310 PublicGetUserBanHistoryV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserBanHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZQ1hQyx5' \
    --activeOnly  \
    --after 'VIeyORTX' \
    --before '2zK23H3P' \
    --limit '31' \
    > test.out 2>&1
eval_tap $? 310 'PublicGetUserBanHistoryV3' test.out

#- 311 PublicListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'IuAufbSn' \
    > test.out 2>&1
eval_tap $? 311 'PublicListUserAllPlatformAccountsDistinctV3' test.out

#- 312 PublicGetUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '1svE4YTS' \
    > test.out 2>&1
eval_tap $? 312 'PublicGetUserInformationV3' test.out

#- 313 PublicGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '1UR0oWYb' \
    --after '0.510129920113838' \
    --before '0.5076259357353956' \
    --limit '79' \
    > test.out 2>&1
eval_tap $? 313 'PublicGetUserLoginHistoriesV3' test.out

#- 314 PublicGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '28hT4MaI' \
    --after '9my629qi' \
    --before 'tEDyUl7v' \
    --limit '31' \
    --platformId '5AOu9gpC' \
    > test.out 2>&1
eval_tap $? 314 'PublicGetUserPlatformAccountsV3' test.out

#- 315 PublicListJusticePlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicListJusticePlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ElqdvF1Y' \
    > test.out 2>&1
eval_tap $? 315 'PublicListJusticePlatformAccountsV3' test.out

#- 316 PublicLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam publicLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'Stn2oJf7' \
    --body '{"platformId": "rkPXcMoq", "platformUserId": "ZEtHDLaA"}' \
    > test.out 2>&1
eval_tap $? 316 'PublicLinkPlatformAccount' test.out

#- 317 PublicForceLinkPlatformWithProgression
./ng net.accelbyte.sdk.cli.Main iam publicForceLinkPlatformWithProgression \
    --namespace "$AB_NAMESPACE" \
    --userId '6KhFdvCm' \
    --body '{"chosenNamespaces": ["oChNM7Sl", "2hOAGEAe", "UaVJNVX4"], "requestId": "lMxhDnYL"}' \
    > test.out 2>&1
eval_tap $? 317 'PublicForceLinkPlatformWithProgression' test.out

#- 318 PublicGetPublisherUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetPublisherUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'hslzWImB' \
    > test.out 2>&1
eval_tap $? 318 'PublicGetPublisherUserV3' test.out

#- 319 PublicValidateUserByUserIDAndPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserByUserIDAndPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Z264Q6Qo' \
    --password 'InmUKcTQ' \
    > test.out 2>&1
eval_tap $? 319 'PublicValidateUserByUserIDAndPasswordV3' test.out

#- 320 PublicGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRolesV3 \
    --after 'wbOm5z8H' \
    --before 'pTKtxlVX' \
    --isWildcard  \
    --limit '92' \
    > test.out 2>&1
eval_tap $? 320 'PublicGetRolesV3' test.out

#- 321 PublicGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRoleV3 \
    --roleId 'qjsRU269' \
    > test.out 2>&1
eval_tap $? 321 'PublicGetRoleV3' test.out

#- 322 PublicForgotPasswordWithoutNamespaceV3
./ng net.accelbyte.sdk.cli.Main iam publicForgotPasswordWithoutNamespaceV3 \
    --body '{"clientId": "8Rdjmeba", "emailAddress": "RcSj8ads", "languageTag": "eoOIJU8o"}' \
    > test.out 2>&1
eval_tap $? 322 'PublicForgotPasswordWithoutNamespaceV3' test.out

#- 323 PublicGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyUserV3 \
    --includeAllPlatforms  \
    > test.out 2>&1
eval_tap $? 323 'PublicGetMyUserV3' test.out

#- 324 PublicSendCodeForwardV3
./ng net.accelbyte.sdk.cli.Main iam publicSendCodeForwardV3 \
    --body '{"context": "vnhvN10A", "emailAddress": "FNUlVRCX", "languageTag": "SsIrtKjt", "upgradeToken": "zvcOpeib"}' \
    > test.out 2>&1
eval_tap $? 324 'PublicSendCodeForwardV3' test.out

#- 325 PublicGetLinkHeadlessAccountToMyAccountConflictV3
./ng net.accelbyte.sdk.cli.Main iam publicGetLinkHeadlessAccountToMyAccountConflictV3 \
    --oneTimeLinkCode '3qlc4zf5' \
    > test.out 2>&1
eval_tap $? 325 'PublicGetLinkHeadlessAccountToMyAccountConflictV3' test.out

#- 326 LinkHeadlessAccountToMyAccountV3
./ng net.accelbyte.sdk.cli.Main iam linkHeadlessAccountToMyAccountV3 \
    --body '{"chosenNamespaces": ["qOetD0ni", "HxQ3kLXw", "P30LQIDc"], "oneTimeLinkCode": "SYfmTcMf"}' \
    > test.out 2>&1
eval_tap $? 326 'LinkHeadlessAccountToMyAccountV3' test.out

#- 327 PublicGetMyRedirectionAfterLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyRedirectionAfterLinkV3 \
    --oneTimeLinkCode 'Fufw4A56' \
    > test.out 2>&1
eval_tap $? 327 'PublicGetMyRedirectionAfterLinkV3' test.out

#- 328 PublicGetMyProfileAllowUpdateStatusV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyProfileAllowUpdateStatusV3 \
    > test.out 2>&1
eval_tap $? 328 'PublicGetMyProfileAllowUpdateStatusV3' test.out

#- 329 PublicSendVerificationLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationLinkV3 \
    --body '{"languageTag": "oLkEQd70"}' \
    > test.out 2>&1
eval_tap $? 329 'PublicSendVerificationLinkV3' test.out

#- 330 PublicGetOpenidUserInfoV3
./ng net.accelbyte.sdk.cli.Main iam publicGetOpenidUserInfoV3 \
    > test.out 2>&1
eval_tap $? 330 'PublicGetOpenidUserInfoV3' test.out

#- 331 PublicVerifyUserByLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyUserByLinkV3 \
    --code 'sZmYm9vJ' \
    > test.out 2>&1
eval_tap $? 331 'PublicVerifyUserByLinkV3' test.out

#- 332 PlatformAuthenticateSAMLV3Handler
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticateSAMLV3Handler \
    --platformId 'lhuPa3ca' \
    --code 'Kq8Y1YTo' \
    --error 'T9OcMQXx' \
    --state '9xGz6jlK' \
    > test.out 2>&1
eval_tap $? 332 'PlatformAuthenticateSAMLV3Handler' test.out

#- 333 LoginSSOClient
./ng net.accelbyte.sdk.cli.Main iam loginSSOClient \
    --platformId 'mDp8nE6Y' \
    --payload 'OPJds8T2' \
    > test.out 2>&1
eval_tap $? 333 'LoginSSOClient' test.out

#- 334 LogoutSSOClient
./ng net.accelbyte.sdk.cli.Main iam logoutSSOClient \
    --platformId 'VPhfIFlv' \
    > test.out 2>&1
eval_tap $? 334 'LogoutSSOClient' test.out

#- 335 RequestTargetTokenResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTargetTokenResponseV3 \
    --additionalData '388HGEmv' \
    --code 'f4BsBQBL' \
    > test.out 2>&1
eval_tap $? 335 'RequestTargetTokenResponseV3' test.out

#- 336 UpgradeAndAuthenticateForwardV3
./ng net.accelbyte.sdk.cli.Main iam upgradeAndAuthenticateForwardV3 \
    --clientId 'K99IMq8n' \
    --upgradeSuccessToken 'EJq5UBSI' \
    > test.out 2>&1
eval_tap $? 336 'UpgradeAndAuthenticateForwardV3' test.out

#- 337 AdminListInvitationHistoriesV4
./ng net.accelbyte.sdk.cli.Main iam adminListInvitationHistoriesV4 \
    --limit '87' \
    --namespace "$AB_NAMESPACE" \
    --offset '59' \
    > test.out 2>&1
eval_tap $? 337 'AdminListInvitationHistoriesV4' test.out

#- 338 AdminGetDevicesByUserV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDevicesByUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '7vFirlPC' \
    > test.out 2>&1
eval_tap $? 338 'AdminGetDevicesByUserV4' test.out

#- 339 AdminGetBannedDevicesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedDevicesV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceType 'sAG7Coao' \
    --endDate '2cly4bCk' \
    --limit '36' \
    --offset '99' \
    --startDate 'UbIVX3TN' \
    > test.out 2>&1
eval_tap $? 339 'AdminGetBannedDevicesV4' test.out

#- 340 AdminGetUserDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeviceBansV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'KOhwIp1R' \
    > test.out 2>&1
eval_tap $? 340 'AdminGetUserDeviceBansV4' test.out

#- 341 AdminBanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminBanDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"comment": "sXQFjufI", "deviceId": "sVGTLcQf", "deviceType": "ojRafuav", "enabled": false, "endDate": "8XKZoUWo", "ext": {"0ymbZDLu": {}, "x6bzoVpB": {}, "uNtY05DZ": {}}, "reason": "EWHdPPVa"}' \
    > test.out 2>&1
eval_tap $? 341 'AdminBanDeviceV4' test.out

#- 342 AdminGetDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBanV4 \
    --banId 'xRKXlkxd' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 342 'AdminGetDeviceBanV4' test.out

#- 343 AdminUpdateDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateDeviceBanV4 \
    --banId 'hbjBe9MC' \
    --namespace "$AB_NAMESPACE" \
    --body '{"enabled": false}' \
    > test.out 2>&1
eval_tap $? 343 'AdminUpdateDeviceBanV4' test.out

#- 344 AdminGenerateReportV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateReportV4 \
    --namespace "$AB_NAMESPACE" \
    --endDate 'N7m6D2gv' \
    --startDate '9shbjWAb' \
    --deviceType 'MjHZUA9y' \
    > test.out 2>&1
eval_tap $? 344 'AdminGenerateReportV4' test.out

#- 345 AdminGetDeviceTypesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceTypesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 345 'AdminGetDeviceTypesV4' test.out

#- 346 AdminGetDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBansV4 \
    --deviceId 'h9Wl3Swo' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 346 'AdminGetDeviceBansV4' test.out

#- 347 AdminDecryptDeviceV4
eval_tap 0 347 'AdminDecryptDeviceV4 # SKIP deprecated' test.out

#- 348 AdminUnbanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminUnbanDeviceV4 \
    --deviceId 'eNHBhg81' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 348 'AdminUnbanDeviceV4' test.out

#- 349 AdminGetUsersByDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUsersByDeviceV4 \
    --deviceId 'yBD8c2qi' \
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
    --limit '40' \
    --offset '97' \
    > test.out 2>&1
eval_tap $? 351 'AdminGetNamespaceUserInvitationHistoryV4' test.out

#- 352 AdminCreateTestUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateTestUsersV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 36, "userInfo": {"country": "7Tupa4dy"}}' \
    > test.out 2>&1
eval_tap $? 352 'AdminCreateTestUsersV4' test.out

#- 353 AdminCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "knhqa2mj", "policyId": "bTaEtMAU", "policyVersionId": "QVH4Mo1G"}, {"isAccepted": false, "localizedPolicyVersionId": "e46hMywc", "policyId": "eeQKFGw9", "policyVersionId": "LbVBZYEf"}, {"isAccepted": false, "localizedPolicyVersionId": "QPEz5cbj", "policyId": "KS0VgClA", "policyVersionId": "Jt7F1Mst"}], "authType": "EMAILPASSWD", "code": "wmbbWgrz", "country": "vNzpK5XD", "dateOfBirth": "8d4bKsga", "displayName": "yvs6pkGO", "emailAddress": "fRMG7gC9", "password": "cLQ2QefH", "passwordMD5Sum": "NOjwEQJq", "reachMinimumAge": true, "uniqueDisplayName": "RFFFoIFk", "username": "D3cDPoKr"}' \
    > test.out 2>&1
eval_tap $? 353 'AdminCreateUserV4' test.out

#- 354 AdminBulkUpdateUserAccountTypeV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateUserAccountTypeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"testAccount": true, "userIds": ["llp40gTq", "DgMhWyNz", "lPhGbdTb"]}' \
    > test.out 2>&1
eval_tap $? 354 'AdminBulkUpdateUserAccountTypeV4' test.out

#- 355 AdminBulkCheckValidUserIDV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkCheckValidUserIDV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["6q2M4J8e", "ZPU4id8G", "7bg94mpI"]}' \
    > test.out 2>&1
eval_tap $? 355 'AdminBulkCheckValidUserIDV4' test.out

#- 356 AdminUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'BKvJAe6Z' \
    --body '{"avatarUrl": "FxzD9uPB", "country": "XeiuFQ7s", "dateOfBirth": "Jw1DQYyf", "displayName": "lU3qXk52", "languageTag": "DxfokwWt", "skipLoginQueue": false, "tags": ["LIHC6FMi", "joBpa89e", "hNOw7KFc"], "uniqueDisplayName": "BCSMz9UA", "userName": "1h4G6AyY"}' \
    > test.out 2>&1
eval_tap $? 356 'AdminUpdateUserV4' test.out

#- 357 AdminUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'SQjNr8Kr' \
    --body '{"code": "aa9ONyV5", "emailAddress": "HVGqVWzo"}' \
    > test.out 2>&1
eval_tap $? 357 'AdminUpdateUserEmailAddressV4' test.out

#- 358 AdminDisableUserMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableUserMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'W9QIzGW4' \
    --body '{"factor": "4H6UJ1PO", "mfaToken": "cQLOz60k"}' \
    > test.out 2>&1
eval_tap $? 358 'AdminDisableUserMFAV4' test.out

#- 359 AdminGetUserMFAStatusV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUserMFAStatusV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'pHhqW5OX' \
    > test.out 2>&1
eval_tap $? 359 'AdminGetUserMFAStatusV4' test.out

#- 360 AdminListUserRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminListUserRolesV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'mFrI02w8' \
    > test.out 2>&1
eval_tap $? 360 'AdminListUserRolesV4' test.out

#- 361 AdminUpdateUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Gql426ae' \
    --body '{"assignedNamespaces": ["uMrzzQQv", "qbblaQA7", "buUWsvwg"], "roleId": "jRQAfuIq"}' \
    > test.out 2>&1
eval_tap $? 361 'AdminUpdateUserRoleV4' test.out

#- 362 AdminAddUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '1cpJH3og' \
    --body '{"assignedNamespaces": ["JrxHKNta", "cqO3ft8j", "UvXLy7eg"], "roleId": "mhr6L3YP"}' \
    > test.out 2>&1
eval_tap $? 362 'AdminAddUserRoleV4' test.out

#- 363 AdminRemoveUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRemoveUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '7bf68ldB' \
    --body '{"assignedNamespaces": ["t4Qn6Dy5", "A2U9epb1", "DFNJMK7B"], "roleId": "FnHpXFGk"}' \
    > test.out 2>&1
eval_tap $? 363 'AdminRemoveUserRoleV4' test.out

#- 364 AdminGetRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV4 \
    --adminRole  \
    --isWildcard  \
    --limit '85' \
    --offset '59' \
    > test.out 2>&1
eval_tap $? 364 'AdminGetRolesV4' test.out

#- 365 AdminCreateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV4 \
    --body '{"adminRole": false, "deletable": true, "isWildcard": false, "roleName": "SnUhgtVM"}' \
    > test.out 2>&1
eval_tap $? 365 'AdminCreateRoleV4' test.out

#- 366 AdminGetRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV4 \
    --roleId 'L2K1XiAa' \
    > test.out 2>&1
eval_tap $? 366 'AdminGetRoleV4' test.out

#- 367 AdminDeleteRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV4 \
    --roleId 'ozcjemK5' \
    > test.out 2>&1
eval_tap $? 367 'AdminDeleteRoleV4' test.out

#- 368 AdminUpdateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV4 \
    --roleId 'S6mom6w3' \
    --body '{"adminRole": false, "deletable": true, "isWildcard": false, "roleName": "7tj2wsDf"}' \
    > test.out 2>&1
eval_tap $? 368 'AdminUpdateRoleV4' test.out

#- 369 AdminUpdateRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV4 \
    --roleId 't9SDB3HM' \
    --body '{"permissions": [{"action": 28, "resource": "A8yUXYO7", "schedAction": 29, "schedCron": "kqr1010s", "schedRange": ["DgUJb70c", "KWGDqHvJ", "jb0K2ejP"]}, {"action": 79, "resource": "JTY7EJTW", "schedAction": 48, "schedCron": "qUMaFl8M", "schedRange": ["e7F010vJ", "A8x4fi3X", "PWmre0UG"]}, {"action": 88, "resource": "2i7sHEW2", "schedAction": 33, "schedCron": "mMHCyUrh", "schedRange": ["3wDuk9mz", "p3tPe4oq", "mEo5Ls7o"]}]}' \
    > test.out 2>&1
eval_tap $? 369 'AdminUpdateRolePermissionsV4' test.out

#- 370 AdminAddRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV4 \
    --roleId 'ADCEUQ1X' \
    --body '{"permissions": [{"action": 47, "resource": "4rG9BNY9", "schedAction": 88, "schedCron": "Ad6npGbv", "schedRange": ["Ayf1mcAm", "WpuVXzN8", "6rZYJzFa"]}, {"action": 24, "resource": "DirCfIlI", "schedAction": 2, "schedCron": "84IdCaQQ", "schedRange": ["Bw1YZd5R", "3479IZFN", "jY0J9dHU"]}, {"action": 54, "resource": "VyvTs1Rx", "schedAction": 83, "schedCron": "5ps6XrY4", "schedRange": ["FSbsaLGm", "eLP7PZS6", "N4ZEG5ur"]}]}' \
    > test.out 2>&1
eval_tap $? 370 'AdminAddRolePermissionsV4' test.out

#- 371 AdminDeleteRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV4 \
    --roleId 'zbzZ3AkK' \
    --body '["lZinIg2K", "mOBVwe5S", "o5zkCC7s"]' \
    > test.out 2>&1
eval_tap $? 371 'AdminDeleteRolePermissionsV4' test.out

#- 372 AdminListAssignedUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminListAssignedUsersV4 \
    --roleId '1diqa8X4' \
    --after 'ZwenJc4Z' \
    --before 'FwdvVCjy' \
    --limit '96' \
    > test.out 2>&1
eval_tap $? 372 'AdminListAssignedUsersV4' test.out

#- 373 AdminAssignUserToRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAssignUserToRoleV4 \
    --roleId 'wju3ZF9h' \
    --body '{"assignedNamespaces": ["hC2MvnHB", "nEEtRwlF", "OSbOYghq"], "namespace": "A40Z1v0B", "userId": "KLhh88jH"}' \
    > test.out 2>&1
eval_tap $? 373 'AdminAssignUserToRoleV4' test.out

#- 374 AdminRevokeUserFromRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRevokeUserFromRoleV4 \
    --roleId 'M95SimJi' \
    --body '{"namespace": "Mj5H04BF", "userId": "FRAA8Ykn"}' \
    > test.out 2>&1
eval_tap $? 374 'AdminRevokeUserFromRoleV4' test.out

#- 375 AdminInviteUserNewV4
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserNewV4 \
    --body '{"assignedNamespaces": ["e1DaKlfD", "TZ4v6fY2", "9wkejx8e"], "emailAddresses": ["WDgrOU0W", "3ufBqQYM", "iRnrzQmI"], "isAdmin": false, "isNewStudio": true, "languageTag": "AwRJpJAc", "namespace": "aQbDaQCp", "roleId": "rJtWBR1H"}' \
    > test.out 2>&1
eval_tap $? 375 'AdminInviteUserNewV4' test.out

#- 376 AdminUpdateMyUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateMyUserV4 \
    --body '{"avatarUrl": "PZABXq2e", "country": "3cltvy1a", "dateOfBirth": "ZSuSyLpp", "displayName": "mTQnuLcb", "languageTag": "zS7AkJkO", "skipLoginQueue": true, "tags": ["b9uAxHIY", "6JhIEO4i", "r3Fbkvdi"], "uniqueDisplayName": "N0NyM8gs", "userName": "Oeds0fgx"}' \
    > test.out 2>&1
eval_tap $? 376 'AdminUpdateMyUserV4' test.out

#- 377 AdminDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyAuthenticatorV4 \
    --body '{"factor": "B38l305Q", "mfaToken": "InbZb20e"}' \
    > test.out 2>&1
eval_tap $? 377 'AdminDisableMyAuthenticatorV4' test.out

#- 378 AdminEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyAuthenticatorV4 \
    --code '7zzhVyAs' \
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
    --body '{"factor": "6huZWjwk", "mfaToken": "Zdh27uP2"}' \
    > test.out 2>&1
eval_tap $? 382 'AdminDisableMyBackupCodesV4' test.out

#- 383 AdminDownloadMyBackupCodesV4
eval_tap 0 383 'AdminDownloadMyBackupCodesV4 # SKIP deprecated' test.out

#- 384 AdminEnableMyBackupCodesV4
eval_tap 0 384 'AdminEnableMyBackupCodesV4 # SKIP deprecated' test.out

#- 385 AdminGetBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBackupCodesV4 \
    --languageTag 'z1AlNlRE' \
    > test.out 2>&1
eval_tap $? 385 'AdminGetBackupCodesV4' test.out

#- 386 AdminGenerateBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateBackupCodesV4 \
    --languageTag 'KidzOSNA' \
    > test.out 2>&1
eval_tap $? 386 'AdminGenerateBackupCodesV4' test.out

#- 387 AdminEnableBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableBackupCodesV4 \
    --languageTag 'ubTR3gYJ' \
    > test.out 2>&1
eval_tap $? 387 'AdminEnableBackupCodesV4' test.out

#- 388 AdminChallengeMyMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminChallengeMyMFAV4 \
    --code 'Nh9LS3l5' \
    --factor 'nn1MZH2o' \
    > test.out 2>&1
eval_tap $? 388 'AdminChallengeMyMFAV4' test.out

#- 389 AdminSendMyMFAEmailCodeV4
./ng net.accelbyte.sdk.cli.Main iam adminSendMyMFAEmailCodeV4 \
    --action 'QQiLXC1p' \
    --languageTag '1yj9n4Zm' \
    > test.out 2>&1
eval_tap $? 389 'AdminSendMyMFAEmailCodeV4' test.out

#- 390 AdminDisableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyEmailV4 \
    --body '{"factor": "OwhgAksB", "mfaToken": "xJWTqUqS"}' \
    > test.out 2>&1
eval_tap $? 390 'AdminDisableMyEmailV4' test.out

#- 391 AdminEnableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyEmailV4 \
    --code 'BN7ArrX4' \
    > test.out 2>&1
eval_tap $? 391 'AdminEnableMyEmailV4' test.out

#- 392 AdminGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyEnabledFactorsV4 \
    > test.out 2>&1
eval_tap $? 392 'AdminGetMyEnabledFactorsV4' test.out

#- 393 AdminMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam adminMakeFactorMyDefaultV4 \
    --factor 'AbW2CNfJ' \
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
    --clientId 'xqx9Vp05' \
    --linkingToken 'UrRLl8hz' \
    --password 'UzW6CbCQ' \
    --username 'kuDUCIN0' \
    > test.out 2>&1
eval_tap $? 397 'AuthenticationWithPlatformLinkV4' test.out

#- 398 GenerateTokenByNewHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV4 \
    --additionalData 'VypzvgCi' \
    --extendExp  \
    --linkingToken 'Sp3RqFhw' \
    > test.out 2>&1
eval_tap $? 398 'GenerateTokenByNewHeadlessAccountV4' test.out

#- 399 Verify2faCodeV4
./ng net.accelbyte.sdk.cli.Main iam verify2faCodeV4 \
    --code 'gXBaGuRH' \
    --factor 'Rh4diqf8' \
    --mfaToken 'W8R4DrUV' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 399 'Verify2faCodeV4' test.out

#- 400 PlatformTokenGrantV4
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV4 \
    --platformId 'lnrR03aK' \
    --codeChallenge 'P0KyBVmE' \
    --codeChallengeMethod 'plain' \
    --additionalData 'gPrrhEgr' \
    --clientId 'n0VUxr5k' \
    --createHeadless  \
    --deviceId 'qKkn88px' \
    --macAddress 'CsfrxdIs' \
    --platformToken 'wcXVkq90' \
    --serviceLabel '0.9096072211000693' \
    --skipSetCookie  \
    > test.out 2>&1
eval_tap $? 400 'PlatformTokenGrantV4' test.out

#- 401 SimultaneousLoginV4
./ng net.accelbyte.sdk.cli.Main iam simultaneousLoginV4 \
    --codeChallenge 'XOrSPvKu' \
    --codeChallengeMethod 'plain' \
    --simultaneousPlatform 'ovMZ9zOI' \
    --simultaneousTicket 'G4HDpxJS' \
    --nativePlatform 'epicgames' \
    --nativePlatformTicket 'ci3ke6f3' \
    > test.out 2>&1
eval_tap $? 401 'SimultaneousLoginV4' test.out

#- 402 TokenGrantV4
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV4 \
    --codeChallenge 'BZdljmmI' \
    --codeChallengeMethod 'plain' \
    --additionalData 'O4E0oyj3' \
    --clientId 'hB79zec7' \
    --clientSecret 'Djp9mlaI' \
    --code 'bfaOK4Fj' \
    --codeVerifier '2d24X0Wq' \
    --extendNamespace 'tYEsqZWc' \
    --extendExp  \
    --loginQueueTicket 'BdPWEHQ6' \
    --password '9SBoqlQc' \
    --redirectUri 'EZ3eK4Ej' \
    --refreshToken 'kJJZCDna' \
    --scope 'hun5YaPQ' \
    --username 'IJ2pTLRT' \
    --grantType 'refresh_token' \
    > test.out 2>&1
eval_tap $? 402 'TokenGrantV4' test.out

#- 403 RequestTargetTokenResponseV4
./ng net.accelbyte.sdk.cli.Main iam requestTargetTokenResponseV4 \
    --additionalData 'bGot4sYn' \
    --code '5Tzxaej7' \
    > test.out 2>&1
eval_tap $? 403 'RequestTargetTokenResponseV4' test.out

#- 404 PublicListUserIDByPlatformUserIDsV4
./ng net.accelbyte.sdk.cli.Main iam publicListUserIDByPlatformUserIDsV4 \
    --namespace "$AB_NAMESPACE" \
    --platformId '16EAggVg' \
    --rawPUID  \
    --body '{"pidType": "TOVNIMFp", "platformUserIds": ["3bFVLwNx", "6h13fxg6", "0KsYqC9o"]}' \
    > test.out 2>&1
eval_tap $? 404 'PublicListUserIDByPlatformUserIDsV4' test.out

#- 405 PublicGetUserByPlatformUserIDV4
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByPlatformUserIDV4 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'knjOTHlh' \
    --platformUserId 'tbxiA9Ga' \
    > test.out 2>&1
eval_tap $? 405 'PublicGetUserByPlatformUserIDV4' test.out

#- 406 PublicCreateTestUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateTestUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "XxjCBemm", "policyId": "HO6ygkCJ", "policyVersionId": "uGnkDbLa"}, {"isAccepted": false, "localizedPolicyVersionId": "v5qIVJMT", "policyId": "h6dONK4d", "policyVersionId": "fECwGyki"}, {"isAccepted": false, "localizedPolicyVersionId": "tRRbYqs3", "policyId": "g6SzwGtK", "policyVersionId": "rsDrTuRi"}], "authType": "EMAILPASSWD", "country": "Zkshhg0z", "dateOfBirth": "7wlfNsVj", "displayName": "MBclVKjI", "emailAddress": "PON5JVwm", "password": "8dkpq2vs", "passwordMD5Sum": "z7NkQada", "uniqueDisplayName": "ZFV8tTN1", "username": "dUAjnoje", "verified": true}' \
    > test.out 2>&1
eval_tap $? 406 'PublicCreateTestUserV4' test.out

#- 407 PublicCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "gwr4SosV", "policyId": "gU3RLSjl", "policyVersionId": "FCwWBnex"}, {"isAccepted": true, "localizedPolicyVersionId": "D2RiY60M", "policyId": "ks7mmq75", "policyVersionId": "A62nOPHv"}, {"isAccepted": false, "localizedPolicyVersionId": "3mapI0up", "policyId": "jkMGxAyN", "policyVersionId": "cyHMZGx0"}], "authType": "EMAILPASSWD", "code": "XbWUSHKw", "country": "fxxucKhQ", "dateOfBirth": "2eZtseD1", "displayName": "fCUV3MjW", "emailAddress": "dt4oKI02", "password": "eSDDzftT", "passwordMD5Sum": "IgM8481S", "reachMinimumAge": false, "uniqueDisplayName": "Z6xwq3fG", "username": "7pLyyTjY"}' \
    > test.out 2>&1
eval_tap $? 407 'PublicCreateUserV4' test.out

#- 408 CreateUserFromInvitationV4
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV4 \
    --invitationId 'XcRHK6bn' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "awDWdl8O", "policyId": "XrMTZ2n2", "policyVersionId": "VsW4QAsD"}, {"isAccepted": true, "localizedPolicyVersionId": "XRCuZ5W0", "policyId": "I97D4pkE", "policyVersionId": "kbhtZmdE"}, {"isAccepted": false, "localizedPolicyVersionId": "QbVK8k9a", "policyId": "Tbv8oMhg", "policyVersionId": "LImXvWpD"}], "authType": "EMAILPASSWD", "code": "G2rdkTTQ", "country": "dS2o2l0M", "dateOfBirth": "H1jX1av5", "displayName": "sLjG4wqi", "emailAddress": "PvOZyM8q", "password": "yIFMkvuH", "passwordMD5Sum": "gaztbFpm", "reachMinimumAge": false, "uniqueDisplayName": "gNc4MAQn", "username": "pbI7gY5X"}' \
    > test.out 2>&1
eval_tap $? 408 'CreateUserFromInvitationV4' test.out

#- 409 PublicUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "6u8HdaI6", "country": "Pmz5FREl", "dateOfBirth": "kDOemGN9", "displayName": "v4p55SNe", "languageTag": "xMZBxPyU", "uniqueDisplayName": "hSSQbTdS", "userName": "0ja8pejv"}' \
    > test.out 2>&1
eval_tap $? 409 'PublicUpdateUserV4' test.out

#- 410 PublicUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "UQ0SlVIt", "emailAddress": "3eTRYN2Q"}' \
    > test.out 2>&1
eval_tap $? 410 'PublicUpdateUserEmailAddressV4' test.out

#- 411 PublicUpgradeHeadlessAccountWithVerificationCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountWithVerificationCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "OcXdf0Eh", "country": "GKKIsHOm", "dateOfBirth": "oRKsRFDf", "displayName": "yFDwUAkH", "emailAddress": "gRWzPUV9", "password": "9t88xEYw", "reachMinimumAge": false, "uniqueDisplayName": "1mZRp4sG", "username": "sMEMs8Gl", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 411 'PublicUpgradeHeadlessAccountWithVerificationCodeV4' test.out

#- 412 PublicUpgradeHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"dateOfBirth": "foRNRJzZ", "displayName": "Zr9Egoay", "emailAddress": "AsZH7Dbm", "password": "vfXrXZBL", "uniqueDisplayName": "eIdOTngX", "username": "0SZbJwtj"}' \
    > test.out 2>&1
eval_tap $? 412 'PublicUpgradeHeadlessAccountV4' test.out

#- 413 PublicDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"factor": "nvWaQnvD", "mfaToken": "8M9viaCC"}' \
    > test.out 2>&1
eval_tap $? 413 'PublicDisableMyAuthenticatorV4' test.out

#- 414 PublicEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'zLpEKeeF' \
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
    --body '{"factor": "v5l69Vbj", "mfaToken": "QZ8VoCub"}' \
    > test.out 2>&1
eval_tap $? 418 'PublicDisableMyBackupCodesV4' test.out

#- 419 PublicDownloadMyBackupCodesV4
eval_tap 0 419 'PublicDownloadMyBackupCodesV4 # SKIP deprecated' test.out

#- 420 PublicEnableMyBackupCodesV4
eval_tap 0 420 'PublicEnableMyBackupCodesV4 # SKIP deprecated' test.out

#- 421 PublicGetBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGetBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --languageTag 'ZMESRUut' \
    > test.out 2>&1
eval_tap $? 421 'PublicGetBackupCodesV4' test.out

#- 422 PublicGenerateBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --languageTag 'J56bl2JR' \
    > test.out 2>&1
eval_tap $? 422 'PublicGenerateBackupCodesV4' test.out

#- 423 PublicEnableBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --languageTag '6aXAmsH2' \
    > test.out 2>&1
eval_tap $? 423 'PublicEnableBackupCodesV4' test.out

#- 424 PublicChallengeMyMFAV4
./ng net.accelbyte.sdk.cli.Main iam publicChallengeMyMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'eGevIkrJ' \
    --factor 'J5yUCdEc' \
    > test.out 2>&1
eval_tap $? 424 'PublicChallengeMyMFAV4' test.out

#- 425 PublicRemoveTrustedDeviceV4
./ng net.accelbyte.sdk.cli.Main iam publicRemoveTrustedDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceToken 'L8b2IM09' \
    > test.out 2>&1
eval_tap $? 425 'PublicRemoveTrustedDeviceV4' test.out

#- 426 PublicSendMyMFAEmailCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicSendMyMFAEmailCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --action 'fFc5T0gr' \
    --languageTag 'mg1OkXGy' \
    > test.out 2>&1
eval_tap $? 426 'PublicSendMyMFAEmailCodeV4' test.out

#- 427 PublicDisableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyEmailV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"factor": "kzGIawIf", "mfaToken": "uP1r8os0"}' \
    > test.out 2>&1
eval_tap $? 427 'PublicDisableMyEmailV4' test.out

#- 428 PublicEnableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyEmailV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'EpDI5tNE' \
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
    --factor 'XDgeNqzJ' \
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
    --userId '78ottEB3' \
    > test.out 2>&1
eval_tap $? 433 'PublicGetUserPublicInfoByUserIdV4' test.out

#- 434 PublicInviteUserV4
./ng net.accelbyte.sdk.cli.Main iam publicInviteUserV4 \
    --body '{"additionalData": "VYvy6qPd", "emailAddress": "W5CM610H", "languageTag": "kPULZigs", "namespace": "dGqWvBd5", "namespaceDisplayName": "gw1pHk95"}' \
    > test.out 2>&1
eval_tap $? 434 'PublicInviteUserV4' test.out

#- 435 PublicUpgradeHeadlessWithCodeV4Forward
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessWithCodeV4Forward \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "BgVWGuVq", "policyId": "1XnSJAoI", "policyVersionId": "uADqKE7b"}, {"isAccepted": true, "localizedPolicyVersionId": "BROJwEDF", "policyId": "ddOOxsOA", "policyVersionId": "0BgKTLAx"}, {"isAccepted": true, "localizedPolicyVersionId": "3vuvrbCR", "policyId": "faHzXd3h", "policyVersionId": "OC7hcQJA"}], "code": "R7d0W2KM", "country": "902QUVwR", "dateOfBirth": "TcTihxqe", "displayName": "jMZvKX9r", "emailAddress": "cNlbov5d", "password": "oGKsmOIb", "reachMinimumAge": true, "uniqueDisplayName": "hk4NOg0D", "username": "ZBWcRjpm", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 435 'PublicUpgradeHeadlessWithCodeV4Forward' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
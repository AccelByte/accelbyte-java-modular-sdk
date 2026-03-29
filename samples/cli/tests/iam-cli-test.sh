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
    --body '{"modules": [{"docLink": "Qs2x7jdf", "groups": [{"group": "6Y6BAaYj", "groupId": "KC8ixtQ1", "permissions": [{"allowedActions": [34, 44, 0], "resource": "e3u69WA6"}, {"allowedActions": [18, 39, 41], "resource": "tZRXyBU7"}, {"allowedActions": [84, 53, 82], "resource": "KyWpw9ra"}]}, {"group": "AwwkEGbT", "groupId": "waZZxn7l", "permissions": [{"allowedActions": [69, 11, 89], "resource": "8T6Zbxaf"}, {"allowedActions": [46, 95, 73], "resource": "2PXelg4J"}, {"allowedActions": [62, 76, 56], "resource": "1Weu5x94"}]}, {"group": "4q3gMEud", "groupId": "aXF5w1tC", "permissions": [{"allowedActions": [87, 97, 81], "resource": "uCF1YI4z"}, {"allowedActions": [60, 68, 35], "resource": "kTicQdJJ"}, {"allowedActions": [28, 37, 60], "resource": "sQvc48mF"}]}], "module": "asGqRxe7", "moduleId": "SkvK7Qh3"}, {"docLink": "D2cAJQyc", "groups": [{"group": "qezCmrHh", "groupId": "0duMCblL", "permissions": [{"allowedActions": [30, 79, 99], "resource": "Bo8gf0AG"}, {"allowedActions": [93, 59, 76], "resource": "t7aKAezi"}, {"allowedActions": [37, 70, 78], "resource": "LcrxyGmF"}]}, {"group": "ep9ydTF2", "groupId": "jDz3K3Wj", "permissions": [{"allowedActions": [49, 90, 37], "resource": "XnIX7OCS"}, {"allowedActions": [40, 5, 71], "resource": "pdVkCM2V"}, {"allowedActions": [66, 0, 96], "resource": "7ZmwX6GX"}]}, {"group": "FGnjDcB1", "groupId": "rVjZfFkJ", "permissions": [{"allowedActions": [53, 96, 96], "resource": "hPuZ9w2h"}, {"allowedActions": [9, 79, 68], "resource": "DvirNOwc"}, {"allowedActions": [50, 12, 43], "resource": "zBBXjbDO"}]}], "module": "1hkm0sG2", "moduleId": "eOA6zVmc"}, {"docLink": "r9RKBoP1", "groups": [{"group": "teYqKSYE", "groupId": "dzu0917M", "permissions": [{"allowedActions": [34, 47, 12], "resource": "bBmPg1vD"}, {"allowedActions": [10, 23, 51], "resource": "CFfmBHXl"}, {"allowedActions": [32, 45, 95], "resource": "4d3d1gPh"}]}, {"group": "orRbFzyj", "groupId": "hh1jpxmQ", "permissions": [{"allowedActions": [45, 56, 77], "resource": "5L8ZIyI2"}, {"allowedActions": [11, 16, 19], "resource": "0bTf0iZr"}, {"allowedActions": [69, 29, 21], "resource": "KDLhcLFc"}]}, {"group": "7vAEq0ol", "groupId": "DfgRzS4h", "permissions": [{"allowedActions": [92, 12, 34], "resource": "Ea4K0HZJ"}, {"allowedActions": [3, 78, 21], "resource": "3QIaKiQd"}, {"allowedActions": [57, 72, 7], "resource": "gyZZS50w"}]}], "module": "6qxhZ6TO", "moduleId": "fQoM5tXE"}]}' \
    > test.out 2>&1
eval_tap $? 109 'AdminUpdateAvailablePermissionsByModule' test.out

#- 110 AdminDeleteConfigPermissionsByGroup
./ng net.accelbyte.sdk.cli.Main iam adminDeleteConfigPermissionsByGroup \
    --forceDelete  \
    --body '{"groupId": "B8DdnQV3", "moduleId": "NZWeFUZU"}' \
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
    --body '[{"field": "0cOQfRrb", "validation": {"allowAllSpecialCharacters": true, "allowDigit": true, "allowLetter": false, "allowSpace": false, "allowUnicode": false, "avatarConfig": {"allowedPrefixes": ["NpRi5nUE", "OYBDcm8m", "vYFOFKqp"], "preferRegex": true, "regex": "jvOiomZb"}, "blockedWord": ["JXeV1Cej", "GpKNkokD", "yNLcJKsz"], "description": [{"language": "HQjqTqoa", "message": ["S7xy9MsG", "W72qaD34", "9hSG7yHq"]}, {"language": "JRgSzxGA", "message": ["ZHH4NgUa", "0V2asDwP", "WajVIr3P"]}, {"language": "p3QJcmrV", "message": ["IymGTT1J", "3uxfaSke", "YBT2Y9ND"]}], "isCustomRegex": false, "letterCase": "G7P11OKW", "maxLength": 80, "maxRepeatingAlphaNum": 85, "maxRepeatingSpecialCharacter": 58, "minCharType": 73, "minLength": 24, "profanityFilter": "qfNNJMNr", "regex": "QDIAVAFW", "specialCharacterLocation": "XuJHgxgA", "specialCharacters": ["mSQajwQb", "fLEStYIo", "jmrI3pmh"]}}, {"field": "9EmES9OL", "validation": {"allowAllSpecialCharacters": true, "allowDigit": false, "allowLetter": true, "allowSpace": false, "allowUnicode": true, "avatarConfig": {"allowedPrefixes": ["OToEQNvc", "LA47mawt", "DmdPWaac"], "preferRegex": true, "regex": "EmcAzBr5"}, "blockedWord": ["7IjXAsZz", "bz6VpUwp", "SeDh3uY1"], "description": [{"language": "tTaEgiaF", "message": ["hGjAGCRC", "SZq7F6P2", "IVfwpXFG"]}, {"language": "9g8mQOON", "message": ["gtVhVXvf", "eA9UKGul", "HZBIp2Xk"]}, {"language": "zOP5d3Wy", "message": ["PnmagyCr", "0XuTs01L", "8xRSXj8U"]}], "isCustomRegex": true, "letterCase": "12RAM5RA", "maxLength": 21, "maxRepeatingAlphaNum": 65, "maxRepeatingSpecialCharacter": 3, "minCharType": 38, "minLength": 2, "profanityFilter": "lmcWDi0I", "regex": "A3NI5bD9", "specialCharacterLocation": "tLugb6Fq", "specialCharacters": ["ekFxep1n", "rdaQLgdf", "iOot0n23"]}}, {"field": "ltI1GUO5", "validation": {"allowAllSpecialCharacters": true, "allowDigit": false, "allowLetter": true, "allowSpace": false, "allowUnicode": false, "avatarConfig": {"allowedPrefixes": ["Kc8VNeIg", "8JLW4keZ", "g8eingIp"], "preferRegex": false, "regex": "E20ZyFIt"}, "blockedWord": ["yCIvdeVm", "1HhF3NBs", "85frQ2L7"], "description": [{"language": "LPAhBOHA", "message": ["UIjQhKn0", "yP8pLnGW", "vEkmqPnn"]}, {"language": "DKToNBCN", "message": ["fKjpe4h6", "6ZIfnz2t", "tpEpeOCV"]}, {"language": "xFq6yl7z", "message": ["JPBWignp", "1JG2w9x9", "vD6YstUR"]}], "isCustomRegex": false, "letterCase": "zjp24WHh", "maxLength": 71, "maxRepeatingAlphaNum": 14, "maxRepeatingSpecialCharacter": 61, "minCharType": 98, "minLength": 71, "profanityFilter": "htmFmv7l", "regex": "AsoOyJzo", "specialCharacterLocation": "MBB695iS", "specialCharacters": ["VQJENCZv", "DYbUBVzO", "6U7LOIA9"]}}]' \
    > test.out 2>&1
eval_tap $? 113 'AdminUpdateInputValidations' test.out

#- 114 AdminResetInputValidations
./ng net.accelbyte.sdk.cli.Main iam adminResetInputValidations \
    --field 'MItCm2Np' \
    > test.out 2>&1
eval_tap $? 114 'AdminResetInputValidations' test.out

#- 115 ListAdminsV3
./ng net.accelbyte.sdk.cli.Main iam listAdminsV3 \
    --namespace "$AB_NAMESPACE" \
    --after 'AYwYx7lA' \
    --before 'SyH8xZ5j' \
    --endDate 'kMqAx49D' \
    --limit '52' \
    --query 'lwxD1Sp0' \
    --roleId 'UFr4lNkp' \
    --startDate 'myxtkIA4' \
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
    --body '{"ageRestriction": 45, "enable": false}' \
    > test.out 2>&1
eval_tap $? 117 'AdminUpdateAgeRestrictionConfigV3' test.out

#- 118 AdminGetListCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminGetListCountryAgeRestrictionV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 118 'AdminGetListCountryAgeRestrictionV3' test.out

#- 119 AdminUpdateCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateCountryAgeRestrictionV3 \
    --countryCode 'fUdckQgh' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ageRestriction": 67}' \
    > test.out 2>&1
eval_tap $? 119 'AdminUpdateCountryAgeRestrictionV3' test.out

#- 120 AdminGetBannedUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType 'pBzebeRe' \
    --limit '60' \
    --offset '31' \
    > test.out 2>&1
eval_tap $? 120 'AdminGetBannedUsersV3' test.out

#- 121 AdminBanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"ban": "tSvVWTg9", "comment": "d1XQuqPI", "endDate": "qaCLvkTe", "reason": "XkwnSa2a", "skipNotif": false, "userIds": ["urpzhNI3", "Zs3sxpAx", "rNS5wJh6"]}' \
    > test.out 2>&1
eval_tap $? 121 'AdminBanUserBulkV3' test.out

#- 122 AdminUnbanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminUnbanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"bans": [{"banId": "DDab4fVE", "userId": "JyVLFJMj"}, {"banId": "X509iUKS", "userId": "bGyInIZa"}, {"banId": "qlUCKblR", "userId": "YGRmlOkU"}]}' \
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
    --clientId 'C1IfZPew' \
    --clientName '7VkTUjSB' \
    --clientType 'gxnpUMV9' \
    --limit '59' \
    --offset '12' \
    --skipLoginQueue  \
    > test.out 2>&1
eval_tap $? 124 'AdminGetClientsByNamespaceV3' test.out

#- 125 AdminBulkUpdateClientsV3
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateClientsV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientIds": ["cylw1ZzI", "GdDK4ajt", "CdcfkCjc"], "clientUpdateRequest": {"audiences": ["DAAE7Cq4", "ZVhi7AUH", "Zg5yc7Xy"], "baseUri": "bHGXYQqR", "clientName": "4CYd2Nra", "clientPermissions": [{"action": 26, "resource": "M1H1IM53", "schedAction": 50, "schedCron": "sUxxBdIv", "schedRange": ["yKBYEjTf", "kzsiNw8W", "1fToPBxL"]}, {"action": 59, "resource": "VRhb9RA9", "schedAction": 50, "schedCron": "KVvN3Ayj", "schedRange": ["h6bcTwRA", "QmYAiVxX", "TN12Saui"]}, {"action": 57, "resource": "RmnrG5VR", "schedAction": 15, "schedCron": "aBNcIU4A", "schedRange": ["viORYeRj", "3zpbweBh", "84W1V4q1"]}], "clientPlatform": "6TliJMBg", "deletable": true, "description": "fMCTN6ar", "modulePermissions": [{"moduleId": "63PdqDvB", "selectedGroups": [{"groupId": "jeDdUarS", "selectedActions": [45, 64, 31]}, {"groupId": "C3u3jUY5", "selectedActions": [62, 88, 75]}, {"groupId": "ByCNKnyQ", "selectedActions": [8, 50, 90]}]}, {"moduleId": "QCMLbX4U", "selectedGroups": [{"groupId": "VnISDp23", "selectedActions": [44, 90, 29]}, {"groupId": "PytN4p6a", "selectedActions": [47, 29, 96]}, {"groupId": "bjmbJFLp", "selectedActions": [69, 93, 35]}]}, {"moduleId": "eMvHFLJL", "selectedGroups": [{"groupId": "PkJJ3Ncd", "selectedActions": [46, 59, 46]}, {"groupId": "msItQKSK", "selectedActions": [4, 54, 63]}, {"groupId": "2VvxOAW2", "selectedActions": [40, 53, 41]}]}], "namespace": "tsy0dP4o", "oauthAccessTokenExpiration": 71, "oauthAccessTokenExpirationTimeUnit": "0ahN5hej", "oauthRefreshTokenExpiration": 8, "oauthRefreshTokenExpirationTimeUnit": "WLfLWTpZ", "redirectUri": "GXBtnQX7", "scopes": ["9a3W8uyN", "Vqn0MaAy", "XUMAwP2g"], "skipLoginQueue": false, "twoFactorEnabled": false}}' \
    > test.out 2>&1
eval_tap $? 125 'AdminBulkUpdateClientsV3' test.out

#- 126 AdminCreateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateClientV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["78aSFYKJ", "NoL5YVcA", "f71DS1pw"], "baseUri": "JSrEDWGg", "clientId": "1gHCmZDe", "clientName": "7JBIbFzv", "clientPermissions": [{"action": 84, "resource": "dztKpoka", "schedAction": 98, "schedCron": "I2VuMu07", "schedRange": ["YN6iZOrZ", "l7H3IHpk", "7LGSniAl"]}, {"action": 68, "resource": "9tv64m0q", "schedAction": 67, "schedCron": "orqvd4vk", "schedRange": ["DijhBaQU", "3RS67fAf", "s7Va5z8I"]}, {"action": 24, "resource": "EBDNjaje", "schedAction": 24, "schedCron": "6fIuSgYo", "schedRange": ["OoG5oW2M", "KSM3CaQv", "hCBlKTE2"]}], "clientPlatform": "X99KmEIZ", "deletable": true, "description": "iUIBTGwk", "modulePermissions": [{"moduleId": "OaDuAthS", "selectedGroups": [{"groupId": "OEqyYCCZ", "selectedActions": [56, 35, 61]}, {"groupId": "spgpPabF", "selectedActions": [73, 19, 56]}, {"groupId": "CjfcDwyt", "selectedActions": [24, 34, 94]}]}, {"moduleId": "2sB23GaV", "selectedGroups": [{"groupId": "srX856Jw", "selectedActions": [46, 76, 67]}, {"groupId": "8Aq6jipK", "selectedActions": [41, 63, 58]}, {"groupId": "pVycC3SC", "selectedActions": [33, 73, 94]}]}, {"moduleId": "cg1qZCho", "selectedGroups": [{"groupId": "0pliBIJQ", "selectedActions": [37, 31, 55]}, {"groupId": "hETTdxGb", "selectedActions": [73, 43, 41]}, {"groupId": "1bu5CDpn", "selectedActions": [83, 10, 41]}]}], "namespace": "j10ngapB", "oauthAccessTokenExpiration": 5, "oauthAccessTokenExpirationTimeUnit": "2N1VrQ3U", "oauthClientType": "u3FaYDq8", "oauthRefreshTokenExpiration": 26, "oauthRefreshTokenExpirationTimeUnit": "zoWuVUZ9", "parentNamespace": "pzS3Xycb", "redirectUri": "RK9MetjB", "scopes": ["EDfryp3N", "Z7VyQhgQ", "zeMX3TbV"], "secret": "KMqnIwfG", "skipLoginQueue": false, "twoFactorEnabled": false}' \
    > test.out 2>&1
eval_tap $? 126 'AdminCreateClientV3' test.out

#- 127 AdminGetClientsbyNamespacebyIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetClientsbyNamespacebyIDV3 \
    --clientId 'h7zV06aL' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 127 'AdminGetClientsbyNamespacebyIDV3' test.out

#- 128 AdminDeleteClientV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientV3 \
    --clientId 'hcoZtyJc' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 128 'AdminDeleteClientV3' test.out

#- 129 AdminUpdateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientV3 \
    --clientId 'WiRJUTKK' \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["QbRjSbSr", "12aScfQ6", "94n6ph5F"], "baseUri": "pstjM4w9", "clientName": "uGbNAy4G", "clientPermissions": [{"action": 90, "resource": "RZ6q4Yqh", "schedAction": 25, "schedCron": "gXS6yG4A", "schedRange": ["lZuJb2OF", "KTOC6jGU", "gXduu0lH"]}, {"action": 27, "resource": "CVcMH3V2", "schedAction": 61, "schedCron": "zO0VWCcY", "schedRange": ["mMqtqebr", "iDVz5enV", "P2MzlDxC"]}, {"action": 72, "resource": "gXzFDcN4", "schedAction": 6, "schedCron": "HD26wDi8", "schedRange": ["0cTJXyc9", "gHbxpJPu", "rJ7HXgZN"]}], "clientPlatform": "eBLt26Ps", "deletable": true, "description": "1vWmWRxs", "modulePermissions": [{"moduleId": "H8MHABFe", "selectedGroups": [{"groupId": "GLE4Z3bh", "selectedActions": [27, 36, 72]}, {"groupId": "3oPenOC1", "selectedActions": [32, 27, 11]}, {"groupId": "WgJTfUXR", "selectedActions": [3, 72, 92]}]}, {"moduleId": "pEahXZm4", "selectedGroups": [{"groupId": "V8ugKCjg", "selectedActions": [26, 11, 92]}, {"groupId": "PdEAZUW2", "selectedActions": [17, 31, 43]}, {"groupId": "BTuUcB96", "selectedActions": [16, 16, 36]}]}, {"moduleId": "REiqw8OO", "selectedGroups": [{"groupId": "xSdah0OA", "selectedActions": [57, 41, 10]}, {"groupId": "qcq6pHsv", "selectedActions": [39, 35, 3]}, {"groupId": "nVGjeuYI", "selectedActions": [38, 40, 27]}]}], "namespace": "7vthg0mA", "oauthAccessTokenExpiration": 58, "oauthAccessTokenExpirationTimeUnit": "dI3kQn0Z", "oauthRefreshTokenExpiration": 78, "oauthRefreshTokenExpirationTimeUnit": "Q1cWdBgz", "redirectUri": "WkHueswK", "scopes": ["6WC58Mj0", "aSNXD6lT", "9oyc2F7J"], "skipLoginQueue": true, "twoFactorEnabled": true}' \
    > test.out 2>&1
eval_tap $? 129 'AdminUpdateClientV3' test.out

#- 130 AdminUpdateClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientPermissionV3 \
    --clientId 'vbzCnhHg' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 59, "resource": "lVfGXsHj"}, {"action": 99, "resource": "wKdxCJSM"}, {"action": 22, "resource": "tde4OWsL"}]}' \
    > test.out 2>&1
eval_tap $? 130 'AdminUpdateClientPermissionV3' test.out

#- 131 AdminAddClientPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddClientPermissionsV3 \
    --clientId 'nS0rB5RX' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 54, "resource": "zjgAHkAl"}, {"action": 48, "resource": "AZgYuala"}, {"action": 84, "resource": "XM6SB12T"}]}' \
    > test.out 2>&1
eval_tap $? 131 'AdminAddClientPermissionsV3' test.out

#- 132 AdminDeleteClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientPermissionV3 \
    --action '27' \
    --clientId 'b39gk5xk' \
    --namespace "$AB_NAMESPACE" \
    --resource 'wH5vDdSw' \
    > test.out 2>&1
eval_tap $? 132 'AdminDeleteClientPermissionV3' test.out

#- 133 AdminGetConfigValueV3
./ng net.accelbyte.sdk.cli.Main iam adminGetConfigValueV3 \
    --configKey 'P8Eqb7So' \
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
    --body '{"blacklist": ["gat9XHvr", "6l9PKAs0", "u4YfRdiy"]}' \
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
    --body '{"active": true, "roleIds": ["UxlLmGJs", "NOW4At7W", "L6jLMYx3"]}' \
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
    --limit '34' \
    --offset '3' \
    > test.out 2>&1
eval_tap $? 141 'RetrieveAllSSOLoginPlatformCredentialV3' test.out

#- 142 RetrieveThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '81ttffPq' \
    > test.out 2>&1
eval_tap $? 142 'RetrieveThirdPartyLoginPlatformCredentialV3' test.out

#- 143 AddThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam addThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '9E2PQJhl' \
    --body '{"ACSURL": "Uzjx1abQ", "AWSCognitoRegion": "Qykp0I91", "AWSCognitoUserPool": "qjLnVjR5", "AllowedClients": ["vaYwCITn", "dNSUBShc", "fiKiZRPG"], "AppId": "PmZf4v2T", "AuthorizationEndpoint": "L7FUhQKv", "ClientId": "hjypIYSf", "EmptyStrFieldList": ["b1M741rd", "x68SKipt", "QjPbFbqN"], "EnableServerLicenseValidation": false, "Environment": "EaHswGc8", "FederationMetadataURL": "foLs44q7", "GenericOauthFlow": false, "IncludePUID": true, "IsActive": false, "Issuer": "EpZpmIb8", "JWKSEndpoint": "L6Sd7KZ3", "KeyID": "9AOLGesd", "LogoURL": "g1pafwGA", "NetflixCertificates": {"encryptedPrivateKey": "AWPTuYjZ", "encryptedPrivateKeyName": "r4egftFl", "publicCertificate": "WyQWAaQ2", "publicCertificateName": "ZcMXC2f8", "rootCertificate": "H4WkBKV7", "rootCertificateName": "pCeZMrhY"}, "OrganizationId": "ZBSILibg", "PlatformName": "MvzCGIkg", "PrivateKey": "3v5TCbg6", "RedirectUri": "O8G9dINS", "RegisteredDomains": [{"affectedClientIDs": ["8JwUuUQ8", "1YCUxNPe", "OXz6c3L4"], "domain": "fZwbhz7F", "namespaces": ["KpD6KNdn", "KKPmsR3s", "Q0Qq0Nam"], "roleId": "ztpH9YIk", "ssoCfg": {"googleKey": {"2s9L9V5E": {}, "uoXkiBF2": {}, "WoeH90yT": {}}, "groupConfigs": [{"assignNamespaces": ["Cb48tpxS", "NYJeinmo", "oYdwuJYw"], "group": "6bSAMy9a", "roleId": "L6JT30Rk"}, {"assignNamespaces": ["r9DjaXM1", "HmMi5kaU", "1pS7KWdH"], "group": "0TugO6qs", "roleId": "32QoUeIr"}, {"assignNamespaces": ["xm3phHzs", "zBwZO9ZR", "UQVfR29B"], "group": "jwvMWPbe", "roleId": "KbE9KnEu"}]}}, {"affectedClientIDs": ["Va7JBq6j", "7P138d9p", "5qjbAOWK"], "domain": "NA8MdMVi", "namespaces": ["GMhZQjx5", "3lZFvbWq", "fhL9NusO"], "roleId": "KJtrDMfx", "ssoCfg": {"googleKey": {"3iDC6zFr": {}, "oNkzS5zi": {}, "3d7XsU6r": {}}, "groupConfigs": [{"assignNamespaces": ["VcWy3KAx", "jl17KbQb", "Efr93Hli"], "group": "n3ho2eJZ", "roleId": "93G31ZFi"}, {"assignNamespaces": ["Mab6zW3s", "9ryMDh5c", "empkesvv"], "group": "y8yNnMFr", "roleId": "0xBU5TrC"}, {"assignNamespaces": ["H3U1zaCf", "VjAwE2SS", "aRHXI2rG"], "group": "LMMkMCPW", "roleId": "zS2w8YWA"}]}}, {"affectedClientIDs": ["BNv5xiip", "1meGPrtU", "T8uOcut2"], "domain": "KppbCQWt", "namespaces": ["9UTJaLuI", "zQqUdBNk", "XfYewn1p"], "roleId": "rWOsfVQZ", "ssoCfg": {"googleKey": {"qu2nLseJ": {}, "LR6Ew9FL": {}, "VIZXAUM1": {}}, "groupConfigs": [{"assignNamespaces": ["GcL9hsOd", "Elwz78hs", "SVQCl2Iw"], "group": "EgJCP3Ir", "roleId": "IQgicAYJ"}, {"assignNamespaces": ["2hH4sVnC", "dnI581xI", "pbBpog0M"], "group": "QV1gNZyE", "roleId": "Gqr3FSEa"}, {"assignNamespaces": ["DTo8JDeT", "cIZXpsfG", "euhbt4nX"], "group": "FFatQT8U", "roleId": "Ia6WPYth"}]}}], "RelyingParty": "OGMTJJhQ", "SandboxId": "A3FVWuNg", "Secret": "mHNKYxbT", "TeamID": "cyozCyCe", "TokenAuthenticationType": "YIWB0P3j", "TokenClaimsMapping": {"r3Cn5Md3": "0Xawoz7C", "YCeWp33Q": "YZ4bhfpZ", "EMVvqvdO": "WPIZKla8"}, "TokenEndpoint": "0QTzvZ03", "UserInfoEndpoint": "QpfqMSKK", "UserInfoHTTPMethod": "25paal6z", "googleAdminConsoleKey": "JECpi7Zv", "scopes": ["Xj3V79jo", "GqcYCX55", "E5JLOnUK"]}' \
    > test.out 2>&1
eval_tap $? 143 'AddThirdPartyLoginPlatformCredentialV3' test.out

#- 144 DeleteThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'agORLni8' \
    > test.out 2>&1
eval_tap $? 144 'DeleteThirdPartyLoginPlatformCredentialV3' test.out

#- 145 UpdateThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'hScwk3D3' \
    --body '{"ACSURL": "uNKh1lc3", "AWSCognitoRegion": "vh8UphiX", "AWSCognitoUserPool": "qjRcmfWP", "AllowedClients": ["0fXXGccD", "8dFH5c6X", "BHZ21RE7"], "AppId": "VmWL5uzS", "AuthorizationEndpoint": "GUV8LjEI", "ClientId": "jZYO8rVW", "EmptyStrFieldList": ["Nj5a7ZTA", "fclKYjbN", "gv1Y6X4e"], "EnableServerLicenseValidation": true, "Environment": "2mmZ9uGo", "FederationMetadataURL": "EMDxfPCe", "GenericOauthFlow": false, "IncludePUID": false, "IsActive": false, "Issuer": "Na8qcBCw", "JWKSEndpoint": "mHV8dkyi", "KeyID": "TWYx95zC", "LogoURL": "2UlxHnOw", "NetflixCertificates": {"encryptedPrivateKey": "JVho2H5m", "encryptedPrivateKeyName": "0hGw9ptX", "publicCertificate": "RMN6UU9W", "publicCertificateName": "k3BPAIr5", "rootCertificate": "xTzJAbVG", "rootCertificateName": "7Qt7US4o"}, "OrganizationId": "drifCQ54", "PlatformName": "vr7TrIeT", "PrivateKey": "Do8smv5h", "RedirectUri": "cwwTtnOn", "RegisteredDomains": [{"affectedClientIDs": ["Zmxi1J0y", "W8yoJUgt", "4nio87yK"], "domain": "9kAkhyuk", "namespaces": ["1zZP6Ou4", "rM0OsEEh", "zoY9usZA"], "roleId": "l6IlYOid", "ssoCfg": {"googleKey": {"7wk30tco": {}, "ngGh35IX": {}, "bmL2FctT": {}}, "groupConfigs": [{"assignNamespaces": ["NHuZzPBE", "upFDWmRj", "F8KjpJQ9"], "group": "B5nw2Wi7", "roleId": "cfnwUV55"}, {"assignNamespaces": ["FhK36TLW", "dVo9ViB9", "DF0eyRqA"], "group": "QCugIXR2", "roleId": "Dqw82fCI"}, {"assignNamespaces": ["2TG1HVED", "NyjNhWIs", "UV0kgZeX"], "group": "Fof6W28K", "roleId": "OwTnf24W"}]}}, {"affectedClientIDs": ["W2d2Jp6O", "dKIAQ2xq", "GlXgKOYv"], "domain": "gTBOIkTy", "namespaces": ["2QFcOPnP", "RRJcsKaU", "91jMBC8k"], "roleId": "N4TwSieW", "ssoCfg": {"googleKey": {"HZylCE1T": {}, "i4961YsE": {}, "pKAqGtsh": {}}, "groupConfigs": [{"assignNamespaces": ["qsV75Yvx", "jAhQm756", "CuzcmK7F"], "group": "tebsJQQg", "roleId": "uJ0uIsHH"}, {"assignNamespaces": ["ikNJeUEP", "lTWdSQ8U", "mmxdx026"], "group": "E9yzdXtd", "roleId": "jqfHRdb0"}, {"assignNamespaces": ["735QYcQ0", "WI9xFZvz", "UI729hrl"], "group": "s0LcpHcz", "roleId": "iPVUCxWD"}]}}, {"affectedClientIDs": ["Q4n7v6zU", "jSE3XSPH", "TRaN6LPl"], "domain": "OKCl6JD3", "namespaces": ["KUqHXlzc", "BSVuYQZ7", "IaiGS95f"], "roleId": "otQLDg9z", "ssoCfg": {"googleKey": {"txIFLW8T": {}, "MzsHnuQg": {}, "bSe0XJbf": {}}, "groupConfigs": [{"assignNamespaces": ["rh4A0qQ4", "jPAuPEUZ", "xUvIzqHZ"], "group": "tvcPjQ9n", "roleId": "kGWsOBiN"}, {"assignNamespaces": ["vfGRK058", "AKSBj1D7", "70YL3zSu"], "group": "obh6JEFe", "roleId": "9m4A3iA8"}, {"assignNamespaces": ["CY7aOG6C", "Zs2oqBfz", "tZh43VlU"], "group": "G3MJdtWv", "roleId": "dVPQfOhX"}]}}], "RelyingParty": "UXbAeo2D", "SandboxId": "QgFd5VUb", "Secret": "b00KNC5Y", "TeamID": "rkZ3F0MU", "TokenAuthenticationType": "rF29i1Cf", "TokenClaimsMapping": {"r9btK499": "FvLmc5AT", "J9pza1sL": "x8nt3n0R", "LZWbepth": "LrTVuVqt"}, "TokenEndpoint": "gWUXXRKK", "UserInfoEndpoint": "3euxtHjN", "UserInfoHTTPMethod": "PivtyuMN", "googleAdminConsoleKey": "VCGm1MT0", "scopes": ["fo8Q0Hup", "buLdWRBZ", "UdDOqsGg"]}' \
    > test.out 2>&1
eval_tap $? 145 'UpdateThirdPartyLoginPlatformCredentialV3' test.out

#- 146 UpdateThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'emSx1d4u' \
    --body '{"affectedClientIDs": ["5uTeV3E9", "Ib5psJJf", "BBXMsQCa"], "assignedNamespaces": ["Ab4rJFEX", "7JsLkysH", "40egK3ac"], "domain": "bV59tHyY", "roleId": "SBToC4nO", "ssoCfg": {"googleKey": {"8RKdqcHo": {}, "7L920h33": {}, "9B4qmv2m": {}}, "groupConfigs": [{"assignNamespaces": ["YW4DJlzq", "14GnxFu5", "qDHYhfbM"], "group": "IKsm4DEe", "roleId": "al1LYNPC"}, {"assignNamespaces": ["YeF1MApl", "T1hPzfnn", "lLkluHvj"], "group": "HtCARjoZ", "roleId": "zArWnvyN"}, {"assignNamespaces": ["gtPZeLeG", "ZWG7Lp97", "5OmDgxLa"], "group": "PcqZuBkS", "roleId": "hylmNZ77"}]}}' \
    > test.out 2>&1
eval_tap $? 146 'UpdateThirdPartyLoginPlatformDomainV3' test.out

#- 147 DeleteThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'KJViDFWL' \
    --body '{"domain": "QdrBFT3D", "ssoGroups": ["WFaznZ5t", "eGgKubgv", "7vgOsfOi"]}' \
    > test.out 2>&1
eval_tap $? 147 'DeleteThirdPartyLoginPlatformDomainV3' test.out

#- 148 PartialUpdateThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam partialUpdateThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'VY9E52P1' \
    --body '{"affectedClientIDs": ["oBLJ5bTF", "IZrbynlr", "emmrfjpN"], "assignedNamespaces": ["zTd3Sutk", "sabd7hjz", "nIRsm5vG"], "domain": "TFM2rO6V", "roleId": "WDcgoJ3P", "ssoCfg": {"googleKey": {"x7d5M3a1": {}, "90sSMGbq": {}, "igiBpb79": {}}, "groupConfigs": [{"assignNamespaces": ["QxQ2qsGC", "qXlaqwFI", "YIsKzHiz"], "group": "6kc4lQYP", "roleId": "qaOO8wLY"}, {"assignNamespaces": ["Sa5tAkGT", "Xvbs2MBB", "laqIvStF"], "group": "sgBvUywO", "roleId": "ReZYSksD"}, {"assignNamespaces": ["13Mt5IeN", "WoNEbk60", "ev9n8G9U"], "group": "yQMtmahE", "roleId": "VxO1jYHI"}]}}' \
    > test.out 2>&1
eval_tap $? 148 'PartialUpdateThirdPartyLoginPlatformDomainV3' test.out

#- 149 RetrieveSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam retrieveSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'wQB0MVjc' \
    > test.out 2>&1
eval_tap $? 149 'RetrieveSSOLoginPlatformCredential' test.out

#- 150 AddSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam addSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'yGi8jr2z' \
    --body '{"acsUrl": "dywxQODF", "apiKey": "utAjCJFd", "appId": "Hy2oPaaF", "federationMetadataUrl": "BNlLOKae", "isActive": false, "redirectUri": "wQfS9mnl", "secret": "ONcWMBqB", "ssoUrl": "9MWazZyd"}' \
    > test.out 2>&1
eval_tap $? 150 'AddSSOLoginPlatformCredential' test.out

#- 151 DeleteSSOLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteSSOLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'FeIrQs99' \
    > test.out 2>&1
eval_tap $? 151 'DeleteSSOLoginPlatformCredentialV3' test.out

#- 152 UpdateSSOPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam updateSSOPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'wJybvR4V' \
    --body '{"acsUrl": "pNuSedu4", "apiKey": "E85Fc4iW", "appId": "NZDD4n20", "federationMetadataUrl": "aQ5WwF6s", "isActive": true, "redirectUri": "UyBoTgNA", "secret": "uWsXWRiq", "ssoUrl": "asuZjjA1"}' \
    > test.out 2>&1
eval_tap $? 152 'UpdateSSOPlatformCredential' test.out

#- 153 AdminListUserIDByPlatformUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByPlatformUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'KkzNrYyN' \
    --rawPID  \
    --rawPUID  \
    --body '{"platformUserIds": ["KQa7GML8", "dYh4Ehw7", "NVK3p9Pw"]}' \
    > test.out 2>&1
eval_tap $? 153 'AdminListUserIDByPlatformUserIDsV3' test.out

#- 154 AdminGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'gDanWxlO' \
    --platformUserId 'KplkP7uJ' \
    --pidType 'Bx94gXpP' \
    > test.out 2>&1
eval_tap $? 154 'AdminGetUserByPlatformUserIDV3' test.out

#- 155 AdminGetProfileUpdateStrategyV3
./ng net.accelbyte.sdk.cli.Main iam adminGetProfileUpdateStrategyV3 \
    --namespace "$AB_NAMESPACE" \
    --field 'dob' \
    > test.out 2>&1
eval_tap $? 155 'AdminGetProfileUpdateStrategyV3' test.out

#- 156 AdminUpdateProfileUpdateStrategyV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateProfileUpdateStrategyV3 \
    --namespace "$AB_NAMESPACE" \
    --field 'dob' \
    --body '{"config": {"minimumAllowedInterval": 23}, "type": "r7Omby5X"}' \
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
    --identity 'VIEW_ONLY' \
    --body '{"additions": [{"actions": [52, 96, 27], "resource": "118afKAL"}, {"actions": [24, 26, 14], "resource": "EeB0ULfn"}, {"actions": [64, 78, 91], "resource": "V9YxuC1E"}], "exclusions": [{"actions": [39, 11, 76], "resource": "q67jK5Ll"}, {"actions": [9, 75, 3], "resource": "ZXWqua5q"}, {"actions": [37, 2, 9], "resource": "kme8854O"}], "overrides": [{"actions": [65, 67, 39], "resource": "6vzGNzFE"}, {"actions": [36, 61, 48], "resource": "OjXt4x6Z"}, {"actions": [55, 48, 92], "resource": "Zhov3brC"}], "replacements": [{"replacement": {"actions": [88, 20, 18], "resource": "4P7vLWTg"}, "target": "er0DYEqI"}, {"replacement": {"actions": [23, 14, 98], "resource": "AohAEWh6"}, "target": "A82VuWuM"}, {"replacement": {"actions": [3, 60, 26], "resource": "YMIhOoMh"}, "target": "nz1YH0Da"}]}' \
    > test.out 2>&1
eval_tap $? 158 'AdminUpdateRoleOverrideConfigV3' test.out

#- 159 AdminGetRoleSourceV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleSourceV3 \
    --namespace "$AB_NAMESPACE" \
    --identity 'VIEW_ONLY' \
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
    --roleId 'svLd861y' \
    > test.out 2>&1
eval_tap $? 161 'AdminGetRoleNamespacePermissionV3' test.out

#- 162 GetAdminUsersByRoleIdV3
./ng net.accelbyte.sdk.cli.Main iam getAdminUsersByRoleIdV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'VoBtqTFu' \
    --after '58' \
    --before '70' \
    --limit '43' \
    > test.out 2>&1
eval_tap $? 162 'GetAdminUsersByRoleIdV3' test.out

#- 163 AdminQueryTagV3
./ng net.accelbyte.sdk.cli.Main iam adminQueryTagV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '62' \
    --offset '14' \
    --tagName 'odLtg8Gn' \
    > test.out 2>&1
eval_tap $? 163 'AdminQueryTagV3' test.out

#- 164 AdminCreateTagV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateTagV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"tagName": "aYfCXKYd"}' \
    > test.out 2>&1
eval_tap $? 164 'AdminCreateTagV3' test.out

#- 165 AdminUpdateTagV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateTagV3 \
    --namespace "$AB_NAMESPACE" \
    --tagId 'qMEgIyTZ' \
    --body '{"tagName": "XbicBhtv"}' \
    > test.out 2>&1
eval_tap $? 165 'AdminUpdateTagV3' test.out

#- 166 AdminDeleteTagV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteTagV3 \
    --namespace "$AB_NAMESPACE" \
    --tagId 'Uu0FbVB7' \
    > test.out 2>&1
eval_tap $? 166 'AdminDeleteTagV3' test.out

#- 167 AdminGetUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --emailAddress 'Pl6HmJDx' \
    > test.out 2>&1
eval_tap $? 167 'AdminGetUserByEmailAddressV3' test.out

#- 168 AdminBulkUpdateUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"updateRequest": {"skipLoginQueue": true}, "userIds": ["JOdsuhXV", "yo7XyKe8", "J6FlcAo3"]}' \
    > test.out 2>&1
eval_tap $? 168 'AdminBulkUpdateUsersV3' test.out

#- 169 AdminGetBulkUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType 'j1rcZNj1' \
    --body '{"bulkUserId": ["tliPKFB4", "iI1aE90A", "YQUTsohY"]}' \
    > test.out 2>&1
eval_tap $? 169 'AdminGetBulkUserBanV3' test.out

#- 170 AdminListUserIDByUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"findByPublisherNamespace": true, "userIds": ["MBwT9uSl", "X18Z363X", "LSSMcUw0"]}' \
    > test.out 2>&1
eval_tap $? 170 'AdminListUserIDByUserIDsV3' test.out

#- 171 AdminBulkGetUsersPlatform
./ng net.accelbyte.sdk.cli.Main iam adminBulkGetUsersPlatform \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["ISyMExSR", "mRhgALCq", "Q7Kgw9RZ"]}' \
    > test.out 2>&1
eval_tap $? 171 'AdminBulkGetUsersPlatform' test.out

#- 172 AdminCursorGetUserV3
./ng net.accelbyte.sdk.cli.Main iam adminCursorGetUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"cursor": {"cursorTime": "AU0syCt8", "userId": "yHkBTsQ5"}, "fields": ["LwZ5SJgX", "4mzRqylm", "fw2nirgJ"], "limit": 89}' \
    > test.out 2>&1
eval_tap $? 172 'AdminCursorGetUserV3' test.out

#- 173 AdminInviteUserV3
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddresses": ["aaPhGPHi", "lhB9JnxI", "cR82v14t"], "isAdmin": false, "languageTag": "dWysXbwA", "namespace": "LR2LdosS", "roles": ["rLk4jGVb", "X1kI6AYk", "0BMg5JpR"]}' \
    > test.out 2>&1
eval_tap $? 173 'AdminInviteUserV3' test.out

#- 174 AdminQueryThirdPlatformLinkHistoryV3
./ng net.accelbyte.sdk.cli.Main iam adminQueryThirdPlatformLinkHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '18' \
    --offset '28' \
    --platformUserId 'McFi1n27' \
    --platformId 'QjfSY4Fi' \
    > test.out 2>&1
eval_tap $? 174 'AdminQueryThirdPlatformLinkHistoryV3' test.out

#- 175 AdminListUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminListUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '33' \
    --offset '64' \
    > test.out 2>&1
eval_tap $? 175 'AdminListUsersV3' test.out

#- 176 AdminSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam adminSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'fBKXdsNL' \
    --endDate 'XJXZcRAr' \
    --includeTotal  \
    --limit '2' \
    --offset '55' \
    --platformBy '118busb5' \
    --platformId '13ISR2rR' \
    --query '48M056AO' \
    --roleIds 'ROIzsrGi' \
    --selectedFields 'QNZN2vbT' \
    --skipLoginQueue  \
    --startDate 'NhFceWlR' \
    --tagIds 'se8xJ1ul' \
    --testAccount  \
    > test.out 2>&1
eval_tap $? 176 'AdminSearchUserV3' test.out

#- 177 AdminGetBulkUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"listEmailAddressRequest": ["UWbd2gpz", "mfTT4AbQ", "vQSSeche"]}' \
    > test.out 2>&1
eval_tap $? 177 'AdminGetBulkUserByEmailAddressV3' test.out

#- 178 AdminGetUserByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'bPFQZztH' \
    > test.out 2>&1
eval_tap $? 178 'AdminGetUserByUserIdV3' test.out

#- 179 AdminUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'HeD8nf80' \
    --body '{"avatarUrl": "lyJD3flH", "country": "4neDU1kE", "dateOfBirth": "J6tQRnXE", "displayName": "ixsMt962", "languageTag": "Rt3GFCOD", "skipLoginQueue": true, "tags": ["qDkInKHB", "5D4CLRuC", "vux5gXlw"], "uniqueDisplayName": "voz4s4BW", "userName": "iPbQ13E0"}' \
    > test.out 2>&1
eval_tap $? 179 'AdminUpdateUserV3' test.out

#- 180 AdminGetUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'FZ90v8VT' \
    --activeOnly  \
    --after '7zxO38ep' \
    --before 'ngaEQHTn' \
    --limit '100' \
    > test.out 2>&1
eval_tap $? 180 'AdminGetUserBanV3' test.out

#- 181 AdminBanUserV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'IGE1LEsp' \
    --body '{"ban": "Ha8Ztx3V", "comment": "H9d1zSvt", "endDate": "dTqxMlFn", "reason": "ME8KJjXL", "skipNotif": false}' \
    > test.out 2>&1
eval_tap $? 181 'AdminBanUserV3' test.out

#- 182 AdminGetUserBanSummaryV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanSummaryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'i0cfsBlp' \
    > test.out 2>&1
eval_tap $? 182 'AdminGetUserBanSummaryV3' test.out

#- 183 AdminUpdateUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserBanV3 \
    --banId 'x8bWjlxe' \
    --namespace "$AB_NAMESPACE" \
    --userId '1XKnkKhQ' \
    --body '{"enabled": true, "skipNotif": false}' \
    > test.out 2>&1
eval_tap $? 183 'AdminUpdateUserBanV3' test.out

#- 184 AdminSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'NqtAtYAx' \
    --body '{"context": "qP5H4sxi", "emailAddress": "vzyYwXhv", "languageTag": "AyhwLFOX", "upgradeToken": "s2vdtYDe"}' \
    > test.out 2>&1
eval_tap $? 184 'AdminSendVerificationCodeV3' test.out

#- 185 AdminVerifyAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'TprVbms2' \
    --body '{"Code": "InbYXxDr", "ContactType": "SFdqWfnB", "LanguageTag": "yMTOH8ay", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 185 'AdminVerifyAccountV3' test.out

#- 186 GetUserVerificationCode
./ng net.accelbyte.sdk.cli.Main iam getUserVerificationCode \
    --namespace "$AB_NAMESPACE" \
    --userId '6w15SGXW' \
    > test.out 2>&1
eval_tap $? 186 'GetUserVerificationCode' test.out

#- 187 AdminGetUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'k5C6avYI' \
    > test.out 2>&1
eval_tap $? 187 'AdminGetUserDeletionStatusV3' test.out

#- 188 AdminUpdateUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'fv2R97i1' \
    --body '{"deletionDate": 31, "enabled": true}' \
    > test.out 2>&1
eval_tap $? 188 'AdminUpdateUserDeletionStatusV3' test.out

#- 189 AdminListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'TSai56fW' \
    > test.out 2>&1
eval_tap $? 189 'AdminListUserAllPlatformAccountsDistinctV3' test.out

#- 190 AdminUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'BHZcIQpK' \
    --body '{"code": "ZsLAYoWp", "country": "w9XtxC4T", "dateOfBirth": "CgLkWWW3", "displayName": "CsyKGuV2", "emailAddress": "9BMgsD4K", "password": "WQPXY7Vr", "uniqueDisplayName": "KUexdyts", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 190 'AdminUpgradeHeadlessAccountV3' test.out

#- 191 AdminDeleteUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'i3pH3UQi' \
    > test.out 2>&1
eval_tap $? 191 'AdminDeleteUserInformationV3' test.out

#- 192 AdminGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'MAzbFbyk' \
    --after '0.914330956363047' \
    --before '0.6956516394984886' \
    --limit '77' \
    > test.out 2>&1
eval_tap $? 192 'AdminGetUserLoginHistoriesV3' test.out

#- 193 AdminResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam adminResetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'AQzL0gKj' \
    --body '{"languageTag": "wfunHPLw", "mfaToken": "bUb3rTsq", "newPassword": "MJlKfzHI", "oldPassword": "NKYKbUsm"}' \
    > test.out 2>&1
eval_tap $? 193 'AdminResetPasswordV3' test.out

#- 194 AdminUpdateUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserPermissionV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'jb31X95d' \
    --body '{"Permissions": [{"Action": 53, "Resource": "ySsmiHcG", "SchedAction": 91, "SchedCron": "qzL7iRuC", "SchedRange": ["PPfUileU", "7Na871Aa", "PQehbJ4L"]}, {"Action": 78, "Resource": "kXcKoDfO", "SchedAction": 46, "SchedCron": "fiDjX2mt", "SchedRange": ["S7M7RNl2", "sFOKcWCo", "mXiAoNy9"]}, {"Action": 5, "Resource": "Dy8qXpQa", "SchedAction": 32, "SchedCron": "hTNDDfqV", "SchedRange": ["x1vHGu8v", "DHtkJ7DO", "NTzdAFq0"]}]}' \
    > test.out 2>&1
eval_tap $? 194 'AdminUpdateUserPermissionV3' test.out

#- 195 AdminAddUserPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserPermissionsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'hTbaqfPO' \
    --body '{"Permissions": [{"Action": 64, "Resource": "pZpuC0ac", "SchedAction": 25, "SchedCron": "Tuoj7ji4", "SchedRange": ["L84d0ElO", "SiJwU8fV", "uhvIgC6A"]}, {"Action": 66, "Resource": "pNZNa3zW", "SchedAction": 84, "SchedCron": "Jr9MrEkq", "SchedRange": ["KACw8rvo", "k90JJz52", "uINGmawt"]}, {"Action": 56, "Resource": "itcYqDKv", "SchedAction": 64, "SchedCron": "SDGnGuLZ", "SchedRange": ["q6z7Wn6J", "EawCdHDB", "qFFZGpc5"]}]}' \
    > test.out 2>&1
eval_tap $? 195 'AdminAddUserPermissionsV3' test.out

#- 196 AdminDeleteUserPermissionBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'iVjdHVd0' \
    --body '[{"Action": 81, "Resource": "HjRw947q"}, {"Action": 32, "Resource": "wVkQqaw0"}, {"Action": 71, "Resource": "cKINuADb"}]' \
    > test.out 2>&1
eval_tap $? 196 'AdminDeleteUserPermissionBulkV3' test.out

#- 197 AdminDeleteUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionV3 \
    --action '87' \
    --namespace "$AB_NAMESPACE" \
    --resource 'NbI6vKy2' \
    --userId 'CtehKZif' \
    > test.out 2>&1
eval_tap $? 197 'AdminDeleteUserPermissionV3' test.out

#- 198 AdminGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '5Y8cJCAb' \
    --after 'x0aMGLdS' \
    --before 'OIsE2a46' \
    --limit '73' \
    --platformId 'w2kyquND' \
    --targetNamespace 'E58BDICo' \
    > test.out 2>&1
eval_tap $? 198 'AdminGetUserPlatformAccountsV3' test.out

#- 199 AdminListAllDistinctPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminListAllDistinctPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'PGYCd1y3' \
    --status 'cKCmOwCI' \
    > test.out 2>&1
eval_tap $? 199 'AdminListAllDistinctPlatformAccountsV3' test.out

#- 200 AdminGetListJusticePlatformAccounts
./ng net.accelbyte.sdk.cli.Main iam adminGetListJusticePlatformAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'SrfJARgB' \
    > test.out 2>&1
eval_tap $? 200 'AdminGetListJusticePlatformAccounts' test.out

#- 201 AdminGetUserMapping
./ng net.accelbyte.sdk.cli.Main iam adminGetUserMapping \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'OMlHiR1m' \
    --userId 'YupgiahX' \
    --createIfNotFound  \
    > test.out 2>&1
eval_tap $? 201 'AdminGetUserMapping' test.out

#- 202 AdminCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam adminCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 't4AS5l4j' \
    --userId 'SmTq46an' \
    > test.out 2>&1
eval_tap $? 202 'AdminCreateJusticeUser' test.out

#- 203 AdminLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'bu5wrVQX' \
    --skipConflict  \
    --body '{"platformId": "uz3rsjME", "platformUserId": "Mh9nGNxv"}' \
    > test.out 2>&1
eval_tap $? 203 'AdminLinkPlatformAccount' test.out

#- 204 AdminGetUserLinkHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLinkHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'W92C6moo' \
    --platformId 'WQHitfTI' \
    > test.out 2>&1
eval_tap $? 204 'AdminGetUserLinkHistoriesV3' test.out

#- 205 AdminPlatformUnlinkV3
eval_tap 0 205 'AdminPlatformUnlinkV3 # SKIP deprecated' test.out

#- 206 AdminPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'xmZ1KMnC' \
    --userId 'PfSE8zep' \
    > test.out 2>&1
eval_tap $? 206 'AdminPlatformUnlinkAllV3' test.out

#- 207 AdminPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'abDBH0oi' \
    --userId '623MvCLH' \
    --ticket '55FdsE26' \
    > test.out 2>&1
eval_tap $? 207 'AdminPlatformLinkV3' test.out

#- 208 AdminDeleteUserLinkingHistoryByPlatformIDV3
eval_tap 0 208 'AdminDeleteUserLinkingHistoryByPlatformIDV3 # SKIP deprecated' test.out

#- 209 AdminDeleteUserLinkingRestrictionByPlatformIDV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserLinkingRestrictionByPlatformIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '0FsCuRIg' \
    --userId 'TsTjyVDb' \
    > test.out 2>&1
eval_tap $? 209 'AdminDeleteUserLinkingRestrictionByPlatformIDV3' test.out

#- 210 AdminGetThirdPartyPlatformTokenLinkStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetThirdPartyPlatformTokenLinkStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'UCfhx9QQ' \
    --userId 'mAOviFGa' \
    --platformToken '0SLlRs0E' \
    > test.out 2>&1
eval_tap $? 210 'AdminGetThirdPartyPlatformTokenLinkStatusV3' test.out

#- 211 AdminGetUserSinglePlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminGetUserSinglePlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --platformId '0FZdptJz' \
    --userId 'hY0rwUgM' \
    --crossNamespace  \
    > test.out 2>&1
eval_tap $? 211 'AdminGetUserSinglePlatformAccount' test.out

#- 212 AdminDeleteUserRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRolesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'laokb7kj' \
    --body '["cLK5kIBo", "z006NU63", "IrDR1hIG"]' \
    > test.out 2>&1
eval_tap $? 212 'AdminDeleteUserRolesV3' test.out

#- 213 AdminSaveUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminSaveUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'GTdFRbIV' \
    --body '[{"namespace": "UEXHWkhS", "roleId": "NCCRakwM"}, {"namespace": "utAbhnuZ", "roleId": "N8fY4QxN"}, {"namespace": "nJUpdCtw", "roleId": "zA9eL4fw"}]' \
    > test.out 2>&1
eval_tap $? 213 'AdminSaveUserRoleV3' test.out

#- 214 AdminAddUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'gA7zvJOU' \
    --userId 'k7T4hRik' \
    > test.out 2>&1
eval_tap $? 214 'AdminAddUserRoleV3' test.out

#- 215 AdminDeleteUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId '5Z0nZnf6' \
    --userId 'ryyvYZVk' \
    > test.out 2>&1
eval_tap $? 215 'AdminDeleteUserRoleV3' test.out

#- 216 AdminGetUserStateByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserStateByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Nz5I0b1F' \
    > test.out 2>&1
eval_tap $? 216 'AdminGetUserStateByUserIdV3' test.out

#- 217 AdminUpdateUserStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'd0N2hDjT' \
    --body '{"enabled": false, "reason": "9Ma3MtuP"}' \
    > test.out 2>&1
eval_tap $? 217 'AdminUpdateUserStatusV3' test.out

#- 218 AdminTrustlyUpdateUserIdentity
./ng net.accelbyte.sdk.cli.Main iam adminTrustlyUpdateUserIdentity \
    --namespace "$AB_NAMESPACE" \
    --userId 'tJptlCyh' \
    --body '{"emailAddress": "EgmIQdso", "password": "ZiaCYC3y"}' \
    > test.out 2>&1
eval_tap $? 218 'AdminTrustlyUpdateUserIdentity' test.out

#- 219 AdminVerifyUserWithoutVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyUserWithoutVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'RrVr6oFa' \
    > test.out 2>&1
eval_tap $? 219 'AdminVerifyUserWithoutVerificationCodeV3' test.out

#- 220 AdminUpdateClientSecretV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientSecretV3 \
    --clientId 'PerMf7aP' \
    --namespace "$AB_NAMESPACE" \
    --body '{"newSecret": "YQE4YDIm"}' \
    > test.out 2>&1
eval_tap $? 220 'AdminUpdateClientSecretV3' test.out

#- 221 AdminCheckThirdPartyLoginPlatformAvailabilityV3
./ng net.accelbyte.sdk.cli.Main iam adminCheckThirdPartyLoginPlatformAvailabilityV3 \
    --platformId 'o8trvQ3D' \
    > test.out 2>&1
eval_tap $? 221 'AdminCheckThirdPartyLoginPlatformAvailabilityV3' test.out

#- 222 AdminGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV3 \
    --after 'NQxITTh0' \
    --before 'M5zUfxG9' \
    --isWildcard  \
    --limit '60' \
    > test.out 2>&1
eval_tap $? 222 'AdminGetRolesV3' test.out

#- 223 AdminCreateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV3 \
    --body '{"adminRole": true, "deletable": false, "isWildcard": false, "managers": [{"displayName": "rAmMcawQ", "namespace": "ZJIwife4", "userId": "xb7jddY5"}, {"displayName": "BatHygeY", "namespace": "ntZVCjyw", "userId": "6EDUEVEP"}, {"displayName": "yIJCJOBP", "namespace": "XVWd3bhY", "userId": "Rxbnh5jn"}], "members": [{"displayName": "TIwiY4O7", "namespace": "VFbvk4Dm", "userId": "e0Y2BZcH"}, {"displayName": "eoiAhZaH", "namespace": "zb2z12vi", "userId": "1QICTrvR"}, {"displayName": "wInQv57m", "namespace": "ux8A6kfZ", "userId": "7hJOPhz1"}], "permissions": [{"action": 14, "resource": "otwcofr8", "schedAction": 24, "schedCron": "5fhVQkeE", "schedRange": ["FNVii3LI", "juLKL9MW", "eH2ngahZ"]}, {"action": 49, "resource": "s9YdWFuN", "schedAction": 25, "schedCron": "3V81ZoSQ", "schedRange": ["tTTlbenB", "qEPBfLzg", "Me00rnOE"]}, {"action": 41, "resource": "H45sgAfz", "schedAction": 12, "schedCron": "fkE7xsac", "schedRange": ["UU1Nan1u", "JFGRLoxI", "P5pbRpTu"]}], "roleName": "y3TgN5t6"}' \
    > test.out 2>&1
eval_tap $? 223 'AdminCreateRoleV3' test.out

#- 224 AdminGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV3 \
    --roleId '9qt5xmPT' \
    > test.out 2>&1
eval_tap $? 224 'AdminGetRoleV3' test.out

#- 225 AdminDeleteRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV3 \
    --roleId 'jF3wnVCQ' \
    > test.out 2>&1
eval_tap $? 225 'AdminDeleteRoleV3' test.out

#- 226 AdminUpdateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV3 \
    --roleId 'ZHhkCAUd' \
    --body '{"deletable": true, "isWildcard": true, "roleName": "aeSPwagJ"}' \
    > test.out 2>&1
eval_tap $? 226 'AdminUpdateRoleV3' test.out

#- 227 AdminGetRoleAdminStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleAdminStatusV3 \
    --roleId 'r4UdBieK' \
    > test.out 2>&1
eval_tap $? 227 'AdminGetRoleAdminStatusV3' test.out

#- 228 AdminUpdateAdminRoleStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateAdminRoleStatusV3 \
    --roleId 'icREaOwe' \
    > test.out 2>&1
eval_tap $? 228 'AdminUpdateAdminRoleStatusV3' test.out

#- 229 AdminRemoveRoleAdminV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleAdminV3 \
    --roleId '90rknZYf' \
    > test.out 2>&1
eval_tap $? 229 'AdminRemoveRoleAdminV3' test.out

#- 230 AdminGetRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleManagersV3 \
    --roleId 'K9HDnot7' \
    --after 'yTgXHzfA' \
    --before 'utovtwxK' \
    --limit '20' \
    > test.out 2>&1
eval_tap $? 230 'AdminGetRoleManagersV3' test.out

#- 231 AdminAddRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleManagersV3 \
    --roleId 'M2PMcGnl' \
    --body '{"managers": [{"displayName": "4JnKO4rp", "namespace": "wNe8zJpS", "userId": "spQkG6Jt"}, {"displayName": "xwaLhk4l", "namespace": "08JsH2P8", "userId": "vqL1VjO9"}, {"displayName": "1SruPpWb", "namespace": "0ulE0PYD", "userId": "CaGyDOdD"}]}' \
    > test.out 2>&1
eval_tap $? 231 'AdminAddRoleManagersV3' test.out

#- 232 AdminRemoveRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleManagersV3 \
    --roleId '8KPC5RLt' \
    --body '{"managers": [{"displayName": "pSGqDPMF", "namespace": "pNcZK4FH", "userId": "H1jDX0Vm"}, {"displayName": "4GxhzZMW", "namespace": "PJDVf2yz", "userId": "PeTjxbI1"}, {"displayName": "Dz4VWa6D", "namespace": "OV9kmCoY", "userId": "DmB3HbiY"}]}' \
    > test.out 2>&1
eval_tap $? 232 'AdminRemoveRoleManagersV3' test.out

#- 233 AdminGetRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleMembersV3 \
    --roleId 'X9T0cTU3' \
    --after 'D2TTmpXj' \
    --before 'DqDSfoDe' \
    --limit '77' \
    > test.out 2>&1
eval_tap $? 233 'AdminGetRoleMembersV3' test.out

#- 234 AdminAddRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleMembersV3 \
    --roleId 'iF1fchwx' \
    --body '{"members": [{"displayName": "qtuO5jMt", "namespace": "yKJ6SeQJ", "userId": "fxIeA8ER"}, {"displayName": "c8XK8cJC", "namespace": "rf20xbtq", "userId": "Mm7OpIJp"}, {"displayName": "jVWCtFsl", "namespace": "PsExRh2F", "userId": "rnuc990R"}]}' \
    > test.out 2>&1
eval_tap $? 234 'AdminAddRoleMembersV3' test.out

#- 235 AdminRemoveRoleMembersV3
eval_tap 0 235 'AdminRemoveRoleMembersV3 # SKIP deprecated' test.out

#- 236 AdminUpdateRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV3 \
    --roleId '0znUTO6h' \
    --body '{"permissions": [{"action": 60, "resource": "8O1VTaBM", "schedAction": 26, "schedCron": "1gWvjMnt", "schedRange": ["gtLT84R7", "E4uQn7j6", "Ydaht3zI"]}, {"action": 29, "resource": "BPIPNUcC", "schedAction": 32, "schedCron": "UdAJoIXa", "schedRange": ["TFZdajfr", "uOj294tl", "zrN3jwBd"]}, {"action": 0, "resource": "8lOVKYAY", "schedAction": 72, "schedCron": "HfoCznRZ", "schedRange": ["Qjjy7SMy", "RfP9chno", "rt2KuV8S"]}]}' \
    > test.out 2>&1
eval_tap $? 236 'AdminUpdateRolePermissionsV3' test.out

#- 237 AdminAddRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV3 \
    --roleId 'zGB2Te68' \
    --body '{"permissions": [{"action": 47, "resource": "eUMqZTJ8", "schedAction": 62, "schedCron": "hMkuytzJ", "schedRange": ["gCItF2C0", "Okmvrw9F", "VjXk664I"]}, {"action": 32, "resource": "Zy2YPkE8", "schedAction": 28, "schedCron": "nzibPG3d", "schedRange": ["4aX6diMs", "dLcDVqoA", "TCZmi0kl"]}, {"action": 81, "resource": "KLvZlDMv", "schedAction": 60, "schedCron": "Dvr1X54Q", "schedRange": ["mdezCDw9", "0iTfbYBm", "M4aKRsKC"]}]}' \
    > test.out 2>&1
eval_tap $? 237 'AdminAddRolePermissionsV3' test.out

#- 238 AdminDeleteRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV3 \
    --roleId 'oW2JcVIr' \
    --body '["eZTSwj7I", "VXqCmtfP", "dhsxbIRI"]' \
    > test.out 2>&1
eval_tap $? 238 'AdminDeleteRolePermissionsV3' test.out

#- 239 AdminDeleteRolePermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionV3 \
    --action '63' \
    --resource 'B4OP0iII' \
    --roleId 'ZdiTD4gm' \
    > test.out 2>&1
eval_tap $? 239 'AdminDeleteRolePermissionV3' test.out

#- 240 AdminGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam adminGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 240 'AdminGetMyUserV3' test.out

#- 241 UserAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam userAuthenticationV3 \
    --clientId '5D7whMAo' \
    --extendExp  \
    --redirectUri '0Z51y67U' \
    --password 'mAclNQ9z' \
    --requestId 'ECBzmnlP' \
    --userName 'NLdDe24m' \
    > test.out 2>&1
eval_tap $? 241 'UserAuthenticationV3' test.out

#- 242 AuthenticationWithPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV3 \
    --extendExp  \
    --clientId '8wJ3nmOq' \
    --linkingToken 'Zm829No4' \
    --password 'pWCWo8WH' \
    --username 'bP3wefBt' \
    > test.out 2>&1
eval_tap $? 242 'AuthenticationWithPlatformLinkV3' test.out

#- 243 AuthenticateAndLinkForwardV3
./ng net.accelbyte.sdk.cli.Main iam authenticateAndLinkForwardV3 \
    --extendExp  \
    --clientId 'LkMTqfAy' \
    --linkingToken 'JuF768T4' \
    --password 'pFDNfAOm' \
    --username 'YmwBbdxD' \
    > test.out 2>&1
eval_tap $? 243 'AuthenticateAndLinkForwardV3' test.out

#- 244 PublicGetSystemConfigV3
./ng net.accelbyte.sdk.cli.Main iam publicGetSystemConfigV3 \
    > test.out 2>&1
eval_tap $? 244 'PublicGetSystemConfigV3' test.out

#- 245 GenerateTokenByNewHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV3 \
    --additionalData 'q8XB1h5Z' \
    --extendExp  \
    --linkingToken 'Bq2Lft8G' \
    > test.out 2>&1
eval_tap $? 245 'GenerateTokenByNewHeadlessAccountV3' test.out

#- 246 RequestOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam requestOneTimeLinkingCodeV3 \
    --redirectUri 'w0R0Ws4Z' \
    --state 'l9arJ0q1' \
    --platformId '5moftvbg' \
    > test.out 2>&1
eval_tap $? 246 'RequestOneTimeLinkingCodeV3' test.out

#- 247 ValidateOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam validateOneTimeLinkingCodeV3 \
    --oneTimeLinkCode 'luDW5zxJ' \
    > test.out 2>&1
eval_tap $? 247 'ValidateOneTimeLinkingCodeV3' test.out

#- 248 RequestTokenByOneTimeLinkCodeResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTokenByOneTimeLinkCodeResponseV3 \
    --additionalData 'NCsMzEqU' \
    --isTransient  \
    --clientId 'jk1Y2u9t' \
    --oneTimeLinkCode 'qqQ8nrGK' \
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
    --codeChallenge 'TVVI7Snf' \
    --codeChallengeMethod 'plain' \
    --clientId 'UDc8EetV' \
    > test.out 2>&1
eval_tap $? 251 'RequestTokenExchangeCodeV3' test.out

#- 252 AdminRetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam adminRetrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'LhMElwrI' \
    --userId 'zKCBOFSj' \
    --platformUserId 'nPsytdcp' \
    > test.out 2>&1
eval_tap $? 252 'AdminRetrieveUserThirdPartyPlatformTokenV3' test.out

#- 253 RevokeUserV3
./ng net.accelbyte.sdk.cli.Main iam revokeUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'fbsgXCrV' \
    --includeGameNamespace  \
    > test.out 2>&1
eval_tap $? 253 'RevokeUserV3' test.out

#- 254 AuthorizeV3
./ng net.accelbyte.sdk.cli.Main iam authorizeV3 \
    --blockedPlatformId 'XBsuD8f8' \
    --codeChallenge 'CrLMTLM8' \
    --codeChallengeMethod 'S256' \
    --createHeadless  \
    --loginWebBased  \
    --nonce 'IoEJ26Ni' \
    --oneTimeLinkCode '2oDlTViS' \
    --redirectUri 'j0AfgO4L' \
    --scope '0n9qckh5' \
    --state 'T3OWlYgk' \
    --targetAuthPage 'Q1YipOk7' \
    --useRedirectUriAsLoginUrlWhenLocked  \
    --clientId 'qLtM0OPl' \
    --responseType 'code' \
    > test.out 2>&1
eval_tap $? 254 'AuthorizeV3' test.out

#- 255 TokenIntrospectionV3
./ng net.accelbyte.sdk.cli.Main iam tokenIntrospectionV3 \
    --token '10rmimZD' \
    > test.out 2>&1
eval_tap $? 255 'TokenIntrospectionV3' test.out

#- 256 GetJWKSV3
./ng net.accelbyte.sdk.cli.Main iam getJWKSV3 \
    > test.out 2>&1
eval_tap $? 256 'GetJWKSV3' test.out

#- 257 SendMFAAuthenticationCode
./ng net.accelbyte.sdk.cli.Main iam sendMFAAuthenticationCode \
    --clientId 'b7RNzQHu' \
    --factor 'Mrra0L4D' \
    --mfaToken 'jnpkf6jf' \
    > test.out 2>&1
eval_tap $? 257 'SendMFAAuthenticationCode' test.out

#- 258 Change2faMethod
./ng net.accelbyte.sdk.cli.Main iam change2faMethod \
    --factor 'BZ5Um9ay' \
    --mfaToken 'Ez8ssd2B' \
    > test.out 2>&1
eval_tap $? 258 'Change2faMethod' test.out

#- 259 Verify2faCode
./ng net.accelbyte.sdk.cli.Main iam verify2faCode \
    --code '6LDhOtZV' \
    --factor 'wyJCDaK2' \
    --mfaToken 'ig6QHn9C' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 259 'Verify2faCode' test.out

#- 260 Verify2faCodeForward
./ng net.accelbyte.sdk.cli.Main iam verify2faCodeForward \
    --defaultFactor 'Sg8224fC' \
    --factors 'kmV0GJcG' \
    --rememberDevice  \
    --clientId 'c7XNaZP6' \
    --code 'El3T5ILs' \
    --factor 'aEHvLrzW' \
    --mfaToken 'XLJQmPyY' \
    > test.out 2>&1
eval_tap $? 260 'Verify2faCodeForward' test.out

#- 261 RetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam retrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'qZYXOifD' \
    --userId '3K1wjIZd' \
    > test.out 2>&1
eval_tap $? 261 'RetrieveUserThirdPartyPlatformTokenV3' test.out

#- 262 AuthCodeRequestV3
./ng net.accelbyte.sdk.cli.Main iam authCodeRequestV3 \
    --platformId 'HkN7JnLV' \
    --clientId 'Rx7ygvN0' \
    --redirectUri 'kDJTehpX' \
    --requestId 'CVG04fGV' \
    > test.out 2>&1
eval_tap $? 262 'AuthCodeRequestV3' test.out

#- 263 PlatformTokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV3 \
    --platformId 'jSu8rqwh' \
    --additionalData '5H6M3ZvC' \
    --clientId 'z2ZlrcEI' \
    --createHeadless  \
    --deviceId '1cHTwhmW' \
    --macAddress 'LtEOy3wc' \
    --platformToken 'lz30Mtc8' \
    --serviceLabel '0.2864708550417765' \
    --skipSetCookie  \
    > test.out 2>&1
eval_tap $? 263 'PlatformTokenGrantV3' test.out

#- 264 GetRevocationListV3
./ng net.accelbyte.sdk.cli.Main iam getRevocationListV3 \
    > test.out 2>&1
eval_tap $? 264 'GetRevocationListV3' test.out

#- 265 TokenRevocationV3
./ng net.accelbyte.sdk.cli.Main iam tokenRevocationV3 \
    --token 'bD9sqhc9' \
    > test.out 2>&1
eval_tap $? 265 'TokenRevocationV3' test.out

#- 266 SimultaneousLoginV3
./ng net.accelbyte.sdk.cli.Main iam simultaneousLoginV3 \
    --simultaneousPlatform '30k9oNHF' \
    --simultaneousTicket 'VkeEfSqN' \
    --nativePlatform 'steam' \
    --nativePlatformTicket 'FiXnUYEG' \
    > test.out 2>&1
eval_tap $? 266 'SimultaneousLoginV3' test.out

#- 267 TokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV3 \
    --additionalData 'dp6N9mQa' \
    --clientId 'DKKacthN' \
    --clientSecret 'yTTWrHo6' \
    --code '3DH0oQC8' \
    --codeVerifier 'n3afmrbo' \
    --extendNamespace 'FblBIi2N' \
    --extendExp  \
    --password 'SRJ5393h' \
    --redirectUri 'nyz6f1Mw' \
    --refreshToken 'Hgp0VOc9' \
    --scope 'D84BUYBu' \
    --username 'GauM8xmY' \
    --grantType 'refresh_token' \
    > test.out 2>&1
eval_tap $? 267 'TokenGrantV3' test.out

#- 268 VerifyTokenV3
./ng net.accelbyte.sdk.cli.Main iam verifyTokenV3 \
    --token 'DFtvL3QX' \
    > test.out 2>&1
eval_tap $? 268 'VerifyTokenV3' test.out

#- 269 PlatformAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticationV3 \
    --platformId 'hJm5cRWK' \
    --code 'aPqNCEEB' \
    --error '0XCtMJVK' \
    --openidAssocHandle 'y6nkrA7N' \
    --openidClaimedId 'hg9rIjWV' \
    --openidIdentity 'BNDrHwIu' \
    --openidMode 'Jxr8Vw2p' \
    --openidNs 'Uh1LqnJd' \
    --openidOpEndpoint 'pyw0ZOZg' \
    --openidResponseNonce 'bcTIwkZB' \
    --openidReturnTo 'JIkeKLWS' \
    --openidSig 'teSGLNbh' \
    --openidSigned 'FbJwIa5F' \
    --state 'J8ggaEG4' \
    > test.out 2>&1
eval_tap $? 269 'PlatformAuthenticationV3' test.out

#- 270 PlatformTokenRefreshV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenRefreshV3 \
    --platformId 'cyWP0WSY' \
    --platformToken 'HdOWRAOo' \
    > test.out 2>&1
eval_tap $? 270 'PlatformTokenRefreshV3' test.out

#- 271 PublicGetInputValidations
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidations \
    --defaultOnEmpty  \
    --languageCode '5oIVcFMb' \
    > test.out 2>&1
eval_tap $? 271 'PublicGetInputValidations' test.out

#- 272 PublicGetInputValidationByField
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidationByField \
    --field '8w7zyKrd' \
    > test.out 2>&1
eval_tap $? 272 'PublicGetInputValidationByField' test.out

#- 273 PublicGetCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam publicGetCountryAgeRestrictionV3 \
    --countryCode 'EORYtWa6' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 273 'PublicGetCountryAgeRestrictionV3' test.out

#- 274 PublicGetConfigValueV3
./ng net.accelbyte.sdk.cli.Main iam publicGetConfigValueV3 \
    --configKey 'aWJ8sWRX' \
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
    --clientId 'baN20Zoa' \
    > test.out 2>&1
eval_tap $? 277 'RetrieveActiveOIDCClientsPublicV3' test.out

#- 278 PublicListUserIDByPlatformUserIDsV3
eval_tap 0 278 'PublicListUserIDByPlatformUserIDsV3 # SKIP deprecated' test.out

#- 279 PublicGetUserByPlatformUserIDV3
eval_tap 0 279 'PublicGetUserByPlatformUserIDV3 # SKIP deprecated' test.out

#- 280 PublicGetProfileUpdateStrategyV3
./ng net.accelbyte.sdk.cli.Main iam publicGetProfileUpdateStrategyV3 \
    --namespace "$AB_NAMESPACE" \
    --field 'country' \
    > test.out 2>&1
eval_tap $? 280 'PublicGetProfileUpdateStrategyV3' test.out

#- 281 PublicGetAsyncStatus
./ng net.accelbyte.sdk.cli.Main iam publicGetAsyncStatus \
    --namespace "$AB_NAMESPACE" \
    --requestId 'DtB7OlSx' \
    > test.out 2>&1
eval_tap $? 281 'PublicGetAsyncStatus' test.out

#- 282 PublicSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam publicSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by '0ktxdtZZ' \
    --limit '8' \
    --offset '22' \
    --platformBy 'ZSycQrPG' \
    --platformId 'sVtXWRxk' \
    --query 'UdlDK7hS' \
    > test.out 2>&1
eval_tap $? 282 'PublicSearchUserV3' test.out

#- 283 PublicCreateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "KVqMeKw6", "acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "BH3u0Grt", "policyId": "jMXhWlpw", "policyVersionId": "sOGEcP9Q"}, {"isAccepted": true, "localizedPolicyVersionId": "1lF7sclK", "policyId": "7j1Pdm54", "policyVersionId": "LsJ501jf"}, {"isAccepted": true, "localizedPolicyVersionId": "HzWIXFze", "policyId": "rEKFGIFr", "policyVersionId": "Jz9Ldh2X"}], "authType": "SbozIGxW", "code": "3gllZOpp", "country": "gi51sMea", "dateOfBirth": "KmH6Lc5x", "displayName": "OIC1Re9e", "emailAddress": "YPE5zTSt", "password": "IwmALn37", "reachMinimumAge": true, "uniqueDisplayName": "GWtgNXgD"}' \
    > test.out 2>&1
eval_tap $? 283 'PublicCreateUserV3' test.out

#- 284 CheckUserAvailability
./ng net.accelbyte.sdk.cli.Main iam checkUserAvailability \
    --namespace "$AB_NAMESPACE" \
    --field 'YxZQc19u' \
    --query 'CoeuOWU5' \
    > test.out 2>&1
eval_tap $? 284 'CheckUserAvailability' test.out

#- 285 PublicBulkGetUsers
eval_tap 0 285 'PublicBulkGetUsers # SKIP deprecated' test.out

#- 286 PublicSendRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicSendRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "ujTwCMsX", "languageTag": "YUEdf1pe"}' \
    > test.out 2>&1
eval_tap $? 286 'PublicSendRegistrationCode' test.out

#- 287 PublicVerifyRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicVerifyRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "pRLwSw1z", "emailAddress": "PjukBjMN"}' \
    > test.out 2>&1
eval_tap $? 287 'PublicVerifyRegistrationCode' test.out

#- 288 PublicForgotPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicForgotPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "2k3ZB6OX", "languageTag": "NhPpzZ66"}' \
    > test.out 2>&1
eval_tap $? 288 'PublicForgotPasswordV3' test.out

#- 289 PublicValidateUserInput
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserInput \
    --namespace "$AB_NAMESPACE" \
    --body '{"displayName": "rm4YXloT", "password": "QicPUVwS", "uniqueDisplayName": "Ckx9X0iF", "username": "uhzM3kE5"}' \
    > test.out 2>&1
eval_tap $? 289 'PublicValidateUserInput' test.out

#- 290 GetAdminInvitationV3
./ng net.accelbyte.sdk.cli.Main iam getAdminInvitationV3 \
    --invitationId '3bN12yHq' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 290 'GetAdminInvitationV3' test.out

#- 291 CreateUserFromInvitationV3
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV3 \
    --invitationId 'whJBFxov' \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "v2t0AqW2", "acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "f8wC7tq8", "policyId": "09rCBO90", "policyVersionId": "z96rU4Az"}, {"isAccepted": false, "localizedPolicyVersionId": "PjvQYvbe", "policyId": "PEotvqSy", "policyVersionId": "RnN54PFT"}, {"isAccepted": false, "localizedPolicyVersionId": "eos9pEYV", "policyId": "xWH2Oore", "policyVersionId": "lfbzJOoO"}], "authType": "Qv9Ytirz", "code": "0ZwWIC51", "country": "qf6B4hoI", "dateOfBirth": "6kXXyQsB", "displayName": "n3uj0LbS", "emailAddress": "vduy519B", "password": "p0mYqpYl", "reachMinimumAge": true, "uniqueDisplayName": "VTsWQe7q"}' \
    > test.out 2>&1
eval_tap $? 291 'CreateUserFromInvitationV3' test.out

#- 292 UpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam updateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "9x7CYFpV", "country": "aZoM0iuZ", "dateOfBirth": "d0ZEKCeC", "displayName": "wf1DCer8", "languageTag": "Ikszvut9", "uniqueDisplayName": "ufojZuVy", "userName": "nblGo1T0"}' \
    > test.out 2>&1
eval_tap $? 292 'UpdateUserV3' test.out

#- 293 PublicPartialUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicPartialUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "HhY4yBKp", "country": "r27VEOlO", "dateOfBirth": "9UNP3R0V", "displayName": "pi4ntnKM", "languageTag": "k6MwAvPn", "uniqueDisplayName": "gyT2XVI6", "userName": "XKwe9Ub1"}' \
    > test.out 2>&1
eval_tap $? 293 'PublicPartialUpdateUserV3' test.out

#- 294 PublicSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"context": "TQvkntbx", "emailAddress": "1NgK0mhd", "languageTag": "nAjkovq5", "upgradeToken": "SHKgWuKq"}' \
    > test.out 2>&1
eval_tap $? 294 'PublicSendVerificationCodeV3' test.out

#- 295 PublicUserVerificationV3
./ng net.accelbyte.sdk.cli.Main iam publicUserVerificationV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "ZPRuRdZM", "contactType": "K3qQcMXM", "languageTag": "YuRszBH8", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 295 'PublicUserVerificationV3' test.out

#- 296 PublicUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "hPY6h89c", "country": "NGP3liKr", "dateOfBirth": "Czkvdrog", "displayName": "3F3cDPNA", "emailAddress": "x1JIqeWS", "password": "lnXJK9mv", "uniqueDisplayName": "UGZ8AL2H", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 296 'PublicUpgradeHeadlessAccountV3' test.out

#- 297 PublicVerifyHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --needVerificationCode  \
    --body '{"emailAddress": "tTZ5CNa8", "password": "elFPAgXg"}' \
    > test.out 2>&1
eval_tap $? 297 'PublicVerifyHeadlessAccountV3' test.out

#- 298 PublicUpdatePasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicUpdatePasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"languageTag": "XnsU4p8H", "mfaToken": "qgxa5UD1", "newPassword": "OMBn2Bfy", "oldPassword": "gQxgBkMT"}' \
    > test.out 2>&1
eval_tap $? 298 'PublicUpdatePasswordV3' test.out

#- 299 PublicCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam publicCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'bRO89u3A' \
    > test.out 2>&1
eval_tap $? 299 'PublicCreateJusticeUser' test.out

#- 300 PublicPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'TVE8kGkV' \
    --redirectUri 'z4uGzaqD' \
    --ticket 'Y5gCk0Hh' \
    > test.out 2>&1
eval_tap $? 300 'PublicPlatformLinkV3' test.out

#- 301 PublicPlatformUnlinkV3
eval_tap 0 301 'PublicPlatformUnlinkV3 # SKIP deprecated' test.out

#- 302 PublicPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '7GsoHyHa' \
    > test.out 2>&1
eval_tap $? 302 'PublicPlatformUnlinkAllV3' test.out

#- 303 PublicForcePlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicForcePlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'vTwNeDqZ' \
    --ticket 'XheCT3zU' \
    > test.out 2>&1
eval_tap $? 303 'PublicForcePlatformLinkV3' test.out

#- 304 PublicWebLinkPlatform
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatform \
    --namespace "$AB_NAMESPACE" \
    --platformId 'YmckeO5r' \
    --clientId 'T5kHqTxT' \
    --redirectUri '0EMa9UJE' \
    > test.out 2>&1
eval_tap $? 304 'PublicWebLinkPlatform' test.out

#- 305 PublicWebLinkPlatformEstablish
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatformEstablish \
    --namespace "$AB_NAMESPACE" \
    --platformId 'rm4y33eS' \
    --code '57Uahx14' \
    --state 'mJC5v8o9' \
    > test.out 2>&1
eval_tap $? 305 'PublicWebLinkPlatformEstablish' test.out

#- 306 PublicProcessWebLinkPlatformV3
./ng net.accelbyte.sdk.cli.Main iam publicProcessWebLinkPlatformV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'i2hWStsa' \
    --code 'M8ohXdCD' \
    --state 'm8U2KHkD' \
    > test.out 2>&1
eval_tap $? 306 'PublicProcessWebLinkPlatformV3' test.out

#- 307 PublicGetUsersPlatformInfosV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUsersPlatformInfosV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"platformId": "CaqSWCwm", "userIds": ["fge4oP1u", "NNgp0PgJ", "6ByWQFQG"]}' \
    > test.out 2>&1
eval_tap $? 307 'PublicGetUsersPlatformInfosV3' test.out

#- 308 ResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam resetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientId": "SJqWyiL3", "code": "RYsQsvpw", "emailAddress": "QIjHQvu7", "languageTag": "FjpN9piU", "newPassword": "C0ZYyvjL"}' \
    > test.out 2>&1
eval_tap $? 308 'ResetPasswordV3' test.out

#- 309 PublicGetUserByUserIdV3
eval_tap 0 309 'PublicGetUserByUserIdV3 # SKIP deprecated' test.out

#- 310 PublicGetUserBanHistoryV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserBanHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'LnAwOOjl' \
    --activeOnly  \
    --limit '0' \
    --offset '71' \
    > test.out 2>&1
eval_tap $? 310 'PublicGetUserBanHistoryV3' test.out

#- 311 PublicListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'xD1CobxS' \
    > test.out 2>&1
eval_tap $? 311 'PublicListUserAllPlatformAccountsDistinctV3' test.out

#- 312 PublicGetUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '2yQH4aqF' \
    > test.out 2>&1
eval_tap $? 312 'PublicGetUserInformationV3' test.out

#- 313 PublicGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'NGnmCsqO' \
    --after '0.12822744788034746' \
    --before '0.5813569114540276' \
    --limit '77' \
    > test.out 2>&1
eval_tap $? 313 'PublicGetUserLoginHistoriesV3' test.out

#- 314 PublicGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '9Sn6q1vi' \
    --after 'vVocTKrB' \
    --before '8dR7DBv2' \
    --limit '65' \
    --platformId 'aKJmYa9f' \
    > test.out 2>&1
eval_tap $? 314 'PublicGetUserPlatformAccountsV3' test.out

#- 315 PublicListJusticePlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicListJusticePlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'waJmfzLi' \
    > test.out 2>&1
eval_tap $? 315 'PublicListJusticePlatformAccountsV3' test.out

#- 316 PublicLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam publicLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'gV4ziA5W' \
    --body '{"platformId": "38PmaE5o", "platformUserId": "xbZFChyB"}' \
    > test.out 2>&1
eval_tap $? 316 'PublicLinkPlatformAccount' test.out

#- 317 PublicForceLinkPlatformWithProgression
./ng net.accelbyte.sdk.cli.Main iam publicForceLinkPlatformWithProgression \
    --namespace "$AB_NAMESPACE" \
    --userId 'nOCJxQpV' \
    --body '{"chosenNamespaces": ["PN0y7Na5", "EvpCMzQV", "YxE6UxTB"], "requestId": "KANPHDiw"}' \
    > test.out 2>&1
eval_tap $? 317 'PublicForceLinkPlatformWithProgression' test.out

#- 318 PublicGetPublisherUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetPublisherUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'bsN1Us7m' \
    > test.out 2>&1
eval_tap $? 318 'PublicGetPublisherUserV3' test.out

#- 319 PublicValidateUserByUserIDAndPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserByUserIDAndPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'qN1mRcqU' \
    --password 'ZxMAYbYF' \
    > test.out 2>&1
eval_tap $? 319 'PublicValidateUserByUserIDAndPasswordV3' test.out

#- 320 PublicGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRolesV3 \
    --after 'GFYf9EIo' \
    --before 'SmcBHiP3' \
    --isWildcard  \
    --limit '85' \
    > test.out 2>&1
eval_tap $? 320 'PublicGetRolesV3' test.out

#- 321 PublicGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRoleV3 \
    --roleId 'ju4UCOIk' \
    > test.out 2>&1
eval_tap $? 321 'PublicGetRoleV3' test.out

#- 322 PublicForgotPasswordWithoutNamespaceV3
./ng net.accelbyte.sdk.cli.Main iam publicForgotPasswordWithoutNamespaceV3 \
    --body '{"clientId": "C0W4SRmx", "emailAddress": "LPKBvrx5", "languageTag": "dPzfcuhz"}' \
    > test.out 2>&1
eval_tap $? 322 'PublicForgotPasswordWithoutNamespaceV3' test.out

#- 323 PublicGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyUserV3 \
    --includeAllPlatforms  \
    > test.out 2>&1
eval_tap $? 323 'PublicGetMyUserV3' test.out

#- 324 PublicSendCodeForwardV3
./ng net.accelbyte.sdk.cli.Main iam publicSendCodeForwardV3 \
    --body '{"context": "sFBTMJ9J", "emailAddress": "KIgQ4BhY", "languageTag": "ajcUbJjl", "upgradeToken": "KEGpepkx"}' \
    > test.out 2>&1
eval_tap $? 324 'PublicSendCodeForwardV3' test.out

#- 325 PublicGetLinkHeadlessAccountToMyAccountConflictV3
./ng net.accelbyte.sdk.cli.Main iam publicGetLinkHeadlessAccountToMyAccountConflictV3 \
    --oneTimeLinkCode 'oQdBDtH3' \
    > test.out 2>&1
eval_tap $? 325 'PublicGetLinkHeadlessAccountToMyAccountConflictV3' test.out

#- 326 LinkHeadlessAccountToMyAccountV3
./ng net.accelbyte.sdk.cli.Main iam linkHeadlessAccountToMyAccountV3 \
    --body '{"chosenNamespaces": ["bTiDfQT0", "xCpcKxV6", "zjH00Xw8"], "oneTimeLinkCode": "SWp6bk7A"}' \
    > test.out 2>&1
eval_tap $? 326 'LinkHeadlessAccountToMyAccountV3' test.out

#- 327 PublicGetMyRedirectionAfterLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyRedirectionAfterLinkV3 \
    --oneTimeLinkCode '6qwxkkMh' \
    > test.out 2>&1
eval_tap $? 327 'PublicGetMyRedirectionAfterLinkV3' test.out

#- 328 PublicGetMyProfileAllowUpdateStatusV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyProfileAllowUpdateStatusV3 \
    > test.out 2>&1
eval_tap $? 328 'PublicGetMyProfileAllowUpdateStatusV3' test.out

#- 329 PublicSendVerificationLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationLinkV3 \
    --body '{"languageTag": "A0liwIs7"}' \
    > test.out 2>&1
eval_tap $? 329 'PublicSendVerificationLinkV3' test.out

#- 330 PublicGetOpenidUserInfoV3
./ng net.accelbyte.sdk.cli.Main iam publicGetOpenidUserInfoV3 \
    > test.out 2>&1
eval_tap $? 330 'PublicGetOpenidUserInfoV3' test.out

#- 331 PublicVerifyUserByLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyUserByLinkV3 \
    --code '0AoerjA1' \
    > test.out 2>&1
eval_tap $? 331 'PublicVerifyUserByLinkV3' test.out

#- 332 PlatformAuthenticateSAMLV3Handler
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticateSAMLV3Handler \
    --platformId 'NZJ6d21X' \
    --code '35MxDP5U' \
    --error 'TvX4sRGQ' \
    --state 'Qv69F7oL' \
    > test.out 2>&1
eval_tap $? 332 'PlatformAuthenticateSAMLV3Handler' test.out

#- 333 LoginSSOClient
./ng net.accelbyte.sdk.cli.Main iam loginSSOClient \
    --platformId '5pG409Ms' \
    --payload 'OhY2b2wA' \
    > test.out 2>&1
eval_tap $? 333 'LoginSSOClient' test.out

#- 334 LogoutSSOClient
./ng net.accelbyte.sdk.cli.Main iam logoutSSOClient \
    --platformId 'KmwxeXI5' \
    > test.out 2>&1
eval_tap $? 334 'LogoutSSOClient' test.out

#- 335 RequestTargetTokenResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTargetTokenResponseV3 \
    --additionalData 'wLQxrW5r' \
    --code 'xBaRabFF' \
    > test.out 2>&1
eval_tap $? 335 'RequestTargetTokenResponseV3' test.out

#- 336 UpgradeAndAuthenticateForwardV3
./ng net.accelbyte.sdk.cli.Main iam upgradeAndAuthenticateForwardV3 \
    --clientId '3DRmL727' \
    --upgradeSuccessToken 'ihtA4kLP' \
    > test.out 2>&1
eval_tap $? 336 'UpgradeAndAuthenticateForwardV3' test.out

#- 337 AdminListInvitationHistoriesV4
./ng net.accelbyte.sdk.cli.Main iam adminListInvitationHistoriesV4 \
    --limit '0' \
    --namespace "$AB_NAMESPACE" \
    --offset '56' \
    > test.out 2>&1
eval_tap $? 337 'AdminListInvitationHistoriesV4' test.out

#- 338 AdminGetDevicesByUserV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDevicesByUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'dSoUJeqa' \
    > test.out 2>&1
eval_tap $? 338 'AdminGetDevicesByUserV4' test.out

#- 339 AdminGetBannedDevicesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedDevicesV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceType 'SwZWkGKX' \
    --endDate '5yFZlepS' \
    --limit '17' \
    --offset '16' \
    --startDate 'Czm5kKSG' \
    > test.out 2>&1
eval_tap $? 339 'AdminGetBannedDevicesV4' test.out

#- 340 AdminGetUserDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeviceBansV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'hhMYtWoO' \
    > test.out 2>&1
eval_tap $? 340 'AdminGetUserDeviceBansV4' test.out

#- 341 AdminBanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminBanDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"comment": "gJQedWvp", "deviceId": "ZBGG5V7g", "deviceType": "DUh3ALDw", "enabled": false, "endDate": "AJd5KiWd", "ext": {"Q1sJCufg": {}, "9jUNzlOp": {}, "B3oxtJc1": {}}, "reason": "r5nLb51Y"}' \
    > test.out 2>&1
eval_tap $? 341 'AdminBanDeviceV4' test.out

#- 342 AdminGetDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBanV4 \
    --banId 'kPbK8vpc' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 342 'AdminGetDeviceBanV4' test.out

#- 343 AdminUpdateDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateDeviceBanV4 \
    --banId 'kn6OtVrR' \
    --namespace "$AB_NAMESPACE" \
    --body '{"enabled": true}' \
    > test.out 2>&1
eval_tap $? 343 'AdminUpdateDeviceBanV4' test.out

#- 344 AdminGenerateReportV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateReportV4 \
    --namespace "$AB_NAMESPACE" \
    --endDate 'kAQCmm59' \
    --startDate 'Y82wW1mu' \
    --deviceType 'uG83oP5B' \
    > test.out 2>&1
eval_tap $? 344 'AdminGenerateReportV4' test.out

#- 345 AdminGetDeviceTypesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceTypesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 345 'AdminGetDeviceTypesV4' test.out

#- 346 AdminGetDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBansV4 \
    --deviceId 'SoeO9e6U' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 346 'AdminGetDeviceBansV4' test.out

#- 347 AdminDecryptDeviceV4
eval_tap 0 347 'AdminDecryptDeviceV4 # SKIP deprecated' test.out

#- 348 AdminUnbanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminUnbanDeviceV4 \
    --deviceId 'OI1KSx0a' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 348 'AdminUnbanDeviceV4' test.out

#- 349 AdminGetUsersByDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUsersByDeviceV4 \
    --deviceId 'LKFR56TR' \
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
    --limit '68' \
    --offset '80' \
    > test.out 2>&1
eval_tap $? 351 'AdminGetNamespaceUserInvitationHistoryV4' test.out

#- 352 AdminCreateTestUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateTestUsersV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "CawgRcje", "policyId": "ZrlZ5j8W", "policyVersionId": "ikEKsjqn"}, {"isAccepted": true, "localizedPolicyVersionId": "mm2QwGYT", "policyId": "FlbzpjGC", "policyVersionId": "wdJoOmlm"}, {"isAccepted": true, "localizedPolicyVersionId": "ffpdDOja", "policyId": "tztwPO6B", "policyVersionId": "VDRikRDr"}], "count": 14, "userInfo": {"country": "Wk23oCge"}}' \
    > test.out 2>&1
eval_tap $? 352 'AdminCreateTestUsersV4' test.out

#- 353 AdminCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "XDsYzpAG", "policyId": "JbppPxXw", "policyVersionId": "TQrmyy4I"}, {"isAccepted": false, "localizedPolicyVersionId": "1TgtQFTq", "policyId": "Vc24l8cn", "policyVersionId": "lgGiCh7e"}, {"isAccepted": true, "localizedPolicyVersionId": "RIKUytcY", "policyId": "GGgotNxt", "policyVersionId": "AnbInNd8"}], "authType": "EMAILPASSWD", "code": "t14asBt8", "country": "mxTVxnue", "dateOfBirth": "TlN6HKEl", "displayName": "3azO7caq", "emailAddress": "HnO8aXLU", "password": "0RIY0FYK", "passwordMD5Sum": "tFyNCmSs", "reachMinimumAge": true, "uniqueDisplayName": "ueiTe1Ba", "username": "rWkRGtks"}' \
    > test.out 2>&1
eval_tap $? 353 'AdminCreateUserV4' test.out

#- 354 AdminBulkUpdateUserAccountTypeV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateUserAccountTypeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"testAccount": true, "userIds": ["E7TZ07Qs", "zilhY0QE", "CyjrZTA5"]}' \
    > test.out 2>&1
eval_tap $? 354 'AdminBulkUpdateUserAccountTypeV4' test.out

#- 355 AdminBulkCheckValidUserIDV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkCheckValidUserIDV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["oeHet2Je", "oMIW1B44", "oVT70kMj"]}' \
    > test.out 2>&1
eval_tap $? 355 'AdminBulkCheckValidUserIDV4' test.out

#- 356 AdminUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'vHKEyprH' \
    --body '{"avatarUrl": "ecp1sBzs", "country": "ToLbewRQ", "dateOfBirth": "LkLrOKKi", "displayName": "ANcUCkkM", "languageTag": "kH6SAagz", "skipLoginQueue": false, "tags": ["6goYMQNr", "V1Gjdz6c", "umbldVZl"], "uniqueDisplayName": "GB3IMLnX", "userName": "llFoEwHx"}' \
    > test.out 2>&1
eval_tap $? 356 'AdminUpdateUserV4' test.out

#- 357 AdminUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'M44QY8jl' \
    --body '{"code": "a9J3ko82", "emailAddress": "tSeU4a4X"}' \
    > test.out 2>&1
eval_tap $? 357 'AdminUpdateUserEmailAddressV4' test.out

#- 358 AdminDisableUserMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableUserMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '2V4O7S3F' \
    --body '{"factor": "cQxqeNSv", "mfaToken": "Jhh4zHmV"}' \
    > test.out 2>&1
eval_tap $? 358 'AdminDisableUserMFAV4' test.out

#- 359 AdminGetUserMFAStatusV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUserMFAStatusV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'LOQ8oUj9' \
    > test.out 2>&1
eval_tap $? 359 'AdminGetUserMFAStatusV4' test.out

#- 360 AdminListUserRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminListUserRolesV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'f2rEyVOL' \
    > test.out 2>&1
eval_tap $? 360 'AdminListUserRolesV4' test.out

#- 361 AdminUpdateUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'wkYVZbBr' \
    --body '{"assignedNamespaces": ["cJJnHPrS", "UimONy4n", "wkeybAW6"], "roleId": "Fu5IGB9L"}' \
    > test.out 2>&1
eval_tap $? 361 'AdminUpdateUserRoleV4' test.out

#- 362 AdminAddUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '7pJULCtj' \
    --body '{"assignedNamespaces": ["0h2tibfG", "cXirl6JP", "F2ghPqeb"], "roleId": "ZIfO3xCC"}' \
    > test.out 2>&1
eval_tap $? 362 'AdminAddUserRoleV4' test.out

#- 363 AdminRemoveUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRemoveUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'RVP7KA5B' \
    --body '{"assignedNamespaces": ["mH8QtePc", "YuZTVpe9", "802pFwVQ"], "roleId": "I6cRHL2o"}' \
    > test.out 2>&1
eval_tap $? 363 'AdminRemoveUserRoleV4' test.out

#- 364 AdminGetRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV4 \
    --adminRole  \
    --isWildcard  \
    --limit '2' \
    --offset '43' \
    > test.out 2>&1
eval_tap $? 364 'AdminGetRolesV4' test.out

#- 365 AdminCreateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV4 \
    --body '{"adminRole": true, "deletable": false, "isWildcard": true, "roleName": "zEzI6cnG"}' \
    > test.out 2>&1
eval_tap $? 365 'AdminCreateRoleV4' test.out

#- 366 AdminGetRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV4 \
    --roleId 'ocEPBYED' \
    > test.out 2>&1
eval_tap $? 366 'AdminGetRoleV4' test.out

#- 367 AdminDeleteRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV4 \
    --roleId 'zQ5Jbt1I' \
    > test.out 2>&1
eval_tap $? 367 'AdminDeleteRoleV4' test.out

#- 368 AdminUpdateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV4 \
    --roleId '0TcdYIaL' \
    --body '{"adminRole": false, "deletable": false, "isWildcard": false, "roleName": "MxzmDohG"}' \
    > test.out 2>&1
eval_tap $? 368 'AdminUpdateRoleV4' test.out

#- 369 AdminUpdateRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV4 \
    --roleId 'hkiJpWaI' \
    --body '{"permissions": [{"action": 52, "resource": "OzeFe0au", "schedAction": 64, "schedCron": "48eIxw4C", "schedRange": ["l2UoBmu0", "BWSCFSFr", "DaVtsVHM"]}, {"action": 82, "resource": "BbDKhYEA", "schedAction": 21, "schedCron": "UxlFtR0e", "schedRange": ["7c5Csd4C", "WO6HcXG7", "rQmxn4O0"]}, {"action": 71, "resource": "7DYn3RTa", "schedAction": 69, "schedCron": "LlWu2fMz", "schedRange": ["JDx8vrzT", "RySmG8Av", "SE9fa7QX"]}]}' \
    > test.out 2>&1
eval_tap $? 369 'AdminUpdateRolePermissionsV4' test.out

#- 370 AdminAddRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV4 \
    --roleId '2rKMBnaG' \
    --body '{"permissions": [{"action": 80, "resource": "x7M99zHs", "schedAction": 31, "schedCron": "CrBXdKLr", "schedRange": ["qk87kLt5", "N2RnjPFe", "LkjqrUbG"]}, {"action": 32, "resource": "W13dvPwZ", "schedAction": 10, "schedCron": "4EgvchU9", "schedRange": ["sSbbR0kl", "5ilq0lss", "9h26URaC"]}, {"action": 5, "resource": "GKkOzUI6", "schedAction": 68, "schedCron": "xBGPLvae", "schedRange": ["vgR2jc8P", "iRGfyOGh", "12fGjyMH"]}]}' \
    > test.out 2>&1
eval_tap $? 370 'AdminAddRolePermissionsV4' test.out

#- 371 AdminDeleteRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV4 \
    --roleId 'wUKovJXq' \
    --body '["DWNEOT2D", "FOnehNb9", "ZnahuALN"]' \
    > test.out 2>&1
eval_tap $? 371 'AdminDeleteRolePermissionsV4' test.out

#- 372 AdminListAssignedUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminListAssignedUsersV4 \
    --roleId '3ZKdclwr' \
    --after 'lJuM6JWL' \
    --before 'JSJBGTBf' \
    --limit '59' \
    > test.out 2>&1
eval_tap $? 372 'AdminListAssignedUsersV4' test.out

#- 373 AdminAssignUserToRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAssignUserToRoleV4 \
    --roleId 'yAQgzLmC' \
    --body '{"assignedNamespaces": ["0WLlkVED", "5QS2EKOL", "KkogdLGG"], "namespace": "Wlz4QJPn", "userId": "xtk6aJ1v"}' \
    > test.out 2>&1
eval_tap $? 373 'AdminAssignUserToRoleV4' test.out

#- 374 AdminRevokeUserFromRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRevokeUserFromRoleV4 \
    --roleId '1Yh64egJ' \
    --body '{"namespace": "GWGKesXw", "userId": "6zdlaDbC"}' \
    > test.out 2>&1
eval_tap $? 374 'AdminRevokeUserFromRoleV4' test.out

#- 375 AdminInviteUserNewV4
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserNewV4 \
    --body '{"assignedNamespaces": ["CwcCZsx8", "QVN6NHpF", "LaO3ZmjU"], "emailAddresses": ["KCLSrsmC", "iaYsv65S", "GfRCYaEF"], "isAdmin": true, "isNewStudio": true, "languageTag": "gjeVEWJH", "namespace": "PlKEuk3A", "roleId": "FImsxvLD"}' \
    > test.out 2>&1
eval_tap $? 375 'AdminInviteUserNewV4' test.out

#- 376 AdminUpdateMyUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateMyUserV4 \
    --body '{"avatarUrl": "imh4tI1W", "country": "tDRPpjeo", "dateOfBirth": "DAg0zZBt", "displayName": "Cspne6bn", "languageTag": "b0Xvc49V", "skipLoginQueue": false, "tags": ["HuRCpm1i", "alaTVvpX", "9ENiOf4j"], "uniqueDisplayName": "gZ8yAOY7", "userName": "QLebwPUh"}' \
    > test.out 2>&1
eval_tap $? 376 'AdminUpdateMyUserV4' test.out

#- 377 AdminDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyAuthenticatorV4 \
    --body '{"factor": "KiLPgGCL", "mfaToken": "HeOdwHbU"}' \
    > test.out 2>&1
eval_tap $? 377 'AdminDisableMyAuthenticatorV4' test.out

#- 378 AdminEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyAuthenticatorV4 \
    --code 'gbJjxjfd' \
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
    --body '{"factor": "bX20pciw", "mfaToken": "oEFAzrV6"}' \
    > test.out 2>&1
eval_tap $? 382 'AdminDisableMyBackupCodesV4' test.out

#- 383 AdminDownloadMyBackupCodesV4
eval_tap 0 383 'AdminDownloadMyBackupCodesV4 # SKIP deprecated' test.out

#- 384 AdminEnableMyBackupCodesV4
eval_tap 0 384 'AdminEnableMyBackupCodesV4 # SKIP deprecated' test.out

#- 385 AdminGetBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBackupCodesV4 \
    --languageTag '51QoK3Co' \
    > test.out 2>&1
eval_tap $? 385 'AdminGetBackupCodesV4' test.out

#- 386 AdminGenerateBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateBackupCodesV4 \
    --languageTag '2OZOH3E2' \
    > test.out 2>&1
eval_tap $? 386 'AdminGenerateBackupCodesV4' test.out

#- 387 AdminEnableBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableBackupCodesV4 \
    --languageTag 'ANUPxNQ0' \
    > test.out 2>&1
eval_tap $? 387 'AdminEnableBackupCodesV4' test.out

#- 388 AdminChallengeMyMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminChallengeMyMFAV4 \
    --code 'EfXsfqaw' \
    --factor 'pMGVoHnt' \
    > test.out 2>&1
eval_tap $? 388 'AdminChallengeMyMFAV4' test.out

#- 389 AdminSendMyMFAEmailCodeV4
./ng net.accelbyte.sdk.cli.Main iam adminSendMyMFAEmailCodeV4 \
    --action 'BxoyRXtJ' \
    --languageTag 'Xq5Q3lE8' \
    > test.out 2>&1
eval_tap $? 389 'AdminSendMyMFAEmailCodeV4' test.out

#- 390 AdminDisableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyEmailV4 \
    --body '{"factor": "Iy36Hwp9", "mfaToken": "zUZuBQVB"}' \
    > test.out 2>&1
eval_tap $? 390 'AdminDisableMyEmailV4' test.out

#- 391 AdminEnableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyEmailV4 \
    --code 'lccbkNkQ' \
    > test.out 2>&1
eval_tap $? 391 'AdminEnableMyEmailV4' test.out

#- 392 AdminGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyEnabledFactorsV4 \
    > test.out 2>&1
eval_tap $? 392 'AdminGetMyEnabledFactorsV4' test.out

#- 393 AdminMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam adminMakeFactorMyDefaultV4 \
    --factor 'sUHlywQq' \
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
    --clientId 'iO8pSf9o' \
    --linkingToken 'JNeMadXe' \
    --password 'ZNpZfXbx' \
    --username 'YcZlbVOH' \
    > test.out 2>&1
eval_tap $? 397 'AuthenticationWithPlatformLinkV4' test.out

#- 398 GenerateTokenByNewHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV4 \
    --additionalData '9tVqW6eb' \
    --extendExp  \
    --linkingToken 'UAuTd9xG' \
    > test.out 2>&1
eval_tap $? 398 'GenerateTokenByNewHeadlessAccountV4' test.out

#- 399 Verify2faCodeV4
./ng net.accelbyte.sdk.cli.Main iam verify2faCodeV4 \
    --code 'ti1bHiaa' \
    --factor 'oi6SGIaA' \
    --mfaToken 'O3PwuKNO' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 399 'Verify2faCodeV4' test.out

#- 400 PlatformTokenGrantV4
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV4 \
    --platformId 'PkksuN8H' \
    --codeChallenge 'hy4UlA8J' \
    --codeChallengeMethod 'plain' \
    --additionalData 'owEYAEz8' \
    --clientId 'sxl8Uwvq' \
    --createHeadless  \
    --deviceId 'IUyWIiYW' \
    --macAddress '7BYE8d7K' \
    --platformToken 'QrWL5Jui' \
    --serviceLabel '0.06506730369057312' \
    --skipSetCookie  \
    > test.out 2>&1
eval_tap $? 400 'PlatformTokenGrantV4' test.out

#- 401 SimultaneousLoginV4
./ng net.accelbyte.sdk.cli.Main iam simultaneousLoginV4 \
    --codeChallenge 'ymXsf57d' \
    --codeChallengeMethod 'S256' \
    --simultaneousPlatform 'IO01p7CM' \
    --simultaneousTicket 'F7wBSU5M' \
    --nativePlatform 'epicgames' \
    --nativePlatformTicket 'dJigmeVg' \
    > test.out 2>&1
eval_tap $? 401 'SimultaneousLoginV4' test.out

#- 402 TokenGrantV4
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV4 \
    --codeChallenge 'snFiT0an' \
    --codeChallengeMethod 'plain' \
    --additionalData 'b4x79QfK' \
    --clientId 'ENqvpvxY' \
    --clientSecret 'YpKSxkOa' \
    --code 'LZdG2q5N' \
    --codeVerifier 'BvgLDeSe' \
    --extendNamespace 'x7H6LGud' \
    --extendExp  \
    --loginQueueTicket '5yyl8SV3' \
    --password '4UvHSe9W' \
    --redirectUri 'CA8xYRgJ' \
    --refreshToken 'QO78THkv' \
    --scope 'xwq4zSHm' \
    --username 'TmWJUPjM' \
    --grantType 'urn:ietf:params:oauth:grant-type:login_queue_ticket' \
    > test.out 2>&1
eval_tap $? 402 'TokenGrantV4' test.out

#- 403 RequestTargetTokenResponseV4
./ng net.accelbyte.sdk.cli.Main iam requestTargetTokenResponseV4 \
    --additionalData 'PeqhDEql' \
    --code 'PjwvoLAS' \
    > test.out 2>&1
eval_tap $? 403 'RequestTargetTokenResponseV4' test.out

#- 404 PublicListUserIDByPlatformUserIDsV4
./ng net.accelbyte.sdk.cli.Main iam publicListUserIDByPlatformUserIDsV4 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'SWlaVNPi' \
    --rawPUID  \
    --body '{"pidType": "igf0HiwS", "platformUserIds": ["PAkxlgMP", "UwSVkEQh", "bUiBa2ML"]}' \
    > test.out 2>&1
eval_tap $? 404 'PublicListUserIDByPlatformUserIDsV4' test.out

#- 405 PublicGetUserByPlatformUserIDV4
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByPlatformUserIDV4 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'HUGXwvAz' \
    --platformUserId 'N4OmjdNq' \
    > test.out 2>&1
eval_tap $? 405 'PublicGetUserByPlatformUserIDV4' test.out

#- 406 PublicCreateTestUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateTestUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "Ev6d632h", "policyId": "dz38hwiD", "policyVersionId": "g7k46CUN"}, {"isAccepted": false, "localizedPolicyVersionId": "KKycP1T3", "policyId": "ivAIlNi3", "policyVersionId": "uB32TiBn"}, {"isAccepted": true, "localizedPolicyVersionId": "eFUAfrZa", "policyId": "NBXUX4iC", "policyVersionId": "VybXmiZn"}], "authType": "EMAILPASSWD", "country": "fe1Vi8je", "dateOfBirth": "efQyTw1Q", "displayName": "DHdfRtvJ", "emailAddress": "idP15Xx1", "password": "Haw5VtuZ", "passwordMD5Sum": "SX5ZfezF", "uniqueDisplayName": "7EiNWqLT", "username": "zC1Efir7", "verified": false}' \
    > test.out 2>&1
eval_tap $? 406 'PublicCreateTestUserV4' test.out

#- 407 PublicCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "ZxMvYDgH", "policyId": "QctaemJv", "policyVersionId": "et2NthJz"}, {"isAccepted": true, "localizedPolicyVersionId": "333Se776", "policyId": "zTLI4ZH8", "policyVersionId": "hXqK54vp"}, {"isAccepted": false, "localizedPolicyVersionId": "3f7vtX0D", "policyId": "iZGPplry", "policyVersionId": "bzocB7kS"}], "authType": "EMAILPASSWD", "code": "V3vjIMFv", "country": "5s4xbyqD", "dateOfBirth": "HBPHmtzY", "displayName": "4yrJEDil", "emailAddress": "jfF87VYW", "password": "iS9neyyL", "passwordMD5Sum": "akueI5SQ", "reachMinimumAge": true, "uniqueDisplayName": "Hh678Lfs", "username": "e5z11FIq"}' \
    > test.out 2>&1
eval_tap $? 407 'PublicCreateUserV4' test.out

#- 408 CreateUserFromInvitationV4
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV4 \
    --invitationId 'SLCzK7ly' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "1EAR6bNy", "policyId": "JRQIysg4", "policyVersionId": "740odL4d"}, {"isAccepted": false, "localizedPolicyVersionId": "0vyYZ2Yx", "policyId": "Zsik1c60", "policyVersionId": "sWxdfgJ2"}, {"isAccepted": false, "localizedPolicyVersionId": "N9NkvBT0", "policyId": "K0z8O49q", "policyVersionId": "DsY0K6D1"}], "authType": "EMAILPASSWD", "code": "Wt9zFzBu", "country": "nXgI4g6x", "dateOfBirth": "QuzMzyI8", "displayName": "vNFyX5CR", "emailAddress": "K1E3gEux", "password": "pqhNVjMv", "passwordMD5Sum": "CaeyuGDH", "reachMinimumAge": true, "uniqueDisplayName": "L7TJlXtP", "username": "49nSdmFM"}' \
    > test.out 2>&1
eval_tap $? 408 'CreateUserFromInvitationV4' test.out

#- 409 PublicUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "iSoZEQ23", "country": "fUG7Excg", "dateOfBirth": "bIwTdU0B", "displayName": "Y4gmhiOE", "languageTag": "J7jgwJzg", "uniqueDisplayName": "u76jVNfy", "userName": "2ysDOK97"}' \
    > test.out 2>&1
eval_tap $? 409 'PublicUpdateUserV4' test.out

#- 410 PublicUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "CNpd7jWl", "emailAddress": "NE6kOyoh"}' \
    > test.out 2>&1
eval_tap $? 410 'PublicUpdateUserEmailAddressV4' test.out

#- 411 PublicUpgradeHeadlessAccountWithVerificationCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountWithVerificationCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "NChNqyYK", "country": "rJaIYke0", "dateOfBirth": "BR7l5N2z", "displayName": "m9xGLNvd", "emailAddress": "nbM3pRfn", "password": "oHtQVNBK", "reachMinimumAge": true, "uniqueDisplayName": "V1xsYUL8", "username": "RfQJeaue", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 411 'PublicUpgradeHeadlessAccountWithVerificationCodeV4' test.out

#- 412 PublicUpgradeHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"dateOfBirth": "GzxI7nnG", "displayName": "8SupgpFs", "emailAddress": "v9AcQUNI", "password": "RSUfHS3G", "uniqueDisplayName": "BhpmpSHL", "username": "a7otyQeI"}' \
    > test.out 2>&1
eval_tap $? 412 'PublicUpgradeHeadlessAccountV4' test.out

#- 413 PublicDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"factor": "2CdC9wLD", "mfaToken": "Yz0mLgDg"}' \
    > test.out 2>&1
eval_tap $? 413 'PublicDisableMyAuthenticatorV4' test.out

#- 414 PublicEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'eJlzuZWx' \
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
    --body '{"factor": "AhjIRIKM", "mfaToken": "HnbAvuxF"}' \
    > test.out 2>&1
eval_tap $? 418 'PublicDisableMyBackupCodesV4' test.out

#- 419 PublicDownloadMyBackupCodesV4
eval_tap 0 419 'PublicDownloadMyBackupCodesV4 # SKIP deprecated' test.out

#- 420 PublicEnableMyBackupCodesV4
eval_tap 0 420 'PublicEnableMyBackupCodesV4 # SKIP deprecated' test.out

#- 421 PublicGetBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGetBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --languageTag 'MZpFIB8e' \
    > test.out 2>&1
eval_tap $? 421 'PublicGetBackupCodesV4' test.out

#- 422 PublicGenerateBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --languageTag 'yiJt6Mwz' \
    > test.out 2>&1
eval_tap $? 422 'PublicGenerateBackupCodesV4' test.out

#- 423 PublicEnableBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --languageTag '6QAPeb33' \
    > test.out 2>&1
eval_tap $? 423 'PublicEnableBackupCodesV4' test.out

#- 424 PublicChallengeMyMFAV4
./ng net.accelbyte.sdk.cli.Main iam publicChallengeMyMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'aBVY2H6J' \
    --factor 'M00McqRp' \
    > test.out 2>&1
eval_tap $? 424 'PublicChallengeMyMFAV4' test.out

#- 425 PublicRemoveTrustedDeviceV4
./ng net.accelbyte.sdk.cli.Main iam publicRemoveTrustedDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceToken 'XRIVmnNP' \
    > test.out 2>&1
eval_tap $? 425 'PublicRemoveTrustedDeviceV4' test.out

#- 426 PublicSendMyMFAEmailCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicSendMyMFAEmailCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --action 'zwWZPmDb' \
    --languageTag '7e3e7JQm' \
    > test.out 2>&1
eval_tap $? 426 'PublicSendMyMFAEmailCodeV4' test.out

#- 427 PublicDisableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyEmailV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"factor": "LSrhD212", "mfaToken": "tfTJHyLh"}' \
    > test.out 2>&1
eval_tap $? 427 'PublicDisableMyEmailV4' test.out

#- 428 PublicEnableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyEmailV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'IENzcmZA' \
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
    --factor 'zUGo81KD' \
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
    --userId 'IntkUUwS' \
    > test.out 2>&1
eval_tap $? 433 'PublicGetUserPublicInfoByUserIdV4' test.out

#- 434 PublicInviteUserV4
./ng net.accelbyte.sdk.cli.Main iam publicInviteUserV4 \
    --body '{"additionalData": "5pSq01lh", "emailAddress": "PkdvR99j", "languageTag": "kAq3EhmB", "namespace": "yOgsYa8e", "namespaceDisplayName": "CKrSsLdk"}' \
    > test.out 2>&1
eval_tap $? 434 'PublicInviteUserV4' test.out

#- 435 PublicUpgradeHeadlessWithCodeV4Forward
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessWithCodeV4Forward \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "aJdNcWJg", "policyId": "deugLvda", "policyVersionId": "cRn0Je7m"}, {"isAccepted": true, "localizedPolicyVersionId": "uMNh1xwR", "policyId": "8YZxr1GT", "policyVersionId": "jHicbwzg"}, {"isAccepted": false, "localizedPolicyVersionId": "WHfEoJuD", "policyId": "xLZvxIgT", "policyVersionId": "QopmteJz"}], "code": "ZSHgvlBk", "country": "rVwMI7Jx", "dateOfBirth": "5JlSEIFJ", "displayName": "Bg4V8JVt", "emailAddress": "hI2pdSPn", "password": "h65MDncp", "reachMinimumAge": true, "uniqueDisplayName": "P2qMGXc4", "username": "WuIw7NE0", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 435 'PublicUpgradeHeadlessWithCodeV4Forward' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
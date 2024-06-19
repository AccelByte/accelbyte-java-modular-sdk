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
echo "1..401"

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
    --body '{"modules": [{"docLink": "mR0ynhTT", "groups": [{"group": "3MB8cxQg", "groupId": "Czl4tcbR", "permissions": [{"allowedActions": [6, 6, 16], "resource": "hLqhsjjs"}, {"allowedActions": [75, 14, 75], "resource": "Q9ShN5KK"}, {"allowedActions": [28, 57, 33], "resource": "44CdQwlm"}]}, {"group": "a7NjZ3W5", "groupId": "Rmh8ZGZC", "permissions": [{"allowedActions": [27, 54, 37], "resource": "Q2TAooLW"}, {"allowedActions": [17, 27, 94], "resource": "SRZE8G3c"}, {"allowedActions": [29, 79, 59], "resource": "KrzWaW1n"}]}, {"group": "laZpZ45T", "groupId": "MhSIPvns", "permissions": [{"allowedActions": [47, 38, 79], "resource": "xI3nYeGd"}, {"allowedActions": [70, 88, 79], "resource": "5eICNGri"}, {"allowedActions": [20, 19, 43], "resource": "WDc82YIr"}]}], "module": "QOIkQOew", "moduleId": "s08vev0S"}, {"docLink": "SsPof91F", "groups": [{"group": "nrqgSff9", "groupId": "TLIJcp5v", "permissions": [{"allowedActions": [100, 72, 75], "resource": "bbVE1EOk"}, {"allowedActions": [72, 39, 33], "resource": "Fn75dep5"}, {"allowedActions": [5, 13, 38], "resource": "SHJX5yPw"}]}, {"group": "mQ5m6YPm", "groupId": "O9pDH7mq", "permissions": [{"allowedActions": [69, 12, 81], "resource": "eQw8SMln"}, {"allowedActions": [85, 17, 13], "resource": "Xvfvh8qD"}, {"allowedActions": [3, 35, 18], "resource": "nPm0dNlk"}]}, {"group": "K8MzgCaw", "groupId": "tgUid4fk", "permissions": [{"allowedActions": [72, 88, 50], "resource": "8Z9fV5NY"}, {"allowedActions": [100, 85, 68], "resource": "l7k1c0lQ"}, {"allowedActions": [61, 76, 95], "resource": "zvUSoNPk"}]}], "module": "xvGU4VUM", "moduleId": "TK0dB6T8"}, {"docLink": "EY4OEYj4", "groups": [{"group": "fJbKL1YC", "groupId": "oX4RBu13", "permissions": [{"allowedActions": [6, 97, 96], "resource": "KFIOS7WS"}, {"allowedActions": [56, 21, 43], "resource": "gUVTtkTs"}, {"allowedActions": [10, 76, 4], "resource": "24SS1ROh"}]}, {"group": "I9DGAHzq", "groupId": "KTNFOy1N", "permissions": [{"allowedActions": [67, 70, 22], "resource": "9QG7VN4U"}, {"allowedActions": [35, 43, 74], "resource": "ujegkyBz"}, {"allowedActions": [64, 84, 96], "resource": "10fQL5FQ"}]}, {"group": "fDMWwHGQ", "groupId": "1cKD4QEf", "permissions": [{"allowedActions": [72, 92, 34], "resource": "OKtNt2Qd"}, {"allowedActions": [42, 73, 71], "resource": "ERIeLvfv"}, {"allowedActions": [3, 32, 100], "resource": "8eSSkfni"}]}], "module": "ekNVDsjN", "moduleId": "VHkdfWhi"}]}' \
    > test.out 2>&1
eval_tap $? 109 'AdminUpdateAvailablePermissionsByModule' test.out

#- 110 AdminDeleteConfigPermissionsByGroup
./ng net.accelbyte.sdk.cli.Main iam adminDeleteConfigPermissionsByGroup \
    --forceDelete  \
    --body '{"groupId": "kEXZ7a7C", "moduleId": "omAi3qvN"}' \
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
    --body '[{"field": "ILtecMT5", "validation": {"allowAllSpecialCharacters": false, "allowDigit": false, "allowLetter": true, "allowSpace": true, "allowUnicode": true, "avatarConfig": {"allowedPrefixes": ["i16o6nl8", "tFIZ1tRH", "hePX3R5B"], "preferRegex": false, "regex": "LCIE6w01"}, "blockedWord": ["xBF6JPiH", "I1rjh47f", "QR0Q9M2p"], "description": [{"language": "yUqrVe5O", "message": ["HEx6e9Qe", "3KuwAl6C", "dv3Huyn2"]}, {"language": "MB0TWhPr", "message": ["6VS4ubUN", "xLTb6R7Z", "7NBcO7ul"]}, {"language": "pNFMfRLr", "message": ["bvsRQ6hi", "LIHu8QXX", "hd0ToYUE"]}], "isCustomRegex": false, "letterCase": "Tn96tkzw", "maxLength": 46, "maxRepeatingAlphaNum": 48, "maxRepeatingSpecialCharacter": 87, "minCharType": 73, "minLength": 0, "profanityFilter": "O87Lo2vO", "regex": "PjIc4pcY", "specialCharacterLocation": "4sNMl48r", "specialCharacters": ["XB7Qgq05", "6ju8bIU3", "lrbyHrEC"]}}, {"field": "G2uczeyQ", "validation": {"allowAllSpecialCharacters": false, "allowDigit": false, "allowLetter": true, "allowSpace": true, "allowUnicode": false, "avatarConfig": {"allowedPrefixes": ["SiJgviMt", "7O0GcIym", "SWOzY6hv"], "preferRegex": false, "regex": "q7mwKHfK"}, "blockedWord": ["laS6xfYU", "2Sbu9JHf", "8VqiMnoJ"], "description": [{"language": "DVo8Jfc6", "message": ["nxmI4gi2", "ajHptMQ4", "OF0zrUPW"]}, {"language": "d6XUy02N", "message": ["HPTPvarw", "L1ZOETk4", "HjvwxXko"]}, {"language": "ANQiyWIL", "message": ["UlvbH26B", "jT74P30w", "R7wtnCt4"]}], "isCustomRegex": false, "letterCase": "ej9eTNcw", "maxLength": 94, "maxRepeatingAlphaNum": 80, "maxRepeatingSpecialCharacter": 36, "minCharType": 14, "minLength": 76, "profanityFilter": "hRnWHJ3r", "regex": "C4ef2O6x", "specialCharacterLocation": "OW6ImJyH", "specialCharacters": ["CC8omLVb", "ewkIremU", "0ipk3RsN"]}}, {"field": "5qI3gh9X", "validation": {"allowAllSpecialCharacters": true, "allowDigit": false, "allowLetter": false, "allowSpace": false, "allowUnicode": false, "avatarConfig": {"allowedPrefixes": ["EHS9Ltqz", "rpwx60Tf", "aBHqarKG"], "preferRegex": false, "regex": "GU0c4OoT"}, "blockedWord": ["SxinbzU1", "7WiVozaO", "UWWEP3eh"], "description": [{"language": "1jSc1rqf", "message": ["5ftMT9sU", "TBGKU0Cf", "HezFn2sK"]}, {"language": "TezbhrGD", "message": ["QhzXNMJS", "edQ2fsSy", "YFvXOVph"]}, {"language": "ZBko5okH", "message": ["6oNFKESS", "kpBNdrBf", "2VgBxFbL"]}], "isCustomRegex": false, "letterCase": "UTj4MGsU", "maxLength": 7, "maxRepeatingAlphaNum": 78, "maxRepeatingSpecialCharacter": 41, "minCharType": 9, "minLength": 22, "profanityFilter": "9ge9FiRl", "regex": "7eY7rGNl", "specialCharacterLocation": "iV3ujM5W", "specialCharacters": ["T18dUe2x", "nTo1QKw1", "LFWl6Bqf"]}}]' \
    > test.out 2>&1
eval_tap $? 113 'AdminUpdateInputValidations' test.out

#- 114 AdminResetInputValidations
./ng net.accelbyte.sdk.cli.Main iam adminResetInputValidations \
    --field 'p3cBSDz4' \
    > test.out 2>&1
eval_tap $? 114 'AdminResetInputValidations' test.out

#- 115 ListAdminsV3
./ng net.accelbyte.sdk.cli.Main iam listAdminsV3 \
    --namespace "$AB_NAMESPACE" \
    --after 'aFZmV4xx' \
    --before 'iRRv4QMF' \
    --endDate 'xjaad16w' \
    --limit '4' \
    --query '8vY5ly94' \
    --roleId 'lpHEpkAc' \
    --startDate 'w5cLUKYk' \
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
    --body '{"ageRestriction": 6, "enable": true}' \
    > test.out 2>&1
eval_tap $? 117 'AdminUpdateAgeRestrictionConfigV3' test.out

#- 118 AdminGetListCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminGetListCountryAgeRestrictionV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 118 'AdminGetListCountryAgeRestrictionV3' test.out

#- 119 AdminUpdateCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateCountryAgeRestrictionV3 \
    --countryCode 'fvbjBTms' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ageRestriction": 95}' \
    > test.out 2>&1
eval_tap $? 119 'AdminUpdateCountryAgeRestrictionV3' test.out

#- 120 AdminGetBannedUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType 'EcLffLPu' \
    --limit '31' \
    --offset '43' \
    > test.out 2>&1
eval_tap $? 120 'AdminGetBannedUsersV3' test.out

#- 121 AdminBanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"ban": "lHjS5rLH", "comment": "b8lUJYhw", "endDate": "j0VA5cxe", "reason": "5zg6IN7h", "skipNotif": false, "userIds": ["M0RSa8dN", "kX9nACGj", "fsog95Pk"]}' \
    > test.out 2>&1
eval_tap $? 121 'AdminBanUserBulkV3' test.out

#- 122 AdminUnbanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminUnbanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"bans": [{"banId": "yOX1BCBO", "userId": "RLlJ2CUN"}, {"banId": "SIylCV5R", "userId": "2hWg82Q6"}, {"banId": "d89KX5k3", "userId": "32XZm719"}]}' \
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
    --clientId 'cMXveNox' \
    --clientName 'hzVyLN5a' \
    --clientType '9qq9NF9M' \
    --limit '59' \
    --offset '43' \
    --skipLoginQueue  \
    > test.out 2>&1
eval_tap $? 124 'AdminGetClientsByNamespaceV3' test.out

#- 125 AdminBulkUpdateClientsV3
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateClientsV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientIds": ["lY4hXcC7", "JXAiqrP5", "weF8MNFi"], "clientUpdateRequest": {"audiences": ["JgTQ1X1S", "z5Gwe2g0", "5pBGP0gr"], "baseUri": "3nXrVeWp", "clientName": "OpCDtiML", "clientPermissions": [{"action": 14, "resource": "Bl3Fqoxx", "schedAction": 86, "schedCron": "pQ6ZRojh", "schedRange": ["5hqcPk7A", "0aWqcq7F", "gGMG6kMk"]}, {"action": 63, "resource": "4An1Cfxy", "schedAction": 54, "schedCron": "g4QSnirp", "schedRange": ["FLXVJwUW", "vY0aRQgx", "vMxqbLEI"]}, {"action": 13, "resource": "dgXaSuVv", "schedAction": 18, "schedCron": "VtVqfEXX", "schedRange": ["lRGR4e6d", "fBTnZZzK", "WyHTvUKV"]}], "clientPlatform": "TbRWnUXk", "deletable": true, "description": "sye9GOAx", "modulePermissions": [{"moduleId": "519dqzYk", "selectedGroups": [{"groupId": "jvPxTl4K", "selectedActions": [17, 18, 20]}, {"groupId": "38E955bq", "selectedActions": [25, 35, 50]}, {"groupId": "zqCRem9O", "selectedActions": [50, 47, 40]}]}, {"moduleId": "7ZRx14uC", "selectedGroups": [{"groupId": "TeCYj5fv", "selectedActions": [51, 97, 25]}, {"groupId": "gKXCDyPU", "selectedActions": [37, 90, 99]}, {"groupId": "bxb0fMov", "selectedActions": [27, 73, 55]}]}, {"moduleId": "5xsjIONe", "selectedGroups": [{"groupId": "V3LyJm5W", "selectedActions": [0, 84, 95]}, {"groupId": "oSc501fi", "selectedActions": [47, 77, 84]}, {"groupId": "PePhRJcb", "selectedActions": [79, 4, 69]}]}], "namespace": "m8D5nbMX", "oauthAccessTokenExpiration": 73, "oauthAccessTokenExpirationTimeUnit": "VsBGnHmV", "oauthRefreshTokenExpiration": 11, "oauthRefreshTokenExpirationTimeUnit": "EzrdVr8K", "redirectUri": "2kjHXo2J", "scopes": ["zDWCLpGh", "8tIoLodk", "1puCPhX7"], "skipLoginQueue": false, "twoFactorEnabled": false}}' \
    > test.out 2>&1
eval_tap $? 125 'AdminBulkUpdateClientsV3' test.out

#- 126 AdminCreateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateClientV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["IOcz6FNJ", "l3ZKRHOd", "RW9wBtNZ"], "baseUri": "ITm5IfrC", "clientId": "JwPAYQic", "clientName": "GI5bTvFA", "clientPermissions": [{"action": 70, "resource": "caArw59l", "schedAction": 67, "schedCron": "AOC8IDRl", "schedRange": ["BhZ4AkBV", "lpsby1oY", "rGUBCfTq"]}, {"action": 97, "resource": "ghhv65Kc", "schedAction": 56, "schedCron": "ZeF9SFri", "schedRange": ["7qcjCRBO", "chhnF7Iq", "Mbdgf1di"]}, {"action": 11, "resource": "RRCEGSwA", "schedAction": 98, "schedCron": "lHvsO3AZ", "schedRange": ["Yh3b95rU", "yFuRt1tM", "4PtDV0Gl"]}], "clientPlatform": "MZNQjLdT", "deletable": false, "description": "lznEbCWH", "modulePermissions": [{"moduleId": "vDiVnnyN", "selectedGroups": [{"groupId": "5pKl63dF", "selectedActions": [32, 53, 32]}, {"groupId": "JR64tP2H", "selectedActions": [40, 14, 4]}, {"groupId": "R4e2S8Wb", "selectedActions": [25, 60, 88]}]}, {"moduleId": "pgobmFsa", "selectedGroups": [{"groupId": "geA5r2pc", "selectedActions": [62, 12, 71]}, {"groupId": "3KWqOzbG", "selectedActions": [64, 62, 6]}, {"groupId": "UxkAfNF4", "selectedActions": [5, 29, 23]}]}, {"moduleId": "mTDcqaWQ", "selectedGroups": [{"groupId": "i4WmRm6O", "selectedActions": [84, 34, 44]}, {"groupId": "GGZyQLyP", "selectedActions": [54, 47, 1]}, {"groupId": "zJog3WRd", "selectedActions": [96, 6, 80]}]}], "namespace": "8hMMZy8o", "oauthAccessTokenExpiration": 40, "oauthAccessTokenExpirationTimeUnit": "udzoPKJp", "oauthClientType": "bA0cOJoD", "oauthRefreshTokenExpiration": 73, "oauthRefreshTokenExpirationTimeUnit": "1E8A09xA", "parentNamespace": "HOsTDD05", "redirectUri": "ghdVZAbS", "scopes": ["jwxeVvtG", "ysi9JYI2", "LtppRzn4"], "secret": "J7q4cxMs", "skipLoginQueue": true, "twoFactorEnabled": true}' \
    > test.out 2>&1
eval_tap $? 126 'AdminCreateClientV3' test.out

#- 127 AdminGetClientsbyNamespacebyIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetClientsbyNamespacebyIDV3 \
    --clientId 'vrTtEECD' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 127 'AdminGetClientsbyNamespacebyIDV3' test.out

#- 128 AdminDeleteClientV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientV3 \
    --clientId 'XfeyAQMY' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 128 'AdminDeleteClientV3' test.out

#- 129 AdminUpdateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientV3 \
    --clientId 'XLWwkRN8' \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["A089C39w", "8ag0z4Ys", "DfXrLPor"], "baseUri": "ZdAig1ZZ", "clientName": "E6cPynVW", "clientPermissions": [{"action": 4, "resource": "unlckpgD", "schedAction": 80, "schedCron": "6ZEJbC8i", "schedRange": ["u2VCvaFm", "OYBDDlNu", "XOge96ei"]}, {"action": 90, "resource": "4R14dmpN", "schedAction": 24, "schedCron": "NP7POBDk", "schedRange": ["5vA2vqit", "SSkGy9JJ", "llHLnGqs"]}, {"action": 70, "resource": "leHvhE5L", "schedAction": 97, "schedCron": "jFfTF5Ao", "schedRange": ["X058TAus", "1qbnn6gH", "ErAvLIIt"]}], "clientPlatform": "iwQj5mRq", "deletable": false, "description": "N3mjjyy5", "modulePermissions": [{"moduleId": "He9czHrR", "selectedGroups": [{"groupId": "gBBTkSA3", "selectedActions": [24, 35, 43]}, {"groupId": "q4wyJmio", "selectedActions": [89, 47, 13]}, {"groupId": "1epg7hyR", "selectedActions": [20, 18, 19]}]}, {"moduleId": "jx0D2qUA", "selectedGroups": [{"groupId": "IdEOwtBU", "selectedActions": [16, 11, 73]}, {"groupId": "49fowh5F", "selectedActions": [41, 95, 56]}, {"groupId": "L2pjYZAX", "selectedActions": [92, 93, 20]}]}, {"moduleId": "5KvQP4hY", "selectedGroups": [{"groupId": "mlQJN6Ah", "selectedActions": [98, 76, 94]}, {"groupId": "ROo6LTGm", "selectedActions": [70, 19, 11]}, {"groupId": "WCbEHLZD", "selectedActions": [20, 22, 67]}]}], "namespace": "64CwLIqr", "oauthAccessTokenExpiration": 6, "oauthAccessTokenExpirationTimeUnit": "ETmEVs46", "oauthRefreshTokenExpiration": 90, "oauthRefreshTokenExpirationTimeUnit": "eyaE3pXQ", "redirectUri": "3YOjinDk", "scopes": ["E0s6v5j1", "RF8oGHl7", "SCEBPzS0"], "skipLoginQueue": false, "twoFactorEnabled": false}' \
    > test.out 2>&1
eval_tap $? 129 'AdminUpdateClientV3' test.out

#- 130 AdminUpdateClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientPermissionV3 \
    --clientId '29yQCH9U' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 7, "resource": "N1JoiFiu"}, {"action": 14, "resource": "8oaupxLZ"}, {"action": 91, "resource": "HAKHlslj"}]}' \
    > test.out 2>&1
eval_tap $? 130 'AdminUpdateClientPermissionV3' test.out

#- 131 AdminAddClientPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddClientPermissionsV3 \
    --clientId '2R0rCf20' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 58, "resource": "eUFm3Yi0"}, {"action": 97, "resource": "kbFsnW74"}, {"action": 61, "resource": "jckvXxld"}]}' \
    > test.out 2>&1
eval_tap $? 131 'AdminAddClientPermissionsV3' test.out

#- 132 AdminDeleteClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientPermissionV3 \
    --action '68' \
    --clientId 'Iy1iJf0P' \
    --namespace "$AB_NAMESPACE" \
    --resource 'NKJJ8KBW' \
    > test.out 2>&1
eval_tap $? 132 'AdminDeleteClientPermissionV3' test.out

#- 133 AdminGetConfigValueV3
./ng net.accelbyte.sdk.cli.Main iam adminGetConfigValueV3 \
    --configKey 'v8rVceQK' \
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
    --body '{"blacklist": ["Rsd2Kc8c", "yA8zFdoM", "ntyXbZ3V"]}' \
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
    --limit '26' \
    --offset '66' \
    > test.out 2>&1
eval_tap $? 139 'RetrieveAllSSOLoginPlatformCredentialV3' test.out

#- 140 RetrieveThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '2dpi4ncz' \
    > test.out 2>&1
eval_tap $? 140 'RetrieveThirdPartyLoginPlatformCredentialV3' test.out

#- 141 AddThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam addThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '8F8eLcm0' \
    --body '{"ACSURL": "H3t1R49Z", "AWSCognitoRegion": "yFaCLXvv", "AWSCognitoUserPool": "tkvOem2a", "AllowedClients": ["KJXztQVU", "8BwHeG27", "jcy3xRuY"], "AppId": "rhQODwir", "AuthorizationEndpoint": "spZFvODc", "ClientId": "wYuYQWtS", "EmptyStrFieldList": ["9qA6Awib", "sI1Y2HEU", "v2PHNn6X"], "Environment": "8zuHCGzP", "FederationMetadataURL": "006xyZkq", "GenericOauthFlow": true, "IsActive": true, "Issuer": "JCcXYAPW", "JWKSEndpoint": "eN08Zt43", "KeyID": "nnWtCSHW", "LogoURL": "bTvGxp39", "NetflixCertificates": {"encryptedPrivateKey": "sw6Jsrnj", "encryptedPrivateKeyName": "lhkCAbng", "publicCertificate": "DKKKzKED", "publicCertificateName": "onTKNk2C", "rootCertificate": "TMeAlsA8", "rootCertificateName": "sVkv7RTG"}, "OrganizationId": "xqOhMCOA", "PlatformName": "aqQWHrvi", "RedirectUri": "8lw8by1f", "RegisteredDomains": [{"affectedClientIDs": ["GMwKt1RZ", "8JImluWw", "KYJVaorx"], "domain": "GnCTJbf9", "namespaces": ["QCVrBDDD", "Jaa1UCk0", "TwfujnlK"], "roleId": "7xdlBlUr"}, {"affectedClientIDs": ["LZDS4rMO", "GjraJwU9", "nXztOygE"], "domain": "vZyMbRyC", "namespaces": ["PtsVM53Q", "jgrY5RNt", "M8P9e5Ll"], "roleId": "WTE0iUtb"}, {"affectedClientIDs": ["vM1ETgPo", "2M4jr3Q9", "gnhLY0ew"], "domain": "AASuHCfw", "namespaces": ["YbOiVl3W", "ABO5Mm6L", "tscDGoqY"], "roleId": "jB4nUZFi"}], "Secret": "FccmdilJ", "TeamID": "V7oAkMwK", "TokenAuthenticationType": "nc24XESq", "TokenClaimsMapping": {"3HzU9Zd7": "jP4aS7FU", "QtHkZYox": "KOx8tTjJ", "VI1vFgBl": "Vjs4P0RN"}, "TokenEndpoint": "6nWwIWGc", "UserInfoEndpoint": "Cqnxf4y5", "UserInfoHTTPMethod": "6wZrEdWt", "scopes": ["di8O2b5g", "BnFYoFYX", "tPKdksGB"]}' \
    > test.out 2>&1
eval_tap $? 141 'AddThirdPartyLoginPlatformCredentialV3' test.out

#- 142 DeleteThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'L2WoerCX' \
    > test.out 2>&1
eval_tap $? 142 'DeleteThirdPartyLoginPlatformCredentialV3' test.out

#- 143 UpdateThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '1n0To8xA' \
    --body '{"ACSURL": "vBpd23iS", "AWSCognitoRegion": "sDtkHbmK", "AWSCognitoUserPool": "qoHZ2Few", "AllowedClients": ["SjIxzBGC", "HquUgrrp", "odh8yVcG"], "AppId": "MDB5upc0", "AuthorizationEndpoint": "vqJpz2vN", "ClientId": "33bVD7zI", "EmptyStrFieldList": ["OPeujoA5", "1dTmKyCC", "Iu6Vi7mV"], "Environment": "A6mNdsTL", "FederationMetadataURL": "Ww0LQUmO", "GenericOauthFlow": true, "IsActive": true, "Issuer": "3Ns0JRRH", "JWKSEndpoint": "KxDBbZpm", "KeyID": "zvgpQnok", "LogoURL": "pc4h2dJ1", "NetflixCertificates": {"encryptedPrivateKey": "qJU5e0E9", "encryptedPrivateKeyName": "DZGG0tN3", "publicCertificate": "WTiKe5EK", "publicCertificateName": "jgeFLoyC", "rootCertificate": "bylvo6of", "rootCertificateName": "Y9FziR7Z"}, "OrganizationId": "g5fUvMXw", "PlatformName": "CTAuGyIT", "RedirectUri": "sP9Wf47P", "RegisteredDomains": [{"affectedClientIDs": ["Jdt65W3s", "csijLqMT", "YCHvKgw6"], "domain": "O14G1ev0", "namespaces": ["5FfdwTtj", "M4c4ubN8", "9yEWtqCX"], "roleId": "RZE3LRxy"}, {"affectedClientIDs": ["uYmWOIIx", "xkYE3r2l", "X1XG2xsk"], "domain": "8xtVz1Su", "namespaces": ["79W4s1pY", "RSofBT4S", "8tgPafwE"], "roleId": "mBp3ZFCl"}, {"affectedClientIDs": ["eXEkK7X1", "m1opyHJt", "QbhXtKl7"], "domain": "lMjOlyn9", "namespaces": ["A7rFQ9pt", "PAY699fN", "xFhcUpf8"], "roleId": "QLLKzX3i"}], "Secret": "Fz7dlHJD", "TeamID": "ypcoc7Xo", "TokenAuthenticationType": "9P00NpKd", "TokenClaimsMapping": {"Hoyc9hZE": "G1xgcRlf", "OU6rn7jl": "ktM0Kyux", "LjduptFx": "Iu2xFxHf"}, "TokenEndpoint": "7m0LJPKP", "UserInfoEndpoint": "UIPIpt7d", "UserInfoHTTPMethod": "1hylnhT5", "scopes": ["4kbZdD6P", "VLlmnM41", "chuXHJL8"]}' \
    > test.out 2>&1
eval_tap $? 143 'UpdateThirdPartyLoginPlatformCredentialV3' test.out

#- 144 UpdateThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '0fqdCaXy' \
    --body '{"affectedClientIDs": ["fgR65PVk", "Ei2JTZiJ", "c3UbdU0f"], "assignedNamespaces": ["oSI34VEV", "DaBCyqvt", "XBupS6cL"], "domain": "Lk8e1uAO", "roleId": "XXV77eEf"}' \
    > test.out 2>&1
eval_tap $? 144 'UpdateThirdPartyLoginPlatformDomainV3' test.out

#- 145 DeleteThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'jOwCiTye' \
    --body '{"domain": "NFqUTMuB"}' \
    > test.out 2>&1
eval_tap $? 145 'DeleteThirdPartyLoginPlatformDomainV3' test.out

#- 146 RetrieveSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam retrieveSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId '4Sjai3vk' \
    > test.out 2>&1
eval_tap $? 146 'RetrieveSSOLoginPlatformCredential' test.out

#- 147 AddSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam addSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'TngtSXKT' \
    --body '{"acsUrl": "Qp5gDO9X", "apiKey": "IO3mMAVA", "appId": "OtNbU8DI", "federationMetadataUrl": "p5ZxzpU8", "isActive": false, "redirectUri": "z2UKXZCz", "secret": "9tHi0ylO", "ssoUrl": "11jB2GCP"}' \
    > test.out 2>&1
eval_tap $? 147 'AddSSOLoginPlatformCredential' test.out

#- 148 DeleteSSOLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteSSOLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'i4YGfCQ9' \
    > test.out 2>&1
eval_tap $? 148 'DeleteSSOLoginPlatformCredentialV3' test.out

#- 149 UpdateSSOPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam updateSSOPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'rGXPjuGP' \
    --body '{"acsUrl": "0Cs4Q59k", "apiKey": "PxVyzdSo", "appId": "2QE9tZ28", "federationMetadataUrl": "vJpH0ruS", "isActive": true, "redirectUri": "i92YPy9B", "secret": "GJ0sZ9Nn", "ssoUrl": "Pdgovy9M"}' \
    > test.out 2>&1
eval_tap $? 149 'UpdateSSOPlatformCredential' test.out

#- 150 AdminListUserIDByPlatformUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByPlatformUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Sp5k9C0J' \
    --rawPID  \
    --rawPUID  \
    --body '{"platformUserIds": ["oI3jphoM", "g8qLY9jZ", "jQK8IwKd"]}' \
    > test.out 2>&1
eval_tap $? 150 'AdminListUserIDByPlatformUserIDsV3' test.out

#- 151 AdminGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '4vnMpPQU' \
    --platformUserId 'mirh0qqo' \
    > test.out 2>&1
eval_tap $? 151 'AdminGetUserByPlatformUserIDV3' test.out

#- 152 GetAdminUsersByRoleIdV3
./ng net.accelbyte.sdk.cli.Main iam getAdminUsersByRoleIdV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'PXXgflFj' \
    --after '51' \
    --before '12' \
    --limit '85' \
    > test.out 2>&1
eval_tap $? 152 'GetAdminUsersByRoleIdV3' test.out

#- 153 AdminGetUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --emailAddress 'ptLnoMpm' \
    > test.out 2>&1
eval_tap $? 153 'AdminGetUserByEmailAddressV3' test.out

#- 154 AdminBulkUpdateUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"updateRequest": {"skipLoginQueue": false}, "userIds": ["gkYl222M", "QLl3i2zz", "WDg4HI6f"]}' \
    > test.out 2>&1
eval_tap $? 154 'AdminBulkUpdateUsersV3' test.out

#- 155 AdminGetBulkUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType 'eU1Y65Ua' \
    --body '{"bulkUserId": ["3XkREVfZ", "4wLoTdkk", "m6z0mFHp"]}' \
    > test.out 2>&1
eval_tap $? 155 'AdminGetBulkUserBanV3' test.out

#- 156 AdminListUserIDByUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["cMmgDlTZ", "qVkc2IwJ", "o7NrUeUD"]}' \
    > test.out 2>&1
eval_tap $? 156 'AdminListUserIDByUserIDsV3' test.out

#- 157 AdminBulkGetUsersPlatform
./ng net.accelbyte.sdk.cli.Main iam adminBulkGetUsersPlatform \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["zyT20nUb", "SWs93fe5", "IRF9ABLP"]}' \
    > test.out 2>&1
eval_tap $? 157 'AdminBulkGetUsersPlatform' test.out

#- 158 AdminInviteUserV3
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddresses": ["ncfuruZC", "xMTIFW3O", "nZ8Bk2rA"], "isAdmin": true, "languageTag": "TbBuvXBZ", "namespace": "ouYprWnK", "roles": ["Lh7BLH5V", "TrtnBPI9", "o36vIMCq"]}' \
    > test.out 2>&1
eval_tap $? 158 'AdminInviteUserV3' test.out

#- 159 AdminQueryThirdPlatformLinkHistoryV3
./ng net.accelbyte.sdk.cli.Main iam adminQueryThirdPlatformLinkHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '15' \
    --offset '9' \
    --platformUserId 'L2w4D8ki' \
    --platformId 'PFmFGTmY' \
    > test.out 2>&1
eval_tap $? 159 'AdminQueryThirdPlatformLinkHistoryV3' test.out

#- 160 AdminListUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminListUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '95' \
    --offset '46' \
    > test.out 2>&1
eval_tap $? 160 'AdminListUsersV3' test.out

#- 161 AdminSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam adminSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'CvQZl29I' \
    --endDate '09dLI9eV' \
    --includeTotal  \
    --limit '19' \
    --offset '58' \
    --platformBy 'oMKcq11D' \
    --platformId 'BYYAxGTB' \
    --query 'xszCkmE9' \
    --roleIds '5wEfuyI9' \
    --skipLoginQueue  \
    --startDate '0QTF987j' \
    --testAccount  \
    > test.out 2>&1
eval_tap $? 161 'AdminSearchUserV3' test.out

#- 162 AdminGetBulkUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"listEmailAddressRequest": ["5CKAk6W7", "l2a863QA", "Y81FStfz"]}' \
    > test.out 2>&1
eval_tap $? 162 'AdminGetBulkUserByEmailAddressV3' test.out

#- 163 AdminGetUserByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '1wwbPTI7' \
    > test.out 2>&1
eval_tap $? 163 'AdminGetUserByUserIdV3' test.out

#- 164 AdminUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'EaNXW3lz' \
    --body '{"avatarUrl": "ieialAK2", "country": "c12Dgg44", "dateOfBirth": "gLdZWuGC", "displayName": "bQwz811H", "languageTag": "McRUThgR", "skipLoginQueue": true, "uniqueDisplayName": "jVzVXALf", "userName": "X0TXzyKe"}' \
    > test.out 2>&1
eval_tap $? 164 'AdminUpdateUserV3' test.out

#- 165 AdminGetUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'KjYxrBiQ' \
    --activeOnly  \
    --after 'lTeKCX3w' \
    --before '2eBzO3bt' \
    --limit '12' \
    > test.out 2>&1
eval_tap $? 165 'AdminGetUserBanV3' test.out

#- 166 AdminBanUserV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'puqei5ZA' \
    --body '{"ban": "Tlfhzi9x", "comment": "scMOZfo1", "endDate": "KwUajl1A", "reason": "KLBRFnAk", "skipNotif": false}' \
    > test.out 2>&1
eval_tap $? 166 'AdminBanUserV3' test.out

#- 167 AdminGetUserBanSummaryV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanSummaryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'JIh9209M' \
    > test.out 2>&1
eval_tap $? 167 'AdminGetUserBanSummaryV3' test.out

#- 168 AdminUpdateUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserBanV3 \
    --banId 'cdnnPbEP' \
    --namespace "$AB_NAMESPACE" \
    --userId 'uFWl7HbJ' \
    --body '{"enabled": true, "skipNotif": true}' \
    > test.out 2>&1
eval_tap $? 168 'AdminUpdateUserBanV3' test.out

#- 169 AdminSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'wStKTTOL' \
    --body '{"context": "znZw6tWp", "emailAddress": "swxdqqqN", "languageTag": "F2MKbgAQ"}' \
    > test.out 2>&1
eval_tap $? 169 'AdminSendVerificationCodeV3' test.out

#- 170 AdminVerifyAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'VSQBUjmy' \
    --body '{"Code": "XSVmYc8O", "ContactType": "Tb4dwkrF", "LanguageTag": "S1pNMsO4", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 170 'AdminVerifyAccountV3' test.out

#- 171 GetUserVerificationCode
./ng net.accelbyte.sdk.cli.Main iam getUserVerificationCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'YBNATTAr' \
    > test.out 2>&1
eval_tap $? 171 'GetUserVerificationCode' test.out

#- 172 AdminGetUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'JVmLIcP6' \
    > test.out 2>&1
eval_tap $? 172 'AdminGetUserDeletionStatusV3' test.out

#- 173 AdminUpdateUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '9mIcz97D' \
    --body '{"deletionDate": 42, "enabled": true}' \
    > test.out 2>&1
eval_tap $? 173 'AdminUpdateUserDeletionStatusV3' test.out

#- 174 AdminListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'zkcdR5mR' \
    > test.out 2>&1
eval_tap $? 174 'AdminListUserAllPlatformAccountsDistinctV3' test.out

#- 175 AdminUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'WVRyCzzx' \
    --body '{"code": "3LNOgTvj", "country": "0m8cAKgX", "dateOfBirth": "87VFfKNX", "displayName": "FS9rENLJ", "emailAddress": "yXWLQ8qS", "password": "kLsKIvLD", "uniqueDisplayName": "dSibgtev", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 175 'AdminUpgradeHeadlessAccountV3' test.out

#- 176 AdminDeleteUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'WbcTTJtu' \
    > test.out 2>&1
eval_tap $? 176 'AdminDeleteUserInformationV3' test.out

#- 177 AdminGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '4ziGZ2XP' \
    --after '0.25381536599295285' \
    --before '0.4222052841881955' \
    --limit '46' \
    > test.out 2>&1
eval_tap $? 177 'AdminGetUserLoginHistoriesV3' test.out

#- 178 AdminResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam adminResetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'a5ZTZTK3' \
    --body '{"languageTag": "USmhfBi8", "mfaToken": "rhPCtkmF", "newPassword": "3P5cA32A", "oldPassword": "wxwFFDOW"}' \
    > test.out 2>&1
eval_tap $? 178 'AdminResetPasswordV3' test.out

#- 179 AdminUpdateUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserPermissionV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'G6h7xfn2' \
    --body '{"Permissions": [{"Action": 40, "Resource": "9IxsVE3j", "SchedAction": 33, "SchedCron": "VYJ856aK", "SchedRange": ["gNeQVdiX", "jmxv12aH", "mjkWVTl1"]}, {"Action": 9, "Resource": "fwOdrnJX", "SchedAction": 15, "SchedCron": "oy7Gpic2", "SchedRange": ["iUkuWLAw", "zB8jx3S8", "FBxVzvna"]}, {"Action": 27, "Resource": "vLc3KYHr", "SchedAction": 28, "SchedCron": "05hHoj2t", "SchedRange": ["FUCD9EVi", "IsEYmXGK", "2DmIt7Nm"]}]}' \
    > test.out 2>&1
eval_tap $? 179 'AdminUpdateUserPermissionV3' test.out

#- 180 AdminAddUserPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserPermissionsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'GSLcp4le' \
    --body '{"Permissions": [{"Action": 96, "Resource": "2W5ZunhK", "SchedAction": 7, "SchedCron": "6mgE2GYZ", "SchedRange": ["cV3Ms4XK", "gfBc3PFz", "e9BH8LjE"]}, {"Action": 56, "Resource": "7NleTCPL", "SchedAction": 28, "SchedCron": "c4jVQn2z", "SchedRange": ["HrEIClQn", "fFOqp6ni", "BqM7YdxW"]}, {"Action": 58, "Resource": "GdCICPNs", "SchedAction": 66, "SchedCron": "9CPcRLt8", "SchedRange": ["Xt1TQDsy", "42f3JiLM", "3faLcOFu"]}]}' \
    > test.out 2>&1
eval_tap $? 180 'AdminAddUserPermissionsV3' test.out

#- 181 AdminDeleteUserPermissionBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '5O3rqbYX' \
    --body '[{"Action": 81, "Resource": "FNo6kGA1"}, {"Action": 49, "Resource": "J6R5GqJ1"}, {"Action": 13, "Resource": "7LksnI2J"}]' \
    > test.out 2>&1
eval_tap $? 181 'AdminDeleteUserPermissionBulkV3' test.out

#- 182 AdminDeleteUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionV3 \
    --action '52' \
    --namespace "$AB_NAMESPACE" \
    --resource 'wSEJScOG' \
    --userId 'TadG81Fi' \
    > test.out 2>&1
eval_tap $? 182 'AdminDeleteUserPermissionV3' test.out

#- 183 AdminGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'JPJx9BWC' \
    --after 'tnzGnUeh' \
    --before 'WI0suyhn' \
    --limit '77' \
    --platformId 'Ja1c4h4p' \
    --targetNamespace 'g8lgAM4o' \
    > test.out 2>&1
eval_tap $? 183 'AdminGetUserPlatformAccountsV3' test.out

#- 184 AdminGetListJusticePlatformAccounts
./ng net.accelbyte.sdk.cli.Main iam adminGetListJusticePlatformAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'E8f4uRvC' \
    > test.out 2>&1
eval_tap $? 184 'AdminGetListJusticePlatformAccounts' test.out

#- 185 AdminGetUserMapping
./ng net.accelbyte.sdk.cli.Main iam adminGetUserMapping \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'EaHfsPhd' \
    --userId '4QxLh1pn' \
    > test.out 2>&1
eval_tap $? 185 'AdminGetUserMapping' test.out

#- 186 AdminCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam adminCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'QTlSqhPP' \
    --userId 'OBAgOfH9' \
    > test.out 2>&1
eval_tap $? 186 'AdminCreateJusticeUser' test.out

#- 187 AdminLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'j34lArBt' \
    --skipConflict  \
    --body '{"platformId": "N3jVcEUf", "platformUserId": "bkASQjA0"}' \
    > test.out 2>&1
eval_tap $? 187 'AdminLinkPlatformAccount' test.out

#- 188 AdminPlatformUnlinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformUnlinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'BqVeRuEG' \
    --userId 'CDR3Lgkf' \
    --body '{"platformNamespace": "gg0C7q1g"}' \
    > test.out 2>&1
eval_tap $? 188 'AdminPlatformUnlinkV3' test.out

#- 189 AdminPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'VOvWJNjg' \
    --userId 'WaZQIS96' \
    > test.out 2>&1
eval_tap $? 189 'AdminPlatformUnlinkAllV3' test.out

#- 190 AdminPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Xkq0JbQI' \
    --userId 'YF1Z4aez' \
    --ticket '1jaUHS4o' \
    > test.out 2>&1
eval_tap $? 190 'AdminPlatformLinkV3' test.out

#- 191 AdminDeleteUserLinkingHistoryByPlatformIDV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserLinkingHistoryByPlatformIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Pv8vmrCI' \
    --userId 'lMXcwixG' \
    > test.out 2>&1
eval_tap $? 191 'AdminDeleteUserLinkingHistoryByPlatformIDV3' test.out

#- 192 AdminGetThirdPartyPlatformTokenLinkStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetThirdPartyPlatformTokenLinkStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Hyk4z5MC' \
    --userId 'aiEGjOYU' \
    --platformToken '0ox8sebC' \
    > test.out 2>&1
eval_tap $? 192 'AdminGetThirdPartyPlatformTokenLinkStatusV3' test.out

#- 193 AdminGetUserSinglePlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminGetUserSinglePlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --platformId 'oYAbZWmS' \
    --userId 'eyLXBl4W' \
    > test.out 2>&1
eval_tap $? 193 'AdminGetUserSinglePlatformAccount' test.out

#- 194 AdminDeleteUserRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRolesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'mOdcZN5b' \
    --body '["tDq61WPL", "Ookoom8w", "goAIhFlN"]' \
    > test.out 2>&1
eval_tap $? 194 'AdminDeleteUserRolesV3' test.out

#- 195 AdminSaveUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminSaveUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'fK3UM612' \
    --body '[{"namespace": "m7m3mWv1", "roleId": "dWJ6dDdQ"}, {"namespace": "Ii05nzw7", "roleId": "jShDHWUp"}, {"namespace": "e0t8JLEU", "roleId": "qHFEnVAC"}]' \
    > test.out 2>&1
eval_tap $? 195 'AdminSaveUserRoleV3' test.out

#- 196 AdminAddUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'TBwkg0ey' \
    --userId 'CQpISeL3' \
    > test.out 2>&1
eval_tap $? 196 'AdminAddUserRoleV3' test.out

#- 197 AdminDeleteUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'kGHUv4Dt' \
    --userId 'RPqhnDVn' \
    > test.out 2>&1
eval_tap $? 197 'AdminDeleteUserRoleV3' test.out

#- 198 AdminUpdateUserStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZuubWcyi' \
    --body '{"enabled": false, "reason": "qARVSGQo"}' \
    > test.out 2>&1
eval_tap $? 198 'AdminUpdateUserStatusV3' test.out

#- 199 AdminTrustlyUpdateUserIdentity
./ng net.accelbyte.sdk.cli.Main iam adminTrustlyUpdateUserIdentity \
    --namespace "$AB_NAMESPACE" \
    --userId 'wWx9BKvA' \
    --body '{"emailAddress": "Zc0gkVnQ", "password": "dJVhP2Jq"}' \
    > test.out 2>&1
eval_tap $? 199 'AdminTrustlyUpdateUserIdentity' test.out

#- 200 AdminVerifyUserWithoutVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyUserWithoutVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'sPObo1hG' \
    > test.out 2>&1
eval_tap $? 200 'AdminVerifyUserWithoutVerificationCodeV3' test.out

#- 201 AdminUpdateClientSecretV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientSecretV3 \
    --clientId 'b4qqvPT7' \
    --namespace "$AB_NAMESPACE" \
    --body '{"newSecret": "d9VxOmjV"}' \
    > test.out 2>&1
eval_tap $? 201 'AdminUpdateClientSecretV3' test.out

#- 202 AdminCheckThirdPartyLoginPlatformAvailabilityV3
./ng net.accelbyte.sdk.cli.Main iam adminCheckThirdPartyLoginPlatformAvailabilityV3 \
    --platformId 'Lf9RkD1Z' \
    > test.out 2>&1
eval_tap $? 202 'AdminCheckThirdPartyLoginPlatformAvailabilityV3' test.out

#- 203 AdminGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV3 \
    --after 'JdQ1Dmx8' \
    --before 'Me6lEaZd' \
    --isWildcard  \
    --limit '43' \
    > test.out 2>&1
eval_tap $? 203 'AdminGetRolesV3' test.out

#- 204 AdminCreateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV3 \
    --body '{"adminRole": true, "deletable": true, "isWildcard": true, "managers": [{"displayName": "MRzsuzzN", "namespace": "jPRTwY85", "userId": "VssMC82J"}, {"displayName": "NPPN8Npg", "namespace": "A6DCnThK", "userId": "WCQCvUXJ"}, {"displayName": "fUA8hkBw", "namespace": "s6BHG5TY", "userId": "Y2KAMlYv"}], "members": [{"displayName": "NJ7qwJVg", "namespace": "c8ddOCvK", "userId": "RY45s9OO"}, {"displayName": "Rk7mCLeY", "namespace": "heOCuDEZ", "userId": "xw7CfdwJ"}, {"displayName": "c3m9jkcF", "namespace": "Ql8N6K7g", "userId": "W1KXnroJ"}], "permissions": [{"action": 89, "resource": "d0NiVl9C", "schedAction": 83, "schedCron": "tmcz1aj1", "schedRange": ["h7rgqkkT", "Yr9E6DvS", "dKjqsIXb"]}, {"action": 62, "resource": "amUuzCKT", "schedAction": 37, "schedCron": "jXapbi2n", "schedRange": ["awrfiFrv", "DeNZpqGu", "z7GFyDqI"]}, {"action": 40, "resource": "6C1pAmLz", "schedAction": 21, "schedCron": "nQPcKCqk", "schedRange": ["xkzUw5LO", "0GmEABMe", "AHkgyJfd"]}], "roleName": "wSeZ372e"}' \
    > test.out 2>&1
eval_tap $? 204 'AdminCreateRoleV3' test.out

#- 205 AdminGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV3 \
    --roleId 'LswqmgF3' \
    > test.out 2>&1
eval_tap $? 205 'AdminGetRoleV3' test.out

#- 206 AdminDeleteRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV3 \
    --roleId 'BYPznUSr' \
    > test.out 2>&1
eval_tap $? 206 'AdminDeleteRoleV3' test.out

#- 207 AdminUpdateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV3 \
    --roleId 'jg5wGiPb' \
    --body '{"deletable": false, "isWildcard": true, "roleName": "713ZmoQp"}' \
    > test.out 2>&1
eval_tap $? 207 'AdminUpdateRoleV3' test.out

#- 208 AdminGetRoleAdminStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleAdminStatusV3 \
    --roleId 'U24pIjvd' \
    > test.out 2>&1
eval_tap $? 208 'AdminGetRoleAdminStatusV3' test.out

#- 209 AdminUpdateAdminRoleStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateAdminRoleStatusV3 \
    --roleId 'oln1Rvn0' \
    > test.out 2>&1
eval_tap $? 209 'AdminUpdateAdminRoleStatusV3' test.out

#- 210 AdminRemoveRoleAdminV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleAdminV3 \
    --roleId 'ldRqcDba' \
    > test.out 2>&1
eval_tap $? 210 'AdminRemoveRoleAdminV3' test.out

#- 211 AdminGetRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleManagersV3 \
    --roleId '3ICN25bI' \
    --after 'Uciqh2rx' \
    --before 'MpCOkQpG' \
    --limit '4' \
    > test.out 2>&1
eval_tap $? 211 'AdminGetRoleManagersV3' test.out

#- 212 AdminAddRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleManagersV3 \
    --roleId 'mtb3YMQw' \
    --body '{"managers": [{"displayName": "lM8EEA7A", "namespace": "j0cN497R", "userId": "YuKcLQAN"}, {"displayName": "GfZSRNOt", "namespace": "WSKTAL9a", "userId": "KtKCuVJ5"}, {"displayName": "QelIwsvX", "namespace": "iLJCgBHo", "userId": "NAWkeJH6"}]}' \
    > test.out 2>&1
eval_tap $? 212 'AdminAddRoleManagersV3' test.out

#- 213 AdminRemoveRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleManagersV3 \
    --roleId 'jxsem1U8' \
    --body '{"managers": [{"displayName": "Yg1WdsEu", "namespace": "PwT5b672", "userId": "dWr23Svz"}, {"displayName": "aCgmvog2", "namespace": "wG5JjCGg", "userId": "ShOyDEI5"}, {"displayName": "FmcY9JXR", "namespace": "lq41TIpi", "userId": "OGEFQRr1"}]}' \
    > test.out 2>&1
eval_tap $? 213 'AdminRemoveRoleManagersV3' test.out

#- 214 AdminGetRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleMembersV3 \
    --roleId 'KXaSgfp0' \
    --after 'YvI032J0' \
    --before 'kuKfa6Tn' \
    --limit '26' \
    > test.out 2>&1
eval_tap $? 214 'AdminGetRoleMembersV3' test.out

#- 215 AdminAddRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleMembersV3 \
    --roleId 'FfQhcWK7' \
    --body '{"members": [{"displayName": "0DiUghds", "namespace": "jlsWgAMv", "userId": "wzhjawCI"}, {"displayName": "Bfevzqrr", "namespace": "J1HuokzO", "userId": "ekAt2N5m"}, {"displayName": "CvlFnwo4", "namespace": "cB6FcI71", "userId": "SxtO2gKY"}]}' \
    > test.out 2>&1
eval_tap $? 215 'AdminAddRoleMembersV3' test.out

#- 216 AdminRemoveRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleMembersV3 \
    --roleId 'bMN79BHE' \
    --body '{"members": [{"displayName": "8TVVe4nB", "namespace": "qj8Ej2Gq", "userId": "4AknFnKs"}, {"displayName": "TJbYjCRi", "namespace": "rBINczU0", "userId": "0OCtMthh"}, {"displayName": "WZqJONKa", "namespace": "HAQztyKn", "userId": "XA2Yl9is"}]}' \
    > test.out 2>&1
eval_tap $? 216 'AdminRemoveRoleMembersV3' test.out

#- 217 AdminUpdateRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV3 \
    --roleId 'LMfCm3fk' \
    --body '{"permissions": [{"action": 20, "resource": "qtgX8664", "schedAction": 99, "schedCron": "lSIC4qj7", "schedRange": ["LzNgYvkw", "TmoGrYjF", "owiCGd0l"]}, {"action": 100, "resource": "hVbXSTc9", "schedAction": 62, "schedCron": "5OerWGAF", "schedRange": ["LNzRh2Ml", "brLJo719", "clTYDz4d"]}, {"action": 74, "resource": "TkZxEHRa", "schedAction": 27, "schedCron": "C315eNbb", "schedRange": ["PpAnaNNC", "YfdI4rcU", "GxzSnWfE"]}]}' \
    > test.out 2>&1
eval_tap $? 217 'AdminUpdateRolePermissionsV3' test.out

#- 218 AdminAddRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV3 \
    --roleId 'RGMs8C1X' \
    --body '{"permissions": [{"action": 100, "resource": "UHnvvRen", "schedAction": 19, "schedCron": "ZRsETRCM", "schedRange": ["dJxvq541", "4y2789ou", "BxGi9QH0"]}, {"action": 42, "resource": "QD5A0pNT", "schedAction": 25, "schedCron": "tAty9CEb", "schedRange": ["pATYIOvX", "b7RPzJBe", "aVFOTLYM"]}, {"action": 17, "resource": "nJyp2iwb", "schedAction": 1, "schedCron": "rs5Nxm9o", "schedRange": ["iaiv4URn", "uMAj1CyU", "BlK6lzrg"]}]}' \
    > test.out 2>&1
eval_tap $? 218 'AdminAddRolePermissionsV3' test.out

#- 219 AdminDeleteRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV3 \
    --roleId 'THw5dTlO' \
    --body '["FxEovNDv", "oMP5klxf", "twvIL4Z7"]' \
    > test.out 2>&1
eval_tap $? 219 'AdminDeleteRolePermissionsV3' test.out

#- 220 AdminDeleteRolePermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionV3 \
    --action '11' \
    --resource 'TAnfKgTt' \
    --roleId 'hjIXuAw0' \
    > test.out 2>&1
eval_tap $? 220 'AdminDeleteRolePermissionV3' test.out

#- 221 AdminGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam adminGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 221 'AdminGetMyUserV3' test.out

#- 222 UserAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam userAuthenticationV3 \
    --clientId 'mHsRkvEU' \
    --extendExp  \
    --redirectUri 'GBhHitaj' \
    --password 'zDsjqxFe' \
    --requestId 'QRPyFu0p' \
    --userName 'uWCMFJyG' \
    > test.out 2>&1
eval_tap $? 222 'UserAuthenticationV3' test.out

#- 223 AuthenticationWithPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV3 \
    --extendExp  \
    --clientId 'bckWzEh4' \
    --linkingToken 'kWBOECh6' \
    --password 'CH1c9tGQ' \
    --username 'gpooCJNo' \
    > test.out 2>&1
eval_tap $? 223 'AuthenticationWithPlatformLinkV3' test.out

#- 224 GenerateTokenByNewHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV3 \
    --additionalData 'EOAFDd9G' \
    --extendExp  \
    --linkingToken '0RYoo6Mv' \
    > test.out 2>&1
eval_tap $? 224 'GenerateTokenByNewHeadlessAccountV3' test.out

#- 225 RequestOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam requestOneTimeLinkingCodeV3 \
    --platformId 'faEww1Vk' \
    > test.out 2>&1
eval_tap $? 225 'RequestOneTimeLinkingCodeV3' test.out

#- 226 ValidateOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam validateOneTimeLinkingCodeV3 \
    --oneTimeLinkCode 'naf5GKtO' \
    > test.out 2>&1
eval_tap $? 226 'ValidateOneTimeLinkingCodeV3' test.out

#- 227 RequestTokenByOneTimeLinkCodeResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTokenByOneTimeLinkCodeResponseV3 \
    --additionalData 'ZloRc6Cl' \
    --isTransient  \
    --clientId 'p7PJNIG1' \
    --oneTimeLinkCode '2kgkvj4a' \
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
    --codeChallenge 'BpHzlIeg' \
    --codeChallengeMethod 'plain' \
    --clientId 'UAS8gB9u' \
    > test.out 2>&1
eval_tap $? 230 'RequestTokenExchangeCodeV3' test.out

#- 231 AdminRetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam adminRetrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'plAsikih' \
    --userId 'pT0L5oCY' \
    --platformUserId 'LJhYesJZ' \
    > test.out 2>&1
eval_tap $? 231 'AdminRetrieveUserThirdPartyPlatformTokenV3' test.out

#- 232 RevokeUserV3
./ng net.accelbyte.sdk.cli.Main iam revokeUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'sEhuwqPA' \
    --includeGameNamespace  \
    > test.out 2>&1
eval_tap $? 232 'RevokeUserV3' test.out

#- 233 AuthorizeV3
./ng net.accelbyte.sdk.cli.Main iam authorizeV3 \
    --codeChallenge 'YvtuNfb4' \
    --codeChallengeMethod 'plain' \
    --createHeadless  \
    --oneTimeLinkCode 'Xg1by2nr' \
    --redirectUri 'aXFDWH6L' \
    --scope 'S4yQ82MG' \
    --state 'F413lqdo' \
    --targetAuthPage '3QftC8Gm' \
    --useRedirectUriAsLoginUrlWhenLocked  \
    --clientId 'VpBVaDGi' \
    --responseType 'code' \
    > test.out 2>&1
eval_tap $? 233 'AuthorizeV3' test.out

#- 234 TokenIntrospectionV3
./ng net.accelbyte.sdk.cli.Main iam tokenIntrospectionV3 \
    --token 'zjLYZhBu' \
    > test.out 2>&1
eval_tap $? 234 'TokenIntrospectionV3' test.out

#- 235 GetJWKSV3
./ng net.accelbyte.sdk.cli.Main iam getJWKSV3 \
    > test.out 2>&1
eval_tap $? 235 'GetJWKSV3' test.out

#- 236 SendMFAAuthenticationCode
./ng net.accelbyte.sdk.cli.Main iam sendMFAAuthenticationCode \
    --clientId 'FvepkoKr' \
    --factor 'wTtGnmDy' \
    --mfaToken 'LN668zoC' \
    > test.out 2>&1
eval_tap $? 236 'SendMFAAuthenticationCode' test.out

#- 237 Change2faMethod
./ng net.accelbyte.sdk.cli.Main iam change2faMethod \
    --factor 'R1tlxXYf' \
    --mfaToken '1rnCddfA' \
    > test.out 2>&1
eval_tap $? 237 'Change2faMethod' test.out

#- 238 Verify2faCode
./ng net.accelbyte.sdk.cli.Main iam verify2faCode \
    --code 'ybs745ho' \
    --factor 'oZKjjmrD' \
    --mfaToken 'lqOqGUk2' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 238 'Verify2faCode' test.out

#- 239 RetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam retrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Cjlbgigz' \
    --userId '7X6oKeJ0' \
    > test.out 2>&1
eval_tap $? 239 'RetrieveUserThirdPartyPlatformTokenV3' test.out

#- 240 AuthCodeRequestV3
./ng net.accelbyte.sdk.cli.Main iam authCodeRequestV3 \
    --platformId 'LlNBYHS6' \
    --clientId 'pV0SawJw' \
    --redirectUri 'qazdYfmN' \
    --requestId 'UzmpdUQg' \
    > test.out 2>&1
eval_tap $? 240 'AuthCodeRequestV3' test.out

#- 241 PlatformTokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV3 \
    --platformId 'X03zYovt' \
    --additionalData 'Nh1AxT5a' \
    --clientId 'd3SASCyA' \
    --createHeadless  \
    --deviceId 'TMyJd3w3' \
    --macAddress 'G5bvs4ur' \
    --platformToken 'krutp73b' \
    --serviceLabel '0.49581891260432376' \
    --skipSetCookie  \
    > test.out 2>&1
eval_tap $? 241 'PlatformTokenGrantV3' test.out

#- 242 GetRevocationListV3
./ng net.accelbyte.sdk.cli.Main iam getRevocationListV3 \
    > test.out 2>&1
eval_tap $? 242 'GetRevocationListV3' test.out

#- 243 TokenRevocationV3
./ng net.accelbyte.sdk.cli.Main iam tokenRevocationV3 \
    --token 'tosZ677k' \
    > test.out 2>&1
eval_tap $? 243 'TokenRevocationV3' test.out

#- 244 SimultaneousLoginV3
./ng net.accelbyte.sdk.cli.Main iam simultaneousLoginV3 \
    --simultaneousPlatform 'b4re72lb' \
    --simultaneousTicket 't9NPsHlp' \
    --nativePlatform 'steam' \
    --nativePlatformTicket 'tW1lvxh2' \
    > test.out 2>&1
eval_tap $? 244 'SimultaneousLoginV3' test.out

#- 245 TokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV3 \
    --additionalData 'hm4D1yNC' \
    --clientId 'jD2MpDi8' \
    --clientSecret 'houFnuC0' \
    --code 'UtylaXVp' \
    --codeVerifier 'dk5vPeLC' \
    --extendNamespace 'DYyNzy6w' \
    --extendExp  \
    --password '94prr2an' \
    --redirectUri 'qfpvmNjI' \
    --refreshToken 'FMdTae3O' \
    --username 'mrbO2G3h' \
    --grantType 'urn:ietf:params:oauth:grant-type:extend_client_credentials' \
    > test.out 2>&1
eval_tap $? 245 'TokenGrantV3' test.out

#- 246 VerifyTokenV3
./ng net.accelbyte.sdk.cli.Main iam verifyTokenV3 \
    --token 'SyQdwRZL' \
    > test.out 2>&1
eval_tap $? 246 'VerifyTokenV3' test.out

#- 247 PlatformAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticationV3 \
    --platformId 'WIpa2WVB' \
    --code 'fF8rm6nq' \
    --error 'qqmSXJA2' \
    --openidAssocHandle '7l7yiadv' \
    --openidClaimedId 'kH8eVjgO' \
    --openidIdentity '6g5XaDm4' \
    --openidMode 'B4QW6wRI' \
    --openidNs 'CQsdBCsK' \
    --openidOpEndpoint 'w4QIUIAl' \
    --openidResponseNonce 'FNWynddQ' \
    --openidReturnTo 'h14DWIzZ' \
    --openidSig 'bSvmB6cj' \
    --openidSigned 'XuSObIQP' \
    --state 'AixRZyKe' \
    > test.out 2>&1
eval_tap $? 247 'PlatformAuthenticationV3' test.out

#- 248 PlatformTokenRefreshV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenRefreshV3 \
    --platformId '8ZKNBKnY' \
    --platformToken 'L2H43ryx' \
    > test.out 2>&1
eval_tap $? 248 'PlatformTokenRefreshV3' test.out

#- 249 PublicGetInputValidations
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidations \
    --defaultOnEmpty  \
    --languageCode 'dPe6CoKK' \
    > test.out 2>&1
eval_tap $? 249 'PublicGetInputValidations' test.out

#- 250 PublicGetInputValidationByField
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidationByField \
    --field 'Vj353Ja3' \
    > test.out 2>&1
eval_tap $? 250 'PublicGetInputValidationByField' test.out

#- 251 PublicGetCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam publicGetCountryAgeRestrictionV3 \
    --countryCode 'VVX4uUiU' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 251 'PublicGetCountryAgeRestrictionV3' test.out

#- 252 PublicGetConfigValueV3
./ng net.accelbyte.sdk.cli.Main iam publicGetConfigValueV3 \
    --configKey 'KMExUqpr' \
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
    --clientId 'd652fzue' \
    > test.out 2>&1
eval_tap $? 255 'RetrieveActiveOIDCClientsPublicV3' test.out

#- 256 PublicListUserIDByPlatformUserIDsV3
eval_tap 0 256 'PublicListUserIDByPlatformUserIDsV3 # SKIP deprecated' test.out

#- 257 PublicGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'qzNKxINO' \
    --platformUserId 'cJVHYb12' \
    > test.out 2>&1
eval_tap $? 257 'PublicGetUserByPlatformUserIDV3' test.out

#- 258 PublicGetAsyncStatus
./ng net.accelbyte.sdk.cli.Main iam publicGetAsyncStatus \
    --namespace "$AB_NAMESPACE" \
    --requestId '5LNS6Ro0' \
    > test.out 2>&1
eval_tap $? 258 'PublicGetAsyncStatus' test.out

#- 259 PublicSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam publicSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'vue0i1wx' \
    --limit '91' \
    --offset '21' \
    --platformBy 'YSqGovU6' \
    --platformId '4Qc5rpFE' \
    --query '1IkkqJne' \
    > test.out 2>&1
eval_tap $? 259 'PublicSearchUserV3' test.out

#- 260 PublicCreateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "V7qOA5mh", "acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "tttIY9SM", "policyId": "YZPqi1Bi", "policyVersionId": "kLLk9Rhu"}, {"isAccepted": true, "localizedPolicyVersionId": "YmpbxAX4", "policyId": "ceuLAcpB", "policyVersionId": "LyTQVPdi"}, {"isAccepted": true, "localizedPolicyVersionId": "nRvKWryQ", "policyId": "muknghdz", "policyVersionId": "p7tBJPYZ"}], "authType": "Iu2dj5i6", "code": "H7ktO7Xs", "country": "3DDC0Kef", "dateOfBirth": "kaPgyx7O", "displayName": "NJ583CKy", "emailAddress": "4sMpO4nL", "password": "4Go8wMbF", "reachMinimumAge": true, "uniqueDisplayName": "D05RqUm9"}' \
    > test.out 2>&1
eval_tap $? 260 'PublicCreateUserV3' test.out

#- 261 CheckUserAvailability
./ng net.accelbyte.sdk.cli.Main iam checkUserAvailability \
    --namespace "$AB_NAMESPACE" \
    --field 'AgAN9FW5' \
    --query 'LGmGEIPe' \
    > test.out 2>&1
eval_tap $? 261 'CheckUserAvailability' test.out

#- 262 PublicBulkGetUsers
./ng net.accelbyte.sdk.cli.Main iam publicBulkGetUsers \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["updnDDgn", "aAz7dnrD", "ucy00B4j"]}' \
    > test.out 2>&1
eval_tap $? 262 'PublicBulkGetUsers' test.out

#- 263 PublicSendRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicSendRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "er9EjeCE", "languageTag": "iRftgpsr"}' \
    > test.out 2>&1
eval_tap $? 263 'PublicSendRegistrationCode' test.out

#- 264 PublicVerifyRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicVerifyRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "dJymaP3a", "emailAddress": "wPqyYFzL"}' \
    > test.out 2>&1
eval_tap $? 264 'PublicVerifyRegistrationCode' test.out

#- 265 PublicForgotPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicForgotPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "fcS7uwIV", "languageTag": "uyECsOE8"}' \
    > test.out 2>&1
eval_tap $? 265 'PublicForgotPasswordV3' test.out

#- 266 PublicValidateUserInput
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserInput \
    --namespace "$AB_NAMESPACE" \
    --body '{"displayName": "kBXJSRrC", "uniqueDisplayName": "NYmKlkb7", "username": "PQVUrA8G"}' \
    > test.out 2>&1
eval_tap $? 266 'PublicValidateUserInput' test.out

#- 267 GetAdminInvitationV3
./ng net.accelbyte.sdk.cli.Main iam getAdminInvitationV3 \
    --invitationId 'S28Hz9EX' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 267 'GetAdminInvitationV3' test.out

#- 268 CreateUserFromInvitationV3
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV3 \
    --invitationId 'xQJV4vsx' \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "UJ4ZOkBP", "acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "SVrokTiw", "policyId": "BiBXRf39", "policyVersionId": "5bXwhAEp"}, {"isAccepted": false, "localizedPolicyVersionId": "ID25ghvt", "policyId": "00MXOE1R", "policyVersionId": "BNacIKUE"}, {"isAccepted": false, "localizedPolicyVersionId": "QGex7glx", "policyId": "1JLqkqaU", "policyVersionId": "lejNFwTX"}], "authType": "SwRl9mPu", "code": "QJ3qJIob", "country": "WDp4TDDk", "dateOfBirth": "4fpzQJuT", "displayName": "SA0iMp38", "emailAddress": "zLQ6vte9", "password": "YS3FTPuF", "reachMinimumAge": true, "uniqueDisplayName": "WKGg31tc"}' \
    > test.out 2>&1
eval_tap $? 268 'CreateUserFromInvitationV3' test.out

#- 269 UpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam updateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "kTAkL51R", "country": "wX1LSDBS", "dateOfBirth": "cjvZ8PUW", "displayName": "ayb4ND1d", "languageTag": "cIIHRgls", "uniqueDisplayName": "UUMdxpHy", "userName": "Lb83Fzec"}' \
    > test.out 2>&1
eval_tap $? 269 'UpdateUserV3' test.out

#- 270 PublicPartialUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicPartialUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "QmR2ifUA", "country": "OXPsvYox", "dateOfBirth": "8GyIVErB", "displayName": "EdISUibZ", "languageTag": "Zv1kWGlw", "uniqueDisplayName": "lGCJbpwm", "userName": "bxQtb49p"}' \
    > test.out 2>&1
eval_tap $? 270 'PublicPartialUpdateUserV3' test.out

#- 271 PublicSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"context": "VJDCT96V", "emailAddress": "nBMJflcT", "languageTag": "Hmdn1nf3"}' \
    > test.out 2>&1
eval_tap $? 271 'PublicSendVerificationCodeV3' test.out

#- 272 PublicUserVerificationV3
./ng net.accelbyte.sdk.cli.Main iam publicUserVerificationV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "wymgyjhM", "contactType": "v6ZMvcy9", "languageTag": "XfOV6AwA", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 272 'PublicUserVerificationV3' test.out

#- 273 PublicUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "qkSPvvwL", "country": "paztM9qj", "dateOfBirth": "oF2l429x", "displayName": "YM1snquy", "emailAddress": "nLnaGjlH", "password": "rdKGOpxh", "uniqueDisplayName": "dOSlbVM9", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 273 'PublicUpgradeHeadlessAccountV3' test.out

#- 274 PublicVerifyHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --needVerificationCode  \
    --body '{"emailAddress": "clcOts96", "password": "s08bmIge"}' \
    > test.out 2>&1
eval_tap $? 274 'PublicVerifyHeadlessAccountV3' test.out

#- 275 PublicUpdatePasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicUpdatePasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"languageTag": "vZY4iGRp", "mfaToken": "tKxfZr3u", "newPassword": "weiWqgk7", "oldPassword": "dljoPkUP"}' \
    > test.out 2>&1
eval_tap $? 275 'PublicUpdatePasswordV3' test.out

#- 276 PublicCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam publicCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'CZv1NwT7' \
    > test.out 2>&1
eval_tap $? 276 'PublicCreateJusticeUser' test.out

#- 277 PublicPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'zM0C9ka3' \
    --redirectUri 'u6Q2sab2' \
    --ticket 'G5PVf0dn' \
    > test.out 2>&1
eval_tap $? 277 'PublicPlatformLinkV3' test.out

#- 278 PublicPlatformUnlinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'HscO3M7o' \
    --body '{"platformNamespace": "Zksuu6zW"}' \
    > test.out 2>&1
eval_tap $? 278 'PublicPlatformUnlinkV3' test.out

#- 279 PublicPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'JNuIDNql' \
    > test.out 2>&1
eval_tap $? 279 'PublicPlatformUnlinkAllV3' test.out

#- 280 PublicForcePlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicForcePlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'K7ImJBBN' \
    --ticket 'bs3D5poI' \
    > test.out 2>&1
eval_tap $? 280 'PublicForcePlatformLinkV3' test.out

#- 281 PublicWebLinkPlatform
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatform \
    --namespace "$AB_NAMESPACE" \
    --platformId 'uRf9CqW9' \
    --clientId 'cbtDcsBF' \
    --redirectUri 'eV8Np3wC' \
    > test.out 2>&1
eval_tap $? 281 'PublicWebLinkPlatform' test.out

#- 282 PublicWebLinkPlatformEstablish
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatformEstablish \
    --namespace "$AB_NAMESPACE" \
    --platformId 'cIio8DGB' \
    --code '1d02pfW5' \
    --state '8wUZSplS' \
    > test.out 2>&1
eval_tap $? 282 'PublicWebLinkPlatformEstablish' test.out

#- 283 PublicProcessWebLinkPlatformV3
./ng net.accelbyte.sdk.cli.Main iam publicProcessWebLinkPlatformV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'SywmZcXm' \
    --code '2wirf9EX' \
    --state 'OsM0aK9q' \
    > test.out 2>&1
eval_tap $? 283 'PublicProcessWebLinkPlatformV3' test.out

#- 284 PublicGetUsersPlatformInfosV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUsersPlatformInfosV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"platformId": "nKLUsQj1", "userIds": ["YbZzRy58", "5XllDubv", "hPJt20M6"]}' \
    > test.out 2>&1
eval_tap $? 284 'PublicGetUsersPlatformInfosV3' test.out

#- 285 ResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam resetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "KR7bEFPR", "emailAddress": "J0TP2tBc", "newPassword": "kjJyjscQ"}' \
    > test.out 2>&1
eval_tap $? 285 'ResetPasswordV3' test.out

#- 286 PublicGetUserByUserIdV3
eval_tap 0 286 'PublicGetUserByUserIdV3 # SKIP deprecated' test.out

#- 287 PublicGetUserBanHistoryV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserBanHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '0Oq0F43O' \
    --activeOnly  \
    --after 'SkVNlpFK' \
    --before 'Y2Hlkev5' \
    --limit '23' \
    > test.out 2>&1
eval_tap $? 287 'PublicGetUserBanHistoryV3' test.out

#- 288 PublicListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'CFqTlbHM' \
    > test.out 2>&1
eval_tap $? 288 'PublicListUserAllPlatformAccountsDistinctV3' test.out

#- 289 PublicGetUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'lcY2O3M0' \
    > test.out 2>&1
eval_tap $? 289 'PublicGetUserInformationV3' test.out

#- 290 PublicGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'RvPs2oV9' \
    --after '0.6090562582194563' \
    --before '0.681725075496134' \
    --limit '34' \
    > test.out 2>&1
eval_tap $? 290 'PublicGetUserLoginHistoriesV3' test.out

#- 291 PublicGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'z80f2QVQ' \
    --after 'mli2OW2c' \
    --before 'QMU084c6' \
    --limit '70' \
    --platformId 'TgQYH10m' \
    > test.out 2>&1
eval_tap $? 291 'PublicGetUserPlatformAccountsV3' test.out

#- 292 PublicListJusticePlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicListJusticePlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'VHILWLXU' \
    > test.out 2>&1
eval_tap $? 292 'PublicListJusticePlatformAccountsV3' test.out

#- 293 PublicLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam publicLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'g6A4Tzvo' \
    --body '{"platformId": "xqslWTfW", "platformUserId": "AAo59Nwq"}' \
    > test.out 2>&1
eval_tap $? 293 'PublicLinkPlatformAccount' test.out

#- 294 PublicForceLinkPlatformWithProgression
./ng net.accelbyte.sdk.cli.Main iam publicForceLinkPlatformWithProgression \
    --namespace "$AB_NAMESPACE" \
    --userId '51ArmxjC' \
    --body '{"chosenNamespaces": ["Zon684yP", "WyfJPvOO", "OsLzlEHL"], "requestId": "713iKPLa"}' \
    > test.out 2>&1
eval_tap $? 294 'PublicForceLinkPlatformWithProgression' test.out

#- 295 PublicGetPublisherUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetPublisherUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'vSiElRKe' \
    > test.out 2>&1
eval_tap $? 295 'PublicGetPublisherUserV3' test.out

#- 296 PublicValidateUserByUserIDAndPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserByUserIDAndPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'vioEr471' \
    --password 'WenhlhSX' \
    > test.out 2>&1
eval_tap $? 296 'PublicValidateUserByUserIDAndPasswordV3' test.out

#- 297 PublicGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRolesV3 \
    --after '5Ng4VU9p' \
    --before 'I7Vxr8aF' \
    --isWildcard  \
    --limit '88' \
    > test.out 2>&1
eval_tap $? 297 'PublicGetRolesV3' test.out

#- 298 PublicGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRoleV3 \
    --roleId 'pdaO1p7l' \
    > test.out 2>&1
eval_tap $? 298 'PublicGetRoleV3' test.out

#- 299 PublicGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyUserV3 \
    --includeAllPlatforms  \
    > test.out 2>&1
eval_tap $? 299 'PublicGetMyUserV3' test.out

#- 300 PublicGetLinkHeadlessAccountToMyAccountConflictV3
./ng net.accelbyte.sdk.cli.Main iam publicGetLinkHeadlessAccountToMyAccountConflictV3 \
    --oneTimeLinkCode 'RrhrBGnT' \
    > test.out 2>&1
eval_tap $? 300 'PublicGetLinkHeadlessAccountToMyAccountConflictV3' test.out

#- 301 LinkHeadlessAccountToMyAccountV3
./ng net.accelbyte.sdk.cli.Main iam linkHeadlessAccountToMyAccountV3 \
    --body '{"chosenNamespaces": ["BOBTi7ry", "nbaMJ9Gm", "jHG0LpBg"], "oneTimeLinkCode": "koFDwba0"}' \
    > test.out 2>&1
eval_tap $? 301 'LinkHeadlessAccountToMyAccountV3' test.out

#- 302 PublicSendVerificationLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationLinkV3 \
    --body '{"languageTag": "FEK12GWS"}' \
    > test.out 2>&1
eval_tap $? 302 'PublicSendVerificationLinkV3' test.out

#- 303 PublicVerifyUserByLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyUserByLinkV3 \
    --code 'Tzh4VNrt' \
    > test.out 2>&1
eval_tap $? 303 'PublicVerifyUserByLinkV3' test.out

#- 304 PlatformAuthenticateSAMLV3Handler
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticateSAMLV3Handler \
    --platformId 'MASGKc31' \
    --code 'j2VjuZEK' \
    --error 'DZYhXqeh' \
    --state '04Xi8z2O' \
    > test.out 2>&1
eval_tap $? 304 'PlatformAuthenticateSAMLV3Handler' test.out

#- 305 LoginSSOClient
./ng net.accelbyte.sdk.cli.Main iam loginSSOClient \
    --platformId 'RVoYMVT7' \
    --payload 'MvsbBtop' \
    > test.out 2>&1
eval_tap $? 305 'LoginSSOClient' test.out

#- 306 LogoutSSOClient
./ng net.accelbyte.sdk.cli.Main iam logoutSSOClient \
    --platformId 'w3yGxLDn' \
    > test.out 2>&1
eval_tap $? 306 'LogoutSSOClient' test.out

#- 307 RequestTargetTokenResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTargetTokenResponseV3 \
    --additionalData 'stXb40ak' \
    --code 'NXiuUxYC' \
    > test.out 2>&1
eval_tap $? 307 'RequestTargetTokenResponseV3' test.out

#- 308 AdminListInvitationHistoriesV4
./ng net.accelbyte.sdk.cli.Main iam adminListInvitationHistoriesV4 \
    --limit '1' \
    --namespace "$AB_NAMESPACE" \
    --offset '77' \
    > test.out 2>&1
eval_tap $? 308 'AdminListInvitationHistoriesV4' test.out

#- 309 AdminGetDevicesByUserV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDevicesByUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'WNPkngkE' \
    > test.out 2>&1
eval_tap $? 309 'AdminGetDevicesByUserV4' test.out

#- 310 AdminGetBannedDevicesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedDevicesV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceType 'IrTHFTku' \
    --endDate 'DOJphbrb' \
    --limit '89' \
    --offset '34' \
    --startDate 'kulgzZpp' \
    > test.out 2>&1
eval_tap $? 310 'AdminGetBannedDevicesV4' test.out

#- 311 AdminGetUserDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeviceBansV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'UuHgMsyj' \
    > test.out 2>&1
eval_tap $? 311 'AdminGetUserDeviceBansV4' test.out

#- 312 AdminBanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminBanDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"comment": "kbpcGquH", "deviceId": "JNDJJ9ay", "deviceType": "tJHvz2fL", "enabled": true, "endDate": "PfZgRVVf", "ext": {"KxxCrzfn": {}, "aB6skLwx": {}, "EJyOHP9Q": {}}, "reason": "ILgL9fQD"}' \
    > test.out 2>&1
eval_tap $? 312 'AdminBanDeviceV4' test.out

#- 313 AdminGetDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBanV4 \
    --banId '5uQsAiPK' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 313 'AdminGetDeviceBanV4' test.out

#- 314 AdminUpdateDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateDeviceBanV4 \
    --banId 'CI6fBE1t' \
    --namespace "$AB_NAMESPACE" \
    --body '{"enabled": false}' \
    > test.out 2>&1
eval_tap $? 314 'AdminUpdateDeviceBanV4' test.out

#- 315 AdminGenerateReportV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateReportV4 \
    --namespace "$AB_NAMESPACE" \
    --endDate 'eL1G2qWB' \
    --startDate '4VGvAUWm' \
    --deviceType 'v3Cmje5o' \
    > test.out 2>&1
eval_tap $? 315 'AdminGenerateReportV4' test.out

#- 316 AdminGetDeviceTypesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceTypesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 316 'AdminGetDeviceTypesV4' test.out

#- 317 AdminGetDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBansV4 \
    --deviceId '14Ey9ueC' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 317 'AdminGetDeviceBansV4' test.out

#- 318 AdminDecryptDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminDecryptDeviceV4 \
    --deviceId 'vMkGLlQN' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 318 'AdminDecryptDeviceV4' test.out

#- 319 AdminUnbanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminUnbanDeviceV4 \
    --deviceId '3ZSZS5Pk' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 319 'AdminUnbanDeviceV4' test.out

#- 320 AdminGetUsersByDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUsersByDeviceV4 \
    --deviceId 'RvvUEQdz' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 320 'AdminGetUsersByDeviceV4' test.out

#- 321 AdminGetNamespaceInvitationHistoryV4
./ng net.accelbyte.sdk.cli.Main iam adminGetNamespaceInvitationHistoryV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 321 'AdminGetNamespaceInvitationHistoryV4' test.out

#- 322 AdminGetNamespaceUserInvitationHistoryV4
./ng net.accelbyte.sdk.cli.Main iam adminGetNamespaceUserInvitationHistoryV4 \
    --namespace "$AB_NAMESPACE" \
    --limit '25' \
    --offset '79' \
    > test.out 2>&1
eval_tap $? 322 'AdminGetNamespaceUserInvitationHistoryV4' test.out

#- 323 AdminCreateTestUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateTestUsersV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 67}' \
    > test.out 2>&1
eval_tap $? 323 'AdminCreateTestUsersV4' test.out

#- 324 AdminCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "PBZxB7FN", "policyId": "t6KCUDZb", "policyVersionId": "FTzdNiLe"}, {"isAccepted": false, "localizedPolicyVersionId": "lhXxSUzC", "policyId": "ZpWCGdj3", "policyVersionId": "eCyhiXAY"}, {"isAccepted": true, "localizedPolicyVersionId": "KszYARdQ", "policyId": "uMGzzGZJ", "policyVersionId": "ogkJtTY9"}], "authType": "EMAILPASSWD", "code": "Xb2NDgT0", "country": "jzR5XTQR", "dateOfBirth": "IYqCmQWz", "displayName": "BJP0sOUw", "emailAddress": "KGroDJqE", "password": "XkzmKLdo", "passwordMD5Sum": "225izKyM", "reachMinimumAge": true, "uniqueDisplayName": "Hs8vTt7V", "username": "mlDzctPE"}' \
    > test.out 2>&1
eval_tap $? 324 'AdminCreateUserV4' test.out

#- 325 AdminBulkUpdateUserAccountTypeV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateUserAccountTypeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"testAccount": true, "userIds": ["U6NfmPpn", "uIXNNsNS", "W6gUZlPi"]}' \
    > test.out 2>&1
eval_tap $? 325 'AdminBulkUpdateUserAccountTypeV4' test.out

#- 326 AdminBulkCheckValidUserIDV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkCheckValidUserIDV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["iDZ8a943", "4AsTWtry", "Sg6ZI69X"]}' \
    > test.out 2>&1
eval_tap $? 326 'AdminBulkCheckValidUserIDV4' test.out

#- 327 AdminUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ubN5yzuj' \
    --body '{"avatarUrl": "MoB5DYjy", "country": "NsXTWoRS", "dateOfBirth": "qFINp1cn", "displayName": "CokSp0Id", "languageTag": "u2hqYrnl", "skipLoginQueue": true, "uniqueDisplayName": "BOA9vE5a", "userName": "bPT7CnqL"}' \
    > test.out 2>&1
eval_tap $? 327 'AdminUpdateUserV4' test.out

#- 328 AdminUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'zLdX2oR6' \
    --body '{"code": "r8sVEalW", "emailAddress": "Dt6sKAJd"}' \
    > test.out 2>&1
eval_tap $? 328 'AdminUpdateUserEmailAddressV4' test.out

#- 329 AdminDisableUserMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableUserMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'dSLeyAOp' \
    > test.out 2>&1
eval_tap $? 329 'AdminDisableUserMFAV4' test.out

#- 330 AdminListUserRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminListUserRolesV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'o25jqZ7w' \
    > test.out 2>&1
eval_tap $? 330 'AdminListUserRolesV4' test.out

#- 331 AdminUpdateUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '4Agv2l73' \
    --body '{"assignedNamespaces": ["a1UwB6ip", "7YMTbEnW", "l6TCvtEM"], "roleId": "eRWgw173"}' \
    > test.out 2>&1
eval_tap $? 331 'AdminUpdateUserRoleV4' test.out

#- 332 AdminAddUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'cldGZCiL' \
    --body '{"assignedNamespaces": ["g8uQ897e", "9WNIG7bi", "f0CvpRzQ"], "roleId": "jkfk5KGl"}' \
    > test.out 2>&1
eval_tap $? 332 'AdminAddUserRoleV4' test.out

#- 333 AdminRemoveUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRemoveUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'SaP1zlc8' \
    --body '{"assignedNamespaces": ["VDjigtyN", "kdcjvQ9o", "9bk9hIiW"], "roleId": "OiG6hugl"}' \
    > test.out 2>&1
eval_tap $? 333 'AdminRemoveUserRoleV4' test.out

#- 334 AdminGetRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV4 \
    --adminRole  \
    --isWildcard  \
    --limit '21' \
    --offset '2' \
    > test.out 2>&1
eval_tap $? 334 'AdminGetRolesV4' test.out

#- 335 AdminCreateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV4 \
    --body '{"adminRole": false, "deletable": false, "isWildcard": true, "roleName": "SmNqqu2G"}' \
    > test.out 2>&1
eval_tap $? 335 'AdminCreateRoleV4' test.out

#- 336 AdminGetRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV4 \
    --roleId 'BrAyXK7a' \
    > test.out 2>&1
eval_tap $? 336 'AdminGetRoleV4' test.out

#- 337 AdminDeleteRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV4 \
    --roleId 'XUO5s8qU' \
    > test.out 2>&1
eval_tap $? 337 'AdminDeleteRoleV4' test.out

#- 338 AdminUpdateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV4 \
    --roleId 'kP7jVIZf' \
    --body '{"adminRole": false, "deletable": false, "isWildcard": false, "roleName": "fI4CQXoD"}' \
    > test.out 2>&1
eval_tap $? 338 'AdminUpdateRoleV4' test.out

#- 339 AdminUpdateRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV4 \
    --roleId 'NZtGfcXo' \
    --body '{"permissions": [{"action": 45, "resource": "G33SXExc", "schedAction": 54, "schedCron": "wkSKNl6P", "schedRange": ["fmS5Fo10", "Nd2vsY0s", "uHtIBCrQ"]}, {"action": 28, "resource": "iiuHtH1K", "schedAction": 72, "schedCron": "IpUiSI1z", "schedRange": ["gRIn8tdA", "nEag7cm3", "8Ak3gJZS"]}, {"action": 62, "resource": "WPzSSz8s", "schedAction": 24, "schedCron": "MuuBeUKs", "schedRange": ["BETfKib9", "oHTb3puy", "KVxxcGEV"]}]}' \
    > test.out 2>&1
eval_tap $? 339 'AdminUpdateRolePermissionsV4' test.out

#- 340 AdminAddRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV4 \
    --roleId 'X0QBu3Er' \
    --body '{"permissions": [{"action": 69, "resource": "ubiOoR5v", "schedAction": 25, "schedCron": "BA2LyYrD", "schedRange": ["LWwreTL3", "HSl9vHhE", "0OKCnWEJ"]}, {"action": 24, "resource": "jinBOung", "schedAction": 38, "schedCron": "gL504Qfr", "schedRange": ["QqWKVNtM", "AVX4Ekg7", "0ye1XlMk"]}, {"action": 5, "resource": "Drbq8ogv", "schedAction": 15, "schedCron": "17MPyqxh", "schedRange": ["ommZ1IZ6", "2kBTLJ2F", "uUhYVtmk"]}]}' \
    > test.out 2>&1
eval_tap $? 340 'AdminAddRolePermissionsV4' test.out

#- 341 AdminDeleteRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV4 \
    --roleId 'FsG2IiVt' \
    --body '["b7dQ6BKm", "3WjDjN5W", "OLfnYMUT"]' \
    > test.out 2>&1
eval_tap $? 341 'AdminDeleteRolePermissionsV4' test.out

#- 342 AdminListAssignedUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminListAssignedUsersV4 \
    --roleId 'wKc9LUo2' \
    --after 'UjAkZ9hw' \
    --before 'UtmIRy5U' \
    --limit '18' \
    > test.out 2>&1
eval_tap $? 342 'AdminListAssignedUsersV4' test.out

#- 343 AdminAssignUserToRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAssignUserToRoleV4 \
    --roleId 'NaPzrAwE' \
    --body '{"assignedNamespaces": ["ycTA6L0o", "CncK7SnG", "mgUcitaZ"], "namespace": "WhXsHa9M", "userId": "sZs4pf18"}' \
    > test.out 2>&1
eval_tap $? 343 'AdminAssignUserToRoleV4' test.out

#- 344 AdminRevokeUserFromRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRevokeUserFromRoleV4 \
    --roleId '5phKsWir' \
    --body '{"namespace": "Vd4GhftW", "userId": "4khXUK4Q"}' \
    > test.out 2>&1
eval_tap $? 344 'AdminRevokeUserFromRoleV4' test.out

#- 345 AdminInviteUserNewV4
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserNewV4 \
    --body '{"assignedNamespaces": ["ujKLeDtf", "XG00Dcuv", "40syzt1s"], "emailAddresses": ["UJ35kRqX", "GLaW6kXA", "eT30utq2"], "isAdmin": true, "isNewStudio": false, "languageTag": "4fledhFU", "namespace": "B6bkABUT", "roleId": "ubsdODtr"}' \
    > test.out 2>&1
eval_tap $? 345 'AdminInviteUserNewV4' test.out

#- 346 AdminUpdateMyUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateMyUserV4 \
    --body '{"avatarUrl": "BA25r5ee", "country": "WkiPHudz", "dateOfBirth": "8wMTQM8C", "displayName": "ugE98kKn", "languageTag": "URNCg1OV", "skipLoginQueue": true, "uniqueDisplayName": "bireIoQK", "userName": "ndN243sT"}' \
    > test.out 2>&1
eval_tap $? 346 'AdminUpdateMyUserV4' test.out

#- 347 AdminDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyAuthenticatorV4 \
    --body '{"mfaToken": "3xGKTQOM"}' \
    > test.out 2>&1
eval_tap $? 347 'AdminDisableMyAuthenticatorV4' test.out

#- 348 AdminEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyAuthenticatorV4 \
    --code 'RluUVqAn' \
    > test.out 2>&1
eval_tap $? 348 'AdminEnableMyAuthenticatorV4' test.out

#- 349 AdminGenerateMyAuthenticatorKeyV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateMyAuthenticatorKeyV4 \
    > test.out 2>&1
eval_tap $? 349 'AdminGenerateMyAuthenticatorKeyV4' test.out

#- 350 AdminGetMyBackupCodesV4
eval_tap 0 350 'AdminGetMyBackupCodesV4 # SKIP deprecated' test.out

#- 351 AdminGenerateMyBackupCodesV4
eval_tap 0 351 'AdminGenerateMyBackupCodesV4 # SKIP deprecated' test.out

#- 352 AdminDisableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyBackupCodesV4 \
    --body '{"mfaToken": "yfP52mLe"}' \
    > test.out 2>&1
eval_tap $? 352 'AdminDisableMyBackupCodesV4' test.out

#- 353 AdminDownloadMyBackupCodesV4
eval_tap 0 353 'AdminDownloadMyBackupCodesV4 # SKIP deprecated' test.out

#- 354 AdminEnableMyBackupCodesV4
eval_tap 0 354 'AdminEnableMyBackupCodesV4 # SKIP deprecated' test.out

#- 355 AdminGetBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBackupCodesV4 \
    --languageTag 'qLd6Sski' \
    > test.out 2>&1
eval_tap $? 355 'AdminGetBackupCodesV4' test.out

#- 356 AdminGenerateBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateBackupCodesV4 \
    --languageTag 'makbPLkW' \
    > test.out 2>&1
eval_tap $? 356 'AdminGenerateBackupCodesV4' test.out

#- 357 AdminEnableBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableBackupCodesV4 \
    --languageTag 'mETHVsTU' \
    > test.out 2>&1
eval_tap $? 357 'AdminEnableBackupCodesV4' test.out

#- 358 AdminChallengeMyMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminChallengeMyMFAV4 \
    --code 'jkqZsBkC' \
    --factor 'JEERl7jy' \
    > test.out 2>&1
eval_tap $? 358 'AdminChallengeMyMFAV4' test.out

#- 359 AdminSendMyMFAEmailCodeV4
./ng net.accelbyte.sdk.cli.Main iam adminSendMyMFAEmailCodeV4 \
    --action 'OrkAJGcd' \
    > test.out 2>&1
eval_tap $? 359 'AdminSendMyMFAEmailCodeV4' test.out

#- 360 AdminDisableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyEmailV4 \
    --body '{"mfaToken": "S0zdKWg1"}' \
    > test.out 2>&1
eval_tap $? 360 'AdminDisableMyEmailV4' test.out

#- 361 AdminEnableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyEmailV4 \
    --code 'b15XAWKK' \
    > test.out 2>&1
eval_tap $? 361 'AdminEnableMyEmailV4' test.out

#- 362 AdminGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyEnabledFactorsV4 \
    > test.out 2>&1
eval_tap $? 362 'AdminGetMyEnabledFactorsV4' test.out

#- 363 AdminMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam adminMakeFactorMyDefaultV4 \
    --factor 'lA3HQESY' \
    > test.out 2>&1
eval_tap $? 363 'AdminMakeFactorMyDefaultV4' test.out

#- 364 AdminGetMyMFAStatusV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyMFAStatusV4 \
    > test.out 2>&1
eval_tap $? 364 'AdminGetMyMFAStatusV4' test.out

#- 365 AdminInviteUserV4
eval_tap 0 365 'AdminInviteUserV4 # SKIP deprecated' test.out

#- 366 AuthenticationWithPlatformLinkV4
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV4 \
    --extendExp  \
    --clientId 'nZrVCbta' \
    --linkingToken 'IMZ2fYyo' \
    --password 'wFYngEC0' \
    --username 'DjNsvr3n' \
    > test.out 2>&1
eval_tap $? 366 'AuthenticationWithPlatformLinkV4' test.out

#- 367 GenerateTokenByNewHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV4 \
    --additionalData '5f0LHjzu' \
    --extendExp  \
    --linkingToken '07Y6f9rq' \
    > test.out 2>&1
eval_tap $? 367 'GenerateTokenByNewHeadlessAccountV4' test.out

#- 368 Verify2faCodeV4
./ng net.accelbyte.sdk.cli.Main iam verify2faCodeV4 \
    --code 'jlfhR2xP' \
    --factor 'JZJMuirg' \
    --mfaToken 'xPYmJIfj' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 368 'Verify2faCodeV4' test.out

#- 369 PlatformTokenGrantV4
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV4 \
    --platformId 'CFXzS8iA' \
    --codeChallenge 'g8W1WL5s' \
    --codeChallengeMethod 'S256' \
    --additionalData 'Y4Bkt0X9' \
    --clientId '7Av0CHtI' \
    --createHeadless  \
    --deviceId 'wmtgCWzz' \
    --macAddress 'AGL7K2bB' \
    --platformToken 'UAQQ8xAT' \
    --serviceLabel '0.8776729352007537' \
    --skipSetCookie  \
    > test.out 2>&1
eval_tap $? 369 'PlatformTokenGrantV4' test.out

#- 370 SimultaneousLoginV4
./ng net.accelbyte.sdk.cli.Main iam simultaneousLoginV4 \
    --codeChallenge 'mr7pHvyx' \
    --codeChallengeMethod 'plain' \
    --simultaneousPlatform 'I9MN4s6A' \
    --simultaneousTicket 'VGWRFKIa' \
    --nativePlatform 'epicgames' \
    --nativePlatformTicket 'hKIfKfLU' \
    > test.out 2>&1
eval_tap $? 370 'SimultaneousLoginV4' test.out

#- 371 TokenGrantV4
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV4 \
    --codeChallenge 'LuFAYSs6' \
    --codeChallengeMethod 'plain' \
    --additionalData 'VMN7SF1K' \
    --clientId 'OYTvwyY3' \
    --clientSecret 'oXNF0VSB' \
    --code 'zygneQTZ' \
    --codeVerifier 'JOh4MlQJ' \
    --extendNamespace 'qeFYrj9t' \
    --extendExp  \
    --loginQueueTicket 'j2WyShW1' \
    --password 'MMGFPSfc' \
    --redirectUri 'wmfftFJl' \
    --refreshToken 'FTQIMKix' \
    --username '0SnrcRlH' \
    --grantType 'authorization_code' \
    > test.out 2>&1
eval_tap $? 371 'TokenGrantV4' test.out

#- 372 RequestTargetTokenResponseV4
./ng net.accelbyte.sdk.cli.Main iam requestTargetTokenResponseV4 \
    --additionalData 'KKZVw625' \
    --code 'F58RcAJR' \
    > test.out 2>&1
eval_tap $? 372 'RequestTargetTokenResponseV4' test.out

#- 373 PublicListUserIDByPlatformUserIDsV4
./ng net.accelbyte.sdk.cli.Main iam publicListUserIDByPlatformUserIDsV4 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'WBduyqI2' \
    --rawPUID  \
    --body '{"platformUserIds": ["xE8L6X1G", "CTGxB431", "wNa9NG1u"]}' \
    > test.out 2>&1
eval_tap $? 373 'PublicListUserIDByPlatformUserIDsV4' test.out

#- 374 PublicCreateTestUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateTestUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "2br819l2", "policyId": "Nt44FUzQ", "policyVersionId": "dmsV8K1q"}, {"isAccepted": false, "localizedPolicyVersionId": "i7Om9Q9u", "policyId": "27A8QnDE", "policyVersionId": "j8iskK5Y"}, {"isAccepted": false, "localizedPolicyVersionId": "CdGf2wbY", "policyId": "ccCtuW8O", "policyVersionId": "27CenF6v"}], "authType": "EMAILPASSWD", "country": "hjqZdv8g", "dateOfBirth": "cVE6g0wB", "displayName": "hzkCw1Pd", "emailAddress": "3lX5Ko9j", "password": "QIfPvvgz", "passwordMD5Sum": "U4DoUoUV", "uniqueDisplayName": "kODIaRUt", "username": "gsuyuo9a", "verified": true}' \
    > test.out 2>&1
eval_tap $? 374 'PublicCreateTestUserV4' test.out

#- 375 PublicCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "iKzbswHd", "policyId": "fe0FHnu3", "policyVersionId": "AviZDkkZ"}, {"isAccepted": false, "localizedPolicyVersionId": "KY8cuZR8", "policyId": "OTDkenp4", "policyVersionId": "55lRIzzQ"}, {"isAccepted": true, "localizedPolicyVersionId": "aITM6Tsl", "policyId": "8ul8WM6v", "policyVersionId": "plMdOn15"}], "authType": "EMAILPASSWD", "code": "bwJYdDWM", "country": "YVo3V0R0", "dateOfBirth": "36YhSsvI", "displayName": "YnQK8ntR", "emailAddress": "16pWI566", "password": "kVFAqfBh", "passwordMD5Sum": "Gf6yGv1L", "reachMinimumAge": true, "uniqueDisplayName": "rL4pjxK6", "username": "JQ5bMhQg"}' \
    > test.out 2>&1
eval_tap $? 375 'PublicCreateUserV4' test.out

#- 376 CreateUserFromInvitationV4
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV4 \
    --invitationId 'YQQuLthe' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "fcaXu5Ov", "policyId": "9eJnm7wf", "policyVersionId": "7KP56uAx"}, {"isAccepted": false, "localizedPolicyVersionId": "XxBSrcNg", "policyId": "RfH9gF6j", "policyVersionId": "3RVyr3aO"}, {"isAccepted": false, "localizedPolicyVersionId": "VScbZcuI", "policyId": "WelsPAnL", "policyVersionId": "svoMl2rH"}], "authType": "EMAILPASSWD", "code": "EwG7o1O1", "country": "I4wd4Chb", "dateOfBirth": "80VSKSR7", "displayName": "7vPdWEIY", "emailAddress": "jX9UXZRD", "password": "gzRZjiWX", "passwordMD5Sum": "eNeNZ6Jd", "reachMinimumAge": true, "uniqueDisplayName": "sm7SaHee", "username": "c3R1wV6y"}' \
    > test.out 2>&1
eval_tap $? 376 'CreateUserFromInvitationV4' test.out

#- 377 PublicUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "gQ2hFfA1", "country": "x7ZJkdRD", "dateOfBirth": "oE6AXiuG", "displayName": "YjIVqOtm", "languageTag": "PJeWqGgf", "uniqueDisplayName": "Gi9YIbvY", "userName": "iqJ8Yz5L"}' \
    > test.out 2>&1
eval_tap $? 377 'PublicUpdateUserV4' test.out

#- 378 PublicUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "KnRz1VwP", "emailAddress": "BsE9ObTs"}' \
    > test.out 2>&1
eval_tap $? 378 'PublicUpdateUserEmailAddressV4' test.out

#- 379 PublicUpgradeHeadlessAccountWithVerificationCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountWithVerificationCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "kv9Ur5aB", "country": "I2QCAeFK", "dateOfBirth": "eELRervr", "displayName": "T7a3j3MC", "emailAddress": "skcayswq", "password": "tUnmdpml", "reachMinimumAge": true, "uniqueDisplayName": "HMy8ekqu", "username": "7RvRohAD", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 379 'PublicUpgradeHeadlessAccountWithVerificationCodeV4' test.out

#- 380 PublicUpgradeHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "vay9r124", "password": "fWe5wXUU", "username": "GlO8z3Fz"}' \
    > test.out 2>&1
eval_tap $? 380 'PublicUpgradeHeadlessAccountV4' test.out

#- 381 PublicDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"mfaToken": "HK3lZ6wK"}' \
    > test.out 2>&1
eval_tap $? 381 'PublicDisableMyAuthenticatorV4' test.out

#- 382 PublicEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'yFESqp4o' \
    > test.out 2>&1
eval_tap $? 382 'PublicEnableMyAuthenticatorV4' test.out

#- 383 PublicGenerateMyAuthenticatorKeyV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateMyAuthenticatorKeyV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 383 'PublicGenerateMyAuthenticatorKeyV4' test.out

#- 384 PublicGetMyBackupCodesV4
eval_tap 0 384 'PublicGetMyBackupCodesV4 # SKIP deprecated' test.out

#- 385 PublicGenerateMyBackupCodesV4
eval_tap 0 385 'PublicGenerateMyBackupCodesV4 # SKIP deprecated' test.out

#- 386 PublicDisableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"mfaToken": "4YSNROpV"}' \
    > test.out 2>&1
eval_tap $? 386 'PublicDisableMyBackupCodesV4' test.out

#- 387 PublicDownloadMyBackupCodesV4
eval_tap 0 387 'PublicDownloadMyBackupCodesV4 # SKIP deprecated' test.out

#- 388 PublicEnableMyBackupCodesV4
eval_tap 0 388 'PublicEnableMyBackupCodesV4 # SKIP deprecated' test.out

#- 389 PublicGetBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGetBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --languageTag 'rSjaGk7L' \
    > test.out 2>&1
eval_tap $? 389 'PublicGetBackupCodesV4' test.out

#- 390 PublicGenerateBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --languageTag 'Q6zzcpEG' \
    > test.out 2>&1
eval_tap $? 390 'PublicGenerateBackupCodesV4' test.out

#- 391 PublicEnableBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 391 'PublicEnableBackupCodesV4' test.out

#- 392 PublicChallengeMyMFAV4
./ng net.accelbyte.sdk.cli.Main iam publicChallengeMyMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'gsQYKoLK' \
    --factor 'LuGvtMe2' \
    > test.out 2>&1
eval_tap $? 392 'PublicChallengeMyMFAV4' test.out

#- 393 PublicRemoveTrustedDeviceV4
./ng net.accelbyte.sdk.cli.Main iam publicRemoveTrustedDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceToken '8Zs2tsFK' \
    > test.out 2>&1
eval_tap $? 393 'PublicRemoveTrustedDeviceV4' test.out

#- 394 PublicSendMyMFAEmailCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicSendMyMFAEmailCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --action 'Q09kpUyS' \
    > test.out 2>&1
eval_tap $? 394 'PublicSendMyMFAEmailCodeV4' test.out

#- 395 PublicDisableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyEmailV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"mfaToken": "wBjd7MI0"}' \
    > test.out 2>&1
eval_tap $? 395 'PublicDisableMyEmailV4' test.out

#- 396 PublicEnableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyEmailV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'qk7so23s' \
    > test.out 2>&1
eval_tap $? 396 'PublicEnableMyEmailV4' test.out

#- 397 PublicGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam publicGetMyEnabledFactorsV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 397 'PublicGetMyEnabledFactorsV4' test.out

#- 398 PublicMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam publicMakeFactorMyDefaultV4 \
    --namespace "$AB_NAMESPACE" \
    --factor 'T1ZMgPbI' \
    > test.out 2>&1
eval_tap $? 398 'PublicMakeFactorMyDefaultV4' test.out

#- 399 PublicGetMyMFAStatusV4
./ng net.accelbyte.sdk.cli.Main iam publicGetMyMFAStatusV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 399 'PublicGetMyMFAStatusV4' test.out

#- 400 PublicGetUserPublicInfoByUserIdV4
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPublicInfoByUserIdV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '0ydbFI8W' \
    > test.out 2>&1
eval_tap $? 400 'PublicGetUserPublicInfoByUserIdV4' test.out

#- 401 PublicInviteUserV4
./ng net.accelbyte.sdk.cli.Main iam publicInviteUserV4 \
    --body '{"additionalData": "E6gzyxXL", "emailAddress": "Brg2hpBP", "languageTag": "4pcWFUJM", "namespace": "00bffOPF", "namespaceDisplayName": "eR3bI5cm"}' \
    > test.out 2>&1
eval_tap $? 401 'PublicInviteUserV4' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
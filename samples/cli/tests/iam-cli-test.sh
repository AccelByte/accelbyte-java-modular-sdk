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
    --body '{"modules": [{"docLink": "BPea6ybe", "groups": [{"group": "MY4EUI7A", "groupId": "oSuKksWh", "permissions": [{"allowedActions": [69, 30, 94], "resource": "57GgM9d0"}, {"allowedActions": [69, 96, 46], "resource": "mztDMyTu"}, {"allowedActions": [19, 65, 18], "resource": "E9h6wOCq"}]}, {"group": "T0kPIr6p", "groupId": "bA5iKffb", "permissions": [{"allowedActions": [60, 61, 91], "resource": "hAUJF0EP"}, {"allowedActions": [87, 13, 74], "resource": "7vZLIKMx"}, {"allowedActions": [52, 82, 68], "resource": "MQZwPeOT"}]}, {"group": "MtsMNV0o", "groupId": "nvF9JyVc", "permissions": [{"allowedActions": [77, 5, 11], "resource": "VbCweXAm"}, {"allowedActions": [45, 91, 55], "resource": "PLOxtO3D"}, {"allowedActions": [72, 44, 80], "resource": "QBluhkkO"}]}], "module": "7gOhszgw", "moduleId": "AjsWGX7w"}, {"docLink": "mQFGsBJv", "groups": [{"group": "WM0cVYJh", "groupId": "2opAzVlI", "permissions": [{"allowedActions": [71, 99, 43], "resource": "YG0SaCdi"}, {"allowedActions": [63, 53, 26], "resource": "1Is6BNTW"}, {"allowedActions": [75, 31, 79], "resource": "YC6aJPTX"}]}, {"group": "BebN9Gwh", "groupId": "sH1dPTNs", "permissions": [{"allowedActions": [41, 57, 15], "resource": "WVIj2UGA"}, {"allowedActions": [48, 26, 2], "resource": "uMBHPh2U"}, {"allowedActions": [62, 23, 39], "resource": "RsXJfMKl"}]}, {"group": "52WHFJpr", "groupId": "ypAakVPy", "permissions": [{"allowedActions": [20, 96, 75], "resource": "GPCtBest"}, {"allowedActions": [44, 81, 55], "resource": "uC920VQj"}, {"allowedActions": [3, 73, 82], "resource": "MGk5AKUv"}]}], "module": "qIulvSn3", "moduleId": "EbziFccs"}, {"docLink": "rMj9MQNE", "groups": [{"group": "oExqadi7", "groupId": "orgVu2AN", "permissions": [{"allowedActions": [18, 68, 0], "resource": "fNIh61Vs"}, {"allowedActions": [10, 55, 84], "resource": "ogKqOdce"}, {"allowedActions": [5, 65, 25], "resource": "YGhRfr8N"}]}, {"group": "UCx9Q6I7", "groupId": "CPflOcdM", "permissions": [{"allowedActions": [74, 22, 47], "resource": "DMjpDlgf"}, {"allowedActions": [45, 42, 52], "resource": "cXT9wIog"}, {"allowedActions": [50, 48, 7], "resource": "LZoI0VVl"}]}, {"group": "lUmgxbH7", "groupId": "YyxHaBwX", "permissions": [{"allowedActions": [3, 28, 86], "resource": "iz8XRUWV"}, {"allowedActions": [12, 13, 36], "resource": "OlbCsA9G"}, {"allowedActions": [41, 62, 37], "resource": "hYufnlBS"}]}], "module": "vux80l3T", "moduleId": "jBsvtzpp"}]}' \
    > test.out 2>&1
eval_tap $? 109 'AdminUpdateAvailablePermissionsByModule' test.out

#- 110 AdminDeleteConfigPermissionsByGroup
./ng net.accelbyte.sdk.cli.Main iam adminDeleteConfigPermissionsByGroup \
    --forceDelete  \
    --body '{"groupId": "CoxiZQug", "moduleId": "sQliKPqj"}' \
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
    --body '[{"field": "Dozgdj34", "validation": {"allowAllSpecialCharacters": true, "allowDigit": false, "allowLetter": false, "allowSpace": false, "allowUnicode": false, "avatarConfig": {"allowedPrefixes": ["1ZaXW6iF", "bzW45Sy3", "ED5JH9RR"], "preferRegex": true, "regex": "tR0kn1BK"}, "blockedWord": ["2YPZtnET", "iAnyeCvP", "0l499sm0"], "description": [{"language": "L14nqMVy", "message": ["tJy6DY0S", "qepZWmgy", "dk6cO0ck"]}, {"language": "lH4i8e5H", "message": ["lt6OXn3N", "nG7sFyQv", "0rQDg9wr"]}, {"language": "pzPnKxk4", "message": ["neiZ7D6r", "RONN3Ux4", "2lx117xc"]}], "isCustomRegex": true, "letterCase": "aauZYRgV", "maxLength": 34, "maxRepeatingAlphaNum": 19, "maxRepeatingSpecialCharacter": 4, "minCharType": 72, "minLength": 20, "profanityFilter": "Waiu0h4h", "regex": "MLkD6NdI", "specialCharacterLocation": "RKFEnpwN", "specialCharacters": ["IOQz7ho2", "sT3AuDQ5", "A4Pg1uTF"]}}, {"field": "HNs82GAh", "validation": {"allowAllSpecialCharacters": true, "allowDigit": false, "allowLetter": false, "allowSpace": false, "allowUnicode": false, "avatarConfig": {"allowedPrefixes": ["fKlo67T8", "xemwqQqX", "it3kDwVK"], "preferRegex": true, "regex": "cHHEk4PU"}, "blockedWord": ["uArfHWZt", "f23RXSdc", "nCY0oSBN"], "description": [{"language": "IyZwemtW", "message": ["Wp0EDUfr", "0vPvLGcS", "szUjfkPE"]}, {"language": "1U6Z0uwv", "message": ["j4haJbQt", "OfdwjcEM", "pJE9Umnx"]}, {"language": "O1OUFlFB", "message": ["RxYj6XEG", "BC284AdS", "uwt4iTkO"]}], "isCustomRegex": false, "letterCase": "C1aKoPt4", "maxLength": 61, "maxRepeatingAlphaNum": 96, "maxRepeatingSpecialCharacter": 41, "minCharType": 23, "minLength": 86, "profanityFilter": "l96HcG5l", "regex": "VT8HtGUk", "specialCharacterLocation": "8sQ43Tg6", "specialCharacters": ["wbVRjKaD", "k31k7N9B", "fy98eeQa"]}}, {"field": "aRlkC5Wx", "validation": {"allowAllSpecialCharacters": true, "allowDigit": true, "allowLetter": true, "allowSpace": false, "allowUnicode": false, "avatarConfig": {"allowedPrefixes": ["Uh6Ngo49", "8tRdGn99", "JYUWPwcM"], "preferRegex": true, "regex": "0bKadrNC"}, "blockedWord": ["kThFRiRG", "QWo7jslr", "eqcsR7nd"], "description": [{"language": "EV8QkCpo", "message": ["n0zR1v3f", "03P5EQsP", "qIYClj26"]}, {"language": "eIU5WYKA", "message": ["3yY9StT0", "iYS8kH1e", "NdlN353J"]}, {"language": "Yk0y8rH6", "message": ["EdMxz3GI", "nLEwImQ8", "Pb8kqsum"]}], "isCustomRegex": false, "letterCase": "xyVuJeTq", "maxLength": 66, "maxRepeatingAlphaNum": 8, "maxRepeatingSpecialCharacter": 16, "minCharType": 54, "minLength": 58, "profanityFilter": "gzdf3vU9", "regex": "lkPV8yl9", "specialCharacterLocation": "LTWsJxH1", "specialCharacters": ["dHa6mpas", "Y9kY7AFO", "ThFUsiFq"]}}]' \
    > test.out 2>&1
eval_tap $? 113 'AdminUpdateInputValidations' test.out

#- 114 AdminResetInputValidations
./ng net.accelbyte.sdk.cli.Main iam adminResetInputValidations \
    --field 'fjTh5EMr' \
    > test.out 2>&1
eval_tap $? 114 'AdminResetInputValidations' test.out

#- 115 ListAdminsV3
./ng net.accelbyte.sdk.cli.Main iam listAdminsV3 \
    --namespace "$AB_NAMESPACE" \
    --after 'yxKQB6cz' \
    --before 'jWAcEj5C' \
    --endDate 'DZgvTHpw' \
    --limit '23' \
    --query 'Pa3eVRXG' \
    --roleId 'snX17mCo' \
    --startDate 'uWN4TuOc' \
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
    --body '{"ageRestriction": 32, "enable": true}' \
    > test.out 2>&1
eval_tap $? 117 'AdminUpdateAgeRestrictionConfigV3' test.out

#- 118 AdminGetListCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminGetListCountryAgeRestrictionV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 118 'AdminGetListCountryAgeRestrictionV3' test.out

#- 119 AdminUpdateCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateCountryAgeRestrictionV3 \
    --countryCode 'Rbd0yTn4' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ageRestriction": 10}' \
    > test.out 2>&1
eval_tap $? 119 'AdminUpdateCountryAgeRestrictionV3' test.out

#- 120 AdminGetBannedUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType 'Fo5kasLm' \
    --limit '13' \
    --offset '61' \
    > test.out 2>&1
eval_tap $? 120 'AdminGetBannedUsersV3' test.out

#- 121 AdminBanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"ban": "WZ0oenrv", "comment": "lIrkimcz", "endDate": "qn0oXvKv", "reason": "89nonvFd", "skipNotif": true, "userIds": ["EP83nkYH", "LIeS4BQe", "M3lSAUNp"]}' \
    > test.out 2>&1
eval_tap $? 121 'AdminBanUserBulkV3' test.out

#- 122 AdminUnbanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminUnbanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"bans": [{"banId": "nBuj9wBS", "userId": "1oxOK8ed"}, {"banId": "gW96EblV", "userId": "d9sjtHxZ"}, {"banId": "wUm1Jy17", "userId": "YEEvFFqp"}]}' \
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
    --clientId 'hPl0Btch' \
    --clientName '8WlCLIpr' \
    --clientType 'SQeUaaPB' \
    --limit '33' \
    --offset '14' \
    --skipLoginQueue  \
    > test.out 2>&1
eval_tap $? 124 'AdminGetClientsByNamespaceV3' test.out

#- 125 AdminBulkUpdateClientsV3
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateClientsV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientIds": ["O5gQfndK", "2GEyFAme", "uQf6Tv9Y"], "clientUpdateRequest": {"audiences": ["sGL49VAE", "iJLr5q8l", "Aqx7UmVN"], "baseUri": "3nkNvTMQ", "clientName": "9FyKnlie", "clientPermissions": [{"action": 98, "resource": "wuKegjAe", "schedAction": 18, "schedCron": "TYeLCsCw", "schedRange": ["My9jjzVL", "6LF7n6xo", "EqwWSwL4"]}, {"action": 65, "resource": "4CpogBxg", "schedAction": 12, "schedCron": "bgFSwRYO", "schedRange": ["zrZBNPhi", "m8lp23O2", "LZ65gCCx"]}, {"action": 87, "resource": "ApwktYFb", "schedAction": 54, "schedCron": "f5mwZrm4", "schedRange": ["IQkC5svJ", "EgSU9Nap", "21GCKg4Y"]}], "clientPlatform": "lIAH1rsE", "deletable": true, "description": "wbTwNVY0", "modulePermissions": [{"moduleId": "ceSs8Mud", "selectedGroups": [{"groupId": "DTVOOgfM", "selectedActions": [5, 77, 54]}, {"groupId": "iL8pCuS3", "selectedActions": [53, 18, 23]}, {"groupId": "ukYrKxWH", "selectedActions": [41, 88, 82]}]}, {"moduleId": "LPKNkNeR", "selectedGroups": [{"groupId": "ipoFDogZ", "selectedActions": [80, 64, 94]}, {"groupId": "QEZaug50", "selectedActions": [11, 99, 24]}, {"groupId": "1p1WEb9H", "selectedActions": [30, 70, 27]}]}, {"moduleId": "8IEhzS6r", "selectedGroups": [{"groupId": "SOjmBG9Y", "selectedActions": [49, 30, 67]}, {"groupId": "Mi8f3EXw", "selectedActions": [51, 41, 95]}, {"groupId": "2y6SFhXv", "selectedActions": [4, 14, 63]}]}], "namespace": "op7qWTaf", "oauthAccessTokenExpiration": 24, "oauthAccessTokenExpirationTimeUnit": "fWX14I3t", "oauthRefreshTokenExpiration": 15, "oauthRefreshTokenExpirationTimeUnit": "FAXzyW7N", "redirectUri": "KwekDLa8", "scopes": ["1ZZiCr5V", "jX0Pbvtm", "OYyaDQWH"], "skipLoginQueue": true, "twoFactorEnabled": false}}' \
    > test.out 2>&1
eval_tap $? 125 'AdminBulkUpdateClientsV3' test.out

#- 126 AdminCreateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateClientV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["VqVOWKy9", "LnrKVdZx", "8vQ29lM0"], "baseUri": "9DTKSPBe", "clientId": "Atj7bcis", "clientName": "d3u532DU", "clientPermissions": [{"action": 82, "resource": "lpQ1vbC3", "schedAction": 34, "schedCron": "IC3n8zgV", "schedRange": ["AdzGfbVp", "llluCVbU", "GYrmQ5xp"]}, {"action": 65, "resource": "gT0O3UoL", "schedAction": 7, "schedCron": "PB2XCw9I", "schedRange": ["MO5VSrsd", "BLvVfeE0", "bOOv5fiQ"]}, {"action": 86, "resource": "Mt4zQR0b", "schedAction": 94, "schedCron": "WNbLFVmh", "schedRange": ["IWZ0Uw3c", "ssdjoIRo", "wYXqIkBu"]}], "clientPlatform": "8UOiwBGX", "deletable": true, "description": "ns4Fb9XP", "modulePermissions": [{"moduleId": "n5YY8VFb", "selectedGroups": [{"groupId": "tP2WKhtv", "selectedActions": [98, 17, 4]}, {"groupId": "1zag43P4", "selectedActions": [0, 1, 57]}, {"groupId": "15mFZhPr", "selectedActions": [61, 59, 89]}]}, {"moduleId": "pY35CBJB", "selectedGroups": [{"groupId": "cjsTq9xW", "selectedActions": [54, 82, 54]}, {"groupId": "B6Z4bRlm", "selectedActions": [54, 49, 57]}, {"groupId": "NY1eQyG0", "selectedActions": [93, 3, 36]}]}, {"moduleId": "gQypBUeU", "selectedGroups": [{"groupId": "4nytnRuM", "selectedActions": [53, 44, 48]}, {"groupId": "kV5EcKQE", "selectedActions": [68, 38, 71]}, {"groupId": "s2ezc8yO", "selectedActions": [77, 10, 96]}]}], "namespace": "gZqnxCnt", "oauthAccessTokenExpiration": 55, "oauthAccessTokenExpirationTimeUnit": "pwiEiZWo", "oauthClientType": "BEuW9XHn", "oauthRefreshTokenExpiration": 18, "oauthRefreshTokenExpirationTimeUnit": "C9BGJOYK", "parentNamespace": "qVerAE4l", "redirectUri": "e564vnDu", "scopes": ["zlzB58a9", "EYkbK0Cd", "ld5bCLYG"], "secret": "uuBo6DPc", "skipLoginQueue": true, "twoFactorEnabled": false}' \
    > test.out 2>&1
eval_tap $? 126 'AdminCreateClientV3' test.out

#- 127 AdminGetClientsbyNamespacebyIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetClientsbyNamespacebyIDV3 \
    --clientId 'U64UTGid' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 127 'AdminGetClientsbyNamespacebyIDV3' test.out

#- 128 AdminDeleteClientV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientV3 \
    --clientId 'IbmyUMK0' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 128 'AdminDeleteClientV3' test.out

#- 129 AdminUpdateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientV3 \
    --clientId 'rZFm9Iml' \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["WD4BzH8s", "Q50z7Upd", "fkMZJlaE"], "baseUri": "adqLLCHi", "clientName": "0WDPa5HD", "clientPermissions": [{"action": 81, "resource": "NFskV525", "schedAction": 76, "schedCron": "Yt1SO0y9", "schedRange": ["lk1BzRzG", "sgfNvWcj", "uKvseuX3"]}, {"action": 81, "resource": "U8ZopfJi", "schedAction": 69, "schedCron": "mU1ug0Zs", "schedRange": ["Q5D37SXj", "N6qE3qFK", "kopMFMET"]}, {"action": 89, "resource": "siIAd92R", "schedAction": 3, "schedCron": "dsP7GBgm", "schedRange": ["r11CvaBc", "jFNizv32", "I0zExALH"]}], "clientPlatform": "hXCW1Qf8", "deletable": false, "description": "X8ywj4YZ", "modulePermissions": [{"moduleId": "czPRqxV9", "selectedGroups": [{"groupId": "iNu6gIlA", "selectedActions": [17, 39, 21]}, {"groupId": "gxCOHEUd", "selectedActions": [39, 82, 1]}, {"groupId": "DrHFZA15", "selectedActions": [93, 29, 64]}]}, {"moduleId": "yn8WXotQ", "selectedGroups": [{"groupId": "voZQBjNi", "selectedActions": [52, 20, 52]}, {"groupId": "qwtiUX8w", "selectedActions": [3, 47, 40]}, {"groupId": "EIRSbCfi", "selectedActions": [5, 99, 86]}]}, {"moduleId": "aqPdwm2y", "selectedGroups": [{"groupId": "J9YhsBxM", "selectedActions": [20, 91, 28]}, {"groupId": "1uELIpJH", "selectedActions": [3, 4, 4]}, {"groupId": "SYrwkAHH", "selectedActions": [8, 5, 63]}]}], "namespace": "mVbdc6Og", "oauthAccessTokenExpiration": 18, "oauthAccessTokenExpirationTimeUnit": "xW5gYg4e", "oauthRefreshTokenExpiration": 36, "oauthRefreshTokenExpirationTimeUnit": "vAC5uiyX", "redirectUri": "2dltpptX", "scopes": ["ubVxfyr3", "fIlYsCEW", "F92SsI1R"], "skipLoginQueue": false, "twoFactorEnabled": true}' \
    > test.out 2>&1
eval_tap $? 129 'AdminUpdateClientV3' test.out

#- 130 AdminUpdateClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientPermissionV3 \
    --clientId 'MJFBpt1J' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 19, "resource": "ma0bkJz4"}, {"action": 48, "resource": "UU9v8Vgx"}, {"action": 11, "resource": "Plf1JCfL"}]}' \
    > test.out 2>&1
eval_tap $? 130 'AdminUpdateClientPermissionV3' test.out

#- 131 AdminAddClientPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddClientPermissionsV3 \
    --clientId 'jHYffsQ8' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 64, "resource": "5anybBec"}, {"action": 19, "resource": "pvKEqZYB"}, {"action": 21, "resource": "IUDXDEeN"}]}' \
    > test.out 2>&1
eval_tap $? 131 'AdminAddClientPermissionsV3' test.out

#- 132 AdminDeleteClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientPermissionV3 \
    --action '37' \
    --clientId 'sVrR0PO4' \
    --namespace "$AB_NAMESPACE" \
    --resource 'Ei8YYPJT' \
    > test.out 2>&1
eval_tap $? 132 'AdminDeleteClientPermissionV3' test.out

#- 133 AdminGetConfigValueV3
./ng net.accelbyte.sdk.cli.Main iam adminGetConfigValueV3 \
    --configKey 'EAb2AZGV' \
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
    --body '{"blacklist": ["bXKLXRxZ", "vRu1NRJo", "NW0Pzf8a"]}' \
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
    --body '{"active": false, "roleIds": ["gIZFfpTZ", "PdkB5V6G", "QuvPSMpI"]}' \
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
    --limit '43' \
    --offset '95' \
    > test.out 2>&1
eval_tap $? 141 'RetrieveAllSSOLoginPlatformCredentialV3' test.out

#- 142 RetrieveThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '7ZSVnMV4' \
    > test.out 2>&1
eval_tap $? 142 'RetrieveThirdPartyLoginPlatformCredentialV3' test.out

#- 143 AddThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam addThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'lyO81Jtm' \
    --body '{"ACSURL": "J4LzNFT1", "AWSCognitoRegion": "bRNLePPc", "AWSCognitoUserPool": "1KJOk0r2", "AllowedClients": ["mqb2TbyE", "FwQYrKdl", "ZKdMONNR"], "AppId": "g6gv75a3", "AuthorizationEndpoint": "HTokm4xX", "ClientId": "QHXZdMJj", "EmptyStrFieldList": ["GiirklHF", "4KNX3nZb", "WLjYL3TB"], "EnableServerLicenseValidation": false, "Environment": "oloCc9E5", "FederationMetadataURL": "P1hVnEea", "GenericOauthFlow": true, "IncludePUID": false, "IsActive": false, "Issuer": "BF9YF4HP", "JWKSEndpoint": "zdKoM4vX", "KeyID": "PGjO0d9d", "LogoURL": "Dgy7InH2", "NetflixCertificates": {"encryptedPrivateKey": "1sor3r3i", "encryptedPrivateKeyName": "HXlrO3Oc", "publicCertificate": "i16HPpsq", "publicCertificateName": "IGHZvlPl", "rootCertificate": "31uq1WsQ", "rootCertificateName": "BldgRpcF"}, "OrganizationId": "Drl4yLL1", "PlatformName": "wZ72wBbx", "PrivateKey": "xxZm5gZs", "RedirectUri": "krpONWf6", "RegisteredDomains": [{"affectedClientIDs": ["eZjQjmOo", "OJUlDsGg", "hBOqZQuV"], "domain": "SrxchAb6", "namespaces": ["48knTbQL", "lrpyFS4G", "9J7CCsCD"], "roleId": "OLyxP4d8", "ssoCfg": {"googleKey": {"4WxloZuG": {}, "voHhuXbj": {}, "lwQXpiBO": {}}, "groupConfigs": [{"assignNamespaces": ["uVGp4CXt", "xrYO6vfV", "iLtzzXmj"], "group": "YgSqdqaC", "roleId": "i604fnse"}, {"assignNamespaces": ["P5HMEe4A", "7EKzwMVX", "mBO65bYJ"], "group": "xc9B4IXd", "roleId": "d6YXy0dF"}, {"assignNamespaces": ["DUI2CdxK", "OYk95zEF", "8vgI5tjo"], "group": "i6QYhGKy", "roleId": "AVZrv1s1"}]}}, {"affectedClientIDs": ["GEBujkwI", "43OEW7tj", "hZeNkYfs"], "domain": "DCiKY0pd", "namespaces": ["QuLxJnDA", "3O0HbN9T", "fRh2RSyj"], "roleId": "ehIlBmac", "ssoCfg": {"googleKey": {"G5VH32U1": {}, "7Ft1dvNm": {}, "D5VGNC57": {}}, "groupConfigs": [{"assignNamespaces": ["dMOiWCkq", "MXgWxvKI", "YKwe4QqU"], "group": "BLxdMZ2S", "roleId": "FqnIPMOa"}, {"assignNamespaces": ["9M0EgNdZ", "qdhCWcmy", "Xi8gGzkI"], "group": "SvgyDY2l", "roleId": "1s8rpA38"}, {"assignNamespaces": ["OqPX2UQF", "qvyhhUq1", "SbHI1CWB"], "group": "Ae8mYrZA", "roleId": "JT6Ws2AL"}]}}, {"affectedClientIDs": ["a1a8TbNB", "Gty6Y8lU", "h4kPg2BF"], "domain": "ueDH1UOj", "namespaces": ["YIoDg4A2", "NAnOcx7v", "wXkBsRHu"], "roleId": "o9vzruke", "ssoCfg": {"googleKey": {"oCua9lwy": {}, "sQN5Edda": {}, "y9Skgs02": {}}, "groupConfigs": [{"assignNamespaces": ["1xEPNs0O", "l3Gu1uOt", "WetbTUiM"], "group": "hKToXfKB", "roleId": "pROvqBW1"}, {"assignNamespaces": ["ScxygK4B", "AZT0oNdM", "R7RjbEg4"], "group": "RUEuHTTg", "roleId": "vbgdYEfJ"}, {"assignNamespaces": ["Z2vLtY2B", "0FtOAooN", "wyARQHZD"], "group": "g8fRJzFZ", "roleId": "vOJ4FNa3"}]}}], "RelyingParty": "QZ63NW2h", "SandboxId": "6UewiKZY", "Secret": "vsRdKU1l", "TeamID": "TDHsqrDi", "TokenAuthenticationType": "38hUY06K", "TokenClaimsMapping": {"h6HzuQKp": "HQudaxDX", "yN6VODmb": "qCtQkoVR", "UrfkWkBG": "R4QR2VZU"}, "TokenEndpoint": "9AjK5JWY", "UserInfoEndpoint": "yTEL5lsj", "UserInfoHTTPMethod": "DmsC3FDL", "googleAdminConsoleKey": "tDO9sZJw", "scopes": ["2LXMKXfu", "NGS2U83v", "htQLHia0"]}' \
    > test.out 2>&1
eval_tap $? 143 'AddThirdPartyLoginPlatformCredentialV3' test.out

#- 144 DeleteThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'tPKdDfty' \
    > test.out 2>&1
eval_tap $? 144 'DeleteThirdPartyLoginPlatformCredentialV3' test.out

#- 145 UpdateThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '5aGxz12H' \
    --body '{"ACSURL": "NUiRQlMM", "AWSCognitoRegion": "V3YYvONn", "AWSCognitoUserPool": "hjYHIHcK", "AllowedClients": ["rcg36pFj", "NT72C2Vn", "xzvfGg8F"], "AppId": "2fyykUB7", "AuthorizationEndpoint": "xwwwXXsL", "ClientId": "kfPZ1CO0", "EmptyStrFieldList": ["m8NG6ZM7", "E0bSvKSZ", "kdwBlNKA"], "EnableServerLicenseValidation": false, "Environment": "Xga8LDlJ", "FederationMetadataURL": "bNiuqyDt", "GenericOauthFlow": true, "IncludePUID": true, "IsActive": false, "Issuer": "0V70tNnE", "JWKSEndpoint": "k0ASpsvJ", "KeyID": "VEvvZRYj", "LogoURL": "pyHgqPDJ", "NetflixCertificates": {"encryptedPrivateKey": "52aZpr9V", "encryptedPrivateKeyName": "QTTT8iSV", "publicCertificate": "czzNu4Nb", "publicCertificateName": "gY6WxZLH", "rootCertificate": "p3lhumnA", "rootCertificateName": "MiLhKVyz"}, "OrganizationId": "vLSc6qOd", "PlatformName": "f2ZMQzG0", "PrivateKey": "deH2GcUe", "RedirectUri": "UF1pHKFl", "RegisteredDomains": [{"affectedClientIDs": ["6wOQQPsq", "97nGQY2w", "JYlMLyhp"], "domain": "st5StlaY", "namespaces": ["GHcPrMgy", "Pp6lNJLN", "ObhQrYdr"], "roleId": "PQxaYucJ", "ssoCfg": {"googleKey": {"Bjve1T0I": {}, "Mi8ZVuv6": {}, "hwV1zXpH": {}}, "groupConfigs": [{"assignNamespaces": ["c2FhRXUd", "umh5ZhDs", "tZ9fif0J"], "group": "VhllDjJa", "roleId": "EYXJk062"}, {"assignNamespaces": ["VSJDSBEJ", "KMLWFZAa", "PFchx3GP"], "group": "lKx3vfN8", "roleId": "Tr3uSJhd"}, {"assignNamespaces": ["8s3MaJLg", "MwwSSYBh", "RB0vTAsr"], "group": "jpma6sLv", "roleId": "WAvmANFg"}]}}, {"affectedClientIDs": ["Jyly1KXi", "FlCPWw2e", "lltqDRDy"], "domain": "uCev6l1H", "namespaces": ["kjqI22Pa", "Xmd6sQXE", "fbnzvNpr"], "roleId": "OoAoCQka", "ssoCfg": {"googleKey": {"LbtXHcDL": {}, "HUF03ASg": {}, "EXFAVzBQ": {}}, "groupConfigs": [{"assignNamespaces": ["eqYGB3St", "IVvHDyK1", "xWxsVrsO"], "group": "fCNVaWW7", "roleId": "NlKpKQb2"}, {"assignNamespaces": ["dsDdE0Jm", "GwyJikGw", "K6vRrcSp"], "group": "sXqbm0PA", "roleId": "TG7VeQYv"}, {"assignNamespaces": ["8jhrGBRV", "ydGJytiq", "d89IeO06"], "group": "u3FKmhGn", "roleId": "86s7qKZM"}]}}, {"affectedClientIDs": ["CSyVGslm", "X7qSdo5u", "WSQkNvsT"], "domain": "MdLwxGZK", "namespaces": ["SQGvv3HD", "ejG0r3DA", "iANFMe7q"], "roleId": "Rx5mQPXZ", "ssoCfg": {"googleKey": {"1PjArnLH": {}, "tdcICuC4": {}, "tlTARzMY": {}}, "groupConfigs": [{"assignNamespaces": ["qBHKP9VB", "hMXUalru", "9s3hUkSp"], "group": "GzhWTQPO", "roleId": "4QHnMfur"}, {"assignNamespaces": ["xbrq10mw", "mHYgcKr0", "d1GXAHWy"], "group": "04MhJ17K", "roleId": "puORWgJg"}, {"assignNamespaces": ["rDx6uGjc", "dFzXsO8X", "F0KUhWKq"], "group": "dtU0uo18", "roleId": "jOTlaEjy"}]}}], "RelyingParty": "jegyDXr1", "SandboxId": "y1vNUIMe", "Secret": "Vvf6NosK", "TeamID": "sPyR1cES", "TokenAuthenticationType": "cmFhmoGn", "TokenClaimsMapping": {"hX901I8w": "jGBawoEb", "YciCe1LJ": "of6RaPmN", "eQp70E4N": "RXaACgvM"}, "TokenEndpoint": "tk92NWQz", "UserInfoEndpoint": "12LX72a3", "UserInfoHTTPMethod": "uGZQtLMI", "googleAdminConsoleKey": "PQEI9KW2", "scopes": ["VK4Xr9xk", "8QCUAFu1", "k48rmVPE"]}' \
    > test.out 2>&1
eval_tap $? 145 'UpdateThirdPartyLoginPlatformCredentialV3' test.out

#- 146 UpdateThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'x5HDDiwP' \
    --body '{"affectedClientIDs": ["cbc1gnmc", "sJ9qohRJ", "BGIOkefT"], "assignedNamespaces": ["OtL4u6rL", "96q6YZqQ", "VryKzlRj"], "domain": "wIuwcpLl", "roleId": "FqVJoLgq", "ssoCfg": {"googleKey": {"bZcAsofm": {}, "akwAg02N": {}, "v4J2o0x8": {}}, "groupConfigs": [{"assignNamespaces": ["aFusUkP2", "wnB9jb9c", "hCv0HOuh"], "group": "1yCQEfPR", "roleId": "ct5RAlvH"}, {"assignNamespaces": ["P0WA94lD", "5PlE6wPV", "ZtNUCOQm"], "group": "RMS50yQX", "roleId": "m1rDqkZl"}, {"assignNamespaces": ["el8NKsiN", "QcZb9pE4", "jssNYUKm"], "group": "n0Aa0gh6", "roleId": "teaUIW0L"}]}}' \
    > test.out 2>&1
eval_tap $? 146 'UpdateThirdPartyLoginPlatformDomainV3' test.out

#- 147 DeleteThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'HRjjY55I' \
    --body '{"domain": "ZflRl9et", "ssoGroups": ["qgKvVVwF", "uH5zOKqX", "hg6m79aO"]}' \
    > test.out 2>&1
eval_tap $? 147 'DeleteThirdPartyLoginPlatformDomainV3' test.out

#- 148 PartialUpdateThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam partialUpdateThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'FdQxWd2z' \
    --body '{"affectedClientIDs": ["nZRUsHxF", "n1MeLiPo", "YVTDf4nN"], "assignedNamespaces": ["FoLCzXz2", "Nnuht5J2", "3SHsDpPa"], "domain": "SsTyPy48", "roleId": "14HzR0os", "ssoCfg": {"googleKey": {"1MQMLIIY": {}, "CF3I5UIC": {}, "RmnTc0lN": {}}, "groupConfigs": [{"assignNamespaces": ["yUt5fF2F", "82ryKvlr", "N4ejot0W"], "group": "DwpaMkgE", "roleId": "A4GoDexx"}, {"assignNamespaces": ["EL5FghmH", "jH6mKz07", "6KxXlGZA"], "group": "TLg9oCLT", "roleId": "WIBCp2dT"}, {"assignNamespaces": ["tWiQUgxi", "WIShtjKs", "Zl5YNi7t"], "group": "RufExDAW", "roleId": "Z0eXeCuo"}]}}' \
    > test.out 2>&1
eval_tap $? 148 'PartialUpdateThirdPartyLoginPlatformDomainV3' test.out

#- 149 RetrieveSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam retrieveSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId '4jnhnzpu' \
    > test.out 2>&1
eval_tap $? 149 'RetrieveSSOLoginPlatformCredential' test.out

#- 150 AddSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam addSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'qZBkRVvr' \
    --body '{"acsUrl": "JEljwmyz", "apiKey": "1jKf5E6C", "appId": "e5SukDlx", "federationMetadataUrl": "UVGXbilT", "isActive": true, "redirectUri": "aCYs8nhP", "secret": "M6HfIkDz", "ssoUrl": "erHSv38r"}' \
    > test.out 2>&1
eval_tap $? 150 'AddSSOLoginPlatformCredential' test.out

#- 151 DeleteSSOLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteSSOLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'rmDMGTUL' \
    > test.out 2>&1
eval_tap $? 151 'DeleteSSOLoginPlatformCredentialV3' test.out

#- 152 UpdateSSOPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam updateSSOPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'vC0HDZV9' \
    --body '{"acsUrl": "ZCdrJxxn", "apiKey": "brXEUqtS", "appId": "BPj6VNxT", "federationMetadataUrl": "jjXAd5mx", "isActive": true, "redirectUri": "PDiRwNTb", "secret": "WBBGuZqG", "ssoUrl": "SCKZsLz6"}' \
    > test.out 2>&1
eval_tap $? 152 'UpdateSSOPlatformCredential' test.out

#- 153 AdminListUserIDByPlatformUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByPlatformUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'EsXNgulq' \
    --rawPID  \
    --rawPUID  \
    --body '{"platformUserIds": ["fv4WqQRa", "losULgEj", "06e8DS9f"]}' \
    > test.out 2>&1
eval_tap $? 153 'AdminListUserIDByPlatformUserIDsV3' test.out

#- 154 AdminGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '9JsxtQ3R' \
    --platformUserId 'OOy3M0Aq' \
    --pidType 'siYv5sUR' \
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
    --body '{"config": {"minimumAllowedInterval": 25}, "type": "p31J4VGb"}' \
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
    --body '{"additions": [{"actions": [59, 30, 95], "resource": "rNGpaKae"}, {"actions": [57, 48, 31], "resource": "Y4p85wF7"}, {"actions": [87, 88, 25], "resource": "RkBCqQCR"}], "exclusions": [{"actions": [99, 2, 97], "resource": "IagS7UsT"}, {"actions": [54, 34, 6], "resource": "W9EvUUZq"}, {"actions": [93, 6, 34], "resource": "sHUCw9Dn"}], "overrides": [{"actions": [32, 76, 42], "resource": "VccXLAix"}, {"actions": [59, 43, 70], "resource": "ZaXzfbNi"}, {"actions": [80, 6, 99], "resource": "jrB6Mchy"}], "replacements": [{"replacement": {"actions": [95, 12, 65], "resource": "2xvzpGyn"}, "target": "TphAWGNm"}, {"replacement": {"actions": [35, 56, 92], "resource": "PTahGqzj"}, "target": "gR82uMlg"}, {"replacement": {"actions": [13, 96, 75], "resource": "9wP6fI1e"}, "target": "RcIBn6Qn"}]}' \
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
    --roleId '76hbu6kZ' \
    > test.out 2>&1
eval_tap $? 161 'AdminGetRoleNamespacePermissionV3' test.out

#- 162 GetAdminUsersByRoleIdV3
./ng net.accelbyte.sdk.cli.Main iam getAdminUsersByRoleIdV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'AadmopVw' \
    --after '66' \
    --before '43' \
    --limit '36' \
    > test.out 2>&1
eval_tap $? 162 'GetAdminUsersByRoleIdV3' test.out

#- 163 AdminQueryTagV3
./ng net.accelbyte.sdk.cli.Main iam adminQueryTagV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '4' \
    --offset '79' \
    --tagName 'houXXJtO' \
    > test.out 2>&1
eval_tap $? 163 'AdminQueryTagV3' test.out

#- 164 AdminCreateTagV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateTagV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"tagName": "5iJCYmAj"}' \
    > test.out 2>&1
eval_tap $? 164 'AdminCreateTagV3' test.out

#- 165 AdminUpdateTagV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateTagV3 \
    --namespace "$AB_NAMESPACE" \
    --tagId 'xSt1UTMA' \
    --body '{"tagName": "38rKnISd"}' \
    > test.out 2>&1
eval_tap $? 165 'AdminUpdateTagV3' test.out

#- 166 AdminDeleteTagV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteTagV3 \
    --namespace "$AB_NAMESPACE" \
    --tagId 'iupZHBB1' \
    > test.out 2>&1
eval_tap $? 166 'AdminDeleteTagV3' test.out

#- 167 AdminGetUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --emailAddress 'N2clkxND' \
    > test.out 2>&1
eval_tap $? 167 'AdminGetUserByEmailAddressV3' test.out

#- 168 AdminBulkUpdateUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"updateRequest": {"skipLoginQueue": false}, "userIds": ["BFXIySIG", "2ZMPK6Hy", "CjCgIe7w"]}' \
    > test.out 2>&1
eval_tap $? 168 'AdminBulkUpdateUsersV3' test.out

#- 169 AdminGetBulkUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType 'MNu2x41J' \
    --body '{"bulkUserId": ["2Cxm0zNy", "PbOvgwZi", "fmBwuYKs"]}' \
    > test.out 2>&1
eval_tap $? 169 'AdminGetBulkUserBanV3' test.out

#- 170 AdminListUserIDByUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"findByPublisherNamespace": true, "userIds": ["qPNWMqCp", "867gLpAw", "3MQ9E0w0"]}' \
    > test.out 2>&1
eval_tap $? 170 'AdminListUserIDByUserIDsV3' test.out

#- 171 AdminBulkGetUsersPlatform
./ng net.accelbyte.sdk.cli.Main iam adminBulkGetUsersPlatform \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["QzQRdpt6", "okbs2F0V", "fitbxw38"]}' \
    > test.out 2>&1
eval_tap $? 171 'AdminBulkGetUsersPlatform' test.out

#- 172 AdminCursorGetUserV3
./ng net.accelbyte.sdk.cli.Main iam adminCursorGetUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"cursor": {"cursorTime": "yZfwehJ3", "userId": "0uoJNjCZ"}, "fields": ["dF5RdLqO", "df2E1dGk", "EU8LS1dF"], "limit": 37}' \
    > test.out 2>&1
eval_tap $? 172 'AdminCursorGetUserV3' test.out

#- 173 AdminInviteUserV3
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddresses": ["3YBrqaLP", "dgUxAL1h", "UpzfeRb4"], "isAdmin": false, "languageTag": "l5T7834W", "namespace": "cfVNDAJG", "roles": ["Fbjw5Fag", "8tqOto2P", "KXXAi00c"]}' \
    > test.out 2>&1
eval_tap $? 173 'AdminInviteUserV3' test.out

#- 174 AdminQueryThirdPlatformLinkHistoryV3
./ng net.accelbyte.sdk.cli.Main iam adminQueryThirdPlatformLinkHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '40' \
    --offset '4' \
    --platformUserId 'tacDCA2f' \
    --platformId 'b0g0OkVZ' \
    > test.out 2>&1
eval_tap $? 174 'AdminQueryThirdPlatformLinkHistoryV3' test.out

#- 175 AdminListUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminListUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '74' \
    --offset '59' \
    > test.out 2>&1
eval_tap $? 175 'AdminListUsersV3' test.out

#- 176 AdminSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam adminSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by '7pomzia7' \
    --endDate 'czjxUbZ3' \
    --includeTotal  \
    --limit '76' \
    --offset '53' \
    --platformBy 'GLsSEfXv' \
    --platformId 'vSBlzTXs' \
    --query 'HdqJnawl' \
    --roleIds 'M4TEhZAJ' \
    --selectedFields 'sqdlSPyc' \
    --skipLoginQueue  \
    --startDate 'VRclyxhB' \
    --tagIds 'dtcX9ACu' \
    --testAccount  \
    > test.out 2>&1
eval_tap $? 176 'AdminSearchUserV3' test.out

#- 177 AdminGetBulkUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"listEmailAddressRequest": ["dFvRYCC7", "j0wXQjSc", "sZLo5WiE"]}' \
    > test.out 2>&1
eval_tap $? 177 'AdminGetBulkUserByEmailAddressV3' test.out

#- 178 AdminGetUserByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '2ify4mnk' \
    > test.out 2>&1
eval_tap $? 178 'AdminGetUserByUserIdV3' test.out

#- 179 AdminUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'iVWgLTih' \
    --body '{"avatarUrl": "TlYu9v7J", "country": "pbfkaXn7", "dateOfBirth": "5tn3O9sJ", "displayName": "t9niyIt3", "languageTag": "ZenZH7QO", "skipLoginQueue": false, "tags": ["luq4cxdK", "feaaExqM", "mpQZdX00"], "uniqueDisplayName": "Kop068ZB", "userName": "iBPwqVgO"}' \
    > test.out 2>&1
eval_tap $? 179 'AdminUpdateUserV3' test.out

#- 180 AdminGetUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Z788af4r' \
    --activeOnly  \
    --after 'A84oLjUF' \
    --before 'fwoXFRjC' \
    --limit '80' \
    > test.out 2>&1
eval_tap $? 180 'AdminGetUserBanV3' test.out

#- 181 AdminBanUserV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '9WBVhFQJ' \
    --body '{"ban": "NGo3twYs", "comment": "aAlutqYz", "endDate": "opK7eygM", "reason": "E4wvA12u", "skipNotif": false}' \
    > test.out 2>&1
eval_tap $? 181 'AdminBanUserV3' test.out

#- 182 AdminGetUserBanSummaryV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanSummaryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'H9kDP21b' \
    > test.out 2>&1
eval_tap $? 182 'AdminGetUserBanSummaryV3' test.out

#- 183 AdminUpdateUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserBanV3 \
    --banId '3T9ekqiP' \
    --namespace "$AB_NAMESPACE" \
    --userId 'QROT9Da2' \
    --body '{"enabled": false, "skipNotif": true}' \
    > test.out 2>&1
eval_tap $? 183 'AdminUpdateUserBanV3' test.out

#- 184 AdminSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'V4r53ymQ' \
    --body '{"context": "nXfNCuOd", "emailAddress": "wAmCsAkZ", "languageTag": "WnMpvWc7", "upgradeToken": "kQSfHpHQ"}' \
    > test.out 2>&1
eval_tap $? 184 'AdminSendVerificationCodeV3' test.out

#- 185 AdminVerifyAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'PbBvjIXO' \
    --body '{"Code": "cULUtef2", "ContactType": "OIbhQZ6B", "LanguageTag": "GNlqKNjA", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 185 'AdminVerifyAccountV3' test.out

#- 186 GetUserVerificationCode
./ng net.accelbyte.sdk.cli.Main iam getUserVerificationCode \
    --namespace "$AB_NAMESPACE" \
    --userId '0GCHP901' \
    > test.out 2>&1
eval_tap $? 186 'GetUserVerificationCode' test.out

#- 187 AdminGetUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '5KMaPDWB' \
    > test.out 2>&1
eval_tap $? 187 'AdminGetUserDeletionStatusV3' test.out

#- 188 AdminUpdateUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'tHmB7FuX' \
    --body '{"deletionDate": 85, "enabled": false}' \
    > test.out 2>&1
eval_tap $? 188 'AdminUpdateUserDeletionStatusV3' test.out

#- 189 AdminListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '77uyaEXx' \
    > test.out 2>&1
eval_tap $? 189 'AdminListUserAllPlatformAccountsDistinctV3' test.out

#- 190 AdminUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Xi3qwq3U' \
    --body '{"code": "gkkpUOl2", "country": "HlZGkaFt", "dateOfBirth": "uwv91E8I", "displayName": "6KlSMtyv", "emailAddress": "EVKIc6oF", "password": "l5KoOsdz", "uniqueDisplayName": "BNbS6OYC", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 190 'AdminUpgradeHeadlessAccountV3' test.out

#- 191 AdminDeleteUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'WTA1NWZO' \
    > test.out 2>&1
eval_tap $? 191 'AdminDeleteUserInformationV3' test.out

#- 192 AdminGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'lNhQXIW5' \
    --after '0.20095045232465192' \
    --before '0.49353827949100626' \
    --limit '83' \
    > test.out 2>&1
eval_tap $? 192 'AdminGetUserLoginHistoriesV3' test.out

#- 193 AdminResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam adminResetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Oy61XifB' \
    --body '{"languageTag": "06CFlNPM", "mfaToken": "3X5LomAl", "newPassword": "P2bcGmvl", "oldPassword": "QntNhJ5V"}' \
    > test.out 2>&1
eval_tap $? 193 'AdminResetPasswordV3' test.out

#- 194 AdminUpdateUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserPermissionV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'GG9R3I1A' \
    --body '{"Permissions": [{"Action": 73, "Resource": "qmyTrJA2", "SchedAction": 35, "SchedCron": "TqwHO8aS", "SchedRange": ["wc40uleg", "l146GhZL", "1ZYvoY6r"]}, {"Action": 60, "Resource": "mJnPAIo2", "SchedAction": 90, "SchedCron": "Gp3vfkY2", "SchedRange": ["21F1ngl2", "CxdpFIXt", "0IfTYNdu"]}, {"Action": 52, "Resource": "czz8iGm5", "SchedAction": 2, "SchedCron": "YTbaovOU", "SchedRange": ["tqclIyO4", "d9EZdUwS", "zV2w2P3a"]}]}' \
    > test.out 2>&1
eval_tap $? 194 'AdminUpdateUserPermissionV3' test.out

#- 195 AdminAddUserPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserPermissionsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'jy2fQOxU' \
    --body '{"Permissions": [{"Action": 4, "Resource": "2bPGR9ZS", "SchedAction": 62, "SchedCron": "aoY3OjxK", "SchedRange": ["AzuEOVcl", "SaktJUSB", "zyYpFIde"]}, {"Action": 11, "Resource": "jUgYJkUc", "SchedAction": 4, "SchedCron": "xxyonStS", "SchedRange": ["R3HGWVzT", "K15JGK6Y", "AJxf7009"]}, {"Action": 13, "Resource": "zwJJAQhY", "SchedAction": 95, "SchedCron": "oqyWEfqu", "SchedRange": ["90GQzGdE", "6TZqgHRI", "rOa1nUen"]}]}' \
    > test.out 2>&1
eval_tap $? 195 'AdminAddUserPermissionsV3' test.out

#- 196 AdminDeleteUserPermissionBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'EIRgeS2l' \
    --body '[{"Action": 20, "Resource": "eMDIrxjA"}, {"Action": 81, "Resource": "v4FVJfQ8"}, {"Action": 55, "Resource": "tXYlUegA"}]' \
    > test.out 2>&1
eval_tap $? 196 'AdminDeleteUserPermissionBulkV3' test.out

#- 197 AdminDeleteUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionV3 \
    --action '75' \
    --namespace "$AB_NAMESPACE" \
    --resource 'taO47WqC' \
    --userId '55idrB5r' \
    > test.out 2>&1
eval_tap $? 197 'AdminDeleteUserPermissionV3' test.out

#- 198 AdminGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Qmy53rjg' \
    --after 'C3JJRggH' \
    --before 'voIeJDBr' \
    --limit '66' \
    --platformId 'rVVocUBo' \
    --targetNamespace '7KdvWNy1' \
    > test.out 2>&1
eval_tap $? 198 'AdminGetUserPlatformAccountsV3' test.out

#- 199 AdminListAllDistinctPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminListAllDistinctPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'M17h5ac4' \
    --status 'YhMiRqeH' \
    > test.out 2>&1
eval_tap $? 199 'AdminListAllDistinctPlatformAccountsV3' test.out

#- 200 AdminGetListJusticePlatformAccounts
./ng net.accelbyte.sdk.cli.Main iam adminGetListJusticePlatformAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'llSgKHyx' \
    > test.out 2>&1
eval_tap $? 200 'AdminGetListJusticePlatformAccounts' test.out

#- 201 AdminGetUserMapping
./ng net.accelbyte.sdk.cli.Main iam adminGetUserMapping \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace '7tpv8orG' \
    --userId 'z5IdOufr' \
    --createIfNotFound  \
    > test.out 2>&1
eval_tap $? 201 'AdminGetUserMapping' test.out

#- 202 AdminCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam adminCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'DKRuC4qS' \
    --userId 'c01hcGUb' \
    > test.out 2>&1
eval_tap $? 202 'AdminCreateJusticeUser' test.out

#- 203 AdminLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'th0U4cS6' \
    --skipConflict  \
    --body '{"platformId": "JjdqFAso", "platformUserId": "zOwHqRPW"}' \
    > test.out 2>&1
eval_tap $? 203 'AdminLinkPlatformAccount' test.out

#- 204 AdminGetUserLinkHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLinkHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'dOFobvpW' \
    --platformId 'KWgEdFSM' \
    > test.out 2>&1
eval_tap $? 204 'AdminGetUserLinkHistoriesV3' test.out

#- 205 AdminPlatformUnlinkV3
eval_tap 0 205 'AdminPlatformUnlinkV3 # SKIP deprecated' test.out

#- 206 AdminPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'dNICHNLj' \
    --userId 'wYJ2SPsq' \
    > test.out 2>&1
eval_tap $? 206 'AdminPlatformUnlinkAllV3' test.out

#- 207 AdminPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '8ZeZpDbz' \
    --userId '25jKc2Mf' \
    --ticket 'Y84wdwX2' \
    > test.out 2>&1
eval_tap $? 207 'AdminPlatformLinkV3' test.out

#- 208 AdminDeleteUserLinkingHistoryByPlatformIDV3
eval_tap 0 208 'AdminDeleteUserLinkingHistoryByPlatformIDV3 # SKIP deprecated' test.out

#- 209 AdminDeleteUserLinkingRestrictionByPlatformIDV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserLinkingRestrictionByPlatformIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'ngWRRJWe' \
    --userId 'qDkvPCbK' \
    > test.out 2>&1
eval_tap $? 209 'AdminDeleteUserLinkingRestrictionByPlatformIDV3' test.out

#- 210 AdminGetThirdPartyPlatformTokenLinkStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetThirdPartyPlatformTokenLinkStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'J1ozHOj6' \
    --userId '7gbdEyaL' \
    --platformToken 'o3OjJB2C' \
    > test.out 2>&1
eval_tap $? 210 'AdminGetThirdPartyPlatformTokenLinkStatusV3' test.out

#- 211 AdminGetUserSinglePlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminGetUserSinglePlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --platformId 'iet6yigk' \
    --userId 'AxbOFqgp' \
    --crossNamespace  \
    > test.out 2>&1
eval_tap $? 211 'AdminGetUserSinglePlatformAccount' test.out

#- 212 AdminDeleteUserRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRolesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'qpGzStxt' \
    --body '["1AoOGXvc", "TbaMwGYi", "DIktaxIw"]' \
    > test.out 2>&1
eval_tap $? 212 'AdminDeleteUserRolesV3' test.out

#- 213 AdminSaveUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminSaveUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ONsKP8ax' \
    --body '[{"namespace": "KjUrPpzI", "roleId": "iVSlDSg3"}, {"namespace": "qRorhVup", "roleId": "3qvD4dfU"}, {"namespace": "1svDarzG", "roleId": "5EO4aDjC"}]' \
    > test.out 2>&1
eval_tap $? 213 'AdminSaveUserRoleV3' test.out

#- 214 AdminAddUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'WvIqiFag' \
    --userId 'BONW9GFY' \
    > test.out 2>&1
eval_tap $? 214 'AdminAddUserRoleV3' test.out

#- 215 AdminDeleteUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'sG05Ptds' \
    --userId 'dptYE4UD' \
    > test.out 2>&1
eval_tap $? 215 'AdminDeleteUserRoleV3' test.out

#- 216 AdminGetUserStateByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserStateByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'fWQ86Ldo' \
    > test.out 2>&1
eval_tap $? 216 'AdminGetUserStateByUserIdV3' test.out

#- 217 AdminUpdateUserStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'bhgIlkej' \
    --body '{"enabled": false, "reason": "5MUyAEw1"}' \
    > test.out 2>&1
eval_tap $? 217 'AdminUpdateUserStatusV3' test.out

#- 218 AdminTrustlyUpdateUserIdentity
./ng net.accelbyte.sdk.cli.Main iam adminTrustlyUpdateUserIdentity \
    --namespace "$AB_NAMESPACE" \
    --userId 'nr2PSaIV' \
    --body '{"emailAddress": "yas6CcVQ", "password": "y18guKYs"}' \
    > test.out 2>&1
eval_tap $? 218 'AdminTrustlyUpdateUserIdentity' test.out

#- 219 AdminVerifyUserWithoutVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyUserWithoutVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'wqQKz2sW' \
    > test.out 2>&1
eval_tap $? 219 'AdminVerifyUserWithoutVerificationCodeV3' test.out

#- 220 AdminUpdateClientSecretV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientSecretV3 \
    --clientId 'seZy2uzc' \
    --namespace "$AB_NAMESPACE" \
    --body '{"newSecret": "AJgfvQfn"}' \
    > test.out 2>&1
eval_tap $? 220 'AdminUpdateClientSecretV3' test.out

#- 221 AdminCheckThirdPartyLoginPlatformAvailabilityV3
./ng net.accelbyte.sdk.cli.Main iam adminCheckThirdPartyLoginPlatformAvailabilityV3 \
    --platformId 'LjKHovJN' \
    > test.out 2>&1
eval_tap $? 221 'AdminCheckThirdPartyLoginPlatformAvailabilityV3' test.out

#- 222 AdminGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV3 \
    --after 'G5IRloI5' \
    --before 'DZOOCYjs' \
    --isWildcard  \
    --limit '30' \
    > test.out 2>&1
eval_tap $? 222 'AdminGetRolesV3' test.out

#- 223 AdminCreateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV3 \
    --body '{"adminRole": true, "deletable": true, "isWildcard": false, "managers": [{"displayName": "E3oHVbrv", "namespace": "fYd9MhsP", "userId": "3gQ4gp2f"}, {"displayName": "2FKqbY7o", "namespace": "yJQA9Ohq", "userId": "3M3ZVztQ"}, {"displayName": "2KK2E3Lc", "namespace": "mmzetWHO", "userId": "8St3KuaO"}], "members": [{"displayName": "2JfOMXRm", "namespace": "Ca0JBvzZ", "userId": "hyjZML7v"}, {"displayName": "tzQR9bTJ", "namespace": "BaYvF6Lo", "userId": "ZllkCvIY"}, {"displayName": "5Kgzyzfr", "namespace": "HtfJSvWT", "userId": "W69wvLU7"}], "permissions": [{"action": 90, "resource": "WXVjMicc", "schedAction": 11, "schedCron": "lIUuR2Kk", "schedRange": ["wuST2h8E", "QmmVwXlk", "LqeYkMBV"]}, {"action": 30, "resource": "3Dptyy5d", "schedAction": 76, "schedCron": "JlhPlqeB", "schedRange": ["4lDEwn1P", "P48sZph4", "DmOrnGeS"]}, {"action": 71, "resource": "8rL47gOx", "schedAction": 8, "schedCron": "eIz34i9y", "schedRange": ["S1v9va7A", "yhvKZYdr", "1rkbLTfA"]}], "roleName": "ZsLpglBv"}' \
    > test.out 2>&1
eval_tap $? 223 'AdminCreateRoleV3' test.out

#- 224 AdminGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV3 \
    --roleId 'LoSvPPx2' \
    > test.out 2>&1
eval_tap $? 224 'AdminGetRoleV3' test.out

#- 225 AdminDeleteRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV3 \
    --roleId 'yrMGqu1z' \
    > test.out 2>&1
eval_tap $? 225 'AdminDeleteRoleV3' test.out

#- 226 AdminUpdateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV3 \
    --roleId 'AIshbOI4' \
    --body '{"deletable": false, "isWildcard": false, "roleName": "6KOVJasq"}' \
    > test.out 2>&1
eval_tap $? 226 'AdminUpdateRoleV3' test.out

#- 227 AdminGetRoleAdminStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleAdminStatusV3 \
    --roleId '7OPoCBT3' \
    > test.out 2>&1
eval_tap $? 227 'AdminGetRoleAdminStatusV3' test.out

#- 228 AdminUpdateAdminRoleStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateAdminRoleStatusV3 \
    --roleId 'PuNxmHTo' \
    > test.out 2>&1
eval_tap $? 228 'AdminUpdateAdminRoleStatusV3' test.out

#- 229 AdminRemoveRoleAdminV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleAdminV3 \
    --roleId 'LxaLdjYQ' \
    > test.out 2>&1
eval_tap $? 229 'AdminRemoveRoleAdminV3' test.out

#- 230 AdminGetRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleManagersV3 \
    --roleId 'XrEmcfEu' \
    --after 'wDnyoo0D' \
    --before '9d3myXIG' \
    --limit '1' \
    > test.out 2>&1
eval_tap $? 230 'AdminGetRoleManagersV3' test.out

#- 231 AdminAddRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleManagersV3 \
    --roleId 'rXirAmxG' \
    --body '{"managers": [{"displayName": "66Z06VXD", "namespace": "Gym1UWo2", "userId": "LQyKEZrp"}, {"displayName": "lBDQJAbx", "namespace": "EL3axnYy", "userId": "JgZhK22E"}, {"displayName": "mcNuGMRq", "namespace": "WaIZTV27", "userId": "irDhSIMi"}]}' \
    > test.out 2>&1
eval_tap $? 231 'AdminAddRoleManagersV3' test.out

#- 232 AdminRemoveRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleManagersV3 \
    --roleId 'lyoVVDq4' \
    --body '{"managers": [{"displayName": "Bru6Bu40", "namespace": "MrCQ5Tkx", "userId": "qB2Ggq5q"}, {"displayName": "RqIqXkjf", "namespace": "TDX3SDiH", "userId": "rohv1JQx"}, {"displayName": "9oExx27j", "namespace": "7KsBOV98", "userId": "w56hs6Uq"}]}' \
    > test.out 2>&1
eval_tap $? 232 'AdminRemoveRoleManagersV3' test.out

#- 233 AdminGetRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleMembersV3 \
    --roleId '6DeyxcYJ' \
    --after '1NjKFu66' \
    --before 'V6sGPNSz' \
    --limit '50' \
    > test.out 2>&1
eval_tap $? 233 'AdminGetRoleMembersV3' test.out

#- 234 AdminAddRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleMembersV3 \
    --roleId 'iavv7MbI' \
    --body '{"members": [{"displayName": "pnERYZBl", "namespace": "xg8joCpL", "userId": "HbPG9lEU"}, {"displayName": "oOcSzp9U", "namespace": "h3gWn0TZ", "userId": "HZiFdcQv"}, {"displayName": "EogZO5Vj", "namespace": "ajG68iKm", "userId": "m3CRnyFa"}]}' \
    > test.out 2>&1
eval_tap $? 234 'AdminAddRoleMembersV3' test.out

#- 235 AdminRemoveRoleMembersV3
eval_tap 0 235 'AdminRemoveRoleMembersV3 # SKIP deprecated' test.out

#- 236 AdminUpdateRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV3 \
    --roleId 'cXojGmTv' \
    --body '{"permissions": [{"action": 90, "resource": "YdBv8ejG", "schedAction": 2, "schedCron": "F8UFOu88", "schedRange": ["zJ7HXYAx", "sI2hkeoh", "MzTqI5bY"]}, {"action": 58, "resource": "nOu5OXPm", "schedAction": 68, "schedCron": "s0LYZc12", "schedRange": ["UnYjL8G9", "mp1LJYQC", "0zSu6P6L"]}, {"action": 69, "resource": "GiEIspPf", "schedAction": 9, "schedCron": "WDm6yLNP", "schedRange": ["GA4HLLjo", "WLzbP0xw", "1FAkIjel"]}]}' \
    > test.out 2>&1
eval_tap $? 236 'AdminUpdateRolePermissionsV3' test.out

#- 237 AdminAddRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV3 \
    --roleId 'QZh9meJB' \
    --body '{"permissions": [{"action": 81, "resource": "dKtroRy6", "schedAction": 63, "schedCron": "rBQY0w28", "schedRange": ["bNcUZp1L", "CalipXrU", "U8RvuBcQ"]}, {"action": 34, "resource": "pYpdMnda", "schedAction": 88, "schedCron": "4DIJtpK1", "schedRange": ["8B5vJO6v", "jjcc3i45", "rXZQcspy"]}, {"action": 77, "resource": "JlnWq7Ty", "schedAction": 81, "schedCron": "D57xZ6Y5", "schedRange": ["bXhDw3VN", "c7eo7TEo", "q4l82fnJ"]}]}' \
    > test.out 2>&1
eval_tap $? 237 'AdminAddRolePermissionsV3' test.out

#- 238 AdminDeleteRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV3 \
    --roleId 'MfznNdUC' \
    --body '["oPg5p9LJ", "11vMia49", "I5mffVK1"]' \
    > test.out 2>&1
eval_tap $? 238 'AdminDeleteRolePermissionsV3' test.out

#- 239 AdminDeleteRolePermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionV3 \
    --action '40' \
    --resource '6VeWDnid' \
    --roleId 'v2jaB3Ds' \
    > test.out 2>&1
eval_tap $? 239 'AdminDeleteRolePermissionV3' test.out

#- 240 AdminGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam adminGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 240 'AdminGetMyUserV3' test.out

#- 241 UserAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam userAuthenticationV3 \
    --clientId 'WJl5O8H8' \
    --extendExp  \
    --redirectUri 'Hd0We3rp' \
    --password '8vCMtdX4' \
    --requestId 'SJBKLg0X' \
    --userName 'zh5o8GLF' \
    > test.out 2>&1
eval_tap $? 241 'UserAuthenticationV3' test.out

#- 242 AuthenticationWithPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV3 \
    --extendExp  \
    --clientId 'wmprqaCt' \
    --linkingToken 'wBP2jWx1' \
    --password 'Vmdfz8Wj' \
    --username '40qWQKVl' \
    > test.out 2>&1
eval_tap $? 242 'AuthenticationWithPlatformLinkV3' test.out

#- 243 AuthenticateAndLinkForwardV3
./ng net.accelbyte.sdk.cli.Main iam authenticateAndLinkForwardV3 \
    --extendExp  \
    --clientId '6ngwtI8F' \
    --linkingToken 'ntfRIMk4' \
    --password '4r0oFbMp' \
    --username 'CdWUXINk' \
    > test.out 2>&1
eval_tap $? 243 'AuthenticateAndLinkForwardV3' test.out

#- 244 PublicGetSystemConfigV3
./ng net.accelbyte.sdk.cli.Main iam publicGetSystemConfigV3 \
    > test.out 2>&1
eval_tap $? 244 'PublicGetSystemConfigV3' test.out

#- 245 GenerateTokenByNewHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV3 \
    --additionalData 'DqEFNTDZ' \
    --extendExp  \
    --linkingToken 'LW3MyJNC' \
    > test.out 2>&1
eval_tap $? 245 'GenerateTokenByNewHeadlessAccountV3' test.out

#- 246 RequestOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam requestOneTimeLinkingCodeV3 \
    --redirectUri 'dWZKnkmu' \
    --state 'JWdkEs2P' \
    --platformId 'rL1b52r2' \
    > test.out 2>&1
eval_tap $? 246 'RequestOneTimeLinkingCodeV3' test.out

#- 247 ValidateOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam validateOneTimeLinkingCodeV3 \
    --oneTimeLinkCode 'DdhCZtnI' \
    > test.out 2>&1
eval_tap $? 247 'ValidateOneTimeLinkingCodeV3' test.out

#- 248 RequestTokenByOneTimeLinkCodeResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTokenByOneTimeLinkCodeResponseV3 \
    --additionalData 'fq0A2Slq' \
    --isTransient  \
    --clientId 'rGpbAd3Q' \
    --oneTimeLinkCode '490HRCou' \
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
    --codeChallenge 'iWRzMJ1B' \
    --codeChallengeMethod 'plain' \
    --clientId 'auLYIE2Y' \
    > test.out 2>&1
eval_tap $? 251 'RequestTokenExchangeCodeV3' test.out

#- 252 AdminRetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam adminRetrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'c5WSA1l3' \
    --userId 'UJkqgEp8' \
    --platformUserId 'zd787W20' \
    > test.out 2>&1
eval_tap $? 252 'AdminRetrieveUserThirdPartyPlatformTokenV3' test.out

#- 253 RevokeUserV3
./ng net.accelbyte.sdk.cli.Main iam revokeUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'WfaYKmDu' \
    --includeGameNamespace  \
    > test.out 2>&1
eval_tap $? 253 'RevokeUserV3' test.out

#- 254 AuthorizeV3
./ng net.accelbyte.sdk.cli.Main iam authorizeV3 \
    --blockedPlatformId 'TvllIo0S' \
    --codeChallenge 'o3KTDr1k' \
    --codeChallengeMethod 'plain' \
    --createHeadless  \
    --loginWebBased  \
    --nonce 'iwNwC2dM' \
    --oneTimeLinkCode 'os0I0Td9' \
    --redirectUri 'nMfH0cnB' \
    --scope 'p0CdGZxT' \
    --state 'e5CM5Vfm' \
    --targetAuthPage 'MOx1oOY5' \
    --useRedirectUriAsLoginUrlWhenLocked  \
    --clientId '2seLYrrA' \
    --responseType 'code' \
    > test.out 2>&1
eval_tap $? 254 'AuthorizeV3' test.out

#- 255 TokenIntrospectionV3
./ng net.accelbyte.sdk.cli.Main iam tokenIntrospectionV3 \
    --token 'rrUaAR4T' \
    > test.out 2>&1
eval_tap $? 255 'TokenIntrospectionV3' test.out

#- 256 GetJWKSV3
./ng net.accelbyte.sdk.cli.Main iam getJWKSV3 \
    > test.out 2>&1
eval_tap $? 256 'GetJWKSV3' test.out

#- 257 SendMFAAuthenticationCode
./ng net.accelbyte.sdk.cli.Main iam sendMFAAuthenticationCode \
    --clientId 'jNXUlTBy' \
    --factor 'mrlrqN8R' \
    --mfaToken '34KdPJHw' \
    > test.out 2>&1
eval_tap $? 257 'SendMFAAuthenticationCode' test.out

#- 258 Change2faMethod
./ng net.accelbyte.sdk.cli.Main iam change2faMethod \
    --factor 'iOdIi5f8' \
    --mfaToken 'i8D380A1' \
    > test.out 2>&1
eval_tap $? 258 'Change2faMethod' test.out

#- 259 Verify2faCode
./ng net.accelbyte.sdk.cli.Main iam verify2faCode \
    --code 'RiCZBDAW' \
    --factor 'X8zifuse' \
    --mfaToken 'KrlVtC8t' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 259 'Verify2faCode' test.out

#- 260 Verify2faCodeForward
./ng net.accelbyte.sdk.cli.Main iam verify2faCodeForward \
    --defaultFactor 'ytPq9k5Q' \
    --factors '2kO7exqd' \
    --rememberDevice  \
    --clientId 'ToFtCol3' \
    --code 'dvm780BI' \
    --factor 'IGpAHweB' \
    --mfaToken 'jx4g7JZR' \
    > test.out 2>&1
eval_tap $? 260 'Verify2faCodeForward' test.out

#- 261 RetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam retrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'S0wVHWtj' \
    --userId 'StnhoCAb' \
    > test.out 2>&1
eval_tap $? 261 'RetrieveUserThirdPartyPlatformTokenV3' test.out

#- 262 AuthCodeRequestV3
./ng net.accelbyte.sdk.cli.Main iam authCodeRequestV3 \
    --platformId 'g9snF9FN' \
    --clientId 'a9ZmO1F6' \
    --redirectUri 'Fa4E53cc' \
    --requestId 'c608rBIA' \
    > test.out 2>&1
eval_tap $? 262 'AuthCodeRequestV3' test.out

#- 263 PlatformTokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV3 \
    --platformId '17LAo4Q4' \
    --additionalData 'qb61GKRN' \
    --clientId 'g5ZhuVnX' \
    --createHeadless  \
    --deviceId 'oQnfcROC' \
    --macAddress 'aYGh3hPS' \
    --platformToken 'UOCRiJwv' \
    --serviceLabel '0.4879791001750664' \
    --skipSetCookie  \
    > test.out 2>&1
eval_tap $? 263 'PlatformTokenGrantV3' test.out

#- 264 GetRevocationListV3
./ng net.accelbyte.sdk.cli.Main iam getRevocationListV3 \
    > test.out 2>&1
eval_tap $? 264 'GetRevocationListV3' test.out

#- 265 TokenRevocationV3
./ng net.accelbyte.sdk.cli.Main iam tokenRevocationV3 \
    --token 'OAyme8ZX' \
    > test.out 2>&1
eval_tap $? 265 'TokenRevocationV3' test.out

#- 266 SimultaneousLoginV3
./ng net.accelbyte.sdk.cli.Main iam simultaneousLoginV3 \
    --simultaneousPlatform 'hdHwHeDa' \
    --simultaneousTicket 'DkM3UotZ' \
    --nativePlatform 'steam' \
    --nativePlatformTicket 'NIhCESXZ' \
    > test.out 2>&1
eval_tap $? 266 'SimultaneousLoginV3' test.out

#- 267 TokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV3 \
    --additionalData 'CQ2Eab8E' \
    --clientId 'ImmTwLuU' \
    --clientSecret 'nCU8tJY5' \
    --code 'hHIo9it0' \
    --codeVerifier 'iUW7uqsk' \
    --extendNamespace 'UoXghmqZ' \
    --extendExp  \
    --password '7gK4dpJc' \
    --redirectUri 'KYED12VH' \
    --refreshToken '52WcAO99' \
    --scope '9PUxaYWy' \
    --username 'Jki9mnzo' \
    --grantType 'password' \
    > test.out 2>&1
eval_tap $? 267 'TokenGrantV3' test.out

#- 268 VerifyTokenV3
./ng net.accelbyte.sdk.cli.Main iam verifyTokenV3 \
    --token 'dMDA1boT' \
    > test.out 2>&1
eval_tap $? 268 'VerifyTokenV3' test.out

#- 269 PlatformAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticationV3 \
    --platformId 'btez8zPe' \
    --code 'ALu5YpIv' \
    --error 'Ip8AC6z5' \
    --openidAssocHandle 'w1EfphT8' \
    --openidClaimedId 'hJHBD7ag' \
    --openidIdentity '6WEXWYln' \
    --openidMode 'oydDARfc' \
    --openidNs 'qP3vo0CI' \
    --openidOpEndpoint 'zulSjf3w' \
    --openidResponseNonce 'ntCN3aUI' \
    --openidReturnTo 'Giq5tAas' \
    --openidSig 'F69tzXGy' \
    --openidSigned 'ZNdaFqCn' \
    --state 'CGXWLd7E' \
    > test.out 2>&1
eval_tap $? 269 'PlatformAuthenticationV3' test.out

#- 270 PlatformTokenRefreshV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenRefreshV3 \
    --platformId 'OrT8oOUf' \
    --platformToken 'a0SaqWeZ' \
    > test.out 2>&1
eval_tap $? 270 'PlatformTokenRefreshV3' test.out

#- 271 PublicGetInputValidations
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidations \
    --defaultOnEmpty  \
    --languageCode 'nfAVvOGD' \
    > test.out 2>&1
eval_tap $? 271 'PublicGetInputValidations' test.out

#- 272 PublicGetInputValidationByField
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidationByField \
    --field 'SMy54lGE' \
    > test.out 2>&1
eval_tap $? 272 'PublicGetInputValidationByField' test.out

#- 273 PublicGetCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam publicGetCountryAgeRestrictionV3 \
    --countryCode 'WTx1dNd1' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 273 'PublicGetCountryAgeRestrictionV3' test.out

#- 274 PublicGetConfigValueV3
./ng net.accelbyte.sdk.cli.Main iam publicGetConfigValueV3 \
    --configKey '2EZEVxfc' \
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
    --clientId 'LPvv3P2M' \
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
    --requestId 'mQiYdvJP' \
    > test.out 2>&1
eval_tap $? 281 'PublicGetAsyncStatus' test.out

#- 282 PublicSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam publicSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'blnrQ2eK' \
    --limit '77' \
    --offset '0' \
    --platformBy 'l60MoyRr' \
    --platformId 'G7qqlAv3' \
    --query '1kDtpD7N' \
    > test.out 2>&1
eval_tap $? 282 'PublicSearchUserV3' test.out

#- 283 PublicCreateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "WwBrxV07", "acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "QP51hlgE", "policyId": "pn351iep", "policyVersionId": "35UGFhjf"}, {"isAccepted": false, "localizedPolicyVersionId": "S8UoZo7j", "policyId": "FsffxO7q", "policyVersionId": "fda1Xsi4"}, {"isAccepted": true, "localizedPolicyVersionId": "AD3shAyZ", "policyId": "I8JCiK4I", "policyVersionId": "kNlJGr2G"}], "authType": "k3RyQ2vt", "code": "6rpD3G5E", "country": "S5w9VWAC", "dateOfBirth": "ZFxhMlPZ", "displayName": "cjiygAPt", "emailAddress": "W3EDMNrC", "password": "cC99Jj2I", "reachMinimumAge": false, "uniqueDisplayName": "gUC4cfen"}' \
    > test.out 2>&1
eval_tap $? 283 'PublicCreateUserV3' test.out

#- 284 CheckUserAvailability
./ng net.accelbyte.sdk.cli.Main iam checkUserAvailability \
    --namespace "$AB_NAMESPACE" \
    --field 'v51hnJt5' \
    --query 'tUmWn62d' \
    > test.out 2>&1
eval_tap $? 284 'CheckUserAvailability' test.out

#- 285 PublicBulkGetUsers
eval_tap 0 285 'PublicBulkGetUsers # SKIP deprecated' test.out

#- 286 PublicSendRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicSendRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "bESvZZst", "languageTag": "DGwexJo8"}' \
    > test.out 2>&1
eval_tap $? 286 'PublicSendRegistrationCode' test.out

#- 287 PublicVerifyRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicVerifyRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "TtZ7SSHs", "emailAddress": "NBSpJnXL"}' \
    > test.out 2>&1
eval_tap $? 287 'PublicVerifyRegistrationCode' test.out

#- 288 PublicForgotPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicForgotPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "jC5w0LMy", "languageTag": "6lfAffF5"}' \
    > test.out 2>&1
eval_tap $? 288 'PublicForgotPasswordV3' test.out

#- 289 PublicValidateUserInput
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserInput \
    --namespace "$AB_NAMESPACE" \
    --body '{"displayName": "g94KBMXI", "password": "vaLid5L0", "uniqueDisplayName": "CVY5XLMY", "username": "kJcwAUzc"}' \
    > test.out 2>&1
eval_tap $? 289 'PublicValidateUserInput' test.out

#- 290 GetAdminInvitationV3
./ng net.accelbyte.sdk.cli.Main iam getAdminInvitationV3 \
    --invitationId 'iWIBXXVi' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 290 'GetAdminInvitationV3' test.out

#- 291 CreateUserFromInvitationV3
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV3 \
    --invitationId '7mBYnb4I' \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "m4UwGm9C", "acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "IXXRON8E", "policyId": "0tUjV38R", "policyVersionId": "jikO6pEa"}, {"isAccepted": true, "localizedPolicyVersionId": "pGZoFNXg", "policyId": "2d9ZKVkx", "policyVersionId": "c3coxhRf"}, {"isAccepted": false, "localizedPolicyVersionId": "lq6vp9ha", "policyId": "BzYI6xzj", "policyVersionId": "fZ86XBTz"}], "authType": "cSaanGUI", "code": "2O03lpRb", "country": "pXT8Dnbp", "dateOfBirth": "JBJWfAz9", "displayName": "cb8s29iL", "emailAddress": "bNqFwOut", "password": "VWNDhl9F", "reachMinimumAge": false, "uniqueDisplayName": "JimhXekO"}' \
    > test.out 2>&1
eval_tap $? 291 'CreateUserFromInvitationV3' test.out

#- 292 UpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam updateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "ngZVDsZp", "country": "GDBmv6cA", "dateOfBirth": "a7bLJ0Qt", "displayName": "NehU1ceW", "languageTag": "FDroWark", "uniqueDisplayName": "MaStM7uO", "userName": "OTHL9TCz"}' \
    > test.out 2>&1
eval_tap $? 292 'UpdateUserV3' test.out

#- 293 PublicPartialUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicPartialUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "hfibaFkn", "country": "xRVkMlAR", "dateOfBirth": "Rp22iOoL", "displayName": "M18EejZm", "languageTag": "26NDy64K", "uniqueDisplayName": "tQELFLwa", "userName": "gCH1n6DZ"}' \
    > test.out 2>&1
eval_tap $? 293 'PublicPartialUpdateUserV3' test.out

#- 294 PublicSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"context": "NtnPTbQ0", "emailAddress": "JpWTs2sS", "languageTag": "tVcmuUGp", "upgradeToken": "QrUcTvVZ"}' \
    > test.out 2>&1
eval_tap $? 294 'PublicSendVerificationCodeV3' test.out

#- 295 PublicUserVerificationV3
./ng net.accelbyte.sdk.cli.Main iam publicUserVerificationV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "NyIqWBFI", "contactType": "HvqeXcUS", "languageTag": "UnHvca7m", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 295 'PublicUserVerificationV3' test.out

#- 296 PublicUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "7y2ZFSsa", "country": "9OUKbqW7", "dateOfBirth": "I9dagTFL", "displayName": "SD1x2by5", "emailAddress": "VjqdlyUS", "password": "MEZvDBPf", "uniqueDisplayName": "Go5jqekA", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 296 'PublicUpgradeHeadlessAccountV3' test.out

#- 297 PublicVerifyHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --needVerificationCode  \
    --body '{"emailAddress": "9ta7L0oP", "password": "f4iQNZLo"}' \
    > test.out 2>&1
eval_tap $? 297 'PublicVerifyHeadlessAccountV3' test.out

#- 298 PublicUpdatePasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicUpdatePasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"languageTag": "F8M167l0", "mfaToken": "ipxzLS97", "newPassword": "dvHuM2rt", "oldPassword": "Nai2YqGZ"}' \
    > test.out 2>&1
eval_tap $? 298 'PublicUpdatePasswordV3' test.out

#- 299 PublicCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam publicCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace '4ZalYrX5' \
    > test.out 2>&1
eval_tap $? 299 'PublicCreateJusticeUser' test.out

#- 300 PublicPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '6ttg4ZVS' \
    --redirectUri 'XOp3wCia' \
    --ticket '3BkXB3S4' \
    > test.out 2>&1
eval_tap $? 300 'PublicPlatformLinkV3' test.out

#- 301 PublicPlatformUnlinkV3
eval_tap 0 301 'PublicPlatformUnlinkV3 # SKIP deprecated' test.out

#- 302 PublicPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'asv2xxQL' \
    > test.out 2>&1
eval_tap $? 302 'PublicPlatformUnlinkAllV3' test.out

#- 303 PublicForcePlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicForcePlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'F9e8SX6z' \
    --ticket 'Yf0XvGp1' \
    > test.out 2>&1
eval_tap $? 303 'PublicForcePlatformLinkV3' test.out

#- 304 PublicWebLinkPlatform
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatform \
    --namespace "$AB_NAMESPACE" \
    --platformId '1Gtnuy3I' \
    --clientId 'RVqL1Gtp' \
    --redirectUri 'v5BMqXL9' \
    > test.out 2>&1
eval_tap $? 304 'PublicWebLinkPlatform' test.out

#- 305 PublicWebLinkPlatformEstablish
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatformEstablish \
    --namespace "$AB_NAMESPACE" \
    --platformId 'utFqw2d0' \
    --code '3Vq5Jz92' \
    --state 'u6crtbaH' \
    > test.out 2>&1
eval_tap $? 305 'PublicWebLinkPlatformEstablish' test.out

#- 306 PublicProcessWebLinkPlatformV3
./ng net.accelbyte.sdk.cli.Main iam publicProcessWebLinkPlatformV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '839djGob' \
    --code 'rbqxKaul' \
    --state 'knaT3fAB' \
    > test.out 2>&1
eval_tap $? 306 'PublicProcessWebLinkPlatformV3' test.out

#- 307 PublicGetUsersPlatformInfosV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUsersPlatformInfosV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"platformId": "32AvCFVk", "userIds": ["2LhmxVmv", "nYfQEbuM", "JDHGqKaC"]}' \
    > test.out 2>&1
eval_tap $? 307 'PublicGetUsersPlatformInfosV3' test.out

#- 308 ResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam resetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientId": "twqKNytI", "code": "uBmoQm67", "emailAddress": "KFoG6gih", "languageTag": "q8SWINve", "newPassword": "ASXD1ZPh"}' \
    > test.out 2>&1
eval_tap $? 308 'ResetPasswordV3' test.out

#- 309 PublicGetUserByUserIdV3
eval_tap 0 309 'PublicGetUserByUserIdV3 # SKIP deprecated' test.out

#- 310 PublicGetUserBanHistoryV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserBanHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 't0ihNFHU' \
    --activeOnly  \
    --after 'W53ToNpR' \
    --before 'wRpiZgte' \
    --limit '65' \
    > test.out 2>&1
eval_tap $? 310 'PublicGetUserBanHistoryV3' test.out

#- 311 PublicListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'm9odDFO1' \
    > test.out 2>&1
eval_tap $? 311 'PublicListUserAllPlatformAccountsDistinctV3' test.out

#- 312 PublicGetUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'u9qxXEOU' \
    > test.out 2>&1
eval_tap $? 312 'PublicGetUserInformationV3' test.out

#- 313 PublicGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'PBOjgDzd' \
    --after '0.7785840006945359' \
    --before '0.489480533219358' \
    --limit '99' \
    > test.out 2>&1
eval_tap $? 313 'PublicGetUserLoginHistoriesV3' test.out

#- 314 PublicGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Mu8Jrq81' \
    --after 'NpX9KYg2' \
    --before 'UPZNIc7t' \
    --limit '73' \
    --platformId 'DliotjDs' \
    > test.out 2>&1
eval_tap $? 314 'PublicGetUserPlatformAccountsV3' test.out

#- 315 PublicListJusticePlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicListJusticePlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'qSxKkm7n' \
    > test.out 2>&1
eval_tap $? 315 'PublicListJusticePlatformAccountsV3' test.out

#- 316 PublicLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam publicLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId '3BmJWb3y' \
    --body '{"platformId": "lP7sv7sY", "platformUserId": "PBvuT5xd"}' \
    > test.out 2>&1
eval_tap $? 316 'PublicLinkPlatformAccount' test.out

#- 317 PublicForceLinkPlatformWithProgression
./ng net.accelbyte.sdk.cli.Main iam publicForceLinkPlatformWithProgression \
    --namespace "$AB_NAMESPACE" \
    --userId 'VLsTvolI' \
    --body '{"chosenNamespaces": ["fwFcb0rZ", "FGAhTuHN", "AAPjH4el"], "requestId": "LlAtbqEW"}' \
    > test.out 2>&1
eval_tap $? 317 'PublicForceLinkPlatformWithProgression' test.out

#- 318 PublicGetPublisherUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetPublisherUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Uicc00qH' \
    > test.out 2>&1
eval_tap $? 318 'PublicGetPublisherUserV3' test.out

#- 319 PublicValidateUserByUserIDAndPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserByUserIDAndPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '6h9IFtJW' \
    --password '8OduqjUX' \
    > test.out 2>&1
eval_tap $? 319 'PublicValidateUserByUserIDAndPasswordV3' test.out

#- 320 PublicGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRolesV3 \
    --after 'J1boN25K' \
    --before 'QDTOuH8W' \
    --isWildcard  \
    --limit '0' \
    > test.out 2>&1
eval_tap $? 320 'PublicGetRolesV3' test.out

#- 321 PublicGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRoleV3 \
    --roleId 'BpwJkaMI' \
    > test.out 2>&1
eval_tap $? 321 'PublicGetRoleV3' test.out

#- 322 PublicForgotPasswordWithoutNamespaceV3
./ng net.accelbyte.sdk.cli.Main iam publicForgotPasswordWithoutNamespaceV3 \
    --body '{"clientId": "ijzK6ODN", "emailAddress": "AdYmQBOQ", "languageTag": "KJfBLaLP"}' \
    > test.out 2>&1
eval_tap $? 322 'PublicForgotPasswordWithoutNamespaceV3' test.out

#- 323 PublicGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyUserV3 \
    --includeAllPlatforms  \
    > test.out 2>&1
eval_tap $? 323 'PublicGetMyUserV3' test.out

#- 324 PublicSendCodeForwardV3
./ng net.accelbyte.sdk.cli.Main iam publicSendCodeForwardV3 \
    --body '{"context": "oV5QAYSU", "emailAddress": "zY4n7zn1", "languageTag": "BRQ9O6aq", "upgradeToken": "kjBAzTDo"}' \
    > test.out 2>&1
eval_tap $? 324 'PublicSendCodeForwardV3' test.out

#- 325 PublicGetLinkHeadlessAccountToMyAccountConflictV3
./ng net.accelbyte.sdk.cli.Main iam publicGetLinkHeadlessAccountToMyAccountConflictV3 \
    --oneTimeLinkCode '68oubxiD' \
    > test.out 2>&1
eval_tap $? 325 'PublicGetLinkHeadlessAccountToMyAccountConflictV3' test.out

#- 326 LinkHeadlessAccountToMyAccountV3
./ng net.accelbyte.sdk.cli.Main iam linkHeadlessAccountToMyAccountV3 \
    --body '{"chosenNamespaces": ["eIl2ZNeR", "UeFSIQUD", "VflfC0Dd"], "oneTimeLinkCode": "l13cl1wF"}' \
    > test.out 2>&1
eval_tap $? 326 'LinkHeadlessAccountToMyAccountV3' test.out

#- 327 PublicGetMyRedirectionAfterLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyRedirectionAfterLinkV3 \
    --oneTimeLinkCode '71F4muBc' \
    > test.out 2>&1
eval_tap $? 327 'PublicGetMyRedirectionAfterLinkV3' test.out

#- 328 PublicGetMyProfileAllowUpdateStatusV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyProfileAllowUpdateStatusV3 \
    > test.out 2>&1
eval_tap $? 328 'PublicGetMyProfileAllowUpdateStatusV3' test.out

#- 329 PublicSendVerificationLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationLinkV3 \
    --body '{"languageTag": "6I1mhD1L"}' \
    > test.out 2>&1
eval_tap $? 329 'PublicSendVerificationLinkV3' test.out

#- 330 PublicGetOpenidUserInfoV3
./ng net.accelbyte.sdk.cli.Main iam publicGetOpenidUserInfoV3 \
    > test.out 2>&1
eval_tap $? 330 'PublicGetOpenidUserInfoV3' test.out

#- 331 PublicVerifyUserByLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyUserByLinkV3 \
    --code '5r4cwRIf' \
    > test.out 2>&1
eval_tap $? 331 'PublicVerifyUserByLinkV3' test.out

#- 332 PlatformAuthenticateSAMLV3Handler
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticateSAMLV3Handler \
    --platformId '0Xav0eMt' \
    --code '5aGiEH3A' \
    --error 'xuTlLont' \
    --state 'kd1kEEgv' \
    > test.out 2>&1
eval_tap $? 332 'PlatformAuthenticateSAMLV3Handler' test.out

#- 333 LoginSSOClient
./ng net.accelbyte.sdk.cli.Main iam loginSSOClient \
    --platformId '1bkRJNvx' \
    --payload 'TlmvqcOS' \
    > test.out 2>&1
eval_tap $? 333 'LoginSSOClient' test.out

#- 334 LogoutSSOClient
./ng net.accelbyte.sdk.cli.Main iam logoutSSOClient \
    --platformId 'TjNkD0WQ' \
    > test.out 2>&1
eval_tap $? 334 'LogoutSSOClient' test.out

#- 335 RequestTargetTokenResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTargetTokenResponseV3 \
    --additionalData 'Vdw6ZA4E' \
    --code 'Bx2v7ZQk' \
    > test.out 2>&1
eval_tap $? 335 'RequestTargetTokenResponseV3' test.out

#- 336 UpgradeAndAuthenticateForwardV3
./ng net.accelbyte.sdk.cli.Main iam upgradeAndAuthenticateForwardV3 \
    --clientId 'fYfbHgci' \
    --upgradeSuccessToken '8svrfPNe' \
    > test.out 2>&1
eval_tap $? 336 'UpgradeAndAuthenticateForwardV3' test.out

#- 337 AdminListInvitationHistoriesV4
./ng net.accelbyte.sdk.cli.Main iam adminListInvitationHistoriesV4 \
    --limit '23' \
    --namespace "$AB_NAMESPACE" \
    --offset '39' \
    > test.out 2>&1
eval_tap $? 337 'AdminListInvitationHistoriesV4' test.out

#- 338 AdminGetDevicesByUserV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDevicesByUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'rwoArQzq' \
    > test.out 2>&1
eval_tap $? 338 'AdminGetDevicesByUserV4' test.out

#- 339 AdminGetBannedDevicesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedDevicesV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceType 'bb2cVxwN' \
    --endDate 'Y5o2bCT0' \
    --limit '45' \
    --offset '45' \
    --startDate '0J4AuNlC' \
    > test.out 2>&1
eval_tap $? 339 'AdminGetBannedDevicesV4' test.out

#- 340 AdminGetUserDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeviceBansV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'vLnGPjqn' \
    > test.out 2>&1
eval_tap $? 340 'AdminGetUserDeviceBansV4' test.out

#- 341 AdminBanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminBanDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"comment": "oZ1OusZU", "deviceId": "vvUCgVqo", "deviceType": "ORStul4Q", "enabled": true, "endDate": "DbDDDNrq", "ext": {"mFa7RWLT": {}, "95Ng4esz": {}, "7lodFzIS": {}}, "reason": "f7vGMZdL"}' \
    > test.out 2>&1
eval_tap $? 341 'AdminBanDeviceV4' test.out

#- 342 AdminGetDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBanV4 \
    --banId 'BPG2GLrP' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 342 'AdminGetDeviceBanV4' test.out

#- 343 AdminUpdateDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateDeviceBanV4 \
    --banId 'hkszUGZ0' \
    --namespace "$AB_NAMESPACE" \
    --body '{"enabled": true}' \
    > test.out 2>&1
eval_tap $? 343 'AdminUpdateDeviceBanV4' test.out

#- 344 AdminGenerateReportV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateReportV4 \
    --namespace "$AB_NAMESPACE" \
    --endDate 'vEIxJwR8' \
    --startDate 'Kij1KALA' \
    --deviceType 'ExXj5h13' \
    > test.out 2>&1
eval_tap $? 344 'AdminGenerateReportV4' test.out

#- 345 AdminGetDeviceTypesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceTypesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 345 'AdminGetDeviceTypesV4' test.out

#- 346 AdminGetDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBansV4 \
    --deviceId '45uX2YgF' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 346 'AdminGetDeviceBansV4' test.out

#- 347 AdminDecryptDeviceV4
eval_tap 0 347 'AdminDecryptDeviceV4 # SKIP deprecated' test.out

#- 348 AdminUnbanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminUnbanDeviceV4 \
    --deviceId 'vrEi0OQs' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 348 'AdminUnbanDeviceV4' test.out

#- 349 AdminGetUsersByDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUsersByDeviceV4 \
    --deviceId 'XivPe0Q1' \
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
    --limit '79' \
    --offset '68' \
    > test.out 2>&1
eval_tap $? 351 'AdminGetNamespaceUserInvitationHistoryV4' test.out

#- 352 AdminCreateTestUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateTestUsersV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "z6ttiFsh", "policyId": "AbMzWX9B", "policyVersionId": "IAqtT1eC"}, {"isAccepted": true, "localizedPolicyVersionId": "mkShsJD4", "policyId": "LqPqWIa1", "policyVersionId": "TPkG1VHe"}, {"isAccepted": false, "localizedPolicyVersionId": "9eC9h8lI", "policyId": "VPjE8odY", "policyVersionId": "wOIyfBVO"}], "count": 59, "userInfo": {"country": "u5YSyjVl"}}' \
    > test.out 2>&1
eval_tap $? 352 'AdminCreateTestUsersV4' test.out

#- 353 AdminCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "sttRgtvB", "policyId": "goVioFAm", "policyVersionId": "Ax3aQKQn"}, {"isAccepted": false, "localizedPolicyVersionId": "kKKhgFIw", "policyId": "Tv0HowYA", "policyVersionId": "MwnZAZ1T"}, {"isAccepted": false, "localizedPolicyVersionId": "AiV0c8sX", "policyId": "WyMvLzS5", "policyVersionId": "E9iMaFBp"}], "authType": "EMAILPASSWD", "code": "6RdrVog4", "country": "1Cow1a1v", "dateOfBirth": "wMws4eJg", "displayName": "8yENv4Td", "emailAddress": "Ftu6j6yc", "password": "SyJbUFUv", "passwordMD5Sum": "o85HhjNr", "reachMinimumAge": false, "uniqueDisplayName": "g3gUw5X5", "username": "svM5697P"}' \
    > test.out 2>&1
eval_tap $? 353 'AdminCreateUserV4' test.out

#- 354 AdminBulkUpdateUserAccountTypeV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateUserAccountTypeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"testAccount": true, "userIds": ["svqmiJ93", "C7mM60cz", "U9sVzniU"]}' \
    > test.out 2>&1
eval_tap $? 354 'AdminBulkUpdateUserAccountTypeV4' test.out

#- 355 AdminBulkCheckValidUserIDV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkCheckValidUserIDV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["jeG3wZIp", "ZEk8TJa1", "GsHRb5of"]}' \
    > test.out 2>&1
eval_tap $? 355 'AdminBulkCheckValidUserIDV4' test.out

#- 356 AdminUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'V21Nm0Zh' \
    --body '{"avatarUrl": "uUUwFXP8", "country": "GLtJMlLY", "dateOfBirth": "qnrzC8hG", "displayName": "8wIrbhzj", "languageTag": "nVztvOXO", "skipLoginQueue": false, "tags": ["5u3Wbzy5", "QX7oOMQC", "12798Z20"], "uniqueDisplayName": "ZJU7TT9P", "userName": "5D8FhzY9"}' \
    > test.out 2>&1
eval_tap $? 356 'AdminUpdateUserV4' test.out

#- 357 AdminUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'dgFj3rd1' \
    --body '{"code": "AMFn0G4x", "emailAddress": "F80xWoBO"}' \
    > test.out 2>&1
eval_tap $? 357 'AdminUpdateUserEmailAddressV4' test.out

#- 358 AdminDisableUserMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableUserMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '8iuUwMtv' \
    --body '{"factor": "sub8Q72x", "mfaToken": "IeQq7Hyp"}' \
    > test.out 2>&1
eval_tap $? 358 'AdminDisableUserMFAV4' test.out

#- 359 AdminGetUserMFAStatusV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUserMFAStatusV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'HaYaVBql' \
    > test.out 2>&1
eval_tap $? 359 'AdminGetUserMFAStatusV4' test.out

#- 360 AdminListUserRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminListUserRolesV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '6myIuzxJ' \
    > test.out 2>&1
eval_tap $? 360 'AdminListUserRolesV4' test.out

#- 361 AdminUpdateUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'UQlHYPwU' \
    --body '{"assignedNamespaces": ["qfXsHmAC", "HHO1DqK7", "ZRPJ5ebj"], "roleId": "E4ToZbRX"}' \
    > test.out 2>&1
eval_tap $? 361 'AdminUpdateUserRoleV4' test.out

#- 362 AdminAddUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'RZklTd7I' \
    --body '{"assignedNamespaces": ["8ydPL932", "Y8yrTDTp", "VPKao5ny"], "roleId": "F9LEsqMd"}' \
    > test.out 2>&1
eval_tap $? 362 'AdminAddUserRoleV4' test.out

#- 363 AdminRemoveUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRemoveUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'xAUaVih8' \
    --body '{"assignedNamespaces": ["XLaDMVHV", "RvIFghuz", "5YGCwYdz"], "roleId": "5elHRUeE"}' \
    > test.out 2>&1
eval_tap $? 363 'AdminRemoveUserRoleV4' test.out

#- 364 AdminGetRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV4 \
    --adminRole  \
    --isWildcard  \
    --limit '75' \
    --offset '17' \
    > test.out 2>&1
eval_tap $? 364 'AdminGetRolesV4' test.out

#- 365 AdminCreateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV4 \
    --body '{"adminRole": true, "deletable": false, "isWildcard": false, "roleName": "Mk3dk8Ts"}' \
    > test.out 2>&1
eval_tap $? 365 'AdminCreateRoleV4' test.out

#- 366 AdminGetRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV4 \
    --roleId '8VESKYK8' \
    > test.out 2>&1
eval_tap $? 366 'AdminGetRoleV4' test.out

#- 367 AdminDeleteRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV4 \
    --roleId '9GTmggFE' \
    > test.out 2>&1
eval_tap $? 367 'AdminDeleteRoleV4' test.out

#- 368 AdminUpdateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV4 \
    --roleId 'YlZVhKi4' \
    --body '{"adminRole": true, "deletable": true, "isWildcard": true, "roleName": "FvDhwcqw"}' \
    > test.out 2>&1
eval_tap $? 368 'AdminUpdateRoleV4' test.out

#- 369 AdminUpdateRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV4 \
    --roleId 'Mx5QYANP' \
    --body '{"permissions": [{"action": 20, "resource": "6PS7DRIA", "schedAction": 35, "schedCron": "Xb3YoL8Q", "schedRange": ["d6fwbPyp", "Lq7QlMqv", "ExHlcv5E"]}, {"action": 16, "resource": "0HMwkjFg", "schedAction": 42, "schedCron": "Gclaqn8M", "schedRange": ["VNPX7e2D", "EhLpyX6Z", "3TJheRk2"]}, {"action": 41, "resource": "n3Uv987a", "schedAction": 94, "schedCron": "kjLuVVCB", "schedRange": ["aJieON9O", "mykwa8kG", "Khhhx1xZ"]}]}' \
    > test.out 2>&1
eval_tap $? 369 'AdminUpdateRolePermissionsV4' test.out

#- 370 AdminAddRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV4 \
    --roleId 'KoEKlcHf' \
    --body '{"permissions": [{"action": 5, "resource": "lCyyeLNc", "schedAction": 19, "schedCron": "dEKh9RRr", "schedRange": ["xzCj9mjg", "VoufylmL", "3YEGLNKA"]}, {"action": 29, "resource": "9liHcYn6", "schedAction": 86, "schedCron": "Y2TQYwtp", "schedRange": ["MCjNf1G6", "3dBBE0Wg", "5OiGF2bD"]}, {"action": 46, "resource": "15UYjIlf", "schedAction": 1, "schedCron": "k3mowPaL", "schedRange": ["kGsBmfWr", "QlzDN6o6", "9dqBk72P"]}]}' \
    > test.out 2>&1
eval_tap $? 370 'AdminAddRolePermissionsV4' test.out

#- 371 AdminDeleteRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV4 \
    --roleId 'EjC0qHFZ' \
    --body '["PjmOwIDp", "hTBBY66g", "pCWiFSFR"]' \
    > test.out 2>&1
eval_tap $? 371 'AdminDeleteRolePermissionsV4' test.out

#- 372 AdminListAssignedUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminListAssignedUsersV4 \
    --roleId 'WJoSWIYf' \
    --after 'CJRKBG5e' \
    --before 'RRxujI1W' \
    --limit '30' \
    > test.out 2>&1
eval_tap $? 372 'AdminListAssignedUsersV4' test.out

#- 373 AdminAssignUserToRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAssignUserToRoleV4 \
    --roleId 'hTtl3FbV' \
    --body '{"assignedNamespaces": ["3syRmn0g", "EJNYO3RJ", "tvxvHMQj"], "namespace": "JhBt4Ter", "userId": "kcQdEz6l"}' \
    > test.out 2>&1
eval_tap $? 373 'AdminAssignUserToRoleV4' test.out

#- 374 AdminRevokeUserFromRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRevokeUserFromRoleV4 \
    --roleId 'c33NWkMy' \
    --body '{"namespace": "P6n9Abt3", "userId": "w8rdPvYv"}' \
    > test.out 2>&1
eval_tap $? 374 'AdminRevokeUserFromRoleV4' test.out

#- 375 AdminInviteUserNewV4
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserNewV4 \
    --body '{"assignedNamespaces": ["3dr1WSG3", "ocKwoaWV", "7EUOeUYl"], "emailAddresses": ["HmHU7f9A", "Fo9Ia9pF", "P7G7TbXy"], "isAdmin": true, "isNewStudio": true, "languageTag": "qlCQRzs8", "namespace": "KK5XmgIT", "roleId": "4VXGYoY8"}' \
    > test.out 2>&1
eval_tap $? 375 'AdminInviteUserNewV4' test.out

#- 376 AdminUpdateMyUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateMyUserV4 \
    --body '{"avatarUrl": "Hh0yl28B", "country": "WZk1Klta", "dateOfBirth": "3xc4yfqi", "displayName": "gsiOmw4d", "languageTag": "ECQSj9DE", "skipLoginQueue": false, "tags": ["qcZw3Brd", "jzK1Gomk", "jrlnNrw3"], "uniqueDisplayName": "tb3WO3jr", "userName": "mLQI0Y4x"}' \
    > test.out 2>&1
eval_tap $? 376 'AdminUpdateMyUserV4' test.out

#- 377 AdminDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyAuthenticatorV4 \
    --body '{"factor": "OLfb5tzo", "mfaToken": "jkv3ITqv"}' \
    > test.out 2>&1
eval_tap $? 377 'AdminDisableMyAuthenticatorV4' test.out

#- 378 AdminEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyAuthenticatorV4 \
    --code 'iju1W0p1' \
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
    --body '{"factor": "t1U541Pk", "mfaToken": "QMQdYqRF"}' \
    > test.out 2>&1
eval_tap $? 382 'AdminDisableMyBackupCodesV4' test.out

#- 383 AdminDownloadMyBackupCodesV4
eval_tap 0 383 'AdminDownloadMyBackupCodesV4 # SKIP deprecated' test.out

#- 384 AdminEnableMyBackupCodesV4
eval_tap 0 384 'AdminEnableMyBackupCodesV4 # SKIP deprecated' test.out

#- 385 AdminGetBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBackupCodesV4 \
    --languageTag 'dR3wNVqP' \
    > test.out 2>&1
eval_tap $? 385 'AdminGetBackupCodesV4' test.out

#- 386 AdminGenerateBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateBackupCodesV4 \
    --languageTag 'ficXBjfw' \
    > test.out 2>&1
eval_tap $? 386 'AdminGenerateBackupCodesV4' test.out

#- 387 AdminEnableBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableBackupCodesV4 \
    --languageTag 'WXNwaJsD' \
    > test.out 2>&1
eval_tap $? 387 'AdminEnableBackupCodesV4' test.out

#- 388 AdminChallengeMyMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminChallengeMyMFAV4 \
    --code 'lEynYAFQ' \
    --factor 'cXFdduqp' \
    > test.out 2>&1
eval_tap $? 388 'AdminChallengeMyMFAV4' test.out

#- 389 AdminSendMyMFAEmailCodeV4
./ng net.accelbyte.sdk.cli.Main iam adminSendMyMFAEmailCodeV4 \
    --action 'VGnMdzA5' \
    --languageTag 'LW5mQi8E' \
    > test.out 2>&1
eval_tap $? 389 'AdminSendMyMFAEmailCodeV4' test.out

#- 390 AdminDisableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyEmailV4 \
    --body '{"factor": "fIPmE1zF", "mfaToken": "YWyxsw7I"}' \
    > test.out 2>&1
eval_tap $? 390 'AdminDisableMyEmailV4' test.out

#- 391 AdminEnableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyEmailV4 \
    --code 'On7ik8bO' \
    > test.out 2>&1
eval_tap $? 391 'AdminEnableMyEmailV4' test.out

#- 392 AdminGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyEnabledFactorsV4 \
    > test.out 2>&1
eval_tap $? 392 'AdminGetMyEnabledFactorsV4' test.out

#- 393 AdminMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam adminMakeFactorMyDefaultV4 \
    --factor 'S67ZKd2i' \
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
    --clientId 'dILbbxcx' \
    --linkingToken '67v9TcgJ' \
    --password 'ANqH2FbM' \
    --username 'cZACUWe9' \
    > test.out 2>&1
eval_tap $? 397 'AuthenticationWithPlatformLinkV4' test.out

#- 398 GenerateTokenByNewHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV4 \
    --additionalData 'J33bg0hc' \
    --extendExp  \
    --linkingToken 'MHSJzG4m' \
    > test.out 2>&1
eval_tap $? 398 'GenerateTokenByNewHeadlessAccountV4' test.out

#- 399 Verify2faCodeV4
./ng net.accelbyte.sdk.cli.Main iam verify2faCodeV4 \
    --code 'B1L3yecB' \
    --factor '4B8YhLVV' \
    --mfaToken 'UZJGWube' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 399 'Verify2faCodeV4' test.out

#- 400 PlatformTokenGrantV4
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV4 \
    --platformId 'E8Y5feCB' \
    --codeChallenge 'Um87m94f' \
    --codeChallengeMethod 'S256' \
    --additionalData 'zafBXYi2' \
    --clientId 'tAhJEczT' \
    --createHeadless  \
    --deviceId 'qalLeI9E' \
    --macAddress 'XDIuVo40' \
    --platformToken '6wQx7E39' \
    --serviceLabel '0.9163831548199306' \
    --skipSetCookie  \
    > test.out 2>&1
eval_tap $? 400 'PlatformTokenGrantV4' test.out

#- 401 SimultaneousLoginV4
./ng net.accelbyte.sdk.cli.Main iam simultaneousLoginV4 \
    --codeChallenge '7bqoX8tP' \
    --codeChallengeMethod 'S256' \
    --simultaneousPlatform 'wLUTQ3Fu' \
    --simultaneousTicket 'MhQU9Ggp' \
    --nativePlatform 'steam' \
    --nativePlatformTicket '3FQjgPn1' \
    > test.out 2>&1
eval_tap $? 401 'SimultaneousLoginV4' test.out

#- 402 TokenGrantV4
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV4 \
    --codeChallenge 'HQCsD93b' \
    --codeChallengeMethod 'S256' \
    --additionalData 'UO99pixT' \
    --clientId 'ZWr26020' \
    --clientSecret 'WyZC2nFt' \
    --code 'sIpM2BsC' \
    --codeVerifier 'TbPWeOMo' \
    --extendNamespace 'NnPLlD0s' \
    --extendExp  \
    --loginQueueTicket 'F7lFm31H' \
    --password 'xoTkA2Kd' \
    --redirectUri 'Su0x8Qyq' \
    --refreshToken '6cGedPxD' \
    --scope 'eEaO0Lgt' \
    --username 'QnAY3JsZ' \
    --grantType 'urn:ietf:params:oauth:grant-type:extend_client_credentials' \
    > test.out 2>&1
eval_tap $? 402 'TokenGrantV4' test.out

#- 403 RequestTargetTokenResponseV4
./ng net.accelbyte.sdk.cli.Main iam requestTargetTokenResponseV4 \
    --additionalData 'xOzdLdKJ' \
    --code 'O6QiAx4J' \
    > test.out 2>&1
eval_tap $? 403 'RequestTargetTokenResponseV4' test.out

#- 404 PublicListUserIDByPlatformUserIDsV4
./ng net.accelbyte.sdk.cli.Main iam publicListUserIDByPlatformUserIDsV4 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'AgLEGvCi' \
    --rawPUID  \
    --body '{"pidType": "L3LMcvi2", "platformUserIds": ["md5giOYw", "xded1nSW", "TGFtCUfU"]}' \
    > test.out 2>&1
eval_tap $? 404 'PublicListUserIDByPlatformUserIDsV4' test.out

#- 405 PublicGetUserByPlatformUserIDV4
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByPlatformUserIDV4 \
    --namespace "$AB_NAMESPACE" \
    --platformId '1pNJYkMF' \
    --platformUserId 'cmw2Ab0x' \
    > test.out 2>&1
eval_tap $? 405 'PublicGetUserByPlatformUserIDV4' test.out

#- 406 PublicCreateTestUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateTestUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "CVOCQygS", "policyId": "3n8xQ0AH", "policyVersionId": "EOyorSD5"}, {"isAccepted": false, "localizedPolicyVersionId": "spzZaTb1", "policyId": "C33PPctQ", "policyVersionId": "mLc5ZRX6"}, {"isAccepted": true, "localizedPolicyVersionId": "RjScb3ug", "policyId": "LhBMeb9q", "policyVersionId": "RbSnT5fu"}], "authType": "EMAILPASSWD", "country": "JltkmIbj", "dateOfBirth": "KwGmrIQk", "displayName": "u8MTow7d", "emailAddress": "oGppEt4S", "password": "X6rlTGtc", "passwordMD5Sum": "7IihW2yo", "uniqueDisplayName": "fCnuMUly", "username": "LB1WB3PU", "verified": true}' \
    > test.out 2>&1
eval_tap $? 406 'PublicCreateTestUserV4' test.out

#- 407 PublicCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "qcwXMcBv", "policyId": "6F0aCqg2", "policyVersionId": "LWDu3qbH"}, {"isAccepted": true, "localizedPolicyVersionId": "2Eqqscdk", "policyId": "Yiax2TEw", "policyVersionId": "04TLwlvx"}, {"isAccepted": false, "localizedPolicyVersionId": "I7ks2U12", "policyId": "bii2h6Xb", "policyVersionId": "KPjP3Lat"}], "authType": "EMAILPASSWD", "code": "pHOeKa20", "country": "s2lziZWj", "dateOfBirth": "3eqDzriw", "displayName": "BUCnFRpH", "emailAddress": "6eEsdyOH", "password": "E3aYdJLV", "passwordMD5Sum": "Dzx9Ovm5", "reachMinimumAge": true, "uniqueDisplayName": "fCO9G5fq", "username": "v7o0xuU4"}' \
    > test.out 2>&1
eval_tap $? 407 'PublicCreateUserV4' test.out

#- 408 CreateUserFromInvitationV4
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV4 \
    --invitationId 'aMeePMhN' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "IGkRBySU", "policyId": "C7xFktLf", "policyVersionId": "R3MmWTTz"}, {"isAccepted": true, "localizedPolicyVersionId": "jfDkM35P", "policyId": "7qHYurL4", "policyVersionId": "S7ms1Io4"}, {"isAccepted": false, "localizedPolicyVersionId": "vc2JnmnC", "policyId": "EqNhGuZN", "policyVersionId": "m1vWPizY"}], "authType": "EMAILPASSWD", "code": "LYPcV3iF", "country": "sktRyYgp", "dateOfBirth": "yJmfxlZv", "displayName": "5K1dNxX8", "emailAddress": "HmYZLAnl", "password": "RSgCbCxy", "passwordMD5Sum": "kpWY3OzY", "reachMinimumAge": true, "uniqueDisplayName": "nMkwTxyM", "username": "QtONKckk"}' \
    > test.out 2>&1
eval_tap $? 408 'CreateUserFromInvitationV4' test.out

#- 409 PublicUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "MPOkk5aE", "country": "HsTl1oJM", "dateOfBirth": "Xim6dimR", "displayName": "JOFyPxnD", "languageTag": "LofKe6Nw", "uniqueDisplayName": "3M6IdeIp", "userName": "bcku0hPt"}' \
    > test.out 2>&1
eval_tap $? 409 'PublicUpdateUserV4' test.out

#- 410 PublicUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "o1ddEhim", "emailAddress": "8DaK1kO3"}' \
    > test.out 2>&1
eval_tap $? 410 'PublicUpdateUserEmailAddressV4' test.out

#- 411 PublicUpgradeHeadlessAccountWithVerificationCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountWithVerificationCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "gBjvaQLG", "country": "nbOlzWML", "dateOfBirth": "OG3KR6iE", "displayName": "RFe4LW2x", "emailAddress": "h4buC7mu", "password": "MBtlHRUF", "reachMinimumAge": false, "uniqueDisplayName": "19U6yU8o", "username": "YDsPoZac", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 411 'PublicUpgradeHeadlessAccountWithVerificationCodeV4' test.out

#- 412 PublicUpgradeHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"dateOfBirth": "gSF8q24U", "displayName": "0CcbR8zS", "emailAddress": "11nQDjIT", "password": "oPVbPee9", "uniqueDisplayName": "zj65ITtz", "username": "pua9nJpZ"}' \
    > test.out 2>&1
eval_tap $? 412 'PublicUpgradeHeadlessAccountV4' test.out

#- 413 PublicDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"factor": "aragZABP", "mfaToken": "vXonGiQK"}' \
    > test.out 2>&1
eval_tap $? 413 'PublicDisableMyAuthenticatorV4' test.out

#- 414 PublicEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    --code '4AUdz5Fz' \
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
    --body '{"factor": "k3irHiYj", "mfaToken": "p0RCaTXz"}' \
    > test.out 2>&1
eval_tap $? 418 'PublicDisableMyBackupCodesV4' test.out

#- 419 PublicDownloadMyBackupCodesV4
eval_tap 0 419 'PublicDownloadMyBackupCodesV4 # SKIP deprecated' test.out

#- 420 PublicEnableMyBackupCodesV4
eval_tap 0 420 'PublicEnableMyBackupCodesV4 # SKIP deprecated' test.out

#- 421 PublicGetBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGetBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --languageTag 'gp6t8xAW' \
    > test.out 2>&1
eval_tap $? 421 'PublicGetBackupCodesV4' test.out

#- 422 PublicGenerateBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --languageTag 'W7Fv27fW' \
    > test.out 2>&1
eval_tap $? 422 'PublicGenerateBackupCodesV4' test.out

#- 423 PublicEnableBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --languageTag 'BQrL39PJ' \
    > test.out 2>&1
eval_tap $? 423 'PublicEnableBackupCodesV4' test.out

#- 424 PublicChallengeMyMFAV4
./ng net.accelbyte.sdk.cli.Main iam publicChallengeMyMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'TYGm6Dju' \
    --factor '3W2aqVJB' \
    > test.out 2>&1
eval_tap $? 424 'PublicChallengeMyMFAV4' test.out

#- 425 PublicRemoveTrustedDeviceV4
./ng net.accelbyte.sdk.cli.Main iam publicRemoveTrustedDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceToken 'KgP8p4is' \
    > test.out 2>&1
eval_tap $? 425 'PublicRemoveTrustedDeviceV4' test.out

#- 426 PublicSendMyMFAEmailCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicSendMyMFAEmailCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --action 'CL09nKWY' \
    --languageTag 'Wm1pKnJf' \
    > test.out 2>&1
eval_tap $? 426 'PublicSendMyMFAEmailCodeV4' test.out

#- 427 PublicDisableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyEmailV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"factor": "WYhlnPUS", "mfaToken": "mAKmhOhN"}' \
    > test.out 2>&1
eval_tap $? 427 'PublicDisableMyEmailV4' test.out

#- 428 PublicEnableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyEmailV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'tPdWcZ40' \
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
    --factor '6Q8e9L0e' \
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
    --userId '3zNQOZp3' \
    > test.out 2>&1
eval_tap $? 433 'PublicGetUserPublicInfoByUserIdV4' test.out

#- 434 PublicInviteUserV4
./ng net.accelbyte.sdk.cli.Main iam publicInviteUserV4 \
    --body '{"additionalData": "atBBwWcK", "emailAddress": "pX1ozCqb", "languageTag": "plNPMxCR", "namespace": "EU9OWgoM", "namespaceDisplayName": "21gNRqUE"}' \
    > test.out 2>&1
eval_tap $? 434 'PublicInviteUserV4' test.out

#- 435 PublicUpgradeHeadlessWithCodeV4Forward
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessWithCodeV4Forward \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "GcNW2YZc", "policyId": "ACI4pz00", "policyVersionId": "u6EHx7Gm"}, {"isAccepted": true, "localizedPolicyVersionId": "TvRe5Knc", "policyId": "9rIw8GS0", "policyVersionId": "Qnh96IXL"}, {"isAccepted": true, "localizedPolicyVersionId": "GQ33VhPI", "policyId": "XuAWyfe3", "policyVersionId": "uGhOZADr"}], "code": "fjuXrtBe", "country": "bl3h2Rqy", "dateOfBirth": "aXSZJUF9", "displayName": "dDiXcACU", "emailAddress": "gABVnV4a", "password": "vBuhP8vN", "reachMinimumAge": true, "uniqueDisplayName": "Le98rkqO", "username": "9mSEwFpL", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 435 'PublicUpgradeHeadlessWithCodeV4Forward' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
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
    --body '{"modules": [{"docLink": "AP7hSoA3", "groups": [{"group": "ADreyuXg", "groupId": "rUnhpUnt", "permissions": [{"allowedActions": [100, 33, 61], "resource": "ppzdycOi"}, {"allowedActions": [13, 93, 24], "resource": "Nh3QHA2D"}, {"allowedActions": [94, 21, 1], "resource": "X01QnU5G"}]}, {"group": "djjjxLWm", "groupId": "QRXYdfn0", "permissions": [{"allowedActions": [30, 71, 87], "resource": "q9EkdCz8"}, {"allowedActions": [67, 5, 58], "resource": "hMaa9IHO"}, {"allowedActions": [42, 9, 55], "resource": "zThMZ9rV"}]}, {"group": "Z4zT5iek", "groupId": "TfJEdmiK", "permissions": [{"allowedActions": [64, 15, 64], "resource": "7vjxSXo9"}, {"allowedActions": [15, 77, 44], "resource": "z52eqN2B"}, {"allowedActions": [93, 77, 12], "resource": "itFWFCH8"}]}], "module": "36i3qt9a", "moduleId": "ouM7evwg"}, {"docLink": "Hyd97MEx", "groups": [{"group": "2tEfTmfK", "groupId": "aOExfc34", "permissions": [{"allowedActions": [16, 8, 24], "resource": "kJAF9V5J"}, {"allowedActions": [69, 41, 54], "resource": "mjtiINPB"}, {"allowedActions": [56, 45, 53], "resource": "dW0w0PhU"}]}, {"group": "mk8TzMv8", "groupId": "WjXNIHbZ", "permissions": [{"allowedActions": [20, 17, 37], "resource": "Ve3thgDw"}, {"allowedActions": [15, 7, 80], "resource": "6kd7uV88"}, {"allowedActions": [97, 38, 33], "resource": "0HRswjZx"}]}, {"group": "eye2msl7", "groupId": "19EPvVQK", "permissions": [{"allowedActions": [96, 17, 99], "resource": "rPdpTV2Q"}, {"allowedActions": [68, 42, 19], "resource": "6Q5lZOnk"}, {"allowedActions": [44, 68, 4], "resource": "CGEB0MWS"}]}], "module": "GOFc6Bgo", "moduleId": "djoJtbJg"}, {"docLink": "zIicffPI", "groups": [{"group": "UxNu5zgT", "groupId": "Mut0Z9Qi", "permissions": [{"allowedActions": [93, 42, 100], "resource": "gevznyJD"}, {"allowedActions": [78, 69, 89], "resource": "tq7IMaFn"}, {"allowedActions": [38, 5, 28], "resource": "Tl1R8ebu"}]}, {"group": "GdxqPtc6", "groupId": "8KM94kWu", "permissions": [{"allowedActions": [3, 83, 64], "resource": "i7V87C43"}, {"allowedActions": [84, 74, 21], "resource": "id3NmVQZ"}, {"allowedActions": [78, 34, 71], "resource": "8saPYC2d"}]}, {"group": "jN1Uis7H", "groupId": "LFHTVYGZ", "permissions": [{"allowedActions": [92, 53, 3], "resource": "IZ4nvhBq"}, {"allowedActions": [59, 7, 43], "resource": "KxwK94NP"}, {"allowedActions": [33, 87, 12], "resource": "0MtQooci"}]}], "module": "ramnJqTO", "moduleId": "IuHJACN2"}]}' \
    > test.out 2>&1
eval_tap $? 109 'AdminUpdateAvailablePermissionsByModule' test.out

#- 110 AdminDeleteConfigPermissionsByGroup
./ng net.accelbyte.sdk.cli.Main iam adminDeleteConfigPermissionsByGroup \
    --forceDelete  \
    --body '{"groupId": "RCz5qHKn", "moduleId": "IvBkdBUW"}' \
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
    --body '[{"field": "qiGfWg1f", "validation": {"allowAllSpecialCharacters": true, "allowDigit": false, "allowLetter": true, "allowSpace": true, "allowUnicode": false, "avatarConfig": {"allowedPrefixes": ["Wa5ufahi", "Mza1C8jT", "tuvj0nHW"], "preferRegex": false, "regex": "5WEJf5Wm"}, "blockedWord": ["GxpjAUSR", "hpNoaPP7", "UmkDdmCX"], "description": [{"language": "f42JxjHk", "message": ["RTPsw5rF", "tb2F2cJb", "qKjvgEGi"]}, {"language": "vvqs6OdT", "message": ["i4NdLnTH", "5irKclP5", "Ug9wmKtI"]}, {"language": "p0LVLJQ2", "message": ["zUNltgg5", "Jp0V7ysH", "oq6Y5qS1"]}], "isCustomRegex": true, "letterCase": "k93wA9Ur", "maxLength": 51, "maxRepeatingAlphaNum": 91, "maxRepeatingSpecialCharacter": 5, "minCharType": 67, "minLength": 32, "profanityFilter": "m3Pch6oM", "regex": "vEp6su7N", "specialCharacterLocation": "SQR12uSZ", "specialCharacters": ["xxLwhzrA", "uN3vxm3r", "zarNF6yv"]}}, {"field": "Jd6pV3Z1", "validation": {"allowAllSpecialCharacters": true, "allowDigit": false, "allowLetter": false, "allowSpace": false, "allowUnicode": false, "avatarConfig": {"allowedPrefixes": ["ud4mSlFn", "Jdlr4Z5K", "NbyPXCGm"], "preferRegex": false, "regex": "SJuaWVbm"}, "blockedWord": ["NwM1X5VX", "prgVcCtY", "mBLEP0fc"], "description": [{"language": "NyFWatgJ", "message": ["gpGK8GLc", "DSTjv8SR", "YbzRZE0x"]}, {"language": "QTvgE899", "message": ["ufpkBgPE", "zi1XpmKE", "R5Ugl6Ue"]}, {"language": "874qv6LA", "message": ["4lJPWazl", "tvWVTqjH", "XBaXbWx0"]}], "isCustomRegex": true, "letterCase": "NTcCcKN6", "maxLength": 11, "maxRepeatingAlphaNum": 99, "maxRepeatingSpecialCharacter": 94, "minCharType": 46, "minLength": 57, "profanityFilter": "06FtQoif", "regex": "cdppGPlx", "specialCharacterLocation": "4Vzwua74", "specialCharacters": ["1ovn1l6y", "VQZhKJ80", "Os5cRCd0"]}}, {"field": "uBqvc3eY", "validation": {"allowAllSpecialCharacters": true, "allowDigit": true, "allowLetter": true, "allowSpace": false, "allowUnicode": false, "avatarConfig": {"allowedPrefixes": ["rFdlQLqO", "uCyzbmUw", "Ctvjro80"], "preferRegex": true, "regex": "DdRPCZWE"}, "blockedWord": ["nvuiVV6L", "PHl3iXJM", "mjkSRlHL"], "description": [{"language": "vjPSrxf7", "message": ["qaW1YPol", "yEm7Xc5E", "5tXox3bQ"]}, {"language": "jUHsgSv2", "message": ["9UXsoQob", "5HxlbKG0", "dHMHMBSG"]}, {"language": "PDTMuwMY", "message": ["OsGTpEOW", "kkzA27bN", "akSRLbLt"]}], "isCustomRegex": true, "letterCase": "OQFQFCH7", "maxLength": 32, "maxRepeatingAlphaNum": 47, "maxRepeatingSpecialCharacter": 45, "minCharType": 91, "minLength": 8, "profanityFilter": "COOog1Ao", "regex": "e8fFrFo0", "specialCharacterLocation": "NBalwAwn", "specialCharacters": ["zRkz1Xch", "cUUzajut", "CDYn856Y"]}}]' \
    > test.out 2>&1
eval_tap $? 113 'AdminUpdateInputValidations' test.out

#- 114 AdminResetInputValidations
./ng net.accelbyte.sdk.cli.Main iam adminResetInputValidations \
    --field 'UnlimIMq' \
    > test.out 2>&1
eval_tap $? 114 'AdminResetInputValidations' test.out

#- 115 ListAdminsV3
./ng net.accelbyte.sdk.cli.Main iam listAdminsV3 \
    --namespace "$AB_NAMESPACE" \
    --after 'kLaP8Ob1' \
    --before 'S1i5Aibe' \
    --endDate 'YrfnWrKH' \
    --limit '63' \
    --query 'in84e3zr' \
    --roleId 'ht4Y3FY0' \
    --startDate 'y1kZYe34' \
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
    --body '{"ageRestriction": 13, "enable": false}' \
    > test.out 2>&1
eval_tap $? 117 'AdminUpdateAgeRestrictionConfigV3' test.out

#- 118 AdminGetListCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminGetListCountryAgeRestrictionV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 118 'AdminGetListCountryAgeRestrictionV3' test.out

#- 119 AdminUpdateCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateCountryAgeRestrictionV3 \
    --countryCode 'xjkUFiX1' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ageRestriction": 19}' \
    > test.out 2>&1
eval_tap $? 119 'AdminUpdateCountryAgeRestrictionV3' test.out

#- 120 AdminGetBannedUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType 'R6gwv71M' \
    --limit '38' \
    --offset '4' \
    > test.out 2>&1
eval_tap $? 120 'AdminGetBannedUsersV3' test.out

#- 121 AdminBanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"ban": "PW5TFkLR", "comment": "9NsB4fHA", "endDate": "Sz7TCT0N", "reason": "zAVMtXvq", "skipNotif": false, "userIds": ["eajs56I9", "yRgnMki3", "7hOKEaU5"]}' \
    > test.out 2>&1
eval_tap $? 121 'AdminBanUserBulkV3' test.out

#- 122 AdminUnbanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminUnbanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"bans": [{"banId": "7MbzrIQl", "userId": "SO5hiZvR"}, {"banId": "tqGU5GDe", "userId": "iTkI6ijz"}, {"banId": "nVKmHdVN", "userId": "iGtitc1c"}]}' \
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
    --clientId 'qQGOcIba' \
    --clientName '2dpYQpxH' \
    --clientType 'CUTfIIeX' \
    --limit '9' \
    --offset '64' \
    --skipLoginQueue  \
    > test.out 2>&1
eval_tap $? 124 'AdminGetClientsByNamespaceV3' test.out

#- 125 AdminBulkUpdateClientsV3
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateClientsV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientIds": ["p6XXLUkU", "6SfioDDa", "9UEjt6lv"], "clientUpdateRequest": {"audiences": ["ByPr0ZKq", "t2noGLVA", "QKf65dd9"], "baseUri": "2DF3iCjO", "clientName": "NHNYL1wZ", "clientPermissions": [{"action": 70, "resource": "mjiVRk83", "schedAction": 42, "schedCron": "GARKq7Qp", "schedRange": ["9Qv8tIfE", "tOebHYNx", "E9qZ9zzQ"]}, {"action": 41, "resource": "5UesSY4B", "schedAction": 58, "schedCron": "dmkujoO0", "schedRange": ["Rwv9FU8N", "BDWkaGsu", "d4KcGNzu"]}, {"action": 22, "resource": "20m2lkW4", "schedAction": 65, "schedCron": "6sC89ORn", "schedRange": ["1JHiGEeU", "i7oRtWDP", "3up56uPc"]}], "clientPlatform": "5DhBOYMa", "deletable": false, "description": "AvQLmSUj", "modulePermissions": [{"moduleId": "dLZdJNH7", "selectedGroups": [{"groupId": "qsuUT1GO", "selectedActions": [46, 59, 89]}, {"groupId": "yS93XlxI", "selectedActions": [13, 100, 79]}, {"groupId": "zjWWjtJF", "selectedActions": [29, 31, 65]}]}, {"moduleId": "ecLUSKPM", "selectedGroups": [{"groupId": "kByo3ums", "selectedActions": [0, 56, 85]}, {"groupId": "k2IpUQIf", "selectedActions": [67, 28, 73]}, {"groupId": "zsxFMZTJ", "selectedActions": [1, 13, 50]}]}, {"moduleId": "D03HfBwt", "selectedGroups": [{"groupId": "vwcwsE5V", "selectedActions": [98, 95, 52]}, {"groupId": "a1M66kig", "selectedActions": [30, 41, 59]}, {"groupId": "3Off8pLM", "selectedActions": [49, 4, 45]}]}], "namespace": "79gVFuGw", "oauthAccessTokenExpiration": 27, "oauthAccessTokenExpirationTimeUnit": "pYiYxV5i", "oauthRefreshTokenExpiration": 87, "oauthRefreshTokenExpirationTimeUnit": "SrWGrOJ2", "redirectUri": "NsYI80N0", "scopes": ["V1EAn3EF", "kbBl1YPn", "4ifdugSu"], "skipLoginQueue": true, "twoFactorEnabled": false}}' \
    > test.out 2>&1
eval_tap $? 125 'AdminBulkUpdateClientsV3' test.out

#- 126 AdminCreateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateClientV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["RJcFBV3X", "WJdNtvo0", "Pssm4abO"], "baseUri": "XxVUzw3c", "clientId": "3UZNXq45", "clientName": "JfxLXFpi", "clientPermissions": [{"action": 3, "resource": "TPS3iZ4M", "schedAction": 34, "schedCron": "eGFgTzw4", "schedRange": ["142SpZNh", "ucQAxS2t", "f8zgPdYH"]}, {"action": 99, "resource": "xHMPWKrO", "schedAction": 90, "schedCron": "GrTf93L2", "schedRange": ["xEKbR3zN", "k6SUNg2O", "hw0oMC1s"]}, {"action": 18, "resource": "oiGtU4xk", "schedAction": 28, "schedCron": "c9zEK4iP", "schedRange": ["bUrGEu49", "h4OH0FKH", "UuT24TfA"]}], "clientPlatform": "Lqc962uZ", "deletable": false, "description": "VQrDNsWL", "modulePermissions": [{"moduleId": "QArlMaHm", "selectedGroups": [{"groupId": "fNIoIgra", "selectedActions": [89, 25, 93]}, {"groupId": "tuD7fIet", "selectedActions": [25, 19, 84]}, {"groupId": "Dw0EJ6Tn", "selectedActions": [37, 56, 37]}]}, {"moduleId": "QFQ8VI7k", "selectedGroups": [{"groupId": "U2S42i16", "selectedActions": [31, 18, 52]}, {"groupId": "B2j3dhLI", "selectedActions": [42, 44, 3]}, {"groupId": "hGp0aBrE", "selectedActions": [91, 16, 18]}]}, {"moduleId": "7VDz7fLY", "selectedGroups": [{"groupId": "IuhCQEXI", "selectedActions": [63, 61, 14]}, {"groupId": "NGpp8AJ4", "selectedActions": [76, 70, 62]}, {"groupId": "WVBPZrDZ", "selectedActions": [36, 75, 42]}]}], "namespace": "JShu3MNJ", "oauthAccessTokenExpiration": 68, "oauthAccessTokenExpirationTimeUnit": "yLmcFwoz", "oauthClientType": "ZBGYtekJ", "oauthRefreshTokenExpiration": 38, "oauthRefreshTokenExpirationTimeUnit": "CdaBjrG0", "parentNamespace": "CxriQOcZ", "redirectUri": "C3ZVhIkw", "scopes": ["Fzfne4Wv", "Fcvnze79", "RKrTSvIq"], "secret": "TepNWOLu", "skipLoginQueue": true, "twoFactorEnabled": false}' \
    > test.out 2>&1
eval_tap $? 126 'AdminCreateClientV3' test.out

#- 127 AdminGetClientsbyNamespacebyIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetClientsbyNamespacebyIDV3 \
    --clientId 'mL8Oci8q' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 127 'AdminGetClientsbyNamespacebyIDV3' test.out

#- 128 AdminDeleteClientV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientV3 \
    --clientId 'XJ4ufULR' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 128 'AdminDeleteClientV3' test.out

#- 129 AdminUpdateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientV3 \
    --clientId 'BCLGYmA7' \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["SoDrGafg", "DYxv4TX7", "Uzy7BzgR"], "baseUri": "v5pulgJd", "clientName": "7evsYdsF", "clientPermissions": [{"action": 63, "resource": "2RZ2nxri", "schedAction": 31, "schedCron": "lJk92i2W", "schedRange": ["Go1IqAqu", "E8LyAEYJ", "2FEOSAEN"]}, {"action": 23, "resource": "2ltdshqG", "schedAction": 18, "schedCron": "MdbzVWhn", "schedRange": ["YJhlmXPU", "gipz9al8", "6919U5e4"]}, {"action": 17, "resource": "plyUCRZE", "schedAction": 20, "schedCron": "mX5mJCWF", "schedRange": ["tGdOHq95", "1sFumUhf", "tv2QO6p3"]}], "clientPlatform": "lyHRZUPl", "deletable": false, "description": "MR7Ya9s6", "modulePermissions": [{"moduleId": "M5Rkggti", "selectedGroups": [{"groupId": "c18yyiXz", "selectedActions": [70, 3, 90]}, {"groupId": "KDsT8whL", "selectedActions": [2, 88, 2]}, {"groupId": "zvv6P05z", "selectedActions": [100, 68, 13]}]}, {"moduleId": "G3j6mpZO", "selectedGroups": [{"groupId": "tdtLoI39", "selectedActions": [32, 83, 28]}, {"groupId": "3N1NZ9j5", "selectedActions": [18, 83, 73]}, {"groupId": "uKWLQxrE", "selectedActions": [43, 48, 57]}]}, {"moduleId": "eIdLEdrH", "selectedGroups": [{"groupId": "Ld5BRgZb", "selectedActions": [1, 44, 10]}, {"groupId": "dTMTA9SI", "selectedActions": [52, 84, 50]}, {"groupId": "JlcTt6Ig", "selectedActions": [42, 18, 54]}]}], "namespace": "wRPWIHmZ", "oauthAccessTokenExpiration": 55, "oauthAccessTokenExpirationTimeUnit": "IGMCiM62", "oauthRefreshTokenExpiration": 5, "oauthRefreshTokenExpirationTimeUnit": "DnGk8Sg4", "redirectUri": "z3ew1lN5", "scopes": ["7pA4kXJG", "6vRozj2p", "OnTHD2Q8"], "skipLoginQueue": true, "twoFactorEnabled": true}' \
    > test.out 2>&1
eval_tap $? 129 'AdminUpdateClientV3' test.out

#- 130 AdminUpdateClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientPermissionV3 \
    --clientId 'zvek2tEa' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 33, "resource": "j5OkmJ4Y"}, {"action": 100, "resource": "i98KgM4P"}, {"action": 99, "resource": "fYYbYb4f"}]}' \
    > test.out 2>&1
eval_tap $? 130 'AdminUpdateClientPermissionV3' test.out

#- 131 AdminAddClientPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddClientPermissionsV3 \
    --clientId '526mjG0C' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 80, "resource": "7awi4S8u"}, {"action": 27, "resource": "UDO2O9mS"}, {"action": 78, "resource": "ipeopTYP"}]}' \
    > test.out 2>&1
eval_tap $? 131 'AdminAddClientPermissionsV3' test.out

#- 132 AdminDeleteClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientPermissionV3 \
    --action '40' \
    --clientId '3L84JmLS' \
    --namespace "$AB_NAMESPACE" \
    --resource 'aPUJ5riK' \
    > test.out 2>&1
eval_tap $? 132 'AdminDeleteClientPermissionV3' test.out

#- 133 AdminGetConfigValueV3
./ng net.accelbyte.sdk.cli.Main iam adminGetConfigValueV3 \
    --configKey '0su5Bq77' \
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
    --body '{"blacklist": ["jkHAlVw0", "veDteNyd", "VmX4xd7A"]}' \
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
    --body '{"active": false, "roleIds": ["TdAOdEFW", "LxjlYCiy", "uaBrna0x"]}' \
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
    --limit '36' \
    --offset '32' \
    > test.out 2>&1
eval_tap $? 141 'RetrieveAllSSOLoginPlatformCredentialV3' test.out

#- 142 RetrieveThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'rMeu5Bhx' \
    > test.out 2>&1
eval_tap $? 142 'RetrieveThirdPartyLoginPlatformCredentialV3' test.out

#- 143 AddThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam addThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'hzyqoOAR' \
    --body '{"ACSURL": "2yCHxDPU", "AWSCognitoRegion": "63VwKdAF", "AWSCognitoUserPool": "f4sHgmbd", "AllowedClients": ["iC1yoOVO", "9a167jMx", "puxqRQbH"], "AppId": "QEajVlMC", "AuthorizationEndpoint": "2sxhJ65f", "ClientId": "76SRH6Ef", "EmptyStrFieldList": ["MzHf5fLd", "CX5Tqo4B", "uSC9fHDe"], "EnableServerLicenseValidation": true, "Environment": "Fa49IcgZ", "FederationMetadataURL": "TZIOLrkI", "GenericOauthFlow": false, "IncludePUID": true, "IsActive": false, "Issuer": "GnYy27R8", "JWKSEndpoint": "YckG5IfC", "KeyID": "KteiqVQ1", "LogoURL": "Jpz601ml", "NetflixCertificates": {"encryptedPrivateKey": "qzJHLKCC", "encryptedPrivateKeyName": "qcO85z6l", "publicCertificate": "g9FEJ3nJ", "publicCertificateName": "sGH7YyMd", "rootCertificate": "LRhAEsuq", "rootCertificateName": "05UjLaam"}, "OrganizationId": "tVRvRqUX", "PlatformName": "YV6b3vqa", "RedirectUri": "C03uvr7f", "RegisteredDomains": [{"affectedClientIDs": ["7sqTqs2X", "11xrUFlv", "ztPGv8AI"], "domain": "MzcCdKq9", "namespaces": ["qQOkwADO", "1wrRKofj", "t3LL5n1X"], "roleId": "NjFCXIWB"}, {"affectedClientIDs": ["2Bis04ec", "IYyxb6Ml", "MofUaQdO"], "domain": "QXUOSsIM", "namespaces": ["tJArAMOA", "LPehYBIO", "K6vQ4xGx"], "roleId": "5tbFHX72"}, {"affectedClientIDs": ["L5xi48EA", "VnF9SDnN", "6MPb3YcN"], "domain": "DGjRkzXS", "namespaces": ["ZR2QeZfV", "orzd2QxZ", "hlNAZDS8"], "roleId": "lt3J1R1f"}], "Secret": "bfSfv4qS", "TeamID": "obbxOqCf", "TokenAuthenticationType": "pPecGLEz", "TokenClaimsMapping": {"nWe2Z3gq": "e40R94WV", "wsWvsRUd": "mOTIZ8MD", "Wk1O2ydd": "Ga2F3H2O"}, "TokenEndpoint": "qu5hvdTJ", "UserInfoEndpoint": "meRHnQH4", "UserInfoHTTPMethod": "0IOw0AhG", "scopes": ["dSoopcj2", "1KwEPSwW", "tlM7fBuW"]}' \
    > test.out 2>&1
eval_tap $? 143 'AddThirdPartyLoginPlatformCredentialV3' test.out

#- 144 DeleteThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'aNZNbzDd' \
    > test.out 2>&1
eval_tap $? 144 'DeleteThirdPartyLoginPlatformCredentialV3' test.out

#- 145 UpdateThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '3lqn6xjN' \
    --body '{"ACSURL": "sPxHBzLy", "AWSCognitoRegion": "e1aAzTWv", "AWSCognitoUserPool": "6Z5AUC3y", "AllowedClients": ["SsMxjdlj", "yRISA7Y1", "sfz62RVH"], "AppId": "JPXb0jKg", "AuthorizationEndpoint": "1Pu7rRAI", "ClientId": "n36J4yvM", "EmptyStrFieldList": ["A7ny1SBq", "6GufFnEU", "2kDMGqof"], "EnableServerLicenseValidation": true, "Environment": "ZMAIWVKp", "FederationMetadataURL": "952Ph6pJ", "GenericOauthFlow": false, "IncludePUID": true, "IsActive": false, "Issuer": "BrqlJNS6", "JWKSEndpoint": "KeEB4IwF", "KeyID": "8mQw4NKF", "LogoURL": "LFQMeECd", "NetflixCertificates": {"encryptedPrivateKey": "nP6B3bVm", "encryptedPrivateKeyName": "8M8555zh", "publicCertificate": "7PD88Vvs", "publicCertificateName": "yHofJQgC", "rootCertificate": "qpmktjFo", "rootCertificateName": "m1IWzcqN"}, "OrganizationId": "oSIZfcbt", "PlatformName": "N4AGIGRL", "RedirectUri": "AZewnFkP", "RegisteredDomains": [{"affectedClientIDs": ["VUcVwKp7", "bpUaAmKa", "OEKJMqbr"], "domain": "wTKZbSQa", "namespaces": ["VOH9KHU3", "jiJs5ZyH", "pWF1odu5"], "roleId": "uydlPqRX"}, {"affectedClientIDs": ["ywDyA8Z7", "LWVKqtzI", "f0J6Oht1"], "domain": "NEY9k14g", "namespaces": ["WUP9xQWN", "KHrxlgZE", "VjPAlX85"], "roleId": "iotyMZ0b"}, {"affectedClientIDs": ["69TuUZPc", "aTYjNFse", "4fh12rvE"], "domain": "GiLIJEi5", "namespaces": ["rp77fjDg", "vqyvt3VD", "ucst0ngR"], "roleId": "ndve38ao"}], "Secret": "dTQN8hR9", "TeamID": "s4weOO0F", "TokenAuthenticationType": "iwWuS2oq", "TokenClaimsMapping": {"lI8nLFWH": "8VUN139C", "5MpfB7nB": "wKYQuio3", "KbX5Dxot": "cvxy8F0D"}, "TokenEndpoint": "Alsdi70c", "UserInfoEndpoint": "obwDuWMJ", "UserInfoHTTPMethod": "XeYFuFAt", "scopes": ["T5t5ryuB", "LaqyBPFz", "WMDVcYZf"]}' \
    > test.out 2>&1
eval_tap $? 145 'UpdateThirdPartyLoginPlatformCredentialV3' test.out

#- 146 UpdateThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'mA56PLjs' \
    --body '{"affectedClientIDs": ["SY9FrwAW", "ebtakfQp", "kmt9JuSc"], "assignedNamespaces": ["2OHVeQgA", "c8LcGmTX", "Ka0D20pe"], "domain": "V6e0c391", "roleId": "qQoE66pL"}' \
    > test.out 2>&1
eval_tap $? 146 'UpdateThirdPartyLoginPlatformDomainV3' test.out

#- 147 DeleteThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'spYXQ3Ao' \
    --body '{"domain": "GJ9Elx7z"}' \
    > test.out 2>&1
eval_tap $? 147 'DeleteThirdPartyLoginPlatformDomainV3' test.out

#- 148 RetrieveSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam retrieveSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'i8k6mWnO' \
    > test.out 2>&1
eval_tap $? 148 'RetrieveSSOLoginPlatformCredential' test.out

#- 149 AddSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam addSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'LOMcZmvD' \
    --body '{"acsUrl": "Fy910hsF", "apiKey": "lKj4Vdg2", "appId": "4NnHGpZJ", "federationMetadataUrl": "g5ydMRb6", "isActive": false, "redirectUri": "QQmhQu1C", "secret": "VVkfIf9O", "ssoUrl": "whQbR85X"}' \
    > test.out 2>&1
eval_tap $? 149 'AddSSOLoginPlatformCredential' test.out

#- 150 DeleteSSOLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteSSOLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '9eRTVfr9' \
    > test.out 2>&1
eval_tap $? 150 'DeleteSSOLoginPlatformCredentialV3' test.out

#- 151 UpdateSSOPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam updateSSOPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId '1x1WLO4v' \
    --body '{"acsUrl": "ABK59GmQ", "apiKey": "oreD5fW9", "appId": "7QbPEqpQ", "federationMetadataUrl": "yLkxaJiy", "isActive": true, "redirectUri": "Sq30KAgP", "secret": "jVLzkYma", "ssoUrl": "7GmyB4WS"}' \
    > test.out 2>&1
eval_tap $? 151 'UpdateSSOPlatformCredential' test.out

#- 152 AdminListUserIDByPlatformUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByPlatformUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'rogLLAcq' \
    --rawPID  \
    --rawPUID  \
    --body '{"platformUserIds": ["Hnacr78C", "kr4fdCbk", "sLWY9HNp"]}' \
    > test.out 2>&1
eval_tap $? 152 'AdminListUserIDByPlatformUserIDsV3' test.out

#- 153 AdminGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Z20HAd3O' \
    --platformUserId 'mP518iAH' \
    > test.out 2>&1
eval_tap $? 153 'AdminGetUserByPlatformUserIDV3' test.out

#- 154 AdminGetProfileUpdateStrategyV3
./ng net.accelbyte.sdk.cli.Main iam adminGetProfileUpdateStrategyV3 \
    --namespace "$AB_NAMESPACE" \
    --field 'display_name' \
    > test.out 2>&1
eval_tap $? 154 'AdminGetProfileUpdateStrategyV3' test.out

#- 155 AdminUpdateProfileUpdateStrategyV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateProfileUpdateStrategyV3 \
    --namespace "$AB_NAMESPACE" \
    --field 'dob' \
    --body '{"config": {"minimumAllowedInterval": 48}, "type": "LqzqXYnu"}' \
    > test.out 2>&1
eval_tap $? 155 'AdminUpdateProfileUpdateStrategyV3' test.out

#- 156 AdminGetRoleOverrideConfigV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleOverrideConfigV3 \
    --namespace "$AB_NAMESPACE" \
    --identity 'USER' \
    > test.out 2>&1
eval_tap $? 156 'AdminGetRoleOverrideConfigV3' test.out

#- 157 AdminUpdateRoleOverrideConfigV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleOverrideConfigV3 \
    --namespace "$AB_NAMESPACE" \
    --identity 'GAME_ADMIN' \
    --body '{"additions": [{"actions": [53, 1, 49], "resource": "IFRq7X35"}, {"actions": [71, 29, 35], "resource": "qhP2Arge"}, {"actions": [93, 11, 13], "resource": "WNXxVdgh"}], "exclusions": [{"actions": [17, 97, 93], "resource": "AzSrWY0A"}, {"actions": [92, 25, 57], "resource": "QNaQQwaj"}, {"actions": [99, 49, 5], "resource": "1p3m8ex5"}], "overrides": [{"actions": [36, 23, 1], "resource": "JVe9zcra"}, {"actions": [96, 68, 71], "resource": "XlnAvEzg"}, {"actions": [78, 19, 76], "resource": "oGsqU1Ev"}], "replacements": [{"replacement": {"actions": [23, 53, 24], "resource": "Nj8OBpd5"}, "target": "SVcYKli7"}, {"replacement": {"actions": [39, 39, 58], "resource": "gR0snsiY"}, "target": "bEjejDr3"}, {"replacement": {"actions": [38, 73, 23], "resource": "r4omvnIE"}, "target": "Nl0PAdHg"}]}' \
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
    --body '{"active": true}' \
    > test.out 2>&1
eval_tap $? 159 'AdminChangeRoleOverrideConfigStatusV3' test.out

#- 160 AdminGetRoleNamespacePermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleNamespacePermissionV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'ncTWEiIi' \
    > test.out 2>&1
eval_tap $? 160 'AdminGetRoleNamespacePermissionV3' test.out

#- 161 GetAdminUsersByRoleIdV3
./ng net.accelbyte.sdk.cli.Main iam getAdminUsersByRoleIdV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'vGRFkN8K' \
    --after '10' \
    --before '19' \
    --limit '64' \
    > test.out 2>&1
eval_tap $? 161 'GetAdminUsersByRoleIdV3' test.out

#- 162 AdminGetUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --emailAddress 'QJhM3Pk2' \
    > test.out 2>&1
eval_tap $? 162 'AdminGetUserByEmailAddressV3' test.out

#- 163 AdminBulkUpdateUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"updateRequest": {"skipLoginQueue": false}, "userIds": ["vvYDILAy", "3un2DtQi", "Uegvoznj"]}' \
    > test.out 2>&1
eval_tap $? 163 'AdminBulkUpdateUsersV3' test.out

#- 164 AdminGetBulkUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType 'dqN6BGhq' \
    --body '{"bulkUserId": ["4ooDMymL", "RqGXPY0i", "zDGGKzAo"]}' \
    > test.out 2>&1
eval_tap $? 164 'AdminGetBulkUserBanV3' test.out

#- 165 AdminListUserIDByUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["EHo8g1Cp", "5F7V7kG8", "bDrWsVIQ"]}' \
    > test.out 2>&1
eval_tap $? 165 'AdminListUserIDByUserIDsV3' test.out

#- 166 AdminBulkGetUsersPlatform
./ng net.accelbyte.sdk.cli.Main iam adminBulkGetUsersPlatform \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["WwupHZtw", "XVrVtNtT", "GlAPTxR4"]}' \
    > test.out 2>&1
eval_tap $? 166 'AdminBulkGetUsersPlatform' test.out

#- 167 AdminInviteUserV3
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddresses": ["A2hmJmI6", "sw2sdPUG", "qvngwQgU"], "isAdmin": false, "languageTag": "beUzB0fd", "namespace": "vg209ZgX", "roles": ["PdE2pQxA", "r2ZF1V4s", "SP4RTFic"]}' \
    > test.out 2>&1
eval_tap $? 167 'AdminInviteUserV3' test.out

#- 168 AdminQueryThirdPlatformLinkHistoryV3
./ng net.accelbyte.sdk.cli.Main iam adminQueryThirdPlatformLinkHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '77' \
    --offset '81' \
    --platformUserId 'XCxswsVO' \
    --platformId 'xQJRRdfO' \
    > test.out 2>&1
eval_tap $? 168 'AdminQueryThirdPlatformLinkHistoryV3' test.out

#- 169 AdminListUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminListUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '4' \
    --offset '52' \
    > test.out 2>&1
eval_tap $? 169 'AdminListUsersV3' test.out

#- 170 AdminSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam adminSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'viOrhKoE' \
    --endDate '0qTTo2Rs' \
    --includeTotal  \
    --limit '76' \
    --offset '84' \
    --platformBy 'sSbjHk0H' \
    --platformId 'IU5moYij' \
    --query 'jarjC5Na' \
    --roleIds 'sLLDj608' \
    --skipLoginQueue  \
    --startDate 'Km80X43X' \
    --testAccount  \
    > test.out 2>&1
eval_tap $? 170 'AdminSearchUserV3' test.out

#- 171 AdminGetBulkUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"listEmailAddressRequest": ["mmOYKNQ0", "Xr5ct9cJ", "jISmVRVn"]}' \
    > test.out 2>&1
eval_tap $? 171 'AdminGetBulkUserByEmailAddressV3' test.out

#- 172 AdminGetUserByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ci3xHqwS' \
    > test.out 2>&1
eval_tap $? 172 'AdminGetUserByUserIdV3' test.out

#- 173 AdminUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'pX2ifHTN' \
    --body '{"avatarUrl": "R8ub4x9v", "country": "kqJiY1nh", "dateOfBirth": "bPTSScVB", "displayName": "T5jsxzWf", "languageTag": "gew6He0D", "skipLoginQueue": true, "uniqueDisplayName": "C0HfDfjm", "userName": "kJV0DCht"}' \
    > test.out 2>&1
eval_tap $? 173 'AdminUpdateUserV3' test.out

#- 174 AdminGetUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'HbcBtgsh' \
    --activeOnly  \
    --after 'xavR3yXE' \
    --before 'CVeABatF' \
    --limit '24' \
    > test.out 2>&1
eval_tap $? 174 'AdminGetUserBanV3' test.out

#- 175 AdminBanUserV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '2vtHnuIi' \
    --body '{"ban": "eMvWWZzw", "comment": "PNZer7dj", "endDate": "PAwf1oCh", "reason": "TTPEDslB", "skipNotif": false}' \
    > test.out 2>&1
eval_tap $? 175 'AdminBanUserV3' test.out

#- 176 AdminGetUserBanSummaryV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanSummaryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '8AeEtvKv' \
    > test.out 2>&1
eval_tap $? 176 'AdminGetUserBanSummaryV3' test.out

#- 177 AdminUpdateUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserBanV3 \
    --banId 'xzzmE8rD' \
    --namespace "$AB_NAMESPACE" \
    --userId 'N7oVRctM' \
    --body '{"enabled": true, "skipNotif": false}' \
    > test.out 2>&1
eval_tap $? 177 'AdminUpdateUserBanV3' test.out

#- 178 AdminSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'WuZOH33c' \
    --body '{"context": "JI7kFyh9", "emailAddress": "plsP1DgC", "languageTag": "bOCwqsG3"}' \
    > test.out 2>&1
eval_tap $? 178 'AdminSendVerificationCodeV3' test.out

#- 179 AdminVerifyAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'SsOKhB6d' \
    --body '{"Code": "Nn1gz2Vw", "ContactType": "q6f5SsHb", "LanguageTag": "YnOEJ4VH", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 179 'AdminVerifyAccountV3' test.out

#- 180 GetUserVerificationCode
./ng net.accelbyte.sdk.cli.Main iam getUserVerificationCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'zCOtxmi4' \
    > test.out 2>&1
eval_tap $? 180 'GetUserVerificationCode' test.out

#- 181 AdminGetUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '9uWR1HlH' \
    > test.out 2>&1
eval_tap $? 181 'AdminGetUserDeletionStatusV3' test.out

#- 182 AdminUpdateUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'wKca8Zdn' \
    --body '{"deletionDate": 77, "enabled": true}' \
    > test.out 2>&1
eval_tap $? 182 'AdminUpdateUserDeletionStatusV3' test.out

#- 183 AdminListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'BZTBp3HI' \
    > test.out 2>&1
eval_tap $? 183 'AdminListUserAllPlatformAccountsDistinctV3' test.out

#- 184 AdminUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'MdAINvTU' \
    --body '{"code": "7zOPHKEG", "country": "v3Bambmr", "dateOfBirth": "lz9duVOO", "displayName": "bxKpTNiR", "emailAddress": "TVSyyEZ2", "password": "uZtQRHAr", "uniqueDisplayName": "HsqevPoK", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 184 'AdminUpgradeHeadlessAccountV3' test.out

#- 185 AdminDeleteUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'l34os5OI' \
    > test.out 2>&1
eval_tap $? 185 'AdminDeleteUserInformationV3' test.out

#- 186 AdminGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'zbFbbfLA' \
    --after '0.09287210574681981' \
    --before '0.32620722119403234' \
    --limit '52' \
    > test.out 2>&1
eval_tap $? 186 'AdminGetUserLoginHistoriesV3' test.out

#- 187 AdminResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam adminResetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'CgE1rWqo' \
    --body '{"languageTag": "wUOCHSAl", "mfaToken": "bhYM1lDJ", "newPassword": "tig5QvNW", "oldPassword": "VLCoxrQh"}' \
    > test.out 2>&1
eval_tap $? 187 'AdminResetPasswordV3' test.out

#- 188 AdminUpdateUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserPermissionV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'n4RRQdas' \
    --body '{"Permissions": [{"Action": 3, "Resource": "bv4nuGNW", "SchedAction": 15, "SchedCron": "mq12ml8K", "SchedRange": ["0XmhyNkM", "t54tbYlm", "pMUTEEuO"]}, {"Action": 78, "Resource": "7WYRMBMS", "SchedAction": 4, "SchedCron": "3MOZOh3G", "SchedRange": ["StrWbwPW", "6rlpbKj6", "yglJSC9y"]}, {"Action": 14, "Resource": "dQ3eo0Pf", "SchedAction": 45, "SchedCron": "9qNrkmEH", "SchedRange": ["Knj5HDGb", "ThyZwUgp", "hCBT5xEB"]}]}' \
    > test.out 2>&1
eval_tap $? 188 'AdminUpdateUserPermissionV3' test.out

#- 189 AdminAddUserPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserPermissionsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'gTYZZW9T' \
    --body '{"Permissions": [{"Action": 48, "Resource": "PPfbDQJ8", "SchedAction": 40, "SchedCron": "RnOyV6eX", "SchedRange": ["Edwh7z2F", "1L8NxVx9", "3tQceqhM"]}, {"Action": 92, "Resource": "rCutAzIJ", "SchedAction": 75, "SchedCron": "DBLuHKws", "SchedRange": ["sX0cWDcc", "5HjBGZE0", "1Nm3stcp"]}, {"Action": 71, "Resource": "RcW3iBOh", "SchedAction": 1, "SchedCron": "mSrm4tR4", "SchedRange": ["bhAw22Ld", "G4BvLC0x", "HbvPkb9b"]}]}' \
    > test.out 2>&1
eval_tap $? 189 'AdminAddUserPermissionsV3' test.out

#- 190 AdminDeleteUserPermissionBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'wM72Qak4' \
    --body '[{"Action": 16, "Resource": "9jlCHjA0"}, {"Action": 97, "Resource": "PpADpQ0F"}, {"Action": 19, "Resource": "avcUWe85"}]' \
    > test.out 2>&1
eval_tap $? 190 'AdminDeleteUserPermissionBulkV3' test.out

#- 191 AdminDeleteUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionV3 \
    --action '68' \
    --namespace "$AB_NAMESPACE" \
    --resource '8vhuwjwY' \
    --userId '3jBMveuu' \
    > test.out 2>&1
eval_tap $? 191 'AdminDeleteUserPermissionV3' test.out

#- 192 AdminGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ei4h1ito' \
    --after 'zv9qW9Zh' \
    --before 'tyij3Ia2' \
    --limit '75' \
    --platformId 'rBi4v4RM' \
    --targetNamespace 'Nojlaaob' \
    > test.out 2>&1
eval_tap $? 192 'AdminGetUserPlatformAccountsV3' test.out

#- 193 AdminListAllDistinctPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminListAllDistinctPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'KgWscnOX' \
    --status 'J87AqRp8' \
    > test.out 2>&1
eval_tap $? 193 'AdminListAllDistinctPlatformAccountsV3' test.out

#- 194 AdminGetListJusticePlatformAccounts
./ng net.accelbyte.sdk.cli.Main iam adminGetListJusticePlatformAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'J09vCCoY' \
    > test.out 2>&1
eval_tap $? 194 'AdminGetListJusticePlatformAccounts' test.out

#- 195 AdminGetUserMapping
./ng net.accelbyte.sdk.cli.Main iam adminGetUserMapping \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'BSXqc7js' \
    --userId 'YPDYN9Eu' \
    > test.out 2>&1
eval_tap $? 195 'AdminGetUserMapping' test.out

#- 196 AdminCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam adminCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'bOahXZuK' \
    --userId 'fHzjzyhn' \
    > test.out 2>&1
eval_tap $? 196 'AdminCreateJusticeUser' test.out

#- 197 AdminLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'NDXOarx5' \
    --skipConflict  \
    --body '{"platformId": "Yrz5V5ma", "platformUserId": "Pihoocg5"}' \
    > test.out 2>&1
eval_tap $? 197 'AdminLinkPlatformAccount' test.out

#- 198 AdminGetUserLinkHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLinkHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'osQVEbEx' \
    --platformId '507OHMyS' \
    > test.out 2>&1
eval_tap $? 198 'AdminGetUserLinkHistoriesV3' test.out

#- 199 AdminPlatformUnlinkV3
eval_tap 0 199 'AdminPlatformUnlinkV3 # SKIP deprecated' test.out

#- 200 AdminPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'AMEmSU4S' \
    --userId 'dLPZhWTG' \
    > test.out 2>&1
eval_tap $? 200 'AdminPlatformUnlinkAllV3' test.out

#- 201 AdminPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'fd5p1YOI' \
    --userId 'HWNZAT1x' \
    --ticket 'DRWeQ4Tg' \
    > test.out 2>&1
eval_tap $? 201 'AdminPlatformLinkV3' test.out

#- 202 AdminDeleteUserLinkingHistoryByPlatformIDV3
eval_tap 0 202 'AdminDeleteUserLinkingHistoryByPlatformIDV3 # SKIP deprecated' test.out

#- 203 AdminDeleteUserLinkingRestrictionByPlatformIDV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserLinkingRestrictionByPlatformIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'R8IF9ACF' \
    --userId 'MvHGuBor' \
    > test.out 2>&1
eval_tap $? 203 'AdminDeleteUserLinkingRestrictionByPlatformIDV3' test.out

#- 204 AdminGetThirdPartyPlatformTokenLinkStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetThirdPartyPlatformTokenLinkStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'OECMNRlg' \
    --userId 'dWa7DlDw' \
    --platformToken '9jjrkd7N' \
    > test.out 2>&1
eval_tap $? 204 'AdminGetThirdPartyPlatformTokenLinkStatusV3' test.out

#- 205 AdminGetUserSinglePlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminGetUserSinglePlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --platformId '8Zm6gX19' \
    --userId 'IPmks2HZ' \
    --crossNamespace  \
    > test.out 2>&1
eval_tap $? 205 'AdminGetUserSinglePlatformAccount' test.out

#- 206 AdminDeleteUserRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRolesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'MCxMUQTD' \
    --body '["fJDda66q", "xOcw6qti", "A8J1LpAs"]' \
    > test.out 2>&1
eval_tap $? 206 'AdminDeleteUserRolesV3' test.out

#- 207 AdminSaveUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminSaveUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 's79MCnNL' \
    --body '[{"namespace": "NMsMzrqQ", "roleId": "TIqsKlic"}, {"namespace": "qigcvn6K", "roleId": "zFd73Qxx"}, {"namespace": "0DbzsU7P", "roleId": "XpXMniog"}]' \
    > test.out 2>&1
eval_tap $? 207 'AdminSaveUserRoleV3' test.out

#- 208 AdminAddUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'RCS0gUlf' \
    --userId 'jSOx9XUK' \
    > test.out 2>&1
eval_tap $? 208 'AdminAddUserRoleV3' test.out

#- 209 AdminDeleteUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'xJtZak10' \
    --userId 'bK71FtUb' \
    > test.out 2>&1
eval_tap $? 209 'AdminDeleteUserRoleV3' test.out

#- 210 AdminUpdateUserStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'AwWRFLpF' \
    --body '{"enabled": false, "reason": "bt6iXPNF"}' \
    > test.out 2>&1
eval_tap $? 210 'AdminUpdateUserStatusV3' test.out

#- 211 AdminTrustlyUpdateUserIdentity
./ng net.accelbyte.sdk.cli.Main iam adminTrustlyUpdateUserIdentity \
    --namespace "$AB_NAMESPACE" \
    --userId 'tbwOr0vY' \
    --body '{"emailAddress": "IdmSeN7n", "password": "6zM5doB0"}' \
    > test.out 2>&1
eval_tap $? 211 'AdminTrustlyUpdateUserIdentity' test.out

#- 212 AdminVerifyUserWithoutVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyUserWithoutVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'hHvb6Cjk' \
    > test.out 2>&1
eval_tap $? 212 'AdminVerifyUserWithoutVerificationCodeV3' test.out

#- 213 AdminUpdateClientSecretV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientSecretV3 \
    --clientId 'vM8Dnbl0' \
    --namespace "$AB_NAMESPACE" \
    --body '{"newSecret": "14f3oeg2"}' \
    > test.out 2>&1
eval_tap $? 213 'AdminUpdateClientSecretV3' test.out

#- 214 AdminCheckThirdPartyLoginPlatformAvailabilityV3
./ng net.accelbyte.sdk.cli.Main iam adminCheckThirdPartyLoginPlatformAvailabilityV3 \
    --platformId 'vTE08cGy' \
    > test.out 2>&1
eval_tap $? 214 'AdminCheckThirdPartyLoginPlatformAvailabilityV3' test.out

#- 215 AdminGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV3 \
    --after 'dbEENXoE' \
    --before 'dD4WmRPY' \
    --isWildcard  \
    --limit '6' \
    > test.out 2>&1
eval_tap $? 215 'AdminGetRolesV3' test.out

#- 216 AdminCreateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV3 \
    --body '{"adminRole": false, "deletable": true, "isWildcard": true, "managers": [{"displayName": "tXN5pU1g", "namespace": "cEzyn3S7", "userId": "nonvIzCc"}, {"displayName": "uRxE01Bz", "namespace": "9Ay18vk8", "userId": "SvguMFxf"}, {"displayName": "q7H5l4fI", "namespace": "dcI9glIN", "userId": "x2aOSSsD"}], "members": [{"displayName": "eKNt6sHj", "namespace": "XSUCYHn5", "userId": "KVbjiQMi"}, {"displayName": "L0rSHE2K", "namespace": "iI8H3Yjn", "userId": "SGtR55YX"}, {"displayName": "9quqfCoQ", "namespace": "JTJu9dyR", "userId": "e52mZGN1"}], "permissions": [{"action": 49, "resource": "otW2eSoZ", "schedAction": 40, "schedCron": "vd49ZBPy", "schedRange": ["BZn3kKCF", "6FMg9o4M", "UL5IywD3"]}, {"action": 79, "resource": "IXxvbsxw", "schedAction": 12, "schedCron": "aVgccpNy", "schedRange": ["NB6PTEYQ", "Am3BZQWF", "zaYziu5f"]}, {"action": 66, "resource": "fthtrFYg", "schedAction": 82, "schedCron": "F8tNwsgQ", "schedRange": ["KkiuJDH8", "f7zzZq3q", "ap3y6IXT"]}], "roleName": "XScqePCg"}' \
    > test.out 2>&1
eval_tap $? 216 'AdminCreateRoleV3' test.out

#- 217 AdminGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV3 \
    --roleId 'ICv6c9sy' \
    > test.out 2>&1
eval_tap $? 217 'AdminGetRoleV3' test.out

#- 218 AdminDeleteRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV3 \
    --roleId 'eBALHQuP' \
    > test.out 2>&1
eval_tap $? 218 'AdminDeleteRoleV3' test.out

#- 219 AdminUpdateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV3 \
    --roleId '385Jy30R' \
    --body '{"deletable": false, "isWildcard": false, "roleName": "TuegJIF4"}' \
    > test.out 2>&1
eval_tap $? 219 'AdminUpdateRoleV3' test.out

#- 220 AdminGetRoleAdminStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleAdminStatusV3 \
    --roleId 'h8oLLqQ2' \
    > test.out 2>&1
eval_tap $? 220 'AdminGetRoleAdminStatusV3' test.out

#- 221 AdminUpdateAdminRoleStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateAdminRoleStatusV3 \
    --roleId '6ZZcsKdC' \
    > test.out 2>&1
eval_tap $? 221 'AdminUpdateAdminRoleStatusV3' test.out

#- 222 AdminRemoveRoleAdminV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleAdminV3 \
    --roleId 'CS4lvR3S' \
    > test.out 2>&1
eval_tap $? 222 'AdminRemoveRoleAdminV3' test.out

#- 223 AdminGetRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleManagersV3 \
    --roleId 'mMtT9YCg' \
    --after 'M1l4RqfC' \
    --before 'raqBl4yu' \
    --limit '74' \
    > test.out 2>&1
eval_tap $? 223 'AdminGetRoleManagersV3' test.out

#- 224 AdminAddRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleManagersV3 \
    --roleId 'YZCU9Lnl' \
    --body '{"managers": [{"displayName": "ppEnZrl2", "namespace": "nDVt4XrC", "userId": "dlDCIgzT"}, {"displayName": "2FupBv2R", "namespace": "rZb2mofL", "userId": "nvGpVKeg"}, {"displayName": "y7ZYoE6e", "namespace": "XIadA5Qm", "userId": "BzlPNFKT"}]}' \
    > test.out 2>&1
eval_tap $? 224 'AdminAddRoleManagersV3' test.out

#- 225 AdminRemoveRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleManagersV3 \
    --roleId 'QrdXvpPf' \
    --body '{"managers": [{"displayName": "uTPwUmFf", "namespace": "fYuktdx7", "userId": "2ady8DVe"}, {"displayName": "9uUA52Wn", "namespace": "tQHfb8so", "userId": "RKYFSYpk"}, {"displayName": "hC19XnsN", "namespace": "tT1ZMT1I", "userId": "KkoRh71y"}]}' \
    > test.out 2>&1
eval_tap $? 225 'AdminRemoveRoleManagersV3' test.out

#- 226 AdminGetRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleMembersV3 \
    --roleId '2QEPWg4l' \
    --after 'Krnwtwox' \
    --before 'ovicsww5' \
    --limit '88' \
    > test.out 2>&1
eval_tap $? 226 'AdminGetRoleMembersV3' test.out

#- 227 AdminAddRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleMembersV3 \
    --roleId 'fEadYOVd' \
    --body '{"members": [{"displayName": "yhtOoQmt", "namespace": "HIgjKJGt", "userId": "txlr5INr"}, {"displayName": "FcgewCx1", "namespace": "dEZrUXyh", "userId": "CA2J80Ex"}, {"displayName": "vrATAPzg", "namespace": "9oUJsLFR", "userId": "J2yCCU2u"}]}' \
    > test.out 2>&1
eval_tap $? 227 'AdminAddRoleMembersV3' test.out

#- 228 AdminRemoveRoleMembersV3
eval_tap 0 228 'AdminRemoveRoleMembersV3 # SKIP deprecated' test.out

#- 229 AdminUpdateRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV3 \
    --roleId '8RqFWyT3' \
    --body '{"permissions": [{"action": 41, "resource": "2dtWs9bp", "schedAction": 67, "schedCron": "2fIVs7Gk", "schedRange": ["cdVCzxQW", "pRZuZBzS", "zxDS5wG4"]}, {"action": 42, "resource": "DQ5Ywa8r", "schedAction": 88, "schedCron": "MhpSrvAO", "schedRange": ["5zpzPsig", "hiMrdbcc", "ayDa59Pb"]}, {"action": 31, "resource": "o7547zLZ", "schedAction": 12, "schedCron": "252GOgJG", "schedRange": ["6A6THcZw", "hNM0JzXV", "z0k6ow7c"]}]}' \
    > test.out 2>&1
eval_tap $? 229 'AdminUpdateRolePermissionsV3' test.out

#- 230 AdminAddRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV3 \
    --roleId 'hncYqJ2P' \
    --body '{"permissions": [{"action": 6, "resource": "jme9m7ms", "schedAction": 99, "schedCron": "q5IybXad", "schedRange": ["QFaFdsx1", "1QfGZTFy", "bGZZohJe"]}, {"action": 41, "resource": "HAqKv3Z3", "schedAction": 75, "schedCron": "1CcpCa7W", "schedRange": ["OlRbxXBG", "IGMgz22L", "ic9RNS8X"]}, {"action": 21, "resource": "NVEOmUri", "schedAction": 95, "schedCron": "sTbTQQsE", "schedRange": ["X69R939s", "lP5U2aqT", "YEd20l6L"]}]}' \
    > test.out 2>&1
eval_tap $? 230 'AdminAddRolePermissionsV3' test.out

#- 231 AdminDeleteRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV3 \
    --roleId 'dsDOGvQB' \
    --body '["grwybDLe", "i6I21gna", "neQvq9la"]' \
    > test.out 2>&1
eval_tap $? 231 'AdminDeleteRolePermissionsV3' test.out

#- 232 AdminDeleteRolePermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionV3 \
    --action '34' \
    --resource 'ISb6cnVq' \
    --roleId 'cK9P5hOf' \
    > test.out 2>&1
eval_tap $? 232 'AdminDeleteRolePermissionV3' test.out

#- 233 AdminGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam adminGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 233 'AdminGetMyUserV3' test.out

#- 234 UserAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam userAuthenticationV3 \
    --clientId '66Vd8VIX' \
    --extendExp  \
    --redirectUri 'ydW6xXxg' \
    --password '4GsPWTt8' \
    --requestId '1MnFwde4' \
    --userName 'aXYEqjcB' \
    > test.out 2>&1
eval_tap $? 234 'UserAuthenticationV3' test.out

#- 235 AuthenticationWithPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV3 \
    --extendExp  \
    --clientId 'e75fMwSt' \
    --linkingToken 'QztWh4sv' \
    --password 'vdazEVQ7' \
    --username '5qbX8PHV' \
    > test.out 2>&1
eval_tap $? 235 'AuthenticationWithPlatformLinkV3' test.out

#- 236 GenerateTokenByNewHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV3 \
    --additionalData 'EDnq1IhA' \
    --extendExp  \
    --linkingToken 'tks4C9xM' \
    > test.out 2>&1
eval_tap $? 236 'GenerateTokenByNewHeadlessAccountV3' test.out

#- 237 RequestOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam requestOneTimeLinkingCodeV3 \
    --platformId 'rcyFaJ98' \
    > test.out 2>&1
eval_tap $? 237 'RequestOneTimeLinkingCodeV3' test.out

#- 238 ValidateOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam validateOneTimeLinkingCodeV3 \
    --oneTimeLinkCode 'qovbEfip' \
    > test.out 2>&1
eval_tap $? 238 'ValidateOneTimeLinkingCodeV3' test.out

#- 239 RequestTokenByOneTimeLinkCodeResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTokenByOneTimeLinkCodeResponseV3 \
    --additionalData '4MWuEAQF' \
    --isTransient  \
    --clientId 'R9lywBJ7' \
    --oneTimeLinkCode 'payx1yif' \
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
    --codeChallenge 'k58khtu2' \
    --codeChallengeMethod 'S256' \
    --clientId 'k7SpWl4M' \
    > test.out 2>&1
eval_tap $? 242 'RequestTokenExchangeCodeV3' test.out

#- 243 AdminRetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam adminRetrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'I2jojefK' \
    --userId 'DYAAezgt' \
    --platformUserId 'fiSxbJnw' \
    > test.out 2>&1
eval_tap $? 243 'AdminRetrieveUserThirdPartyPlatformTokenV3' test.out

#- 244 RevokeUserV3
./ng net.accelbyte.sdk.cli.Main iam revokeUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '2FeCp8Ni' \
    --includeGameNamespace  \
    > test.out 2>&1
eval_tap $? 244 'RevokeUserV3' test.out

#- 245 AuthorizeV3
./ng net.accelbyte.sdk.cli.Main iam authorizeV3 \
    --codeChallenge 'PAkpWpIb' \
    --codeChallengeMethod 'plain' \
    --createHeadless  \
    --oneTimeLinkCode 'NbYxvDan' \
    --redirectUri 'Np8eFwDj' \
    --scope 'YkV39uWl' \
    --state '9p7Zerpx' \
    --targetAuthPage 'm4rAHOi8' \
    --useRedirectUriAsLoginUrlWhenLocked  \
    --clientId 'iQ5B5DKZ' \
    --responseType 'code' \
    > test.out 2>&1
eval_tap $? 245 'AuthorizeV3' test.out

#- 246 TokenIntrospectionV3
./ng net.accelbyte.sdk.cli.Main iam tokenIntrospectionV3 \
    --token 'o9Vy9JRF' \
    > test.out 2>&1
eval_tap $? 246 'TokenIntrospectionV3' test.out

#- 247 GetJWKSV3
./ng net.accelbyte.sdk.cli.Main iam getJWKSV3 \
    > test.out 2>&1
eval_tap $? 247 'GetJWKSV3' test.out

#- 248 SendMFAAuthenticationCode
./ng net.accelbyte.sdk.cli.Main iam sendMFAAuthenticationCode \
    --clientId 'FdqKjwkt' \
    --factor 'N8oovTJK' \
    --mfaToken 'auds3oEJ' \
    > test.out 2>&1
eval_tap $? 248 'SendMFAAuthenticationCode' test.out

#- 249 Change2faMethod
./ng net.accelbyte.sdk.cli.Main iam change2faMethod \
    --factor '5WXBJTgG' \
    --mfaToken 'bpQLA8A4' \
    > test.out 2>&1
eval_tap $? 249 'Change2faMethod' test.out

#- 250 Verify2faCode
./ng net.accelbyte.sdk.cli.Main iam verify2faCode \
    --code 'g6NlIPOO' \
    --factor 'dBKAQD1e' \
    --mfaToken 'wYLIdJxJ' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 250 'Verify2faCode' test.out

#- 251 RetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam retrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Ukh3NmXM' \
    --userId 'hk9IFis8' \
    > test.out 2>&1
eval_tap $? 251 'RetrieveUserThirdPartyPlatformTokenV3' test.out

#- 252 AuthCodeRequestV3
./ng net.accelbyte.sdk.cli.Main iam authCodeRequestV3 \
    --platformId 'Fk0VpfW0' \
    --clientId 'YrlBkQXo' \
    --redirectUri '1sk2fXxq' \
    --requestId 'OOv2F0fb' \
    > test.out 2>&1
eval_tap $? 252 'AuthCodeRequestV3' test.out

#- 253 PlatformTokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV3 \
    --platformId 'Ycw5ulpv' \
    --additionalData 'nBITUCAH' \
    --clientId 'z9bAMYhw' \
    --createHeadless  \
    --deviceId 'jFxPITo9' \
    --macAddress 'PkA4IMcm' \
    --platformToken 'xos1LUmn' \
    --serviceLabel '0.966004161212525' \
    --skipSetCookie  \
    > test.out 2>&1
eval_tap $? 253 'PlatformTokenGrantV3' test.out

#- 254 GetRevocationListV3
./ng net.accelbyte.sdk.cli.Main iam getRevocationListV3 \
    > test.out 2>&1
eval_tap $? 254 'GetRevocationListV3' test.out

#- 255 TokenRevocationV3
./ng net.accelbyte.sdk.cli.Main iam tokenRevocationV3 \
    --token 'adu580ds' \
    > test.out 2>&1
eval_tap $? 255 'TokenRevocationV3' test.out

#- 256 SimultaneousLoginV3
./ng net.accelbyte.sdk.cli.Main iam simultaneousLoginV3 \
    --simultaneousPlatform 'CaMHyNVv' \
    --simultaneousTicket 'qqiWchzy' \
    --nativePlatform 'steam' \
    --nativePlatformTicket 'Su1RDq8t' \
    > test.out 2>&1
eval_tap $? 256 'SimultaneousLoginV3' test.out

#- 257 TokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV3 \
    --additionalData '4wc1atdD' \
    --clientId 'IzR4s8Bb' \
    --clientSecret 'gnU8P3Rx' \
    --code 'AYJWXA7m' \
    --codeVerifier 'DWOnLy98' \
    --extendNamespace '2fHlrNo0' \
    --extendExp  \
    --password 'vPZqCgqv' \
    --redirectUri 'CG1YjI51' \
    --refreshToken '5JeJuk6P' \
    --username 'SMuEXtFF' \
    --grantType 'refresh_token' \
    > test.out 2>&1
eval_tap $? 257 'TokenGrantV3' test.out

#- 258 VerifyTokenV3
./ng net.accelbyte.sdk.cli.Main iam verifyTokenV3 \
    --token 'i3Dx79Ng' \
    > test.out 2>&1
eval_tap $? 258 'VerifyTokenV3' test.out

#- 259 PlatformAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticationV3 \
    --platformId 'LaRG9ftR' \
    --code 'UyGFzpqc' \
    --error 'hWTISQW3' \
    --openidAssocHandle 'Di3qqkhe' \
    --openidClaimedId 'Q3M5mHej' \
    --openidIdentity 'kpGkRaTf' \
    --openidMode 'BApIA2MM' \
    --openidNs 'M1io0AiJ' \
    --openidOpEndpoint 'YJfiaQE6' \
    --openidResponseNonce 'ykLebzk1' \
    --openidReturnTo 'wbx20X51' \
    --openidSig 'Czmxkcdn' \
    --openidSigned 'hdqJ6jVa' \
    --state 'dgbqFghR' \
    > test.out 2>&1
eval_tap $? 259 'PlatformAuthenticationV3' test.out

#- 260 PlatformTokenRefreshV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenRefreshV3 \
    --platformId '5GswVrPg' \
    --platformToken 'rOL4j7ux' \
    > test.out 2>&1
eval_tap $? 260 'PlatformTokenRefreshV3' test.out

#- 261 PublicGetInputValidations
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidations \
    --defaultOnEmpty  \
    --languageCode 'm0cK0huQ' \
    > test.out 2>&1
eval_tap $? 261 'PublicGetInputValidations' test.out

#- 262 PublicGetInputValidationByField
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidationByField \
    --field 'JGbUz7KN' \
    > test.out 2>&1
eval_tap $? 262 'PublicGetInputValidationByField' test.out

#- 263 PublicGetCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam publicGetCountryAgeRestrictionV3 \
    --countryCode 'XUk7Mj2C' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 263 'PublicGetCountryAgeRestrictionV3' test.out

#- 264 PublicGetConfigValueV3
./ng net.accelbyte.sdk.cli.Main iam publicGetConfigValueV3 \
    --configKey 'oYaQ1SZq' \
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
    --clientId 'csjje0vk' \
    > test.out 2>&1
eval_tap $? 267 'RetrieveActiveOIDCClientsPublicV3' test.out

#- 268 PublicListUserIDByPlatformUserIDsV3
eval_tap 0 268 'PublicListUserIDByPlatformUserIDsV3 # SKIP deprecated' test.out

#- 269 PublicGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '60ejuCIZ' \
    --platformUserId 'Ssr5tUXY' \
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
    --requestId '4Onx8nl4' \
    > test.out 2>&1
eval_tap $? 271 'PublicGetAsyncStatus' test.out

#- 272 PublicSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam publicSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by '6rUIu9XD' \
    --limit '14' \
    --offset '60' \
    --platformBy 'HvhHKb3Q' \
    --platformId 'Vg0JT34F' \
    --query 'RQVqwj5C' \
    > test.out 2>&1
eval_tap $? 272 'PublicSearchUserV3' test.out

#- 273 PublicCreateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "PNZUMFmu", "acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "VoSDsaHR", "policyId": "Vgb5EpPh", "policyVersionId": "OwhW10Fx"}, {"isAccepted": false, "localizedPolicyVersionId": "XxirKXke", "policyId": "ATqvauja", "policyVersionId": "WMGBedvD"}, {"isAccepted": true, "localizedPolicyVersionId": "PfQM9nVu", "policyId": "3FvH98s3", "policyVersionId": "bzm64Oe3"}], "authType": "PKA7V3ty", "code": "gEbhmtRX", "country": "a8l7dA1o", "dateOfBirth": "KCRiMnAT", "displayName": "IOqpHLgx", "emailAddress": "fb9IfQKb", "password": "f4YwiDct", "reachMinimumAge": false, "uniqueDisplayName": "xB8ZfiMR"}' \
    > test.out 2>&1
eval_tap $? 273 'PublicCreateUserV3' test.out

#- 274 CheckUserAvailability
./ng net.accelbyte.sdk.cli.Main iam checkUserAvailability \
    --namespace "$AB_NAMESPACE" \
    --field 'GX3evnQi' \
    --query 'xcDVBu3k' \
    > test.out 2>&1
eval_tap $? 274 'CheckUserAvailability' test.out

#- 275 PublicBulkGetUsers
./ng net.accelbyte.sdk.cli.Main iam publicBulkGetUsers \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["cM7f9H43", "Pc41g1aw", "hCuzIwE3"]}' \
    > test.out 2>&1
eval_tap $? 275 'PublicBulkGetUsers' test.out

#- 276 PublicSendRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicSendRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "PnrBG1it", "languageTag": "b5jCWJxc"}' \
    > test.out 2>&1
eval_tap $? 276 'PublicSendRegistrationCode' test.out

#- 277 PublicVerifyRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicVerifyRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "WHHcjZ5H", "emailAddress": "YZcn6jdc"}' \
    > test.out 2>&1
eval_tap $? 277 'PublicVerifyRegistrationCode' test.out

#- 278 PublicForgotPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicForgotPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "LKGmYHHA", "languageTag": "rmD9Bpag"}' \
    > test.out 2>&1
eval_tap $? 278 'PublicForgotPasswordV3' test.out

#- 279 PublicValidateUserInput
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserInput \
    --namespace "$AB_NAMESPACE" \
    --body '{"displayName": "Liwhw02e", "password": "hLP4cz7S", "uniqueDisplayName": "4FOs7MRs", "username": "M5giZ9S0"}' \
    > test.out 2>&1
eval_tap $? 279 'PublicValidateUserInput' test.out

#- 280 GetAdminInvitationV3
./ng net.accelbyte.sdk.cli.Main iam getAdminInvitationV3 \
    --invitationId 'jBC3mQQS' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 280 'GetAdminInvitationV3' test.out

#- 281 CreateUserFromInvitationV3
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV3 \
    --invitationId 'ZNFPQMQ3' \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "IBCHgLse", "acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "tJSojejW", "policyId": "0xhGnmCo", "policyVersionId": "PHQb9LCZ"}, {"isAccepted": true, "localizedPolicyVersionId": "2MsvWwJX", "policyId": "aVbTKCai", "policyVersionId": "TmT3BjGd"}, {"isAccepted": false, "localizedPolicyVersionId": "iCzBkCOb", "policyId": "VglQQZnd", "policyVersionId": "InkbECiU"}], "authType": "YF4VqfQm", "code": "al8UBcvs", "country": "2nPcRWIW", "dateOfBirth": "5IGupkpJ", "displayName": "SE2uQp0v", "emailAddress": "w2cg1VXx", "password": "TGrIP1XT", "reachMinimumAge": true, "uniqueDisplayName": "BI9OFmTd"}' \
    > test.out 2>&1
eval_tap $? 281 'CreateUserFromInvitationV3' test.out

#- 282 UpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam updateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "mr3bkQm0", "country": "WpeKOwVS", "dateOfBirth": "FjGxgsWA", "displayName": "AStuDlgF", "languageTag": "c9J4xibe", "uniqueDisplayName": "41SU7v0W", "userName": "jSC1la5z"}' \
    > test.out 2>&1
eval_tap $? 282 'UpdateUserV3' test.out

#- 283 PublicPartialUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicPartialUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "Hrq7PjYP", "country": "f9ocjs6i", "dateOfBirth": "CmWQa01v", "displayName": "09VNaqYf", "languageTag": "tgNqcq5k", "uniqueDisplayName": "2mZUsO8B", "userName": "GR6mNJQv"}' \
    > test.out 2>&1
eval_tap $? 283 'PublicPartialUpdateUserV3' test.out

#- 284 PublicSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"context": "8yOpYX7U", "emailAddress": "kL38ez55", "languageTag": "eZfqYabU"}' \
    > test.out 2>&1
eval_tap $? 284 'PublicSendVerificationCodeV3' test.out

#- 285 PublicUserVerificationV3
./ng net.accelbyte.sdk.cli.Main iam publicUserVerificationV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "ZgJ5vdkB", "contactType": "iaEpWkaU", "languageTag": "wSrvynKq", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 285 'PublicUserVerificationV3' test.out

#- 286 PublicUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "HpVZ4EUD", "country": "d6iCBAix", "dateOfBirth": "0WWmW1TO", "displayName": "8c3KJ4Ji", "emailAddress": "aSW5CNRq", "password": "M93HltEl", "uniqueDisplayName": "Om8AjSFO", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 286 'PublicUpgradeHeadlessAccountV3' test.out

#- 287 PublicVerifyHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --needVerificationCode  \
    --body '{"emailAddress": "ap2Gr9Bi", "password": "7Lmw7M7S"}' \
    > test.out 2>&1
eval_tap $? 287 'PublicVerifyHeadlessAccountV3' test.out

#- 288 PublicUpdatePasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicUpdatePasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"languageTag": "489eNV4n", "mfaToken": "wBdNtiV9", "newPassword": "PMjPQcOY", "oldPassword": "8mbb9BHl"}' \
    > test.out 2>&1
eval_tap $? 288 'PublicUpdatePasswordV3' test.out

#- 289 PublicCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam publicCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'XhObq0z6' \
    > test.out 2>&1
eval_tap $? 289 'PublicCreateJusticeUser' test.out

#- 290 PublicPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Dfnm7Chj' \
    --redirectUri 'mzfXXNlO' \
    --ticket 'X4v7lyKp' \
    > test.out 2>&1
eval_tap $? 290 'PublicPlatformLinkV3' test.out

#- 291 PublicPlatformUnlinkV3
eval_tap 0 291 'PublicPlatformUnlinkV3 # SKIP deprecated' test.out

#- 292 PublicPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'KZcaFWdV' \
    > test.out 2>&1
eval_tap $? 292 'PublicPlatformUnlinkAllV3' test.out

#- 293 PublicForcePlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicForcePlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'eW0Nujux' \
    --ticket 'f6ZwAtSd' \
    > test.out 2>&1
eval_tap $? 293 'PublicForcePlatformLinkV3' test.out

#- 294 PublicWebLinkPlatform
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatform \
    --namespace "$AB_NAMESPACE" \
    --platformId 'jC4bTYhj' \
    --clientId 'GS5BCgID' \
    --redirectUri 'QwKmyNQt' \
    > test.out 2>&1
eval_tap $? 294 'PublicWebLinkPlatform' test.out

#- 295 PublicWebLinkPlatformEstablish
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatformEstablish \
    --namespace "$AB_NAMESPACE" \
    --platformId 'lw1uk8Xs' \
    --code 'wJCQb65m' \
    --state 'wQ0MjYxE' \
    > test.out 2>&1
eval_tap $? 295 'PublicWebLinkPlatformEstablish' test.out

#- 296 PublicProcessWebLinkPlatformV3
./ng net.accelbyte.sdk.cli.Main iam publicProcessWebLinkPlatformV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'hNnzCdXz' \
    --code 'UhFtnnLF' \
    --state 'OIPzvuX1' \
    > test.out 2>&1
eval_tap $? 296 'PublicProcessWebLinkPlatformV3' test.out

#- 297 PublicGetUsersPlatformInfosV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUsersPlatformInfosV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"platformId": "76tNvL0K", "userIds": ["jUTcpAD9", "KMRV9WpU", "9PSP7tqi"]}' \
    > test.out 2>&1
eval_tap $? 297 'PublicGetUsersPlatformInfosV3' test.out

#- 298 ResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam resetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientId": "voBBPaVM", "code": "JPc5u2Mx", "emailAddress": "Z0KzZKvl", "languageTag": "2uIvjnqT", "newPassword": "d2gDCCtI"}' \
    > test.out 2>&1
eval_tap $? 298 'ResetPasswordV3' test.out

#- 299 PublicGetUserByUserIdV3
eval_tap 0 299 'PublicGetUserByUserIdV3 # SKIP deprecated' test.out

#- 300 PublicGetUserBanHistoryV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserBanHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'nwWVdnVf' \
    --activeOnly  \
    --after 'ErxXPBmX' \
    --before '0SSaW3UV' \
    --limit '27' \
    > test.out 2>&1
eval_tap $? 300 'PublicGetUserBanHistoryV3' test.out

#- 301 PublicListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'p53vbNev' \
    > test.out 2>&1
eval_tap $? 301 'PublicListUserAllPlatformAccountsDistinctV3' test.out

#- 302 PublicGetUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'y72oH0z7' \
    > test.out 2>&1
eval_tap $? 302 'PublicGetUserInformationV3' test.out

#- 303 PublicGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'rWht6ttL' \
    --after '0.0037121378235979163' \
    --before '0.5881642241137027' \
    --limit '61' \
    > test.out 2>&1
eval_tap $? 303 'PublicGetUserLoginHistoriesV3' test.out

#- 304 PublicGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'xMYZ7H1z' \
    --after 'gMUI7t1N' \
    --before 'KXrG4LAH' \
    --limit '4' \
    --platformId 'ebeM3B6Y' \
    > test.out 2>&1
eval_tap $? 304 'PublicGetUserPlatformAccountsV3' test.out

#- 305 PublicListJusticePlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicListJusticePlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'hk3KX3Cr' \
    > test.out 2>&1
eval_tap $? 305 'PublicListJusticePlatformAccountsV3' test.out

#- 306 PublicLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam publicLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'Y5DXwDzc' \
    --body '{"platformId": "fqhiKXB9", "platformUserId": "smVxtVWQ"}' \
    > test.out 2>&1
eval_tap $? 306 'PublicLinkPlatformAccount' test.out

#- 307 PublicForceLinkPlatformWithProgression
./ng net.accelbyte.sdk.cli.Main iam publicForceLinkPlatformWithProgression \
    --namespace "$AB_NAMESPACE" \
    --userId '8xKZM0Qn' \
    --body '{"chosenNamespaces": ["a8vU3DZN", "GMyU2mjH", "4M2vpc9i"], "requestId": "aCuiXJUa"}' \
    > test.out 2>&1
eval_tap $? 307 'PublicForceLinkPlatformWithProgression' test.out

#- 308 PublicGetPublisherUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetPublisherUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'SZqBgKMg' \
    > test.out 2>&1
eval_tap $? 308 'PublicGetPublisherUserV3' test.out

#- 309 PublicValidateUserByUserIDAndPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserByUserIDAndPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Rjn1PTHz' \
    --password 'Mv1jyhvP' \
    > test.out 2>&1
eval_tap $? 309 'PublicValidateUserByUserIDAndPasswordV3' test.out

#- 310 PublicGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRolesV3 \
    --after 'lZMQPijU' \
    --before 'GD3TQhAf' \
    --isWildcard  \
    --limit '4' \
    > test.out 2>&1
eval_tap $? 310 'PublicGetRolesV3' test.out

#- 311 PublicGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRoleV3 \
    --roleId 'aiZoTzmW' \
    > test.out 2>&1
eval_tap $? 311 'PublicGetRoleV3' test.out

#- 312 PublicGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyUserV3 \
    --includeAllPlatforms  \
    > test.out 2>&1
eval_tap $? 312 'PublicGetMyUserV3' test.out

#- 313 PublicGetLinkHeadlessAccountToMyAccountConflictV3
./ng net.accelbyte.sdk.cli.Main iam publicGetLinkHeadlessAccountToMyAccountConflictV3 \
    --oneTimeLinkCode 'BBppiYCM' \
    > test.out 2>&1
eval_tap $? 313 'PublicGetLinkHeadlessAccountToMyAccountConflictV3' test.out

#- 314 LinkHeadlessAccountToMyAccountV3
./ng net.accelbyte.sdk.cli.Main iam linkHeadlessAccountToMyAccountV3 \
    --body '{"chosenNamespaces": ["zf77VV0g", "bywjGacl", "hh6hJcrN"], "oneTimeLinkCode": "b3XrOtmP"}' \
    > test.out 2>&1
eval_tap $? 314 'LinkHeadlessAccountToMyAccountV3' test.out

#- 315 PublicGetMyProfileAllowUpdateStatusV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyProfileAllowUpdateStatusV3 \
    > test.out 2>&1
eval_tap $? 315 'PublicGetMyProfileAllowUpdateStatusV3' test.out

#- 316 PublicSendVerificationLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationLinkV3 \
    --body '{"languageTag": "jYgeVDay"}' \
    > test.out 2>&1
eval_tap $? 316 'PublicSendVerificationLinkV3' test.out

#- 317 PublicVerifyUserByLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyUserByLinkV3 \
    --code 'dnqHRTDH' \
    > test.out 2>&1
eval_tap $? 317 'PublicVerifyUserByLinkV3' test.out

#- 318 PlatformAuthenticateSAMLV3Handler
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticateSAMLV3Handler \
    --platformId 'MD0x2LD1' \
    --code 'XlC4LAWI' \
    --error 'Zh9j3xwa' \
    --state 'RDVmLr71' \
    > test.out 2>&1
eval_tap $? 318 'PlatformAuthenticateSAMLV3Handler' test.out

#- 319 LoginSSOClient
./ng net.accelbyte.sdk.cli.Main iam loginSSOClient \
    --platformId 'ZWEpUMaK' \
    --payload '0gWQBQo4' \
    > test.out 2>&1
eval_tap $? 319 'LoginSSOClient' test.out

#- 320 LogoutSSOClient
./ng net.accelbyte.sdk.cli.Main iam logoutSSOClient \
    --platformId 'TnaGcmTi' \
    > test.out 2>&1
eval_tap $? 320 'LogoutSSOClient' test.out

#- 321 RequestTargetTokenResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTargetTokenResponseV3 \
    --additionalData 'xg7pe7YM' \
    --code 'VN6ccTdZ' \
    > test.out 2>&1
eval_tap $? 321 'RequestTargetTokenResponseV3' test.out

#- 322 AdminListInvitationHistoriesV4
./ng net.accelbyte.sdk.cli.Main iam adminListInvitationHistoriesV4 \
    --limit '65' \
    --namespace "$AB_NAMESPACE" \
    --offset '80' \
    > test.out 2>&1
eval_tap $? 322 'AdminListInvitationHistoriesV4' test.out

#- 323 AdminGetDevicesByUserV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDevicesByUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ICNgYB7M' \
    > test.out 2>&1
eval_tap $? 323 'AdminGetDevicesByUserV4' test.out

#- 324 AdminGetBannedDevicesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedDevicesV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceType 'UB38rVPl' \
    --endDate 'ou8TWHzZ' \
    --limit '43' \
    --offset '20' \
    --startDate 'XtcYoez4' \
    > test.out 2>&1
eval_tap $? 324 'AdminGetBannedDevicesV4' test.out

#- 325 AdminGetUserDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeviceBansV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'HoM1evzV' \
    > test.out 2>&1
eval_tap $? 325 'AdminGetUserDeviceBansV4' test.out

#- 326 AdminBanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminBanDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"comment": "kkHHQ8MD", "deviceId": "qTGxVw7J", "deviceType": "EU4cKYhF", "enabled": true, "endDate": "tTs5vsSM", "ext": {"e6jWb6bD": {}, "COLIaQ6W": {}, "wpUUvRz9": {}}, "reason": "fjevC5SC"}' \
    > test.out 2>&1
eval_tap $? 326 'AdminBanDeviceV4' test.out

#- 327 AdminGetDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBanV4 \
    --banId 'j89mAUUo' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 327 'AdminGetDeviceBanV4' test.out

#- 328 AdminUpdateDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateDeviceBanV4 \
    --banId 'zMB3dLch' \
    --namespace "$AB_NAMESPACE" \
    --body '{"enabled": false}' \
    > test.out 2>&1
eval_tap $? 328 'AdminUpdateDeviceBanV4' test.out

#- 329 AdminGenerateReportV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateReportV4 \
    --namespace "$AB_NAMESPACE" \
    --endDate '2gMBvdv7' \
    --startDate 'S1QwbJr3' \
    --deviceType 'UYi869ao' \
    > test.out 2>&1
eval_tap $? 329 'AdminGenerateReportV4' test.out

#- 330 AdminGetDeviceTypesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceTypesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 330 'AdminGetDeviceTypesV4' test.out

#- 331 AdminGetDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBansV4 \
    --deviceId 'TjvdMulU' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 331 'AdminGetDeviceBansV4' test.out

#- 332 AdminDecryptDeviceV4
eval_tap 0 332 'AdminDecryptDeviceV4 # SKIP deprecated' test.out

#- 333 AdminUnbanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminUnbanDeviceV4 \
    --deviceId 'y46QfwAM' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 333 'AdminUnbanDeviceV4' test.out

#- 334 AdminGetUsersByDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUsersByDeviceV4 \
    --deviceId 'QwUDPr2B' \
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
    --limit '58' \
    --offset '25' \
    > test.out 2>&1
eval_tap $? 336 'AdminGetNamespaceUserInvitationHistoryV4' test.out

#- 337 AdminCreateTestUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateTestUsersV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 12, "userInfo": {"country": "3nDLRpmY"}}' \
    > test.out 2>&1
eval_tap $? 337 'AdminCreateTestUsersV4' test.out

#- 338 AdminCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "gTDQ9wVx", "policyId": "jJv2wWH5", "policyVersionId": "rIqL8G7Q"}, {"isAccepted": true, "localizedPolicyVersionId": "RxkA79jk", "policyId": "UsAk4uTJ", "policyVersionId": "mHBUKZ9A"}, {"isAccepted": true, "localizedPolicyVersionId": "AKK4XbEY", "policyId": "mskOk8Sb", "policyVersionId": "JyPv0VdQ"}], "authType": "EMAILPASSWD", "code": "hTtWDY9i", "country": "u7Fiu8m9", "dateOfBirth": "faHmD81K", "displayName": "s4VD3dJK", "emailAddress": "Qqe35x2O", "password": "liwMODE2", "passwordMD5Sum": "Lfm1KLSm", "reachMinimumAge": false, "uniqueDisplayName": "Datr2nmp", "username": "MmKxh3zU"}' \
    > test.out 2>&1
eval_tap $? 338 'AdminCreateUserV4' test.out

#- 339 AdminBulkUpdateUserAccountTypeV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateUserAccountTypeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"testAccount": false, "userIds": ["XbxMDrx5", "wtGNzxLm", "kHsNpcVN"]}' \
    > test.out 2>&1
eval_tap $? 339 'AdminBulkUpdateUserAccountTypeV4' test.out

#- 340 AdminBulkCheckValidUserIDV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkCheckValidUserIDV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["OtDWtQnI", "b9O8sVIi", "xRpuyLgy"]}' \
    > test.out 2>&1
eval_tap $? 340 'AdminBulkCheckValidUserIDV4' test.out

#- 341 AdminUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '2gXKgqKp' \
    --body '{"avatarUrl": "d3O7O3Td", "country": "a10QMgfb", "dateOfBirth": "Ujehu1BN", "displayName": "sV6j6wJT", "languageTag": "WfZFj4lf", "skipLoginQueue": true, "uniqueDisplayName": "lsOvVeHc", "userName": "8YttSUOv"}' \
    > test.out 2>&1
eval_tap $? 341 'AdminUpdateUserV4' test.out

#- 342 AdminUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ERMBgtKx' \
    --body '{"code": "9QqtYf2U", "emailAddress": "X9ssfKTs"}' \
    > test.out 2>&1
eval_tap $? 342 'AdminUpdateUserEmailAddressV4' test.out

#- 343 AdminDisableUserMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableUserMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ldOc9AjU' \
    --body '{"factor": "urFBa6LO", "mfaToken": "SwdYdLUU"}' \
    > test.out 2>&1
eval_tap $? 343 'AdminDisableUserMFAV4' test.out

#- 344 AdminGetUserMFAStatusV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUserMFAStatusV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '0N85Psi6' \
    > test.out 2>&1
eval_tap $? 344 'AdminGetUserMFAStatusV4' test.out

#- 345 AdminListUserRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminListUserRolesV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'iCBlX7zz' \
    > test.out 2>&1
eval_tap $? 345 'AdminListUserRolesV4' test.out

#- 346 AdminUpdateUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'LZZIvHHm' \
    --body '{"assignedNamespaces": ["7E20KFEP", "99vBj0tV", "pOcITk8o"], "roleId": "fYCvZDie"}' \
    > test.out 2>&1
eval_tap $? 346 'AdminUpdateUserRoleV4' test.out

#- 347 AdminAddUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '3dwHmK3x' \
    --body '{"assignedNamespaces": ["GSeQPzZ6", "EQFbY2LE", "L2qoLyZS"], "roleId": "lmxuI343"}' \
    > test.out 2>&1
eval_tap $? 347 'AdminAddUserRoleV4' test.out

#- 348 AdminRemoveUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRemoveUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'QkXEfta0' \
    --body '{"assignedNamespaces": ["UVRFXuic", "8knYvkUF", "ENY00bUq"], "roleId": "xIRvVUPR"}' \
    > test.out 2>&1
eval_tap $? 348 'AdminRemoveUserRoleV4' test.out

#- 349 AdminGetRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV4 \
    --adminRole  \
    --isWildcard  \
    --limit '100' \
    --offset '80' \
    > test.out 2>&1
eval_tap $? 349 'AdminGetRolesV4' test.out

#- 350 AdminCreateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV4 \
    --body '{"adminRole": false, "deletable": false, "isWildcard": false, "roleName": "M7UaXRPR"}' \
    > test.out 2>&1
eval_tap $? 350 'AdminCreateRoleV4' test.out

#- 351 AdminGetRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV4 \
    --roleId 'NjcptbCX' \
    > test.out 2>&1
eval_tap $? 351 'AdminGetRoleV4' test.out

#- 352 AdminDeleteRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV4 \
    --roleId 'vtWb1Qrl' \
    > test.out 2>&1
eval_tap $? 352 'AdminDeleteRoleV4' test.out

#- 353 AdminUpdateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV4 \
    --roleId 'LJAvxi7H' \
    --body '{"adminRole": false, "deletable": false, "isWildcard": false, "roleName": "EasfLVPk"}' \
    > test.out 2>&1
eval_tap $? 353 'AdminUpdateRoleV4' test.out

#- 354 AdminUpdateRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV4 \
    --roleId '6VEKjEvb' \
    --body '{"permissions": [{"action": 36, "resource": "ww7XZR5C", "schedAction": 92, "schedCron": "3WH0WiyS", "schedRange": ["KtlkHBRl", "7GCqcSqs", "uW2CH3sy"]}, {"action": 0, "resource": "jzQbr7dm", "schedAction": 47, "schedCron": "bgTfG1YF", "schedRange": ["mFaToyLt", "ifZgEm3p", "zU6CpKGf"]}, {"action": 65, "resource": "UTm2JC2W", "schedAction": 79, "schedCron": "ysRyilkN", "schedRange": ["uYezBoT4", "cV3RBHyb", "EXjVN6r3"]}]}' \
    > test.out 2>&1
eval_tap $? 354 'AdminUpdateRolePermissionsV4' test.out

#- 355 AdminAddRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV4 \
    --roleId 'N9EhPxPh' \
    --body '{"permissions": [{"action": 67, "resource": "Sbc00ASw", "schedAction": 58, "schedCron": "j9nxmgep", "schedRange": ["TbrSCjPI", "HV6mImd9", "RyMMRjb8"]}, {"action": 12, "resource": "PglZGkts", "schedAction": 58, "schedCron": "I8mxA2Ys", "schedRange": ["2rZ21GFb", "3KKlaDzU", "EHRNG3pe"]}, {"action": 9, "resource": "M9mZ7u3E", "schedAction": 85, "schedCron": "9jbRfbvE", "schedRange": ["vMrun0UT", "gaAnhWaM", "DBzQyGAM"]}]}' \
    > test.out 2>&1
eval_tap $? 355 'AdminAddRolePermissionsV4' test.out

#- 356 AdminDeleteRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV4 \
    --roleId 'aaOH9EwT' \
    --body '["xaiOoKzS", "hEST4Uem", "TfN6etFJ"]' \
    > test.out 2>&1
eval_tap $? 356 'AdminDeleteRolePermissionsV4' test.out

#- 357 AdminListAssignedUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminListAssignedUsersV4 \
    --roleId 'bFsZB3ex' \
    --after 'UTvARZPD' \
    --before 'BSt6WIbn' \
    --limit '69' \
    > test.out 2>&1
eval_tap $? 357 'AdminListAssignedUsersV4' test.out

#- 358 AdminAssignUserToRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAssignUserToRoleV4 \
    --roleId 'eUGNDKL1' \
    --body '{"assignedNamespaces": ["nFZl9MqE", "AvbbGSXP", "9gscsbsD"], "namespace": "RiLFa73d", "userId": "u0L7cMG3"}' \
    > test.out 2>&1
eval_tap $? 358 'AdminAssignUserToRoleV4' test.out

#- 359 AdminRevokeUserFromRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRevokeUserFromRoleV4 \
    --roleId 'lkkPnTu7' \
    --body '{"namespace": "cPSAnEOw", "userId": "6wTBN0jS"}' \
    > test.out 2>&1
eval_tap $? 359 'AdminRevokeUserFromRoleV4' test.out

#- 360 AdminInviteUserNewV4
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserNewV4 \
    --body '{"assignedNamespaces": ["pRt9oegi", "dT4F7Ffp", "xxsV70CQ"], "emailAddresses": ["5M6Obsqd", "tb1NK1Nw", "sBhUEYdy"], "isAdmin": true, "isNewStudio": false, "languageTag": "bTzV8ilL", "namespace": "6VQUg9EZ", "roleId": "iPKxZ2mJ"}' \
    > test.out 2>&1
eval_tap $? 360 'AdminInviteUserNewV4' test.out

#- 361 AdminUpdateMyUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateMyUserV4 \
    --body '{"avatarUrl": "6aRHGpJE", "country": "ysUYbiT0", "dateOfBirth": "kN4HQXAx", "displayName": "FsjzLLxO", "languageTag": "WxuQgOeq", "skipLoginQueue": true, "uniqueDisplayName": "3KoJS0dM", "userName": "ACNX150n"}' \
    > test.out 2>&1
eval_tap $? 361 'AdminUpdateMyUserV4' test.out

#- 362 AdminDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyAuthenticatorV4 \
    --body '{"factor": "3fYZ498i", "mfaToken": "tkGW9Pp0"}' \
    > test.out 2>&1
eval_tap $? 362 'AdminDisableMyAuthenticatorV4' test.out

#- 363 AdminEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyAuthenticatorV4 \
    --code 'AwQ1MixY' \
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
    --body '{"factor": "eRAlMHVP", "mfaToken": "zZPJdREZ"}' \
    > test.out 2>&1
eval_tap $? 367 'AdminDisableMyBackupCodesV4' test.out

#- 368 AdminDownloadMyBackupCodesV4
eval_tap 0 368 'AdminDownloadMyBackupCodesV4 # SKIP deprecated' test.out

#- 369 AdminEnableMyBackupCodesV4
eval_tap 0 369 'AdminEnableMyBackupCodesV4 # SKIP deprecated' test.out

#- 370 AdminGetBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBackupCodesV4 \
    --languageTag '7imxR0UH' \
    > test.out 2>&1
eval_tap $? 370 'AdminGetBackupCodesV4' test.out

#- 371 AdminGenerateBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateBackupCodesV4 \
    --languageTag 'rYRMTjYS' \
    > test.out 2>&1
eval_tap $? 371 'AdminGenerateBackupCodesV4' test.out

#- 372 AdminEnableBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableBackupCodesV4 \
    --languageTag 'eQaJc3O3' \
    > test.out 2>&1
eval_tap $? 372 'AdminEnableBackupCodesV4' test.out

#- 373 AdminChallengeMyMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminChallengeMyMFAV4 \
    --code 'fNHhPHCp' \
    --factor 'liiOYLAt' \
    > test.out 2>&1
eval_tap $? 373 'AdminChallengeMyMFAV4' test.out

#- 374 AdminSendMyMFAEmailCodeV4
./ng net.accelbyte.sdk.cli.Main iam adminSendMyMFAEmailCodeV4 \
    --action 'OFGBNGEI' \
    --languageTag 'yeogsYQT' \
    > test.out 2>&1
eval_tap $? 374 'AdminSendMyMFAEmailCodeV4' test.out

#- 375 AdminDisableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyEmailV4 \
    --body '{"factor": "EtjmRT0I", "mfaToken": "JRF6LVuG"}' \
    > test.out 2>&1
eval_tap $? 375 'AdminDisableMyEmailV4' test.out

#- 376 AdminEnableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyEmailV4 \
    --code 'NGl6vapU' \
    > test.out 2>&1
eval_tap $? 376 'AdminEnableMyEmailV4' test.out

#- 377 AdminGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyEnabledFactorsV4 \
    > test.out 2>&1
eval_tap $? 377 'AdminGetMyEnabledFactorsV4' test.out

#- 378 AdminMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam adminMakeFactorMyDefaultV4 \
    --factor 'eDdFg1sJ' \
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
    --clientId 'lwFWbVqd' \
    --linkingToken 'LWDb231d' \
    --password 'C8ezRCa7' \
    --username 'VDC6OJcG' \
    > test.out 2>&1
eval_tap $? 382 'AuthenticationWithPlatformLinkV4' test.out

#- 383 GenerateTokenByNewHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV4 \
    --additionalData 'B1IEclkH' \
    --extendExp  \
    --linkingToken 'qrn0zhCZ' \
    > test.out 2>&1
eval_tap $? 383 'GenerateTokenByNewHeadlessAccountV4' test.out

#- 384 Verify2faCodeV4
./ng net.accelbyte.sdk.cli.Main iam verify2faCodeV4 \
    --code 'gd87VMyQ' \
    --factor 'e2Y582Bn' \
    --mfaToken 'zwsqWklw' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 384 'Verify2faCodeV4' test.out

#- 385 PlatformTokenGrantV4
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV4 \
    --platformId 'uP2m5Uow' \
    --codeChallenge 'vxDOQo9t' \
    --codeChallengeMethod 'plain' \
    --additionalData 'OKCmzEuH' \
    --clientId 'Q1JbGlvM' \
    --createHeadless  \
    --deviceId 'FXUnYTkF' \
    --macAddress 'DXQ7OueQ' \
    --platformToken 'd4UCBzCy' \
    --serviceLabel '0.4188324532760398' \
    --skipSetCookie  \
    > test.out 2>&1
eval_tap $? 385 'PlatformTokenGrantV4' test.out

#- 386 SimultaneousLoginV4
./ng net.accelbyte.sdk.cli.Main iam simultaneousLoginV4 \
    --codeChallenge '6aLZe8ht' \
    --codeChallengeMethod 'S256' \
    --simultaneousPlatform 'wMrDomc5' \
    --simultaneousTicket 'Z1d7Y0QR' \
    --nativePlatform 'epicgames' \
    --nativePlatformTicket 'JwMZDzSt' \
    > test.out 2>&1
eval_tap $? 386 'SimultaneousLoginV4' test.out

#- 387 TokenGrantV4
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV4 \
    --codeChallenge 'Eh2ocNXl' \
    --codeChallengeMethod 'S256' \
    --additionalData 's11nigNz' \
    --clientId '81zw2elN' \
    --clientSecret '8wJH7PAe' \
    --code 'cydOuLAD' \
    --codeVerifier '5BpDYFNX' \
    --extendNamespace 'vbufWSc6' \
    --extendExp  \
    --loginQueueTicket 'k8F0b8B1' \
    --password 'RalMZAue' \
    --redirectUri 'E7VuPdEG' \
    --refreshToken 'GhLfXxpz' \
    --username 'm3G9OzcE' \
    --grantType 'refresh_token' \
    > test.out 2>&1
eval_tap $? 387 'TokenGrantV4' test.out

#- 388 RequestTargetTokenResponseV4
./ng net.accelbyte.sdk.cli.Main iam requestTargetTokenResponseV4 \
    --additionalData 'IxMDXvXk' \
    --code 'rFwovGK7' \
    > test.out 2>&1
eval_tap $? 388 'RequestTargetTokenResponseV4' test.out

#- 389 PublicListUserIDByPlatformUserIDsV4
./ng net.accelbyte.sdk.cli.Main iam publicListUserIDByPlatformUserIDsV4 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'lGh87noI' \
    --rawPUID  \
    --body '{"platformUserIds": ["Ly13NhmT", "4eTI1kEd", "jD2otdZd"]}' \
    > test.out 2>&1
eval_tap $? 389 'PublicListUserIDByPlatformUserIDsV4' test.out

#- 390 PublicCreateTestUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateTestUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "LmEQADCC", "policyId": "bCAYyOI9", "policyVersionId": "ZbAbieRr"}, {"isAccepted": true, "localizedPolicyVersionId": "dponGjjI", "policyId": "sAEgoJqA", "policyVersionId": "qdP2S0sg"}, {"isAccepted": false, "localizedPolicyVersionId": "Tu4qGidN", "policyId": "556V9J6f", "policyVersionId": "Ss4vMUMO"}], "authType": "EMAILPASSWD", "country": "ZTuqpI2b", "dateOfBirth": "oQJex417", "displayName": "ItaixM3S", "emailAddress": "gKNSYM8s", "password": "rdmW1ZhY", "passwordMD5Sum": "vitXhnV2", "uniqueDisplayName": "ksVPWv9n", "username": "vUdBL9EG", "verified": false}' \
    > test.out 2>&1
eval_tap $? 390 'PublicCreateTestUserV4' test.out

#- 391 PublicCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "UwSFB3M3", "policyId": "hUiFGFcu", "policyVersionId": "js1Oxihl"}, {"isAccepted": false, "localizedPolicyVersionId": "xPmtiwWJ", "policyId": "pwVvTeFC", "policyVersionId": "JTE6TqW6"}, {"isAccepted": false, "localizedPolicyVersionId": "2YCNoaad", "policyId": "bNQ2u4zT", "policyVersionId": "xwt1XpRr"}], "authType": "EMAILPASSWD", "code": "MPt0KfV8", "country": "N8vt9ZGP", "dateOfBirth": "Np6pUb2u", "displayName": "Hoe5mPgU", "emailAddress": "8Ox4Wo9Q", "password": "Nu4hsyeB", "passwordMD5Sum": "sVJmlUjy", "reachMinimumAge": false, "uniqueDisplayName": "JQm3Pd5e", "username": "7R3fM6Dw"}' \
    > test.out 2>&1
eval_tap $? 391 'PublicCreateUserV4' test.out

#- 392 CreateUserFromInvitationV4
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV4 \
    --invitationId 'hYjDce9K' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "rLB7fl8G", "policyId": "HbzZAzS6", "policyVersionId": "lpFwvNLS"}, {"isAccepted": true, "localizedPolicyVersionId": "eio5UmHS", "policyId": "7FI2lgRH", "policyVersionId": "LvM3GWwr"}, {"isAccepted": true, "localizedPolicyVersionId": "yKLphPtf", "policyId": "QZ8Tl5ho", "policyVersionId": "ZxogVHuM"}], "authType": "EMAILPASSWD", "code": "BsdELQTP", "country": "m384CQCV", "dateOfBirth": "5WBylecp", "displayName": "J6Ak1Kr8", "emailAddress": "gW4Udfzm", "password": "3bTLNE7r", "passwordMD5Sum": "J7uDAPeJ", "reachMinimumAge": false, "uniqueDisplayName": "36DAy5FU", "username": "Fcx1WscM"}' \
    > test.out 2>&1
eval_tap $? 392 'CreateUserFromInvitationV4' test.out

#- 393 PublicUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "D1MKyAWX", "country": "ERzDDMW5", "dateOfBirth": "cNHCqO21", "displayName": "lPKhQW69", "languageTag": "WmMtpEMy", "uniqueDisplayName": "zEhugSFx", "userName": "IuowSMFb"}' \
    > test.out 2>&1
eval_tap $? 393 'PublicUpdateUserV4' test.out

#- 394 PublicUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "hDiteFbM", "emailAddress": "jCDAV7TD"}' \
    > test.out 2>&1
eval_tap $? 394 'PublicUpdateUserEmailAddressV4' test.out

#- 395 PublicUpgradeHeadlessAccountWithVerificationCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountWithVerificationCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "1F4GkjDy", "country": "ZaC26RXC", "dateOfBirth": "eDBjNiFg", "displayName": "eg87aaAf", "emailAddress": "mEFh7VNj", "password": "oC6jHkM6", "reachMinimumAge": false, "uniqueDisplayName": "c68mlsGb", "username": "aV8CDneI", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 395 'PublicUpgradeHeadlessAccountWithVerificationCodeV4' test.out

#- 396 PublicUpgradeHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "eQjKTyQB", "password": "epojPV3V", "username": "jg5cA76x"}' \
    > test.out 2>&1
eval_tap $? 396 'PublicUpgradeHeadlessAccountV4' test.out

#- 397 PublicDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"factor": "37BnsVBg", "mfaToken": "LyTBHN8V"}' \
    > test.out 2>&1
eval_tap $? 397 'PublicDisableMyAuthenticatorV4' test.out

#- 398 PublicEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'usz55LdW' \
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
    --body '{"factor": "584RtekI", "mfaToken": "egko2G5C"}' \
    > test.out 2>&1
eval_tap $? 402 'PublicDisableMyBackupCodesV4' test.out

#- 403 PublicDownloadMyBackupCodesV4
eval_tap 0 403 'PublicDownloadMyBackupCodesV4 # SKIP deprecated' test.out

#- 404 PublicEnableMyBackupCodesV4
eval_tap 0 404 'PublicEnableMyBackupCodesV4 # SKIP deprecated' test.out

#- 405 PublicGetBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGetBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --languageTag 'TFziBteX' \
    > test.out 2>&1
eval_tap $? 405 'PublicGetBackupCodesV4' test.out

#- 406 PublicGenerateBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --languageTag 'EVzeWF09' \
    > test.out 2>&1
eval_tap $? 406 'PublicGenerateBackupCodesV4' test.out

#- 407 PublicEnableBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --languageTag 'F02tuZkB' \
    > test.out 2>&1
eval_tap $? 407 'PublicEnableBackupCodesV4' test.out

#- 408 PublicChallengeMyMFAV4
./ng net.accelbyte.sdk.cli.Main iam publicChallengeMyMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'CrRNJZb0' \
    --factor 'h72ZUH78' \
    > test.out 2>&1
eval_tap $? 408 'PublicChallengeMyMFAV4' test.out

#- 409 PublicRemoveTrustedDeviceV4
./ng net.accelbyte.sdk.cli.Main iam publicRemoveTrustedDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceToken 'Mp8lFt8t' \
    > test.out 2>&1
eval_tap $? 409 'PublicRemoveTrustedDeviceV4' test.out

#- 410 PublicSendMyMFAEmailCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicSendMyMFAEmailCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --action 'tuv8Qae3' \
    --languageTag 'hYSl2fJ9' \
    > test.out 2>&1
eval_tap $? 410 'PublicSendMyMFAEmailCodeV4' test.out

#- 411 PublicDisableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyEmailV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"factor": "lr39JAJb", "mfaToken": "crsLUS6C"}' \
    > test.out 2>&1
eval_tap $? 411 'PublicDisableMyEmailV4' test.out

#- 412 PublicEnableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyEmailV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'SQ2U0w8U' \
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
    --factor '4QFQQLOl' \
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
    --userId 'aLeqM0Iu' \
    > test.out 2>&1
eval_tap $? 417 'PublicGetUserPublicInfoByUserIdV4' test.out

#- 418 PublicInviteUserV4
./ng net.accelbyte.sdk.cli.Main iam publicInviteUserV4 \
    --body '{"additionalData": "KxEK3cod", "emailAddress": "mcNmyeGQ", "languageTag": "My5vkRyU", "namespace": "375TXXOZ", "namespaceDisplayName": "D0lt7zYM"}' \
    > test.out 2>&1
eval_tap $? 418 'PublicInviteUserV4' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
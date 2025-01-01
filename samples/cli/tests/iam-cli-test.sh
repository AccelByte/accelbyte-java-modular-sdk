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
echo "1..425"

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
    --body '{"modules": [{"docLink": "uJyC0FFV", "groups": [{"group": "47YpA0k3", "groupId": "C2Y9xUDn", "permissions": [{"allowedActions": [35, 66, 92], "resource": "hvvjoDKq"}, {"allowedActions": [95, 52, 79], "resource": "7dqBZWtw"}, {"allowedActions": [11, 20, 17], "resource": "elkWzOv2"}]}, {"group": "injwnnnO", "groupId": "6ojrZQoh", "permissions": [{"allowedActions": [82, 48, 71], "resource": "5mjmmL0e"}, {"allowedActions": [35, 64, 16], "resource": "ZDzXPRWD"}, {"allowedActions": [89, 18, 50], "resource": "KdjF5Q8F"}]}, {"group": "cUqHn3qm", "groupId": "xrwMvilZ", "permissions": [{"allowedActions": [81, 81, 27], "resource": "1tYKAj45"}, {"allowedActions": [16, 83, 55], "resource": "MHt0P78s"}, {"allowedActions": [76, 36, 13], "resource": "aiNgR6hU"}]}], "module": "0GB8yWqx", "moduleId": "3tSOQYRX"}, {"docLink": "2wIBwlc2", "groups": [{"group": "3iswnc5o", "groupId": "YjHWFv2j", "permissions": [{"allowedActions": [65, 92, 96], "resource": "JFtoyUJm"}, {"allowedActions": [37, 7, 4], "resource": "cykfB1YB"}, {"allowedActions": [81, 82, 21], "resource": "AoeYtzBy"}]}, {"group": "dRqmmBAx", "groupId": "XjuueFnX", "permissions": [{"allowedActions": [43, 64, 90], "resource": "7Ofm86Bo"}, {"allowedActions": [16, 40, 62], "resource": "A31fDzZt"}, {"allowedActions": [73, 52, 91], "resource": "PRVWyNqs"}]}, {"group": "eZLUdy6R", "groupId": "tV5TiS5Z", "permissions": [{"allowedActions": [45, 29, 80], "resource": "5kJOJnd4"}, {"allowedActions": [8, 13, 47], "resource": "wBeMRbEY"}, {"allowedActions": [67, 67, 13], "resource": "YzjjfrAT"}]}], "module": "oxwcxAwc", "moduleId": "v4dFkLFq"}, {"docLink": "NdROzEZl", "groups": [{"group": "ficggTXy", "groupId": "MAD9SlaB", "permissions": [{"allowedActions": [83, 57, 39], "resource": "bzOuiSRf"}, {"allowedActions": [55, 99, 57], "resource": "BTNkh1p7"}, {"allowedActions": [76, 72, 34], "resource": "dMcis1dp"}]}, {"group": "2Xo2p5Su", "groupId": "I4rKRguv", "permissions": [{"allowedActions": [92, 47, 58], "resource": "CgcnTpHH"}, {"allowedActions": [59, 62, 71], "resource": "RcloN35R"}, {"allowedActions": [18, 86, 63], "resource": "Tu9ThrIs"}]}, {"group": "V5J9eFba", "groupId": "8IqmMzQQ", "permissions": [{"allowedActions": [11, 86, 60], "resource": "DxavoW0h"}, {"allowedActions": [67, 3, 37], "resource": "deUBwVFq"}, {"allowedActions": [5, 12, 79], "resource": "lpV8ka7u"}]}], "module": "Y7pGLRrD", "moduleId": "E6KwYY0T"}]}' \
    > test.out 2>&1
eval_tap $? 109 'AdminUpdateAvailablePermissionsByModule' test.out

#- 110 AdminDeleteConfigPermissionsByGroup
./ng net.accelbyte.sdk.cli.Main iam adminDeleteConfigPermissionsByGroup \
    --forceDelete  \
    --body '{"groupId": "KaaMfQoW", "moduleId": "QrGSaC38"}' \
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
    --body '[{"field": "xROZ6Ifn", "validation": {"allowAllSpecialCharacters": true, "allowDigit": true, "allowLetter": false, "allowSpace": false, "allowUnicode": false, "avatarConfig": {"allowedPrefixes": ["mHoOGHdU", "ayhopgwZ", "gwUOh7cY"], "preferRegex": true, "regex": "fwp2zcvh"}, "blockedWord": ["lg4neFLI", "RDwIp8X0", "3gc4rzA9"], "description": [{"language": "IHViyWTK", "message": ["eFfikB53", "25YMxDwa", "uw4CG3BJ"]}, {"language": "O4W6ZFFc", "message": ["169paxr9", "F4bLWOBm", "LhGddqI9"]}, {"language": "G4Mq3kPs", "message": ["X6ls0wOf", "c5rOuf6z", "7RVcYeK6"]}], "isCustomRegex": true, "letterCase": "84nm9PjE", "maxLength": 27, "maxRepeatingAlphaNum": 78, "maxRepeatingSpecialCharacter": 44, "minCharType": 93, "minLength": 21, "profanityFilter": "BkkXgIgw", "regex": "ZLi1vCFv", "specialCharacterLocation": "zpjhVbvH", "specialCharacters": ["1xbXKypa", "MAgALUaB", "3DFOrHPj"]}}, {"field": "PFGUDi24", "validation": {"allowAllSpecialCharacters": true, "allowDigit": true, "allowLetter": true, "allowSpace": true, "allowUnicode": false, "avatarConfig": {"allowedPrefixes": ["yxaeIzwQ", "a6rgyj87", "ka1XA0cI"], "preferRegex": false, "regex": "1rhf5gyJ"}, "blockedWord": ["VYEdC0uq", "oIT6zrGd", "mkg48dym"], "description": [{"language": "0cob6Kdo", "message": ["nNcqX7Ac", "DWxq7usw", "HwN2VXeJ"]}, {"language": "Sud1aF1e", "message": ["XROY1HPB", "ZypHtzG3", "ezRnAHCf"]}, {"language": "DAdEHntB", "message": ["VPnCiIl2", "c3EU7DsS", "5fkb3YSO"]}], "isCustomRegex": true, "letterCase": "xDlpi02z", "maxLength": 66, "maxRepeatingAlphaNum": 68, "maxRepeatingSpecialCharacter": 71, "minCharType": 76, "minLength": 19, "profanityFilter": "zJdYavDM", "regex": "cZPIAIym", "specialCharacterLocation": "wJspVRxQ", "specialCharacters": ["pSKOJsza", "nVq09402", "wQRxpdF1"]}}, {"field": "rIWpqIOU", "validation": {"allowAllSpecialCharacters": true, "allowDigit": true, "allowLetter": false, "allowSpace": false, "allowUnicode": true, "avatarConfig": {"allowedPrefixes": ["RGXVAwsw", "f1KBbVzP", "ejYOKoOQ"], "preferRegex": false, "regex": "IT6OvXEa"}, "blockedWord": ["XUM25m3a", "l4R5VVtp", "EcF075xi"], "description": [{"language": "NEPOok2s", "message": ["oDOtHQsI", "PhnpnLXA", "UmiyLkk5"]}, {"language": "yIPGzX39", "message": ["xBGQQz1o", "FUPNvTKu", "1pQi6PPM"]}, {"language": "MWL1hCoo", "message": ["L7hiPEjb", "Iu25fqsj", "a0iKHHMV"]}], "isCustomRegex": false, "letterCase": "3bAZDaOq", "maxLength": 77, "maxRepeatingAlphaNum": 75, "maxRepeatingSpecialCharacter": 35, "minCharType": 43, "minLength": 80, "profanityFilter": "rLSGEZHD", "regex": "mifOxQkL", "specialCharacterLocation": "MSZgdzXs", "specialCharacters": ["kEYmL9ZL", "cxccqEFQ", "CvdvljTp"]}}]' \
    > test.out 2>&1
eval_tap $? 113 'AdminUpdateInputValidations' test.out

#- 114 AdminResetInputValidations
./ng net.accelbyte.sdk.cli.Main iam adminResetInputValidations \
    --field 'fTzENlQ1' \
    > test.out 2>&1
eval_tap $? 114 'AdminResetInputValidations' test.out

#- 115 ListAdminsV3
./ng net.accelbyte.sdk.cli.Main iam listAdminsV3 \
    --namespace "$AB_NAMESPACE" \
    --after '4UC138SG' \
    --before 'EpwLPGwj' \
    --endDate 'Pk7AtvaL' \
    --limit '8' \
    --query 'dWXCQHP9' \
    --roleId 'FuR1ZJ7d' \
    --startDate 'Z25KlvW0' \
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
    --body '{"ageRestriction": 60, "enable": true}' \
    > test.out 2>&1
eval_tap $? 117 'AdminUpdateAgeRestrictionConfigV3' test.out

#- 118 AdminGetListCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminGetListCountryAgeRestrictionV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 118 'AdminGetListCountryAgeRestrictionV3' test.out

#- 119 AdminUpdateCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateCountryAgeRestrictionV3 \
    --countryCode 'iKSyJtbc' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ageRestriction": 35}' \
    > test.out 2>&1
eval_tap $? 119 'AdminUpdateCountryAgeRestrictionV3' test.out

#- 120 AdminGetBannedUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType 'WurjKkwg' \
    --limit '88' \
    --offset '41' \
    > test.out 2>&1
eval_tap $? 120 'AdminGetBannedUsersV3' test.out

#- 121 AdminBanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"ban": "NsHqiK0t", "comment": "oZT6oZJL", "endDate": "OJzqCgbi", "reason": "YQw1M8zr", "skipNotif": false, "userIds": ["7SSY4B1O", "cXktgKcL", "u5owagFU"]}' \
    > test.out 2>&1
eval_tap $? 121 'AdminBanUserBulkV3' test.out

#- 122 AdminUnbanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminUnbanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"bans": [{"banId": "O6hEcESY", "userId": "D26mdBA3"}, {"banId": "Cdh5Lr08", "userId": "YllRhMV4"}, {"banId": "OpKDsrjv", "userId": "VFlTCfLr"}]}' \
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
    --clientId '9uYg4sJL' \
    --clientName '6jW4Jbbx' \
    --clientType 'xNqRLakm' \
    --limit '58' \
    --offset '91' \
    --skipLoginQueue  \
    > test.out 2>&1
eval_tap $? 124 'AdminGetClientsByNamespaceV3' test.out

#- 125 AdminBulkUpdateClientsV3
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateClientsV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientIds": ["IbDaG0tr", "h6QqzQGP", "OEtTz0tZ"], "clientUpdateRequest": {"audiences": ["81thtY8A", "UsMO1XWu", "oJx4SOeX"], "baseUri": "6CXQk2Tx", "clientName": "7JWVyxlA", "clientPermissions": [{"action": 14, "resource": "dK4Z0GEU", "schedAction": 18, "schedCron": "OkYIGu9B", "schedRange": ["O3WFsGAU", "cG9yK8lp", "2IngBH30"]}, {"action": 28, "resource": "n4Kx1otl", "schedAction": 43, "schedCron": "r3VNfNGD", "schedRange": ["xB3IUYtI", "THbqkrlX", "j4xpYpxJ"]}, {"action": 36, "resource": "PQnxRaED", "schedAction": 23, "schedCron": "lhCZaBTB", "schedRange": ["dxzaW60e", "ZilUqVsC", "WreGQVl6"]}], "clientPlatform": "xbduvjo4", "deletable": true, "description": "meGfJIrP", "modulePermissions": [{"moduleId": "DFHAneHS", "selectedGroups": [{"groupId": "RrEpAKPD", "selectedActions": [48, 7, 71]}, {"groupId": "134C5SYF", "selectedActions": [92, 83, 48]}, {"groupId": "OF6OWW7X", "selectedActions": [79, 91, 99]}]}, {"moduleId": "Ljfmftmv", "selectedGroups": [{"groupId": "1pjYE2w7", "selectedActions": [43, 57, 96]}, {"groupId": "PaDhBjuo", "selectedActions": [52, 89, 57]}, {"groupId": "QjTjMpYC", "selectedActions": [19, 21, 39]}]}, {"moduleId": "7RkJeWda", "selectedGroups": [{"groupId": "MtmEj0Nk", "selectedActions": [49, 6, 41]}, {"groupId": "QPrlGqQQ", "selectedActions": [11, 88, 87]}, {"groupId": "G9JnffUk", "selectedActions": [4, 69, 92]}]}], "namespace": "JQOyoZHb", "oauthAccessTokenExpiration": 24, "oauthAccessTokenExpirationTimeUnit": "yE41rIYz", "oauthRefreshTokenExpiration": 66, "oauthRefreshTokenExpirationTimeUnit": "EFlsm5CE", "redirectUri": "Ngw8WQSy", "scopes": ["SdQ2OZAu", "J1K33zyQ", "S2CqfRgZ"], "skipLoginQueue": false, "twoFactorEnabled": true}}' \
    > test.out 2>&1
eval_tap $? 125 'AdminBulkUpdateClientsV3' test.out

#- 126 AdminCreateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateClientV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["oocrD2r9", "HLpsvd52", "Bbk5mANg"], "baseUri": "1DxonMrR", "clientId": "Z7Nt5VsG", "clientName": "fRRMyQZG", "clientPermissions": [{"action": 37, "resource": "LoSaGk0U", "schedAction": 42, "schedCron": "jMEQNdK4", "schedRange": ["yzzFZCke", "GwW6I93p", "aC3M2FvD"]}, {"action": 28, "resource": "4hjVRha5", "schedAction": 2, "schedCron": "86qVxSc7", "schedRange": ["YsB25WpL", "l4XTgIwR", "Z3ykKvOJ"]}, {"action": 67, "resource": "qynCgBfm", "schedAction": 98, "schedCron": "zuIjekP9", "schedRange": ["J0xAYPpl", "SF17GBGj", "5aIF64wq"]}], "clientPlatform": "1eObuCbp", "deletable": false, "description": "YZf99Ol7", "modulePermissions": [{"moduleId": "A938vEPa", "selectedGroups": [{"groupId": "pQAs4zyT", "selectedActions": [67, 57, 62]}, {"groupId": "ubYTOM0H", "selectedActions": [70, 17, 19]}, {"groupId": "23pzbhP4", "selectedActions": [1, 94, 15]}]}, {"moduleId": "4aSh1yg4", "selectedGroups": [{"groupId": "YxMzyxi9", "selectedActions": [52, 62, 46]}, {"groupId": "0padLEXG", "selectedActions": [43, 34, 54]}, {"groupId": "4ErIUHIQ", "selectedActions": [4, 82, 70]}]}, {"moduleId": "PvPcuSGP", "selectedGroups": [{"groupId": "Rqla3uWg", "selectedActions": [75, 87, 76]}, {"groupId": "1JpsJbie", "selectedActions": [24, 71, 53]}, {"groupId": "6isAlBbf", "selectedActions": [4, 43, 53]}]}], "namespace": "K26R7A5J", "oauthAccessTokenExpiration": 16, "oauthAccessTokenExpirationTimeUnit": "0bDKHP4C", "oauthClientType": "Eg72pXxx", "oauthRefreshTokenExpiration": 66, "oauthRefreshTokenExpirationTimeUnit": "B49w84nc", "parentNamespace": "2gtF0THe", "redirectUri": "PRYuncg2", "scopes": ["Wvt7HRcH", "AGkvl8zb", "ep2Tkk8y"], "secret": "XSPfy1oa", "skipLoginQueue": true, "twoFactorEnabled": true}' \
    > test.out 2>&1
eval_tap $? 126 'AdminCreateClientV3' test.out

#- 127 AdminGetClientsbyNamespacebyIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetClientsbyNamespacebyIDV3 \
    --clientId 'HQslFGFj' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 127 'AdminGetClientsbyNamespacebyIDV3' test.out

#- 128 AdminDeleteClientV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientV3 \
    --clientId '8OfGDSRJ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 128 'AdminDeleteClientV3' test.out

#- 129 AdminUpdateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientV3 \
    --clientId 'DDSnBsxw' \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["W7vs9riK", "ZV0Hg5aO", "qSq8L0Qk"], "baseUri": "qCSG7o31", "clientName": "nVSbEVLi", "clientPermissions": [{"action": 59, "resource": "XI0m9OTN", "schedAction": 37, "schedCron": "cMcoKIck", "schedRange": ["eXfQ62Hv", "9TJf8dkB", "FEu6D1PE"]}, {"action": 33, "resource": "OZqkqQhH", "schedAction": 72, "schedCron": "PQ2pPY8c", "schedRange": ["p7y5S02F", "pkpgEDGl", "2XQoqn1h"]}, {"action": 87, "resource": "L8f2vEWA", "schedAction": 76, "schedCron": "vnGTQx6A", "schedRange": ["gyunBJlQ", "h3v6UkKk", "u84eOmHB"]}], "clientPlatform": "a1t8tu7v", "deletable": true, "description": "3vv1q5xj", "modulePermissions": [{"moduleId": "nlHfrbtO", "selectedGroups": [{"groupId": "RQOZbNhJ", "selectedActions": [14, 52, 10]}, {"groupId": "2xRnk4rG", "selectedActions": [51, 68, 0]}, {"groupId": "dcuxArXo", "selectedActions": [65, 76, 65]}]}, {"moduleId": "HRvohgI8", "selectedGroups": [{"groupId": "PaJkSR3X", "selectedActions": [67, 73, 17]}, {"groupId": "cTne1MiC", "selectedActions": [52, 64, 43]}, {"groupId": "rOS4dtlc", "selectedActions": [29, 4, 21]}]}, {"moduleId": "aUpdF70X", "selectedGroups": [{"groupId": "4FLs8uxA", "selectedActions": [92, 23, 99]}, {"groupId": "sghtwBtX", "selectedActions": [31, 50, 68]}, {"groupId": "vJA3m7PE", "selectedActions": [6, 32, 97]}]}], "namespace": "7Tko6mi7", "oauthAccessTokenExpiration": 62, "oauthAccessTokenExpirationTimeUnit": "1ot1o31Y", "oauthRefreshTokenExpiration": 23, "oauthRefreshTokenExpirationTimeUnit": "NcgO6BQZ", "redirectUri": "x7DoytmU", "scopes": ["Q5cbU24L", "qix1krBa", "HrfGiZuF"], "skipLoginQueue": true, "twoFactorEnabled": true}' \
    > test.out 2>&1
eval_tap $? 129 'AdminUpdateClientV3' test.out

#- 130 AdminUpdateClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientPermissionV3 \
    --clientId 'HcjkiHWC' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 78, "resource": "RBjfTM5K"}, {"action": 76, "resource": "27Xotv21"}, {"action": 26, "resource": "P0xqdpFN"}]}' \
    > test.out 2>&1
eval_tap $? 130 'AdminUpdateClientPermissionV3' test.out

#- 131 AdminAddClientPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddClientPermissionsV3 \
    --clientId '3iCW9qcj' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 22, "resource": "lYiTiKDU"}, {"action": 43, "resource": "2W48viEl"}, {"action": 92, "resource": "eJarethV"}]}' \
    > test.out 2>&1
eval_tap $? 131 'AdminAddClientPermissionsV3' test.out

#- 132 AdminDeleteClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientPermissionV3 \
    --action '67' \
    --clientId 'Knk56PoJ' \
    --namespace "$AB_NAMESPACE" \
    --resource 'pDDCg4TL' \
    > test.out 2>&1
eval_tap $? 132 'AdminDeleteClientPermissionV3' test.out

#- 133 AdminGetConfigValueV3
./ng net.accelbyte.sdk.cli.Main iam adminGetConfigValueV3 \
    --configKey 'ZLzbMsWU' \
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
    --body '{"blacklist": ["LF4a9Kpn", "vh8W1lpP", "g8ZqOc4e"]}' \
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
    --body '{"active": true, "roleIds": ["UuAG0SGr", "cl4gFQlx", "8eQWMRdw"]}' \
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
    --limit '2' \
    --offset '53' \
    > test.out 2>&1
eval_tap $? 141 'RetrieveAllSSOLoginPlatformCredentialV3' test.out

#- 142 RetrieveThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'IkXqMYBm' \
    > test.out 2>&1
eval_tap $? 142 'RetrieveThirdPartyLoginPlatformCredentialV3' test.out

#- 143 AddThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam addThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'lJRc6mAy' \
    --body '{"ACSURL": "LKhoWIjz", "AWSCognitoRegion": "saK4oisI", "AWSCognitoUserPool": "LrrhColV", "AllowedClients": ["mqYaPCtu", "CXgRZynq", "ekEUMHfp"], "AppId": "HB7Ir5vg", "AuthorizationEndpoint": "ZBjC8K1P", "ClientId": "oWzcQT4h", "EmptyStrFieldList": ["znooUwQt", "j4WTzaWi", "gnr6PxAM"], "EnableServerLicenseValidation": false, "Environment": "sVJml7pP", "FederationMetadataURL": "mbqypO89", "GenericOauthFlow": false, "IncludePUID": false, "IsActive": false, "Issuer": "Gp2fn9fl", "JWKSEndpoint": "UYy5MWUQ", "KeyID": "LSSr2qyO", "LogoURL": "umY87GuI", "NetflixCertificates": {"encryptedPrivateKey": "Q9JlTcaH", "encryptedPrivateKeyName": "l2yA7moP", "publicCertificate": "yicCKthy", "publicCertificateName": "RrHbDVrh", "rootCertificate": "VjhtnQT4", "rootCertificateName": "RAuwZ7Dx"}, "OrganizationId": "nb0dKxaN", "PlatformName": "qQtII8Ed", "RedirectUri": "8rLPY0kp", "RegisteredDomains": [{"affectedClientIDs": ["smB0KD9y", "AD2ToTul", "saCazPQu"], "domain": "SlFSvTMV", "namespaces": ["NB6xADZz", "ec27wbpS", "C6eoVtu1"], "roleId": "VHNaEc6L"}, {"affectedClientIDs": ["aF8TArVQ", "yLWH4zl8", "4I7AUcMW"], "domain": "MBcELxrm", "namespaces": ["ylMc1TRw", "ztwqvFpo", "REtgFVvM"], "roleId": "8i1e59J8"}, {"affectedClientIDs": ["EmkGStji", "CkgKPx7g", "UpAEfBz7"], "domain": "YvarxIA6", "namespaces": ["CgZ6Fccb", "aiyeOdZ5", "FbFlwKtE"], "roleId": "aJ7kX87d"}], "Secret": "YbIFKBoY", "TeamID": "3yJrHJFo", "TokenAuthenticationType": "YHvj8z9h", "TokenClaimsMapping": {"82NaZnn2": "VSuv4F5F", "W2zCrHz6": "zNkAQ2sv", "TI2EiGrl": "Sd16bVCO"}, "TokenEndpoint": "kgJ50uZv", "UserInfoEndpoint": "Mm5jfXCQ", "UserInfoHTTPMethod": "VhghrMQt", "scopes": ["84cvSTxt", "N1bUwqlf", "C1nDfonI"]}' \
    > test.out 2>&1
eval_tap $? 143 'AddThirdPartyLoginPlatformCredentialV3' test.out

#- 144 DeleteThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'zzU6N1vW' \
    > test.out 2>&1
eval_tap $? 144 'DeleteThirdPartyLoginPlatformCredentialV3' test.out

#- 145 UpdateThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'osCb8aUN' \
    --body '{"ACSURL": "okxzin12", "AWSCognitoRegion": "QoT7gCIg", "AWSCognitoUserPool": "isB8KASO", "AllowedClients": ["w647YxAq", "IWaFGBww", "sL6W0tC4"], "AppId": "sFIfi4Gu", "AuthorizationEndpoint": "2dBM5F6g", "ClientId": "q7yuOtIk", "EmptyStrFieldList": ["0it4pZV2", "p6ElTaY6", "6sydx25R"], "EnableServerLicenseValidation": false, "Environment": "0NqsehuC", "FederationMetadataURL": "AE8gSKvs", "GenericOauthFlow": false, "IncludePUID": false, "IsActive": false, "Issuer": "N5UbGUnf", "JWKSEndpoint": "HfomTkZj", "KeyID": "xi8jwp2L", "LogoURL": "FiDGxdRj", "NetflixCertificates": {"encryptedPrivateKey": "fst8nMO0", "encryptedPrivateKeyName": "6mVu0Mrt", "publicCertificate": "gdKBKlGR", "publicCertificateName": "s0jT3W7e", "rootCertificate": "472frJ5m", "rootCertificateName": "5aroE8Se"}, "OrganizationId": "HhGf1J8F", "PlatformName": "0pXHQOLQ", "RedirectUri": "JLWuh0Xc", "RegisteredDomains": [{"affectedClientIDs": ["HbtrlJrh", "SR4YpW7Q", "raModVIS"], "domain": "lRNj9Zwy", "namespaces": ["PF2TSgDK", "W4psSj9u", "NVBr0iZz"], "roleId": "VFWDkiHn"}, {"affectedClientIDs": ["YBpBIFnw", "WXHQaF5I", "RqqXubLv"], "domain": "IH05Mn4A", "namespaces": ["RWo1NFDT", "g2vjyzzq", "yPPJ0ngr"], "roleId": "XsJkAEIN"}, {"affectedClientIDs": ["am0RJuKV", "2clqgzwN", "JlYlUuJ2"], "domain": "8uAR4rW7", "namespaces": ["seEGrW5O", "d7V4fBti", "n0xAwpuu"], "roleId": "1MpGdFbk"}], "Secret": "2rNGb6OY", "TeamID": "yHOyHwiV", "TokenAuthenticationType": "GlN2bKf3", "TokenClaimsMapping": {"xwdi4PUw": "BJ5J9xJU", "ohp7EO3u": "hLHYVDuv", "nMlrYFdy": "rJNdzXu0"}, "TokenEndpoint": "V17CvRaW", "UserInfoEndpoint": "3MIqheiO", "UserInfoHTTPMethod": "pt2J0AJO", "scopes": ["bYNx9Xal", "O4FYudW1", "18oSi5ht"]}' \
    > test.out 2>&1
eval_tap $? 145 'UpdateThirdPartyLoginPlatformCredentialV3' test.out

#- 146 UpdateThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '8CyxDkNq' \
    --body '{"affectedClientIDs": ["7lkl8Qg1", "GcK6HRfb", "CZg0VEos"], "assignedNamespaces": ["x0rZXQRa", "yRu0KCXX", "Roul3kVV"], "domain": "t3KGyQ2L", "roleId": "wLl1tn3g"}' \
    > test.out 2>&1
eval_tap $? 146 'UpdateThirdPartyLoginPlatformDomainV3' test.out

#- 147 DeleteThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'GyuDEsD4' \
    --body '{"domain": "qVfjdo5s"}' \
    > test.out 2>&1
eval_tap $? 147 'DeleteThirdPartyLoginPlatformDomainV3' test.out

#- 148 RetrieveSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam retrieveSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'sUSdUtXV' \
    > test.out 2>&1
eval_tap $? 148 'RetrieveSSOLoginPlatformCredential' test.out

#- 149 AddSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam addSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'oYkOi9jP' \
    --body '{"acsUrl": "TuRE17Fk", "apiKey": "dYvSUhgw", "appId": "6h4NNHHz", "federationMetadataUrl": "opqoshGf", "isActive": true, "redirectUri": "BlhaQhps", "secret": "Z8eHsL0R", "ssoUrl": "RpDhAOhR"}' \
    > test.out 2>&1
eval_tap $? 149 'AddSSOLoginPlatformCredential' test.out

#- 150 DeleteSSOLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteSSOLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'sX0Sy1L7' \
    > test.out 2>&1
eval_tap $? 150 'DeleteSSOLoginPlatformCredentialV3' test.out

#- 151 UpdateSSOPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam updateSSOPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'awIEuEEn' \
    --body '{"acsUrl": "n9Ed2Ziq", "apiKey": "EjOD637O", "appId": "wgeDCmAI", "federationMetadataUrl": "xZQa76VD", "isActive": false, "redirectUri": "WUovgd3V", "secret": "L9vFOQH6", "ssoUrl": "xmwFf2YY"}' \
    > test.out 2>&1
eval_tap $? 151 'UpdateSSOPlatformCredential' test.out

#- 152 AdminListUserIDByPlatformUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByPlatformUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '21YHhpjU' \
    --rawPID  \
    --rawPUID  \
    --body '{"platformUserIds": ["2oz0vtGQ", "Stm7GNx2", "6aLww6GS"]}' \
    > test.out 2>&1
eval_tap $? 152 'AdminListUserIDByPlatformUserIDsV3' test.out

#- 153 AdminGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'OFFbIdti' \
    --platformUserId 'X5eRPOSJ' \
    > test.out 2>&1
eval_tap $? 153 'AdminGetUserByPlatformUserIDV3' test.out

#- 154 AdminGetProfileUpdateStrategyV3
./ng net.accelbyte.sdk.cli.Main iam adminGetProfileUpdateStrategyV3 \
    --namespace "$AB_NAMESPACE" \
    --field 'username' \
    > test.out 2>&1
eval_tap $? 154 'AdminGetProfileUpdateStrategyV3' test.out

#- 155 AdminUpdateProfileUpdateStrategyV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateProfileUpdateStrategyV3 \
    --namespace "$AB_NAMESPACE" \
    --field 'dob' \
    --body '{"config": {"minimumAllowedInterval": 53}, "type": "FPC3MvH3"}' \
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
    --identity 'USER' \
    --body '{"additions": [{"actions": [18, 96, 69], "resource": "hBD0dkdr"}, {"actions": [85, 83, 35], "resource": "iWZgLff3"}, {"actions": [13, 96, 86], "resource": "pMIQO4yI"}], "exclusions": [{"actions": [19, 44, 33], "resource": "jUXeONmq"}, {"actions": [3, 24, 78], "resource": "vwrR83yn"}, {"actions": [53, 29, 36], "resource": "0oeEr4to"}], "overrides": [{"actions": [70, 45, 37], "resource": "zZMPs6N9"}, {"actions": [92, 60, 56], "resource": "CJgcrJnA"}, {"actions": [84, 6, 35], "resource": "YI6MIkoj"}], "replacements": [{"replacement": {"actions": [14, 23, 36], "resource": "86jjkN0i"}, "target": "0RPgzWIv"}, {"replacement": {"actions": [84, 0, 33], "resource": "IsBKZvjc"}, "target": "Y4dgjOex"}, {"replacement": {"actions": [83, 8, 85], "resource": "LhoiwrPF"}, "target": "mTOYt1Ud"}]}' \
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
    --roleId 'Pt5O22Mk' \
    > test.out 2>&1
eval_tap $? 160 'AdminGetRoleNamespacePermissionV3' test.out

#- 161 GetAdminUsersByRoleIdV3
./ng net.accelbyte.sdk.cli.Main iam getAdminUsersByRoleIdV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'b2bjdoSl' \
    --after '14' \
    --before '28' \
    --limit '3' \
    > test.out 2>&1
eval_tap $? 161 'GetAdminUsersByRoleIdV3' test.out

#- 162 AdminGetUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --emailAddress 'OEI7YIo7' \
    > test.out 2>&1
eval_tap $? 162 'AdminGetUserByEmailAddressV3' test.out

#- 163 AdminBulkUpdateUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"updateRequest": {"skipLoginQueue": false}, "userIds": ["xg5RIauO", "V2YNRryY", "9miltQfd"]}' \
    > test.out 2>&1
eval_tap $? 163 'AdminBulkUpdateUsersV3' test.out

#- 164 AdminGetBulkUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType 'L4Wf99cn' \
    --body '{"bulkUserId": ["HaYeQlUZ", "wCzyKAaK", "R6xG7ULI"]}' \
    > test.out 2>&1
eval_tap $? 164 'AdminGetBulkUserBanV3' test.out

#- 165 AdminListUserIDByUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["6kddzGeu", "o85u4u7R", "dXKeRTp8"]}' \
    > test.out 2>&1
eval_tap $? 165 'AdminListUserIDByUserIDsV3' test.out

#- 166 AdminBulkGetUsersPlatform
./ng net.accelbyte.sdk.cli.Main iam adminBulkGetUsersPlatform \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["4jv01VwP", "42n5630x", "zuL9rzGY"]}' \
    > test.out 2>&1
eval_tap $? 166 'AdminBulkGetUsersPlatform' test.out

#- 167 AdminInviteUserV3
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddresses": ["twjMah4S", "Kwetr9u8", "8siIvB23"], "isAdmin": true, "languageTag": "IawqWy3h", "namespace": "I0l7sOXj", "roles": ["m5pgORP2", "gMOK6SM0", "3rHrgcLi"]}' \
    > test.out 2>&1
eval_tap $? 167 'AdminInviteUserV3' test.out

#- 168 AdminQueryThirdPlatformLinkHistoryV3
./ng net.accelbyte.sdk.cli.Main iam adminQueryThirdPlatformLinkHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '2' \
    --offset '92' \
    --platformUserId 'IsI9PBER' \
    --platformId 'INiTh78u' \
    > test.out 2>&1
eval_tap $? 168 'AdminQueryThirdPlatformLinkHistoryV3' test.out

#- 169 AdminListUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminListUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '21' \
    --offset '39' \
    > test.out 2>&1
eval_tap $? 169 'AdminListUsersV3' test.out

#- 170 AdminSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam adminSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'eLlNL1cM' \
    --endDate 'MTdJs5o4' \
    --includeTotal  \
    --limit '92' \
    --offset '45' \
    --platformBy 'pOaFOPWf' \
    --platformId 'h6DsxHRs' \
    --query 'ZCMt1CVw' \
    --roleIds 'LOk0Rxr9' \
    --skipLoginQueue  \
    --startDate '6LP0LhH1' \
    --testAccount  \
    > test.out 2>&1
eval_tap $? 170 'AdminSearchUserV3' test.out

#- 171 AdminGetBulkUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"listEmailAddressRequest": ["ykTUGMfQ", "NpgSEobV", "hJJEqXHd"]}' \
    > test.out 2>&1
eval_tap $? 171 'AdminGetBulkUserByEmailAddressV3' test.out

#- 172 AdminGetUserByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'k3YmiM21' \
    > test.out 2>&1
eval_tap $? 172 'AdminGetUserByUserIdV3' test.out

#- 173 AdminUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '7yy1hh1D' \
    --body '{"avatarUrl": "4xcMqNuT", "country": "jUJPCkRX", "dateOfBirth": "Nomy45W0", "displayName": "sWnyqjFN", "languageTag": "VftypEPq", "skipLoginQueue": true, "uniqueDisplayName": "tET0GgGn", "userName": "7n4Vd2g3"}' \
    > test.out 2>&1
eval_tap $? 173 'AdminUpdateUserV3' test.out

#- 174 AdminGetUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ahLEY18Y' \
    --activeOnly  \
    --after 'CetSdOXy' \
    --before 'mWqEaeCR' \
    --limit '42' \
    > test.out 2>&1
eval_tap $? 174 'AdminGetUserBanV3' test.out

#- 175 AdminBanUserV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ze2QiHJq' \
    --body '{"ban": "f0bhc4YZ", "comment": "QMAgUVhK", "endDate": "2OP9dWnd", "reason": "AQAubZCQ", "skipNotif": true}' \
    > test.out 2>&1
eval_tap $? 175 'AdminBanUserV3' test.out

#- 176 AdminGetUserBanSummaryV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanSummaryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'r4dUNqCf' \
    > test.out 2>&1
eval_tap $? 176 'AdminGetUserBanSummaryV3' test.out

#- 177 AdminUpdateUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserBanV3 \
    --banId 'kqUe53b1' \
    --namespace "$AB_NAMESPACE" \
    --userId 'lHlg8ajt' \
    --body '{"enabled": true, "skipNotif": false}' \
    > test.out 2>&1
eval_tap $? 177 'AdminUpdateUserBanV3' test.out

#- 178 AdminSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'hAAcsKJE' \
    --body '{"context": "52o6MqKh", "emailAddress": "2LWHm1nw", "languageTag": "mPBMGHUi", "upgradeToken": "n6jUFvLY"}' \
    > test.out 2>&1
eval_tap $? 178 'AdminSendVerificationCodeV3' test.out

#- 179 AdminVerifyAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'SXlUgUB7' \
    --body '{"Code": "vmT2YVYr", "ContactType": "c4AflX0Z", "LanguageTag": "mZrWn8aP", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 179 'AdminVerifyAccountV3' test.out

#- 180 GetUserVerificationCode
./ng net.accelbyte.sdk.cli.Main iam getUserVerificationCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'U8VetaTk' \
    > test.out 2>&1
eval_tap $? 180 'GetUserVerificationCode' test.out

#- 181 AdminGetUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'yNEQ7d2h' \
    > test.out 2>&1
eval_tap $? 181 'AdminGetUserDeletionStatusV3' test.out

#- 182 AdminUpdateUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'eLPilNDg' \
    --body '{"deletionDate": 97, "enabled": true}' \
    > test.out 2>&1
eval_tap $? 182 'AdminUpdateUserDeletionStatusV3' test.out

#- 183 AdminListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'PtLAqhTF' \
    > test.out 2>&1
eval_tap $? 183 'AdminListUserAllPlatformAccountsDistinctV3' test.out

#- 184 AdminUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'P5ddFoz6' \
    --body '{"code": "MS23GBQE", "country": "DZB8nHOv", "dateOfBirth": "0IvAjXb6", "displayName": "RjnmagWh", "emailAddress": "IieuXkgH", "password": "OIBhwUsc", "uniqueDisplayName": "bYlfpnd5", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 184 'AdminUpgradeHeadlessAccountV3' test.out

#- 185 AdminDeleteUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '1xfYG8vS' \
    > test.out 2>&1
eval_tap $? 185 'AdminDeleteUserInformationV3' test.out

#- 186 AdminGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'tLNFNiTx' \
    --after '0.3088567553234939' \
    --before '0.568606273897272' \
    --limit '93' \
    > test.out 2>&1
eval_tap $? 186 'AdminGetUserLoginHistoriesV3' test.out

#- 187 AdminResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam adminResetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'LbT3A2OV' \
    --body '{"languageTag": "SOZyHYxu", "mfaToken": "bh6ywCMy", "newPassword": "Z70FtLyr", "oldPassword": "GGXnwobV"}' \
    > test.out 2>&1
eval_tap $? 187 'AdminResetPasswordV3' test.out

#- 188 AdminUpdateUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserPermissionV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'xitTpH9q' \
    --body '{"Permissions": [{"Action": 12, "Resource": "JWfGM8Gq", "SchedAction": 98, "SchedCron": "FkZ4iNUm", "SchedRange": ["aYCH5b6Q", "fl7tToni", "WJqLoe0e"]}, {"Action": 57, "Resource": "PvxDG9d0", "SchedAction": 64, "SchedCron": "oUmEiFcb", "SchedRange": ["iRpPLrzV", "p449m3Yr", "jKfP9jxe"]}, {"Action": 90, "Resource": "DkQMFRs1", "SchedAction": 55, "SchedCron": "vgQznEP2", "SchedRange": ["XY7ZuVPF", "1tFfyGxT", "xGxHEoAx"]}]}' \
    > test.out 2>&1
eval_tap $? 188 'AdminUpdateUserPermissionV3' test.out

#- 189 AdminAddUserPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserPermissionsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'f9fs4CjY' \
    --body '{"Permissions": [{"Action": 43, "Resource": "RpgHgfAO", "SchedAction": 50, "SchedCron": "KzVxHMag", "SchedRange": ["NaigCLDc", "0mmzfG2T", "u2pDW0UE"]}, {"Action": 20, "Resource": "ezi11YVx", "SchedAction": 4, "SchedCron": "iRgjrzbv", "SchedRange": ["kKscWUMf", "eCjP1k2e", "DZkNmooW"]}, {"Action": 100, "Resource": "BL1uMyHZ", "SchedAction": 27, "SchedCron": "JTfSGhkr", "SchedRange": ["nDMskq5o", "0qCz7qRW", "hQbrK0HG"]}]}' \
    > test.out 2>&1
eval_tap $? 189 'AdminAddUserPermissionsV3' test.out

#- 190 AdminDeleteUserPermissionBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'jyBN0u5b' \
    --body '[{"Action": 0, "Resource": "M24VQ3e5"}, {"Action": 5, "Resource": "uMMJrPju"}, {"Action": 1, "Resource": "RMVVgwwB"}]' \
    > test.out 2>&1
eval_tap $? 190 'AdminDeleteUserPermissionBulkV3' test.out

#- 191 AdminDeleteUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionV3 \
    --action '79' \
    --namespace "$AB_NAMESPACE" \
    --resource 'QQUjkgLx' \
    --userId 'yyVua8yV' \
    > test.out 2>&1
eval_tap $? 191 'AdminDeleteUserPermissionV3' test.out

#- 192 AdminGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'U8zwqym2' \
    --after 'xlNFejPY' \
    --before 'X2CN37rE' \
    --limit '3' \
    --platformId 'bie638GA' \
    --targetNamespace 'TCk1AKgA' \
    > test.out 2>&1
eval_tap $? 192 'AdminGetUserPlatformAccountsV3' test.out

#- 193 AdminListAllDistinctPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminListAllDistinctPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'UibfsbGh' \
    --status 'NAD1sCIb' \
    > test.out 2>&1
eval_tap $? 193 'AdminListAllDistinctPlatformAccountsV3' test.out

#- 194 AdminGetListJusticePlatformAccounts
./ng net.accelbyte.sdk.cli.Main iam adminGetListJusticePlatformAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'uKAVXSnt' \
    > test.out 2>&1
eval_tap $? 194 'AdminGetListJusticePlatformAccounts' test.out

#- 195 AdminGetUserMapping
./ng net.accelbyte.sdk.cli.Main iam adminGetUserMapping \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'gsMBufw3' \
    --userId 'gsE3WnEl' \
    > test.out 2>&1
eval_tap $? 195 'AdminGetUserMapping' test.out

#- 196 AdminCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam adminCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'SuKJSz7N' \
    --userId 'UajaoUcF' \
    > test.out 2>&1
eval_tap $? 196 'AdminCreateJusticeUser' test.out

#- 197 AdminLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'WneokOqG' \
    --skipConflict  \
    --body '{"platformId": "801dJWmc", "platformUserId": "WF2Awwkq"}' \
    > test.out 2>&1
eval_tap $? 197 'AdminLinkPlatformAccount' test.out

#- 198 AdminGetUserLinkHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLinkHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'iPpEc5NJ' \
    --platformId 'SQihUw9k' \
    > test.out 2>&1
eval_tap $? 198 'AdminGetUserLinkHistoriesV3' test.out

#- 199 AdminPlatformUnlinkV3
eval_tap 0 199 'AdminPlatformUnlinkV3 # SKIP deprecated' test.out

#- 200 AdminPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'jklFFczb' \
    --userId '3hwFcbs9' \
    > test.out 2>&1
eval_tap $? 200 'AdminPlatformUnlinkAllV3' test.out

#- 201 AdminPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'PxZca61y' \
    --userId 'FbGliJ3e' \
    --ticket 'EdRO0uzf' \
    > test.out 2>&1
eval_tap $? 201 'AdminPlatformLinkV3' test.out

#- 202 AdminDeleteUserLinkingHistoryByPlatformIDV3
eval_tap 0 202 'AdminDeleteUserLinkingHistoryByPlatformIDV3 # SKIP deprecated' test.out

#- 203 AdminDeleteUserLinkingRestrictionByPlatformIDV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserLinkingRestrictionByPlatformIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '43FbyEZQ' \
    --userId 'g8173fjL' \
    > test.out 2>&1
eval_tap $? 203 'AdminDeleteUserLinkingRestrictionByPlatformIDV3' test.out

#- 204 AdminGetThirdPartyPlatformTokenLinkStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetThirdPartyPlatformTokenLinkStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'bifRNNLo' \
    --userId 'KoDSP6Ig' \
    --platformToken 'egL6oZMS' \
    > test.out 2>&1
eval_tap $? 204 'AdminGetThirdPartyPlatformTokenLinkStatusV3' test.out

#- 205 AdminGetUserSinglePlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminGetUserSinglePlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --platformId 'xP9HjYcC' \
    --userId 'vvHG14ry' \
    --crossNamespace  \
    > test.out 2>&1
eval_tap $? 205 'AdminGetUserSinglePlatformAccount' test.out

#- 206 AdminDeleteUserRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRolesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '9xA5H4Q6' \
    --body '["mprBsmHe", "t89D2qQT", "bZukCtyl"]' \
    > test.out 2>&1
eval_tap $? 206 'AdminDeleteUserRolesV3' test.out

#- 207 AdminSaveUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminSaveUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'DDRCbHnm' \
    --body '[{"namespace": "HMxzZWY5", "roleId": "5UCfrJiT"}, {"namespace": "DF83vcxe", "roleId": "7YeNQerU"}, {"namespace": "3eNmTlCV", "roleId": "RFWGg8Ix"}]' \
    > test.out 2>&1
eval_tap $? 207 'AdminSaveUserRoleV3' test.out

#- 208 AdminAddUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'iWviyN7k' \
    --userId 'nD01xq4A' \
    > test.out 2>&1
eval_tap $? 208 'AdminAddUserRoleV3' test.out

#- 209 AdminDeleteUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'HSWgFtCz' \
    --userId '2XYhYRSb' \
    > test.out 2>&1
eval_tap $? 209 'AdminDeleteUserRoleV3' test.out

#- 210 AdminUpdateUserStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'pvzB2yYJ' \
    --body '{"enabled": false, "reason": "CZw3vWSV"}' \
    > test.out 2>&1
eval_tap $? 210 'AdminUpdateUserStatusV3' test.out

#- 211 AdminTrustlyUpdateUserIdentity
./ng net.accelbyte.sdk.cli.Main iam adminTrustlyUpdateUserIdentity \
    --namespace "$AB_NAMESPACE" \
    --userId 'Y9V8PHpP' \
    --body '{"emailAddress": "OkieqM9m", "password": "URDaN4Om"}' \
    > test.out 2>&1
eval_tap $? 211 'AdminTrustlyUpdateUserIdentity' test.out

#- 212 AdminVerifyUserWithoutVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyUserWithoutVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ySbj7FQy' \
    > test.out 2>&1
eval_tap $? 212 'AdminVerifyUserWithoutVerificationCodeV3' test.out

#- 213 AdminUpdateClientSecretV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientSecretV3 \
    --clientId 'utE707yK' \
    --namespace "$AB_NAMESPACE" \
    --body '{"newSecret": "ZOsfxRf0"}' \
    > test.out 2>&1
eval_tap $? 213 'AdminUpdateClientSecretV3' test.out

#- 214 AdminCheckThirdPartyLoginPlatformAvailabilityV3
./ng net.accelbyte.sdk.cli.Main iam adminCheckThirdPartyLoginPlatformAvailabilityV3 \
    --platformId 'NuxtXf6M' \
    > test.out 2>&1
eval_tap $? 214 'AdminCheckThirdPartyLoginPlatformAvailabilityV3' test.out

#- 215 AdminGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV3 \
    --after 'rzJzy0AU' \
    --before 'Q7yS5b0r' \
    --isWildcard  \
    --limit '7' \
    > test.out 2>&1
eval_tap $? 215 'AdminGetRolesV3' test.out

#- 216 AdminCreateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV3 \
    --body '{"adminRole": true, "deletable": false, "isWildcard": false, "managers": [{"displayName": "fSV3Tecp", "namespace": "yePcnihW", "userId": "IzeIasup"}, {"displayName": "b6MWIYGf", "namespace": "NXGiqtkj", "userId": "9hwWbbzf"}, {"displayName": "pspoESTc", "namespace": "8JBqEBAM", "userId": "0Z9MkaAe"}], "members": [{"displayName": "LsnldDhy", "namespace": "sOxq3Uw5", "userId": "S40y3WDO"}, {"displayName": "PW2iW7zg", "namespace": "Sb0hINvG", "userId": "WysWx1GC"}, {"displayName": "RWmWlhrV", "namespace": "efZ3hZpW", "userId": "lHUjzJIV"}], "permissions": [{"action": 5, "resource": "ljQCs9vN", "schedAction": 44, "schedCron": "pFrVI2UK", "schedRange": ["pL9yLEdP", "9YWZpwzH", "dAGmPEXg"]}, {"action": 8, "resource": "fLVByr7C", "schedAction": 94, "schedCron": "KwxVCact", "schedRange": ["5R4Sjou6", "mCSbcQzC", "JRlrGG5F"]}, {"action": 56, "resource": "vJwIobfU", "schedAction": 80, "schedCron": "RQHFdWYZ", "schedRange": ["V5IGv2W7", "cUVcnM5D", "La0S9Vss"]}], "roleName": "yMNyLsl0"}' \
    > test.out 2>&1
eval_tap $? 216 'AdminCreateRoleV3' test.out

#- 217 AdminGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV3 \
    --roleId 'bGf65lk7' \
    > test.out 2>&1
eval_tap $? 217 'AdminGetRoleV3' test.out

#- 218 AdminDeleteRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV3 \
    --roleId 'bbXsQSRf' \
    > test.out 2>&1
eval_tap $? 218 'AdminDeleteRoleV3' test.out

#- 219 AdminUpdateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV3 \
    --roleId 'eKuHImWA' \
    --body '{"deletable": true, "isWildcard": true, "roleName": "sQwVZldj"}' \
    > test.out 2>&1
eval_tap $? 219 'AdminUpdateRoleV3' test.out

#- 220 AdminGetRoleAdminStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleAdminStatusV3 \
    --roleId 'MbD8yBPo' \
    > test.out 2>&1
eval_tap $? 220 'AdminGetRoleAdminStatusV3' test.out

#- 221 AdminUpdateAdminRoleStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateAdminRoleStatusV3 \
    --roleId 'dHqXPEn3' \
    > test.out 2>&1
eval_tap $? 221 'AdminUpdateAdminRoleStatusV3' test.out

#- 222 AdminRemoveRoleAdminV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleAdminV3 \
    --roleId 'RJJf1mZe' \
    > test.out 2>&1
eval_tap $? 222 'AdminRemoveRoleAdminV3' test.out

#- 223 AdminGetRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleManagersV3 \
    --roleId 'JSNtujdy' \
    --after 'OiWeVdc5' \
    --before '6Jv7xfT1' \
    --limit '20' \
    > test.out 2>&1
eval_tap $? 223 'AdminGetRoleManagersV3' test.out

#- 224 AdminAddRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleManagersV3 \
    --roleId 'AcKnkq03' \
    --body '{"managers": [{"displayName": "K4eqpvat", "namespace": "ExhLOHX2", "userId": "ZS2MOvaK"}, {"displayName": "qlJQHj9z", "namespace": "TilUaRlC", "userId": "gfWbEwEG"}, {"displayName": "T1ZKaAHm", "namespace": "ExzR3rQa", "userId": "gVKovU4v"}]}' \
    > test.out 2>&1
eval_tap $? 224 'AdminAddRoleManagersV3' test.out

#- 225 AdminRemoveRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleManagersV3 \
    --roleId 'sNVLizCU' \
    --body '{"managers": [{"displayName": "NzdwITyD", "namespace": "pETeZgf2", "userId": "uy4HFULP"}, {"displayName": "UQ8UJ1QV", "namespace": "z2Z2yHnj", "userId": "T5p3woYy"}, {"displayName": "I2KHMVfP", "namespace": "sEYgIBEt", "userId": "FdhawgJE"}]}' \
    > test.out 2>&1
eval_tap $? 225 'AdminRemoveRoleManagersV3' test.out

#- 226 AdminGetRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleMembersV3 \
    --roleId 'YSUZkrim' \
    --after '0Wkd1aPg' \
    --before 'HE3TehQq' \
    --limit '75' \
    > test.out 2>&1
eval_tap $? 226 'AdminGetRoleMembersV3' test.out

#- 227 AdminAddRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleMembersV3 \
    --roleId 'HUIR8rKG' \
    --body '{"members": [{"displayName": "qK0HKsP5", "namespace": "eYG2nwAi", "userId": "ulTo0lyX"}, {"displayName": "R081KsVU", "namespace": "YSOY79R4", "userId": "LltPSFlZ"}, {"displayName": "Oa1Kgdt7", "namespace": "uywDEAWF", "userId": "8ZuuNo3O"}]}' \
    > test.out 2>&1
eval_tap $? 227 'AdminAddRoleMembersV3' test.out

#- 228 AdminRemoveRoleMembersV3
eval_tap 0 228 'AdminRemoveRoleMembersV3 # SKIP deprecated' test.out

#- 229 AdminUpdateRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV3 \
    --roleId 'BK33lOw4' \
    --body '{"permissions": [{"action": 18, "resource": "xgr18e4g", "schedAction": 47, "schedCron": "3KlaTYn1", "schedRange": ["PIcW9O7f", "CFYeb6EH", "jAsm3OEO"]}, {"action": 46, "resource": "bSL5cjz2", "schedAction": 67, "schedCron": "7VAIJwNc", "schedRange": ["B7WXCDoj", "ot2lcv3l", "Pj87ADwl"]}, {"action": 37, "resource": "QHsrFM8H", "schedAction": 59, "schedCron": "Q1udGp34", "schedRange": ["JVhNM6Ar", "loyI9ui2", "zZFS0tD2"]}]}' \
    > test.out 2>&1
eval_tap $? 229 'AdminUpdateRolePermissionsV3' test.out

#- 230 AdminAddRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV3 \
    --roleId '6dMSbwj1' \
    --body '{"permissions": [{"action": 38, "resource": "TKIdA00k", "schedAction": 3, "schedCron": "mAYQ0MA6", "schedRange": ["HnLMrBke", "qPtAkaUm", "SAiNvT3I"]}, {"action": 86, "resource": "czITTqJB", "schedAction": 52, "schedCron": "BbkWjOtO", "schedRange": ["pkwFOJ3f", "xM0DCioS", "taqVLIDC"]}, {"action": 81, "resource": "EafCkTDq", "schedAction": 10, "schedCron": "nXw5RQmz", "schedRange": ["ILQpsnvJ", "UAFpey5U", "GxCmAgsV"]}]}' \
    > test.out 2>&1
eval_tap $? 230 'AdminAddRolePermissionsV3' test.out

#- 231 AdminDeleteRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV3 \
    --roleId 'kLwCDgY2' \
    --body '["TmgZwYNh", "TUaWJCG9", "w4wulSuF"]' \
    > test.out 2>&1
eval_tap $? 231 'AdminDeleteRolePermissionsV3' test.out

#- 232 AdminDeleteRolePermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionV3 \
    --action '77' \
    --resource 'GZ3Qpwrm' \
    --roleId 'CEuUPcif' \
    > test.out 2>&1
eval_tap $? 232 'AdminDeleteRolePermissionV3' test.out

#- 233 AdminGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam adminGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 233 'AdminGetMyUserV3' test.out

#- 234 UserAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam userAuthenticationV3 \
    --clientId 'povAW5RS' \
    --extendExp  \
    --redirectUri 'NaowPYov' \
    --password '2a19lbRz' \
    --requestId 'SKWElcjp' \
    --userName 'yerJry3F' \
    > test.out 2>&1
eval_tap $? 234 'UserAuthenticationV3' test.out

#- 235 AuthenticationWithPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV3 \
    --extendExp  \
    --clientId 'UNvCV7Sm' \
    --linkingToken 'ofCaH5tE' \
    --password 'pcbVylVO' \
    --username 'y47ofKRZ' \
    > test.out 2>&1
eval_tap $? 235 'AuthenticationWithPlatformLinkV3' test.out

#- 236 AuthenticateAndLinkForwardV3
./ng net.accelbyte.sdk.cli.Main iam authenticateAndLinkForwardV3 \
    --extendExp  \
    --clientId 'Wz9mwini' \
    --linkingToken 'yMo5cbGn' \
    --password 'dH4DuGhJ' \
    --username 'H9l6WQ4N' \
    > test.out 2>&1
eval_tap $? 236 'AuthenticateAndLinkForwardV3' test.out

#- 237 GenerateTokenByNewHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV3 \
    --additionalData 'KNs8aNHi' \
    --extendExp  \
    --linkingToken 'ly28CHbS' \
    > test.out 2>&1
eval_tap $? 237 'GenerateTokenByNewHeadlessAccountV3' test.out

#- 238 RequestOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam requestOneTimeLinkingCodeV3 \
    --redirectUri 'pKCZBgj8' \
    --state 'oS8tU5UR' \
    --platformId 'UstOe0VL' \
    > test.out 2>&1
eval_tap $? 238 'RequestOneTimeLinkingCodeV3' test.out

#- 239 ValidateOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam validateOneTimeLinkingCodeV3 \
    --oneTimeLinkCode '2krftpPi' \
    > test.out 2>&1
eval_tap $? 239 'ValidateOneTimeLinkingCodeV3' test.out

#- 240 RequestTokenByOneTimeLinkCodeResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTokenByOneTimeLinkCodeResponseV3 \
    --additionalData '5m9OU3cJ' \
    --isTransient  \
    --clientId 'lEQBOx4d' \
    --oneTimeLinkCode 'ngm50s3a' \
    > test.out 2>&1
eval_tap $? 240 'RequestTokenByOneTimeLinkCodeResponseV3' test.out

#- 241 GetCountryLocationV3
./ng net.accelbyte.sdk.cli.Main iam getCountryLocationV3 \
    > test.out 2>&1
eval_tap $? 241 'GetCountryLocationV3' test.out

#- 242 Logout
./ng net.accelbyte.sdk.cli.Main iam logout \
    > test.out 2>&1
eval_tap $? 242 'Logout' test.out

#- 243 RequestTokenExchangeCodeV3
./ng net.accelbyte.sdk.cli.Main iam requestTokenExchangeCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --codeChallenge 'whInzUYw' \
    --codeChallengeMethod 'plain' \
    --clientId 'hT9ke4nQ' \
    > test.out 2>&1
eval_tap $? 243 'RequestTokenExchangeCodeV3' test.out

#- 244 AdminRetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam adminRetrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'i1oVrk6f' \
    --userId 'HELpxZly' \
    --platformUserId 'V68gM9RD' \
    > test.out 2>&1
eval_tap $? 244 'AdminRetrieveUserThirdPartyPlatformTokenV3' test.out

#- 245 RevokeUserV3
./ng net.accelbyte.sdk.cli.Main iam revokeUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'cVTNyct9' \
    --includeGameNamespace  \
    > test.out 2>&1
eval_tap $? 245 'RevokeUserV3' test.out

#- 246 AuthorizeV3
./ng net.accelbyte.sdk.cli.Main iam authorizeV3 \
    --blockedPlatformId '4lWr2HZx' \
    --codeChallenge 'I76UCAkP' \
    --codeChallengeMethod 'S256' \
    --createHeadless  \
    --loginWebBased  \
    --nonce 'hbOQUvgL' \
    --oneTimeLinkCode 'cUUu387s' \
    --redirectUri '6uJTfeU1' \
    --scope 'uROUNNNk' \
    --state '90d4JR3b' \
    --targetAuthPage 'pXW43PvD' \
    --useRedirectUriAsLoginUrlWhenLocked  \
    --clientId 's1PsrU9F' \
    --responseType 'code' \
    > test.out 2>&1
eval_tap $? 246 'AuthorizeV3' test.out

#- 247 TokenIntrospectionV3
./ng net.accelbyte.sdk.cli.Main iam tokenIntrospectionV3 \
    --token 'xzlzUx3L' \
    > test.out 2>&1
eval_tap $? 247 'TokenIntrospectionV3' test.out

#- 248 GetJWKSV3
./ng net.accelbyte.sdk.cli.Main iam getJWKSV3 \
    > test.out 2>&1
eval_tap $? 248 'GetJWKSV3' test.out

#- 249 SendMFAAuthenticationCode
./ng net.accelbyte.sdk.cli.Main iam sendMFAAuthenticationCode \
    --clientId '1jMhIS4I' \
    --factor '5pPoBGYH' \
    --mfaToken 'hpMoTVCZ' \
    > test.out 2>&1
eval_tap $? 249 'SendMFAAuthenticationCode' test.out

#- 250 Change2faMethod
./ng net.accelbyte.sdk.cli.Main iam change2faMethod \
    --factor 'dSFhC58o' \
    --mfaToken 'dh6sqwr9' \
    > test.out 2>&1
eval_tap $? 250 'Change2faMethod' test.out

#- 251 Verify2faCode
./ng net.accelbyte.sdk.cli.Main iam verify2faCode \
    --code 'Guyx9idb' \
    --factor 'lpJ0714w' \
    --mfaToken 'KqY1KNBq' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 251 'Verify2faCode' test.out

#- 252 Verify2faCodeForward
./ng net.accelbyte.sdk.cli.Main iam verify2faCodeForward \
    --defaultFactor 'hG3wQALc' \
    --factors 'ockiHGn7' \
    --rememberDevice  \
    --clientId 'IfTTxhjI' \
    --code 'WMgIhDHv' \
    --factor 'SBxEm7DS' \
    --mfaToken 'gFGi2LqA' \
    > test.out 2>&1
eval_tap $? 252 'Verify2faCodeForward' test.out

#- 253 RetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam retrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'nyllfeDj' \
    --userId '9z3geuqv' \
    > test.out 2>&1
eval_tap $? 253 'RetrieveUserThirdPartyPlatformTokenV3' test.out

#- 254 AuthCodeRequestV3
./ng net.accelbyte.sdk.cli.Main iam authCodeRequestV3 \
    --platformId 'OKUoQ2CN' \
    --clientId 'FtJQ3P9H' \
    --redirectUri 'bszMsSlA' \
    --requestId 'bv1I1age' \
    > test.out 2>&1
eval_tap $? 254 'AuthCodeRequestV3' test.out

#- 255 PlatformTokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV3 \
    --platformId 'lDVYGXjc' \
    --additionalData 'reDC3H3m' \
    --clientId 'dkgk9lGV' \
    --createHeadless  \
    --deviceId 'If19lIZh' \
    --macAddress 'Tkrvzd7i' \
    --platformToken 'ClV0F4XU' \
    --serviceLabel '0.3287156033484574' \
    --skipSetCookie  \
    > test.out 2>&1
eval_tap $? 255 'PlatformTokenGrantV3' test.out

#- 256 GetRevocationListV3
./ng net.accelbyte.sdk.cli.Main iam getRevocationListV3 \
    > test.out 2>&1
eval_tap $? 256 'GetRevocationListV3' test.out

#- 257 TokenRevocationV3
./ng net.accelbyte.sdk.cli.Main iam tokenRevocationV3 \
    --token 'JF2pQsxv' \
    > test.out 2>&1
eval_tap $? 257 'TokenRevocationV3' test.out

#- 258 SimultaneousLoginV3
./ng net.accelbyte.sdk.cli.Main iam simultaneousLoginV3 \
    --simultaneousPlatform 'AC58wZFz' \
    --simultaneousTicket '90dZtbQg' \
    --nativePlatform 'steam' \
    --nativePlatformTicket 'K9vZiEtU' \
    > test.out 2>&1
eval_tap $? 258 'SimultaneousLoginV3' test.out

#- 259 TokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV3 \
    --additionalData 'ijcNIiNl' \
    --clientId 'fDVbb0TD' \
    --clientSecret 'thoqwY9t' \
    --code 'U2ZejqU4' \
    --codeVerifier '9Co4U3pe' \
    --extendNamespace 'WTiJL3Qo' \
    --extendExp  \
    --password 'yF4lBm3w' \
    --redirectUri '1h1rqvMK' \
    --refreshToken 'RcaRXaP8' \
    --username 'nTwzYhpy' \
    --grantType 'password' \
    > test.out 2>&1
eval_tap $? 259 'TokenGrantV3' test.out

#- 260 VerifyTokenV3
./ng net.accelbyte.sdk.cli.Main iam verifyTokenV3 \
    --token 'sJe3bA23' \
    > test.out 2>&1
eval_tap $? 260 'VerifyTokenV3' test.out

#- 261 PlatformAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticationV3 \
    --platformId 'DK2wTFee' \
    --code 'vjOIKU1f' \
    --error 'feeSD7yu' \
    --openidAssocHandle '64lhZem4' \
    --openidClaimedId '6y0WCgoq' \
    --openidIdentity '8GRrovb1' \
    --openidMode '3x0vdplt' \
    --openidNs 'sZH5SXgW' \
    --openidOpEndpoint '2zuZK4Yb' \
    --openidResponseNonce 'qKqkULXS' \
    --openidReturnTo 'PMVGT2tt' \
    --openidSig '9CGE7VW0' \
    --openidSigned 'Y1Q87C3y' \
    --state 'CstZsWBC' \
    > test.out 2>&1
eval_tap $? 261 'PlatformAuthenticationV3' test.out

#- 262 PlatformTokenRefreshV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenRefreshV3 \
    --platformId 'LLvkqb2U' \
    --platformToken 'PQsHmuiv' \
    > test.out 2>&1
eval_tap $? 262 'PlatformTokenRefreshV3' test.out

#- 263 PublicGetInputValidations
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidations \
    --defaultOnEmpty  \
    --languageCode 'cTYI5RbR' \
    > test.out 2>&1
eval_tap $? 263 'PublicGetInputValidations' test.out

#- 264 PublicGetInputValidationByField
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidationByField \
    --field 'gspJTFpx' \
    > test.out 2>&1
eval_tap $? 264 'PublicGetInputValidationByField' test.out

#- 265 PublicGetCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam publicGetCountryAgeRestrictionV3 \
    --countryCode 'OQADccD4' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 265 'PublicGetCountryAgeRestrictionV3' test.out

#- 266 PublicGetConfigValueV3
./ng net.accelbyte.sdk.cli.Main iam publicGetConfigValueV3 \
    --configKey 'pJlmJbwa' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 266 'PublicGetConfigValueV3' test.out

#- 267 PublicGetCountryListV3
./ng net.accelbyte.sdk.cli.Main iam publicGetCountryListV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 267 'PublicGetCountryListV3' test.out

#- 268 RetrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3
./ng net.accelbyte.sdk.cli.Main iam retrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 268 'RetrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3' test.out

#- 269 RetrieveActiveOIDCClientsPublicV3
./ng net.accelbyte.sdk.cli.Main iam retrieveActiveOIDCClientsPublicV3 \
    --namespace "$AB_NAMESPACE" \
    --clientId 'TKUKwnQE' \
    > test.out 2>&1
eval_tap $? 269 'RetrieveActiveOIDCClientsPublicV3' test.out

#- 270 PublicListUserIDByPlatformUserIDsV3
eval_tap 0 270 'PublicListUserIDByPlatformUserIDsV3 # SKIP deprecated' test.out

#- 271 PublicGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'XuxE7PBx' \
    --platformUserId 'y0UmeMYI' \
    > test.out 2>&1
eval_tap $? 271 'PublicGetUserByPlatformUserIDV3' test.out

#- 272 PublicGetProfileUpdateStrategyV3
./ng net.accelbyte.sdk.cli.Main iam publicGetProfileUpdateStrategyV3 \
    --namespace "$AB_NAMESPACE" \
    --field 'display_name' \
    > test.out 2>&1
eval_tap $? 272 'PublicGetProfileUpdateStrategyV3' test.out

#- 273 PublicGetAsyncStatus
./ng net.accelbyte.sdk.cli.Main iam publicGetAsyncStatus \
    --namespace "$AB_NAMESPACE" \
    --requestId '2qmqbTn1' \
    > test.out 2>&1
eval_tap $? 273 'PublicGetAsyncStatus' test.out

#- 274 PublicSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam publicSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'PbVHWHaT' \
    --limit '96' \
    --offset '41' \
    --platformBy 'HAEMiVTk' \
    --platformId 'Kju88jqg' \
    --query 'kWHprkmw' \
    > test.out 2>&1
eval_tap $? 274 'PublicSearchUserV3' test.out

#- 275 PublicCreateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "8pepOqC5", "acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "XFkldb7e", "policyId": "CRJbrV2A", "policyVersionId": "G15UJ2BC"}, {"isAccepted": false, "localizedPolicyVersionId": "qt3uXkeq", "policyId": "yBpysu1h", "policyVersionId": "SLuHT78Y"}, {"isAccepted": false, "localizedPolicyVersionId": "iBpNzWgN", "policyId": "J9RmW5Gc", "policyVersionId": "xEknnlnI"}], "authType": "PxngojZU", "code": "TgEPQ9gL", "country": "utXEfyCX", "dateOfBirth": "YpLTvhpd", "displayName": "KTTfcJCD", "emailAddress": "aKT69rP2", "password": "RUIleeR7", "reachMinimumAge": true, "uniqueDisplayName": "t3FeleNk"}' \
    > test.out 2>&1
eval_tap $? 275 'PublicCreateUserV3' test.out

#- 276 CheckUserAvailability
./ng net.accelbyte.sdk.cli.Main iam checkUserAvailability \
    --namespace "$AB_NAMESPACE" \
    --field 'guysXnIq' \
    --query 'eZ5GUz7c' \
    > test.out 2>&1
eval_tap $? 276 'CheckUserAvailability' test.out

#- 277 PublicBulkGetUsers
./ng net.accelbyte.sdk.cli.Main iam publicBulkGetUsers \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["PtomN6W6", "ODG3M5A3", "3v8uykdd"]}' \
    > test.out 2>&1
eval_tap $? 277 'PublicBulkGetUsers' test.out

#- 278 PublicSendRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicSendRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "ZBXOqWKq", "languageTag": "XIuVTYa9"}' \
    > test.out 2>&1
eval_tap $? 278 'PublicSendRegistrationCode' test.out

#- 279 PublicVerifyRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicVerifyRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "a1i9jSu2", "emailAddress": "pViE9CaC"}' \
    > test.out 2>&1
eval_tap $? 279 'PublicVerifyRegistrationCode' test.out

#- 280 PublicForgotPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicForgotPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "lrzekryw", "languageTag": "8h0OWgYN"}' \
    > test.out 2>&1
eval_tap $? 280 'PublicForgotPasswordV3' test.out

#- 281 PublicValidateUserInput
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserInput \
    --namespace "$AB_NAMESPACE" \
    --body '{"displayName": "5MP5Oo6V", "password": "NT5KhQsl", "uniqueDisplayName": "ledUeWuf", "username": "rtbEhsdh"}' \
    > test.out 2>&1
eval_tap $? 281 'PublicValidateUserInput' test.out

#- 282 GetAdminInvitationV3
./ng net.accelbyte.sdk.cli.Main iam getAdminInvitationV3 \
    --invitationId 'z5QGlPVW' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 282 'GetAdminInvitationV3' test.out

#- 283 CreateUserFromInvitationV3
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV3 \
    --invitationId 'ImTVmdC6' \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "VNYCobob", "acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "5YKPPk88", "policyId": "TQd0EryZ", "policyVersionId": "CoJCJmJd"}, {"isAccepted": false, "localizedPolicyVersionId": "0xWS5RKa", "policyId": "9YfoHZYw", "policyVersionId": "dVVPybam"}, {"isAccepted": true, "localizedPolicyVersionId": "hgHtz6Jt", "policyId": "yy8xggrv", "policyVersionId": "0lpCf6S1"}], "authType": "D3S45LZ1", "code": "QJLIe9jh", "country": "0aH5Pfd2", "dateOfBirth": "OdeaXBkN", "displayName": "fSz4jkz8", "emailAddress": "IsJoeySF", "password": "PRXTYQcj", "reachMinimumAge": true, "uniqueDisplayName": "pnXv4Kua"}' \
    > test.out 2>&1
eval_tap $? 283 'CreateUserFromInvitationV3' test.out

#- 284 UpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam updateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "U4XOhPUT", "country": "kinpZoAN", "dateOfBirth": "PTGluN9K", "displayName": "ufhU6S4y", "languageTag": "hlr3QiCo", "uniqueDisplayName": "VBYr5stI", "userName": "nolCvtNB"}' \
    > test.out 2>&1
eval_tap $? 284 'UpdateUserV3' test.out

#- 285 PublicPartialUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicPartialUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "BhLZ9Dm2", "country": "rJmVADWZ", "dateOfBirth": "Eg8XVDdF", "displayName": "PR2YC3up", "languageTag": "ICVBdpkq", "uniqueDisplayName": "7ARTEwpB", "userName": "WpUUXYo8"}' \
    > test.out 2>&1
eval_tap $? 285 'PublicPartialUpdateUserV3' test.out

#- 286 PublicSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"context": "xnvUZopL", "emailAddress": "BBELbw9O", "languageTag": "bwerAiZT", "upgradeToken": "KrrB5sRF"}' \
    > test.out 2>&1
eval_tap $? 286 'PublicSendVerificationCodeV3' test.out

#- 287 PublicUserVerificationV3
./ng net.accelbyte.sdk.cli.Main iam publicUserVerificationV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "g4XRGLGA", "contactType": "GuL6PDba", "languageTag": "x8cCOdOj", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 287 'PublicUserVerificationV3' test.out

#- 288 PublicUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "0iwiBNRa", "country": "1U5uZsT8", "dateOfBirth": "EHI2PGD7", "displayName": "FgSwmpAC", "emailAddress": "U3eJx4Jz", "password": "ufqqhL8o", "uniqueDisplayName": "y4JItir6", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 288 'PublicUpgradeHeadlessAccountV3' test.out

#- 289 PublicVerifyHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --needVerificationCode  \
    --body '{"emailAddress": "sywW4oHO", "password": "xk06tMNU"}' \
    > test.out 2>&1
eval_tap $? 289 'PublicVerifyHeadlessAccountV3' test.out

#- 290 PublicUpdatePasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicUpdatePasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"languageTag": "6e5rULwR", "mfaToken": "KqWzlHF6", "newPassword": "GZdZL442", "oldPassword": "ocvkN55Y"}' \
    > test.out 2>&1
eval_tap $? 290 'PublicUpdatePasswordV3' test.out

#- 291 PublicCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam publicCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'JvWjO6iy' \
    > test.out 2>&1
eval_tap $? 291 'PublicCreateJusticeUser' test.out

#- 292 PublicPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'VY5BLt7J' \
    --redirectUri 'u9VZm777' \
    --ticket 'B21PrG6X' \
    > test.out 2>&1
eval_tap $? 292 'PublicPlatformLinkV3' test.out

#- 293 PublicPlatformUnlinkV3
eval_tap 0 293 'PublicPlatformUnlinkV3 # SKIP deprecated' test.out

#- 294 PublicPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Ib6C8FWk' \
    > test.out 2>&1
eval_tap $? 294 'PublicPlatformUnlinkAllV3' test.out

#- 295 PublicForcePlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicForcePlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'iqZjYeMa' \
    --ticket 'NUZ2ADjE' \
    > test.out 2>&1
eval_tap $? 295 'PublicForcePlatformLinkV3' test.out

#- 296 PublicWebLinkPlatform
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatform \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Sijj81sU' \
    --clientId 'c3GhPpsa' \
    --redirectUri 'o119oVTj' \
    > test.out 2>&1
eval_tap $? 296 'PublicWebLinkPlatform' test.out

#- 297 PublicWebLinkPlatformEstablish
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatformEstablish \
    --namespace "$AB_NAMESPACE" \
    --platformId 'QBpBXPWP' \
    --code 'EZ7TCfN6' \
    --state 'vOntufur' \
    > test.out 2>&1
eval_tap $? 297 'PublicWebLinkPlatformEstablish' test.out

#- 298 PublicProcessWebLinkPlatformV3
./ng net.accelbyte.sdk.cli.Main iam publicProcessWebLinkPlatformV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '01DPjXPy' \
    --code 'FnL8wFnr' \
    --state '2g1f4MgN' \
    > test.out 2>&1
eval_tap $? 298 'PublicProcessWebLinkPlatformV3' test.out

#- 299 PublicGetUsersPlatformInfosV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUsersPlatformInfosV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"platformId": "SIuOv8SF", "userIds": ["hxyev2Or", "gpNOBamX", "uQZXorLw"]}' \
    > test.out 2>&1
eval_tap $? 299 'PublicGetUsersPlatformInfosV3' test.out

#- 300 ResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam resetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientId": "BCbL54nB", "code": "WXt63SA2", "emailAddress": "uQNBZ2pC", "languageTag": "EE0etUHf", "newPassword": "T4EIStS8"}' \
    > test.out 2>&1
eval_tap $? 300 'ResetPasswordV3' test.out

#- 301 PublicGetUserByUserIdV3
eval_tap 0 301 'PublicGetUserByUserIdV3 # SKIP deprecated' test.out

#- 302 PublicGetUserBanHistoryV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserBanHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'inihzl32' \
    --activeOnly  \
    --after 'sJf7A6Xy' \
    --before 'h5P511GM' \
    --limit '73' \
    > test.out 2>&1
eval_tap $? 302 'PublicGetUserBanHistoryV3' test.out

#- 303 PublicListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'MdJUUmhx' \
    > test.out 2>&1
eval_tap $? 303 'PublicListUserAllPlatformAccountsDistinctV3' test.out

#- 304 PublicGetUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'dMxUS0OE' \
    > test.out 2>&1
eval_tap $? 304 'PublicGetUserInformationV3' test.out

#- 305 PublicGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '4pr5hFYF' \
    --after '0.576729349956591' \
    --before '0.2932465921994475' \
    --limit '18' \
    > test.out 2>&1
eval_tap $? 305 'PublicGetUserLoginHistoriesV3' test.out

#- 306 PublicGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'fQI9jNr1' \
    --after 'KaksB6l3' \
    --before 'JnhhTXBW' \
    --limit '90' \
    --platformId 'c32jixWJ' \
    > test.out 2>&1
eval_tap $? 306 'PublicGetUserPlatformAccountsV3' test.out

#- 307 PublicListJusticePlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicListJusticePlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '8iv3UMEd' \
    > test.out 2>&1
eval_tap $? 307 'PublicListJusticePlatformAccountsV3' test.out

#- 308 PublicLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam publicLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'PHAah2uz' \
    --body '{"platformId": "YF07Zgxv", "platformUserId": "U0hLxvfn"}' \
    > test.out 2>&1
eval_tap $? 308 'PublicLinkPlatformAccount' test.out

#- 309 PublicForceLinkPlatformWithProgression
./ng net.accelbyte.sdk.cli.Main iam publicForceLinkPlatformWithProgression \
    --namespace "$AB_NAMESPACE" \
    --userId 'vPaCkDfn' \
    --body '{"chosenNamespaces": ["llF7RARy", "1eL0PYdZ", "Zl3sVNMZ"], "requestId": "UMUCPoQJ"}' \
    > test.out 2>&1
eval_tap $? 309 'PublicForceLinkPlatformWithProgression' test.out

#- 310 PublicGetPublisherUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetPublisherUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'JHSqqHiM' \
    > test.out 2>&1
eval_tap $? 310 'PublicGetPublisherUserV3' test.out

#- 311 PublicValidateUserByUserIDAndPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserByUserIDAndPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '5Bju4A4M' \
    --password 'xdKaSRaZ' \
    > test.out 2>&1
eval_tap $? 311 'PublicValidateUserByUserIDAndPasswordV3' test.out

#- 312 PublicGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRolesV3 \
    --after 'qNpj8OGJ' \
    --before 'xiuEnIhr' \
    --isWildcard  \
    --limit '19' \
    > test.out 2>&1
eval_tap $? 312 'PublicGetRolesV3' test.out

#- 313 PublicGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRoleV3 \
    --roleId 'vs6NcXQx' \
    > test.out 2>&1
eval_tap $? 313 'PublicGetRoleV3' test.out

#- 314 PublicGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyUserV3 \
    --includeAllPlatforms  \
    > test.out 2>&1
eval_tap $? 314 'PublicGetMyUserV3' test.out

#- 315 PublicSendCodeForwardV3
./ng net.accelbyte.sdk.cli.Main iam publicSendCodeForwardV3 \
    --body '{"context": "BxTj5Dey", "emailAddress": "2Jj0EMJP", "languageTag": "GEKjVHTd", "upgradeToken": "VbHiG7c4"}' \
    > test.out 2>&1
eval_tap $? 315 'PublicSendCodeForwardV3' test.out

#- 316 PublicGetLinkHeadlessAccountToMyAccountConflictV3
./ng net.accelbyte.sdk.cli.Main iam publicGetLinkHeadlessAccountToMyAccountConflictV3 \
    --oneTimeLinkCode '7RtLxopD' \
    > test.out 2>&1
eval_tap $? 316 'PublicGetLinkHeadlessAccountToMyAccountConflictV3' test.out

#- 317 LinkHeadlessAccountToMyAccountV3
./ng net.accelbyte.sdk.cli.Main iam linkHeadlessAccountToMyAccountV3 \
    --body '{"chosenNamespaces": ["xc6vqfi3", "Ri9z7Mz8", "uDFDnyON"], "oneTimeLinkCode": "xj9cWWgA"}' \
    > test.out 2>&1
eval_tap $? 317 'LinkHeadlessAccountToMyAccountV3' test.out

#- 318 PublicGetMyRedirectionAfterLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyRedirectionAfterLinkV3 \
    --oneTimeLinkCode 'L3ItDTYh' \
    > test.out 2>&1
eval_tap $? 318 'PublicGetMyRedirectionAfterLinkV3' test.out

#- 319 PublicGetMyProfileAllowUpdateStatusV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyProfileAllowUpdateStatusV3 \
    > test.out 2>&1
eval_tap $? 319 'PublicGetMyProfileAllowUpdateStatusV3' test.out

#- 320 PublicSendVerificationLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationLinkV3 \
    --body '{"languageTag": "L4vznPwx"}' \
    > test.out 2>&1
eval_tap $? 320 'PublicSendVerificationLinkV3' test.out

#- 321 PublicGetOpenidUserInfoV3
./ng net.accelbyte.sdk.cli.Main iam publicGetOpenidUserInfoV3 \
    > test.out 2>&1
eval_tap $? 321 'PublicGetOpenidUserInfoV3' test.out

#- 322 PublicVerifyUserByLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyUserByLinkV3 \
    --code 'b1tBuCjG' \
    > test.out 2>&1
eval_tap $? 322 'PublicVerifyUserByLinkV3' test.out

#- 323 PlatformAuthenticateSAMLV3Handler
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticateSAMLV3Handler \
    --platformId 'aaaJ3Kc8' \
    --code 'imgXVrW2' \
    --error '8tswryRE' \
    --state 'sINxaqdb' \
    > test.out 2>&1
eval_tap $? 323 'PlatformAuthenticateSAMLV3Handler' test.out

#- 324 LoginSSOClient
./ng net.accelbyte.sdk.cli.Main iam loginSSOClient \
    --platformId 'YFsZn260' \
    --payload 'SQvRQYXv' \
    > test.out 2>&1
eval_tap $? 324 'LoginSSOClient' test.out

#- 325 LogoutSSOClient
./ng net.accelbyte.sdk.cli.Main iam logoutSSOClient \
    --platformId 'leLtGAWo' \
    > test.out 2>&1
eval_tap $? 325 'LogoutSSOClient' test.out

#- 326 RequestTargetTokenResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTargetTokenResponseV3 \
    --additionalData 'hxDpDVp8' \
    --code 'MTn66jqQ' \
    > test.out 2>&1
eval_tap $? 326 'RequestTargetTokenResponseV3' test.out

#- 327 UpgradeAndAuthenticateForwardV3
./ng net.accelbyte.sdk.cli.Main iam upgradeAndAuthenticateForwardV3 \
    --clientId 'z1NiWche' \
    --upgradeSuccessToken 'bZRyNtB9' \
    > test.out 2>&1
eval_tap $? 327 'UpgradeAndAuthenticateForwardV3' test.out

#- 328 AdminListInvitationHistoriesV4
./ng net.accelbyte.sdk.cli.Main iam adminListInvitationHistoriesV4 \
    --limit '22' \
    --namespace "$AB_NAMESPACE" \
    --offset '88' \
    > test.out 2>&1
eval_tap $? 328 'AdminListInvitationHistoriesV4' test.out

#- 329 AdminGetDevicesByUserV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDevicesByUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'YxP3ysRA' \
    > test.out 2>&1
eval_tap $? 329 'AdminGetDevicesByUserV4' test.out

#- 330 AdminGetBannedDevicesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedDevicesV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceType '5hCQbvLh' \
    --endDate 'w7qvViz8' \
    --limit '5' \
    --offset '58' \
    --startDate 'DekyVpBh' \
    > test.out 2>&1
eval_tap $? 330 'AdminGetBannedDevicesV4' test.out

#- 331 AdminGetUserDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeviceBansV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'FdVPeJhP' \
    > test.out 2>&1
eval_tap $? 331 'AdminGetUserDeviceBansV4' test.out

#- 332 AdminBanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminBanDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"comment": "5j4nQqxc", "deviceId": "xbJs0Wr9", "deviceType": "adPfie9Z", "enabled": true, "endDate": "7TIefaD5", "ext": {"0NQvLqXb": {}, "clJeg1sM": {}, "UBhoRhcQ": {}}, "reason": "yw8UaLfW"}' \
    > test.out 2>&1
eval_tap $? 332 'AdminBanDeviceV4' test.out

#- 333 AdminGetDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBanV4 \
    --banId 'erh9YUYN' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 333 'AdminGetDeviceBanV4' test.out

#- 334 AdminUpdateDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateDeviceBanV4 \
    --banId 'ezDCT2KN' \
    --namespace "$AB_NAMESPACE" \
    --body '{"enabled": true}' \
    > test.out 2>&1
eval_tap $? 334 'AdminUpdateDeviceBanV4' test.out

#- 335 AdminGenerateReportV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateReportV4 \
    --namespace "$AB_NAMESPACE" \
    --endDate 'jf8ksglu' \
    --startDate 'CoMKpsFp' \
    --deviceType 'GM40o9Tb' \
    > test.out 2>&1
eval_tap $? 335 'AdminGenerateReportV4' test.out

#- 336 AdminGetDeviceTypesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceTypesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 336 'AdminGetDeviceTypesV4' test.out

#- 337 AdminGetDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBansV4 \
    --deviceId '0HHkoEsK' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 337 'AdminGetDeviceBansV4' test.out

#- 338 AdminDecryptDeviceV4
eval_tap 0 338 'AdminDecryptDeviceV4 # SKIP deprecated' test.out

#- 339 AdminUnbanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminUnbanDeviceV4 \
    --deviceId 'KCSS7fMj' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 339 'AdminUnbanDeviceV4' test.out

#- 340 AdminGetUsersByDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUsersByDeviceV4 \
    --deviceId 'WksuGs9q' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 340 'AdminGetUsersByDeviceV4' test.out

#- 341 AdminGetNamespaceInvitationHistoryV4
./ng net.accelbyte.sdk.cli.Main iam adminGetNamespaceInvitationHistoryV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 341 'AdminGetNamespaceInvitationHistoryV4' test.out

#- 342 AdminGetNamespaceUserInvitationHistoryV4
./ng net.accelbyte.sdk.cli.Main iam adminGetNamespaceUserInvitationHistoryV4 \
    --namespace "$AB_NAMESPACE" \
    --limit '89' \
    --offset '42' \
    > test.out 2>&1
eval_tap $? 342 'AdminGetNamespaceUserInvitationHistoryV4' test.out

#- 343 AdminCreateTestUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateTestUsersV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 25, "userInfo": {"country": "0PkZPM7g"}}' \
    > test.out 2>&1
eval_tap $? 343 'AdminCreateTestUsersV4' test.out

#- 344 AdminCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "0LQGa8X8", "policyId": "gecTEnH4", "policyVersionId": "NAstP1Vi"}, {"isAccepted": false, "localizedPolicyVersionId": "bRVCG6L5", "policyId": "94exEyaM", "policyVersionId": "xO9obUpL"}, {"isAccepted": true, "localizedPolicyVersionId": "yUwN3tsC", "policyId": "I6TeKwAx", "policyVersionId": "kxPn0aNN"}], "authType": "EMAILPASSWD", "code": "68mLoQNt", "country": "M5AOM5Uq", "dateOfBirth": "IRkepvQk", "displayName": "eaQsIDUj", "emailAddress": "pUZf38MU", "password": "wVabSL5T", "passwordMD5Sum": "cx3h2D4U", "reachMinimumAge": false, "uniqueDisplayName": "2WGLuXO8", "username": "RwIoOD9Y"}' \
    > test.out 2>&1
eval_tap $? 344 'AdminCreateUserV4' test.out

#- 345 AdminBulkUpdateUserAccountTypeV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateUserAccountTypeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"testAccount": false, "userIds": ["GVBeAUH7", "1L8LYm9E", "Ef5afZNF"]}' \
    > test.out 2>&1
eval_tap $? 345 'AdminBulkUpdateUserAccountTypeV4' test.out

#- 346 AdminBulkCheckValidUserIDV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkCheckValidUserIDV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["FWrDQfYC", "V284mCKz", "l4BsE5wK"]}' \
    > test.out 2>&1
eval_tap $? 346 'AdminBulkCheckValidUserIDV4' test.out

#- 347 AdminUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '1p3ELkaI' \
    --body '{"avatarUrl": "XZYrW53c", "country": "Swi2SHdR", "dateOfBirth": "Yl6NhlZn", "displayName": "mKq76JA5", "languageTag": "I49CQdnF", "skipLoginQueue": true, "uniqueDisplayName": "YJUVcUjG", "userName": "EC1Dvf7Y"}' \
    > test.out 2>&1
eval_tap $? 347 'AdminUpdateUserV4' test.out

#- 348 AdminUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '81DJctuO' \
    --body '{"code": "36kMR17Y", "emailAddress": "kFrJAmDx"}' \
    > test.out 2>&1
eval_tap $? 348 'AdminUpdateUserEmailAddressV4' test.out

#- 349 AdminDisableUserMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableUserMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'XJitirNf' \
    --body '{"factor": "5lKgbFXM", "mfaToken": "iLRS1c58"}' \
    > test.out 2>&1
eval_tap $? 349 'AdminDisableUserMFAV4' test.out

#- 350 AdminGetUserMFAStatusV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUserMFAStatusV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'GLgiH6DC' \
    > test.out 2>&1
eval_tap $? 350 'AdminGetUserMFAStatusV4' test.out

#- 351 AdminListUserRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminListUserRolesV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '3oyobyuf' \
    > test.out 2>&1
eval_tap $? 351 'AdminListUserRolesV4' test.out

#- 352 AdminUpdateUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'zWA0cXDl' \
    --body '{"assignedNamespaces": ["Lo34KTN5", "CLxZobl4", "82AxclyO"], "roleId": "smMovGm1"}' \
    > test.out 2>&1
eval_tap $? 352 'AdminUpdateUserRoleV4' test.out

#- 353 AdminAddUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'qEODccah' \
    --body '{"assignedNamespaces": ["tVhmLExd", "nbSFSx5G", "dlyprRyb"], "roleId": "f19iR4Up"}' \
    > test.out 2>&1
eval_tap $? 353 'AdminAddUserRoleV4' test.out

#- 354 AdminRemoveUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRemoveUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'gi9fvPdi' \
    --body '{"assignedNamespaces": ["MMzVYQPx", "YXtWtejW", "H0wl2mxc"], "roleId": "MU4VvFDn"}' \
    > test.out 2>&1
eval_tap $? 354 'AdminRemoveUserRoleV4' test.out

#- 355 AdminGetRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV4 \
    --adminRole  \
    --isWildcard  \
    --limit '53' \
    --offset '71' \
    > test.out 2>&1
eval_tap $? 355 'AdminGetRolesV4' test.out

#- 356 AdminCreateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV4 \
    --body '{"adminRole": true, "deletable": false, "isWildcard": false, "roleName": "R2I6BiWZ"}' \
    > test.out 2>&1
eval_tap $? 356 'AdminCreateRoleV4' test.out

#- 357 AdminGetRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV4 \
    --roleId 'MizXZXXC' \
    > test.out 2>&1
eval_tap $? 357 'AdminGetRoleV4' test.out

#- 358 AdminDeleteRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV4 \
    --roleId '9SJpciBN' \
    > test.out 2>&1
eval_tap $? 358 'AdminDeleteRoleV4' test.out

#- 359 AdminUpdateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV4 \
    --roleId 'ClS497jB' \
    --body '{"adminRole": false, "deletable": true, "isWildcard": false, "roleName": "6cU30HRy"}' \
    > test.out 2>&1
eval_tap $? 359 'AdminUpdateRoleV4' test.out

#- 360 AdminUpdateRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV4 \
    --roleId 'KHaG8krJ' \
    --body '{"permissions": [{"action": 11, "resource": "oGshAia1", "schedAction": 62, "schedCron": "Lww1m506", "schedRange": ["ZVhVjdpr", "xqwyBlJD", "KkLouHIN"]}, {"action": 35, "resource": "OEtcfy6p", "schedAction": 65, "schedCron": "9y1qiit7", "schedRange": ["6I19xCjE", "KDp0VQR2", "pJ0PcaMc"]}, {"action": 10, "resource": "7ldYL4BZ", "schedAction": 71, "schedCron": "aZYYPswC", "schedRange": ["AC7hkWkH", "W3iOpcOp", "1A4kcXlo"]}]}' \
    > test.out 2>&1
eval_tap $? 360 'AdminUpdateRolePermissionsV4' test.out

#- 361 AdminAddRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV4 \
    --roleId '7O8EuCux' \
    --body '{"permissions": [{"action": 0, "resource": "4UmhoZ3X", "schedAction": 96, "schedCron": "h56WTjEu", "schedRange": ["NGNL7QfY", "xLq7i249", "hEi6e6wV"]}, {"action": 6, "resource": "56mpfAJ7", "schedAction": 77, "schedCron": "B34fFepb", "schedRange": ["Vw8Xq882", "nLgNvpRu", "iW8muiSI"]}, {"action": 65, "resource": "LHsKmM7R", "schedAction": 24, "schedCron": "V2LJUWvJ", "schedRange": ["daiSL5qR", "Ad3NeArv", "4GdbzTwL"]}]}' \
    > test.out 2>&1
eval_tap $? 361 'AdminAddRolePermissionsV4' test.out

#- 362 AdminDeleteRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV4 \
    --roleId 'RhcPICBs' \
    --body '["1bRFHXcS", "5prwbll6", "QzB6NvBn"]' \
    > test.out 2>&1
eval_tap $? 362 'AdminDeleteRolePermissionsV4' test.out

#- 363 AdminListAssignedUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminListAssignedUsersV4 \
    --roleId 'oXIXR5EX' \
    --after 'ULgz0eel' \
    --before 'x63oY4ln' \
    --limit '92' \
    > test.out 2>&1
eval_tap $? 363 'AdminListAssignedUsersV4' test.out

#- 364 AdminAssignUserToRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAssignUserToRoleV4 \
    --roleId 'nIAtrGgA' \
    --body '{"assignedNamespaces": ["Nt2wCoiI", "YwyUNZ9d", "HQleWZ6G"], "namespace": "fNxlPfXV", "userId": "NQg3V4vw"}' \
    > test.out 2>&1
eval_tap $? 364 'AdminAssignUserToRoleV4' test.out

#- 365 AdminRevokeUserFromRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRevokeUserFromRoleV4 \
    --roleId 'kgJJOarx' \
    --body '{"namespace": "PGtx9XaP", "userId": "9EXkwZC8"}' \
    > test.out 2>&1
eval_tap $? 365 'AdminRevokeUserFromRoleV4' test.out

#- 366 AdminInviteUserNewV4
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserNewV4 \
    --body '{"assignedNamespaces": ["O89uerOn", "NoNgu0fv", "3dBGhnHf"], "emailAddresses": ["2r2IhXrf", "0xVfjywH", "DGn5Z3sw"], "isAdmin": true, "isNewStudio": true, "languageTag": "SSYML4hG", "namespace": "Pql00MgB", "roleId": "IQBcJ9KZ"}' \
    > test.out 2>&1
eval_tap $? 366 'AdminInviteUserNewV4' test.out

#- 367 AdminUpdateMyUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateMyUserV4 \
    --body '{"avatarUrl": "Sq9gpVeS", "country": "PFRmxxpi", "dateOfBirth": "9EEZ6cXG", "displayName": "aX5cufH3", "languageTag": "l8tOqa5Y", "skipLoginQueue": true, "uniqueDisplayName": "Gyb2cCaY", "userName": "4bK7UiOn"}' \
    > test.out 2>&1
eval_tap $? 367 'AdminUpdateMyUserV4' test.out

#- 368 AdminDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyAuthenticatorV4 \
    --body '{"factor": "QnRBUOhl", "mfaToken": "Wtuk5Nvr"}' \
    > test.out 2>&1
eval_tap $? 368 'AdminDisableMyAuthenticatorV4' test.out

#- 369 AdminEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyAuthenticatorV4 \
    --code 'gxdxUi6c' \
    > test.out 2>&1
eval_tap $? 369 'AdminEnableMyAuthenticatorV4' test.out

#- 370 AdminGenerateMyAuthenticatorKeyV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateMyAuthenticatorKeyV4 \
    > test.out 2>&1
eval_tap $? 370 'AdminGenerateMyAuthenticatorKeyV4' test.out

#- 371 AdminGetMyBackupCodesV4
eval_tap 0 371 'AdminGetMyBackupCodesV4 # SKIP deprecated' test.out

#- 372 AdminGenerateMyBackupCodesV4
eval_tap 0 372 'AdminGenerateMyBackupCodesV4 # SKIP deprecated' test.out

#- 373 AdminDisableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyBackupCodesV4 \
    --body '{"factor": "AEJUsYIg", "mfaToken": "HEH8ooKL"}' \
    > test.out 2>&1
eval_tap $? 373 'AdminDisableMyBackupCodesV4' test.out

#- 374 AdminDownloadMyBackupCodesV4
eval_tap 0 374 'AdminDownloadMyBackupCodesV4 # SKIP deprecated' test.out

#- 375 AdminEnableMyBackupCodesV4
eval_tap 0 375 'AdminEnableMyBackupCodesV4 # SKIP deprecated' test.out

#- 376 AdminGetBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBackupCodesV4 \
    --languageTag 'sgYXpv70' \
    > test.out 2>&1
eval_tap $? 376 'AdminGetBackupCodesV4' test.out

#- 377 AdminGenerateBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateBackupCodesV4 \
    --languageTag '6Eul73O4' \
    > test.out 2>&1
eval_tap $? 377 'AdminGenerateBackupCodesV4' test.out

#- 378 AdminEnableBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableBackupCodesV4 \
    --languageTag '7C6iwaJp' \
    > test.out 2>&1
eval_tap $? 378 'AdminEnableBackupCodesV4' test.out

#- 379 AdminChallengeMyMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminChallengeMyMFAV4 \
    --code 'D6dahYqY' \
    --factor 'L7tkyNSN' \
    > test.out 2>&1
eval_tap $? 379 'AdminChallengeMyMFAV4' test.out

#- 380 AdminSendMyMFAEmailCodeV4
./ng net.accelbyte.sdk.cli.Main iam adminSendMyMFAEmailCodeV4 \
    --action '5j2ZrM5v' \
    --languageTag 'BmhJ7lPI' \
    > test.out 2>&1
eval_tap $? 380 'AdminSendMyMFAEmailCodeV4' test.out

#- 381 AdminDisableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyEmailV4 \
    --body '{"factor": "8U2zziBX", "mfaToken": "FznlSwb4"}' \
    > test.out 2>&1
eval_tap $? 381 'AdminDisableMyEmailV4' test.out

#- 382 AdminEnableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyEmailV4 \
    --code 'U9VQewn6' \
    > test.out 2>&1
eval_tap $? 382 'AdminEnableMyEmailV4' test.out

#- 383 AdminGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyEnabledFactorsV4 \
    > test.out 2>&1
eval_tap $? 383 'AdminGetMyEnabledFactorsV4' test.out

#- 384 AdminMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam adminMakeFactorMyDefaultV4 \
    --factor '3mLzWQeD' \
    > test.out 2>&1
eval_tap $? 384 'AdminMakeFactorMyDefaultV4' test.out

#- 385 AdminGetMyOwnMFAStatusV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyOwnMFAStatusV4 \
    > test.out 2>&1
eval_tap $? 385 'AdminGetMyOwnMFAStatusV4' test.out

#- 386 AdminGetMyMFAStatusV4
eval_tap 0 386 'AdminGetMyMFAStatusV4 # SKIP deprecated' test.out

#- 387 AdminInviteUserV4
eval_tap 0 387 'AdminInviteUserV4 # SKIP deprecated' test.out

#- 388 AuthenticationWithPlatformLinkV4
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV4 \
    --extendExp  \
    --clientId 'HENwUudP' \
    --linkingToken 'CnGXB8Xk' \
    --password 'AdwZNrj0' \
    --username 'keDCFft7' \
    > test.out 2>&1
eval_tap $? 388 'AuthenticationWithPlatformLinkV4' test.out

#- 389 GenerateTokenByNewHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV4 \
    --additionalData 'KndTE8KQ' \
    --extendExp  \
    --linkingToken '0a3cXTUI' \
    > test.out 2>&1
eval_tap $? 389 'GenerateTokenByNewHeadlessAccountV4' test.out

#- 390 Verify2faCodeV4
./ng net.accelbyte.sdk.cli.Main iam verify2faCodeV4 \
    --code 'jJWQayfx' \
    --factor 'Azwn18gv' \
    --mfaToken '8b3uaYwH' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 390 'Verify2faCodeV4' test.out

#- 391 PlatformTokenGrantV4
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV4 \
    --platformId 'Vz0QIxMV' \
    --codeChallenge '1KKXyJNa' \
    --codeChallengeMethod 'plain' \
    --additionalData 'T6p8xrOu' \
    --clientId 'WQmUvq2M' \
    --createHeadless  \
    --deviceId '3yMBefaT' \
    --macAddress 'jLRLrXha' \
    --platformToken 'zjr6Wsa4' \
    --serviceLabel '0.9676476030914444' \
    --skipSetCookie  \
    > test.out 2>&1
eval_tap $? 391 'PlatformTokenGrantV4' test.out

#- 392 SimultaneousLoginV4
./ng net.accelbyte.sdk.cli.Main iam simultaneousLoginV4 \
    --codeChallenge 'PJMQOzCD' \
    --codeChallengeMethod 'plain' \
    --simultaneousPlatform 'IciQgPbh' \
    --simultaneousTicket 'vHzqjiqL' \
    --nativePlatform 'steam' \
    --nativePlatformTicket 'bt6U09Qt' \
    > test.out 2>&1
eval_tap $? 392 'SimultaneousLoginV4' test.out

#- 393 TokenGrantV4
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV4 \
    --codeChallenge 'Ate2P0G2' \
    --codeChallengeMethod 'plain' \
    --additionalData '6CVE0gaW' \
    --clientId 'HH0AmrO1' \
    --clientSecret '9OvHpzDl' \
    --code 'urKt31F9' \
    --codeVerifier '8GGXXZiH' \
    --extendNamespace 'od8awgci' \
    --extendExp  \
    --loginQueueTicket '2bPpd86W' \
    --password '9YN1wbVC' \
    --redirectUri '0hifBhcV' \
    --refreshToken 'B1KyJno2' \
    --username 'Tc5yTN1Y' \
    --grantType 'client_credentials' \
    > test.out 2>&1
eval_tap $? 393 'TokenGrantV4' test.out

#- 394 RequestTargetTokenResponseV4
./ng net.accelbyte.sdk.cli.Main iam requestTargetTokenResponseV4 \
    --additionalData 'Gd9Fn8Y2' \
    --code 'taJCRRIf' \
    > test.out 2>&1
eval_tap $? 394 'RequestTargetTokenResponseV4' test.out

#- 395 PublicListUserIDByPlatformUserIDsV4
./ng net.accelbyte.sdk.cli.Main iam publicListUserIDByPlatformUserIDsV4 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Qvjjgm3H' \
    --rawPUID  \
    --body '{"pidType": "bxqcU4ua", "platformUserIds": ["kiD5g2Yn", "TG8uzPoI", "dUVD6dhT"]}' \
    > test.out 2>&1
eval_tap $? 395 'PublicListUserIDByPlatformUserIDsV4' test.out

#- 396 PublicCreateTestUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateTestUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "UBQQCqBG", "policyId": "kqOspv4v", "policyVersionId": "N71r90U4"}, {"isAccepted": false, "localizedPolicyVersionId": "ikqst56a", "policyId": "VcUCMpPY", "policyVersionId": "2JvJbpMc"}, {"isAccepted": false, "localizedPolicyVersionId": "kwwiOd9J", "policyId": "ly2XMVtm", "policyVersionId": "OelZstR3"}], "authType": "EMAILPASSWD", "country": "jEOD4uIp", "dateOfBirth": "RYJ2BfQh", "displayName": "WTIRO1OZ", "emailAddress": "hjQHypVD", "password": "6Fguw66Z", "passwordMD5Sum": "tGxz66ym", "uniqueDisplayName": "fckMHauf", "username": "Tlqr4ovz", "verified": true}' \
    > test.out 2>&1
eval_tap $? 396 'PublicCreateTestUserV4' test.out

#- 397 PublicCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "0CYYyVBL", "policyId": "3kP3oixn", "policyVersionId": "SSzhVGJI"}, {"isAccepted": true, "localizedPolicyVersionId": "iDELCyUy", "policyId": "CTMZwnpX", "policyVersionId": "I2g8gCq4"}, {"isAccepted": true, "localizedPolicyVersionId": "7ZZM5VKU", "policyId": "E0XUD1iW", "policyVersionId": "NKO3xhqT"}], "authType": "EMAILPASSWD", "code": "Gwo2qxJn", "country": "KCJsA2Lu", "dateOfBirth": "h6MAQits", "displayName": "l0PmVrIA", "emailAddress": "mpz7PRMq", "password": "HPYk1OHK", "passwordMD5Sum": "4HlKnWq2", "reachMinimumAge": true, "uniqueDisplayName": "yrnpjxxS", "username": "regBFAob"}' \
    > test.out 2>&1
eval_tap $? 397 'PublicCreateUserV4' test.out

#- 398 CreateUserFromInvitationV4
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV4 \
    --invitationId 'OZttNir6' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "RyrfQQ0j", "policyId": "ewa9ZvVs", "policyVersionId": "DORHekze"}, {"isAccepted": true, "localizedPolicyVersionId": "SFsO1Wgx", "policyId": "jlJSGjqn", "policyVersionId": "lIax7rwm"}, {"isAccepted": true, "localizedPolicyVersionId": "wBJKytzN", "policyId": "rCHWNBRo", "policyVersionId": "pskG3gHS"}], "authType": "EMAILPASSWD", "code": "Tloi4zlg", "country": "UKXuEjYn", "dateOfBirth": "hhMm8sxg", "displayName": "erhAzMKd", "emailAddress": "DGSWw0Bz", "password": "Mmi3Demt", "passwordMD5Sum": "oDPo2TGf", "reachMinimumAge": false, "uniqueDisplayName": "ltuuCsLq", "username": "RD54P2pj"}' \
    > test.out 2>&1
eval_tap $? 398 'CreateUserFromInvitationV4' test.out

#- 399 PublicUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "cpPdGGK8", "country": "Y560VN2O", "dateOfBirth": "ri3Gdas3", "displayName": "jxG1TFj4", "languageTag": "6Yah9PsW", "uniqueDisplayName": "vgAIh0iT", "userName": "QetMrmR2"}' \
    > test.out 2>&1
eval_tap $? 399 'PublicUpdateUserV4' test.out

#- 400 PublicUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "zqeUJwjq", "emailAddress": "wtqa2XI4"}' \
    > test.out 2>&1
eval_tap $? 400 'PublicUpdateUserEmailAddressV4' test.out

#- 401 PublicUpgradeHeadlessAccountWithVerificationCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountWithVerificationCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "MRhYNWNp", "country": "AXWS8DZ0", "dateOfBirth": "QCNYlN5r", "displayName": "tFgZEwgG", "emailAddress": "izCFlXnG", "password": "yaonm2xA", "reachMinimumAge": false, "uniqueDisplayName": "HsPMi5B4", "username": "omGakqjT", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 401 'PublicUpgradeHeadlessAccountWithVerificationCodeV4' test.out

#- 402 PublicUpgradeHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"dateOfBirth": "bBreNDCj", "displayName": "JjEfSTpw", "emailAddress": "IQOjmP2S", "password": "jJYnZXDH", "uniqueDisplayName": "Lx3t9ZyW", "username": "oiSH2y39"}' \
    > test.out 2>&1
eval_tap $? 402 'PublicUpgradeHeadlessAccountV4' test.out

#- 403 PublicDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"factor": "yY8ss6ZJ", "mfaToken": "IjkHyYZ1"}' \
    > test.out 2>&1
eval_tap $? 403 'PublicDisableMyAuthenticatorV4' test.out

#- 404 PublicEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'eyDpPA8g' \
    > test.out 2>&1
eval_tap $? 404 'PublicEnableMyAuthenticatorV4' test.out

#- 405 PublicGenerateMyAuthenticatorKeyV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateMyAuthenticatorKeyV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 405 'PublicGenerateMyAuthenticatorKeyV4' test.out

#- 406 PublicGetMyBackupCodesV4
eval_tap 0 406 'PublicGetMyBackupCodesV4 # SKIP deprecated' test.out

#- 407 PublicGenerateMyBackupCodesV4
eval_tap 0 407 'PublicGenerateMyBackupCodesV4 # SKIP deprecated' test.out

#- 408 PublicDisableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"factor": "fUvqs8uJ", "mfaToken": "b9GIrX1V"}' \
    > test.out 2>&1
eval_tap $? 408 'PublicDisableMyBackupCodesV4' test.out

#- 409 PublicDownloadMyBackupCodesV4
eval_tap 0 409 'PublicDownloadMyBackupCodesV4 # SKIP deprecated' test.out

#- 410 PublicEnableMyBackupCodesV4
eval_tap 0 410 'PublicEnableMyBackupCodesV4 # SKIP deprecated' test.out

#- 411 PublicGetBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGetBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --languageTag 'DsbCUPDw' \
    > test.out 2>&1
eval_tap $? 411 'PublicGetBackupCodesV4' test.out

#- 412 PublicGenerateBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --languageTag '2FGPsN73' \
    > test.out 2>&1
eval_tap $? 412 'PublicGenerateBackupCodesV4' test.out

#- 413 PublicEnableBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --languageTag 'W6Q0Jyhv' \
    > test.out 2>&1
eval_tap $? 413 'PublicEnableBackupCodesV4' test.out

#- 414 PublicChallengeMyMFAV4
./ng net.accelbyte.sdk.cli.Main iam publicChallengeMyMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'tInCY5vW' \
    --factor 'WWrnDIa3' \
    > test.out 2>&1
eval_tap $? 414 'PublicChallengeMyMFAV4' test.out

#- 415 PublicRemoveTrustedDeviceV4
./ng net.accelbyte.sdk.cli.Main iam publicRemoveTrustedDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceToken 'toU7xy8Z' \
    > test.out 2>&1
eval_tap $? 415 'PublicRemoveTrustedDeviceV4' test.out

#- 416 PublicSendMyMFAEmailCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicSendMyMFAEmailCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --action 'CfjB6aZf' \
    --languageTag 'MJvFMbRT' \
    > test.out 2>&1
eval_tap $? 416 'PublicSendMyMFAEmailCodeV4' test.out

#- 417 PublicDisableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyEmailV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"factor": "tp18slpW", "mfaToken": "7yNXio74"}' \
    > test.out 2>&1
eval_tap $? 417 'PublicDisableMyEmailV4' test.out

#- 418 PublicEnableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyEmailV4 \
    --namespace "$AB_NAMESPACE" \
    --code '3DOeP2ie' \
    > test.out 2>&1
eval_tap $? 418 'PublicEnableMyEmailV4' test.out

#- 419 PublicGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam publicGetMyEnabledFactorsV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 419 'PublicGetMyEnabledFactorsV4' test.out

#- 420 PublicMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam publicMakeFactorMyDefaultV4 \
    --namespace "$AB_NAMESPACE" \
    --factor 'TVc1Bmp1' \
    > test.out 2>&1
eval_tap $? 420 'PublicMakeFactorMyDefaultV4' test.out

#- 421 PublicGetMyOwnMFAStatusV4
./ng net.accelbyte.sdk.cli.Main iam publicGetMyOwnMFAStatusV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 421 'PublicGetMyOwnMFAStatusV4' test.out

#- 422 PublicGetMyMFAStatusV4
eval_tap 0 422 'PublicGetMyMFAStatusV4 # SKIP deprecated' test.out

#- 423 PublicGetUserPublicInfoByUserIdV4
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPublicInfoByUserIdV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Jf47CdJQ' \
    > test.out 2>&1
eval_tap $? 423 'PublicGetUserPublicInfoByUserIdV4' test.out

#- 424 PublicInviteUserV4
./ng net.accelbyte.sdk.cli.Main iam publicInviteUserV4 \
    --body '{"additionalData": "x6locfSI", "emailAddress": "vvMEVbV9", "languageTag": "ObOk6eaE", "namespace": "0Xm7eFcR", "namespaceDisplayName": "aU3k5ww8"}' \
    > test.out 2>&1
eval_tap $? 424 'PublicInviteUserV4' test.out

#- 425 PublicUpgradeHeadlessWithCodeV4Forward
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessWithCodeV4Forward \
    --body '{"code": "0gn5vlUB", "country": "FClxbFRR", "dateOfBirth": "J7qNTXcK", "displayName": "LbaBP8k5", "emailAddress": "nh9CGJDo", "password": "8SkA5RJP", "reachMinimumAge": true, "uniqueDisplayName": "jJvzew9K", "username": "9bp9UwJf", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 425 'PublicUpgradeHeadlessWithCodeV4Forward' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
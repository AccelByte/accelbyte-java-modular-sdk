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
    --body '{"modules": [{"docLink": "jRfhVdc5", "groups": [{"group": "zIvYgyrz", "groupId": "S6Q7XAbP", "permissions": [{"allowedActions": [36, 79, 30], "resource": "izmYPLsS"}, {"allowedActions": [27, 64, 83], "resource": "9X0Mnilp"}, {"allowedActions": [29, 42, 45], "resource": "lRKKSmHN"}]}, {"group": "92Riv18T", "groupId": "kljWTp47", "permissions": [{"allowedActions": [62, 12, 81], "resource": "AWCdqARe"}, {"allowedActions": [92, 55, 32], "resource": "IMSykMX0"}, {"allowedActions": [100, 83, 54], "resource": "EioPTEbM"}]}, {"group": "IdVXAFwP", "groupId": "dBwf6msV", "permissions": [{"allowedActions": [89, 3, 83], "resource": "U5C02stH"}, {"allowedActions": [43, 25, 58], "resource": "LsOlBytN"}, {"allowedActions": [63, 17, 21], "resource": "f4VwJynw"}]}], "module": "tlxFvstd", "moduleId": "yYgPVKLe"}, {"docLink": "Dxa9XbPF", "groups": [{"group": "kWh96QOO", "groupId": "4ZQ6CFw0", "permissions": [{"allowedActions": [58, 58, 76], "resource": "sE1ItPDF"}, {"allowedActions": [67, 12, 62], "resource": "GvtJEtiV"}, {"allowedActions": [57, 76, 3], "resource": "uXObglFS"}]}, {"group": "r79cO0fU", "groupId": "FwvxmGYz", "permissions": [{"allowedActions": [94, 13, 54], "resource": "bQR2hIhO"}, {"allowedActions": [99, 62, 30], "resource": "VgoHYPfb"}, {"allowedActions": [45, 71, 66], "resource": "H2kGCHso"}]}, {"group": "M3GBMTe1", "groupId": "t4uW1A11", "permissions": [{"allowedActions": [58, 84, 8], "resource": "1pt0ODCz"}, {"allowedActions": [0, 94, 88], "resource": "KFXYQXyZ"}, {"allowedActions": [89, 28, 65], "resource": "Xwp3vdEk"}]}], "module": "6fAwJide", "moduleId": "nK0t8Wxu"}, {"docLink": "JaMMlySr", "groups": [{"group": "lWG27Z19", "groupId": "kRGSwI5M", "permissions": [{"allowedActions": [68, 60, 61], "resource": "JRLBzOf6"}, {"allowedActions": [32, 13, 16], "resource": "oq7eaY7C"}, {"allowedActions": [16, 30, 64], "resource": "xkeWJpRc"}]}, {"group": "9Ex8cfNi", "groupId": "fFVoe2g8", "permissions": [{"allowedActions": [90, 65, 39], "resource": "jt1eflDb"}, {"allowedActions": [36, 45, 10], "resource": "A6kAKpP1"}, {"allowedActions": [55, 68, 44], "resource": "Lepou5Sk"}]}, {"group": "oDtWnwWW", "groupId": "uCamXduQ", "permissions": [{"allowedActions": [46, 24, 44], "resource": "BPANkVDG"}, {"allowedActions": [11, 63, 83], "resource": "jLBV2Zbt"}, {"allowedActions": [16, 88, 7], "resource": "qtOt6vXn"}]}], "module": "GrPjn9st", "moduleId": "JPt0VOVT"}]}' \
    > test.out 2>&1
eval_tap $? 109 'AdminUpdateAvailablePermissionsByModule' test.out

#- 110 AdminDeleteConfigPermissionsByGroup
./ng net.accelbyte.sdk.cli.Main iam adminDeleteConfigPermissionsByGroup \
    --forceDelete  \
    --body '{"groupId": "dAo8EJIr", "moduleId": "Sf9GDpmG"}' \
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
    --body '[{"field": "LNowDtKZ", "validation": {"allowAllSpecialCharacters": false, "allowDigit": true, "allowLetter": true, "allowSpace": true, "allowUnicode": true, "avatarConfig": {"allowedPrefixes": ["70rg8M77", "qqGvO9jR", "xxVUpEZx"], "preferRegex": true, "regex": "ikS9fWGZ"}, "blockedWord": ["2dz1AY3U", "KrkV3VBF", "ZSEnnP3r"], "description": [{"language": "76p8amfs", "message": ["anpHgirb", "HJlCQ2PC", "5YLCQxsM"]}, {"language": "qfnxRoaU", "message": ["AdYOUIys", "dEqZKOBu", "1PfLHsYx"]}, {"language": "dXGRI2iL", "message": ["5tEIHRNR", "wIk6Qxcx", "NLIK83HW"]}], "isCustomRegex": true, "letterCase": "rNKV4MlQ", "maxLength": 78, "maxRepeatingAlphaNum": 63, "maxRepeatingSpecialCharacter": 80, "minCharType": 4, "minLength": 14, "regex": "hWdDoDWI", "specialCharacterLocation": "Q3bitRkm", "specialCharacters": ["ERCMJGV0", "4t3RP3nD", "778ktS9k"]}}, {"field": "sB3Ges3R", "validation": {"allowAllSpecialCharacters": true, "allowDigit": false, "allowLetter": true, "allowSpace": false, "allowUnicode": true, "avatarConfig": {"allowedPrefixes": ["CfVV7tda", "R6gewiHL", "wb3Sp0Nw"], "preferRegex": true, "regex": "PZ0BCyaD"}, "blockedWord": ["FmpVq0qM", "I3JxQgw5", "cVNRafls"], "description": [{"language": "5UZjgKQJ", "message": ["zVltLu3z", "p3HW0ic7", "ZSC2Ui86"]}, {"language": "lzC5pw2I", "message": ["mKaNdnJm", "2L9s8Kde", "jcdTcM1H"]}, {"language": "Vpd2Iz7w", "message": ["GV6WQdXf", "qOGjjewJ", "S39I3BCT"]}], "isCustomRegex": false, "letterCase": "qm3ONRLO", "maxLength": 54, "maxRepeatingAlphaNum": 81, "maxRepeatingSpecialCharacter": 9, "minCharType": 44, "minLength": 46, "regex": "GLUyUonh", "specialCharacterLocation": "bkpINa1E", "specialCharacters": ["291Bzpjx", "c5o8ua3c", "BHw34TXk"]}}, {"field": "pQ1yttnH", "validation": {"allowAllSpecialCharacters": true, "allowDigit": false, "allowLetter": true, "allowSpace": true, "allowUnicode": true, "avatarConfig": {"allowedPrefixes": ["MqFoQ8va", "soqF4XV2", "UJet2IwS"], "preferRegex": true, "regex": "vrCfpzUg"}, "blockedWord": ["bE5LZkOg", "mvR5oCkd", "t4AhTXGc"], "description": [{"language": "RqdwtIWZ", "message": ["Iod4dPCM", "EpU94jkT", "vreBmodv"]}, {"language": "lnl7RM9p", "message": ["QCWhhxMG", "ILphkbYK", "YmgoPgCu"]}, {"language": "V0Y654K5", "message": ["OahT5zk1", "CgM7sBqp", "92OGBYeQ"]}], "isCustomRegex": false, "letterCase": "osJnujdY", "maxLength": 39, "maxRepeatingAlphaNum": 87, "maxRepeatingSpecialCharacter": 69, "minCharType": 41, "minLength": 59, "regex": "wZM0beXL", "specialCharacterLocation": "xVOapFFG", "specialCharacters": ["M0pF5Vea", "lioKA8Ey", "hMW8b0Al"]}}]' \
    > test.out 2>&1
eval_tap $? 113 'AdminUpdateInputValidations' test.out

#- 114 AdminResetInputValidations
./ng net.accelbyte.sdk.cli.Main iam adminResetInputValidations \
    --field 'SEJCAVkk' \
    > test.out 2>&1
eval_tap $? 114 'AdminResetInputValidations' test.out

#- 115 ListAdminsV3
./ng net.accelbyte.sdk.cli.Main iam listAdminsV3 \
    --namespace "$AB_NAMESPACE" \
    --after 'XweBNb9d' \
    --before 'IwKB99IJ' \
    --endDate 'jL9KSE3q' \
    --limit '53' \
    --query 'J6Pe5E8W' \
    --roleId 'TSqiYkmG' \
    --startDate 'etlF8Pn8' \
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
    --body '{"ageRestriction": 64, "enable": true}' \
    > test.out 2>&1
eval_tap $? 117 'AdminUpdateAgeRestrictionConfigV3' test.out

#- 118 AdminGetListCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminGetListCountryAgeRestrictionV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 118 'AdminGetListCountryAgeRestrictionV3' test.out

#- 119 AdminUpdateCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateCountryAgeRestrictionV3 \
    --countryCode '1SdhzkEO' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ageRestriction": 56}' \
    > test.out 2>&1
eval_tap $? 119 'AdminUpdateCountryAgeRestrictionV3' test.out

#- 120 AdminGetBannedUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType '3I5elrBd' \
    --limit '72' \
    --offset '6' \
    > test.out 2>&1
eval_tap $? 120 'AdminGetBannedUsersV3' test.out

#- 121 AdminBanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"ban": "o6bav89f", "comment": "1xQFQsIQ", "endDate": "C7PhMKzH", "reason": "m5ZgcgXr", "skipNotif": true, "userIds": ["7sZuTA3J", "iHYSRYdJ", "O32cs79Q"]}' \
    > test.out 2>&1
eval_tap $? 121 'AdminBanUserBulkV3' test.out

#- 122 AdminUnbanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminUnbanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"bans": [{"banId": "Xp8Mq5rd", "userId": "lIoxT0Rb"}, {"banId": "dFTXyD68", "userId": "RWTlO8l2"}, {"banId": "0gst7uGL", "userId": "FM8GryVm"}]}' \
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
    --clientId 'sDedpIYu' \
    --clientName 'K31s2v4U' \
    --clientType 'iaGt3XfQ' \
    --limit '25' \
    --offset '96' \
    --skipLoginQueue  \
    > test.out 2>&1
eval_tap $? 124 'AdminGetClientsByNamespaceV3' test.out

#- 125 AdminBulkUpdateClientsV3
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateClientsV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientIds": ["8flumRev", "uk5WeSfa", "UmaZLH1F"], "clientUpdateRequest": {"audiences": ["4u7v9JRV", "0WbVBXLn", "vU85Z6AC"], "baseUri": "rEmSjGJK", "clientName": "jHOxL8Vc", "clientPermissions": [{"action": 99, "resource": "BH3Dm0o4", "schedAction": 1, "schedCron": "R5oPhgK3", "schedRange": ["jsCNyBhN", "noBtV5z0", "ebtoj9UQ"]}, {"action": 97, "resource": "dsL8kLWb", "schedAction": 91, "schedCron": "lTzAp408", "schedRange": ["IVNzFWDE", "4HjNgs72", "WmldUilD"]}, {"action": 21, "resource": "XUsgjLol", "schedAction": 41, "schedCron": "JhHBuaI2", "schedRange": ["e1gXa339", "X7DITUjh", "aiqoKcbz"]}], "clientPlatform": "nPJ7L5dg", "deletable": true, "description": "qQ51Rpfx", "modulePermissions": [{"moduleId": "FSvyclWb", "selectedGroups": [{"groupId": "fyTUnnFj", "selectedActions": [74, 1, 78]}, {"groupId": "F1xHigaL", "selectedActions": [79, 14, 59]}, {"groupId": "5VDELbf1", "selectedActions": [59, 12, 30]}]}, {"moduleId": "oI8bDn8J", "selectedGroups": [{"groupId": "MwdT7KnS", "selectedActions": [90, 81, 52]}, {"groupId": "KtH6DN7X", "selectedActions": [54, 68, 42]}, {"groupId": "CUUi0zCF", "selectedActions": [94, 77, 65]}]}, {"moduleId": "zoAF6JTM", "selectedGroups": [{"groupId": "c3Pb7fPu", "selectedActions": [49, 8, 54]}, {"groupId": "f8PyyN6D", "selectedActions": [89, 48, 0]}, {"groupId": "tbrdOlOD", "selectedActions": [66, 83, 68]}]}], "namespace": "rMPftAyV", "oauthAccessTokenExpiration": 44, "oauthAccessTokenExpirationTimeUnit": "AyNVw1pr", "oauthRefreshTokenExpiration": 26, "oauthRefreshTokenExpirationTimeUnit": "lvqje7kp", "redirectUri": "CrRvmJbW", "scopes": ["AxaVU9US", "OfjGMeux", "tPkI52qd"], "skipLoginQueue": false, "twoFactorEnabled": true}}' \
    > test.out 2>&1
eval_tap $? 125 'AdminBulkUpdateClientsV3' test.out

#- 126 AdminCreateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateClientV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["UEC8cxxB", "sgC3CehO", "ganxc2av"], "baseUri": "12hezrJV", "clientId": "pj4Srh5R", "clientName": "K3I4MK1I", "clientPermissions": [{"action": 40, "resource": "DiqQ9MJx", "schedAction": 63, "schedCron": "2JAwlRvM", "schedRange": ["Zslaibb7", "novGEaTB", "ND3rJF00"]}, {"action": 71, "resource": "4F7BXPWQ", "schedAction": 36, "schedCron": "3qKyOjsL", "schedRange": ["uNJAbFvL", "gHcPYpB2", "9XG3HFIy"]}, {"action": 94, "resource": "PBZKaRbM", "schedAction": 51, "schedCron": "c0yQb3RD", "schedRange": ["goRVCCPB", "MTJLGaeo", "V62LXxcI"]}], "clientPlatform": "FnJ3vypa", "deletable": true, "description": "tPY2XDC7", "modulePermissions": [{"moduleId": "RsL9CxV2", "selectedGroups": [{"groupId": "CGhEs1XO", "selectedActions": [40, 3, 90]}, {"groupId": "LSVWfKOE", "selectedActions": [66, 46, 18]}, {"groupId": "d0LLHBfN", "selectedActions": [89, 29, 97]}]}, {"moduleId": "oangu7QU", "selectedGroups": [{"groupId": "QPTKOvlB", "selectedActions": [84, 55, 50]}, {"groupId": "WtwVFNx4", "selectedActions": [20, 93, 70]}, {"groupId": "GexpNUCN", "selectedActions": [19, 5, 53]}]}, {"moduleId": "fZ7DfHc5", "selectedGroups": [{"groupId": "V8UHafy5", "selectedActions": [30, 75, 57]}, {"groupId": "q66w1pQN", "selectedActions": [37, 32, 99]}, {"groupId": "szMMzkhN", "selectedActions": [33, 76, 93]}]}], "namespace": "QZGYIfqe", "oauthAccessTokenExpiration": 30, "oauthAccessTokenExpirationTimeUnit": "6sVr1fKe", "oauthClientType": "nKRBHNvb", "oauthRefreshTokenExpiration": 3, "oauthRefreshTokenExpirationTimeUnit": "EPXvGjK8", "parentNamespace": "b5wmFE3u", "redirectUri": "DreABxSK", "scopes": ["FBGHiitc", "cQQWtmTC", "3S8Wvtk1"], "secret": "MnA3Xqa9", "skipLoginQueue": false, "twoFactorEnabled": false}' \
    > test.out 2>&1
eval_tap $? 126 'AdminCreateClientV3' test.out

#- 127 AdminGetClientsbyNamespacebyIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetClientsbyNamespacebyIDV3 \
    --clientId 'MywuuGW0' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 127 'AdminGetClientsbyNamespacebyIDV3' test.out

#- 128 AdminDeleteClientV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientV3 \
    --clientId 'ojX1jZv7' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 128 'AdminDeleteClientV3' test.out

#- 129 AdminUpdateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientV3 \
    --clientId 'xAFuluJx' \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["kRwzAz9D", "QJZbEzjv", "Tut8VAf9"], "baseUri": "IZC1N5Zp", "clientName": "gc4SqSKG", "clientPermissions": [{"action": 23, "resource": "diISVrnW", "schedAction": 10, "schedCron": "cYfx7zFP", "schedRange": ["PEQZwk1q", "2vhSdmv4", "1QHcPTTe"]}, {"action": 9, "resource": "y39TBNCU", "schedAction": 59, "schedCron": "1iFLTRzE", "schedRange": ["LbIlZdQ2", "sGzZObpW", "pCPPlLHI"]}, {"action": 35, "resource": "f8FhCGwv", "schedAction": 24, "schedCron": "fvGUYS8f", "schedRange": ["3L7PAALc", "CU59octV", "MDqkTemS"]}], "clientPlatform": "nn5Jf59E", "deletable": true, "description": "6J6mwNww", "modulePermissions": [{"moduleId": "2kCTZ7ql", "selectedGroups": [{"groupId": "zMHLmvxk", "selectedActions": [11, 67, 55]}, {"groupId": "tEBNH60s", "selectedActions": [8, 5, 96]}, {"groupId": "83fUtjCm", "selectedActions": [62, 59, 84]}]}, {"moduleId": "mPOoJ75r", "selectedGroups": [{"groupId": "F8hMUqrD", "selectedActions": [8, 54, 43]}, {"groupId": "wGf2aeSd", "selectedActions": [53, 45, 0]}, {"groupId": "P04aUcZM", "selectedActions": [25, 36, 92]}]}, {"moduleId": "GkwV1kKA", "selectedGroups": [{"groupId": "8uHasjg2", "selectedActions": [1, 29, 45]}, {"groupId": "ik4PLeRY", "selectedActions": [41, 40, 41]}, {"groupId": "VU8uJ6V1", "selectedActions": [8, 17, 49]}]}], "namespace": "FLPxGICN", "oauthAccessTokenExpiration": 13, "oauthAccessTokenExpirationTimeUnit": "K3UGe7b2", "oauthRefreshTokenExpiration": 79, "oauthRefreshTokenExpirationTimeUnit": "pl3znwCo", "redirectUri": "Dfe99a3Z", "scopes": ["NFwA6gaZ", "bvty9OHM", "mcpongBW"], "skipLoginQueue": false, "twoFactorEnabled": true}' \
    > test.out 2>&1
eval_tap $? 129 'AdminUpdateClientV3' test.out

#- 130 AdminUpdateClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientPermissionV3 \
    --clientId 'OwfS5Z7j' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 90, "resource": "H025QftN"}, {"action": 40, "resource": "nWK7Ck8L"}, {"action": 38, "resource": "66OPQofk"}]}' \
    > test.out 2>&1
eval_tap $? 130 'AdminUpdateClientPermissionV3' test.out

#- 131 AdminAddClientPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddClientPermissionsV3 \
    --clientId 'nlj1JqTb' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 79, "resource": "gtL6mMIq"}, {"action": 0, "resource": "adpfYY6c"}, {"action": 32, "resource": "1MioBMfL"}]}' \
    > test.out 2>&1
eval_tap $? 131 'AdminAddClientPermissionsV3' test.out

#- 132 AdminDeleteClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientPermissionV3 \
    --action '48' \
    --clientId 'fXRwRVN1' \
    --namespace "$AB_NAMESPACE" \
    --resource 'S7smnaak' \
    > test.out 2>&1
eval_tap $? 132 'AdminDeleteClientPermissionV3' test.out

#- 133 AdminGetConfigValueV3
./ng net.accelbyte.sdk.cli.Main iam adminGetConfigValueV3 \
    --configKey 'RgX9cPqn' \
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
    --body '{"blacklist": ["XXLQxi7H", "Qyh8leOY", "IC4MbGX5"]}' \
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
    --limit '59' \
    --offset '26' \
    > test.out 2>&1
eval_tap $? 139 'RetrieveAllSSOLoginPlatformCredentialV3' test.out

#- 140 RetrieveThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'AP6QIG64' \
    > test.out 2>&1
eval_tap $? 140 'RetrieveThirdPartyLoginPlatformCredentialV3' test.out

#- 141 AddThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam addThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Xjlo9YvX' \
    --body '{"ACSURL": "8VKBRE1b", "AWSCognitoRegion": "Fg6Hdx1X", "AWSCognitoUserPool": "eZ4aqQTM", "AllowedClients": ["oxFKip0G", "oaxYbBc5", "ik56QkcM"], "AppId": "QY8Sfk4D", "AuthorizationEndpoint": "GIeisDmS", "ClientId": "5dcJKDwm", "Environment": "85DiTcLB", "FederationMetadataURL": "tw7XN3jP", "GenericOauthFlow": false, "IsActive": false, "Issuer": "7Y9D8Pf7", "JWKSEndpoint": "8qWJvVn2", "KeyID": "g2xDPpDG", "NetflixCertificates": {"encryptedPrivateKey": "RcKkM1oq", "encryptedPrivateKeyName": "RUHr53bt", "publicCertificate": "DQ1LziW4", "publicCertificateName": "KrspXxsl", "rootCertificate": "SDScNGKi", "rootCertificateName": "bHwCHSmZ"}, "OrganizationId": "mcVKqv7R", "PlatformName": "JZQuHFdH", "RedirectUri": "p8Rln8gY", "RegisteredDomains": [{"affectedClientIDs": ["T22sHr3S", "3znnDqzc", "fztEd5ya"], "domain": "aYBPACav", "namespaces": ["nuPUgNUx", "YrONrCK0", "SjCkZRle"], "roleId": "Rf7QO8Vy"}, {"affectedClientIDs": ["H0BcCfsU", "9CM1Kjdp", "zkabTgx0"], "domain": "sxi2gEfy", "namespaces": ["DaxQw7tV", "n9MNgXOZ", "c49QAD0g"], "roleId": "JoR9pSmH"}, {"affectedClientIDs": ["EeWLuFHj", "lqKKQAHp", "GlePKh5Q"], "domain": "Wfo0U7pF", "namespaces": ["wUBIMY1B", "39gUGSyl", "QlxvX66g"], "roleId": "LWL4qZ2K"}], "Secret": "xOqU66cV", "TeamID": "4kxAScgE", "TokenAuthenticationType": "du8zWgn3", "TokenClaimsMapping": {"LFSFjhjb": "465zhba6", "pqzEZs9Q": "W8H7gEKe", "O8s3ZPX3": "vxRLrIqs"}, "TokenEndpoint": "4lL5dubl", "UserInfoEndpoint": "ofoP30MZ", "UserInfoHTTPMethod": "UHREf0JO", "scopes": ["1hYc0BKy", "yvGoOV63", "9dfFutKk"]}' \
    > test.out 2>&1
eval_tap $? 141 'AddThirdPartyLoginPlatformCredentialV3' test.out

#- 142 DeleteThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'bTYOhU5Y' \
    > test.out 2>&1
eval_tap $? 142 'DeleteThirdPartyLoginPlatformCredentialV3' test.out

#- 143 UpdateThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'fH6MrfoH' \
    --body '{"ACSURL": "7yRDwAna", "AWSCognitoRegion": "UBGgLDCN", "AWSCognitoUserPool": "de0OWS2a", "AllowedClients": ["WtAXcGyb", "JZ6pmDMn", "7GnJyDPW"], "AppId": "At4nuRk3", "AuthorizationEndpoint": "NIAbhSNl", "ClientId": "40Lsxedi", "Environment": "exMQI05M", "FederationMetadataURL": "jfQJ1mnk", "GenericOauthFlow": false, "IsActive": true, "Issuer": "g6p5aNeN", "JWKSEndpoint": "GGWdqGOV", "KeyID": "XVbaZabT", "NetflixCertificates": {"encryptedPrivateKey": "2lrC7TCi", "encryptedPrivateKeyName": "gzW4d4db", "publicCertificate": "Wt69Avsx", "publicCertificateName": "QY0oh6wX", "rootCertificate": "a67QI5DN", "rootCertificateName": "BPIYcfy0"}, "OrganizationId": "9FAr9Ze6", "PlatformName": "xn2xXQNn", "RedirectUri": "HvuUQXWq", "RegisteredDomains": [{"affectedClientIDs": ["lEVs9g3g", "0qrwzWKP", "YPvtcoOv"], "domain": "BZhUvwMc", "namespaces": ["Z3mj8Vhb", "03ba2hLE", "JkV9XyPC"], "roleId": "2BhLehYM"}, {"affectedClientIDs": ["vuFNJRjm", "OnFO6Uw8", "7oGM0boO"], "domain": "pq68gcrK", "namespaces": ["1j9fpMFg", "2P1j4Zbh", "G27SQvNZ"], "roleId": "SHYPo10A"}, {"affectedClientIDs": ["rkT6qf60", "E1FxRKIX", "ZdX25C9j"], "domain": "CXI26hxa", "namespaces": ["GtZyj4cb", "jtgORyXa", "kiqPPjCE"], "roleId": "w0z74Yoy"}], "Secret": "SIYwLDfu", "TeamID": "kK8QJTvU", "TokenAuthenticationType": "dOk1ce1t", "TokenClaimsMapping": {"znfeQUhE": "BtREBSue", "Q0CsAFIg": "AQ78YEYh", "PjyaQI1M": "zP5ojuSC"}, "TokenEndpoint": "FuuWWhJf", "UserInfoEndpoint": "kAcLn33b", "UserInfoHTTPMethod": "E64W3LK4", "scopes": ["fLMcOhT9", "C754l1Fm", "ovhN5jQe"]}' \
    > test.out 2>&1
eval_tap $? 143 'UpdateThirdPartyLoginPlatformCredentialV3' test.out

#- 144 UpdateThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '7hCMpsWL' \
    --body '{"affectedClientIDs": ["sgaFuPga", "vD4aQyQV", "rmfQCMdh"], "assignedNamespaces": ["aGbovfd2", "Y3hEBGsp", "zm23u508"], "domain": "JI61lhM3", "roleId": "5FQN7M8A"}' \
    > test.out 2>&1
eval_tap $? 144 'UpdateThirdPartyLoginPlatformDomainV3' test.out

#- 145 DeleteThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'eosM2Xrt' \
    --body '{"domain": "7jB7hvgm"}' \
    > test.out 2>&1
eval_tap $? 145 'DeleteThirdPartyLoginPlatformDomainV3' test.out

#- 146 RetrieveSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam retrieveSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'hynj0RpI' \
    > test.out 2>&1
eval_tap $? 146 'RetrieveSSOLoginPlatformCredential' test.out

#- 147 AddSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam addSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId '50OTGq9P' \
    --body '{"acsUrl": "k7d99eV8", "apiKey": "SlHAqtm4", "appId": "h9Gxys73", "federationMetadataUrl": "Qd5REwvT", "isActive": false, "redirectUri": "YI02OoGJ", "secret": "suls5iAw", "ssoUrl": "CaYgyd8P"}' \
    > test.out 2>&1
eval_tap $? 147 'AddSSOLoginPlatformCredential' test.out

#- 148 DeleteSSOLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteSSOLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '7noqe2bv' \
    > test.out 2>&1
eval_tap $? 148 'DeleteSSOLoginPlatformCredentialV3' test.out

#- 149 UpdateSSOPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam updateSSOPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'mfOQK2ro' \
    --body '{"acsUrl": "HnHG7qdv", "apiKey": "afTdBqyX", "appId": "F7lnSmBY", "federationMetadataUrl": "Az4PpDgC", "isActive": true, "redirectUri": "5wToJvMv", "secret": "1P5oyg8c", "ssoUrl": "pJwarhSZ"}' \
    > test.out 2>&1
eval_tap $? 149 'UpdateSSOPlatformCredential' test.out

#- 150 AdminListUserIDByPlatformUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByPlatformUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'F3JsCRFR' \
    --rawPID  \
    --body '{"platformUserIds": ["fJVzX9Wo", "Um15VOlq", "Vyc3xfQk"]}' \
    > test.out 2>&1
eval_tap $? 150 'AdminListUserIDByPlatformUserIDsV3' test.out

#- 151 AdminGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'LDzqx4my' \
    --platformUserId 'G24YIrC6' \
    > test.out 2>&1
eval_tap $? 151 'AdminGetUserByPlatformUserIDV3' test.out

#- 152 GetAdminUsersByRoleIdV3
./ng net.accelbyte.sdk.cli.Main iam getAdminUsersByRoleIdV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'M3Z9qdSL' \
    --after '7' \
    --before '46' \
    --limit '76' \
    > test.out 2>&1
eval_tap $? 152 'GetAdminUsersByRoleIdV3' test.out

#- 153 AdminGetUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --emailAddress '90zrOpvb' \
    > test.out 2>&1
eval_tap $? 153 'AdminGetUserByEmailAddressV3' test.out

#- 154 AdminBulkUpdateUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"updateRequest": {"skipLoginQueue": false}, "userIds": ["SwZKiK5G", "dnjGvCI9", "UvRFnPth"]}' \
    > test.out 2>&1
eval_tap $? 154 'AdminBulkUpdateUsersV3' test.out

#- 155 AdminGetBulkUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType 'zIjtzGEa' \
    --body '{"bulkUserId": ["UUgydBvE", "VYOBk86Y", "iwzeE5H1"]}' \
    > test.out 2>&1
eval_tap $? 155 'AdminGetBulkUserBanV3' test.out

#- 156 AdminListUserIDByUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["HwbzUncc", "rXHOunXZ", "uN7Hy9IP"]}' \
    > test.out 2>&1
eval_tap $? 156 'AdminListUserIDByUserIDsV3' test.out

#- 157 AdminBulkGetUsersPlatform
./ng net.accelbyte.sdk.cli.Main iam adminBulkGetUsersPlatform \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["hH9elZsZ", "D0WwWRze", "gu9GJKrF"]}' \
    > test.out 2>&1
eval_tap $? 157 'AdminBulkGetUsersPlatform' test.out

#- 158 AdminInviteUserV3
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddresses": ["1EvnuBJ5", "RccrzNMW", "Azu5q131"], "isAdmin": true, "namespace": "45kUvXOR", "roles": ["vZ2AVbBB", "gjKyP1Q5", "rDdqIA3X"]}' \
    > test.out 2>&1
eval_tap $? 158 'AdminInviteUserV3' test.out

#- 159 AdminQueryThirdPlatformLinkHistoryV3
./ng net.accelbyte.sdk.cli.Main iam adminQueryThirdPlatformLinkHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '51' \
    --offset '59' \
    --platformUserId 'oHGbg393' \
    --platformId 'boIDbI3r' \
    > test.out 2>&1
eval_tap $? 159 'AdminQueryThirdPlatformLinkHistoryV3' test.out

#- 160 AdminListUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminListUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '85' \
    --offset '50' \
    > test.out 2>&1
eval_tap $? 160 'AdminListUsersV3' test.out

#- 161 AdminSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam adminSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'YgjKpefx' \
    --endDate 'XN2pqYd4' \
    --includeTotal  \
    --limit '70' \
    --offset '84' \
    --platformBy 'NDbxr8a1' \
    --platformId 'MWHqJAp6' \
    --query 'pNk4sDJ8' \
    --roleIds 'dr1kztrY' \
    --skipLoginQueue  \
    --startDate 'zqHSK5gy' \
    --testAccount  \
    > test.out 2>&1
eval_tap $? 161 'AdminSearchUserV3' test.out

#- 162 AdminGetBulkUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"listEmailAddressRequest": ["kRnoVLU1", "fJomm0Gy", "bjd4T9Pz"]}' \
    > test.out 2>&1
eval_tap $? 162 'AdminGetBulkUserByEmailAddressV3' test.out

#- 163 AdminGetUserByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '7y86Wm28' \
    > test.out 2>&1
eval_tap $? 163 'AdminGetUserByUserIdV3' test.out

#- 164 AdminUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'NHFt63lT' \
    --body '{"avatarUrl": "nNe23rvU", "country": "CJc8Z4oI", "dateOfBirth": "MJ5BnWoB", "displayName": "XfIT57EN", "languageTag": "uIYbYBmY", "skipLoginQueue": false, "uniqueDisplayName": "Qb009bO2", "userName": "qs1WQ8Yy"}' \
    > test.out 2>&1
eval_tap $? 164 'AdminUpdateUserV3' test.out

#- 165 AdminGetUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '7dmMfKIT' \
    --activeOnly  \
    --after '7qUGQwfq' \
    --before 'Db2xaCek' \
    --limit '64' \
    > test.out 2>&1
eval_tap $? 165 'AdminGetUserBanV3' test.out

#- 166 AdminBanUserV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'DNhDwgJF' \
    --body '{"ban": "SItxGXim", "comment": "Ah6CIruq", "endDate": "7h8TkO8r", "reason": "kz6DLaAV", "skipNotif": false}' \
    > test.out 2>&1
eval_tap $? 166 'AdminBanUserV3' test.out

#- 167 AdminUpdateUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserBanV3 \
    --banId 'bwx5ct94' \
    --namespace "$AB_NAMESPACE" \
    --userId 'IxVJ6skJ' \
    --body '{"enabled": true, "skipNotif": false}' \
    > test.out 2>&1
eval_tap $? 167 'AdminUpdateUserBanV3' test.out

#- 168 AdminSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'KAfP44mG' \
    --body '{"context": "0ZDt4Gzc", "emailAddress": "In9DxbUO", "languageTag": "tCrD4hhp"}' \
    > test.out 2>&1
eval_tap $? 168 'AdminSendVerificationCodeV3' test.out

#- 169 AdminVerifyAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ac0uVZI9' \
    --body '{"Code": "N3XOHYAc", "ContactType": "Xz5kUUdw", "LanguageTag": "wrzbmPpX", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 169 'AdminVerifyAccountV3' test.out

#- 170 GetUserVerificationCode
./ng net.accelbyte.sdk.cli.Main iam getUserVerificationCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'EFww4jY4' \
    > test.out 2>&1
eval_tap $? 170 'GetUserVerificationCode' test.out

#- 171 AdminGetUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'IOdbS2nJ' \
    > test.out 2>&1
eval_tap $? 171 'AdminGetUserDeletionStatusV3' test.out

#- 172 AdminUpdateUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'gndmtUPv' \
    --body '{"deletionDate": 86, "enabled": false}' \
    > test.out 2>&1
eval_tap $? 172 'AdminUpdateUserDeletionStatusV3' test.out

#- 173 AdminListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'NaIJK7Yt' \
    > test.out 2>&1
eval_tap $? 173 'AdminListUserAllPlatformAccountsDistinctV3' test.out

#- 174 AdminUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'aPC1XV3B' \
    --body '{"code": "btCPCfq2", "country": "5LtVHUiA", "dateOfBirth": "YUMaBUf5", "displayName": "JvJLOaY7", "emailAddress": "gjentsJm", "password": "dZIMj87W", "uniqueDisplayName": "wWmEw8pq", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 174 'AdminUpgradeHeadlessAccountV3' test.out

#- 175 AdminDeleteUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'miPaO0F7' \
    > test.out 2>&1
eval_tap $? 175 'AdminDeleteUserInformationV3' test.out

#- 176 AdminGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'iUhcYGvj' \
    --after '0.6836266309024299' \
    --before '0.47430638109465406' \
    --limit '11' \
    > test.out 2>&1
eval_tap $? 176 'AdminGetUserLoginHistoriesV3' test.out

#- 177 AdminResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam adminResetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '2M4h3ji6' \
    --body '{"languageTag": "xoFbeGoo", "newPassword": "bKIKJ4Zt", "oldPassword": "oe0LQWLN"}' \
    > test.out 2>&1
eval_tap $? 177 'AdminResetPasswordV3' test.out

#- 178 AdminUpdateUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserPermissionV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'C9ZVzsVh' \
    --body '{"Permissions": [{"Action": 81, "Resource": "EgDX1QZm", "SchedAction": 94, "SchedCron": "DWvXbvhN", "SchedRange": ["3wVBJpxt", "yWr853ht", "B5qrwOu9"]}, {"Action": 49, "Resource": "F3VIWw0A", "SchedAction": 26, "SchedCron": "aw117ca2", "SchedRange": ["WNLoS0Zg", "x2evVRYl", "c756fxxR"]}, {"Action": 92, "Resource": "eJHqcNKC", "SchedAction": 93, "SchedCron": "8l6IwuSg", "SchedRange": ["svphoiE2", "tTbmccUK", "QyKhrEyY"]}]}' \
    > test.out 2>&1
eval_tap $? 178 'AdminUpdateUserPermissionV3' test.out

#- 179 AdminAddUserPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserPermissionsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'NENWsCkV' \
    --body '{"Permissions": [{"Action": 10, "Resource": "yzLnEngr", "SchedAction": 75, "SchedCron": "NJuoGjut", "SchedRange": ["GNyq7cQ7", "TIP1t7av", "FgqyDl3L"]}, {"Action": 21, "Resource": "y9Q4JLRx", "SchedAction": 71, "SchedCron": "9ENBTeoZ", "SchedRange": ["GOundrDq", "yL2INKEM", "GjRApLO7"]}, {"Action": 84, "Resource": "1nUKlfzH", "SchedAction": 28, "SchedCron": "bR3cjmNl", "SchedRange": ["lcFdboO5", "X0pLbvaY", "OFsCUzuS"]}]}' \
    > test.out 2>&1
eval_tap $? 179 'AdminAddUserPermissionsV3' test.out

#- 180 AdminDeleteUserPermissionBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'YeqPZWt6' \
    --body '[{"Action": 32, "Resource": "SXkeAkMs"}, {"Action": 58, "Resource": "m8brvJZu"}, {"Action": 20, "Resource": "9Ihtlmrv"}]' \
    > test.out 2>&1
eval_tap $? 180 'AdminDeleteUserPermissionBulkV3' test.out

#- 181 AdminDeleteUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionV3 \
    --action '27' \
    --namespace "$AB_NAMESPACE" \
    --resource 'Ge6Luvaz' \
    --userId '7wXxvc2L' \
    > test.out 2>&1
eval_tap $? 181 'AdminDeleteUserPermissionV3' test.out

#- 182 AdminGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ukXGokx5' \
    --after 'YN6vOl9h' \
    --before 'DfxnZVEw' \
    --limit '1' \
    --platformId 'eVDtCOll' \
    > test.out 2>&1
eval_tap $? 182 'AdminGetUserPlatformAccountsV3' test.out

#- 183 AdminGetListJusticePlatformAccounts
./ng net.accelbyte.sdk.cli.Main iam adminGetListJusticePlatformAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'z4i4O5gZ' \
    > test.out 2>&1
eval_tap $? 183 'AdminGetListJusticePlatformAccounts' test.out

#- 184 AdminGetUserMapping
./ng net.accelbyte.sdk.cli.Main iam adminGetUserMapping \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'e1iruyQu' \
    --userId 'HrFRGp8M' \
    > test.out 2>&1
eval_tap $? 184 'AdminGetUserMapping' test.out

#- 185 AdminCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam adminCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace '6ZWRJ92z' \
    --userId 'Tpe6hEW7' \
    > test.out 2>&1
eval_tap $? 185 'AdminCreateJusticeUser' test.out

#- 186 AdminLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'AT3TqdwD' \
    --skipConflict  \
    --body '{"platformId": "UFy294C6", "platformUserId": "LNXSPsYf"}' \
    > test.out 2>&1
eval_tap $? 186 'AdminLinkPlatformAccount' test.out

#- 187 AdminPlatformUnlinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformUnlinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'ywqRnMlM' \
    --userId 'AvchDgFw' \
    --body '{"platformNamespace": "PYmvbSHH"}' \
    > test.out 2>&1
eval_tap $? 187 'AdminPlatformUnlinkV3' test.out

#- 188 AdminPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'oom5r0Hg' \
    --userId 'AW9dxfeO' \
    > test.out 2>&1
eval_tap $? 188 'AdminPlatformUnlinkAllV3' test.out

#- 189 AdminPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '73s8e7UO' \
    --userId 'b15J637p' \
    --ticket 'ubNDTM64' \
    > test.out 2>&1
eval_tap $? 189 'AdminPlatformLinkV3' test.out

#- 190 AdminDeleteUserLinkingHistoryByPlatformIDV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserLinkingHistoryByPlatformIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'yeVuKl42' \
    --userId 'NejbBsPh' \
    > test.out 2>&1
eval_tap $? 190 'AdminDeleteUserLinkingHistoryByPlatformIDV3' test.out

#- 191 AdminGetThirdPartyPlatformTokenLinkStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetThirdPartyPlatformTokenLinkStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'e3p1YH8z' \
    --userId '5kXC2wJr' \
    --platformToken '5VX00Qir' \
    > test.out 2>&1
eval_tap $? 191 'AdminGetThirdPartyPlatformTokenLinkStatusV3' test.out

#- 192 AdminGetUserSinglePlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminGetUserSinglePlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --platformId 'GnkkaJgw' \
    --userId 'doXzenBU' \
    > test.out 2>&1
eval_tap $? 192 'AdminGetUserSinglePlatformAccount' test.out

#- 193 AdminDeleteUserRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRolesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ltQskmTf' \
    --body '["0bAzjijd", "1zA8maZo", "sU5JON0r"]' \
    > test.out 2>&1
eval_tap $? 193 'AdminDeleteUserRolesV3' test.out

#- 194 AdminSaveUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminSaveUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'wNGmdLjg' \
    --body '[{"namespace": "ODW4NTWk", "roleId": "VLCxPeMy"}, {"namespace": "ijEFEpnw", "roleId": "Xmq5bTxP"}, {"namespace": "40WOLnmZ", "roleId": "2ILWaOBq"}]' \
    > test.out 2>&1
eval_tap $? 194 'AdminSaveUserRoleV3' test.out

#- 195 AdminAddUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'D8UzeB3Z' \
    --userId 'pphzW9YB' \
    > test.out 2>&1
eval_tap $? 195 'AdminAddUserRoleV3' test.out

#- 196 AdminDeleteUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId '2iY30PxU' \
    --userId 'O9vrslCn' \
    > test.out 2>&1
eval_tap $? 196 'AdminDeleteUserRoleV3' test.out

#- 197 AdminUpdateUserStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'e1SEzWtl' \
    --body '{"enabled": false, "reason": "R6l9x75q"}' \
    > test.out 2>&1
eval_tap $? 197 'AdminUpdateUserStatusV3' test.out

#- 198 AdminTrustlyUpdateUserIdentity
./ng net.accelbyte.sdk.cli.Main iam adminTrustlyUpdateUserIdentity \
    --namespace "$AB_NAMESPACE" \
    --userId 'KUrKbP2L' \
    --body '{"emailAddress": "Q5siCwcr", "password": "wL90Cmeo"}' \
    > test.out 2>&1
eval_tap $? 198 'AdminTrustlyUpdateUserIdentity' test.out

#- 199 AdminVerifyUserWithoutVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyUserWithoutVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'L4D6JNQK' \
    > test.out 2>&1
eval_tap $? 199 'AdminVerifyUserWithoutVerificationCodeV3' test.out

#- 200 AdminUpdateClientSecretV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientSecretV3 \
    --clientId 'jbeuLi0P' \
    --namespace "$AB_NAMESPACE" \
    --body '{"newSecret": "U0xYw6PI"}' \
    > test.out 2>&1
eval_tap $? 200 'AdminUpdateClientSecretV3' test.out

#- 201 AdminCheckThirdPartyLoginPlatformAvailabilityV3
./ng net.accelbyte.sdk.cli.Main iam adminCheckThirdPartyLoginPlatformAvailabilityV3 \
    --platformId 'ByFIyIsB' \
    > test.out 2>&1
eval_tap $? 201 'AdminCheckThirdPartyLoginPlatformAvailabilityV3' test.out

#- 202 AdminGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV3 \
    --after 'JgOs2FSj' \
    --before 'MOoj2EfU' \
    --isWildcard  \
    --limit '26' \
    > test.out 2>&1
eval_tap $? 202 'AdminGetRolesV3' test.out

#- 203 AdminCreateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV3 \
    --body '{"adminRole": false, "deletable": true, "isWildcard": false, "managers": [{"displayName": "WN8B5ybv", "namespace": "WlvoV8Hl", "userId": "I9gJTWB9"}, {"displayName": "C6U51DXl", "namespace": "aO53FInS", "userId": "GBZ6zR2c"}, {"displayName": "DGNo9iq3", "namespace": "0rtx3R3p", "userId": "DvnBmp7e"}], "members": [{"displayName": "yRLyo7qd", "namespace": "vboSI1H7", "userId": "7nZRMYsk"}, {"displayName": "JfCCW5YS", "namespace": "J3vTC3WV", "userId": "4VKlAiN6"}, {"displayName": "I5t3EBaT", "namespace": "4qFZwb7R", "userId": "uMPscJk7"}], "permissions": [{"action": 4, "resource": "S6H3HzUV", "schedAction": 57, "schedCron": "r9pNtFTV", "schedRange": ["hgAInRGA", "sknNK7ni", "fsgNf5W5"]}, {"action": 72, "resource": "g9Hiox6v", "schedAction": 80, "schedCron": "ERurQ3va", "schedRange": ["QC4M3elm", "xqU4RXJY", "WtrZAf3A"]}, {"action": 89, "resource": "thTlAu26", "schedAction": 51, "schedCron": "n1797jbP", "schedRange": ["GeRA1YUB", "u9wLZoY9", "G9Tm0d7V"]}], "roleName": "WHUSoEGU"}' \
    > test.out 2>&1
eval_tap $? 203 'AdminCreateRoleV3' test.out

#- 204 AdminGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV3 \
    --roleId '4VfChviJ' \
    > test.out 2>&1
eval_tap $? 204 'AdminGetRoleV3' test.out

#- 205 AdminDeleteRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV3 \
    --roleId 'pZhpsZPc' \
    > test.out 2>&1
eval_tap $? 205 'AdminDeleteRoleV3' test.out

#- 206 AdminUpdateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV3 \
    --roleId 'oTSjMaBp' \
    --body '{"deletable": false, "isWildcard": true, "roleName": "IYI0P9Lr"}' \
    > test.out 2>&1
eval_tap $? 206 'AdminUpdateRoleV3' test.out

#- 207 AdminGetRoleAdminStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleAdminStatusV3 \
    --roleId 'UVpsAQZD' \
    > test.out 2>&1
eval_tap $? 207 'AdminGetRoleAdminStatusV3' test.out

#- 208 AdminUpdateAdminRoleStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateAdminRoleStatusV3 \
    --roleId 'V2cU3tHA' \
    > test.out 2>&1
eval_tap $? 208 'AdminUpdateAdminRoleStatusV3' test.out

#- 209 AdminRemoveRoleAdminV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleAdminV3 \
    --roleId 'sSDK0wY3' \
    > test.out 2>&1
eval_tap $? 209 'AdminRemoveRoleAdminV3' test.out

#- 210 AdminGetRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleManagersV3 \
    --roleId 'RiU1mnDU' \
    --after 'zUYmZ39P' \
    --before 'tDMxLABg' \
    --limit '43' \
    > test.out 2>&1
eval_tap $? 210 'AdminGetRoleManagersV3' test.out

#- 211 AdminAddRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleManagersV3 \
    --roleId 'Kt2e3CNe' \
    --body '{"managers": [{"displayName": "ZVkOvDRN", "namespace": "r21J1gfn", "userId": "VqZzLMGJ"}, {"displayName": "9SFFMkWO", "namespace": "TfBEOrtT", "userId": "NxGX1hj7"}, {"displayName": "5xyCZR6h", "namespace": "cnDEedTM", "userId": "gR0qYqE0"}]}' \
    > test.out 2>&1
eval_tap $? 211 'AdminAddRoleManagersV3' test.out

#- 212 AdminRemoveRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleManagersV3 \
    --roleId 'CZx2YJ5u' \
    --body '{"managers": [{"displayName": "YbKOZfXL", "namespace": "ZtZFM6Dv", "userId": "igPHcnWT"}, {"displayName": "T6JHDsZD", "namespace": "YHNydVs7", "userId": "VGF6dSJt"}, {"displayName": "H22m1Gts", "namespace": "0n1zZ0LS", "userId": "TJtyoxXB"}]}' \
    > test.out 2>&1
eval_tap $? 212 'AdminRemoveRoleManagersV3' test.out

#- 213 AdminGetRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleMembersV3 \
    --roleId 'LJw877jj' \
    --after 'yRibIllJ' \
    --before 'QYNew4KV' \
    --limit '20' \
    > test.out 2>&1
eval_tap $? 213 'AdminGetRoleMembersV3' test.out

#- 214 AdminAddRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleMembersV3 \
    --roleId 'pBw1zlDP' \
    --body '{"members": [{"displayName": "j7HDeDRd", "namespace": "ylr7IAvm", "userId": "y29bMprW"}, {"displayName": "MvrNXStL", "namespace": "uSvo5B9w", "userId": "vcwF1E3k"}, {"displayName": "aZZCOFPb", "namespace": "s7qR0E3p", "userId": "ToEFCjGf"}]}' \
    > test.out 2>&1
eval_tap $? 214 'AdminAddRoleMembersV3' test.out

#- 215 AdminRemoveRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleMembersV3 \
    --roleId 'EIrT9Uv4' \
    --body '{"members": [{"displayName": "PFiaTJEI", "namespace": "8v9xR0OY", "userId": "KOtWqXlK"}, {"displayName": "vGwqdU3k", "namespace": "W8WZ6WJr", "userId": "rasSLVPy"}, {"displayName": "40giDyh9", "namespace": "RSN1kqDL", "userId": "S1PPDzYF"}]}' \
    > test.out 2>&1
eval_tap $? 215 'AdminRemoveRoleMembersV3' test.out

#- 216 AdminUpdateRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV3 \
    --roleId 'W4rruzc4' \
    --body '{"permissions": [{"action": 38, "resource": "aRGU3cSQ", "schedAction": 59, "schedCron": "nGU8o3cR", "schedRange": ["5ANIrfFM", "DPtNfnzf", "nfPW6DIm"]}, {"action": 7, "resource": "E4srW3xj", "schedAction": 82, "schedCron": "Ft8bCSjE", "schedRange": ["3YsSMwCR", "7vyCYPd8", "wzo8FmWo"]}, {"action": 10, "resource": "s1l3Eyzt", "schedAction": 56, "schedCron": "UV1TwVn2", "schedRange": ["1iWapHNX", "ZzqGk3jS", "D0mkssnV"]}]}' \
    > test.out 2>&1
eval_tap $? 216 'AdminUpdateRolePermissionsV3' test.out

#- 217 AdminAddRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV3 \
    --roleId '1G1xGBWq' \
    --body '{"permissions": [{"action": 90, "resource": "FXRS1Nm1", "schedAction": 19, "schedCron": "8MnisbtA", "schedRange": ["Sr5V7LU3", "k6KDcAN4", "fEbTK3zR"]}, {"action": 54, "resource": "G8r3HaIW", "schedAction": 44, "schedCron": "za3aKlFa", "schedRange": ["LTqRuTg6", "2ysFZJn0", "cats2dOn"]}, {"action": 88, "resource": "zHP8T3TM", "schedAction": 79, "schedCron": "ChbO2ID2", "schedRange": ["TcaZG8r9", "aIhBtKsP", "Q4fHWuYH"]}]}' \
    > test.out 2>&1
eval_tap $? 217 'AdminAddRolePermissionsV3' test.out

#- 218 AdminDeleteRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV3 \
    --roleId '8el242Op' \
    --body '["OBzk3xuw", "dRKUdLyH", "bhRWBNTZ"]' \
    > test.out 2>&1
eval_tap $? 218 'AdminDeleteRolePermissionsV3' test.out

#- 219 AdminDeleteRolePermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionV3 \
    --action '6' \
    --resource 'wuWb3Tjj' \
    --roleId 'BVSHsToc' \
    > test.out 2>&1
eval_tap $? 219 'AdminDeleteRolePermissionV3' test.out

#- 220 AdminGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam adminGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 220 'AdminGetMyUserV3' test.out

#- 221 UserAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam userAuthenticationV3 \
    --clientId 'pNPwHvsO' \
    --extendExp  \
    --redirectUri 'HPHwaVQK' \
    --password 'PwnJR4BX' \
    --requestId '03eAPAIJ' \
    --userName 'CEl3cylA' \
    > test.out 2>&1
eval_tap $? 221 'UserAuthenticationV3' test.out

#- 222 AuthenticationWithPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV3 \
    --extendExp  \
    --clientId '9xAJhQDf' \
    --linkingToken 'iiQwG6up' \
    --password 'JJ7SLURK' \
    --username 'xXhBpJpV' \
    > test.out 2>&1
eval_tap $? 222 'AuthenticationWithPlatformLinkV3' test.out

#- 223 GenerateTokenByNewHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV3 \
    --additionalData 'JypEKIO3' \
    --extendExp  \
    --linkingToken 'OvCn3v2i' \
    > test.out 2>&1
eval_tap $? 223 'GenerateTokenByNewHeadlessAccountV3' test.out

#- 224 RequestOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam requestOneTimeLinkingCodeV3 \
    --platformId 'nrUY28U3' \
    > test.out 2>&1
eval_tap $? 224 'RequestOneTimeLinkingCodeV3' test.out

#- 225 ValidateOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam validateOneTimeLinkingCodeV3 \
    --oneTimeLinkCode 'dRnAi1Xi' \
    > test.out 2>&1
eval_tap $? 225 'ValidateOneTimeLinkingCodeV3' test.out

#- 226 RequestTokenByOneTimeLinkCodeResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTokenByOneTimeLinkCodeResponseV3 \
    --additionalData 'jivDEb1p' \
    --isTransient  \
    --clientId 'rwQRwkjt' \
    --oneTimeLinkCode 'oHKRVNhl' \
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
    --codeChallenge 'RZdyx4YC' \
    --codeChallengeMethod 'plain' \
    --clientId 'F2kwtYKq' \
    > test.out 2>&1
eval_tap $? 229 'RequestTokenExchangeCodeV3' test.out

#- 230 AdminRetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam adminRetrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'M7XXP3hN' \
    --userId '7Ikkwpkh' \
    --platformUserId 'AONFILQj' \
    > test.out 2>&1
eval_tap $? 230 'AdminRetrieveUserThirdPartyPlatformTokenV3' test.out

#- 231 RevokeUserV3
./ng net.accelbyte.sdk.cli.Main iam revokeUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Xiyo93HJ' \
    --includeGameNamespace  \
    > test.out 2>&1
eval_tap $? 231 'RevokeUserV3' test.out

#- 232 AuthorizeV3
./ng net.accelbyte.sdk.cli.Main iam authorizeV3 \
    --codeChallenge 'c2A6Smr4' \
    --codeChallengeMethod 'plain' \
    --createHeadless  \
    --oneTimeLinkCode 'zsOclpqE' \
    --redirectUri 'cXxwEZ9R' \
    --scope 'Rg2S30DU' \
    --state 'HgUflwc8' \
    --targetAuthPage 'KCan2hKk' \
    --useRedirectUriAsLoginUrlWhenLocked  \
    --clientId 'WoGOJUyg' \
    --responseType 'code' \
    > test.out 2>&1
eval_tap $? 232 'AuthorizeV3' test.out

#- 233 TokenIntrospectionV3
./ng net.accelbyte.sdk.cli.Main iam tokenIntrospectionV3 \
    --token '6qtET9cw' \
    > test.out 2>&1
eval_tap $? 233 'TokenIntrospectionV3' test.out

#- 234 GetJWKSV3
./ng net.accelbyte.sdk.cli.Main iam getJWKSV3 \
    > test.out 2>&1
eval_tap $? 234 'GetJWKSV3' test.out

#- 235 SendMFAAuthenticationCode
./ng net.accelbyte.sdk.cli.Main iam sendMFAAuthenticationCode \
    --clientId 'cWufOJWv' \
    --factor 'fVsxx8Nk' \
    --mfaToken 'ofGMfeFN' \
    > test.out 2>&1
eval_tap $? 235 'SendMFAAuthenticationCode' test.out

#- 236 Change2faMethod
./ng net.accelbyte.sdk.cli.Main iam change2faMethod \
    --factor '5Kyr72vh' \
    --mfaToken 'wKlaMYij' \
    > test.out 2>&1
eval_tap $? 236 'Change2faMethod' test.out

#- 237 Verify2faCode
./ng net.accelbyte.sdk.cli.Main iam verify2faCode \
    --code '20uvPm8Q' \
    --factor 'i3ylia8X' \
    --mfaToken 'CTct75yy' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 237 'Verify2faCode' test.out

#- 238 RetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam retrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'U1bEwvup' \
    --userId 'aIK3ksne' \
    > test.out 2>&1
eval_tap $? 238 'RetrieveUserThirdPartyPlatformTokenV3' test.out

#- 239 AuthCodeRequestV3
./ng net.accelbyte.sdk.cli.Main iam authCodeRequestV3 \
    --platformId 'mWGYgE7q' \
    --clientId '1wvbATZt' \
    --redirectUri '3owmuUdR' \
    --requestId 'ES2wNqEw' \
    > test.out 2>&1
eval_tap $? 239 'AuthCodeRequestV3' test.out

#- 240 PlatformTokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV3 \
    --platformId 'OAK6ivV9' \
    --additionalData 'pwJubxTz' \
    --clientId 'Tc0FfQCa' \
    --createHeadless  \
    --deviceId 'uFP8u2x3' \
    --macAddress 'bEG5RnRP' \
    --platformToken 'HUjtn2zV' \
    --skipSetCookie  \
    > test.out 2>&1
eval_tap $? 240 'PlatformTokenGrantV3' test.out

#- 241 GetRevocationListV3
./ng net.accelbyte.sdk.cli.Main iam getRevocationListV3 \
    > test.out 2>&1
eval_tap $? 241 'GetRevocationListV3' test.out

#- 242 TokenRevocationV3
./ng net.accelbyte.sdk.cli.Main iam tokenRevocationV3 \
    --token 'NWbFQZ2P' \
    > test.out 2>&1
eval_tap $? 242 'TokenRevocationV3' test.out

#- 243 SimultaneousLoginV3
./ng net.accelbyte.sdk.cli.Main iam simultaneousLoginV3 \
    --simultaneousPlatform 'yV0EqbMb' \
    --simultaneousTicket 'W7FuTkgY' \
    --nativePlatform 'epicgames' \
    --nativePlatformTicket 'tlZTgwYw' \
    > test.out 2>&1
eval_tap $? 243 'SimultaneousLoginV3' test.out

#- 244 TokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV3 \
    --additionalData 'Rfmu9UC4' \
    --clientId 'Ig5REfjV' \
    --code 'BY9oKKES' \
    --codeVerifier '5OWoyLaf' \
    --extendNamespace 'KoOZ03Yl' \
    --extendExp  \
    --password 'Af9n09sv' \
    --redirectUri 'FCS7XV9u' \
    --refreshToken 'FEL3uBlA' \
    --username 'P2IVGIGT' \
    --grantType 'client_credentials' \
    > test.out 2>&1
eval_tap $? 244 'TokenGrantV3' test.out

#- 245 VerifyTokenV3
./ng net.accelbyte.sdk.cli.Main iam verifyTokenV3 \
    --token 'G63yA1Gl' \
    > test.out 2>&1
eval_tap $? 245 'VerifyTokenV3' test.out

#- 246 PlatformAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticationV3 \
    --platformId 'C1e7Pio2' \
    --code 'mEdz3iY5' \
    --error 'h0wPnOuN' \
    --openidAssocHandle '4USbcKkJ' \
    --openidClaimedId 'Ut9g0tlb' \
    --openidIdentity 'IMYC7MwL' \
    --openidMode 'KCkRbshl' \
    --openidNs 'p6tulOeT' \
    --openidOpEndpoint 'p1oCLQNf' \
    --openidResponseNonce 'nJaOGqWb' \
    --openidReturnTo 'z4HxNYny' \
    --openidSig 'PMhU8iaa' \
    --openidSigned 'OyAhez8k' \
    --state 'oj2wiHt5' \
    > test.out 2>&1
eval_tap $? 246 'PlatformAuthenticationV3' test.out

#- 247 PlatformTokenRefreshV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenRefreshV3 \
    --platformId 'xEpVxaVJ' \
    --platformToken 'K4bjzWeh' \
    > test.out 2>&1
eval_tap $? 247 'PlatformTokenRefreshV3' test.out

#- 248 PublicGetInputValidations
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidations \
    --defaultOnEmpty  \
    --languageCode 'oSoCx2Fo' \
    > test.out 2>&1
eval_tap $? 248 'PublicGetInputValidations' test.out

#- 249 PublicGetInputValidationByField
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidationByField \
    --field 'p06J3W7P' \
    > test.out 2>&1
eval_tap $? 249 'PublicGetInputValidationByField' test.out

#- 250 PublicGetCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam publicGetCountryAgeRestrictionV3 \
    --countryCode '2GncZvWD' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 250 'PublicGetCountryAgeRestrictionV3' test.out

#- 251 PublicGetConfigValueV3
./ng net.accelbyte.sdk.cli.Main iam publicGetConfigValueV3 \
    --configKey '15B9cEh0' \
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
    --clientId 'JnRgyK6N' \
    > test.out 2>&1
eval_tap $? 254 'RetrieveActiveOIDCClientsPublicV3' test.out

#- 255 PublicListUserIDByPlatformUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserIDByPlatformUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'rkFhUAK9' \
    --rawPID  \
    --body '{"platformUserIds": ["6v5kBv1A", "mNXJ7X5L", "JuhhVvJd"]}' \
    > test.out 2>&1
eval_tap $? 255 'PublicListUserIDByPlatformUserIDsV3' test.out

#- 256 PublicGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'W81y3g1e' \
    --platformUserId 'XnpN9fku' \
    > test.out 2>&1
eval_tap $? 256 'PublicGetUserByPlatformUserIDV3' test.out

#- 257 PublicGetAsyncStatus
./ng net.accelbyte.sdk.cli.Main iam publicGetAsyncStatus \
    --namespace "$AB_NAMESPACE" \
    --requestId 'EMNhAsiL' \
    > test.out 2>&1
eval_tap $? 257 'PublicGetAsyncStatus' test.out

#- 258 PublicSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam publicSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'a3SCac09' \
    --limit '18' \
    --offset '13' \
    --platformBy '24vFGVoq' \
    --platformId '1RGtH1jV' \
    --query 'OEUA1EjN' \
    > test.out 2>&1
eval_tap $? 258 'PublicSearchUserV3' test.out

#- 259 PublicCreateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "0qwl67Gw", "acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "WVbVlZTN", "policyId": "ksfXphVw", "policyVersionId": "xMDPkEwC"}, {"isAccepted": true, "localizedPolicyVersionId": "xy43nckf", "policyId": "kJNOzP64", "policyVersionId": "iyqHJuBm"}, {"isAccepted": false, "localizedPolicyVersionId": "y6a7J129", "policyId": "kOjYuOLg", "policyVersionId": "cH8BxRRV"}], "authType": "ykmtaNCm", "code": "ZauNLWhH", "country": "5TcoNfn5", "dateOfBirth": "48VGBGWA", "displayName": "laHjtcGr", "emailAddress": "ybSfkHhD", "password": "oe2JfwBE", "reachMinimumAge": false, "uniqueDisplayName": "M86hj2FT"}' \
    > test.out 2>&1
eval_tap $? 259 'PublicCreateUserV3' test.out

#- 260 CheckUserAvailability
./ng net.accelbyte.sdk.cli.Main iam checkUserAvailability \
    --namespace "$AB_NAMESPACE" \
    --field 'znDXLv52' \
    --query 'zsPkCy73' \
    > test.out 2>&1
eval_tap $? 260 'CheckUserAvailability' test.out

#- 261 PublicBulkGetUsers
./ng net.accelbyte.sdk.cli.Main iam publicBulkGetUsers \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["v9wc22ND", "I3cflrao", "fhOEiGqF"]}' \
    > test.out 2>&1
eval_tap $? 261 'PublicBulkGetUsers' test.out

#- 262 PublicSendRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicSendRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "DrWtHVjY", "languageTag": "MmXGWPu5"}' \
    > test.out 2>&1
eval_tap $? 262 'PublicSendRegistrationCode' test.out

#- 263 PublicVerifyRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicVerifyRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "e631rpd0", "emailAddress": "bEGIWaxW"}' \
    > test.out 2>&1
eval_tap $? 263 'PublicVerifyRegistrationCode' test.out

#- 264 PublicForgotPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicForgotPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "qx3wviTl", "languageTag": "bV8dg74f"}' \
    > test.out 2>&1
eval_tap $? 264 'PublicForgotPasswordV3' test.out

#- 265 GetAdminInvitationV3
./ng net.accelbyte.sdk.cli.Main iam getAdminInvitationV3 \
    --invitationId 'XbsT0RKk' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 265 'GetAdminInvitationV3' test.out

#- 266 CreateUserFromInvitationV3
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV3 \
    --invitationId 'mTuUbG2U' \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "3vVVzYOW", "acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "NCRKrIIs", "policyId": "Wh0apkUG", "policyVersionId": "46rvVpw3"}, {"isAccepted": true, "localizedPolicyVersionId": "bEA79oRV", "policyId": "FYadLXsg", "policyVersionId": "mFUn92wO"}, {"isAccepted": true, "localizedPolicyVersionId": "Q98heIt0", "policyId": "PRgk2jvn", "policyVersionId": "WaXHN6Uk"}], "authType": "jXLBkNj4", "code": "BAR8eLeg", "country": "JdhLipJk", "dateOfBirth": "EetK9kOC", "displayName": "N36p4uCi", "emailAddress": "BluUxan2", "password": "lmaeDpwh", "reachMinimumAge": true, "uniqueDisplayName": "MHnBTgBp"}' \
    > test.out 2>&1
eval_tap $? 266 'CreateUserFromInvitationV3' test.out

#- 267 UpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam updateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "I9sza9rX", "country": "nFWjRpoM", "dateOfBirth": "rmduGPPy", "displayName": "0E7PBnmd", "languageTag": "caznDZvU", "uniqueDisplayName": "bd8Py80P", "userName": "WQflaD0d"}' \
    > test.out 2>&1
eval_tap $? 267 'UpdateUserV3' test.out

#- 268 PublicPartialUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicPartialUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "AKQkk30z", "country": "cKKOl0O4", "dateOfBirth": "2c8se0rz", "displayName": "33x7pQDs", "languageTag": "O4dtPbhH", "uniqueDisplayName": "a8uk9tq6", "userName": "RHICUkPb"}' \
    > test.out 2>&1
eval_tap $? 268 'PublicPartialUpdateUserV3' test.out

#- 269 PublicSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"context": "RHOMEuAa", "emailAddress": "JoiRAAcy", "languageTag": "99lPPPJ5"}' \
    > test.out 2>&1
eval_tap $? 269 'PublicSendVerificationCodeV3' test.out

#- 270 PublicUserVerificationV3
./ng net.accelbyte.sdk.cli.Main iam publicUserVerificationV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "JzGIqV1X", "contactType": "YEV4p2CX", "languageTag": "mVtBS5rp", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 270 'PublicUserVerificationV3' test.out

#- 271 PublicUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "66IhS5Uk", "country": "mhp37XKi", "dateOfBirth": "h7bGKna6", "displayName": "3bQn8UcI", "emailAddress": "Oaj74XhJ", "password": "Asg8PZz2", "uniqueDisplayName": "2E8lUqWx", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 271 'PublicUpgradeHeadlessAccountV3' test.out

#- 272 PublicVerifyHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --needVerificationCode  \
    --body '{"emailAddress": "fkikgdBm", "password": "a0Y6GGq0"}' \
    > test.out 2>&1
eval_tap $? 272 'PublicVerifyHeadlessAccountV3' test.out

#- 273 PublicUpdatePasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicUpdatePasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"languageTag": "p8T5o0c8", "newPassword": "nS2Miy8j", "oldPassword": "fPgubCUV"}' \
    > test.out 2>&1
eval_tap $? 273 'PublicUpdatePasswordV3' test.out

#- 274 PublicCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam publicCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'IxJf1V8J' \
    > test.out 2>&1
eval_tap $? 274 'PublicCreateJusticeUser' test.out

#- 275 PublicPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'XSUAt1uH' \
    --redirectUri 'gjaWqDbv' \
    --ticket 'EbWcJRWf' \
    > test.out 2>&1
eval_tap $? 275 'PublicPlatformLinkV3' test.out

#- 276 PublicPlatformUnlinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Ermc3WSo' \
    --body '{"platformNamespace": "CR444j6M"}' \
    > test.out 2>&1
eval_tap $? 276 'PublicPlatformUnlinkV3' test.out

#- 277 PublicPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'bw9cK7q5' \
    > test.out 2>&1
eval_tap $? 277 'PublicPlatformUnlinkAllV3' test.out

#- 278 PublicForcePlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicForcePlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '84s2gZCe' \
    --ticket 's5FOfedL' \
    > test.out 2>&1
eval_tap $? 278 'PublicForcePlatformLinkV3' test.out

#- 279 PublicWebLinkPlatform
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatform \
    --namespace "$AB_NAMESPACE" \
    --platformId 'SDdPtRNQ' \
    --clientId 'zfTiBIeV' \
    --redirectUri 'lvzwQ4Sj' \
    > test.out 2>&1
eval_tap $? 279 'PublicWebLinkPlatform' test.out

#- 280 PublicWebLinkPlatformEstablish
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatformEstablish \
    --namespace "$AB_NAMESPACE" \
    --platformId 'qAG6ATaf' \
    --code 'jyf6XEsu' \
    --state 'LAPFO1Qt' \
    > test.out 2>&1
eval_tap $? 280 'PublicWebLinkPlatformEstablish' test.out

#- 281 PublicProcessWebLinkPlatformV3
./ng net.accelbyte.sdk.cli.Main iam publicProcessWebLinkPlatformV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'TMvLZS3n' \
    --code '1nNw2wQo' \
    --state 'uBXINark' \
    > test.out 2>&1
eval_tap $? 281 'PublicProcessWebLinkPlatformV3' test.out

#- 282 PublicGetUsersPlatformInfosV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUsersPlatformInfosV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"platformId": "CW56OHqX", "userIds": ["P70I8uwB", "LKm4jZc3", "3sTVCzBC"]}' \
    > test.out 2>&1
eval_tap $? 282 'PublicGetUsersPlatformInfosV3' test.out

#- 283 ResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam resetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "dxJCC4BF", "emailAddress": "J79eMoyO", "newPassword": "7mOmhqIP"}' \
    > test.out 2>&1
eval_tap $? 283 'ResetPasswordV3' test.out

#- 284 PublicGetUserByUserIdV3
eval_tap 0 284 'PublicGetUserByUserIdV3 # SKIP deprecated' test.out

#- 285 PublicGetUserBanHistoryV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserBanHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'D8RkgouI' \
    --activeOnly  \
    --after 'GQLiRhDE' \
    --before 'UB1y5zeH' \
    --limit '65' \
    > test.out 2>&1
eval_tap $? 285 'PublicGetUserBanHistoryV3' test.out

#- 286 PublicListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'maqzcamn' \
    > test.out 2>&1
eval_tap $? 286 'PublicListUserAllPlatformAccountsDistinctV3' test.out

#- 287 PublicGetUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Oe4noExj' \
    > test.out 2>&1
eval_tap $? 287 'PublicGetUserInformationV3' test.out

#- 288 PublicGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'RsUo7l6v' \
    --after '0.2447824312375808' \
    --before '0.13821373321579467' \
    --limit '2' \
    > test.out 2>&1
eval_tap $? 288 'PublicGetUserLoginHistoriesV3' test.out

#- 289 PublicGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'lSQaq4M3' \
    --after '0FPVQYkX' \
    --before 'KOTh5OyN' \
    --limit '15' \
    --platformId 'dsjmOBuN' \
    > test.out 2>&1
eval_tap $? 289 'PublicGetUserPlatformAccountsV3' test.out

#- 290 PublicListJusticePlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicListJusticePlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '6z8j0eQS' \
    > test.out 2>&1
eval_tap $? 290 'PublicListJusticePlatformAccountsV3' test.out

#- 291 PublicLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam publicLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'EYVrxhzq' \
    --body '{"platformId": "gubGTVH6", "platformUserId": "56YGsflk"}' \
    > test.out 2>&1
eval_tap $? 291 'PublicLinkPlatformAccount' test.out

#- 292 PublicForceLinkPlatformWithProgression
./ng net.accelbyte.sdk.cli.Main iam publicForceLinkPlatformWithProgression \
    --namespace "$AB_NAMESPACE" \
    --userId 'vGvoeJvK' \
    --body '{"chosenNamespaces": ["DqegavlD", "If7bd8Cg", "DilcLRuP"], "requestId": "mCFwTQXl"}' \
    > test.out 2>&1
eval_tap $? 292 'PublicForceLinkPlatformWithProgression' test.out

#- 293 PublicGetPublisherUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetPublisherUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'iyWF8Hg4' \
    > test.out 2>&1
eval_tap $? 293 'PublicGetPublisherUserV3' test.out

#- 294 PublicValidateUserByUserIDAndPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserByUserIDAndPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '6CYwdb8m' \
    --password 'yYfDIjfn' \
    > test.out 2>&1
eval_tap $? 294 'PublicValidateUserByUserIDAndPasswordV3' test.out

#- 295 PublicGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRolesV3 \
    --after 'zleZjCD1' \
    --before 'D5zcUNPJ' \
    --isWildcard  \
    --limit '99' \
    > test.out 2>&1
eval_tap $? 295 'PublicGetRolesV3' test.out

#- 296 PublicGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRoleV3 \
    --roleId 'GqMjDaro' \
    > test.out 2>&1
eval_tap $? 296 'PublicGetRoleV3' test.out

#- 297 PublicGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyUserV3 \
    --includeAllPlatforms  \
    > test.out 2>&1
eval_tap $? 297 'PublicGetMyUserV3' test.out

#- 298 PublicGetLinkHeadlessAccountToMyAccountConflictV3
./ng net.accelbyte.sdk.cli.Main iam publicGetLinkHeadlessAccountToMyAccountConflictV3 \
    --oneTimeLinkCode 'iyVZyUX8' \
    > test.out 2>&1
eval_tap $? 298 'PublicGetLinkHeadlessAccountToMyAccountConflictV3' test.out

#- 299 LinkHeadlessAccountToMyAccountV3
./ng net.accelbyte.sdk.cli.Main iam linkHeadlessAccountToMyAccountV3 \
    --body '{"chosenNamespaces": ["jo0WjNL1", "riDJORrP", "cPABOmGj"], "oneTimeLinkCode": "NmVAEY0s"}' \
    > test.out 2>&1
eval_tap $? 299 'LinkHeadlessAccountToMyAccountV3' test.out

#- 300 PublicSendVerificationLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationLinkV3 \
    --body '{"languageTag": "qWbt1SI0"}' \
    > test.out 2>&1
eval_tap $? 300 'PublicSendVerificationLinkV3' test.out

#- 301 PublicVerifyUserByLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyUserByLinkV3 \
    --code 'GJyQmW1P' \
    > test.out 2>&1
eval_tap $? 301 'PublicVerifyUserByLinkV3' test.out

#- 302 PlatformAuthenticateSAMLV3Handler
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticateSAMLV3Handler \
    --platformId 'vSeMfZci' \
    --code 'STRUjM7t' \
    --error 'WJyN5Ba0' \
    --state 'Q0eUtAKL' \
    > test.out 2>&1
eval_tap $? 302 'PlatformAuthenticateSAMLV3Handler' test.out

#- 303 LoginSSOClient
./ng net.accelbyte.sdk.cli.Main iam loginSSOClient \
    --platformId 'C971HlGP' \
    --payload 'EelASCrV' \
    > test.out 2>&1
eval_tap $? 303 'LoginSSOClient' test.out

#- 304 LogoutSSOClient
./ng net.accelbyte.sdk.cli.Main iam logoutSSOClient \
    --platformId 'SD3Dns6P' \
    > test.out 2>&1
eval_tap $? 304 'LogoutSSOClient' test.out

#- 305 RequestTargetTokenResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTargetTokenResponseV3 \
    --additionalData 'qiasVVfV' \
    --code 'vSqhpUVP' \
    > test.out 2>&1
eval_tap $? 305 'RequestTargetTokenResponseV3' test.out

#- 306 AdminListInvitationHistoriesV4
./ng net.accelbyte.sdk.cli.Main iam adminListInvitationHistoriesV4 \
    --limit '27' \
    --namespace "$AB_NAMESPACE" \
    --offset '27' \
    > test.out 2>&1
eval_tap $? 306 'AdminListInvitationHistoriesV4' test.out

#- 307 AdminGetDevicesByUserV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDevicesByUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '0TRLQ89W' \
    > test.out 2>&1
eval_tap $? 307 'AdminGetDevicesByUserV4' test.out

#- 308 AdminGetBannedDevicesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedDevicesV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceType 'hvrDyzP6' \
    --endDate 'RnQgINQ4' \
    --limit '72' \
    --offset '67' \
    --startDate 'UPllVAM6' \
    > test.out 2>&1
eval_tap $? 308 'AdminGetBannedDevicesV4' test.out

#- 309 AdminGetUserDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeviceBansV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'OLLrRKw4' \
    > test.out 2>&1
eval_tap $? 309 'AdminGetUserDeviceBansV4' test.out

#- 310 AdminBanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminBanDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"comment": "xtM2e00p", "deviceId": "R40ufzpC", "deviceType": "vpXVjhy6", "enabled": false, "endDate": "fMueJzbX", "ext": {"n3Pa3Gas": {}, "c4l6otPU": {}, "NJ2Mef1J": {}}, "reason": "stwyi3qz"}' \
    > test.out 2>&1
eval_tap $? 310 'AdminBanDeviceV4' test.out

#- 311 AdminGetDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBanV4 \
    --banId '6SJ6VeTQ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 311 'AdminGetDeviceBanV4' test.out

#- 312 AdminUpdateDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateDeviceBanV4 \
    --banId 'MXaEJngP' \
    --namespace "$AB_NAMESPACE" \
    --body '{"enabled": true}' \
    > test.out 2>&1
eval_tap $? 312 'AdminUpdateDeviceBanV4' test.out

#- 313 AdminGenerateReportV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateReportV4 \
    --namespace "$AB_NAMESPACE" \
    --endDate 'pdiB7GbH' \
    --startDate 'hsSMir79' \
    --deviceType 'XrQzc0tu' \
    > test.out 2>&1
eval_tap $? 313 'AdminGenerateReportV4' test.out

#- 314 AdminGetDeviceTypesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceTypesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 314 'AdminGetDeviceTypesV4' test.out

#- 315 AdminGetDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBansV4 \
    --deviceId 'gqSLlRSe' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 315 'AdminGetDeviceBansV4' test.out

#- 316 AdminDecryptDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminDecryptDeviceV4 \
    --deviceId 'cGrBS3zQ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 316 'AdminDecryptDeviceV4' test.out

#- 317 AdminUnbanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminUnbanDeviceV4 \
    --deviceId 'qdUurFPI' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 317 'AdminUnbanDeviceV4' test.out

#- 318 AdminGetUsersByDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUsersByDeviceV4 \
    --deviceId 'gf2HtwuU' \
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
    --limit '2' \
    --offset '74' \
    > test.out 2>&1
eval_tap $? 320 'AdminGetNamespaceUserInvitationHistoryV4' test.out

#- 321 AdminCreateTestUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateTestUsersV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 66}' \
    > test.out 2>&1
eval_tap $? 321 'AdminCreateTestUsersV4' test.out

#- 322 AdminCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "RGZ9l3vW", "policyId": "fUKP4VgO", "policyVersionId": "wZ20CUN3"}, {"isAccepted": true, "localizedPolicyVersionId": "T5GYUslP", "policyId": "09SXYhxV", "policyVersionId": "2JRmBSuf"}, {"isAccepted": true, "localizedPolicyVersionId": "z0MjON5I", "policyId": "9RybB53j", "policyVersionId": "krhypLU2"}], "authType": "EMAILPASSWD", "code": "7uSDadRt", "country": "cA4x7MMA", "dateOfBirth": "zG23MYcM", "displayName": "nOsPTKcL", "emailAddress": "TZpNBCOa", "password": "DyRTPcuC", "passwordMD5Sum": "Ga4weRh2", "reachMinimumAge": true, "uniqueDisplayName": "PKzJbrUV", "username": "DzuSmnqF"}' \
    > test.out 2>&1
eval_tap $? 322 'AdminCreateUserV4' test.out

#- 323 AdminBulkUpdateUserAccountTypeV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateUserAccountTypeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"testAccount": false, "userIds": ["2Hz0E5CP", "vpfKhP7Q", "q93v0Ft7"]}' \
    > test.out 2>&1
eval_tap $? 323 'AdminBulkUpdateUserAccountTypeV4' test.out

#- 324 AdminBulkCheckValidUserIDV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkCheckValidUserIDV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["YzrOOKR4", "O5RIxVqY", "cNuzAOcF"]}' \
    > test.out 2>&1
eval_tap $? 324 'AdminBulkCheckValidUserIDV4' test.out

#- 325 AdminUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'p2DEpEuV' \
    --body '{"avatarUrl": "WPNlyspm", "country": "rKgJHEUK", "dateOfBirth": "m6bZwxOr", "displayName": "b94hR5sl", "languageTag": "rtSCcagM", "skipLoginQueue": true, "uniqueDisplayName": "HdU6iarZ", "userName": "ph13aWvE"}' \
    > test.out 2>&1
eval_tap $? 325 'AdminUpdateUserV4' test.out

#- 326 AdminUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Tb1Rl6mf' \
    --body '{"code": "Pdbt09ls", "emailAddress": "jE7YMfO9"}' \
    > test.out 2>&1
eval_tap $? 326 'AdminUpdateUserEmailAddressV4' test.out

#- 327 AdminDisableUserMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableUserMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '7BQIZgNt' \
    > test.out 2>&1
eval_tap $? 327 'AdminDisableUserMFAV4' test.out

#- 328 AdminListUserRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminListUserRolesV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'O3HBJuLf' \
    > test.out 2>&1
eval_tap $? 328 'AdminListUserRolesV4' test.out

#- 329 AdminUpdateUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'N8QMUCeE' \
    --body '{"assignedNamespaces": ["GUmdYekS", "F4HFpC1l", "3zm3BUS7"], "roleId": "8WjaMSAA"}' \
    > test.out 2>&1
eval_tap $? 329 'AdminUpdateUserRoleV4' test.out

#- 330 AdminAddUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'as5srLzv' \
    --body '{"assignedNamespaces": ["KIdujret", "m81M2wSD", "wo0ycYNO"], "roleId": "Tl1fGkA7"}' \
    > test.out 2>&1
eval_tap $? 330 'AdminAddUserRoleV4' test.out

#- 331 AdminRemoveUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRemoveUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'NMMZkbLX' \
    --body '{"assignedNamespaces": ["CRtEK61B", "tQopQy9j", "UelqxVdl"], "roleId": "yGnx4BMw"}' \
    > test.out 2>&1
eval_tap $? 331 'AdminRemoveUserRoleV4' test.out

#- 332 AdminGetRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV4 \
    --adminRole  \
    --isWildcard  \
    --limit '95' \
    --offset '19' \
    > test.out 2>&1
eval_tap $? 332 'AdminGetRolesV4' test.out

#- 333 AdminCreateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV4 \
    --body '{"adminRole": true, "deletable": false, "isWildcard": true, "roleName": "EWv0u4S0"}' \
    > test.out 2>&1
eval_tap $? 333 'AdminCreateRoleV4' test.out

#- 334 AdminGetRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV4 \
    --roleId 'uz215HWx' \
    > test.out 2>&1
eval_tap $? 334 'AdminGetRoleV4' test.out

#- 335 AdminDeleteRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV4 \
    --roleId 'u6ShViYv' \
    > test.out 2>&1
eval_tap $? 335 'AdminDeleteRoleV4' test.out

#- 336 AdminUpdateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV4 \
    --roleId 'doDxZOzf' \
    --body '{"adminRole": false, "deletable": false, "isWildcard": true, "roleName": "0BRSb4Ws"}' \
    > test.out 2>&1
eval_tap $? 336 'AdminUpdateRoleV4' test.out

#- 337 AdminUpdateRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV4 \
    --roleId 'h8yemkt3' \
    --body '{"permissions": [{"action": 50, "resource": "hwMAMRUV", "schedAction": 68, "schedCron": "EZ2WQAqb", "schedRange": ["xb6ZS65V", "EYiVzTXu", "iWzodfNE"]}, {"action": 4, "resource": "kLsFX31t", "schedAction": 87, "schedCron": "3aDWZoDs", "schedRange": ["HxrLYn3v", "eHYx3AjX", "DBkI84oz"]}, {"action": 50, "resource": "nSnaJ38j", "schedAction": 75, "schedCron": "RSa5w1ol", "schedRange": ["jZ7wfM5W", "wDRiwdcL", "HeH5WPdU"]}]}' \
    > test.out 2>&1
eval_tap $? 337 'AdminUpdateRolePermissionsV4' test.out

#- 338 AdminAddRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV4 \
    --roleId 'FQ5gJKlp' \
    --body '{"permissions": [{"action": 65, "resource": "xcgP1jln", "schedAction": 91, "schedCron": "kM1nBoTb", "schedRange": ["Nbb8WqOu", "0S7qLwlO", "hEuHQ6fc"]}, {"action": 14, "resource": "sHdc2WXN", "schedAction": 95, "schedCron": "jBkuQTWG", "schedRange": ["yQEgD7Ch", "S9YpzB9e", "heXDFy9J"]}, {"action": 12, "resource": "EQEPcvvG", "schedAction": 81, "schedCron": "I2TbUOV4", "schedRange": ["dAbvqYql", "ZgQEzL5m", "Lcy4t9FF"]}]}' \
    > test.out 2>&1
eval_tap $? 338 'AdminAddRolePermissionsV4' test.out

#- 339 AdminDeleteRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV4 \
    --roleId 'cT9TFMSI' \
    --body '["gQ1eUXoB", "jxgZ82iZ", "DmQSIrtR"]' \
    > test.out 2>&1
eval_tap $? 339 'AdminDeleteRolePermissionsV4' test.out

#- 340 AdminListAssignedUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminListAssignedUsersV4 \
    --roleId 'uMaJ3sWi' \
    --after 'Xt4ujRlx' \
    --before 'GdGSbDPr' \
    --limit '27' \
    > test.out 2>&1
eval_tap $? 340 'AdminListAssignedUsersV4' test.out

#- 341 AdminAssignUserToRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAssignUserToRoleV4 \
    --roleId 'NYMeKCT2' \
    --body '{"assignedNamespaces": ["GkGU9FT8", "COdoqSAs", "5fO995FL"], "namespace": "uZQCE9wh", "userId": "UQyuuq6Z"}' \
    > test.out 2>&1
eval_tap $? 341 'AdminAssignUserToRoleV4' test.out

#- 342 AdminRevokeUserFromRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRevokeUserFromRoleV4 \
    --roleId 'B9kc2qk7' \
    --body '{"namespace": "vTMqfpTW", "userId": "lzLEaGm8"}' \
    > test.out 2>&1
eval_tap $? 342 'AdminRevokeUserFromRoleV4' test.out

#- 343 AdminInviteUserNewV4
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserNewV4 \
    --body '{"assignedNamespaces": ["e2ObZjdX", "hsUm6cee", "EgF5qTSA"], "emailAddresses": ["1SKqktbE", "5h2ozmo3", "Z73iOwcq"], "isAdmin": false, "isNewStudio": true, "namespace": "HfFsPQ3i", "roleId": "xJu5aE2O"}' \
    > test.out 2>&1
eval_tap $? 343 'AdminInviteUserNewV4' test.out

#- 344 AdminUpdateMyUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateMyUserV4 \
    --body '{"avatarUrl": "crx9TR3d", "country": "14Mc3Bk4", "dateOfBirth": "yUeabfCv", "displayName": "LXHRlXFW", "languageTag": "xcfnFQdu", "skipLoginQueue": false, "uniqueDisplayName": "V5H9yA8x", "userName": "fH8X6iwp"}' \
    > test.out 2>&1
eval_tap $? 344 'AdminUpdateMyUserV4' test.out

#- 345 AdminDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyAuthenticatorV4 \
    > test.out 2>&1
eval_tap $? 345 'AdminDisableMyAuthenticatorV4' test.out

#- 346 AdminEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyAuthenticatorV4 \
    --code 'DcNQoSe8' \
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
    --code 'LgI83Myy' \
    > test.out 2>&1
eval_tap $? 358 'AdminEnableMyEmailV4' test.out

#- 359 AdminGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyEnabledFactorsV4 \
    > test.out 2>&1
eval_tap $? 359 'AdminGetMyEnabledFactorsV4' test.out

#- 360 AdminMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam adminMakeFactorMyDefaultV4 \
    --factor '12u6g9Ak' \
    > test.out 2>&1
eval_tap $? 360 'AdminMakeFactorMyDefaultV4' test.out

#- 361 AdminInviteUserV4
eval_tap 0 361 'AdminInviteUserV4 # SKIP deprecated' test.out

#- 362 AuthenticationWithPlatformLinkV4
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV4 \
    --extendExp  \
    --clientId '8gykv3GU' \
    --linkingToken 'cINnfVWH' \
    --password '8wXQFgLO' \
    --username 'j3VDoHv9' \
    > test.out 2>&1
eval_tap $? 362 'AuthenticationWithPlatformLinkV4' test.out

#- 363 GenerateTokenByNewHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV4 \
    --additionalData 'E2T5y4lV' \
    --extendExp  \
    --linkingToken '3Dz4lwrp' \
    > test.out 2>&1
eval_tap $? 363 'GenerateTokenByNewHeadlessAccountV4' test.out

#- 364 Verify2faCodeV4
./ng net.accelbyte.sdk.cli.Main iam verify2faCodeV4 \
    --code 'uw4AKzPF' \
    --factor 'zFaUDF4J' \
    --mfaToken 'edohtCPH' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 364 'Verify2faCodeV4' test.out

#- 365 PlatformTokenGrantV4
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV4 \
    --platformId '9CUYYP9N' \
    --codeChallenge 'mNr9t5UF' \
    --codeChallengeMethod 'S256' \
    --additionalData 'VLRpAnDX' \
    --clientId 'PiFrPoxn' \
    --createHeadless  \
    --deviceId 'bCx1PSFd' \
    --macAddress 'BJJf0Up3' \
    --platformToken '6qFe9xlz' \
    --skipSetCookie  \
    > test.out 2>&1
eval_tap $? 365 'PlatformTokenGrantV4' test.out

#- 366 SimultaneousLoginV4
./ng net.accelbyte.sdk.cli.Main iam simultaneousLoginV4 \
    --codeChallenge 'UvNwme8O' \
    --codeChallengeMethod 'S256' \
    --simultaneousPlatform 'Mtbg1dlY' \
    --simultaneousTicket 'zGjOmIgt' \
    --nativePlatform 'steam' \
    --nativePlatformTicket 'i3LHwH59' \
    > test.out 2>&1
eval_tap $? 366 'SimultaneousLoginV4' test.out

#- 367 TokenGrantV4
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV4 \
    --codeChallenge 'BrlsNOyX' \
    --codeChallengeMethod 'plain' \
    --additionalData 'yGfcRf96' \
    --clientId 'rXDScjHe' \
    --code 'Zz80vpal' \
    --codeVerifier 'EqsEzrdk' \
    --extendNamespace 'lfrTmLZt' \
    --extendExp  \
    --loginQueueTicket '9mVr4DCH' \
    --password 'QDdeQoWM' \
    --redirectUri 'e2yFgXjL' \
    --refreshToken 'I7LKpont' \
    --username 'O31kxANh' \
    --grantType 'urn:ietf:params:oauth:grant-type:login_queue_ticket' \
    > test.out 2>&1
eval_tap $? 367 'TokenGrantV4' test.out

#- 368 RequestTargetTokenResponseV4
./ng net.accelbyte.sdk.cli.Main iam requestTargetTokenResponseV4 \
    --additionalData 'znAl435v' \
    --code 'TB3j1t6E' \
    > test.out 2>&1
eval_tap $? 368 'RequestTargetTokenResponseV4' test.out

#- 369 PublicCreateTestUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateTestUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "DuIcfeSM", "policyId": "QeADT3mv", "policyVersionId": "kX8dh20R"}, {"isAccepted": false, "localizedPolicyVersionId": "l6s4QAc6", "policyId": "Iqfx5yLw", "policyVersionId": "5GIJSWIN"}, {"isAccepted": false, "localizedPolicyVersionId": "bLNFQbry", "policyId": "wwgUgjzy", "policyVersionId": "qiFmecqf"}], "authType": "EMAILPASSWD", "country": "fQLODn0j", "dateOfBirth": "ZS5Ljljv", "displayName": "14l6jRdw", "emailAddress": "RLoxucHZ", "password": "f8ia7FkZ", "passwordMD5Sum": "8HxBvQ1B", "uniqueDisplayName": "idonT1rS", "username": "RHvzlsuK", "verified": true}' \
    > test.out 2>&1
eval_tap $? 369 'PublicCreateTestUserV4' test.out

#- 370 PublicCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "rxyfA0s5", "policyId": "ITcPMZot", "policyVersionId": "vO9Oayh2"}, {"isAccepted": false, "localizedPolicyVersionId": "pxFm2wis", "policyId": "yXZLa8he", "policyVersionId": "j87R98T0"}, {"isAccepted": true, "localizedPolicyVersionId": "swc99e9W", "policyId": "jfM1Bofl", "policyVersionId": "H23sADGT"}], "authType": "EMAILPASSWD", "code": "8B4XQSuo", "country": "LTbhfzh7", "dateOfBirth": "vuhOlWWw", "displayName": "9PGPAMWE", "emailAddress": "fwA5VU2e", "password": "UH1oppfz", "passwordMD5Sum": "PFxCEvUU", "reachMinimumAge": true, "uniqueDisplayName": "4Qf5kvp3", "username": "JIwq2W7g"}' \
    > test.out 2>&1
eval_tap $? 370 'PublicCreateUserV4' test.out

#- 371 CreateUserFromInvitationV4
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV4 \
    --invitationId '3N5egSqh' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "GAZSiFvj", "policyId": "aR2tCRwc", "policyVersionId": "K5dMQNDo"}, {"isAccepted": false, "localizedPolicyVersionId": "C567BwUU", "policyId": "HyOfHheu", "policyVersionId": "hd6YzZwZ"}, {"isAccepted": true, "localizedPolicyVersionId": "4gbw8CkE", "policyId": "QxO1E6WT", "policyVersionId": "kNkS8i3T"}], "authType": "EMAILPASSWD", "code": "SkpbIcuT", "country": "vivHTqpR", "dateOfBirth": "rovv0KSH", "displayName": "Icj887bh", "emailAddress": "NGuv8r2P", "password": "cUhDKCym", "passwordMD5Sum": "i3RC8VJ8", "reachMinimumAge": false, "uniqueDisplayName": "GInzGDYH", "username": "IcXyGv4V"}' \
    > test.out 2>&1
eval_tap $? 371 'CreateUserFromInvitationV4' test.out

#- 372 PublicUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "kXxjlycs", "country": "ikmOTIV5", "dateOfBirth": "cVpHxplW", "displayName": "MY3cwjHT", "languageTag": "Pk7nhQ5i", "uniqueDisplayName": "PShLj0vK", "userName": "1DJkbbwt"}' \
    > test.out 2>&1
eval_tap $? 372 'PublicUpdateUserV4' test.out

#- 373 PublicUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "JeRRS7ma", "emailAddress": "beNY2OfD"}' \
    > test.out 2>&1
eval_tap $? 373 'PublicUpdateUserEmailAddressV4' test.out

#- 374 PublicUpgradeHeadlessAccountWithVerificationCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountWithVerificationCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "PcFgd6TH", "country": "XME9nvgA", "dateOfBirth": "U6meejQP", "displayName": "HVgY0IFu", "emailAddress": "mSFwykyP", "password": "0UPUMeAQ", "reachMinimumAge": true, "uniqueDisplayName": "8f2pIyPT", "username": "8aOXZovC", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 374 'PublicUpgradeHeadlessAccountWithVerificationCodeV4' test.out

#- 375 PublicUpgradeHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "lU97Tq2W", "password": "ump3MGcL", "username": "So065Jjg"}' \
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
    --code 'EpxoOjHH' \
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
    --deviceToken '3JYd0tjj' \
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
    --code 'sqXXo6Tr' \
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
    --factor 'Vee2rsHh' \
    > test.out 2>&1
eval_tap $? 392 'PublicMakeFactorMyDefaultV4' test.out

#- 393 PublicGetUserPublicInfoByUserIdV4
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPublicInfoByUserIdV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'C9oI1jNX' \
    > test.out 2>&1
eval_tap $? 393 'PublicGetUserPublicInfoByUserIdV4' test.out

#- 394 PublicInviteUserV4
./ng net.accelbyte.sdk.cli.Main iam publicInviteUserV4 \
    --body '{"additionalData": "T06r7yH4", "emailAddress": "dOMbnIbe", "namespace": "KZsiupga", "namespaceDisplayName": "ockmeNgi"}' \
    > test.out 2>&1
eval_tap $? 394 'PublicInviteUserV4' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
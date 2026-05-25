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
echo "1..444"

#- 1 Login
./ng net.accelbyte.sdk.cli.Main loginClient \
    > test.out 2>&1
eval_tap $? 1 'Login' test.out

if [ $EXIT_CODE -ne 0 ]; then
  echo "Bail out! Login failed."
  exit $EXIT_CODE
fi

touch "tmp.dat"

#- 2 GetAuthorizationServerMetadataWithNamespace
./ng net.accelbyte.sdk.cli.Main iam getAuthorizationServerMetadataWithNamespace \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 2 'GetAuthorizationServerMetadataWithNamespace' test.out

#- 3 GetBansType
eval_tap 0 3 'GetBansType # SKIP deprecated' test.out

#- 4 GetListBanReason
eval_tap 0 4 'GetListBanReason # SKIP deprecated' test.out

#- 5 GetClients
eval_tap 0 5 'GetClients # SKIP deprecated' test.out

#- 6 CreateClient
eval_tap 0 6 'CreateClient # SKIP deprecated' test.out

#- 7 GetClient
eval_tap 0 7 'GetClient # SKIP deprecated' test.out

#- 8 UpdateClient
eval_tap 0 8 'UpdateClient # SKIP deprecated' test.out

#- 9 DeleteClient
eval_tap 0 9 'DeleteClient # SKIP deprecated' test.out

#- 10 UpdateClientPermission
eval_tap 0 10 'UpdateClientPermission # SKIP deprecated' test.out

#- 11 AddClientPermission
eval_tap 0 11 'AddClientPermission # SKIP deprecated' test.out

#- 12 DeleteClientPermission
eval_tap 0 12 'DeleteClientPermission # SKIP deprecated' test.out

#- 13 UpdateClientSecret
eval_tap 0 13 'UpdateClientSecret # SKIP deprecated' test.out

#- 14 GetClientsbyNamespace
eval_tap 0 14 'GetClientsbyNamespace # SKIP deprecated' test.out

#- 15 CreateClientByNamespace
eval_tap 0 15 'CreateClientByNamespace # SKIP deprecated' test.out

#- 16 DeleteClientByNamespace
eval_tap 0 16 'DeleteClientByNamespace # SKIP deprecated' test.out

#- 17 CreateUser
eval_tap 0 17 'CreateUser # SKIP deprecated' test.out

#- 18 GetAdminUsersByRoleID
eval_tap 0 18 'GetAdminUsersByRoleID # SKIP deprecated' test.out

#- 19 GetUserByLoginID
eval_tap 0 19 'GetUserByLoginID # SKIP deprecated' test.out

#- 20 GetUserByPlatformUserID
eval_tap 0 20 'GetUserByPlatformUserID # SKIP deprecated' test.out

#- 21 ForgotPassword
eval_tap 0 21 'ForgotPassword # SKIP deprecated' test.out

#- 22 GetUsersByLoginIds
eval_tap 0 22 'GetUsersByLoginIds # SKIP deprecated' test.out

#- 23 ResetPassword
eval_tap 0 23 'ResetPassword # SKIP deprecated' test.out

#- 24 SearchUser
eval_tap 0 24 'SearchUser # SKIP deprecated' test.out

#- 25 GetUserByUserID
eval_tap 0 25 'GetUserByUserID # SKIP deprecated' test.out

#- 26 UpdateUser
eval_tap 0 26 'UpdateUser # SKIP deprecated' test.out

#- 27 DeleteUser
eval_tap 0 27 'DeleteUser # SKIP deprecated' test.out

#- 28 BanUser
eval_tap 0 28 'BanUser # SKIP deprecated' test.out

#- 29 GetUserBanHistory
eval_tap 0 29 'GetUserBanHistory # SKIP deprecated' test.out

#- 30 DisableUserBan
eval_tap 0 30 'DisableUserBan # SKIP deprecated' test.out

#- 31 EnableUserBan
eval_tap 0 31 'EnableUserBan # SKIP deprecated' test.out

#- 32 ListCrossNamespaceAccountLink
eval_tap 0 32 'ListCrossNamespaceAccountLink # SKIP deprecated' test.out

#- 33 DisableUser
eval_tap 0 33 'DisableUser # SKIP deprecated' test.out

#- 34 EnableUser
eval_tap 0 34 'EnableUser # SKIP deprecated' test.out

#- 35 GetUserInformation
eval_tap 0 35 'GetUserInformation # SKIP deprecated' test.out

#- 36 DeleteUserInformation
eval_tap 0 36 'DeleteUserInformation # SKIP deprecated' test.out

#- 37 GetUserLoginHistories
eval_tap 0 37 'GetUserLoginHistories # SKIP deprecated' test.out

#- 38 UpdatePassword
eval_tap 0 38 'UpdatePassword # SKIP deprecated' test.out

#- 39 SaveUserPermission
eval_tap 0 39 'SaveUserPermission # SKIP deprecated' test.out

#- 40 AddUserPermission
eval_tap 0 40 'AddUserPermission # SKIP deprecated' test.out

#- 41 DeleteUserPermission
eval_tap 0 41 'DeleteUserPermission # SKIP deprecated' test.out

#- 42 GetUserPlatformAccounts
eval_tap 0 42 'GetUserPlatformAccounts # SKIP deprecated' test.out

#- 43 GetUserMapping
eval_tap 0 43 'GetUserMapping # SKIP deprecated' test.out

#- 44 GetUserJusticePlatformAccount
eval_tap 0 44 'GetUserJusticePlatformAccount # SKIP deprecated' test.out

#- 45 PlatformLink
eval_tap 0 45 'PlatformLink # SKIP deprecated' test.out

#- 46 PlatformUnlink
eval_tap 0 46 'PlatformUnlink # SKIP deprecated' test.out

#- 47 GetPublisherUser
eval_tap 0 47 'GetPublisherUser # SKIP deprecated' test.out

#- 48 SaveUserRoles
eval_tap 0 48 'SaveUserRoles # SKIP deprecated' test.out

#- 49 AddUserRole
eval_tap 0 49 'AddUserRole # SKIP deprecated' test.out

#- 50 DeleteUserRole
eval_tap 0 50 'DeleteUserRole # SKIP deprecated' test.out

#- 51 UpgradeHeadlessAccount
eval_tap 0 51 'UpgradeHeadlessAccount # SKIP deprecated' test.out

#- 52 UpgradeHeadlessAccountWithVerificationCode
eval_tap 0 52 'UpgradeHeadlessAccountWithVerificationCode # SKIP deprecated' test.out

#- 53 UserVerification
eval_tap 0 53 'UserVerification # SKIP deprecated' test.out

#- 54 SendVerificationCode
eval_tap 0 54 'SendVerificationCode # SKIP deprecated' test.out

#- 55 Authorization
eval_tap 0 55 'Authorization # SKIP deprecated' test.out

#- 56 GetJWKS
eval_tap 0 56 'GetJWKS # SKIP deprecated' test.out

#- 57 PlatformTokenRequestHandler
eval_tap 0 57 'PlatformTokenRequestHandler # SKIP deprecated' test.out

#- 58 RevokeUser
eval_tap 0 58 'RevokeUser # SKIP deprecated' test.out

#- 59 GetRevocationList
eval_tap 0 59 'GetRevocationList # SKIP deprecated' test.out

#- 60 RevokeToken
eval_tap 0 60 'RevokeToken # SKIP deprecated' test.out

#- 61 RevokeAUser
eval_tap 0 61 'RevokeAUser # SKIP deprecated' test.out

#- 62 TokenGrant
eval_tap 0 62 'TokenGrant # SKIP deprecated' test.out

#- 63 VerifyToken
eval_tap 0 63 'VerifyToken # SKIP deprecated' test.out

#- 64 GetRoles
eval_tap 0 64 'GetRoles # SKIP deprecated' test.out

#- 65 CreateRole
eval_tap 0 65 'CreateRole # SKIP deprecated' test.out

#- 66 GetRole
eval_tap 0 66 'GetRole # SKIP deprecated' test.out

#- 67 UpdateRole
eval_tap 0 67 'UpdateRole # SKIP deprecated' test.out

#- 68 DeleteRole
eval_tap 0 68 'DeleteRole # SKIP deprecated' test.out

#- 69 GetRoleAdminStatus
eval_tap 0 69 'GetRoleAdminStatus # SKIP deprecated' test.out

#- 70 SetRoleAsAdmin
eval_tap 0 70 'SetRoleAsAdmin # SKIP deprecated' test.out

#- 71 RemoveRoleAdmin
eval_tap 0 71 'RemoveRoleAdmin # SKIP deprecated' test.out

#- 72 GetRoleManagers
eval_tap 0 72 'GetRoleManagers # SKIP deprecated' test.out

#- 73 AddRoleManagers
eval_tap 0 73 'AddRoleManagers # SKIP deprecated' test.out

#- 74 RemoveRoleManagers
eval_tap 0 74 'RemoveRoleManagers # SKIP deprecated' test.out

#- 75 GetRoleMembers
eval_tap 0 75 'GetRoleMembers # SKIP deprecated' test.out

#- 76 AddRoleMembers
eval_tap 0 76 'AddRoleMembers # SKIP deprecated' test.out

#- 77 RemoveRoleMembers
eval_tap 0 77 'RemoveRoleMembers # SKIP deprecated' test.out

#- 78 UpdateRolePermissions
eval_tap 0 78 'UpdateRolePermissions # SKIP deprecated' test.out

#- 79 AddRolePermission
eval_tap 0 79 'AddRolePermission # SKIP deprecated' test.out

#- 80 DeleteRolePermission
eval_tap 0 80 'DeleteRolePermission # SKIP deprecated' test.out

#- 81 AdminGetAgeRestrictionStatusV2
eval_tap 0 81 'AdminGetAgeRestrictionStatusV2 # SKIP deprecated' test.out

#- 82 AdminUpdateAgeRestrictionConfigV2
eval_tap 0 82 'AdminUpdateAgeRestrictionConfigV2 # SKIP deprecated' test.out

#- 83 GetListCountryAgeRestriction
eval_tap 0 83 'GetListCountryAgeRestriction # SKIP deprecated' test.out

#- 84 UpdateCountryAgeRestriction
eval_tap 0 84 'UpdateCountryAgeRestriction # SKIP deprecated' test.out

#- 85 AdminSearchUsersV2
eval_tap 0 85 'AdminSearchUsersV2 # SKIP deprecated' test.out

#- 86 AdminGetUserByUserIdV2
eval_tap 0 86 'AdminGetUserByUserIdV2 # SKIP deprecated' test.out

#- 87 AdminUpdateUserV2
eval_tap 0 87 'AdminUpdateUserV2 # SKIP deprecated' test.out

#- 88 AdminBanUserV2
eval_tap 0 88 'AdminBanUserV2 # SKIP deprecated' test.out

#- 89 AdminGetUserBanV2
eval_tap 0 89 'AdminGetUserBanV2 # SKIP deprecated' test.out

#- 90 AdminDisableUserV2
eval_tap 0 90 'AdminDisableUserV2 # SKIP deprecated' test.out

#- 91 AdminEnableUserV2
eval_tap 0 91 'AdminEnableUserV2 # SKIP deprecated' test.out

#- 92 AdminResetPasswordV2
eval_tap 0 92 'AdminResetPasswordV2 # SKIP deprecated' test.out

#- 93 AdminDeletePlatformLinkV2
eval_tap 0 93 'AdminDeletePlatformLinkV2 # SKIP deprecated' test.out

#- 94 AdminPutUserRolesV2
eval_tap 0 94 'AdminPutUserRolesV2 # SKIP deprecated' test.out

#- 95 AdminCreateUserRolesV2
eval_tap 0 95 'AdminCreateUserRolesV2 # SKIP deprecated' test.out

#- 96 PublicGetCountryAgeRestriction
eval_tap 0 96 'PublicGetCountryAgeRestriction # SKIP deprecated' test.out

#- 97 PublicCreateUserV2
eval_tap 0 97 'PublicCreateUserV2 # SKIP deprecated' test.out

#- 98 PublicForgotPasswordV2
eval_tap 0 98 'PublicForgotPasswordV2 # SKIP deprecated' test.out

#- 99 PublicResetPasswordV2
eval_tap 0 99 'PublicResetPasswordV2 # SKIP deprecated' test.out

#- 100 PublicGetUserByUserIDV2
eval_tap 0 100 'PublicGetUserByUserIDV2 # SKIP deprecated' test.out

#- 101 PublicUpdateUserV2
eval_tap 0 101 'PublicUpdateUserV2 # SKIP deprecated' test.out

#- 102 PublicGetUserBan
eval_tap 0 102 'PublicGetUserBan # SKIP deprecated' test.out

#- 103 PublicUpdatePasswordV2
eval_tap 0 103 'PublicUpdatePasswordV2 # SKIP deprecated' test.out

#- 104 GetListJusticePlatformAccounts
eval_tap 0 104 'GetListJusticePlatformAccounts # SKIP deprecated' test.out

#- 105 PublicPlatformLinkV2
eval_tap 0 105 'PublicPlatformLinkV2 # SKIP deprecated' test.out

#- 106 PublicDeletePlatformLinkV2
eval_tap 0 106 'PublicDeletePlatformLinkV2 # SKIP deprecated' test.out

#- 107 AdminGetBansTypeV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBansTypeV3 \
    > test.out 2>&1
eval_tap $? 107 'AdminGetBansTypeV3' test.out

#- 108 AdminGetListBanReasonV3
./ng net.accelbyte.sdk.cli.Main iam adminGetListBanReasonV3 \
    > test.out 2>&1
eval_tap $? 108 'AdminGetListBanReasonV3' test.out

#- 109 AdminListClientAvailablePermissions
./ng net.accelbyte.sdk.cli.Main iam adminListClientAvailablePermissions \
    --excludePermissions  \
    > test.out 2>&1
eval_tap $? 109 'AdminListClientAvailablePermissions' test.out

#- 110 AdminUpdateAvailablePermissionsByModule
./ng net.accelbyte.sdk.cli.Main iam adminUpdateAvailablePermissionsByModule \
    --forceDelete  \
    --body '{"modules": [{"docLink": "VCpenwBN", "groups": [{"group": "BU4Dj3Q5", "groupId": "r5EXOALw", "package": "8DaZUqTc", "permissions": [{"allowedActions": [84, 57, 44], "resource": "Od7X9xv5"}, {"allowedActions": [89, 24, 89], "resource": "UzVXIlyS"}, {"allowedActions": [70, 1, 7], "resource": "pIShRJ9n"}]}, {"group": "R8KOLo7C", "groupId": "GQjRSS1T", "package": "U47mMS0P", "permissions": [{"allowedActions": [27, 51, 46], "resource": "puGyrLVu"}, {"allowedActions": [54, 76, 28], "resource": "CW5irZ3f"}, {"allowedActions": [43, 39, 49], "resource": "tWJxfdA1"}]}, {"group": "f6Hf3dOh", "groupId": "13bv35Vg", "package": "R8GHK6Xv", "permissions": [{"allowedActions": [19, 91, 81], "resource": "kJKdACdp"}, {"allowedActions": [96, 93, 78], "resource": "YHwbZi50"}, {"allowedActions": [94, 67, 79], "resource": "nDZsgSOK"}]}], "module": "I2IawEZm", "moduleId": "OwUBxtgb", "package": "pphDj7jr"}, {"docLink": "kGPgzJVO", "groups": [{"group": "kxlL3gpT", "groupId": "6nsNgD5V", "package": "YZUMkvKQ", "permissions": [{"allowedActions": [66, 18, 82], "resource": "E2m6ybOb"}, {"allowedActions": [67, 20, 81], "resource": "MV0iLWIt"}, {"allowedActions": [46, 32, 0], "resource": "HRjDYhMk"}]}, {"group": "wtLhn7ma", "groupId": "Zjd65OzD", "package": "TFUBPhpT", "permissions": [{"allowedActions": [17, 81, 97], "resource": "7KavAdzR"}, {"allowedActions": [74, 24, 39], "resource": "DqGi6Pkm"}, {"allowedActions": [3, 25, 70], "resource": "9tsL74K5"}]}, {"group": "0PMajCFu", "groupId": "QqhGPSrJ", "package": "fvuhaQim", "permissions": [{"allowedActions": [56, 41, 3], "resource": "0wGHW97r"}, {"allowedActions": [38, 61, 61], "resource": "EVJ7hDCy"}, {"allowedActions": [28, 36, 66], "resource": "plRdwKVW"}]}], "module": "Ab5M5fEc", "moduleId": "E66crCVJ", "package": "ZyeMXT5n"}, {"docLink": "B8zD5sTF", "groups": [{"group": "2sOQDfeF", "groupId": "lh6hKR03", "package": "FGcLyGAV", "permissions": [{"allowedActions": [33, 79, 81], "resource": "Z5tB9sBE"}, {"allowedActions": [17, 4, 67], "resource": "rjR4ggOp"}, {"allowedActions": [26, 15, 42], "resource": "moUnvh88"}]}, {"group": "b96WCcHh", "groupId": "9Zk3WmDi", "package": "CkNExlDX", "permissions": [{"allowedActions": [25, 46, 22], "resource": "Gp7N4mSv"}, {"allowedActions": [89, 69, 85], "resource": "TKY8OisA"}, {"allowedActions": [17, 39, 43], "resource": "bW7TMOnX"}]}, {"group": "IAWHdlJS", "groupId": "0jokA5RT", "package": "xI8dtQxK", "permissions": [{"allowedActions": [42, 21, 52], "resource": "24gwDe2h"}, {"allowedActions": [22, 54, 89], "resource": "M556wXgY"}, {"allowedActions": [23, 50, 25], "resource": "fL48a0Ke"}]}], "module": "92Ox3RuF", "moduleId": "dud8zzRa", "package": "bJq4LnBt"}]}' \
    > test.out 2>&1
eval_tap $? 110 'AdminUpdateAvailablePermissionsByModule' test.out

#- 111 AdminDeleteConfigPermissionsByGroup
./ng net.accelbyte.sdk.cli.Main iam adminDeleteConfigPermissionsByGroup \
    --forceDelete  \
    --body '{"groupId": "cvJNDCuA", "moduleId": "5zlsMjaB"}' \
    > test.out 2>&1
eval_tap $? 111 'AdminDeleteConfigPermissionsByGroup' test.out

#- 112 AdminUpdateModulePackage
./ng net.accelbyte.sdk.cli.Main iam adminUpdateModulePackage \
    --body '{"data": [{"moduleId": "Rjg1lcjS", "package": "p6VEbjcI"}, {"moduleId": "VslYnR0W", "package": "QYCb0U81"}, {"moduleId": "VozrWrK1", "package": "9Ab7zAJb"}]}' \
    > test.out 2>&1
eval_tap $? 112 'AdminUpdateModulePackage' test.out

#- 113 AdminListClientTemplates
./ng net.accelbyte.sdk.cli.Main iam adminListClientTemplates \
    > test.out 2>&1
eval_tap $? 113 'AdminListClientTemplates' test.out

#- 114 AdminGetInputValidations
eval_tap 0 114 'AdminGetInputValidations # SKIP deprecated' test.out

#- 115 AdminUpdateInputValidations
eval_tap 0 115 'AdminUpdateInputValidations # SKIP deprecated' test.out

#- 116 AdminResetInputValidations
eval_tap 0 116 'AdminResetInputValidations # SKIP deprecated' test.out

#- 117 ListAdminsV3
./ng net.accelbyte.sdk.cli.Main iam listAdminsV3 \
    --namespace "$AB_NAMESPACE" \
    --after 'EjT4Qg1Q' \
    --before '1M79rTuB' \
    --endDate 'Xwo5cIkm' \
    --limit '69' \
    --query 'pBiAc6nP' \
    --roleId 'QySWXWdK' \
    --startDate 'tOrC1m2D' \
    > test.out 2>&1
eval_tap $? 117 'ListAdminsV3' test.out

#- 118 AdminGetAgeRestrictionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetAgeRestrictionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 118 'AdminGetAgeRestrictionStatusV3' test.out

#- 119 AdminUpdateAgeRestrictionConfigV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateAgeRestrictionConfigV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"ageRestriction": 57, "enable": true}' \
    > test.out 2>&1
eval_tap $? 119 'AdminUpdateAgeRestrictionConfigV3' test.out

#- 120 AdminGetListCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminGetListCountryAgeRestrictionV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 120 'AdminGetListCountryAgeRestrictionV3' test.out

#- 121 AdminUpdateCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateCountryAgeRestrictionV3 \
    --countryCode 'lV0hofV2' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ageRestriction": 14}' \
    > test.out 2>&1
eval_tap $? 121 'AdminUpdateCountryAgeRestrictionV3' test.out

#- 122 AdminGetBannedUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType '2kLhiWEk' \
    --limit '63' \
    --offset '57' \
    > test.out 2>&1
eval_tap $? 122 'AdminGetBannedUsersV3' test.out

#- 123 AdminBanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"ban": "GjjTQHVc", "comment": "QhmhxYEE", "endDate": "UhjaaLUF", "reason": "XQAer61j", "skipNotif": true, "userIds": ["LHBV7p2A", "hKJ2WInA", "m4NW9kWD"]}' \
    > test.out 2>&1
eval_tap $? 123 'AdminBanUserBulkV3' test.out

#- 124 AdminUnbanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminUnbanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"bans": [{"banId": "A5MClmEd", "userId": "ihzZos58"}, {"banId": "Z7A7V2z3", "userId": "f1LU1nvW"}, {"banId": "Kz2eHkYK", "userId": "Tz4oIMCV"}]}' \
    > test.out 2>&1
eval_tap $? 124 'AdminUnbanUserBulkV3' test.out

#- 125 AdminGetBansTypeWithNamespaceV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBansTypeWithNamespaceV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 125 'AdminGetBansTypeWithNamespaceV3' test.out

#- 126 AdminGetClientsByNamespaceV3
./ng net.accelbyte.sdk.cli.Main iam adminGetClientsByNamespaceV3 \
    --namespace "$AB_NAMESPACE" \
    --clientId 'PKFBiLcg' \
    --clientName 'ftmVCsRA' \
    --clientType 'OtUJ3IOP' \
    --limit '25' \
    --offset '9' \
    --skipLoginQueue  \
    > test.out 2>&1
eval_tap $? 126 'AdminGetClientsByNamespaceV3' test.out

#- 127 AdminBulkUpdateClientsV3
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateClientsV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientIds": ["LmVELVdX", "PRBpc47u", "oVI6s2th"], "clientUpdateRequest": {"audiences": ["mBRJRMBM", "cAnzwcJO", "P1Eazi4y"], "baseUri": "TXD3RTes", "clientName": "YxTaPu5O", "clientPermissions": [{"action": 47, "resource": "7k5dRCPt", "schedAction": 94, "schedCron": "QgfqPYp1", "schedRange": ["aJQmyLy3", "xEroiZ5h", "Vkf5eLDn"]}, {"action": 82, "resource": "ttaOEHph", "schedAction": 89, "schedCron": "nJ4J4Vy8", "schedRange": ["olBNpC08", "bShvHFrX", "RIJQYfNm"]}, {"action": 83, "resource": "VHaqj1oP", "schedAction": 94, "schedCron": "kyEhNz7m", "schedRange": ["kWpDypYX", "xZWBF6Xw", "jUUwCN9u"]}], "clientPlatform": "SSkAP0F2", "deletable": false, "description": "WNcuXWpq", "modulePermissions": [{"moduleId": "pX6HISmD", "selectedGroups": [{"groupId": "sm9NQ44w", "selectedActions": [88, 84, 33]}, {"groupId": "ojjtAgva", "selectedActions": [95, 23, 74]}, {"groupId": "AmNpifR2", "selectedActions": [22, 58, 35]}]}, {"moduleId": "tbMSIz9b", "selectedGroups": [{"groupId": "i1tbH6dP", "selectedActions": [2, 82, 10]}, {"groupId": "IVBtk3Uq", "selectedActions": [56, 56, 62]}, {"groupId": "QayoFyks", "selectedActions": [3, 90, 100]}]}, {"moduleId": "R8rSvkRV", "selectedGroups": [{"groupId": "SAtmbbEz", "selectedActions": [32, 61, 73]}, {"groupId": "OBvM5xlJ", "selectedActions": [9, 38, 94]}, {"groupId": "GIkxJPrF", "selectedActions": [89, 8, 31]}]}], "namespace": "mFUXTOgm", "oauthAccessTokenExpiration": 67, "oauthAccessTokenExpirationTimeUnit": "JVnv4P5E", "oauthRefreshTokenExpiration": 73, "oauthRefreshTokenExpirationTimeUnit": "86AL5ZpI", "redirectUri": "6jIk78oO", "scopes": ["7q777aIq", "c7DEGgIV", "BxAAY797"], "skipLoginQueue": true, "twoFactorEnabled": false}}' \
    > test.out 2>&1
eval_tap $? 127 'AdminBulkUpdateClientsV3' test.out

#- 128 AdminCreateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateClientV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["wHgIABY3", "uKquzjv7", "rsH9O87E"], "baseUri": "mmKghqRa", "clientId": "ZNZsLHHp", "clientName": "78iOUuYY", "clientPermissions": [{"action": 33, "resource": "J1YOSFBe", "schedAction": 60, "schedCron": "JvTSOjgA", "schedRange": ["z5VH2cyf", "e1OebryL", "jl0ZoE8U"]}, {"action": 97, "resource": "vbBEY45K", "schedAction": 53, "schedCron": "XtOqylCH", "schedRange": ["6T5S0vBD", "CyRZmxwp", "tg3d9YTy"]}, {"action": 60, "resource": "ib7mwc2w", "schedAction": 27, "schedCron": "mblqpqGO", "schedRange": ["qJDBHmyb", "5Y9Y46Hs", "pgJbqU0x"]}], "clientPlatform": "ovi0UCgc", "deletable": false, "description": "sxJZ5cXL", "modulePermissions": [{"moduleId": "p4a4qev7", "selectedGroups": [{"groupId": "JlXodldj", "selectedActions": [37, 41, 61]}, {"groupId": "G8V2m8Yd", "selectedActions": [24, 13, 25]}, {"groupId": "tfwI8EJM", "selectedActions": [28, 30, 18]}]}, {"moduleId": "GZdk2uif", "selectedGroups": [{"groupId": "306RH6K3", "selectedActions": [8, 80, 52]}, {"groupId": "sNXLllJ1", "selectedActions": [38, 77, 73]}, {"groupId": "Y34Y7Sqc", "selectedActions": [12, 0, 97]}]}, {"moduleId": "2taPHz2Q", "selectedGroups": [{"groupId": "ZLgIwPdD", "selectedActions": [1, 39, 89]}, {"groupId": "C9VRGqzt", "selectedActions": [52, 90, 50]}, {"groupId": "D0XdsDDw", "selectedActions": [19, 23, 42]}]}], "namespace": "5JA1WSzb", "oauthAccessTokenExpiration": 40, "oauthAccessTokenExpirationTimeUnit": "8MrQzYdY", "oauthClientType": "5UX1xLr2", "oauthRefreshTokenExpiration": 83, "oauthRefreshTokenExpirationTimeUnit": "IhvUnqO5", "redirectUri": "CNUBzx2H", "scopes": ["YLUnK5Nn", "oOSXyqv1", "zV1LUBp0"], "secret": "GuWsYANo", "skipLoginQueue": false, "twoFactorEnabled": true}' \
    > test.out 2>&1
eval_tap $? 128 'AdminCreateClientV3' test.out

#- 129 AdminGetClientsbyNamespacebyIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetClientsbyNamespacebyIDV3 \
    --clientId 'LTkFq079' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 129 'AdminGetClientsbyNamespacebyIDV3' test.out

#- 130 AdminDeleteClientV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientV3 \
    --clientId 'EC4HTRbu' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 130 'AdminDeleteClientV3' test.out

#- 131 AdminUpdateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientV3 \
    --clientId 'YEpdbcKo' \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["hev5quYs", "VNNs9ZND", "yo1Y52dJ"], "baseUri": "uws72zdZ", "clientName": "BOZKJpaQ", "clientPermissions": [{"action": 10, "resource": "KeJopjHL", "schedAction": 18, "schedCron": "aHB3RZ8P", "schedRange": ["yeub2vvn", "Uu7U642J", "EcrJpFYK"]}, {"action": 39, "resource": "DvpIWI9A", "schedAction": 30, "schedCron": "I7Ey1Smj", "schedRange": ["dU6B4iIn", "q5dPhEiV", "HXrQvvwI"]}, {"action": 37, "resource": "KY1CGs5A", "schedAction": 80, "schedCron": "uR8S4p0A", "schedRange": ["canccH4E", "mVEKkOir", "jiOJ9g11"]}], "clientPlatform": "SNJyYf0V", "deletable": true, "description": "YSofMhYt", "modulePermissions": [{"moduleId": "ubXVbh0r", "selectedGroups": [{"groupId": "gILfbblw", "selectedActions": [57, 78, 60]}, {"groupId": "NA6c978j", "selectedActions": [52, 48, 3]}, {"groupId": "xRY9j02q", "selectedActions": [93, 7, 19]}]}, {"moduleId": "YB1mpxey", "selectedGroups": [{"groupId": "oHC1zNZ1", "selectedActions": [40, 37, 76]}, {"groupId": "ILEgOEsH", "selectedActions": [3, 37, 53]}, {"groupId": "1HxyyTSU", "selectedActions": [21, 100, 52]}]}, {"moduleId": "L2r5RKtq", "selectedGroups": [{"groupId": "xnW853d8", "selectedActions": [72, 79, 21]}, {"groupId": "qyCcsdBi", "selectedActions": [75, 57, 45]}, {"groupId": "ZOoNcvNd", "selectedActions": [46, 61, 92]}]}], "namespace": "cg6ksPqa", "oauthAccessTokenExpiration": 33, "oauthAccessTokenExpirationTimeUnit": "JeCxEKBF", "oauthRefreshTokenExpiration": 91, "oauthRefreshTokenExpirationTimeUnit": "lcO3gLNh", "redirectUri": "WLbaTZDA", "scopes": ["MT46h8uH", "QfsVTkPb", "vGvCzrm2"], "skipLoginQueue": false, "twoFactorEnabled": true}' \
    > test.out 2>&1
eval_tap $? 131 'AdminUpdateClientV3' test.out

#- 132 AdminUpdateClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientPermissionV3 \
    --clientId 'WHsUaJ9c' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 34, "resource": "7fu4czPl"}, {"action": 33, "resource": "wf7WUxml"}, {"action": 51, "resource": "LXRtJGn0"}]}' \
    > test.out 2>&1
eval_tap $? 132 'AdminUpdateClientPermissionV3' test.out

#- 133 AdminAddClientPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddClientPermissionsV3 \
    --clientId 'sFNTQ44T' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 2, "resource": "ft6OcTFx"}, {"action": 35, "resource": "T9OF80OQ"}, {"action": 50, "resource": "VnYhU7nx"}]}' \
    > test.out 2>&1
eval_tap $? 133 'AdminAddClientPermissionsV3' test.out

#- 134 AdminDeleteClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientPermissionV3 \
    --action '29' \
    --clientId 'JbHnH4N7' \
    --namespace "$AB_NAMESPACE" \
    --resource 'eDVxRkHw' \
    > test.out 2>&1
eval_tap $? 134 'AdminDeleteClientPermissionV3' test.out

#- 135 AdminGetConfigValueV3
./ng net.accelbyte.sdk.cli.Main iam adminGetConfigValueV3 \
    --configKey '0UKm5yMr' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 135 'AdminGetConfigValueV3' test.out

#- 136 AdminGetCountryListV3
./ng net.accelbyte.sdk.cli.Main iam adminGetCountryListV3 \
    --namespace "$AB_NAMESPACE" \
    --filterBlacklist  \
    > test.out 2>&1
eval_tap $? 136 'AdminGetCountryListV3' test.out

#- 137 AdminGetCountryBlacklistV3
./ng net.accelbyte.sdk.cli.Main iam adminGetCountryBlacklistV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 137 'AdminGetCountryBlacklistV3' test.out

#- 138 AdminAddCountryBlacklistV3
./ng net.accelbyte.sdk.cli.Main iam adminAddCountryBlacklistV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"blacklist": ["sbWzsKHp", "MzyPGYsj", "lgKWpHbC"]}' \
    > test.out 2>&1
eval_tap $? 138 'AdminAddCountryBlacklistV3' test.out

#- 139 AdminGetNamespaceScopedInputValidations
./ng net.accelbyte.sdk.cli.Main iam adminGetNamespaceScopedInputValidations \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 139 'AdminGetNamespaceScopedInputValidations' test.out

#- 140 AdminUpdateNamespaceScopedInputValidations
./ng net.accelbyte.sdk.cli.Main iam adminUpdateNamespaceScopedInputValidations \
    --namespace "$AB_NAMESPACE" \
    --body '[{"field": "94RJNzUS", "validation": {"allowAllSpecialCharacters": true, "allowDigit": true, "allowLetter": false, "allowSpace": true, "allowUnicode": false, "avatarConfig": {"allowedPrefixes": ["gcfgognX", "jzikT8NA", "hyCR1Iq2"], "preferRegex": false, "regex": "2D5EAO0e"}, "blockedWord": ["YWHap1tq", "DYLK6uun", "qjzGFeIq"], "description": [{"language": "zGeVTNQt", "message": ["4Naze9Zb", "2MKI1V8m", "MUCgJVtu"]}, {"language": "gtf00xLf", "message": ["Aey4iO2O", "KISpsg86", "xL6MLTm4"]}, {"language": "xWbytW9C", "message": ["wgDXaeqb", "tBYtfQPv", "06qKk6Lk"]}], "isCustomRegex": true, "letterCase": "4hzbjHKY", "maxLength": 45, "maxRepeatingAlphaNum": 70, "maxRepeatingSpecialCharacter": 44, "minCharType": 19, "minLength": 74, "profanityFilter": "8drD6ZWo", "regex": "uddeouy3", "specialCharacterLocation": "erOXBzms", "specialCharacters": ["yoLtPOMl", "hZ75eon5", "g3PpSFTI"]}}, {"field": "aRCQpowz", "validation": {"allowAllSpecialCharacters": false, "allowDigit": true, "allowLetter": false, "allowSpace": true, "allowUnicode": false, "avatarConfig": {"allowedPrefixes": ["A6ERqPLb", "hb9oJNd4", "04G4aamx"], "preferRegex": false, "regex": "LxVTWgRv"}, "blockedWord": ["i0eaYxwv", "wN5rUXwP", "VBSGsEOZ"], "description": [{"language": "98qFJJ1K", "message": ["UXU7Ekfe", "geBb31Fr", "i3Hda728"]}, {"language": "TiBeFRrO", "message": ["xUBEgglE", "xThgIJpb", "JESU9bEv"]}, {"language": "C6tcQ059", "message": ["dysSD3Cb", "thJsIEEd", "s6ZqbutK"]}], "isCustomRegex": true, "letterCase": "qQcm631P", "maxLength": 63, "maxRepeatingAlphaNum": 46, "maxRepeatingSpecialCharacter": 34, "minCharType": 49, "minLength": 78, "profanityFilter": "GuC7mH4E", "regex": "mqOPE2kr", "specialCharacterLocation": "6xghVnUS", "specialCharacters": ["zjZg33t1", "UGdlO2Fb", "p5HbmZWJ"]}}, {"field": "Gn4QfEFg", "validation": {"allowAllSpecialCharacters": true, "allowDigit": true, "allowLetter": false, "allowSpace": false, "allowUnicode": true, "avatarConfig": {"allowedPrefixes": ["x7vE8dwQ", "Gpebp6vH", "Db19ckHC"], "preferRegex": false, "regex": "3o3gRmdB"}, "blockedWord": ["PeQrdSdc", "yrchtskC", "qLbKAj7R"], "description": [{"language": "Yf4VXm0B", "message": ["6hSjxpEV", "2TEU3yMW", "pXNA7izB"]}, {"language": "P4eeSBaa", "message": ["95NWDQTV", "Qm6yW4XB", "1yDm8v6X"]}, {"language": "6rfJInhz", "message": ["pC0A7y5L", "TMzl8rZf", "gRTshvYr"]}], "isCustomRegex": false, "letterCase": "T55ddBX4", "maxLength": 34, "maxRepeatingAlphaNum": 32, "maxRepeatingSpecialCharacter": 8, "minCharType": 38, "minLength": 99, "profanityFilter": "RKYSpGSa", "regex": "qyu2lYrU", "specialCharacterLocation": "kXglqG5U", "specialCharacters": ["rHyotPwj", "W5bdVSxH", "6hjoaWiT"]}}]' \
    > test.out 2>&1
eval_tap $? 140 'AdminUpdateNamespaceScopedInputValidations' test.out

#- 141 AdminResetNamespaceScopedInputValidations
./ng net.accelbyte.sdk.cli.Main iam adminResetNamespaceScopedInputValidations \
    --field 'Q7AZrB1T' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 141 'AdminResetNamespaceScopedInputValidations' test.out

#- 142 AdminGetLoginAllowlistV3
./ng net.accelbyte.sdk.cli.Main iam adminGetLoginAllowlistV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 142 'AdminGetLoginAllowlistV3' test.out

#- 143 AdminUpdateLoginAllowlistV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateLoginAllowlistV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"active": true, "roleIds": ["Gwhn2itl", "mtEYK2MS", "czOyaEjT"]}' \
    > test.out 2>&1
eval_tap $? 143 'AdminUpdateLoginAllowlistV3' test.out

#- 144 RetrieveAllThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveAllThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 144 'RetrieveAllThirdPartyLoginPlatformCredentialV3' test.out

#- 145 RetrieveAllActiveThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveAllActiveThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 145 'RetrieveAllActiveThirdPartyLoginPlatformCredentialV3' test.out

#- 146 RetrieveAllSSOLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveAllSSOLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '75' \
    --offset '11' \
    > test.out 2>&1
eval_tap $? 146 'RetrieveAllSSOLoginPlatformCredentialV3' test.out

#- 147 RetrieveThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'P1aEfHIQ' \
    > test.out 2>&1
eval_tap $? 147 'RetrieveThirdPartyLoginPlatformCredentialV3' test.out

#- 148 AddThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam addThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'rSNX6O30' \
    --body '{"ACSURL": "whQowpVP", "AWSCognitoRegion": "oqIUcTwA", "AWSCognitoUserPool": "PiY1W33N", "AllowedClients": ["RMmbIR3g", "bJpTZtCs", "865ltW47"], "AppId": "mHKv8dZJ", "AuthorizationEndpoint": "qwPfVSh2", "ClientId": "Pc2rJex2", "EmptyStrFieldList": ["uGxVsC9C", "ygOORcbL", "FHVYvU9l"], "EnableServerLicenseValidation": false, "Environment": "KD5UKch5", "FederationMetadataURL": "AOGQUoA2", "GenericOauthFlow": true, "IncludePUID": true, "IsActive": true, "Issuer": "motMsThh", "JWKSEndpoint": "zw4Z9ZDF", "KeyID": "Mcye3Yok", "LogoURL": "CbuutKpx", "NetflixCertificates": {"encryptedPrivateKey": "ylzlEhES", "encryptedPrivateKeyName": "BBJCcX92", "publicCertificate": "CDfihLQv", "publicCertificateName": "TEjWZaaA", "rootCertificate": "c5eenjag", "rootCertificateName": "OVQkp1s1"}, "OrganizationId": "17DUpIQC", "PlatformName": "p7S6FcTR", "PrivateKey": "H9lGIgMf", "RedirectUri": "oJz6F1yr", "RegisteredDomains": [{"affectedClientIDs": ["7BKcF7qz", "rGS2zume", "zRAF2sz7"], "domain": "C7Usfu6W", "namespaces": ["BOucbMG8", "ylddkD8s", "FI6xFvw3"], "roleId": "JCnge7Wr", "ssoCfg": {"googleKey": {"CT97HdcS": {}, "Igp0SG5u": {}, "lUNN8UDi": {}}, "groupConfigs": [{"assignNamespaces": ["5yLAlUIH", "sC88xmrO", "tf8lm4a1"], "group": "fknFfegG", "roleId": "yI9ixU3g"}, {"assignNamespaces": ["wOpKmNml", "yvMiSNgN", "YJQ1YYRD"], "group": "FewwM780", "roleId": "xusCd0aH"}, {"assignNamespaces": ["FCXQ7f1I", "qUBYMbI0", "aH9c6oau"], "group": "uMuh42cI", "roleId": "aJILKuVB"}]}}, {"affectedClientIDs": ["4MVtwB7W", "Kfk0G3uW", "qt8orWyr"], "domain": "UtI0Jge4", "namespaces": ["0iTr6ycM", "fKZAzxeL", "8aa7BmDx"], "roleId": "csQxn0nx", "ssoCfg": {"googleKey": {"9MsXvkBk": {}, "MaQ1I5wI": {}, "m6dTQePs": {}}, "groupConfigs": [{"assignNamespaces": ["t9bnCEZu", "IJ2Lk3eQ", "C5z7KEHI"], "group": "499wZPx4", "roleId": "qczHxXCX"}, {"assignNamespaces": ["62bvxqac", "CZF0XgkM", "wJT6gLft"], "group": "AaQRg0d7", "roleId": "UHUM4Wk9"}, {"assignNamespaces": ["m9T0dhho", "0cHSNbmO", "Yp5kdugp"], "group": "bzYe7Vwm", "roleId": "ZqFFg3JC"}]}}, {"affectedClientIDs": ["kChElNA2", "Rd8n75JP", "773dQOQI"], "domain": "K2kFK3Qa", "namespaces": ["NQ2e0lqE", "AaK05xYV", "mwGpOEjT"], "roleId": "tK7azeaY", "ssoCfg": {"googleKey": {"zGdiTD1G": {}, "MGsKOshe": {}, "CftlKpQe": {}}, "groupConfigs": [{"assignNamespaces": ["iHgpPdt6", "mbr2VYfl", "Sexcr8ZG"], "group": "2yzGDeK6", "roleId": "Karis96Y"}, {"assignNamespaces": ["vzsi70v8", "VA660VjH", "jCYjuxe3"], "group": "EKfXwoHC", "roleId": "bjTutBxP"}, {"assignNamespaces": ["p980cB87", "44UrphZY", "juWkYAJG"], "group": "Axu9TIY7", "roleId": "ccx1s63W"}]}}], "RelyingParty": "W8nWKaYi", "SandboxId": "c3mp1kpl", "Secret": "6eehO3qO", "TeamID": "TgtEUbZx", "TokenAuthenticationType": "pC5fwnE3", "TokenClaimsMapping": {"8f29nYez": "kxhRJJoJ", "4OO6ZpWw": "ymS1G4et", "OvuKbizK": "xNY5j4up"}, "TokenEndpoint": "1Jmry21d", "UserInfoEndpoint": "yEPYu4nG", "UserInfoHTTPMethod": "1SMBnEXk", "googleAdminConsoleKey": "bzxsEdT9", "scopes": ["L7L5rkav", "LGdSOYtu", "6E6HT3ic"]}' \
    > test.out 2>&1
eval_tap $? 148 'AddThirdPartyLoginPlatformCredentialV3' test.out

#- 149 DeleteThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'iBl2uhVr' \
    > test.out 2>&1
eval_tap $? 149 'DeleteThirdPartyLoginPlatformCredentialV3' test.out

#- 150 UpdateThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'oBQx806S' \
    --body '{"ACSURL": "RuJeDy6N", "AWSCognitoRegion": "6XWhwruO", "AWSCognitoUserPool": "xKwy8A0Y", "AllowedClients": ["mO91KjCJ", "m0MNOb88", "TD6cB8X4"], "AppId": "Ev5LJzyT", "AuthorizationEndpoint": "0JGovSdO", "ClientId": "lEWnsuUf", "EmptyStrFieldList": ["fuxs5xOl", "wpy3owTY", "PWq2siFM"], "EnableServerLicenseValidation": false, "Environment": "sz5C4QtR", "FederationMetadataURL": "38hxDpRM", "GenericOauthFlow": true, "IncludePUID": true, "IsActive": false, "Issuer": "BHukn6UG", "JWKSEndpoint": "8KuOLXMX", "KeyID": "WPIq5EUq", "LogoURL": "rMtxsDhd", "NetflixCertificates": {"encryptedPrivateKey": "QZbpG35R", "encryptedPrivateKeyName": "IXRRyR7P", "publicCertificate": "a2Ku6UHA", "publicCertificateName": "7NNEvSi3", "rootCertificate": "oh8kHVGW", "rootCertificateName": "t5HZnMSF"}, "OrganizationId": "tYBT3mSd", "PlatformName": "AUjC0b4V", "PrivateKey": "VaMYkcTX", "RedirectUri": "9NA2mmDh", "RegisteredDomains": [{"affectedClientIDs": ["ZspkmHCA", "8tLnbiOp", "B0p2NB5n"], "domain": "uedjJJEI", "namespaces": ["wvdreCtz", "ZkKFRwJu", "nKiUW0mR"], "roleId": "TAxahyJo", "ssoCfg": {"googleKey": {"7vEQcCh5": {}, "snMMzcn2": {}, "S8eVQaAU": {}}, "groupConfigs": [{"assignNamespaces": ["IRXzTmWi", "nb9jg52x", "qGWoOt2d"], "group": "JGJrpGe3", "roleId": "9CUXFlwk"}, {"assignNamespaces": ["she71kbk", "01NKhKyf", "CU3ceVsF"], "group": "bLcW33ql", "roleId": "PzR5wtXo"}, {"assignNamespaces": ["OGHNJxMb", "4SVsd7o1", "HbgPz5vy"], "group": "BiMpVtgh", "roleId": "8OmjExXB"}]}}, {"affectedClientIDs": ["6eQ8aOd4", "Fn4CkSz7", "llWcce5Y"], "domain": "RBvlnBCo", "namespaces": ["zyngBXFM", "exBQhc3a", "X0BS7Yw3"], "roleId": "Z5GUerbc", "ssoCfg": {"googleKey": {"PAUTWGpQ": {}, "kr5kULmH": {}, "xxC9FZHN": {}}, "groupConfigs": [{"assignNamespaces": ["kx6DsjWf", "HE8AUfnl", "otipsQpj"], "group": "4FIgTWjk", "roleId": "YaTOBijj"}, {"assignNamespaces": ["Glv99X2k", "vJrEeK8s", "FIloT6EB"], "group": "2VvZBtP4", "roleId": "0XNyoTK5"}, {"assignNamespaces": ["T7D9Mj0f", "MVZw7ya4", "SxhioPpU"], "group": "Slaud2Qy", "roleId": "hulAxWdQ"}]}}, {"affectedClientIDs": ["bofEC83r", "dscGGXTM", "3NJ1vfUi"], "domain": "xp42It8u", "namespaces": ["swXjyVV8", "jg0GdKzt", "BiHRO4OJ"], "roleId": "qojg2PXS", "ssoCfg": {"googleKey": {"6hag6E7Z": {}, "DmwIAFHg": {}, "docWrRfL": {}}, "groupConfigs": [{"assignNamespaces": ["0wMkeZzW", "999tqACC", "e3BHlADx"], "group": "1dqq18PP", "roleId": "7Ro8iMFT"}, {"assignNamespaces": ["sGkDMAfG", "H0Infxzv", "kFEMBnRL"], "group": "oYu4ph7m", "roleId": "Cgci2XLL"}, {"assignNamespaces": ["cGbdcIN2", "jlj1GvPo", "4zBOufC1"], "group": "3Z3V8xFi", "roleId": "LtZqeXGP"}]}}], "RelyingParty": "O1vbnxZK", "SandboxId": "wokW9Afx", "Secret": "ANzksRoq", "TeamID": "ZW7lJfc7", "TokenAuthenticationType": "4eCdEgoM", "TokenClaimsMapping": {"DKudXnKC": "vQ5qUarF", "ppyNlaTw": "xg5MPtxd", "eXMh85WB": "pZKtsWtW"}, "TokenEndpoint": "XMKp7IA8", "UserInfoEndpoint": "SOLE5PVB", "UserInfoHTTPMethod": "NjQmcxXp", "googleAdminConsoleKey": "q05myZS0", "scopes": ["GwX3qQFr", "HeFb8y7n", "P0UKemDs"]}' \
    > test.out 2>&1
eval_tap $? 150 'UpdateThirdPartyLoginPlatformCredentialV3' test.out

#- 151 UpdateThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'sa4ynpqi' \
    --body '{"affectedClientIDs": ["ThdBjTYo", "JehVrAZt", "kY2KTx8n"], "assignedNamespaces": ["8I4Gvl8G", "96bWGUEA", "8tiVktM6"], "domain": "aDH7RATq", "roleId": "jS5zpXiJ", "ssoCfg": {"googleKey": {"2MsneUC8": {}, "FtmuK3u7": {}, "n0JKgyfn": {}}, "groupConfigs": [{"assignNamespaces": ["xodnjMdf", "Bzcb15Dp", "pBeJWpuF"], "group": "dy2Wb4T6", "roleId": "gHiY5AZU"}, {"assignNamespaces": ["E3q7Mj0f", "EWNNvzHq", "ra5hHgbk"], "group": "uDhOBtjQ", "roleId": "INc0eKJd"}, {"assignNamespaces": ["2zCF7D6z", "GrgCqhX8", "HhpuIqa9"], "group": "1nmefebI", "roleId": "6XBxm5nO"}]}}' \
    > test.out 2>&1
eval_tap $? 151 'UpdateThirdPartyLoginPlatformDomainV3' test.out

#- 152 DeleteThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'itVy3Ub2' \
    --body '{"domain": "8xyN99IN", "ssoGroups": ["W6aFsYXP", "WJcAmJ7Q", "IJNPG7jr"]}' \
    > test.out 2>&1
eval_tap $? 152 'DeleteThirdPartyLoginPlatformDomainV3' test.out

#- 153 PartialUpdateThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam partialUpdateThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'b2Hod8V6' \
    --body '{"affectedClientIDs": ["c2pLnl5k", "ECVuwHOT", "ePPHUv1X"], "assignedNamespaces": ["oD8WP5Mj", "dDX7U2AQ", "ypvkzOJl"], "domain": "Zg336ZWC", "roleId": "udKhhdLw", "ssoCfg": {"googleKey": {"0aJF3hYL": {}, "US1EjNB9": {}, "Wh6JYJ0o": {}}, "groupConfigs": [{"assignNamespaces": ["THy1mIuz", "1lM7boTB", "GdOFv591"], "group": "JYw7AuZA", "roleId": "5JeYWEiu"}, {"assignNamespaces": ["m5LCG36z", "9KzakFWa", "XS4KoIZt"], "group": "ucOqXoai", "roleId": "bzkbHGas"}, {"assignNamespaces": ["yN2JSeBc", "C9ILLGly", "1RrA3sQK"], "group": "wUgxFClO", "roleId": "UBGjlpDY"}]}}' \
    > test.out 2>&1
eval_tap $? 153 'PartialUpdateThirdPartyLoginPlatformDomainV3' test.out

#- 154 RetrieveSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam retrieveSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'MjyMkA6F' \
    > test.out 2>&1
eval_tap $? 154 'RetrieveSSOLoginPlatformCredential' test.out

#- 155 AddSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam addSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId '8uJw6YYD' \
    --body '{"acsUrl": "NTYbjfv8", "apiKey": "5q52guM1", "appId": "PEKg9Zwe", "federationMetadataUrl": "sNjMhaa0", "isActive": false, "redirectUri": "XzHsmTmc", "secret": "GAqR4aaX", "ssoUrl": "ANhKsww6"}' \
    > test.out 2>&1
eval_tap $? 155 'AddSSOLoginPlatformCredential' test.out

#- 156 DeleteSSOLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteSSOLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'TyPUa8z5' \
    > test.out 2>&1
eval_tap $? 156 'DeleteSSOLoginPlatformCredentialV3' test.out

#- 157 UpdateSSOPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam updateSSOPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'hazGPxXl' \
    --body '{"acsUrl": "p4zbDhIm", "apiKey": "UyBLaKrs", "appId": "M0ExQ6n1", "federationMetadataUrl": "vG7PWrvz", "isActive": true, "redirectUri": "m920HKJF", "secret": "jTPEMNEc", "ssoUrl": "qVj43etS"}' \
    > test.out 2>&1
eval_tap $? 157 'UpdateSSOPlatformCredential' test.out

#- 158 AdminListUserIDByPlatformUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByPlatformUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'DSujA8SW' \
    --rawPID  \
    --rawPUID  \
    --body '{"platformUserIds": ["UBAKtuJX", "LXb5BwNT", "jGSjIPdK"]}' \
    > test.out 2>&1
eval_tap $? 158 'AdminListUserIDByPlatformUserIDsV3' test.out

#- 159 AdminGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'VkQtoC66' \
    --platformUserId 'VJK0zFmr' \
    --pidType 'aqkwxaBM' \
    > test.out 2>&1
eval_tap $? 159 'AdminGetUserByPlatformUserIDV3' test.out

#- 160 AdminGetProfileUpdateStrategyV3
./ng net.accelbyte.sdk.cli.Main iam adminGetProfileUpdateStrategyV3 \
    --namespace "$AB_NAMESPACE" \
    --field 'country' \
    > test.out 2>&1
eval_tap $? 160 'AdminGetProfileUpdateStrategyV3' test.out

#- 161 AdminUpdateProfileUpdateStrategyV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateProfileUpdateStrategyV3 \
    --namespace "$AB_NAMESPACE" \
    --field 'country' \
    --body '{"config": {"minimumAllowedInterval": 16}, "type": "jBadOZ2h"}' \
    > test.out 2>&1
eval_tap $? 161 'AdminUpdateProfileUpdateStrategyV3' test.out

#- 162 AdminGetRoleOverrideConfigV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleOverrideConfigV3 \
    --namespace "$AB_NAMESPACE" \
    --identity 'GAME_ADMIN' \
    > test.out 2>&1
eval_tap $? 162 'AdminGetRoleOverrideConfigV3' test.out

#- 163 AdminUpdateRoleOverrideConfigV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleOverrideConfigV3 \
    --namespace "$AB_NAMESPACE" \
    --identity 'VIEW_ONLY' \
    --body '{"additions": [{"actions": [64, 6, 63], "resource": "U0pYjGTb"}, {"actions": [67, 2, 70], "resource": "yQACVm65"}, {"actions": [82, 11, 69], "resource": "04SwbuCo"}], "exclusions": [{"actions": [100, 73, 78], "resource": "i6mYhJzT"}, {"actions": [24, 35, 7], "resource": "fF1Ev53Q"}, {"actions": [61, 23, 43], "resource": "hXozYx4E"}], "overrides": [{"actions": [21, 2, 77], "resource": "d61FKUMW"}, {"actions": [64, 23, 44], "resource": "SEWclGLY"}, {"actions": [29, 77, 46], "resource": "Cjh69myh"}], "replacements": [{"replacement": {"actions": [99, 3, 20], "resource": "yke5WOEg"}, "target": "xt9sLkuH"}, {"replacement": {"actions": [55, 66, 54], "resource": "JnwR52rZ"}, "target": "QxiLd6zA"}, {"replacement": {"actions": [2, 46, 49], "resource": "5xNKgzoJ"}, "target": "qWimok8f"}]}' \
    > test.out 2>&1
eval_tap $? 163 'AdminUpdateRoleOverrideConfigV3' test.out

#- 164 AdminGetRoleSourceV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleSourceV3 \
    --namespace "$AB_NAMESPACE" \
    --identity 'USER' \
    > test.out 2>&1
eval_tap $? 164 'AdminGetRoleSourceV3' test.out

#- 165 AdminChangeRoleOverrideConfigStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminChangeRoleOverrideConfigStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --identity 'VIEW_ONLY' \
    --body '{"active": true}' \
    > test.out 2>&1
eval_tap $? 165 'AdminChangeRoleOverrideConfigStatusV3' test.out

#- 166 AdminGetRoleNamespacePermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleNamespacePermissionV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'N1CqXzld' \
    > test.out 2>&1
eval_tap $? 166 'AdminGetRoleNamespacePermissionV3' test.out

#- 167 GetAdminUsersByRoleIdV3
./ng net.accelbyte.sdk.cli.Main iam getAdminUsersByRoleIdV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId '6OMBW4ys' \
    --after '76' \
    --before '36' \
    --limit '62' \
    > test.out 2>&1
eval_tap $? 167 'GetAdminUsersByRoleIdV3' test.out

#- 168 AdminQueryTagV3
./ng net.accelbyte.sdk.cli.Main iam adminQueryTagV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '44' \
    --offset '26' \
    --tagName 'Soz2gwKO' \
    > test.out 2>&1
eval_tap $? 168 'AdminQueryTagV3' test.out

#- 169 AdminCreateTagV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateTagV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"tagName": "BSlOyTQW"}' \
    > test.out 2>&1
eval_tap $? 169 'AdminCreateTagV3' test.out

#- 170 AdminUpdateTagV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateTagV3 \
    --namespace "$AB_NAMESPACE" \
    --tagId 'HbLyEtJF' \
    --body '{"tagName": "d12AjFf1"}' \
    > test.out 2>&1
eval_tap $? 170 'AdminUpdateTagV3' test.out

#- 171 AdminDeleteTagV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteTagV3 \
    --namespace "$AB_NAMESPACE" \
    --tagId 'x1a49wnI' \
    > test.out 2>&1
eval_tap $? 171 'AdminDeleteTagV3' test.out

#- 172 AdminGetUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --emailAddress 'ev2sy3jc' \
    > test.out 2>&1
eval_tap $? 172 'AdminGetUserByEmailAddressV3' test.out

#- 173 AdminBulkUpdateUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"updateRequest": {"skipLoginQueue": false}, "userIds": ["HtIiswG8", "Z92mOPXh", "oiElLkGv"]}' \
    > test.out 2>&1
eval_tap $? 173 'AdminBulkUpdateUsersV3' test.out

#- 174 AdminGetBulkUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType 'eDZjjg29' \
    --body '{"bulkUserId": ["Wpkcp9Px", "NpQSKr27", "4UkQvOaT"]}' \
    > test.out 2>&1
eval_tap $? 174 'AdminGetBulkUserBanV3' test.out

#- 175 AdminListUserIDByUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"findByPublisherNamespace": false, "userIds": ["J9i5bVm1", "njPiByvL", "wpDXiAz1"]}' \
    > test.out 2>&1
eval_tap $? 175 'AdminListUserIDByUserIDsV3' test.out

#- 176 AdminBulkGetUsersPlatform
./ng net.accelbyte.sdk.cli.Main iam adminBulkGetUsersPlatform \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["pQHZAZBJ", "aqpE82vm", "JQtRcW1h"]}' \
    > test.out 2>&1
eval_tap $? 176 'AdminBulkGetUsersPlatform' test.out

#- 177 AdminCursorGetUserV3
./ng net.accelbyte.sdk.cli.Main iam adminCursorGetUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"cursor": {"cursorTime": "SgCn2dpQ", "userId": "dyhX9cEW"}, "fields": ["a36o3kRx", "27VE5XFI", "7z70MhB4"], "limit": 62}' \
    > test.out 2>&1
eval_tap $? 177 'AdminCursorGetUserV3' test.out

#- 178 AdminInviteUserV3
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddresses": ["VcyvSWLx", "kggkwLNL", "L7LPPv60"], "isAdmin": true, "languageTag": "fLTe2PCQ", "namespace": "gOWBN25F", "roles": ["xcKuz1w0", "dFkHUJPM", "Ad1v95h3"]}' \
    > test.out 2>&1
eval_tap $? 178 'AdminInviteUserV3' test.out

#- 179 AdminQueryThirdPlatformLinkHistoryV3
./ng net.accelbyte.sdk.cli.Main iam adminQueryThirdPlatformLinkHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '93' \
    --offset '75' \
    --platformUserId 'OHoqumL8' \
    --platformId '1MKsfqj5' \
    > test.out 2>&1
eval_tap $? 179 'AdminQueryThirdPlatformLinkHistoryV3' test.out

#- 180 AdminListUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminListUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '89' \
    --offset '66' \
    > test.out 2>&1
eval_tap $? 180 'AdminListUsersV3' test.out

#- 181 AdminSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam adminSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'tVreHrDt' \
    --endDate 'BHsuMIw4' \
    --includeTotal  \
    --limit '94' \
    --offset '52' \
    --platformBy 'PZhXoQcA' \
    --platformId 'nmHwpvMN' \
    --query 'bTiJAxH6' \
    --roleIds 'rQxYdIRc' \
    --selectedFields 'Sfgm1cjA' \
    --skipLoginQueue  \
    --startDate 'hDw2IBzk' \
    --tagIds 'FMSm5tCM' \
    --testAccount  \
    > test.out 2>&1
eval_tap $? 181 'AdminSearchUserV3' test.out

#- 182 AdminGetBulkUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"listEmailAddressRequest": ["hB8SR1N4", "Qeyu1zRN", "KfN2quLG"]}' \
    > test.out 2>&1
eval_tap $? 182 'AdminGetBulkUserByEmailAddressV3' test.out

#- 183 AdminGetUserByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'RXtQRgc3' \
    > test.out 2>&1
eval_tap $? 183 'AdminGetUserByUserIdV3' test.out

#- 184 AdminUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'xd3QtM2s' \
    --body '{"avatarUrl": "6hwa7CZf", "country": "hTgJ7Jse", "dateOfBirth": "uFwn6QAL", "displayName": "ylmJFyzA", "languageTag": "J2hrtiWJ", "skipLoginQueue": true, "tags": ["dyXxFGYA", "HnKLwFBf", "CpYh4fFP"], "uniqueDisplayName": "16asBnsl", "userName": "0A8YWuA9"}' \
    > test.out 2>&1
eval_tap $? 184 'AdminUpdateUserV3' test.out

#- 185 AdminGetUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'j70Pfc6m' \
    --activeOnly  \
    --after 'T9SCE3tr' \
    --before 'zkcy5M4K' \
    --limit '96' \
    > test.out 2>&1
eval_tap $? 185 'AdminGetUserBanV3' test.out

#- 186 AdminBanUserV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'YynMbljL' \
    --body '{"ban": "5VIbsCet", "comment": "FTNNxF0A", "endDate": "i2MXZTUP", "reason": "gAZgbQDW", "skipNotif": true}' \
    > test.out 2>&1
eval_tap $? 186 'AdminBanUserV3' test.out

#- 187 AdminGetUserBanSummaryV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanSummaryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'm3z2aCnK' \
    > test.out 2>&1
eval_tap $? 187 'AdminGetUserBanSummaryV3' test.out

#- 188 AdminUpdateUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserBanV3 \
    --banId 'IVdOqJFc' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Vg2omoTD' \
    --body '{"enabled": true, "skipNotif": false}' \
    > test.out 2>&1
eval_tap $? 188 'AdminUpdateUserBanV3' test.out

#- 189 AdminSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'yTUHe09O' \
    --body '{"context": "WbeFC1MN", "emailAddress": "t3TJe1pg", "languageTag": "lbJOBOMp", "upgradeToken": "3bDukUkl"}' \
    > test.out 2>&1
eval_tap $? 189 'AdminSendVerificationCodeV3' test.out

#- 190 AdminVerifyAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '1zBLcSr0' \
    --body '{"Code": "qoV3rO2V", "ContactType": "ipyEi4iY", "LanguageTag": "5XuKxBkz", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 190 'AdminVerifyAccountV3' test.out

#- 191 GetUserVerificationCode
./ng net.accelbyte.sdk.cli.Main iam getUserVerificationCode \
    --namespace "$AB_NAMESPACE" \
    --userId '4XuippC8' \
    > test.out 2>&1
eval_tap $? 191 'GetUserVerificationCode' test.out

#- 192 AdminGetUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'tEbG54kV' \
    > test.out 2>&1
eval_tap $? 192 'AdminGetUserDeletionStatusV3' test.out

#- 193 AdminUpdateUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'iP41DG1z' \
    --body '{"deletionDate": 22, "enabled": true}' \
    > test.out 2>&1
eval_tap $? 193 'AdminUpdateUserDeletionStatusV3' test.out

#- 194 AdminListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'eX6ji59m' \
    > test.out 2>&1
eval_tap $? 194 'AdminListUserAllPlatformAccountsDistinctV3' test.out

#- 195 AdminUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'rnsE0UoQ' \
    --body '{"code": "V8OvVLG9", "country": "ooxbIpiy", "dateOfBirth": "LK9bv3cb", "displayName": "eKuV6NrS", "emailAddress": "oQlGYCNu", "password": "SlPu0CnA", "uniqueDisplayName": "jUFYsOY9", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 195 'AdminUpgradeHeadlessAccountV3' test.out

#- 196 AdminDeleteUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'mvulaO9Q' \
    > test.out 2>&1
eval_tap $? 196 'AdminDeleteUserInformationV3' test.out

#- 197 AdminGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'fyydkbcK' \
    --after '0.4958784431140262' \
    --before '0.9809969003138256' \
    --limit '65' \
    > test.out 2>&1
eval_tap $? 197 'AdminGetUserLoginHistoriesV3' test.out

#- 198 AdminResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam adminResetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'cg5MTuvk' \
    --body '{"languageTag": "gHDspIpO", "mfaToken": "O593vNwc", "newPassword": "bfnmmsFl", "oldPassword": "GawgoXnT"}' \
    > test.out 2>&1
eval_tap $? 198 'AdminResetPasswordV3' test.out

#- 199 AdminUpdateUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserPermissionV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'HGTNcru3' \
    --body '{"Permissions": [{"Action": 82, "Resource": "6Vxmsfkw", "SchedAction": 87, "SchedCron": "7IJ1oRfa", "SchedRange": ["6U2RcyUI", "k7HvhTmk", "INqyUotI"]}, {"Action": 14, "Resource": "HGuyUHT0", "SchedAction": 38, "SchedCron": "SJINkpZs", "SchedRange": ["o7iSmPpM", "6N3CJ9Lx", "YlnXgsGN"]}, {"Action": 18, "Resource": "ILvtkEPX", "SchedAction": 30, "SchedCron": "sA5x4dyN", "SchedRange": ["YmC5UtKr", "yAeoG6eq", "5jiiRcTK"]}]}' \
    > test.out 2>&1
eval_tap $? 199 'AdminUpdateUserPermissionV3' test.out

#- 200 AdminAddUserPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserPermissionsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'UPTwlThw' \
    --body '{"Permissions": [{"Action": 0, "Resource": "bV9xS0TN", "SchedAction": 8, "SchedCron": "wjp7FS1m", "SchedRange": ["fQ4iLBOE", "QvELmT5H", "VepYuLvl"]}, {"Action": 59, "Resource": "flABRwN2", "SchedAction": 1, "SchedCron": "0dkyxsKG", "SchedRange": ["BQ1FJZyj", "XRvQPiAi", "YzberH6P"]}, {"Action": 27, "Resource": "RwrEb7n5", "SchedAction": 45, "SchedCron": "OjDaoawr", "SchedRange": ["iGmZFLjJ", "licxnuqS", "E6GYHBlL"]}]}' \
    > test.out 2>&1
eval_tap $? 200 'AdminAddUserPermissionsV3' test.out

#- 201 AdminDeleteUserPermissionBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'xRNDclUg' \
    --body '[{"Action": 87, "Resource": "vPwdZ7fZ"}, {"Action": 81, "Resource": "TS1yO5v3"}, {"Action": 42, "Resource": "tApV3Uno"}]' \
    > test.out 2>&1
eval_tap $? 201 'AdminDeleteUserPermissionBulkV3' test.out

#- 202 AdminDeleteUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionV3 \
    --action '53' \
    --namespace "$AB_NAMESPACE" \
    --resource 'rlcAV7y6' \
    --userId 'UmbXpwhv' \
    > test.out 2>&1
eval_tap $? 202 'AdminDeleteUserPermissionV3' test.out

#- 203 AdminGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'U9AhpKg8' \
    --after 'GUxImBfv' \
    --before 'MssqAGYq' \
    --limit '81' \
    --platformId 'XerrYDub' \
    --targetNamespace 'dyw4muYM' \
    > test.out 2>&1
eval_tap $? 203 'AdminGetUserPlatformAccountsV3' test.out

#- 204 AdminListAllDistinctPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminListAllDistinctPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '0MjbRBpn' \
    --status 'haWBg4WT' \
    > test.out 2>&1
eval_tap $? 204 'AdminListAllDistinctPlatformAccountsV3' test.out

#- 205 AdminGetListJusticePlatformAccounts
./ng net.accelbyte.sdk.cli.Main iam adminGetListJusticePlatformAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId '2BrjOy7Z' \
    > test.out 2>&1
eval_tap $? 205 'AdminGetListJusticePlatformAccounts' test.out

#- 206 AdminGetUserMapping
./ng net.accelbyte.sdk.cli.Main iam adminGetUserMapping \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'ThupLRt0' \
    --userId 'rJI27wb2' \
    --createIfNotFound  \
    > test.out 2>&1
eval_tap $? 206 'AdminGetUserMapping' test.out

#- 207 AdminCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam adminCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'fu29eYFp' \
    --userId 'mGUOof45' \
    > test.out 2>&1
eval_tap $? 207 'AdminCreateJusticeUser' test.out

#- 208 AdminLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'U57ugdft' \
    --skipConflict  \
    --body '{"platformId": "CJHCiNAq", "platformUserId": "tl0Wnuon"}' \
    > test.out 2>&1
eval_tap $? 208 'AdminLinkPlatformAccount' test.out

#- 209 AdminGetUserLinkHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLinkHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZcTQ07YZ' \
    --platformId 'Y6q8pWZb' \
    > test.out 2>&1
eval_tap $? 209 'AdminGetUserLinkHistoriesV3' test.out

#- 210 AdminPlatformUnlinkV3
eval_tap 0 210 'AdminPlatformUnlinkV3 # SKIP deprecated' test.out

#- 211 AdminPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'slFUrMBx' \
    --userId 'd3ts8UmG' \
    > test.out 2>&1
eval_tap $? 211 'AdminPlatformUnlinkAllV3' test.out

#- 212 AdminPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '3h54NX9A' \
    --userId 'B6XvmfDQ' \
    --ticket 'mRpJUbLx' \
    > test.out 2>&1
eval_tap $? 212 'AdminPlatformLinkV3' test.out

#- 213 AdminDeleteUserLinkingHistoryByPlatformIDV3
eval_tap 0 213 'AdminDeleteUserLinkingHistoryByPlatformIDV3 # SKIP deprecated' test.out

#- 214 AdminDeleteUserLinkingRestrictionByPlatformIDV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserLinkingRestrictionByPlatformIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '4xpdaYby' \
    --userId '4R7zA9Yp' \
    > test.out 2>&1
eval_tap $? 214 'AdminDeleteUserLinkingRestrictionByPlatformIDV3' test.out

#- 215 AdminGetThirdPartyPlatformTokenLinkStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetThirdPartyPlatformTokenLinkStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'jInyoMoM' \
    --userId 'olYqbRF9' \
    --platformToken 'kcAwPWwT' \
    > test.out 2>&1
eval_tap $? 215 'AdminGetThirdPartyPlatformTokenLinkStatusV3' test.out

#- 216 AdminGetUserSinglePlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminGetUserSinglePlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --platformId 'z0uLWvkW' \
    --userId 'sqQVVvoI' \
    --crossNamespace  \
    > test.out 2>&1
eval_tap $? 216 'AdminGetUserSinglePlatformAccount' test.out

#- 217 AdminDeleteUserRolesV3
eval_tap 0 217 'AdminDeleteUserRolesV3 # SKIP deprecated' test.out

#- 218 AdminSaveUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminSaveUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'jgTypwnG' \
    --body '[{"namespace": "6Gu33yIZ", "roleId": "MpSkLdat"}, {"namespace": "WCATTDA1", "roleId": "NOElLDUG"}, {"namespace": "aQLxipRo", "roleId": "g7OQBzST"}]' \
    > test.out 2>&1
eval_tap $? 218 'AdminSaveUserRoleV3' test.out

#- 219 AdminAddUserRoleV3
eval_tap 0 219 'AdminAddUserRoleV3 # SKIP deprecated' test.out

#- 220 AdminDeleteUserRoleV3
eval_tap 0 220 'AdminDeleteUserRoleV3 # SKIP deprecated' test.out

#- 221 AdminGetUserStateByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserStateByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'QS2u4BT7' \
    > test.out 2>&1
eval_tap $? 221 'AdminGetUserStateByUserIdV3' test.out

#- 222 AdminUpdateUserStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'KrX6jXKB' \
    --body '{"enabled": true, "reason": "zLwPS469"}' \
    > test.out 2>&1
eval_tap $? 222 'AdminUpdateUserStatusV3' test.out

#- 223 AdminTrustlyUpdateUserIdentity
./ng net.accelbyte.sdk.cli.Main iam adminTrustlyUpdateUserIdentity \
    --namespace "$AB_NAMESPACE" \
    --userId 'PiDfyuCH' \
    --body '{"emailAddress": "L6cIVayM", "password": "7XUzwAuO"}' \
    > test.out 2>&1
eval_tap $? 223 'AdminTrustlyUpdateUserIdentity' test.out

#- 224 AdminVerifyUserWithoutVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyUserWithoutVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'kb3IDv3a' \
    > test.out 2>&1
eval_tap $? 224 'AdminVerifyUserWithoutVerificationCodeV3' test.out

#- 225 AdminUpdateClientSecretV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientSecretV3 \
    --clientId 'RdKm9W8w' \
    --namespace "$AB_NAMESPACE" \
    --body '{"newSecret": "w8GQ2Ma6"}' \
    > test.out 2>&1
eval_tap $? 225 'AdminUpdateClientSecretV3' test.out

#- 226 AdminCheckThirdPartyLoginPlatformAvailabilityV3
./ng net.accelbyte.sdk.cli.Main iam adminCheckThirdPartyLoginPlatformAvailabilityV3 \
    --platformId 'SodHs4Fj' \
    > test.out 2>&1
eval_tap $? 226 'AdminCheckThirdPartyLoginPlatformAvailabilityV3' test.out

#- 227 GetThirdPartyLoginPlatformDefaultsV3
./ng net.accelbyte.sdk.cli.Main iam getThirdPartyLoginPlatformDefaultsV3 \
    --platformId 'kA7hNyM7' \
    > test.out 2>&1
eval_tap $? 227 'GetThirdPartyLoginPlatformDefaultsV3' test.out

#- 228 AdminGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV3 \
    --after 'cGRWy4HQ' \
    --before 'JZOtBd5v' \
    --isWildcard  \
    --limit '81' \
    > test.out 2>&1
eval_tap $? 228 'AdminGetRolesV3' test.out

#- 229 AdminCreateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV3 \
    --body '{"adminRole": false, "deletable": false, "isWildcard": false, "managers": [{"displayName": "d7cNK7MD", "namespace": "Px0VKFAN", "userId": "GHbXR8Ki"}, {"displayName": "Yuubc69f", "namespace": "xkBFVBID", "userId": "MGtdlosA"}, {"displayName": "IQh0t2H9", "namespace": "3ehCFtjc", "userId": "qBpGrqcO"}], "members": [{"displayName": "pVQuTEgn", "namespace": "jCqmnOHm", "userId": "vXQjIg4c"}, {"displayName": "wIwoaeGe", "namespace": "DplVc18z", "userId": "5i8sZq1q"}, {"displayName": "N1MSKRlY", "namespace": "4pm72i5v", "userId": "lLLsohyx"}], "permissions": [{"action": 78, "resource": "87ohsZUG", "schedAction": 29, "schedCron": "qp4NZPoM", "schedRange": ["nxNtvdfX", "xyQbiWCR", "RQ3kYipk"]}, {"action": 93, "resource": "350OW73k", "schedAction": 86, "schedCron": "L0aO9A2W", "schedRange": ["DdpxcUO3", "GAxEaU9H", "L1kzwDXI"]}, {"action": 70, "resource": "sPYCzLm9", "schedAction": 69, "schedCron": "vIaLyq8G", "schedRange": ["mg4v8gje", "kP8ag4Sv", "CMSqAiGH"]}], "roleName": "z2nwLAhh"}' \
    > test.out 2>&1
eval_tap $? 229 'AdminCreateRoleV3' test.out

#- 230 AdminGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV3 \
    --roleId '0o1JMSb9' \
    > test.out 2>&1
eval_tap $? 230 'AdminGetRoleV3' test.out

#- 231 AdminDeleteRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV3 \
    --roleId 'TV6sFd8v' \
    > test.out 2>&1
eval_tap $? 231 'AdminDeleteRoleV3' test.out

#- 232 AdminUpdateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV3 \
    --roleId 'C9VzbWyX' \
    --body '{"deletable": true, "isWildcard": true, "roleName": "AEwmOuxS"}' \
    > test.out 2>&1
eval_tap $? 232 'AdminUpdateRoleV3' test.out

#- 233 AdminGetRoleAdminStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleAdminStatusV3 \
    --roleId 'JZll9AMK' \
    > test.out 2>&1
eval_tap $? 233 'AdminGetRoleAdminStatusV3' test.out

#- 234 AdminUpdateAdminRoleStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateAdminRoleStatusV3 \
    --roleId 'FtlIxaF3' \
    > test.out 2>&1
eval_tap $? 234 'AdminUpdateAdminRoleStatusV3' test.out

#- 235 AdminRemoveRoleAdminV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleAdminV3 \
    --roleId '9Gr8Ybzx' \
    > test.out 2>&1
eval_tap $? 235 'AdminRemoveRoleAdminV3' test.out

#- 236 AdminGetRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleManagersV3 \
    --roleId 'qiZlZ4hX' \
    --after 'a3ZwqKpT' \
    --before 'GpbIU4jh' \
    --limit '69' \
    > test.out 2>&1
eval_tap $? 236 'AdminGetRoleManagersV3' test.out

#- 237 AdminAddRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleManagersV3 \
    --roleId 'MB6O6KYp' \
    --body '{"managers": [{"displayName": "HR5A7LlL", "namespace": "ATbjdsLj", "userId": "d9vLDhh7"}, {"displayName": "Bktu2uBV", "namespace": "hiABNjLz", "userId": "VYmHljLm"}, {"displayName": "cin2q2WS", "namespace": "PFuePBWu", "userId": "2YuWNkVk"}]}' \
    > test.out 2>&1
eval_tap $? 237 'AdminAddRoleManagersV3' test.out

#- 238 AdminRemoveRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleManagersV3 \
    --roleId 'tEf35nbo' \
    --body '{"managers": [{"displayName": "rSHcbVXt", "namespace": "56e0PefN", "userId": "8qFmo7ww"}, {"displayName": "hqhBqSig", "namespace": "OuUyJEEk", "userId": "AVOyJtKA"}, {"displayName": "iFPlqmHl", "namespace": "K0mwXWmL", "userId": "Z8JiT5v3"}]}' \
    > test.out 2>&1
eval_tap $? 238 'AdminRemoveRoleManagersV3' test.out

#- 239 AdminGetRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleMembersV3 \
    --roleId 'sQ9EZZqZ' \
    --after 'ZrGR0u29' \
    --before 'ILEdEavz' \
    --limit '99' \
    > test.out 2>&1
eval_tap $? 239 'AdminGetRoleMembersV3' test.out

#- 240 AdminAddRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleMembersV3 \
    --roleId 'Z33Y0aNY' \
    --body '{"members": [{"displayName": "LuAGqkCn", "namespace": "cmN0ARbf", "userId": "H6ruefW3"}, {"displayName": "NO3TfE2H", "namespace": "uUY4hCgR", "userId": "e4ARi4K8"}, {"displayName": "pF3bOD0x", "namespace": "ic71HSy6", "userId": "JMnQ79Yr"}]}' \
    > test.out 2>&1
eval_tap $? 240 'AdminAddRoleMembersV3' test.out

#- 241 AdminRemoveRoleMembersV3
eval_tap 0 241 'AdminRemoveRoleMembersV3 # SKIP deprecated' test.out

#- 242 AdminUpdateRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV3 \
    --roleId 'QzgOuOb3' \
    --body '{"permissions": [{"action": 79, "resource": "SRjHALwi", "schedAction": 56, "schedCron": "12MUQ9PF", "schedRange": ["D4tzaHN9", "JR98CfaG", "CPo7rOlI"]}, {"action": 76, "resource": "8F5sSG0g", "schedAction": 65, "schedCron": "AGUyvGmP", "schedRange": ["meWgNAt3", "d3JPkp0S", "Tqf72WDN"]}, {"action": 10, "resource": "IEMSEUxn", "schedAction": 26, "schedCron": "nC0uqKSI", "schedRange": ["ag5OAQkB", "W9oNQEQU", "rB7fMwfc"]}]}' \
    > test.out 2>&1
eval_tap $? 242 'AdminUpdateRolePermissionsV3' test.out

#- 243 AdminAddRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV3 \
    --roleId '6fFzJHsW' \
    --body '{"permissions": [{"action": 20, "resource": "eC1gdulK", "schedAction": 97, "schedCron": "5nBvwQ3Q", "schedRange": ["okqejlEc", "Wg0z2e2L", "HC1NBDka"]}, {"action": 8, "resource": "1B3TxgUr", "schedAction": 65, "schedCron": "zQYmCQsi", "schedRange": ["YRSnplzL", "yLt4hBLE", "UaxIzQHH"]}, {"action": 81, "resource": "xKAgJZNr", "schedAction": 90, "schedCron": "MouD8FG9", "schedRange": ["B7Oeq1Rj", "Pi5v0BhB", "vU6mccHG"]}]}' \
    > test.out 2>&1
eval_tap $? 243 'AdminAddRolePermissionsV3' test.out

#- 244 AdminDeleteRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV3 \
    --roleId '4GFgHZUe' \
    --body '["KHbyGnTE", "2UyW1RJD", "r4HD94ES"]' \
    > test.out 2>&1
eval_tap $? 244 'AdminDeleteRolePermissionsV3' test.out

#- 245 AdminDeleteRolePermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionV3 \
    --action '21' \
    --resource 'Au9IMx5W' \
    --roleId 'P2Omf3a0' \
    > test.out 2>&1
eval_tap $? 245 'AdminDeleteRolePermissionV3' test.out

#- 246 AdminGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam adminGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 246 'AdminGetMyUserV3' test.out

#- 247 UserAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam userAuthenticationV3 \
    --clientId 'uRPeYMrJ' \
    --extendExp  \
    --redirectUri 'WyonFWts' \
    --password 'Zr1Ybokz' \
    --requestId 'eSCIexLF' \
    --userName 'RZNjZJ0O' \
    > test.out 2>&1
eval_tap $? 247 'UserAuthenticationV3' test.out

#- 248 AuthenticationWithPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV3 \
    --extendExp  \
    --clientId '8g50uB16' \
    --linkingToken 'UEvcTcO3' \
    --password 'YgMu2Ccz' \
    --username 'UVop8OWK' \
    > test.out 2>&1
eval_tap $? 248 'AuthenticationWithPlatformLinkV3' test.out

#- 249 AuthenticateAndLinkForwardV3
./ng net.accelbyte.sdk.cli.Main iam authenticateAndLinkForwardV3 \
    --extendExp  \
    --clientId 'xxVgtUyd' \
    --linkingToken 'rsHVs6T9' \
    --password 'ONmIAbj5' \
    --username '71nll4Jt' \
    > test.out 2>&1
eval_tap $? 249 'AuthenticateAndLinkForwardV3' test.out

#- 250 PublicGetSystemConfigV3
./ng net.accelbyte.sdk.cli.Main iam publicGetSystemConfigV3 \
    > test.out 2>&1
eval_tap $? 250 'PublicGetSystemConfigV3' test.out

#- 251 GenerateTokenByNewHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV3 \
    --additionalData 'OGF7AuEa' \
    --extendExp  \
    --linkingToken '6ptkQ3eo' \
    > test.out 2>&1
eval_tap $? 251 'GenerateTokenByNewHeadlessAccountV3' test.out

#- 252 RequestOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam requestOneTimeLinkingCodeV3 \
    --redirectUri 'l3t2OLRR' \
    --state 'ypkGgTkR' \
    --platformId 'mf9Alazz' \
    > test.out 2>&1
eval_tap $? 252 'RequestOneTimeLinkingCodeV3' test.out

#- 253 ValidateOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam validateOneTimeLinkingCodeV3 \
    --oneTimeLinkCode 'fChssAnT' \
    > test.out 2>&1
eval_tap $? 253 'ValidateOneTimeLinkingCodeV3' test.out

#- 254 RequestTokenByOneTimeLinkCodeResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTokenByOneTimeLinkCodeResponseV3 \
    --additionalData 'ynCAyxLB' \
    --isTransient  \
    --clientId 'gR24H5kQ' \
    --oneTimeLinkCode 'EDa5VGCC' \
    > test.out 2>&1
eval_tap $? 254 'RequestTokenByOneTimeLinkCodeResponseV3' test.out

#- 255 GetCountryLocationV3
./ng net.accelbyte.sdk.cli.Main iam getCountryLocationV3 \
    > test.out 2>&1
eval_tap $? 255 'GetCountryLocationV3' test.out

#- 256 Logout
./ng net.accelbyte.sdk.cli.Main iam logout \
    > test.out 2>&1
eval_tap $? 256 'Logout' test.out

#- 257 RequestTokenExchangeCodeV3
./ng net.accelbyte.sdk.cli.Main iam requestTokenExchangeCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --codeChallenge '92aqPmK6' \
    --codeChallengeMethod 'S256' \
    --clientId 'yTwH35Bq' \
    > test.out 2>&1
eval_tap $? 257 'RequestTokenExchangeCodeV3' test.out

#- 258 AdminRetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam adminRetrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'xnRoaUXq' \
    --userId 'cfQO8obx' \
    --platformUserId '8iRGi5cY' \
    > test.out 2>&1
eval_tap $? 258 'AdminRetrieveUserThirdPartyPlatformTokenV3' test.out

#- 259 RevokeUserV3
./ng net.accelbyte.sdk.cli.Main iam revokeUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'GoyUVXmG' \
    --includeGameNamespace  \
    > test.out 2>&1
eval_tap $? 259 'RevokeUserV3' test.out

#- 260 AuthorizeV3
./ng net.accelbyte.sdk.cli.Main iam authorizeV3 \
    --blockedPlatformId 'oPcShgOj' \
    --codeChallenge 'lpZ3Rxtd' \
    --codeChallengeMethod 'S256' \
    --createHeadless  \
    --loginWebBased  \
    --nonce 'j0S0G4GW' \
    --oneTimeLinkCode '3H6b4pTt' \
    --redirectUri 'Cv1K3nRq' \
    --scope 'Pt7itdHX' \
    --state 'nURaptD9' \
    --targetAuthPage 'TDkGgdUI' \
    --useRedirectUriAsLoginUrlWhenLocked  \
    --clientId 'c84GIEn8' \
    --responseType 'code' \
    > test.out 2>&1
eval_tap $? 260 'AuthorizeV3' test.out

#- 261 TokenIntrospectionV3
./ng net.accelbyte.sdk.cli.Main iam tokenIntrospectionV3 \
    --token 'gp62wmx7' \
    > test.out 2>&1
eval_tap $? 261 'TokenIntrospectionV3' test.out

#- 262 GetJWKSV3
./ng net.accelbyte.sdk.cli.Main iam getJWKSV3 \
    > test.out 2>&1
eval_tap $? 262 'GetJWKSV3' test.out

#- 263 SendMFAAuthenticationCode
./ng net.accelbyte.sdk.cli.Main iam sendMFAAuthenticationCode \
    --clientId 'NuLSzq5s' \
    --factor 'PUpoZdpP' \
    --mfaToken 'pInUGXJR' \
    > test.out 2>&1
eval_tap $? 263 'SendMFAAuthenticationCode' test.out

#- 264 Change2faMethod
./ng net.accelbyte.sdk.cli.Main iam change2faMethod \
    --factor 'sCZcCRLN' \
    --mfaToken 'PrP1s9K9' \
    > test.out 2>&1
eval_tap $? 264 'Change2faMethod' test.out

#- 265 Verify2faCode
./ng net.accelbyte.sdk.cli.Main iam verify2faCode \
    --code 'b6ilqptg' \
    --factor 'WfwTgzpG' \
    --mfaToken 'ohlXTqSH' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 265 'Verify2faCode' test.out

#- 266 Verify2faCodeForward
./ng net.accelbyte.sdk.cli.Main iam verify2faCodeForward \
    --defaultFactor 'iwImYAFI' \
    --factors 'xFy21I4O' \
    --rememberDevice  \
    --clientId 'KT7V6vqP' \
    --code 'TQ3KXti1' \
    --factor 'u3n70dpq' \
    --mfaToken 'pb43g1iJ' \
    > test.out 2>&1
eval_tap $? 266 'Verify2faCodeForward' test.out

#- 267 OAuthDynamicClientRegisterWithNamespaceV3
./ng net.accelbyte.sdk.cli.Main iam oAuthDynamicClientRegisterWithNamespaceV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"client_name": "cDElrj2u", "client_uri": "lpfzylDm", "grant_types": ["3ehl4OOy", "kn8Y8IJa", "nohtfwZ4"], "redirect_uris": ["LvY4QQw5", "2TWKJJSq", "aUtuH72p"], "response_types": ["9CVV33I2", "NA0Qg8UK", "1oyutLhV"], "scopes": ["bJvQiiTk", "TSrJ96Uz", "Mv5vCS1U"], "token_endpoint_auth_method": "E87ijWSq"}' \
    > test.out 2>&1
eval_tap $? 267 'OAuthDynamicClientRegisterWithNamespaceV3' test.out

#- 268 RetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam retrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'gyTn7gSP' \
    --userId 'DXQgE3HR' \
    > test.out 2>&1
eval_tap $? 268 'RetrieveUserThirdPartyPlatformTokenV3' test.out

#- 269 AuthCodeRequestV3
./ng net.accelbyte.sdk.cli.Main iam authCodeRequestV3 \
    --platformId '5EVu3GnU' \
    --clientId 'ZalrauqD' \
    --redirectUri '1Dwv1w8P' \
    --requestId 'IESqt9t8' \
    > test.out 2>&1
eval_tap $? 269 'AuthCodeRequestV3' test.out

#- 270 PlatformTokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV3 \
    --platformId 'oiOhXrkH' \
    --additionalData '4n0chm5E' \
    --clientId 'Dxr7zFsT' \
    --createHeadless  \
    --deviceId 'hz67G2pc' \
    --macAddress 'QBmhikKv' \
    --platformToken 'WoESTZ5S' \
    --serviceLabel '0.8982490629253371' \
    --skipSetCookie  \
    > test.out 2>&1
eval_tap $? 270 'PlatformTokenGrantV3' test.out

#- 271 GetRevocationListV3
./ng net.accelbyte.sdk.cli.Main iam getRevocationListV3 \
    > test.out 2>&1
eval_tap $? 271 'GetRevocationListV3' test.out

#- 272 TokenRevocationV3
./ng net.accelbyte.sdk.cli.Main iam tokenRevocationV3 \
    --token 'xc020ysY' \
    > test.out 2>&1
eval_tap $? 272 'TokenRevocationV3' test.out

#- 273 SimultaneousLoginV3
./ng net.accelbyte.sdk.cli.Main iam simultaneousLoginV3 \
    --simultaneousPlatform 'i4dcOggC' \
    --simultaneousTicket 'rrHfZp1o' \
    --nativePlatform 'epicgames' \
    --nativePlatformTicket 'P1bQ23Lb' \
    > test.out 2>&1
eval_tap $? 273 'SimultaneousLoginV3' test.out

#- 274 TokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV3 \
    --additionalData 'EZY1S8zS' \
    --clientId 'BtBrhvl6' \
    --clientSecret 'VFNEcZTG' \
    --code 'ZqA9O610' \
    --codeVerifier '3lrUyM3D' \
    --extendNamespace 'WsmpDf7p' \
    --extendExp  \
    --password 'usXxZ1LZ' \
    --redirectUri 'zzqT27Vk' \
    --refreshToken 'YlYSiwau' \
    --scope 'lZVn9wLH' \
    --username 'lrYrJYTm' \
    --grantType 'client_credentials' \
    > test.out 2>&1
eval_tap $? 274 'TokenGrantV3' test.out

#- 275 VerifyTokenV3
./ng net.accelbyte.sdk.cli.Main iam verifyTokenV3 \
    --token 'YTqeHg4X' \
    > test.out 2>&1
eval_tap $? 275 'VerifyTokenV3' test.out

#- 276 PlatformAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticationV3 \
    --platformId 'r32Rr3bh' \
    --code 'oEhd9A4z' \
    --error 'qOdJ9Jsu' \
    --openidAssocHandle 'PNNG92E7' \
    --openidClaimedId 'uNqluauj' \
    --openidIdentity 'X34ScmXY' \
    --openidMode 'i1kwQCj8' \
    --openidNs '9FXqaHrr' \
    --openidOpEndpoint 'YT5xiYIc' \
    --openidResponseNonce '5sTiKMMN' \
    --openidReturnTo 'ANEvByaW' \
    --openidSig '2al532xk' \
    --openidSigned 'rlAumkXu' \
    --state '8MAlBByz' \
    > test.out 2>&1
eval_tap $? 276 'PlatformAuthenticationV3' test.out

#- 277 PlatformTokenRefreshV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenRefreshV3 \
    --platformId 'fYSytROm' \
    --platformToken '918b1Jnt' \
    > test.out 2>&1
eval_tap $? 277 'PlatformTokenRefreshV3' test.out

#- 278 PublicGetInputValidations
eval_tap 0 278 'PublicGetInputValidations # SKIP deprecated' test.out

#- 279 PublicGetInputValidationByField
eval_tap 0 279 'PublicGetInputValidationByField # SKIP deprecated' test.out

#- 280 PublicGetCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam publicGetCountryAgeRestrictionV3 \
    --countryCode 'pf1NGnn0' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 280 'PublicGetCountryAgeRestrictionV3' test.out

#- 281 PublicGetConfigValueV3
./ng net.accelbyte.sdk.cli.Main iam publicGetConfigValueV3 \
    --configKey 'A9Fe7na0' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 281 'PublicGetConfigValueV3' test.out

#- 282 PublicGetCountryListV3
./ng net.accelbyte.sdk.cli.Main iam publicGetCountryListV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 282 'PublicGetCountryListV3' test.out

#- 283 PublicGetNamespaceScopedInputValidations
./ng net.accelbyte.sdk.cli.Main iam publicGetNamespaceScopedInputValidations \
    --namespace "$AB_NAMESPACE" \
    --defaultOnEmpty  \
    --languageCode 'Ncwu99AZ' \
    > test.out 2>&1
eval_tap $? 283 'PublicGetNamespaceScopedInputValidations' test.out

#- 284 PublicGetNamespaceScopedInputValidationByField
./ng net.accelbyte.sdk.cli.Main iam publicGetNamespaceScopedInputValidationByField \
    --field 'EOQ5Cv6b' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 284 'PublicGetNamespaceScopedInputValidationByField' test.out

#- 285 RetrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3
./ng net.accelbyte.sdk.cli.Main iam retrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 285 'RetrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3' test.out

#- 286 RetrieveActiveOIDCClientsPublicV3
./ng net.accelbyte.sdk.cli.Main iam retrieveActiveOIDCClientsPublicV3 \
    --namespace "$AB_NAMESPACE" \
    --clientId 'MFaEdmMA' \
    > test.out 2>&1
eval_tap $? 286 'RetrieveActiveOIDCClientsPublicV3' test.out

#- 287 PublicListUserIDByPlatformUserIDsV3
eval_tap 0 287 'PublicListUserIDByPlatformUserIDsV3 # SKIP deprecated' test.out

#- 288 PublicGetUserByPlatformUserIDV3
eval_tap 0 288 'PublicGetUserByPlatformUserIDV3 # SKIP deprecated' test.out

#- 289 PublicGetProfileUpdateStrategyV3
./ng net.accelbyte.sdk.cli.Main iam publicGetProfileUpdateStrategyV3 \
    --namespace "$AB_NAMESPACE" \
    --field 'country' \
    > test.out 2>&1
eval_tap $? 289 'PublicGetProfileUpdateStrategyV3' test.out

#- 290 PublicGetAsyncStatus
./ng net.accelbyte.sdk.cli.Main iam publicGetAsyncStatus \
    --namespace "$AB_NAMESPACE" \
    --requestId 'YeeDEa7u' \
    > test.out 2>&1
eval_tap $? 290 'PublicGetAsyncStatus' test.out

#- 291 PublicSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam publicSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'arF9YZmE' \
    --limit '13' \
    --offset '29' \
    --platformBy '01rd9qIs' \
    --platformId 'FBh9b8dE' \
    --query 'FbeM7QG9' \
    > test.out 2>&1
eval_tap $? 291 'PublicSearchUserV3' test.out

#- 292 PublicCreateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "qnTVOXvL", "acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "OQGYpVva", "policyId": "G7ygeCUc", "policyVersionId": "FZeZpjyp"}, {"isAccepted": true, "localizedPolicyVersionId": "Xr3B0RzR", "policyId": "5boKD5w6", "policyVersionId": "f3AjmA8X"}, {"isAccepted": true, "localizedPolicyVersionId": "x6mzajWk", "policyId": "mjV5SFgT", "policyVersionId": "2ZmxnPZA"}], "authType": "6cdByqLI", "code": "IV2XykiT", "country": "reB6Bgzu", "dateOfBirth": "9trNKTYA", "displayName": "t9Ghfu6y", "emailAddress": "2wgycsob", "password": "M1X7dHbU", "reachMinimumAge": true, "uniqueDisplayName": "lBSIzCox"}' \
    > test.out 2>&1
eval_tap $? 292 'PublicCreateUserV3' test.out

#- 293 CheckUserAvailability
./ng net.accelbyte.sdk.cli.Main iam checkUserAvailability \
    --namespace "$AB_NAMESPACE" \
    --field 'xfNEfAAL' \
    --query '2j6BAjSa' \
    > test.out 2>&1
eval_tap $? 293 'CheckUserAvailability' test.out

#- 294 PublicBulkGetUsers
eval_tap 0 294 'PublicBulkGetUsers # SKIP deprecated' test.out

#- 295 PublicSendRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicSendRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "ZaHw7EHe", "languageTag": "ZmUQvReq"}' \
    > test.out 2>&1
eval_tap $? 295 'PublicSendRegistrationCode' test.out

#- 296 PublicVerifyRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicVerifyRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "klVBvDJE", "emailAddress": "1V0IWm61"}' \
    > test.out 2>&1
eval_tap $? 296 'PublicVerifyRegistrationCode' test.out

#- 297 PublicForgotPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicForgotPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "5G5d5CEg", "languageTag": "uITqBBej"}' \
    > test.out 2>&1
eval_tap $? 297 'PublicForgotPasswordV3' test.out

#- 298 PublicValidateUserInput
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserInput \
    --namespace "$AB_NAMESPACE" \
    --body '{"displayName": "G4hDteFb", "password": "wGz35rhk", "uniqueDisplayName": "1tRGBfmO", "username": "sybFbCHu"}' \
    > test.out 2>&1
eval_tap $? 298 'PublicValidateUserInput' test.out

#- 299 GetAdminInvitationV3
./ng net.accelbyte.sdk.cli.Main iam getAdminInvitationV3 \
    --invitationId '1dTk8BEb' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 299 'GetAdminInvitationV3' test.out

#- 300 CreateUserFromInvitationV3
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV3 \
    --invitationId 'EXF1kUGP' \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "LSwUlHWF", "acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "5XMmwWVV", "policyId": "alJpFjiR", "policyVersionId": "ABBqIPb4"}, {"isAccepted": true, "localizedPolicyVersionId": "u1B9Dbeo", "policyId": "Lrv33eN0", "policyVersionId": "BRtPKixJ"}, {"isAccepted": true, "localizedPolicyVersionId": "IRog62y3", "policyId": "w76eQHFR", "policyVersionId": "Pnp038tc"}], "authType": "YYor1qfs", "code": "lKro1z7V", "country": "IW0a8ekV", "dateOfBirth": "xHIzQaNm", "displayName": "cQnYEXA3", "emailAddress": "TnHxnmyO", "password": "5ultCGY4", "reachMinimumAge": true, "uniqueDisplayName": "7AX8n9YV"}' \
    > test.out 2>&1
eval_tap $? 300 'CreateUserFromInvitationV3' test.out

#- 301 UpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam updateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "dtUyOn0i", "country": "PBbUw4oQ", "dateOfBirth": "ijcBVmXI", "displayName": "0Msb7S0Z", "languageTag": "pZnFuukQ", "uniqueDisplayName": "3pTH4WPe", "userName": "bZZJDHHg"}' \
    > test.out 2>&1
eval_tap $? 301 'UpdateUserV3' test.out

#- 302 PublicPartialUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicPartialUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "s0npjgkz", "country": "xAV2fvls", "dateOfBirth": "iAwngD1A", "displayName": "OTgWCgh0", "languageTag": "KHQ3gwGt", "uniqueDisplayName": "VnqOGvut", "userName": "ueVWXOye"}' \
    > test.out 2>&1
eval_tap $? 302 'PublicPartialUpdateUserV3' test.out

#- 303 PublicSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"context": "mGlwbvn0", "emailAddress": "dv0LM58x", "languageTag": "uBvzMP9L", "upgradeToken": "1sH57HVg"}' \
    > test.out 2>&1
eval_tap $? 303 'PublicSendVerificationCodeV3' test.out

#- 304 PublicUserVerificationV3
./ng net.accelbyte.sdk.cli.Main iam publicUserVerificationV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "wRJVWg9o", "contactType": "SmThoqCD", "languageTag": "MwZRxkwt", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 304 'PublicUserVerificationV3' test.out

#- 305 PublicUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "Euf5O5jW", "country": "6WfRnMBg", "dateOfBirth": "FNbQxQS0", "displayName": "UN5Mbi5a", "emailAddress": "anFK6Jcr", "password": "ej6ZREZH", "uniqueDisplayName": "3uoLnhcO", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 305 'PublicUpgradeHeadlessAccountV3' test.out

#- 306 PublicVerifyHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --needVerificationCode  \
    --body '{"emailAddress": "FzUMxcpL", "password": "XlWrFkia"}' \
    > test.out 2>&1
eval_tap $? 306 'PublicVerifyHeadlessAccountV3' test.out

#- 307 PublicUpdatePasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicUpdatePasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"languageTag": "PImGz7E9", "mfaToken": "U9YFElF8", "newPassword": "AifbBrNW", "oldPassword": "PQ7m9sfN"}' \
    > test.out 2>&1
eval_tap $? 307 'PublicUpdatePasswordV3' test.out

#- 308 PublicCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam publicCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'TDlsDtNk' \
    > test.out 2>&1
eval_tap $? 308 'PublicCreateJusticeUser' test.out

#- 309 PublicPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'QuClJGJc' \
    --redirectUri '8vSR8OVp' \
    --ticket 'PvHNcMxK' \
    > test.out 2>&1
eval_tap $? 309 'PublicPlatformLinkV3' test.out

#- 310 PublicPlatformUnlinkV3
eval_tap 0 310 'PublicPlatformUnlinkV3 # SKIP deprecated' test.out

#- 311 PublicPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '2LX8Pb9D' \
    > test.out 2>&1
eval_tap $? 311 'PublicPlatformUnlinkAllV3' test.out

#- 312 PublicForcePlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicForcePlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'kqBoAacA' \
    --ticket 'KgNOziTZ' \
    > test.out 2>&1
eval_tap $? 312 'PublicForcePlatformLinkV3' test.out

#- 313 PublicWebLinkPlatform
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatform \
    --namespace "$AB_NAMESPACE" \
    --platformId 'ueBHkDZA' \
    --clientId 'wMgAIVUQ' \
    --redirectUri 'KlF5VTYM' \
    > test.out 2>&1
eval_tap $? 313 'PublicWebLinkPlatform' test.out

#- 314 PublicWebLinkPlatformEstablish
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatformEstablish \
    --namespace "$AB_NAMESPACE" \
    --platformId 'uOaVoKwl' \
    --code 'nXncJQRc' \
    --state 'pUAwQAT1' \
    > test.out 2>&1
eval_tap $? 314 'PublicWebLinkPlatformEstablish' test.out

#- 315 PublicProcessWebLinkPlatformV3
./ng net.accelbyte.sdk.cli.Main iam publicProcessWebLinkPlatformV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'D8ofiWWn' \
    --code '6fFWbgG9' \
    --state 'GYbNIf9s' \
    > test.out 2>&1
eval_tap $? 315 'PublicProcessWebLinkPlatformV3' test.out

#- 316 PublicGetUsersPlatformInfosV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUsersPlatformInfosV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"platformId": "7RWz1uU5", "userIds": ["JKLQHv3y", "y2W8lNaR", "2tBK5GT9"]}' \
    > test.out 2>&1
eval_tap $? 316 'PublicGetUsersPlatformInfosV3' test.out

#- 317 ResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam resetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientId": "hJENkn25", "code": "ZcMAJqtM", "emailAddress": "Pg0kK4Ev", "languageTag": "VYrbcC5y", "newPassword": "IWnRbtQQ"}' \
    > test.out 2>&1
eval_tap $? 317 'ResetPasswordV3' test.out

#- 318 PublicGetUserByUserIdV3
eval_tap 0 318 'PublicGetUserByUserIdV3 # SKIP deprecated' test.out

#- 319 PublicGetUserBanHistoryV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserBanHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'qide0ZGt' \
    --activeOnly  \
    --limit '42' \
    --offset '63' \
    > test.out 2>&1
eval_tap $? 319 'PublicGetUserBanHistoryV3' test.out

#- 320 PublicListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '7EiRyWNa' \
    > test.out 2>&1
eval_tap $? 320 'PublicListUserAllPlatformAccountsDistinctV3' test.out

#- 321 PublicGetUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'd8lpBJLD' \
    > test.out 2>&1
eval_tap $? 321 'PublicGetUserInformationV3' test.out

#- 322 PublicGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '8bdxf8pT' \
    --after '0.34269867473620874' \
    --before '0.5557544347423994' \
    --limit '12' \
    > test.out 2>&1
eval_tap $? 322 'PublicGetUserLoginHistoriesV3' test.out

#- 323 PublicGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '9fyiuyRb' \
    --after 'TdfHN1UG' \
    --before 'qQMKwVb9' \
    --limit '2' \
    --platformId 'kWAB0Mma' \
    > test.out 2>&1
eval_tap $? 323 'PublicGetUserPlatformAccountsV3' test.out

#- 324 PublicListJusticePlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicListJusticePlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '9nsgmA2u' \
    > test.out 2>&1
eval_tap $? 324 'PublicListJusticePlatformAccountsV3' test.out

#- 325 PublicLinkPlatformAccount
eval_tap 0 325 'PublicLinkPlatformAccount # SKIP deprecated' test.out

#- 326 PublicForceLinkPlatformWithProgression
./ng net.accelbyte.sdk.cli.Main iam publicForceLinkPlatformWithProgression \
    --namespace "$AB_NAMESPACE" \
    --userId 'kg4aZOWJ' \
    --body '{"chosenNamespaces": ["MwZTzkhP", "1J9o1aAO", "YWN1lLJS"], "requestId": "9FhXxdkr"}' \
    > test.out 2>&1
eval_tap $? 326 'PublicForceLinkPlatformWithProgression' test.out

#- 327 PublicGetPublisherUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetPublisherUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'AKnrCYn4' \
    > test.out 2>&1
eval_tap $? 327 'PublicGetPublisherUserV3' test.out

#- 328 PublicValidateUserByUserIDAndPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserByUserIDAndPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'g1QE4Y8F' \
    --password 'mo2JIliR' \
    > test.out 2>&1
eval_tap $? 328 'PublicValidateUserByUserIDAndPasswordV3' test.out

#- 329 PublicGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRolesV3 \
    --after 'Gg8d9SxI' \
    --before 'Sapss1EG' \
    --isWildcard  \
    --limit '82' \
    > test.out 2>&1
eval_tap $? 329 'PublicGetRolesV3' test.out

#- 330 PublicGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRoleV3 \
    --roleId 'Zd0Jlt26' \
    > test.out 2>&1
eval_tap $? 330 'PublicGetRoleV3' test.out

#- 331 PublicForgotPasswordWithoutNamespaceV3
./ng net.accelbyte.sdk.cli.Main iam publicForgotPasswordWithoutNamespaceV3 \
    --body '{"clientId": "x7IufRt2", "emailAddress": "BLPnVQE3", "languageTag": "wcnnTwPR"}' \
    > test.out 2>&1
eval_tap $? 331 'PublicForgotPasswordWithoutNamespaceV3' test.out

#- 332 PublicGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyUserV3 \
    --includeAllPlatforms  \
    > test.out 2>&1
eval_tap $? 332 'PublicGetMyUserV3' test.out

#- 333 PublicSendCodeForwardV3
./ng net.accelbyte.sdk.cli.Main iam publicSendCodeForwardV3 \
    --body '{"context": "6SVxebok", "emailAddress": "QBQtrqRw", "languageTag": "DXQMutqE", "upgradeToken": "ca9U6Bt8"}' \
    > test.out 2>&1
eval_tap $? 333 'PublicSendCodeForwardV3' test.out

#- 334 PublicGetLinkHeadlessAccountToMyAccountConflictV3
./ng net.accelbyte.sdk.cli.Main iam publicGetLinkHeadlessAccountToMyAccountConflictV3 \
    --oneTimeLinkCode 'n3wjGzac' \
    > test.out 2>&1
eval_tap $? 334 'PublicGetLinkHeadlessAccountToMyAccountConflictV3' test.out

#- 335 LinkHeadlessAccountToMyAccountV3
./ng net.accelbyte.sdk.cli.Main iam linkHeadlessAccountToMyAccountV3 \
    --body '{"chosenNamespaces": ["j1pMyNKJ", "FwUgpTYW", "xcFYULTg"], "oneTimeLinkCode": "ttp6i2Sh"}' \
    > test.out 2>&1
eval_tap $? 335 'LinkHeadlessAccountToMyAccountV3' test.out

#- 336 PublicGetMyRedirectionAfterLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyRedirectionAfterLinkV3 \
    --oneTimeLinkCode 'jwr6dCug' \
    > test.out 2>&1
eval_tap $? 336 'PublicGetMyRedirectionAfterLinkV3' test.out

#- 337 PublicGetMyProfileAllowUpdateStatusV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyProfileAllowUpdateStatusV3 \
    > test.out 2>&1
eval_tap $? 337 'PublicGetMyProfileAllowUpdateStatusV3' test.out

#- 338 PublicSendVerificationLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationLinkV3 \
    --body '{"languageTag": "VzPtI8wW"}' \
    > test.out 2>&1
eval_tap $? 338 'PublicSendVerificationLinkV3' test.out

#- 339 PublicGetOpenidUserInfoV3
./ng net.accelbyte.sdk.cli.Main iam publicGetOpenidUserInfoV3 \
    > test.out 2>&1
eval_tap $? 339 'PublicGetOpenidUserInfoV3' test.out

#- 340 PublicVerifyUserByLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyUserByLinkV3 \
    --code 'F70UNLj2' \
    > test.out 2>&1
eval_tap $? 340 'PublicVerifyUserByLinkV3' test.out

#- 341 PlatformAuthenticateSAMLV3Handler
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticateSAMLV3Handler \
    --platformId 'k5cu8yiu' \
    --code 'XgcR0mMS' \
    --error '4DDFkEGy' \
    --state 'jLDiWroo' \
    > test.out 2>&1
eval_tap $? 341 'PlatformAuthenticateSAMLV3Handler' test.out

#- 342 LoginSSOClient
./ng net.accelbyte.sdk.cli.Main iam loginSSOClient \
    --platformId 'SikWhICj' \
    --payload 'Z672E6rp' \
    > test.out 2>&1
eval_tap $? 342 'LoginSSOClient' test.out

#- 343 LogoutSSOClient
./ng net.accelbyte.sdk.cli.Main iam logoutSSOClient \
    --platformId 'x5k0ywWG' \
    > test.out 2>&1
eval_tap $? 343 'LogoutSSOClient' test.out

#- 344 RequestTargetTokenResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTargetTokenResponseV3 \
    --additionalData 'b5DCxLAu' \
    --code 'ZISk9g8H' \
    > test.out 2>&1
eval_tap $? 344 'RequestTargetTokenResponseV3' test.out

#- 345 UpgradeAndAuthenticateForwardV3
./ng net.accelbyte.sdk.cli.Main iam upgradeAndAuthenticateForwardV3 \
    --clientId 'k7i5HVRb' \
    --upgradeSuccessToken 'uQjUi1yh' \
    > test.out 2>&1
eval_tap $? 345 'UpgradeAndAuthenticateForwardV3' test.out

#- 346 AdminListInvitationHistoriesV4
./ng net.accelbyte.sdk.cli.Main iam adminListInvitationHistoriesV4 \
    --limit '58' \
    --namespace "$AB_NAMESPACE" \
    --offset '77' \
    > test.out 2>&1
eval_tap $? 346 'AdminListInvitationHistoriesV4' test.out

#- 347 AdminGetDevicesByUserV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDevicesByUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '8uaGflRO' \
    > test.out 2>&1
eval_tap $? 347 'AdminGetDevicesByUserV4' test.out

#- 348 AdminGetBannedDevicesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedDevicesV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceType 'C0MJQ9HT' \
    --endDate 'fd1WPC6o' \
    --limit '83' \
    --offset '97' \
    --startDate 'wp2UO1Hy' \
    > test.out 2>&1
eval_tap $? 348 'AdminGetBannedDevicesV4' test.out

#- 349 AdminGetUserDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeviceBansV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '4z6NW3lk' \
    > test.out 2>&1
eval_tap $? 349 'AdminGetUserDeviceBansV4' test.out

#- 350 AdminBanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminBanDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"comment": "vFlZq3Ca", "deviceId": "HfwwqfJK", "deviceType": "XON39DPh", "enabled": true, "endDate": "EzpG36Cl", "ext": {"L1BBAD4X": {}, "WFbReJx7": {}, "BwideAOs": {}}, "reason": "XpjNkc8D"}' \
    > test.out 2>&1
eval_tap $? 350 'AdminBanDeviceV4' test.out

#- 351 AdminGetDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBanV4 \
    --banId 'B7YFyY5V' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 351 'AdminGetDeviceBanV4' test.out

#- 352 AdminUpdateDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateDeviceBanV4 \
    --banId 'zcmOS7NI' \
    --namespace "$AB_NAMESPACE" \
    --body '{"enabled": true}' \
    > test.out 2>&1
eval_tap $? 352 'AdminUpdateDeviceBanV4' test.out

#- 353 AdminGenerateReportV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateReportV4 \
    --namespace "$AB_NAMESPACE" \
    --endDate 'SqOKEa8n' \
    --startDate 'cDAllOOO' \
    --deviceType 'M8H9AEWK' \
    > test.out 2>&1
eval_tap $? 353 'AdminGenerateReportV4' test.out

#- 354 AdminGetDeviceTypesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceTypesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 354 'AdminGetDeviceTypesV4' test.out

#- 355 AdminGetDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBansV4 \
    --deviceId 'OLM3UGUn' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 355 'AdminGetDeviceBansV4' test.out

#- 356 AdminDecryptDeviceV4
eval_tap 0 356 'AdminDecryptDeviceV4 # SKIP deprecated' test.out

#- 357 AdminUnbanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminUnbanDeviceV4 \
    --deviceId 'qul2HzaY' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 357 'AdminUnbanDeviceV4' test.out

#- 358 AdminGetUsersByDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUsersByDeviceV4 \
    --deviceId 'gxjxDqWE' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 358 'AdminGetUsersByDeviceV4' test.out

#- 359 AdminGetNamespaceInvitationHistoryV4
./ng net.accelbyte.sdk.cli.Main iam adminGetNamespaceInvitationHistoryV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 359 'AdminGetNamespaceInvitationHistoryV4' test.out

#- 360 AdminGetNamespaceUserInvitationHistoryV4
./ng net.accelbyte.sdk.cli.Main iam adminGetNamespaceUserInvitationHistoryV4 \
    --namespace "$AB_NAMESPACE" \
    --limit '59' \
    --offset '51' \
    > test.out 2>&1
eval_tap $? 360 'AdminGetNamespaceUserInvitationHistoryV4' test.out

#- 361 AdminCreateTestUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateTestUsersV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "Bjw0faCA", "policyId": "p6V6UTRC", "policyVersionId": "kfwSlM94"}, {"isAccepted": true, "localizedPolicyVersionId": "7J4yzrRA", "policyId": "LvOCgSOD", "policyVersionId": "ItDpE6ZO"}, {"isAccepted": true, "localizedPolicyVersionId": "bwyEe2Sq", "policyId": "gyOp2oR1", "policyVersionId": "u7vVxXrj"}], "count": 52, "userInfo": {"country": "hgloRsnM"}}' \
    > test.out 2>&1
eval_tap $? 361 'AdminCreateTestUsersV4' test.out

#- 362 AdminCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "9aPGUIUq", "policyId": "IMsfzg2o", "policyVersionId": "ti2vu88t"}, {"isAccepted": false, "localizedPolicyVersionId": "MOsrv69N", "policyId": "PXTgnquY", "policyVersionId": "XmtkwCf8"}, {"isAccepted": false, "localizedPolicyVersionId": "ABqCpoGb", "policyId": "aWsISBfV", "policyVersionId": "4rFrqyhP"}], "authType": "EMAILPASSWD", "code": "xYcN19Mh", "country": "Kg4Kb2Pn", "dateOfBirth": "OeE1FhEF", "displayName": "nnFbB3QB", "emailAddress": "OqMG2qy1", "password": "xhpxHHC5", "passwordMD5Sum": "gFdtdtyB", "reachMinimumAge": false, "uniqueDisplayName": "OmbypKSC", "username": "MahFNZ9z"}' \
    > test.out 2>&1
eval_tap $? 362 'AdminCreateUserV4' test.out

#- 363 AdminBulkUpdateUserAccountTypeV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateUserAccountTypeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"testAccount": false, "userIds": ["wApbPraQ", "ERt4gu3A", "CBzGO9IN"]}' \
    > test.out 2>&1
eval_tap $? 363 'AdminBulkUpdateUserAccountTypeV4' test.out

#- 364 AdminBulkCheckValidUserIDV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkCheckValidUserIDV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["OWeilW9r", "JDzW8JNj", "kq76qHYW"]}' \
    > test.out 2>&1
eval_tap $? 364 'AdminBulkCheckValidUserIDV4' test.out

#- 365 AdminUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'rPMtmYeO' \
    --body '{"avatarUrl": "EUDi8Y4N", "country": "AaFGRCPR", "dateOfBirth": "kfKb5z0t", "displayName": "vAPiYNuB", "languageTag": "Eikomj17", "skipLoginQueue": true, "tags": ["zaTbayFZ", "ttN2eo1M", "ih3YGWsg"], "uniqueDisplayName": "9rAQIDWB", "userName": "VMp2lAOA"}' \
    > test.out 2>&1
eval_tap $? 365 'AdminUpdateUserV4' test.out

#- 366 AdminUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'yZ4VUPwN' \
    --body '{"code": "oVIKNCPE", "emailAddress": "XCkD7B0m"}' \
    > test.out 2>&1
eval_tap $? 366 'AdminUpdateUserEmailAddressV4' test.out

#- 367 AdminDisableUserMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableUserMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'N1GSsdiM' \
    --body '{"factor": "5LyJZoGe", "mfaToken": "QTFaFbJ7"}' \
    > test.out 2>&1
eval_tap $? 367 'AdminDisableUserMFAV4' test.out

#- 368 AdminGetUserMFAStatusV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUserMFAStatusV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'cRfTsWxo' \
    > test.out 2>&1
eval_tap $? 368 'AdminGetUserMFAStatusV4' test.out

#- 369 AdminListUserRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminListUserRolesV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'arYgj942' \
    > test.out 2>&1
eval_tap $? 369 'AdminListUserRolesV4' test.out

#- 370 AdminUpdateUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'EtPWijnI' \
    --body '{"assignedNamespaces": ["v24L4SNr", "CyL6CBJd", "HsvHwU8o"], "roleId": "1K1cNirY"}' \
    > test.out 2>&1
eval_tap $? 370 'AdminUpdateUserRoleV4' test.out

#- 371 AdminAddUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'VeEDah2u' \
    --body '{"assignedNamespaces": ["tP1LuIey", "W4GMueO4", "LmkZC8vo"], "roleId": "LsMxWIvo"}' \
    > test.out 2>&1
eval_tap $? 371 'AdminAddUserRoleV4' test.out

#- 372 AdminRemoveUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRemoveUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZbVUUIEd' \
    --body '{"assignedNamespaces": ["iXNcUlXA", "xOawuoef", "ulBleUHl"], "roleId": "yAPOy53Y"}' \
    > test.out 2>&1
eval_tap $? 372 'AdminRemoveUserRoleV4' test.out

#- 373 AdminGetRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV4 \
    --adminRole  \
    --isWildcard  \
    --limit '6' \
    --offset '53' \
    > test.out 2>&1
eval_tap $? 373 'AdminGetRolesV4' test.out

#- 374 AdminCreateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV4 \
    --body '{"adminRole": false, "deletable": true, "isWildcard": true, "roleName": "AD6Wv9ea"}' \
    > test.out 2>&1
eval_tap $? 374 'AdminCreateRoleV4' test.out

#- 375 AdminGetRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV4 \
    --roleId 'VRariFDQ' \
    > test.out 2>&1
eval_tap $? 375 'AdminGetRoleV4' test.out

#- 376 AdminDeleteRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV4 \
    --roleId 'YQkO5U1h' \
    > test.out 2>&1
eval_tap $? 376 'AdminDeleteRoleV4' test.out

#- 377 AdminUpdateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV4 \
    --roleId 'McL32Ayq' \
    --body '{"adminRole": false, "deletable": false, "isWildcard": false, "roleName": "XBTRNOd8"}' \
    > test.out 2>&1
eval_tap $? 377 'AdminUpdateRoleV4' test.out

#- 378 AdminUpdateRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV4 \
    --roleId 'uhaWMEP8' \
    --body '{"permissions": [{"action": 17, "resource": "mlLtlr3Y", "schedAction": 60, "schedCron": "LeQR5JCN", "schedRange": ["PG9nWSE5", "bglHt5Lx", "yvHcbosa"]}, {"action": 41, "resource": "D0YMR4F0", "schedAction": 85, "schedCron": "JTp7ey9l", "schedRange": ["YZNnqf3c", "xxSWd87d", "hBqZS9hH"]}, {"action": 58, "resource": "ScYziRza", "schedAction": 60, "schedCron": "syDKdRbP", "schedRange": ["caXCNW8k", "IJe1zoQQ", "Idzaws0A"]}]}' \
    > test.out 2>&1
eval_tap $? 378 'AdminUpdateRolePermissionsV4' test.out

#- 379 AdminAddRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV4 \
    --roleId 'Du71TWpp' \
    --body '{"permissions": [{"action": 68, "resource": "oKuboU10", "schedAction": 73, "schedCron": "ozAM8duM", "schedRange": ["1g24eH4k", "DsbOasbg", "4iLEaavK"]}, {"action": 32, "resource": "TIi1oSve", "schedAction": 11, "schedCron": "0GPP0qaF", "schedRange": ["wGbBVvwv", "oatpcvBd", "h1BOKUAZ"]}, {"action": 10, "resource": "K0cYTwQy", "schedAction": 11, "schedCron": "EcHLBGzV", "schedRange": ["yJqLUqkF", "EDuFz7tj", "MesRhIYw"]}]}' \
    > test.out 2>&1
eval_tap $? 379 'AdminAddRolePermissionsV4' test.out

#- 380 AdminDeleteRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV4 \
    --roleId 'N4mBbxa6' \
    --body '["YOq7rLtH", "7Hn05SSS", "2ZolX30Z"]' \
    > test.out 2>&1
eval_tap $? 380 'AdminDeleteRolePermissionsV4' test.out

#- 381 AdminListAssignedUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminListAssignedUsersV4 \
    --roleId 'ChjDn7Zk' \
    --after 'thvZNBIS' \
    --before 'QlIqC3ON' \
    --limit '65' \
    > test.out 2>&1
eval_tap $? 381 'AdminListAssignedUsersV4' test.out

#- 382 AdminAssignUserToRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAssignUserToRoleV4 \
    --roleId '7WGOKQ4Q' \
    --body '{"assignedNamespaces": ["CShRxSR9", "FJ1M5UqD", "QuMs5Pnb"], "namespace": "FFoJSuZX", "userId": "04cU75Rd"}' \
    > test.out 2>&1
eval_tap $? 382 'AdminAssignUserToRoleV4' test.out

#- 383 AdminRevokeUserFromRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRevokeUserFromRoleV4 \
    --roleId 'MRFYVFKL' \
    --body '{"namespace": "KSSg5ooa", "userId": "Qp0l7vI8"}' \
    > test.out 2>&1
eval_tap $? 383 'AdminRevokeUserFromRoleV4' test.out

#- 384 AdminInviteUserNewV4
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserNewV4 \
    --body '{"assignedNamespaces": ["8Zwa5AkO", "Q74MAYvc", "5oIFJzc7"], "emailAddresses": ["mwWwZKyd", "dPAxtnd3", "wFhEgFXY"], "isAdmin": true, "isNewStudio": true, "languageTag": "pOSncSEm", "namespace": "bAwfhYI6", "roleId": "3wQc9P7I"}' \
    > test.out 2>&1
eval_tap $? 384 'AdminInviteUserNewV4' test.out

#- 385 AdminUpdateMyUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateMyUserV4 \
    --body '{"avatarUrl": "tLaYEJpm", "country": "5tjLCYA8", "dateOfBirth": "NLXb2i57", "displayName": "tGCsfXYl", "languageTag": "uqWYlUhB", "skipLoginQueue": true, "tags": ["AYguyD3h", "nhPHRvJt", "b55cVkPa"], "uniqueDisplayName": "FFwgaj1P", "userName": "ZnUnqW7B"}' \
    > test.out 2>&1
eval_tap $? 385 'AdminUpdateMyUserV4' test.out

#- 386 AdminDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyAuthenticatorV4 \
    --body '{"factor": "Mkir35Fq", "mfaToken": "pFm9MTS4"}' \
    > test.out 2>&1
eval_tap $? 386 'AdminDisableMyAuthenticatorV4' test.out

#- 387 AdminEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyAuthenticatorV4 \
    --code '909cagnH' \
    > test.out 2>&1
eval_tap $? 387 'AdminEnableMyAuthenticatorV4' test.out

#- 388 AdminGenerateMyAuthenticatorKeyV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateMyAuthenticatorKeyV4 \
    > test.out 2>&1
eval_tap $? 388 'AdminGenerateMyAuthenticatorKeyV4' test.out

#- 389 AdminGetMyBackupCodesV4
eval_tap 0 389 'AdminGetMyBackupCodesV4 # SKIP deprecated' test.out

#- 390 AdminGenerateMyBackupCodesV4
eval_tap 0 390 'AdminGenerateMyBackupCodesV4 # SKIP deprecated' test.out

#- 391 AdminDisableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyBackupCodesV4 \
    --body '{"factor": "YpG7X2US", "mfaToken": "7zQIdAeZ"}' \
    > test.out 2>&1
eval_tap $? 391 'AdminDisableMyBackupCodesV4' test.out

#- 392 AdminDownloadMyBackupCodesV4
eval_tap 0 392 'AdminDownloadMyBackupCodesV4 # SKIP deprecated' test.out

#- 393 AdminEnableMyBackupCodesV4
eval_tap 0 393 'AdminEnableMyBackupCodesV4 # SKIP deprecated' test.out

#- 394 AdminGetBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBackupCodesV4 \
    --languageTag 'veNIs0nA' \
    > test.out 2>&1
eval_tap $? 394 'AdminGetBackupCodesV4' test.out

#- 395 AdminGenerateBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateBackupCodesV4 \
    --languageTag 't9Atasbz' \
    > test.out 2>&1
eval_tap $? 395 'AdminGenerateBackupCodesV4' test.out

#- 396 AdminEnableBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableBackupCodesV4 \
    --languageTag 'tHnstjDI' \
    > test.out 2>&1
eval_tap $? 396 'AdminEnableBackupCodesV4' test.out

#- 397 AdminChallengeMyMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminChallengeMyMFAV4 \
    --code 'L1zUHKB7' \
    --factor '22vYzoD0' \
    > test.out 2>&1
eval_tap $? 397 'AdminChallengeMyMFAV4' test.out

#- 398 AdminSendMyMFAEmailCodeV4
./ng net.accelbyte.sdk.cli.Main iam adminSendMyMFAEmailCodeV4 \
    --action 'slvdOEsK' \
    --languageTag 'y5Ve9m6W' \
    > test.out 2>&1
eval_tap $? 398 'AdminSendMyMFAEmailCodeV4' test.out

#- 399 AdminDisableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyEmailV4 \
    --body '{"factor": "InELjmOV", "mfaToken": "KUH1UiOj"}' \
    > test.out 2>&1
eval_tap $? 399 'AdminDisableMyEmailV4' test.out

#- 400 AdminEnableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyEmailV4 \
    --code 'yyVyKy9d' \
    > test.out 2>&1
eval_tap $? 400 'AdminEnableMyEmailV4' test.out

#- 401 AdminGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyEnabledFactorsV4 \
    > test.out 2>&1
eval_tap $? 401 'AdminGetMyEnabledFactorsV4' test.out

#- 402 AdminMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam adminMakeFactorMyDefaultV4 \
    --factor '5d1NjZM3' \
    > test.out 2>&1
eval_tap $? 402 'AdminMakeFactorMyDefaultV4' test.out

#- 403 AdminGetMyOwnMFAStatusV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyOwnMFAStatusV4 \
    > test.out 2>&1
eval_tap $? 403 'AdminGetMyOwnMFAStatusV4' test.out

#- 404 AdminGetMyMFAStatusV4
eval_tap 0 404 'AdminGetMyMFAStatusV4 # SKIP deprecated' test.out

#- 405 AdminInviteUserV4
eval_tap 0 405 'AdminInviteUserV4 # SKIP deprecated' test.out

#- 406 AuthenticationWithPlatformLinkV4
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV4 \
    --extendExp  \
    --clientId 'OHDTTiZF' \
    --linkingToken '4RuEDyPj' \
    --password 'GWhZecsC' \
    --username 'lnz4JiYm' \
    > test.out 2>&1
eval_tap $? 406 'AuthenticationWithPlatformLinkV4' test.out

#- 407 GenerateTokenByNewHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV4 \
    --additionalData '5nyBE0fJ' \
    --extendExp  \
    --linkingToken 'SGpdqooa' \
    > test.out 2>&1
eval_tap $? 407 'GenerateTokenByNewHeadlessAccountV4' test.out

#- 408 Verify2faCodeV4
./ng net.accelbyte.sdk.cli.Main iam verify2faCodeV4 \
    --code 'wDHHpwBg' \
    --factor 'wG2Q4rwm' \
    --mfaToken 'oBTc1lDJ' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 408 'Verify2faCodeV4' test.out

#- 409 PlatformTokenGrantV4
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV4 \
    --platformId 'NcxgmUo3' \
    --codeChallenge 'IlcsfqCc' \
    --codeChallengeMethod 'plain' \
    --additionalData 'K8tsABA6' \
    --clientId 'gXDz1Fan' \
    --createHeadless  \
    --deviceId 'oqGKxRkl' \
    --macAddress 'RBqpebP7' \
    --platformToken 'qEjrT1E9' \
    --serviceLabel '0.7746617970512414' \
    --skipSetCookie  \
    > test.out 2>&1
eval_tap $? 409 'PlatformTokenGrantV4' test.out

#- 410 SimultaneousLoginV4
./ng net.accelbyte.sdk.cli.Main iam simultaneousLoginV4 \
    --codeChallenge 'VZxGjRey' \
    --codeChallengeMethod 'plain' \
    --simultaneousPlatform 'aISLYmUa' \
    --simultaneousTicket 'r5JxCBKl' \
    --nativePlatform 'steam' \
    --nativePlatformTicket '1tl5THVI' \
    > test.out 2>&1
eval_tap $? 410 'SimultaneousLoginV4' test.out

#- 411 TokenGrantV4
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV4 \
    --codeChallenge 's4kCBzji' \
    --codeChallengeMethod 'plain' \
    --additionalData 'zKUOvLHG' \
    --clientId 'prWcPxIc' \
    --clientSecret 'AaJre72s' \
    --code 'BPJ5tq6q' \
    --codeVerifier 'JDYssuOM' \
    --extendNamespace 'vWtkhgcy' \
    --extendExp  \
    --loginQueueTicket '3aGYO6Tc' \
    --password 'qu7Bw1mi' \
    --redirectUri 'KzjH7yRZ' \
    --refreshToken 'RCWDubxc' \
    --scope 'rcmpAcKv' \
    --username 'H0hYDliM' \
    --grantType 'refresh_token' \
    > test.out 2>&1
eval_tap $? 411 'TokenGrantV4' test.out

#- 412 RequestTargetTokenResponseV4
./ng net.accelbyte.sdk.cli.Main iam requestTargetTokenResponseV4 \
    --additionalData 'v9ozlir4' \
    --code 'ha8glu5d' \
    > test.out 2>&1
eval_tap $? 412 'RequestTargetTokenResponseV4' test.out

#- 413 PublicListUserIDByPlatformUserIDsV4
./ng net.accelbyte.sdk.cli.Main iam publicListUserIDByPlatformUserIDsV4 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'u3076RqW' \
    --rawPUID  \
    --body '{"pidType": "2aiVVMKD", "platformUserIds": ["Y4VAS24S", "dAgdrFcK", "UNST6GpC"]}' \
    > test.out 2>&1
eval_tap $? 413 'PublicListUserIDByPlatformUserIDsV4' test.out

#- 414 PublicGetUserByPlatformUserIDV4
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByPlatformUserIDV4 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'dAxw5EzI' \
    --platformUserId 'kcQw0bEc' \
    > test.out 2>&1
eval_tap $? 414 'PublicGetUserByPlatformUserIDV4' test.out

#- 415 PublicCreateTestUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateTestUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "IKZECUZH", "policyId": "q6KZq43H", "policyVersionId": "Ibk3oIvT"}, {"isAccepted": false, "localizedPolicyVersionId": "hNlcC7sU", "policyId": "gPeiGGNs", "policyVersionId": "rYzrb1cH"}, {"isAccepted": true, "localizedPolicyVersionId": "bdy2uyGL", "policyId": "CSMaJ3e9", "policyVersionId": "rqmJcbtV"}], "authType": "EMAILPASSWD", "country": "9AziNCzj", "dateOfBirth": "2bSPm5K0", "displayName": "ntZ0QYFm", "emailAddress": "Sj7UlJJF", "password": "Npx2Sbhb", "passwordMD5Sum": "bNfMOecB", "uniqueDisplayName": "WIn7DQVh", "username": "GR05OS8Z", "verified": true}' \
    > test.out 2>&1
eval_tap $? 415 'PublicCreateTestUserV4' test.out

#- 416 PublicCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "GfXMX1dG", "policyId": "zm5PXlDZ", "policyVersionId": "oLSfyDzb"}, {"isAccepted": true, "localizedPolicyVersionId": "HEdtqKm7", "policyId": "KB5yaOvQ", "policyVersionId": "5F3VGHeX"}, {"isAccepted": true, "localizedPolicyVersionId": "RuJzRRit", "policyId": "oEOusqPs", "policyVersionId": "FiZayQik"}], "authType": "EMAILPASSWD", "code": "0soWrQ4z", "country": "YFM65Y5n", "dateOfBirth": "8xPkSv1G", "displayName": "brOIiWc0", "emailAddress": "YnfrQjsJ", "password": "SOzrlCO7", "passwordMD5Sum": "UEAaXIKb", "reachMinimumAge": false, "uniqueDisplayName": "7Oh52GiP", "username": "j76NsyT2"}' \
    > test.out 2>&1
eval_tap $? 416 'PublicCreateUserV4' test.out

#- 417 CreateUserFromInvitationV4
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV4 \
    --invitationId 'BT7pn2uH' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "1wWD65Yr", "policyId": "dtWv4Dz0", "policyVersionId": "ZKtvrhCb"}, {"isAccepted": true, "localizedPolicyVersionId": "FWEwQ0cT", "policyId": "pV8WeQK5", "policyVersionId": "f2RIL57D"}, {"isAccepted": true, "localizedPolicyVersionId": "e88Ap4Cd", "policyId": "N1lRyStV", "policyVersionId": "RYgyMUf8"}], "authType": "EMAILPASSWD", "code": "nSRcgPQj", "country": "VvNz7Z9K", "dateOfBirth": "InnXbGid", "displayName": "n94uwqzn", "emailAddress": "FK2tq67A", "password": "aOCSnjhX", "passwordMD5Sum": "uR850Vj6", "reachMinimumAge": true, "uniqueDisplayName": "JRSCB3EP", "username": "LOa5dye6"}' \
    > test.out 2>&1
eval_tap $? 417 'CreateUserFromInvitationV4' test.out

#- 418 PublicUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "0OtOR5CN", "country": "1AxL35IW", "dateOfBirth": "dnvZYuRS", "displayName": "EAEw8f61", "languageTag": "hmbYuxDN", "uniqueDisplayName": "0UaFXSv6", "userName": "QyUJAeBK"}' \
    > test.out 2>&1
eval_tap $? 418 'PublicUpdateUserV4' test.out

#- 419 PublicUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "uZlBIy7V", "emailAddress": "ZJPg19JS"}' \
    > test.out 2>&1
eval_tap $? 419 'PublicUpdateUserEmailAddressV4' test.out

#- 420 PublicUpgradeHeadlessAccountWithVerificationCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountWithVerificationCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "v7ZPLoYC", "country": "uz4mFiw6", "dateOfBirth": "6DeQpxIc", "displayName": "0YVCjqS0", "emailAddress": "6yMtpca6", "password": "Set4XHnT", "reachMinimumAge": true, "uniqueDisplayName": "0zj0Nz9S", "username": "RS50CTth", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 420 'PublicUpgradeHeadlessAccountWithVerificationCodeV4' test.out

#- 421 PublicUpgradeHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"dateOfBirth": "M0F0rF9G", "displayName": "f9dwuQ2n", "emailAddress": "8GM6xDSX", "password": "nrpTmLJb", "uniqueDisplayName": "gy4189nN", "username": "eamtn4I6"}' \
    > test.out 2>&1
eval_tap $? 421 'PublicUpgradeHeadlessAccountV4' test.out

#- 422 PublicDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"factor": "dW2gukCe", "mfaToken": "dCgtqKIk"}' \
    > test.out 2>&1
eval_tap $? 422 'PublicDisableMyAuthenticatorV4' test.out

#- 423 PublicEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    --code '2Y70gMY6' \
    > test.out 2>&1
eval_tap $? 423 'PublicEnableMyAuthenticatorV4' test.out

#- 424 PublicGenerateMyAuthenticatorKeyV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateMyAuthenticatorKeyV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 424 'PublicGenerateMyAuthenticatorKeyV4' test.out

#- 425 PublicGetMyBackupCodesV4
eval_tap 0 425 'PublicGetMyBackupCodesV4 # SKIP deprecated' test.out

#- 426 PublicGenerateMyBackupCodesV4
eval_tap 0 426 'PublicGenerateMyBackupCodesV4 # SKIP deprecated' test.out

#- 427 PublicDisableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"factor": "MmGioMmb", "mfaToken": "ij95mzFv"}' \
    > test.out 2>&1
eval_tap $? 427 'PublicDisableMyBackupCodesV4' test.out

#- 428 PublicDownloadMyBackupCodesV4
eval_tap 0 428 'PublicDownloadMyBackupCodesV4 # SKIP deprecated' test.out

#- 429 PublicEnableMyBackupCodesV4
eval_tap 0 429 'PublicEnableMyBackupCodesV4 # SKIP deprecated' test.out

#- 430 PublicGetBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGetBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --languageTag 'HOgcyTKF' \
    > test.out 2>&1
eval_tap $? 430 'PublicGetBackupCodesV4' test.out

#- 431 PublicGenerateBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --languageTag 'pINgeFY1' \
    > test.out 2>&1
eval_tap $? 431 'PublicGenerateBackupCodesV4' test.out

#- 432 PublicEnableBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --languageTag 'RJd0znOt' \
    > test.out 2>&1
eval_tap $? 432 'PublicEnableBackupCodesV4' test.out

#- 433 PublicChallengeMyMFAV4
./ng net.accelbyte.sdk.cli.Main iam publicChallengeMyMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --code '2ReUTGlM' \
    --factor 'hPfzj8IV' \
    > test.out 2>&1
eval_tap $? 433 'PublicChallengeMyMFAV4' test.out

#- 434 PublicRemoveTrustedDeviceV4
./ng net.accelbyte.sdk.cli.Main iam publicRemoveTrustedDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceToken '8Rlsy9V6' \
    > test.out 2>&1
eval_tap $? 434 'PublicRemoveTrustedDeviceV4' test.out

#- 435 PublicSendMyMFAEmailCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicSendMyMFAEmailCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --action 'xjCay84u' \
    --languageTag 'eMXE3Bwp' \
    > test.out 2>&1
eval_tap $? 435 'PublicSendMyMFAEmailCodeV4' test.out

#- 436 PublicDisableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyEmailV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"factor": "8a1btQsz", "mfaToken": "YOnNZTmY"}' \
    > test.out 2>&1
eval_tap $? 436 'PublicDisableMyEmailV4' test.out

#- 437 PublicEnableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyEmailV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'pjd8CLRs' \
    > test.out 2>&1
eval_tap $? 437 'PublicEnableMyEmailV4' test.out

#- 438 PublicGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam publicGetMyEnabledFactorsV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 438 'PublicGetMyEnabledFactorsV4' test.out

#- 439 PublicMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam publicMakeFactorMyDefaultV4 \
    --namespace "$AB_NAMESPACE" \
    --factor 'xqwHeun2' \
    > test.out 2>&1
eval_tap $? 439 'PublicMakeFactorMyDefaultV4' test.out

#- 440 PublicGetMyOwnMFAStatusV4
./ng net.accelbyte.sdk.cli.Main iam publicGetMyOwnMFAStatusV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 440 'PublicGetMyOwnMFAStatusV4' test.out

#- 441 PublicGetMyMFAStatusV4
eval_tap 0 441 'PublicGetMyMFAStatusV4 # SKIP deprecated' test.out

#- 442 PublicGetUserPublicInfoByUserIdV4
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPublicInfoByUserIdV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'uE1wDXXW' \
    > test.out 2>&1
eval_tap $? 442 'PublicGetUserPublicInfoByUserIdV4' test.out

#- 443 PublicInviteUserV4
./ng net.accelbyte.sdk.cli.Main iam publicInviteUserV4 \
    --body '{"additionalData": "FjhfoL04", "emailAddress": "axW27uAr", "languageTag": "knllZ8on", "namespace": "NLXoivxZ", "namespaceDisplayName": "ki7nhvsB"}' \
    > test.out 2>&1
eval_tap $? 443 'PublicInviteUserV4' test.out

#- 444 PublicUpgradeHeadlessWithCodeV4Forward
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessWithCodeV4Forward \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "v3VA3jdY", "policyId": "FO9IRaRP", "policyVersionId": "wJ6vzrPq"}, {"isAccepted": true, "localizedPolicyVersionId": "309O1Y89", "policyId": "c9eJMWbR", "policyVersionId": "MAYVLqef"}, {"isAccepted": true, "localizedPolicyVersionId": "c0DdvCwF", "policyId": "LAk96RDR", "policyVersionId": "l9dQzvJb"}], "code": "yXta5YQc", "country": "3pMKRbp8", "dateOfBirth": "1B6IgtYq", "displayName": "E4UayPKc", "emailAddress": "7KYcmm54", "password": "nlAhuITj", "reachMinimumAge": true, "uniqueDisplayName": "DlM68VaO", "username": "VamV8Y3p", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 444 'PublicUpgradeHeadlessWithCodeV4Forward' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
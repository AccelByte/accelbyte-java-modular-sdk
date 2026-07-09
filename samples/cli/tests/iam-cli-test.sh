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
echo "1..447"

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

#- 57 NamespaceScopedPlatformTokenGrant
eval_tap 0 57 'NamespaceScopedPlatformTokenGrant # SKIP deprecated' test.out

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
    --body '{"modules": [{"docLink": "4Re8lyRD", "groups": [{"group": "GZMNFPT9", "groupId": "am3iLrcg", "package": "y8smYFcu", "permissions": [{"allowedActions": [9, 90, 49], "resource": "ULk0cJhU"}, {"allowedActions": [63, 72, 37], "resource": "jEqu2fEI"}, {"allowedActions": [59, 6, 14], "resource": "vluxqwza"}]}, {"group": "IgECEbKc", "groupId": "U77Ab4V9", "package": "d3liSlk5", "permissions": [{"allowedActions": [90, 38, 64], "resource": "ZRfnOuC8"}, {"allowedActions": [63, 57, 42], "resource": "9wTTBrWf"}, {"allowedActions": [100, 23, 0], "resource": "ZqVMMXrE"}]}, {"group": "f5mtS05j", "groupId": "XebNMbWf", "package": "dnj0U4g4", "permissions": [{"allowedActions": [68, 24, 88], "resource": "1i2C8clr"}, {"allowedActions": [90, 43, 45], "resource": "r7iE4RO3"}, {"allowedActions": [100, 69, 75], "resource": "tbrQMEKS"}]}], "module": "7YM1cABT", "moduleId": "bJNIJePW", "package": "4nJozX1Z"}, {"docLink": "hZkLO7nY", "groups": [{"group": "lAZu7zWn", "groupId": "CQEvRTV6", "package": "gkusenv2", "permissions": [{"allowedActions": [52, 23, 96], "resource": "lJ6W4Xzn"}, {"allowedActions": [8, 90, 61], "resource": "j6Iiojbb"}, {"allowedActions": [81, 57, 41], "resource": "aLDN5E18"}]}, {"group": "gdBHkyZS", "groupId": "GFURhjNG", "package": "EcloPtsL", "permissions": [{"allowedActions": [7, 52, 71], "resource": "2Od6IlLE"}, {"allowedActions": [98, 57, 81], "resource": "5FkrWvow"}, {"allowedActions": [42, 4, 65], "resource": "qazNxKtN"}]}, {"group": "VgBYVapH", "groupId": "u3zwwO5v", "package": "m0TQ1jxW", "permissions": [{"allowedActions": [79, 34, 51], "resource": "jzEIDVWy"}, {"allowedActions": [14, 88, 51], "resource": "MgDESCaO"}, {"allowedActions": [43, 43, 90], "resource": "zCZ5VU0w"}]}], "module": "fEDBPzQS", "moduleId": "q8gBo7pW", "package": "UcMIJk6n"}, {"docLink": "j6K8jqC5", "groups": [{"group": "kRdcAz7J", "groupId": "D0f9hm4e", "package": "RIHuSfou", "permissions": [{"allowedActions": [1, 64, 74], "resource": "kpuES6xG"}, {"allowedActions": [37, 85, 91], "resource": "kbh78rsh"}, {"allowedActions": [92, 98, 87], "resource": "LD3l5JBL"}]}, {"group": "txLTvxMQ", "groupId": "bXgz1slG", "package": "VORWr8FW", "permissions": [{"allowedActions": [5, 18, 80], "resource": "ha1cqgpM"}, {"allowedActions": [62, 52, 35], "resource": "J1BCDX9h"}, {"allowedActions": [12, 39, 60], "resource": "V6VfdRuG"}]}, {"group": "HGODKoBP", "groupId": "BcaGqLiG", "package": "wkOMalqw", "permissions": [{"allowedActions": [36, 84, 55], "resource": "2vb9gSEJ"}, {"allowedActions": [27, 7, 53], "resource": "UN7heXXX"}, {"allowedActions": [52, 25, 13], "resource": "KkS5qMsh"}]}], "module": "mmgGjQSP", "moduleId": "iwwKCdIF", "package": "I7lCqGky"}]}' \
    > test.out 2>&1
eval_tap $? 110 'AdminUpdateAvailablePermissionsByModule' test.out

#- 111 AdminDeleteConfigPermissionsByGroup
./ng net.accelbyte.sdk.cli.Main iam adminDeleteConfigPermissionsByGroup \
    --forceDelete  \
    --body '{"groupId": "Tnkm1sH3", "moduleId": "HCjDD58Q"}' \
    > test.out 2>&1
eval_tap $? 111 'AdminDeleteConfigPermissionsByGroup' test.out

#- 112 AdminUpdateModulePackage
./ng net.accelbyte.sdk.cli.Main iam adminUpdateModulePackage \
    --body '{"data": [{"moduleId": "IkmY0XaT", "package": "uc1GfHjN"}, {"moduleId": "0OG9eyuB", "package": "eTL5aGM7"}, {"moduleId": "Rsbl3Fkj", "package": "h72lEle0"}]}' \
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
    --after 'vbVQcy0n' \
    --before 'PB0E3EtW' \
    --endDate 'xdoTOISN' \
    --limit '60' \
    --query '9OziISB5' \
    --roleId '6JC2Pwp9' \
    --startDate 'ADjfXJ3v' \
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
    --body '{"ageRestriction": 22, "enable": true}' \
    > test.out 2>&1
eval_tap $? 119 'AdminUpdateAgeRestrictionConfigV3' test.out

#- 120 AdminGetListCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminGetListCountryAgeRestrictionV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 120 'AdminGetListCountryAgeRestrictionV3' test.out

#- 121 AdminUpdateCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateCountryAgeRestrictionV3 \
    --countryCode 'muhlygaz' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ageRestriction": 92}' \
    > test.out 2>&1
eval_tap $? 121 'AdminUpdateCountryAgeRestrictionV3' test.out

#- 122 AdminGetBannedUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType 'keSbTM2U' \
    --limit '13' \
    --offset '97' \
    > test.out 2>&1
eval_tap $? 122 'AdminGetBannedUsersV3' test.out

#- 123 AdminBanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"ban": "0bieQZ1v", "comment": "0BSw30h8", "endDate": "lGKdKusn", "reason": "2xiiox0Y", "skipNotif": false, "userIds": ["6XxX1bte", "htG9xLGi", "0Q4J15SW"]}' \
    > test.out 2>&1
eval_tap $? 123 'AdminBanUserBulkV3' test.out

#- 124 AdminUnbanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminUnbanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"bans": [{"banId": "vrRSODAW", "userId": "xDm4m8Im"}, {"banId": "nM83j8Iv", "userId": "Huk80ctZ"}, {"banId": "QqGvqxiZ", "userId": "IooZ06Ru"}]}' \
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
    --clientId 'j0buMR82' \
    --clientName 'AGTzjvBJ' \
    --clientType 'i0wFh6iX' \
    --limit '38' \
    --offset '28' \
    --skipLoginQueue  \
    > test.out 2>&1
eval_tap $? 126 'AdminGetClientsByNamespaceV3' test.out

#- 127 AdminBulkUpdateClientsV3
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateClientsV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientIds": ["1qdvTL9A", "diFaOLmm", "KU0IhBzl"], "clientUpdateRequest": {"audiences": ["GV9ANfS1", "pSPygnWq", "KnE948U4"], "baseUri": "1K9LUGC4", "clientName": "ZiZ3MkCP", "clientPermissions": [{"action": 83, "resource": "5S7SyCjt", "schedAction": 85, "schedCron": "Keke4kSK", "schedRange": ["9a6DVVvK", "ITvigTiB", "uLdnJn6b"]}, {"action": 34, "resource": "Q92D1uAg", "schedAction": 3, "schedCron": "wglDNWVM", "schedRange": ["LXabbEC2", "pvCbgzN3", "PcwQlaiY"]}, {"action": 49, "resource": "6aK5FuIW", "schedAction": 79, "schedCron": "qVOLi4Dn", "schedRange": ["BOd6x0Ev", "JyOSWXxk", "g4nQPe1x"]}], "clientPlatform": "Phx5AHYH", "deletable": false, "description": "Qm8hVi5q", "modulePermissions": [{"moduleId": "zjjr5pBA", "selectedGroups": [{"groupId": "E3tEMeEn", "selectedActions": [88, 17, 90]}, {"groupId": "ia4N2cEl", "selectedActions": [70, 82, 55]}, {"groupId": "C75XhI52", "selectedActions": [59, 29, 78]}]}, {"moduleId": "EX4MGFwt", "selectedGroups": [{"groupId": "rKo5d6A4", "selectedActions": [98, 99, 80]}, {"groupId": "qZMnd12c", "selectedActions": [100, 78, 86]}, {"groupId": "f45dHgL1", "selectedActions": [32, 80, 17]}]}, {"moduleId": "Q9OUSBz0", "selectedGroups": [{"groupId": "Tq25PFql", "selectedActions": [22, 83, 86]}, {"groupId": "UcqAcXl5", "selectedActions": [82, 28, 74]}, {"groupId": "OlD1kJzM", "selectedActions": [41, 41, 65]}]}], "namespace": "hYmjvFLv", "oauthAccessTokenExpiration": 60, "oauthAccessTokenExpirationTimeUnit": "rki2yyqD", "oauthRefreshTokenExpiration": 1, "oauthRefreshTokenExpirationTimeUnit": "QPJg6wfa", "redirectUri": "ElpobokR", "scopes": ["bn7XcWNC", "Wh1n9q1d", "7yfpjXSu"], "skipLoginQueue": true, "twoFactorEnabled": false}}' \
    > test.out 2>&1
eval_tap $? 127 'AdminBulkUpdateClientsV3' test.out

#- 128 AdminCreateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateClientV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["etQxaeFo", "PftL22Fs", "tON0DUIZ"], "baseUri": "MchOJpZt", "clientId": "3YdqWHCt", "clientName": "fieOTAw7", "clientPermissions": [{"action": 72, "resource": "nQlkofsD", "schedAction": 4, "schedCron": "VuTrfyV9", "schedRange": ["e3BtVdyN", "Xdkz6i2q", "iIj8lCYi"]}, {"action": 78, "resource": "ofVPGl85", "schedAction": 95, "schedCron": "DRigaszc", "schedRange": ["QQvrLwvx", "dyO9Cn6w", "CZ7Y08Zb"]}, {"action": 58, "resource": "udcE0526", "schedAction": 62, "schedCron": "STVhytpM", "schedRange": ["bLQq14Fj", "DttKY613", "HHL7YQ3k"]}], "clientPlatform": "Odycro0h", "deletable": true, "description": "pXiAVYBH", "modulePermissions": [{"moduleId": "5rUYpBER", "selectedGroups": [{"groupId": "m1LXKdaI", "selectedActions": [96, 97, 71]}, {"groupId": "cwrER4xa", "selectedActions": [29, 46, 89]}, {"groupId": "tYGFUvN8", "selectedActions": [65, 98, 79]}]}, {"moduleId": "fdgP8WPa", "selectedGroups": [{"groupId": "42plgXRn", "selectedActions": [56, 14, 94]}, {"groupId": "ibkjviMG", "selectedActions": [33, 93, 53]}, {"groupId": "XnMpX2KM", "selectedActions": [93, 24, 85]}]}, {"moduleId": "j3w8ni78", "selectedGroups": [{"groupId": "ptT0jlEv", "selectedActions": [64, 84, 78]}, {"groupId": "VqdQHoNs", "selectedActions": [20, 99, 9]}, {"groupId": "yr7h93cn", "selectedActions": [51, 100, 17]}]}], "namespace": "nAnJOUx5", "oauthAccessTokenExpiration": 100, "oauthAccessTokenExpirationTimeUnit": "jLqRKOrp", "oauthClientType": "qu04LIZs", "oauthRefreshTokenExpiration": 56, "oauthRefreshTokenExpirationTimeUnit": "iYkd5QCO", "redirectUri": "4chxYqrA", "scopes": ["7Fnl8w05", "8vyXsMHV", "Ev7y6FIF"], "secret": "rmHyPYE5", "skipLoginQueue": false, "twoFactorEnabled": false}' \
    > test.out 2>&1
eval_tap $? 128 'AdminCreateClientV3' test.out

#- 129 AdminGetClientsbyNamespacebyIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetClientsbyNamespacebyIDV3 \
    --clientId 'qBUJnWtP' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 129 'AdminGetClientsbyNamespacebyIDV3' test.out

#- 130 AdminDeleteClientV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientV3 \
    --clientId 'tc9JOY7c' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 130 'AdminDeleteClientV3' test.out

#- 131 AdminUpdateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientV3 \
    --clientId 'iVCNuo55' \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["PfI5Iana", "OMCbfel4", "RMhDQ5DK"], "baseUri": "ORk4BfPE", "clientName": "0R5ted1L", "clientPermissions": [{"action": 4, "resource": "XdjV6FtT", "schedAction": 45, "schedCron": "pqijLTSk", "schedRange": ["MkVPwOlK", "ThFPHpVZ", "g4a8RVnc"]}, {"action": 14, "resource": "e7AIzehX", "schedAction": 45, "schedCron": "RVWy7J9m", "schedRange": ["8Iy0drxT", "KHBY69ta", "CYPHG8R8"]}, {"action": 56, "resource": "Wx3ix9nD", "schedAction": 71, "schedCron": "SQZe1Ucs", "schedRange": ["EomwfYIi", "TSB6CoWT", "9LRYpNJn"]}], "clientPlatform": "vXU8ccaH", "deletable": false, "description": "CVkP9VTk", "modulePermissions": [{"moduleId": "0TE7ea7M", "selectedGroups": [{"groupId": "KNHxKmfT", "selectedActions": [60, 0, 26]}, {"groupId": "R21IhSmT", "selectedActions": [43, 15, 97]}, {"groupId": "CsY0qFeJ", "selectedActions": [70, 55, 65]}]}, {"moduleId": "7uVgQpG7", "selectedGroups": [{"groupId": "UkWjMKtj", "selectedActions": [69, 43, 29]}, {"groupId": "N2ZWHo9V", "selectedActions": [33, 53, 21]}, {"groupId": "DYkv3NfA", "selectedActions": [91, 47, 98]}]}, {"moduleId": "Ucc80mkC", "selectedGroups": [{"groupId": "WdMZZOEi", "selectedActions": [54, 25, 48]}, {"groupId": "CsWQYX6Q", "selectedActions": [29, 74, 5]}, {"groupId": "WtO9bWLy", "selectedActions": [81, 24, 3]}]}], "namespace": "2wQtytoV", "oauthAccessTokenExpiration": 19, "oauthAccessTokenExpirationTimeUnit": "3qAcoggs", "oauthRefreshTokenExpiration": 9, "oauthRefreshTokenExpirationTimeUnit": "mpl54Krz", "redirectUri": "gV40CMlr", "scopes": ["Zxdp9bk1", "R0DKQ4PY", "RoDRifkx"], "skipLoginQueue": true, "twoFactorEnabled": false}' \
    > test.out 2>&1
eval_tap $? 131 'AdminUpdateClientV3' test.out

#- 132 AdminUpdateClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientPermissionV3 \
    --clientId 'uBQBmwts' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 34, "resource": "6O47WZyu"}, {"action": 59, "resource": "n7ln74Wd"}, {"action": 83, "resource": "iRDYDBU7"}]}' \
    > test.out 2>&1
eval_tap $? 132 'AdminUpdateClientPermissionV3' test.out

#- 133 AdminAddClientPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddClientPermissionsV3 \
    --clientId 'ZNiazVxa' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 7, "resource": "cLU6rm2k"}, {"action": 55, "resource": "7lECr537"}, {"action": 20, "resource": "0kq0rv9D"}]}' \
    > test.out 2>&1
eval_tap $? 133 'AdminAddClientPermissionsV3' test.out

#- 134 AdminDeleteClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientPermissionV3 \
    --action '11' \
    --clientId '4fM5QoTc' \
    --namespace "$AB_NAMESPACE" \
    --resource 'TCHU8Fed' \
    > test.out 2>&1
eval_tap $? 134 'AdminDeleteClientPermissionV3' test.out

#- 135 AdminGetConfigValueV3
./ng net.accelbyte.sdk.cli.Main iam adminGetConfigValueV3 \
    --configKey 'OwtKmtCN' \
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
    --body '{"blacklist": ["8p1uqNll", "NurN4POa", "9KPdByMO"]}' \
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
    --body '[{"field": "sUlgssY5", "validation": {"allowAllSpecialCharacters": false, "allowDigit": false, "allowLetter": false, "allowSpace": true, "allowUnicode": false, "avatarConfig": {"allowedPrefixes": ["YveK8g42", "JykWFtf6", "FeFGmJ3B"], "preferRegex": false, "regex": "cp2LHg9N"}, "blockedWord": ["1qtEMNc7", "gbBznxgs", "at1YglBp"], "description": [{"language": "OUW0EKQi", "message": ["vdyKWjZf", "lyJlrCjE", "xoV2sBQt"]}, {"language": "lHX3r61J", "message": ["MHEvNTXR", "0hq4kkS8", "dLHRmGz7"]}, {"language": "BfTe7S1l", "message": ["QJuQVtZG", "JPRxAYAf", "xYxb2K3S"]}], "isCustomRegex": false, "letterCase": "6Oqgkkxg", "maxLength": 47, "maxRepeatingAlphaNum": 29, "maxRepeatingSpecialCharacter": 66, "minCharType": 67, "minLength": 40, "profanityFilter": "tafTea1n", "regex": "vg0Z84OQ", "specialCharacterLocation": "r6oPJ2yC", "specialCharacters": ["3udhJfvM", "LPlVDViX", "HnLbKg2M"]}}, {"field": "ltoJAvMZ", "validation": {"allowAllSpecialCharacters": true, "allowDigit": false, "allowLetter": false, "allowSpace": true, "allowUnicode": true, "avatarConfig": {"allowedPrefixes": ["vGBJ2tfD", "pn41itVd", "6xk1lqwm"], "preferRegex": false, "regex": "ZisdRTwg"}, "blockedWord": ["PjKSunRk", "sw9kehKD", "51C46r1N"], "description": [{"language": "3thSGv2m", "message": ["YyOW5M4k", "NZN3z2od", "rfZZj6zR"]}, {"language": "x9yFgaKE", "message": ["ksbM3MaL", "U3cPBUbN", "YRq65vRP"]}, {"language": "rKm9teKQ", "message": ["NUCuJoyt", "SuPcayku", "a5JoU1Za"]}], "isCustomRegex": false, "letterCase": "u7n05Kyv", "maxLength": 3, "maxRepeatingAlphaNum": 84, "maxRepeatingSpecialCharacter": 35, "minCharType": 38, "minLength": 46, "profanityFilter": "r88UAqqb", "regex": "gTGF6WLe", "specialCharacterLocation": "q2LVDi3D", "specialCharacters": ["fzKc4lzK", "pywchyrR", "cgcoLb6P"]}}, {"field": "RV2mw6z2", "validation": {"allowAllSpecialCharacters": true, "allowDigit": false, "allowLetter": true, "allowSpace": false, "allowUnicode": true, "avatarConfig": {"allowedPrefixes": ["87xfFTFQ", "RXKUjLFG", "GSoeMvLn"], "preferRegex": true, "regex": "OPCaxLi1"}, "blockedWord": ["vqykKJ54", "GXiyudDq", "onrHcjMV"], "description": [{"language": "KTW9wgoB", "message": ["aHRQKdgp", "R4mnIZWc", "OHm6e9IB"]}, {"language": "jPETJpzP", "message": ["wZUOqT3g", "hlATCblQ", "0p2PPHm0"]}, {"language": "16UkT0Gc", "message": ["Qj16xZsb", "fToKpf8d", "VBo2eObl"]}], "isCustomRegex": false, "letterCase": "xKRDbE4n", "maxLength": 22, "maxRepeatingAlphaNum": 58, "maxRepeatingSpecialCharacter": 46, "minCharType": 25, "minLength": 21, "profanityFilter": "era3Zk6n", "regex": "BOiHljTe", "specialCharacterLocation": "8vLysdgQ", "specialCharacters": ["ffz0kUf5", "tx7ptGmA", "rOJoGnGu"]}}]' \
    > test.out 2>&1
eval_tap $? 140 'AdminUpdateNamespaceScopedInputValidations' test.out

#- 141 AdminResetNamespaceScopedInputValidations
./ng net.accelbyte.sdk.cli.Main iam adminResetNamespaceScopedInputValidations \
    --field 'eqfhhpaA' \
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
    --body '{"active": false, "roleIds": ["EXHfMix2", "cpaZ8boj", "68psWOIn"]}' \
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
    --limit '89' \
    --offset '49' \
    > test.out 2>&1
eval_tap $? 146 'RetrieveAllSSOLoginPlatformCredentialV3' test.out

#- 147 RetrieveThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '0qiMB66a' \
    > test.out 2>&1
eval_tap $? 147 'RetrieveThirdPartyLoginPlatformCredentialV3' test.out

#- 148 AddThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam addThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'y3bCbuZR' \
    --body '{"ACSURL": "vgbZA0Ju", "AWSCognitoRegion": "Mcs6rJLk", "AWSCognitoUserPool": "v6psf78u", "AllowedClients": ["Apb96vQC", "XjaHCiQS", "Iurw60Bu"], "AppId": "dYZz9zQL", "AuthorizationEndpoint": "IRVDHGVj", "ClientId": "kXq0XMxl", "EmptyStrFieldList": ["plOuonWI", "A0RCj2kc", "6BRBrlEC"], "EnableServerLicenseValidation": false, "Environment": "zv0ZgNKh", "FederationMetadataURL": "HdMILS86", "GenericOauthFlow": false, "IncludePUID": true, "IsActive": true, "Issuer": "q9nppSGH", "JWKSEndpoint": "3znj2IT9", "KeyID": "fd72JLjz", "LogoURL": "CVIdAgvk", "NetflixCertificates": {"encryptedPrivateKey": "PsfFklSO", "encryptedPrivateKeyName": "xwb5woXc", "publicCertificate": "NkbTGaah", "publicCertificateName": "zaWKhPFT", "rootCertificate": "7EsxoLuQ", "rootCertificateName": "wCyGA8HG"}, "OrganizationId": "AGxQ9obb", "PlatformName": "WsGpnP8L", "PrivateKey": "f5ETVtU2", "RedirectUri": "IPxnkKkH", "RegisteredDomains": [{"affectedClientIDs": ["6WZFRQmm", "vfMwISmt", "qYBQR1Nx"], "domain": "KzllpUEv", "namespaces": ["NNMHRCiM", "trjcr0Yw", "xgikmPe3"], "roleId": "938EIBuc", "ssoCfg": {"googleKey": {"yJHEcdzo": {}, "baM7TXly": {}, "dE0h3bcN": {}}, "groupConfigs": [{"assignNamespaces": ["44okVx1b", "JM7iHRO9", "ZGDGXZI5"], "group": "YnegoROa", "roleId": "8jMmrC9b"}, {"assignNamespaces": ["IHdD8zcU", "L8GfKCfR", "arHgbvJF"], "group": "fNEgIob7", "roleId": "G8deeZEf"}, {"assignNamespaces": ["MIh8uAo2", "5xE2NG6F", "wVXUMXgQ"], "group": "qLpKtysp", "roleId": "0J2t3J6I"}]}}, {"affectedClientIDs": ["2SEVUXJv", "iPmFzQ4d", "q2Amgl8f"], "domain": "sUrzKUll", "namespaces": ["KM2dv93U", "bRM7pZ7F", "QTlUJQo8"], "roleId": "wYatg2WY", "ssoCfg": {"googleKey": {"1OlqJhUd": {}, "86EXTOqi": {}, "a0dD9EEp": {}}, "groupConfigs": [{"assignNamespaces": ["3JN0XLK9", "4SkBUby6", "BTSH6xX0"], "group": "LiXoDDTr", "roleId": "tvmj3GHN"}, {"assignNamespaces": ["KaLMfvrg", "ncXj6R36", "0dSb93EE"], "group": "XKXbrU0o", "roleId": "tQzVfUjk"}, {"assignNamespaces": ["DdDDW8i9", "7C0GPJON", "ikcCoxQh"], "group": "SLsoabiG", "roleId": "patdOGgu"}]}}, {"affectedClientIDs": ["usqxueFn", "Nd7KuCLU", "xTKtnMTC"], "domain": "04dMW5Rc", "namespaces": ["LgweYaQh", "wWowSRaI", "geFUfWOI"], "roleId": "e2ISf2Yz", "ssoCfg": {"googleKey": {"qojxGjbV": {}, "z0MChanC": {}, "D6RxS4If": {}}, "groupConfigs": [{"assignNamespaces": ["ZxIiFPaw", "C8naZWAN", "eqqx27eD"], "group": "ddvnQcU7", "roleId": "HS9RL61K"}, {"assignNamespaces": ["OihYvT8R", "0BVtczG3", "a6bulMDW"], "group": "TMtdLdCq", "roleId": "VMibNN21"}, {"assignNamespaces": ["8odvlcBy", "r9M9WyLq", "F1cOGQ1u"], "group": "Xe9dKVZi", "roleId": "GwLvusB2"}]}}], "RelyingParty": "Ty5o7NZu", "SandboxId": "0P294xvT", "Secret": "ob7RoDDv", "TeamID": "gmBYfude", "TokenAuthenticationType": "bdbc1sXD", "TokenClaimsMapping": {"xLHcfPuO": "sSgazlPd", "Y6N37cBU": "APK3gi03", "PariTkPH": "5fSqbv9d"}, "TokenEndpoint": "0Yk94kow", "UserInfoEndpoint": "O3muYHru", "UserInfoHTTPMethod": "76vn7K55", "googleAdminConsoleKey": "1T5k5pOY", "scopes": ["GP433x9Q", "tiQlKAKe", "7MXvlwkF"]}' \
    > test.out 2>&1
eval_tap $? 148 'AddThirdPartyLoginPlatformCredentialV3' test.out

#- 149 DeleteThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'mabdQiBw' \
    > test.out 2>&1
eval_tap $? 149 'DeleteThirdPartyLoginPlatformCredentialV3' test.out

#- 150 UpdateThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'W2IxrgN5' \
    --body '{"ACSURL": "9UXGzziw", "AWSCognitoRegion": "nOSavwwV", "AWSCognitoUserPool": "OFZRbF5z", "AllowedClients": ["1d9hrL2Y", "et2CqrAX", "s6LncVlX"], "AppId": "aAIAyNXC", "AuthorizationEndpoint": "dM4h3pXu", "ClientId": "VW5SjT3t", "EmptyStrFieldList": ["iEGq1AHO", "WrGfwtyJ", "4QTdWswB"], "EnableServerLicenseValidation": true, "Environment": "z0ki8Ned", "FederationMetadataURL": "BZcg7hwq", "GenericOauthFlow": false, "IncludePUID": true, "IsActive": true, "Issuer": "rnz5SwYU", "JWKSEndpoint": "4cqHpgU6", "KeyID": "bn2DFzxe", "LogoURL": "0EYP6pad", "NetflixCertificates": {"encryptedPrivateKey": "xhPBLRq5", "encryptedPrivateKeyName": "urOEXf4c", "publicCertificate": "Milbz9D8", "publicCertificateName": "X0F03rd2", "rootCertificate": "AC0C8t28", "rootCertificateName": "s21PK0BI"}, "OrganizationId": "mty5qlcv", "PlatformName": "i0jSmexB", "PrivateKey": "xXTrnhyJ", "RedirectUri": "51aDWB4P", "RegisteredDomains": [{"affectedClientIDs": ["iQMAJol5", "JRRE6XFX", "nCh44hV9"], "domain": "9CcaVhOx", "namespaces": ["1RqFuhjR", "Xw5Km9Tc", "5saabMmd"], "roleId": "cZiiWov2", "ssoCfg": {"googleKey": {"raucHFGA": {}, "wTni9XqJ": {}, "d3TdnrS4": {}}, "groupConfigs": [{"assignNamespaces": ["EaSLaQJn", "6Wo6hlzG", "nv1YXmqH"], "group": "55Ka9YL1", "roleId": "3jXzJ270"}, {"assignNamespaces": ["ERLZ4Me6", "synUEsYM", "FBKHH5td"], "group": "8eu7Wywl", "roleId": "sMHC9pBU"}, {"assignNamespaces": ["scDT8PmR", "0NsyZMag", "HTLBm8aq"], "group": "arAaopq4", "roleId": "VH6sQbf3"}]}}, {"affectedClientIDs": ["qF9S7kin", "CWyNXmvJ", "V64jbLWu"], "domain": "dAJ1PE9R", "namespaces": ["wNOOPWss", "MK2ffklK", "IVZwo7yp"], "roleId": "XebdkeuJ", "ssoCfg": {"googleKey": {"hUvJKEOy": {}, "5Ivg3g5f": {}, "yfEPh8Rc": {}}, "groupConfigs": [{"assignNamespaces": ["vnDXGIop", "GbeXFimu", "ZPQBT126"], "group": "ZHqIgwh5", "roleId": "nEOOMzeU"}, {"assignNamespaces": ["mrl3KezY", "vhefHSSg", "3CsnHhuZ"], "group": "xBns6iOv", "roleId": "qsYYHuZz"}, {"assignNamespaces": ["xGkIFTa1", "heCbkArm", "Z1CLPO4w"], "group": "mOm0I3Hv", "roleId": "Zmbnt1gD"}]}}, {"affectedClientIDs": ["DoDzPwve", "SKZP9Uaa", "CwZ1HmUX"], "domain": "6SZKjpJl", "namespaces": ["sB7ZByIL", "qqsMnfOH", "YHOW3jXZ"], "roleId": "pP5HsFyJ", "ssoCfg": {"googleKey": {"ahtqDbHl": {}, "Thaf0DoA": {}, "7Z0c4VSU": {}}, "groupConfigs": [{"assignNamespaces": ["EXKYvadi", "25KXrSc7", "mCu3RXI6"], "group": "0tBP2F9g", "roleId": "gVm0lRj6"}, {"assignNamespaces": ["asMmDBJZ", "Hh7b6Gm1", "h21Kogiz"], "group": "Tnp5UyY5", "roleId": "tnBRJ5in"}, {"assignNamespaces": ["VSwKadss", "n5NfSXH6", "hPRbuuHX"], "group": "fIbCC9tE", "roleId": "gBzPC9yC"}]}}], "RelyingParty": "xagmgzvo", "SandboxId": "HfzEVDNV", "Secret": "2TRX9ThO", "TeamID": "303KSbph", "TokenAuthenticationType": "iIUEvHKi", "TokenClaimsMapping": {"StJadTnY": "JOWvYm2J", "NftsTlTH": "F3PpBhuZ", "AhMizYUs": "JtuoaldX"}, "TokenEndpoint": "ymMocoF1", "UserInfoEndpoint": "QbhzTdBK", "UserInfoHTTPMethod": "VP2rQc10", "googleAdminConsoleKey": "8jxmja15", "scopes": ["Ol3z8DUq", "8Fk10l8U", "utVQb5Lc"]}' \
    > test.out 2>&1
eval_tap $? 150 'UpdateThirdPartyLoginPlatformCredentialV3' test.out

#- 151 UpdateThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'DbzFdz7D' \
    --body '{"affectedClientIDs": ["bP5S6JzU", "ovuNC1mo", "mSeG89kW"], "assignedNamespaces": ["wMbYfHnE", "umTEi8eD", "EQuBrLdc"], "domain": "jUB5EvPx", "roleId": "wnO8Qrm6", "ssoCfg": {"googleKey": {"kRiERcUf": {}, "HOdzdEcQ": {}, "kfGsCymC": {}}, "groupConfigs": [{"assignNamespaces": ["EvwGR2BP", "Uwu64Nnt", "er0WrBZc"], "group": "sULq8den", "roleId": "GexRLuKT"}, {"assignNamespaces": ["3VkaK9qo", "DXQ19K2A", "Xmx8BdGf"], "group": "MSefUYxA", "roleId": "LRuh6WQc"}, {"assignNamespaces": ["KZPMcLR6", "b7DBR7NP", "bfhiOGAg"], "group": "PNDgirXU", "roleId": "JacKWvl4"}]}}' \
    > test.out 2>&1
eval_tap $? 151 'UpdateThirdPartyLoginPlatformDomainV3' test.out

#- 152 DeleteThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'viEwl5Xg' \
    --body '{"domain": "np1xNzub", "ssoGroups": ["W4CX3kfi", "ItKPUXBs", "f9pFTwxt"]}' \
    > test.out 2>&1
eval_tap $? 152 'DeleteThirdPartyLoginPlatformDomainV3' test.out

#- 153 PartialUpdateThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam partialUpdateThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'g9k7Ec2w' \
    --body '{"affectedClientIDs": ["Hraj1Aha", "AsHMeebU", "4Ud9EhQU"], "assignedNamespaces": ["M9Do5zcv", "wE6AzFrg", "F4Q0QEZb"], "domain": "bvXCMP8F", "roleId": "XUuhNa53", "ssoCfg": {"googleKey": {"mFKzcvqp": {}, "FEAJiUHF": {}, "nqyLtkKS": {}}, "groupConfigs": [{"assignNamespaces": ["0lZqCID1", "NeDVqD9s", "tn9zn4Qk"], "group": "ZAyNfGia", "roleId": "YN44rUkH"}, {"assignNamespaces": ["O25MzOBD", "fg8EGO3L", "83srcRBl"], "group": "JfeFVCon", "roleId": "0WniSwD2"}, {"assignNamespaces": ["k66owdDi", "YR9vWebf", "uc3waof3"], "group": "koNi22Yo", "roleId": "tqZ1yD2I"}]}}' \
    > test.out 2>&1
eval_tap $? 153 'PartialUpdateThirdPartyLoginPlatformDomainV3' test.out

#- 154 RetrieveSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam retrieveSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'KAgeCEru' \
    > test.out 2>&1
eval_tap $? 154 'RetrieveSSOLoginPlatformCredential' test.out

#- 155 AddSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam addSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'ThCE4Heu' \
    --body '{"acsUrl": "YVZuEQV2", "apiKey": "5tk9a78E", "appId": "34b7Z0t8", "federationMetadataUrl": "T39SzlBr", "isActive": false, "redirectUri": "MCWVLB6z", "secret": "272Etk9b", "ssoUrl": "d4JXX7ep"}' \
    > test.out 2>&1
eval_tap $? 155 'AddSSOLoginPlatformCredential' test.out

#- 156 DeleteSSOLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteSSOLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '9toBzClt' \
    > test.out 2>&1
eval_tap $? 156 'DeleteSSOLoginPlatformCredentialV3' test.out

#- 157 UpdateSSOPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam updateSSOPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'lMVvM1K6' \
    --body '{"acsUrl": "Z3opUenK", "apiKey": "5HRptv4E", "appId": "CWDLHECA", "federationMetadataUrl": "JVvjkW1O", "isActive": false, "redirectUri": "y5eCsQOt", "secret": "cy5wzo6O", "ssoUrl": "uZBLSNYu"}' \
    > test.out 2>&1
eval_tap $? 157 'UpdateSSOPlatformCredential' test.out

#- 158 AdminListUserIDByPlatformUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByPlatformUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'C83v8Oxj' \
    --rawPID  \
    --rawPUID  \
    --body '{"platformUserIds": ["v1sNrQAd", "xm5e8lyv", "yxqzejD5"]}' \
    > test.out 2>&1
eval_tap $? 158 'AdminListUserIDByPlatformUserIDsV3' test.out

#- 159 AdminGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'jiDXxef7' \
    --platformUserId '2ITKI2zK' \
    --pidType '6si36qLh' \
    > test.out 2>&1
eval_tap $? 159 'AdminGetUserByPlatformUserIDV3' test.out

#- 160 AdminGetProfileUpdateStrategyV3
./ng net.accelbyte.sdk.cli.Main iam adminGetProfileUpdateStrategyV3 \
    --namespace "$AB_NAMESPACE" \
    --field 'dob' \
    > test.out 2>&1
eval_tap $? 160 'AdminGetProfileUpdateStrategyV3' test.out

#- 161 AdminUpdateProfileUpdateStrategyV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateProfileUpdateStrategyV3 \
    --namespace "$AB_NAMESPACE" \
    --field 'country' \
    --body '{"config": {"minimumAllowedInterval": 81}, "type": "Gl9lbBPp"}' \
    > test.out 2>&1
eval_tap $? 161 'AdminUpdateProfileUpdateStrategyV3' test.out

#- 162 AdminGetRoleOverrideConfigV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleOverrideConfigV3 \
    --namespace "$AB_NAMESPACE" \
    --identity 'VIEW_ONLY' \
    > test.out 2>&1
eval_tap $? 162 'AdminGetRoleOverrideConfigV3' test.out

#- 163 AdminUpdateRoleOverrideConfigV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleOverrideConfigV3 \
    --namespace "$AB_NAMESPACE" \
    --identity 'USER' \
    --body '{"additions": [{"actions": [80, 20, 87], "resource": "a2l82Ake"}, {"actions": [86, 68, 74], "resource": "cA8uo5jc"}, {"actions": [11, 28, 82], "resource": "xWfrUrYq"}], "exclusions": [{"actions": [26, 73, 40], "resource": "0gKgSS9h"}, {"actions": [71, 98, 94], "resource": "oRObITwy"}, {"actions": [39, 66, 4], "resource": "UDRF8rB9"}], "overrides": [{"actions": [91, 96, 94], "resource": "D3beTy7R"}, {"actions": [23, 82, 11], "resource": "tnx7EGlE"}, {"actions": [41, 6, 40], "resource": "u2HgHiIy"}], "replacements": [{"replacement": {"actions": [100, 17, 1], "resource": "D8zJPxBs"}, "target": "XmrNqnQr"}, {"replacement": {"actions": [89, 17, 25], "resource": "lESkg8U2"}, "target": "wy4UHj5O"}, {"replacement": {"actions": [93, 15, 42], "resource": "fyhxd8aK"}, "target": "2eprw7vA"}]}' \
    > test.out 2>&1
eval_tap $? 163 'AdminUpdateRoleOverrideConfigV3' test.out

#- 164 AdminGetRoleSourceV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleSourceV3 \
    --namespace "$AB_NAMESPACE" \
    --identity 'VIEW_ONLY' \
    > test.out 2>&1
eval_tap $? 164 'AdminGetRoleSourceV3' test.out

#- 165 AdminChangeRoleOverrideConfigStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminChangeRoleOverrideConfigStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --identity 'USER' \
    --body '{"active": false}' \
    > test.out 2>&1
eval_tap $? 165 'AdminChangeRoleOverrideConfigStatusV3' test.out

#- 166 AdminGetRoleNamespacePermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleNamespacePermissionV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'oDxLZz3E' \
    > test.out 2>&1
eval_tap $? 166 'AdminGetRoleNamespacePermissionV3' test.out

#- 167 GetAdminUsersByRoleIdV3
./ng net.accelbyte.sdk.cli.Main iam getAdminUsersByRoleIdV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'JqQOloDb' \
    --after '72' \
    --before '82' \
    --limit '4' \
    > test.out 2>&1
eval_tap $? 167 'GetAdminUsersByRoleIdV3' test.out

#- 168 AdminQueryTagV3
./ng net.accelbyte.sdk.cli.Main iam adminQueryTagV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '89' \
    --offset '51' \
    --tagName 'i2CLpoHU' \
    > test.out 2>&1
eval_tap $? 168 'AdminQueryTagV3' test.out

#- 169 AdminCreateTagV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateTagV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"tagName": "4awpsiGZ"}' \
    > test.out 2>&1
eval_tap $? 169 'AdminCreateTagV3' test.out

#- 170 AdminUpdateTagV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateTagV3 \
    --namespace "$AB_NAMESPACE" \
    --tagId '36hHUghv' \
    --body '{"tagName": "g6XGlwHC"}' \
    > test.out 2>&1
eval_tap $? 170 'AdminUpdateTagV3' test.out

#- 171 AdminDeleteTagV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteTagV3 \
    --namespace "$AB_NAMESPACE" \
    --tagId 'weaFuK6O' \
    > test.out 2>&1
eval_tap $? 171 'AdminDeleteTagV3' test.out

#- 172 AdminGetUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --emailAddress 'x47t2lqt' \
    > test.out 2>&1
eval_tap $? 172 'AdminGetUserByEmailAddressV3' test.out

#- 173 AdminBulkUpdateUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"updateRequest": {"skipLoginQueue": true}, "userIds": ["WlyrqkHD", "sEBp05X4", "27RY8pAf"]}' \
    > test.out 2>&1
eval_tap $? 173 'AdminBulkUpdateUsersV3' test.out

#- 174 AdminGetBulkUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType 'UWMpDM2m' \
    --body '{"bulkUserId": ["nvk8IQeP", "fp1177eG", "aZ7HtcOE"]}' \
    > test.out 2>&1
eval_tap $? 174 'AdminGetBulkUserBanV3' test.out

#- 175 AdminListUserIDByUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"findByPublisherNamespace": false, "userIds": ["EW6iArCI", "Z6PaDj8U", "TTqGAZqr"]}' \
    > test.out 2>&1
eval_tap $? 175 'AdminListUserIDByUserIDsV3' test.out

#- 176 AdminBulkGetUsersPlatform
./ng net.accelbyte.sdk.cli.Main iam adminBulkGetUsersPlatform \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["sawkyA67", "kxH22CIV", "gWGmHPP5"]}' \
    > test.out 2>&1
eval_tap $? 176 'AdminBulkGetUsersPlatform' test.out

#- 177 AdminCursorGetUserV3
./ng net.accelbyte.sdk.cli.Main iam adminCursorGetUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"cursor": {"cursorTime": "FLNWIuMW", "userId": "xe1JSiEb"}, "fields": ["4g5a2lyO", "Q693SHvs", "7Sb7mqQS"], "limit": 84}' \
    > test.out 2>&1
eval_tap $? 177 'AdminCursorGetUserV3' test.out

#- 178 AdminInviteUserV3
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddresses": ["4IcFO6fv", "WJNn1N4Y", "eJg0gw7a"], "isAdmin": false, "languageTag": "jgq8GCqa", "namespace": "udGHrjmx", "roles": ["K6VQr2Xo", "W7a2cirL", "bftAaSvn"]}' \
    > test.out 2>&1
eval_tap $? 178 'AdminInviteUserV3' test.out

#- 179 AdminQueryThirdPlatformLinkHistoryV3
./ng net.accelbyte.sdk.cli.Main iam adminQueryThirdPlatformLinkHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '1' \
    --offset '71' \
    --platformUserId 'BBkJzrxF' \
    --platformId 'frDFwZOP' \
    > test.out 2>&1
eval_tap $? 179 'AdminQueryThirdPlatformLinkHistoryV3' test.out

#- 180 AdminListUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminListUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '3' \
    --offset '48' \
    > test.out 2>&1
eval_tap $? 180 'AdminListUsersV3' test.out

#- 181 AdminSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam adminSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'iByFcVoe' \
    --endDate 'ZAlMikjb' \
    --includeTotal  \
    --limit '26' \
    --offset '47' \
    --platformBy 'oSVAE0yj' \
    --platformId 'cyRcFUjP' \
    --query 'MOdlAVuz' \
    --roleIds 'OUXwOC40' \
    --selectedFields 'OgmmOkwG' \
    --skipLoginQueue  \
    --startDate '4fpH5etO' \
    --tagIds '6G85pOrG' \
    --testAccount  \
    > test.out 2>&1
eval_tap $? 181 'AdminSearchUserV3' test.out

#- 182 AdminGetBulkUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"listEmailAddressRequest": ["y9EUbKJr", "St8VeASC", "iJVVL2di"]}' \
    > test.out 2>&1
eval_tap $? 182 'AdminGetBulkUserByEmailAddressV3' test.out

#- 183 AdminGetUserByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'gM7kfZGZ' \
    > test.out 2>&1
eval_tap $? 183 'AdminGetUserByUserIdV3' test.out

#- 184 AdminUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'E8jFX7lH' \
    --body '{"avatarUrl": "rJwygGs9", "country": "DVBjZ8IN", "dateOfBirth": "sOIU8EA8", "displayName": "m5uG0pLs", "languageTag": "6Oo73dHZ", "skipLoginQueue": true, "tags": ["10dis2CV", "BuihzJNQ", "EQcckRJK"], "uniqueDisplayName": "bQ5qhsKc", "userName": "DsvPBoyd"}' \
    > test.out 2>&1
eval_tap $? 184 'AdminUpdateUserV3' test.out

#- 185 AdminGetUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '1MlIE2Dl' \
    --activeOnly  \
    --after 'UuVqcR0X' \
    --before 'TBuwt6QI' \
    --limit '7' \
    > test.out 2>&1
eval_tap $? 185 'AdminGetUserBanV3' test.out

#- 186 AdminBanUserV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'oHaoXp8B' \
    --body '{"ban": "IoFArnYm", "comment": "qJ7GDu5V", "endDate": "ofCJxLMS", "reason": "XhHjlnry", "skipNotif": true}' \
    > test.out 2>&1
eval_tap $? 186 'AdminBanUserV3' test.out

#- 187 AdminGetUserBanSummaryV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanSummaryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'GUaihlAT' \
    > test.out 2>&1
eval_tap $? 187 'AdminGetUserBanSummaryV3' test.out

#- 188 AdminUpdateUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserBanV3 \
    --banId 'S7bg7MTO' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Quwr6uq9' \
    --body '{"enabled": true, "skipNotif": true}' \
    > test.out 2>&1
eval_tap $? 188 'AdminUpdateUserBanV3' test.out

#- 189 AdminSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'wJFFabW9' \
    --body '{"context": "nH09tKx5", "emailAddress": "M6Q64VSg", "languageTag": "wmqqv5ez", "upgradeToken": "lqRD3jex"}' \
    > test.out 2>&1
eval_tap $? 189 'AdminSendVerificationCodeV3' test.out

#- 190 AdminVerifyAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'qw2zj9lg' \
    --body '{"Code": "UnNn96b7", "ContactType": "WBBhojuP", "LanguageTag": "lApLCyTA", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 190 'AdminVerifyAccountV3' test.out

#- 191 GetUserVerificationCode
./ng net.accelbyte.sdk.cli.Main iam getUserVerificationCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZlgJN5kG' \
    > test.out 2>&1
eval_tap $? 191 'GetUserVerificationCode' test.out

#- 192 AdminGetUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'tQgL3zxK' \
    > test.out 2>&1
eval_tap $? 192 'AdminGetUserDeletionStatusV3' test.out

#- 193 AdminUpdateUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'GcBxW6Cx' \
    --body '{"deletionDate": 68, "enabled": false}' \
    > test.out 2>&1
eval_tap $? 193 'AdminUpdateUserDeletionStatusV3' test.out

#- 194 AdminListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'uEzIJuBO' \
    > test.out 2>&1
eval_tap $? 194 'AdminListUserAllPlatformAccountsDistinctV3' test.out

#- 195 AdminUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'XU9Jv7rM' \
    --body '{"code": "tPldKlkY", "country": "lw5FKoFT", "dateOfBirth": "BE9IEBYy", "displayName": "QePytB81", "emailAddress": "AJ1ZIcpo", "password": "vZGGaVJM", "uniqueDisplayName": "CGSyjy4P", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 195 'AdminUpgradeHeadlessAccountV3' test.out

#- 196 AdminDeleteUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZpfN5AZl' \
    > test.out 2>&1
eval_tap $? 196 'AdminDeleteUserInformationV3' test.out

#- 197 AdminGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'BdU9Pggt' \
    --after '0.9916969288821859' \
    --before '0.31709258652297323' \
    --limit '39' \
    > test.out 2>&1
eval_tap $? 197 'AdminGetUserLoginHistoriesV3' test.out

#- 198 AdminResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam adminResetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ETWtuRfr' \
    --body '{"languageTag": "slz1kBwj", "mfaToken": "cu8kKVPZ", "newPassword": "YF6DQUkE", "oldPassword": "CbnS61yr"}' \
    > test.out 2>&1
eval_tap $? 198 'AdminResetPasswordV3' test.out

#- 199 AdminUpdateUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserPermissionV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'KB6fKIoj' \
    --body '{"Permissions": [{"Action": 32, "Resource": "QsbcliXG", "SchedAction": 66, "SchedCron": "foVgEqdr", "SchedRange": ["xdJyXBnS", "it9JNhJS", "wuqx6K1S"]}, {"Action": 90, "Resource": "uLRfR9sP", "SchedAction": 58, "SchedCron": "I0XAHJaY", "SchedRange": ["kok7FRio", "nkQZRuk0", "BjJBeGNB"]}, {"Action": 23, "Resource": "rrpQF95s", "SchedAction": 81, "SchedCron": "FMK4J7iy", "SchedRange": ["YiP4T7Nb", "6HQoIJF0", "EmXEqivT"]}]}' \
    > test.out 2>&1
eval_tap $? 199 'AdminUpdateUserPermissionV3' test.out

#- 200 AdminAddUserPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserPermissionsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '9rutOMgI' \
    --body '{"Permissions": [{"Action": 15, "Resource": "s7fDzzfx", "SchedAction": 64, "SchedCron": "X6W6CTSE", "SchedRange": ["2zo9K5UP", "2DOZCoSb", "CDKDP4bG"]}, {"Action": 38, "Resource": "KeUqkj4o", "SchedAction": 72, "SchedCron": "mmusYTX4", "SchedRange": ["a3WDydFL", "IvMoQBah", "L4569isj"]}, {"Action": 71, "Resource": "znaQmHVC", "SchedAction": 93, "SchedCron": "Pln5D9Oq", "SchedRange": ["MiQcA8Yz", "dv3QgnK0", "ecFnXe8f"]}]}' \
    > test.out 2>&1
eval_tap $? 200 'AdminAddUserPermissionsV3' test.out

#- 201 AdminDeleteUserPermissionBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '5ZqUL6gB' \
    --body '[{"Action": 96, "Resource": "G0aDRh3B"}, {"Action": 79, "Resource": "ZTg97kcT"}, {"Action": 7, "Resource": "hsDuRCGS"}]' \
    > test.out 2>&1
eval_tap $? 201 'AdminDeleteUserPermissionBulkV3' test.out

#- 202 AdminDeleteUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionV3 \
    --action '12' \
    --namespace "$AB_NAMESPACE" \
    --resource 'GpVGOQV7' \
    --userId 'APNgqUxf' \
    > test.out 2>&1
eval_tap $? 202 'AdminDeleteUserPermissionV3' test.out

#- 203 AdminGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'jckoHM5z' \
    --after 'o20dsweI' \
    --before 'PXhuMql5' \
    --limit '17' \
    --platformId 'VXIN21lh' \
    --targetNamespace 'RxaW7k9J' \
    > test.out 2>&1
eval_tap $? 203 'AdminGetUserPlatformAccountsV3' test.out

#- 204 AdminListAllDistinctPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminListAllDistinctPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'PuP8LDs2' \
    --status 'O7ospE27' \
    > test.out 2>&1
eval_tap $? 204 'AdminListAllDistinctPlatformAccountsV3' test.out

#- 205 AdminGetListJusticePlatformAccounts
./ng net.accelbyte.sdk.cli.Main iam adminGetListJusticePlatformAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'o9EozTKm' \
    > test.out 2>&1
eval_tap $? 205 'AdminGetListJusticePlatformAccounts' test.out

#- 206 AdminGetUserMapping
./ng net.accelbyte.sdk.cli.Main iam adminGetUserMapping \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'flt3xoMY' \
    --userId 'KCWYe8hf' \
    --createIfNotFound  \
    > test.out 2>&1
eval_tap $? 206 'AdminGetUserMapping' test.out

#- 207 AdminCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam adminCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'BM0yr7zk' \
    --userId 'GwKBO4aS' \
    > test.out 2>&1
eval_tap $? 207 'AdminCreateJusticeUser' test.out

#- 208 AdminLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'hxnBrGIx' \
    --skipConflict  \
    --body '{"platformId": "NCxnJQAd", "platformUserId": "MEUiUYMY"}' \
    > test.out 2>&1
eval_tap $? 208 'AdminLinkPlatformAccount' test.out

#- 209 AdminGetUserLinkHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLinkHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'lnb1WfHK' \
    --platformId 'Mc9Wy1fX' \
    > test.out 2>&1
eval_tap $? 209 'AdminGetUserLinkHistoriesV3' test.out

#- 210 AdminPlatformUnlinkV3
eval_tap 0 210 'AdminPlatformUnlinkV3 # SKIP deprecated' test.out

#- 211 AdminPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'G2TYBXn5' \
    --userId 'Q8JH8K4U' \
    > test.out 2>&1
eval_tap $? 211 'AdminPlatformUnlinkAllV3' test.out

#- 212 AdminPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Ro10xVTB' \
    --userId 'EhbtThBA' \
    --ticket 'JZ234BLU' \
    > test.out 2>&1
eval_tap $? 212 'AdminPlatformLinkV3' test.out

#- 213 AdminDeleteUserLinkingHistoryByPlatformIDV3
eval_tap 0 213 'AdminDeleteUserLinkingHistoryByPlatformIDV3 # SKIP deprecated' test.out

#- 214 AdminDeleteUserLinkingRestrictionByPlatformIDV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserLinkingRestrictionByPlatformIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Fcur7R2C' \
    --userId 'j2e2p51a' \
    > test.out 2>&1
eval_tap $? 214 'AdminDeleteUserLinkingRestrictionByPlatformIDV3' test.out

#- 215 AdminGetThirdPartyPlatformTokenLinkStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetThirdPartyPlatformTokenLinkStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'yMG3WPoo' \
    --userId '0HZ54Wog' \
    --platformToken 'Ws6QWZyT' \
    > test.out 2>&1
eval_tap $? 215 'AdminGetThirdPartyPlatformTokenLinkStatusV3' test.out

#- 216 AdminGetUserSinglePlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminGetUserSinglePlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --platformId '5aOz3a7n' \
    --userId 'wmDE8Fq3' \
    --crossNamespace  \
    > test.out 2>&1
eval_tap $? 216 'AdminGetUserSinglePlatformAccount' test.out

#- 217 AdminDeleteUserRolesV3
eval_tap 0 217 'AdminDeleteUserRolesV3 # SKIP deprecated' test.out

#- 218 AdminSaveUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminSaveUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'AVYI10Ya' \
    --body '[{"namespace": "HtssNpKR", "roleId": "5ZIWVFe2"}, {"namespace": "f7FkJPLC", "roleId": "lKfyl31e"}, {"namespace": "lt06KbIK", "roleId": "2fGbk9Gp"}]' \
    > test.out 2>&1
eval_tap $? 218 'AdminSaveUserRoleV3' test.out

#- 219 AdminAddUserRoleV3
eval_tap 0 219 'AdminAddUserRoleV3 # SKIP deprecated' test.out

#- 220 AdminDeleteUserRoleV3
eval_tap 0 220 'AdminDeleteUserRoleV3 # SKIP deprecated' test.out

#- 221 AdminGetUserStateByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserStateByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'OvlTW8WI' \
    > test.out 2>&1
eval_tap $? 221 'AdminGetUserStateByUserIdV3' test.out

#- 222 AdminUpdateUserStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'OvC1xo2d' \
    --body '{"enabled": true, "reason": "ePGFJl8q"}' \
    > test.out 2>&1
eval_tap $? 222 'AdminUpdateUserStatusV3' test.out

#- 223 AdminTrustlyUpdateUserIdentity
./ng net.accelbyte.sdk.cli.Main iam adminTrustlyUpdateUserIdentity \
    --namespace "$AB_NAMESPACE" \
    --userId 'Jfc7uVsH' \
    --body '{"emailAddress": "XTvVNLmv", "password": "yQSVOlXg"}' \
    > test.out 2>&1
eval_tap $? 223 'AdminTrustlyUpdateUserIdentity' test.out

#- 224 AdminVerifyUserWithoutVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyUserWithoutVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'pZP2wkdM' \
    > test.out 2>&1
eval_tap $? 224 'AdminVerifyUserWithoutVerificationCodeV3' test.out

#- 225 AdminUpdateClientSecretV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientSecretV3 \
    --clientId 'KdjF3gfA' \
    --namespace "$AB_NAMESPACE" \
    --body '{"newSecret": "riBsYIeC"}' \
    > test.out 2>&1
eval_tap $? 225 'AdminUpdateClientSecretV3' test.out

#- 226 AdminCheckThirdPartyLoginPlatformAvailabilityV3
./ng net.accelbyte.sdk.cli.Main iam adminCheckThirdPartyLoginPlatformAvailabilityV3 \
    --platformId 'Vx876XB8' \
    > test.out 2>&1
eval_tap $? 226 'AdminCheckThirdPartyLoginPlatformAvailabilityV3' test.out

#- 227 GetThirdPartyLoginPlatformDefaultsV3
./ng net.accelbyte.sdk.cli.Main iam getThirdPartyLoginPlatformDefaultsV3 \
    --platformId 'b75nf2MM' \
    > test.out 2>&1
eval_tap $? 227 'GetThirdPartyLoginPlatformDefaultsV3' test.out

#- 228 AdminGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV3 \
    --after 'gTzj2LdN' \
    --before '31SsoVCH' \
    --isWildcard  \
    --limit '43' \
    > test.out 2>&1
eval_tap $? 228 'AdminGetRolesV3' test.out

#- 229 AdminCreateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV3 \
    --body '{"adminRole": false, "deletable": false, "isWildcard": true, "managers": [{"displayName": "tBGvH1rR", "namespace": "ZlggL7j9", "userId": "mfMrcFWg"}, {"displayName": "Knu2ahMa", "namespace": "LHn4bfkD", "userId": "L46Keu6I"}, {"displayName": "htVtudXa", "namespace": "E1n0TfFh", "userId": "vL9TkCuP"}], "members": [{"displayName": "g7SGPRAn", "namespace": "c3YxkCd6", "userId": "rRHiAaTB"}, {"displayName": "D2Qf0J15", "namespace": "MLHU3lhz", "userId": "KYhlWvzS"}, {"displayName": "ioJMI6n3", "namespace": "BPM2X2Ac", "userId": "vi4QGZ2y"}], "permissions": [{"action": 29, "resource": "LA72MhDz", "schedAction": 99, "schedCron": "62yBTmUp", "schedRange": ["EhtkA7fe", "DH3RUeSp", "PutfSpYK"]}, {"action": 33, "resource": "X9iTQYhP", "schedAction": 81, "schedCron": "F3wMfDCy", "schedRange": ["vy88GxBS", "E8ByVhuS", "HttlWy4V"]}, {"action": 32, "resource": "7pnbjl1r", "schedAction": 19, "schedCron": "DVejwETa", "schedRange": ["Kd9YbUce", "pWwaSxNF", "l9CIU2Qp"]}], "roleName": "zJzU6lRN"}' \
    > test.out 2>&1
eval_tap $? 229 'AdminCreateRoleV3' test.out

#- 230 AdminGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV3 \
    --roleId 'G8y24XUa' \
    > test.out 2>&1
eval_tap $? 230 'AdminGetRoleV3' test.out

#- 231 AdminDeleteRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV3 \
    --roleId '35snMRlb' \
    > test.out 2>&1
eval_tap $? 231 'AdminDeleteRoleV3' test.out

#- 232 AdminUpdateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV3 \
    --roleId 'gGrssQTP' \
    --body '{"deletable": true, "isWildcard": true, "roleName": "Ap9RJ0pp"}' \
    > test.out 2>&1
eval_tap $? 232 'AdminUpdateRoleV3' test.out

#- 233 AdminGetRoleAdminStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleAdminStatusV3 \
    --roleId 'iabOh43t' \
    > test.out 2>&1
eval_tap $? 233 'AdminGetRoleAdminStatusV3' test.out

#- 234 AdminUpdateAdminRoleStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateAdminRoleStatusV3 \
    --roleId 'gzZeOk3J' \
    > test.out 2>&1
eval_tap $? 234 'AdminUpdateAdminRoleStatusV3' test.out

#- 235 AdminRemoveRoleAdminV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleAdminV3 \
    --roleId 'o6K13n2a' \
    > test.out 2>&1
eval_tap $? 235 'AdminRemoveRoleAdminV3' test.out

#- 236 AdminGetRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleManagersV3 \
    --roleId '2nXz6TWa' \
    --after '0MOycEQl' \
    --before '29CcRSCz' \
    --limit '89' \
    > test.out 2>&1
eval_tap $? 236 'AdminGetRoleManagersV3' test.out

#- 237 AdminAddRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleManagersV3 \
    --roleId 'mQIAjPGT' \
    --body '{"managers": [{"displayName": "WxQSRiQW", "namespace": "HsC2iDvz", "userId": "9pHGm3v7"}, {"displayName": "u29sPBIz", "namespace": "jcEUa2NW", "userId": "5Lf8k57C"}, {"displayName": "n0Cwana9", "namespace": "yncAyBUv", "userId": "3flvEgDk"}]}' \
    > test.out 2>&1
eval_tap $? 237 'AdminAddRoleManagersV3' test.out

#- 238 AdminRemoveRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleManagersV3 \
    --roleId 'C9THRyGy' \
    --body '{"managers": [{"displayName": "t9NiBAsj", "namespace": "0jgLuAlo", "userId": "ezWMJvHY"}, {"displayName": "lMoP697J", "namespace": "4kQ2rvNp", "userId": "VwcUUhal"}, {"displayName": "KjNWpKPd", "namespace": "5T8QSvAe", "userId": "NHkIzzz4"}]}' \
    > test.out 2>&1
eval_tap $? 238 'AdminRemoveRoleManagersV3' test.out

#- 239 AdminGetRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleMembersV3 \
    --roleId 'uAqqbTJS' \
    --after '1UAWODMX' \
    --before 'XmIG5Zae' \
    --limit '21' \
    > test.out 2>&1
eval_tap $? 239 'AdminGetRoleMembersV3' test.out

#- 240 AdminAddRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleMembersV3 \
    --roleId 'phJdT2qW' \
    --body '{"members": [{"displayName": "fjeAU93p", "namespace": "EM4eBX75", "userId": "SZF058n1"}, {"displayName": "gAjdgFzO", "namespace": "o7PpP4Ly", "userId": "ty8QsYxB"}, {"displayName": "yLpTFtHW", "namespace": "tpjSBfF9", "userId": "VtH6ehx4"}]}' \
    > test.out 2>&1
eval_tap $? 240 'AdminAddRoleMembersV3' test.out

#- 241 AdminRemoveRoleMembersV3
eval_tap 0 241 'AdminRemoveRoleMembersV3 # SKIP deprecated' test.out

#- 242 AdminUpdateRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV3 \
    --roleId 'L9mJUYCY' \
    --body '{"permissions": [{"action": 86, "resource": "Sk9Vmi9C", "schedAction": 3, "schedCron": "yZWdzmhz", "schedRange": ["J5w0LnSR", "LcGFamaA", "jW1z8cYi"]}, {"action": 20, "resource": "46x2cUGv", "schedAction": 39, "schedCron": "GJGzxgfh", "schedRange": ["b1myEYtC", "FIiYZ7vD", "6ScEraqE"]}, {"action": 92, "resource": "dIj4EixY", "schedAction": 64, "schedCron": "Ia02bEGQ", "schedRange": ["vOwb2sD9", "0udnBECA", "rdG7vOTG"]}]}' \
    > test.out 2>&1
eval_tap $? 242 'AdminUpdateRolePermissionsV3' test.out

#- 243 AdminAddRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV3 \
    --roleId 'eGfH9WUK' \
    --body '{"permissions": [{"action": 67, "resource": "YeZKhE59", "schedAction": 51, "schedCron": "8PGfhXJw", "schedRange": ["PqfKFTt6", "lYjoMjJY", "ndievVA0"]}, {"action": 50, "resource": "E0mGyWzl", "schedAction": 20, "schedCron": "3gjlRKzb", "schedRange": ["K6qXwWrl", "mWyLndNq", "Qfx7LJWo"]}, {"action": 36, "resource": "MWw6IZvq", "schedAction": 67, "schedCron": "keUJw81v", "schedRange": ["kG5ef3wj", "baTDV5jz", "qTLQii9a"]}]}' \
    > test.out 2>&1
eval_tap $? 243 'AdminAddRolePermissionsV3' test.out

#- 244 AdminDeleteRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV3 \
    --roleId 'bV6Mu8OQ' \
    --body '["WSXnOAAy", "Lj43ooTu", "C4LVGBg5"]' \
    > test.out 2>&1
eval_tap $? 244 'AdminDeleteRolePermissionsV3' test.out

#- 245 AdminDeleteRolePermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionV3 \
    --action '80' \
    --resource 'lviE1npa' \
    --roleId 'nD9snv17' \
    > test.out 2>&1
eval_tap $? 245 'AdminDeleteRolePermissionV3' test.out

#- 246 AdminGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam adminGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 246 'AdminGetMyUserV3' test.out

#- 247 UserAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam userAuthenticationV3 \
    --clientId 'ApOkVP0o' \
    --extendExp  \
    --redirectUri 'GIEKJJE6' \
    --password 'QWPpPxeS' \
    --requestId '15GNwApD' \
    --userName 'TkP01ccD' \
    > test.out 2>&1
eval_tap $? 247 'UserAuthenticationV3' test.out

#- 248 AuthenticationWithPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV3 \
    --extendExp  \
    --clientId '5k7Xb0fi' \
    --linkingToken 'vzVIxrMX' \
    --password '5T5Ofh7r' \
    --username 'oH3rGVAJ' \
    > test.out 2>&1
eval_tap $? 248 'AuthenticationWithPlatformLinkV3' test.out

#- 249 AuthenticateAndLinkForwardV3
./ng net.accelbyte.sdk.cli.Main iam authenticateAndLinkForwardV3 \
    --extendExp  \
    --clientId 'urPrwi8X' \
    --linkingToken 'hM3ALuXJ' \
    --password '8mp4gYPH' \
    --username 'X1D0UQg1' \
    > test.out 2>&1
eval_tap $? 249 'AuthenticateAndLinkForwardV3' test.out

#- 250 PublicGetSystemConfigV3
./ng net.accelbyte.sdk.cli.Main iam publicGetSystemConfigV3 \
    > test.out 2>&1
eval_tap $? 250 'PublicGetSystemConfigV3' test.out

#- 251 GenerateTokenByNewHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV3 \
    --additionalData 'a6MUlAuD' \
    --extendExp  \
    --linkingToken 'cd0tARcB' \
    > test.out 2>&1
eval_tap $? 251 'GenerateTokenByNewHeadlessAccountV3' test.out

#- 252 RequestOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam requestOneTimeLinkingCodeV3 \
    --redirectUri 'HeD4vUXw' \
    --state '3vatM3kv' \
    --platformId '685Wnbcy' \
    > test.out 2>&1
eval_tap $? 252 'RequestOneTimeLinkingCodeV3' test.out

#- 253 ValidateOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam validateOneTimeLinkingCodeV3 \
    --oneTimeLinkCode 'YRhxsNjT' \
    > test.out 2>&1
eval_tap $? 253 'ValidateOneTimeLinkingCodeV3' test.out

#- 254 RequestTokenByOneTimeLinkCodeResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTokenByOneTimeLinkCodeResponseV3 \
    --additionalData '0Nxw958G' \
    --isTransient  \
    --clientId 'ycFklNpt' \
    --oneTimeLinkCode 'eTNj5Lqg' \
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
    --codeChallenge 'tAmwWRv6' \
    --codeChallengeMethod 'S256' \
    --clientId 'q9mBpuPm' \
    > test.out 2>&1
eval_tap $? 257 'RequestTokenExchangeCodeV3' test.out

#- 258 AdminRetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam adminRetrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Lvpn6ve9' \
    --userId 'gNxNI1h8' \
    --platformUserId 'Fgq3YZyC' \
    > test.out 2>&1
eval_tap $? 258 'AdminRetrieveUserThirdPartyPlatformTokenV3' test.out

#- 259 RevokeUserV3
./ng net.accelbyte.sdk.cli.Main iam revokeUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'NFGsoBKk' \
    --includeGameNamespace  \
    > test.out 2>&1
eval_tap $? 259 'RevokeUserV3' test.out

#- 260 AuthorizeV3
./ng net.accelbyte.sdk.cli.Main iam authorizeV3 \
    --blockedPlatformId 'qkKqPZvC' \
    --codeChallenge 'vqCQZcum' \
    --codeChallengeMethod 'S256' \
    --createHeadless  \
    --loginWebBased  \
    --nonce 'RGKuyQKy' \
    --oneTimeLinkCode 'C04tkn1f' \
    --redirectUri 'bB50rbgX' \
    --scope 'ECyNwy9A' \
    --state 'nahS9A2D' \
    --targetAuthPage 'CVBUUDdd' \
    --useRedirectUriAsLoginUrlWhenLocked  \
    --clientId '25KuCrRi' \
    --responseType 'code' \
    > test.out 2>&1
eval_tap $? 260 'AuthorizeV3' test.out

#- 261 TokenIntrospectionV3
./ng net.accelbyte.sdk.cli.Main iam tokenIntrospectionV3 \
    --token 'Li3jntrm' \
    > test.out 2>&1
eval_tap $? 261 'TokenIntrospectionV3' test.out

#- 262 GetJWKSV3
./ng net.accelbyte.sdk.cli.Main iam getJWKSV3 \
    > test.out 2>&1
eval_tap $? 262 'GetJWKSV3' test.out

#- 263 SendMFAAuthenticationCode
./ng net.accelbyte.sdk.cli.Main iam sendMFAAuthenticationCode \
    --clientId 'eMzIJF8h' \
    --factor 'vR7Ry9dp' \
    --mfaToken 'OYgjOz66' \
    > test.out 2>&1
eval_tap $? 263 'SendMFAAuthenticationCode' test.out

#- 264 Change2faMethod
./ng net.accelbyte.sdk.cli.Main iam change2faMethod \
    --factor 'dFOZ4CfV' \
    --mfaToken 'lExoOeRH' \
    > test.out 2>&1
eval_tap $? 264 'Change2faMethod' test.out

#- 265 Verify2faCode
./ng net.accelbyte.sdk.cli.Main iam verify2faCode \
    --code '0M0ebPuI' \
    --factor 'g3pSw7t3' \
    --mfaToken 'kf7nwRge' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 265 'Verify2faCode' test.out

#- 266 Verify2faCodeForward
./ng net.accelbyte.sdk.cli.Main iam verify2faCodeForward \
    --defaultFactor '7xzKY9SH' \
    --factors 'EpWSU4a0' \
    --rememberDevice  \
    --clientId '9kKGhAor' \
    --code 'IJcry3et' \
    --factor 'G9ORlp0x' \
    --mfaToken 'plloBtvr' \
    > test.out 2>&1
eval_tap $? 266 'Verify2faCodeForward' test.out

#- 267 OAuthDynamicClientRegisterWithNamespaceV3
./ng net.accelbyte.sdk.cli.Main iam oAuthDynamicClientRegisterWithNamespaceV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"client_name": "jAUdjQKU", "client_uri": "I9FOGr1x", "grant_types": ["6LXp40O7", "7hbOjYj7", "Ou8mA9if"], "redirect_uris": ["29CqhFo6", "zxuFNNx2", "VxuQnXFR"], "response_types": ["juBSiNrY", "sa5h5dXX", "u9wCP0Ay"], "scopes": ["kzvGPqHI", "xcxOxIVx", "e80SdLjM"], "token_endpoint_auth_method": "Ucv3Igen"}' \
    > test.out 2>&1
eval_tap $? 267 'OAuthDynamicClientRegisterWithNamespaceV3' test.out

#- 268 RetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam retrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'pbQG58q4' \
    --userId 'gGc8dqYm' \
    > test.out 2>&1
eval_tap $? 268 'RetrieveUserThirdPartyPlatformTokenV3' test.out

#- 269 AuthCodeRequestV3
./ng net.accelbyte.sdk.cli.Main iam authCodeRequestV3 \
    --platformId 'CnMQ7Abp' \
    --clientId 'p1oTvV7R' \
    --redirectUri 'wz3hhPnu' \
    --requestId 'kNuZxcBl' \
    > test.out 2>&1
eval_tap $? 269 'AuthCodeRequestV3' test.out

#- 270 PlatformTokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV3 \
    --platformId 'Br1FempX' \
    --additionalData 'mbNI7Ijm' \
    --clientId 'm6kMVUl1' \
    --createHeadless  \
    --deviceId 'uo73j4Yc' \
    --macAddress 'gUX63XUZ' \
    --platformToken 'sU8MPTuT' \
    --serviceLabel '0.4363516877641599' \
    --skipSetCookie  \
    > test.out 2>&1
eval_tap $? 270 'PlatformTokenGrantV3' test.out

#- 271 GetRevocationListV3
./ng net.accelbyte.sdk.cli.Main iam getRevocationListV3 \
    > test.out 2>&1
eval_tap $? 271 'GetRevocationListV3' test.out

#- 272 TokenRevocationV3
./ng net.accelbyte.sdk.cli.Main iam tokenRevocationV3 \
    --token 'YLbv9JgG' \
    > test.out 2>&1
eval_tap $? 272 'TokenRevocationV3' test.out

#- 273 SimultaneousLoginV3
./ng net.accelbyte.sdk.cli.Main iam simultaneousLoginV3 \
    --simultaneousPlatform 'S72WNyEI' \
    --simultaneousTicket '4uac6QMu' \
    --nativePlatform 'steam' \
    --nativePlatformTicket 'tVs2A47X' \
    > test.out 2>&1
eval_tap $? 273 'SimultaneousLoginV3' test.out

#- 274 TokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV3 \
    --additionalData 'dHKomI3M' \
    --clientId 'KSX0r7XL' \
    --clientSecret '7jnCqgfz' \
    --code 'EKtjqKcK' \
    --codeVerifier 'aGqKle0p' \
    --extendNamespace 'eBAm2RPS' \
    --extendExp  \
    --password 'cN0OAbhD' \
    --redirectUri 'fCHJ3QZO' \
    --refreshToken 'Jz3p9Su9' \
    --scope '8LFtlzL6' \
    --username 'fSafzJby' \
    --grantType 'urn:ietf:params:oauth:grant-type:extend_client_credentials' \
    > test.out 2>&1
eval_tap $? 274 'TokenGrantV3' test.out

#- 275 VerifyTokenV3
./ng net.accelbyte.sdk.cli.Main iam verifyTokenV3 \
    --token 'uUz1Trqm' \
    > test.out 2>&1
eval_tap $? 275 'VerifyTokenV3' test.out

#- 276 PlatformAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticationV3 \
    --platformId '6OCOg94c' \
    --code 'vygmoHyL' \
    --error '2XBgYT84' \
    --openidAssocHandle 'GJhzxIT8' \
    --openidClaimedId 'Yn2Ie8GV' \
    --openidIdentity 'atw0lw4V' \
    --openidMode 'BxNM0kgB' \
    --openidNs 'rJRWSawd' \
    --openidOpEndpoint 'm13ZaueM' \
    --openidResponseNonce '2xjvvU3G' \
    --openidReturnTo 'RsYmvc5R' \
    --openidSig '2scXFSL5' \
    --openidSigned 'PsOCCcUp' \
    --state 'R25iCl0S' \
    > test.out 2>&1
eval_tap $? 276 'PlatformAuthenticationV3' test.out

#- 277 PlatformTokenRefreshV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenRefreshV3 \
    --platformId '6E3A0l0P' \
    --platformToken '25dXW5IU' \
    > test.out 2>&1
eval_tap $? 277 'PlatformTokenRefreshV3' test.out

#- 278 PublicGetInputValidations
eval_tap 0 278 'PublicGetInputValidations # SKIP deprecated' test.out

#- 279 PublicGetInputValidationByField
eval_tap 0 279 'PublicGetInputValidationByField # SKIP deprecated' test.out

#- 280 PublicGetCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam publicGetCountryAgeRestrictionV3 \
    --countryCode 'arCyBy7R' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 280 'PublicGetCountryAgeRestrictionV3' test.out

#- 281 PublicGetConfigValueV3
./ng net.accelbyte.sdk.cli.Main iam publicGetConfigValueV3 \
    --configKey 'uIHnpClX' \
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
    --languageCode 'M0xgsz0f' \
    > test.out 2>&1
eval_tap $? 283 'PublicGetNamespaceScopedInputValidations' test.out

#- 284 PublicGetNamespaceScopedInputValidationByField
./ng net.accelbyte.sdk.cli.Main iam publicGetNamespaceScopedInputValidationByField \
    --field 'YUBOjURu' \
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
    --clientId 'McUJw6ef' \
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
    --requestId 'hhwaapeP' \
    > test.out 2>&1
eval_tap $? 290 'PublicGetAsyncStatus' test.out

#- 291 PublicSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam publicSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'qnYdFPUN' \
    --limit '4' \
    --offset '26' \
    --platformBy 'cq6DBSPd' \
    --platformId 'J9wAu0YO' \
    --query '1GTj8uKl' \
    > test.out 2>&1
eval_tap $? 291 'PublicSearchUserV3' test.out

#- 292 PublicCreateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "VsoucSGW", "acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "4qcWJcZh", "policyId": "wVeVffvU", "policyVersionId": "76ZiEeia"}, {"isAccepted": true, "localizedPolicyVersionId": "wXcjRjCn", "policyId": "i3wqwXQA", "policyVersionId": "sLQswSOE"}, {"isAccepted": true, "localizedPolicyVersionId": "AELv487o", "policyId": "oOYt0m6y", "policyVersionId": "AkZESre9"}], "authType": "Q72wMApw", "code": "Ds7Lrztz", "country": "4AbZhGar", "dateOfBirth": "SAOjhY2K", "displayName": "J8F6Fzh4", "emailAddress": "C9637Utw", "password": "ARTGSk9o", "reachMinimumAge": true, "uniqueDisplayName": "3qMGF6uX"}' \
    > test.out 2>&1
eval_tap $? 292 'PublicCreateUserV3' test.out

#- 293 CheckUserAvailability
./ng net.accelbyte.sdk.cli.Main iam checkUserAvailability \
    --namespace "$AB_NAMESPACE" \
    --field 'PcuxY7XP' \
    --query 'bsq4kdhK' \
    > test.out 2>&1
eval_tap $? 293 'CheckUserAvailability' test.out

#- 294 PublicBulkGetUsers
eval_tap 0 294 'PublicBulkGetUsers # SKIP deprecated' test.out

#- 295 PublicSendRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicSendRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "qaMWSO9u", "languageTag": "ggKBkY0G"}' \
    > test.out 2>&1
eval_tap $? 295 'PublicSendRegistrationCode' test.out

#- 296 PublicVerifyRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicVerifyRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "NQkWpAq9", "emailAddress": "lftaI25J"}' \
    > test.out 2>&1
eval_tap $? 296 'PublicVerifyRegistrationCode' test.out

#- 297 PublicForgotPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicForgotPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "mdshdViA", "languageTag": "WpA0LL5u"}' \
    > test.out 2>&1
eval_tap $? 297 'PublicForgotPasswordV3' test.out

#- 298 PublicValidateUserInput
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserInput \
    --namespace "$AB_NAMESPACE" \
    --body '{"displayName": "VRdIwFLt", "password": "NOEhPOpD", "uniqueDisplayName": "bDhVN7OE", "username": "IdsckT5a"}' \
    > test.out 2>&1
eval_tap $? 298 'PublicValidateUserInput' test.out

#- 299 GetAdminInvitationV3
./ng net.accelbyte.sdk.cli.Main iam getAdminInvitationV3 \
    --invitationId 'r3lx8YpD' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 299 'GetAdminInvitationV3' test.out

#- 300 CreateUserFromInvitationV3
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV3 \
    --invitationId 'd6KOFVKe' \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "h3uWmlza", "acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "gjgA6mFv", "policyId": "QQBQx69r", "policyVersionId": "XVRAvYst"}, {"isAccepted": false, "localizedPolicyVersionId": "4MkHzg0H", "policyId": "LYQPZ5hZ", "policyVersionId": "E8cob9Ys"}, {"isAccepted": true, "localizedPolicyVersionId": "e44gNFuH", "policyId": "91p2VsGP", "policyVersionId": "esM63J73"}], "authType": "H4xk4Z1I", "code": "8dazpqoz", "country": "MSgPOIbW", "dateOfBirth": "3QRn9HL4", "displayName": "Yf3voyDw", "emailAddress": "p4OXduhq", "password": "aZofiDkB", "reachMinimumAge": true, "uniqueDisplayName": "lqQ6YgFR"}' \
    > test.out 2>&1
eval_tap $? 300 'CreateUserFromInvitationV3' test.out

#- 301 UpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam updateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "LKMrWGVz", "country": "ZLsfZRqG", "dateOfBirth": "SFAJQ1Hg", "displayName": "iLd6kjk6", "languageTag": "CAp6ZJi1", "uniqueDisplayName": "WjPbaxIE", "userName": "vQcMeVF2"}' \
    > test.out 2>&1
eval_tap $? 301 'UpdateUserV3' test.out

#- 302 PublicPartialUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicPartialUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "W6FEyXf3", "country": "neOUCjz8", "dateOfBirth": "2VweM5mz", "displayName": "geTMMlZW", "languageTag": "7CnYFeqJ", "uniqueDisplayName": "B8XNrKOZ", "userName": "mOMK6jfJ"}' \
    > test.out 2>&1
eval_tap $? 302 'PublicPartialUpdateUserV3' test.out

#- 303 PublicSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"context": "wleQ5YfN", "emailAddress": "TgSy7KCw", "languageTag": "jp5glJIx", "upgradeToken": "HBPk23Uu"}' \
    > test.out 2>&1
eval_tap $? 303 'PublicSendVerificationCodeV3' test.out

#- 304 PublicUserVerificationV3
./ng net.accelbyte.sdk.cli.Main iam publicUserVerificationV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "Jwaxz0W2", "contactType": "MU2TYCZm", "languageTag": "S1jVMKMj", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 304 'PublicUserVerificationV3' test.out

#- 305 PublicUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "eu0Wl8MQ", "country": "u3dmcKOv", "dateOfBirth": "JMhLtrfS", "displayName": "DeT7g9Cn", "emailAddress": "a4ccgvls", "password": "n8NVy9D5", "uniqueDisplayName": "nFVdXNVn", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 305 'PublicUpgradeHeadlessAccountV3' test.out

#- 306 PublicVerifyHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --needVerificationCode  \
    --body '{"emailAddress": "RgWS6sae", "password": "6LSK2ang"}' \
    > test.out 2>&1
eval_tap $? 306 'PublicVerifyHeadlessAccountV3' test.out

#- 307 PublicUpdatePasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicUpdatePasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"languageTag": "dTHupFIH", "mfaToken": "FNh8jfXG", "newPassword": "HKRadmcQ", "oldPassword": "l87R97Nm"}' \
    > test.out 2>&1
eval_tap $? 307 'PublicUpdatePasswordV3' test.out

#- 308 PublicCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam publicCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'ImSpVCC3' \
    > test.out 2>&1
eval_tap $? 308 'PublicCreateJusticeUser' test.out

#- 309 PublicPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'uN2mSNSp' \
    --redirectUri '8gxqKoNH' \
    --ticket 'txo12fCq' \
    > test.out 2>&1
eval_tap $? 309 'PublicPlatformLinkV3' test.out

#- 310 PublicPlatformUnlinkV3
eval_tap 0 310 'PublicPlatformUnlinkV3 # SKIP deprecated' test.out

#- 311 PublicPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'NnTgxX4f' \
    > test.out 2>&1
eval_tap $? 311 'PublicPlatformUnlinkAllV3' test.out

#- 312 PublicForcePlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicForcePlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'mbX1Azkt' \
    --ticket 'AzeV5DFa' \
    > test.out 2>&1
eval_tap $? 312 'PublicForcePlatformLinkV3' test.out

#- 313 PublicWebLinkPlatform
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatform \
    --namespace "$AB_NAMESPACE" \
    --platformId 'qeszQ7Ge' \
    --clientId 'zbTypQY2' \
    --redirectUri '9O0j54UN' \
    > test.out 2>&1
eval_tap $? 313 'PublicWebLinkPlatform' test.out

#- 314 PublicWebLinkPlatformEstablish
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatformEstablish \
    --namespace "$AB_NAMESPACE" \
    --platformId 'EepROZC8' \
    --code '6DYQOsmO' \
    --state 'XYC5soAi' \
    > test.out 2>&1
eval_tap $? 314 'PublicWebLinkPlatformEstablish' test.out

#- 315 PublicProcessWebLinkPlatformV3
./ng net.accelbyte.sdk.cli.Main iam publicProcessWebLinkPlatformV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '23HTmryI' \
    --code 'aPgEi9Zh' \
    --state 'qeEOTwrg' \
    > test.out 2>&1
eval_tap $? 315 'PublicProcessWebLinkPlatformV3' test.out

#- 316 PublicWebReauthPlatform
./ng net.accelbyte.sdk.cli.Main iam publicWebReauthPlatform \
    --namespace "$AB_NAMESPACE" \
    --platformId 'tUsXPCmp' \
    --clientId 'Dy8JAiKY' \
    --redirectUri 'In1oQ4N1' \
    --operation 'LINK' \
    > test.out 2>&1
eval_tap $? 316 'PublicWebReauthPlatform' test.out

#- 317 PublicWebReauthPlatformEstablish
./ng net.accelbyte.sdk.cli.Main iam publicWebReauthPlatformEstablish \
    --namespace "$AB_NAMESPACE" \
    --platformId '7hBEc7hg' \
    --code 'cfU68EWS' \
    --state '3yBOUf1C' \
    > test.out 2>&1
eval_tap $? 317 'PublicWebReauthPlatformEstablish' test.out

#- 318 PublicWebReauthPlatformProcess
./ng net.accelbyte.sdk.cli.Main iam publicWebReauthPlatformProcess \
    --namespace "$AB_NAMESPACE" \
    --platformId 'd8cLbEaX' \
    --code '3mwHCqDC' \
    --state '5tOrrTNS' \
    > test.out 2>&1
eval_tap $? 318 'PublicWebReauthPlatformProcess' test.out

#- 319 PublicGetUsersPlatformInfosV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUsersPlatformInfosV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"platformId": "3ON0utm6", "userIds": ["VgOxrVwX", "ckMpB4Nk", "fU6sAc0p"]}' \
    > test.out 2>&1
eval_tap $? 319 'PublicGetUsersPlatformInfosV3' test.out

#- 320 ResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam resetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientId": "54aMxjuD", "code": "sMNlT9Ai", "emailAddress": "p7IJOe8M", "languageTag": "NEQIn6RO", "newPassword": "7S5QzkW0"}' \
    > test.out 2>&1
eval_tap $? 320 'ResetPasswordV3' test.out

#- 321 PublicGetUserByUserIdV3
eval_tap 0 321 'PublicGetUserByUserIdV3 # SKIP deprecated' test.out

#- 322 PublicGetUserBanHistoryV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserBanHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Y9Oq7vgN' \
    --activeOnly  \
    --limit '0' \
    --offset '93' \
    > test.out 2>&1
eval_tap $? 322 'PublicGetUserBanHistoryV3' test.out

#- 323 PublicListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'msoqXcE7' \
    > test.out 2>&1
eval_tap $? 323 'PublicListUserAllPlatformAccountsDistinctV3' test.out

#- 324 PublicGetUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'S1LywX3L' \
    > test.out 2>&1
eval_tap $? 324 'PublicGetUserInformationV3' test.out

#- 325 PublicGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'vqzX5YzE' \
    --after '0.1368554511881669' \
    --before '0.7799287853755325' \
    --limit '53' \
    > test.out 2>&1
eval_tap $? 325 'PublicGetUserLoginHistoriesV3' test.out

#- 326 PublicGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'DpswJb8i' \
    --after 'PeGPPa3Y' \
    --before 'j1Sp44iD' \
    --limit '37' \
    --platformId 'QNvRif5l' \
    > test.out 2>&1
eval_tap $? 326 'PublicGetUserPlatformAccountsV3' test.out

#- 327 PublicListJusticePlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicListJusticePlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'DelADmiE' \
    > test.out 2>&1
eval_tap $? 327 'PublicListJusticePlatformAccountsV3' test.out

#- 328 PublicLinkPlatformAccount
eval_tap 0 328 'PublicLinkPlatformAccount # SKIP deprecated' test.out

#- 329 PublicForceLinkPlatformWithProgression
./ng net.accelbyte.sdk.cli.Main iam publicForceLinkPlatformWithProgression \
    --namespace "$AB_NAMESPACE" \
    --userId 'MOASGRgb' \
    --body '{"chosenNamespaces": ["N9cMgg3m", "so2xOjSc", "VxOLn2LR"], "requestId": "IXClZgt2"}' \
    > test.out 2>&1
eval_tap $? 329 'PublicForceLinkPlatformWithProgression' test.out

#- 330 PublicGetPublisherUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetPublisherUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'RI50rWKh' \
    > test.out 2>&1
eval_tap $? 330 'PublicGetPublisherUserV3' test.out

#- 331 PublicValidateUserByUserIDAndPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserByUserIDAndPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'fgXPn76f' \
    --password '9pIdWnTw' \
    > test.out 2>&1
eval_tap $? 331 'PublicValidateUserByUserIDAndPasswordV3' test.out

#- 332 PublicGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRolesV3 \
    --after 'xNTF07hI' \
    --before 'MI8DApHY' \
    --isWildcard  \
    --limit '43' \
    > test.out 2>&1
eval_tap $? 332 'PublicGetRolesV3' test.out

#- 333 PublicGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRoleV3 \
    --roleId '11DrJ0P5' \
    > test.out 2>&1
eval_tap $? 333 'PublicGetRoleV3' test.out

#- 334 PublicForgotPasswordWithoutNamespaceV3
./ng net.accelbyte.sdk.cli.Main iam publicForgotPasswordWithoutNamespaceV3 \
    --body '{"clientId": "mih1WNjR", "emailAddress": "7dqIMAuD", "languageTag": "9cRuMejO"}' \
    > test.out 2>&1
eval_tap $? 334 'PublicForgotPasswordWithoutNamespaceV3' test.out

#- 335 PublicGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyUserV3 \
    --includeAllPlatforms  \
    > test.out 2>&1
eval_tap $? 335 'PublicGetMyUserV3' test.out

#- 336 PublicSendCodeForwardV3
./ng net.accelbyte.sdk.cli.Main iam publicSendCodeForwardV3 \
    --body '{"context": "VfFdfgrY", "emailAddress": "h4eVQ1eI", "languageTag": "3kqd8bKP", "upgradeToken": "hT3T5xDQ"}' \
    > test.out 2>&1
eval_tap $? 336 'PublicSendCodeForwardV3' test.out

#- 337 PublicGetLinkHeadlessAccountToMyAccountConflictV3
./ng net.accelbyte.sdk.cli.Main iam publicGetLinkHeadlessAccountToMyAccountConflictV3 \
    --oneTimeLinkCode 'fCm6NMn1' \
    > test.out 2>&1
eval_tap $? 337 'PublicGetLinkHeadlessAccountToMyAccountConflictV3' test.out

#- 338 LinkHeadlessAccountToMyAccountV3
./ng net.accelbyte.sdk.cli.Main iam linkHeadlessAccountToMyAccountV3 \
    --body '{"chosenNamespaces": ["li6bKmPY", "8Ht6ueBw", "Ouuu2c1T"], "oneTimeLinkCode": "PA8fDAmc"}' \
    > test.out 2>&1
eval_tap $? 338 'LinkHeadlessAccountToMyAccountV3' test.out

#- 339 PublicGetMyRedirectionAfterLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyRedirectionAfterLinkV3 \
    --oneTimeLinkCode 'h6IYDABk' \
    > test.out 2>&1
eval_tap $? 339 'PublicGetMyRedirectionAfterLinkV3' test.out

#- 340 PublicGetMyProfileAllowUpdateStatusV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyProfileAllowUpdateStatusV3 \
    > test.out 2>&1
eval_tap $? 340 'PublicGetMyProfileAllowUpdateStatusV3' test.out

#- 341 PublicSendVerificationLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationLinkV3 \
    --body '{"languageTag": "zQL8ndjP"}' \
    > test.out 2>&1
eval_tap $? 341 'PublicSendVerificationLinkV3' test.out

#- 342 PublicGetOpenidUserInfoV3
./ng net.accelbyte.sdk.cli.Main iam publicGetOpenidUserInfoV3 \
    > test.out 2>&1
eval_tap $? 342 'PublicGetOpenidUserInfoV3' test.out

#- 343 PublicVerifyUserByLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyUserByLinkV3 \
    --code 'KmvRyb7q' \
    > test.out 2>&1
eval_tap $? 343 'PublicVerifyUserByLinkV3' test.out

#- 344 PlatformAuthenticateSAMLV3Handler
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticateSAMLV3Handler \
    --platformId 'U2wDsxRw' \
    --code 'QWa6S4fV' \
    --error 'yZhTyNAg' \
    --state 'dGwnASHb' \
    > test.out 2>&1
eval_tap $? 344 'PlatformAuthenticateSAMLV3Handler' test.out

#- 345 LoginSSOClient
./ng net.accelbyte.sdk.cli.Main iam loginSSOClient \
    --platformId 'X3E5ivm2' \
    --payload 'rdEEPV98' \
    > test.out 2>&1
eval_tap $? 345 'LoginSSOClient' test.out

#- 346 LogoutSSOClient
./ng net.accelbyte.sdk.cli.Main iam logoutSSOClient \
    --platformId 'H0NxWK17' \
    > test.out 2>&1
eval_tap $? 346 'LogoutSSOClient' test.out

#- 347 RequestTargetTokenResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTargetTokenResponseV3 \
    --additionalData 'PLYPT8Se' \
    --code '2QUV6qON' \
    > test.out 2>&1
eval_tap $? 347 'RequestTargetTokenResponseV3' test.out

#- 348 UpgradeAndAuthenticateForwardV3
./ng net.accelbyte.sdk.cli.Main iam upgradeAndAuthenticateForwardV3 \
    --clientId 'HLxouM8e' \
    --upgradeSuccessToken 'cFnlik9u' \
    > test.out 2>&1
eval_tap $? 348 'UpgradeAndAuthenticateForwardV3' test.out

#- 349 AdminListInvitationHistoriesV4
./ng net.accelbyte.sdk.cli.Main iam adminListInvitationHistoriesV4 \
    --limit '44' \
    --namespace "$AB_NAMESPACE" \
    --offset '48' \
    > test.out 2>&1
eval_tap $? 349 'AdminListInvitationHistoriesV4' test.out

#- 350 AdminGetDevicesByUserV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDevicesByUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '75wjR8rZ' \
    > test.out 2>&1
eval_tap $? 350 'AdminGetDevicesByUserV4' test.out

#- 351 AdminGetBannedDevicesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedDevicesV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceType 'PUWR9lQY' \
    --endDate 'RdjohzEW' \
    --limit '18' \
    --offset '29' \
    --startDate '3UgUATH3' \
    > test.out 2>&1
eval_tap $? 351 'AdminGetBannedDevicesV4' test.out

#- 352 AdminGetUserDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeviceBansV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'anO5IKQV' \
    > test.out 2>&1
eval_tap $? 352 'AdminGetUserDeviceBansV4' test.out

#- 353 AdminBanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminBanDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"comment": "4fH6VIEd", "deviceId": "p7VG78wj", "deviceType": "u5R5fLOR", "enabled": false, "endDate": "ExLdIkGH", "ext": {"6Jc5SZdw": {}, "2pFc0yE3": {}, "p284wJMk": {}}, "reason": "qqw5YGXe"}' \
    > test.out 2>&1
eval_tap $? 353 'AdminBanDeviceV4' test.out

#- 354 AdminGetDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBanV4 \
    --banId '8xPMBXCc' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 354 'AdminGetDeviceBanV4' test.out

#- 355 AdminUpdateDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateDeviceBanV4 \
    --banId 'mpYscv09' \
    --namespace "$AB_NAMESPACE" \
    --body '{"enabled": true}' \
    > test.out 2>&1
eval_tap $? 355 'AdminUpdateDeviceBanV4' test.out

#- 356 AdminGenerateReportV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateReportV4 \
    --namespace "$AB_NAMESPACE" \
    --endDate 'jDg5r2bo' \
    --startDate 'cEH0G53h' \
    --deviceType '7DCo2vhJ' \
    > test.out 2>&1
eval_tap $? 356 'AdminGenerateReportV4' test.out

#- 357 AdminGetDeviceTypesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceTypesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 357 'AdminGetDeviceTypesV4' test.out

#- 358 AdminGetDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBansV4 \
    --deviceId 'RYgrtp5h' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 358 'AdminGetDeviceBansV4' test.out

#- 359 AdminDecryptDeviceV4
eval_tap 0 359 'AdminDecryptDeviceV4 # SKIP deprecated' test.out

#- 360 AdminUnbanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminUnbanDeviceV4 \
    --deviceId 'l4spFAmy' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 360 'AdminUnbanDeviceV4' test.out

#- 361 AdminGetUsersByDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUsersByDeviceV4 \
    --deviceId 'k8RD2SC4' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 361 'AdminGetUsersByDeviceV4' test.out

#- 362 AdminGetNamespaceInvitationHistoryV4
./ng net.accelbyte.sdk.cli.Main iam adminGetNamespaceInvitationHistoryV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 362 'AdminGetNamespaceInvitationHistoryV4' test.out

#- 363 AdminGetNamespaceUserInvitationHistoryV4
./ng net.accelbyte.sdk.cli.Main iam adminGetNamespaceUserInvitationHistoryV4 \
    --namespace "$AB_NAMESPACE" \
    --limit '54' \
    --offset '90' \
    > test.out 2>&1
eval_tap $? 363 'AdminGetNamespaceUserInvitationHistoryV4' test.out

#- 364 AdminCreateTestUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateTestUsersV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "bdEpFWoX", "policyId": "Zep1vDqp", "policyVersionId": "HKBzWtb4"}, {"isAccepted": false, "localizedPolicyVersionId": "zFqDGMmA", "policyId": "bPRdixoT", "policyVersionId": "337COcSK"}, {"isAccepted": false, "localizedPolicyVersionId": "HEp9LyU3", "policyId": "cbqn3Xuh", "policyVersionId": "yTRL6u09"}], "count": 85, "userInfo": {"country": "DFJGKxUY"}}' \
    > test.out 2>&1
eval_tap $? 364 'AdminCreateTestUsersV4' test.out

#- 365 AdminCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "q0UNwUtl", "policyId": "iWj37DPG", "policyVersionId": "VZ4fzb5a"}, {"isAccepted": false, "localizedPolicyVersionId": "UJ2OFQ63", "policyId": "Q0Xu4Eae", "policyVersionId": "QkYRGSN9"}, {"isAccepted": false, "localizedPolicyVersionId": "WkF5oFOm", "policyId": "d4lihkIo", "policyVersionId": "OcPuXoqt"}], "authType": "EMAILPASSWD", "code": "tC11PR8w", "country": "KcWOMq3H", "dateOfBirth": "0eSUwL0t", "displayName": "hzSC2F85", "emailAddress": "N9H1NOWu", "password": "3sYNixsK", "passwordMD5Sum": "HPj0tcwS", "reachMinimumAge": true, "uniqueDisplayName": "V3rUWe1C", "username": "Rzag61OJ"}' \
    > test.out 2>&1
eval_tap $? 365 'AdminCreateUserV4' test.out

#- 366 AdminBulkUpdateUserAccountTypeV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateUserAccountTypeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"testAccount": true, "userIds": ["WUsFLjiV", "smJnw3FM", "WXmYIcHm"]}' \
    > test.out 2>&1
eval_tap $? 366 'AdminBulkUpdateUserAccountTypeV4' test.out

#- 367 AdminBulkCheckValidUserIDV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkCheckValidUserIDV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["OSZlirhN", "NJj4PFwO", "wLw4ABfY"]}' \
    > test.out 2>&1
eval_tap $? 367 'AdminBulkCheckValidUserIDV4' test.out

#- 368 AdminUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'lhRzguav' \
    --body '{"avatarUrl": "WW6NbcgU", "country": "IHkHwAcf", "dateOfBirth": "VVWYAL7g", "displayName": "WIzmaCwv", "languageTag": "ZUDfin3t", "skipLoginQueue": false, "tags": ["vnAvhFfA", "gQE4qV3j", "kkQGXxOe"], "uniqueDisplayName": "imEAprKk", "userName": "As80hm3d"}' \
    > test.out 2>&1
eval_tap $? 368 'AdminUpdateUserV4' test.out

#- 369 AdminUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'JxeJxeBd' \
    --body '{"code": "mfnpFiMz", "emailAddress": "B0K8I0lf"}' \
    > test.out 2>&1
eval_tap $? 369 'AdminUpdateUserEmailAddressV4' test.out

#- 370 AdminDisableUserMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableUserMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '5gACaRvo' \
    --body '{"factor": "eKlDLT9e", "mfaToken": "NLZaKqXR"}' \
    > test.out 2>&1
eval_tap $? 370 'AdminDisableUserMFAV4' test.out

#- 371 AdminGetUserMFAStatusV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUserMFAStatusV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '4gAmurpw' \
    > test.out 2>&1
eval_tap $? 371 'AdminGetUserMFAStatusV4' test.out

#- 372 AdminListUserRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminListUserRolesV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'tpoXQDfq' \
    > test.out 2>&1
eval_tap $? 372 'AdminListUserRolesV4' test.out

#- 373 AdminUpdateUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'GDhVjRQ1' \
    --body '{"assignedNamespaces": ["z5gnUiTd", "gBJnalVb", "DNU9bmKv"], "roleId": "8M2ZOANw"}' \
    > test.out 2>&1
eval_tap $? 373 'AdminUpdateUserRoleV4' test.out

#- 374 AdminAddUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'JjV6ogRr' \
    --body '{"assignedNamespaces": ["qa91otnG", "rAGOot1X", "aW7Kzxw3"], "roleId": "aPOupB7w"}' \
    > test.out 2>&1
eval_tap $? 374 'AdminAddUserRoleV4' test.out

#- 375 AdminRemoveUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRemoveUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ryJtJ3a1' \
    --body '{"assignedNamespaces": ["sVx8gejW", "yrePBSlS", "srjmEqzE"], "roleId": "Pd10xmi7"}' \
    > test.out 2>&1
eval_tap $? 375 'AdminRemoveUserRoleV4' test.out

#- 376 AdminGetRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV4 \
    --adminRole  \
    --isWildcard  \
    --limit '35' \
    --offset '55' \
    > test.out 2>&1
eval_tap $? 376 'AdminGetRolesV4' test.out

#- 377 AdminCreateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV4 \
    --body '{"adminRole": true, "deletable": false, "isWildcard": true, "roleName": "ofXCah4a"}' \
    > test.out 2>&1
eval_tap $? 377 'AdminCreateRoleV4' test.out

#- 378 AdminGetRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV4 \
    --roleId 'qlzVaNPD' \
    > test.out 2>&1
eval_tap $? 378 'AdminGetRoleV4' test.out

#- 379 AdminDeleteRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV4 \
    --roleId 'u6dBez98' \
    > test.out 2>&1
eval_tap $? 379 'AdminDeleteRoleV4' test.out

#- 380 AdminUpdateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV4 \
    --roleId 'sE7pjL9l' \
    --body '{"adminRole": false, "deletable": true, "isWildcard": false, "roleName": "Wg6wlzEo"}' \
    > test.out 2>&1
eval_tap $? 380 'AdminUpdateRoleV4' test.out

#- 381 AdminUpdateRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV4 \
    --roleId 'S2apKW3e' \
    --body '{"permissions": [{"action": 99, "resource": "I4guPdKL", "schedAction": 73, "schedCron": "SQONWAlh", "schedRange": ["M4OYBYS5", "kZe1rebt", "JhEle6iz"]}, {"action": 62, "resource": "KmxrjvSy", "schedAction": 90, "schedCron": "l4lmq58k", "schedRange": ["i7QWdLmY", "azqXtUlZ", "amIImioS"]}, {"action": 53, "resource": "3qU3ZJGV", "schedAction": 3, "schedCron": "ObiUmv0L", "schedRange": ["ll28HPBg", "4toCKznk", "r49gbHKH"]}]}' \
    > test.out 2>&1
eval_tap $? 381 'AdminUpdateRolePermissionsV4' test.out

#- 382 AdminAddRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV4 \
    --roleId 'MIgdQgdf' \
    --body '{"permissions": [{"action": 81, "resource": "VeLdgPT3", "schedAction": 68, "schedCron": "zaWDLiGx", "schedRange": ["YzLx3Qr9", "WkB08rqv", "Dqu7H2TW"]}, {"action": 45, "resource": "cWIQcnvj", "schedAction": 20, "schedCron": "nFJMUm9U", "schedRange": ["NHe2Q6r6", "aOaXr3g3", "OV02w8Gr"]}, {"action": 14, "resource": "dI5rBPzE", "schedAction": 27, "schedCron": "OiPMFhg1", "schedRange": ["3sLrzl8w", "Ec2iU2IF", "yKhD5AAg"]}]}' \
    > test.out 2>&1
eval_tap $? 382 'AdminAddRolePermissionsV4' test.out

#- 383 AdminDeleteRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV4 \
    --roleId 'WeOgO1ql' \
    --body '["jcgsprfP", "SU1FaSTe", "ke9XxXrb"]' \
    > test.out 2>&1
eval_tap $? 383 'AdminDeleteRolePermissionsV4' test.out

#- 384 AdminListAssignedUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminListAssignedUsersV4 \
    --roleId 'iK7CnNHx' \
    --after 'BV9KvVKE' \
    --before 'AfMjjm28' \
    --limit '45' \
    > test.out 2>&1
eval_tap $? 384 'AdminListAssignedUsersV4' test.out

#- 385 AdminAssignUserToRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAssignUserToRoleV4 \
    --roleId '17GGRmiG' \
    --body '{"assignedNamespaces": ["UO7PuoRK", "FeQE9WBf", "6XzcZA2L"], "namespace": "ccIqN3Pn", "userId": "YAbnLNYj"}' \
    > test.out 2>&1
eval_tap $? 385 'AdminAssignUserToRoleV4' test.out

#- 386 AdminRevokeUserFromRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRevokeUserFromRoleV4 \
    --roleId 'jtZqcF7A' \
    --body '{"namespace": "iPOu0kbI", "userId": "slJBzdHR"}' \
    > test.out 2>&1
eval_tap $? 386 'AdminRevokeUserFromRoleV4' test.out

#- 387 AdminInviteUserNewV4
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserNewV4 \
    --body '{"assignedNamespaces": ["x7FCp87o", "DKFygYoG", "jE4Wh8WQ"], "emailAddresses": ["WJaTLCEs", "xw0IWd6n", "dG6PBDG5"], "isAdmin": true, "isNewStudio": true, "languageTag": "jb1sM7rN", "namespace": "eSZI4chr", "roleId": "Y2D23EIV"}' \
    > test.out 2>&1
eval_tap $? 387 'AdminInviteUserNewV4' test.out

#- 388 AdminUpdateMyUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateMyUserV4 \
    --body '{"avatarUrl": "xqG1ogR4", "country": "ceT8uU8o", "dateOfBirth": "KFWpIoHW", "displayName": "FG1Dljcm", "languageTag": "e453ubmo", "skipLoginQueue": false, "tags": ["QmoEDjLm", "9cPLZBOW", "sSuul3YK"], "uniqueDisplayName": "dNsTKrhN", "userName": "wIxpZQJf"}' \
    > test.out 2>&1
eval_tap $? 388 'AdminUpdateMyUserV4' test.out

#- 389 AdminDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyAuthenticatorV4 \
    --body '{"factor": "xGrWBEFY", "mfaToken": "mgybRthw"}' \
    > test.out 2>&1
eval_tap $? 389 'AdminDisableMyAuthenticatorV4' test.out

#- 390 AdminEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyAuthenticatorV4 \
    --code 'g4DQBOuA' \
    > test.out 2>&1
eval_tap $? 390 'AdminEnableMyAuthenticatorV4' test.out

#- 391 AdminGenerateMyAuthenticatorKeyV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateMyAuthenticatorKeyV4 \
    > test.out 2>&1
eval_tap $? 391 'AdminGenerateMyAuthenticatorKeyV4' test.out

#- 392 AdminGetMyBackupCodesV4
eval_tap 0 392 'AdminGetMyBackupCodesV4 # SKIP deprecated' test.out

#- 393 AdminGenerateMyBackupCodesV4
eval_tap 0 393 'AdminGenerateMyBackupCodesV4 # SKIP deprecated' test.out

#- 394 AdminDisableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyBackupCodesV4 \
    --body '{"factor": "8nFsZu1I", "mfaToken": "BetTFQl3"}' \
    > test.out 2>&1
eval_tap $? 394 'AdminDisableMyBackupCodesV4' test.out

#- 395 AdminDownloadMyBackupCodesV4
eval_tap 0 395 'AdminDownloadMyBackupCodesV4 # SKIP deprecated' test.out

#- 396 AdminEnableMyBackupCodesV4
eval_tap 0 396 'AdminEnableMyBackupCodesV4 # SKIP deprecated' test.out

#- 397 AdminGetBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBackupCodesV4 \
    --languageTag 'lxKTlISY' \
    > test.out 2>&1
eval_tap $? 397 'AdminGetBackupCodesV4' test.out

#- 398 AdminGenerateBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateBackupCodesV4 \
    --languageTag 'tQNBNIMn' \
    > test.out 2>&1
eval_tap $? 398 'AdminGenerateBackupCodesV4' test.out

#- 399 AdminEnableBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableBackupCodesV4 \
    --languageTag 'lRTStQ0q' \
    > test.out 2>&1
eval_tap $? 399 'AdminEnableBackupCodesV4' test.out

#- 400 AdminChallengeMyMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminChallengeMyMFAV4 \
    --code 'Ji1fpVWo' \
    --factor 'heqe9jAx' \
    > test.out 2>&1
eval_tap $? 400 'AdminChallengeMyMFAV4' test.out

#- 401 AdminSendMyMFAEmailCodeV4
./ng net.accelbyte.sdk.cli.Main iam adminSendMyMFAEmailCodeV4 \
    --action 'oxZ27o3G' \
    --languageTag 'aGsPW4OB' \
    > test.out 2>&1
eval_tap $? 401 'AdminSendMyMFAEmailCodeV4' test.out

#- 402 AdminDisableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyEmailV4 \
    --body '{"factor": "CvgRlAM3", "mfaToken": "jq1o2ekc"}' \
    > test.out 2>&1
eval_tap $? 402 'AdminDisableMyEmailV4' test.out

#- 403 AdminEnableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyEmailV4 \
    --code 'gk1ZeCmf' \
    > test.out 2>&1
eval_tap $? 403 'AdminEnableMyEmailV4' test.out

#- 404 AdminGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyEnabledFactorsV4 \
    > test.out 2>&1
eval_tap $? 404 'AdminGetMyEnabledFactorsV4' test.out

#- 405 AdminMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam adminMakeFactorMyDefaultV4 \
    --factor 'r45ml9QO' \
    > test.out 2>&1
eval_tap $? 405 'AdminMakeFactorMyDefaultV4' test.out

#- 406 AdminGetMyOwnMFAStatusV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyOwnMFAStatusV4 \
    > test.out 2>&1
eval_tap $? 406 'AdminGetMyOwnMFAStatusV4' test.out

#- 407 AdminGetMyMFAStatusV4
eval_tap 0 407 'AdminGetMyMFAStatusV4 # SKIP deprecated' test.out

#- 408 AdminInviteUserV4
eval_tap 0 408 'AdminInviteUserV4 # SKIP deprecated' test.out

#- 409 AuthenticationWithPlatformLinkV4
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV4 \
    --extendExp  \
    --clientId 'AMOlEceG' \
    --linkingToken 'PXMDqfAi' \
    --password 'iMsIhZ9G' \
    --username 'fCd49SGI' \
    > test.out 2>&1
eval_tap $? 409 'AuthenticationWithPlatformLinkV4' test.out

#- 410 GenerateTokenByNewHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV4 \
    --additionalData 'XcESKyJn' \
    --extendExp  \
    --linkingToken '74RB24UW' \
    > test.out 2>&1
eval_tap $? 410 'GenerateTokenByNewHeadlessAccountV4' test.out

#- 411 Verify2faCodeV4
./ng net.accelbyte.sdk.cli.Main iam verify2faCodeV4 \
    --code 'i91e7jZS' \
    --factor 'ShNMo74J' \
    --mfaToken 'bjvKJohk' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 411 'Verify2faCodeV4' test.out

#- 412 PlatformTokenGrantV4
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV4 \
    --platformId 'TwYNk7yj' \
    --codeChallenge 'wqBNsHdC' \
    --codeChallengeMethod 'S256' \
    --additionalData 'V0IzB6QX' \
    --clientId 'cDTpCgeV' \
    --createHeadless  \
    --deviceId 'LGXpAnFS' \
    --macAddress 'JQlHbBCH' \
    --platformToken 'zhPKjIj8' \
    --serviceLabel '0.9227435228439163' \
    --skipSetCookie  \
    > test.out 2>&1
eval_tap $? 412 'PlatformTokenGrantV4' test.out

#- 413 SimultaneousLoginV4
./ng net.accelbyte.sdk.cli.Main iam simultaneousLoginV4 \
    --codeChallenge 'wDHgff96' \
    --codeChallengeMethod 'plain' \
    --simultaneousPlatform '3T8dQnUh' \
    --simultaneousTicket 'bGmGuwel' \
    --nativePlatform 'steam' \
    --nativePlatformTicket 'fkxLBVPt' \
    > test.out 2>&1
eval_tap $? 413 'SimultaneousLoginV4' test.out

#- 414 TokenGrantV4
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV4 \
    --codeChallenge 'acGQMYga' \
    --codeChallengeMethod 'plain' \
    --additionalData 'm9V8JpUM' \
    --clientId 'njjzHayw' \
    --clientSecret 'wAvacxYk' \
    --code 'zEBMnFk0' \
    --codeVerifier 'aqtkNH5r' \
    --extendNamespace 'uA6ivqHy' \
    --extendExp  \
    --loginQueueTicket 'fndYsGGU' \
    --password 'DjLUcxkd' \
    --redirectUri '0aRNuoPR' \
    --refreshToken 'ya5lYfRZ' \
    --scope 'mxacxKqV' \
    --username 'n8m1KTbK' \
    --grantType 'password' \
    > test.out 2>&1
eval_tap $? 414 'TokenGrantV4' test.out

#- 415 RequestTargetTokenResponseV4
./ng net.accelbyte.sdk.cli.Main iam requestTargetTokenResponseV4 \
    --additionalData '5VcPP96h' \
    --code 'rNYYfwOu' \
    > test.out 2>&1
eval_tap $? 415 'RequestTargetTokenResponseV4' test.out

#- 416 PublicListUserIDByPlatformUserIDsV4
./ng net.accelbyte.sdk.cli.Main iam publicListUserIDByPlatformUserIDsV4 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Rq6hWK3O' \
    --rawPUID  \
    --body '{"pidType": "F5gkRRYH", "platformUserIds": ["UIibP5h8", "FatzvDvI", "OXO1RyUj"]}' \
    > test.out 2>&1
eval_tap $? 416 'PublicListUserIDByPlatformUserIDsV4' test.out

#- 417 PublicGetUserByPlatformUserIDV4
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByPlatformUserIDV4 \
    --namespace "$AB_NAMESPACE" \
    --platformId '3aOz7ulj' \
    --platformUserId 'edExl643' \
    > test.out 2>&1
eval_tap $? 417 'PublicGetUserByPlatformUserIDV4' test.out

#- 418 PublicCreateTestUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateTestUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "8IjNwheb", "policyId": "JsXsB3dQ", "policyVersionId": "Ycj78Kqq"}, {"isAccepted": true, "localizedPolicyVersionId": "MDmbpo2K", "policyId": "DX4IQwT1", "policyVersionId": "foeBfulf"}, {"isAccepted": true, "localizedPolicyVersionId": "DGn6OWcY", "policyId": "ZsxewqeR", "policyVersionId": "xB118XSr"}], "authType": "EMAILPASSWD", "country": "Ou1v2N9G", "dateOfBirth": "97NKPGXh", "displayName": "EcEwdI4G", "emailAddress": "lAfkOeLb", "password": "olDKFl5U", "passwordMD5Sum": "3lKOZ50B", "uniqueDisplayName": "WOSKdctg", "username": "RXZ2yye4", "verified": true}' \
    > test.out 2>&1
eval_tap $? 418 'PublicCreateTestUserV4' test.out

#- 419 PublicCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "XPi1aDUy", "policyId": "c9JIrDUc", "policyVersionId": "PN4zOjx9"}, {"isAccepted": false, "localizedPolicyVersionId": "j5QkrIiF", "policyId": "GBR7f3oZ", "policyVersionId": "pVOoUWbS"}, {"isAccepted": false, "localizedPolicyVersionId": "L7RAyAD1", "policyId": "IM3xn8Rp", "policyVersionId": "UbqFVb8E"}], "authType": "EMAILPASSWD", "code": "oKXjQqaa", "country": "4dXAARKD", "dateOfBirth": "Xl3n3t5y", "displayName": "E4Udka8v", "emailAddress": "Ot1PSCuT", "password": "Cuhiq8OO", "passwordMD5Sum": "9kRpABrs", "reachMinimumAge": false, "uniqueDisplayName": "Xb5IYhma", "username": "uNcylFu8"}' \
    > test.out 2>&1
eval_tap $? 419 'PublicCreateUserV4' test.out

#- 420 CreateUserFromInvitationV4
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV4 \
    --invitationId 'X5PNpYip' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "fBKVkaQs", "policyId": "eeYF4QVD", "policyVersionId": "nUEJWqpN"}, {"isAccepted": true, "localizedPolicyVersionId": "z4WhUjcI", "policyId": "toF20SmV", "policyVersionId": "n4sG5BU9"}, {"isAccepted": false, "localizedPolicyVersionId": "DnYvQWZT", "policyId": "ywfswVBK", "policyVersionId": "PyU4WQ9l"}], "authType": "EMAILPASSWD", "code": "7VXMRluR", "country": "vZqWt79C", "dateOfBirth": "uLREMwCe", "displayName": "bihlhQdC", "emailAddress": "SzuAv2R4", "password": "3yNzcmxv", "passwordMD5Sum": "C2W9CJAv", "reachMinimumAge": false, "uniqueDisplayName": "v9aXARAP", "username": "I2QCRPDd"}' \
    > test.out 2>&1
eval_tap $? 420 'CreateUserFromInvitationV4' test.out

#- 421 PublicUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "Jq8FU6d9", "country": "0fd2MPOk", "dateOfBirth": "vLit22Yn", "displayName": "4xJxnkFI", "languageTag": "UPe6AuCr", "uniqueDisplayName": "SSegODLX", "userName": "242PhS3w"}' \
    > test.out 2>&1
eval_tap $? 421 'PublicUpdateUserV4' test.out

#- 422 PublicUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "VJ6amLz1", "emailAddress": "dcWJcsVJ"}' \
    > test.out 2>&1
eval_tap $? 422 'PublicUpdateUserEmailAddressV4' test.out

#- 423 PublicUpgradeHeadlessAccountWithVerificationCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountWithVerificationCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "ykesBidz", "country": "KTgX0JOk", "dateOfBirth": "kXimPYnD", "displayName": "KX5gOEdn", "emailAddress": "ssb2qSuW", "password": "RbMmgHWj", "reachMinimumAge": true, "uniqueDisplayName": "VfgiFMUT", "username": "t60MjHq2", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 423 'PublicUpgradeHeadlessAccountWithVerificationCodeV4' test.out

#- 424 PublicUpgradeHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"dateOfBirth": "giVBokh1", "displayName": "66GMAjUR", "emailAddress": "BHjh8Sgu", "password": "987G4d7H", "uniqueDisplayName": "UojPTOxB", "username": "S9pvcBJX"}' \
    > test.out 2>&1
eval_tap $? 424 'PublicUpgradeHeadlessAccountV4' test.out

#- 425 PublicDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"factor": "vvNFpUox", "mfaToken": "DXqbVmjX"}' \
    > test.out 2>&1
eval_tap $? 425 'PublicDisableMyAuthenticatorV4' test.out

#- 426 PublicEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'u5qTxsQi' \
    > test.out 2>&1
eval_tap $? 426 'PublicEnableMyAuthenticatorV4' test.out

#- 427 PublicGenerateMyAuthenticatorKeyV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateMyAuthenticatorKeyV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 427 'PublicGenerateMyAuthenticatorKeyV4' test.out

#- 428 PublicGetMyBackupCodesV4
eval_tap 0 428 'PublicGetMyBackupCodesV4 # SKIP deprecated' test.out

#- 429 PublicGenerateMyBackupCodesV4
eval_tap 0 429 'PublicGenerateMyBackupCodesV4 # SKIP deprecated' test.out

#- 430 PublicDisableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"factor": "opKFgtD1", "mfaToken": "2t0FWv8A"}' \
    > test.out 2>&1
eval_tap $? 430 'PublicDisableMyBackupCodesV4' test.out

#- 431 PublicDownloadMyBackupCodesV4
eval_tap 0 431 'PublicDownloadMyBackupCodesV4 # SKIP deprecated' test.out

#- 432 PublicEnableMyBackupCodesV4
eval_tap 0 432 'PublicEnableMyBackupCodesV4 # SKIP deprecated' test.out

#- 433 PublicGetBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGetBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --languageTag 'rPbCrDLz' \
    > test.out 2>&1
eval_tap $? 433 'PublicGetBackupCodesV4' test.out

#- 434 PublicGenerateBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --languageTag 'MVlz9UgL' \
    > test.out 2>&1
eval_tap $? 434 'PublicGenerateBackupCodesV4' test.out

#- 435 PublicEnableBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --languageTag 'hNRkW9TY' \
    > test.out 2>&1
eval_tap $? 435 'PublicEnableBackupCodesV4' test.out

#- 436 PublicChallengeMyMFAV4
./ng net.accelbyte.sdk.cli.Main iam publicChallengeMyMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'B5fdAOBS' \
    --factor '9yYPrzox' \
    > test.out 2>&1
eval_tap $? 436 'PublicChallengeMyMFAV4' test.out

#- 437 PublicRemoveTrustedDeviceV4
./ng net.accelbyte.sdk.cli.Main iam publicRemoveTrustedDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceToken 'g5pPUomK' \
    > test.out 2>&1
eval_tap $? 437 'PublicRemoveTrustedDeviceV4' test.out

#- 438 PublicSendMyMFAEmailCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicSendMyMFAEmailCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --action '70a4usuP' \
    --languageTag 'mD8csJia' \
    > test.out 2>&1
eval_tap $? 438 'PublicSendMyMFAEmailCodeV4' test.out

#- 439 PublicDisableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyEmailV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"factor": "qSPUWs34", "mfaToken": "OYXLZDhr"}' \
    > test.out 2>&1
eval_tap $? 439 'PublicDisableMyEmailV4' test.out

#- 440 PublicEnableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyEmailV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'Yb0n0IES' \
    > test.out 2>&1
eval_tap $? 440 'PublicEnableMyEmailV4' test.out

#- 441 PublicGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam publicGetMyEnabledFactorsV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 441 'PublicGetMyEnabledFactorsV4' test.out

#- 442 PublicMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam publicMakeFactorMyDefaultV4 \
    --namespace "$AB_NAMESPACE" \
    --factor 'rMcXHimb' \
    > test.out 2>&1
eval_tap $? 442 'PublicMakeFactorMyDefaultV4' test.out

#- 443 PublicGetMyOwnMFAStatusV4
./ng net.accelbyte.sdk.cli.Main iam publicGetMyOwnMFAStatusV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 443 'PublicGetMyOwnMFAStatusV4' test.out

#- 444 PublicGetMyMFAStatusV4
eval_tap 0 444 'PublicGetMyMFAStatusV4 # SKIP deprecated' test.out

#- 445 PublicGetUserPublicInfoByUserIdV4
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPublicInfoByUserIdV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'npPD2wJm' \
    > test.out 2>&1
eval_tap $? 445 'PublicGetUserPublicInfoByUserIdV4' test.out

#- 446 PublicInviteUserV4
./ng net.accelbyte.sdk.cli.Main iam publicInviteUserV4 \
    --body '{"additionalData": "FXMP8r5H", "emailAddress": "ttKyl3uf", "languageTag": "uscZu6hC", "namespace": "MYOYRVO6", "namespaceDisplayName": "TxMMNARg"}' \
    > test.out 2>&1
eval_tap $? 446 'PublicInviteUserV4' test.out

#- 447 PublicUpgradeHeadlessWithCodeV4Forward
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessWithCodeV4Forward \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "Z7uPk1PN", "policyId": "vfics9Aw", "policyVersionId": "MSPS7CHu"}, {"isAccepted": true, "localizedPolicyVersionId": "JgZ1nGgY", "policyId": "YDNkiu05", "policyVersionId": "1UvzOe4P"}, {"isAccepted": true, "localizedPolicyVersionId": "kReGASXX", "policyId": "K4wJwtDw", "policyVersionId": "NcLYkCIS"}], "code": "Tk1xwg3E", "country": "OPA8JfLb", "dateOfBirth": "0LRh6TAk", "displayName": "7SFoL6SU", "emailAddress": "YI47NfBQ", "password": "3VxOtvM3", "reachMinimumAge": false, "uniqueDisplayName": "yJ74Ru5J", "username": "nSwOrZTr", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 447 'PublicUpgradeHeadlessWithCodeV4Forward' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
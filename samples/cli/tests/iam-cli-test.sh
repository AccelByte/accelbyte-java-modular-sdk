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
    --body '{"modules": [{"docLink": "icKT1PhB", "groups": [{"group": "PXLCKlQg", "groupId": "BE7PetLt", "permissions": [{"allowedActions": [14, 49, 64], "resource": "UTGiPyzI"}, {"allowedActions": [66, 2, 31], "resource": "YNERC6pd"}, {"allowedActions": [33, 94, 15], "resource": "KozcYstC"}]}, {"group": "TSNkiOzx", "groupId": "7xUHhpiT", "permissions": [{"allowedActions": [40, 3, 64], "resource": "EaU8CRqI"}, {"allowedActions": [73, 10, 79], "resource": "eC6gUiQs"}, {"allowedActions": [45, 90, 99], "resource": "m9Ea2LZf"}]}, {"group": "cNBgXJ4q", "groupId": "ZOj6ZjgO", "permissions": [{"allowedActions": [97, 88, 0], "resource": "QPYFns1V"}, {"allowedActions": [71, 95, 34], "resource": "xFHJemQc"}, {"allowedActions": [99, 43, 13], "resource": "EViThOJ5"}]}], "module": "h9l99I7L", "moduleId": "i6s3ndE1"}, {"docLink": "RrmuOoJC", "groups": [{"group": "2jGD5wQN", "groupId": "Ulp7RTYE", "permissions": [{"allowedActions": [75, 65, 46], "resource": "Kngxm7OZ"}, {"allowedActions": [73, 94, 55], "resource": "SQrvDTLj"}, {"allowedActions": [26, 46, 11], "resource": "4DJAngab"}]}, {"group": "i5PDGynU", "groupId": "qXF006Nb", "permissions": [{"allowedActions": [60, 16, 19], "resource": "srvo1HNm"}, {"allowedActions": [59, 36, 49], "resource": "uEiKlQ0m"}, {"allowedActions": [41, 16, 77], "resource": "TtMm7Vsx"}]}, {"group": "vIlbaMQw", "groupId": "cSBmh26P", "permissions": [{"allowedActions": [83, 100, 51], "resource": "jOZCpfu5"}, {"allowedActions": [18, 87, 75], "resource": "kfuTC4U4"}, {"allowedActions": [23, 68, 96], "resource": "vogCGX0l"}]}], "module": "WIc3VDy1", "moduleId": "4yjj16Jd"}, {"docLink": "wrR6DQyk", "groups": [{"group": "LSe5wy5R", "groupId": "T3u8Mehx", "permissions": [{"allowedActions": [13, 52, 79], "resource": "70TXJdu7"}, {"allowedActions": [4, 56, 85], "resource": "62kcPjB2"}, {"allowedActions": [53, 69, 51], "resource": "wtWy2iSK"}]}, {"group": "Yg4vFbiR", "groupId": "xcwhvK9L", "permissions": [{"allowedActions": [44, 48, 100], "resource": "mb7maB39"}, {"allowedActions": [42, 43, 51], "resource": "zu2BJRPx"}, {"allowedActions": [39, 76, 94], "resource": "ym6yrr4m"}]}, {"group": "g3J11JT9", "groupId": "QnxpLyfb", "permissions": [{"allowedActions": [12, 100, 19], "resource": "InVTCboI"}, {"allowedActions": [36, 88, 95], "resource": "z6W1QD8Q"}, {"allowedActions": [18, 30, 1], "resource": "uXpriYqw"}]}], "module": "VoHZOXEi", "moduleId": "eFvVRMHF"}]}' \
    > test.out 2>&1
eval_tap $? 109 'AdminUpdateAvailablePermissionsByModule' test.out

#- 110 AdminDeleteConfigPermissionsByGroup
./ng net.accelbyte.sdk.cli.Main iam adminDeleteConfigPermissionsByGroup \
    --forceDelete  \
    --body '{"groupId": "2wNYkHIj", "moduleId": "HNIReHUK"}' \
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
    --body '[{"field": "lvrTbbBj", "validation": {"allowAllSpecialCharacters": true, "allowDigit": false, "allowLetter": true, "allowSpace": false, "allowUnicode": true, "avatarConfig": {"allowedPrefixes": ["ONOcDPPK", "oRyC3qE6", "KBVo7urF"], "preferRegex": true, "regex": "heRhTvDg"}, "blockedWord": ["IaU61ge3", "FH4dYCtf", "STtLpiTJ"], "description": [{"language": "xFZUNplq", "message": ["6u45kaFn", "j3XGQLEN", "Ji6bYOZy"]}, {"language": "Dx1zTJzK", "message": ["JzjwJluh", "rHvOPX0h", "Un68Bdd0"]}, {"language": "agcXUhGp", "message": ["a0NVvBTT", "M9iR15Yz", "ZhNRFdam"]}], "isCustomRegex": false, "letterCase": "D3OPtkFW", "maxLength": 54, "maxRepeatingAlphaNum": 92, "maxRepeatingSpecialCharacter": 93, "minCharType": 36, "minLength": 10, "profanityFilter": "q7oytoZD", "regex": "gEMAIXPB", "specialCharacterLocation": "VNlur9tI", "specialCharacters": ["xcZPnAvM", "0Zf1r2OR", "0eq3krQR"]}}, {"field": "0R4vDvoa", "validation": {"allowAllSpecialCharacters": true, "allowDigit": false, "allowLetter": false, "allowSpace": false, "allowUnicode": false, "avatarConfig": {"allowedPrefixes": ["Jw2CON00", "4DAQIT3Z", "xMP7o3TX"], "preferRegex": true, "regex": "u2VyjfUD"}, "blockedWord": ["OTBa8k1M", "mp8bvhnj", "z7HIPjAH"], "description": [{"language": "e61zDJLa", "message": ["Dyjx4oHU", "1zwjn9Mj", "DTiz0I0f"]}, {"language": "Mhrc2cuE", "message": ["1AmtdDBK", "OalRuo2Z", "ab5SFC1o"]}, {"language": "PXvD3oWY", "message": ["3krGVuDz", "fdW9na0Y", "xstiCPxP"]}], "isCustomRegex": true, "letterCase": "od1CRJ07", "maxLength": 45, "maxRepeatingAlphaNum": 74, "maxRepeatingSpecialCharacter": 31, "minCharType": 56, "minLength": 83, "profanityFilter": "KNEo9dvA", "regex": "9Et3nE6o", "specialCharacterLocation": "cXC5y3GF", "specialCharacters": ["aKy2SMYT", "eSNFVM6L", "cGXjSihL"]}}, {"field": "4B1gPjtB", "validation": {"allowAllSpecialCharacters": true, "allowDigit": false, "allowLetter": false, "allowSpace": true, "allowUnicode": false, "avatarConfig": {"allowedPrefixes": ["zQddQ7Ir", "ijmaNFG9", "z0KtFIVk"], "preferRegex": false, "regex": "F8Rb853l"}, "blockedWord": ["M8OltVis", "6TcNlwaf", "17Tf9ZCY"], "description": [{"language": "nSejfrAd", "message": ["5JHlPgTt", "B2nMIYOv", "L43z78EG"]}, {"language": "Ajd9bTqD", "message": ["qinMUQJU", "tNlpA1u9", "qYpBrqTG"]}, {"language": "3KSNqOxi", "message": ["HNRluKd3", "agT9WUiB", "bIjpUOG1"]}], "isCustomRegex": false, "letterCase": "ynn6pq2S", "maxLength": 58, "maxRepeatingAlphaNum": 20, "maxRepeatingSpecialCharacter": 65, "minCharType": 100, "minLength": 86, "profanityFilter": "dxQ5wQRJ", "regex": "LdMSIlw1", "specialCharacterLocation": "RTlkm9ew", "specialCharacters": ["rKr5tBxB", "7G3eVJyt", "oTAu561U"]}}]' \
    > test.out 2>&1
eval_tap $? 113 'AdminUpdateInputValidations' test.out

#- 114 AdminResetInputValidations
./ng net.accelbyte.sdk.cli.Main iam adminResetInputValidations \
    --field '0teroKBe' \
    > test.out 2>&1
eval_tap $? 114 'AdminResetInputValidations' test.out

#- 115 ListAdminsV3
./ng net.accelbyte.sdk.cli.Main iam listAdminsV3 \
    --namespace "$AB_NAMESPACE" \
    --after 't1Qx5vUn' \
    --before 'F97QW9Ir' \
    --endDate '2iAyy9ph' \
    --limit '40' \
    --query 'txygNR1z' \
    --roleId 'NK6Nt604' \
    --startDate '7on2Czix' \
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
    --body '{"ageRestriction": 8, "enable": false}' \
    > test.out 2>&1
eval_tap $? 117 'AdminUpdateAgeRestrictionConfigV3' test.out

#- 118 AdminGetListCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminGetListCountryAgeRestrictionV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 118 'AdminGetListCountryAgeRestrictionV3' test.out

#- 119 AdminUpdateCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateCountryAgeRestrictionV3 \
    --countryCode 'uEjz9aaf' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ageRestriction": 43}' \
    > test.out 2>&1
eval_tap $? 119 'AdminUpdateCountryAgeRestrictionV3' test.out

#- 120 AdminGetBannedUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType '75P9klv4' \
    --limit '26' \
    --offset '77' \
    > test.out 2>&1
eval_tap $? 120 'AdminGetBannedUsersV3' test.out

#- 121 AdminBanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"ban": "Y6CjRQYt", "comment": "gDZN0DWB", "endDate": "icKqoFUC", "reason": "yFBORC9q", "skipNotif": true, "userIds": ["cHYQiIRh", "IBGahz6O", "H5OFxADO"]}' \
    > test.out 2>&1
eval_tap $? 121 'AdminBanUserBulkV3' test.out

#- 122 AdminUnbanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminUnbanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"bans": [{"banId": "1nUIZPgO", "userId": "8GPiQmk8"}, {"banId": "BF5iqWLG", "userId": "i1yDlV4f"}, {"banId": "3VGFB0NJ", "userId": "XnDDjpwz"}]}' \
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
    --clientId 'EiumAtA7' \
    --clientName 'i8UcO7Jo' \
    --clientType 'E7UOdJFP' \
    --limit '51' \
    --offset '46' \
    --skipLoginQueue  \
    > test.out 2>&1
eval_tap $? 124 'AdminGetClientsByNamespaceV3' test.out

#- 125 AdminBulkUpdateClientsV3
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateClientsV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientIds": ["026nNJ1e", "vmpF7UeW", "HZqJqLp0"], "clientUpdateRequest": {"audiences": ["qUMHvTj4", "UYj4JqJ7", "Vg0JXCtO"], "baseUri": "pecbnaVZ", "clientName": "CWXX3DOy", "clientPermissions": [{"action": 94, "resource": "ygm4a5EN", "schedAction": 26, "schedCron": "M9P3BtiF", "schedRange": ["XS8dlihT", "4bEYwntT", "Jy03v6c4"]}, {"action": 54, "resource": "59iLQ0MZ", "schedAction": 76, "schedCron": "LTzUXUGo", "schedRange": ["hgMTybyf", "qwzowZkn", "GF2megu6"]}, {"action": 20, "resource": "jVdU5SY8", "schedAction": 60, "schedCron": "cs8DMhAw", "schedRange": ["HUmg6eIm", "5O1vtdZA", "jmB7JhBT"]}], "clientPlatform": "zqUQa15c", "deletable": false, "description": "8gFX1TKj", "modulePermissions": [{"moduleId": "4rTVpVRY", "selectedGroups": [{"groupId": "reMwlnMk", "selectedActions": [24, 70, 36]}, {"groupId": "SPth4Ghb", "selectedActions": [33, 64, 18]}, {"groupId": "0r8tevhS", "selectedActions": [10, 16, 12]}]}, {"moduleId": "2ioHFIDB", "selectedGroups": [{"groupId": "qrMgkfjC", "selectedActions": [71, 11, 14]}, {"groupId": "jU1OIqBr", "selectedActions": [56, 96, 10]}, {"groupId": "Uuw4meHn", "selectedActions": [43, 50, 32]}]}, {"moduleId": "ueGOmS2B", "selectedGroups": [{"groupId": "WPZbh4QM", "selectedActions": [33, 77, 79]}, {"groupId": "h0DeJFtD", "selectedActions": [13, 18, 91]}, {"groupId": "7w1Bmedp", "selectedActions": [24, 46, 25]}]}], "namespace": "CUXH95mp", "oauthAccessTokenExpiration": 79, "oauthAccessTokenExpirationTimeUnit": "zduws5OH", "oauthRefreshTokenExpiration": 81, "oauthRefreshTokenExpirationTimeUnit": "kdAFd85R", "redirectUri": "T2A1aWUx", "scopes": ["mBDmShAA", "q7gyNDBO", "xMuwvXyN"], "skipLoginQueue": true, "twoFactorEnabled": true}}' \
    > test.out 2>&1
eval_tap $? 125 'AdminBulkUpdateClientsV3' test.out

#- 126 AdminCreateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateClientV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["blI0qWQh", "VoqdHqDp", "ajGb3J4V"], "baseUri": "u3kssTub", "clientId": "e1MqtlRk", "clientName": "YWU2zHmx", "clientPermissions": [{"action": 66, "resource": "nDPTJBGX", "schedAction": 36, "schedCron": "J7iPKwG5", "schedRange": ["aD4xEIj4", "AJJUgbLX", "28Xx553k"]}, {"action": 43, "resource": "XmdH7ZqX", "schedAction": 45, "schedCron": "5FQagsPk", "schedRange": ["FURdI19d", "aXHOqBVN", "oB9JT8N6"]}, {"action": 54, "resource": "DHc5ZdDM", "schedAction": 59, "schedCron": "DT2wKWsV", "schedRange": ["PJ8QFyP9", "BzAVsAI0", "IoQ0zI29"]}], "clientPlatform": "EugFdGKu", "deletable": true, "description": "W7qzdDWJ", "modulePermissions": [{"moduleId": "PqXKxHSY", "selectedGroups": [{"groupId": "iOCfHwP2", "selectedActions": [42, 73, 91]}, {"groupId": "43Up8JzS", "selectedActions": [4, 9, 21]}, {"groupId": "AGLYlAFl", "selectedActions": [5, 47, 81]}]}, {"moduleId": "ReGr9JIR", "selectedGroups": [{"groupId": "J9H6hjy8", "selectedActions": [48, 38, 66]}, {"groupId": "eSBRWTAF", "selectedActions": [15, 23, 23]}, {"groupId": "X8sxi5Gj", "selectedActions": [12, 87, 77]}]}, {"moduleId": "h4AKRQAx", "selectedGroups": [{"groupId": "HuxBduiY", "selectedActions": [52, 27, 37]}, {"groupId": "3uizNxx1", "selectedActions": [33, 4, 50]}, {"groupId": "ZLPbcPzg", "selectedActions": [27, 42, 3]}]}], "namespace": "2H81gnkh", "oauthAccessTokenExpiration": 97, "oauthAccessTokenExpirationTimeUnit": "3XmsxGBq", "oauthClientType": "pmbyT7Jp", "oauthRefreshTokenExpiration": 21, "oauthRefreshTokenExpirationTimeUnit": "Mku0WtLv", "parentNamespace": "ImWXi1N6", "redirectUri": "GhgVIyNm", "scopes": ["3MEoJwHl", "4Zf6lgw3", "sGc6VHMY"], "secret": "7TcMbxmr", "skipLoginQueue": true, "twoFactorEnabled": true}' \
    > test.out 2>&1
eval_tap $? 126 'AdminCreateClientV3' test.out

#- 127 AdminGetClientsbyNamespacebyIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetClientsbyNamespacebyIDV3 \
    --clientId 'SR8Zoza9' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 127 'AdminGetClientsbyNamespacebyIDV3' test.out

#- 128 AdminDeleteClientV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientV3 \
    --clientId 'hXHluP3G' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 128 'AdminDeleteClientV3' test.out

#- 129 AdminUpdateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientV3 \
    --clientId 'yry8bWLD' \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["l9JSGG4d", "HsPAju1g", "xnxXvKHb"], "baseUri": "FdaksMCq", "clientName": "TA6h9Rwa", "clientPermissions": [{"action": 20, "resource": "8koJCLBa", "schedAction": 4, "schedCron": "u7YcDHaV", "schedRange": ["ayEVxFX6", "1CyJWRT6", "z9UF5h67"]}, {"action": 88, "resource": "ER9hTcMq", "schedAction": 13, "schedCron": "lgcYbT0Y", "schedRange": ["DHyZGbQc", "5NbmSonU", "hCtYNC7X"]}, {"action": 62, "resource": "cpe3QFug", "schedAction": 36, "schedCron": "oiJADTrC", "schedRange": ["i08PS1D3", "8Vqqse8p", "BjDwNvJj"]}], "clientPlatform": "p0bLlcbM", "deletable": true, "description": "39RcN6Vd", "modulePermissions": [{"moduleId": "QX6iCexV", "selectedGroups": [{"groupId": "1fzeAwJn", "selectedActions": [37, 75, 98]}, {"groupId": "oWErl0y0", "selectedActions": [63, 33, 52]}, {"groupId": "fBL3ujI6", "selectedActions": [78, 83, 96]}]}, {"moduleId": "4pwRNMGd", "selectedGroups": [{"groupId": "MFDBIRDd", "selectedActions": [46, 92, 34]}, {"groupId": "GRJg8F78", "selectedActions": [56, 81, 14]}, {"groupId": "yROx7jBH", "selectedActions": [87, 41, 17]}]}, {"moduleId": "jFlmqCKa", "selectedGroups": [{"groupId": "R7TgSuKK", "selectedActions": [10, 99, 35]}, {"groupId": "H1Cj2tLn", "selectedActions": [92, 33, 61]}, {"groupId": "LVzq89pQ", "selectedActions": [93, 89, 77]}]}], "namespace": "exiHXF3x", "oauthAccessTokenExpiration": 84, "oauthAccessTokenExpirationTimeUnit": "sLaj8uHH", "oauthRefreshTokenExpiration": 23, "oauthRefreshTokenExpirationTimeUnit": "J82cE0W4", "redirectUri": "8vTVMq72", "scopes": ["9BItmq0Z", "W191hz75", "aLo1XRJD"], "skipLoginQueue": false, "twoFactorEnabled": false}' \
    > test.out 2>&1
eval_tap $? 129 'AdminUpdateClientV3' test.out

#- 130 AdminUpdateClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientPermissionV3 \
    --clientId 'WMOiIIJX' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 36, "resource": "WPqdmwUr"}, {"action": 96, "resource": "ZHOoWj5N"}, {"action": 45, "resource": "jPGppfR2"}]}' \
    > test.out 2>&1
eval_tap $? 130 'AdminUpdateClientPermissionV3' test.out

#- 131 AdminAddClientPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddClientPermissionsV3 \
    --clientId 'qQUrTKX6' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 31, "resource": "9s6lsJVU"}, {"action": 39, "resource": "Hi30SDnp"}, {"action": 31, "resource": "XDt7mHDr"}]}' \
    > test.out 2>&1
eval_tap $? 131 'AdminAddClientPermissionsV3' test.out

#- 132 AdminDeleteClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientPermissionV3 \
    --action '87' \
    --clientId '46WtI77B' \
    --namespace "$AB_NAMESPACE" \
    --resource '5r9rUfQL' \
    > test.out 2>&1
eval_tap $? 132 'AdminDeleteClientPermissionV3' test.out

#- 133 AdminGetConfigValueV3
./ng net.accelbyte.sdk.cli.Main iam adminGetConfigValueV3 \
    --configKey 'CgLm0YsZ' \
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
    --body '{"blacklist": ["EdLflrZs", "D7ooazPe", "7hdEPbpo"]}' \
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
    --body '{"active": true, "roleIds": ["OG3bMw3z", "HwjHZAIt", "ja3g5bhs"]}' \
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
    --limit '78' \
    --offset '97' \
    > test.out 2>&1
eval_tap $? 141 'RetrieveAllSSOLoginPlatformCredentialV3' test.out

#- 142 RetrieveThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'IP3PlFzy' \
    > test.out 2>&1
eval_tap $? 142 'RetrieveThirdPartyLoginPlatformCredentialV3' test.out

#- 143 AddThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam addThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '0BVWmiWG' \
    --body '{"ACSURL": "tQfIyekF", "AWSCognitoRegion": "i7AZpaWc", "AWSCognitoUserPool": "evgJFvEB", "AllowedClients": ["FcXhLCxZ", "XSBfOUq4", "wh0khNPL"], "AppId": "4prNpbcI", "AuthorizationEndpoint": "5ZBFY2FD", "ClientId": "93yNHC9q", "EmptyStrFieldList": ["ap8XB2CW", "rsfqODzC", "j1Ug7c5K"], "EnableServerLicenseValidation": true, "Environment": "cPwjratU", "FederationMetadataURL": "qTObsOQB", "GenericOauthFlow": true, "IncludePUID": false, "IsActive": false, "Issuer": "b67YhZ2y", "JWKSEndpoint": "xDK2eODG", "KeyID": "BBsjnEY2", "LogoURL": "vfxyKjfA", "NetflixCertificates": {"encryptedPrivateKey": "8P9bPWij", "encryptedPrivateKeyName": "PEjXn1d1", "publicCertificate": "pVr3RnuF", "publicCertificateName": "SFskxuNM", "rootCertificate": "4tTr2dYt", "rootCertificateName": "GloTUelo"}, "OrganizationId": "NDSqW1wD", "PlatformName": "yjQJQIdH", "PrivateKey": "Myz2N903", "RedirectUri": "6UA5dIWk", "RegisteredDomains": [{"affectedClientIDs": ["1QMUhk2b", "ncy0abn8", "y7dxiKSo"], "domain": "2pJivMYP", "namespaces": ["Y5ZJ3Kp8", "G6xr6RyC", "sX6Nkylb"], "roleId": "KESNysNq", "ssoCfg": {"googleKey": {"n7twAcNQ": {}, "hmGNYBDV": {}, "EtI8oPjE": {}}, "groupConfigs": [{"assignNamespaces": ["9fLQCalx", "Lt5XpWiT", "034aiLzu"], "group": "NvY8X5iH", "roleId": "CPFF5kNt"}, {"assignNamespaces": ["CvziPEZi", "aGNOJpSO", "DYOps2Qj"], "group": "2E6Nxv8k", "roleId": "pSM0Pzwp"}, {"assignNamespaces": ["WvpThNNL", "PYa3SD60", "M0Fu8icl"], "group": "795dLNrB", "roleId": "FlAWPR3m"}]}}, {"affectedClientIDs": ["97ah4vH8", "gdZEs0al", "2wzL54IP"], "domain": "rtQ8xYF5", "namespaces": ["iSvo2G9c", "JSMlMDw7", "0dVEj562"], "roleId": "ft4yQq8y", "ssoCfg": {"googleKey": {"lGjixjS7": {}, "gmLSGyb7": {}, "f6i3luNu": {}}, "groupConfigs": [{"assignNamespaces": ["ABcj3Bqs", "yWEPbyad", "kqrE6IEV"], "group": "mDXigeDH", "roleId": "CwZsnXEh"}, {"assignNamespaces": ["bYMQEaBS", "YOs9rDVQ", "0c7PqBA1"], "group": "l0B2DGBe", "roleId": "wKJSu1SD"}, {"assignNamespaces": ["mbpUMhKj", "X5vpAASU", "zrFH7cpD"], "group": "BbzRRPSX", "roleId": "RhH37uIR"}]}}, {"affectedClientIDs": ["V5w3PBZ5", "giigq5q5", "5S2hkKFX"], "domain": "Ere6PNkZ", "namespaces": ["6kyxdfYe", "JZ22Y7oq", "xpT6kXax"], "roleId": "9HbGsX19", "ssoCfg": {"googleKey": {"bqo0tRFr": {}, "bE8BrY7M": {}, "Qg436ohh": {}}, "groupConfigs": [{"assignNamespaces": ["pUTnzzRm", "EfSeM8rd", "bJZWsJXW"], "group": "tQ3Tz819", "roleId": "bxWXMOkt"}, {"assignNamespaces": ["H5xJXZnZ", "qz7jUx4E", "iKwwnUe1"], "group": "Fr6UAvCv", "roleId": "OtuzMl8O"}, {"assignNamespaces": ["EXmlpaQR", "9nYfWyCi", "IwxMwCzr"], "group": "ZotCYwrP", "roleId": "WvgSXsCc"}]}}], "RelyingParty": "rRX6Pluo", "SandboxId": "AMsvmxKM", "Secret": "ZmBbuRo9", "TeamID": "ybA1W1ZK", "TokenAuthenticationType": "IwG780C6", "TokenClaimsMapping": {"UJNN8aod": "jfmufSFq", "mGsbKQqz": "OzaXZVeT", "IVF7UDQR": "IFJeHWTG"}, "TokenEndpoint": "TufSJKg4", "UserInfoEndpoint": "ki5U0f3a", "UserInfoHTTPMethod": "FMUCKeM4", "googleAdminConsoleKey": "fVWwpbMc", "scopes": ["j2VtGDPJ", "fao2nrYS", "QheKcWw3"]}' \
    > test.out 2>&1
eval_tap $? 143 'AddThirdPartyLoginPlatformCredentialV3' test.out

#- 144 DeleteThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'XplYik1K' \
    > test.out 2>&1
eval_tap $? 144 'DeleteThirdPartyLoginPlatformCredentialV3' test.out

#- 145 UpdateThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'CQ0lsxXQ' \
    --body '{"ACSURL": "iHVSnnX5", "AWSCognitoRegion": "espxmytD", "AWSCognitoUserPool": "pA3lldD4", "AllowedClients": ["Zkd9fcRs", "aXu5iO7o", "rWx9KHiC"], "AppId": "mbadI8uE", "AuthorizationEndpoint": "UcJYN9wU", "ClientId": "pMA1zDPF", "EmptyStrFieldList": ["KOwoabd3", "vIhv6UMn", "dXw9zaIE"], "EnableServerLicenseValidation": false, "Environment": "QpugqpzD", "FederationMetadataURL": "6PykNJyf", "GenericOauthFlow": false, "IncludePUID": false, "IsActive": false, "Issuer": "pOnDxhwC", "JWKSEndpoint": "ipHed1sJ", "KeyID": "Vt6XBY8C", "LogoURL": "RfMQTipS", "NetflixCertificates": {"encryptedPrivateKey": "JjngILqh", "encryptedPrivateKeyName": "nOdtavW0", "publicCertificate": "ylW9khVu", "publicCertificateName": "hKk7uKyd", "rootCertificate": "xcPJdaix", "rootCertificateName": "o0jdxjny"}, "OrganizationId": "nRbJexTO", "PlatformName": "oQ3mF3zc", "PrivateKey": "Qu0Xj9Lr", "RedirectUri": "BMeMXmob", "RegisteredDomains": [{"affectedClientIDs": ["KaIwGUjC", "c3qhsjP6", "fUrqrFKf"], "domain": "wl1AXnez", "namespaces": ["YhqjDtUK", "H55O0bNG", "RiOHyV7O"], "roleId": "A9rCaplH", "ssoCfg": {"googleKey": {"Td5o6eeb": {}, "wFod0zRn": {}, "Ri1iUMpl": {}}, "groupConfigs": [{"assignNamespaces": ["r67p8SFz", "WDugEKKy", "gQmxwtMO"], "group": "veW5Z6ez", "roleId": "HKqGpClq"}, {"assignNamespaces": ["B0Qg9zkx", "M5WlYaNV", "XONcu1SP"], "group": "hQBaudcs", "roleId": "n7JpiVSl"}, {"assignNamespaces": ["O3h4sSGQ", "4JlSv09q", "Pjl3Mq48"], "group": "ZgTBCoIv", "roleId": "71yss0A2"}]}}, {"affectedClientIDs": ["ScreziQk", "N0CvXHUe", "AAcfZdxU"], "domain": "r6HZmaLA", "namespaces": ["cl5tRlkn", "uhMi5amn", "aPNRh0Ct"], "roleId": "rkFTOczE", "ssoCfg": {"googleKey": {"gIZ17LL9": {}, "dKds1TA0": {}, "BjiXPvcC": {}}, "groupConfigs": [{"assignNamespaces": ["Xp0ILDYv", "CWbZIhiK", "ChPs4XZw"], "group": "cBVUVshU", "roleId": "1ryctQDF"}, {"assignNamespaces": ["8pWj1Pte", "7aw7cgtV", "YNE9xCs6"], "group": "D6vII4ra", "roleId": "HrNv0Sdc"}, {"assignNamespaces": ["BiNio5s4", "mEEYd9bN", "6zMdhleT"], "group": "U1FXWAtc", "roleId": "962MXi3r"}]}}, {"affectedClientIDs": ["FGgKR7Kd", "LqzOHWay", "kEI8nEju"], "domain": "EgGWl2Nb", "namespaces": ["tAVCEcqo", "m0vDSNjh", "qXKojhHJ"], "roleId": "TNyT9xJt", "ssoCfg": {"googleKey": {"G6aSPXFK": {}, "q6BBh91u": {}, "MxcIFCsz": {}}, "groupConfigs": [{"assignNamespaces": ["7KJ2dBKd", "s9QY1MaH", "vZJTRquD"], "group": "zxS2FvMx", "roleId": "jji9atVP"}, {"assignNamespaces": ["SRwtPEOQ", "RCNrQmwh", "8X62xYmE"], "group": "w05jdhri", "roleId": "FLMz7lKo"}, {"assignNamespaces": ["Z9bvVp2R", "3zaEyUa6", "xrBLqiYB"], "group": "V8vDLqx8", "roleId": "ce4vRR1Q"}]}}], "RelyingParty": "jUajcfBY", "SandboxId": "plfVGTbq", "Secret": "m7V1T3Mt", "TeamID": "IrNujy8F", "TokenAuthenticationType": "0u5ohtxw", "TokenClaimsMapping": {"pCboNYID": "0PxCunJc", "giiQb9ZJ": "n1HD8AX5", "Yrw5VXEf": "lgQTsfg4"}, "TokenEndpoint": "U2LJUbPf", "UserInfoEndpoint": "Qri6aVQV", "UserInfoHTTPMethod": "UDwUFZAj", "googleAdminConsoleKey": "hnFdm8hi", "scopes": ["FfGoyx2q", "xOmWEFHm", "ro9on04r"]}' \
    > test.out 2>&1
eval_tap $? 145 'UpdateThirdPartyLoginPlatformCredentialV3' test.out

#- 146 UpdateThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'IwH8oNIw' \
    --body '{"affectedClientIDs": ["GOhLoEV9", "yOk3z11z", "nrCOxM7g"], "assignedNamespaces": ["vsEML4b2", "XsBSOx41", "24xiCcVA"], "domain": "kyzNlu3z", "roleId": "3j9PdxbN", "ssoCfg": {"googleKey": {"sLWiby3m": {}, "VljoeWM2": {}, "Jl5X4fIL": {}}, "groupConfigs": [{"assignNamespaces": ["IoJgtRwZ", "XxJ3ikcU", "5VhkpXkC"], "group": "QJBad26o", "roleId": "rz1GfyAF"}, {"assignNamespaces": ["5Z3AsKdg", "1UZOhsnl", "MisuFKfa"], "group": "3yeOEAmj", "roleId": "Dc6B38JY"}, {"assignNamespaces": ["DVJhpJKe", "a94w05Qz", "EiTG6jkf"], "group": "0dUgIJZG", "roleId": "qtuAYLUp"}]}}' \
    > test.out 2>&1
eval_tap $? 146 'UpdateThirdPartyLoginPlatformDomainV3' test.out

#- 147 DeleteThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'DHdyP9CR' \
    --body '{"domain": "aZQmLhGI", "ssoGroups": ["an6Urf53", "MVvwfIBA", "k6hu2qCj"]}' \
    > test.out 2>&1
eval_tap $? 147 'DeleteThirdPartyLoginPlatformDomainV3' test.out

#- 148 PartialUpdateThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam partialUpdateThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'yzbyqG3M' \
    --body '{"affectedClientIDs": ["FdSsy9qr", "YM2QuBwZ", "sk3IUCkq"], "assignedNamespaces": ["ZK9oogn2", "poa1NV1w", "QKwC4vIo"], "domain": "rRaChKwI", "roleId": "yMguXpqP", "ssoCfg": {"googleKey": {"8WE4pxCO": {}, "FMuRdVqS": {}, "bzC4Ya0o": {}}, "groupConfigs": [{"assignNamespaces": ["oe7ArVHR", "Qed4e53l", "CtdX28Pm"], "group": "Zq7t5rNh", "roleId": "Djb6keC3"}, {"assignNamespaces": ["nMAnjrDs", "faCjANFf", "BSBmYcvM"], "group": "hXYsC503", "roleId": "gv9IR6PP"}, {"assignNamespaces": ["QbFNv6xj", "rP5OjyUj", "NCNKYfi9"], "group": "OnvPi74F", "roleId": "EVfFdnDI"}]}}' \
    > test.out 2>&1
eval_tap $? 148 'PartialUpdateThirdPartyLoginPlatformDomainV3' test.out

#- 149 RetrieveSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam retrieveSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'eS8vctIZ' \
    > test.out 2>&1
eval_tap $? 149 'RetrieveSSOLoginPlatformCredential' test.out

#- 150 AddSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam addSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'C8IqrPk9' \
    --body '{"acsUrl": "dtneObz5", "apiKey": "p4KqmpUm", "appId": "3XN8FC97", "federationMetadataUrl": "BJ3gyYYH", "isActive": true, "redirectUri": "uXjQt87e", "secret": "uqWWEKa4", "ssoUrl": "6ae2iRjp"}' \
    > test.out 2>&1
eval_tap $? 150 'AddSSOLoginPlatformCredential' test.out

#- 151 DeleteSSOLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteSSOLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'jeTMaECz' \
    > test.out 2>&1
eval_tap $? 151 'DeleteSSOLoginPlatformCredentialV3' test.out

#- 152 UpdateSSOPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam updateSSOPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'i8YdfIKO' \
    --body '{"acsUrl": "w8VaqK66", "apiKey": "3v69rOCC", "appId": "W44lRT7U", "federationMetadataUrl": "BHA5a2QB", "isActive": false, "redirectUri": "GXisXIwt", "secret": "kE2toTft", "ssoUrl": "8afBeiug"}' \
    > test.out 2>&1
eval_tap $? 152 'UpdateSSOPlatformCredential' test.out

#- 153 AdminListUserIDByPlatformUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByPlatformUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'lXtTncin' \
    --rawPID  \
    --rawPUID  \
    --body '{"platformUserIds": ["2X2JtFVy", "GGu8oTJT", "68tjcTGO"]}' \
    > test.out 2>&1
eval_tap $? 153 'AdminListUserIDByPlatformUserIDsV3' test.out

#- 154 AdminGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'mvMBuSv6' \
    --platformUserId 'nIFtVecG' \
    --pidType 'M2IywZDM' \
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
    --body '{"config": {"minimumAllowedInterval": 51}, "type": "qVb8Z56V"}' \
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
    --identity 'GAME_ADMIN' \
    --body '{"additions": [{"actions": [38, 19, 94], "resource": "tOiEqZVt"}, {"actions": [26, 37, 89], "resource": "wjVIfSoB"}, {"actions": [62, 18, 55], "resource": "htqkZxCU"}], "exclusions": [{"actions": [66, 77, 18], "resource": "tbPGyW5p"}, {"actions": [71, 19, 64], "resource": "c0Ew3lty"}, {"actions": [75, 87, 70], "resource": "O0YsPmVF"}], "overrides": [{"actions": [18, 18, 53], "resource": "dJKdPeyz"}, {"actions": [54, 23, 38], "resource": "uUahUr2D"}, {"actions": [6, 27, 27], "resource": "dcqjoktr"}], "replacements": [{"replacement": {"actions": [80, 23, 84], "resource": "eVnF5UOS"}, "target": "HtqXtqX5"}, {"replacement": {"actions": [93, 78, 53], "resource": "A7nH1lxU"}, "target": "lyBlAT4Y"}, {"replacement": {"actions": [45, 64, 46], "resource": "pH9GP6xc"}, "target": "kBAfdvFw"}]}' \
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
    --identity 'VIEW_ONLY' \
    --body '{"active": true}' \
    > test.out 2>&1
eval_tap $? 160 'AdminChangeRoleOverrideConfigStatusV3' test.out

#- 161 AdminGetRoleNamespacePermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleNamespacePermissionV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'jGFM5w41' \
    > test.out 2>&1
eval_tap $? 161 'AdminGetRoleNamespacePermissionV3' test.out

#- 162 GetAdminUsersByRoleIdV3
./ng net.accelbyte.sdk.cli.Main iam getAdminUsersByRoleIdV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'R86N4Edt' \
    --after '21' \
    --before '2' \
    --limit '32' \
    > test.out 2>&1
eval_tap $? 162 'GetAdminUsersByRoleIdV3' test.out

#- 163 AdminQueryTagV3
./ng net.accelbyte.sdk.cli.Main iam adminQueryTagV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '65' \
    --offset '16' \
    --tagName 'E3sTkJQC' \
    > test.out 2>&1
eval_tap $? 163 'AdminQueryTagV3' test.out

#- 164 AdminCreateTagV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateTagV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"tagName": "XLTMZyfw"}' \
    > test.out 2>&1
eval_tap $? 164 'AdminCreateTagV3' test.out

#- 165 AdminUpdateTagV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateTagV3 \
    --namespace "$AB_NAMESPACE" \
    --tagId 'IOFa9aaW' \
    --body '{"tagName": "RfOxA0fM"}' \
    > test.out 2>&1
eval_tap $? 165 'AdminUpdateTagV3' test.out

#- 166 AdminDeleteTagV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteTagV3 \
    --namespace "$AB_NAMESPACE" \
    --tagId 'stddj4hK' \
    > test.out 2>&1
eval_tap $? 166 'AdminDeleteTagV3' test.out

#- 167 AdminGetUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --emailAddress 'BD7Ydsxu' \
    > test.out 2>&1
eval_tap $? 167 'AdminGetUserByEmailAddressV3' test.out

#- 168 AdminBulkUpdateUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"updateRequest": {"skipLoginQueue": true}, "userIds": ["fSXXE456", "ASMHeHL9", "GoM07VSO"]}' \
    > test.out 2>&1
eval_tap $? 168 'AdminBulkUpdateUsersV3' test.out

#- 169 AdminGetBulkUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType '5KQXr8LF' \
    --body '{"bulkUserId": ["vWQnnNfg", "oUOS0MSt", "Vz0kOmdN"]}' \
    > test.out 2>&1
eval_tap $? 169 'AdminGetBulkUserBanV3' test.out

#- 170 AdminListUserIDByUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"findByPublisherNamespace": false, "userIds": ["q90Msuzt", "6vMb9YJE", "8mPQHZlA"]}' \
    > test.out 2>&1
eval_tap $? 170 'AdminListUserIDByUserIDsV3' test.out

#- 171 AdminBulkGetUsersPlatform
./ng net.accelbyte.sdk.cli.Main iam adminBulkGetUsersPlatform \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["jl5meulA", "FxEKNspu", "zyc0KNBU"]}' \
    > test.out 2>&1
eval_tap $? 171 'AdminBulkGetUsersPlatform' test.out

#- 172 AdminCursorGetUserV3
./ng net.accelbyte.sdk.cli.Main iam adminCursorGetUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"cursor": {"cursorTime": "A6VxlM0a", "userId": "sYSAEbHW"}, "fields": ["MDBBTDuf", "llTKUbzs", "7lHfFHoB"], "limit": 1}' \
    > test.out 2>&1
eval_tap $? 172 'AdminCursorGetUserV3' test.out

#- 173 AdminInviteUserV3
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddresses": ["dp95Jc5Z", "h035YS5f", "9mq9q9Fu"], "isAdmin": false, "languageTag": "GGaLaUJm", "namespace": "szf46HyP", "roles": ["9gSpRkoA", "dXQj5mxL", "9TZZFMLS"]}' \
    > test.out 2>&1
eval_tap $? 173 'AdminInviteUserV3' test.out

#- 174 AdminQueryThirdPlatformLinkHistoryV3
./ng net.accelbyte.sdk.cli.Main iam adminQueryThirdPlatformLinkHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '52' \
    --offset '31' \
    --platformUserId '4a8UWtSf' \
    --platformId 'h5rEiHf5' \
    > test.out 2>&1
eval_tap $? 174 'AdminQueryThirdPlatformLinkHistoryV3' test.out

#- 175 AdminListUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminListUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '37' \
    --offset '78' \
    > test.out 2>&1
eval_tap $? 175 'AdminListUsersV3' test.out

#- 176 AdminSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam adminSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'iZsaqZsA' \
    --endDate 'XX8URAcz' \
    --includeTotal  \
    --limit '80' \
    --offset '97' \
    --platformBy 'eQpp3Th5' \
    --platformId 'sLJdpa0O' \
    --query 'GRiPJn8a' \
    --roleIds 'tJSP8ell' \
    --selectedFields 'NlNPFiOL' \
    --skipLoginQueue  \
    --startDate 'y7A11Y8X' \
    --tagIds 'ht7BeIK8' \
    --testAccount  \
    > test.out 2>&1
eval_tap $? 176 'AdminSearchUserV3' test.out

#- 177 AdminGetBulkUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"listEmailAddressRequest": ["n1bAnxhY", "0cSi2O5V", "bpSakR5S"]}' \
    > test.out 2>&1
eval_tap $? 177 'AdminGetBulkUserByEmailAddressV3' test.out

#- 178 AdminGetUserByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '59kVu1rD' \
    > test.out 2>&1
eval_tap $? 178 'AdminGetUserByUserIdV3' test.out

#- 179 AdminUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'HtFQr6gU' \
    --body '{"avatarUrl": "JEVX6NQi", "country": "iP3JKaMQ", "dateOfBirth": "lDUH53AS", "displayName": "YqdCbviU", "languageTag": "eMcHYSfa", "skipLoginQueue": false, "tags": ["EJJI7GbD", "4EPBcigJ", "CLPn3JyM"], "uniqueDisplayName": "sTWw1s3z", "userName": "UiE3BqaA"}' \
    > test.out 2>&1
eval_tap $? 179 'AdminUpdateUserV3' test.out

#- 180 AdminGetUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'HvRWFPWc' \
    --activeOnly  \
    --after 'iQIFskAf' \
    --before 'afU1QnY4' \
    --limit '86' \
    > test.out 2>&1
eval_tap $? 180 'AdminGetUserBanV3' test.out

#- 181 AdminBanUserV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'DQ3HY5Oa' \
    --body '{"ban": "wjeHZ61C", "comment": "Sm99IFm8", "endDate": "9MGcimL7", "reason": "m6BGcINz", "skipNotif": false}' \
    > test.out 2>&1
eval_tap $? 181 'AdminBanUserV3' test.out

#- 182 AdminGetUserBanSummaryV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanSummaryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'T3NvCc6l' \
    > test.out 2>&1
eval_tap $? 182 'AdminGetUserBanSummaryV3' test.out

#- 183 AdminUpdateUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserBanV3 \
    --banId 'Znw3HvZa' \
    --namespace "$AB_NAMESPACE" \
    --userId 'vsW52qzp' \
    --body '{"enabled": true, "skipNotif": true}' \
    > test.out 2>&1
eval_tap $? 183 'AdminUpdateUserBanV3' test.out

#- 184 AdminSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'muAPpWhG' \
    --body '{"context": "GzUUVn6A", "emailAddress": "wSPlTYrv", "languageTag": "EDqM4ZOa", "upgradeToken": "M6XlLXmo"}' \
    > test.out 2>&1
eval_tap $? 184 'AdminSendVerificationCodeV3' test.out

#- 185 AdminVerifyAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'TQXwwx1F' \
    --body '{"Code": "Bx0F01mp", "ContactType": "A9Cx0sLG", "LanguageTag": "2Hb6wUEr", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 185 'AdminVerifyAccountV3' test.out

#- 186 GetUserVerificationCode
./ng net.accelbyte.sdk.cli.Main iam getUserVerificationCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'QUZpa6ol' \
    > test.out 2>&1
eval_tap $? 186 'GetUserVerificationCode' test.out

#- 187 AdminGetUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'X3JQs9Ai' \
    > test.out 2>&1
eval_tap $? 187 'AdminGetUserDeletionStatusV3' test.out

#- 188 AdminUpdateUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '6cNgt63T' \
    --body '{"deletionDate": 84, "enabled": true}' \
    > test.out 2>&1
eval_tap $? 188 'AdminUpdateUserDeletionStatusV3' test.out

#- 189 AdminListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'hwPgo7Ls' \
    > test.out 2>&1
eval_tap $? 189 'AdminListUserAllPlatformAccountsDistinctV3' test.out

#- 190 AdminUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '8SynIQcF' \
    --body '{"code": "6PawPqYB", "country": "XiSCk7MQ", "dateOfBirth": "1VwIk0Ky", "displayName": "TAsWGEQf", "emailAddress": "tVji3F4N", "password": "0TainB75", "uniqueDisplayName": "zKuu7S5V", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 190 'AdminUpgradeHeadlessAccountV3' test.out

#- 191 AdminDeleteUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'V9OLA16X' \
    > test.out 2>&1
eval_tap $? 191 'AdminDeleteUserInformationV3' test.out

#- 192 AdminGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'MRPJmYkF' \
    --after '0.2068313262617374' \
    --before '0.6625246615122019' \
    --limit '65' \
    > test.out 2>&1
eval_tap $? 192 'AdminGetUserLoginHistoriesV3' test.out

#- 193 AdminResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam adminResetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ELDwO97p' \
    --body '{"languageTag": "kjTdWg66", "mfaToken": "0tV1b2Ch", "newPassword": "k3V3q2Bw", "oldPassword": "7wnZcrgl"}' \
    > test.out 2>&1
eval_tap $? 193 'AdminResetPasswordV3' test.out

#- 194 AdminUpdateUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserPermissionV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '1o1thP6A' \
    --body '{"Permissions": [{"Action": 63, "Resource": "B3rp5dp8", "SchedAction": 42, "SchedCron": "IwxyCDbI", "SchedRange": ["HEeUxD71", "c5n1B0y5", "j46aVpGv"]}, {"Action": 54, "Resource": "FMZJjMPY", "SchedAction": 65, "SchedCron": "0GjosV8W", "SchedRange": ["mq58KdBV", "gpwLMoCD", "OiAkV8eh"]}, {"Action": 29, "Resource": "ptOHEy1b", "SchedAction": 72, "SchedCron": "UTga2Qcq", "SchedRange": ["19p9yTXC", "3SDZFikt", "rqcYhoBB"]}]}' \
    > test.out 2>&1
eval_tap $? 194 'AdminUpdateUserPermissionV3' test.out

#- 195 AdminAddUserPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserPermissionsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'FlmdWbOO' \
    --body '{"Permissions": [{"Action": 28, "Resource": "CTbCfIgr", "SchedAction": 56, "SchedCron": "bb2ccPwc", "SchedRange": ["PShNQTWw", "uQSES48L", "G28lydMa"]}, {"Action": 0, "Resource": "zKP3DK7V", "SchedAction": 59, "SchedCron": "IsCujxb1", "SchedRange": ["Xbx2ECoF", "zulwVTvB", "dJUKcNpj"]}, {"Action": 57, "Resource": "Le6cevAf", "SchedAction": 38, "SchedCron": "rwvxdUWg", "SchedRange": ["OHyKP9oe", "cT26LLeb", "a0xlalcq"]}]}' \
    > test.out 2>&1
eval_tap $? 195 'AdminAddUserPermissionsV3' test.out

#- 196 AdminDeleteUserPermissionBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Fn2FtrXI' \
    --body '[{"Action": 64, "Resource": "IG08w4vr"}, {"Action": 42, "Resource": "obz0ve6q"}, {"Action": 19, "Resource": "Cflro3NX"}]' \
    > test.out 2>&1
eval_tap $? 196 'AdminDeleteUserPermissionBulkV3' test.out

#- 197 AdminDeleteUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionV3 \
    --action '26' \
    --namespace "$AB_NAMESPACE" \
    --resource 'VLfcj8nb' \
    --userId 'wUoCXXx8' \
    > test.out 2>&1
eval_tap $? 197 'AdminDeleteUserPermissionV3' test.out

#- 198 AdminGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '5MdQyoE3' \
    --after '0Xm1kXMv' \
    --before 'IhyEzXom' \
    --limit '92' \
    --platformId 'PnSmZzH7' \
    --targetNamespace 'PVV1nOaG' \
    > test.out 2>&1
eval_tap $? 198 'AdminGetUserPlatformAccountsV3' test.out

#- 199 AdminListAllDistinctPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminListAllDistinctPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'KJmrHj9C' \
    --status '7rAReUKK' \
    > test.out 2>&1
eval_tap $? 199 'AdminListAllDistinctPlatformAccountsV3' test.out

#- 200 AdminGetListJusticePlatformAccounts
./ng net.accelbyte.sdk.cli.Main iam adminGetListJusticePlatformAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'q0ylVWjv' \
    > test.out 2>&1
eval_tap $? 200 'AdminGetListJusticePlatformAccounts' test.out

#- 201 AdminGetUserMapping
./ng net.accelbyte.sdk.cli.Main iam adminGetUserMapping \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'QI5OlD71' \
    --userId 'XSwgER3C' \
    --createIfNotFound  \
    > test.out 2>&1
eval_tap $? 201 'AdminGetUserMapping' test.out

#- 202 AdminCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam adminCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'uMfMLog3' \
    --userId '9OIdVouG' \
    > test.out 2>&1
eval_tap $? 202 'AdminCreateJusticeUser' test.out

#- 203 AdminLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'MEXhvZUv' \
    --skipConflict  \
    --body '{"platformId": "kC0dmRYt", "platformUserId": "fC7WU6bz"}' \
    > test.out 2>&1
eval_tap $? 203 'AdminLinkPlatformAccount' test.out

#- 204 AdminGetUserLinkHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLinkHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZBsKYAl9' \
    --platformId 'OOsXNg3R' \
    > test.out 2>&1
eval_tap $? 204 'AdminGetUserLinkHistoriesV3' test.out

#- 205 AdminPlatformUnlinkV3
eval_tap 0 205 'AdminPlatformUnlinkV3 # SKIP deprecated' test.out

#- 206 AdminPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'lAx2o798' \
    --userId 'dx1Od55I' \
    > test.out 2>&1
eval_tap $? 206 'AdminPlatformUnlinkAllV3' test.out

#- 207 AdminPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '6qPwYVJK' \
    --userId 'zhnMJxHV' \
    --ticket '8ishNUKO' \
    > test.out 2>&1
eval_tap $? 207 'AdminPlatformLinkV3' test.out

#- 208 AdminDeleteUserLinkingHistoryByPlatformIDV3
eval_tap 0 208 'AdminDeleteUserLinkingHistoryByPlatformIDV3 # SKIP deprecated' test.out

#- 209 AdminDeleteUserLinkingRestrictionByPlatformIDV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserLinkingRestrictionByPlatformIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'rdvO6Y1q' \
    --userId 'y3RDPDxT' \
    > test.out 2>&1
eval_tap $? 209 'AdminDeleteUserLinkingRestrictionByPlatformIDV3' test.out

#- 210 AdminGetThirdPartyPlatformTokenLinkStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetThirdPartyPlatformTokenLinkStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'TZJUOjus' \
    --userId 'm3ntJxgm' \
    --platformToken 'MrWyNglE' \
    > test.out 2>&1
eval_tap $? 210 'AdminGetThirdPartyPlatformTokenLinkStatusV3' test.out

#- 211 AdminGetUserSinglePlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminGetUserSinglePlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --platformId 'XDwb7KIC' \
    --userId '0dkAO0Z7' \
    --crossNamespace  \
    > test.out 2>&1
eval_tap $? 211 'AdminGetUserSinglePlatformAccount' test.out

#- 212 AdminDeleteUserRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRolesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'rjeKHq8R' \
    --body '["ApFh2qX7", "gFMYynSR", "sMFeG7Tw"]' \
    > test.out 2>&1
eval_tap $? 212 'AdminDeleteUserRolesV3' test.out

#- 213 AdminSaveUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminSaveUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'FH6XfdDx' \
    --body '[{"namespace": "raaT1BK3", "roleId": "EPu9bXtL"}, {"namespace": "0ePiwv4w", "roleId": "lYlCav3K"}, {"namespace": "l6KqjY1X", "roleId": "N9vU6NSO"}]' \
    > test.out 2>&1
eval_tap $? 213 'AdminSaveUserRoleV3' test.out

#- 214 AdminAddUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'HnDSWrLe' \
    --userId 'jvCfVfCq' \
    > test.out 2>&1
eval_tap $? 214 'AdminAddUserRoleV3' test.out

#- 215 AdminDeleteUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'o9ntdzNg' \
    --userId 'eck82iDp' \
    > test.out 2>&1
eval_tap $? 215 'AdminDeleteUserRoleV3' test.out

#- 216 AdminGetUserStateByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserStateByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ffLWIgVB' \
    > test.out 2>&1
eval_tap $? 216 'AdminGetUserStateByUserIdV3' test.out

#- 217 AdminUpdateUserStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ANZc5eGw' \
    --body '{"enabled": true, "reason": "JKX1SQsS"}' \
    > test.out 2>&1
eval_tap $? 217 'AdminUpdateUserStatusV3' test.out

#- 218 AdminTrustlyUpdateUserIdentity
./ng net.accelbyte.sdk.cli.Main iam adminTrustlyUpdateUserIdentity \
    --namespace "$AB_NAMESPACE" \
    --userId '7cw8n7bS' \
    --body '{"emailAddress": "MM6t7AHr", "password": "YUzrl4wc"}' \
    > test.out 2>&1
eval_tap $? 218 'AdminTrustlyUpdateUserIdentity' test.out

#- 219 AdminVerifyUserWithoutVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyUserWithoutVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '55CIGQq7' \
    > test.out 2>&1
eval_tap $? 219 'AdminVerifyUserWithoutVerificationCodeV3' test.out

#- 220 AdminUpdateClientSecretV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientSecretV3 \
    --clientId 'wPA5hF6W' \
    --namespace "$AB_NAMESPACE" \
    --body '{"newSecret": "iahkUr2H"}' \
    > test.out 2>&1
eval_tap $? 220 'AdminUpdateClientSecretV3' test.out

#- 221 AdminCheckThirdPartyLoginPlatformAvailabilityV3
./ng net.accelbyte.sdk.cli.Main iam adminCheckThirdPartyLoginPlatformAvailabilityV3 \
    --platformId '82h1vrY9' \
    > test.out 2>&1
eval_tap $? 221 'AdminCheckThirdPartyLoginPlatformAvailabilityV3' test.out

#- 222 AdminGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV3 \
    --after 'fp3F9F9l' \
    --before 'YZ2C1poU' \
    --isWildcard  \
    --limit '82' \
    > test.out 2>&1
eval_tap $? 222 'AdminGetRolesV3' test.out

#- 223 AdminCreateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV3 \
    --body '{"adminRole": true, "deletable": true, "isWildcard": true, "managers": [{"displayName": "LBNH2Zqf", "namespace": "deML5wqZ", "userId": "fvhnW08f"}, {"displayName": "ZfUNsyS2", "namespace": "UuYO4cPQ", "userId": "uZRDdApJ"}, {"displayName": "iG7G2V9s", "namespace": "lr6Jl8uo", "userId": "PxhL7PeM"}], "members": [{"displayName": "j2OaUXwS", "namespace": "9z1gQVWt", "userId": "scQFYPiy"}, {"displayName": "E8YawCgG", "namespace": "52udCJAt", "userId": "D7Sy7yhY"}, {"displayName": "Nwg1yP4z", "namespace": "N716usoS", "userId": "cpP5M3HF"}], "permissions": [{"action": 83, "resource": "Y5SPu3pH", "schedAction": 74, "schedCron": "fS1NUzKs", "schedRange": ["XXF5VFWk", "cTl7B1Fp", "birNYvsu"]}, {"action": 37, "resource": "grW6pGGT", "schedAction": 100, "schedCron": "r0M7taJk", "schedRange": ["pJ1CAtbP", "K1dXKRYp", "Q3tCrAJ5"]}, {"action": 67, "resource": "py3bPxkr", "schedAction": 85, "schedCron": "4oQ8JGXu", "schedRange": ["zitj2PgS", "oSHhbHYe", "Z66Uw2dO"]}], "roleName": "bVC9E2CX"}' \
    > test.out 2>&1
eval_tap $? 223 'AdminCreateRoleV3' test.out

#- 224 AdminGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV3 \
    --roleId 'XfLO7AI9' \
    > test.out 2>&1
eval_tap $? 224 'AdminGetRoleV3' test.out

#- 225 AdminDeleteRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV3 \
    --roleId 'fxU5ABc9' \
    > test.out 2>&1
eval_tap $? 225 'AdminDeleteRoleV3' test.out

#- 226 AdminUpdateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV3 \
    --roleId 'U7PVFhPW' \
    --body '{"deletable": false, "isWildcard": true, "roleName": "ef78blDF"}' \
    > test.out 2>&1
eval_tap $? 226 'AdminUpdateRoleV3' test.out

#- 227 AdminGetRoleAdminStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleAdminStatusV3 \
    --roleId '3tA0YzQm' \
    > test.out 2>&1
eval_tap $? 227 'AdminGetRoleAdminStatusV3' test.out

#- 228 AdminUpdateAdminRoleStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateAdminRoleStatusV3 \
    --roleId 'sj7hZHbN' \
    > test.out 2>&1
eval_tap $? 228 'AdminUpdateAdminRoleStatusV3' test.out

#- 229 AdminRemoveRoleAdminV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleAdminV3 \
    --roleId '4HmSuh8V' \
    > test.out 2>&1
eval_tap $? 229 'AdminRemoveRoleAdminV3' test.out

#- 230 AdminGetRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleManagersV3 \
    --roleId 'WwyzqGSa' \
    --after 'MnzowZ8O' \
    --before 'OX3kprLu' \
    --limit '63' \
    > test.out 2>&1
eval_tap $? 230 'AdminGetRoleManagersV3' test.out

#- 231 AdminAddRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleManagersV3 \
    --roleId 'B5YSEbl5' \
    --body '{"managers": [{"displayName": "ykmNBbBe", "namespace": "Df2PvzuT", "userId": "94ZBtTpz"}, {"displayName": "mQ26Et8S", "namespace": "f7QcdWTY", "userId": "sfTP2086"}, {"displayName": "q6kvSPGC", "namespace": "OYrTzDnX", "userId": "omhRJS3Y"}]}' \
    > test.out 2>&1
eval_tap $? 231 'AdminAddRoleManagersV3' test.out

#- 232 AdminRemoveRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleManagersV3 \
    --roleId '4pkeTN95' \
    --body '{"managers": [{"displayName": "QfyprLbS", "namespace": "NgnVSfWN", "userId": "bhY6wHic"}, {"displayName": "hVExiIgd", "namespace": "EIegOIbB", "userId": "xztiFazh"}, {"displayName": "oEKZqTuy", "namespace": "AxxesFEh", "userId": "OfHR26jT"}]}' \
    > test.out 2>&1
eval_tap $? 232 'AdminRemoveRoleManagersV3' test.out

#- 233 AdminGetRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleMembersV3 \
    --roleId 'nmG0wF1q' \
    --after 'shQrLLda' \
    --before 'yjcmZ71T' \
    --limit '19' \
    > test.out 2>&1
eval_tap $? 233 'AdminGetRoleMembersV3' test.out

#- 234 AdminAddRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleMembersV3 \
    --roleId 'Bm4Ie8WZ' \
    --body '{"members": [{"displayName": "KKPGIxw9", "namespace": "LrJoq09d", "userId": "mJldcL7L"}, {"displayName": "pangJM3w", "namespace": "hEYHSbe0", "userId": "YNxJpkZT"}, {"displayName": "xk0Ppd0j", "namespace": "uPYMBtI0", "userId": "n0scodjE"}]}' \
    > test.out 2>&1
eval_tap $? 234 'AdminAddRoleMembersV3' test.out

#- 235 AdminRemoveRoleMembersV3
eval_tap 0 235 'AdminRemoveRoleMembersV3 # SKIP deprecated' test.out

#- 236 AdminUpdateRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV3 \
    --roleId 'BQpS9AXd' \
    --body '{"permissions": [{"action": 84, "resource": "yvrBkL0B", "schedAction": 73, "schedCron": "UiXTStED", "schedRange": ["WIkAOuEy", "1ul91LyF", "k8os7VAH"]}, {"action": 35, "resource": "Bq1LeuHW", "schedAction": 13, "schedCron": "E6W2jLcZ", "schedRange": ["RgkuNZbi", "Ya93nYin", "ke3bXKOZ"]}, {"action": 61, "resource": "8RysNtaF", "schedAction": 60, "schedCron": "bpKG7kCj", "schedRange": ["fbb1ispG", "sA1QnFS7", "I1WfWQDb"]}]}' \
    > test.out 2>&1
eval_tap $? 236 'AdminUpdateRolePermissionsV3' test.out

#- 237 AdminAddRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV3 \
    --roleId 'TzHPFvi7' \
    --body '{"permissions": [{"action": 29, "resource": "OsFOZpy2", "schedAction": 66, "schedCron": "08ekfSHk", "schedRange": ["SkcTMPZG", "pC11yPoG", "r0rV5LSi"]}, {"action": 17, "resource": "ceBzOnbe", "schedAction": 64, "schedCron": "TteMQ5JG", "schedRange": ["PfAU8EiL", "VENierXe", "Z6vLOl5e"]}, {"action": 16, "resource": "8JymnMLU", "schedAction": 6, "schedCron": "L67rtSvw", "schedRange": ["RmdNqcAA", "FFvOJSdp", "n133Ei6S"]}]}' \
    > test.out 2>&1
eval_tap $? 237 'AdminAddRolePermissionsV3' test.out

#- 238 AdminDeleteRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV3 \
    --roleId '7keIGTqa' \
    --body '["hlo1qwVv", "TErBoLUZ", "hkc8Fa1B"]' \
    > test.out 2>&1
eval_tap $? 238 'AdminDeleteRolePermissionsV3' test.out

#- 239 AdminDeleteRolePermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionV3 \
    --action '88' \
    --resource 'FpbIsQes' \
    --roleId 'HJughQmV' \
    > test.out 2>&1
eval_tap $? 239 'AdminDeleteRolePermissionV3' test.out

#- 240 AdminGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam adminGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 240 'AdminGetMyUserV3' test.out

#- 241 UserAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam userAuthenticationV3 \
    --clientId 'hnZUvW6P' \
    --extendExp  \
    --redirectUri 'PmvNSTWa' \
    --password 'vQIG1nva' \
    --requestId '2ZZp7diI' \
    --userName 'u6zFxDNG' \
    > test.out 2>&1
eval_tap $? 241 'UserAuthenticationV3' test.out

#- 242 AuthenticationWithPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV3 \
    --extendExp  \
    --clientId '4IZ4xzSI' \
    --linkingToken 'm3BNjOmQ' \
    --password 'JoLNT2Ce' \
    --username 'elqaGT43' \
    > test.out 2>&1
eval_tap $? 242 'AuthenticationWithPlatformLinkV3' test.out

#- 243 AuthenticateAndLinkForwardV3
./ng net.accelbyte.sdk.cli.Main iam authenticateAndLinkForwardV3 \
    --extendExp  \
    --clientId 'Xr1EY1xx' \
    --linkingToken 'WfU8acV4' \
    --password '9sN5l5YY' \
    --username 'EGMznI12' \
    > test.out 2>&1
eval_tap $? 243 'AuthenticateAndLinkForwardV3' test.out

#- 244 PublicGetSystemConfigV3
./ng net.accelbyte.sdk.cli.Main iam publicGetSystemConfigV3 \
    > test.out 2>&1
eval_tap $? 244 'PublicGetSystemConfigV3' test.out

#- 245 GenerateTokenByNewHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV3 \
    --additionalData 'rHWNHVAv' \
    --extendExp  \
    --linkingToken 'umnuy3Df' \
    > test.out 2>&1
eval_tap $? 245 'GenerateTokenByNewHeadlessAccountV3' test.out

#- 246 RequestOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam requestOneTimeLinkingCodeV3 \
    --redirectUri '4AnQMz48' \
    --state '0fzQlZO1' \
    --platformId '4mUXLyul' \
    > test.out 2>&1
eval_tap $? 246 'RequestOneTimeLinkingCodeV3' test.out

#- 247 ValidateOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam validateOneTimeLinkingCodeV3 \
    --oneTimeLinkCode '18jhV9oS' \
    > test.out 2>&1
eval_tap $? 247 'ValidateOneTimeLinkingCodeV3' test.out

#- 248 RequestTokenByOneTimeLinkCodeResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTokenByOneTimeLinkCodeResponseV3 \
    --additionalData 'Vp0pQuV6' \
    --isTransient  \
    --clientId 'gbi8orT5' \
    --oneTimeLinkCode 'YZwiTBJK' \
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
    --codeChallenge 'nNPNLRhw' \
    --codeChallengeMethod 'plain' \
    --clientId 'lOcfXYbZ' \
    > test.out 2>&1
eval_tap $? 251 'RequestTokenExchangeCodeV3' test.out

#- 252 AdminRetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam adminRetrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'he4uQu1n' \
    --userId 'pLKEoCMn' \
    --platformUserId 'K8DHOnuK' \
    > test.out 2>&1
eval_tap $? 252 'AdminRetrieveUserThirdPartyPlatformTokenV3' test.out

#- 253 RevokeUserV3
./ng net.accelbyte.sdk.cli.Main iam revokeUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'KAii7YVM' \
    --includeGameNamespace  \
    > test.out 2>&1
eval_tap $? 253 'RevokeUserV3' test.out

#- 254 AuthorizeV3
./ng net.accelbyte.sdk.cli.Main iam authorizeV3 \
    --blockedPlatformId 'r7PAS01Q' \
    --codeChallenge 'M769t0DF' \
    --codeChallengeMethod 'S256' \
    --createHeadless  \
    --loginWebBased  \
    --nonce 'VAO8d5lf' \
    --oneTimeLinkCode 'Nyjz36hn' \
    --redirectUri 'kcnnFdJf' \
    --scope 'wzGIdjxQ' \
    --state 'lPf1Ut34' \
    --targetAuthPage 'DcTZ537s' \
    --useRedirectUriAsLoginUrlWhenLocked  \
    --clientId 'repnEVy2' \
    --responseType 'code' \
    > test.out 2>&1
eval_tap $? 254 'AuthorizeV3' test.out

#- 255 TokenIntrospectionV3
./ng net.accelbyte.sdk.cli.Main iam tokenIntrospectionV3 \
    --token 'rsURG4R0' \
    > test.out 2>&1
eval_tap $? 255 'TokenIntrospectionV3' test.out

#- 256 GetJWKSV3
./ng net.accelbyte.sdk.cli.Main iam getJWKSV3 \
    > test.out 2>&1
eval_tap $? 256 'GetJWKSV3' test.out

#- 257 SendMFAAuthenticationCode
./ng net.accelbyte.sdk.cli.Main iam sendMFAAuthenticationCode \
    --clientId 'e9Dvdt2D' \
    --factor 'zWbTS4Ys' \
    --mfaToken 'VHZBjHYy' \
    > test.out 2>&1
eval_tap $? 257 'SendMFAAuthenticationCode' test.out

#- 258 Change2faMethod
./ng net.accelbyte.sdk.cli.Main iam change2faMethod \
    --factor 'B2q7D1RH' \
    --mfaToken 'tRPsdvyu' \
    > test.out 2>&1
eval_tap $? 258 'Change2faMethod' test.out

#- 259 Verify2faCode
./ng net.accelbyte.sdk.cli.Main iam verify2faCode \
    --code 'BVwI2due' \
    --factor 'rCOHRXfv' \
    --mfaToken 'Qe9YCy5h' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 259 'Verify2faCode' test.out

#- 260 Verify2faCodeForward
./ng net.accelbyte.sdk.cli.Main iam verify2faCodeForward \
    --defaultFactor 'LawGft0K' \
    --factors '6KWL26ln' \
    --rememberDevice  \
    --clientId 'tPfLOvYi' \
    --code 'Tl5Wqt5R' \
    --factor 'T6nkkAQm' \
    --mfaToken 'nbPJfsYz' \
    > test.out 2>&1
eval_tap $? 260 'Verify2faCodeForward' test.out

#- 261 RetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam retrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'GkE66i4T' \
    --userId '9NvQCHPV' \
    > test.out 2>&1
eval_tap $? 261 'RetrieveUserThirdPartyPlatformTokenV3' test.out

#- 262 AuthCodeRequestV3
./ng net.accelbyte.sdk.cli.Main iam authCodeRequestV3 \
    --platformId 'rAV7pOkM' \
    --clientId 'RqpBzbOR' \
    --redirectUri '7vAIyaV6' \
    --requestId 'A3ljWIrn' \
    > test.out 2>&1
eval_tap $? 262 'AuthCodeRequestV3' test.out

#- 263 PlatformTokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV3 \
    --platformId '2dBBRsJ0' \
    --additionalData 'vKuzNUQU' \
    --clientId 'MDr8XpwR' \
    --createHeadless  \
    --deviceId '3iETAH2G' \
    --macAddress 'STPijSSM' \
    --platformToken 'C3MvL3Ty' \
    --serviceLabel '0.7837792375152256' \
    --skipSetCookie  \
    > test.out 2>&1
eval_tap $? 263 'PlatformTokenGrantV3' test.out

#- 264 GetRevocationListV3
./ng net.accelbyte.sdk.cli.Main iam getRevocationListV3 \
    > test.out 2>&1
eval_tap $? 264 'GetRevocationListV3' test.out

#- 265 TokenRevocationV3
./ng net.accelbyte.sdk.cli.Main iam tokenRevocationV3 \
    --token 'mN6OiGXl' \
    > test.out 2>&1
eval_tap $? 265 'TokenRevocationV3' test.out

#- 266 SimultaneousLoginV3
./ng net.accelbyte.sdk.cli.Main iam simultaneousLoginV3 \
    --simultaneousPlatform '9S8UXQ3g' \
    --simultaneousTicket '6Wz7tahD' \
    --nativePlatform 'steam' \
    --nativePlatformTicket 'E3WJJZLz' \
    > test.out 2>&1
eval_tap $? 266 'SimultaneousLoginV3' test.out

#- 267 TokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV3 \
    --additionalData 'TeV2pwVb' \
    --clientId 'PpFSktZC' \
    --clientSecret 'Gb4Obrfx' \
    --code '78OEw7me' \
    --codeVerifier 'k3aDjTok' \
    --extendNamespace 'wMOpVbeu' \
    --extendExp  \
    --password 'bDfj2YdB' \
    --redirectUri '3IkQ0O7y' \
    --refreshToken 'zz3XPekb' \
    --scope 'm6jb4Ovf' \
    --username 'otROiV8X' \
    --grantType 'urn:ietf:params:oauth:grant-type:extend_client_credentials' \
    > test.out 2>&1
eval_tap $? 267 'TokenGrantV3' test.out

#- 268 VerifyTokenV3
./ng net.accelbyte.sdk.cli.Main iam verifyTokenV3 \
    --token 'Lwxvwr0n' \
    > test.out 2>&1
eval_tap $? 268 'VerifyTokenV3' test.out

#- 269 PlatformAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticationV3 \
    --platformId 'ohh2B8SA' \
    --code 'ASjwwDF1' \
    --error '1quNawiU' \
    --openidAssocHandle 'Cpt69PU7' \
    --openidClaimedId 'BDyMhzMc' \
    --openidIdentity 'EGxyyZKN' \
    --openidMode 'nrkFNYlw' \
    --openidNs 'tw3x43CC' \
    --openidOpEndpoint 'JBwfXaQc' \
    --openidResponseNonce 'XcBlbnVI' \
    --openidReturnTo 'BqzsN8Po' \
    --openidSig '3Yacx6rP' \
    --openidSigned 'Fh02Sriv' \
    --state 'RNB2JYxh' \
    > test.out 2>&1
eval_tap $? 269 'PlatformAuthenticationV3' test.out

#- 270 PlatformTokenRefreshV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenRefreshV3 \
    --platformId 'uXiCfyQm' \
    --platformToken 'rIxDT0ql' \
    > test.out 2>&1
eval_tap $? 270 'PlatformTokenRefreshV3' test.out

#- 271 PublicGetInputValidations
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidations \
    --defaultOnEmpty  \
    --languageCode 'rm0nKJuT' \
    > test.out 2>&1
eval_tap $? 271 'PublicGetInputValidations' test.out

#- 272 PublicGetInputValidationByField
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidationByField \
    --field 'kZtgBnxz' \
    > test.out 2>&1
eval_tap $? 272 'PublicGetInputValidationByField' test.out

#- 273 PublicGetCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam publicGetCountryAgeRestrictionV3 \
    --countryCode 'tgRKcLfa' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 273 'PublicGetCountryAgeRestrictionV3' test.out

#- 274 PublicGetConfigValueV3
./ng net.accelbyte.sdk.cli.Main iam publicGetConfigValueV3 \
    --configKey 'i2RPjtDq' \
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
    --clientId 'qOOQPgRK' \
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
    --requestId 'aDFXCLGt' \
    > test.out 2>&1
eval_tap $? 281 'PublicGetAsyncStatus' test.out

#- 282 PublicSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam publicSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by '3Td1QPUR' \
    --limit '63' \
    --offset '0' \
    --platformBy 'GJKIrbsF' \
    --platformId 'VVAQS0tF' \
    --query 'Whx8qzm5' \
    > test.out 2>&1
eval_tap $? 282 'PublicSearchUserV3' test.out

#- 283 PublicCreateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "mXMua0qd", "acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "8IOrubAq", "policyId": "GAMpiP67", "policyVersionId": "phq5jYoK"}, {"isAccepted": false, "localizedPolicyVersionId": "BAUCZr2N", "policyId": "WvVVnwFL", "policyVersionId": "603G7Mr1"}, {"isAccepted": false, "localizedPolicyVersionId": "Evw1Xukl", "policyId": "ABSsv06o", "policyVersionId": "zY0uZjQN"}], "authType": "KCRuhHzp", "code": "0WMPms7W", "country": "BYIFltyt", "dateOfBirth": "Jfcz3nAW", "displayName": "JenJO0pr", "emailAddress": "flTzDDW2", "password": "OcnJvwtH", "reachMinimumAge": true, "uniqueDisplayName": "bJwCmWYj"}' \
    > test.out 2>&1
eval_tap $? 283 'PublicCreateUserV3' test.out

#- 284 CheckUserAvailability
./ng net.accelbyte.sdk.cli.Main iam checkUserAvailability \
    --namespace "$AB_NAMESPACE" \
    --field 't4HaHW1l' \
    --query 'Qxz9fG2J' \
    > test.out 2>&1
eval_tap $? 284 'CheckUserAvailability' test.out

#- 285 PublicBulkGetUsers
eval_tap 0 285 'PublicBulkGetUsers # SKIP deprecated' test.out

#- 286 PublicSendRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicSendRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "Nywx5uXM", "languageTag": "tmJEpxQF"}' \
    > test.out 2>&1
eval_tap $? 286 'PublicSendRegistrationCode' test.out

#- 287 PublicVerifyRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicVerifyRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "pglGUNQn", "emailAddress": "DgSn7r4G"}' \
    > test.out 2>&1
eval_tap $? 287 'PublicVerifyRegistrationCode' test.out

#- 288 PublicForgotPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicForgotPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "qFGwU6QM", "languageTag": "JkUROCxz"}' \
    > test.out 2>&1
eval_tap $? 288 'PublicForgotPasswordV3' test.out

#- 289 PublicValidateUserInput
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserInput \
    --namespace "$AB_NAMESPACE" \
    --body '{"displayName": "2IdQZu1g", "password": "p9op9j28", "uniqueDisplayName": "ZbeN1GcF", "username": "tzl7RAc6"}' \
    > test.out 2>&1
eval_tap $? 289 'PublicValidateUserInput' test.out

#- 290 GetAdminInvitationV3
./ng net.accelbyte.sdk.cli.Main iam getAdminInvitationV3 \
    --invitationId '8AGn9g9O' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 290 'GetAdminInvitationV3' test.out

#- 291 CreateUserFromInvitationV3
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV3 \
    --invitationId 'nYVO1YRd' \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "ColQYSd7", "acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "4AuV8qds", "policyId": "4rt2P5GK", "policyVersionId": "DaX1psvE"}, {"isAccepted": false, "localizedPolicyVersionId": "hO6IfdTA", "policyId": "OCFET4Jt", "policyVersionId": "UUGoPQnZ"}, {"isAccepted": true, "localizedPolicyVersionId": "Ju1bYP8G", "policyId": "Sd9JyoSH", "policyVersionId": "C2AHUtQx"}], "authType": "A2HqGop1", "code": "9xHqQG4E", "country": "84SyvQr4", "dateOfBirth": "okqOjl1I", "displayName": "wWHFSNLF", "emailAddress": "7bd8Snwl", "password": "HOI12C6o", "reachMinimumAge": true, "uniqueDisplayName": "nPQOIzxb"}' \
    > test.out 2>&1
eval_tap $? 291 'CreateUserFromInvitationV3' test.out

#- 292 UpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam updateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "Wispjg6Y", "country": "sZiKiQaU", "dateOfBirth": "AZXWHaXM", "displayName": "JfAOZCgt", "languageTag": "kbAMkWQo", "uniqueDisplayName": "EC5eMjoI", "userName": "9M5Ju7Fu"}' \
    > test.out 2>&1
eval_tap $? 292 'UpdateUserV3' test.out

#- 293 PublicPartialUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicPartialUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "vle3JdC1", "country": "DVYPpJ2o", "dateOfBirth": "DtGjpaL8", "displayName": "3cO1JoZ4", "languageTag": "GoheQEl7", "uniqueDisplayName": "5xEZW2FR", "userName": "IrQacT4X"}' \
    > test.out 2>&1
eval_tap $? 293 'PublicPartialUpdateUserV3' test.out

#- 294 PublicSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"context": "ZQ30yWev", "emailAddress": "V883xj8O", "languageTag": "ClWyiw0E", "upgradeToken": "0fncT5Od"}' \
    > test.out 2>&1
eval_tap $? 294 'PublicSendVerificationCodeV3' test.out

#- 295 PublicUserVerificationV3
./ng net.accelbyte.sdk.cli.Main iam publicUserVerificationV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "Dk2c13dL", "contactType": "NJtQvgue", "languageTag": "0NuTYn1K", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 295 'PublicUserVerificationV3' test.out

#- 296 PublicUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "dncoUmP8", "country": "ThkDL7cn", "dateOfBirth": "wmu2qh4l", "displayName": "xuY7Ar1E", "emailAddress": "7pgNtJd6", "password": "YrydbnoR", "uniqueDisplayName": "Ng3yk2N6", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 296 'PublicUpgradeHeadlessAccountV3' test.out

#- 297 PublicVerifyHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --needVerificationCode  \
    --body '{"emailAddress": "yHLR2Jb5", "password": "KbJw5Ryf"}' \
    > test.out 2>&1
eval_tap $? 297 'PublicVerifyHeadlessAccountV3' test.out

#- 298 PublicUpdatePasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicUpdatePasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"languageTag": "5t0YYrdu", "mfaToken": "qB5zD9HL", "newPassword": "yYvGKDHS", "oldPassword": "NGFPrKRf"}' \
    > test.out 2>&1
eval_tap $? 298 'PublicUpdatePasswordV3' test.out

#- 299 PublicCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam publicCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'aw2Dobr1' \
    > test.out 2>&1
eval_tap $? 299 'PublicCreateJusticeUser' test.out

#- 300 PublicPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'KV1X8Ckq' \
    --redirectUri 'NBxvSBRC' \
    --ticket 'LF6EkIDn' \
    > test.out 2>&1
eval_tap $? 300 'PublicPlatformLinkV3' test.out

#- 301 PublicPlatformUnlinkV3
eval_tap 0 301 'PublicPlatformUnlinkV3 # SKIP deprecated' test.out

#- 302 PublicPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'MAfo1vOo' \
    > test.out 2>&1
eval_tap $? 302 'PublicPlatformUnlinkAllV3' test.out

#- 303 PublicForcePlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicForcePlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'bwdSLPVO' \
    --ticket 'Nvwt3YL6' \
    > test.out 2>&1
eval_tap $? 303 'PublicForcePlatformLinkV3' test.out

#- 304 PublicWebLinkPlatform
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatform \
    --namespace "$AB_NAMESPACE" \
    --platformId 'a8q9z86y' \
    --clientId 'F63w9srk' \
    --redirectUri 'PN3VxS1V' \
    > test.out 2>&1
eval_tap $? 304 'PublicWebLinkPlatform' test.out

#- 305 PublicWebLinkPlatformEstablish
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatformEstablish \
    --namespace "$AB_NAMESPACE" \
    --platformId 'znVenng8' \
    --code '5DCT7Ydb' \
    --state '1JIlLfk1' \
    > test.out 2>&1
eval_tap $? 305 'PublicWebLinkPlatformEstablish' test.out

#- 306 PublicProcessWebLinkPlatformV3
./ng net.accelbyte.sdk.cli.Main iam publicProcessWebLinkPlatformV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'JjvGlZxB' \
    --code 'VvovHSy0' \
    --state 'GDNsmNR0' \
    > test.out 2>&1
eval_tap $? 306 'PublicProcessWebLinkPlatformV3' test.out

#- 307 PublicGetUsersPlatformInfosV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUsersPlatformInfosV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"platformId": "l6w2ZMHN", "userIds": ["zxc0ptco", "GeA9l5he", "ThqIyUuw"]}' \
    > test.out 2>&1
eval_tap $? 307 'PublicGetUsersPlatformInfosV3' test.out

#- 308 ResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam resetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientId": "V0HoQGXL", "code": "yvtVkBWA", "emailAddress": "nnvDbu4j", "languageTag": "RSciFjij", "newPassword": "NdCjxmAa"}' \
    > test.out 2>&1
eval_tap $? 308 'ResetPasswordV3' test.out

#- 309 PublicGetUserByUserIdV3
eval_tap 0 309 'PublicGetUserByUserIdV3 # SKIP deprecated' test.out

#- 310 PublicGetUserBanHistoryV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserBanHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'xEGBlxf2' \
    --activeOnly  \
    --after 'vTDkMUOJ' \
    --before 'ZRIMaj2Y' \
    --limit '10' \
    > test.out 2>&1
eval_tap $? 310 'PublicGetUserBanHistoryV3' test.out

#- 311 PublicListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'RuIeUF40' \
    > test.out 2>&1
eval_tap $? 311 'PublicListUserAllPlatformAccountsDistinctV3' test.out

#- 312 PublicGetUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '1ZIJcUoT' \
    > test.out 2>&1
eval_tap $? 312 'PublicGetUserInformationV3' test.out

#- 313 PublicGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'gv8doQJI' \
    --after '0.6854805074025516' \
    --before '0.6663383918046472' \
    --limit '23' \
    > test.out 2>&1
eval_tap $? 313 'PublicGetUserLoginHistoriesV3' test.out

#- 314 PublicGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'kCO3zBOV' \
    --after 'KV1liYuo' \
    --before 'jXTuC4zB' \
    --limit '28' \
    --platformId 'StJeLP6D' \
    > test.out 2>&1
eval_tap $? 314 'PublicGetUserPlatformAccountsV3' test.out

#- 315 PublicListJusticePlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicListJusticePlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'gohRwVfY' \
    > test.out 2>&1
eval_tap $? 315 'PublicListJusticePlatformAccountsV3' test.out

#- 316 PublicLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam publicLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'LCQIQMXa' \
    --body '{"platformId": "LNx4jhCA", "platformUserId": "DnX08iPq"}' \
    > test.out 2>&1
eval_tap $? 316 'PublicLinkPlatformAccount' test.out

#- 317 PublicForceLinkPlatformWithProgression
./ng net.accelbyte.sdk.cli.Main iam publicForceLinkPlatformWithProgression \
    --namespace "$AB_NAMESPACE" \
    --userId 'BSzYJlmV' \
    --body '{"chosenNamespaces": ["EJGoEi1j", "3vstBuoe", "tYuz8kP8"], "requestId": "Z8Zc5Bt1"}' \
    > test.out 2>&1
eval_tap $? 317 'PublicForceLinkPlatformWithProgression' test.out

#- 318 PublicGetPublisherUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetPublisherUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '9SS2aJ2c' \
    > test.out 2>&1
eval_tap $? 318 'PublicGetPublisherUserV3' test.out

#- 319 PublicValidateUserByUserIDAndPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserByUserIDAndPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'UlDodqj8' \
    --password 'Sve25xgb' \
    > test.out 2>&1
eval_tap $? 319 'PublicValidateUserByUserIDAndPasswordV3' test.out

#- 320 PublicGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRolesV3 \
    --after 'm1zu8dLQ' \
    --before 'vuQGBWz5' \
    --isWildcard  \
    --limit '82' \
    > test.out 2>&1
eval_tap $? 320 'PublicGetRolesV3' test.out

#- 321 PublicGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRoleV3 \
    --roleId 'ozWYbA0q' \
    > test.out 2>&1
eval_tap $? 321 'PublicGetRoleV3' test.out

#- 322 PublicForgotPasswordWithoutNamespaceV3
./ng net.accelbyte.sdk.cli.Main iam publicForgotPasswordWithoutNamespaceV3 \
    --body '{"clientId": "RaP9EPFm", "emailAddress": "Ot0bDd1a", "languageTag": "cxdVU0uy"}' \
    > test.out 2>&1
eval_tap $? 322 'PublicForgotPasswordWithoutNamespaceV3' test.out

#- 323 PublicGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyUserV3 \
    --includeAllPlatforms  \
    > test.out 2>&1
eval_tap $? 323 'PublicGetMyUserV3' test.out

#- 324 PublicSendCodeForwardV3
./ng net.accelbyte.sdk.cli.Main iam publicSendCodeForwardV3 \
    --body '{"context": "qYcPeSyN", "emailAddress": "RpyNbvmW", "languageTag": "F6ehI1MJ", "upgradeToken": "66bic59M"}' \
    > test.out 2>&1
eval_tap $? 324 'PublicSendCodeForwardV3' test.out

#- 325 PublicGetLinkHeadlessAccountToMyAccountConflictV3
./ng net.accelbyte.sdk.cli.Main iam publicGetLinkHeadlessAccountToMyAccountConflictV3 \
    --oneTimeLinkCode 'pUuqQYrY' \
    > test.out 2>&1
eval_tap $? 325 'PublicGetLinkHeadlessAccountToMyAccountConflictV3' test.out

#- 326 LinkHeadlessAccountToMyAccountV3
./ng net.accelbyte.sdk.cli.Main iam linkHeadlessAccountToMyAccountV3 \
    --body '{"chosenNamespaces": ["StNmnuID", "nessDRos", "sZuAWJAL"], "oneTimeLinkCode": "q3GiEFyG"}' \
    > test.out 2>&1
eval_tap $? 326 'LinkHeadlessAccountToMyAccountV3' test.out

#- 327 PublicGetMyRedirectionAfterLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyRedirectionAfterLinkV3 \
    --oneTimeLinkCode 'QRNmT27b' \
    > test.out 2>&1
eval_tap $? 327 'PublicGetMyRedirectionAfterLinkV3' test.out

#- 328 PublicGetMyProfileAllowUpdateStatusV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyProfileAllowUpdateStatusV3 \
    > test.out 2>&1
eval_tap $? 328 'PublicGetMyProfileAllowUpdateStatusV3' test.out

#- 329 PublicSendVerificationLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationLinkV3 \
    --body '{"languageTag": "epCEzQB3"}' \
    > test.out 2>&1
eval_tap $? 329 'PublicSendVerificationLinkV3' test.out

#- 330 PublicGetOpenidUserInfoV3
./ng net.accelbyte.sdk.cli.Main iam publicGetOpenidUserInfoV3 \
    > test.out 2>&1
eval_tap $? 330 'PublicGetOpenidUserInfoV3' test.out

#- 331 PublicVerifyUserByLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyUserByLinkV3 \
    --code 'p4hO3nFI' \
    > test.out 2>&1
eval_tap $? 331 'PublicVerifyUserByLinkV3' test.out

#- 332 PlatformAuthenticateSAMLV3Handler
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticateSAMLV3Handler \
    --platformId 'fNYKPLYK' \
    --code '3eRkbMsW' \
    --error 'fA69Obli' \
    --state 'qpVo7dQ9' \
    > test.out 2>&1
eval_tap $? 332 'PlatformAuthenticateSAMLV3Handler' test.out

#- 333 LoginSSOClient
./ng net.accelbyte.sdk.cli.Main iam loginSSOClient \
    --platformId 'n0BRU8Gk' \
    --payload 'ejBlTV3z' \
    > test.out 2>&1
eval_tap $? 333 'LoginSSOClient' test.out

#- 334 LogoutSSOClient
./ng net.accelbyte.sdk.cli.Main iam logoutSSOClient \
    --platformId 'QwxcTCyE' \
    > test.out 2>&1
eval_tap $? 334 'LogoutSSOClient' test.out

#- 335 RequestTargetTokenResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTargetTokenResponseV3 \
    --additionalData '8lEKdfxa' \
    --code 'pAtsClJJ' \
    > test.out 2>&1
eval_tap $? 335 'RequestTargetTokenResponseV3' test.out

#- 336 UpgradeAndAuthenticateForwardV3
./ng net.accelbyte.sdk.cli.Main iam upgradeAndAuthenticateForwardV3 \
    --clientId 'hu1bp4Cc' \
    --upgradeSuccessToken 't2NWAFmj' \
    > test.out 2>&1
eval_tap $? 336 'UpgradeAndAuthenticateForwardV3' test.out

#- 337 AdminListInvitationHistoriesV4
./ng net.accelbyte.sdk.cli.Main iam adminListInvitationHistoriesV4 \
    --limit '14' \
    --namespace "$AB_NAMESPACE" \
    --offset '78' \
    > test.out 2>&1
eval_tap $? 337 'AdminListInvitationHistoriesV4' test.out

#- 338 AdminGetDevicesByUserV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDevicesByUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'uPB87XWh' \
    > test.out 2>&1
eval_tap $? 338 'AdminGetDevicesByUserV4' test.out

#- 339 AdminGetBannedDevicesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedDevicesV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceType 'r00kotMi' \
    --endDate 'TwpKe3K1' \
    --limit '47' \
    --offset '13' \
    --startDate '2Xn4kVhM' \
    > test.out 2>&1
eval_tap $? 339 'AdminGetBannedDevicesV4' test.out

#- 340 AdminGetUserDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeviceBansV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'RdAgENsD' \
    > test.out 2>&1
eval_tap $? 340 'AdminGetUserDeviceBansV4' test.out

#- 341 AdminBanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminBanDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"comment": "xDk7dYEM", "deviceId": "r6JfXRsc", "deviceType": "hv6GpNvh", "enabled": true, "endDate": "kS78pQFz", "ext": {"xTAgzoYY": {}, "mNyAI7k5": {}, "5KqGjIfK": {}}, "reason": "YIK7TqXB"}' \
    > test.out 2>&1
eval_tap $? 341 'AdminBanDeviceV4' test.out

#- 342 AdminGetDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBanV4 \
    --banId 'YKIk3DgO' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 342 'AdminGetDeviceBanV4' test.out

#- 343 AdminUpdateDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateDeviceBanV4 \
    --banId 'TzL4gcFi' \
    --namespace "$AB_NAMESPACE" \
    --body '{"enabled": true}' \
    > test.out 2>&1
eval_tap $? 343 'AdminUpdateDeviceBanV4' test.out

#- 344 AdminGenerateReportV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateReportV4 \
    --namespace "$AB_NAMESPACE" \
    --endDate 'Rtg8NBim' \
    --startDate 'HUnVCKjX' \
    --deviceType 'kptDRwdn' \
    > test.out 2>&1
eval_tap $? 344 'AdminGenerateReportV4' test.out

#- 345 AdminGetDeviceTypesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceTypesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 345 'AdminGetDeviceTypesV4' test.out

#- 346 AdminGetDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBansV4 \
    --deviceId '0FBb41bk' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 346 'AdminGetDeviceBansV4' test.out

#- 347 AdminDecryptDeviceV4
eval_tap 0 347 'AdminDecryptDeviceV4 # SKIP deprecated' test.out

#- 348 AdminUnbanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminUnbanDeviceV4 \
    --deviceId 'AKOTAPzJ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 348 'AdminUnbanDeviceV4' test.out

#- 349 AdminGetUsersByDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUsersByDeviceV4 \
    --deviceId 'FKBUWJ6d' \
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
    --limit '62' \
    --offset '37' \
    > test.out 2>&1
eval_tap $? 351 'AdminGetNamespaceUserInvitationHistoryV4' test.out

#- 352 AdminCreateTestUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateTestUsersV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 2, "userInfo": {"country": "CaHF6hzg"}}' \
    > test.out 2>&1
eval_tap $? 352 'AdminCreateTestUsersV4' test.out

#- 353 AdminCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "aynJVgjf", "policyId": "Na2whd7v", "policyVersionId": "xEwNOpsx"}, {"isAccepted": true, "localizedPolicyVersionId": "I25UuYeb", "policyId": "tlLBlY2s", "policyVersionId": "OfQeFZ8E"}, {"isAccepted": true, "localizedPolicyVersionId": "jnFgWsz7", "policyId": "Re1Weiev", "policyVersionId": "eId25eAz"}], "authType": "EMAILPASSWD", "code": "u2Evag4d", "country": "duzoQ5qo", "dateOfBirth": "YXBdXf9R", "displayName": "Sf3Pf5eg", "emailAddress": "VFevAHI1", "password": "ndlXPyOB", "passwordMD5Sum": "aVkyOkm9", "reachMinimumAge": false, "uniqueDisplayName": "4ToUGui6", "username": "4wIfIXK2"}' \
    > test.out 2>&1
eval_tap $? 353 'AdminCreateUserV4' test.out

#- 354 AdminBulkUpdateUserAccountTypeV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateUserAccountTypeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"testAccount": false, "userIds": ["6WMgDnOi", "wYoXAcne", "H9jdBzcp"]}' \
    > test.out 2>&1
eval_tap $? 354 'AdminBulkUpdateUserAccountTypeV4' test.out

#- 355 AdminBulkCheckValidUserIDV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkCheckValidUserIDV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["6jPBZxkJ", "nHIO22Y4", "O3QsIixo"]}' \
    > test.out 2>&1
eval_tap $? 355 'AdminBulkCheckValidUserIDV4' test.out

#- 356 AdminUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'irLcMStm' \
    --body '{"avatarUrl": "70zoLmQe", "country": "Di7Fuk36", "dateOfBirth": "V5G7WrUc", "displayName": "y8wLQRF7", "languageTag": "0T4gnsat", "skipLoginQueue": false, "tags": ["3gfLJcFp", "7DCdPZif", "V1nUYaYh"], "uniqueDisplayName": "4QSbKDko", "userName": "jpkXYha0"}' \
    > test.out 2>&1
eval_tap $? 356 'AdminUpdateUserV4' test.out

#- 357 AdminUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '2YTxv8qB' \
    --body '{"code": "K4UqUUzv", "emailAddress": "emTgPZR1"}' \
    > test.out 2>&1
eval_tap $? 357 'AdminUpdateUserEmailAddressV4' test.out

#- 358 AdminDisableUserMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableUserMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'NPn6aUfl' \
    --body '{"factor": "OBUc6Uv9", "mfaToken": "PthWpxPR"}' \
    > test.out 2>&1
eval_tap $? 358 'AdminDisableUserMFAV4' test.out

#- 359 AdminGetUserMFAStatusV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUserMFAStatusV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Zcj6Niz4' \
    > test.out 2>&1
eval_tap $? 359 'AdminGetUserMFAStatusV4' test.out

#- 360 AdminListUserRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminListUserRolesV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'gn1Fh020' \
    > test.out 2>&1
eval_tap $? 360 'AdminListUserRolesV4' test.out

#- 361 AdminUpdateUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'OhCs6ssI' \
    --body '{"assignedNamespaces": ["FrRzohCQ", "SGhx2J8S", "0WCxDFji"], "roleId": "smu3V5Tq"}' \
    > test.out 2>&1
eval_tap $? 361 'AdminUpdateUserRoleV4' test.out

#- 362 AdminAddUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'sHZEyogU' \
    --body '{"assignedNamespaces": ["lrwsKOPO", "G2AlYdgM", "GGYks0XT"], "roleId": "PcjwAd1v"}' \
    > test.out 2>&1
eval_tap $? 362 'AdminAddUserRoleV4' test.out

#- 363 AdminRemoveUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRemoveUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'pdf1prez' \
    --body '{"assignedNamespaces": ["eyyb27pp", "2qt8J9OL", "kIEb3VWG"], "roleId": "WwHYNAFZ"}' \
    > test.out 2>&1
eval_tap $? 363 'AdminRemoveUserRoleV4' test.out

#- 364 AdminGetRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV4 \
    --adminRole  \
    --isWildcard  \
    --limit '69' \
    --offset '54' \
    > test.out 2>&1
eval_tap $? 364 'AdminGetRolesV4' test.out

#- 365 AdminCreateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV4 \
    --body '{"adminRole": true, "deletable": true, "isWildcard": false, "roleName": "2ZOYlo4W"}' \
    > test.out 2>&1
eval_tap $? 365 'AdminCreateRoleV4' test.out

#- 366 AdminGetRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV4 \
    --roleId '6hYikYzi' \
    > test.out 2>&1
eval_tap $? 366 'AdminGetRoleV4' test.out

#- 367 AdminDeleteRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV4 \
    --roleId 'JJ4zdQJA' \
    > test.out 2>&1
eval_tap $? 367 'AdminDeleteRoleV4' test.out

#- 368 AdminUpdateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV4 \
    --roleId '1lSG2ZhX' \
    --body '{"adminRole": false, "deletable": false, "isWildcard": false, "roleName": "j3LpXpVz"}' \
    > test.out 2>&1
eval_tap $? 368 'AdminUpdateRoleV4' test.out

#- 369 AdminUpdateRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV4 \
    --roleId 'r5M66rYg' \
    --body '{"permissions": [{"action": 4, "resource": "OAscsL4q", "schedAction": 100, "schedCron": "M4JdnIQS", "schedRange": ["tXDBBBoW", "NGdTC5hu", "QzH9G0D9"]}, {"action": 95, "resource": "2eVYEJOS", "schedAction": 30, "schedCron": "RiuNVwbP", "schedRange": ["4biF3GfV", "5ofQ8UOp", "aYoAZ9jM"]}, {"action": 52, "resource": "YW0rTGdl", "schedAction": 16, "schedCron": "Uogfjn0o", "schedRange": ["OhAyrWCm", "CRSoWo6I", "eJRgOclk"]}]}' \
    > test.out 2>&1
eval_tap $? 369 'AdminUpdateRolePermissionsV4' test.out

#- 370 AdminAddRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV4 \
    --roleId 'TLTLqGud' \
    --body '{"permissions": [{"action": 88, "resource": "S7D9WuHa", "schedAction": 82, "schedCron": "WqmgLWsb", "schedRange": ["sVby109S", "7JvHpnaF", "umdvvGJC"]}, {"action": 7, "resource": "fmcUxmaE", "schedAction": 19, "schedCron": "avsw9rd3", "schedRange": ["amxDYTlR", "SqLxJMcz", "QwL4F3AJ"]}, {"action": 98, "resource": "NS6Fpq4W", "schedAction": 74, "schedCron": "FWqxdguT", "schedRange": ["CcNfokrU", "pVl4SJCt", "Bgf8o0TJ"]}]}' \
    > test.out 2>&1
eval_tap $? 370 'AdminAddRolePermissionsV4' test.out

#- 371 AdminDeleteRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV4 \
    --roleId 'zuAqNmNf' \
    --body '["LrRwqFjw", "wswEl1EI", "V6B0x4tp"]' \
    > test.out 2>&1
eval_tap $? 371 'AdminDeleteRolePermissionsV4' test.out

#- 372 AdminListAssignedUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminListAssignedUsersV4 \
    --roleId '8qVqVtnC' \
    --after 'B6iZsYKZ' \
    --before 'YMzzM8oi' \
    --limit '16' \
    > test.out 2>&1
eval_tap $? 372 'AdminListAssignedUsersV4' test.out

#- 373 AdminAssignUserToRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAssignUserToRoleV4 \
    --roleId 'dcLNZyAw' \
    --body '{"assignedNamespaces": ["sAWpcsrP", "9nqqXLKZ", "ouQSvcYY"], "namespace": "GqUDirUh", "userId": "4VrtVBPD"}' \
    > test.out 2>&1
eval_tap $? 373 'AdminAssignUserToRoleV4' test.out

#- 374 AdminRevokeUserFromRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRevokeUserFromRoleV4 \
    --roleId 'futjR1km' \
    --body '{"namespace": "S4nxv20W", "userId": "Gt1ln9Q8"}' \
    > test.out 2>&1
eval_tap $? 374 'AdminRevokeUserFromRoleV4' test.out

#- 375 AdminInviteUserNewV4
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserNewV4 \
    --body '{"assignedNamespaces": ["afS3qoQK", "bPnYi6u8", "pEfPPhcL"], "emailAddresses": ["KkbjuDmX", "5OTaOx4l", "ixsUh2F5"], "isAdmin": false, "isNewStudio": false, "languageTag": "1UqnUhyG", "namespace": "Op6WOD9Z", "roleId": "DM5ZC0DX"}' \
    > test.out 2>&1
eval_tap $? 375 'AdminInviteUserNewV4' test.out

#- 376 AdminUpdateMyUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateMyUserV4 \
    --body '{"avatarUrl": "STT31Sko", "country": "YkoPHaN0", "dateOfBirth": "4lOPZtH4", "displayName": "sI8Bfp1g", "languageTag": "ZGePKISE", "skipLoginQueue": false, "tags": ["ppJSI4LY", "fOEwh9gm", "TnVGAtIR"], "uniqueDisplayName": "VY7LQthm", "userName": "MVF2Q2mg"}' \
    > test.out 2>&1
eval_tap $? 376 'AdminUpdateMyUserV4' test.out

#- 377 AdminDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyAuthenticatorV4 \
    --body '{"factor": "bMjnKJ4K", "mfaToken": "4y4yGHAI"}' \
    > test.out 2>&1
eval_tap $? 377 'AdminDisableMyAuthenticatorV4' test.out

#- 378 AdminEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyAuthenticatorV4 \
    --code 'Icxb6h2H' \
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
    --body '{"factor": "PactYSWE", "mfaToken": "wAZ0rKPA"}' \
    > test.out 2>&1
eval_tap $? 382 'AdminDisableMyBackupCodesV4' test.out

#- 383 AdminDownloadMyBackupCodesV4
eval_tap 0 383 'AdminDownloadMyBackupCodesV4 # SKIP deprecated' test.out

#- 384 AdminEnableMyBackupCodesV4
eval_tap 0 384 'AdminEnableMyBackupCodesV4 # SKIP deprecated' test.out

#- 385 AdminGetBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBackupCodesV4 \
    --languageTag 'wWRdHdiG' \
    > test.out 2>&1
eval_tap $? 385 'AdminGetBackupCodesV4' test.out

#- 386 AdminGenerateBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateBackupCodesV4 \
    --languageTag 'IXTVDve9' \
    > test.out 2>&1
eval_tap $? 386 'AdminGenerateBackupCodesV4' test.out

#- 387 AdminEnableBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableBackupCodesV4 \
    --languageTag '1uMo6OvL' \
    > test.out 2>&1
eval_tap $? 387 'AdminEnableBackupCodesV4' test.out

#- 388 AdminChallengeMyMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminChallengeMyMFAV4 \
    --code '7WmCI8QZ' \
    --factor 'w0nrwX22' \
    > test.out 2>&1
eval_tap $? 388 'AdminChallengeMyMFAV4' test.out

#- 389 AdminSendMyMFAEmailCodeV4
./ng net.accelbyte.sdk.cli.Main iam adminSendMyMFAEmailCodeV4 \
    --action 'XGTINLgz' \
    --languageTag 'l69WU6Nd' \
    > test.out 2>&1
eval_tap $? 389 'AdminSendMyMFAEmailCodeV4' test.out

#- 390 AdminDisableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyEmailV4 \
    --body '{"factor": "VXJ1JsVL", "mfaToken": "iyVIpiih"}' \
    > test.out 2>&1
eval_tap $? 390 'AdminDisableMyEmailV4' test.out

#- 391 AdminEnableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyEmailV4 \
    --code 'j5ndHxtG' \
    > test.out 2>&1
eval_tap $? 391 'AdminEnableMyEmailV4' test.out

#- 392 AdminGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyEnabledFactorsV4 \
    > test.out 2>&1
eval_tap $? 392 'AdminGetMyEnabledFactorsV4' test.out

#- 393 AdminMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam adminMakeFactorMyDefaultV4 \
    --factor 'jRuk8yqj' \
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
    --clientId 'jRWylXuf' \
    --linkingToken '3oH1K6Ne' \
    --password 'mv1q4Ui0' \
    --username 'kxsKRQ5Z' \
    > test.out 2>&1
eval_tap $? 397 'AuthenticationWithPlatformLinkV4' test.out

#- 398 GenerateTokenByNewHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV4 \
    --additionalData 'IfVOFIm1' \
    --extendExp  \
    --linkingToken '00WeAkjQ' \
    > test.out 2>&1
eval_tap $? 398 'GenerateTokenByNewHeadlessAccountV4' test.out

#- 399 Verify2faCodeV4
./ng net.accelbyte.sdk.cli.Main iam verify2faCodeV4 \
    --code 'cAeO7xvv' \
    --factor 'llNXP1Gq' \
    --mfaToken 'kYZiUDVl' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 399 'Verify2faCodeV4' test.out

#- 400 PlatformTokenGrantV4
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV4 \
    --platformId '9OjLX1vS' \
    --codeChallenge 'g0gz9htg' \
    --codeChallengeMethod 'plain' \
    --additionalData 'Th9Out2I' \
    --clientId 'kmcvG6zo' \
    --createHeadless  \
    --deviceId 'LQQM0q0e' \
    --macAddress '5ncR8a6O' \
    --platformToken 'LUNKV6Eb' \
    --serviceLabel '0.4020761239692119' \
    --skipSetCookie  \
    > test.out 2>&1
eval_tap $? 400 'PlatformTokenGrantV4' test.out

#- 401 SimultaneousLoginV4
./ng net.accelbyte.sdk.cli.Main iam simultaneousLoginV4 \
    --codeChallenge 'VpxsWY16' \
    --codeChallengeMethod 'S256' \
    --simultaneousPlatform 'CjB0qDHp' \
    --simultaneousTicket 'AQ9u1nuh' \
    --nativePlatform 'steam' \
    --nativePlatformTicket 'iZYP1uco' \
    > test.out 2>&1
eval_tap $? 401 'SimultaneousLoginV4' test.out

#- 402 TokenGrantV4
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV4 \
    --codeChallenge 'AlEHVnL2' \
    --codeChallengeMethod 'plain' \
    --additionalData 'n8reOzrr' \
    --clientId 'KBa1uFDB' \
    --clientSecret 'yU5BjAe7' \
    --code 'QuC7w5gk' \
    --codeVerifier 'syc5Ssdn' \
    --extendNamespace 'Fnmhe5LS' \
    --extendExp  \
    --loginQueueTicket '9c47qx4P' \
    --password 'ClOshDzL' \
    --redirectUri 'B8fDxA6W' \
    --refreshToken 'ckCh6OKr' \
    --scope 'ZeI5t74Q' \
    --username 'Z8birm2y' \
    --grantType 'password' \
    > test.out 2>&1
eval_tap $? 402 'TokenGrantV4' test.out

#- 403 RequestTargetTokenResponseV4
./ng net.accelbyte.sdk.cli.Main iam requestTargetTokenResponseV4 \
    --additionalData 'uZLUQMd0' \
    --code 'EA6CLZSx' \
    > test.out 2>&1
eval_tap $? 403 'RequestTargetTokenResponseV4' test.out

#- 404 PublicListUserIDByPlatformUserIDsV4
./ng net.accelbyte.sdk.cli.Main iam publicListUserIDByPlatformUserIDsV4 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'c5yKUhGU' \
    --rawPUID  \
    --body '{"pidType": "S8fKzdfz", "platformUserIds": ["pST7kX9u", "SkiG54hf", "jqsPOnMM"]}' \
    > test.out 2>&1
eval_tap $? 404 'PublicListUserIDByPlatformUserIDsV4' test.out

#- 405 PublicGetUserByPlatformUserIDV4
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByPlatformUserIDV4 \
    --namespace "$AB_NAMESPACE" \
    --platformId '0mes8YWJ' \
    --platformUserId '6bT0TkIJ' \
    > test.out 2>&1
eval_tap $? 405 'PublicGetUserByPlatformUserIDV4' test.out

#- 406 PublicCreateTestUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateTestUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "F4wn8l40", "policyId": "Rr8p54JZ", "policyVersionId": "eD71CfMj"}, {"isAccepted": true, "localizedPolicyVersionId": "kgt6GYd1", "policyId": "qYIORieF", "policyVersionId": "E00R0QDC"}, {"isAccepted": true, "localizedPolicyVersionId": "3iAZEBK0", "policyId": "4y1Ahzvd", "policyVersionId": "vzfzzEDV"}], "authType": "EMAILPASSWD", "country": "sYH6sUET", "dateOfBirth": "Fho4mCpc", "displayName": "BktEXt86", "emailAddress": "mJ6TbfWs", "password": "Rmu9h5lz", "passwordMD5Sum": "DMab2Pzm", "uniqueDisplayName": "bGCCsagV", "username": "d87AIwcn", "verified": false}' \
    > test.out 2>&1
eval_tap $? 406 'PublicCreateTestUserV4' test.out

#- 407 PublicCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "7sMn39e1", "policyId": "hzb5OyZB", "policyVersionId": "UCmQNxd1"}, {"isAccepted": false, "localizedPolicyVersionId": "MguiEGeO", "policyId": "r1LapGxc", "policyVersionId": "jNCOVDHB"}, {"isAccepted": true, "localizedPolicyVersionId": "c9xSz2T6", "policyId": "HCjM90bh", "policyVersionId": "cvtbEL9F"}], "authType": "EMAILPASSWD", "code": "xQAy2DiV", "country": "b2OXMIeK", "dateOfBirth": "lZczzHiJ", "displayName": "TGKs85J4", "emailAddress": "IHkTcXZi", "password": "XkcVgUiU", "passwordMD5Sum": "nmdGvAps", "reachMinimumAge": false, "uniqueDisplayName": "FBUbu1gz", "username": "cbQcOfGQ"}' \
    > test.out 2>&1
eval_tap $? 407 'PublicCreateUserV4' test.out

#- 408 CreateUserFromInvitationV4
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV4 \
    --invitationId '3m3kBHiC' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "s4hSPm8s", "policyId": "YSo84H4U", "policyVersionId": "GGTeo0Nc"}, {"isAccepted": true, "localizedPolicyVersionId": "S3yzgsdH", "policyId": "vrBCYjhG", "policyVersionId": "2WrIquz9"}, {"isAccepted": true, "localizedPolicyVersionId": "9QC9WwjI", "policyId": "2gdxIEgT", "policyVersionId": "CSdePAFq"}], "authType": "EMAILPASSWD", "code": "4Rxo4P9u", "country": "c4fAFm9y", "dateOfBirth": "JOpxObCB", "displayName": "FCTf57Dq", "emailAddress": "Gr9DnKkN", "password": "lE02z3dZ", "passwordMD5Sum": "Q6nTyF0L", "reachMinimumAge": true, "uniqueDisplayName": "xqatBQTu", "username": "dNxrRAc4"}' \
    > test.out 2>&1
eval_tap $? 408 'CreateUserFromInvitationV4' test.out

#- 409 PublicUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "zMs9265g", "country": "E3YBDs11", "dateOfBirth": "UjT7XZu6", "displayName": "KjYQB35H", "languageTag": "J1OVuRPF", "uniqueDisplayName": "f80teBRH", "userName": "X1UNoagH"}' \
    > test.out 2>&1
eval_tap $? 409 'PublicUpdateUserV4' test.out

#- 410 PublicUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "seNmzQ8k", "emailAddress": "Qaeh3rFx"}' \
    > test.out 2>&1
eval_tap $? 410 'PublicUpdateUserEmailAddressV4' test.out

#- 411 PublicUpgradeHeadlessAccountWithVerificationCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountWithVerificationCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "Clmurglh", "country": "4bMhLXr7", "dateOfBirth": "k2kvG2Ot", "displayName": "0mZoqOia", "emailAddress": "m9RK6c3O", "password": "D1kJtilT", "reachMinimumAge": true, "uniqueDisplayName": "dFFkLYK4", "username": "F7B6rzq1", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 411 'PublicUpgradeHeadlessAccountWithVerificationCodeV4' test.out

#- 412 PublicUpgradeHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"dateOfBirth": "M766fq9X", "displayName": "7R1qSJOJ", "emailAddress": "BqD7zCzG", "password": "6Rw0tiSY", "uniqueDisplayName": "txYW49Cv", "username": "WTKnqpLQ"}' \
    > test.out 2>&1
eval_tap $? 412 'PublicUpgradeHeadlessAccountV4' test.out

#- 413 PublicDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"factor": "hcX3aIeZ", "mfaToken": "3lefIVSi"}' \
    > test.out 2>&1
eval_tap $? 413 'PublicDisableMyAuthenticatorV4' test.out

#- 414 PublicEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'b3m6jjbb' \
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
    --body '{"factor": "jQYBnEuc", "mfaToken": "S3Etz46r"}' \
    > test.out 2>&1
eval_tap $? 418 'PublicDisableMyBackupCodesV4' test.out

#- 419 PublicDownloadMyBackupCodesV4
eval_tap 0 419 'PublicDownloadMyBackupCodesV4 # SKIP deprecated' test.out

#- 420 PublicEnableMyBackupCodesV4
eval_tap 0 420 'PublicEnableMyBackupCodesV4 # SKIP deprecated' test.out

#- 421 PublicGetBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGetBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --languageTag 'oFRzzwOx' \
    > test.out 2>&1
eval_tap $? 421 'PublicGetBackupCodesV4' test.out

#- 422 PublicGenerateBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --languageTag 'JGwgvrqq' \
    > test.out 2>&1
eval_tap $? 422 'PublicGenerateBackupCodesV4' test.out

#- 423 PublicEnableBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --languageTag 'N4hDbAty' \
    > test.out 2>&1
eval_tap $? 423 'PublicEnableBackupCodesV4' test.out

#- 424 PublicChallengeMyMFAV4
./ng net.accelbyte.sdk.cli.Main iam publicChallengeMyMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'yBUHdrru' \
    --factor 'r5Wru0yp' \
    > test.out 2>&1
eval_tap $? 424 'PublicChallengeMyMFAV4' test.out

#- 425 PublicRemoveTrustedDeviceV4
./ng net.accelbyte.sdk.cli.Main iam publicRemoveTrustedDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceToken '52sP75XH' \
    > test.out 2>&1
eval_tap $? 425 'PublicRemoveTrustedDeviceV4' test.out

#- 426 PublicSendMyMFAEmailCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicSendMyMFAEmailCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --action 'fursZE36' \
    --languageTag 'gt0E6pG5' \
    > test.out 2>&1
eval_tap $? 426 'PublicSendMyMFAEmailCodeV4' test.out

#- 427 PublicDisableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyEmailV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"factor": "Z8Xvxriv", "mfaToken": "PCaTau5t"}' \
    > test.out 2>&1
eval_tap $? 427 'PublicDisableMyEmailV4' test.out

#- 428 PublicEnableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyEmailV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'cNdKV56Y' \
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
    --factor 'X85lEzYd' \
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
    --userId 'MMzvuNmr' \
    > test.out 2>&1
eval_tap $? 433 'PublicGetUserPublicInfoByUserIdV4' test.out

#- 434 PublicInviteUserV4
./ng net.accelbyte.sdk.cli.Main iam publicInviteUserV4 \
    --body '{"additionalData": "Wa7n150x", "emailAddress": "0HJGYJgJ", "languageTag": "QcxKnMdb", "namespace": "bV3Xrt7O", "namespaceDisplayName": "IdFOveYS"}' \
    > test.out 2>&1
eval_tap $? 434 'PublicInviteUserV4' test.out

#- 435 PublicUpgradeHeadlessWithCodeV4Forward
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessWithCodeV4Forward \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "DKyfldIR", "policyId": "5y3GOOwb", "policyVersionId": "ljOT1Hhz"}, {"isAccepted": false, "localizedPolicyVersionId": "Wyt7uEBh", "policyId": "dp4Xxx5j", "policyVersionId": "9lPQlR33"}, {"isAccepted": true, "localizedPolicyVersionId": "xZWESUGs", "policyId": "ReERfCHl", "policyVersionId": "PQcKix7w"}], "code": "Zs4BvLjT", "country": "QmQgbuHA", "dateOfBirth": "lqdrDLv4", "displayName": "sQhZkAt1", "emailAddress": "SdLQTiZs", "password": "g0JbyYrm", "reachMinimumAge": true, "uniqueDisplayName": "mUUIH4Pn", "username": "IWcG81uO", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 435 'PublicUpgradeHeadlessWithCodeV4Forward' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
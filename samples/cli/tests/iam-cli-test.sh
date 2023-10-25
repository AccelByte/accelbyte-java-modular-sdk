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
echo "1..363"

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

#- 108 AdminGetInputValidations
./ng net.accelbyte.sdk.cli.Main iam adminGetInputValidations \
    > test.out 2>&1
eval_tap $? 108 'AdminGetInputValidations' test.out

#- 109 AdminUpdateInputValidations
./ng net.accelbyte.sdk.cli.Main iam adminUpdateInputValidations \
    --body '[{"field": "9ERbQAt5", "validation": {"allowAllSpecialCharacters": true, "allowDigit": false, "allowLetter": true, "allowSpace": false, "allowUnicode": true, "avatarConfig": {"allowedPrefixes": ["YSNOOIIa", "Pptd5hJa", "Yr7CWpK5"], "preferRegex": false, "regex": "FnVmfnvz"}, "blockedWord": ["RYknxJjx", "DnH0woWn", "404lNDK1"], "description": [{"language": "U69JoNSB", "message": ["0j10UniQ", "OUuViv0y", "in5u3JWM"]}, {"language": "CDoRZ4YK", "message": ["5HCPuxfs", "vI5YJjYc", "eI9RYBBx"]}, {"language": "qQTN63wp", "message": ["BBKJZciy", "qnVXuR1t", "BQ7XfJ0f"]}], "isCustomRegex": true, "letterCase": "Lpb1HYy1", "maxLength": 97, "maxRepeatingAlphaNum": 28, "maxRepeatingSpecialCharacter": 84, "minCharType": 96, "minLength": 50, "regex": "CUl6stCU", "specialCharacterLocation": "QzW1OqbF", "specialCharacters": ["RyMAQbKS", "lOuL3dn1", "o6naLfH5"]}}, {"field": "bgaxtgeU", "validation": {"allowAllSpecialCharacters": false, "allowDigit": true, "allowLetter": false, "allowSpace": false, "allowUnicode": false, "avatarConfig": {"allowedPrefixes": ["XvfjP5ut", "xAlsGsdx", "NJEpwFCu"], "preferRegex": false, "regex": "rWMYtIQg"}, "blockedWord": ["POdsDsY2", "MYzNEXfO", "369zlRbQ"], "description": [{"language": "BclDIEXl", "message": ["T56LP09r", "fA652zBt", "Cim20LSh"]}, {"language": "fpGd7zvq", "message": ["v3Pm4BWh", "V1IsuzIo", "0jIW3jR9"]}, {"language": "nTe3uBV1", "message": ["rB0O7z4o", "0aprPo8A", "EO76kHoC"]}], "isCustomRegex": true, "letterCase": "LzTxlMmr", "maxLength": 100, "maxRepeatingAlphaNum": 58, "maxRepeatingSpecialCharacter": 10, "minCharType": 78, "minLength": 91, "regex": "Aza4TVf3", "specialCharacterLocation": "2eiEKHuG", "specialCharacters": ["gEHsVLRw", "wmUSR4o7", "OHaoXl8B"]}}, {"field": "AVopAiQ3", "validation": {"allowAllSpecialCharacters": true, "allowDigit": false, "allowLetter": false, "allowSpace": true, "allowUnicode": true, "avatarConfig": {"allowedPrefixes": ["c2UkvIIH", "sVceUUpK", "TQUql47y"], "preferRegex": true, "regex": "6u0ukeuB"}, "blockedWord": ["85BXkhUd", "yRe4pUC7", "CQCyaa1d"], "description": [{"language": "P0jbpiIX", "message": ["ub1rBjT0", "2u5iMVpw", "1LAi6GTi"]}, {"language": "SnAukzMZ", "message": ["pbwsLhT2", "irWWDly9", "Hf0naYf4"]}, {"language": "R9yStYnw", "message": ["Us1KTWQW", "wK3XZBQ4", "NBxrjAb9"]}], "isCustomRegex": true, "letterCase": "ydRqrEcZ", "maxLength": 14, "maxRepeatingAlphaNum": 70, "maxRepeatingSpecialCharacter": 21, "minCharType": 67, "minLength": 58, "regex": "ribc0xrG", "specialCharacterLocation": "vhhIZqHa", "specialCharacters": ["0brKYZvb", "Kys5VvEO", "Q4PgEUoV"]}}]' \
    > test.out 2>&1
eval_tap $? 109 'AdminUpdateInputValidations' test.out

#- 110 AdminResetInputValidations
./ng net.accelbyte.sdk.cli.Main iam adminResetInputValidations \
    --field 'Q8Rdyszm' \
    > test.out 2>&1
eval_tap $? 110 'AdminResetInputValidations' test.out

#- 111 ListAdminsV3
./ng net.accelbyte.sdk.cli.Main iam listAdminsV3 \
    --namespace "$AB_NAMESPACE" \
    --after 'IytlFxTH' \
    --before 'wSe94C3Z' \
    --limit '68' \
    > test.out 2>&1
eval_tap $? 111 'ListAdminsV3' test.out

#- 112 AdminGetAgeRestrictionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetAgeRestrictionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 112 'AdminGetAgeRestrictionStatusV3' test.out

#- 113 AdminUpdateAgeRestrictionConfigV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateAgeRestrictionConfigV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"ageRestriction": 23, "enable": true}' \
    > test.out 2>&1
eval_tap $? 113 'AdminUpdateAgeRestrictionConfigV3' test.out

#- 114 AdminGetListCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminGetListCountryAgeRestrictionV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 114 'AdminGetListCountryAgeRestrictionV3' test.out

#- 115 AdminUpdateCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateCountryAgeRestrictionV3 \
    --countryCode 'DuyOhTLl' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ageRestriction": 49}' \
    > test.out 2>&1
eval_tap $? 115 'AdminUpdateCountryAgeRestrictionV3' test.out

#- 116 AdminGetBannedUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType 'ha5hOlZx' \
    --limit '6' \
    --offset '19' \
    > test.out 2>&1
eval_tap $? 116 'AdminGetBannedUsersV3' test.out

#- 117 AdminBanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"ban": "aMxkpZoa", "comment": "6J1pKg9h", "endDate": "To3OFgMr", "reason": "pU02NDP4", "skipNotif": false, "userIds": ["GzZkO7Su", "8pvGXrz5", "n8sIMebP"]}' \
    > test.out 2>&1
eval_tap $? 117 'AdminBanUserBulkV3' test.out

#- 118 AdminUnbanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminUnbanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"bans": [{"banId": "WDxGOra9", "userId": "Z13aZY11"}, {"banId": "iH6kBLYh", "userId": "7el0KctI"}, {"banId": "9nYGaTZq", "userId": "3f8OHeLJ"}]}' \
    > test.out 2>&1
eval_tap $? 118 'AdminUnbanUserBulkV3' test.out

#- 119 AdminGetBansTypeWithNamespaceV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBansTypeWithNamespaceV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 119 'AdminGetBansTypeWithNamespaceV3' test.out

#- 120 AdminGetClientsByNamespaceV3
./ng net.accelbyte.sdk.cli.Main iam adminGetClientsByNamespaceV3 \
    --namespace "$AB_NAMESPACE" \
    --clientId 'm4EJvJVE' \
    --clientName 'QkuVSQ8b' \
    --clientType 'sDyxEgtr' \
    --limit '18' \
    --offset '22' \
    > test.out 2>&1
eval_tap $? 120 'AdminGetClientsByNamespaceV3' test.out

#- 121 AdminCreateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateClientV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["5NH36CWw", "nj6i903w", "W62YElxl"], "baseUri": "8Uzsd7Do", "clientId": "OrqqFXuh", "clientName": "baX4Bwlj", "clientPermissions": [{"action": 90, "resource": "YofJy8qD", "schedAction": 41, "schedCron": "kKb1gFep", "schedRange": ["XiQ1BVA0", "rv2B7WTY", "jT8DLP4o"]}, {"action": 47, "resource": "IHw9Slom", "schedAction": 7, "schedCron": "24Vd82RO", "schedRange": ["eGreFFSv", "NTDKlL6B", "jD8X5iiT"]}, {"action": 78, "resource": "joLaSx60", "schedAction": 91, "schedCron": "79FwfUDB", "schedRange": ["Gru60RCu", "pCDW0woc", "IMljZI1r"]}], "clientPlatform": "LQFlUR30", "deletable": true, "description": "xN40fq1r", "namespace": "yBOo4mHN", "oauthAccessTokenExpiration": 60, "oauthAccessTokenExpirationTimeUnit": "u5SSBhjX", "oauthClientType": "RdhnC0Ec", "oauthRefreshTokenExpiration": 2, "oauthRefreshTokenExpirationTimeUnit": "310g0vMO", "parentNamespace": "mgnt6GLe", "redirectUri": "jhFi5bdb", "scopes": ["IqxqpOSe", "cmJxwag2", "Qr0lr3VT"], "secret": "qkrHqsav", "twoFactorEnabled": false}' \
    > test.out 2>&1
eval_tap $? 121 'AdminCreateClientV3' test.out

#- 122 AdminGetClientsbyNamespacebyIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetClientsbyNamespacebyIDV3 \
    --clientId 'lXRT5wTp' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 122 'AdminGetClientsbyNamespacebyIDV3' test.out

#- 123 AdminDeleteClientV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientV3 \
    --clientId '8U8hxGMy' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 123 'AdminDeleteClientV3' test.out

#- 124 AdminUpdateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientV3 \
    --clientId 'u1HUYmKa' \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["Ybv35m6E", "n6E0mQyD", "0lJ9fQ3x"], "baseUri": "Mk4AToRS", "clientName": "cn8py0EZ", "clientPermissions": [{"action": 41, "resource": "dPC70I6P", "schedAction": 36, "schedCron": "JvfkRXEn", "schedRange": ["wSda7ees", "b6bCOtV3", "5p4eplsB"]}, {"action": 99, "resource": "TwyaFOAC", "schedAction": 39, "schedCron": "BlOa219m", "schedRange": ["3Mk0pvNA", "8rcRkwgz", "DqQh4d5J"]}, {"action": 1, "resource": "dnxwGmbN", "schedAction": 47, "schedCron": "xJyvb1qr", "schedRange": ["5nEJm98v", "QdpnDvsk", "qnJMcCRc"]}], "clientPlatform": "DZgDO3ol", "deletable": true, "description": "Gz2MS80w", "namespace": "QryYmWpV", "oauthAccessTokenExpiration": 3, "oauthAccessTokenExpirationTimeUnit": "i7NLZ73e", "oauthRefreshTokenExpiration": 14, "oauthRefreshTokenExpirationTimeUnit": "aIXcEiI3", "redirectUri": "RELf591P", "scopes": ["9RR7pPqg", "RNEI6rUg", "fcISQFhg"], "twoFactorEnabled": true}' \
    > test.out 2>&1
eval_tap $? 124 'AdminUpdateClientV3' test.out

#- 125 AdminUpdateClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientPermissionV3 \
    --clientId 'RM1cuc1R' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 27, "resource": "eYy0zsVt"}, {"action": 90, "resource": "soJgZXRj"}, {"action": 65, "resource": "0wvROLLt"}]}' \
    > test.out 2>&1
eval_tap $? 125 'AdminUpdateClientPermissionV3' test.out

#- 126 AdminAddClientPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddClientPermissionsV3 \
    --clientId 'pEO5gU3X' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 10, "resource": "NiPh215W"}, {"action": 32, "resource": "hSbY14ne"}, {"action": 94, "resource": "egn1eAY5"}]}' \
    > test.out 2>&1
eval_tap $? 126 'AdminAddClientPermissionsV3' test.out

#- 127 AdminDeleteClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientPermissionV3 \
    --action '40' \
    --clientId 'HplwXX20' \
    --namespace "$AB_NAMESPACE" \
    --resource 'LMTGaFLn' \
    > test.out 2>&1
eval_tap $? 127 'AdminDeleteClientPermissionV3' test.out

#- 128 AdminGetCountryListV3
./ng net.accelbyte.sdk.cli.Main iam adminGetCountryListV3 \
    --namespace "$AB_NAMESPACE" \
    --filterBlacklist  \
    > test.out 2>&1
eval_tap $? 128 'AdminGetCountryListV3' test.out

#- 129 AdminGetCountryBlacklistV3
./ng net.accelbyte.sdk.cli.Main iam adminGetCountryBlacklistV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 129 'AdminGetCountryBlacklistV3' test.out

#- 130 AdminAddCountryBlacklistV3
./ng net.accelbyte.sdk.cli.Main iam adminAddCountryBlacklistV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"blacklist": ["wSbyLuES", "s23uHkIx", "GwBqOvxq"]}' \
    > test.out 2>&1
eval_tap $? 130 'AdminAddCountryBlacklistV3' test.out

#- 131 RetrieveAllThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveAllThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 131 'RetrieveAllThirdPartyLoginPlatformCredentialV3' test.out

#- 132 RetrieveAllActiveThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveAllActiveThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 132 'RetrieveAllActiveThirdPartyLoginPlatformCredentialV3' test.out

#- 133 RetrieveAllSSOLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveAllSSOLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '17' \
    --offset '26' \
    > test.out 2>&1
eval_tap $? 133 'RetrieveAllSSOLoginPlatformCredentialV3' test.out

#- 134 RetrieveThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'HgsItXp2' \
    > test.out 2>&1
eval_tap $? 134 'RetrieveThirdPartyLoginPlatformCredentialV3' test.out

#- 135 AddThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam addThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'jWKPmqNF' \
    --body '{"ACSURL": "3qvZVa82", "AWSCognitoRegion": "8Y4af8Ta", "AWSCognitoUserPool": "qqD3tJ2C", "AllowedClients": ["BT3sfTHQ", "Epik2cup", "VgmXuWdL"], "AppId": "1C4wBdmq", "AuthorizationEndpoint": "sMMH1SbC", "ClientId": "ng5ovkjG", "Environment": "8pDLqlrO", "FederationMetadataURL": "0KK2CRyE", "GenericOauthFlow": true, "IsActive": true, "Issuer": "sDNt91En", "JWKSEndpoint": "bTDfSyJG", "KeyID": "oQEYTxjj", "NetflixCertificates": {"encryptedPrivateKey": "HeJyeMT2", "encryptedPrivateKeyName": "L8Gt9Yqb", "publicCertificate": "jTXb1y2L", "publicCertificateName": "1V63ZoIJ", "rootCertificate": "C1pNulKy", "rootCertificateName": "4ZGpqH6W"}, "OrganizationId": "1g0EjoU1", "PlatformName": "EWsFYcZl", "RedirectUri": "lzjIB6gB", "RegisteredDomains": [{"affectedClientIDs": ["Hq0oWmZL", "aMvZtlD4", "XH2fbrb5"], "domain": "scRDJ2GI", "namespaces": ["rRDc8ITO", "ASJzAQ2v", "pu1San7r"], "roleId": "PbEEmnl7"}, {"affectedClientIDs": ["Y1rPFwKE", "i90k3tZX", "lIJawVVY"], "domain": "7G8BxsDX", "namespaces": ["43B6z89g", "Tq0zkFjX", "LL8WW9qp"], "roleId": "1jZ903gi"}, {"affectedClientIDs": ["qXArUMp3", "NAfQvDsD", "GgBjMOpy"], "domain": "7qw0UDLu", "namespaces": ["MlRCnF8y", "pngLqVhD", "rhdIl26b"], "roleId": "Hqb50fKH"}], "Secret": "9Ucq2sC8", "TeamID": "Ugzy0rmj", "TokenAuthenticationType": "ghDCmMW9", "TokenClaimsMapping": {"gMN4hzi4": "Z8u1s6Ae", "Ms2l5CHJ": "kVjnOvY7", "B7bNBCiH": "6y82NQKh"}, "TokenEndpoint": "mGSyqKC9", "UserInfoEndpoint": "guZcwYwE", "UserInfoHTTPMethod": "nYtiWqxF", "scopes": ["n5x2znTt", "iHwSSyRa", "8R5YrBby"]}' \
    > test.out 2>&1
eval_tap $? 135 'AddThirdPartyLoginPlatformCredentialV3' test.out

#- 136 DeleteThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'WKrpNPQB' \
    > test.out 2>&1
eval_tap $? 136 'DeleteThirdPartyLoginPlatformCredentialV3' test.out

#- 137 UpdateThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'GhBa2Zxq' \
    --body '{"ACSURL": "OWvR6hla", "AWSCognitoRegion": "UdkpfbCh", "AWSCognitoUserPool": "fbPtHAGR", "AllowedClients": ["ibsdjArk", "EXSoyS4H", "hFAQOYwa"], "AppId": "FqyPTFic", "AuthorizationEndpoint": "glWPGkPO", "ClientId": "3XfGoDQo", "Environment": "Swu18BW4", "FederationMetadataURL": "ahSsdElh", "GenericOauthFlow": false, "IsActive": true, "Issuer": "BARBvKnY", "JWKSEndpoint": "UXtNpSns", "KeyID": "vwX57979", "NetflixCertificates": {"encryptedPrivateKey": "j3QFtGUw", "encryptedPrivateKeyName": "xWbbLpsA", "publicCertificate": "P26YPQU3", "publicCertificateName": "Sc5PT3Ln", "rootCertificate": "QCO6sMht", "rootCertificateName": "PwHd8Pff"}, "OrganizationId": "oqpcHB2f", "PlatformName": "ZnBsiNO0", "RedirectUri": "3Xh8P1w0", "RegisteredDomains": [{"affectedClientIDs": ["9Il6Xdjz", "jy2pOkhD", "r8xNFwjy"], "domain": "ddQ3ebJn", "namespaces": ["DsXP4jI6", "LVGIPc0e", "qKKSkp9X"], "roleId": "ROuTSnJh"}, {"affectedClientIDs": ["UpK1Q5o9", "ObRNXbU6", "qbOfV1U8"], "domain": "Dsoga5Bn", "namespaces": ["9i71yJcL", "wr746wfG", "9CljkZPr"], "roleId": "YYtcMpaa"}, {"affectedClientIDs": ["cMEjdE4m", "QSCVyM1F", "jPVbxivN"], "domain": "48uE2Qym", "namespaces": ["wljX87LS", "tQtMnYZE", "2zxmPlwo"], "roleId": "eHNqO5v9"}], "Secret": "cScAhOHY", "TeamID": "2PbRL6JC", "TokenAuthenticationType": "dqEOoR2C", "TokenClaimsMapping": {"5OUoiOrq": "ryO70bdM", "w5qJA9hB": "8GzXagMD", "eOh6oLZb": "vV6EBQY6"}, "TokenEndpoint": "cNlOEzhf", "UserInfoEndpoint": "huqWJc2I", "UserInfoHTTPMethod": "rBZYWPqg", "scopes": ["78l2c0gY", "Jx54x6Ke", "A5eE6ELS"]}' \
    > test.out 2>&1
eval_tap $? 137 'UpdateThirdPartyLoginPlatformCredentialV3' test.out

#- 138 UpdateThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '5YFo2I5u' \
    --body '{"affectedClientIDs": ["glvCyDsc", "0wNSE6vZ", "CIhn4N9L"], "assignedNamespaces": ["YxCFazNu", "3UZbkNA6", "9fb9Cqis"], "domain": "swOlsJIM", "roleId": "jfHO8JIM"}' \
    > test.out 2>&1
eval_tap $? 138 'UpdateThirdPartyLoginPlatformDomainV3' test.out

#- 139 DeleteThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'QRjRd3Oq' \
    --body '{"domain": "5NcMLk5z"}' \
    > test.out 2>&1
eval_tap $? 139 'DeleteThirdPartyLoginPlatformDomainV3' test.out

#- 140 RetrieveSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam retrieveSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'uerGloA3' \
    > test.out 2>&1
eval_tap $? 140 'RetrieveSSOLoginPlatformCredential' test.out

#- 141 AddSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam addSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'zTJS4UB4' \
    --body '{"acsUrl": "Efux944n", "apiKey": "a4G7dYus", "appId": "llao2iaM", "federationMetadataUrl": "dKrAMXDM", "isActive": false, "redirectUri": "m1WyMtkA", "secret": "9kz6Z6UB", "ssoUrl": "bDg839Ya"}' \
    > test.out 2>&1
eval_tap $? 141 'AddSSOLoginPlatformCredential' test.out

#- 142 DeleteSSOLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteSSOLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'lKS7gKR2' \
    > test.out 2>&1
eval_tap $? 142 'DeleteSSOLoginPlatformCredentialV3' test.out

#- 143 UpdateSSOPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam updateSSOPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'SCXzoibf' \
    --body '{"acsUrl": "Ykw2Adic", "apiKey": "5Or7jIps", "appId": "yhB6J2jY", "federationMetadataUrl": "Xgd9Ues6", "isActive": false, "redirectUri": "peqzwg7n", "secret": "giOCVDlU", "ssoUrl": "SM8TI6Yk"}' \
    > test.out 2>&1
eval_tap $? 143 'UpdateSSOPlatformCredential' test.out

#- 144 AdminListUserIDByPlatformUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByPlatformUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'seiPSWQn' \
    --rawPID  \
    --body '{"platformUserIds": ["TEnrO0Sv", "5uormwDZ", "ZNC7PmBR"]}' \
    > test.out 2>&1
eval_tap $? 144 'AdminListUserIDByPlatformUserIDsV3' test.out

#- 145 AdminGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'ULHj3NOq' \
    --platformUserId 'R3YRjQ4U' \
    > test.out 2>&1
eval_tap $? 145 'AdminGetUserByPlatformUserIDV3' test.out

#- 146 GetAdminUsersByRoleIdV3
./ng net.accelbyte.sdk.cli.Main iam getAdminUsersByRoleIdV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId '8QpblHtw' \
    --after '64' \
    --before '100' \
    --limit '34' \
    > test.out 2>&1
eval_tap $? 146 'GetAdminUsersByRoleIdV3' test.out

#- 147 AdminGetUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --emailAddress 'vlumfku8' \
    > test.out 2>&1
eval_tap $? 147 'AdminGetUserByEmailAddressV3' test.out

#- 148 AdminGetBulkUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType 'lDMXofBf' \
    --body '{"bulkUserId": ["kTtGZb2i", "EI469VA0", "8B1eIroK"]}' \
    > test.out 2>&1
eval_tap $? 148 'AdminGetBulkUserBanV3' test.out

#- 149 AdminListUserIDByUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["Mmio1zyj", "enmHRfLf", "zpIovsw3"]}' \
    > test.out 2>&1
eval_tap $? 149 'AdminListUserIDByUserIDsV3' test.out

#- 150 AdminBulkGetUsersPlatform
./ng net.accelbyte.sdk.cli.Main iam adminBulkGetUsersPlatform \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["EeF4kRMm", "0SjOKaHt", "fzB8yCoC"]}' \
    > test.out 2>&1
eval_tap $? 150 'AdminBulkGetUsersPlatform' test.out

#- 151 AdminInviteUserV3
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddresses": ["NpQ4bato", "a0BBcDCc", "c21WmyU4"], "isAdmin": false, "namespace": "7lWp6NPD", "roles": ["p30BHYrK", "HWC30OX4", "ZtC3Iqj3"]}' \
    > test.out 2>&1
eval_tap $? 151 'AdminInviteUserV3' test.out

#- 152 AdminQueryThirdPlatformLinkHistoryV3
./ng net.accelbyte.sdk.cli.Main iam adminQueryThirdPlatformLinkHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '76' \
    --offset '89' \
    --platformUserId '2B3fmFyI' \
    --platformId 'zXycFkeI' \
    > test.out 2>&1
eval_tap $? 152 'AdminQueryThirdPlatformLinkHistoryV3' test.out

#- 153 AdminListUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminListUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '65' \
    --offset '81' \
    > test.out 2>&1
eval_tap $? 153 'AdminListUsersV3' test.out

#- 154 AdminSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam adminSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by '8RYmOQ2H' \
    --endDate 'cuSwv4It' \
    --limit '3' \
    --offset '76' \
    --platformBy 'g583Y9XV' \
    --platformId '7QxN7jAc' \
    --query 'da1Xyj9u' \
    --startDate 'hEGMgjl0' \
    > test.out 2>&1
eval_tap $? 154 'AdminSearchUserV3' test.out

#- 155 AdminGetBulkUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"listEmailAddressRequest": ["mCEedeJg", "XLmwDEQc", "RIwby16D"]}' \
    > test.out 2>&1
eval_tap $? 155 'AdminGetBulkUserByEmailAddressV3' test.out

#- 156 AdminGetUserByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'UFAPqyoa' \
    > test.out 2>&1
eval_tap $? 156 'AdminGetUserByUserIdV3' test.out

#- 157 AdminUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'fFDuU6zq' \
    --body '{"avatarUrl": "fYrWts94", "country": "O2w0wERE", "dateOfBirth": "3dv65aae", "displayName": "dtU1m2MD", "languageTag": "kdpKTMWS", "userName": "4LCz6LFt"}' \
    > test.out 2>&1
eval_tap $? 157 'AdminUpdateUserV3' test.out

#- 158 AdminGetUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Cebhds4h' \
    --activeOnly  \
    --after 'bp1CXSFo' \
    --before 'q04MFc2G' \
    --limit '41' \
    > test.out 2>&1
eval_tap $? 158 'AdminGetUserBanV3' test.out

#- 159 AdminBanUserV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'gn1thbjW' \
    --body '{"ban": "nj97wuqq", "comment": "MafpKlwP", "endDate": "wYGBOBYK", "reason": "f3gxYSwo", "skipNotif": true}' \
    > test.out 2>&1
eval_tap $? 159 'AdminBanUserV3' test.out

#- 160 AdminUpdateUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserBanV3 \
    --banId 'XITbhOQn' \
    --namespace "$AB_NAMESPACE" \
    --userId 'b0C99Qei' \
    --body '{"enabled": false, "skipNotif": false}' \
    > test.out 2>&1
eval_tap $? 160 'AdminUpdateUserBanV3' test.out

#- 161 AdminSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'P9YGBhnj' \
    --body '{"context": "CBY3YMP0", "emailAddress": "xzgRw9jS", "languageTag": "WwXhrdxI"}' \
    > test.out 2>&1
eval_tap $? 161 'AdminSendVerificationCodeV3' test.out

#- 162 AdminVerifyAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'T02mQhkS' \
    --body '{"Code": "Ld0YXLnA", "ContactType": "rTRwrul4", "LanguageTag": "SGMqtnDh", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 162 'AdminVerifyAccountV3' test.out

#- 163 GetUserVerificationCode
./ng net.accelbyte.sdk.cli.Main iam getUserVerificationCode \
    --namespace "$AB_NAMESPACE" \
    --userId '3detisPc' \
    > test.out 2>&1
eval_tap $? 163 'GetUserVerificationCode' test.out

#- 164 AdminGetUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'SUqMBaBH' \
    > test.out 2>&1
eval_tap $? 164 'AdminGetUserDeletionStatusV3' test.out

#- 165 AdminUpdateUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'weOGT9Di' \
    --body '{"deletionDate": 16, "enabled": false}' \
    > test.out 2>&1
eval_tap $? 165 'AdminUpdateUserDeletionStatusV3' test.out

#- 166 AdminUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'yIpNRBoF' \
    --body '{"code": "PM7FXtgI", "country": "qLiOl4TD", "dateOfBirth": "8avs2zeB", "displayName": "BTARkOEY", "emailAddress": "6XTLELm4", "password": "5kYhUF5A", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 166 'AdminUpgradeHeadlessAccountV3' test.out

#- 167 AdminDeleteUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'CPg2L3Lv' \
    > test.out 2>&1
eval_tap $? 167 'AdminDeleteUserInformationV3' test.out

#- 168 AdminGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'tLpKPJ0z' \
    --after '0.553300571759807' \
    --before '0.3402452472754096' \
    --limit '24' \
    > test.out 2>&1
eval_tap $? 168 'AdminGetUserLoginHistoriesV3' test.out

#- 169 AdminResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam adminResetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'B5VDCtAy' \
    --body '{"languageTag": "fANmK9ci", "newPassword": "Xerr9khD", "oldPassword": "USBHtWfW"}' \
    > test.out 2>&1
eval_tap $? 169 'AdminResetPasswordV3' test.out

#- 170 AdminUpdateUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserPermissionV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZfAbMOgo' \
    --body '{"Permissions": [{"Action": 56, "Resource": "TMiYhnr6", "SchedAction": 57, "SchedCron": "6ZQ48AxY", "SchedRange": ["8i6isICH", "qdp0A0x9", "iIgO0cTf"]}, {"Action": 40, "Resource": "N9nlrhlL", "SchedAction": 70, "SchedCron": "WnxeAxzT", "SchedRange": ["gYZkdGbH", "9OA5G00u", "NwhOhAPt"]}, {"Action": 17, "Resource": "p54QrLlb", "SchedAction": 25, "SchedCron": "I6x5u1Ek", "SchedRange": ["R4NTCPHF", "wBbFV7GM", "hkxTcuEQ"]}]}' \
    > test.out 2>&1
eval_tap $? 170 'AdminUpdateUserPermissionV3' test.out

#- 171 AdminAddUserPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserPermissionsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Jdk4YDF9' \
    --body '{"Permissions": [{"Action": 12, "Resource": "moqxLp6m", "SchedAction": 97, "SchedCron": "HQgwRhbn", "SchedRange": ["gtpjpIDV", "zKzCjIwy", "rgLiErfU"]}, {"Action": 92, "Resource": "DFaofvlp", "SchedAction": 56, "SchedCron": "ZnpasiFi", "SchedRange": ["Tj4Tob9E", "5NhvTBRA", "tYH0Xeaj"]}, {"Action": 32, "Resource": "TrmgpPMm", "SchedAction": 34, "SchedCron": "8V2fV5Fs", "SchedRange": ["5vBTVYT0", "JfeuyyVc", "2r6gLsuX"]}]}' \
    > test.out 2>&1
eval_tap $? 171 'AdminAddUserPermissionsV3' test.out

#- 172 AdminDeleteUserPermissionBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'mpx8L1xM' \
    --body '[{"Action": 39, "Resource": "OD21yjtq"}, {"Action": 38, "Resource": "wmKGBp2L"}, {"Action": 100, "Resource": "wiyu3FjT"}]' \
    > test.out 2>&1
eval_tap $? 172 'AdminDeleteUserPermissionBulkV3' test.out

#- 173 AdminDeleteUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionV3 \
    --action '39' \
    --namespace "$AB_NAMESPACE" \
    --resource 'cbF3sMg2' \
    --userId '09dVKndk' \
    > test.out 2>&1
eval_tap $? 173 'AdminDeleteUserPermissionV3' test.out

#- 174 AdminGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'i2urTcBk' \
    --after 'vwOR5PWp' \
    --before 'pZ3wwA0b' \
    --limit '31' \
    --platformId '4obyCOqm' \
    > test.out 2>&1
eval_tap $? 174 'AdminGetUserPlatformAccountsV3' test.out

#- 175 AdminGetListJusticePlatformAccounts
./ng net.accelbyte.sdk.cli.Main iam adminGetListJusticePlatformAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'yEeBWs3L' \
    > test.out 2>&1
eval_tap $? 175 'AdminGetListJusticePlatformAccounts' test.out

#- 176 AdminGetUserMapping
./ng net.accelbyte.sdk.cli.Main iam adminGetUserMapping \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'MQjySwvW' \
    --userId 'RCxE1WrV' \
    > test.out 2>&1
eval_tap $? 176 'AdminGetUserMapping' test.out

#- 177 AdminCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam adminCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace '6Qrwr4Q7' \
    --userId '8AlndXGc' \
    > test.out 2>&1
eval_tap $? 177 'AdminCreateJusticeUser' test.out

#- 178 AdminLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'cqTfCFr3' \
    --skipConflict  \
    --body '{"platformId": "N9kxCW08", "platformUserId": "L185utwR"}' \
    > test.out 2>&1
eval_tap $? 178 'AdminLinkPlatformAccount' test.out

#- 179 AdminPlatformUnlinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformUnlinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'U7PZzg2a' \
    --userId 'MkxVfE0y' \
    --body '{"platformNamespace": "6ATikaBG"}' \
    > test.out 2>&1
eval_tap $? 179 'AdminPlatformUnlinkV3' test.out

#- 180 AdminPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'M55ckJuS' \
    --userId '5FYX8ifY' \
    --ticket 'K3x5eKSj' \
    > test.out 2>&1
eval_tap $? 180 'AdminPlatformLinkV3' test.out

#- 181 AdminGetThirdPartyPlatformTokenLinkStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetThirdPartyPlatformTokenLinkStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'fzH86e3f' \
    --userId 'WKGrfKFS' \
    --platformToken 'cDOIRWpt' \
    > test.out 2>&1
eval_tap $? 181 'AdminGetThirdPartyPlatformTokenLinkStatusV3' test.out

#- 182 AdminGetUserSinglePlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminGetUserSinglePlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --platformId '3vD33CtG' \
    --userId 'FLHUjRWf' \
    > test.out 2>&1
eval_tap $? 182 'AdminGetUserSinglePlatformAccount' test.out

#- 183 AdminDeleteUserRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRolesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'T2GrBgOo' \
    --body '["nabjVGn7", "VKtF3IW3", "ZW0XGAiY"]' \
    > test.out 2>&1
eval_tap $? 183 'AdminDeleteUserRolesV3' test.out

#- 184 AdminSaveUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminSaveUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ImLOzDCk' \
    --body '[{"namespace": "cshM95wd", "roleId": "Weoun3rE"}, {"namespace": "Wpf1vYhl", "roleId": "vz3s56iH"}, {"namespace": "FIFOKacD", "roleId": "Y8G75Cdw"}]' \
    > test.out 2>&1
eval_tap $? 184 'AdminSaveUserRoleV3' test.out

#- 185 AdminAddUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'jVuNZSug' \
    --userId '0kg0DLmm' \
    > test.out 2>&1
eval_tap $? 185 'AdminAddUserRoleV3' test.out

#- 186 AdminDeleteUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'eqkbSonE' \
    --userId 'B33AFW1c' \
    > test.out 2>&1
eval_tap $? 186 'AdminDeleteUserRoleV3' test.out

#- 187 AdminUpdateUserStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'IWrArHP5' \
    --body '{"enabled": true, "reason": "BT6XDHiQ"}' \
    > test.out 2>&1
eval_tap $? 187 'AdminUpdateUserStatusV3' test.out

#- 188 AdminTrustlyUpdateUserIdentity
./ng net.accelbyte.sdk.cli.Main iam adminTrustlyUpdateUserIdentity \
    --namespace "$AB_NAMESPACE" \
    --userId 'yfUMORny' \
    --body '{"emailAddress": "IWbGMI9C", "password": "9f9xKPfr"}' \
    > test.out 2>&1
eval_tap $? 188 'AdminTrustlyUpdateUserIdentity' test.out

#- 189 AdminVerifyUserWithoutVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyUserWithoutVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '2DDlf4bo' \
    > test.out 2>&1
eval_tap $? 189 'AdminVerifyUserWithoutVerificationCodeV3' test.out

#- 190 AdminUpdateClientSecretV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientSecretV3 \
    --clientId 'PPcp4zvw' \
    --namespace "$AB_NAMESPACE" \
    --body '{"newSecret": "JRnpJYbA"}' \
    > test.out 2>&1
eval_tap $? 190 'AdminUpdateClientSecretV3' test.out

#- 191 AdminGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV3 \
    --after 'q3JKH64F' \
    --before 'qVY0ovI0' \
    --isWildcard  \
    --limit '73' \
    > test.out 2>&1
eval_tap $? 191 'AdminGetRolesV3' test.out

#- 192 AdminCreateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV3 \
    --body '{"adminRole": true, "deletable": true, "isWildcard": false, "managers": [{"displayName": "DSQtdWUr", "namespace": "eKX7DM5Q", "userId": "oHAtRaf5"}, {"displayName": "wb2FfA7i", "namespace": "eufZPpHj", "userId": "ktjq1TJR"}, {"displayName": "vqTnq1VB", "namespace": "66H2F8KC", "userId": "6YhMfX3q"}], "members": [{"displayName": "iJjmYP7e", "namespace": "XbbFfl6p", "userId": "VHzBZ0VU"}, {"displayName": "oLvtiUPW", "namespace": "DJtohKu5", "userId": "200Cjlid"}, {"displayName": "8Cdi0iBp", "namespace": "UrJnWd9p", "userId": "faoymmeL"}], "permissions": [{"action": 93, "resource": "jKWdzq8j", "schedAction": 17, "schedCron": "WAs6I0Xz", "schedRange": ["7p5HhkMZ", "PYSlUE4S", "JgLpsRyF"]}, {"action": 41, "resource": "G65NG5vx", "schedAction": 83, "schedCron": "1GcdLyey", "schedRange": ["nxmOts94", "1C9Fq2jJ", "WNPTSudW"]}, {"action": 15, "resource": "BN4HyCae", "schedAction": 56, "schedCron": "JC6qxp5s", "schedRange": ["7QkuWv01", "NsoEADhR", "pJrN0bLO"]}], "roleName": "sdFpFcNe"}' \
    > test.out 2>&1
eval_tap $? 192 'AdminCreateRoleV3' test.out

#- 193 AdminGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV3 \
    --roleId 'eyMo5akk' \
    > test.out 2>&1
eval_tap $? 193 'AdminGetRoleV3' test.out

#- 194 AdminDeleteRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV3 \
    --roleId 'Q6ZBR20I' \
    > test.out 2>&1
eval_tap $? 194 'AdminDeleteRoleV3' test.out

#- 195 AdminUpdateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV3 \
    --roleId 'nHeC4pwa' \
    --body '{"deletable": false, "isWildcard": true, "roleName": "EWMLCu0Z"}' \
    > test.out 2>&1
eval_tap $? 195 'AdminUpdateRoleV3' test.out

#- 196 AdminGetRoleAdminStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleAdminStatusV3 \
    --roleId '594YbVln' \
    > test.out 2>&1
eval_tap $? 196 'AdminGetRoleAdminStatusV3' test.out

#- 197 AdminUpdateAdminRoleStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateAdminRoleStatusV3 \
    --roleId 'nPXjxIKK' \
    > test.out 2>&1
eval_tap $? 197 'AdminUpdateAdminRoleStatusV3' test.out

#- 198 AdminRemoveRoleAdminV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleAdminV3 \
    --roleId 'bPysrQHE' \
    > test.out 2>&1
eval_tap $? 198 'AdminRemoveRoleAdminV3' test.out

#- 199 AdminGetRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleManagersV3 \
    --roleId 'z9JdWix1' \
    --after 'HXdd8EtN' \
    --before 'qkLMTEOc' \
    --limit '26' \
    > test.out 2>&1
eval_tap $? 199 'AdminGetRoleManagersV3' test.out

#- 200 AdminAddRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleManagersV3 \
    --roleId 'Y5EZGyOa' \
    --body '{"managers": [{"displayName": "E4NWOlIF", "namespace": "XO0yvZN2", "userId": "XKgNTAl8"}, {"displayName": "WrVVFBsi", "namespace": "tDwGWofg", "userId": "cY10ndtd"}, {"displayName": "vAqbnBrM", "namespace": "c5TmT4zg", "userId": "UiFkxUAK"}]}' \
    > test.out 2>&1
eval_tap $? 200 'AdminAddRoleManagersV3' test.out

#- 201 AdminRemoveRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleManagersV3 \
    --roleId 'Ok0shy6R' \
    --body '{"managers": [{"displayName": "L0TwAgEB", "namespace": "Wyqb8g65", "userId": "go5NTtnn"}, {"displayName": "dUph3OEp", "namespace": "DFBjM1Lz", "userId": "hgv4aXyi"}, {"displayName": "1liT2KLl", "namespace": "2jnzo1Q8", "userId": "ZlyK1teW"}]}' \
    > test.out 2>&1
eval_tap $? 201 'AdminRemoveRoleManagersV3' test.out

#- 202 AdminGetRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleMembersV3 \
    --roleId '9bBhmVcx' \
    --after 'Q4Il2MFK' \
    --before 'WrUrYD90' \
    --limit '12' \
    > test.out 2>&1
eval_tap $? 202 'AdminGetRoleMembersV3' test.out

#- 203 AdminAddRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleMembersV3 \
    --roleId 'g5PIlA8W' \
    --body '{"members": [{"displayName": "lPISpGtp", "namespace": "pFPTMfg2", "userId": "drquGEl3"}, {"displayName": "eeaSf5UQ", "namespace": "NvFw4Yp2", "userId": "HseDbCM5"}, {"displayName": "6cBq9Ib2", "namespace": "gGeI82UX", "userId": "KVVM1Zfa"}]}' \
    > test.out 2>&1
eval_tap $? 203 'AdminAddRoleMembersV3' test.out

#- 204 AdminRemoveRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleMembersV3 \
    --roleId 'iUCyRjkR' \
    --body '{"members": [{"displayName": "tiWvDLcP", "namespace": "xYeb2vGW", "userId": "NV6cZdye"}, {"displayName": "BDfZCR8N", "namespace": "2OezqAPz", "userId": "DE3IJ8Ht"}, {"displayName": "S3OjGJBr", "namespace": "epN7XADY", "userId": "IeCphqox"}]}' \
    > test.out 2>&1
eval_tap $? 204 'AdminRemoveRoleMembersV3' test.out

#- 205 AdminUpdateRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV3 \
    --roleId 'QeH4Xaj5' \
    --body '{"permissions": [{"action": 77, "resource": "gpieIs4n", "schedAction": 27, "schedCron": "PAYPaVbu", "schedRange": ["4kCFdQHM", "p9zNWx7X", "Ty6UElt7"]}, {"action": 45, "resource": "UMQubxoB", "schedAction": 61, "schedCron": "DZzUrpAn", "schedRange": ["pKlSux8T", "hr9d9Bx6", "PU3tYiKD"]}, {"action": 25, "resource": "I6cvDeOy", "schedAction": 70, "schedCron": "rcM3wai8", "schedRange": ["t1UkRE0n", "cCDEjgDw", "RQxaEo09"]}]}' \
    > test.out 2>&1
eval_tap $? 205 'AdminUpdateRolePermissionsV3' test.out

#- 206 AdminAddRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV3 \
    --roleId 'U6I9MdGm' \
    --body '{"permissions": [{"action": 95, "resource": "RT3U1Z72", "schedAction": 65, "schedCron": "DRwJ78tR", "schedRange": ["nR2WIQ2p", "Q7xV9bDw", "pD6WYulw"]}, {"action": 32, "resource": "AECA65b3", "schedAction": 37, "schedCron": "3PsWw8N5", "schedRange": ["UTLgdP6H", "4COiEpKw", "C9S0KEL1"]}, {"action": 69, "resource": "mLVliYMR", "schedAction": 29, "schedCron": "9SxQG9KM", "schedRange": ["z42M41tP", "BDE3Anek", "JzWmJc2n"]}]}' \
    > test.out 2>&1
eval_tap $? 206 'AdminAddRolePermissionsV3' test.out

#- 207 AdminDeleteRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV3 \
    --roleId 'phNiWvD0' \
    --body '["zIfOVnYQ", "EXoqUz7s", "WO9mjJbJ"]' \
    > test.out 2>&1
eval_tap $? 207 'AdminDeleteRolePermissionsV3' test.out

#- 208 AdminDeleteRolePermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionV3 \
    --action '23' \
    --resource 'QZ7ha9UY' \
    --roleId 'U3FglZmL' \
    > test.out 2>&1
eval_tap $? 208 'AdminDeleteRolePermissionV3' test.out

#- 209 AdminGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam adminGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 209 'AdminGetMyUserV3' test.out

#- 210 UserAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam userAuthenticationV3 \
    --clientId 'qmU50d3Z' \
    --extendExp  \
    --redirectUri '7fb2UG0g' \
    --password 'JnkCkzIw' \
    --requestId 'X9nCubwR' \
    --userName 'TXNGGHk8' \
    > test.out 2>&1
eval_tap $? 210 'UserAuthenticationV3' test.out

#- 211 AuthenticationWithPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV3 \
    --extendExp  \
    --clientId 't005B9z9' \
    --linkingToken 'GyMPI7FI' \
    --password 'dXKlzuRW' \
    --username 'oLwts4EJ' \
    > test.out 2>&1
eval_tap $? 211 'AuthenticationWithPlatformLinkV3' test.out

#- 212 GenerateTokenByNewHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV3 \
    --additionalData 'nOXll4Pi' \
    --extendExp  \
    --linkingToken 'XiuBMoS2' \
    > test.out 2>&1
eval_tap $? 212 'GenerateTokenByNewHeadlessAccountV3' test.out

#- 213 RequestOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam requestOneTimeLinkingCodeV3 \
    --platformId '1NXJ56ZF' \
    > test.out 2>&1
eval_tap $? 213 'RequestOneTimeLinkingCodeV3' test.out

#- 214 ValidateOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam validateOneTimeLinkingCodeV3 \
    --oneTimeLinkCode 'VGHma4gG' \
    > test.out 2>&1
eval_tap $? 214 'ValidateOneTimeLinkingCodeV3' test.out

#- 215 RequestTokenByOneTimeLinkCodeResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTokenByOneTimeLinkCodeResponseV3 \
    --additionalData 'I6SVlGME' \
    --isTransient  \
    --clientId 'AQaHyN0S' \
    --oneTimeLinkCode 'nD3xilQq' \
    > test.out 2>&1
eval_tap $? 215 'RequestTokenByOneTimeLinkCodeResponseV3' test.out

#- 216 GetCountryLocationV3
./ng net.accelbyte.sdk.cli.Main iam getCountryLocationV3 \
    > test.out 2>&1
eval_tap $? 216 'GetCountryLocationV3' test.out

#- 217 Logout
./ng net.accelbyte.sdk.cli.Main iam logout \
    > test.out 2>&1
eval_tap $? 217 'Logout' test.out

#- 218 RequestGameTokenCodeResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestGameTokenCodeResponseV3 \
    --namespace "$AB_NAMESPACE" \
    --clientId '2ex1m2yC' \
    > test.out 2>&1
eval_tap $? 218 'RequestGameTokenCodeResponseV3' test.out

#- 219 AdminRetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam adminRetrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'KW5Y53J4' \
    --userId 'TnQ6supl' \
    > test.out 2>&1
eval_tap $? 219 'AdminRetrieveUserThirdPartyPlatformTokenV3' test.out

#- 220 RevokeUserV3
./ng net.accelbyte.sdk.cli.Main iam revokeUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'UpDhdi34' \
    --includeGameNamespace  \
    > test.out 2>&1
eval_tap $? 220 'RevokeUserV3' test.out

#- 221 AuthorizeV3
./ng net.accelbyte.sdk.cli.Main iam authorizeV3 \
    --codeChallenge 'cUWmRMKC' \
    --codeChallengeMethod 'S256' \
    --createHeadless  \
    --oneTimeLinkCode 'Hal2gR8P' \
    --redirectUri 'HB9DRvk5' \
    --scope 'kQAqXeVX' \
    --state 'lSTHN66F' \
    --targetAuthPage 'qLrarkih' \
    --useRedirectUriAsLoginUrlWhenLocked  \
    --clientId 'QWQOawHU' \
    --responseType 'code' \
    > test.out 2>&1
eval_tap $? 221 'AuthorizeV3' test.out

#- 222 TokenIntrospectionV3
./ng net.accelbyte.sdk.cli.Main iam tokenIntrospectionV3 \
    --token 'HoiatDpZ' \
    > test.out 2>&1
eval_tap $? 222 'TokenIntrospectionV3' test.out

#- 223 GetJWKSV3
./ng net.accelbyte.sdk.cli.Main iam getJWKSV3 \
    > test.out 2>&1
eval_tap $? 223 'GetJWKSV3' test.out

#- 224 SendMFAAuthenticationCode
./ng net.accelbyte.sdk.cli.Main iam sendMFAAuthenticationCode \
    --clientId 'EFvkvPXZ' \
    --factor '7kQKjRE2' \
    --mfaToken 'IRDXDhck' \
    > test.out 2>&1
eval_tap $? 224 'SendMFAAuthenticationCode' test.out

#- 225 Change2faMethod
./ng net.accelbyte.sdk.cli.Main iam change2faMethod \
    --factor 'tQiojMEX' \
    --mfaToken 'jptmM9EY' \
    > test.out 2>&1
eval_tap $? 225 'Change2faMethod' test.out

#- 226 Verify2faCode
./ng net.accelbyte.sdk.cli.Main iam verify2faCode \
    --code 'lrG92jwl' \
    --factor 'e7VnBr5Z' \
    --mfaToken '9j77BMjY' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 226 'Verify2faCode' test.out

#- 227 RetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam retrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'GZufYRuk' \
    --userId 'b2PiXvXf' \
    > test.out 2>&1
eval_tap $? 227 'RetrieveUserThirdPartyPlatformTokenV3' test.out

#- 228 AuthCodeRequestV3
./ng net.accelbyte.sdk.cli.Main iam authCodeRequestV3 \
    --platformId '3rxXseaC' \
    --clientId 'WBamipM2' \
    --redirectUri '4HYjNpFv' \
    --requestId 'lOnWNXB3' \
    > test.out 2>&1
eval_tap $? 228 'AuthCodeRequestV3' test.out

#- 229 PlatformTokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV3 \
    --platformId 'EzAcL9rN' \
    --additionalData 'SBmaRTGc' \
    --clientId 'JAd9k8Nk' \
    --createHeadless  \
    --deviceId 'bzLRMs8n' \
    --macAddress 'BTL51UCR' \
    --platformToken 'nLwKltMm' \
    --skipSetCookie  \
    > test.out 2>&1
eval_tap $? 229 'PlatformTokenGrantV3' test.out

#- 230 GetRevocationListV3
./ng net.accelbyte.sdk.cli.Main iam getRevocationListV3 \
    > test.out 2>&1
eval_tap $? 230 'GetRevocationListV3' test.out

#- 231 TokenRevocationV3
./ng net.accelbyte.sdk.cli.Main iam tokenRevocationV3 \
    --token 'FEjmTk4j' \
    > test.out 2>&1
eval_tap $? 231 'TokenRevocationV3' test.out

#- 232 TokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV3 \
    --additionalData 'TP96Up4U' \
    --clientId 'uzHIY4bf' \
    --code '6hqgBUsh' \
    --codeVerifier 'G0YzWO8U' \
    --extendExp  \
    --password 'V6oKoAcd' \
    --redirectUri 'Ih7DU6xK' \
    --refreshToken 'gP0nUown' \
    --username 'YQ98GHqu' \
    --grantType 'client_credentials' \
    > test.out 2>&1
eval_tap $? 232 'TokenGrantV3' test.out

#- 233 VerifyTokenV3
./ng net.accelbyte.sdk.cli.Main iam verifyTokenV3 \
    --token 'Oncj0Gss' \
    > test.out 2>&1
eval_tap $? 233 'VerifyTokenV3' test.out

#- 234 PlatformAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticationV3 \
    --platformId 'L38i4VPl' \
    --code 'twM9TsIS' \
    --error 'wx6g5d3X' \
    --openidAssocHandle 'RoMIXIs8' \
    --openidClaimedId 'HkJTvOAM' \
    --openidIdentity 'OCZStfrE' \
    --openidMode 'G5uWyaiL' \
    --openidNs '9w5hkqsf' \
    --openidOpEndpoint '553U8i92' \
    --openidResponseNonce 'xjJShvEm' \
    --openidReturnTo 'r9Abw6ww' \
    --openidSig 'eCEktHjO' \
    --openidSigned 'mXsu4V5t' \
    --state '3uWv0CDd' \
    > test.out 2>&1
eval_tap $? 234 'PlatformAuthenticationV3' test.out

#- 235 PlatformTokenRefreshV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenRefreshV3 \
    --platformId 'nrF2BepJ' \
    --platformToken 'dkddxM3J' \
    > test.out 2>&1
eval_tap $? 235 'PlatformTokenRefreshV3' test.out

#- 236 PublicGetInputValidations
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidations \
    --defaultOnEmpty  \
    --languageCode '58fmPL24' \
    > test.out 2>&1
eval_tap $? 236 'PublicGetInputValidations' test.out

#- 237 PublicGetInputValidationByField
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidationByField \
    --field 'L64Hi1kj' \
    > test.out 2>&1
eval_tap $? 237 'PublicGetInputValidationByField' test.out

#- 238 PublicGetCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam publicGetCountryAgeRestrictionV3 \
    --countryCode 'KdJYgxlW' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 238 'PublicGetCountryAgeRestrictionV3' test.out

#- 239 PublicGetCountryListV3
./ng net.accelbyte.sdk.cli.Main iam publicGetCountryListV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 239 'PublicGetCountryListV3' test.out

#- 240 RetrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3
./ng net.accelbyte.sdk.cli.Main iam retrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 240 'RetrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3' test.out

#- 241 RetrieveActiveOIDCClientsPublicV3
./ng net.accelbyte.sdk.cli.Main iam retrieveActiveOIDCClientsPublicV3 \
    --namespace "$AB_NAMESPACE" \
    --clientId 'FfeN8wPh' \
    > test.out 2>&1
eval_tap $? 241 'RetrieveActiveOIDCClientsPublicV3' test.out

#- 242 PublicListUserIDByPlatformUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserIDByPlatformUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'cAhnRMu1' \
    --rawPID  \
    --body '{"platformUserIds": ["zokIar4h", "mllyEd7X", "sipcbWA8"]}' \
    > test.out 2>&1
eval_tap $? 242 'PublicListUserIDByPlatformUserIDsV3' test.out

#- 243 PublicGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'b8frxlqH' \
    --platformUserId 'olXetiU1' \
    > test.out 2>&1
eval_tap $? 243 'PublicGetUserByPlatformUserIDV3' test.out

#- 244 PublicGetAsyncStatus
./ng net.accelbyte.sdk.cli.Main iam publicGetAsyncStatus \
    --namespace "$AB_NAMESPACE" \
    --requestId 'Z3yVz5Xe' \
    > test.out 2>&1
eval_tap $? 244 'PublicGetAsyncStatus' test.out

#- 245 PublicSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam publicSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'MSsiuxGd' \
    --limit '29' \
    --offset '48' \
    --query 'A0E90uQF' \
    > test.out 2>&1
eval_tap $? 245 'PublicSearchUserV3' test.out

#- 246 PublicCreateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "Lo8ILXEK", "acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "8Ru4qgHB", "policyId": "J0RFmQn8", "policyVersionId": "lq25EUaA"}, {"isAccepted": false, "localizedPolicyVersionId": "IvvXjNUw", "policyId": "AiCg0APS", "policyVersionId": "XhoDKvs8"}, {"isAccepted": true, "localizedPolicyVersionId": "CkMFLktF", "policyId": "v0hwC2NH", "policyVersionId": "ytGeEC0S"}], "authType": "9Q29VPXj", "code": "T8aF21RQ", "country": "G5Ii1X6H", "dateOfBirth": "99RD9Qtb", "displayName": "rrF9398d", "emailAddress": "OwfZtDaV", "password": "AoeOsoyG", "reachMinimumAge": false}' \
    > test.out 2>&1
eval_tap $? 246 'PublicCreateUserV3' test.out

#- 247 CheckUserAvailability
./ng net.accelbyte.sdk.cli.Main iam checkUserAvailability \
    --namespace "$AB_NAMESPACE" \
    --field 'yfaPyNL1' \
    --query 'vqmUfsFb' \
    > test.out 2>&1
eval_tap $? 247 'CheckUserAvailability' test.out

#- 248 PublicBulkGetUsers
./ng net.accelbyte.sdk.cli.Main iam publicBulkGetUsers \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["CaI4uuDe", "PlRKByHm", "z1wvpddg"]}' \
    > test.out 2>&1
eval_tap $? 248 'PublicBulkGetUsers' test.out

#- 249 PublicSendRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicSendRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "6sIcPm3y", "languageTag": "QwF3qkXq"}' \
    > test.out 2>&1
eval_tap $? 249 'PublicSendRegistrationCode' test.out

#- 250 PublicVerifyRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicVerifyRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "C0rHQPOZ", "emailAddress": "971YuKlp"}' \
    > test.out 2>&1
eval_tap $? 250 'PublicVerifyRegistrationCode' test.out

#- 251 PublicForgotPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicForgotPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "A7GcC42b", "languageTag": "BtkvvWHh"}' \
    > test.out 2>&1
eval_tap $? 251 'PublicForgotPasswordV3' test.out

#- 252 GetAdminInvitationV3
./ng net.accelbyte.sdk.cli.Main iam getAdminInvitationV3 \
    --invitationId '2OqSsPzJ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 252 'GetAdminInvitationV3' test.out

#- 253 CreateUserFromInvitationV3
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV3 \
    --invitationId 'rocziQZC' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "SLTYBrQl", "policyId": "Jpn0SS1C", "policyVersionId": "0HdhMTn2"}, {"isAccepted": true, "localizedPolicyVersionId": "Vuac4tBs", "policyId": "lCGaFCKd", "policyVersionId": "AkwCVY6H"}, {"isAccepted": true, "localizedPolicyVersionId": "7ZndmH3I", "policyId": "wzUlzuzB", "policyVersionId": "e3PCjpRa"}], "authType": "EMAILPASSWD", "country": "f8NV0K13", "dateOfBirth": "F0lynAN8", "displayName": "s6cT7N37", "password": "rr0UhuQw", "reachMinimumAge": false}' \
    > test.out 2>&1
eval_tap $? 253 'CreateUserFromInvitationV3' test.out

#- 254 UpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam updateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "6REUJGK2", "country": "nYyfBV9u", "dateOfBirth": "0ykM1RKx", "displayName": "jRfIJaOy", "languageTag": "EUpSRpJd", "userName": "WET1WUpL"}' \
    > test.out 2>&1
eval_tap $? 254 'UpdateUserV3' test.out

#- 255 PublicPartialUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicPartialUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "31B95YyQ", "country": "YF2B998l", "dateOfBirth": "SMfh1mru", "displayName": "4wfG46uA", "languageTag": "6ziC9YOz", "userName": "YsGVmCCX"}' \
    > test.out 2>&1
eval_tap $? 255 'PublicPartialUpdateUserV3' test.out

#- 256 PublicSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"context": "CMJ3bZhz", "emailAddress": "SnYMTaqR", "languageTag": "cnV4xDjt"}' \
    > test.out 2>&1
eval_tap $? 256 'PublicSendVerificationCodeV3' test.out

#- 257 PublicUserVerificationV3
./ng net.accelbyte.sdk.cli.Main iam publicUserVerificationV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "E7uFioFn", "contactType": "L0f6U8TS", "languageTag": "7fHE82N4", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 257 'PublicUserVerificationV3' test.out

#- 258 PublicUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "8YQjvK4S", "country": "54p8gSbu", "dateOfBirth": "p4PXp6KP", "displayName": "hv1k6DLt", "emailAddress": "OSs8I68j", "password": "Vm2RNJFa", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 258 'PublicUpgradeHeadlessAccountV3' test.out

#- 259 PublicVerifyHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --needVerificationCode  \
    --body '{"emailAddress": "6q4kuxUa", "password": "6eWzvsAi"}' \
    > test.out 2>&1
eval_tap $? 259 'PublicVerifyHeadlessAccountV3' test.out

#- 260 PublicUpdatePasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicUpdatePasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"languageTag": "9iHKV8Xr", "newPassword": "DPYlywuQ", "oldPassword": "prWxaKuL"}' \
    > test.out 2>&1
eval_tap $? 260 'PublicUpdatePasswordV3' test.out

#- 261 PublicCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam publicCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'fofUyzuo' \
    > test.out 2>&1
eval_tap $? 261 'PublicCreateJusticeUser' test.out

#- 262 PublicPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'TYbYg9yq' \
    --redirectUri 'Whp2iwkT' \
    --ticket 'PeLyKkI5' \
    > test.out 2>&1
eval_tap $? 262 'PublicPlatformLinkV3' test.out

#- 263 PublicPlatformUnlinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'MEuJ2kRW' \
    --body '{"platformNamespace": "zKbdKje3"}' \
    > test.out 2>&1
eval_tap $? 263 'PublicPlatformUnlinkV3' test.out

#- 264 PublicPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'YJOM4oNx' \
    > test.out 2>&1
eval_tap $? 264 'PublicPlatformUnlinkAllV3' test.out

#- 265 PublicForcePlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicForcePlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'lLcbJO4J' \
    --ticket 'DDTDKDi8' \
    > test.out 2>&1
eval_tap $? 265 'PublicForcePlatformLinkV3' test.out

#- 266 PublicWebLinkPlatform
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatform \
    --namespace "$AB_NAMESPACE" \
    --platformId 'p2gflfnE' \
    --clientId 'hsGsYuUO' \
    --redirectUri 'Qx4iNAKk' \
    > test.out 2>&1
eval_tap $? 266 'PublicWebLinkPlatform' test.out

#- 267 PublicWebLinkPlatformEstablish
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatformEstablish \
    --namespace "$AB_NAMESPACE" \
    --platformId 'VThgPltS' \
    --code '8VbC8EmC' \
    --state 'Z9tjJDbH' \
    > test.out 2>&1
eval_tap $? 267 'PublicWebLinkPlatformEstablish' test.out

#- 268 PublicProcessWebLinkPlatformV3
./ng net.accelbyte.sdk.cli.Main iam publicProcessWebLinkPlatformV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '4w6IlnsW' \
    --code 'EMDC4Fdc' \
    --state 'AdxEB0Fw' \
    > test.out 2>&1
eval_tap $? 268 'PublicProcessWebLinkPlatformV3' test.out

#- 269 ResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam resetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "0P4MJmMa", "emailAddress": "hCW87KVz", "newPassword": "GUgG1JjQ"}' \
    > test.out 2>&1
eval_tap $? 269 'ResetPasswordV3' test.out

#- 270 PublicGetUserByUserIdV3
eval_tap 0 270 'PublicGetUserByUserIdV3 # SKIP deprecated' test.out

#- 271 PublicGetUserBanHistoryV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserBanHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '9pnXLy3O' \
    --activeOnly  \
    --after 'cYmfwxVb' \
    --before 'mvx1f6gl' \
    --limit '61' \
    > test.out 2>&1
eval_tap $? 271 'PublicGetUserBanHistoryV3' test.out

#- 272 PublicListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '1z0ng5i9' \
    > test.out 2>&1
eval_tap $? 272 'PublicListUserAllPlatformAccountsDistinctV3' test.out

#- 273 PublicGetUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Rb1Wdc4h' \
    > test.out 2>&1
eval_tap $? 273 'PublicGetUserInformationV3' test.out

#- 274 PublicGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '5PHHEsrn' \
    --after '0.7961666000363542' \
    --before '0.2450263243214036' \
    --limit '49' \
    > test.out 2>&1
eval_tap $? 274 'PublicGetUserLoginHistoriesV3' test.out

#- 275 PublicGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'dEnEj5l2' \
    --after '4vljAph3' \
    --before 'BfkAiwUz' \
    --limit '59' \
    --platformId 'WBUca834' \
    > test.out 2>&1
eval_tap $? 275 'PublicGetUserPlatformAccountsV3' test.out

#- 276 PublicListJusticePlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicListJusticePlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZptRWuDw' \
    > test.out 2>&1
eval_tap $? 276 'PublicListJusticePlatformAccountsV3' test.out

#- 277 PublicLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam publicLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'LV9mwj3G' \
    --body '{"platformId": "fu3FY0JO", "platformUserId": "rIOiQ2b6"}' \
    > test.out 2>&1
eval_tap $? 277 'PublicLinkPlatformAccount' test.out

#- 278 PublicForceLinkPlatformWithProgression
./ng net.accelbyte.sdk.cli.Main iam publicForceLinkPlatformWithProgression \
    --namespace "$AB_NAMESPACE" \
    --userId '0NspnJlz' \
    --body '{"chosenNamespaces": ["DwphiIyV", "0U4TCAV0", "ujShNULL"], "requestId": "2Zji9w4H"}' \
    > test.out 2>&1
eval_tap $? 278 'PublicForceLinkPlatformWithProgression' test.out

#- 279 PublicGetPublisherUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetPublisherUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '78o0Js4F' \
    > test.out 2>&1
eval_tap $? 279 'PublicGetPublisherUserV3' test.out

#- 280 PublicValidateUserByUserIDAndPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserByUserIDAndPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'SD0f2Bf9' \
    --password '4BgtILeD' \
    > test.out 2>&1
eval_tap $? 280 'PublicValidateUserByUserIDAndPasswordV3' test.out

#- 281 PublicGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRolesV3 \
    --after 'yXRuLeUk' \
    --before 'fnFR7n40' \
    --isWildcard  \
    --limit '77' \
    > test.out 2>&1
eval_tap $? 281 'PublicGetRolesV3' test.out

#- 282 PublicGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRoleV3 \
    --roleId 'ndVyGREX' \
    > test.out 2>&1
eval_tap $? 282 'PublicGetRoleV3' test.out

#- 283 PublicGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 283 'PublicGetMyUserV3' test.out

#- 284 PublicGetLinkHeadlessAccountToMyAccountConflictV3
./ng net.accelbyte.sdk.cli.Main iam publicGetLinkHeadlessAccountToMyAccountConflictV3 \
    --oneTimeLinkCode '4NcjZxjU' \
    > test.out 2>&1
eval_tap $? 284 'PublicGetLinkHeadlessAccountToMyAccountConflictV3' test.out

#- 285 LinkHeadlessAccountToMyAccountV3
./ng net.accelbyte.sdk.cli.Main iam linkHeadlessAccountToMyAccountV3 \
    --body '{"chosenNamespaces": ["PLPwDfud", "DBeioPfH", "xTHcLbLq"], "oneTimeLinkCode": "0xKJ3ZMI"}' \
    > test.out 2>&1
eval_tap $? 285 'LinkHeadlessAccountToMyAccountV3' test.out

#- 286 PublicSendVerificationLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationLinkV3 \
    --body '{"languageTag": "tkk5xNsm"}' \
    > test.out 2>&1
eval_tap $? 286 'PublicSendVerificationLinkV3' test.out

#- 287 PublicVerifyUserByLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyUserByLinkV3 \
    --code 'AxVvpw2F' \
    > test.out 2>&1
eval_tap $? 287 'PublicVerifyUserByLinkV3' test.out

#- 288 PlatformAuthenticateSAMLV3Handler
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticateSAMLV3Handler \
    --platformId 'M207vezt' \
    --code 'jhM13p5h' \
    --error 'HfRmuZdI' \
    --state 'sLL0ljHc' \
    > test.out 2>&1
eval_tap $? 288 'PlatformAuthenticateSAMLV3Handler' test.out

#- 289 LoginSSOClient
./ng net.accelbyte.sdk.cli.Main iam loginSSOClient \
    --platformId 'JH0i1iIh' \
    --payload 'MCEIp4IU' \
    > test.out 2>&1
eval_tap $? 289 'LoginSSOClient' test.out

#- 290 LogoutSSOClient
./ng net.accelbyte.sdk.cli.Main iam logoutSSOClient \
    --platformId 'rSdRD3n9' \
    > test.out 2>&1
eval_tap $? 290 'LogoutSSOClient' test.out

#- 291 RequestGameTokenResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestGameTokenResponseV3 \
    --additionalData 'imj5v5nG' \
    --code 'OK2ovHmN' \
    > test.out 2>&1
eval_tap $? 291 'RequestGameTokenResponseV3' test.out

#- 292 PlatformTokenRefreshV3Deprecate
eval_tap 0 292 'PlatformTokenRefreshV3Deprecate # SKIP deprecated' test.out

#- 293 AdminGetDevicesByUserV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDevicesByUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Uj5sRjNu' \
    > test.out 2>&1
eval_tap $? 293 'AdminGetDevicesByUserV4' test.out

#- 294 AdminGetBannedDevicesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedDevicesV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceType '3DeIRhjZ' \
    --endDate 'NbYfedn4' \
    --limit '86' \
    --offset '39' \
    --startDate '8T10VYBw' \
    > test.out 2>&1
eval_tap $? 294 'AdminGetBannedDevicesV4' test.out

#- 295 AdminGetUserDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeviceBansV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Xlh48uS4' \
    > test.out 2>&1
eval_tap $? 295 'AdminGetUserDeviceBansV4' test.out

#- 296 AdminBanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminBanDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"comment": "HuDYHuKE", "deviceId": "yreSxIhV", "deviceType": "e5hGPXxI", "enabled": false, "endDate": "AvcHazXD", "ext": {"DiQFPV1V": {}, "UAnrreeF": {}, "ZwGAqL4K": {}}, "reason": "udV70Z5j"}' \
    > test.out 2>&1
eval_tap $? 296 'AdminBanDeviceV4' test.out

#- 297 AdminGetDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBanV4 \
    --banId 'rVJfW3of' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 297 'AdminGetDeviceBanV4' test.out

#- 298 AdminUpdateDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateDeviceBanV4 \
    --banId 'etrBOJNc' \
    --namespace "$AB_NAMESPACE" \
    --body '{"enabled": false}' \
    > test.out 2>&1
eval_tap $? 298 'AdminUpdateDeviceBanV4' test.out

#- 299 AdminGenerateReportV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateReportV4 \
    --namespace "$AB_NAMESPACE" \
    --endDate 'he7hJmFm' \
    --startDate 'wuI6I6tt' \
    --deviceType 'kkGKlwvZ' \
    > test.out 2>&1
eval_tap $? 299 'AdminGenerateReportV4' test.out

#- 300 AdminGetDeviceTypesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceTypesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 300 'AdminGetDeviceTypesV4' test.out

#- 301 AdminGetDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBansV4 \
    --deviceId '1RXeb4Zx' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 301 'AdminGetDeviceBansV4' test.out

#- 302 AdminDecryptDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminDecryptDeviceV4 \
    --deviceId '7vEKmbz8' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 302 'AdminDecryptDeviceV4' test.out

#- 303 AdminUnbanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminUnbanDeviceV4 \
    --deviceId 'TL9PgfOz' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 303 'AdminUnbanDeviceV4' test.out

#- 304 AdminGetUsersByDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUsersByDeviceV4 \
    --deviceId 'g4XfOMLi' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 304 'AdminGetUsersByDeviceV4' test.out

#- 305 AdminCreateTestUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateTestUsersV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 98}' \
    > test.out 2>&1
eval_tap $? 305 'AdminCreateTestUsersV4' test.out

#- 306 AdminBulkCheckValidUserIDV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkCheckValidUserIDV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["YPbNWWeW", "20WDBZUC", "lhhIy0qd"]}' \
    > test.out 2>&1
eval_tap $? 306 'AdminBulkCheckValidUserIDV4' test.out

#- 307 AdminUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'GcwVm9Eo' \
    --body '{"avatarUrl": "YrBuWo8t", "country": "jEAoqvAq", "dateOfBirth": "L58LgEWV", "displayName": "ICF0fbVa", "languageTag": "WZkhAof0", "userName": "CORPMbGG"}' \
    > test.out 2>&1
eval_tap $? 307 'AdminUpdateUserV4' test.out

#- 308 AdminUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '7oW95c2q' \
    --body '{"code": "0yiHng6U", "emailAddress": "OVtk3qTU"}' \
    > test.out 2>&1
eval_tap $? 308 'AdminUpdateUserEmailAddressV4' test.out

#- 309 AdminDisableUserMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableUserMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'xwur0bQK' \
    > test.out 2>&1
eval_tap $? 309 'AdminDisableUserMFAV4' test.out

#- 310 AdminListUserRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminListUserRolesV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'aLwNPxhs' \
    > test.out 2>&1
eval_tap $? 310 'AdminListUserRolesV4' test.out

#- 311 AdminUpdateUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'fdGCLiDq' \
    --body '{"assignedNamespaces": ["RupRW4Yi", "dNfjlfcY", "zaVGv2sI"], "roleId": "HLWrZJqo"}' \
    > test.out 2>&1
eval_tap $? 311 'AdminUpdateUserRoleV4' test.out

#- 312 AdminAddUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'DJpT06Qk' \
    --body '{"assignedNamespaces": ["J5SySY7F", "Lik62YYa", "A1nRomvA"], "roleId": "Vs5G8QK4"}' \
    > test.out 2>&1
eval_tap $? 312 'AdminAddUserRoleV4' test.out

#- 313 AdminRemoveUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRemoveUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'xqxgQLCY' \
    --body '{"assignedNamespaces": ["c5D3LEFJ", "tgAubBbu", "XVJAXWo3"], "roleId": "xFIHKAHW"}' \
    > test.out 2>&1
eval_tap $? 313 'AdminRemoveUserRoleV4' test.out

#- 314 AdminGetRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV4 \
    --adminRole  \
    --isWildcard  \
    --limit '53' \
    --offset '58' \
    > test.out 2>&1
eval_tap $? 314 'AdminGetRolesV4' test.out

#- 315 AdminCreateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV4 \
    --body '{"adminRole": true, "deletable": true, "isWildcard": false, "roleName": "5udTitxH"}' \
    > test.out 2>&1
eval_tap $? 315 'AdminCreateRoleV4' test.out

#- 316 AdminGetRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV4 \
    --roleId 'XhgjQgjO' \
    > test.out 2>&1
eval_tap $? 316 'AdminGetRoleV4' test.out

#- 317 AdminDeleteRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV4 \
    --roleId 'gbovk1Is' \
    > test.out 2>&1
eval_tap $? 317 'AdminDeleteRoleV4' test.out

#- 318 AdminUpdateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV4 \
    --roleId 'AmpmOang' \
    --body '{"adminRole": true, "deletable": true, "isWildcard": false, "roleName": "iCrH4GWN"}' \
    > test.out 2>&1
eval_tap $? 318 'AdminUpdateRoleV4' test.out

#- 319 AdminUpdateRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV4 \
    --roleId 'RE3boOhD' \
    --body '{"permissions": [{"action": 39, "resource": "t3HM17xF", "schedAction": 28, "schedCron": "Sgz6zXoG", "schedRange": ["IZBwJlJY", "mXGQp7Hu", "8lzrE2aZ"]}, {"action": 65, "resource": "6dYyQ5zG", "schedAction": 73, "schedCron": "RsGg7QQP", "schedRange": ["7ITTEHKD", "z5qRJflc", "piccPyLE"]}, {"action": 21, "resource": "miAo1dmP", "schedAction": 42, "schedCron": "LE5tjrWA", "schedRange": ["occ98WRU", "JAUGr4fy", "KBCVq0EH"]}]}' \
    > test.out 2>&1
eval_tap $? 319 'AdminUpdateRolePermissionsV4' test.out

#- 320 AdminAddRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV4 \
    --roleId 'abHHOE2Z' \
    --body '{"permissions": [{"action": 6, "resource": "Puy6FOn7", "schedAction": 99, "schedCron": "rPXobxGf", "schedRange": ["1KxGAiQl", "8tmdI1yp", "aJy7NU6r"]}, {"action": 15, "resource": "fzeP5JYU", "schedAction": 41, "schedCron": "Vjn19sKE", "schedRange": ["rOKd4Jnh", "EsaIs1u6", "O79O0u0S"]}, {"action": 76, "resource": "tKqroWTc", "schedAction": 46, "schedCron": "7FDJkid4", "schedRange": ["wlMRWkJo", "KzuZciuH", "rvuYDpIm"]}]}' \
    > test.out 2>&1
eval_tap $? 320 'AdminAddRolePermissionsV4' test.out

#- 321 AdminDeleteRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV4 \
    --roleId 'ceeyDp4w' \
    --body '["2OE9T8oG", "5DTEJmJm", "9dKFljNx"]' \
    > test.out 2>&1
eval_tap $? 321 'AdminDeleteRolePermissionsV4' test.out

#- 322 AdminListAssignedUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminListAssignedUsersV4 \
    --roleId 'TnjEVIat' \
    --after 'E5uITtph' \
    --before 'AFRjq40D' \
    --limit '32' \
    > test.out 2>&1
eval_tap $? 322 'AdminListAssignedUsersV4' test.out

#- 323 AdminAssignUserToRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAssignUserToRoleV4 \
    --roleId 'IKKQJtuY' \
    --body '{"assignedNamespaces": ["W0woP3BO", "T9jUezH4", "LEFYib09"], "namespace": "Yx1EFHi4", "userId": "3cA9HmgJ"}' \
    > test.out 2>&1
eval_tap $? 323 'AdminAssignUserToRoleV4' test.out

#- 324 AdminRevokeUserFromRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRevokeUserFromRoleV4 \
    --roleId 'BrGYgepK' \
    --body '{"namespace": "k8vmU2EC", "userId": "fVEG1jeu"}' \
    > test.out 2>&1
eval_tap $? 324 'AdminRevokeUserFromRoleV4' test.out

#- 325 AdminInviteUserNewV4
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserNewV4 \
    --body '{"assignedNamespaces": ["K4G5VTOz", "AXssMzBB", "4qXtquJn"], "emailAddresses": ["IN8PpOx2", "f3Tkghwy", "NwTqe2jM"], "isAdmin": false, "namespace": "jcG6wtBW", "roleId": "BdtBVPGq"}' \
    > test.out 2>&1
eval_tap $? 325 'AdminInviteUserNewV4' test.out

#- 326 AdminUpdateMyUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateMyUserV4 \
    --body '{"avatarUrl": "RGYbfa3I", "country": "W8G0hRmR", "dateOfBirth": "4JIOFy2G", "displayName": "13KenuN2", "languageTag": "jwv2oHjb", "userName": "lMZOevT7"}' \
    > test.out 2>&1
eval_tap $? 326 'AdminUpdateMyUserV4' test.out

#- 327 AdminDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyAuthenticatorV4 \
    > test.out 2>&1
eval_tap $? 327 'AdminDisableMyAuthenticatorV4' test.out

#- 328 AdminEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyAuthenticatorV4 \
    --code 'Kala3sW6' \
    > test.out 2>&1
eval_tap $? 328 'AdminEnableMyAuthenticatorV4' test.out

#- 329 AdminGenerateMyAuthenticatorKeyV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateMyAuthenticatorKeyV4 \
    > test.out 2>&1
eval_tap $? 329 'AdminGenerateMyAuthenticatorKeyV4' test.out

#- 330 AdminGetMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 330 'AdminGetMyBackupCodesV4' test.out

#- 331 AdminGenerateMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 331 'AdminGenerateMyBackupCodesV4' test.out

#- 332 AdminDisableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 332 'AdminDisableMyBackupCodesV4' test.out

#- 333 AdminDownloadMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminDownloadMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 333 'AdminDownloadMyBackupCodesV4' test.out

#- 334 AdminEnableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 334 'AdminEnableMyBackupCodesV4' test.out

#- 335 AdminSendMyMFAEmailCodeV4
./ng net.accelbyte.sdk.cli.Main iam adminSendMyMFAEmailCodeV4 \
    > test.out 2>&1
eval_tap $? 335 'AdminSendMyMFAEmailCodeV4' test.out

#- 336 AdminDisableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyEmailV4 \
    > test.out 2>&1
eval_tap $? 336 'AdminDisableMyEmailV4' test.out

#- 337 AdminEnableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyEmailV4 \
    --code 'xc2APBLu' \
    > test.out 2>&1
eval_tap $? 337 'AdminEnableMyEmailV4' test.out

#- 338 AdminGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyEnabledFactorsV4 \
    > test.out 2>&1
eval_tap $? 338 'AdminGetMyEnabledFactorsV4' test.out

#- 339 AdminMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam adminMakeFactorMyDefaultV4 \
    --factor 'RZDnd8CA' \
    > test.out 2>&1
eval_tap $? 339 'AdminMakeFactorMyDefaultV4' test.out

#- 340 AdminInviteUserV4
eval_tap 0 340 'AdminInviteUserV4 # SKIP deprecated' test.out

#- 341 PublicCreateTestUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateTestUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "VhlxOuUs", "policyId": "OKL060aQ", "policyVersionId": "ERMrbxrI"}, {"isAccepted": false, "localizedPolicyVersionId": "9NEVXToE", "policyId": "uEQ2z6JU", "policyVersionId": "yZrnv182"}, {"isAccepted": true, "localizedPolicyVersionId": "tIuP5eKB", "policyId": "L5tARI6g", "policyVersionId": "oeK57KUu"}], "authType": "EMAILPASSWD", "country": "aAGgiUld", "dateOfBirth": "AYNlhqWi", "displayName": "02OFYfO9", "emailAddress": "CVb9YC2n", "password": "iAD9EQ6d", "passwordMD5Sum": "bf0bVpcS", "username": "ol7xyPgM", "verified": false}' \
    > test.out 2>&1
eval_tap $? 341 'PublicCreateTestUserV4' test.out

#- 342 PublicCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "AziZhBIb", "policyId": "Q4gEKS4y", "policyVersionId": "kDVSOhdp"}, {"isAccepted": false, "localizedPolicyVersionId": "PEZV50cW", "policyId": "yZUwAVN9", "policyVersionId": "JvafCw9N"}, {"isAccepted": false, "localizedPolicyVersionId": "ijSwP9Sf", "policyId": "MfC7HiUM", "policyVersionId": "YkOAPXAR"}], "authType": "EMAILPASSWD", "code": "adSw0zMH", "country": "ygtcAnBw", "dateOfBirth": "CqfbVucB", "displayName": "5RYQgnOI", "emailAddress": "afOOUXFf", "password": "tS0cf1NK", "passwordMD5Sum": "xLheedUU", "reachMinimumAge": true, "username": "ytE20x6e"}' \
    > test.out 2>&1
eval_tap $? 342 'PublicCreateUserV4' test.out

#- 343 CreateUserFromInvitationV4
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV4 \
    --invitationId 'CnFGTe3d' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "AfjET2V5", "policyId": "G5q6yQgw", "policyVersionId": "qRgSzAY1"}, {"isAccepted": false, "localizedPolicyVersionId": "OCxQCRSA", "policyId": "xBeGvtJr", "policyVersionId": "NzUVFHGe"}, {"isAccepted": false, "localizedPolicyVersionId": "yZzPFzGW", "policyId": "eKYVsvt7", "policyVersionId": "CKXdXbBE"}], "authType": "EMAILPASSWD", "country": "lcSSKftX", "dateOfBirth": "5wIcCly2", "displayName": "Aegbytb5", "password": "mbp7yMUL", "reachMinimumAge": false, "username": "lIj6ONDN"}' \
    > test.out 2>&1
eval_tap $? 343 'CreateUserFromInvitationV4' test.out

#- 344 PublicUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "WASBUThZ", "country": "AmyxNvEv", "dateOfBirth": "76rRau2B", "displayName": "Dh6JrG4K", "languageTag": "9xqSAlxc", "userName": "939KupP4"}' \
    > test.out 2>&1
eval_tap $? 344 'PublicUpdateUserV4' test.out

#- 345 PublicUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "zzdJvdXE", "emailAddress": "Y48gZUfC"}' \
    > test.out 2>&1
eval_tap $? 345 'PublicUpdateUserEmailAddressV4' test.out

#- 346 PublicUpgradeHeadlessAccountWithVerificationCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountWithVerificationCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "OOeo5kVh", "country": "IxcETOmh", "dateOfBirth": "ZPyfEwdp", "displayName": "rVHHpwkt", "emailAddress": "VErdb2B6", "password": "DZBfaFbV", "reachMinimumAge": false, "username": "yMYxK8Ge", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 346 'PublicUpgradeHeadlessAccountWithVerificationCodeV4' test.out

#- 347 PublicUpgradeHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "duUjXUyn", "password": "K8NqjLFB", "username": "Eepvs0aS"}' \
    > test.out 2>&1
eval_tap $? 347 'PublicUpgradeHeadlessAccountV4' test.out

#- 348 PublicDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 348 'PublicDisableMyAuthenticatorV4' test.out

#- 349 PublicEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'UlwbJWa0' \
    > test.out 2>&1
eval_tap $? 349 'PublicEnableMyAuthenticatorV4' test.out

#- 350 PublicGenerateMyAuthenticatorKeyV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateMyAuthenticatorKeyV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 350 'PublicGenerateMyAuthenticatorKeyV4' test.out

#- 351 PublicGetMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGetMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 351 'PublicGetMyBackupCodesV4' test.out

#- 352 PublicGenerateMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 352 'PublicGenerateMyBackupCodesV4' test.out

#- 353 PublicDisableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 353 'PublicDisableMyBackupCodesV4' test.out

#- 354 PublicDownloadMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicDownloadMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 354 'PublicDownloadMyBackupCodesV4' test.out

#- 355 PublicEnableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 355 'PublicEnableMyBackupCodesV4' test.out

#- 356 PublicRemoveTrustedDeviceV4
./ng net.accelbyte.sdk.cli.Main iam publicRemoveTrustedDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceToken 'Yd4rxxme' \
    > test.out 2>&1
eval_tap $? 356 'PublicRemoveTrustedDeviceV4' test.out

#- 357 PublicSendMyMFAEmailCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicSendMyMFAEmailCodeV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 357 'PublicSendMyMFAEmailCodeV4' test.out

#- 358 PublicDisableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyEmailV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 358 'PublicDisableMyEmailV4' test.out

#- 359 PublicEnableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyEmailV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'URdOpw4g' \
    > test.out 2>&1
eval_tap $? 359 'PublicEnableMyEmailV4' test.out

#- 360 PublicGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam publicGetMyEnabledFactorsV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 360 'PublicGetMyEnabledFactorsV4' test.out

#- 361 PublicMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam publicMakeFactorMyDefaultV4 \
    --namespace "$AB_NAMESPACE" \
    --factor 'AwKibw96' \
    > test.out 2>&1
eval_tap $? 361 'PublicMakeFactorMyDefaultV4' test.out

#- 362 PublicGetUserPublicInfoByUserIdV4
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPublicInfoByUserIdV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'AAPwHprF' \
    > test.out 2>&1
eval_tap $? 362 'PublicGetUserPublicInfoByUserIdV4' test.out

#- 363 PublicInviteUserV4
./ng net.accelbyte.sdk.cli.Main iam publicInviteUserV4 \
    --body '{"emailAddress": "kjOOkQbX", "namespace": "SpM8RbP9", "namespaceDisplayName": "zQShiuUM"}' \
    > test.out 2>&1
eval_tap $? 363 'PublicInviteUserV4' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
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
echo "1..368"

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
    --body '[{"field": "Y5zLJvj0", "validation": {"allowAllSpecialCharacters": true, "allowDigit": false, "allowLetter": false, "allowSpace": false, "allowUnicode": true, "avatarConfig": {"allowedPrefixes": ["sLREuKhE", "okXgL9M2", "UKtDCruS"], "preferRegex": true, "regex": "xxHzyNUg"}, "blockedWord": ["cQ2FiSLG", "7YhcS8Se", "rmtearK6"], "description": [{"language": "BHwIcHqD", "message": ["CuYJqkNP", "w7MpqwWC", "3Y6DfMzR"]}, {"language": "onuCoNuv", "message": ["Z2eMJiip", "qdHchECv", "EdXUfbTJ"]}, {"language": "OB98BhJn", "message": ["zMgKOAjD", "roOXzATp", "rhs9uvdh"]}], "isCustomRegex": true, "letterCase": "tvvKmoBU", "maxLength": 17, "maxRepeatingAlphaNum": 77, "maxRepeatingSpecialCharacter": 13, "minCharType": 29, "minLength": 57, "regex": "5dLzlxr1", "specialCharacterLocation": "bxbZ3atE", "specialCharacters": ["YHHVp05E", "1U7fBZgC", "vIZSHriN"]}}, {"field": "dgi0rJRi", "validation": {"allowAllSpecialCharacters": true, "allowDigit": false, "allowLetter": true, "allowSpace": false, "allowUnicode": true, "avatarConfig": {"allowedPrefixes": ["5e6MXMMU", "MTQ5N7XP", "PziZmGoj"], "preferRegex": true, "regex": "CErhClGO"}, "blockedWord": ["ZLRPH8V0", "FLbAquwM", "wGyCWjzP"], "description": [{"language": "MLwG0cDZ", "message": ["P6hUGraR", "gaxw13jl", "CHs52UsA"]}, {"language": "CfqEtP6j", "message": ["ED04QQNc", "R9hUIHpR", "9ktkO0Cq"]}, {"language": "tbO0Sxuc", "message": ["hNMyD8P9", "lrY760eI", "MHk75kjk"]}], "isCustomRegex": true, "letterCase": "OIfGk5HA", "maxLength": 87, "maxRepeatingAlphaNum": 65, "maxRepeatingSpecialCharacter": 44, "minCharType": 100, "minLength": 91, "regex": "ILAYlqOs", "specialCharacterLocation": "cScJOKdN", "specialCharacters": ["TOaxP2zh", "DyifUCol", "GFUY650r"]}}, {"field": "jJFPGI4Z", "validation": {"allowAllSpecialCharacters": true, "allowDigit": true, "allowLetter": true, "allowSpace": false, "allowUnicode": true, "avatarConfig": {"allowedPrefixes": ["WSgTRjl3", "3inex9EL", "n4HqvNic"], "preferRegex": true, "regex": "wIIin7TN"}, "blockedWord": ["kIXgDkyR", "9AUG9CUu", "CsOr1gMR"], "description": [{"language": "yj3Xprfv", "message": ["uKk29Alt", "JLFohss3", "v2X9CxMe"]}, {"language": "Uztv9DnS", "message": ["aEAa6Amb", "WRk8g9wN", "rve5TLjP"]}, {"language": "R6ZVDVlb", "message": ["pGlukzNc", "eddgyCBK", "WohPas9g"]}], "isCustomRegex": false, "letterCase": "9P03OZZ7", "maxLength": 5, "maxRepeatingAlphaNum": 75, "maxRepeatingSpecialCharacter": 2, "minCharType": 78, "minLength": 86, "regex": "v80oY0hW", "specialCharacterLocation": "p2YeUg7T", "specialCharacters": ["Uwt599xL", "cjSjsI3F", "pbNcrqZw"]}}]' \
    > test.out 2>&1
eval_tap $? 109 'AdminUpdateInputValidations' test.out

#- 110 AdminResetInputValidations
./ng net.accelbyte.sdk.cli.Main iam adminResetInputValidations \
    --field 'lyVROkAt' \
    > test.out 2>&1
eval_tap $? 110 'AdminResetInputValidations' test.out

#- 111 ListAdminsV3
./ng net.accelbyte.sdk.cli.Main iam listAdminsV3 \
    --namespace "$AB_NAMESPACE" \
    --after 'EMYPzqFe' \
    --before '8QaMheyS' \
    --limit '0' \
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
    --body '{"ageRestriction": 77, "enable": true}' \
    > test.out 2>&1
eval_tap $? 113 'AdminUpdateAgeRestrictionConfigV3' test.out

#- 114 AdminGetListCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminGetListCountryAgeRestrictionV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 114 'AdminGetListCountryAgeRestrictionV3' test.out

#- 115 AdminUpdateCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateCountryAgeRestrictionV3 \
    --countryCode '9W7zIE0O' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ageRestriction": 55}' \
    > test.out 2>&1
eval_tap $? 115 'AdminUpdateCountryAgeRestrictionV3' test.out

#- 116 AdminGetBannedUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType 'MQ1ixS2Z' \
    --limit '6' \
    --offset '97' \
    > test.out 2>&1
eval_tap $? 116 'AdminGetBannedUsersV3' test.out

#- 117 AdminBanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"ban": "L0lxQpet", "comment": "7vbxPmD4", "endDate": "Dq41z4i0", "reason": "zALK5WXi", "skipNotif": false, "userIds": ["hDd5MHJd", "u4ItZG65", "uMcZ66mY"]}' \
    > test.out 2>&1
eval_tap $? 117 'AdminBanUserBulkV3' test.out

#- 118 AdminUnbanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminUnbanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"bans": [{"banId": "m3sWS9xj", "userId": "s8uce11U"}, {"banId": "zJOZUakj", "userId": "B5UCDgmR"}, {"banId": "dT7v5w1o", "userId": "Gt4K4y5v"}]}' \
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
    --clientId '65CoKue0' \
    --clientName 'P8iXtSKe' \
    --clientType '4IYcY9qa' \
    --limit '45' \
    --offset '94' \
    > test.out 2>&1
eval_tap $? 120 'AdminGetClientsByNamespaceV3' test.out

#- 121 AdminCreateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateClientV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["EafqSaSW", "WdBr7XS6", "kKBEDwnu"], "baseUri": "cAp3djaZ", "clientId": "Jq9ZiOXy", "clientName": "I2CtquWt", "clientPermissions": [{"action": 41, "resource": "aCGvwRuP", "schedAction": 13, "schedCron": "rdH50Z2w", "schedRange": ["EnUVb8Dp", "HXvjnPx7", "SFTikppK"]}, {"action": 0, "resource": "QSIrN4ka", "schedAction": 98, "schedCron": "jYm9PbxS", "schedRange": ["NoWcFjve", "x01zpIwV", "0TGKKd8l"]}, {"action": 99, "resource": "TwtngFyp", "schedAction": 33, "schedCron": "B2HI0fBL", "schedRange": ["YOxEaJMc", "DZMtdB1Q", "J0aMbHzN"]}], "clientPlatform": "s36Ae80T", "deletable": true, "description": "lUW33y6f", "namespace": "rH41GsGx", "oauthAccessTokenExpiration": 47, "oauthAccessTokenExpirationTimeUnit": "leV33jb9", "oauthClientType": "FD6CUk4U", "oauthRefreshTokenExpiration": 83, "oauthRefreshTokenExpirationTimeUnit": "prsHCxHa", "parentNamespace": "yd4ByMdA", "redirectUri": "xD7rrORY", "scopes": ["Rafd4fud", "hLtpP3No", "JbfvOH8i"], "secret": "2nhK2Ukl", "twoFactorEnabled": true}' \
    > test.out 2>&1
eval_tap $? 121 'AdminCreateClientV3' test.out

#- 122 AdminGetClientsbyNamespacebyIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetClientsbyNamespacebyIDV3 \
    --clientId 'EhsCKdcD' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 122 'AdminGetClientsbyNamespacebyIDV3' test.out

#- 123 AdminDeleteClientV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientV3 \
    --clientId 'vorpg9xD' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 123 'AdminDeleteClientV3' test.out

#- 124 AdminUpdateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientV3 \
    --clientId 'x5xdXbcT' \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["cNSSbp2q", "o844tUHx", "obNhfhGn"], "baseUri": "YwUXLC6R", "clientName": "zZtSxNjv", "clientPermissions": [{"action": 53, "resource": "GzmByU2V", "schedAction": 70, "schedCron": "KXvudIHx", "schedRange": ["0KRAkXZc", "rfHTjebH", "R3pK6PXs"]}, {"action": 98, "resource": "LgyQNMF6", "schedAction": 6, "schedCron": "h7yBWm5d", "schedRange": ["XyRnPK5p", "e8o9FHww", "2pNE7v8T"]}, {"action": 31, "resource": "jl0JoTFy", "schedAction": 6, "schedCron": "a3XsMq07", "schedRange": ["dYQlS830", "htQBiG1j", "dFJl5odq"]}], "clientPlatform": "WFqXp10R", "deletable": true, "description": "PDTd0FSr", "namespace": "qyXB5m1w", "oauthAccessTokenExpiration": 25, "oauthAccessTokenExpirationTimeUnit": "qQuGpwO0", "oauthRefreshTokenExpiration": 58, "oauthRefreshTokenExpirationTimeUnit": "ilJWgbqV", "redirectUri": "Juz6JKiZ", "scopes": ["zBtjOYfY", "blirvVKN", "tqOnjZ9h"], "twoFactorEnabled": false}' \
    > test.out 2>&1
eval_tap $? 124 'AdminUpdateClientV3' test.out

#- 125 AdminUpdateClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientPermissionV3 \
    --clientId 'u9ioKtdg' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 59, "resource": "AWFOjLsA"}, {"action": 2, "resource": "8Q73Cd5L"}, {"action": 40, "resource": "yIJEdDsT"}]}' \
    > test.out 2>&1
eval_tap $? 125 'AdminUpdateClientPermissionV3' test.out

#- 126 AdminAddClientPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddClientPermissionsV3 \
    --clientId 'pvHBfuRR' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 3, "resource": "174HtpcI"}, {"action": 15, "resource": "sBplUChO"}, {"action": 99, "resource": "DpgMY6wp"}]}' \
    > test.out 2>&1
eval_tap $? 126 'AdminAddClientPermissionsV3' test.out

#- 127 AdminDeleteClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientPermissionV3 \
    --action '28' \
    --clientId 'qKqRdMGq' \
    --namespace "$AB_NAMESPACE" \
    --resource 'PjVi6UG6' \
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
    --body '{"blacklist": ["fxjB7a6j", "yiyHIKja", "KfQN6OXM"]}' \
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
    --limit '8' \
    --offset '64' \
    > test.out 2>&1
eval_tap $? 133 'RetrieveAllSSOLoginPlatformCredentialV3' test.out

#- 134 RetrieveThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'yoL0CBXB' \
    > test.out 2>&1
eval_tap $? 134 'RetrieveThirdPartyLoginPlatformCredentialV3' test.out

#- 135 AddThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam addThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Wl9A9krl' \
    --body '{"ACSURL": "jXQCT643", "AWSCognitoRegion": "U3Sl5I5S", "AWSCognitoUserPool": "dgtzM3UM", "AllowedClients": ["4qdD8Jgs", "fKmc0vkV", "cU0PEhNx"], "AppId": "A5ycQ2Wp", "AuthorizationEndpoint": "8uQhIz2X", "ClientId": "fdtlWYYZ", "Environment": "v0VvHWnJ", "FederationMetadataURL": "GaCIbXTM", "GenericOauthFlow": true, "IsActive": false, "Issuer": "N4NgDCpG", "JWKSEndpoint": "CHOc7lxQ", "KeyID": "vxTaSETT", "NetflixCertificates": {"encryptedPrivateKey": "wbFG1y4Q", "encryptedPrivateKeyName": "F4rNuxE0", "publicCertificate": "uyFyhzju", "publicCertificateName": "lsAf8mo1", "rootCertificate": "nVrXQgH9", "rootCertificateName": "oIPwlfaO"}, "OrganizationId": "tdt5xVNP", "PlatformName": "ImpgNZxU", "RedirectUri": "IGta6OFS", "RegisteredDomains": [{"affectedClientIDs": ["MEkctYsb", "OY16zufv", "OAO3bARL"], "domain": "vrhI7Hnv", "namespaces": ["Bkv82LLG", "hIGhO0a6", "aQXtF1QM"], "roleId": "Cbv2SsQZ"}, {"affectedClientIDs": ["cPWFJeFw", "eUZ0F1i1", "avYmLjGr"], "domain": "mqZtk5zE", "namespaces": ["nUbQBO0L", "jl2DIMNd", "jfH84zsv"], "roleId": "PcGJImQt"}, {"affectedClientIDs": ["p4WIFB8X", "m0ZqVfIW", "gxHPqPSD"], "domain": "wDnS5PO0", "namespaces": ["6BjXYv1a", "DlzF5TuR", "CJ8b9HaR"], "roleId": "St2fQKbY"}], "Secret": "2tXTaYUC", "TeamID": "fbtnN3NG", "TokenAuthenticationType": "iYX8xFuO", "TokenClaimsMapping": {"F5m25qhk": "uVGVmbPD", "rT0VYLqA": "QX8VukJr", "DRXEX6zr": "7HCNeuMt"}, "TokenEndpoint": "bi6ipugt", "UserInfoEndpoint": "iF18UNso", "UserInfoHTTPMethod": "z45Z8GZz", "scopes": ["NgnxonSJ", "q4ZQBvs2", "Xnqlkbsx"]}' \
    > test.out 2>&1
eval_tap $? 135 'AddThirdPartyLoginPlatformCredentialV3' test.out

#- 136 DeleteThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'lTmvfNiE' \
    > test.out 2>&1
eval_tap $? 136 'DeleteThirdPartyLoginPlatformCredentialV3' test.out

#- 137 UpdateThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'vUDYCYeE' \
    --body '{"ACSURL": "YG7CwqP4", "AWSCognitoRegion": "pnBgqxEb", "AWSCognitoUserPool": "tSY2wi7u", "AllowedClients": ["V4IWqGvg", "eYZTA9zw", "Ayvh1SEv"], "AppId": "shHYzPoq", "AuthorizationEndpoint": "DENL63eY", "ClientId": "O3hYROux", "Environment": "Qb1lbT3z", "FederationMetadataURL": "HY2smbmT", "GenericOauthFlow": false, "IsActive": false, "Issuer": "Q75mM741", "JWKSEndpoint": "NFQk0GLA", "KeyID": "4uUgVJ1n", "NetflixCertificates": {"encryptedPrivateKey": "PoTLuWBe", "encryptedPrivateKeyName": "EDiEamj3", "publicCertificate": "ePdkT2EH", "publicCertificateName": "HiPkfsDo", "rootCertificate": "arQcDiQR", "rootCertificateName": "L4FwOuoH"}, "OrganizationId": "iwHl6WGc", "PlatformName": "M4lllYlI", "RedirectUri": "FYm8Kcun", "RegisteredDomains": [{"affectedClientIDs": ["Ilm5bQSx", "VlYyCQZ5", "LJXsllte"], "domain": "Df0QTAmB", "namespaces": ["d6tiuEY5", "FUIavU9c", "TEtFSWzg"], "roleId": "UZmQ46bF"}, {"affectedClientIDs": ["e5PY2mVE", "CB6n4tz6", "k7B2XqGc"], "domain": "bHz4L8m8", "namespaces": ["s2pj64TL", "M4uy7SqK", "w6OC61eh"], "roleId": "B3YWkJwN"}, {"affectedClientIDs": ["l4rRKioU", "PVd4ASPb", "xXwxU5Dt"], "domain": "ai2QYt2b", "namespaces": ["Ffyy2xmY", "pQXjSqwh", "v7a30JBu"], "roleId": "OG8Sr0zB"}], "Secret": "5oKN07uU", "TeamID": "nJesxukH", "TokenAuthenticationType": "wiHtc9h2", "TokenClaimsMapping": {"BmgjuwmT": "kt7nY5HA", "jxlTBZLt": "YMddAdiU", "6vBR3zvH": "LexRDrE2"}, "TokenEndpoint": "ZXoRt61f", "UserInfoEndpoint": "rjZN14I8", "UserInfoHTTPMethod": "m8DnMdUT", "scopes": ["DlWjerCx", "WkvwmUFh", "2jIYIRju"]}' \
    > test.out 2>&1
eval_tap $? 137 'UpdateThirdPartyLoginPlatformCredentialV3' test.out

#- 138 UpdateThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'gdgQ6gLv' \
    --body '{"affectedClientIDs": ["I1CYAhjb", "HDJ2tDSj", "w2qSjHF1"], "assignedNamespaces": ["njCxC845", "6g6NUOAE", "epzKzeJV"], "domain": "i6xGWMX9", "roleId": "G78WexCZ"}' \
    > test.out 2>&1
eval_tap $? 138 'UpdateThirdPartyLoginPlatformDomainV3' test.out

#- 139 DeleteThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'tS6EhHqJ' \
    --body '{"domain": "8DF5UeqY"}' \
    > test.out 2>&1
eval_tap $? 139 'DeleteThirdPartyLoginPlatformDomainV3' test.out

#- 140 RetrieveSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam retrieveSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId '74rtOraR' \
    > test.out 2>&1
eval_tap $? 140 'RetrieveSSOLoginPlatformCredential' test.out

#- 141 AddSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam addSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'vyYabRok' \
    --body '{"acsUrl": "Ok0NIg8s", "apiKey": "W0OtW1b2", "appId": "rDmGq2FO", "federationMetadataUrl": "eK4umn9w", "isActive": false, "redirectUri": "AmrM6RPp", "secret": "utV4k5QB", "ssoUrl": "s4h4CdUe"}' \
    > test.out 2>&1
eval_tap $? 141 'AddSSOLoginPlatformCredential' test.out

#- 142 DeleteSSOLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteSSOLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'nJIj5t4F' \
    > test.out 2>&1
eval_tap $? 142 'DeleteSSOLoginPlatformCredentialV3' test.out

#- 143 UpdateSSOPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam updateSSOPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'xMZm7kdZ' \
    --body '{"acsUrl": "n3Q3aWEy", "apiKey": "f7g7Un5V", "appId": "7Mq4Ee7V", "federationMetadataUrl": "oJEBtEE1", "isActive": true, "redirectUri": "n4UBotib", "secret": "h9ofyWwA", "ssoUrl": "LGewdSpi"}' \
    > test.out 2>&1
eval_tap $? 143 'UpdateSSOPlatformCredential' test.out

#- 144 AdminListUserIDByPlatformUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByPlatformUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'm7CLLUXR' \
    --rawPID  \
    --body '{"platformUserIds": ["NfmqBDXW", "6pnvaJeV", "d5HE3e8S"]}' \
    > test.out 2>&1
eval_tap $? 144 'AdminListUserIDByPlatformUserIDsV3' test.out

#- 145 AdminGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'RZ6xGTZL' \
    --platformUserId 'gobB1bXN' \
    > test.out 2>&1
eval_tap $? 145 'AdminGetUserByPlatformUserIDV3' test.out

#- 146 GetAdminUsersByRoleIdV3
./ng net.accelbyte.sdk.cli.Main iam getAdminUsersByRoleIdV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'TgvROlMi' \
    --after '76' \
    --before '38' \
    --limit '66' \
    > test.out 2>&1
eval_tap $? 146 'GetAdminUsersByRoleIdV3' test.out

#- 147 AdminGetUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --emailAddress 'yQ70Snr8' \
    > test.out 2>&1
eval_tap $? 147 'AdminGetUserByEmailAddressV3' test.out

#- 148 AdminGetBulkUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType 'TpMXM6nJ' \
    --body '{"bulkUserId": ["SoAj8QWE", "VYVrFgFf", "QFfrlmhi"]}' \
    > test.out 2>&1
eval_tap $? 148 'AdminGetBulkUserBanV3' test.out

#- 149 AdminListUserIDByUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["HOguLzpp", "mMd7rTUQ", "uUaSYauj"]}' \
    > test.out 2>&1
eval_tap $? 149 'AdminListUserIDByUserIDsV3' test.out

#- 150 AdminBulkGetUsersPlatform
./ng net.accelbyte.sdk.cli.Main iam adminBulkGetUsersPlatform \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["r7X9UTCz", "txO18Lg3", "Zxfn0nzD"]}' \
    > test.out 2>&1
eval_tap $? 150 'AdminBulkGetUsersPlatform' test.out

#- 151 AdminInviteUserV3
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddresses": ["peqmvWGv", "644hbaEz", "SPHxDi0b"], "isAdmin": false, "namespace": "Cj9gura3", "roles": ["NH2s0zae", "L5ggWqTl", "dUmvfTYU"]}' \
    > test.out 2>&1
eval_tap $? 151 'AdminInviteUserV3' test.out

#- 152 AdminQueryThirdPlatformLinkHistoryV3
./ng net.accelbyte.sdk.cli.Main iam adminQueryThirdPlatformLinkHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '15' \
    --offset '36' \
    --platformUserId 'aqmpWp9T' \
    --platformId 'Fpdc22kb' \
    > test.out 2>&1
eval_tap $? 152 'AdminQueryThirdPlatformLinkHistoryV3' test.out

#- 153 AdminListUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminListUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '17' \
    --offset '74' \
    > test.out 2>&1
eval_tap $? 153 'AdminListUsersV3' test.out

#- 154 AdminSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam adminSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by '4qiPRLoS' \
    --endDate 'T7MNxfAx' \
    --includeTotal  \
    --limit '66' \
    --offset '8' \
    --platformBy 'ja785UiB' \
    --platformId 'msrjN0li' \
    --query 'B7VC5Wlw' \
    --startDate 'fRXM3nq5' \
    --testAccount  \
    > test.out 2>&1
eval_tap $? 154 'AdminSearchUserV3' test.out

#- 155 AdminGetBulkUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"listEmailAddressRequest": ["4AcY3NHQ", "Szg83VLo", "nUblFW4U"]}' \
    > test.out 2>&1
eval_tap $? 155 'AdminGetBulkUserByEmailAddressV3' test.out

#- 156 AdminGetUserByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'rjAq3zsW' \
    > test.out 2>&1
eval_tap $? 156 'AdminGetUserByUserIdV3' test.out

#- 157 AdminUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'LWKuR1bm' \
    --body '{"avatarUrl": "rZt5LGPJ", "country": "BdFsheL0", "dateOfBirth": "neHtNhEa", "displayName": "yMrg6n0H", "languageTag": "GOYULoEw", "userName": "rsFEblZD"}' \
    > test.out 2>&1
eval_tap $? 157 'AdminUpdateUserV3' test.out

#- 158 AdminGetUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'DAsfxUkm' \
    --activeOnly  \
    --after 'o5o68jl5' \
    --before '3Tm3EI7s' \
    --limit '17' \
    > test.out 2>&1
eval_tap $? 158 'AdminGetUserBanV3' test.out

#- 159 AdminBanUserV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'm4WjVBQa' \
    --body '{"ban": "I1rKr7bt", "comment": "bbk6AGtm", "endDate": "wJFMDbP9", "reason": "4KAOkGGK", "skipNotif": true}' \
    > test.out 2>&1
eval_tap $? 159 'AdminBanUserV3' test.out

#- 160 AdminUpdateUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserBanV3 \
    --banId '2XMpcCdU' \
    --namespace "$AB_NAMESPACE" \
    --userId 'AGcsBQ04' \
    --body '{"enabled": false, "skipNotif": false}' \
    > test.out 2>&1
eval_tap $? 160 'AdminUpdateUserBanV3' test.out

#- 161 AdminSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '6V1bxFHI' \
    --body '{"context": "MN6CbgS0", "emailAddress": "l3tyX1Bg", "languageTag": "KnQPiuDX"}' \
    > test.out 2>&1
eval_tap $? 161 'AdminSendVerificationCodeV3' test.out

#- 162 AdminVerifyAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '9cmwKT0B' \
    --body '{"Code": "3h2FWmD8", "ContactType": "Zl1BFnUY", "LanguageTag": "UD19cW4H", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 162 'AdminVerifyAccountV3' test.out

#- 163 GetUserVerificationCode
./ng net.accelbyte.sdk.cli.Main iam getUserVerificationCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'PbBtsWPu' \
    > test.out 2>&1
eval_tap $? 163 'GetUserVerificationCode' test.out

#- 164 AdminGetUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'tzNp6tmg' \
    > test.out 2>&1
eval_tap $? 164 'AdminGetUserDeletionStatusV3' test.out

#- 165 AdminUpdateUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'K76e0kSx' \
    --body '{"deletionDate": 72, "enabled": true}' \
    > test.out 2>&1
eval_tap $? 165 'AdminUpdateUserDeletionStatusV3' test.out

#- 166 AdminUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'drqWonaa' \
    --body '{"code": "FwkrM3Y4", "country": "9I78q0aE", "dateOfBirth": "7JIzSGyb", "displayName": "idcOziPu", "emailAddress": "wOOQZxO9", "password": "WCL4Nf8H", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 166 'AdminUpgradeHeadlessAccountV3' test.out

#- 167 AdminDeleteUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'mlC1UqIj' \
    > test.out 2>&1
eval_tap $? 167 'AdminDeleteUserInformationV3' test.out

#- 168 AdminGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'mu2N17SP' \
    --after '0.006226695720982001' \
    --before '0.6093468338923893' \
    --limit '56' \
    > test.out 2>&1
eval_tap $? 168 'AdminGetUserLoginHistoriesV3' test.out

#- 169 AdminResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam adminResetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Zm1nH3Da' \
    --body '{"languageTag": "zLuklZJx", "newPassword": "sY2a6bUn", "oldPassword": "ebPOfC9B"}' \
    > test.out 2>&1
eval_tap $? 169 'AdminResetPasswordV3' test.out

#- 170 AdminUpdateUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserPermissionV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Bma2EXfU' \
    --body '{"Permissions": [{"Action": 2, "Resource": "iGFpDpQq", "SchedAction": 69, "SchedCron": "uyLDA2UR", "SchedRange": ["Bo5gVpt9", "xDIpjlBC", "e7YXUH7c"]}, {"Action": 20, "Resource": "H7oPntT2", "SchedAction": 67, "SchedCron": "fuvcl8lr", "SchedRange": ["oF5ZJ4lK", "n9XxVwsS", "epjmzM88"]}, {"Action": 95, "Resource": "vd23dw3v", "SchedAction": 60, "SchedCron": "3XlMrd5b", "SchedRange": ["uSrPGEcM", "RiixZL9r", "lXNconmH"]}]}' \
    > test.out 2>&1
eval_tap $? 170 'AdminUpdateUserPermissionV3' test.out

#- 171 AdminAddUserPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserPermissionsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'gZOHPHTI' \
    --body '{"Permissions": [{"Action": 12, "Resource": "0AedLtNm", "SchedAction": 50, "SchedCron": "VtZ3oxgF", "SchedRange": ["3z3khpuc", "xYKNUhCh", "hI44ROlK"]}, {"Action": 11, "Resource": "RwFaWQhe", "SchedAction": 96, "SchedCron": "n4oXl1RW", "SchedRange": ["pNB8TK8X", "yNz3HMod", "TclxFXIp"]}, {"Action": 59, "Resource": "x7hX36aO", "SchedAction": 92, "SchedCron": "t1Ybrext", "SchedRange": ["E4JEHsNM", "0lXr1bCq", "ehHc1BMg"]}]}' \
    > test.out 2>&1
eval_tap $? 171 'AdminAddUserPermissionsV3' test.out

#- 172 AdminDeleteUserPermissionBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'V3rNojGK' \
    --body '[{"Action": 34, "Resource": "xlyobd2l"}, {"Action": 23, "Resource": "u4PqXPqU"}, {"Action": 72, "Resource": "QDpqu3Ov"}]' \
    > test.out 2>&1
eval_tap $? 172 'AdminDeleteUserPermissionBulkV3' test.out

#- 173 AdminDeleteUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionV3 \
    --action '14' \
    --namespace "$AB_NAMESPACE" \
    --resource 'R9CXFWHy' \
    --userId 'ocg1pWvn' \
    > test.out 2>&1
eval_tap $? 173 'AdminDeleteUserPermissionV3' test.out

#- 174 AdminGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'nk1TzcqD' \
    --after 'kfRtHikA' \
    --before 'rPUqq7o8' \
    --limit '84' \
    --platformId 'Jd5jQ9CU' \
    > test.out 2>&1
eval_tap $? 174 'AdminGetUserPlatformAccountsV3' test.out

#- 175 AdminGetListJusticePlatformAccounts
./ng net.accelbyte.sdk.cli.Main iam adminGetListJusticePlatformAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'pjQytQfd' \
    > test.out 2>&1
eval_tap $? 175 'AdminGetListJusticePlatformAccounts' test.out

#- 176 AdminGetUserMapping
./ng net.accelbyte.sdk.cli.Main iam adminGetUserMapping \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'YaZovqRQ' \
    --userId 'NgnkqCG6' \
    > test.out 2>&1
eval_tap $? 176 'AdminGetUserMapping' test.out

#- 177 AdminCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam adminCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'dWM70h6z' \
    --userId 'EHjv0TTD' \
    > test.out 2>&1
eval_tap $? 177 'AdminCreateJusticeUser' test.out

#- 178 AdminLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'SL5R3SZv' \
    --skipConflict  \
    --body '{"platformId": "5jfK2X9W", "platformUserId": "Zbnbl834"}' \
    > test.out 2>&1
eval_tap $? 178 'AdminLinkPlatformAccount' test.out

#- 179 AdminPlatformUnlinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformUnlinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'QSlvp5zO' \
    --userId 'Mw3HZGuQ' \
    --body '{"platformNamespace": "D6RO84rK"}' \
    > test.out 2>&1
eval_tap $? 179 'AdminPlatformUnlinkV3' test.out

#- 180 AdminPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'uva2Q8bS' \
    --userId 'N1lwckwa' \
    --ticket '7TqOpIm9' \
    > test.out 2>&1
eval_tap $? 180 'AdminPlatformLinkV3' test.out

#- 181 AdminDeleteUserLinkingHistoryByPlatformIDV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserLinkingHistoryByPlatformIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '0uG50tkQ' \
    --userId 'Y1PVouIp' \
    > test.out 2>&1
eval_tap $? 181 'AdminDeleteUserLinkingHistoryByPlatformIDV3' test.out

#- 182 AdminGetThirdPartyPlatformTokenLinkStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetThirdPartyPlatformTokenLinkStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'hLmKxmSV' \
    --userId 'fINuuHCH' \
    --platformToken 'MynHtOVR' \
    > test.out 2>&1
eval_tap $? 182 'AdminGetThirdPartyPlatformTokenLinkStatusV3' test.out

#- 183 AdminGetUserSinglePlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminGetUserSinglePlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --platformId 'k1ustmZv' \
    --userId 'iNFVVXNY' \
    > test.out 2>&1
eval_tap $? 183 'AdminGetUserSinglePlatformAccount' test.out

#- 184 AdminDeleteUserRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRolesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'X2zdfEgA' \
    --body '["9JUs9Yw7", "gy5GaaYf", "Z6beI21U"]' \
    > test.out 2>&1
eval_tap $? 184 'AdminDeleteUserRolesV3' test.out

#- 185 AdminSaveUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminSaveUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'x1w4FFXW' \
    --body '[{"namespace": "5xnXtxHj", "roleId": "2Rwl00GR"}, {"namespace": "toA9XnFl", "roleId": "S5y8qQ8N"}, {"namespace": "pKdi5ATJ", "roleId": "fsO87xFK"}]' \
    > test.out 2>&1
eval_tap $? 185 'AdminSaveUserRoleV3' test.out

#- 186 AdminAddUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'aR1FdRcJ' \
    --userId 'iGO32WQ0' \
    > test.out 2>&1
eval_tap $? 186 'AdminAddUserRoleV3' test.out

#- 187 AdminDeleteUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'CVJzmnXN' \
    --userId 'huiOoloO' \
    > test.out 2>&1
eval_tap $? 187 'AdminDeleteUserRoleV3' test.out

#- 188 AdminUpdateUserStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Hy3B3hWl' \
    --body '{"enabled": true, "reason": "i3WWTOCS"}' \
    > test.out 2>&1
eval_tap $? 188 'AdminUpdateUserStatusV3' test.out

#- 189 AdminTrustlyUpdateUserIdentity
./ng net.accelbyte.sdk.cli.Main iam adminTrustlyUpdateUserIdentity \
    --namespace "$AB_NAMESPACE" \
    --userId 'mMjlyqiF' \
    --body '{"emailAddress": "D5zSfUG7", "password": "YV2vza22"}' \
    > test.out 2>&1
eval_tap $? 189 'AdminTrustlyUpdateUserIdentity' test.out

#- 190 AdminVerifyUserWithoutVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyUserWithoutVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'G3Q212dy' \
    > test.out 2>&1
eval_tap $? 190 'AdminVerifyUserWithoutVerificationCodeV3' test.out

#- 191 AdminUpdateClientSecretV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientSecretV3 \
    --clientId 'RRY8ZSeJ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"newSecret": "Hg7JNKDj"}' \
    > test.out 2>&1
eval_tap $? 191 'AdminUpdateClientSecretV3' test.out

#- 192 AdminGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV3 \
    --after 'PJcVgB44' \
    --before 'MCyZH2ml' \
    --isWildcard  \
    --limit '40' \
    > test.out 2>&1
eval_tap $? 192 'AdminGetRolesV3' test.out

#- 193 AdminCreateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV3 \
    --body '{"adminRole": true, "deletable": true, "isWildcard": false, "managers": [{"displayName": "0WI0ldGt", "namespace": "yzOu9iSe", "userId": "MiObgGbt"}, {"displayName": "NPM7B6kH", "namespace": "KD0lnTj5", "userId": "EypFKjKP"}, {"displayName": "BAYy3sJL", "namespace": "tXyS1pJ4", "userId": "fqpZTWP7"}], "members": [{"displayName": "Z3jqdyEm", "namespace": "LBaKhoYp", "userId": "fZ92tPYt"}, {"displayName": "8nhapkws", "namespace": "xV1FTNpk", "userId": "lwT4FKIv"}, {"displayName": "JPHxXnV1", "namespace": "5ByMFCTG", "userId": "81ZfsW5r"}], "permissions": [{"action": 50, "resource": "j0Lio0SP", "schedAction": 50, "schedCron": "Cw9fKFrv", "schedRange": ["omDfg1Vh", "0EsveNH8", "fWYc25Xw"]}, {"action": 46, "resource": "290uAD2x", "schedAction": 24, "schedCron": "FXRJ3U3S", "schedRange": ["Kr3QXYHE", "wGiJfuRp", "fGKFkomH"]}, {"action": 66, "resource": "NeJl2C4D", "schedAction": 85, "schedCron": "kW54ZRgq", "schedRange": ["aQOkIjE1", "LarOBUIO", "qp8VuRQ6"]}], "roleName": "gLVhj984"}' \
    > test.out 2>&1
eval_tap $? 193 'AdminCreateRoleV3' test.out

#- 194 AdminGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV3 \
    --roleId 'Y6GcRtrS' \
    > test.out 2>&1
eval_tap $? 194 'AdminGetRoleV3' test.out

#- 195 AdminDeleteRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV3 \
    --roleId 'yO299caY' \
    > test.out 2>&1
eval_tap $? 195 'AdminDeleteRoleV3' test.out

#- 196 AdminUpdateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV3 \
    --roleId 'bHGoiaYt' \
    --body '{"deletable": true, "isWildcard": true, "roleName": "SOGqAp5J"}' \
    > test.out 2>&1
eval_tap $? 196 'AdminUpdateRoleV3' test.out

#- 197 AdminGetRoleAdminStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleAdminStatusV3 \
    --roleId 'O4jSNXGW' \
    > test.out 2>&1
eval_tap $? 197 'AdminGetRoleAdminStatusV3' test.out

#- 198 AdminUpdateAdminRoleStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateAdminRoleStatusV3 \
    --roleId 'b1PBw1Bs' \
    > test.out 2>&1
eval_tap $? 198 'AdminUpdateAdminRoleStatusV3' test.out

#- 199 AdminRemoveRoleAdminV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleAdminV3 \
    --roleId 'EOGgIjuf' \
    > test.out 2>&1
eval_tap $? 199 'AdminRemoveRoleAdminV3' test.out

#- 200 AdminGetRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleManagersV3 \
    --roleId '1miXeLXW' \
    --after 'gHdcnsyi' \
    --before 'dEIOtWoI' \
    --limit '6' \
    > test.out 2>&1
eval_tap $? 200 'AdminGetRoleManagersV3' test.out

#- 201 AdminAddRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleManagersV3 \
    --roleId 'zSTkhEaT' \
    --body '{"managers": [{"displayName": "opdCM51t", "namespace": "nkwGZgf6", "userId": "D8FyJ2mu"}, {"displayName": "R9VlulYn", "namespace": "AaAI6OiZ", "userId": "B9JGGsth"}, {"displayName": "zXTZFNnR", "namespace": "DLnMp2Ed", "userId": "GExdCPwn"}]}' \
    > test.out 2>&1
eval_tap $? 201 'AdminAddRoleManagersV3' test.out

#- 202 AdminRemoveRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleManagersV3 \
    --roleId 'mOOSDiH4' \
    --body '{"managers": [{"displayName": "PFu9EEKm", "namespace": "IZItSWAw", "userId": "JryIxhWV"}, {"displayName": "LdquNWzg", "namespace": "6gPwVOCt", "userId": "l9KUaQn0"}, {"displayName": "c6rnITLn", "namespace": "DQMyUbpP", "userId": "mRXOaiag"}]}' \
    > test.out 2>&1
eval_tap $? 202 'AdminRemoveRoleManagersV3' test.out

#- 203 AdminGetRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleMembersV3 \
    --roleId 'AtlPw9oB' \
    --after '113MwCl5' \
    --before 'hMB5yPzB' \
    --limit '39' \
    > test.out 2>&1
eval_tap $? 203 'AdminGetRoleMembersV3' test.out

#- 204 AdminAddRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleMembersV3 \
    --roleId '9ggwFgwX' \
    --body '{"members": [{"displayName": "V52htkNK", "namespace": "V90WQhen", "userId": "r6RG1OwY"}, {"displayName": "S9Pz9sEB", "namespace": "FldZ8oOH", "userId": "tlw3ADwY"}, {"displayName": "2kid8Fmw", "namespace": "F7KFRd7w", "userId": "Fr8jfXmJ"}]}' \
    > test.out 2>&1
eval_tap $? 204 'AdminAddRoleMembersV3' test.out

#- 205 AdminRemoveRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleMembersV3 \
    --roleId '61cb1Wfh' \
    --body '{"members": [{"displayName": "4YWhmfVO", "namespace": "lhisZGO8", "userId": "kMxkir1c"}, {"displayName": "TFpOLS2H", "namespace": "dio8GgbH", "userId": "KOz80Sfn"}, {"displayName": "UgoQsEgw", "namespace": "oBcm6so3", "userId": "uuOWAuzo"}]}' \
    > test.out 2>&1
eval_tap $? 205 'AdminRemoveRoleMembersV3' test.out

#- 206 AdminUpdateRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV3 \
    --roleId 'ev9IojRb' \
    --body '{"permissions": [{"action": 47, "resource": "Ptp86UPT", "schedAction": 65, "schedCron": "HpinJQ9T", "schedRange": ["ovxzuSXa", "y8Wqw9tU", "6FqblucR"]}, {"action": 62, "resource": "a2cgdh54", "schedAction": 33, "schedCron": "MRyAY3v6", "schedRange": ["p9Hz2Nx2", "pXutyIqP", "4210Wyag"]}, {"action": 82, "resource": "M9u8vpWX", "schedAction": 76, "schedCron": "iyIJu5mF", "schedRange": ["2n5fX3XB", "3zIg2Eel", "JBVv954V"]}]}' \
    > test.out 2>&1
eval_tap $? 206 'AdminUpdateRolePermissionsV3' test.out

#- 207 AdminAddRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV3 \
    --roleId 'W7A7vMjM' \
    --body '{"permissions": [{"action": 35, "resource": "P9MuZebf", "schedAction": 61, "schedCron": "jAqDbtsQ", "schedRange": ["k0OZYt8V", "NF70iKes", "qqP7sheS"]}, {"action": 28, "resource": "XHvjFgtt", "schedAction": 91, "schedCron": "LJJGeb2d", "schedRange": ["glfa7tRz", "hYWcrUoy", "fYw1Stld"]}, {"action": 33, "resource": "ijigmNqP", "schedAction": 91, "schedCron": "y8kA3o7i", "schedRange": ["yapsm4ao", "DFhyu0C6", "x1VgrsCQ"]}]}' \
    > test.out 2>&1
eval_tap $? 207 'AdminAddRolePermissionsV3' test.out

#- 208 AdminDeleteRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV3 \
    --roleId 'b5Qwp8iC' \
    --body '["vhqULQF3", "R3aqlFLZ", "2UQXMwjI"]' \
    > test.out 2>&1
eval_tap $? 208 'AdminDeleteRolePermissionsV3' test.out

#- 209 AdminDeleteRolePermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionV3 \
    --action '100' \
    --resource '10WZ7fJR' \
    --roleId 'ESe9HUHD' \
    > test.out 2>&1
eval_tap $? 209 'AdminDeleteRolePermissionV3' test.out

#- 210 AdminGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam adminGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 210 'AdminGetMyUserV3' test.out

#- 211 UserAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam userAuthenticationV3 \
    --clientId '3Bz8bzap' \
    --extendExp  \
    --redirectUri '2rKfKE4u' \
    --password 'lZvFpQbI' \
    --requestId '5N60Dw5i' \
    --userName 'CCFEZFU9' \
    > test.out 2>&1
eval_tap $? 211 'UserAuthenticationV3' test.out

#- 212 AuthenticationWithPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV3 \
    --extendExp  \
    --clientId 'QFpkau8R' \
    --linkingToken '7U32la1I' \
    --password 'tmKgT0sM' \
    --username 'jP1kGiFS' \
    > test.out 2>&1
eval_tap $? 212 'AuthenticationWithPlatformLinkV3' test.out

#- 213 GenerateTokenByNewHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV3 \
    --additionalData '1RSkLt3m' \
    --extendExp  \
    --linkingToken 'TodKWKX5' \
    > test.out 2>&1
eval_tap $? 213 'GenerateTokenByNewHeadlessAccountV3' test.out

#- 214 RequestOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam requestOneTimeLinkingCodeV3 \
    --platformId 'uMqiwNNI' \
    > test.out 2>&1
eval_tap $? 214 'RequestOneTimeLinkingCodeV3' test.out

#- 215 ValidateOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam validateOneTimeLinkingCodeV3 \
    --oneTimeLinkCode 'sF4dMOlc' \
    > test.out 2>&1
eval_tap $? 215 'ValidateOneTimeLinkingCodeV3' test.out

#- 216 RequestTokenByOneTimeLinkCodeResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTokenByOneTimeLinkCodeResponseV3 \
    --additionalData 'HqIJiX5Z' \
    --isTransient  \
    --clientId 'X6Zh011Q' \
    --oneTimeLinkCode 'dVMhHLQS' \
    > test.out 2>&1
eval_tap $? 216 'RequestTokenByOneTimeLinkCodeResponseV3' test.out

#- 217 GetCountryLocationV3
./ng net.accelbyte.sdk.cli.Main iam getCountryLocationV3 \
    > test.out 2>&1
eval_tap $? 217 'GetCountryLocationV3' test.out

#- 218 Logout
./ng net.accelbyte.sdk.cli.Main iam logout \
    > test.out 2>&1
eval_tap $? 218 'Logout' test.out

#- 219 RequestTokenExchangeCodeV3
./ng net.accelbyte.sdk.cli.Main iam requestTokenExchangeCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --clientId 'Or0tz6Bw' \
    > test.out 2>&1
eval_tap $? 219 'RequestTokenExchangeCodeV3' test.out

#- 220 AdminRetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam adminRetrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'c6mJKo5F' \
    --userId 'B6it5V57' \
    > test.out 2>&1
eval_tap $? 220 'AdminRetrieveUserThirdPartyPlatformTokenV3' test.out

#- 221 RevokeUserV3
./ng net.accelbyte.sdk.cli.Main iam revokeUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'MU7HkHh2' \
    --includeGameNamespace  \
    > test.out 2>&1
eval_tap $? 221 'RevokeUserV3' test.out

#- 222 AuthorizeV3
./ng net.accelbyte.sdk.cli.Main iam authorizeV3 \
    --codeChallenge 'bwSJJddu' \
    --codeChallengeMethod 'S256' \
    --createHeadless  \
    --oneTimeLinkCode '6Ewhehy2' \
    --redirectUri 'vrX2iXUT' \
    --scope 'Zq3qt4WS' \
    --state '73GrMqqY' \
    --targetAuthPage 'sln5MVqq' \
    --useRedirectUriAsLoginUrlWhenLocked  \
    --clientId 'VGymaMT3' \
    --responseType 'code' \
    > test.out 2>&1
eval_tap $? 222 'AuthorizeV3' test.out

#- 223 TokenIntrospectionV3
./ng net.accelbyte.sdk.cli.Main iam tokenIntrospectionV3 \
    --token 'RwYmRoDs' \
    > test.out 2>&1
eval_tap $? 223 'TokenIntrospectionV3' test.out

#- 224 GetJWKSV3
./ng net.accelbyte.sdk.cli.Main iam getJWKSV3 \
    > test.out 2>&1
eval_tap $? 224 'GetJWKSV3' test.out

#- 225 SendMFAAuthenticationCode
./ng net.accelbyte.sdk.cli.Main iam sendMFAAuthenticationCode \
    --clientId '22AYagI5' \
    --factor 'hUBxvhqk' \
    --mfaToken 'kA739Dgk' \
    > test.out 2>&1
eval_tap $? 225 'SendMFAAuthenticationCode' test.out

#- 226 Change2faMethod
./ng net.accelbyte.sdk.cli.Main iam change2faMethod \
    --factor 'tdagNo1O' \
    --mfaToken 'KtebV9G5' \
    > test.out 2>&1
eval_tap $? 226 'Change2faMethod' test.out

#- 227 Verify2faCode
./ng net.accelbyte.sdk.cli.Main iam verify2faCode \
    --code 'W65QLhif' \
    --factor '7ciSu2Go' \
    --mfaToken 'V2kHo3CM' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 227 'Verify2faCode' test.out

#- 228 RetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam retrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'moD2foXa' \
    --userId 'hMF8IFCn' \
    > test.out 2>&1
eval_tap $? 228 'RetrieveUserThirdPartyPlatformTokenV3' test.out

#- 229 AuthCodeRequestV3
./ng net.accelbyte.sdk.cli.Main iam authCodeRequestV3 \
    --platformId 'Um8LhvdX' \
    --clientId 'aQc7KTLJ' \
    --redirectUri 'A1AWR3jB' \
    --requestId '4DqojzTY' \
    > test.out 2>&1
eval_tap $? 229 'AuthCodeRequestV3' test.out

#- 230 PlatformTokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV3 \
    --platformId 'J9XMStfX' \
    --additionalData 'n4h2ay93' \
    --clientId 'SLcPBeo7' \
    --createHeadless  \
    --deviceId 'AaQ1rJc4' \
    --macAddress 'jM913SdA' \
    --platformToken 'vSRntDFi' \
    --skipSetCookie  \
    > test.out 2>&1
eval_tap $? 230 'PlatformTokenGrantV3' test.out

#- 231 GetRevocationListV3
./ng net.accelbyte.sdk.cli.Main iam getRevocationListV3 \
    > test.out 2>&1
eval_tap $? 231 'GetRevocationListV3' test.out

#- 232 TokenRevocationV3
./ng net.accelbyte.sdk.cli.Main iam tokenRevocationV3 \
    --token '5j4UzwLm' \
    > test.out 2>&1
eval_tap $? 232 'TokenRevocationV3' test.out

#- 233 SimultaneousLoginV3
./ng net.accelbyte.sdk.cli.Main iam simultaneousLoginV3 \
    --simultaneousPlatform 'pspc' \
    --simultaneousTicket 'KyvGRZVk' \
    --nativePlatform 'steam' \
    --nativePlatformTicket 'uMWKjNNb' \
    > test.out 2>&1
eval_tap $? 233 'SimultaneousLoginV3' test.out

#- 234 TokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV3 \
    --additionalData 'pk1fBRgu' \
    --clientId 'A3ZcNgZG' \
    --code 'G7Q3PYDS' \
    --codeVerifier 'vA1WXOar' \
    --extendNamespace 'a70dIesc' \
    --extendExp  \
    --password '8R1duLCp' \
    --redirectUri 'riEdxXgT' \
    --refreshToken 'cRKAwLju' \
    --username 'LyNOZ9I4' \
    --grantType 'urn:ietf:params:oauth:grant-type:extend_client_credentials' \
    > test.out 2>&1
eval_tap $? 234 'TokenGrantV3' test.out

#- 235 VerifyTokenV3
./ng net.accelbyte.sdk.cli.Main iam verifyTokenV3 \
    --token 'zkKm2TJs' \
    > test.out 2>&1
eval_tap $? 235 'VerifyTokenV3' test.out

#- 236 PlatformAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticationV3 \
    --platformId 'bWvrmvjK' \
    --code 'wGeloF3N' \
    --error 'IZ8vkPuD' \
    --openidAssocHandle 'd0POQfeV' \
    --openidClaimedId 'woCoLKuI' \
    --openidIdentity 'PtnFsT48' \
    --openidMode 'GeRzUr9j' \
    --openidNs 'k39scQot' \
    --openidOpEndpoint 'n5PEQu3L' \
    --openidResponseNonce 'Elrmvtlg' \
    --openidReturnTo 'o1JIEFTw' \
    --openidSig 'eoPGCytV' \
    --openidSigned 'KK10rwNN' \
    --state 'vR6rXTZB' \
    > test.out 2>&1
eval_tap $? 236 'PlatformAuthenticationV3' test.out

#- 237 PlatformTokenRefreshV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenRefreshV3 \
    --platformId 'HIGwXnp9' \
    --platformToken 'wkZLnBeX' \
    > test.out 2>&1
eval_tap $? 237 'PlatformTokenRefreshV3' test.out

#- 238 PublicGetInputValidations
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidations \
    --defaultOnEmpty  \
    --languageCode 'sWj4UX7f' \
    > test.out 2>&1
eval_tap $? 238 'PublicGetInputValidations' test.out

#- 239 PublicGetInputValidationByField
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidationByField \
    --field 'v6WagBS7' \
    > test.out 2>&1
eval_tap $? 239 'PublicGetInputValidationByField' test.out

#- 240 PublicGetCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam publicGetCountryAgeRestrictionV3 \
    --countryCode '5lCFGK3T' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 240 'PublicGetCountryAgeRestrictionV3' test.out

#- 241 PublicGetCountryListV3
./ng net.accelbyte.sdk.cli.Main iam publicGetCountryListV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 241 'PublicGetCountryListV3' test.out

#- 242 RetrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3
./ng net.accelbyte.sdk.cli.Main iam retrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 242 'RetrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3' test.out

#- 243 RetrieveActiveOIDCClientsPublicV3
./ng net.accelbyte.sdk.cli.Main iam retrieveActiveOIDCClientsPublicV3 \
    --namespace "$AB_NAMESPACE" \
    --clientId 'eVR9NXe3' \
    > test.out 2>&1
eval_tap $? 243 'RetrieveActiveOIDCClientsPublicV3' test.out

#- 244 PublicListUserIDByPlatformUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserIDByPlatformUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'LvR8b7OK' \
    --rawPID  \
    --body '{"platformUserIds": ["1erryMex", "BwUHGQuK", "1sTtXv82"]}' \
    > test.out 2>&1
eval_tap $? 244 'PublicListUserIDByPlatformUserIDsV3' test.out

#- 245 PublicGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'LX2VeSeB' \
    --platformUserId 'Bk4SjxTA' \
    > test.out 2>&1
eval_tap $? 245 'PublicGetUserByPlatformUserIDV3' test.out

#- 246 PublicGetAsyncStatus
./ng net.accelbyte.sdk.cli.Main iam publicGetAsyncStatus \
    --namespace "$AB_NAMESPACE" \
    --requestId 'SVG6BFmn' \
    > test.out 2>&1
eval_tap $? 246 'PublicGetAsyncStatus' test.out

#- 247 PublicSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam publicSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'sodthftp' \
    --limit '38' \
    --offset '89' \
    --platformBy 'o19JH5qz' \
    --platformId 'zvRitpdp' \
    --query 'JUG8cEWz' \
    > test.out 2>&1
eval_tap $? 247 'PublicSearchUserV3' test.out

#- 248 PublicCreateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "BK49JldO", "acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "Q0dN0wjw", "policyId": "aCqch9eF", "policyVersionId": "yEPvsYFS"}, {"isAccepted": false, "localizedPolicyVersionId": "H79cm2VZ", "policyId": "oyjTMti7", "policyVersionId": "wADGefIf"}, {"isAccepted": false, "localizedPolicyVersionId": "UniJykRI", "policyId": "6ncUuBec", "policyVersionId": "0YOqcQws"}], "authType": "zb4voE6b", "code": "jCJUkM98", "country": "69mVT7fY", "dateOfBirth": "DUjs4W6E", "displayName": "l3KrSnTI", "emailAddress": "ZdGtmMGb", "password": "o6OxxCaX", "reachMinimumAge": false}' \
    > test.out 2>&1
eval_tap $? 248 'PublicCreateUserV3' test.out

#- 249 CheckUserAvailability
./ng net.accelbyte.sdk.cli.Main iam checkUserAvailability \
    --namespace "$AB_NAMESPACE" \
    --field 'wZZoF6bK' \
    --query '5DZBDWca' \
    > test.out 2>&1
eval_tap $? 249 'CheckUserAvailability' test.out

#- 250 PublicBulkGetUsers
./ng net.accelbyte.sdk.cli.Main iam publicBulkGetUsers \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["rUdYiJvb", "s8QwaqGx", "WC4YIQ49"]}' \
    > test.out 2>&1
eval_tap $? 250 'PublicBulkGetUsers' test.out

#- 251 PublicSendRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicSendRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "nwOymeUl", "languageTag": "pOltGKXV"}' \
    > test.out 2>&1
eval_tap $? 251 'PublicSendRegistrationCode' test.out

#- 252 PublicVerifyRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicVerifyRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "vAVNsbka", "emailAddress": "tgDDdQhJ"}' \
    > test.out 2>&1
eval_tap $? 252 'PublicVerifyRegistrationCode' test.out

#- 253 PublicForgotPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicForgotPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "kbPwJkGQ", "languageTag": "EfWrLIuy"}' \
    > test.out 2>&1
eval_tap $? 253 'PublicForgotPasswordV3' test.out

#- 254 GetAdminInvitationV3
./ng net.accelbyte.sdk.cli.Main iam getAdminInvitationV3 \
    --invitationId 'DaWJWKdT' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 254 'GetAdminInvitationV3' test.out

#- 255 CreateUserFromInvitationV3
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV3 \
    --invitationId 'RTRiZPM6' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "jl8HnhuC", "policyId": "U6lpuHdl", "policyVersionId": "eSWa41GR"}, {"isAccepted": false, "localizedPolicyVersionId": "p3B1BLdH", "policyId": "bA8kA8i2", "policyVersionId": "jzkEBNJL"}, {"isAccepted": true, "localizedPolicyVersionId": "7ynvFmfC", "policyId": "lpR3XOOQ", "policyVersionId": "kBGwD4z0"}], "authType": "EMAILPASSWD", "country": "tE48Cp0j", "dateOfBirth": "ISTqKEQ5", "displayName": "ZG1Cc06h", "password": "CeBC5dzV", "reachMinimumAge": false}' \
    > test.out 2>&1
eval_tap $? 255 'CreateUserFromInvitationV3' test.out

#- 256 UpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam updateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "osb4Ggfc", "country": "rXxA4bDK", "dateOfBirth": "CdSFsKjI", "displayName": "zEvFGZQu", "languageTag": "PrjumzwS", "userName": "HuzRrFEw"}' \
    > test.out 2>&1
eval_tap $? 256 'UpdateUserV3' test.out

#- 257 PublicPartialUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicPartialUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "4chsOIzf", "country": "Si7HO2Ps", "dateOfBirth": "pADQBYPt", "displayName": "D1wWXoMn", "languageTag": "v5MQNQ46", "userName": "1jRTT139"}' \
    > test.out 2>&1
eval_tap $? 257 'PublicPartialUpdateUserV3' test.out

#- 258 PublicSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"context": "WTRa7nph", "emailAddress": "6PAUE57u", "languageTag": "WoB80taR"}' \
    > test.out 2>&1
eval_tap $? 258 'PublicSendVerificationCodeV3' test.out

#- 259 PublicUserVerificationV3
./ng net.accelbyte.sdk.cli.Main iam publicUserVerificationV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "LGgxEnIm", "contactType": "AYk0hkls", "languageTag": "Jyau3AT5", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 259 'PublicUserVerificationV3' test.out

#- 260 PublicUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "1zL4Lg5c", "country": "oKrZwWbg", "dateOfBirth": "sEOXAFK8", "displayName": "bwTow1XR", "emailAddress": "Qj3LEUXH", "password": "y1O73LNe", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 260 'PublicUpgradeHeadlessAccountV3' test.out

#- 261 PublicVerifyHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --needVerificationCode  \
    --body '{"emailAddress": "Dd6Uhe7P", "password": "KejAPW6T"}' \
    > test.out 2>&1
eval_tap $? 261 'PublicVerifyHeadlessAccountV3' test.out

#- 262 PublicUpdatePasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicUpdatePasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"languageTag": "VVuSchWU", "newPassword": "MhGwBBpn", "oldPassword": "3aFtRIBs"}' \
    > test.out 2>&1
eval_tap $? 262 'PublicUpdatePasswordV3' test.out

#- 263 PublicCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam publicCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'DAWxzbku' \
    > test.out 2>&1
eval_tap $? 263 'PublicCreateJusticeUser' test.out

#- 264 PublicPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'YkC6gVJn' \
    --redirectUri 'p0yEZIMV' \
    --ticket 'M6R3wmsL' \
    > test.out 2>&1
eval_tap $? 264 'PublicPlatformLinkV3' test.out

#- 265 PublicPlatformUnlinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'PAmCli9g' \
    --body '{"platformNamespace": "Z2GTeFGk"}' \
    > test.out 2>&1
eval_tap $? 265 'PublicPlatformUnlinkV3' test.out

#- 266 PublicPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'jCiFxv4f' \
    > test.out 2>&1
eval_tap $? 266 'PublicPlatformUnlinkAllV3' test.out

#- 267 PublicForcePlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicForcePlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '0HFZ6FsH' \
    --ticket 'JOEBT70Q' \
    > test.out 2>&1
eval_tap $? 267 'PublicForcePlatformLinkV3' test.out

#- 268 PublicWebLinkPlatform
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatform \
    --namespace "$AB_NAMESPACE" \
    --platformId 'M5fALrV4' \
    --clientId 'yMSOwVZj' \
    --redirectUri 'xS1tKaZT' \
    > test.out 2>&1
eval_tap $? 268 'PublicWebLinkPlatform' test.out

#- 269 PublicWebLinkPlatformEstablish
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatformEstablish \
    --namespace "$AB_NAMESPACE" \
    --platformId 'LBsjr6gI' \
    --code 'TEDzEJIF' \
    --state 'oSlUrPcc' \
    > test.out 2>&1
eval_tap $? 269 'PublicWebLinkPlatformEstablish' test.out

#- 270 PublicProcessWebLinkPlatformV3
./ng net.accelbyte.sdk.cli.Main iam publicProcessWebLinkPlatformV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'TXCSEWBP' \
    --code 'A6kxUe2m' \
    --state '7dfKwWfl' \
    > test.out 2>&1
eval_tap $? 270 'PublicProcessWebLinkPlatformV3' test.out

#- 271 PublicGetUsersPlatformInfosV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUsersPlatformInfosV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"platformId": "HeWxFASO", "userIds": ["r9kLqVwx", "qx19aJTs", "uWSzeLrJ"]}' \
    > test.out 2>&1
eval_tap $? 271 'PublicGetUsersPlatformInfosV3' test.out

#- 272 ResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam resetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "t8CWNatG", "emailAddress": "h2BEhLNH", "newPassword": "jzySLFKS"}' \
    > test.out 2>&1
eval_tap $? 272 'ResetPasswordV3' test.out

#- 273 PublicGetUserByUserIdV3
eval_tap 0 273 'PublicGetUserByUserIdV3 # SKIP deprecated' test.out

#- 274 PublicGetUserBanHistoryV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserBanHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'KLQMOgQU' \
    --activeOnly  \
    --after 'An1org28' \
    --before '4nIemg02' \
    --limit '12' \
    > test.out 2>&1
eval_tap $? 274 'PublicGetUserBanHistoryV3' test.out

#- 275 PublicListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'xuRnaazd' \
    > test.out 2>&1
eval_tap $? 275 'PublicListUserAllPlatformAccountsDistinctV3' test.out

#- 276 PublicGetUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'HO0YtYPZ' \
    > test.out 2>&1
eval_tap $? 276 'PublicGetUserInformationV3' test.out

#- 277 PublicGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'TzDwK1QE' \
    --after '0.14830960399446935' \
    --before '0.9409295296969723' \
    --limit '50' \
    > test.out 2>&1
eval_tap $? 277 'PublicGetUserLoginHistoriesV3' test.out

#- 278 PublicGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'P1vmTpck' \
    --after 'vRXfyY3F' \
    --before '3736iogX' \
    --limit '7' \
    --platformId 'cxYxPvwE' \
    > test.out 2>&1
eval_tap $? 278 'PublicGetUserPlatformAccountsV3' test.out

#- 279 PublicListJusticePlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicListJusticePlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '1mfKSUcR' \
    > test.out 2>&1
eval_tap $? 279 'PublicListJusticePlatformAccountsV3' test.out

#- 280 PublicLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam publicLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'OQB4xOqt' \
    --body '{"platformId": "ZiSjHSbW", "platformUserId": "J6yOixnz"}' \
    > test.out 2>&1
eval_tap $? 280 'PublicLinkPlatformAccount' test.out

#- 281 PublicForceLinkPlatformWithProgression
./ng net.accelbyte.sdk.cli.Main iam publicForceLinkPlatformWithProgression \
    --namespace "$AB_NAMESPACE" \
    --userId 'dBNNeBiu' \
    --body '{"chosenNamespaces": ["9tFUsTgX", "OoiCB4g7", "b6chT1rI"], "requestId": "cCUQmmHQ"}' \
    > test.out 2>&1
eval_tap $? 281 'PublicForceLinkPlatformWithProgression' test.out

#- 282 PublicGetPublisherUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetPublisherUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'N5PWekQg' \
    > test.out 2>&1
eval_tap $? 282 'PublicGetPublisherUserV3' test.out

#- 283 PublicValidateUserByUserIDAndPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserByUserIDAndPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'qa793M2v' \
    --password 'WjWdlHpw' \
    > test.out 2>&1
eval_tap $? 283 'PublicValidateUserByUserIDAndPasswordV3' test.out

#- 284 PublicGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRolesV3 \
    --after 'YgfnMyzE' \
    --before 'uadSmyS3' \
    --isWildcard  \
    --limit '26' \
    > test.out 2>&1
eval_tap $? 284 'PublicGetRolesV3' test.out

#- 285 PublicGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRoleV3 \
    --roleId '7YRZRqNc' \
    > test.out 2>&1
eval_tap $? 285 'PublicGetRoleV3' test.out

#- 286 PublicGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyUserV3 \
    --includeAllPlatforms  \
    > test.out 2>&1
eval_tap $? 286 'PublicGetMyUserV3' test.out

#- 287 PublicGetLinkHeadlessAccountToMyAccountConflictV3
./ng net.accelbyte.sdk.cli.Main iam publicGetLinkHeadlessAccountToMyAccountConflictV3 \
    --oneTimeLinkCode '6wB16Ea4' \
    > test.out 2>&1
eval_tap $? 287 'PublicGetLinkHeadlessAccountToMyAccountConflictV3' test.out

#- 288 LinkHeadlessAccountToMyAccountV3
./ng net.accelbyte.sdk.cli.Main iam linkHeadlessAccountToMyAccountV3 \
    --body '{"chosenNamespaces": ["olpfv6kd", "dC25QE1z", "caa3JVpS"], "oneTimeLinkCode": "Dspt0wCh"}' \
    > test.out 2>&1
eval_tap $? 288 'LinkHeadlessAccountToMyAccountV3' test.out

#- 289 PublicSendVerificationLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationLinkV3 \
    --body '{"languageTag": "mxEy05by"}' \
    > test.out 2>&1
eval_tap $? 289 'PublicSendVerificationLinkV3' test.out

#- 290 PublicVerifyUserByLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyUserByLinkV3 \
    --code 'VMhzroyj' \
    > test.out 2>&1
eval_tap $? 290 'PublicVerifyUserByLinkV3' test.out

#- 291 PlatformAuthenticateSAMLV3Handler
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticateSAMLV3Handler \
    --platformId 'IkW1vTt6' \
    --code '4Ub2YZDc' \
    --error 'YMGbvEUo' \
    --state 'XQJENKPF' \
    > test.out 2>&1
eval_tap $? 291 'PlatformAuthenticateSAMLV3Handler' test.out

#- 292 LoginSSOClient
./ng net.accelbyte.sdk.cli.Main iam loginSSOClient \
    --platformId 'RL1wrBY7' \
    --payload 'sw9RTQ0K' \
    > test.out 2>&1
eval_tap $? 292 'LoginSSOClient' test.out

#- 293 LogoutSSOClient
./ng net.accelbyte.sdk.cli.Main iam logoutSSOClient \
    --platformId 'RApbsLeB' \
    > test.out 2>&1
eval_tap $? 293 'LogoutSSOClient' test.out

#- 294 RequestTargetTokenResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTargetTokenResponseV3 \
    --additionalData 'j6pRYGzw' \
    --code 'w4BMS4ac' \
    > test.out 2>&1
eval_tap $? 294 'RequestTargetTokenResponseV3' test.out

#- 295 PlatformTokenRefreshV3Deprecate
eval_tap 0 295 'PlatformTokenRefreshV3Deprecate # SKIP deprecated' test.out

#- 296 AdminGetDevicesByUserV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDevicesByUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'KosDLsrM' \
    > test.out 2>&1
eval_tap $? 296 'AdminGetDevicesByUserV4' test.out

#- 297 AdminGetBannedDevicesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedDevicesV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceType 'DqpuusXi' \
    --endDate 'Zm5F68xn' \
    --limit '73' \
    --offset '95' \
    --startDate 'Ny6OWBeB' \
    > test.out 2>&1
eval_tap $? 297 'AdminGetBannedDevicesV4' test.out

#- 298 AdminGetUserDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeviceBansV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'GGfNr12h' \
    > test.out 2>&1
eval_tap $? 298 'AdminGetUserDeviceBansV4' test.out

#- 299 AdminBanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminBanDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"comment": "rMhgrqux", "deviceId": "Z7GgRt4k", "deviceType": "UrK0VHn1", "enabled": true, "endDate": "o5twMZ9u", "ext": {"Z60HS6AN": {}, "uTCveMwz": {}, "FnpzVESn": {}}, "reason": "MHBKnbNb"}' \
    > test.out 2>&1
eval_tap $? 299 'AdminBanDeviceV4' test.out

#- 300 AdminGetDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBanV4 \
    --banId 'wfEah0uL' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 300 'AdminGetDeviceBanV4' test.out

#- 301 AdminUpdateDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateDeviceBanV4 \
    --banId 'dkWAsLos' \
    --namespace "$AB_NAMESPACE" \
    --body '{"enabled": false}' \
    > test.out 2>&1
eval_tap $? 301 'AdminUpdateDeviceBanV4' test.out

#- 302 AdminGenerateReportV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateReportV4 \
    --namespace "$AB_NAMESPACE" \
    --endDate 'xOBigm6Y' \
    --startDate 'UV84mW3R' \
    --deviceType 'AhPriLyr' \
    > test.out 2>&1
eval_tap $? 302 'AdminGenerateReportV4' test.out

#- 303 AdminGetDeviceTypesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceTypesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 303 'AdminGetDeviceTypesV4' test.out

#- 304 AdminGetDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBansV4 \
    --deviceId 'DXJwTcek' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 304 'AdminGetDeviceBansV4' test.out

#- 305 AdminDecryptDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminDecryptDeviceV4 \
    --deviceId 'yjaQwNYk' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 305 'AdminDecryptDeviceV4' test.out

#- 306 AdminUnbanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminUnbanDeviceV4 \
    --deviceId 'WOXbVagf' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 306 'AdminUnbanDeviceV4' test.out

#- 307 AdminGetUsersByDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUsersByDeviceV4 \
    --deviceId '7cKtsQe6' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 307 'AdminGetUsersByDeviceV4' test.out

#- 308 AdminCreateTestUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateTestUsersV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 9}' \
    > test.out 2>&1
eval_tap $? 308 'AdminCreateTestUsersV4' test.out

#- 309 AdminCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "ZfQNrCag", "policyId": "vvFZj8U9", "policyVersionId": "JxEIPKR8"}, {"isAccepted": true, "localizedPolicyVersionId": "vIBZAZwc", "policyId": "93EiHzAe", "policyVersionId": "hV1dKLPx"}, {"isAccepted": false, "localizedPolicyVersionId": "fiXqF54u", "policyId": "JbFI5FLy", "policyVersionId": "R6P8VYJF"}], "authType": "EMAILPASSWD", "code": "ybNJZ3PT", "country": "PGuEVPCH", "dateOfBirth": "3zpx9d1l", "displayName": "i6ACOcqT", "emailAddress": "v8MFXSmv", "password": "pvlvKbtZ", "passwordMD5Sum": "RELdPlSy", "reachMinimumAge": true, "username": "n1Bx9prW"}' \
    > test.out 2>&1
eval_tap $? 309 'AdminCreateUserV4' test.out

#- 310 AdminBulkUpdateUserAccountTypeV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateUserAccountTypeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"testAccount": true, "userIds": ["xNSeWqTh", "oOBmtTrI", "mVbe7jLT"]}' \
    > test.out 2>&1
eval_tap $? 310 'AdminBulkUpdateUserAccountTypeV4' test.out

#- 311 AdminBulkCheckValidUserIDV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkCheckValidUserIDV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["16zck2qA", "MyrzJLmz", "KzVajv16"]}' \
    > test.out 2>&1
eval_tap $? 311 'AdminBulkCheckValidUserIDV4' test.out

#- 312 AdminUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'PQH939Qw' \
    --body '{"avatarUrl": "OG0QVXaO", "country": "HkHPl1Ds", "dateOfBirth": "vTgrfBuF", "displayName": "hFZw4BsI", "languageTag": "ZBYydsce", "userName": "cWjsSwwP"}' \
    > test.out 2>&1
eval_tap $? 312 'AdminUpdateUserV4' test.out

#- 313 AdminUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'CkTryGSG' \
    --body '{"code": "LAEDa8ZO", "emailAddress": "eSAgcKW8"}' \
    > test.out 2>&1
eval_tap $? 313 'AdminUpdateUserEmailAddressV4' test.out

#- 314 AdminDisableUserMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableUserMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '0E81Z059' \
    > test.out 2>&1
eval_tap $? 314 'AdminDisableUserMFAV4' test.out

#- 315 AdminListUserRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminListUserRolesV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'pf2fwWGg' \
    > test.out 2>&1
eval_tap $? 315 'AdminListUserRolesV4' test.out

#- 316 AdminUpdateUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'fOGWEFLc' \
    --body '{"assignedNamespaces": ["15rBSlu7", "gyZbylFd", "CbjrKJtl"], "roleId": "glPfmSh5"}' \
    > test.out 2>&1
eval_tap $? 316 'AdminUpdateUserRoleV4' test.out

#- 317 AdminAddUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ERrWoJRI' \
    --body '{"assignedNamespaces": ["E16FEYIv", "Zzr4ygvc", "8xqNYKvm"], "roleId": "4R4iafxf"}' \
    > test.out 2>&1
eval_tap $? 317 'AdminAddUserRoleV4' test.out

#- 318 AdminRemoveUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRemoveUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '8kISqWEE' \
    --body '{"assignedNamespaces": ["2Jv5ni8c", "2T7siJ3v", "Q7AyJgBP"], "roleId": "Mt42sgjD"}' \
    > test.out 2>&1
eval_tap $? 318 'AdminRemoveUserRoleV4' test.out

#- 319 AdminGetRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV4 \
    --adminRole  \
    --isWildcard  \
    --limit '10' \
    --offset '9' \
    > test.out 2>&1
eval_tap $? 319 'AdminGetRolesV4' test.out

#- 320 AdminCreateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV4 \
    --body '{"adminRole": false, "deletable": false, "isWildcard": true, "roleName": "2Vk7pwYO"}' \
    > test.out 2>&1
eval_tap $? 320 'AdminCreateRoleV4' test.out

#- 321 AdminGetRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV4 \
    --roleId 'VTXX9GJ3' \
    > test.out 2>&1
eval_tap $? 321 'AdminGetRoleV4' test.out

#- 322 AdminDeleteRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV4 \
    --roleId 'vHgD5sVX' \
    > test.out 2>&1
eval_tap $? 322 'AdminDeleteRoleV4' test.out

#- 323 AdminUpdateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV4 \
    --roleId 'qYjWezti' \
    --body '{"adminRole": true, "deletable": true, "isWildcard": false, "roleName": "HIrgAn5I"}' \
    > test.out 2>&1
eval_tap $? 323 'AdminUpdateRoleV4' test.out

#- 324 AdminUpdateRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV4 \
    --roleId 'aA7A1JPB' \
    --body '{"permissions": [{"action": 14, "resource": "QfbNqN7y", "schedAction": 33, "schedCron": "H8n4o9Vu", "schedRange": ["qLMQg1i9", "C8q1Rt7n", "FP1DMRgR"]}, {"action": 17, "resource": "t6aMPxsH", "schedAction": 5, "schedCron": "XCxbZe4t", "schedRange": ["IeL8T616", "WhPLfxqR", "OtCPfP9J"]}, {"action": 8, "resource": "KmHKNgQU", "schedAction": 38, "schedCron": "n8mVvOyr", "schedRange": ["NGKgaKJs", "HGKMs3vn", "eiAAxdFn"]}]}' \
    > test.out 2>&1
eval_tap $? 324 'AdminUpdateRolePermissionsV4' test.out

#- 325 AdminAddRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV4 \
    --roleId 'jTkf543a' \
    --body '{"permissions": [{"action": 64, "resource": "a4FEydA7", "schedAction": 87, "schedCron": "9NDbXcbR", "schedRange": ["jW3qdFr0", "YzwIIAvV", "pM9KUhyZ"]}, {"action": 94, "resource": "8gTPJwae", "schedAction": 1, "schedCron": "bEC05oGa", "schedRange": ["1yabuQuB", "2VP1r50B", "fSSavUU5"]}, {"action": 72, "resource": "U8guc3hY", "schedAction": 84, "schedCron": "ivm8fMLj", "schedRange": ["Aqqm9isS", "2redZ16F", "CGLP4xMD"]}]}' \
    > test.out 2>&1
eval_tap $? 325 'AdminAddRolePermissionsV4' test.out

#- 326 AdminDeleteRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV4 \
    --roleId 'gS16m7zJ' \
    --body '["5XxcPOQ9", "LKlx9rVP", "4U3zQVl1"]' \
    > test.out 2>&1
eval_tap $? 326 'AdminDeleteRolePermissionsV4' test.out

#- 327 AdminListAssignedUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminListAssignedUsersV4 \
    --roleId 'fgkbWCB6' \
    --after '8CoxMZj6' \
    --before 'TSKatosP' \
    --limit '69' \
    > test.out 2>&1
eval_tap $? 327 'AdminListAssignedUsersV4' test.out

#- 328 AdminAssignUserToRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAssignUserToRoleV4 \
    --roleId 'qGJr3bS6' \
    --body '{"assignedNamespaces": ["Qf4HzYYJ", "fRvcdx9E", "RaBmhsI8"], "namespace": "Ftygro7e", "userId": "7kHTXKrW"}' \
    > test.out 2>&1
eval_tap $? 328 'AdminAssignUserToRoleV4' test.out

#- 329 AdminRevokeUserFromRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRevokeUserFromRoleV4 \
    --roleId 'yYlEdvvA' \
    --body '{"namespace": "TZ5p2u1Y", "userId": "J7kJMD2S"}' \
    > test.out 2>&1
eval_tap $? 329 'AdminRevokeUserFromRoleV4' test.out

#- 330 AdminInviteUserNewV4
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserNewV4 \
    --body '{"assignedNamespaces": ["EICyUper", "NlrHPM93", "K7Z5TPgh"], "emailAddresses": ["87qFdyAA", "fREmZUYb", "osJEET9Y"], "isAdmin": false, "namespace": "JWwPpBex", "roleId": "O0I74epb"}' \
    > test.out 2>&1
eval_tap $? 330 'AdminInviteUserNewV4' test.out

#- 331 AdminUpdateMyUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateMyUserV4 \
    --body '{"avatarUrl": "BmmerO5S", "country": "GBL2VWvB", "dateOfBirth": "MCbHS07r", "displayName": "QYWdbsDj", "languageTag": "xoLsl0gQ", "userName": "o7Pl5FDj"}' \
    > test.out 2>&1
eval_tap $? 331 'AdminUpdateMyUserV4' test.out

#- 332 AdminDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyAuthenticatorV4 \
    > test.out 2>&1
eval_tap $? 332 'AdminDisableMyAuthenticatorV4' test.out

#- 333 AdminEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyAuthenticatorV4 \
    --code 'hAG9QA2D' \
    > test.out 2>&1
eval_tap $? 333 'AdminEnableMyAuthenticatorV4' test.out

#- 334 AdminGenerateMyAuthenticatorKeyV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateMyAuthenticatorKeyV4 \
    > test.out 2>&1
eval_tap $? 334 'AdminGenerateMyAuthenticatorKeyV4' test.out

#- 335 AdminGetMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 335 'AdminGetMyBackupCodesV4' test.out

#- 336 AdminGenerateMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 336 'AdminGenerateMyBackupCodesV4' test.out

#- 337 AdminDisableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 337 'AdminDisableMyBackupCodesV4' test.out

#- 338 AdminDownloadMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminDownloadMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 338 'AdminDownloadMyBackupCodesV4' test.out

#- 339 AdminEnableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 339 'AdminEnableMyBackupCodesV4' test.out

#- 340 AdminSendMyMFAEmailCodeV4
./ng net.accelbyte.sdk.cli.Main iam adminSendMyMFAEmailCodeV4 \
    > test.out 2>&1
eval_tap $? 340 'AdminSendMyMFAEmailCodeV4' test.out

#- 341 AdminDisableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyEmailV4 \
    > test.out 2>&1
eval_tap $? 341 'AdminDisableMyEmailV4' test.out

#- 342 AdminEnableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyEmailV4 \
    --code '8VEJMVjI' \
    > test.out 2>&1
eval_tap $? 342 'AdminEnableMyEmailV4' test.out

#- 343 AdminGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyEnabledFactorsV4 \
    > test.out 2>&1
eval_tap $? 343 'AdminGetMyEnabledFactorsV4' test.out

#- 344 AdminMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam adminMakeFactorMyDefaultV4 \
    --factor '0uGMT5Ku' \
    > test.out 2>&1
eval_tap $? 344 'AdminMakeFactorMyDefaultV4' test.out

#- 345 AdminInviteUserV4
eval_tap 0 345 'AdminInviteUserV4 # SKIP deprecated' test.out

#- 346 PublicCreateTestUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateTestUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "YCJNCHlp", "policyId": "J0Hs4wej", "policyVersionId": "YGsulJeW"}, {"isAccepted": false, "localizedPolicyVersionId": "mDyoU3Ut", "policyId": "PSLTV0lj", "policyVersionId": "1zDkLPs8"}, {"isAccepted": false, "localizedPolicyVersionId": "qcGsoIRE", "policyId": "rTrL9tRs", "policyVersionId": "jta4KgFW"}], "authType": "EMAILPASSWD", "country": "dSbWkS1p", "dateOfBirth": "VZRLXy53", "displayName": "yj2HTBmf", "emailAddress": "d1HRzzRW", "password": "CWfC3Mf2", "passwordMD5Sum": "KaITSlah", "username": "H2rYVV4K", "verified": false}' \
    > test.out 2>&1
eval_tap $? 346 'PublicCreateTestUserV4' test.out

#- 347 PublicCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "vJavaYC6", "policyId": "S1sDxecM", "policyVersionId": "cWehp5FB"}, {"isAccepted": true, "localizedPolicyVersionId": "gMbxGVdt", "policyId": "yHyzfLmJ", "policyVersionId": "BPEQD08T"}, {"isAccepted": false, "localizedPolicyVersionId": "F1Pv8Iqz", "policyId": "HIz5MjV1", "policyVersionId": "udS6NWcG"}], "authType": "EMAILPASSWD", "code": "Tm8NlkKE", "country": "90zbyxag", "dateOfBirth": "sKynyB9c", "displayName": "pORjP5Ik", "emailAddress": "K3bfjHtN", "password": "6fDXpUpO", "passwordMD5Sum": "5AcCVBeY", "reachMinimumAge": true, "username": "yaPWXR4I"}' \
    > test.out 2>&1
eval_tap $? 347 'PublicCreateUserV4' test.out

#- 348 CreateUserFromInvitationV4
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV4 \
    --invitationId 'XAQWBEvH' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "xP5rCxfa", "policyId": "NhDn1mU5", "policyVersionId": "k6aK4Ax3"}, {"isAccepted": true, "localizedPolicyVersionId": "MtlHq49K", "policyId": "nNv0m8OX", "policyVersionId": "h1X2VuQ7"}, {"isAccepted": true, "localizedPolicyVersionId": "rNCdsDPy", "policyId": "yPHamnmQ", "policyVersionId": "bZS8p3YF"}], "authType": "EMAILPASSWD", "country": "HYOKA41C", "dateOfBirth": "kYB5a56k", "displayName": "6jEWzpKR", "password": "yvChNVOM", "reachMinimumAge": true, "username": "Ychi8ftQ"}' \
    > test.out 2>&1
eval_tap $? 348 'CreateUserFromInvitationV4' test.out

#- 349 PublicUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "8QbMNUUX", "country": "fyOk5Opg", "dateOfBirth": "koLDGQOT", "displayName": "EpA11Umg", "languageTag": "tz3INZXm", "userName": "FCWjRMZs"}' \
    > test.out 2>&1
eval_tap $? 349 'PublicUpdateUserV4' test.out

#- 350 PublicUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "EOJLBbmj", "emailAddress": "izxhkDtb"}' \
    > test.out 2>&1
eval_tap $? 350 'PublicUpdateUserEmailAddressV4' test.out

#- 351 PublicUpgradeHeadlessAccountWithVerificationCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountWithVerificationCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "7dNIkKwx", "country": "SDdD6ykQ", "dateOfBirth": "pG5TXGad", "displayName": "QENMORf8", "emailAddress": "aNzegOZi", "password": "gVDJqHEu", "reachMinimumAge": false, "username": "fngJ0m2J", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 351 'PublicUpgradeHeadlessAccountWithVerificationCodeV4' test.out

#- 352 PublicUpgradeHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "cWmr9Yky", "password": "Gp4jfYri", "username": "T5TncoRL"}' \
    > test.out 2>&1
eval_tap $? 352 'PublicUpgradeHeadlessAccountV4' test.out

#- 353 PublicDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 353 'PublicDisableMyAuthenticatorV4' test.out

#- 354 PublicEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'xjPnjCTk' \
    > test.out 2>&1
eval_tap $? 354 'PublicEnableMyAuthenticatorV4' test.out

#- 355 PublicGenerateMyAuthenticatorKeyV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateMyAuthenticatorKeyV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 355 'PublicGenerateMyAuthenticatorKeyV4' test.out

#- 356 PublicGetMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGetMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 356 'PublicGetMyBackupCodesV4' test.out

#- 357 PublicGenerateMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 357 'PublicGenerateMyBackupCodesV4' test.out

#- 358 PublicDisableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 358 'PublicDisableMyBackupCodesV4' test.out

#- 359 PublicDownloadMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicDownloadMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 359 'PublicDownloadMyBackupCodesV4' test.out

#- 360 PublicEnableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 360 'PublicEnableMyBackupCodesV4' test.out

#- 361 PublicRemoveTrustedDeviceV4
./ng net.accelbyte.sdk.cli.Main iam publicRemoveTrustedDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceToken 'OeNWx2xx' \
    > test.out 2>&1
eval_tap $? 361 'PublicRemoveTrustedDeviceV4' test.out

#- 362 PublicSendMyMFAEmailCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicSendMyMFAEmailCodeV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 362 'PublicSendMyMFAEmailCodeV4' test.out

#- 363 PublicDisableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyEmailV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 363 'PublicDisableMyEmailV4' test.out

#- 364 PublicEnableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyEmailV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'Yi7Wlnsz' \
    > test.out 2>&1
eval_tap $? 364 'PublicEnableMyEmailV4' test.out

#- 365 PublicGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam publicGetMyEnabledFactorsV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 365 'PublicGetMyEnabledFactorsV4' test.out

#- 366 PublicMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam publicMakeFactorMyDefaultV4 \
    --namespace "$AB_NAMESPACE" \
    --factor 'BEgA3LfT' \
    > test.out 2>&1
eval_tap $? 366 'PublicMakeFactorMyDefaultV4' test.out

#- 367 PublicGetUserPublicInfoByUserIdV4
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPublicInfoByUserIdV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'M9Sl9C3F' \
    > test.out 2>&1
eval_tap $? 367 'PublicGetUserPublicInfoByUserIdV4' test.out

#- 368 PublicInviteUserV4
./ng net.accelbyte.sdk.cli.Main iam publicInviteUserV4 \
    --body '{"additionalData": "s39DhA5V", "emailAddress": "YpnmMbBO", "namespace": "xyOMirqc", "namespaceDisplayName": "5iHYkiIC"}' \
    > test.out 2>&1
eval_tap $? 368 'PublicInviteUserV4' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
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
    --body '{"modules": [{"docLink": "FRmk8wGP", "groups": [{"group": "5wZnIC7G", "groupId": "ocY9UqNm", "permissions": [{"allowedActions": [10, 84, 0], "resource": "V77N44GU"}, {"allowedActions": [23, 46, 97], "resource": "cVq3pCjr"}, {"allowedActions": [7, 51, 44], "resource": "y9D3U73F"}]}, {"group": "5JKcPgir", "groupId": "wo2YW9E4", "permissions": [{"allowedActions": [56, 6, 76], "resource": "vhuGlQhz"}, {"allowedActions": [13, 11, 49], "resource": "BPUEDQXQ"}, {"allowedActions": [65, 60, 85], "resource": "G4ZZFJSz"}]}, {"group": "35N9jMbH", "groupId": "aeMC29n9", "permissions": [{"allowedActions": [88, 25, 75], "resource": "sSDfiMhV"}, {"allowedActions": [59, 49, 4], "resource": "x9kLKBSA"}, {"allowedActions": [7, 62, 43], "resource": "JE1bErL4"}]}], "module": "MtgyF5iz", "moduleId": "pbS27ogu"}, {"docLink": "AujfkPg1", "groups": [{"group": "8PnRe9xu", "groupId": "TCcVHfAp", "permissions": [{"allowedActions": [84, 68, 78], "resource": "VAShUmYI"}, {"allowedActions": [47, 86, 48], "resource": "5xIfUCAd"}, {"allowedActions": [61, 60, 95], "resource": "HV9B4ZyW"}]}, {"group": "i03lBFdR", "groupId": "eswHoXAV", "permissions": [{"allowedActions": [55, 34, 69], "resource": "YHKJyQGT"}, {"allowedActions": [15, 49, 46], "resource": "W1AP1Bmj"}, {"allowedActions": [51, 36, 46], "resource": "jhQJg3mP"}]}, {"group": "1gK68vjQ", "groupId": "NrJJyP32", "permissions": [{"allowedActions": [74, 84, 52], "resource": "pjh6rIpD"}, {"allowedActions": [13, 11, 77], "resource": "89meV4OG"}, {"allowedActions": [100, 76, 62], "resource": "IZmyef7t"}]}], "module": "J3mErYH0", "moduleId": "ID02GOct"}, {"docLink": "VWFVAanU", "groups": [{"group": "VvV2P1uD", "groupId": "GvOaVRuA", "permissions": [{"allowedActions": [60, 64, 32], "resource": "G2I0jL28"}, {"allowedActions": [2, 68, 78], "resource": "3DNACCYi"}, {"allowedActions": [35, 16, 28], "resource": "0TP3kDUW"}]}, {"group": "qNYGUa2o", "groupId": "IOWO3Re2", "permissions": [{"allowedActions": [51, 61, 31], "resource": "AnGlSh06"}, {"allowedActions": [76, 0, 7], "resource": "lQteQMit"}, {"allowedActions": [55, 55, 81], "resource": "UpdOpRDg"}]}, {"group": "RIHDYR5O", "groupId": "UZBiaDJY", "permissions": [{"allowedActions": [74, 65, 52], "resource": "uSOhkYkN"}, {"allowedActions": [40, 83, 8], "resource": "nuqTVhdF"}, {"allowedActions": [97, 87, 8], "resource": "J5evDzb4"}]}], "module": "4y8K7GYF", "moduleId": "NIZdemBj"}]}' \
    > test.out 2>&1
eval_tap $? 109 'AdminUpdateAvailablePermissionsByModule' test.out

#- 110 AdminDeleteConfigPermissionsByGroup
./ng net.accelbyte.sdk.cli.Main iam adminDeleteConfigPermissionsByGroup \
    --forceDelete  \
    --body '{"groupId": "TigKB5fW", "moduleId": "fRDZbTSv"}' \
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
    --body '[{"field": "IF9ynoRx", "validation": {"allowAllSpecialCharacters": false, "allowDigit": false, "allowLetter": true, "allowSpace": false, "allowUnicode": false, "avatarConfig": {"allowedPrefixes": ["Bwz4DzMp", "Rfhw1jy3", "Z6fhW8Hg"], "preferRegex": true, "regex": "QvGl2RR4"}, "blockedWord": ["BDDkryVv", "IJYfxJoM", "QuK9jA52"], "description": [{"language": "vnX6PcZZ", "message": ["jSGIBxXp", "XHyTT7rG", "hLP138v5"]}, {"language": "YWsIAGT7", "message": ["U3C3vD2Q", "IH9I7r83", "RcVU9qeO"]}, {"language": "AZaP1pQx", "message": ["JtOwvTGY", "0LKnIOka", "fwGn3TEf"]}], "isCustomRegex": true, "letterCase": "fX1APlZk", "maxLength": 18, "maxRepeatingAlphaNum": 65, "maxRepeatingSpecialCharacter": 92, "minCharType": 57, "minLength": 97, "profanityFilter": "wYyZzU98", "regex": "UarbT3j7", "specialCharacterLocation": "Fz3KYcrM", "specialCharacters": ["c5pOdxRu", "xGHMpWCg", "zEqkL41j"]}}, {"field": "IMR4boNK", "validation": {"allowAllSpecialCharacters": false, "allowDigit": false, "allowLetter": true, "allowSpace": true, "allowUnicode": false, "avatarConfig": {"allowedPrefixes": ["RUc7zNpM", "NM7xDJG0", "FM1qXAPE"], "preferRegex": true, "regex": "6wXry8jT"}, "blockedWord": ["cFyw8XWI", "NX3IBuaZ", "j1Mhs8dL"], "description": [{"language": "DeCbQqGs", "message": ["aDw86r70", "3Eje4QWz", "OtPtnPWB"]}, {"language": "ytoMcZk3", "message": ["rSQTNbzk", "GNAaGc9k", "9PmO9hTX"]}, {"language": "n3HJkt7L", "message": ["kuIkPn0j", "KDbaqtxg", "mCZjLZdj"]}], "isCustomRegex": false, "letterCase": "NpbcPAJe", "maxLength": 25, "maxRepeatingAlphaNum": 34, "maxRepeatingSpecialCharacter": 14, "minCharType": 65, "minLength": 38, "profanityFilter": "Tu1Sk5Oz", "regex": "gDFUEmuQ", "specialCharacterLocation": "6dtZLLqO", "specialCharacters": ["XLy0hY46", "G9oapBop", "e96R17cj"]}}, {"field": "kTfd0rQr", "validation": {"allowAllSpecialCharacters": false, "allowDigit": true, "allowLetter": true, "allowSpace": false, "allowUnicode": false, "avatarConfig": {"allowedPrefixes": ["5UbKsFkK", "cVADumWS", "ke0b0biU"], "preferRegex": true, "regex": "tSF64Rot"}, "blockedWord": ["Eoeal0oS", "HB6WwiZk", "ENhP0erR"], "description": [{"language": "zzPQbh3x", "message": ["5wB6bFUF", "NIJYZQ2G", "ohgv0pqH"]}, {"language": "oRwjQadf", "message": ["BdO2iTE1", "BOQpDwGt", "n1K9E3JF"]}, {"language": "xojtHIZJ", "message": ["54onFRBj", "KYgZ0uU3", "uWmjjdMc"]}], "isCustomRegex": true, "letterCase": "zFgbL4Sg", "maxLength": 98, "maxRepeatingAlphaNum": 22, "maxRepeatingSpecialCharacter": 43, "minCharType": 48, "minLength": 24, "profanityFilter": "m8tqgG8W", "regex": "yuZkWhQn", "specialCharacterLocation": "TO6L2B9K", "specialCharacters": ["9n7d31dz", "sHYGPf1x", "JGM1r26g"]}}]' \
    > test.out 2>&1
eval_tap $? 113 'AdminUpdateInputValidations' test.out

#- 114 AdminResetInputValidations
./ng net.accelbyte.sdk.cli.Main iam adminResetInputValidations \
    --field '1bB7Tso4' \
    > test.out 2>&1
eval_tap $? 114 'AdminResetInputValidations' test.out

#- 115 ListAdminsV3
./ng net.accelbyte.sdk.cli.Main iam listAdminsV3 \
    --namespace "$AB_NAMESPACE" \
    --after 'FTiEh107' \
    --before 'ODYsIDpT' \
    --endDate '8WcuTzAm' \
    --limit '52' \
    --query 'T8WtnrQe' \
    --roleId '9dZvSC7i' \
    --startDate 'uljonjmJ' \
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
    --body '{"ageRestriction": 60, "enable": false}' \
    > test.out 2>&1
eval_tap $? 117 'AdminUpdateAgeRestrictionConfigV3' test.out

#- 118 AdminGetListCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminGetListCountryAgeRestrictionV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 118 'AdminGetListCountryAgeRestrictionV3' test.out

#- 119 AdminUpdateCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateCountryAgeRestrictionV3 \
    --countryCode 'aR0AHJpO' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ageRestriction": 21}' \
    > test.out 2>&1
eval_tap $? 119 'AdminUpdateCountryAgeRestrictionV3' test.out

#- 120 AdminGetBannedUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType 'Aww5P7Hw' \
    --limit '15' \
    --offset '66' \
    > test.out 2>&1
eval_tap $? 120 'AdminGetBannedUsersV3' test.out

#- 121 AdminBanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"ban": "gFkvyXaB", "comment": "kdRTe2z1", "endDate": "Vbsadm3h", "reason": "i3G9hCaS", "skipNotif": false, "userIds": ["6rBWilZr", "gtyTuLHR", "KlEpWAYF"]}' \
    > test.out 2>&1
eval_tap $? 121 'AdminBanUserBulkV3' test.out

#- 122 AdminUnbanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminUnbanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"bans": [{"banId": "JKLe7ErY", "userId": "2zk4lpcK"}, {"banId": "wclOUZgu", "userId": "t9bem7M7"}, {"banId": "9ZbtWiIn", "userId": "5XJRqapi"}]}' \
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
    --clientId 'VOtVUeop' \
    --clientName 'M9Uo6NUp' \
    --clientType 'qbaYe4YW' \
    --limit '62' \
    --offset '91' \
    --skipLoginQueue  \
    > test.out 2>&1
eval_tap $? 124 'AdminGetClientsByNamespaceV3' test.out

#- 125 AdminBulkUpdateClientsV3
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateClientsV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientIds": ["5NqMuAG6", "o5rEaJ5b", "ZMigOESz"], "clientUpdateRequest": {"audiences": ["6V9lNYhq", "QjsNmPXY", "tTt3GVsh"], "baseUri": "NfWevNAA", "clientName": "ZPs3VdS7", "clientPermissions": [{"action": 14, "resource": "DZWxNYr8", "schedAction": 20, "schedCron": "sBOEjt9q", "schedRange": ["7PcuplLV", "Yc7zWXHv", "0eAmDrK2"]}, {"action": 42, "resource": "yGcpwEYt", "schedAction": 46, "schedCron": "5G3khaKJ", "schedRange": ["gYCvyIgR", "VcXCU2ZL", "MUd1nwsK"]}, {"action": 32, "resource": "PyZn8ahC", "schedAction": 19, "schedCron": "WHRSEt0v", "schedRange": ["hRba9EAf", "AfQJ3UvD", "mx1dgEPm"]}], "clientPlatform": "H6F0DuM8", "deletable": false, "description": "zl0ghQIJ", "modulePermissions": [{"moduleId": "Vgu2Gwnp", "selectedGroups": [{"groupId": "4I29iTQ3", "selectedActions": [79, 1, 41]}, {"groupId": "ocHm2VpK", "selectedActions": [21, 99, 53]}, {"groupId": "2qxj8Tvk", "selectedActions": [63, 59, 71]}]}, {"moduleId": "SLezUorF", "selectedGroups": [{"groupId": "XWCYItPe", "selectedActions": [22, 42, 39]}, {"groupId": "PLySKZcd", "selectedActions": [47, 73, 28]}, {"groupId": "8GQkeLRq", "selectedActions": [19, 25, 97]}]}, {"moduleId": "i09duUZ8", "selectedGroups": [{"groupId": "ySaiuB5O", "selectedActions": [56, 38, 47]}, {"groupId": "RBmKfsxi", "selectedActions": [44, 52, 28]}, {"groupId": "hxQqJWbt", "selectedActions": [83, 65, 97]}]}], "namespace": "uAUC5sLM", "oauthAccessTokenExpiration": 7, "oauthAccessTokenExpirationTimeUnit": "hfgZKRVt", "oauthRefreshTokenExpiration": 77, "oauthRefreshTokenExpirationTimeUnit": "Dr0y2X7n", "redirectUri": "AL0MLZmO", "scopes": ["uUtz0A88", "7z1MDD5r", "ZUrKNKDm"], "skipLoginQueue": true, "twoFactorEnabled": true}}' \
    > test.out 2>&1
eval_tap $? 125 'AdminBulkUpdateClientsV3' test.out

#- 126 AdminCreateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateClientV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["0FMmNsac", "vzrXypQD", "WJHu5dNo"], "baseUri": "FXacME7z", "clientId": "OGzdRrTc", "clientName": "xIaU4eI6", "clientPermissions": [{"action": 11, "resource": "ksdOVeVT", "schedAction": 91, "schedCron": "ef197JFU", "schedRange": ["lS7MOlQY", "3eFOrFA2", "1BabPhIG"]}, {"action": 74, "resource": "AuYFxOgO", "schedAction": 34, "schedCron": "QiLsHF4i", "schedRange": ["OSuJtwmQ", "mGgY7MkH", "QA6ybZ7N"]}, {"action": 29, "resource": "IOYt3n4M", "schedAction": 80, "schedCron": "zGZQOrEi", "schedRange": ["B3drLUC5", "Wq4pw2t8", "05vbNkNr"]}], "clientPlatform": "shEyhhLA", "deletable": false, "description": "bgIvFOJz", "modulePermissions": [{"moduleId": "Tfq92NRT", "selectedGroups": [{"groupId": "cIaXuNKp", "selectedActions": [2, 37, 50]}, {"groupId": "i6IFW0Uf", "selectedActions": [48, 6, 75]}, {"groupId": "Bk7Qr9BJ", "selectedActions": [96, 36, 73]}]}, {"moduleId": "dD4G6zDL", "selectedGroups": [{"groupId": "8Kq6uVbQ", "selectedActions": [98, 76, 87]}, {"groupId": "SWkCGDf4", "selectedActions": [76, 90, 3]}, {"groupId": "ldu2nved", "selectedActions": [10, 19, 74]}]}, {"moduleId": "B5jW6kuH", "selectedGroups": [{"groupId": "GGuldzDy", "selectedActions": [46, 64, 91]}, {"groupId": "pOlBF5hK", "selectedActions": [88, 30, 92]}, {"groupId": "keOzhZ0g", "selectedActions": [78, 17, 32]}]}], "namespace": "lmDqP9wD", "oauthAccessTokenExpiration": 71, "oauthAccessTokenExpirationTimeUnit": "muj2Yq3c", "oauthClientType": "roZGPgL3", "oauthRefreshTokenExpiration": 58, "oauthRefreshTokenExpirationTimeUnit": "3o3Fg2U6", "parentNamespace": "m0haqaRq", "redirectUri": "DeKnxVod", "scopes": ["QooNWBOa", "UppJ4ang", "REvsUD2Z"], "secret": "sGpYvTkz", "skipLoginQueue": false, "twoFactorEnabled": false}' \
    > test.out 2>&1
eval_tap $? 126 'AdminCreateClientV3' test.out

#- 127 AdminGetClientsbyNamespacebyIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetClientsbyNamespacebyIDV3 \
    --clientId 'vcU3zsh0' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 127 'AdminGetClientsbyNamespacebyIDV3' test.out

#- 128 AdminDeleteClientV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientV3 \
    --clientId 'WJdLyx8N' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 128 'AdminDeleteClientV3' test.out

#- 129 AdminUpdateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientV3 \
    --clientId 'YyNIljbi' \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["2SBxrh0F", "uBsx7dpI", "W9jN0RRS"], "baseUri": "p6CpCYWt", "clientName": "OcKsEDvC", "clientPermissions": [{"action": 43, "resource": "H29DRzN1", "schedAction": 26, "schedCron": "SFvjrNqt", "schedRange": ["IJkITDK4", "HEYF8Fgx", "napjnqCo"]}, {"action": 3, "resource": "iF0fPwXE", "schedAction": 91, "schedCron": "N7369lDP", "schedRange": ["dVpfBOUs", "0mQFmszV", "azHR60aa"]}, {"action": 50, "resource": "zVz8gGx1", "schedAction": 57, "schedCron": "WIdtPaYW", "schedRange": ["2Njmkj7p", "GJmsQp8e", "Jw8KSq1j"]}], "clientPlatform": "ybuRS75q", "deletable": false, "description": "iOxJvDnP", "modulePermissions": [{"moduleId": "gFXmXuVx", "selectedGroups": [{"groupId": "f5ox6Mj5", "selectedActions": [56, 81, 14]}, {"groupId": "5vwxzQ6P", "selectedActions": [91, 22, 1]}, {"groupId": "ciTmRB2D", "selectedActions": [54, 40, 69]}]}, {"moduleId": "tOdIu72a", "selectedGroups": [{"groupId": "9EmBBSJ5", "selectedActions": [7, 23, 42]}, {"groupId": "iDeV0sXu", "selectedActions": [69, 76, 93]}, {"groupId": "xBb2sCUv", "selectedActions": [89, 67, 56]}]}, {"moduleId": "lsACLGsE", "selectedGroups": [{"groupId": "OOIebIi8", "selectedActions": [35, 0, 26]}, {"groupId": "KYGRVSWH", "selectedActions": [78, 12, 39]}, {"groupId": "dn8ncVCa", "selectedActions": [55, 10, 33]}]}], "namespace": "qXwaZe90", "oauthAccessTokenExpiration": 18, "oauthAccessTokenExpirationTimeUnit": "ZfwicFxU", "oauthRefreshTokenExpiration": 60, "oauthRefreshTokenExpirationTimeUnit": "25hAyoCZ", "redirectUri": "OUAytaIa", "scopes": ["xRMnQG1p", "lSWJGbgg", "KXJSfSEE"], "skipLoginQueue": true, "twoFactorEnabled": true}' \
    > test.out 2>&1
eval_tap $? 129 'AdminUpdateClientV3' test.out

#- 130 AdminUpdateClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientPermissionV3 \
    --clientId 'QfImTbG6' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 51, "resource": "xNZbbVLJ"}, {"action": 73, "resource": "4krr9rnP"}, {"action": 14, "resource": "S3CUx2VG"}]}' \
    > test.out 2>&1
eval_tap $? 130 'AdminUpdateClientPermissionV3' test.out

#- 131 AdminAddClientPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddClientPermissionsV3 \
    --clientId 'QjwTOgaR' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 43, "resource": "GrfTYWfd"}, {"action": 6, "resource": "tKnQjsCy"}, {"action": 39, "resource": "HuM2aW1v"}]}' \
    > test.out 2>&1
eval_tap $? 131 'AdminAddClientPermissionsV3' test.out

#- 132 AdminDeleteClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientPermissionV3 \
    --action '93' \
    --clientId '0Uj3u7gq' \
    --namespace "$AB_NAMESPACE" \
    --resource 'vMsULTZy' \
    > test.out 2>&1
eval_tap $? 132 'AdminDeleteClientPermissionV3' test.out

#- 133 AdminGetConfigValueV3
./ng net.accelbyte.sdk.cli.Main iam adminGetConfigValueV3 \
    --configKey 'xgP9RsMg' \
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
    --body '{"blacklist": ["gMiVzwbS", "M9hN7yL1", "N55gUWSE"]}' \
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
    --body '{"active": false, "roleIds": ["kY3LZg5P", "jpcHUDHx", "cjz5wNCH"]}' \
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
    --limit '65' \
    --offset '67' \
    > test.out 2>&1
eval_tap $? 141 'RetrieveAllSSOLoginPlatformCredentialV3' test.out

#- 142 RetrieveThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Eru1quVR' \
    > test.out 2>&1
eval_tap $? 142 'RetrieveThirdPartyLoginPlatformCredentialV3' test.out

#- 143 AddThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam addThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'a1M63abc' \
    --body '{"ACSURL": "U22tNacz", "AWSCognitoRegion": "IWAqU2rI", "AWSCognitoUserPool": "RGbU1rdp", "AllowedClients": ["EuyCmxgN", "dVKwAorn", "8udxqFxp"], "AppId": "QheDX5L6", "AuthorizationEndpoint": "lrTVD9vI", "ClientId": "jYOKMKsp", "EmptyStrFieldList": ["L3M1NRez", "880gyx8o", "FkoC7i7j"], "EnableServerLicenseValidation": false, "Environment": "Ibpgq9GU", "FederationMetadataURL": "3747klqj", "GenericOauthFlow": true, "IncludePUID": true, "IsActive": false, "Issuer": "y5fUI0YC", "JWKSEndpoint": "dpyig6pl", "KeyID": "huh69VM3", "LogoURL": "j9YllNfy", "NetflixCertificates": {"encryptedPrivateKey": "fwPpqwYJ", "encryptedPrivateKeyName": "jveAJNrb", "publicCertificate": "6sJ9JVym", "publicCertificateName": "BhplB0FO", "rootCertificate": "sxekKUK8", "rootCertificateName": "EnfeoMaw"}, "OrganizationId": "jBf8odHB", "PlatformName": "7fkVbhvm", "RedirectUri": "3L4JXp9L", "RegisteredDomains": [{"affectedClientIDs": ["UX1gJr4c", "hWKUAEC3", "fzcOp3K0"], "domain": "F4xjiae3", "namespaces": ["InbADaku", "J6d8YnUV", "PdYvRT33"], "roleId": "FLwLrDWo", "ssoCfg": {"googleKey": {"8i2NDSaD": {}, "vZIhaPZf": {}, "12VCvSX6": {}}, "groupConfigs": [{"assignNamespaces": ["hioEe0qm", "B0m5FGgn", "3QGc6zl8"], "group": "u50Rjta0", "roleId": "ORsjFwsc"}, {"assignNamespaces": ["q9rsP0C0", "l3mIKJoO", "GjXH9PEQ"], "group": "aseZAixJ", "roleId": "9GMTHqhe"}, {"assignNamespaces": ["uYFOIyXJ", "wJ1XolAt", "YDFBpR8z"], "group": "c2NInVtp", "roleId": "Jl8MsPpw"}]}}, {"affectedClientIDs": ["qYRmgPa9", "4GfuyNvG", "AaiYnpLO"], "domain": "75fTQh2e", "namespaces": ["07Xq6cjJ", "KUA7mzd8", "e8Y1EpCw"], "roleId": "AtyeQXy4", "ssoCfg": {"googleKey": {"Pj0SAATG": {}, "1BWxl08Z": {}, "zvc4D1zy": {}}, "groupConfigs": [{"assignNamespaces": ["i4rxmYZD", "3ZeEGZCh", "IrT6uRNB"], "group": "s9fIZ8Sh", "roleId": "x07xsciy"}, {"assignNamespaces": ["1rOla6Qv", "cL79l8LR", "a9X9aMji"], "group": "a1ZdIqh4", "roleId": "yjCv1zZx"}, {"assignNamespaces": ["CALNPrwd", "AOwjvPdy", "wuMmf6xO"], "group": "DFdQ6CB2", "roleId": "uuC0sbcf"}]}}, {"affectedClientIDs": ["xhAZIqrI", "TqfcxaGn", "hEBxgvoX"], "domain": "XQ5U4t5t", "namespaces": ["CP25YSoP", "wPwmlWE7", "OYyJoP2p"], "roleId": "9EFuxkqD", "ssoCfg": {"googleKey": {"NaJ5w6qk": {}, "LrCDgi06": {}, "9095KGXw": {}}, "groupConfigs": [{"assignNamespaces": ["eLLTend4", "IwMVuvu1", "Evpi8AjO"], "group": "9JOw2f8L", "roleId": "lhicdaU9"}, {"assignNamespaces": ["rT1WsXNQ", "IZqSSjy3", "6cwoBRyj"], "group": "87Mu0MIQ", "roleId": "noaEvSoR"}, {"assignNamespaces": ["gIDs78fl", "DWpEj6mb", "6xfGNuXj"], "group": "5lyQUoiU", "roleId": "hlkx3G46"}]}}], "Secret": "aZKnsKML", "TeamID": "YQi2YQuk", "TokenAuthenticationType": "aDutZ2mz", "TokenClaimsMapping": {"e4Zo6Exp": "9Yw4DAec", "ZSk8rkqa": "OC8mVDvu", "ioiivzet": "HIlzvWps"}, "TokenEndpoint": "3ybRLqTS", "UserInfoEndpoint": "2jwysLeB", "UserInfoHTTPMethod": "2nqrtMsm", "googleAdminConsoleKey": "R8JAiqr5", "scopes": ["7fMWeuf1", "KyraiYUJ", "CGAN5xBr"]}' \
    > test.out 2>&1
eval_tap $? 143 'AddThirdPartyLoginPlatformCredentialV3' test.out

#- 144 DeleteThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '1ct2mZQq' \
    > test.out 2>&1
eval_tap $? 144 'DeleteThirdPartyLoginPlatformCredentialV3' test.out

#- 145 UpdateThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Kxsr7nEH' \
    --body '{"ACSURL": "Le92hHwJ", "AWSCognitoRegion": "vb9c4jnk", "AWSCognitoUserPool": "hESw7pDp", "AllowedClients": ["vDPhTrBk", "f7I0zAgF", "PzzEXAJS"], "AppId": "FQABlqxS", "AuthorizationEndpoint": "S7ff5CKP", "ClientId": "tA9hHAXk", "EmptyStrFieldList": ["1LD8qzw5", "Tzh6qDfm", "F94PExXv"], "EnableServerLicenseValidation": true, "Environment": "hQ8sqqOQ", "FederationMetadataURL": "V4Lgbh5d", "GenericOauthFlow": true, "IncludePUID": true, "IsActive": false, "Issuer": "G7CBsMSn", "JWKSEndpoint": "mBV5Rzvn", "KeyID": "jnIj3bw4", "LogoURL": "91H9uqYd", "NetflixCertificates": {"encryptedPrivateKey": "F7GUuYiC", "encryptedPrivateKeyName": "SHH7O1aq", "publicCertificate": "KVmJDk1T", "publicCertificateName": "Z7H2duik", "rootCertificate": "xZzQOcWR", "rootCertificateName": "KTImauIq"}, "OrganizationId": "Re4r64df", "PlatformName": "raqQPMgV", "RedirectUri": "rzr2KLlI", "RegisteredDomains": [{"affectedClientIDs": ["oToCo4Zu", "JMb3eHlk", "rW1DNMae"], "domain": "5Biz5XJr", "namespaces": ["vG4WVTDs", "nnSpwFza", "SB0jGY8j"], "roleId": "cxMjTl4a", "ssoCfg": {"googleKey": {"DaHZdMZK": {}, "8BmwMr1E": {}, "3WfxxPWe": {}}, "groupConfigs": [{"assignNamespaces": ["TmyE6vo9", "kGvTSbc7", "TQ5kVhYR"], "group": "MVFRQY9C", "roleId": "w1DJv6jH"}, {"assignNamespaces": ["FDPJDRhO", "PpME4NWh", "MHGlSDyo"], "group": "BxNkEb5A", "roleId": "YPmRbHHn"}, {"assignNamespaces": ["ELdr2QGL", "Ru00UR1t", "VbsYYX78"], "group": "HWDNOY13", "roleId": "fdMSAMAR"}]}}, {"affectedClientIDs": ["o744DIJv", "cONHaegN", "tCwJwcZh"], "domain": "QzRkv4o7", "namespaces": ["5dSNyppK", "eeYgj294", "1h1dezxb"], "roleId": "21KM4BEv", "ssoCfg": {"googleKey": {"ul9F8v1L": {}, "Xn4sdszB": {}, "PtpV02m3": {}}, "groupConfigs": [{"assignNamespaces": ["RPVGer0n", "qaMvMDgF", "25dnT3As"], "group": "Jg77Zbvo", "roleId": "VKeQN8wh"}, {"assignNamespaces": ["Ttx5Lztq", "schsDGhr", "kNTTMu27"], "group": "Tgam9D1k", "roleId": "z6swKt3l"}, {"assignNamespaces": ["cQZ6rIRD", "dxFIdpBq", "y8qEFPku"], "group": "rtG2ezX4", "roleId": "a7kGJX7c"}]}}, {"affectedClientIDs": ["vn6VqG8n", "yOHTq7Jt", "chORi3hW"], "domain": "2jTZX5C2", "namespaces": ["JDjvgDkm", "flCdOK6W", "P916mE7l"], "roleId": "Od7VABOW", "ssoCfg": {"googleKey": {"ty41TO4A": {}, "P6iZcSS7": {}, "ML48NKmY": {}}, "groupConfigs": [{"assignNamespaces": ["5PSZmqA5", "XnxCLPhO", "bbad6JSM"], "group": "fexuYvyd", "roleId": "TC5epQS0"}, {"assignNamespaces": ["xgW6oy9Q", "tsxrhpna", "R3wcsxBU"], "group": "3EqykoD9", "roleId": "cjsqo9Mu"}, {"assignNamespaces": ["5d6nyn0A", "Os8OpluN", "2D7jQwNc"], "group": "81QkOE4A", "roleId": "1h4d0RqP"}]}}], "Secret": "bDp1LUS3", "TeamID": "523yBaL5", "TokenAuthenticationType": "Qxl7vK71", "TokenClaimsMapping": {"9uHjn3L2": "jgAr3dfP", "OpsBj7Et": "C3BfCmgI", "zw3cbMUZ": "SafUXAjU"}, "TokenEndpoint": "Lryr59VU", "UserInfoEndpoint": "SFQdxIaO", "UserInfoHTTPMethod": "k5POqyYn", "googleAdminConsoleKey": "7b4WuKWS", "scopes": ["Qs6rMG7q", "dXiHed50", "g3RbT4YN"]}' \
    > test.out 2>&1
eval_tap $? 145 'UpdateThirdPartyLoginPlatformCredentialV3' test.out

#- 146 UpdateThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'R2KLrnqP' \
    --body '{"affectedClientIDs": ["BA1n3oHF", "gEVIcF4u", "hA06Me2f"], "assignedNamespaces": ["hNJg2t29", "iJuIrqns", "QGjvufaU"], "domain": "6Tz9sWEL", "roleId": "qj78VkkH", "ssoCfg": {"googleKey": {"Hbpy6x7P": {}, "aOxhUQJN": {}, "Lc6pVkmT": {}}, "groupConfigs": [{"assignNamespaces": ["fEqqqovZ", "bSpEeJDD", "Ko3vPkZw"], "group": "OlA4GLhB", "roleId": "MoNTULTz"}, {"assignNamespaces": ["jrwAf8rk", "ABS7Bd65", "8jMylDWc"], "group": "CCqL8MkM", "roleId": "pSCEVMZd"}, {"assignNamespaces": ["QOLypiEC", "f7lX3Yxp", "i1MSCnpx"], "group": "dRMCzQxF", "roleId": "yuL6JU52"}]}}' \
    > test.out 2>&1
eval_tap $? 146 'UpdateThirdPartyLoginPlatformDomainV3' test.out

#- 147 DeleteThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'hnz7RYDT' \
    --body '{"domain": "NQFkd7Mf", "ssoGroups": ["4dJ5LZYq", "mk556s0X", "XXuwOT25"]}' \
    > test.out 2>&1
eval_tap $? 147 'DeleteThirdPartyLoginPlatformDomainV3' test.out

#- 148 PartialUpdateThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam partialUpdateThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'ihxX6a4V' \
    --body '{"affectedClientIDs": ["qCfaZrTv", "EAxIY352", "wDOjTnxu"], "assignedNamespaces": ["hzMc8pOy", "E04aKlrD", "YeJCP7kL"], "domain": "GaOSxChH", "roleId": "xOxMYLJW", "ssoCfg": {"googleKey": {"eoRXtSfJ": {}, "bU13CGaQ": {}, "Hy75qcMy": {}}, "groupConfigs": [{"assignNamespaces": ["zP8s4MHI", "7LpE0sZd", "o43SSRuF"], "group": "2FvMSB0K", "roleId": "NMLDBdaS"}, {"assignNamespaces": ["0wdYzWq8", "13IthosM", "nDJFYNy5"], "group": "nJdmbS1T", "roleId": "Kr47krsj"}, {"assignNamespaces": ["X2ftrL6x", "LBOv2DxT", "LoK5vmcn"], "group": "kWoYbEut", "roleId": "1peIhaJ6"}]}}' \
    > test.out 2>&1
eval_tap $? 148 'PartialUpdateThirdPartyLoginPlatformDomainV3' test.out

#- 149 RetrieveSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam retrieveSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'qtJnuDyc' \
    > test.out 2>&1
eval_tap $? 149 'RetrieveSSOLoginPlatformCredential' test.out

#- 150 AddSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam addSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'xrKfXNsJ' \
    --body '{"acsUrl": "fx5BMcq9", "apiKey": "Sf7K3a1F", "appId": "ex7aWOi9", "federationMetadataUrl": "i2DUS3W3", "isActive": true, "redirectUri": "M0IsCZeW", "secret": "uOJKL1Ob", "ssoUrl": "wQZhUex6"}' \
    > test.out 2>&1
eval_tap $? 150 'AddSSOLoginPlatformCredential' test.out

#- 151 DeleteSSOLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteSSOLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '095G4Mln' \
    > test.out 2>&1
eval_tap $? 151 'DeleteSSOLoginPlatformCredentialV3' test.out

#- 152 UpdateSSOPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam updateSSOPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId '2AvakWuE' \
    --body '{"acsUrl": "i0cVkFqb", "apiKey": "FC4T7FU4", "appId": "9Gr327lX", "federationMetadataUrl": "FduhhItf", "isActive": true, "redirectUri": "GZ4qtK2N", "secret": "m24Ms2Zp", "ssoUrl": "l6OjCuSD"}' \
    > test.out 2>&1
eval_tap $? 152 'UpdateSSOPlatformCredential' test.out

#- 153 AdminListUserIDByPlatformUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByPlatformUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Ss7d65S5' \
    --rawPID  \
    --rawPUID  \
    --body '{"platformUserIds": ["Vw3mIhF3", "FVhuH5TF", "cG9aEW0N"]}' \
    > test.out 2>&1
eval_tap $? 153 'AdminListUserIDByPlatformUserIDsV3' test.out

#- 154 AdminGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'pcqTmkCL' \
    --platformUserId '41ie1UQb' \
    --pidType 'xI2aifKT' \
    > test.out 2>&1
eval_tap $? 154 'AdminGetUserByPlatformUserIDV3' test.out

#- 155 AdminGetProfileUpdateStrategyV3
./ng net.accelbyte.sdk.cli.Main iam adminGetProfileUpdateStrategyV3 \
    --namespace "$AB_NAMESPACE" \
    --field 'username' \
    > test.out 2>&1
eval_tap $? 155 'AdminGetProfileUpdateStrategyV3' test.out

#- 156 AdminUpdateProfileUpdateStrategyV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateProfileUpdateStrategyV3 \
    --namespace "$AB_NAMESPACE" \
    --field 'dob' \
    --body '{"config": {"minimumAllowedInterval": 79}, "type": "0Fs4u4uV"}' \
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
    --identity 'VIEW_ONLY' \
    --body '{"additions": [{"actions": [40, 36, 5], "resource": "qe0u1pFZ"}, {"actions": [75, 12, 45], "resource": "WpoELltH"}, {"actions": [95, 34, 41], "resource": "EULQjwwl"}], "exclusions": [{"actions": [84, 53, 17], "resource": "fOFssbhc"}, {"actions": [89, 2, 57], "resource": "OvEe2LVk"}, {"actions": [73, 81, 11], "resource": "kMdVJGQo"}], "overrides": [{"actions": [28, 3, 12], "resource": "sxU8lYSx"}, {"actions": [45, 25, 89], "resource": "ImP18CLE"}, {"actions": [60, 34, 51], "resource": "EflUKsWo"}], "replacements": [{"replacement": {"actions": [10, 87, 2], "resource": "U9g6H3bo"}, "target": "xm0IR1M4"}, {"replacement": {"actions": [88, 89, 10], "resource": "hovB0Jxk"}, "target": "NPQHDb7M"}, {"replacement": {"actions": [15, 33, 38], "resource": "mDNE768D"}, "target": "aYuwFApv"}]}' \
    > test.out 2>&1
eval_tap $? 158 'AdminUpdateRoleOverrideConfigV3' test.out

#- 159 AdminGetRoleSourceV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleSourceV3 \
    --namespace "$AB_NAMESPACE" \
    --identity 'USER' \
    > test.out 2>&1
eval_tap $? 159 'AdminGetRoleSourceV3' test.out

#- 160 AdminChangeRoleOverrideConfigStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminChangeRoleOverrideConfigStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --identity 'VIEW_ONLY' \
    --body '{"active": false}' \
    > test.out 2>&1
eval_tap $? 160 'AdminChangeRoleOverrideConfigStatusV3' test.out

#- 161 AdminGetRoleNamespacePermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleNamespacePermissionV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId '0k5ADmPU' \
    > test.out 2>&1
eval_tap $? 161 'AdminGetRoleNamespacePermissionV3' test.out

#- 162 GetAdminUsersByRoleIdV3
./ng net.accelbyte.sdk.cli.Main iam getAdminUsersByRoleIdV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'YhvYlzns' \
    --after '23' \
    --before '35' \
    --limit '7' \
    > test.out 2>&1
eval_tap $? 162 'GetAdminUsersByRoleIdV3' test.out

#- 163 AdminQueryTagV3
./ng net.accelbyte.sdk.cli.Main iam adminQueryTagV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '0' \
    --offset '1' \
    --tagName 'Lp5SvVQ2' \
    > test.out 2>&1
eval_tap $? 163 'AdminQueryTagV3' test.out

#- 164 AdminCreateTagV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateTagV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"tagName": "2hVI8hw9"}' \
    > test.out 2>&1
eval_tap $? 164 'AdminCreateTagV3' test.out

#- 165 AdminUpdateTagV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateTagV3 \
    --namespace "$AB_NAMESPACE" \
    --tagId 'xx4oeLHF' \
    --body '{"tagName": "p3fwBD2l"}' \
    > test.out 2>&1
eval_tap $? 165 'AdminUpdateTagV3' test.out

#- 166 AdminDeleteTagV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteTagV3 \
    --namespace "$AB_NAMESPACE" \
    --tagId 'iGTjTmZn' \
    > test.out 2>&1
eval_tap $? 166 'AdminDeleteTagV3' test.out

#- 167 AdminGetUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --emailAddress 'GC4dwHFr' \
    > test.out 2>&1
eval_tap $? 167 'AdminGetUserByEmailAddressV3' test.out

#- 168 AdminBulkUpdateUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"updateRequest": {"skipLoginQueue": true}, "userIds": ["lRTfglBY", "9d3ORCsM", "KGMtkruV"]}' \
    > test.out 2>&1
eval_tap $? 168 'AdminBulkUpdateUsersV3' test.out

#- 169 AdminGetBulkUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType 'boaNKNec' \
    --body '{"bulkUserId": ["9VoBc4Dg", "ny37sTlt", "R87cgOzD"]}' \
    > test.out 2>&1
eval_tap $? 169 'AdminGetBulkUserBanV3' test.out

#- 170 AdminListUserIDByUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"findByPublisherNamespace": true, "userIds": ["68RgPGTX", "Svht1Zrs", "aP8EezGB"]}' \
    > test.out 2>&1
eval_tap $? 170 'AdminListUserIDByUserIDsV3' test.out

#- 171 AdminBulkGetUsersPlatform
./ng net.accelbyte.sdk.cli.Main iam adminBulkGetUsersPlatform \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["vXxVV6S9", "DqiG8tDq", "X7ye9ooy"]}' \
    > test.out 2>&1
eval_tap $? 171 'AdminBulkGetUsersPlatform' test.out

#- 172 AdminCursorGetUserV3
./ng net.accelbyte.sdk.cli.Main iam adminCursorGetUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"cursor": {"cursorTime": "ZIADMy5E", "userId": "fKcDZsAn"}, "fields": ["hPrkdwUL", "A3eVMjDm", "eNCSr1Bx"], "limit": 72}' \
    > test.out 2>&1
eval_tap $? 172 'AdminCursorGetUserV3' test.out

#- 173 AdminInviteUserV3
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddresses": ["mZ8WDPwo", "SGpj6iD5", "TVJksoPy"], "isAdmin": false, "languageTag": "kryJ2EJF", "namespace": "lCAjrQh9", "roles": ["DqKXUscz", "6mz5kw58", "gh9pmUcZ"]}' \
    > test.out 2>&1
eval_tap $? 173 'AdminInviteUserV3' test.out

#- 174 AdminQueryThirdPlatformLinkHistoryV3
./ng net.accelbyte.sdk.cli.Main iam adminQueryThirdPlatformLinkHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '36' \
    --offset '75' \
    --platformUserId 'LUtk55oh' \
    --platformId 'VS3NY8yW' \
    > test.out 2>&1
eval_tap $? 174 'AdminQueryThirdPlatformLinkHistoryV3' test.out

#- 175 AdminListUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminListUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '7' \
    --offset '6' \
    > test.out 2>&1
eval_tap $? 175 'AdminListUsersV3' test.out

#- 176 AdminSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam adminSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'nYmjocsb' \
    --endDate 'yZKw5AUP' \
    --includeTotal  \
    --limit '23' \
    --offset '55' \
    --platformBy 'iaMTMiju' \
    --platformId 'Fiv3rf1u' \
    --query 'lq9AABw0' \
    --roleIds 'hSD2x7ju' \
    --skipLoginQueue  \
    --startDate 'VHE9Te0f' \
    --tagIds 'LmmXieem' \
    --testAccount  \
    > test.out 2>&1
eval_tap $? 176 'AdminSearchUserV3' test.out

#- 177 AdminGetBulkUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"listEmailAddressRequest": ["y2RvllWT", "kHC2Op07", "lzrgUfig"]}' \
    > test.out 2>&1
eval_tap $? 177 'AdminGetBulkUserByEmailAddressV3' test.out

#- 178 AdminGetUserByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '3N4JOLJf' \
    > test.out 2>&1
eval_tap $? 178 'AdminGetUserByUserIdV3' test.out

#- 179 AdminUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'mgGXHYNq' \
    --body '{"avatarUrl": "WFzgA6Rg", "country": "akkWT3vU", "dateOfBirth": "EiSacxpl", "displayName": "Eqs03VNj", "languageTag": "EREjBc6u", "skipLoginQueue": true, "tags": ["G6XK0VjL", "MnD5W1mx", "HOaCKe16"], "uniqueDisplayName": "vySVjOOT", "userName": "wPk0mSQu"}' \
    > test.out 2>&1
eval_tap $? 179 'AdminUpdateUserV3' test.out

#- 180 AdminGetUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'CYqnZChM' \
    --activeOnly  \
    --after 'E0exRJKS' \
    --before 'kJ8mfqHq' \
    --limit '96' \
    > test.out 2>&1
eval_tap $? 180 'AdminGetUserBanV3' test.out

#- 181 AdminBanUserV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '5AWPHFIA' \
    --body '{"ban": "LMI4p31L", "comment": "cUupstIh", "endDate": "7Xq7KAdE", "reason": "7SoygQUr", "skipNotif": true}' \
    > test.out 2>&1
eval_tap $? 181 'AdminBanUserV3' test.out

#- 182 AdminGetUserBanSummaryV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanSummaryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'DfaeoJBj' \
    > test.out 2>&1
eval_tap $? 182 'AdminGetUserBanSummaryV3' test.out

#- 183 AdminUpdateUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserBanV3 \
    --banId 'cucJdBy6' \
    --namespace "$AB_NAMESPACE" \
    --userId 'sfl9L2of' \
    --body '{"enabled": false, "skipNotif": false}' \
    > test.out 2>&1
eval_tap $? 183 'AdminUpdateUserBanV3' test.out

#- 184 AdminSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'm793dndz' \
    --body '{"context": "jHgQM07l", "emailAddress": "waIddj2r", "languageTag": "1BHGDcyf", "upgradeToken": "0gJsPPqW"}' \
    > test.out 2>&1
eval_tap $? 184 'AdminSendVerificationCodeV3' test.out

#- 185 AdminVerifyAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'oWFZAUIj' \
    --body '{"Code": "MtB73km3", "ContactType": "tFt4Kffd", "LanguageTag": "UGr3Nvl5", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 185 'AdminVerifyAccountV3' test.out

#- 186 GetUserVerificationCode
./ng net.accelbyte.sdk.cli.Main iam getUserVerificationCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'SfPp7Pc0' \
    > test.out 2>&1
eval_tap $? 186 'GetUserVerificationCode' test.out

#- 187 AdminGetUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'HFRG9yIk' \
    > test.out 2>&1
eval_tap $? 187 'AdminGetUserDeletionStatusV3' test.out

#- 188 AdminUpdateUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'IAHGWYON' \
    --body '{"deletionDate": 79, "enabled": true}' \
    > test.out 2>&1
eval_tap $? 188 'AdminUpdateUserDeletionStatusV3' test.out

#- 189 AdminListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Xa7QPBcE' \
    > test.out 2>&1
eval_tap $? 189 'AdminListUserAllPlatformAccountsDistinctV3' test.out

#- 190 AdminUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'VBEmlV6L' \
    --body '{"code": "PbnNPLy3", "country": "2VGhttI2", "dateOfBirth": "M5ugnLDy", "displayName": "0NJl2gA6", "emailAddress": "fJ1q8Zy4", "password": "VGmjL3mX", "uniqueDisplayName": "dgWaJ6zr", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 190 'AdminUpgradeHeadlessAccountV3' test.out

#- 191 AdminDeleteUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '9TgVOaia' \
    > test.out 2>&1
eval_tap $? 191 'AdminDeleteUserInformationV3' test.out

#- 192 AdminGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'gHGDiZDu' \
    --after '0.7392649092427358' \
    --before '0.32427067602996096' \
    --limit '92' \
    > test.out 2>&1
eval_tap $? 192 'AdminGetUserLoginHistoriesV3' test.out

#- 193 AdminResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam adminResetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'uzPzhECq' \
    --body '{"languageTag": "GB4nDLxi", "mfaToken": "WNzH8Xyw", "newPassword": "D5R7NkOx", "oldPassword": "GMlOibXs"}' \
    > test.out 2>&1
eval_tap $? 193 'AdminResetPasswordV3' test.out

#- 194 AdminUpdateUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserPermissionV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '77NdqrDi' \
    --body '{"Permissions": [{"Action": 30, "Resource": "2OyOV9ZR", "SchedAction": 67, "SchedCron": "Wx2znmV0", "SchedRange": ["kZqylxZp", "6YipGOxj", "A33U3hvn"]}, {"Action": 71, "Resource": "xp2lEldZ", "SchedAction": 18, "SchedCron": "NHwgcGVs", "SchedRange": ["LwYXDAEP", "vb3eiZLb", "hTEvNUdJ"]}, {"Action": 58, "Resource": "Dm725KCy", "SchedAction": 100, "SchedCron": "p3mOk2UT", "SchedRange": ["77iFmvwp", "xggiEXMM", "3u6SGyyJ"]}]}' \
    > test.out 2>&1
eval_tap $? 194 'AdminUpdateUserPermissionV3' test.out

#- 195 AdminAddUserPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserPermissionsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'GHPUJIwu' \
    --body '{"Permissions": [{"Action": 11, "Resource": "Y5h3M8sH", "SchedAction": 19, "SchedCron": "8gyLASr0", "SchedRange": ["EHJVGNzO", "winaTC4o", "GzC0AGOo"]}, {"Action": 59, "Resource": "IX7EYNtC", "SchedAction": 54, "SchedCron": "nBJXwIEm", "SchedRange": ["Tiu88wB4", "0XzSWzkI", "bKXrxopv"]}, {"Action": 99, "Resource": "2kUy6oXU", "SchedAction": 69, "SchedCron": "yeEVPbiD", "SchedRange": ["aMoxmaAI", "r16pmVIp", "UBwXFMDx"]}]}' \
    > test.out 2>&1
eval_tap $? 195 'AdminAddUserPermissionsV3' test.out

#- 196 AdminDeleteUserPermissionBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ATtaSMJG' \
    --body '[{"Action": 13, "Resource": "6HGJIlYq"}, {"Action": 89, "Resource": "4wjD609L"}, {"Action": 42, "Resource": "rSx8fwxc"}]' \
    > test.out 2>&1
eval_tap $? 196 'AdminDeleteUserPermissionBulkV3' test.out

#- 197 AdminDeleteUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionV3 \
    --action '41' \
    --namespace "$AB_NAMESPACE" \
    --resource 'WYCBS097' \
    --userId 'kygXnq2c' \
    > test.out 2>&1
eval_tap $? 197 'AdminDeleteUserPermissionV3' test.out

#- 198 AdminGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'BzulPexT' \
    --after 'vregsUai' \
    --before 'De73nzNM' \
    --limit '54' \
    --platformId 'kUCDrz04' \
    --targetNamespace 'SXPK8w8x' \
    > test.out 2>&1
eval_tap $? 198 'AdminGetUserPlatformAccountsV3' test.out

#- 199 AdminListAllDistinctPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminListAllDistinctPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'hOI9LKXW' \
    --status 'mD6CsViN' \
    > test.out 2>&1
eval_tap $? 199 'AdminListAllDistinctPlatformAccountsV3' test.out

#- 200 AdminGetListJusticePlatformAccounts
./ng net.accelbyte.sdk.cli.Main iam adminGetListJusticePlatformAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'MUvxDL2m' \
    > test.out 2>&1
eval_tap $? 200 'AdminGetListJusticePlatformAccounts' test.out

#- 201 AdminGetUserMapping
./ng net.accelbyte.sdk.cli.Main iam adminGetUserMapping \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'vTbElNVY' \
    --userId 'EVMJ0IoS' \
    > test.out 2>&1
eval_tap $? 201 'AdminGetUserMapping' test.out

#- 202 AdminCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam adminCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'l2oMnoGh' \
    --userId 'z7kBFfXR' \
    > test.out 2>&1
eval_tap $? 202 'AdminCreateJusticeUser' test.out

#- 203 AdminLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'j31Sqi1O' \
    --skipConflict  \
    --body '{"platformId": "ysiYsyyr", "platformUserId": "x8IcQk4G"}' \
    > test.out 2>&1
eval_tap $? 203 'AdminLinkPlatformAccount' test.out

#- 204 AdminGetUserLinkHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLinkHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'V86vW8La' \
    --platformId 'pVXDS4Vm' \
    > test.out 2>&1
eval_tap $? 204 'AdminGetUserLinkHistoriesV3' test.out

#- 205 AdminPlatformUnlinkV3
eval_tap 0 205 'AdminPlatformUnlinkV3 # SKIP deprecated' test.out

#- 206 AdminPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'kwdCF77C' \
    --userId '6ZA85dxn' \
    > test.out 2>&1
eval_tap $? 206 'AdminPlatformUnlinkAllV3' test.out

#- 207 AdminPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Zlj5769e' \
    --userId 'iIN8ecKD' \
    --ticket '0Dl6TAW3' \
    > test.out 2>&1
eval_tap $? 207 'AdminPlatformLinkV3' test.out

#- 208 AdminDeleteUserLinkingHistoryByPlatformIDV3
eval_tap 0 208 'AdminDeleteUserLinkingHistoryByPlatformIDV3 # SKIP deprecated' test.out

#- 209 AdminDeleteUserLinkingRestrictionByPlatformIDV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserLinkingRestrictionByPlatformIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'oNSHZPo8' \
    --userId 'nmzi58Yn' \
    > test.out 2>&1
eval_tap $? 209 'AdminDeleteUserLinkingRestrictionByPlatformIDV3' test.out

#- 210 AdminGetThirdPartyPlatformTokenLinkStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetThirdPartyPlatformTokenLinkStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'CFCl3sHt' \
    --userId '8PmBqmKV' \
    --platformToken 'orjeonQN' \
    > test.out 2>&1
eval_tap $? 210 'AdminGetThirdPartyPlatformTokenLinkStatusV3' test.out

#- 211 AdminGetUserSinglePlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminGetUserSinglePlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --platformId 'ymk7HP9b' \
    --userId 'YvdcWsq7' \
    --crossNamespace  \
    > test.out 2>&1
eval_tap $? 211 'AdminGetUserSinglePlatformAccount' test.out

#- 212 AdminDeleteUserRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRolesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'REWZYRz1' \
    --body '["hu81P7dW", "dOhLwHTr", "6gVXVHos"]' \
    > test.out 2>&1
eval_tap $? 212 'AdminDeleteUserRolesV3' test.out

#- 213 AdminSaveUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminSaveUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'nDDJLW6N' \
    --body '[{"namespace": "gnbtSoqW", "roleId": "1VmSOt06"}, {"namespace": "45coo40c", "roleId": "BbOIDijV"}, {"namespace": "I6F8bhx2", "roleId": "KKyg6jca"}]' \
    > test.out 2>&1
eval_tap $? 213 'AdminSaveUserRoleV3' test.out

#- 214 AdminAddUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'p5epBTPI' \
    --userId 'W6uXN8xZ' \
    > test.out 2>&1
eval_tap $? 214 'AdminAddUserRoleV3' test.out

#- 215 AdminDeleteUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'rL6Y2hFJ' \
    --userId 'fiCDGkZb' \
    > test.out 2>&1
eval_tap $? 215 'AdminDeleteUserRoleV3' test.out

#- 216 AdminGetUserStateByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserStateByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'dwYN3GZw' \
    > test.out 2>&1
eval_tap $? 216 'AdminGetUserStateByUserIdV3' test.out

#- 217 AdminUpdateUserStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'DDs1Oelr' \
    --body '{"enabled": false, "reason": "UTcnBZC4"}' \
    > test.out 2>&1
eval_tap $? 217 'AdminUpdateUserStatusV3' test.out

#- 218 AdminTrustlyUpdateUserIdentity
./ng net.accelbyte.sdk.cli.Main iam adminTrustlyUpdateUserIdentity \
    --namespace "$AB_NAMESPACE" \
    --userId 'LKIasGXx' \
    --body '{"emailAddress": "3Eog6lXJ", "password": "GiC3jbgC"}' \
    > test.out 2>&1
eval_tap $? 218 'AdminTrustlyUpdateUserIdentity' test.out

#- 219 AdminVerifyUserWithoutVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyUserWithoutVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Flr8ol6k' \
    > test.out 2>&1
eval_tap $? 219 'AdminVerifyUserWithoutVerificationCodeV3' test.out

#- 220 AdminUpdateClientSecretV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientSecretV3 \
    --clientId 'sWmM7xON' \
    --namespace "$AB_NAMESPACE" \
    --body '{"newSecret": "Y0ytO74d"}' \
    > test.out 2>&1
eval_tap $? 220 'AdminUpdateClientSecretV3' test.out

#- 221 AdminCheckThirdPartyLoginPlatformAvailabilityV3
./ng net.accelbyte.sdk.cli.Main iam adminCheckThirdPartyLoginPlatformAvailabilityV3 \
    --platformId 'z4860efM' \
    > test.out 2>&1
eval_tap $? 221 'AdminCheckThirdPartyLoginPlatformAvailabilityV3' test.out

#- 222 AdminGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV3 \
    --after '1oUtygUn' \
    --before 'Yj8L3XzW' \
    --isWildcard  \
    --limit '37' \
    > test.out 2>&1
eval_tap $? 222 'AdminGetRolesV3' test.out

#- 223 AdminCreateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV3 \
    --body '{"adminRole": true, "deletable": true, "isWildcard": true, "managers": [{"displayName": "kZHs2G6s", "namespace": "0fcQJqnb", "userId": "0PVomcWj"}, {"displayName": "GFw367BN", "namespace": "NPwxrZrq", "userId": "5F1f1U2D"}, {"displayName": "Dr2BYHss", "namespace": "eiNDQXCD", "userId": "e0L9Lij9"}], "members": [{"displayName": "jzg5UCy1", "namespace": "NDJ8hVDq", "userId": "zvqw6hwP"}, {"displayName": "iOMh8O4x", "namespace": "JzcoGuXa", "userId": "mhShe979"}, {"displayName": "ufUGQWi4", "namespace": "cN06HkQS", "userId": "zTJE9NPa"}], "permissions": [{"action": 0, "resource": "Vrgb6hir", "schedAction": 4, "schedCron": "On17LuwH", "schedRange": ["hHedt5D5", "oIxx9cRw", "U4LHxMS4"]}, {"action": 46, "resource": "zzwGAnfr", "schedAction": 48, "schedCron": "C4nISagQ", "schedRange": ["ReQtzJoP", "mB3wWUxv", "AiJgWStU"]}, {"action": 3, "resource": "4NbKEZt2", "schedAction": 68, "schedCron": "LZ9nVoHd", "schedRange": ["RbLbljd9", "YNMjtAQg", "khEFu4nc"]}], "roleName": "43m8KT2g"}' \
    > test.out 2>&1
eval_tap $? 223 'AdminCreateRoleV3' test.out

#- 224 AdminGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV3 \
    --roleId 'XeSigO0F' \
    > test.out 2>&1
eval_tap $? 224 'AdminGetRoleV3' test.out

#- 225 AdminDeleteRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV3 \
    --roleId 'unjwUh0o' \
    > test.out 2>&1
eval_tap $? 225 'AdminDeleteRoleV3' test.out

#- 226 AdminUpdateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV3 \
    --roleId 'Oul8TgTq' \
    --body '{"deletable": true, "isWildcard": true, "roleName": "h52JjglF"}' \
    > test.out 2>&1
eval_tap $? 226 'AdminUpdateRoleV3' test.out

#- 227 AdminGetRoleAdminStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleAdminStatusV3 \
    --roleId 'kMCPMVDQ' \
    > test.out 2>&1
eval_tap $? 227 'AdminGetRoleAdminStatusV3' test.out

#- 228 AdminUpdateAdminRoleStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateAdminRoleStatusV3 \
    --roleId 'rIr38qNI' \
    > test.out 2>&1
eval_tap $? 228 'AdminUpdateAdminRoleStatusV3' test.out

#- 229 AdminRemoveRoleAdminV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleAdminV3 \
    --roleId 'VLo20zWA' \
    > test.out 2>&1
eval_tap $? 229 'AdminRemoveRoleAdminV3' test.out

#- 230 AdminGetRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleManagersV3 \
    --roleId 'aIfJUamK' \
    --after '3UFvESwu' \
    --before 'prvrBgOz' \
    --limit '87' \
    > test.out 2>&1
eval_tap $? 230 'AdminGetRoleManagersV3' test.out

#- 231 AdminAddRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleManagersV3 \
    --roleId 'u8DlCgki' \
    --body '{"managers": [{"displayName": "x3Kh6HtI", "namespace": "2HXIXk4F", "userId": "hu5xHuFC"}, {"displayName": "50caw51D", "namespace": "8eVufKhF", "userId": "sluJLOZn"}, {"displayName": "vYCLm3jX", "namespace": "EBvkXWHs", "userId": "SNh0ok0G"}]}' \
    > test.out 2>&1
eval_tap $? 231 'AdminAddRoleManagersV3' test.out

#- 232 AdminRemoveRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleManagersV3 \
    --roleId 'DNt7SJt6' \
    --body '{"managers": [{"displayName": "mCynpsEq", "namespace": "IMAFrhJf", "userId": "mxg6tXfv"}, {"displayName": "K0QCJiIe", "namespace": "iax7XPod", "userId": "R67yXI4i"}, {"displayName": "FsnkcUhj", "namespace": "w329L0cI", "userId": "RjJVVBuW"}]}' \
    > test.out 2>&1
eval_tap $? 232 'AdminRemoveRoleManagersV3' test.out

#- 233 AdminGetRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleMembersV3 \
    --roleId 'QnmnQPLf' \
    --after 'HVNKusbN' \
    --before 'czjUAVuE' \
    --limit '76' \
    > test.out 2>&1
eval_tap $? 233 'AdminGetRoleMembersV3' test.out

#- 234 AdminAddRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleMembersV3 \
    --roleId 'iRS9aOVn' \
    --body '{"members": [{"displayName": "iXjWxBRe", "namespace": "81X59avP", "userId": "8s1HMrww"}, {"displayName": "JBHghAqa", "namespace": "F197hLpo", "userId": "dC0WBSjV"}, {"displayName": "mOhQm0aS", "namespace": "XBeVajHX", "userId": "hsZ7JHow"}]}' \
    > test.out 2>&1
eval_tap $? 234 'AdminAddRoleMembersV3' test.out

#- 235 AdminRemoveRoleMembersV3
eval_tap 0 235 'AdminRemoveRoleMembersV3 # SKIP deprecated' test.out

#- 236 AdminUpdateRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV3 \
    --roleId '7q7embao' \
    --body '{"permissions": [{"action": 86, "resource": "g792kW0n", "schedAction": 1, "schedCron": "0U6rj0Ey", "schedRange": ["c85iNnp3", "x2qOUrlv", "tl9Saqyz"]}, {"action": 53, "resource": "2OdfWhvQ", "schedAction": 55, "schedCron": "ETE5vjD5", "schedRange": ["STVSySz1", "v51Dy7Q6", "YNf4fYee"]}, {"action": 41, "resource": "TwpP2Jmv", "schedAction": 97, "schedCron": "sZfYbLJZ", "schedRange": ["8WCnbiVz", "oGDcHZI1", "C9p6URmN"]}]}' \
    > test.out 2>&1
eval_tap $? 236 'AdminUpdateRolePermissionsV3' test.out

#- 237 AdminAddRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV3 \
    --roleId '8tICASvh' \
    --body '{"permissions": [{"action": 65, "resource": "l16909qN", "schedAction": 28, "schedCron": "0RdiGxdJ", "schedRange": ["qQSXsudV", "QhoGETKD", "uEUGRyL7"]}, {"action": 57, "resource": "MDlaAlrE", "schedAction": 27, "schedCron": "LwKiOFxs", "schedRange": ["LrsjJMDJ", "9AoMgFIs", "98ZGI2Zh"]}, {"action": 62, "resource": "r0EL170I", "schedAction": 37, "schedCron": "JMlRCaZV", "schedRange": ["KNMStaU3", "ZUywMC5h", "mc9hlMoj"]}]}' \
    > test.out 2>&1
eval_tap $? 237 'AdminAddRolePermissionsV3' test.out

#- 238 AdminDeleteRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV3 \
    --roleId 'oQJ7CP7c' \
    --body '["D7nD1bMZ", "en9z5VfX", "LRCbvUrs"]' \
    > test.out 2>&1
eval_tap $? 238 'AdminDeleteRolePermissionsV3' test.out

#- 239 AdminDeleteRolePermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionV3 \
    --action '31' \
    --resource 'wT9Cv7Cd' \
    --roleId 'xNnyGsU5' \
    > test.out 2>&1
eval_tap $? 239 'AdminDeleteRolePermissionV3' test.out

#- 240 AdminGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam adminGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 240 'AdminGetMyUserV3' test.out

#- 241 UserAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam userAuthenticationV3 \
    --clientId 'HAM8rOPo' \
    --extendExp  \
    --redirectUri 'DmS24iSx' \
    --password 'e1EiPTiN' \
    --requestId 'rhWxPV1z' \
    --userName 'lmnBhrL6' \
    > test.out 2>&1
eval_tap $? 241 'UserAuthenticationV3' test.out

#- 242 AuthenticationWithPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV3 \
    --extendExp  \
    --clientId 'UNl8yDbj' \
    --linkingToken '3tmvJAHb' \
    --password '1pA3NrZ3' \
    --username 'u0hTlLZ6' \
    > test.out 2>&1
eval_tap $? 242 'AuthenticationWithPlatformLinkV3' test.out

#- 243 AuthenticateAndLinkForwardV3
./ng net.accelbyte.sdk.cli.Main iam authenticateAndLinkForwardV3 \
    --extendExp  \
    --clientId 'jImByC98' \
    --linkingToken 'R2hwDDoK' \
    --password 'L8C2Wc0x' \
    --username 'L2H4Vd9E' \
    > test.out 2>&1
eval_tap $? 243 'AuthenticateAndLinkForwardV3' test.out

#- 244 PublicGetSystemConfigV3
./ng net.accelbyte.sdk.cli.Main iam publicGetSystemConfigV3 \
    > test.out 2>&1
eval_tap $? 244 'PublicGetSystemConfigV3' test.out

#- 245 GenerateTokenByNewHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV3 \
    --additionalData 'WYRQ6ZDJ' \
    --extendExp  \
    --linkingToken '3fWYL8pe' \
    > test.out 2>&1
eval_tap $? 245 'GenerateTokenByNewHeadlessAccountV3' test.out

#- 246 RequestOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam requestOneTimeLinkingCodeV3 \
    --redirectUri 'tTerH8Bz' \
    --state 'rBBsAKek' \
    --platformId 'vdrnchO5' \
    > test.out 2>&1
eval_tap $? 246 'RequestOneTimeLinkingCodeV3' test.out

#- 247 ValidateOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam validateOneTimeLinkingCodeV3 \
    --oneTimeLinkCode 'wkSuspQY' \
    > test.out 2>&1
eval_tap $? 247 'ValidateOneTimeLinkingCodeV3' test.out

#- 248 RequestTokenByOneTimeLinkCodeResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTokenByOneTimeLinkCodeResponseV3 \
    --additionalData 'w46XSfOE' \
    --isTransient  \
    --clientId 'TcAAvRdG' \
    --oneTimeLinkCode '2DGdFIPy' \
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
    --codeChallenge '2o4z08a7' \
    --codeChallengeMethod 'S256' \
    --clientId '00bw7Wqr' \
    > test.out 2>&1
eval_tap $? 251 'RequestTokenExchangeCodeV3' test.out

#- 252 AdminRetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam adminRetrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '52VwZgPm' \
    --userId 'Sl9q42BG' \
    --platformUserId 'ZJDu5H1y' \
    > test.out 2>&1
eval_tap $? 252 'AdminRetrieveUserThirdPartyPlatformTokenV3' test.out

#- 253 RevokeUserV3
./ng net.accelbyte.sdk.cli.Main iam revokeUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'vglEEL2F' \
    --includeGameNamespace  \
    > test.out 2>&1
eval_tap $? 253 'RevokeUserV3' test.out

#- 254 AuthorizeV3
./ng net.accelbyte.sdk.cli.Main iam authorizeV3 \
    --blockedPlatformId 'exuwYXYL' \
    --codeChallenge 'xpfVWZyQ' \
    --codeChallengeMethod 'S256' \
    --createHeadless  \
    --loginWebBased  \
    --nonce 'ddkIpyio' \
    --oneTimeLinkCode '3FQLuqRr' \
    --redirectUri 'nnIgWFQ9' \
    --scope 'KhXHqGgU' \
    --state 'CAtTSa3q' \
    --targetAuthPage 'm8ex3XbT' \
    --useRedirectUriAsLoginUrlWhenLocked  \
    --clientId 'TEtMDc8u' \
    --responseType 'code' \
    > test.out 2>&1
eval_tap $? 254 'AuthorizeV3' test.out

#- 255 TokenIntrospectionV3
./ng net.accelbyte.sdk.cli.Main iam tokenIntrospectionV3 \
    --token 'mVPDKkzP' \
    > test.out 2>&1
eval_tap $? 255 'TokenIntrospectionV3' test.out

#- 256 GetJWKSV3
./ng net.accelbyte.sdk.cli.Main iam getJWKSV3 \
    > test.out 2>&1
eval_tap $? 256 'GetJWKSV3' test.out

#- 257 SendMFAAuthenticationCode
./ng net.accelbyte.sdk.cli.Main iam sendMFAAuthenticationCode \
    --clientId 'XF7VPycw' \
    --factor 'ZiQ0E2G8' \
    --mfaToken 'Os0QYLcC' \
    > test.out 2>&1
eval_tap $? 257 'SendMFAAuthenticationCode' test.out

#- 258 Change2faMethod
./ng net.accelbyte.sdk.cli.Main iam change2faMethod \
    --factor 'ALOWfQxs' \
    --mfaToken '22joNKy2' \
    > test.out 2>&1
eval_tap $? 258 'Change2faMethod' test.out

#- 259 Verify2faCode
./ng net.accelbyte.sdk.cli.Main iam verify2faCode \
    --code 'oWX1qaJB' \
    --factor 'fZbGmAL0' \
    --mfaToken 'A6xP6vsM' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 259 'Verify2faCode' test.out

#- 260 Verify2faCodeForward
./ng net.accelbyte.sdk.cli.Main iam verify2faCodeForward \
    --defaultFactor 'YBqw11TR' \
    --factors 'QnA8jAo7' \
    --rememberDevice  \
    --clientId '5K40IyPt' \
    --code 'HC2E11x2' \
    --factor '264sBiRG' \
    --mfaToken 'JJF2PpCZ' \
    > test.out 2>&1
eval_tap $? 260 'Verify2faCodeForward' test.out

#- 261 RetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam retrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'nyFgn7NT' \
    --userId 'GkSpSwfC' \
    > test.out 2>&1
eval_tap $? 261 'RetrieveUserThirdPartyPlatformTokenV3' test.out

#- 262 AuthCodeRequestV3
./ng net.accelbyte.sdk.cli.Main iam authCodeRequestV3 \
    --platformId 'RngmUeQy' \
    --clientId 'yNWuVtqN' \
    --redirectUri 'jrmHWqJH' \
    --requestId 'Pt1k1kpO' \
    > test.out 2>&1
eval_tap $? 262 'AuthCodeRequestV3' test.out

#- 263 PlatformTokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV3 \
    --platformId 'ckWmIGve' \
    --additionalData '5BfU6OZT' \
    --clientId 'BxBb1OW5' \
    --createHeadless  \
    --deviceId 'QBD8HiJF' \
    --macAddress 'yJCePAoA' \
    --platformToken 'pO2qYI2d' \
    --serviceLabel '0.4230731207467069' \
    --skipSetCookie  \
    > test.out 2>&1
eval_tap $? 263 'PlatformTokenGrantV3' test.out

#- 264 GetRevocationListV3
./ng net.accelbyte.sdk.cli.Main iam getRevocationListV3 \
    > test.out 2>&1
eval_tap $? 264 'GetRevocationListV3' test.out

#- 265 TokenRevocationV3
./ng net.accelbyte.sdk.cli.Main iam tokenRevocationV3 \
    --token 'ySRKYgln' \
    > test.out 2>&1
eval_tap $? 265 'TokenRevocationV3' test.out

#- 266 SimultaneousLoginV3
./ng net.accelbyte.sdk.cli.Main iam simultaneousLoginV3 \
    --simultaneousPlatform 'MXUvUdVX' \
    --simultaneousTicket 'W20euywo' \
    --nativePlatform 'steam' \
    --nativePlatformTicket 'RP7kox42' \
    > test.out 2>&1
eval_tap $? 266 'SimultaneousLoginV3' test.out

#- 267 TokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV3 \
    --additionalData 'nl1Dm6mW' \
    --clientId 'yHFfAHVU' \
    --clientSecret '79Ub15LP' \
    --code 'Lz15mxJ9' \
    --codeVerifier 'AFNysaLA' \
    --extendNamespace 'hAzwhxTK' \
    --extendExp  \
    --password 'btsEPivD' \
    --redirectUri 'gcjh0Gmx' \
    --refreshToken '39bxAy64' \
    --scope '3GGqkkdd' \
    --username 'ZTan7YlH' \
    --grantType 'password' \
    > test.out 2>&1
eval_tap $? 267 'TokenGrantV3' test.out

#- 268 VerifyTokenV3
./ng net.accelbyte.sdk.cli.Main iam verifyTokenV3 \
    --token '1j8r6mEC' \
    > test.out 2>&1
eval_tap $? 268 'VerifyTokenV3' test.out

#- 269 PlatformAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticationV3 \
    --platformId 'i2EL2AJa' \
    --code 'DNXYb4iK' \
    --error '6LeIYvmP' \
    --openidAssocHandle 'qUb4hljX' \
    --openidClaimedId 'OjzwCGdX' \
    --openidIdentity 'b65zfxa5' \
    --openidMode 'zJWQgoFd' \
    --openidNs '6gXP97j9' \
    --openidOpEndpoint 'YsS1MjeP' \
    --openidResponseNonce 'h0x6urfE' \
    --openidReturnTo '23EjC5WF' \
    --openidSig 'zvbEU1pr' \
    --openidSigned 'kLME7CGo' \
    --state 'LugttsBQ' \
    > test.out 2>&1
eval_tap $? 269 'PlatformAuthenticationV3' test.out

#- 270 PlatformTokenRefreshV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenRefreshV3 \
    --platformId 'VqaBNthD' \
    --platformToken 'YogG2ZP1' \
    > test.out 2>&1
eval_tap $? 270 'PlatformTokenRefreshV3' test.out

#- 271 PublicGetInputValidations
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidations \
    --defaultOnEmpty  \
    --languageCode 'SlDsd1mc' \
    > test.out 2>&1
eval_tap $? 271 'PublicGetInputValidations' test.out

#- 272 PublicGetInputValidationByField
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidationByField \
    --field 'Ot3SzRiU' \
    > test.out 2>&1
eval_tap $? 272 'PublicGetInputValidationByField' test.out

#- 273 PublicGetCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam publicGetCountryAgeRestrictionV3 \
    --countryCode 'l5NzrKVL' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 273 'PublicGetCountryAgeRestrictionV3' test.out

#- 274 PublicGetConfigValueV3
./ng net.accelbyte.sdk.cli.Main iam publicGetConfigValueV3 \
    --configKey 'CmOKaFq1' \
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
    --clientId 'Sm9s6sd9' \
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
    --requestId 'RAIAVS6e' \
    > test.out 2>&1
eval_tap $? 281 'PublicGetAsyncStatus' test.out

#- 282 PublicSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam publicSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'e5DPwnVI' \
    --limit '17' \
    --offset '78' \
    --platformBy 'tRBH0FI5' \
    --platformId 'mjCQrUOJ' \
    --query 'T6wHOCNC' \
    > test.out 2>&1
eval_tap $? 282 'PublicSearchUserV3' test.out

#- 283 PublicCreateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "HJRvvyHL", "acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "jhZk8MtL", "policyId": "740Eaa9c", "policyVersionId": "AceH0Aud"}, {"isAccepted": false, "localizedPolicyVersionId": "M00CN45m", "policyId": "4v7SZp07", "policyVersionId": "r8zQ8g1L"}, {"isAccepted": false, "localizedPolicyVersionId": "mvaJ2fLy", "policyId": "EzmnJhNb", "policyVersionId": "pdH7g9Gf"}], "authType": "2EzxgX3w", "code": "tz5F0RXz", "country": "bpskZ5iM", "dateOfBirth": "CGVoD6Lb", "displayName": "5btNzpmE", "emailAddress": "a29Ox6Ms", "password": "gsAb880h", "reachMinimumAge": true, "uniqueDisplayName": "HbrLhWPb"}' \
    > test.out 2>&1
eval_tap $? 283 'PublicCreateUserV3' test.out

#- 284 CheckUserAvailability
./ng net.accelbyte.sdk.cli.Main iam checkUserAvailability \
    --namespace "$AB_NAMESPACE" \
    --field 'dh0tKiy1' \
    --query 'QuveDRDa' \
    > test.out 2>&1
eval_tap $? 284 'CheckUserAvailability' test.out

#- 285 PublicBulkGetUsers
eval_tap 0 285 'PublicBulkGetUsers # SKIP deprecated' test.out

#- 286 PublicSendRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicSendRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "8opfXyMu", "languageTag": "pvdX08EQ"}' \
    > test.out 2>&1
eval_tap $? 286 'PublicSendRegistrationCode' test.out

#- 287 PublicVerifyRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicVerifyRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "LUqLffLV", "emailAddress": "0JUWM75p"}' \
    > test.out 2>&1
eval_tap $? 287 'PublicVerifyRegistrationCode' test.out

#- 288 PublicForgotPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicForgotPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "9xu3Y2Ca", "languageTag": "72dft08e"}' \
    > test.out 2>&1
eval_tap $? 288 'PublicForgotPasswordV3' test.out

#- 289 PublicValidateUserInput
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserInput \
    --namespace "$AB_NAMESPACE" \
    --body '{"displayName": "MYErCyZ8", "password": "RrQ7KtQR", "uniqueDisplayName": "2FIk8lsO", "username": "KsHwUmi9"}' \
    > test.out 2>&1
eval_tap $? 289 'PublicValidateUserInput' test.out

#- 290 GetAdminInvitationV3
./ng net.accelbyte.sdk.cli.Main iam getAdminInvitationV3 \
    --invitationId 'QHV5HseV' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 290 'GetAdminInvitationV3' test.out

#- 291 CreateUserFromInvitationV3
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV3 \
    --invitationId 'ybUDwneO' \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "zZBA3Foi", "acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "qHbTCFYj", "policyId": "7COzSFcj", "policyVersionId": "7TmfNU8R"}, {"isAccepted": true, "localizedPolicyVersionId": "fKGol2po", "policyId": "AjWp9grp", "policyVersionId": "J0BC8DlV"}, {"isAccepted": true, "localizedPolicyVersionId": "kdEY3pyN", "policyId": "loX0oCnh", "policyVersionId": "IxZv3tB9"}], "authType": "LqMCvQiT", "code": "qudKPbYc", "country": "dnVaA6fe", "dateOfBirth": "16X6HysX", "displayName": "nhGB3frg", "emailAddress": "HK4Ezly1", "password": "oApouZhd", "reachMinimumAge": true, "uniqueDisplayName": "fSEogXq9"}' \
    > test.out 2>&1
eval_tap $? 291 'CreateUserFromInvitationV3' test.out

#- 292 UpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam updateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "ZYxDkCBb", "country": "SwG2M2KR", "dateOfBirth": "6ytXznsX", "displayName": "nmA5PamM", "languageTag": "0XchJ0uV", "uniqueDisplayName": "x6Sd9MEs", "userName": "7vo2Gh2e"}' \
    > test.out 2>&1
eval_tap $? 292 'UpdateUserV3' test.out

#- 293 PublicPartialUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicPartialUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "hhDUUbsS", "country": "na3bzckC", "dateOfBirth": "Dw0urnWy", "displayName": "21y5AR8p", "languageTag": "POaKdWqP", "uniqueDisplayName": "lZp7X7Lz", "userName": "Gds9jyWI"}' \
    > test.out 2>&1
eval_tap $? 293 'PublicPartialUpdateUserV3' test.out

#- 294 PublicSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"context": "4zZGjfdu", "emailAddress": "Da4n5BAf", "languageTag": "kkknWsI4", "upgradeToken": "UuFcoimF"}' \
    > test.out 2>&1
eval_tap $? 294 'PublicSendVerificationCodeV3' test.out

#- 295 PublicUserVerificationV3
./ng net.accelbyte.sdk.cli.Main iam publicUserVerificationV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "XisT6Qju", "contactType": "VkzZnhyU", "languageTag": "rCAWbJFq", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 295 'PublicUserVerificationV3' test.out

#- 296 PublicUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "yn3nKzN3", "country": "wqlcZnQH", "dateOfBirth": "WJejl3RS", "displayName": "1ctB7CHN", "emailAddress": "AMmVNfqx", "password": "hI1MdHIb", "uniqueDisplayName": "VRlonrJ2", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 296 'PublicUpgradeHeadlessAccountV3' test.out

#- 297 PublicVerifyHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --needVerificationCode  \
    --body '{"emailAddress": "0Fmy8lWl", "password": "vmscFg4G"}' \
    > test.out 2>&1
eval_tap $? 297 'PublicVerifyHeadlessAccountV3' test.out

#- 298 PublicUpdatePasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicUpdatePasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"languageTag": "xsA8RrsW", "mfaToken": "2AUjwixh", "newPassword": "gJd9Ai3z", "oldPassword": "KGSNvcXX"}' \
    > test.out 2>&1
eval_tap $? 298 'PublicUpdatePasswordV3' test.out

#- 299 PublicCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam publicCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'EaaK6Lpy' \
    > test.out 2>&1
eval_tap $? 299 'PublicCreateJusticeUser' test.out

#- 300 PublicPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'rfKDSeLD' \
    --redirectUri 'wv9g7qw8' \
    --ticket 'IEmSQg5j' \
    > test.out 2>&1
eval_tap $? 300 'PublicPlatformLinkV3' test.out

#- 301 PublicPlatformUnlinkV3
eval_tap 0 301 'PublicPlatformUnlinkV3 # SKIP deprecated' test.out

#- 302 PublicPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 's1jvXRHO' \
    > test.out 2>&1
eval_tap $? 302 'PublicPlatformUnlinkAllV3' test.out

#- 303 PublicForcePlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicForcePlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'UF9Qx0j7' \
    --ticket 'rxvCHyn5' \
    > test.out 2>&1
eval_tap $? 303 'PublicForcePlatformLinkV3' test.out

#- 304 PublicWebLinkPlatform
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatform \
    --namespace "$AB_NAMESPACE" \
    --platformId 'k35bcWNd' \
    --clientId '1Cea66ap' \
    --redirectUri '47pggBnm' \
    > test.out 2>&1
eval_tap $? 304 'PublicWebLinkPlatform' test.out

#- 305 PublicWebLinkPlatformEstablish
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatformEstablish \
    --namespace "$AB_NAMESPACE" \
    --platformId 'b5y6yRDr' \
    --code '61kAMCud' \
    --state 'OU8cQpEe' \
    > test.out 2>&1
eval_tap $? 305 'PublicWebLinkPlatformEstablish' test.out

#- 306 PublicProcessWebLinkPlatformV3
./ng net.accelbyte.sdk.cli.Main iam publicProcessWebLinkPlatformV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Vw27nev2' \
    --code '8GJSBDKe' \
    --state 'WHQsfFtu' \
    > test.out 2>&1
eval_tap $? 306 'PublicProcessWebLinkPlatformV3' test.out

#- 307 PublicGetUsersPlatformInfosV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUsersPlatformInfosV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"platformId": "3bKX8Bma", "userIds": ["jPZ4wLd6", "ntXNu2Ha", "xpUp7QeK"]}' \
    > test.out 2>&1
eval_tap $? 307 'PublicGetUsersPlatformInfosV3' test.out

#- 308 ResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam resetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientId": "KN9AX3aI", "code": "aVmDYhv9", "emailAddress": "QcAknQ1Z", "languageTag": "PBHpX38N", "newPassword": "LET9NuER"}' \
    > test.out 2>&1
eval_tap $? 308 'ResetPasswordV3' test.out

#- 309 PublicGetUserByUserIdV3
eval_tap 0 309 'PublicGetUserByUserIdV3 # SKIP deprecated' test.out

#- 310 PublicGetUserBanHistoryV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserBanHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'EO91qn2k' \
    --activeOnly  \
    --after 'Idr6jZ3g' \
    --before 'zeCVPSXl' \
    --limit '26' \
    > test.out 2>&1
eval_tap $? 310 'PublicGetUserBanHistoryV3' test.out

#- 311 PublicListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'lGEtnXVa' \
    > test.out 2>&1
eval_tap $? 311 'PublicListUserAllPlatformAccountsDistinctV3' test.out

#- 312 PublicGetUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'gOA3vEJN' \
    > test.out 2>&1
eval_tap $? 312 'PublicGetUserInformationV3' test.out

#- 313 PublicGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'VdwMajl1' \
    --after '0.2725597726208535' \
    --before '0.7978767928778144' \
    --limit '82' \
    > test.out 2>&1
eval_tap $? 313 'PublicGetUserLoginHistoriesV3' test.out

#- 314 PublicGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '8HJX9oap' \
    --after 'fOadjBbb' \
    --before 'zlu94tZ9' \
    --limit '65' \
    --platformId 'YzLp2ECv' \
    > test.out 2>&1
eval_tap $? 314 'PublicGetUserPlatformAccountsV3' test.out

#- 315 PublicListJusticePlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicListJusticePlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'iongI1EF' \
    > test.out 2>&1
eval_tap $? 315 'PublicListJusticePlatformAccountsV3' test.out

#- 316 PublicLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam publicLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'B076e1p5' \
    --body '{"platformId": "DHQtB3D6", "platformUserId": "pRt9ZtJE"}' \
    > test.out 2>&1
eval_tap $? 316 'PublicLinkPlatformAccount' test.out

#- 317 PublicForceLinkPlatformWithProgression
./ng net.accelbyte.sdk.cli.Main iam publicForceLinkPlatformWithProgression \
    --namespace "$AB_NAMESPACE" \
    --userId 'N8rf1mXo' \
    --body '{"chosenNamespaces": ["5AV6e09x", "YeeL09s2", "YY5iB8Dz"], "requestId": "U49nXT34"}' \
    > test.out 2>&1
eval_tap $? 317 'PublicForceLinkPlatformWithProgression' test.out

#- 318 PublicGetPublisherUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetPublisherUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'SMXrUjC7' \
    > test.out 2>&1
eval_tap $? 318 'PublicGetPublisherUserV3' test.out

#- 319 PublicValidateUserByUserIDAndPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserByUserIDAndPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'aEg4zNFM' \
    --password 'uxASIc20' \
    > test.out 2>&1
eval_tap $? 319 'PublicValidateUserByUserIDAndPasswordV3' test.out

#- 320 PublicGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRolesV3 \
    --after 'KoJvumYj' \
    --before 'PhTtBvEU' \
    --isWildcard  \
    --limit '72' \
    > test.out 2>&1
eval_tap $? 320 'PublicGetRolesV3' test.out

#- 321 PublicGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRoleV3 \
    --roleId '4ryBcxp2' \
    > test.out 2>&1
eval_tap $? 321 'PublicGetRoleV3' test.out

#- 322 PublicForgotPasswordWithoutNamespaceV3
./ng net.accelbyte.sdk.cli.Main iam publicForgotPasswordWithoutNamespaceV3 \
    --body '{"clientId": "h2qamuNi", "emailAddress": "xzkB5OJs", "languageTag": "qKBfv1aI"}' \
    > test.out 2>&1
eval_tap $? 322 'PublicForgotPasswordWithoutNamespaceV3' test.out

#- 323 PublicGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyUserV3 \
    --includeAllPlatforms  \
    > test.out 2>&1
eval_tap $? 323 'PublicGetMyUserV3' test.out

#- 324 PublicSendCodeForwardV3
./ng net.accelbyte.sdk.cli.Main iam publicSendCodeForwardV3 \
    --body '{"context": "pN6xFWHO", "emailAddress": "VycLVJaU", "languageTag": "qsHsH90i", "upgradeToken": "YL4MjNdO"}' \
    > test.out 2>&1
eval_tap $? 324 'PublicSendCodeForwardV3' test.out

#- 325 PublicGetLinkHeadlessAccountToMyAccountConflictV3
./ng net.accelbyte.sdk.cli.Main iam publicGetLinkHeadlessAccountToMyAccountConflictV3 \
    --oneTimeLinkCode 'MKOqOzvh' \
    > test.out 2>&1
eval_tap $? 325 'PublicGetLinkHeadlessAccountToMyAccountConflictV3' test.out

#- 326 LinkHeadlessAccountToMyAccountV3
./ng net.accelbyte.sdk.cli.Main iam linkHeadlessAccountToMyAccountV3 \
    --body '{"chosenNamespaces": ["wktLUejH", "mGuO9Y5s", "TIVDSNyn"], "oneTimeLinkCode": "kxxhv29O"}' \
    > test.out 2>&1
eval_tap $? 326 'LinkHeadlessAccountToMyAccountV3' test.out

#- 327 PublicGetMyRedirectionAfterLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyRedirectionAfterLinkV3 \
    --oneTimeLinkCode 'dKf8CdHu' \
    > test.out 2>&1
eval_tap $? 327 'PublicGetMyRedirectionAfterLinkV3' test.out

#- 328 PublicGetMyProfileAllowUpdateStatusV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyProfileAllowUpdateStatusV3 \
    > test.out 2>&1
eval_tap $? 328 'PublicGetMyProfileAllowUpdateStatusV3' test.out

#- 329 PublicSendVerificationLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationLinkV3 \
    --body '{"languageTag": "eEps6hQP"}' \
    > test.out 2>&1
eval_tap $? 329 'PublicSendVerificationLinkV3' test.out

#- 330 PublicGetOpenidUserInfoV3
./ng net.accelbyte.sdk.cli.Main iam publicGetOpenidUserInfoV3 \
    > test.out 2>&1
eval_tap $? 330 'PublicGetOpenidUserInfoV3' test.out

#- 331 PublicVerifyUserByLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyUserByLinkV3 \
    --code 'VJTqQTZu' \
    > test.out 2>&1
eval_tap $? 331 'PublicVerifyUserByLinkV3' test.out

#- 332 PlatformAuthenticateSAMLV3Handler
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticateSAMLV3Handler \
    --platformId 'tjTWvBgn' \
    --code 'ySglyGCf' \
    --error 'IMukFdnZ' \
    --state 'rd7RP9nx' \
    > test.out 2>&1
eval_tap $? 332 'PlatformAuthenticateSAMLV3Handler' test.out

#- 333 LoginSSOClient
./ng net.accelbyte.sdk.cli.Main iam loginSSOClient \
    --platformId 'jCofLMqc' \
    --payload 'uXVoepus' \
    > test.out 2>&1
eval_tap $? 333 'LoginSSOClient' test.out

#- 334 LogoutSSOClient
./ng net.accelbyte.sdk.cli.Main iam logoutSSOClient \
    --platformId 'zQo44fwL' \
    > test.out 2>&1
eval_tap $? 334 'LogoutSSOClient' test.out

#- 335 RequestTargetTokenResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTargetTokenResponseV3 \
    --additionalData 'tE0z3msj' \
    --code 'l5SNGE0E' \
    > test.out 2>&1
eval_tap $? 335 'RequestTargetTokenResponseV3' test.out

#- 336 UpgradeAndAuthenticateForwardV3
./ng net.accelbyte.sdk.cli.Main iam upgradeAndAuthenticateForwardV3 \
    --clientId 'Rsytk3FF' \
    --upgradeSuccessToken 'kyqAyx0U' \
    > test.out 2>&1
eval_tap $? 336 'UpgradeAndAuthenticateForwardV3' test.out

#- 337 AdminListInvitationHistoriesV4
./ng net.accelbyte.sdk.cli.Main iam adminListInvitationHistoriesV4 \
    --limit '11' \
    --namespace "$AB_NAMESPACE" \
    --offset '59' \
    > test.out 2>&1
eval_tap $? 337 'AdminListInvitationHistoriesV4' test.out

#- 338 AdminGetDevicesByUserV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDevicesByUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'nJ5m56H6' \
    > test.out 2>&1
eval_tap $? 338 'AdminGetDevicesByUserV4' test.out

#- 339 AdminGetBannedDevicesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedDevicesV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceType 'BGM7Uw2F' \
    --endDate 'rm9IzvUh' \
    --limit '79' \
    --offset '13' \
    --startDate 'KNkpnpNm' \
    > test.out 2>&1
eval_tap $? 339 'AdminGetBannedDevicesV4' test.out

#- 340 AdminGetUserDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeviceBansV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZDnbpx7E' \
    > test.out 2>&1
eval_tap $? 340 'AdminGetUserDeviceBansV4' test.out

#- 341 AdminBanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminBanDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"comment": "s7ynJV2Q", "deviceId": "PZoGUWOp", "deviceType": "xiMTAJTM", "enabled": true, "endDate": "9jMaf1Sb", "ext": {"Kto7PXYp": {}, "ps57yWN1": {}, "rReeF2cv": {}}, "reason": "gTcMGMnf"}' \
    > test.out 2>&1
eval_tap $? 341 'AdminBanDeviceV4' test.out

#- 342 AdminGetDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBanV4 \
    --banId 'djS41ihX' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 342 'AdminGetDeviceBanV4' test.out

#- 343 AdminUpdateDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateDeviceBanV4 \
    --banId 'wW4JKnp3' \
    --namespace "$AB_NAMESPACE" \
    --body '{"enabled": true}' \
    > test.out 2>&1
eval_tap $? 343 'AdminUpdateDeviceBanV4' test.out

#- 344 AdminGenerateReportV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateReportV4 \
    --namespace "$AB_NAMESPACE" \
    --endDate 'lA6gOJp7' \
    --startDate 'ULX6YNeC' \
    --deviceType 'VWnKbMNj' \
    > test.out 2>&1
eval_tap $? 344 'AdminGenerateReportV4' test.out

#- 345 AdminGetDeviceTypesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceTypesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 345 'AdminGetDeviceTypesV4' test.out

#- 346 AdminGetDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBansV4 \
    --deviceId '9Y0NmMvk' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 346 'AdminGetDeviceBansV4' test.out

#- 347 AdminDecryptDeviceV4
eval_tap 0 347 'AdminDecryptDeviceV4 # SKIP deprecated' test.out

#- 348 AdminUnbanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminUnbanDeviceV4 \
    --deviceId 'gzySpDJc' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 348 'AdminUnbanDeviceV4' test.out

#- 349 AdminGetUsersByDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUsersByDeviceV4 \
    --deviceId '5GW1Ixjq' \
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
    --limit '6' \
    --offset '37' \
    > test.out 2>&1
eval_tap $? 351 'AdminGetNamespaceUserInvitationHistoryV4' test.out

#- 352 AdminCreateTestUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateTestUsersV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 8, "userInfo": {"country": "wAiMT6GV"}}' \
    > test.out 2>&1
eval_tap $? 352 'AdminCreateTestUsersV4' test.out

#- 353 AdminCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "t0d6cq7R", "policyId": "7iHK2en8", "policyVersionId": "F8wHoz9O"}, {"isAccepted": false, "localizedPolicyVersionId": "ezlq1VHx", "policyId": "eluvyzzH", "policyVersionId": "gy5LdpOt"}, {"isAccepted": true, "localizedPolicyVersionId": "vbbBUcbl", "policyId": "OmIYAqwj", "policyVersionId": "PAwGMX5R"}], "authType": "EMAILPASSWD", "code": "YffyIcFX", "country": "NyTwn9Fh", "dateOfBirth": "Y9wlp08N", "displayName": "uGsWTKDL", "emailAddress": "ifKJN5vc", "password": "s1C2trFI", "passwordMD5Sum": "51WFkBWV", "reachMinimumAge": true, "uniqueDisplayName": "OBuDUdYr", "username": "vo0m5doT"}' \
    > test.out 2>&1
eval_tap $? 353 'AdminCreateUserV4' test.out

#- 354 AdminBulkUpdateUserAccountTypeV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateUserAccountTypeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"testAccount": true, "userIds": ["cuv4B3r8", "Nqgm4EYa", "9HpYoSnV"]}' \
    > test.out 2>&1
eval_tap $? 354 'AdminBulkUpdateUserAccountTypeV4' test.out

#- 355 AdminBulkCheckValidUserIDV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkCheckValidUserIDV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["WcHjcYxR", "iwJX2ceW", "3sN0a8pR"]}' \
    > test.out 2>&1
eval_tap $? 355 'AdminBulkCheckValidUserIDV4' test.out

#- 356 AdminUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'M0s8rbzR' \
    --body '{"avatarUrl": "of17pGYL", "country": "e0rnxUFP", "dateOfBirth": "HSQr2rHl", "displayName": "1B84p4pB", "languageTag": "BfrnQfeE", "skipLoginQueue": true, "tags": ["1sl7dDGj", "ikunDsgA", "D1Ly2UcU"], "uniqueDisplayName": "POlkDDKk", "userName": "nv3tbSnw"}' \
    > test.out 2>&1
eval_tap $? 356 'AdminUpdateUserV4' test.out

#- 357 AdminUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'V5mxcMvb' \
    --body '{"code": "I15AXzX7", "emailAddress": "oBPXTNzd"}' \
    > test.out 2>&1
eval_tap $? 357 'AdminUpdateUserEmailAddressV4' test.out

#- 358 AdminDisableUserMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableUserMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'E76s679D' \
    --body '{"factor": "WrgiuPFp", "mfaToken": "W3WWIkBT"}' \
    > test.out 2>&1
eval_tap $? 358 'AdminDisableUserMFAV4' test.out

#- 359 AdminGetUserMFAStatusV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUserMFAStatusV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'U395h9c8' \
    > test.out 2>&1
eval_tap $? 359 'AdminGetUserMFAStatusV4' test.out

#- 360 AdminListUserRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminListUserRolesV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'N1FpTn8G' \
    > test.out 2>&1
eval_tap $? 360 'AdminListUserRolesV4' test.out

#- 361 AdminUpdateUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '7Cu4OqiP' \
    --body '{"assignedNamespaces": ["NE84zMBn", "Oh7mrfVH", "886rxZtT"], "roleId": "DpvV0eiF"}' \
    > test.out 2>&1
eval_tap $? 361 'AdminUpdateUserRoleV4' test.out

#- 362 AdminAddUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'MA4C7asM' \
    --body '{"assignedNamespaces": ["KWwzeodS", "7dIccONw", "0gUGzeqx"], "roleId": "jX16TJCj"}' \
    > test.out 2>&1
eval_tap $? 362 'AdminAddUserRoleV4' test.out

#- 363 AdminRemoveUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRemoveUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'VjnjLhFU' \
    --body '{"assignedNamespaces": ["fPfSUmRK", "ndaOGccQ", "UwcRhcsT"], "roleId": "ZPo5Xbug"}' \
    > test.out 2>&1
eval_tap $? 363 'AdminRemoveUserRoleV4' test.out

#- 364 AdminGetRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV4 \
    --adminRole  \
    --isWildcard  \
    --limit '23' \
    --offset '94' \
    > test.out 2>&1
eval_tap $? 364 'AdminGetRolesV4' test.out

#- 365 AdminCreateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV4 \
    --body '{"adminRole": false, "deletable": false, "isWildcard": false, "roleName": "FF1wTliK"}' \
    > test.out 2>&1
eval_tap $? 365 'AdminCreateRoleV4' test.out

#- 366 AdminGetRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV4 \
    --roleId 'WpJGjgCb' \
    > test.out 2>&1
eval_tap $? 366 'AdminGetRoleV4' test.out

#- 367 AdminDeleteRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV4 \
    --roleId 'aCzmFKS9' \
    > test.out 2>&1
eval_tap $? 367 'AdminDeleteRoleV4' test.out

#- 368 AdminUpdateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV4 \
    --roleId 'PFqCahtX' \
    --body '{"adminRole": false, "deletable": false, "isWildcard": false, "roleName": "KGdOdOIL"}' \
    > test.out 2>&1
eval_tap $? 368 'AdminUpdateRoleV4' test.out

#- 369 AdminUpdateRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV4 \
    --roleId 'nFlFM3w3' \
    --body '{"permissions": [{"action": 62, "resource": "auf9ivdP", "schedAction": 63, "schedCron": "gOAxeA5Q", "schedRange": ["i6TbeGdv", "6an9FYrU", "urxWPhU9"]}, {"action": 7, "resource": "MCCd44Mc", "schedAction": 46, "schedCron": "UD5y5Akl", "schedRange": ["cGOFncOx", "XB4B6ukH", "ZZ2vcNtJ"]}, {"action": 29, "resource": "vnWu6BMN", "schedAction": 63, "schedCron": "j7alop3P", "schedRange": ["BjQEz213", "Qs4F6T0w", "JW0qpAmL"]}]}' \
    > test.out 2>&1
eval_tap $? 369 'AdminUpdateRolePermissionsV4' test.out

#- 370 AdminAddRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV4 \
    --roleId 'h1gtCIR9' \
    --body '{"permissions": [{"action": 79, "resource": "UmGM3h8g", "schedAction": 6, "schedCron": "9E9Zxt6t", "schedRange": ["41GNosOQ", "O6oZQTyH", "VOrp6aWe"]}, {"action": 8, "resource": "3LRsnFjP", "schedAction": 86, "schedCron": "o4NOXGUF", "schedRange": ["9lfAEWH8", "Ixa36Avp", "lGequN5g"]}, {"action": 78, "resource": "pz0CRZTz", "schedAction": 85, "schedCron": "isSvtGvq", "schedRange": ["VEqCE0p4", "1fnrmg1v", "i7mP3YQE"]}]}' \
    > test.out 2>&1
eval_tap $? 370 'AdminAddRolePermissionsV4' test.out

#- 371 AdminDeleteRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV4 \
    --roleId 'c54Jr08Z' \
    --body '["RChISWZg", "D7j77Och", "44vpQHyk"]' \
    > test.out 2>&1
eval_tap $? 371 'AdminDeleteRolePermissionsV4' test.out

#- 372 AdminListAssignedUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminListAssignedUsersV4 \
    --roleId 'k3uXfCZa' \
    --after 'A2Ru6IBt' \
    --before '2Zue5FQF' \
    --limit '20' \
    > test.out 2>&1
eval_tap $? 372 'AdminListAssignedUsersV4' test.out

#- 373 AdminAssignUserToRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAssignUserToRoleV4 \
    --roleId '3pvqhJZL' \
    --body '{"assignedNamespaces": ["RCZRvE1W", "pk7Tp924", "gMDy7KQh"], "namespace": "UwieBBM2", "userId": "618SGRVt"}' \
    > test.out 2>&1
eval_tap $? 373 'AdminAssignUserToRoleV4' test.out

#- 374 AdminRevokeUserFromRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRevokeUserFromRoleV4 \
    --roleId 'vLL6ToDt' \
    --body '{"namespace": "GJwzpshV", "userId": "0Nxb3MDs"}' \
    > test.out 2>&1
eval_tap $? 374 'AdminRevokeUserFromRoleV4' test.out

#- 375 AdminInviteUserNewV4
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserNewV4 \
    --body '{"assignedNamespaces": ["qmMuX9Rm", "wZEHs3WU", "fQPUKUZx"], "emailAddresses": ["NTyxwL33", "2RdxVxbs", "rvqyag5r"], "isAdmin": false, "isNewStudio": false, "languageTag": "gyTTq6hT", "namespace": "2MtzgRvo", "roleId": "9osu5pcQ"}' \
    > test.out 2>&1
eval_tap $? 375 'AdminInviteUserNewV4' test.out

#- 376 AdminUpdateMyUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateMyUserV4 \
    --body '{"avatarUrl": "lGJZAccH", "country": "D29fXnto", "dateOfBirth": "rW6uYp9f", "displayName": "2mjBLSnu", "languageTag": "T8WJFiZL", "skipLoginQueue": false, "tags": ["yWLatE7a", "XIOrIIJM", "56lj55RC"], "uniqueDisplayName": "iTRIri43", "userName": "7jj5QwyD"}' \
    > test.out 2>&1
eval_tap $? 376 'AdminUpdateMyUserV4' test.out

#- 377 AdminDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyAuthenticatorV4 \
    --body '{"factor": "IlUsxlnf", "mfaToken": "hwb5gYu4"}' \
    > test.out 2>&1
eval_tap $? 377 'AdminDisableMyAuthenticatorV4' test.out

#- 378 AdminEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyAuthenticatorV4 \
    --code 'ytK17GZA' \
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
    --body '{"factor": "d9llqa1B", "mfaToken": "09CquvS4"}' \
    > test.out 2>&1
eval_tap $? 382 'AdminDisableMyBackupCodesV4' test.out

#- 383 AdminDownloadMyBackupCodesV4
eval_tap 0 383 'AdminDownloadMyBackupCodesV4 # SKIP deprecated' test.out

#- 384 AdminEnableMyBackupCodesV4
eval_tap 0 384 'AdminEnableMyBackupCodesV4 # SKIP deprecated' test.out

#- 385 AdminGetBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBackupCodesV4 \
    --languageTag 'NRgIdwZC' \
    > test.out 2>&1
eval_tap $? 385 'AdminGetBackupCodesV4' test.out

#- 386 AdminGenerateBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateBackupCodesV4 \
    --languageTag '2k5xJZ1V' \
    > test.out 2>&1
eval_tap $? 386 'AdminGenerateBackupCodesV4' test.out

#- 387 AdminEnableBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableBackupCodesV4 \
    --languageTag 'TUogJZk3' \
    > test.out 2>&1
eval_tap $? 387 'AdminEnableBackupCodesV4' test.out

#- 388 AdminChallengeMyMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminChallengeMyMFAV4 \
    --code 'HsBSVLfR' \
    --factor '48roQWxz' \
    > test.out 2>&1
eval_tap $? 388 'AdminChallengeMyMFAV4' test.out

#- 389 AdminSendMyMFAEmailCodeV4
./ng net.accelbyte.sdk.cli.Main iam adminSendMyMFAEmailCodeV4 \
    --action 'xMLeAucl' \
    --languageTag 'WpeohaIY' \
    > test.out 2>&1
eval_tap $? 389 'AdminSendMyMFAEmailCodeV4' test.out

#- 390 AdminDisableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyEmailV4 \
    --body '{"factor": "NMLblPAp", "mfaToken": "uN6ncNhS"}' \
    > test.out 2>&1
eval_tap $? 390 'AdminDisableMyEmailV4' test.out

#- 391 AdminEnableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyEmailV4 \
    --code 'VkFEZnm6' \
    > test.out 2>&1
eval_tap $? 391 'AdminEnableMyEmailV4' test.out

#- 392 AdminGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyEnabledFactorsV4 \
    > test.out 2>&1
eval_tap $? 392 'AdminGetMyEnabledFactorsV4' test.out

#- 393 AdminMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam adminMakeFactorMyDefaultV4 \
    --factor 'KIwKL0J7' \
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
    --clientId 'AFRXhmjU' \
    --linkingToken 'DoXOGALq' \
    --password 'ZqOb9lB8' \
    --username 'QO3PXUls' \
    > test.out 2>&1
eval_tap $? 397 'AuthenticationWithPlatformLinkV4' test.out

#- 398 GenerateTokenByNewHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV4 \
    --additionalData 'p1CJ6Gxl' \
    --extendExp  \
    --linkingToken 'HE79KjCU' \
    > test.out 2>&1
eval_tap $? 398 'GenerateTokenByNewHeadlessAccountV4' test.out

#- 399 Verify2faCodeV4
./ng net.accelbyte.sdk.cli.Main iam verify2faCodeV4 \
    --code 'azalwCkz' \
    --factor 'KygEEUED' \
    --mfaToken '8EZji6M9' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 399 'Verify2faCodeV4' test.out

#- 400 PlatformTokenGrantV4
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV4 \
    --platformId 'tS83CB9W' \
    --codeChallenge '4fv5J3mG' \
    --codeChallengeMethod 'S256' \
    --additionalData 'aVCgwTIN' \
    --clientId 'DaiYF4MY' \
    --createHeadless  \
    --deviceId 'uiCVMCog' \
    --macAddress '3sciYTzl' \
    --platformToken 'NNB8xJjc' \
    --serviceLabel '0.09036426961653321' \
    --skipSetCookie  \
    > test.out 2>&1
eval_tap $? 400 'PlatformTokenGrantV4' test.out

#- 401 SimultaneousLoginV4
./ng net.accelbyte.sdk.cli.Main iam simultaneousLoginV4 \
    --codeChallenge 'cvf3xaf4' \
    --codeChallengeMethod 'S256' \
    --simultaneousPlatform 'iovOiyeR' \
    --simultaneousTicket '4dyiZNfx' \
    --nativePlatform 'epicgames' \
    --nativePlatformTicket 'SGW2Nbsv' \
    > test.out 2>&1
eval_tap $? 401 'SimultaneousLoginV4' test.out

#- 402 TokenGrantV4
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV4 \
    --codeChallenge 'YM5hFyx9' \
    --codeChallengeMethod 'plain' \
    --additionalData 'yGQOZypf' \
    --clientId '00o66INY' \
    --clientSecret '21OKtKiN' \
    --code 'UBYLkj3p' \
    --codeVerifier 'AnO6W5Mf' \
    --extendNamespace 'h8KFp60Q' \
    --extendExp  \
    --loginQueueTicket '0GwoUsns' \
    --password 'Iet36NrZ' \
    --redirectUri 'Lc5Npi13' \
    --refreshToken 'ZwqwjjsU' \
    --scope 'ZeFeDeMd' \
    --username '912iVpv4' \
    --grantType 'urn:ietf:params:oauth:grant-type:login_queue_ticket' \
    > test.out 2>&1
eval_tap $? 402 'TokenGrantV4' test.out

#- 403 RequestTargetTokenResponseV4
./ng net.accelbyte.sdk.cli.Main iam requestTargetTokenResponseV4 \
    --additionalData 'S1ZBBOyI' \
    --code 'hc89z0cn' \
    > test.out 2>&1
eval_tap $? 403 'RequestTargetTokenResponseV4' test.out

#- 404 PublicListUserIDByPlatformUserIDsV4
./ng net.accelbyte.sdk.cli.Main iam publicListUserIDByPlatformUserIDsV4 \
    --namespace "$AB_NAMESPACE" \
    --platformId '5S4ATEdw' \
    --rawPUID  \
    --body '{"pidType": "tuMVDWtA", "platformUserIds": ["Z83BWCcl", "HWOHarO8", "hF8Auf4M"]}' \
    > test.out 2>&1
eval_tap $? 404 'PublicListUserIDByPlatformUserIDsV4' test.out

#- 405 PublicGetUserByPlatformUserIDV4
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByPlatformUserIDV4 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'P9CsnSIX' \
    --platformUserId '91PG2hOW' \
    > test.out 2>&1
eval_tap $? 405 'PublicGetUserByPlatformUserIDV4' test.out

#- 406 PublicCreateTestUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateTestUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "mtv8VIvw", "policyId": "lHRJgwT9", "policyVersionId": "tCbpFqZm"}, {"isAccepted": true, "localizedPolicyVersionId": "7URPmwOX", "policyId": "q93ndPxS", "policyVersionId": "td3UKI9w"}, {"isAccepted": false, "localizedPolicyVersionId": "ugdrPCX5", "policyId": "msVUxK98", "policyVersionId": "3ZszBsBn"}], "authType": "EMAILPASSWD", "country": "vp20CFt4", "dateOfBirth": "Me19cgv0", "displayName": "219Q5rFB", "emailAddress": "Weu5sAsN", "password": "DyP87um6", "passwordMD5Sum": "uLziKiWc", "uniqueDisplayName": "0SYmJrXu", "username": "P007iL0r", "verified": true}' \
    > test.out 2>&1
eval_tap $? 406 'PublicCreateTestUserV4' test.out

#- 407 PublicCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "o5iFkR8a", "policyId": "Qr0tu1rn", "policyVersionId": "XR6D17Le"}, {"isAccepted": false, "localizedPolicyVersionId": "rz0eE8tV", "policyId": "egFWybUU", "policyVersionId": "HeGKPQhh"}, {"isAccepted": false, "localizedPolicyVersionId": "ftWGxnVu", "policyId": "ql1RW3Rv", "policyVersionId": "osHNrL0i"}], "authType": "EMAILPASSWD", "code": "FXnlDuoK", "country": "OnbTl44a", "dateOfBirth": "Akklr6fE", "displayName": "4z5qBvhL", "emailAddress": "WpruWTrC", "password": "sajGXEtl", "passwordMD5Sum": "mvkvDDDd", "reachMinimumAge": false, "uniqueDisplayName": "PHkio2Vx", "username": "llKaVqkf"}' \
    > test.out 2>&1
eval_tap $? 407 'PublicCreateUserV4' test.out

#- 408 CreateUserFromInvitationV4
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV4 \
    --invitationId 'Z0TZxmSh' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "bxCWMTp0", "policyId": "1GG4DcJn", "policyVersionId": "UAqiR0G9"}, {"isAccepted": true, "localizedPolicyVersionId": "UkfbkpRS", "policyId": "YDf5Y005", "policyVersionId": "PWmU9IpM"}, {"isAccepted": false, "localizedPolicyVersionId": "HWCz47XK", "policyId": "6B1gLhlL", "policyVersionId": "D2rT5Mt7"}], "authType": "EMAILPASSWD", "code": "x0O2zcwv", "country": "KRV10aEe", "dateOfBirth": "IF6AFlxC", "displayName": "ZNyZ4sRs", "emailAddress": "feKBwmc1", "password": "V4T8qkLy", "passwordMD5Sum": "MIUiWLjs", "reachMinimumAge": true, "uniqueDisplayName": "3ETr6gi4", "username": "0dhtqztC"}' \
    > test.out 2>&1
eval_tap $? 408 'CreateUserFromInvitationV4' test.out

#- 409 PublicUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "BVnurZiy", "country": "udy26IeV", "dateOfBirth": "kEcMGRTg", "displayName": "V7gnmsFJ", "languageTag": "saA5NnIG", "uniqueDisplayName": "WDN5OoTH", "userName": "pS6Q5CFM"}' \
    > test.out 2>&1
eval_tap $? 409 'PublicUpdateUserV4' test.out

#- 410 PublicUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "Gyysr0An", "emailAddress": "aXLOiEnY"}' \
    > test.out 2>&1
eval_tap $? 410 'PublicUpdateUserEmailAddressV4' test.out

#- 411 PublicUpgradeHeadlessAccountWithVerificationCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountWithVerificationCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "eniHoirU", "country": "pYqT1Xtj", "dateOfBirth": "p2zaabRk", "displayName": "WUZE3dI3", "emailAddress": "qW6wJ6z5", "password": "aNsSVatU", "reachMinimumAge": false, "uniqueDisplayName": "8gVWZq7U", "username": "6kL2vkqa", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 411 'PublicUpgradeHeadlessAccountWithVerificationCodeV4' test.out

#- 412 PublicUpgradeHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"dateOfBirth": "ZfExPVDy", "displayName": "LTnnp0QJ", "emailAddress": "uQv7Q9Ou", "password": "KKOF6yz3", "uniqueDisplayName": "uGtj5C7W", "username": "AIVTD7Ng"}' \
    > test.out 2>&1
eval_tap $? 412 'PublicUpgradeHeadlessAccountV4' test.out

#- 413 PublicDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"factor": "11iGIXHO", "mfaToken": "AzP9mXW4"}' \
    > test.out 2>&1
eval_tap $? 413 'PublicDisableMyAuthenticatorV4' test.out

#- 414 PublicEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'KfLXwPaU' \
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
    --body '{"factor": "VXbzT1H4", "mfaToken": "HO6wYUcy"}' \
    > test.out 2>&1
eval_tap $? 418 'PublicDisableMyBackupCodesV4' test.out

#- 419 PublicDownloadMyBackupCodesV4
eval_tap 0 419 'PublicDownloadMyBackupCodesV4 # SKIP deprecated' test.out

#- 420 PublicEnableMyBackupCodesV4
eval_tap 0 420 'PublicEnableMyBackupCodesV4 # SKIP deprecated' test.out

#- 421 PublicGetBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGetBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --languageTag 'BFnXWGYK' \
    > test.out 2>&1
eval_tap $? 421 'PublicGetBackupCodesV4' test.out

#- 422 PublicGenerateBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --languageTag 'BeXNo9I8' \
    > test.out 2>&1
eval_tap $? 422 'PublicGenerateBackupCodesV4' test.out

#- 423 PublicEnableBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --languageTag '9RhKCfcA' \
    > test.out 2>&1
eval_tap $? 423 'PublicEnableBackupCodesV4' test.out

#- 424 PublicChallengeMyMFAV4
./ng net.accelbyte.sdk.cli.Main iam publicChallengeMyMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'ANWgFuAA' \
    --factor 'vGzME7DH' \
    > test.out 2>&1
eval_tap $? 424 'PublicChallengeMyMFAV4' test.out

#- 425 PublicRemoveTrustedDeviceV4
./ng net.accelbyte.sdk.cli.Main iam publicRemoveTrustedDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceToken 'XKdymke3' \
    > test.out 2>&1
eval_tap $? 425 'PublicRemoveTrustedDeviceV4' test.out

#- 426 PublicSendMyMFAEmailCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicSendMyMFAEmailCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --action 'R6NgEt8j' \
    --languageTag '43fZLsix' \
    > test.out 2>&1
eval_tap $? 426 'PublicSendMyMFAEmailCodeV4' test.out

#- 427 PublicDisableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyEmailV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"factor": "20HCK11n", "mfaToken": "XfVX7XzG"}' \
    > test.out 2>&1
eval_tap $? 427 'PublicDisableMyEmailV4' test.out

#- 428 PublicEnableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyEmailV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'PFyKFidX' \
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
    --factor 'JxBg17IZ' \
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
    --userId 'GtKC08HR' \
    > test.out 2>&1
eval_tap $? 433 'PublicGetUserPublicInfoByUserIdV4' test.out

#- 434 PublicInviteUserV4
./ng net.accelbyte.sdk.cli.Main iam publicInviteUserV4 \
    --body '{"additionalData": "YLK5V1CQ", "emailAddress": "JX18JIaY", "languageTag": "YYy2xP78", "namespace": "ikRgqGKC", "namespaceDisplayName": "3WbRAv7M"}' \
    > test.out 2>&1
eval_tap $? 434 'PublicInviteUserV4' test.out

#- 435 PublicUpgradeHeadlessWithCodeV4Forward
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessWithCodeV4Forward \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "cJPFbEnx", "policyId": "4JlNhUL0", "policyVersionId": "3Iu6D2Pc"}, {"isAccepted": false, "localizedPolicyVersionId": "Db7cRrTB", "policyId": "MAPcBwVA", "policyVersionId": "H1iyJD6y"}, {"isAccepted": false, "localizedPolicyVersionId": "v6ij2cEC", "policyId": "h5fhOFx5", "policyVersionId": "uzBy3w0X"}], "code": "njelpiO6", "country": "3dPfmE7n", "dateOfBirth": "qzdpboxS", "displayName": "mQgZ84S9", "emailAddress": "hZqVSU1w", "password": "lxbLFREZ", "reachMinimumAge": false, "uniqueDisplayName": "Efbp1gbG", "username": "Sz7du3jC", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 435 'PublicUpgradeHeadlessWithCodeV4Forward' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
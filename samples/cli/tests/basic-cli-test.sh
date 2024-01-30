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
echo "1..70"

#- 1 Login
./ng net.accelbyte.sdk.cli.Main loginClient \
    > test.out 2>&1
eval_tap $? 1 'Login' test.out

if [ $EXIT_CODE -ne 0 ]; then
  echo "Bail out! Login failed."
  exit $EXIT_CODE
fi

touch "tmp.dat"

#- 2 GetNamespaces
./ng net.accelbyte.sdk.cli.Main basic getNamespaces \
    --activeOnly  \
    > test.out 2>&1
eval_tap $? 2 'GetNamespaces' test.out

#- 3 CreateNamespace
./ng net.accelbyte.sdk.cli.Main basic createNamespace \
    --body '{"displayName": "QjAfznS0", "namespace": "FcENg8li"}' \
    > test.out 2>&1
eval_tap $? 3 'CreateNamespace' test.out

#- 4 GetNamespace
./ng net.accelbyte.sdk.cli.Main basic getNamespace \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    > test.out 2>&1
eval_tap $? 4 'GetNamespace' test.out

#- 5 DeleteNamespace
./ng net.accelbyte.sdk.cli.Main basic deleteNamespace \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'DeleteNamespace' test.out

#- 6 GetActions
./ng net.accelbyte.sdk.cli.Main basic getActions \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'GetActions' test.out

#- 7 BanUsers
./ng net.accelbyte.sdk.cli.Main basic banUsers \
    --namespace "$AB_NAMESPACE" \
    --body '{"actionId": 93, "comment": "BciHQEC9", "userIds": ["jSVDj0QL", "VWvygXSp", "zitCQRoH"]}' \
    > test.out 2>&1
eval_tap $? 7 'BanUsers' test.out

#- 8 GetBannedUsers
./ng net.accelbyte.sdk.cli.Main basic getBannedUsers \
    --namespace "$AB_NAMESPACE" \
    --userIds 'IAw8Jfp9,qjLnPsZB,JsyfcZnm' \
    > test.out 2>&1
eval_tap $? 8 'GetBannedUsers' test.out

#- 9 ReportUser
./ng net.accelbyte.sdk.cli.Main basic reportUser \
    --namespace "$AB_NAMESPACE" \
    --body '{"category": "6lHWKnex", "description": "RAmaLPHG", "gameSessionId": "zpliK54t", "subcategory": "JtxzCDIH", "userId": "LLA2mVaQ"}' \
    > test.out 2>&1
eval_tap $? 9 'ReportUser' test.out

#- 10 GetUserStatus
./ng net.accelbyte.sdk.cli.Main basic getUserStatus \
    --namespace "$AB_NAMESPACE" \
    --userId 'lWH1hJin' \
    > test.out 2>&1
eval_tap $? 10 'GetUserStatus' test.out

#- 11 UnBanUsers
./ng net.accelbyte.sdk.cli.Main basic unBanUsers \
    --namespace "$AB_NAMESPACE" \
    --body '{"comment": "U1VI6Uey", "userIds": ["4sY0Cl7H", "LA7xr9gm", "jnwSoBfz"]}' \
    > test.out 2>&1
eval_tap $? 11 'UnBanUsers' test.out

#- 12 UpdateNamespace
./ng net.accelbyte.sdk.cli.Main basic updateNamespace \
    --namespace "$AB_NAMESPACE" \
    --body '{"displayName": "JN8bhN00"}' \
    > test.out 2>&1
eval_tap $? 12 'UpdateNamespace' test.out

#- 13 GetChildNamespaces
./ng net.accelbyte.sdk.cli.Main basic getChildNamespaces \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    > test.out 2>&1
eval_tap $? 13 'GetChildNamespaces' test.out

#- 14 CreateConfig
./ng net.accelbyte.sdk.cli.Main basic createConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"key": "56ThcBSH", "value": "bHuLc7Sj"}' \
    > test.out 2>&1
eval_tap $? 14 'CreateConfig' test.out

#- 15 GetConfig1
./ng net.accelbyte.sdk.cli.Main basic getConfig1 \
    --configKey 'YgbEAN7B' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'GetConfig1' test.out

#- 16 DeleteConfig1
./ng net.accelbyte.sdk.cli.Main basic deleteConfig1 \
    --configKey 'huXWCtxA' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'DeleteConfig1' test.out

#- 17 UpdateConfig1
./ng net.accelbyte.sdk.cli.Main basic updateConfig1 \
    --configKey 'A1AXRsh4' \
    --namespace "$AB_NAMESPACE" \
    --body '{"value": "2tXzbJQp"}' \
    > test.out 2>&1
eval_tap $? 17 'UpdateConfig1' test.out

#- 18 GetNamespaceContext
./ng net.accelbyte.sdk.cli.Main basic getNamespaceContext \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'GetNamespaceContext' test.out

#- 19 GetConfig
./ng net.accelbyte.sdk.cli.Main basic getConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 19 'GetConfig' test.out

#- 20 DeleteConfig
./ng net.accelbyte.sdk.cli.Main basic deleteConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'DeleteConfig' test.out

#- 21 UpdateConfig
./ng net.accelbyte.sdk.cli.Main basic updateConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"apiKey": "OdZ8ZUOM"}' \
    > test.out 2>&1
eval_tap $? 21 'UpdateConfig' test.out

#- 22 GeneratedUploadUrl
./ng net.accelbyte.sdk.cli.Main basic generatedUploadUrl \
    --folder '5P41gR0r' \
    --namespace "$AB_NAMESPACE" \
    --fileType 'GweZ63ED' \
    > test.out 2>&1
eval_tap $? 22 'GeneratedUploadUrl' test.out

#- 23 GetGameNamespaces
./ng net.accelbyte.sdk.cli.Main basic getGameNamespaces \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    > test.out 2>&1
eval_tap $? 23 'GetGameNamespaces' test.out

#- 24 GetCountries
eval_tap 0 24 'GetCountries # SKIP deprecated' test.out

#- 25 GetCountryGroups
./ng net.accelbyte.sdk.cli.Main basic getCountryGroups \
    --namespace "$AB_NAMESPACE" \
    --groupCode '8eSa57hT' \
    > test.out 2>&1
eval_tap $? 25 'GetCountryGroups' test.out

#- 26 AddCountryGroup
./ng net.accelbyte.sdk.cli.Main basic addCountryGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"countries": [{"code": "61frjCqE", "name": "cUuIULZH"}, {"code": "Ex1MzPIY", "name": "v7oqDnqi"}, {"code": "Es6y6Shk", "name": "Ycf21jHO"}], "countryGroupCode": "rAoWIQJh", "countryGroupName": "lAB6PUZs"}' \
    > test.out 2>&1
eval_tap $? 26 'AddCountryGroup' test.out

#- 27 UpdateCountryGroup
./ng net.accelbyte.sdk.cli.Main basic updateCountryGroup \
    --countryGroupCode 'DhLLTG6R' \
    --namespace "$AB_NAMESPACE" \
    --body '{"countries": [{"code": "oEoJQ2dl", "name": "8X76HMpr"}, {"code": "l2oZjpld", "name": "DN3rTP0I"}, {"code": "XlhDQ8TM", "name": "BgvegqFD"}], "countryGroupName": "OWT38GBY"}' \
    > test.out 2>&1
eval_tap $? 27 'UpdateCountryGroup' test.out

#- 28 DeleteCountryGroup
./ng net.accelbyte.sdk.cli.Main basic deleteCountryGroup \
    --countryGroupCode '795zzfF4' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'DeleteCountryGroup' test.out

#- 29 GetLanguages
./ng net.accelbyte.sdk.cli.Main basic getLanguages \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'GetLanguages' test.out

#- 30 GetTimeZones
./ng net.accelbyte.sdk.cli.Main basic getTimeZones \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'GetTimeZones' test.out

#- 31 GetUserProfileInfoByPublicId
./ng net.accelbyte.sdk.cli.Main basic getUserProfileInfoByPublicId \
    --namespace "$AB_NAMESPACE" \
    --publicId '6qaos0xi' \
    > test.out 2>&1
eval_tap $? 31 'GetUserProfileInfoByPublicId' test.out

#- 32 AdminGetUserProfilePublicInfoByIds
./ng net.accelbyte.sdk.cli.Main basic adminGetUserProfilePublicInfoByIds \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["uIoXNqHx", "u0OT5law", "6X4gmUj0"]}' \
    > test.out 2>&1
eval_tap $? 32 'AdminGetUserProfilePublicInfoByIds' test.out

#- 33 GetNamespacePublisher
./ng net.accelbyte.sdk.cli.Main basic getNamespacePublisher \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 33 'GetNamespacePublisher' test.out

#- 34 GetPublisherConfig
./ng net.accelbyte.sdk.cli.Main basic getPublisherConfig \
    --configKey 'HRfz3HOC' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 34 'GetPublisherConfig' test.out

#- 35 ChangeNamespaceStatus
./ng net.accelbyte.sdk.cli.Main basic changeNamespaceStatus \
    --namespace "$AB_NAMESPACE" \
    --body '{"status": "ACTIVE"}' \
    > test.out 2>&1
eval_tap $? 35 'ChangeNamespaceStatus' test.out

#- 36 AnonymizeUserProfile
./ng net.accelbyte.sdk.cli.Main basic anonymizeUserProfile \
    --namespace "$AB_NAMESPACE" \
    --userId 'OKJHiSbM' \
    > test.out 2>&1
eval_tap $? 36 'AnonymizeUserProfile' test.out

#- 37 GeneratedUserUploadContentUrl
./ng net.accelbyte.sdk.cli.Main basic generatedUserUploadContentUrl \
    --namespace "$AB_NAMESPACE" \
    --userId 'v9kGK7MA' \
    --category 'PqQANGXX' \
    --fileType 'GqNP4B4A' \
    > test.out 2>&1
eval_tap $? 37 'GeneratedUserUploadContentUrl' test.out

#- 38 GetUserProfileInfo
./ng net.accelbyte.sdk.cli.Main basic getUserProfileInfo \
    --namespace "$AB_NAMESPACE" \
    --userId 'Nqpu5rSs' \
    > test.out 2>&1
eval_tap $? 38 'GetUserProfileInfo' test.out

#- 39 UpdateUserProfile
./ng net.accelbyte.sdk.cli.Main basic updateUserProfile \
    --namespace "$AB_NAMESPACE" \
    --userId 'CS2lNQ1g' \
    --body '{"avatarLargeUrl": "3RXR8Pvh", "avatarSmallUrl": "sTmOFkUL", "avatarUrl": "b6LG1ztl", "customAttributes": {"IJwMtpQR": {}, "5JyF7BgO": {}, "mtSrsHmz": {}}, "dateOfBirth": "1986-01-13", "firstName": "3qInGRMj", "language": "Ti_na", "lastName": "rIRbAgeg", "privateCustomAttributes": {"UASwaRuu": {}, "oZnG6jPz": {}, "ptM4cCMK": {}}, "status": "INACTIVE", "timeZone": "WnGlZpNW", "zipCode": "fBp520sA"}' \
    > test.out 2>&1
eval_tap $? 39 'UpdateUserProfile' test.out

#- 40 DeleteUserProfile
./ng net.accelbyte.sdk.cli.Main basic deleteUserProfile \
    --namespace "$AB_NAMESPACE" \
    --userId 'NCGQ5LBT' \
    > test.out 2>&1
eval_tap $? 40 'DeleteUserProfile' test.out

#- 41 GetCustomAttributesInfo
./ng net.accelbyte.sdk.cli.Main basic getCustomAttributesInfo \
    --namespace "$AB_NAMESPACE" \
    --userId '15OQ0GoT' \
    > test.out 2>&1
eval_tap $? 41 'GetCustomAttributesInfo' test.out

#- 42 UpdateCustomAttributesPartially
./ng net.accelbyte.sdk.cli.Main basic updateCustomAttributesPartially \
    --namespace "$AB_NAMESPACE" \
    --userId 'qTDQJGd2' \
    --body '{"64iwHIaI": {}, "39974Bq5": {}, "6qOMbJL3": {}}' \
    > test.out 2>&1
eval_tap $? 42 'UpdateCustomAttributesPartially' test.out

#- 43 GetPrivateCustomAttributesInfo
./ng net.accelbyte.sdk.cli.Main basic getPrivateCustomAttributesInfo \
    --namespace "$AB_NAMESPACE" \
    --userId 'BYA8D3Bh' \
    > test.out 2>&1
eval_tap $? 43 'GetPrivateCustomAttributesInfo' test.out

#- 44 UpdatePrivateCustomAttributesPartially
./ng net.accelbyte.sdk.cli.Main basic updatePrivateCustomAttributesPartially \
    --namespace "$AB_NAMESPACE" \
    --userId 'RqHyGq43' \
    --body '{"4NplmFAv": {}, "az32iBsA": {}, "HNhZh5vt": {}}' \
    > test.out 2>&1
eval_tap $? 44 'UpdatePrivateCustomAttributesPartially' test.out

#- 45 UpdateUserProfileStatus
./ng net.accelbyte.sdk.cli.Main basic updateUserProfileStatus \
    --namespace "$AB_NAMESPACE" \
    --userId 'ynhAfDEL' \
    --body '{"status": "INACTIVE"}' \
    > test.out 2>&1
eval_tap $? 45 'UpdateUserProfileStatus' test.out

#- 46 PublicGetTime
./ng net.accelbyte.sdk.cli.Main basic publicGetTime \
    > test.out 2>&1
eval_tap $? 46 'PublicGetTime' test.out

#- 47 PublicGetNamespaces
./ng net.accelbyte.sdk.cli.Main basic publicGetNamespaces \
    --activeOnly  \
    > test.out 2>&1
eval_tap $? 47 'PublicGetNamespaces' test.out

#- 48 PublicGeneratedUploadUrl
./ng net.accelbyte.sdk.cli.Main basic publicGeneratedUploadUrl \
    --folder '93ElRos7' \
    --namespace "$AB_NAMESPACE" \
    --fileType 'EMTWR231' \
    > test.out 2>&1
eval_tap $? 48 'PublicGeneratedUploadUrl' test.out

#- 49 PublicGetCountries
eval_tap 0 49 'PublicGetCountries # SKIP deprecated' test.out

#- 50 PublicGetLanguages
./ng net.accelbyte.sdk.cli.Main basic publicGetLanguages \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 50 'PublicGetLanguages' test.out

#- 51 PublicGetTimeZones
./ng net.accelbyte.sdk.cli.Main basic publicGetTimeZones \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 51 'PublicGetTimeZones' test.out

#- 52 PublicGetUserProfilePublicInfoByIds
./ng net.accelbyte.sdk.cli.Main basic publicGetUserProfilePublicInfoByIds \
    --namespace "$AB_NAMESPACE" \
    --userIds '0PoRzz8Y' \
    > test.out 2>&1
eval_tap $? 52 'PublicGetUserProfilePublicInfoByIds' test.out

#- 53 PublicGetUserProfileInfoByPublicId
./ng net.accelbyte.sdk.cli.Main basic publicGetUserProfileInfoByPublicId \
    --namespace "$AB_NAMESPACE" \
    --publicId 'TM0ZmZuG' \
    > test.out 2>&1
eval_tap $? 53 'PublicGetUserProfileInfoByPublicId' test.out

#- 54 PublicGetNamespacePublisher
./ng net.accelbyte.sdk.cli.Main basic publicGetNamespacePublisher \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 54 'PublicGetNamespacePublisher' test.out

#- 55 GetMyProfileInfo
./ng net.accelbyte.sdk.cli.Main basic getMyProfileInfo \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 55 'GetMyProfileInfo' test.out

#- 56 UpdateMyProfile
./ng net.accelbyte.sdk.cli.Main basic updateMyProfile \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarLargeUrl": "LPetBKaE", "avatarSmallUrl": "wFehBfeQ", "avatarUrl": "tezesT7l", "customAttributes": {"wS0WgkIC": {}, "mImeI5mW": {}, "eluRc4MP": {}}, "dateOfBirth": "1984-04-24", "firstName": "GjwHK7Og", "language": "nSd_Pgbw_ES", "lastName": "7mAWpkdU", "privateCustomAttributes": {"cVuqtzwG": {}, "tR42v4Ns": {}, "ZsnBSGqm": {}}, "timeZone": "yprCc6cI", "zipCode": "6ZBQDQGn"}' \
    > test.out 2>&1
eval_tap $? 56 'UpdateMyProfile' test.out

#- 57 CreateMyProfile
./ng net.accelbyte.sdk.cli.Main basic createMyProfile \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarLargeUrl": "qcAXt5YA", "avatarSmallUrl": "D8iXi2lZ", "avatarUrl": "tmsacMyZ", "customAttributes": {"XVkCGZOR": {}, "v94jse4A": {}, "rIJJL6Pj": {}}, "dateOfBirth": "1988-09-09", "firstName": "9IGX9dPi", "language": "YW", "lastName": "N163En4G", "privateCustomAttributes": {"RMSN03W1": {}, "HwymPfrK": {}, "4iaCLH7F": {}}, "timeZone": "TkO6hf4b"}' \
    > test.out 2>&1
eval_tap $? 57 'CreateMyProfile' test.out

#- 58 GetMyPrivateCustomAttributesInfo
./ng net.accelbyte.sdk.cli.Main basic getMyPrivateCustomAttributesInfo \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 58 'GetMyPrivateCustomAttributesInfo' test.out

#- 59 UpdateMyPrivateCustomAttributesPartially
./ng net.accelbyte.sdk.cli.Main basic updateMyPrivateCustomAttributesPartially \
    --namespace "$AB_NAMESPACE" \
    --body '{"1NWbUlmC": {}, "5KDFYy9U": {}, "3iN7XCah": {}}' \
    > test.out 2>&1
eval_tap $? 59 'UpdateMyPrivateCustomAttributesPartially' test.out

#- 60 GetMyZipCode
./ng net.accelbyte.sdk.cli.Main basic getMyZipCode \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 60 'GetMyZipCode' test.out

#- 61 UpdateMyZipCode
./ng net.accelbyte.sdk.cli.Main basic updateMyZipCode \
    --namespace "$AB_NAMESPACE" \
    --userZipCodeUpdate '{"zipCode": "uJ4OGkVC"}' \
    > test.out 2>&1
eval_tap $? 61 'UpdateMyZipCode' test.out

#- 62 PublicReportUser
./ng net.accelbyte.sdk.cli.Main basic publicReportUser \
    --namespace "$AB_NAMESPACE" \
    --userId 'DD4Wvlzj' \
    --body '{"category": "tpMRTpfp", "description": "COyEUieu", "gameSessionId": "EiNCQNvt", "subcategory": "sSq6PEEG", "userId": "xgwmOpl0"}' \
    > test.out 2>&1
eval_tap $? 62 'PublicReportUser' test.out

#- 63 PublicGeneratedUserUploadContentUrl
./ng net.accelbyte.sdk.cli.Main basic publicGeneratedUserUploadContentUrl \
    --namespace "$AB_NAMESPACE" \
    --userId 'yO1Wmjbd' \
    --category 'rMqGt45T' \
    --fileType 'wf3JPDv8' \
    > test.out 2>&1
eval_tap $? 63 'PublicGeneratedUserUploadContentUrl' test.out

#- 64 PublicGetUserProfileInfo
./ng net.accelbyte.sdk.cli.Main basic publicGetUserProfileInfo \
    --namespace "$AB_NAMESPACE" \
    --userId 'N6rY6OuE' \
    > test.out 2>&1
eval_tap $? 64 'PublicGetUserProfileInfo' test.out

#- 65 PublicUpdateUserProfile
./ng net.accelbyte.sdk.cli.Main basic publicUpdateUserProfile \
    --namespace "$AB_NAMESPACE" \
    --userId 'RPZZ5DnG' \
    --body '{"avatarLargeUrl": "ZVM3KE5U", "avatarSmallUrl": "gbCVrF4l", "avatarUrl": "BuS0ZGIQ", "customAttributes": {"VIXOlMA1": {}, "L7TPcDHD": {}, "wzhRtw2V": {}}, "dateOfBirth": "1979-06-14", "firstName": "hMD8r1s0", "language": "tYpM_KD", "lastName": "0XCzq6s8", "privateCustomAttributes": {"wRMqrZYS": {}, "uJ0o6uEx": {}, "7g7YZ9DW": {}}, "timeZone": "VXCmcyhM", "zipCode": "DwgjqGXF"}' \
    > test.out 2>&1
eval_tap $? 65 'PublicUpdateUserProfile' test.out

#- 66 PublicCreateUserProfile
./ng net.accelbyte.sdk.cli.Main basic publicCreateUserProfile \
    --namespace "$AB_NAMESPACE" \
    --userId 'PN9pJIzm' \
    --body '{"avatarLargeUrl": "knKpI3T8", "avatarSmallUrl": "8viuWoFr", "avatarUrl": "llGCefww", "customAttributes": {"PEwKwCqh": {}, "cJ8eHkOP": {}, "PVyhDJ34": {}}, "dateOfBirth": "1993-01-30", "firstName": "vYKtVfhw", "language": "Zne_MjND_564", "lastName": "1UPVyrwp", "timeZone": "5IDqKJbs"}' \
    > test.out 2>&1
eval_tap $? 66 'PublicCreateUserProfile' test.out

#- 67 PublicGetCustomAttributesInfo
./ng net.accelbyte.sdk.cli.Main basic publicGetCustomAttributesInfo \
    --namespace "$AB_NAMESPACE" \
    --userId 'O2oPocfJ' \
    > test.out 2>&1
eval_tap $? 67 'PublicGetCustomAttributesInfo' test.out

#- 68 PublicUpdateCustomAttributesPartially
./ng net.accelbyte.sdk.cli.Main basic publicUpdateCustomAttributesPartially \
    --namespace "$AB_NAMESPACE" \
    --userId '1l0XZhig' \
    --body '{"0DFQn6b7": {}, "CjGqe2XA": {}, "UVnCWhNJ": {}}' \
    > test.out 2>&1
eval_tap $? 68 'PublicUpdateCustomAttributesPartially' test.out

#- 69 PublicGetUserProfilePublicInfo
./ng net.accelbyte.sdk.cli.Main basic publicGetUserProfilePublicInfo \
    --namespace "$AB_NAMESPACE" \
    --userId 'UfFxplvB' \
    > test.out 2>&1
eval_tap $? 69 'PublicGetUserProfilePublicInfo' test.out

#- 70 PublicUpdateUserProfileStatus
./ng net.accelbyte.sdk.cli.Main basic publicUpdateUserProfileStatus \
    --namespace "$AB_NAMESPACE" \
    --userId 'EBpN5T0T' \
    --body '{"status": "INACTIVE"}' \
    > test.out 2>&1
eval_tap $? 70 'PublicUpdateUserProfileStatus' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
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
echo "1..99"

#- 1 Login
./ng net.accelbyte.sdk.cli.Main loginClient \
    > test.out 2>&1
eval_tap $? 1 'Login' test.out

if [ $EXIT_CODE -ne 0 ]; then
  echo "Bail out! Login failed."
  exit $EXIT_CODE
fi

touch "tmp.dat"

#- 2 GetNamespaceSlotConfig
eval_tap 0 2 'GetNamespaceSlotConfig # SKIP deprecated' test.out

#- 3 UpdateNamespaceSlotConfig
eval_tap 0 3 'UpdateNamespaceSlotConfig # SKIP deprecated' test.out

#- 4 DeleteNamespaceSlotConfig
eval_tap 0 4 'DeleteNamespaceSlotConfig # SKIP deprecated' test.out

#- 5 GetUserSlotConfig
eval_tap 0 5 'GetUserSlotConfig # SKIP deprecated' test.out

#- 6 UpdateUserSlotConfig
eval_tap 0 6 'UpdateUserSlotConfig # SKIP deprecated' test.out

#- 7 DeleteUserSlotConfig
eval_tap 0 7 'DeleteUserSlotConfig # SKIP deprecated' test.out

#- 8 GetUserProfiles
./ng net.accelbyte.sdk.cli.Main social getUserProfiles \
    --namespace "$AB_NAMESPACE" \
    --userId '7W9DjPzF' \
    > test.out 2>&1
eval_tap $? 8 'GetUserProfiles' test.out

#- 9 GetProfile
./ng net.accelbyte.sdk.cli.Main social getProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'bVuTbnbW' \
    --userId 'vqmxb9es' \
    > test.out 2>&1
eval_tap $? 9 'GetProfile' test.out

#- 10 GetUserNamespaceSlots
eval_tap 0 10 'GetUserNamespaceSlots # SKIP deprecated' test.out

#- 11 GetSlotData
eval_tap 0 11 'GetSlotData # SKIP deprecated' test.out

#- 12 PublicGetUserGameProfiles
./ng net.accelbyte.sdk.cli.Main social publicGetUserGameProfiles \
    --namespace "$AB_NAMESPACE" \
    --userIds 'YFfnA4fd,muXkVKMd,7fIQYq5q' \
    > test.out 2>&1
eval_tap $? 12 'PublicGetUserGameProfiles' test.out

#- 13 PublicGetUserProfiles
./ng net.accelbyte.sdk.cli.Main social publicGetUserProfiles \
    --namespace "$AB_NAMESPACE" \
    --userId 'tEiHDqF3' \
    > test.out 2>&1
eval_tap $? 13 'PublicGetUserProfiles' test.out

#- 14 PublicCreateProfile
./ng net.accelbyte.sdk.cli.Main social publicCreateProfile \
    --namespace "$AB_NAMESPACE" \
    --userId 'lG46cRGm' \
    --body '{"achievements": ["WHxqJ7N5", "Cf2NsKXO", "FW8cVvzZ"], "attributes": {"KlW0zivB": "xJmFjSQg", "p5yNl2EZ": "yCKibTtH", "XP62Hpe6": "1JNRBCwi"}, "avatarUrl": "R44PqH4b", "inventories": ["GUfUpjXG", "vHAx7b6x", "5Z0aLFO5"], "label": "41q2qKyR", "profileName": "Eyl3Twk5", "statistics": ["aGVFDRQw", "QFhViYiy", "XuaqYGhF"], "tags": ["WVPHlRIE", "6O9RJbqi", "uncrUydr"]}' \
    > test.out 2>&1
eval_tap $? 14 'PublicCreateProfile' test.out

#- 15 PublicGetProfile
./ng net.accelbyte.sdk.cli.Main social publicGetProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId '0C7vpKDc' \
    --userId 'V3CRNefF' \
    > test.out 2>&1
eval_tap $? 15 'PublicGetProfile' test.out

#- 16 PublicUpdateProfile
./ng net.accelbyte.sdk.cli.Main social publicUpdateProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'lZaHyRYU' \
    --userId 'Le905Oos' \
    --body '{"achievements": ["suHyo84u", "oEJ50u6d", "m4WCTdu9"], "attributes": {"zsaHisGZ": "CiECZOnm", "naDKOnRJ": "qLpuWpIQ", "zW3MoOE5": "blGXAj1u"}, "avatarUrl": "4WPOCKzR", "inventories": ["2WifdruR", "UHHT2Bu3", "zlcCMGUp"], "label": "aNGCTIPV", "profileName": "KP5gYd4H", "statistics": ["xuXFJSmg", "RSMOjJOx", "LXdFbTnW"], "tags": ["kpz4fraE", "i44VXLhg", "5OIGF3rr"]}' \
    > test.out 2>&1
eval_tap $? 16 'PublicUpdateProfile' test.out

#- 17 PublicDeleteProfile
./ng net.accelbyte.sdk.cli.Main social publicDeleteProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'fYZjJdW1' \
    --userId 'CrlcSPRw' \
    > test.out 2>&1
eval_tap $? 17 'PublicDeleteProfile' test.out

#- 18 PublicGetProfileAttribute
./ng net.accelbyte.sdk.cli.Main social publicGetProfileAttribute \
    --attributeName 'ZsG0Bpow' \
    --namespace "$AB_NAMESPACE" \
    --profileId 'eHOZ0OHW' \
    --userId '0vKxZPpn' \
    > test.out 2>&1
eval_tap $? 18 'PublicGetProfileAttribute' test.out

#- 19 PublicUpdateAttribute
./ng net.accelbyte.sdk.cli.Main social publicUpdateAttribute \
    --attributeName 'a3XTWRsO' \
    --namespace "$AB_NAMESPACE" \
    --profileId 'K0aH3fYy' \
    --userId 'rbamk6u1' \
    --body '{"name": "tqgVta1j", "value": "OnSJ1Ip2"}' \
    > test.out 2>&1
eval_tap $? 19 'PublicUpdateAttribute' test.out

#- 20 PublicGetUserNamespaceSlots
eval_tap 0 20 'PublicGetUserNamespaceSlots # SKIP deprecated' test.out

#- 21 PublicCreateUserNamespaceSlot
eval_tap 0 21 'PublicCreateUserNamespaceSlot # SKIP deprecated' test.out

#- 22 PublicGetSlotData
eval_tap 0 22 'PublicGetSlotData # SKIP deprecated' test.out

#- 23 PublicUpdateUserNamespaceSlot
eval_tap 0 23 'PublicUpdateUserNamespaceSlot # SKIP deprecated' test.out

#- 24 PublicDeleteUserNamespaceSlot
eval_tap 0 24 'PublicDeleteUserNamespaceSlot # SKIP deprecated' test.out

#- 25 PublicUpdateUserNamespaceSlotMetadata
eval_tap 0 25 'PublicUpdateUserNamespaceSlotMetadata # SKIP deprecated' test.out

#- 26 GetGlobalStatItems
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItems \
    --namespace "$AB_NAMESPACE" \
    --limit '4' \
    --offset '7' \
    --statCodes 'RmeloDu3' \
    > test.out 2>&1
eval_tap $? 26 'GetGlobalStatItems' test.out

#- 27 GetGlobalStatItemByStatCode
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItemByStatCode \
    --namespace "$AB_NAMESPACE" \
    --statCode 'siccL7eT' \
    > test.out 2>&1
eval_tap $? 27 'GetGlobalStatItemByStatCode' test.out

#- 28 GetStatCycles
./ng net.accelbyte.sdk.cli.Main social getStatCycles \
    --namespace "$AB_NAMESPACE" \
    --cycleType 'ANNUALLY' \
    --limit '76' \
    --name 'fKKOlUvD' \
    --offset '51' \
    --sortBy 'pcupGsAs' \
    --status 'INIT' \
    > test.out 2>&1
eval_tap $? 28 'GetStatCycles' test.out

#- 29 CreateStatCycle
./ng net.accelbyte.sdk.cli.Main social createStatCycle \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleType": "ANNUALLY", "description": "2lm04tsg", "end": "1981-05-21T00:00:00Z", "id": "rkYkaypg", "name": "69G8Ie8n", "resetDate": 87, "resetDay": 21, "resetMonth": 56, "resetTime": "NqO68p0q", "seasonPeriod": 97, "start": "1975-07-09T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 29 'CreateStatCycle' test.out

#- 30 BulkGetStatCycle
./ng net.accelbyte.sdk.cli.Main social bulkGetStatCycle \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["dcEIYrTS", "j588xqAu", "3siWsNjq"]}' \
    > test.out 2>&1
eval_tap $? 30 'BulkGetStatCycle' test.out

#- 31 ExportStatCycle
./ng net.accelbyte.sdk.cli.Main social exportStatCycle \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 31 'ExportStatCycle' test.out

#- 32 ImportStatCycle
./ng net.accelbyte.sdk.cli.Main social importStatCycle \
    --namespace "$AB_NAMESPACE" \
    --replaceExisting  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 32 'ImportStatCycle' test.out

#- 33 GetStatCycle
./ng net.accelbyte.sdk.cli.Main social getStatCycle \
    --cycleId 'yZCPCtvp' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 33 'GetStatCycle' test.out

#- 34 UpdateStatCycle
./ng net.accelbyte.sdk.cli.Main social updateStatCycle \
    --cycleId 'YUeqKeWj' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleType": "SEASONAL", "description": "2QKGVf1l", "end": "1982-09-28T00:00:00Z", "name": "mOPojaX0", "resetDate": 76, "resetDay": 59, "resetMonth": 38, "resetTime": "fyNQMME7", "seasonPeriod": 11, "start": "1982-02-20T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 34 'UpdateStatCycle' test.out

#- 35 DeleteStatCycle
./ng net.accelbyte.sdk.cli.Main social deleteStatCycle \
    --cycleId '2Fz45hKR' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 35 'DeleteStatCycle' test.out

#- 36 BulkAddStats
./ng net.accelbyte.sdk.cli.Main social bulkAddStats \
    --cycleId 'c5lk2w7G' \
    --namespace "$AB_NAMESPACE" \
    --body '{"statCodes": ["Nem3FxPp", "CAT7pgtq", "50aR4o7l"]}' \
    > test.out 2>&1
eval_tap $? 36 'BulkAddStats' test.out

#- 37 StopStatCycle
./ng net.accelbyte.sdk.cli.Main social stopStatCycle \
    --cycleId 's3pbTRAN' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 37 'StopStatCycle' test.out

#- 38 BulkFetchStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'uhEUwAxT' \
    --userIds 'av8lfE3N' \
    > test.out 2>&1
eval_tap $? 38 'BulkFetchStatItems' test.out

#- 39 BulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.0020589781408855146, "statCode": "UgmOg6z3", "userId": "r28Y8Xzc"}, {"inc": 0.4464907488024845, "statCode": "kaEszcNj", "userId": "oRewDQze"}, {"inc": 0.532473335557198, "statCode": "255pqEey", "userId": "Ox3x6mpR"}]' \
    > test.out 2>&1
eval_tap $? 39 'BulkIncUserStatItem' test.out

#- 40 BulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.4036049661429253, "statCode": "21JR7gvu", "userId": "GSPVycMP"}, {"inc": 0.6928370140940053, "statCode": "1JkXVt9R", "userId": "nGvt9RzI"}, {"inc": 0.5306869233696762, "statCode": "q8dRw4zY", "userId": "DtCSznGO"}]' \
    > test.out 2>&1
eval_tap $? 40 'BulkIncUserStatItemValue' test.out

#- 41 BulkFetchOrDefaultStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'QVtnICUT' \
    --userIds '4UZX0tVH,mgkQsyeQ,W3yeEfQU' \
    > test.out 2>&1
eval_tap $? 41 'BulkFetchOrDefaultStatItems' test.out

#- 42 BulkResetUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "2wYZEm0w", "userId": "sh88GRes"}, {"statCode": "dgorhrJJ", "userId": "CwxSNQni"}, {"statCode": "DBMNGg3J", "userId": "Q340CwTi"}]' \
    > test.out 2>&1
eval_tap $? 42 'BulkResetUserStatItem' test.out

#- 43 GetStats
./ng net.accelbyte.sdk.cli.Main social getStats \
    --namespace "$AB_NAMESPACE" \
    --cycleIds 'mrb8r4dJ' \
    --isGlobal  \
    --isPublic  \
    --limit '45' \
    --offset '88' \
    > test.out 2>&1
eval_tap $? 43 'GetStats' test.out

#- 44 CreateStat
./ng net.accelbyte.sdk.cli.Main social createStat \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["5dl0KGR6", "ZJyp74Mw", "XQw5L6tQ"], "defaultValue": 0.5818204852161604, "description": "r6lcYh6O", "globalAggregationMethod": "MAX", "ignoreAdditionalDataOnValueRejected": true, "incrementOnly": false, "isPublic": false, "maximum": 0.531530149768925, "minimum": 0.40229399798595267, "name": "87mNljWC", "setAsGlobal": false, "setBy": "CLIENT", "statCode": "Kqu8JlTH", "tags": ["I07jSHbb", "eyEFJWPx", "tya14osN"], "visibility": "SHOWALL"}' \
    > test.out 2>&1
eval_tap $? 44 'CreateStat' test.out

#- 45 ExportStats
./ng net.accelbyte.sdk.cli.Main social exportStats \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 45 'ExportStats' test.out

#- 46 ImportStats
./ng net.accelbyte.sdk.cli.Main social importStats \
    --namespace "$AB_NAMESPACE" \
    --replaceExisting  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 46 'ImportStats' test.out

#- 47 QueryStats
./ng net.accelbyte.sdk.cli.Main social queryStats \
    --namespace "$AB_NAMESPACE" \
    --isGlobal  \
    --isPublic  \
    --limit '93' \
    --offset '9' \
    --keyword 'kc2WdupX' \
    > test.out 2>&1
eval_tap $? 47 'QueryStats' test.out

#- 48 GetStat
./ng net.accelbyte.sdk.cli.Main social getStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'QsUpIuJh' \
    > test.out 2>&1
eval_tap $? 48 'GetStat' test.out

#- 49 DeleteStat
./ng net.accelbyte.sdk.cli.Main social deleteStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'VfVZ83N2' \
    > test.out 2>&1
eval_tap $? 49 'DeleteStat' test.out

#- 50 UpdateStat
./ng net.accelbyte.sdk.cli.Main social updateStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'a81eJapL' \
    --body '{"cycleIds": ["DkJpFRXE", "858FxQbS", "ETVIfx7I"], "defaultValue": 0.34004433326271477, "description": "wRs70Mve", "globalAggregationMethod": "MAX", "ignoreAdditionalDataOnValueRejected": false, "isPublic": true, "name": "ScgCrcg2", "tags": ["ZeIhPew9", "Au7p3cZM", "R7dB4nqu"], "visibility": "SHOWALL"}' \
    > test.out 2>&1
eval_tap $? 50 'UpdateStat' test.out

#- 51 GetStatItems
./ng net.accelbyte.sdk.cli.Main social getStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'mfWuz9lO' \
    --limit '18' \
    --offset '38' \
    --sortBy 'CWGzm7Xp' \
    > test.out 2>&1
eval_tap $? 51 'GetStatItems' test.out

#- 52 DeleteTiedStat
./ng net.accelbyte.sdk.cli.Main social deleteTiedStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'pbgrHjFi' \
    > test.out 2>&1
eval_tap $? 52 'DeleteTiedStat' test.out

#- 53 GetUserStatCycleItems
./ng net.accelbyte.sdk.cli.Main social getUserStatCycleItems \
    --cycleId 'RqEoz0y0' \
    --namespace "$AB_NAMESPACE" \
    --userId '31K1mQak' \
    --isPublic  \
    --limit '16' \
    --offset '58' \
    --sortBy 'O9Z3UEGS' \
    --statCodes '2Y2aSLef' \
    > test.out 2>&1
eval_tap $? 53 'GetUserStatCycleItems' test.out

#- 54 GetUserStatItems
./ng net.accelbyte.sdk.cli.Main social getUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'r19MkJHS' \
    --isPublic  \
    --limit '66' \
    --offset '79' \
    --sortBy 'k8uUvTcz' \
    --statCodes 'dE96eCN1' \
    --tags 'E8g0S2JY' \
    > test.out 2>&1
eval_tap $? 54 'GetUserStatItems' test.out

#- 55 BulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social bulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'WHg8R9pk' \
    --body '[{"statCode": "S885Fo7B"}, {"statCode": "uGbk3510"}, {"statCode": "WXwgeeZD"}]' \
    > test.out 2>&1
eval_tap $? 55 'BulkCreateUserStatItems' test.out

#- 56 BulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'wJfwKWCs' \
    --body '[{"inc": 0.0745358510436408, "statCode": "cy5f2zGN"}, {"inc": 0.09110592278357998, "statCode": "RIJF6nM8"}, {"inc": 0.3695724036121054, "statCode": "Rzdc502E"}]' \
    > test.out 2>&1
eval_tap $? 56 'BulkIncUserStatItem1' test.out

#- 57 BulkIncUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'sJpPabMm' \
    --body '[{"inc": 0.8777909294026957, "statCode": "yFOh1rCE"}, {"inc": 0.29814726060916463, "statCode": "TIMrsVvy"}, {"inc": 0.2625335206084143, "statCode": "M44sgEiD"}]' \
    > test.out 2>&1
eval_tap $? 57 'BulkIncUserStatItemValue1' test.out

#- 58 BulkResetUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'x4RdqB6w' \
    --body '[{"statCode": "7KA3zEkj"}, {"statCode": "rqdXzfGp"}, {"statCode": "1z1uuV1f"}]' \
    > test.out 2>&1
eval_tap $? 58 'BulkResetUserStatItem1' test.out

#- 59 CreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social createUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'k9DiKwf6' \
    --userId 'XkSawDbu' \
    > test.out 2>&1
eval_tap $? 59 'CreateUserStatItem' test.out

#- 60 DeleteUserStatItems
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 't53fVc2d' \
    --userId 'mdtFHqGg' \
    > test.out 2>&1
eval_tap $? 60 'DeleteUserStatItems' test.out

#- 61 IncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social incUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'ZkX3n0ic' \
    --userId 'Z9UoRUOo' \
    --body '{"inc": 0.02399564481394434}' \
    > test.out 2>&1
eval_tap $? 61 'IncUserStatItemValue' test.out

#- 62 ResetUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'FVEQOHGc' \
    --userId 's5wms2oT' \
    --additionalKey 'qGaPt08b' \
    --body '{"additionalData": {"dj1AZzwr": {}, "nlzOcuqM": {}, "scKC6ZJY": {}}}' \
    > test.out 2>&1
eval_tap $? 62 'ResetUserStatItemValue' test.out

#- 63 GetGlobalStatItems1
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --limit '45' \
    --offset '24' \
    --statCodes 'Z26CWq8A' \
    > test.out 2>&1
eval_tap $? 63 'GetGlobalStatItems1' test.out

#- 64 GetGlobalStatItemByStatCode1
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItemByStatCode1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'LevfRSha' \
    > test.out 2>&1
eval_tap $? 64 'GetGlobalStatItemByStatCode1' test.out

#- 65 GetStatCycles1
./ng net.accelbyte.sdk.cli.Main social getStatCycles1 \
    --namespace "$AB_NAMESPACE" \
    --cycleType 'SEASONAL' \
    --limit '58' \
    --name 'bosSSotv' \
    --offset '78' \
    --sortBy 'Hg1lpd8K' \
    --status 'INIT' \
    > test.out 2>&1
eval_tap $? 65 'GetStatCycles1' test.out

#- 66 BulkGetStatCycle1
./ng net.accelbyte.sdk.cli.Main social bulkGetStatCycle1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["qm7wlGkJ", "gR68t8gQ", "cfAfVrEa"]}' \
    > test.out 2>&1
eval_tap $? 66 'BulkGetStatCycle1' test.out

#- 67 GetStatCycle1
./ng net.accelbyte.sdk.cli.Main social getStatCycle1 \
    --cycleId 'gARbUxUa' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 67 'GetStatCycle1' test.out

#- 68 BulkFetchStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'Uvj3yzjl' \
    --userIds 'mO7TXuQY' \
    > test.out 2>&1
eval_tap $? 68 'BulkFetchStatItems1' test.out

#- 69 PublicBulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.7035893536002423, "statCode": "b18kNT67", "userId": "ihJBqQ4k"}, {"inc": 0.25175233857682144, "statCode": "mFjRV86h", "userId": "O1qDZTXn"}, {"inc": 0.6436442000207651, "statCode": "paXry12r", "userId": "awRO4TrJ"}]' \
    > test.out 2>&1
eval_tap $? 69 'PublicBulkIncUserStatItem' test.out

#- 70 PublicBulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.8383992870870562, "statCode": "CdGTS3U7", "userId": "RvBLQ7pB"}, {"inc": 0.6429047159391811, "statCode": "9cxeBPTw", "userId": "hoUv6JmA"}, {"inc": 0.07948378406547274, "statCode": "shTpdGsf", "userId": "N0PkpYtj"}]' \
    > test.out 2>&1
eval_tap $? 70 'PublicBulkIncUserStatItemValue' test.out

#- 71 BulkResetUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "eR1kAFc1", "userId": "uLOPL8KP"}, {"statCode": "3nfC21rU", "userId": "HhxIMsN9"}, {"statCode": "YSBVmmy0", "userId": "J3GkoIb5"}]' \
    > test.out 2>&1
eval_tap $? 71 'BulkResetUserStatItem2' test.out

#- 72 CreateStat1
./ng net.accelbyte.sdk.cli.Main social createStat1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["x9ICDV2l", "APuWbkSH", "STX3yv32"], "defaultValue": 0.7068859973233946, "description": "YoE5llZ8", "globalAggregationMethod": "MAX", "ignoreAdditionalDataOnValueRejected": true, "incrementOnly": false, "isPublic": false, "maximum": 0.22567042543206595, "minimum": 0.2698453793109179, "name": "VFkGVwMU", "setAsGlobal": true, "setBy": "SERVER", "statCode": "nmhZVCoP", "tags": ["bbBUXKOR", "skR94tXX", "SWwZ1NBG"], "visibility": "SERVERONLY"}' \
    > test.out 2>&1
eval_tap $? 72 'CreateStat1' test.out

#- 73 PublicListMyStatCycleItems
./ng net.accelbyte.sdk.cli.Main social publicListMyStatCycleItems \
    --cycleId 'Yg3fzCWL' \
    --namespace "$AB_NAMESPACE" \
    --limit '76' \
    --offset '42' \
    --sortBy '4mHptPSi' \
    --statCodes 'ImwYbY1s,1J0jnIM4,q59112TL' \
    > test.out 2>&1
eval_tap $? 73 'PublicListMyStatCycleItems' test.out

#- 74 PublicListMyStatItems
./ng net.accelbyte.sdk.cli.Main social publicListMyStatItems \
    --namespace "$AB_NAMESPACE" \
    --limit '86' \
    --offset '10' \
    --sortBy 'ovtwOCHn' \
    --statCodes 'SmdKsp1k,zvr1HEsa,Ef6zxDtP' \
    --tags 'brH9uu85,DRzJkyuE,XjxIusYp' \
    > test.out 2>&1
eval_tap $? 74 'PublicListMyStatItems' test.out

#- 75 PublicListAllMyStatItems
./ng net.accelbyte.sdk.cli.Main social publicListAllMyStatItems \
    --namespace "$AB_NAMESPACE" \
    --additionalKey 'bbL86DcN' \
    --statCodes '7D6WjtPS,HLXEYGB4,sQbTDqfL' \
    --tags 'P94FQcwT,6gI1HlVL,CmBfm07E' \
    > test.out 2>&1
eval_tap $? 75 'PublicListAllMyStatItems' test.out

#- 76 GetUserStatCycleItems1
./ng net.accelbyte.sdk.cli.Main social getUserStatCycleItems1 \
    --cycleId 'sZX55uj7' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Xc0glRLx' \
    --limit '99' \
    --offset '66' \
    --sortBy 'O2mjp00n' \
    --statCodes 'kjV9gDpo' \
    > test.out 2>&1
eval_tap $? 76 'GetUserStatCycleItems1' test.out

#- 77 PublicQueryUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'fThPzXzo' \
    --limit '30' \
    --offset '87' \
    --sortBy 'jSPXNs2E' \
    --statCodes 'QDkQCX37' \
    --tags 'oRShSCd8' \
    > test.out 2>&1
eval_tap $? 77 'PublicQueryUserStatItems' test.out

#- 78 PublicBulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicBulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'lCxVI8QX' \
    --body '[{"statCode": "inmaZSf8"}, {"statCode": "dUv4BTXH"}, {"statCode": "NL7h1OuA"}]' \
    > test.out 2>&1
eval_tap $? 78 'PublicBulkCreateUserStatItems' test.out

#- 79 PublicQueryUserStatItems1
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'FGzr2xdx' \
    --additionalKey 'RarhX8dn' \
    --statCodes '4UvWhHeU,36x2bSTo,ApMFpUit' \
    --tags '8Fz4vomJ,CzKaFKKS,cH0U42PF' \
    > test.out 2>&1
eval_tap $? 79 'PublicQueryUserStatItems1' test.out

#- 80 PublicBulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId '1JFusZ2T' \
    --body '[{"inc": 0.05907066558526508, "statCode": "GhARjv7I"}, {"inc": 0.7574461929403792, "statCode": "gkC43c7j"}, {"inc": 0.5587384528806191, "statCode": "CUm1Eb5m"}]' \
    > test.out 2>&1
eval_tap $? 80 'PublicBulkIncUserStatItem1' test.out

#- 81 BulkIncUserStatItemValue2
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'tIZML82q' \
    --body '[{"inc": 0.8991007780919268, "statCode": "53tJtdA3"}, {"inc": 0.17393595390237537, "statCode": "qMwnPvi9"}, {"inc": 0.055474394762016876, "statCode": "LVTxBvT8"}]' \
    > test.out 2>&1
eval_tap $? 81 'BulkIncUserStatItemValue2' test.out

#- 82 BulkResetUserStatItem3
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'bO0C0nwY' \
    --body '[{"statCode": "VGcZgyL0"}, {"statCode": "6ixFVhHK"}, {"statCode": "wMrqc5qD"}]' \
    > test.out 2>&1
eval_tap $? 82 'BulkResetUserStatItem3' test.out

#- 83 PublicCreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicCreateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'sEa9UOE0' \
    --userId 'bdy9ktDj' \
    > test.out 2>&1
eval_tap $? 83 'PublicCreateUserStatItem' test.out

#- 84 DeleteUserStatItems1
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode '0dZmlwhA' \
    --userId 'VLGYpfsl' \
    > test.out 2>&1
eval_tap $? 84 'DeleteUserStatItems1' test.out

#- 85 PublicIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'FFY3qDPN' \
    --userId '9utnO2Z4' \
    --body '{"inc": 0.1143455936854807}' \
    > test.out 2>&1
eval_tap $? 85 'PublicIncUserStatItem' test.out

#- 86 PublicIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'Zm818IwZ' \
    --userId 'VdgHWf9f' \
    --body '{"inc": 0.16156843460320836}' \
    > test.out 2>&1
eval_tap $? 86 'PublicIncUserStatItemValue' test.out

#- 87 ResetUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'gu6aYQhG' \
    --userId 'E19nIYqx' \
    > test.out 2>&1
eval_tap $? 87 'ResetUserStatItemValue1' test.out

#- 88 BulkUpdateUserStatItemV2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItemV2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"Ho4BiuGR": {}, "s8in1Qd0": {}, "zmlg14PW": {}}, "additionalKey": "6lZWyUC3", "statCode": "b3FJYl7t", "updateStrategy": "MAX", "userId": "fx1RSabX", "value": 0.728257853832757}, {"additionalData": {"v51HfZ6F": {}, "rKquko9Q": {}, "hlwqUqHn": {}}, "additionalKey": "FchsxpYf", "statCode": "UpxABbw4", "updateStrategy": "INCREMENT", "userId": "Lv7erWX4", "value": 0.24916990315836463}, {"additionalData": {"5M6Rt8Zi": {}, "to5eBswo": {}, "rkHgJFJP": {}}, "additionalKey": "XewOOXsJ", "statCode": "CtldOVAM", "updateStrategy": "MIN", "userId": "J2hbbiFg", "value": 0.9045745866166623}]' \
    > test.out 2>&1
eval_tap $? 88 'BulkUpdateUserStatItemV2' test.out

#- 89 BulkFetchOrDefaultStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --additionalKey 'Dp73vLV8' \
    --statCode 'F3QrgSto' \
    --userIds 'xwzk5Agw,3c4uG8cu,2ZGv2UcF' \
    > test.out 2>&1
eval_tap $? 89 'BulkFetchOrDefaultStatItems1' test.out

#- 90 AdminListUsersStatItems
./ng net.accelbyte.sdk.cli.Main social adminListUsersStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'dHsfMvdy' \
    --additionalKey 'JhtNDtpT' \
    --statCodes '7GIGj6hi,VEIbJ1dT,ahKvRgz4' \
    --tags '7uKS8C52,9gU0LvCi,riUKRoq9' \
    > test.out 2>&1
eval_tap $? 90 'AdminListUsersStatItems' test.out

#- 91 BulkUpdateUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --userId '0h1vpZNB' \
    --additionalKey 'cPwUs3Br' \
    --body '[{"additionalData": {"IL32n08P": {}, "2PG56pZf": {}, "eUYBXbNt": {}}, "statCode": "seZBUGqh", "updateStrategy": "MIN", "value": 0.537588362082268}, {"additionalData": {"F9xQruF8": {}, "U85FBVRs": {}, "Nw5s2C8E": {}}, "statCode": "disROt5X", "updateStrategy": "MAX", "value": 0.5167914541783666}, {"additionalData": {"2a1cHuR3": {}, "aPOX9g2X": {}, "laRduncF": {}}, "statCode": "0tfCQsFy", "updateStrategy": "OVERRIDE", "value": 0.8150806911614653}]' \
    > test.out 2>&1
eval_tap $? 91 'BulkUpdateUserStatItem' test.out

#- 92 BulkGetOrDefaultByUserId
./ng net.accelbyte.sdk.cli.Main social bulkGetOrDefaultByUserId \
    --namespace "$AB_NAMESPACE" \
    --userId 'vbtYxZRr' \
    --additionalKey 'Sga76SXl' \
    --body '{"statCodes": ["oH1SkcbJ", "hvplPUOd", "ztvRpZbC"]}' \
    > test.out 2>&1
eval_tap $? 92 'BulkGetOrDefaultByUserId' test.out

#- 93 BulkResetUserStatItemValues
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItemValues \
    --namespace "$AB_NAMESPACE" \
    --userId 'qk84xJ4e' \
    --additionalKey 'yOfX3Ii6' \
    --body '[{"additionalData": {"FHxgyp6Z": {}, "XWFIwNs6": {}, "9hewz2cn": {}}, "statCode": "g44pB5x7"}, {"additionalData": {"J6hNKiiz": {}, "9FEU2CiA": {}, "C5OgpN2r": {}}, "statCode": "V7Eu9sAR"}, {"additionalData": {"POXvjvWX": {}, "toZJvurJ": {}, "NhbsPpAF": {}}, "statCode": "hUY2cJOF"}]' \
    > test.out 2>&1
eval_tap $? 93 'BulkResetUserStatItemValues' test.out

#- 94 DeleteUserStatItems2
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'XjM5N1cg' \
    --userId '1YVwMmWQ' \
    --additionalKey 'i6ebvsnv' \
    > test.out 2>&1
eval_tap $? 94 'DeleteUserStatItems2' test.out

#- 95 UpdateUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'XoKqXId2' \
    --userId '67jU8ZwS' \
    --additionalKey 'N24PSDLW' \
    --body '{"additionalData": {"GXtwmbtg": {}, "pqNv7i6U": {}, "zxr3tRdq": {}}, "updateStrategy": "MAX", "value": 0.5291990747823152}' \
    > test.out 2>&1
eval_tap $? 95 'UpdateUserStatItemValue' test.out

#- 96 BulkUpdateUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"3Cp5raax": {}, "VEajigGE": {}, "XdrV0qLa": {}}, "additionalKey": "pi9pGWr4", "statCode": "zfC8Vwj0", "updateStrategy": "INCREMENT", "userId": "bybhkAnx", "value": 0.7999231678148553}, {"additionalData": {"ajmgNTPJ": {}, "voT2FiU0": {}, "EYMIws5r": {}}, "additionalKey": "yIj9xYST", "statCode": "AuF2XknE", "updateStrategy": "INCREMENT", "userId": "YrP4AJE6", "value": 0.22162091531102068}, {"additionalData": {"C9htZzRf": {}, "Qa68HuCu": {}, "G9JNibPA": {}}, "additionalKey": "rLSkUmJb", "statCode": "uN1BXAYs", "updateStrategy": "OVERRIDE", "userId": "5QhKPBV2", "value": 0.1884729604684794}]' \
    > test.out 2>&1
eval_tap $? 96 'BulkUpdateUserStatItem1' test.out

#- 97 PublicQueryUserStatItems2
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'wnuvzRZl' \
    --additionalKey 'fxGxUXcf' \
    --statCodes '9leJBsWN,LTjwNn6V,gyHRpafI' \
    --tags 'qxxSScBE,Gda1CX6l,BZ7tOSOQ' \
    > test.out 2>&1
eval_tap $? 97 'PublicQueryUserStatItems2' test.out

#- 98 BulkUpdateUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'T1fVzANY' \
    --additionalKey 'CO2k8QPU' \
    --body '[{"additionalData": {"R5bmXfGq": {}, "bHBCrSoR": {}, "SNCR0HMR": {}}, "statCode": "U70pKpqk", "updateStrategy": "OVERRIDE", "value": 0.2868141032627839}, {"additionalData": {"SuCCIz6H": {}, "e7ifOnso": {}, "JcpduNTl": {}}, "statCode": "zHfFBvrj", "updateStrategy": "OVERRIDE", "value": 0.6022443197617371}, {"additionalData": {"tFP7RBn3": {}, "FLZpvURo": {}, "WtF6FNdi": {}}, "statCode": "YvGh5aU5", "updateStrategy": "MAX", "value": 0.3425816553749058}]' \
    > test.out 2>&1
eval_tap $? 98 'BulkUpdateUserStatItem2' test.out

#- 99 UpdateUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'TCLuRt5p' \
    --userId 'CbwNnguD' \
    --additionalKey 'iHPM5qnC' \
    --body '{"additionalData": {"udg06Ppr": {}, "7MDdRntj": {}, "iSGg1tyX": {}}, "updateStrategy": "INCREMENT", "value": 0.5558976187848905}' \
    > test.out 2>&1
eval_tap $? 99 'UpdateUserStatItemValue1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
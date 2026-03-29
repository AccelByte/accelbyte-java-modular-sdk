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
echo "1..100"

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
eval_tap 0 8 'GetUserProfiles # SKIP deprecated' test.out

#- 9 GetProfile
eval_tap 0 9 'GetProfile # SKIP deprecated' test.out

#- 10 GetUserNamespaceSlots
eval_tap 0 10 'GetUserNamespaceSlots # SKIP deprecated' test.out

#- 11 GetSlotData
eval_tap 0 11 'GetSlotData # SKIP deprecated' test.out

#- 12 PublicGetUserGameProfiles
eval_tap 0 12 'PublicGetUserGameProfiles # SKIP deprecated' test.out

#- 13 PublicGetUserProfiles
eval_tap 0 13 'PublicGetUserProfiles # SKIP deprecated' test.out

#- 14 PublicCreateProfile
eval_tap 0 14 'PublicCreateProfile # SKIP deprecated' test.out

#- 15 PublicGetProfile
eval_tap 0 15 'PublicGetProfile # SKIP deprecated' test.out

#- 16 PublicUpdateProfile
eval_tap 0 16 'PublicUpdateProfile # SKIP deprecated' test.out

#- 17 PublicDeleteProfile
eval_tap 0 17 'PublicDeleteProfile # SKIP deprecated' test.out

#- 18 PublicGetProfileAttribute
eval_tap 0 18 'PublicGetProfileAttribute # SKIP deprecated' test.out

#- 19 PublicUpdateAttribute
eval_tap 0 19 'PublicUpdateAttribute # SKIP deprecated' test.out

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
    --limit '6' \
    --offset '12' \
    --statCodes 'vDpcPgSL' \
    > test.out 2>&1
eval_tap $? 26 'GetGlobalStatItems' test.out

#- 27 GetGlobalStatItemByStatCode
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItemByStatCode \
    --namespace "$AB_NAMESPACE" \
    --statCode 'B3IwQZQ8' \
    > test.out 2>&1
eval_tap $? 27 'GetGlobalStatItemByStatCode' test.out

#- 28 GetStatCycles
./ng net.accelbyte.sdk.cli.Main social getStatCycles \
    --namespace "$AB_NAMESPACE" \
    --cycleType 'MONTHLY' \
    --limit '6' \
    --name 'Um3sQeP8' \
    --offset '84' \
    --sortBy 'RTz7w65d' \
    --status 'INIT' \
    > test.out 2>&1
eval_tap $? 28 'GetStatCycles' test.out

#- 29 CreateStatCycle
./ng net.accelbyte.sdk.cli.Main social createStatCycle \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleType": "WEEKLY", "description": "U2CNUCdW", "end": "1984-02-12T00:00:00Z", "id": "rOI5FboD", "name": "GTml28Rl", "resetDate": 81, "resetDay": 25, "resetMonth": 26, "resetTime": "yBwPNCNR", "seasonPeriod": 13, "start": "1979-07-06T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 29 'CreateStatCycle' test.out

#- 30 BulkGetStatCycle
./ng net.accelbyte.sdk.cli.Main social bulkGetStatCycle \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["Py187jLe", "alrTLlEF", "8hvcYyEp"]}' \
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
    --cycleId 'CMEsKMKQ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 33 'GetStatCycle' test.out

#- 34 UpdateStatCycle
./ng net.accelbyte.sdk.cli.Main social updateStatCycle \
    --cycleId 'PEVO5krR' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleType": "DAILY", "description": "YEOPCV5e", "end": "1981-10-12T00:00:00Z", "name": "Dae5U1NV", "resetDate": 0, "resetDay": 47, "resetMonth": 91, "resetTime": "A5LwpIi0", "seasonPeriod": 98, "start": "1999-11-20T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 34 'UpdateStatCycle' test.out

#- 35 DeleteStatCycle
./ng net.accelbyte.sdk.cli.Main social deleteStatCycle \
    --cycleId 'wUp1x7BZ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 35 'DeleteStatCycle' test.out

#- 36 ResetStatCycle
./ng net.accelbyte.sdk.cli.Main social resetStatCycle \
    --cycleId 'TkN35zeq' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 36 'ResetStatCycle' test.out

#- 37 BulkAddStats
./ng net.accelbyte.sdk.cli.Main social bulkAddStats \
    --cycleId 'VbDzGGqz' \
    --namespace "$AB_NAMESPACE" \
    --body '{"statCodes": ["dscyYVrP", "DKITfLNE", "4q5v61n5"]}' \
    > test.out 2>&1
eval_tap $? 37 'BulkAddStats' test.out

#- 38 StopStatCycle
./ng net.accelbyte.sdk.cli.Main social stopStatCycle \
    --cycleId 'IkxpToLn' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 38 'StopStatCycle' test.out

#- 39 BulkFetchStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'Fx1fwZ5M' \
    --userIds 'PIwaAq6C' \
    > test.out 2>&1
eval_tap $? 39 'BulkFetchStatItems' test.out

#- 40 BulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.880731715518165, "statCode": "KMh3uYZE", "userId": "1bbSvVre"}, {"inc": 0.5275522012661743, "statCode": "TsQhahoS", "userId": "vaDQ4faN"}, {"inc": 0.27910967109636375, "statCode": "frabPtd6", "userId": "hPK580Yh"}]' \
    > test.out 2>&1
eval_tap $? 40 'BulkIncUserStatItem' test.out

#- 41 BulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.9309351095693144, "statCode": "awOYraA8", "userId": "KarPif75"}, {"inc": 0.6853361446175398, "statCode": "lBW9BdN5", "userId": "3qL4dIeW"}, {"inc": 0.23394278115365075, "statCode": "MRQT1OWx", "userId": "VERhoi9Z"}]' \
    > test.out 2>&1
eval_tap $? 41 'BulkIncUserStatItemValue' test.out

#- 42 BulkFetchOrDefaultStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'U3v3iJMc' \
    --userIds 'EkCStDRL,RToDcVOz,xqgPcyom' \
    > test.out 2>&1
eval_tap $? 42 'BulkFetchOrDefaultStatItems' test.out

#- 43 BulkResetUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "satav8aY", "userId": "jlogdqw9"}, {"statCode": "PeC02W39", "userId": "1PrJAwbB"}, {"statCode": "90rk8gC0", "userId": "jjfLjqg0"}]' \
    > test.out 2>&1
eval_tap $? 43 'BulkResetUserStatItem' test.out

#- 44 GetStats
./ng net.accelbyte.sdk.cli.Main social getStats \
    --namespace "$AB_NAMESPACE" \
    --cycleIds 'KIqk1HGS' \
    --isGlobal  \
    --isPublic  \
    --limit '78' \
    --offset '100' \
    > test.out 2>&1
eval_tap $? 44 'GetStats' test.out

#- 45 CreateStat
./ng net.accelbyte.sdk.cli.Main social createStat \
    --namespace "$AB_NAMESPACE" \
    --body '{"capCycleOverride": false, "cycleIds": ["8wFOT11X", "xn1D8lcK", "wdClRJCa"], "cycleOverrides": [{"cycleId": "inOt3ovn", "maximum": 0.6895638307075345, "minimum": 0.4960669867824288}, {"cycleId": "nen4oiU4", "maximum": 0.1576966103058286, "minimum": 0.9843245891543283}, {"cycleId": "vXzDEgtx", "maximum": 0.08415689069403842, "minimum": 0.2758152295212226}], "defaultValue": 0.1065668090216878, "description": "2aKMYXnc", "globalAggregationMethod": "TOTAL", "ignoreAdditionalDataOnValueRejected": true, "incrementOnly": false, "isPublic": false, "maximum": 0.3218598718166389, "minimum": 0.38976311677560593, "name": "uzryf9rR", "setAsGlobal": false, "setBy": "SERVER", "statCode": "haREGbw1", "tags": ["a1apNOH2", "0Wz8OMs8", "TWLShElc"], "visibility": "SHOWALL"}' \
    > test.out 2>&1
eval_tap $? 45 'CreateStat' test.out

#- 46 ExportStats
./ng net.accelbyte.sdk.cli.Main social exportStats \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 46 'ExportStats' test.out

#- 47 ImportStats
./ng net.accelbyte.sdk.cli.Main social importStats \
    --namespace "$AB_NAMESPACE" \
    --replaceExisting  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 47 'ImportStats' test.out

#- 48 QueryStats
./ng net.accelbyte.sdk.cli.Main social queryStats \
    --namespace "$AB_NAMESPACE" \
    --isGlobal  \
    --isPublic  \
    --limit '6' \
    --offset '22' \
    --keyword 'nL1ylSqC' \
    > test.out 2>&1
eval_tap $? 48 'QueryStats' test.out

#- 49 GetStat
./ng net.accelbyte.sdk.cli.Main social getStat \
    --namespace "$AB_NAMESPACE" \
    --statCode '73395qRz' \
    > test.out 2>&1
eval_tap $? 49 'GetStat' test.out

#- 50 DeleteStat
./ng net.accelbyte.sdk.cli.Main social deleteStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'Nqcqk177' \
    > test.out 2>&1
eval_tap $? 50 'DeleteStat' test.out

#- 51 UpdateStat
./ng net.accelbyte.sdk.cli.Main social updateStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'BWdNgsbX' \
    --body '{"capCycleOverride": false, "cycleIds": ["ICzzjmtZ", "qeazWBut", "TPyFHdUQ"], "cycleOverrides": [{"cycleId": "UTODNMFk", "maximum": 0.2787180229817027, "minimum": 0.5066575762914449}, {"cycleId": "aubtMCOe", "maximum": 0.45099452693304265, "minimum": 0.1742985184095499}, {"cycleId": "lBC3TIJe", "maximum": 0.23789178791421506, "minimum": 0.0591925006552545}], "defaultValue": 0.6888382653522321, "description": "QyjjFjx8", "globalAggregationMethod": "MAX", "ignoreAdditionalDataOnValueRejected": false, "incrementOnly": true, "isPublic": false, "maximum": 0.6368362437712797, "minimum": 0.08237125702994319, "name": "4EnmyVaB", "setAsGlobal": false, "setBy": "CLIENT", "tags": ["T3dwYVZA", "QhAdGNzH", "sCH8jBEg"], "visibility": "SHOWALL"}' \
    > test.out 2>&1
eval_tap $? 51 'UpdateStat' test.out

#- 52 GetStatItems
./ng net.accelbyte.sdk.cli.Main social getStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'TzryWXPi' \
    --limit '48' \
    --offset '15' \
    --sortBy 'CgbUAigw' \
    > test.out 2>&1
eval_tap $? 52 'GetStatItems' test.out

#- 53 DeleteTiedStat
./ng net.accelbyte.sdk.cli.Main social deleteTiedStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'gGZevQVY' \
    > test.out 2>&1
eval_tap $? 53 'DeleteTiedStat' test.out

#- 54 GetUserStatCycleItems
./ng net.accelbyte.sdk.cli.Main social getUserStatCycleItems \
    --cycleId 'LefJeQC1' \
    --namespace "$AB_NAMESPACE" \
    --userId 'EcRUHi9r' \
    --isPublic  \
    --limit '50' \
    --offset '19' \
    --sortBy 'ozqUN1UN' \
    --statCodes 'UswhWa69' \
    > test.out 2>&1
eval_tap $? 54 'GetUserStatCycleItems' test.out

#- 55 GetUserStatItems
./ng net.accelbyte.sdk.cli.Main social getUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'AD2a73pS' \
    --isPublic  \
    --limit '97' \
    --offset '61' \
    --sortBy 'enjuYQD8' \
    --statCodes 'MdVCpYVz' \
    --tags 'aRWQh95b' \
    > test.out 2>&1
eval_tap $? 55 'GetUserStatItems' test.out

#- 56 BulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social bulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'buS4rx7h' \
    --body '[{"statCode": "r3KgdDA8"}, {"statCode": "Sxw7cr8E"}, {"statCode": "obQkrrEz"}]' \
    > test.out 2>&1
eval_tap $? 56 'BulkCreateUserStatItems' test.out

#- 57 BulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'YPKJGhbh' \
    --body '[{"inc": 0.5827727682330266, "statCode": "YMaKgJhZ"}, {"inc": 0.14709955030532762, "statCode": "H4PcRafD"}, {"inc": 0.6264077675261259, "statCode": "5rJtNUSs"}]' \
    > test.out 2>&1
eval_tap $? 57 'BulkIncUserStatItem1' test.out

#- 58 BulkIncUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'tUYQbvCf' \
    --body '[{"inc": 0.9281853224800257, "statCode": "zzDTqYfL"}, {"inc": 0.6956668907509201, "statCode": "g8MDpx2G"}, {"inc": 0.09470316135133605, "statCode": "1YJEv8Jy"}]' \
    > test.out 2>&1
eval_tap $? 58 'BulkIncUserStatItemValue1' test.out

#- 59 BulkResetUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'xaA50SPV' \
    --body '[{"statCode": "O3quBUzl"}, {"statCode": "ULmmxv2M"}, {"statCode": "JkeHviyp"}]' \
    > test.out 2>&1
eval_tap $? 59 'BulkResetUserStatItem1' test.out

#- 60 CreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social createUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'qWrsVf9g' \
    --userId 'c3SfmZ8G' \
    > test.out 2>&1
eval_tap $? 60 'CreateUserStatItem' test.out

#- 61 DeleteUserStatItems
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'MGCGwxKK' \
    --userId 'vkm7arn3' \
    > test.out 2>&1
eval_tap $? 61 'DeleteUserStatItems' test.out

#- 62 IncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social incUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode '6nNqN1dS' \
    --userId 'GW1QnL70' \
    --body '{"inc": 0.6720590696199109}' \
    > test.out 2>&1
eval_tap $? 62 'IncUserStatItemValue' test.out

#- 63 ResetUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'AvsD0xUG' \
    --userId 'b0B8CxLZ' \
    --additionalKey 'CILrq0qp' \
    --body '{"additionalData": {"HGHFTOKT": {}, "j7oyuccX": {}, "U9ernIHm": {}}}' \
    > test.out 2>&1
eval_tap $? 63 'ResetUserStatItemValue' test.out

#- 64 GetGlobalStatItems1
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --limit '64' \
    --offset '73' \
    --statCodes '72hxvUe9' \
    > test.out 2>&1
eval_tap $? 64 'GetGlobalStatItems1' test.out

#- 65 GetGlobalStatItemByStatCode1
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItemByStatCode1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'aIUgGJyi' \
    > test.out 2>&1
eval_tap $? 65 'GetGlobalStatItemByStatCode1' test.out

#- 66 GetStatCycles1
./ng net.accelbyte.sdk.cli.Main social getStatCycles1 \
    --namespace "$AB_NAMESPACE" \
    --cycleType 'MONTHLY' \
    --limit '14' \
    --name 'XTyPDV57' \
    --offset '14' \
    --sortBy 'HN4jFVPr' \
    --status 'STOPPED' \
    > test.out 2>&1
eval_tap $? 66 'GetStatCycles1' test.out

#- 67 BulkGetStatCycle1
./ng net.accelbyte.sdk.cli.Main social bulkGetStatCycle1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["YhvQJy5m", "Ca8VCIOA", "e7OvaezU"]}' \
    > test.out 2>&1
eval_tap $? 67 'BulkGetStatCycle1' test.out

#- 68 GetStatCycle1
./ng net.accelbyte.sdk.cli.Main social getStatCycle1 \
    --cycleId 'Oh3qWtfi' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 68 'GetStatCycle1' test.out

#- 69 BulkFetchStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'uFgGuENL' \
    --userIds 'n4YMCp56' \
    > test.out 2>&1
eval_tap $? 69 'BulkFetchStatItems1' test.out

#- 70 PublicBulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.8844106888415342, "statCode": "lZo4GNd5", "userId": "vUd5s39Q"}, {"inc": 0.24720412868782182, "statCode": "Tn4bTpWe", "userId": "2kgLuo3r"}, {"inc": 0.9705628744490686, "statCode": "BWQpbQRi", "userId": "11nScjVA"}]' \
    > test.out 2>&1
eval_tap $? 70 'PublicBulkIncUserStatItem' test.out

#- 71 PublicBulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.795517176927722, "statCode": "y1UUlzPl", "userId": "O8uF2GAv"}, {"inc": 0.34394349001933433, "statCode": "909rc3l4", "userId": "CM8HFNhW"}, {"inc": 0.028011219748914074, "statCode": "Fc4Co6MY", "userId": "ttpcwOCj"}]' \
    > test.out 2>&1
eval_tap $? 71 'PublicBulkIncUserStatItemValue' test.out

#- 72 BulkResetUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "MdX4O723", "userId": "P1JDUSBH"}, {"statCode": "0ZYLsyj5", "userId": "1QWGDp5F"}, {"statCode": "xyU89Gyu", "userId": "GxH4fMZ7"}]' \
    > test.out 2>&1
eval_tap $? 72 'BulkResetUserStatItem2' test.out

#- 73 CreateStat1
./ng net.accelbyte.sdk.cli.Main social createStat1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"capCycleOverride": true, "cycleIds": ["nWh99qlI", "aQasLDIv", "SZ7jtflh"], "cycleOverrides": [{"cycleId": "avr3b7YH", "maximum": 0.241890631070239, "minimum": 0.28556779454353454}, {"cycleId": "zKSgHu8c", "maximum": 0.18308664804740826, "minimum": 0.030290574788119917}, {"cycleId": "Pct4h7lr", "maximum": 0.28647810487991476, "minimum": 0.30722117716509456}], "defaultValue": 0.17792706266268354, "description": "0dzrKZSv", "globalAggregationMethod": "MAX", "ignoreAdditionalDataOnValueRejected": false, "incrementOnly": false, "isPublic": false, "maximum": 0.5791956551190893, "minimum": 0.544553424752117, "name": "0FAysBUj", "setAsGlobal": true, "setBy": "SERVER", "statCode": "JQbWg3Jy", "tags": ["dBf7JtAq", "7IjCb0s8", "QOqrZlqP"], "visibility": "SERVERONLY"}' \
    > test.out 2>&1
eval_tap $? 73 'CreateStat1' test.out

#- 74 PublicListMyStatCycleItems
./ng net.accelbyte.sdk.cli.Main social publicListMyStatCycleItems \
    --cycleId '1dgGbDT7' \
    --namespace "$AB_NAMESPACE" \
    --limit '69' \
    --offset '85' \
    --sortBy 'catShCRe' \
    --statCodes 'R7fAqDkA,rb4dfAdw,X9GVjGEw' \
    > test.out 2>&1
eval_tap $? 74 'PublicListMyStatCycleItems' test.out

#- 75 PublicListMyStatItems
./ng net.accelbyte.sdk.cli.Main social publicListMyStatItems \
    --namespace "$AB_NAMESPACE" \
    --limit '74' \
    --offset '29' \
    --sortBy 'QqNifUOE' \
    --statCodes 'D1bHhvie,loYIDDkt,UA8mzReo' \
    --tags 'sfFTpxIn,kXUUrpPR,Bgm7oHoP' \
    > test.out 2>&1
eval_tap $? 75 'PublicListMyStatItems' test.out

#- 76 PublicListAllMyStatItems
./ng net.accelbyte.sdk.cli.Main social publicListAllMyStatItems \
    --namespace "$AB_NAMESPACE" \
    --additionalKey 'p8SfWTtF' \
    --statCodes 'sFrhlmgH,uIIsYhmQ,1X1zOuMN' \
    --tags 'HgX9B9Y7,ToQFKxrO,jr9XvnyS' \
    > test.out 2>&1
eval_tap $? 76 'PublicListAllMyStatItems' test.out

#- 77 GetUserStatCycleItems1
./ng net.accelbyte.sdk.cli.Main social getUserStatCycleItems1 \
    --cycleId 'mBFJyKco' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Pb3XZrUH' \
    --limit '20' \
    --offset '68' \
    --sortBy '1vfWm6rl' \
    --statCodes 'hWBYrzwF' \
    > test.out 2>&1
eval_tap $? 77 'GetUserStatCycleItems1' test.out

#- 78 PublicQueryUserStatItems1
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'XnutY7Xk' \
    --limit '44' \
    --offset '59' \
    --sortBy 'NkSZpx4g' \
    --statCodes 'vGVza6ow' \
    --tags 'rxX8UX6z' \
    > test.out 2>&1
eval_tap $? 78 'PublicQueryUserStatItems1' test.out

#- 79 PublicBulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicBulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'YVdyPGg7' \
    --body '[{"statCode": "1haUQjZG"}, {"statCode": "eWtVJdVO"}, {"statCode": "fGKbZLOo"}]' \
    > test.out 2>&1
eval_tap $? 79 'PublicBulkCreateUserStatItems' test.out

#- 80 PublicQueryUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'zGzQghrE' \
    --additionalKey 'ijAJuKjO' \
    --statCodes 'd6qKjGMN,FUu5FvF8,CUcIVQC9' \
    --tags 'PwJKfD7q,Vvx8vpy1,QvVHQItY' \
    > test.out 2>&1
eval_tap $? 80 'PublicQueryUserStatItems' test.out

#- 81 PublicBulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'VcNN9sJv' \
    --body '[{"inc": 0.32387911481637555, "statCode": "kbobbdBJ"}, {"inc": 0.23559816070191053, "statCode": "HFyQ23tz"}, {"inc": 0.2776580044936505, "statCode": "4Leb7Jiq"}]' \
    > test.out 2>&1
eval_tap $? 81 'PublicBulkIncUserStatItem1' test.out

#- 82 BulkIncUserStatItemValue2
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'lFCs7URB' \
    --body '[{"inc": 0.8614689312469641, "statCode": "LAbArdyK"}, {"inc": 0.28061636549197244, "statCode": "VvwgKp6q"}, {"inc": 0.2068247988797295, "statCode": "FgLfeKF2"}]' \
    > test.out 2>&1
eval_tap $? 82 'BulkIncUserStatItemValue2' test.out

#- 83 BulkResetUserStatItem3
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'CsSk8XRF' \
    --body '[{"statCode": "0M5EfnfV"}, {"statCode": "GfprItsb"}, {"statCode": "JH7I6xQw"}]' \
    > test.out 2>&1
eval_tap $? 83 'BulkResetUserStatItem3' test.out

#- 84 PublicCreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicCreateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'JYY5nIFp' \
    --userId 'l8C3y5Ez' \
    > test.out 2>&1
eval_tap $? 84 'PublicCreateUserStatItem' test.out

#- 85 DeleteUserStatItems1
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode '3Q5lJv3P' \
    --userId '4JRg4lOt' \
    > test.out 2>&1
eval_tap $? 85 'DeleteUserStatItems1' test.out

#- 86 PublicIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'UXJzkvTe' \
    --userId '0sU2xlts' \
    --body '{"inc": 0.2544467519575325}' \
    > test.out 2>&1
eval_tap $? 86 'PublicIncUserStatItem' test.out

#- 87 PublicIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'zfqwnf7b' \
    --userId 'Em9VAFBp' \
    --body '{"inc": 0.18555600114318038}' \
    > test.out 2>&1
eval_tap $? 87 'PublicIncUserStatItemValue' test.out

#- 88 ResetUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode '5zsKVcDU' \
    --userId 'UsYsIijt' \
    > test.out 2>&1
eval_tap $? 88 'ResetUserStatItemValue1' test.out

#- 89 BulkUpdateUserStatItemV2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItemV2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"EScmpVnS": {}, "dHbdNkfc": {}, "vMqfUSg5": {}}, "additionalKey": "zImOWHBc", "requestId": "WNFb6cEs", "statCode": "78KUPEaC", "updateStrategy": "MAX", "userId": "69CiyyCV", "value": 0.27704520769160723}, {"additionalData": {"SRW6ZDpw": {}, "zKRDPPD1": {}, "yeNGX5ZF": {}}, "additionalKey": "2uwhqqX2", "requestId": "2OsLURyG", "statCode": "dfFmF6Iy", "updateStrategy": "OVERRIDE", "userId": "hNW8Ggao", "value": 0.44840478336203715}, {"additionalData": {"Yiaz7uyP": {}, "o8WYKLmH": {}, "qIPBFfwf": {}}, "additionalKey": "lymzukod", "requestId": "xhCzCyem", "statCode": "aInLMocV", "updateStrategy": "INCREMENT", "userId": "rKEawMDF", "value": 0.9584256914954986}]' \
    > test.out 2>&1
eval_tap $? 89 'BulkUpdateUserStatItemV2' test.out

#- 90 BulkFetchOrDefaultStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --additionalKey 'ViEHz44B' \
    --statCode 'GTf71k7M' \
    --userIds '21kHjTrc,xlSFeGqN,y7FBylza' \
    > test.out 2>&1
eval_tap $? 90 'BulkFetchOrDefaultStatItems1' test.out

#- 91 AdminListUsersStatItems
./ng net.accelbyte.sdk.cli.Main social adminListUsersStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId '8pMFoR2x' \
    --additionalKey 'xO1pUBkr' \
    --statCodes 'MzR7Q65y,8TjwcuLj,iTELeBMX' \
    --tags 'Gk6mM5DV,GXlpBDfB,naw3q84l' \
    > test.out 2>&1
eval_tap $? 91 'AdminListUsersStatItems' test.out

#- 92 BulkUpdateUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'JlZ163cn' \
    --additionalKey 'YKOOP5I3' \
    --body '[{"additionalData": {"sJGaeMY0": {}, "NTyHl0sL": {}, "2Zdw9BPf": {}}, "requestId": "8IfNBT44", "statCode": "bNxj18ic", "updateStrategy": "MAX", "value": 0.8491138323291357}, {"additionalData": {"NExQowHe": {}, "kcLXF87u": {}, "j1G7jGuy": {}}, "requestId": "e8RZNZvu", "statCode": "frqGUED4", "updateStrategy": "INCREMENT", "value": 0.15420840123107138}, {"additionalData": {"wT9aoEq4": {}, "pkXNRn8v": {}, "Dw6cIumf": {}}, "requestId": "nMuZdH0B", "statCode": "OwgwYU8R", "updateStrategy": "INCREMENT", "value": 0.4386009609241007}]' \
    > test.out 2>&1
eval_tap $? 92 'BulkUpdateUserStatItem' test.out

#- 93 BulkGetOrDefaultByUserId
./ng net.accelbyte.sdk.cli.Main social bulkGetOrDefaultByUserId \
    --namespace "$AB_NAMESPACE" \
    --userId 'h8BAmDGm' \
    --additionalKey '0ZLnDKBj' \
    --body '{"statCodes": ["yy2fgLxx", "zvrpNtHu", "WrtcHKgV"]}' \
    > test.out 2>&1
eval_tap $? 93 'BulkGetOrDefaultByUserId' test.out

#- 94 BulkResetUserStatItemValues
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItemValues \
    --namespace "$AB_NAMESPACE" \
    --userId 'kPhbTuC9' \
    --additionalKey '7VOF6B4r' \
    --body '[{"additionalData": {"Fys3yIhI": {}, "VguTw8sH": {}, "PTTeMubB": {}}, "statCode": "QNyt0WOZ"}, {"additionalData": {"7KuCz3Dl": {}, "v2DcBkH8": {}, "NmqgDMqW": {}}, "statCode": "Hdx8foCS"}, {"additionalData": {"VVZxVJg4": {}, "9mTKOU3K": {}, "WnHnA5Rg": {}}, "statCode": "3PFbKzOc"}]' \
    > test.out 2>&1
eval_tap $? 94 'BulkResetUserStatItemValues' test.out

#- 95 DeleteUserStatItems2
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'DNb9y486' \
    --userId '04a8oA3E' \
    --additionalKey 'RbE4EPX8' \
    > test.out 2>&1
eval_tap $? 95 'DeleteUserStatItems2' test.out

#- 96 UpdateUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode '0GFvvStU' \
    --userId 's7wlgKHH' \
    --additionalKey 'PdMHFiGp' \
    --body '{"additionalData": {"fqMQhObW": {}, "UGk9bh9B": {}, "acWT93TY": {}}, "updateStrategy": "OVERRIDE", "value": 0.6854937089337145}' \
    > test.out 2>&1
eval_tap $? 96 'UpdateUserStatItemValue' test.out

#- 97 BulkUpdateUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"0iNRrRWk": {}, "maUDnhGF": {}, "EIdfVaRY": {}}, "additionalKey": "wUnD1Q6k", "requestId": "5Ir5Jpvk", "statCode": "uLSN0XfT", "updateStrategy": "MAX", "userId": "agUO8KxX", "value": 0.4803267322669167}, {"additionalData": {"KFLUv5Lc": {}, "bAiNVDDV": {}, "iTFG7EsW": {}}, "additionalKey": "7TmA0MR5", "requestId": "4C4ybNhP", "statCode": "7eHKkGVU", "updateStrategy": "OVERRIDE", "userId": "ZvnyZQK7", "value": 0.37060786112245525}, {"additionalData": {"CyMz1FTK": {}, "OZp29DU9": {}, "E0SqsPDN": {}}, "additionalKey": "OuNjh9J5", "requestId": "NvV8QdY4", "statCode": "WUDeIMcr", "updateStrategy": "INCREMENT", "userId": "3m9QJBBk", "value": 0.5772767590658657}]' \
    > test.out 2>&1
eval_tap $? 97 'BulkUpdateUserStatItem1' test.out

#- 98 PublicQueryUserStatItems2
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZvadJdo1' \
    --additionalKey 'yof4qNBW' \
    --statCodes 'hF4aCcqk,22zANXM6,npj2utSQ' \
    --tags 'i91ZrrQN,wQoBwEzy,gB8IrJ8D' \
    > test.out 2>&1
eval_tap $? 98 'PublicQueryUserStatItems2' test.out

#- 99 BulkUpdateUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'K9l1tfLP' \
    --additionalKey 'EyQ4DtC3' \
    --body '[{"additionalData": {"KQ69WnFf": {}, "s4PD44IG": {}, "Bc6w9hzI": {}}, "requestId": "yChl0z7U", "statCode": "b134g12b", "updateStrategy": "MAX", "value": 0.2504675633096246}, {"additionalData": {"BuSQpDaq": {}, "i939oONK": {}, "IijEhmtZ": {}}, "requestId": "3vXKgZ2I", "statCode": "vDMJaqsZ", "updateStrategy": "INCREMENT", "value": 0.6178060810517759}, {"additionalData": {"ty14g2nw": {}, "ojXFO8O0": {}, "TiYp5rja": {}}, "requestId": "6Lt1gLGc", "statCode": "7SlXOCFc", "updateStrategy": "MIN", "value": 0.06172919161926049}]' \
    > test.out 2>&1
eval_tap $? 99 'BulkUpdateUserStatItem2' test.out

#- 100 UpdateUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'OpmN5X1i' \
    --userId '2DJm5twm' \
    --additionalKey 'q6jeryOA' \
    --body '{"additionalData": {"8GEMHjL7": {}, "2RKApTxE": {}, "JosZZudr": {}}, "updateStrategy": "OVERRIDE", "value": 0.002088601346442842}' \
    > test.out 2>&1
eval_tap $? 100 'UpdateUserStatItemValue1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
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
echo "1..98"

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
    --userId 'WzVQMU8j' \
    > test.out 2>&1
eval_tap $? 8 'GetUserProfiles' test.out

#- 9 GetProfile
./ng net.accelbyte.sdk.cli.Main social getProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'e56UUpWO' \
    --userId 'Z5F5JyNU' \
    > test.out 2>&1
eval_tap $? 9 'GetProfile' test.out

#- 10 GetUserNamespaceSlots
eval_tap 0 10 'GetUserNamespaceSlots # SKIP deprecated' test.out

#- 11 GetSlotData
eval_tap 0 11 'GetSlotData # SKIP deprecated' test.out

#- 12 PublicGetUserGameProfiles
./ng net.accelbyte.sdk.cli.Main social publicGetUserGameProfiles \
    --namespace "$AB_NAMESPACE" \
    --userIds 'iOQvvp4q,rzW28Mu1,XLFCQ9Ln' \
    > test.out 2>&1
eval_tap $? 12 'PublicGetUserGameProfiles' test.out

#- 13 PublicGetUserProfiles
./ng net.accelbyte.sdk.cli.Main social publicGetUserProfiles \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZRp5P8fI' \
    > test.out 2>&1
eval_tap $? 13 'PublicGetUserProfiles' test.out

#- 14 PublicCreateProfile
./ng net.accelbyte.sdk.cli.Main social publicCreateProfile \
    --namespace "$AB_NAMESPACE" \
    --userId 'dvqEbdow' \
    --body '{"achievements": ["Clcj1KCA", "9KIBAayl", "Nb8JG4Rw"], "attributes": {"eAbQoiQY": "KYcS7AAc", "HjwNB6JU": "4kc0TO5n", "WByZRNkG": "x6tj5WQS"}, "avatarUrl": "vDIGXpID", "inventories": ["HMgPg30M", "u5waEp5X", "lfR861PJ"], "label": "5KFiX7dW", "profileName": "4fuKtzUD", "statistics": ["DGmxAHJ9", "1lCsOjc4", "eDQEf8g3"], "tags": ["fZYNCY2M", "1zgi60Oq", "21aTf13s"]}' \
    > test.out 2>&1
eval_tap $? 14 'PublicCreateProfile' test.out

#- 15 PublicGetProfile
./ng net.accelbyte.sdk.cli.Main social publicGetProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'U0tsnBvB' \
    --userId 'PjqKsBby' \
    > test.out 2>&1
eval_tap $? 15 'PublicGetProfile' test.out

#- 16 PublicUpdateProfile
./ng net.accelbyte.sdk.cli.Main social publicUpdateProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId '1ajH4FHm' \
    --userId 'm7RdxOMk' \
    --body '{"achievements": ["Ex6WbNwU", "fPrBPuuH", "0X6ukSiw"], "attributes": {"8ICUmi0k": "qFGxw6ZE", "vLgIMPew": "jN0LsVff", "gwnTdQuU": "K6ldJ0Pa"}, "avatarUrl": "JZzyhryf", "inventories": ["QExyYZWp", "ZQff9rAY", "NcOsFsDa"], "label": "q4SBTuoo", "profileName": "8zjZiVub", "statistics": ["6lMkxqnt", "2fZ5sM4v", "Zrm6EcD3"], "tags": ["OFuK2M4n", "6NOa5ihx", "kJZD0yuu"]}' \
    > test.out 2>&1
eval_tap $? 16 'PublicUpdateProfile' test.out

#- 17 PublicDeleteProfile
./ng net.accelbyte.sdk.cli.Main social publicDeleteProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'TfcZRWW8' \
    --userId '0SkGPJVV' \
    > test.out 2>&1
eval_tap $? 17 'PublicDeleteProfile' test.out

#- 18 PublicGetProfileAttribute
./ng net.accelbyte.sdk.cli.Main social publicGetProfileAttribute \
    --attributeName 'hcDAje13' \
    --namespace "$AB_NAMESPACE" \
    --profileId 'PYw8qQ1L' \
    --userId 'Ifm9Deck' \
    > test.out 2>&1
eval_tap $? 18 'PublicGetProfileAttribute' test.out

#- 19 PublicUpdateAttribute
./ng net.accelbyte.sdk.cli.Main social publicUpdateAttribute \
    --attributeName 'jtZXGveq' \
    --namespace "$AB_NAMESPACE" \
    --profileId 'msXKjHnf' \
    --userId '9IqHwXjw' \
    --body '{"name": "ouSbIjQu", "value": "cFoGLqs6"}' \
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
    --limit '67' \
    --offset '78' \
    --statCodes 'PN8gkoGp' \
    > test.out 2>&1
eval_tap $? 26 'GetGlobalStatItems' test.out

#- 27 GetGlobalStatItemByStatCode
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItemByStatCode \
    --namespace "$AB_NAMESPACE" \
    --statCode 'PSjArZUq' \
    > test.out 2>&1
eval_tap $? 27 'GetGlobalStatItemByStatCode' test.out

#- 28 GetStatCycles
./ng net.accelbyte.sdk.cli.Main social getStatCycles \
    --namespace "$AB_NAMESPACE" \
    --cycleType 'WEEKLY' \
    --limit '47' \
    --name 'lpXpZqKH' \
    --offset '43' \
    --sortBy 'krP0yrsP' \
    --status 'STOPPED' \
    > test.out 2>&1
eval_tap $? 28 'GetStatCycles' test.out

#- 29 CreateStatCycle
./ng net.accelbyte.sdk.cli.Main social createStatCycle \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleType": "DAILY", "description": "s50CzDAi", "end": "1995-02-19T00:00:00Z", "name": "9oLWAhfa", "resetDate": 38, "resetDay": 1, "resetMonth": 13, "resetTime": "yRx3k183", "seasonPeriod": 6, "start": "1979-08-13T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 29 'CreateStatCycle' test.out

#- 30 BulkGetStatCycle
./ng net.accelbyte.sdk.cli.Main social bulkGetStatCycle \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["yNqouD15", "iGEe808Q", "x3DfZZl6"]}' \
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
    --cycleId 'jfhqcxCU' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 33 'GetStatCycle' test.out

#- 34 UpdateStatCycle
./ng net.accelbyte.sdk.cli.Main social updateStatCycle \
    --cycleId 'ykq5Y9X1' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleType": "SEASONAL", "description": "0vmXx57X", "end": "1998-03-25T00:00:00Z", "name": "yTZqyINr", "resetDate": 14, "resetDay": 35, "resetMonth": 12, "resetTime": "DMUxfDjn", "seasonPeriod": 91, "start": "1978-07-15T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 34 'UpdateStatCycle' test.out

#- 35 DeleteStatCycle
./ng net.accelbyte.sdk.cli.Main social deleteStatCycle \
    --cycleId 'bF2YWxoJ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 35 'DeleteStatCycle' test.out

#- 36 BulkAddStats
./ng net.accelbyte.sdk.cli.Main social bulkAddStats \
    --cycleId '4eMBycDB' \
    --namespace "$AB_NAMESPACE" \
    --body '{"statCodes": ["auj4W4kB", "wJ80xV80", "mhoqttq6"]}' \
    > test.out 2>&1
eval_tap $? 36 'BulkAddStats' test.out

#- 37 StopStatCycle
./ng net.accelbyte.sdk.cli.Main social stopStatCycle \
    --cycleId 'dClbBbL3' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 37 'StopStatCycle' test.out

#- 38 BulkFetchStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'Ny6Jq3xN' \
    --userIds 'XhSawaav' \
    > test.out 2>&1
eval_tap $? 38 'BulkFetchStatItems' test.out

#- 39 BulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.037368242816041564, "statCode": "FhDcdL2I", "userId": "XIS2DzfJ"}, {"inc": 0.1170154461816012, "statCode": "78lroBka", "userId": "o1m4p4kf"}, {"inc": 0.34346600162956364, "statCode": "dk6UzOHk", "userId": "mzcR7qZh"}]' \
    > test.out 2>&1
eval_tap $? 39 'BulkIncUserStatItem' test.out

#- 40 BulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.12225720359379788, "statCode": "rRr7IIWN", "userId": "NAcLUe66"}, {"inc": 0.4132493071916775, "statCode": "SdOG09TP", "userId": "rCxogjQX"}, {"inc": 0.3589449797836586, "statCode": "CdeWWHwd", "userId": "B5cAaDiz"}]' \
    > test.out 2>&1
eval_tap $? 40 'BulkIncUserStatItemValue' test.out

#- 41 BulkFetchOrDefaultStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'L414UsYY' \
    --userIds 'UHGeqbbT,F5zFyVPz,KhuWLfJ2' \
    > test.out 2>&1
eval_tap $? 41 'BulkFetchOrDefaultStatItems' test.out

#- 42 BulkResetUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "jZPMy3jx", "userId": "XNN6LKMu"}, {"statCode": "qB1n0E4P", "userId": "kjFAHuUg"}, {"statCode": "sbmUxkmA", "userId": "q02eXZtn"}]' \
    > test.out 2>&1
eval_tap $? 42 'BulkResetUserStatItem' test.out

#- 43 GetStats
./ng net.accelbyte.sdk.cli.Main social getStats \
    --namespace "$AB_NAMESPACE" \
    --cycleIds 'RNOTPzQv' \
    --isGlobal  \
    --isPublic  \
    --limit '66' \
    --offset '56' \
    > test.out 2>&1
eval_tap $? 43 'GetStats' test.out

#- 44 CreateStat
./ng net.accelbyte.sdk.cli.Main social createStat \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["QG6dgkRt", "YfDkC1Wg", "Dv2lxuHF"], "defaultValue": 0.43675816684124114, "description": "nM1UDsrs", "ignoreAdditionalDataOnValueRejected": true, "incrementOnly": false, "isPublic": true, "maximum": 0.9897860853607485, "minimum": 0.27718116471779153, "name": "hKWdZKp8", "setAsGlobal": true, "setBy": "CLIENT", "statCode": "BsSTpQ3o", "tags": ["wyvBxnyJ", "CboLl5Dq", "EfdkXWVt"]}' \
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
    --limit '40' \
    --offset '95' \
    --keyword 'FbQ7XTyL' \
    > test.out 2>&1
eval_tap $? 47 'QueryStats' test.out

#- 48 GetStat
./ng net.accelbyte.sdk.cli.Main social getStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'BcHn6D1u' \
    > test.out 2>&1
eval_tap $? 48 'GetStat' test.out

#- 49 DeleteStat
./ng net.accelbyte.sdk.cli.Main social deleteStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'SK1fvHqW' \
    > test.out 2>&1
eval_tap $? 49 'DeleteStat' test.out

#- 50 UpdateStat
./ng net.accelbyte.sdk.cli.Main social updateStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'osiynV7s' \
    --body '{"cycleIds": ["RHK968vs", "lrliyGr4", "dmgv2y11"], "defaultValue": 0.8840678609275965, "description": "VAlgTX71", "ignoreAdditionalDataOnValueRejected": true, "isPublic": false, "name": "hy2ix2vx", "tags": ["HTlUOq49", "cIt7nDzP", "oTb0cujW"]}' \
    > test.out 2>&1
eval_tap $? 50 'UpdateStat' test.out

#- 51 GetStatItems
./ng net.accelbyte.sdk.cli.Main social getStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'MaVbc32t' \
    --limit '44' \
    --offset '71' \
    --sortBy '5oaEUCvO' \
    > test.out 2>&1
eval_tap $? 51 'GetStatItems' test.out

#- 52 DeleteTiedStat
./ng net.accelbyte.sdk.cli.Main social deleteTiedStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'nXpRG3sr' \
    > test.out 2>&1
eval_tap $? 52 'DeleteTiedStat' test.out

#- 53 GetUserStatCycleItems
./ng net.accelbyte.sdk.cli.Main social getUserStatCycleItems \
    --cycleId 'AM5aFXbV' \
    --namespace "$AB_NAMESPACE" \
    --userId 'lyIOLSxC' \
    --isPublic  \
    --limit '79' \
    --offset '53' \
    --sortBy 'Grr3RShH' \
    --statCodes 'iFDkay0b' \
    > test.out 2>&1
eval_tap $? 53 'GetUserStatCycleItems' test.out

#- 54 GetUserStatItems
./ng net.accelbyte.sdk.cli.Main social getUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'sNAudQrA' \
    --isPublic  \
    --limit '51' \
    --offset '23' \
    --sortBy 'r0Lte3kw' \
    --statCodes 'sZwJI0DI' \
    --tags 'I9TZ22g3' \
    > test.out 2>&1
eval_tap $? 54 'GetUserStatItems' test.out

#- 55 BulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social bulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'tc6jJ0aL' \
    --body '[{"statCode": "RVWaDuef"}, {"statCode": "VGADNCiF"}, {"statCode": "P8emO6IE"}]' \
    > test.out 2>&1
eval_tap $? 55 'BulkCreateUserStatItems' test.out

#- 56 BulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'IMFtPbat' \
    --body '[{"inc": 0.5514039367423101, "statCode": "EueCaoNa"}, {"inc": 0.16979099122364627, "statCode": "2nkWAKYI"}, {"inc": 0.3474185989995363, "statCode": "eNeb7eAw"}]' \
    > test.out 2>&1
eval_tap $? 56 'BulkIncUserStatItem1' test.out

#- 57 BulkIncUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --userId '9GrBSA1n' \
    --body '[{"inc": 0.5678152995728647, "statCode": "gmq2uiOw"}, {"inc": 0.5778650102123863, "statCode": "Jc39epuy"}, {"inc": 0.3637345237938675, "statCode": "MMKnTVvO"}]' \
    > test.out 2>&1
eval_tap $? 57 'BulkIncUserStatItemValue1' test.out

#- 58 BulkResetUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'l0n6qJmj' \
    --body '[{"statCode": "ni1lgvDj"}, {"statCode": "6BionatF"}, {"statCode": "lWBnQJ4T"}]' \
    > test.out 2>&1
eval_tap $? 58 'BulkResetUserStatItem1' test.out

#- 59 CreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social createUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode '0EHxjzTM' \
    --userId 'iU6WU39A' \
    > test.out 2>&1
eval_tap $? 59 'CreateUserStatItem' test.out

#- 60 DeleteUserStatItems
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode '8bJgk9Nx' \
    --userId 'ntNc97sJ' \
    > test.out 2>&1
eval_tap $? 60 'DeleteUserStatItems' test.out

#- 61 IncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social incUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'luEVWATY' \
    --userId 'yR9qYfJn' \
    --body '{"inc": 0.36401736450168787}' \
    > test.out 2>&1
eval_tap $? 61 'IncUserStatItemValue' test.out

#- 62 ResetUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'lSDQyu7m' \
    --userId 'j6lp6v2u' \
    --additionalKey '7ZvpgA0P' \
    --body '{"additionalData": {"q1xkdJRe": {}, "vtjbLP75": {}, "29HsGLu1": {}}}' \
    > test.out 2>&1
eval_tap $? 62 'ResetUserStatItemValue' test.out

#- 63 GetGlobalStatItems1
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --limit '8' \
    --offset '15' \
    --statCodes 'TuU0p6u1' \
    > test.out 2>&1
eval_tap $? 63 'GetGlobalStatItems1' test.out

#- 64 GetGlobalStatItemByStatCode1
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItemByStatCode1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'LKtOKta2' \
    > test.out 2>&1
eval_tap $? 64 'GetGlobalStatItemByStatCode1' test.out

#- 65 GetStatCycles1
./ng net.accelbyte.sdk.cli.Main social getStatCycles1 \
    --namespace "$AB_NAMESPACE" \
    --cycleType 'WEEKLY' \
    --limit '60' \
    --name '6y5RktbA' \
    --offset '53' \
    --sortBy 'lRIPclre' \
    --status 'STOPPED' \
    > test.out 2>&1
eval_tap $? 65 'GetStatCycles1' test.out

#- 66 BulkGetStatCycle1
./ng net.accelbyte.sdk.cli.Main social bulkGetStatCycle1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["zMshUiR8", "NfDRfagD", "bdr9jZg3"]}' \
    > test.out 2>&1
eval_tap $? 66 'BulkGetStatCycle1' test.out

#- 67 GetStatCycle1
./ng net.accelbyte.sdk.cli.Main social getStatCycle1 \
    --cycleId 'cOLhNfkP' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 67 'GetStatCycle1' test.out

#- 68 BulkFetchStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'FLJHspWM' \
    --userIds 'ycrVwgjq' \
    > test.out 2>&1
eval_tap $? 68 'BulkFetchStatItems1' test.out

#- 69 PublicBulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.8740827552486793, "statCode": "ZZoExC1U", "userId": "zX3RXhTH"}, {"inc": 0.08280366140395345, "statCode": "goCMah2E", "userId": "9MYfk7Dh"}, {"inc": 0.9045281392441902, "statCode": "I7VVYMAK", "userId": "snJ2oKZx"}]' \
    > test.out 2>&1
eval_tap $? 69 'PublicBulkIncUserStatItem' test.out

#- 70 PublicBulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.7087591332561327, "statCode": "MZ2caT1x", "userId": "We3JUk04"}, {"inc": 0.6102274498985174, "statCode": "qJioxWZU", "userId": "7xztpn89"}, {"inc": 0.7242746735234707, "statCode": "gR49I4A3", "userId": "HgMo0Rm5"}]' \
    > test.out 2>&1
eval_tap $? 70 'PublicBulkIncUserStatItemValue' test.out

#- 71 BulkResetUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "GRk67PDT", "userId": "rSEWP11T"}, {"statCode": "AnBHU0ab", "userId": "ZIs56Zyl"}, {"statCode": "3TkaqNwk", "userId": "RfserFpN"}]' \
    > test.out 2>&1
eval_tap $? 71 'BulkResetUserStatItem2' test.out

#- 72 CreateStat1
./ng net.accelbyte.sdk.cli.Main social createStat1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["otaTMOfT", "uB52OKW4", "GYmEsBlB"], "defaultValue": 0.3327773161591252, "description": "v78kwEYa", "ignoreAdditionalDataOnValueRejected": false, "incrementOnly": false, "isPublic": false, "maximum": 0.8392873426373584, "minimum": 0.6956103726623417, "name": "Zx7IBPoU", "setAsGlobal": true, "setBy": "SERVER", "statCode": "7HpfpwIN", "tags": ["61LvsZSI", "cjxplgNA", "V1mCa12R"]}' \
    > test.out 2>&1
eval_tap $? 72 'CreateStat1' test.out

#- 73 PublicListMyStatCycleItems
./ng net.accelbyte.sdk.cli.Main social publicListMyStatCycleItems \
    --cycleId 'uGKHEvrM' \
    --namespace "$AB_NAMESPACE" \
    --limit '30' \
    --offset '48' \
    --sortBy 'zhXkrTAv' \
    --statCodes 'uaeOv2lw,IxogJKv4,H3dKWQN8' \
    > test.out 2>&1
eval_tap $? 73 'PublicListMyStatCycleItems' test.out

#- 74 PublicListMyStatItems
./ng net.accelbyte.sdk.cli.Main social publicListMyStatItems \
    --namespace "$AB_NAMESPACE" \
    --limit '76' \
    --offset '71' \
    --sortBy '1nsZsquH' \
    --statCodes 'XpI9Fe8H,3HjRV4MQ,bsgjMugM' \
    --tags '6OMhy38a,tbIJK4Nr,4qdyQ0On' \
    > test.out 2>&1
eval_tap $? 74 'PublicListMyStatItems' test.out

#- 75 PublicListAllMyStatItems
./ng net.accelbyte.sdk.cli.Main social publicListAllMyStatItems \
    --namespace "$AB_NAMESPACE" \
    --additionalKey 'vOqPB7fe' \
    --statCodes 'j39OkQzB,8j5uO8aM,V0vBPEhN' \
    --tags '69z0djdm,4usea3di,QZOewbcV' \
    > test.out 2>&1
eval_tap $? 75 'PublicListAllMyStatItems' test.out

#- 76 GetUserStatCycleItems1
./ng net.accelbyte.sdk.cli.Main social getUserStatCycleItems1 \
    --cycleId 'drRZTaGu' \
    --namespace "$AB_NAMESPACE" \
    --userId 'RO6SKUe2' \
    --limit '74' \
    --offset '61' \
    --sortBy 'kk4nRzcN' \
    --statCodes 'fE1Syaox' \
    > test.out 2>&1
eval_tap $? 76 'GetUserStatCycleItems1' test.out

#- 77 PublicQueryUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'nYejy6zG' \
    --limit '32' \
    --offset '49' \
    --sortBy 'S3sYdXyi' \
    --statCodes 'MgNcE3gA' \
    --tags 'oXrOWkyK' \
    > test.out 2>&1
eval_tap $? 77 'PublicQueryUserStatItems' test.out

#- 78 PublicBulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicBulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'MS8OLLL7' \
    --body '[{"statCode": "dxG95Pwr"}, {"statCode": "eCSn7Uun"}, {"statCode": "if3QtuFW"}]' \
    > test.out 2>&1
eval_tap $? 78 'PublicBulkCreateUserStatItems' test.out

#- 79 PublicQueryUserStatItems1
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'wwQr5Zpz' \
    --additionalKey 'lO7wiUfw' \
    --statCodes 'epM7SW7i,TYdwadI5,FaRtrCsu' \
    --tags 'gAfcPc0D,QT62lfRP,9MtBXCn9' \
    > test.out 2>&1
eval_tap $? 79 'PublicQueryUserStatItems1' test.out

#- 80 PublicBulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId '9H4chqLU' \
    --body '[{"inc": 0.9630784786968877, "statCode": "t9vPNhur"}, {"inc": 0.40192210563326614, "statCode": "01vPIWl8"}, {"inc": 0.8264206093960029, "statCode": "eUNwdyre"}]' \
    > test.out 2>&1
eval_tap $? 80 'PublicBulkIncUserStatItem1' test.out

#- 81 BulkIncUserStatItemValue2
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZQZtUUry' \
    --body '[{"inc": 0.6380423082395006, "statCode": "UNUan83W"}, {"inc": 0.7323429650581489, "statCode": "0MA0M0ty"}, {"inc": 0.049049974088536175, "statCode": "4bCU3vnE"}]' \
    > test.out 2>&1
eval_tap $? 81 'BulkIncUserStatItemValue2' test.out

#- 82 BulkResetUserStatItem3
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'iCtktxe8' \
    --body '[{"statCode": "G76tw1c0"}, {"statCode": "zPCo1Wi2"}, {"statCode": "1eJXYtfm"}]' \
    > test.out 2>&1
eval_tap $? 82 'BulkResetUserStatItem3' test.out

#- 83 PublicCreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicCreateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode '1WpUfMhE' \
    --userId 'MTPO1lai' \
    > test.out 2>&1
eval_tap $? 83 'PublicCreateUserStatItem' test.out

#- 84 DeleteUserStatItems1
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'm5w3qy5x' \
    --userId 'gLOofdh2' \
    > test.out 2>&1
eval_tap $? 84 'DeleteUserStatItems1' test.out

#- 85 PublicIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'WbYRZMrQ' \
    --userId 'C06SS92K' \
    --body '{"inc": 0.7761755410618637}' \
    > test.out 2>&1
eval_tap $? 85 'PublicIncUserStatItem' test.out

#- 86 PublicIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'HWsoCuYi' \
    --userId '6LGNS1ZY' \
    --body '{"inc": 0.2665449434672157}' \
    > test.out 2>&1
eval_tap $? 86 'PublicIncUserStatItemValue' test.out

#- 87 ResetUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'jlMX5SfZ' \
    --userId 'ke4oJnIh' \
    > test.out 2>&1
eval_tap $? 87 'ResetUserStatItemValue1' test.out

#- 88 BulkUpdateUserStatItemV2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItemV2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"iFOf8yss": {}, "40VIbe9y": {}, "mOchOHRx": {}}, "additionalKey": "0A1MjgIj", "statCode": "pche3zhl", "updateStrategy": "INCREMENT", "userId": "eRBaNMsX", "value": 0.7553934251318243}, {"additionalData": {"eq7oR7PN": {}, "Xfpx6S2T": {}, "KlaSGHEL": {}}, "additionalKey": "IYqE8b7T", "statCode": "KaIl5QYC", "updateStrategy": "MIN", "userId": "nJ3oQLMZ", "value": 0.7077509793212082}, {"additionalData": {"s8KwLnAQ": {}, "16GVDoSC": {}, "EIdb8akU": {}}, "additionalKey": "VXzbIriF", "statCode": "2OdMOs3I", "updateStrategy": "MAX", "userId": "JkTV4l0b", "value": 0.7275606488663492}]' \
    > test.out 2>&1
eval_tap $? 88 'BulkUpdateUserStatItemV2' test.out

#- 89 BulkFetchOrDefaultStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --additionalKey '534E11K8' \
    --statCode 'ZfEDd9jH' \
    --userIds 'U49FwiDV,ajpnOdVI,n4qmhc7s' \
    > test.out 2>&1
eval_tap $? 89 'BulkFetchOrDefaultStatItems1' test.out

#- 90 AdminListUsersStatItems
./ng net.accelbyte.sdk.cli.Main social adminListUsersStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 's0x8iDLH' \
    --additionalKey 'VgbvE3Pu' \
    --statCodes 'sBF52mom,c0OcDQX8,e1dygvy1' \
    --tags 'aqaiRRdk,jwG3FZID,Fq2MbxCP' \
    > test.out 2>&1
eval_tap $? 90 'AdminListUsersStatItems' test.out

#- 91 BulkUpdateUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --userId '28bRzyKA' \
    --additionalKey 'jM6DGgvp' \
    --body '[{"additionalData": {"VZUtI3Uy": {}, "OskIZ3uG": {}, "Sb1eMBFQ": {}}, "statCode": "vcsxukkm", "updateStrategy": "MIN", "value": 0.17253850415249938}, {"additionalData": {"iqXJ5Y1s": {}, "8FcPOh9Q": {}, "DaP8drTv": {}}, "statCode": "fWOqrg7n", "updateStrategy": "MAX", "value": 0.6086147714764196}, {"additionalData": {"ltaQsI2b": {}, "PBWFXNQJ": {}, "Mb8TqMne": {}}, "statCode": "S3KlgImC", "updateStrategy": "MIN", "value": 0.14802482528133687}]' \
    > test.out 2>&1
eval_tap $? 91 'BulkUpdateUserStatItem' test.out

#- 92 BulkResetUserStatItemValues
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItemValues \
    --namespace "$AB_NAMESPACE" \
    --userId 'szBj2g6g' \
    --additionalKey 'YiPPDGDB' \
    --body '[{"additionalData": {"w288zdQN": {}, "dxDu3tvp": {}, "mDy3eeG6": {}}, "statCode": "dgfiKxKw"}, {"additionalData": {"bvbS80PM": {}, "TmQoxkGM": {}, "m8Y2zbus": {}}, "statCode": "qnfcHhPN"}, {"additionalData": {"2gqZ7u8I": {}, "1BsFkF7R": {}, "5vktGrpv": {}}, "statCode": "wiiXFF5F"}]' \
    > test.out 2>&1
eval_tap $? 92 'BulkResetUserStatItemValues' test.out

#- 93 DeleteUserStatItems2
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'NdPYfNen' \
    --userId 'rIq7YuYs' \
    --additionalKey '34xOutCn' \
    > test.out 2>&1
eval_tap $? 93 'DeleteUserStatItems2' test.out

#- 94 UpdateUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode '0pzCGMOR' \
    --userId '6cDnAvDZ' \
    --additionalKey 'EMGT3br1' \
    --body '{"additionalData": {"iDYVemi1": {}, "ZLyYBDhk": {}, "6DMvXuqb": {}}, "updateStrategy": "INCREMENT", "value": 0.492308154091994}' \
    > test.out 2>&1
eval_tap $? 94 'UpdateUserStatItemValue' test.out

#- 95 BulkUpdateUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"hOdLv0bP": {}, "9aJS5f2Z": {}, "xfpZsuo7": {}}, "additionalKey": "VsmHAKrJ", "statCode": "mfWr2nOD", "updateStrategy": "INCREMENT", "userId": "byverCnm", "value": 0.1772176871577329}, {"additionalData": {"dFfRcMSq": {}, "nZfiKYLn": {}, "4dKLllIp": {}}, "additionalKey": "gUP6doZr", "statCode": "OwN6vhMC", "updateStrategy": "INCREMENT", "userId": "u3P2DUhw", "value": 0.45378420208954073}, {"additionalData": {"j9Eid688": {}, "wRQcxXpO": {}, "GXkI5XbO": {}}, "additionalKey": "zLz7d3KQ", "statCode": "YlUAM69C", "updateStrategy": "MAX", "userId": "sH8MiUL8", "value": 0.3738606096186493}]' \
    > test.out 2>&1
eval_tap $? 95 'BulkUpdateUserStatItem1' test.out

#- 96 PublicQueryUserStatItems2
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'lG3b15OU' \
    --additionalKey 'iOyo4VQX' \
    --statCodes 'nxQXHVhJ,EAp8xJAH,zpiR0s5G' \
    --tags 'yhoiuOR7,UheLPilh,oU9NTkhl' \
    > test.out 2>&1
eval_tap $? 96 'PublicQueryUserStatItems2' test.out

#- 97 BulkUpdateUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'bAE1bZ1a' \
    --additionalKey 'qzOZ0h1Y' \
    --body '[{"additionalData": {"3w04wPvS": {}, "wr99WEab": {}, "ceWzF4ga": {}}, "statCode": "hu3AjTym", "updateStrategy": "INCREMENT", "value": 0.8026852766213768}, {"additionalData": {"SHzyRJuY": {}, "AHIQE5AI": {}, "XL5QV293": {}}, "statCode": "93U7PiIn", "updateStrategy": "INCREMENT", "value": 0.9229936227490895}, {"additionalData": {"GnYcYut8": {}, "yZmfkUt4": {}, "auFOZHNt": {}}, "statCode": "E5oFNXBI", "updateStrategy": "INCREMENT", "value": 0.05276657909132376}]' \
    > test.out 2>&1
eval_tap $? 97 'BulkUpdateUserStatItem2' test.out

#- 98 UpdateUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'yYyHyUD9' \
    --userId '2ELDSAYz' \
    --additionalKey 'SDzqtCVG' \
    --body '{"additionalData": {"7we4ypiN": {}, "UBXvCnhH": {}, "lX4ptLR3": {}}, "updateStrategy": "MAX", "value": 0.1956937887022242}' \
    > test.out 2>&1
eval_tap $? 98 'UpdateUserStatItemValue1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
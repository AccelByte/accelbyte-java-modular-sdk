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
    --limit '71' \
    --offset '7' \
    --statCodes 'KJcG4VZm' \
    > test.out 2>&1
eval_tap $? 26 'GetGlobalStatItems' test.out

#- 27 GetGlobalStatItemByStatCode
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItemByStatCode \
    --namespace "$AB_NAMESPACE" \
    --statCode 'ala6Tahu' \
    > test.out 2>&1
eval_tap $? 27 'GetGlobalStatItemByStatCode' test.out

#- 28 GetStatCycles
./ng net.accelbyte.sdk.cli.Main social getStatCycles \
    --namespace "$AB_NAMESPACE" \
    --cycleType 'WEEKLY' \
    --limit '99' \
    --name 'vSKrBsNU' \
    --offset '9' \
    --sortBy 'bTKZIqSK' \
    --status 'INIT' \
    > test.out 2>&1
eval_tap $? 28 'GetStatCycles' test.out

#- 29 CreateStatCycle
./ng net.accelbyte.sdk.cli.Main social createStatCycle \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleType": "SEASONAL", "description": "inxfm4kO", "end": "1995-07-14T00:00:00Z", "id": "UjbgPZHn", "name": "wMbTEOYS", "resetDate": 73, "resetDay": 54, "resetMonth": 43, "resetTime": "s6BDMmv3", "seasonPeriod": 2, "start": "1972-11-01T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 29 'CreateStatCycle' test.out

#- 30 BulkGetStatCycle
./ng net.accelbyte.sdk.cli.Main social bulkGetStatCycle \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["g0qtkKMZ", "FYJiQIa9", "ckjif3EL"]}' \
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
    --cycleId 'STUfkNQh' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 33 'GetStatCycle' test.out

#- 34 UpdateStatCycle
./ng net.accelbyte.sdk.cli.Main social updateStatCycle \
    --cycleId 'hLG5Qi3G' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleType": "WEEKLY", "description": "dqPEZTZM", "end": "1998-07-07T00:00:00Z", "name": "07OMoAPS", "resetDate": 44, "resetDay": 28, "resetMonth": 42, "resetTime": "G9Z2009L", "seasonPeriod": 76, "start": "1999-06-30T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 34 'UpdateStatCycle' test.out

#- 35 DeleteStatCycle
./ng net.accelbyte.sdk.cli.Main social deleteStatCycle \
    --cycleId 'd5B9NKgk' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 35 'DeleteStatCycle' test.out

#- 36 BulkAddStats
./ng net.accelbyte.sdk.cli.Main social bulkAddStats \
    --cycleId 'M6hAVVly' \
    --namespace "$AB_NAMESPACE" \
    --body '{"statCodes": ["8PqOM4UG", "kxcXXRDk", "NrMN24Fq"]}' \
    > test.out 2>&1
eval_tap $? 36 'BulkAddStats' test.out

#- 37 StopStatCycle
./ng net.accelbyte.sdk.cli.Main social stopStatCycle \
    --cycleId 'kz2bSB3b' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 37 'StopStatCycle' test.out

#- 38 BulkFetchStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode '058iI5xQ' \
    --userIds 'F0F7USeJ' \
    > test.out 2>&1
eval_tap $? 38 'BulkFetchStatItems' test.out

#- 39 BulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.16835890028903944, "statCode": "JGv8wPu5", "userId": "rUUq43OO"}, {"inc": 0.03851068484203224, "statCode": "fO6wdIsE", "userId": "jYnfA2H1"}, {"inc": 0.9940803535880022, "statCode": "gDnNCzlc", "userId": "HwEe0vjv"}]' \
    > test.out 2>&1
eval_tap $? 39 'BulkIncUserStatItem' test.out

#- 40 BulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.36203924577420765, "statCode": "ak5irSbh", "userId": "QHDcJyaP"}, {"inc": 0.6142826898330088, "statCode": "BBS6DmPG", "userId": "Oj2m25nw"}, {"inc": 0.76953930825499, "statCode": "tN7oU0Bt", "userId": "cpPChJYj"}]' \
    > test.out 2>&1
eval_tap $? 40 'BulkIncUserStatItemValue' test.out

#- 41 BulkFetchOrDefaultStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'ZNR9eEjj' \
    --userIds 'gjaN2Jjw,xijAFum7,LIg7akzL' \
    > test.out 2>&1
eval_tap $? 41 'BulkFetchOrDefaultStatItems' test.out

#- 42 BulkResetUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "arW1pRqL", "userId": "uyYszUGG"}, {"statCode": "HKoBpdni", "userId": "TJeOsphL"}, {"statCode": "4DiiQVbO", "userId": "aA73fVZK"}]' \
    > test.out 2>&1
eval_tap $? 42 'BulkResetUserStatItem' test.out

#- 43 GetStats
./ng net.accelbyte.sdk.cli.Main social getStats \
    --namespace "$AB_NAMESPACE" \
    --cycleIds '0dihdkVA' \
    --isGlobal  \
    --isPublic  \
    --limit '20' \
    --offset '28' \
    > test.out 2>&1
eval_tap $? 43 'GetStats' test.out

#- 44 CreateStat
./ng net.accelbyte.sdk.cli.Main social createStat \
    --namespace "$AB_NAMESPACE" \
    --body '{"capCycleOverride": true, "cycleIds": ["vepiWUfN", "iLR6VDwq", "GZU7pkF9"], "cycleOverrides": [{"cycleId": "8l4I5Zwo", "maximum": 0.5845088037781541, "minimum": 0.1694310378800531}, {"cycleId": "KNW67Qp9", "maximum": 0.7008280555771669, "minimum": 0.4271705511731584}, {"cycleId": "fLuu7ANK", "maximum": 0.9220998144281297, "minimum": 0.4775451112002591}], "defaultValue": 0.910308724137317, "description": "BXsNe5q4", "globalAggregationMethod": "MAX", "ignoreAdditionalDataOnValueRejected": false, "incrementOnly": false, "isPublic": true, "maximum": 0.3426465320524278, "minimum": 0.5341932057190873, "name": "D1vcAGy1", "setAsGlobal": true, "setBy": "CLIENT", "statCode": "wkNlbdYM", "tags": ["ZYJEYd5F", "LBsGaK0W", "7865YcJn"], "visibility": "SHOWALL"}' \
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
    --limit '53' \
    --offset '92' \
    --keyword 'bJaDoFsp' \
    > test.out 2>&1
eval_tap $? 47 'QueryStats' test.out

#- 48 GetStat
./ng net.accelbyte.sdk.cli.Main social getStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'EguYpVwb' \
    > test.out 2>&1
eval_tap $? 48 'GetStat' test.out

#- 49 DeleteStat
./ng net.accelbyte.sdk.cli.Main social deleteStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'E4KojzO6' \
    > test.out 2>&1
eval_tap $? 49 'DeleteStat' test.out

#- 50 UpdateStat
./ng net.accelbyte.sdk.cli.Main social updateStat \
    --namespace "$AB_NAMESPACE" \
    --statCode '0dLLVqhz' \
    --body '{"capCycleOverride": true, "cycleIds": ["LVhDOjht", "xfsZkOCb", "WToeBYFR"], "cycleOverrides": [{"cycleId": "pY8MMEGB", "maximum": 0.8733450213862473, "minimum": 0.42021919486573045}, {"cycleId": "gPEOnGwf", "maximum": 0.8570096935024009, "minimum": 0.7745928934966333}, {"cycleId": "tvNgQNrN", "maximum": 0.7282339357264402, "minimum": 0.023943427396267314}], "defaultValue": 0.8353968068889184, "description": "iuuiivxA", "globalAggregationMethod": "MIN", "ignoreAdditionalDataOnValueRejected": true, "isPublic": true, "name": "FsEdDM3q", "tags": ["E3yxfugI", "wgoWrmtZ", "f9AjfutM"], "visibility": "SERVERONLY"}' \
    > test.out 2>&1
eval_tap $? 50 'UpdateStat' test.out

#- 51 GetStatItems
./ng net.accelbyte.sdk.cli.Main social getStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'p6ePRxcj' \
    --limit '32' \
    --offset '32' \
    --sortBy 'gdfkoIQT' \
    > test.out 2>&1
eval_tap $? 51 'GetStatItems' test.out

#- 52 DeleteTiedStat
./ng net.accelbyte.sdk.cli.Main social deleteTiedStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'G4YMZ21Z' \
    > test.out 2>&1
eval_tap $? 52 'DeleteTiedStat' test.out

#- 53 GetUserStatCycleItems
./ng net.accelbyte.sdk.cli.Main social getUserStatCycleItems \
    --cycleId 'OHqegptr' \
    --namespace "$AB_NAMESPACE" \
    --userId '3wlyGZkx' \
    --isPublic  \
    --limit '22' \
    --offset '71' \
    --sortBy 'VY7rcTU9' \
    --statCodes 'dQwowlZl' \
    > test.out 2>&1
eval_tap $? 53 'GetUserStatCycleItems' test.out

#- 54 GetUserStatItems
./ng net.accelbyte.sdk.cli.Main social getUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'UjbclP8M' \
    --isPublic  \
    --limit '72' \
    --offset '37' \
    --sortBy 'Q4HIu7cr' \
    --statCodes '4S1QElGx' \
    --tags 'Q6nU6qWd' \
    > test.out 2>&1
eval_tap $? 54 'GetUserStatItems' test.out

#- 55 BulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social bulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'b2VvUWhB' \
    --body '[{"statCode": "bYFq7TQJ"}, {"statCode": "mgezPU5X"}, {"statCode": "FvzvnVqF"}]' \
    > test.out 2>&1
eval_tap $? 55 'BulkCreateUserStatItems' test.out

#- 56 BulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Bm4ZoWzJ' \
    --body '[{"inc": 0.9296899609045122, "statCode": "v7PkXZW5"}, {"inc": 0.8053476382795511, "statCode": "00BrVoGY"}, {"inc": 0.2547006997970579, "statCode": "LmhO4iC7"}]' \
    > test.out 2>&1
eval_tap $? 56 'BulkIncUserStatItem1' test.out

#- 57 BulkIncUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'oIWLcli6' \
    --body '[{"inc": 0.03319927741114348, "statCode": "sFJbzZpO"}, {"inc": 0.17917178723058302, "statCode": "0C8oYk0a"}, {"inc": 0.48708392826493163, "statCode": "CVTNH5QN"}]' \
    > test.out 2>&1
eval_tap $? 57 'BulkIncUserStatItemValue1' test.out

#- 58 BulkResetUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId '4P1Kjm0Y' \
    --body '[{"statCode": "Hc7D5uN9"}, {"statCode": "1NZK5uek"}, {"statCode": "30yZMMkM"}]' \
    > test.out 2>&1
eval_tap $? 58 'BulkResetUserStatItem1' test.out

#- 59 CreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social createUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'nXF7sXgv' \
    --userId 'EezX91lf' \
    > test.out 2>&1
eval_tap $? 59 'CreateUserStatItem' test.out

#- 60 DeleteUserStatItems
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'p0xrrs8v' \
    --userId 'FFkcaKbA' \
    > test.out 2>&1
eval_tap $? 60 'DeleteUserStatItems' test.out

#- 61 IncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social incUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'svKbRkYh' \
    --userId 'ZMrLoabG' \
    --body '{"inc": 0.46661217344363803}' \
    > test.out 2>&1
eval_tap $? 61 'IncUserStatItemValue' test.out

#- 62 ResetUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'qOeoUuVg' \
    --userId '61JLxxWN' \
    --additionalKey 'PWSfHYCx' \
    --body '{"additionalData": {"oPOUefi9": {}, "VF5hEOLO": {}, "R8oySaWH": {}}}' \
    > test.out 2>&1
eval_tap $? 62 'ResetUserStatItemValue' test.out

#- 63 GetGlobalStatItems1
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --limit '34' \
    --offset '99' \
    --statCodes 'yMrjZ2Dx' \
    > test.out 2>&1
eval_tap $? 63 'GetGlobalStatItems1' test.out

#- 64 GetGlobalStatItemByStatCode1
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItemByStatCode1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'QzAvLKMJ' \
    > test.out 2>&1
eval_tap $? 64 'GetGlobalStatItemByStatCode1' test.out

#- 65 GetStatCycles1
./ng net.accelbyte.sdk.cli.Main social getStatCycles1 \
    --namespace "$AB_NAMESPACE" \
    --cycleType 'DAILY' \
    --limit '35' \
    --name '50pGE3S3' \
    --offset '68' \
    --sortBy 'VPxAG2L2' \
    --status 'ACTIVE' \
    > test.out 2>&1
eval_tap $? 65 'GetStatCycles1' test.out

#- 66 BulkGetStatCycle1
./ng net.accelbyte.sdk.cli.Main social bulkGetStatCycle1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["1blBgGay", "ArdVr09F", "BsKSXX1u"]}' \
    > test.out 2>&1
eval_tap $? 66 'BulkGetStatCycle1' test.out

#- 67 GetStatCycle1
./ng net.accelbyte.sdk.cli.Main social getStatCycle1 \
    --cycleId 'xnYYjvz0' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 67 'GetStatCycle1' test.out

#- 68 BulkFetchStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'nFFXij1i' \
    --userIds 'HLHUWMkE' \
    > test.out 2>&1
eval_tap $? 68 'BulkFetchStatItems1' test.out

#- 69 PublicBulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.18093360727420982, "statCode": "r9XNfEQ1", "userId": "nvxOlB12"}, {"inc": 0.6005638971206264, "statCode": "KfqZzsJH", "userId": "2qfXyx8L"}, {"inc": 0.459942226434944, "statCode": "i0WX3a5P", "userId": "EjCQc7wc"}]' \
    > test.out 2>&1
eval_tap $? 69 'PublicBulkIncUserStatItem' test.out

#- 70 PublicBulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.8756251631891528, "statCode": "aDzOHrDl", "userId": "tLy5OW5A"}, {"inc": 0.8530816632396302, "statCode": "lDPXlTAe", "userId": "gMaijNDJ"}, {"inc": 0.6952972078307816, "statCode": "wJ0x5bO6", "userId": "yLKgOKC8"}]' \
    > test.out 2>&1
eval_tap $? 70 'PublicBulkIncUserStatItemValue' test.out

#- 71 BulkResetUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "jPS66Mtn", "userId": "zjGSdhLT"}, {"statCode": "U4JlOqER", "userId": "TMfdBzPi"}, {"statCode": "DXhmFXmQ", "userId": "moJumEDw"}]' \
    > test.out 2>&1
eval_tap $? 71 'BulkResetUserStatItem2' test.out

#- 72 CreateStat1
./ng net.accelbyte.sdk.cli.Main social createStat1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"capCycleOverride": true, "cycleIds": ["a6qlg4bu", "EtjtJ11F", "zk21SQoY"], "cycleOverrides": [{"cycleId": "VEfZapyy", "maximum": 0.5961810892191429, "minimum": 0.41577128132079955}, {"cycleId": "N90v64NM", "maximum": 0.33299915422911375, "minimum": 0.48655716881321853}, {"cycleId": "Dj0xczRm", "maximum": 0.9596934554278683, "minimum": 0.7914253252805843}], "defaultValue": 0.1400129198508525, "description": "5Z1Um1S7", "globalAggregationMethod": "MAX", "ignoreAdditionalDataOnValueRejected": true, "incrementOnly": false, "isPublic": false, "maximum": 0.14224852057943638, "minimum": 0.7676579149696815, "name": "O1wgKcux", "setAsGlobal": true, "setBy": "SERVER", "statCode": "skxVg5E6", "tags": ["a2oomYh0", "nnUFxbvY", "QZEktFpl"], "visibility": "SERVERONLY"}' \
    > test.out 2>&1
eval_tap $? 72 'CreateStat1' test.out

#- 73 PublicListMyStatCycleItems
./ng net.accelbyte.sdk.cli.Main social publicListMyStatCycleItems \
    --cycleId 'zY2dUL5s' \
    --namespace "$AB_NAMESPACE" \
    --limit '35' \
    --offset '14' \
    --sortBy 'gKVIjzHG' \
    --statCodes 'o3Lh6t94,6dgwOr5a,HjQqMXGL' \
    > test.out 2>&1
eval_tap $? 73 'PublicListMyStatCycleItems' test.out

#- 74 PublicListMyStatItems
./ng net.accelbyte.sdk.cli.Main social publicListMyStatItems \
    --namespace "$AB_NAMESPACE" \
    --limit '49' \
    --offset '57' \
    --sortBy 'Ys9fdB35' \
    --statCodes 'RESw01Po,d0hcV4yT,0OvGa1s8' \
    --tags 'fvFsGhO2,CQsxGrOA,PpToUrSv' \
    > test.out 2>&1
eval_tap $? 74 'PublicListMyStatItems' test.out

#- 75 PublicListAllMyStatItems
./ng net.accelbyte.sdk.cli.Main social publicListAllMyStatItems \
    --namespace "$AB_NAMESPACE" \
    --additionalKey 'Ekg6tUyU' \
    --statCodes 'vntQFAmc,zDrhb7xY,nd93vko5' \
    --tags '0ZpepSVT,HRfUwkFO,tkXShxvs' \
    > test.out 2>&1
eval_tap $? 75 'PublicListAllMyStatItems' test.out

#- 76 GetUserStatCycleItems1
./ng net.accelbyte.sdk.cli.Main social getUserStatCycleItems1 \
    --cycleId 'XCYv1leK' \
    --namespace "$AB_NAMESPACE" \
    --userId 'noxW5Ktw' \
    --limit '20' \
    --offset '80' \
    --sortBy 'vkIMDHM8' \
    --statCodes 'g3RoWtR0' \
    > test.out 2>&1
eval_tap $? 76 'GetUserStatCycleItems1' test.out

#- 77 PublicQueryUserStatItems1
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'c8MT4Cpf' \
    --limit '92' \
    --offset '99' \
    --sortBy '8rcrfKeV' \
    --statCodes 'jXYjqzpz' \
    --tags '5Ns6gAjT' \
    > test.out 2>&1
eval_tap $? 77 'PublicQueryUserStatItems1' test.out

#- 78 PublicBulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicBulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'MKY3vnuo' \
    --body '[{"statCode": "MWAeSjyj"}, {"statCode": "C1zRQAPR"}, {"statCode": "rmgTbZjU"}]' \
    > test.out 2>&1
eval_tap $? 78 'PublicBulkCreateUserStatItems' test.out

#- 79 PublicQueryUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId '5ZnutbEE' \
    --additionalKey '0Uiiqm47' \
    --statCodes 'VFr2vPar,933WZeOH,AfCMZqSg' \
    --tags 'LP0gr3D2,7WtwspDC,Pe4eaOH8' \
    > test.out 2>&1
eval_tap $? 79 'PublicQueryUserStatItems' test.out

#- 80 PublicBulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'tFPYKaG4' \
    --body '[{"inc": 0.9505067521184603, "statCode": "xqmI2cHt"}, {"inc": 0.5276562655510717, "statCode": "PHl86Rkv"}, {"inc": 0.22531125064060875, "statCode": "fgIHgRcM"}]' \
    > test.out 2>&1
eval_tap $? 80 'PublicBulkIncUserStatItem1' test.out

#- 81 BulkIncUserStatItemValue2
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'HB9l21cC' \
    --body '[{"inc": 0.8086247310962573, "statCode": "F6i0wuQv"}, {"inc": 0.747657831665552, "statCode": "4AFi9nn2"}, {"inc": 0.5887930931673877, "statCode": "Pdebc75Q"}]' \
    > test.out 2>&1
eval_tap $? 81 'BulkIncUserStatItemValue2' test.out

#- 82 BulkResetUserStatItem3
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'QXCQiIjb' \
    --body '[{"statCode": "7O9Zn0SN"}, {"statCode": "gaBdPqz4"}, {"statCode": "uWO5Rzfb"}]' \
    > test.out 2>&1
eval_tap $? 82 'BulkResetUserStatItem3' test.out

#- 83 PublicCreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicCreateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'NTx5Q6RI' \
    --userId 'gKk0nHFu' \
    > test.out 2>&1
eval_tap $? 83 'PublicCreateUserStatItem' test.out

#- 84 DeleteUserStatItems1
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'i8WSXpt9' \
    --userId 'ZAAeYrU3' \
    > test.out 2>&1
eval_tap $? 84 'DeleteUserStatItems1' test.out

#- 85 PublicIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'jWqp7msA' \
    --userId 'bKQI0r1C' \
    --body '{"inc": 0.09871518265925483}' \
    > test.out 2>&1
eval_tap $? 85 'PublicIncUserStatItem' test.out

#- 86 PublicIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'X9AqUqcU' \
    --userId '6Gc5uj2j' \
    --body '{"inc": 0.4492972147884793}' \
    > test.out 2>&1
eval_tap $? 86 'PublicIncUserStatItemValue' test.out

#- 87 ResetUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode '18MzCU1S' \
    --userId 'OatDX03g' \
    > test.out 2>&1
eval_tap $? 87 'ResetUserStatItemValue1' test.out

#- 88 BulkUpdateUserStatItemV2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItemV2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"60Gx3Ki5": {}, "FJM5kDfH": {}, "qjUf8Ncd": {}}, "additionalKey": "RCN4lXPM", "statCode": "Zd9GcuNM", "updateStrategy": "INCREMENT", "userId": "rYDZdXXt", "value": 0.8015236876719856}, {"additionalData": {"wxl4cwVI": {}, "FrcRXKQN": {}, "FQDqHKXs": {}}, "additionalKey": "wQVyHL6N", "statCode": "diEJ6ZM5", "updateStrategy": "MAX", "userId": "oP6Q7LY1", "value": 0.9752846629320187}, {"additionalData": {"yBxLr9sO": {}, "AWPWlvmV": {}, "9wsvwMI7": {}}, "additionalKey": "SnQPuyQm", "statCode": "FK7nGv3s", "updateStrategy": "MAX", "userId": "Zs9egI6a", "value": 0.21908042984072018}]' \
    > test.out 2>&1
eval_tap $? 88 'BulkUpdateUserStatItemV2' test.out

#- 89 BulkFetchOrDefaultStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --additionalKey '2ehGYA1e' \
    --statCode 'HR6kjcA9' \
    --userIds 'fNBOipzJ,MTpQFOjg,6OmFgjZc' \
    > test.out 2>&1
eval_tap $? 89 'BulkFetchOrDefaultStatItems1' test.out

#- 90 AdminListUsersStatItems
./ng net.accelbyte.sdk.cli.Main social adminListUsersStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'lR7q1cJX' \
    --additionalKey 'a2PnF5mR' \
    --statCodes 'w7eDHe4n,W8hdDSH6,ryMiy3cE' \
    --tags 'xmB1hOtv,TWXDtka8,MpAYfDV8' \
    > test.out 2>&1
eval_tap $? 90 'AdminListUsersStatItems' test.out

#- 91 BulkUpdateUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'iIqs32c8' \
    --additionalKey 'YPFJaae4' \
    --body '[{"additionalData": {"dfX8hXL8": {}, "Ulimr9sL": {}, "LHn78qSH": {}}, "statCode": "HMmv9i8Y", "updateStrategy": "MAX", "value": 0.21521517403782764}, {"additionalData": {"YnRkUkFy": {}, "vIhnbHug": {}, "luRv5Kzi": {}}, "statCode": "47CsDApp", "updateStrategy": "MAX", "value": 0.3870582234951493}, {"additionalData": {"DFDUYZUk": {}, "ZbEZX0M1": {}, "EhLIu2bH": {}}, "statCode": "WCAPb1vC", "updateStrategy": "MAX", "value": 0.8145452157933817}]' \
    > test.out 2>&1
eval_tap $? 91 'BulkUpdateUserStatItem' test.out

#- 92 BulkGetOrDefaultByUserId
./ng net.accelbyte.sdk.cli.Main social bulkGetOrDefaultByUserId \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ccx7GPWO' \
    --additionalKey 'yYnognqh' \
    --body '{"statCodes": ["mxRxwJX5", "DnBFXmQP", "XMFcFUFL"]}' \
    > test.out 2>&1
eval_tap $? 92 'BulkGetOrDefaultByUserId' test.out

#- 93 BulkResetUserStatItemValues
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItemValues \
    --namespace "$AB_NAMESPACE" \
    --userId 'X8S121sk' \
    --additionalKey '80222O9v' \
    --body '[{"additionalData": {"KqNNm6C8": {}, "M95VMrZN": {}, "2SmK27ml": {}}, "statCode": "RYhyEMW1"}, {"additionalData": {"XVxoau3m": {}, "P4wcy8Tb": {}, "23Y44fyr": {}}, "statCode": "uvOOt94G"}, {"additionalData": {"UGltXdzP": {}, "tOcYXV6A": {}, "H0Yx10Dn": {}}, "statCode": "O4kDQMs6"}]' \
    > test.out 2>&1
eval_tap $? 93 'BulkResetUserStatItemValues' test.out

#- 94 DeleteUserStatItems2
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'jHPD5HCZ' \
    --userId 'CVkCByq2' \
    --additionalKey 'BUYQIhYr' \
    > test.out 2>&1
eval_tap $? 94 'DeleteUserStatItems2' test.out

#- 95 UpdateUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'bBXCyWIB' \
    --userId 'AtFLGerA' \
    --additionalKey '4y5q9fHr' \
    --body '{"additionalData": {"dskjEVem": {}, "2eouz0PB": {}, "TLb1EIhy": {}}, "updateStrategy": "MIN", "value": 0.9278743381954485}' \
    > test.out 2>&1
eval_tap $? 95 'UpdateUserStatItemValue' test.out

#- 96 BulkUpdateUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"C2LxzHzs": {}, "9eiTCslt": {}, "cxWnW8rv": {}}, "additionalKey": "HPLQYFNV", "statCode": "bxkldVNV", "updateStrategy": "OVERRIDE", "userId": "R63jsI5J", "value": 0.8090804015143764}, {"additionalData": {"pTk2Hu5s": {}, "a29CPLpQ": {}, "7tNw4AfM": {}}, "additionalKey": "tytu86CY", "statCode": "kkl3yvHN", "updateStrategy": "MIN", "userId": "GycmAqey", "value": 0.2902180954191832}, {"additionalData": {"axPBDJVl": {}, "YwhiXKVE": {}, "FXPGCEn1": {}}, "additionalKey": "qaspvtIR", "statCode": "85H5shvI", "updateStrategy": "INCREMENT", "userId": "5LDdD56e", "value": 0.0895765930797442}]' \
    > test.out 2>&1
eval_tap $? 96 'BulkUpdateUserStatItem1' test.out

#- 97 PublicQueryUserStatItems2
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'XGqRZI1l' \
    --additionalKey '1aQGNRYK' \
    --statCodes 'Fa0ptdFA,zQmGOtMc,Edvs4DoG' \
    --tags '1UrRaZUF,du2TLFtf,vGvCXKpN' \
    > test.out 2>&1
eval_tap $? 97 'PublicQueryUserStatItems2' test.out

#- 98 BulkUpdateUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'HoXwL89i' \
    --additionalKey 'agmwNQDL' \
    --body '[{"additionalData": {"c7s3soml": {}, "CxiTD8qY": {}, "gpgcmDCk": {}}, "statCode": "4AJyLS9i", "updateStrategy": "MIN", "value": 0.07324379889082422}, {"additionalData": {"DPdSDYGk": {}, "9fEac4CS": {}, "D1zpx2RH": {}}, "statCode": "DkCS0iXG", "updateStrategy": "OVERRIDE", "value": 0.25723542293400414}, {"additionalData": {"wpanFJha": {}, "ojIxThrp": {}, "79X4jHbd": {}}, "statCode": "KrXnCa08", "updateStrategy": "INCREMENT", "value": 0.2751479701492716}]' \
    > test.out 2>&1
eval_tap $? 98 'BulkUpdateUserStatItem2' test.out

#- 99 UpdateUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode '5Nun1t6U' \
    --userId 'w9kwLHLh' \
    --additionalKey 'sjmyHXn9' \
    --body '{"additionalData": {"OnexPPgR": {}, "kxXBgGQU": {}, "szSIcq4u": {}}, "updateStrategy": "INCREMENT", "value": 0.16311112558063934}' \
    > test.out 2>&1
eval_tap $? 99 'UpdateUserStatItemValue1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
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
    --userId 'eRdVzhva' \
    > test.out 2>&1
eval_tap $? 8 'GetUserProfiles' test.out

#- 9 GetProfile
./ng net.accelbyte.sdk.cli.Main social getProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'gjcJYZ3P' \
    --userId 'wQc9jmjE' \
    > test.out 2>&1
eval_tap $? 9 'GetProfile' test.out

#- 10 GetUserNamespaceSlots
eval_tap 0 10 'GetUserNamespaceSlots # SKIP deprecated' test.out

#- 11 GetSlotData
eval_tap 0 11 'GetSlotData # SKIP deprecated' test.out

#- 12 PublicGetUserGameProfiles
./ng net.accelbyte.sdk.cli.Main social publicGetUserGameProfiles \
    --namespace "$AB_NAMESPACE" \
    --userIds 'qLlvfq0w,HtGqOwjP,RTtrMfdl' \
    > test.out 2>&1
eval_tap $? 12 'PublicGetUserGameProfiles' test.out

#- 13 PublicGetUserProfiles
./ng net.accelbyte.sdk.cli.Main social publicGetUserProfiles \
    --namespace "$AB_NAMESPACE" \
    --userId 'HfZPHxtI' \
    > test.out 2>&1
eval_tap $? 13 'PublicGetUserProfiles' test.out

#- 14 PublicCreateProfile
./ng net.accelbyte.sdk.cli.Main social publicCreateProfile \
    --namespace "$AB_NAMESPACE" \
    --userId 'HmWrUSzX' \
    --body '{"achievements": ["zIjn9a2y", "I6FvHLN5", "KtGd9jdh"], "attributes": {"He5dc9uk": "kybzijcC", "7c28OhX5": "2CaYdYiO", "NNAPJPwX": "uUAWdgRZ"}, "avatarUrl": "3Azaf40J", "inventories": ["dzzxz7zc", "aYVCuC6y", "XWtVpsRc"], "label": "nDeGFYTf", "profileName": "Zin1bplD", "statistics": ["WKQx4eUm", "O5ZXrkAM", "RXq6vnJ9"], "tags": ["iAJdaSYE", "ZWZpBKm2", "zolUVPRm"]}' \
    > test.out 2>&1
eval_tap $? 14 'PublicCreateProfile' test.out

#- 15 PublicGetProfile
./ng net.accelbyte.sdk.cli.Main social publicGetProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'nTGlOVCA' \
    --userId 'uSjl2CvH' \
    > test.out 2>&1
eval_tap $? 15 'PublicGetProfile' test.out

#- 16 PublicUpdateProfile
./ng net.accelbyte.sdk.cli.Main social publicUpdateProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'x4lc8TCB' \
    --userId '1C3uu1Wl' \
    --body '{"achievements": ["mw7WG2Es", "xnngB0eR", "XtPL4UeL"], "attributes": {"878uPAbp": "MQjg5TqI", "dwRDP1zy": "v9RatDy8", "1nri727E": "fxVzPfBE"}, "avatarUrl": "GCXVVcZK", "inventories": ["WF73076Q", "4OnHQVca", "gEa3owZu"], "label": "bi2otyLi", "profileName": "lLYpfY0F", "statistics": ["M247BS1B", "LknZG6tw", "01TnbnDg"], "tags": ["sI9416ck", "PTeZCTTI", "TfLbpqJ2"]}' \
    > test.out 2>&1
eval_tap $? 16 'PublicUpdateProfile' test.out

#- 17 PublicDeleteProfile
./ng net.accelbyte.sdk.cli.Main social publicDeleteProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId '5Mb9wxZn' \
    --userId 'FxA6YlYd' \
    > test.out 2>&1
eval_tap $? 17 'PublicDeleteProfile' test.out

#- 18 PublicGetProfileAttribute
./ng net.accelbyte.sdk.cli.Main social publicGetProfileAttribute \
    --attributeName 'hrfbYRsq' \
    --namespace "$AB_NAMESPACE" \
    --profileId 'YyXpOpIp' \
    --userId 'YbbGXimT' \
    > test.out 2>&1
eval_tap $? 18 'PublicGetProfileAttribute' test.out

#- 19 PublicUpdateAttribute
./ng net.accelbyte.sdk.cli.Main social publicUpdateAttribute \
    --attributeName 'dRxeOIZm' \
    --namespace "$AB_NAMESPACE" \
    --profileId '6JKH1rys' \
    --userId '14q6nHPL' \
    --body '{"name": "mLpSKMoT", "value": "QonZoIOd"}' \
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
    --limit '38' \
    --offset '56' \
    --statCodes 'hNun6Qow' \
    > test.out 2>&1
eval_tap $? 26 'GetGlobalStatItems' test.out

#- 27 GetGlobalStatItemByStatCode
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItemByStatCode \
    --namespace "$AB_NAMESPACE" \
    --statCode 'FiUgHSHU' \
    > test.out 2>&1
eval_tap $? 27 'GetGlobalStatItemByStatCode' test.out

#- 28 GetStatCycles
./ng net.accelbyte.sdk.cli.Main social getStatCycles \
    --namespace "$AB_NAMESPACE" \
    --cycleType 'DAILY' \
    --limit '83' \
    --name 'jr6iaYdn' \
    --offset '59' \
    --sortBy 'lkfv2sYo' \
    --status 'STOPPED' \
    > test.out 2>&1
eval_tap $? 28 'GetStatCycles' test.out

#- 29 CreateStatCycle
./ng net.accelbyte.sdk.cli.Main social createStatCycle \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleType": "MONTHLY", "description": "iFaME8gI", "end": "1983-01-01T00:00:00Z", "name": "6VFVUnWg", "resetDate": 32, "resetDay": 92, "resetMonth": 55, "resetTime": "O5JIMfDI", "seasonPeriod": 46, "start": "1974-02-05T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 29 'CreateStatCycle' test.out

#- 30 BulkGetStatCycle
./ng net.accelbyte.sdk.cli.Main social bulkGetStatCycle \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["zuDKyeFo", "XErFyR3e", "iQSY5kYJ"]}' \
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
    --cycleId 'kD8f9oGs' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 33 'GetStatCycle' test.out

#- 34 UpdateStatCycle
./ng net.accelbyte.sdk.cli.Main social updateStatCycle \
    --cycleId 'bWE4ab8c' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleType": "WEEKLY", "description": "ijeDKiS7", "end": "1994-08-09T00:00:00Z", "name": "XcMMAZBz", "resetDate": 63, "resetDay": 82, "resetMonth": 54, "resetTime": "YyksL8ht", "seasonPeriod": 44, "start": "1974-12-14T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 34 'UpdateStatCycle' test.out

#- 35 DeleteStatCycle
./ng net.accelbyte.sdk.cli.Main social deleteStatCycle \
    --cycleId 'vS8nu4Zu' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 35 'DeleteStatCycle' test.out

#- 36 BulkAddStats
./ng net.accelbyte.sdk.cli.Main social bulkAddStats \
    --cycleId 'vPwhOu8V' \
    --namespace "$AB_NAMESPACE" \
    --body '{"statCodes": ["SH40FeI0", "GHRUI4rg", "ZAWaF6bY"]}' \
    > test.out 2>&1
eval_tap $? 36 'BulkAddStats' test.out

#- 37 StopStatCycle
./ng net.accelbyte.sdk.cli.Main social stopStatCycle \
    --cycleId 'K9wrEw8K' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 37 'StopStatCycle' test.out

#- 38 BulkFetchStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode '1enRG323' \
    --userIds 'dZMiYiYF' \
    > test.out 2>&1
eval_tap $? 38 'BulkFetchStatItems' test.out

#- 39 BulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.6400125016078952, "statCode": "cElH8QhG", "userId": "JOAOgJeo"}, {"inc": 0.9055301471998086, "statCode": "bvF4gEDD", "userId": "odfEn0cl"}, {"inc": 0.7660813499076634, "statCode": "gLOdrYM6", "userId": "YeyX5P5t"}]' \
    > test.out 2>&1
eval_tap $? 39 'BulkIncUserStatItem' test.out

#- 40 BulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.7501187919563254, "statCode": "WTxH1LGO", "userId": "LTkNeLw2"}, {"inc": 0.953435233241093, "statCode": "02TjgpDd", "userId": "adPxYSGg"}, {"inc": 0.17447825463472122, "statCode": "9SqFAyou", "userId": "OcNbebUb"}]' \
    > test.out 2>&1
eval_tap $? 40 'BulkIncUserStatItemValue' test.out

#- 41 BulkFetchOrDefaultStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'zyU0jg53' \
    --userIds 'rNFhAcYw,8EyyVWFq,Xn9WjISW' \
    > test.out 2>&1
eval_tap $? 41 'BulkFetchOrDefaultStatItems' test.out

#- 42 BulkResetUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "GA5Nb6Ma", "userId": "vgj6dtba"}, {"statCode": "1HRZY6CV", "userId": "5OP4R9il"}, {"statCode": "NxoxgkwM", "userId": "Jwsonhrv"}]' \
    > test.out 2>&1
eval_tap $? 42 'BulkResetUserStatItem' test.out

#- 43 GetStats
./ng net.accelbyte.sdk.cli.Main social getStats \
    --namespace "$AB_NAMESPACE" \
    --cycleIds '9GOFH1O3' \
    --isGlobal  \
    --isPublic  \
    --limit '92' \
    --offset '58' \
    > test.out 2>&1
eval_tap $? 43 'GetStats' test.out

#- 44 CreateStat
./ng net.accelbyte.sdk.cli.Main social createStat \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["7VN7Waf3", "Q0ibt94T", "utvsNqBy"], "defaultValue": 0.6249950366680926, "description": "X65ZQvhO", "globalAggregationMethod": "MIN", "ignoreAdditionalDataOnValueRejected": false, "incrementOnly": true, "isPublic": true, "maximum": 0.9607784436373531, "minimum": 0.6081125726549194, "name": "XIWiEmrh", "setAsGlobal": true, "setBy": "CLIENT", "statCode": "KmdOdZF8", "tags": ["bgkX6Hoj", "0lalEYKH", "ORQxsSav"]}' \
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
    --limit '39' \
    --offset '9' \
    --keyword 'jmUi1wgf' \
    > test.out 2>&1
eval_tap $? 47 'QueryStats' test.out

#- 48 GetStat
./ng net.accelbyte.sdk.cli.Main social getStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'uF7F9W5r' \
    > test.out 2>&1
eval_tap $? 48 'GetStat' test.out

#- 49 DeleteStat
./ng net.accelbyte.sdk.cli.Main social deleteStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'TSi2nCsK' \
    > test.out 2>&1
eval_tap $? 49 'DeleteStat' test.out

#- 50 UpdateStat
./ng net.accelbyte.sdk.cli.Main social updateStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'CoEw4ecB' \
    --body '{"cycleIds": ["jyDup8RW", "0UPtFvGC", "5mJYMYI1"], "defaultValue": 0.2511628537557973, "description": "Lnztw8xc", "globalAggregationMethod": "MIN", "ignoreAdditionalDataOnValueRejected": false, "isPublic": false, "name": "C3Q8CMTO", "tags": ["0dtX4gQT", "02cpl5Pq", "mTCRwUES"]}' \
    > test.out 2>&1
eval_tap $? 50 'UpdateStat' test.out

#- 51 GetStatItems
./ng net.accelbyte.sdk.cli.Main social getStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'kejhU5s9' \
    --limit '91' \
    --offset '16' \
    --sortBy 'W3eAbI6c' \
    > test.out 2>&1
eval_tap $? 51 'GetStatItems' test.out

#- 52 DeleteTiedStat
./ng net.accelbyte.sdk.cli.Main social deleteTiedStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'Ztwrrirb' \
    > test.out 2>&1
eval_tap $? 52 'DeleteTiedStat' test.out

#- 53 GetUserStatCycleItems
./ng net.accelbyte.sdk.cli.Main social getUserStatCycleItems \
    --cycleId 'aJLDteLM' \
    --namespace "$AB_NAMESPACE" \
    --userId 'p2aGbhyM' \
    --isPublic  \
    --limit '62' \
    --offset '11' \
    --sortBy 'xQ1O2dyX' \
    --statCodes 'vOiwHWsh' \
    > test.out 2>&1
eval_tap $? 53 'GetUserStatCycleItems' test.out

#- 54 GetUserStatItems
./ng net.accelbyte.sdk.cli.Main social getUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'fjE4iZha' \
    --isPublic  \
    --limit '76' \
    --offset '5' \
    --sortBy 'TtWjZJd4' \
    --statCodes '9Ezl0ipp' \
    --tags 'DwUuGUND' \
    > test.out 2>&1
eval_tap $? 54 'GetUserStatItems' test.out

#- 55 BulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social bulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'AUczja9a' \
    --body '[{"statCode": "nApWes4r"}, {"statCode": "hGASTm7z"}, {"statCode": "9qaHp07R"}]' \
    > test.out 2>&1
eval_tap $? 55 'BulkCreateUserStatItems' test.out

#- 56 BulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Z2IeM99R' \
    --body '[{"inc": 0.135304671251549, "statCode": "EDbNJJ8z"}, {"inc": 0.34844809640439645, "statCode": "xD1yDgFy"}, {"inc": 0.8097501240461359, "statCode": "yFunqDe9"}]' \
    > test.out 2>&1
eval_tap $? 56 'BulkIncUserStatItem1' test.out

#- 57 BulkIncUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'IUc6xuau' \
    --body '[{"inc": 0.45530174046982463, "statCode": "MMSD56rQ"}, {"inc": 0.21307190722515823, "statCode": "5XHaNWLV"}, {"inc": 0.9579732245163556, "statCode": "zXHFxpRs"}]' \
    > test.out 2>&1
eval_tap $? 57 'BulkIncUserStatItemValue1' test.out

#- 58 BulkResetUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'xLYlkHiH' \
    --body '[{"statCode": "Hu6AWOSw"}, {"statCode": "W8cnQ5qi"}, {"statCode": "c8PY69Pl"}]' \
    > test.out 2>&1
eval_tap $? 58 'BulkResetUserStatItem1' test.out

#- 59 CreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social createUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'WKsPp7ym' \
    --userId 'RwAPQcvo' \
    > test.out 2>&1
eval_tap $? 59 'CreateUserStatItem' test.out

#- 60 DeleteUserStatItems
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'ceYph63S' \
    --userId '1Wmsf7q2' \
    > test.out 2>&1
eval_tap $? 60 'DeleteUserStatItems' test.out

#- 61 IncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social incUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'xeYTKfsb' \
    --userId 'YPxhlpeB' \
    --body '{"inc": 0.3123170504199495}' \
    > test.out 2>&1
eval_tap $? 61 'IncUserStatItemValue' test.out

#- 62 ResetUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'NtwdC6bm' \
    --userId 'CqeUmKel' \
    --additionalKey '8zxrXWTQ' \
    --body '{"additionalData": {"mMRHVXML": {}, "rG2ixqfR": {}, "rNu20SXG": {}}}' \
    > test.out 2>&1
eval_tap $? 62 'ResetUserStatItemValue' test.out

#- 63 GetGlobalStatItems1
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --limit '47' \
    --offset '83' \
    --statCodes '2OSWPrNh' \
    > test.out 2>&1
eval_tap $? 63 'GetGlobalStatItems1' test.out

#- 64 GetGlobalStatItemByStatCode1
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItemByStatCode1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'hjZGJZ76' \
    > test.out 2>&1
eval_tap $? 64 'GetGlobalStatItemByStatCode1' test.out

#- 65 GetStatCycles1
./ng net.accelbyte.sdk.cli.Main social getStatCycles1 \
    --namespace "$AB_NAMESPACE" \
    --cycleType 'ANNUALLY' \
    --limit '44' \
    --name 'Yp2rlAv7' \
    --offset '77' \
    --sortBy '0so1kaj1' \
    --status 'STOPPED' \
    > test.out 2>&1
eval_tap $? 65 'GetStatCycles1' test.out

#- 66 BulkGetStatCycle1
./ng net.accelbyte.sdk.cli.Main social bulkGetStatCycle1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["sfbL6TCp", "VwpYBGnd", "2yZOcXWq"]}' \
    > test.out 2>&1
eval_tap $? 66 'BulkGetStatCycle1' test.out

#- 67 GetStatCycle1
./ng net.accelbyte.sdk.cli.Main social getStatCycle1 \
    --cycleId 'f75Jn8h6' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 67 'GetStatCycle1' test.out

#- 68 BulkFetchStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'eaXEjt9Y' \
    --userIds 'gNJX8VTN' \
    > test.out 2>&1
eval_tap $? 68 'BulkFetchStatItems1' test.out

#- 69 PublicBulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.5879713073969876, "statCode": "pXz1APsg", "userId": "gPNugnsB"}, {"inc": 0.11767637474534609, "statCode": "BdMBCGrv", "userId": "yftDOtxi"}, {"inc": 0.02863146266284844, "statCode": "Jvuq7361", "userId": "rYIwxCfK"}]' \
    > test.out 2>&1
eval_tap $? 69 'PublicBulkIncUserStatItem' test.out

#- 70 PublicBulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.37832247864458235, "statCode": "hmw0SrfG", "userId": "mtavRwdG"}, {"inc": 0.029412739407504995, "statCode": "oaIlPNZm", "userId": "YP775R33"}, {"inc": 0.12179657645917308, "statCode": "6dbhf6ma", "userId": "jCSsGnfZ"}]' \
    > test.out 2>&1
eval_tap $? 70 'PublicBulkIncUserStatItemValue' test.out

#- 71 BulkResetUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "slDqX259", "userId": "SyspQfnt"}, {"statCode": "ceoZgcyl", "userId": "nsmR5j8B"}, {"statCode": "iuqDeU5j", "userId": "qUmoSDzy"}]' \
    > test.out 2>&1
eval_tap $? 71 'BulkResetUserStatItem2' test.out

#- 72 CreateStat1
./ng net.accelbyte.sdk.cli.Main social createStat1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["tStBkH84", "AIXcmYrj", "1awoHZN2"], "defaultValue": 0.4948711494821314, "description": "C3ObwAVS", "globalAggregationMethod": "MIN", "ignoreAdditionalDataOnValueRejected": true, "incrementOnly": false, "isPublic": false, "maximum": 0.5934423971311815, "minimum": 0.49534570665898614, "name": "s5G4UW47", "setAsGlobal": true, "setBy": "SERVER", "statCode": "vJ2vLPuX", "tags": ["cP0KNKC1", "OYAsoU9e", "ZR7tExKm"]}' \
    > test.out 2>&1
eval_tap $? 72 'CreateStat1' test.out

#- 73 PublicListMyStatCycleItems
./ng net.accelbyte.sdk.cli.Main social publicListMyStatCycleItems \
    --cycleId 'Oijty2lO' \
    --namespace "$AB_NAMESPACE" \
    --limit '79' \
    --offset '21' \
    --sortBy 'CZlBliM4' \
    --statCodes 'w6jLkQ7b,sGiLYXFo,iHGQAISx' \
    > test.out 2>&1
eval_tap $? 73 'PublicListMyStatCycleItems' test.out

#- 74 PublicListMyStatItems
./ng net.accelbyte.sdk.cli.Main social publicListMyStatItems \
    --namespace "$AB_NAMESPACE" \
    --limit '74' \
    --offset '55' \
    --sortBy 'yvqaPWg6' \
    --statCodes '9pMlpa2g,JMzA1N4H,DqAUESZD' \
    --tags 'Y9KvqiCa,Fc08ldL1,2IvuPUsn' \
    > test.out 2>&1
eval_tap $? 74 'PublicListMyStatItems' test.out

#- 75 PublicListAllMyStatItems
./ng net.accelbyte.sdk.cli.Main social publicListAllMyStatItems \
    --namespace "$AB_NAMESPACE" \
    --additionalKey 'WyrLvAtv' \
    --statCodes 'JPa5mUoj,LAmmxxNh,pGWw96ir' \
    --tags 'lc7XgIjQ,oAmNDS2p,1zkZ5750' \
    > test.out 2>&1
eval_tap $? 75 'PublicListAllMyStatItems' test.out

#- 76 GetUserStatCycleItems1
./ng net.accelbyte.sdk.cli.Main social getUserStatCycleItems1 \
    --cycleId 'FyPMg7q9' \
    --namespace "$AB_NAMESPACE" \
    --userId 'pWxThxZQ' \
    --limit '70' \
    --offset '79' \
    --sortBy 'lFQgIaTj' \
    --statCodes 'p53gCWGk' \
    > test.out 2>&1
eval_tap $? 76 'GetUserStatCycleItems1' test.out

#- 77 PublicQueryUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'truz1q7P' \
    --limit '59' \
    --offset '53' \
    --sortBy 'wvasKdpc' \
    --statCodes '4U0UbpFz' \
    --tags 'GoNo7plh' \
    > test.out 2>&1
eval_tap $? 77 'PublicQueryUserStatItems' test.out

#- 78 PublicBulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicBulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'vyKTmebp' \
    --body '[{"statCode": "r4L4aXBY"}, {"statCode": "UK8BwBBV"}, {"statCode": "AaPVjF82"}]' \
    > test.out 2>&1
eval_tap $? 78 'PublicBulkCreateUserStatItems' test.out

#- 79 PublicQueryUserStatItems1
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'b2Zgz90D' \
    --additionalKey 'muyEsLJH' \
    --statCodes 'jPDLJtb2,TVQpZp4N,wifi4Meq' \
    --tags 'xvfOXCbf,pKLomEHl,3T9iGH9o' \
    > test.out 2>&1
eval_tap $? 79 'PublicQueryUserStatItems1' test.out

#- 80 PublicBulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'q0WzvLeU' \
    --body '[{"inc": 0.6239717077246033, "statCode": "brWUBtOD"}, {"inc": 0.16442735774598272, "statCode": "LXc9PDCk"}, {"inc": 0.7059908502809994, "statCode": "DFIW6cQI"}]' \
    > test.out 2>&1
eval_tap $? 80 'PublicBulkIncUserStatItem1' test.out

#- 81 BulkIncUserStatItemValue2
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ipfYoJaz' \
    --body '[{"inc": 0.5203912606694941, "statCode": "RboYUDsn"}, {"inc": 0.173317517226118, "statCode": "8wulJcot"}, {"inc": 0.18139327060332422, "statCode": "3wrjuxg1"}]' \
    > test.out 2>&1
eval_tap $? 81 'BulkIncUserStatItemValue2' test.out

#- 82 BulkResetUserStatItem3
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ujgVSIDB' \
    --body '[{"statCode": "omOfiaRL"}, {"statCode": "BnLSGeZ2"}, {"statCode": "QDxda67l"}]' \
    > test.out 2>&1
eval_tap $? 82 'BulkResetUserStatItem3' test.out

#- 83 PublicCreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicCreateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'grz8mDY9' \
    --userId 'pUW8ZqEj' \
    > test.out 2>&1
eval_tap $? 83 'PublicCreateUserStatItem' test.out

#- 84 DeleteUserStatItems1
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'OGYVDIlg' \
    --userId '9iX3Dbtk' \
    > test.out 2>&1
eval_tap $? 84 'DeleteUserStatItems1' test.out

#- 85 PublicIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'Bf9E26Q7' \
    --userId '7m4mySv3' \
    --body '{"inc": 0.006170787457137505}' \
    > test.out 2>&1
eval_tap $? 85 'PublicIncUserStatItem' test.out

#- 86 PublicIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'w9qJmlWu' \
    --userId 'MvJ12fST' \
    --body '{"inc": 0.09375894116036443}' \
    > test.out 2>&1
eval_tap $? 86 'PublicIncUserStatItemValue' test.out

#- 87 ResetUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'WoY0n4Wn' \
    --userId 'kgEw5XYM' \
    > test.out 2>&1
eval_tap $? 87 'ResetUserStatItemValue1' test.out

#- 88 BulkUpdateUserStatItemV2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItemV2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"KmkaMYUD": {}, "bvCMYEal": {}, "739JIe5K": {}}, "additionalKey": "vGGCZ5KX", "statCode": "WBrBDBic", "updateStrategy": "MAX", "userId": "q7ZRqmDp", "value": 0.7126669958491341}, {"additionalData": {"2Q1RUO8J": {}, "9hb66qLN": {}, "KQ883EW6": {}}, "additionalKey": "M1xrUNP5", "statCode": "iKRuQNUd", "updateStrategy": "MIN", "userId": "eM9RPFXA", "value": 0.2567179649253345}, {"additionalData": {"itcJ40Az": {}, "1a4WslKf": {}, "MW0eyDHX": {}}, "additionalKey": "uzVwKdZh", "statCode": "yzm2eORW", "updateStrategy": "INCREMENT", "userId": "rJ2zCshp", "value": 0.026950159046270072}]' \
    > test.out 2>&1
eval_tap $? 88 'BulkUpdateUserStatItemV2' test.out

#- 89 BulkFetchOrDefaultStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --additionalKey 'C6UEGr2u' \
    --statCode 'jaAq83DO' \
    --userIds '4aYwCLhv,WCcPhpNI,nBsTYJgq' \
    > test.out 2>&1
eval_tap $? 89 'BulkFetchOrDefaultStatItems1' test.out

#- 90 AdminListUsersStatItems
./ng net.accelbyte.sdk.cli.Main social adminListUsersStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'R979rZsn' \
    --additionalKey 'D2iofiOc' \
    --statCodes 'FuAKINV5,kcbQAfcy,FO6N5B3d' \
    --tags 'a8xQJsGh,RmS2sias,1s2SE0EH' \
    > test.out 2>&1
eval_tap $? 90 'AdminListUsersStatItems' test.out

#- 91 BulkUpdateUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'yxSpOF6p' \
    --additionalKey 'bau3noiZ' \
    --body '[{"additionalData": {"b01EVRYP": {}, "6rfzaMxN": {}, "wDeXyJjz": {}}, "statCode": "nyPl7zXi", "updateStrategy": "INCREMENT", "value": 0.07294831188101436}, {"additionalData": {"0VeugUuc": {}, "PCRrYmuW": {}, "FBcSobpp": {}}, "statCode": "8PXJSd9t", "updateStrategy": "MIN", "value": 0.706879603577687}, {"additionalData": {"0mp8iDft": {}, "aOpXAhFn": {}, "hiDGdrs0": {}}, "statCode": "CDQ7wTwc", "updateStrategy": "MIN", "value": 0.5039637699649124}]' \
    > test.out 2>&1
eval_tap $? 91 'BulkUpdateUserStatItem' test.out

#- 92 BulkResetUserStatItemValues
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItemValues \
    --namespace "$AB_NAMESPACE" \
    --userId 'iFVcpwsE' \
    --additionalKey 'TYABTlgX' \
    --body '[{"additionalData": {"9FFroJEe": {}, "U03y8Eys": {}, "iF6GMiAq": {}}, "statCode": "AlFXFIuX"}, {"additionalData": {"OhR8ig5E": {}, "8kNiGC6o": {}, "pk6jsK63": {}}, "statCode": "U8FRuoWe"}, {"additionalData": {"rr8cqc4K": {}, "EqyEQTrL": {}, "Av8Qxka8": {}}, "statCode": "3Ne8Kvm8"}]' \
    > test.out 2>&1
eval_tap $? 92 'BulkResetUserStatItemValues' test.out

#- 93 DeleteUserStatItems2
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'QAmLNna0' \
    --userId 'FK8GWXuP' \
    --additionalKey 'uiRhAFZL' \
    > test.out 2>&1
eval_tap $? 93 'DeleteUserStatItems2' test.out

#- 94 UpdateUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'xSmKfoid' \
    --userId 'zv7S1TmJ' \
    --additionalKey 'efBGEWE4' \
    --body '{"additionalData": {"qdJj8euz": {}, "OUtCM6iH": {}, "C4qdAtuJ": {}}, "updateStrategy": "INCREMENT", "value": 0.5550293612727779}' \
    > test.out 2>&1
eval_tap $? 94 'UpdateUserStatItemValue' test.out

#- 95 BulkUpdateUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"ccUK71TL": {}, "vlOBBGjg": {}, "iEfSCn6D": {}}, "additionalKey": "cjRnodiD", "statCode": "7Y5TN1ul", "updateStrategy": "OVERRIDE", "userId": "OoTGlm2a", "value": 0.7962647482019132}, {"additionalData": {"vp3vXgwy": {}, "A036F0u9": {}, "PtDN8zm1": {}}, "additionalKey": "ZvwCBEZX", "statCode": "vbyuY406", "updateStrategy": "MIN", "userId": "D5vRFIQt", "value": 0.9068441131992563}, {"additionalData": {"JL7bWJLO": {}, "DZyOqoJP": {}, "17083iL5": {}}, "additionalKey": "DZHFLXM4", "statCode": "XUIlaDAz", "updateStrategy": "MIN", "userId": "sxbvFOct", "value": 0.6545507575875545}]' \
    > test.out 2>&1
eval_tap $? 95 'BulkUpdateUserStatItem1' test.out

#- 96 PublicQueryUserStatItems2
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'lAmLuOBG' \
    --additionalKey 'Mm1OzRy1' \
    --statCodes 'zwwn1oKY,HRLGE3TW,Ne9zGPmN' \
    --tags 'AhfsbrvO,v4VImOBO,MAgOKmuG' \
    > test.out 2>&1
eval_tap $? 96 'PublicQueryUserStatItems2' test.out

#- 97 BulkUpdateUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'dZZTTk9S' \
    --additionalKey 'WCl26zgv' \
    --body '[{"additionalData": {"95oZC5AI": {}, "SRVjOzvi": {}, "l8ClP35S": {}}, "statCode": "PNkYZpl6", "updateStrategy": "MAX", "value": 0.8461393484565958}, {"additionalData": {"6kLVSwQx": {}, "5FWHuwE1": {}, "mNQiBcwD": {}}, "statCode": "UdQKBMOp", "updateStrategy": "MIN", "value": 0.21448596503405015}, {"additionalData": {"bcZbMoQn": {}, "SrrbJdAZ": {}, "0ONhzzEn": {}}, "statCode": "fTV1dGaK", "updateStrategy": "INCREMENT", "value": 0.5417609273916738}]' \
    > test.out 2>&1
eval_tap $? 97 'BulkUpdateUserStatItem2' test.out

#- 98 UpdateUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'xwsuu4T5' \
    --userId 'el8si7qO' \
    --additionalKey 'h7bpij50' \
    --body '{"additionalData": {"uJ5gKQBd": {}, "R4trmNOu": {}, "KO4uhApO": {}}, "updateStrategy": "MIN", "value": 0.09480797801833651}' \
    > test.out 2>&1
eval_tap $? 98 'UpdateUserStatItemValue1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
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
echo "1..44"

#- 1 Login
./ng net.accelbyte.sdk.cli.Main loginClient \
    > test.out 2>&1
eval_tap $? 1 'Login' test.out

if [ $EXIT_CODE -ne 0 ]; then
  echo "Bail out! Login failed."
  exit $EXIT_CODE
fi

touch "tmp.dat"

#- 2 AdminCreateChainingOperations
./ng net.accelbyte.sdk.cli.Main inventory adminCreateChainingOperations \
    --namespace "$AB_NAMESPACE" \
    --body '{"message": "hXOdcTiG", "operations": [{"consumeItems": [{"dateRangeValidation": false, "inventoryId": "q69HHnpL", "options": ["lz77Xg9U", "QQLndAc9", "o3Ta9NVp"], "qty": 91, "slotId": "J6e5gsf7", "sourceItemId": "ig7d46nG"}, {"dateRangeValidation": true, "inventoryId": "Ic6lyeSj", "options": ["FaVsBo68", "zGO4aLCe", "SndnRunS"], "qty": 91, "slotId": "rj40UsSy", "sourceItemId": "AG52DYwP"}, {"dateRangeValidation": true, "inventoryId": "0gNVEsh7", "options": ["9DqFh4jC", "0zv3xmeZ", "IzyhRwHk"], "qty": 59, "slotId": "TGjIQq8j", "sourceItemId": "Q5qfmwUl"}], "createItems": [{"customAttributes": {"dAHCl5KL": {}, "RMaWWwWg": {}, "bDB4mJRb": {}}, "inventoryConfigurationCode": "KEaq7O31", "inventoryId": "MMHIca4R", "qty": 64, "serverCustomAttributes": {"jFt4HGGR": {}, "Aw0iCjD3": {}, "SG0O5zPc": {}}, "slotId": "nQqaxvuH", "slotUsed": 90, "source": "ECOMMERCE", "sourceItemId": "V5HnnJYL", "tags": ["QtAQTek5", "I838XILU", "TDfYN6eg"], "toSpecificInventory": true, "type": "3IuD2eJX"}, {"customAttributes": {"ztNOrCMc": {}, "aZwhVIVd": {}, "SgEnvtX3": {}}, "inventoryConfigurationCode": "xzqDmf9L", "inventoryId": "kGBLAjHO", "qty": 45, "serverCustomAttributes": {"DxPHsB56": {}, "bZG7toft": {}, "2bDJ00Qv": {}}, "slotId": "J89DSCQG", "slotUsed": 17, "source": "ECOMMERCE", "sourceItemId": "PIUiIm21", "tags": ["jdCdEWWQ", "sIauQv3W", "StN4CHgR"], "toSpecificInventory": false, "type": "tarD11Cg"}, {"customAttributes": {"D8n9Ibjp": {}, "lCmrTRDf": {}, "HQdBlwMG": {}}, "inventoryConfigurationCode": "RTR7IJEh", "inventoryId": "jBfhPIGA", "qty": 53, "serverCustomAttributes": {"2KjgyaXV": {}, "8Lz2s3S7": {}, "PJG6do7B": {}}, "slotId": "nrcqBlTa", "slotUsed": 99, "source": "ECOMMERCE", "sourceItemId": "4S0lZGMR", "tags": ["KjDk9koN", "T4rZFOOv", "c3kr7CsK"], "toSpecificInventory": false, "type": "eNLHqEi4"}], "removeItems": [{"inventoryId": "jr3kbP6j", "slotId": "6urOWpUh", "sourceItemId": "qZboU2hF"}, {"inventoryId": "gpVkVb8e", "slotId": "l9xhLOZJ", "sourceItemId": "i33gbM3i"}, {"inventoryId": "DjeDyBCk", "slotId": "PF8rALLJ", "sourceItemId": "To14KVC3"}], "targetUserId": "fOAOiMeD", "updateItems": [{"customAttributes": {"M5xAtbNa": {}, "rpi6paVQ": {}, "WqhXkKZN": {}}, "inventoryId": "xnVBECsV", "serverCustomAttributes": {"CyEpI5nH": {}, "wmC5dWRP": {}, "Fzd8dXJv": {}}, "slotId": "KC39oB7d", "sourceItemId": "9B24sAl7", "tags": ["cX3aSfq0", "fKatHG6k", "FJaL71X7"], "type": "dyXCcy3I"}, {"customAttributes": {"zP2qFpIy": {}, "ZaI1qxCH": {}, "0sVU1gch": {}}, "inventoryId": "9P6NcmfP", "serverCustomAttributes": {"2VMxjL19": {}, "RTcVRUgZ": {}, "2wb8o6Fd": {}}, "slotId": "BrShQu8k", "sourceItemId": "fCDmGJP7", "tags": ["oWbXR27s", "YxBsIjE0", "XdiPKvO2"], "type": "W9gLDhkv"}, {"customAttributes": {"frhC3yBW": {}, "kVirMvtU": {}, "7oS18ZhX": {}}, "inventoryId": "o5uKNRcY", "serverCustomAttributes": {"1qaUGeCL": {}, "4OwyUV6X": {}, "esIl3hNM": {}}, "slotId": "Mi9qGl7T", "sourceItemId": "XO3ZeNqQ", "tags": ["V8hbAHqd", "pF95VrsV", "V8YXtZEE"], "type": "83zcEUTR"}]}, {"consumeItems": [{"dateRangeValidation": true, "inventoryId": "5KzuiYs3", "options": ["uLAtj78Z", "TgbUXz06", "6uVEAMos"], "qty": 30, "slotId": "M755pT7H", "sourceItemId": "sTP75GRV"}, {"dateRangeValidation": true, "inventoryId": "xvKSYWIn", "options": ["wQlq5IwB", "GEyK0fUi", "fdYhzpYl"], "qty": 63, "slotId": "cfccBmYF", "sourceItemId": "sPrmLym4"}, {"dateRangeValidation": false, "inventoryId": "KPwuA2iX", "options": ["NPMWlAUE", "Jb0MihbJ", "FfDHrHAH"], "qty": 98, "slotId": "2sfCtJCb", "sourceItemId": "ehbIsTBf"}], "createItems": [{"customAttributes": {"qTuopUvt": {}, "7gyefJCm": {}, "WEgmygbj": {}}, "inventoryConfigurationCode": "gg1FCJIj", "inventoryId": "zlcJZuuM", "qty": 34, "serverCustomAttributes": {"cdwTGX0P": {}, "qmbWnTjP": {}, "CELUiIno": {}}, "slotId": "Ywk3rHCF", "slotUsed": 5, "source": "ECOMMERCE", "sourceItemId": "9J2GVfgy", "tags": ["qyRyJkR5", "e8nRoOLC", "3Fowwdxw"], "toSpecificInventory": false, "type": "J2qv0TeD"}, {"customAttributes": {"6rGK21Lk": {}, "WtK0kI50": {}, "hz2doFHY": {}}, "inventoryConfigurationCode": "0Gu5ccrI", "inventoryId": "TMhgMKCb", "qty": 64, "serverCustomAttributes": {"qhfvhCgi": {}, "0i192MCO": {}, "BnScI5vh": {}}, "slotId": "ixfhavXC", "slotUsed": 90, "source": "OTHER", "sourceItemId": "I1NVWuFO", "tags": ["eUoCO9pT", "Y7OzrTtS", "suyYKfJs"], "toSpecificInventory": false, "type": "dTakvsNr"}, {"customAttributes": {"H7HZ0LqQ": {}, "V3PqkLkP": {}, "eLeAQwyh": {}}, "inventoryConfigurationCode": "AYsYeyAX", "inventoryId": "qgRiIwnc", "qty": 6, "serverCustomAttributes": {"yhSTQI24": {}, "oibDRnw0": {}, "zQUYFlWv": {}}, "slotId": "ZDZUCarv", "slotUsed": 60, "source": "OTHER", "sourceItemId": "I8QTtwSr", "tags": ["LMgUsoKs", "OTA46TVI", "4hxsbmFq"], "toSpecificInventory": false, "type": "0LvPa7o9"}], "removeItems": [{"inventoryId": "l1WB8cNL", "slotId": "V5FoHjMM", "sourceItemId": "37npI74E"}, {"inventoryId": "gToCiQft", "slotId": "EaH23oae", "sourceItemId": "O4TkX5t3"}, {"inventoryId": "7VEKBykC", "slotId": "wPnyn8WW", "sourceItemId": "xEp5OGzH"}], "targetUserId": "HqdnqOMM", "updateItems": [{"customAttributes": {"3tywr94R": {}, "acG9ru8b": {}, "PeosVmjK": {}}, "inventoryId": "34P3vhH2", "serverCustomAttributes": {"dwzuO2Ys": {}, "SmqHXHTC": {}, "6HyOR9xu": {}}, "slotId": "FNj4vz2l", "sourceItemId": "QFtI8CLH", "tags": ["Nth0vQ2D", "tFvz9QUy", "N9WNwiMs"], "type": "CiynLG0e"}, {"customAttributes": {"RVljZ1Ex": {}, "ZpQozwNX": {}, "goi0z9Hh": {}}, "inventoryId": "jueKJiux", "serverCustomAttributes": {"cRETxVqw": {}, "ZgIxI3Oq": {}, "ZyISrHX4": {}}, "slotId": "fTecn6Hi", "sourceItemId": "Al65UcTu", "tags": ["QNJzlPZc", "Sosx9EmU", "7eQxQJWh"], "type": "ott3V9VK"}, {"customAttributes": {"4A3hQF5P": {}, "QSCQ0Mu9": {}, "BIaY3pgb": {}}, "inventoryId": "CYlCdwEs", "serverCustomAttributes": {"HilzNWXi": {}, "0199Osv9": {}, "qBkt41PT": {}}, "slotId": "xTlu07zh", "sourceItemId": "iqdoBz3p", "tags": ["NqIcKUyd", "KX79yQB2", "NUwkaU7c"], "type": "er3IYmLa"}]}, {"consumeItems": [{"dateRangeValidation": false, "inventoryId": "77TlraOI", "options": ["9JaxH26Y", "Oii4cHBS", "QvkyzIWk"], "qty": 23, "slotId": "3R6bkwHz", "sourceItemId": "pTTYyCdD"}, {"dateRangeValidation": true, "inventoryId": "KMhq6u7d", "options": ["JXFhrc6E", "VeRraHoh", "8o4z1wyJ"], "qty": 28, "slotId": "9AJhaq9N", "sourceItemId": "xVltGiPe"}, {"dateRangeValidation": true, "inventoryId": "CKc0kIX5", "options": ["ZTPp74OQ", "PK0yUTjF", "lpPshvcA"], "qty": 37, "slotId": "9S1fvoiX", "sourceItemId": "G3kPUZhk"}], "createItems": [{"customAttributes": {"eid1YZUG": {}, "MI76OXN6": {}, "Jrw8Wcrp": {}}, "inventoryConfigurationCode": "F2AlBdwv", "inventoryId": "og4XEQ9t", "qty": 50, "serverCustomAttributes": {"i3Mdhapl": {}, "2HEvhb8Q": {}, "yxvOhPgO": {}}, "slotId": "pvcuVM4f", "slotUsed": 51, "source": "OTHER", "sourceItemId": "0N4G7WMC", "tags": ["JDS9GRef", "uLTBsYDS", "Dpy6DXgB"], "toSpecificInventory": false, "type": "ONXWxlIF"}, {"customAttributes": {"PxiBi4ut": {}, "dJJl8HSZ": {}, "I6xmTV8A": {}}, "inventoryConfigurationCode": "2t72Hbvc", "inventoryId": "8f6iKGDS", "qty": 96, "serverCustomAttributes": {"DWX4FjTz": {}, "HQgi2mnP": {}, "MZEaC31x": {}}, "slotId": "Lsovh79a", "slotUsed": 43, "source": "ECOMMERCE", "sourceItemId": "NJCkd4et", "tags": ["tndEv1oK", "k3JEwPoO", "ni6INIyc"], "toSpecificInventory": false, "type": "tz2zfbEp"}, {"customAttributes": {"WyZeugNm": {}, "ArzD3Kdk": {}, "JVRMIBi0": {}}, "inventoryConfigurationCode": "HqcjJZab", "inventoryId": "t8aY0JWM", "qty": 60, "serverCustomAttributes": {"HkO5OgLj": {}, "QTVvhIPH": {}, "Pv7MAD5Z": {}}, "slotId": "mBbxSMVD", "slotUsed": 62, "source": "OTHER", "sourceItemId": "ULOnDZm2", "tags": ["WsfoG87G", "epyPH5oF", "UCB6PpMr"], "toSpecificInventory": true, "type": "BgveKWTy"}], "removeItems": [{"inventoryId": "pXD7FUfA", "slotId": "9syOHbc9", "sourceItemId": "T0EXmHOv"}, {"inventoryId": "ERw9gnsj", "slotId": "oHa4hGBG", "sourceItemId": "xPWqbhjy"}, {"inventoryId": "KwbbKImA", "slotId": "8CGSRD61", "sourceItemId": "lQeayB0O"}], "targetUserId": "GQUw9GdD", "updateItems": [{"customAttributes": {"UF9kvBZl": {}, "5V6EsZh3": {}, "UkusrFVq": {}}, "inventoryId": "7gVrLr0t", "serverCustomAttributes": {"eNVYTi6c": {}, "GgouGSSS": {}, "m1Al1Py8": {}}, "slotId": "HOPH2xgM", "sourceItemId": "fIcUk9dT", "tags": ["OL7aNwMd", "aKEeLsVW", "Qjdmfann"], "type": "ZfD1JEZG"}, {"customAttributes": {"rgZyZk30": {}, "gS7I8oeG": {}, "E5kjjpaf": {}}, "inventoryId": "rPKJIHAa", "serverCustomAttributes": {"G3Nvc1KV": {}, "ZJqYWlYi": {}, "Y8YhVg9o": {}}, "slotId": "6qb3es91", "sourceItemId": "IgHfiAyN", "tags": ["nZQwEe9t", "FcV4G3Tm", "jocmjUKJ"], "type": "iDpNzKCT"}, {"customAttributes": {"YFfm1yyA": {}, "Km3WBn5c": {}, "zlFwcCOw": {}}, "inventoryId": "ZfoWus3q", "serverCustomAttributes": {"umvVCBtB": {}, "Q1s8ouRP": {}, "hDVov5Tk": {}}, "slotId": "0T06kcPf", "sourceItemId": "YCi1mR2R", "tags": ["msA0O3bo", "9NTX0sZc", "oebhQosT"], "type": "e9f2aoXS"}]}], "requestId": "xL0bUzZK"}' \
    > test.out 2>&1
eval_tap $? 2 'AdminCreateChainingOperations' test.out

#- 3 AdminListIntegrationConfigurations
./ng net.accelbyte.sdk.cli.Main inventory adminListIntegrationConfigurations \
    --namespace "$AB_NAMESPACE" \
    --limit '95' \
    --offset '75' \
    --sortBy 'createdAt:asc' \
    > test.out 2>&1
eval_tap $? 3 'AdminListIntegrationConfigurations' test.out

#- 4 AdminCreateIntegrationConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminCreateIntegrationConfiguration \
    --namespace "$AB_NAMESPACE" \
    --body '{"mapItemType": ["5wmwNqwE", "jgnLn7K4", "jyDFttOp"], "serviceName": "Ms6T2WX3", "targetInventoryCode": "XUIwek2l"}' \
    > test.out 2>&1
eval_tap $? 4 'AdminCreateIntegrationConfiguration' test.out

#- 5 AdminUpdateIntegrationConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateIntegrationConfiguration \
    --integrationConfigurationId 'yMBJel0q' \
    --namespace "$AB_NAMESPACE" \
    --body '{"mapItemType": ["nrpN9lho", "TMErZUiS", "pv72ANLx"], "serviceName": "HSC9rJo9", "targetInventoryCode": "GPFiwtvT"}' \
    > test.out 2>&1
eval_tap $? 5 'AdminUpdateIntegrationConfiguration' test.out

#- 6 AdminUpdateStatusIntegrationConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateStatusIntegrationConfiguration \
    --integrationConfigurationId 'eFtQ4i6D' \
    --namespace "$AB_NAMESPACE" \
    --body '{"status": "INIT"}' \
    > test.out 2>&1
eval_tap $? 6 'AdminUpdateStatusIntegrationConfiguration' test.out

#- 7 AdminListInventories
./ng net.accelbyte.sdk.cli.Main inventory adminListInventories \
    --namespace "$AB_NAMESPACE" \
    --inventoryConfigurationCode '8OhtcYM0' \
    --limit '4' \
    --offset '86' \
    --sortBy 'createdAt:asc' \
    --userId 'wiSbQN83' \
    > test.out 2>&1
eval_tap $? 7 'AdminListInventories' test.out

#- 8 AdminCreateInventory
./ng net.accelbyte.sdk.cli.Main inventory adminCreateInventory \
    --namespace "$AB_NAMESPACE" \
    --body '{"inventoryConfigurationCode": "pKLHS2ot", "userId": "qmmMywmS"}' \
    > test.out 2>&1
eval_tap $? 8 'AdminCreateInventory' test.out

#- 9 AdminGetInventory
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventory \
    --inventoryId 'imVJ4bex' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'AdminGetInventory' test.out

#- 10 AdminUpdateInventory
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateInventory \
    --inventoryId 'SgYeZNsc' \
    --namespace "$AB_NAMESPACE" \
    --body '{"incMaxSlots": 89}' \
    > test.out 2>&1
eval_tap $? 10 'AdminUpdateInventory' test.out

#- 11 DeleteInventory
./ng net.accelbyte.sdk.cli.Main inventory deleteInventory \
    --inventoryId '3tZ8Shba' \
    --namespace "$AB_NAMESPACE" \
    --body '{"message": "8ht0WdwI"}' \
    > test.out 2>&1
eval_tap $? 11 'DeleteInventory' test.out

#- 12 AdminListItems
./ng net.accelbyte.sdk.cli.Main inventory adminListItems \
    --inventoryId '2fMHS0xA' \
    --namespace "$AB_NAMESPACE" \
    --limit '39' \
    --offset '71' \
    --sortBy 'updatedAt:asc' \
    --sourceItemId '1hrVFuNU' \
    --tags 'wb33bzIx' \
    > test.out 2>&1
eval_tap $? 12 'AdminListItems' test.out

#- 13 AdminGetInventoryItem
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventoryItem \
    --inventoryId 'tukrZCWR' \
    --namespace "$AB_NAMESPACE" \
    --slotId 'rI58laoA' \
    --sourceItemId 'c0VG183v' \
    > test.out 2>&1
eval_tap $? 13 'AdminGetInventoryItem' test.out

#- 14 AdminListInventoryConfigurations
./ng net.accelbyte.sdk.cli.Main inventory adminListInventoryConfigurations \
    --namespace "$AB_NAMESPACE" \
    --code 'N2d5oiQj' \
    --limit '9' \
    --offset '22' \
    --sortBy 'createdAt' \
    > test.out 2>&1
eval_tap $? 14 'AdminListInventoryConfigurations' test.out

#- 15 AdminCreateInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminCreateInventoryConfiguration \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "LqobVBCZ", "description": "T1eb3iQ9", "initialMaxSlots": 41, "maxInstancesPerUser": 13, "maxUpgradeSlots": 94, "name": "QgFODb1S"}' \
    > test.out 2>&1
eval_tap $? 15 'AdminCreateInventoryConfiguration' test.out

#- 16 AdminGetInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventoryConfiguration \
    --inventoryConfigurationId 'Z1ife7bq' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'AdminGetInventoryConfiguration' test.out

#- 17 AdminUpdateInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateInventoryConfiguration \
    --inventoryConfigurationId 'tXRhRe9N' \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "wFIHoGfl", "description": "iAUrafCN", "initialMaxSlots": 50, "maxInstancesPerUser": 92, "maxUpgradeSlots": 91, "name": "QE5wE7Mq"}' \
    > test.out 2>&1
eval_tap $? 17 'AdminUpdateInventoryConfiguration' test.out

#- 18 AdminDeleteInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteInventoryConfiguration \
    --inventoryConfigurationId 'I3ZRqLLB' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminDeleteInventoryConfiguration' test.out

#- 19 AdminListItemTypes
./ng net.accelbyte.sdk.cli.Main inventory adminListItemTypes \
    --namespace "$AB_NAMESPACE" \
    --limit '65' \
    --offset '74' \
    --sortBy 'createdAt:asc' \
    > test.out 2>&1
eval_tap $? 19 'AdminListItemTypes' test.out

#- 20 AdminCreateItemType
./ng net.accelbyte.sdk.cli.Main inventory adminCreateItemType \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "TPGuOB2o"}' \
    > test.out 2>&1
eval_tap $? 20 'AdminCreateItemType' test.out

#- 21 AdminDeleteItemType
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteItemType \
    --itemTypeName '3BZVQ4VH' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'AdminDeleteItemType' test.out

#- 22 AdminListTags
./ng net.accelbyte.sdk.cli.Main inventory adminListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '37' \
    --offset '50' \
    --owner 'CwSmWLhH' \
    --sortBy 'createdAt:asc' \
    > test.out 2>&1
eval_tap $? 22 'AdminListTags' test.out

#- 23 AdminCreateTag
./ng net.accelbyte.sdk.cli.Main inventory adminCreateTag \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "VgwQe6tM", "owner": "CLIENT"}' \
    > test.out 2>&1
eval_tap $? 23 'AdminCreateTag' test.out

#- 24 AdminDeleteTag
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteTag \
    --namespace "$AB_NAMESPACE" \
    --tagName 'cjcrY8DO' \
    > test.out 2>&1
eval_tap $? 24 'AdminDeleteTag' test.out

#- 25 AdminConsumeUserItem
./ng net.accelbyte.sdk.cli.Main inventory adminConsumeUserItem \
    --inventoryId 'eWuP4iZd' \
    --namespace "$AB_NAMESPACE" \
    --userId 'tcmrYRft' \
    --dateRangeValidation 'WXJzpW6k' \
    --body '{"options": ["iZtyusWP", "GBLsmqGM", "4sBMsVV7"], "qty": 19, "slotId": "eoqTxirw", "sourceItemId": "DdwCvnns"}' \
    > test.out 2>&1
eval_tap $? 25 'AdminConsumeUserItem' test.out

#- 26 AdminBulkUpdateMyItems
./ng net.accelbyte.sdk.cli.Main inventory adminBulkUpdateMyItems \
    --inventoryId '7Gm6ZKX9' \
    --namespace "$AB_NAMESPACE" \
    --userId 'I64WptpO' \
    --body '[{"customAttributes": {"cNx95Mir": {}, "YPo30eaF": {}, "0CZPIkym": {}}, "serverCustomAttributes": {"jbyHOsr3": {}, "YzKbD3Mc": {}, "a0NpnmGk": {}}, "slotId": "JkP1BdkN", "sourceItemId": "MYbNDsAN", "tags": ["AVKvWxAC", "2ZxbuCwB", "RR5Gb6Ok"], "type": "19nA4Bbf"}, {"customAttributes": {"3RWMtQHk": {}, "PNpptyXq": {}, "RQbADgRv": {}}, "serverCustomAttributes": {"2UW0uIhj": {}, "Za9N8VNG": {}, "BdDAy6fB": {}}, "slotId": "zbBUt2es", "sourceItemId": "RVoc0lNO", "tags": ["2CP5a9NG", "soBF0OtE", "7h4GkT54"], "type": "2OcY2Zy4"}, {"customAttributes": {"fnB0C4Hz": {}, "nu16NojS": {}, "4On4rt1Z": {}}, "serverCustomAttributes": {"3XH4axV8": {}, "pw91aKD0": {}, "R7SKHhwH": {}}, "slotId": "V5RedVam", "sourceItemId": "B8NIA22a", "tags": ["E2eO5j20", "HehCOWGC", "hwdIWxYU"], "type": "QCOemnRv"}]' \
    > test.out 2>&1
eval_tap $? 26 'AdminBulkUpdateMyItems' test.out

#- 27 AdminSaveItemToInventory
./ng net.accelbyte.sdk.cli.Main inventory adminSaveItemToInventory \
    --inventoryId 'Ltbb4RGe' \
    --namespace "$AB_NAMESPACE" \
    --userId 'IvaCoddJ' \
    --body '{"customAttributes": {"5neEUyOf": {}, "ejMYun8h": {}, "xJjiz0fF": {}}, "qty": 48, "serverCustomAttributes": {"4a1XP1l6": {}, "RNAoZKs9": {}, "733FFryd": {}}, "slotId": "nV9TsLCH", "slotUsed": 46, "source": "ECOMMERCE", "sourceItemId": "Yga802s6", "tags": ["sMODSdEn", "Z0scCbpm", "yPmGNABd"], "type": "W4qv5iKZ"}' \
    > test.out 2>&1
eval_tap $? 27 'AdminSaveItemToInventory' test.out

#- 28 AdminBulkRemoveItems
./ng net.accelbyte.sdk.cli.Main inventory adminBulkRemoveItems \
    --inventoryId 'NJhe3TN0' \
    --namespace "$AB_NAMESPACE" \
    --userId 'unAjnfMw' \
    --body '[{"slotId": "W7eq4OQ9", "sourceItemId": "ZRqoogd9"}, {"slotId": "Xgur868Z", "sourceItemId": "0OADt361"}, {"slotId": "mMN5RT0I", "sourceItemId": "IEhcLprF"}]' \
    > test.out 2>&1
eval_tap $? 28 'AdminBulkRemoveItems' test.out

#- 29 AdminBulkSaveItemToInventory
./ng net.accelbyte.sdk.cli.Main inventory adminBulkSaveItemToInventory \
    --inventoryId 'QWWcrt47' \
    --namespace "$AB_NAMESPACE" \
    --userId 'NYc3B876' \
    --body '[{"customAttributes": {"OHI58ANK": {}, "8u6uyq7m": {}, "esYXbZgr": {}}, "qty": 79, "serverCustomAttributes": {"QpfzmzJz": {}, "Zh0zvk28": {}, "jPrRweft": {}}, "slotId": "DHIFy2Th", "slotUsed": 62, "source": "OTHER", "sourceItemId": "NSGDlNVJ", "tags": ["rvuG8gIk", "qWisOvcD", "hoLIvqri"], "type": "Hbip5YrY"}, {"customAttributes": {"89A1mD8l": {}, "W3yXEgsB": {}, "rSo0OGew": {}}, "qty": 86, "serverCustomAttributes": {"llybe4UD": {}, "n1gGyQUm": {}, "CtvVwl5l": {}}, "slotId": "o4XLkdHJ", "slotUsed": 85, "source": "ECOMMERCE", "sourceItemId": "I188EqK4", "tags": ["CJpOIahu", "jUmwR14P", "kPcR1rNz"], "type": "nZ5F9rJd"}, {"customAttributes": {"BQs05OGS": {}, "L39U1Nq7": {}, "Xf5T6tYS": {}}, "qty": 84, "serverCustomAttributes": {"GVMcNbaF": {}, "5yRnvelA": {}, "FYfoZ7QG": {}}, "slotId": "gw6vvMBg", "slotUsed": 0, "source": "ECOMMERCE", "sourceItemId": "zMqs4XJw", "tags": ["XDkT2wga", "NEhsgOTO", "ThBDWqvX"], "type": "Hh5IuJOk"}]' \
    > test.out 2>&1
eval_tap $? 29 'AdminBulkSaveItemToInventory' test.out

#- 30 AdminUpdateUserInventoriesByInventoryCode
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateUserInventoriesByInventoryCode \
    --inventoryConfigurationCode '2eNDkX6Y' \
    --namespace "$AB_NAMESPACE" \
    --userId 'LBlKFPeA' \
    --body '{"incMaxSlots": 85}' \
    > test.out 2>&1
eval_tap $? 30 'AdminUpdateUserInventoriesByInventoryCode' test.out

#- 31 AdminSaveItem
./ng net.accelbyte.sdk.cli.Main inventory adminSaveItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'zVNccfU4' \
    --body '{"customAttributes": {"SIUGTOlJ": {}, "eq07zLlF": {}, "DTgK57P1": {}}, "inventoryConfigurationCode": "OEceTeFg", "qty": 7, "serverCustomAttributes": {"XHkjMH8d": {}, "UvowBubJ": {}, "cAFPXKll": {}}, "slotId": "eWJZ35Rh", "slotUsed": 7, "source": "OTHER", "sourceItemId": "ivi2OJXF", "tags": ["DtfqM2xY", "EQjTDEpq", "YADACgEW"], "type": "sK5ppuoA"}' \
    > test.out 2>&1
eval_tap $? 31 'AdminSaveItem' test.out

#- 32 AdminBulkSaveItem
./ng net.accelbyte.sdk.cli.Main inventory adminBulkSaveItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'wOBJQeoT' \
    --body '[{"customAttributes": {"GKuSI2Wl": {}, "hZB9lESy": {}, "ZnrF0aOA": {}}, "inventoryConfigurationCode": "mLinz5J0", "qty": 41, "serverCustomAttributes": {"xWE8sdI6": {}, "1niINvrd": {}, "RYKU4MXa": {}}, "slotId": "JKbyz4nm", "slotUsed": 91, "source": "OTHER", "sourceItemId": "0M9saEtN", "tags": ["EZ7mSClw", "qsnkxAYf", "o5SacyY8"], "type": "2g6R5CnK"}, {"customAttributes": {"45t4OUVz": {}, "7gGTAEu9": {}, "1KH1ikCR": {}}, "inventoryConfigurationCode": "IDtm6p6P", "qty": 48, "serverCustomAttributes": {"CwqXvII5": {}, "DLAGBxiR": {}, "ZifasgJg": {}}, "slotId": "e9avmo8E", "slotUsed": 92, "source": "OTHER", "sourceItemId": "vpz5MC8x", "tags": ["up9lNY6H", "KWJYMvW4", "mLEQ0ZTd"], "type": "PeccHigB"}, {"customAttributes": {"JJvOvCPr": {}, "ArvGC5o5": {}, "Xx6JsuUi": {}}, "inventoryConfigurationCode": "U5Uay3i2", "qty": 15, "serverCustomAttributes": {"8zvJCOvt": {}, "Z4mFEQ6n": {}, "kecAZFN9": {}}, "slotId": "bJQgoagE", "slotUsed": 21, "source": "OTHER", "sourceItemId": "NN2GYgjo", "tags": ["V70q3V3q", "UMDh5c8Z", "qLpNJJdR"], "type": "T6LrsvUd"}]' \
    > test.out 2>&1
eval_tap $? 32 'AdminBulkSaveItem' test.out

#- 33 AdminSyncUserEntitlements
./ng net.accelbyte.sdk.cli.Main inventory adminSyncUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'U2GhxocX' \
    > test.out 2>&1
eval_tap $? 33 'AdminSyncUserEntitlements' test.out

#- 34 AdminPurchasable
./ng net.accelbyte.sdk.cli.Main inventory adminPurchasable \
    --namespace "$AB_NAMESPACE" \
    --userId '8eKuTKDv' \
    --body '{"entitlementType": "Bwz4BpnY", "inventoryConfig": {"slotUsed": 99}, "itemId": "RrFHlI0N", "itemType": "3bJNNUwT", "items": [{"bundledQty": 67, "entitlementType": "nimf7HES", "inventoryConfig": {"slotUsed": 69}, "itemId": "HTpATsvY", "itemType": "NBBoai4F", "sku": "PriRTKif", "stackable": false, "useCount": 88}, {"bundledQty": 91, "entitlementType": "JaGkkPea", "inventoryConfig": {"slotUsed": 79}, "itemId": "rWDoN8IG", "itemType": "CzR9VX01", "sku": "dQe6bq0s", "stackable": true, "useCount": 33}, {"bundledQty": 38, "entitlementType": "1eSfpNiX", "inventoryConfig": {"slotUsed": 60}, "itemId": "WuKL767Z", "itemType": "GVzEgj5K", "sku": "sRJZ5mdk", "stackable": true, "useCount": 23}], "quantity": 32, "sku": "yvMTsMjE", "stackable": false, "useCount": 34}' \
    > test.out 2>&1
eval_tap $? 34 'AdminPurchasable' test.out

#- 35 PublicListInventoryConfigurations
./ng net.accelbyte.sdk.cli.Main inventory publicListInventoryConfigurations \
    --namespace "$AB_NAMESPACE" \
    --code 'IxM62T6f' \
    --limit '28' \
    --offset '100' \
    --sortBy 'code:desc' \
    > test.out 2>&1
eval_tap $? 35 'PublicListInventoryConfigurations' test.out

#- 36 PublicListItemTypes
./ng net.accelbyte.sdk.cli.Main inventory publicListItemTypes \
    --namespace "$AB_NAMESPACE" \
    --limit '27' \
    --offset '77' \
    --sortBy 'name:asc' \
    > test.out 2>&1
eval_tap $? 36 'PublicListItemTypes' test.out

#- 37 PublicListTags
./ng net.accelbyte.sdk.cli.Main inventory publicListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '100' \
    --offset '33' \
    --sortBy 'name' \
    > test.out 2>&1
eval_tap $? 37 'PublicListTags' test.out

#- 38 PublicListInventories
./ng net.accelbyte.sdk.cli.Main inventory publicListInventories \
    --namespace "$AB_NAMESPACE" \
    --inventoryConfigurationCode 'IC4uDmbh' \
    --limit '69' \
    --offset '87' \
    --sortBy 'createdAt' \
    > test.out 2>&1
eval_tap $? 38 'PublicListInventories' test.out

#- 39 PublicConsumeMyItem
./ng net.accelbyte.sdk.cli.Main inventory publicConsumeMyItem \
    --inventoryId 'RDIlivwp' \
    --namespace "$AB_NAMESPACE" \
    --body '{"options": ["oYhqOBSX", "ubWZSGrO", "ebDh3WeP"], "qty": 60, "slotId": "GkmUSzER", "sourceItemId": "PFH8f0M5"}' \
    > test.out 2>&1
eval_tap $? 39 'PublicConsumeMyItem' test.out

#- 40 PublicListItems
./ng net.accelbyte.sdk.cli.Main inventory publicListItems \
    --inventoryId 'pW3CrKDn' \
    --namespace "$AB_NAMESPACE" \
    --limit '100' \
    --offset '65' \
    --sortBy 'createdAt' \
    --sourceItemId '3XBeKkSc' \
    --tags 'HDWtnS0r' \
    > test.out 2>&1
eval_tap $? 40 'PublicListItems' test.out

#- 41 PublicBulkUpdateMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicBulkUpdateMyItems \
    --inventoryId '2WAUCtpM' \
    --namespace "$AB_NAMESPACE" \
    --body '[{"customAttributes": {"LXgMFeAg": {}, "y1dc9PKh": {}, "JvA4zjn9": {}}, "slotId": "L9ziSLn9", "sourceItemId": "Kc2x8n3e", "tags": ["KSSWF4Mj", "inm8kHwv", "ymAvuDVk"]}, {"customAttributes": {"Y7xhzwaN": {}, "ilJvv7tH": {}, "E3i2LYSR": {}}, "slotId": "e38MdEdl", "sourceItemId": "ArV3MavZ", "tags": ["dcS1smpE", "WNlfFeYW", "3Kv1YFVb"]}, {"customAttributes": {"QhrR1zKj": {}, "v11L5b1c": {}, "1Qx036bm": {}}, "slotId": "POOLzjFd", "sourceItemId": "2iyORTbj", "tags": ["exyaT5Sp", "BiX0hisg", "WLOo3MVM"]}]' \
    > test.out 2>&1
eval_tap $? 41 'PublicBulkUpdateMyItems' test.out

#- 42 PublicBulkRemoveMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicBulkRemoveMyItems \
    --inventoryId 'Ky5y2mQ4' \
    --namespace "$AB_NAMESPACE" \
    --body '[{"slotId": "VpAozDTR", "sourceItemId": "sWJ5JG14"}, {"slotId": "5L9gCPE7", "sourceItemId": "RH2obqQP"}, {"slotId": "J6aysJ2b", "sourceItemId": "T2prNHQa"}]' \
    > test.out 2>&1
eval_tap $? 42 'PublicBulkRemoveMyItems' test.out

#- 43 PublicMoveMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicMoveMyItems \
    --inventoryId 'L0TfeEBr' \
    --namespace "$AB_NAMESPACE" \
    --body '{"items": [{"qty": 54, "slotId": "IL1xSitL", "sourceItemId": "H0d97iuP"}, {"qty": 95, "slotId": "rkPyDguV", "sourceItemId": "u3IhxorL"}, {"qty": 6, "slotId": "x6nA6dsN", "sourceItemId": "6KHm60xL"}], "srcInventoryId": "prjIkzx7"}' \
    > test.out 2>&1
eval_tap $? 43 'PublicMoveMyItems' test.out

#- 44 PublicGetItem
./ng net.accelbyte.sdk.cli.Main inventory publicGetItem \
    --inventoryId 'iN8Piwv8' \
    --namespace "$AB_NAMESPACE" \
    --slotId 'Ss8uUmDa' \
    --sourceItemId 'C3rmCaUF' \
    > test.out 2>&1
eval_tap $? 44 'PublicGetItem' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
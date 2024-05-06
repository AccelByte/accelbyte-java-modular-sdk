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
echo "1..41"

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
    --body '{"message": "OHW8VVsR", "operations": [{"consumeItems": [{"inventoryId": "Gw1a51uw", "qty": 75, "slotId": "ifmsWOId", "sourceItemId": "Wc6RwHCO"}, {"inventoryId": "HRn5QtK2", "qty": 7, "slotId": "ksSw4Coo", "sourceItemId": "DU6mkIVE"}, {"inventoryId": "csFohxgJ", "qty": 33, "slotId": "o3JY1gND", "sourceItemId": "dUVXYS7J"}], "createItems": [{"customAttributes": {"JUghWDbL": {}, "zUWpe8hE": {}, "fMGKQqnk": {}}, "inventoryConfigurationCode": "3OW6P1ZR", "inventoryId": "DtPmiEcP", "qty": 61, "serverCustomAttributes": {"ITiUwHVp": {}, "WUmh7JhB": {}, "rWS4HLhn": {}}, "slotId": "J1iOr49V", "slotUsed": 8, "sourceItemId": "wGxhJE1b", "tags": ["kAT4L2cz", "VdAYwnp4", "z7JViPRd"], "toSpecificInventory": false, "type": "fDQ1hXxY"}, {"customAttributes": {"9ILh7KRo": {}, "TfTmEYth": {}, "6c171ITV": {}}, "inventoryConfigurationCode": "o5KM7JP2", "inventoryId": "Y7KCMsDm", "qty": 43, "serverCustomAttributes": {"pFv1wXQo": {}, "H4MZQyIr": {}, "H1hZwIlE": {}}, "slotId": "Dcj1wu7c", "slotUsed": 37, "sourceItemId": "MGEIKsIM", "tags": ["i0cIyoIn", "kS4JpItS", "oucB9cHI"], "toSpecificInventory": false, "type": "0qdBo7qe"}, {"customAttributes": {"kzSrV0IC": {}, "7J22pTuC": {}, "omYSsPpg": {}}, "inventoryConfigurationCode": "DaHKp2Z0", "inventoryId": "96teJyJj", "qty": 40, "serverCustomAttributes": {"CjKhjLdo": {}, "GriBWwGC": {}, "6g6LqHHN": {}}, "slotId": "RNhCSDob", "slotUsed": 82, "sourceItemId": "KrdGnetE", "tags": ["c04uA1CA", "iuZfCj5G", "g7U1lCwb"], "toSpecificInventory": true, "type": "2GeFIz08"}], "removeItems": [{"inventoryId": "gS0OoFWQ", "slotId": "XcwgL8f0", "sourceItemId": "1kYNWiO2"}, {"inventoryId": "w2BoHyms", "slotId": "g6nhCb7w", "sourceItemId": "EgKEJUDF"}, {"inventoryId": "XWGEkJS2", "slotId": "jIGH8xyn", "sourceItemId": "2ioYinp7"}], "targetUserId": "2jpcx82p", "updateItems": [{"customAttributes": {"6NdIJmCL": {}, "uGojXKEF": {}, "F9Qkc3Eo": {}}, "inventoryId": "ObSGUAH9", "serverCustomAttributes": {"NUvm0bld": {}, "fFTUKb8X": {}, "QzGxrzBN": {}}, "slotId": "FbBu3oTl", "sourceItemId": "L8FpmsR8", "tags": ["JWaRAPhd", "7ReNvcot", "A4B4adRS"], "type": "CcCq7Sn7"}, {"customAttributes": {"qJxC9xxk": {}, "JeMF7s1d": {}, "grCrtGHK": {}}, "inventoryId": "b8ijyRsB", "serverCustomAttributes": {"W2a2mkf1": {}, "bxPtQ756": {}, "j5xJAOiq": {}}, "slotId": "mrvzRH0e", "sourceItemId": "tL29gT6j", "tags": ["t9YKeVkC", "oUuPvH2C", "4zlA88za"], "type": "tGBlGWJX"}, {"customAttributes": {"1q4caHkt": {}, "ALxGQfJU": {}, "sOYqvQXT": {}}, "inventoryId": "Wz5JZq1n", "serverCustomAttributes": {"hypBogAz": {}, "2biFrOTv": {}, "Hq1qpg7k": {}}, "slotId": "RrQKJGzm", "sourceItemId": "gnJdzi0G", "tags": ["OJZBofN8", "TWqvsgnR", "ESTjOeb0"], "type": "nCW5N0zA"}]}, {"consumeItems": [{"inventoryId": "ods4BL2f", "qty": 21, "slotId": "UGfT067c", "sourceItemId": "NDTVCY4y"}, {"inventoryId": "0iPjCTI8", "qty": 32, "slotId": "3eWk601a", "sourceItemId": "Ko1rkp2i"}, {"inventoryId": "wlgJfC2H", "qty": 55, "slotId": "j0u2KkX3", "sourceItemId": "hHc4htMi"}], "createItems": [{"customAttributes": {"o46giE24": {}, "hqhfHth7": {}, "dITCMEWR": {}}, "inventoryConfigurationCode": "3243WmMG", "inventoryId": "OxMRDjh7", "qty": 84, "serverCustomAttributes": {"r5z3wNMQ": {}, "yHKgMXTg": {}, "yVCnwAUp": {}}, "slotId": "7W60QEeY", "slotUsed": 11, "sourceItemId": "9xxnTktX", "tags": ["Z7ypm8m0", "fNU8EvJp", "On5M9eeO"], "toSpecificInventory": false, "type": "VrXa6C5T"}, {"customAttributes": {"YXmFRpMy": {}, "Nc9wmrVW": {}, "P9K9KPSt": {}}, "inventoryConfigurationCode": "Bsn9IfXY", "inventoryId": "9UJiArDR", "qty": 13, "serverCustomAttributes": {"MB5H1lCK": {}, "3IEN7I1h": {}, "1s5jzT4e": {}}, "slotId": "QhB2jUQJ", "slotUsed": 78, "sourceItemId": "fdfM36wu", "tags": ["bllaHZWW", "tuFCtFTD", "Fz8wzItN"], "toSpecificInventory": false, "type": "aGrsjlc8"}, {"customAttributes": {"82hBlaW4": {}, "D6SX1f4F": {}, "mXj37Nov": {}}, "inventoryConfigurationCode": "KmqgmlJs", "inventoryId": "7QYluFkl", "qty": 38, "serverCustomAttributes": {"llxhkgcc": {}, "uSzKoFUO": {}, "e2mxm5nz": {}}, "slotId": "OS7O5tf5", "slotUsed": 66, "sourceItemId": "dPx9sp66", "tags": ["SfzoEI8d", "d4osbHbz", "PtM8SsVK"], "toSpecificInventory": false, "type": "K1yGR2Gy"}], "removeItems": [{"inventoryId": "xKHzD1sP", "slotId": "mV9ikJ5o", "sourceItemId": "4WUpWd8y"}, {"inventoryId": "6SbAuIf5", "slotId": "kRXtz3Zk", "sourceItemId": "MN55ePw8"}, {"inventoryId": "dUQ7WACr", "slotId": "rix7JRC9", "sourceItemId": "KNKuWwJ3"}], "targetUserId": "k6dy6SzG", "updateItems": [{"customAttributes": {"dfyaC2jS": {}, "T6livTra": {}, "vnDR9Fal": {}}, "inventoryId": "ULwWcGmd", "serverCustomAttributes": {"dWpMLy6H": {}, "D7olHINu": {}, "ZLfqdRIn": {}}, "slotId": "cUOi65Mt", "sourceItemId": "3xh0BhOP", "tags": ["64JwstOV", "OBFTsXTb", "vcVoMOmC"], "type": "zmx54l9w"}, {"customAttributes": {"Qy9aHfmS": {}, "vWiO5rPT": {}, "56XDNoAN": {}}, "inventoryId": "v7J7f1fJ", "serverCustomAttributes": {"qez8Ls0l": {}, "zjYab6KT": {}, "qbYWlYFd": {}}, "slotId": "fTnF7X4t", "sourceItemId": "ND5ILF4P", "tags": ["pr1JL0XK", "qaOT1JmQ", "F54baJPC"], "type": "TPUgKu6X"}, {"customAttributes": {"DXXsC0Uu": {}, "iGCuyBy8": {}, "0MMOIITz": {}}, "inventoryId": "1WbY0alL", "serverCustomAttributes": {"lIQLRfms": {}, "xkjoO0cV": {}, "Tx0huJyh": {}}, "slotId": "lVRl4DEf", "sourceItemId": "YvBIavKU", "tags": ["mKLrIizx", "HIddHz2P", "lhmQ9aGm"], "type": "C7zT6aHe"}]}, {"consumeItems": [{"inventoryId": "5C4oy4ol", "qty": 88, "slotId": "e7ujFbHp", "sourceItemId": "9dJ7dJBB"}, {"inventoryId": "97lQW86d", "qty": 15, "slotId": "GdYbHfRS", "sourceItemId": "t9aaJ6xM"}, {"inventoryId": "fhT7uk4j", "qty": 51, "slotId": "XypUhDGe", "sourceItemId": "F1Nobr0K"}], "createItems": [{"customAttributes": {"LMg6r3sg": {}, "PDhpYc6e": {}, "8rVTYETX": {}}, "inventoryConfigurationCode": "vTToZx43", "inventoryId": "bWixIdNf", "qty": 51, "serverCustomAttributes": {"nJKTrwTH": {}, "SORgzbHM": {}, "T8ZW9MT0": {}}, "slotId": "HiUtHLmq", "slotUsed": 95, "sourceItemId": "SMbFJorG", "tags": ["xo9poAd2", "xDtC30pR", "Nre7Q7PS"], "toSpecificInventory": true, "type": "MHN2zQhv"}, {"customAttributes": {"3I1Y3R2a": {}, "f9g4Qpen": {}, "xygAetUF": {}}, "inventoryConfigurationCode": "vTjOs4RT", "inventoryId": "HLDNAQhr", "qty": 74, "serverCustomAttributes": {"Bjt138Hc": {}, "5VXfpQpB": {}, "3pX0kkMK": {}}, "slotId": "KlraYibr", "slotUsed": 65, "sourceItemId": "pTOaAMQy", "tags": ["De6G57ZK", "CJnyzVPJ", "xKaRVNkf"], "toSpecificInventory": true, "type": "LcOZi349"}, {"customAttributes": {"I14815ZA": {}, "zFRQEP9y": {}, "AnJzecug": {}}, "inventoryConfigurationCode": "oNrRKAvj", "inventoryId": "l0MjTEvZ", "qty": 85, "serverCustomAttributes": {"hGw8YHlA": {}, "sxQoFeFo": {}, "ZlzJy2Fj": {}}, "slotId": "EcSG36Aj", "slotUsed": 12, "sourceItemId": "jnRspjwu", "tags": ["uhvbpLTq", "7cJqjSjy", "AAqzEjQY"], "toSpecificInventory": true, "type": "uXuSDXzu"}], "removeItems": [{"inventoryId": "MPagEI9H", "slotId": "rh1Bzqnz", "sourceItemId": "VgTa7d9l"}, {"inventoryId": "fLT5ed38", "slotId": "5pL4BLE5", "sourceItemId": "2bywpQks"}, {"inventoryId": "pjygbnXL", "slotId": "2TRWo2S3", "sourceItemId": "gEn3K3aP"}], "targetUserId": "y1qjDZMB", "updateItems": [{"customAttributes": {"8N58N3vr": {}, "8NQm5Dmn": {}, "zYkgQ3C1": {}}, "inventoryId": "j6X9XDb1", "serverCustomAttributes": {"EUmX815S": {}, "fMPfWli9": {}, "K5SaVyle": {}}, "slotId": "5nej3LME", "sourceItemId": "1rRrvNgz", "tags": ["NrSxe74L", "psTfo2CI", "1EpOewyH"], "type": "arimgiVC"}, {"customAttributes": {"pg0tAM93": {}, "MAEhY9db": {}, "SotXILxq": {}}, "inventoryId": "MHw6MUS0", "serverCustomAttributes": {"9HpEzwYS": {}, "O38SBe7v": {}, "MS1dN3QA": {}}, "slotId": "zGZym2io", "sourceItemId": "3gT30sbN", "tags": ["uNRbBH6n", "8LOIejUm", "XKvzPvLp"], "type": "YIke6c2Y"}, {"customAttributes": {"QqZvimEh": {}, "RERJ6sQS": {}, "75WchIbd": {}}, "inventoryId": "UREHXRPd", "serverCustomAttributes": {"K72w6TCL": {}, "j99F1NZP": {}, "yrQmP4Tq": {}}, "slotId": "D8tX3Wez", "sourceItemId": "uRLRsPp1", "tags": ["1TjjDSgs", "U4q8pOVw", "c8mWoA9k"], "type": "s7QizPqD"}]}], "requestId": "C1y4sRVv"}' \
    > test.out 2>&1
eval_tap $? 2 'AdminCreateChainingOperations' test.out

#- 3 AdminListIntegrationConfigurations
./ng net.accelbyte.sdk.cli.Main inventory adminListIntegrationConfigurations \
    --namespace "$AB_NAMESPACE" \
    --limit '30' \
    --offset '59' \
    --sortBy 'createdAt' \
    > test.out 2>&1
eval_tap $? 3 'AdminListIntegrationConfigurations' test.out

#- 4 AdminCreateIntegrationConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminCreateIntegrationConfiguration \
    --namespace "$AB_NAMESPACE" \
    --body '{"mapItemType": ["cGHZzC2A", "nE1qDI3y", "A2q8SR0C"], "serviceName": "FI9tTqkB", "targetInventoryCode": "CeUo6LyN"}' \
    > test.out 2>&1
eval_tap $? 4 'AdminCreateIntegrationConfiguration' test.out

#- 5 AdminUpdateIntegrationConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateIntegrationConfiguration \
    --integrationConfigurationId 'fTAisoxR' \
    --namespace "$AB_NAMESPACE" \
    --body '{"mapItemType": ["y74Hw57s", "UED1GrPB", "0emBAusw"], "serviceName": "aJ4ouxPt", "targetInventoryCode": "4CuYp2wD"}' \
    > test.out 2>&1
eval_tap $? 5 'AdminUpdateIntegrationConfiguration' test.out

#- 6 AdminUpdateStatusIntegrationConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateStatusIntegrationConfiguration \
    --integrationConfigurationId 'cxGFPPgD' \
    --namespace "$AB_NAMESPACE" \
    --body '{"status": "INIT"}' \
    > test.out 2>&1
eval_tap $? 6 'AdminUpdateStatusIntegrationConfiguration' test.out

#- 7 AdminListInventories
./ng net.accelbyte.sdk.cli.Main inventory adminListInventories \
    --namespace "$AB_NAMESPACE" \
    --inventoryConfigurationCode 'CdrSCiWY' \
    --limit '8' \
    --offset '18' \
    --sortBy 'inventoryConfigurationCode:asc' \
    --userId '1J9MTORq' \
    > test.out 2>&1
eval_tap $? 7 'AdminListInventories' test.out

#- 8 AdminCreateInventory
./ng net.accelbyte.sdk.cli.Main inventory adminCreateInventory \
    --namespace "$AB_NAMESPACE" \
    --body '{"inventoryConfigurationCode": "5QW0X7yS", "userId": "b3Vygk2A"}' \
    > test.out 2>&1
eval_tap $? 8 'AdminCreateInventory' test.out

#- 9 AdminGetInventory
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventory \
    --inventoryId 'mbMAuzMA' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'AdminGetInventory' test.out

#- 10 AdminUpdateInventory
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateInventory \
    --inventoryId '1z88Clsv' \
    --namespace "$AB_NAMESPACE" \
    --body '{"incMaxSlots": 93}' \
    > test.out 2>&1
eval_tap $? 10 'AdminUpdateInventory' test.out

#- 11 DeleteInventory
./ng net.accelbyte.sdk.cli.Main inventory deleteInventory \
    --inventoryId 'XtWiT0dK' \
    --namespace "$AB_NAMESPACE" \
    --body '{"message": "BrztIO1h"}' \
    > test.out 2>&1
eval_tap $? 11 'DeleteInventory' test.out

#- 12 AdminListItems
./ng net.accelbyte.sdk.cli.Main inventory adminListItems \
    --inventoryId 'E06Hh0gX' \
    --namespace "$AB_NAMESPACE" \
    --limit '84' \
    --offset '65' \
    --qtyGte '11' \
    --sortBy 'updatedAt' \
    --sourceItemId 'pezVpP9d' \
    --tags 'bjtkW6BM' \
    > test.out 2>&1
eval_tap $? 12 'AdminListItems' test.out

#- 13 AdminGetInventoryItem
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventoryItem \
    --inventoryId 'V8hJieOP' \
    --namespace "$AB_NAMESPACE" \
    --slotId 'pdEVD5tl' \
    --sourceItemId 'wkubSA8j' \
    > test.out 2>&1
eval_tap $? 13 'AdminGetInventoryItem' test.out

#- 14 AdminListInventoryConfigurations
./ng net.accelbyte.sdk.cli.Main inventory adminListInventoryConfigurations \
    --namespace "$AB_NAMESPACE" \
    --code 'rpTEftQ8' \
    --limit '72' \
    --offset '55' \
    --sortBy 'createdAt' \
    > test.out 2>&1
eval_tap $? 14 'AdminListInventoryConfigurations' test.out

#- 15 AdminCreateInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminCreateInventoryConfiguration \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "h8XYhf8x", "description": "viedpRDa", "initialMaxSlots": 50, "maxInstancesPerUser": 74, "maxUpgradeSlots": 78, "name": "364zJJEe"}' \
    > test.out 2>&1
eval_tap $? 15 'AdminCreateInventoryConfiguration' test.out

#- 16 AdminGetInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventoryConfiguration \
    --inventoryConfigurationId 'vMU0nxTB' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'AdminGetInventoryConfiguration' test.out

#- 17 AdminUpdateInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateInventoryConfiguration \
    --inventoryConfigurationId '0kxokhu3' \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "5jR0t2Zv", "description": "IIJoP7ou", "initialMaxSlots": 23, "maxInstancesPerUser": 21, "maxUpgradeSlots": 68, "name": "NNeRH29C"}' \
    > test.out 2>&1
eval_tap $? 17 'AdminUpdateInventoryConfiguration' test.out

#- 18 AdminDeleteInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteInventoryConfiguration \
    --inventoryConfigurationId 'exjmNhY2' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminDeleteInventoryConfiguration' test.out

#- 19 AdminListItemTypes
./ng net.accelbyte.sdk.cli.Main inventory adminListItemTypes \
    --namespace "$AB_NAMESPACE" \
    --limit '59' \
    --offset '40' \
    --sortBy 'name' \
    > test.out 2>&1
eval_tap $? 19 'AdminListItemTypes' test.out

#- 20 AdminCreateItemType
./ng net.accelbyte.sdk.cli.Main inventory adminCreateItemType \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "W3QOJt05"}' \
    > test.out 2>&1
eval_tap $? 20 'AdminCreateItemType' test.out

#- 21 AdminDeleteItemType
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteItemType \
    --itemTypeName 'qjddwqb9' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'AdminDeleteItemType' test.out

#- 22 AdminListTags
./ng net.accelbyte.sdk.cli.Main inventory adminListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '12' \
    --offset '88' \
    --owner '3xt1fAGp' \
    --sortBy 'name:asc' \
    > test.out 2>&1
eval_tap $? 22 'AdminListTags' test.out

#- 23 AdminCreateTag
./ng net.accelbyte.sdk.cli.Main inventory adminCreateTag \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "MmfUDCZl", "owner": "SERVER"}' \
    > test.out 2>&1
eval_tap $? 23 'AdminCreateTag' test.out

#- 24 AdminDeleteTag
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteTag \
    --namespace "$AB_NAMESPACE" \
    --tagName 'NR1xcEU6' \
    > test.out 2>&1
eval_tap $? 24 'AdminDeleteTag' test.out

#- 25 AdminConsumeUserItem
./ng net.accelbyte.sdk.cli.Main inventory adminConsumeUserItem \
    --inventoryId 'jpS8y1It' \
    --namespace "$AB_NAMESPACE" \
    --userId 'k5wfi2uz' \
    --body '{"qty": 71, "slotId": "Bk9uzfWO", "sourceItemId": "8XHtUjwQ"}' \
    > test.out 2>&1
eval_tap $? 25 'AdminConsumeUserItem' test.out

#- 26 AdminBulkUpdateMyItems
./ng net.accelbyte.sdk.cli.Main inventory adminBulkUpdateMyItems \
    --inventoryId 'kKNiUTbi' \
    --namespace "$AB_NAMESPACE" \
    --userId 'xCntLtA6' \
    --body '[{"customAttributes": {"Oz5TARqq": {}, "ejIAeaVl": {}, "iVnIREWD": {}}, "serverCustomAttributes": {"ZhTfPoL5": {}, "dDtQNxv7": {}, "vc1gePzI": {}}, "slotId": "hqQnJZq3", "sourceItemId": "4jPa9Hso", "tags": ["kg5t71PQ", "FoDAeymP", "UUTO7REg"], "type": "ZUBWdh6W"}, {"customAttributes": {"ZAx3EC3Q": {}, "NUGRlfJS": {}, "1cbhN15W": {}}, "serverCustomAttributes": {"IdCZDuAw": {}, "wdtdgFBe": {}, "2cRFWxN1": {}}, "slotId": "tBQTBFgu", "sourceItemId": "l5WCEQAQ", "tags": ["pypnOZyz", "l5u2ZrgV", "pbkxZrpe"], "type": "j4AspYmL"}, {"customAttributes": {"k1UOAtfH": {}, "yZGqVfAT": {}, "6t6iYPKW": {}}, "serverCustomAttributes": {"RB9TCN0O": {}, "XDXe6pwh": {}, "FKt1e0YE": {}}, "slotId": "QmjmbJ0Z", "sourceItemId": "6dO5dsBk", "tags": ["SKze8Jq6", "H7qd4MJy", "EgN3BVaF"], "type": "XQZPLYF1"}]' \
    > test.out 2>&1
eval_tap $? 26 'AdminBulkUpdateMyItems' test.out

#- 27 AdminSaveItemToInventory
./ng net.accelbyte.sdk.cli.Main inventory adminSaveItemToInventory \
    --inventoryId 'CJQSEZtl' \
    --namespace "$AB_NAMESPACE" \
    --userId 'DSUROXZA' \
    --body '{"customAttributes": {"MWuqupib": {}, "ZbZxl1Pi": {}, "ay5KM5x3": {}}, "qty": 13, "serverCustomAttributes": {"yVwyFPnd": {}, "QHi2x04v": {}, "tAYLsKYl": {}}, "slotId": "GuH6xiT6", "slotUsed": 46, "source": "OTHER", "sourceItemId": "SXJpSheX", "tags": ["i9S8S8aC", "pcFMXP5L", "yO9tPr4n"], "type": "uhXvygnM"}' \
    > test.out 2>&1
eval_tap $? 27 'AdminSaveItemToInventory' test.out

#- 28 AdminBulkRemoveItems
./ng net.accelbyte.sdk.cli.Main inventory adminBulkRemoveItems \
    --inventoryId 'dEEiUZJU' \
    --namespace "$AB_NAMESPACE" \
    --userId '2fOa2cnn' \
    --body '[{"slotId": "Ejt1GAJx", "sourceItemId": "LFMSoB8n"}, {"slotId": "tv80CLDE", "sourceItemId": "OObJha57"}, {"slotId": "OFP4ohKO", "sourceItemId": "w7vF5Z7r"}]' \
    > test.out 2>&1
eval_tap $? 28 'AdminBulkRemoveItems' test.out

#- 29 AdminSaveItem
./ng net.accelbyte.sdk.cli.Main inventory adminSaveItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'IQoYe30G' \
    --body '{"customAttributes": {"rWoM61PI": {}, "xAEoVrvm": {}, "Dvf91gZq": {}}, "inventoryConfigurationCode": "Xur8XzYe", "qty": 35, "serverCustomAttributes": {"Df2c9fmP": {}, "H3XLLDX3": {}, "TLG2iAJS": {}}, "slotId": "jzF3XU54", "slotUsed": 42, "source": "ECOMMERCE", "sourceItemId": "Orlp1hE7", "tags": ["LIHkMIyK", "jjvc7JeI", "N0qxOxBB"], "type": "mlioUfeW"}' \
    > test.out 2>&1
eval_tap $? 29 'AdminSaveItem' test.out

#- 30 AdminSyncUserEntitlements
./ng net.accelbyte.sdk.cli.Main inventory adminSyncUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'CbnmWaWB' \
    > test.out 2>&1
eval_tap $? 30 'AdminSyncUserEntitlements' test.out

#- 31 AdminPurchasable
./ng net.accelbyte.sdk.cli.Main inventory adminPurchasable \
    --namespace "$AB_NAMESPACE" \
    --userId '6xqdedij' \
    --body '{"entitlementType": "Bq6qWy9R", "inventoryConfig": {"slotUsed": 90}, "itemId": "k2tc6qvu", "itemType": "aT9Cf24p", "items": [{"bundledQty": 38, "entitlementType": "RgF6Gk0q", "inventoryConfig": {"slotUsed": 14}, "itemId": "M9YB6a5l", "itemType": "PHGIiUlM", "sku": "fJ3R50as", "useCount": 99}, {"bundledQty": 84, "entitlementType": "mVyri4YF", "inventoryConfig": {"slotUsed": 16}, "itemId": "PJsdKnJi", "itemType": "5aL2iVkn", "sku": "ZUpS2fPQ", "useCount": 17}, {"bundledQty": 73, "entitlementType": "MBhaIhKm", "inventoryConfig": {"slotUsed": 44}, "itemId": "ggkmDIK6", "itemType": "LJuXbWe3", "sku": "jycz1J5E", "useCount": 52}], "quantity": 5, "sku": "U5QuECeI", "useCount": 39}' \
    > test.out 2>&1
eval_tap $? 31 'AdminPurchasable' test.out

#- 32 PublicListInventoryConfigurations
./ng net.accelbyte.sdk.cli.Main inventory publicListInventoryConfigurations \
    --namespace "$AB_NAMESPACE" \
    --code 'yQputbrE' \
    --limit '77' \
    --offset '20' \
    --sortBy 'code:asc' \
    > test.out 2>&1
eval_tap $? 32 'PublicListInventoryConfigurations' test.out

#- 33 PublicListItemTypes
./ng net.accelbyte.sdk.cli.Main inventory publicListItemTypes \
    --namespace "$AB_NAMESPACE" \
    --limit '78' \
    --offset '50' \
    --sortBy 'createdAt:asc' \
    > test.out 2>&1
eval_tap $? 33 'PublicListItemTypes' test.out

#- 34 PublicListTags
./ng net.accelbyte.sdk.cli.Main inventory publicListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '88' \
    --offset '38' \
    --sortBy 'createdAt:desc' \
    > test.out 2>&1
eval_tap $? 34 'PublicListTags' test.out

#- 35 PublicListInventories
./ng net.accelbyte.sdk.cli.Main inventory publicListInventories \
    --namespace "$AB_NAMESPACE" \
    --inventoryConfigurationCode 'Vgc3c0Dn' \
    --limit '58' \
    --offset '95' \
    --sortBy 'createdAt' \
    > test.out 2>&1
eval_tap $? 35 'PublicListInventories' test.out

#- 36 PublicConsumeMyItem
./ng net.accelbyte.sdk.cli.Main inventory publicConsumeMyItem \
    --inventoryId 'TrAYRCRZ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"qty": 7, "slotId": "VZi7OsM3", "sourceItemId": "KF0aWCyj"}' \
    > test.out 2>&1
eval_tap $? 36 'PublicConsumeMyItem' test.out

#- 37 PublicListItems
./ng net.accelbyte.sdk.cli.Main inventory publicListItems \
    --inventoryId '5kYnjJDi' \
    --namespace "$AB_NAMESPACE" \
    --limit '38' \
    --offset '17' \
    --qtyGte '94' \
    --sortBy 'qty' \
    --sourceItemId '5aJUezyQ' \
    --tags 'AheX2Hhw' \
    > test.out 2>&1
eval_tap $? 37 'PublicListItems' test.out

#- 38 PublicBulkUpdateMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicBulkUpdateMyItems \
    --inventoryId 'BunLJz7s' \
    --namespace "$AB_NAMESPACE" \
    --body '[{"customAttributes": {"8ifuwZK6": {}, "oPQ2Zm0z": {}, "LvfWlwsa": {}}, "slotId": "rnlIZ7Zc", "sourceItemId": "ykmYq9dV", "tags": ["VEUEYYHS", "jd1CIg4R", "7jGq7Iu1"]}, {"customAttributes": {"8F4eafm9": {}, "fFZkhD4S": {}, "rSZhYklw": {}}, "slotId": "Wt3a4QCT", "sourceItemId": "aOa8rp1C", "tags": ["gDH2jT6q", "5pSJxr1m", "SjnkkuCX"]}, {"customAttributes": {"VwqtGrbH": {}, "erGhFGPS": {}, "JtAClZbc": {}}, "slotId": "ely6dFoe", "sourceItemId": "JgMVg0xP", "tags": ["eVPK1tqQ", "HIy8dbaC", "QO3D0nHh"]}]' \
    > test.out 2>&1
eval_tap $? 38 'PublicBulkUpdateMyItems' test.out

#- 39 PublicBulkRemoveMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicBulkRemoveMyItems \
    --inventoryId 'bOwPJQdV' \
    --namespace "$AB_NAMESPACE" \
    --body '[{"slotId": "5uojISrL", "sourceItemId": "9AldoCze"}, {"slotId": "AFO4FJgf", "sourceItemId": "0sLcaoPD"}, {"slotId": "xNsEfPvo", "sourceItemId": "UbSHv8dr"}]' \
    > test.out 2>&1
eval_tap $? 39 'PublicBulkRemoveMyItems' test.out

#- 40 PublicMoveMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicMoveMyItems \
    --inventoryId 'MjJAyGvh' \
    --namespace "$AB_NAMESPACE" \
    --body '{"items": [{"qty": 98, "slotId": "XmQvok1W", "sourceItemId": "CmwWF0MR"}, {"qty": 26, "slotId": "Ie9XumXj", "sourceItemId": "FioehzEm"}, {"qty": 49, "slotId": "Eamiqzyr", "sourceItemId": "wxMkjYXg"}], "srcInventoryId": "bN4aF3di"}' \
    > test.out 2>&1
eval_tap $? 40 'PublicMoveMyItems' test.out

#- 41 PublicGetItem
./ng net.accelbyte.sdk.cli.Main inventory publicGetItem \
    --inventoryId 'KsDVNrGM' \
    --namespace "$AB_NAMESPACE" \
    --slotId 'isQjSvhF' \
    --sourceItemId '0NUwA6CG' \
    > test.out 2>&1
eval_tap $? 41 'PublicGetItem' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
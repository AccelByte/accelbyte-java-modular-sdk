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
    --body '{"message": "ZAiJyl2F", "operations": [{"consumeItems": [{"inventoryId": "wReSMXsC", "qty": 23, "slotId": "rV20k3VD", "sourceItemId": "z0Hdoyf6"}, {"inventoryId": "dCOLokck", "qty": 37, "slotId": "xXAcv6W4", "sourceItemId": "ptKYcNfZ"}, {"inventoryId": "iTsFHsh6", "qty": 63, "slotId": "pIzq4RDf", "sourceItemId": "J3ttbaM5"}], "createItems": [{"customAttributes": {"NomVaG6E": {}, "1NcrojUW": {}, "kZYRQH9K": {}}, "inventoryConfigurationCode": "XEAeyve1", "inventoryId": "fO2Rieve", "qty": 64, "serverCustomAttributes": {"6zRnBs58": {}, "wLqNLkRK": {}, "IFQvUNrg": {}}, "slotId": "DEaijQ5K", "slotUsed": 84, "sourceItemId": "ewJTvWxK", "tags": ["bH1zsAtw", "InazNzxR", "FuXBlNCq"], "toSpecificInventory": true, "type": "CCok6zni"}, {"customAttributes": {"8pZwkjHl": {}, "LbEKehYR": {}, "irmJrL86": {}}, "inventoryConfigurationCode": "ei7QXoMY", "inventoryId": "3XyDwbiQ", "qty": 21, "serverCustomAttributes": {"BRlk2k9h": {}, "ZhVQs0UI": {}, "WULu1fjH": {}}, "slotId": "rm5ygLSv", "slotUsed": 24, "sourceItemId": "7ODTZXug", "tags": ["bzNKKLms", "dEBPXCuE", "3WDQk413"], "toSpecificInventory": true, "type": "W0liRGb2"}, {"customAttributes": {"KsOotX2C": {}, "OAKysKrP": {}, "atmzYAhi": {}}, "inventoryConfigurationCode": "rSyPhula", "inventoryId": "rCyTAL1z", "qty": 11, "serverCustomAttributes": {"8WldEg01": {}, "DjWMNvzF": {}, "u5VZeCcG": {}}, "slotId": "99w8JPEK", "slotUsed": 6, "sourceItemId": "f8LrWJlG", "tags": ["AdoMGEid", "7zSjEREC", "nRM4bBpg"], "toSpecificInventory": false, "type": "2n4ikOjr"}], "removeItems": [{"inventoryId": "DfJ97oz2", "slotId": "WkqgW5to", "sourceItemId": "NbqIdP6h"}, {"inventoryId": "7iuWcROs", "slotId": "C8sl6lxy", "sourceItemId": "iY93u3LW"}, {"inventoryId": "BzIlteXS", "slotId": "mzyHGY0J", "sourceItemId": "fj1jn0LT"}], "targetUserId": "EI8zwiWY", "updateItems": [{"customAttributes": {"a85M8pdJ": {}, "9C8RnXhv": {}, "M2KDsDr4": {}}, "inventoryId": "MfvhefHR", "serverCustomAttributes": {"b6otphLg": {}, "R1zeGdHI": {}, "n9Eipa00": {}}, "slotId": "MBFTAuZR", "sourceItemId": "VMzLZwAh", "tags": ["ZP3WLwph", "3gHIUzfu", "JLbbBjn4"], "type": "HDqHR2TD"}, {"customAttributes": {"oZYdIP7f": {}, "FjFkaGED": {}, "Vb3Q8MZN": {}}, "inventoryId": "5NueLCsa", "serverCustomAttributes": {"jWTMMVjl": {}, "KXQmESVJ": {}, "063rFhGn": {}}, "slotId": "uD8X6MD8", "sourceItemId": "E1df6zir", "tags": ["Fr45EB4z", "0idxJHiB", "aGyBQLmd"], "type": "VcjHmUA6"}, {"customAttributes": {"OZjLqmB9": {}, "nro73eLq": {}, "zEEzigjN": {}}, "inventoryId": "hQU9gesF", "serverCustomAttributes": {"wk8MFMMI": {}, "GVIdziRG": {}, "M4USj9dS": {}}, "slotId": "x9dyuo6e", "sourceItemId": "jEOpX4QY", "tags": ["LAzTcyIG", "37bfCwFb", "SCucYtnc"], "type": "XwHFsint"}]}, {"consumeItems": [{"inventoryId": "7OPAmABh", "qty": 66, "slotId": "4yM8DlYs", "sourceItemId": "EWxOY56X"}, {"inventoryId": "XoT2Jxvh", "qty": 77, "slotId": "eOO7g8zx", "sourceItemId": "tkDtLtM6"}, {"inventoryId": "zbpIAitq", "qty": 84, "slotId": "H46mY4sg", "sourceItemId": "Gnhv5Mlf"}], "createItems": [{"customAttributes": {"VKr77GkB": {}, "JmhQaywt": {}, "AdReJWij": {}}, "inventoryConfigurationCode": "ZnB38zfJ", "inventoryId": "gSuGXPun", "qty": 58, "serverCustomAttributes": {"EYgNVPeF": {}, "QZ7kNyLa": {}, "3WHnuvV8": {}}, "slotId": "L1WikmmX", "slotUsed": 89, "sourceItemId": "t2oQdQSz", "tags": ["soqMXaZp", "0R2wVTt8", "MYFrW0w4"], "toSpecificInventory": true, "type": "zOZzuwS4"}, {"customAttributes": {"RSco51pZ": {}, "AFOaPU4Q": {}, "ctXnwAhE": {}}, "inventoryConfigurationCode": "5EyhtM6m", "inventoryId": "4kMeioZs", "qty": 2, "serverCustomAttributes": {"yqwME39i": {}, "Ou0aQr6u": {}, "OLdYT5gC": {}}, "slotId": "WX5dKTFU", "slotUsed": 76, "sourceItemId": "B5B2f1CE", "tags": ["zZpjwPWW", "cWckrSX4", "kCWvKBGd"], "toSpecificInventory": true, "type": "JxrKZd24"}, {"customAttributes": {"5sR6huVN": {}, "XutgVsvm": {}, "cTQtlgGk": {}}, "inventoryConfigurationCode": "e9hCXMm9", "inventoryId": "hXga64hL", "qty": 11, "serverCustomAttributes": {"3quXKC4t": {}, "zEGAWTPH": {}, "QpqbKRfD": {}}, "slotId": "96prDBde", "slotUsed": 80, "sourceItemId": "y1MZhsIY", "tags": ["jckSo6hT", "OT5v4Qex", "eeLvI7Ov"], "toSpecificInventory": false, "type": "Ro3F5Reo"}], "removeItems": [{"inventoryId": "tFveRHep", "slotId": "DC5TB1RL", "sourceItemId": "cqoyoXMh"}, {"inventoryId": "cMUkzfLT", "slotId": "jVnBS0NP", "sourceItemId": "ql6aFpmP"}, {"inventoryId": "P6tLBbuK", "slotId": "BsTdFOoI", "sourceItemId": "TUMqqWUA"}], "targetUserId": "WQwgEUuw", "updateItems": [{"customAttributes": {"I9K17SM2": {}, "lXMrkMHH": {}, "hWQaxpKc": {}}, "inventoryId": "PeIL8rjT", "serverCustomAttributes": {"KZjIiI5B": {}, "FKZetgk4": {}, "lVWkomws": {}}, "slotId": "NGPZAw5Z", "sourceItemId": "WKJu1JzB", "tags": ["OKwUd7hn", "VsHrYce5", "w34fJqEf"], "type": "4aqlZDv2"}, {"customAttributes": {"LngKe2id": {}, "oloEeLag": {}, "AQUVqsQS": {}}, "inventoryId": "Ngz1I6oQ", "serverCustomAttributes": {"lHfdcMmJ": {}, "gXInXu7g": {}, "kVQma8EY": {}}, "slotId": "K4pVECvx", "sourceItemId": "Cd7Z2raT", "tags": ["K4rQmOgA", "Xh0h1S3C", "91kGQUEd"], "type": "KZiIpoKM"}, {"customAttributes": {"KZ4C8pUW": {}, "u1s5SoBJ": {}, "DWvSo35o": {}}, "inventoryId": "mVq1Ug4G", "serverCustomAttributes": {"ygI2SATd": {}, "A7cDZeZ0": {}, "vx4OGvFE": {}}, "slotId": "t01Ecl0h", "sourceItemId": "Wsk4a6RW", "tags": ["7P02qJqG", "TtJIpxvV", "Hkq65i1h"], "type": "CxJDMYVQ"}]}, {"consumeItems": [{"inventoryId": "X451Opt8", "qty": 69, "slotId": "BEeSrhFm", "sourceItemId": "HKPPmfln"}, {"inventoryId": "CxhTzeVw", "qty": 77, "slotId": "PrgdSLwd", "sourceItemId": "8cQh6qq4"}, {"inventoryId": "XZJIjHOn", "qty": 97, "slotId": "VSjs8HPo", "sourceItemId": "MpSu3PmL"}], "createItems": [{"customAttributes": {"BJmJh0Xd": {}, "9pVk4vKD": {}, "GKPqvJA5": {}}, "inventoryConfigurationCode": "eltdQxlD", "inventoryId": "UOLlzuNT", "qty": 36, "serverCustomAttributes": {"jwe4ZdEm": {}, "qQaoJGOz": {}, "Qo7GlE0a": {}}, "slotId": "gGiilkQU", "slotUsed": 44, "sourceItemId": "JyG7Ks6f", "tags": ["z7tOMD5C", "dlnt5M5w", "4HmzivOX"], "toSpecificInventory": true, "type": "6uX4264L"}, {"customAttributes": {"2LYT7wgC": {}, "p876QMcz": {}, "6MXpynK5": {}}, "inventoryConfigurationCode": "gbGM6i3S", "inventoryId": "K1PZt6r3", "qty": 37, "serverCustomAttributes": {"I2T5zhGu": {}, "lQbSbi89": {}, "gWCkmd48": {}}, "slotId": "Kp8rIVV7", "slotUsed": 51, "sourceItemId": "yjKt3YjC", "tags": ["oB2mkkRV", "RWggur5U", "m1BTrWbG"], "toSpecificInventory": false, "type": "Z9D8Ca3L"}, {"customAttributes": {"QKlOukZ2": {}, "JxUCGKa3": {}, "f3L3ZAiP": {}}, "inventoryConfigurationCode": "DM5IJ3l5", "inventoryId": "Eee3tbgm", "qty": 60, "serverCustomAttributes": {"bztJ2vuD": {}, "0f47r7B5": {}, "ber15XF7": {}}, "slotId": "1t5OZWcW", "slotUsed": 29, "sourceItemId": "aVMnLnEf", "tags": ["cX0KYWzf", "5eAOJrtR", "Rn57cwo2"], "toSpecificInventory": false, "type": "ZfovwsLy"}], "removeItems": [{"inventoryId": "S2TN8JtC", "slotId": "Rtm6NEta", "sourceItemId": "EkMh6OSB"}, {"inventoryId": "vOfQrsW0", "slotId": "gVobEp1X", "sourceItemId": "K78te0nm"}, {"inventoryId": "bV2r7aaN", "slotId": "Liegv7Jn", "sourceItemId": "EfpfdrRD"}], "targetUserId": "TWg7nRLv", "updateItems": [{"customAttributes": {"evjbdFjk": {}, "XRx8HHHO": {}, "vMsOlIMX": {}}, "inventoryId": "kJ0dXFNb", "serverCustomAttributes": {"NJpbpm8N": {}, "8IQ3dql9": {}, "ZyWLJWXz": {}}, "slotId": "4MhIG2XJ", "sourceItemId": "fs2X8yEW", "tags": ["p58oYzc1", "ildhzDhT", "zfwXX1Qv"], "type": "TpdI0gU0"}, {"customAttributes": {"CqhaQtJs": {}, "e6y05SyF": {}, "QpvcdIv3": {}}, "inventoryId": "lqYjDyhO", "serverCustomAttributes": {"ksRm7rWn": {}, "LDwmiZCU": {}, "MTrFObYt": {}}, "slotId": "dLlcvgYK", "sourceItemId": "uO7y3WNP", "tags": ["CQU4w318", "BEDU9UgQ", "DIM7YNDw"], "type": "WZnCgWD2"}, {"customAttributes": {"JHD7mPgo": {}, "Z0H0CX4t": {}, "vKU2xvXk": {}}, "inventoryId": "QtMg6hWq", "serverCustomAttributes": {"RlnkoMpB": {}, "11qTYQ18": {}, "Jaea0Nq7": {}}, "slotId": "gxb37MNq", "sourceItemId": "gUi71r0v", "tags": ["GmP0eIO5", "1CkI4qTq", "rWZmZmFQ"], "type": "bQ43UkAb"}]}], "requestId": "eSVNJ9kl"}' \
    > test.out 2>&1
eval_tap $? 2 'AdminCreateChainingOperations' test.out

#- 3 AdminListIntegrationConfigurations
./ng net.accelbyte.sdk.cli.Main inventory adminListIntegrationConfigurations \
    --namespace "$AB_NAMESPACE" \
    --limit '86' \
    --offset '87' \
    --sortBy 'createdAt' \
    > test.out 2>&1
eval_tap $? 3 'AdminListIntegrationConfigurations' test.out

#- 4 AdminCreateIntegrationConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminCreateIntegrationConfiguration \
    --namespace "$AB_NAMESPACE" \
    --body '{"mapItemType": ["Fu47K981", "hkOMfgle", "c23iqUHJ"], "serviceName": "QPL6E6YJ", "targetInventoryCode": "oFhtRStv"}' \
    > test.out 2>&1
eval_tap $? 4 'AdminCreateIntegrationConfiguration' test.out

#- 5 AdminUpdateIntegrationConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateIntegrationConfiguration \
    --integrationConfigurationId 'hnVeLcc9' \
    --namespace "$AB_NAMESPACE" \
    --body '{"mapItemType": ["XgUq03gb", "tY8c3bKT", "WvRy0AIm"], "serviceName": "lXXOloNt", "targetInventoryCode": "qjKgeQFi"}' \
    > test.out 2>&1
eval_tap $? 5 'AdminUpdateIntegrationConfiguration' test.out

#- 6 AdminUpdateStatusIntegrationConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateStatusIntegrationConfiguration \
    --integrationConfigurationId '6RoGp8pd' \
    --namespace "$AB_NAMESPACE" \
    --body '{"status": "INIT"}' \
    > test.out 2>&1
eval_tap $? 6 'AdminUpdateStatusIntegrationConfiguration' test.out

#- 7 AdminListInventories
./ng net.accelbyte.sdk.cli.Main inventory adminListInventories \
    --namespace "$AB_NAMESPACE" \
    --inventoryConfigurationCode 'sabX7yQ7' \
    --limit '74' \
    --offset '68' \
    --sortBy 'updatedAt' \
    --userId '1M7hxzEq' \
    > test.out 2>&1
eval_tap $? 7 'AdminListInventories' test.out

#- 8 AdminCreateInventory
./ng net.accelbyte.sdk.cli.Main inventory adminCreateInventory \
    --namespace "$AB_NAMESPACE" \
    --body '{"inventoryConfigurationCode": "D82TjiWB", "userId": "ES5c0DPo"}' \
    > test.out 2>&1
eval_tap $? 8 'AdminCreateInventory' test.out

#- 9 AdminGetInventory
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventory \
    --inventoryId '0bnx5deY' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'AdminGetInventory' test.out

#- 10 AdminUpdateInventory
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateInventory \
    --inventoryId 'E67jXZ6J' \
    --namespace "$AB_NAMESPACE" \
    --body '{"incMaxSlots": 33}' \
    > test.out 2>&1
eval_tap $? 10 'AdminUpdateInventory' test.out

#- 11 DeleteInventory
./ng net.accelbyte.sdk.cli.Main inventory deleteInventory \
    --inventoryId 'QyJLX7dL' \
    --namespace "$AB_NAMESPACE" \
    --body '{"message": "Povw57Zx"}' \
    > test.out 2>&1
eval_tap $? 11 'DeleteInventory' test.out

#- 12 AdminListItems
./ng net.accelbyte.sdk.cli.Main inventory adminListItems \
    --inventoryId 'WNaDrnIC' \
    --namespace "$AB_NAMESPACE" \
    --limit '92' \
    --offset '46' \
    --qtyGte '57' \
    --sortBy 'createdAt:asc' \
    --sourceItemId '9G5J8Zox' \
    --tags 'cP2YoF4w' \
    > test.out 2>&1
eval_tap $? 12 'AdminListItems' test.out

#- 13 AdminGetInventoryItem
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventoryItem \
    --inventoryId 'dzZOrwvX' \
    --namespace "$AB_NAMESPACE" \
    --slotId '54qa4Nq1' \
    --sourceItemId '0XCON6SM' \
    > test.out 2>&1
eval_tap $? 13 'AdminGetInventoryItem' test.out

#- 14 AdminListInventoryConfigurations
./ng net.accelbyte.sdk.cli.Main inventory adminListInventoryConfigurations \
    --namespace "$AB_NAMESPACE" \
    --code 'nujYwD4T' \
    --limit '45' \
    --offset '90' \
    --sortBy 'code' \
    > test.out 2>&1
eval_tap $? 14 'AdminListInventoryConfigurations' test.out

#- 15 AdminCreateInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminCreateInventoryConfiguration \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "8IYZkSiC", "description": "aV6bj0LX", "initialMaxSlots": 64, "maxInstancesPerUser": 34, "maxUpgradeSlots": 63, "name": "gs5bDDk3"}' \
    > test.out 2>&1
eval_tap $? 15 'AdminCreateInventoryConfiguration' test.out

#- 16 AdminGetInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventoryConfiguration \
    --inventoryConfigurationId 'ZOmR5YzS' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'AdminGetInventoryConfiguration' test.out

#- 17 AdminUpdateInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateInventoryConfiguration \
    --inventoryConfigurationId 'AKw56tIO' \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "EcUeoueL", "description": "Jt1vhbic", "initialMaxSlots": 57, "maxInstancesPerUser": 4, "maxUpgradeSlots": 22, "name": "GGW5hjGA"}' \
    > test.out 2>&1
eval_tap $? 17 'AdminUpdateInventoryConfiguration' test.out

#- 18 AdminDeleteInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteInventoryConfiguration \
    --inventoryConfigurationId 'iO2v6GYD' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminDeleteInventoryConfiguration' test.out

#- 19 AdminListItemTypes
./ng net.accelbyte.sdk.cli.Main inventory adminListItemTypes \
    --namespace "$AB_NAMESPACE" \
    --limit '99' \
    --offset '99' \
    --sortBy 'createdAt:desc' \
    > test.out 2>&1
eval_tap $? 19 'AdminListItemTypes' test.out

#- 20 AdminCreateItemType
./ng net.accelbyte.sdk.cli.Main inventory adminCreateItemType \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "684huC9Z"}' \
    > test.out 2>&1
eval_tap $? 20 'AdminCreateItemType' test.out

#- 21 AdminDeleteItemType
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteItemType \
    --itemTypeName 'rgmCqRKR' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'AdminDeleteItemType' test.out

#- 22 AdminListTags
./ng net.accelbyte.sdk.cli.Main inventory adminListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '33' \
    --offset '70' \
    --owner 'agWilh6p' \
    --sortBy 'createdAt' \
    > test.out 2>&1
eval_tap $? 22 'AdminListTags' test.out

#- 23 AdminCreateTag
./ng net.accelbyte.sdk.cli.Main inventory adminCreateTag \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "ITuyyvGm", "owner": "SERVER"}' \
    > test.out 2>&1
eval_tap $? 23 'AdminCreateTag' test.out

#- 24 AdminDeleteTag
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteTag \
    --namespace "$AB_NAMESPACE" \
    --tagName '4sARqKWa' \
    > test.out 2>&1
eval_tap $? 24 'AdminDeleteTag' test.out

#- 25 AdminConsumeUserItem
./ng net.accelbyte.sdk.cli.Main inventory adminConsumeUserItem \
    --inventoryId 'YsxAAJ8w' \
    --namespace "$AB_NAMESPACE" \
    --userId 'TmIPgpJ3' \
    --body '{"qty": 85, "slotId": "FNlzJ2u4", "sourceItemId": "BB85qz8R"}' \
    > test.out 2>&1
eval_tap $? 25 'AdminConsumeUserItem' test.out

#- 26 AdminBulkUpdateMyItems
./ng net.accelbyte.sdk.cli.Main inventory adminBulkUpdateMyItems \
    --inventoryId 'HbN1ssyq' \
    --namespace "$AB_NAMESPACE" \
    --userId '2fTJ3gLi' \
    --body '[{"customAttributes": {"S0sXDMkO": {}, "3NDi17RG": {}, "wRl0dHoq": {}}, "serverCustomAttributes": {"Sr7lfMkb": {}, "NrDNVt2o": {}, "f5PF3W9n": {}}, "slotId": "tG2goAq2", "sourceItemId": "cZ6jJXnA", "tags": ["5BEOsPkq", "i3IBVJtc", "qiRiv793"], "type": "LdPo7a9s"}, {"customAttributes": {"9TULRnUb": {}, "Vw2qA6Ce": {}, "AKnxtD4z": {}}, "serverCustomAttributes": {"z6nKxVQS": {}, "V4UtE1s3": {}, "QTSMJjQT": {}}, "slotId": "uZaQfSDk", "sourceItemId": "hNAIv2Km", "tags": ["RVL22tB0", "7FRKqMOF", "QCsUrSRN"], "type": "CqihqDKc"}, {"customAttributes": {"iQepsMtn": {}, "snHetyZE": {}, "tZ1urC5G": {}}, "serverCustomAttributes": {"qcdr5AAk": {}, "XyLvDbqH": {}, "Gn5WBqIH": {}}, "slotId": "02rW6du3", "sourceItemId": "EnZdslmL", "tags": ["t7KNASl7", "j4bEtwFD", "xZpntZi4"], "type": "yjKrRBfB"}]' \
    > test.out 2>&1
eval_tap $? 26 'AdminBulkUpdateMyItems' test.out

#- 27 AdminSaveItemToInventory
./ng net.accelbyte.sdk.cli.Main inventory adminSaveItemToInventory \
    --inventoryId 'yKnBv8GY' \
    --namespace "$AB_NAMESPACE" \
    --userId 'AyRTGa4X' \
    --body '{"customAttributes": {"76h1YKUQ": {}, "Zh9Vy3ai": {}, "z9iLtFrH": {}}, "qty": 94, "serverCustomAttributes": {"gJC6cDYx": {}, "7u9nq12b": {}, "42wCKnAo": {}}, "slotId": "iQc05ZSo", "slotUsed": 60, "source": "ECOMMERCE", "sourceItemId": "w3z3xjbu", "tags": ["P4Kl1JCw", "LJSRRZSj", "k5Jxn3t9"], "type": "VSLTxAsc"}' \
    > test.out 2>&1
eval_tap $? 27 'AdminSaveItemToInventory' test.out

#- 28 AdminBulkRemoveItems
./ng net.accelbyte.sdk.cli.Main inventory adminBulkRemoveItems \
    --inventoryId 'UDmW4ohV' \
    --namespace "$AB_NAMESPACE" \
    --userId 'vPk9PF0m' \
    --body '[{"slotId": "JP6ZgAsQ", "sourceItemId": "Y5gN05eL"}, {"slotId": "7cw3uA3Z", "sourceItemId": "eNNm4r6E"}, {"slotId": "CLKIASjP", "sourceItemId": "hGXDUYU8"}]' \
    > test.out 2>&1
eval_tap $? 28 'AdminBulkRemoveItems' test.out

#- 29 AdminSaveItem
./ng net.accelbyte.sdk.cli.Main inventory adminSaveItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'SUiuet7B' \
    --body '{"customAttributes": {"h2XyF2e9": {}, "HQPrGNUE": {}, "GDZu0cgl": {}}, "inventoryConfigurationCode": "tJB3o6Pn", "qty": 30, "serverCustomAttributes": {"8ATteFnw": {}, "AAY0GJ5a": {}, "uWaNZef9": {}}, "slotId": "1lDQkP9a", "slotUsed": 98, "source": "OTHER", "sourceItemId": "5cuCRMTF", "tags": ["IY9wDyhA", "5NViUcfY", "x6j8L3r0"], "type": "XElb7LOy"}' \
    > test.out 2>&1
eval_tap $? 29 'AdminSaveItem' test.out

#- 30 AdminSyncUserEntitlements
./ng net.accelbyte.sdk.cli.Main inventory adminSyncUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'TIfohhQr' \
    > test.out 2>&1
eval_tap $? 30 'AdminSyncUserEntitlements' test.out

#- 31 AdminPurchasable
./ng net.accelbyte.sdk.cli.Main inventory adminPurchasable \
    --namespace "$AB_NAMESPACE" \
    --userId 'FKEPKT8k' \
    --body '{"entitlementType": "4flUzrGL", "inventoryConfig": {"slotUsed": 73}, "itemId": "B8kg3RGB", "itemType": "JZLW1Zfx", "items": [{"bundledQty": 99, "entitlementType": "kVr6V7lV", "inventoryConfig": {"slotUsed": 39}, "itemId": "xHKq0st9", "itemType": "Ci1Ri21n", "sku": "GDaSicUb", "useCount": 3}, {"bundledQty": 39, "entitlementType": "dcjAR8KQ", "inventoryConfig": {"slotUsed": 95}, "itemId": "2ojeHeAs", "itemType": "oWRx1VcB", "sku": "Zvef1k1S", "useCount": 70}, {"bundledQty": 58, "entitlementType": "9ztyuVwr", "inventoryConfig": {"slotUsed": 20}, "itemId": "Nmdqb94L", "itemType": "xqAhWv6W", "sku": "LwSinyNs", "useCount": 60}], "quantity": 95, "sku": "23leP1SA", "useCount": 40}' \
    > test.out 2>&1
eval_tap $? 31 'AdminPurchasable' test.out

#- 32 PublicListInventoryConfigurations
./ng net.accelbyte.sdk.cli.Main inventory publicListInventoryConfigurations \
    --namespace "$AB_NAMESPACE" \
    --code '5CX8MVkN' \
    --limit '60' \
    --offset '77' \
    --sortBy 'code' \
    > test.out 2>&1
eval_tap $? 32 'PublicListInventoryConfigurations' test.out

#- 33 PublicListItemTypes
./ng net.accelbyte.sdk.cli.Main inventory publicListItemTypes \
    --namespace "$AB_NAMESPACE" \
    --limit '44' \
    --offset '97' \
    --sortBy 'name:asc' \
    > test.out 2>&1
eval_tap $? 33 'PublicListItemTypes' test.out

#- 34 PublicListTags
./ng net.accelbyte.sdk.cli.Main inventory publicListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '78' \
    --offset '6' \
    --sortBy 'name:asc' \
    > test.out 2>&1
eval_tap $? 34 'PublicListTags' test.out

#- 35 PublicListInventories
./ng net.accelbyte.sdk.cli.Main inventory publicListInventories \
    --namespace "$AB_NAMESPACE" \
    --inventoryConfigurationCode 'Jpyo9lXf' \
    --limit '88' \
    --offset '27' \
    --sortBy 'updatedAt:asc' \
    > test.out 2>&1
eval_tap $? 35 'PublicListInventories' test.out

#- 36 PublicConsumeMyItem
./ng net.accelbyte.sdk.cli.Main inventory publicConsumeMyItem \
    --inventoryId 'CPWS0PEW' \
    --namespace "$AB_NAMESPACE" \
    --body '{"qty": 3, "slotId": "zpt8wwf7", "sourceItemId": "dvVa2Zz3"}' \
    > test.out 2>&1
eval_tap $? 36 'PublicConsumeMyItem' test.out

#- 37 PublicListItems
./ng net.accelbyte.sdk.cli.Main inventory publicListItems \
    --inventoryId 'PT3pU1xo' \
    --namespace "$AB_NAMESPACE" \
    --limit '39' \
    --offset '95' \
    --qtyGte '85' \
    --sortBy 'qty:desc' \
    --sourceItemId '1tOq5evc' \
    --tags '48xL9biN' \
    > test.out 2>&1
eval_tap $? 37 'PublicListItems' test.out

#- 38 PublicBulkUpdateMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicBulkUpdateMyItems \
    --inventoryId 'IW3Tb2J9' \
    --namespace "$AB_NAMESPACE" \
    --body '[{"customAttributes": {"ggRSOQpx": {}, "c22iiPmN": {}, "EQV5eFPC": {}}, "slotId": "2oW9WrSI", "sourceItemId": "VS17rx3D", "tags": ["D56ipnrb", "JCjEPs1h", "jWjRbEHt"]}, {"customAttributes": {"VUphypcI": {}, "oKtkdVeI": {}, "JTP0MVJ2": {}}, "slotId": "KzD1BvbO", "sourceItemId": "3Cvei8cq", "tags": ["I7HLhz5A", "RVB4Kf6k", "RpsDrsq4"]}, {"customAttributes": {"YI2NFWp0": {}, "bcdDSZVP": {}, "k0yiTmUx": {}}, "slotId": "DMVm2ghF", "sourceItemId": "0SeIXcch", "tags": ["RvZuFOeF", "viG6caOg", "RGsEjmJt"]}]' \
    > test.out 2>&1
eval_tap $? 38 'PublicBulkUpdateMyItems' test.out

#- 39 PublicBulkRemoveMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicBulkRemoveMyItems \
    --inventoryId 'GXBoUjHQ' \
    --namespace "$AB_NAMESPACE" \
    --body '[{"slotId": "LGgy9x2h", "sourceItemId": "43D9Y64V"}, {"slotId": "Sh2YKmHl", "sourceItemId": "OD2C9EbJ"}, {"slotId": "UUN2LyQF", "sourceItemId": "HYvhvBoA"}]' \
    > test.out 2>&1
eval_tap $? 39 'PublicBulkRemoveMyItems' test.out

#- 40 PublicMoveMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicMoveMyItems \
    --inventoryId 'hRUAv5ce' \
    --namespace "$AB_NAMESPACE" \
    --body '{"items": [{"qty": 94, "slotId": "nKSEeVem", "sourceItemId": "pVxwDXWY"}, {"qty": 36, "slotId": "tE9E9yIP", "sourceItemId": "yg7EdBwg"}, {"qty": 85, "slotId": "OYksmrqr", "sourceItemId": "yVGSH5xq"}], "srcInventoryId": "h0b09Svl"}' \
    > test.out 2>&1
eval_tap $? 40 'PublicMoveMyItems' test.out

#- 41 PublicGetItem
./ng net.accelbyte.sdk.cli.Main inventory publicGetItem \
    --inventoryId 'a7G8gskB' \
    --namespace "$AB_NAMESPACE" \
    --slotId 'gaqXcRHO' \
    --sourceItemId 'ByzDwO6I' \
    > test.out 2>&1
eval_tap $? 41 'PublicGetItem' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
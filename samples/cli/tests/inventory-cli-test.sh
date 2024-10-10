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
    --body '{"message": "WoGq9ogK", "operations": [{"consumeItems": [{"inventoryId": "gIIxvlpx", "qty": 68, "slotId": "rHRS66jc", "sourceItemId": "RIYh1bHT"}, {"inventoryId": "LQnAXTP0", "qty": 78, "slotId": "UXXCk8YF", "sourceItemId": "KaaU34KG"}, {"inventoryId": "i8hfFZfQ", "qty": 98, "slotId": "ycD6j1HH", "sourceItemId": "sZkG3zCi"}], "createItems": [{"customAttributes": {"CRsftSN3": {}, "CWc6zZFI": {}, "uTgy4kHK": {}}, "inventoryConfigurationCode": "OgrzM7Pu", "inventoryId": "HxS7ZkAj", "qty": 62, "serverCustomAttributes": {"AjjNq6CU": {}, "ZOu2RjZu": {}, "cI5XQ6vh": {}}, "slotId": "Z8jHrL1s", "slotUsed": 31, "source": "ECOMMERCE", "sourceItemId": "8XymZV6K", "tags": ["pPA5zLcH", "CoyQH0IX", "37wGSuR9"], "toSpecificInventory": true, "type": "lE9OkQHF"}, {"customAttributes": {"6O7b6fNn": {}, "NrGUBoMo": {}, "XTf5d9tH": {}}, "inventoryConfigurationCode": "MsCqCCHb", "inventoryId": "1nIWfDMk", "qty": 83, "serverCustomAttributes": {"ibHzHj1r": {}, "0csuyw4u": {}, "LBfJu7F4": {}}, "slotId": "OhhuQbF9", "slotUsed": 8, "source": "ECOMMERCE", "sourceItemId": "bbuIza13", "tags": ["tbnYxMBh", "ff7ThKu1", "S9xURBk5"], "toSpecificInventory": false, "type": "1Z4Rag37"}, {"customAttributes": {"OjgWkocY": {}, "Z1EioXUx": {}, "bsAM1ZWY": {}}, "inventoryConfigurationCode": "9iJScw2w", "inventoryId": "Ozl70wpC", "qty": 94, "serverCustomAttributes": {"RAejrWbX": {}, "JqH5a5MX": {}, "RSNAAvtF": {}}, "slotId": "Ud797D4I", "slotUsed": 90, "source": "OTHER", "sourceItemId": "3oH0hICE", "tags": ["S6F19KV9", "emzNVLMR", "Yfk9FBBb"], "toSpecificInventory": false, "type": "GiVCQLI8"}], "removeItems": [{"inventoryId": "ydSsW4qu", "slotId": "kGtMnrIH", "sourceItemId": "XSY6X4JT"}, {"inventoryId": "Zir7AKpT", "slotId": "qPulLVHL", "sourceItemId": "zkZ9O3pj"}, {"inventoryId": "qGgtSf1a", "slotId": "cbwr6vF6", "sourceItemId": "P27s4lNJ"}], "targetUserId": "VUrELOll", "updateItems": [{"customAttributes": {"wGojUkku": {}, "Q5P7vIEi": {}, "88v1KcFW": {}}, "inventoryId": "ceQ9055t", "serverCustomAttributes": {"Q2VVS8Xz": {}, "PhEFCAUG": {}, "DH2AeL98": {}}, "slotId": "HtGj4tyu", "sourceItemId": "fzAwitii", "tags": ["RgNsM1zS", "ZDeFNWTl", "95FtJcEF"], "type": "AKApDmaR"}, {"customAttributes": {"WWw6vFsh": {}, "3L2cHXn2": {}, "EkRb9r4T": {}}, "inventoryId": "GquHzPpp", "serverCustomAttributes": {"igFb7SRo": {}, "Le79Iqvd": {}, "N9z4Y3aN": {}}, "slotId": "kZBZVZQ4", "sourceItemId": "ap7CTcJs", "tags": ["b39SC0c4", "h2aqWXzT", "2MaXFA1O"], "type": "Z8RUez6s"}, {"customAttributes": {"ZSX4QcF1": {}, "VbIjQbUH": {}, "igj5RoQY": {}}, "inventoryId": "s5CPEHI5", "serverCustomAttributes": {"RgMKxO6H": {}, "VZKyVbVp": {}, "KYN1K4aO": {}}, "slotId": "kUysDYgo", "sourceItemId": "JTSfGbra", "tags": ["lTwcmr59", "Hhe92wwP", "8PxKMai7"], "type": "XqUf93Vv"}]}, {"consumeItems": [{"inventoryId": "HOiF7NZY", "qty": 33, "slotId": "NYPaQSI9", "sourceItemId": "JpTaa2l0"}, {"inventoryId": "yCW6uZf1", "qty": 54, "slotId": "L5l9zDev", "sourceItemId": "bsaEiVTC"}, {"inventoryId": "uHteY6ud", "qty": 98, "slotId": "rrX0pB5w", "sourceItemId": "2rPjpF3g"}], "createItems": [{"customAttributes": {"Do5OC5ZU": {}, "PfkAQcpt": {}, "LzEm08Bm": {}}, "inventoryConfigurationCode": "KQpT7j9D", "inventoryId": "diKi6KdS", "qty": 36, "serverCustomAttributes": {"Is2XJJh4": {}, "7MlesETB": {}, "hGFTQ4Ml": {}}, "slotId": "OkN4eT64", "slotUsed": 94, "source": "ECOMMERCE", "sourceItemId": "ksnpumUW", "tags": ["oxToGgPg", "lUCZhKjv", "DVeGktON"], "toSpecificInventory": false, "type": "f6ukfbHg"}, {"customAttributes": {"blThmEmz": {}, "5mEYPr80": {}, "31NB3u5p": {}}, "inventoryConfigurationCode": "Jo0xgJ5D", "inventoryId": "UjrOtXiM", "qty": 23, "serverCustomAttributes": {"cr29W4z8": {}, "pKUmw3VN": {}, "QHijIv7M": {}}, "slotId": "S3rBvrJ3", "slotUsed": 69, "source": "ECOMMERCE", "sourceItemId": "zLPBS3BV", "tags": ["BEyRj9hB", "BAKWAJdB", "bokTZbvR"], "toSpecificInventory": false, "type": "D8hUSDNU"}, {"customAttributes": {"eF24yIXr": {}, "klYhPW1A": {}, "mfC7OeUB": {}}, "inventoryConfigurationCode": "WzJEgVG4", "inventoryId": "K4rsB6ee", "qty": 93, "serverCustomAttributes": {"qKkySk1m": {}, "fOleJO7C": {}, "96yzqrBd": {}}, "slotId": "TLY4MjRv", "slotUsed": 40, "source": "OTHER", "sourceItemId": "CEZiwTjZ", "tags": ["eG5sOMCM", "8psA36QZ", "iKzbgOMy"], "toSpecificInventory": true, "type": "Vwfi2YVY"}], "removeItems": [{"inventoryId": "jgU85QZI", "slotId": "tuBXeYXU", "sourceItemId": "p83bR4zG"}, {"inventoryId": "Wrm5T2wm", "slotId": "yfDEGuwT", "sourceItemId": "Mw35cNYQ"}, {"inventoryId": "pHdu7bOc", "slotId": "n0D1rGqK", "sourceItemId": "MGj9ddVs"}], "targetUserId": "2gpNGJKR", "updateItems": [{"customAttributes": {"TFB4wZ85": {}, "fC0lk242": {}, "KJSEpbMx": {}}, "inventoryId": "HxGhJTQa", "serverCustomAttributes": {"LFxNm6AB": {}, "mprnKW12": {}, "vaNaV3xZ": {}}, "slotId": "G6Kl1t6B", "sourceItemId": "kBfvev8G", "tags": ["sotqZx2f", "Ed48b13V", "hE13sdLK"], "type": "gPP3zYej"}, {"customAttributes": {"wJhGKOF6": {}, "ymvY3DG9": {}, "6yMLXrZL": {}}, "inventoryId": "qosQJW2P", "serverCustomAttributes": {"AaAN363G": {}, "WRblESQM": {}, "oVqwxTBP": {}}, "slotId": "QoMdyqEZ", "sourceItemId": "YgBOj3qV", "tags": ["UnWnRqLP", "dxAZRJEI", "G0ArRJZW"], "type": "c90mStPQ"}, {"customAttributes": {"BIe3BgcI": {}, "F77CBdau": {}, "Wx1xLojX": {}}, "inventoryId": "L1EfXUWH", "serverCustomAttributes": {"tHo6ef9J": {}, "ag3zlHse": {}, "RMCkM3KB": {}}, "slotId": "TsjfbqV9", "sourceItemId": "28PuTk3D", "tags": ["vp3pI35d", "kUFrnbqy", "dzgk5vdb"], "type": "6N67fL7w"}]}, {"consumeItems": [{"inventoryId": "kz3m3OV4", "qty": 40, "slotId": "vAXLEzdr", "sourceItemId": "q0bjvvRx"}, {"inventoryId": "rCLJ810z", "qty": 44, "slotId": "BMktZaeK", "sourceItemId": "6vyeZfBh"}, {"inventoryId": "kbokzbUB", "qty": 75, "slotId": "mIEihOHp", "sourceItemId": "7AcwJrtv"}], "createItems": [{"customAttributes": {"qQrUqPfD": {}, "NhCNGSO5": {}, "zybwT1Uo": {}}, "inventoryConfigurationCode": "AQsQQl0B", "inventoryId": "LYx8k5ix", "qty": 75, "serverCustomAttributes": {"417xVbCX": {}, "NZYGc7b4": {}, "qoOJYSxR": {}}, "slotId": "RPjFIvD4", "slotUsed": 68, "source": "ECOMMERCE", "sourceItemId": "hyZmf5jM", "tags": ["N6pyzrrV", "f0PwC3Yh", "cLxzEodA"], "toSpecificInventory": false, "type": "TebKmz1q"}, {"customAttributes": {"GajqrbUk": {}, "2XmuzTFx": {}, "KxgCJjdg": {}}, "inventoryConfigurationCode": "cGAJacQ3", "inventoryId": "zqFWsroW", "qty": 43, "serverCustomAttributes": {"62FtG3Qy": {}, "Sj8aMj4R": {}, "Teki717M": {}}, "slotId": "mFSgwmJi", "slotUsed": 12, "source": "OTHER", "sourceItemId": "kzCEiXz5", "tags": ["515egkuE", "kVUP6chE", "EmmpbyTg"], "toSpecificInventory": false, "type": "cKSMmuLY"}, {"customAttributes": {"MmN5XWTM": {}, "0J5AJb0I": {}, "QgLu7Iw1": {}}, "inventoryConfigurationCode": "HIeMlBaj", "inventoryId": "rjZp6iK5", "qty": 1, "serverCustomAttributes": {"JpPaxpkr": {}, "5SFp3Lc5": {}, "pC6jGLmi": {}}, "slotId": "TtsQHmZb", "slotUsed": 67, "source": "ECOMMERCE", "sourceItemId": "2kpFMeQF", "tags": ["XXDWffBj", "nlCNwY0N", "sk6XeRYq"], "toSpecificInventory": true, "type": "WHX4K9HE"}], "removeItems": [{"inventoryId": "nAEORQDr", "slotId": "DRgQxMBU", "sourceItemId": "aAsJbuIE"}, {"inventoryId": "oc8y8cMX", "slotId": "Xsp3sHvw", "sourceItemId": "xrBzN0kp"}, {"inventoryId": "BcjQ7zvZ", "slotId": "Y45wAJ2o", "sourceItemId": "4bEkWeAc"}], "targetUserId": "qQoJXrap", "updateItems": [{"customAttributes": {"uOqzW9jO": {}, "4XdpNCHg": {}, "wqC7prYd": {}}, "inventoryId": "3IO3o1Ts", "serverCustomAttributes": {"i84GaoMQ": {}, "fV7lWXZU": {}, "9D5wXBEZ": {}}, "slotId": "JMmFYMQk", "sourceItemId": "YAeKUqoc", "tags": ["BDVUVF7Q", "I4Y7i7co", "WUq28Qpz"], "type": "FcxgmJuM"}, {"customAttributes": {"YyMKb5CV": {}, "2TcDSyYm": {}, "la5RqMAN": {}}, "inventoryId": "BMgP1Pxw", "serverCustomAttributes": {"JKlacZvH": {}, "LTtW3xaf": {}, "kzyEBm0D": {}}, "slotId": "IH8JfTck", "sourceItemId": "pSWsBfJu", "tags": ["WVCe5zA0", "a2SS54hk", "4Z4gwGkP"], "type": "KAS3edEz"}, {"customAttributes": {"fCnaQvzT": {}, "unyMGW7A": {}, "hKCVE05W": {}}, "inventoryId": "b0jhtjCI", "serverCustomAttributes": {"THeLXr7K": {}, "V4v3cgj1": {}, "w2WGEXHe": {}}, "slotId": "FPafaf36", "sourceItemId": "8hufqEyE", "tags": ["9uAuN4a4", "MjS60UgF", "UsElpVCm"], "type": "hDvwCz0Q"}]}], "requestId": "jqhKlata"}' \
    > test.out 2>&1
eval_tap $? 2 'AdminCreateChainingOperations' test.out

#- 3 AdminListIntegrationConfigurations
./ng net.accelbyte.sdk.cli.Main inventory adminListIntegrationConfigurations \
    --namespace "$AB_NAMESPACE" \
    --limit '54' \
    --offset '97' \
    --sortBy 'createdAt:asc' \
    > test.out 2>&1
eval_tap $? 3 'AdminListIntegrationConfigurations' test.out

#- 4 AdminCreateIntegrationConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminCreateIntegrationConfiguration \
    --namespace "$AB_NAMESPACE" \
    --body '{"mapItemType": ["Gm7JsrrD", "THBCqoCR", "iCc8dHha"], "serviceName": "pwMfqh8m", "targetInventoryCode": "65809qTX"}' \
    > test.out 2>&1
eval_tap $? 4 'AdminCreateIntegrationConfiguration' test.out

#- 5 AdminUpdateIntegrationConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateIntegrationConfiguration \
    --integrationConfigurationId 'Zn3TdnyR' \
    --namespace "$AB_NAMESPACE" \
    --body '{"mapItemType": ["zQbdiZ24", "ChsbaImv", "jB4ETA6Z"], "serviceName": "DbljjtyQ", "targetInventoryCode": "yPdax13x"}' \
    > test.out 2>&1
eval_tap $? 5 'AdminUpdateIntegrationConfiguration' test.out

#- 6 AdminUpdateStatusIntegrationConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateStatusIntegrationConfiguration \
    --integrationConfigurationId 'rLGweIkW' \
    --namespace "$AB_NAMESPACE" \
    --body '{"status": "TIED"}' \
    > test.out 2>&1
eval_tap $? 6 'AdminUpdateStatusIntegrationConfiguration' test.out

#- 7 AdminListInventories
./ng net.accelbyte.sdk.cli.Main inventory adminListInventories \
    --namespace "$AB_NAMESPACE" \
    --inventoryConfigurationCode 'RRT9p3PZ' \
    --limit '63' \
    --offset '74' \
    --sortBy 'inventoryConfigurationCode:asc' \
    --userId 'epSHsSBW' \
    > test.out 2>&1
eval_tap $? 7 'AdminListInventories' test.out

#- 8 AdminCreateInventory
./ng net.accelbyte.sdk.cli.Main inventory adminCreateInventory \
    --namespace "$AB_NAMESPACE" \
    --body '{"inventoryConfigurationCode": "atEQ4HPc", "userId": "bivIXGif"}' \
    > test.out 2>&1
eval_tap $? 8 'AdminCreateInventory' test.out

#- 9 AdminGetInventory
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventory \
    --inventoryId 'SlWbgurT' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'AdminGetInventory' test.out

#- 10 AdminUpdateInventory
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateInventory \
    --inventoryId 'ZnA2uZUB' \
    --namespace "$AB_NAMESPACE" \
    --body '{"incMaxSlots": 16}' \
    > test.out 2>&1
eval_tap $? 10 'AdminUpdateInventory' test.out

#- 11 DeleteInventory
./ng net.accelbyte.sdk.cli.Main inventory deleteInventory \
    --inventoryId 'x03mPs5X' \
    --namespace "$AB_NAMESPACE" \
    --body '{"message": "G3M9GjvC"}' \
    > test.out 2>&1
eval_tap $? 11 'DeleteInventory' test.out

#- 12 AdminListItems
./ng net.accelbyte.sdk.cli.Main inventory adminListItems \
    --inventoryId '4TkXP64V' \
    --namespace "$AB_NAMESPACE" \
    --limit '85' \
    --offset '84' \
    --sortBy 'updatedAt:desc' \
    --sourceItemId 'mEsXIOKY' \
    --tags 'FGbUml1Q' \
    > test.out 2>&1
eval_tap $? 12 'AdminListItems' test.out

#- 13 AdminGetInventoryItem
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventoryItem \
    --inventoryId '0GeREvJE' \
    --namespace "$AB_NAMESPACE" \
    --slotId 'bt8MalVF' \
    --sourceItemId 'OYm7wVH0' \
    > test.out 2>&1
eval_tap $? 13 'AdminGetInventoryItem' test.out

#- 14 AdminListInventoryConfigurations
./ng net.accelbyte.sdk.cli.Main inventory adminListInventoryConfigurations \
    --namespace "$AB_NAMESPACE" \
    --code '7ZPwCTye' \
    --limit '22' \
    --offset '10' \
    --sortBy 'code:desc' \
    > test.out 2>&1
eval_tap $? 14 'AdminListInventoryConfigurations' test.out

#- 15 AdminCreateInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminCreateInventoryConfiguration \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "vloLlklT", "description": "Gd43bvQS", "initialMaxSlots": 91, "maxInstancesPerUser": 96, "maxUpgradeSlots": 0, "name": "oD4MTg7u"}' \
    > test.out 2>&1
eval_tap $? 15 'AdminCreateInventoryConfiguration' test.out

#- 16 AdminGetInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventoryConfiguration \
    --inventoryConfigurationId 'KnPBA1JB' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'AdminGetInventoryConfiguration' test.out

#- 17 AdminUpdateInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateInventoryConfiguration \
    --inventoryConfigurationId 'qrYxIlZ4' \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "IdY92yVk", "description": "S5aomjma", "initialMaxSlots": 34, "maxInstancesPerUser": 21, "maxUpgradeSlots": 16, "name": "C185AmRR"}' \
    > test.out 2>&1
eval_tap $? 17 'AdminUpdateInventoryConfiguration' test.out

#- 18 AdminDeleteInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteInventoryConfiguration \
    --inventoryConfigurationId 'Nvg1jzVO' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminDeleteInventoryConfiguration' test.out

#- 19 AdminListItemTypes
./ng net.accelbyte.sdk.cli.Main inventory adminListItemTypes \
    --namespace "$AB_NAMESPACE" \
    --limit '75' \
    --offset '67' \
    --sortBy 'createdAt' \
    > test.out 2>&1
eval_tap $? 19 'AdminListItemTypes' test.out

#- 20 AdminCreateItemType
./ng net.accelbyte.sdk.cli.Main inventory adminCreateItemType \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "gbwTVu1S"}' \
    > test.out 2>&1
eval_tap $? 20 'AdminCreateItemType' test.out

#- 21 AdminDeleteItemType
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteItemType \
    --itemTypeName 'AnIMBW7v' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'AdminDeleteItemType' test.out

#- 22 AdminListTags
./ng net.accelbyte.sdk.cli.Main inventory adminListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '21' \
    --offset '27' \
    --owner 'suqNaRH8' \
    --sortBy 'name' \
    > test.out 2>&1
eval_tap $? 22 'AdminListTags' test.out

#- 23 AdminCreateTag
./ng net.accelbyte.sdk.cli.Main inventory adminCreateTag \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "8GfzYfAc", "owner": "SERVER"}' \
    > test.out 2>&1
eval_tap $? 23 'AdminCreateTag' test.out

#- 24 AdminDeleteTag
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteTag \
    --namespace "$AB_NAMESPACE" \
    --tagName 'SaRXXavz' \
    > test.out 2>&1
eval_tap $? 24 'AdminDeleteTag' test.out

#- 25 AdminConsumeUserItem
./ng net.accelbyte.sdk.cli.Main inventory adminConsumeUserItem \
    --inventoryId 'MpLioGza' \
    --namespace "$AB_NAMESPACE" \
    --userId 'v26wxDMH' \
    --body '{"qty": 19, "slotId": "cmlp6YwY", "sourceItemId": "BxeM9Vuk"}' \
    > test.out 2>&1
eval_tap $? 25 'AdminConsumeUserItem' test.out

#- 26 AdminBulkUpdateMyItems
./ng net.accelbyte.sdk.cli.Main inventory adminBulkUpdateMyItems \
    --inventoryId 'WP71aUzX' \
    --namespace "$AB_NAMESPACE" \
    --userId 'CpOdXsOs' \
    --body '[{"customAttributes": {"hqpNP0yj": {}, "SIAaf6oR": {}, "qL4Ranau": {}}, "serverCustomAttributes": {"HQ5nBsiI": {}, "RyvI9wAg": {}, "Pg4lvc6B": {}}, "slotId": "SF6PH0Ih", "sourceItemId": "0Cg0Xzyz", "tags": ["6suPHwVW", "jpB89riy", "DolnkBRZ"], "type": "WJvw37qA"}, {"customAttributes": {"6juQzcWS": {}, "aB73O8MG": {}, "jlYdpz8o": {}}, "serverCustomAttributes": {"4V88zJJv": {}, "wvHxartB": {}, "UDWQesWa": {}}, "slotId": "4dCtESa9", "sourceItemId": "oPC53I7V", "tags": ["D0dCCAVI", "KK29B7dt", "e5RbbVbP"], "type": "DsmJXAqV"}, {"customAttributes": {"M0ZJSIJg": {}, "BpDu3x3T": {}, "cdWbZQoU": {}}, "serverCustomAttributes": {"WBLedVuQ": {}, "HO21gAb4": {}, "u0kIc2ks": {}}, "slotId": "COFtUN0g", "sourceItemId": "Uo5kSkzh", "tags": ["J8aqjUxW", "SObCBvIU", "mxXmQglD"], "type": "GFAzERKY"}]' \
    > test.out 2>&1
eval_tap $? 26 'AdminBulkUpdateMyItems' test.out

#- 27 AdminSaveItemToInventory
./ng net.accelbyte.sdk.cli.Main inventory adminSaveItemToInventory \
    --inventoryId '3KezhGHz' \
    --namespace "$AB_NAMESPACE" \
    --userId 'uwhaWgVT' \
    --body '{"customAttributes": {"DjAOrXGg": {}, "U1421iZV": {}, "oqU1mYIg": {}}, "qty": 98, "serverCustomAttributes": {"0MMxINXF": {}, "yXTEZHTA": {}, "evmA4X62": {}}, "slotId": "dsW3WWhK", "slotUsed": 84, "source": "ECOMMERCE", "sourceItemId": "RcFbZo1z", "tags": ["izzizOzW", "4fMAC2s0", "REMGXSQA"], "type": "xpAhwOI9"}' \
    > test.out 2>&1
eval_tap $? 27 'AdminSaveItemToInventory' test.out

#- 28 AdminBulkRemoveItems
./ng net.accelbyte.sdk.cli.Main inventory adminBulkRemoveItems \
    --inventoryId 'MYKQvHsh' \
    --namespace "$AB_NAMESPACE" \
    --userId 'gSVk4fo2' \
    --body '[{"slotId": "8L0ENmWf", "sourceItemId": "xNbuEW8j"}, {"slotId": "na5TPMaN", "sourceItemId": "3kG7vakQ"}, {"slotId": "9RDrOBpW", "sourceItemId": "MrGsUmSZ"}]' \
    > test.out 2>&1
eval_tap $? 28 'AdminBulkRemoveItems' test.out

#- 29 AdminBulkSaveItemToInventory
./ng net.accelbyte.sdk.cli.Main inventory adminBulkSaveItemToInventory \
    --inventoryId 'dQ83PAa5' \
    --namespace "$AB_NAMESPACE" \
    --userId 'rTSRMu5M' \
    --body '[{"customAttributes": {"lhKxijxB": {}, "CBUkUHTP": {}, "n0JV25Ii": {}}, "qty": 59, "serverCustomAttributes": {"iOCxwgt3": {}, "5e4YRCuE": {}, "riPaHjRr": {}}, "slotId": "1xOrJJck", "slotUsed": 75, "source": "ECOMMERCE", "sourceItemId": "eGg6AhsV", "tags": ["JNV3TUV6", "X8Ne4095", "XRkKfHqP"], "type": "NxrTY0ax"}, {"customAttributes": {"ajnoVaA5": {}, "IVFajL7z": {}, "s9ENX8Zt": {}}, "qty": 29, "serverCustomAttributes": {"WpQkIEfn": {}, "IH2uaydR": {}, "umxRYCNr": {}}, "slotId": "zTSoHTvx", "slotUsed": 1, "source": "OTHER", "sourceItemId": "IudfFg8y", "tags": ["zpPklG08", "BBsfwxIB", "2r6M7vDa"], "type": "4jjEEWUE"}, {"customAttributes": {"aHbkmieG": {}, "5ykuMKtV": {}, "JZ3YXBGk": {}}, "qty": 74, "serverCustomAttributes": {"SSF78sll": {}, "mUz1J2DR": {}, "8eTZyD4O": {}}, "slotId": "MMbffIPI", "slotUsed": 9, "source": "ECOMMERCE", "sourceItemId": "ZBPJGQbe", "tags": ["PvJy6N25", "DN8klxiP", "n1OWuS2C"], "type": "QrLl8uRK"}]' \
    > test.out 2>&1
eval_tap $? 29 'AdminBulkSaveItemToInventory' test.out

#- 30 AdminUpdateUserInventoriesByInventoryCode
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateUserInventoriesByInventoryCode \
    --inventoryConfigurationCode 'eoAt2TnL' \
    --namespace "$AB_NAMESPACE" \
    --userId 'GhMPQ0nB' \
    --body '{"incMaxSlots": 8}' \
    > test.out 2>&1
eval_tap $? 30 'AdminUpdateUserInventoriesByInventoryCode' test.out

#- 31 AdminSaveItem
./ng net.accelbyte.sdk.cli.Main inventory adminSaveItem \
    --namespace "$AB_NAMESPACE" \
    --userId '24k5BaKa' \
    --body '{"customAttributes": {"3E8VdB6r": {}, "8kXTyqpI": {}, "zXIeaD9J": {}}, "inventoryConfigurationCode": "eKvC3YVE", "qty": 5, "serverCustomAttributes": {"BYTBSIDr": {}, "XED0AC8h": {}, "6rWAsLK4": {}}, "slotId": "K7f2aow7", "slotUsed": 73, "source": "ECOMMERCE", "sourceItemId": "u4u77i1V", "tags": ["bbJhcmBL", "69pghxtH", "J0bcoUpq"], "type": "V1oD6vyW"}' \
    > test.out 2>&1
eval_tap $? 31 'AdminSaveItem' test.out

#- 32 AdminBulkSaveItem
./ng net.accelbyte.sdk.cli.Main inventory adminBulkSaveItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'WgvQaAF1' \
    --body '[{"customAttributes": {"0g7Txue5": {}, "KDjYDqSG": {}, "RxQwNC9V": {}}, "inventoryConfigurationCode": "IsXbhAxv", "qty": 88, "serverCustomAttributes": {"W9qFU68r": {}, "RNwKwf63": {}, "QdtntJpI": {}}, "slotId": "EiE1pr0x", "slotUsed": 14, "source": "ECOMMERCE", "sourceItemId": "miXfeMDz", "tags": ["Wp4LS4QX", "6FLy671k", "Nok4EXz9"], "type": "dysaZFoh"}, {"customAttributes": {"Ck2CNkZQ": {}, "29LRC6IO": {}, "m3O2l5mn": {}}, "inventoryConfigurationCode": "kVpg3Jpf", "qty": 72, "serverCustomAttributes": {"HYun4igG": {}, "ZiYdBWnq": {}, "uXn8BHIB": {}}, "slotId": "FKvRhHdB", "slotUsed": 77, "source": "OTHER", "sourceItemId": "gvNHOGwp", "tags": ["SGhzb0Eb", "uyMPGVPW", "EYqyB6Oq"], "type": "3SvcfHiB"}, {"customAttributes": {"9zl54clz": {}, "my1g6vJa": {}, "c8dhoGyM": {}}, "inventoryConfigurationCode": "hr6Pyysj", "qty": 65, "serverCustomAttributes": {"4IieSQi2": {}, "3xEhanKz": {}, "VdqufNtj": {}}, "slotId": "SiwLZl2K", "slotUsed": 5, "source": "ECOMMERCE", "sourceItemId": "EqGysa1T", "tags": ["uXysW6u6", "hn8eDONX", "tX9wHdiG"], "type": "4lF7h0gy"}]' \
    > test.out 2>&1
eval_tap $? 32 'AdminBulkSaveItem' test.out

#- 33 AdminSyncUserEntitlements
./ng net.accelbyte.sdk.cli.Main inventory adminSyncUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'b5j0RCjq' \
    > test.out 2>&1
eval_tap $? 33 'AdminSyncUserEntitlements' test.out

#- 34 AdminPurchasable
./ng net.accelbyte.sdk.cli.Main inventory adminPurchasable \
    --namespace "$AB_NAMESPACE" \
    --userId '13lRoBms' \
    --body '{"entitlementType": "YJ8yj6jP", "inventoryConfig": {"slotUsed": 47}, "itemId": "B2ZaBjsG", "itemType": "KlIRmAF2", "items": [{"bundledQty": 33, "entitlementType": "Bpm0ERuC", "inventoryConfig": {"slotUsed": 59}, "itemId": "IDtxgdw5", "itemType": "1E1eNbc8", "sku": "uz8BOz1D", "stackable": true, "useCount": 60}, {"bundledQty": 54, "entitlementType": "ZHYKcwv3", "inventoryConfig": {"slotUsed": 56}, "itemId": "9YhqQKa1", "itemType": "BXYyuucn", "sku": "uFHjL2pp", "stackable": false, "useCount": 32}, {"bundledQty": 37, "entitlementType": "FSE1OWcV", "inventoryConfig": {"slotUsed": 70}, "itemId": "EsliQL3N", "itemType": "SwMS0NvM", "sku": "I52bgNcE", "stackable": false, "useCount": 70}], "quantity": 77, "sku": "uiW5np7Y", "stackable": false, "useCount": 34}' \
    > test.out 2>&1
eval_tap $? 34 'AdminPurchasable' test.out

#- 35 PublicListInventoryConfigurations
./ng net.accelbyte.sdk.cli.Main inventory publicListInventoryConfigurations \
    --namespace "$AB_NAMESPACE" \
    --code 'l5wAyAu2' \
    --limit '7' \
    --offset '99' \
    --sortBy 'code:desc' \
    > test.out 2>&1
eval_tap $? 35 'PublicListInventoryConfigurations' test.out

#- 36 PublicListItemTypes
./ng net.accelbyte.sdk.cli.Main inventory publicListItemTypes \
    --namespace "$AB_NAMESPACE" \
    --limit '40' \
    --offset '19' \
    --sortBy 'name:asc' \
    > test.out 2>&1
eval_tap $? 36 'PublicListItemTypes' test.out

#- 37 PublicListTags
./ng net.accelbyte.sdk.cli.Main inventory publicListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '6' \
    --offset '59' \
    --sortBy 'createdAt' \
    > test.out 2>&1
eval_tap $? 37 'PublicListTags' test.out

#- 38 PublicListInventories
./ng net.accelbyte.sdk.cli.Main inventory publicListInventories \
    --namespace "$AB_NAMESPACE" \
    --inventoryConfigurationCode 'D8jCDNuX' \
    --limit '98' \
    --offset '33' \
    --sortBy 'createdAt:asc' \
    > test.out 2>&1
eval_tap $? 38 'PublicListInventories' test.out

#- 39 PublicConsumeMyItem
./ng net.accelbyte.sdk.cli.Main inventory publicConsumeMyItem \
    --inventoryId 'rqojHVeJ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"qty": 64, "slotId": "VWwZtxhS", "sourceItemId": "FcoWGuhu"}' \
    > test.out 2>&1
eval_tap $? 39 'PublicConsumeMyItem' test.out

#- 40 PublicListItems
./ng net.accelbyte.sdk.cli.Main inventory publicListItems \
    --inventoryId '3tkJ7c2v' \
    --namespace "$AB_NAMESPACE" \
    --limit '67' \
    --offset '99' \
    --sortBy 'updatedAt:asc' \
    --sourceItemId 'pgCtTocD' \
    --tags '2Rysz7xO' \
    > test.out 2>&1
eval_tap $? 40 'PublicListItems' test.out

#- 41 PublicBulkUpdateMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicBulkUpdateMyItems \
    --inventoryId 'nwNSJp8T' \
    --namespace "$AB_NAMESPACE" \
    --body '[{"customAttributes": {"lGUm7swZ": {}, "fYYrhJqK": {}, "5wYRly2L": {}}, "slotId": "IMVGRKCI", "sourceItemId": "84eGXJ4f", "tags": ["4XbujWQe", "oY2VDJtJ", "hFnr4kHE"]}, {"customAttributes": {"5LPMXvyt": {}, "BAYHQ6oE": {}, "DuIbv4fb": {}}, "slotId": "IYxMEip0", "sourceItemId": "KL4eqcJU", "tags": ["6LJQrrh3", "VfkwBYPR", "Km0SLnej"]}, {"customAttributes": {"1TUNO78T": {}, "8Daf0Uae": {}, "d0gvRdt8": {}}, "slotId": "Scy8jwzI", "sourceItemId": "9vGftHtv", "tags": ["P77xu3Gt", "BD8OlPQg", "cKlh2sIF"]}]' \
    > test.out 2>&1
eval_tap $? 41 'PublicBulkUpdateMyItems' test.out

#- 42 PublicBulkRemoveMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicBulkRemoveMyItems \
    --inventoryId '8XssB7SO' \
    --namespace "$AB_NAMESPACE" \
    --body '[{"slotId": "yMULFQh6", "sourceItemId": "GDupnKwa"}, {"slotId": "yAy0JoRy", "sourceItemId": "wNNDdiru"}, {"slotId": "FfUEiuUc", "sourceItemId": "sMwEYTe7"}]' \
    > test.out 2>&1
eval_tap $? 42 'PublicBulkRemoveMyItems' test.out

#- 43 PublicMoveMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicMoveMyItems \
    --inventoryId 'hhTlhPdH' \
    --namespace "$AB_NAMESPACE" \
    --body '{"items": [{"qty": 26, "slotId": "60APzDGE", "sourceItemId": "QQ77w9r9"}, {"qty": 82, "slotId": "CxmoT8nz", "sourceItemId": "EgrxH5cH"}, {"qty": 77, "slotId": "LtebOgDK", "sourceItemId": "ww16P3p4"}], "srcInventoryId": "zH5NbziT"}' \
    > test.out 2>&1
eval_tap $? 43 'PublicMoveMyItems' test.out

#- 44 PublicGetItem
./ng net.accelbyte.sdk.cli.Main inventory publicGetItem \
    --inventoryId 'mwq0Y8FI' \
    --namespace "$AB_NAMESPACE" \
    --slotId 'u0B4Bovn' \
    --sourceItemId '1b00S36V' \
    > test.out 2>&1
eval_tap $? 44 'PublicGetItem' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
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
    --body '{"message": "s49SBY0A", "operations": [{"consumeItems": [{"inventoryId": "B1nFg6fj", "qty": 96, "slotId": "pGZ2hFjz", "sourceItemId": "KYjQT3XI"}, {"inventoryId": "kVpVPXtu", "qty": 29, "slotId": "hLPmM7Uz", "sourceItemId": "P0yIDklt"}, {"inventoryId": "YEkGUk23", "qty": 31, "slotId": "vewW8HU9", "sourceItemId": "xDu8VjGH"}], "createItems": [{"customAttributes": {"G7II2Vr9": {}, "5NcBs8RW": {}, "QtlJnLrI": {}}, "inventoryConfigurationCode": "l8lAC0Fu", "inventoryId": "RUuHVE4D", "qty": 70, "serverCustomAttributes": {"ozjOr0Ni": {}, "yf5yueZo": {}, "3aMfXjqu": {}}, "slotId": "vqchhhqA", "slotUsed": 53, "source": "OTHER", "sourceItemId": "kvglWJn5", "tags": ["UMazEqqW", "ccgQGoXy", "brfnWxFS"], "toSpecificInventory": true, "type": "3pVgwxL5"}, {"customAttributes": {"VFoNXSIL": {}, "tn7dRsNZ": {}, "3MlOsgu4": {}}, "inventoryConfigurationCode": "fKxNIIgT", "inventoryId": "F9tAH2aT", "qty": 38, "serverCustomAttributes": {"WBPl7kYx": {}, "PmswWUcE": {}, "c5v72Yci": {}}, "slotId": "1z683cZ8", "slotUsed": 69, "source": "ECOMMERCE", "sourceItemId": "b0lJp3L3", "tags": ["yDhhgB9R", "aEEsofdu", "V0UT6lkm"], "toSpecificInventory": true, "type": "jCv5Ve7k"}, {"customAttributes": {"2naW40Y8": {}, "0H1gLSV8": {}, "hCTzytVZ": {}}, "inventoryConfigurationCode": "Zm3devK1", "inventoryId": "ZOlQHOfx", "qty": 45, "serverCustomAttributes": {"YA9bkRVt": {}, "RDGta4X2": {}, "tGK8tYz2": {}}, "slotId": "igZMBVSN", "slotUsed": 6, "source": "ECOMMERCE", "sourceItemId": "S4RQxoUi", "tags": ["4tdia8gE", "QkRBkaE3", "ETDK1yh6"], "toSpecificInventory": false, "type": "pI1VFuEd"}], "removeItems": [{"inventoryId": "ACa5UMBV", "slotId": "2ThtdeRN", "sourceItemId": "jC8FLuug"}, {"inventoryId": "dP9Ls8V4", "slotId": "0EMKH3Hf", "sourceItemId": "vw5LYiS9"}, {"inventoryId": "Ig1TN0Vz", "slotId": "ys9Oy1hG", "sourceItemId": "PNopni9c"}], "targetUserId": "ZHv4UsXK", "updateItems": [{"customAttributes": {"KTXGJ9Lp": {}, "KK4mPe1U": {}, "eFHg3zNh": {}}, "inventoryId": "rOeOS5pp", "serverCustomAttributes": {"njKXcQrl": {}, "59XtyDLS": {}, "Co4s1dib": {}}, "slotId": "P3hjY9Kx", "sourceItemId": "JPSEadNW", "tags": ["1M3gCbvu", "DpgVfBKN", "FC5lx5Yy"], "type": "IQpMvlYi"}, {"customAttributes": {"neMrGKyK": {}, "ZTKQJU9s": {}, "RgFzz9Za": {}}, "inventoryId": "hAyOt0BC", "serverCustomAttributes": {"PQ7WzSS3": {}, "l24YFhJM": {}, "2luvwxqH": {}}, "slotId": "aUrCgpUi", "sourceItemId": "6639QkHe", "tags": ["xF5xraM2", "rNrnwp3e", "4S6OzU7c"], "type": "zxhfLKwZ"}, {"customAttributes": {"JsY6X00x": {}, "EL3sxpoS": {}, "PBzXWJpl": {}}, "inventoryId": "Hj3XM7Dc", "serverCustomAttributes": {"Wyu4lDBa": {}, "tnblZg6k": {}, "gzwqh58B": {}}, "slotId": "LxknKh0r", "sourceItemId": "3gE4O4Dd", "tags": ["JTKqIRCs", "0yW97jxq", "clBIt7m7"], "type": "juVfM4zM"}]}, {"consumeItems": [{"inventoryId": "e0knhyP2", "qty": 82, "slotId": "bf5orElH", "sourceItemId": "H5Yktyhj"}, {"inventoryId": "HyGP7irE", "qty": 77, "slotId": "FVoKTyhQ", "sourceItemId": "2ZlWggY1"}, {"inventoryId": "UN5Ql9Fc", "qty": 56, "slotId": "w9LuDLUw", "sourceItemId": "dcUD5clZ"}], "createItems": [{"customAttributes": {"M31zhCIU": {}, "2sQLzYC9": {}, "JCeDIwIQ": {}}, "inventoryConfigurationCode": "NCouDRoJ", "inventoryId": "pwRveDOH", "qty": 67, "serverCustomAttributes": {"iorE7g9u": {}, "cRgHLWVT": {}, "1g5YCSw7": {}}, "slotId": "vSve6KPw", "slotUsed": 7, "source": "OTHER", "sourceItemId": "bWHlZMmG", "tags": ["zBxa8RZi", "XBXiVzpR", "VNexXack"], "toSpecificInventory": true, "type": "tIXs0zSH"}, {"customAttributes": {"IQwBrFEQ": {}, "1IKAg1s2": {}, "fQQZfDNs": {}}, "inventoryConfigurationCode": "qXYZUvpy", "inventoryId": "7ny3Nz6j", "qty": 75, "serverCustomAttributes": {"C6wzjAao": {}, "lfdXb9Wb": {}, "39iUb75y": {}}, "slotId": "kAwym9qP", "slotUsed": 79, "source": "OTHER", "sourceItemId": "aMjJjoiT", "tags": ["vUPqvE1U", "LH1Lohla", "CwBn7QTK"], "toSpecificInventory": false, "type": "v8p1s1oq"}, {"customAttributes": {"SUjuTBHG": {}, "s41r74GE": {}, "qEC90wPR": {}}, "inventoryConfigurationCode": "ETE7PGNW", "inventoryId": "Iynu5GTJ", "qty": 38, "serverCustomAttributes": {"hbVuPH9b": {}, "FtSEbhj1": {}, "P4TCCc3M": {}}, "slotId": "dTk7ClfN", "slotUsed": 43, "source": "OTHER", "sourceItemId": "WMQ7qXag", "tags": ["gZAB6SOt", "woQnUgP1", "qzkj2Sqx"], "toSpecificInventory": true, "type": "qChIsv5c"}], "removeItems": [{"inventoryId": "SgwbmUUH", "slotId": "UKe6FH8W", "sourceItemId": "Y6p3s76h"}, {"inventoryId": "W3OMGrvl", "slotId": "DUTXBIYo", "sourceItemId": "Hu3tYSau"}, {"inventoryId": "c9rw5CZT", "slotId": "JhZ7YIXg", "sourceItemId": "apbRiYHG"}], "targetUserId": "S3LVJUKD", "updateItems": [{"customAttributes": {"Sb9g7Rnb": {}, "Dh5iO7pi": {}, "vCS5Vato": {}}, "inventoryId": "YgLIWgY3", "serverCustomAttributes": {"VDxN6DFE": {}, "sHHJsd8q": {}, "K6RQ31ab": {}}, "slotId": "yyPkCjWk", "sourceItemId": "0pd97pkJ", "tags": ["MyOi76nJ", "JPHD9ZYi", "tuTb6kbL"], "type": "lvrOowLn"}, {"customAttributes": {"A8RE2I1z": {}, "aFoihX6p": {}, "peqxmqy2": {}}, "inventoryId": "raH9iW65", "serverCustomAttributes": {"yaiZ81In": {}, "arPajuuf": {}, "EwHnGUNg": {}}, "slotId": "Pe7CxSIj", "sourceItemId": "RGwM6gMq", "tags": ["UIqTcwT1", "W8XYNxqr", "nqZ6ddvh"], "type": "qzkVHI9k"}, {"customAttributes": {"weQKzUb8": {}, "w0qP6xos": {}, "p1O80Tjf": {}}, "inventoryId": "GKKnn4aG", "serverCustomAttributes": {"0za8l7rU": {}, "lHND0ZPI": {}, "7Z0ZN6hV": {}}, "slotId": "Z0PpSYmf", "sourceItemId": "LR0xSpIy", "tags": ["QHsZF4TR", "20isB032", "l5IOm2DX"], "type": "cwcX1ddq"}]}, {"consumeItems": [{"inventoryId": "V2oGwDwV", "qty": 95, "slotId": "QZipXvmq", "sourceItemId": "DBRJM8PQ"}, {"inventoryId": "UvcFQDJI", "qty": 3, "slotId": "pXPrkB5b", "sourceItemId": "ofcnuEGF"}, {"inventoryId": "CqzcGPQO", "qty": 13, "slotId": "PQgHMRGc", "sourceItemId": "nVFqZF5m"}], "createItems": [{"customAttributes": {"OfQvtBtq": {}, "0Zq2dYLq": {}, "zDuPgpxu": {}}, "inventoryConfigurationCode": "xnE7y850", "inventoryId": "xfTZBLKO", "qty": 86, "serverCustomAttributes": {"81BoXO8M": {}, "73qBaqZ9": {}, "v8IVkRbH": {}}, "slotId": "Q7R3X0GE", "slotUsed": 17, "source": "OTHER", "sourceItemId": "ymZKQ8Ap", "tags": ["3jKaK4rC", "IZVRVHII", "Nin7YT9u"], "toSpecificInventory": false, "type": "61d1NxVa"}, {"customAttributes": {"aogZICdu": {}, "fLx5uFLM": {}, "kc1alOeH": {}}, "inventoryConfigurationCode": "sRwaHaKF", "inventoryId": "SPsBsYGY", "qty": 21, "serverCustomAttributes": {"J6ZPHPmq": {}, "VZ5bJ63B": {}, "xphgjSoX": {}}, "slotId": "HgOe9YZ1", "slotUsed": 48, "source": "ECOMMERCE", "sourceItemId": "qTxehGAy", "tags": ["6vH5vItA", "Zn34YS8w", "oWkab6h1"], "toSpecificInventory": true, "type": "1Ajs59Ww"}, {"customAttributes": {"Xz0qGchv": {}, "W0Wb2fda": {}, "L1Uq612c": {}}, "inventoryConfigurationCode": "xWHbkyvC", "inventoryId": "AtimVfZy", "qty": 34, "serverCustomAttributes": {"Rs6rDgth": {}, "FJDvIscc": {}, "0fhNAD4D": {}}, "slotId": "OGKrRo5U", "slotUsed": 55, "source": "ECOMMERCE", "sourceItemId": "kziZZp9L", "tags": ["vWrbA3tt", "NIVW9xGW", "nJnF0ihw"], "toSpecificInventory": true, "type": "8Lr8kSUS"}], "removeItems": [{"inventoryId": "0Afmxm0y", "slotId": "HWbcZnTU", "sourceItemId": "Xps14iyy"}, {"inventoryId": "p4m62xnL", "slotId": "kS3E1DQF", "sourceItemId": "VBfX1pUL"}, {"inventoryId": "YYFNpbYE", "slotId": "3Iuu5ZqS", "sourceItemId": "3HceF3s8"}], "targetUserId": "tITWYofo", "updateItems": [{"customAttributes": {"xhrA4jIu": {}, "leEmGZrr": {}, "KJaVZCqY": {}}, "inventoryId": "xovlliLJ", "serverCustomAttributes": {"4OTzcYZV": {}, "6LCnAhRT": {}, "PNz1s46q": {}}, "slotId": "ptfOSnyO", "sourceItemId": "3zb4YTJo", "tags": ["K5RAhUpu", "NGThtrqp", "E5czUN4O"], "type": "1itKTJQz"}, {"customAttributes": {"Ii9luMkt": {}, "zLlibp7w": {}, "FhuBKiK2": {}}, "inventoryId": "ShXnZScI", "serverCustomAttributes": {"cv5WRTj0": {}, "URT5MAPc": {}, "HnRV6AHx": {}}, "slotId": "7oKhVBgp", "sourceItemId": "ydWph4at", "tags": ["DLeh0ywo", "TDqK2JBZ", "bHKs4tmt"], "type": "aRDYOThN"}, {"customAttributes": {"JzMog7aB": {}, "aNsXEt3t": {}, "CFUo3uPn": {}}, "inventoryId": "n9n0rX5t", "serverCustomAttributes": {"sqsuha59": {}, "HWFRtIDa": {}, "revjbeef": {}}, "slotId": "wnnxJmIO", "sourceItemId": "Fdnv4o9I", "tags": ["GWIgW4Wy", "HTXUn9rg", "j3rHYH8i"], "type": "O50c2ABA"}]}], "requestId": "ZYm8pA11"}' \
    > test.out 2>&1
eval_tap $? 2 'AdminCreateChainingOperations' test.out

#- 3 AdminListIntegrationConfigurations
./ng net.accelbyte.sdk.cli.Main inventory adminListIntegrationConfigurations \
    --namespace "$AB_NAMESPACE" \
    --limit '23' \
    --offset '89' \
    --sortBy 'createdAt:desc' \
    > test.out 2>&1
eval_tap $? 3 'AdminListIntegrationConfigurations' test.out

#- 4 AdminCreateIntegrationConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminCreateIntegrationConfiguration \
    --namespace "$AB_NAMESPACE" \
    --body '{"mapItemType": ["GGJF0s3i", "GKIJNptf", "abU7vpVe"], "serviceName": "henUOpTc", "targetInventoryCode": "bElqole7"}' \
    > test.out 2>&1
eval_tap $? 4 'AdminCreateIntegrationConfiguration' test.out

#- 5 AdminUpdateIntegrationConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateIntegrationConfiguration \
    --integrationConfigurationId 'zqaMZY29' \
    --namespace "$AB_NAMESPACE" \
    --body '{"mapItemType": ["WbGkPhuD", "3dCI4GEB", "jAvQlsaq"], "serviceName": "B20jP06Q", "targetInventoryCode": "kHGzEj9I"}' \
    > test.out 2>&1
eval_tap $? 5 'AdminUpdateIntegrationConfiguration' test.out

#- 6 AdminUpdateStatusIntegrationConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateStatusIntegrationConfiguration \
    --integrationConfigurationId 'FHs8XfwM' \
    --namespace "$AB_NAMESPACE" \
    --body '{"status": "INIT"}' \
    > test.out 2>&1
eval_tap $? 6 'AdminUpdateStatusIntegrationConfiguration' test.out

#- 7 AdminListInventories
./ng net.accelbyte.sdk.cli.Main inventory adminListInventories \
    --namespace "$AB_NAMESPACE" \
    --inventoryConfigurationCode 'XaWpYizL' \
    --limit '70' \
    --offset '3' \
    --sortBy 'updatedAt:desc' \
    --userId '5IV6Xwd2' \
    > test.out 2>&1
eval_tap $? 7 'AdminListInventories' test.out

#- 8 AdminCreateInventory
./ng net.accelbyte.sdk.cli.Main inventory adminCreateInventory \
    --namespace "$AB_NAMESPACE" \
    --body '{"inventoryConfigurationCode": "GJG3bwtg", "userId": "L0LWZGIg"}' \
    > test.out 2>&1
eval_tap $? 8 'AdminCreateInventory' test.out

#- 9 AdminGetInventory
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventory \
    --inventoryId 'vE4utead' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'AdminGetInventory' test.out

#- 10 AdminUpdateInventory
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateInventory \
    --inventoryId 'g8LeivzL' \
    --namespace "$AB_NAMESPACE" \
    --body '{"incMaxSlots": 85}' \
    > test.out 2>&1
eval_tap $? 10 'AdminUpdateInventory' test.out

#- 11 DeleteInventory
./ng net.accelbyte.sdk.cli.Main inventory deleteInventory \
    --inventoryId 'uNlgQNVG' \
    --namespace "$AB_NAMESPACE" \
    --body '{"message": "cv4natnL"}' \
    > test.out 2>&1
eval_tap $? 11 'DeleteInventory' test.out

#- 12 AdminListItems
./ng net.accelbyte.sdk.cli.Main inventory adminListItems \
    --inventoryId 'atiat5N0' \
    --namespace "$AB_NAMESPACE" \
    --limit '43' \
    --offset '11' \
    --sortBy 'createdAt' \
    --sourceItemId 'LFcyn52K' \
    --tags 'Ii6wvSDn' \
    > test.out 2>&1
eval_tap $? 12 'AdminListItems' test.out

#- 13 AdminGetInventoryItem
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventoryItem \
    --inventoryId 'Vvno8ZBg' \
    --namespace "$AB_NAMESPACE" \
    --slotId 'nnhOrU3P' \
    --sourceItemId 'lT301AqT' \
    > test.out 2>&1
eval_tap $? 13 'AdminGetInventoryItem' test.out

#- 14 AdminListInventoryConfigurations
./ng net.accelbyte.sdk.cli.Main inventory adminListInventoryConfigurations \
    --namespace "$AB_NAMESPACE" \
    --code 'cKG43IFI' \
    --limit '27' \
    --offset '62' \
    --sortBy 'createdAt:desc' \
    > test.out 2>&1
eval_tap $? 14 'AdminListInventoryConfigurations' test.out

#- 15 AdminCreateInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminCreateInventoryConfiguration \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "nwX4mHhG", "description": "pKEFb7NG", "initialMaxSlots": 64, "maxInstancesPerUser": 11, "maxUpgradeSlots": 12, "name": "GEh4TKjM"}' \
    > test.out 2>&1
eval_tap $? 15 'AdminCreateInventoryConfiguration' test.out

#- 16 AdminGetInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventoryConfiguration \
    --inventoryConfigurationId 'meU1JDIb' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'AdminGetInventoryConfiguration' test.out

#- 17 AdminUpdateInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateInventoryConfiguration \
    --inventoryConfigurationId '4n0YhJVb' \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "JIwFn5VT", "description": "cR75We7o", "initialMaxSlots": 13, "maxInstancesPerUser": 89, "maxUpgradeSlots": 75, "name": "MAlb6Wc2"}' \
    > test.out 2>&1
eval_tap $? 17 'AdminUpdateInventoryConfiguration' test.out

#- 18 AdminDeleteInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteInventoryConfiguration \
    --inventoryConfigurationId 'TQ5MFN1b' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminDeleteInventoryConfiguration' test.out

#- 19 AdminListItemTypes
./ng net.accelbyte.sdk.cli.Main inventory adminListItemTypes \
    --namespace "$AB_NAMESPACE" \
    --limit '46' \
    --offset '14' \
    --sortBy 'createdAt:asc' \
    > test.out 2>&1
eval_tap $? 19 'AdminListItemTypes' test.out

#- 20 AdminCreateItemType
./ng net.accelbyte.sdk.cli.Main inventory adminCreateItemType \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "lRVxiLaW"}' \
    > test.out 2>&1
eval_tap $? 20 'AdminCreateItemType' test.out

#- 21 AdminDeleteItemType
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteItemType \
    --itemTypeName '1motcc1B' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'AdminDeleteItemType' test.out

#- 22 AdminListTags
./ng net.accelbyte.sdk.cli.Main inventory adminListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '73' \
    --offset '71' \
    --owner '7JPbYSu6' \
    --sortBy 'name' \
    > test.out 2>&1
eval_tap $? 22 'AdminListTags' test.out

#- 23 AdminCreateTag
./ng net.accelbyte.sdk.cli.Main inventory adminCreateTag \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "ZR79mhdk", "owner": "CLIENT"}' \
    > test.out 2>&1
eval_tap $? 23 'AdminCreateTag' test.out

#- 24 AdminDeleteTag
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteTag \
    --namespace "$AB_NAMESPACE" \
    --tagName 'RdA0Xc4Q' \
    > test.out 2>&1
eval_tap $? 24 'AdminDeleteTag' test.out

#- 25 AdminConsumeUserItem
./ng net.accelbyte.sdk.cli.Main inventory adminConsumeUserItem \
    --inventoryId 'wJyMsR9w' \
    --namespace "$AB_NAMESPACE" \
    --userId '2pBXvMpg' \
    --body '{"qty": 55, "slotId": "go93p248", "sourceItemId": "roCaKY6l"}' \
    > test.out 2>&1
eval_tap $? 25 'AdminConsumeUserItem' test.out

#- 26 AdminBulkUpdateMyItems
./ng net.accelbyte.sdk.cli.Main inventory adminBulkUpdateMyItems \
    --inventoryId 'xtLn88z7' \
    --namespace "$AB_NAMESPACE" \
    --userId 'uEVq5lXE' \
    --body '[{"customAttributes": {"AvDl1LkQ": {}, "dapkkhhD": {}, "nAywhCW2": {}}, "serverCustomAttributes": {"vk5M8SNL": {}, "PegwCb0k": {}, "YzJ6AhTu": {}}, "slotId": "Uva6Qe7C", "sourceItemId": "EoPOhp1y", "tags": ["54unhHtD", "KwbJzfNq", "5NfscI8z"], "type": "Tbqxwdq6"}, {"customAttributes": {"lJ20jov2": {}, "m12DgY4E": {}, "u2zlIg56": {}}, "serverCustomAttributes": {"yzLzB8ad": {}, "XpdAe2UM": {}, "78fwAkPg": {}}, "slotId": "oEOopIHt", "sourceItemId": "fNuqQZBO", "tags": ["7Yoi5JwC", "y39x96Ji", "NzJp0v4z"], "type": "d6avODO7"}, {"customAttributes": {"6LeTH7Ai": {}, "PEulLrw5": {}, "TjrVmyMJ": {}}, "serverCustomAttributes": {"7pePkGD2": {}, "PAq1dx9q": {}, "VOMzMRqn": {}}, "slotId": "qVFWiyYB", "sourceItemId": "N8JZIcHX", "tags": ["DOJaH73k", "Nw5cXpbp", "lLdgab0T"], "type": "gsSZzQ72"}]' \
    > test.out 2>&1
eval_tap $? 26 'AdminBulkUpdateMyItems' test.out

#- 27 AdminSaveItemToInventory
./ng net.accelbyte.sdk.cli.Main inventory adminSaveItemToInventory \
    --inventoryId 'SVDs8faF' \
    --namespace "$AB_NAMESPACE" \
    --userId 'tCjYwZ5X' \
    --body '{"customAttributes": {"ruse3NmT": {}, "p4d67MKp": {}, "Wt262Cuz": {}}, "qty": 94, "serverCustomAttributes": {"W9P8YbjK": {}, "lXumFYUa": {}, "CM8OJq7k": {}}, "slotId": "iXudetk7", "slotUsed": 67, "source": "ECOMMERCE", "sourceItemId": "fJT0Ys8U", "tags": ["Kj83mPim", "fKZJqMq9", "sgnqnJmm"], "type": "KHJmcmfs"}' \
    > test.out 2>&1
eval_tap $? 27 'AdminSaveItemToInventory' test.out

#- 28 AdminBulkRemoveItems
./ng net.accelbyte.sdk.cli.Main inventory adminBulkRemoveItems \
    --inventoryId 'WV8nkEib' \
    --namespace "$AB_NAMESPACE" \
    --userId 'icmUhyED' \
    --body '[{"slotId": "9hQ0SWuZ", "sourceItemId": "dEVFzSWO"}, {"slotId": "BnIRgJev", "sourceItemId": "ud3NyZ0T"}, {"slotId": "VkjmBJmt", "sourceItemId": "0lle9WNZ"}]' \
    > test.out 2>&1
eval_tap $? 28 'AdminBulkRemoveItems' test.out

#- 29 AdminBulkSaveItemToInventory
./ng net.accelbyte.sdk.cli.Main inventory adminBulkSaveItemToInventory \
    --inventoryId 'zX2OH4IH' \
    --namespace "$AB_NAMESPACE" \
    --userId 'lxC3GMq6' \
    --body '[{"customAttributes": {"DeNsWdkT": {}, "Wc6Yl2AQ": {}, "4q0o3Mpl": {}}, "qty": 33, "serverCustomAttributes": {"OTWcc0mO": {}, "WA9Rqacf": {}, "XmGdmmmz": {}}, "slotId": "1enuJU3N", "slotUsed": 8, "source": "OTHER", "sourceItemId": "sbWQSmO8", "tags": ["NyvEEHSk", "nG3qOz8I", "vrRFmzIq"], "type": "cxMmJNmr"}, {"customAttributes": {"ZmiUGETY": {}, "aqKkZb6w": {}, "PsvpqHiD": {}}, "qty": 46, "serverCustomAttributes": {"V7kAKazi": {}, "IJfdiShl": {}, "oIwEzNAq": {}}, "slotId": "w8oFlPAD", "slotUsed": 97, "source": "ECOMMERCE", "sourceItemId": "AHAlRha3", "tags": ["rGfZZcTZ", "j3uLWqyG", "syyaqsqT"], "type": "cWk3OPdG"}, {"customAttributes": {"lptoRY8U": {}, "CODKAkvf": {}, "1j9shYq3": {}}, "qty": 17, "serverCustomAttributes": {"keqC6vOh": {}, "mLvaLp6k": {}, "WAfZKyE6": {}}, "slotId": "Qd8SIY8j", "slotUsed": 51, "source": "OTHER", "sourceItemId": "GXoNHWzh", "tags": ["55YXXdLZ", "sozOxnT9", "kHk1XBaX"], "type": "UIDdUbgd"}]' \
    > test.out 2>&1
eval_tap $? 29 'AdminBulkSaveItemToInventory' test.out

#- 30 AdminUpdateUserInventoriesByInventoryCode
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateUserInventoriesByInventoryCode \
    --inventoryConfigurationCode 'ZAyyz76T' \
    --namespace "$AB_NAMESPACE" \
    --userId 'E1EaEFaW' \
    --body '{"incMaxSlots": 16}' \
    > test.out 2>&1
eval_tap $? 30 'AdminUpdateUserInventoriesByInventoryCode' test.out

#- 31 AdminSaveItem
./ng net.accelbyte.sdk.cli.Main inventory adminSaveItem \
    --namespace "$AB_NAMESPACE" \
    --userId '2NJyVbwF' \
    --body '{"customAttributes": {"5Y5IfZIR": {}, "Dnqny0UA": {}, "rb7vUnck": {}}, "inventoryConfigurationCode": "zjaIfXSO", "qty": 47, "serverCustomAttributes": {"eULBkOxB": {}, "IW58OCpT": {}, "cNcEEgjP": {}}, "slotId": "2FyWeAJH", "slotUsed": 45, "source": "ECOMMERCE", "sourceItemId": "LJtyLOWA", "tags": ["6TmJNWkQ", "1RIh9trb", "vlkIZKDJ"], "type": "RClmmgPx"}' \
    > test.out 2>&1
eval_tap $? 31 'AdminSaveItem' test.out

#- 32 AdminBulkSaveItem
./ng net.accelbyte.sdk.cli.Main inventory adminBulkSaveItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'U1zkw7JT' \
    --body '[{"customAttributes": {"bDeFebmE": {}, "fEOTG7KE": {}, "oLAl1KcI": {}}, "inventoryConfigurationCode": "N13dx8nz", "qty": 71, "serverCustomAttributes": {"khHfndPl": {}, "7J3N69Pj": {}, "d6E16A6I": {}}, "slotId": "cdft1QGX", "slotUsed": 97, "source": "OTHER", "sourceItemId": "8IUbXrBS", "tags": ["H4W50DZB", "CI8epr7y", "c1a5GDyk"], "type": "Lxn2TbTl"}, {"customAttributes": {"jXhARacP": {}, "wbrMIkn7": {}, "iYdQ470G": {}}, "inventoryConfigurationCode": "mJpvhvFg", "qty": 8, "serverCustomAttributes": {"bBbWBzbO": {}, "6ZBp7QW7": {}, "jHUjnlFb": {}}, "slotId": "qCB25pPk", "slotUsed": 19, "source": "ECOMMERCE", "sourceItemId": "FCdEyY5Y", "tags": ["9QS4rLsx", "89VGLcfz", "gFxJkixW"], "type": "KGXq0hPj"}, {"customAttributes": {"ZJkQODf5": {}, "TlZNAVsl": {}, "KVnvksrm": {}}, "inventoryConfigurationCode": "CGfLU6DN", "qty": 48, "serverCustomAttributes": {"Cs8rehuJ": {}, "TzSd4C35": {}, "Mc0lYSfC": {}}, "slotId": "IaGMVvVN", "slotUsed": 65, "source": "ECOMMERCE", "sourceItemId": "ACvoLsbV", "tags": ["znIOqyfU", "MjN7nJJP", "gAkAIkE7"], "type": "DlFCYTfC"}]' \
    > test.out 2>&1
eval_tap $? 32 'AdminBulkSaveItem' test.out

#- 33 AdminSyncUserEntitlements
./ng net.accelbyte.sdk.cli.Main inventory adminSyncUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'eKgdj4PE' \
    > test.out 2>&1
eval_tap $? 33 'AdminSyncUserEntitlements' test.out

#- 34 AdminPurchasable
./ng net.accelbyte.sdk.cli.Main inventory adminPurchasable \
    --namespace "$AB_NAMESPACE" \
    --userId 'ENHNyHV7' \
    --body '{"entitlementType": "4tHU0R4y", "inventoryConfig": {"slotUsed": 25}, "itemId": "EyRuEWip", "itemType": "AVMnitvo", "items": [{"bundledQty": 29, "entitlementType": "HUg2xoZ8", "inventoryConfig": {"slotUsed": 80}, "itemId": "4Ga6UoMD", "itemType": "JI7GahDP", "sku": "z9kDk9iV", "stackable": false, "useCount": 42}, {"bundledQty": 77, "entitlementType": "90ukTdFQ", "inventoryConfig": {"slotUsed": 67}, "itemId": "HbR7CG3E", "itemType": "jwXsYygE", "sku": "vxjEWaew", "stackable": false, "useCount": 74}, {"bundledQty": 68, "entitlementType": "8rMNOLu9", "inventoryConfig": {"slotUsed": 98}, "itemId": "eUAcKcd0", "itemType": "tgw6zelH", "sku": "jfMhfBAL", "stackable": false, "useCount": 50}], "quantity": 49, "sku": "7JJfMuEp", "stackable": true, "useCount": 71}' \
    > test.out 2>&1
eval_tap $? 34 'AdminPurchasable' test.out

#- 35 PublicListInventoryConfigurations
./ng net.accelbyte.sdk.cli.Main inventory publicListInventoryConfigurations \
    --namespace "$AB_NAMESPACE" \
    --code 'BNzgg9Uu' \
    --limit '84' \
    --offset '39' \
    --sortBy 'createdAt:desc' \
    > test.out 2>&1
eval_tap $? 35 'PublicListInventoryConfigurations' test.out

#- 36 PublicListItemTypes
./ng net.accelbyte.sdk.cli.Main inventory publicListItemTypes \
    --namespace "$AB_NAMESPACE" \
    --limit '26' \
    --offset '36' \
    --sortBy 'createdAt' \
    > test.out 2>&1
eval_tap $? 36 'PublicListItemTypes' test.out

#- 37 PublicListTags
./ng net.accelbyte.sdk.cli.Main inventory publicListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '99' \
    --offset '80' \
    --sortBy 'createdAt:asc' \
    > test.out 2>&1
eval_tap $? 37 'PublicListTags' test.out

#- 38 PublicListInventories
./ng net.accelbyte.sdk.cli.Main inventory publicListInventories \
    --namespace "$AB_NAMESPACE" \
    --inventoryConfigurationCode '0SVPYjRm' \
    --limit '51' \
    --offset '8' \
    --sortBy 'createdAt:desc' \
    > test.out 2>&1
eval_tap $? 38 'PublicListInventories' test.out

#- 39 PublicConsumeMyItem
./ng net.accelbyte.sdk.cli.Main inventory publicConsumeMyItem \
    --inventoryId 'zNWtUY3C' \
    --namespace "$AB_NAMESPACE" \
    --body '{"qty": 71, "slotId": "iBUZGBJS", "sourceItemId": "UYZOIe88"}' \
    > test.out 2>&1
eval_tap $? 39 'PublicConsumeMyItem' test.out

#- 40 PublicListItems
./ng net.accelbyte.sdk.cli.Main inventory publicListItems \
    --inventoryId 'oSSVhQRO' \
    --namespace "$AB_NAMESPACE" \
    --limit '17' \
    --offset '45' \
    --sortBy 'updatedAt' \
    --sourceItemId 'KAhdgzOi' \
    --tags 'pYHbfgFF' \
    > test.out 2>&1
eval_tap $? 40 'PublicListItems' test.out

#- 41 PublicBulkUpdateMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicBulkUpdateMyItems \
    --inventoryId 'Mqv4SY9R' \
    --namespace "$AB_NAMESPACE" \
    --body '[{"customAttributes": {"pcyRkvge": {}, "94whsekv": {}, "O0vrK9xs": {}}, "slotId": "FrpsVsag", "sourceItemId": "jst1O6ln", "tags": ["vCIT7V8f", "Zz3KjB0h", "C87cHOpT"]}, {"customAttributes": {"DrzVQTCC": {}, "slxg77VU": {}, "Zw6fvPs5": {}}, "slotId": "X0mY4bJ2", "sourceItemId": "ygieAFc9", "tags": ["HKKnJzWE", "GFomIMnO", "tJuDBjM1"]}, {"customAttributes": {"Ad3gdPNO": {}, "bpvHTpMb": {}, "KTSCZAxE": {}}, "slotId": "28ySkkqZ", "sourceItemId": "XpQLxfap", "tags": ["0hF0XJpY", "NF1iW8zM", "dZJHyQ5Q"]}]' \
    > test.out 2>&1
eval_tap $? 41 'PublicBulkUpdateMyItems' test.out

#- 42 PublicBulkRemoveMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicBulkRemoveMyItems \
    --inventoryId 'L1R8lRMk' \
    --namespace "$AB_NAMESPACE" \
    --body '[{"slotId": "1FqbXdyZ", "sourceItemId": "THKteuNV"}, {"slotId": "zp0av8oI", "sourceItemId": "qeDyVO1K"}, {"slotId": "ZbKxsLAm", "sourceItemId": "Gvd37cRd"}]' \
    > test.out 2>&1
eval_tap $? 42 'PublicBulkRemoveMyItems' test.out

#- 43 PublicMoveMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicMoveMyItems \
    --inventoryId 'zwWZqdmK' \
    --namespace "$AB_NAMESPACE" \
    --body '{"items": [{"qty": 7, "slotId": "vqBYxEdX", "sourceItemId": "rf2dhFvQ"}, {"qty": 8, "slotId": "hUllGD7G", "sourceItemId": "rcc8Yll1"}, {"qty": 42, "slotId": "dfx2vxrG", "sourceItemId": "89Nuv0jG"}], "srcInventoryId": "f0KyHB7X"}' \
    > test.out 2>&1
eval_tap $? 43 'PublicMoveMyItems' test.out

#- 44 PublicGetItem
./ng net.accelbyte.sdk.cli.Main inventory publicGetItem \
    --inventoryId 'Cy2D6p8w' \
    --namespace "$AB_NAMESPACE" \
    --slotId 'CU5Za2Gm' \
    --sourceItemId 'qsoY5RKl' \
    > test.out 2>&1
eval_tap $? 44 'PublicGetItem' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
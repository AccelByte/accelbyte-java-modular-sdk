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
    --body '{"message": "GUscN7VE", "operations": [{"consumeItems": [{"dateRangeValidation": true, "inventoryId": "9Ueuflek", "options": ["yKVDfhBm", "J3kCY1Si", "Q6nMDRt4"], "qty": 42, "slotId": "crPsENJo", "sourceItemId": "7unEqOtH"}, {"dateRangeValidation": true, "inventoryId": "f8PhxGNn", "options": ["pX0mxZsf", "Fi5D3u1B", "PtW42J9Q"], "qty": 59, "slotId": "Aid1Bo8Q", "sourceItemId": "FsduAted"}, {"dateRangeValidation": false, "inventoryId": "tF14trtY", "options": ["zln8NtYs", "UuZ6PeKG", "TVsFbWGw"], "qty": 2, "slotId": "oJrcFfsg", "sourceItemId": "UHk8sQ5R"}], "createItems": [{"customAttributes": {"UWsPs5kS": {}, "QA9PMjIu": {}, "cpLkZ7oE": {}}, "inventoryConfigurationCode": "FnYdNv2Z", "inventoryId": "kyKjtsGr", "qty": 44, "serverCustomAttributes": {"9k4hcpqJ": {}, "mZb7YK3u": {}, "3EYHIoi5": {}}, "slotId": "j9OPCBrq", "slotUsed": 59, "source": "OTHER", "sourceItemId": "KO7iAHMA", "tags": ["BiUbi2cO", "hnJVUxol", "5NArvz9M"], "toSpecificInventory": false, "type": "FKK1KrFe"}, {"customAttributes": {"58TOHm1o": {}, "NFGxNY4G": {}, "UYWXO9vA": {}}, "inventoryConfigurationCode": "eTi6bYjW", "inventoryId": "njL58WQP", "qty": 30, "serverCustomAttributes": {"u8I2edf4": {}, "j7Y6minm": {}, "1c8zL4jw": {}}, "slotId": "LlsvJZHr", "slotUsed": 7, "source": "OTHER", "sourceItemId": "aRPxJ1bJ", "tags": ["1XwnShsT", "xubTxrwz", "JoQDnW5f"], "toSpecificInventory": true, "type": "zeREwdnG"}, {"customAttributes": {"f17klbHa": {}, "fnz63sXi": {}, "zAv8jW13": {}}, "inventoryConfigurationCode": "MnQcfReD", "inventoryId": "Gm7sO1II", "qty": 71, "serverCustomAttributes": {"zOwjLOym": {}, "5PX7LMAL": {}, "vjhVx9LZ": {}}, "slotId": "FA7wAzpk", "slotUsed": 18, "source": "OTHER", "sourceItemId": "u3H3TbIU", "tags": ["prQKkhQP", "BLl5Nhuz", "YZBVjuUt"], "toSpecificInventory": false, "type": "hG51eENE"}], "removeItems": [{"inventoryId": "wpX7u4ro", "slotId": "Tx99pSD4", "sourceItemId": "MPIsQBfe"}, {"inventoryId": "GzGJWqVa", "slotId": "thcUOOLV", "sourceItemId": "lLQpnRBD"}, {"inventoryId": "murq7n2g", "slotId": "WtdX0UZK", "sourceItemId": "qANyTGOL"}], "targetUserId": "a8VZb1bl", "updateItems": [{"customAttributes": {"iE1kbdBR": {}, "6OqOuPrb": {}, "Uq9h8huL": {}}, "inventoryId": "nhIbIhOn", "serverCustomAttributes": {"H7XvfZv7": {}, "wU1ASRNW": {}, "B4Lu9l6N": {}}, "slotId": "ZX2HLNGh", "sourceItemId": "5p2k2tNI", "tags": ["9svEMYxb", "J8bl64gk", "oFCHQ8Qs"], "type": "P93wdOb9"}, {"customAttributes": {"m3AQuOc1": {}, "5g9zC2Cl": {}, "V9AK5r6K": {}}, "inventoryId": "IMI3wMYp", "serverCustomAttributes": {"5BegFYye": {}, "YWxRi6Xg": {}, "wwQ4eUWS": {}}, "slotId": "g1E2IWid", "sourceItemId": "itOBgAeG", "tags": ["zVGYweYM", "COiQp8Mb", "xEXviAP5"], "type": "pi0S3trn"}, {"customAttributes": {"NQdFsWsD": {}, "RCiDEhnA": {}, "PwegSgS8": {}}, "inventoryId": "7J7JzIrl", "serverCustomAttributes": {"aJadjlOC": {}, "Aw0QLTL3": {}, "QpMqHwat": {}}, "slotId": "SrZgFV9N", "sourceItemId": "yeqvWvvK", "tags": ["5bAwXQek", "KGg721ov", "XOUWrlXU"], "type": "2XfzrVVE"}]}, {"consumeItems": [{"dateRangeValidation": false, "inventoryId": "nQuxWs20", "options": ["DLOgAjMH", "2B1Lj3TX", "WFr4Jtay"], "qty": 10, "slotId": "cheP6Aj8", "sourceItemId": "5B3LZUBX"}, {"dateRangeValidation": true, "inventoryId": "srWDa2QK", "options": ["lYVUCkIS", "11A4hWt4", "KqJdF4If"], "qty": 85, "slotId": "KxVNxrNG", "sourceItemId": "VwDRqT91"}, {"dateRangeValidation": false, "inventoryId": "VWZrYyCV", "options": ["uoKDYXOb", "YmwOJpLi", "P8Sge8Ou"], "qty": 30, "slotId": "ak9uN2Lr", "sourceItemId": "iq62R7Zk"}], "createItems": [{"customAttributes": {"WzqsWagU": {}, "Hot4hiWP": {}, "i3iFA4jp": {}}, "inventoryConfigurationCode": "w4tN9UF4", "inventoryId": "jB6FHiXy", "qty": 62, "serverCustomAttributes": {"NR8L0rc6": {}, "JJMN1ZM4": {}, "1TmxLjz0": {}}, "slotId": "YALNIPEv", "slotUsed": 81, "source": "OTHER", "sourceItemId": "gAjCGOqu", "tags": ["CUYvcOob", "QhXclxT6", "CK1PQ6vZ"], "toSpecificInventory": false, "type": "GiF1vyee"}, {"customAttributes": {"mMiTfFGy": {}, "o555Q05t": {}, "mGUCIlrW": {}}, "inventoryConfigurationCode": "CGlclxZ0", "inventoryId": "jAmj9ApJ", "qty": 51, "serverCustomAttributes": {"IAoMFpvx": {}, "ZTWqYpRo": {}, "eXRpnj60": {}}, "slotId": "h70zIyw3", "slotUsed": 81, "source": "ECOMMERCE", "sourceItemId": "3kIONaHa", "tags": ["3dbE5SKu", "qa0IZCaj", "hyIE9sdC"], "toSpecificInventory": false, "type": "EbqmBajU"}, {"customAttributes": {"kiuI46Df": {}, "Xd3wsLdF": {}, "Yq0ihndi": {}}, "inventoryConfigurationCode": "mPp4sQHN", "inventoryId": "aYFPXTfL", "qty": 75, "serverCustomAttributes": {"0NbxNOja": {}, "e1ntEGHd": {}, "NWVRwOMT": {}}, "slotId": "9CC4TZjC", "slotUsed": 38, "source": "ECOMMERCE", "sourceItemId": "FIuJHOjm", "tags": ["l702SA3p", "6bFwVeS3", "jTFHc9bt"], "toSpecificInventory": true, "type": "FnQiquBx"}], "removeItems": [{"inventoryId": "dyMEbfcC", "slotId": "uGDtEngh", "sourceItemId": "w03VIBNf"}, {"inventoryId": "co18hBLN", "slotId": "3cbrJihm", "sourceItemId": "uPDqUN62"}, {"inventoryId": "gzO5mcGa", "slotId": "NTBl9T92", "sourceItemId": "LkOHmJQF"}], "targetUserId": "97cDbKFA", "updateItems": [{"customAttributes": {"o25t2KpJ": {}, "TCvBQGTi": {}, "cL5rC2jl": {}}, "inventoryId": "XqVFgJgS", "serverCustomAttributes": {"AA3AjlcJ": {}, "yaW4Tyx5": {}, "f5Yn2TkQ": {}}, "slotId": "6EvwyQhd", "sourceItemId": "uwSYbjGP", "tags": ["VQpqrqGc", "KVyCtGWJ", "oN2EOTxr"], "type": "Jc1MmM2f"}, {"customAttributes": {"FlOlN4Xp": {}, "NIE9vwas": {}, "ysmQXLR9": {}}, "inventoryId": "yMa3iz8O", "serverCustomAttributes": {"IRMUvrkd": {}, "0kUUELvJ": {}, "YXzNqd97": {}}, "slotId": "SiT4wLzC", "sourceItemId": "LX1UduSV", "tags": ["2luHm774", "sXEGbVgR", "fHrRGGnB"], "type": "cMij6ybM"}, {"customAttributes": {"ggQyZE9h": {}, "ldE82Mxa": {}, "goVXjuIq": {}}, "inventoryId": "HueWPWdq", "serverCustomAttributes": {"0IEPUskk": {}, "HrQkpJ9B": {}, "0m1ZdZoA": {}}, "slotId": "YUX4e4PB", "sourceItemId": "768OFA5z", "tags": ["qErug3lf", "AVgXjcAp", "6yM4kk9r"], "type": "NptifspP"}]}, {"consumeItems": [{"dateRangeValidation": false, "inventoryId": "hETPWswo", "options": ["9tV8Bi9X", "osDFGymK", "82Kb9Wmu"], "qty": 45, "slotId": "YwjsSRyl", "sourceItemId": "Upq5KbGq"}, {"dateRangeValidation": false, "inventoryId": "3dp0TXMJ", "options": ["J6gibCD1", "QrBNzA1x", "oqlTExut"], "qty": 29, "slotId": "cmzzGacC", "sourceItemId": "ACiBXsD5"}, {"dateRangeValidation": true, "inventoryId": "QHEfX7lH", "options": ["tOWMI35F", "mFQwXzjI", "tlt8sk2U"], "qty": 97, "slotId": "LBCg2JuN", "sourceItemId": "RouxxF6i"}], "createItems": [{"customAttributes": {"57kggPTc": {}, "T8RQpQz6": {}, "j3ok56Z5": {}}, "inventoryConfigurationCode": "L6ms6knR", "inventoryId": "py6SdISM", "qty": 90, "serverCustomAttributes": {"8mm2gdbH": {}, "d0lyfRiJ": {}, "oTds7de3": {}}, "slotId": "7yA0D37o", "slotUsed": 28, "source": "ECOMMERCE", "sourceItemId": "X1xCpoop", "tags": ["y4FJQnam", "bMWbk9Fl", "l2kUHHhm"], "toSpecificInventory": false, "type": "Tklw10eS"}, {"customAttributes": {"OPivHaLe": {}, "TnHvwCZt": {}, "9Jn8kbr3": {}}, "inventoryConfigurationCode": "kLy7HD90", "inventoryId": "bq858qFL", "qty": 61, "serverCustomAttributes": {"DN7hN2AU": {}, "a3yXItD7": {}, "xBiSrcyC": {}}, "slotId": "mxUofrUW", "slotUsed": 82, "source": "OTHER", "sourceItemId": "xVpR6OEu", "tags": ["PyPAJanU", "xkPgMuNQ", "0a2May6E"], "toSpecificInventory": true, "type": "m6WVEuLS"}, {"customAttributes": {"9O2hZfGY": {}, "ZWW3EREq": {}, "N713BOwP": {}}, "inventoryConfigurationCode": "qv70xVjD", "inventoryId": "eDGVUmi9", "qty": 38, "serverCustomAttributes": {"M5VszhcR": {}, "iPYSnGzX": {}, "EpZWzfXG": {}}, "slotId": "XbBYBgQf", "slotUsed": 88, "source": "ECOMMERCE", "sourceItemId": "VzoKlz2h", "tags": ["VT6by55m", "LK4rWGcI", "vC6AqDRf"], "toSpecificInventory": true, "type": "hGXYsO3V"}], "removeItems": [{"inventoryId": "HKTX6Nir", "slotId": "aJtqzGGe", "sourceItemId": "Z075oJ0i"}, {"inventoryId": "u3W4t3Kk", "slotId": "0UuxRKSz", "sourceItemId": "6t6P6mSA"}, {"inventoryId": "E5chRd1I", "slotId": "0Q0ZOYUd", "sourceItemId": "DtszyQw8"}], "targetUserId": "a7PgZqKW", "updateItems": [{"customAttributes": {"WtyexkpM": {}, "uhX7AnCp": {}, "UhTh3BVZ": {}}, "inventoryId": "lzgHkCdZ", "serverCustomAttributes": {"43aq4AA2": {}, "DTEIMMey": {}, "MXbx3c05": {}}, "slotId": "Ny3trprY", "sourceItemId": "fr6NIifM", "tags": ["MZr1Xzw5", "RFSXQJRO", "AmV6r0jK"], "type": "KEHeLuQ4"}, {"customAttributes": {"U76LlWWX": {}, "dk8V7mSd": {}, "AtwvsuOd": {}}, "inventoryId": "ApTR2cbH", "serverCustomAttributes": {"WcPljqE8": {}, "q8u6BRCs": {}, "47PKpbCW": {}}, "slotId": "hCjemObc", "sourceItemId": "FPQlqdnf", "tags": ["xxMmNvOW", "YbSQpkn3", "aUZI0FBc"], "type": "5gDIZ8b0"}, {"customAttributes": {"f3SWUmnW": {}, "B8FiJ41m": {}, "Acqly2Lo": {}}, "inventoryId": "ONP7cCj8", "serverCustomAttributes": {"2UswRc3m": {}, "lgW5iL7i": {}, "A97oBqTF": {}}, "slotId": "9P1JBQoh", "sourceItemId": "FJXlA8Uo", "tags": ["8GCBEBuf", "iIQKslU4", "bDHe6Dnb"], "type": "JNDO8say"}]}], "requestId": "c9j65gv1"}' \
    > test.out 2>&1
eval_tap $? 2 'AdminCreateChainingOperations' test.out

#- 3 AdminListIntegrationConfigurations
./ng net.accelbyte.sdk.cli.Main inventory adminListIntegrationConfigurations \
    --namespace "$AB_NAMESPACE" \
    --limit '65' \
    --offset '51' \
    --sortBy 'createdAt:asc' \
    > test.out 2>&1
eval_tap $? 3 'AdminListIntegrationConfigurations' test.out

#- 4 AdminCreateIntegrationConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminCreateIntegrationConfiguration \
    --namespace "$AB_NAMESPACE" \
    --body '{"mapItemType": ["m7V6gjYS", "AG9Wp2CH", "Ilpsdios"], "serviceName": "X7NcWUS6", "targetInventoryCode": "T1FAwO9Q"}' \
    > test.out 2>&1
eval_tap $? 4 'AdminCreateIntegrationConfiguration' test.out

#- 5 AdminUpdateIntegrationConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateIntegrationConfiguration \
    --integrationConfigurationId 'boEqogKh' \
    --namespace "$AB_NAMESPACE" \
    --body '{"mapItemType": ["zggZnIYk", "gDfeQmxl", "IUoqb2cB"], "serviceName": "n4OEtjaa", "targetInventoryCode": "9q9e65ZY"}' \
    > test.out 2>&1
eval_tap $? 5 'AdminUpdateIntegrationConfiguration' test.out

#- 6 AdminUpdateStatusIntegrationConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateStatusIntegrationConfiguration \
    --integrationConfigurationId 'YmeWo0Ts' \
    --namespace "$AB_NAMESPACE" \
    --body '{"status": "INIT"}' \
    > test.out 2>&1
eval_tap $? 6 'AdminUpdateStatusIntegrationConfiguration' test.out

#- 7 AdminListInventories
./ng net.accelbyte.sdk.cli.Main inventory adminListInventories \
    --namespace "$AB_NAMESPACE" \
    --inventoryConfigurationCode '9OTyKp23' \
    --limit '76' \
    --offset '67' \
    --sortBy 'inventoryConfigurationCode:asc' \
    --userId 'VqXs9N0H' \
    > test.out 2>&1
eval_tap $? 7 'AdminListInventories' test.out

#- 8 AdminCreateInventory
./ng net.accelbyte.sdk.cli.Main inventory adminCreateInventory \
    --namespace "$AB_NAMESPACE" \
    --body '{"inventoryConfigurationCode": "n4d0EXEn", "userId": "OGXMQl4y"}' \
    > test.out 2>&1
eval_tap $? 8 'AdminCreateInventory' test.out

#- 9 AdminGetInventory
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventory \
    --inventoryId 'D0atb7h3' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'AdminGetInventory' test.out

#- 10 AdminUpdateInventory
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateInventory \
    --inventoryId 'NQGKCgZQ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"incMaxSlots": 47}' \
    > test.out 2>&1
eval_tap $? 10 'AdminUpdateInventory' test.out

#- 11 DeleteInventory
./ng net.accelbyte.sdk.cli.Main inventory deleteInventory \
    --inventoryId 'LZEGKWkW' \
    --namespace "$AB_NAMESPACE" \
    --body '{"message": "9UjcjQpB"}' \
    > test.out 2>&1
eval_tap $? 11 'DeleteInventory' test.out

#- 12 AdminListItems
./ng net.accelbyte.sdk.cli.Main inventory adminListItems \
    --inventoryId 'VSuOnLVR' \
    --namespace "$AB_NAMESPACE" \
    --limit '30' \
    --offset '45' \
    --sortBy 'updatedAt:desc' \
    --sourceItemId 'ySDuobej' \
    --tags '6DM6QWBF' \
    > test.out 2>&1
eval_tap $? 12 'AdminListItems' test.out

#- 13 AdminGetInventoryItem
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventoryItem \
    --inventoryId 'IvuL6QYf' \
    --namespace "$AB_NAMESPACE" \
    --slotId 'GGYAUQua' \
    --sourceItemId 'qJaIV3cH' \
    > test.out 2>&1
eval_tap $? 13 'AdminGetInventoryItem' test.out

#- 14 AdminListInventoryConfigurations
./ng net.accelbyte.sdk.cli.Main inventory adminListInventoryConfigurations \
    --namespace "$AB_NAMESPACE" \
    --code 'Qscb3t5D' \
    --limit '59' \
    --offset '98' \
    --sortBy 'updatedAt:desc' \
    > test.out 2>&1
eval_tap $? 14 'AdminListInventoryConfigurations' test.out

#- 15 AdminCreateInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminCreateInventoryConfiguration \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "X9TvA3sb", "description": "jpmBoyEc", "initialMaxSlots": 21, "maxInstancesPerUser": 97, "maxUpgradeSlots": 32, "name": "ZOz7NrgK"}' \
    > test.out 2>&1
eval_tap $? 15 'AdminCreateInventoryConfiguration' test.out

#- 16 AdminGetInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventoryConfiguration \
    --inventoryConfigurationId 'SXtqKp13' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'AdminGetInventoryConfiguration' test.out

#- 17 AdminUpdateInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateInventoryConfiguration \
    --inventoryConfigurationId 'pXVIoX6F' \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "a8Cxh1j1", "description": "rpR1O0KW", "initialMaxSlots": 72, "maxInstancesPerUser": 82, "maxUpgradeSlots": 70, "name": "2jvW2zYv"}' \
    > test.out 2>&1
eval_tap $? 17 'AdminUpdateInventoryConfiguration' test.out

#- 18 AdminDeleteInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteInventoryConfiguration \
    --inventoryConfigurationId 'a2k217V7' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminDeleteInventoryConfiguration' test.out

#- 19 AdminListItemTypes
./ng net.accelbyte.sdk.cli.Main inventory adminListItemTypes \
    --namespace "$AB_NAMESPACE" \
    --limit '86' \
    --offset '4' \
    --sortBy 'createdAt:asc' \
    > test.out 2>&1
eval_tap $? 19 'AdminListItemTypes' test.out

#- 20 AdminCreateItemType
./ng net.accelbyte.sdk.cli.Main inventory adminCreateItemType \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "gcQ7Nq97"}' \
    > test.out 2>&1
eval_tap $? 20 'AdminCreateItemType' test.out

#- 21 AdminDeleteItemType
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteItemType \
    --itemTypeName 'FQKbkcXB' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'AdminDeleteItemType' test.out

#- 22 AdminListTags
./ng net.accelbyte.sdk.cli.Main inventory adminListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '61' \
    --offset '31' \
    --owner 'bGphEVxT' \
    --sortBy 'name:asc' \
    > test.out 2>&1
eval_tap $? 22 'AdminListTags' test.out

#- 23 AdminCreateTag
./ng net.accelbyte.sdk.cli.Main inventory adminCreateTag \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "1XCibj49", "owner": "CLIENT"}' \
    > test.out 2>&1
eval_tap $? 23 'AdminCreateTag' test.out

#- 24 AdminDeleteTag
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteTag \
    --namespace "$AB_NAMESPACE" \
    --tagName '5EUtLe9T' \
    > test.out 2>&1
eval_tap $? 24 'AdminDeleteTag' test.out

#- 25 AdminConsumeUserItem
./ng net.accelbyte.sdk.cli.Main inventory adminConsumeUserItem \
    --inventoryId 'NzYkQoUs' \
    --namespace "$AB_NAMESPACE" \
    --userId 'pYfFXmK9' \
    --dateRangeValidation 'ow9RNlxt' \
    --body '{"options": ["OoRKUFMA", "bVH3CciM", "G2NUTPjR"], "qty": 83, "slotId": "z4X2mqs2", "sourceItemId": "kDiKQ7TU"}' \
    > test.out 2>&1
eval_tap $? 25 'AdminConsumeUserItem' test.out

#- 26 AdminBulkUpdateMyItems
./ng net.accelbyte.sdk.cli.Main inventory adminBulkUpdateMyItems \
    --inventoryId 'xcdmrTI0' \
    --namespace "$AB_NAMESPACE" \
    --userId 'KzGZZv6g' \
    --body '[{"customAttributes": {"LEsd3PZT": {}, "6BNBdeEx": {}, "YH4P9j6k": {}}, "serverCustomAttributes": {"Kw2ZQ0Sa": {}, "EOwh6N4l": {}, "pCVABIme": {}}, "slotId": "QIodWKWm", "sourceItemId": "Akgh4d5E", "tags": ["0Pz50A4G", "jYqkLZIH", "di29MkBx"], "type": "7Un4fdel"}, {"customAttributes": {"d9jE1ChV": {}, "ODI7XHwy": {}, "hxK9XfqT": {}}, "serverCustomAttributes": {"jpWjynb9": {}, "VvitxLrv": {}, "RUcIjjgU": {}}, "slotId": "x3W52IXB", "sourceItemId": "1VQi905P", "tags": ["XUI9CrI5", "okZ7pSs7", "AOGKMtuw"], "type": "wvLHUHii"}, {"customAttributes": {"qTbMoDGZ": {}, "PIRnsa6l": {}, "TNraQRBC": {}}, "serverCustomAttributes": {"y5Nt1lMf": {}, "3FQ4E790": {}, "6Jg76BIB": {}}, "slotId": "zN70NXHE", "sourceItemId": "KHmQ2BCn", "tags": ["AoqxDwyH", "5bOINsLQ", "5Ehh9QVS"], "type": "V0CT0ZNd"}]' \
    > test.out 2>&1
eval_tap $? 26 'AdminBulkUpdateMyItems' test.out

#- 27 AdminSaveItemToInventory
./ng net.accelbyte.sdk.cli.Main inventory adminSaveItemToInventory \
    --inventoryId 'sSxlvC3z' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Uyf1jfV2' \
    --body '{"customAttributes": {"6sv7VnAD": {}, "olXPy2IU": {}, "02Ws3p3Z": {}}, "qty": 65, "serverCustomAttributes": {"usUXggtz": {}, "9ikfINrH": {}, "48v5V8E8": {}}, "slotId": "Ty2rdD9W", "slotUsed": 45, "source": "OTHER", "sourceItemId": "YnvXIArR", "tags": ["rlTV0VVY", "FmgHj4Xg", "L6IdWIZh"], "type": "5wIEHxMW"}' \
    > test.out 2>&1
eval_tap $? 27 'AdminSaveItemToInventory' test.out

#- 28 AdminBulkRemoveItems
./ng net.accelbyte.sdk.cli.Main inventory adminBulkRemoveItems \
    --inventoryId '9rF7yGaC' \
    --namespace "$AB_NAMESPACE" \
    --userId 'R6R0N4kj' \
    --body '[{"slotId": "KpFKCiPr", "sourceItemId": "SgF2qKSH"}, {"slotId": "yiH4nQew", "sourceItemId": "U3XLto9U"}, {"slotId": "583h3WuK", "sourceItemId": "IXaTSG1m"}]' \
    > test.out 2>&1
eval_tap $? 28 'AdminBulkRemoveItems' test.out

#- 29 AdminBulkSaveItemToInventory
./ng net.accelbyte.sdk.cli.Main inventory adminBulkSaveItemToInventory \
    --inventoryId 'JY4kt466' \
    --namespace "$AB_NAMESPACE" \
    --userId 'UsMwFIvf' \
    --body '[{"customAttributes": {"T3nyEa0Q": {}, "1v9D5FJg": {}, "9mPW6iAr": {}}, "qty": 15, "serverCustomAttributes": {"MtTAszHg": {}, "e7Qsb8Iu": {}, "UGpyDz53": {}}, "slotId": "x7p40AWk", "slotUsed": 94, "source": "ECOMMERCE", "sourceItemId": "SucyTZV7", "tags": ["oLMLPME2", "6BXmepGZ", "iAQo0ECT"], "type": "UZmmCe2N"}, {"customAttributes": {"el6Qou8u": {}, "525GoVxD": {}, "LdeJWXvf": {}}, "qty": 69, "serverCustomAttributes": {"u8BMtvAU": {}, "AWM5Syyo": {}, "0tNguDWE": {}}, "slotId": "cWGE5Rqw", "slotUsed": 7, "source": "ECOMMERCE", "sourceItemId": "7uA29VM2", "tags": ["bEVEbUM2", "jct4QCcF", "cYnCZKtH"], "type": "6DjZIgbT"}, {"customAttributes": {"RLDlMtDH": {}, "qO7aWrXj": {}, "RFlPeoTK": {}}, "qty": 7, "serverCustomAttributes": {"Bw2aiX9E": {}, "eS4BMqxV": {}, "9EDwPwGG": {}}, "slotId": "wxIM5eFA", "slotUsed": 11, "source": "ECOMMERCE", "sourceItemId": "v7JXLBjl", "tags": ["RSIti8XF", "Npqrywga", "Zl9BoQqY"], "type": "QSXwMS5f"}]' \
    > test.out 2>&1
eval_tap $? 29 'AdminBulkSaveItemToInventory' test.out

#- 30 AdminUpdateUserInventoriesByInventoryCode
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateUserInventoriesByInventoryCode \
    --inventoryConfigurationCode 'bajGFLED' \
    --namespace "$AB_NAMESPACE" \
    --userId 'rjTr8OJ4' \
    --body '{"incMaxSlots": 89}' \
    > test.out 2>&1
eval_tap $? 30 'AdminUpdateUserInventoriesByInventoryCode' test.out

#- 31 AdminSaveItem
./ng net.accelbyte.sdk.cli.Main inventory adminSaveItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'HuNQQRZX' \
    --body '{"customAttributes": {"UYHUQIkw": {}, "6UbOrNvw": {}, "vn9STWak": {}}, "inventoryConfigurationCode": "Z5Hz0L2Q", "qty": 2, "serverCustomAttributes": {"MRLsxWf8": {}, "11nCwR01": {}, "tae6LR9p": {}}, "slotId": "rlzaQLx9", "slotUsed": 20, "source": "OTHER", "sourceItemId": "98nif8hy", "tags": ["60EoHu6P", "LRUG57yC", "8WGovMHf"], "type": "ibELJXYj"}' \
    > test.out 2>&1
eval_tap $? 31 'AdminSaveItem' test.out

#- 32 AdminBulkSaveItem
./ng net.accelbyte.sdk.cli.Main inventory adminBulkSaveItem \
    --namespace "$AB_NAMESPACE" \
    --userId '7PG6GWIY' \
    --body '[{"customAttributes": {"8y2vpMB5": {}, "uxzDaACF": {}, "gqclTtBZ": {}}, "inventoryConfigurationCode": "bj8NYNTy", "qty": 77, "serverCustomAttributes": {"qFdcljiz": {}, "hrc4OiV2": {}, "hg1uxmK6": {}}, "slotId": "69qR9wL2", "slotUsed": 56, "source": "ECOMMERCE", "sourceItemId": "gNmCZYxw", "tags": ["aY7cyzZN", "oRvGRbnO", "s4jHJpP3"], "type": "VjlRXWL5"}, {"customAttributes": {"gC1GTwoP": {}, "9ZL2Ri7f": {}, "FEh7senU": {}}, "inventoryConfigurationCode": "8bppMMZi", "qty": 1, "serverCustomAttributes": {"kZzUGYdd": {}, "vf66o5W0": {}, "AJ7ywOXF": {}}, "slotId": "W0w7cIBK", "slotUsed": 36, "source": "OTHER", "sourceItemId": "yNU3dNQQ", "tags": ["UtwRsGIx", "JBSL3luA", "JHqqyAXQ"], "type": "NkabzJxy"}, {"customAttributes": {"7dqmyW4m": {}, "VgV6tWAh": {}, "Uc337stU": {}}, "inventoryConfigurationCode": "I1mIEKii", "qty": 21, "serverCustomAttributes": {"hb7q2J9H": {}, "dYei0LSD": {}, "l0IRUh8u": {}}, "slotId": "ZPrMppkD", "slotUsed": 9, "source": "OTHER", "sourceItemId": "ywi7pex0", "tags": ["asVwUgmQ", "YD4Fcfqr", "K8BtDp9h"], "type": "svSZsp9E"}]' \
    > test.out 2>&1
eval_tap $? 32 'AdminBulkSaveItem' test.out

#- 33 AdminSyncUserEntitlements
./ng net.accelbyte.sdk.cli.Main inventory adminSyncUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId '3jLUcBMS' \
    > test.out 2>&1
eval_tap $? 33 'AdminSyncUserEntitlements' test.out

#- 34 AdminPurchasable
./ng net.accelbyte.sdk.cli.Main inventory adminPurchasable \
    --namespace "$AB_NAMESPACE" \
    --userId 'LmAvvtQJ' \
    --body '{"entitlementType": "reFKDvr0", "inventoryConfig": {"slotUsed": 5}, "itemId": "BE3F4VjS", "itemType": "uJ7Fnyg3", "items": [{"bundledQty": 88, "entitlementType": "fNXxi3w4", "inventoryConfig": {"slotUsed": 89}, "itemId": "gToCT23p", "itemType": "oEDEEf3W", "sku": "q1geNfLM", "stackable": true, "useCount": 76}, {"bundledQty": 64, "entitlementType": "sGBb6ak3", "inventoryConfig": {"slotUsed": 49}, "itemId": "AC4QsKSm", "itemType": "loFPH5ap", "sku": "4m8WMniN", "stackable": false, "useCount": 23}, {"bundledQty": 65, "entitlementType": "pbDJ65t6", "inventoryConfig": {"slotUsed": 74}, "itemId": "yTphnb0l", "itemType": "LHE43nZC", "sku": "wgbtVcK0", "stackable": false, "useCount": 80}], "quantity": 82, "sku": "D1wXolUI", "stackable": false, "useCount": 90}' \
    > test.out 2>&1
eval_tap $? 34 'AdminPurchasable' test.out

#- 35 PublicListInventoryConfigurations
./ng net.accelbyte.sdk.cli.Main inventory publicListInventoryConfigurations \
    --namespace "$AB_NAMESPACE" \
    --code 'FgG2Oqnd' \
    --limit '61' \
    --offset '94' \
    --sortBy 'updatedAt:asc' \
    > test.out 2>&1
eval_tap $? 35 'PublicListInventoryConfigurations' test.out

#- 36 PublicListItemTypes
./ng net.accelbyte.sdk.cli.Main inventory publicListItemTypes \
    --namespace "$AB_NAMESPACE" \
    --limit '4' \
    --offset '43' \
    --sortBy 'name:asc' \
    > test.out 2>&1
eval_tap $? 36 'PublicListItemTypes' test.out

#- 37 PublicListTags
./ng net.accelbyte.sdk.cli.Main inventory publicListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '59' \
    --offset '50' \
    --sortBy 'createdAt:asc' \
    > test.out 2>&1
eval_tap $? 37 'PublicListTags' test.out

#- 38 PublicListInventories
./ng net.accelbyte.sdk.cli.Main inventory publicListInventories \
    --namespace "$AB_NAMESPACE" \
    --inventoryConfigurationCode 'SFDESYIA' \
    --limit '80' \
    --offset '84' \
    --sortBy 'updatedAt:asc' \
    > test.out 2>&1
eval_tap $? 38 'PublicListInventories' test.out

#- 39 PublicConsumeMyItem
./ng net.accelbyte.sdk.cli.Main inventory publicConsumeMyItem \
    --inventoryId '6IvaDMbE' \
    --namespace "$AB_NAMESPACE" \
    --body '{"options": ["CpnG9waw", "vPd6pgiP", "xxqzrw8x"], "qty": 70, "slotId": "1LMuxiNV", "sourceItemId": "vQOW70RZ"}' \
    > test.out 2>&1
eval_tap $? 39 'PublicConsumeMyItem' test.out

#- 40 PublicListItems
./ng net.accelbyte.sdk.cli.Main inventory publicListItems \
    --inventoryId 'pl0TWFVx' \
    --namespace "$AB_NAMESPACE" \
    --limit '36' \
    --offset '70' \
    --sortBy 'updatedAt:asc' \
    --sourceItemId 'eFchZpxj' \
    --tags 'VqS4C0J2' \
    > test.out 2>&1
eval_tap $? 40 'PublicListItems' test.out

#- 41 PublicBulkUpdateMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicBulkUpdateMyItems \
    --inventoryId 'FOS81sOs' \
    --namespace "$AB_NAMESPACE" \
    --body '[{"customAttributes": {"hz2IQ9ex": {}, "SZZKGCWH": {}, "BA73Zzjf": {}}, "slotId": "ZGYpWslb", "sourceItemId": "d7g7S0Xe", "tags": ["addKopba", "kPbZtDuO", "PXNRJjFP"]}, {"customAttributes": {"CpBWAlR1": {}, "3YpEcdHH": {}, "RPaMvetb": {}}, "slotId": "thbPIVAP", "sourceItemId": "w1wyWyQS", "tags": ["BVKsDTuq", "Ov9gmY3m", "440iGhmJ"]}, {"customAttributes": {"dsQ0LHMp": {}, "B2nqvzod": {}, "MTynA0qF": {}}, "slotId": "pTqDMKrG", "sourceItemId": "TwIxuNXc", "tags": ["YNXFemeZ", "qWtddyfx", "M4Fxq2j3"]}]' \
    > test.out 2>&1
eval_tap $? 41 'PublicBulkUpdateMyItems' test.out

#- 42 PublicBulkRemoveMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicBulkRemoveMyItems \
    --inventoryId 'DLAgCyWW' \
    --namespace "$AB_NAMESPACE" \
    --body '[{"slotId": "WYXuysgn", "sourceItemId": "ZmnYRaA8"}, {"slotId": "1rIbBTrx", "sourceItemId": "7OQEzR8B"}, {"slotId": "NnlS7L3v", "sourceItemId": "neXwEba3"}]' \
    > test.out 2>&1
eval_tap $? 42 'PublicBulkRemoveMyItems' test.out

#- 43 PublicMoveMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicMoveMyItems \
    --inventoryId 'ZF3QtnHL' \
    --namespace "$AB_NAMESPACE" \
    --body '{"items": [{"qty": 65, "slotId": "QOHUQNC2", "sourceItemId": "fNLHS4Xm"}, {"qty": 65, "slotId": "CBKkBLTI", "sourceItemId": "phZnGGek"}, {"qty": 65, "slotId": "FApaoGQ2", "sourceItemId": "CUMwm9XI"}], "srcInventoryId": "mA5JIb3W"}' \
    > test.out 2>&1
eval_tap $? 43 'PublicMoveMyItems' test.out

#- 44 PublicGetItem
./ng net.accelbyte.sdk.cli.Main inventory publicGetItem \
    --inventoryId '6sVJkGEm' \
    --namespace "$AB_NAMESPACE" \
    --slotId 'rfk3haes' \
    --sourceItemId 'krJGQhkJ' \
    > test.out 2>&1
eval_tap $? 44 'PublicGetItem' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
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
    --body '{"message": "B7XsiBQD", "operations": [{"consumeItems": [{"dateRangeValidation": true, "inventoryId": "bs13Pzo9", "options": ["wqowirij", "9t0Caexw", "1OwfuJBZ"], "qty": 12, "slotId": "ylxuFTNF", "sourceItemId": "c6BFanIt"}, {"dateRangeValidation": true, "inventoryId": "HT8PJx3A", "options": ["pXehQCfd", "83lo2VFO", "E5uGB8lC"], "qty": 77, "slotId": "pCjvzKoJ", "sourceItemId": "TZ8deYRR"}, {"dateRangeValidation": true, "inventoryId": "vo8xspTY", "options": ["9vVqNP5V", "oPXVlIbj", "Bz2yS6It"], "qty": 67, "slotId": "21GWVB1O", "sourceItemId": "Y1Liu7sz"}], "createItems": [{"customAttributes": {"Utp9wmDy": {}, "65lVm7tb": {}, "n0BUqo59": {}}, "inventoryConfigurationCode": "elT5bssy", "inventoryId": "R1maCJhS", "qty": 52, "serverCustomAttributes": {"b5xj14HM": {}, "8JFwnoR6": {}, "fWdjqNpN": {}}, "slotId": "niSXRgff", "slotUsed": 56, "source": "ECOMMERCE", "sourceItemId": "ewf6eHtE", "tags": ["qkerQaK7", "jINWJrg7", "4i9PLyNh"], "toSpecificInventory": false, "type": "IOrBb0GL"}, {"customAttributes": {"dICfgfz4": {}, "HG0EpP1e": {}, "2Ok8ixXb": {}}, "inventoryConfigurationCode": "uxtGTSBx", "inventoryId": "85cW3dB5", "qty": 77, "serverCustomAttributes": {"iXCeJ5ZM": {}, "czfMTkzV": {}, "nREFPBlO": {}}, "slotId": "TQFM7zQb", "slotUsed": 82, "source": "OTHER", "sourceItemId": "Y0odu8Zl", "tags": ["sjgIs8cJ", "UUtMEr1n", "UPyT04Oe"], "toSpecificInventory": true, "type": "VcXp33Fn"}, {"customAttributes": {"IW7UtlDC": {}, "Ua0WQL0o": {}, "vff0VIGL": {}}, "inventoryConfigurationCode": "qHrntsqe", "inventoryId": "z532qocp", "qty": 88, "serverCustomAttributes": {"3SSpArC5": {}, "fKWdP9mE": {}, "FrYa6DIl": {}}, "slotId": "KE7nOWbJ", "slotUsed": 96, "source": "ECOMMERCE", "sourceItemId": "amalBtzE", "tags": ["5VSkghOL", "XAEHjch4", "C0TB1uAV"], "toSpecificInventory": true, "type": "h60BZg11"}], "removeItems": [{"inventoryId": "zbFV1Fww", "slotId": "lCa71eip", "sourceItemId": "qptXpeqn"}, {"inventoryId": "RTev0KoM", "slotId": "DtIaQLBq", "sourceItemId": "wR88n5li"}, {"inventoryId": "YryFlvak", "slotId": "u3kaaMaD", "sourceItemId": "klWe5nyC"}], "targetUserId": "u4llDF77", "updateItems": [{"customAttributes": {"Xkh26NyH": {}, "gzmuuLiY": {}, "LO51fQWp": {}}, "inventoryId": "S3srQqxV", "serverCustomAttributes": {"6yyqTWp6": {}, "sMcCbwL8": {}, "e5Y2OwEP": {}}, "slotId": "yaBwXFjT", "sourceItemId": "guoDR1H6", "tags": ["3vvF7dY1", "kYblOHYp", "IUFcAvYf"], "type": "y16XNQZT"}, {"customAttributes": {"MFpFqadj": {}, "0RfvqXTg": {}, "yUIoZQtO": {}}, "inventoryId": "oKahRSgV", "serverCustomAttributes": {"JIFdRInP": {}, "Oqp9fs8x": {}, "XmISrVBB": {}}, "slotId": "c5WFQh4J", "sourceItemId": "Ti7BSuKK", "tags": ["iFSboSWp", "hYGDHTGP", "1vOJzuZk"], "type": "DF7z5cHE"}, {"customAttributes": {"QOYNSy2B": {}, "wLE4K9Dv": {}, "CeZBuXwt": {}}, "inventoryId": "k7Kz3994", "serverCustomAttributes": {"g77c2Ncd": {}, "uDrkR0Ne": {}, "ZjjaKnkI": {}}, "slotId": "BlByPRTc", "sourceItemId": "l5ONbmaC", "tags": ["1bx36rAE", "fA7oSC47", "wrreSw9G"], "type": "K9CkJdsZ"}]}, {"consumeItems": [{"dateRangeValidation": true, "inventoryId": "qxEoKwiO", "options": ["mHswhck2", "gGt3tf4X", "1BiEnLOy"], "qty": 97, "slotId": "6jKCDMsE", "sourceItemId": "bdjfXbGb"}, {"dateRangeValidation": false, "inventoryId": "Mo9Dad5S", "options": ["eMtNuxma", "UtfwhrPp", "RmalY6VB"], "qty": 100, "slotId": "QlsVz16L", "sourceItemId": "d3IceMHW"}, {"dateRangeValidation": true, "inventoryId": "XkI0Yr9h", "options": ["IVwwGDnZ", "SuHSQUXt", "3gcB6KIR"], "qty": 63, "slotId": "15E3E77x", "sourceItemId": "9f7CnOCB"}], "createItems": [{"customAttributes": {"wBuXtxZU": {}, "Q5XQqrBh": {}, "jcj1Nif0": {}}, "inventoryConfigurationCode": "roW5evkD", "inventoryId": "u3HsXcUU", "qty": 49, "serverCustomAttributes": {"EddImVZw": {}, "lG5YPsdD": {}, "0QfcYVZ0": {}}, "slotId": "Bee5f9v8", "slotUsed": 12, "source": "OTHER", "sourceItemId": "oAGJ4Eja", "tags": ["2KJBiogc", "Ta9Oyjyt", "Q7IZrhRP"], "toSpecificInventory": true, "type": "xJCdB4cR"}, {"customAttributes": {"nQEhQdrP": {}, "YDaXOYNn": {}, "SErnCX76": {}}, "inventoryConfigurationCode": "guug6VKN", "inventoryId": "APSxWZkM", "qty": 54, "serverCustomAttributes": {"v7GLejh1": {}, "GG5XFVSI": {}, "QZo8Stlg": {}}, "slotId": "hprl3kzw", "slotUsed": 96, "source": "OTHER", "sourceItemId": "ztFxcEWb", "tags": ["PIlxKuFc", "1kAWfRlR", "ELgGTNBj"], "toSpecificInventory": true, "type": "opNRvNph"}, {"customAttributes": {"gtoYXA73": {}, "x3ivbL9O": {}, "L9pQYIN9": {}}, "inventoryConfigurationCode": "huwi5sM1", "inventoryId": "o9DDEJ4x", "qty": 43, "serverCustomAttributes": {"ZaRzG8iy": {}, "vYzDOXev": {}, "nZOIHgm7": {}}, "slotId": "Ygl01MqD", "slotUsed": 8, "source": "ECOMMERCE", "sourceItemId": "rK3mtyPT", "tags": ["8fCvGaTv", "yG1PxrwX", "pK6lGap0"], "toSpecificInventory": false, "type": "83UjJCJj"}], "removeItems": [{"inventoryId": "HTMmdZjW", "slotId": "SD6zP1dQ", "sourceItemId": "PiVvNw0G"}, {"inventoryId": "0SrtdQhw", "slotId": "YATBtz7x", "sourceItemId": "wsm1HWBW"}, {"inventoryId": "CIzXwC4B", "slotId": "R1m7reK9", "sourceItemId": "DWct4U0n"}], "targetUserId": "bpqMjx2o", "updateItems": [{"customAttributes": {"0uiqcUV0": {}, "fGDXEzbm": {}, "VeHEwy3u": {}}, "inventoryId": "Rehm4k9t", "serverCustomAttributes": {"eYIHzC45": {}, "upRofG5v": {}, "g5J8eI9e": {}}, "slotId": "ZZRTtiMN", "sourceItemId": "Gi8lFkVT", "tags": ["AuOY27Cc", "xdpCyT0r", "OGP8BSln"], "type": "O7JNN57h"}, {"customAttributes": {"BkCuvcKx": {}, "t1b75w2H": {}, "71Yb9BfU": {}}, "inventoryId": "BDy19cmy", "serverCustomAttributes": {"ZdBxxjfn": {}, "9BSHB6bS": {}, "edUpmxEa": {}}, "slotId": "iaXdgUdt", "sourceItemId": "WvSyEaU6", "tags": ["w1QWfuKe", "3bnArfWa", "z1sBPDqg"], "type": "kG3ufBua"}, {"customAttributes": {"NJEyeRDo": {}, "66CDmsKt": {}, "wyyiAKGn": {}}, "inventoryId": "l7M7PtjW", "serverCustomAttributes": {"5N2ydI9N": {}, "c9sbJy01": {}, "VfFkysjO": {}}, "slotId": "ai1OESjO", "sourceItemId": "TiPS7vhP", "tags": ["7HOBERA3", "Q6AuFNDs", "AGBfCkgi"], "type": "nd21jFay"}]}, {"consumeItems": [{"dateRangeValidation": false, "inventoryId": "qv4TbMGx", "options": ["Iql8KhsP", "G09OxnBQ", "dugGM465"], "qty": 26, "slotId": "J2z8ZMp0", "sourceItemId": "AXl5nP52"}, {"dateRangeValidation": true, "inventoryId": "Y8DsZh15", "options": ["1E58gKNS", "Oc5C8g4P", "WgxXkJXz"], "qty": 7, "slotId": "5TF7DLRS", "sourceItemId": "r3GswS7Y"}, {"dateRangeValidation": true, "inventoryId": "7igq843j", "options": ["RdUoRclY", "jd7n7f1l", "BmcqzVPv"], "qty": 9, "slotId": "3dpvc7s8", "sourceItemId": "uIELOfQG"}], "createItems": [{"customAttributes": {"R3KUHzza": {}, "SiDxUo1V": {}, "jVzTwi8f": {}}, "inventoryConfigurationCode": "BeDA5HPu", "inventoryId": "4I6AMIsT", "qty": 51, "serverCustomAttributes": {"wp9RgQx4": {}, "smtRkMmr": {}, "Zyb4RR9y": {}}, "slotId": "A1r28wWi", "slotUsed": 23, "source": "OTHER", "sourceItemId": "I8D7vaoQ", "tags": ["tTQuQTXu", "sYxNjl10", "WJBE8V8v"], "toSpecificInventory": true, "type": "FIvTKf41"}, {"customAttributes": {"6TyRChMW": {}, "ufXM8YYD": {}, "wsCGrBWy": {}}, "inventoryConfigurationCode": "xFiqpMGf", "inventoryId": "dFogos6i", "qty": 74, "serverCustomAttributes": {"tBSZ8U0g": {}, "iX8gddxw": {}, "5SbcYXF6": {}}, "slotId": "TLSLfJxW", "slotUsed": 99, "source": "OTHER", "sourceItemId": "DWacNAjF", "tags": ["gZI7AmKE", "jIMTL8Zb", "Xjl6Nv3h"], "toSpecificInventory": false, "type": "ZNtEnAei"}, {"customAttributes": {"w9C0jnDE": {}, "2yppF0rk": {}, "1JOhEEXl": {}}, "inventoryConfigurationCode": "gBCpOMls", "inventoryId": "dYegP9eZ", "qty": 26, "serverCustomAttributes": {"S5ZCbJZw": {}, "LGTIXEWC": {}, "V9z5TOfO": {}}, "slotId": "pv2Tmw0P", "slotUsed": 7, "source": "OTHER", "sourceItemId": "7cgRrG3T", "tags": ["eUVja37b", "EIuTtSSe", "OsJh4t4s"], "toSpecificInventory": true, "type": "sxSQRncp"}], "removeItems": [{"inventoryId": "o7vKD9s8", "slotId": "1uDUZKWv", "sourceItemId": "pzDHuvzK"}, {"inventoryId": "rss4M663", "slotId": "biPVj5R1", "sourceItemId": "bblXBlO6"}, {"inventoryId": "kJJJoa4H", "slotId": "OBgk5zJs", "sourceItemId": "3U6sjmYI"}], "targetUserId": "w5d42sDv", "updateItems": [{"customAttributes": {"Oq0f1VSq": {}, "vg52BJ8S": {}, "6GxkgdzC": {}}, "inventoryId": "BqlkATd7", "serverCustomAttributes": {"oAAH4UoD": {}, "CYqWNeDA": {}, "gPjucycs": {}}, "slotId": "W159sLcg", "sourceItemId": "Ex8Gx0to", "tags": ["LMmnLIT1", "usfb5JwB", "Z38MAqzc"], "type": "RZQ5Vpj6"}, {"customAttributes": {"WQDB6eFc": {}, "SCmBpIZ9": {}, "MJssTTZF": {}}, "inventoryId": "AUyXc5n1", "serverCustomAttributes": {"EqXmxgba": {}, "ugOzOgrj": {}, "skK4vFWH": {}}, "slotId": "2BFyNcog", "sourceItemId": "euZZJnQh", "tags": ["5vRY4raH", "mi9NlEkc", "7dl8D9Rm"], "type": "9RYERDz5"}, {"customAttributes": {"a49lNgi5": {}, "0VLcuiZx": {}, "yPM8pzOk": {}}, "inventoryId": "aqGmaC1L", "serverCustomAttributes": {"pIqTNjsA": {}, "amXicfTE": {}, "ye2Hxm2H": {}}, "slotId": "zCWNM3DO", "sourceItemId": "HeDVooZC", "tags": ["7QNsRYQC", "FxCk7fQS", "RQ6b616T"], "type": "KETi3zVG"}]}], "requestId": "3RDgoLqB"}' \
    > test.out 2>&1
eval_tap $? 2 'AdminCreateChainingOperations' test.out

#- 3 AdminListIntegrationConfigurations
./ng net.accelbyte.sdk.cli.Main inventory adminListIntegrationConfigurations \
    --namespace "$AB_NAMESPACE" \
    --limit '64' \
    --offset '35' \
    --sortBy 'createdAt:asc' \
    > test.out 2>&1
eval_tap $? 3 'AdminListIntegrationConfigurations' test.out

#- 4 AdminCreateIntegrationConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminCreateIntegrationConfiguration \
    --namespace "$AB_NAMESPACE" \
    --body '{"mapItemType": ["h8qrrggV", "KDujOFkn", "uiqG07dL"], "serviceName": "14PP838s", "targetInventoryCode": "KGIrCUTv"}' \
    > test.out 2>&1
eval_tap $? 4 'AdminCreateIntegrationConfiguration' test.out

#- 5 AdminUpdateIntegrationConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateIntegrationConfiguration \
    --integrationConfigurationId 'SjwM667y' \
    --namespace "$AB_NAMESPACE" \
    --body '{"mapItemType": ["arEwJg2o", "nWGOdoef", "tH9MpEg4"], "serviceName": "CGaKeElW", "targetInventoryCode": "AxDJ6vYI"}' \
    > test.out 2>&1
eval_tap $? 5 'AdminUpdateIntegrationConfiguration' test.out

#- 6 AdminUpdateStatusIntegrationConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateStatusIntegrationConfiguration \
    --integrationConfigurationId '5G1brNAv' \
    --namespace "$AB_NAMESPACE" \
    --body '{"status": "TIED"}' \
    > test.out 2>&1
eval_tap $? 6 'AdminUpdateStatusIntegrationConfiguration' test.out

#- 7 AdminListInventories
./ng net.accelbyte.sdk.cli.Main inventory adminListInventories \
    --namespace "$AB_NAMESPACE" \
    --inventoryConfigurationCode 'u28ZJ3Ow' \
    --limit '97' \
    --offset '15' \
    --sortBy 'updatedAt:desc' \
    --userId 'gl1DvV0V' \
    > test.out 2>&1
eval_tap $? 7 'AdminListInventories' test.out

#- 8 AdminCreateInventory
./ng net.accelbyte.sdk.cli.Main inventory adminCreateInventory \
    --namespace "$AB_NAMESPACE" \
    --body '{"inventoryConfigurationCode": "wGKYnEq6", "userId": "D8TEi96L"}' \
    > test.out 2>&1
eval_tap $? 8 'AdminCreateInventory' test.out

#- 9 AdminGetInventory
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventory \
    --inventoryId '2giMLttT' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'AdminGetInventory' test.out

#- 10 AdminUpdateInventory
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateInventory \
    --inventoryId 'eFhB9b5l' \
    --namespace "$AB_NAMESPACE" \
    --body '{"incMaxSlots": 35}' \
    > test.out 2>&1
eval_tap $? 10 'AdminUpdateInventory' test.out

#- 11 DeleteInventory
./ng net.accelbyte.sdk.cli.Main inventory deleteInventory \
    --inventoryId 'VxTr0C2d' \
    --namespace "$AB_NAMESPACE" \
    --body '{"message": "nT495OTR"}' \
    > test.out 2>&1
eval_tap $? 11 'DeleteInventory' test.out

#- 12 AdminListItems
./ng net.accelbyte.sdk.cli.Main inventory adminListItems \
    --inventoryId 'HeIpntCI' \
    --namespace "$AB_NAMESPACE" \
    --limit '43' \
    --offset '36' \
    --sortBy 'updatedAt' \
    --sourceItemId 'tEU6OeWP' \
    --tags 'olyQvnqY' \
    > test.out 2>&1
eval_tap $? 12 'AdminListItems' test.out

#- 13 AdminGetInventoryItem
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventoryItem \
    --inventoryId 'O7wM4bJa' \
    --namespace "$AB_NAMESPACE" \
    --slotId 'DL4XV3nc' \
    --sourceItemId 'm873S9Hm' \
    > test.out 2>&1
eval_tap $? 13 'AdminGetInventoryItem' test.out

#- 14 AdminListInventoryConfigurations
./ng net.accelbyte.sdk.cli.Main inventory adminListInventoryConfigurations \
    --namespace "$AB_NAMESPACE" \
    --code 'I9NHGrPh' \
    --limit '91' \
    --offset '58' \
    --sortBy 'createdAt:asc' \
    > test.out 2>&1
eval_tap $? 14 'AdminListInventoryConfigurations' test.out

#- 15 AdminCreateInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminCreateInventoryConfiguration \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "vkWpta04", "description": "HcYnC5c8", "initialMaxSlots": 3, "maxInstancesPerUser": 17, "maxUpgradeSlots": 34, "name": "b3WjkDGv"}' \
    > test.out 2>&1
eval_tap $? 15 'AdminCreateInventoryConfiguration' test.out

#- 16 AdminGetInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventoryConfiguration \
    --inventoryConfigurationId 'RhLBk5CS' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'AdminGetInventoryConfiguration' test.out

#- 17 AdminUpdateInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateInventoryConfiguration \
    --inventoryConfigurationId '3cgH5BPb' \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "r1zLkDYf", "description": "QNWs5md9", "initialMaxSlots": 90, "maxInstancesPerUser": 41, "maxUpgradeSlots": 23, "name": "2QupGedD"}' \
    > test.out 2>&1
eval_tap $? 17 'AdminUpdateInventoryConfiguration' test.out

#- 18 AdminDeleteInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteInventoryConfiguration \
    --inventoryConfigurationId 'vYmO1dVq' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminDeleteInventoryConfiguration' test.out

#- 19 AdminListItemTypes
./ng net.accelbyte.sdk.cli.Main inventory adminListItemTypes \
    --namespace "$AB_NAMESPACE" \
    --limit '92' \
    --offset '17' \
    --sortBy 'createdAt:asc' \
    > test.out 2>&1
eval_tap $? 19 'AdminListItemTypes' test.out

#- 20 AdminCreateItemType
./ng net.accelbyte.sdk.cli.Main inventory adminCreateItemType \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "s5Ppmz7P"}' \
    > test.out 2>&1
eval_tap $? 20 'AdminCreateItemType' test.out

#- 21 AdminDeleteItemType
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteItemType \
    --itemTypeName 'ceT4bmqm' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'AdminDeleteItemType' test.out

#- 22 AdminListTags
./ng net.accelbyte.sdk.cli.Main inventory adminListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '8' \
    --offset '5' \
    --owner 'B18qJg3P' \
    --sortBy 'createdAt:desc' \
    > test.out 2>&1
eval_tap $? 22 'AdminListTags' test.out

#- 23 AdminCreateTag
./ng net.accelbyte.sdk.cli.Main inventory adminCreateTag \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "di6AJVJE", "owner": "CLIENT"}' \
    > test.out 2>&1
eval_tap $? 23 'AdminCreateTag' test.out

#- 24 AdminDeleteTag
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteTag \
    --namespace "$AB_NAMESPACE" \
    --tagName 'NSVGImFz' \
    > test.out 2>&1
eval_tap $? 24 'AdminDeleteTag' test.out

#- 25 AdminConsumeUserItem
./ng net.accelbyte.sdk.cli.Main inventory adminConsumeUserItem \
    --inventoryId 'hSxjex8E' \
    --namespace "$AB_NAMESPACE" \
    --userId 'XVs52sqd' \
    --dateRangeValidation 'EDtvr8DB' \
    --body '{"options": ["6xHUk8ZV", "fxo8vIrI", "fRltSOM2"], "qty": 44, "slotId": "FLQpBMjj", "sourceItemId": "4g4kYZLc"}' \
    > test.out 2>&1
eval_tap $? 25 'AdminConsumeUserItem' test.out

#- 26 AdminBulkUpdateMyItems
./ng net.accelbyte.sdk.cli.Main inventory adminBulkUpdateMyItems \
    --inventoryId 'eGWu0VsT' \
    --namespace "$AB_NAMESPACE" \
    --userId 'xGIecAJU' \
    --body '[{"customAttributes": {"TRraz8Mp": {}, "qL0qUeS1": {}, "kC85LWpC": {}}, "serverCustomAttributes": {"BsrZGPua": {}, "R6X9o5ls": {}, "tpR3Wyc7": {}}, "slotId": "an3cLxnT", "sourceItemId": "heiFhFPe", "tags": ["miQFbjJw", "GZF8CPcy", "jPBMcIpe"], "type": "OZl3pIkZ"}, {"customAttributes": {"GcgEix6r": {}, "RU56iuYw": {}, "HFesrDkG": {}}, "serverCustomAttributes": {"LJLAD5jg": {}, "nGnes9e6": {}, "azjfOwGH": {}}, "slotId": "v46IMwGR", "sourceItemId": "maHHa1pr", "tags": ["0npYqQoD", "QvFzrvVk", "HcTPKiom"], "type": "D3J9R9di"}, {"customAttributes": {"dkhKTxFm": {}, "BsFcKXa7": {}, "C5RfXip5": {}}, "serverCustomAttributes": {"ssEzl7II": {}, "sk78AbFz": {}, "u9Q7AmWe": {}}, "slotId": "6HRCttvB", "sourceItemId": "Wd11Ap2Z", "tags": ["a63MN2Mw", "VPyrh9UG", "YW1avpni"], "type": "zNfhySK9"}]' \
    > test.out 2>&1
eval_tap $? 26 'AdminBulkUpdateMyItems' test.out

#- 27 AdminSaveItemToInventory
./ng net.accelbyte.sdk.cli.Main inventory adminSaveItemToInventory \
    --inventoryId 'WRMPBLZ0' \
    --namespace "$AB_NAMESPACE" \
    --userId '080s63in' \
    --body '{"customAttributes": {"tnnCRnRD": {}, "7iZN0gDL": {}, "sG0HzlzD": {}}, "qty": 64, "serverCustomAttributes": {"BmzUN13l": {}, "T4uvlvUc": {}, "3h24H9a6": {}}, "slotId": "gLXbOyVD", "slotUsed": 90, "source": "OTHER", "sourceItemId": "oLnr8He7", "tags": ["tP1r55tZ", "EAKiuvre", "gNPQl6q6"], "type": "9zuktjKo"}' \
    > test.out 2>&1
eval_tap $? 27 'AdminSaveItemToInventory' test.out

#- 28 AdminBulkRemoveItems
./ng net.accelbyte.sdk.cli.Main inventory adminBulkRemoveItems \
    --inventoryId 'mTvngT1n' \
    --namespace "$AB_NAMESPACE" \
    --userId 'OhrFUfiF' \
    --body '[{"slotId": "t8Gn4zGo", "sourceItemId": "EUDzoEXG"}, {"slotId": "I52r04kZ", "sourceItemId": "9oUzzThi"}, {"slotId": "U3Eph1EB", "sourceItemId": "aBYNY2MO"}]' \
    > test.out 2>&1
eval_tap $? 28 'AdminBulkRemoveItems' test.out

#- 29 AdminBulkSaveItemToInventory
./ng net.accelbyte.sdk.cli.Main inventory adminBulkSaveItemToInventory \
    --inventoryId 'oyoEgkRr' \
    --namespace "$AB_NAMESPACE" \
    --userId 'gcwOphqK' \
    --body '[{"customAttributes": {"s3Zsfjlv": {}, "WgFcRBBI": {}, "ObaoxXbf": {}}, "qty": 83, "serverCustomAttributes": {"M5EpSZd8": {}, "m80zMdVD": {}, "HOXlHu4G": {}}, "slotId": "38Hr16rF", "slotUsed": 78, "source": "OTHER", "sourceItemId": "nW90F9Ql", "tags": ["Wnu5dgZ0", "9gjd9TUX", "D3Dc7gqf"], "type": "j2SbmUcD"}, {"customAttributes": {"XtDxjlhC": {}, "UwbyEvIu": {}, "ZN1i8ViZ": {}}, "qty": 34, "serverCustomAttributes": {"YlaxUdUp": {}, "vzUTWRys": {}, "YPOboYiP": {}}, "slotId": "uFWbfYEO", "slotUsed": 81, "source": "OTHER", "sourceItemId": "qav1YzIg", "tags": ["m3MQWmj2", "nAK4smM0", "IDjPdcWL"], "type": "SaUuqECl"}, {"customAttributes": {"IMR4alWE": {}, "VUjfN3mS": {}, "DB4TD6Un": {}}, "qty": 50, "serverCustomAttributes": {"CvUMx0G4": {}, "jaCSwwNj": {}, "6Us6wjST": {}}, "slotId": "aajuRav4", "slotUsed": 83, "source": "OTHER", "sourceItemId": "LhEX2rIg", "tags": ["mQavC2NN", "tfAQaz7u", "u4OvU66e"], "type": "I1pEWNkj"}]' \
    > test.out 2>&1
eval_tap $? 29 'AdminBulkSaveItemToInventory' test.out

#- 30 AdminUpdateUserInventoriesByInventoryCode
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateUserInventoriesByInventoryCode \
    --inventoryConfigurationCode 'F8QOyldt' \
    --namespace "$AB_NAMESPACE" \
    --userId 'tT7DgUfi' \
    --body '{"incMaxSlots": 7}' \
    > test.out 2>&1
eval_tap $? 30 'AdminUpdateUserInventoriesByInventoryCode' test.out

#- 31 AdminSaveItem
./ng net.accelbyte.sdk.cli.Main inventory adminSaveItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'vII7y9eJ' \
    --body '{"customAttributes": {"mOnzeNL1": {}, "2lVORYJZ": {}, "K6kk1puL": {}}, "inventoryConfigurationCode": "QYTh1FFi", "qty": 55, "serverCustomAttributes": {"F9V2qxEn": {}, "B2cljAJm": {}, "afqu0vrV": {}}, "slotId": "YG1VZa3s", "slotUsed": 80, "source": "OTHER", "sourceItemId": "7bW0TOVz", "tags": ["yvFErV8o", "ESdTiDwY", "TVsxDkMi"], "type": "ScoXjaP6"}' \
    > test.out 2>&1
eval_tap $? 31 'AdminSaveItem' test.out

#- 32 AdminBulkSaveItem
./ng net.accelbyte.sdk.cli.Main inventory adminBulkSaveItem \
    --namespace "$AB_NAMESPACE" \
    --userId '0fg2slUg' \
    --body '[{"customAttributes": {"d5e7HvNq": {}, "gO9yGnCn": {}, "X40A7jLQ": {}}, "inventoryConfigurationCode": "fEK6gDi6", "qty": 20, "serverCustomAttributes": {"sM6RkZz2": {}, "ZEdTQvel": {}, "6vV1Abh9": {}}, "slotId": "6caOxLtQ", "slotUsed": 68, "source": "OTHER", "sourceItemId": "nZVhBJmi", "tags": ["1nWjh23u", "L1rl7BCZ", "LKeLoggb"], "type": "Shj6bwrN"}, {"customAttributes": {"G6zxSAT7": {}, "hywENW4Y": {}, "iUbyOGKv": {}}, "inventoryConfigurationCode": "va5vpjan", "qty": 75, "serverCustomAttributes": {"HaVtD2Ao": {}, "6RFbru9m": {}, "owELgjPV": {}}, "slotId": "6zAPfhUD", "slotUsed": 73, "source": "OTHER", "sourceItemId": "sOZNx8Bt", "tags": ["3ndEGXwm", "RZKy4tvd", "sb1ncn67"], "type": "8cEJW0o9"}, {"customAttributes": {"HqTgCVjE": {}, "OsXzh7IT": {}, "nGuUHn76": {}}, "inventoryConfigurationCode": "TzyAty1J", "qty": 97, "serverCustomAttributes": {"0ZXcq1U2": {}, "arnWbJSq": {}, "Fk66Tmv8": {}}, "slotId": "JPVU8XQK", "slotUsed": 38, "source": "ECOMMERCE", "sourceItemId": "UhqfrJKd", "tags": ["6MktCfBw", "c8VaQXnm", "Bee1vO8c"], "type": "iOOnPocT"}]' \
    > test.out 2>&1
eval_tap $? 32 'AdminBulkSaveItem' test.out

#- 33 AdminSyncUserEntitlements
./ng net.accelbyte.sdk.cli.Main inventory adminSyncUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'eLLsfuZF' \
    > test.out 2>&1
eval_tap $? 33 'AdminSyncUserEntitlements' test.out

#- 34 AdminPurchasable
./ng net.accelbyte.sdk.cli.Main inventory adminPurchasable \
    --namespace "$AB_NAMESPACE" \
    --userId '1SMTiWbr' \
    --body '{"entitlementType": "f8qTPJSD", "inventoryConfig": {"slotUsed": 68}, "itemId": "ve2ByCHG", "itemType": "P5Jf3Buu", "items": [{"bundledQty": 20, "entitlementType": "ulZNPufV", "inventoryConfig": {"slotUsed": 36}, "itemId": "koeaaUQi", "itemType": "rCeiCD9u", "sku": "fY0hVIXZ", "stackable": true, "useCount": 14}, {"bundledQty": 80, "entitlementType": "OjfJwL3f", "inventoryConfig": {"slotUsed": 86}, "itemId": "g55b5nk5", "itemType": "ce11hMzg", "sku": "W2149nRt", "stackable": false, "useCount": 91}, {"bundledQty": 78, "entitlementType": "f3FzVvUL", "inventoryConfig": {"slotUsed": 21}, "itemId": "Iq58VmVm", "itemType": "ZzGVTj9V", "sku": "qPCg3Ygs", "stackable": false, "useCount": 28}], "quantity": 51, "sku": "EBSasqav", "stackable": true, "useCount": 48}' \
    > test.out 2>&1
eval_tap $? 34 'AdminPurchasable' test.out

#- 35 PublicListInventoryConfigurations
./ng net.accelbyte.sdk.cli.Main inventory publicListInventoryConfigurations \
    --namespace "$AB_NAMESPACE" \
    --code 'pwHpEBOh' \
    --limit '3' \
    --offset '55' \
    --sortBy 'createdAt:desc' \
    > test.out 2>&1
eval_tap $? 35 'PublicListInventoryConfigurations' test.out

#- 36 PublicListItemTypes
./ng net.accelbyte.sdk.cli.Main inventory publicListItemTypes \
    --namespace "$AB_NAMESPACE" \
    --limit '65' \
    --offset '12' \
    --sortBy 'createdAt:asc' \
    > test.out 2>&1
eval_tap $? 36 'PublicListItemTypes' test.out

#- 37 PublicListTags
./ng net.accelbyte.sdk.cli.Main inventory publicListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '59' \
    --offset '99' \
    --sortBy 'createdAt:desc' \
    > test.out 2>&1
eval_tap $? 37 'PublicListTags' test.out

#- 38 PublicListInventories
./ng net.accelbyte.sdk.cli.Main inventory publicListInventories \
    --namespace "$AB_NAMESPACE" \
    --inventoryConfigurationCode 'y8fZTxl3' \
    --limit '37' \
    --offset '47' \
    --sortBy 'createdAt:asc' \
    > test.out 2>&1
eval_tap $? 38 'PublicListInventories' test.out

#- 39 PublicConsumeMyItem
./ng net.accelbyte.sdk.cli.Main inventory publicConsumeMyItem \
    --inventoryId 'LWCXdBjj' \
    --namespace "$AB_NAMESPACE" \
    --body '{"options": ["941Eg0an", "NEwDvRDV", "xy1zMEyF"], "qty": 1, "slotId": "a1PnFYG4", "sourceItemId": "czKhADCu"}' \
    > test.out 2>&1
eval_tap $? 39 'PublicConsumeMyItem' test.out

#- 40 PublicListItems
./ng net.accelbyte.sdk.cli.Main inventory publicListItems \
    --inventoryId 'OgmZ46mp' \
    --namespace "$AB_NAMESPACE" \
    --limit '36' \
    --offset '78' \
    --sortBy 'updatedAt:asc' \
    --sourceItemId 'bFM6m39Y' \
    --tags 'WkYFnv3H' \
    > test.out 2>&1
eval_tap $? 40 'PublicListItems' test.out

#- 41 PublicBulkUpdateMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicBulkUpdateMyItems \
    --inventoryId 'kIy210OY' \
    --namespace "$AB_NAMESPACE" \
    --body '[{"customAttributes": {"FaiTxRQF": {}, "kwLfH9iB": {}, "PTS2s7PL": {}}, "slotId": "ssD6HxeC", "sourceItemId": "U4GPBaUe", "tags": ["ZfRFfN5W", "QCut9HTd", "3LKj7Vjc"]}, {"customAttributes": {"WnxWI8SU": {}, "KpKilYOP": {}, "G7HcaxUw": {}}, "slotId": "9YZhnl6U", "sourceItemId": "UJoozEGU", "tags": ["2wGxZVW4", "4znfsPpR", "4tBflgOf"]}, {"customAttributes": {"N4YTRmwf": {}, "fPwIWBpw": {}, "diiAIjIh": {}}, "slotId": "OQcJfdn2", "sourceItemId": "i8VeN1zX", "tags": ["NUzgbSE2", "H0WoWbw3", "JPc27O2j"]}]' \
    > test.out 2>&1
eval_tap $? 41 'PublicBulkUpdateMyItems' test.out

#- 42 PublicBulkRemoveMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicBulkRemoveMyItems \
    --inventoryId 'PcbI2wYy' \
    --namespace "$AB_NAMESPACE" \
    --body '[{"slotId": "G09lCtyc", "sourceItemId": "OoptRyfi"}, {"slotId": "o5zHD0HQ", "sourceItemId": "d3BtQ6DF"}, {"slotId": "n9muKmCt", "sourceItemId": "YDhUF3Xg"}]' \
    > test.out 2>&1
eval_tap $? 42 'PublicBulkRemoveMyItems' test.out

#- 43 PublicMoveMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicMoveMyItems \
    --inventoryId '0YGnNC3C' \
    --namespace "$AB_NAMESPACE" \
    --body '{"items": [{"qty": 93, "slotId": "OYsXqWSL", "sourceItemId": "FUeMnWjQ"}, {"qty": 9, "slotId": "HVgCFTgx", "sourceItemId": "LKY1QCWE"}, {"qty": 67, "slotId": "dxYBDFwI", "sourceItemId": "NMCcCH0C"}], "srcInventoryId": "2K9IWgQK"}' \
    > test.out 2>&1
eval_tap $? 43 'PublicMoveMyItems' test.out

#- 44 PublicGetItem
./ng net.accelbyte.sdk.cli.Main inventory publicGetItem \
    --inventoryId 'RCPl9oZD' \
    --namespace "$AB_NAMESPACE" \
    --slotId 'uIlS9WZs' \
    --sourceItemId 'Zscq8jfo' \
    > test.out 2>&1
eval_tap $? 44 'PublicGetItem' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
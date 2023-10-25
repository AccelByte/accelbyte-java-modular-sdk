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
echo "1..35"

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
    --body '{"message": "k887FMeJ", "operations": [{"consumeItems": [{"inventoryId": "YSmCBL68", "qty": 92, "slotId": "PIJOIBii", "sourceItemId": "L9MKSiFp"}, {"inventoryId": "CX06ommn", "qty": 36, "slotId": "f8oMuNSX", "sourceItemId": "MqpvsMTa"}, {"inventoryId": "qbZqlONX", "qty": 27, "slotId": "Qt8xtsoB", "sourceItemId": "55Wa8YKU"}], "createItems": [{"customAttributes": {"uWH5CZFJ": {}, "IPjXfchc": {}, "Qkvgfl18": {}}, "inventoryConfigurationCode": "1Hudyomw", "inventoryId": "DjTibBVu", "qty": 52, "serverCustomAttributes": {"Ju60f4Rt": {}, "ws1xW8sb": {}, "WRzj9IJo": {}}, "slotId": "mPGUWouS", "slotUsed": 40, "sourceItemId": "BLDGnvZI", "tags": ["1qdAYg12", "SxiWka8w", "lrSCTIfI"], "toSpecificInventory": false, "type": "QA2dUpgA"}, {"customAttributes": {"bXYpsiS8": {}, "M7pSAuQu": {}, "jPG4WLGO": {}}, "inventoryConfigurationCode": "3xGKSMmJ", "inventoryId": "464iLtlw", "qty": 56, "serverCustomAttributes": {"fdchEFCZ": {}, "Q2cJqkQv": {}, "0Y5Hky6w": {}}, "slotId": "2dhfhLZD", "slotUsed": 13, "sourceItemId": "GZBDe9dF", "tags": ["aWuRo27h", "arbFeIfg", "QfyfsEnP"], "toSpecificInventory": false, "type": "pz4AzioR"}, {"customAttributes": {"2jOQ90E7": {}, "AJkuROKq": {}, "63FkEtDp": {}}, "inventoryConfigurationCode": "keSLsEs4", "inventoryId": "4aSWztGQ", "qty": 0, "serverCustomAttributes": {"Ce5JbwqY": {}, "mbMkqfJH": {}, "7ZlVLgJA": {}}, "slotId": "bDr4AqSh", "slotUsed": 16, "sourceItemId": "x2LorAW7", "tags": ["SOMbpEwe", "aOIWzav1", "qInXMUeW"], "toSpecificInventory": true, "type": "J36GhPgH"}], "removeItems": [{"inventoryId": "J3UnG89P", "slotId": "ANpUrZcM", "sourceItemId": "tFRtkUOm"}, {"inventoryId": "Kzjo1jlX", "slotId": "AvMTYqCJ", "sourceItemId": "R2K3PZ0f"}, {"inventoryId": "kuDJQfPA", "slotId": "hTJKros9", "sourceItemId": "fzRaL8Ya"}], "targetUserId": "we5WpZ5H", "updateItems": [{"customAttributes": {"617rtmB1": {}, "GnrpdwI1": {}, "po7as92Y": {}}, "inventoryId": "UTOIsFKD", "serverCustomAttributes": {"oCHHaM7S": {}, "aYrGZ9Ad": {}, "ovyQiWCS": {}}, "slotId": "cE4TCOYc", "sourceItemId": "w6mPqwB4", "tags": ["pL0FMqsF", "PTVUppV0", "kiERHInU"], "type": "58JxK7X0"}, {"customAttributes": {"mvG805Sy": {}, "9i2zA5FK": {}, "9bvm4HhY": {}}, "inventoryId": "LJROTAlb", "serverCustomAttributes": {"ouXVCoF7": {}, "OaBNuqz2": {}, "McLpPnJc": {}}, "slotId": "ceoDeg4l", "sourceItemId": "VjNFTKJ8", "tags": ["TJinmWUG", "YT1cO5GJ", "HNUOWUBs"], "type": "yO0pp5iu"}, {"customAttributes": {"kr7Pbvim": {}, "LIEgUrkm": {}, "GzAKBQQF": {}}, "inventoryId": "7AK0oPci", "serverCustomAttributes": {"5pvDU1uf": {}, "eIppMmd4": {}, "57MbV9Dm": {}}, "slotId": "Ig7Wzn2n", "sourceItemId": "V6gV7rbE", "tags": ["ZjrAG2YY", "bOg6gS0H", "ZT1t1WsP"], "type": "IknR6Ykj"}]}, {"consumeItems": [{"inventoryId": "72ji27GB", "qty": 4, "slotId": "Q0SnpKHa", "sourceItemId": "TUX7oBym"}, {"inventoryId": "nYvSvHtD", "qty": 61, "slotId": "kzBRIc6X", "sourceItemId": "KexiZ22z"}, {"inventoryId": "E4M1rGza", "qty": 91, "slotId": "eDO9SYSR", "sourceItemId": "uB8BKRUY"}], "createItems": [{"customAttributes": {"IotJIaM2": {}, "eJS9hUK9": {}, "sPz173Dc": {}}, "inventoryConfigurationCode": "tvosNMEl", "inventoryId": "OhIWQrpo", "qty": 43, "serverCustomAttributes": {"OGbhAdQ2": {}, "TQVTnaGo": {}, "5AOULF3f": {}}, "slotId": "c2l0Tmqb", "slotUsed": 98, "sourceItemId": "Ui2a2ptM", "tags": ["Mi249SJw", "bVin1CxK", "lhPbeUSo"], "toSpecificInventory": true, "type": "0Hkw7zii"}, {"customAttributes": {"sMzItEDJ": {}, "NAt8oQ30": {}, "ujpwDDic": {}}, "inventoryConfigurationCode": "eNg8mMYK", "inventoryId": "X1oxlcLZ", "qty": 16, "serverCustomAttributes": {"nRlwtn5R": {}, "5MJENI6y": {}, "7CQfZRKy": {}}, "slotId": "U0HYtGry", "slotUsed": 48, "sourceItemId": "A3PRcZSX", "tags": ["Pkk0mCvb", "oxjay9R4", "vZeEfI7s"], "toSpecificInventory": false, "type": "xGilTCRO"}, {"customAttributes": {"Phr1Wwk2": {}, "WDdoQ0Go": {}, "iN5ajUYe": {}}, "inventoryConfigurationCode": "YUeJ8tvi", "inventoryId": "rXbSOtG6", "qty": 98, "serverCustomAttributes": {"iRgf62pX": {}, "GMfbswx8": {}, "5Aj5c76E": {}}, "slotId": "yYLJYqja", "slotUsed": 88, "sourceItemId": "jqdrgZiU", "tags": ["oIfEOUNB", "ECeggego", "XySfFC2m"], "toSpecificInventory": true, "type": "Pua8kGDH"}], "removeItems": [{"inventoryId": "msNU0vgG", "slotId": "rayHvy1B", "sourceItemId": "1TBqlZyw"}, {"inventoryId": "k227Jeu9", "slotId": "tGQj9v7c", "sourceItemId": "ckxribw0"}, {"inventoryId": "ohN4XXHu", "slotId": "qydM87dA", "sourceItemId": "i6RB3fWs"}], "targetUserId": "WY7bFTbG", "updateItems": [{"customAttributes": {"p95p57l4": {}, "N6YBxuEL": {}, "OavpAqUe": {}}, "inventoryId": "A5yHuSSX", "serverCustomAttributes": {"6MZ3e8Qy": {}, "AJtyTHTo": {}, "0p8SHWZE": {}}, "slotId": "xG66rWEF", "sourceItemId": "3nWrufbP", "tags": ["xpfUXlp1", "jlAx0t4y", "qv1RJdI6"], "type": "oKCb2KN4"}, {"customAttributes": {"hnBTCsGv": {}, "WsNu1FhT": {}, "CxO2wO7Y": {}}, "inventoryId": "6WZXQ8DD", "serverCustomAttributes": {"ea6JDSfH": {}, "NlOHbnGS": {}, "Ffdrpfh2": {}}, "slotId": "cKr8oGFi", "sourceItemId": "fViTiTdy", "tags": ["TBeLj3TA", "hx1UHVXX", "kkA1FUWS"], "type": "kmzSgaV1"}, {"customAttributes": {"z8yjNW0U": {}, "fVbSCHSY": {}, "ykE102P9": {}}, "inventoryId": "92eY7f2j", "serverCustomAttributes": {"DwJPqEOW": {}, "jthqmFmA": {}, "DwJEIw0m": {}}, "slotId": "SqgEhxHX", "sourceItemId": "mFdWC2HA", "tags": ["ELR0KeIY", "X2L0ReHx", "XwC2UDz2"], "type": "UvcbUOEI"}]}, {"consumeItems": [{"inventoryId": "ltdxrGi9", "qty": 86, "slotId": "aC5kyJhV", "sourceItemId": "eRN8Sy8y"}, {"inventoryId": "qkfrs1W0", "qty": 27, "slotId": "QbucBHaS", "sourceItemId": "pTkstHW5"}, {"inventoryId": "6bqqr6fh", "qty": 75, "slotId": "DfKLawCO", "sourceItemId": "IhEBkEYo"}], "createItems": [{"customAttributes": {"UbackKHN": {}, "WIw03XNe": {}, "DRFPJT3I": {}}, "inventoryConfigurationCode": "hPVTd9Kz", "inventoryId": "7rP0uRhN", "qty": 52, "serverCustomAttributes": {"jQXvlkmN": {}, "W3Lgy2Si": {}, "Ur7Ypi47": {}}, "slotId": "V8KOIf4s", "slotUsed": 99, "sourceItemId": "CtkszyYy", "tags": ["6sBZtCPb", "9LlrCJOm", "EY7VqVzz"], "toSpecificInventory": false, "type": "txK0R5oo"}, {"customAttributes": {"zrXxz7RG": {}, "a2SWTGAY": {}, "n15LGQXT": {}}, "inventoryConfigurationCode": "974XhFbj", "inventoryId": "bK2kn1i8", "qty": 10, "serverCustomAttributes": {"51VU8c4P": {}, "UVX6nP3L": {}, "WOnTLqJJ": {}}, "slotId": "ljD5vEmn", "slotUsed": 41, "sourceItemId": "aMl1gmjS", "tags": ["3S5FOMyk", "9nw4HIwJ", "pjPZQQ3y"], "toSpecificInventory": true, "type": "XzhatU1I"}, {"customAttributes": {"1KG8foOD": {}, "zbKyySZm": {}, "JDSLSNZi": {}}, "inventoryConfigurationCode": "RGjgkuYq", "inventoryId": "GKG6XXxJ", "qty": 48, "serverCustomAttributes": {"zswkiDp6": {}, "QBpuFatN": {}, "S0XggCKl": {}}, "slotId": "W87zFdzZ", "slotUsed": 67, "sourceItemId": "uuh0wQfs", "tags": ["Hox9SdiO", "LXuTEjgW", "sOaxuJap"], "toSpecificInventory": false, "type": "jDVQn4K6"}], "removeItems": [{"inventoryId": "oTi0zoTy", "slotId": "4K0DDsLG", "sourceItemId": "0gVpkcPW"}, {"inventoryId": "WsrKSwRk", "slotId": "0mVqtVnY", "sourceItemId": "YAWN5UR1"}, {"inventoryId": "Op8xAaZT", "slotId": "c0lixfsR", "sourceItemId": "VplJ91YP"}], "targetUserId": "lI30jNdd", "updateItems": [{"customAttributes": {"StYOpoMw": {}, "J96l5WJy": {}, "ZvyqONdo": {}}, "inventoryId": "LdtUBYDZ", "serverCustomAttributes": {"HtwSs6kZ": {}, "dGQYLAwZ": {}, "XEo0KDFc": {}}, "slotId": "JExutymI", "sourceItemId": "Qjmr9iNl", "tags": ["XM0G8OlN", "E4EslqfN", "Y5lPVjWo"], "type": "Kvsul0FO"}, {"customAttributes": {"lqUVxwIB": {}, "AKCLMEKq": {}, "91TFk3Ng": {}}, "inventoryId": "vgo33d9k", "serverCustomAttributes": {"xOa2I9dK": {}, "iht5zKw1": {}, "b2Xo8Y51": {}}, "slotId": "Dm84uDKq", "sourceItemId": "Q6eW4XWD", "tags": ["FZyPoEWA", "lQp7V7y1", "j3CqR1Tk"], "type": "9dOBpfuH"}, {"customAttributes": {"yPclun1u": {}, "23Q8At3u": {}, "rMRWKxtA": {}}, "inventoryId": "eqKcMX1Y", "serverCustomAttributes": {"SxwKfxPl": {}, "31SpfFMr": {}, "4bVAaCYX": {}}, "slotId": "tXWN9iTj", "sourceItemId": "wVJLUqhO", "tags": ["gEM72QhU", "e2ltBA2F", "5DKCKULZ"], "type": "GVt8kQPa"}]}], "requestId": "DK6FWEj3"}' \
    > test.out 2>&1
eval_tap $? 2 'AdminCreateChainingOperations' test.out

#- 3 AdminListInventories
./ng net.accelbyte.sdk.cli.Main inventory adminListInventories \
    --namespace "$AB_NAMESPACE" \
    --inventoryConfigurationCode 'jKmTtw6e' \
    --limit '86' \
    --offset '73' \
    --sortBy 'inventoryConfigurationCode:desc' \
    --userId 'K3P69Q0M' \
    > test.out 2>&1
eval_tap $? 3 'AdminListInventories' test.out

#- 4 AdminCreateInventory
./ng net.accelbyte.sdk.cli.Main inventory adminCreateInventory \
    --namespace "$AB_NAMESPACE" \
    --body '{"inventoryConfigurationCode": "OK2J7XPI", "userId": "My7n2GrQ"}' \
    > test.out 2>&1
eval_tap $? 4 'AdminCreateInventory' test.out

#- 5 AdminGetInventory
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventory \
    --inventoryId '0iGJDxZf' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'AdminGetInventory' test.out

#- 6 AdminUpdateInventory
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateInventory \
    --inventoryId 'Rnq5A6M2' \
    --namespace "$AB_NAMESPACE" \
    --body '{"incMaxSlots": 78}' \
    > test.out 2>&1
eval_tap $? 6 'AdminUpdateInventory' test.out

#- 7 DeleteInventory
./ng net.accelbyte.sdk.cli.Main inventory deleteInventory \
    --inventoryId 'nnjH4sr7' \
    --namespace "$AB_NAMESPACE" \
    --body '{"message": "lcRb73wq"}' \
    > test.out 2>&1
eval_tap $? 7 'DeleteInventory' test.out

#- 8 AdminListItems
./ng net.accelbyte.sdk.cli.Main inventory adminListItems \
    --inventoryId 'tBLaAn63' \
    --namespace "$AB_NAMESPACE" \
    --limit '32' \
    --offset '78' \
    --qtyGte '29' \
    --sortBy 'updatedAt:desc' \
    --sourceItemId '5LGOETAb' \
    --tags 'l1DArEK1' \
    > test.out 2>&1
eval_tap $? 8 'AdminListItems' test.out

#- 9 AdminGetInventoryItem
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventoryItem \
    --inventoryId '9Baj9XDD' \
    --namespace "$AB_NAMESPACE" \
    --slotId 'aQYE1Br0' \
    --sourceItemId 'Vns3gKr8' \
    > test.out 2>&1
eval_tap $? 9 'AdminGetInventoryItem' test.out

#- 10 AdminListInventoryConfigurations
./ng net.accelbyte.sdk.cli.Main inventory adminListInventoryConfigurations \
    --namespace "$AB_NAMESPACE" \
    --code 'HEK4a0UA' \
    --limit '89' \
    --offset '73' \
    --sortBy 'createdAt:asc' \
    > test.out 2>&1
eval_tap $? 10 'AdminListInventoryConfigurations' test.out

#- 11 AdminCreateInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminCreateInventoryConfiguration \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "mm7q2pLi", "description": "bQV9UhLf", "initialMaxSlots": 52, "maxInstancesPerUser": 45, "maxUpgradeSlots": 44, "name": "OP4snXZP"}' \
    > test.out 2>&1
eval_tap $? 11 'AdminCreateInventoryConfiguration' test.out

#- 12 AdminGetInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventoryConfiguration \
    --inventoryConfigurationId 'Nh8aJGwU' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'AdminGetInventoryConfiguration' test.out

#- 13 AdminUpdateInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateInventoryConfiguration \
    --inventoryConfigurationId 'wOyC5NM2' \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "e5qP7Gsa", "description": "kROkrdtx", "initialMaxSlots": 45, "maxInstancesPerUser": 86, "maxUpgradeSlots": 7, "name": "9Quk6Vcs"}' \
    > test.out 2>&1
eval_tap $? 13 'AdminUpdateInventoryConfiguration' test.out

#- 14 AdminDeleteInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteInventoryConfiguration \
    --inventoryConfigurationId 'w2D2zYJ3' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 14 'AdminDeleteInventoryConfiguration' test.out

#- 15 AdminListItemTypes
./ng net.accelbyte.sdk.cli.Main inventory adminListItemTypes \
    --namespace "$AB_NAMESPACE" \
    --limit '93' \
    --offset '64' \
    --sortBy 'name' \
    > test.out 2>&1
eval_tap $? 15 'AdminListItemTypes' test.out

#- 16 AdminCreateItemType
./ng net.accelbyte.sdk.cli.Main inventory adminCreateItemType \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "NZBw2MH3"}' \
    > test.out 2>&1
eval_tap $? 16 'AdminCreateItemType' test.out

#- 17 AdminDeleteItemType
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteItemType \
    --itemTypeName 'XfbnC9DX' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'AdminDeleteItemType' test.out

#- 18 AdminListTags
./ng net.accelbyte.sdk.cli.Main inventory adminListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '78' \
    --offset '99' \
    --owner 'gmM3v1Rf' \
    --sortBy 'createdAt' \
    > test.out 2>&1
eval_tap $? 18 'AdminListTags' test.out

#- 19 AdminCreateTag
./ng net.accelbyte.sdk.cli.Main inventory adminCreateTag \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "sgALPLUH", "owner": "CLIENT"}' \
    > test.out 2>&1
eval_tap $? 19 'AdminCreateTag' test.out

#- 20 AdminDeleteTag
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteTag \
    --namespace "$AB_NAMESPACE" \
    --tagName 'rMdrnYyT' \
    > test.out 2>&1
eval_tap $? 20 'AdminDeleteTag' test.out

#- 21 AdminConsumeUserItem
./ng net.accelbyte.sdk.cli.Main inventory adminConsumeUserItem \
    --inventoryId 'KYhF4RD0' \
    --namespace "$AB_NAMESPACE" \
    --userId 'G1AsGUoJ' \
    --body '{"qty": 62, "slotId": "xs6ADWhq", "sourceItemId": "3hm1Ir0o"}' \
    > test.out 2>&1
eval_tap $? 21 'AdminConsumeUserItem' test.out

#- 22 AdminBulkUpdateMyItems
./ng net.accelbyte.sdk.cli.Main inventory adminBulkUpdateMyItems \
    --inventoryId 'Imk07YG6' \
    --namespace "$AB_NAMESPACE" \
    --userId 'toQ1pT9w' \
    --body '[{"customAttributes": {"at5ceJQ3": {}, "GiO18NBy": {}, "bTAuD7fm": {}}, "serverCustomAttributes": {"dPFK4Qzs": {}, "GN3b9nFn": {}, "V1H96FUI": {}}, "slotId": "AbXzkImM", "sourceItemId": "AmmHxhzy", "tags": ["mndVhaAi", "56PWoYOA", "ugBUetMA"], "type": "85otYDOG"}, {"customAttributes": {"EVhziPg8": {}, "ADeKQSyw": {}, "H6cKfwRt": {}}, "serverCustomAttributes": {"EJmXjCff": {}, "AmSmcvVp": {}, "qP8rmT0L": {}}, "slotId": "yVWK2RHh", "sourceItemId": "uNdTpAir", "tags": ["sx0FIgkC", "wszojrms", "QntrhID3"], "type": "zFdHJ5ZL"}, {"customAttributes": {"ffUa6arj": {}, "Vzcagz56": {}, "xSi03l6p": {}}, "serverCustomAttributes": {"956N3FPK": {}, "Fc485Nsp": {}, "bZWEFxTI": {}}, "slotId": "EwVSIBvf", "sourceItemId": "RnzlWdn1", "tags": ["hoFPVGGc", "6TOTR6nv", "y3nW1h14"], "type": "vmZe1Q2q"}]' \
    > test.out 2>&1
eval_tap $? 22 'AdminBulkUpdateMyItems' test.out

#- 23 AdminSaveItemToInventory
./ng net.accelbyte.sdk.cli.Main inventory adminSaveItemToInventory \
    --inventoryId 'rG7ercBY' \
    --namespace "$AB_NAMESPACE" \
    --userId 'o2ViXBBE' \
    --body '{"customAttributes": {"7AxGSdZe": {}, "GfztY1VZ": {}, "aIx4xpJo": {}}, "qty": 15, "serverCustomAttributes": {"6YGNrWHM": {}, "jWbaPsA0": {}, "iuuZTZbK": {}}, "slotId": "AKNzbi4F", "slotUsed": 12, "sourceItemId": "8P7y6rmw", "tags": ["fnYNLdTP", "DNusrwXB", "zEgJjfcO"], "type": "fM01CtEd"}' \
    > test.out 2>&1
eval_tap $? 23 'AdminSaveItemToInventory' test.out

#- 24 AdminBulkRemoveItems
./ng net.accelbyte.sdk.cli.Main inventory adminBulkRemoveItems \
    --inventoryId 'xZnSYjkG' \
    --namespace "$AB_NAMESPACE" \
    --userId 'aZ6UIIfq' \
    --body '[{"slotId": "JnKwdEWx", "sourceItemId": "yqUHKaE8"}, {"slotId": "5kr2Cf7e", "sourceItemId": "IYApn3ji"}, {"slotId": "xfVja7Iw", "sourceItemId": "igVFCqqu"}]' \
    > test.out 2>&1
eval_tap $? 24 'AdminBulkRemoveItems' test.out

#- 25 AdminSaveItem
./ng net.accelbyte.sdk.cli.Main inventory adminSaveItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'JkdD18yg' \
    --body '{"customAttributes": {"ZuugjlCN": {}, "3gb80mxH": {}, "u5H8lRpg": {}}, "inventoryConfigurationCode": "hPANRprU", "qty": 79, "serverCustomAttributes": {"VWWO3ALd": {}, "GtquNlih": {}, "c8b0PxQz": {}}, "slotId": "8q2m1zTJ", "slotUsed": 53, "sourceItemId": "5vM5vS7x", "tags": ["40l4bsaD", "qUwSnoNc", "6Au1JeVO"], "type": "sMwqSE9E"}' \
    > test.out 2>&1
eval_tap $? 25 'AdminSaveItem' test.out

#- 26 PublicListInventoryConfigurations
./ng net.accelbyte.sdk.cli.Main inventory publicListInventoryConfigurations \
    --namespace "$AB_NAMESPACE" \
    --code 'oIcYqXYB' \
    --limit '48' \
    --offset '74' \
    --sortBy 'updatedAt:desc' \
    > test.out 2>&1
eval_tap $? 26 'PublicListInventoryConfigurations' test.out

#- 27 PublicListItemTypes
./ng net.accelbyte.sdk.cli.Main inventory publicListItemTypes \
    --namespace "$AB_NAMESPACE" \
    --limit '37' \
    --offset '22' \
    --sortBy 'createdAt:asc' \
    > test.out 2>&1
eval_tap $? 27 'PublicListItemTypes' test.out

#- 28 PublicListTags
./ng net.accelbyte.sdk.cli.Main inventory publicListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '22' \
    --offset '40' \
    --sortBy 'createdAt' \
    > test.out 2>&1
eval_tap $? 28 'PublicListTags' test.out

#- 29 PublicListInventories
./ng net.accelbyte.sdk.cli.Main inventory publicListInventories \
    --namespace "$AB_NAMESPACE" \
    --inventoryConfigurationCode 'ZNBhh6Jb' \
    --limit '18' \
    --offset '58' \
    --sortBy 'updatedAt:desc' \
    > test.out 2>&1
eval_tap $? 29 'PublicListInventories' test.out

#- 30 PublicConsumeMyItem
./ng net.accelbyte.sdk.cli.Main inventory publicConsumeMyItem \
    --inventoryId 'fd9wupDL' \
    --namespace "$AB_NAMESPACE" \
    --body '{"qty": 80, "slotId": "x8Wmi6Gw", "sourceItemId": "7NYRqiLB"}' \
    > test.out 2>&1
eval_tap $? 30 'PublicConsumeMyItem' test.out

#- 31 PublicListItems
./ng net.accelbyte.sdk.cli.Main inventory publicListItems \
    --inventoryId 'hD4SyP4d' \
    --namespace "$AB_NAMESPACE" \
    --limit '7' \
    --offset '50' \
    --qtyGte '2' \
    --sortBy 'updatedAt' \
    --sourceItemId 'EXhmka1y' \
    --tags 'OaWJu079' \
    > test.out 2>&1
eval_tap $? 31 'PublicListItems' test.out

#- 32 PublicBulkUpdateMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicBulkUpdateMyItems \
    --inventoryId 'cUGSI4RZ' \
    --namespace "$AB_NAMESPACE" \
    --body '[{"customAttributes": {"hnPLvi5b": {}, "2980Yf0q": {}, "lzRdhn8U": {}}, "slotId": "EGRAL6GU", "sourceItemId": "b9b1Zlxi", "tags": ["e2n4Ympt", "ruHCwk08", "pf6UiBEi"]}, {"customAttributes": {"8lUWS2PA": {}, "QigN8r9u": {}, "dmYMlYv3": {}}, "slotId": "5DKp78fL", "sourceItemId": "t9D5g2YB", "tags": ["rtbfxp9H", "yIvxcIrJ", "KH5qVWE0"]}, {"customAttributes": {"O5CVLxXy": {}, "XoY54pjR": {}, "vFCvNjUL": {}}, "slotId": "yOZKt97Q", "sourceItemId": "Gsf3MXdf", "tags": ["JfWAGgZ1", "qCiHQJbH", "ZD5GVPsN"]}]' \
    > test.out 2>&1
eval_tap $? 32 'PublicBulkUpdateMyItems' test.out

#- 33 PublicBulkRemoveMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicBulkRemoveMyItems \
    --inventoryId '6hc3ABho' \
    --namespace "$AB_NAMESPACE" \
    --body '[{"slotId": "zhhDbMSq", "sourceItemId": "U6aUJhRk"}, {"slotId": "OSL1UiVo", "sourceItemId": "TBwoGkcq"}, {"slotId": "zlgufeDS", "sourceItemId": "TjBNRH3E"}]' \
    > test.out 2>&1
eval_tap $? 33 'PublicBulkRemoveMyItems' test.out

#- 34 PublicMoveMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicMoveMyItems \
    --inventoryId 'X9CqV9Vd' \
    --namespace "$AB_NAMESPACE" \
    --body '{"items": [{"qty": 84, "slotId": "u4TNqfvL", "sourceItemId": "S9KpGPo1"}, {"qty": 67, "slotId": "ezmKIRbN", "sourceItemId": "WyRk8vxJ"}, {"qty": 76, "slotId": "Kc9inCMF", "sourceItemId": "hPKjd8eF"}], "srcInventoryId": "UrH6oHJc"}' \
    > test.out 2>&1
eval_tap $? 34 'PublicMoveMyItems' test.out

#- 35 PublicGetItem
./ng net.accelbyte.sdk.cli.Main inventory publicGetItem \
    --inventoryId 'rjtVXftd' \
    --namespace "$AB_NAMESPACE" \
    --slotId 'rVXcK1Re' \
    --sourceItemId '9oHyO0aa' \
    > test.out 2>&1
eval_tap $? 35 'PublicGetItem' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
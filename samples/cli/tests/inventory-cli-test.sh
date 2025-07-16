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
    --body '{"message": "eeHXv6KE", "operations": [{"consumeItems": [{"dateRangeValidation": true, "inventoryId": "MEvT3yS2", "options": ["FP3shfGo", "sctlhLfu", "Ei0UDgbJ"], "qty": 72, "slotId": "Mt86v91X", "sourceItemId": "HCErB2It"}, {"dateRangeValidation": true, "inventoryId": "JfB5kmff", "options": ["MPDMUEsH", "6SdQ1I9J", "oeAfjRpa"], "qty": 8, "slotId": "ANBAJN9E", "sourceItemId": "1ATL8yeb"}, {"dateRangeValidation": true, "inventoryId": "p21f2rga", "options": ["UdxI9X6o", "xmg7hYrM", "WxJCxbDN"], "qty": 94, "slotId": "mlgRJvis", "sourceItemId": "P3VlYQiW"}], "createItems": [{"customAttributes": {"vopruItl": {}, "diaAppfh": {}, "5rBXEWJW": {}}, "inventoryConfigurationCode": "amhOIN4J", "inventoryId": "83jOXfWk", "qty": 2, "serverCustomAttributes": {"D0jM8IxL": {}, "rnl6Hxxa": {}, "bDqYSo9i": {}}, "slotId": "JwJS85xL", "slotUsed": 73, "source": "ECOMMERCE", "sourceItemId": "IprFBtM8", "tags": ["fqFeWXKp", "TmXrfHck", "CszQUpSp"], "toSpecificInventory": false, "type": "U12YefYt"}, {"customAttributes": {"1fPxPJDn": {}, "pxDKSgYo": {}, "VKSbJP47": {}}, "inventoryConfigurationCode": "o6TZN0zS", "inventoryId": "JBPie2k7", "qty": 79, "serverCustomAttributes": {"dNfEoD6O": {}, "9t3Ni3tm": {}, "R2SGPXcB": {}}, "slotId": "z4UzWzAO", "slotUsed": 24, "source": "OTHER", "sourceItemId": "XiG0U0Cr", "tags": ["QRMCp8zi", "mzBwI5lr", "Fg9KfAFE"], "toSpecificInventory": true, "type": "ixBeHwi9"}, {"customAttributes": {"yLoRppO4": {}, "cAPlFPR8": {}, "pJu2LyjJ": {}}, "inventoryConfigurationCode": "nANf5BYJ", "inventoryId": "L8x19J9L", "qty": 83, "serverCustomAttributes": {"pKQyQmOk": {}, "WjgJCv7f": {}, "h6mD2Gtj": {}}, "slotId": "VvDmI4SZ", "slotUsed": 98, "source": "OTHER", "sourceItemId": "iyE84uQI", "tags": ["vraL3efO", "FedqMmK8", "P1dNpZ8k"], "toSpecificInventory": false, "type": "qGsBr8mL"}], "removeItems": [{"inventoryId": "yJz1dC0V", "slotId": "euhySkw6", "sourceItemId": "kR6vLWnK"}, {"inventoryId": "wm80RwmC", "slotId": "GYATxcSO", "sourceItemId": "xSRhMXtd"}, {"inventoryId": "QKGWR9An", "slotId": "pF2Gm3vo", "sourceItemId": "K7fyaLJE"}], "targetUserId": "ha8A6wTK", "updateItems": [{"customAttributes": {"Wkcw1whO": {}, "vjqOdEP3": {}, "yRxTqEHn": {}}, "inventoryId": "AonS2KEf", "serverCustomAttributes": {"o677Cecm": {}, "bTr8qhZl": {}, "fYfwrFyc": {}}, "slotId": "AChDv7CI", "sourceItemId": "dldMW5kz", "tags": ["9AuebLEk", "1i456WdD", "jtljmoF4"], "type": "uSzJM5QO"}, {"customAttributes": {"1c7WgHJV": {}, "lWLM128u": {}, "zOTMwkuy": {}}, "inventoryId": "1JmoSLwZ", "serverCustomAttributes": {"ILR6r2Dg": {}, "CmaPgToT": {}, "oVJZMOiL": {}}, "slotId": "Ja4p3D5A", "sourceItemId": "q6GjUOfx", "tags": ["fbuCyVKM", "eqN2qTJX", "u6myCnSE"], "type": "erMuqv2E"}, {"customAttributes": {"a4UcxJFn": {}, "y3hbZNSo": {}, "kZ3zzHRS": {}}, "inventoryId": "FlRFR2z5", "serverCustomAttributes": {"gtb9ENjf": {}, "auFCBHn0": {}, "oiH0bIlA": {}}, "slotId": "KujQkoeR", "sourceItemId": "QfoaBRHN", "tags": ["PN3CZkPt", "Fy6sd8rX", "MzDdcWn5"], "type": "JAMWm4IR"}]}, {"consumeItems": [{"dateRangeValidation": true, "inventoryId": "crsTKG4X", "options": ["Qi5K69ee", "wSX621bM", "Fvc2YQ7W"], "qty": 18, "slotId": "YlpE5pxh", "sourceItemId": "o9M1cpDO"}, {"dateRangeValidation": false, "inventoryId": "gU2nytCZ", "options": ["5i4d3o0w", "96HCHzrn", "gB1g4ipn"], "qty": 25, "slotId": "XDcQE8By", "sourceItemId": "KQIIfaig"}, {"dateRangeValidation": true, "inventoryId": "3SVwSofU", "options": ["nMkVqhTh", "8RUfveTI", "V1MSu51X"], "qty": 39, "slotId": "fOp5wxLe", "sourceItemId": "p7Ljfal1"}], "createItems": [{"customAttributes": {"iYI487Rs": {}, "fFnPl2er": {}, "j0Jk3bem": {}}, "inventoryConfigurationCode": "SQU5tieQ", "inventoryId": "ZFTYop6i", "qty": 27, "serverCustomAttributes": {"LY3A2cDH": {}, "65A86rHc": {}, "ppEo2Vlr": {}}, "slotId": "VD4GZfUT", "slotUsed": 39, "source": "OTHER", "sourceItemId": "OWBcI65C", "tags": ["wqjnjXpG", "ZjwLSSKH", "Kyf5Cqmi"], "toSpecificInventory": false, "type": "OVNs1E5Z"}, {"customAttributes": {"7aKAGlGZ": {}, "nOkehA4z": {}, "YbISShtg": {}}, "inventoryConfigurationCode": "OHxCXRIB", "inventoryId": "8gYHGO9A", "qty": 52, "serverCustomAttributes": {"MMCP1kBH": {}, "bFHL0GOD": {}, "jzXyGdgc": {}}, "slotId": "rC0ukVxB", "slotUsed": 85, "source": "OTHER", "sourceItemId": "41dm3jiY", "tags": ["0tf8ecmj", "gz5e7mfV", "mrsg71Hc"], "toSpecificInventory": false, "type": "gfpCRJAl"}, {"customAttributes": {"mCQop1Dg": {}, "rkMkngiO": {}, "XRUgRkZM": {}}, "inventoryConfigurationCode": "YONmQ16K", "inventoryId": "Sj4sD2WT", "qty": 4, "serverCustomAttributes": {"krwKXwRJ": {}, "zdHsKoNL": {}, "Lj3KxeAU": {}}, "slotId": "o9mV4gOw", "slotUsed": 42, "source": "OTHER", "sourceItemId": "S1YzUGCN", "tags": ["brjHIwox", "3BGMZTGZ", "MOEfd1tg"], "toSpecificInventory": true, "type": "Cd0XvVwJ"}], "removeItems": [{"inventoryId": "qdEVmzsk", "slotId": "eEh2q7e4", "sourceItemId": "WHYDWqnz"}, {"inventoryId": "qM5m1lWz", "slotId": "9jK4YVha", "sourceItemId": "wXHhd0Ca"}, {"inventoryId": "SM2x8Wyc", "slotId": "nEJE4cgy", "sourceItemId": "Q6ctfAiq"}], "targetUserId": "goUpncnb", "updateItems": [{"customAttributes": {"mpvgiSQ2": {}, "zdZp4wrm": {}, "aH8KN2xR": {}}, "inventoryId": "ZKqivrpq", "serverCustomAttributes": {"73FMGK0e": {}, "I6mpipk3": {}, "v3T9SYy1": {}}, "slotId": "wEg9jnLu", "sourceItemId": "fKaQ7q1h", "tags": ["hXExYSGb", "pGABqCbg", "Aui23fZz"], "type": "g4xI3VNY"}, {"customAttributes": {"D94BztCp": {}, "9hM3VSrn": {}, "7fHQkulk": {}}, "inventoryId": "3QXuf5Uk", "serverCustomAttributes": {"jBF45JaU": {}, "x8TQBoKW": {}, "QlRJ16SK": {}}, "slotId": "X4aLpie7", "sourceItemId": "EO346v7M", "tags": ["VLsB0WRT", "VFdHW51P", "HUJMeCVm"], "type": "3CM9o1sM"}, {"customAttributes": {"bLiFR9bN": {}, "iZgvbqDg": {}, "CHgNCon3": {}}, "inventoryId": "kytV1xwk", "serverCustomAttributes": {"epL3k9DZ": {}, "LxgMwRdv": {}, "Yk8Hu87T": {}}, "slotId": "X4cNzEa7", "sourceItemId": "UpEM81a3", "tags": ["h4tsRUfe", "BgGIndLc", "bHWZHI2b"], "type": "2ndo5l8F"}]}, {"consumeItems": [{"dateRangeValidation": false, "inventoryId": "yOn7In58", "options": ["vfmrvGsl", "HJR8t9Ut", "MNYKH6BU"], "qty": 2, "slotId": "xRRwy5On", "sourceItemId": "hT63aED4"}, {"dateRangeValidation": false, "inventoryId": "XxxjrYQN", "options": ["ISTa9nTu", "3iFbs7Tj", "C12GQF73"], "qty": 3, "slotId": "f4DUeVYP", "sourceItemId": "KrSByEfP"}, {"dateRangeValidation": true, "inventoryId": "2WV8yMT2", "options": ["k5a3GQio", "rvjgtasX", "GFtERA81"], "qty": 31, "slotId": "WUrNXhvN", "sourceItemId": "qTqhjbTv"}], "createItems": [{"customAttributes": {"C1Ut9yrZ": {}, "vYOjOOSa": {}, "JWwR9nXs": {}}, "inventoryConfigurationCode": "DEOGqD28", "inventoryId": "OWPzgesv", "qty": 5, "serverCustomAttributes": {"9v0JrcrS": {}, "S8t8Q1C9": {}, "ldWPiOQd": {}}, "slotId": "fWpu9gfZ", "slotUsed": 99, "source": "OTHER", "sourceItemId": "7kurx3TR", "tags": ["eKCne9Zc", "BG1xFCtr", "QpoGMqVh"], "toSpecificInventory": true, "type": "JGFqSuXP"}, {"customAttributes": {"uT1hmweG": {}, "mT3eU5aF": {}, "V8J1OCkg": {}}, "inventoryConfigurationCode": "oy5vvgSB", "inventoryId": "hdDt1AMu", "qty": 10, "serverCustomAttributes": {"zohvAhXv": {}, "TrhhDV0V": {}, "BvwuJPj0": {}}, "slotId": "dDtswbkt", "slotUsed": 54, "source": "OTHER", "sourceItemId": "Qf1Su47U", "tags": ["Z79psnjZ", "Sb8xwINJ", "Xs9tBHac"], "toSpecificInventory": false, "type": "WBTdvtQu"}, {"customAttributes": {"BnaIyVN8": {}, "OxvTLFgt": {}, "ksKQWfnl": {}}, "inventoryConfigurationCode": "0QZHNyb9", "inventoryId": "ytpysmiA", "qty": 95, "serverCustomAttributes": {"SxRID9p3": {}, "3iyjxy6H": {}, "n0PzpD4o": {}}, "slotId": "4pwS7yHM", "slotUsed": 63, "source": "OTHER", "sourceItemId": "bafwUIAF", "tags": ["WSdsJWGZ", "nVaEFrWI", "qFNAwMd2"], "toSpecificInventory": false, "type": "XWVV30VV"}], "removeItems": [{"inventoryId": "MDQLLFpm", "slotId": "KFyN33y4", "sourceItemId": "vQDND0DQ"}, {"inventoryId": "bBoiNMRc", "slotId": "NHskZklx", "sourceItemId": "iu5iMVVz"}, {"inventoryId": "mjEHIMIt", "slotId": "RFIemU6i", "sourceItemId": "fvPm9DQc"}], "targetUserId": "8xQUsnVV", "updateItems": [{"customAttributes": {"4WppbfcX": {}, "7hOKUwTi": {}, "vldjQIi6": {}}, "inventoryId": "0lgksly8", "serverCustomAttributes": {"FpQ6Uv9G": {}, "am6wBFpj": {}, "rjcYhJk9": {}}, "slotId": "2HQkSpRb", "sourceItemId": "8VGO9OSh", "tags": ["zdQReqC1", "L7BT0tP0", "onGTAR9l"], "type": "bMCPclaq"}, {"customAttributes": {"xTX1OOYq": {}, "AA4fomsb": {}, "UETZrlEu": {}}, "inventoryId": "yczTJmI4", "serverCustomAttributes": {"7hRO8vos": {}, "G88TPTND": {}, "nbgf0RqP": {}}, "slotId": "rv0uYs87", "sourceItemId": "D0vGd19R", "tags": ["KWacPZpn", "Ooz6kNop", "wfcsO5An"], "type": "h29vtgBw"}, {"customAttributes": {"jdNdVApz": {}, "SDn2Oezh": {}, "HMdKdLjm": {}}, "inventoryId": "1HIcu5RT", "serverCustomAttributes": {"lPJZhgjJ": {}, "3PYlKxbz": {}, "aE8cunIs": {}}, "slotId": "32HkEurx", "sourceItemId": "tcVC9Q3f", "tags": ["oyUmlNee", "JmHtojx7", "AZi3719R"], "type": "QM5XHlQG"}]}], "requestId": "EIDbMSMj"}' \
    > test.out 2>&1
eval_tap $? 2 'AdminCreateChainingOperations' test.out

#- 3 AdminListIntegrationConfigurations
./ng net.accelbyte.sdk.cli.Main inventory adminListIntegrationConfigurations \
    --namespace "$AB_NAMESPACE" \
    --limit '69' \
    --offset '11' \
    --sortBy 'createdAt:desc' \
    > test.out 2>&1
eval_tap $? 3 'AdminListIntegrationConfigurations' test.out

#- 4 AdminCreateIntegrationConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminCreateIntegrationConfiguration \
    --namespace "$AB_NAMESPACE" \
    --body '{"mapItemType": ["ye3AUwMq", "FW3WeWYH", "hhUVtWLV"], "serviceName": "uWDG3uR5", "targetInventoryCode": "w3Ul7Vba"}' \
    > test.out 2>&1
eval_tap $? 4 'AdminCreateIntegrationConfiguration' test.out

#- 5 AdminUpdateIntegrationConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateIntegrationConfiguration \
    --integrationConfigurationId 'yDLtP6z0' \
    --namespace "$AB_NAMESPACE" \
    --body '{"mapItemType": ["njlNEINg", "H1yEwUc0", "DLgEWG9S"], "serviceName": "sVmaz4vk", "targetInventoryCode": "AGcwnUzq"}' \
    > test.out 2>&1
eval_tap $? 5 'AdminUpdateIntegrationConfiguration' test.out

#- 6 AdminUpdateStatusIntegrationConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateStatusIntegrationConfiguration \
    --integrationConfigurationId 'GIaXgSS4' \
    --namespace "$AB_NAMESPACE" \
    --body '{"status": "INIT"}' \
    > test.out 2>&1
eval_tap $? 6 'AdminUpdateStatusIntegrationConfiguration' test.out

#- 7 AdminListInventories
./ng net.accelbyte.sdk.cli.Main inventory adminListInventories \
    --namespace "$AB_NAMESPACE" \
    --inventoryConfigurationCode 'PrUHx71M' \
    --limit '72' \
    --offset '90' \
    --sortBy 'createdAt' \
    --userId 'Typ8c518' \
    > test.out 2>&1
eval_tap $? 7 'AdminListInventories' test.out

#- 8 AdminCreateInventory
./ng net.accelbyte.sdk.cli.Main inventory adminCreateInventory \
    --namespace "$AB_NAMESPACE" \
    --body '{"inventoryConfigurationCode": "GT7MSaiR", "userId": "8vNWmih2"}' \
    > test.out 2>&1
eval_tap $? 8 'AdminCreateInventory' test.out

#- 9 AdminGetInventory
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventory \
    --inventoryId 'pAE9JBKe' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'AdminGetInventory' test.out

#- 10 AdminUpdateInventory
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateInventory \
    --inventoryId '9maytFjh' \
    --namespace "$AB_NAMESPACE" \
    --body '{"incMaxSlots": 77}' \
    > test.out 2>&1
eval_tap $? 10 'AdminUpdateInventory' test.out

#- 11 DeleteInventory
./ng net.accelbyte.sdk.cli.Main inventory deleteInventory \
    --inventoryId 'ArXULpaP' \
    --namespace "$AB_NAMESPACE" \
    --body '{"message": "SHW43THb"}' \
    > test.out 2>&1
eval_tap $? 11 'DeleteInventory' test.out

#- 12 AdminListItems
./ng net.accelbyte.sdk.cli.Main inventory adminListItems \
    --inventoryId 'qdUjXKG3' \
    --namespace "$AB_NAMESPACE" \
    --limit '37' \
    --offset '94' \
    --sortBy 'createdAt:asc' \
    --sourceItemId 'HUBnnfOF' \
    --tags 'GMqT5vrZ' \
    > test.out 2>&1
eval_tap $? 12 'AdminListItems' test.out

#- 13 AdminGetInventoryItem
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventoryItem \
    --inventoryId '9qUJ40Jf' \
    --namespace "$AB_NAMESPACE" \
    --slotId 'ocq020f1' \
    --sourceItemId 'zA7Ip5qb' \
    > test.out 2>&1
eval_tap $? 13 'AdminGetInventoryItem' test.out

#- 14 AdminListInventoryConfigurations
./ng net.accelbyte.sdk.cli.Main inventory adminListInventoryConfigurations \
    --namespace "$AB_NAMESPACE" \
    --code 'vec1R8B1' \
    --limit '77' \
    --offset '49' \
    --sortBy 'createdAt:desc' \
    > test.out 2>&1
eval_tap $? 14 'AdminListInventoryConfigurations' test.out

#- 15 AdminCreateInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminCreateInventoryConfiguration \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "f028j1dC", "description": "DlQbAMI7", "initialMaxSlots": 83, "maxInstancesPerUser": 6, "maxUpgradeSlots": 53, "name": "n9dpyVZc"}' \
    > test.out 2>&1
eval_tap $? 15 'AdminCreateInventoryConfiguration' test.out

#- 16 AdminGetInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventoryConfiguration \
    --inventoryConfigurationId 'ZZwoxuo6' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'AdminGetInventoryConfiguration' test.out

#- 17 AdminUpdateInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateInventoryConfiguration \
    --inventoryConfigurationId 'ZYNTALeq' \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "MPcYRaWc", "description": "f2XnldnM", "initialMaxSlots": 33, "maxInstancesPerUser": 90, "maxUpgradeSlots": 52, "name": "RC5BfewF"}' \
    > test.out 2>&1
eval_tap $? 17 'AdminUpdateInventoryConfiguration' test.out

#- 18 AdminDeleteInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteInventoryConfiguration \
    --inventoryConfigurationId 'NERwsNfe' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminDeleteInventoryConfiguration' test.out

#- 19 AdminListItemTypes
./ng net.accelbyte.sdk.cli.Main inventory adminListItemTypes \
    --namespace "$AB_NAMESPACE" \
    --limit '36' \
    --offset '99' \
    --sortBy 'name:desc' \
    > test.out 2>&1
eval_tap $? 19 'AdminListItemTypes' test.out

#- 20 AdminCreateItemType
./ng net.accelbyte.sdk.cli.Main inventory adminCreateItemType \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "t8RsSQpy"}' \
    > test.out 2>&1
eval_tap $? 20 'AdminCreateItemType' test.out

#- 21 AdminDeleteItemType
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteItemType \
    --itemTypeName 'qH5vqGNZ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'AdminDeleteItemType' test.out

#- 22 AdminListTags
./ng net.accelbyte.sdk.cli.Main inventory adminListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '80' \
    --offset '63' \
    --owner 'RoKkKIcj' \
    --sortBy 'createdAt:desc' \
    > test.out 2>&1
eval_tap $? 22 'AdminListTags' test.out

#- 23 AdminCreateTag
./ng net.accelbyte.sdk.cli.Main inventory adminCreateTag \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "14fY7qRw", "owner": "SERVER"}' \
    > test.out 2>&1
eval_tap $? 23 'AdminCreateTag' test.out

#- 24 AdminDeleteTag
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteTag \
    --namespace "$AB_NAMESPACE" \
    --tagName 'YymAg9Fj' \
    > test.out 2>&1
eval_tap $? 24 'AdminDeleteTag' test.out

#- 25 AdminConsumeUserItem
./ng net.accelbyte.sdk.cli.Main inventory adminConsumeUserItem \
    --inventoryId 'rZsOniBZ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'X9LCHGGu' \
    --dateRangeValidation 'NaXwhhFO' \
    --body '{"options": ["qK40fwgy", "fXpavRzQ", "NZS4rM4c"], "qty": 52, "slotId": "BcR5uYyy", "sourceItemId": "LXPecoih"}' \
    > test.out 2>&1
eval_tap $? 25 'AdminConsumeUserItem' test.out

#- 26 AdminBulkUpdateMyItems
./ng net.accelbyte.sdk.cli.Main inventory adminBulkUpdateMyItems \
    --inventoryId 'BgCegwEU' \
    --namespace "$AB_NAMESPACE" \
    --userId '8czZkvP3' \
    --body '[{"customAttributes": {"rhYkYc8N": {}, "u7t8u60x": {}, "TmsDPXO7": {}}, "serverCustomAttributes": {"Y5Jke0Ck": {}, "3pxjMMZa": {}, "vWdluVGq": {}}, "slotId": "NtlS1wLn", "sourceItemId": "Ns6J5N8a", "tags": ["yjJ5Diwy", "wdY1dIMT", "EUrD1v1q"], "type": "y43J5O1g"}, {"customAttributes": {"K7YsHfJe": {}, "km0K4Ybi": {}, "J2EVUkf3": {}}, "serverCustomAttributes": {"klo07qV3": {}, "1ciWkyun": {}, "pD4KzDDh": {}}, "slotId": "RjM5eJav", "sourceItemId": "if6yr1Ji", "tags": ["tTovCO6z", "JGNZHgc4", "kcYuo6zk"], "type": "0QkOo4hC"}, {"customAttributes": {"YNQaa2eE": {}, "vncwj2jA": {}, "rBiGaOt8": {}}, "serverCustomAttributes": {"q1z1wa0C": {}, "mo64IS1h": {}, "NG1MbPS3": {}}, "slotId": "w1XqXEva", "sourceItemId": "RtzWI0e2", "tags": ["GEKQFdQj", "Q80eNTlf", "RHagrdG8"], "type": "tfiFETg6"}]' \
    > test.out 2>&1
eval_tap $? 26 'AdminBulkUpdateMyItems' test.out

#- 27 AdminSaveItemToInventory
./ng net.accelbyte.sdk.cli.Main inventory adminSaveItemToInventory \
    --inventoryId '0vX68nnm' \
    --namespace "$AB_NAMESPACE" \
    --userId 'cGHOYGhm' \
    --body '{"customAttributes": {"PhlUr01s": {}, "k7NG9Qd3": {}, "2tBWUB8v": {}}, "qty": 8, "serverCustomAttributes": {"ksbqQPUg": {}, "R1doCtLx": {}, "Hl4MD3rK": {}}, "slotId": "LFqySWDM", "slotUsed": 19, "source": "OTHER", "sourceItemId": "8j2g2vK2", "tags": ["F9XOY0Y4", "BmWgQI4B", "F0ROTsO1"], "type": "pOOIOzBZ"}' \
    > test.out 2>&1
eval_tap $? 27 'AdminSaveItemToInventory' test.out

#- 28 AdminBulkRemoveItems
./ng net.accelbyte.sdk.cli.Main inventory adminBulkRemoveItems \
    --inventoryId 'ZrRkHXnM' \
    --namespace "$AB_NAMESPACE" \
    --userId 'oyohn7Xl' \
    --body '[{"slotId": "ciBnHEN8", "sourceItemId": "3I7BQkB5"}, {"slotId": "IBdQTIgb", "sourceItemId": "p4giYZ0q"}, {"slotId": "hHqRLxQi", "sourceItemId": "TKxnPWfX"}]' \
    > test.out 2>&1
eval_tap $? 28 'AdminBulkRemoveItems' test.out

#- 29 AdminBulkSaveItemToInventory
./ng net.accelbyte.sdk.cli.Main inventory adminBulkSaveItemToInventory \
    --inventoryId 'RibbPKAd' \
    --namespace "$AB_NAMESPACE" \
    --userId 'tSLJmH1I' \
    --body '[{"customAttributes": {"u8v89DJt": {}, "REx2amuE": {}, "zNWRH3mr": {}}, "qty": 7, "serverCustomAttributes": {"uxRz1uxx": {}, "wFS5cIum": {}, "bccbWGtv": {}}, "slotId": "dcZGMN7u", "slotUsed": 0, "source": "ECOMMERCE", "sourceItemId": "sQBYQcYY", "tags": ["HZy8eRgN", "ZdIrFn3M", "HsvtdvFr"], "type": "LHJpQEX6"}, {"customAttributes": {"Wypxgnk4": {}, "Z1mgSEof": {}, "xHrKieaG": {}}, "qty": 84, "serverCustomAttributes": {"54C0QPT7": {}, "qQBLHsfu": {}, "bFNXPsfz": {}}, "slotId": "p2UQQW98", "slotUsed": 94, "source": "ECOMMERCE", "sourceItemId": "Gx2mqqmR", "tags": ["2ZYO7DXj", "M3omI7cD", "pgWf2dQ5"], "type": "kozY28n9"}, {"customAttributes": {"gO77nUTp": {}, "hRV2v4Yg": {}, "ml1KnUtY": {}}, "qty": 82, "serverCustomAttributes": {"9hF3WESw": {}, "yzLwcicA": {}, "GpOnwICd": {}}, "slotId": "9xlVFxLg", "slotUsed": 57, "source": "OTHER", "sourceItemId": "zwMxDfbh", "tags": ["XS2tVXt5", "Bus6uKw5", "QkIXEqKr"], "type": "JDHq5GcC"}]' \
    > test.out 2>&1
eval_tap $? 29 'AdminBulkSaveItemToInventory' test.out

#- 30 AdminUpdateUserInventoriesByInventoryCode
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateUserInventoriesByInventoryCode \
    --inventoryConfigurationCode '7OpMTovl' \
    --namespace "$AB_NAMESPACE" \
    --userId '4C5zPsHU' \
    --body '{"incMaxSlots": 36}' \
    > test.out 2>&1
eval_tap $? 30 'AdminUpdateUserInventoriesByInventoryCode' test.out

#- 31 AdminSaveItem
./ng net.accelbyte.sdk.cli.Main inventory adminSaveItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'cq4LLztM' \
    --body '{"customAttributes": {"K9NA7f4x": {}, "nYuJYDEw": {}, "7Fu0gb7c": {}}, "inventoryConfigurationCode": "BFpmF5o0", "qty": 50, "serverCustomAttributes": {"uX3Pkrvo": {}, "t0ctnUUo": {}, "M4zk5lnn": {}}, "slotId": "8cPZgcRi", "slotUsed": 49, "source": "ECOMMERCE", "sourceItemId": "efenGjci", "tags": ["QjohXxFf", "GWjkS2Ag", "fIxX1Msm"], "type": "SgPCjkiZ"}' \
    > test.out 2>&1
eval_tap $? 31 'AdminSaveItem' test.out

#- 32 AdminBulkSaveItem
./ng net.accelbyte.sdk.cli.Main inventory adminBulkSaveItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'TtbdjApA' \
    --body '[{"customAttributes": {"cwgR8onx": {}, "lMCNQbZ2": {}, "aNrPDzwx": {}}, "inventoryConfigurationCode": "52ZbkTLK", "qty": 63, "serverCustomAttributes": {"Porbnqey": {}, "W9bRpE9u": {}, "mgx4w2rj": {}}, "slotId": "gNdDMQYL", "slotUsed": 28, "source": "ECOMMERCE", "sourceItemId": "lbfCOxLe", "tags": ["IKzHsr7k", "v8PaShm1", "wHHahNkm"], "type": "hUuPZW4z"}, {"customAttributes": {"D70ZBij0": {}, "GhhzubM7": {}, "PRDMB4wk": {}}, "inventoryConfigurationCode": "QTZl9DnZ", "qty": 80, "serverCustomAttributes": {"xKlsd9dp": {}, "RKMO1Inw": {}, "CAtNCHNH": {}}, "slotId": "1b81GWfP", "slotUsed": 71, "source": "OTHER", "sourceItemId": "ZBlzcVRu", "tags": ["gXGRWKQQ", "WogLNaqA", "vN3nwhkU"], "type": "AAzQtB7q"}, {"customAttributes": {"ydy8iWFQ": {}, "Ho4PIwMP": {}, "UfgEsG4w": {}}, "inventoryConfigurationCode": "WTCUq7XE", "qty": 86, "serverCustomAttributes": {"oORRCGGD": {}, "WVbq5Nfz": {}, "chj1GVu7": {}}, "slotId": "b3n5wuh1", "slotUsed": 39, "source": "ECOMMERCE", "sourceItemId": "99XE9OZZ", "tags": ["ITOM2r5q", "GC4XHhqa", "5wiM7rqm"], "type": "VA6MXiMJ"}]' \
    > test.out 2>&1
eval_tap $? 32 'AdminBulkSaveItem' test.out

#- 33 AdminSyncUserEntitlements
./ng net.accelbyte.sdk.cli.Main inventory adminSyncUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'sjIIJ6b1' \
    > test.out 2>&1
eval_tap $? 33 'AdminSyncUserEntitlements' test.out

#- 34 AdminPurchasable
./ng net.accelbyte.sdk.cli.Main inventory adminPurchasable \
    --namespace "$AB_NAMESPACE" \
    --userId 'rdur0Ipb' \
    --body '{"entitlementType": "NK4osIqZ", "inventoryConfig": {"slotUsed": 38}, "itemId": "7tBlwCpL", "itemType": "a26BQHJc", "items": [{"bundledQty": 58, "entitlementType": "bb1y6gOs", "inventoryConfig": {"slotUsed": 15}, "itemId": "U4ra1BWP", "itemType": "fLIWCSh0", "sku": "lDr6lC1F", "stackable": true, "useCount": 22}, {"bundledQty": 34, "entitlementType": "kqs45RcX", "inventoryConfig": {"slotUsed": 89}, "itemId": "1Y9xr6c9", "itemType": "305sjJl3", "sku": "PXwcyUsR", "stackable": false, "useCount": 100}, {"bundledQty": 79, "entitlementType": "6HBoBSu8", "inventoryConfig": {"slotUsed": 1}, "itemId": "4HZVBFod", "itemType": "KKCKANwt", "sku": "uJvbQJyP", "stackable": false, "useCount": 3}], "quantity": 1, "sku": "7hShnpf0", "stackable": true, "useCount": 46}' \
    > test.out 2>&1
eval_tap $? 34 'AdminPurchasable' test.out

#- 35 PublicListInventoryConfigurations
./ng net.accelbyte.sdk.cli.Main inventory publicListInventoryConfigurations \
    --namespace "$AB_NAMESPACE" \
    --code 'WCSl1gPg' \
    --limit '88' \
    --offset '22' \
    --sortBy 'createdAt:asc' \
    > test.out 2>&1
eval_tap $? 35 'PublicListInventoryConfigurations' test.out

#- 36 PublicListItemTypes
./ng net.accelbyte.sdk.cli.Main inventory publicListItemTypes \
    --namespace "$AB_NAMESPACE" \
    --limit '82' \
    --offset '51' \
    --sortBy 'name:desc' \
    > test.out 2>&1
eval_tap $? 36 'PublicListItemTypes' test.out

#- 37 PublicListTags
./ng net.accelbyte.sdk.cli.Main inventory publicListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '87' \
    --offset '49' \
    --sortBy 'name:desc' \
    > test.out 2>&1
eval_tap $? 37 'PublicListTags' test.out

#- 38 PublicListInventories
./ng net.accelbyte.sdk.cli.Main inventory publicListInventories \
    --namespace "$AB_NAMESPACE" \
    --inventoryConfigurationCode 'eWxWvF7Q' \
    --limit '68' \
    --offset '47' \
    --sortBy 'updatedAt:desc' \
    > test.out 2>&1
eval_tap $? 38 'PublicListInventories' test.out

#- 39 PublicConsumeMyItem
./ng net.accelbyte.sdk.cli.Main inventory publicConsumeMyItem \
    --inventoryId 'XIghiNSE' \
    --namespace "$AB_NAMESPACE" \
    --body '{"options": ["hIinA0UN", "n2FFJzu7", "SIxBIhBx"], "qty": 36, "slotId": "D2zYATSF", "sourceItemId": "rCz20ODm"}' \
    > test.out 2>&1
eval_tap $? 39 'PublicConsumeMyItem' test.out

#- 40 PublicListItems
./ng net.accelbyte.sdk.cli.Main inventory publicListItems \
    --inventoryId 'TE4Aeaf7' \
    --namespace "$AB_NAMESPACE" \
    --limit '5' \
    --offset '87' \
    --sortBy 'updatedAt:asc' \
    --sourceItemId 'Ga3dUytV' \
    --tags 'je7ol6FT' \
    > test.out 2>&1
eval_tap $? 40 'PublicListItems' test.out

#- 41 PublicBulkUpdateMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicBulkUpdateMyItems \
    --inventoryId 'gnUXxzvG' \
    --namespace "$AB_NAMESPACE" \
    --body '[{"customAttributes": {"mdkqqomz": {}, "816wb7b8": {}, "cbyArmry": {}}, "slotId": "TK759Jyc", "sourceItemId": "EmGD1YN9", "tags": ["g8uzTpCs", "JEYuT9b9", "zEoBtaZh"]}, {"customAttributes": {"tjQ1f6N5": {}, "7sYLddyN": {}, "eHLD9vAc": {}}, "slotId": "9UOrxd2N", "sourceItemId": "Anxh4fxt", "tags": ["mY3k3uwf", "o7qIRKf1", "c17i7pdc"]}, {"customAttributes": {"g1d8IdhC": {}, "TZ7dj40r": {}, "TTV21UCL": {}}, "slotId": "THMRR4kV", "sourceItemId": "ZwJTRsi3", "tags": ["1FEkdm31", "tz9lJaCN", "en5AYt34"]}]' \
    > test.out 2>&1
eval_tap $? 41 'PublicBulkUpdateMyItems' test.out

#- 42 PublicBulkRemoveMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicBulkRemoveMyItems \
    --inventoryId 'yobtpeX3' \
    --namespace "$AB_NAMESPACE" \
    --body '[{"slotId": "qklj2KOe", "sourceItemId": "EcTOuy8O"}, {"slotId": "zwTNCzh5", "sourceItemId": "Jq33NRJk"}, {"slotId": "ejxFYijl", "sourceItemId": "Mwtm9MoW"}]' \
    > test.out 2>&1
eval_tap $? 42 'PublicBulkRemoveMyItems' test.out

#- 43 PublicMoveMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicMoveMyItems \
    --inventoryId 'Nny8BwoI' \
    --namespace "$AB_NAMESPACE" \
    --body '{"items": [{"qty": 90, "slotId": "dyT6ZB0E", "sourceItemId": "e4yA0kSl"}, {"qty": 64, "slotId": "1VEPNIK8", "sourceItemId": "tNuSrO39"}, {"qty": 11, "slotId": "ta2MDDEm", "sourceItemId": "noA8IY0K"}], "srcInventoryId": "ePnfyKZB"}' \
    > test.out 2>&1
eval_tap $? 43 'PublicMoveMyItems' test.out

#- 44 PublicGetItem
./ng net.accelbyte.sdk.cli.Main inventory publicGetItem \
    --inventoryId 'ONnzZY6b' \
    --namespace "$AB_NAMESPACE" \
    --slotId 'oANvmUD7' \
    --sourceItemId 'InnXQb3u' \
    > test.out 2>&1
eval_tap $? 44 'PublicGetItem' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
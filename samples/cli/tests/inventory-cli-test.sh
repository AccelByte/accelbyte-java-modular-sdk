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
eval_tap 0 2 'AdminCreateChainingOperations # SKIP deprecated' test.out

#- 3 AdminListIntegrationConfigurations
./ng net.accelbyte.sdk.cli.Main inventory adminListIntegrationConfigurations \
    --namespace "$AB_NAMESPACE" \
    --limit '54' \
    --offset '88' \
    --sortBy 'createdAt' \
    > test.out 2>&1
eval_tap $? 3 'AdminListIntegrationConfigurations' test.out

#- 4 AdminCreateIntegrationConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminCreateIntegrationConfiguration \
    --namespace "$AB_NAMESPACE" \
    --body '{"mapItemType": ["iKtu8f0d", "Vp01jUk9", "40WHcIQi"], "serviceName": "RBodRWvd", "targetInventoryCode": "JzhmcbQP"}' \
    > test.out 2>&1
eval_tap $? 4 'AdminCreateIntegrationConfiguration' test.out

#- 5 AdminUpdateIntegrationConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateIntegrationConfiguration \
    --integrationConfigurationId 'UoVZj6DF' \
    --namespace "$AB_NAMESPACE" \
    --body '{"mapItemType": ["tKbfy6jL", "7rR2UhYe", "cPaM2hxj"], "serviceName": "P20CjmIA", "targetInventoryCode": "V3Dol1fF"}' \
    > test.out 2>&1
eval_tap $? 5 'AdminUpdateIntegrationConfiguration' test.out

#- 6 AdminUpdateStatusIntegrationConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateStatusIntegrationConfiguration \
    --integrationConfigurationId 'q0PlIaYy' \
    --namespace "$AB_NAMESPACE" \
    --body '{"status": "TIED"}' \
    > test.out 2>&1
eval_tap $? 6 'AdminUpdateStatusIntegrationConfiguration' test.out

#- 7 AdminListInventories
./ng net.accelbyte.sdk.cli.Main inventory adminListInventories \
    --namespace "$AB_NAMESPACE" \
    --inventoryConfigurationCode 't6X8zyft' \
    --limit '2' \
    --offset '87' \
    --sortBy 'createdAt:desc' \
    --userId 'pIL96NVv' \
    > test.out 2>&1
eval_tap $? 7 'AdminListInventories' test.out

#- 8 AdminCreateInventory
./ng net.accelbyte.sdk.cli.Main inventory adminCreateInventory \
    --namespace "$AB_NAMESPACE" \
    --body '{"inventoryConfigurationCode": "FMffJQBw", "userId": "zGuUK1Dm"}' \
    > test.out 2>&1
eval_tap $? 8 'AdminCreateInventory' test.out

#- 9 AdminGetInventory
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventory \
    --inventoryId 'JoOK6sWw' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'AdminGetInventory' test.out

#- 10 AdminUpdateInventory
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateInventory \
    --inventoryId 'skGIwjlo' \
    --namespace "$AB_NAMESPACE" \
    --body '{"incMaxSlots": 9}' \
    > test.out 2>&1
eval_tap $? 10 'AdminUpdateInventory' test.out

#- 11 DeleteInventory
./ng net.accelbyte.sdk.cli.Main inventory deleteInventory \
    --inventoryId 'kjAjMwBJ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"message": "hF1YIymE"}' \
    > test.out 2>&1
eval_tap $? 11 'DeleteInventory' test.out

#- 12 AdminListItems
./ng net.accelbyte.sdk.cli.Main inventory adminListItems \
    --inventoryId 'hWdoq3Si' \
    --namespace "$AB_NAMESPACE" \
    --limit '51' \
    --offset '93' \
    --sortBy 'updatedAt' \
    --sourceItemId 'DHS5U2wR' \
    --tags 'QFX96hZ1' \
    > test.out 2>&1
eval_tap $? 12 'AdminListItems' test.out

#- 13 AdminGetInventoryItem
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventoryItem \
    --inventoryId 'TsMBaYXw' \
    --namespace "$AB_NAMESPACE" \
    --slotId '1TRhiI1A' \
    --sourceItemId 'b0Q3wdUh' \
    > test.out 2>&1
eval_tap $? 13 'AdminGetInventoryItem' test.out

#- 14 AdminListInventoryConfigurations
./ng net.accelbyte.sdk.cli.Main inventory adminListInventoryConfigurations \
    --namespace "$AB_NAMESPACE" \
    --code 'AN6p405w' \
    --limit '89' \
    --offset '32' \
    --sortBy 'code' \
    > test.out 2>&1
eval_tap $? 14 'AdminListInventoryConfigurations' test.out

#- 15 AdminCreateInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminCreateInventoryConfiguration \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "kffs2eZJ", "description": "oHW7iHRj", "initialMaxSlots": 50, "maxInstancesPerUser": 82, "maxUpgradeSlots": 94, "name": "P0zPTwIa"}' \
    > test.out 2>&1
eval_tap $? 15 'AdminCreateInventoryConfiguration' test.out

#- 16 AdminGetInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventoryConfiguration \
    --inventoryConfigurationId '57oNc8za' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'AdminGetInventoryConfiguration' test.out

#- 17 AdminUpdateInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateInventoryConfiguration \
    --inventoryConfigurationId 'SzF6Qnnw' \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "iNXaKHIb", "description": "1klM57zH", "initialMaxSlots": 64, "maxInstancesPerUser": 3, "maxUpgradeSlots": 83, "name": "I0ILtN0Y"}' \
    > test.out 2>&1
eval_tap $? 17 'AdminUpdateInventoryConfiguration' test.out

#- 18 AdminDeleteInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteInventoryConfiguration \
    --inventoryConfigurationId 'djHKAhrc' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminDeleteInventoryConfiguration' test.out

#- 19 AdminListItemTypes
./ng net.accelbyte.sdk.cli.Main inventory adminListItemTypes \
    --namespace "$AB_NAMESPACE" \
    --limit '75' \
    --offset '77' \
    --sortBy 'createdAt:desc' \
    > test.out 2>&1
eval_tap $? 19 'AdminListItemTypes' test.out

#- 20 AdminCreateItemType
./ng net.accelbyte.sdk.cli.Main inventory adminCreateItemType \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "8wzGRy1B"}' \
    > test.out 2>&1
eval_tap $? 20 'AdminCreateItemType' test.out

#- 21 AdminDeleteItemType
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteItemType \
    --itemTypeName 'OLfaf58g' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'AdminDeleteItemType' test.out

#- 22 AdminListTags
./ng net.accelbyte.sdk.cli.Main inventory adminListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '69' \
    --offset '99' \
    --owner 'DoeVF7sQ' \
    --sortBy 'createdAt' \
    > test.out 2>&1
eval_tap $? 22 'AdminListTags' test.out

#- 23 AdminCreateTag
./ng net.accelbyte.sdk.cli.Main inventory adminCreateTag \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "sMPNcH6V", "owner": "SERVER"}' \
    > test.out 2>&1
eval_tap $? 23 'AdminCreateTag' test.out

#- 24 AdminDeleteTag
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteTag \
    --namespace "$AB_NAMESPACE" \
    --tagName '93PQhonS' \
    > test.out 2>&1
eval_tap $? 24 'AdminDeleteTag' test.out

#- 25 AdminConsumeUserItem
./ng net.accelbyte.sdk.cli.Main inventory adminConsumeUserItem \
    --inventoryId 'ZT4t3GB4' \
    --namespace "$AB_NAMESPACE" \
    --userId 'QrkjvodD' \
    --dateRangeValidation 'bfrImk0J' \
    --body '{"options": ["43sDUNv0", "Z8PgwW5a", "TgzkKPvP"], "qty": 77, "slotId": "orGNpr6H", "sourceItemId": "LOi9JEBg"}' \
    > test.out 2>&1
eval_tap $? 25 'AdminConsumeUserItem' test.out

#- 26 AdminBulkUpdateMyItems
./ng net.accelbyte.sdk.cli.Main inventory adminBulkUpdateMyItems \
    --inventoryId 'Kx3fOLob' \
    --namespace "$AB_NAMESPACE" \
    --userId 'T7seQG21' \
    --body '[{"customAttributes": {"7LmpQ48h": {}, "YPLBFX2C": {}, "3xxuVk6r": {}}, "serverCustomAttributes": {"m690FuYw": {}, "oPffSPT3": {}, "CEfGzhnY": {}}, "slotId": "lReZDDvH", "sourceItemId": "8BLx3cLg", "tags": ["ONhFa5TI", "WBZ9tpp3", "9PxOY7AB"], "type": "WKbyhocM"}, {"customAttributes": {"No98Bigv": {}, "a7PoekWk": {}, "wiGDBG1W": {}}, "serverCustomAttributes": {"C2INkjGc": {}, "6hr4J1pF": {}, "5mxjNMX6": {}}, "slotId": "7ldBxIMz", "sourceItemId": "h2lUFy0l", "tags": ["OGq0c7u8", "UZJfiaky", "l0ezqsMh"], "type": "m1XvXl65"}, {"customAttributes": {"Z2lTU8o4": {}, "ryk2mbjT": {}, "SygfGgCr": {}}, "serverCustomAttributes": {"sQwAf8iV": {}, "BZI969GE": {}, "grU6UT8I": {}}, "slotId": "FaGc9WLT", "sourceItemId": "p3LwkJNJ", "tags": ["b9loTKTv", "dv2SmHgK", "3FA10DDO"], "type": "vxAOasI4"}]' \
    > test.out 2>&1
eval_tap $? 26 'AdminBulkUpdateMyItems' test.out

#- 27 AdminSaveItemToInventory
./ng net.accelbyte.sdk.cli.Main inventory adminSaveItemToInventory \
    --inventoryId 'qsHeptuQ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'MU67h7iW' \
    --body '{"customAttributes": {"qdiN2tNa": {}, "8phmOWNX": {}, "FOifKVE4": {}}, "qty": 40, "serverCustomAttributes": {"lFq60xBL": {}, "TZwxLRCX": {}, "vGhFK2zU": {}}, "slotId": "MropnYrC", "slotUsed": 29, "source": "ECOMMERCE", "sourceItemId": "6lIQGWZ7", "tags": ["c2pWQZPd", "c9BxEwrY", "pMQzQlnc"], "type": "AZuN9dXH"}' \
    > test.out 2>&1
eval_tap $? 27 'AdminSaveItemToInventory' test.out

#- 28 AdminBulkRemoveItems
./ng net.accelbyte.sdk.cli.Main inventory adminBulkRemoveItems \
    --inventoryId 'P8ps11V1' \
    --namespace "$AB_NAMESPACE" \
    --userId '8s4ZWzFU' \
    --body '[{"slotId": "UmprL6He", "sourceItemId": "nuaEnDxJ"}, {"slotId": "upE9TCpQ", "sourceItemId": "WkEbsWah"}, {"slotId": "Da5qcLQx", "sourceItemId": "v3Jm3Adr"}]' \
    > test.out 2>&1
eval_tap $? 28 'AdminBulkRemoveItems' test.out

#- 29 AdminBulkSaveItemToInventory
./ng net.accelbyte.sdk.cli.Main inventory adminBulkSaveItemToInventory \
    --inventoryId '0bUOAbfT' \
    --namespace "$AB_NAMESPACE" \
    --userId 'UDplyxWl' \
    --body '[{"customAttributes": {"qencP3qh": {}, "XgDD5kXb": {}, "uZLufp6O": {}}, "qty": 9, "serverCustomAttributes": {"mHJyqTHE": {}, "WNYbFYPB": {}, "a52sHLdD": {}}, "slotId": "foW6N19j", "slotUsed": 56, "source": "OTHER", "sourceItemId": "BZBQXUGn", "tags": ["czhK5TmA", "pqPZ4w7n", "9cYcumJM"], "type": "w5MK9J07"}, {"customAttributes": {"WJ1Fgp9I": {}, "95IoRfB0": {}, "1hWYhGPq": {}}, "qty": 45, "serverCustomAttributes": {"h4EZ94rc": {}, "IHAMNVwC": {}, "JMThSC8q": {}}, "slotId": "1SfsAFfI", "slotUsed": 36, "source": "OTHER", "sourceItemId": "3euwBAFR", "tags": ["AkzkePRv", "mSYASssC", "uNg00Kbg"], "type": "Flb3Pz1F"}, {"customAttributes": {"OmBAnXz3": {}, "jZIBa2P1": {}, "CWk4kTgr": {}}, "qty": 21, "serverCustomAttributes": {"AZOaIjHN": {}, "hUrgRk3F": {}, "uAjpBUQf": {}}, "slotId": "TUPgbdb3", "slotUsed": 39, "source": "OTHER", "sourceItemId": "0iRtCSeL", "tags": ["xJMGFCsK", "nBnC6vJJ", "Tr7LkT0X"], "type": "g7e9PvKX"}]' \
    > test.out 2>&1
eval_tap $? 29 'AdminBulkSaveItemToInventory' test.out

#- 30 AdminUpdateUserInventoriesByInventoryCode
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateUserInventoriesByInventoryCode \
    --inventoryConfigurationCode 'HlsdALRF' \
    --namespace "$AB_NAMESPACE" \
    --userId 'mMLBgwbg' \
    --body '{"incMaxSlots": 71}' \
    > test.out 2>&1
eval_tap $? 30 'AdminUpdateUserInventoriesByInventoryCode' test.out

#- 31 AdminSaveItem
./ng net.accelbyte.sdk.cli.Main inventory adminSaveItem \
    --namespace "$AB_NAMESPACE" \
    --userId '5vqHrO2O' \
    --body '{"customAttributes": {"nlGhF7L6": {}, "1iGGOkvu": {}, "hABmV4Ry": {}}, "inventoryConfigurationCode": "g0FQG5K2", "qty": 29, "serverCustomAttributes": {"hViICwFc": {}, "aR2m7RML": {}, "tZLcMwyi": {}}, "slotId": "3yp7GYwj", "slotUsed": 52, "source": "OTHER", "sourceItemId": "of1TgieU", "tags": ["44cLbNnv", "EdGo8Xqe", "lTlYwKWT"], "type": "SFtpor4Y"}' \
    > test.out 2>&1
eval_tap $? 31 'AdminSaveItem' test.out

#- 32 AdminBulkSaveItem
./ng net.accelbyte.sdk.cli.Main inventory adminBulkSaveItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'Gp8Mejq4' \
    --body '[{"customAttributes": {"euRGAION": {}, "vRkmuFj5": {}, "FDYOPO1G": {}}, "inventoryConfigurationCode": "Xnf4CQSE", "qty": 43, "serverCustomAttributes": {"c8IFGGpO": {}, "iMs4uoqt": {}, "LF4JNJz9": {}}, "slotId": "I8MGv7wn", "slotUsed": 66, "source": "OTHER", "sourceItemId": "96D2pVAf", "tags": ["dpfxrg0F", "pZlTBwST", "IGkv2EfO"], "type": "V9ka5PIR"}, {"customAttributes": {"KlQP9HaW": {}, "dxt6hYhJ": {}, "hGV1Wvhy": {}}, "inventoryConfigurationCode": "gUK8QxSB", "qty": 29, "serverCustomAttributes": {"Ucr5CGcd": {}, "FK91HyOe": {}, "qDtfNJpm": {}}, "slotId": "rGlVbfSP", "slotUsed": 64, "source": "ECOMMERCE", "sourceItemId": "4bxAryCc", "tags": ["sKl9hmxc", "AUX5r7Xw", "ZHQRDuOO"], "type": "4CbcPiLD"}, {"customAttributes": {"PG9KDrwg": {}, "pAqSBCYg": {}, "lyqPcuMB": {}}, "inventoryConfigurationCode": "brTlbwGr", "qty": 37, "serverCustomAttributes": {"vWhZGaCN": {}, "tvrBSFQu": {}, "1iGt5hhq": {}}, "slotId": "9yCs9Wxu", "slotUsed": 62, "source": "OTHER", "sourceItemId": "33lHBn0g", "tags": ["mfPT44Nt", "WcGhjKB5", "JMoTcMZ8"], "type": "mcDXRNJA"}]' \
    > test.out 2>&1
eval_tap $? 32 'AdminBulkSaveItem' test.out

#- 33 AdminSyncUserEntitlements
./ng net.accelbyte.sdk.cli.Main inventory adminSyncUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId '6ry2UR6r' \
    > test.out 2>&1
eval_tap $? 33 'AdminSyncUserEntitlements' test.out

#- 34 AdminPurchasable
./ng net.accelbyte.sdk.cli.Main inventory adminPurchasable \
    --namespace "$AB_NAMESPACE" \
    --userId 'KmxjDwHF' \
    --body '{"entitlementType": "45YFK1sQ", "inventoryConfig": {"slotUsed": 21}, "itemId": "yIPhwxFE", "itemType": "rpruAEnM", "items": [{"bundledQty": 56, "entitlementType": "5FSdv6Sz", "inventoryConfig": {"slotUsed": 77}, "itemId": "qUZw60I8", "itemType": "qUa6b95Y", "sku": "uLjXVibm", "stackable": true, "useCount": 66}, {"bundledQty": 71, "entitlementType": "IOcGezkP", "inventoryConfig": {"slotUsed": 81}, "itemId": "U3Ox7BID", "itemType": "gBPpPHbQ", "sku": "e7gRbva1", "stackable": true, "useCount": 76}, {"bundledQty": 12, "entitlementType": "o1lGGDNc", "inventoryConfig": {"slotUsed": 96}, "itemId": "aGdGUiH7", "itemType": "ZXsPH9qG", "sku": "wZ9n7qFm", "stackable": false, "useCount": 29}], "quantity": 48, "sku": "wLUJ12KY", "stackable": false, "useCount": 54}' \
    > test.out 2>&1
eval_tap $? 34 'AdminPurchasable' test.out

#- 35 PublicListInventoryConfigurations
./ng net.accelbyte.sdk.cli.Main inventory publicListInventoryConfigurations \
    --namespace "$AB_NAMESPACE" \
    --code 'yRtlpop1' \
    --limit '7' \
    --offset '97' \
    --sortBy 'createdAt:asc' \
    > test.out 2>&1
eval_tap $? 35 'PublicListInventoryConfigurations' test.out

#- 36 PublicListItemTypes
./ng net.accelbyte.sdk.cli.Main inventory publicListItemTypes \
    --namespace "$AB_NAMESPACE" \
    --limit '89' \
    --offset '3' \
    --sortBy 'createdAt' \
    > test.out 2>&1
eval_tap $? 36 'PublicListItemTypes' test.out

#- 37 PublicListTags
./ng net.accelbyte.sdk.cli.Main inventory publicListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '40' \
    --offset '62' \
    --sortBy 'createdAt:asc' \
    > test.out 2>&1
eval_tap $? 37 'PublicListTags' test.out

#- 38 PublicListInventories
./ng net.accelbyte.sdk.cli.Main inventory publicListInventories \
    --namespace "$AB_NAMESPACE" \
    --inventoryConfigurationCode 'X2zvC6js' \
    --limit '49' \
    --offset '98' \
    --sortBy 'updatedAt' \
    > test.out 2>&1
eval_tap $? 38 'PublicListInventories' test.out

#- 39 PublicConsumeMyItem
./ng net.accelbyte.sdk.cli.Main inventory publicConsumeMyItem \
    --inventoryId 'cvdYeYVC' \
    --namespace "$AB_NAMESPACE" \
    --body '{"options": ["J3I3Emsp", "O8HYMs8r", "M2GFK3Ik"], "qty": 29, "slotId": "SjbnIc7R", "sourceItemId": "xPNRELR4"}' \
    > test.out 2>&1
eval_tap $? 39 'PublicConsumeMyItem' test.out

#- 40 PublicListItems
./ng net.accelbyte.sdk.cli.Main inventory publicListItems \
    --inventoryId 'aTspmEoS' \
    --namespace "$AB_NAMESPACE" \
    --limit '11' \
    --offset '85' \
    --sortBy 'updatedAt:asc' \
    --sourceItemId '6zo91oQ0' \
    --tags 'UBqeakLU' \
    > test.out 2>&1
eval_tap $? 40 'PublicListItems' test.out

#- 41 PublicBulkUpdateMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicBulkUpdateMyItems \
    --inventoryId 'euaDLGve' \
    --namespace "$AB_NAMESPACE" \
    --body '[{"customAttributes": {"9KMtp8hh": {}, "NSZxyCLb": {}, "nvGhYMe5": {}}, "slotId": "lhkTgo6g", "sourceItemId": "WhIigrn9", "tags": ["3uwBJpXn", "ogwUiST5", "pxJ5dO5X"]}, {"customAttributes": {"QQm3lLHR": {}, "fkjASFTh": {}, "Nl4qNhOt": {}}, "slotId": "zjGG8orU", "sourceItemId": "flZSD1pc", "tags": ["wRne1poj", "ly8H7FiS", "lcQo7y5u"]}, {"customAttributes": {"spfEq8EF": {}, "INMKHaMa": {}, "OXUsOXvi": {}}, "slotId": "AxpmAfI0", "sourceItemId": "9jjMIWuI", "tags": ["tr8Ykq5d", "4oRupXt9", "EYPDoljq"]}]' \
    > test.out 2>&1
eval_tap $? 41 'PublicBulkUpdateMyItems' test.out

#- 42 PublicBulkRemoveMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicBulkRemoveMyItems \
    --inventoryId 'hblyQxKs' \
    --namespace "$AB_NAMESPACE" \
    --body '[{"slotId": "qiI2gOht", "sourceItemId": "fofiPvrn"}, {"slotId": "KB5SxFoK", "sourceItemId": "TjqINsHU"}, {"slotId": "zxw71OJL", "sourceItemId": "sCTlGp9j"}]' \
    > test.out 2>&1
eval_tap $? 42 'PublicBulkRemoveMyItems' test.out

#- 43 PublicMoveMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicMoveMyItems \
    --inventoryId 'aqRpTfBL' \
    --namespace "$AB_NAMESPACE" \
    --body '{"items": [{"qty": 56, "slotId": "Lao68THf", "sourceItemId": "anuFMvtK"}, {"qty": 53, "slotId": "7keRmRmN", "sourceItemId": "1IYI8Wr6"}, {"qty": 52, "slotId": "h53TFe98", "sourceItemId": "GQPSeUbb"}], "srcInventoryId": "XNl7xSEP"}' \
    > test.out 2>&1
eval_tap $? 43 'PublicMoveMyItems' test.out

#- 44 PublicGetItem
./ng net.accelbyte.sdk.cli.Main inventory publicGetItem \
    --inventoryId 'lWlbev8C' \
    --namespace "$AB_NAMESPACE" \
    --slotId 'HcmOFu8W' \
    --sourceItemId 'p5YDfu7w' \
    > test.out 2>&1
eval_tap $? 44 'PublicGetItem' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
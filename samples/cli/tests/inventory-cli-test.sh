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
    --limit '17' \
    --offset '34' \
    --sortBy 'createdAt:asc' \
    > test.out 2>&1
eval_tap $? 3 'AdminListIntegrationConfigurations' test.out

#- 4 AdminCreateIntegrationConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminCreateIntegrationConfiguration \
    --namespace "$AB_NAMESPACE" \
    --body '{"mapItemType": ["ioTQk47i", "r2dF9sjM", "0RYWNNme"], "serviceName": "nqNAKlvi", "targetInventoryCode": "QMIAjGHF"}' \
    > test.out 2>&1
eval_tap $? 4 'AdminCreateIntegrationConfiguration' test.out

#- 5 AdminUpdateIntegrationConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateIntegrationConfiguration \
    --integrationConfigurationId 'oQoRiDzX' \
    --namespace "$AB_NAMESPACE" \
    --body '{"mapItemType": ["P11vqimF", "K2lLrOYm", "lXWvCT5e"], "serviceName": "CVD1m3VQ", "targetInventoryCode": "XXWcr83j"}' \
    > test.out 2>&1
eval_tap $? 5 'AdminUpdateIntegrationConfiguration' test.out

#- 6 AdminUpdateStatusIntegrationConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateStatusIntegrationConfiguration \
    --integrationConfigurationId 'GCq3hL1y' \
    --namespace "$AB_NAMESPACE" \
    --body '{"status": "INIT"}' \
    > test.out 2>&1
eval_tap $? 6 'AdminUpdateStatusIntegrationConfiguration' test.out

#- 7 AdminListInventories
./ng net.accelbyte.sdk.cli.Main inventory adminListInventories \
    --namespace "$AB_NAMESPACE" \
    --inventoryConfigurationCode '1dZnQOBe' \
    --limit '95' \
    --offset '24' \
    --sortBy 'updatedAt' \
    --userId 'saABfK55' \
    > test.out 2>&1
eval_tap $? 7 'AdminListInventories' test.out

#- 8 AdminCreateInventory
./ng net.accelbyte.sdk.cli.Main inventory adminCreateInventory \
    --namespace "$AB_NAMESPACE" \
    --body '{"inventoryConfigurationCode": "Jf9rFGLt", "userId": "FZzJL7E4"}' \
    > test.out 2>&1
eval_tap $? 8 'AdminCreateInventory' test.out

#- 9 AdminGetInventory
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventory \
    --inventoryId 'pEQGwCga' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'AdminGetInventory' test.out

#- 10 AdminUpdateInventory
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateInventory \
    --inventoryId 'yhGdN8IZ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"incMaxSlots": 92}' \
    > test.out 2>&1
eval_tap $? 10 'AdminUpdateInventory' test.out

#- 11 DeleteInventory
./ng net.accelbyte.sdk.cli.Main inventory deleteInventory \
    --inventoryId 'Pq7A9PKI' \
    --namespace "$AB_NAMESPACE" \
    --body '{"message": "2fP8ApiA"}' \
    > test.out 2>&1
eval_tap $? 11 'DeleteInventory' test.out

#- 12 AdminListItems
./ng net.accelbyte.sdk.cli.Main inventory adminListItems \
    --inventoryId 'swYMs1Z9' \
    --namespace "$AB_NAMESPACE" \
    --limit '23' \
    --offset '64' \
    --sortBy 'updatedAt' \
    --sourceItemId 'pNI6ScqY' \
    --tags 'DxC4GtF7' \
    > test.out 2>&1
eval_tap $? 12 'AdminListItems' test.out

#- 13 AdminGetInventoryItem
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventoryItem \
    --inventoryId 'lfmT8Cuv' \
    --namespace "$AB_NAMESPACE" \
    --slotId 'weik60Y6' \
    --sourceItemId 'Ia4C0vYf' \
    > test.out 2>&1
eval_tap $? 13 'AdminGetInventoryItem' test.out

#- 14 AdminListInventoryConfigurations
./ng net.accelbyte.sdk.cli.Main inventory adminListInventoryConfigurations \
    --namespace "$AB_NAMESPACE" \
    --code '7oE9gHY8' \
    --limit '31' \
    --offset '41' \
    --sortBy 'updatedAt:desc' \
    > test.out 2>&1
eval_tap $? 14 'AdminListInventoryConfigurations' test.out

#- 15 AdminCreateInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminCreateInventoryConfiguration \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "pLi1ZAvQ", "description": "FLndDusb", "initialMaxSlots": 12, "maxInstancesPerUser": 10, "maxUpgradeSlots": 42, "name": "kKYAScNn"}' \
    > test.out 2>&1
eval_tap $? 15 'AdminCreateInventoryConfiguration' test.out

#- 16 AdminGetInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventoryConfiguration \
    --inventoryConfigurationId 'Rpeveiwq' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'AdminGetInventoryConfiguration' test.out

#- 17 AdminUpdateInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateInventoryConfiguration \
    --inventoryConfigurationId 'BnZQglGn' \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "cYylgcJn", "description": "Bzw8bnkg", "initialMaxSlots": 16, "maxInstancesPerUser": 60, "maxUpgradeSlots": 2, "name": "8SXE7kPf"}' \
    > test.out 2>&1
eval_tap $? 17 'AdminUpdateInventoryConfiguration' test.out

#- 18 AdminDeleteInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteInventoryConfiguration \
    --inventoryConfigurationId 'YBqIlYca' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminDeleteInventoryConfiguration' test.out

#- 19 AdminListItemTypes
./ng net.accelbyte.sdk.cli.Main inventory adminListItemTypes \
    --namespace "$AB_NAMESPACE" \
    --limit '54' \
    --offset '55' \
    --sortBy 'createdAt:asc' \
    > test.out 2>&1
eval_tap $? 19 'AdminListItemTypes' test.out

#- 20 AdminCreateItemType
./ng net.accelbyte.sdk.cli.Main inventory adminCreateItemType \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "8Q1K4aGg"}' \
    > test.out 2>&1
eval_tap $? 20 'AdminCreateItemType' test.out

#- 21 AdminDeleteItemType
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteItemType \
    --itemTypeName '0LhBoBe9' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'AdminDeleteItemType' test.out

#- 22 AdminListTags
./ng net.accelbyte.sdk.cli.Main inventory adminListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '28' \
    --offset '1' \
    --owner 'NOObbLad' \
    --sortBy 'name' \
    > test.out 2>&1
eval_tap $? 22 'AdminListTags' test.out

#- 23 AdminCreateTag
./ng net.accelbyte.sdk.cli.Main inventory adminCreateTag \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "WdWzwFNc", "owner": "SERVER"}' \
    > test.out 2>&1
eval_tap $? 23 'AdminCreateTag' test.out

#- 24 AdminDeleteTag
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteTag \
    --namespace "$AB_NAMESPACE" \
    --tagName 'FhZIscPM' \
    > test.out 2>&1
eval_tap $? 24 'AdminDeleteTag' test.out

#- 25 AdminConsumeUserItem
./ng net.accelbyte.sdk.cli.Main inventory adminConsumeUserItem \
    --inventoryId 'MjLddtmD' \
    --namespace "$AB_NAMESPACE" \
    --userId 'AQbLU7Ji' \
    --dateRangeValidation 'vxobI1Mi' \
    --body '{"options": ["HtzavnFE", "32PSEDKE", "gO4G2Oj8"], "qty": 41, "slotId": "NHMUEifJ", "sourceItemId": "8nXh1rzI"}' \
    > test.out 2>&1
eval_tap $? 25 'AdminConsumeUserItem' test.out

#- 26 AdminBulkUpdateMyItems
./ng net.accelbyte.sdk.cli.Main inventory adminBulkUpdateMyItems \
    --inventoryId 'EieqrQ9f' \
    --namespace "$AB_NAMESPACE" \
    --userId 'UHojRkYJ' \
    --body '[{"customAttributes": {"zhc9akan": {}, "EjkX3doz": {}, "uQKRBfuh": {}}, "serverCustomAttributes": {"DQZT7Nym": {}, "wMjHBi05": {}, "GqEtfiVI": {}}, "slotId": "Ynbbfdwd", "sourceItemId": "UC0LnckU", "tags": ["3ExBOL9H", "FFgFPNgj", "BlDQDJID"], "type": "fW1PJ29P"}, {"customAttributes": {"hFvcd2EU": {}, "qtXwX7EC": {}, "kgE5OiSr": {}}, "serverCustomAttributes": {"xhMY2kwP": {}, "bhGNnmuc": {}, "dJ1nSmQe": {}}, "slotId": "bcMPRL39", "sourceItemId": "DH69wk8c", "tags": ["uw9cIwmT", "MKQUH40l", "djo30hze"], "type": "m6GR5ICm"}, {"customAttributes": {"3kmwVHd1": {}, "jwcDXeOs": {}, "G9TwE0yN": {}}, "serverCustomAttributes": {"vG90cWUg": {}, "dbGIeDo5": {}, "oVVpdQwl": {}}, "slotId": "xp8vWzol", "sourceItemId": "Ju3GX0Rf", "tags": ["ZrS6eoz8", "21IeeSRc", "3bDpWrZ2"], "type": "LlJNqyVt"}]' \
    > test.out 2>&1
eval_tap $? 26 'AdminBulkUpdateMyItems' test.out

#- 27 AdminSaveItemToInventory
./ng net.accelbyte.sdk.cli.Main inventory adminSaveItemToInventory \
    --inventoryId '8EktegrL' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Gx34PWyA' \
    --body '{"customAttributes": {"m6NRvvPK": {}, "35mBtwMm": {}, "jDUBIbsY": {}}, "qty": 96, "serverCustomAttributes": {"xcd5WmYN": {}, "z71VPkUZ": {}, "Wvr43qE0": {}}, "slotId": "HxfdBbRX", "slotUsed": 76, "source": "ECOMMERCE", "sourceItemId": "YW7V9nc5", "tags": ["RWmnRabr", "iIgtXTLK", "c70w7c54"], "type": "fE8jBWze"}' \
    > test.out 2>&1
eval_tap $? 27 'AdminSaveItemToInventory' test.out

#- 28 AdminBulkRemoveItems
./ng net.accelbyte.sdk.cli.Main inventory adminBulkRemoveItems \
    --inventoryId 'vnaRrlmh' \
    --namespace "$AB_NAMESPACE" \
    --userId 'QgjsI8P9' \
    --body '[{"slotId": "dFqG5IkU", "sourceItemId": "BThDPsdY"}, {"slotId": "EBtIEnkl", "sourceItemId": "kpAIQqfI"}, {"slotId": "HjNPPgw9", "sourceItemId": "faVIv7S1"}]' \
    > test.out 2>&1
eval_tap $? 28 'AdminBulkRemoveItems' test.out

#- 29 AdminBulkSaveItemToInventory
./ng net.accelbyte.sdk.cli.Main inventory adminBulkSaveItemToInventory \
    --inventoryId 'w955U0s3' \
    --namespace "$AB_NAMESPACE" \
    --userId 'hw1qNX8b' \
    --body '[{"customAttributes": {"Z9QKaw6g": {}, "Hh5mnG9d": {}, "Krin1biF": {}}, "qty": 60, "serverCustomAttributes": {"d0NuaGvk": {}, "IVx4aABC": {}, "MAPtnrD7": {}}, "slotId": "J3P5QHrB", "slotUsed": 50, "source": "OTHER", "sourceItemId": "UH9opDT5", "tags": ["qd9EoCWF", "1pd4iWWP", "YdC99z4R"], "type": "esuxEDbr"}, {"customAttributes": {"vt3I1hSK": {}, "VW2XARzi": {}, "r1AT441G": {}}, "qty": 51, "serverCustomAttributes": {"VG3l0hb6": {}, "vTrIDocE": {}, "PSJCorlx": {}}, "slotId": "8lWvp0Gq", "slotUsed": 11, "source": "OTHER", "sourceItemId": "6pEQ5O4f", "tags": ["SzYjtA2Z", "EsCLq2Ms", "cj5XcnGR"], "type": "5cDawr3z"}, {"customAttributes": {"8MpRdL0J": {}, "UxdbxnLe": {}, "OehJD4Dt": {}}, "qty": 99, "serverCustomAttributes": {"HdwxHsmX": {}, "m7nebAzk": {}, "Zvy4m7yb": {}}, "slotId": "XYE9Uumo", "slotUsed": 14, "source": "OTHER", "sourceItemId": "x8m4vWa4", "tags": ["0t8eBs4b", "kLKjWtjF", "OlURcxtT"], "type": "gmNbqrUY"}]' \
    > test.out 2>&1
eval_tap $? 29 'AdminBulkSaveItemToInventory' test.out

#- 30 AdminUpdateUserInventoriesByInventoryCode
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateUserInventoriesByInventoryCode \
    --inventoryConfigurationCode 'u4l0q8Or' \
    --namespace "$AB_NAMESPACE" \
    --userId 'vx9VvSqi' \
    --body '{"incMaxSlots": 10}' \
    > test.out 2>&1
eval_tap $? 30 'AdminUpdateUserInventoriesByInventoryCode' test.out

#- 31 AdminSaveItem
./ng net.accelbyte.sdk.cli.Main inventory adminSaveItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'HLMAhOFL' \
    --body '{"customAttributes": {"W35Hlk1X": {}, "EvM3pLXT": {}, "lfjb13Ov": {}}, "inventoryConfigurationCode": "uYIz2nHq", "qty": 52, "serverCustomAttributes": {"RNQcH4FT": {}, "kf6SA6H9": {}, "cNvmcPYk": {}}, "slotId": "9eatVgqo", "slotUsed": 85, "source": "ECOMMERCE", "sourceItemId": "qSzQIGae", "tags": ["luN0uQkA", "ZIKPzAgN", "B3vh4NZD"], "type": "CENlahzk"}' \
    > test.out 2>&1
eval_tap $? 31 'AdminSaveItem' test.out

#- 32 AdminBulkSaveItem
./ng net.accelbyte.sdk.cli.Main inventory adminBulkSaveItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'cvK1hh5N' \
    --body '[{"customAttributes": {"ARD3UkuY": {}, "lfur2FJf": {}, "XGCwg5zc": {}}, "inventoryConfigurationCode": "PhnkSryq", "qty": 8, "serverCustomAttributes": {"G7yUtNot": {}, "CXKeJu9O": {}, "6q7meDsG": {}}, "slotId": "1TuocQfw", "slotUsed": 1, "source": "ECOMMERCE", "sourceItemId": "dSYxzm0f", "tags": ["NMCx9AjH", "sSPo5Vqt", "zvMUBYkQ"], "type": "qPbHBmHF"}, {"customAttributes": {"4xuFYzKl": {}, "Vig18G5i": {}, "YbHLiE59": {}}, "inventoryConfigurationCode": "4j4GuHaB", "qty": 59, "serverCustomAttributes": {"wW9Neq5K": {}, "9H5bAx6I": {}, "QGxgYYnL": {}}, "slotId": "wRXB42k0", "slotUsed": 3, "source": "ECOMMERCE", "sourceItemId": "WCRmMNVZ", "tags": ["9Z1AHr81", "s1qAhhNa", "AffHBY2N"], "type": "W4xdGeJi"}, {"customAttributes": {"XPkwjoB2": {}, "SzhiJYcg": {}, "y8MgR8UO": {}}, "inventoryConfigurationCode": "xCrgr15x", "qty": 54, "serverCustomAttributes": {"hNrI3yox": {}, "GogG5rTY": {}, "eWvob9Ke": {}}, "slotId": "dvEbXkCa", "slotUsed": 11, "source": "OTHER", "sourceItemId": "aBLiwaOK", "tags": ["3rxWD6Lh", "ya0m5NKD", "dBKsyd52"], "type": "8eQSvUb5"}]' \
    > test.out 2>&1
eval_tap $? 32 'AdminBulkSaveItem' test.out

#- 33 AdminSyncUserEntitlements
./ng net.accelbyte.sdk.cli.Main inventory adminSyncUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'PYiAKMiK' \
    > test.out 2>&1
eval_tap $? 33 'AdminSyncUserEntitlements' test.out

#- 34 AdminPurchasable
./ng net.accelbyte.sdk.cli.Main inventory adminPurchasable \
    --namespace "$AB_NAMESPACE" \
    --userId 'mBYsRQKR' \
    --body '{"entitlementType": "taJYbZo8", "inventoryConfig": {"slotUsed": 20}, "itemId": "VJ2bBldi", "itemType": "O7f8BEnx", "items": [{"bundledQty": 93, "entitlementType": "5ikGZeNx", "inventoryConfig": {"slotUsed": 72}, "itemId": "BtSxuXKa", "itemType": "M6ypVZRH", "sku": "vkNLQBM7", "stackable": true, "useCount": 43}, {"bundledQty": 81, "entitlementType": "XyrfbNNo", "inventoryConfig": {"slotUsed": 59}, "itemId": "si77JO0M", "itemType": "j0i9wY0b", "sku": "OW3vh2yY", "stackable": true, "useCount": 54}, {"bundledQty": 52, "entitlementType": "KssDEeFY", "inventoryConfig": {"slotUsed": 40}, "itemId": "do7Z6C18", "itemType": "TutDkuyY", "sku": "7xx1seDF", "stackable": false, "useCount": 37}], "quantity": 18, "sku": "FUAmUE3D", "stackable": true, "useCount": 9}' \
    > test.out 2>&1
eval_tap $? 34 'AdminPurchasable' test.out

#- 35 PublicListInventoryConfigurations
./ng net.accelbyte.sdk.cli.Main inventory publicListInventoryConfigurations \
    --namespace "$AB_NAMESPACE" \
    --code 'vmgqJtKg' \
    --limit '1' \
    --offset '90' \
    --sortBy 'createdAt:asc' \
    > test.out 2>&1
eval_tap $? 35 'PublicListInventoryConfigurations' test.out

#- 36 PublicListItemTypes
./ng net.accelbyte.sdk.cli.Main inventory publicListItemTypes \
    --namespace "$AB_NAMESPACE" \
    --limit '84' \
    --offset '29' \
    --sortBy 'name' \
    > test.out 2>&1
eval_tap $? 36 'PublicListItemTypes' test.out

#- 37 PublicListTags
./ng net.accelbyte.sdk.cli.Main inventory publicListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '17' \
    --offset '37' \
    --sortBy 'name' \
    > test.out 2>&1
eval_tap $? 37 'PublicListTags' test.out

#- 38 PublicListInventories
./ng net.accelbyte.sdk.cli.Main inventory publicListInventories \
    --namespace "$AB_NAMESPACE" \
    --inventoryConfigurationCode 'aGQYZzNZ' \
    --limit '46' \
    --offset '71' \
    --sortBy 'createdAt:asc' \
    > test.out 2>&1
eval_tap $? 38 'PublicListInventories' test.out

#- 39 PublicConsumeMyItem
./ng net.accelbyte.sdk.cli.Main inventory publicConsumeMyItem \
    --inventoryId '7wAkqJEN' \
    --namespace "$AB_NAMESPACE" \
    --body '{"options": ["60fiW4KJ", "V1Cks67P", "pAi6vS3K"], "qty": 62, "slotId": "XcxZ0Ns7", "sourceItemId": "FY3FxhnE"}' \
    > test.out 2>&1
eval_tap $? 39 'PublicConsumeMyItem' test.out

#- 40 PublicListItems
./ng net.accelbyte.sdk.cli.Main inventory publicListItems \
    --inventoryId '2zlbLVka' \
    --namespace "$AB_NAMESPACE" \
    --limit '36' \
    --offset '44' \
    --sortBy 'updatedAt:desc' \
    --sourceItemId 'C6sZG7is' \
    --tags 'Phfm7DEq' \
    > test.out 2>&1
eval_tap $? 40 'PublicListItems' test.out

#- 41 PublicBulkUpdateMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicBulkUpdateMyItems \
    --inventoryId 'jdKD0dVr' \
    --namespace "$AB_NAMESPACE" \
    --body '[{"customAttributes": {"wFx8R6BG": {}, "7hF2bEm4": {}, "2hFoRFHq": {}}, "slotId": "0hTIPrQ2", "sourceItemId": "zva01Q3P", "tags": ["NULPPwIP", "JvYbI7vW", "DDQWKa3z"]}, {"customAttributes": {"mZJWAhPR": {}, "9V5mzQnW": {}, "IviyLdQM": {}}, "slotId": "7Hg6SPzS", "sourceItemId": "Fe8agiMN", "tags": ["W8DMUhTS", "Q3VZuOgA", "l00ZeB4k"]}, {"customAttributes": {"31e614kQ": {}, "U5iVjxpj": {}, "im0yoPr7": {}}, "slotId": "WYU2sKbP", "sourceItemId": "Evc4sGLi", "tags": ["aQOJc38E", "nKOu4Z3e", "mym6dmLL"]}]' \
    > test.out 2>&1
eval_tap $? 41 'PublicBulkUpdateMyItems' test.out

#- 42 PublicBulkRemoveMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicBulkRemoveMyItems \
    --inventoryId 'sgfZeT32' \
    --namespace "$AB_NAMESPACE" \
    --body '[{"slotId": "1Bo4ytql", "sourceItemId": "IkYONZNx"}, {"slotId": "Wh4Pwfs6", "sourceItemId": "BTqJCeKg"}, {"slotId": "2uXaT8qY", "sourceItemId": "l5LPUMC7"}]' \
    > test.out 2>&1
eval_tap $? 42 'PublicBulkRemoveMyItems' test.out

#- 43 PublicMoveMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicMoveMyItems \
    --inventoryId 'JIAa839D' \
    --namespace "$AB_NAMESPACE" \
    --body '{"items": [{"qty": 19, "slotId": "tHIileHy", "sourceItemId": "xhvaYS2a"}, {"qty": 48, "slotId": "8Cn1XXqP", "sourceItemId": "wiTLDftz"}, {"qty": 95, "slotId": "gogAwDLP", "sourceItemId": "IvEk4hWe"}], "srcInventoryId": "sf9lJHep"}' \
    > test.out 2>&1
eval_tap $? 43 'PublicMoveMyItems' test.out

#- 44 PublicGetItem
./ng net.accelbyte.sdk.cli.Main inventory publicGetItem \
    --inventoryId 'tsFk9TKt' \
    --namespace "$AB_NAMESPACE" \
    --slotId 'bDA3L00Y' \
    --sourceItemId 't4K0prh2' \
    > test.out 2>&1
eval_tap $? 44 'PublicGetItem' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
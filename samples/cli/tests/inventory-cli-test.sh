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
    --body '{"message": "2BO5WVxG", "operations": [{"consumeItems": [{"dateRangeValidation": true, "inventoryId": "7ERMd7VT", "options": ["E2SvJMYu", "5zhSw3jg", "Nk7mLa8L"], "qty": 2, "slotId": "UyNHMuWL", "sourceItemId": "783QYyX4"}, {"dateRangeValidation": false, "inventoryId": "OctHgQBI", "options": ["s8hnVTpQ", "x2CpsguD", "Lcueligj"], "qty": 15, "slotId": "u5oAYBQg", "sourceItemId": "rjsBOVAB"}, {"dateRangeValidation": true, "inventoryId": "ESP3pmPE", "options": ["KHUfPsMW", "XHWU62f3", "xWimVeGD"], "qty": 55, "slotId": "q4XAZVhl", "sourceItemId": "Vdeupx4B"}], "createItems": [{"customAttributes": {"YW57nGYr": {}, "F3d9aE8M": {}, "IIze4pIV": {}}, "inventoryConfigurationCode": "d20SjrZ3", "inventoryId": "xH1oDUad", "qty": 68, "serverCustomAttributes": {"kPneb3pU": {}, "Y9D9JijS": {}, "dqn9YLVe": {}}, "slotId": "AIV3uHKA", "slotUsed": 53, "source": "OTHER", "sourceItemId": "vvkIr6Me", "tags": ["txC5mpby", "SlDwjYMb", "QuYVD1YN"], "toSpecificInventory": true, "type": "AB2YYIxa"}, {"customAttributes": {"FKgfOR4T": {}, "Wfnvr3XO": {}, "e7U074tF": {}}, "inventoryConfigurationCode": "GivKk9oO", "inventoryId": "RPtDAJ0A", "qty": 95, "serverCustomAttributes": {"JHFI3Jsz": {}, "msTru8dR": {}, "s2GPupW3": {}}, "slotId": "6jd4w0wj", "slotUsed": 91, "source": "ECOMMERCE", "sourceItemId": "pMUHOwQB", "tags": ["qSPKU3Fn", "drKLnP3j", "ISL9GQeS"], "toSpecificInventory": false, "type": "bw1cHf7O"}, {"customAttributes": {"fhDioH5T": {}, "1ulyAGNc": {}, "EqFRydZP": {}}, "inventoryConfigurationCode": "l1FJegO3", "inventoryId": "i8sYcizE", "qty": 77, "serverCustomAttributes": {"5QLwfV2z": {}, "5UyFPtdJ": {}, "6eziMBoC": {}}, "slotId": "tqaSprwJ", "slotUsed": 42, "source": "OTHER", "sourceItemId": "tei6baFs", "tags": ["PMviKLii", "L85gODCd", "Zf7JhSkQ"], "toSpecificInventory": true, "type": "8vgFtBgU"}], "removeItems": [{"inventoryId": "Ho1R0ZfN", "slotId": "UScNrEJ4", "sourceItemId": "6wnwAmsE"}, {"inventoryId": "lg3hBRfA", "slotId": "nstyOiga", "sourceItemId": "NqfTPKPi"}, {"inventoryId": "YByG4f4S", "slotId": "WGstR804", "sourceItemId": "QnFd3Hda"}], "targetUserId": "kKVkSG57", "updateItems": [{"customAttributes": {"dYWD1FwS": {}, "aPVKQ533": {}, "uPHQ5z7E": {}}, "inventoryId": "CSlvpdIl", "serverCustomAttributes": {"eh2hQfm9": {}, "goYQXXx7": {}, "6kEvNt1B": {}}, "slotId": "U3nhFEHK", "sourceItemId": "qE98vBqx", "tags": ["6yJy1FOT", "2oVdNOoB", "28FkxyO5"], "type": "xYRRseOv"}, {"customAttributes": {"81REUmOc": {}, "GZB5fPFN": {}, "zWLGuZnd": {}}, "inventoryId": "Cp4LRE22", "serverCustomAttributes": {"YJ3PV6VF": {}, "nuHJRJzH": {}, "jP63uGY1": {}}, "slotId": "GJXWmWY7", "sourceItemId": "Trc0e2ur", "tags": ["CyzVy8pe", "LtM3gsbK", "Lz5RYJn0"], "type": "T239aI08"}, {"customAttributes": {"krH9WdlC": {}, "zI3xTMNJ": {}, "q8dyMzg6": {}}, "inventoryId": "rTxpki7e", "serverCustomAttributes": {"gyUr7Ctm": {}, "zfXuzBfT": {}, "NSaqB09Z": {}}, "slotId": "7Q84V7hG", "sourceItemId": "L6uS7mTY", "tags": ["hGgS2QQa", "HNEFDWtI", "uczuMspA"], "type": "sKAts19w"}]}, {"consumeItems": [{"dateRangeValidation": true, "inventoryId": "Ywq1bKcq", "options": ["WHBOuxRs", "4iRIcwov", "3bkFRaCE"], "qty": 75, "slotId": "3g1iMbGC", "sourceItemId": "bweRXjKV"}, {"dateRangeValidation": false, "inventoryId": "NOf3nc90", "options": ["Pg6zBHcs", "MFBWP3gv", "eDBrTZzB"], "qty": 52, "slotId": "qFKjKW7k", "sourceItemId": "uIwaN4qF"}, {"dateRangeValidation": true, "inventoryId": "rXX6lIpK", "options": ["L6MgNgXt", "6HQZTtwi", "iAdlveaG"], "qty": 50, "slotId": "AGU7bZRA", "sourceItemId": "xztm705o"}], "createItems": [{"customAttributes": {"4xHs8Z7E": {}, "A15ZTrJw": {}, "DCeZf7Rb": {}}, "inventoryConfigurationCode": "Lk1kVEpE", "inventoryId": "miQFdG19", "qty": 72, "serverCustomAttributes": {"1FZiI9cK": {}, "QVZOVNBq": {}, "QulbBZBA": {}}, "slotId": "7ynFYQV9", "slotUsed": 73, "source": "OTHER", "sourceItemId": "LvA7x1qY", "tags": ["z6qA84yh", "fmG520JR", "hw8htnpe"], "toSpecificInventory": true, "type": "MWXYkKxj"}, {"customAttributes": {"8tWt7JzY": {}, "MYTzlOKy": {}, "2bTcufsG": {}}, "inventoryConfigurationCode": "YhOgIArr", "inventoryId": "ICD1vXzH", "qty": 38, "serverCustomAttributes": {"rcEZZW0Y": {}, "RxvY0qO9": {}, "P18BkG77": {}}, "slotId": "jHFI8mFo", "slotUsed": 13, "source": "OTHER", "sourceItemId": "VElsTJLN", "tags": ["SARUcnBm", "bnI8sX8K", "tQR1TlzV"], "toSpecificInventory": true, "type": "Pwo06oun"}, {"customAttributes": {"lzQIij2I": {}, "aOrkXFEt": {}, "DpXFrLGn": {}}, "inventoryConfigurationCode": "KDynEO8p", "inventoryId": "4dmiV7nP", "qty": 25, "serverCustomAttributes": {"TKtIhvmO": {}, "0kVIBn8U": {}, "U3J3Zwuy": {}}, "slotId": "silfwNqg", "slotUsed": 89, "source": "ECOMMERCE", "sourceItemId": "HYtJomYr", "tags": ["BUm0Cecy", "lWYem0lI", "SprHYd5N"], "toSpecificInventory": false, "type": "e5Wpu2FH"}], "removeItems": [{"inventoryId": "1clEjb54", "slotId": "KXOXLdmP", "sourceItemId": "Z6gNJR8x"}, {"inventoryId": "61UXcqqX", "slotId": "ELxaFJ4z", "sourceItemId": "oZtVajPj"}, {"inventoryId": "mF2XePyd", "slotId": "B2lMneko", "sourceItemId": "3o874Gt8"}], "targetUserId": "f07BF7zL", "updateItems": [{"customAttributes": {"8Ddmqmx1": {}, "R91gcAXe": {}, "9htyqLDK": {}}, "inventoryId": "oqZJAdnK", "serverCustomAttributes": {"4WKiGrsM": {}, "OE2Qtm8k": {}, "mL2Sq8Ed": {}}, "slotId": "UD2XyiHk", "sourceItemId": "a1OFBv9M", "tags": ["T00esLCl", "rJocoLMq", "YQOuwCJx"], "type": "mZA18lUe"}, {"customAttributes": {"othGXicN": {}, "rQ0EGMVx": {}, "vzqWcbJl": {}}, "inventoryId": "GIri4PHq", "serverCustomAttributes": {"R0PZzScc": {}, "TRwd3T4q": {}, "SVgWxS7Q": {}}, "slotId": "vACxsJwL", "sourceItemId": "CgllSyV6", "tags": ["BJ3Qsi0M", "2ld59dfZ", "EvlBmtP3"], "type": "3tyEOJpQ"}, {"customAttributes": {"PdpAoduI": {}, "Y3cQeBSr": {}, "16aVPkNo": {}}, "inventoryId": "IaSnl3To", "serverCustomAttributes": {"G45f52xB": {}, "TDVWJ51L": {}, "JPUzoGkS": {}}, "slotId": "qKTtM8nr", "sourceItemId": "uYy7KqUs", "tags": ["Ely8ExxN", "lgba8W7x", "1CgrMuWP"], "type": "RQzRbibg"}]}, {"consumeItems": [{"dateRangeValidation": false, "inventoryId": "XtZydiwx", "options": ["fkXKx76N", "xBqsY9Bq", "zyyA1xmN"], "qty": 79, "slotId": "w7JGh8gC", "sourceItemId": "hd3i7tCp"}, {"dateRangeValidation": true, "inventoryId": "cGUQGjMO", "options": ["gkntXGcQ", "G6SjmVIY", "uW7XbMT3"], "qty": 68, "slotId": "xTGCkI8v", "sourceItemId": "3r8A99lr"}, {"dateRangeValidation": true, "inventoryId": "7JtM4akd", "options": ["zKIQEsvd", "pOSYIyOG", "cC783F5B"], "qty": 3, "slotId": "LShmvqpF", "sourceItemId": "o2meLB27"}], "createItems": [{"customAttributes": {"1inH1bex": {}, "paZhrxBC": {}, "qsLh0DsN": {}}, "inventoryConfigurationCode": "D4BxDvjz", "inventoryId": "eb9NcmTw", "qty": 44, "serverCustomAttributes": {"AaCcKPfr": {}, "3Kdzj9Rm": {}, "BNcZmIl0": {}}, "slotId": "aunGmmNg", "slotUsed": 100, "source": "OTHER", "sourceItemId": "xjm9vi69", "tags": ["O5YB7Sro", "BLJeB06v", "64nYkFC7"], "toSpecificInventory": false, "type": "2cWNbGOB"}, {"customAttributes": {"XOaqLSOP": {}, "j5LuEall": {}, "czBkl1lc": {}}, "inventoryConfigurationCode": "CznTrUvQ", "inventoryId": "WL0sHpEq", "qty": 26, "serverCustomAttributes": {"1J6BcYWm": {}, "EkRPUcI8": {}, "ukKjy7hm": {}}, "slotId": "LhTQB7Xo", "slotUsed": 12, "source": "OTHER", "sourceItemId": "VBKLsX4x", "tags": ["jCkx6Z9f", "I5Rm47IR", "7g7KWufy"], "toSpecificInventory": true, "type": "SqysLh6X"}, {"customAttributes": {"XCc1XTKZ": {}, "Et52XMvT": {}, "r47dGHdo": {}}, "inventoryConfigurationCode": "hqqEIikC", "inventoryId": "i3PIAXXd", "qty": 51, "serverCustomAttributes": {"Oa7QUJwb": {}, "tinP6ulJ": {}, "ymxt3FWY": {}}, "slotId": "JYIOuTot", "slotUsed": 2, "source": "OTHER", "sourceItemId": "swcH6yB4", "tags": ["v32bO997", "PEtsMtuX", "LFl3doxQ"], "toSpecificInventory": true, "type": "fsgFrepp"}], "removeItems": [{"inventoryId": "mZZfhgQ3", "slotId": "PZUg42Lw", "sourceItemId": "6QITJxnx"}, {"inventoryId": "NnRPplT5", "slotId": "lNqLLN4n", "sourceItemId": "HVz1byqI"}, {"inventoryId": "Gs4yxwT9", "slotId": "swMN7o7k", "sourceItemId": "5AqArv34"}], "targetUserId": "9SidBvuE", "updateItems": [{"customAttributes": {"nGdW35nF": {}, "qXEbduQp": {}, "MeWLxaOr": {}}, "inventoryId": "nMM39thY", "serverCustomAttributes": {"FNMiAZlX": {}, "kVl9yPMs": {}, "HkmAYgQp": {}}, "slotId": "mQ2rpOHY", "sourceItemId": "08SqiwNt", "tags": ["E5o3GMBK", "m7VXPjSh", "AnD8isKw"], "type": "uYDzKejN"}, {"customAttributes": {"XIkEThaw": {}, "gFsHF8qF": {}, "IlBOncsX": {}}, "inventoryId": "QOUWGGiD", "serverCustomAttributes": {"Y4z1u9hN": {}, "3fOnqrET": {}, "Ij46R7jw": {}}, "slotId": "8hm9jjnn", "sourceItemId": "FsJZMrtc", "tags": ["d1jjvjGh", "bORFtnHg", "VJMinydK"], "type": "W1s9wa1H"}, {"customAttributes": {"oOrXE44c": {}, "FKNvZII2": {}, "VTyhzFUJ": {}}, "inventoryId": "Afh8VjHX", "serverCustomAttributes": {"E9EWnp1c": {}, "mUtkayzl": {}, "xbUlLo5E": {}}, "slotId": "FKXfMXxg", "sourceItemId": "62I5oI66", "tags": ["ykvF3bsc", "wUp3C6R7", "0dzw2kur"], "type": "QWI0Zgj0"}]}], "requestId": "2dNsZGZ0"}' \
    > test.out 2>&1
eval_tap $? 2 'AdminCreateChainingOperations' test.out

#- 3 AdminListIntegrationConfigurations
./ng net.accelbyte.sdk.cli.Main inventory adminListIntegrationConfigurations \
    --namespace "$AB_NAMESPACE" \
    --limit '74' \
    --offset '65' \
    --sortBy 'createdAt:asc' \
    > test.out 2>&1
eval_tap $? 3 'AdminListIntegrationConfigurations' test.out

#- 4 AdminCreateIntegrationConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminCreateIntegrationConfiguration \
    --namespace "$AB_NAMESPACE" \
    --body '{"mapItemType": ["7ydftOe8", "vcX3Uvxu", "N5t0l3lc"], "serviceName": "jFLItmlY", "targetInventoryCode": "Zsjm37W0"}' \
    > test.out 2>&1
eval_tap $? 4 'AdminCreateIntegrationConfiguration' test.out

#- 5 AdminUpdateIntegrationConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateIntegrationConfiguration \
    --integrationConfigurationId 'trhrOyEa' \
    --namespace "$AB_NAMESPACE" \
    --body '{"mapItemType": ["nFtCf2xZ", "ZlKCQpfG", "KihcynKj"], "serviceName": "zgpsCvzq", "targetInventoryCode": "ZPAepxn9"}' \
    > test.out 2>&1
eval_tap $? 5 'AdminUpdateIntegrationConfiguration' test.out

#- 6 AdminUpdateStatusIntegrationConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateStatusIntegrationConfiguration \
    --integrationConfigurationId 'RevaTnnJ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"status": "TIED"}' \
    > test.out 2>&1
eval_tap $? 6 'AdminUpdateStatusIntegrationConfiguration' test.out

#- 7 AdminListInventories
./ng net.accelbyte.sdk.cli.Main inventory adminListInventories \
    --namespace "$AB_NAMESPACE" \
    --inventoryConfigurationCode '2xoLolIK' \
    --limit '24' \
    --offset '36' \
    --sortBy 'inventoryConfigurationCode' \
    --userId 'psqHEPb0' \
    > test.out 2>&1
eval_tap $? 7 'AdminListInventories' test.out

#- 8 AdminCreateInventory
./ng net.accelbyte.sdk.cli.Main inventory adminCreateInventory \
    --namespace "$AB_NAMESPACE" \
    --body '{"inventoryConfigurationCode": "Lj4awhWT", "userId": "CyoWADdX"}' \
    > test.out 2>&1
eval_tap $? 8 'AdminCreateInventory' test.out

#- 9 AdminGetInventory
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventory \
    --inventoryId 'wGhixwj6' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'AdminGetInventory' test.out

#- 10 AdminUpdateInventory
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateInventory \
    --inventoryId '4pl2yF9s' \
    --namespace "$AB_NAMESPACE" \
    --body '{"incMaxSlots": 43}' \
    > test.out 2>&1
eval_tap $? 10 'AdminUpdateInventory' test.out

#- 11 DeleteInventory
./ng net.accelbyte.sdk.cli.Main inventory deleteInventory \
    --inventoryId 'SFFbDmbS' \
    --namespace "$AB_NAMESPACE" \
    --body '{"message": "yb4Ic1vE"}' \
    > test.out 2>&1
eval_tap $? 11 'DeleteInventory' test.out

#- 12 AdminListItems
./ng net.accelbyte.sdk.cli.Main inventory adminListItems \
    --inventoryId 'oz4z657h' \
    --namespace "$AB_NAMESPACE" \
    --limit '88' \
    --offset '11' \
    --sortBy 'updatedAt:asc' \
    --sourceItemId 'BdCFnbUi' \
    --tags 'iTIF1E4H' \
    > test.out 2>&1
eval_tap $? 12 'AdminListItems' test.out

#- 13 AdminGetInventoryItem
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventoryItem \
    --inventoryId 't0SUu4fj' \
    --namespace "$AB_NAMESPACE" \
    --slotId 'T0sQB9dJ' \
    --sourceItemId 'lwnEyDCq' \
    > test.out 2>&1
eval_tap $? 13 'AdminGetInventoryItem' test.out

#- 14 AdminListInventoryConfigurations
./ng net.accelbyte.sdk.cli.Main inventory adminListInventoryConfigurations \
    --namespace "$AB_NAMESPACE" \
    --code 'BYvTTzDS' \
    --limit '98' \
    --offset '34' \
    --sortBy 'code:desc' \
    > test.out 2>&1
eval_tap $? 14 'AdminListInventoryConfigurations' test.out

#- 15 AdminCreateInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminCreateInventoryConfiguration \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "7lG07rBm", "description": "Re6iNMX1", "initialMaxSlots": 45, "maxInstancesPerUser": 34, "maxUpgradeSlots": 0, "name": "E2EBh0Hw"}' \
    > test.out 2>&1
eval_tap $? 15 'AdminCreateInventoryConfiguration' test.out

#- 16 AdminGetInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventoryConfiguration \
    --inventoryConfigurationId 'i41gam6D' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'AdminGetInventoryConfiguration' test.out

#- 17 AdminUpdateInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateInventoryConfiguration \
    --inventoryConfigurationId 'pnDLZvI9' \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "Lz7oAxq3", "description": "LIZG3sPO", "initialMaxSlots": 35, "maxInstancesPerUser": 23, "maxUpgradeSlots": 0, "name": "cZZIxclq"}' \
    > test.out 2>&1
eval_tap $? 17 'AdminUpdateInventoryConfiguration' test.out

#- 18 AdminDeleteInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteInventoryConfiguration \
    --inventoryConfigurationId 'rLQiFTtV' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminDeleteInventoryConfiguration' test.out

#- 19 AdminListItemTypes
./ng net.accelbyte.sdk.cli.Main inventory adminListItemTypes \
    --namespace "$AB_NAMESPACE" \
    --limit '93' \
    --offset '82' \
    --sortBy 'name:asc' \
    > test.out 2>&1
eval_tap $? 19 'AdminListItemTypes' test.out

#- 20 AdminCreateItemType
./ng net.accelbyte.sdk.cli.Main inventory adminCreateItemType \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "0vvUgzTo"}' \
    > test.out 2>&1
eval_tap $? 20 'AdminCreateItemType' test.out

#- 21 AdminDeleteItemType
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteItemType \
    --itemTypeName 'eHqO7Qmc' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'AdminDeleteItemType' test.out

#- 22 AdminListTags
./ng net.accelbyte.sdk.cli.Main inventory adminListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '63' \
    --offset '36' \
    --owner 'oxFuBJcf' \
    --sortBy 'name:desc' \
    > test.out 2>&1
eval_tap $? 22 'AdminListTags' test.out

#- 23 AdminCreateTag
./ng net.accelbyte.sdk.cli.Main inventory adminCreateTag \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "H6prORKG", "owner": "CLIENT"}' \
    > test.out 2>&1
eval_tap $? 23 'AdminCreateTag' test.out

#- 24 AdminDeleteTag
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteTag \
    --namespace "$AB_NAMESPACE" \
    --tagName 'PtyDUxK6' \
    > test.out 2>&1
eval_tap $? 24 'AdminDeleteTag' test.out

#- 25 AdminConsumeUserItem
./ng net.accelbyte.sdk.cli.Main inventory adminConsumeUserItem \
    --inventoryId 'sG0zbMLP' \
    --namespace "$AB_NAMESPACE" \
    --userId 'aokRpx7G' \
    --dateRangeValidation 'Lb7Y5XQl' \
    --body '{"options": ["23vYEzLo", "sbFHI5eC", "C2i72rSO"], "qty": 88, "slotId": "LUbPLOUD", "sourceItemId": "ET6yC3ZH"}' \
    > test.out 2>&1
eval_tap $? 25 'AdminConsumeUserItem' test.out

#- 26 AdminBulkUpdateMyItems
./ng net.accelbyte.sdk.cli.Main inventory adminBulkUpdateMyItems \
    --inventoryId 'NvFikgRY' \
    --namespace "$AB_NAMESPACE" \
    --userId 'YbYzbTBi' \
    --body '[{"customAttributes": {"u3pFkcPW": {}, "YQbgNI8F": {}, "FHpQp0Gq": {}}, "serverCustomAttributes": {"g0DFzfUQ": {}, "wh4Cp2I2": {}, "9hmyNBl2": {}}, "slotId": "VJbLQJTR", "sourceItemId": "5J15I71l", "tags": ["89tLffRi", "mcVtupim", "7XTJzbw7"], "type": "eSLXQc42"}, {"customAttributes": {"zbcbdTHC": {}, "6bSQkPMN": {}, "0CuFJe00": {}}, "serverCustomAttributes": {"QkWVmZJ8": {}, "AZoVr1ah": {}, "gXIp03Jq": {}}, "slotId": "DTmg1gaz", "sourceItemId": "C7UTfUIh", "tags": ["yVjoIxlO", "QHF7csr7", "igYkClxo"], "type": "g9JajDFd"}, {"customAttributes": {"unRpsDL7": {}, "ELgY44Sx": {}, "zdtptNUW": {}}, "serverCustomAttributes": {"cODfzlDu": {}, "szJ22anG": {}, "eCVCOnUO": {}}, "slotId": "t49vQ5bL", "sourceItemId": "Tzmlnfai", "tags": ["Q4xMXVb5", "CHCdq226", "l1PqXhr1"], "type": "9JEyeNaq"}]' \
    > test.out 2>&1
eval_tap $? 26 'AdminBulkUpdateMyItems' test.out

#- 27 AdminSaveItemToInventory
./ng net.accelbyte.sdk.cli.Main inventory adminSaveItemToInventory \
    --inventoryId 'qO6oI0mK' \
    --namespace "$AB_NAMESPACE" \
    --userId '2DM12wYA' \
    --body '{"customAttributes": {"bL88oGpB": {}, "uhBaX8KV": {}, "EJ33dLxn": {}}, "qty": 92, "serverCustomAttributes": {"FmyekhTE": {}, "6KSiLuXf": {}, "ifccAzmZ": {}}, "slotId": "x7khQ4Cx", "slotUsed": 85, "source": "OTHER", "sourceItemId": "jfGBiDbh", "tags": ["Z6wrXcqD", "1Cp4ga8x", "2ZwKcdjZ"], "type": "W1gXFCcG"}' \
    > test.out 2>&1
eval_tap $? 27 'AdminSaveItemToInventory' test.out

#- 28 AdminBulkRemoveItems
./ng net.accelbyte.sdk.cli.Main inventory adminBulkRemoveItems \
    --inventoryId 'qNaJR8GK' \
    --namespace "$AB_NAMESPACE" \
    --userId '8IwCwV1N' \
    --body '[{"slotId": "5fWjQCCZ", "sourceItemId": "DRgqOFoK"}, {"slotId": "EloomYCH", "sourceItemId": "jKJaftIz"}, {"slotId": "OOYh3BRS", "sourceItemId": "ovW6lW5o"}]' \
    > test.out 2>&1
eval_tap $? 28 'AdminBulkRemoveItems' test.out

#- 29 AdminBulkSaveItemToInventory
./ng net.accelbyte.sdk.cli.Main inventory adminBulkSaveItemToInventory \
    --inventoryId 'YGGso3Ds' \
    --namespace "$AB_NAMESPACE" \
    --userId 'lg5bU7Zt' \
    --body '[{"customAttributes": {"cNu6GqE0": {}, "tubaFRJr": {}, "5L7nPMgn": {}}, "qty": 38, "serverCustomAttributes": {"dLKBlPEG": {}, "MJNGXXek": {}, "mkUSzWZV": {}}, "slotId": "FPDKF9hM", "slotUsed": 29, "source": "OTHER", "sourceItemId": "ooKk5TPh", "tags": ["keqoMhXU", "2G3JEdvQ", "GH9BgJZU"], "type": "8vlmd4te"}, {"customAttributes": {"JgHvGdIJ": {}, "qhpti2Hb": {}, "3muUNvcl": {}}, "qty": 60, "serverCustomAttributes": {"jVwRnI5u": {}, "XBmNeI9E": {}, "AV3uZeyy": {}}, "slotId": "8wi49D6F", "slotUsed": 8, "source": "ECOMMERCE", "sourceItemId": "S0vYJ7rH", "tags": ["9TtSzX14", "VVqbxd7k", "0kZCTc2K"], "type": "UR9L8eCn"}, {"customAttributes": {"FKuPLzbe": {}, "aYz8FWHi": {}, "9RiM8dGP": {}}, "qty": 13, "serverCustomAttributes": {"WtfqZfl7": {}, "Tp82CEEF": {}, "1WP6X2GR": {}}, "slotId": "0Qvfg4HQ", "slotUsed": 61, "source": "ECOMMERCE", "sourceItemId": "22Snk02r", "tags": ["gQt30T78", "uqNdh2BP", "qzcJByWd"], "type": "vjrcHAmp"}]' \
    > test.out 2>&1
eval_tap $? 29 'AdminBulkSaveItemToInventory' test.out

#- 30 AdminUpdateUserInventoriesByInventoryCode
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateUserInventoriesByInventoryCode \
    --inventoryConfigurationCode 'LAyhLwPi' \
    --namespace "$AB_NAMESPACE" \
    --userId 'qyBNAXVf' \
    --body '{"incMaxSlots": 80}' \
    > test.out 2>&1
eval_tap $? 30 'AdminUpdateUserInventoriesByInventoryCode' test.out

#- 31 AdminSaveItem
./ng net.accelbyte.sdk.cli.Main inventory adminSaveItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'QkJgojnZ' \
    --body '{"customAttributes": {"cS7w26Bq": {}, "E6s2vZwt": {}, "w919jVUe": {}}, "inventoryConfigurationCode": "ElnbzZ5k", "qty": 28, "serverCustomAttributes": {"tGFhHyGB": {}, "gtEt4YGX": {}, "hYnbNcHW": {}}, "slotId": "6GVP0q6Q", "slotUsed": 81, "source": "OTHER", "sourceItemId": "8PxsTHWl", "tags": ["uXRzBuPk", "KlhKXNcV", "99m3xCtG"], "type": "6sKqF1J5"}' \
    > test.out 2>&1
eval_tap $? 31 'AdminSaveItem' test.out

#- 32 AdminBulkSaveItem
./ng net.accelbyte.sdk.cli.Main inventory adminBulkSaveItem \
    --namespace "$AB_NAMESPACE" \
    --userId '3UMs2Wv7' \
    --body '[{"customAttributes": {"xTuqinve": {}, "wzZxfPz6": {}, "3RVyuyM8": {}}, "inventoryConfigurationCode": "OrXQdOED", "qty": 53, "serverCustomAttributes": {"dHGhVvEx": {}, "rnkgQVDN": {}, "8mRG8onv": {}}, "slotId": "tRghJvjQ", "slotUsed": 6, "source": "OTHER", "sourceItemId": "LrJRadaJ", "tags": ["IwILlLh6", "oBx3Q98N", "E3EJkgtn"], "type": "y7EEtMhD"}, {"customAttributes": {"myGg30As": {}, "OMg1ZoMq": {}, "7anJUWsS": {}}, "inventoryConfigurationCode": "HzhxgsgO", "qty": 34, "serverCustomAttributes": {"XgeoObmD": {}, "XzrDKEEU": {}, "43DPT3CR": {}}, "slotId": "qXIqKXB9", "slotUsed": 97, "source": "ECOMMERCE", "sourceItemId": "uri4TN3b", "tags": ["ABO1uJEk", "B21NZqNM", "bDrYMaNy"], "type": "rfTRmY8s"}, {"customAttributes": {"2AUhVCbs": {}, "MFEuwl00": {}, "3YEVdZmj": {}}, "inventoryConfigurationCode": "fNM5rJGH", "qty": 49, "serverCustomAttributes": {"cf7dyCeO": {}, "lG5qlac9": {}, "bfDmqTxv": {}}, "slotId": "c3IH0epv", "slotUsed": 40, "source": "ECOMMERCE", "sourceItemId": "mWX6rJXW", "tags": ["6cm2At30", "1AB9eLh8", "xQ57Kq4A"], "type": "XARBitOi"}]' \
    > test.out 2>&1
eval_tap $? 32 'AdminBulkSaveItem' test.out

#- 33 AdminSyncUserEntitlements
./ng net.accelbyte.sdk.cli.Main inventory adminSyncUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'rovZkodr' \
    > test.out 2>&1
eval_tap $? 33 'AdminSyncUserEntitlements' test.out

#- 34 AdminPurchasable
./ng net.accelbyte.sdk.cli.Main inventory adminPurchasable \
    --namespace "$AB_NAMESPACE" \
    --userId 'VPSFOkfd' \
    --body '{"entitlementType": "yAx26KcV", "inventoryConfig": {"slotUsed": 25}, "itemId": "W7Zve4Jg", "itemType": "3DH4fhgr", "items": [{"bundledQty": 25, "entitlementType": "WLmP1hYX", "inventoryConfig": {"slotUsed": 13}, "itemId": "uEQjtCQK", "itemType": "RtuiKG8a", "sku": "22bQoeT0", "stackable": true, "useCount": 76}, {"bundledQty": 80, "entitlementType": "Dnh7769n", "inventoryConfig": {"slotUsed": 66}, "itemId": "P5jdt7GX", "itemType": "R8rc26HK", "sku": "1lDdciZF", "stackable": false, "useCount": 89}, {"bundledQty": 56, "entitlementType": "VZpeNQpE", "inventoryConfig": {"slotUsed": 87}, "itemId": "cmCJY2PS", "itemType": "IkAxwztZ", "sku": "zrWgEJ6C", "stackable": false, "useCount": 63}], "quantity": 96, "sku": "DrOi4Ehp", "stackable": false, "useCount": 48}' \
    > test.out 2>&1
eval_tap $? 34 'AdminPurchasable' test.out

#- 35 PublicListInventoryConfigurations
./ng net.accelbyte.sdk.cli.Main inventory publicListInventoryConfigurations \
    --namespace "$AB_NAMESPACE" \
    --code 'hisCnmfl' \
    --limit '41' \
    --offset '98' \
    --sortBy 'updatedAt:desc' \
    > test.out 2>&1
eval_tap $? 35 'PublicListInventoryConfigurations' test.out

#- 36 PublicListItemTypes
./ng net.accelbyte.sdk.cli.Main inventory publicListItemTypes \
    --namespace "$AB_NAMESPACE" \
    --limit '25' \
    --offset '54' \
    --sortBy 'name:desc' \
    > test.out 2>&1
eval_tap $? 36 'PublicListItemTypes' test.out

#- 37 PublicListTags
./ng net.accelbyte.sdk.cli.Main inventory publicListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '85' \
    --offset '12' \
    --sortBy 'name:desc' \
    > test.out 2>&1
eval_tap $? 37 'PublicListTags' test.out

#- 38 PublicListInventories
./ng net.accelbyte.sdk.cli.Main inventory publicListInventories \
    --namespace "$AB_NAMESPACE" \
    --inventoryConfigurationCode '3NdVlMbw' \
    --limit '4' \
    --offset '11' \
    --sortBy 'createdAt:desc' \
    > test.out 2>&1
eval_tap $? 38 'PublicListInventories' test.out

#- 39 PublicConsumeMyItem
./ng net.accelbyte.sdk.cli.Main inventory publicConsumeMyItem \
    --inventoryId 'LolHPbfh' \
    --namespace "$AB_NAMESPACE" \
    --body '{"options": ["6lPRFjeG", "wyRgpnLk", "2nfg5S1t"], "qty": 40, "slotId": "epE3G1Uu", "sourceItemId": "pB80FKMt"}' \
    > test.out 2>&1
eval_tap $? 39 'PublicConsumeMyItem' test.out

#- 40 PublicListItems
./ng net.accelbyte.sdk.cli.Main inventory publicListItems \
    --inventoryId 'B7g9NGtu' \
    --namespace "$AB_NAMESPACE" \
    --limit '63' \
    --offset '50' \
    --sortBy 'createdAt:desc' \
    --sourceItemId 'IZ5wCT4e' \
    --tags 'q6atY0ym' \
    > test.out 2>&1
eval_tap $? 40 'PublicListItems' test.out

#- 41 PublicBulkUpdateMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicBulkUpdateMyItems \
    --inventoryId 'avHej5wh' \
    --namespace "$AB_NAMESPACE" \
    --body '[{"customAttributes": {"i6ONfuPf": {}, "qqaRzhZb": {}, "VLDXtFz3": {}}, "slotId": "3w8enE9O", "sourceItemId": "4LmT3IIC", "tags": ["hH3SwkTQ", "XZLvfsut", "wVRpmZze"]}, {"customAttributes": {"yr6UTwpz": {}, "gnuYuq5S": {}, "9WQ6WTBZ": {}}, "slotId": "DquTIzqr", "sourceItemId": "7letX6fB", "tags": ["GCVBzGCF", "mMJ39hiS", "MHS14Y5n"]}, {"customAttributes": {"ufbjOjti": {}, "xSWQopdt": {}, "5PoM3XTB": {}}, "slotId": "Gq5zvwz3", "sourceItemId": "MgEAXCAq", "tags": ["12Otz9l4", "Mwx7i57R", "54cIlUS4"]}]' \
    > test.out 2>&1
eval_tap $? 41 'PublicBulkUpdateMyItems' test.out

#- 42 PublicBulkRemoveMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicBulkRemoveMyItems \
    --inventoryId 'WsvmGMkU' \
    --namespace "$AB_NAMESPACE" \
    --body '[{"slotId": "unlHWhdr", "sourceItemId": "5nwHNHBA"}, {"slotId": "cuUvIJ1Z", "sourceItemId": "8NhRqNBN"}, {"slotId": "kDWWF0ky", "sourceItemId": "SuIjg686"}]' \
    > test.out 2>&1
eval_tap $? 42 'PublicBulkRemoveMyItems' test.out

#- 43 PublicMoveMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicMoveMyItems \
    --inventoryId 'zgNdIHPd' \
    --namespace "$AB_NAMESPACE" \
    --body '{"items": [{"qty": 86, "slotId": "Zi4oCtj6", "sourceItemId": "2kmMYskg"}, {"qty": 80, "slotId": "jNS3AJxT", "sourceItemId": "ZZD2AIin"}, {"qty": 52, "slotId": "3R5YxK7x", "sourceItemId": "WdZlhaBE"}], "srcInventoryId": "dVxf80nz"}' \
    > test.out 2>&1
eval_tap $? 43 'PublicMoveMyItems' test.out

#- 44 PublicGetItem
./ng net.accelbyte.sdk.cli.Main inventory publicGetItem \
    --inventoryId 'b8Velsfb' \
    --namespace "$AB_NAMESPACE" \
    --slotId '21hh4onU' \
    --sourceItemId 'hiSEIdgh' \
    > test.out 2>&1
eval_tap $? 44 'PublicGetItem' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
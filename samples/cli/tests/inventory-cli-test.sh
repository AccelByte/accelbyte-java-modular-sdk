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
    --body '{"message": "8alSIP3O", "operations": [{"consumeItems": [{"dateRangeValidation": true, "inventoryId": "M24TQDqR", "options": ["Zajx7kIE", "tY7IyWf0", "gJqnVv8s"], "qty": 76, "slotId": "d9sm1GPO", "sourceItemId": "tluXfpho"}, {"dateRangeValidation": false, "inventoryId": "lRuypp46", "options": ["3ArtHkb8", "lb92Ur0t", "xUtxcL04"], "qty": 80, "slotId": "0D9Lxm7M", "sourceItemId": "VNMVpF6h"}, {"dateRangeValidation": true, "inventoryId": "rDSaJJ8P", "options": ["k6MGKi8b", "iLUvl1bB", "l1wxdrkL"], "qty": 4, "slotId": "HOxLMUJ9", "sourceItemId": "M2W6IjZx"}], "createItems": [{"customAttributes": {"ryJjW6zw": {}, "rfN4dGEn": {}, "vZFdDhNw": {}}, "inventoryConfigurationCode": "EzH1BL6A", "inventoryId": "nLsQUM0b", "qty": 47, "serverCustomAttributes": {"YkhXemwd": {}, "voSnOMnL": {}, "Rt46kZaQ": {}}, "slotId": "GDZK4Z5X", "slotUsed": 57, "source": "OTHER", "sourceItemId": "slV1l1AH", "tags": ["9Gxi8VdX", "E4YY6a35", "zV5bcjFY"], "toSpecificInventory": false, "type": "UpZAaORb"}, {"customAttributes": {"4IS4esfD": {}, "YZF1vmW7": {}, "CpJgbQp5": {}}, "inventoryConfigurationCode": "SrMBRZa9", "inventoryId": "spTijcNr", "qty": 82, "serverCustomAttributes": {"Hil2XovS": {}, "uxw63LTk": {}, "jjqI15ZJ": {}}, "slotId": "Tf8pcZuq", "slotUsed": 10, "source": "ECOMMERCE", "sourceItemId": "6jmBGZ92", "tags": ["dy418iid", "Hher6mZH", "O1aWu60q"], "toSpecificInventory": true, "type": "dqeNsyMk"}, {"customAttributes": {"PfK6sKN3": {}, "LpfDeRDS": {}, "HwcfqFxE": {}}, "inventoryConfigurationCode": "y9qkMA4J", "inventoryId": "rBJJh8vn", "qty": 75, "serverCustomAttributes": {"fy11wL4Q": {}, "Tbe5d7lg": {}, "CDHYplJl": {}}, "slotId": "1T6JT3rO", "slotUsed": 30, "source": "ECOMMERCE", "sourceItemId": "z14Bo6S9", "tags": ["kuBdcAym", "icpKU8wi", "7xb5I1Bv"], "toSpecificInventory": false, "type": "m8piv8yo"}], "removeItems": [{"inventoryId": "dkNzTbhN", "slotId": "fOO3PXQe", "sourceItemId": "oCQ1DuJT"}, {"inventoryId": "jvvGjSig", "slotId": "zNHhdFwT", "sourceItemId": "RPYJBNWh"}, {"inventoryId": "ZOW6fVwg", "slotId": "bfTRqElV", "sourceItemId": "c5sXx9TP"}], "targetUserId": "wrtCJzL8", "updateItems": [{"customAttributes": {"dgX08l3q": {}, "GZUqE4MM": {}, "v5eACtXi": {}}, "inventoryId": "yjbYC4Sg", "serverCustomAttributes": {"HTnCzdVX": {}, "XGnjfSy9": {}, "rrC7yp36": {}}, "slotId": "CQDocnJ3", "sourceItemId": "ye0OnpQj", "tags": ["9DNP8Dzg", "x0WSpnkd", "aqwHt5Oo"], "type": "otBPUj0W"}, {"customAttributes": {"0Xw0RLfn": {}, "iG161Gly": {}, "9ktl52NL": {}}, "inventoryId": "AQ9rrp85", "serverCustomAttributes": {"klgKhM8S": {}, "V8jyFwfI": {}, "sRh9rk37": {}}, "slotId": "kVZebU0A", "sourceItemId": "veRShUee", "tags": ["jf2Mi8xv", "5YHp9Dig", "byChELam"], "type": "aS6dSCqW"}, {"customAttributes": {"lMUIaTNo": {}, "oFHwVg8B": {}, "NnepxVjT": {}}, "inventoryId": "ZyWgGppf", "serverCustomAttributes": {"Iodtb8qG": {}, "OAwCx9zW": {}, "EPUnzxco": {}}, "slotId": "M4EQIUeO", "sourceItemId": "Pa8ZjeSd", "tags": ["G83BvLYa", "3f43wXvG", "M6V9K5qK"], "type": "AF4y7ba9"}]}, {"consumeItems": [{"dateRangeValidation": true, "inventoryId": "EZ3G3S5l", "options": ["xP7nVRiQ", "tusyEe0a", "auatbu0r"], "qty": 94, "slotId": "ZQCAnhqP", "sourceItemId": "9vNL0B69"}, {"dateRangeValidation": true, "inventoryId": "tCs7ZUA4", "options": ["FWKBiigU", "BDPZCeZ2", "aVUCJRxE"], "qty": 54, "slotId": "dTWVVy0u", "sourceItemId": "XBNCp5vI"}, {"dateRangeValidation": true, "inventoryId": "6UW8ZqVj", "options": ["6GSQaJFZ", "REFlgtmQ", "DESBCyK7"], "qty": 16, "slotId": "wZhWlxxR", "sourceItemId": "zLAFTbDa"}], "createItems": [{"customAttributes": {"CWXFGAaU": {}, "ImTwkD2F": {}, "X0UbxkNq": {}}, "inventoryConfigurationCode": "JhovUG4N", "inventoryId": "VXaKoxNN", "qty": 24, "serverCustomAttributes": {"QGYUVuLD": {}, "pz3hBRRu": {}, "iqITHPdE": {}}, "slotId": "rDwAYu1x", "slotUsed": 2, "source": "ECOMMERCE", "sourceItemId": "y1hhJpac", "tags": ["sAWLijLH", "MxipX4D1", "b11kTXlL"], "toSpecificInventory": true, "type": "wulBOs5J"}, {"customAttributes": {"6Yl9qX1Q": {}, "XzY4QnQB": {}, "Qrutj8Da": {}}, "inventoryConfigurationCode": "oLhaPnhc", "inventoryId": "jAl1Lot8", "qty": 88, "serverCustomAttributes": {"u4v4vO1y": {}, "fDcYd8j7": {}, "Zof7eJ3r": {}}, "slotId": "5d66ljPe", "slotUsed": 70, "source": "ECOMMERCE", "sourceItemId": "h2uDgg3M", "tags": ["GiTPAyDw", "0M4dzFiN", "Hzl6ebT8"], "toSpecificInventory": true, "type": "WbZVTHNv"}, {"customAttributes": {"jsec2qtI": {}, "SxynCnsU": {}, "fC2Ktj53": {}}, "inventoryConfigurationCode": "KHLOOD3S", "inventoryId": "9Vuhqumb", "qty": 37, "serverCustomAttributes": {"JwMB0jAH": {}, "9TDBgS6y": {}, "s8FXuil1": {}}, "slotId": "mrRJ1jSZ", "slotUsed": 3, "source": "OTHER", "sourceItemId": "wSQSYUA0", "tags": ["NioBqq18", "bV1yT41v", "QN2dfFVi"], "toSpecificInventory": true, "type": "70QmbEhI"}], "removeItems": [{"inventoryId": "HPdBKwcW", "slotId": "r2Nih3Fa", "sourceItemId": "Na8yRcTp"}, {"inventoryId": "tDftkRHs", "slotId": "7vN7uzQc", "sourceItemId": "A2Azrske"}, {"inventoryId": "1YfwJZ6z", "slotId": "AgVTltM7", "sourceItemId": "WKsb8mZS"}], "targetUserId": "u6edzofp", "updateItems": [{"customAttributes": {"kaqd1z8e": {}, "7mtR4sRO": {}, "5l2dvsYM": {}}, "inventoryId": "ITNu1NsL", "serverCustomAttributes": {"VP2wb2ng": {}, "2t4bC1nT": {}, "0FXDBDVg": {}}, "slotId": "EnIOE9Bt", "sourceItemId": "GgsuwK3Q", "tags": ["LEIsIp1e", "YLv7N3Yc", "VNDUQut7"], "type": "wfvyq1El"}, {"customAttributes": {"klc2L8gA": {}, "YVAOOMQe": {}, "HgixQAgY": {}}, "inventoryId": "pSgyOigS", "serverCustomAttributes": {"lJxr5e2j": {}, "mJpcwson": {}, "F6ar0g65": {}}, "slotId": "7n3jQ38n", "sourceItemId": "W7DkxcoA", "tags": ["CPa4BpBB", "sg7VmAnu", "jIsDKc9b"], "type": "jyWE6SwC"}, {"customAttributes": {"V8J4XLPy": {}, "Z36YhwcT": {}, "kS2HyGLS": {}}, "inventoryId": "sAPbeAOD", "serverCustomAttributes": {"5MiKto6p": {}, "fLCl0VN4": {}, "Ujze4qP0": {}}, "slotId": "1WhGAtXp", "sourceItemId": "pLYZu2pU", "tags": ["9m0ILJPB", "sZcohPfj", "7MCkyfnl"], "type": "lrWvA0os"}]}, {"consumeItems": [{"dateRangeValidation": true, "inventoryId": "4bHtXC3b", "options": ["kBYpe5uL", "vxZgfbWM", "tm9DUwU5"], "qty": 55, "slotId": "KCX4TdtH", "sourceItemId": "d6ceaUEI"}, {"dateRangeValidation": true, "inventoryId": "YqvqlXR4", "options": ["DtXJEAVp", "WXLW5bXF", "5c0vcbnb"], "qty": 34, "slotId": "Ka6aQ2FF", "sourceItemId": "HfLoSWwv"}, {"dateRangeValidation": false, "inventoryId": "XtMWLWSA", "options": ["5gZI0RiD", "VituBtNf", "RVtB6p1u"], "qty": 98, "slotId": "QEV7W68S", "sourceItemId": "r6EVx8ZJ"}], "createItems": [{"customAttributes": {"me9HxNle": {}, "dFLNucZP": {}, "hTI4kkfm": {}}, "inventoryConfigurationCode": "uHqsrD52", "inventoryId": "YIW8vrY2", "qty": 27, "serverCustomAttributes": {"kgGVwIH7": {}, "rQqSNilx": {}, "5BiOtWy4": {}}, "slotId": "GUizfCWn", "slotUsed": 8, "source": "ECOMMERCE", "sourceItemId": "s0QE5xlx", "tags": ["JIYBviFT", "jXYY5x0J", "vXXr9TKg"], "toSpecificInventory": false, "type": "B1DetGqn"}, {"customAttributes": {"ycXZYiCl": {}, "WOtYWiHi": {}, "MDr8VNu9": {}}, "inventoryConfigurationCode": "geDxKPjl", "inventoryId": "d4eOaSQx", "qty": 11, "serverCustomAttributes": {"wRzNYN1l": {}, "SqDETnLo": {}, "9xjArNlK": {}}, "slotId": "whrkAd9f", "slotUsed": 34, "source": "OTHER", "sourceItemId": "tysnm93s", "tags": ["qTF1OQd7", "5Y5cBiti", "al6iLdEu"], "toSpecificInventory": false, "type": "NIQPeZoM"}, {"customAttributes": {"UWMdL2mK": {}, "yz1t4BnM": {}, "h9i3VCeu": {}}, "inventoryConfigurationCode": "BS8cGfy5", "inventoryId": "A9kfwJqO", "qty": 0, "serverCustomAttributes": {"nfP4n4lA": {}, "exdu5VDp": {}, "R0Knh61E": {}}, "slotId": "iw0CUlBw", "slotUsed": 43, "source": "OTHER", "sourceItemId": "NGrQ7JQz", "tags": ["iKK8sVOX", "Zd7CDp1Y", "jO6g5Je4"], "toSpecificInventory": true, "type": "r17gotc1"}], "removeItems": [{"inventoryId": "10t1Ez5n", "slotId": "vXmiG6tv", "sourceItemId": "bMy02Z2u"}, {"inventoryId": "gvJb9usp", "slotId": "imXHCezU", "sourceItemId": "M076yk3F"}, {"inventoryId": "e0qPZluH", "slotId": "iGU78phF", "sourceItemId": "lR1p51LA"}], "targetUserId": "2QWv8SBJ", "updateItems": [{"customAttributes": {"A2qBx8uu": {}, "hcLDRYVU": {}, "5zwz02di": {}}, "inventoryId": "O8W0bKUe", "serverCustomAttributes": {"FchLOVP2": {}, "Yvc6xD09": {}, "Tvs3Vgg2": {}}, "slotId": "b10VrOzc", "sourceItemId": "dTVEAI5Q", "tags": ["UgvIE1fy", "omahjg09", "PgXANF5k"], "type": "pj89yqRe"}, {"customAttributes": {"nj66ZfJ2": {}, "lR4MltvP": {}, "YGlQm5FJ": {}}, "inventoryId": "NOuXP361", "serverCustomAttributes": {"R0gVwL1X": {}, "akesqnOg": {}, "4xfj63U7": {}}, "slotId": "4TfDmght", "sourceItemId": "g223FKzU", "tags": ["Tm5kvQu7", "mS8DqYjj", "BGcz8e67"], "type": "pSzt2jaM"}, {"customAttributes": {"Oi6g1IY0": {}, "NwLNk1Wp": {}, "l4uzncxi": {}}, "inventoryId": "Z64JwTl3", "serverCustomAttributes": {"4LFUCs7s": {}, "GH4mptll": {}, "k5MnrsOM": {}}, "slotId": "HUGOR0NB", "sourceItemId": "PwYZIqUp", "tags": ["xij1ZSBu", "OGJozhm5", "8gQJRr2F"], "type": "E4LW0toY"}]}], "requestId": "PN5U3aY1"}' \
    > test.out 2>&1
eval_tap $? 2 'AdminCreateChainingOperations' test.out

#- 3 AdminListIntegrationConfigurations
./ng net.accelbyte.sdk.cli.Main inventory adminListIntegrationConfigurations \
    --namespace "$AB_NAMESPACE" \
    --limit '18' \
    --offset '50' \
    --sortBy 'createdAt:asc' \
    > test.out 2>&1
eval_tap $? 3 'AdminListIntegrationConfigurations' test.out

#- 4 AdminCreateIntegrationConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminCreateIntegrationConfiguration \
    --namespace "$AB_NAMESPACE" \
    --body '{"mapItemType": ["tIoTFieE", "7cPKJNvy", "2gHDnYAG"], "serviceName": "HDjzHo1N", "targetInventoryCode": "z8TaZTKU"}' \
    > test.out 2>&1
eval_tap $? 4 'AdminCreateIntegrationConfiguration' test.out

#- 5 AdminUpdateIntegrationConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateIntegrationConfiguration \
    --integrationConfigurationId '4IZXbZZl' \
    --namespace "$AB_NAMESPACE" \
    --body '{"mapItemType": ["AsYnt1qy", "7jNMwJHb", "ICyDuT3S"], "serviceName": "lQz7r3vw", "targetInventoryCode": "UHDPdodE"}' \
    > test.out 2>&1
eval_tap $? 5 'AdminUpdateIntegrationConfiguration' test.out

#- 6 AdminUpdateStatusIntegrationConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateStatusIntegrationConfiguration \
    --integrationConfigurationId 'GpNrwBYr' \
    --namespace "$AB_NAMESPACE" \
    --body '{"status": "TIED"}' \
    > test.out 2>&1
eval_tap $? 6 'AdminUpdateStatusIntegrationConfiguration' test.out

#- 7 AdminListInventories
./ng net.accelbyte.sdk.cli.Main inventory adminListInventories \
    --namespace "$AB_NAMESPACE" \
    --inventoryConfigurationCode '3jAXbafp' \
    --limit '63' \
    --offset '89' \
    --sortBy 'createdAt' \
    --userId 'U5jCdTau' \
    > test.out 2>&1
eval_tap $? 7 'AdminListInventories' test.out

#- 8 AdminCreateInventory
./ng net.accelbyte.sdk.cli.Main inventory adminCreateInventory \
    --namespace "$AB_NAMESPACE" \
    --body '{"inventoryConfigurationCode": "Wgr6VuEc", "userId": "YGMAw65C"}' \
    > test.out 2>&1
eval_tap $? 8 'AdminCreateInventory' test.out

#- 9 AdminGetInventory
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventory \
    --inventoryId 'rvZBrn8j' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'AdminGetInventory' test.out

#- 10 AdminUpdateInventory
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateInventory \
    --inventoryId 'ainY5wk2' \
    --namespace "$AB_NAMESPACE" \
    --body '{"incMaxSlots": 44}' \
    > test.out 2>&1
eval_tap $? 10 'AdminUpdateInventory' test.out

#- 11 DeleteInventory
./ng net.accelbyte.sdk.cli.Main inventory deleteInventory \
    --inventoryId '8HDsTEyu' \
    --namespace "$AB_NAMESPACE" \
    --body '{"message": "7QlseWqd"}' \
    > test.out 2>&1
eval_tap $? 11 'DeleteInventory' test.out

#- 12 AdminListItems
./ng net.accelbyte.sdk.cli.Main inventory adminListItems \
    --inventoryId '7s7CjRac' \
    --namespace "$AB_NAMESPACE" \
    --limit '76' \
    --offset '73' \
    --sortBy 'updatedAt:desc' \
    --sourceItemId 'qfTOPSj1' \
    --tags 'EKLEAqXC' \
    > test.out 2>&1
eval_tap $? 12 'AdminListItems' test.out

#- 13 AdminGetInventoryItem
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventoryItem \
    --inventoryId 'Xrdb0UCW' \
    --namespace "$AB_NAMESPACE" \
    --slotId 'J21Ih1Do' \
    --sourceItemId 'aGabYTQ6' \
    > test.out 2>&1
eval_tap $? 13 'AdminGetInventoryItem' test.out

#- 14 AdminListInventoryConfigurations
./ng net.accelbyte.sdk.cli.Main inventory adminListInventoryConfigurations \
    --namespace "$AB_NAMESPACE" \
    --code 'dmUKCorM' \
    --limit '67' \
    --offset '63' \
    --sortBy 'updatedAt:desc' \
    > test.out 2>&1
eval_tap $? 14 'AdminListInventoryConfigurations' test.out

#- 15 AdminCreateInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminCreateInventoryConfiguration \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "RtgnlsZp", "description": "cJH0vKm1", "initialMaxSlots": 100, "maxInstancesPerUser": 48, "maxUpgradeSlots": 22, "name": "FJJG7Pj3"}' \
    > test.out 2>&1
eval_tap $? 15 'AdminCreateInventoryConfiguration' test.out

#- 16 AdminGetInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventoryConfiguration \
    --inventoryConfigurationId 'cLD0RMC6' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'AdminGetInventoryConfiguration' test.out

#- 17 AdminUpdateInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateInventoryConfiguration \
    --inventoryConfigurationId 'C0CntXAV' \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "HL0Hck1N", "description": "4y5uwh5X", "initialMaxSlots": 64, "maxInstancesPerUser": 3, "maxUpgradeSlots": 100, "name": "gbVSSoAy"}' \
    > test.out 2>&1
eval_tap $? 17 'AdminUpdateInventoryConfiguration' test.out

#- 18 AdminDeleteInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteInventoryConfiguration \
    --inventoryConfigurationId 'WdeKotvw' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminDeleteInventoryConfiguration' test.out

#- 19 AdminListItemTypes
./ng net.accelbyte.sdk.cli.Main inventory adminListItemTypes \
    --namespace "$AB_NAMESPACE" \
    --limit '25' \
    --offset '94' \
    --sortBy 'name:desc' \
    > test.out 2>&1
eval_tap $? 19 'AdminListItemTypes' test.out

#- 20 AdminCreateItemType
./ng net.accelbyte.sdk.cli.Main inventory adminCreateItemType \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "rYs8rRKn"}' \
    > test.out 2>&1
eval_tap $? 20 'AdminCreateItemType' test.out

#- 21 AdminDeleteItemType
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteItemType \
    --itemTypeName 'JcKAl7v2' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'AdminDeleteItemType' test.out

#- 22 AdminListTags
./ng net.accelbyte.sdk.cli.Main inventory adminListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '52' \
    --offset '43' \
    --owner 'mTBQDnSH' \
    --sortBy 'name' \
    > test.out 2>&1
eval_tap $? 22 'AdminListTags' test.out

#- 23 AdminCreateTag
./ng net.accelbyte.sdk.cli.Main inventory adminCreateTag \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "QTlg6Mnb", "owner": "CLIENT"}' \
    > test.out 2>&1
eval_tap $? 23 'AdminCreateTag' test.out

#- 24 AdminDeleteTag
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteTag \
    --namespace "$AB_NAMESPACE" \
    --tagName '93wd1yAt' \
    > test.out 2>&1
eval_tap $? 24 'AdminDeleteTag' test.out

#- 25 AdminConsumeUserItem
./ng net.accelbyte.sdk.cli.Main inventory adminConsumeUserItem \
    --inventoryId 'vt5HDuuF' \
    --namespace "$AB_NAMESPACE" \
    --userId 'OnOW68Pf' \
    --dateRangeValidation 'p00GiNCd' \
    --body '{"options": ["lQkLrrWw", "c0StuhzS", "t3GF7Bmi"], "qty": 73, "slotId": "kHlT37x4", "sourceItemId": "cecdPeaN"}' \
    > test.out 2>&1
eval_tap $? 25 'AdminConsumeUserItem' test.out

#- 26 AdminBulkUpdateMyItems
./ng net.accelbyte.sdk.cli.Main inventory adminBulkUpdateMyItems \
    --inventoryId 'NvYgRuIF' \
    --namespace "$AB_NAMESPACE" \
    --userId 'NzVNey6j' \
    --body '[{"customAttributes": {"HeqxFisD": {}, "kOVLq27p": {}, "bKGqhMn4": {}}, "serverCustomAttributes": {"3OIgvrCx": {}, "80x9hzI0": {}, "HBw1EHIN": {}}, "slotId": "Kh8lMNtf", "sourceItemId": "cqUrq0cg", "tags": ["s1z2L98o", "wmXZx8Oz", "GiphiFah"], "type": "ALORdfsH"}, {"customAttributes": {"0DnyMb7U": {}, "po6oz22L": {}, "ztklzQj2": {}}, "serverCustomAttributes": {"HwadcWz6": {}, "wvuG9wIG": {}, "PjbcuqSJ": {}}, "slotId": "9pcXSpjF", "sourceItemId": "sowEt0pI", "tags": ["Yj1fdGHd", "Jjt3iiut", "F2N5ywgt"], "type": "hbw0KQiv"}, {"customAttributes": {"9GtwaUbf": {}, "aL40VDkR": {}, "UHIMCbhw": {}}, "serverCustomAttributes": {"DDDhyVxv": {}, "oQjSoOMn": {}, "A12DSXsR": {}}, "slotId": "4xYaEbIL", "sourceItemId": "0yzOeCqk", "tags": ["j0TtBL0t", "k12iu1yY", "Yksa3zyj"], "type": "Iwyq0BfT"}]' \
    > test.out 2>&1
eval_tap $? 26 'AdminBulkUpdateMyItems' test.out

#- 27 AdminSaveItemToInventory
./ng net.accelbyte.sdk.cli.Main inventory adminSaveItemToInventory \
    --inventoryId 'QBQ33IM5' \
    --namespace "$AB_NAMESPACE" \
    --userId 'YWL4D8e1' \
    --body '{"customAttributes": {"tnjwzVrT": {}, "oteABDWu": {}, "THBsPRQ6": {}}, "qty": 21, "serverCustomAttributes": {"UaxcqLoi": {}, "Nb93gOVK": {}, "MAIJMpUN": {}}, "slotId": "zTSRX6PL", "slotUsed": 89, "source": "OTHER", "sourceItemId": "CMyBxCjT", "tags": ["zLoYmjRw", "HuIr5Ehe", "k93JlHIv"], "type": "88tYhcty"}' \
    > test.out 2>&1
eval_tap $? 27 'AdminSaveItemToInventory' test.out

#- 28 AdminBulkRemoveItems
./ng net.accelbyte.sdk.cli.Main inventory adminBulkRemoveItems \
    --inventoryId 'xbGtvzZF' \
    --namespace "$AB_NAMESPACE" \
    --userId 'PXknGI1n' \
    --body '[{"slotId": "durRoGoO", "sourceItemId": "1KaqxDBV"}, {"slotId": "oNUVWdQ0", "sourceItemId": "pqsVHaJs"}, {"slotId": "Ia5njGBa", "sourceItemId": "TrvobGYJ"}]' \
    > test.out 2>&1
eval_tap $? 28 'AdminBulkRemoveItems' test.out

#- 29 AdminBulkSaveItemToInventory
./ng net.accelbyte.sdk.cli.Main inventory adminBulkSaveItemToInventory \
    --inventoryId 'afCvG49h' \
    --namespace "$AB_NAMESPACE" \
    --userId 'LduNxJd5' \
    --body '[{"customAttributes": {"L53PGqDO": {}, "2VKIegyE": {}, "eq4vSH1H": {}}, "qty": 56, "serverCustomAttributes": {"5n6CJKt8": {}, "CQC61z5R": {}, "u1IXvyJ4": {}}, "slotId": "p6q1y0vI", "slotUsed": 22, "source": "OTHER", "sourceItemId": "3029y6B1", "tags": ["ri3PslRj", "P6BBG2LD", "lVGvfqjf"], "type": "NXXs1evK"}, {"customAttributes": {"Ai2liN8k": {}, "iL56mTju": {}, "VE1qX8ij": {}}, "qty": 2, "serverCustomAttributes": {"ZJIc5prZ": {}, "nVdmdUOB": {}, "RofVp8HO": {}}, "slotId": "ycVYK6fB", "slotUsed": 93, "source": "ECOMMERCE", "sourceItemId": "Bj3sqS1b", "tags": ["pETMq9Oq", "55qqzzP4", "bzNx47Ey"], "type": "oHNZayCT"}, {"customAttributes": {"NJaPFc9h": {}, "ZxXuzZiV": {}, "hbse9MsM": {}}, "qty": 3, "serverCustomAttributes": {"ucxIxmeL": {}, "mtD4yfUI": {}, "CrfV3kXI": {}}, "slotId": "O9GjVu8X", "slotUsed": 35, "source": "ECOMMERCE", "sourceItemId": "eY9R5aE4", "tags": ["4JLTeFyz", "NrMhNjnW", "lzauvQdG"], "type": "tLp1UAr2"}]' \
    > test.out 2>&1
eval_tap $? 29 'AdminBulkSaveItemToInventory' test.out

#- 30 AdminUpdateUserInventoriesByInventoryCode
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateUserInventoriesByInventoryCode \
    --inventoryConfigurationCode 'mj38m3l1' \
    --namespace "$AB_NAMESPACE" \
    --userId 'YiCXIzIU' \
    --body '{"incMaxSlots": 64}' \
    > test.out 2>&1
eval_tap $? 30 'AdminUpdateUserInventoriesByInventoryCode' test.out

#- 31 AdminSaveItem
./ng net.accelbyte.sdk.cli.Main inventory adminSaveItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'fMhe64GG' \
    --body '{"customAttributes": {"ZqCXCBMU": {}, "waY0XhI5": {}, "Cs9inRjx": {}}, "inventoryConfigurationCode": "olhcevRM", "qty": 20, "serverCustomAttributes": {"U1bmzSkk": {}, "MEWc3DFQ": {}, "nVvn0lRA": {}}, "slotId": "oX3jlwav", "slotUsed": 68, "source": "ECOMMERCE", "sourceItemId": "pG3qyJjm", "tags": ["qqJS4eXm", "iL4C3Qtv", "IiO5UICR"], "type": "FqoyrDMB"}' \
    > test.out 2>&1
eval_tap $? 31 'AdminSaveItem' test.out

#- 32 AdminBulkSaveItem
./ng net.accelbyte.sdk.cli.Main inventory adminBulkSaveItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'yhWTNS9S' \
    --body '[{"customAttributes": {"6pX3rox2": {}, "nYxUhwVR": {}, "6J9GFhA7": {}}, "inventoryConfigurationCode": "4Pa1rEf1", "qty": 20, "serverCustomAttributes": {"PQ9nxL8X": {}, "Lz2QB6j2": {}, "E4s5gijx": {}}, "slotId": "e2zVGkbA", "slotUsed": 15, "source": "OTHER", "sourceItemId": "ArMsZV79", "tags": ["KkbVSzN4", "jIHJTaQ1", "DBWIGVNN"], "type": "807OLNnM"}, {"customAttributes": {"IslVcxFY": {}, "zqe48byD": {}, "X206uLlO": {}}, "inventoryConfigurationCode": "Vt2ud5DS", "qty": 64, "serverCustomAttributes": {"CLVAGiLb": {}, "16Tsgz3b": {}, "pRcL1wcY": {}}, "slotId": "cHUxtesZ", "slotUsed": 31, "source": "ECOMMERCE", "sourceItemId": "c7yy5S8s", "tags": ["fsgYUbrG", "t3PxZhoY", "ysNNz9gf"], "type": "IGmVyO4G"}, {"customAttributes": {"DWq0cvwa": {}, "T8mzOhBi": {}, "uzVb4XoI": {}}, "inventoryConfigurationCode": "PdiN2V3V", "qty": 27, "serverCustomAttributes": {"hU77hRam": {}, "SytutYGn": {}, "lgJdSXiQ": {}}, "slotId": "LGH0dzNA", "slotUsed": 92, "source": "ECOMMERCE", "sourceItemId": "eWaDU1oY", "tags": ["knnzw10y", "6Psst2TX", "Iq0ujn7x"], "type": "aPlDYzsK"}]' \
    > test.out 2>&1
eval_tap $? 32 'AdminBulkSaveItem' test.out

#- 33 AdminSyncUserEntitlements
./ng net.accelbyte.sdk.cli.Main inventory adminSyncUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId '2itUKHkB' \
    > test.out 2>&1
eval_tap $? 33 'AdminSyncUserEntitlements' test.out

#- 34 AdminPurchasable
./ng net.accelbyte.sdk.cli.Main inventory adminPurchasable \
    --namespace "$AB_NAMESPACE" \
    --userId 'xpmGzzdC' \
    --body '{"entitlementType": "vSdj4wjA", "inventoryConfig": {"slotUsed": 65}, "itemId": "dCcuQzXH", "itemType": "xNOsgZPr", "items": [{"bundledQty": 75, "entitlementType": "lFCMouBM", "inventoryConfig": {"slotUsed": 76}, "itemId": "Ehj7kJzY", "itemType": "VP1yUhEg", "sku": "6WT3Bhi4", "stackable": true, "useCount": 59}, {"bundledQty": 13, "entitlementType": "Xegc15Aq", "inventoryConfig": {"slotUsed": 44}, "itemId": "IJRQ9sqR", "itemType": "ZBiYdbaN", "sku": "tG27yqbh", "stackable": false, "useCount": 96}, {"bundledQty": 46, "entitlementType": "jhKDeYnG", "inventoryConfig": {"slotUsed": 90}, "itemId": "fjIAiGuK", "itemType": "YNILlvsE", "sku": "ZBuqWlLd", "stackable": false, "useCount": 79}], "quantity": 83, "sku": "QEJwbIih", "stackable": true, "useCount": 82}' \
    > test.out 2>&1
eval_tap $? 34 'AdminPurchasable' test.out

#- 35 PublicListInventoryConfigurations
./ng net.accelbyte.sdk.cli.Main inventory publicListInventoryConfigurations \
    --namespace "$AB_NAMESPACE" \
    --code 'TDJKBoCy' \
    --limit '81' \
    --offset '55' \
    --sortBy 'code' \
    > test.out 2>&1
eval_tap $? 35 'PublicListInventoryConfigurations' test.out

#- 36 PublicListItemTypes
./ng net.accelbyte.sdk.cli.Main inventory publicListItemTypes \
    --namespace "$AB_NAMESPACE" \
    --limit '13' \
    --offset '17' \
    --sortBy 'createdAt:desc' \
    > test.out 2>&1
eval_tap $? 36 'PublicListItemTypes' test.out

#- 37 PublicListTags
./ng net.accelbyte.sdk.cli.Main inventory publicListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '63' \
    --offset '34' \
    --sortBy 'createdAt:asc' \
    > test.out 2>&1
eval_tap $? 37 'PublicListTags' test.out

#- 38 PublicListInventories
./ng net.accelbyte.sdk.cli.Main inventory publicListInventories \
    --namespace "$AB_NAMESPACE" \
    --inventoryConfigurationCode 'WKkrBShV' \
    --limit '27' \
    --offset '38' \
    --sortBy 'createdAt' \
    > test.out 2>&1
eval_tap $? 38 'PublicListInventories' test.out

#- 39 PublicConsumeMyItem
./ng net.accelbyte.sdk.cli.Main inventory publicConsumeMyItem \
    --inventoryId 'A7uwdAG2' \
    --namespace "$AB_NAMESPACE" \
    --body '{"options": ["Vj5pESup", "yuB41gHe", "D5KZhow8"], "qty": 39, "slotId": "1yGcbNcw", "sourceItemId": "bvHwFhM0"}' \
    > test.out 2>&1
eval_tap $? 39 'PublicConsumeMyItem' test.out

#- 40 PublicListItems
./ng net.accelbyte.sdk.cli.Main inventory publicListItems \
    --inventoryId 'OIqXIUEc' \
    --namespace "$AB_NAMESPACE" \
    --limit '2' \
    --offset '24' \
    --sortBy 'createdAt:desc' \
    --sourceItemId 'C4GTkl4g' \
    --tags '7RTXwgZV' \
    > test.out 2>&1
eval_tap $? 40 'PublicListItems' test.out

#- 41 PublicBulkUpdateMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicBulkUpdateMyItems \
    --inventoryId 'xPwb72h6' \
    --namespace "$AB_NAMESPACE" \
    --body '[{"customAttributes": {"hDKQbExS": {}, "UNZ8TXTc": {}, "9z825vc8": {}}, "slotId": "2bspeoMs", "sourceItemId": "EjsNntGX", "tags": ["i5SOhstF", "ApiGD34y", "F5DjDwB5"]}, {"customAttributes": {"69DIl9Vg": {}, "r22gMIK0": {}, "0Cn7hv5b": {}}, "slotId": "6Kmos1zS", "sourceItemId": "81Fwd4IF", "tags": ["JP54qp5a", "yI3CzJNw", "l76PiS5a"]}, {"customAttributes": {"u2djr5eD": {}, "Lmy32uYa": {}, "yMB5Zcfo": {}}, "slotId": "zPovlkkx", "sourceItemId": "ZiEPlFyE", "tags": ["I9uWpfnT", "EbjUFby0", "BcQPVq59"]}]' \
    > test.out 2>&1
eval_tap $? 41 'PublicBulkUpdateMyItems' test.out

#- 42 PublicBulkRemoveMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicBulkRemoveMyItems \
    --inventoryId 'QVszQ18f' \
    --namespace "$AB_NAMESPACE" \
    --body '[{"slotId": "bOtU8X7T", "sourceItemId": "YHKeo6cq"}, {"slotId": "fsMqyBkc", "sourceItemId": "lZ6eZT7y"}, {"slotId": "SitejqPl", "sourceItemId": "a7lsjm5J"}]' \
    > test.out 2>&1
eval_tap $? 42 'PublicBulkRemoveMyItems' test.out

#- 43 PublicMoveMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicMoveMyItems \
    --inventoryId 'WmHqKzT5' \
    --namespace "$AB_NAMESPACE" \
    --body '{"items": [{"qty": 65, "slotId": "LdQjjPkB", "sourceItemId": "sb2qJcAd"}, {"qty": 81, "slotId": "vmWansoP", "sourceItemId": "6wwXj5Nx"}, {"qty": 52, "slotId": "YIWI9dx4", "sourceItemId": "UhJnxqUS"}], "srcInventoryId": "fw73z0SY"}' \
    > test.out 2>&1
eval_tap $? 43 'PublicMoveMyItems' test.out

#- 44 PublicGetItem
./ng net.accelbyte.sdk.cli.Main inventory publicGetItem \
    --inventoryId '8A3drK6G' \
    --namespace "$AB_NAMESPACE" \
    --slotId 'oCbnYT5L' \
    --sourceItemId 'P66TKQD8' \
    > test.out 2>&1
eval_tap $? 44 'PublicGetItem' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
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
echo "1..41"

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
    --body '{"message": "YqImsVSL", "operations": [{"consumeItems": [{"inventoryId": "hOo6fo4a", "qty": 68, "slotId": "BC3g50O3", "sourceItemId": "aQJkNMyI"}, {"inventoryId": "d98tB4N9", "qty": 56, "slotId": "g4Bczjjq", "sourceItemId": "d6UO9bNf"}, {"inventoryId": "538Yvlcn", "qty": 31, "slotId": "DxzlPU0p", "sourceItemId": "EseLYur3"}], "createItems": [{"customAttributes": {"O07nPvPf": {}, "VJYZsq2H": {}, "1V4atmWz": {}}, "inventoryConfigurationCode": "YW2EAHV9", "inventoryId": "qseKqhDl", "qty": 95, "serverCustomAttributes": {"uQAbD17p": {}, "mAuqOCzt": {}, "epsXrwq8": {}}, "slotId": "XtiM9UeK", "slotUsed": 96, "sourceItemId": "MoI4dMuW", "tags": ["YRbIRJFb", "3HOl3NuG", "MC28HfG5"], "toSpecificInventory": true, "type": "bmGdVVPF"}, {"customAttributes": {"xnhrL7Mw": {}, "G6dtPzEx": {}, "767mdnE9": {}}, "inventoryConfigurationCode": "v87ZnsvI", "inventoryId": "0LPD19QM", "qty": 83, "serverCustomAttributes": {"O2jQfM6s": {}, "mTrsfy0w": {}, "qFnpQrrw": {}}, "slotId": "5I8CbtEg", "slotUsed": 50, "sourceItemId": "qXgMr4B3", "tags": ["ZyMDf9Wc", "OMu82MF2", "NLWJ4evV"], "toSpecificInventory": true, "type": "ptjV4IDK"}, {"customAttributes": {"lvGdv9ax": {}, "GDrifH0x": {}, "w8SKDB6s": {}}, "inventoryConfigurationCode": "hKt8G218", "inventoryId": "FOTxjCXI", "qty": 21, "serverCustomAttributes": {"0bjhtPJc": {}, "taJzk5dm": {}, "V8rJnVja": {}}, "slotId": "2kZbFRjY", "slotUsed": 95, "sourceItemId": "S9FlHlKU", "tags": ["8wD5UWhI", "dHUu9XwU", "aJrylAow"], "toSpecificInventory": true, "type": "IOIuW39H"}], "removeItems": [{"inventoryId": "WOhPcgwa", "slotId": "rKwp9cLZ", "sourceItemId": "LZkefOo4"}, {"inventoryId": "0qtXtIau", "slotId": "d4ZcMBn2", "sourceItemId": "aRe31XeH"}, {"inventoryId": "ZWd1RA0p", "slotId": "jTECVmQv", "sourceItemId": "T8SQjSDr"}], "targetUserId": "jX4l9sir", "updateItems": [{"customAttributes": {"IsHl7RTd": {}, "BdDaGWE9": {}, "xEHB5gE8": {}}, "inventoryId": "dL5NMun8", "serverCustomAttributes": {"4aSXtRVT": {}, "gkPtscK8": {}, "JrkTFlaD": {}}, "slotId": "dWHp9i8E", "sourceItemId": "wJXQZTj3", "tags": ["K6MlmM6Q", "N3jSOyjn", "aasYriIA"], "type": "ZqiMB9Kq"}, {"customAttributes": {"8QDOQ58N": {}, "O64XcVqZ": {}, "ptrFHlHg": {}}, "inventoryId": "Ba5jiQ6m", "serverCustomAttributes": {"UZnp3Yhi": {}, "o8HHXjFL": {}, "VVWXoJts": {}}, "slotId": "I9nX5rcH", "sourceItemId": "JzYE3ZH1", "tags": ["6iNkjYAB", "sMPf0Ex7", "d0ojWJmp"], "type": "s9Alvqrh"}, {"customAttributes": {"pbGoqbyc": {}, "gZA3uZLp": {}, "N5Lyssh7": {}}, "inventoryId": "uhFcNAsV", "serverCustomAttributes": {"1ynwHxm3": {}, "UPiPLoVu": {}, "EB3TIdfj": {}}, "slotId": "YgZG5L7y", "sourceItemId": "DGsCoe1r", "tags": ["OUKBkrMX", "EMn8rp2l", "b1E4slgX"], "type": "xblN2QIu"}]}, {"consumeItems": [{"inventoryId": "PIZLeaH3", "qty": 8, "slotId": "Gp5MZrtL", "sourceItemId": "OD9oQK4y"}, {"inventoryId": "qlHaIAip", "qty": 76, "slotId": "fUEdx3y0", "sourceItemId": "cesGoUse"}, {"inventoryId": "0r0qUIhh", "qty": 12, "slotId": "GoAolZTo", "sourceItemId": "91Df5Ydh"}], "createItems": [{"customAttributes": {"J5gGOEsf": {}, "ShaK8HQ9": {}, "kHGy4wND": {}}, "inventoryConfigurationCode": "TGGoTkNK", "inventoryId": "qucqr0RC", "qty": 55, "serverCustomAttributes": {"VYmcn5Vp": {}, "tDm2pVWk": {}, "8w0hrU9j": {}}, "slotId": "obxd4sfI", "slotUsed": 58, "sourceItemId": "kpAKRzBe", "tags": ["ACABUsIz", "1dbSn0RL", "qLtYxbHz"], "toSpecificInventory": false, "type": "AG0Mv6I2"}, {"customAttributes": {"fyEqNUgk": {}, "Y3Q3E1s3": {}, "TWqIU6tU": {}}, "inventoryConfigurationCode": "0bKklKyf", "inventoryId": "eFGOgCBq", "qty": 0, "serverCustomAttributes": {"bSY2GQ82": {}, "5Uhmt0M4": {}, "wxFYRh8i": {}}, "slotId": "o4z2o8gO", "slotUsed": 46, "sourceItemId": "3nbElrrz", "tags": ["W8kBYKGG", "Eo5PDhNs", "b2OtxWC4"], "toSpecificInventory": false, "type": "ygT7vuTL"}, {"customAttributes": {"ib2E6cbf": {}, "SiCLhjjf": {}, "UYhFqEkI": {}}, "inventoryConfigurationCode": "fhr9VRsG", "inventoryId": "yG8zJN8y", "qty": 40, "serverCustomAttributes": {"0mtWvzJQ": {}, "r35QdZh0": {}, "05IciEmJ": {}}, "slotId": "aAvpeltP", "slotUsed": 39, "sourceItemId": "WGensXpP", "tags": ["zsu30psu", "4x2fhhGU", "z5oWI1sc"], "toSpecificInventory": false, "type": "GBoW1XK1"}], "removeItems": [{"inventoryId": "zjtOPF3W", "slotId": "pRXCyTHB", "sourceItemId": "BZws2LzD"}, {"inventoryId": "bGHC0x8r", "slotId": "hE0nZbZP", "sourceItemId": "8VSXobh3"}, {"inventoryId": "feZSao3m", "slotId": "e4elcVJj", "sourceItemId": "SNfTVZuQ"}], "targetUserId": "KmWRjkNN", "updateItems": [{"customAttributes": {"JZscXCx9": {}, "56VSTlbp": {}, "iTNNNuIo": {}}, "inventoryId": "yPvil7cO", "serverCustomAttributes": {"79ckZeXv": {}, "YoqNJgGw": {}, "jATTJtyg": {}}, "slotId": "OUwh2je1", "sourceItemId": "pOzzja3k", "tags": ["DJgwaIs6", "xX7XOVJQ", "9XvdSNGC"], "type": "CsMDhoKt"}, {"customAttributes": {"NTo5nY0k": {}, "hlxYbfmx": {}, "R079jbE1": {}}, "inventoryId": "NoBK3S0y", "serverCustomAttributes": {"RlWNyUbO": {}, "QmDc3tjM": {}, "vXQUxZ8Y": {}}, "slotId": "MLeLkMB6", "sourceItemId": "6LxKzgJB", "tags": ["lKm9E0ko", "8qrGPnpx", "QoYkr7BH"], "type": "81toeGtS"}, {"customAttributes": {"O82AnJ1s": {}, "NsM2G4T1": {}, "b4lUY64Y": {}}, "inventoryId": "Mo5zP8SA", "serverCustomAttributes": {"zK69n1ed": {}, "HcPXCELd": {}, "abTVIjhy": {}}, "slotId": "1J9GbuZX", "sourceItemId": "C0cQwDcE", "tags": ["cmvXLLB1", "6AgBsQvM", "gCgWgntq"], "type": "lbSiVPZq"}]}, {"consumeItems": [{"inventoryId": "A9645idW", "qty": 57, "slotId": "YirtAWf7", "sourceItemId": "usIxJ9JG"}, {"inventoryId": "mo9sB2nB", "qty": 87, "slotId": "MGY9thv9", "sourceItemId": "oak8VS6K"}, {"inventoryId": "xol3687f", "qty": 71, "slotId": "Oa8UqtXU", "sourceItemId": "ayMzKwgO"}], "createItems": [{"customAttributes": {"N7xpQQrB": {}, "sFxEEON9": {}, "pdHSPyn1": {}}, "inventoryConfigurationCode": "wweSuPAf", "inventoryId": "rxAJmNIg", "qty": 78, "serverCustomAttributes": {"efGOVM66": {}, "ir22aSUN": {}, "xSUOTEtA": {}}, "slotId": "Zb9cfNRn", "slotUsed": 38, "sourceItemId": "B44pexpt", "tags": ["CrJcfpF5", "r8XQcq9h", "VgoTRorU"], "toSpecificInventory": true, "type": "n7kSbjNF"}, {"customAttributes": {"EwhOrBUS": {}, "Eq6fC2er": {}, "WF3MwT3J": {}}, "inventoryConfigurationCode": "ivKyiknt", "inventoryId": "paU5RdFG", "qty": 93, "serverCustomAttributes": {"RcJhuscd": {}, "QVJzJ4EU": {}, "il21xJa4": {}}, "slotId": "W2ps68kV", "slotUsed": 34, "sourceItemId": "55sLUugz", "tags": ["AeHl0gvF", "wNfCMLEQ", "8unpaUZe"], "toSpecificInventory": false, "type": "3XuGapcp"}, {"customAttributes": {"XupXOTOX": {}, "kvolEdZD": {}, "lQf3aidx": {}}, "inventoryConfigurationCode": "3zqZhLC5", "inventoryId": "6Y9OXw5m", "qty": 87, "serverCustomAttributes": {"AeiVJRbO": {}, "BazqEk3O": {}, "opEMlWmC": {}}, "slotId": "7rhIEfpS", "slotUsed": 19, "sourceItemId": "PVGllU4Y", "tags": ["nsfVb8VV", "QKnd1hxU", "zGHgAGua"], "toSpecificInventory": true, "type": "TYsfW5Oa"}], "removeItems": [{"inventoryId": "T6RWiXRy", "slotId": "GCut4waX", "sourceItemId": "nXYZjuXb"}, {"inventoryId": "MPTqdXzX", "slotId": "7RuxuLfj", "sourceItemId": "iXCFKJMz"}, {"inventoryId": "Ma1N2chO", "slotId": "2u07BN0G", "sourceItemId": "69rl88iv"}], "targetUserId": "J2x6fXWI", "updateItems": [{"customAttributes": {"3rYDhWdd": {}, "PiMVCGZl": {}, "haUKMtrs": {}}, "inventoryId": "ijf21zcT", "serverCustomAttributes": {"2aMfBHvp": {}, "Uv6b21gw": {}, "klNpvUsK": {}}, "slotId": "HQuACMvq", "sourceItemId": "PX08w2Nx", "tags": ["dEzFtJ3D", "g4NnjOkj", "LqGr1kF0"], "type": "rwQU6bv1"}, {"customAttributes": {"brbTYJ07": {}, "7Sqldm4Z": {}, "4flj3Rgd": {}}, "inventoryId": "8a5V5qO4", "serverCustomAttributes": {"SVggBrIT": {}, "nU9FM8cT": {}, "47BoQ2QZ": {}}, "slotId": "g2OahPdD", "sourceItemId": "yef6HQbY", "tags": ["j5b9Mogy", "ZHU3ErrQ", "bnOZfZCT"], "type": "gmmfZwf9"}, {"customAttributes": {"emRuCSnW": {}, "U4pMHpeP": {}, "DnM6GUyp": {}}, "inventoryId": "PRQfdzMk", "serverCustomAttributes": {"aOeANqNi": {}, "fZemxbtF": {}, "WVCyLqnj": {}}, "slotId": "Dsou2Ruv", "sourceItemId": "VIx2qAzx", "tags": ["6Z2i4FGm", "VmGhbgVZ", "njGrcnS1"], "type": "B14VzFKY"}]}], "requestId": "Qn85pQB3"}' \
    > test.out 2>&1
eval_tap $? 2 'AdminCreateChainingOperations' test.out

#- 3 AdminListIntegrationConfigurations
./ng net.accelbyte.sdk.cli.Main inventory adminListIntegrationConfigurations \
    --namespace "$AB_NAMESPACE" \
    --limit '1' \
    --offset '87' \
    --sortBy 'createdAt:desc' \
    > test.out 2>&1
eval_tap $? 3 'AdminListIntegrationConfigurations' test.out

#- 4 AdminCreateIntegrationConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminCreateIntegrationConfiguration \
    --namespace "$AB_NAMESPACE" \
    --body '{"mapItemType": ["K0HgzzTf", "f1T22kTN", "cuJYBxh4"], "serviceName": "EDioxxY0", "targetInventoryCode": "nvllJeQb"}' \
    > test.out 2>&1
eval_tap $? 4 'AdminCreateIntegrationConfiguration' test.out

#- 5 AdminUpdateIntegrationConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateIntegrationConfiguration \
    --integrationConfigurationId 'hKQMNfv1' \
    --namespace "$AB_NAMESPACE" \
    --body '{"mapItemType": ["kssUnTPq", "iv3O950H", "cxQEJjqT"], "serviceName": "KokAesmV", "targetInventoryCode": "9lMqlk0l"}' \
    > test.out 2>&1
eval_tap $? 5 'AdminUpdateIntegrationConfiguration' test.out

#- 6 AdminUpdateStatusIntegrationConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateStatusIntegrationConfiguration \
    --integrationConfigurationId 'cQ434Qim' \
    --namespace "$AB_NAMESPACE" \
    --body '{"status": "INIT"}' \
    > test.out 2>&1
eval_tap $? 6 'AdminUpdateStatusIntegrationConfiguration' test.out

#- 7 AdminListInventories
./ng net.accelbyte.sdk.cli.Main inventory adminListInventories \
    --namespace "$AB_NAMESPACE" \
    --inventoryConfigurationCode 'XUQ5Bony' \
    --limit '28' \
    --offset '21' \
    --sortBy 'createdAt' \
    --userId 'jBhI7kJZ' \
    > test.out 2>&1
eval_tap $? 7 'AdminListInventories' test.out

#- 8 AdminCreateInventory
./ng net.accelbyte.sdk.cli.Main inventory adminCreateInventory \
    --namespace "$AB_NAMESPACE" \
    --body '{"inventoryConfigurationCode": "Bkth2mYW", "userId": "UTuBnJ7E"}' \
    > test.out 2>&1
eval_tap $? 8 'AdminCreateInventory' test.out

#- 9 AdminGetInventory
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventory \
    --inventoryId 'DwDrkLxq' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'AdminGetInventory' test.out

#- 10 AdminUpdateInventory
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateInventory \
    --inventoryId 'zmuyCfog' \
    --namespace "$AB_NAMESPACE" \
    --body '{"incMaxSlots": 14}' \
    > test.out 2>&1
eval_tap $? 10 'AdminUpdateInventory' test.out

#- 11 DeleteInventory
./ng net.accelbyte.sdk.cli.Main inventory deleteInventory \
    --inventoryId 'PAyGARn2' \
    --namespace "$AB_NAMESPACE" \
    --body '{"message": "8bxqpWZv"}' \
    > test.out 2>&1
eval_tap $? 11 'DeleteInventory' test.out

#- 12 AdminListItems
./ng net.accelbyte.sdk.cli.Main inventory adminListItems \
    --inventoryId 'mj9JBNiv' \
    --namespace "$AB_NAMESPACE" \
    --limit '24' \
    --offset '57' \
    --qtyGte '3' \
    --sortBy 'qty:desc' \
    --sourceItemId 'OwQaqVf2' \
    --tags 'BvKRbXwk' \
    > test.out 2>&1
eval_tap $? 12 'AdminListItems' test.out

#- 13 AdminGetInventoryItem
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventoryItem \
    --inventoryId 'A1IGUxBu' \
    --namespace "$AB_NAMESPACE" \
    --slotId 'c3I2qFIR' \
    --sourceItemId 'aNwqg7tg' \
    > test.out 2>&1
eval_tap $? 13 'AdminGetInventoryItem' test.out

#- 14 AdminListInventoryConfigurations
./ng net.accelbyte.sdk.cli.Main inventory adminListInventoryConfigurations \
    --namespace "$AB_NAMESPACE" \
    --code 'qz2JxpaW' \
    --limit '62' \
    --offset '83' \
    --sortBy 'createdAt:asc' \
    > test.out 2>&1
eval_tap $? 14 'AdminListInventoryConfigurations' test.out

#- 15 AdminCreateInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminCreateInventoryConfiguration \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "yuZuULWa", "description": "JXaHRRAU", "initialMaxSlots": 77, "maxInstancesPerUser": 78, "maxUpgradeSlots": 36, "name": "F5IFhmXV"}' \
    > test.out 2>&1
eval_tap $? 15 'AdminCreateInventoryConfiguration' test.out

#- 16 AdminGetInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventoryConfiguration \
    --inventoryConfigurationId 'eAfBoCtu' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'AdminGetInventoryConfiguration' test.out

#- 17 AdminUpdateInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateInventoryConfiguration \
    --inventoryConfigurationId 'wMTCxzVD' \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "tKsYyU8K", "description": "MCYNYVrS", "initialMaxSlots": 97, "maxInstancesPerUser": 54, "maxUpgradeSlots": 83, "name": "MdsqEpdm"}' \
    > test.out 2>&1
eval_tap $? 17 'AdminUpdateInventoryConfiguration' test.out

#- 18 AdminDeleteInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteInventoryConfiguration \
    --inventoryConfigurationId '08EqSaGI' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminDeleteInventoryConfiguration' test.out

#- 19 AdminListItemTypes
./ng net.accelbyte.sdk.cli.Main inventory adminListItemTypes \
    --namespace "$AB_NAMESPACE" \
    --limit '97' \
    --offset '2' \
    --sortBy 'name:desc' \
    > test.out 2>&1
eval_tap $? 19 'AdminListItemTypes' test.out

#- 20 AdminCreateItemType
./ng net.accelbyte.sdk.cli.Main inventory adminCreateItemType \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "0vxaJfQm"}' \
    > test.out 2>&1
eval_tap $? 20 'AdminCreateItemType' test.out

#- 21 AdminDeleteItemType
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteItemType \
    --itemTypeName 'YRlPLqqV' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'AdminDeleteItemType' test.out

#- 22 AdminListTags
./ng net.accelbyte.sdk.cli.Main inventory adminListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '96' \
    --offset '88' \
    --owner 'u49r6HZq' \
    --sortBy 'createdAt:desc' \
    > test.out 2>&1
eval_tap $? 22 'AdminListTags' test.out

#- 23 AdminCreateTag
./ng net.accelbyte.sdk.cli.Main inventory adminCreateTag \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "VqazUrwA", "owner": "SERVER"}' \
    > test.out 2>&1
eval_tap $? 23 'AdminCreateTag' test.out

#- 24 AdminDeleteTag
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteTag \
    --namespace "$AB_NAMESPACE" \
    --tagName 'OueSjKvh' \
    > test.out 2>&1
eval_tap $? 24 'AdminDeleteTag' test.out

#- 25 AdminConsumeUserItem
./ng net.accelbyte.sdk.cli.Main inventory adminConsumeUserItem \
    --inventoryId 'HLB70ZNg' \
    --namespace "$AB_NAMESPACE" \
    --userId 'GiICW9Aq' \
    --body '{"qty": 30, "slotId": "eNaQHoIr", "sourceItemId": "lpGg8a8D"}' \
    > test.out 2>&1
eval_tap $? 25 'AdminConsumeUserItem' test.out

#- 26 AdminBulkUpdateMyItems
./ng net.accelbyte.sdk.cli.Main inventory adminBulkUpdateMyItems \
    --inventoryId 'T6MjmzSp' \
    --namespace "$AB_NAMESPACE" \
    --userId 'j97cIi2R' \
    --body '[{"customAttributes": {"MjvGGIGV": {}, "ZtCwUwNR": {}, "FYMmheO0": {}}, "serverCustomAttributes": {"vHyNaZdF": {}, "I5k8yTKT": {}, "XLkdXY1m": {}}, "slotId": "rhxW3soE", "sourceItemId": "wjyY86e5", "tags": ["IRKz0605", "H3crvGA5", "pXvgUoP2"], "type": "DlL6pKTe"}, {"customAttributes": {"BO2GELpc": {}, "B4OpnDHE": {}, "CCFxd18Y": {}}, "serverCustomAttributes": {"suVj9UfC": {}, "KGeAl6k5": {}, "UfE3Kkud": {}}, "slotId": "3YxGLbqc", "sourceItemId": "hAbJiv6g", "tags": ["cclYEQuB", "KpAFDVsA", "jh21qIql"], "type": "JuimxtxT"}, {"customAttributes": {"7VrEftjv": {}, "GkNRjP4e": {}, "MFRS6pjM": {}}, "serverCustomAttributes": {"ffYq0ulO": {}, "JEXiMRR7": {}, "YPqGAw5h": {}}, "slotId": "9umdpqiM", "sourceItemId": "zIXabdhS", "tags": ["diJMBdpm", "ywJnUfgx", "oxhlSQGN"], "type": "SOKB5Lmm"}]' \
    > test.out 2>&1
eval_tap $? 26 'AdminBulkUpdateMyItems' test.out

#- 27 AdminSaveItemToInventory
./ng net.accelbyte.sdk.cli.Main inventory adminSaveItemToInventory \
    --inventoryId '3Vjh9Ayo' \
    --namespace "$AB_NAMESPACE" \
    --userId 'dYe9rCc1' \
    --body '{"customAttributes": {"p8UMPIyA": {}, "Zj4HPi5x": {}, "F3mKJJek": {}}, "qty": 30, "serverCustomAttributes": {"uW67Vtoe": {}, "weCilYSd": {}, "tIkLibP9": {}}, "slotId": "GBsjqJV2", "slotUsed": 60, "source": "ECOMMERCE", "sourceItemId": "NyniadjA", "tags": ["Hhqm31B3", "hVWrhn3h", "gZktSsNu"], "type": "QDSi0tsc"}' \
    > test.out 2>&1
eval_tap $? 27 'AdminSaveItemToInventory' test.out

#- 28 AdminBulkRemoveItems
./ng net.accelbyte.sdk.cli.Main inventory adminBulkRemoveItems \
    --inventoryId '6TmOytlV' \
    --namespace "$AB_NAMESPACE" \
    --userId 'N1uvuY0e' \
    --body '[{"slotId": "x6pGR7Te", "sourceItemId": "vNSfJQWe"}, {"slotId": "dU8t32Kt", "sourceItemId": "6M1I3yCc"}, {"slotId": "dKDKlnht", "sourceItemId": "2ZL8wqaw"}]' \
    > test.out 2>&1
eval_tap $? 28 'AdminBulkRemoveItems' test.out

#- 29 AdminSaveItem
./ng net.accelbyte.sdk.cli.Main inventory adminSaveItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'uq7EIr8Q' \
    --body '{"customAttributes": {"0hbbNe5h": {}, "OLsML868": {}, "xGurzbWr": {}}, "inventoryConfigurationCode": "zrFEA4AG", "qty": 67, "serverCustomAttributes": {"N3zntNiU": {}, "qm3eHmrG": {}, "lvBmzbcj": {}}, "slotId": "38CgQqti", "slotUsed": 8, "source": "ECOMMERCE", "sourceItemId": "vVimNYTA", "tags": ["c7ay6gY1", "IPlIhuCA", "fXdWxZD6"], "type": "mvDKx4ha"}' \
    > test.out 2>&1
eval_tap $? 29 'AdminSaveItem' test.out

#- 30 AdminSyncUserEntitlements
./ng net.accelbyte.sdk.cli.Main inventory adminSyncUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'omUbaNSy' \
    > test.out 2>&1
eval_tap $? 30 'AdminSyncUserEntitlements' test.out

#- 31 AdminPurchasable
./ng net.accelbyte.sdk.cli.Main inventory adminPurchasable \
    --namespace "$AB_NAMESPACE" \
    --userId 'iHbrbOzD' \
    --body '{"entitlementType": "OZ30CXuK", "inventoryConfig": {"slotUsed": 69}, "itemId": "8ib1fD9K", "itemType": "QT0qwJJj", "items": [{"bundledQty": 26, "entitlementType": "7wte8bbe", "inventoryConfig": {"slotUsed": 25}, "itemId": "N6WNzDRm", "itemType": "EO9ZLsUY", "sku": "9mAbT9fM", "stackable": true, "useCount": 8}, {"bundledQty": 26, "entitlementType": "TE3iMWFW", "inventoryConfig": {"slotUsed": 24}, "itemId": "mDCbnF29", "itemType": "P1CMkn6m", "sku": "DEsrVGJB", "stackable": true, "useCount": 79}, {"bundledQty": 12, "entitlementType": "5FGVnRpV", "inventoryConfig": {"slotUsed": 1}, "itemId": "ia6qjcvm", "itemType": "urDhXs0l", "sku": "F9lo3bUc", "stackable": true, "useCount": 77}], "quantity": 53, "sku": "CcEohZRw", "stackable": true, "useCount": 90}' \
    > test.out 2>&1
eval_tap $? 31 'AdminPurchasable' test.out

#- 32 PublicListInventoryConfigurations
./ng net.accelbyte.sdk.cli.Main inventory publicListInventoryConfigurations \
    --namespace "$AB_NAMESPACE" \
    --code 'zdHsXSUF' \
    --limit '78' \
    --offset '32' \
    --sortBy 'createdAt:asc' \
    > test.out 2>&1
eval_tap $? 32 'PublicListInventoryConfigurations' test.out

#- 33 PublicListItemTypes
./ng net.accelbyte.sdk.cli.Main inventory publicListItemTypes \
    --namespace "$AB_NAMESPACE" \
    --limit '67' \
    --offset '49' \
    --sortBy 'name:asc' \
    > test.out 2>&1
eval_tap $? 33 'PublicListItemTypes' test.out

#- 34 PublicListTags
./ng net.accelbyte.sdk.cli.Main inventory publicListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '34' \
    --offset '60' \
    --sortBy 'createdAt:desc' \
    > test.out 2>&1
eval_tap $? 34 'PublicListTags' test.out

#- 35 PublicListInventories
./ng net.accelbyte.sdk.cli.Main inventory publicListInventories \
    --namespace "$AB_NAMESPACE" \
    --inventoryConfigurationCode 'It92Ck3q' \
    --limit '99' \
    --offset '19' \
    --sortBy 'createdAt:asc' \
    > test.out 2>&1
eval_tap $? 35 'PublicListInventories' test.out

#- 36 PublicConsumeMyItem
./ng net.accelbyte.sdk.cli.Main inventory publicConsumeMyItem \
    --inventoryId '1fVSBXD4' \
    --namespace "$AB_NAMESPACE" \
    --body '{"qty": 78, "slotId": "BuAQSlRu", "sourceItemId": "AFYituvN"}' \
    > test.out 2>&1
eval_tap $? 36 'PublicConsumeMyItem' test.out

#- 37 PublicListItems
./ng net.accelbyte.sdk.cli.Main inventory publicListItems \
    --inventoryId '60IZQQ1t' \
    --namespace "$AB_NAMESPACE" \
    --limit '99' \
    --offset '13' \
    --qtyGte '29' \
    --sortBy 'createdAt' \
    --sourceItemId 'bOHkjEq8' \
    --tags 'sovP3IFd' \
    > test.out 2>&1
eval_tap $? 37 'PublicListItems' test.out

#- 38 PublicBulkUpdateMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicBulkUpdateMyItems \
    --inventoryId 'C8BS0M6j' \
    --namespace "$AB_NAMESPACE" \
    --body '[{"customAttributes": {"BPL3cLFE": {}, "trTKCW41": {}, "Es8lapMh": {}}, "slotId": "hWq5hFLx", "sourceItemId": "pzF5A95l", "tags": ["EFp2Xb10", "5xnbyA1y", "YYZ9DrsB"]}, {"customAttributes": {"9l7NQMLl": {}, "CZkqP4BL": {}, "d0vR59YZ": {}}, "slotId": "X0E5POlh", "sourceItemId": "NICZOJPO", "tags": ["HT7pGEaA", "E1Sfbn72", "sfTAgsyE"]}, {"customAttributes": {"udhuiEtt": {}, "ZMwfBfKn": {}, "elQ3eHc3": {}}, "slotId": "HMJJ34S7", "sourceItemId": "gwKyFetY", "tags": ["RrKuIduh", "k3nLqLHu", "vx2uVVgN"]}]' \
    > test.out 2>&1
eval_tap $? 38 'PublicBulkUpdateMyItems' test.out

#- 39 PublicBulkRemoveMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicBulkRemoveMyItems \
    --inventoryId 'ct1RG9y2' \
    --namespace "$AB_NAMESPACE" \
    --body '[{"slotId": "Hx8TE2G3", "sourceItemId": "dmAhqdSp"}, {"slotId": "tzAMrCYZ", "sourceItemId": "DrWPeeN1"}, {"slotId": "X3sUwq44", "sourceItemId": "o3c7SK8w"}]' \
    > test.out 2>&1
eval_tap $? 39 'PublicBulkRemoveMyItems' test.out

#- 40 PublicMoveMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicMoveMyItems \
    --inventoryId 'OS1vHSPj' \
    --namespace "$AB_NAMESPACE" \
    --body '{"items": [{"qty": 6, "slotId": "w0epawQ2", "sourceItemId": "Jz5stWAg"}, {"qty": 99, "slotId": "t2lFjCNF", "sourceItemId": "UxuMFEW0"}, {"qty": 81, "slotId": "883azLrQ", "sourceItemId": "FH7w7XcP"}], "srcInventoryId": "pP43CrNO"}' \
    > test.out 2>&1
eval_tap $? 40 'PublicMoveMyItems' test.out

#- 41 PublicGetItem
./ng net.accelbyte.sdk.cli.Main inventory publicGetItem \
    --inventoryId 'BhbC1JMB' \
    --namespace "$AB_NAMESPACE" \
    --slotId 'iQlLfhfl' \
    --sourceItemId 'Wa0KFmMj' \
    > test.out 2>&1
eval_tap $? 41 'PublicGetItem' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
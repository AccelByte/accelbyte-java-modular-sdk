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
    --body '{"message": "EgdZzvCM", "operations": [{"consumeItems": [{"inventoryId": "iWpzXPve", "qty": 27, "slotId": "nnHSfTTU", "sourceItemId": "0DOlwbZa"}, {"inventoryId": "JaHi0Vpl", "qty": 24, "slotId": "9IjxcOji", "sourceItemId": "zW9ldwTV"}, {"inventoryId": "r3QEPGC9", "qty": 7, "slotId": "ae94aVsT", "sourceItemId": "jCE04hwT"}], "createItems": [{"customAttributes": {"3fYeKoiZ": {}, "QnTEBwMW": {}, "B4YC77bv": {}}, "inventoryConfigurationCode": "EkkUUrp9", "inventoryId": "0PGtFWSa", "qty": 31, "serverCustomAttributes": {"O1hDjJsq": {}, "m9B64CLv": {}, "3g81akx4": {}}, "slotId": "J7l8jjkB", "slotUsed": 7, "sourceItemId": "7TY7vkbV", "tags": ["8YfeCyc8", "ytIm7zXg", "ujxUUFXb"], "toSpecificInventory": false, "type": "0rvlwOaV"}, {"customAttributes": {"nupw1ynK": {}, "eKe8g3Qx": {}, "oix7O4ej": {}}, "inventoryConfigurationCode": "mWOjuLHk", "inventoryId": "7TQSEZOq", "qty": 5, "serverCustomAttributes": {"4L5MkiBB": {}, "CRwthEht": {}, "jMVEsUYI": {}}, "slotId": "jgEf1eei", "slotUsed": 82, "sourceItemId": "rhUB3mrW", "tags": ["SIsDKmQG", "yXNUmeID", "AOVfTwDR"], "toSpecificInventory": true, "type": "iVmrdTyY"}, {"customAttributes": {"mhqbFeZf": {}, "uE1Nzyc5": {}, "EdvzD4D3": {}}, "inventoryConfigurationCode": "kBXUiUuC", "inventoryId": "GTO55UbU", "qty": 75, "serverCustomAttributes": {"t2GDuhrf": {}, "X0UuOLvz": {}, "MVljgIev": {}}, "slotId": "ynj0iPvt", "slotUsed": 6, "sourceItemId": "D82ULhjr", "tags": ["AjLp8r7m", "GD701lbM", "ICmfHpBu"], "toSpecificInventory": true, "type": "GJk5E28S"}], "removeItems": [{"inventoryId": "eBjexD94", "slotId": "LiHjniUi", "sourceItemId": "lDfQlTPD"}, {"inventoryId": "ORLFvaBZ", "slotId": "YHCuFu4c", "sourceItemId": "XP0cSMHJ"}, {"inventoryId": "ITQLNqYL", "slotId": "p3QpepW5", "sourceItemId": "PBpZ9WYW"}], "targetUserId": "leOvyMMn", "updateItems": [{"customAttributes": {"uX1QHNUX": {}, "ET0Y4yRD": {}, "uAaIE9Fi": {}}, "inventoryId": "GVg9kS21", "serverCustomAttributes": {"SKn36Qrm": {}, "QTJrvs7i": {}, "ooAZEthU": {}}, "slotId": "8YbFv5we", "sourceItemId": "IqS0WbhB", "tags": ["EtEVloOm", "Dsrf9Mvb", "D8fbvfH9"], "type": "nAgSRrl1"}, {"customAttributes": {"Cvt1k7vE": {}, "pFBjL2Ra": {}, "BmyvWlMa": {}}, "inventoryId": "HLvW9bCW", "serverCustomAttributes": {"81Rd9KMS": {}, "y27sQkzX": {}, "UtIf93So": {}}, "slotId": "RBXu8qif", "sourceItemId": "GWOcxTmH", "tags": ["TFD6ocYw", "hCSilubN", "EYS5rxEI"], "type": "7aBNQqqf"}, {"customAttributes": {"uTKXqrQP": {}, "QRQU9Pdd": {}, "uDaEQCIl": {}}, "inventoryId": "6DnN8fJf", "serverCustomAttributes": {"vXdXW813": {}, "Igb01qgY": {}, "qvICjnb8": {}}, "slotId": "XypOc0f2", "sourceItemId": "YcW6Fpwr", "tags": ["QTk5sUHt", "1V2bIMCG", "YoKZfAVd"], "type": "qwVQq6hN"}]}, {"consumeItems": [{"inventoryId": "gkjX2zWr", "qty": 39, "slotId": "ZtdWuGnL", "sourceItemId": "WnRINyqZ"}, {"inventoryId": "vhQT13cM", "qty": 99, "slotId": "O6Ng8ozr", "sourceItemId": "avAZ7N2T"}, {"inventoryId": "hX4Fa05c", "qty": 72, "slotId": "ZpL1Bfjr", "sourceItemId": "lKeJ6OWR"}], "createItems": [{"customAttributes": {"dlTC3vcz": {}, "qQiSXFzv": {}, "n49LB8hX": {}}, "inventoryConfigurationCode": "DnwbezRr", "inventoryId": "BOp7uFDP", "qty": 83, "serverCustomAttributes": {"6XS7wwEA": {}, "FuVCcKda": {}, "PG9Fo7pE": {}}, "slotId": "20XEk39P", "slotUsed": 39, "sourceItemId": "dnlhhTBV", "tags": ["SaqyMyMe", "AecdHHXR", "4cTXYmRb"], "toSpecificInventory": false, "type": "zsIyAqk7"}, {"customAttributes": {"OKNzu2Bo": {}, "ls3ZFmbL": {}, "wh3belyR": {}}, "inventoryConfigurationCode": "SFbSteC8", "inventoryId": "PLg4eiSU", "qty": 79, "serverCustomAttributes": {"oojmEHbW": {}, "z0E9oPWA": {}, "DWPvYFU9": {}}, "slotId": "yR6aaYVa", "slotUsed": 67, "sourceItemId": "04FGFsQq", "tags": ["CpoqPskX", "EWDrQBNC", "ond8yK7t"], "toSpecificInventory": false, "type": "ofhGA974"}, {"customAttributes": {"YdRPKrV0": {}, "ClAIeHg8": {}, "f2DYZpSq": {}}, "inventoryConfigurationCode": "bc1zDmn8", "inventoryId": "ZdnjcHEY", "qty": 8, "serverCustomAttributes": {"0OJMINE7": {}, "FZQ7i40t": {}, "4C7xGLEF": {}}, "slotId": "n28vXtBm", "slotUsed": 76, "sourceItemId": "Jvl1NdU5", "tags": ["9cfGi3x4", "WrhmauQ4", "8QjccCSj"], "toSpecificInventory": true, "type": "LELFaIeH"}], "removeItems": [{"inventoryId": "c9OdlOdq", "slotId": "K79T1Dyn", "sourceItemId": "tnYlLckM"}, {"inventoryId": "j5M5MG6R", "slotId": "kg7IM898", "sourceItemId": "NapISYlS"}, {"inventoryId": "0TsJPOeM", "slotId": "eEej7jMO", "sourceItemId": "nvisyWdJ"}], "targetUserId": "9mPNX66F", "updateItems": [{"customAttributes": {"BFSpdQbq": {}, "tqRmaqap": {}, "0nsQYFs9": {}}, "inventoryId": "VqQiRC5s", "serverCustomAttributes": {"LXMy9Atd": {}, "jpIgaSZO": {}, "RJXRFeWe": {}}, "slotId": "zItHfO36", "sourceItemId": "IRBYU4OP", "tags": ["Ndma9XN8", "rLGnshUY", "r8cVhX8Z"], "type": "InqBlNzJ"}, {"customAttributes": {"1V7uugem": {}, "JEzLyC8s": {}, "5EvkCLyh": {}}, "inventoryId": "d9f3QQyD", "serverCustomAttributes": {"Vq9Wo6ze": {}, "AaTw5LmC": {}, "aANQOKGq": {}}, "slotId": "tzJkIM2l", "sourceItemId": "VochOVmz", "tags": ["ztrhHOsq", "TddyiWTy", "GuKvYgEn"], "type": "eB0V95qh"}, {"customAttributes": {"gwi5dcMq": {}, "Lp9pslhG": {}, "DQzCUadc": {}}, "inventoryId": "UUUBhbpY", "serverCustomAttributes": {"wEtXyeEX": {}, "kVifuq1s": {}, "iWMVKJ4b": {}}, "slotId": "0IVQ7suv", "sourceItemId": "H9kVfW52", "tags": ["Il2anmf4", "Ny8eASBD", "e4SSGabu"], "type": "RzwIfoxm"}]}, {"consumeItems": [{"inventoryId": "FxUwothN", "qty": 17, "slotId": "hoc16Z0q", "sourceItemId": "3hsqLKIz"}, {"inventoryId": "awmg1g6a", "qty": 77, "slotId": "QvfS0iha", "sourceItemId": "QAiRkKi3"}, {"inventoryId": "GInfLYfb", "qty": 87, "slotId": "CbR1j971", "sourceItemId": "jnNPCiWx"}], "createItems": [{"customAttributes": {"LkC0xs4i": {}, "K4jyUKtH": {}, "AXEYxxz8": {}}, "inventoryConfigurationCode": "2n8g3UQl", "inventoryId": "eqlmyA3p", "qty": 61, "serverCustomAttributes": {"GXM0rqmB": {}, "KLjr12KN": {}, "VhXfQG0N": {}}, "slotId": "eDeejUI1", "slotUsed": 32, "sourceItemId": "MuJL4RBo", "tags": ["Dz5Q1Edc", "WTYMkhtR", "9EvxtHbw"], "toSpecificInventory": false, "type": "Enr9ISbm"}, {"customAttributes": {"TnH486FP": {}, "XuD6mZGh": {}, "kgJMM9l6": {}}, "inventoryConfigurationCode": "78XajTT5", "inventoryId": "YNuqD9sa", "qty": 36, "serverCustomAttributes": {"RWppoIHU": {}, "88CjHxE2": {}, "afS53Z5g": {}}, "slotId": "isJ9Px4G", "slotUsed": 92, "sourceItemId": "QLmDIuUI", "tags": ["TaEuGgAx", "xsL0abxz", "wqteDxSG"], "toSpecificInventory": false, "type": "txqhFq3x"}, {"customAttributes": {"5tJywxiL": {}, "rTbjWp5r": {}, "MGjJbAB0": {}}, "inventoryConfigurationCode": "mJxikaRp", "inventoryId": "JijLiDmB", "qty": 58, "serverCustomAttributes": {"DH1XP7z6": {}, "R12aAx2I": {}, "xTbYVVHh": {}}, "slotId": "leMk5thf", "slotUsed": 87, "sourceItemId": "rUl4OyEb", "tags": ["lCq0uF1J", "TX90P2Ia", "XRrgFMfo"], "toSpecificInventory": true, "type": "yVz9mt5V"}], "removeItems": [{"inventoryId": "BED1Gkd6", "slotId": "pPPFJsHU", "sourceItemId": "ThPADQuD"}, {"inventoryId": "K3aW0QuR", "slotId": "j8GwpzFZ", "sourceItemId": "mMC9nuOy"}, {"inventoryId": "LczVJMDU", "slotId": "pqoGDw0A", "sourceItemId": "4tM3p3zU"}], "targetUserId": "UMwsF7BO", "updateItems": [{"customAttributes": {"nbJLqN8K": {}, "W1puNcdD": {}, "P1wIh3Cs": {}}, "inventoryId": "sElHabiX", "serverCustomAttributes": {"TmDu4ODj": {}, "EqUvMoy5": {}, "mx5LA0a8": {}}, "slotId": "9ItieEY7", "sourceItemId": "KchXL73V", "tags": ["wPf0Oli9", "rCKa2EKN", "eAjTjtRA"], "type": "bJOmmwmG"}, {"customAttributes": {"SAIn0CoW": {}, "JfcUrm37": {}, "AI2vGDZR": {}}, "inventoryId": "uurtybhu", "serverCustomAttributes": {"1Riw3OSL": {}, "0tHRSeo5": {}, "78PImojF": {}}, "slotId": "HpP65iPv", "sourceItemId": "JZLQpyln", "tags": ["WDSmvSz0", "NwklgF92", "IzhcBxWu"], "type": "KhYEOg0q"}, {"customAttributes": {"XdiScB1C": {}, "vJSgzN1H": {}, "7v0K2C9M": {}}, "inventoryId": "YacvoeZN", "serverCustomAttributes": {"3vFlJhQE": {}, "83YHTJx9": {}, "DCeleZyR": {}}, "slotId": "NddqetHg", "sourceItemId": "M5GCQdbW", "tags": ["7F5gsifh", "fzBCDqMl", "6mimapwC"], "type": "yUnWP8rM"}]}], "requestId": "oWVgGa6U"}' \
    > test.out 2>&1
eval_tap $? 2 'AdminCreateChainingOperations' test.out

#- 3 AdminListInventories
./ng net.accelbyte.sdk.cli.Main inventory adminListInventories \
    --namespace "$AB_NAMESPACE" \
    --inventoryConfigurationCode 'nT1b3nw8' \
    --limit '79' \
    --offset '40' \
    --sortBy 'createdAt:asc' \
    --userId 's8KQuPQ7' \
    > test.out 2>&1
eval_tap $? 3 'AdminListInventories' test.out

#- 4 AdminCreateInventory
./ng net.accelbyte.sdk.cli.Main inventory adminCreateInventory \
    --namespace "$AB_NAMESPACE" \
    --body '{"inventoryConfigurationCode": "unRGnS8T", "userId": "8jjbPMPv"}' \
    > test.out 2>&1
eval_tap $? 4 'AdminCreateInventory' test.out

#- 5 AdminGetInventory
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventory \
    --inventoryId 'Kb19u6Bh' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'AdminGetInventory' test.out

#- 6 AdminUpdateInventory
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateInventory \
    --inventoryId 'w0L34Qsl' \
    --namespace "$AB_NAMESPACE" \
    --body '{"incMaxSlots": 72}' \
    > test.out 2>&1
eval_tap $? 6 'AdminUpdateInventory' test.out

#- 7 DeleteInventory
./ng net.accelbyte.sdk.cli.Main inventory deleteInventory \
    --inventoryId 'sRCVYlSz' \
    --namespace "$AB_NAMESPACE" \
    --body '{"message": "QSm2aBNW"}' \
    > test.out 2>&1
eval_tap $? 7 'DeleteInventory' test.out

#- 8 AdminListItems
./ng net.accelbyte.sdk.cli.Main inventory adminListItems \
    --inventoryId 'xlnngqk4' \
    --namespace "$AB_NAMESPACE" \
    --limit '99' \
    --offset '63' \
    --qtyGte '41' \
    --sortBy 'createdAt:desc' \
    --sourceItemId 'irhc8uU6' \
    --tags 'dpwFboyC' \
    > test.out 2>&1
eval_tap $? 8 'AdminListItems' test.out

#- 9 AdminGetInventoryItem
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventoryItem \
    --inventoryId 'f9nVuaHO' \
    --namespace "$AB_NAMESPACE" \
    --slotId 'zc7AQD9B' \
    --sourceItemId 'wFxTjEWB' \
    > test.out 2>&1
eval_tap $? 9 'AdminGetInventoryItem' test.out

#- 10 AdminListInventoryConfigurations
./ng net.accelbyte.sdk.cli.Main inventory adminListInventoryConfigurations \
    --namespace "$AB_NAMESPACE" \
    --code 'bbC7v38w' \
    --limit '61' \
    --offset '70' \
    --sortBy 'code:desc' \
    > test.out 2>&1
eval_tap $? 10 'AdminListInventoryConfigurations' test.out

#- 11 AdminCreateInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminCreateInventoryConfiguration \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "Bo2h1w5I", "description": "Pmtenr3J", "initialMaxSlots": 37, "maxInstancesPerUser": 0, "maxUpgradeSlots": 26, "name": "5KIHDn6N"}' \
    > test.out 2>&1
eval_tap $? 11 'AdminCreateInventoryConfiguration' test.out

#- 12 AdminGetInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventoryConfiguration \
    --inventoryConfigurationId 'Gp8JmGGI' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'AdminGetInventoryConfiguration' test.out

#- 13 AdminUpdateInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateInventoryConfiguration \
    --inventoryConfigurationId '8gUVBkTT' \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "dtPnMbeq", "description": "jAjYtlAI", "initialMaxSlots": 35, "maxInstancesPerUser": 90, "maxUpgradeSlots": 96, "name": "1fTqFttx"}' \
    > test.out 2>&1
eval_tap $? 13 'AdminUpdateInventoryConfiguration' test.out

#- 14 AdminDeleteInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteInventoryConfiguration \
    --inventoryConfigurationId 'NwA2yNZE' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 14 'AdminDeleteInventoryConfiguration' test.out

#- 15 AdminListItemTypes
./ng net.accelbyte.sdk.cli.Main inventory adminListItemTypes \
    --namespace "$AB_NAMESPACE" \
    --limit '20' \
    --offset '33' \
    --sortBy 'name:desc' \
    > test.out 2>&1
eval_tap $? 15 'AdminListItemTypes' test.out

#- 16 AdminCreateItemType
./ng net.accelbyte.sdk.cli.Main inventory adminCreateItemType \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "j9BslCpp"}' \
    > test.out 2>&1
eval_tap $? 16 'AdminCreateItemType' test.out

#- 17 AdminDeleteItemType
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteItemType \
    --itemTypeName 'WrlsWIQF' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'AdminDeleteItemType' test.out

#- 18 AdminListTags
./ng net.accelbyte.sdk.cli.Main inventory adminListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '62' \
    --offset '31' \
    --owner 'fmT9jZgl' \
    --sortBy 'createdAt' \
    > test.out 2>&1
eval_tap $? 18 'AdminListTags' test.out

#- 19 AdminCreateTag
./ng net.accelbyte.sdk.cli.Main inventory adminCreateTag \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "rm4aNq1B", "owner": "SERVER"}' \
    > test.out 2>&1
eval_tap $? 19 'AdminCreateTag' test.out

#- 20 AdminDeleteTag
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteTag \
    --namespace "$AB_NAMESPACE" \
    --tagName 'nZ7Ixb3t' \
    > test.out 2>&1
eval_tap $? 20 'AdminDeleteTag' test.out

#- 21 AdminConsumeUserItem
./ng net.accelbyte.sdk.cli.Main inventory adminConsumeUserItem \
    --inventoryId 'TWAmuMun' \
    --namespace "$AB_NAMESPACE" \
    --userId 'xTinbHKW' \
    --body '{"qty": 22, "slotId": "jR1137Po", "sourceItemId": "6sfYCJw6"}' \
    > test.out 2>&1
eval_tap $? 21 'AdminConsumeUserItem' test.out

#- 22 AdminBulkUpdateMyItems
./ng net.accelbyte.sdk.cli.Main inventory adminBulkUpdateMyItems \
    --inventoryId 'y4uJLq2Q' \
    --namespace "$AB_NAMESPACE" \
    --userId 'sI4V03eq' \
    --body '[{"customAttributes": {"ykawDjbu": {}, "omSB6SYW": {}, "CvqnIMqt": {}}, "serverCustomAttributes": {"JmmiSlX2": {}, "zktgEx9d": {}, "ITkhgQ6s": {}}, "slotId": "UrvMMLKD", "sourceItemId": "yIVyctt9", "tags": ["m9hm65el", "ovcuNQDO", "732jQc53"], "type": "pHCAa0CR"}, {"customAttributes": {"8Q84TE02": {}, "hQjdhe1g": {}, "Ct1HcHOm": {}}, "serverCustomAttributes": {"n3v8RpsZ": {}, "fsIffWW5": {}, "77Cz39Af": {}}, "slotId": "OmVZQNEb", "sourceItemId": "ZfjJYxxK", "tags": ["ZjvCBHsY", "yZCcveDI", "EGgjhBgY"], "type": "ChCRjSJG"}, {"customAttributes": {"8pS2bHFO": {}, "zwfp4kvR": {}, "SEQm8Mbl": {}}, "serverCustomAttributes": {"6KqqwL3d": {}, "AeAfNfkR": {}, "a7CEpgEp": {}}, "slotId": "j0apElK9", "sourceItemId": "6GaWm6Gl", "tags": ["0mg90rPb", "sBzhp2fK", "C0r6GM9e"], "type": "lF0Up2Ra"}]' \
    > test.out 2>&1
eval_tap $? 22 'AdminBulkUpdateMyItems' test.out

#- 23 AdminSaveItemToInventory
./ng net.accelbyte.sdk.cli.Main inventory adminSaveItemToInventory \
    --inventoryId 'tIYXqvSo' \
    --namespace "$AB_NAMESPACE" \
    --userId 'dPTTolG9' \
    --body '{"customAttributes": {"ihqAwXmG": {}, "ZBrYMaVn": {}, "59PCFA5J": {}}, "qty": 10, "serverCustomAttributes": {"Mf8OBdLt": {}, "PEuwGVf1": {}, "BAwPtC6c": {}}, "slotId": "MS8LGNkX", "slotUsed": 12, "sourceItemId": "EpUjWR6M", "tags": ["9tF0r56R", "nCFbqAlB", "5ma75Jlm"], "type": "ljbwisOj"}' \
    > test.out 2>&1
eval_tap $? 23 'AdminSaveItemToInventory' test.out

#- 24 AdminBulkRemoveItems
./ng net.accelbyte.sdk.cli.Main inventory adminBulkRemoveItems \
    --inventoryId 'jurLQ2Sj' \
    --namespace "$AB_NAMESPACE" \
    --userId '9c2x6C2C' \
    --body '[{"slotId": "bTbHkQd3", "sourceItemId": "OWPQBt3n"}, {"slotId": "lmgf5Law", "sourceItemId": "wQJaQneT"}, {"slotId": "0HwDakB1", "sourceItemId": "FkfnwYXL"}]' \
    > test.out 2>&1
eval_tap $? 24 'AdminBulkRemoveItems' test.out

#- 25 AdminSaveItem
./ng net.accelbyte.sdk.cli.Main inventory adminSaveItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'yvEMcU2M' \
    --body '{"customAttributes": {"a53qPVM0": {}, "2eRHZtB2": {}, "L4lzwMfn": {}}, "inventoryConfigurationCode": "fsr0PZTf", "qty": 24, "serverCustomAttributes": {"BOCDyDoN": {}, "cSx5KgtD": {}, "DRZJbAox": {}}, "slotId": "Z09gwLYP", "slotUsed": 48, "sourceItemId": "Gh5OghDA", "tags": ["5na8QeDl", "QJiDU01q", "6eLZnfxn"], "type": "mM63ERLV"}' \
    > test.out 2>&1
eval_tap $? 25 'AdminSaveItem' test.out

#- 26 PublicListInventoryConfigurations
./ng net.accelbyte.sdk.cli.Main inventory publicListInventoryConfigurations \
    --namespace "$AB_NAMESPACE" \
    --code 'HLKBvmBs' \
    --limit '46' \
    --offset '17' \
    --sortBy 'createdAt:asc' \
    > test.out 2>&1
eval_tap $? 26 'PublicListInventoryConfigurations' test.out

#- 27 PublicListItemTypes
./ng net.accelbyte.sdk.cli.Main inventory publicListItemTypes \
    --namespace "$AB_NAMESPACE" \
    --limit '66' \
    --offset '94' \
    --sortBy 'name' \
    > test.out 2>&1
eval_tap $? 27 'PublicListItemTypes' test.out

#- 28 PublicListTags
./ng net.accelbyte.sdk.cli.Main inventory publicListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '22' \
    --offset '40' \
    --sortBy 'name:desc' \
    > test.out 2>&1
eval_tap $? 28 'PublicListTags' test.out

#- 29 PublicListInventories
./ng net.accelbyte.sdk.cli.Main inventory publicListInventories \
    --namespace "$AB_NAMESPACE" \
    --inventoryConfigurationCode 'jzept3vj' \
    --limit '67' \
    --offset '94' \
    --sortBy 'createdAt:desc' \
    > test.out 2>&1
eval_tap $? 29 'PublicListInventories' test.out

#- 30 PublicConsumeMyItem
./ng net.accelbyte.sdk.cli.Main inventory publicConsumeMyItem \
    --inventoryId 'DluoHR4V' \
    --namespace "$AB_NAMESPACE" \
    --body '{"qty": 54, "slotId": "8XyFD8Hs", "sourceItemId": "vZn5IGcx"}' \
    > test.out 2>&1
eval_tap $? 30 'PublicConsumeMyItem' test.out

#- 31 PublicListItems
./ng net.accelbyte.sdk.cli.Main inventory publicListItems \
    --inventoryId 'B3AZg57x' \
    --namespace "$AB_NAMESPACE" \
    --limit '64' \
    --offset '29' \
    --qtyGte '46' \
    --sortBy 'qty:asc' \
    --sourceItemId 'I34tG5Ld' \
    --tags 'IhIWncpW' \
    > test.out 2>&1
eval_tap $? 31 'PublicListItems' test.out

#- 32 PublicBulkUpdateMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicBulkUpdateMyItems \
    --inventoryId 'GOZX3oNe' \
    --namespace "$AB_NAMESPACE" \
    --body '[{"customAttributes": {"ao36CaA4": {}, "3MtN6NXY": {}, "hvB8qDzC": {}}, "slotId": "p9CzrMeN", "sourceItemId": "famQrBtB", "tags": ["DBDmVXEU", "2J6aQHSl", "9QMT9RHc"]}, {"customAttributes": {"mGTFUqNu": {}, "suEdZ33i": {}, "gsdp9L0S": {}}, "slotId": "wCVoWfCe", "sourceItemId": "XBgfsWrN", "tags": ["Novag3fW", "Ry4Whfqx", "C98Y9y3l"]}, {"customAttributes": {"sikvC61U": {}, "2m6WnAXY": {}, "ii3sRXNa": {}}, "slotId": "8R8jhpEC", "sourceItemId": "bztVSD1y", "tags": ["uF9XZk1P", "g5L5Chln", "ghzKhZ1u"]}]' \
    > test.out 2>&1
eval_tap $? 32 'PublicBulkUpdateMyItems' test.out

#- 33 PublicBulkRemoveMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicBulkRemoveMyItems \
    --inventoryId '6JgK8B7p' \
    --namespace "$AB_NAMESPACE" \
    --body '[{"slotId": "aUAIt2Ja", "sourceItemId": "iDN2vvEg"}, {"slotId": "vR0JdC3X", "sourceItemId": "qCfh3SS1"}, {"slotId": "kaiKmVxt", "sourceItemId": "GlVr4yYZ"}]' \
    > test.out 2>&1
eval_tap $? 33 'PublicBulkRemoveMyItems' test.out

#- 34 PublicMoveMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicMoveMyItems \
    --inventoryId 'LlU4x5r1' \
    --namespace "$AB_NAMESPACE" \
    --body '{"items": [{"qty": 98, "slotId": "UmqxOFo0", "sourceItemId": "37AqyVu4"}, {"qty": 3, "slotId": "wYpj0gj0", "sourceItemId": "GRsumanZ"}, {"qty": 62, "slotId": "HNPmceue", "sourceItemId": "ZPcqQYDf"}], "srcInventoryId": "CqQWWgQZ"}' \
    > test.out 2>&1
eval_tap $? 34 'PublicMoveMyItems' test.out

#- 35 PublicGetItem
./ng net.accelbyte.sdk.cli.Main inventory publicGetItem \
    --inventoryId 'cSxF2BQj' \
    --namespace "$AB_NAMESPACE" \
    --slotId '6Omo0Mdw' \
    --sourceItemId '61x1XT3X' \
    > test.out 2>&1
eval_tap $? 35 'PublicGetItem' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
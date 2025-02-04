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
    --body '{"message": "u0KGB7JS", "operations": [{"consumeItems": [{"dateRangeValidation": true, "inventoryId": "Ml5eTnc7", "options": ["I6o7MPGC", "gR0N5WK6", "cdda9Mr7"], "qty": 91, "slotId": "PJuWGLiX", "sourceItemId": "isaM6PNg"}, {"dateRangeValidation": false, "inventoryId": "RCIua78H", "options": ["q7jcQgkj", "3HLLpV5v", "PmDAK2pF"], "qty": 61, "slotId": "rFIDJ99P", "sourceItemId": "q48Nu2MO"}, {"dateRangeValidation": false, "inventoryId": "Awj8UCLY", "options": ["jrXlgF7g", "zslVJSDy", "HGChd62R"], "qty": 0, "slotId": "u7FUAVjG", "sourceItemId": "Bm8STRWE"}], "createItems": [{"customAttributes": {"EEXQAYr9": {}, "VxxsppNk": {}, "CNX5F7on": {}}, "inventoryConfigurationCode": "xiiNXPhw", "inventoryId": "q2cNNJPL", "qty": 10, "serverCustomAttributes": {"crXFvUsl": {}, "NAdxZaNp": {}, "y1QbPpFu": {}}, "slotId": "g380JMfr", "slotUsed": 64, "source": "ECOMMERCE", "sourceItemId": "aTJ0JHnh", "tags": ["5Uv5MiQt", "GDTNYz7b", "MQeAmr7Q"], "toSpecificInventory": true, "type": "Z1V4zshc"}, {"customAttributes": {"gndbK6en": {}, "gwY7aZGM": {}, "9NzJjr6U": {}}, "inventoryConfigurationCode": "OWyyUg6H", "inventoryId": "c1PAe3Ks", "qty": 23, "serverCustomAttributes": {"0sdu20iY": {}, "xuUkLijy": {}, "2rKmdhRB": {}}, "slotId": "vxqyhF57", "slotUsed": 49, "source": "OTHER", "sourceItemId": "nCT5BWxg", "tags": ["q0V4UgD2", "uAMzhuds", "GmCCDLOU"], "toSpecificInventory": false, "type": "55JUNNLk"}, {"customAttributes": {"xVOj0dYu": {}, "dCdZ336t": {}, "C15cLX3b": {}}, "inventoryConfigurationCode": "KleUsbAP", "inventoryId": "HYRRuvdx", "qty": 76, "serverCustomAttributes": {"gDwTZ86O": {}, "K9J51mAg": {}, "5SDdvMnM": {}}, "slotId": "vypt9uSB", "slotUsed": 93, "source": "ECOMMERCE", "sourceItemId": "qxjYjaU3", "tags": ["pxc2WTFj", "MUEXt8n2", "GYAfnNAC"], "toSpecificInventory": true, "type": "fkM6HhZR"}], "removeItems": [{"inventoryId": "y93OiCj0", "slotId": "5CANZCJH", "sourceItemId": "im94XM9L"}, {"inventoryId": "PGlxBXFn", "slotId": "oZlHLlw6", "sourceItemId": "PBGnBfX5"}, {"inventoryId": "GqTgYCez", "slotId": "Nr3vYD44", "sourceItemId": "ThS7Rir9"}], "targetUserId": "NihAS9Ls", "updateItems": [{"customAttributes": {"1erl2xNy": {}, "GeqsdTWZ": {}, "0MMKFJSE": {}}, "inventoryId": "XZ7mAF3G", "serverCustomAttributes": {"HMnOdJ7V": {}, "mUv1iX0r": {}, "krBhDspL": {}}, "slotId": "4c1DqL3R", "sourceItemId": "h57JZ3rB", "tags": ["NxznXdxF", "QGYxrahl", "gSKh5QOW"], "type": "bptj65ih"}, {"customAttributes": {"VgLTFA25": {}, "JONDrAjF": {}, "ZTDMMfyV": {}}, "inventoryId": "t19T8VzL", "serverCustomAttributes": {"0F3I0ZMV": {}, "bGftTETF": {}, "M9aXeCQM": {}}, "slotId": "WrKQWI7c", "sourceItemId": "6oysN0C4", "tags": ["JC6L56c1", "fv3e1QCP", "Jeqn7bOk"], "type": "sbIF3xKm"}, {"customAttributes": {"UvTA97wT": {}, "da6ZxAMX": {}, "iExAFSEG": {}}, "inventoryId": "K7vI9NjU", "serverCustomAttributes": {"hUkfyTMi": {}, "1TcVZeqy": {}, "ZjumbD32": {}}, "slotId": "ExYiZ6pD", "sourceItemId": "YSnq1Auh", "tags": ["jDZQzm5y", "YWCdHVNT", "l5i4RdgO"], "type": "c42YZ1Tv"}]}, {"consumeItems": [{"dateRangeValidation": false, "inventoryId": "zNVEKQYZ", "options": ["KThBOFcT", "ylcTW0PP", "huErKhDr"], "qty": 95, "slotId": "rqOU86bX", "sourceItemId": "UJmlYA5G"}, {"dateRangeValidation": false, "inventoryId": "sWyRoU2B", "options": ["dkVEggQT", "EcccWn5N", "JMFNJCEM"], "qty": 97, "slotId": "1OZtrB29", "sourceItemId": "h5SH6mbT"}, {"dateRangeValidation": true, "inventoryId": "Uop9m8ED", "options": ["Ab0kdrDJ", "plGn1daG", "e67JnYMO"], "qty": 10, "slotId": "xoHU7oJT", "sourceItemId": "ZgdaoHek"}], "createItems": [{"customAttributes": {"bj4VEOcb": {}, "LaClH4qe": {}, "TpwCZz8O": {}}, "inventoryConfigurationCode": "upFA9GFz", "inventoryId": "zB6FviNY", "qty": 78, "serverCustomAttributes": {"QE8NdYCa": {}, "oZ6p4YnQ": {}, "s3dLkLxf": {}}, "slotId": "3S6w3N7f", "slotUsed": 35, "source": "ECOMMERCE", "sourceItemId": "j7FLks55", "tags": ["K3NRfMkZ", "HfOnaXsG", "goHpSoxH"], "toSpecificInventory": true, "type": "t3RhC0ZX"}, {"customAttributes": {"ovw0HCRt": {}, "lkmVxn2k": {}, "utyDMSkN": {}}, "inventoryConfigurationCode": "23O9Wkq0", "inventoryId": "4kYHrUzn", "qty": 48, "serverCustomAttributes": {"nTqyAMnH": {}, "gGOpmWtG": {}, "jxdYz6kz": {}}, "slotId": "pp2IyINs", "slotUsed": 35, "source": "OTHER", "sourceItemId": "nvFqPtv8", "tags": ["YytIHdDw", "ZJcH5YYH", "YXgtI1FU"], "toSpecificInventory": false, "type": "AqvTVi9v"}, {"customAttributes": {"Mk8WMomD": {}, "fKy3sb3R": {}, "Zc0qJRZL": {}}, "inventoryConfigurationCode": "MIgHolED", "inventoryId": "bXvHljAR", "qty": 84, "serverCustomAttributes": {"TzrQd71L": {}, "uNqHBLhG": {}, "u80o6VRl": {}}, "slotId": "8EeDozCd", "slotUsed": 25, "source": "ECOMMERCE", "sourceItemId": "nbxoI5C2", "tags": ["7Uc0rPYF", "YbOKRf7X", "9A16dpIP"], "toSpecificInventory": false, "type": "SPJzk19i"}], "removeItems": [{"inventoryId": "Y2Lro5aJ", "slotId": "is8a9VG4", "sourceItemId": "pmTxmpjM"}, {"inventoryId": "gT5r7pZx", "slotId": "lSO3YOts", "sourceItemId": "OBDEzAfJ"}, {"inventoryId": "MWaPfI82", "slotId": "ViAeKQut", "sourceItemId": "qqxMo9a7"}], "targetUserId": "1BuUKN0k", "updateItems": [{"customAttributes": {"KedG4Ppo": {}, "CoBBQVxk": {}, "hRnHFonb": {}}, "inventoryId": "IFIMUIRC", "serverCustomAttributes": {"vJDARjPo": {}, "OJFm7VIO": {}, "uZDJnlzW": {}}, "slotId": "mlemka6V", "sourceItemId": "3dx1xia5", "tags": ["c9FX1saC", "2BABSIBN", "WbJ3qKIb"], "type": "lK76oTcF"}, {"customAttributes": {"9in8ldhd": {}, "3P5vx6N3": {}, "0SPuoQO1": {}}, "inventoryId": "caNYUpcW", "serverCustomAttributes": {"ClMuxitI": {}, "sJU3FSmJ": {}, "6FlqjEGs": {}}, "slotId": "3GhYAmTT", "sourceItemId": "eaAN0mKd", "tags": ["aUwjrDQZ", "6nBF0akZ", "fRS00tLL"], "type": "tOyXXo9l"}, {"customAttributes": {"SN6UmHvm": {}, "ZcOvXeJQ": {}, "lm71hBpm": {}}, "inventoryId": "5uLYzOaO", "serverCustomAttributes": {"vquwUmg1": {}, "SABrWmk7": {}, "d7aaTQIx": {}}, "slotId": "fDfYWn4B", "sourceItemId": "3QpO5wij", "tags": ["17wnNkUp", "ZblZ6h2W", "IacVk5z9"], "type": "dOatqOQk"}]}, {"consumeItems": [{"dateRangeValidation": true, "inventoryId": "ROFIxAxH", "options": ["4oO79Ft8", "rWcOHfpI", "72uwRejQ"], "qty": 61, "slotId": "sIRTdZi1", "sourceItemId": "ysec7B7k"}, {"dateRangeValidation": false, "inventoryId": "Oug7koaL", "options": ["TYs8J3q5", "CJMgOKaz", "piewAHXx"], "qty": 21, "slotId": "mPtSuCtX", "sourceItemId": "6xeLAPRK"}, {"dateRangeValidation": true, "inventoryId": "WcLlZdNO", "options": ["2JRaPNMa", "ChoPacta", "PbFXiLcX"], "qty": 15, "slotId": "QUp3kEGm", "sourceItemId": "A4bjgXHM"}], "createItems": [{"customAttributes": {"ngVLfPj1": {}, "oQKyNnrf": {}, "4G105KL5": {}}, "inventoryConfigurationCode": "p6VF9snZ", "inventoryId": "FKyLFUGJ", "qty": 93, "serverCustomAttributes": {"fXgle3hw": {}, "5pzDpNq4": {}, "qEAM7NPE": {}}, "slotId": "XnqhhH9D", "slotUsed": 37, "source": "OTHER", "sourceItemId": "eR7TpdfZ", "tags": ["m7AMOyvx", "jCJEdgWq", "Jz7Vk3YI"], "toSpecificInventory": false, "type": "gIYfVueV"}, {"customAttributes": {"ojt0TUaJ": {}, "pDaio0Mj": {}, "p1YJ9IUb": {}}, "inventoryConfigurationCode": "fXX1f7Df", "inventoryId": "lvA7SFXO", "qty": 89, "serverCustomAttributes": {"gZvth5pd": {}, "o1mr3Lwj": {}, "ft4LZzE7": {}}, "slotId": "LOMtZbjt", "slotUsed": 89, "source": "OTHER", "sourceItemId": "f1JD3F6H", "tags": ["wgTFeGwb", "TgNquYzH", "r5o7TIiN"], "toSpecificInventory": true, "type": "mW27Iu6e"}, {"customAttributes": {"DEU3c88b": {}, "NWnzClGU": {}, "mqN6cz4w": {}}, "inventoryConfigurationCode": "AxAKyrHa", "inventoryId": "l1UpBPJD", "qty": 16, "serverCustomAttributes": {"LNt5aGyf": {}, "eFgeGo7l": {}, "VHfslvwi": {}}, "slotId": "BTbnt2fJ", "slotUsed": 38, "source": "OTHER", "sourceItemId": "2tX3ZSWO", "tags": ["BuANL2oz", "uPC5O9fX", "20fuvjHo"], "toSpecificInventory": false, "type": "K3qhUyMM"}], "removeItems": [{"inventoryId": "oaDGwyXp", "slotId": "2VkUdk6Y", "sourceItemId": "yntKSwIS"}, {"inventoryId": "taAl4Zzz", "slotId": "c8818PMR", "sourceItemId": "Idj1Pfcp"}, {"inventoryId": "pjsneX4Q", "slotId": "QCQHtRRT", "sourceItemId": "iPDLqkhY"}], "targetUserId": "fcAvZHiK", "updateItems": [{"customAttributes": {"uIJjGdff": {}, "WOqwC4d4": {}, "auNMX7tA": {}}, "inventoryId": "LqSmCSOb", "serverCustomAttributes": {"FRso1fQZ": {}, "0pWGr6Ca": {}, "p0N4186e": {}}, "slotId": "coHGmkNE", "sourceItemId": "G9lbTlFq", "tags": ["ADkA6FK2", "I8GfknFF", "WVs43cd1"], "type": "H1rb5BD6"}, {"customAttributes": {"3gaJCKXd": {}, "brMviTBk": {}, "14NgPOga": {}}, "inventoryId": "kDl0i3iO", "serverCustomAttributes": {"ZC07VXCs": {}, "WrA6v0U3": {}, "0ZHWg2fr": {}}, "slotId": "cT8rEo5D", "sourceItemId": "BHAiWIkm", "tags": ["2h9VFYTm", "eIjl5Zzv", "IaDLMdGG"], "type": "sktiNp9x"}, {"customAttributes": {"fxrPJCBw": {}, "KCAe3y8H": {}, "8mR3Yglj": {}}, "inventoryId": "mTCtrzZ8", "serverCustomAttributes": {"p8VY3mEg": {}, "JxumJJpw": {}, "bLuvYrFe": {}}, "slotId": "I9d94lyL", "sourceItemId": "dtaNdfMg", "tags": ["QAiKpbYo", "wXvzMHmL", "z4yAMKVX"], "type": "iRYLdsk7"}]}], "requestId": "C4jLQkWH"}' \
    > test.out 2>&1
eval_tap $? 2 'AdminCreateChainingOperations' test.out

#- 3 AdminListIntegrationConfigurations
./ng net.accelbyte.sdk.cli.Main inventory adminListIntegrationConfigurations \
    --namespace "$AB_NAMESPACE" \
    --limit '6' \
    --offset '27' \
    --sortBy 'createdAt:asc' \
    > test.out 2>&1
eval_tap $? 3 'AdminListIntegrationConfigurations' test.out

#- 4 AdminCreateIntegrationConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminCreateIntegrationConfiguration \
    --namespace "$AB_NAMESPACE" \
    --body '{"mapItemType": ["lzt8XwQz", "njde8Ih4", "22tnUO00"], "serviceName": "dm5MkbEO", "targetInventoryCode": "FQZY7Gim"}' \
    > test.out 2>&1
eval_tap $? 4 'AdminCreateIntegrationConfiguration' test.out

#- 5 AdminUpdateIntegrationConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateIntegrationConfiguration \
    --integrationConfigurationId 'oyJ3u3Td' \
    --namespace "$AB_NAMESPACE" \
    --body '{"mapItemType": ["lL1daRYd", "gQU0bAAg", "6VSgnBgz"], "serviceName": "qeYMG6Ks", "targetInventoryCode": "ljJBlSyT"}' \
    > test.out 2>&1
eval_tap $? 5 'AdminUpdateIntegrationConfiguration' test.out

#- 6 AdminUpdateStatusIntegrationConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateStatusIntegrationConfiguration \
    --integrationConfigurationId 'CFx7QReR' \
    --namespace "$AB_NAMESPACE" \
    --body '{"status": "INIT"}' \
    > test.out 2>&1
eval_tap $? 6 'AdminUpdateStatusIntegrationConfiguration' test.out

#- 7 AdminListInventories
./ng net.accelbyte.sdk.cli.Main inventory adminListInventories \
    --namespace "$AB_NAMESPACE" \
    --inventoryConfigurationCode 'NQ1VFO2x' \
    --limit '21' \
    --offset '70' \
    --sortBy 'createdAt' \
    --userId 'NpTu7oDG' \
    > test.out 2>&1
eval_tap $? 7 'AdminListInventories' test.out

#- 8 AdminCreateInventory
./ng net.accelbyte.sdk.cli.Main inventory adminCreateInventory \
    --namespace "$AB_NAMESPACE" \
    --body '{"inventoryConfigurationCode": "Ci5hNpfe", "userId": "JuW3aMmv"}' \
    > test.out 2>&1
eval_tap $? 8 'AdminCreateInventory' test.out

#- 9 AdminGetInventory
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventory \
    --inventoryId 'cbFGWlBA' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'AdminGetInventory' test.out

#- 10 AdminUpdateInventory
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateInventory \
    --inventoryId 'vdMgRlPs' \
    --namespace "$AB_NAMESPACE" \
    --body '{"incMaxSlots": 3}' \
    > test.out 2>&1
eval_tap $? 10 'AdminUpdateInventory' test.out

#- 11 DeleteInventory
./ng net.accelbyte.sdk.cli.Main inventory deleteInventory \
    --inventoryId 'ZU2OaPlh' \
    --namespace "$AB_NAMESPACE" \
    --body '{"message": "7rgLrD0C"}' \
    > test.out 2>&1
eval_tap $? 11 'DeleteInventory' test.out

#- 12 AdminListItems
./ng net.accelbyte.sdk.cli.Main inventory adminListItems \
    --inventoryId '6FJrqhPf' \
    --namespace "$AB_NAMESPACE" \
    --limit '44' \
    --offset '54' \
    --sortBy 'updatedAt:desc' \
    --sourceItemId 'B6SusdVe' \
    --tags 'VzeE7JdE' \
    > test.out 2>&1
eval_tap $? 12 'AdminListItems' test.out

#- 13 AdminGetInventoryItem
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventoryItem \
    --inventoryId 'tfdDCuPa' \
    --namespace "$AB_NAMESPACE" \
    --slotId '8oPCtN6D' \
    --sourceItemId 'Aut0gIC4' \
    > test.out 2>&1
eval_tap $? 13 'AdminGetInventoryItem' test.out

#- 14 AdminListInventoryConfigurations
./ng net.accelbyte.sdk.cli.Main inventory adminListInventoryConfigurations \
    --namespace "$AB_NAMESPACE" \
    --code 'NuNRQ9b6' \
    --limit '52' \
    --offset '95' \
    --sortBy 'code:asc' \
    > test.out 2>&1
eval_tap $? 14 'AdminListInventoryConfigurations' test.out

#- 15 AdminCreateInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminCreateInventoryConfiguration \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "DkHrRzcI", "description": "NXr7BOOp", "initialMaxSlots": 2, "maxInstancesPerUser": 56, "maxUpgradeSlots": 99, "name": "6v8VUJMy"}' \
    > test.out 2>&1
eval_tap $? 15 'AdminCreateInventoryConfiguration' test.out

#- 16 AdminGetInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventoryConfiguration \
    --inventoryConfigurationId '7XJPs0Xc' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'AdminGetInventoryConfiguration' test.out

#- 17 AdminUpdateInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateInventoryConfiguration \
    --inventoryConfigurationId 'KWRM4Vfu' \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "utl2k87O", "description": "zB5CRhq3", "initialMaxSlots": 60, "maxInstancesPerUser": 59, "maxUpgradeSlots": 48, "name": "j2OhiooO"}' \
    > test.out 2>&1
eval_tap $? 17 'AdminUpdateInventoryConfiguration' test.out

#- 18 AdminDeleteInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteInventoryConfiguration \
    --inventoryConfigurationId 'cvKyGlhS' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminDeleteInventoryConfiguration' test.out

#- 19 AdminListItemTypes
./ng net.accelbyte.sdk.cli.Main inventory adminListItemTypes \
    --namespace "$AB_NAMESPACE" \
    --limit '9' \
    --offset '0' \
    --sortBy 'createdAt:asc' \
    > test.out 2>&1
eval_tap $? 19 'AdminListItemTypes' test.out

#- 20 AdminCreateItemType
./ng net.accelbyte.sdk.cli.Main inventory adminCreateItemType \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "6QWI7dkD"}' \
    > test.out 2>&1
eval_tap $? 20 'AdminCreateItemType' test.out

#- 21 AdminDeleteItemType
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteItemType \
    --itemTypeName 'NyDJyjeu' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'AdminDeleteItemType' test.out

#- 22 AdminListTags
./ng net.accelbyte.sdk.cli.Main inventory adminListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '63' \
    --offset '82' \
    --owner 'yZqXkjZM' \
    --sortBy 'name' \
    > test.out 2>&1
eval_tap $? 22 'AdminListTags' test.out

#- 23 AdminCreateTag
./ng net.accelbyte.sdk.cli.Main inventory adminCreateTag \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "LNnZ4wot", "owner": "CLIENT"}' \
    > test.out 2>&1
eval_tap $? 23 'AdminCreateTag' test.out

#- 24 AdminDeleteTag
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteTag \
    --namespace "$AB_NAMESPACE" \
    --tagName 'xtZlHkbF' \
    > test.out 2>&1
eval_tap $? 24 'AdminDeleteTag' test.out

#- 25 AdminConsumeUserItem
./ng net.accelbyte.sdk.cli.Main inventory adminConsumeUserItem \
    --inventoryId 'VwwNzbMv' \
    --namespace "$AB_NAMESPACE" \
    --userId 'M3A3TyJI' \
    --dateRangeValidation '9Yw6deQZ' \
    --body '{"options": ["biHq8Q7J", "MMg7fggn", "MiCSOX84"], "qty": 38, "slotId": "3gNLqxfQ", "sourceItemId": "TGrLh71W"}' \
    > test.out 2>&1
eval_tap $? 25 'AdminConsumeUserItem' test.out

#- 26 AdminBulkUpdateMyItems
./ng net.accelbyte.sdk.cli.Main inventory adminBulkUpdateMyItems \
    --inventoryId 'orvp6iqb' \
    --namespace "$AB_NAMESPACE" \
    --userId 'jbALIUNd' \
    --body '[{"customAttributes": {"ZMoy3yUU": {}, "7reSLc34": {}, "vlcuia1l": {}}, "serverCustomAttributes": {"N0iKLvfo": {}, "YZnkMasN": {}, "izuEPj6A": {}}, "slotId": "smi4dat3", "sourceItemId": "td0cFt2w", "tags": ["sFm1D8q3", "XWnYZ1vj", "rq09X8qs"], "type": "J1AFaP4Y"}, {"customAttributes": {"2IcEACbW": {}, "rHlguSYi": {}, "tpz9FIYA": {}}, "serverCustomAttributes": {"z8DrWQB7": {}, "lIfaaDM1": {}, "z24wn78Q": {}}, "slotId": "NqsLwnUY", "sourceItemId": "AbQyKRQO", "tags": ["tIh4c4n3", "d55oVn5x", "Ct2EcyNJ"], "type": "7Mwx7056"}, {"customAttributes": {"e2UdbDVH": {}, "OPOnGUL3": {}, "iUNRbvL7": {}}, "serverCustomAttributes": {"TfDOXrTv": {}, "NhFe4rBl": {}, "xpySLyKt": {}}, "slotId": "DKXpx65c", "sourceItemId": "jUD5jgHk", "tags": ["TYgEhAc2", "Q9Vmbxoi", "jvxzcrlq"], "type": "RYxNgCWo"}]' \
    > test.out 2>&1
eval_tap $? 26 'AdminBulkUpdateMyItems' test.out

#- 27 AdminSaveItemToInventory
./ng net.accelbyte.sdk.cli.Main inventory adminSaveItemToInventory \
    --inventoryId 'W97sLanW' \
    --namespace "$AB_NAMESPACE" \
    --userId 'AbE3ckdv' \
    --body '{"customAttributes": {"JO0CsTok": {}, "jlIeA2Vi": {}, "tPLT23xg": {}}, "qty": 94, "serverCustomAttributes": {"KwhbPtA7": {}, "wvs6O757": {}, "BPcf8jJL": {}}, "slotId": "wk6j5k5c", "slotUsed": 83, "source": "OTHER", "sourceItemId": "oHEwfK3L", "tags": ["Q5IhNIDb", "sNgHtzf1", "8dWbGqZo"], "type": "1ARR999K"}' \
    > test.out 2>&1
eval_tap $? 27 'AdminSaveItemToInventory' test.out

#- 28 AdminBulkRemoveItems
./ng net.accelbyte.sdk.cli.Main inventory adminBulkRemoveItems \
    --inventoryId 'NninWYxx' \
    --namespace "$AB_NAMESPACE" \
    --userId 'p0P6uJQb' \
    --body '[{"slotId": "2coRLTub", "sourceItemId": "oRp6RynB"}, {"slotId": "1YFRsLfq", "sourceItemId": "qkaIUOnC"}, {"slotId": "cSTI3aBK", "sourceItemId": "GoUWSBW9"}]' \
    > test.out 2>&1
eval_tap $? 28 'AdminBulkRemoveItems' test.out

#- 29 AdminBulkSaveItemToInventory
./ng net.accelbyte.sdk.cli.Main inventory adminBulkSaveItemToInventory \
    --inventoryId '3M70qkZy' \
    --namespace "$AB_NAMESPACE" \
    --userId 'zBtciImj' \
    --body '[{"customAttributes": {"EYvTisKW": {}, "VdftVdor": {}, "ue3cAHLO": {}}, "qty": 36, "serverCustomAttributes": {"j4GKSlmq": {}, "esq9jW2U": {}, "222flOaw": {}}, "slotId": "xhsiXRdI", "slotUsed": 4, "source": "ECOMMERCE", "sourceItemId": "1kxpxXzC", "tags": ["4PJmFCM4", "DBJuJO44", "o9yR0e7J"], "type": "5UByttGh"}, {"customAttributes": {"DJUhlDRH": {}, "BHHoeQjK": {}, "C76Eg3X9": {}}, "qty": 68, "serverCustomAttributes": {"ajwqLs68": {}, "HURkIzz9": {}, "i3dK9b7A": {}}, "slotId": "PaRQtcHa", "slotUsed": 76, "source": "ECOMMERCE", "sourceItemId": "62GLP3AY", "tags": ["382tYznG", "CFsH5nse", "vn8YNVUv"], "type": "Z5HAKnjc"}, {"customAttributes": {"yn7JAo3Q": {}, "roRlKOUl": {}, "HZPbgnzX": {}}, "qty": 1, "serverCustomAttributes": {"oV80dm33": {}, "ZcfmSzIk": {}, "aKWEVEam": {}}, "slotId": "CyiCHde2", "slotUsed": 68, "source": "ECOMMERCE", "sourceItemId": "ssEbnusw", "tags": ["TYnDkYQv", "AUmyEvF7", "9vwqWvcB"], "type": "tnTCWvWD"}]' \
    > test.out 2>&1
eval_tap $? 29 'AdminBulkSaveItemToInventory' test.out

#- 30 AdminUpdateUserInventoriesByInventoryCode
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateUserInventoriesByInventoryCode \
    --inventoryConfigurationCode '0xlWzPvP' \
    --namespace "$AB_NAMESPACE" \
    --userId 'OcseJlRU' \
    --body '{"incMaxSlots": 12}' \
    > test.out 2>&1
eval_tap $? 30 'AdminUpdateUserInventoriesByInventoryCode' test.out

#- 31 AdminSaveItem
./ng net.accelbyte.sdk.cli.Main inventory adminSaveItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'bWXq4yph' \
    --body '{"customAttributes": {"6lBhjIls": {}, "t59E2Ko0": {}, "1hmSlVE4": {}}, "inventoryConfigurationCode": "3JGe80Ku", "qty": 72, "serverCustomAttributes": {"z7dwmAYZ": {}, "tDCF9F2V": {}, "0ktWXAzn": {}}, "slotId": "f0nAT8XL", "slotUsed": 79, "source": "OTHER", "sourceItemId": "YIqC6ncJ", "tags": ["xR3oneWG", "5wu9UgxP", "04fGk70Q"], "type": "9u9NS6Nx"}' \
    > test.out 2>&1
eval_tap $? 31 'AdminSaveItem' test.out

#- 32 AdminBulkSaveItem
./ng net.accelbyte.sdk.cli.Main inventory adminBulkSaveItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'aqerdKhu' \
    --body '[{"customAttributes": {"Inbkt20I": {}, "MlPn1PEu": {}, "UUGBAqrp": {}}, "inventoryConfigurationCode": "yXOurn8F", "qty": 77, "serverCustomAttributes": {"EqURYduW": {}, "Engfyq2U": {}, "SiyxxQU6": {}}, "slotId": "oGRiym2f", "slotUsed": 9, "source": "ECOMMERCE", "sourceItemId": "vDbkCVVF", "tags": ["F0RDHgnP", "4buH3fd1", "FeSzV7tA"], "type": "MVdBMi3B"}, {"customAttributes": {"Xw6tKG8S": {}, "kE8e81d8": {}, "NB9pjZx4": {}}, "inventoryConfigurationCode": "bgjgKaOr", "qty": 86, "serverCustomAttributes": {"OuE5I5oE": {}, "SnEaiIAG": {}, "qQQie7nf": {}}, "slotId": "otxumLXD", "slotUsed": 3, "source": "OTHER", "sourceItemId": "kvIGDmYC", "tags": ["kRQQVfl5", "TJiSMJCQ", "63Zsl6Yq"], "type": "LBniMq6g"}, {"customAttributes": {"e3lWMEdV": {}, "7FnsQABH": {}, "HtLheB3S": {}}, "inventoryConfigurationCode": "BRVfAVUv", "qty": 69, "serverCustomAttributes": {"LaTUXi0u": {}, "X6Jq04Sk": {}, "SVfQISTI": {}}, "slotId": "K4S2PL3a", "slotUsed": 60, "source": "ECOMMERCE", "sourceItemId": "TvUcXVyu", "tags": ["p7xaqqCO", "YvFGlXoU", "4fFC5STI"], "type": "Cz3mMoRn"}]' \
    > test.out 2>&1
eval_tap $? 32 'AdminBulkSaveItem' test.out

#- 33 AdminSyncUserEntitlements
./ng net.accelbyte.sdk.cli.Main inventory adminSyncUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'Mw1fss2t' \
    > test.out 2>&1
eval_tap $? 33 'AdminSyncUserEntitlements' test.out

#- 34 AdminPurchasable
./ng net.accelbyte.sdk.cli.Main inventory adminPurchasable \
    --namespace "$AB_NAMESPACE" \
    --userId 'qnkSIroD' \
    --body '{"entitlementType": "lUSv6nMz", "inventoryConfig": {"slotUsed": 7}, "itemId": "IrZnmSgg", "itemType": "aqQ4TQBX", "items": [{"bundledQty": 77, "entitlementType": "9KLc2Xl4", "inventoryConfig": {"slotUsed": 37}, "itemId": "kI7agfIy", "itemType": "7jySphVr", "sku": "aieTT8KC", "stackable": false, "useCount": 96}, {"bundledQty": 92, "entitlementType": "J2dmKH0F", "inventoryConfig": {"slotUsed": 82}, "itemId": "sYhqazfL", "itemType": "a2fxMFWg", "sku": "UU8dVpNE", "stackable": true, "useCount": 100}, {"bundledQty": 64, "entitlementType": "e2zUD3Zz", "inventoryConfig": {"slotUsed": 18}, "itemId": "6TUe7kZu", "itemType": "PXgQYWA1", "sku": "nH5z2udZ", "stackable": false, "useCount": 99}], "quantity": 11, "sku": "pS7BH33D", "stackable": true, "useCount": 71}' \
    > test.out 2>&1
eval_tap $? 34 'AdminPurchasable' test.out

#- 35 PublicListInventoryConfigurations
./ng net.accelbyte.sdk.cli.Main inventory publicListInventoryConfigurations \
    --namespace "$AB_NAMESPACE" \
    --code 'qiKIRGvA' \
    --limit '90' \
    --offset '95' \
    --sortBy 'code' \
    > test.out 2>&1
eval_tap $? 35 'PublicListInventoryConfigurations' test.out

#- 36 PublicListItemTypes
./ng net.accelbyte.sdk.cli.Main inventory publicListItemTypes \
    --namespace "$AB_NAMESPACE" \
    --limit '14' \
    --offset '76' \
    --sortBy 'name:desc' \
    > test.out 2>&1
eval_tap $? 36 'PublicListItemTypes' test.out

#- 37 PublicListTags
./ng net.accelbyte.sdk.cli.Main inventory publicListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '94' \
    --offset '42' \
    --sortBy 'name:asc' \
    > test.out 2>&1
eval_tap $? 37 'PublicListTags' test.out

#- 38 PublicListInventories
./ng net.accelbyte.sdk.cli.Main inventory publicListInventories \
    --namespace "$AB_NAMESPACE" \
    --inventoryConfigurationCode 'cTe58Eqb' \
    --limit '50' \
    --offset '68' \
    --sortBy 'updatedAt:asc' \
    > test.out 2>&1
eval_tap $? 38 'PublicListInventories' test.out

#- 39 PublicConsumeMyItem
./ng net.accelbyte.sdk.cli.Main inventory publicConsumeMyItem \
    --inventoryId 'dQYSjSyv' \
    --namespace "$AB_NAMESPACE" \
    --body '{"options": ["Z3j63ZHQ", "aqN7kBwE", "vYBYtsza"], "qty": 82, "slotId": "OWG7e5tQ", "sourceItemId": "8ebuQtpS"}' \
    > test.out 2>&1
eval_tap $? 39 'PublicConsumeMyItem' test.out

#- 40 PublicListItems
./ng net.accelbyte.sdk.cli.Main inventory publicListItems \
    --inventoryId 'VOehLt2x' \
    --namespace "$AB_NAMESPACE" \
    --limit '100' \
    --offset '32' \
    --sortBy 'createdAt:desc' \
    --sourceItemId 'SIBfQ10U' \
    --tags 'TsTil6Xn' \
    > test.out 2>&1
eval_tap $? 40 'PublicListItems' test.out

#- 41 PublicBulkUpdateMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicBulkUpdateMyItems \
    --inventoryId 'N1cRPJck' \
    --namespace "$AB_NAMESPACE" \
    --body '[{"customAttributes": {"nwv6GBcF": {}, "RKzf4VT8": {}, "FMLwckBW": {}}, "slotId": "ryQHOamI", "sourceItemId": "bCbinPKn", "tags": ["SYDWOOvw", "lAJdHckI", "DMVplEbm"]}, {"customAttributes": {"Mvbnxol2": {}, "TOxCRo4V": {}, "By0KFUbb": {}}, "slotId": "xvIU4H4N", "sourceItemId": "U2537RiP", "tags": ["vaohe40v", "ggXrKBWv", "RMnqgmdk"]}, {"customAttributes": {"bIOXRl25": {}, "ykQHSI7Q": {}, "xSES69BE": {}}, "slotId": "mq2j0Qaw", "sourceItemId": "I0O01AYR", "tags": ["r9TTo1R6", "MnjpQKwK", "8WHfFkGC"]}]' \
    > test.out 2>&1
eval_tap $? 41 'PublicBulkUpdateMyItems' test.out

#- 42 PublicBulkRemoveMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicBulkRemoveMyItems \
    --inventoryId 'gg5dY5wQ' \
    --namespace "$AB_NAMESPACE" \
    --body '[{"slotId": "SM0KWMwK", "sourceItemId": "z4PJQ1AM"}, {"slotId": "414PGggv", "sourceItemId": "n266t79s"}, {"slotId": "iNKoFwDo", "sourceItemId": "HJbhk2Zz"}]' \
    > test.out 2>&1
eval_tap $? 42 'PublicBulkRemoveMyItems' test.out

#- 43 PublicMoveMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicMoveMyItems \
    --inventoryId 'QSFUMGeP' \
    --namespace "$AB_NAMESPACE" \
    --body '{"items": [{"qty": 89, "slotId": "uf2LSxOj", "sourceItemId": "ZusILwPL"}, {"qty": 17, "slotId": "CCfI5SkM", "sourceItemId": "KANiQ6yH"}, {"qty": 89, "slotId": "QZuVCi0f", "sourceItemId": "K8HygBVS"}], "srcInventoryId": "lSMW2Nzk"}' \
    > test.out 2>&1
eval_tap $? 43 'PublicMoveMyItems' test.out

#- 44 PublicGetItem
./ng net.accelbyte.sdk.cli.Main inventory publicGetItem \
    --inventoryId 'yvapz93H' \
    --namespace "$AB_NAMESPACE" \
    --slotId 'dHrSG8Rw' \
    --sourceItemId 'LYb4wRj0' \
    > test.out 2>&1
eval_tap $? 44 'PublicGetItem' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
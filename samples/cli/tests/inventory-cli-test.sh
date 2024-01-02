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
    --body '{"message": "kp1sdNQ3", "operations": [{"consumeItems": [{"inventoryId": "yqQjzUki", "qty": 51, "slotId": "tu7huLTK", "sourceItemId": "yj62cBaX"}, {"inventoryId": "TpGS1mfP", "qty": 87, "slotId": "NNOTdXO7", "sourceItemId": "lXuzmIUI"}, {"inventoryId": "N0x2joKV", "qty": 46, "slotId": "IRPVJTCk", "sourceItemId": "KnBk7UIr"}], "createItems": [{"customAttributes": {"QN0UTo3O": {}, "tsQtzJbL": {}, "nGbnATNq": {}}, "inventoryConfigurationCode": "nKLvaoeq", "inventoryId": "pMyg8BsE", "qty": 43, "serverCustomAttributes": {"x23zUQE0": {}, "5GKKP6M9": {}, "jDlnQLW3": {}}, "slotId": "Uk3xomYv", "slotUsed": 65, "sourceItemId": "kpHWYTyN", "tags": ["2UnPWudd", "wDmX2Lwp", "rNIfs8Z3"], "toSpecificInventory": false, "type": "Qj0YKnRg"}, {"customAttributes": {"YiQAF0e3": {}, "FaGozEY1": {}, "JcqgP7KW": {}}, "inventoryConfigurationCode": "hLDDr7wB", "inventoryId": "VCOTro6s", "qty": 59, "serverCustomAttributes": {"gJLY6QlP": {}, "CS4VYFqt": {}, "cMEPFiZl": {}}, "slotId": "ht1mvdO5", "slotUsed": 17, "sourceItemId": "gpHeWjNG", "tags": ["DFZvlv02", "TJv7KO7e", "byzs7NOD"], "toSpecificInventory": true, "type": "di1Ucyxn"}, {"customAttributes": {"57J9zl7k": {}, "5PnvWjyG": {}, "BYaDWXhz": {}}, "inventoryConfigurationCode": "6W9rTs1O", "inventoryId": "YtsDsTuY", "qty": 53, "serverCustomAttributes": {"ROtOY51M": {}, "EPnKp10z": {}, "xqf5jtgF": {}}, "slotId": "ta5HKWrR", "slotUsed": 29, "sourceItemId": "zdPcJ6ax", "tags": ["cJJ7pItq", "BFbPSHiW", "EFqZ45zc"], "toSpecificInventory": true, "type": "LJ2TqPl3"}], "removeItems": [{"inventoryId": "NLK5njd9", "slotId": "rbHgRkS1", "sourceItemId": "6qmpkIyZ"}, {"inventoryId": "JQyv6OFk", "slotId": "CbTh6d42", "sourceItemId": "rfXDUUSp"}, {"inventoryId": "NVFRAohw", "slotId": "DDwHYXLW", "sourceItemId": "3cIWiG7Q"}], "targetUserId": "OBb40XRb", "updateItems": [{"customAttributes": {"187psaoM": {}, "UO9BdfVu": {}, "KB7e4POs": {}}, "inventoryId": "E6zhxVeZ", "serverCustomAttributes": {"Kl4MzdR4": {}, "gfay4B0F": {}, "xYlTd3vR": {}}, "slotId": "09SMM4WV", "sourceItemId": "GST6bwfI", "tags": ["3UWE2PgP", "ld0WJ2vL", "w5XYgwpP"], "type": "jAHtm2tN"}, {"customAttributes": {"1EOh7SMi": {}, "KBuNRQee": {}, "o2vBkyFJ": {}}, "inventoryId": "U4ZASK7k", "serverCustomAttributes": {"3wsMDtK5": {}, "TK10PUzQ": {}, "0fbVNUW3": {}}, "slotId": "5rG2NA5y", "sourceItemId": "U0vtpjdA", "tags": ["tzHrgIy3", "FS9mKCst", "xozrk9mn"], "type": "9WjqxuFQ"}, {"customAttributes": {"9oRoz89K": {}, "u0ePPm0a": {}, "xoQp1Ary": {}}, "inventoryId": "3VdOTrgE", "serverCustomAttributes": {"SZL1hpF6": {}, "R4ohkGQF": {}, "hTdf85Tm": {}}, "slotId": "V08LEbUm", "sourceItemId": "LdOleyyg", "tags": ["333PDVXj", "AJb9bBry", "G99CaMd3"], "type": "CxFgICAb"}]}, {"consumeItems": [{"inventoryId": "QP3Hyapm", "qty": 73, "slotId": "LD6ofObL", "sourceItemId": "vqgb6XP3"}, {"inventoryId": "f463D4Ro", "qty": 51, "slotId": "9nwgiTae", "sourceItemId": "j8vvrgRK"}, {"inventoryId": "viyPDZ5J", "qty": 15, "slotId": "0FAVPn2o", "sourceItemId": "dgwqCVIa"}], "createItems": [{"customAttributes": {"QwLl27B1": {}, "KnzSZbQ1": {}, "djdwe1JA": {}}, "inventoryConfigurationCode": "wsX9ap9s", "inventoryId": "Uuv7LW97", "qty": 3, "serverCustomAttributes": {"p51H7A8R": {}, "jxFvqArc": {}, "bzkMJL8l": {}}, "slotId": "5jjDTNL6", "slotUsed": 91, "sourceItemId": "XsXcXGsm", "tags": ["8zlUiHrB", "Uz869GbH", "MKqjKlbT"], "toSpecificInventory": true, "type": "N80DpCfV"}, {"customAttributes": {"YQrSDo4K": {}, "rvCUQOxO": {}, "mDxGg45v": {}}, "inventoryConfigurationCode": "binKPRiE", "inventoryId": "WvM2ypRb", "qty": 33, "serverCustomAttributes": {"l1KUOYP1": {}, "DBdi9WiC": {}, "5pAsy3VY": {}}, "slotId": "990bqSqg", "slotUsed": 70, "sourceItemId": "ovz927Vv", "tags": ["VOlx7Sy6", "ML2w8DEB", "f2BY0noJ"], "toSpecificInventory": false, "type": "7lOU4SGj"}, {"customAttributes": {"KvHw2Rvp": {}, "hTzXJTyj": {}, "qRzLSjPn": {}}, "inventoryConfigurationCode": "aPEdwrs2", "inventoryId": "kDtpcMjP", "qty": 34, "serverCustomAttributes": {"XsWmgia6": {}, "1EhEeC1M": {}, "zwSwtllG": {}}, "slotId": "FYcZLqZB", "slotUsed": 34, "sourceItemId": "Qe2rn4sq", "tags": ["abVYq1fb", "JVILbKc2", "4x9zMOz4"], "toSpecificInventory": true, "type": "YDw5Qvk8"}], "removeItems": [{"inventoryId": "Ax8werrA", "slotId": "HBN3edA8", "sourceItemId": "5zAQYpVx"}, {"inventoryId": "7WsctMaD", "slotId": "PYLE46UP", "sourceItemId": "il8H21vn"}, {"inventoryId": "r8N3lC9C", "slotId": "V9NfpOU8", "sourceItemId": "YNlHLtF5"}], "targetUserId": "ZnjLSEO2", "updateItems": [{"customAttributes": {"cmeyLd3N": {}, "yfYm11jS": {}, "GldhnbMj": {}}, "inventoryId": "8I7j3rk1", "serverCustomAttributes": {"Uw5LecMA": {}, "ap4aqUDy": {}, "3U7p0tGk": {}}, "slotId": "h9Gg9yYz", "sourceItemId": "JP8xMKdF", "tags": ["KKh0WJRr", "zbQWIaBD", "gd75Pwgj"], "type": "BxuSkJCK"}, {"customAttributes": {"l1uFBPUB": {}, "4aQ56gqi": {}, "fm1NuKRy": {}}, "inventoryId": "PkQti4pQ", "serverCustomAttributes": {"ZHFvys44": {}, "AgXkJxXf": {}, "B7DUoJDU": {}}, "slotId": "UssWqa0M", "sourceItemId": "e9dzi6ES", "tags": ["YWF9NIQh", "0bAnLk1M", "v3isrS0J"], "type": "gERqT4Ul"}, {"customAttributes": {"Oi5jd5Q8": {}, "owF844kU": {}, "yvrrPcbF": {}}, "inventoryId": "zjoLc1t4", "serverCustomAttributes": {"47cJwX5K": {}, "eA1ZthxR": {}, "1SW36mBN": {}}, "slotId": "d6OLszOV", "sourceItemId": "mvjwjdQn", "tags": ["qwKH6z7B", "5Huebqba", "EJ63EvxV"], "type": "iGr5Dj0r"}]}, {"consumeItems": [{"inventoryId": "iCobHAqR", "qty": 18, "slotId": "cldfk8rS", "sourceItemId": "63nFKN6t"}, {"inventoryId": "bdUq81u3", "qty": 80, "slotId": "iguSKt6i", "sourceItemId": "PFWcIa8x"}, {"inventoryId": "IVeruCBP", "qty": 46, "slotId": "sySqobRl", "sourceItemId": "Q6DRZgBt"}], "createItems": [{"customAttributes": {"TZ2XD3qP": {}, "tga8wCln": {}, "MuGvRUhU": {}}, "inventoryConfigurationCode": "riozgQIx", "inventoryId": "J8oPJJgd", "qty": 25, "serverCustomAttributes": {"WnIsGyXZ": {}, "sXaDn5Jx": {}, "L6c4YJpg": {}}, "slotId": "en6H0s6q", "slotUsed": 58, "sourceItemId": "bD2AbNbs", "tags": ["DsL7y9ct", "M2ji3PjW", "m6woEqqU"], "toSpecificInventory": false, "type": "EkuhDwnd"}, {"customAttributes": {"v57JrGlc": {}, "tA4XGyGX": {}, "0JEKtsGF": {}}, "inventoryConfigurationCode": "uXhtAzEE", "inventoryId": "yJ16dTJT", "qty": 69, "serverCustomAttributes": {"ZJfbcpkf": {}, "zqcTqqtr": {}, "P5CAabAk": {}}, "slotId": "cRfk5dH3", "slotUsed": 21, "sourceItemId": "JEds89oa", "tags": ["iihKiuhz", "9bAHc25p", "WEZM0GKN"], "toSpecificInventory": false, "type": "JHdv5JFc"}, {"customAttributes": {"UADkxhif": {}, "LyMkPQJN": {}, "kB6j2IKY": {}}, "inventoryConfigurationCode": "glpJ8eVM", "inventoryId": "mvgMcYqW", "qty": 99, "serverCustomAttributes": {"2zS7VUYw": {}, "TOszfl6g": {}, "JkfhYOJS": {}}, "slotId": "QAkWGqiK", "slotUsed": 84, "sourceItemId": "7cBhszeb", "tags": ["i1p8u7Dj", "WAnXZGMf", "k3Z1uB54"], "toSpecificInventory": true, "type": "bwtH6I4n"}], "removeItems": [{"inventoryId": "xTmv923l", "slotId": "YTqa8yZS", "sourceItemId": "62OS2fva"}, {"inventoryId": "Zhq8YhNi", "slotId": "biA9bwFo", "sourceItemId": "bcJAqW7h"}, {"inventoryId": "Eq9JlsvK", "slotId": "QzsumNwk", "sourceItemId": "0eu5ZQbt"}], "targetUserId": "JrBGGq7j", "updateItems": [{"customAttributes": {"pn23u3d2": {}, "rvDCWyAr": {}, "HgyrIaHo": {}}, "inventoryId": "z32mcU04", "serverCustomAttributes": {"NAGvURUp": {}, "bsw0sLnV": {}, "0dNT3oqJ": {}}, "slotId": "Hd0o43YP", "sourceItemId": "5Dh3SNhg", "tags": ["PNosasb4", "eX2EoLFD", "5TxElEQu"], "type": "PHUf1DF5"}, {"customAttributes": {"uLkj10Gq": {}, "0SsLDish": {}, "Na7i6D2I": {}}, "inventoryId": "f7LsKgbP", "serverCustomAttributes": {"Kw2HDd50": {}, "JhXRAvGe": {}, "hTM56OIA": {}}, "slotId": "w7UWAz4y", "sourceItemId": "OaUmoRUi", "tags": ["mi12vbrE", "F7YEp3zH", "Q2QjfhnF"], "type": "UDOODBbO"}, {"customAttributes": {"8uSyi5S0": {}, "WFbZv9br": {}, "2QQQZIAw": {}}, "inventoryId": "36nUNbno", "serverCustomAttributes": {"34pfitmk": {}, "75Vj5F1S": {}, "EJllBGtP": {}}, "slotId": "Oh0ZOTxa", "sourceItemId": "QQ9S6Nep", "tags": ["WdeG1EwL", "EuuWjQGK", "gZ37uf41"], "type": "Me96Yysq"}]}], "requestId": "fgao6lVi"}' \
    > test.out 2>&1
eval_tap $? 2 'AdminCreateChainingOperations' test.out

#- 3 AdminListInventories
./ng net.accelbyte.sdk.cli.Main inventory adminListInventories \
    --namespace "$AB_NAMESPACE" \
    --inventoryConfigurationCode 'yQhLJif5' \
    --limit '53' \
    --offset '84' \
    --sortBy 'updatedAt' \
    --userId 'qOFv57X5' \
    > test.out 2>&1
eval_tap $? 3 'AdminListInventories' test.out

#- 4 AdminCreateInventory
./ng net.accelbyte.sdk.cli.Main inventory adminCreateInventory \
    --namespace "$AB_NAMESPACE" \
    --body '{"inventoryConfigurationCode": "KXRUCWRw", "userId": "5wucaJKD"}' \
    > test.out 2>&1
eval_tap $? 4 'AdminCreateInventory' test.out

#- 5 AdminGetInventory
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventory \
    --inventoryId 'kXzVgcfi' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'AdminGetInventory' test.out

#- 6 AdminUpdateInventory
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateInventory \
    --inventoryId 'rlj2Gxnf' \
    --namespace "$AB_NAMESPACE" \
    --body '{"incMaxSlots": 83}' \
    > test.out 2>&1
eval_tap $? 6 'AdminUpdateInventory' test.out

#- 7 DeleteInventory
./ng net.accelbyte.sdk.cli.Main inventory deleteInventory \
    --inventoryId 'TRYPez3c' \
    --namespace "$AB_NAMESPACE" \
    --body '{"message": "0Y0HDjru"}' \
    > test.out 2>&1
eval_tap $? 7 'DeleteInventory' test.out

#- 8 AdminListItems
./ng net.accelbyte.sdk.cli.Main inventory adminListItems \
    --inventoryId 'afsjnavA' \
    --namespace "$AB_NAMESPACE" \
    --limit '74' \
    --offset '46' \
    --qtyGte '50' \
    --sortBy 'updatedAt:asc' \
    --sourceItemId 'a5KduAR1' \
    --tags 'XBCdX6gX' \
    > test.out 2>&1
eval_tap $? 8 'AdminListItems' test.out

#- 9 AdminGetInventoryItem
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventoryItem \
    --inventoryId 'z8cS9SfR' \
    --namespace "$AB_NAMESPACE" \
    --slotId 'UM4hSXNb' \
    --sourceItemId '0tazK5qg' \
    > test.out 2>&1
eval_tap $? 9 'AdminGetInventoryItem' test.out

#- 10 AdminListInventoryConfigurations
./ng net.accelbyte.sdk.cli.Main inventory adminListInventoryConfigurations \
    --namespace "$AB_NAMESPACE" \
    --code 'bja3q1Pk' \
    --limit '19' \
    --offset '40' \
    --sortBy 'updatedAt:asc' \
    > test.out 2>&1
eval_tap $? 10 'AdminListInventoryConfigurations' test.out

#- 11 AdminCreateInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminCreateInventoryConfiguration \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "g6d7xoC6", "description": "qio65OwN", "initialMaxSlots": 28, "maxInstancesPerUser": 0, "maxUpgradeSlots": 86, "name": "11dySRXP"}' \
    > test.out 2>&1
eval_tap $? 11 'AdminCreateInventoryConfiguration' test.out

#- 12 AdminGetInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventoryConfiguration \
    --inventoryConfigurationId 'F8KpCydc' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'AdminGetInventoryConfiguration' test.out

#- 13 AdminUpdateInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateInventoryConfiguration \
    --inventoryConfigurationId '1SpulsPV' \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "0Q7RwhsO", "description": "DlFzG3GW", "initialMaxSlots": 16, "maxInstancesPerUser": 59, "maxUpgradeSlots": 70, "name": "RO60npjO"}' \
    > test.out 2>&1
eval_tap $? 13 'AdminUpdateInventoryConfiguration' test.out

#- 14 AdminDeleteInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteInventoryConfiguration \
    --inventoryConfigurationId 'lUOPRkAO' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 14 'AdminDeleteInventoryConfiguration' test.out

#- 15 AdminListItemTypes
./ng net.accelbyte.sdk.cli.Main inventory adminListItemTypes \
    --namespace "$AB_NAMESPACE" \
    --limit '9' \
    --offset '17' \
    --sortBy 'name:desc' \
    > test.out 2>&1
eval_tap $? 15 'AdminListItemTypes' test.out

#- 16 AdminCreateItemType
./ng net.accelbyte.sdk.cli.Main inventory adminCreateItemType \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "LofKF2Pl"}' \
    > test.out 2>&1
eval_tap $? 16 'AdminCreateItemType' test.out

#- 17 AdminDeleteItemType
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteItemType \
    --itemTypeName 'uYyCoCEE' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'AdminDeleteItemType' test.out

#- 18 AdminListTags
./ng net.accelbyte.sdk.cli.Main inventory adminListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '3' \
    --offset '95' \
    --owner 'MTr7eP5D' \
    --sortBy 'createdAt' \
    > test.out 2>&1
eval_tap $? 18 'AdminListTags' test.out

#- 19 AdminCreateTag
./ng net.accelbyte.sdk.cli.Main inventory adminCreateTag \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "HjZHNjrt", "owner": "SERVER"}' \
    > test.out 2>&1
eval_tap $? 19 'AdminCreateTag' test.out

#- 20 AdminDeleteTag
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteTag \
    --namespace "$AB_NAMESPACE" \
    --tagName 'rHqoPegw' \
    > test.out 2>&1
eval_tap $? 20 'AdminDeleteTag' test.out

#- 21 AdminConsumeUserItem
./ng net.accelbyte.sdk.cli.Main inventory adminConsumeUserItem \
    --inventoryId 'pdWlzbaD' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Y1JYdX65' \
    --body '{"qty": 25, "slotId": "cVjgknYs", "sourceItemId": "TL5tBKjZ"}' \
    > test.out 2>&1
eval_tap $? 21 'AdminConsumeUserItem' test.out

#- 22 AdminBulkUpdateMyItems
./ng net.accelbyte.sdk.cli.Main inventory adminBulkUpdateMyItems \
    --inventoryId 'dZj2CprL' \
    --namespace "$AB_NAMESPACE" \
    --userId 'e0fA8hsV' \
    --body '[{"customAttributes": {"zpDhRO7x": {}, "NxB62LQi": {}, "NQlruvRL": {}}, "serverCustomAttributes": {"b44eg9CK": {}, "DxRCzNMI": {}, "5s3AL0Fl": {}}, "slotId": "VJvrn0Ap", "sourceItemId": "Z9yNyL6O", "tags": ["HdeUlgrD", "XmSAhQTk", "lO3clP6q"], "type": "drM1dalU"}, {"customAttributes": {"YOZMMZuA": {}, "fNA5IruD": {}, "DuG9hQh4": {}}, "serverCustomAttributes": {"C11ZWjqw": {}, "1aPWv3Si": {}, "DY0w1zXk": {}}, "slotId": "rOamv08e", "sourceItemId": "s4talc6j", "tags": ["7ERp8zQM", "WQu4Lwht", "PFMLIpZ9"], "type": "8S7tq53R"}, {"customAttributes": {"6xITRyEk": {}, "9Ot72H4c": {}, "W1SLQYCW": {}}, "serverCustomAttributes": {"F5MDtm4x": {}, "hZtgTLyW": {}, "dNTvfGXq": {}}, "slotId": "txhWaqZS", "sourceItemId": "lkDQL05N", "tags": ["0F8AL6EN", "HDJkDKQs", "nK0jMsAt"], "type": "QIr3MJAs"}]' \
    > test.out 2>&1
eval_tap $? 22 'AdminBulkUpdateMyItems' test.out

#- 23 AdminSaveItemToInventory
./ng net.accelbyte.sdk.cli.Main inventory adminSaveItemToInventory \
    --inventoryId 'HPVNJGNJ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'RLp6uhAb' \
    --body '{"customAttributes": {"CnNtx8Pw": {}, "TpENUlUf": {}, "ftYO0hzj": {}}, "qty": 26, "serverCustomAttributes": {"Wz282DPQ": {}, "Kn1jNsoB": {}, "nsFQEZOO": {}}, "slotId": "qj8PmfMN", "slotUsed": 89, "sourceItemId": "yCjyy0OU", "tags": ["GMiuMAaS", "0VSHGlTJ", "hnQtfxew"], "type": "oaTKr6lW"}' \
    > test.out 2>&1
eval_tap $? 23 'AdminSaveItemToInventory' test.out

#- 24 AdminBulkRemoveItems
./ng net.accelbyte.sdk.cli.Main inventory adminBulkRemoveItems \
    --inventoryId 'tj9Wqcbp' \
    --namespace "$AB_NAMESPACE" \
    --userId 'jKRPKwNR' \
    --body '[{"slotId": "SnpGJMTZ", "sourceItemId": "Ew1gG1pk"}, {"slotId": "A8rFrHYm", "sourceItemId": "4E8ks9PT"}, {"slotId": "NDMsaYmL", "sourceItemId": "Gr2NMTlQ"}]' \
    > test.out 2>&1
eval_tap $? 24 'AdminBulkRemoveItems' test.out

#- 25 AdminSaveItem
./ng net.accelbyte.sdk.cli.Main inventory adminSaveItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'jEDuU68x' \
    --body '{"customAttributes": {"ezKDGbfB": {}, "LEtA5xCq": {}, "Jt59BKZk": {}}, "inventoryConfigurationCode": "WyEtYZ9U", "qty": 27, "serverCustomAttributes": {"m0YkzTK1": {}, "MI9AAeHi": {}, "0wjHsIDX": {}}, "slotId": "k86SxfHe", "slotUsed": 2, "sourceItemId": "YwEwWJ6z", "tags": ["V7cyqiAi", "WRTDeNzl", "sXhkVqDx"], "type": "O95dzFIi"}' \
    > test.out 2>&1
eval_tap $? 25 'AdminSaveItem' test.out

#- 26 PublicListInventoryConfigurations
./ng net.accelbyte.sdk.cli.Main inventory publicListInventoryConfigurations \
    --namespace "$AB_NAMESPACE" \
    --code 'qaidZSV6' \
    --limit '14' \
    --offset '62' \
    --sortBy 'code:asc' \
    > test.out 2>&1
eval_tap $? 26 'PublicListInventoryConfigurations' test.out

#- 27 PublicListItemTypes
./ng net.accelbyte.sdk.cli.Main inventory publicListItemTypes \
    --namespace "$AB_NAMESPACE" \
    --limit '83' \
    --offset '40' \
    --sortBy 'createdAt' \
    > test.out 2>&1
eval_tap $? 27 'PublicListItemTypes' test.out

#- 28 PublicListTags
./ng net.accelbyte.sdk.cli.Main inventory publicListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '22' \
    --offset '64' \
    --sortBy 'name:desc' \
    > test.out 2>&1
eval_tap $? 28 'PublicListTags' test.out

#- 29 PublicListInventories
./ng net.accelbyte.sdk.cli.Main inventory publicListInventories \
    --namespace "$AB_NAMESPACE" \
    --inventoryConfigurationCode 'PVQcYW4V' \
    --limit '28' \
    --offset '81' \
    --sortBy 'updatedAt' \
    > test.out 2>&1
eval_tap $? 29 'PublicListInventories' test.out

#- 30 PublicConsumeMyItem
./ng net.accelbyte.sdk.cli.Main inventory publicConsumeMyItem \
    --inventoryId '4Fb1IE4o' \
    --namespace "$AB_NAMESPACE" \
    --body '{"qty": 70, "slotId": "0JWQf4TZ", "sourceItemId": "86GnonGD"}' \
    > test.out 2>&1
eval_tap $? 30 'PublicConsumeMyItem' test.out

#- 31 PublicListItems
./ng net.accelbyte.sdk.cli.Main inventory publicListItems \
    --inventoryId '2ocqe0BV' \
    --namespace "$AB_NAMESPACE" \
    --limit '39' \
    --offset '37' \
    --qtyGte '57' \
    --sortBy 'createdAt:desc' \
    --sourceItemId 'WFvHGPCw' \
    --tags 'jcaPk1j0' \
    > test.out 2>&1
eval_tap $? 31 'PublicListItems' test.out

#- 32 PublicBulkUpdateMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicBulkUpdateMyItems \
    --inventoryId 'OJOE5lDA' \
    --namespace "$AB_NAMESPACE" \
    --body '[{"customAttributes": {"2fI5LkBu": {}, "wQA5YH3h": {}, "F08oQ2Jv": {}}, "slotId": "mHSRuSFC", "sourceItemId": "wc02gG5J", "tags": ["54m3f7fO", "gfuYq5jH", "JmJ8W1Pb"]}, {"customAttributes": {"WD9LWmuq": {}, "cgZ2IOQy": {}, "IESOx9ir": {}}, "slotId": "2W2rWB2J", "sourceItemId": "2hvWcNXY", "tags": ["KrptjeUj", "oUOPaWex", "HFBSrPHh"]}, {"customAttributes": {"jN1IRDWD": {}, "nEsnl0Lu": {}, "xobwGlEs": {}}, "slotId": "XCdwvcnu", "sourceItemId": "eiA0Pw09", "tags": ["xDk5pmdn", "YdJ4SeMG", "iq73Q3RO"]}]' \
    > test.out 2>&1
eval_tap $? 32 'PublicBulkUpdateMyItems' test.out

#- 33 PublicBulkRemoveMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicBulkRemoveMyItems \
    --inventoryId 'Tn45BkQR' \
    --namespace "$AB_NAMESPACE" \
    --body '[{"slotId": "gcGZMAIp", "sourceItemId": "VOCJbzLx"}, {"slotId": "5UXZuCN2", "sourceItemId": "K45oQLoC"}, {"slotId": "6w9y14Mf", "sourceItemId": "jUWXIL5L"}]' \
    > test.out 2>&1
eval_tap $? 33 'PublicBulkRemoveMyItems' test.out

#- 34 PublicMoveMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicMoveMyItems \
    --inventoryId 'qCLT4zuH' \
    --namespace "$AB_NAMESPACE" \
    --body '{"items": [{"qty": 73, "slotId": "eQ706RR0", "sourceItemId": "AicCn2Cb"}, {"qty": 58, "slotId": "XCQuxcMc", "sourceItemId": "i4X6ntZU"}, {"qty": 22, "slotId": "MFB7bjGR", "sourceItemId": "zlXpJUmC"}], "srcInventoryId": "CUA4svMR"}' \
    > test.out 2>&1
eval_tap $? 34 'PublicMoveMyItems' test.out

#- 35 PublicGetItem
./ng net.accelbyte.sdk.cli.Main inventory publicGetItem \
    --inventoryId 'kn1rZ9Mv' \
    --namespace "$AB_NAMESPACE" \
    --slotId 'evUTKMKx' \
    --sourceItemId 'LvZ8f9t1' \
    > test.out 2>&1
eval_tap $? 35 'PublicGetItem' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
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
    --body '{"message": "A1o9HMw7", "operations": [{"consumeItems": [{"dateRangeValidation": true, "inventoryId": "uR986s3s", "options": ["namVvwmo", "N5rDso8L", "xG7VAew6"], "qty": 15, "slotId": "sVNrPRXC", "sourceItemId": "IbYSkYwj"}, {"dateRangeValidation": true, "inventoryId": "mS231300", "options": ["aakv9MMw", "8XvNAzrv", "dUWGLvmg"], "qty": 99, "slotId": "maAEbIP0", "sourceItemId": "Hs2azrGD"}, {"dateRangeValidation": true, "inventoryId": "DpVv5bOq", "options": ["hmRygAEC", "gkS8xpBX", "2aYJS2aP"], "qty": 83, "slotId": "By705Ws9", "sourceItemId": "FQbohwk2"}], "createItems": [{"customAttributes": {"1lT1uuY7": {}, "3QkN08jc": {}, "Tv6J6qoX": {}}, "inventoryConfigurationCode": "xHJT6yWH", "inventoryId": "CTB2FiV2", "qty": 51, "serverCustomAttributes": {"m8E6dDaf": {}, "2ZIdotF3": {}, "eKwIRNpy": {}}, "slotId": "qie2vGYt", "slotUsed": 61, "source": "OTHER", "sourceItemId": "v7b59cpG", "tags": ["0YNwjroL", "ZUmnT2sT", "ZzwGbpcE"], "toSpecificInventory": true, "type": "Lw2amrU8"}, {"customAttributes": {"efzA8egb": {}, "eoI28uhJ": {}, "vq0AnHfM": {}}, "inventoryConfigurationCode": "cM3ISvEB", "inventoryId": "jhlhKtel", "qty": 90, "serverCustomAttributes": {"bl4fFtPC": {}, "acpfO7jc": {}, "hXkR1wLh": {}}, "slotId": "NJ5BcxeZ", "slotUsed": 77, "source": "ECOMMERCE", "sourceItemId": "9xxlWJ3y", "tags": ["47h9J8Rg", "2bdaoH3e", "Q12zwZSi"], "toSpecificInventory": false, "type": "2amicrt7"}, {"customAttributes": {"c4FDLYcU": {}, "55len83e": {}, "UB0wEfpC": {}}, "inventoryConfigurationCode": "TtFVJR3J", "inventoryId": "HAgay9A4", "qty": 50, "serverCustomAttributes": {"OPTYAmKT": {}, "ggNKtHZf": {}, "VgTOzo4Z": {}}, "slotId": "W8bWmzQf", "slotUsed": 58, "source": "ECOMMERCE", "sourceItemId": "SebheLdV", "tags": ["V6tNhtZ1", "RBL59sU4", "ip0odFB2"], "toSpecificInventory": false, "type": "egnaaoE5"}], "removeItems": [{"inventoryId": "7HV9CgzP", "slotId": "3601Mv2i", "sourceItemId": "QnyylgnH"}, {"inventoryId": "DSYIrEqr", "slotId": "XO5nt0GZ", "sourceItemId": "Ue7Mcqmy"}, {"inventoryId": "494dIMK7", "slotId": "0n6e2ZwE", "sourceItemId": "jRkHUONv"}], "targetUserId": "rxfVIEYg", "updateItems": [{"customAttributes": {"u9wigut0": {}, "sEQwfLce": {}, "s1MLyBCJ": {}}, "inventoryId": "wQhccl5x", "serverCustomAttributes": {"BtxplRPW": {}, "LXYF6xbd": {}, "vGlOHThw": {}}, "slotId": "SVarxjIx", "sourceItemId": "4vaTOPqt", "tags": ["PWg7K2lv", "9BfBDJRP", "8DJBar9V"], "type": "ZW8vus3O"}, {"customAttributes": {"Sml2CuAL": {}, "NMMBl37O": {}, "M1DuXMma": {}}, "inventoryId": "PIOpEfBj", "serverCustomAttributes": {"PecqPgxL": {}, "o384nxAu": {}, "RfVzVEno": {}}, "slotId": "boCEhIMG", "sourceItemId": "zEmIihUl", "tags": ["Sj0Yytbv", "uIP3sc3N", "SDZ9d7E2"], "type": "Y51DvaKC"}, {"customAttributes": {"zS2kzrEX": {}, "WXh8Mtts": {}, "GoyvqE7p": {}}, "inventoryId": "skWomwE0", "serverCustomAttributes": {"8hjCVOky": {}, "HCRdACam": {}, "Uc9asjOZ": {}}, "slotId": "RjHZbFHu", "sourceItemId": "54HtsBKn", "tags": ["uyvzYHaU", "9XeuDjsr", "uvBiAYbs"], "type": "JSACy8EP"}]}, {"consumeItems": [{"dateRangeValidation": false, "inventoryId": "SzD6VoBG", "options": ["LaIk9tuL", "XzBh9P8e", "MdXCsTwC"], "qty": 64, "slotId": "9t9jg9LY", "sourceItemId": "wBERhed4"}, {"dateRangeValidation": false, "inventoryId": "16SlkYyh", "options": ["j0qXKFmb", "J1goRZuk", "td5qjgp2"], "qty": 81, "slotId": "92PtZImI", "sourceItemId": "eya207OT"}, {"dateRangeValidation": false, "inventoryId": "MafMiDsL", "options": ["KHrV6ZZB", "YuL2df47", "hWwG2do9"], "qty": 49, "slotId": "7KD8Ohzo", "sourceItemId": "ZdzNgDWh"}], "createItems": [{"customAttributes": {"zoB9oBgu": {}, "UeBbMey3": {}, "bmrJhgW4": {}}, "inventoryConfigurationCode": "wok1GFFC", "inventoryId": "Gb36uXy8", "qty": 10, "serverCustomAttributes": {"YcTqTZ7J": {}, "p1TOv1hb": {}, "MxlbtQBq": {}}, "slotId": "n7J33eIm", "slotUsed": 75, "source": "ECOMMERCE", "sourceItemId": "2L5dObhU", "tags": ["LbU881Vp", "jjD82fZF", "kyX2S3ok"], "toSpecificInventory": false, "type": "buRd7V3k"}, {"customAttributes": {"00xyDXGD": {}, "EeI4Uotk": {}, "2Wj09Zku": {}}, "inventoryConfigurationCode": "5dvonuro", "inventoryId": "3S30rzUD", "qty": 12, "serverCustomAttributes": {"Wizbd9ID": {}, "MZrgro0p": {}, "628GGnZm": {}}, "slotId": "FKoB0z5N", "slotUsed": 68, "source": "ECOMMERCE", "sourceItemId": "cDRnA1L7", "tags": ["NwFDUBFs", "2eSz7yU0", "bsSa2CZ6"], "toSpecificInventory": true, "type": "nimTBkLd"}, {"customAttributes": {"e0SquyEC": {}, "LETqM0Aa": {}, "4C9S3BqB": {}}, "inventoryConfigurationCode": "En8dBtIz", "inventoryId": "C2u4p0Kr", "qty": 81, "serverCustomAttributes": {"l2qvlBnA": {}, "LwjQjlY3": {}, "2IMB5AUi": {}}, "slotId": "cPctleCg", "slotUsed": 42, "source": "ECOMMERCE", "sourceItemId": "87FPQ0Jr", "tags": ["IY6M4lhV", "8HVa1N0a", "EMcPqeUv"], "toSpecificInventory": false, "type": "KZ2lipoh"}], "removeItems": [{"inventoryId": "la5l7mtJ", "slotId": "N8CsphN2", "sourceItemId": "OX0b7WMb"}, {"inventoryId": "vHtqXD0G", "slotId": "vqDQXhJN", "sourceItemId": "kqlF97ND"}, {"inventoryId": "dM6CPZ37", "slotId": "IQtyICdt", "sourceItemId": "ijdhiJVV"}], "targetUserId": "N3TTN5l1", "updateItems": [{"customAttributes": {"UdIkzTuP": {}, "rcaYslxY": {}, "B7fkjtxb": {}}, "inventoryId": "Q1wnSu2P", "serverCustomAttributes": {"xcDRXM5t": {}, "51TQg5l4": {}, "F5moDB0q": {}}, "slotId": "sEofJgoM", "sourceItemId": "ULpghl02", "tags": ["OPlsnctw", "FpvklVoi", "0y5Z63TA"], "type": "HdKelS80"}, {"customAttributes": {"mOlOixp7": {}, "CJ26cVA5": {}, "Ga62aYes": {}}, "inventoryId": "XsGE31N7", "serverCustomAttributes": {"Ay5kL23R": {}, "OTE2qQQS": {}, "6yBdbysC": {}}, "slotId": "VffLgLRL", "sourceItemId": "cHyU60yw", "tags": ["am0BI3ma", "4Z2Gfsys", "ATNjZcVn"], "type": "49r7HzHD"}, {"customAttributes": {"vGVCewAF": {}, "YlaW2cb5": {}, "3il9ooCR": {}}, "inventoryId": "PNkw2pZp", "serverCustomAttributes": {"uZycV6sw": {}, "J1idX242": {}, "QZ6YqK3e": {}}, "slotId": "yKOxszv0", "sourceItemId": "mTia3jb9", "tags": ["o31shL82", "wiebJF4C", "F9ciZ5LN"], "type": "DLD1Lctv"}]}, {"consumeItems": [{"dateRangeValidation": false, "inventoryId": "M7v1xJsv", "options": ["ToYD0ugv", "VcoQEGmG", "sEMsw8oh"], "qty": 66, "slotId": "xyrWR391", "sourceItemId": "ni3Hc0xU"}, {"dateRangeValidation": true, "inventoryId": "ecASM23X", "options": ["LZqlu1Ch", "z1bAbQxb", "jgsSC7IG"], "qty": 7, "slotId": "5i3miedn", "sourceItemId": "SC5nmIbb"}, {"dateRangeValidation": true, "inventoryId": "NTtzds1g", "options": ["4BTJRKoj", "2aeLSbD5", "S6mfz1MM"], "qty": 8, "slotId": "6Vpe54B0", "sourceItemId": "9wERkcht"}], "createItems": [{"customAttributes": {"gwQIsRDi": {}, "UGAk78DP": {}, "tDTuocZE": {}}, "inventoryConfigurationCode": "d1B8KINO", "inventoryId": "lqSuIBuO", "qty": 47, "serverCustomAttributes": {"iSOMmIZZ": {}, "JsrE6PM8": {}, "CGqxOosX": {}}, "slotId": "Ljdlhcew", "slotUsed": 95, "source": "ECOMMERCE", "sourceItemId": "RWptde7H", "tags": ["IG2JDpkf", "7CEkB3Kq", "TA9P1roL"], "toSpecificInventory": true, "type": "NsyYG9I3"}, {"customAttributes": {"gUaVHale": {}, "0FmkGZqY": {}, "mefyFfP4": {}}, "inventoryConfigurationCode": "1mW6LMTW", "inventoryId": "pOI5xM4m", "qty": 98, "serverCustomAttributes": {"C9yqYoXx": {}, "BkG3aBwN": {}, "dLJREDO0": {}}, "slotId": "9pcn7fMI", "slotUsed": 89, "source": "OTHER", "sourceItemId": "a0fTdGgw", "tags": ["MGEMqUTU", "RMguMMcT", "TJGr39z0"], "toSpecificInventory": false, "type": "21Niq2DP"}, {"customAttributes": {"skbpve2b": {}, "TFWzH18j": {}, "8ggRPi9A": {}}, "inventoryConfigurationCode": "CQbqycV9", "inventoryId": "017yyTzS", "qty": 5, "serverCustomAttributes": {"bqEZX1si": {}, "3vW3ntQ7": {}, "aW1CiQBK": {}}, "slotId": "R4rJJ6uH", "slotUsed": 18, "source": "OTHER", "sourceItemId": "2vGnK6rI", "tags": ["JOzcaKK4", "9ZDiKbKK", "GtaIC7Qy"], "toSpecificInventory": true, "type": "ehr80Ivu"}], "removeItems": [{"inventoryId": "lQcZiMKw", "slotId": "iZfDWtBA", "sourceItemId": "UEaR5DdD"}, {"inventoryId": "CVNqpKEe", "slotId": "GzeP5b4A", "sourceItemId": "JIQK97ww"}, {"inventoryId": "Q808LJRp", "slotId": "OKg4LVas", "sourceItemId": "KHyfJ3Bo"}], "targetUserId": "SXc0SMXO", "updateItems": [{"customAttributes": {"p3HKn5r6": {}, "nBotpdG2": {}, "5StCnQ2t": {}}, "inventoryId": "T8GCPurE", "serverCustomAttributes": {"cKZnSAW5": {}, "ROrwtPRg": {}, "z0ozNyki": {}}, "slotId": "vxEPVOpX", "sourceItemId": "MXZsM74T", "tags": ["ASxQJ4cC", "bGHtJ7WK", "UKkF1nOt"], "type": "LljOqPlP"}, {"customAttributes": {"RLS71BvZ": {}, "4KGpvfFR": {}, "7oqiho8K": {}}, "inventoryId": "SgulDdlX", "serverCustomAttributes": {"dRrMmECV": {}, "pB7A1F9O": {}, "lEKrdxZK": {}}, "slotId": "N32k9Y2A", "sourceItemId": "2zAALSCu", "tags": ["cvKKdCeB", "h7y3GBh7", "W4Sbc3eG"], "type": "VxVSLIoM"}, {"customAttributes": {"YAP36pwR": {}, "Yj9NR2Fv": {}, "qbqUWBvX": {}}, "inventoryId": "U4jBzny6", "serverCustomAttributes": {"hbPCtO5C": {}, "TfCvx8cY": {}, "W1twmRGX": {}}, "slotId": "nOPlJKrn", "sourceItemId": "UHHKwui1", "tags": ["13F06Zck", "bC83Gfrm", "60lmmVGv"], "type": "nGBP9pCQ"}]}], "requestId": "MXRsr28w"}' \
    > test.out 2>&1
eval_tap $? 2 'AdminCreateChainingOperations' test.out

#- 3 AdminListIntegrationConfigurations
./ng net.accelbyte.sdk.cli.Main inventory adminListIntegrationConfigurations \
    --namespace "$AB_NAMESPACE" \
    --limit '19' \
    --offset '7' \
    --sortBy 'createdAt:desc' \
    > test.out 2>&1
eval_tap $? 3 'AdminListIntegrationConfigurations' test.out

#- 4 AdminCreateIntegrationConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminCreateIntegrationConfiguration \
    --namespace "$AB_NAMESPACE" \
    --body '{"mapItemType": ["tZXXFxxT", "yPViimfX", "emMkH6Po"], "serviceName": "b0wqxHea", "targetInventoryCode": "QZPrbPzw"}' \
    > test.out 2>&1
eval_tap $? 4 'AdminCreateIntegrationConfiguration' test.out

#- 5 AdminUpdateIntegrationConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateIntegrationConfiguration \
    --integrationConfigurationId 'tFw6Lq9G' \
    --namespace "$AB_NAMESPACE" \
    --body '{"mapItemType": ["VcMrizey", "ehV0ZvL0", "AgIOZAo7"], "serviceName": "QogYDT1S", "targetInventoryCode": "s4lsCpy2"}' \
    > test.out 2>&1
eval_tap $? 5 'AdminUpdateIntegrationConfiguration' test.out

#- 6 AdminUpdateStatusIntegrationConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateStatusIntegrationConfiguration \
    --integrationConfigurationId '3FugoTno' \
    --namespace "$AB_NAMESPACE" \
    --body '{"status": "TIED"}' \
    > test.out 2>&1
eval_tap $? 6 'AdminUpdateStatusIntegrationConfiguration' test.out

#- 7 AdminListInventories
./ng net.accelbyte.sdk.cli.Main inventory adminListInventories \
    --namespace "$AB_NAMESPACE" \
    --inventoryConfigurationCode '5RDIlflh' \
    --limit '90' \
    --offset '76' \
    --sortBy 'createdAt:desc' \
    --userId 'tZ8NrTyG' \
    > test.out 2>&1
eval_tap $? 7 'AdminListInventories' test.out

#- 8 AdminCreateInventory
./ng net.accelbyte.sdk.cli.Main inventory adminCreateInventory \
    --namespace "$AB_NAMESPACE" \
    --body '{"inventoryConfigurationCode": "qby74rX5", "userId": "bDbu30cj"}' \
    > test.out 2>&1
eval_tap $? 8 'AdminCreateInventory' test.out

#- 9 AdminGetInventory
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventory \
    --inventoryId '9LvS9O2s' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'AdminGetInventory' test.out

#- 10 AdminUpdateInventory
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateInventory \
    --inventoryId 'mSgbHRzw' \
    --namespace "$AB_NAMESPACE" \
    --body '{"incMaxSlots": 52}' \
    > test.out 2>&1
eval_tap $? 10 'AdminUpdateInventory' test.out

#- 11 DeleteInventory
./ng net.accelbyte.sdk.cli.Main inventory deleteInventory \
    --inventoryId 'Fkw5fcuC' \
    --namespace "$AB_NAMESPACE" \
    --body '{"message": "Rsbuwyjz"}' \
    > test.out 2>&1
eval_tap $? 11 'DeleteInventory' test.out

#- 12 AdminListItems
./ng net.accelbyte.sdk.cli.Main inventory adminListItems \
    --inventoryId 'Fu1XpDNm' \
    --namespace "$AB_NAMESPACE" \
    --limit '37' \
    --offset '16' \
    --sortBy 'updatedAt:asc' \
    --sourceItemId 'YeOA0O14' \
    --tags 'ZBsZrCnt' \
    > test.out 2>&1
eval_tap $? 12 'AdminListItems' test.out

#- 13 AdminGetInventoryItem
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventoryItem \
    --inventoryId 'onqqSRDP' \
    --namespace "$AB_NAMESPACE" \
    --slotId 'ZGgVuiRc' \
    --sourceItemId 'iLsyhBFL' \
    > test.out 2>&1
eval_tap $? 13 'AdminGetInventoryItem' test.out

#- 14 AdminListInventoryConfigurations
./ng net.accelbyte.sdk.cli.Main inventory adminListInventoryConfigurations \
    --namespace "$AB_NAMESPACE" \
    --code '13uRob4u' \
    --limit '56' \
    --offset '30' \
    --sortBy 'createdAt' \
    > test.out 2>&1
eval_tap $? 14 'AdminListInventoryConfigurations' test.out

#- 15 AdminCreateInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminCreateInventoryConfiguration \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "uU0slHcm", "description": "qqILw8nN", "initialMaxSlots": 10, "maxInstancesPerUser": 9, "maxUpgradeSlots": 78, "name": "GOsu1cYQ"}' \
    > test.out 2>&1
eval_tap $? 15 'AdminCreateInventoryConfiguration' test.out

#- 16 AdminGetInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventoryConfiguration \
    --inventoryConfigurationId 'eQqjaPXb' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'AdminGetInventoryConfiguration' test.out

#- 17 AdminUpdateInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateInventoryConfiguration \
    --inventoryConfigurationId 'BHq0R2ZT' \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "Sh8O36ec", "description": "MlGUVJmU", "initialMaxSlots": 98, "maxInstancesPerUser": 5, "maxUpgradeSlots": 48, "name": "idgRTAJP"}' \
    > test.out 2>&1
eval_tap $? 17 'AdminUpdateInventoryConfiguration' test.out

#- 18 AdminDeleteInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteInventoryConfiguration \
    --inventoryConfigurationId '8hXcZy3R' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminDeleteInventoryConfiguration' test.out

#- 19 AdminListItemTypes
./ng net.accelbyte.sdk.cli.Main inventory adminListItemTypes \
    --namespace "$AB_NAMESPACE" \
    --limit '90' \
    --offset '94' \
    --sortBy 'createdAt:asc' \
    > test.out 2>&1
eval_tap $? 19 'AdminListItemTypes' test.out

#- 20 AdminCreateItemType
./ng net.accelbyte.sdk.cli.Main inventory adminCreateItemType \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "GBDNmS96"}' \
    > test.out 2>&1
eval_tap $? 20 'AdminCreateItemType' test.out

#- 21 AdminDeleteItemType
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteItemType \
    --itemTypeName 'gUnO7yGR' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'AdminDeleteItemType' test.out

#- 22 AdminListTags
./ng net.accelbyte.sdk.cli.Main inventory adminListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '39' \
    --offset '95' \
    --owner 'ViiQXAZ4' \
    --sortBy 'name' \
    > test.out 2>&1
eval_tap $? 22 'AdminListTags' test.out

#- 23 AdminCreateTag
./ng net.accelbyte.sdk.cli.Main inventory adminCreateTag \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "N2gQceWv", "owner": "CLIENT"}' \
    > test.out 2>&1
eval_tap $? 23 'AdminCreateTag' test.out

#- 24 AdminDeleteTag
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteTag \
    --namespace "$AB_NAMESPACE" \
    --tagName 'FE87cmpn' \
    > test.out 2>&1
eval_tap $? 24 'AdminDeleteTag' test.out

#- 25 AdminConsumeUserItem
./ng net.accelbyte.sdk.cli.Main inventory adminConsumeUserItem \
    --inventoryId 'cZuOxy6C' \
    --namespace "$AB_NAMESPACE" \
    --userId 'EfOZevAA' \
    --dateRangeValidation 'tt2g2xcW' \
    --body '{"options": ["qObEH6yh", "rz77M3Xd", "iDqFTMQH"], "qty": 77, "slotId": "iCLLPr0u", "sourceItemId": "1Lthmxu7"}' \
    > test.out 2>&1
eval_tap $? 25 'AdminConsumeUserItem' test.out

#- 26 AdminBulkUpdateMyItems
./ng net.accelbyte.sdk.cli.Main inventory adminBulkUpdateMyItems \
    --inventoryId 'cdp0vDlN' \
    --namespace "$AB_NAMESPACE" \
    --userId 'hWIs3kre' \
    --body '[{"customAttributes": {"y2JB9B3L": {}, "2Rvgyx2Q": {}, "d60yuxNi": {}}, "serverCustomAttributes": {"OAth1tIe": {}, "eLNn0HF8": {}, "jyfLcv7A": {}}, "slotId": "jML1MGlG", "sourceItemId": "CaLbU5Sl", "tags": ["fXKEF4vx", "7BdXgEu0", "SvblBt1W"], "type": "yMaP8fHN"}, {"customAttributes": {"9tgsPVIk": {}, "GSJKXGCJ": {}, "YpvUZpmE": {}}, "serverCustomAttributes": {"RkTsloE2": {}, "S2Forr0x": {}, "ojJOVJ96": {}}, "slotId": "pMrM42yW", "sourceItemId": "1bu9yE9M", "tags": ["MeNFoKs7", "HkuVzHfj", "vGRfWjnz"], "type": "rjj3rvhe"}, {"customAttributes": {"Yz1LUvgX": {}, "uZgJsAVi": {}, "SU46sEZb": {}}, "serverCustomAttributes": {"uPtKbFZx": {}, "6ntBCsKc": {}, "3LujP4xS": {}}, "slotId": "B8OIAYki", "sourceItemId": "Hru2ztRV", "tags": ["Qq3CCEwK", "n9Dn0ifc", "CJLPydhe"], "type": "qxyEOxGL"}]' \
    > test.out 2>&1
eval_tap $? 26 'AdminBulkUpdateMyItems' test.out

#- 27 AdminSaveItemToInventory
./ng net.accelbyte.sdk.cli.Main inventory adminSaveItemToInventory \
    --inventoryId 'wobhcYuP' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Xm16yFvN' \
    --body '{"customAttributes": {"5NuPO0ic": {}, "F2lj5CP9": {}, "aGmfacsm": {}}, "qty": 81, "serverCustomAttributes": {"UCknDySj": {}, "kbn4Bwqd": {}, "5ifdQ0Os": {}}, "slotId": "3ENbvywe", "slotUsed": 17, "source": "OTHER", "sourceItemId": "CLqcsLOL", "tags": ["Zn96kkKg", "z77ZZonQ", "TUNOV4p6"], "type": "LoapLxfV"}' \
    > test.out 2>&1
eval_tap $? 27 'AdminSaveItemToInventory' test.out

#- 28 AdminBulkRemoveItems
./ng net.accelbyte.sdk.cli.Main inventory adminBulkRemoveItems \
    --inventoryId 'VBIjKWB9' \
    --namespace "$AB_NAMESPACE" \
    --userId 'sf9CXG5h' \
    --body '[{"slotId": "FHAmD6nC", "sourceItemId": "YIjMNs6w"}, {"slotId": "BKOA5riO", "sourceItemId": "lYKhRoxq"}, {"slotId": "OHOiOsRd", "sourceItemId": "ydd4U8ie"}]' \
    > test.out 2>&1
eval_tap $? 28 'AdminBulkRemoveItems' test.out

#- 29 AdminBulkSaveItemToInventory
./ng net.accelbyte.sdk.cli.Main inventory adminBulkSaveItemToInventory \
    --inventoryId 'QTHVTCNZ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'UkHxUjA9' \
    --body '[{"customAttributes": {"0ZZMCN2h": {}, "UTpyN43O": {}, "1Y1DdFaz": {}}, "qty": 74, "serverCustomAttributes": {"xp676Hr9": {}, "9DF5GL9u": {}, "ah7STxKT": {}}, "slotId": "GeUNZUFa", "slotUsed": 13, "source": "OTHER", "sourceItemId": "EQ4rKgcl", "tags": ["gkiipwC5", "6BXPoo5U", "mrrQwpl3"], "type": "caMBFlrm"}, {"customAttributes": {"hqBVjprE": {}, "MhFtHX0K": {}, "wzsslNEk": {}}, "qty": 53, "serverCustomAttributes": {"cIqjLkJU": {}, "vw9hivIH": {}, "mULlk0Hs": {}}, "slotId": "YIAxRKuo", "slotUsed": 36, "source": "OTHER", "sourceItemId": "7HTIEmvW", "tags": ["f9EMunnC", "2FxSx6uV", "2ofCakAt"], "type": "AQBM9yGP"}, {"customAttributes": {"UiTYrvby": {}, "B3IyPbx2": {}, "2QIROG2N": {}}, "qty": 4, "serverCustomAttributes": {"zMUz9EoH": {}, "miozxD27": {}, "wLdDUPPJ": {}}, "slotId": "L34GarQj", "slotUsed": 86, "source": "ECOMMERCE", "sourceItemId": "O8gvKlJM", "tags": ["WtxRvwMu", "n1oVrLsI", "4sS6uUiK"], "type": "kuONS6Xw"}]' \
    > test.out 2>&1
eval_tap $? 29 'AdminBulkSaveItemToInventory' test.out

#- 30 AdminUpdateUserInventoriesByInventoryCode
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateUserInventoriesByInventoryCode \
    --inventoryConfigurationCode 'bx45grOp' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Oeivk6Q0' \
    --body '{"incMaxSlots": 83}' \
    > test.out 2>&1
eval_tap $? 30 'AdminUpdateUserInventoriesByInventoryCode' test.out

#- 31 AdminSaveItem
./ng net.accelbyte.sdk.cli.Main inventory adminSaveItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'hVzKgBhO' \
    --body '{"customAttributes": {"a3RjhLUq": {}, "DFINkQ6S": {}, "ScnalHse": {}}, "inventoryConfigurationCode": "eTMyYsHN", "qty": 86, "serverCustomAttributes": {"1EguKah6": {}, "bMQEB5PT": {}, "V2pFGsD2": {}}, "slotId": "WhYxlBpJ", "slotUsed": 92, "source": "OTHER", "sourceItemId": "VRF168lL", "tags": ["VHqoos5F", "4isGkKVE", "Ooa0Wt5T"], "type": "Tojqkaaq"}' \
    > test.out 2>&1
eval_tap $? 31 'AdminSaveItem' test.out

#- 32 AdminBulkSaveItem
./ng net.accelbyte.sdk.cli.Main inventory adminBulkSaveItem \
    --namespace "$AB_NAMESPACE" \
    --userId '1LF31Uiz' \
    --body '[{"customAttributes": {"5wdXrFOn": {}, "615J6Lcl": {}, "L0HcXA0Y": {}}, "inventoryConfigurationCode": "OTpy943C", "qty": 71, "serverCustomAttributes": {"hV2HDRzd": {}, "sO4da299": {}, "SDdQe8aU": {}}, "slotId": "lnHG1qgH", "slotUsed": 100, "source": "OTHER", "sourceItemId": "bPJlIICN", "tags": ["AGwJNEtl", "gfU8jyLx", "6C4TthzW"], "type": "hrqhdX3U"}, {"customAttributes": {"LDdqQY76": {}, "pIVKz5tk": {}, "Dozhtvjd": {}}, "inventoryConfigurationCode": "9lsqO11n", "qty": 22, "serverCustomAttributes": {"ZQmpjy3C": {}, "K5ZH8czj": {}, "6Ekn5lhN": {}}, "slotId": "VwZ02IEh", "slotUsed": 12, "source": "OTHER", "sourceItemId": "TSLnX505", "tags": ["FHhVuNEE", "8eyclPLN", "oOrZgimc"], "type": "Fta4KQ1V"}, {"customAttributes": {"b8Dqi0Da": {}, "1YMmh6Ck": {}, "XHua9enB": {}}, "inventoryConfigurationCode": "04lRX02x", "qty": 81, "serverCustomAttributes": {"XEKqncsJ": {}, "0fLjBEif": {}, "uQjF2BSI": {}}, "slotId": "rIoMIB9l", "slotUsed": 89, "source": "OTHER", "sourceItemId": "eXB51Ejt", "tags": ["pHBPjKvO", "b8ULfECT", "qHv4gnbM"], "type": "vMIqrRST"}]' \
    > test.out 2>&1
eval_tap $? 32 'AdminBulkSaveItem' test.out

#- 33 AdminSyncUserEntitlements
./ng net.accelbyte.sdk.cli.Main inventory adminSyncUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'CRyWm7bt' \
    > test.out 2>&1
eval_tap $? 33 'AdminSyncUserEntitlements' test.out

#- 34 AdminPurchasable
./ng net.accelbyte.sdk.cli.Main inventory adminPurchasable \
    --namespace "$AB_NAMESPACE" \
    --userId '6zLQkUsA' \
    --body '{"entitlementType": "oYfg24wi", "inventoryConfig": {"slotUsed": 87}, "itemId": "v18KyIDM", "itemType": "arqG7Te1", "items": [{"bundledQty": 36, "entitlementType": "D43dKTiT", "inventoryConfig": {"slotUsed": 64}, "itemId": "M55DBl0b", "itemType": "UGD2pZEj", "sku": "PUCCGLch", "stackable": true, "useCount": 24}, {"bundledQty": 77, "entitlementType": "q4CdvsKc", "inventoryConfig": {"slotUsed": 19}, "itemId": "godsEGwW", "itemType": "EkM0PqS4", "sku": "v810H5vT", "stackable": true, "useCount": 74}, {"bundledQty": 39, "entitlementType": "MI8e2cZn", "inventoryConfig": {"slotUsed": 96}, "itemId": "EuKuqvAs", "itemType": "hG5PN6c6", "sku": "rIl9vizV", "stackable": false, "useCount": 92}], "quantity": 68, "sku": "14nbKtVF", "stackable": false, "useCount": 60}' \
    > test.out 2>&1
eval_tap $? 34 'AdminPurchasable' test.out

#- 35 PublicListInventoryConfigurations
./ng net.accelbyte.sdk.cli.Main inventory publicListInventoryConfigurations \
    --namespace "$AB_NAMESPACE" \
    --code 'RsFJG4rt' \
    --limit '1' \
    --offset '68' \
    --sortBy 'code' \
    > test.out 2>&1
eval_tap $? 35 'PublicListInventoryConfigurations' test.out

#- 36 PublicListItemTypes
./ng net.accelbyte.sdk.cli.Main inventory publicListItemTypes \
    --namespace "$AB_NAMESPACE" \
    --limit '100' \
    --offset '53' \
    --sortBy 'createdAt:asc' \
    > test.out 2>&1
eval_tap $? 36 'PublicListItemTypes' test.out

#- 37 PublicListTags
./ng net.accelbyte.sdk.cli.Main inventory publicListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '86' \
    --offset '16' \
    --sortBy 'createdAt' \
    > test.out 2>&1
eval_tap $? 37 'PublicListTags' test.out

#- 38 PublicListInventories
./ng net.accelbyte.sdk.cli.Main inventory publicListInventories \
    --namespace "$AB_NAMESPACE" \
    --inventoryConfigurationCode 'q5JFj1fe' \
    --limit '34' \
    --offset '70' \
    --sortBy 'updatedAt' \
    > test.out 2>&1
eval_tap $? 38 'PublicListInventories' test.out

#- 39 PublicConsumeMyItem
./ng net.accelbyte.sdk.cli.Main inventory publicConsumeMyItem \
    --inventoryId 'dSabj7fg' \
    --namespace "$AB_NAMESPACE" \
    --body '{"options": ["1MSb6rSu", "8T0217tK", "ci3xFVJn"], "qty": 50, "slotId": "0ym5c6jL", "sourceItemId": "EMMrdb7z"}' \
    > test.out 2>&1
eval_tap $? 39 'PublicConsumeMyItem' test.out

#- 40 PublicListItems
./ng net.accelbyte.sdk.cli.Main inventory publicListItems \
    --inventoryId '5Gg8s7wG' \
    --namespace "$AB_NAMESPACE" \
    --limit '84' \
    --offset '17' \
    --sortBy 'updatedAt:desc' \
    --sourceItemId 'AiTGUnf4' \
    --tags 'qqkYThzg' \
    > test.out 2>&1
eval_tap $? 40 'PublicListItems' test.out

#- 41 PublicBulkUpdateMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicBulkUpdateMyItems \
    --inventoryId 'WUTsxiMw' \
    --namespace "$AB_NAMESPACE" \
    --body '[{"customAttributes": {"wEfjzP41": {}, "1fJTklbW": {}, "wpegYeOA": {}}, "slotId": "8p7giOMy", "sourceItemId": "zfkD2z4N", "tags": ["o6UOMHCf", "Upv6Q1zf", "HGo2S5gl"]}, {"customAttributes": {"EiDzpTxH": {}, "wtVRk5Xv": {}, "uTpDuOFk": {}}, "slotId": "Svr5jIIQ", "sourceItemId": "kkDDTCtt", "tags": ["kEaxtaYN", "e56pKJAR", "SI8i0uC0"]}, {"customAttributes": {"cWrVDemj": {}, "qMPmqdmo": {}, "UrPSRTeN": {}}, "slotId": "9s320FWH", "sourceItemId": "CxSsMYkB", "tags": ["Hu4pYV4d", "V0KpFkwB", "qqw23gBm"]}]' \
    > test.out 2>&1
eval_tap $? 41 'PublicBulkUpdateMyItems' test.out

#- 42 PublicBulkRemoveMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicBulkRemoveMyItems \
    --inventoryId 'XfDnesF5' \
    --namespace "$AB_NAMESPACE" \
    --body '[{"slotId": "EuyJwcgY", "sourceItemId": "oo0xgEZa"}, {"slotId": "iI5DOSKL", "sourceItemId": "3Us1LwQj"}, {"slotId": "ehDrSDJn", "sourceItemId": "geNV5sbS"}]' \
    > test.out 2>&1
eval_tap $? 42 'PublicBulkRemoveMyItems' test.out

#- 43 PublicMoveMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicMoveMyItems \
    --inventoryId '2CqMpQDS' \
    --namespace "$AB_NAMESPACE" \
    --body '{"items": [{"qty": 57, "slotId": "wafJNuXk", "sourceItemId": "FQcyFcMI"}, {"qty": 56, "slotId": "JTmi9UF7", "sourceItemId": "CfypQiWd"}, {"qty": 78, "slotId": "VG04mXIy", "sourceItemId": "UkeS0haL"}], "srcInventoryId": "lbgTxfdc"}' \
    > test.out 2>&1
eval_tap $? 43 'PublicMoveMyItems' test.out

#- 44 PublicGetItem
./ng net.accelbyte.sdk.cli.Main inventory publicGetItem \
    --inventoryId 'Dey0meg4' \
    --namespace "$AB_NAMESPACE" \
    --slotId 'g5OvgoBY' \
    --sourceItemId 'wHucIxLt' \
    > test.out 2>&1
eval_tap $? 44 'PublicGetItem' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
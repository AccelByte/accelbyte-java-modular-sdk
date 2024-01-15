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
    --body '{"message": "4serRXGy", "operations": [{"consumeItems": [{"inventoryId": "4GLHsajS", "qty": 87, "slotId": "GzwMjKYu", "sourceItemId": "bB4KGKYj"}, {"inventoryId": "SbJ5zqCv", "qty": 0, "slotId": "8dCM4gNI", "sourceItemId": "Dk5O0rkn"}, {"inventoryId": "0hcHwJJq", "qty": 72, "slotId": "Cbuc4nrp", "sourceItemId": "vubC2CIN"}], "createItems": [{"customAttributes": {"5FsQd4nh": {}, "0oc0rQsn": {}, "jhk9vRYn": {}}, "inventoryConfigurationCode": "inSfCcWp", "inventoryId": "1mCWIzAj", "qty": 21, "serverCustomAttributes": {"3DJTYStu": {}, "aabQVEXk": {}, "DElfizr9": {}}, "slotId": "P7M26FiW", "slotUsed": 67, "sourceItemId": "QIQKlwdn", "tags": ["vhZZIT1I", "X0fqkkJ9", "s0xZHRjP"], "toSpecificInventory": false, "type": "cUZhJtqO"}, {"customAttributes": {"93FlQya6": {}, "o1ZIHYGK": {}, "eeuFEr65": {}}, "inventoryConfigurationCode": "xut9Yplx", "inventoryId": "ogqbBlTr", "qty": 51, "serverCustomAttributes": {"IyLn8RM1": {}, "4oEaQs9L": {}, "vCivUHBg": {}}, "slotId": "vyNP1rjh", "slotUsed": 49, "sourceItemId": "B9MCO1PK", "tags": ["FbOyZzhs", "XNoAWq9K", "us03xXvq"], "toSpecificInventory": false, "type": "w7aSCDqL"}, {"customAttributes": {"OJ8wWqjF": {}, "QFiiXp83": {}, "PFLYjZTV": {}}, "inventoryConfigurationCode": "9ShqxO8M", "inventoryId": "EddNOqFs", "qty": 50, "serverCustomAttributes": {"X4VYws5y": {}, "kF2DhUlE": {}, "UfgxWxwm": {}}, "slotId": "oDEXeG7y", "slotUsed": 71, "sourceItemId": "AD8GNjGR", "tags": ["JSkTkMsy", "XIbnWdkq", "tRBQpVSQ"], "toSpecificInventory": false, "type": "0EjQnDdP"}], "removeItems": [{"inventoryId": "vFKYIgcs", "slotId": "4C04MSkn", "sourceItemId": "x9w06NrP"}, {"inventoryId": "VHLfRsV9", "slotId": "ktZ6hr1D", "sourceItemId": "bcu290fb"}, {"inventoryId": "iJ2Zuetl", "slotId": "31rLB04j", "sourceItemId": "5QlgOghT"}], "targetUserId": "R5xDkFrk", "updateItems": [{"customAttributes": {"arm8oAWA": {}, "Z9dgOz0p": {}, "lPV92wl0": {}}, "inventoryId": "CmH7Pr2M", "serverCustomAttributes": {"yN0CsgUN": {}, "5aQgaWgs": {}, "2M5hLRnF": {}}, "slotId": "lx6lr36G", "sourceItemId": "6DYUC3fb", "tags": ["Bc4KF4rY", "g9k5FNtC", "BxtxrRgP"], "type": "eq7OpRwF"}, {"customAttributes": {"pUBN3kmR": {}, "2rubYr2q": {}, "tJDfVMe6": {}}, "inventoryId": "AtTJjFs5", "serverCustomAttributes": {"MPSaJSZb": {}, "tro58EIq": {}, "0aQhoUtY": {}}, "slotId": "tFL0wL6r", "sourceItemId": "kQPQy8Mw", "tags": ["34Jz1Gkc", "0yZWwIeK", "YRQ3Z9hQ"], "type": "Eojz0hnC"}, {"customAttributes": {"7fURvl5A": {}, "9QjGjHQB": {}, "cT8a71a4": {}}, "inventoryId": "eTYMJLI1", "serverCustomAttributes": {"p2Czl91i": {}, "HoWZoCp6": {}, "lX7SYIqB": {}}, "slotId": "mrTQfADF", "sourceItemId": "CJNGhLXf", "tags": ["xpWPsXso", "f3eQxyDI", "UapS1tcV"], "type": "v3F1pAns"}]}, {"consumeItems": [{"inventoryId": "8YtV0nRm", "qty": 38, "slotId": "eBuiNpfI", "sourceItemId": "y6puLvrw"}, {"inventoryId": "B5ko2nTL", "qty": 85, "slotId": "ZvFYo694", "sourceItemId": "tdtqREZ2"}, {"inventoryId": "oTbCuyZh", "qty": 4, "slotId": "D4Hbo2A1", "sourceItemId": "JGTP9hhf"}], "createItems": [{"customAttributes": {"Wtjl9bHu": {}, "yrD0xi5R": {}, "R1Q4V93S": {}}, "inventoryConfigurationCode": "w9lZuKpA", "inventoryId": "g0cCmmrT", "qty": 72, "serverCustomAttributes": {"RAJMN8fa": {}, "KbSVgZRY": {}, "5Hnvmm0A": {}}, "slotId": "sibEhbhC", "slotUsed": 50, "sourceItemId": "ZCZL4P9l", "tags": ["qpzc81y1", "CPJVoi1e", "aBODNRjz"], "toSpecificInventory": false, "type": "MViANRjc"}, {"customAttributes": {"WfE3bdx9": {}, "yjFwZ4DC": {}, "4ivV6cRy": {}}, "inventoryConfigurationCode": "Ndt8kEcI", "inventoryId": "svA3UEVX", "qty": 71, "serverCustomAttributes": {"r3KMoPDS": {}, "royJFuhu": {}, "JEGG7ITp": {}}, "slotId": "Fl5QtcI9", "slotUsed": 79, "sourceItemId": "0lCGqhDE", "tags": ["t8zKEgBr", "t6SiLw0J", "ePbGcOgT"], "toSpecificInventory": true, "type": "cwtiizTX"}, {"customAttributes": {"SxRkTvdK": {}, "ytgcDLCJ": {}, "k8vHIWNU": {}}, "inventoryConfigurationCode": "Qoh9UyFL", "inventoryId": "qt1nArPK", "qty": 65, "serverCustomAttributes": {"vxIJUqh1": {}, "kssOwdAN": {}, "kWb99xpj": {}}, "slotId": "Uvmlkm0X", "slotUsed": 21, "sourceItemId": "FhYqwE3t", "tags": ["6xzBHqn4", "Cd0zSQpJ", "ksUAol7J"], "toSpecificInventory": true, "type": "kM3OJgQ0"}], "removeItems": [{"inventoryId": "8lFqcWGt", "slotId": "n2RMoBr0", "sourceItemId": "Flf3Au20"}, {"inventoryId": "e1goXfdT", "slotId": "TLkoPTb3", "sourceItemId": "Ae7722Os"}, {"inventoryId": "X1FUr7LQ", "slotId": "bKcvDr5O", "sourceItemId": "OfNzwhOI"}], "targetUserId": "dSQXWNwx", "updateItems": [{"customAttributes": {"xblVQ1fL": {}, "g7Ik11xn": {}, "qK3vLBlT": {}}, "inventoryId": "Qey90KRB", "serverCustomAttributes": {"u3N8mYHo": {}, "ObzpmEd4": {}, "GOa8CEvv": {}}, "slotId": "RgO59OWE", "sourceItemId": "3htBHaGZ", "tags": ["frQhBtbx", "Ii45y2yx", "ounAk4af"], "type": "EzIvoA0F"}, {"customAttributes": {"MH3JkYVG": {}, "LVcDUFsD": {}, "XVfxLmSi": {}}, "inventoryId": "0K0bchPo", "serverCustomAttributes": {"9r523syz": {}, "eqTDwX4i": {}, "CWhWmokL": {}}, "slotId": "m9cKeCBF", "sourceItemId": "axFkFv9O", "tags": ["bwYrGczX", "BZNvPIxb", "j6c9Ee1N"], "type": "XQEzScky"}, {"customAttributes": {"BWmI0WGu": {}, "3ULVeCw1": {}, "M9gI7qVC": {}}, "inventoryId": "0CuCHQIa", "serverCustomAttributes": {"a91TBjLM": {}, "5iONoQqi": {}, "nZs4RFR0": {}}, "slotId": "KPiXkUwm", "sourceItemId": "Ld0Ps501", "tags": ["ccdAs3R4", "dpA3oBfP", "t7HkhLlW"], "type": "d1OzRAPu"}]}, {"consumeItems": [{"inventoryId": "LPUc07cx", "qty": 23, "slotId": "QpSJtdNH", "sourceItemId": "W1e7CYJh"}, {"inventoryId": "idKkSgUd", "qty": 94, "slotId": "XGlWO21J", "sourceItemId": "pOB17iBg"}, {"inventoryId": "PkINVOeY", "qty": 14, "slotId": "s19jeVcW", "sourceItemId": "BJbGJ9Ai"}], "createItems": [{"customAttributes": {"E6f3lu2U": {}, "m62NQsO2": {}, "nRhBx8Kv": {}}, "inventoryConfigurationCode": "9gdeYjq6", "inventoryId": "5XrTqLP7", "qty": 44, "serverCustomAttributes": {"RtxTMVNl": {}, "UCHbhL4A": {}, "oPwRQTSz": {}}, "slotId": "ok583Dc0", "slotUsed": 34, "sourceItemId": "PEf9Ytyv", "tags": ["a3a909v5", "Ar3FdRbl", "h6tyPaz0"], "toSpecificInventory": true, "type": "s77DsLdH"}, {"customAttributes": {"RljQfowS": {}, "ngxKES6K": {}, "HDMwPbhp": {}}, "inventoryConfigurationCode": "5k4NBqtJ", "inventoryId": "DYTFmgzB", "qty": 85, "serverCustomAttributes": {"ESdAv2Yj": {}, "ihQrjUs8": {}, "GxcZXaGT": {}}, "slotId": "kHOCyhqe", "slotUsed": 58, "sourceItemId": "pMDapuyP", "tags": ["LlVhMJDp", "Rh04PYrx", "8eUNpcHC"], "toSpecificInventory": false, "type": "iebdUHIt"}, {"customAttributes": {"6craETYN": {}, "YUNsp3U9": {}, "dFPxjobB": {}}, "inventoryConfigurationCode": "1UXIoC4B", "inventoryId": "EDXrDhNT", "qty": 66, "serverCustomAttributes": {"7JzWLzEb": {}, "wduYC71H": {}, "B7B7SPvy": {}}, "slotId": "OEuzfNcw", "slotUsed": 63, "sourceItemId": "4u56PdY0", "tags": ["bQ8CqQVm", "tkjHk7G2", "nyoDj5gt"], "toSpecificInventory": false, "type": "Y2hRsZuM"}], "removeItems": [{"inventoryId": "ZA6GjxTp", "slotId": "WRD7Pivw", "sourceItemId": "FJqG31Cg"}, {"inventoryId": "C56Hs3yv", "slotId": "RHDAPmKX", "sourceItemId": "xf0om1uf"}, {"inventoryId": "3zroR4SG", "slotId": "hCRcUDtM", "sourceItemId": "v5mgvFea"}], "targetUserId": "V51tVjXM", "updateItems": [{"customAttributes": {"8OHvto9K": {}, "T11wwUPm": {}, "KUBhvDpZ": {}}, "inventoryId": "7nfUKVOO", "serverCustomAttributes": {"NhvqA2nw": {}, "WEd0wWrc": {}, "ZYaSg7Pl": {}}, "slotId": "VKxGLuzj", "sourceItemId": "wLvifaZA", "tags": ["NYLjyF21", "tgLYBrzs", "tspqKGpx"], "type": "TVgeCD0F"}, {"customAttributes": {"Y0bDJed3": {}, "ClHS5z7Q": {}, "6kKQsqIm": {}}, "inventoryId": "Qywm09LE", "serverCustomAttributes": {"1XajmRBa": {}, "yqQsEmvg": {}, "mh6Ry8zu": {}}, "slotId": "a8jfF9cf", "sourceItemId": "So8cTYEP", "tags": ["26si6ioE", "VR6y4WAe", "FWJtb8k8"], "type": "urOMJBHH"}, {"customAttributes": {"AN24gdeI": {}, "atvvoLPO": {}, "N7rFd39D": {}}, "inventoryId": "dxS0ekK3", "serverCustomAttributes": {"5MQcsvEq": {}, "vBIXZREV": {}, "12V7cBZ7": {}}, "slotId": "zNcvkZcu", "sourceItemId": "PcOsR9mR", "tags": ["AjKFWtUx", "zQYUTMqW", "PFn1gCfN"], "type": "bdrPl6d2"}]}], "requestId": "XXAEc61C"}' \
    > test.out 2>&1
eval_tap $? 2 'AdminCreateChainingOperations' test.out

#- 3 AdminListInventories
./ng net.accelbyte.sdk.cli.Main inventory adminListInventories \
    --namespace "$AB_NAMESPACE" \
    --inventoryConfigurationCode 'mUOGhxvJ' \
    --limit '97' \
    --offset '86' \
    --sortBy 'updatedAt:asc' \
    --userId '2Jn35tQ9' \
    > test.out 2>&1
eval_tap $? 3 'AdminListInventories' test.out

#- 4 AdminCreateInventory
./ng net.accelbyte.sdk.cli.Main inventory adminCreateInventory \
    --namespace "$AB_NAMESPACE" \
    --body '{"inventoryConfigurationCode": "TehUB85o", "userId": "YOzNchQu"}' \
    > test.out 2>&1
eval_tap $? 4 'AdminCreateInventory' test.out

#- 5 AdminGetInventory
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventory \
    --inventoryId '6r4kzyNa' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'AdminGetInventory' test.out

#- 6 AdminUpdateInventory
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateInventory \
    --inventoryId 'kQOqD3Qo' \
    --namespace "$AB_NAMESPACE" \
    --body '{"incMaxSlots": 12}' \
    > test.out 2>&1
eval_tap $? 6 'AdminUpdateInventory' test.out

#- 7 DeleteInventory
./ng net.accelbyte.sdk.cli.Main inventory deleteInventory \
    --inventoryId 'nOMkiSPQ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"message": "Sl5n7mwq"}' \
    > test.out 2>&1
eval_tap $? 7 'DeleteInventory' test.out

#- 8 AdminListItems
./ng net.accelbyte.sdk.cli.Main inventory adminListItems \
    --inventoryId 'gDAFC9G8' \
    --namespace "$AB_NAMESPACE" \
    --limit '55' \
    --offset '66' \
    --qtyGte '27' \
    --sortBy 'updatedAt:desc' \
    --sourceItemId 'jCYWGXBP' \
    --tags 'TWIl7wq5' \
    > test.out 2>&1
eval_tap $? 8 'AdminListItems' test.out

#- 9 AdminGetInventoryItem
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventoryItem \
    --inventoryId 'cTZqARFK' \
    --namespace "$AB_NAMESPACE" \
    --slotId 'bedBWn9Y' \
    --sourceItemId 'srQnTv4u' \
    > test.out 2>&1
eval_tap $? 9 'AdminGetInventoryItem' test.out

#- 10 AdminListInventoryConfigurations
./ng net.accelbyte.sdk.cli.Main inventory adminListInventoryConfigurations \
    --namespace "$AB_NAMESPACE" \
    --code 'dSpO5Ajg' \
    --limit '100' \
    --offset '1' \
    --sortBy 'createdAt:asc' \
    > test.out 2>&1
eval_tap $? 10 'AdminListInventoryConfigurations' test.out

#- 11 AdminCreateInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminCreateInventoryConfiguration \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "SEcIfY8b", "description": "SgGzHJEq", "initialMaxSlots": 81, "maxInstancesPerUser": 28, "maxUpgradeSlots": 94, "name": "qvHtvDmL"}' \
    > test.out 2>&1
eval_tap $? 11 'AdminCreateInventoryConfiguration' test.out

#- 12 AdminGetInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventoryConfiguration \
    --inventoryConfigurationId 'emCUBbdR' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'AdminGetInventoryConfiguration' test.out

#- 13 AdminUpdateInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateInventoryConfiguration \
    --inventoryConfigurationId 'CArx4P3d' \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "mReizWKE", "description": "OdxXHtEt", "initialMaxSlots": 6, "maxInstancesPerUser": 43, "maxUpgradeSlots": 30, "name": "yJk2qTO4"}' \
    > test.out 2>&1
eval_tap $? 13 'AdminUpdateInventoryConfiguration' test.out

#- 14 AdminDeleteInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteInventoryConfiguration \
    --inventoryConfigurationId 'PRgX4jIG' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 14 'AdminDeleteInventoryConfiguration' test.out

#- 15 AdminListItemTypes
./ng net.accelbyte.sdk.cli.Main inventory adminListItemTypes \
    --namespace "$AB_NAMESPACE" \
    --limit '52' \
    --offset '17' \
    --sortBy 'name:asc' \
    > test.out 2>&1
eval_tap $? 15 'AdminListItemTypes' test.out

#- 16 AdminCreateItemType
./ng net.accelbyte.sdk.cli.Main inventory adminCreateItemType \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "bE221lLh"}' \
    > test.out 2>&1
eval_tap $? 16 'AdminCreateItemType' test.out

#- 17 AdminDeleteItemType
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteItemType \
    --itemTypeName '5PwraDST' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'AdminDeleteItemType' test.out

#- 18 AdminListTags
./ng net.accelbyte.sdk.cli.Main inventory adminListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '12' \
    --offset '42' \
    --owner 'ibfGSMDk' \
    --sortBy 'createdAt:asc' \
    > test.out 2>&1
eval_tap $? 18 'AdminListTags' test.out

#- 19 AdminCreateTag
./ng net.accelbyte.sdk.cli.Main inventory adminCreateTag \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "x2Bucisb", "owner": "CLIENT"}' \
    > test.out 2>&1
eval_tap $? 19 'AdminCreateTag' test.out

#- 20 AdminDeleteTag
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteTag \
    --namespace "$AB_NAMESPACE" \
    --tagName 'VWyMTBor' \
    > test.out 2>&1
eval_tap $? 20 'AdminDeleteTag' test.out

#- 21 AdminConsumeUserItem
./ng net.accelbyte.sdk.cli.Main inventory adminConsumeUserItem \
    --inventoryId 'jfQkFgJ6' \
    --namespace "$AB_NAMESPACE" \
    --userId '34L1ttS2' \
    --body '{"qty": 38, "slotId": "ePuhHz77", "sourceItemId": "wNAicPIw"}' \
    > test.out 2>&1
eval_tap $? 21 'AdminConsumeUserItem' test.out

#- 22 AdminBulkUpdateMyItems
./ng net.accelbyte.sdk.cli.Main inventory adminBulkUpdateMyItems \
    --inventoryId '4VnXjvkB' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ULnQDgu4' \
    --body '[{"customAttributes": {"PB5jIByz": {}, "4vS6A5jz": {}, "bw3BEmOq": {}}, "serverCustomAttributes": {"BgBcrJpS": {}, "YawmlFgI": {}, "BGDsufPd": {}}, "slotId": "qpm5ZHMU", "sourceItemId": "UghmECDw", "tags": ["UcCN1GRj", "H0GzZBE9", "YzYKwa0r"], "type": "5aHJ9vpT"}, {"customAttributes": {"etvmiLM4": {}, "plYHAAUq": {}, "t8cyFGpw": {}}, "serverCustomAttributes": {"T9jfarBI": {}, "xbFXi1ao": {}, "XPfTk3Rd": {}}, "slotId": "igTYJd8Q", "sourceItemId": "jTrS15kR", "tags": ["umGDSrKb", "OJso0xpY", "WVZgoA5c"], "type": "5Xb0yZmI"}, {"customAttributes": {"BaD2lc21": {}, "ajVp8wuZ": {}, "vT7g7hyB": {}}, "serverCustomAttributes": {"iXCKz05S": {}, "5wvh3la4": {}, "0Qzy9X1z": {}}, "slotId": "0dvaAHC8", "sourceItemId": "4pMFn1lz", "tags": ["q23QVPfD", "6KmPCTaM", "F2HpXkcH"], "type": "tAoTqotW"}]' \
    > test.out 2>&1
eval_tap $? 22 'AdminBulkUpdateMyItems' test.out

#- 23 AdminSaveItemToInventory
./ng net.accelbyte.sdk.cli.Main inventory adminSaveItemToInventory \
    --inventoryId 'M0CAXVb2' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Y3RpHknF' \
    --body '{"customAttributes": {"ziUPiiuO": {}, "b2GZ7ZiO": {}, "TACJgu05": {}}, "qty": 66, "serverCustomAttributes": {"KwOgVUZU": {}, "Vyd60CXG": {}, "6l7PEqDo": {}}, "slotId": "RI8NA0Xu", "slotUsed": 79, "sourceItemId": "BmVu8Rd0", "tags": ["KUjJpyuk", "hWMS5AQR", "5auLii8c"], "type": "vOPDSTTP"}' \
    > test.out 2>&1
eval_tap $? 23 'AdminSaveItemToInventory' test.out

#- 24 AdminBulkRemoveItems
./ng net.accelbyte.sdk.cli.Main inventory adminBulkRemoveItems \
    --inventoryId 'DRfdkHRj' \
    --namespace "$AB_NAMESPACE" \
    --userId 'GuvyIduY' \
    --body '[{"slotId": "TWL6utCO", "sourceItemId": "WCYVnkvr"}, {"slotId": "T3gxXdB1", "sourceItemId": "i5cpov3a"}, {"slotId": "Y45TvnRn", "sourceItemId": "OcD7rHU8"}]' \
    > test.out 2>&1
eval_tap $? 24 'AdminBulkRemoveItems' test.out

#- 25 AdminSaveItem
./ng net.accelbyte.sdk.cli.Main inventory adminSaveItem \
    --namespace "$AB_NAMESPACE" \
    --userId '6VJg5uWy' \
    --body '{"customAttributes": {"aPSar9ie": {}, "5EM6jIdM": {}, "rrHhR2LB": {}}, "inventoryConfigurationCode": "hoG0z0g4", "qty": 50, "serverCustomAttributes": {"KZOF2uUl": {}, "NeK29qRl": {}, "wgCjiAFR": {}}, "slotId": "BrpM0XQA", "slotUsed": 55, "sourceItemId": "7RHLg0UL", "tags": ["Ronq8iqD", "BmWTZMdY", "2kGOtubs"], "type": "7RUtlnj5"}' \
    > test.out 2>&1
eval_tap $? 25 'AdminSaveItem' test.out

#- 26 PublicListInventoryConfigurations
./ng net.accelbyte.sdk.cli.Main inventory publicListInventoryConfigurations \
    --namespace "$AB_NAMESPACE" \
    --code 'LmeuvIRo' \
    --limit '47' \
    --offset '95' \
    --sortBy 'updatedAt:desc' \
    > test.out 2>&1
eval_tap $? 26 'PublicListInventoryConfigurations' test.out

#- 27 PublicListItemTypes
./ng net.accelbyte.sdk.cli.Main inventory publicListItemTypes \
    --namespace "$AB_NAMESPACE" \
    --limit '35' \
    --offset '15' \
    --sortBy 'name:desc' \
    > test.out 2>&1
eval_tap $? 27 'PublicListItemTypes' test.out

#- 28 PublicListTags
./ng net.accelbyte.sdk.cli.Main inventory publicListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '29' \
    --offset '25' \
    --sortBy 'name:asc' \
    > test.out 2>&1
eval_tap $? 28 'PublicListTags' test.out

#- 29 PublicListInventories
./ng net.accelbyte.sdk.cli.Main inventory publicListInventories \
    --namespace "$AB_NAMESPACE" \
    --inventoryConfigurationCode 'uyAD1y2L' \
    --limit '23' \
    --offset '98' \
    --sortBy 'updatedAt:asc' \
    > test.out 2>&1
eval_tap $? 29 'PublicListInventories' test.out

#- 30 PublicConsumeMyItem
./ng net.accelbyte.sdk.cli.Main inventory publicConsumeMyItem \
    --inventoryId 'ePFF9leZ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"qty": 6, "slotId": "Doa5EnRr", "sourceItemId": "CbLKsgYO"}' \
    > test.out 2>&1
eval_tap $? 30 'PublicConsumeMyItem' test.out

#- 31 PublicListItems
./ng net.accelbyte.sdk.cli.Main inventory publicListItems \
    --inventoryId 'EZVMWzi9' \
    --namespace "$AB_NAMESPACE" \
    --limit '20' \
    --offset '38' \
    --qtyGte '0' \
    --sortBy 'qty:asc' \
    --sourceItemId 'lsCDGWPH' \
    --tags '4SGuji3G' \
    > test.out 2>&1
eval_tap $? 31 'PublicListItems' test.out

#- 32 PublicBulkUpdateMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicBulkUpdateMyItems \
    --inventoryId 'sdCemvRT' \
    --namespace "$AB_NAMESPACE" \
    --body '[{"customAttributes": {"0PR29YAr": {}, "F5TE01WH": {}, "88dS04hc": {}}, "slotId": "WkPZlyXO", "sourceItemId": "Dt08EaEo", "tags": ["3LK3h5RL", "iULXq0c6", "hKRmCk1B"]}, {"customAttributes": {"s4ldnrWK": {}, "e4nrlLrZ": {}, "Ok4fKyVq": {}}, "slotId": "ix21JtKD", "sourceItemId": "5CjorChl", "tags": ["0qsVYmqy", "kHAohrHj", "EqhRTP4m"]}, {"customAttributes": {"zOAII9bu": {}, "RNMDWfdZ": {}, "XJDjxpzH": {}}, "slotId": "rslKkkAF", "sourceItemId": "t4CQWP0i", "tags": ["3YzvupMQ", "iOX4AKle", "g81rhsHr"]}]' \
    > test.out 2>&1
eval_tap $? 32 'PublicBulkUpdateMyItems' test.out

#- 33 PublicBulkRemoveMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicBulkRemoveMyItems \
    --inventoryId 'QfGMgG2E' \
    --namespace "$AB_NAMESPACE" \
    --body '[{"slotId": "mE8MqF5m", "sourceItemId": "RdUPcqn7"}, {"slotId": "ncO4TgrP", "sourceItemId": "uVOmUOgt"}, {"slotId": "2xh6TOFp", "sourceItemId": "XMr0kmw2"}]' \
    > test.out 2>&1
eval_tap $? 33 'PublicBulkRemoveMyItems' test.out

#- 34 PublicMoveMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicMoveMyItems \
    --inventoryId 'YvhsTlAV' \
    --namespace "$AB_NAMESPACE" \
    --body '{"items": [{"qty": 54, "slotId": "FNjfLGiq", "sourceItemId": "RkiZj2AZ"}, {"qty": 59, "slotId": "C8HEHJHu", "sourceItemId": "rbIT7hvL"}, {"qty": 51, "slotId": "HBgmpCjH", "sourceItemId": "u7ZNm0Xl"}], "srcInventoryId": "LX8VPkms"}' \
    > test.out 2>&1
eval_tap $? 34 'PublicMoveMyItems' test.out

#- 35 PublicGetItem
./ng net.accelbyte.sdk.cli.Main inventory publicGetItem \
    --inventoryId 'kGTWLf18' \
    --namespace "$AB_NAMESPACE" \
    --slotId '9sStizuu' \
    --sourceItemId 'SPQW6ygx' \
    > test.out 2>&1
eval_tap $? 35 'PublicGetItem' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
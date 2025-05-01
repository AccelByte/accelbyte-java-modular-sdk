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
    --body '{"message": "99MI4bIv", "operations": [{"consumeItems": [{"dateRangeValidation": true, "inventoryId": "3z0DAYh8", "options": ["XkZR22Bu", "VqnU19Y6", "25XzdmaX"], "qty": 61, "slotId": "Pckyzj4X", "sourceItemId": "yqAOKfEp"}, {"dateRangeValidation": false, "inventoryId": "Kfe6GUQi", "options": ["zOvBvQyN", "PVvSP7DG", "jhcDkMd6"], "qty": 34, "slotId": "nlv6eQ82", "sourceItemId": "4DynebKV"}, {"dateRangeValidation": true, "inventoryId": "2jvw0P9F", "options": ["3y4NmDAq", "G3tNhmCJ", "ICxyMMQ1"], "qty": 92, "slotId": "kO7u2Okq", "sourceItemId": "54pkjins"}], "createItems": [{"customAttributes": {"AoHSsMeC": {}, "2zmehTrd": {}, "hYdpyNn0": {}}, "inventoryConfigurationCode": "qZemqRjQ", "inventoryId": "IKw3yjrq", "qty": 72, "serverCustomAttributes": {"SkYvtjO5": {}, "4e3X3Tu4": {}, "iDpmOAvj": {}}, "slotId": "KzTQ0Cu4", "slotUsed": 81, "source": "ECOMMERCE", "sourceItemId": "xZuwXFh8", "tags": ["A5S3bQUX", "EKLB8zJs", "lTz5sMWG"], "toSpecificInventory": true, "type": "9aidjOcs"}, {"customAttributes": {"REgVXTO5": {}, "JNV95tux": {}, "RdvgDeZz": {}}, "inventoryConfigurationCode": "4hTPy4Bw", "inventoryId": "4tDqFi3Z", "qty": 55, "serverCustomAttributes": {"LXrrSicV": {}, "h0qt40pJ": {}, "nY15AA6V": {}}, "slotId": "3vCdlzaT", "slotUsed": 95, "source": "OTHER", "sourceItemId": "10w1ZbIt", "tags": ["Gy3Pl1hw", "bKC1rcVJ", "wD6hLPKo"], "toSpecificInventory": false, "type": "gynZQJUd"}, {"customAttributes": {"B5dAs6p4": {}, "VDl1wMst": {}, "rYbOTl9E": {}}, "inventoryConfigurationCode": "l1kgz30G", "inventoryId": "7AZgtZG8", "qty": 76, "serverCustomAttributes": {"uB4sNPXr": {}, "MQbsPV5y": {}, "Pug2gJgS": {}}, "slotId": "EH2CianL", "slotUsed": 7, "source": "OTHER", "sourceItemId": "mSJLXEvM", "tags": ["WZAjNaau", "nViOENAT", "Bzp9rjAD"], "toSpecificInventory": true, "type": "A8fUNkxD"}], "removeItems": [{"inventoryId": "nrszpFor", "slotId": "bJ7jemhS", "sourceItemId": "lvgndjD7"}, {"inventoryId": "A7SYOswl", "slotId": "mHFqvMlh", "sourceItemId": "SIXYBxWa"}, {"inventoryId": "xWJVN98N", "slotId": "9t4CfVBs", "sourceItemId": "vxD32k1q"}], "targetUserId": "OZBAabLJ", "updateItems": [{"customAttributes": {"BD6Ge9Lq": {}, "LqOVYgAr": {}, "FIvXMUzA": {}}, "inventoryId": "cNwncNUE", "serverCustomAttributes": {"SuQInOsx": {}, "3hZWveTU": {}, "2jNxaEdl": {}}, "slotId": "xy8YkjAg", "sourceItemId": "DUwGeRf6", "tags": ["PgHH1QjE", "IB5AvEo6", "88m4SVn3"], "type": "6bMH70tX"}, {"customAttributes": {"AvMNy2PC": {}, "OmDbp1Hx": {}, "Td6jyOBH": {}}, "inventoryId": "jBq8fIfO", "serverCustomAttributes": {"wFEBcaEZ": {}, "yyBInxSM": {}, "mPw62teX": {}}, "slotId": "VRmqd2Bf", "sourceItemId": "Zk5KwB3l", "tags": ["QhLc3GJc", "tc5KGaMg", "trLYUXBm"], "type": "3fIC7Sd4"}, {"customAttributes": {"Vo41gmym": {}, "1DORoic4": {}, "lr5oRRYs": {}}, "inventoryId": "y390u24F", "serverCustomAttributes": {"CH1WJ7BN": {}, "chMmyGf7": {}, "6YCLl8px": {}}, "slotId": "YdAurh4p", "sourceItemId": "DvsW3uW9", "tags": ["FFLE3tPu", "8kJeiJMz", "mN2I55aa"], "type": "RCADaAxC"}]}, {"consumeItems": [{"dateRangeValidation": true, "inventoryId": "AHzS0WTL", "options": ["BBC3mb1J", "bhXBJPyM", "YHxTDXTU"], "qty": 97, "slotId": "3FuycJOM", "sourceItemId": "1FdJNxd8"}, {"dateRangeValidation": true, "inventoryId": "fI8NM7TN", "options": ["ZhkAvzkS", "yRL3mTTr", "gQVapdfS"], "qty": 76, "slotId": "vwCPQxRT", "sourceItemId": "gEuHNTGq"}, {"dateRangeValidation": false, "inventoryId": "d4JULZVA", "options": ["8JYuuzMw", "rqVEiR9q", "Ktelb91S"], "qty": 71, "slotId": "oEWbCfm6", "sourceItemId": "NHxBfORt"}], "createItems": [{"customAttributes": {"IxrJM88T": {}, "TnetUg8H": {}, "LkwOtskM": {}}, "inventoryConfigurationCode": "vxAVUZ4M", "inventoryId": "JF8rHrtN", "qty": 66, "serverCustomAttributes": {"ubG0ELvo": {}, "xo3ASRkT": {}, "nZSbXZwe": {}}, "slotId": "mxWoB9Am", "slotUsed": 53, "source": "OTHER", "sourceItemId": "u6o6VZyo", "tags": ["8uzRITq2", "28xDyveS", "3oWvfkj3"], "toSpecificInventory": false, "type": "wU9Jpyw1"}, {"customAttributes": {"JkXtq4eZ": {}, "xt4Vnwds": {}, "rVcfDp8j": {}}, "inventoryConfigurationCode": "6W6C6qba", "inventoryId": "0mzD5jWl", "qty": 85, "serverCustomAttributes": {"8dKAw2VF": {}, "t3R5tlZj": {}, "B61Ilqbf": {}}, "slotId": "034IhNCr", "slotUsed": 53, "source": "OTHER", "sourceItemId": "sIoJPeY3", "tags": ["6hejQ3Ft", "83mMUpIU", "S366LI1b"], "toSpecificInventory": true, "type": "JMwRRhcd"}, {"customAttributes": {"heZobXkV": {}, "1CeQjnf2": {}, "RQw9RUw0": {}}, "inventoryConfigurationCode": "HxVqiGR3", "inventoryId": "vlRCBedP", "qty": 29, "serverCustomAttributes": {"GJ1xsTjG": {}, "Gi0iGDKY": {}, "Fl21qbqV": {}}, "slotId": "Hp3qtLwP", "slotUsed": 35, "source": "OTHER", "sourceItemId": "mXFcHlYL", "tags": ["RTXZMxh0", "GvzpGZDj", "YQiNSTPh"], "toSpecificInventory": true, "type": "SvbiHkce"}], "removeItems": [{"inventoryId": "4LwsQopJ", "slotId": "IniXu8dd", "sourceItemId": "0YWaefX0"}, {"inventoryId": "QrvsCRN9", "slotId": "8tbczIYn", "sourceItemId": "msbB6cjc"}, {"inventoryId": "wu4FPEdY", "slotId": "efmR1QLd", "sourceItemId": "MS5PSVqy"}], "targetUserId": "qNzW4nJG", "updateItems": [{"customAttributes": {"Kt9DyQPD": {}, "r5pahb3A": {}, "6s20irwt": {}}, "inventoryId": "MylA8J4k", "serverCustomAttributes": {"mUXRr8mT": {}, "Ugct9QSP": {}, "3rskd2AX": {}}, "slotId": "gUUh958g", "sourceItemId": "n6lgPj1o", "tags": ["UyE3zjnZ", "1x8yuum8", "0Xnvz7sh"], "type": "0mITcsoh"}, {"customAttributes": {"789xUIGN": {}, "cJ5NtpFQ": {}, "ons95gUT": {}}, "inventoryId": "K4jPsRn8", "serverCustomAttributes": {"PiGqvBLz": {}, "THCKl27y": {}, "RWJbSlNL": {}}, "slotId": "gZjCk39x", "sourceItemId": "1Te0OqRF", "tags": ["OWtzKCgv", "vn8WlawX", "JgG2wTQs"], "type": "u5cOZAzo"}, {"customAttributes": {"wkzn8qfA": {}, "nTzbl0xj": {}, "TCTZIC7r": {}}, "inventoryId": "XbIVM2OU", "serverCustomAttributes": {"AfqG2ldn": {}, "VRsEEVFA": {}, "vysxxlca": {}}, "slotId": "w0ktGEfX", "sourceItemId": "7hheIpxP", "tags": ["WqIFEwiB", "nD8d8cAA", "eRtuESY8"], "type": "YlFX1ukj"}]}, {"consumeItems": [{"dateRangeValidation": false, "inventoryId": "hnxRZX4s", "options": ["RH79TsUM", "j3CawJqn", "C669CmmG"], "qty": 86, "slotId": "NqxuwhZO", "sourceItemId": "9FcGnUHs"}, {"dateRangeValidation": true, "inventoryId": "gQYdRxCx", "options": ["39biNIZL", "mmY5ldMG", "ldQefW8C"], "qty": 54, "slotId": "fqu9wYrM", "sourceItemId": "EoAltJtA"}, {"dateRangeValidation": false, "inventoryId": "HLASWtYi", "options": ["1A6yChuW", "84yH0RV6", "vcisVPCi"], "qty": 34, "slotId": "zkZarAY6", "sourceItemId": "RYKUF2R5"}], "createItems": [{"customAttributes": {"L7udg5al": {}, "tg0KxHZI": {}, "oA6Qrt8F": {}}, "inventoryConfigurationCode": "0h0pxkMB", "inventoryId": "xUYTihxx", "qty": 86, "serverCustomAttributes": {"qsZpLc2m": {}, "exbex5Rs": {}, "WYzJvyhE": {}}, "slotId": "vACh9NBX", "slotUsed": 65, "source": "OTHER", "sourceItemId": "J6SijV1x", "tags": ["1ghS4pgF", "hG246DJe", "XMDV4trM"], "toSpecificInventory": false, "type": "ZHOjTztj"}, {"customAttributes": {"MCPvh3gp": {}, "UiwwO40N": {}, "bhTx5I0g": {}}, "inventoryConfigurationCode": "Ufl2d3kN", "inventoryId": "4u36klgE", "qty": 95, "serverCustomAttributes": {"RCMM9Q3w": {}, "hl9cfFnC": {}, "jyy4WiId": {}}, "slotId": "y00CKIlY", "slotUsed": 4, "source": "OTHER", "sourceItemId": "fSvtTafQ", "tags": ["ZmYqiXC6", "GWQEauBD", "4FSJrTeX"], "toSpecificInventory": true, "type": "CJBA4I9l"}, {"customAttributes": {"5JXmgSMZ": {}, "x0DOjbMN": {}, "bhpk6FyD": {}}, "inventoryConfigurationCode": "HA00Ig7B", "inventoryId": "ZxXyisY9", "qty": 16, "serverCustomAttributes": {"7RtqJWqd": {}, "K6woxCvv": {}, "MNfp7mjl": {}}, "slotId": "kUBTJmYL", "slotUsed": 16, "source": "ECOMMERCE", "sourceItemId": "f3E44kDT", "tags": ["pwMT66Ni", "uPmIRoNI", "pHRi7xUf"], "toSpecificInventory": false, "type": "hl3XThjV"}], "removeItems": [{"inventoryId": "FS2W43wC", "slotId": "PFgl3OdG", "sourceItemId": "iv0ZSBYa"}, {"inventoryId": "Tde7f7u0", "slotId": "67XnsA72", "sourceItemId": "FNUUgAFm"}, {"inventoryId": "bVs0izwj", "slotId": "1nrPu1w3", "sourceItemId": "8J1xaTbR"}], "targetUserId": "r0jrlXze", "updateItems": [{"customAttributes": {"m2d6Lf62": {}, "2Otg41jd": {}, "mFwnY02k": {}}, "inventoryId": "i1NG9Mhk", "serverCustomAttributes": {"HKOu7dMq": {}, "i5E79STB": {}, "Wrj0XaWg": {}}, "slotId": "ReXKMbfL", "sourceItemId": "iYmaXFG3", "tags": ["43ooXHQR", "rv1emtih", "MSYaWQg1"], "type": "d7CQIxSm"}, {"customAttributes": {"FIwcHlvP": {}, "2EviZTMb": {}, "AVE4t3jU": {}}, "inventoryId": "GB6WuEii", "serverCustomAttributes": {"qukxQhf5": {}, "4QQF8Mrm": {}, "pedGCIuT": {}}, "slotId": "5IhvM3Qp", "sourceItemId": "hrwC8NJZ", "tags": ["qarUTEPx", "0hhfcIe4", "NF0GFwtl"], "type": "96YmSEs1"}, {"customAttributes": {"u4xTvhCN": {}, "sWBF9Bf5": {}, "FAoEVdUd": {}}, "inventoryId": "eJlJmYDY", "serverCustomAttributes": {"r79QfaBe": {}, "OswIkMEC": {}, "VJ1vsImq": {}}, "slotId": "2JHBUSt9", "sourceItemId": "AndvcJsN", "tags": ["oyK6IYSv", "vHv0Rghh", "j6M7dLPB"], "type": "iACnpMQM"}]}], "requestId": "bJsgLmXs"}' \
    > test.out 2>&1
eval_tap $? 2 'AdminCreateChainingOperations' test.out

#- 3 AdminListIntegrationConfigurations
./ng net.accelbyte.sdk.cli.Main inventory adminListIntegrationConfigurations \
    --namespace "$AB_NAMESPACE" \
    --limit '38' \
    --offset '30' \
    --sortBy 'createdAt:asc' \
    > test.out 2>&1
eval_tap $? 3 'AdminListIntegrationConfigurations' test.out

#- 4 AdminCreateIntegrationConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminCreateIntegrationConfiguration \
    --namespace "$AB_NAMESPACE" \
    --body '{"mapItemType": ["YuPO9KZE", "NnWqhM3g", "VNxvzq4Q"], "serviceName": "hLYiRMDQ", "targetInventoryCode": "bChFLmlh"}' \
    > test.out 2>&1
eval_tap $? 4 'AdminCreateIntegrationConfiguration' test.out

#- 5 AdminUpdateIntegrationConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateIntegrationConfiguration \
    --integrationConfigurationId 'Yzr9SP85' \
    --namespace "$AB_NAMESPACE" \
    --body '{"mapItemType": ["vu1XQDlU", "sISle3Ot", "FuLChOPp"], "serviceName": "5eX71KnU", "targetInventoryCode": "OoSj0gDY"}' \
    > test.out 2>&1
eval_tap $? 5 'AdminUpdateIntegrationConfiguration' test.out

#- 6 AdminUpdateStatusIntegrationConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateStatusIntegrationConfiguration \
    --integrationConfigurationId 'qY2RGBe7' \
    --namespace "$AB_NAMESPACE" \
    --body '{"status": "INIT"}' \
    > test.out 2>&1
eval_tap $? 6 'AdminUpdateStatusIntegrationConfiguration' test.out

#- 7 AdminListInventories
./ng net.accelbyte.sdk.cli.Main inventory adminListInventories \
    --namespace "$AB_NAMESPACE" \
    --inventoryConfigurationCode '8gevCWPm' \
    --limit '83' \
    --offset '37' \
    --sortBy 'updatedAt:desc' \
    --userId 'Syt2yRKn' \
    > test.out 2>&1
eval_tap $? 7 'AdminListInventories' test.out

#- 8 AdminCreateInventory
./ng net.accelbyte.sdk.cli.Main inventory adminCreateInventory \
    --namespace "$AB_NAMESPACE" \
    --body '{"inventoryConfigurationCode": "vU8cMJFL", "userId": "a3mO9TnW"}' \
    > test.out 2>&1
eval_tap $? 8 'AdminCreateInventory' test.out

#- 9 AdminGetInventory
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventory \
    --inventoryId 'ltgxQ5Cs' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'AdminGetInventory' test.out

#- 10 AdminUpdateInventory
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateInventory \
    --inventoryId 'u5CQxQw9' \
    --namespace "$AB_NAMESPACE" \
    --body '{"incMaxSlots": 3}' \
    > test.out 2>&1
eval_tap $? 10 'AdminUpdateInventory' test.out

#- 11 DeleteInventory
./ng net.accelbyte.sdk.cli.Main inventory deleteInventory \
    --inventoryId 'Tmzxnm8t' \
    --namespace "$AB_NAMESPACE" \
    --body '{"message": "JlD7YPgs"}' \
    > test.out 2>&1
eval_tap $? 11 'DeleteInventory' test.out

#- 12 AdminListItems
./ng net.accelbyte.sdk.cli.Main inventory adminListItems \
    --inventoryId 'piqFCDxY' \
    --namespace "$AB_NAMESPACE" \
    --limit '0' \
    --offset '65' \
    --sortBy 'updatedAt:asc' \
    --sourceItemId 'wDw0qhDg' \
    --tags 'b0iFFiW4' \
    > test.out 2>&1
eval_tap $? 12 'AdminListItems' test.out

#- 13 AdminGetInventoryItem
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventoryItem \
    --inventoryId 'hHc86Tq1' \
    --namespace "$AB_NAMESPACE" \
    --slotId '58bCrLNH' \
    --sourceItemId 'wSZIS9Na' \
    > test.out 2>&1
eval_tap $? 13 'AdminGetInventoryItem' test.out

#- 14 AdminListInventoryConfigurations
./ng net.accelbyte.sdk.cli.Main inventory adminListInventoryConfigurations \
    --namespace "$AB_NAMESPACE" \
    --code 'ixEloVyh' \
    --limit '64' \
    --offset '1' \
    --sortBy 'createdAt:asc' \
    > test.out 2>&1
eval_tap $? 14 'AdminListInventoryConfigurations' test.out

#- 15 AdminCreateInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminCreateInventoryConfiguration \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "rUz0aXvb", "description": "pp45JMid", "initialMaxSlots": 55, "maxInstancesPerUser": 89, "maxUpgradeSlots": 12, "name": "fPnYXaTL"}' \
    > test.out 2>&1
eval_tap $? 15 'AdminCreateInventoryConfiguration' test.out

#- 16 AdminGetInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventoryConfiguration \
    --inventoryConfigurationId 'Hd49b7DO' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'AdminGetInventoryConfiguration' test.out

#- 17 AdminUpdateInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateInventoryConfiguration \
    --inventoryConfigurationId 'xxQulAPG' \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "LLIUmaPf", "description": "JTFp2cWR", "initialMaxSlots": 77, "maxInstancesPerUser": 15, "maxUpgradeSlots": 84, "name": "QvoAYcnr"}' \
    > test.out 2>&1
eval_tap $? 17 'AdminUpdateInventoryConfiguration' test.out

#- 18 AdminDeleteInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteInventoryConfiguration \
    --inventoryConfigurationId 'YI5twqcn' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminDeleteInventoryConfiguration' test.out

#- 19 AdminListItemTypes
./ng net.accelbyte.sdk.cli.Main inventory adminListItemTypes \
    --namespace "$AB_NAMESPACE" \
    --limit '51' \
    --offset '96' \
    --sortBy 'createdAt:desc' \
    > test.out 2>&1
eval_tap $? 19 'AdminListItemTypes' test.out

#- 20 AdminCreateItemType
./ng net.accelbyte.sdk.cli.Main inventory adminCreateItemType \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "vj8jnjmK"}' \
    > test.out 2>&1
eval_tap $? 20 'AdminCreateItemType' test.out

#- 21 AdminDeleteItemType
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteItemType \
    --itemTypeName '5b2bzBIu' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'AdminDeleteItemType' test.out

#- 22 AdminListTags
./ng net.accelbyte.sdk.cli.Main inventory adminListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '70' \
    --offset '12' \
    --owner 'ZU5YrWZo' \
    --sortBy 'createdAt:asc' \
    > test.out 2>&1
eval_tap $? 22 'AdminListTags' test.out

#- 23 AdminCreateTag
./ng net.accelbyte.sdk.cli.Main inventory adminCreateTag \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "fnZW0Gw9", "owner": "SERVER"}' \
    > test.out 2>&1
eval_tap $? 23 'AdminCreateTag' test.out

#- 24 AdminDeleteTag
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteTag \
    --namespace "$AB_NAMESPACE" \
    --tagName 'MYH6BeTF' \
    > test.out 2>&1
eval_tap $? 24 'AdminDeleteTag' test.out

#- 25 AdminConsumeUserItem
./ng net.accelbyte.sdk.cli.Main inventory adminConsumeUserItem \
    --inventoryId 'FB0T97yJ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'iaxqT74z' \
    --dateRangeValidation 'awAjkw2b' \
    --body '{"options": ["ifVUHkYu", "AQNC35wH", "qW5caERm"], "qty": 67, "slotId": "TNd2nV6B", "sourceItemId": "cNUas7CC"}' \
    > test.out 2>&1
eval_tap $? 25 'AdminConsumeUserItem' test.out

#- 26 AdminBulkUpdateMyItems
./ng net.accelbyte.sdk.cli.Main inventory adminBulkUpdateMyItems \
    --inventoryId 'tru2eeDh' \
    --namespace "$AB_NAMESPACE" \
    --userId 'XuqYWBrT' \
    --body '[{"customAttributes": {"LYB7hC1A": {}, "7yliWIWn": {}, "3RQcd1nX": {}}, "serverCustomAttributes": {"2DUyD6Be": {}, "hxPmUD6m": {}, "j1vHBRrV": {}}, "slotId": "1d6VL8mD", "sourceItemId": "0z8HP8xW", "tags": ["yzmYC2db", "PwFRP3bp", "V84B4x4x"], "type": "pRmQzjzQ"}, {"customAttributes": {"t9TfuK68": {}, "NxElNoQX": {}, "FMHk4qB0": {}}, "serverCustomAttributes": {"mKVS2gBB": {}, "S64V8yPR": {}, "mzegqzOv": {}}, "slotId": "Kg53VnvM", "sourceItemId": "FXXLF4mZ", "tags": ["XruQcQmH", "LtGPF0fb", "DvBNB7K3"], "type": "K8PBBSdc"}, {"customAttributes": {"VDm2RA5Z": {}, "wsZbxRiC": {}, "t94cY4e6": {}}, "serverCustomAttributes": {"znHvSib2": {}, "2KwuwCqF": {}, "1ILD3bqO": {}}, "slotId": "pqS8rBOQ", "sourceItemId": "GHjYmEN7", "tags": ["6JgPHiIq", "y8Rks10F", "0NUy0bso"], "type": "U5LzxVhS"}]' \
    > test.out 2>&1
eval_tap $? 26 'AdminBulkUpdateMyItems' test.out

#- 27 AdminSaveItemToInventory
./ng net.accelbyte.sdk.cli.Main inventory adminSaveItemToInventory \
    --inventoryId '9bEkIoCc' \
    --namespace "$AB_NAMESPACE" \
    --userId '8yk7nsiU' \
    --body '{"customAttributes": {"NhPaUHlw": {}, "HMglwUao": {}, "zYSCUvSz": {}}, "qty": 8, "serverCustomAttributes": {"4hhDYGpV": {}, "PaYzxwEv": {}, "9phNfBSu": {}}, "slotId": "LHZmZhD2", "slotUsed": 30, "source": "OTHER", "sourceItemId": "doObUntM", "tags": ["PCnjyFvF", "cK2bJ5py", "jVJ1NlqT"], "type": "xFSYNEaa"}' \
    > test.out 2>&1
eval_tap $? 27 'AdminSaveItemToInventory' test.out

#- 28 AdminBulkRemoveItems
./ng net.accelbyte.sdk.cli.Main inventory adminBulkRemoveItems \
    --inventoryId '0w5INnGM' \
    --namespace "$AB_NAMESPACE" \
    --userId 'QYdR9omg' \
    --body '[{"slotId": "V4kECR4X", "sourceItemId": "hqAxzVJg"}, {"slotId": "wX5SqRJl", "sourceItemId": "sIcRIzaa"}, {"slotId": "dCNmhJDd", "sourceItemId": "1V0cRqao"}]' \
    > test.out 2>&1
eval_tap $? 28 'AdminBulkRemoveItems' test.out

#- 29 AdminBulkSaveItemToInventory
./ng net.accelbyte.sdk.cli.Main inventory adminBulkSaveItemToInventory \
    --inventoryId 'HfDYhT6I' \
    --namespace "$AB_NAMESPACE" \
    --userId 'UpkagO9C' \
    --body '[{"customAttributes": {"IZjXYG3T": {}, "87SJtQtb": {}, "i07tzMvt": {}}, "qty": 93, "serverCustomAttributes": {"n79k2E8M": {}, "Bq8n9uKJ": {}, "7kCxjLiE": {}}, "slotId": "kT7Wda8r", "slotUsed": 50, "source": "ECOMMERCE", "sourceItemId": "v8qHB0jC", "tags": ["sUxDTJua", "U6ThJtze", "pez9bH17"], "type": "jz4iF2aF"}, {"customAttributes": {"VaAVi3cU": {}, "4nZQ93s8": {}, "aS5g18gU": {}}, "qty": 70, "serverCustomAttributes": {"6Eds9QLI": {}, "8bHLtPW8": {}, "hSfcBEGH": {}}, "slotId": "C4ulULFD", "slotUsed": 57, "source": "ECOMMERCE", "sourceItemId": "EVNIbQyI", "tags": ["iQQGcblE", "fNKITup8", "yvFaE6oX"], "type": "ciLq39nQ"}, {"customAttributes": {"lWxR1CPr": {}, "o0Q0k3VD": {}, "7CLQzNQE": {}}, "qty": 77, "serverCustomAttributes": {"yQIqFLSy": {}, "leLDeQdq": {}, "Q6okkqhM": {}}, "slotId": "SfmeZEz6", "slotUsed": 90, "source": "OTHER", "sourceItemId": "MP4Up9Yz", "tags": ["B6y7gCuH", "qYl2aaPw", "5VCr7f3u"], "type": "1ilWCTRO"}]' \
    > test.out 2>&1
eval_tap $? 29 'AdminBulkSaveItemToInventory' test.out

#- 30 AdminUpdateUserInventoriesByInventoryCode
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateUserInventoriesByInventoryCode \
    --inventoryConfigurationCode 'llLmbFvr' \
    --namespace "$AB_NAMESPACE" \
    --userId 'zKxshgpk' \
    --body '{"incMaxSlots": 80}' \
    > test.out 2>&1
eval_tap $? 30 'AdminUpdateUserInventoriesByInventoryCode' test.out

#- 31 AdminSaveItem
./ng net.accelbyte.sdk.cli.Main inventory adminSaveItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'Cp1zD72e' \
    --body '{"customAttributes": {"RIm1Pe62": {}, "CiIcpgwd": {}, "GFgDjVxK": {}}, "inventoryConfigurationCode": "3DPUOJhK", "qty": 92, "serverCustomAttributes": {"d2zDxr9i": {}, "4EX8wQG5": {}, "8eegbQtA": {}}, "slotId": "waBMp2SR", "slotUsed": 95, "source": "ECOMMERCE", "sourceItemId": "WOWnxX48", "tags": ["5Ya3XdXi", "fH4CwoTP", "pMFMHyF7"], "type": "DZWyHLaO"}' \
    > test.out 2>&1
eval_tap $? 31 'AdminSaveItem' test.out

#- 32 AdminBulkSaveItem
./ng net.accelbyte.sdk.cli.Main inventory adminBulkSaveItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'lF1J5MXt' \
    --body '[{"customAttributes": {"akYTKnyj": {}, "zdSrlOae": {}, "Jg7YMQB7": {}}, "inventoryConfigurationCode": "hWsGNH9e", "qty": 1, "serverCustomAttributes": {"54KFry6k": {}, "iydVjvgW": {}, "Wjan8Y3g": {}}, "slotId": "veqT3MJU", "slotUsed": 87, "source": "ECOMMERCE", "sourceItemId": "TrtiA16J", "tags": ["wzSUu8lA", "oIpViENb", "Cz6mGrUw"], "type": "e0vteJ9k"}, {"customAttributes": {"sHTfmG7s": {}, "UGrG48DW": {}, "mXswOflI": {}}, "inventoryConfigurationCode": "Fect8cYy", "qty": 11, "serverCustomAttributes": {"6juDQjkl": {}, "zBh9FY8J": {}, "VB1Dj8pE": {}}, "slotId": "NP7tEM9q", "slotUsed": 100, "source": "ECOMMERCE", "sourceItemId": "JQv2AsQI", "tags": ["80wDwZh3", "3GvZAUUg", "ylWYB66b"], "type": "eklwd6F1"}, {"customAttributes": {"e297NWkT": {}, "KamdPI0W": {}, "4nVEnSqy": {}}, "inventoryConfigurationCode": "8nqDDpx2", "qty": 19, "serverCustomAttributes": {"M2idUO1x": {}, "WweL86VD": {}, "cQ0a3RLH": {}}, "slotId": "TpfdbcLH", "slotUsed": 60, "source": "ECOMMERCE", "sourceItemId": "fZyWVqKG", "tags": ["6xSUM9Kt", "0Cwv9Ij5", "a7L9MXmH"], "type": "3p0q0ndp"}]' \
    > test.out 2>&1
eval_tap $? 32 'AdminBulkSaveItem' test.out

#- 33 AdminSyncUserEntitlements
./ng net.accelbyte.sdk.cli.Main inventory adminSyncUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'twfy17mw' \
    > test.out 2>&1
eval_tap $? 33 'AdminSyncUserEntitlements' test.out

#- 34 AdminPurchasable
./ng net.accelbyte.sdk.cli.Main inventory adminPurchasable \
    --namespace "$AB_NAMESPACE" \
    --userId '7pWZZQyD' \
    --body '{"entitlementType": "tPKEhy5K", "inventoryConfig": {"slotUsed": 8}, "itemId": "RKnaLhEz", "itemType": "kzpA59Rh", "items": [{"bundledQty": 82, "entitlementType": "ZFRzTA1a", "inventoryConfig": {"slotUsed": 43}, "itemId": "CQDxgbmt", "itemType": "iAn2sopk", "sku": "we9fjf1g", "stackable": false, "useCount": 60}, {"bundledQty": 97, "entitlementType": "tOTteYAM", "inventoryConfig": {"slotUsed": 89}, "itemId": "JXsih8VJ", "itemType": "WZBrXhAj", "sku": "wTyNQeps", "stackable": false, "useCount": 65}, {"bundledQty": 88, "entitlementType": "DJ0W9SPm", "inventoryConfig": {"slotUsed": 91}, "itemId": "wpzdssY2", "itemType": "Ljyfan1h", "sku": "cjZxAd0M", "stackable": true, "useCount": 76}], "quantity": 10, "sku": "5cg3iznp", "stackable": false, "useCount": 17}' \
    > test.out 2>&1
eval_tap $? 34 'AdminPurchasable' test.out

#- 35 PublicListInventoryConfigurations
./ng net.accelbyte.sdk.cli.Main inventory publicListInventoryConfigurations \
    --namespace "$AB_NAMESPACE" \
    --code '3pIayF7z' \
    --limit '94' \
    --offset '18' \
    --sortBy 'createdAt:desc' \
    > test.out 2>&1
eval_tap $? 35 'PublicListInventoryConfigurations' test.out

#- 36 PublicListItemTypes
./ng net.accelbyte.sdk.cli.Main inventory publicListItemTypes \
    --namespace "$AB_NAMESPACE" \
    --limit '77' \
    --offset '98' \
    --sortBy 'name:asc' \
    > test.out 2>&1
eval_tap $? 36 'PublicListItemTypes' test.out

#- 37 PublicListTags
./ng net.accelbyte.sdk.cli.Main inventory publicListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '75' \
    --offset '24' \
    --sortBy 'createdAt:asc' \
    > test.out 2>&1
eval_tap $? 37 'PublicListTags' test.out

#- 38 PublicListInventories
./ng net.accelbyte.sdk.cli.Main inventory publicListInventories \
    --namespace "$AB_NAMESPACE" \
    --inventoryConfigurationCode 'mHbCxlTp' \
    --limit '68' \
    --offset '54' \
    --sortBy 'updatedAt:asc' \
    > test.out 2>&1
eval_tap $? 38 'PublicListInventories' test.out

#- 39 PublicConsumeMyItem
./ng net.accelbyte.sdk.cli.Main inventory publicConsumeMyItem \
    --inventoryId 'TCNSdYkW' \
    --namespace "$AB_NAMESPACE" \
    --body '{"options": ["auaaSoWC", "tueUsSrL", "CVH4gPVt"], "qty": 56, "slotId": "6pKgc8NF", "sourceItemId": "KWFdFdQM"}' \
    > test.out 2>&1
eval_tap $? 39 'PublicConsumeMyItem' test.out

#- 40 PublicListItems
./ng net.accelbyte.sdk.cli.Main inventory publicListItems \
    --inventoryId 'E6UTjHWu' \
    --namespace "$AB_NAMESPACE" \
    --limit '64' \
    --offset '97' \
    --sortBy 'createdAt:desc' \
    --sourceItemId 'kI96fQxU' \
    --tags 'XhFGiarS' \
    > test.out 2>&1
eval_tap $? 40 'PublicListItems' test.out

#- 41 PublicBulkUpdateMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicBulkUpdateMyItems \
    --inventoryId 'R1ZAGnhc' \
    --namespace "$AB_NAMESPACE" \
    --body '[{"customAttributes": {"P0xuiyEK": {}, "NYkmWYZX": {}, "MWlX7Jao": {}}, "slotId": "ESrtoi79", "sourceItemId": "qsYFyJMr", "tags": ["pHrfOJCt", "EytXsotH", "3tgL4EoI"]}, {"customAttributes": {"XnO8MXRZ": {}, "pfNzjkRJ": {}, "ON8eYzhJ": {}}, "slotId": "BRmnhtjz", "sourceItemId": "uxALusgt", "tags": ["bOVtNNDe", "wAP446OC", "exdoEe55"]}, {"customAttributes": {"yxFH3XNg": {}, "jWcVKisr": {}, "pxWb33IQ": {}}, "slotId": "FJoBSS1U", "sourceItemId": "OZuXxIds", "tags": ["JOC390O7", "SPW5Pllh", "nYoEb8c3"]}]' \
    > test.out 2>&1
eval_tap $? 41 'PublicBulkUpdateMyItems' test.out

#- 42 PublicBulkRemoveMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicBulkRemoveMyItems \
    --inventoryId 'mRj27GTH' \
    --namespace "$AB_NAMESPACE" \
    --body '[{"slotId": "kV4BynVP", "sourceItemId": "o6OIeNCv"}, {"slotId": "QmTlhk4k", "sourceItemId": "odUMiw8R"}, {"slotId": "6W6CeaeR", "sourceItemId": "8ZmfJ3XK"}]' \
    > test.out 2>&1
eval_tap $? 42 'PublicBulkRemoveMyItems' test.out

#- 43 PublicMoveMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicMoveMyItems \
    --inventoryId 'D9nJH5Pe' \
    --namespace "$AB_NAMESPACE" \
    --body '{"items": [{"qty": 99, "slotId": "Ah9IV6Je", "sourceItemId": "Z4QNFZwf"}, {"qty": 38, "slotId": "OQQVmnY0", "sourceItemId": "ysoNWBn0"}, {"qty": 3, "slotId": "VOPTFPHo", "sourceItemId": "nVawxFb5"}], "srcInventoryId": "hJHp4nJk"}' \
    > test.out 2>&1
eval_tap $? 43 'PublicMoveMyItems' test.out

#- 44 PublicGetItem
./ng net.accelbyte.sdk.cli.Main inventory publicGetItem \
    --inventoryId 'QQkwbZl1' \
    --namespace "$AB_NAMESPACE" \
    --slotId 'XMGinl8X' \
    --sourceItemId '0hN1TLm8' \
    > test.out 2>&1
eval_tap $? 44 'PublicGetItem' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
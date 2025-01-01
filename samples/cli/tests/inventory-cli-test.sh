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
    --body '{"message": "OlFCOsuY", "operations": [{"consumeItems": [{"dateRangeValidation": true, "inventoryId": "Knatsy3j", "options": ["FeYTA1OA", "IHXlSBZp", "ecBx9MFF"], "qty": 57, "slotId": "DPa02RCP", "sourceItemId": "pq9PKNck"}, {"dateRangeValidation": false, "inventoryId": "GTG7P1t0", "options": ["4cmf3sqJ", "lB610gbR", "JZBAW6k4"], "qty": 51, "slotId": "MHx4VEUZ", "sourceItemId": "0Dp8Hf7Q"}, {"dateRangeValidation": false, "inventoryId": "pnr5swLc", "options": ["YNc6pDVc", "sBhDi4Xi", "6mks0JBE"], "qty": 36, "slotId": "vdPjFtTg", "sourceItemId": "RSPbubDj"}], "createItems": [{"customAttributes": {"bDFtdGiF": {}, "MkhC9A1i": {}, "4CjSVz2a": {}}, "inventoryConfigurationCode": "dNxKAQuT", "inventoryId": "JYpCgQyL", "qty": 97, "serverCustomAttributes": {"vKWzVNJC": {}, "s9J4E7D5": {}, "YKFnDkT4": {}}, "slotId": "qXrr1Lzs", "slotUsed": 36, "source": "ECOMMERCE", "sourceItemId": "4YjggE5t", "tags": ["7Apqv821", "oPeH988q", "EikvPWuR"], "toSpecificInventory": false, "type": "pp4EITxU"}, {"customAttributes": {"tYRA06o5": {}, "f1Ig4RZN": {}, "sHghrMJO": {}}, "inventoryConfigurationCode": "HpwGmRcU", "inventoryId": "VDksay8f", "qty": 13, "serverCustomAttributes": {"8XV2VF9W": {}, "ZQsSTtAO": {}, "ZFKW3Vri": {}}, "slotId": "ym92wNTA", "slotUsed": 57, "source": "OTHER", "sourceItemId": "MEj9Ufcr", "tags": ["RcjkjGQY", "ZxB0jyPX", "a8hoLRZb"], "toSpecificInventory": true, "type": "RbxaUe6c"}, {"customAttributes": {"fb5PkW6Y": {}, "Dtj00GoU": {}, "g7EUO2Mf": {}}, "inventoryConfigurationCode": "UpWo45x2", "inventoryId": "ZgruyhBo", "qty": 36, "serverCustomAttributes": {"PaeygMSH": {}, "3yL9e6ME": {}, "xJ2APojX": {}}, "slotId": "3BRsxHkt", "slotUsed": 44, "source": "OTHER", "sourceItemId": "UHzSBvlb", "tags": ["s5CKaG5G", "wfnGQOi8", "j9tFvUxD"], "toSpecificInventory": true, "type": "bZljQmVi"}], "removeItems": [{"inventoryId": "YKgy20gE", "slotId": "ZPKQsggo", "sourceItemId": "ctqdx3nv"}, {"inventoryId": "to9Y4Ddc", "slotId": "IiqkGfKO", "sourceItemId": "QtnljrCI"}, {"inventoryId": "ljGbu66L", "slotId": "wtxPbqYa", "sourceItemId": "VVhKn4iV"}], "targetUserId": "T7p7QgKQ", "updateItems": [{"customAttributes": {"IvdP7jg9": {}, "LILt89MS": {}, "SRwOSg2E": {}}, "inventoryId": "EDVU0WSY", "serverCustomAttributes": {"ZLGGYrxe": {}, "i3k6lhts": {}, "GPvcYtTi": {}}, "slotId": "7UqxvxS8", "sourceItemId": "l0ZaVIqG", "tags": ["kTvE8eWk", "V7xsdinm", "VMzHt8s5"], "type": "0ruVPQsJ"}, {"customAttributes": {"tJ336xYV": {}, "99l6A2Bt": {}, "9MmGzLcl": {}}, "inventoryId": "JEP3Tlkj", "serverCustomAttributes": {"Gej3S9G0": {}, "5RpQWzxI": {}, "iJT2SZUH": {}}, "slotId": "w4JGmKuy", "sourceItemId": "FLRDP388", "tags": ["pIfwqMnt", "d0MsvxpA", "5atiXz39"], "type": "oPbkVSeT"}, {"customAttributes": {"PXAT3MPv": {}, "TlFG1lFd": {}, "0fWx13gI": {}}, "inventoryId": "N9cyWzu0", "serverCustomAttributes": {"LVrC2kha": {}, "nFj8Tp0Z": {}, "MPJ4e0Nv": {}}, "slotId": "twPWdB6N", "sourceItemId": "xFIkACck", "tags": ["cRyioTN2", "TRpzpgIr", "8FkjpzFV"], "type": "BqKzzqrj"}]}, {"consumeItems": [{"dateRangeValidation": true, "inventoryId": "mO5X0QZ1", "options": ["QFOjaFEn", "c17qltZR", "BEpKZAho"], "qty": 62, "slotId": "6HGD1mnP", "sourceItemId": "VAXMCQsh"}, {"dateRangeValidation": false, "inventoryId": "BQPW5FFX", "options": ["Ii5FtFLZ", "enq51spE", "YGEROA4K"], "qty": 31, "slotId": "0CHAZFbd", "sourceItemId": "QVR9A1cd"}, {"dateRangeValidation": true, "inventoryId": "MEPPpBEI", "options": ["lvvxuyo0", "g1KW685k", "2JQu8swV"], "qty": 87, "slotId": "VixyRRN4", "sourceItemId": "kPWiul34"}], "createItems": [{"customAttributes": {"PpY6WjID": {}, "aLRgygGP": {}, "MYuvZz1K": {}}, "inventoryConfigurationCode": "WnsMWkf5", "inventoryId": "6tFifbFY", "qty": 23, "serverCustomAttributes": {"JVGroF2m": {}, "L33uIOWm": {}, "4dKG17cd": {}}, "slotId": "N5wnV4lO", "slotUsed": 27, "source": "OTHER", "sourceItemId": "9PG1baW7", "tags": ["OyiV1tgL", "YzGaq19O", "qYhao8UB"], "toSpecificInventory": true, "type": "72wZe9Uu"}, {"customAttributes": {"HP7Bjhe4": {}, "0ozhHRdI": {}, "CG840rus": {}}, "inventoryConfigurationCode": "xQ9TrhRK", "inventoryId": "WqlPzRkq", "qty": 35, "serverCustomAttributes": {"RQVB2OmX": {}, "kMl8Eunh": {}, "3A4tWq2T": {}}, "slotId": "dCvTq2VE", "slotUsed": 68, "source": "OTHER", "sourceItemId": "kEXQRJ0a", "tags": ["YEMNSmol", "t2eej3hN", "bfbxW22r"], "toSpecificInventory": false, "type": "ZjDxSyPm"}, {"customAttributes": {"5FcJTSSB": {}, "sXGGLfv0": {}, "qRTndRs9": {}}, "inventoryConfigurationCode": "Z0CfqX0x", "inventoryId": "blsjS1YH", "qty": 2, "serverCustomAttributes": {"UG1FVI9o": {}, "dOiM4m7x": {}, "4EQXY0f4": {}}, "slotId": "RvgSYunl", "slotUsed": 32, "source": "ECOMMERCE", "sourceItemId": "otBkdBzz", "tags": ["l9IrhBz5", "sxNPgnI8", "GKgS5HYF"], "toSpecificInventory": true, "type": "YoQp5hfq"}], "removeItems": [{"inventoryId": "4i9RteIL", "slotId": "U1chu6cQ", "sourceItemId": "jg8aQ0nr"}, {"inventoryId": "QdC9XoNe", "slotId": "W6JesdzA", "sourceItemId": "qsMx3yT1"}, {"inventoryId": "rUP0Tjfc", "slotId": "PzQm6SEV", "sourceItemId": "kZh9d66m"}], "targetUserId": "5Z7leaKT", "updateItems": [{"customAttributes": {"XTslmrMu": {}, "ePIa3vmn": {}, "Z21PiR0x": {}}, "inventoryId": "oFpumw3U", "serverCustomAttributes": {"3xyBY5wa": {}, "G312joPy": {}, "IKAi95ea": {}}, "slotId": "pW42dkoW", "sourceItemId": "1WQRW79J", "tags": ["cXi6R3m1", "ojHshpgB", "YTRevcHG"], "type": "Mr3LY2yN"}, {"customAttributes": {"SvxsKYEc": {}, "6PGBTLmf": {}, "vZYmk3V0": {}}, "inventoryId": "hfsAgb7U", "serverCustomAttributes": {"sPLgOlbx": {}, "6hW5rOTd": {}, "dbQjqxl3": {}}, "slotId": "Frkk6ytU", "sourceItemId": "6ceOBYsm", "tags": ["0P22Cdlc", "eYfx8umg", "YXaflmgI"], "type": "VxtkVgrx"}, {"customAttributes": {"Sit91xNp": {}, "bowlPBjU": {}, "p26yiKew": {}}, "inventoryId": "uoTNdG8O", "serverCustomAttributes": {"oje2oE2K": {}, "QYG4U3OY": {}, "j5rnO34E": {}}, "slotId": "pHYDwmlu", "sourceItemId": "VaDcMW6w", "tags": ["kWD059zd", "nh7hoSfQ", "WC63c9Xl"], "type": "QXDIotcy"}]}, {"consumeItems": [{"dateRangeValidation": true, "inventoryId": "tdf77gsI", "options": ["F5yXQi4V", "aXDP3uUW", "BXnoSDxj"], "qty": 28, "slotId": "1FXnHezt", "sourceItemId": "iLrQ8Pbj"}, {"dateRangeValidation": false, "inventoryId": "A9i9RQjq", "options": ["9EivFS3F", "I31Qz2lt", "QI7TlEzZ"], "qty": 50, "slotId": "ZiBOC7Y6", "sourceItemId": "YpG10ODA"}, {"dateRangeValidation": true, "inventoryId": "sqdZWfLY", "options": ["LdSFV0by", "x7jNmk8D", "Wvict08q"], "qty": 8, "slotId": "q7A8Hp16", "sourceItemId": "O7U5DWMO"}], "createItems": [{"customAttributes": {"NfeanUfv": {}, "qLxwKbRk": {}, "b5Q7RIh9": {}}, "inventoryConfigurationCode": "CfaguDg2", "inventoryId": "7hPLKlNs", "qty": 37, "serverCustomAttributes": {"01whcL9F": {}, "VVBlGNgO": {}, "cobJBKQI": {}}, "slotId": "8HQTNY8M", "slotUsed": 17, "source": "ECOMMERCE", "sourceItemId": "Z0UFL5S1", "tags": ["d65b2vZt", "YFCtvWez", "6LbgYeOi"], "toSpecificInventory": false, "type": "uewqCuGk"}, {"customAttributes": {"5tZma7G5": {}, "ZjbCSLBB": {}, "qaRy1RUu": {}}, "inventoryConfigurationCode": "IEhmXJz7", "inventoryId": "a32TPsuY", "qty": 27, "serverCustomAttributes": {"iDEPoleb": {}, "bf5FKs1F": {}, "6Rvv4P1f": {}}, "slotId": "PEaV2yIS", "slotUsed": 21, "source": "ECOMMERCE", "sourceItemId": "2PJFwn1P", "tags": ["hMEMRbHP", "mvo6Dqha", "zPfSYmOk"], "toSpecificInventory": true, "type": "OZszCw8y"}, {"customAttributes": {"MLkG2MKL": {}, "tQJBj14d": {}, "bl4WVGN0": {}}, "inventoryConfigurationCode": "mIMdxyaJ", "inventoryId": "70GOBSZQ", "qty": 92, "serverCustomAttributes": {"Kw648L5F": {}, "CHiv8MgM": {}, "4rQf24JB": {}}, "slotId": "klFiqQ3W", "slotUsed": 73, "source": "ECOMMERCE", "sourceItemId": "YM5HV7ze", "tags": ["Ow0zDFrK", "SdhcbdRQ", "YaBzOZQC"], "toSpecificInventory": false, "type": "3tyPADIZ"}], "removeItems": [{"inventoryId": "LLmY4E1o", "slotId": "t4wwWuwA", "sourceItemId": "gVl3rTat"}, {"inventoryId": "S3A2aw9W", "slotId": "YBJAH83U", "sourceItemId": "Im5laJbz"}, {"inventoryId": "Vka6JrU5", "slotId": "o8Zsxcts", "sourceItemId": "XgHGHGZ1"}], "targetUserId": "4D9SdPve", "updateItems": [{"customAttributes": {"XPSeZccz": {}, "fe3wd5eW": {}, "JCG1Yo7Q": {}}, "inventoryId": "UymF0JIe", "serverCustomAttributes": {"UsAAy9dh": {}, "rGmnRHO2": {}, "a3UwSNcP": {}}, "slotId": "zWONMoGn", "sourceItemId": "vUZsWJ8h", "tags": ["S50Y4g1O", "XRAQN4NG", "Iay4RnBG"], "type": "Qbng1OKe"}, {"customAttributes": {"ocswXQnE": {}, "mPzRjT9y": {}, "R1DzMGtr": {}}, "inventoryId": "GyA7Psjj", "serverCustomAttributes": {"tLLKBxuR": {}, "EXH0YmH3": {}, "aVcXWrVN": {}}, "slotId": "NOYH86Vr", "sourceItemId": "GgdvGU3H", "tags": ["7y3oJ3fv", "hH4AjPJv", "jjrBIRgO"], "type": "gfHUhadr"}, {"customAttributes": {"KWaUUAAl": {}, "Te8eqTyC": {}, "Tv6wIawY": {}}, "inventoryId": "oqaKuzqF", "serverCustomAttributes": {"07cV83yB": {}, "76ed1Gpy": {}, "o15VA8Gh": {}}, "slotId": "fziKW0Mx", "sourceItemId": "R4IFtSUv", "tags": ["euaRmCSQ", "C0rEk31v", "nk2V4ppg"], "type": "9ow2oBkP"}]}], "requestId": "A0E9uhcy"}' \
    > test.out 2>&1
eval_tap $? 2 'AdminCreateChainingOperations' test.out

#- 3 AdminListIntegrationConfigurations
./ng net.accelbyte.sdk.cli.Main inventory adminListIntegrationConfigurations \
    --namespace "$AB_NAMESPACE" \
    --limit '52' \
    --offset '9' \
    --sortBy 'createdAt:desc' \
    > test.out 2>&1
eval_tap $? 3 'AdminListIntegrationConfigurations' test.out

#- 4 AdminCreateIntegrationConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminCreateIntegrationConfiguration \
    --namespace "$AB_NAMESPACE" \
    --body '{"mapItemType": ["aYKK6zTh", "tGTbKHWk", "oWsMZhpC"], "serviceName": "2nCvfucA", "targetInventoryCode": "0vWNSemP"}' \
    > test.out 2>&1
eval_tap $? 4 'AdminCreateIntegrationConfiguration' test.out

#- 5 AdminUpdateIntegrationConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateIntegrationConfiguration \
    --integrationConfigurationId 'OHqI4Fag' \
    --namespace "$AB_NAMESPACE" \
    --body '{"mapItemType": ["xFGR9K1J", "1uQsdnJO", "oUptwCoh"], "serviceName": "UAB4Gx00", "targetInventoryCode": "jqBcbNTp"}' \
    > test.out 2>&1
eval_tap $? 5 'AdminUpdateIntegrationConfiguration' test.out

#- 6 AdminUpdateStatusIntegrationConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateStatusIntegrationConfiguration \
    --integrationConfigurationId 'JHTLsTbn' \
    --namespace "$AB_NAMESPACE" \
    --body '{"status": "TIED"}' \
    > test.out 2>&1
eval_tap $? 6 'AdminUpdateStatusIntegrationConfiguration' test.out

#- 7 AdminListInventories
./ng net.accelbyte.sdk.cli.Main inventory adminListInventories \
    --namespace "$AB_NAMESPACE" \
    --inventoryConfigurationCode 'x3BFVKjZ' \
    --limit '31' \
    --offset '73' \
    --sortBy 'inventoryConfigurationCode:desc' \
    --userId 'nzgWJUwD' \
    > test.out 2>&1
eval_tap $? 7 'AdminListInventories' test.out

#- 8 AdminCreateInventory
./ng net.accelbyte.sdk.cli.Main inventory adminCreateInventory \
    --namespace "$AB_NAMESPACE" \
    --body '{"inventoryConfigurationCode": "ZpIDttA5", "userId": "UK95zSw1"}' \
    > test.out 2>&1
eval_tap $? 8 'AdminCreateInventory' test.out

#- 9 AdminGetInventory
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventory \
    --inventoryId 'PS4BSAO4' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'AdminGetInventory' test.out

#- 10 AdminUpdateInventory
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateInventory \
    --inventoryId 'j4kdck22' \
    --namespace "$AB_NAMESPACE" \
    --body '{"incMaxSlots": 59}' \
    > test.out 2>&1
eval_tap $? 10 'AdminUpdateInventory' test.out

#- 11 DeleteInventory
./ng net.accelbyte.sdk.cli.Main inventory deleteInventory \
    --inventoryId 'MdkhT14g' \
    --namespace "$AB_NAMESPACE" \
    --body '{"message": "T7UGu5jf"}' \
    > test.out 2>&1
eval_tap $? 11 'DeleteInventory' test.out

#- 12 AdminListItems
./ng net.accelbyte.sdk.cli.Main inventory adminListItems \
    --inventoryId 'nvuWWMVV' \
    --namespace "$AB_NAMESPACE" \
    --limit '64' \
    --offset '61' \
    --sortBy 'updatedAt:desc' \
    --sourceItemId 'FH3rskSF' \
    --tags 'LhTTwtld' \
    > test.out 2>&1
eval_tap $? 12 'AdminListItems' test.out

#- 13 AdminGetInventoryItem
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventoryItem \
    --inventoryId 'WDNwk9kR' \
    --namespace "$AB_NAMESPACE" \
    --slotId 'rAGwIYn8' \
    --sourceItemId '8tl80iys' \
    > test.out 2>&1
eval_tap $? 13 'AdminGetInventoryItem' test.out

#- 14 AdminListInventoryConfigurations
./ng net.accelbyte.sdk.cli.Main inventory adminListInventoryConfigurations \
    --namespace "$AB_NAMESPACE" \
    --code 'DHCbvCmB' \
    --limit '68' \
    --offset '41' \
    --sortBy 'code:desc' \
    > test.out 2>&1
eval_tap $? 14 'AdminListInventoryConfigurations' test.out

#- 15 AdminCreateInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminCreateInventoryConfiguration \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "8bYuTByw", "description": "qF6AZQhZ", "initialMaxSlots": 69, "maxInstancesPerUser": 53, "maxUpgradeSlots": 90, "name": "UBiIzESH"}' \
    > test.out 2>&1
eval_tap $? 15 'AdminCreateInventoryConfiguration' test.out

#- 16 AdminGetInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventoryConfiguration \
    --inventoryConfigurationId 'c4YghBEa' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'AdminGetInventoryConfiguration' test.out

#- 17 AdminUpdateInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateInventoryConfiguration \
    --inventoryConfigurationId '9iGwt1yZ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "RYqyW9Mb", "description": "DFM7wyVw", "initialMaxSlots": 34, "maxInstancesPerUser": 88, "maxUpgradeSlots": 97, "name": "qxmhfyIK"}' \
    > test.out 2>&1
eval_tap $? 17 'AdminUpdateInventoryConfiguration' test.out

#- 18 AdminDeleteInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteInventoryConfiguration \
    --inventoryConfigurationId 'Z8rXytJA' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminDeleteInventoryConfiguration' test.out

#- 19 AdminListItemTypes
./ng net.accelbyte.sdk.cli.Main inventory adminListItemTypes \
    --namespace "$AB_NAMESPACE" \
    --limit '12' \
    --offset '78' \
    --sortBy 'name' \
    > test.out 2>&1
eval_tap $? 19 'AdminListItemTypes' test.out

#- 20 AdminCreateItemType
./ng net.accelbyte.sdk.cli.Main inventory adminCreateItemType \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "eg85Fj2z"}' \
    > test.out 2>&1
eval_tap $? 20 'AdminCreateItemType' test.out

#- 21 AdminDeleteItemType
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteItemType \
    --itemTypeName 'BCGKNxZq' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'AdminDeleteItemType' test.out

#- 22 AdminListTags
./ng net.accelbyte.sdk.cli.Main inventory adminListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '62' \
    --offset '4' \
    --owner 'Cs9ionke' \
    --sortBy 'name' \
    > test.out 2>&1
eval_tap $? 22 'AdminListTags' test.out

#- 23 AdminCreateTag
./ng net.accelbyte.sdk.cli.Main inventory adminCreateTag \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "mMguJCSe", "owner": "SERVER"}' \
    > test.out 2>&1
eval_tap $? 23 'AdminCreateTag' test.out

#- 24 AdminDeleteTag
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteTag \
    --namespace "$AB_NAMESPACE" \
    --tagName 'COPoSsew' \
    > test.out 2>&1
eval_tap $? 24 'AdminDeleteTag' test.out

#- 25 AdminConsumeUserItem
./ng net.accelbyte.sdk.cli.Main inventory adminConsumeUserItem \
    --inventoryId 'zBCbIlie' \
    --namespace "$AB_NAMESPACE" \
    --userId '8SXVdtiY' \
    --dateRangeValidation 'YZaNciyZ' \
    --body '{"options": ["zfC5QEza", "9YIpxyJO", "RA06HmiU"], "qty": 21, "slotId": "vB8Lv9HF", "sourceItemId": "gWXcMcDY"}' \
    > test.out 2>&1
eval_tap $? 25 'AdminConsumeUserItem' test.out

#- 26 AdminBulkUpdateMyItems
./ng net.accelbyte.sdk.cli.Main inventory adminBulkUpdateMyItems \
    --inventoryId 'tsSCn7aZ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'icyelW1N' \
    --body '[{"customAttributes": {"5W2iuSlS": {}, "54BgyqoA": {}, "G1j9MIfJ": {}}, "serverCustomAttributes": {"lMbPezoZ": {}, "fyoxEhgH": {}, "HN2FcxEa": {}}, "slotId": "r5ivPFYs", "sourceItemId": "mowxVj6x", "tags": ["b7mNyD0Y", "M3sIWSwI", "ARoX2wv5"], "type": "4aeEX3nJ"}, {"customAttributes": {"Xkk8pEtW": {}, "Ou1gbyfF": {}, "h3oga5yJ": {}}, "serverCustomAttributes": {"PIrGVxlb": {}, "LMC3D7a0": {}, "1KVGZjvs": {}}, "slotId": "fFUxFcw0", "sourceItemId": "k3buILKj", "tags": ["I3dZfamj", "8AKayCKC", "KujROkXl"], "type": "TEQKDfdO"}, {"customAttributes": {"GRBv2fYI": {}, "vDt8i7VB": {}, "72UCWWiA": {}}, "serverCustomAttributes": {"RuloZyvw": {}, "EE8B0OTM": {}, "5DuIiov9": {}}, "slotId": "tV1qH3PZ", "sourceItemId": "ailuP4hk", "tags": ["RNzVzhgQ", "4dyJqJPU", "JY8NAeEW"], "type": "RaFISN8I"}]' \
    > test.out 2>&1
eval_tap $? 26 'AdminBulkUpdateMyItems' test.out

#- 27 AdminSaveItemToInventory
./ng net.accelbyte.sdk.cli.Main inventory adminSaveItemToInventory \
    --inventoryId 'DOrq9Y2t' \
    --namespace "$AB_NAMESPACE" \
    --userId 'CWmb7s5I' \
    --body '{"customAttributes": {"AOrBqH54": {}, "sZlHfRPl": {}, "bFI54aFd": {}}, "qty": 88, "serverCustomAttributes": {"sMekjabK": {}, "bHJ3kGR1": {}, "4z3htzhp": {}}, "slotId": "H4vFfRrj", "slotUsed": 90, "source": "OTHER", "sourceItemId": "Hee4OjhC", "tags": ["iT1A09HL", "KofHe2Xu", "lbVFiMeA"], "type": "fP0hqGLJ"}' \
    > test.out 2>&1
eval_tap $? 27 'AdminSaveItemToInventory' test.out

#- 28 AdminBulkRemoveItems
./ng net.accelbyte.sdk.cli.Main inventory adminBulkRemoveItems \
    --inventoryId 'CVLntlr8' \
    --namespace "$AB_NAMESPACE" \
    --userId 'sdvd7VZY' \
    --body '[{"slotId": "TT5a8AUi", "sourceItemId": "DFTVsAJh"}, {"slotId": "xRsOwGqa", "sourceItemId": "B9MriMOp"}, {"slotId": "h3fbmIaS", "sourceItemId": "GVzRcCzy"}]' \
    > test.out 2>&1
eval_tap $? 28 'AdminBulkRemoveItems' test.out

#- 29 AdminBulkSaveItemToInventory
./ng net.accelbyte.sdk.cli.Main inventory adminBulkSaveItemToInventory \
    --inventoryId 'v67iyDSr' \
    --namespace "$AB_NAMESPACE" \
    --userId '36v4gQxC' \
    --body '[{"customAttributes": {"sE3stTBj": {}, "bUD5WQ5x": {}, "OpF0FpkA": {}}, "qty": 70, "serverCustomAttributes": {"kEN0vh6H": {}, "tEyQbnZo": {}, "cbPnrwEZ": {}}, "slotId": "I5dY3frp", "slotUsed": 4, "source": "OTHER", "sourceItemId": "lxTeXUgg", "tags": ["WRU3HmPV", "oCh1cKpg", "sp9dWyVg"], "type": "GUETbxxv"}, {"customAttributes": {"yLcVNmFJ": {}, "i0MHsoDH": {}, "9ZBYeJYu": {}}, "qty": 3, "serverCustomAttributes": {"gaoIHG7X": {}, "lU8taQNQ": {}, "K15Q9Fxs": {}}, "slotId": "khrxo7M4", "slotUsed": 22, "source": "OTHER", "sourceItemId": "sIAbRCWU", "tags": ["Obc4uJY0", "Lj99HAFB", "s5bfQz8o"], "type": "xAvPUdCO"}, {"customAttributes": {"OZs4u2ab": {}, "CAOLTcob": {}, "LHBPs41J": {}}, "qty": 96, "serverCustomAttributes": {"9hX28tuL": {}, "xqgwBx4D": {}, "nwwk2NQD": {}}, "slotId": "9UdEoXUf", "slotUsed": 12, "source": "ECOMMERCE", "sourceItemId": "8IrXijE7", "tags": ["3QCAWYFO", "xxRv6Z5Z", "kA7eIZLk"], "type": "Urg4Ob3v"}]' \
    > test.out 2>&1
eval_tap $? 29 'AdminBulkSaveItemToInventory' test.out

#- 30 AdminUpdateUserInventoriesByInventoryCode
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateUserInventoriesByInventoryCode \
    --inventoryConfigurationCode 'oyQm6JjC' \
    --namespace "$AB_NAMESPACE" \
    --userId 'DvZAHJoa' \
    --body '{"incMaxSlots": 85}' \
    > test.out 2>&1
eval_tap $? 30 'AdminUpdateUserInventoriesByInventoryCode' test.out

#- 31 AdminSaveItem
./ng net.accelbyte.sdk.cli.Main inventory adminSaveItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'Jihg3VGB' \
    --body '{"customAttributes": {"IdbuQaJK": {}, "YisuxCex": {}, "fQZgTgjs": {}}, "inventoryConfigurationCode": "fEFPlKAQ", "qty": 12, "serverCustomAttributes": {"2FKIxGai": {}, "oQ0eKOKh": {}, "f5qCecup": {}}, "slotId": "lVs5t3WN", "slotUsed": 50, "source": "ECOMMERCE", "sourceItemId": "VBuknzv0", "tags": ["xX528FHf", "nTQpsjI9", "1ambRGAZ"], "type": "Sndz8b0o"}' \
    > test.out 2>&1
eval_tap $? 31 'AdminSaveItem' test.out

#- 32 AdminBulkSaveItem
./ng net.accelbyte.sdk.cli.Main inventory adminBulkSaveItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'wb2RE6QR' \
    --body '[{"customAttributes": {"af1YApRC": {}, "YerlBvTa": {}, "fE1nsT3M": {}}, "inventoryConfigurationCode": "qEyPBtyt", "qty": 64, "serverCustomAttributes": {"1wNmjwNU": {}, "NVngiNp6": {}, "x3t8UDhB": {}}, "slotId": "dUxBBXmS", "slotUsed": 52, "source": "OTHER", "sourceItemId": "qtpF7FFi", "tags": ["p0g6TgMP", "mAlCLtQZ", "38Mo2lok"], "type": "ZMKDbODG"}, {"customAttributes": {"hzuvo4f2": {}, "NXjTpLbg": {}, "ynKHnEwv": {}}, "inventoryConfigurationCode": "1XjoMdft", "qty": 38, "serverCustomAttributes": {"9a1LsKzC": {}, "gD0PnoTo": {}, "qP0iQt4H": {}}, "slotId": "86yIu5PK", "slotUsed": 22, "source": "OTHER", "sourceItemId": "d4iWIUT5", "tags": ["86sykDE7", "7652gAyK", "O7l3bW1W"], "type": "K7A2RFGd"}, {"customAttributes": {"GaSuLnC5": {}, "6SMua8os": {}, "QqnczJMd": {}}, "inventoryConfigurationCode": "OrJfyvXz", "qty": 82, "serverCustomAttributes": {"uOTggyHs": {}, "ne8RM1oA": {}, "lwMbMxSN": {}}, "slotId": "3YnuVNjx", "slotUsed": 29, "source": "OTHER", "sourceItemId": "7R0REToL", "tags": ["5PmQDbPL", "4ypRboJH", "Ys53LfEI"], "type": "u39gQ2xm"}]' \
    > test.out 2>&1
eval_tap $? 32 'AdminBulkSaveItem' test.out

#- 33 AdminSyncUserEntitlements
./ng net.accelbyte.sdk.cli.Main inventory adminSyncUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId '3volh4zH' \
    > test.out 2>&1
eval_tap $? 33 'AdminSyncUserEntitlements' test.out

#- 34 AdminPurchasable
./ng net.accelbyte.sdk.cli.Main inventory adminPurchasable \
    --namespace "$AB_NAMESPACE" \
    --userId '6LBjBsDo' \
    --body '{"entitlementType": "l2uq1yYo", "inventoryConfig": {"slotUsed": 34}, "itemId": "g6qed8Hk", "itemType": "pot9hdNX", "items": [{"bundledQty": 28, "entitlementType": "Mz4pJaGG", "inventoryConfig": {"slotUsed": 9}, "itemId": "gzazCH1c", "itemType": "zig8fH5m", "sku": "M4yHG5ze", "stackable": false, "useCount": 59}, {"bundledQty": 16, "entitlementType": "Ex9qhY86", "inventoryConfig": {"slotUsed": 78}, "itemId": "mxfql7IR", "itemType": "dunN05WN", "sku": "GHTVcTdP", "stackable": true, "useCount": 96}, {"bundledQty": 100, "entitlementType": "JlWbRQHg", "inventoryConfig": {"slotUsed": 97}, "itemId": "GtSBYLA7", "itemType": "9qPEbCPz", "sku": "dLLyOxbs", "stackable": true, "useCount": 27}], "quantity": 22, "sku": "Fw4U3VnP", "stackable": false, "useCount": 92}' \
    > test.out 2>&1
eval_tap $? 34 'AdminPurchasable' test.out

#- 35 PublicListInventoryConfigurations
./ng net.accelbyte.sdk.cli.Main inventory publicListInventoryConfigurations \
    --namespace "$AB_NAMESPACE" \
    --code '1cGYSY6X' \
    --limit '53' \
    --offset '68' \
    --sortBy 'code' \
    > test.out 2>&1
eval_tap $? 35 'PublicListInventoryConfigurations' test.out

#- 36 PublicListItemTypes
./ng net.accelbyte.sdk.cli.Main inventory publicListItemTypes \
    --namespace "$AB_NAMESPACE" \
    --limit '66' \
    --offset '4' \
    --sortBy 'createdAt' \
    > test.out 2>&1
eval_tap $? 36 'PublicListItemTypes' test.out

#- 37 PublicListTags
./ng net.accelbyte.sdk.cli.Main inventory publicListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '28' \
    --offset '29' \
    --sortBy 'createdAt' \
    > test.out 2>&1
eval_tap $? 37 'PublicListTags' test.out

#- 38 PublicListInventories
./ng net.accelbyte.sdk.cli.Main inventory publicListInventories \
    --namespace "$AB_NAMESPACE" \
    --inventoryConfigurationCode '4VwOwFlN' \
    --limit '69' \
    --offset '76' \
    --sortBy 'createdAt:desc' \
    > test.out 2>&1
eval_tap $? 38 'PublicListInventories' test.out

#- 39 PublicConsumeMyItem
./ng net.accelbyte.sdk.cli.Main inventory publicConsumeMyItem \
    --inventoryId '7VJQhXIa' \
    --namespace "$AB_NAMESPACE" \
    --body '{"options": ["7fb60fZP", "0sUFBBwR", "Mz3B1wcB"], "qty": 93, "slotId": "wnidqeyH", "sourceItemId": "VpEWTAff"}' \
    > test.out 2>&1
eval_tap $? 39 'PublicConsumeMyItem' test.out

#- 40 PublicListItems
./ng net.accelbyte.sdk.cli.Main inventory publicListItems \
    --inventoryId '62HujzBI' \
    --namespace "$AB_NAMESPACE" \
    --limit '11' \
    --offset '5' \
    --sortBy 'createdAt:desc' \
    --sourceItemId 'CQdF98Mw' \
    --tags 'XILkumog' \
    > test.out 2>&1
eval_tap $? 40 'PublicListItems' test.out

#- 41 PublicBulkUpdateMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicBulkUpdateMyItems \
    --inventoryId 'wWlMbISt' \
    --namespace "$AB_NAMESPACE" \
    --body '[{"customAttributes": {"1xGiE5Lo": {}, "QtOXJV8o": {}, "R2DSPXpr": {}}, "slotId": "5GvXAQfE", "sourceItemId": "b5DianQX", "tags": ["tx4tJ5lT", "0ICXqNl3", "6pGzcci1"]}, {"customAttributes": {"2YPvLJ48": {}, "UlpDkoOw": {}, "SFZpwApG": {}}, "slotId": "2n4HZwxP", "sourceItemId": "C72SHNZZ", "tags": ["hjnODohU", "IYep8YVb", "ArieCrb1"]}, {"customAttributes": {"82rZ0Zz9": {}, "PPuhNfdV": {}, "kKxxiQEd": {}}, "slotId": "yKvBNwPh", "sourceItemId": "gBmDKkj9", "tags": ["pDORXUnI", "1rpy85mj", "RWU5aRcf"]}]' \
    > test.out 2>&1
eval_tap $? 41 'PublicBulkUpdateMyItems' test.out

#- 42 PublicBulkRemoveMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicBulkRemoveMyItems \
    --inventoryId 'PDTLtg8D' \
    --namespace "$AB_NAMESPACE" \
    --body '[{"slotId": "RYsfdgKE", "sourceItemId": "uJFlVN1t"}, {"slotId": "PXNQ1lWB", "sourceItemId": "JbEj69Fk"}, {"slotId": "UtS3gUQT", "sourceItemId": "JhSK1lOD"}]' \
    > test.out 2>&1
eval_tap $? 42 'PublicBulkRemoveMyItems' test.out

#- 43 PublicMoveMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicMoveMyItems \
    --inventoryId 'gziwtAeh' \
    --namespace "$AB_NAMESPACE" \
    --body '{"items": [{"qty": 59, "slotId": "NtsRKlPu", "sourceItemId": "JpKENuEL"}, {"qty": 3, "slotId": "WDbPD3uH", "sourceItemId": "87Og10oS"}, {"qty": 18, "slotId": "AFTrvawS", "sourceItemId": "RjWYy29P"}], "srcInventoryId": "5VVDjTxb"}' \
    > test.out 2>&1
eval_tap $? 43 'PublicMoveMyItems' test.out

#- 44 PublicGetItem
./ng net.accelbyte.sdk.cli.Main inventory publicGetItem \
    --inventoryId 'MN1ZbTS3' \
    --namespace "$AB_NAMESPACE" \
    --slotId 'E1eHM167' \
    --sourceItemId 'iZ75CO4M' \
    > test.out 2>&1
eval_tap $? 44 'PublicGetItem' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
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
    --body '{"message": "CuCUBKbE", "operations": [{"consumeItems": [{"inventoryId": "KDiTp3lr", "qty": 29, "slotId": "jb6OIO1F", "sourceItemId": "MSN7gsqC"}, {"inventoryId": "AUzkPTI8", "qty": 47, "slotId": "ukjEz9NL", "sourceItemId": "2SdjYP3j"}, {"inventoryId": "VS81pP8h", "qty": 62, "slotId": "aCT9OESN", "sourceItemId": "mwuQlLUJ"}], "createItems": [{"customAttributes": {"dQdgzAEa": {}, "pfQHNBaz": {}, "Yrvl2KMX": {}}, "inventoryConfigurationCode": "oDFw35qK", "inventoryId": "2hP4L6LC", "qty": 92, "serverCustomAttributes": {"63VbdmAE": {}, "rD7xaZCb": {}, "RUKcMFQF": {}}, "slotId": "P22umMdr", "slotUsed": 55, "sourceItemId": "MpE1LdZ7", "tags": ["dfcY1mNw", "UIZUbswH", "SnfWDGEW"], "toSpecificInventory": false, "type": "N9AfFDA8"}, {"customAttributes": {"h2OXIubA": {}, "M39cx982": {}, "7B6ToHGX": {}}, "inventoryConfigurationCode": "hyL5iCzt", "inventoryId": "fE1ULk1v", "qty": 69, "serverCustomAttributes": {"QjBtjMMn": {}, "pvHv4sVn": {}, "XfNR99Je": {}}, "slotId": "1RqKqy0P", "slotUsed": 44, "sourceItemId": "scMt53g0", "tags": ["gIdN96cN", "rQ3MGXNe", "NNpq2C8z"], "toSpecificInventory": false, "type": "EKVZfszK"}, {"customAttributes": {"sghXaxIL": {}, "8oIJztqd": {}, "Mp8ivsvA": {}}, "inventoryConfigurationCode": "5Iy3aUpM", "inventoryId": "NB6ravYZ", "qty": 88, "serverCustomAttributes": {"FzJgDOeW": {}, "G7EStxdg": {}, "CzAX5VAU": {}}, "slotId": "tHCBigMX", "slotUsed": 67, "sourceItemId": "V75tH3hi", "tags": ["qP4XAFhN", "pLSYiWal", "tjJ49PYB"], "toSpecificInventory": true, "type": "w7x9gq1L"}], "removeItems": [{"inventoryId": "W2zREOUy", "slotId": "YTbwroZw", "sourceItemId": "Ji0uorsk"}, {"inventoryId": "eDiGfXvh", "slotId": "3jHxb9t5", "sourceItemId": "sWahFcCp"}, {"inventoryId": "5DIUVbsX", "slotId": "I4lhSvmI", "sourceItemId": "QwaMbIOo"}], "targetUserId": "ZogRbEzE", "updateItems": [{"customAttributes": {"MtsJmykX": {}, "UC5lEHHU": {}, "nCUfqKpn": {}}, "inventoryId": "3OgB1pZm", "serverCustomAttributes": {"1R8KSECy": {}, "WBnGKvPA": {}, "FQZdspdW": {}}, "slotId": "isPa5aw8", "sourceItemId": "Xw9E1grI", "tags": ["SfPim00W", "rbZfhNw5", "093xm5Vz"], "type": "A25KsNsP"}, {"customAttributes": {"V6fMHpFk": {}, "CS9yMPxy": {}, "g9Af77FI": {}}, "inventoryId": "jkWwwK3L", "serverCustomAttributes": {"JgKrlwCs": {}, "5vZwGiOh": {}, "7a4okkX4": {}}, "slotId": "GrFq4U8G", "sourceItemId": "pU75bGDq", "tags": ["h8CzZ3F7", "QB2FkEJK", "9NBeac12"], "type": "07FKWA8G"}, {"customAttributes": {"XoOhmZED": {}, "rzrbWitF": {}, "e4VwfgNT": {}}, "inventoryId": "wPJ0ytoH", "serverCustomAttributes": {"cMSpSrzg": {}, "JdFwWPg0": {}, "mNaNjBdx": {}}, "slotId": "bebygdEE", "sourceItemId": "IzskFTot", "tags": ["v7iurOWC", "UaGbphjY", "n2zUo211"], "type": "RyPZmyBq"}]}, {"consumeItems": [{"inventoryId": "egkBbaAf", "qty": 90, "slotId": "jSkG6qwN", "sourceItemId": "SqAry1BV"}, {"inventoryId": "59EBoTqq", "qty": 20, "slotId": "7SuPiQAz", "sourceItemId": "svmvfnvk"}, {"inventoryId": "QWVDMcZX", "qty": 16, "slotId": "viyMXspa", "sourceItemId": "4WZu1WDr"}], "createItems": [{"customAttributes": {"BohRpbdb": {}, "DqrZDg3X": {}, "mzLljbVu": {}}, "inventoryConfigurationCode": "6qqYoUa7", "inventoryId": "9Iw1novh", "qty": 63, "serverCustomAttributes": {"LL6Cyp8W": {}, "gT0YXkw2": {}, "ytj3AQ2Y": {}}, "slotId": "G4LFb0rX", "slotUsed": 0, "sourceItemId": "jt1Ef3i3", "tags": ["o8ejWqRw", "Gg1OBxCY", "zuL3icsC"], "toSpecificInventory": false, "type": "mno4ZDZC"}, {"customAttributes": {"cuwYF2j3": {}, "LadDtIxd": {}, "mdpOjo8Q": {}}, "inventoryConfigurationCode": "OR9mSDiU", "inventoryId": "tnSyeSjF", "qty": 4, "serverCustomAttributes": {"Q4pZ9HbN": {}, "fpnpE3LX": {}, "FlG5MZTM": {}}, "slotId": "6deMVnB4", "slotUsed": 60, "sourceItemId": "nmFBkdWw", "tags": ["tiF4fsVs", "OQNDPoE6", "AQZeoeHb"], "toSpecificInventory": false, "type": "OGaDYZxY"}, {"customAttributes": {"UOZ4rOV6": {}, "JYMXn73t": {}, "WexETOam": {}}, "inventoryConfigurationCode": "ZD3C9w2x", "inventoryId": "KzIHGd3C", "qty": 9, "serverCustomAttributes": {"xKFWss31": {}, "IbEtYAZf": {}, "ONhHrmld": {}}, "slotId": "lcodxOOa", "slotUsed": 0, "sourceItemId": "pmSxRFu3", "tags": ["7X0VWhbv", "UxEhQhAr", "NKdGwn4G"], "toSpecificInventory": false, "type": "VWAgS7I2"}], "removeItems": [{"inventoryId": "iBa131EM", "slotId": "uR0ERgyt", "sourceItemId": "6zqHIfL3"}, {"inventoryId": "vgg6NKw5", "slotId": "3JUmsa9N", "sourceItemId": "0a0RBKG7"}, {"inventoryId": "DSbftSfK", "slotId": "KmYEjXPU", "sourceItemId": "3PQESCPS"}], "targetUserId": "6tNTcP5R", "updateItems": [{"customAttributes": {"lHD5Ntjt": {}, "kj9BNu70": {}, "IlY14NOc": {}}, "inventoryId": "guep5iRt", "serverCustomAttributes": {"F5hhmea6": {}, "ciYK2f9u": {}, "R25J2brA": {}}, "slotId": "8yqrbnXj", "sourceItemId": "e8g5AVIL", "tags": ["4vZlkWcU", "Y0kslN2K", "pJ6twnTY"], "type": "zJSX2oKR"}, {"customAttributes": {"MdKFQHG1": {}, "pSdHqbTx": {}, "9V3nKp6w": {}}, "inventoryId": "T2e7Feoi", "serverCustomAttributes": {"ffc6te2Z": {}, "pnvDxWNJ": {}, "WPMeWJce": {}}, "slotId": "KgpxeWyQ", "sourceItemId": "eRRQgKp9", "tags": ["48Gs7JPD", "xfC83YTD", "ihR6bC72"], "type": "jDLvVsC2"}, {"customAttributes": {"558nSl0V": {}, "umgHKW1m": {}, "B4ZkgTyo": {}}, "inventoryId": "epSGGqEc", "serverCustomAttributes": {"kOLeVKvZ": {}, "E2FWzFY7": {}, "aXqHWeeA": {}}, "slotId": "HnRezqNf", "sourceItemId": "V9Arp85Y", "tags": ["EJABFJYF", "AHOZcaso", "YYZF2iv2"], "type": "e2AWtV3D"}]}, {"consumeItems": [{"inventoryId": "2ewuUY67", "qty": 70, "slotId": "Q6dPnwNr", "sourceItemId": "JE4MyhMz"}, {"inventoryId": "e26BJ024", "qty": 88, "slotId": "ll5ioXYk", "sourceItemId": "Q54PwMmB"}, {"inventoryId": "dNzGq08s", "qty": 91, "slotId": "8ONzwp2R", "sourceItemId": "XBkYGr8J"}], "createItems": [{"customAttributes": {"n0cTBLrv": {}, "cXhwe1E1": {}, "VkCbd5oc": {}}, "inventoryConfigurationCode": "SN2FdklP", "inventoryId": "ncxo0x0J", "qty": 86, "serverCustomAttributes": {"s2xN02C3": {}, "LipWxM8p": {}, "6CJbxuzc": {}}, "slotId": "tfmCfqcq", "slotUsed": 98, "sourceItemId": "tQJ4ua7m", "tags": ["vh2TiQdM", "lMou6z4i", "Ehf9ATks"], "toSpecificInventory": true, "type": "X27932Bv"}, {"customAttributes": {"5tomhMZW": {}, "dVmuNHDp": {}, "1tQYnAwQ": {}}, "inventoryConfigurationCode": "27ZJyUTe", "inventoryId": "BKW9MHXl", "qty": 48, "serverCustomAttributes": {"bfwXVXzm": {}, "aVJ1C21v": {}, "ED6aoLkg": {}}, "slotId": "HV5atTEs", "slotUsed": 0, "sourceItemId": "RNDXgFaO", "tags": ["CmaU9anQ", "Hi9vMgSS", "v7xuepwl"], "toSpecificInventory": true, "type": "nGPcm6sy"}, {"customAttributes": {"vM8QY3mT": {}, "11IyglFg": {}, "GQEq19Hc": {}}, "inventoryConfigurationCode": "t0z9jZlo", "inventoryId": "ohFizG3D", "qty": 19, "serverCustomAttributes": {"0JvZ6BkC": {}, "RQM1NZk2": {}, "mqjVUL8E": {}}, "slotId": "VuX6NwdJ", "slotUsed": 67, "sourceItemId": "YAvGo9cb", "tags": ["wDCbKk6J", "DAvFCUQy", "XWXV8hz8"], "toSpecificInventory": true, "type": "rOYEAfTp"}], "removeItems": [{"inventoryId": "Zj7NVolv", "slotId": "w3An4dOP", "sourceItemId": "Kd5xTdv3"}, {"inventoryId": "q41vGH1x", "slotId": "KnWeBoa6", "sourceItemId": "BBj97nQj"}, {"inventoryId": "3C5q7h4a", "slotId": "GWJlYY13", "sourceItemId": "kX6Doo0Z"}], "targetUserId": "MsoKoJRN", "updateItems": [{"customAttributes": {"YjjqG4HD": {}, "4AOJahEj": {}, "glDFrifv": {}}, "inventoryId": "fFojIfkZ", "serverCustomAttributes": {"0xbtnsm5": {}, "pnviKQE9": {}, "UIboUGP2": {}}, "slotId": "ve0gGtlo", "sourceItemId": "zWdWjFLg", "tags": ["ruSdb8ta", "YwklMDRY", "yJDljcPi"], "type": "2JHpf10Q"}, {"customAttributes": {"EjtaI9VS": {}, "IbH6XKld": {}, "VatXyviv": {}}, "inventoryId": "ylZD6euD", "serverCustomAttributes": {"ZRWn8qsM": {}, "A1ivy5vu": {}, "IK3cpUzA": {}}, "slotId": "yYCtk5bk", "sourceItemId": "290fMPqV", "tags": ["XbC2QwVI", "SvqM224m", "ka29h7KN"], "type": "igJ2mjhz"}, {"customAttributes": {"Sktk4Oo3": {}, "bhImg8tM": {}, "OLhLho11": {}}, "inventoryId": "c6DbpVhh", "serverCustomAttributes": {"0mkQJ6Ls": {}, "dBcCoz3v": {}, "OZx6XFSh": {}}, "slotId": "ddXbnZdh", "sourceItemId": "7EvN6sg0", "tags": ["wYtwq0qz", "wz3TLgN7", "oyFQQvtn"], "type": "9BNvveTY"}]}], "requestId": "4cNj3o6I"}' \
    > test.out 2>&1
eval_tap $? 2 'AdminCreateChainingOperations' test.out

#- 3 AdminListIntegrationConfigurations
./ng net.accelbyte.sdk.cli.Main inventory adminListIntegrationConfigurations \
    --namespace "$AB_NAMESPACE" \
    --limit '58' \
    --offset '79' \
    --sortBy 'createdAt' \
    > test.out 2>&1
eval_tap $? 3 'AdminListIntegrationConfigurations' test.out

#- 4 AdminCreateIntegrationConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminCreateIntegrationConfiguration \
    --namespace "$AB_NAMESPACE" \
    --body '{"mapItemType": ["Z5Rrs11i", "s2Js3qIt", "WcBYCzpT"], "serviceName": "NNuY33KM", "targetInventoryCode": "Asb1E9jV"}' \
    > test.out 2>&1
eval_tap $? 4 'AdminCreateIntegrationConfiguration' test.out

#- 5 AdminUpdateIntegrationConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateIntegrationConfiguration \
    --integrationConfigurationId 'JB6RuV5t' \
    --namespace "$AB_NAMESPACE" \
    --body '{"mapItemType": ["4Oln4h7F", "QqiBEBx4", "Mjx9rjof"], "serviceName": "J8oJJcWG", "targetInventoryCode": "kVci87tB"}' \
    > test.out 2>&1
eval_tap $? 5 'AdminUpdateIntegrationConfiguration' test.out

#- 6 AdminUpdateStatusIntegrationConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateStatusIntegrationConfiguration \
    --integrationConfigurationId 'xcLpulOf' \
    --namespace "$AB_NAMESPACE" \
    --body '{"status": "INIT"}' \
    > test.out 2>&1
eval_tap $? 6 'AdminUpdateStatusIntegrationConfiguration' test.out

#- 7 AdminListInventories
./ng net.accelbyte.sdk.cli.Main inventory adminListInventories \
    --namespace "$AB_NAMESPACE" \
    --inventoryConfigurationCode 'jEz3HKKd' \
    --limit '53' \
    --offset '23' \
    --sortBy 'updatedAt:desc' \
    --userId '0JyPRsHu' \
    > test.out 2>&1
eval_tap $? 7 'AdminListInventories' test.out

#- 8 AdminCreateInventory
./ng net.accelbyte.sdk.cli.Main inventory adminCreateInventory \
    --namespace "$AB_NAMESPACE" \
    --body '{"inventoryConfigurationCode": "iAjxbwoE", "userId": "SJQFYjPC"}' \
    > test.out 2>&1
eval_tap $? 8 'AdminCreateInventory' test.out

#- 9 AdminGetInventory
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventory \
    --inventoryId 'dBgUsVoT' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'AdminGetInventory' test.out

#- 10 AdminUpdateInventory
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateInventory \
    --inventoryId 'XsMH3gNt' \
    --namespace "$AB_NAMESPACE" \
    --body '{"incMaxSlots": 67}' \
    > test.out 2>&1
eval_tap $? 10 'AdminUpdateInventory' test.out

#- 11 DeleteInventory
./ng net.accelbyte.sdk.cli.Main inventory deleteInventory \
    --inventoryId 'KKrJ0efu' \
    --namespace "$AB_NAMESPACE" \
    --body '{"message": "78cgH9WO"}' \
    > test.out 2>&1
eval_tap $? 11 'DeleteInventory' test.out

#- 12 AdminListItems
./ng net.accelbyte.sdk.cli.Main inventory adminListItems \
    --inventoryId 'm2bWOzWN' \
    --namespace "$AB_NAMESPACE" \
    --limit '91' \
    --offset '24' \
    --qtyGte '62' \
    --sortBy 'updatedAt:asc' \
    --sourceItemId 'xu5Y9FHo' \
    --tags 'yo3vblmS' \
    > test.out 2>&1
eval_tap $? 12 'AdminListItems' test.out

#- 13 AdminGetInventoryItem
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventoryItem \
    --inventoryId 'UQzTmkOk' \
    --namespace "$AB_NAMESPACE" \
    --slotId 'TjUSnUrf' \
    --sourceItemId 'OJLdzCfD' \
    > test.out 2>&1
eval_tap $? 13 'AdminGetInventoryItem' test.out

#- 14 AdminListInventoryConfigurations
./ng net.accelbyte.sdk.cli.Main inventory adminListInventoryConfigurations \
    --namespace "$AB_NAMESPACE" \
    --code '29va3Go3' \
    --limit '2' \
    --offset '14' \
    --sortBy 'createdAt:desc' \
    > test.out 2>&1
eval_tap $? 14 'AdminListInventoryConfigurations' test.out

#- 15 AdminCreateInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminCreateInventoryConfiguration \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "movBV0M6", "description": "HzyIrqpy", "initialMaxSlots": 19, "maxInstancesPerUser": 98, "maxUpgradeSlots": 70, "name": "I1CyE9sN"}' \
    > test.out 2>&1
eval_tap $? 15 'AdminCreateInventoryConfiguration' test.out

#- 16 AdminGetInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventoryConfiguration \
    --inventoryConfigurationId 'eOAnqHxz' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'AdminGetInventoryConfiguration' test.out

#- 17 AdminUpdateInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateInventoryConfiguration \
    --inventoryConfigurationId '8Wx3NDvD' \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "7VUxeinb", "description": "3ekyWOR1", "initialMaxSlots": 36, "maxInstancesPerUser": 30, "maxUpgradeSlots": 37, "name": "aifgUIJJ"}' \
    > test.out 2>&1
eval_tap $? 17 'AdminUpdateInventoryConfiguration' test.out

#- 18 AdminDeleteInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteInventoryConfiguration \
    --inventoryConfigurationId 'h7BoYoZ4' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminDeleteInventoryConfiguration' test.out

#- 19 AdminListItemTypes
./ng net.accelbyte.sdk.cli.Main inventory adminListItemTypes \
    --namespace "$AB_NAMESPACE" \
    --limit '74' \
    --offset '18' \
    --sortBy 'name:asc' \
    > test.out 2>&1
eval_tap $? 19 'AdminListItemTypes' test.out

#- 20 AdminCreateItemType
./ng net.accelbyte.sdk.cli.Main inventory adminCreateItemType \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "yqFqNiJi"}' \
    > test.out 2>&1
eval_tap $? 20 'AdminCreateItemType' test.out

#- 21 AdminDeleteItemType
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteItemType \
    --itemTypeName 'NXpw8dUG' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'AdminDeleteItemType' test.out

#- 22 AdminListTags
./ng net.accelbyte.sdk.cli.Main inventory adminListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '85' \
    --offset '92' \
    --owner 'I9GiV6xQ' \
    --sortBy 'name' \
    > test.out 2>&1
eval_tap $? 22 'AdminListTags' test.out

#- 23 AdminCreateTag
./ng net.accelbyte.sdk.cli.Main inventory adminCreateTag \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "8IV1zsQJ", "owner": "SERVER"}' \
    > test.out 2>&1
eval_tap $? 23 'AdminCreateTag' test.out

#- 24 AdminDeleteTag
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteTag \
    --namespace "$AB_NAMESPACE" \
    --tagName 'eq9ZBBB9' \
    > test.out 2>&1
eval_tap $? 24 'AdminDeleteTag' test.out

#- 25 AdminConsumeUserItem
./ng net.accelbyte.sdk.cli.Main inventory adminConsumeUserItem \
    --inventoryId 'fJZ6555e' \
    --namespace "$AB_NAMESPACE" \
    --userId 'p7IfBEeQ' \
    --body '{"qty": 53, "slotId": "ossYnTHq", "sourceItemId": "cFkfFKji"}' \
    > test.out 2>&1
eval_tap $? 25 'AdminConsumeUserItem' test.out

#- 26 AdminBulkUpdateMyItems
./ng net.accelbyte.sdk.cli.Main inventory adminBulkUpdateMyItems \
    --inventoryId 'lvvIN23C' \
    --namespace "$AB_NAMESPACE" \
    --userId 'muAahiLR' \
    --body '[{"customAttributes": {"FlSGTp0i": {}, "AZ8tVDrd": {}, "Y2l65Pem": {}}, "serverCustomAttributes": {"rejyYd4X": {}, "bJIonVqw": {}, "rRiecfBz": {}}, "slotId": "f6GjTPin", "sourceItemId": "3G6c6AS6", "tags": ["PWDRoh8a", "tcRHv9Am", "47FbAiOP"], "type": "RgWo7KfU"}, {"customAttributes": {"eqgq682g": {}, "slkinJgb": {}, "aYOHuy86": {}}, "serverCustomAttributes": {"PA2ZcobA": {}, "r3DppAUM": {}, "CMzfXO1k": {}}, "slotId": "AAfcA74S", "sourceItemId": "B3sc5MFo", "tags": ["GlGYL4rD", "2H3GYOjP", "vu7wcGb6"], "type": "Eup9T7ES"}, {"customAttributes": {"fzb9MzLu": {}, "Szet1ykx": {}, "BPxqYJ4X": {}}, "serverCustomAttributes": {"UEUPgy1L": {}, "4uTjGlKk": {}, "7pCEdijI": {}}, "slotId": "SYGp8Aur", "sourceItemId": "KnVMnrag", "tags": ["gGXzsx29", "eAfNfZYi", "vnFkZZmR"], "type": "hxClG3kC"}]' \
    > test.out 2>&1
eval_tap $? 26 'AdminBulkUpdateMyItems' test.out

#- 27 AdminSaveItemToInventory
./ng net.accelbyte.sdk.cli.Main inventory adminSaveItemToInventory \
    --inventoryId '8dHQlUKs' \
    --namespace "$AB_NAMESPACE" \
    --userId '97e4sZut' \
    --body '{"customAttributes": {"5QJlG4IE": {}, "3HFsUyGw": {}, "2yQ7vOky": {}}, "qty": 23, "serverCustomAttributes": {"yAkvSfrJ": {}, "ZBL4muUB": {}, "mIkpLE1t": {}}, "slotId": "uXMAfkZ1", "slotUsed": 33, "source": "ECOMMERCE", "sourceItemId": "EcJWC8A4", "tags": ["cIaqdihp", "AyIQantl", "oy7dIsEB"], "type": "CmgJLWAu"}' \
    > test.out 2>&1
eval_tap $? 27 'AdminSaveItemToInventory' test.out

#- 28 AdminBulkRemoveItems
./ng net.accelbyte.sdk.cli.Main inventory adminBulkRemoveItems \
    --inventoryId 'uUv50rJM' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ybrt93fs' \
    --body '[{"slotId": "DuiQNjJD", "sourceItemId": "YZ7vJ5ku"}, {"slotId": "1YYvdRj5", "sourceItemId": "IgZKDPGO"}, {"slotId": "4C6hCvXj", "sourceItemId": "i3brrfIC"}]' \
    > test.out 2>&1
eval_tap $? 28 'AdminBulkRemoveItems' test.out

#- 29 AdminSaveItem
./ng net.accelbyte.sdk.cli.Main inventory adminSaveItem \
    --namespace "$AB_NAMESPACE" \
    --userId '1mtT1wIV' \
    --body '{"customAttributes": {"qJub4Yyx": {}, "faP0hlYr": {}, "FkicTmBy": {}}, "inventoryConfigurationCode": "r8tlBFAn", "qty": 96, "serverCustomAttributes": {"T4lllYOk": {}, "xr5mCtrV": {}, "PKDMMNW0": {}}, "slotId": "rZ2D9sjK", "slotUsed": 52, "source": "OTHER", "sourceItemId": "KKex8W09", "tags": ["7JMjERkL", "XOSLSxi2", "ERWnPOMY"], "type": "pT3As66r"}' \
    > test.out 2>&1
eval_tap $? 29 'AdminSaveItem' test.out

#- 30 AdminSyncUserEntitlements
./ng net.accelbyte.sdk.cli.Main inventory adminSyncUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'e13ofDHl' \
    > test.out 2>&1
eval_tap $? 30 'AdminSyncUserEntitlements' test.out

#- 31 AdminPurchasable
./ng net.accelbyte.sdk.cli.Main inventory adminPurchasable \
    --namespace "$AB_NAMESPACE" \
    --userId 'aQ9w7EIu' \
    --body '{"entitlementType": "rGDOFZGt", "inventoryConfig": {"slotUsed": 5}, "itemId": "jJgXSI9O", "itemType": "F8928Jjw", "items": [{"bundledQty": 28, "entitlementType": "n8wiAWo3", "inventoryConfig": {"slotUsed": 66}, "itemId": "MNIqTXik", "itemType": "U87EqsNH", "sku": "ehqZTTeH", "useCount": 44}, {"bundledQty": 71, "entitlementType": "ryRDUTuq", "inventoryConfig": {"slotUsed": 89}, "itemId": "OCzRlAmf", "itemType": "uKGYXaU8", "sku": "iC43NLJW", "useCount": 54}, {"bundledQty": 22, "entitlementType": "cV10q6ZE", "inventoryConfig": {"slotUsed": 16}, "itemId": "3jTLahVd", "itemType": "5ZgLKOxV", "sku": "4qoEPWB9", "useCount": 86}], "quantity": 46, "sku": "KuP0oXRj", "useCount": 18}' \
    > test.out 2>&1
eval_tap $? 31 'AdminPurchasable' test.out

#- 32 PublicListInventoryConfigurations
./ng net.accelbyte.sdk.cli.Main inventory publicListInventoryConfigurations \
    --namespace "$AB_NAMESPACE" \
    --code 'RRk44Twy' \
    --limit '90' \
    --offset '42' \
    --sortBy 'createdAt' \
    > test.out 2>&1
eval_tap $? 32 'PublicListInventoryConfigurations' test.out

#- 33 PublicListItemTypes
./ng net.accelbyte.sdk.cli.Main inventory publicListItemTypes \
    --namespace "$AB_NAMESPACE" \
    --limit '97' \
    --offset '91' \
    --sortBy 'createdAt' \
    > test.out 2>&1
eval_tap $? 33 'PublicListItemTypes' test.out

#- 34 PublicListTags
./ng net.accelbyte.sdk.cli.Main inventory publicListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '9' \
    --offset '90' \
    --sortBy 'createdAt:asc' \
    > test.out 2>&1
eval_tap $? 34 'PublicListTags' test.out

#- 35 PublicListInventories
./ng net.accelbyte.sdk.cli.Main inventory publicListInventories \
    --namespace "$AB_NAMESPACE" \
    --inventoryConfigurationCode 'Ni3zhQrC' \
    --limit '77' \
    --offset '9' \
    --sortBy 'createdAt' \
    > test.out 2>&1
eval_tap $? 35 'PublicListInventories' test.out

#- 36 PublicConsumeMyItem
./ng net.accelbyte.sdk.cli.Main inventory publicConsumeMyItem \
    --inventoryId 'zWBvJZ77' \
    --namespace "$AB_NAMESPACE" \
    --body '{"qty": 77, "slotId": "F40UYw4K", "sourceItemId": "nunhtUpJ"}' \
    > test.out 2>&1
eval_tap $? 36 'PublicConsumeMyItem' test.out

#- 37 PublicListItems
./ng net.accelbyte.sdk.cli.Main inventory publicListItems \
    --inventoryId 'YsfDWvlr' \
    --namespace "$AB_NAMESPACE" \
    --limit '62' \
    --offset '84' \
    --qtyGte '54' \
    --sortBy 'qty:desc' \
    --sourceItemId 'CNa8H9Wv' \
    --tags 'e9hGzrWA' \
    > test.out 2>&1
eval_tap $? 37 'PublicListItems' test.out

#- 38 PublicBulkUpdateMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicBulkUpdateMyItems \
    --inventoryId 'LdZybzus' \
    --namespace "$AB_NAMESPACE" \
    --body '[{"customAttributes": {"p6YsQbll": {}, "QjgbWYXK": {}, "Xg5kLYdp": {}}, "slotId": "VR7EuDz5", "sourceItemId": "bJdYjHoF", "tags": ["c9hQi9mG", "byVw91l0", "d0eTPqYp"]}, {"customAttributes": {"yRpTFMRo": {}, "22lmn5BA": {}, "Szkgv0we": {}}, "slotId": "pJcLyYqC", "sourceItemId": "OF48RwrE", "tags": ["P8COf6j7", "7gJdd0JQ", "spEQwnzI"]}, {"customAttributes": {"4wv7Sxyb": {}, "lChyeiQM": {}, "pzHDyWDG": {}}, "slotId": "xpdZbc1m", "sourceItemId": "oauKaDoM", "tags": ["523tWFx2", "jTYAoGsf", "gtaq5DB2"]}]' \
    > test.out 2>&1
eval_tap $? 38 'PublicBulkUpdateMyItems' test.out

#- 39 PublicBulkRemoveMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicBulkRemoveMyItems \
    --inventoryId '7RWHmwJH' \
    --namespace "$AB_NAMESPACE" \
    --body '[{"slotId": "FdKCczg3", "sourceItemId": "oUfSPUDG"}, {"slotId": "4l5WeJOT", "sourceItemId": "MS04Thw3"}, {"slotId": "aolRxbBS", "sourceItemId": "qepnk05C"}]' \
    > test.out 2>&1
eval_tap $? 39 'PublicBulkRemoveMyItems' test.out

#- 40 PublicMoveMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicMoveMyItems \
    --inventoryId 'bZenQLVl' \
    --namespace "$AB_NAMESPACE" \
    --body '{"items": [{"qty": 18, "slotId": "NI3T08zk", "sourceItemId": "J6tle0k8"}, {"qty": 77, "slotId": "RcwZsqYE", "sourceItemId": "rvEOio7c"}, {"qty": 46, "slotId": "VpFzNqkL", "sourceItemId": "MreCviO0"}], "srcInventoryId": "cENv2ZFX"}' \
    > test.out 2>&1
eval_tap $? 40 'PublicMoveMyItems' test.out

#- 41 PublicGetItem
./ng net.accelbyte.sdk.cli.Main inventory publicGetItem \
    --inventoryId 'coLsVR6Z' \
    --namespace "$AB_NAMESPACE" \
    --slotId 'E26JwZGv' \
    --sourceItemId 'XztteBjj' \
    > test.out 2>&1
eval_tap $? 41 'PublicGetItem' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
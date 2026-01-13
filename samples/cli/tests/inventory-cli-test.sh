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
    --body '{"message": "Nxcg4C9d", "operations": [{"consumeItems": [{"dateRangeValidation": true, "inventoryId": "dbk48rvh", "options": ["YuZeA0mJ", "Iff1MuT9", "9E2vBUxN"], "qty": 18, "slotId": "lPzEKYGs", "sourceItemId": "55avNAGZ"}, {"dateRangeValidation": true, "inventoryId": "CrZZLlTE", "options": ["1Xf52rNG", "wIsGnico", "PrfNhlfP"], "qty": 75, "slotId": "bK6fdvS1", "sourceItemId": "Fs1cU7Mx"}, {"dateRangeValidation": false, "inventoryId": "2jJ5cIPj", "options": ["LWVeiNUp", "ep0BaB6l", "WjmTtxNV"], "qty": 72, "slotId": "BxAvFbpy", "sourceItemId": "4Z1FahRE"}], "createItems": [{"customAttributes": {"i2XJj7Ar": {}, "hLGKSTx4": {}, "YZ7lYKtZ": {}}, "inventoryConfigurationCode": "OUw4ho9B", "inventoryId": "2f0ctjod", "qty": 84, "serverCustomAttributes": {"eDm9qQrn": {}, "SbZBHewa": {}, "PPRTkSVx": {}}, "slotId": "6U5uupdf", "slotUsed": 47, "source": "OTHER", "sourceItemId": "Px46ewYc", "tags": ["FMUDCpNL", "ScstsNhX", "86MGfyE9"], "toSpecificInventory": true, "type": "OW79f1He"}, {"customAttributes": {"DSNTEqTK": {}, "jFTzXyK2": {}, "kRk5TLAs": {}}, "inventoryConfigurationCode": "TxV2i8rk", "inventoryId": "wssDRo6j", "qty": 59, "serverCustomAttributes": {"e7wxNv1D": {}, "zDSf1VM2": {}, "cn3cMSEg": {}}, "slotId": "flsmeSeU", "slotUsed": 58, "source": "ECOMMERCE", "sourceItemId": "SthAfqnl", "tags": ["5rZCMsxH", "upLfETZf", "RtQd7jRK"], "toSpecificInventory": false, "type": "cmkGQhjD"}, {"customAttributes": {"rNzUJh2j": {}, "2W2Ymrt8": {}, "9uMqj1Cs": {}}, "inventoryConfigurationCode": "0j9bz2dE", "inventoryId": "FdGE7ryR", "qty": 32, "serverCustomAttributes": {"djrTbdYm": {}, "L5WIMxLn": {}, "Ktplmk7X": {}}, "slotId": "JYfDPOUZ", "slotUsed": 73, "source": "ECOMMERCE", "sourceItemId": "AxFm2WPC", "tags": ["EdkWqf5c", "YfSsxKZi", "js60WViI"], "toSpecificInventory": true, "type": "bIPE8X9a"}], "removeItems": [{"inventoryId": "ZGo64lrs", "slotId": "oSeEVCyV", "sourceItemId": "dxgjFe40"}, {"inventoryId": "EdD0tXqM", "slotId": "JFtKNcGj", "sourceItemId": "9X1qZkbs"}, {"inventoryId": "p4B8lijV", "slotId": "3S8uIKJ8", "sourceItemId": "SgbKv6Cm"}], "targetUserId": "0K0euAcS", "updateItems": [{"customAttributes": {"6cNXSTxO": {}, "TlOIW61y": {}, "Zwy6ALaZ": {}}, "inventoryId": "h0tckdNX", "serverCustomAttributes": {"E2Urhay1": {}, "10W2lAsQ": {}, "6XwbNkP9": {}}, "slotId": "LvnYqq9f", "sourceItemId": "eg2Lzpv4", "tags": ["gB9oUPnZ", "XRTLK2RR", "AniBXM4R"], "type": "4Ony4CP8"}, {"customAttributes": {"ibCG11le": {}, "PfL3dvDf": {}, "WnqTPa7U": {}}, "inventoryId": "FCbQI1lC", "serverCustomAttributes": {"6HNLCoCM": {}, "y6wkQbzG": {}, "K6FL4l6z": {}}, "slotId": "DvRVLsKc", "sourceItemId": "U6meaGBm", "tags": ["mMIH3T0q", "6Pa97RAA", "ZPbiphyv"], "type": "6HEF0qXN"}, {"customAttributes": {"KJ4BWpL2": {}, "5q2kDZ3u": {}, "LikhGlQz": {}}, "inventoryId": "cMe7txuY", "serverCustomAttributes": {"YIwpw81w": {}, "fFXcE6RT": {}, "AhMDe95J": {}}, "slotId": "6VyL0oAd", "sourceItemId": "Rc0IVk0c", "tags": ["sXUslr3V", "yjnZD4UJ", "NTdqU7cW"], "type": "G0AcaQfE"}]}, {"consumeItems": [{"dateRangeValidation": false, "inventoryId": "mTCGP30J", "options": ["VuCBQ8ho", "Aqpi4msP", "rEPcZFMR"], "qty": 65, "slotId": "yiQsj6Y7", "sourceItemId": "emEyOHAI"}, {"dateRangeValidation": false, "inventoryId": "jZmVth31", "options": ["k8zHcSsg", "CdVakUcL", "qM8BSMHs"], "qty": 79, "slotId": "V1m36NzP", "sourceItemId": "NnwtoQu5"}, {"dateRangeValidation": true, "inventoryId": "A9hdwIym", "options": ["TD16D69A", "nh5qpO5m", "RbNhPUDL"], "qty": 65, "slotId": "nAUmHhNW", "sourceItemId": "Nq1ZCJtv"}], "createItems": [{"customAttributes": {"iQ2MIOTD": {}, "pyAKvtw2": {}, "ebfFixX5": {}}, "inventoryConfigurationCode": "P104cMfT", "inventoryId": "06tYnxOh", "qty": 27, "serverCustomAttributes": {"jk6wj2L5": {}, "iWiQ73um": {}, "AKA0Uccp": {}}, "slotId": "wT5svu7s", "slotUsed": 15, "source": "OTHER", "sourceItemId": "2nBOzC4P", "tags": ["uFwJLKIA", "1voi53FZ", "Vv1z0caw"], "toSpecificInventory": true, "type": "Ftgnptia"}, {"customAttributes": {"gzDts3FE": {}, "zBQo5EpE": {}, "1aDiIZhS": {}}, "inventoryConfigurationCode": "9D1SGtTm", "inventoryId": "T4DuDo3w", "qty": 43, "serverCustomAttributes": {"77el0Oyb": {}, "rczuv0o5": {}, "XQng2aGm": {}}, "slotId": "o5YLtFaN", "slotUsed": 70, "source": "ECOMMERCE", "sourceItemId": "lASGvm1T", "tags": ["7AtxOHKM", "ePFD1Ez0", "rqR8SiEr"], "toSpecificInventory": false, "type": "x42CQUKJ"}, {"customAttributes": {"6i4FqzRd": {}, "ekPaTeeS": {}, "PG3uCU4V": {}}, "inventoryConfigurationCode": "KySJzTiW", "inventoryId": "smdS7dgl", "qty": 58, "serverCustomAttributes": {"dPOMJOvL": {}, "uJQo7ohW": {}, "k5lZ5tf0": {}}, "slotId": "eb0ZC4xF", "slotUsed": 44, "source": "ECOMMERCE", "sourceItemId": "UOsHcddP", "tags": ["TOTwiAUu", "LaIl7GJj", "5pQsJAN5"], "toSpecificInventory": false, "type": "mgOUKijx"}], "removeItems": [{"inventoryId": "npVP2rhX", "slotId": "Rruz33QW", "sourceItemId": "l3h7WpJc"}, {"inventoryId": "Ar9Lp80j", "slotId": "c9GoJkH1", "sourceItemId": "TYLxVsl9"}, {"inventoryId": "NxVdEGgJ", "slotId": "ObrHwQxU", "sourceItemId": "tIjFffZY"}], "targetUserId": "2I7LL4tC", "updateItems": [{"customAttributes": {"lmHpZxf1": {}, "zBocKhU6": {}, "fvqOWUoB": {}}, "inventoryId": "REGPRruy", "serverCustomAttributes": {"0oHQKXl1": {}, "S20WwWaj": {}, "bZPTLT2h": {}}, "slotId": "bs0yEWn6", "sourceItemId": "GjfhoppX", "tags": ["AFUNYTOb", "jZDd2WaP", "OQlamhFn"], "type": "lg44hfze"}, {"customAttributes": {"bkbLSf9P": {}, "MjfLoiKU": {}, "4Ie4GBlX": {}}, "inventoryId": "Q2HI20CH", "serverCustomAttributes": {"C4ThkLXh": {}, "WllAWNB6": {}, "vd2ebxXZ": {}}, "slotId": "CHJV0gSi", "sourceItemId": "1mt0jfuc", "tags": ["nlbzCq7Q", "M4QantcV", "gXgi24TT"], "type": "s3eKcH3K"}, {"customAttributes": {"qnjZat7W": {}, "lYbqV50u": {}, "mAWayjbO": {}}, "inventoryId": "zlPuGcCO", "serverCustomAttributes": {"KVk81WCB": {}, "MJscs4ak": {}, "4fDxrkCN": {}}, "slotId": "gXhqpEa5", "sourceItemId": "gd372B7I", "tags": ["Yak6oWJE", "P05DyxOa", "KH4VTeZm"], "type": "NZ5fZ22u"}]}, {"consumeItems": [{"dateRangeValidation": false, "inventoryId": "duhFRTRs", "options": ["Bnq7QtRe", "ysbrMjln", "Wtt5EvyW"], "qty": 20, "slotId": "TMVzPrDp", "sourceItemId": "nfYJAdGZ"}, {"dateRangeValidation": false, "inventoryId": "CuKl250d", "options": ["0UE7MGZL", "AG6OOCCi", "YMNdcWmx"], "qty": 100, "slotId": "SzGgFkcE", "sourceItemId": "mua6rTpB"}, {"dateRangeValidation": true, "inventoryId": "WBWZ9WEA", "options": ["ypSqrMA3", "gpZYefqG", "8fYQx2s0"], "qty": 70, "slotId": "oFejdZmL", "sourceItemId": "Xp5ZoM5h"}], "createItems": [{"customAttributes": {"UeRaZm8N": {}, "PF9DGc9O": {}, "rkuqqAhd": {}}, "inventoryConfigurationCode": "pF2xbMDc", "inventoryId": "rWjZkgO2", "qty": 20, "serverCustomAttributes": {"6RHUupaG": {}, "86IilMAd": {}, "Os14A7RX": {}}, "slotId": "1CrBcHMf", "slotUsed": 74, "source": "ECOMMERCE", "sourceItemId": "FvxdSk4g", "tags": ["j0PtwKSe", "nQXShIvQ", "ry33VTUF"], "toSpecificInventory": true, "type": "Tt8YV87f"}, {"customAttributes": {"EGvdSAcw": {}, "tmJHalID": {}, "kiad2Us6": {}}, "inventoryConfigurationCode": "mfibukgn", "inventoryId": "ecKo0wTt", "qty": 3, "serverCustomAttributes": {"2MlzgmGU": {}, "KJskrw1B": {}, "HQCqsWt3": {}}, "slotId": "2gbjqrcP", "slotUsed": 55, "source": "ECOMMERCE", "sourceItemId": "Asqhbkmg", "tags": ["ijklZFi0", "LIqiqog4", "KJfMyJu7"], "toSpecificInventory": true, "type": "S14kr0b1"}, {"customAttributes": {"ut8MJFTu": {}, "04SkNLef": {}, "m8Dt6xWX": {}}, "inventoryConfigurationCode": "2LE2MnuY", "inventoryId": "WmgjTPuV", "qty": 19, "serverCustomAttributes": {"3YwLWEsn": {}, "1szOUPS5": {}, "pApw8oaq": {}}, "slotId": "vuLS0crf", "slotUsed": 83, "source": "OTHER", "sourceItemId": "7IXJrW7z", "tags": ["F9AsoWBh", "wttQA48s", "59hf5fWu"], "toSpecificInventory": false, "type": "exzooKKw"}], "removeItems": [{"inventoryId": "HQ5yqcnI", "slotId": "lfxwHKf2", "sourceItemId": "pHi3vxpp"}, {"inventoryId": "PxbgQyYi", "slotId": "g7s8rDrw", "sourceItemId": "VOb4FoIV"}, {"inventoryId": "QDa3PbiQ", "slotId": "A1cLrqdG", "sourceItemId": "1p7lfBIV"}], "targetUserId": "YXw4pQP4", "updateItems": [{"customAttributes": {"m1QwQcYx": {}, "BpyxEGd8": {}, "2nLek8ds": {}}, "inventoryId": "miaXfP8M", "serverCustomAttributes": {"cmHoj9ft": {}, "7M5aJriX": {}, "z8MHKpqZ": {}}, "slotId": "qt2jTW8Z", "sourceItemId": "MTnseyX8", "tags": ["LF84WCFC", "K2L8sslZ", "Tg9aL0gA"], "type": "xfpHIOiW"}, {"customAttributes": {"RvieWHDO": {}, "CSVTmUcP": {}, "jojteorm": {}}, "inventoryId": "8wV7fgAT", "serverCustomAttributes": {"FUbh30nN": {}, "hXedxxkp": {}, "UpdiDDfn": {}}, "slotId": "7rfoOqPj", "sourceItemId": "xfrNNqbW", "tags": ["r29CloWq", "Bx2aKeLs", "uHNSv0VP"], "type": "AZpr6B29"}, {"customAttributes": {"3GO1iq3i": {}, "i87jkmuy": {}, "Y4Tmfodu": {}}, "inventoryId": "8GWkJbDH", "serverCustomAttributes": {"6LF8jYo2": {}, "3mQsNY8n": {}, "GphD7ZmX": {}}, "slotId": "nsVWA5CL", "sourceItemId": "H4WXk8ye", "tags": ["OwhRHKLW", "hwuPNlpx", "y3aPvGxF"], "type": "2pAvYEbi"}]}], "requestId": "uVBKp1wT"}' \
    > test.out 2>&1
eval_tap $? 2 'AdminCreateChainingOperations' test.out

#- 3 AdminListIntegrationConfigurations
./ng net.accelbyte.sdk.cli.Main inventory adminListIntegrationConfigurations \
    --namespace "$AB_NAMESPACE" \
    --limit '54' \
    --offset '38' \
    --sortBy 'createdAt:desc' \
    > test.out 2>&1
eval_tap $? 3 'AdminListIntegrationConfigurations' test.out

#- 4 AdminCreateIntegrationConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminCreateIntegrationConfiguration \
    --namespace "$AB_NAMESPACE" \
    --body '{"mapItemType": ["F33Oq4Sx", "10IsE4dp", "1ZFmKYQ7"], "serviceName": "Rj1slXu2", "targetInventoryCode": "34bgHtWY"}' \
    > test.out 2>&1
eval_tap $? 4 'AdminCreateIntegrationConfiguration' test.out

#- 5 AdminUpdateIntegrationConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateIntegrationConfiguration \
    --integrationConfigurationId 'amuSpXq5' \
    --namespace "$AB_NAMESPACE" \
    --body '{"mapItemType": ["PFUcKVrj", "KJUDvVag", "cbXqh9oZ"], "serviceName": "MfQb0Ndw", "targetInventoryCode": "zLCAqvlm"}' \
    > test.out 2>&1
eval_tap $? 5 'AdminUpdateIntegrationConfiguration' test.out

#- 6 AdminUpdateStatusIntegrationConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateStatusIntegrationConfiguration \
    --integrationConfigurationId 'MtPg3tG2' \
    --namespace "$AB_NAMESPACE" \
    --body '{"status": "TIED"}' \
    > test.out 2>&1
eval_tap $? 6 'AdminUpdateStatusIntegrationConfiguration' test.out

#- 7 AdminListInventories
./ng net.accelbyte.sdk.cli.Main inventory adminListInventories \
    --namespace "$AB_NAMESPACE" \
    --inventoryConfigurationCode 'DO9m4JCR' \
    --limit '42' \
    --offset '75' \
    --sortBy 'createdAt:asc' \
    --userId 'aC7gRtom' \
    > test.out 2>&1
eval_tap $? 7 'AdminListInventories' test.out

#- 8 AdminCreateInventory
./ng net.accelbyte.sdk.cli.Main inventory adminCreateInventory \
    --namespace "$AB_NAMESPACE" \
    --body '{"inventoryConfigurationCode": "wGCMQKZg", "userId": "nZkhEVD2"}' \
    > test.out 2>&1
eval_tap $? 8 'AdminCreateInventory' test.out

#- 9 AdminGetInventory
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventory \
    --inventoryId '3TaSw3RL' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'AdminGetInventory' test.out

#- 10 AdminUpdateInventory
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateInventory \
    --inventoryId 'rcyews3e' \
    --namespace "$AB_NAMESPACE" \
    --body '{"incMaxSlots": 59}' \
    > test.out 2>&1
eval_tap $? 10 'AdminUpdateInventory' test.out

#- 11 DeleteInventory
./ng net.accelbyte.sdk.cli.Main inventory deleteInventory \
    --inventoryId '7VpG3jmh' \
    --namespace "$AB_NAMESPACE" \
    --body '{"message": "qvGQC6XH"}' \
    > test.out 2>&1
eval_tap $? 11 'DeleteInventory' test.out

#- 12 AdminListItems
./ng net.accelbyte.sdk.cli.Main inventory adminListItems \
    --inventoryId 'jtsLmJBG' \
    --namespace "$AB_NAMESPACE" \
    --limit '12' \
    --offset '66' \
    --sortBy 'createdAt:desc' \
    --sourceItemId '0kHmwi2p' \
    --tags 'fYzlwID4' \
    > test.out 2>&1
eval_tap $? 12 'AdminListItems' test.out

#- 13 AdminGetInventoryItem
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventoryItem \
    --inventoryId 'raHkQCWP' \
    --namespace "$AB_NAMESPACE" \
    --slotId 'lbX3i3yi' \
    --sourceItemId 'SKwzB3R4' \
    > test.out 2>&1
eval_tap $? 13 'AdminGetInventoryItem' test.out

#- 14 AdminListInventoryConfigurations
./ng net.accelbyte.sdk.cli.Main inventory adminListInventoryConfigurations \
    --namespace "$AB_NAMESPACE" \
    --code '0xuiYOJU' \
    --limit '87' \
    --offset '81' \
    --sortBy 'code:asc' \
    > test.out 2>&1
eval_tap $? 14 'AdminListInventoryConfigurations' test.out

#- 15 AdminCreateInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminCreateInventoryConfiguration \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "LMQvfQt0", "description": "rWj40WdD", "initialMaxSlots": 97, "maxInstancesPerUser": 46, "maxUpgradeSlots": 5, "name": "QWyzywu2"}' \
    > test.out 2>&1
eval_tap $? 15 'AdminCreateInventoryConfiguration' test.out

#- 16 AdminGetInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventoryConfiguration \
    --inventoryConfigurationId '2tZl80A2' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'AdminGetInventoryConfiguration' test.out

#- 17 AdminUpdateInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateInventoryConfiguration \
    --inventoryConfigurationId 'JPOYbXJp' \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "6gSuIsNe", "description": "sZOOBvff", "initialMaxSlots": 54, "maxInstancesPerUser": 85, "maxUpgradeSlots": 58, "name": "sZrl7Omn"}' \
    > test.out 2>&1
eval_tap $? 17 'AdminUpdateInventoryConfiguration' test.out

#- 18 AdminDeleteInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteInventoryConfiguration \
    --inventoryConfigurationId 'PNABfJ5P' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminDeleteInventoryConfiguration' test.out

#- 19 AdminListItemTypes
./ng net.accelbyte.sdk.cli.Main inventory adminListItemTypes \
    --namespace "$AB_NAMESPACE" \
    --limit '46' \
    --offset '64' \
    --sortBy 'createdAt' \
    > test.out 2>&1
eval_tap $? 19 'AdminListItemTypes' test.out

#- 20 AdminCreateItemType
./ng net.accelbyte.sdk.cli.Main inventory adminCreateItemType \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "FRp1AA14"}' \
    > test.out 2>&1
eval_tap $? 20 'AdminCreateItemType' test.out

#- 21 AdminDeleteItemType
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteItemType \
    --itemTypeName 'y0g8TKvR' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'AdminDeleteItemType' test.out

#- 22 AdminListTags
./ng net.accelbyte.sdk.cli.Main inventory adminListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '29' \
    --offset '62' \
    --owner 'hohMHyPM' \
    --sortBy 'createdAt:desc' \
    > test.out 2>&1
eval_tap $? 22 'AdminListTags' test.out

#- 23 AdminCreateTag
./ng net.accelbyte.sdk.cli.Main inventory adminCreateTag \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "06KizJLX", "owner": "CLIENT"}' \
    > test.out 2>&1
eval_tap $? 23 'AdminCreateTag' test.out

#- 24 AdminDeleteTag
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteTag \
    --namespace "$AB_NAMESPACE" \
    --tagName 'NkO0OgQM' \
    > test.out 2>&1
eval_tap $? 24 'AdminDeleteTag' test.out

#- 25 AdminConsumeUserItem
./ng net.accelbyte.sdk.cli.Main inventory adminConsumeUserItem \
    --inventoryId 'pCWBINGD' \
    --namespace "$AB_NAMESPACE" \
    --userId 'l01CjDKf' \
    --dateRangeValidation 'vBNRwMSH' \
    --body '{"options": ["e1YtnquQ", "dFnl3l6K", "Z6oGFdAK"], "qty": 16, "slotId": "v7HaZNU6", "sourceItemId": "LxT0OI1s"}' \
    > test.out 2>&1
eval_tap $? 25 'AdminConsumeUserItem' test.out

#- 26 AdminBulkUpdateMyItems
./ng net.accelbyte.sdk.cli.Main inventory adminBulkUpdateMyItems \
    --inventoryId 'QaxNfMYg' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ATmeDmPl' \
    --body '[{"customAttributes": {"POT7luRE": {}, "JKhgUSJE": {}, "nCuclrzc": {}}, "serverCustomAttributes": {"iYJ0d0rX": {}, "UDvuzT3E": {}, "HSW6kqIy": {}}, "slotId": "aI1D4FBh", "sourceItemId": "nebM3ZgB", "tags": ["ZYksOGoa", "xJUjlZCv", "wfmefDr3"], "type": "LRvDKn1G"}, {"customAttributes": {"cIK3VJ6I": {}, "Q8wI4Xem": {}, "AVzWTfCi": {}}, "serverCustomAttributes": {"kFYd7FpZ": {}, "dTKESmF8": {}, "QmZS24M4": {}}, "slotId": "deTZs1Yl", "sourceItemId": "Td0miHBl", "tags": ["btg6RetR", "jQnrPoXf", "EgnY9MVO"], "type": "gQLyNvZ4"}, {"customAttributes": {"mCFZaSih": {}, "YIZzT3qU": {}, "h2WYkzY7": {}}, "serverCustomAttributes": {"cL7yugoK": {}, "5I4JwD7M": {}, "iObo94Qo": {}}, "slotId": "qsXnE6v5", "sourceItemId": "1myCsMnd", "tags": ["INIjcPeK", "73vSxT3G", "8Bi9uIf9"], "type": "yoBO7nJe"}]' \
    > test.out 2>&1
eval_tap $? 26 'AdminBulkUpdateMyItems' test.out

#- 27 AdminSaveItemToInventory
./ng net.accelbyte.sdk.cli.Main inventory adminSaveItemToInventory \
    --inventoryId 'XyiDh0iX' \
    --namespace "$AB_NAMESPACE" \
    --userId 'xzwGEIrR' \
    --body '{"customAttributes": {"TtUai6gs": {}, "0aeqMYjk": {}, "imbyQNlg": {}}, "qty": 97, "serverCustomAttributes": {"tNTkhhlJ": {}, "XVz5hMI9": {}, "Qg5Ld5YW": {}}, "slotId": "y5vxMf7j", "slotUsed": 31, "source": "ECOMMERCE", "sourceItemId": "VF0fkECE", "tags": ["5kMhvmz7", "P0A4vt7v", "lXAn48GX"], "type": "v5cAG2A8"}' \
    > test.out 2>&1
eval_tap $? 27 'AdminSaveItemToInventory' test.out

#- 28 AdminBulkRemoveItems
./ng net.accelbyte.sdk.cli.Main inventory adminBulkRemoveItems \
    --inventoryId 'uaitLycb' \
    --namespace "$AB_NAMESPACE" \
    --userId 'g6UULPEc' \
    --body '[{"slotId": "MdaSBPKe", "sourceItemId": "KmH5cVRI"}, {"slotId": "RW3ESEhk", "sourceItemId": "BDZEDdXL"}, {"slotId": "OL6XzkXe", "sourceItemId": "yCfHeCft"}]' \
    > test.out 2>&1
eval_tap $? 28 'AdminBulkRemoveItems' test.out

#- 29 AdminBulkSaveItemToInventory
./ng net.accelbyte.sdk.cli.Main inventory adminBulkSaveItemToInventory \
    --inventoryId 'yEzSCYai' \
    --namespace "$AB_NAMESPACE" \
    --userId 'UwIBFYSE' \
    --body '[{"customAttributes": {"14Ee0A9a": {}, "tc5oYpx5": {}, "aj7HxRBp": {}}, "qty": 95, "serverCustomAttributes": {"G53gecQs": {}, "9ogCFFf0": {}, "JJMiZMvB": {}}, "slotId": "L5wiSfJq", "slotUsed": 57, "source": "ECOMMERCE", "sourceItemId": "aaGyYfkf", "tags": ["gIA4WfAZ", "FbBVEQpo", "ZidCRusL"], "type": "7BxUL6uP"}, {"customAttributes": {"V9tUJ0Dk": {}, "qV6Q6XD3": {}, "UaSesxic": {}}, "qty": 18, "serverCustomAttributes": {"rH35hSAz": {}, "iCOrQRip": {}, "s02oc1Bn": {}}, "slotId": "19VvcF4F", "slotUsed": 21, "source": "ECOMMERCE", "sourceItemId": "aLVGuHZy", "tags": ["v251LGbx", "GLX6kIsx", "PKprxGe7"], "type": "evu8w5hm"}, {"customAttributes": {"bkhtV8LN": {}, "ugvP9o1G": {}, "ojTKti4Z": {}}, "qty": 29, "serverCustomAttributes": {"DhWrWH6I": {}, "xTDZ8div": {}, "J0jsK4h0": {}}, "slotId": "Cwr5Bzop", "slotUsed": 26, "source": "ECOMMERCE", "sourceItemId": "nQJBUSej", "tags": ["TmFpRAQv", "53CBNp7z", "aNkswT9d"], "type": "RdmKzFz4"}]' \
    > test.out 2>&1
eval_tap $? 29 'AdminBulkSaveItemToInventory' test.out

#- 30 AdminUpdateUserInventoriesByInventoryCode
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateUserInventoriesByInventoryCode \
    --inventoryConfigurationCode 'VY7aLruO' \
    --namespace "$AB_NAMESPACE" \
    --userId 'gwM4baPi' \
    --body '{"incMaxSlots": 8}' \
    > test.out 2>&1
eval_tap $? 30 'AdminUpdateUserInventoriesByInventoryCode' test.out

#- 31 AdminSaveItem
./ng net.accelbyte.sdk.cli.Main inventory adminSaveItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'yfM2QSxr' \
    --body '{"customAttributes": {"55OeMOwN": {}, "6cmlJ4kY": {}, "Y9UomgBd": {}}, "inventoryConfigurationCode": "KBT9DW8Z", "qty": 93, "serverCustomAttributes": {"L5Xx6gzc": {}, "XEajRkc8": {}, "D7seq89M": {}}, "slotId": "DNGh1Prr", "slotUsed": 60, "source": "ECOMMERCE", "sourceItemId": "6agXd6EX", "tags": ["vaAGeOpA", "juP5H5VJ", "UA5CNhzQ"], "type": "Iy2DOIb6"}' \
    > test.out 2>&1
eval_tap $? 31 'AdminSaveItem' test.out

#- 32 AdminBulkSaveItem
./ng net.accelbyte.sdk.cli.Main inventory adminBulkSaveItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'k3X2x6IW' \
    --body '[{"customAttributes": {"sIOAZom4": {}, "rHhN5HsH": {}, "tZUoPNAN": {}}, "inventoryConfigurationCode": "ZMtcuL0a", "qty": 61, "serverCustomAttributes": {"34AGNokN": {}, "lVtykqH0": {}, "2uYKBCqR": {}}, "slotId": "3Q0IhQ90", "slotUsed": 11, "source": "OTHER", "sourceItemId": "CbxCx9Q1", "tags": ["zfL0I98D", "WbdTdnIE", "O8I8djse"], "type": "RC8cgwUC"}, {"customAttributes": {"CSKexWms": {}, "paD6suEn": {}, "CI8nK1l8": {}}, "inventoryConfigurationCode": "3pMm5v58", "qty": 56, "serverCustomAttributes": {"Rrwjm5Kt": {}, "hciAIN1V": {}, "e29a9gmQ": {}}, "slotId": "OvPnSeJN", "slotUsed": 44, "source": "OTHER", "sourceItemId": "DfG1rxHE", "tags": ["XYIcE9ah", "YqUh6rkF", "TUvaghB6"], "type": "RjcfZKh8"}, {"customAttributes": {"efaFfU8B": {}, "OH9Z63ZU": {}, "TjPRTGn5": {}}, "inventoryConfigurationCode": "bU6Htych", "qty": 73, "serverCustomAttributes": {"PAu8wzjM": {}, "EVUJDsrD": {}, "vM5jHDEz": {}}, "slotId": "Moy3phnT", "slotUsed": 70, "source": "OTHER", "sourceItemId": "JZu7ntJ9", "tags": ["CZGEdvRE", "v0ZTiC3U", "ImSPBhQv"], "type": "dNug0oqt"}]' \
    > test.out 2>&1
eval_tap $? 32 'AdminBulkSaveItem' test.out

#- 33 AdminSyncUserEntitlements
./ng net.accelbyte.sdk.cli.Main inventory adminSyncUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'hAZzgI62' \
    > test.out 2>&1
eval_tap $? 33 'AdminSyncUserEntitlements' test.out

#- 34 AdminPurchasable
./ng net.accelbyte.sdk.cli.Main inventory adminPurchasable \
    --namespace "$AB_NAMESPACE" \
    --userId 'YkBMHMur' \
    --body '{"entitlementType": "gds4kluK", "inventoryConfig": {"slotUsed": 28}, "itemId": "V6l0DZqs", "itemType": "IyJqD3yb", "items": [{"bundledQty": 41, "entitlementType": "Yo6eHvNy", "inventoryConfig": {"slotUsed": 50}, "itemId": "M4GSbAE7", "itemType": "tBdzjeiQ", "sku": "e0P9ZU0O", "stackable": false, "useCount": 80}, {"bundledQty": 42, "entitlementType": "6I3VR4ky", "inventoryConfig": {"slotUsed": 21}, "itemId": "l3BiK0Bj", "itemType": "WWxhvpJK", "sku": "vo4EaV4v", "stackable": true, "useCount": 20}, {"bundledQty": 77, "entitlementType": "Cw3ndkbR", "inventoryConfig": {"slotUsed": 4}, "itemId": "H6u5bc5h", "itemType": "wF25oSCt", "sku": "MumtWDeg", "stackable": false, "useCount": 79}], "quantity": 45, "sku": "3HpJSGg3", "stackable": false, "useCount": 38}' \
    > test.out 2>&1
eval_tap $? 34 'AdminPurchasable' test.out

#- 35 PublicListInventoryConfigurations
./ng net.accelbyte.sdk.cli.Main inventory publicListInventoryConfigurations \
    --namespace "$AB_NAMESPACE" \
    --code 'MukegY7k' \
    --limit '63' \
    --offset '46' \
    --sortBy 'updatedAt:asc' \
    > test.out 2>&1
eval_tap $? 35 'PublicListInventoryConfigurations' test.out

#- 36 PublicListItemTypes
./ng net.accelbyte.sdk.cli.Main inventory publicListItemTypes \
    --namespace "$AB_NAMESPACE" \
    --limit '96' \
    --offset '75' \
    --sortBy 'name:desc' \
    > test.out 2>&1
eval_tap $? 36 'PublicListItemTypes' test.out

#- 37 PublicListTags
./ng net.accelbyte.sdk.cli.Main inventory publicListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '42' \
    --offset '0' \
    --sortBy 'createdAt:asc' \
    > test.out 2>&1
eval_tap $? 37 'PublicListTags' test.out

#- 38 PublicListInventories
./ng net.accelbyte.sdk.cli.Main inventory publicListInventories \
    --namespace "$AB_NAMESPACE" \
    --inventoryConfigurationCode '2MXpQxHh' \
    --limit '28' \
    --offset '4' \
    --sortBy 'updatedAt:desc' \
    > test.out 2>&1
eval_tap $? 38 'PublicListInventories' test.out

#- 39 PublicConsumeMyItem
./ng net.accelbyte.sdk.cli.Main inventory publicConsumeMyItem \
    --inventoryId 'WhxWTRb8' \
    --namespace "$AB_NAMESPACE" \
    --body '{"options": ["lFDUff45", "0XupBySL", "6G7fy5Vd"], "qty": 46, "slotId": "mn2g0Apr", "sourceItemId": "z2lumWtf"}' \
    > test.out 2>&1
eval_tap $? 39 'PublicConsumeMyItem' test.out

#- 40 PublicListItems
./ng net.accelbyte.sdk.cli.Main inventory publicListItems \
    --inventoryId 'EyvgTKQa' \
    --namespace "$AB_NAMESPACE" \
    --limit '90' \
    --offset '14' \
    --sortBy 'createdAt:asc' \
    --sourceItemId 'DY14asgm' \
    --tags 'sa6OKkp8' \
    > test.out 2>&1
eval_tap $? 40 'PublicListItems' test.out

#- 41 PublicBulkUpdateMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicBulkUpdateMyItems \
    --inventoryId 'dQe1WD5y' \
    --namespace "$AB_NAMESPACE" \
    --body '[{"customAttributes": {"ytIleeFz": {}, "Q00XLLxL": {}, "8EvihsSR": {}}, "slotId": "etOXp0nO", "sourceItemId": "yycxi9iz", "tags": ["kOHdeNvs", "EsmJba4K", "B3mXHvae"]}, {"customAttributes": {"euALnRO3": {}, "jddE3T5b": {}, "KzR3byZF": {}}, "slotId": "heutQ5pY", "sourceItemId": "nUxNgPwK", "tags": ["cUXFl9ca", "2NWzt5jB", "qqoSOsEW"]}, {"customAttributes": {"yS10Vcmg": {}, "C5oOF58y": {}, "2TMoJeiV": {}}, "slotId": "nCtR2cg0", "sourceItemId": "HYjPBWQP", "tags": ["GfMJZHAV", "5EkI3vzZ", "iOankdM7"]}]' \
    > test.out 2>&1
eval_tap $? 41 'PublicBulkUpdateMyItems' test.out

#- 42 PublicBulkRemoveMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicBulkRemoveMyItems \
    --inventoryId 'UuIr9B8B' \
    --namespace "$AB_NAMESPACE" \
    --body '[{"slotId": "IUohvpgm", "sourceItemId": "SgudZDeG"}, {"slotId": "XrihjcsX", "sourceItemId": "o1ADaspw"}, {"slotId": "ASjzsvhQ", "sourceItemId": "PZDSOg5i"}]' \
    > test.out 2>&1
eval_tap $? 42 'PublicBulkRemoveMyItems' test.out

#- 43 PublicMoveMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicMoveMyItems \
    --inventoryId 'X0ZhRCYv' \
    --namespace "$AB_NAMESPACE" \
    --body '{"items": [{"qty": 82, "slotId": "IyCyyfGm", "sourceItemId": "04ByDqNX"}, {"qty": 81, "slotId": "6BSoN7Wf", "sourceItemId": "FUqUIrHR"}, {"qty": 8, "slotId": "cXKIlea1", "sourceItemId": "xiXTXhLS"}], "srcInventoryId": "K6pKt2cw"}' \
    > test.out 2>&1
eval_tap $? 43 'PublicMoveMyItems' test.out

#- 44 PublicGetItem
./ng net.accelbyte.sdk.cli.Main inventory publicGetItem \
    --inventoryId 'HLi8H3rn' \
    --namespace "$AB_NAMESPACE" \
    --slotId '01TdAdXT' \
    --sourceItemId 'itMoOb2B' \
    > test.out 2>&1
eval_tap $? 44 'PublicGetItem' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
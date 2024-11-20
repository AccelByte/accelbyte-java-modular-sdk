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
    --body '{"message": "TL4NKqvv", "operations": [{"consumeItems": [{"inventoryId": "UwZk2lb1", "options": ["qtVQmHYg", "siT9Gpps", "I22110QS"], "qty": 52, "slotId": "PofDHRPh", "sourceItemId": "4XZnHc3B"}, {"inventoryId": "NFYtclIo", "options": ["nvjXJmEy", "ErZZ6qXN", "zNuXrVv4"], "qty": 57, "slotId": "bwvLK6nH", "sourceItemId": "CkOFWrmB"}, {"inventoryId": "rxsq4VcL", "options": ["tAR4BGXr", "5MV1tm6O", "38dV1gAL"], "qty": 59, "slotId": "i3S0wCzI", "sourceItemId": "amDDPcba"}], "createItems": [{"customAttributes": {"xfRszWJn": {}, "mqE4lchZ": {}, "zWJGBSwe": {}}, "inventoryConfigurationCode": "eLbQbU5Q", "inventoryId": "ZgVziKls", "qty": 41, "serverCustomAttributes": {"as3MtBxu": {}, "3yqk3riZ": {}, "kT2I25Er": {}}, "slotId": "QIiJCgNX", "slotUsed": 22, "source": "OTHER", "sourceItemId": "VSMdPhor", "tags": ["OlQlBoOh", "Q2eCQJYN", "2DD7uxme"], "toSpecificInventory": false, "type": "ZF6hbDLK"}, {"customAttributes": {"CfmiZF98": {}, "qcp4q8cL": {}, "PWey7Yds": {}}, "inventoryConfigurationCode": "d1g0IQsq", "inventoryId": "VYVBTML7", "qty": 80, "serverCustomAttributes": {"ae3R09Ro": {}, "avquNtvh": {}, "LIyVzBa4": {}}, "slotId": "cBiJFDFm", "slotUsed": 35, "source": "OTHER", "sourceItemId": "lmpxNIwO", "tags": ["mf8l0p2k", "3klGXOzB", "nGkCi8SY"], "toSpecificInventory": false, "type": "NaaFS4H2"}, {"customAttributes": {"Xs7vVSeN": {}, "Sk9M1gZx": {}, "FKe5asWY": {}}, "inventoryConfigurationCode": "IT9AF9aC", "inventoryId": "OLDaAja6", "qty": 7, "serverCustomAttributes": {"NCXCQksi": {}, "Cs1RBLWt": {}, "nKNGR8ys": {}}, "slotId": "vRUkScrk", "slotUsed": 26, "source": "OTHER", "sourceItemId": "YVK41gAf", "tags": ["aGRTV61W", "Wak9SKl4", "ETwxJXRG"], "toSpecificInventory": false, "type": "fAH18F0E"}], "removeItems": [{"inventoryId": "NVTWUrFE", "slotId": "VKxODbPM", "sourceItemId": "fWXrE8Yh"}, {"inventoryId": "CVLLf8IK", "slotId": "Ws11mJ1j", "sourceItemId": "jQGPXTtE"}, {"inventoryId": "4p1zJnN4", "slotId": "c8vzRMTp", "sourceItemId": "zp8KLWqO"}], "targetUserId": "07CfXISu", "updateItems": [{"customAttributes": {"BcRvD8nc": {}, "XzSgI1Hu": {}, "ZeTIZu36": {}}, "inventoryId": "aLYuVmwq", "serverCustomAttributes": {"O0bZxSni": {}, "ZtLTcqLH": {}, "6iqyf15w": {}}, "slotId": "J545Yw6g", "sourceItemId": "wj3pQnwv", "tags": ["eVXA0vqD", "Qw6dnPN0", "uewmCDsF"], "type": "o5BM9R6i"}, {"customAttributes": {"fN85cRYX": {}, "ejaMDP4U": {}, "3KjRkGBG": {}}, "inventoryId": "DzjZyvLz", "serverCustomAttributes": {"9tjlHEGr": {}, "0mCpxcEv": {}, "peXagckQ": {}}, "slotId": "tjW0QOCS", "sourceItemId": "6feR2QbD", "tags": ["AIcc1BZg", "GOsk7m5l", "Ef4na2XA"], "type": "cWFM2ne1"}, {"customAttributes": {"egpeOa1G": {}, "EAxXeMsI": {}, "FBDRGqPk": {}}, "inventoryId": "mkJ4rtaH", "serverCustomAttributes": {"gTw36lb1": {}, "RurGI0q2": {}, "cKj12O4q": {}}, "slotId": "N2F6Rp1K", "sourceItemId": "5qCaFDLY", "tags": ["00pkf3eR", "7iDUGNPO", "hVwEytwb"], "type": "z3GZnwjC"}]}, {"consumeItems": [{"inventoryId": "LP29zuu5", "options": ["vgcRtWDj", "q7lsV5T7", "fkFstRIr"], "qty": 36, "slotId": "6jNU6ObN", "sourceItemId": "kxNcEk7R"}, {"inventoryId": "KPbLJQXx", "options": ["Af1Nq115", "WjA5I8FI", "ppfRg7KP"], "qty": 45, "slotId": "U8uUwKgv", "sourceItemId": "np5lPGwh"}, {"inventoryId": "JNzJ4L33", "options": ["e6YOdvoy", "79N3RSap", "aOTUqGMp"], "qty": 38, "slotId": "xMpRtm53", "sourceItemId": "3p6I8HOR"}], "createItems": [{"customAttributes": {"BypGUUiT": {}, "ncoBkan9": {}, "l8OZ0p1e": {}}, "inventoryConfigurationCode": "OKDDmuZX", "inventoryId": "J8W95MMb", "qty": 14, "serverCustomAttributes": {"PleZMMdA": {}, "8efusFOT": {}, "N4Hul8WB": {}}, "slotId": "G540vmMt", "slotUsed": 36, "source": "OTHER", "sourceItemId": "iCMl9pOM", "tags": ["JTGtIM8U", "93o3uAZC", "NoN2d0yF"], "toSpecificInventory": false, "type": "tHUSG1Zq"}, {"customAttributes": {"XuSaaxxZ": {}, "IwOQER4p": {}, "UcEFevSX": {}}, "inventoryConfigurationCode": "O7zBOdpM", "inventoryId": "kI0Mk92i", "qty": 50, "serverCustomAttributes": {"JrnngwxU": {}, "9w4ABXdT": {}, "8RTyc7E7": {}}, "slotId": "fEhgAxjc", "slotUsed": 31, "source": "OTHER", "sourceItemId": "UcozpWRF", "tags": ["qS6D1guL", "KfUmVUqO", "xWLxqBlO"], "toSpecificInventory": true, "type": "tPD5HnFJ"}, {"customAttributes": {"iqVwzyud": {}, "4JeWDHNb": {}, "WXFobyhe": {}}, "inventoryConfigurationCode": "td6xVxzZ", "inventoryId": "NhLv1xUh", "qty": 45, "serverCustomAttributes": {"kZwfuYe1": {}, "lkChvg2c": {}, "MEhgUoWn": {}}, "slotId": "FDQ4f3ID", "slotUsed": 66, "source": "ECOMMERCE", "sourceItemId": "8s3cWJf3", "tags": ["Vt0hLlce", "VJH42Kej", "BWnHlKuQ"], "toSpecificInventory": false, "type": "GjgIUQJ4"}], "removeItems": [{"inventoryId": "nCe0FN0C", "slotId": "ZTsVAKbn", "sourceItemId": "bKZsOWNO"}, {"inventoryId": "uQjFPpM2", "slotId": "FRBdXly5", "sourceItemId": "C5zA1qiv"}, {"inventoryId": "BIgG6MrF", "slotId": "mYA4QLVx", "sourceItemId": "stfbiU5h"}], "targetUserId": "Ska6exzO", "updateItems": [{"customAttributes": {"H3CkBENh": {}, "Ye7XVRQ4": {}, "BHOejTjp": {}}, "inventoryId": "FWJVZyeu", "serverCustomAttributes": {"yHE2CbII": {}, "XK5F7tHu": {}, "J3L2yDH2": {}}, "slotId": "D6iRiwtS", "sourceItemId": "DHQgAJso", "tags": ["cHFf9Rr3", "LkcTHLB5", "8Da1rwRs"], "type": "PLB1kRvh"}, {"customAttributes": {"D68pfrBX": {}, "CarYsjw8": {}, "hk9D0DW5": {}}, "inventoryId": "sHm7d4eZ", "serverCustomAttributes": {"53ggZSJr": {}, "DRRwMxeD": {}, "XsD8GgfC": {}}, "slotId": "ixBsBnKa", "sourceItemId": "QbNlPbNA", "tags": ["kNkbcn1d", "fEzLgDU6", "PH6eY5yO"], "type": "tOsn0bgD"}, {"customAttributes": {"hF0IjLer": {}, "WkRoJQ9M": {}, "VDD2VADV": {}}, "inventoryId": "73e3ukD0", "serverCustomAttributes": {"XeD2Tn7d": {}, "CXbDWL8V": {}, "g1IjtFv3": {}}, "slotId": "rkxJSaDw", "sourceItemId": "MkXEy6nz", "tags": ["gAyczdPd", "DAHi2yDI", "ymla6FpL"], "type": "pHCc892P"}]}, {"consumeItems": [{"inventoryId": "EKXNatWM", "options": ["wRlNQ1Jl", "5bOn1S62", "l6Exv7qV"], "qty": 91, "slotId": "qcKTX08C", "sourceItemId": "C0IcwXe8"}, {"inventoryId": "wIAY9f3X", "options": ["fhKT1wjt", "z0wVgAqb", "fCR8AUEZ"], "qty": 40, "slotId": "lfV38aCg", "sourceItemId": "dUcmVLMR"}, {"inventoryId": "lO2J0X77", "options": ["6w2Zl588", "viifYDrW", "KFOJo4Rb"], "qty": 57, "slotId": "xNBvYv2m", "sourceItemId": "Q9L07Kop"}], "createItems": [{"customAttributes": {"7Qxa5LP4": {}, "LzPj2eSO": {}, "jWDMxUAw": {}}, "inventoryConfigurationCode": "Cl7qPx9H", "inventoryId": "ovN4kOSJ", "qty": 69, "serverCustomAttributes": {"r3cnarY6": {}, "WkLgksp6": {}, "mMRUjpOi": {}}, "slotId": "Gs3Cis7a", "slotUsed": 11, "source": "OTHER", "sourceItemId": "E6Wl9VeA", "tags": ["V7wl9n64", "AX2HP2Bz", "KvlGwlkP"], "toSpecificInventory": false, "type": "fY7wCe1T"}, {"customAttributes": {"k2ES9gEc": {}, "DU1igdH9": {}, "iLz3YMiA": {}}, "inventoryConfigurationCode": "nu0qxkLY", "inventoryId": "RT6X7WED", "qty": 92, "serverCustomAttributes": {"qjlwa22T": {}, "LUC0wiFb": {}, "9ydnejeu": {}}, "slotId": "yi22p1aE", "slotUsed": 60, "source": "ECOMMERCE", "sourceItemId": "FOmDrfrU", "tags": ["o0tBClPZ", "1RSOMpV5", "hfPtUANH"], "toSpecificInventory": true, "type": "ggeNi8YN"}, {"customAttributes": {"wvAv0xyq": {}, "Kotxv4eF": {}, "BkfWIGa2": {}}, "inventoryConfigurationCode": "mNFvYk4y", "inventoryId": "pEXDfvUN", "qty": 72, "serverCustomAttributes": {"E9VTMPXj": {}, "SbekmLri": {}, "fwaMhDPx": {}}, "slotId": "9JUoHR80", "slotUsed": 91, "source": "ECOMMERCE", "sourceItemId": "cZ1mtpLx", "tags": ["yuYAhXGQ", "957j76jn", "cN8LOBth"], "toSpecificInventory": false, "type": "AUOwwaAg"}], "removeItems": [{"inventoryId": "wIwGcPof", "slotId": "gVoebnOA", "sourceItemId": "yCXsguFF"}, {"inventoryId": "YWEEwkHx", "slotId": "mKODdAJp", "sourceItemId": "Oaxen8TA"}, {"inventoryId": "ayV5Eex6", "slotId": "8XuP4IP4", "sourceItemId": "gRtXYVTm"}], "targetUserId": "0iTUSIh2", "updateItems": [{"customAttributes": {"BxdrMJy1": {}, "xV5qUEX3": {}, "Jjst84EF": {}}, "inventoryId": "FAtCFRhA", "serverCustomAttributes": {"ySdLsZX6": {}, "JEgS6vX0": {}, "ZSxc5t7e": {}}, "slotId": "jXwGHlMH", "sourceItemId": "E6AoAaXk", "tags": ["NAeLJMeL", "6vkrj8Gv", "bIht5JfL"], "type": "tmnv4Tp5"}, {"customAttributes": {"uDmCpgj3": {}, "E1oktPVf": {}, "3QDTEA0z": {}}, "inventoryId": "7YiJ6HXZ", "serverCustomAttributes": {"FZxZ6Ynu": {}, "14ifx0ZW": {}, "cm4CA4EA": {}}, "slotId": "T5CzG4c4", "sourceItemId": "o30WItuw", "tags": ["TU6QY606", "Zt6urJPg", "dbXwzEgP"], "type": "cpMT2cYR"}, {"customAttributes": {"Vw1QVzoK": {}, "Lz2mbAEk": {}, "BmAymWP0": {}}, "inventoryId": "1LNHjsAi", "serverCustomAttributes": {"ouu6TYVu": {}, "ZGBqahQN": {}, "yIkQwA56": {}}, "slotId": "glz9OYDz", "sourceItemId": "Cfx6s9EE", "tags": ["NOjhfOL3", "5f6CHFhy", "uOqXw9KG"], "type": "7FH5iRlu"}]}], "requestId": "kGPw7ZC5"}' \
    > test.out 2>&1
eval_tap $? 2 'AdminCreateChainingOperations' test.out

#- 3 AdminListIntegrationConfigurations
./ng net.accelbyte.sdk.cli.Main inventory adminListIntegrationConfigurations \
    --namespace "$AB_NAMESPACE" \
    --limit '73' \
    --offset '76' \
    --sortBy 'createdAt:desc' \
    > test.out 2>&1
eval_tap $? 3 'AdminListIntegrationConfigurations' test.out

#- 4 AdminCreateIntegrationConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminCreateIntegrationConfiguration \
    --namespace "$AB_NAMESPACE" \
    --body '{"mapItemType": ["mmJyOtW9", "iV9JHZ6t", "0W3iDlsx"], "serviceName": "2QvKfGy4", "targetInventoryCode": "sBFQ6q40"}' \
    > test.out 2>&1
eval_tap $? 4 'AdminCreateIntegrationConfiguration' test.out

#- 5 AdminUpdateIntegrationConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateIntegrationConfiguration \
    --integrationConfigurationId '2tUSfVwD' \
    --namespace "$AB_NAMESPACE" \
    --body '{"mapItemType": ["kLlZRFCT", "FKNc64M2", "0sW60ZlI"], "serviceName": "3MW69v6o", "targetInventoryCode": "5gfyCwHA"}' \
    > test.out 2>&1
eval_tap $? 5 'AdminUpdateIntegrationConfiguration' test.out

#- 6 AdminUpdateStatusIntegrationConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateStatusIntegrationConfiguration \
    --integrationConfigurationId '0wXIN7Kx' \
    --namespace "$AB_NAMESPACE" \
    --body '{"status": "TIED"}' \
    > test.out 2>&1
eval_tap $? 6 'AdminUpdateStatusIntegrationConfiguration' test.out

#- 7 AdminListInventories
./ng net.accelbyte.sdk.cli.Main inventory adminListInventories \
    --namespace "$AB_NAMESPACE" \
    --inventoryConfigurationCode 'HhRGrlce' \
    --limit '92' \
    --offset '55' \
    --sortBy 'updatedAt:asc' \
    --userId 'xddbh040' \
    > test.out 2>&1
eval_tap $? 7 'AdminListInventories' test.out

#- 8 AdminCreateInventory
./ng net.accelbyte.sdk.cli.Main inventory adminCreateInventory \
    --namespace "$AB_NAMESPACE" \
    --body '{"inventoryConfigurationCode": "5XPFALpJ", "userId": "1UrVQ1tf"}' \
    > test.out 2>&1
eval_tap $? 8 'AdminCreateInventory' test.out

#- 9 AdminGetInventory
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventory \
    --inventoryId 'Tp9u5JSN' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'AdminGetInventory' test.out

#- 10 AdminUpdateInventory
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateInventory \
    --inventoryId 'cVdliePG' \
    --namespace "$AB_NAMESPACE" \
    --body '{"incMaxSlots": 79}' \
    > test.out 2>&1
eval_tap $? 10 'AdminUpdateInventory' test.out

#- 11 DeleteInventory
./ng net.accelbyte.sdk.cli.Main inventory deleteInventory \
    --inventoryId 'ILPNtdaA' \
    --namespace "$AB_NAMESPACE" \
    --body '{"message": "3KyuRyUv"}' \
    > test.out 2>&1
eval_tap $? 11 'DeleteInventory' test.out

#- 12 AdminListItems
./ng net.accelbyte.sdk.cli.Main inventory adminListItems \
    --inventoryId 'YTcRWOPN' \
    --namespace "$AB_NAMESPACE" \
    --limit '92' \
    --offset '14' \
    --sortBy 'updatedAt:desc' \
    --sourceItemId 'MVfrfBfm' \
    --tags 'VbdC39Kq' \
    > test.out 2>&1
eval_tap $? 12 'AdminListItems' test.out

#- 13 AdminGetInventoryItem
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventoryItem \
    --inventoryId 'a0uJu5tq' \
    --namespace "$AB_NAMESPACE" \
    --slotId 'oB4h5kWr' \
    --sourceItemId '5Erewt8S' \
    > test.out 2>&1
eval_tap $? 13 'AdminGetInventoryItem' test.out

#- 14 AdminListInventoryConfigurations
./ng net.accelbyte.sdk.cli.Main inventory adminListInventoryConfigurations \
    --namespace "$AB_NAMESPACE" \
    --code '5E6gehK2' \
    --limit '87' \
    --offset '17' \
    --sortBy 'createdAt' \
    > test.out 2>&1
eval_tap $? 14 'AdminListInventoryConfigurations' test.out

#- 15 AdminCreateInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminCreateInventoryConfiguration \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "Y3avd1bb", "description": "10tIXeDZ", "initialMaxSlots": 48, "maxInstancesPerUser": 34, "maxUpgradeSlots": 11, "name": "qS3Bh8o2"}' \
    > test.out 2>&1
eval_tap $? 15 'AdminCreateInventoryConfiguration' test.out

#- 16 AdminGetInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventoryConfiguration \
    --inventoryConfigurationId 'nJYIYqBP' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'AdminGetInventoryConfiguration' test.out

#- 17 AdminUpdateInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateInventoryConfiguration \
    --inventoryConfigurationId 'VmXfX5hp' \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "2ZGIoDFi", "description": "lYMubSvk", "initialMaxSlots": 25, "maxInstancesPerUser": 61, "maxUpgradeSlots": 59, "name": "7slEZFo8"}' \
    > test.out 2>&1
eval_tap $? 17 'AdminUpdateInventoryConfiguration' test.out

#- 18 AdminDeleteInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteInventoryConfiguration \
    --inventoryConfigurationId 'EXb6VIBh' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminDeleteInventoryConfiguration' test.out

#- 19 AdminListItemTypes
./ng net.accelbyte.sdk.cli.Main inventory adminListItemTypes \
    --namespace "$AB_NAMESPACE" \
    --limit '19' \
    --offset '41' \
    --sortBy 'name:desc' \
    > test.out 2>&1
eval_tap $? 19 'AdminListItemTypes' test.out

#- 20 AdminCreateItemType
./ng net.accelbyte.sdk.cli.Main inventory adminCreateItemType \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "A897RVuk"}' \
    > test.out 2>&1
eval_tap $? 20 'AdminCreateItemType' test.out

#- 21 AdminDeleteItemType
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteItemType \
    --itemTypeName 'K1uVDfC5' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'AdminDeleteItemType' test.out

#- 22 AdminListTags
./ng net.accelbyte.sdk.cli.Main inventory adminListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '62' \
    --offset '92' \
    --owner '52tWUmT5' \
    --sortBy 'name' \
    > test.out 2>&1
eval_tap $? 22 'AdminListTags' test.out

#- 23 AdminCreateTag
./ng net.accelbyte.sdk.cli.Main inventory adminCreateTag \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "uWSnnBW3", "owner": "CLIENT"}' \
    > test.out 2>&1
eval_tap $? 23 'AdminCreateTag' test.out

#- 24 AdminDeleteTag
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteTag \
    --namespace "$AB_NAMESPACE" \
    --tagName 'OF1tDgEh' \
    > test.out 2>&1
eval_tap $? 24 'AdminDeleteTag' test.out

#- 25 AdminConsumeUserItem
./ng net.accelbyte.sdk.cli.Main inventory adminConsumeUserItem \
    --inventoryId 'PPl7kUdt' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Tkszt3Tb' \
    --body '{"options": ["k2RnRjJg", "TmJvmimz", "BA0Jlho6"], "qty": 72, "slotId": "nGxuLAjb", "sourceItemId": "cVJ5MCjJ"}' \
    > test.out 2>&1
eval_tap $? 25 'AdminConsumeUserItem' test.out

#- 26 AdminBulkUpdateMyItems
./ng net.accelbyte.sdk.cli.Main inventory adminBulkUpdateMyItems \
    --inventoryId 'gPiChIAe' \
    --namespace "$AB_NAMESPACE" \
    --userId 'xRRUoBlG' \
    --body '[{"customAttributes": {"wlQPhomZ": {}, "sDpMqFSV": {}, "osSck5Gk": {}}, "serverCustomAttributes": {"dcEMjUGz": {}, "e8rzXSBG": {}, "ovX0oLHB": {}}, "slotId": "pzOkLz6Z", "sourceItemId": "hdJ1Vqdw", "tags": ["dvlOSMTj", "viNL74Te", "yNPe9RSs"], "type": "UH4gMi0V"}, {"customAttributes": {"t27unUVL": {}, "4N1YOxGX": {}, "jXTxI9Ac": {}}, "serverCustomAttributes": {"7u2Dvu0W": {}, "hgvh5XIB": {}, "Q9wqlwjz": {}}, "slotId": "0LH6Bni2", "sourceItemId": "LSMDk7db", "tags": ["RV3cayTZ", "9HCLmQqq", "Cmu0OL40"], "type": "07DN9VBN"}, {"customAttributes": {"I7kGYuKC": {}, "lKC1mErE": {}, "GaYfXltg": {}}, "serverCustomAttributes": {"DwCIIw8i": {}, "GYJuxMcq": {}, "ikJIR5ER": {}}, "slotId": "NGOIDnmb", "sourceItemId": "p6akEoXl", "tags": ["GBmtMiEG", "g8tDstTB", "uHnXfMYO"], "type": "2GVk8i1V"}]' \
    > test.out 2>&1
eval_tap $? 26 'AdminBulkUpdateMyItems' test.out

#- 27 AdminSaveItemToInventory
./ng net.accelbyte.sdk.cli.Main inventory adminSaveItemToInventory \
    --inventoryId 'jykWb6ZN' \
    --namespace "$AB_NAMESPACE" \
    --userId 'uWwZRIdj' \
    --body '{"customAttributes": {"khzvXiH2": {}, "eOCP7jzz": {}, "gi1Ew3dS": {}}, "qty": 6, "serverCustomAttributes": {"XrspBJmO": {}, "P4T4U41n": {}, "9GSrzKSe": {}}, "slotId": "uV9bMxaY", "slotUsed": 45, "source": "ECOMMERCE", "sourceItemId": "adjyCFFd", "tags": ["oZpqNXuB", "cIQO9jex", "yBB5Ioms"], "type": "1iFdM5Wa"}' \
    > test.out 2>&1
eval_tap $? 27 'AdminSaveItemToInventory' test.out

#- 28 AdminBulkRemoveItems
./ng net.accelbyte.sdk.cli.Main inventory adminBulkRemoveItems \
    --inventoryId 'JcqkpfgW' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZzNKz7ik' \
    --body '[{"slotId": "37mF9YVW", "sourceItemId": "XGzZHfSR"}, {"slotId": "CamO6GMJ", "sourceItemId": "RvLGfV5j"}, {"slotId": "Q9ZW5lNI", "sourceItemId": "KVfBPCAj"}]' \
    > test.out 2>&1
eval_tap $? 28 'AdminBulkRemoveItems' test.out

#- 29 AdminBulkSaveItemToInventory
./ng net.accelbyte.sdk.cli.Main inventory adminBulkSaveItemToInventory \
    --inventoryId 'sDYgoFt1' \
    --namespace "$AB_NAMESPACE" \
    --userId 'QXTueiga' \
    --body '[{"customAttributes": {"ptJQ6FfL": {}, "tYOIcy0b": {}, "ER5gMC8b": {}}, "qty": 21, "serverCustomAttributes": {"8C9o3Xpd": {}, "n6GluoU3": {}, "AvzdqHlG": {}}, "slotId": "U4Xo6A9B", "slotUsed": 37, "source": "ECOMMERCE", "sourceItemId": "pNJemWoK", "tags": ["74zMHAU2", "zUJyN5Ou", "kQTrbckz"], "type": "J9A35ExK"}, {"customAttributes": {"2QZ2w7Bw": {}, "iserdecy": {}, "t9kSeCI5": {}}, "qty": 21, "serverCustomAttributes": {"h8TfZDSl": {}, "1b1Bj8WD": {}, "X7cWtS6k": {}}, "slotId": "nOYIR4wd", "slotUsed": 55, "source": "ECOMMERCE", "sourceItemId": "2DZUCH6q", "tags": ["jYJBLTYp", "zV3DhOt4", "2QRp6fSo"], "type": "3Qdgb3Bx"}, {"customAttributes": {"S5Ik88Bf": {}, "hdb4vuww": {}, "ZlL7MVIx": {}}, "qty": 36, "serverCustomAttributes": {"GX9NOKGX": {}, "EdPcIneO": {}, "KK9KQMgc": {}}, "slotId": "EDVQFBuv", "slotUsed": 85, "source": "ECOMMERCE", "sourceItemId": "jwsYA6gz", "tags": ["jt860mrX", "RviTdWhI", "o8DTcEfR"], "type": "l3cXA2q8"}]' \
    > test.out 2>&1
eval_tap $? 29 'AdminBulkSaveItemToInventory' test.out

#- 30 AdminUpdateUserInventoriesByInventoryCode
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateUserInventoriesByInventoryCode \
    --inventoryConfigurationCode 'SfD3ICgD' \
    --namespace "$AB_NAMESPACE" \
    --userId 'tyqRAJZA' \
    --body '{"incMaxSlots": 67}' \
    > test.out 2>&1
eval_tap $? 30 'AdminUpdateUserInventoriesByInventoryCode' test.out

#- 31 AdminSaveItem
./ng net.accelbyte.sdk.cli.Main inventory adminSaveItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'CDwoMAGQ' \
    --body '{"customAttributes": {"gYjysCW2": {}, "v3AxMns6": {}, "ev348PtA": {}}, "inventoryConfigurationCode": "LkcG1Rdb", "qty": 94, "serverCustomAttributes": {"keoiC5pq": {}, "1a5IhmDy": {}, "lT8WycUN": {}}, "slotId": "OddRP4qe", "slotUsed": 59, "source": "ECOMMERCE", "sourceItemId": "bIfqahsb", "tags": ["scXZik3B", "BFDGCZJg", "m6HstQ20"], "type": "uBwl8uLI"}' \
    > test.out 2>&1
eval_tap $? 31 'AdminSaveItem' test.out

#- 32 AdminBulkSaveItem
./ng net.accelbyte.sdk.cli.Main inventory adminBulkSaveItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'FlFqJwal' \
    --body '[{"customAttributes": {"FpuBtElp": {}, "1QBWWEVJ": {}, "rj0eqToW": {}}, "inventoryConfigurationCode": "MkKhcBoN", "qty": 42, "serverCustomAttributes": {"jYiy5lp2": {}, "hLQa24yu": {}, "OYSMEpSm": {}}, "slotId": "GOncjjdn", "slotUsed": 55, "source": "OTHER", "sourceItemId": "8wWWGtzK", "tags": ["rbU4znhy", "vZL1jAbz", "IySLC6mY"], "type": "qhdPV869"}, {"customAttributes": {"9PVWXYoO": {}, "xVbzl7zl": {}, "f0iWxlo2": {}}, "inventoryConfigurationCode": "BWHOBZdc", "qty": 94, "serverCustomAttributes": {"AnoLxug0": {}, "fXviSBMP": {}, "20YRpPRe": {}}, "slotId": "8RKSTCdN", "slotUsed": 98, "source": "ECOMMERCE", "sourceItemId": "ckWvTnyW", "tags": ["JUYexBIm", "me6q2xFj", "CuyDXSgt"], "type": "agmfxjRp"}, {"customAttributes": {"7QIDW3C6": {}, "cUtScmOc": {}, "bUkiEfQw": {}}, "inventoryConfigurationCode": "zoUVYHMB", "qty": 85, "serverCustomAttributes": {"ermXt69l": {}, "9a5cBjko": {}, "zfk34mXj": {}}, "slotId": "00MG0Or4", "slotUsed": 9, "source": "OTHER", "sourceItemId": "pM4H0a7T", "tags": ["E4VOqZPo", "An8BAfiv", "ioam2cQy"], "type": "rdQYpRb3"}]' \
    > test.out 2>&1
eval_tap $? 32 'AdminBulkSaveItem' test.out

#- 33 AdminSyncUserEntitlements
./ng net.accelbyte.sdk.cli.Main inventory adminSyncUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'HDLNc7Oo' \
    > test.out 2>&1
eval_tap $? 33 'AdminSyncUserEntitlements' test.out

#- 34 AdminPurchasable
./ng net.accelbyte.sdk.cli.Main inventory adminPurchasable \
    --namespace "$AB_NAMESPACE" \
    --userId 'BDcmuoum' \
    --body '{"entitlementType": "mCYlFEKq", "inventoryConfig": {"slotUsed": 83}, "itemId": "pSv9vO7i", "itemType": "lkEeQVWC", "items": [{"bundledQty": 4, "entitlementType": "MWN4oPb3", "inventoryConfig": {"slotUsed": 82}, "itemId": "oqTiKpz0", "itemType": "bX4PEKVD", "sku": "iqSbbwd3", "stackable": true, "useCount": 99}, {"bundledQty": 1, "entitlementType": "wVXIVZlZ", "inventoryConfig": {"slotUsed": 49}, "itemId": "utCymxuO", "itemType": "Ox8iOdx0", "sku": "1cYXbUs2", "stackable": true, "useCount": 64}, {"bundledQty": 88, "entitlementType": "8E844iE0", "inventoryConfig": {"slotUsed": 84}, "itemId": "WmRg0zaV", "itemType": "xsmvAKZi", "sku": "sdR9rOVo", "stackable": false, "useCount": 88}], "quantity": 90, "sku": "RSpeEz24", "stackable": false, "useCount": 35}' \
    > test.out 2>&1
eval_tap $? 34 'AdminPurchasable' test.out

#- 35 PublicListInventoryConfigurations
./ng net.accelbyte.sdk.cli.Main inventory publicListInventoryConfigurations \
    --namespace "$AB_NAMESPACE" \
    --code 'oQPKBliy' \
    --limit '3' \
    --offset '58' \
    --sortBy 'updatedAt:desc' \
    > test.out 2>&1
eval_tap $? 35 'PublicListInventoryConfigurations' test.out

#- 36 PublicListItemTypes
./ng net.accelbyte.sdk.cli.Main inventory publicListItemTypes \
    --namespace "$AB_NAMESPACE" \
    --limit '2' \
    --offset '55' \
    --sortBy 'name:asc' \
    > test.out 2>&1
eval_tap $? 36 'PublicListItemTypes' test.out

#- 37 PublicListTags
./ng net.accelbyte.sdk.cli.Main inventory publicListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '42' \
    --offset '33' \
    --sortBy 'name:desc' \
    > test.out 2>&1
eval_tap $? 37 'PublicListTags' test.out

#- 38 PublicListInventories
./ng net.accelbyte.sdk.cli.Main inventory publicListInventories \
    --namespace "$AB_NAMESPACE" \
    --inventoryConfigurationCode 'MkguzOb2' \
    --limit '7' \
    --offset '89' \
    --sortBy 'createdAt:desc' \
    > test.out 2>&1
eval_tap $? 38 'PublicListInventories' test.out

#- 39 PublicConsumeMyItem
./ng net.accelbyte.sdk.cli.Main inventory publicConsumeMyItem \
    --inventoryId 'nkiFdKqm' \
    --namespace "$AB_NAMESPACE" \
    --body '{"options": ["Vi73bupG", "MLy2Ix1z", "Kh0ZGB1e"], "qty": 22, "slotId": "4RVOixL4", "sourceItemId": "ZOe4U6nd"}' \
    > test.out 2>&1
eval_tap $? 39 'PublicConsumeMyItem' test.out

#- 40 PublicListItems
./ng net.accelbyte.sdk.cli.Main inventory publicListItems \
    --inventoryId 'S8QBjIEs' \
    --namespace "$AB_NAMESPACE" \
    --limit '8' \
    --offset '36' \
    --sortBy 'createdAt:desc' \
    --sourceItemId 'vzW7Ve2s' \
    --tags 'NSJTtxHa' \
    > test.out 2>&1
eval_tap $? 40 'PublicListItems' test.out

#- 41 PublicBulkUpdateMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicBulkUpdateMyItems \
    --inventoryId 'ixAac2PK' \
    --namespace "$AB_NAMESPACE" \
    --body '[{"customAttributes": {"YicXDkYp": {}, "HAt9MBqk": {}, "XORbP92w": {}}, "slotId": "USGjovWG", "sourceItemId": "uoHmEvqn", "tags": ["kZFPgg14", "AA8DYA1w", "6J6a5xPT"]}, {"customAttributes": {"qZ4hlx91": {}, "WOX6waCu": {}, "41GOdBGj": {}}, "slotId": "cpxNTr0c", "sourceItemId": "qGsBuJXH", "tags": ["qsTDo7ht", "dKrjDc4r", "3okwQ7rC"]}, {"customAttributes": {"MItnhhuI": {}, "AyMfwIRN": {}, "5A1YAwH8": {}}, "slotId": "zbho71uS", "sourceItemId": "g1a9DJqx", "tags": ["aePa8D0b", "sTN2dfKD", "MOSaWPN6"]}]' \
    > test.out 2>&1
eval_tap $? 41 'PublicBulkUpdateMyItems' test.out

#- 42 PublicBulkRemoveMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicBulkRemoveMyItems \
    --inventoryId '8vbvlYnC' \
    --namespace "$AB_NAMESPACE" \
    --body '[{"slotId": "mVByaWHj", "sourceItemId": "JvPyCXWa"}, {"slotId": "qSMYNbIL", "sourceItemId": "TCKytJBL"}, {"slotId": "0JL8NKFs", "sourceItemId": "ys47BF4R"}]' \
    > test.out 2>&1
eval_tap $? 42 'PublicBulkRemoveMyItems' test.out

#- 43 PublicMoveMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicMoveMyItems \
    --inventoryId 'OLqWmLc6' \
    --namespace "$AB_NAMESPACE" \
    --body '{"items": [{"qty": 72, "slotId": "fNfVYuxA", "sourceItemId": "ke9n49iA"}, {"qty": 62, "slotId": "ERUyX1wr", "sourceItemId": "ZU5QQUxk"}, {"qty": 98, "slotId": "xdTdH7fd", "sourceItemId": "KyADu7QL"}], "srcInventoryId": "8O1z0XZf"}' \
    > test.out 2>&1
eval_tap $? 43 'PublicMoveMyItems' test.out

#- 44 PublicGetItem
./ng net.accelbyte.sdk.cli.Main inventory publicGetItem \
    --inventoryId 'RAEJyWNA' \
    --namespace "$AB_NAMESPACE" \
    --slotId 'j7tskpsB' \
    --sourceItemId 'WAA9obve' \
    > test.out 2>&1
eval_tap $? 44 'PublicGetItem' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
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
    --body '{"message": "29fcGcKx", "operations": [{"consumeItems": [{"dateRangeValidation": false, "inventoryId": "vws5fr8D", "options": ["wSv0FUTD", "d8LHQMhr", "vthTRK5y"], "qty": 82, "slotId": "OnAeEFfD", "sourceItemId": "eYT1B179"}, {"dateRangeValidation": false, "inventoryId": "XXACkezJ", "options": ["MflTD0Tb", "jjCKyLj8", "zRvCCIle"], "qty": 10, "slotId": "6n94RcZL", "sourceItemId": "VFY8fiIy"}, {"dateRangeValidation": false, "inventoryId": "5Ht8kaQz", "options": ["59oP6f3v", "7hbKGupX", "E8pnfPKv"], "qty": 37, "slotId": "mI2h0gV2", "sourceItemId": "zoQMPcBg"}], "createItems": [{"customAttributes": {"OimAcQB9": {}, "j5STLbnm": {}, "i19imQHS": {}}, "inventoryConfigurationCode": "UvqX4gqD", "inventoryId": "Ld3jNNa6", "qty": 85, "serverCustomAttributes": {"inKH3cm1": {}, "7OJWY2O1": {}, "MMkV6RgZ": {}}, "slotId": "wIFZlzjQ", "slotUsed": 86, "source": "OTHER", "sourceItemId": "fT11eKDA", "tags": ["osL1M3gh", "MpOgbo61", "ShiS6zbu"], "toSpecificInventory": true, "type": "yokUcmJL"}, {"customAttributes": {"TyjQSCiK": {}, "Za57KVBg": {}, "n0HwsDDC": {}}, "inventoryConfigurationCode": "LnYbV4aA", "inventoryId": "SukYvod7", "qty": 30, "serverCustomAttributes": {"O8OZ4PlC": {}, "cn0gGcbd": {}, "9cE8GnPn": {}}, "slotId": "uZpm75a3", "slotUsed": 25, "source": "OTHER", "sourceItemId": "tbJ4GKs1", "tags": ["Oc17DlUv", "vie23GRx", "7CTCqddA"], "toSpecificInventory": true, "type": "nBp9VLct"}, {"customAttributes": {"fgs3jZ2b": {}, "iBd4Pno5": {}, "6xGlZQcN": {}}, "inventoryConfigurationCode": "qSpXIMNJ", "inventoryId": "TFzTt3wS", "qty": 17, "serverCustomAttributes": {"lIJXdM1e": {}, "eeZS0oZ8": {}, "ZCIpXGcM": {}}, "slotId": "cMrFcyHr", "slotUsed": 47, "source": "ECOMMERCE", "sourceItemId": "BNoetTXl", "tags": ["LhDf76YX", "IW1fwJ5h", "6xP8G0EL"], "toSpecificInventory": false, "type": "7RofXpiJ"}], "removeItems": [{"inventoryId": "43vm9hsz", "slotId": "S3HuWOhn", "sourceItemId": "oT9whtcK"}, {"inventoryId": "NyWU7y9f", "slotId": "fLq1EaRM", "sourceItemId": "SU0ZRDsq"}, {"inventoryId": "XFUcW2pO", "slotId": "t10LrOUv", "sourceItemId": "2fQQyHRu"}], "targetUserId": "SgzA06H3", "updateItems": [{"customAttributes": {"YFtEvXdM": {}, "eZogOMMQ": {}, "nYNTiVYY": {}}, "inventoryId": "0rHc4mlT", "serverCustomAttributes": {"HVTeEtWI": {}, "LROPDLWt": {}, "Wn8l1nSe": {}}, "slotId": "x9Pn5gd5", "sourceItemId": "xYbEJldO", "tags": ["BgWYr5vl", "qoailQMg", "o8T6Kpqj"], "type": "hgo6exF5"}, {"customAttributes": {"rrmIe2ri": {}, "jYTZfrJd": {}, "xDqpNbri": {}}, "inventoryId": "D52DZmer", "serverCustomAttributes": {"Dm2WZZMK": {}, "TLALhIT6": {}, "61JnhlLD": {}}, "slotId": "gKPwB8Eo", "sourceItemId": "8lXzs1uI", "tags": ["J1Pv2mFU", "CaSgi6Fk", "HFp2Fi4Y"], "type": "fVpXhr6P"}, {"customAttributes": {"r1TZNRSV": {}, "i0MqKuUo": {}, "bs3njGFf": {}}, "inventoryId": "PsXZhkI6", "serverCustomAttributes": {"kT17foz2": {}, "2OKNcUFd": {}, "alC0vAEc": {}}, "slotId": "Mr8Ml74Q", "sourceItemId": "HxV5MUCa", "tags": ["q0FqDk1n", "P49pgxYu", "A5SAo0zX"], "type": "qL7r8Z4h"}]}, {"consumeItems": [{"dateRangeValidation": false, "inventoryId": "4IiaWK1i", "options": ["okm6XUaO", "RdNIDFcp", "obUPoaxV"], "qty": 21, "slotId": "0RcHOGFa", "sourceItemId": "dcXUSrfw"}, {"dateRangeValidation": false, "inventoryId": "Ag0lpM67", "options": ["gPb2h3m7", "uX0AkNeH", "WKE6uIIl"], "qty": 81, "slotId": "PhriECjQ", "sourceItemId": "8D9Z9mk9"}, {"dateRangeValidation": true, "inventoryId": "7BmyNE84", "options": ["iAmT7GAH", "2OoMTVF0", "JHgRnLKZ"], "qty": 73, "slotId": "RA4wRhJG", "sourceItemId": "AFfCuMOG"}], "createItems": [{"customAttributes": {"lgNMdgPa": {}, "fgbKWA0l": {}, "ji30OHZi": {}}, "inventoryConfigurationCode": "dzxkK2rr", "inventoryId": "I3XPdl3e", "qty": 67, "serverCustomAttributes": {"gVk3h91P": {}, "yx2MSkLQ": {}, "yZW6HdEm": {}}, "slotId": "ztKbH91q", "slotUsed": 17, "source": "ECOMMERCE", "sourceItemId": "vup8w6Qp", "tags": ["xsLjWXtG", "yGTRAG60", "gBlZOK4x"], "toSpecificInventory": false, "type": "WqUTFdsc"}, {"customAttributes": {"u9egQVPh": {}, "rQTcoDry": {}, "qbWMWjAh": {}}, "inventoryConfigurationCode": "kzRTCK1z", "inventoryId": "dmwM1rTx", "qty": 32, "serverCustomAttributes": {"maJ7p5hZ": {}, "k5bYXcfB": {}, "QiiVPBvC": {}}, "slotId": "s7vKWYCo", "slotUsed": 13, "source": "OTHER", "sourceItemId": "rNIKmqmt", "tags": ["BGkXzBKB", "J4Ns2uSP", "8ItppGmI"], "toSpecificInventory": false, "type": "mQO8s8kJ"}, {"customAttributes": {"vyKXoMSd": {}, "dkqOjMET": {}, "YPfKGrBB": {}}, "inventoryConfigurationCode": "qQbT7DCE", "inventoryId": "apBmvNbX", "qty": 6, "serverCustomAttributes": {"4Evc7dh9": {}, "g4b3i0dC": {}, "hp5cpZ4f": {}}, "slotId": "n2AQV2sk", "slotUsed": 51, "source": "ECOMMERCE", "sourceItemId": "UkIF7vOc", "tags": ["OMDiKFGC", "ibkfCpyd", "HpaI1PIZ"], "toSpecificInventory": false, "type": "Cvv26zwf"}], "removeItems": [{"inventoryId": "iov81NB9", "slotId": "j3cdcfUd", "sourceItemId": "VBO8Z6KL"}, {"inventoryId": "BgRDxsEF", "slotId": "Rx8jY5Ww", "sourceItemId": "298lK8BU"}, {"inventoryId": "tWt0XXmJ", "slotId": "tlkMzJxX", "sourceItemId": "uwyDOG0f"}], "targetUserId": "N4wYQLaN", "updateItems": [{"customAttributes": {"dEkuSY5o": {}, "AZ5tCxrJ": {}, "bvx0WqHB": {}}, "inventoryId": "NmWcsIjg", "serverCustomAttributes": {"EOVn4k80": {}, "WVNr04P9": {}, "BOeOBt96": {}}, "slotId": "cjrnkuaL", "sourceItemId": "kXoAyg1E", "tags": ["NSvAh0dz", "TUQdpmXM", "uiyrluj1"], "type": "M50xyTRM"}, {"customAttributes": {"60KEHRTO": {}, "Gd9qEosJ": {}, "vjKlosNm": {}}, "inventoryId": "vygXQTx3", "serverCustomAttributes": {"0FvAsfkp": {}, "pYBw6m7y": {}, "77kmf6gr": {}}, "slotId": "Qi4NzX7H", "sourceItemId": "wOzY5XsR", "tags": ["IpEF5CN2", "gTBrpiBT", "DTrrQkAw"], "type": "4xNMvExS"}, {"customAttributes": {"6ss8zbBH": {}, "4HxCSTnv": {}, "s4qKYchN": {}}, "inventoryId": "lbHKiy6g", "serverCustomAttributes": {"V2FzG3AP": {}, "PA2NKmpP": {}, "4LJuWdXQ": {}}, "slotId": "aTpjcSPn", "sourceItemId": "DURuRRJp", "tags": ["Wt8DpCRC", "jcdlx8P0", "RSiKsvzC"], "type": "5RRiXnp9"}]}, {"consumeItems": [{"dateRangeValidation": false, "inventoryId": "j1gtYiwo", "options": ["6RjWwg1L", "V1GROBhZ", "fKmf4q53"], "qty": 97, "slotId": "9Nj8rvsq", "sourceItemId": "xyT2C5IQ"}, {"dateRangeValidation": true, "inventoryId": "dOnMyAEN", "options": ["lzjqSDh8", "ntD1v4qo", "lZBVjUzz"], "qty": 12, "slotId": "dkU2E4Wn", "sourceItemId": "2Xyi2XVi"}, {"dateRangeValidation": true, "inventoryId": "0lAB5x17", "options": ["UTR7ONbc", "2WhBaRCJ", "aADuFHpT"], "qty": 92, "slotId": "r3CLW3Ef", "sourceItemId": "7FuaGAHh"}], "createItems": [{"customAttributes": {"gDCDXOMq": {}, "LfO0BdmJ": {}, "5P0RLqia": {}}, "inventoryConfigurationCode": "G7FI2m1N", "inventoryId": "IDkIknXP", "qty": 83, "serverCustomAttributes": {"xMOvazNs": {}, "Um7o8APn": {}, "yQgeY3Ej": {}}, "slotId": "Pv7ne5HK", "slotUsed": 17, "source": "ECOMMERCE", "sourceItemId": "mHWhmtCM", "tags": ["SoeqL1QS", "uHhk7ov8", "KmYYbmRJ"], "toSpecificInventory": false, "type": "Q7Z2iqZ6"}, {"customAttributes": {"vUnJ0cVP": {}, "BrkC95KO": {}, "fb7GGDtr": {}}, "inventoryConfigurationCode": "sYBnapCx", "inventoryId": "jPOKjp3u", "qty": 9, "serverCustomAttributes": {"8Y5P6EaE": {}, "x3dUWQF7": {}, "O9DzkOW2": {}}, "slotId": "OGNIxY3k", "slotUsed": 78, "source": "OTHER", "sourceItemId": "2BpcFX6J", "tags": ["WIIKbvrk", "aEyGwLaB", "2sk4q3yO"], "toSpecificInventory": false, "type": "5JsNs4o3"}, {"customAttributes": {"M4TesJBq": {}, "XUXDdPQN": {}, "CtkOMfKw": {}}, "inventoryConfigurationCode": "tViZXGHM", "inventoryId": "Z0Y0pTKW", "qty": 5, "serverCustomAttributes": {"NOf09Ctr": {}, "9xakQngu": {}, "5k1bKuQu": {}}, "slotId": "FpUVakrt", "slotUsed": 70, "source": "ECOMMERCE", "sourceItemId": "SOFj2PyQ", "tags": ["6w7Xe2uy", "jghVQX9X", "ODjHmmlS"], "toSpecificInventory": false, "type": "K8ORKc8w"}], "removeItems": [{"inventoryId": "eG2ilcal", "slotId": "ysiiexq2", "sourceItemId": "GxjgY1tQ"}, {"inventoryId": "RdrDFIcR", "slotId": "j1VnDHiK", "sourceItemId": "DlXeikxX"}, {"inventoryId": "5heSmWZP", "slotId": "SBzDWlE8", "sourceItemId": "y5ZujElI"}], "targetUserId": "df9joJQz", "updateItems": [{"customAttributes": {"lfbAkwKj": {}, "zN96jJIK": {}, "rbgzjIwJ": {}}, "inventoryId": "8KmryiKD", "serverCustomAttributes": {"sc7zPUvc": {}, "Q6RQxHrU": {}, "G4jfs85P": {}}, "slotId": "CHmio13o", "sourceItemId": "yERbMrj3", "tags": ["jQM1j0q2", "XrEmPoOb", "82fIhfwl"], "type": "ZLS2jLqy"}, {"customAttributes": {"4mwNzTbZ": {}, "1Pv1V5fO": {}, "kwjCDf0z": {}}, "inventoryId": "6qZ599VS", "serverCustomAttributes": {"Gc2p659f": {}, "0sUKCe1b": {}, "fHS68Gjo": {}}, "slotId": "81JbRjL5", "sourceItemId": "rrcGlSPc", "tags": ["R4UpSB33", "lKaTPWsE", "GO8jXe2T"], "type": "quvFsbhm"}, {"customAttributes": {"4KxvjC3H": {}, "JwHQbO1D": {}, "AFEd5L4v": {}}, "inventoryId": "V9HO9asJ", "serverCustomAttributes": {"1DbFJosH": {}, "nRjz1cvj": {}, "0TjFaByi": {}}, "slotId": "ILYMRk4l", "sourceItemId": "IR0ALEyh", "tags": ["TzyU2mWC", "CBZuWqvf", "QMGPUtmh"], "type": "hmB0ial4"}]}], "requestId": "XHtZ2LDd"}' \
    > test.out 2>&1
eval_tap $? 2 'AdminCreateChainingOperations' test.out

#- 3 AdminListIntegrationConfigurations
./ng net.accelbyte.sdk.cli.Main inventory adminListIntegrationConfigurations \
    --namespace "$AB_NAMESPACE" \
    --limit '36' \
    --offset '72' \
    --sortBy 'createdAt:desc' \
    > test.out 2>&1
eval_tap $? 3 'AdminListIntegrationConfigurations' test.out

#- 4 AdminCreateIntegrationConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminCreateIntegrationConfiguration \
    --namespace "$AB_NAMESPACE" \
    --body '{"mapItemType": ["OAxweDRl", "CHxb8JeW", "i9fwLAID"], "serviceName": "3fsSlwzL", "targetInventoryCode": "sMWsJwNy"}' \
    > test.out 2>&1
eval_tap $? 4 'AdminCreateIntegrationConfiguration' test.out

#- 5 AdminUpdateIntegrationConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateIntegrationConfiguration \
    --integrationConfigurationId '6oDb38Sh' \
    --namespace "$AB_NAMESPACE" \
    --body '{"mapItemType": ["AyipAidX", "NjwQIJba", "WMjLtbOj"], "serviceName": "jtAbywV6", "targetInventoryCode": "9Bd7vTJW"}' \
    > test.out 2>&1
eval_tap $? 5 'AdminUpdateIntegrationConfiguration' test.out

#- 6 AdminUpdateStatusIntegrationConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateStatusIntegrationConfiguration \
    --integrationConfigurationId '1TggJcmu' \
    --namespace "$AB_NAMESPACE" \
    --body '{"status": "TIED"}' \
    > test.out 2>&1
eval_tap $? 6 'AdminUpdateStatusIntegrationConfiguration' test.out

#- 7 AdminListInventories
./ng net.accelbyte.sdk.cli.Main inventory adminListInventories \
    --namespace "$AB_NAMESPACE" \
    --inventoryConfigurationCode 'okdmJCiq' \
    --limit '93' \
    --offset '20' \
    --sortBy 'createdAt' \
    --userId 'eGdz5CxT' \
    > test.out 2>&1
eval_tap $? 7 'AdminListInventories' test.out

#- 8 AdminCreateInventory
./ng net.accelbyte.sdk.cli.Main inventory adminCreateInventory \
    --namespace "$AB_NAMESPACE" \
    --body '{"inventoryConfigurationCode": "zwWgW4AE", "userId": "dd4XIfDJ"}' \
    > test.out 2>&1
eval_tap $? 8 'AdminCreateInventory' test.out

#- 9 AdminGetInventory
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventory \
    --inventoryId '6krPFFcy' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'AdminGetInventory' test.out

#- 10 AdminUpdateInventory
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateInventory \
    --inventoryId 'VEPybHXd' \
    --namespace "$AB_NAMESPACE" \
    --body '{"incMaxSlots": 26}' \
    > test.out 2>&1
eval_tap $? 10 'AdminUpdateInventory' test.out

#- 11 DeleteInventory
./ng net.accelbyte.sdk.cli.Main inventory deleteInventory \
    --inventoryId 'gMv9Y46J' \
    --namespace "$AB_NAMESPACE" \
    --body '{"message": "usODb0xZ"}' \
    > test.out 2>&1
eval_tap $? 11 'DeleteInventory' test.out

#- 12 AdminListItems
./ng net.accelbyte.sdk.cli.Main inventory adminListItems \
    --inventoryId '5CwOOzpU' \
    --namespace "$AB_NAMESPACE" \
    --limit '53' \
    --offset '37' \
    --sortBy 'createdAt:desc' \
    --sourceItemId '2mQ0utyj' \
    --tags 'jZt511fn' \
    > test.out 2>&1
eval_tap $? 12 'AdminListItems' test.out

#- 13 AdminGetInventoryItem
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventoryItem \
    --inventoryId 'BRthdzjG' \
    --namespace "$AB_NAMESPACE" \
    --slotId 'nVTpRkvH' \
    --sourceItemId 'hCIQBjkI' \
    > test.out 2>&1
eval_tap $? 13 'AdminGetInventoryItem' test.out

#- 14 AdminListInventoryConfigurations
./ng net.accelbyte.sdk.cli.Main inventory adminListInventoryConfigurations \
    --namespace "$AB_NAMESPACE" \
    --code 'uE1onGrG' \
    --limit '77' \
    --offset '84' \
    --sortBy 'createdAt' \
    > test.out 2>&1
eval_tap $? 14 'AdminListInventoryConfigurations' test.out

#- 15 AdminCreateInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminCreateInventoryConfiguration \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "eMhpbCfh", "description": "cqe1Dw2T", "initialMaxSlots": 88, "maxInstancesPerUser": 76, "maxUpgradeSlots": 40, "name": "PFKv9r0O"}' \
    > test.out 2>&1
eval_tap $? 15 'AdminCreateInventoryConfiguration' test.out

#- 16 AdminGetInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventoryConfiguration \
    --inventoryConfigurationId 'riYZWX7T' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'AdminGetInventoryConfiguration' test.out

#- 17 AdminUpdateInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateInventoryConfiguration \
    --inventoryConfigurationId 'RHSCYi9t' \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "Z0adjq0r", "description": "PklxHurC", "initialMaxSlots": 41, "maxInstancesPerUser": 51, "maxUpgradeSlots": 7, "name": "fRxTU33E"}' \
    > test.out 2>&1
eval_tap $? 17 'AdminUpdateInventoryConfiguration' test.out

#- 18 AdminDeleteInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteInventoryConfiguration \
    --inventoryConfigurationId 'o1bmWmZ9' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminDeleteInventoryConfiguration' test.out

#- 19 AdminListItemTypes
./ng net.accelbyte.sdk.cli.Main inventory adminListItemTypes \
    --namespace "$AB_NAMESPACE" \
    --limit '27' \
    --offset '72' \
    --sortBy 'name:asc' \
    > test.out 2>&1
eval_tap $? 19 'AdminListItemTypes' test.out

#- 20 AdminCreateItemType
./ng net.accelbyte.sdk.cli.Main inventory adminCreateItemType \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "jaGpcwgP"}' \
    > test.out 2>&1
eval_tap $? 20 'AdminCreateItemType' test.out

#- 21 AdminDeleteItemType
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteItemType \
    --itemTypeName '9payRMoM' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'AdminDeleteItemType' test.out

#- 22 AdminListTags
./ng net.accelbyte.sdk.cli.Main inventory adminListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '59' \
    --offset '18' \
    --owner 'X7wpKZRi' \
    --sortBy 'name:asc' \
    > test.out 2>&1
eval_tap $? 22 'AdminListTags' test.out

#- 23 AdminCreateTag
./ng net.accelbyte.sdk.cli.Main inventory adminCreateTag \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "p6MXM4ap", "owner": "SERVER"}' \
    > test.out 2>&1
eval_tap $? 23 'AdminCreateTag' test.out

#- 24 AdminDeleteTag
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteTag \
    --namespace "$AB_NAMESPACE" \
    --tagName 'IdjI7MvE' \
    > test.out 2>&1
eval_tap $? 24 'AdminDeleteTag' test.out

#- 25 AdminConsumeUserItem
./ng net.accelbyte.sdk.cli.Main inventory adminConsumeUserItem \
    --inventoryId '12iL7dzm' \
    --namespace "$AB_NAMESPACE" \
    --userId '9LqWsRaA' \
    --dateRangeValidation 'fna9gt17' \
    --body '{"options": ["VSN3Dg32", "cRYyHMKP", "CxvcsHVF"], "qty": 92, "slotId": "z8XroPXf", "sourceItemId": "TvGii15s"}' \
    > test.out 2>&1
eval_tap $? 25 'AdminConsumeUserItem' test.out

#- 26 AdminBulkUpdateMyItems
./ng net.accelbyte.sdk.cli.Main inventory adminBulkUpdateMyItems \
    --inventoryId 'RHvn0zhB' \
    --namespace "$AB_NAMESPACE" \
    --userId 'KfHc1rtk' \
    --body '[{"customAttributes": {"F3Q4gIba": {}, "SGzL5v5P": {}, "nEUCSGpE": {}}, "serverCustomAttributes": {"HZBdkESP": {}, "fPIDuugg": {}, "ThPxwuia": {}}, "slotId": "Lp2wn7Rn", "sourceItemId": "iLbk2jhF", "tags": ["U1MbyFb8", "ttRUMJVs", "8mknSYu2"], "type": "jVPBa9MY"}, {"customAttributes": {"MGxifuzd": {}, "jP3PY59b": {}, "CeGZLHUX": {}}, "serverCustomAttributes": {"oOHmSgwQ": {}, "h3K1p3ZL": {}, "zzZLnSoV": {}}, "slotId": "97aljgdj", "sourceItemId": "K8Ssrh5R", "tags": ["db3teb1h", "EGL9AGr7", "HHzgJxTq"], "type": "DfrGNvUB"}, {"customAttributes": {"dgSYvnfq": {}, "1DdVj1h1": {}, "gWDtozPO": {}}, "serverCustomAttributes": {"NK1e9w7i": {}, "bGShBJxO": {}, "2Tr2mFWX": {}}, "slotId": "SdSwveGq", "sourceItemId": "qLQzFXFP", "tags": ["V07FqdoB", "aWsnCWxl", "QmkuoEaP"], "type": "n9CQNKtL"}]' \
    > test.out 2>&1
eval_tap $? 26 'AdminBulkUpdateMyItems' test.out

#- 27 AdminSaveItemToInventory
./ng net.accelbyte.sdk.cli.Main inventory adminSaveItemToInventory \
    --inventoryId 'q11G7Z7X' \
    --namespace "$AB_NAMESPACE" \
    --userId 'DEozHHzz' \
    --body '{"customAttributes": {"1RnXrVsf": {}, "DaQ34jDE": {}, "B8bFhzko": {}}, "qty": 89, "serverCustomAttributes": {"OXrvqsBk": {}, "3Mdeivux": {}, "5U2QDqYM": {}}, "slotId": "3mYHvueU", "slotUsed": 71, "source": "OTHER", "sourceItemId": "bIAmyyra", "tags": ["PCTB0HP2", "qg6KI7kN", "GqiX8LoI"], "type": "m5rX55pg"}' \
    > test.out 2>&1
eval_tap $? 27 'AdminSaveItemToInventory' test.out

#- 28 AdminBulkRemoveItems
./ng net.accelbyte.sdk.cli.Main inventory adminBulkRemoveItems \
    --inventoryId 'J9GEY8rx' \
    --namespace "$AB_NAMESPACE" \
    --userId 'TqHStZFH' \
    --body '[{"slotId": "vESo2URg", "sourceItemId": "ENFMOBqj"}, {"slotId": "KkG70LgJ", "sourceItemId": "KcqkMJkc"}, {"slotId": "PEEc0kmr", "sourceItemId": "P3Eplx4O"}]' \
    > test.out 2>&1
eval_tap $? 28 'AdminBulkRemoveItems' test.out

#- 29 AdminBulkSaveItemToInventory
./ng net.accelbyte.sdk.cli.Main inventory adminBulkSaveItemToInventory \
    --inventoryId 'mIngfSDj' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Pz5iTWBm' \
    --body '[{"customAttributes": {"9AUxp2Ad": {}, "FLQvBwSo": {}, "OnFvcNne": {}}, "qty": 71, "serverCustomAttributes": {"QgQhgQJZ": {}, "5xVW6pZV": {}, "ABcuCDu5": {}}, "slotId": "nHljrEZW", "slotUsed": 64, "source": "OTHER", "sourceItemId": "BZ6z4rJc", "tags": ["avTVrxeG", "7sPpcvSt", "u87F1ypn"], "type": "l0Tex0yp"}, {"customAttributes": {"8QA8LuLs": {}, "87jrpgE5": {}, "tJL0nTG0": {}}, "qty": 73, "serverCustomAttributes": {"czUb54ij": {}, "AMhKwe4f": {}, "YI7jpfG7": {}}, "slotId": "oMsSJGFe", "slotUsed": 44, "source": "ECOMMERCE", "sourceItemId": "h01HFFLW", "tags": ["NV49bkkL", "hmvhkgxc", "rFApvBPk"], "type": "WvpIYmHz"}, {"customAttributes": {"q0UuFbuz": {}, "eqXHpaaV": {}, "IklcX7yH": {}}, "qty": 69, "serverCustomAttributes": {"3Y2qef7v": {}, "JMsTJttN": {}, "3NKiMYEv": {}}, "slotId": "hNyXEB9M", "slotUsed": 51, "source": "ECOMMERCE", "sourceItemId": "V5LqAZmc", "tags": ["8F3MgLmA", "SkZFBrFl", "1h192udL"], "type": "S57yjYxn"}]' \
    > test.out 2>&1
eval_tap $? 29 'AdminBulkSaveItemToInventory' test.out

#- 30 AdminUpdateUserInventoriesByInventoryCode
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateUserInventoriesByInventoryCode \
    --inventoryConfigurationCode 'WBdzPxJG' \
    --namespace "$AB_NAMESPACE" \
    --userId 't3PoSINb' \
    --body '{"incMaxSlots": 24}' \
    > test.out 2>&1
eval_tap $? 30 'AdminUpdateUserInventoriesByInventoryCode' test.out

#- 31 AdminSaveItem
./ng net.accelbyte.sdk.cli.Main inventory adminSaveItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'IvNxe8l7' \
    --body '{"customAttributes": {"z4ia1erc": {}, "4fmMVn1x": {}, "zVcEUXZg": {}}, "inventoryConfigurationCode": "zhrx5yQb", "qty": 44, "serverCustomAttributes": {"3yGQRHaK": {}, "y4pu99oP": {}, "zyK565WB": {}}, "slotId": "4IE4zjJB", "slotUsed": 26, "source": "OTHER", "sourceItemId": "Vd0U1AD4", "tags": ["X3fMEFoW", "OAfjWJUh", "LRKwKOYi"], "type": "p33vBKFO"}' \
    > test.out 2>&1
eval_tap $? 31 'AdminSaveItem' test.out

#- 32 AdminBulkSaveItem
./ng net.accelbyte.sdk.cli.Main inventory adminBulkSaveItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'KJ6FC3uI' \
    --body '[{"customAttributes": {"rD4u8d9N": {}, "LqpkBwLh": {}, "8EhJpFSJ": {}}, "inventoryConfigurationCode": "vXV96GZu", "qty": 61, "serverCustomAttributes": {"LvFi9BDE": {}, "4Kq1ikl6": {}, "RZtuwdwX": {}}, "slotId": "75ctph7z", "slotUsed": 59, "source": "OTHER", "sourceItemId": "lYfvycs9", "tags": ["Ee3ThzRa", "S39metwR", "OUJCbOAS"], "type": "UKHXRZ4z"}, {"customAttributes": {"juZTSDuj": {}, "SYhyGuBn": {}, "aPjk0UKR": {}}, "inventoryConfigurationCode": "jO78sUiN", "qty": 93, "serverCustomAttributes": {"sSqmZeqG": {}, "5dw3uoeD": {}, "s59QzwzR": {}}, "slotId": "57C6PXGg", "slotUsed": 36, "source": "OTHER", "sourceItemId": "jYiKZgT1", "tags": ["akMvQddw", "PnVuxyJ1", "L73w4AcR"], "type": "hcMlrscS"}, {"customAttributes": {"MR2SfrJL": {}, "gvUc7aJK": {}, "vIEn5HJQ": {}}, "inventoryConfigurationCode": "VurI4PTi", "qty": 53, "serverCustomAttributes": {"4xDQM8a3": {}, "Fl2h78Vj": {}, "OUz79OQE": {}}, "slotId": "m3yAjGEF", "slotUsed": 20, "source": "OTHER", "sourceItemId": "LIpk6niR", "tags": ["1glcaCnb", "GaaeSb6t", "IHtbTUDq"], "type": "gJGmiVfb"}]' \
    > test.out 2>&1
eval_tap $? 32 'AdminBulkSaveItem' test.out

#- 33 AdminSyncUserEntitlements
./ng net.accelbyte.sdk.cli.Main inventory adminSyncUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId '7Dbs6QO7' \
    > test.out 2>&1
eval_tap $? 33 'AdminSyncUserEntitlements' test.out

#- 34 AdminPurchasable
./ng net.accelbyte.sdk.cli.Main inventory adminPurchasable \
    --namespace "$AB_NAMESPACE" \
    --userId 'x2UAw7zk' \
    --body '{"entitlementType": "HgHmfWtg", "inventoryConfig": {"slotUsed": 43}, "itemId": "d0LGW2lQ", "itemType": "NvnuWPXD", "items": [{"bundledQty": 21, "entitlementType": "IbTfIqcS", "inventoryConfig": {"slotUsed": 85}, "itemId": "Xb7u4xxE", "itemType": "waTfdRCr", "sku": "bMG7eCke", "stackable": false, "useCount": 30}, {"bundledQty": 26, "entitlementType": "EmO6artv", "inventoryConfig": {"slotUsed": 49}, "itemId": "Mqi1bRkL", "itemType": "06rLV5zo", "sku": "UVPvYoRp", "stackable": false, "useCount": 30}, {"bundledQty": 71, "entitlementType": "5DD90Rjp", "inventoryConfig": {"slotUsed": 81}, "itemId": "hS3zgp6G", "itemType": "ZgcNSFc8", "sku": "SvvHPZEX", "stackable": true, "useCount": 47}], "quantity": 60, "sku": "Xp6vt3zm", "stackable": true, "useCount": 85}' \
    > test.out 2>&1
eval_tap $? 34 'AdminPurchasable' test.out

#- 35 PublicListInventoryConfigurations
./ng net.accelbyte.sdk.cli.Main inventory publicListInventoryConfigurations \
    --namespace "$AB_NAMESPACE" \
    --code '9Uih88bN' \
    --limit '85' \
    --offset '52' \
    --sortBy 'updatedAt' \
    > test.out 2>&1
eval_tap $? 35 'PublicListInventoryConfigurations' test.out

#- 36 PublicListItemTypes
./ng net.accelbyte.sdk.cli.Main inventory publicListItemTypes \
    --namespace "$AB_NAMESPACE" \
    --limit '5' \
    --offset '45' \
    --sortBy 'name:desc' \
    > test.out 2>&1
eval_tap $? 36 'PublicListItemTypes' test.out

#- 37 PublicListTags
./ng net.accelbyte.sdk.cli.Main inventory publicListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '57' \
    --offset '55' \
    --sortBy 'createdAt' \
    > test.out 2>&1
eval_tap $? 37 'PublicListTags' test.out

#- 38 PublicListInventories
./ng net.accelbyte.sdk.cli.Main inventory publicListInventories \
    --namespace "$AB_NAMESPACE" \
    --inventoryConfigurationCode 'rcGllJCQ' \
    --limit '38' \
    --offset '49' \
    --sortBy 'createdAt:desc' \
    > test.out 2>&1
eval_tap $? 38 'PublicListInventories' test.out

#- 39 PublicConsumeMyItem
./ng net.accelbyte.sdk.cli.Main inventory publicConsumeMyItem \
    --inventoryId 'BoZUKxZx' \
    --namespace "$AB_NAMESPACE" \
    --body '{"options": ["1jPfQXVi", "LAwhl7wO", "cKTyNs7t"], "qty": 88, "slotId": "3ELPIbH6", "sourceItemId": "FJPv49Yi"}' \
    > test.out 2>&1
eval_tap $? 39 'PublicConsumeMyItem' test.out

#- 40 PublicListItems
./ng net.accelbyte.sdk.cli.Main inventory publicListItems \
    --inventoryId 'vx6XmMU4' \
    --namespace "$AB_NAMESPACE" \
    --limit '48' \
    --offset '45' \
    --sortBy 'updatedAt:asc' \
    --sourceItemId 'vtDcoYsL' \
    --tags 'bJf6UX4W' \
    > test.out 2>&1
eval_tap $? 40 'PublicListItems' test.out

#- 41 PublicBulkUpdateMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicBulkUpdateMyItems \
    --inventoryId '3pFsw12b' \
    --namespace "$AB_NAMESPACE" \
    --body '[{"customAttributes": {"6GDKeOJ7": {}, "54L9dLIa": {}, "aOfpSwPr": {}}, "slotId": "vI4lT9cx", "sourceItemId": "D6RUKfNt", "tags": ["xbLmBd6a", "t1hoI3Mm", "imyEYCrL"]}, {"customAttributes": {"YBhJh6Ue": {}, "aKjqryzq": {}, "s5O04Gm2": {}}, "slotId": "9JXMuBZ8", "sourceItemId": "1ga68MC3", "tags": ["UvLpPFe0", "8wVoP2GF", "BsPnJrT6"]}, {"customAttributes": {"pv452Bxc": {}, "HpjIdafB": {}, "xe6Zg64R": {}}, "slotId": "A0NKqrbv", "sourceItemId": "1Z1jxuVZ", "tags": ["MmjFRXCx", "lzV1JGjs", "0AD1Xavs"]}]' \
    > test.out 2>&1
eval_tap $? 41 'PublicBulkUpdateMyItems' test.out

#- 42 PublicBulkRemoveMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicBulkRemoveMyItems \
    --inventoryId 'QXsQF4jw' \
    --namespace "$AB_NAMESPACE" \
    --body '[{"slotId": "pfJySByI", "sourceItemId": "CwNHKxXl"}, {"slotId": "ZJMGSpg4", "sourceItemId": "Y3637b2u"}, {"slotId": "WC0OwY0E", "sourceItemId": "B00Nx6xG"}]' \
    > test.out 2>&1
eval_tap $? 42 'PublicBulkRemoveMyItems' test.out

#- 43 PublicMoveMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicMoveMyItems \
    --inventoryId 'TatLxVNW' \
    --namespace "$AB_NAMESPACE" \
    --body '{"items": [{"qty": 72, "slotId": "vB8tUiWM", "sourceItemId": "8rsyqtPz"}, {"qty": 67, "slotId": "vMzjc8nP", "sourceItemId": "tnamKCi4"}, {"qty": 47, "slotId": "bjp01Voo", "sourceItemId": "HFlbxo8S"}], "srcInventoryId": "o65ysD1C"}' \
    > test.out 2>&1
eval_tap $? 43 'PublicMoveMyItems' test.out

#- 44 PublicGetItem
./ng net.accelbyte.sdk.cli.Main inventory publicGetItem \
    --inventoryId '1Wioa6hC' \
    --namespace "$AB_NAMESPACE" \
    --slotId 'DKzmpQy4' \
    --sourceItemId 'xjqvKw1S' \
    > test.out 2>&1
eval_tap $? 44 'PublicGetItem' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
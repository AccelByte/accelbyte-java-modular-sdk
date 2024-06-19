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
    --body '{"message": "ZAG8zPEa", "operations": [{"consumeItems": [{"inventoryId": "ziPiArkE", "qty": 67, "slotId": "tjPno8xc", "sourceItemId": "CA9Lpjp6"}, {"inventoryId": "NSyUu7P4", "qty": 30, "slotId": "ft30z8rO", "sourceItemId": "nK1sJfPW"}, {"inventoryId": "U0bionZe", "qty": 65, "slotId": "l7LFQcrK", "sourceItemId": "VhirGkGA"}], "createItems": [{"customAttributes": {"5Sn77Qvt": {}, "CQtvNT4M": {}, "B8hwG7Rm": {}}, "inventoryConfigurationCode": "W0r04zyZ", "inventoryId": "xAO64cqi", "qty": 90, "serverCustomAttributes": {"uxWUWpPC": {}, "vitYpURU": {}, "MWr2ezRP": {}}, "slotId": "IqPmqasr", "slotUsed": 94, "sourceItemId": "wLyNQaFv", "tags": ["X7Qjez33", "2Ipi4MCz", "lwoEpioK"], "toSpecificInventory": false, "type": "QeHyF32p"}, {"customAttributes": {"7Tb2H3S8": {}, "2aWxh21V": {}, "rDwKVG6d": {}}, "inventoryConfigurationCode": "vgmnLVEv", "inventoryId": "mCkwy4sM", "qty": 5, "serverCustomAttributes": {"yY2MliNr": {}, "JZ8DUCid": {}, "QjpfTHoj": {}}, "slotId": "aqwojahN", "slotUsed": 42, "sourceItemId": "UbnJNtRe", "tags": ["E1LHcDx3", "2RffEvq5", "IGtP0pul"], "toSpecificInventory": true, "type": "GitRlXz6"}, {"customAttributes": {"vqTcNUAy": {}, "kPmkCOFM": {}, "Mc1ZwxQg": {}}, "inventoryConfigurationCode": "T6uhm21d", "inventoryId": "YE7yjton", "qty": 30, "serverCustomAttributes": {"Rr5vLgy8": {}, "gAwx7Rfy": {}, "6G6cU5NI": {}}, "slotId": "Vy6zKFwg", "slotUsed": 45, "sourceItemId": "vQxv6Y9z", "tags": ["ldGsWIjQ", "CkRv5ooC", "8K1zeYfQ"], "toSpecificInventory": false, "type": "gCzK0SUR"}], "removeItems": [{"inventoryId": "KpV4bCkI", "slotId": "N3tFeRBy", "sourceItemId": "xk1GW8nz"}, {"inventoryId": "DGjkhG3D", "slotId": "KN0G7pfi", "sourceItemId": "qeKNfJwD"}, {"inventoryId": "Ag723Bcf", "slotId": "wCfCOOxA", "sourceItemId": "LrKvnRYZ"}], "targetUserId": "Y6vaOltq", "updateItems": [{"customAttributes": {"1UjXig3D": {}, "Pta9iUi5": {}, "TtUxLun8": {}}, "inventoryId": "zfMkTS6g", "serverCustomAttributes": {"vagGVjGo": {}, "wSbmehrE": {}, "tXECwyb4": {}}, "slotId": "cWUsF1FN", "sourceItemId": "qoEwvMa3", "tags": ["D85tqJV2", "CDcuQzqK", "jovsrDli"], "type": "NcBpzhxv"}, {"customAttributes": {"3qVYggrM": {}, "tTDGkB2Z": {}, "QYMcwywy": {}}, "inventoryId": "DXmsZCB9", "serverCustomAttributes": {"F8qsTroJ": {}, "YJgxNUtr": {}, "oEJcPkpH": {}}, "slotId": "6iYYQUPn", "sourceItemId": "GB45UkkC", "tags": ["zHTy1e5l", "Bn0WNehq", "QmTblzdy"], "type": "cEYrY4bG"}, {"customAttributes": {"mINy53m8": {}, "UCBrExFf": {}, "i723p41r": {}}, "inventoryId": "8VNBXzCF", "serverCustomAttributes": {"mcaX8rr6": {}, "kHaJwr5c": {}, "5bOmw4oz": {}}, "slotId": "sKmRGPa1", "sourceItemId": "bo54sSL6", "tags": ["8acAhG33", "G4uM80lf", "opSXJPl7"], "type": "dHcbMD9A"}]}, {"consumeItems": [{"inventoryId": "VFOpkz5o", "qty": 93, "slotId": "OTrr5vi8", "sourceItemId": "H6IuPFai"}, {"inventoryId": "erlEjDu5", "qty": 37, "slotId": "o8pbeShX", "sourceItemId": "aanqqXVv"}, {"inventoryId": "eIHqd4HW", "qty": 10, "slotId": "a8urau1f", "sourceItemId": "vjW9yqnm"}], "createItems": [{"customAttributes": {"qC165ol9": {}, "yhgsTBPP": {}, "a13WBEnY": {}}, "inventoryConfigurationCode": "nWtbmxrf", "inventoryId": "l6OXiUuM", "qty": 18, "serverCustomAttributes": {"7iNUH4O1": {}, "SrVILESl": {}, "GN51reJT": {}}, "slotId": "useyavcr", "slotUsed": 37, "sourceItemId": "mL8mwoj6", "tags": ["4GoTNEXP", "zc0CurEI", "J2sgUOVT"], "toSpecificInventory": true, "type": "aaZJsksb"}, {"customAttributes": {"0nraqNqD": {}, "5VHAivdP": {}, "Z7MN36U7": {}}, "inventoryConfigurationCode": "ibcHoEWh", "inventoryId": "COQSgvf1", "qty": 63, "serverCustomAttributes": {"KTUj38GX": {}, "vDyxtFUl": {}, "fYFQQUyv": {}}, "slotId": "IjW0X6ix", "slotUsed": 75, "sourceItemId": "mNDcPqID", "tags": ["wY88ZmIY", "jeFLbhxF", "1ehfaO40"], "toSpecificInventory": false, "type": "RspZkyTj"}, {"customAttributes": {"weHe3EFH": {}, "iryrR1wc": {}, "NbtQw9pj": {}}, "inventoryConfigurationCode": "LCIb4mM6", "inventoryId": "j2LjDsxj", "qty": 78, "serverCustomAttributes": {"I3tVB9aG": {}, "G7W18CPs": {}, "1FH8GwJm": {}}, "slotId": "tKpsPdNR", "slotUsed": 75, "sourceItemId": "dxfM7S6T", "tags": ["tqT3UX6a", "dL8CKAnz", "iqrx2SHe"], "toSpecificInventory": false, "type": "NusL72Tn"}], "removeItems": [{"inventoryId": "IIl1paih", "slotId": "eX2hrXZS", "sourceItemId": "xJzNGVNV"}, {"inventoryId": "f7IF416s", "slotId": "A3qyv2TQ", "sourceItemId": "IviVwKz3"}, {"inventoryId": "B4tcv9da", "slotId": "AOytsATO", "sourceItemId": "9zL1S4BH"}], "targetUserId": "fZKuolTq", "updateItems": [{"customAttributes": {"SQq16hCB": {}, "uDj486yg": {}, "z56baqVk": {}}, "inventoryId": "0xZFrWld", "serverCustomAttributes": {"6KhvwQ8A": {}, "81ZpOaBE": {}, "5Xu4z7yu": {}}, "slotId": "b7JObwCU", "sourceItemId": "a788kHn5", "tags": ["wgwDg8Ww", "ljarmlm5", "ykE4GZoh"], "type": "wMLCgaGA"}, {"customAttributes": {"dsAxe9iv": {}, "BPLZJyVe": {}, "wDRMwLWJ": {}}, "inventoryId": "3MOfnbKR", "serverCustomAttributes": {"hvxrWHVd": {}, "SLXgB3iM": {}, "qz3d1peP": {}}, "slotId": "NEsA87OQ", "sourceItemId": "fjLOyDWe", "tags": ["qIx508Oc", "ijPtx3nd", "lfu1lTIm"], "type": "aLGNfKl2"}, {"customAttributes": {"w7ugZdf0": {}, "cmFJzYJ4": {}, "hjzsffK2": {}}, "inventoryId": "vcxVS9aA", "serverCustomAttributes": {"Y2IfLwPs": {}, "7F2ZNZxN": {}, "KCgHJpbr": {}}, "slotId": "NpF5vKee", "sourceItemId": "Z8VMopok", "tags": ["fPKI6TNa", "EKlYcF38", "RjpHBMbA"], "type": "R5pKczJm"}]}, {"consumeItems": [{"inventoryId": "3956wz27", "qty": 37, "slotId": "Og0MGNhl", "sourceItemId": "WNByNO3a"}, {"inventoryId": "dno8aNJo", "qty": 95, "slotId": "vfVXQCxD", "sourceItemId": "QavtB2DX"}, {"inventoryId": "ACXGkVnU", "qty": 44, "slotId": "Kw2n68m3", "sourceItemId": "6kV8TMkB"}], "createItems": [{"customAttributes": {"yuEMbPHR": {}, "qOHxatKe": {}, "frPC5JcI": {}}, "inventoryConfigurationCode": "xUMzda41", "inventoryId": "nUBQwAFA", "qty": 7, "serverCustomAttributes": {"fwt2aRe3": {}, "qrkbgEn4": {}, "hYKdQcdY": {}}, "slotId": "Dpea2JSK", "slotUsed": 9, "sourceItemId": "UKu9GZYo", "tags": ["f0Im5LhF", "18PO0FnU", "VC60zr8a"], "toSpecificInventory": false, "type": "acYYceIS"}, {"customAttributes": {"SeVADngM": {}, "9oM3RAjp": {}, "0v6wvce8": {}}, "inventoryConfigurationCode": "txP8S1tQ", "inventoryId": "evz8ImBO", "qty": 67, "serverCustomAttributes": {"W8518S18": {}, "GgU3VxH1": {}, "w7f7CsjF": {}}, "slotId": "9u8uAXdz", "slotUsed": 66, "sourceItemId": "SGMF6dxN", "tags": ["nFDzyAra", "CFl25uXY", "XYq7A0ro"], "toSpecificInventory": false, "type": "oVePCxXY"}, {"customAttributes": {"DpUpcSR8": {}, "ZW4cguSW": {}, "rPRKUJpd": {}}, "inventoryConfigurationCode": "x2DQgJcL", "inventoryId": "ReKNE6RI", "qty": 30, "serverCustomAttributes": {"6rB7CgFw": {}, "RNn26Tso": {}, "bJEniy22": {}}, "slotId": "JIy5fBqD", "slotUsed": 60, "sourceItemId": "euKpy7Zq", "tags": ["rgvFOGfr", "fDMbNSYp", "Bow2H0o0"], "toSpecificInventory": false, "type": "EvulbD7x"}], "removeItems": [{"inventoryId": "ob5l4Gbm", "slotId": "GUNYZOuE", "sourceItemId": "sbGNB3Kh"}, {"inventoryId": "3muE9jxq", "slotId": "wBTlkPKO", "sourceItemId": "sjBEq0dO"}, {"inventoryId": "nLSPz8Oc", "slotId": "iw9f5JJg", "sourceItemId": "ZZBj8s61"}], "targetUserId": "GnalsmvW", "updateItems": [{"customAttributes": {"ytH7x7JA": {}, "GPuv8uep": {}, "n1cXW3ID": {}}, "inventoryId": "EEziPh81", "serverCustomAttributes": {"ZIDAFztP": {}, "xgpTHkAA": {}, "Wsucc0Ij": {}}, "slotId": "qyWpZecS", "sourceItemId": "VtfeCOaT", "tags": ["EfjVsYFU", "hqq6ptJF", "dQ42ppLt"], "type": "dzGiTASo"}, {"customAttributes": {"0EDmEPoq": {}, "1sqCFDl6": {}, "S80iiaJq": {}}, "inventoryId": "a8iyYpiI", "serverCustomAttributes": {"bzqtB8a8": {}, "KdvGPmIe": {}, "SaiIl5pS": {}}, "slotId": "fiDVcn9r", "sourceItemId": "NSk4qybz", "tags": ["djZYtn7J", "CgI1KBoG", "XDwviOS8"], "type": "kWleuFzD"}, {"customAttributes": {"eLD9QVBv": {}, "ePqeHHCT": {}, "E7IDjJMv": {}}, "inventoryId": "czseP5Fa", "serverCustomAttributes": {"gxfX1mAj": {}, "CzgICCaT": {}, "ycxa3Yp8": {}}, "slotId": "sgNdskFU", "sourceItemId": "MX5OrTKw", "tags": ["v3cKew3Q", "KUxRtEt0", "zbvuRAfS"], "type": "FtRe68Lo"}]}], "requestId": "IXLkLqmr"}' \
    > test.out 2>&1
eval_tap $? 2 'AdminCreateChainingOperations' test.out

#- 3 AdminListIntegrationConfigurations
./ng net.accelbyte.sdk.cli.Main inventory adminListIntegrationConfigurations \
    --namespace "$AB_NAMESPACE" \
    --limit '14' \
    --offset '45' \
    --sortBy 'createdAt:asc' \
    > test.out 2>&1
eval_tap $? 3 'AdminListIntegrationConfigurations' test.out

#- 4 AdminCreateIntegrationConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminCreateIntegrationConfiguration \
    --namespace "$AB_NAMESPACE" \
    --body '{"mapItemType": ["EjnUz7pJ", "Oa8G2Dr9", "hHPKo0yO"], "serviceName": "jBNGYjny", "targetInventoryCode": "ehftizNa"}' \
    > test.out 2>&1
eval_tap $? 4 'AdminCreateIntegrationConfiguration' test.out

#- 5 AdminUpdateIntegrationConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateIntegrationConfiguration \
    --integrationConfigurationId 'rqq9skDQ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"mapItemType": ["owtYg1Jw", "kc8ZUtTY", "wTVRqiSg"], "serviceName": "iWvGLuV5", "targetInventoryCode": "40zrqiBM"}' \
    > test.out 2>&1
eval_tap $? 5 'AdminUpdateIntegrationConfiguration' test.out

#- 6 AdminUpdateStatusIntegrationConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateStatusIntegrationConfiguration \
    --integrationConfigurationId '9lefK6Rl' \
    --namespace "$AB_NAMESPACE" \
    --body '{"status": "TIED"}' \
    > test.out 2>&1
eval_tap $? 6 'AdminUpdateStatusIntegrationConfiguration' test.out

#- 7 AdminListInventories
./ng net.accelbyte.sdk.cli.Main inventory adminListInventories \
    --namespace "$AB_NAMESPACE" \
    --inventoryConfigurationCode 'DB5MkiYD' \
    --limit '4' \
    --offset '19' \
    --sortBy 'updatedAt:desc' \
    --userId 'ENJWDzWl' \
    > test.out 2>&1
eval_tap $? 7 'AdminListInventories' test.out

#- 8 AdminCreateInventory
./ng net.accelbyte.sdk.cli.Main inventory adminCreateInventory \
    --namespace "$AB_NAMESPACE" \
    --body '{"inventoryConfigurationCode": "rLOT1woL", "userId": "FHCWkNX1"}' \
    > test.out 2>&1
eval_tap $? 8 'AdminCreateInventory' test.out

#- 9 AdminGetInventory
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventory \
    --inventoryId '34ptT6D4' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'AdminGetInventory' test.out

#- 10 AdminUpdateInventory
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateInventory \
    --inventoryId 'KQYpE7tY' \
    --namespace "$AB_NAMESPACE" \
    --body '{"incMaxSlots": 50}' \
    > test.out 2>&1
eval_tap $? 10 'AdminUpdateInventory' test.out

#- 11 DeleteInventory
./ng net.accelbyte.sdk.cli.Main inventory deleteInventory \
    --inventoryId 'QiFNsV4R' \
    --namespace "$AB_NAMESPACE" \
    --body '{"message": "kSNUWJdG"}' \
    > test.out 2>&1
eval_tap $? 11 'DeleteInventory' test.out

#- 12 AdminListItems
./ng net.accelbyte.sdk.cli.Main inventory adminListItems \
    --inventoryId '3sRldasG' \
    --namespace "$AB_NAMESPACE" \
    --limit '43' \
    --offset '19' \
    --sortBy 'createdAt:desc' \
    --sourceItemId 'najz6TP2' \
    --tags 'KfUw1yI9' \
    > test.out 2>&1
eval_tap $? 12 'AdminListItems' test.out

#- 13 AdminGetInventoryItem
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventoryItem \
    --inventoryId 'voslqySO' \
    --namespace "$AB_NAMESPACE" \
    --slotId 'sBS0rwCE' \
    --sourceItemId 'y9Pr0tFw' \
    > test.out 2>&1
eval_tap $? 13 'AdminGetInventoryItem' test.out

#- 14 AdminListInventoryConfigurations
./ng net.accelbyte.sdk.cli.Main inventory adminListInventoryConfigurations \
    --namespace "$AB_NAMESPACE" \
    --code 'NCyASm7b' \
    --limit '11' \
    --offset '96' \
    --sortBy 'code' \
    > test.out 2>&1
eval_tap $? 14 'AdminListInventoryConfigurations' test.out

#- 15 AdminCreateInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminCreateInventoryConfiguration \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "kUNz0hrw", "description": "p1g9hEqv", "initialMaxSlots": 44, "maxInstancesPerUser": 41, "maxUpgradeSlots": 9, "name": "vBPykmIu"}' \
    > test.out 2>&1
eval_tap $? 15 'AdminCreateInventoryConfiguration' test.out

#- 16 AdminGetInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventoryConfiguration \
    --inventoryConfigurationId 'vIAPizHs' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'AdminGetInventoryConfiguration' test.out

#- 17 AdminUpdateInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateInventoryConfiguration \
    --inventoryConfigurationId '4Boyne9B' \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "E4MM16rA", "description": "L2HEGRwm", "initialMaxSlots": 76, "maxInstancesPerUser": 34, "maxUpgradeSlots": 32, "name": "atQ0ZB7G"}' \
    > test.out 2>&1
eval_tap $? 17 'AdminUpdateInventoryConfiguration' test.out

#- 18 AdminDeleteInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteInventoryConfiguration \
    --inventoryConfigurationId 'zih8rB1M' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminDeleteInventoryConfiguration' test.out

#- 19 AdminListItemTypes
./ng net.accelbyte.sdk.cli.Main inventory adminListItemTypes \
    --namespace "$AB_NAMESPACE" \
    --limit '67' \
    --offset '54' \
    --sortBy 'createdAt:desc' \
    > test.out 2>&1
eval_tap $? 19 'AdminListItemTypes' test.out

#- 20 AdminCreateItemType
./ng net.accelbyte.sdk.cli.Main inventory adminCreateItemType \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "NhNWUSzg"}' \
    > test.out 2>&1
eval_tap $? 20 'AdminCreateItemType' test.out

#- 21 AdminDeleteItemType
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteItemType \
    --itemTypeName 'CWRf0Yai' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'AdminDeleteItemType' test.out

#- 22 AdminListTags
./ng net.accelbyte.sdk.cli.Main inventory adminListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '5' \
    --offset '40' \
    --owner 'PbYUsxA7' \
    --sortBy 'createdAt:asc' \
    > test.out 2>&1
eval_tap $? 22 'AdminListTags' test.out

#- 23 AdminCreateTag
./ng net.accelbyte.sdk.cli.Main inventory adminCreateTag \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "knL6Z0yC", "owner": "CLIENT"}' \
    > test.out 2>&1
eval_tap $? 23 'AdminCreateTag' test.out

#- 24 AdminDeleteTag
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteTag \
    --namespace "$AB_NAMESPACE" \
    --tagName 'KpGPCugv' \
    > test.out 2>&1
eval_tap $? 24 'AdminDeleteTag' test.out

#- 25 AdminConsumeUserItem
./ng net.accelbyte.sdk.cli.Main inventory adminConsumeUserItem \
    --inventoryId 'Y5ctELbP' \
    --namespace "$AB_NAMESPACE" \
    --userId 'BftlSvtk' \
    --body '{"qty": 26, "slotId": "wpWqNsjL", "sourceItemId": "S3mtf02h"}' \
    > test.out 2>&1
eval_tap $? 25 'AdminConsumeUserItem' test.out

#- 26 AdminBulkUpdateMyItems
./ng net.accelbyte.sdk.cli.Main inventory adminBulkUpdateMyItems \
    --inventoryId 'KuSzve8h' \
    --namespace "$AB_NAMESPACE" \
    --userId 'PZLx1fz0' \
    --body '[{"customAttributes": {"YwhuEjgB": {}, "cYxtywEF": {}, "GAYBJxv4": {}}, "serverCustomAttributes": {"sSirs5lr": {}, "MKDeOzaq": {}, "6wmQZGos": {}}, "slotId": "W0b1V1ds", "sourceItemId": "AhftAgdh", "tags": ["V351g1w5", "lSN0G5cX", "hRS2tyvC"], "type": "0kdKOtJ0"}, {"customAttributes": {"GNU0f8pz": {}, "yYP72Ycu": {}, "sv3NW0iL": {}}, "serverCustomAttributes": {"QCBLr5Y2": {}, "wobenv7s": {}, "POPpJLpI": {}}, "slotId": "8LQHCuVp", "sourceItemId": "rrvQZDsl", "tags": ["2dnYkTIi", "Z6eKD2g2", "Ln4zeoYH"], "type": "3eWdTAhP"}, {"customAttributes": {"ezVc4biS": {}, "i3l4QX33": {}, "PQOofZuA": {}}, "serverCustomAttributes": {"GlP3sbNK": {}, "jrQaPDC5": {}, "KLIPiDHK": {}}, "slotId": "E2PWa93q", "sourceItemId": "49hmyBB7", "tags": ["4UJZ7C6F", "u1ZCoAW3", "wjHDWRnf"], "type": "vYmDf9of"}]' \
    > test.out 2>&1
eval_tap $? 26 'AdminBulkUpdateMyItems' test.out

#- 27 AdminSaveItemToInventory
./ng net.accelbyte.sdk.cli.Main inventory adminSaveItemToInventory \
    --inventoryId 'aJr4mJWw' \
    --namespace "$AB_NAMESPACE" \
    --userId 'v6RzNMj5' \
    --body '{"customAttributes": {"7EpngtHG": {}, "eiK7U5sK": {}, "gbtDONnX": {}}, "qty": 32, "serverCustomAttributes": {"rIPolIPk": {}, "bXJlHmqn": {}, "0Qpap97q": {}}, "slotId": "oje7ryyG", "slotUsed": 32, "source": "OTHER", "sourceItemId": "a0VGylWU", "tags": ["nzVenJQD", "miUOB7kh", "YmkDLlL0"], "type": "6oahumm9"}' \
    > test.out 2>&1
eval_tap $? 27 'AdminSaveItemToInventory' test.out

#- 28 AdminBulkRemoveItems
./ng net.accelbyte.sdk.cli.Main inventory adminBulkRemoveItems \
    --inventoryId 'K5gHIhCl' \
    --namespace "$AB_NAMESPACE" \
    --userId 'IiCO5UYy' \
    --body '[{"slotId": "2zpm4vJf", "sourceItemId": "3ZmC8Ssk"}, {"slotId": "DI2Qhwcu", "sourceItemId": "eWv3VbV2"}, {"slotId": "LGUIie5A", "sourceItemId": "4aN7yznr"}]' \
    > test.out 2>&1
eval_tap $? 28 'AdminBulkRemoveItems' test.out

#- 29 AdminSaveItem
./ng net.accelbyte.sdk.cli.Main inventory adminSaveItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'jqqHXWcj' \
    --body '{"customAttributes": {"ek2nZ7XW": {}, "fvsrTxog": {}, "9lM22ccq": {}}, "inventoryConfigurationCode": "J39hjDgf", "qty": 48, "serverCustomAttributes": {"RtviRkvC": {}, "ftPdEjhZ": {}, "yK9ImNIC": {}}, "slotId": "0kjiy8zC", "slotUsed": 12, "source": "OTHER", "sourceItemId": "8KFWvLAq", "tags": ["naa8AsnD", "HIXu8yfQ", "mSfQgCgw"], "type": "2Fq6EZt6"}' \
    > test.out 2>&1
eval_tap $? 29 'AdminSaveItem' test.out

#- 30 AdminSyncUserEntitlements
./ng net.accelbyte.sdk.cli.Main inventory adminSyncUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'A2lwLprK' \
    > test.out 2>&1
eval_tap $? 30 'AdminSyncUserEntitlements' test.out

#- 31 AdminPurchasable
./ng net.accelbyte.sdk.cli.Main inventory adminPurchasable \
    --namespace "$AB_NAMESPACE" \
    --userId 'lofzL91p' \
    --body '{"entitlementType": "hA2agijG", "inventoryConfig": {"slotUsed": 22}, "itemId": "D1wNzl2H", "itemType": "2NIK1fvG", "items": [{"bundledQty": 87, "entitlementType": "IDBch48x", "inventoryConfig": {"slotUsed": 46}, "itemId": "rIrjEkVc", "itemType": "8zOA9lJf", "sku": "nAhKJbBm", "stackable": true, "useCount": 35}, {"bundledQty": 0, "entitlementType": "XlX6tgge", "inventoryConfig": {"slotUsed": 23}, "itemId": "i2SF1ApU", "itemType": "Yruc55pX", "sku": "paVPm57T", "stackable": false, "useCount": 26}, {"bundledQty": 20, "entitlementType": "DyU2h50T", "inventoryConfig": {"slotUsed": 99}, "itemId": "wsEA7Ueu", "itemType": "OdMgdxmp", "sku": "mN0IEsZB", "stackable": false, "useCount": 44}], "quantity": 5, "sku": "lt1pExEM", "stackable": false, "useCount": 28}' \
    > test.out 2>&1
eval_tap $? 31 'AdminPurchasable' test.out

#- 32 PublicListInventoryConfigurations
./ng net.accelbyte.sdk.cli.Main inventory publicListInventoryConfigurations \
    --namespace "$AB_NAMESPACE" \
    --code 'ts2mtWvS' \
    --limit '18' \
    --offset '23' \
    --sortBy 'code:desc' \
    > test.out 2>&1
eval_tap $? 32 'PublicListInventoryConfigurations' test.out

#- 33 PublicListItemTypes
./ng net.accelbyte.sdk.cli.Main inventory publicListItemTypes \
    --namespace "$AB_NAMESPACE" \
    --limit '77' \
    --offset '50' \
    --sortBy 'createdAt:desc' \
    > test.out 2>&1
eval_tap $? 33 'PublicListItemTypes' test.out

#- 34 PublicListTags
./ng net.accelbyte.sdk.cli.Main inventory publicListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '71' \
    --offset '13' \
    --sortBy 'name:asc' \
    > test.out 2>&1
eval_tap $? 34 'PublicListTags' test.out

#- 35 PublicListInventories
./ng net.accelbyte.sdk.cli.Main inventory publicListInventories \
    --namespace "$AB_NAMESPACE" \
    --inventoryConfigurationCode 'aMC3xQM0' \
    --limit '83' \
    --offset '69' \
    --sortBy 'updatedAt' \
    > test.out 2>&1
eval_tap $? 35 'PublicListInventories' test.out

#- 36 PublicConsumeMyItem
./ng net.accelbyte.sdk.cli.Main inventory publicConsumeMyItem \
    --inventoryId 'cdpd3lQz' \
    --namespace "$AB_NAMESPACE" \
    --body '{"qty": 35, "slotId": "CUnGTAGH", "sourceItemId": "8mtL4ZCq"}' \
    > test.out 2>&1
eval_tap $? 36 'PublicConsumeMyItem' test.out

#- 37 PublicListItems
./ng net.accelbyte.sdk.cli.Main inventory publicListItems \
    --inventoryId 'rz5sP1oB' \
    --namespace "$AB_NAMESPACE" \
    --limit '56' \
    --offset '58' \
    --sortBy 'createdAt' \
    --sourceItemId 'Izc7Tu5C' \
    --tags '1Xpbv5Dm' \
    > test.out 2>&1
eval_tap $? 37 'PublicListItems' test.out

#- 38 PublicBulkUpdateMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicBulkUpdateMyItems \
    --inventoryId 'aeh3BdV6' \
    --namespace "$AB_NAMESPACE" \
    --body '[{"customAttributes": {"PGhUYkta": {}, "plHBCpf3": {}, "Ff5bBcDA": {}}, "slotId": "miEJop60", "sourceItemId": "9YIBwHm3", "tags": ["RNNNVjKD", "NflMQQo2", "HBcX7uMf"]}, {"customAttributes": {"xpkMI405": {}, "FwoImwuq": {}, "RlZUZS5w": {}}, "slotId": "4VjqHaqC", "sourceItemId": "vOZCEDL0", "tags": ["EwDW4MQG", "UmY3sV6e", "o542k5N8"]}, {"customAttributes": {"xyplAHnb": {}, "4QYAW58U": {}, "rAWNTKI3": {}}, "slotId": "YKaA74ft", "sourceItemId": "fcmwCVjd", "tags": ["g6cOJWfa", "wrdQpm8v", "sFxcDvAJ"]}]' \
    > test.out 2>&1
eval_tap $? 38 'PublicBulkUpdateMyItems' test.out

#- 39 PublicBulkRemoveMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicBulkRemoveMyItems \
    --inventoryId 'WIDfjJej' \
    --namespace "$AB_NAMESPACE" \
    --body '[{"slotId": "bf2A2gJd", "sourceItemId": "hwtPlHrQ"}, {"slotId": "zd1312GD", "sourceItemId": "56fOAvtP"}, {"slotId": "hwnsIxzQ", "sourceItemId": "WHkN6m9g"}]' \
    > test.out 2>&1
eval_tap $? 39 'PublicBulkRemoveMyItems' test.out

#- 40 PublicMoveMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicMoveMyItems \
    --inventoryId 'DtMAyJPP' \
    --namespace "$AB_NAMESPACE" \
    --body '{"items": [{"qty": 27, "slotId": "gX3aN6Cv", "sourceItemId": "D0DcIBc4"}, {"qty": 82, "slotId": "V9xPYQ98", "sourceItemId": "X2QBg0Fj"}, {"qty": 100, "slotId": "cWH3XPuM", "sourceItemId": "A2U6VOlr"}], "srcInventoryId": "S8CVlHgL"}' \
    > test.out 2>&1
eval_tap $? 40 'PublicMoveMyItems' test.out

#- 41 PublicGetItem
./ng net.accelbyte.sdk.cli.Main inventory publicGetItem \
    --inventoryId 'oCcoSsQO' \
    --namespace "$AB_NAMESPACE" \
    --slotId 'PTjmAouN' \
    --sourceItemId 'YCidLxSa' \
    > test.out 2>&1
eval_tap $? 41 'PublicGetItem' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
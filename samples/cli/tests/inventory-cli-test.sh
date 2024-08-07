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
    --body '{"message": "7Dr7KG2N", "operations": [{"consumeItems": [{"inventoryId": "7l8oTy8i", "qty": 17, "slotId": "EizqFEuo", "sourceItemId": "RfyVBqP1"}, {"inventoryId": "0yg4dSTI", "qty": 86, "slotId": "XMxRmDl7", "sourceItemId": "cdjYtJm0"}, {"inventoryId": "0NNX8juX", "qty": 21, "slotId": "wkehfUPu", "sourceItemId": "QM8iri0l"}], "createItems": [{"customAttributes": {"BUvUEoWu": {}, "flCPvbS9": {}, "n8jRO7t7": {}}, "inventoryConfigurationCode": "nrtBp6kb", "inventoryId": "wtrOrLrt", "qty": 4, "serverCustomAttributes": {"0vBsKeP7": {}, "RbEHPRd7": {}, "phFPtt9o": {}}, "slotId": "oek0UsbP", "slotUsed": 100, "source": "QQqH8HBK", "sourceItemId": "u3HQmbBc", "tags": ["mtP7CvpM", "PcMwEZPH", "RTHq8B3F"], "toSpecificInventory": true, "type": "ETAY02dH"}, {"customAttributes": {"bg2JLL4I": {}, "stcLrNMP": {}, "Jgj5k429": {}}, "inventoryConfigurationCode": "fkM01Fhm", "inventoryId": "wV9WTwen", "qty": 71, "serverCustomAttributes": {"Sby43pLX": {}, "L9i2KruK": {}, "mOYMcSoW": {}}, "slotId": "99hgGRX0", "slotUsed": 23, "source": "yjcOvs6E", "sourceItemId": "9AVdJybd", "tags": ["mnmcfJZ2", "s1QzMo7e", "sSB8VcNc"], "toSpecificInventory": true, "type": "jUa2teSt"}, {"customAttributes": {"1lyUH8uG": {}, "DmW4MRfV": {}, "6EIzu506": {}}, "inventoryConfigurationCode": "NsRUwSh3", "inventoryId": "3BXhZpGi", "qty": 25, "serverCustomAttributes": {"yPffQMCl": {}, "PzLwg7KU": {}, "RDQTLUys": {}}, "slotId": "YWjiIwMq", "slotUsed": 6, "source": "VSDEL78I", "sourceItemId": "YAi1TvhM", "tags": ["w2Uo787V", "oF0uGLPi", "G89CpXE7"], "toSpecificInventory": true, "type": "ZdQLLNdb"}], "removeItems": [{"inventoryId": "ke1tavkk", "slotId": "yTtuoOpx", "sourceItemId": "N3k58uF2"}, {"inventoryId": "o469BlHz", "slotId": "ooSrWoxh", "sourceItemId": "qwM2dxIY"}, {"inventoryId": "PDPMQA5D", "slotId": "pr5ZCYmz", "sourceItemId": "pXu8CPdW"}], "targetUserId": "0LysQV8n", "updateItems": [{"customAttributes": {"CMhQ5QIW": {}, "godzZ1IO": {}, "epZy0Vev": {}}, "inventoryId": "eTIGxsjJ", "serverCustomAttributes": {"Avv5iBAe": {}, "UJqKf49w": {}, "OCwZm7Cy": {}}, "slotId": "A4RdSlnS", "sourceItemId": "KyFsOcsA", "tags": ["E3ZzzARC", "rJRpnENt", "xgKTbr8g"], "type": "h2XxazSK"}, {"customAttributes": {"jcRD6UuY": {}, "633V9ttc": {}, "ky9mO9Dd": {}}, "inventoryId": "XuEn8O14", "serverCustomAttributes": {"iyWgVlsv": {}, "XHMd2vRD": {}, "ZdhvGddb": {}}, "slotId": "75wmvZrz", "sourceItemId": "l5aygGAJ", "tags": ["kuJQNkVm", "CxqnolVi", "Esvr91ro"], "type": "IrUPXqS5"}, {"customAttributes": {"asC3MTNK": {}, "AguWTAeH": {}, "wv9r7QlM": {}}, "inventoryId": "L1ElA9oy", "serverCustomAttributes": {"lcG58K1k": {}, "fZy12fdw": {}, "jW6AOgrm": {}}, "slotId": "YoVh0SJk", "sourceItemId": "8riYNCXf", "tags": ["l6e358e1", "OO4FzFBU", "zEYrdh0m"], "type": "VntsJkz4"}]}, {"consumeItems": [{"inventoryId": "TvKsFnCy", "qty": 44, "slotId": "dAiULT1M", "sourceItemId": "t1vgHV3f"}, {"inventoryId": "fEivTRZA", "qty": 59, "slotId": "DRNAGdTv", "sourceItemId": "A2MajzBH"}, {"inventoryId": "8ghZuvg6", "qty": 43, "slotId": "febbeXzS", "sourceItemId": "SIfOjrTJ"}], "createItems": [{"customAttributes": {"KnYRZzTd": {}, "xEkKfuVn": {}, "rW16iGMW": {}}, "inventoryConfigurationCode": "Q3WZ13z2", "inventoryId": "5WYZPGcM", "qty": 22, "serverCustomAttributes": {"OdZuSZ5v": {}, "yf4gvJDA": {}, "s5TzlvW5": {}}, "slotId": "ztpnQpHe", "slotUsed": 69, "source": "u9szp3BN", "sourceItemId": "AKUtJ5qp", "tags": ["SiXCocjP", "Mp5lI3En", "YfgspLEt"], "toSpecificInventory": true, "type": "moTrRjNu"}, {"customAttributes": {"hQKVtFQ1": {}, "3Bhfavc0": {}, "cBjlntHj": {}}, "inventoryConfigurationCode": "diYnKyDU", "inventoryId": "r7vRB3jj", "qty": 14, "serverCustomAttributes": {"LgEYPPxq": {}, "Pm21VpRr": {}, "WREMh6gw": {}}, "slotId": "xRqXxGS3", "slotUsed": 83, "source": "h573B1KT", "sourceItemId": "BIsgB8Xg", "tags": ["COWwySga", "YOOtK7dq", "mvup532r"], "toSpecificInventory": false, "type": "iStFMe3m"}, {"customAttributes": {"Jhsj8Ugd": {}, "RUv0A7wW": {}, "gZjPGH0w": {}}, "inventoryConfigurationCode": "ETWUo9uW", "inventoryId": "XCQvQGIV", "qty": 53, "serverCustomAttributes": {"4HtEGyjp": {}, "kagwGFMP": {}, "9wAmpSPF": {}}, "slotId": "kM0v5YtP", "slotUsed": 50, "source": "XojMNnAb", "sourceItemId": "S2HzKjkb", "tags": ["7PGTjU1O", "8S5PWa09", "MwzLfoKr"], "toSpecificInventory": false, "type": "gerJHwSr"}], "removeItems": [{"inventoryId": "Yde0oNFX", "slotId": "9seKh4zE", "sourceItemId": "sBRAklpX"}, {"inventoryId": "fjPWyy9B", "slotId": "vKtq7ITk", "sourceItemId": "Tr1V5aOx"}, {"inventoryId": "tx8ZA56v", "slotId": "Gdgz5BOJ", "sourceItemId": "6pvAX8ps"}], "targetUserId": "E5MhzCWr", "updateItems": [{"customAttributes": {"eyVnD9H6": {}, "XZRqswV7": {}, "v3mVgogs": {}}, "inventoryId": "HZqxueYu", "serverCustomAttributes": {"kb85bY5D": {}, "I393Xhus": {}, "MDtpnFbp": {}}, "slotId": "uufVHKIP", "sourceItemId": "7SRhA1uf", "tags": ["zxnNQ7hh", "7M6psX9A", "XKVRPBVl"], "type": "SwGRDPBF"}, {"customAttributes": {"pxQ6VPWP": {}, "HVpDyHQi": {}, "3upDbtNz": {}}, "inventoryId": "DdYKJqOu", "serverCustomAttributes": {"CuCDyxEk": {}, "KoO3TjCc": {}, "BWGoSuvE": {}}, "slotId": "8IwhL5GO", "sourceItemId": "LElZKay4", "tags": ["9m8l8vhm", "n6nAY7fZ", "OhJEED91"], "type": "S2etJYDC"}, {"customAttributes": {"DMfNmYa6": {}, "d3DCZ0zn": {}, "9vvtmVg3": {}}, "inventoryId": "npB4RmMP", "serverCustomAttributes": {"4SIrlzNy": {}, "HEDTVsKf": {}, "PX8Sc097": {}}, "slotId": "B7GeARkI", "sourceItemId": "4sSyvu3C", "tags": ["uJfvKzaX", "FcxWSKhK", "itOVyNkS"], "type": "QxnNDOxl"}]}, {"consumeItems": [{"inventoryId": "rwwcSSJw", "qty": 74, "slotId": "M0I9vyUl", "sourceItemId": "OhMmceB4"}, {"inventoryId": "TztKc5as", "qty": 32, "slotId": "BgOS2pda", "sourceItemId": "yvLoFCYk"}, {"inventoryId": "rDTflEAX", "qty": 19, "slotId": "5S9BFdLq", "sourceItemId": "Jqx3RQyU"}], "createItems": [{"customAttributes": {"fLP86xXA": {}, "3qQ9ptVr": {}, "bQ8RN1oD": {}}, "inventoryConfigurationCode": "BOGOiUO3", "inventoryId": "y2dnr8EV", "qty": 63, "serverCustomAttributes": {"D3vCoyfV": {}, "Tcvd8BT9": {}, "nbywSsbI": {}}, "slotId": "7TJW2yYR", "slotUsed": 79, "source": "DFDigHtc", "sourceItemId": "aGkyCXOd", "tags": ["N2mexXxc", "PdM5QsTD", "xNX1JIi1"], "toSpecificInventory": true, "type": "MjPKM4tX"}, {"customAttributes": {"ErLjNXa4": {}, "BOBnAW6q": {}, "E4fXhq86": {}}, "inventoryConfigurationCode": "T1DvI4zX", "inventoryId": "iwkvhUln", "qty": 35, "serverCustomAttributes": {"AaE9Ae5i": {}, "fvSoM0p1": {}, "PHwysxpw": {}}, "slotId": "k1bTCYRb", "slotUsed": 18, "source": "nqvbizot", "sourceItemId": "85DrvATC", "tags": ["4uunJqLu", "8JjGrXs4", "PgjiaY0F"], "toSpecificInventory": true, "type": "G3KdZVIE"}, {"customAttributes": {"P2O1Mx9n": {}, "nPgp3i2F": {}, "jMtCidek": {}}, "inventoryConfigurationCode": "TPbGar8O", "inventoryId": "5r7xAxXj", "qty": 20, "serverCustomAttributes": {"R5aamoG7": {}, "PyaK3CH6": {}, "XA8CcRbj": {}}, "slotId": "JHIhOfzW", "slotUsed": 7, "source": "P35pDeuj", "sourceItemId": "gbBgOG8w", "tags": ["KhVXHrod", "Z3pQyWLM", "IZgduWUW"], "toSpecificInventory": false, "type": "LrV3bZ9g"}], "removeItems": [{"inventoryId": "poh4roKi", "slotId": "LHwugfey", "sourceItemId": "fNPQE8gx"}, {"inventoryId": "dt89YJlD", "slotId": "RGAxCmhY", "sourceItemId": "1KTnNvaf"}, {"inventoryId": "R3fDrhje", "slotId": "bMHf3bkw", "sourceItemId": "WES6k9eR"}], "targetUserId": "L33KvVJh", "updateItems": [{"customAttributes": {"9QUWF6dv": {}, "Ta47GVAc": {}, "Rgz25ook": {}}, "inventoryId": "kcgmND9r", "serverCustomAttributes": {"exlkaaxU": {}, "Sorypnhp": {}, "fJ0ntfnq": {}}, "slotId": "yli0V0rC", "sourceItemId": "G0qMgjHm", "tags": ["dEO5HKUU", "OYXWFlcF", "0Z79LuNJ"], "type": "AwS7RSZp"}, {"customAttributes": {"QCJG4kOn": {}, "qev3eHzR": {}, "OaRtR05j": {}}, "inventoryId": "T6L2VKwE", "serverCustomAttributes": {"rtcsFceD": {}, "DbjeSli5": {}, "H8Xvt06f": {}}, "slotId": "zAqo2Wzm", "sourceItemId": "MknRIa5n", "tags": ["p6o02aGb", "R4stWnhQ", "2RD20lgt"], "type": "gfIHAxCV"}, {"customAttributes": {"4F3sIP5K": {}, "pE6sDRqu": {}, "aWkiuxbC": {}}, "inventoryId": "TJpofaf0", "serverCustomAttributes": {"I0WHD3LO": {}, "GEJx61AX": {}, "2QKRmDvj": {}}, "slotId": "nVO1Sg2A", "sourceItemId": "lXXzt9Bf", "tags": ["l0cgF3YJ", "d91eV3Ek", "TeUhFgTI"], "type": "sUvsDTYA"}]}], "requestId": "NLdU0kGK"}' \
    > test.out 2>&1
eval_tap $? 2 'AdminCreateChainingOperations' test.out

#- 3 AdminListIntegrationConfigurations
./ng net.accelbyte.sdk.cli.Main inventory adminListIntegrationConfigurations \
    --namespace "$AB_NAMESPACE" \
    --limit '28' \
    --offset '88' \
    --sortBy 'createdAt:desc' \
    > test.out 2>&1
eval_tap $? 3 'AdminListIntegrationConfigurations' test.out

#- 4 AdminCreateIntegrationConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminCreateIntegrationConfiguration \
    --namespace "$AB_NAMESPACE" \
    --body '{"mapItemType": ["RA0saW3L", "xEPCLftN", "Si1poybW"], "serviceName": "tdTFztyT", "targetInventoryCode": "ASw5huZE"}' \
    > test.out 2>&1
eval_tap $? 4 'AdminCreateIntegrationConfiguration' test.out

#- 5 AdminUpdateIntegrationConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateIntegrationConfiguration \
    --integrationConfigurationId 'UtvL8W6p' \
    --namespace "$AB_NAMESPACE" \
    --body '{"mapItemType": ["5ZIaMyKF", "IgYyhosF", "xDxJNmaA"], "serviceName": "OzxBxoGC", "targetInventoryCode": "EqnYWnrm"}' \
    > test.out 2>&1
eval_tap $? 5 'AdminUpdateIntegrationConfiguration' test.out

#- 6 AdminUpdateStatusIntegrationConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateStatusIntegrationConfiguration \
    --integrationConfigurationId 'hlLiSVeE' \
    --namespace "$AB_NAMESPACE" \
    --body '{"status": "INIT"}' \
    > test.out 2>&1
eval_tap $? 6 'AdminUpdateStatusIntegrationConfiguration' test.out

#- 7 AdminListInventories
./ng net.accelbyte.sdk.cli.Main inventory adminListInventories \
    --namespace "$AB_NAMESPACE" \
    --inventoryConfigurationCode 'GluIcohL' \
    --limit '11' \
    --offset '40' \
    --sortBy 'inventoryConfigurationCode:asc' \
    --userId '2YdKeadi' \
    > test.out 2>&1
eval_tap $? 7 'AdminListInventories' test.out

#- 8 AdminCreateInventory
./ng net.accelbyte.sdk.cli.Main inventory adminCreateInventory \
    --namespace "$AB_NAMESPACE" \
    --body '{"inventoryConfigurationCode": "fVSiVDLX", "userId": "FVZUF39v"}' \
    > test.out 2>&1
eval_tap $? 8 'AdminCreateInventory' test.out

#- 9 AdminGetInventory
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventory \
    --inventoryId 'wLCwtleN' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'AdminGetInventory' test.out

#- 10 AdminUpdateInventory
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateInventory \
    --inventoryId 'xMPSMzCg' \
    --namespace "$AB_NAMESPACE" \
    --body '{"incMaxSlots": 46}' \
    > test.out 2>&1
eval_tap $? 10 'AdminUpdateInventory' test.out

#- 11 DeleteInventory
./ng net.accelbyte.sdk.cli.Main inventory deleteInventory \
    --inventoryId '63kg2qWu' \
    --namespace "$AB_NAMESPACE" \
    --body '{"message": "OYYRHeO1"}' \
    > test.out 2>&1
eval_tap $? 11 'DeleteInventory' test.out

#- 12 AdminListItems
./ng net.accelbyte.sdk.cli.Main inventory adminListItems \
    --inventoryId 'p1uWQ9Ey' \
    --namespace "$AB_NAMESPACE" \
    --limit '44' \
    --offset '17' \
    --sortBy 'createdAt:asc' \
    --sourceItemId 'Xj8SQEkF' \
    --tags 'tVDw1ypl' \
    > test.out 2>&1
eval_tap $? 12 'AdminListItems' test.out

#- 13 AdminGetInventoryItem
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventoryItem \
    --inventoryId 'Ve8oNu8s' \
    --namespace "$AB_NAMESPACE" \
    --slotId 'oR8EAKRW' \
    --sourceItemId 'AmFN1DVX' \
    > test.out 2>&1
eval_tap $? 13 'AdminGetInventoryItem' test.out

#- 14 AdminListInventoryConfigurations
./ng net.accelbyte.sdk.cli.Main inventory adminListInventoryConfigurations \
    --namespace "$AB_NAMESPACE" \
    --code 'y3SHim1x' \
    --limit '77' \
    --offset '14' \
    --sortBy 'updatedAt:asc' \
    > test.out 2>&1
eval_tap $? 14 'AdminListInventoryConfigurations' test.out

#- 15 AdminCreateInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminCreateInventoryConfiguration \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "sjuKvjYA", "description": "YOMlbaE6", "initialMaxSlots": 28, "maxInstancesPerUser": 67, "maxUpgradeSlots": 25, "name": "n5mctRz1"}' \
    > test.out 2>&1
eval_tap $? 15 'AdminCreateInventoryConfiguration' test.out

#- 16 AdminGetInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventoryConfiguration \
    --inventoryConfigurationId '7WvAc1im' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'AdminGetInventoryConfiguration' test.out

#- 17 AdminUpdateInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateInventoryConfiguration \
    --inventoryConfigurationId 'EP5n4Nvn' \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "0qrbh0r6", "description": "zHE6Mvju", "initialMaxSlots": 78, "maxInstancesPerUser": 68, "maxUpgradeSlots": 65, "name": "x34hsWLH"}' \
    > test.out 2>&1
eval_tap $? 17 'AdminUpdateInventoryConfiguration' test.out

#- 18 AdminDeleteInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteInventoryConfiguration \
    --inventoryConfigurationId 'fEgC18E5' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminDeleteInventoryConfiguration' test.out

#- 19 AdminListItemTypes
./ng net.accelbyte.sdk.cli.Main inventory adminListItemTypes \
    --namespace "$AB_NAMESPACE" \
    --limit '22' \
    --offset '83' \
    --sortBy 'createdAt:desc' \
    > test.out 2>&1
eval_tap $? 19 'AdminListItemTypes' test.out

#- 20 AdminCreateItemType
./ng net.accelbyte.sdk.cli.Main inventory adminCreateItemType \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "TVHsKAeQ"}' \
    > test.out 2>&1
eval_tap $? 20 'AdminCreateItemType' test.out

#- 21 AdminDeleteItemType
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteItemType \
    --itemTypeName 'oSIk56fn' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'AdminDeleteItemType' test.out

#- 22 AdminListTags
./ng net.accelbyte.sdk.cli.Main inventory adminListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '98' \
    --offset '46' \
    --owner 'pVIefxgc' \
    --sortBy 'name:asc' \
    > test.out 2>&1
eval_tap $? 22 'AdminListTags' test.out

#- 23 AdminCreateTag
./ng net.accelbyte.sdk.cli.Main inventory adminCreateTag \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "3DLgIp9r", "owner": "CLIENT"}' \
    > test.out 2>&1
eval_tap $? 23 'AdminCreateTag' test.out

#- 24 AdminDeleteTag
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteTag \
    --namespace "$AB_NAMESPACE" \
    --tagName 'iL1cFJPV' \
    > test.out 2>&1
eval_tap $? 24 'AdminDeleteTag' test.out

#- 25 AdminConsumeUserItem
./ng net.accelbyte.sdk.cli.Main inventory adminConsumeUserItem \
    --inventoryId 'LnGvQrMr' \
    --namespace "$AB_NAMESPACE" \
    --userId 'jRxppJZc' \
    --body '{"qty": 78, "slotId": "3kCpKRzc", "sourceItemId": "PnHh9Vid"}' \
    > test.out 2>&1
eval_tap $? 25 'AdminConsumeUserItem' test.out

#- 26 AdminBulkUpdateMyItems
./ng net.accelbyte.sdk.cli.Main inventory adminBulkUpdateMyItems \
    --inventoryId 't0enoQQM' \
    --namespace "$AB_NAMESPACE" \
    --userId 'TY8YvscL' \
    --body '[{"customAttributes": {"hKDOLSdV": {}, "velWQ3G1": {}, "2zhNEFyx": {}}, "serverCustomAttributes": {"FrrrrZpd": {}, "lQHwtekT": {}, "yJA65tw8": {}}, "slotId": "Gy8zQ3SS", "sourceItemId": "XKO8aXO4", "tags": ["44C8P7hO", "xRj0ln6v", "4F5GzNKk"], "type": "QJnnppNq"}, {"customAttributes": {"qcsmweRq": {}, "BGThzF3K": {}, "8zSsCwHR": {}}, "serverCustomAttributes": {"EgB1i9It": {}, "duJ1it6Q": {}, "ZmNUPKoT": {}}, "slotId": "xPaXryG9", "sourceItemId": "MDApLV2E", "tags": ["jLewQJGc", "Jb3JpNUR", "g1lKQCSp"], "type": "QcK8XLM8"}, {"customAttributes": {"ffXAUsAk": {}, "FAWD6Mew": {}, "VlzDgB9n": {}}, "serverCustomAttributes": {"qOizmVNF": {}, "p2B0oL5V": {}, "KHY5Slcm": {}}, "slotId": "86xVUmTF", "sourceItemId": "jgpxw1G4", "tags": ["Jc3uvoEI", "xBEDTGKX", "6Jd07Bob"], "type": "tPusi8JV"}]' \
    > test.out 2>&1
eval_tap $? 26 'AdminBulkUpdateMyItems' test.out

#- 27 AdminSaveItemToInventory
./ng net.accelbyte.sdk.cli.Main inventory adminSaveItemToInventory \
    --inventoryId 'pxNnQGJA' \
    --namespace "$AB_NAMESPACE" \
    --userId 'WOc8xNsN' \
    --body '{"customAttributes": {"fJuH7lNn": {}, "yK7WLN4q": {}, "co1b8aDj": {}}, "qty": 67, "serverCustomAttributes": {"SckVaKFt": {}, "q2QvYjbe": {}, "sPDRoxey": {}}, "slotId": "OdnFEHqS", "slotUsed": 37, "source": "OTHER", "sourceItemId": "4HJVhHgu", "tags": ["fXV2hFXQ", "zPaeRhyV", "0CgQumgE"], "type": "PR13jOhp"}' \
    > test.out 2>&1
eval_tap $? 27 'AdminSaveItemToInventory' test.out

#- 28 AdminBulkRemoveItems
./ng net.accelbyte.sdk.cli.Main inventory adminBulkRemoveItems \
    --inventoryId 'QRkaAK9w' \
    --namespace "$AB_NAMESPACE" \
    --userId 'OegZ33oB' \
    --body '[{"slotId": "vNECLaTh", "sourceItemId": "nbeBOYN1"}, {"slotId": "LK1ec8yc", "sourceItemId": "Jl6Z7JWp"}, {"slotId": "YsQNcmH2", "sourceItemId": "KSg0I6h9"}]' \
    > test.out 2>&1
eval_tap $? 28 'AdminBulkRemoveItems' test.out

#- 29 AdminSaveItem
./ng net.accelbyte.sdk.cli.Main inventory adminSaveItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'cbh0Uy3A' \
    --body '{"customAttributes": {"3whKFVtZ": {}, "A5sTYA1U": {}, "YhanLNS9": {}}, "inventoryConfigurationCode": "ptTstVyh", "qty": 88, "serverCustomAttributes": {"Y6dLBmHf": {}, "wwN8fGFn": {}, "OYM6tcG4": {}}, "slotId": "SKLKo3JE", "slotUsed": 0, "source": "OTHER", "sourceItemId": "HyFmVWS1", "tags": ["0Nl5Mg2R", "tYg2ZRkG", "lnXO924b"], "type": "sjruT3EC"}' \
    > test.out 2>&1
eval_tap $? 29 'AdminSaveItem' test.out

#- 30 AdminSyncUserEntitlements
./ng net.accelbyte.sdk.cli.Main inventory adminSyncUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'x3g0LWAW' \
    > test.out 2>&1
eval_tap $? 30 'AdminSyncUserEntitlements' test.out

#- 31 AdminPurchasable
./ng net.accelbyte.sdk.cli.Main inventory adminPurchasable \
    --namespace "$AB_NAMESPACE" \
    --userId 'bCQ3p9mg' \
    --body '{"entitlementType": "tJt8v6Nq", "inventoryConfig": {"slotUsed": 22}, "itemId": "IteQdpxE", "itemType": "yUCIXFwE", "items": [{"bundledQty": 94, "entitlementType": "VOtWhOlu", "inventoryConfig": {"slotUsed": 26}, "itemId": "eS4q7W3x", "itemType": "opqZpiI2", "sku": "3v79RThO", "stackable": false, "useCount": 49}, {"bundledQty": 24, "entitlementType": "wiF7bZdg", "inventoryConfig": {"slotUsed": 2}, "itemId": "wJKsDxo5", "itemType": "vLBy3mjr", "sku": "fdtsQhV0", "stackable": true, "useCount": 86}, {"bundledQty": 62, "entitlementType": "jADWESKp", "inventoryConfig": {"slotUsed": 45}, "itemId": "oiok81PZ", "itemType": "I2FtB5kw", "sku": "l07RVzi7", "stackable": false, "useCount": 92}], "quantity": 10, "sku": "sSkgK6ij", "stackable": false, "useCount": 40}' \
    > test.out 2>&1
eval_tap $? 31 'AdminPurchasable' test.out

#- 32 PublicListInventoryConfigurations
./ng net.accelbyte.sdk.cli.Main inventory publicListInventoryConfigurations \
    --namespace "$AB_NAMESPACE" \
    --code 'rAXjrH5j' \
    --limit '12' \
    --offset '19' \
    --sortBy 'updatedAt:asc' \
    > test.out 2>&1
eval_tap $? 32 'PublicListInventoryConfigurations' test.out

#- 33 PublicListItemTypes
./ng net.accelbyte.sdk.cli.Main inventory publicListItemTypes \
    --namespace "$AB_NAMESPACE" \
    --limit '72' \
    --offset '31' \
    --sortBy 'createdAt:asc' \
    > test.out 2>&1
eval_tap $? 33 'PublicListItemTypes' test.out

#- 34 PublicListTags
./ng net.accelbyte.sdk.cli.Main inventory publicListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '97' \
    --offset '88' \
    --sortBy 'name:asc' \
    > test.out 2>&1
eval_tap $? 34 'PublicListTags' test.out

#- 35 PublicListInventories
./ng net.accelbyte.sdk.cli.Main inventory publicListInventories \
    --namespace "$AB_NAMESPACE" \
    --inventoryConfigurationCode 'pmyJ1JjG' \
    --limit '82' \
    --offset '3' \
    --sortBy 'updatedAt:asc' \
    > test.out 2>&1
eval_tap $? 35 'PublicListInventories' test.out

#- 36 PublicConsumeMyItem
./ng net.accelbyte.sdk.cli.Main inventory publicConsumeMyItem \
    --inventoryId 'bfLwIBSv' \
    --namespace "$AB_NAMESPACE" \
    --body '{"qty": 85, "slotId": "GYkP7ARZ", "sourceItemId": "ehAESIhV"}' \
    > test.out 2>&1
eval_tap $? 36 'PublicConsumeMyItem' test.out

#- 37 PublicListItems
./ng net.accelbyte.sdk.cli.Main inventory publicListItems \
    --inventoryId '6zoRn6m2' \
    --namespace "$AB_NAMESPACE" \
    --limit '76' \
    --offset '53' \
    --sortBy 'updatedAt:desc' \
    --sourceItemId 'CM41lSVl' \
    --tags 'OJE8sAfF' \
    > test.out 2>&1
eval_tap $? 37 'PublicListItems' test.out

#- 38 PublicBulkUpdateMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicBulkUpdateMyItems \
    --inventoryId '7v5U33Q0' \
    --namespace "$AB_NAMESPACE" \
    --body '[{"customAttributes": {"uOCyE0HV": {}, "xhlh12rQ": {}, "Nj1LvCSt": {}}, "slotId": "9u86Wtzv", "sourceItemId": "FOtnXuG2", "tags": ["BiPR1SMW", "szDAoJPP", "gtu7nPUg"]}, {"customAttributes": {"U5pVgorz": {}, "X1oI1uJF": {}, "NqtOmrfR": {}}, "slotId": "QSocaloH", "sourceItemId": "8Z6qJao0", "tags": ["wDK64JrW", "Cr43G4Rn", "6VJytPCT"]}, {"customAttributes": {"AQLnQgZk": {}, "A6ksy4WQ": {}, "YHKikEnT": {}}, "slotId": "AkjGN0E1", "sourceItemId": "C0EKGzGw", "tags": ["iGVFZtkv", "xrL3wJzg", "c8VZzFHt"]}]' \
    > test.out 2>&1
eval_tap $? 38 'PublicBulkUpdateMyItems' test.out

#- 39 PublicBulkRemoveMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicBulkRemoveMyItems \
    --inventoryId 'GW58eusJ' \
    --namespace "$AB_NAMESPACE" \
    --body '[{"slotId": "bJiUXImz", "sourceItemId": "v5t7CMsV"}, {"slotId": "kreUuFKS", "sourceItemId": "0XQkTzf4"}, {"slotId": "JohpDhGJ", "sourceItemId": "ynF5RkEr"}]' \
    > test.out 2>&1
eval_tap $? 39 'PublicBulkRemoveMyItems' test.out

#- 40 PublicMoveMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicMoveMyItems \
    --inventoryId 'xMa6KRor' \
    --namespace "$AB_NAMESPACE" \
    --body '{"items": [{"qty": 41, "slotId": "lHxZv1el", "sourceItemId": "oy1ypojF"}, {"qty": 93, "slotId": "aKQt6rBz", "sourceItemId": "E0EYCCCD"}, {"qty": 38, "slotId": "kb1ymXYZ", "sourceItemId": "DiXEHU59"}], "srcInventoryId": "FLXskkwB"}' \
    > test.out 2>&1
eval_tap $? 40 'PublicMoveMyItems' test.out

#- 41 PublicGetItem
./ng net.accelbyte.sdk.cli.Main inventory publicGetItem \
    --inventoryId 'hVkP7Ii5' \
    --namespace "$AB_NAMESPACE" \
    --slotId 'IcsXJmcl' \
    --sourceItemId 'bUXnU7fd' \
    > test.out 2>&1
eval_tap $? 41 'PublicGetItem' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
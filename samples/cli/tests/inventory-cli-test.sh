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
    --body '{"message": "7UgKVfhC", "operations": [{"consumeItems": [{"inventoryId": "Wj5oi5GE", "qty": 48, "slotId": "4G2CArdD", "sourceItemId": "MmtOVf1J"}, {"inventoryId": "MRb5Dhct", "qty": 72, "slotId": "eTzbxyXJ", "sourceItemId": "iKhHr7mc"}, {"inventoryId": "XZ4xue6g", "qty": 20, "slotId": "NFQ1F2kO", "sourceItemId": "Q2UczwOS"}], "createItems": [{"customAttributes": {"fsqFGoyH": {}, "ngLlW8fj": {}, "PiOqqYPy": {}}, "inventoryConfigurationCode": "JDmzF6LY", "inventoryId": "JRQ6Vt1r", "qty": 48, "serverCustomAttributes": {"sHlt45tl": {}, "YXg2pCWS": {}, "tdMk0wph": {}}, "slotId": "M7o4nk5d", "slotUsed": 27, "sourceItemId": "NTMzpdPe", "tags": ["UV6DL3EK", "2GTXQRJt", "ZD0gkn0k"], "toSpecificInventory": true, "type": "2SKR8j3D"}, {"customAttributes": {"UqlV1h9v": {}, "kW3cDzgM": {}, "BqXzXUKt": {}}, "inventoryConfigurationCode": "ruRMOKlp", "inventoryId": "QRJN0l37", "qty": 53, "serverCustomAttributes": {"suarQNvk": {}, "n0VdEFgy": {}, "SI5tH8U8": {}}, "slotId": "jWxxT7t7", "slotUsed": 87, "sourceItemId": "RGseG8KB", "tags": ["qZCbqdKM", "O6LWwhrs", "5VHDBNkg"], "toSpecificInventory": true, "type": "aMZViAE9"}, {"customAttributes": {"wHnGdYjA": {}, "VGMhWF6Y": {}, "11kpC3SY": {}}, "inventoryConfigurationCode": "Ms1MLJO6", "inventoryId": "B0edwe1x", "qty": 94, "serverCustomAttributes": {"y22oOhof": {}, "KuCIgejv": {}, "kr1193ii": {}}, "slotId": "XPQINqyD", "slotUsed": 45, "sourceItemId": "3ZaFPifo", "tags": ["ww6GM5lP", "k8pfWVzJ", "s1yW3iF9"], "toSpecificInventory": true, "type": "2Hirj6y5"}], "removeItems": [{"inventoryId": "SCk3rmQs", "slotId": "TmbE8UrY", "sourceItemId": "vbbOurQu"}, {"inventoryId": "U6kLKJk0", "slotId": "V5TX2buX", "sourceItemId": "qJHMBSHm"}, {"inventoryId": "1zYbFCW5", "slotId": "AWF8yCkD", "sourceItemId": "lH566DLG"}], "targetUserId": "Hx2QiG9I", "updateItems": [{"customAttributes": {"D8MHl94L": {}, "sOFtDrUS": {}, "dgWKo7AJ": {}}, "inventoryId": "C6UH5BXk", "serverCustomAttributes": {"WJGkS51R": {}, "X1Yjj1uY": {}, "8cUvYqM1": {}}, "slotId": "bIXORQq8", "sourceItemId": "ps135fSJ", "tags": ["b2rIOhJW", "nEKOSwID", "gAW0JMry"], "type": "4NlZ1z90"}, {"customAttributes": {"GdRhYXWu": {}, "aTLaFBZ9": {}, "0uCeoAqq": {}}, "inventoryId": "C7JwSOqH", "serverCustomAttributes": {"uEPz878C": {}, "aVfv5ONf": {}, "IyyEfTtt": {}}, "slotId": "Vkg2MTTf", "sourceItemId": "jiL8GxCd", "tags": ["fsY0Iswg", "XFXtCIjx", "mlh86da0"], "type": "F813PZJE"}, {"customAttributes": {"EMmTwK6a": {}, "NACgCnZO": {}, "ROfuSp5W": {}}, "inventoryId": "bJVoLzWz", "serverCustomAttributes": {"ESl7p4zx": {}, "dGzFYvGZ": {}, "hpci2OGA": {}}, "slotId": "DeZ1VfHL", "sourceItemId": "CKhOG4w0", "tags": ["fxQUv5kF", "WuUSAQIE", "fDovaImH"], "type": "ya0DhOOS"}]}, {"consumeItems": [{"inventoryId": "PZmrFIEz", "qty": 36, "slotId": "y9rQhqcW", "sourceItemId": "4h11IKSP"}, {"inventoryId": "z2t0dnEi", "qty": 26, "slotId": "ClR4YNdl", "sourceItemId": "1Qs2jfIP"}, {"inventoryId": "eC8u4xFR", "qty": 38, "slotId": "v89kYRTi", "sourceItemId": "llxeuBGR"}], "createItems": [{"customAttributes": {"veZl5KPK": {}, "AUOhxHIY": {}, "G7odigZy": {}}, "inventoryConfigurationCode": "sJ5MtcUS", "inventoryId": "kKzm4G9z", "qty": 39, "serverCustomAttributes": {"mdjofYSf": {}, "Ya6dWjDd": {}, "Ram5uBW4": {}}, "slotId": "GQJ7EtR4", "slotUsed": 89, "sourceItemId": "vuPE2arS", "tags": ["WtVhwsbF", "xwYVDrCw", "7WBXZaJ9"], "toSpecificInventory": false, "type": "1U4viy89"}, {"customAttributes": {"5F6z1NyJ": {}, "T9wnHKtU": {}, "gfGnKaSo": {}}, "inventoryConfigurationCode": "CI0S5wVM", "inventoryId": "vM8dArqF", "qty": 38, "serverCustomAttributes": {"Z7uXJSs2": {}, "4Ae0jWtI": {}, "DGvezFCt": {}}, "slotId": "8gi3M0s4", "slotUsed": 13, "sourceItemId": "RgDs93Zk", "tags": ["i2dHmaeI", "OnRk1EsF", "R2HdqgpR"], "toSpecificInventory": false, "type": "Z12AiYZ0"}, {"customAttributes": {"KrHPyGxP": {}, "LSxwpRSx": {}, "OoxbChut": {}}, "inventoryConfigurationCode": "fK9XWMzF", "inventoryId": "AGGb0Mzx", "qty": 87, "serverCustomAttributes": {"jrqTdGQk": {}, "dEo6AeOn": {}, "DFNe8WVY": {}}, "slotId": "HWCmMgmx", "slotUsed": 25, "sourceItemId": "8z05CRUu", "tags": ["LhI0xeuy", "zCX4EDZC", "AiO1rLR1"], "toSpecificInventory": false, "type": "DuTfpgZL"}], "removeItems": [{"inventoryId": "C2n66ajD", "slotId": "X2Bgsszk", "sourceItemId": "umdEKUGL"}, {"inventoryId": "vaN7q27E", "slotId": "dWmRAiSf", "sourceItemId": "D1QB2syl"}, {"inventoryId": "zyIUnbUl", "slotId": "OWfEKa8p", "sourceItemId": "xRrnx0K0"}], "targetUserId": "gfX9sx7p", "updateItems": [{"customAttributes": {"2dDD1kl0": {}, "VFRNmDlf": {}, "RFmB3DFR": {}}, "inventoryId": "q5yGOLdf", "serverCustomAttributes": {"rkTWjcDY": {}, "T1QJjpFl": {}, "hxqd9Y1P": {}}, "slotId": "URChLlct", "sourceItemId": "xBkUcTZJ", "tags": ["ypU6Hzk0", "RrYyxLPH", "Oen810Sx"], "type": "7hEDGhea"}, {"customAttributes": {"YOKU8pft": {}, "jau29za9": {}, "4BCqNv87": {}}, "inventoryId": "j4Xf1Klu", "serverCustomAttributes": {"qAlzqSCW": {}, "gjUfOCD7": {}, "k0AAIiIr": {}}, "slotId": "HXiZNhLW", "sourceItemId": "j6i8dH0i", "tags": ["oCNr2aQg", "ojh5v7J5", "DU83RszF"], "type": "Zk4HPdq9"}, {"customAttributes": {"pWYRpbjF": {}, "bYlj4OJd": {}, "zmcz8AKK": {}}, "inventoryId": "lcwygqAi", "serverCustomAttributes": {"uxtL3DfC": {}, "HYZUCVOp": {}, "2taC8UTz": {}}, "slotId": "d5C3bv51", "sourceItemId": "K4tK3OCI", "tags": ["dvpqcysy", "3XAjrRQb", "XZqerGiz"], "type": "M7yE0KcR"}]}, {"consumeItems": [{"inventoryId": "tvEN8NWw", "qty": 18, "slotId": "CmXSUwhA", "sourceItemId": "lcB42F0r"}, {"inventoryId": "UumcpLdZ", "qty": 62, "slotId": "GoUiO0fg", "sourceItemId": "ELFMu2JZ"}, {"inventoryId": "UdLpzA8F", "qty": 94, "slotId": "thBuZnaY", "sourceItemId": "vRPf1kHD"}], "createItems": [{"customAttributes": {"zBz9ReQ6": {}, "7EjlbZuJ": {}, "oFVi66wT": {}}, "inventoryConfigurationCode": "GlRVUHEQ", "inventoryId": "TtpZgSFf", "qty": 100, "serverCustomAttributes": {"0TRvAVnC": {}, "XZOe1y6m": {}, "iXrDNf0O": {}}, "slotId": "uiJlJ62h", "slotUsed": 73, "sourceItemId": "w1i6Pooz", "tags": ["m4emekYc", "nZeuYz78", "7KqxakGf"], "toSpecificInventory": false, "type": "t87jQMTt"}, {"customAttributes": {"hdiLQ5Le": {}, "9vq9wMaa": {}, "Cj7sE5G7": {}}, "inventoryConfigurationCode": "1zc4dYqk", "inventoryId": "ciLSEEyR", "qty": 55, "serverCustomAttributes": {"6zRZisiw": {}, "F3IdbKSy": {}, "wMzV9yt4": {}}, "slotId": "bJjcKZ5V", "slotUsed": 97, "sourceItemId": "bnoZRwDA", "tags": ["F03Y3dfD", "wISsiMRq", "DwtbDqGJ"], "toSpecificInventory": true, "type": "Cf3Y9UPD"}, {"customAttributes": {"ykmep6Rd": {}, "zwanIg4P": {}, "na87aWYq": {}}, "inventoryConfigurationCode": "w8jISnPM", "inventoryId": "6QX4ESrQ", "qty": 37, "serverCustomAttributes": {"AWYdjNOC": {}, "QDKNHF2f": {}, "Y0X1qEHG": {}}, "slotId": "TYch5rPf", "slotUsed": 31, "sourceItemId": "Wwhg6y4K", "tags": ["NeSexR2u", "nKdCis1f", "smZRJt41"], "toSpecificInventory": true, "type": "xFCgTwMt"}], "removeItems": [{"inventoryId": "Z2l6AQS3", "slotId": "zA0OijXQ", "sourceItemId": "dsqwYa6c"}, {"inventoryId": "uhAt8Uag", "slotId": "nUcXdnyW", "sourceItemId": "Z6bZ2ZMx"}, {"inventoryId": "PdYIuV6i", "slotId": "tM4kiiXU", "sourceItemId": "vK3XphEu"}], "targetUserId": "B3g0lz36", "updateItems": [{"customAttributes": {"Uok8yZv0": {}, "138XwV7d": {}, "gVLtrUAD": {}}, "inventoryId": "drv0UPRC", "serverCustomAttributes": {"K1k3TRW5": {}, "EWy7CvCt": {}, "HtkHUG19": {}}, "slotId": "GHDm4rcE", "sourceItemId": "PjyQ8dIH", "tags": ["4WpXEorg", "DlR1C8Dj", "t2Pm4Mf4"], "type": "NWLPyEBR"}, {"customAttributes": {"AHuKP6kP": {}, "BZA6cD8x": {}, "Xv7rpVYO": {}}, "inventoryId": "AGfc3nGA", "serverCustomAttributes": {"oXNUWkTt": {}, "KacOMUmu": {}, "kUO6bdYh": {}}, "slotId": "QaNUyBwj", "sourceItemId": "EHmPPQ0g", "tags": ["x88ruF6R", "0qByyHU5", "8d403FF4"], "type": "fA39f4jr"}, {"customAttributes": {"ODUWl6cz": {}, "g49ygeQJ": {}, "2CUYxU39": {}}, "inventoryId": "srck20Qe", "serverCustomAttributes": {"05ZEfQip": {}, "slHaj19V": {}, "JhzHyUIz": {}}, "slotId": "b9Z0JFOZ", "sourceItemId": "ljamkuRu", "tags": ["425KC1ul", "wXQ9NcQn", "0YtfnlCg"], "type": "d4rAX6WK"}]}], "requestId": "Y8HP4J23"}' \
    > test.out 2>&1
eval_tap $? 2 'AdminCreateChainingOperations' test.out

#- 3 AdminListInventories
./ng net.accelbyte.sdk.cli.Main inventory adminListInventories \
    --namespace "$AB_NAMESPACE" \
    --inventoryConfigurationCode 'ppd2iEVl' \
    --limit '87' \
    --offset '30' \
    --sortBy 'createdAt' \
    --userId 'WZ9oMUWV' \
    > test.out 2>&1
eval_tap $? 3 'AdminListInventories' test.out

#- 4 AdminCreateInventory
./ng net.accelbyte.sdk.cli.Main inventory adminCreateInventory \
    --namespace "$AB_NAMESPACE" \
    --body '{"inventoryConfigurationCode": "fDbEHR2y", "userId": "ASzF0O1I"}' \
    > test.out 2>&1
eval_tap $? 4 'AdminCreateInventory' test.out

#- 5 AdminGetInventory
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventory \
    --inventoryId 'oyINlpet' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'AdminGetInventory' test.out

#- 6 AdminUpdateInventory
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateInventory \
    --inventoryId 'n54lXhdn' \
    --namespace "$AB_NAMESPACE" \
    --body '{"incMaxSlots": 20}' \
    > test.out 2>&1
eval_tap $? 6 'AdminUpdateInventory' test.out

#- 7 DeleteInventory
./ng net.accelbyte.sdk.cli.Main inventory deleteInventory \
    --inventoryId 'MCg4kLyQ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"message": "VtzANxUm"}' \
    > test.out 2>&1
eval_tap $? 7 'DeleteInventory' test.out

#- 8 AdminListItems
./ng net.accelbyte.sdk.cli.Main inventory adminListItems \
    --inventoryId 'QX9nTpUP' \
    --namespace "$AB_NAMESPACE" \
    --limit '8' \
    --offset '40' \
    --qtyGte '86' \
    --sortBy 'updatedAt' \
    --sourceItemId 'i7M1VI72' \
    --tags 'cBMunOOu' \
    > test.out 2>&1
eval_tap $? 8 'AdminListItems' test.out

#- 9 AdminGetInventoryItem
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventoryItem \
    --inventoryId 'ACtGKZcZ' \
    --namespace "$AB_NAMESPACE" \
    --slotId 'XGDonjeQ' \
    --sourceItemId 'tYYCbzBQ' \
    > test.out 2>&1
eval_tap $? 9 'AdminGetInventoryItem' test.out

#- 10 AdminListInventoryConfigurations
./ng net.accelbyte.sdk.cli.Main inventory adminListInventoryConfigurations \
    --namespace "$AB_NAMESPACE" \
    --code 'UKfqLPZL' \
    --limit '41' \
    --offset '45' \
    --sortBy 'createdAt:asc' \
    > test.out 2>&1
eval_tap $? 10 'AdminListInventoryConfigurations' test.out

#- 11 AdminCreateInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminCreateInventoryConfiguration \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "RtIsiU2B", "description": "S3PShsIv", "initialMaxSlots": 53, "maxInstancesPerUser": 94, "maxUpgradeSlots": 24, "name": "fa4LXc1F"}' \
    > test.out 2>&1
eval_tap $? 11 'AdminCreateInventoryConfiguration' test.out

#- 12 AdminGetInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventoryConfiguration \
    --inventoryConfigurationId 'UZ3OaRpY' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'AdminGetInventoryConfiguration' test.out

#- 13 AdminUpdateInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateInventoryConfiguration \
    --inventoryConfigurationId 'pdckxGc0' \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "NPHe73Dt", "description": "eXCNiGns", "initialMaxSlots": 69, "maxInstancesPerUser": 10, "maxUpgradeSlots": 58, "name": "cQOyjFTs"}' \
    > test.out 2>&1
eval_tap $? 13 'AdminUpdateInventoryConfiguration' test.out

#- 14 AdminDeleteInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteInventoryConfiguration \
    --inventoryConfigurationId 'k081T7DV' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 14 'AdminDeleteInventoryConfiguration' test.out

#- 15 AdminListItemTypes
./ng net.accelbyte.sdk.cli.Main inventory adminListItemTypes \
    --namespace "$AB_NAMESPACE" \
    --limit '44' \
    --offset '80' \
    --sortBy 'name:desc' \
    > test.out 2>&1
eval_tap $? 15 'AdminListItemTypes' test.out

#- 16 AdminCreateItemType
./ng net.accelbyte.sdk.cli.Main inventory adminCreateItemType \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "egdXSM2N"}' \
    > test.out 2>&1
eval_tap $? 16 'AdminCreateItemType' test.out

#- 17 AdminDeleteItemType
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteItemType \
    --itemTypeName 'xizNWzyE' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'AdminDeleteItemType' test.out

#- 18 AdminListTags
./ng net.accelbyte.sdk.cli.Main inventory adminListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '36' \
    --offset '31' \
    --owner '17xsjUOD' \
    --sortBy 'createdAt:asc' \
    > test.out 2>&1
eval_tap $? 18 'AdminListTags' test.out

#- 19 AdminCreateTag
./ng net.accelbyte.sdk.cli.Main inventory adminCreateTag \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "mOrfGxJJ", "owner": "CLIENT"}' \
    > test.out 2>&1
eval_tap $? 19 'AdminCreateTag' test.out

#- 20 AdminDeleteTag
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteTag \
    --namespace "$AB_NAMESPACE" \
    --tagName 'uLO4jQOM' \
    > test.out 2>&1
eval_tap $? 20 'AdminDeleteTag' test.out

#- 21 AdminConsumeUserItem
./ng net.accelbyte.sdk.cli.Main inventory adminConsumeUserItem \
    --inventoryId 'OCzSEQz7' \
    --namespace "$AB_NAMESPACE" \
    --userId 'knFTvJAc' \
    --body '{"qty": 5, "slotId": "n46Jw3a7", "sourceItemId": "wZGbuSKj"}' \
    > test.out 2>&1
eval_tap $? 21 'AdminConsumeUserItem' test.out

#- 22 AdminBulkUpdateMyItems
./ng net.accelbyte.sdk.cli.Main inventory adminBulkUpdateMyItems \
    --inventoryId 'AuZIaGOH' \
    --namespace "$AB_NAMESPACE" \
    --userId 'NfSD2d90' \
    --body '[{"customAttributes": {"YLxuQhvg": {}, "jooUamjI": {}, "CsLyMQ1z": {}}, "serverCustomAttributes": {"1ujUAVT6": {}, "HuIjN8oJ": {}, "df71nD5E": {}}, "slotId": "cMErGCuB", "sourceItemId": "W58r09eL", "tags": ["km9D4SIN", "Zd6rYmFZ", "Aj7IXeFW"], "type": "NoFu0z8G"}, {"customAttributes": {"jeqS39WP": {}, "lHsjsScc": {}, "dZx8tMoI": {}}, "serverCustomAttributes": {"kQDXgfS7": {}, "LsRs9ycb": {}, "FdIsT3Yk": {}}, "slotId": "myixm62a", "sourceItemId": "kqVvG8dc", "tags": ["M53wDDxV", "kpeKlw6Q", "WKBnBGJC"], "type": "XZYyJfft"}, {"customAttributes": {"QpHTaoBx": {}, "mrPIxx3J": {}, "HimYwc63": {}}, "serverCustomAttributes": {"dH3RHsyL": {}, "p4ncvbYe": {}, "QA4sW6oU": {}}, "slotId": "71fxKK8n", "sourceItemId": "YlZQcult", "tags": ["k3GHpGzp", "hL28fHSb", "xzlQxfPg"], "type": "fexi1vrd"}]' \
    > test.out 2>&1
eval_tap $? 22 'AdminBulkUpdateMyItems' test.out

#- 23 AdminSaveItemToInventory
./ng net.accelbyte.sdk.cli.Main inventory adminSaveItemToInventory \
    --inventoryId 'dRXeFpYD' \
    --namespace "$AB_NAMESPACE" \
    --userId '5w470G7c' \
    --body '{"customAttributes": {"niqu5g0V": {}, "3M0OYTHj": {}, "Bf5jVbdw": {}}, "qty": 65, "serverCustomAttributes": {"NfRxIUHV": {}, "UKw8euTJ": {}, "9U5vFwxP": {}}, "slotId": "2Bc3PNXJ", "slotUsed": 47, "sourceItemId": "1m62uVVK", "tags": ["mCrbp6h8", "JhnekM3Q", "0xl9ekSJ"], "type": "XIFSFLQZ"}' \
    > test.out 2>&1
eval_tap $? 23 'AdminSaveItemToInventory' test.out

#- 24 AdminBulkRemoveItems
./ng net.accelbyte.sdk.cli.Main inventory adminBulkRemoveItems \
    --inventoryId 'v2oKvRne' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ceiv2I4h' \
    --body '[{"slotId": "K2y4FTGF", "sourceItemId": "MVIMLWSP"}, {"slotId": "ujSYLLYh", "sourceItemId": "GpAWqFGr"}, {"slotId": "WQTiXcc5", "sourceItemId": "UdcajFH8"}]' \
    > test.out 2>&1
eval_tap $? 24 'AdminBulkRemoveItems' test.out

#- 25 AdminSaveItem
./ng net.accelbyte.sdk.cli.Main inventory adminSaveItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'bovW37dm' \
    --body '{"customAttributes": {"LqHA4TCE": {}, "dfq7RVnv": {}, "konjj778": {}}, "inventoryConfigurationCode": "I2D3z9RU", "qty": 75, "serverCustomAttributes": {"Upq0mrWh": {}, "IV4PKA5o": {}, "sDvSPXue": {}}, "slotId": "amwWM4yE", "slotUsed": 83, "sourceItemId": "L23fROB2", "tags": ["rByXVlt9", "grU8fWst", "E4crmX6g"], "type": "wc5k2k76"}' \
    > test.out 2>&1
eval_tap $? 25 'AdminSaveItem' test.out

#- 26 PublicListInventoryConfigurations
./ng net.accelbyte.sdk.cli.Main inventory publicListInventoryConfigurations \
    --namespace "$AB_NAMESPACE" \
    --code 'NLupeKje' \
    --limit '17' \
    --offset '88' \
    --sortBy 'code:desc' \
    > test.out 2>&1
eval_tap $? 26 'PublicListInventoryConfigurations' test.out

#- 27 PublicListItemTypes
./ng net.accelbyte.sdk.cli.Main inventory publicListItemTypes \
    --namespace "$AB_NAMESPACE" \
    --limit '69' \
    --offset '52' \
    --sortBy 'createdAt:asc' \
    > test.out 2>&1
eval_tap $? 27 'PublicListItemTypes' test.out

#- 28 PublicListTags
./ng net.accelbyte.sdk.cli.Main inventory publicListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '25' \
    --offset '46' \
    --sortBy 'name:desc' \
    > test.out 2>&1
eval_tap $? 28 'PublicListTags' test.out

#- 29 PublicListInventories
./ng net.accelbyte.sdk.cli.Main inventory publicListInventories \
    --namespace "$AB_NAMESPACE" \
    --inventoryConfigurationCode 'Pf5SKukG' \
    --limit '40' \
    --offset '58' \
    --sortBy 'createdAt:desc' \
    > test.out 2>&1
eval_tap $? 29 'PublicListInventories' test.out

#- 30 PublicConsumeMyItem
./ng net.accelbyte.sdk.cli.Main inventory publicConsumeMyItem \
    --inventoryId 'jgYPL6bU' \
    --namespace "$AB_NAMESPACE" \
    --body '{"qty": 49, "slotId": "SfPUiX4w", "sourceItemId": "YoSN4e7z"}' \
    > test.out 2>&1
eval_tap $? 30 'PublicConsumeMyItem' test.out

#- 31 PublicListItems
./ng net.accelbyte.sdk.cli.Main inventory publicListItems \
    --inventoryId '1xz7yTXF' \
    --namespace "$AB_NAMESPACE" \
    --limit '63' \
    --offset '27' \
    --qtyGte '84' \
    --sortBy 'updatedAt:desc' \
    --sourceItemId 'kRzoMdSa' \
    --tags 'YlRPxucQ' \
    > test.out 2>&1
eval_tap $? 31 'PublicListItems' test.out

#- 32 PublicBulkUpdateMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicBulkUpdateMyItems \
    --inventoryId 'NftY5VcT' \
    --namespace "$AB_NAMESPACE" \
    --body '[{"customAttributes": {"w6X35KkV": {}, "riTLutJv": {}, "FfpPi6vJ": {}}, "slotId": "xUmREpbO", "sourceItemId": "1T60tJiD", "tags": ["jtfK6SCB", "xgLFHwc8", "XVKYIikD"]}, {"customAttributes": {"1BbpKzDc": {}, "yhppFjYb": {}, "kspc2B88": {}}, "slotId": "BozVrtSy", "sourceItemId": "ZbhiPAGW", "tags": ["Y3UP6Bng", "e2zKCsil", "OYLNmRwJ"]}, {"customAttributes": {"CG8fXNXv": {}, "cVCu4Wo2": {}, "1gKDvqtM": {}}, "slotId": "cHtWgKav", "sourceItemId": "VboxxxgC", "tags": ["2GgScVfS", "j8iZTNhP", "72NpBnou"]}]' \
    > test.out 2>&1
eval_tap $? 32 'PublicBulkUpdateMyItems' test.out

#- 33 PublicBulkRemoveMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicBulkRemoveMyItems \
    --inventoryId 'Gc4UFmyG' \
    --namespace "$AB_NAMESPACE" \
    --body '[{"slotId": "lMpI1L4o", "sourceItemId": "BPmIHPSb"}, {"slotId": "mwKbrmTl", "sourceItemId": "IS2o6w4A"}, {"slotId": "uUQ0qOrJ", "sourceItemId": "BxED0QXa"}]' \
    > test.out 2>&1
eval_tap $? 33 'PublicBulkRemoveMyItems' test.out

#- 34 PublicMoveMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicMoveMyItems \
    --inventoryId 'MHt9nGWn' \
    --namespace "$AB_NAMESPACE" \
    --body '{"items": [{"qty": 75, "slotId": "fgreIfN5", "sourceItemId": "STRxmSBZ"}, {"qty": 6, "slotId": "ENH9OAYy", "sourceItemId": "Dv6PVRty"}, {"qty": 32, "slotId": "nKUt8B2b", "sourceItemId": "WeckZYr4"}], "srcInventoryId": "0hj7I81r"}' \
    > test.out 2>&1
eval_tap $? 34 'PublicMoveMyItems' test.out

#- 35 PublicGetItem
./ng net.accelbyte.sdk.cli.Main inventory publicGetItem \
    --inventoryId 'SnPQqkB3' \
    --namespace "$AB_NAMESPACE" \
    --slotId '8iSWmD7f' \
    --sourceItemId 'kIbaJaWm' \
    > test.out 2>&1
eval_tap $? 35 'PublicGetItem' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
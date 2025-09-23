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
    --body '{"message": "npUKpBl8", "operations": [{"consumeItems": [{"dateRangeValidation": true, "inventoryId": "G23HORpO", "options": ["PM9CnyLN", "fjMqR0oh", "Bpe9JLRV"], "qty": 65, "slotId": "kigboYz0", "sourceItemId": "9HkqJ4sq"}, {"dateRangeValidation": false, "inventoryId": "Eu2hHlOZ", "options": ["94fWxyL5", "d3ZLVsMB", "JoOmMdV7"], "qty": 98, "slotId": "3gPn1sJW", "sourceItemId": "nhD2N2xz"}, {"dateRangeValidation": false, "inventoryId": "FIIGXRkT", "options": ["Q1OH50fx", "pes18UwJ", "XLQySFd9"], "qty": 1, "slotId": "6z2cdl9r", "sourceItemId": "EPAkQEGe"}], "createItems": [{"customAttributes": {"dOLLyfOA": {}, "JDFQ1vZJ": {}, "NZJRoNau": {}}, "inventoryConfigurationCode": "3jrsC8xU", "inventoryId": "KNLCR5Ub", "qty": 61, "serverCustomAttributes": {"Ij9DP0kF": {}, "66UCI01B": {}, "Q1TdnhWh": {}}, "slotId": "0fy6SjNx", "slotUsed": 99, "source": "ECOMMERCE", "sourceItemId": "qziaeBL5", "tags": ["J9UkDA2t", "5SIyY8pH", "oz3SvvUm"], "toSpecificInventory": true, "type": "vW1ullzH"}, {"customAttributes": {"vCaihaeN": {}, "38T0R4GZ": {}, "AuBuj0lX": {}}, "inventoryConfigurationCode": "4aZ45ucT", "inventoryId": "R8YXdK3g", "qty": 90, "serverCustomAttributes": {"lQAIk1Pt": {}, "O8JBoou5": {}, "pceb3OtG": {}}, "slotId": "BOj8VbqV", "slotUsed": 51, "source": "ECOMMERCE", "sourceItemId": "WQwAv5th", "tags": ["rfpUm6zT", "KxVPIVqI", "XnrJJnCi"], "toSpecificInventory": false, "type": "L0V7OuXA"}, {"customAttributes": {"ffZuVy2l": {}, "cAZ4hoiR": {}, "7SRsBIzU": {}}, "inventoryConfigurationCode": "Gq9thSFV", "inventoryId": "q9W79RSC", "qty": 47, "serverCustomAttributes": {"3tHBTM0a": {}, "at7XwSOD": {}, "WuNgqXWz": {}}, "slotId": "A9jfi7KN", "slotUsed": 76, "source": "ECOMMERCE", "sourceItemId": "9x1WBlVg", "tags": ["vQv0kuAw", "quUGwMT9", "fxCdob89"], "toSpecificInventory": false, "type": "YlgKHHCy"}], "removeItems": [{"inventoryId": "WEnrx3mE", "slotId": "ssjkj72Q", "sourceItemId": "9qh8YGyM"}, {"inventoryId": "iWpXadCy", "slotId": "Ru1mCARd", "sourceItemId": "KUwiNmcG"}, {"inventoryId": "pcPlcU4X", "slotId": "nKxQHxhi", "sourceItemId": "zQhokRWt"}], "targetUserId": "R0wepnE5", "updateItems": [{"customAttributes": {"KFBSa4DK": {}, "1IYdbbFH": {}, "U3fV4AkA": {}}, "inventoryId": "xZYbuz6V", "serverCustomAttributes": {"Zm97BUf6": {}, "w3snbAaH": {}, "Gg6gvnay": {}}, "slotId": "fnTotYP5", "sourceItemId": "pQ82vNX4", "tags": ["ralV2GBk", "RGMrNHjN", "iJdCJFrL"], "type": "ASo2cBmB"}, {"customAttributes": {"4VLwQK93": {}, "FR4yY5I3": {}, "dPPIgkfT": {}}, "inventoryId": "AuUGfXwC", "serverCustomAttributes": {"RbMY2tQI": {}, "fGKOnNzX": {}, "m1UQhuMR": {}}, "slotId": "arUPBccH", "sourceItemId": "iwHuNFwK", "tags": ["CfkVsX0R", "A8iLkGPX", "RmmHf9F4"], "type": "34fZdUIh"}, {"customAttributes": {"smVrIf7b": {}, "hokBUSDv": {}, "4UV7Yfjj": {}}, "inventoryId": "9pVxPYIQ", "serverCustomAttributes": {"YGlTchN9": {}, "PNxOQVEQ": {}, "eEy1uJ3V": {}}, "slotId": "vQw2BcU4", "sourceItemId": "kHCp8dQ3", "tags": ["6VzMdlSy", "RzwnyZil", "SilJWVw7"], "type": "N3OfJFmJ"}]}, {"consumeItems": [{"dateRangeValidation": true, "inventoryId": "1yiolVXx", "options": ["Ucqh7O3B", "3FWMPtIr", "FjeuqcXP"], "qty": 87, "slotId": "RziLplTD", "sourceItemId": "YTvysHO8"}, {"dateRangeValidation": true, "inventoryId": "NrwhRnyM", "options": ["TqwjzjxA", "SrgIvdgY", "dlpp9bzz"], "qty": 36, "slotId": "B17oQDQn", "sourceItemId": "tHm1mgqj"}, {"dateRangeValidation": false, "inventoryId": "cqpvFlbb", "options": ["A6m3FJ5M", "6cWfoAz9", "YjQ3DYl3"], "qty": 97, "slotId": "MGbiLFxg", "sourceItemId": "gnbvgljO"}], "createItems": [{"customAttributes": {"eXmjylLf": {}, "RA435BiW": {}, "y0Rn6VwJ": {}}, "inventoryConfigurationCode": "nhiBC2cX", "inventoryId": "0tbMNYt4", "qty": 80, "serverCustomAttributes": {"qttWqJYG": {}, "pFgcUjrf": {}, "7yYxiwwG": {}}, "slotId": "YZapsaDR", "slotUsed": 45, "source": "OTHER", "sourceItemId": "xx7quwEj", "tags": ["s4arI2f5", "xbPE0WyH", "W9LuRrpL"], "toSpecificInventory": false, "type": "mSurosPl"}, {"customAttributes": {"G3lPeyvl": {}, "2mjfuNj6": {}, "z7iFG1xt": {}}, "inventoryConfigurationCode": "2Nl8fGoF", "inventoryId": "unyW0xm9", "qty": 93, "serverCustomAttributes": {"EHLtauqR": {}, "stRGUUkr": {}, "2cmLugHQ": {}}, "slotId": "qqWdyZPF", "slotUsed": 73, "source": "ECOMMERCE", "sourceItemId": "hsLetE4O", "tags": ["X9Mupw8j", "oeQlhBa6", "MI4jqdGV"], "toSpecificInventory": false, "type": "wY1kdbmU"}, {"customAttributes": {"G4kl31IG": {}, "HzuWpLP8": {}, "MjjuZ1lh": {}}, "inventoryConfigurationCode": "JHM0yB0y", "inventoryId": "sxhaoUed", "qty": 17, "serverCustomAttributes": {"NQ8g3XPk": {}, "locqQ5Nm": {}, "Zimeps8v": {}}, "slotId": "aqKM1YWF", "slotUsed": 21, "source": "ECOMMERCE", "sourceItemId": "rrElGJBk", "tags": ["pG1MzBCE", "M7PO4uoU", "gVxa2dUB"], "toSpecificInventory": true, "type": "Zn7jTyd1"}], "removeItems": [{"inventoryId": "qZgteb3V", "slotId": "XFjQr6Dh", "sourceItemId": "zqbyKx92"}, {"inventoryId": "uWDEMUXR", "slotId": "0LbQYc9J", "sourceItemId": "BfAw9Wd8"}, {"inventoryId": "TULLFw86", "slotId": "3lNT6tQR", "sourceItemId": "ga9dYL3Y"}], "targetUserId": "ey77qHie", "updateItems": [{"customAttributes": {"xZRRdA32": {}, "9ENEQdBk": {}, "zfY3DnkR": {}}, "inventoryId": "QJU1bWvH", "serverCustomAttributes": {"zRVpLgAn": {}, "ymLqK7JB": {}, "3H093MvY": {}}, "slotId": "2V7apQey", "sourceItemId": "8cKSNjcI", "tags": ["vXai2fax", "pZFFAzKV", "5iM7vtDF"], "type": "rWIrFAaX"}, {"customAttributes": {"4xPCH4KK": {}, "MPOy4l8w": {}, "EGprWvBR": {}}, "inventoryId": "OfKBRbKn", "serverCustomAttributes": {"UXEJk4H4": {}, "CembNeNB": {}, "cHIh07FV": {}}, "slotId": "Yap7FU5C", "sourceItemId": "8y68sBSa", "tags": ["okegFkHf", "fKsqHDqb", "CDdfxRBb"], "type": "8m0jfW51"}, {"customAttributes": {"JxPKJx8H": {}, "8modNvif": {}, "kU0XdWOz": {}}, "inventoryId": "SP2P9xE8", "serverCustomAttributes": {"GyDhufy6": {}, "dNr0PrYw": {}, "K7YXKoT4": {}}, "slotId": "ZTlKBWTi", "sourceItemId": "BTL8uoIH", "tags": ["x9QjpQqa", "r4I2L8Hl", "mAEo79D2"], "type": "3n4wIxL6"}]}, {"consumeItems": [{"dateRangeValidation": false, "inventoryId": "Ex3a8xkI", "options": ["I2x7fiDZ", "oBDuHo45", "kpTSDmdA"], "qty": 9, "slotId": "UnoHxklJ", "sourceItemId": "PzLsXw0K"}, {"dateRangeValidation": false, "inventoryId": "oY17f6pC", "options": ["31LoKtX3", "A59NuSVu", "liSdUv49"], "qty": 81, "slotId": "Ide7MrHX", "sourceItemId": "2vaN4vx2"}, {"dateRangeValidation": false, "inventoryId": "9kjpOsKr", "options": ["RW33IHWs", "Rx3XH52U", "Lh1lZ8cu"], "qty": 96, "slotId": "dCdPqp3q", "sourceItemId": "sq6RwT6B"}], "createItems": [{"customAttributes": {"zo3RmcX8": {}, "VgWaqmOn": {}, "zqWUtJHH": {}}, "inventoryConfigurationCode": "T5Gw8OQO", "inventoryId": "ZvGhleVO", "qty": 71, "serverCustomAttributes": {"ZsCKOOGi": {}, "kCMVvHoV": {}, "v5o4RaDL": {}}, "slotId": "OZKrT0qy", "slotUsed": 41, "source": "OTHER", "sourceItemId": "cG4WpZ4F", "tags": ["AhtkislK", "pqOGiKpR", "eC5wcDus"], "toSpecificInventory": true, "type": "ZRodHDCr"}, {"customAttributes": {"8jbsXLYs": {}, "IDmT7pSp": {}, "0hjGgXSH": {}}, "inventoryConfigurationCode": "TZJCvar0", "inventoryId": "uwOQ0WGH", "qty": 63, "serverCustomAttributes": {"zzvxq3Ap": {}, "QBJERHsw": {}, "0hklZKQG": {}}, "slotId": "BwfmTCDU", "slotUsed": 43, "source": "ECOMMERCE", "sourceItemId": "DinnEGI0", "tags": ["4KiznCan", "Q2Naofa2", "gpYG6OLi"], "toSpecificInventory": false, "type": "WcXgAXJ2"}, {"customAttributes": {"vs0FlA3z": {}, "1D1XG0iS": {}, "O2HIw6zt": {}}, "inventoryConfigurationCode": "SdT0A3rU", "inventoryId": "dFmnxvFT", "qty": 50, "serverCustomAttributes": {"OMB7PVhG": {}, "AV810jvJ": {}, "BX46lNtL": {}}, "slotId": "QangSEMr", "slotUsed": 45, "source": "ECOMMERCE", "sourceItemId": "wa1KA6nP", "tags": ["z7BFYPxd", "VvblSG74", "oXsXYIJI"], "toSpecificInventory": true, "type": "bZ9GIA0B"}], "removeItems": [{"inventoryId": "wa2ZWU4J", "slotId": "sT9ZCT2p", "sourceItemId": "fLvZowh2"}, {"inventoryId": "HrqOaK8Y", "slotId": "zD5ucr8B", "sourceItemId": "pslqWUko"}, {"inventoryId": "tVUbQm85", "slotId": "F0Y6pn9g", "sourceItemId": "Jq5rZNpW"}], "targetUserId": "mEvbUiw4", "updateItems": [{"customAttributes": {"b6mO3uzn": {}, "L0Yy4HME": {}, "U48mryXT": {}}, "inventoryId": "MHmKItdE", "serverCustomAttributes": {"v56XEgSF": {}, "ZkD7m9JH": {}, "ARF1ZBgv": {}}, "slotId": "u9ZQDDKA", "sourceItemId": "a4GyTZ1w", "tags": ["krCjyk35", "enZbL9bR", "QP6srsMo"], "type": "mO6Xdqlc"}, {"customAttributes": {"1zXfjY5H": {}, "LvjmN9a1": {}, "UUmx8J6m": {}}, "inventoryId": "HGhvrJrs", "serverCustomAttributes": {"LMWnnEYj": {}, "njwUQRBW": {}, "EzlIT4gU": {}}, "slotId": "i3TgYGLd", "sourceItemId": "ofFM2RiZ", "tags": ["PyQRjQ1k", "kWXJTj3G", "cBBFXjWy"], "type": "KH7fHi6q"}, {"customAttributes": {"8Bd9bhwy": {}, "YibEdzDl": {}, "dmKEiRh1": {}}, "inventoryId": "jkb9ri2O", "serverCustomAttributes": {"3f58B6Zt": {}, "OpfQHKsH": {}, "IhEOP8Vg": {}}, "slotId": "ncoVmumY", "sourceItemId": "aHIBzABd", "tags": ["2RAC3gYb", "TLuKbJam", "NvzsPoro"], "type": "mqMMGPhw"}]}], "requestId": "wE0oGQH9"}' \
    > test.out 2>&1
eval_tap $? 2 'AdminCreateChainingOperations' test.out

#- 3 AdminListIntegrationConfigurations
./ng net.accelbyte.sdk.cli.Main inventory adminListIntegrationConfigurations \
    --namespace "$AB_NAMESPACE" \
    --limit '29' \
    --offset '49' \
    --sortBy 'createdAt:desc' \
    > test.out 2>&1
eval_tap $? 3 'AdminListIntegrationConfigurations' test.out

#- 4 AdminCreateIntegrationConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminCreateIntegrationConfiguration \
    --namespace "$AB_NAMESPACE" \
    --body '{"mapItemType": ["NvbVCKzb", "uBYSxhCm", "iycYKhaH"], "serviceName": "jDKzbIRn", "targetInventoryCode": "geS1hQrd"}' \
    > test.out 2>&1
eval_tap $? 4 'AdminCreateIntegrationConfiguration' test.out

#- 5 AdminUpdateIntegrationConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateIntegrationConfiguration \
    --integrationConfigurationId '2lrZOKrj' \
    --namespace "$AB_NAMESPACE" \
    --body '{"mapItemType": ["57H8gEUh", "l39BbR0b", "0Pr49jS8"], "serviceName": "LxX4CaM2", "targetInventoryCode": "GeA4zggO"}' \
    > test.out 2>&1
eval_tap $? 5 'AdminUpdateIntegrationConfiguration' test.out

#- 6 AdminUpdateStatusIntegrationConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateStatusIntegrationConfiguration \
    --integrationConfigurationId 'd1IlHISL' \
    --namespace "$AB_NAMESPACE" \
    --body '{"status": "TIED"}' \
    > test.out 2>&1
eval_tap $? 6 'AdminUpdateStatusIntegrationConfiguration' test.out

#- 7 AdminListInventories
./ng net.accelbyte.sdk.cli.Main inventory adminListInventories \
    --namespace "$AB_NAMESPACE" \
    --inventoryConfigurationCode 'PHYXV7QM' \
    --limit '57' \
    --offset '43' \
    --sortBy 'createdAt:asc' \
    --userId 'wFYQqti9' \
    > test.out 2>&1
eval_tap $? 7 'AdminListInventories' test.out

#- 8 AdminCreateInventory
./ng net.accelbyte.sdk.cli.Main inventory adminCreateInventory \
    --namespace "$AB_NAMESPACE" \
    --body '{"inventoryConfigurationCode": "Q6gYaybx", "userId": "YS7Tw56F"}' \
    > test.out 2>&1
eval_tap $? 8 'AdminCreateInventory' test.out

#- 9 AdminGetInventory
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventory \
    --inventoryId 'gRawdf8y' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'AdminGetInventory' test.out

#- 10 AdminUpdateInventory
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateInventory \
    --inventoryId 'pQfSfBhV' \
    --namespace "$AB_NAMESPACE" \
    --body '{"incMaxSlots": 77}' \
    > test.out 2>&1
eval_tap $? 10 'AdminUpdateInventory' test.out

#- 11 DeleteInventory
./ng net.accelbyte.sdk.cli.Main inventory deleteInventory \
    --inventoryId 't3fyXhOV' \
    --namespace "$AB_NAMESPACE" \
    --body '{"message": "2kqT0ehj"}' \
    > test.out 2>&1
eval_tap $? 11 'DeleteInventory' test.out

#- 12 AdminListItems
./ng net.accelbyte.sdk.cli.Main inventory adminListItems \
    --inventoryId '9Ij98GQ8' \
    --namespace "$AB_NAMESPACE" \
    --limit '60' \
    --offset '22' \
    --sortBy 'updatedAt' \
    --sourceItemId 'uWDREjOY' \
    --tags 'orYCKcUY' \
    > test.out 2>&1
eval_tap $? 12 'AdminListItems' test.out

#- 13 AdminGetInventoryItem
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventoryItem \
    --inventoryId 'sEdpgXWO' \
    --namespace "$AB_NAMESPACE" \
    --slotId 'UOMZhtuD' \
    --sourceItemId '9rOYSmGv' \
    > test.out 2>&1
eval_tap $? 13 'AdminGetInventoryItem' test.out

#- 14 AdminListInventoryConfigurations
./ng net.accelbyte.sdk.cli.Main inventory adminListInventoryConfigurations \
    --namespace "$AB_NAMESPACE" \
    --code '9iqn4doA' \
    --limit '74' \
    --offset '62' \
    --sortBy 'createdAt' \
    > test.out 2>&1
eval_tap $? 14 'AdminListInventoryConfigurations' test.out

#- 15 AdminCreateInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminCreateInventoryConfiguration \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "tpKfRDZH", "description": "ETlSNbZd", "initialMaxSlots": 1, "maxInstancesPerUser": 64, "maxUpgradeSlots": 13, "name": "kUcluuBJ"}' \
    > test.out 2>&1
eval_tap $? 15 'AdminCreateInventoryConfiguration' test.out

#- 16 AdminGetInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventoryConfiguration \
    --inventoryConfigurationId 'V41Um8qC' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'AdminGetInventoryConfiguration' test.out

#- 17 AdminUpdateInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateInventoryConfiguration \
    --inventoryConfigurationId '1ZnsPXnA' \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "T7F23ghz", "description": "gqMtZ1NT", "initialMaxSlots": 23, "maxInstancesPerUser": 59, "maxUpgradeSlots": 29, "name": "iMimqZOA"}' \
    > test.out 2>&1
eval_tap $? 17 'AdminUpdateInventoryConfiguration' test.out

#- 18 AdminDeleteInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteInventoryConfiguration \
    --inventoryConfigurationId 'fns8C1lb' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminDeleteInventoryConfiguration' test.out

#- 19 AdminListItemTypes
./ng net.accelbyte.sdk.cli.Main inventory adminListItemTypes \
    --namespace "$AB_NAMESPACE" \
    --limit '50' \
    --offset '38' \
    --sortBy 'name:asc' \
    > test.out 2>&1
eval_tap $? 19 'AdminListItemTypes' test.out

#- 20 AdminCreateItemType
./ng net.accelbyte.sdk.cli.Main inventory adminCreateItemType \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "5LroNNGm"}' \
    > test.out 2>&1
eval_tap $? 20 'AdminCreateItemType' test.out

#- 21 AdminDeleteItemType
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteItemType \
    --itemTypeName 'E4jUuXPX' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'AdminDeleteItemType' test.out

#- 22 AdminListTags
./ng net.accelbyte.sdk.cli.Main inventory adminListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '69' \
    --offset '84' \
    --owner '2gbIXmBC' \
    --sortBy 'name:desc' \
    > test.out 2>&1
eval_tap $? 22 'AdminListTags' test.out

#- 23 AdminCreateTag
./ng net.accelbyte.sdk.cli.Main inventory adminCreateTag \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "S5Ni8KG2", "owner": "SERVER"}' \
    > test.out 2>&1
eval_tap $? 23 'AdminCreateTag' test.out

#- 24 AdminDeleteTag
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteTag \
    --namespace "$AB_NAMESPACE" \
    --tagName 'fgpfI06l' \
    > test.out 2>&1
eval_tap $? 24 'AdminDeleteTag' test.out

#- 25 AdminConsumeUserItem
./ng net.accelbyte.sdk.cli.Main inventory adminConsumeUserItem \
    --inventoryId 'cI82NPsc' \
    --namespace "$AB_NAMESPACE" \
    --userId 'x5oXZ9Jx' \
    --dateRangeValidation '8iQuJNbq' \
    --body '{"options": ["Lyp1NiuD", "G0CDp1p3", "YTyimuHW"], "qty": 20, "slotId": "9Yq0FQm9", "sourceItemId": "Oh2BltaY"}' \
    > test.out 2>&1
eval_tap $? 25 'AdminConsumeUserItem' test.out

#- 26 AdminBulkUpdateMyItems
./ng net.accelbyte.sdk.cli.Main inventory adminBulkUpdateMyItems \
    --inventoryId 'AMIGFEdw' \
    --namespace "$AB_NAMESPACE" \
    --userId 'tNrTYYCD' \
    --body '[{"customAttributes": {"v23ukdXE": {}, "NANaVopE": {}, "4C0C0GjI": {}}, "serverCustomAttributes": {"zcrn0SFm": {}, "HF3T3KSS": {}, "x1NdmiNI": {}}, "slotId": "nFgRZrcL", "sourceItemId": "jkhlWLmB", "tags": ["gKGWGSRN", "KnbOi25W", "q6ryreEX"], "type": "iTUhsyae"}, {"customAttributes": {"UTurpEX4": {}, "ytFk4kvd": {}, "8VgkQx3x": {}}, "serverCustomAttributes": {"7nbeRTH1": {}, "c9meEjl9": {}, "dFdkJko3": {}}, "slotId": "0G7CbwZw", "sourceItemId": "RpneqyKZ", "tags": ["EbiV2NJM", "aKrqr27E", "DLt8R0jx"], "type": "vcOS481p"}, {"customAttributes": {"ztqeF7lW": {}, "gokpWnqq": {}, "9rVsESV2": {}}, "serverCustomAttributes": {"Yevluc0i": {}, "uybdEo2N": {}, "aejrca7H": {}}, "slotId": "tNZWFPKp", "sourceItemId": "4wLSrsix", "tags": ["0dL0mHqF", "kl7ZaVG2", "wUDTAQxS"], "type": "0Pg3U4K9"}]' \
    > test.out 2>&1
eval_tap $? 26 'AdminBulkUpdateMyItems' test.out

#- 27 AdminSaveItemToInventory
./ng net.accelbyte.sdk.cli.Main inventory adminSaveItemToInventory \
    --inventoryId 'rL6U2vbM' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Pdyumsde' \
    --body '{"customAttributes": {"1PApvcD4": {}, "jGl4Akr9": {}, "9YiNXYO8": {}}, "qty": 5, "serverCustomAttributes": {"puhoPbVG": {}, "HdIV8IbO": {}, "PZrAIePD": {}}, "slotId": "oh8dGBxs", "slotUsed": 74, "source": "ECOMMERCE", "sourceItemId": "TcqPLSdx", "tags": ["BWQae6y4", "pRfhdjce", "NcgnPvQc"], "type": "g4DoJZdn"}' \
    > test.out 2>&1
eval_tap $? 27 'AdminSaveItemToInventory' test.out

#- 28 AdminBulkRemoveItems
./ng net.accelbyte.sdk.cli.Main inventory adminBulkRemoveItems \
    --inventoryId 'OoubsMnK' \
    --namespace "$AB_NAMESPACE" \
    --userId 'JHLW2yJL' \
    --body '[{"slotId": "p6upeBCI", "sourceItemId": "81sIH405"}, {"slotId": "03NXS4EU", "sourceItemId": "ybJ2s0Fa"}, {"slotId": "Y8ujZwtk", "sourceItemId": "3RXU1nJs"}]' \
    > test.out 2>&1
eval_tap $? 28 'AdminBulkRemoveItems' test.out

#- 29 AdminBulkSaveItemToInventory
./ng net.accelbyte.sdk.cli.Main inventory adminBulkSaveItemToInventory \
    --inventoryId 'l73xyh43' \
    --namespace "$AB_NAMESPACE" \
    --userId '1FAloxDI' \
    --body '[{"customAttributes": {"YPA5l411": {}, "gW1YaD7B": {}, "FVPJih19": {}}, "qty": 45, "serverCustomAttributes": {"cKaz3J2N": {}, "moEieX0g": {}, "0Qy4DkKv": {}}, "slotId": "BvOuqErv", "slotUsed": 54, "source": "ECOMMERCE", "sourceItemId": "soZsSeeV", "tags": ["0W55vcvK", "hmv04kPF", "Eu74AWcv"], "type": "XETn3hQx"}, {"customAttributes": {"hESd5JXY": {}, "YLiVaYeZ": {}, "YFdLS19e": {}}, "qty": 89, "serverCustomAttributes": {"wSOQ3WlR": {}, "7v7xatec": {}, "KfBH8NjE": {}}, "slotId": "PGCD1jWn", "slotUsed": 85, "source": "OTHER", "sourceItemId": "7T4WaX5r", "tags": ["Jvuxes4F", "Pl7vUjfC", "bTQEA6wx"], "type": "jJXv6p4W"}, {"customAttributes": {"Df0A18lw": {}, "q13B8WTw": {}, "utkPSnIV": {}}, "qty": 61, "serverCustomAttributes": {"St6ABuhf": {}, "ybbt2w69": {}, "homUTV4Q": {}}, "slotId": "gIgOp7he", "slotUsed": 57, "source": "ECOMMERCE", "sourceItemId": "wT1FpDeE", "tags": ["9o1zYuMr", "jmBdNXMw", "Cn0QcRQV"], "type": "WAqfraD0"}]' \
    > test.out 2>&1
eval_tap $? 29 'AdminBulkSaveItemToInventory' test.out

#- 30 AdminUpdateUserInventoriesByInventoryCode
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateUserInventoriesByInventoryCode \
    --inventoryConfigurationCode 'edcVlb0L' \
    --namespace "$AB_NAMESPACE" \
    --userId 'krexn5W4' \
    --body '{"incMaxSlots": 67}' \
    > test.out 2>&1
eval_tap $? 30 'AdminUpdateUserInventoriesByInventoryCode' test.out

#- 31 AdminSaveItem
./ng net.accelbyte.sdk.cli.Main inventory adminSaveItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'wPLSVLzn' \
    --body '{"customAttributes": {"bYYHU9CN": {}, "FpezTfXf": {}, "A0jLDDiM": {}}, "inventoryConfigurationCode": "ZRO9rYWj", "qty": 9, "serverCustomAttributes": {"ER31Kq05": {}, "2wJS1nhQ": {}, "c1ETIPJO": {}}, "slotId": "a67aPbpf", "slotUsed": 98, "source": "ECOMMERCE", "sourceItemId": "IsVbNqzm", "tags": ["OSGMbkfx", "5Jikgqor", "4uHcYDz6"], "type": "JoOXFwRL"}' \
    > test.out 2>&1
eval_tap $? 31 'AdminSaveItem' test.out

#- 32 AdminBulkSaveItem
./ng net.accelbyte.sdk.cli.Main inventory adminBulkSaveItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'KCVkqEdI' \
    --body '[{"customAttributes": {"XmTrXfDk": {}, "UrLdYPSA": {}, "s2PP9qBg": {}}, "inventoryConfigurationCode": "nJKp8a1m", "qty": 22, "serverCustomAttributes": {"4MUxB0eb": {}, "9e4e3r6l": {}, "5xTMHQoM": {}}, "slotId": "YdcAh2Qe", "slotUsed": 30, "source": "ECOMMERCE", "sourceItemId": "yfOGYrdG", "tags": ["pAtdsxu9", "gjrIC1MH", "rwhjkIAs"], "type": "vjv67Xo0"}, {"customAttributes": {"ahDjUddr": {}, "heulkrjx": {}, "4IHiAHIe": {}}, "inventoryConfigurationCode": "2JSUVRoP", "qty": 16, "serverCustomAttributes": {"PhK9D8Tv": {}, "sDPcu12b": {}, "54qJJkKo": {}}, "slotId": "sQhD8kAO", "slotUsed": 64, "source": "ECOMMERCE", "sourceItemId": "G3lxm0kV", "tags": ["o4bZCqvQ", "Pg6MmmmQ", "Fp6hKgjg"], "type": "1grfQoyM"}, {"customAttributes": {"TrpcWHFh": {}, "WNYKFQYx": {}, "hBmPQ6hm": {}}, "inventoryConfigurationCode": "RfRG58bB", "qty": 46, "serverCustomAttributes": {"taz4blBH": {}, "c9wq0NBW": {}, "uOQT6xHk": {}}, "slotId": "TmLJro5Q", "slotUsed": 19, "source": "OTHER", "sourceItemId": "czsBrIBc", "tags": ["jpMqez1u", "Iqz85vsj", "hnzDy7ym"], "type": "lM6GJAdG"}]' \
    > test.out 2>&1
eval_tap $? 32 'AdminBulkSaveItem' test.out

#- 33 AdminSyncUserEntitlements
./ng net.accelbyte.sdk.cli.Main inventory adminSyncUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'FBGQvrq7' \
    > test.out 2>&1
eval_tap $? 33 'AdminSyncUserEntitlements' test.out

#- 34 AdminPurchasable
./ng net.accelbyte.sdk.cli.Main inventory adminPurchasable \
    --namespace "$AB_NAMESPACE" \
    --userId 'V3NCloSV' \
    --body '{"entitlementType": "cs4teH6Q", "inventoryConfig": {"slotUsed": 42}, "itemId": "OWWUYBf4", "itemType": "G8o35Ln4", "items": [{"bundledQty": 91, "entitlementType": "7cVuJIAG", "inventoryConfig": {"slotUsed": 98}, "itemId": "BsupbePH", "itemType": "bdIjSwjG", "sku": "nmhh6WKU", "stackable": false, "useCount": 83}, {"bundledQty": 5, "entitlementType": "zu2BcI2e", "inventoryConfig": {"slotUsed": 59}, "itemId": "5uTrHrj6", "itemType": "lHGIttrg", "sku": "roYVkFuy", "stackable": false, "useCount": 84}, {"bundledQty": 35, "entitlementType": "Mn6nvOfi", "inventoryConfig": {"slotUsed": 86}, "itemId": "6P3EeZDc", "itemType": "KaphAoSl", "sku": "obzeGuDU", "stackable": false, "useCount": 20}], "quantity": 66, "sku": "oJ4CVbGG", "stackable": false, "useCount": 1}' \
    > test.out 2>&1
eval_tap $? 34 'AdminPurchasable' test.out

#- 35 PublicListInventoryConfigurations
./ng net.accelbyte.sdk.cli.Main inventory publicListInventoryConfigurations \
    --namespace "$AB_NAMESPACE" \
    --code '4j4zQLCv' \
    --limit '44' \
    --offset '96' \
    --sortBy 'updatedAt' \
    > test.out 2>&1
eval_tap $? 35 'PublicListInventoryConfigurations' test.out

#- 36 PublicListItemTypes
./ng net.accelbyte.sdk.cli.Main inventory publicListItemTypes \
    --namespace "$AB_NAMESPACE" \
    --limit '46' \
    --offset '71' \
    --sortBy 'createdAt:desc' \
    > test.out 2>&1
eval_tap $? 36 'PublicListItemTypes' test.out

#- 37 PublicListTags
./ng net.accelbyte.sdk.cli.Main inventory publicListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '67' \
    --offset '5' \
    --sortBy 'createdAt:asc' \
    > test.out 2>&1
eval_tap $? 37 'PublicListTags' test.out

#- 38 PublicListInventories
./ng net.accelbyte.sdk.cli.Main inventory publicListInventories \
    --namespace "$AB_NAMESPACE" \
    --inventoryConfigurationCode 'D9pqTvWo' \
    --limit '50' \
    --offset '24' \
    --sortBy 'updatedAt:desc' \
    > test.out 2>&1
eval_tap $? 38 'PublicListInventories' test.out

#- 39 PublicConsumeMyItem
./ng net.accelbyte.sdk.cli.Main inventory publicConsumeMyItem \
    --inventoryId 'WEtTwTFu' \
    --namespace "$AB_NAMESPACE" \
    --body '{"options": ["yJRTYGM7", "VJTfZRvR", "aOC9syFj"], "qty": 47, "slotId": "23LD5okD", "sourceItemId": "Fuyztl6i"}' \
    > test.out 2>&1
eval_tap $? 39 'PublicConsumeMyItem' test.out

#- 40 PublicListItems
./ng net.accelbyte.sdk.cli.Main inventory publicListItems \
    --inventoryId '9Ssfn1YI' \
    --namespace "$AB_NAMESPACE" \
    --limit '38' \
    --offset '69' \
    --sortBy 'updatedAt:desc' \
    --sourceItemId 'TIRpp7Dr' \
    --tags 'IPDpxWOr' \
    > test.out 2>&1
eval_tap $? 40 'PublicListItems' test.out

#- 41 PublicBulkUpdateMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicBulkUpdateMyItems \
    --inventoryId 'Xk2O5VBa' \
    --namespace "$AB_NAMESPACE" \
    --body '[{"customAttributes": {"LAFhKzIt": {}, "gNZSMDiK": {}, "0h50nYJj": {}}, "slotId": "3eu2vERO", "sourceItemId": "UAfMN9V7", "tags": ["nhtuGFsG", "x16B0ypJ", "v4VUTLM8"]}, {"customAttributes": {"wwg17sar": {}, "Ulyl1fd7": {}, "P9e06bKt": {}}, "slotId": "wVhXVbO9", "sourceItemId": "sAVLvRRV", "tags": ["jsvrAJuF", "qcYwyjME", "Ye0irfVR"]}, {"customAttributes": {"wzpAhJTs": {}, "y9Za3FNl": {}, "5DLD88Q9": {}}, "slotId": "mnzRSz1l", "sourceItemId": "GH0SXFVI", "tags": ["Uw3nNU4Q", "QTmRbgpe", "SQYjcXbf"]}]' \
    > test.out 2>&1
eval_tap $? 41 'PublicBulkUpdateMyItems' test.out

#- 42 PublicBulkRemoveMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicBulkRemoveMyItems \
    --inventoryId 'ZzVDRkOu' \
    --namespace "$AB_NAMESPACE" \
    --body '[{"slotId": "tmb3kEQq", "sourceItemId": "iWIvxnVg"}, {"slotId": "o3KWNsnJ", "sourceItemId": "u7BNCqQn"}, {"slotId": "eM2bJxtN", "sourceItemId": "RLnt1N0X"}]' \
    > test.out 2>&1
eval_tap $? 42 'PublicBulkRemoveMyItems' test.out

#- 43 PublicMoveMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicMoveMyItems \
    --inventoryId 'M2pK4VJn' \
    --namespace "$AB_NAMESPACE" \
    --body '{"items": [{"qty": 22, "slotId": "rLqYB6Or", "sourceItemId": "HKjbAMCT"}, {"qty": 64, "slotId": "cVbu5xwE", "sourceItemId": "Q1HWNKI5"}, {"qty": 7, "slotId": "79j47v7Q", "sourceItemId": "h891pJlY"}], "srcInventoryId": "JUqyCbyZ"}' \
    > test.out 2>&1
eval_tap $? 43 'PublicMoveMyItems' test.out

#- 44 PublicGetItem
./ng net.accelbyte.sdk.cli.Main inventory publicGetItem \
    --inventoryId 'pG5tck0w' \
    --namespace "$AB_NAMESPACE" \
    --slotId 'oCrGk40G' \
    --sourceItemId 'tTyAUiJg' \
    > test.out 2>&1
eval_tap $? 44 'PublicGetItem' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
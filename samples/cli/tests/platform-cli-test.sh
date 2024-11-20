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
echo "1..481"

#- 1 Login
./ng net.accelbyte.sdk.cli.Main loginClient \
    > test.out 2>&1
eval_tap $? 1 'Login' test.out

if [ $EXIT_CODE -ne 0 ]; then
  echo "Bail out! Login failed."
  exit $EXIT_CODE
fi

touch "tmp.dat"

#- 2 ListFulfillmentScripts
./ng net.accelbyte.sdk.cli.Main platform listFulfillmentScripts \
    > test.out 2>&1
eval_tap $? 2 'ListFulfillmentScripts' test.out

#- 3 GetFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform getFulfillmentScript \
    --id 'E139tQsF' \
    > test.out 2>&1
eval_tap $? 3 'GetFulfillmentScript' test.out

#- 4 CreateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform createFulfillmentScript \
    --id '5yCLzbmm' \
    --body '{"grantDays": "j38WdlbF"}' \
    > test.out 2>&1
eval_tap $? 4 'CreateFulfillmentScript' test.out

#- 5 DeleteFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform deleteFulfillmentScript \
    --id 'dkZHVpPY' \
    > test.out 2>&1
eval_tap $? 5 'DeleteFulfillmentScript' test.out

#- 6 UpdateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform updateFulfillmentScript \
    --id 'ri4q5Lr7' \
    --body '{"grantDays": "c8bUKugB"}' \
    > test.out 2>&1
eval_tap $? 6 'UpdateFulfillmentScript' test.out

#- 7 ListItemTypeConfigs
./ng net.accelbyte.sdk.cli.Main platform listItemTypeConfigs \
    > test.out 2>&1
eval_tap $? 7 'ListItemTypeConfigs' test.out

#- 8 CreateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform createItemTypeConfig \
    --body '{"clazz": "Vnd2tl4V", "dryRun": true, "fulfillmentUrl": "2FFustwE", "itemType": "COINS", "purchaseConditionUrl": "hsFiRVFw"}' \
    > test.out 2>&1
eval_tap $? 8 'CreateItemTypeConfig' test.out

#- 9 SearchItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform searchItemTypeConfig \
    --clazz 'zHxIyosp' \
    --itemType 'CODE' \
    > test.out 2>&1
eval_tap $? 9 'SearchItemTypeConfig' test.out

#- 10 GetItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform getItemTypeConfig \
    --id '3gOjOopx' \
    > test.out 2>&1
eval_tap $? 10 'GetItemTypeConfig' test.out

#- 11 UpdateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform updateItemTypeConfig \
    --id 'vicmGdAP' \
    --body '{"clazz": "r2pd8BWR", "dryRun": false, "fulfillmentUrl": "VV0gqocy", "purchaseConditionUrl": "wU1YJOYA"}' \
    > test.out 2>&1
eval_tap $? 11 'UpdateItemTypeConfig' test.out

#- 12 DeleteItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform deleteItemTypeConfig \
    --id '5zX4W8Wh' \
    > test.out 2>&1
eval_tap $? 12 'DeleteItemTypeConfig' test.out

#- 13 QueryCampaigns
./ng net.accelbyte.sdk.cli.Main platform queryCampaigns \
    --namespace "$AB_NAMESPACE" \
    --limit '82' \
    --name 'lApEtVS6' \
    --offset '70' \
    --tag 'lGICIKjC' \
    > test.out 2>&1
eval_tap $? 13 'QueryCampaigns' test.out

#- 14 CreateCampaign
./ng net.accelbyte.sdk.cli.Main platform createCampaign \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "b0T44V9w", "discountConfig": {"categories": [{"categoryPath": "MApQjkEC", "includeSubCategories": false}, {"categoryPath": "ePypsWXY", "includeSubCategories": true}, {"categoryPath": "xu8gAx8Q", "includeSubCategories": false}], "currencyCode": "UyTNU7xW", "currencyNamespace": "6vV5iZlA", "discountAmount": 53, "discountPercentage": 79, "discountType": "AMOUNT", "items": [{"itemId": "UbpFzjKv", "itemName": "wzFDZSO3"}, {"itemId": "kSLO3kvf", "itemName": "Xzu7z1Sf"}, {"itemId": "FGKNDSt6", "itemName": "SJaZIFL4"}], "restrictType": "ITEMS_AND_CATEGORIES", "stackable": false}, "items": [{"extraSubscriptionDays": 89, "itemId": "yUTjtxJP", "itemName": "O8r9w9dd", "quantity": 70}, {"extraSubscriptionDays": 60, "itemId": "bd9QXPJ1", "itemName": "H6p4rZVd", "quantity": 47}, {"extraSubscriptionDays": 26, "itemId": "FII7xszf", "itemName": "rs423V5Q", "quantity": 5}], "maxRedeemCountPerCampaignPerUser": 86, "maxRedeemCountPerCode": 42, "maxRedeemCountPerCodePerUser": 36, "maxSaleCount": 73, "name": "3n3tUsRU", "redeemEnd": "1972-11-25T00:00:00Z", "redeemStart": "1985-08-16T00:00:00Z", "redeemType": "DISCOUNT", "status": "ACTIVE", "tags": ["QeSuDnkF", "YU1uztci", "agnHBLVN"], "type": "REDEMPTION"}' \
    > test.out 2>&1
eval_tap $? 14 'CreateCampaign' test.out

#- 15 GetCampaign
./ng net.accelbyte.sdk.cli.Main platform getCampaign \
    --campaignId '7mlWGtL6' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'GetCampaign' test.out

#- 16 UpdateCampaign
./ng net.accelbyte.sdk.cli.Main platform updateCampaign \
    --campaignId 'qrqJeMIL' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "Nw4I5Zjw", "discountConfig": {"categories": [{"categoryPath": "SreYzGnG", "includeSubCategories": false}, {"categoryPath": "pT1WisnU", "includeSubCategories": true}, {"categoryPath": "NsYs5Dz1", "includeSubCategories": false}], "currencyCode": "SvK0P2e9", "currencyNamespace": "iPECCa0f", "discountAmount": 40, "discountPercentage": 65, "discountType": "PERCENTAGE", "items": [{"itemId": "l9aikFXK", "itemName": "anAWa746"}, {"itemId": "IX2zLCWq", "itemName": "PKG6mJsR"}, {"itemId": "FPKUNK6T", "itemName": "x73ojKwk"}], "restrictType": "ITEMS_AND_CATEGORIES", "stackable": false}, "items": [{"extraSubscriptionDays": 0, "itemId": "d0PxC72c", "itemName": "kkmjxOcc", "quantity": 22}, {"extraSubscriptionDays": 21, "itemId": "5FHRktFl", "itemName": "wUWFihIH", "quantity": 8}, {"extraSubscriptionDays": 0, "itemId": "iwF4E1uS", "itemName": "9ouNrd3V", "quantity": 59}], "maxRedeemCountPerCampaignPerUser": 70, "maxRedeemCountPerCode": 79, "maxRedeemCountPerCodePerUser": 9, "maxSaleCount": 16, "name": "9BQDLC8F", "redeemEnd": "1989-11-01T00:00:00Z", "redeemStart": "1995-10-09T00:00:00Z", "redeemType": "DISCOUNT", "status": "ACTIVE", "tags": ["86RAUztl", "5ITCx2XS", "Sb7vyaO0"]}' \
    > test.out 2>&1
eval_tap $? 16 'UpdateCampaign' test.out

#- 17 RenameBatch
./ng net.accelbyte.sdk.cli.Main platform renameBatch \
    --campaignId 'LP6rJMag' \
    --namespace "$AB_NAMESPACE" \
    --body '{"newName": "TkM285cZ", "oldName": "HCSFpSgw"}' \
    > test.out 2>&1
eval_tap $? 17 'RenameBatch' test.out

#- 18 QueryCampaignBatchNames
./ng net.accelbyte.sdk.cli.Main platform queryCampaignBatchNames \
    --campaignId '8paafvTp' \
    --namespace "$AB_NAMESPACE" \
    --batchName 'RLlxAHeb' \
    --limit '54' \
    > test.out 2>&1
eval_tap $? 18 'QueryCampaignBatchNames' test.out

#- 19 GetCampaignDynamic
./ng net.accelbyte.sdk.cli.Main platform getCampaignDynamic \
    --campaignId 'sjADm6iG' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 19 'GetCampaignDynamic' test.out

#- 20 GetCatalogConfig
./ng net.accelbyte.sdk.cli.Main platform getCatalogConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'GetCatalogConfig' test.out

#- 21 UpdateCatalogConfig
./ng net.accelbyte.sdk.cli.Main platform updateCatalogConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"enableInventoryCheck": false}' \
    > test.out 2>&1
eval_tap $? 21 'UpdateCatalogConfig' test.out

#- 22 GetLootBoxPluginConfig
./ng net.accelbyte.sdk.cli.Main platform getLootBoxPluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'GetLootBoxPluginConfig' test.out

#- 23 UpdateLootBoxPluginConfig
./ng net.accelbyte.sdk.cli.Main platform updateLootBoxPluginConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appConfig": {"appName": "fCpyAxAl"}, "customConfig": {"connectionType": "TLS", "grpcServerAddress": "d0Y3AZ3z"}, "extendType": "APP"}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateLootBoxPluginConfig' test.out

#- 24 DeleteLootBoxPluginConfig
./ng net.accelbyte.sdk.cli.Main platform deleteLootBoxPluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'DeleteLootBoxPluginConfig' test.out

#- 25 UplodLootBoxPluginConfigCert
./ng net.accelbyte.sdk.cli.Main platform uplodLootBoxPluginConfigCert \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 25 'UplodLootBoxPluginConfigCert' test.out

#- 26 GetLootBoxGrpcInfo
./ng net.accelbyte.sdk.cli.Main platform getLootBoxGrpcInfo \
    --namespace "$AB_NAMESPACE" \
    --force  \
    > test.out 2>&1
eval_tap $? 26 'GetLootBoxGrpcInfo' test.out

#- 27 GetSectionPluginConfig
./ng net.accelbyte.sdk.cli.Main platform getSectionPluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'GetSectionPluginConfig' test.out

#- 28 UpdateSectionPluginConfig
./ng net.accelbyte.sdk.cli.Main platform updateSectionPluginConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appConfig": {"appName": "M36bHX4M"}, "customConfig": {"connectionType": "INSECURE", "grpcServerAddress": "wKVgstUQ"}, "extendType": "CUSTOM"}' \
    > test.out 2>&1
eval_tap $? 28 'UpdateSectionPluginConfig' test.out

#- 29 DeleteSectionPluginConfig
./ng net.accelbyte.sdk.cli.Main platform deleteSectionPluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'DeleteSectionPluginConfig' test.out

#- 30 UploadSectionPluginConfigCert
./ng net.accelbyte.sdk.cli.Main platform uploadSectionPluginConfigCert \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 30 'UploadSectionPluginConfigCert' test.out

#- 31 GetRootCategories
./ng net.accelbyte.sdk.cli.Main platform getRootCategories \
    --namespace "$AB_NAMESPACE" \
    --storeId 'CpWiAEjZ' \
    > test.out 2>&1
eval_tap $? 31 'GetRootCategories' test.out

#- 32 CreateCategory
./ng net.accelbyte.sdk.cli.Main platform createCategory \
    --namespace "$AB_NAMESPACE" \
    --storeId '1Al6BpnJ' \
    --body '{"categoryPath": "GEUhpUI5", "localizationDisplayNames": {"le9Yb4MQ": "MZJHVFia", "P17aLRuP": "NuE6WnGB", "JhxqqUw0": "JJY2nXFb"}}' \
    > test.out 2>&1
eval_tap $? 32 'CreateCategory' test.out

#- 33 ListCategoriesBasic
./ng net.accelbyte.sdk.cli.Main platform listCategoriesBasic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Ly40UXxl' \
    > test.out 2>&1
eval_tap $? 33 'ListCategoriesBasic' test.out

#- 34 GetCategory
./ng net.accelbyte.sdk.cli.Main platform getCategory \
    --categoryPath 'QYiNTyho' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'SxIByI0b' \
    > test.out 2>&1
eval_tap $? 34 'GetCategory' test.out

#- 35 UpdateCategory
./ng net.accelbyte.sdk.cli.Main platform updateCategory \
    --categoryPath 'KSEWXA2S' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'tOgOMEy4' \
    --body '{"localizationDisplayNames": {"yfJH5eVe": "w8BVqR2Z", "XrKMfRII": "BMCci8Bn", "n9S5YXGb": "o2CUkMO1"}}' \
    > test.out 2>&1
eval_tap $? 35 'UpdateCategory' test.out

#- 36 DeleteCategory
./ng net.accelbyte.sdk.cli.Main platform deleteCategory \
    --categoryPath 'wZZMMTGc' \
    --namespace "$AB_NAMESPACE" \
    --storeId '7cGO9kT6' \
    > test.out 2>&1
eval_tap $? 36 'DeleteCategory' test.out

#- 37 GetChildCategories
./ng net.accelbyte.sdk.cli.Main platform getChildCategories \
    --categoryPath 'u2vmzHeI' \
    --namespace "$AB_NAMESPACE" \
    --storeId '2phkGNi0' \
    > test.out 2>&1
eval_tap $? 37 'GetChildCategories' test.out

#- 38 GetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform getDescendantCategories \
    --categoryPath '7p3L43sn' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'vU2ExUFb' \
    > test.out 2>&1
eval_tap $? 38 'GetDescendantCategories' test.out

#- 39 QueryCodes
./ng net.accelbyte.sdk.cli.Main platform queryCodes \
    --campaignId 'I6zCX3s6' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --batchName 'XnELb6dQ' \
    --batchNo '51,71,60' \
    --code 'BOCytYW8' \
    --limit '45' \
    --offset '55' \
    --withBatchName  \
    > test.out 2>&1
eval_tap $? 39 'QueryCodes' test.out

#- 40 CreateCodes
./ng net.accelbyte.sdk.cli.Main platform createCodes \
    --campaignId '88ULwdQS' \
    --namespace "$AB_NAMESPACE" \
    --body '{"batchName": "wMJqO2k5", "codeValue": "AHtaQu8j", "quantity": 58}' \
    > test.out 2>&1
eval_tap $? 40 'CreateCodes' test.out

#- 41 Download
./ng net.accelbyte.sdk.cli.Main platform download \
    --campaignId '1ChRAN4H' \
    --namespace "$AB_NAMESPACE" \
    --batchName 'mfUEoOpO' \
    --batchNo '34,54,74' \
    --withBatchName  \
    > test.out 2>&1
eval_tap $? 41 'Download' test.out

#- 42 BulkDisableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkDisableCodes \
    --campaignId 'uy1QZuOR' \
    --namespace "$AB_NAMESPACE" \
    --batchName 'Kwe3cHTd' \
    --batchNo '77,30,14' \
    > test.out 2>&1
eval_tap $? 42 'BulkDisableCodes' test.out

#- 43 BulkEnableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkEnableCodes \
    --campaignId '7wAlTt60' \
    --namespace "$AB_NAMESPACE" \
    --batchName 'OAH9mfCq' \
    --batchNo '93,96,93' \
    > test.out 2>&1
eval_tap $? 43 'BulkEnableCodes' test.out

#- 44 QueryRedeemHistory
./ng net.accelbyte.sdk.cli.Main platform queryRedeemHistory \
    --campaignId 'EYNh9ede' \
    --namespace "$AB_NAMESPACE" \
    --code 'WDww4Iqd' \
    --limit '14' \
    --offset '56' \
    --userId 'fZLKS7sD' \
    > test.out 2>&1
eval_tap $? 44 'QueryRedeemHistory' test.out

#- 45 GetCode
./ng net.accelbyte.sdk.cli.Main platform getCode \
    --code '4bWMBC7R' \
    --namespace "$AB_NAMESPACE" \
    --redeemable  \
    --withBatchName  \
    > test.out 2>&1
eval_tap $? 45 'GetCode' test.out

#- 46 DisableCode
./ng net.accelbyte.sdk.cli.Main platform disableCode \
    --code 'GDM98sKU' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 46 'DisableCode' test.out

#- 47 EnableCode
./ng net.accelbyte.sdk.cli.Main platform enableCode \
    --code 'fYRfrMxD' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 47 'EnableCode' test.out

#- 48 GetServicePluginConfig
eval_tap 0 48 'GetServicePluginConfig # SKIP deprecated' test.out

#- 49 UpdateServicePluginConfig
eval_tap 0 49 'UpdateServicePluginConfig # SKIP deprecated' test.out

#- 50 DeleteServicePluginConfig
eval_tap 0 50 'DeleteServicePluginConfig # SKIP deprecated' test.out

#- 51 ListCurrencies
./ng net.accelbyte.sdk.cli.Main platform listCurrencies \
    --namespace "$AB_NAMESPACE" \
    --currencyType 'VIRTUAL' \
    > test.out 2>&1
eval_tap $? 51 'ListCurrencies' test.out

#- 52 CreateCurrency
./ng net.accelbyte.sdk.cli.Main platform createCurrency \
    --namespace "$AB_NAMESPACE" \
    --body '{"currencyCode": "jocdy0ox", "currencySymbol": "PFXazVCj", "currencyType": "REAL", "decimals": 15, "localizationDescriptions": {"SgiJ4WlG": "qzBnVmnl", "GMvHsMt0": "9hhfD1Zh", "XNFT4zRX": "zIAOERke"}}' \
    > test.out 2>&1
eval_tap $? 52 'CreateCurrency' test.out

#- 53 UpdateCurrency
./ng net.accelbyte.sdk.cli.Main platform updateCurrency \
    --currencyCode 'ZAS267EC' \
    --namespace "$AB_NAMESPACE" \
    --body '{"localizationDescriptions": {"6bZlVp2F": "m6wl7Yy0", "gFfFOdh1": "Q9AnULFz", "QFa2jfE4": "DwftI1Xi"}}' \
    > test.out 2>&1
eval_tap $? 53 'UpdateCurrency' test.out

#- 54 DeleteCurrency
./ng net.accelbyte.sdk.cli.Main platform deleteCurrency \
    --currencyCode 'ncdZ2YUN' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 54 'DeleteCurrency' test.out

#- 55 GetCurrencyConfig
./ng net.accelbyte.sdk.cli.Main platform getCurrencyConfig \
    --currencyCode 'ZA3eVwPC' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 55 'GetCurrencyConfig' test.out

#- 56 GetCurrencySummary
./ng net.accelbyte.sdk.cli.Main platform getCurrencySummary \
    --currencyCode 'VN8u79Ss' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 56 'GetCurrencySummary' test.out

#- 57 GetDLCItemConfig
./ng net.accelbyte.sdk.cli.Main platform getDLCItemConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 57 'GetDLCItemConfig' test.out

#- 58 UpdateDLCItemConfig
./ng net.accelbyte.sdk.cli.Main platform updateDLCItemConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"id": "g2TmJ9vq", "rewards": [{"currency": {"currencyCode": "B9mxXoiA", "namespace": "Yhuakav9"}, "item": {"itemId": "VNzudP0f", "itemName": "pjUZjn9Y", "itemSku": "3xo5nDak", "itemType": "nHHXYrVa"}, "quantity": 55, "type": "CURRENCY"}, {"currency": {"currencyCode": "ggR3xRlg", "namespace": "1P9J4kmI"}, "item": {"itemId": "3CIXLFjg", "itemName": "ABfOVgAp", "itemSku": "Dh2vYmG4", "itemType": "crMmTmI9"}, "quantity": 58, "type": "CURRENCY"}, {"currency": {"currencyCode": "0KmOh8aP", "namespace": "UYFwMKGr"}, "item": {"itemId": "rpVCKn9x", "itemName": "0zjPDo6x", "itemSku": "jAKWnqdJ", "itemType": "CfmgY6Kn"}, "quantity": 71, "type": "ITEM"}]}, {"id": "BjL1EkgA", "rewards": [{"currency": {"currencyCode": "1DvoNb6t", "namespace": "yOVsbJnQ"}, "item": {"itemId": "2iN9cMff", "itemName": "ExiMo8Yp", "itemSku": "Rak9LTBR", "itemType": "GfWJt92U"}, "quantity": 89, "type": "CURRENCY"}, {"currency": {"currencyCode": "FcwJ7H6E", "namespace": "WG9o7UZI"}, "item": {"itemId": "xDmSCea4", "itemName": "tzDjtRbk", "itemSku": "ZIBgPh1v", "itemType": "GNQw6o7w"}, "quantity": 66, "type": "ITEM"}, {"currency": {"currencyCode": "CNTBXIa7", "namespace": "XvqP0GmQ"}, "item": {"itemId": "HMi7fegw", "itemName": "daaAJUAh", "itemSku": "8LVd9j9l", "itemType": "t3euMPEZ"}, "quantity": 54, "type": "ITEM"}]}, {"id": "pqpXEnnx", "rewards": [{"currency": {"currencyCode": "sURnTLPI", "namespace": "rBCV1tJ5"}, "item": {"itemId": "XJOzfxer", "itemName": "gBEOEtIV", "itemSku": "kt7o6i4R", "itemType": "PR5zsc4Q"}, "quantity": 88, "type": "CURRENCY"}, {"currency": {"currencyCode": "iPDXyK1V", "namespace": "XFX6f0Oj"}, "item": {"itemId": "UMiVESuc", "itemName": "gBL0bJTt", "itemSku": "2BTn7HEv", "itemType": "S555bFqo"}, "quantity": 99, "type": "CURRENCY"}, {"currency": {"currencyCode": "MrY3ipcr", "namespace": "DsEWoHEQ"}, "item": {"itemId": "LU5qOTF6", "itemName": "21DSbb1o", "itemSku": "NGyOYoiD", "itemType": "UDQsCRrx"}, "quantity": 13, "type": "CURRENCY"}]}]}' \
    > test.out 2>&1
eval_tap $? 58 'UpdateDLCItemConfig' test.out

#- 59 DeleteDLCItemConfig
./ng net.accelbyte.sdk.cli.Main platform deleteDLCItemConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 59 'DeleteDLCItemConfig' test.out

#- 60 GetPlatformDLCConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformDLCConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 60 'GetPlatformDLCConfig' test.out

#- 61 UpdatePlatformDLCConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformDLCConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"platform": "STEAM", "platformDlcIdMap": {"qvM6ns4F": "jpu0w5sh", "7tVq0AMT": "yvAscPDa", "PbZEVKBu": "kvFfF8cA"}}, {"platform": "EPICGAMES", "platformDlcIdMap": {"aDV8WDJX": "995U7Ik2", "tOUy7JmF": "xDHj7tet", "WV4E6iAZ": "c3fQzL78"}}, {"platform": "XBOX", "platformDlcIdMap": {"Hvmg9kbf": "y6bR0sDE", "tETrJtOD": "HDFuI9Ni", "UzRklT0E": "XCadkVb3"}}]}' \
    > test.out 2>&1
eval_tap $? 61 'UpdatePlatformDLCConfig' test.out

#- 62 DeletePlatformDLCConfig
./ng net.accelbyte.sdk.cli.Main platform deletePlatformDLCConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 62 'DeletePlatformDLCConfig' test.out

#- 63 QueryEntitlements1
./ng net.accelbyte.sdk.cli.Main platform queryEntitlements1 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --appType 'DLC' \
    --entitlementClazz 'ENTITLEMENT' \
    --entitlementName 'i3ep6OHT' \
    --itemId 'FyZqM2a6,Z6M8stQS,2AMwz1rT' \
    --limit '90' \
    --offset '33' \
    --origin 'Nintendo' \
    --userId 'FmtVgfBw' \
    > test.out 2>&1
eval_tap $? 63 'QueryEntitlements1' test.out

#- 64 QueryEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryEntitlements \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemIds 'kgUOESkl,utpkOLDi,QN5cexy7' \
    --limit '7' \
    --offset '21' \
    > test.out 2>&1
eval_tap $? 64 'QueryEntitlements' test.out

#- 65 EnableEntitlementOriginFeature
./ng net.accelbyte.sdk.cli.Main platform enableEntitlementOriginFeature \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 65 'EnableEntitlementOriginFeature' test.out

#- 66 GetEntitlementConfigInfo
./ng net.accelbyte.sdk.cli.Main platform getEntitlementConfigInfo \
    --namespace "$AB_NAMESPACE" \
    --withoutCache  \
    > test.out 2>&1
eval_tap $? 66 'GetEntitlementConfigInfo' test.out

#- 67 GrantEntitlements
./ng net.accelbyte.sdk.cli.Main platform grantEntitlements \
    --namespace "$AB_NAMESPACE" \
    --body '{"entitlementGrantList": [{"collectionId": "hJvmLQPC", "endDate": "1978-07-29T00:00:00Z", "grantedCode": "9Po6u90Q", "itemId": "ihWr5gFG", "itemNamespace": "kn8UTBhq", "language": "nn-dpcl-Bl", "metadata": {"yUB55T1R": {}, "9Wtf9ogE": {}, "HUGevdGV": {}}, "origin": "Twitch", "quantity": 43, "region": "qllOCfqv", "source": "PURCHASE", "startDate": "1992-05-15T00:00:00Z", "storeId": "mOfjgv2L"}, {"collectionId": "DsaQjNCE", "endDate": "1989-01-22T00:00:00Z", "grantedCode": "Q9D0G2kn", "itemId": "keu5Cc1f", "itemNamespace": "l6t32Gmk", "language": "ktp_MPTr", "metadata": {"dXhdcmMb": {}, "JY8JDb9Z": {}, "5Ugaovik": {}}, "origin": "Other", "quantity": 80, "region": "XsfHuLPZ", "source": "ACHIEVEMENT", "startDate": "1984-08-22T00:00:00Z", "storeId": "uncjqGmD"}, {"collectionId": "DlCg7VIX", "endDate": "1980-02-01T00:00:00Z", "grantedCode": "Tox2mOH2", "itemId": "hPgmYeCL", "itemNamespace": "gNOCqT7r", "language": "RqP-XUBN-576", "metadata": {"APwho1WS": {}, "QRjdYOCf": {}, "rf0M4vlI": {}}, "origin": "Twitch", "quantity": 76, "region": "BOAS0ADl", "source": "PROMOTION", "startDate": "1986-01-15T00:00:00Z", "storeId": "Ji8tEoJQ"}], "userIds": ["7MuE80Vy", "9YfoVZGD", "IAxZNTps"]}' \
    > test.out 2>&1
eval_tap $? 67 'GrantEntitlements' test.out

#- 68 RevokeEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeEntitlements \
    --namespace "$AB_NAMESPACE" \
    --body '["enMZ9g8j", "yTG1qoBK", "R9heOz8j"]' \
    > test.out 2>&1
eval_tap $? 68 'RevokeEntitlements' test.out

#- 69 GetEntitlement
./ng net.accelbyte.sdk.cli.Main platform getEntitlement \
    --entitlementId 'kfTLdJ5w' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 69 'GetEntitlement' test.out

#- 70 QueryFulfillmentHistories
./ng net.accelbyte.sdk.cli.Main platform queryFulfillmentHistories \
    --namespace "$AB_NAMESPACE" \
    --limit '98' \
    --offset '79' \
    --status 'SUCCESS' \
    --userId 'w5NjnuXr' \
    > test.out 2>&1
eval_tap $? 70 'QueryFulfillmentHistories' test.out

#- 71 QueryIAPClawbackHistory
./ng net.accelbyte.sdk.cli.Main platform queryIAPClawbackHistory \
    --namespace "$AB_NAMESPACE" \
    --endTime 'kKf3Hp6u' \
    --eventType 'REVOKED' \
    --externalOrderId 'uifTuxDQ' \
    --limit '0' \
    --offset '23' \
    --startTime '1IYtG5Oq' \
    --status 'SUCCESS' \
    --userId 'RE5UPiTe' \
    > test.out 2>&1
eval_tap $? 71 'QueryIAPClawbackHistory' test.out

#- 72 MockPlayStationStreamEvent
./ng net.accelbyte.sdk.cli.Main platform mockPlayStationStreamEvent \
    --namespace "$AB_NAMESPACE" \
    --body '{"body": {"account": "xprAFWk5", "additionalData": {"entitlement": [{"clientTransaction": [{"amountConsumed": 36, "clientTransactionId": "y7TwReaM"}, {"amountConsumed": 68, "clientTransactionId": "Wygww2Yp"}, {"amountConsumed": 8, "clientTransactionId": "z36rW98Y"}], "entitlementId": "QK5zOyaf", "usageCount": 22}, {"clientTransaction": [{"amountConsumed": 40, "clientTransactionId": "2oXeAx2s"}, {"amountConsumed": 40, "clientTransactionId": "bnGveTFA"}, {"amountConsumed": 63, "clientTransactionId": "6YI4Qxpa"}], "entitlementId": "TgLjlMes", "usageCount": 47}, {"clientTransaction": [{"amountConsumed": 67, "clientTransactionId": "jrTI78W2"}, {"amountConsumed": 33, "clientTransactionId": "ERteS8ZD"}, {"amountConsumed": 55, "clientTransactionId": "dKj3upqu"}], "entitlementId": "UaexZAvP", "usageCount": 65}], "purpose": "8CQ5rcOg"}, "originalTitleName": "SO6SuGeb", "paymentProductSKU": "R864n4FY", "purchaseDate": "AFwiQEYn", "sourceOrderItemId": "1GiuNXCl", "titleName": "aYZDOuov"}, "eventDomain": "ooxdIA4w", "eventSource": "uddFpGv0", "eventType": "CsSv4t1Q", "eventVersion": 39, "id": "UOFmQ9h7", "timestamp": "2c0ZRQfZ"}' \
    > test.out 2>&1
eval_tap $? 72 'MockPlayStationStreamEvent' test.out

#- 73 MockXblClawbackEvent
./ng net.accelbyte.sdk.cli.Main platform mockXblClawbackEvent \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": {"eventDate": "g9AcKEaF", "eventState": "Uakf6QM8", "lineItemId": "WPO16cSP", "orderId": "KnF7flFX", "productId": "eTEetHwN", "productType": "BZchMRJt", "purchasedDate": "noRTvNEl", "sandboxId": "asxLQQL6", "skuId": "MjDLo5PC", "subscriptionData": {"consumedDurationInDays": 54, "dateTime": "sQ0VLlr1", "durationInDays": 29, "recurrenceId": "fmJfRviE"}}, "datacontenttype": "pc1H5J7Z", "id": "FN6fC1Pq", "source": "L06Lu0RJ", "specVersion": "s1XMjmPU", "subject": "YZxhCMO6", "time": "it01aqnh", "traceparent": "dOGElfet", "type": "6dOF1jIb"}' \
    > test.out 2>&1
eval_tap $? 73 'MockXblClawbackEvent' test.out

#- 74 GetAppleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getAppleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 74 'GetAppleIAPConfig' test.out

#- 75 UpdateAppleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateAppleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appAppleId": 96, "bundleId": "OlsCvyI2", "issuerId": "Pl2FuuSd", "keyId": "0L3t5Y7c", "password": "I3bSkKTu", "version": "V2"}' \
    > test.out 2>&1
eval_tap $? 75 'UpdateAppleIAPConfig' test.out

#- 76 DeleteAppleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteAppleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 76 'DeleteAppleIAPConfig' test.out

#- 77 UpdateAppleP8File
./ng net.accelbyte.sdk.cli.Main platform updateAppleP8File \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 77 'UpdateAppleP8File' test.out

#- 78 GetEpicGamesIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getEpicGamesIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 78 'GetEpicGamesIAPConfig' test.out

#- 79 UpdateEpicGamesIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateEpicGamesIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"sandboxId": "IOkMqm9Y"}' \
    > test.out 2>&1
eval_tap $? 79 'UpdateEpicGamesIAPConfig' test.out

#- 80 DeleteEpicGamesIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteEpicGamesIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 80 'DeleteEpicGamesIAPConfig' test.out

#- 81 GetGoogleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getGoogleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 81 'GetGoogleIAPConfig' test.out

#- 82 UpdateGoogleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateGoogleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"applicationName": "PDClS3YR", "notificationTokenAudience": "gEjQXXXP", "notificationTokenEmail": "b2jmMh5C", "packageName": "Sa8g2gDr", "serviceAccountId": "0Gzw7BGr"}' \
    > test.out 2>&1
eval_tap $? 82 'UpdateGoogleIAPConfig' test.out

#- 83 DeleteGoogleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteGoogleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 83 'DeleteGoogleIAPConfig' test.out

#- 84 UpdateGoogleP12File
./ng net.accelbyte.sdk.cli.Main platform updateGoogleP12File \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 84 'UpdateGoogleP12File' test.out

#- 85 GetIAPItemConfig
./ng net.accelbyte.sdk.cli.Main platform getIAPItemConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 85 'GetIAPItemConfig' test.out

#- 86 UpdateIAPItemConfig
./ng net.accelbyte.sdk.cli.Main platform updateIAPItemConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"itemIdentity": "HnOSjwni", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"k6MxoWTU": "D2u1o5KF", "ktgnJTJI": "jpc8OIaI", "yYgmptbR": "Qjfc5Xa6"}}, {"itemIdentity": "NMtAkeH3", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"rMKO5VZc": "jYJ2itGw", "6yHlVXar": "kazRhBqm", "qMtP4Ys4": "CvLkxA7p"}}, {"itemIdentity": "hvA74KoW", "itemIdentityType": "ITEM_ID", "platformProductIdMap": {"avULPFUr": "LVsU5dS1", "tM0A59BX": "tCL9bcMQ", "0sjDbwcb": "O7M0hi4m"}}]}' \
    > test.out 2>&1
eval_tap $? 86 'UpdateIAPItemConfig' test.out

#- 87 DeleteIAPItemConfig
./ng net.accelbyte.sdk.cli.Main platform deleteIAPItemConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 87 'DeleteIAPItemConfig' test.out

#- 88 GetOculusIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getOculusIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 88 'GetOculusIAPConfig' test.out

#- 89 UpdateOculusIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateOculusIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appId": "HOdUURax", "appSecret": "6XKpT8yD"}' \
    > test.out 2>&1
eval_tap $? 89 'UpdateOculusIAPConfig' test.out

#- 90 DeleteOculusIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteOculusIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 90 'DeleteOculusIAPConfig' test.out

#- 91 GetPlayStationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getPlayStationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 91 'GetPlayStationIAPConfig' test.out

#- 92 UpdatePlaystationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlaystationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"backOfficeServerClientId": "7ZvzpCSH", "backOfficeServerClientSecret": "IeKMl4kN", "enableStreamJob": true, "environment": "yES88T9u", "streamName": "zQVGHsbS", "streamPartnerName": "ozsBbLJH"}' \
    > test.out 2>&1
eval_tap $? 92 'UpdatePlaystationIAPConfig' test.out

#- 93 DeletePlaystationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deletePlaystationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 93 'DeletePlaystationIAPConfig' test.out

#- 94 ValidateExistedPlaystationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform validateExistedPlaystationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 94 'ValidateExistedPlaystationIAPConfig' test.out

#- 95 ValidatePlaystationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform validatePlaystationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"backOfficeServerClientId": "7DFIFK9I", "backOfficeServerClientSecret": "T5ARfMj9", "enableStreamJob": true, "environment": "VbD3KXyy", "streamName": "49GepNt0", "streamPartnerName": "6Tbi98qy"}' \
    > test.out 2>&1
eval_tap $? 95 'ValidatePlaystationIAPConfig' test.out

#- 96 GetSteamIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getSteamIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 96 'GetSteamIAPConfig' test.out

#- 97 UpdateSteamIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateSteamIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appId": "RGZd4nEE", "publisherAuthenticationKey": "UI4Eol9W"}' \
    > test.out 2>&1
eval_tap $? 97 'UpdateSteamIAPConfig' test.out

#- 98 DeleteSteamIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteSteamIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 98 'DeleteSteamIAPConfig' test.out

#- 99 GetTwitchIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getTwitchIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 99 'GetTwitchIAPConfig' test.out

#- 100 UpdateTwitchIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateTwitchIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientId": "esU2Kipk", "clientSecret": "6lGsxXII", "organizationId": "eJ2RXN4A"}' \
    > test.out 2>&1
eval_tap $? 100 'UpdateTwitchIAPConfig' test.out

#- 101 DeleteTwitchIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteTwitchIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 101 'DeleteTwitchIAPConfig' test.out

#- 102 GetXblIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getXblIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 102 'GetXblIAPConfig' test.out

#- 103 UpdateXblIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateXblIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"enableClawback": false, "entraAppClientId": "sHuS8cHq", "entraAppClientSecret": "ZSccW1N0", "entraTenantId": "W3XLerCb", "relyingPartyCert": "87w3Rajh"}' \
    > test.out 2>&1
eval_tap $? 103 'UpdateXblIAPConfig' test.out

#- 104 DeleteXblAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteXblAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 104 'DeleteXblAPConfig' test.out

#- 105 UpdateXblBPCertFile
./ng net.accelbyte.sdk.cli.Main platform updateXblBPCertFile \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    --password '3AQvZ6yX' \
    > test.out 2>&1
eval_tap $? 105 'UpdateXblBPCertFile' test.out

#- 106 QueryThirdPartyNotifications
./ng net.accelbyte.sdk.cli.Main platform queryThirdPartyNotifications \
    --namespace "$AB_NAMESPACE" \
    --endDate '3IgFJMNh' \
    --externalId 'ylBCKBKn' \
    --limit '71' \
    --offset '39' \
    --source 'PLAYSTATION' \
    --startDate 'wCSYpZyx' \
    --status 'ERROR' \
    --type 'xinSHOt0' \
    > test.out 2>&1
eval_tap $? 106 'QueryThirdPartyNotifications' test.out

#- 107 QueryThirdPartySubscription
./ng net.accelbyte.sdk.cli.Main platform queryThirdPartySubscription \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --groupId 'dJpIBwQy' \
    --limit '4' \
    --offset '78' \
    --platform 'STEAM' \
    --productId 'aY6aUdFk' \
    --userId 'JgqzjxAW' \
    > test.out 2>&1
eval_tap $? 107 'QueryThirdPartySubscription' test.out

#- 108 GetIAPOrderConsumeDetails
./ng net.accelbyte.sdk.cli.Main platform getIAPOrderConsumeDetails \
    --iapOrderNo 'TrGZTb6n' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 108 'GetIAPOrderConsumeDetails' test.out

#- 109 DownloadInvoiceDetails
./ng net.accelbyte.sdk.cli.Main platform downloadInvoiceDetails \
    --namespace "$AB_NAMESPACE" \
    --endTime 'TIuOjBml' \
    --feature 'DK5MRooS' \
    --itemId 'MZCVDdz6' \
    --itemType 'LOOTBOX' \
    --startTime 'GdtmGU0Q' \
    > test.out 2>&1
eval_tap $? 109 'DownloadInvoiceDetails' test.out

#- 110 GenerateInvoiceSummary
./ng net.accelbyte.sdk.cli.Main platform generateInvoiceSummary \
    --namespace "$AB_NAMESPACE" \
    --endTime '0nDNT4EZ' \
    --feature 'eQ8TuXf4' \
    --itemId 'ZqxNuG1e' \
    --itemType 'OPTIONBOX' \
    --startTime 'Wovq8knD' \
    > test.out 2>&1
eval_tap $? 110 'GenerateInvoiceSummary' test.out

#- 111 SyncInGameItem
./ng net.accelbyte.sdk.cli.Main platform syncInGameItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'S3DaQaYC' \
    --body '{"categoryPath": "ig7JzQm5", "targetItemId": "kPGiNLgt", "targetNamespace": "WSjqEtau"}' \
    > test.out 2>&1
eval_tap $? 111 'SyncInGameItem' test.out

#- 112 CreateItem
./ng net.accelbyte.sdk.cli.Main platform createItem \
    --namespace "$AB_NAMESPACE" \
    --storeId '3jC32fEZ' \
    --body '{"appId": "oHBIKes5", "appType": "SOFTWARE", "baseAppId": "WrYtyqld", "boothName": "4fawiDCY", "categoryPath": "eJP7p610", "clazz": "boTbtM7Y", "displayOrder": 6, "entitlementType": "DURABLE", "ext": {"hml3rdZC": {}, "tb4cyV8E": {}, "F02gvQ5X": {}}, "features": ["hMiLoX0X", "s7Xvk8Dz", "50AGibX8"], "flexible": false, "images": [{"as": "2Y0f8ELj", "caption": "qo5ZRHHR", "height": 57, "imageUrl": "TGaKwHSO", "smallImageUrl": "YMQBgj9c", "width": 31}, {"as": "IDLojPbQ", "caption": "5WrJfGOG", "height": 15, "imageUrl": "cXZgXvTU", "smallImageUrl": "SUm90zNv", "width": 93}, {"as": "HyFyhjZv", "caption": "owYtz4Dd", "height": 9, "imageUrl": "XgmjKZOr", "smallImageUrl": "iyhEnwn4", "width": 80}], "inventoryConfig": {"customAttributes": {"4jfBkycv": {}, "2FkMPJNn": {}, "KKKksS3I": {}}, "serverCustomAttributes": {"R0P8Llxp": {}, "P6SqD2yU": {}, "Dbp0wxjG": {}}, "slotUsed": 20}, "itemIds": ["tlX5amrC", "m8QbF6Zk", "v6GpAc7o"], "itemQty": {"kPA8azHR": 4, "f2Fieb1A": 21, "Q8kJWC1k": 15}, "itemType": "INGAMEITEM", "listable": false, "localizations": {"azxym0Pq": {"description": "SJJvWIHJ", "localExt": {"fdaamKeo": {}, "ShcLiR1D": {}, "ymXDtUeR": {}}, "longDescription": "9OG7JvoY", "title": "paADBBoy"}, "ZzngDBYs": {"description": "sjOskCT0", "localExt": {"VOrFgvPo": {}, "QFGsqkDb": {}, "CK7xgQU0": {}}, "longDescription": "4M5C1LuE", "title": "rgwiP4PE"}, "zXzOAovT": {"description": "MmFj3HRq", "localExt": {"J2gphj0N": {}, "UHQqCUXF": {}, "Nl1duFWQ": {}}, "longDescription": "kBXRqTKX", "title": "fHivhaho"}}, "lootBoxConfig": {"rewardCount": 93, "rewards": [{"lootBoxItems": [{"count": 33, "duration": 48, "endDate": "1994-04-10T00:00:00Z", "itemId": "MVHcUfjB", "itemSku": "mvYTnXzX", "itemType": "qXwI3JuT"}, {"count": 57, "duration": 92, "endDate": "1973-10-10T00:00:00Z", "itemId": "mH6D5iRE", "itemSku": "qqps14W2", "itemType": "9SZB0YGD"}, {"count": 87, "duration": 23, "endDate": "1986-09-03T00:00:00Z", "itemId": "Jp4QjQRx", "itemSku": "eHoSzBsW", "itemType": "f8rbdi7o"}], "name": "Eq7Xm6GO", "odds": 0.19034711765650592, "type": "PROBABILITY_GROUP", "weight": 61}, {"lootBoxItems": [{"count": 50, "duration": 16, "endDate": "1993-11-18T00:00:00Z", "itemId": "ZqDfdbj2", "itemSku": "mczuZmAt", "itemType": "IwFfRDq2"}, {"count": 48, "duration": 96, "endDate": "1975-12-28T00:00:00Z", "itemId": "hvxg9eiR", "itemSku": "qhYgKR0s", "itemType": "5srr4z1K"}, {"count": 40, "duration": 77, "endDate": "1983-10-23T00:00:00Z", "itemId": "aKTngQwy", "itemSku": "k2DJNibm", "itemType": "LjyXAhGT"}], "name": "JdeqnAF5", "odds": 0.02720551442216035, "type": "REWARD_GROUP", "weight": 50}, {"lootBoxItems": [{"count": 0, "duration": 25, "endDate": "1998-03-11T00:00:00Z", "itemId": "Wm1qSaku", "itemSku": "926wofQ2", "itemType": "t37p5x3H"}, {"count": 32, "duration": 73, "endDate": "1982-08-16T00:00:00Z", "itemId": "H43tkxpR", "itemSku": "9NoNrLep", "itemType": "9ighUB5m"}, {"count": 53, "duration": 26, "endDate": "1971-02-24T00:00:00Z", "itemId": "hpfwocim", "itemSku": "LstrjUqS", "itemType": "5Cu1j8s3"}], "name": "QdX8y9be", "odds": 0.05330218769016937, "type": "REWARD_GROUP", "weight": 79}], "rollFunction": "CUSTOM"}, "maxCount": 72, "maxCountPerUser": 5, "name": "PU2R4YNe", "optionBoxConfig": {"boxItems": [{"count": 31, "duration": 63, "endDate": "1998-11-07T00:00:00Z", "itemId": "JJI0KV2y", "itemSku": "3TJVDFBJ", "itemType": "Qo6BJulF"}, {"count": 69, "duration": 84, "endDate": "1976-12-22T00:00:00Z", "itemId": "9X1Fk2d4", "itemSku": "6PQ8wA4A", "itemType": "I6oEfTQy"}, {"count": 24, "duration": 58, "endDate": "1987-08-21T00:00:00Z", "itemId": "VZ5pwcti", "itemSku": "vjhMJ2QQ", "itemType": "H8TyHKOY"}]}, "purchasable": true, "recurring": {"cycle": "WEEKLY", "fixedFreeDays": 89, "fixedTrialCycles": 60, "graceDays": 82}, "regionData": {"kDk1jpkv": [{"currencyCode": "jagSqdZJ", "currencyNamespace": "Ihkcptab", "currencyType": "VIRTUAL", "discountAmount": 77, "discountExpireAt": "1973-08-05T00:00:00Z", "discountPercentage": 64, "discountPurchaseAt": "1980-07-09T00:00:00Z", "expireAt": "1972-11-03T00:00:00Z", "price": 36, "purchaseAt": "1974-11-11T00:00:00Z", "trialPrice": 88}, {"currencyCode": "RvUgbsBt", "currencyNamespace": "qE67ugbY", "currencyType": "VIRTUAL", "discountAmount": 68, "discountExpireAt": "1978-10-24T00:00:00Z", "discountPercentage": 2, "discountPurchaseAt": "1973-03-30T00:00:00Z", "expireAt": "1996-01-06T00:00:00Z", "price": 5, "purchaseAt": "1978-02-04T00:00:00Z", "trialPrice": 80}, {"currencyCode": "hRgBjQiy", "currencyNamespace": "FGxdHFb7", "currencyType": "REAL", "discountAmount": 32, "discountExpireAt": "1999-11-12T00:00:00Z", "discountPercentage": 20, "discountPurchaseAt": "1976-03-06T00:00:00Z", "expireAt": "1995-10-10T00:00:00Z", "price": 17, "purchaseAt": "1978-02-25T00:00:00Z", "trialPrice": 50}], "pKAJl4bN": [{"currencyCode": "XP6d8SFo", "currencyNamespace": "0aNssQc3", "currencyType": "VIRTUAL", "discountAmount": 11, "discountExpireAt": "1979-04-14T00:00:00Z", "discountPercentage": 29, "discountPurchaseAt": "1994-10-01T00:00:00Z", "expireAt": "1987-04-23T00:00:00Z", "price": 43, "purchaseAt": "1971-05-31T00:00:00Z", "trialPrice": 11}, {"currencyCode": "nVdrXxZg", "currencyNamespace": "z6nuA26A", "currencyType": "REAL", "discountAmount": 42, "discountExpireAt": "1984-08-22T00:00:00Z", "discountPercentage": 12, "discountPurchaseAt": "1995-03-03T00:00:00Z", "expireAt": "1974-05-29T00:00:00Z", "price": 27, "purchaseAt": "1973-11-07T00:00:00Z", "trialPrice": 33}, {"currencyCode": "RYSai4Kh", "currencyNamespace": "jJ46lZOL", "currencyType": "VIRTUAL", "discountAmount": 74, "discountExpireAt": "1993-06-11T00:00:00Z", "discountPercentage": 83, "discountPurchaseAt": "1998-02-23T00:00:00Z", "expireAt": "1972-04-15T00:00:00Z", "price": 62, "purchaseAt": "1974-10-21T00:00:00Z", "trialPrice": 23}], "cYg8ClX2": [{"currencyCode": "385bjYca", "currencyNamespace": "FxBTisSL", "currencyType": "VIRTUAL", "discountAmount": 58, "discountExpireAt": "1982-09-25T00:00:00Z", "discountPercentage": 25, "discountPurchaseAt": "1980-02-07T00:00:00Z", "expireAt": "1997-07-05T00:00:00Z", "price": 98, "purchaseAt": "1979-04-28T00:00:00Z", "trialPrice": 41}, {"currencyCode": "sSaZ3uER", "currencyNamespace": "phfLcodK", "currencyType": "VIRTUAL", "discountAmount": 81, "discountExpireAt": "1989-04-27T00:00:00Z", "discountPercentage": 71, "discountPurchaseAt": "1988-01-22T00:00:00Z", "expireAt": "1986-12-20T00:00:00Z", "price": 27, "purchaseAt": "1977-06-05T00:00:00Z", "trialPrice": 19}, {"currencyCode": "qwaBXaOs", "currencyNamespace": "pfe6T2xw", "currencyType": "REAL", "discountAmount": 31, "discountExpireAt": "1999-02-12T00:00:00Z", "discountPercentage": 44, "discountPurchaseAt": "1995-04-08T00:00:00Z", "expireAt": "1993-07-29T00:00:00Z", "price": 36, "purchaseAt": "1979-11-05T00:00:00Z", "trialPrice": 26}]}, "saleConfig": {"currencyCode": "4bZiC5wS", "price": 1}, "seasonType": "PASS", "sectionExclusive": false, "sellable": true, "sku": "64oIjj3p", "stackable": false, "status": "INACTIVE", "tags": ["O0ZVN1nF", "mW1izHko", "Bt0oilYv"], "targetCurrencyCode": "U7J356TV", "targetNamespace": "DphR7ZpB", "thumbnailUrl": "5TjAtphe", "useCount": 30}' \
    > test.out 2>&1
eval_tap $? 112 'CreateItem' test.out

#- 113 GetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform getItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId '58KAMuln' \
    --appId 'ypLysamZ' \
    > test.out 2>&1
eval_tap $? 113 'GetItemByAppId' test.out

#- 114 QueryItems
./ng net.accelbyte.sdk.cli.Main platform queryItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --appType 'DEMO' \
    --availableDate 'wcDP2emk' \
    --baseAppId 'znhhjFwr' \
    --categoryPath 'i7smu9SJ' \
    --features 'DOJCNGoA' \
    --includeSubCategoryItem  \
    --itemType 'CODE' \
    --limit '67' \
    --offset '10' \
    --region 'QTxi2ToB' \
    --sortBy 'displayOrder:desc,createdAt:asc,updatedAt:desc' \
    --storeId 'YbnQCqlE' \
    --tags 'pF7XxTWx' \
    --targetNamespace 'kP6iABmn' \
    > test.out 2>&1
eval_tap $? 114 'QueryItems' test.out

#- 115 ListBasicItemsByFeatures
./ng net.accelbyte.sdk.cli.Main platform listBasicItemsByFeatures \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --features 'vrz6mziM,h21iIFDQ,zwUTCywG' \
    > test.out 2>&1
eval_tap $? 115 'ListBasicItemsByFeatures' test.out

#- 116 GetItems
./ng net.accelbyte.sdk.cli.Main platform getItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'n2NFpLDV' \
    --itemIds 's4tLTniX' \
    > test.out 2>&1
eval_tap $? 116 'GetItems' test.out

#- 117 GetItemBySku
./ng net.accelbyte.sdk.cli.Main platform getItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'Y0QWEOj5' \
    --sku 'PDSh8v59' \
    > test.out 2>&1
eval_tap $? 117 'GetItemBySku' test.out

#- 118 GetLocaleItemBySku
./ng net.accelbyte.sdk.cli.Main platform getLocaleItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'zaelip2q' \
    --populateBundle  \
    --region '7wrxviWD' \
    --storeId 'jaqGBWkv' \
    --sku '2Y3JzltA' \
    > test.out 2>&1
eval_tap $? 118 'GetLocaleItemBySku' test.out

#- 119 GetEstimatedPrice
./ng net.accelbyte.sdk.cli.Main platform getEstimatedPrice \
    --namespace "$AB_NAMESPACE" \
    --platform 'kFBHVKAo' \
    --region 'hLPnlLzB' \
    --storeId 'Qa53VnXM' \
    --itemIds 'E9zMG34Z' \
    --userId 'CnMT9baC' \
    > test.out 2>&1
eval_tap $? 119 'GetEstimatedPrice' test.out

#- 120 GetItemIdBySku
./ng net.accelbyte.sdk.cli.Main platform getItemIdBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'nhPjfWBI' \
    --sku 'i5jAgagy' \
    > test.out 2>&1
eval_tap $? 120 'GetItemIdBySku' test.out

#- 121 GetBulkItemIdBySkus
./ng net.accelbyte.sdk.cli.Main platform getBulkItemIdBySkus \
    --namespace "$AB_NAMESPACE" \
    --sku 'T2hHUVnd,WBlbHotN,446v8mtF' \
    --storeId 'FUV6F9cz' \
    > test.out 2>&1
eval_tap $? 121 'GetBulkItemIdBySkus' test.out

#- 122 BulkGetLocaleItems
./ng net.accelbyte.sdk.cli.Main platform bulkGetLocaleItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'wwZUPlbe' \
    --region 'oaiLMlqo' \
    --storeId 'w0ojLQT7' \
    --itemIds 'HQVHVcko' \
    > test.out 2>&1
eval_tap $? 122 'BulkGetLocaleItems' test.out

#- 123 GetAvailablePredicateTypes
./ng net.accelbyte.sdk.cli.Main platform getAvailablePredicateTypes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 123 'GetAvailablePredicateTypes' test.out

#- 124 ValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform validateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --platform 'H1RKsOwa' \
    --userId 'RK0y7HqG' \
    --body '{"itemIds": ["4wb65sJ8", "P90HoS1v", "3T0woGnq"]}' \
    > test.out 2>&1
eval_tap $? 124 'ValidateItemPurchaseCondition' test.out

#- 125 BulkUpdateRegionData
./ng net.accelbyte.sdk.cli.Main platform bulkUpdateRegionData \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ycl62ENM' \
    --body '{"changes": [{"itemIdentities": ["SSWh1qEW", "aUnM3DSZ", "cc3b01zx"], "itemIdentityType": "ITEM_SKU", "regionData": {"mqXac3Zx": [{"currencyCode": "EoIxHys2", "currencyNamespace": "gCrfNAJ3", "currencyType": "REAL", "discountAmount": 18, "discountExpireAt": "1973-10-12T00:00:00Z", "discountPercentage": 44, "discountPurchaseAt": "1979-04-02T00:00:00Z", "discountedPrice": 70, "expireAt": "1995-08-29T00:00:00Z", "price": 32, "purchaseAt": "1987-07-14T00:00:00Z", "trialPrice": 4}, {"currencyCode": "krVqvUVq", "currencyNamespace": "Guesvkqj", "currencyType": "REAL", "discountAmount": 76, "discountExpireAt": "1997-07-26T00:00:00Z", "discountPercentage": 74, "discountPurchaseAt": "1991-04-03T00:00:00Z", "discountedPrice": 52, "expireAt": "1977-05-17T00:00:00Z", "price": 44, "purchaseAt": "1985-11-25T00:00:00Z", "trialPrice": 100}, {"currencyCode": "OZam0Q6W", "currencyNamespace": "q2tKEcu8", "currencyType": "VIRTUAL", "discountAmount": 70, "discountExpireAt": "1980-07-29T00:00:00Z", "discountPercentage": 28, "discountPurchaseAt": "1974-10-09T00:00:00Z", "discountedPrice": 94, "expireAt": "1989-05-05T00:00:00Z", "price": 41, "purchaseAt": "1975-12-04T00:00:00Z", "trialPrice": 52}], "YKtiGeNl": [{"currencyCode": "GaoxP9Cu", "currencyNamespace": "oH9qFXxw", "currencyType": "REAL", "discountAmount": 74, "discountExpireAt": "1987-03-23T00:00:00Z", "discountPercentage": 92, "discountPurchaseAt": "1992-09-20T00:00:00Z", "discountedPrice": 29, "expireAt": "1991-04-28T00:00:00Z", "price": 99, "purchaseAt": "1978-11-13T00:00:00Z", "trialPrice": 18}, {"currencyCode": "hKTR0dww", "currencyNamespace": "iYp26TMG", "currencyType": "VIRTUAL", "discountAmount": 16, "discountExpireAt": "1998-01-13T00:00:00Z", "discountPercentage": 3, "discountPurchaseAt": "1984-10-10T00:00:00Z", "discountedPrice": 39, "expireAt": "1990-10-09T00:00:00Z", "price": 79, "purchaseAt": "1999-08-16T00:00:00Z", "trialPrice": 79}, {"currencyCode": "PyLwlwiQ", "currencyNamespace": "azBPWfWg", "currencyType": "REAL", "discountAmount": 65, "discountExpireAt": "1988-02-26T00:00:00Z", "discountPercentage": 51, "discountPurchaseAt": "1975-06-24T00:00:00Z", "discountedPrice": 41, "expireAt": "1980-03-21T00:00:00Z", "price": 78, "purchaseAt": "1995-04-04T00:00:00Z", "trialPrice": 100}], "6HiPT6wR": [{"currencyCode": "xO6WlBCx", "currencyNamespace": "uv5mxCcZ", "currencyType": "REAL", "discountAmount": 20, "discountExpireAt": "1976-01-25T00:00:00Z", "discountPercentage": 28, "discountPurchaseAt": "1989-12-02T00:00:00Z", "discountedPrice": 90, "expireAt": "1971-06-08T00:00:00Z", "price": 61, "purchaseAt": "1995-01-15T00:00:00Z", "trialPrice": 11}, {"currencyCode": "8jorJPut", "currencyNamespace": "kcmDmSXz", "currencyType": "VIRTUAL", "discountAmount": 55, "discountExpireAt": "1990-05-15T00:00:00Z", "discountPercentage": 40, "discountPurchaseAt": "1979-12-31T00:00:00Z", "discountedPrice": 16, "expireAt": "1987-03-04T00:00:00Z", "price": 29, "purchaseAt": "1989-01-31T00:00:00Z", "trialPrice": 83}, {"currencyCode": "eC5ojKze", "currencyNamespace": "Gmd73zpQ", "currencyType": "REAL", "discountAmount": 31, "discountExpireAt": "1973-05-26T00:00:00Z", "discountPercentage": 29, "discountPurchaseAt": "1993-01-01T00:00:00Z", "discountedPrice": 74, "expireAt": "1978-06-09T00:00:00Z", "price": 1, "purchaseAt": "1985-09-08T00:00:00Z", "trialPrice": 39}]}}, {"itemIdentities": ["xbi3b2mN", "vJjJHBtA", "PASwem6M"], "itemIdentityType": "ITEM_SKU", "regionData": {"Xz1xTPIV": [{"currencyCode": "zmGfAEJS", "currencyNamespace": "3cJWtezI", "currencyType": "VIRTUAL", "discountAmount": 95, "discountExpireAt": "1989-08-10T00:00:00Z", "discountPercentage": 59, "discountPurchaseAt": "1983-02-27T00:00:00Z", "discountedPrice": 71, "expireAt": "1993-07-29T00:00:00Z", "price": 2, "purchaseAt": "1983-01-24T00:00:00Z", "trialPrice": 23}, {"currencyCode": "Z6y2GiWm", "currencyNamespace": "jCoqtys4", "currencyType": "VIRTUAL", "discountAmount": 33, "discountExpireAt": "1982-12-18T00:00:00Z", "discountPercentage": 60, "discountPurchaseAt": "1976-01-18T00:00:00Z", "discountedPrice": 92, "expireAt": "1972-10-09T00:00:00Z", "price": 62, "purchaseAt": "1990-09-25T00:00:00Z", "trialPrice": 12}, {"currencyCode": "McD0q4Q6", "currencyNamespace": "OlgUt3Do", "currencyType": "REAL", "discountAmount": 6, "discountExpireAt": "1975-05-29T00:00:00Z", "discountPercentage": 16, "discountPurchaseAt": "1979-01-11T00:00:00Z", "discountedPrice": 55, "expireAt": "1983-02-23T00:00:00Z", "price": 0, "purchaseAt": "1998-12-15T00:00:00Z", "trialPrice": 70}], "C1FWXTDl": [{"currencyCode": "Z29qZuOP", "currencyNamespace": "1zfM42Ts", "currencyType": "REAL", "discountAmount": 38, "discountExpireAt": "1976-01-17T00:00:00Z", "discountPercentage": 44, "discountPurchaseAt": "1986-07-25T00:00:00Z", "discountedPrice": 77, "expireAt": "1981-10-23T00:00:00Z", "price": 86, "purchaseAt": "1987-09-01T00:00:00Z", "trialPrice": 22}, {"currencyCode": "bCk9tjWW", "currencyNamespace": "dS6AMSRO", "currencyType": "REAL", "discountAmount": 71, "discountExpireAt": "1990-02-26T00:00:00Z", "discountPercentage": 41, "discountPurchaseAt": "1986-06-04T00:00:00Z", "discountedPrice": 31, "expireAt": "1983-10-28T00:00:00Z", "price": 90, "purchaseAt": "1975-12-09T00:00:00Z", "trialPrice": 65}, {"currencyCode": "as9rAd6G", "currencyNamespace": "qtMKYGu8", "currencyType": "REAL", "discountAmount": 74, "discountExpireAt": "1986-09-22T00:00:00Z", "discountPercentage": 34, "discountPurchaseAt": "1975-05-11T00:00:00Z", "discountedPrice": 85, "expireAt": "1973-07-26T00:00:00Z", "price": 28, "purchaseAt": "1983-08-19T00:00:00Z", "trialPrice": 82}], "2Hdlp28o": [{"currencyCode": "rmKBrU65", "currencyNamespace": "bHPVHHcP", "currencyType": "REAL", "discountAmount": 29, "discountExpireAt": "1993-09-10T00:00:00Z", "discountPercentage": 63, "discountPurchaseAt": "1981-01-20T00:00:00Z", "discountedPrice": 37, "expireAt": "1995-05-28T00:00:00Z", "price": 57, "purchaseAt": "1976-12-13T00:00:00Z", "trialPrice": 71}, {"currencyCode": "RL29hOWt", "currencyNamespace": "bEGvnFrq", "currencyType": "REAL", "discountAmount": 10, "discountExpireAt": "1985-09-12T00:00:00Z", "discountPercentage": 4, "discountPurchaseAt": "1994-01-07T00:00:00Z", "discountedPrice": 99, "expireAt": "1974-06-22T00:00:00Z", "price": 6, "purchaseAt": "1997-09-03T00:00:00Z", "trialPrice": 8}, {"currencyCode": "quJmj3V0", "currencyNamespace": "hAyw3CwZ", "currencyType": "VIRTUAL", "discountAmount": 28, "discountExpireAt": "1975-05-27T00:00:00Z", "discountPercentage": 69, "discountPurchaseAt": "1975-03-08T00:00:00Z", "discountedPrice": 97, "expireAt": "1978-07-10T00:00:00Z", "price": 85, "purchaseAt": "1978-08-30T00:00:00Z", "trialPrice": 65}]}}, {"itemIdentities": ["9HntmMaY", "vzthnKNp", "KEZJBXGg"], "itemIdentityType": "ITEM_ID", "regionData": {"Upp0wvOT": [{"currencyCode": "3FacaS4p", "currencyNamespace": "g2Z2whJJ", "currencyType": "REAL", "discountAmount": 39, "discountExpireAt": "1986-11-16T00:00:00Z", "discountPercentage": 74, "discountPurchaseAt": "1984-11-12T00:00:00Z", "discountedPrice": 9, "expireAt": "1998-09-11T00:00:00Z", "price": 5, "purchaseAt": "1977-08-11T00:00:00Z", "trialPrice": 9}, {"currencyCode": "4sGO13sU", "currencyNamespace": "R4zVPVrN", "currencyType": "REAL", "discountAmount": 37, "discountExpireAt": "1975-01-02T00:00:00Z", "discountPercentage": 100, "discountPurchaseAt": "1987-02-01T00:00:00Z", "discountedPrice": 41, "expireAt": "1982-07-09T00:00:00Z", "price": 58, "purchaseAt": "1998-05-13T00:00:00Z", "trialPrice": 33}, {"currencyCode": "JffcpvBk", "currencyNamespace": "9LS5f2vc", "currencyType": "VIRTUAL", "discountAmount": 29, "discountExpireAt": "1973-04-22T00:00:00Z", "discountPercentage": 74, "discountPurchaseAt": "1983-07-17T00:00:00Z", "discountedPrice": 73, "expireAt": "1993-03-01T00:00:00Z", "price": 82, "purchaseAt": "1990-08-14T00:00:00Z", "trialPrice": 25}], "FqH51tcR": [{"currencyCode": "1FZoLu25", "currencyNamespace": "eChJhaZw", "currencyType": "REAL", "discountAmount": 38, "discountExpireAt": "1973-02-09T00:00:00Z", "discountPercentage": 22, "discountPurchaseAt": "1971-11-10T00:00:00Z", "discountedPrice": 13, "expireAt": "1974-05-09T00:00:00Z", "price": 93, "purchaseAt": "1971-02-05T00:00:00Z", "trialPrice": 90}, {"currencyCode": "WHJdS5dK", "currencyNamespace": "joXDQnHf", "currencyType": "REAL", "discountAmount": 90, "discountExpireAt": "1994-03-18T00:00:00Z", "discountPercentage": 80, "discountPurchaseAt": "1988-11-24T00:00:00Z", "discountedPrice": 22, "expireAt": "1976-09-24T00:00:00Z", "price": 53, "purchaseAt": "1990-05-26T00:00:00Z", "trialPrice": 70}, {"currencyCode": "8uGwzRMx", "currencyNamespace": "DS17flIA", "currencyType": "REAL", "discountAmount": 48, "discountExpireAt": "1981-12-30T00:00:00Z", "discountPercentage": 10, "discountPurchaseAt": "1977-09-18T00:00:00Z", "discountedPrice": 2, "expireAt": "1994-05-26T00:00:00Z", "price": 20, "purchaseAt": "1986-08-29T00:00:00Z", "trialPrice": 38}], "JBsM8XXf": [{"currencyCode": "esn2YB4m", "currencyNamespace": "O3HkfoSj", "currencyType": "VIRTUAL", "discountAmount": 21, "discountExpireAt": "1980-01-09T00:00:00Z", "discountPercentage": 71, "discountPurchaseAt": "1975-01-17T00:00:00Z", "discountedPrice": 37, "expireAt": "1976-02-11T00:00:00Z", "price": 83, "purchaseAt": "1981-04-07T00:00:00Z", "trialPrice": 70}, {"currencyCode": "ZyobaEl4", "currencyNamespace": "QvqdFYOZ", "currencyType": "REAL", "discountAmount": 3, "discountExpireAt": "1991-04-03T00:00:00Z", "discountPercentage": 42, "discountPurchaseAt": "1981-06-26T00:00:00Z", "discountedPrice": 27, "expireAt": "1988-06-08T00:00:00Z", "price": 3, "purchaseAt": "1980-09-15T00:00:00Z", "trialPrice": 95}, {"currencyCode": "3Tqt6Nl7", "currencyNamespace": "IW8hGWY9", "currencyType": "REAL", "discountAmount": 43, "discountExpireAt": "1975-05-29T00:00:00Z", "discountPercentage": 56, "discountPurchaseAt": "1991-08-21T00:00:00Z", "discountedPrice": 33, "expireAt": "1991-03-03T00:00:00Z", "price": 32, "purchaseAt": "1992-07-06T00:00:00Z", "trialPrice": 7}]}}]}' \
    > test.out 2>&1
eval_tap $? 125 'BulkUpdateRegionData' test.out

#- 126 SearchItems
./ng net.accelbyte.sdk.cli.Main platform searchItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemType 'BUNDLE' \
    --limit '86' \
    --offset '71' \
    --sortBy '8Emx2NKz' \
    --storeId 'zd8JX0w0' \
    --keyword 'h5AquVkd' \
    --language 'hVSaDxFg' \
    > test.out 2>&1
eval_tap $? 126 'SearchItems' test.out

#- 127 QueryUncategorizedItems
./ng net.accelbyte.sdk.cli.Main platform queryUncategorizedItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --limit '18' \
    --offset '60' \
    --sortBy 'displayOrder,displayOrder:asc,updatedAt' \
    --storeId 'piyuhg9p' \
    > test.out 2>&1
eval_tap $? 127 'QueryUncategorizedItems' test.out

#- 128 GetItem
./ng net.accelbyte.sdk.cli.Main platform getItem \
    --itemId '38hHgBtz' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'yCEpeak7' \
    > test.out 2>&1
eval_tap $? 128 'GetItem' test.out

#- 129 UpdateItem
./ng net.accelbyte.sdk.cli.Main platform updateItem \
    --itemId 'CysSfzgd' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'HeXQnvmi' \
    --body '{"appId": "5S1b0DiL", "appType": "GAME", "baseAppId": "B5bpI3u1", "boothName": "P4uqyHGX", "categoryPath": "9MFPutlK", "clazz": "EaIzVhZB", "displayOrder": 94, "entitlementType": "CONSUMABLE", "ext": {"7UPgCVYb": {}, "d4apoLcF": {}, "45ZCNgsa": {}}, "features": ["xQ3ifi5j", "QOfNzaV4", "enQHIRfK"], "flexible": true, "images": [{"as": "5fONPGs6", "caption": "3XgI3HYV", "height": 4, "imageUrl": "WcHSiw4o", "smallImageUrl": "xCIljguX", "width": 64}, {"as": "pRODFYtv", "caption": "PumBhane", "height": 18, "imageUrl": "uEwM5uYB", "smallImageUrl": "xVekccpQ", "width": 62}, {"as": "qSjLRvXO", "caption": "NaanHO1M", "height": 9, "imageUrl": "r4cSZpws", "smallImageUrl": "ZsbvawWO", "width": 49}], "inventoryConfig": {"customAttributes": {"Quw0dXb3": {}, "UBobVrOF": {}, "saHysuCW": {}}, "serverCustomAttributes": {"hbssSfq1": {}, "2ky2KveR": {}, "CQAIvaDS": {}}, "slotUsed": 53}, "itemIds": ["QZLiToZ8", "4PriOTmn", "XhTNiAC7"], "itemQty": {"TrJQmxzT": 13, "6rDTYHHC": 3, "gRNUSyaR": 0}, "itemType": "COINS", "listable": true, "localizations": {"cgYYwujO": {"description": "QKAJSt1s", "localExt": {"JZ7pPaeF": {}, "OW79wp0F": {}, "CzVJ5pXc": {}}, "longDescription": "aEW9xK7q", "title": "PDWqy7se"}, "EjTUuQel": {"description": "FyZmXQye", "localExt": {"AwY7Al3K": {}, "MTuz3EIi": {}, "tGdEv2Eg": {}}, "longDescription": "egvyTc73", "title": "3qbiV0xw"}, "YeosnZ7z": {"description": "Jku1aguv", "localExt": {"eLQvrteb": {}, "MF4cgkhs": {}, "iBk00fsa": {}}, "longDescription": "Kq8PHfKp", "title": "AfOYkBck"}}, "lootBoxConfig": {"rewardCount": 79, "rewards": [{"lootBoxItems": [{"count": 92, "duration": 22, "endDate": "1983-06-20T00:00:00Z", "itemId": "0Ho7LLyb", "itemSku": "L6far4Nj", "itemType": "lzu36BZp"}, {"count": 12, "duration": 75, "endDate": "1992-07-24T00:00:00Z", "itemId": "rsiH0b6E", "itemSku": "7JHLmvp9", "itemType": "VWnogBGB"}, {"count": 0, "duration": 27, "endDate": "1980-09-10T00:00:00Z", "itemId": "q0o0a2kZ", "itemSku": "ecQClzKE", "itemType": "0pGjb95x"}], "name": "29tkEwIv", "odds": 0.07774496675589415, "type": "PROBABILITY_GROUP", "weight": 53}, {"lootBoxItems": [{"count": 96, "duration": 34, "endDate": "1974-01-05T00:00:00Z", "itemId": "Gsd02keG", "itemSku": "jPZCDEgx", "itemType": "VW2m3AyW"}, {"count": 28, "duration": 58, "endDate": "1985-06-15T00:00:00Z", "itemId": "L6mPQWQk", "itemSku": "RMqVNSOt", "itemType": "paMrxqbN"}, {"count": 32, "duration": 28, "endDate": "1972-06-02T00:00:00Z", "itemId": "GSYfjOly", "itemSku": "sxEEgU29", "itemType": "c6miQVas"}], "name": "3jjP4E9f", "odds": 0.1970573956805569, "type": "REWARD_GROUP", "weight": 28}, {"lootBoxItems": [{"count": 40, "duration": 71, "endDate": "1981-07-23T00:00:00Z", "itemId": "iTxl8R4K", "itemSku": "JLXXCa7E", "itemType": "2FCFq9U7"}, {"count": 9, "duration": 12, "endDate": "1975-09-18T00:00:00Z", "itemId": "BffKmyv1", "itemSku": "tYler2ZG", "itemType": "LyAryejn"}, {"count": 69, "duration": 77, "endDate": "1987-11-29T00:00:00Z", "itemId": "7N6ZqK8k", "itemSku": "Wa9QVPZQ", "itemType": "Qm9Tce9O"}], "name": "jxiHmIMt", "odds": 0.09533804202145413, "type": "PROBABILITY_GROUP", "weight": 54}], "rollFunction": "DEFAULT"}, "maxCount": 46, "maxCountPerUser": 89, "name": "UCfCFsqw", "optionBoxConfig": {"boxItems": [{"count": 97, "duration": 72, "endDate": "1972-10-09T00:00:00Z", "itemId": "We9xKzRJ", "itemSku": "oRBvhYUR", "itemType": "SQIFGlMK"}, {"count": 68, "duration": 66, "endDate": "1983-09-28T00:00:00Z", "itemId": "KsVWC2Qy", "itemSku": "saVwKcqV", "itemType": "TQBCQHKV"}, {"count": 95, "duration": 79, "endDate": "1981-08-03T00:00:00Z", "itemId": "d41UlAhV", "itemSku": "Ge0dGuEe", "itemType": "mm4bA3uu"}]}, "purchasable": false, "recurring": {"cycle": "MONTHLY", "fixedFreeDays": 18, "fixedTrialCycles": 27, "graceDays": 48}, "regionData": {"Ys5NohXy": [{"currencyCode": "wfbhcUti", "currencyNamespace": "E1yUypMi", "currencyType": "VIRTUAL", "discountAmount": 25, "discountExpireAt": "1979-10-09T00:00:00Z", "discountPercentage": 12, "discountPurchaseAt": "1989-11-17T00:00:00Z", "expireAt": "1990-08-17T00:00:00Z", "price": 78, "purchaseAt": "1978-05-18T00:00:00Z", "trialPrice": 28}, {"currencyCode": "irdekvNe", "currencyNamespace": "A4ktptwm", "currencyType": "REAL", "discountAmount": 35, "discountExpireAt": "1999-02-01T00:00:00Z", "discountPercentage": 67, "discountPurchaseAt": "1992-04-20T00:00:00Z", "expireAt": "1995-12-12T00:00:00Z", "price": 94, "purchaseAt": "1991-01-16T00:00:00Z", "trialPrice": 56}, {"currencyCode": "nTlCNgJ3", "currencyNamespace": "WdRRKS8I", "currencyType": "REAL", "discountAmount": 86, "discountExpireAt": "1974-06-10T00:00:00Z", "discountPercentage": 36, "discountPurchaseAt": "1979-07-05T00:00:00Z", "expireAt": "1984-11-17T00:00:00Z", "price": 50, "purchaseAt": "1984-12-10T00:00:00Z", "trialPrice": 31}], "UQ4UzsXw": [{"currencyCode": "FR7D3DxG", "currencyNamespace": "irJ12oCj", "currencyType": "VIRTUAL", "discountAmount": 72, "discountExpireAt": "1999-06-20T00:00:00Z", "discountPercentage": 94, "discountPurchaseAt": "1975-02-10T00:00:00Z", "expireAt": "1995-12-18T00:00:00Z", "price": 30, "purchaseAt": "1972-05-11T00:00:00Z", "trialPrice": 16}, {"currencyCode": "FdDV2HXO", "currencyNamespace": "ZADqYxpo", "currencyType": "VIRTUAL", "discountAmount": 19, "discountExpireAt": "1982-02-03T00:00:00Z", "discountPercentage": 92, "discountPurchaseAt": "1982-04-10T00:00:00Z", "expireAt": "1978-06-10T00:00:00Z", "price": 32, "purchaseAt": "1986-07-28T00:00:00Z", "trialPrice": 74}, {"currencyCode": "GHssTzZO", "currencyNamespace": "nLmC267g", "currencyType": "REAL", "discountAmount": 75, "discountExpireAt": "1989-08-24T00:00:00Z", "discountPercentage": 85, "discountPurchaseAt": "1971-02-22T00:00:00Z", "expireAt": "1987-06-16T00:00:00Z", "price": 2, "purchaseAt": "1998-02-25T00:00:00Z", "trialPrice": 78}], "vUImSk3l": [{"currencyCode": "EGLwEdXK", "currencyNamespace": "r2bzfQCz", "currencyType": "REAL", "discountAmount": 52, "discountExpireAt": "1973-04-18T00:00:00Z", "discountPercentage": 82, "discountPurchaseAt": "1995-01-25T00:00:00Z", "expireAt": "1971-12-20T00:00:00Z", "price": 61, "purchaseAt": "1972-07-29T00:00:00Z", "trialPrice": 88}, {"currencyCode": "zZvKlnn6", "currencyNamespace": "f6iU4xRq", "currencyType": "VIRTUAL", "discountAmount": 14, "discountExpireAt": "1989-11-23T00:00:00Z", "discountPercentage": 53, "discountPurchaseAt": "1985-03-11T00:00:00Z", "expireAt": "1987-11-27T00:00:00Z", "price": 69, "purchaseAt": "1993-03-07T00:00:00Z", "trialPrice": 95}, {"currencyCode": "mWkHZnpG", "currencyNamespace": "q23ziWva", "currencyType": "VIRTUAL", "discountAmount": 82, "discountExpireAt": "1995-12-29T00:00:00Z", "discountPercentage": 72, "discountPurchaseAt": "1988-08-07T00:00:00Z", "expireAt": "1991-03-26T00:00:00Z", "price": 22, "purchaseAt": "1976-01-15T00:00:00Z", "trialPrice": 73}]}, "saleConfig": {"currencyCode": "wNpx38wr", "price": 4}, "seasonType": "TIER", "sectionExclusive": false, "sellable": false, "sku": "WNwTc1qr", "stackable": true, "status": "INACTIVE", "tags": ["LQwdjUbz", "bySjZh7j", "FYV8uraA"], "targetCurrencyCode": "v6GDEH6U", "targetNamespace": "PDrFa127", "thumbnailUrl": "7cKSWjrn", "useCount": 50}' \
    > test.out 2>&1
eval_tap $? 129 'UpdateItem' test.out

#- 130 DeleteItem
./ng net.accelbyte.sdk.cli.Main platform deleteItem \
    --itemId 'Xa2FF5Ka' \
    --namespace "$AB_NAMESPACE" \
    --force  \
    --storeId '4D61aB7u' \
    > test.out 2>&1
eval_tap $? 130 'DeleteItem' test.out

#- 131 AcquireItem
./ng net.accelbyte.sdk.cli.Main platform acquireItem \
    --itemId 'QziwwSCR' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 14, "orderNo": "MjUxE2dN"}' \
    > test.out 2>&1
eval_tap $? 131 'AcquireItem' test.out

#- 132 GetApp
./ng net.accelbyte.sdk.cli.Main platform getApp \
    --itemId 'hWVvB178' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'dH6nDPdx' \
    > test.out 2>&1
eval_tap $? 132 'GetApp' test.out

#- 133 UpdateApp
./ng net.accelbyte.sdk.cli.Main platform updateApp \
    --itemId 'QucalExx' \
    --namespace "$AB_NAMESPACE" \
    --storeId '6UAjXYz2' \
    --body '{"carousel": [{"alt": "ztNoqeKk", "previewUrl": "XOE2NvWy", "thumbnailUrl": "7t4W7ezF", "type": "video", "url": "BeG4QfBI", "videoSource": "vimeo"}, {"alt": "SLFHqYWI", "previewUrl": "7Xt1p9HY", "thumbnailUrl": "cAKhK1vo", "type": "image", "url": "h2RvPKj0", "videoSource": "generic"}, {"alt": "M3MFE1hG", "previewUrl": "JsVS5j42", "thumbnailUrl": "T7iabufX", "type": "image", "url": "us9IieLv", "videoSource": "youtube"}], "developer": "wWSBg4IR", "forumUrl": "7avePuN4", "genres": ["Adventure", "Action", "Indie"], "localizations": {"59qTkCnJ": {"announcement": "C1HIMlGY", "slogan": "61iblEZp"}, "gICM35TP": {"announcement": "Bi6VLn68", "slogan": "ehW9tkLc"}, "NUv8fD5p": {"announcement": "Pz5p8iRd", "slogan": "yX1rslcJ"}}, "platformRequirements": {"vOcpQpb2": [{"additionals": "cyISRwn1", "directXVersion": "0iwzHc7s", "diskSpace": "pAjRDoXi", "graphics": "1y1JKeJi", "label": "VFF49317", "osVersion": "OXFCn5qN", "processor": "PkyA8CBs", "ram": "QH5AVMPU", "soundCard": "HyyoZ6dA"}, {"additionals": "MCrqwc5q", "directXVersion": "LvYU3P5B", "diskSpace": "uJGZelsd", "graphics": "ZDoLmCoO", "label": "Ha4m7erq", "osVersion": "UxPGFRVR", "processor": "RRBlMWbV", "ram": "akBwclkw", "soundCard": "AjFo1dLg"}, {"additionals": "fuu1m5XO", "directXVersion": "zVHisnXZ", "diskSpace": "ZgVytgld", "graphics": "MIqnEiDA", "label": "L75bJske", "osVersion": "LPXLE7W5", "processor": "Y6U9RZTd", "ram": "VSGBoo8H", "soundCard": "9QKjs1Lb"}], "1DR5sNFC": [{"additionals": "4Sf3QC6c", "directXVersion": "EPqrXidA", "diskSpace": "FgdE6NKe", "graphics": "xXBheEL1", "label": "RJeD7mOQ", "osVersion": "I8E2amSA", "processor": "jcFwdZ6R", "ram": "CZFyaswC", "soundCard": "XXAP3udU"}, {"additionals": "69Y4ukba", "directXVersion": "w6RF9gW1", "diskSpace": "HVzsZDod", "graphics": "bUCLEvxu", "label": "0ARVi42Q", "osVersion": "Qa8L0SqS", "processor": "OHcmt0FW", "ram": "rs3TE2Tq", "soundCard": "joQHKWKt"}, {"additionals": "aBZ4nnAb", "directXVersion": "3L4jOg5l", "diskSpace": "8vwW0VzK", "graphics": "TvEvC1cq", "label": "323jXloC", "osVersion": "DhMQMpNG", "processor": "80j5hGwF", "ram": "OZ5lX2nH", "soundCard": "3521PL7F"}], "Kq41vLwk": [{"additionals": "iIjODuwm", "directXVersion": "bGNchz4N", "diskSpace": "RgQxQgcO", "graphics": "0aJTwnY3", "label": "qMlyPlDH", "osVersion": "KFJvTMi1", "processor": "CI3n2iHW", "ram": "K7nHDKQO", "soundCard": "ig9Gv9Hs"}, {"additionals": "5fSKW0BL", "directXVersion": "xrL3rNUq", "diskSpace": "bPXqi3hY", "graphics": "P4uq6PFQ", "label": "IJPVsycQ", "osVersion": "1uKwQjFy", "processor": "8Vw1dUp3", "ram": "PR6DtFCm", "soundCard": "v70wSBEf"}, {"additionals": "bMUFg2Wm", "directXVersion": "BuMN6UEh", "diskSpace": "SuTOzLkw", "graphics": "1Cn08SnI", "label": "dr0z5Mj2", "osVersion": "5Wp5MVzG", "processor": "4nfD7Aq3", "ram": "2dSmr30V", "soundCard": "ClCwy1FK"}]}, "platforms": ["Windows", "Android", "Windows"], "players": ["Single", "Single", "LocalCoop"], "primaryGenre": "Sports", "publisher": "NSpgPtdr", "releaseDate": "1979-02-26T00:00:00Z", "websiteUrl": "H0R8eFE1"}' \
    > test.out 2>&1
eval_tap $? 133 'UpdateApp' test.out

#- 134 DisableItem
./ng net.accelbyte.sdk.cli.Main platform disableItem \
    --itemId 'r8aoWXGW' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ZH8Nwfmh' \
    > test.out 2>&1
eval_tap $? 134 'DisableItem' test.out

#- 135 GetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform getItemDynamicData \
    --itemId 'ZDewRaXw' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 135 'GetItemDynamicData' test.out

#- 136 EnableItem
./ng net.accelbyte.sdk.cli.Main platform enableItem \
    --itemId '6SZpngAm' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'FKGTpgmG' \
    > test.out 2>&1
eval_tap $? 136 'EnableItem' test.out

#- 137 FeatureItem
./ng net.accelbyte.sdk.cli.Main platform featureItem \
    --feature '0A14vxb4' \
    --itemId 'dk0NPERY' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'u57XQtN8' \
    > test.out 2>&1
eval_tap $? 137 'FeatureItem' test.out

#- 138 DefeatureItem
./ng net.accelbyte.sdk.cli.Main platform defeatureItem \
    --feature 'dxLRgmrl' \
    --itemId 'AnnD0mZA' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'TqaKRYGG' \
    > test.out 2>&1
eval_tap $? 138 'DefeatureItem' test.out

#- 139 GetLocaleItem
./ng net.accelbyte.sdk.cli.Main platform getLocaleItem \
    --itemId 'N6Kl9Vax' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'kq165ZbM' \
    --populateBundle  \
    --region 'zcaGgeWJ' \
    --storeId 'qnG2ty4L' \
    > test.out 2>&1
eval_tap $? 139 'GetLocaleItem' test.out

#- 140 UpdateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform updateItemPurchaseCondition \
    --itemId 'eQXGMbnN' \
    --namespace "$AB_NAMESPACE" \
    --storeId '2qgnFA2y' \
    --body '{"purchaseCondition": {"conditionGroups": [{"operator": "or", "predicates": [{"anyOf": 100, "code": "4qTxp6HN", "comparison": "is", "name": "ftOLsxTq", "predicateType": "EntitlementPredicate", "value": "pPoB8CgG", "values": ["d7INbzvW", "sGBy8Lva", "m9nUpUAQ"]}, {"anyOf": 46, "code": "MxmJQY0I", "comparison": "isNot", "name": "g3Ti00OM", "predicateType": "SeasonTierPredicate", "value": "CZ601rX0", "values": ["viOUGzbQ", "j4a5ADYh", "1n8mu9ES"]}, {"anyOf": 10, "code": "vJ13w090", "comparison": "isLessThan", "name": "Gbe7J6OP", "predicateType": "EntitlementPredicate", "value": "ENCpUaaw", "values": ["Y3VJkzwn", "uXFAmZik", "emlRk9gs"]}]}, {"operator": "and", "predicates": [{"anyOf": 58, "code": "KfnAYogz", "comparison": "isNot", "name": "Ok5UghTr", "predicateType": "EntitlementPredicate", "value": "AD1tY60g", "values": ["cFH6TVmC", "qWS24QVx", "ygGq5zYs"]}, {"anyOf": 33, "code": "Kt34WAwf", "comparison": "isLessThan", "name": "ECiDKn13", "predicateType": "EntitlementPredicate", "value": "myWrpFkU", "values": ["CDac98wX", "cEGPVf7N", "JOiBqq9n"]}, {"anyOf": 44, "code": "67xxUm0J", "comparison": "isLessThanOrEqual", "name": "piPdzqPU", "predicateType": "StatisticCodePredicate", "value": "pP1UVQXX", "values": ["RArVaf2M", "t0mxXcIb", "6ehUGN0Y"]}]}, {"operator": "and", "predicates": [{"anyOf": 64, "code": "t8qwDDD7", "comparison": "includes", "name": "L1Xh35lq", "predicateType": "SeasonTierPredicate", "value": "f9ipqDO2", "values": ["WzXt8e7J", "5RyT0Jzf", "1OrzIllB"]}, {"anyOf": 43, "code": "mW4ajJvK", "comparison": "isLessThan", "name": "diKlfPf3", "predicateType": "StatisticCodePredicate", "value": "4iUqnCNE", "values": ["JWaOwxf2", "4cCD6fw3", "8VVWGVpV"]}, {"anyOf": 39, "code": "b3Zd1eMl", "comparison": "isNot", "name": "dvNE1MXU", "predicateType": "SeasonTierPredicate", "value": "hAKU0EOa", "values": ["OG7M4T5g", "r5O3BAqT", "Kjh24G0h"]}]}]}}' \
    > test.out 2>&1
eval_tap $? 140 'UpdateItemPurchaseCondition' test.out

#- 141 ReturnItem
./ng net.accelbyte.sdk.cli.Main platform returnItem \
    --itemId 'Nike8EB6' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "l3dxqZ7Q"}' \
    > test.out 2>&1
eval_tap $? 141 'ReturnItem' test.out

#- 142 QueryKeyGroups
./ng net.accelbyte.sdk.cli.Main platform queryKeyGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '55' \
    --name 'Og2slNBH' \
    --offset '74' \
    --tag 'qzq51LBb' \
    > test.out 2>&1
eval_tap $? 142 'QueryKeyGroups' test.out

#- 143 CreateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform createKeyGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "33GJlaKT", "name": "4GrV3o7J", "status": "ACTIVE", "tags": ["ulaaZQzF", "PpAVNZsT", "n4nePfC1"]}' \
    > test.out 2>&1
eval_tap $? 143 'CreateKeyGroup' test.out

#- 144 GetKeyGroupByBoothName
eval_tap 0 144 'GetKeyGroupByBoothName # SKIP deprecated' test.out

#- 145 GetKeyGroup
./ng net.accelbyte.sdk.cli.Main platform getKeyGroup \
    --keyGroupId 'edc29LRO' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 145 'GetKeyGroup' test.out

#- 146 UpdateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform updateKeyGroup \
    --keyGroupId '3sbAus9r' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "UVLRhVqx", "name": "plNoSCbc", "status": "ACTIVE", "tags": ["xRgN87Qj", "dzLSRwj2", "OgIUDe1n"]}' \
    > test.out 2>&1
eval_tap $? 146 'UpdateKeyGroup' test.out

#- 147 GetKeyGroupDynamic
./ng net.accelbyte.sdk.cli.Main platform getKeyGroupDynamic \
    --keyGroupId 'RWbqCpvo' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 147 'GetKeyGroupDynamic' test.out

#- 148 ListKeys
./ng net.accelbyte.sdk.cli.Main platform listKeys \
    --keyGroupId '8IKFPWak' \
    --namespace "$AB_NAMESPACE" \
    --limit '3' \
    --offset '8' \
    --status 'ACTIVE' \
    > test.out 2>&1
eval_tap $? 148 'ListKeys' test.out

#- 149 UploadKeys
./ng net.accelbyte.sdk.cli.Main platform uploadKeys \
    --keyGroupId 'nkrfKSjH' \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 149 'UploadKeys' test.out

#- 150 QueryOrders
./ng net.accelbyte.sdk.cli.Main platform queryOrders \
    --namespace "$AB_NAMESPACE" \
    --endTime 'xOSerHJR' \
    --limit '57' \
    --offset '77' \
    --orderNos '8qigeuJ1,KytCyPS8,d5tNFcwL' \
    --sortBy 'b5J5bz4a' \
    --startTime 'AlHGUaqD' \
    --status 'REFUND_FAILED' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 150 'QueryOrders' test.out

#- 151 GetOrderStatistics
./ng net.accelbyte.sdk.cli.Main platform getOrderStatistics \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 151 'GetOrderStatistics' test.out

#- 152 GetOrder
./ng net.accelbyte.sdk.cli.Main platform getOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'KvJHAi9Y' \
    > test.out 2>&1
eval_tap $? 152 'GetOrder' test.out

#- 153 RefundOrder
./ng net.accelbyte.sdk.cli.Main platform refundOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'Mt14fhs8' \
    --body '{"description": "m2RYnjCx"}' \
    > test.out 2>&1
eval_tap $? 153 'RefundOrder' test.out

#- 154 GetPaymentCallbackConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentCallbackConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 154 'GetPaymentCallbackConfig' test.out

#- 155 UpdatePaymentCallbackConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentCallbackConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"dryRun": false, "notifyUrl": "zRkeQJzU", "privateKey": "mOJq49WQ"}' \
    > test.out 2>&1
eval_tap $? 155 'UpdatePaymentCallbackConfig' test.out

#- 156 GetPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentMerchantConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 156 'GetPaymentMerchantConfig' test.out

#- 157 UpdatePaymentDomainWhitelistConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentDomainWhitelistConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"domains": ["udByrhxE", "w5gLvAd0", "0ZbVOcuk"]}' \
    > test.out 2>&1
eval_tap $? 157 'UpdatePaymentDomainWhitelistConfig' test.out

#- 158 QueryPaymentNotifications
./ng net.accelbyte.sdk.cli.Main platform queryPaymentNotifications \
    --namespace "$AB_NAMESPACE" \
    --endDate '7B1WiXOj' \
    --externalId 'UybgTCC2' \
    --limit '40' \
    --notificationSource 'ALIPAY' \
    --notificationType '3DJGJHZa' \
    --offset '11' \
    --paymentOrderNo '5ixeudc9' \
    --startDate 'x04PdePf' \
    --status 'PROCESSED' \
    > test.out 2>&1
eval_tap $? 158 'QueryPaymentNotifications' test.out

#- 159 QueryPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform queryPaymentOrders \
    --namespace "$AB_NAMESPACE" \
    --channel 'INTERNAL' \
    --extTxId 'djvPpOrx' \
    --limit '29' \
    --offset '16' \
    --status 'REFUNDED' \
    > test.out 2>&1
eval_tap $? 159 'QueryPaymentOrders' test.out

#- 160 CreatePaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform createPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --body '{"currencyCode": "KlnDCpNH", "currencyNamespace": "uCHm7j0c", "customParameters": {"qB3i4Ecw": {}, "rDvx8aHi": {}, "8WuIxn3l": {}}, "description": "vxGE8z6W", "extOrderNo": "pT1eI3BF", "extUserId": "sYLy7gAp", "itemType": "SEASON", "language": "jnx-JS", "metadata": {"42FvqTYJ": "nNjZ8QTc", "EPakrrmg": "VaAlf1AJ", "DFH8tfRc": "dfFNfh6W"}, "notifyUrl": "GcnBKXEF", "omitNotification": false, "platform": "tXSqKYc2", "price": 23, "recurringPaymentOrderNo": "eX8KfIR5", "region": "UywYjkxn", "returnUrl": "TWXNMwaj", "sandbox": true, "sku": "zuFfTPBF", "subscriptionId": "Mmzepcsg", "targetNamespace": "1UQfcWxN", "targetUserId": "aRkCLUZq", "title": "gJSp7sEj"}' \
    > test.out 2>&1
eval_tap $? 160 'CreatePaymentOrderByDedicated' test.out

#- 161 ListExtOrderNoByExtTxId
./ng net.accelbyte.sdk.cli.Main platform listExtOrderNoByExtTxId \
    --namespace "$AB_NAMESPACE" \
    --extTxId 'c2bbXUd4' \
    > test.out 2>&1
eval_tap $? 161 'ListExtOrderNoByExtTxId' test.out

#- 162 GetPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'fezK7Sgy' \
    > test.out 2>&1
eval_tap $? 162 'GetPaymentOrder' test.out

#- 163 ChargePaymentOrder
./ng net.accelbyte.sdk.cli.Main platform chargePaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'pm59l3ck' \
    --body '{"extTxId": "jSGLdrYZ", "paymentMethod": "W84YrpQr", "paymentProvider": "XSOLLA"}' \
    > test.out 2>&1
eval_tap $? 163 'ChargePaymentOrder' test.out

#- 164 RefundPaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform refundPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '8F7VzrLT' \
    --body '{"description": "BKxKhML0"}' \
    > test.out 2>&1
eval_tap $? 164 'RefundPaymentOrderByDedicated' test.out

#- 165 SimulatePaymentOrderNotification
./ng net.accelbyte.sdk.cli.Main platform simulatePaymentOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'c3tzrqGu' \
    --body '{"amount": 87, "currencyCode": "LgEW2zqI", "notifyType": "REFUND", "paymentProvider": "ADYEN", "salesTax": 3, "vat": 74}' \
    > test.out 2>&1
eval_tap $? 165 'SimulatePaymentOrderNotification' test.out

#- 166 GetPaymentOrderChargeStatus
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrderChargeStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'daWaMmwS' \
    > test.out 2>&1
eval_tap $? 166 'GetPaymentOrderChargeStatus' test.out

#- 167 GetPsnEntitlementOwnership
./ng net.accelbyte.sdk.cli.Main platform getPsnEntitlementOwnership \
    --entitlementLabel 'uuO1zPoU' \
    --namespace "$AB_NAMESPACE" \
    --body '{"accessToken": "6dY6fHbn", "serviceLabel": 94}' \
    > test.out 2>&1
eval_tap $? 167 'GetPsnEntitlementOwnership' test.out

#- 168 GetXboxEntitlementOwnership
./ng net.accelbyte.sdk.cli.Main platform getXboxEntitlementOwnership \
    --namespace "$AB_NAMESPACE" \
    --productSku 'bh1v4Jpy' \
    --body '{"delegationToken": "Dh6RaC6b", "sandboxId": "pnBgpXTw"}' \
    > test.out 2>&1
eval_tap $? 168 'GetXboxEntitlementOwnership' test.out

#- 169 GetPlatformEntitlementConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformEntitlementConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Other' \
    > test.out 2>&1
eval_tap $? 169 'GetPlatformEntitlementConfig' test.out

#- 170 UpdatePlatformEntitlementConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformEntitlementConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Xbox' \
    --body '{"allowedPlatformOrigins": ["System", "Oculus", "Other"]}' \
    > test.out 2>&1
eval_tap $? 170 'UpdatePlatformEntitlementConfig' test.out

#- 171 GetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Playstation' \
    > test.out 2>&1
eval_tap $? 171 'GetPlatformWalletConfig' test.out

#- 172 UpdatePlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Steam' \
    --body '{"allowedBalanceOrigins": ["Twitch", "Steam", "Nintendo"]}' \
    > test.out 2>&1
eval_tap $? 172 'UpdatePlatformWalletConfig' test.out

#- 173 ResetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform resetPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Other' \
    > test.out 2>&1
eval_tap $? 173 'ResetPlatformWalletConfig' test.out

#- 174 GetRevocationConfig
./ng net.accelbyte.sdk.cli.Main platform getRevocationConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 174 'GetRevocationConfig' test.out

#- 175 UpdateRevocationConfig
./ng net.accelbyte.sdk.cli.Main platform updateRevocationConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"entitlement": {"consumable": {"enabled": true, "strategy": "REVOKE_OR_REPORT"}, "durable": {"enabled": false, "strategy": "CUSTOM"}}, "wallet": {"enabled": false, "strategy": "CUSTOM"}}' \
    > test.out 2>&1
eval_tap $? 175 'UpdateRevocationConfig' test.out

#- 176 DeleteRevocationConfig
./ng net.accelbyte.sdk.cli.Main platform deleteRevocationConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 176 'DeleteRevocationConfig' test.out

#- 177 QueryRevocationHistories
./ng net.accelbyte.sdk.cli.Main platform queryRevocationHistories \
    --namespace "$AB_NAMESPACE" \
    --endTime 'b35NkX4u' \
    --limit '57' \
    --offset '31' \
    --source 'OTHER' \
    --startTime 'r7vOcKBN' \
    --status 'FAIL' \
    --transactionId 'KYy5ZpSQ' \
    --userId 'n3QMkgQb' \
    > test.out 2>&1
eval_tap $? 177 'QueryRevocationHistories' test.out

#- 178 GetRevocationPluginConfig
./ng net.accelbyte.sdk.cli.Main platform getRevocationPluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 178 'GetRevocationPluginConfig' test.out

#- 179 UpdateRevocationPluginConfig
./ng net.accelbyte.sdk.cli.Main platform updateRevocationPluginConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appConfig": {"appName": "gXHSOTPJ"}, "customConfig": {"connectionType": "INSECURE", "grpcServerAddress": "vSrkf4rv"}, "extendType": "CUSTOM"}' \
    > test.out 2>&1
eval_tap $? 179 'UpdateRevocationPluginConfig' test.out

#- 180 DeleteRevocationPluginConfig
./ng net.accelbyte.sdk.cli.Main platform deleteRevocationPluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 180 'DeleteRevocationPluginConfig' test.out

#- 181 UploadRevocationPluginConfigCert
./ng net.accelbyte.sdk.cli.Main platform uploadRevocationPluginConfigCert \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 181 'UploadRevocationPluginConfigCert' test.out

#- 182 CreateReward
./ng net.accelbyte.sdk.cli.Main platform createReward \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "ixbNPEWt", "eventTopic": "FsbTfUaA", "maxAwarded": 83, "maxAwardedPerUser": 30, "namespaceExpression": "CIf8x0Ym", "rewardCode": "2pneHFO9", "rewardConditions": [{"condition": "oxz1bUjc", "conditionName": "aMPOo8Ud", "eventName": "UeSWoBVS", "rewardItems": [{"duration": 98, "endDate": "1993-12-23T00:00:00Z", "identityType": "ITEM_ID", "itemId": "sXSdyDCY", "quantity": 96, "sku": "1Wy0RHdD"}, {"duration": 76, "endDate": "1973-11-09T00:00:00Z", "identityType": "ITEM_ID", "itemId": "NC9gLscu", "quantity": 57, "sku": "YauAfQy0"}, {"duration": 29, "endDate": "1977-02-18T00:00:00Z", "identityType": "ITEM_ID", "itemId": "xtnj7ahH", "quantity": 69, "sku": "m2kd0fen"}]}, {"condition": "H0dacr4c", "conditionName": "olmof2Ed", "eventName": "VxAY0BBq", "rewardItems": [{"duration": 76, "endDate": "1985-03-01T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "YJfOTmR0", "quantity": 54, "sku": "BsvoNCJw"}, {"duration": 85, "endDate": "1992-01-21T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "iEvgnxGQ", "quantity": 15, "sku": "zPt5oUgL"}, {"duration": 98, "endDate": "1994-01-10T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "Q9wZFaFV", "quantity": 8, "sku": "7qHDg9cl"}]}, {"condition": "j5hwTL0j", "conditionName": "qzCzx6cJ", "eventName": "G1hRZ2fM", "rewardItems": [{"duration": 3, "endDate": "1980-03-03T00:00:00Z", "identityType": "ITEM_ID", "itemId": "v07JodXA", "quantity": 49, "sku": "8EmIlsn0"}, {"duration": 22, "endDate": "1984-02-17T00:00:00Z", "identityType": "ITEM_ID", "itemId": "9XRNJq08", "quantity": 84, "sku": "kaKOBK52"}, {"duration": 77, "endDate": "1987-01-10T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "2VpUMMZB", "quantity": 38, "sku": "4K4W8Wyp"}]}], "userIdExpression": "WLdyor0E"}' \
    > test.out 2>&1
eval_tap $? 182 'CreateReward' test.out

#- 183 QueryRewards
./ng net.accelbyte.sdk.cli.Main platform queryRewards \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'V6W77nxF' \
    --limit '21' \
    --offset '63' \
    --sortBy 'namespace:desc,namespace' \
    > test.out 2>&1
eval_tap $? 183 'QueryRewards' test.out

#- 184 ExportRewards
./ng net.accelbyte.sdk.cli.Main platform exportRewards \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 184 'ExportRewards' test.out

#- 185 ImportRewards
./ng net.accelbyte.sdk.cli.Main platform importRewards \
    --namespace "$AB_NAMESPACE" \
    --replaceExisting  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 185 'ImportRewards' test.out

#- 186 GetReward
./ng net.accelbyte.sdk.cli.Main platform getReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId '7RSexZRt' \
    > test.out 2>&1
eval_tap $? 186 'GetReward' test.out

#- 187 UpdateReward
./ng net.accelbyte.sdk.cli.Main platform updateReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'oijFlmVh' \
    --body '{"description": "o91er94v", "eventTopic": "NVsOlIS9", "maxAwarded": 10, "maxAwardedPerUser": 22, "namespaceExpression": "G4hYw6fM", "rewardCode": "2sbTU3JF", "rewardConditions": [{"condition": "V5KSVfTB", "conditionName": "PL2WWWp8", "eventName": "daalRXvv", "rewardItems": [{"duration": 94, "endDate": "1977-09-14T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "UGq5DNAI", "quantity": 24, "sku": "UdEXN9ZZ"}, {"duration": 56, "endDate": "1977-08-15T00:00:00Z", "identityType": "ITEM_ID", "itemId": "19UQFKGM", "quantity": 75, "sku": "jTCZLWFk"}, {"duration": 35, "endDate": "1982-05-27T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "dhQN6dJB", "quantity": 7, "sku": "utgnxOzB"}]}, {"condition": "rCnDsk0V", "conditionName": "9vz8Rv7M", "eventName": "Vlr6TEmS", "rewardItems": [{"duration": 4, "endDate": "1979-01-26T00:00:00Z", "identityType": "ITEM_ID", "itemId": "NmBngNE5", "quantity": 65, "sku": "3x6qwnYg"}, {"duration": 10, "endDate": "1982-08-26T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "6n6uFQQI", "quantity": 9, "sku": "6u9Tivcy"}, {"duration": 99, "endDate": "1993-11-28T00:00:00Z", "identityType": "ITEM_ID", "itemId": "P3XROpCZ", "quantity": 21, "sku": "5JGzDYrW"}]}, {"condition": "HKIwBSOl", "conditionName": "opOQiPem", "eventName": "VFFbW7o4", "rewardItems": [{"duration": 19, "endDate": "1999-07-02T00:00:00Z", "identityType": "ITEM_ID", "itemId": "LqJ9Dsm2", "quantity": 4, "sku": "H4tkTAay"}, {"duration": 87, "endDate": "1979-01-27T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "HaJ2LunT", "quantity": 44, "sku": "hkMGa7ds"}, {"duration": 62, "endDate": "1995-01-09T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "vVvG6aDh", "quantity": 81, "sku": "DrS2eYgq"}]}], "userIdExpression": "2exGSQSX"}' \
    > test.out 2>&1
eval_tap $? 187 'UpdateReward' test.out

#- 188 DeleteReward
./ng net.accelbyte.sdk.cli.Main platform deleteReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'A9kuV5c1' \
    > test.out 2>&1
eval_tap $? 188 'DeleteReward' test.out

#- 189 CheckEventCondition
./ng net.accelbyte.sdk.cli.Main platform checkEventCondition \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'PwG7vcOn' \
    --body '{"payload": {"FFDxo9gK": {}, "cmb1DGpb": {}, "H6hasrve": {}}}' \
    > test.out 2>&1
eval_tap $? 189 'CheckEventCondition' test.out

#- 190 DeleteRewardConditionRecord
./ng net.accelbyte.sdk.cli.Main platform deleteRewardConditionRecord \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'RYevT32H' \
    --body '{"conditionName": "vB9vhjTT", "userId": "gtC2lzOi"}' \
    > test.out 2>&1
eval_tap $? 190 'DeleteRewardConditionRecord' test.out

#- 191 QuerySections
./ng net.accelbyte.sdk.cli.Main platform querySections \
    --namespace "$AB_NAMESPACE" \
    --end 'o0s7JXQx' \
    --limit '56' \
    --offset '88' \
    --start '68bgxniC' \
    --storeId 'gS4PEwJQ' \
    --viewId 'lmFPGjC4' \
    > test.out 2>&1
eval_tap $? 191 'QuerySections' test.out

#- 192 CreateSection
./ng net.accelbyte.sdk.cli.Main platform createSection \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Q2W4dhfJ' \
    --body '{"active": true, "displayOrder": 73, "endDate": "1985-08-30T00:00:00Z", "ext": {"jOr6Jpc8": {}, "oSr7oF4A": {}, "au4KFBi2": {}}, "fixedPeriodRotationConfig": {"backfillType": "NONE", "duration": 30, "itemCount": 80, "rule": "SEQUENCE"}, "items": [{"id": "MB43YrMm", "sku": "VaanXUEh"}, {"id": "i2um4Wu7", "sku": "fG2CAxEv"}, {"id": "KWCk8V5d", "sku": "umS0SPtp"}], "localizations": {"IwAWPvUc": {"description": "SVhFDcfB", "localExt": {"qzqYoNoB": {}, "xhzw0VsL": {}, "N4GgRa6H": {}}, "longDescription": "VUzPdd3s", "title": "2wVkqzTG"}, "Ll76tGXr": {"description": "ijMUlxJt", "localExt": {"9IXOvdGZ": {}, "Lc6mfdKe": {}, "DlVhy39M": {}}, "longDescription": "gfiaw20D", "title": "fu8QjdQA"}, "wfSjK3UA": {"description": "VPP8nOQw", "localExt": {"TfcJXVJb": {}, "4NduYxkM": {}, "tr0jaPD6": {}}, "longDescription": "E6kYyusu", "title": "aUtBHN7Y"}}, "name": "lTw886t3", "rotationType": "CUSTOM", "startDate": "1978-04-30T00:00:00Z", "viewId": "5QsxTErq"}' \
    > test.out 2>&1
eval_tap $? 192 'CreateSection' test.out

#- 193 PurgeExpiredSection
./ng net.accelbyte.sdk.cli.Main platform purgeExpiredSection \
    --namespace "$AB_NAMESPACE" \
    --storeId 'uDKeTqP7' \
    > test.out 2>&1
eval_tap $? 193 'PurgeExpiredSection' test.out

#- 194 GetSection
./ng net.accelbyte.sdk.cli.Main platform getSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'UuRuR4gm' \
    --storeId '9xReiPpy' \
    > test.out 2>&1
eval_tap $? 194 'GetSection' test.out

#- 195 UpdateSection
./ng net.accelbyte.sdk.cli.Main platform updateSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'LJCkv9YU' \
    --storeId 'QkLygvBx' \
    --body '{"active": false, "displayOrder": 33, "endDate": "1975-09-05T00:00:00Z", "ext": {"OCS3JkLb": {}, "rVZ49k1E": {}, "HnnAS2fc": {}}, "fixedPeriodRotationConfig": {"backfillType": "NONE", "duration": 98, "itemCount": 91, "rule": "SEQUENCE"}, "items": [{"id": "SF1SLlz3", "sku": "vWIB95y3"}, {"id": "fwdEvvnr", "sku": "BnLB7bgt"}, {"id": "kSgU4oZ9", "sku": "sGgsMfXX"}], "localizations": {"5DCDyPpD": {"description": "6StciOvm", "localExt": {"bctZzNzb": {}, "al2oqv7A": {}, "XYhX2hOt": {}}, "longDescription": "kOjsxofC", "title": "bPys8lVm"}, "8es1747S": {"description": "59bmVFE0", "localExt": {"e5L1uZAi": {}, "bYFRGlh8": {}, "z6NUfPyp": {}}, "longDescription": "E5vzVOwH", "title": "MHaIUEFn"}, "b1Jtbf0c": {"description": "DDtHBWtZ", "localExt": {"8U85baGe": {}, "1OI4zk59": {}, "SRMuXU7G": {}}, "longDescription": "p36V2KfP", "title": "OBuyIykg"}}, "name": "23tn53Ut", "rotationType": "NONE", "startDate": "1994-06-15T00:00:00Z", "viewId": "28Um0xhW"}' \
    > test.out 2>&1
eval_tap $? 195 'UpdateSection' test.out

#- 196 DeleteSection
./ng net.accelbyte.sdk.cli.Main platform deleteSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'kNlszJ2z' \
    --storeId 'cQ111kxC' \
    > test.out 2>&1
eval_tap $? 196 'DeleteSection' test.out

#- 197 ListStores
./ng net.accelbyte.sdk.cli.Main platform listStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 197 'ListStores' test.out

#- 198 CreateStore
./ng net.accelbyte.sdk.cli.Main platform createStore \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultLanguage": "AbqxErzU", "defaultRegion": "sj1EGJ81", "description": "eZ372LRt", "supportedLanguages": ["xcz3zpuY", "nTrSbzy4", "aUSpMDZw"], "supportedRegions": ["LKP9qSFa", "s3M0qHBP", "eJU8KxYE"], "title": "ZPwSzmcK"}' \
    > test.out 2>&1
eval_tap $? 198 'CreateStore' test.out

#- 199 GetCatalogDefinition
./ng net.accelbyte.sdk.cli.Main platform getCatalogDefinition \
    --namespace "$AB_NAMESPACE" \
    --catalogType 'APP' \
    > test.out 2>&1
eval_tap $? 199 'GetCatalogDefinition' test.out

#- 200 DownloadCSVTemplates
./ng net.accelbyte.sdk.cli.Main platform downloadCSVTemplates \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 200 'DownloadCSVTemplates' test.out

#- 201 ExportStoreByCSV
./ng net.accelbyte.sdk.cli.Main platform exportStoreByCSV \
    --namespace "$AB_NAMESPACE" \
    --body '{"catalogType": "ITEM", "fieldsToBeIncluded": ["4bJ7KkfB", "9GE8F2F5", "nilcIVoF"], "idsToBeExported": ["iRadcqlW", "ennYvQIO", "XjVFZywD"], "storeId": "WeBXAjoB"}' \
    > test.out 2>&1
eval_tap $? 201 'ExportStoreByCSV' test.out

#- 202 ImportStore
eval_tap 0 202 'ImportStore # SKIP deprecated' test.out

#- 203 GetPublishedStore
./ng net.accelbyte.sdk.cli.Main platform getPublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 203 'GetPublishedStore' test.out

#- 204 DeletePublishedStore
./ng net.accelbyte.sdk.cli.Main platform deletePublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 204 'DeletePublishedStore' test.out

#- 205 GetPublishedStoreBackup
./ng net.accelbyte.sdk.cli.Main platform getPublishedStoreBackup \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 205 'GetPublishedStoreBackup' test.out

#- 206 RollbackPublishedStore
./ng net.accelbyte.sdk.cli.Main platform rollbackPublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 206 'RollbackPublishedStore' test.out

#- 207 GetStore
./ng net.accelbyte.sdk.cli.Main platform getStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'XhBfGVNO' \
    > test.out 2>&1
eval_tap $? 207 'GetStore' test.out

#- 208 UpdateStore
./ng net.accelbyte.sdk.cli.Main platform updateStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'eoiSxCjo' \
    --body '{"defaultLanguage": "dhwWhN5j", "defaultRegion": "a4SWSKho", "description": "ZRuXdrAr", "supportedLanguages": ["AfVYxEpw", "quXNjeSG", "chjVKt4z"], "supportedRegions": ["12YKrmKR", "4WcX7fj9", "T2Iykolh"], "title": "HnaupIk7"}' \
    > test.out 2>&1
eval_tap $? 208 'UpdateStore' test.out

#- 209 DeleteStore
./ng net.accelbyte.sdk.cli.Main platform deleteStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'nV49MTgS' \
    > test.out 2>&1
eval_tap $? 209 'DeleteStore' test.out

#- 210 QueryChanges
./ng net.accelbyte.sdk.cli.Main platform queryChanges \
    --namespace "$AB_NAMESPACE" \
    --storeId '4BvW9FvI' \
    --action 'DELETE' \
    --itemSku 'jkPXSZhn' \
    --itemType 'COINS' \
    --limit '89' \
    --offset '94' \
    --selected  \
    --sortBy 'updatedAt,createdAt:desc' \
    --status 'PUBLISHED' \
    --type 'STORE' \
    --updatedAtEnd 'm5tsIx3f' \
    --updatedAtStart 'us8fHgSi' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 210 'QueryChanges' test.out

#- 211 PublishAll
./ng net.accelbyte.sdk.cli.Main platform publishAll \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Y6TFhv2H' \
    > test.out 2>&1
eval_tap $? 211 'PublishAll' test.out

#- 212 PublishSelected
./ng net.accelbyte.sdk.cli.Main platform publishSelected \
    --namespace "$AB_NAMESPACE" \
    --storeId 'dYvBNPDD' \
    > test.out 2>&1
eval_tap $? 212 'PublishSelected' test.out

#- 213 SelectAllRecords
./ng net.accelbyte.sdk.cli.Main platform selectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Ns4Jha4s' \
    > test.out 2>&1
eval_tap $? 213 'SelectAllRecords' test.out

#- 214 SelectAllRecordsByCriteria
./ng net.accelbyte.sdk.cli.Main platform selectAllRecordsByCriteria \
    --namespace "$AB_NAMESPACE" \
    --storeId 'pjcnEuFY' \
    --action 'DELETE' \
    --itemSku 'Q6msrijU' \
    --itemType 'CODE' \
    --selected  \
    --type 'STORE' \
    --updatedAtEnd 'ZFBkk671' \
    --updatedAtStart '3zkA0O8P' \
    > test.out 2>&1
eval_tap $? 214 'SelectAllRecordsByCriteria' test.out

#- 215 GetStatistic
./ng net.accelbyte.sdk.cli.Main platform getStatistic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'HLljdKkC' \
    --action 'CREATE' \
    --itemSku 'jlBwAMKv' \
    --itemType 'CODE' \
    --type 'STORE' \
    --updatedAtEnd 'L1BzpoeL' \
    --updatedAtStart 'PcvkV1Qz' \
    > test.out 2>&1
eval_tap $? 215 'GetStatistic' test.out

#- 216 UnselectAllRecords
./ng net.accelbyte.sdk.cli.Main platform unselectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'VbOOLN5o' \
    > test.out 2>&1
eval_tap $? 216 'UnselectAllRecords' test.out

#- 217 SelectRecord
./ng net.accelbyte.sdk.cli.Main platform selectRecord \
    --changeId 'DLihXO2b' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'e53zYcYS' \
    > test.out 2>&1
eval_tap $? 217 'SelectRecord' test.out

#- 218 UnselectRecord
./ng net.accelbyte.sdk.cli.Main platform unselectRecord \
    --changeId 'PX6mkvpw' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'veIi7SUx' \
    > test.out 2>&1
eval_tap $? 218 'UnselectRecord' test.out

#- 219 CloneStore
./ng net.accelbyte.sdk.cli.Main platform cloneStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ARvlh4Xr' \
    --targetStoreId '6INi1jtj' \
    > test.out 2>&1
eval_tap $? 219 'CloneStore' test.out

#- 220 ExportStore
eval_tap 0 220 'ExportStore # SKIP deprecated' test.out

#- 221 QueryImportHistory
./ng net.accelbyte.sdk.cli.Main platform queryImportHistory \
    --namespace "$AB_NAMESPACE" \
    --storeId 'lBi1VrWR' \
    --end 'x8cd5b62' \
    --limit '37' \
    --offset '32' \
    --sortBy 'tSLuMow1' \
    --start 'Lzlw8jsG' \
    --success  \
    > test.out 2>&1
eval_tap $? 221 'QueryImportHistory' test.out

#- 222 ImportStoreByCSV
./ng net.accelbyte.sdk.cli.Main platform importStoreByCSV \
    --namespace "$AB_NAMESPACE" \
    --storeId 'jaGjBvZV' \
    --category 'tmp.dat' \
    --display 'tmp.dat' \
    --item 'tmp.dat' \
    --notes 'IoGj2z9F' \
    --section 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 222 'ImportStoreByCSV' test.out

#- 223 QuerySubscriptions
./ng net.accelbyte.sdk.cli.Main platform querySubscriptions \
    --namespace "$AB_NAMESPACE" \
    --chargeStatus 'SETUP' \
    --itemId 'hK4yBOSf' \
    --limit '24' \
    --offset '53' \
    --sku 'Zs5xKBlH' \
    --status 'EXPIRED' \
    --subscribedBy 'USER' \
    --userId 'eouPGUgI' \
    > test.out 2>&1
eval_tap $? 223 'QuerySubscriptions' test.out

#- 224 RecurringChargeSubscription
./ng net.accelbyte.sdk.cli.Main platform recurringChargeSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'GEztBfuQ' \
    > test.out 2>&1
eval_tap $? 224 'RecurringChargeSubscription' test.out

#- 225 GetTicketDynamic
./ng net.accelbyte.sdk.cli.Main platform getTicketDynamic \
    --boothName 'm2hDTkAl' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 225 'GetTicketDynamic' test.out

#- 226 DecreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform decreaseTicketSale \
    --boothName 'Db8qly9t' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "x3qZv55K"}' \
    > test.out 2>&1
eval_tap $? 226 'DecreaseTicketSale' test.out

#- 227 GetTicketBoothID
./ng net.accelbyte.sdk.cli.Main platform getTicketBoothID \
    --boothName 'Zw5xIKeR' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 227 'GetTicketBoothID' test.out

#- 228 IncreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform increaseTicketSale \
    --boothName 'B4aXxKCL' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 16, "orderNo": "bmbTyv88"}' \
    > test.out 2>&1
eval_tap $? 228 'IncreaseTicketSale' test.out

#- 229 Commit
./ng net.accelbyte.sdk.cli.Main platform commit \
    --namespace "$AB_NAMESPACE" \
    --body '{"actions": [{"operations": [{"creditPayload": {"balanceOrigin": "Oculus", "count": 12, "currencyCode": "Ld88NPuG", "expireAt": "1997-09-15T00:00:00Z"}, "debitPayload": {"count": 29, "currencyCode": "ZCnx1B31", "walletPlatform": "Oculus"}, "fulFillItemPayload": {"count": 35, "entitlementCollectionId": "25d7kOpD", "entitlementOrigin": "Steam", "itemIdentity": "41B6tX2e", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 17, "entitlementId": "xwK85YD3"}, "type": "CREDIT_WALLET"}, {"creditPayload": {"balanceOrigin": "Epic", "count": 86, "currencyCode": "j3DQeVd9", "expireAt": "1991-01-17T00:00:00Z"}, "debitPayload": {"count": 71, "currencyCode": "2l92GCqN", "walletPlatform": "Other"}, "fulFillItemPayload": {"count": 55, "entitlementCollectionId": "PMigJApk", "entitlementOrigin": "Epic", "itemIdentity": "u3Du3Y05", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 42, "entitlementId": "Ofy4EHPt"}, "type": "FULFILL_ITEM"}, {"creditPayload": {"balanceOrigin": "GooglePlay", "count": 80, "currencyCode": "cdQKSlK0", "expireAt": "1995-06-09T00:00:00Z"}, "debitPayload": {"count": 73, "currencyCode": "aSbQj5rj", "walletPlatform": "Epic"}, "fulFillItemPayload": {"count": 38, "entitlementCollectionId": "chAYmvZx", "entitlementOrigin": "Oculus", "itemIdentity": "8SaH9Zci", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 24, "entitlementId": "Moppc7d5"}, "type": "CREDIT_WALLET"}], "userId": "UwxVXyeB"}, {"operations": [{"creditPayload": {"balanceOrigin": "Oculus", "count": 33, "currencyCode": "CnZLk0Uw", "expireAt": "1986-06-27T00:00:00Z"}, "debitPayload": {"count": 40, "currencyCode": "V7Msjep2", "walletPlatform": "Playstation"}, "fulFillItemPayload": {"count": 35, "entitlementCollectionId": "25SM8bOV", "entitlementOrigin": "Other", "itemIdentity": "0UpKeg2e", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 67, "entitlementId": "UuYI5bni"}, "type": "CREDIT_WALLET"}, {"creditPayload": {"balanceOrigin": "Xbox", "count": 78, "currencyCode": "VHj2yZcP", "expireAt": "1989-08-21T00:00:00Z"}, "debitPayload": {"count": 81, "currencyCode": "YXWOZzDn", "walletPlatform": "GooglePlay"}, "fulFillItemPayload": {"count": 15, "entitlementCollectionId": "VZGB6r9f", "entitlementOrigin": "Epic", "itemIdentity": "BOzv1fbx", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 18, "entitlementId": "SrGHkxjy"}, "type": "REVOKE_ENTITLEMENT"}, {"creditPayload": {"balanceOrigin": "Oculus", "count": 5, "currencyCode": "uogLEr6s", "expireAt": "1972-10-08T00:00:00Z"}, "debitPayload": {"count": 13, "currencyCode": "eRkWVCX1", "walletPlatform": "GooglePlay"}, "fulFillItemPayload": {"count": 19, "entitlementCollectionId": "rB4LmtXV", "entitlementOrigin": "Playstation", "itemIdentity": "ioeqiOC9", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 41, "entitlementId": "hkIiiuVd"}, "type": "REVOKE_ENTITLEMENT"}], "userId": "P9z9LwET"}, {"operations": [{"creditPayload": {"balanceOrigin": "GooglePlay", "count": 38, "currencyCode": "jJPrusVt", "expireAt": "1980-07-04T00:00:00Z"}, "debitPayload": {"count": 99, "currencyCode": "ByeeCp7W", "walletPlatform": "Epic"}, "fulFillItemPayload": {"count": 52, "entitlementCollectionId": "Ib0YA7cS", "entitlementOrigin": "GooglePlay", "itemIdentity": "ST90VT4T", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 88, "entitlementId": "78PGuTAm"}, "type": "DEBIT_WALLET"}, {"creditPayload": {"balanceOrigin": "Other", "count": 90, "currencyCode": "M4luLu0d", "expireAt": "1980-08-05T00:00:00Z"}, "debitPayload": {"count": 54, "currencyCode": "i7qnuhp7", "walletPlatform": "Playstation"}, "fulFillItemPayload": {"count": 69, "entitlementCollectionId": "4U6qM9qf", "entitlementOrigin": "IOS", "itemIdentity": "1aYlLtMX", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 85, "entitlementId": "8nml8S1n"}, "type": "DEBIT_WALLET"}, {"creditPayload": {"balanceOrigin": "Epic", "count": 15, "currencyCode": "bd0VvVep", "expireAt": "1974-06-24T00:00:00Z"}, "debitPayload": {"count": 12, "currencyCode": "AVgMUVjQ", "walletPlatform": "IOS"}, "fulFillItemPayload": {"count": 94, "entitlementCollectionId": "XKFZ8RDz", "entitlementOrigin": "Other", "itemIdentity": "lKKFs33H", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 53, "entitlementId": "F02zd3jA"}, "type": "CREDIT_WALLET"}], "userId": "LEDBw14z"}], "metadata": {"TwFF76oz": {}, "ADryUfdV": {}, "8SOsSWO4": {}}, "needPreCheck": true, "transactionId": "IxNfIKFy", "type": "gWTNxwRQ"}' \
    > test.out 2>&1
eval_tap $? 229 'Commit' test.out

#- 230 GetTradeHistoryByCriteria
./ng net.accelbyte.sdk.cli.Main platform getTradeHistoryByCriteria \
    --namespace "$AB_NAMESPACE" \
    --limit '15' \
    --offset '72' \
    --status 'INIT' \
    --type 'CkyNycqW' \
    --userId 'M5Ps4Wgm' \
    > test.out 2>&1
eval_tap $? 230 'GetTradeHistoryByCriteria' test.out

#- 231 GetTradeHistoryByTransactionId
./ng net.accelbyte.sdk.cli.Main platform getTradeHistoryByTransactionId \
    --namespace "$AB_NAMESPACE" \
    --transactionId 'XftGu7rl' \
    > test.out 2>&1
eval_tap $? 231 'GetTradeHistoryByTransactionId' test.out

#- 232 UnlockSteamUserAchievement
./ng net.accelbyte.sdk.cli.Main platform unlockSteamUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'gQkakwyj' \
    --body '{"achievements": [{"id": "af0dOmjh", "value": 65}, {"id": "kCCofO2S", "value": 41}, {"id": "Sx8Pj95O", "value": 65}], "steamUserId": "IKeQvMoy"}' \
    > test.out 2>&1
eval_tap $? 232 'UnlockSteamUserAchievement' test.out

#- 233 GetXblUserAchievements
./ng net.accelbyte.sdk.cli.Main platform getXblUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'bFq5TMEa' \
    --xboxUserId 'M43bPX9c' \
    > test.out 2>&1
eval_tap $? 233 'GetXblUserAchievements' test.out

#- 234 UpdateXblUserAchievement
./ng net.accelbyte.sdk.cli.Main platform updateXblUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId '87taEdgx' \
    --body '{"achievements": [{"id": "0nstZskw", "percentComplete": 77}, {"id": "QTuUX4Q0", "percentComplete": 58}, {"id": "NPDgzRN1", "percentComplete": 30}], "serviceConfigId": "vZV1vrRt", "titleId": "PuxAThEF", "xboxUserId": "kmOHJ8G2"}' \
    > test.out 2>&1
eval_tap $? 234 'UpdateXblUserAchievement' test.out

#- 235 AnonymizeCampaign
./ng net.accelbyte.sdk.cli.Main platform anonymizeCampaign \
    --namespace "$AB_NAMESPACE" \
    --userId 'yk7A1yIR' \
    > test.out 2>&1
eval_tap $? 235 'AnonymizeCampaign' test.out

#- 236 AnonymizeEntitlement
./ng net.accelbyte.sdk.cli.Main platform anonymizeEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'WK9FwM6y' \
    > test.out 2>&1
eval_tap $? 236 'AnonymizeEntitlement' test.out

#- 237 AnonymizeFulfillment
./ng net.accelbyte.sdk.cli.Main platform anonymizeFulfillment \
    --namespace "$AB_NAMESPACE" \
    --userId '5F4k4LEZ' \
    > test.out 2>&1
eval_tap $? 237 'AnonymizeFulfillment' test.out

#- 238 AnonymizeIntegration
./ng net.accelbyte.sdk.cli.Main platform anonymizeIntegration \
    --namespace "$AB_NAMESPACE" \
    --userId 'HPI3ceA9' \
    > test.out 2>&1
eval_tap $? 238 'AnonymizeIntegration' test.out

#- 239 AnonymizeOrder
./ng net.accelbyte.sdk.cli.Main platform anonymizeOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'T6coa82a' \
    > test.out 2>&1
eval_tap $? 239 'AnonymizeOrder' test.out

#- 240 AnonymizePayment
./ng net.accelbyte.sdk.cli.Main platform anonymizePayment \
    --namespace "$AB_NAMESPACE" \
    --userId 'pnm9VqeB' \
    > test.out 2>&1
eval_tap $? 240 'AnonymizePayment' test.out

#- 241 AnonymizeRevocation
./ng net.accelbyte.sdk.cli.Main platform anonymizeRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId '7nQDgMqf' \
    > test.out 2>&1
eval_tap $? 241 'AnonymizeRevocation' test.out

#- 242 AnonymizeSubscription
./ng net.accelbyte.sdk.cli.Main platform anonymizeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'TB9hNwpw' \
    > test.out 2>&1
eval_tap $? 242 'AnonymizeSubscription' test.out

#- 243 AnonymizeWallet
./ng net.accelbyte.sdk.cli.Main platform anonymizeWallet \
    --namespace "$AB_NAMESPACE" \
    --userId 'Vvai5qVb' \
    > test.out 2>&1
eval_tap $? 243 'AnonymizeWallet' test.out

#- 244 GetUserDLCByPlatform
./ng net.accelbyte.sdk.cli.Main platform getUserDLCByPlatform \
    --namespace "$AB_NAMESPACE" \
    --userId 'aFTo8dKB' \
    --type 'XBOX' \
    > test.out 2>&1
eval_tap $? 244 'GetUserDLCByPlatform' test.out

#- 245 GetUserDLC
./ng net.accelbyte.sdk.cli.Main platform getUserDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'gbxq9QHn' \
    --includeAllNamespaces  \
    --status 'REVOKE_FAILED' \
    --type 'STEAM' \
    > test.out 2>&1
eval_tap $? 245 'GetUserDLC' test.out

#- 246 QueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'kBPplgdQ' \
    --activeOnly  \
    --appType 'GAME' \
    --collectionId 'oiyMQ6Hd' \
    --entitlementClazz 'MEDIA' \
    --entitlementName 'oj7HknI6' \
    --features 'iZ5TskHf,65nq5ycY,y57w2pnQ' \
    --fuzzyMatchName  \
    --ignoreActiveDate  \
    --itemId 'pQHi6hgB,QageQb3S,kq4Ntxmf' \
    --limit '76' \
    --offset '46' \
    --origin 'Twitch' \
    > test.out 2>&1
eval_tap $? 246 'QueryUserEntitlements' test.out

#- 247 GrantUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform grantUserEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'XmvChQkM' \
    --body '[{"collectionId": "olLmFSBX", "endDate": "1979-02-13T00:00:00Z", "grantedCode": "kq7zC5pk", "itemId": "X2JwzK6i", "itemNamespace": "LJCey115", "language": "DBqy", "metadata": {"xTJ9O48C": {}, "cXg9qB3L": {}, "wXGjB6xk": {}}, "origin": "System", "quantity": 92, "region": "pZ5OcGkF", "source": "REFERRAL_BONUS", "startDate": "1972-07-04T00:00:00Z", "storeId": "qu7bmIgD"}, {"collectionId": "ldaWV9c8", "endDate": "1993-09-28T00:00:00Z", "grantedCode": "QWgqa7k9", "itemId": "Dsbx2vtx", "itemNamespace": "i45zuttX", "language": "Rl", "metadata": {"TwueNafo": {}, "CMufkA09": {}, "j9qqj9jL": {}}, "origin": "Oculus", "quantity": 98, "region": "5oUPohbl", "source": "REDEEM_CODE", "startDate": "1985-06-01T00:00:00Z", "storeId": "lzmxNvkf"}, {"collectionId": "iVNJP1Bk", "endDate": "1995-09-06T00:00:00Z", "grantedCode": "bw1ZwntD", "itemId": "wtiwzmss", "itemNamespace": "w5TD9m37", "language": "JvQi-AFBU", "metadata": {"HhETFpDq": {}, "ejYDLvB4": {}, "3AOE0UzE": {}}, "origin": "GooglePlay", "quantity": 21, "region": "MKlwHHLR", "source": "REFERRAL_BONUS", "startDate": "1978-04-11T00:00:00Z", "storeId": "UvO3T8AH"}]' \
    > test.out 2>&1
eval_tap $? 247 'GrantUserEntitlement' test.out

#- 248 GetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'FXEJot4W' \
    --activeOnly  \
    --appId '7oELgKKI' \
    > test.out 2>&1
eval_tap $? 248 'GetUserAppEntitlementByAppId' test.out

#- 249 QueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'oggYpqaZ' \
    --activeOnly  \
    --limit '17' \
    --offset '17' \
    --appType 'DEMO' \
    > test.out 2>&1
eval_tap $? 249 'QueryUserEntitlementsByAppType' test.out

#- 250 GetUserEntitlementsByIds
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementsByIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'idQnLdIT' \
    --ids 'H07IsWs2,EgWkYIET,mpUhs5Lq' \
    > test.out 2>&1
eval_tap $? 250 'GetUserEntitlementsByIds' test.out

#- 251 GetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'R0hDupfx' \
    --activeOnly  \
    --entitlementClazz 'ENTITLEMENT' \
    --platform 'SXvASvyy' \
    --itemId 'Yf9NWiCl' \
    > test.out 2>&1
eval_tap $? 251 'GetUserEntitlementByItemId' test.out

#- 252 GetUserActiveEntitlementsByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserActiveEntitlementsByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'mNMhY4jH' \
    --ids 'fgfTes5O,W2Dcmgqs,Uk6IaliQ' \
    --platform 'oGHpSTij' \
    > test.out 2>&1
eval_tap $? 252 'GetUserActiveEntitlementsByItemIds' test.out

#- 253 GetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'vKk5MzVQ' \
    --activeOnly  \
    --entitlementClazz 'APP' \
    --platform '9WiohhEx' \
    --sku 'aapmy6U9' \
    > test.out 2>&1
eval_tap $? 253 'GetUserEntitlementBySku' test.out

#- 254 ExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'BNRc9Hns' \
    --appIds 'qnJIBif0,kF05dChP,Wa2qCEHN' \
    --itemIds 't72iYIwS,YFkiuSQa,vUTKfutv' \
    --platform 'ueOcgCKm' \
    --skus 'YnGZ0KfQ,JDUg2hrg,SJcNGKZo' \
    > test.out 2>&1
eval_tap $? 254 'ExistsAnyUserActiveEntitlement' test.out

#- 255 ExistsAnyUserActiveEntitlementByItemIds
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlementByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'gQucZr2C' \
    --platform 'bwYEOq4q' \
    --itemIds 'zhX3gW27,uwLFq65E,XlKr92yz' \
    > test.out 2>&1
eval_tap $? 255 'ExistsAnyUserActiveEntitlementByItemIds' test.out

#- 256 GetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'Y1JJNloc' \
    --appId 'sqXCRHSK' \
    > test.out 2>&1
eval_tap $? 256 'GetUserAppEntitlementOwnershipByAppId' test.out

#- 257 GetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ge49YmHk' \
    --entitlementClazz 'APP' \
    --platform 'x9isbQiN' \
    --itemId 'KfAi6qj2' \
    > test.out 2>&1
eval_tap $? 257 'GetUserEntitlementOwnershipByItemId' test.out

#- 258 GetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'DuD7Itxq' \
    --ids '5LLSQRku,mjNTnmAo,UCQSSkws' \
    --platform 'pj37hqJM' \
    > test.out 2>&1
eval_tap $? 258 'GetUserEntitlementOwnershipByItemIds' test.out

#- 259 GetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZdGAsdK3' \
    --entitlementClazz 'SUBSCRIPTION' \
    --platform 'e4QvzqvF' \
    --sku '5sp4YUWw' \
    > test.out 2>&1
eval_tap $? 259 'GetUserEntitlementOwnershipBySku' test.out

#- 260 RevokeAllEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeAllEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'AI1lAHvU' \
    > test.out 2>&1
eval_tap $? 260 'RevokeAllEntitlements' test.out

#- 261 RevokeUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId '204koKT7' \
    --entitlementIds 'ngH3M6E4' \
    > test.out 2>&1
eval_tap $? 261 'RevokeUserEntitlements' test.out

#- 262 GetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlement \
    --entitlementId 'jD5EmmHO' \
    --namespace "$AB_NAMESPACE" \
    --userId 'JtNB1gdO' \
    > test.out 2>&1
eval_tap $? 262 'GetUserEntitlement' test.out

#- 263 UpdateUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform updateUserEntitlement \
    --entitlementId 'RyNav2oY' \
    --namespace "$AB_NAMESPACE" \
    --userId 'oIFKoZSE' \
    --body '{"collectionId": "LB4qZyqQ", "endDate": "1972-09-29T00:00:00Z", "nullFieldList": ["cpYGZzld", "jmP7Klk8", "ZojHXcYQ"], "origin": "Xbox", "reason": "NV48rByf", "startDate": "1972-08-17T00:00:00Z", "status": "REVOKED", "useCount": 85}' \
    > test.out 2>&1
eval_tap $? 263 'UpdateUserEntitlement' test.out

#- 264 ConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform consumeUserEntitlement \
    --entitlementId 'I3xJi6SS' \
    --namespace "$AB_NAMESPACE" \
    --userId 'P04lGrbD' \
    --body '{"metadata": {"ATbHvtER": {}, "NvfVTevi": {}, "vI3eghBM": {}}, "options": ["20zSf6RB", "UNnAhny8", "Dl6tKiEb"], "platform": "qwMXrmq2", "requestId": "pukg22s8", "useCount": 66}' \
    > test.out 2>&1
eval_tap $? 264 'ConsumeUserEntitlement' test.out

#- 265 DisableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform disableUserEntitlement \
    --entitlementId 'zzTXm3AM' \
    --namespace "$AB_NAMESPACE" \
    --userId '1PNuJB6O' \
    > test.out 2>&1
eval_tap $? 265 'DisableUserEntitlement' test.out

#- 266 EnableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform enableUserEntitlement \
    --entitlementId '3IzzikMi' \
    --namespace "$AB_NAMESPACE" \
    --userId 'H5Q2Ynjd' \
    > test.out 2>&1
eval_tap $? 266 'EnableUserEntitlement' test.out

#- 267 GetUserEntitlementHistories
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementHistories \
    --entitlementId 'eHwcnrdz' \
    --namespace "$AB_NAMESPACE" \
    --userId 'bmsNLoBg' \
    > test.out 2>&1
eval_tap $? 267 'GetUserEntitlementHistories' test.out

#- 268 RevokeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlement \
    --entitlementId '9ynbEOd0' \
    --namespace "$AB_NAMESPACE" \
    --userId 'gkTX4vgz' \
    --body '{"metadata": {"l6HzeL9Q": {}, "MqGa8czI": {}, "vu01dMzN": {}}}' \
    > test.out 2>&1
eval_tap $? 268 'RevokeUserEntitlement' test.out

#- 269 RevokeUserEntitlementByUseCount
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlementByUseCount \
    --entitlementId 'hTxe63Nv' \
    --namespace "$AB_NAMESPACE" \
    --userId 'NZ8vCmst' \
    --body '{"reason": "BIwsIcPI", "useCount": 71}' \
    > test.out 2>&1
eval_tap $? 269 'RevokeUserEntitlementByUseCount' test.out

#- 270 PreCheckRevokeUserEntitlementByUseCount
./ng net.accelbyte.sdk.cli.Main platform preCheckRevokeUserEntitlementByUseCount \
    --entitlementId 'sTgqwMy9' \
    --namespace "$AB_NAMESPACE" \
    --userId '9cAnuuk5' \
    --quantity '36' \
    > test.out 2>&1
eval_tap $? 270 'PreCheckRevokeUserEntitlementByUseCount' test.out

#- 271 RevokeUseCount
eval_tap 0 271 'RevokeUseCount # SKIP deprecated' test.out

#- 272 SellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform sellUserEntitlement \
    --entitlementId '3O6arkJn' \
    --namespace "$AB_NAMESPACE" \
    --userId 'qK1GUrAR' \
    --body '{"platform": "WrOpNLl2", "requestId": "uFPNVLTK", "useCount": 20}' \
    > test.out 2>&1
eval_tap $? 272 'SellUserEntitlement' test.out

#- 273 FulfillItem
./ng net.accelbyte.sdk.cli.Main platform fulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'bcn9A4fv' \
    --body '{"duration": 21, "endDate": "1988-08-25T00:00:00Z", "entitlementCollectionId": "Q1FrjXvo", "entitlementOrigin": "Oculus", "itemId": "AWGijOnl", "itemSku": "EdrMqPpc", "language": "ChHJmpps", "metadata": {"w3GMQhWw": {}, "WUg5YPZv": {}, "qSU80lva": {}}, "order": {"currency": {"currencyCode": "1CbbVl6I", "currencySymbol": "0AVy7UAj", "currencyType": "REAL", "decimals": 1, "namespace": "FlzJrRxV"}, "ext": {"wndNnw96": {}, "cHEl8Fvk": {}, "WCerRuFH": {}}, "free": false}, "orderNo": "VhyxwNBq", "origin": "Twitch", "overrideBundleItemQty": {"KoGjnpPy": 83, "SgfG7kFf": 94, "trlK1Zvm": 53}, "quantity": 5, "region": "wadT828V", "source": "EXPIRATION", "startDate": "1992-09-14T00:00:00Z", "storeId": "ijZWSJVj"}' \
    > test.out 2>&1
eval_tap $? 273 'FulfillItem' test.out

#- 274 RedeemCode
./ng net.accelbyte.sdk.cli.Main platform redeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'mXfazA9B' \
    --body '{"code": "jyNuUBQL", "language": "rw_xKCx", "region": "DLSIqG8U"}' \
    > test.out 2>&1
eval_tap $? 274 'RedeemCode' test.out

#- 275 PreCheckFulfillItem
./ng net.accelbyte.sdk.cli.Main platform preCheckFulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'pbzFNyhl' \
    --body '{"itemId": "481NLtMO", "itemSku": "gq2f5b2a", "quantity": 8}' \
    > test.out 2>&1
eval_tap $? 275 'PreCheckFulfillItem' test.out

#- 276 FulfillRewards
./ng net.accelbyte.sdk.cli.Main platform fulfillRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'C5EYwxmZ' \
    --body '{"entitlementCollectionId": "rKfGdnDz", "entitlementOrigin": "GooglePlay", "metadata": {"SVoRhG5e": {}, "Roi010mX": {}, "1rEWnXAJ": {}}, "origin": "Epic", "rewards": [{"currency": {"currencyCode": "8jvvc3Wu", "namespace": "CZajJbxB"}, "item": {"itemId": "9VsgEqn3", "itemName": "NuleKzxC", "itemSku": "FCTkkvNG", "itemType": "YV4TKeet"}, "quantity": 3, "type": "CURRENCY"}, {"currency": {"currencyCode": "H59D7mlC", "namespace": "jt9Kx8JJ"}, "item": {"itemId": "pn3NQk25", "itemName": "1mnPfS2T", "itemSku": "5mPxCsHh", "itemType": "hrc0BkIm"}, "quantity": 45, "type": "CURRENCY"}, {"currency": {"currencyCode": "sIGNeNfs", "namespace": "TOx9hmyk"}, "item": {"itemId": "TyhxK1zs", "itemName": "MqDnLmfY", "itemSku": "bxj5LQVB", "itemType": "R8trjvP4"}, "quantity": 28, "type": "ITEM"}], "source": "OTHER", "transactionId": "8zisOGh9"}' \
    > test.out 2>&1
eval_tap $? 276 'FulfillRewards' test.out

#- 277 QueryUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'qOH2bosx' \
    --endTime 'H8edyXCd' \
    --limit '72' \
    --offset '44' \
    --productId 'A8ZWDqOP' \
    --startTime 'dfLg3y8p' \
    --status 'VERIFIED' \
    --type 'XBOX' \
    > test.out 2>&1
eval_tap $? 277 'QueryUserIAPOrders' test.out

#- 278 QueryAllUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryAllUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'GB2HnkiE' \
    > test.out 2>&1
eval_tap $? 278 'QueryAllUserIAPOrders' test.out

#- 279 QueryUserIAPConsumeHistory
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPConsumeHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'jiuDOESF' \
    --endTime 'KGV5sbfx' \
    --limit '1' \
    --offset '100' \
    --startTime '6OSEV5cX' \
    --status 'SUCCESS' \
    --type 'APPLE' \
    > test.out 2>&1
eval_tap $? 279 'QueryUserIAPConsumeHistory' test.out

#- 280 MockFulfillIAPItem
./ng net.accelbyte.sdk.cli.Main platform mockFulfillIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId '0mQa9n9v' \
    --body '{"itemIdentityType": "ITEM_ID", "language": "zwSK-JaQM_OH", "productId": "zLi4cfRB", "region": "hXTWVVgM", "transactionId": "U4vlW3KM", "type": "STADIA"}' \
    > test.out 2>&1
eval_tap $? 280 'MockFulfillIAPItem' test.out

#- 281 QueryUserThirdPartySubscription
./ng net.accelbyte.sdk.cli.Main platform queryUserThirdPartySubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'SKdyVpuW' \
    --activeOnly  \
    --groupId 'lSSZ5jSu' \
    --limit '21' \
    --offset '77' \
    --platform 'TWITCH' \
    --productId '8s9vvR7Q' \
    > test.out 2>&1
eval_tap $? 281 'QueryUserThirdPartySubscription' test.out

#- 282 GetThirdPartyPlatformSubscriptionOwnershipByGroupId
./ng net.accelbyte.sdk.cli.Main platform getThirdPartyPlatformSubscriptionOwnershipByGroupId \
    --namespace "$AB_NAMESPACE" \
    --platform 'STADIA' \
    --userId 'Yx6Rgkkl' \
    --groupId 'TJcMWuMC' \
    > test.out 2>&1
eval_tap $? 282 'GetThirdPartyPlatformSubscriptionOwnershipByGroupId' test.out

#- 283 GetThirdPartyPlatformSubscriptionOwnershipByProductId
./ng net.accelbyte.sdk.cli.Main platform getThirdPartyPlatformSubscriptionOwnershipByProductId \
    --namespace "$AB_NAMESPACE" \
    --platform 'TWITCH' \
    --userId 'pEBx2miY' \
    --productId 'k3oUXbyQ' \
    > test.out 2>&1
eval_tap $? 283 'GetThirdPartyPlatformSubscriptionOwnershipByProductId' test.out

#- 284 QueryUserThirdPartySubscriptionTransactions
./ng net.accelbyte.sdk.cli.Main platform queryUserThirdPartySubscriptionTransactions \
    --namespace "$AB_NAMESPACE" \
    --userId '3Ip1MBFU' \
    --activeOnly  \
    --groupId '1NLJvEfR' \
    --limit '80' \
    --offset '82' \
    --platform 'STADIA' \
    --productId 'tAy9rqZR' \
    > test.out 2>&1
eval_tap $? 284 'QueryUserThirdPartySubscriptionTransactions' test.out

#- 285 GetThirdPartySubscriptionDetails
./ng net.accelbyte.sdk.cli.Main platform getThirdPartySubscriptionDetails \
    --id 'XPYaSkKC' \
    --namespace "$AB_NAMESPACE" \
    --userId 'rEY3ZOxP' \
    > test.out 2>&1
eval_tap $? 285 'GetThirdPartySubscriptionDetails' test.out

#- 286 GetSubscriptionHistory
./ng net.accelbyte.sdk.cli.Main platform getSubscriptionHistory \
    --id 'uT42baYa' \
    --namespace "$AB_NAMESPACE" \
    --userId '92BfbEqj' \
    --limit '15' \
    --offset '39' \
    > test.out 2>&1
eval_tap $? 286 'GetSubscriptionHistory' test.out

#- 287 SyncSubscriptionTransaction
./ng net.accelbyte.sdk.cli.Main platform syncSubscriptionTransaction \
    --id 'O2dbdWwQ' \
    --namespace "$AB_NAMESPACE" \
    --userId '6Uy40sF7' \
    > test.out 2>&1
eval_tap $? 287 'SyncSubscriptionTransaction' test.out

#- 288 GetThirdPartyUserSubscriptionDetails
./ng net.accelbyte.sdk.cli.Main platform getThirdPartyUserSubscriptionDetails \
    --id 'aKlPNp0s' \
    --namespace "$AB_NAMESPACE" \
    --userId 'XTRjy74Q' \
    > test.out 2>&1
eval_tap $? 288 'GetThirdPartyUserSubscriptionDetails' test.out

#- 289 SyncSubscription
./ng net.accelbyte.sdk.cli.Main platform syncSubscription \
    --id '0aZWsOsS' \
    --namespace "$AB_NAMESPACE" \
    --userId 'i397NbfY' \
    > test.out 2>&1
eval_tap $? 289 'SyncSubscription' test.out

#- 290 QueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId '0A4ZBsqr' \
    --discounted  \
    --itemId 'XzD53Nw1' \
    --limit '63' \
    --offset '4' \
    --status 'REFUND_FAILED' \
    > test.out 2>&1
eval_tap $? 290 'QueryUserOrders' test.out

#- 291 AdminCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform adminCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'ibO0hV6K' \
    --body '{"currencyCode": "eVpf4Ofj", "currencyNamespace": "Ke9I55lT", "discountCodes": ["o0mp1NZv", "GL4nWzT4", "J0yfG7wM"], "discountedPrice": 30, "entitlementPlatform": "Xbox", "ext": {"hudQOQWp": {}, "AmfdYjjy": {}, "4oOfz94Y": {}}, "itemId": "yNzUSI3u", "language": "TlMAtFss", "options": {"skipPriceValidation": false}, "platform": "Steam", "price": 85, "quantity": 0, "region": "G8d6jLs1", "returnUrl": "iGP3I1XR", "sandbox": false, "sectionId": "hIhHvIae"}' \
    > test.out 2>&1
eval_tap $? 291 'AdminCreateUserOrder' test.out

#- 292 CountOfPurchasedItem
./ng net.accelbyte.sdk.cli.Main platform countOfPurchasedItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'xqHwBE1N' \
    --itemId 'FEMX55JU' \
    > test.out 2>&1
eval_tap $? 292 'CountOfPurchasedItem' test.out

#- 293 GetUserOrder
./ng net.accelbyte.sdk.cli.Main platform getUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'vIV6rt8P' \
    --userId 'GSmQJaek' \
    > test.out 2>&1
eval_tap $? 293 'GetUserOrder' test.out

#- 294 UpdateUserOrderStatus
./ng net.accelbyte.sdk.cli.Main platform updateUserOrderStatus \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'Wuws56yj' \
    --userId 'lfamCg8L' \
    --body '{"status": "DELETED", "statusReason": "bLgqV4lq"}' \
    > test.out 2>&1
eval_tap $? 294 'UpdateUserOrderStatus' test.out

#- 295 FulfillUserOrder
./ng net.accelbyte.sdk.cli.Main platform fulfillUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'A2KLMuHq' \
    --userId 'qfeeTw12' \
    > test.out 2>&1
eval_tap $? 295 'FulfillUserOrder' test.out

#- 296 GetUserOrderGrant
eval_tap 0 296 'GetUserOrderGrant # SKIP deprecated' test.out

#- 297 GetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform getUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'VUHPfZyX' \
    --userId 'apHMPSlL' \
    > test.out 2>&1
eval_tap $? 297 'GetUserOrderHistories' test.out

#- 298 ProcessUserOrderNotification
./ng net.accelbyte.sdk.cli.Main platform processUserOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'NUbELzRu' \
    --userId 'k6WHpHh1' \
    --body '{"additionalData": {"cardSummary": "Dxou5vIX"}, "authorisedTime": "1991-11-15T00:00:00Z", "chargebackReversedTime": "1976-08-05T00:00:00Z", "chargebackTime": "1992-02-14T00:00:00Z", "chargedTime": "1986-03-13T00:00:00Z", "createdTime": "1980-02-18T00:00:00Z", "currency": {"currencyCode": "xJeHcI1Z", "currencySymbol": "rJ89U3MS", "currencyType": "VIRTUAL", "decimals": 91, "namespace": "9bVRsgvf"}, "customParameters": {"Frp4AYNG": {}, "Rk3ldBY1": {}, "xKOatwFf": {}}, "extOrderNo": "cF2z551S", "extTxId": "nNopPym6", "extUserId": "wuGXIzCp", "issuedAt": "1980-08-10T00:00:00Z", "metadata": {"bIIzx1ao": "xZU4vaLT", "oZYr2Lhv": "OlJr8eDR", "cvUbgzcs": "UQK3qnqA"}, "namespace": "q0swzijk", "nonceStr": "bKxXDvbu", "paymentData": {"discountAmount": 72, "discountCode": "SdWf9Aja", "subtotalPrice": 45, "tax": 55, "totalPrice": 22}, "paymentMethod": "IPHPfbfB", "paymentMethodFee": 19, "paymentOrderNo": "AjFfLm1x", "paymentProvider": "WALLET", "paymentProviderFee": 56, "paymentStationUrl": "b6l8sozc", "price": 46, "refundedTime": "1991-11-17T00:00:00Z", "salesTax": 8, "sandbox": true, "sku": "MfAsn0Hw", "status": "CHARGEBACK_REVERSED", "statusReason": "Ob7EeWDF", "subscriptionId": "4fMgien7", "subtotalPrice": 52, "targetNamespace": "BitmnX3W", "targetUserId": "L99GZwUe", "tax": 45, "totalPrice": 3, "totalTax": 3, "txEndTime": "1984-03-24T00:00:00Z", "type": "q4EvW3pk", "userId": "sC7yATJm", "vat": 53}' \
    > test.out 2>&1
eval_tap $? 298 'ProcessUserOrderNotification' test.out

#- 299 DownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform downloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'LOB6VvOK' \
    --userId '96f7B6OH' \
    > test.out 2>&1
eval_tap $? 299 'DownloadUserOrderReceipt' test.out

#- 300 CreateUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform createUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --userId '5AU0E4SI' \
    --body '{"currencyCode": "ZEcq6Kz5", "currencyNamespace": "jmWQzxKX", "customParameters": {"krduXdEI": {}, "cuu3xXbD": {}, "VLlze0Wq": {}}, "description": "tvD14Cu1", "extOrderNo": "jx3p16CP", "extUserId": "44IkkpGg", "itemType": "CODE", "language": "iTk_LQvZ_ki", "metadata": {"BAzSbE9n": "CFVVl3sl", "cbgJvP3b": "4fMj4QK4", "GMwPMMqn": "3kcwOgTD"}, "notifyUrl": "LcFrn3yA", "omitNotification": true, "platform": "PbsYoapc", "price": 67, "recurringPaymentOrderNo": "WYs4kA5C", "region": "VfclawGb", "returnUrl": "7mP7r7zZ", "sandbox": true, "sku": "qxM2blbB", "subscriptionId": "2x1yTmSQ", "title": "qkBGErdx"}' \
    > test.out 2>&1
eval_tap $? 300 'CreateUserPaymentOrder' test.out

#- 301 RefundUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform refundUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'QmKeMJk4' \
    --userId '2waslpp6' \
    --body '{"description": "O4NFYfTX"}' \
    > test.out 2>&1
eval_tap $? 301 'RefundUserPaymentOrder' test.out

#- 302 GetUserPlatformAccountClosureHistories
./ng net.accelbyte.sdk.cli.Main platform getUserPlatformAccountClosureHistories \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZvsmLJPu' \
    > test.out 2>&1
eval_tap $? 302 'GetUserPlatformAccountClosureHistories' test.out

#- 303 ApplyUserRedemption
./ng net.accelbyte.sdk.cli.Main platform applyUserRedemption \
    --namespace "$AB_NAMESPACE" \
    --userId 'vGSkOg69' \
    --body '{"code": "R52zwdgD", "orderNo": "RDOlwf2K"}' \
    > test.out 2>&1
eval_tap $? 303 'ApplyUserRedemption' test.out

#- 304 DoRevocation
./ng net.accelbyte.sdk.cli.Main platform doRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId 'n1tBlWDP' \
    --body '{"meta": {"2WErQI8D": {}, "RNGGdNGr": {}, "GiM0FjKP": {}}, "reason": "upiQkmM3", "revokeEntries": [{"currency": {"balanceOrigin": "Playstation", "currencyCode": "7ww8NweG", "namespace": "MeWTaDTI"}, "entitlement": {"entitlementId": "x1NL15AA"}, "item": {"entitlementOrigin": "Other", "itemIdentity": "o4AXrtt2", "itemIdentityType": "ITEM_SKU", "origin": "IOS"}, "quantity": 29, "type": "CURRENCY"}, {"currency": {"balanceOrigin": "Steam", "currencyCode": "KAQ9Ez5J", "namespace": "UUtn91z4"}, "entitlement": {"entitlementId": "orWDu1Mh"}, "item": {"entitlementOrigin": "IOS", "itemIdentity": "d9ToF7X2", "itemIdentityType": "ITEM_ID", "origin": "GooglePlay"}, "quantity": 43, "type": "CURRENCY"}, {"currency": {"balanceOrigin": "Twitch", "currencyCode": "jA3pD8nQ", "namespace": "S94EyJgD"}, "entitlement": {"entitlementId": "xZpwlWiN"}, "item": {"entitlementOrigin": "Other", "itemIdentity": "wCcDsrTZ", "itemIdentityType": "ITEM_SKU", "origin": "IOS"}, "quantity": 4, "type": "ITEM"}], "source": "DLC", "transactionId": "STUp3v0u"}' \
    > test.out 2>&1
eval_tap $? 304 'DoRevocation' test.out

#- 305 RegisterXblSessions
./ng net.accelbyte.sdk.cli.Main platform registerXblSessions \
    --namespace "$AB_NAMESPACE" \
    --userId '2tmPMwE2' \
    --body '{"gameSessionId": "UDectjEc", "payload": {"1nTjYnUC": {}, "Mc2ay3yx": {}, "pOOFR7Ry": {}}, "scid": "9A4jaGuS", "sessionTemplateName": "3W5zuv9z"}' \
    > test.out 2>&1
eval_tap $? 305 'RegisterXblSessions' test.out

#- 306 QueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform queryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'O2xMC4Tq' \
    --chargeStatus 'CHARGE_FAILED' \
    --itemId 'q6fNgpq0' \
    --limit '33' \
    --offset '62' \
    --sku 'TMtGP2d1' \
    --status 'INIT' \
    --subscribedBy 'USER' \
    > test.out 2>&1
eval_tap $? 306 'QueryUserSubscriptions' test.out

#- 307 GetUserSubscriptionActivities
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionActivities \
    --namespace "$AB_NAMESPACE" \
    --userId 'EC0Leq3q' \
    --excludeSystem  \
    --limit '34' \
    --offset '62' \
    --subscriptionId 'gAF4cB3S' \
    > test.out 2>&1
eval_tap $? 307 'GetUserSubscriptionActivities' test.out

#- 308 PlatformSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform platformSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'xlE9o7di' \
    --body '{"grantDays": 59, "itemId": "n9vrxxIk", "language": "BYTZiEzY", "reason": "MAB2SBYW", "region": "WhKeqUWN", "source": "fioWqgaj"}' \
    > test.out 2>&1
eval_tap $? 308 'PlatformSubscribeSubscription' test.out

#- 309 CheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform checkUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'F8yv3Wt7' \
    --itemId 'hDyu8ESr' \
    > test.out 2>&1
eval_tap $? 309 'CheckUserSubscriptionSubscribableByItemId' test.out

#- 310 GetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform getUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'Ea4MU9QA' \
    --userId 'Iwb3yc3j' \
    > test.out 2>&1
eval_tap $? 310 'GetUserSubscription' test.out

#- 311 DeleteUserSubscription
./ng net.accelbyte.sdk.cli.Main platform deleteUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'AkOoX7TR' \
    --userId 'OeBY1o3X' \
    > test.out 2>&1
eval_tap $? 311 'DeleteUserSubscription' test.out

#- 312 CancelSubscription
./ng net.accelbyte.sdk.cli.Main platform cancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'eZ9a2PDS' \
    --userId 'r1bdC0E8' \
    --force  \
    --body '{"immediate": false, "reason": "YDU6WfS6"}' \
    > test.out 2>&1
eval_tap $? 312 'CancelSubscription' test.out

#- 313 GrantDaysToSubscription
./ng net.accelbyte.sdk.cli.Main platform grantDaysToSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'IzJgTbf9' \
    --userId 'Y9r70W12' \
    --body '{"grantDays": 14, "reason": "2kf9UEee"}' \
    > test.out 2>&1
eval_tap $? 313 'GrantDaysToSubscription' test.out

#- 314 GetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '4FBVL9vT' \
    --userId 'rUQ5aqJ0' \
    --excludeFree  \
    --limit '32' \
    --offset '77' \
    > test.out 2>&1
eval_tap $? 314 'GetUserSubscriptionBillingHistories' test.out

#- 315 ProcessUserSubscriptionNotification
./ng net.accelbyte.sdk.cli.Main platform processUserSubscriptionNotification \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '1wMAAO76' \
    --userId '4VYzzVc6' \
    --body '{"additionalData": {"cardSummary": "Z2yP0PDV"}, "authorisedTime": "1990-09-19T00:00:00Z", "chargebackReversedTime": "1992-08-22T00:00:00Z", "chargebackTime": "1976-09-02T00:00:00Z", "chargedTime": "1972-01-24T00:00:00Z", "createdTime": "1989-12-13T00:00:00Z", "currency": {"currencyCode": "xrEuRelv", "currencySymbol": "KBY8mFp3", "currencyType": "REAL", "decimals": 78, "namespace": "akEI1S7G"}, "customParameters": {"Thm1mxRN": {}, "JZ2NW9bE": {}, "YsWNpzL4": {}}, "extOrderNo": "AXZi3vUz", "extTxId": "yqbtAUHi", "extUserId": "YWP7dZbs", "issuedAt": "1986-10-06T00:00:00Z", "metadata": {"Ea78r7C4": "RK1gaYgg", "RC0AqEKO": "ERNmv3g9", "wpRiwUbG": "b2ncp1VK"}, "namespace": "NPrIqGlR", "nonceStr": "ONW8DFrg", "paymentData": {"discountAmount": 39, "discountCode": "E65OWEM6", "subtotalPrice": 92, "tax": 15, "totalPrice": 86}, "paymentMethod": "fgsNbN0V", "paymentMethodFee": 19, "paymentOrderNo": "DG58R2aV", "paymentProvider": "ALIPAY", "paymentProviderFee": 90, "paymentStationUrl": "WKbORT8w", "price": 65, "refundedTime": "1980-11-03T00:00:00Z", "salesTax": 69, "sandbox": true, "sku": "W0ArhirZ", "status": "AUTHORISED", "statusReason": "18XZaq7b", "subscriptionId": "X4iCrMdZ", "subtotalPrice": 100, "targetNamespace": "3fuYGn8V", "targetUserId": "cJ7RB9Ta", "tax": 74, "totalPrice": 87, "totalTax": 90, "txEndTime": "1996-11-10T00:00:00Z", "type": "6BHd3YBr", "userId": "Sg4NnKPJ", "vat": 18}' \
    > test.out 2>&1
eval_tap $? 315 'ProcessUserSubscriptionNotification' test.out

#- 316 AcquireUserTicket
./ng net.accelbyte.sdk.cli.Main platform acquireUserTicket \
    --boothName 'vJjLzSoH' \
    --namespace "$AB_NAMESPACE" \
    --userId 'wOPoIwbY' \
    --body '{"count": 30, "orderNo": "GtcrcW4c"}' \
    > test.out 2>&1
eval_tap $? 316 'AcquireUserTicket' test.out

#- 317 QueryUserCurrencyWallets
./ng net.accelbyte.sdk.cli.Main platform queryUserCurrencyWallets \
    --namespace "$AB_NAMESPACE" \
    --userId 'zmz39hFs' \
    > test.out 2>&1
eval_tap $? 317 'QueryUserCurrencyWallets' test.out

#- 318 DebitUserWalletByCurrencyCode
./ng net.accelbyte.sdk.cli.Main platform debitUserWalletByCurrencyCode \
    --currencyCode 'aKw9uKjf' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ujc9xvuT' \
    --body '{"allowOverdraft": false, "amount": 55, "balanceOrigin": "IOS", "balanceSource": "TRADE", "metadata": {"8OSzGYDg": {}, "u2Kkx9p1": {}, "d1u0EI8m": {}}, "reason": "De64nPxq"}' \
    > test.out 2>&1
eval_tap $? 318 'DebitUserWalletByCurrencyCode' test.out

#- 319 ListUserCurrencyTransactions
./ng net.accelbyte.sdk.cli.Main platform listUserCurrencyTransactions \
    --currencyCode 'wlpXbnI3' \
    --namespace "$AB_NAMESPACE" \
    --userId 'We6G6eA4' \
    --limit '4' \
    --offset '33' \
    > test.out 2>&1
eval_tap $? 319 'ListUserCurrencyTransactions' test.out

#- 320 CheckBalance
./ng net.accelbyte.sdk.cli.Main platform checkBalance \
    --currencyCode '9L4DXRTv' \
    --namespace "$AB_NAMESPACE" \
    --userId 'eBwNcnRR' \
    --request '{"amount": 83, "debitBalanceSource": "ORDER_REVOCATION", "metadata": {"8vjAUncE": {}, "IMbqKcZm": {}, "qF1Fl9NI": {}}, "reason": "PBASYUWc", "walletPlatform": "Xbox"}' \
    > test.out 2>&1
eval_tap $? 320 'CheckBalance' test.out

#- 321 CheckWallet
eval_tap 0 321 'CheckWallet # SKIP deprecated' test.out

#- 322 CreditUserWallet
./ng net.accelbyte.sdk.cli.Main platform creditUserWallet \
    --currencyCode 'S63Z4CkW' \
    --namespace "$AB_NAMESPACE" \
    --userId 'EMviS1ym' \
    --body '{"amount": 51, "expireAt": "1999-10-11T00:00:00Z", "metadata": {"s4IwqSa0": {}, "KvG7bbrE": {}, "nXXOBOfR": {}}, "origin": "GooglePlay", "reason": "LAG6WFaZ", "source": "REDEEM_CODE"}' \
    > test.out 2>&1
eval_tap $? 322 'CreditUserWallet' test.out

#- 323 DebitByWalletPlatform
./ng net.accelbyte.sdk.cli.Main platform debitByWalletPlatform \
    --currencyCode '0RFEu3Ii' \
    --namespace "$AB_NAMESPACE" \
    --userId 'eopRcptF' \
    --request '{"amount": 5, "debitBalanceSource": "EXPIRATION", "metadata": {"3cBs971a": {}, "vraOjrRU": {}, "ihrmSIli": {}}, "reason": "BBrxfoOu", "walletPlatform": "Playstation"}' \
    > test.out 2>&1
eval_tap $? 323 'DebitByWalletPlatform' test.out

#- 324 PayWithUserWallet
./ng net.accelbyte.sdk.cli.Main platform payWithUserWallet \
    --currencyCode 'oNkvUjw5' \
    --namespace "$AB_NAMESPACE" \
    --userId 'nhcab4Qx' \
    --body '{"amount": 37, "metadata": {"kUxushfw": {}, "ocblTf8Q": {}, "PA754Tpe": {}}, "walletPlatform": "GooglePlay"}' \
    > test.out 2>&1
eval_tap $? 324 'PayWithUserWallet' test.out

#- 325 GetUserWallet
eval_tap 0 325 'GetUserWallet # SKIP deprecated' test.out

#- 326 DebitUserWallet
eval_tap 0 326 'DebitUserWallet # SKIP deprecated' test.out

#- 327 DisableUserWallet
eval_tap 0 327 'DisableUserWallet # SKIP deprecated' test.out

#- 328 EnableUserWallet
eval_tap 0 328 'EnableUserWallet # SKIP deprecated' test.out

#- 329 ListUserWalletTransactions
eval_tap 0 329 'ListUserWalletTransactions # SKIP deprecated' test.out

#- 330 ListViews
./ng net.accelbyte.sdk.cli.Main platform listViews \
    --namespace "$AB_NAMESPACE" \
    --storeId 'x0NT4Zna' \
    > test.out 2>&1
eval_tap $? 330 'ListViews' test.out

#- 331 CreateView
./ng net.accelbyte.sdk.cli.Main platform createView \
    --namespace "$AB_NAMESPACE" \
    --storeId 'JrwXF4sF' \
    --body '{"displayOrder": 75, "localizations": {"CSN8Hk57": {"description": "uwt86m31", "localExt": {"HpCllZh4": {}, "q0ja5rgA": {}, "BZek72YW": {}}, "longDescription": "LKcOXBSA", "title": "m27Gh62k"}, "rVcXj5dK": {"description": "ofsJyjwt", "localExt": {"H3Ulya7C": {}, "YAjETWXP": {}, "4wHf8aqD": {}}, "longDescription": "SDV5j4Qd", "title": "4wCgjew6"}, "raTEmqjU": {"description": "ksxswvyd", "localExt": {"lkqjnCbS": {}, "8Cgs1JCZ": {}, "diHPm7OW": {}}, "longDescription": "FbTHEJ2w", "title": "TtmMKvh7"}}, "name": "cEfqWREO"}' \
    > test.out 2>&1
eval_tap $? 331 'CreateView' test.out

#- 332 GetView
./ng net.accelbyte.sdk.cli.Main platform getView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'NyctqIP1' \
    --storeId 'No93hLsE' \
    > test.out 2>&1
eval_tap $? 332 'GetView' test.out

#- 333 UpdateView
./ng net.accelbyte.sdk.cli.Main platform updateView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'DqgfMmPb' \
    --storeId 'cFI3yL12' \
    --body '{"displayOrder": 93, "localizations": {"n8Y40HzI": {"description": "izMoUeoZ", "localExt": {"vOs5KHiG": {}, "T0RVPsGx": {}, "c0PNeiyG": {}}, "longDescription": "3q2do4Ij", "title": "V9oKOFHE"}, "p9ulInfu": {"description": "9Mg1IIyD", "localExt": {"198SMOYj": {}, "WB8ZPu4C": {}, "d1sb64C3": {}}, "longDescription": "dMwyUrtz", "title": "JeDIPXUN"}, "FdWE45iu": {"description": "TCvUXhcd", "localExt": {"iZsiY8BG": {}, "fb28U6G9": {}, "1GimtcXL": {}}, "longDescription": "BPvGViGY", "title": "jkG9klgr"}}, "name": "c1HUb2AJ"}' \
    > test.out 2>&1
eval_tap $? 333 'UpdateView' test.out

#- 334 DeleteView
./ng net.accelbyte.sdk.cli.Main platform deleteView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'Wy7OIcPk' \
    --storeId 'fahV0IO4' \
    > test.out 2>&1
eval_tap $? 334 'DeleteView' test.out

#- 335 QueryWallets
eval_tap 0 335 'QueryWallets # SKIP deprecated' test.out

#- 336 BulkCredit
./ng net.accelbyte.sdk.cli.Main platform bulkCredit \
    --namespace "$AB_NAMESPACE" \
    --body '[{"creditRequest": {"amount": 54, "expireAt": "1989-04-11T00:00:00Z", "metadata": {"6Y0g0q6g": {}, "o8gIrJZB": {}, "bj6nxGQ3": {}}, "origin": "Steam", "reason": "nsmKertX", "source": "IAP"}, "currencyCode": "eQZ0IbLD", "userIds": ["1oLejaNW", "NvdonIcs", "fU2uWimh"]}, {"creditRequest": {"amount": 85, "expireAt": "1979-11-28T00:00:00Z", "metadata": {"kMTMGJeX": {}, "GCT6VEYI": {}, "l16RZcqb": {}}, "origin": "Playstation", "reason": "6Tl5avNP", "source": "PROMOTION"}, "currencyCode": "oqLVuoQv", "userIds": ["ROQyrpyo", "b7UXJpC4", "HDJjBpUy"]}, {"creditRequest": {"amount": 6, "expireAt": "1973-12-26T00:00:00Z", "metadata": {"k9NRJ2Zf": {}, "2d66G1OW": {}, "5w1McKA5": {}}, "origin": "Oculus", "reason": "pHFdl4tF", "source": "REFERRAL_BONUS"}, "currencyCode": "JDscmqhL", "userIds": ["KmLyMPbs", "s2xaGuTq", "cMxMeA5z"]}]' \
    > test.out 2>&1
eval_tap $? 336 'BulkCredit' test.out

#- 337 BulkDebit
./ng net.accelbyte.sdk.cli.Main platform bulkDebit \
    --namespace "$AB_NAMESPACE" \
    --body '[{"currencyCode": "l4xsrfqt", "request": {"allowOverdraft": true, "amount": 62, "balanceOrigin": "Playstation", "balanceSource": "OTHER", "metadata": {"kKqHwjRm": {}, "OVqFZd9D": {}, "OU1pbTAb": {}}, "reason": "uEPCokXE"}, "userIds": ["qPahddHm", "dQoP4P0h", "ZfzcDVPZ"]}, {"currencyCode": "kVLtiPqa", "request": {"allowOverdraft": false, "amount": 7, "balanceOrigin": "GooglePlay", "balanceSource": "TRADE", "metadata": {"4fRTyXpA": {}, "IDKXQuat": {}, "NPorSGHl": {}}, "reason": "YH8WTUqE"}, "userIds": ["xDtnUE8s", "86BwBXlf", "BGxxzFHu"]}, {"currencyCode": "BncLZr7Q", "request": {"allowOverdraft": false, "amount": 75, "balanceOrigin": "Nintendo", "balanceSource": "TRADE", "metadata": {"1BegrbKZ": {}, "4TLgvtaN": {}, "OICqHjg9": {}}, "reason": "H47u70jE"}, "userIds": ["BxhHX0j0", "xwY8XwUE", "aGmf8j8f"]}]' \
    > test.out 2>&1
eval_tap $? 337 'BulkDebit' test.out

#- 338 GetWallet
eval_tap 0 338 'GetWallet # SKIP deprecated' test.out

#- 339 SyncOrders
./ng net.accelbyte.sdk.cli.Main platform syncOrders \
    --nextEvaluatedKey 'KsIfiakR' \
    --end 'eGJKcmCr' \
    --start 'kCPpFxAU' \
    > test.out 2>&1
eval_tap $? 339 'SyncOrders' test.out

#- 340 TestAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfig \
    --sandbox  \
    --body '{"allowedPaymentMethods": ["f16bwo7A", "Yb3MOZIr", "YQZMg18Y"], "apiKey": "0Dan2mHF", "authoriseAsCapture": false, "blockedPaymentMethods": ["OksIyGFf", "j3FBAsHi", "7GpBMRiK"], "clientKey": "PSSq9ETf", "dropInSettings": "RBGCDTOt", "liveEndpointUrlPrefix": "bH4Cvhzc", "merchantAccount": "fqsZnJvo", "notificationHmacKey": "QYQbBrnj", "notificationPassword": "arvX29hc", "notificationUsername": "FAmpdjAC", "returnUrl": "WQNbMRZ8", "settings": "MhEx3i8s"}' \
    > test.out 2>&1
eval_tap $? 340 'TestAdyenConfig' test.out

#- 341 TestAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfig \
    --sandbox  \
    --body '{"appId": "BlbdhJk2", "privateKey": "478tmjo6", "publicKey": "th54s7mV", "returnUrl": "wUnaJG0O"}' \
    > test.out 2>&1
eval_tap $? 341 'TestAliPayConfig' test.out

#- 342 TestCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfig \
    --sandbox  \
    --body '{"publicKey": "KaClzWbr", "secretKey": "GMsyNyxf"}' \
    > test.out 2>&1
eval_tap $? 342 'TestCheckoutConfig' test.out

#- 343 DebugMatchedPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentMerchantConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'sDgfXBbf' \
    > test.out 2>&1
eval_tap $? 343 'DebugMatchedPaymentMerchantConfig' test.out

#- 344 TestNeonPayConfig
./ng net.accelbyte.sdk.cli.Main platform testNeonPayConfig \
    --sandbox  \
    --body '{"apiKey": "OhmhOEXS", "webhookSecretKey": "WTzqv05t"}' \
    > test.out 2>&1
eval_tap $? 344 'TestNeonPayConfig' test.out

#- 345 TestPayPalConfig
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfig \
    --sandbox  \
    --body '{"clientID": "2r9Ppnqm", "clientSecret": "9iEa59T4", "returnUrl": "byBCnL9z", "webHookId": "F5EcZU3Z"}' \
    > test.out 2>&1
eval_tap $? 345 'TestPayPalConfig' test.out

#- 346 TestStripeConfig
./ng net.accelbyte.sdk.cli.Main platform testStripeConfig \
    --sandbox  \
    --body '{"allowedPaymentMethodTypes": ["wI9Vcvz4", "ycQjzRSG", "JPtCZDa9"], "publishableKey": "OmW0hUTk", "secretKey": "oUf8wgm7", "webhookSecret": "AMnHEbyX"}' \
    > test.out 2>&1
eval_tap $? 346 'TestStripeConfig' test.out

#- 347 TestWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfig \
    --body '{"appId": "GX2YLgk1", "key": "o0RS8EzX", "mchid": "2CebpB3L", "returnUrl": "tpegYTev"}' \
    > test.out 2>&1
eval_tap $? 347 'TestWxPayConfig' test.out

#- 348 TestXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfig \
    --body '{"apiKey": "1Xjt3o03", "flowCompletionUrl": "Obpr4lfD", "merchantId": 40, "projectId": 33, "projectSecretKey": "C69zw5I4"}' \
    > test.out 2>&1
eval_tap $? 348 'TestXsollaConfig' test.out

#- 349 GetPaymentMerchantConfig1
./ng net.accelbyte.sdk.cli.Main platform getPaymentMerchantConfig1 \
    --id 'huT3fCzC' \
    > test.out 2>&1
eval_tap $? 349 'GetPaymentMerchantConfig1' test.out

#- 350 UpdateAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform updateAdyenConfig \
    --id 'M26VTwix' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethods": ["BcHWb8dh", "mqlQtC7M", "Au5kJbpd"], "apiKey": "htgx1RSq", "authoriseAsCapture": false, "blockedPaymentMethods": ["Yknv4rtK", "xyU4AwDU", "Fc2UNqTP"], "clientKey": "gT2XnzlG", "dropInSettings": "KXq8N4eb", "liveEndpointUrlPrefix": "5n6gxXGf", "merchantAccount": "d3Zzc5WH", "notificationHmacKey": "1FKjzVVc", "notificationPassword": "ffNtl1Bo", "notificationUsername": "P4JOT67J", "returnUrl": "z0MIBz9k", "settings": "wyofLdad"}' \
    > test.out 2>&1
eval_tap $? 350 'UpdateAdyenConfig' test.out

#- 351 TestAdyenConfigById
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfigById \
    --id 'Y3zKQNF7' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 351 'TestAdyenConfigById' test.out

#- 352 UpdateAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateAliPayConfig \
    --id 'Jd3RqUoh' \
    --sandbox  \
    --validate  \
    --body '{"appId": "aimzQNLP", "privateKey": "WgO1K3NX", "publicKey": "Gc5z3k3p", "returnUrl": "PAUY2pOd"}' \
    > test.out 2>&1
eval_tap $? 352 'UpdateAliPayConfig' test.out

#- 353 TestAliPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfigById \
    --id 'MPk1Ox5l' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 353 'TestAliPayConfigById' test.out

#- 354 UpdateCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform updateCheckoutConfig \
    --id 'KVTSPsC4' \
    --sandbox  \
    --validate  \
    --body '{"publicKey": "aAEoj4TN", "secretKey": "mufj5HRE"}' \
    > test.out 2>&1
eval_tap $? 354 'UpdateCheckoutConfig' test.out

#- 355 TestCheckoutConfigById
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfigById \
    --id 'mZizpoyN' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 355 'TestCheckoutConfigById' test.out

#- 356 UpdateNeonPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateNeonPayConfig \
    --id 'rUiQahfn' \
    --sandbox  \
    --validate  \
    --body '{"apiKey": "Dq18NfiP", "webhookSecretKey": "UlYPZVfd"}' \
    > test.out 2>&1
eval_tap $? 356 'UpdateNeonPayConfig' test.out

#- 357 TestNeonPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testNeonPayConfigById \
    --id 'F5l4TeQV' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 357 'TestNeonPayConfigById' test.out

#- 358 UpdatePayPalConfig
./ng net.accelbyte.sdk.cli.Main platform updatePayPalConfig \
    --id 'Y3TQwZi3' \
    --sandbox  \
    --validate  \
    --body '{"clientID": "hh0qS7Vv", "clientSecret": "3V9sv3NS", "returnUrl": "qijJXNS2", "webHookId": "JURvH8IW"}' \
    > test.out 2>&1
eval_tap $? 358 'UpdatePayPalConfig' test.out

#- 359 TestPayPalConfigById
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfigById \
    --id 'mXBPm01d' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 359 'TestPayPalConfigById' test.out

#- 360 UpdateStripeConfig
./ng net.accelbyte.sdk.cli.Main platform updateStripeConfig \
    --id 'I0QhD2Ff' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethodTypes": ["5FVO5RAY", "Br3TBVbe", "gAc6rVn6"], "publishableKey": "Xtpkp2AM", "secretKey": "MEuUNk5F", "webhookSecret": "10yDYu6R"}' \
    > test.out 2>&1
eval_tap $? 360 'UpdateStripeConfig' test.out

#- 361 TestStripeConfigById
./ng net.accelbyte.sdk.cli.Main platform testStripeConfigById \
    --id '4fRtBpwz' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 361 'TestStripeConfigById' test.out

#- 362 UpdateWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfig \
    --id 'EZYPNMpM' \
    --validate  \
    --body '{"appId": "EsoMDNeE", "key": "Kz891262", "mchid": "XHy5k9SD", "returnUrl": "J6XaJUIe"}' \
    > test.out 2>&1
eval_tap $? 362 'UpdateWxPayConfig' test.out

#- 363 UpdateWxPayConfigCert
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfigCert \
    --id 'dwAFwCPn' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 363 'UpdateWxPayConfigCert' test.out

#- 364 TestWxPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfigById \
    --id 'gyJiYAZs' \
    > test.out 2>&1
eval_tap $? 364 'TestWxPayConfigById' test.out

#- 365 UpdateXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaConfig \
    --id 'HQ6E5t2W' \
    --validate  \
    --body '{"apiKey": "2F1MU3nP", "flowCompletionUrl": "h8w88K0H", "merchantId": 45, "projectId": 63, "projectSecretKey": "bVzuB3nX"}' \
    > test.out 2>&1
eval_tap $? 365 'UpdateXsollaConfig' test.out

#- 366 TestXsollaConfigById
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfigById \
    --id 'ap3S5Nl1' \
    > test.out 2>&1
eval_tap $? 366 'TestXsollaConfigById' test.out

#- 367 UpdateXsollaUIConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaUIConfig \
    --id '9ylwaKPl' \
    --body '{"device": "DESKTOP", "showCloseButton": false, "size": "LARGE", "theme": "DEFAULT"}' \
    > test.out 2>&1
eval_tap $? 367 'UpdateXsollaUIConfig' test.out

#- 368 QueryPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform queryPaymentProviderConfig \
    --limit '14' \
    --namespace "$AB_NAMESPACE" \
    --offset '25' \
    --region 'vvI4HSkd' \
    > test.out 2>&1
eval_tap $? 368 'QueryPaymentProviderConfig' test.out

#- 369 CreatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform createPaymentProviderConfig \
    --body '{"aggregate": "XSOLLA", "namespace": "3Mb2M4XZ", "region": "kgpC2BeK", "sandboxTaxJarApiToken": "HOeUbvkw", "specials": ["WALLET", "WALLET", "ADYEN"], "taxJarApiToken": "uMzgtKJ7", "taxJarEnabled": true, "useGlobalTaxJarApiToken": false}' \
    > test.out 2>&1
eval_tap $? 369 'CreatePaymentProviderConfig' test.out

#- 370 GetAggregatePaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getAggregatePaymentProviders \
    > test.out 2>&1
eval_tap $? 370 'GetAggregatePaymentProviders' test.out

#- 371 DebugMatchedPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentProviderConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'TO3KEjNf' \
    > test.out 2>&1
eval_tap $? 371 'DebugMatchedPaymentProviderConfig' test.out

#- 372 GetSpecialPaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getSpecialPaymentProviders \
    > test.out 2>&1
eval_tap $? 372 'GetSpecialPaymentProviders' test.out

#- 373 UpdatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentProviderConfig \
    --id '10tt42Qh' \
    --body '{"aggregate": "STRIPE", "namespace": "FhGKruKo", "region": "MFMWc2kB", "sandboxTaxJarApiToken": "s8OmHPbr", "specials": ["PAYPAL", "CHECKOUT", "ADYEN"], "taxJarApiToken": "i2dzIRTW", "taxJarEnabled": true, "useGlobalTaxJarApiToken": true}' \
    > test.out 2>&1
eval_tap $? 373 'UpdatePaymentProviderConfig' test.out

#- 374 DeletePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform deletePaymentProviderConfig \
    --id 'AMdAAJqV' \
    > test.out 2>&1
eval_tap $? 374 'DeletePaymentProviderConfig' test.out

#- 375 GetPaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxConfig \
    > test.out 2>&1
eval_tap $? 375 'GetPaymentTaxConfig' test.out

#- 376 UpdatePaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentTaxConfig \
    --body '{"sandboxTaxJarApiToken": "DsRjbplw", "taxJarApiToken": "RywLGi6S", "taxJarEnabled": false, "taxJarProductCodesMapping": {"p3zCWTgr": "QTFu6lLB", "MwpeAUbo": "i8lUByAE", "QwoBYgj2": "2HyAijFW"}}' \
    > test.out 2>&1
eval_tap $? 376 'UpdatePaymentTaxConfig' test.out

#- 377 SyncPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform syncPaymentOrders \
    --nextEvaluatedKey 'pOnfN9YJ' \
    --end 'dxwLQGIA' \
    --start 'cAEr0erv' \
    > test.out 2>&1
eval_tap $? 377 'SyncPaymentOrders' test.out

#- 378 PublicGetRootCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetRootCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'rLgdIScO' \
    --storeId 'RagCbwoN' \
    > test.out 2>&1
eval_tap $? 378 'PublicGetRootCategories' test.out

#- 379 DownloadCategories
./ng net.accelbyte.sdk.cli.Main platform downloadCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'T4L1YpH1' \
    --storeId '5VqkuPfv' \
    > test.out 2>&1
eval_tap $? 379 'DownloadCategories' test.out

#- 380 PublicGetCategory
./ng net.accelbyte.sdk.cli.Main platform publicGetCategory \
    --categoryPath 'wyVpmYcQ' \
    --namespace "$AB_NAMESPACE" \
    --language 'dESqFvkK' \
    --storeId 'Uka1OhQo' \
    > test.out 2>&1
eval_tap $? 380 'PublicGetCategory' test.out

#- 381 PublicGetChildCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetChildCategories \
    --categoryPath 'WcgfLVTv' \
    --namespace "$AB_NAMESPACE" \
    --language 'jOlHalHD' \
    --storeId '8Jn9xR68' \
    > test.out 2>&1
eval_tap $? 381 'PublicGetChildCategories' test.out

#- 382 PublicGetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetDescendantCategories \
    --categoryPath 'ARXiiMMZ' \
    --namespace "$AB_NAMESPACE" \
    --language 'cQc5Vi6p' \
    --storeId 'VJfFt6Qp' \
    > test.out 2>&1
eval_tap $? 382 'PublicGetDescendantCategories' test.out

#- 383 PublicListCurrencies
./ng net.accelbyte.sdk.cli.Main platform publicListCurrencies \
    --namespace "$AB_NAMESPACE" \
    --currencyType 'VIRTUAL' \
    > test.out 2>&1
eval_tap $? 383 'PublicListCurrencies' test.out

#- 384 GeDLCDurableRewardShortMap
./ng net.accelbyte.sdk.cli.Main platform geDLCDurableRewardShortMap \
    --namespace "$AB_NAMESPACE" \
    --dlcType 'STEAM' \
    > test.out 2>&1
eval_tap $? 384 'GeDLCDurableRewardShortMap' test.out

#- 385 GetAppleConfigVersion
./ng net.accelbyte.sdk.cli.Main platform getAppleConfigVersion \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 385 'GetAppleConfigVersion' test.out

#- 386 GetIAPItemMapping
./ng net.accelbyte.sdk.cli.Main platform getIAPItemMapping \
    --namespace "$AB_NAMESPACE" \
    --platform 'EPICGAMES' \
    > test.out 2>&1
eval_tap $? 386 'GetIAPItemMapping' test.out

#- 387 PublicGetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --language 'Jfd3Jd6o' \
    --region 'MjSZeVJq' \
    --storeId 'iY6EdRLb' \
    --appId 'H6TCyvwV' \
    > test.out 2>&1
eval_tap $? 387 'PublicGetItemByAppId' test.out

#- 388 PublicQueryItems
./ng net.accelbyte.sdk.cli.Main platform publicQueryItems \
    --namespace "$AB_NAMESPACE" \
    --appType 'DEMO' \
    --autoCalcEstimatedPrice  \
    --baseAppId 'SpqQDR5G' \
    --categoryPath 'd7xEiIie' \
    --features 'skIvgbcH' \
    --includeSubCategoryItem  \
    --itemType 'LOOTBOX' \
    --language 'fBVbpBrM' \
    --limit '49' \
    --offset '59' \
    --region 'ap32Ro6d' \
    --sortBy 'displayOrder,updatedAt:desc' \
    --storeId '99iqGNmg' \
    --tags 'yQMmIOLQ' \
    > test.out 2>&1
eval_tap $? 388 'PublicQueryItems' test.out

#- 389 PublicGetItemBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetItemBySku \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'anDIfiUT' \
    --region 'JrsS8NR3' \
    --storeId 'z4Tc4Bd7' \
    --sku 'h5FZq9ux' \
    > test.out 2>&1
eval_tap $? 389 'PublicGetItemBySku' test.out

#- 390 PublicGetEstimatedPrice
./ng net.accelbyte.sdk.cli.Main platform publicGetEstimatedPrice \
    --namespace "$AB_NAMESPACE" \
    --region 'u4LlovTZ' \
    --storeId 'gKDbt1M1' \
    --itemIds 'y3MxMUsK' \
    > test.out 2>&1
eval_tap $? 390 'PublicGetEstimatedPrice' test.out

#- 391 PublicBulkGetItems
./ng net.accelbyte.sdk.cli.Main platform publicBulkGetItems \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'znSnyriB' \
    --region 'qZCstT0y' \
    --storeId 'qzkygGCg' \
    --itemIds 'EVYO2zAn' \
    > test.out 2>&1
eval_tap $? 391 'PublicBulkGetItems' test.out

#- 392 PublicValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform publicValidateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --body '{"itemIds": ["nWt2gJJV", "l2oLaIR7", "1DA7OO4F"]}' \
    > test.out 2>&1
eval_tap $? 392 'PublicValidateItemPurchaseCondition' test.out

#- 393 PublicSearchItems
./ng net.accelbyte.sdk.cli.Main platform publicSearchItems \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --itemType 'INGAMEITEM' \
    --limit '24' \
    --offset '71' \
    --region 'aKoSedF8' \
    --storeId 'zwu6y90C' \
    --keyword 'cA5IYKN2' \
    --language 'r9BkXAqa' \
    > test.out 2>&1
eval_tap $? 393 'PublicSearchItems' test.out

#- 394 PublicGetApp
./ng net.accelbyte.sdk.cli.Main platform publicGetApp \
    --itemId 'Hxb1pXFn' \
    --namespace "$AB_NAMESPACE" \
    --language 'W8wNK1ls' \
    --region 'P5cUG3cq' \
    --storeId 'CLBLX4DU' \
    > test.out 2>&1
eval_tap $? 394 'PublicGetApp' test.out

#- 395 PublicGetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform publicGetItemDynamicData \
    --itemId 'akfcrzFS' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 395 'PublicGetItemDynamicData' test.out

#- 396 PublicGetItem
./ng net.accelbyte.sdk.cli.Main platform publicGetItem \
    --itemId 'kHp3NaWr' \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'eTfii8Gc' \
    --populateBundle  \
    --region '9rqSHueM' \
    --storeId 'd61A2ljb' \
    > test.out 2>&1
eval_tap $? 396 'PublicGetItem' test.out

#- 397 GetPaymentCustomization
eval_tap 0 397 'GetPaymentCustomization # SKIP deprecated' test.out

#- 398 PublicGetPaymentUrl
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentUrl \
    --namespace "$AB_NAMESPACE" \
    --body '{"neonPayConfig": {"cancelUrl": "nUOI6MZX", "successUrl": "N1k2dVCM"}, "paymentOrderNo": "qTlCcksF", "paymentProvider": "XSOLLA", "returnUrl": "fI8hDgLa", "ui": "1vimBKbw", "zipCode": "6A1GIIz1"}' \
    > test.out 2>&1
eval_tap $? 398 'PublicGetPaymentUrl' test.out

#- 399 PublicGetPaymentMethods
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentMethods \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'sad4a3cr' \
    > test.out 2>&1
eval_tap $? 399 'PublicGetPaymentMethods' test.out

#- 400 PublicGetUnpaidPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUnpaidPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'Ul8maAgX' \
    > test.out 2>&1
eval_tap $? 400 'PublicGetUnpaidPaymentOrder' test.out

#- 401 Pay
./ng net.accelbyte.sdk.cli.Main platform pay \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'YVkcwrP2' \
    --paymentProvider 'STRIPE' \
    --zipCode 'VachsrTE' \
    --body '{"token": "rPQGjNZS"}' \
    > test.out 2>&1
eval_tap $? 401 'Pay' test.out

#- 402 PublicCheckPaymentOrderPaidStatus
./ng net.accelbyte.sdk.cli.Main platform publicCheckPaymentOrderPaidStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'TIy2Ifq9' \
    > test.out 2>&1
eval_tap $? 402 'PublicCheckPaymentOrderPaidStatus' test.out

#- 403 GetPaymentPublicConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentPublicConfig \
    --namespace "$AB_NAMESPACE" \
    --sandbox  \
    --paymentProvider 'NEONPAY' \
    --region 'b0Xhn0Q6' \
    > test.out 2>&1
eval_tap $? 403 'GetPaymentPublicConfig' test.out

#- 404 PublicGetQRCode
./ng net.accelbyte.sdk.cli.Main platform publicGetQRCode \
    --namespace "$AB_NAMESPACE" \
    --code 'HJNYGTu5' \
    > test.out 2>&1
eval_tap $? 404 'PublicGetQRCode' test.out

#- 405 PublicNormalizePaymentReturnUrl
./ng net.accelbyte.sdk.cli.Main platform publicNormalizePaymentReturnUrl \
    --namespace "$AB_NAMESPACE" \
    --payerID 'kxTqtbP8' \
    --foreinginvoice 'owM6PKPO' \
    --invoiceId 'JZnlxKYr' \
    --payload 'cuFhwwi1' \
    --redirectResult 'LaXRdNdk' \
    --resultCode 'NEa9tWL8' \
    --sessionId '0BgFse8D' \
    --status 'GxNSmgbl' \
    --token 'W1F2hMi4' \
    --type 'e5vtczio' \
    --userId 'jmR5QLJZ' \
    --orderNo 'PPF9a1p2' \
    --paymentOrderNo 'JNSgZdiN' \
    --paymentProvider 'CHECKOUT' \
    --returnUrl '0EgR0A5z' \
    > test.out 2>&1
eval_tap $? 405 'PublicNormalizePaymentReturnUrl' test.out

#- 406 GetPaymentTaxValue
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxValue \
    --namespace "$AB_NAMESPACE" \
    --zipCode '7WY2teUR' \
    --paymentOrderNo 'xKr5vpWG' \
    --paymentProvider 'ADYEN' \
    > test.out 2>&1
eval_tap $? 406 'GetPaymentTaxValue' test.out

#- 407 GetRewardByCode
./ng net.accelbyte.sdk.cli.Main platform getRewardByCode \
    --namespace "$AB_NAMESPACE" \
    --rewardCode 'ClrEX61G' \
    > test.out 2>&1
eval_tap $? 407 'GetRewardByCode' test.out

#- 408 QueryRewards1
./ng net.accelbyte.sdk.cli.Main platform queryRewards1 \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'WPkQWDoM' \
    --limit '94' \
    --offset '15' \
    --sortBy 'namespace:desc,namespace,namespace:asc' \
    > test.out 2>&1
eval_tap $? 408 'QueryRewards1' test.out

#- 409 GetReward1
./ng net.accelbyte.sdk.cli.Main platform getReward1 \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'Hlc0VcVB' \
    > test.out 2>&1
eval_tap $? 409 'GetReward1' test.out

#- 410 PublicListStores
./ng net.accelbyte.sdk.cli.Main platform publicListStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 410 'PublicListStores' test.out

#- 411 PublicExistsAnyMyActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyMyActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --appIds 'zpNK798P,gTKBvgeW,zKlW7KlY' \
    --itemIds 'SrrTjH3B,TtBvzdz5,9V4tRbEP' \
    --skus 'C9U5k3H1,Yc0P18Mc,6FiTBWMY' \
    > test.out 2>&1
eval_tap $? 411 'PublicExistsAnyMyActiveEntitlement' test.out

#- 412 PublicGetMyAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --appId 'kN2xHu2x' \
    > test.out 2>&1
eval_tap $? 412 'PublicGetMyAppEntitlementOwnershipByAppId' test.out

#- 413 PublicGetMyEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'ENTITLEMENT' \
    --itemId 'ASh6ctg2' \
    > test.out 2>&1
eval_tap $? 413 'PublicGetMyEntitlementOwnershipByItemId' test.out

#- 414 PublicGetMyEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'CODE' \
    --sku '7EOID6Ln' \
    > test.out 2>&1
eval_tap $? 414 'PublicGetMyEntitlementOwnershipBySku' test.out

#- 415 PublicGetEntitlementOwnershipToken
./ng net.accelbyte.sdk.cli.Main platform publicGetEntitlementOwnershipToken \
    --namespace "$AB_NAMESPACE" \
    --appIds '2Fs43nQa,K4Lrmjbc,Aqyp0JjB' \
    --itemIds 'QiXuiCVF,ajKUJtEt,OlPciQv2' \
    --skus 'mheb8MID,TsfWg8Db,aDbb2o7t' \
    > test.out 2>&1
eval_tap $? 415 'PublicGetEntitlementOwnershipToken' test.out

#- 416 SyncTwitchDropsEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement \
    --namespace "$AB_NAMESPACE" \
    --body '{"gameId": "aqpOI61j", "language": "DyK", "region": "9gi5j5uE"}' \
    > test.out 2>&1
eval_tap $? 416 'SyncTwitchDropsEntitlement' test.out

#- 417 PublicGetMyWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetMyWallet \
    --currencyCode 'Dp7K7CZQ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 417 'PublicGetMyWallet' test.out

#- 418 SyncEpicGameDLC
./ng net.accelbyte.sdk.cli.Main platform syncEpicGameDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'NzMPpW1g' \
    --body '{"epicGamesJwtToken": "D2vrSgxy"}' \
    > test.out 2>&1
eval_tap $? 418 'SyncEpicGameDLC' test.out

#- 419 SyncOculusDLC
./ng net.accelbyte.sdk.cli.Main platform syncOculusDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'aq7rJclN' \
    > test.out 2>&1
eval_tap $? 419 'SyncOculusDLC' test.out

#- 420 PublicSyncPsnDlcInventory
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'm1zXeMDU' \
    --body '{"serviceLabel": 80}' \
    > test.out 2>&1
eval_tap $? 420 'PublicSyncPsnDlcInventory' test.out

#- 421 PublicSyncPsnDlcInventoryWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventoryWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'EAV0r7oX' \
    --body '{"serviceLabels": [100, 20, 47]}' \
    > test.out 2>&1
eval_tap $? 421 'PublicSyncPsnDlcInventoryWithMultipleServiceLabels' test.out

#- 422 SyncSteamDLC
./ng net.accelbyte.sdk.cli.Main platform syncSteamDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'qN0wVN4r' \
    --body '{"appId": "VYamLSox", "steamId": "IzYOZ364"}' \
    > test.out 2>&1
eval_tap $? 422 'SyncSteamDLC' test.out

#- 423 SyncXboxDLC
./ng net.accelbyte.sdk.cli.Main platform syncXboxDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'p7zRx5Ko' \
    --body '{"xstsToken": "gdB3cXew"}' \
    > test.out 2>&1
eval_tap $? 423 'SyncXboxDLC' test.out

#- 424 PublicQueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'AyIx7OY1' \
    --appType 'GAME' \
    --entitlementClazz 'MEDIA' \
    --entitlementName 'rIHQrnmo' \
    --features '0GWnCnSu,bx2v5jaw,TqT0QkmQ' \
    --itemId 'hQYRL1h8,3hrpAdmp,74kKIxJy' \
    --limit '9' \
    --offset '95' \
    > test.out 2>&1
eval_tap $? 424 'PublicQueryUserEntitlements' test.out

#- 425 PublicGetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'xrWW0fgy' \
    --appId 'eO2fjMAn' \
    > test.out 2>&1
eval_tap $? 425 'PublicGetUserAppEntitlementByAppId' test.out

#- 426 PublicQueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId '7pFJBWKL' \
    --limit '86' \
    --offset '90' \
    --appType 'DLC' \
    > test.out 2>&1
eval_tap $? 426 'PublicQueryUserEntitlementsByAppType' test.out

#- 427 PublicGetUserEntitlementsByIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementsByIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'RhqLdxbb' \
    --availablePlatformOnly  \
    --ids 'CHB8w0TR,UQEt2CVK,HW8AkHk5' \
    > test.out 2>&1
eval_tap $? 427 'PublicGetUserEntitlementsByIds' test.out

#- 428 PublicGetUserEntitlementByItemId
eval_tap 0 428 'PublicGetUserEntitlementByItemId # SKIP deprecated' test.out

#- 429 PublicGetUserEntitlementBySku
eval_tap 0 429 'PublicGetUserEntitlementBySku # SKIP deprecated' test.out

#- 430 PublicUserEntitlementHistory
./ng net.accelbyte.sdk.cli.Main platform publicUserEntitlementHistory \
    --namespace "$AB_NAMESPACE" \
    --userId '6MHIOFUS' \
    --endDate 'hP5qUXOr' \
    --entitlementClazz 'SUBSCRIPTION' \
    --limit '91' \
    --offset '20' \
    --startDate '6h7MQwWx' \
    > test.out 2>&1
eval_tap $? 430 'PublicUserEntitlementHistory' test.out

#- 431 PublicExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'WOWuMTL6' \
    --appIds 'aoU3XvVK,uKVVSJ5O,x1baltJw' \
    --itemIds 'bjCOjBr2,tFSFDCMX,4einH3k9' \
    --skus 'KRdX23Vp,jHjAQEDF,yWeAC0YK' \
    > test.out 2>&1
eval_tap $? 431 'PublicExistsAnyUserActiveEntitlement' test.out

#- 432 PublicGetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'fe1trS3t' \
    --appId 'c4D7dvVy' \
    > test.out 2>&1
eval_tap $? 432 'PublicGetUserAppEntitlementOwnershipByAppId' test.out

#- 433 PublicGetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'MohfBHWC' \
    --entitlementClazz 'MEDIA' \
    --itemId 'J7DYaD01' \
    > test.out 2>&1
eval_tap $? 433 'PublicGetUserEntitlementOwnershipByItemId' test.out

#- 434 PublicGetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'KmD5OL8f' \
    --ids 'hnjg1QuI,uOSeOGfW,60du3RwC' \
    > test.out 2>&1
eval_tap $? 434 'PublicGetUserEntitlementOwnershipByItemIds' test.out

#- 435 PublicGetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'loBNGNs5' \
    --entitlementClazz 'MEDIA' \
    --sku 'a7E5xiEI' \
    > test.out 2>&1
eval_tap $? 435 'PublicGetUserEntitlementOwnershipBySku' test.out

#- 436 PublicGetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlement \
    --entitlementId 'E4ZYcjmZ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'SqrF1SGs' \
    > test.out 2>&1
eval_tap $? 436 'PublicGetUserEntitlement' test.out

#- 437 PublicConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicConsumeUserEntitlement \
    --entitlementId 'V1RzGk9j' \
    --namespace "$AB_NAMESPACE" \
    --userId 'GxRNp9Lm' \
    --body '{"metadata": {"operationSource": "INVENTORY"}, "options": ["HcvlkSns", "Cw1uChOk", "nzpNIFe2"], "requestId": "LohOo2VC", "useCount": 4}' \
    > test.out 2>&1
eval_tap $? 437 'PublicConsumeUserEntitlement' test.out

#- 438 PublicSellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicSellUserEntitlement \
    --entitlementId 'DQjiX6Ub' \
    --namespace "$AB_NAMESPACE" \
    --userId 'WgLaquaz' \
    --body '{"requestId": "kuBpqZSq", "useCount": 63}' \
    > test.out 2>&1
eval_tap $? 438 'PublicSellUserEntitlement' test.out

#- 439 PublicSplitUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicSplitUserEntitlement \
    --entitlementId 'O0qUK8wZ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'jm46ZLin' \
    --body '{"metadata": {"operationSource": "INVENTORY"}, "useCount": 99}' \
    > test.out 2>&1
eval_tap $? 439 'PublicSplitUserEntitlement' test.out

#- 440 PublicTransferUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicTransferUserEntitlement \
    --entitlementId 'Pa1Rltae' \
    --namespace "$AB_NAMESPACE" \
    --userId 'rGSgGFqT' \
    --body '{"entitlementId": "MgYVKIFh", "metadata": {"operationSource": "INVENTORY"}, "useCount": 33}' \
    > test.out 2>&1
eval_tap $? 440 'PublicTransferUserEntitlement' test.out

#- 441 PublicRedeemCode
./ng net.accelbyte.sdk.cli.Main platform publicRedeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'c8BkQK58' \
    --body '{"code": "a1BEAOOk", "language": "eD-CEEg_rp", "region": "SvbnZNu1"}' \
    > test.out 2>&1
eval_tap $? 441 'PublicRedeemCode' test.out

#- 442 PublicFulfillAppleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillAppleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'SqlOdXjS' \
    --body '{"excludeOldTransactions": true, "language": "xm_ioMO_Wo", "productId": "2T6xY1fW", "receiptData": "8rJYV737", "region": "NQnbUBIi", "transactionId": "PLt51f8u"}' \
    > test.out 2>&1
eval_tap $? 442 'PublicFulfillAppleIAPItem' test.out

#- 443 SyncEpicGamesInventory
./ng net.accelbyte.sdk.cli.Main platform syncEpicGamesInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'SqpnO3SM' \
    --body '{"epicGamesJwtToken": "bKWrir7t"}' \
    > test.out 2>&1
eval_tap $? 443 'SyncEpicGamesInventory' test.out

#- 444 PublicFulfillGoogleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillGoogleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'n7FYTOux' \
    --body '{"autoAck": false, "autoConsume": true, "language": "yzxd", "orderId": "NgmMba4j", "packageName": "LB85XXJY", "productId": "LzGNUd0A", "purchaseTime": 3, "purchaseToken": "mP2ifred", "region": "V1KktFUH", "subscriptionPurchase": false}' \
    > test.out 2>&1
eval_tap $? 444 'PublicFulfillGoogleIAPItem' test.out

#- 445 SyncOculusConsumableEntitlements
./ng net.accelbyte.sdk.cli.Main platform syncOculusConsumableEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'jagr0oGF' \
    > test.out 2>&1
eval_tap $? 445 'SyncOculusConsumableEntitlements' test.out

#- 446 PublicReconcilePlayStationStore
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStore \
    --namespace "$AB_NAMESPACE" \
    --userId 'vS1j88Vy' \
    --body '{"currencyCode": "zu2Gkfii", "price": 0.953997800425608, "productId": "GqMdXr74", "serviceLabel": 33}' \
    > test.out 2>&1
eval_tap $? 446 'PublicReconcilePlayStationStore' test.out

#- 447 PublicReconcilePlayStationStoreWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStoreWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'm1w8tgJO' \
    --body '{"currencyCode": "WUEKDCcu", "price": 0.46532258502027757, "productId": "qNgcwpBi", "serviceLabels": [32, 9, 52]}' \
    > test.out 2>&1
eval_tap $? 447 'PublicReconcilePlayStationStoreWithMultipleServiceLabels' test.out

#- 448 SyncSteamInventory
./ng net.accelbyte.sdk.cli.Main platform syncSteamInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZnPEwNWu' \
    --body '{"appId": "voqU4Fx3", "currencyCode": "I3tON0Ct", "language": "ie-NddY-572", "price": 0.17178053199544796, "productId": "7D1TtVde", "region": "HZMz6nvd", "steamId": "ZoUUoqyT"}' \
    > test.out 2>&1
eval_tap $? 448 'SyncSteamInventory' test.out

#- 449 PublicQueryUserThirdPartySubscription
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserThirdPartySubscription \
    --namespace "$AB_NAMESPACE" \
    --platform 'TWITCH' \
    --userId '220fdYoO' \
    --activeOnly  \
    --groupId 'tRpk49i2' \
    --limit '10' \
    --offset '20' \
    --productId 'oz4N8X28' \
    > test.out 2>&1
eval_tap $? 449 'PublicQueryUserThirdPartySubscription' test.out

#- 450 SyncTwitchDropsEntitlement1
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'mF4M6wO9' \
    --body '{"gameId": "RS1Sb7Tl", "language": "BX_YmyU-728", "region": "Ak9D8axN"}' \
    > test.out 2>&1
eval_tap $? 450 'SyncTwitchDropsEntitlement1' test.out

#- 451 SyncXboxInventory
./ng net.accelbyte.sdk.cli.Main platform syncXboxInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'vekpj6Ln' \
    --body '{"currencyCode": "ToMNZtR1", "price": 0.7489620058331545, "productId": "oKS957f5", "xstsToken": "IFVjDEXy"}' \
    > test.out 2>&1
eval_tap $? 451 'SyncXboxInventory' test.out

#- 452 PublicQueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'lCYjktBF' \
    --discounted  \
    --itemId 'VOchI5dN' \
    --limit '3' \
    --offset '92' \
    --status 'CHARGEBACK_REVERSED' \
    > test.out 2>&1
eval_tap $? 452 'PublicQueryUserOrders' test.out

#- 453 PublicCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'SmLCpSoS' \
    --body '{"currencyCode": "RIZIGvWV", "discountCodes": ["Zpb9wmCx", "BJr1z1O2", "jUwCJLCE"], "discountedPrice": 95, "ext": {"X2Ub7sbm": {}, "cbn0spDY": {}, "kZ8raoYD": {}}, "itemId": "nBkmhAoI", "language": "hGg-IXgM", "price": 79, "quantity": 16, "region": "zSWj8qiG", "returnUrl": "VIDaDwWo", "sectionId": "O0aNeE5q"}' \
    > test.out 2>&1
eval_tap $? 453 'PublicCreateUserOrder' test.out

#- 454 PublicPreviewOrderPrice
./ng net.accelbyte.sdk.cli.Main platform publicPreviewOrderPrice \
    --namespace "$AB_NAMESPACE" \
    --userId 'EP6Vomm6' \
    --body '{"currencyCode": "tDooUHgG", "discountCodes": ["lBQEFd2x", "m91745Ni", "t5AgLEZl"], "discountedPrice": 13, "itemId": "Q4bFs6Gr", "price": 53, "quantity": 28}' \
    > test.out 2>&1
eval_tap $? 454 'PublicPreviewOrderPrice' test.out

#- 455 PublicGetUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'a0jGpXWb' \
    --userId 'NaLSVTHb' \
    > test.out 2>&1
eval_tap $? 455 'PublicGetUserOrder' test.out

#- 456 PublicCancelUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCancelUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'OPAjVeqJ' \
    --userId 'QQRJqkcP' \
    > test.out 2>&1
eval_tap $? 456 'PublicCancelUserOrder' test.out

#- 457 PublicGetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'Xe8NQr8z' \
    --userId 'W6G9X2oK' \
    > test.out 2>&1
eval_tap $? 457 'PublicGetUserOrderHistories' test.out

#- 458 PublicDownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform publicDownloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'gVztFIPq' \
    --userId 'DdGdqQMg' \
    > test.out 2>&1
eval_tap $? 458 'PublicDownloadUserOrderReceipt' test.out

#- 459 PublicGetPaymentAccounts
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'yGcg0DRo' \
    > test.out 2>&1
eval_tap $? 459 'PublicGetPaymentAccounts' test.out

#- 460 PublicDeletePaymentAccount
./ng net.accelbyte.sdk.cli.Main platform publicDeletePaymentAccount \
    --id 'ZcSisZrq' \
    --namespace "$AB_NAMESPACE" \
    --type 'card' \
    --userId 'zMG2LqEL' \
    > test.out 2>&1
eval_tap $? 460 'PublicDeletePaymentAccount' test.out

#- 461 PublicListActiveSections
./ng net.accelbyte.sdk.cli.Main platform publicListActiveSections \
    --namespace "$AB_NAMESPACE" \
    --userId 'MzlCBN1r' \
    --autoCalcEstimatedPrice  \
    --language 'bFxzwFgx' \
    --region 'Z4QRf8cy' \
    --storeId 'TdRH7GF2' \
    --viewId 'kICVeXBi' \
    > test.out 2>&1
eval_tap $? 461 'PublicListActiveSections' test.out

#- 462 PublicQueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'LwVrA3m5' \
    --chargeStatus 'SETUP' \
    --itemId 'e7RtvPlA' \
    --limit '48' \
    --offset '63' \
    --sku 'X2b1jOzC' \
    --status 'ACTIVE' \
    --subscribedBy 'USER' \
    > test.out 2>&1
eval_tap $? 462 'PublicQueryUserSubscriptions' test.out

#- 463 PublicSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform publicSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'tSb9gbI7' \
    --body '{"currencyCode": "gXgfXfMX", "itemId": "5Twg7kMq", "language": "oy", "region": "d2QhuusJ", "returnUrl": "1CYLnvUv", "source": "nNVPSbhm"}' \
    > test.out 2>&1
eval_tap $? 463 'PublicSubscribeSubscription' test.out

#- 464 PublicCheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform publicCheckUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'npKvO0on' \
    --itemId 'xja8J7TI' \
    > test.out 2>&1
eval_tap $? 464 'PublicCheckUserSubscriptionSubscribableByItemId' test.out

#- 465 PublicGetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'MuA26tXC' \
    --userId '19G8Iuel' \
    > test.out 2>&1
eval_tap $? 465 'PublicGetUserSubscription' test.out

#- 466 PublicChangeSubscriptionBillingAccount
./ng net.accelbyte.sdk.cli.Main platform publicChangeSubscriptionBillingAccount \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'CGXa9vQ3' \
    --userId '7If9gOI5' \
    > test.out 2>&1
eval_tap $? 466 'PublicChangeSubscriptionBillingAccount' test.out

#- 467 PublicCancelSubscription
./ng net.accelbyte.sdk.cli.Main platform publicCancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'MP5K4HRa' \
    --userId 'IpZ7KmNx' \
    --body '{"immediate": true, "reason": "CBQG6nzw"}' \
    > test.out 2>&1
eval_tap $? 467 'PublicCancelSubscription' test.out

#- 468 PublicGetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'GANgAGJF' \
    --userId 'GX0iWjhq' \
    --excludeFree  \
    --limit '44' \
    --offset '82' \
    > test.out 2>&1
eval_tap $? 468 'PublicGetUserSubscriptionBillingHistories' test.out

#- 469 PublicListViews
./ng net.accelbyte.sdk.cli.Main platform publicListViews \
    --namespace "$AB_NAMESPACE" \
    --userId 'NQAuKWaK' \
    --language '6DZ5L5NP' \
    --storeId 'rKgJKOhb' \
    > test.out 2>&1
eval_tap $? 469 'PublicListViews' test.out

#- 470 PublicGetWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetWallet \
    --currencyCode '7MQRg5m1' \
    --namespace "$AB_NAMESPACE" \
    --userId '1k3WN2fd' \
    > test.out 2>&1
eval_tap $? 470 'PublicGetWallet' test.out

#- 471 PublicListUserWalletTransactions
./ng net.accelbyte.sdk.cli.Main platform publicListUserWalletTransactions \
    --currencyCode 'H6r4dM6i' \
    --namespace "$AB_NAMESPACE" \
    --userId 'rD8O6pBV' \
    --limit '53' \
    --offset '72' \
    > test.out 2>&1
eval_tap $? 471 'PublicListUserWalletTransactions' test.out

#- 472 PublicGetMyDLCContent
./ng net.accelbyte.sdk.cli.Main platform publicGetMyDLCContent \
    --includeAllNamespaces  \
    --type 'STEAM' \
    > test.out 2>&1
eval_tap $? 472 'PublicGetMyDLCContent' test.out

#- 473 QueryFulfillments
./ng net.accelbyte.sdk.cli.Main platform queryFulfillments \
    --namespace "$AB_NAMESPACE" \
    --endTime 'pbeG9IYy' \
    --limit '35' \
    --offset '68' \
    --startTime 'ZBtGDdkD' \
    --state 'FULFILLED' \
    --transactionId 'OoBFkEQm' \
    --userId '21CjwXtW' \
    > test.out 2>&1
eval_tap $? 473 'QueryFulfillments' test.out

#- 474 QueryItemsV2
./ng net.accelbyte.sdk.cli.Main platform queryItemsV2 \
    --namespace "$AB_NAMESPACE" \
    --appType 'DEMO' \
    --availableDate 'x41EJCfd' \
    --baseAppId 'EE1xmzN5' \
    --categoryPath 'bwPrnCiZ' \
    --features 'BHyww17g' \
    --includeSubCategoryItem  \
    --itemName 'T56dNVNn' \
    --itemStatus 'ACTIVE' \
    --itemType 'COINS,SEASON,APP' \
    --limit '39' \
    --offset '99' \
    --region 'ZkjObMBo' \
    --sectionExclusive  \
    --sortBy 'name:asc,displayOrder,updatedAt' \
    --storeId 'ONHECFmq' \
    --tags 'dJK17UhW' \
    --targetNamespace 'D5LkKnZj' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 474 'QueryItemsV2' test.out

#- 475 ImportStore1
./ng net.accelbyte.sdk.cli.Main platform importStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'hnjTIvFV' \
    --strictMode  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 475 'ImportStore1' test.out

#- 476 ExportStore1
./ng net.accelbyte.sdk.cli.Main platform exportStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'psi09zgX' \
    --body '{"itemIds": ["kdpxqg8E", "6v8QV8Dv", "5ZDSSkJj"]}' \
    > test.out 2>&1
eval_tap $? 476 'ExportStore1' test.out

#- 477 FulfillRewardsV2
./ng net.accelbyte.sdk.cli.Main platform fulfillRewardsV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'A0sDctSY' \
    --body '{"entitlementCollectionId": "MhmdZgph", "entitlementOrigin": "Oculus", "metadata": {"1XZ5Elh8": {}, "MFAdd7dL": {}, "9gTNuVvK": {}}, "origin": "Twitch", "rewards": [{"currency": {"currencyCode": "YxFGikkO", "namespace": "D19AC8T6"}, "item": {"itemId": "jwru0YYr", "itemName": "27CWn43Q", "itemSku": "7TGZtcAt", "itemType": "H2Dsd0fS"}, "quantity": 65, "type": "CURRENCY"}, {"currency": {"currencyCode": "isYv1K0w", "namespace": "2EtULMAQ"}, "item": {"itemId": "zfDKZRuq", "itemName": "9qayRqof", "itemSku": "qc3oqsyO", "itemType": "UZXdWDS1"}, "quantity": 39, "type": "ITEM"}, {"currency": {"currencyCode": "wf2QzRaq", "namespace": "3fiB9ivf"}, "item": {"itemId": "oTvJ5uHy", "itemName": "SpjfZ0KO", "itemSku": "OhxSWlse", "itemType": "FiDXIPlJ"}, "quantity": 59, "type": "CURRENCY"}], "source": "ORDER_REVOCATION", "transactionId": "A61KARhr"}' \
    > test.out 2>&1
eval_tap $? 477 'FulfillRewardsV2' test.out

#- 478 FulfillItems
./ng net.accelbyte.sdk.cli.Main platform fulfillItems \
    --namespace "$AB_NAMESPACE" \
    --transactionId 'qXLG1Fdb' \
    --userId '5CK6eUYE' \
    --body '{"items": [{"duration": 25, "endDate": "1987-05-17T00:00:00Z", "entitlementCollectionId": "dA2xv6FY", "entitlementOrigin": "Playstation", "itemId": "g8nXNXjC", "itemSku": "mw4KCsVJ", "language": "SBz6RYf7", "metadata": {"NpQUnzLV": {}, "kLtcsnQo": {}, "kpFdRn1H": {}}, "orderNo": "Fo8fLyMI", "origin": "Xbox", "quantity": 40, "region": "Grt03poj", "source": "PROMOTION", "startDate": "1997-03-25T00:00:00Z", "storeId": "qKpGNyV5"}, {"duration": 88, "endDate": "1978-12-17T00:00:00Z", "entitlementCollectionId": "VxPl6ipD", "entitlementOrigin": "Nintendo", "itemId": "hJuKA2Rq", "itemSku": "VK5RPL7a", "language": "0VzK6nCi", "metadata": {"zWDuCosI": {}, "fDnx4NEM": {}, "VZwN75mD": {}}, "orderNo": "yURaN4GE", "origin": "Other", "quantity": 59, "region": "oWHfkdFy", "source": "DLC", "startDate": "1975-07-27T00:00:00Z", "storeId": "usORUVXU"}, {"duration": 79, "endDate": "1980-08-02T00:00:00Z", "entitlementCollectionId": "Lfkx58mv", "entitlementOrigin": "Playstation", "itemId": "7aw4VoEq", "itemSku": "GA0fEYSO", "language": "xptu0gRL", "metadata": {"ES8JdVOQ": {}, "hA9CVZCs": {}, "Lh7no7bh": {}}, "orderNo": "4UFXarTP", "origin": "Nintendo", "quantity": 47, "region": "KbGE6Thd", "source": "DLC", "startDate": "1993-10-25T00:00:00Z", "storeId": "sZHMBVvG"}]}' \
    > test.out 2>&1
eval_tap $? 478 'FulfillItems' test.out

#- 479 RetryFulfillItems
./ng net.accelbyte.sdk.cli.Main platform retryFulfillItems \
    --namespace "$AB_NAMESPACE" \
    --transactionId 'YRrfe16h' \
    --userId 'vhFsQDAy' \
    > test.out 2>&1
eval_tap $? 479 'RetryFulfillItems' test.out

#- 480 RevokeItems
./ng net.accelbyte.sdk.cli.Main platform revokeItems \
    --namespace "$AB_NAMESPACE" \
    --transactionId 'Rxf3o6Wh' \
    --userId '5vPuCyot' \
    > test.out 2>&1
eval_tap $? 480 'RevokeItems' test.out

#- 481 V2PublicFulfillAppleIAPItem
./ng net.accelbyte.sdk.cli.Main platform v2PublicFulfillAppleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'xgvVis5S' \
    --body '{"transactionId": "cO2E2lzM"}' \
    > test.out 2>&1
eval_tap $? 481 'V2PublicFulfillAppleIAPItem' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
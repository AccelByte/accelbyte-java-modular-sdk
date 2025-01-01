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
echo "1..484"

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
    --id '5NGK186h' \
    > test.out 2>&1
eval_tap $? 3 'GetFulfillmentScript' test.out

#- 4 CreateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform createFulfillmentScript \
    --id 'pbfQtXo8' \
    --body '{"grantDays": "XkcywJDq"}' \
    > test.out 2>&1
eval_tap $? 4 'CreateFulfillmentScript' test.out

#- 5 DeleteFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform deleteFulfillmentScript \
    --id 'YxpiD9Z0' \
    > test.out 2>&1
eval_tap $? 5 'DeleteFulfillmentScript' test.out

#- 6 UpdateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform updateFulfillmentScript \
    --id '7BYlMme6' \
    --body '{"grantDays": "SzDMDu0l"}' \
    > test.out 2>&1
eval_tap $? 6 'UpdateFulfillmentScript' test.out

#- 7 ListItemTypeConfigs
./ng net.accelbyte.sdk.cli.Main platform listItemTypeConfigs \
    > test.out 2>&1
eval_tap $? 7 'ListItemTypeConfigs' test.out

#- 8 CreateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform createItemTypeConfig \
    --body '{"clazz": "SAe6gkIO", "dryRun": true, "fulfillmentUrl": "wN5uPjeB", "itemType": "EXTENSION", "purchaseConditionUrl": "U2QGPBly"}' \
    > test.out 2>&1
eval_tap $? 8 'CreateItemTypeConfig' test.out

#- 9 SearchItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform searchItemTypeConfig \
    --clazz '1sf6ocnY' \
    --itemType 'EXTENSION' \
    > test.out 2>&1
eval_tap $? 9 'SearchItemTypeConfig' test.out

#- 10 GetItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform getItemTypeConfig \
    --id 'Z8i5XDh7' \
    > test.out 2>&1
eval_tap $? 10 'GetItemTypeConfig' test.out

#- 11 UpdateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform updateItemTypeConfig \
    --id 'EEIstRDO' \
    --body '{"clazz": "iBUKXanx", "dryRun": true, "fulfillmentUrl": "sHllsoYN", "purchaseConditionUrl": "zO2DIumu"}' \
    > test.out 2>&1
eval_tap $? 11 'UpdateItemTypeConfig' test.out

#- 12 DeleteItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform deleteItemTypeConfig \
    --id 'SzCuCFgh' \
    > test.out 2>&1
eval_tap $? 12 'DeleteItemTypeConfig' test.out

#- 13 QueryCampaigns
./ng net.accelbyte.sdk.cli.Main platform queryCampaigns \
    --namespace "$AB_NAMESPACE" \
    --limit '97' \
    --name 'b65dF6Yw' \
    --offset '9' \
    --tag 'fOVvuGho' \
    > test.out 2>&1
eval_tap $? 13 'QueryCampaigns' test.out

#- 14 CreateCampaign
./ng net.accelbyte.sdk.cli.Main platform createCampaign \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "Q22HOkxP", "discountConfig": {"categories": [{"categoryPath": "4RoddIpr", "includeSubCategories": true}, {"categoryPath": "YcFJzXK0", "includeSubCategories": false}, {"categoryPath": "ZMrfH6Ve", "includeSubCategories": true}], "currencyCode": "F5jO6wNL", "currencyNamespace": "NTZOOxo4", "discountAmount": 33, "discountPercentage": 38, "discountType": "AMOUNT", "items": [{"itemId": "BSpQsBsj", "itemName": "S5jJbXgV"}, {"itemId": "6LSJv5V6", "itemName": "h2tZRzIY"}, {"itemId": "rL2z8qQG", "itemName": "LscvVax1"}], "restrictType": "ITEMS_AND_CATEGORIES", "stackable": true}, "items": [{"extraSubscriptionDays": 20, "itemId": "tNDFzYgm", "itemName": "uq2XPYwk", "quantity": 64}, {"extraSubscriptionDays": 87, "itemId": "nipq5ULd", "itemName": "9VfUVdY2", "quantity": 65}, {"extraSubscriptionDays": 71, "itemId": "4cyherg6", "itemName": "BIy018dX", "quantity": 94}], "maxRedeemCountPerCampaignPerUser": 100, "maxRedeemCountPerCode": 16, "maxRedeemCountPerCodePerUser": 4, "maxSaleCount": 69, "name": "yJuqBHup", "redeemEnd": "1983-03-02T00:00:00Z", "redeemStart": "1974-10-20T00:00:00Z", "redeemType": "DISCOUNT", "status": "INACTIVE", "tags": ["3KAPILWT", "vUzdMz2Q", "KkPJnGCn"], "type": "REDEMPTION"}' \
    > test.out 2>&1
eval_tap $? 14 'CreateCampaign' test.out

#- 15 GetCampaign
./ng net.accelbyte.sdk.cli.Main platform getCampaign \
    --campaignId 'haVrJJph' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'GetCampaign' test.out

#- 16 UpdateCampaign
./ng net.accelbyte.sdk.cli.Main platform updateCampaign \
    --campaignId 'wM1j0Vhv' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "dF5SSaHC", "discountConfig": {"categories": [{"categoryPath": "RU5tVsZ6", "includeSubCategories": true}, {"categoryPath": "ykxD8BEP", "includeSubCategories": false}, {"categoryPath": "dZNj9cHN", "includeSubCategories": true}], "currencyCode": "dBWeQUnA", "currencyNamespace": "Is7vvLRv", "discountAmount": 3, "discountPercentage": 91, "discountType": "PERCENTAGE", "items": [{"itemId": "hXIFFo4S", "itemName": "EwvtvzZr"}, {"itemId": "rkbATbLF", "itemName": "MSErjfNJ"}, {"itemId": "wApttqm2", "itemName": "vUEMJpa6"}], "restrictType": "ITEMS_AND_CATEGORIES", "stackable": false}, "items": [{"extraSubscriptionDays": 26, "itemId": "RHDaiMsQ", "itemName": "5IPzpMp6", "quantity": 36}, {"extraSubscriptionDays": 28, "itemId": "kwMJsdcG", "itemName": "2FFkGw4y", "quantity": 45}, {"extraSubscriptionDays": 88, "itemId": "bEHJIQ6Z", "itemName": "q7eB6Ik3", "quantity": 17}], "maxRedeemCountPerCampaignPerUser": 35, "maxRedeemCountPerCode": 76, "maxRedeemCountPerCodePerUser": 50, "maxSaleCount": 13, "name": "tD2tdbEt", "redeemEnd": "1994-02-11T00:00:00Z", "redeemStart": "1975-10-31T00:00:00Z", "redeemType": "DISCOUNT", "status": "ACTIVE", "tags": ["LYQ1uECb", "ur2ngWvR", "fV2Q8DbU"]}' \
    > test.out 2>&1
eval_tap $? 16 'UpdateCampaign' test.out

#- 17 RenameBatch
./ng net.accelbyte.sdk.cli.Main platform renameBatch \
    --campaignId 'ysh4S9WA' \
    --namespace "$AB_NAMESPACE" \
    --body '{"newName": "6ODo1qNp", "oldName": "DWi6I29C"}' \
    > test.out 2>&1
eval_tap $? 17 'RenameBatch' test.out

#- 18 QueryCampaignBatchNames
./ng net.accelbyte.sdk.cli.Main platform queryCampaignBatchNames \
    --campaignId 'gksBR13h' \
    --namespace "$AB_NAMESPACE" \
    --batchName '6p9v4LBo' \
    --limit '28' \
    > test.out 2>&1
eval_tap $? 18 'QueryCampaignBatchNames' test.out

#- 19 GetCampaignDynamic
./ng net.accelbyte.sdk.cli.Main platform getCampaignDynamic \
    --campaignId 'S7gHoKPr' \
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
    --body '{"appConfig": {"appName": "aNnV3Jms"}, "customConfig": {"connectionType": "INSECURE", "grpcServerAddress": "dTPbWOrB"}, "extendType": "CUSTOM"}' \
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
    --body '{"appConfig": {"appName": "geDg7qnp"}, "customConfig": {"connectionType": "TLS", "grpcServerAddress": "WRDpzTqV"}, "extendType": "CUSTOM"}' \
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
    --storeId 'ViJbhsm9' \
    > test.out 2>&1
eval_tap $? 31 'GetRootCategories' test.out

#- 32 CreateCategory
./ng net.accelbyte.sdk.cli.Main platform createCategory \
    --namespace "$AB_NAMESPACE" \
    --storeId 'nFBZqGmp' \
    --body '{"categoryPath": "7qt8ApSp", "localizationDisplayNames": {"B5D7QPoj": "gWMIQQeY", "VHsjaoeo": "DMA46ity", "sEdkfUMt": "CK9g6kMg"}}' \
    > test.out 2>&1
eval_tap $? 32 'CreateCategory' test.out

#- 33 ListCategoriesBasic
./ng net.accelbyte.sdk.cli.Main platform listCategoriesBasic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'DUesHwrA' \
    > test.out 2>&1
eval_tap $? 33 'ListCategoriesBasic' test.out

#- 34 GetCategory
./ng net.accelbyte.sdk.cli.Main platform getCategory \
    --categoryPath 'cEOomGQJ' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'mMUs4w6d' \
    > test.out 2>&1
eval_tap $? 34 'GetCategory' test.out

#- 35 UpdateCategory
./ng net.accelbyte.sdk.cli.Main platform updateCategory \
    --categoryPath 'OQFbVO41' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ODsWs1LN' \
    --body '{"localizationDisplayNames": {"V5GTuN3w": "AaV9BpUY", "BM9m4Q90": "JmhrynYK", "SXwIPyE2": "tiBDCoP8"}}' \
    > test.out 2>&1
eval_tap $? 35 'UpdateCategory' test.out

#- 36 DeleteCategory
./ng net.accelbyte.sdk.cli.Main platform deleteCategory \
    --categoryPath 'zhXWfr2t' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'jqyVSj45' \
    > test.out 2>&1
eval_tap $? 36 'DeleteCategory' test.out

#- 37 GetChildCategories
./ng net.accelbyte.sdk.cli.Main platform getChildCategories \
    --categoryPath 'lAHXqKDz' \
    --namespace "$AB_NAMESPACE" \
    --storeId '8ML8pkUS' \
    > test.out 2>&1
eval_tap $? 37 'GetChildCategories' test.out

#- 38 GetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform getDescendantCategories \
    --categoryPath 'kI5M8ZNA' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'NpmIehz9' \
    > test.out 2>&1
eval_tap $? 38 'GetDescendantCategories' test.out

#- 39 QueryCodes
./ng net.accelbyte.sdk.cli.Main platform queryCodes \
    --campaignId 'ykFmH5vS' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --batchName 'AsGOWaHu' \
    --batchNo '0,81,4' \
    --code 'eGQwHCNN' \
    --limit '49' \
    --offset '8' \
    --withBatchName  \
    > test.out 2>&1
eval_tap $? 39 'QueryCodes' test.out

#- 40 CreateCodes
./ng net.accelbyte.sdk.cli.Main platform createCodes \
    --campaignId 'UaSXPcYg' \
    --namespace "$AB_NAMESPACE" \
    --body '{"batchName": "cjqUXUjF", "codeValue": "7X4986fD", "quantity": 32}' \
    > test.out 2>&1
eval_tap $? 40 'CreateCodes' test.out

#- 41 Download
./ng net.accelbyte.sdk.cli.Main platform download \
    --campaignId 'LbLI8BDR' \
    --namespace "$AB_NAMESPACE" \
    --batchName 's06OfzQc' \
    --batchNo '50,42,78' \
    --withBatchName  \
    > test.out 2>&1
eval_tap $? 41 'Download' test.out

#- 42 BulkDisableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkDisableCodes \
    --campaignId '5iMXXhbc' \
    --namespace "$AB_NAMESPACE" \
    --batchName 'CBFUdOnp' \
    --batchNo '86,6,87' \
    > test.out 2>&1
eval_tap $? 42 'BulkDisableCodes' test.out

#- 43 BulkEnableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkEnableCodes \
    --campaignId 'hRjJFmT4' \
    --namespace "$AB_NAMESPACE" \
    --batchName 'wz9zayRU' \
    --batchNo '93,98,27' \
    > test.out 2>&1
eval_tap $? 43 'BulkEnableCodes' test.out

#- 44 QueryRedeemHistory
./ng net.accelbyte.sdk.cli.Main platform queryRedeemHistory \
    --campaignId '504dkHE9' \
    --namespace "$AB_NAMESPACE" \
    --code 'LH83sH8E' \
    --limit '40' \
    --offset '66' \
    --userId 'Y9SJenuX' \
    > test.out 2>&1
eval_tap $? 44 'QueryRedeemHistory' test.out

#- 45 GetCode
./ng net.accelbyte.sdk.cli.Main platform getCode \
    --code 'pCP91L1z' \
    --namespace "$AB_NAMESPACE" \
    --redeemable  \
    --withBatchName  \
    > test.out 2>&1
eval_tap $? 45 'GetCode' test.out

#- 46 DisableCode
./ng net.accelbyte.sdk.cli.Main platform disableCode \
    --code 'dDUsUyYx' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 46 'DisableCode' test.out

#- 47 EnableCode
./ng net.accelbyte.sdk.cli.Main platform enableCode \
    --code 'UGhMAAD3' \
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
    --body '{"currencyCode": "JewizcMO", "currencySymbol": "vHyboVDI", "currencyType": "REAL", "decimals": 93, "localizationDescriptions": {"Q5gzfOpJ": "SUa7fuZW", "CadvLp4n": "rnpjRwmb", "Tq3LpHdF": "phltRGg2"}}' \
    > test.out 2>&1
eval_tap $? 52 'CreateCurrency' test.out

#- 53 UpdateCurrency
./ng net.accelbyte.sdk.cli.Main platform updateCurrency \
    --currencyCode 'PVKvidE5' \
    --namespace "$AB_NAMESPACE" \
    --body '{"localizationDescriptions": {"d37aB6fN": "sqHZ2o0e", "O02tRSPm": "Vchr3S9v", "8X4Grdyh": "QEdT6L6N"}}' \
    > test.out 2>&1
eval_tap $? 53 'UpdateCurrency' test.out

#- 54 DeleteCurrency
./ng net.accelbyte.sdk.cli.Main platform deleteCurrency \
    --currencyCode '7Mwcedt3' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 54 'DeleteCurrency' test.out

#- 55 GetCurrencyConfig
./ng net.accelbyte.sdk.cli.Main platform getCurrencyConfig \
    --currencyCode 'jtg3wELe' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 55 'GetCurrencyConfig' test.out

#- 56 GetCurrencySummary
./ng net.accelbyte.sdk.cli.Main platform getCurrencySummary \
    --currencyCode 'jaio3Ekc' \
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
    --body '{"data": [{"id": "vb4KAdK7", "rewards": [{"currency": {"currencyCode": "r0iRefzf", "namespace": "culHzege"}, "item": {"itemId": "kDp54aKN", "itemName": "HwwMZx4R", "itemSku": "eq8psICg", "itemType": "7CrzW4mW"}, "quantity": 62, "type": "ITEM"}, {"currency": {"currencyCode": "wcH0FbfP", "namespace": "V1EFV5Bd"}, "item": {"itemId": "0TJSXtnj", "itemName": "Xg1rmRFt", "itemSku": "iwnPcnXs", "itemType": "4CtTrsF3"}, "quantity": 55, "type": "ITEM"}, {"currency": {"currencyCode": "uLAu1ERj", "namespace": "EtXBC3b7"}, "item": {"itemId": "RMapLuwa", "itemName": "4dWFhjJ4", "itemSku": "lh44Dnba", "itemType": "xV8rAqBM"}, "quantity": 18, "type": "ITEM"}]}, {"id": "Z8fqJFcv", "rewards": [{"currency": {"currencyCode": "iYwzRShn", "namespace": "A5RZ45l4"}, "item": {"itemId": "TTs6RTvT", "itemName": "105VmpuD", "itemSku": "LQqfGt9M", "itemType": "E36PRpF9"}, "quantity": 84, "type": "ITEM"}, {"currency": {"currencyCode": "1ohqaobP", "namespace": "69Rp0mRX"}, "item": {"itemId": "XY3dYAwr", "itemName": "UEacTr8h", "itemSku": "Tuv2Qve0", "itemType": "kWSxYWPH"}, "quantity": 8, "type": "ITEM"}, {"currency": {"currencyCode": "4EUOrhmk", "namespace": "TsDHWNL4"}, "item": {"itemId": "PodG3qNE", "itemName": "SQZhA16a", "itemSku": "vSbptZGg", "itemType": "5exMfVYb"}, "quantity": 70, "type": "CURRENCY"}]}, {"id": "0bovBoKC", "rewards": [{"currency": {"currencyCode": "gbSF2O3V", "namespace": "vt0kesYM"}, "item": {"itemId": "lNwMuWk5", "itemName": "vSgfpRzc", "itemSku": "zQb9mwH3", "itemType": "IzJ2zZcZ"}, "quantity": 25, "type": "CURRENCY"}, {"currency": {"currencyCode": "gDkd62IX", "namespace": "BVcqBcL3"}, "item": {"itemId": "QsPCzs77", "itemName": "jM5m6w43", "itemSku": "TJJAGVfe", "itemType": "8e1DVJXg"}, "quantity": 54, "type": "ITEM"}, {"currency": {"currencyCode": "bPr9BcIX", "namespace": "DZjzARaZ"}, "item": {"itemId": "bv6xYgJc", "itemName": "lrldo2MK", "itemSku": "EAgj6AWQ", "itemType": "gog7a6a5"}, "quantity": 4, "type": "ITEM"}]}]}' \
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
    --body '{"data": [{"platform": "XBOX", "platformDlcIdMap": {"2UsS6ksG": "tevCPCbe", "55twybvW": "H0JAEdIW", "0xq2AJNY": "vsl9ShRd"}}, {"platform": "XBOX", "platformDlcIdMap": {"wbjRWqSy": "aTXwcPbt", "KEkXfyV8": "jB8rNaW1", "gCNfDQou": "bgwcBYFw"}}, {"platform": "OCULUS", "platformDlcIdMap": {"OSxXiyir": "ds5sOHak", "Gm7llFlJ": "fsaDHOLX", "bmLdnn1X": "mWuLxylw"}}]}' \
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
    --appType 'SOFTWARE' \
    --entitlementClazz 'LOOTBOX' \
    --entitlementName '6ActYpX7' \
    --itemId 'GmM5iAlc,bJ7PUNGT,ctB3zJuh' \
    --limit '92' \
    --offset '91' \
    --origin 'Oculus' \
    --userId 'oMwhcyjR' \
    > test.out 2>&1
eval_tap $? 63 'QueryEntitlements1' test.out

#- 64 QueryEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryEntitlements \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemIds 'qXrllzzy,UGQY2xm7,ygYKdXg8' \
    --limit '49' \
    --offset '23' \
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
    --body '{"entitlementGrantList": [{"collectionId": "I2XWtAxq", "endDate": "1980-02-03T00:00:00Z", "grantedCode": "M2ZDXbbB", "itemId": "FxP8Hn94", "itemNamespace": "gTTeHarp", "language": "ZS", "metadata": {"PLCdLu99": {}, "aeJ3M9uw": {}, "N4I2q97d": {}}, "origin": "Steam", "quantity": 73, "region": "nVPZ4qcG", "source": "REFERRAL_BONUS", "startDate": "1981-04-13T00:00:00Z", "storeId": "EVCLldnQ"}, {"collectionId": "1rzb86Zy", "endDate": "1973-08-15T00:00:00Z", "grantedCode": "IfzkIOTT", "itemId": "e8vYuGNI", "itemNamespace": "4iysvUka", "language": "hof_sL", "metadata": {"eT2bPWpO": {}, "ZM83MnW8": {}, "qYTW6mb4": {}}, "origin": "Other", "quantity": 80, "region": "4faKf2Tx", "source": "REFERRAL_BONUS", "startDate": "1986-05-20T00:00:00Z", "storeId": "v7EqWRjB"}, {"collectionId": "PELHbdBC", "endDate": "1996-10-12T00:00:00Z", "grantedCode": "t8BKzDAj", "itemId": "YE6t6BHS", "itemNamespace": "GIqXRFdX", "language": "Ft-teRJ_rT", "metadata": {"bT1achEp": {}, "3ooMMqTV": {}, "SVmTLJZK": {}}, "origin": "GooglePlay", "quantity": 74, "region": "G576QXwl", "source": "PROMOTION", "startDate": "1980-04-05T00:00:00Z", "storeId": "y64weveQ"}], "userIds": ["64mIHYqv", "dBdbcPWG", "8O3wH7pq"]}' \
    > test.out 2>&1
eval_tap $? 67 'GrantEntitlements' test.out

#- 68 RevokeEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeEntitlements \
    --namespace "$AB_NAMESPACE" \
    --body '["xcfKurlZ", "m2kGzRL5", "lXf4LU7e"]' \
    > test.out 2>&1
eval_tap $? 68 'RevokeEntitlements' test.out

#- 69 GetEntitlement
./ng net.accelbyte.sdk.cli.Main platform getEntitlement \
    --entitlementId 'wrFOWfjy' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 69 'GetEntitlement' test.out

#- 70 QueryFulfillmentHistories
./ng net.accelbyte.sdk.cli.Main platform queryFulfillmentHistories \
    --namespace "$AB_NAMESPACE" \
    --limit '37' \
    --offset '66' \
    --status 'SUCCESS' \
    --userId '5a7rgdDF' \
    > test.out 2>&1
eval_tap $? 70 'QueryFulfillmentHistories' test.out

#- 71 QueryIAPClawbackHistory
./ng net.accelbyte.sdk.cli.Main platform queryIAPClawbackHistory \
    --namespace "$AB_NAMESPACE" \
    --endTime '6kD3J8Af' \
    --eventType 'CHARGEBACK_REVERSED' \
    --externalOrderId 'lJjUXf7K' \
    --limit '41' \
    --offset '55' \
    --startTime 'Qc7CvcDe' \
    --status 'INIT' \
    --userId 'QD9e7zsw' \
    > test.out 2>&1
eval_tap $? 71 'QueryIAPClawbackHistory' test.out

#- 72 MockPlayStationStreamEvent
./ng net.accelbyte.sdk.cli.Main platform mockPlayStationStreamEvent \
    --namespace "$AB_NAMESPACE" \
    --body '{"body": {"account": "yYg5Q2so", "additionalData": {"entitlement": [{"clientTransaction": [{"amountConsumed": 11, "clientTransactionId": "CaLwpxJE"}, {"amountConsumed": 100, "clientTransactionId": "Nrx8PnFQ"}, {"amountConsumed": 0, "clientTransactionId": "NUzvemmj"}], "entitlementId": "fvMbRzYy", "usageCount": 36}, {"clientTransaction": [{"amountConsumed": 31, "clientTransactionId": "AbaLLCB2"}, {"amountConsumed": 40, "clientTransactionId": "N8oe6GZ0"}, {"amountConsumed": 9, "clientTransactionId": "52bw8kHV"}], "entitlementId": "8vJiITkf", "usageCount": 23}, {"clientTransaction": [{"amountConsumed": 14, "clientTransactionId": "LzwbhF9W"}, {"amountConsumed": 1, "clientTransactionId": "GdB7tvzP"}, {"amountConsumed": 15, "clientTransactionId": "yiuWiehn"}], "entitlementId": "mLSUWy7S", "usageCount": 69}], "purpose": "8hCiOrvJ"}, "originalTitleName": "LLodKJ0o", "paymentProductSKU": "YiYVzLum", "purchaseDate": "ViROISUk", "sourceOrderItemId": "EQeBbXpP", "titleName": "bDIMbRnU"}, "eventDomain": "avMslFok", "eventSource": "VlJvcpvC", "eventType": "okbMvpga", "eventVersion": 61, "id": "hshwxQ5B", "timestamp": "4SZVjMQ5"}' \
    > test.out 2>&1
eval_tap $? 72 'MockPlayStationStreamEvent' test.out

#- 73 MockXblClawbackEvent
./ng net.accelbyte.sdk.cli.Main platform mockXblClawbackEvent \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": {"eventDate": "yfruytWK", "eventState": "xgNw0l33", "lineItemId": "o9f6xhkF", "orderId": "kpNMNlJl", "productId": "gn9ruDF1", "productType": "g4Jbrfy0", "purchasedDate": "5xW7rlXC", "sandboxId": "2RFpXhCV", "skuId": "4DAO63Oe", "subscriptionData": {"consumedDurationInDays": 85, "dateTime": "Fx29JPzz", "durationInDays": 7, "recurrenceId": "NlhbLyRI"}}, "datacontenttype": "9w7pl9rt", "id": "jaVnpYtw", "source": "1c9KuPqD", "specVersion": "tRrGVfvD", "subject": "eTmnnXBf", "time": "FcZRkn4I", "traceparent": "QrdESWzy", "type": "sEr9kKyh"}' \
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
    --body '{"appAppleId": 53, "bundleId": "4fHE5oCL", "issuerId": "HBpgoix2", "keyId": "bQP5D4pN", "password": "ll8OL6cR", "version": "V1"}' \
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
    --body '{"sandboxId": "df4utuq6"}' \
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
    --body '{"applicationName": "3gTGvy7X", "notificationTokenAudience": "snlQIbKv", "notificationTokenEmail": "dPG6MI3M", "packageName": "hqolPLOn", "serviceAccountId": "07mh4lPv"}' \
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
    --body '{"data": [{"itemIdentity": "U9FNwhb6", "itemIdentityType": "ITEM_ID", "platformProductIdMap": {"VrA85HvS": "XQKiO6Zc", "hfIRpTuP": "kgaPldDK", "Pntl2xBu": "EfGiNmZO"}}, {"itemIdentity": "Sf43UvZD", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"n3fftw9S": "tncZ13ui", "iPidbBmt": "XvjMQRcH", "eLuVnde7": "GK9upabQ"}}, {"itemIdentity": "PkQVbIMC", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"g1GOlnRG": "3pP7PkwD", "6ZDEl1Us": "zbkGYJll", "jkvWKIM6": "QRPxpDYZ"}}]}' \
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
    --body '{"appId": "KasCnsdb", "appSecret": "x0BgP4eq"}' \
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
    --body '{"backOfficeServerClientId": "avnsweyU", "backOfficeServerClientSecret": "3gHMfre9", "enableStreamJob": false, "environment": "qm5gAXIS", "streamName": "663beZBA", "streamPartnerName": "f2klvmHb"}' \
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
    --body '{"backOfficeServerClientId": "e6QHQb3q", "backOfficeServerClientSecret": "xu3hnMwc", "enableStreamJob": false, "environment": "K35QZHz2", "streamName": "UyXWDdpI", "streamPartnerName": "2c4U9VjN"}' \
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
    --body '{"appId": "OuqcWanu", "publisherAuthenticationKey": "nhf1y6yX"}' \
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
    --body '{"clientId": "EdzTXwuT", "clientSecret": "X3FnGv1J", "organizationId": "a1pKLaX0"}' \
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
    --body '{"enableClawback": false, "entraAppClientId": "sP1iU7zi", "entraAppClientSecret": "8HPDU2Fb", "entraTenantId": "dyGBsBAQ", "relyingPartyCert": "2TFtjZPK"}' \
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
    --password 'v4WejjsG' \
    > test.out 2>&1
eval_tap $? 105 'UpdateXblBPCertFile' test.out

#- 106 QueryThirdPartyNotifications
./ng net.accelbyte.sdk.cli.Main platform queryThirdPartyNotifications \
    --namespace "$AB_NAMESPACE" \
    --endDate 'sRWDpcad' \
    --externalId '44nojMw4' \
    --limit '14' \
    --offset '23' \
    --source 'STEAM' \
    --startDate 'VU4iyVqH' \
    --status 'IGNORED' \
    --type 'F3RmyE3u' \
    > test.out 2>&1
eval_tap $? 106 'QueryThirdPartyNotifications' test.out

#- 107 QueryThirdPartySubscription
./ng net.accelbyte.sdk.cli.Main platform queryThirdPartySubscription \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --groupId '9nt6MgWL' \
    --limit '50' \
    --offset '98' \
    --platform 'PLAYSTATION' \
    --productId 'UEDfovlU' \
    --userId '0DtybPCr' \
    > test.out 2>&1
eval_tap $? 107 'QueryThirdPartySubscription' test.out

#- 108 GetIAPOrderConsumeDetails
./ng net.accelbyte.sdk.cli.Main platform getIAPOrderConsumeDetails \
    --iapOrderNo 'ggbJnoiv' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 108 'GetIAPOrderConsumeDetails' test.out

#- 109 DownloadInvoiceDetails
./ng net.accelbyte.sdk.cli.Main platform downloadInvoiceDetails \
    --namespace "$AB_NAMESPACE" \
    --endTime 'PqBHTwPM' \
    --feature 'I3jRuN9w' \
    --itemId 'KmER9YpN' \
    --itemType 'CODE' \
    --startTime 'GsLDJIP3' \
    > test.out 2>&1
eval_tap $? 109 'DownloadInvoiceDetails' test.out

#- 110 GenerateInvoiceSummary
./ng net.accelbyte.sdk.cli.Main platform generateInvoiceSummary \
    --namespace "$AB_NAMESPACE" \
    --endTime 'aMxsuDWU' \
    --feature 'O8AtIZWr' \
    --itemId 'e87RBmoM' \
    --itemType 'SUBSCRIPTION' \
    --startTime 'ac04BeGB' \
    > test.out 2>&1
eval_tap $? 110 'GenerateInvoiceSummary' test.out

#- 111 SyncInGameItem
./ng net.accelbyte.sdk.cli.Main platform syncInGameItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ZzwjP2IA' \
    --body '{"categoryPath": "PF420N8c", "targetItemId": "im3otYOY", "targetNamespace": "HOq4DsSN"}' \
    > test.out 2>&1
eval_tap $? 111 'SyncInGameItem' test.out

#- 112 CreateItem
./ng net.accelbyte.sdk.cli.Main platform createItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'w8myUUNq' \
    --body '{"appId": "8rtTYYbQ", "appType": "DLC", "baseAppId": "dKj5rhAH", "boothName": "RaihdMSx", "categoryPath": "b6SOdon3", "clazz": "khZd08rT", "displayOrder": 57, "entitlementType": "DURABLE", "ext": {"8JVmHSHv": {}, "VJu75lJm": {}, "Gve2yko4": {}}, "features": ["y4evaZl3", "eJR5yAn1", "GciLcOwx"], "flexible": false, "images": [{"as": "5hTCljzE", "caption": "XZsdN0HM", "height": 9, "imageUrl": "ufJP3xVu", "smallImageUrl": "gGvePVET", "width": 47}, {"as": "WqmR1xve", "caption": "YmJVMd4C", "height": 21, "imageUrl": "C6x0gyN4", "smallImageUrl": "XQV8iJ0U", "width": 75}, {"as": "kDgCMSlg", "caption": "jltZGy8P", "height": 88, "imageUrl": "HqnebyhX", "smallImageUrl": "RdCpfE8T", "width": 10}], "inventoryConfig": {"customAttributes": {"hoa5P3y5": {}, "6vGYUiIQ": {}, "9OMNBj2l": {}}, "serverCustomAttributes": {"5dzvbGMr": {}, "eGRF4zed": {}, "KgTPFrMp": {}}, "slotUsed": 95}, "itemIds": ["op3iueGe", "tVuAxQWx", "Z4Fl3Iel"], "itemQty": {"S0zOiDSO": 15, "Vxx05gVE": 59, "hXckwfny": 7}, "itemType": "LOOTBOX", "listable": false, "localizations": {"msLZr1cv": {"description": "SGR3kHzT", "localExt": {"gttpbkSl": {}, "IYPzzOJq": {}, "UnPumli1": {}}, "longDescription": "4zPQTZtU", "title": "WayYnn4B"}, "9rHhf0Cm": {"description": "yIwgsZeT", "localExt": {"bMjVWr5l": {}, "E2NkEMcZ": {}, "xl9MPJSk": {}}, "longDescription": "1urRCNZF", "title": "K4TZL8KZ"}, "6x3K1MsE": {"description": "RBZTv52k", "localExt": {"vAir40uC": {}, "g2hCgmKb": {}, "QKZ6IRro": {}}, "longDescription": "EIlQWy0H", "title": "laspHHtH"}}, "lootBoxConfig": {"rewardCount": 16, "rewards": [{"lootBoxItems": [{"count": 71, "duration": 72, "endDate": "1997-08-12T00:00:00Z", "itemId": "t68TgXXW", "itemSku": "lJHWFRyx", "itemType": "MBYQys7V"}, {"count": 17, "duration": 18, "endDate": "1977-06-13T00:00:00Z", "itemId": "ZY832GBB", "itemSku": "A93WUwNV", "itemType": "Ak2yqGT1"}, {"count": 47, "duration": 87, "endDate": "1993-03-04T00:00:00Z", "itemId": "9OqngQkL", "itemSku": "0B3LfRnC", "itemType": "7IIDc9jM"}], "name": "agmCWnbc", "odds": 0.9817089397851021, "type": "PROBABILITY_GROUP", "weight": 44}, {"lootBoxItems": [{"count": 33, "duration": 76, "endDate": "1987-11-22T00:00:00Z", "itemId": "YIOyrvfb", "itemSku": "jZQSUlP8", "itemType": "2UGKejDQ"}, {"count": 5, "duration": 42, "endDate": "1974-05-20T00:00:00Z", "itemId": "GtWNiyAP", "itemSku": "9NezGwXY", "itemType": "3IbriD2X"}, {"count": 49, "duration": 38, "endDate": "1978-04-10T00:00:00Z", "itemId": "XCsCm2CU", "itemSku": "7wVkZHHH", "itemType": "rjsRuOUb"}], "name": "JfsIBTzC", "odds": 0.6911468882679087, "type": "REWARD_GROUP", "weight": 0}, {"lootBoxItems": [{"count": 79, "duration": 54, "endDate": "1985-02-17T00:00:00Z", "itemId": "ltDnjKhK", "itemSku": "xqtosxMK", "itemType": "fcS3VFMf"}, {"count": 82, "duration": 82, "endDate": "1978-02-20T00:00:00Z", "itemId": "PC1YRKZp", "itemSku": "S6IBfMQG", "itemType": "ltiJzAL0"}, {"count": 99, "duration": 86, "endDate": "1973-07-29T00:00:00Z", "itemId": "c8pqYTzC", "itemSku": "ZlJw4aoc", "itemType": "dB3v93P8"}], "name": "nNMHe6iu", "odds": 0.14833945205317522, "type": "REWARD", "weight": 47}], "rollFunction": "CUSTOM"}, "maxCount": 28, "maxCountPerUser": 25, "name": "9iYB8Kbg", "optionBoxConfig": {"boxItems": [{"count": 60, "duration": 35, "endDate": "1997-12-04T00:00:00Z", "itemId": "j8wb1GoS", "itemSku": "Q8f4Oqlj", "itemType": "cH7NwpZW"}, {"count": 93, "duration": 87, "endDate": "1981-05-24T00:00:00Z", "itemId": "EmKsHb23", "itemSku": "9rCbMW6o", "itemType": "zGduV7Av"}, {"count": 17, "duration": 48, "endDate": "1992-12-06T00:00:00Z", "itemId": "dJXZucyF", "itemSku": "ArU0D6w2", "itemType": "NVaHHYDP"}]}, "purchasable": false, "recurring": {"cycle": "QUARTERLY", "fixedFreeDays": 81, "fixedTrialCycles": 33, "graceDays": 1}, "regionData": {"iAKz5r65": [{"currencyCode": "cHoH66sl", "currencyNamespace": "xMr4RIe4", "currencyType": "REAL", "discountAmount": 91, "discountExpireAt": "1998-08-27T00:00:00Z", "discountPercentage": 70, "discountPurchaseAt": "1991-09-11T00:00:00Z", "expireAt": "1992-10-06T00:00:00Z", "price": 25, "purchaseAt": "1995-12-15T00:00:00Z", "trialPrice": 69}, {"currencyCode": "bZ0U19GX", "currencyNamespace": "Qbke4yie", "currencyType": "REAL", "discountAmount": 34, "discountExpireAt": "1991-12-02T00:00:00Z", "discountPercentage": 11, "discountPurchaseAt": "1990-06-10T00:00:00Z", "expireAt": "1972-11-09T00:00:00Z", "price": 63, "purchaseAt": "1986-03-27T00:00:00Z", "trialPrice": 98}, {"currencyCode": "9QdScdii", "currencyNamespace": "h6b55Tkh", "currencyType": "REAL", "discountAmount": 32, "discountExpireAt": "1975-06-13T00:00:00Z", "discountPercentage": 29, "discountPurchaseAt": "1990-08-05T00:00:00Z", "expireAt": "1995-11-02T00:00:00Z", "price": 33, "purchaseAt": "1974-05-15T00:00:00Z", "trialPrice": 11}], "JjYyrvNy": [{"currencyCode": "v99MfMyf", "currencyNamespace": "k2hEUkzv", "currencyType": "REAL", "discountAmount": 67, "discountExpireAt": "1983-02-23T00:00:00Z", "discountPercentage": 91, "discountPurchaseAt": "1971-06-01T00:00:00Z", "expireAt": "1975-02-17T00:00:00Z", "price": 93, "purchaseAt": "1978-01-21T00:00:00Z", "trialPrice": 73}, {"currencyCode": "4j6bVdLR", "currencyNamespace": "4Q7ohfKM", "currencyType": "VIRTUAL", "discountAmount": 14, "discountExpireAt": "1991-03-19T00:00:00Z", "discountPercentage": 14, "discountPurchaseAt": "1982-07-03T00:00:00Z", "expireAt": "1999-06-02T00:00:00Z", "price": 25, "purchaseAt": "1991-05-21T00:00:00Z", "trialPrice": 49}, {"currencyCode": "FgPSiTVW", "currencyNamespace": "FpfIMZpo", "currencyType": "REAL", "discountAmount": 59, "discountExpireAt": "1973-08-15T00:00:00Z", "discountPercentage": 90, "discountPurchaseAt": "1980-05-05T00:00:00Z", "expireAt": "1973-11-07T00:00:00Z", "price": 15, "purchaseAt": "1995-01-14T00:00:00Z", "trialPrice": 56}], "pqm3oBmx": [{"currencyCode": "4iUQ57Ps", "currencyNamespace": "xOctBlxK", "currencyType": "REAL", "discountAmount": 35, "discountExpireAt": "1981-04-06T00:00:00Z", "discountPercentage": 40, "discountPurchaseAt": "1993-04-18T00:00:00Z", "expireAt": "1976-03-13T00:00:00Z", "price": 50, "purchaseAt": "1990-11-23T00:00:00Z", "trialPrice": 10}, {"currencyCode": "1mWkiGlf", "currencyNamespace": "q4kUL3lO", "currencyType": "VIRTUAL", "discountAmount": 61, "discountExpireAt": "1991-05-13T00:00:00Z", "discountPercentage": 94, "discountPurchaseAt": "1980-03-23T00:00:00Z", "expireAt": "1989-07-10T00:00:00Z", "price": 18, "purchaseAt": "1993-02-19T00:00:00Z", "trialPrice": 66}, {"currencyCode": "yZQVNe5Q", "currencyNamespace": "1cWAcmI8", "currencyType": "REAL", "discountAmount": 47, "discountExpireAt": "1998-12-29T00:00:00Z", "discountPercentage": 15, "discountPurchaseAt": "1999-04-17T00:00:00Z", "expireAt": "1997-07-06T00:00:00Z", "price": 21, "purchaseAt": "1976-02-23T00:00:00Z", "trialPrice": 93}]}, "saleConfig": {"currencyCode": "7rbnnccy", "price": 84}, "seasonType": "PASS", "sectionExclusive": false, "sellable": false, "sku": "l9J7GuQo", "stackable": false, "status": "ACTIVE", "tags": ["Fpha6nB3", "EeKuonPk", "21cdmkIk"], "targetCurrencyCode": "GvjYOmu5", "targetNamespace": "EFDOkyNe", "thumbnailUrl": "Jsen61Rr", "useCount": 50}' \
    > test.out 2>&1
eval_tap $? 112 'CreateItem' test.out

#- 113 GetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform getItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'Z2n32lCA' \
    --appId 'JYynQr1K' \
    > test.out 2>&1
eval_tap $? 113 'GetItemByAppId' test.out

#- 114 QueryItems
./ng net.accelbyte.sdk.cli.Main platform queryItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --appType 'GAME' \
    --availableDate 'hKfdYvT9' \
    --baseAppId 'arQ6A28i' \
    --categoryPath '1b3a6qMK' \
    --features 'easv0QzY' \
    --includeSubCategoryItem  \
    --itemType 'CODE' \
    --limit '37' \
    --offset '100' \
    --region 'EtmviwWk' \
    --sortBy 'displayOrder:asc,displayOrder,createdAt:asc' \
    --storeId 'Tu81KQxK' \
    --tags 'BjvdA0XF' \
    --targetNamespace 'fYVUHDRA' \
    > test.out 2>&1
eval_tap $? 114 'QueryItems' test.out

#- 115 ListBasicItemsByFeatures
./ng net.accelbyte.sdk.cli.Main platform listBasicItemsByFeatures \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --features 'DaZym1pg,s7tcQUj3,sHKxf1v5' \
    > test.out 2>&1
eval_tap $? 115 'ListBasicItemsByFeatures' test.out

#- 116 GetItems
./ng net.accelbyte.sdk.cli.Main platform getItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'WzJwXISk' \
    --itemIds 'yTNIGHZg' \
    > test.out 2>&1
eval_tap $? 116 'GetItems' test.out

#- 117 GetItemBySku
./ng net.accelbyte.sdk.cli.Main platform getItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'UIP0L3QU' \
    --sku 'PzM4S8jJ' \
    > test.out 2>&1
eval_tap $? 117 'GetItemBySku' test.out

#- 118 GetLocaleItemBySku
./ng net.accelbyte.sdk.cli.Main platform getLocaleItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'Vy3oxihr' \
    --populateBundle  \
    --region '9zilfui3' \
    --storeId 'hjMNxiK7' \
    --sku 'v4WfhTta' \
    > test.out 2>&1
eval_tap $? 118 'GetLocaleItemBySku' test.out

#- 119 GetEstimatedPrice
./ng net.accelbyte.sdk.cli.Main platform getEstimatedPrice \
    --namespace "$AB_NAMESPACE" \
    --platform 'Qy6QKyXy' \
    --region 'I59QSDdD' \
    --storeId 'eBrkvkEg' \
    --itemIds 'TInN0Reb' \
    --userId 'Jv20YQRp' \
    > test.out 2>&1
eval_tap $? 119 'GetEstimatedPrice' test.out

#- 120 GetItemIdBySku
./ng net.accelbyte.sdk.cli.Main platform getItemIdBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'URap822I' \
    --sku 'L9P5qYfn' \
    > test.out 2>&1
eval_tap $? 120 'GetItemIdBySku' test.out

#- 121 GetBulkItemIdBySkus
./ng net.accelbyte.sdk.cli.Main platform getBulkItemIdBySkus \
    --namespace "$AB_NAMESPACE" \
    --sku 'ZENJD0mW,sDRFDUPr,HJgCIzHK' \
    --storeId 'FTW4SxcU' \
    > test.out 2>&1
eval_tap $? 121 'GetBulkItemIdBySkus' test.out

#- 122 BulkGetLocaleItems
./ng net.accelbyte.sdk.cli.Main platform bulkGetLocaleItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'fWJXcx2x' \
    --region 'UMoFchlt' \
    --storeId 'Cpdev8Uo' \
    --itemIds '1Sem1i1V' \
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
    --platform '0613TelC' \
    --userId '67mW8oLX' \
    --body '{"itemIds": ["vgBEVyXZ", "rBeeHXZL", "o0e1jCWC"]}' \
    > test.out 2>&1
eval_tap $? 124 'ValidateItemPurchaseCondition' test.out

#- 125 BulkUpdateRegionData
./ng net.accelbyte.sdk.cli.Main platform bulkUpdateRegionData \
    --namespace "$AB_NAMESPACE" \
    --storeId 'PLqBACKD' \
    --body '{"changes": [{"itemIdentities": ["5hoTFU9g", "3F83Fs3o", "OUxGuS7E"], "itemIdentityType": "ITEM_ID", "regionData": {"yuKTui7A": [{"currencyCode": "nwlBhjr2", "currencyNamespace": "xSQBTby6", "currencyType": "REAL", "discountAmount": 98, "discountExpireAt": "1979-02-09T00:00:00Z", "discountPercentage": 75, "discountPurchaseAt": "1995-10-25T00:00:00Z", "discountedPrice": 72, "expireAt": "1983-12-13T00:00:00Z", "price": 97, "purchaseAt": "1975-06-30T00:00:00Z", "trialPrice": 14}, {"currencyCode": "zl8lbsKt", "currencyNamespace": "rXkYWDlT", "currencyType": "VIRTUAL", "discountAmount": 100, "discountExpireAt": "1983-09-29T00:00:00Z", "discountPercentage": 61, "discountPurchaseAt": "1976-11-13T00:00:00Z", "discountedPrice": 11, "expireAt": "1980-04-26T00:00:00Z", "price": 47, "purchaseAt": "1999-03-14T00:00:00Z", "trialPrice": 68}, {"currencyCode": "GRGxWe7O", "currencyNamespace": "nf2aL1X6", "currencyType": "VIRTUAL", "discountAmount": 37, "discountExpireAt": "1976-04-06T00:00:00Z", "discountPercentage": 57, "discountPurchaseAt": "1982-11-19T00:00:00Z", "discountedPrice": 86, "expireAt": "1998-11-29T00:00:00Z", "price": 69, "purchaseAt": "1998-10-11T00:00:00Z", "trialPrice": 19}], "NJjq6ESb": [{"currencyCode": "futBsDLf", "currencyNamespace": "kcE2lcfW", "currencyType": "REAL", "discountAmount": 84, "discountExpireAt": "1991-12-11T00:00:00Z", "discountPercentage": 95, "discountPurchaseAt": "1995-03-07T00:00:00Z", "discountedPrice": 58, "expireAt": "1975-08-26T00:00:00Z", "price": 71, "purchaseAt": "1992-07-04T00:00:00Z", "trialPrice": 32}, {"currencyCode": "DoiuV9ia", "currencyNamespace": "TYHerbE1", "currencyType": "VIRTUAL", "discountAmount": 25, "discountExpireAt": "1987-07-23T00:00:00Z", "discountPercentage": 96, "discountPurchaseAt": "1975-08-07T00:00:00Z", "discountedPrice": 46, "expireAt": "1978-03-31T00:00:00Z", "price": 4, "purchaseAt": "1997-02-23T00:00:00Z", "trialPrice": 25}, {"currencyCode": "8lW1QNmc", "currencyNamespace": "PyPVuLGC", "currencyType": "VIRTUAL", "discountAmount": 99, "discountExpireAt": "1980-09-10T00:00:00Z", "discountPercentage": 44, "discountPurchaseAt": "1976-09-01T00:00:00Z", "discountedPrice": 100, "expireAt": "1971-04-28T00:00:00Z", "price": 8, "purchaseAt": "1991-07-27T00:00:00Z", "trialPrice": 62}], "JH3EFR2k": [{"currencyCode": "mvx2qo5h", "currencyNamespace": "J2gHhpGm", "currencyType": "REAL", "discountAmount": 47, "discountExpireAt": "1975-02-22T00:00:00Z", "discountPercentage": 29, "discountPurchaseAt": "1995-05-15T00:00:00Z", "discountedPrice": 80, "expireAt": "1980-05-23T00:00:00Z", "price": 58, "purchaseAt": "1984-06-28T00:00:00Z", "trialPrice": 24}, {"currencyCode": "sUfbq5e7", "currencyNamespace": "sJV7K9le", "currencyType": "VIRTUAL", "discountAmount": 24, "discountExpireAt": "1986-08-17T00:00:00Z", "discountPercentage": 47, "discountPurchaseAt": "1992-06-23T00:00:00Z", "discountedPrice": 24, "expireAt": "1981-05-17T00:00:00Z", "price": 36, "purchaseAt": "1979-05-12T00:00:00Z", "trialPrice": 50}, {"currencyCode": "NwEL17xp", "currencyNamespace": "ISMO9s5H", "currencyType": "REAL", "discountAmount": 61, "discountExpireAt": "1984-02-04T00:00:00Z", "discountPercentage": 62, "discountPurchaseAt": "1993-09-03T00:00:00Z", "discountedPrice": 65, "expireAt": "1976-01-23T00:00:00Z", "price": 81, "purchaseAt": "1992-08-15T00:00:00Z", "trialPrice": 61}]}}, {"itemIdentities": ["u9MffMhs", "XguidX0B", "XWcQ5tk1"], "itemIdentityType": "ITEM_ID", "regionData": {"jT3N4eVr": [{"currencyCode": "jOgxFjLJ", "currencyNamespace": "MMD3MYUK", "currencyType": "REAL", "discountAmount": 44, "discountExpireAt": "1987-12-02T00:00:00Z", "discountPercentage": 18, "discountPurchaseAt": "1995-04-17T00:00:00Z", "discountedPrice": 58, "expireAt": "1992-07-27T00:00:00Z", "price": 31, "purchaseAt": "1977-09-06T00:00:00Z", "trialPrice": 48}, {"currencyCode": "ai0sCxdN", "currencyNamespace": "D02tYMYT", "currencyType": "VIRTUAL", "discountAmount": 86, "discountExpireAt": "1999-05-07T00:00:00Z", "discountPercentage": 56, "discountPurchaseAt": "1988-07-25T00:00:00Z", "discountedPrice": 100, "expireAt": "1983-01-13T00:00:00Z", "price": 91, "purchaseAt": "1978-12-27T00:00:00Z", "trialPrice": 75}, {"currencyCode": "ZQvywNZf", "currencyNamespace": "EfTePJoQ", "currencyType": "REAL", "discountAmount": 77, "discountExpireAt": "1997-11-21T00:00:00Z", "discountPercentage": 20, "discountPurchaseAt": "1988-03-06T00:00:00Z", "discountedPrice": 73, "expireAt": "1995-06-21T00:00:00Z", "price": 27, "purchaseAt": "1984-06-11T00:00:00Z", "trialPrice": 23}], "rjzDFkFM": [{"currencyCode": "dZH4ITB2", "currencyNamespace": "WXOlaVgL", "currencyType": "REAL", "discountAmount": 5, "discountExpireAt": "1985-03-13T00:00:00Z", "discountPercentage": 57, "discountPurchaseAt": "1978-04-04T00:00:00Z", "discountedPrice": 4, "expireAt": "1975-01-15T00:00:00Z", "price": 10, "purchaseAt": "1987-01-24T00:00:00Z", "trialPrice": 34}, {"currencyCode": "KEVui3rF", "currencyNamespace": "AO1AMEYo", "currencyType": "REAL", "discountAmount": 39, "discountExpireAt": "1971-01-03T00:00:00Z", "discountPercentage": 71, "discountPurchaseAt": "1979-02-24T00:00:00Z", "discountedPrice": 37, "expireAt": "1978-03-12T00:00:00Z", "price": 48, "purchaseAt": "1994-09-10T00:00:00Z", "trialPrice": 98}, {"currencyCode": "UJ9Cx1D6", "currencyNamespace": "K8Z1SS7e", "currencyType": "REAL", "discountAmount": 11, "discountExpireAt": "1989-01-13T00:00:00Z", "discountPercentage": 24, "discountPurchaseAt": "1997-12-19T00:00:00Z", "discountedPrice": 88, "expireAt": "1977-11-09T00:00:00Z", "price": 48, "purchaseAt": "1993-03-17T00:00:00Z", "trialPrice": 16}], "xxrjdDU2": [{"currencyCode": "h6qTVsjy", "currencyNamespace": "b72R2QSd", "currencyType": "REAL", "discountAmount": 41, "discountExpireAt": "1999-09-01T00:00:00Z", "discountPercentage": 63, "discountPurchaseAt": "1986-09-01T00:00:00Z", "discountedPrice": 5, "expireAt": "1991-04-04T00:00:00Z", "price": 87, "purchaseAt": "1990-09-10T00:00:00Z", "trialPrice": 31}, {"currencyCode": "tHe8HtUb", "currencyNamespace": "wXfugZ0g", "currencyType": "REAL", "discountAmount": 34, "discountExpireAt": "1997-11-02T00:00:00Z", "discountPercentage": 7, "discountPurchaseAt": "1980-06-10T00:00:00Z", "discountedPrice": 85, "expireAt": "1985-07-26T00:00:00Z", "price": 67, "purchaseAt": "1989-10-04T00:00:00Z", "trialPrice": 70}, {"currencyCode": "CCcb6neb", "currencyNamespace": "z43eklhN", "currencyType": "VIRTUAL", "discountAmount": 32, "discountExpireAt": "1991-08-21T00:00:00Z", "discountPercentage": 51, "discountPurchaseAt": "1971-03-25T00:00:00Z", "discountedPrice": 59, "expireAt": "1977-01-02T00:00:00Z", "price": 5, "purchaseAt": "1997-12-20T00:00:00Z", "trialPrice": 37}]}}, {"itemIdentities": ["sA0zmtOb", "cVBHQdHv", "FMmtA2Kj"], "itemIdentityType": "ITEM_SKU", "regionData": {"gLdnI7m2": [{"currencyCode": "flKPDPXt", "currencyNamespace": "rB82T2Lm", "currencyType": "REAL", "discountAmount": 38, "discountExpireAt": "1986-06-27T00:00:00Z", "discountPercentage": 33, "discountPurchaseAt": "1988-05-17T00:00:00Z", "discountedPrice": 29, "expireAt": "1994-11-19T00:00:00Z", "price": 71, "purchaseAt": "1973-02-19T00:00:00Z", "trialPrice": 82}, {"currencyCode": "i8tezvH0", "currencyNamespace": "uPZXLUGS", "currencyType": "VIRTUAL", "discountAmount": 56, "discountExpireAt": "1981-06-03T00:00:00Z", "discountPercentage": 96, "discountPurchaseAt": "1991-04-16T00:00:00Z", "discountedPrice": 46, "expireAt": "1972-08-30T00:00:00Z", "price": 59, "purchaseAt": "1984-09-19T00:00:00Z", "trialPrice": 16}, {"currencyCode": "lUKlbtDa", "currencyNamespace": "r4cDQG3k", "currencyType": "REAL", "discountAmount": 36, "discountExpireAt": "1995-04-19T00:00:00Z", "discountPercentage": 73, "discountPurchaseAt": "1975-07-24T00:00:00Z", "discountedPrice": 88, "expireAt": "1999-03-03T00:00:00Z", "price": 7, "purchaseAt": "1999-09-21T00:00:00Z", "trialPrice": 24}], "GDIamiEG": [{"currencyCode": "DdWhtYHI", "currencyNamespace": "Tw0bjnIy", "currencyType": "REAL", "discountAmount": 35, "discountExpireAt": "1986-01-31T00:00:00Z", "discountPercentage": 94, "discountPurchaseAt": "1990-11-16T00:00:00Z", "discountedPrice": 47, "expireAt": "1985-07-21T00:00:00Z", "price": 26, "purchaseAt": "1972-11-28T00:00:00Z", "trialPrice": 30}, {"currencyCode": "dXNn35iB", "currencyNamespace": "OPC4WHkz", "currencyType": "VIRTUAL", "discountAmount": 16, "discountExpireAt": "1976-01-01T00:00:00Z", "discountPercentage": 26, "discountPurchaseAt": "1992-03-28T00:00:00Z", "discountedPrice": 60, "expireAt": "1993-04-18T00:00:00Z", "price": 54, "purchaseAt": "1992-02-10T00:00:00Z", "trialPrice": 50}, {"currencyCode": "DwcgXiG7", "currencyNamespace": "0S6UtZkP", "currencyType": "REAL", "discountAmount": 63, "discountExpireAt": "1987-11-08T00:00:00Z", "discountPercentage": 40, "discountPurchaseAt": "1995-01-16T00:00:00Z", "discountedPrice": 48, "expireAt": "1996-05-17T00:00:00Z", "price": 31, "purchaseAt": "1974-11-17T00:00:00Z", "trialPrice": 28}], "upCCtdiL": [{"currencyCode": "rugHeWWq", "currencyNamespace": "1NEJFTD1", "currencyType": "REAL", "discountAmount": 62, "discountExpireAt": "1973-10-04T00:00:00Z", "discountPercentage": 30, "discountPurchaseAt": "1998-05-05T00:00:00Z", "discountedPrice": 79, "expireAt": "1976-05-04T00:00:00Z", "price": 56, "purchaseAt": "1991-05-29T00:00:00Z", "trialPrice": 89}, {"currencyCode": "qe4Re0Kh", "currencyNamespace": "E0RQLLSX", "currencyType": "REAL", "discountAmount": 37, "discountExpireAt": "1988-04-28T00:00:00Z", "discountPercentage": 23, "discountPurchaseAt": "1998-05-16T00:00:00Z", "discountedPrice": 15, "expireAt": "1981-04-27T00:00:00Z", "price": 24, "purchaseAt": "1988-09-28T00:00:00Z", "trialPrice": 42}, {"currencyCode": "PghfRXkL", "currencyNamespace": "HjZr3hAY", "currencyType": "REAL", "discountAmount": 34, "discountExpireAt": "1985-07-15T00:00:00Z", "discountPercentage": 84, "discountPurchaseAt": "1978-10-22T00:00:00Z", "discountedPrice": 98, "expireAt": "1992-04-22T00:00:00Z", "price": 4, "purchaseAt": "1989-04-28T00:00:00Z", "trialPrice": 75}]}}]}' \
    > test.out 2>&1
eval_tap $? 125 'BulkUpdateRegionData' test.out

#- 126 SearchItems
./ng net.accelbyte.sdk.cli.Main platform searchItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemType 'EXTENSION' \
    --limit '57' \
    --offset '92' \
    --sortBy 'uOb6kegd' \
    --storeId 'zmmFPW08' \
    --keyword 'xPA8BFRL' \
    --language 'IJIwhd5V' \
    > test.out 2>&1
eval_tap $? 126 'SearchItems' test.out

#- 127 QueryUncategorizedItems
./ng net.accelbyte.sdk.cli.Main platform queryUncategorizedItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --limit '32' \
    --offset '71' \
    --sortBy 'name:desc,displayOrder:asc,displayOrder' \
    --storeId 'NoFsIn0r' \
    > test.out 2>&1
eval_tap $? 127 'QueryUncategorizedItems' test.out

#- 128 GetItem
./ng net.accelbyte.sdk.cli.Main platform getItem \
    --itemId 'Sf7qsPK6' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'iOdX8HGY' \
    > test.out 2>&1
eval_tap $? 128 'GetItem' test.out

#- 129 UpdateItem
./ng net.accelbyte.sdk.cli.Main platform updateItem \
    --itemId 'DEqDzBo6' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'rxwuP1Q5' \
    --body '{"appId": "91TvDKMn", "appType": "SOFTWARE", "baseAppId": "zM5uzXiB", "boothName": "HoOkwVur", "categoryPath": "LeAUGHGH", "clazz": "XNskmRtu", "displayOrder": 44, "entitlementType": "DURABLE", "ext": {"3L8vNV5H": {}, "c1wXhTLW": {}, "pnGFhbXn": {}}, "features": ["LgzffZyM", "zssXm5kf", "J848Xj15"], "flexible": false, "images": [{"as": "NJ1yIls2", "caption": "Sgjjf8Nt", "height": 26, "imageUrl": "IA1p5olH", "smallImageUrl": "HLwjjmnr", "width": 32}, {"as": "qQVut0rj", "caption": "8wWqNInH", "height": 55, "imageUrl": "iOFJATvR", "smallImageUrl": "QEKYu96q", "width": 59}, {"as": "tf77nj1P", "caption": "b2TBPi5e", "height": 26, "imageUrl": "Y52gXBlL", "smallImageUrl": "LHkxP2zK", "width": 58}], "inventoryConfig": {"customAttributes": {"i5gzyu1R": {}, "QsbiJIbx": {}, "mcWwSB95": {}}, "serverCustomAttributes": {"Q4FkzZts": {}, "SWOYt29Z": {}, "bPYBHlVq": {}}, "slotUsed": 73}, "itemIds": ["q6yUs7Vu", "bSiGUKRV", "BfG0zp5b"], "itemQty": {"kyyQZZ1J": 47, "IYUs4tNZ": 98, "HIKjnP4K": 7}, "itemType": "OPTIONBOX", "listable": true, "localizations": {"037R2Nce": {"description": "cgcPKeFn", "localExt": {"3Dpv8yDV": {}, "lgNFo46I": {}, "BmrxgoKk": {}}, "longDescription": "3LCFdJe8", "title": "NaLK1lhx"}, "HAMwXBTu": {"description": "oYsd3qWZ", "localExt": {"0sRTTjpU": {}, "4aKz6P9I": {}, "lNVSMLAq": {}}, "longDescription": "Vvmarevv", "title": "ZFKkCVle"}, "c3zLDVPi": {"description": "KUA1NXn9", "localExt": {"HQ0FEkoU": {}, "0VCI9Elp": {}, "lpMhTeWL": {}}, "longDescription": "Wvli7w0W", "title": "0hb8h21S"}}, "lootBoxConfig": {"rewardCount": 100, "rewards": [{"lootBoxItems": [{"count": 62, "duration": 94, "endDate": "1987-07-24T00:00:00Z", "itemId": "zOXNJuzY", "itemSku": "Skc5ZcnH", "itemType": "Gk1HBAih"}, {"count": 54, "duration": 33, "endDate": "1972-01-01T00:00:00Z", "itemId": "9ri8jAZ2", "itemSku": "isDnMMQl", "itemType": "jBZe1sqJ"}, {"count": 14, "duration": 34, "endDate": "1993-10-23T00:00:00Z", "itemId": "OS9IMxET", "itemSku": "ljyFpR6B", "itemType": "iXMLpGR6"}], "name": "aJ9Z6UZq", "odds": 0.23051033849036584, "type": "REWARD_GROUP", "weight": 90}, {"lootBoxItems": [{"count": 70, "duration": 32, "endDate": "1990-11-01T00:00:00Z", "itemId": "OL54E32S", "itemSku": "pIsmOnNz", "itemType": "iRCPwlXS"}, {"count": 46, "duration": 35, "endDate": "1971-09-04T00:00:00Z", "itemId": "qscsyjRd", "itemSku": "l6Vc0WnG", "itemType": "x0iT7ECK"}, {"count": 58, "duration": 45, "endDate": "1984-08-10T00:00:00Z", "itemId": "SlhrBhXA", "itemSku": "sc1suVa7", "itemType": "3g0cnj57"}], "name": "SctK1p3P", "odds": 0.8439351323137079, "type": "REWARD_GROUP", "weight": 66}, {"lootBoxItems": [{"count": 18, "duration": 11, "endDate": "1971-10-02T00:00:00Z", "itemId": "UuvGGYtw", "itemSku": "hJVZKBDH", "itemType": "UQiUIlB2"}, {"count": 5, "duration": 9, "endDate": "1971-09-22T00:00:00Z", "itemId": "F5pndqov", "itemSku": "bvooMEmG", "itemType": "SSujuCFz"}, {"count": 58, "duration": 49, "endDate": "1983-02-07T00:00:00Z", "itemId": "NNQ6iSMk", "itemSku": "98DGu8gc", "itemType": "MnH82icL"}], "name": "WQrTjeov", "odds": 0.723113841157016, "type": "REWARD_GROUP", "weight": 14}], "rollFunction": "DEFAULT"}, "maxCount": 47, "maxCountPerUser": 75, "name": "DE0yD3eK", "optionBoxConfig": {"boxItems": [{"count": 30, "duration": 38, "endDate": "1983-11-28T00:00:00Z", "itemId": "SFXFwNPI", "itemSku": "iXVJZpyT", "itemType": "NPJmQsbn"}, {"count": 28, "duration": 13, "endDate": "1990-09-24T00:00:00Z", "itemId": "5khPhOnI", "itemSku": "HhuUkzfR", "itemType": "6P8vcnrR"}, {"count": 86, "duration": 14, "endDate": "1999-10-03T00:00:00Z", "itemId": "tjAahg5j", "itemSku": "1RfbQ1WQ", "itemType": "FC1Jubl8"}]}, "purchasable": false, "recurring": {"cycle": "WEEKLY", "fixedFreeDays": 46, "fixedTrialCycles": 89, "graceDays": 89}, "regionData": {"CkNZ9LEx": [{"currencyCode": "gcST66lt", "currencyNamespace": "uEkV56l2", "currencyType": "VIRTUAL", "discountAmount": 29, "discountExpireAt": "1993-09-07T00:00:00Z", "discountPercentage": 18, "discountPurchaseAt": "1971-10-31T00:00:00Z", "expireAt": "1972-11-12T00:00:00Z", "price": 33, "purchaseAt": "1978-01-27T00:00:00Z", "trialPrice": 24}, {"currencyCode": "S6QicY0r", "currencyNamespace": "iR8BWR0o", "currencyType": "REAL", "discountAmount": 69, "discountExpireAt": "1977-04-19T00:00:00Z", "discountPercentage": 26, "discountPurchaseAt": "1997-07-07T00:00:00Z", "expireAt": "1973-10-16T00:00:00Z", "price": 36, "purchaseAt": "1998-06-21T00:00:00Z", "trialPrice": 52}, {"currencyCode": "AOn7wgWP", "currencyNamespace": "OJt1MVCK", "currencyType": "REAL", "discountAmount": 68, "discountExpireAt": "1994-02-17T00:00:00Z", "discountPercentage": 16, "discountPurchaseAt": "1971-04-21T00:00:00Z", "expireAt": "1978-01-23T00:00:00Z", "price": 64, "purchaseAt": "1984-09-12T00:00:00Z", "trialPrice": 8}], "kZDjfs95": [{"currencyCode": "qbpo7YIs", "currencyNamespace": "rRb8hmez", "currencyType": "REAL", "discountAmount": 8, "discountExpireAt": "1976-04-13T00:00:00Z", "discountPercentage": 50, "discountPurchaseAt": "1976-04-27T00:00:00Z", "expireAt": "1981-11-30T00:00:00Z", "price": 69, "purchaseAt": "1998-04-28T00:00:00Z", "trialPrice": 32}, {"currencyCode": "vPyLWysw", "currencyNamespace": "IN4sOkfb", "currencyType": "VIRTUAL", "discountAmount": 87, "discountExpireAt": "1992-07-09T00:00:00Z", "discountPercentage": 47, "discountPurchaseAt": "1976-09-06T00:00:00Z", "expireAt": "1979-04-26T00:00:00Z", "price": 30, "purchaseAt": "1988-06-13T00:00:00Z", "trialPrice": 52}, {"currencyCode": "9fS22r0Y", "currencyNamespace": "yjMY30KE", "currencyType": "REAL", "discountAmount": 80, "discountExpireAt": "1978-04-27T00:00:00Z", "discountPercentage": 88, "discountPurchaseAt": "1982-10-23T00:00:00Z", "expireAt": "1979-09-03T00:00:00Z", "price": 15, "purchaseAt": "1989-08-10T00:00:00Z", "trialPrice": 70}], "ZHnfpPgc": [{"currencyCode": "ssmAkwmM", "currencyNamespace": "v0QHgZMb", "currencyType": "VIRTUAL", "discountAmount": 28, "discountExpireAt": "1998-09-27T00:00:00Z", "discountPercentage": 22, "discountPurchaseAt": "1999-11-23T00:00:00Z", "expireAt": "1988-02-29T00:00:00Z", "price": 83, "purchaseAt": "1997-10-31T00:00:00Z", "trialPrice": 46}, {"currencyCode": "IEAl4Jd2", "currencyNamespace": "hsojEaQN", "currencyType": "REAL", "discountAmount": 56, "discountExpireAt": "1993-11-17T00:00:00Z", "discountPercentage": 39, "discountPurchaseAt": "1978-03-08T00:00:00Z", "expireAt": "1984-10-15T00:00:00Z", "price": 11, "purchaseAt": "1984-11-26T00:00:00Z", "trialPrice": 74}, {"currencyCode": "pCvolM5y", "currencyNamespace": "dlnIoowH", "currencyType": "VIRTUAL", "discountAmount": 36, "discountExpireAt": "1997-01-28T00:00:00Z", "discountPercentage": 19, "discountPurchaseAt": "1981-08-25T00:00:00Z", "expireAt": "1994-04-22T00:00:00Z", "price": 44, "purchaseAt": "1995-12-22T00:00:00Z", "trialPrice": 53}]}, "saleConfig": {"currencyCode": "wrJB2chL", "price": 48}, "seasonType": "TIER", "sectionExclusive": true, "sellable": false, "sku": "kEW26kHp", "stackable": false, "status": "ACTIVE", "tags": ["J2H0LRSu", "fGdP4ZcU", "nLDZHrCz"], "targetCurrencyCode": "QW2DyZyL", "targetNamespace": "PMRMslyE", "thumbnailUrl": "ReQtpCHJ", "useCount": 35}' \
    > test.out 2>&1
eval_tap $? 129 'UpdateItem' test.out

#- 130 DeleteItem
./ng net.accelbyte.sdk.cli.Main platform deleteItem \
    --itemId 'hDuNtFgP' \
    --namespace "$AB_NAMESPACE" \
    --force  \
    --storeId 'C1tBWYzi' \
    > test.out 2>&1
eval_tap $? 130 'DeleteItem' test.out

#- 131 AcquireItem
./ng net.accelbyte.sdk.cli.Main platform acquireItem \
    --itemId 'c0ocBxp0' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 84, "orderNo": "4Q1NaJhi"}' \
    > test.out 2>&1
eval_tap $? 131 'AcquireItem' test.out

#- 132 GetApp
./ng net.accelbyte.sdk.cli.Main platform getApp \
    --itemId 'nqyuuJNn' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'KSd5e3Ha' \
    > test.out 2>&1
eval_tap $? 132 'GetApp' test.out

#- 133 UpdateApp
./ng net.accelbyte.sdk.cli.Main platform updateApp \
    --itemId 'IJ9fBCIp' \
    --namespace "$AB_NAMESPACE" \
    --storeId '8NKUUEPC' \
    --body '{"carousel": [{"alt": "DQf6aZrt", "previewUrl": "uS1eADZ5", "thumbnailUrl": "7OhFPtjb", "type": "video", "url": "rX0SkoWF", "videoSource": "youtube"}, {"alt": "Tvw2btRE", "previewUrl": "2MwYUIFE", "thumbnailUrl": "nqx27Ltb", "type": "video", "url": "ifLxV5MK", "videoSource": "youtube"}, {"alt": "Ca01OMil", "previewUrl": "VjDTV6q0", "thumbnailUrl": "vXv09aaD", "type": "image", "url": "4c85B7Nf", "videoSource": "vimeo"}], "developer": "5RJV3mdr", "forumUrl": "NjZFfFRi", "genres": ["Adventure", "Strategy", "FreeToPlay"], "localizations": {"UWwQtHhl": {"announcement": "ZMXYRuCG", "slogan": "6vlkAuAU"}, "9pm7itbr": {"announcement": "bsravo8V", "slogan": "CFNSdkny"}, "FSSZmZpH": {"announcement": "UpKnERhy", "slogan": "ByYYRR8M"}}, "platformRequirements": {"SsYX7dBv": [{"additionals": "TBhKucGO", "directXVersion": "LNUwXIxV", "diskSpace": "iZleBFAV", "graphics": "dBSYEkS6", "label": "CWTmtYny", "osVersion": "nXfDefZX", "processor": "eEws30nV", "ram": "8sHCFrKP", "soundCard": "CYY0Tohm"}, {"additionals": "3GGo2rNH", "directXVersion": "Yi6ZBf6F", "diskSpace": "p34dKSZE", "graphics": "Op3UvhqU", "label": "DFRjdgJA", "osVersion": "1DJfr6rJ", "processor": "vOBOvL0y", "ram": "XMqyMSY7", "soundCard": "77UqUPGX"}, {"additionals": "yXblEo2N", "directXVersion": "ySND1mV9", "diskSpace": "A2qxqLRP", "graphics": "qpBe15nY", "label": "sL5aC46y", "osVersion": "RTq1awfv", "processor": "0SWHAsjd", "ram": "tLNM0JAA", "soundCard": "95UwUVVP"}], "StoXe8K6": [{"additionals": "S7UTEhND", "directXVersion": "558V6xtq", "diskSpace": "VG8HxAzi", "graphics": "MqaSZgT7", "label": "4F3ARlly", "osVersion": "iX27GdmN", "processor": "caSgmG7y", "ram": "LYAqHqq1", "soundCard": "EtonoREx"}, {"additionals": "at7GHW0U", "directXVersion": "ttvbI9CA", "diskSpace": "Zg8ZXXzp", "graphics": "ZXKYNcd0", "label": "EAO7hClI", "osVersion": "YsIaQbGK", "processor": "oM2X34FH", "ram": "YABCkfsB", "soundCard": "WrGpkMpG"}, {"additionals": "CGPrHKsP", "directXVersion": "k6nm78UL", "diskSpace": "P2nt4jkA", "graphics": "HABwcZus", "label": "QQ8N2agN", "osVersion": "cEJGgBrE", "processor": "8E4nxm0b", "ram": "ReDwIVBu", "soundCard": "oPE87Pr4"}], "JlWPWcJj": [{"additionals": "XKeQmHHT", "directXVersion": "LmtarWrg", "diskSpace": "j7WOsms0", "graphics": "AWVEJ1Wu", "label": "Z0crO3XY", "osVersion": "F4t2qQ7S", "processor": "SqcA1sbL", "ram": "KUOID8hS", "soundCard": "vNe5QkZW"}, {"additionals": "9w6m3vAf", "directXVersion": "UxR7LQqT", "diskSpace": "iG3c62Vy", "graphics": "lUoEtwOX", "label": "KvjnSM7d", "osVersion": "RevVYknq", "processor": "cuF4KG8w", "ram": "jqwsMaO4", "soundCard": "K6VpZToz"}, {"additionals": "WYuH1vJT", "directXVersion": "sCCEkmmg", "diskSpace": "rrxtywhi", "graphics": "1KfLBC7e", "label": "IREjvO3q", "osVersion": "sPXR7LRP", "processor": "N4DCWv1P", "ram": "xrecE5RI", "soundCard": "NdoZehMt"}]}, "platforms": ["Linux", "Windows", "Windows"], "players": ["Coop", "Coop", "Single"], "primaryGenre": "MassivelyMultiplayer", "publisher": "FtqCWCTg", "releaseDate": "1987-08-03T00:00:00Z", "websiteUrl": "92K1Zzy7"}' \
    > test.out 2>&1
eval_tap $? 133 'UpdateApp' test.out

#- 134 DisableItem
./ng net.accelbyte.sdk.cli.Main platform disableItem \
    --itemId 'u2BLGeUi' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'wOJWv07b' \
    > test.out 2>&1
eval_tap $? 134 'DisableItem' test.out

#- 135 GetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform getItemDynamicData \
    --itemId 'tbEarHEk' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 135 'GetItemDynamicData' test.out

#- 136 EnableItem
./ng net.accelbyte.sdk.cli.Main platform enableItem \
    --itemId 'drMewrZa' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'mMtjhkO1' \
    > test.out 2>&1
eval_tap $? 136 'EnableItem' test.out

#- 137 FeatureItem
./ng net.accelbyte.sdk.cli.Main platform featureItem \
    --feature 'wwMfkEQC' \
    --itemId 'JiyeCqGH' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'WqxQW7h1' \
    > test.out 2>&1
eval_tap $? 137 'FeatureItem' test.out

#- 138 DefeatureItem
./ng net.accelbyte.sdk.cli.Main platform defeatureItem \
    --feature 'bUYOEtYa' \
    --itemId 'Tz7OEFUl' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'lZmqjO2b' \
    > test.out 2>&1
eval_tap $? 138 'DefeatureItem' test.out

#- 139 GetLocaleItem
./ng net.accelbyte.sdk.cli.Main platform getLocaleItem \
    --itemId '0ewDXfeZ' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'wCTk8ut8' \
    --populateBundle  \
    --region 'Yddl67om' \
    --storeId 'euI1p7Ga' \
    > test.out 2>&1
eval_tap $? 139 'GetLocaleItem' test.out

#- 140 UpdateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform updateItemPurchaseCondition \
    --itemId '3ZxPDlX3' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'HN8gorJc' \
    --body '{"purchaseCondition": {"conditionGroups": [{"operator": "or", "predicates": [{"anyOf": 3, "code": "OkmYjwBg", "comparison": "excludes", "name": "omQdDK0q", "predicateType": "SeasonTierPredicate", "value": "G3tTXLyB", "values": ["ipvPcecv", "hRpFUzEI", "QFx7AGCI"]}, {"anyOf": 87, "code": "HloXjsxg", "comparison": "is", "name": "HrrA5JkR", "predicateType": "SeasonPassPredicate", "value": "70Tj3KtB", "values": ["0M4MwRot", "RM0tRPZ6", "p9FlSe3A"]}, {"anyOf": 18, "code": "MrEBzYhl", "comparison": "isGreaterThan", "name": "aEXEqFKC", "predicateType": "SeasonPassPredicate", "value": "UpsfEJFb", "values": ["UDRx13UJ", "b6x3bJcR", "iBRa2Wpd"]}]}, {"operator": "and", "predicates": [{"anyOf": 29, "code": "MM7dTCLB", "comparison": "isLessThanOrEqual", "name": "rFFooGZ4", "predicateType": "SeasonPassPredicate", "value": "Y4Mgja0O", "values": ["I4IzSRsz", "v7zOJhKZ", "4U9S2FCZ"]}, {"anyOf": 78, "code": "gXZSZUSI", "comparison": "isGreaterThan", "name": "DXgWOeX3", "predicateType": "EntitlementPredicate", "value": "Yb8fLM0g", "values": ["pPt7V93s", "o9Pfjiqb", "MjxvXxue"]}, {"anyOf": 30, "code": "jddOOQJk", "comparison": "isNot", "name": "0DnITHMd", "predicateType": "SeasonPassPredicate", "value": "HzNLMYZs", "values": ["FcqMNoH3", "0aUIO27o", "TIpnKuvd"]}]}, {"operator": "and", "predicates": [{"anyOf": 1, "code": "CSmL5Da3", "comparison": "includes", "name": "TIPAJ5eH", "predicateType": "SeasonPassPredicate", "value": "ysfnRyTA", "values": ["THa1NFvo", "vj4KkN6v", "CXy9O0pi"]}, {"anyOf": 64, "code": "lMKpNFys", "comparison": "isLessThanOrEqual", "name": "5La9URaS", "predicateType": "SeasonTierPredicate", "value": "Jr9a7BRJ", "values": ["BUqH2bMF", "cLdci4RE", "yWwL5SlH"]}, {"anyOf": 36, "code": "J2rzKW7f", "comparison": "excludes", "name": "o2B0eRfq", "predicateType": "StatisticCodePredicate", "value": "Y6bSblI8", "values": ["7Pwux6jo", "EkDDzZ0S", "FhqV9m0C"]}]}]}}' \
    > test.out 2>&1
eval_tap $? 140 'UpdateItemPurchaseCondition' test.out

#- 141 ReturnItem
./ng net.accelbyte.sdk.cli.Main platform returnItem \
    --itemId 'Pv9UwNLa' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "h4qBWm4b"}' \
    > test.out 2>&1
eval_tap $? 141 'ReturnItem' test.out

#- 142 QueryKeyGroups
./ng net.accelbyte.sdk.cli.Main platform queryKeyGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '14' \
    --name 'QYVhOxdT' \
    --offset '91' \
    --tag 'meULxvzQ' \
    > test.out 2>&1
eval_tap $? 142 'QueryKeyGroups' test.out

#- 143 CreateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform createKeyGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "fnsOx28B", "name": "MwfA0PO0", "status": "ACTIVE", "tags": ["pDGB9F50", "R1UTB60x", "lNO364N4"]}' \
    > test.out 2>&1
eval_tap $? 143 'CreateKeyGroup' test.out

#- 144 GetKeyGroupByBoothName
eval_tap 0 144 'GetKeyGroupByBoothName # SKIP deprecated' test.out

#- 145 GetKeyGroup
./ng net.accelbyte.sdk.cli.Main platform getKeyGroup \
    --keyGroupId 'kzX9VFWt' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 145 'GetKeyGroup' test.out

#- 146 UpdateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform updateKeyGroup \
    --keyGroupId '7cM86Zfl' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "VWYzT0cR", "name": "OjAghgYI", "status": "INACTIVE", "tags": ["KyLKc9qk", "FemQi6dv", "LX3LystJ"]}' \
    > test.out 2>&1
eval_tap $? 146 'UpdateKeyGroup' test.out

#- 147 GetKeyGroupDynamic
./ng net.accelbyte.sdk.cli.Main platform getKeyGroupDynamic \
    --keyGroupId 'aurczhlC' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 147 'GetKeyGroupDynamic' test.out

#- 148 ListKeys
./ng net.accelbyte.sdk.cli.Main platform listKeys \
    --keyGroupId 'pkwadhde' \
    --namespace "$AB_NAMESPACE" \
    --limit '40' \
    --offset '53' \
    --status 'ACTIVE' \
    > test.out 2>&1
eval_tap $? 148 'ListKeys' test.out

#- 149 UploadKeys
./ng net.accelbyte.sdk.cli.Main platform uploadKeys \
    --keyGroupId 'N97KIu3d' \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 149 'UploadKeys' test.out

#- 150 QueryOrders
./ng net.accelbyte.sdk.cli.Main platform queryOrders \
    --namespace "$AB_NAMESPACE" \
    --endTime '7JmyLq1d' \
    --limit '33' \
    --offset '67' \
    --orderNos 'xGejcpcG,WxtVjfyE,S3rC8lWQ' \
    --sortBy 'aG1qERjv' \
    --startTime '0mdVnV6Q' \
    --status 'INIT' \
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
    --orderNo 'xdJmEeLx' \
    > test.out 2>&1
eval_tap $? 152 'GetOrder' test.out

#- 153 RefundOrder
./ng net.accelbyte.sdk.cli.Main platform refundOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo '8hcqdRUp' \
    --body '{"description": "qjLU5mNI"}' \
    > test.out 2>&1
eval_tap $? 153 'RefundOrder' test.out

#- 154 GetPaymentCallbackConfig
eval_tap 0 154 'GetPaymentCallbackConfig # SKIP deprecated' test.out

#- 155 UpdatePaymentCallbackConfig
eval_tap 0 155 'UpdatePaymentCallbackConfig # SKIP deprecated' test.out

#- 156 GetPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentMerchantConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 156 'GetPaymentMerchantConfig' test.out

#- 157 UpdatePaymentDomainWhitelistConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentDomainWhitelistConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"domains": ["oqZ0UKyJ", "31mLFQGu", "d1DWs4qu"]}' \
    > test.out 2>&1
eval_tap $? 157 'UpdatePaymentDomainWhitelistConfig' test.out

#- 158 QueryPaymentNotifications
./ng net.accelbyte.sdk.cli.Main platform queryPaymentNotifications \
    --namespace "$AB_NAMESPACE" \
    --endDate 'U3MYCl17' \
    --externalId 'EXukfdAK' \
    --limit '46' \
    --notificationSource 'PAYPAL' \
    --notificationType 'cYf6hdlW' \
    --offset '78' \
    --paymentOrderNo 'bYdw34Sy' \
    --startDate 'ydo1J5z7' \
    --status 'ERROR' \
    > test.out 2>&1
eval_tap $? 158 'QueryPaymentNotifications' test.out

#- 159 QueryPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform queryPaymentOrders \
    --namespace "$AB_NAMESPACE" \
    --channel 'EXTERNAL' \
    --extTxId 'ZUEEeWQx' \
    --limit '63' \
    --offset '69' \
    --status 'AUTHORISE_FAILED' \
    > test.out 2>&1
eval_tap $? 159 'QueryPaymentOrders' test.out

#- 160 CreatePaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform createPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --body '{"currencyCode": "pC94veVI", "currencyNamespace": "AVt70iuG", "customParameters": {"ybM486pT": {}, "2rX9dknu": {}, "LvQAT8qx": {}}, "description": "BQagyKnx", "extOrderNo": "3XKLJTp7", "extUserId": "BcUKSSFl", "itemType": "SEASON", "language": "Zjm-wM", "metadata": {"KJWMRBhs": "35AoE488", "igWrxif2": "VFWNxpoU", "ciww1ZYa": "yT87aJgQ"}, "notifyUrl": "x9ZqdNlS", "omitNotification": false, "platform": "TJPjEOl7", "price": 3, "recurringPaymentOrderNo": "g8gyhqYs", "region": "p4d3UV5l", "returnUrl": "FQy3nmfO", "sandbox": true, "sku": "hZfViruJ", "subscriptionId": "D3VoJgn4", "targetNamespace": "dPxKufDN", "targetUserId": "SFePJlGx", "title": "N3WCMaMf"}' \
    > test.out 2>&1
eval_tap $? 160 'CreatePaymentOrderByDedicated' test.out

#- 161 ListExtOrderNoByExtTxId
./ng net.accelbyte.sdk.cli.Main platform listExtOrderNoByExtTxId \
    --namespace "$AB_NAMESPACE" \
    --extTxId '8rEqEBmy' \
    > test.out 2>&1
eval_tap $? 161 'ListExtOrderNoByExtTxId' test.out

#- 162 GetPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 't9Evq8NL' \
    > test.out 2>&1
eval_tap $? 162 'GetPaymentOrder' test.out

#- 163 ChargePaymentOrder
./ng net.accelbyte.sdk.cli.Main platform chargePaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'nnYdZ9o8' \
    --body '{"extTxId": "FJPLcWSF", "paymentMethod": "JSARzlEr", "paymentProvider": "ADYEN"}' \
    > test.out 2>&1
eval_tap $? 163 'ChargePaymentOrder' test.out

#- 164 RefundPaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform refundPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'KO6zM3xm' \
    --body '{"description": "fpF6tnzh"}' \
    > test.out 2>&1
eval_tap $? 164 'RefundPaymentOrderByDedicated' test.out

#- 165 SimulatePaymentOrderNotification
./ng net.accelbyte.sdk.cli.Main platform simulatePaymentOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'bCjlNvZv' \
    --body '{"amount": 55, "currencyCode": "ozgO2X6Y", "notifyType": "CHARGE", "paymentProvider": "WALLET", "salesTax": 15, "vat": 8}' \
    > test.out 2>&1
eval_tap $? 165 'SimulatePaymentOrderNotification' test.out

#- 166 GetPaymentOrderChargeStatus
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrderChargeStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'hht528fU' \
    > test.out 2>&1
eval_tap $? 166 'GetPaymentOrderChargeStatus' test.out

#- 167 GetPsnEntitlementOwnership
./ng net.accelbyte.sdk.cli.Main platform getPsnEntitlementOwnership \
    --entitlementLabel 'LejTSaNu' \
    --namespace "$AB_NAMESPACE" \
    --body '{"accessToken": "twUxIsgz", "serviceLabel": 49}' \
    > test.out 2>&1
eval_tap $? 167 'GetPsnEntitlementOwnership' test.out

#- 168 GetXboxEntitlementOwnership
./ng net.accelbyte.sdk.cli.Main platform getXboxEntitlementOwnership \
    --namespace "$AB_NAMESPACE" \
    --productSku 'EPwDVp8K' \
    --body '{"delegationToken": "zJ26z8B9", "sandboxId": "oncL6RIv"}' \
    > test.out 2>&1
eval_tap $? 168 'GetXboxEntitlementOwnership' test.out

#- 169 GetPlatformEntitlementConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformEntitlementConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Epic' \
    > test.out 2>&1
eval_tap $? 169 'GetPlatformEntitlementConfig' test.out

#- 170 UpdatePlatformEntitlementConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformEntitlementConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Steam' \
    --body '{"allowedPlatformOrigins": ["Steam", "IOS", "Twitch"]}' \
    > test.out 2>&1
eval_tap $? 170 'UpdatePlatformEntitlementConfig' test.out

#- 171 GetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'GooglePlay' \
    > test.out 2>&1
eval_tap $? 171 'GetPlatformWalletConfig' test.out

#- 172 UpdatePlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Epic' \
    --body '{"allowedBalanceOrigins": ["Nintendo", "Playstation", "IOS"]}' \
    > test.out 2>&1
eval_tap $? 172 'UpdatePlatformWalletConfig' test.out

#- 173 ResetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform resetPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Playstation' \
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
    --body '{"entitlement": {"consumable": {"enabled": false, "strategy": "CUSTOM"}, "durable": {"enabled": false, "strategy": "REVOKE_OR_REPORT"}}, "wallet": {"enabled": true, "strategy": "CUSTOM"}}' \
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
    --endTime 'tHCn3UmU' \
    --limit '56' \
    --offset '78' \
    --source 'DLC' \
    --startTime 'OJAshLO2' \
    --status 'SUCCESS' \
    --transactionId 'CBE1a0Bo' \
    --userId 'B5gbG5ic' \
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
    --body '{"appConfig": {"appName": "aRXHbMLj"}, "customConfig": {"connectionType": "INSECURE", "grpcServerAddress": "18diFm5o"}, "extendType": "CUSTOM"}' \
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
    --body '{"description": "9BRXfLvI", "eventTopic": "qEedvJQn", "maxAwarded": 38, "maxAwardedPerUser": 2, "namespaceExpression": "lWuo7VNH", "rewardCode": "LcYbRZEd", "rewardConditions": [{"condition": "LAyd0CPW", "conditionName": "yhWM9azD", "eventName": "JaJhxcZh", "rewardItems": [{"duration": 34, "endDate": "1979-04-01T00:00:00Z", "identityType": "ITEM_ID", "itemId": "4kTTxOAG", "quantity": 47, "sku": "Y8bHlitl"}, {"duration": 89, "endDate": "1983-09-22T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "cRQYwCxk", "quantity": 53, "sku": "GBHMxC5l"}, {"duration": 22, "endDate": "1994-12-24T00:00:00Z", "identityType": "ITEM_ID", "itemId": "ZDF4WVsW", "quantity": 16, "sku": "OZt6QCiV"}]}, {"condition": "TnK9Xgp7", "conditionName": "mgC64Qqr", "eventName": "BNraalfj", "rewardItems": [{"duration": 61, "endDate": "1977-06-03T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "7t53hj2s", "quantity": 53, "sku": "GoNHsaTi"}, {"duration": 56, "endDate": "1978-08-07T00:00:00Z", "identityType": "ITEM_ID", "itemId": "ajm26D4J", "quantity": 45, "sku": "ryvnTBdb"}, {"duration": 24, "endDate": "1976-05-14T00:00:00Z", "identityType": "ITEM_ID", "itemId": "zH4zhpWW", "quantity": 30, "sku": "aShGVuge"}]}, {"condition": "2ofUTjyp", "conditionName": "eFn1iGuP", "eventName": "sM0CIFms", "rewardItems": [{"duration": 1, "endDate": "1976-09-11T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "f96IDA7g", "quantity": 9, "sku": "AoUkxcE9"}, {"duration": 10, "endDate": "1973-02-05T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "mF98vT1X", "quantity": 32, "sku": "oBhPTAX2"}, {"duration": 94, "endDate": "1991-10-19T00:00:00Z", "identityType": "ITEM_ID", "itemId": "OUhAzjwl", "quantity": 59, "sku": "gwHABXR4"}]}], "userIdExpression": "KcE71UaI"}' \
    > test.out 2>&1
eval_tap $? 182 'CreateReward' test.out

#- 183 QueryRewards
./ng net.accelbyte.sdk.cli.Main platform queryRewards \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'jOayDBWA' \
    --limit '78' \
    --offset '100' \
    --sortBy 'namespace:desc,rewardCode:asc,rewardCode:desc' \
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
    --rewardId 'oar6bwn9' \
    > test.out 2>&1
eval_tap $? 186 'GetReward' test.out

#- 187 UpdateReward
./ng net.accelbyte.sdk.cli.Main platform updateReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'sb2SUjfL' \
    --body '{"description": "hwtEsieu", "eventTopic": "HF5TLdQw", "maxAwarded": 93, "maxAwardedPerUser": 47, "namespaceExpression": "GkQpE4H5", "rewardCode": "yfvplQ63", "rewardConditions": [{"condition": "mre225PC", "conditionName": "GjAeQ5Pr", "eventName": "vegaZu5V", "rewardItems": [{"duration": 65, "endDate": "1983-02-22T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "7G3BBSw2", "quantity": 59, "sku": "eDTMGNj1"}, {"duration": 18, "endDate": "1971-07-11T00:00:00Z", "identityType": "ITEM_ID", "itemId": "LXdxqmlC", "quantity": 37, "sku": "Zcenbjrz"}, {"duration": 34, "endDate": "1972-12-20T00:00:00Z", "identityType": "ITEM_ID", "itemId": "2C9u2Hgk", "quantity": 45, "sku": "VFbaA4AN"}]}, {"condition": "a6n3KD5d", "conditionName": "4kV6N8XR", "eventName": "JGBfGy2E", "rewardItems": [{"duration": 11, "endDate": "1981-03-24T00:00:00Z", "identityType": "ITEM_ID", "itemId": "bIyMUgN5", "quantity": 26, "sku": "EPQhBuDQ"}, {"duration": 94, "endDate": "1976-04-25T00:00:00Z", "identityType": "ITEM_ID", "itemId": "9iZ9lrR1", "quantity": 40, "sku": "Md3xWSWQ"}, {"duration": 5, "endDate": "1980-09-29T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "peMY9SgK", "quantity": 94, "sku": "7xzy6IZC"}]}, {"condition": "sntoMqax", "conditionName": "46pvHmgb", "eventName": "c3rC0AuU", "rewardItems": [{"duration": 11, "endDate": "1986-03-20T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "DyJxVGTP", "quantity": 59, "sku": "qQbKbuzl"}, {"duration": 76, "endDate": "1991-12-08T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "w0lIlwwT", "quantity": 35, "sku": "nAJSLZUr"}, {"duration": 24, "endDate": "1975-12-30T00:00:00Z", "identityType": "ITEM_ID", "itemId": "ftrphhrE", "quantity": 3, "sku": "2DJlPZ0O"}]}], "userIdExpression": "DnFg2z2h"}' \
    > test.out 2>&1
eval_tap $? 187 'UpdateReward' test.out

#- 188 DeleteReward
./ng net.accelbyte.sdk.cli.Main platform deleteReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId '52iZSZld' \
    > test.out 2>&1
eval_tap $? 188 'DeleteReward' test.out

#- 189 CheckEventCondition
./ng net.accelbyte.sdk.cli.Main platform checkEventCondition \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'zosWIjBD' \
    --body '{"payload": {"y5gM78nI": {}, "q3yZ4aRd": {}, "UXrYbvZY": {}}}' \
    > test.out 2>&1
eval_tap $? 189 'CheckEventCondition' test.out

#- 190 DeleteRewardConditionRecord
./ng net.accelbyte.sdk.cli.Main platform deleteRewardConditionRecord \
    --namespace "$AB_NAMESPACE" \
    --rewardId '5LtObyMn' \
    --body '{"conditionName": "TKql1C2N", "userId": "GagKCpKM"}' \
    > test.out 2>&1
eval_tap $? 190 'DeleteRewardConditionRecord' test.out

#- 191 QuerySections
./ng net.accelbyte.sdk.cli.Main platform querySections \
    --namespace "$AB_NAMESPACE" \
    --end 'AOecy0YQ' \
    --limit '67' \
    --offset '25' \
    --start 'OCzGoPiU' \
    --storeId 'w9h4TsFf' \
    --viewId '1H6zn1IB' \
    > test.out 2>&1
eval_tap $? 191 'QuerySections' test.out

#- 192 CreateSection
./ng net.accelbyte.sdk.cli.Main platform createSection \
    --namespace "$AB_NAMESPACE" \
    --storeId 'yHbSNriL' \
    --body '{"active": false, "displayOrder": 34, "endDate": "1987-09-29T00:00:00Z", "ext": {"TRxESzhw": {}, "yMlWHI1X": {}, "bZJR6ruT": {}}, "fixedPeriodRotationConfig": {"backfillType": "CUSTOM", "duration": 54, "itemCount": 18, "rule": "SEQUENCE"}, "items": [{"id": "Sp4g4mYT", "sku": "1sYMiCTb"}, {"id": "BdNgVHPa", "sku": "flLPpvQH"}, {"id": "DiYdPQg6", "sku": "Lc9DLrTA"}], "localizations": {"nifz49kw": {"description": "MKvhErid", "localExt": {"nQv80ABb": {}, "Aih8GLB1": {}, "aMwy3djM": {}}, "longDescription": "iTwvRmWX", "title": "Nt0fo3SD"}, "eTJ5vyo8": {"description": "FsdaQRQn", "localExt": {"HvVFpxtL": {}, "4jPntA8J": {}, "UzHvoUY0": {}}, "longDescription": "8RYXZBMr", "title": "QZH5ZCOO"}, "ZxWxiGq8": {"description": "wqcZ7TK0", "localExt": {"XC3qxxJ9": {}, "R9d2MKGM": {}, "arzdgjir": {}}, "longDescription": "2uJDYnJo", "title": "XwTrXLlM"}}, "name": "snRPm8fP", "rotationType": "NONE", "startDate": "1993-06-01T00:00:00Z", "viewId": "dYAX6iZq"}' \
    > test.out 2>&1
eval_tap $? 192 'CreateSection' test.out

#- 193 PurgeExpiredSection
./ng net.accelbyte.sdk.cli.Main platform purgeExpiredSection \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ug587JNz' \
    > test.out 2>&1
eval_tap $? 193 'PurgeExpiredSection' test.out

#- 194 GetSection
./ng net.accelbyte.sdk.cli.Main platform getSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'O2uaIcES' \
    --storeId 'dZcu0ndU' \
    > test.out 2>&1
eval_tap $? 194 'GetSection' test.out

#- 195 UpdateSection
./ng net.accelbyte.sdk.cli.Main platform updateSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'y69RuxHQ' \
    --storeId '3j58PsIN' \
    --body '{"active": false, "displayOrder": 36, "endDate": "1971-10-01T00:00:00Z", "ext": {"GEhHCN34": {}, "kHjieC7H": {}, "DJhXmUN8": {}}, "fixedPeriodRotationConfig": {"backfillType": "NONE", "duration": 1, "itemCount": 31, "rule": "SEQUENCE"}, "items": [{"id": "tI6hlURK", "sku": "mS9ULFio"}, {"id": "O6GXMUzh", "sku": "80MpVO1x"}, {"id": "AjY5HQQD", "sku": "GtDIt8pc"}], "localizations": {"1aqEzbMo": {"description": "BB9fKKoy", "localExt": {"NmZcBhXx": {}, "KwtIzIfM": {}, "OI7NJWZ9": {}}, "longDescription": "5A6Flc3I", "title": "rZm7Y5nx"}, "5q4KqYKD": {"description": "kbNcUeJo", "localExt": {"FM5aeXNv": {}, "rGDABjuZ": {}, "gDheFWTB": {}}, "longDescription": "0vXgZRU7", "title": "lmLEd58P"}, "5v0x1GhW": {"description": "9ivtbbCh", "localExt": {"Mwbv1vct": {}, "mVKixD5V": {}, "3kFukIOR": {}}, "longDescription": "wyLG2NLI", "title": "c4fK63zp"}}, "name": "ZZkc6oaD", "rotationType": "NONE", "startDate": "1972-01-07T00:00:00Z", "viewId": "nuLRcFcP"}' \
    > test.out 2>&1
eval_tap $? 195 'UpdateSection' test.out

#- 196 DeleteSection
./ng net.accelbyte.sdk.cli.Main platform deleteSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'CAqPo5NN' \
    --storeId 'JcaEQq0t' \
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
    --body '{"defaultLanguage": "9xdo0Y8u", "defaultRegion": "1777G9S1", "description": "bB97LBpY", "supportedLanguages": ["nnk1ORMD", "w5n3NfPs", "23eGGE11"], "supportedRegions": ["C19k0T7Q", "L2rxfHGU", "90rheAlI"], "title": "ddFugxzz"}' \
    > test.out 2>&1
eval_tap $? 198 'CreateStore' test.out

#- 199 GetCatalogDefinition
./ng net.accelbyte.sdk.cli.Main platform getCatalogDefinition \
    --namespace "$AB_NAMESPACE" \
    --catalogType 'CATEGORY' \
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
    --body '{"catalogType": "CATEGORY", "fieldsToBeIncluded": ["mlhwzALb", "rJF2ZGHq", "CPcc5auo"], "idsToBeExported": ["Z74GFRA6", "btV5EbGc", "5sUJt3qK"], "storeId": "4GYCMrqN"}' \
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
    --storeId 'YxGITtvr' \
    > test.out 2>&1
eval_tap $? 207 'GetStore' test.out

#- 208 UpdateStore
./ng net.accelbyte.sdk.cli.Main platform updateStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'xXrbkkZA' \
    --body '{"defaultLanguage": "CevGcfsf", "defaultRegion": "EDa0Lir7", "description": "aMRuOtLq", "supportedLanguages": ["abojiXdh", "XevblqcT", "kI0BzwTS"], "supportedRegions": ["xZ2GYR2V", "uLtUKv9E", "QtfbaDvw"], "title": "CeUn3ShC"}' \
    > test.out 2>&1
eval_tap $? 208 'UpdateStore' test.out

#- 209 DeleteStore
./ng net.accelbyte.sdk.cli.Main platform deleteStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'pE9blJrc' \
    > test.out 2>&1
eval_tap $? 209 'DeleteStore' test.out

#- 210 QueryChanges
./ng net.accelbyte.sdk.cli.Main platform queryChanges \
    --namespace "$AB_NAMESPACE" \
    --storeId 'rSqTqMZy' \
    --action 'UPDATE' \
    --itemSku 'uvsWkPP4' \
    --itemType 'SEASON' \
    --limit '74' \
    --offset '64' \
    --selected  \
    --sortBy 'createdAt:desc,createdAt:asc' \
    --status 'UNPUBLISHED' \
    --type 'VIEW' \
    --updatedAtEnd 'UOWYJn0P' \
    --updatedAtStart 'mKiKx2I3' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 210 'QueryChanges' test.out

#- 211 PublishAll
./ng net.accelbyte.sdk.cli.Main platform publishAll \
    --namespace "$AB_NAMESPACE" \
    --storeId 'if3YuxTV' \
    > test.out 2>&1
eval_tap $? 211 'PublishAll' test.out

#- 212 PublishSelected
./ng net.accelbyte.sdk.cli.Main platform publishSelected \
    --namespace "$AB_NAMESPACE" \
    --storeId 'EHlgZHZb' \
    > test.out 2>&1
eval_tap $? 212 'PublishSelected' test.out

#- 213 SelectAllRecords
./ng net.accelbyte.sdk.cli.Main platform selectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'MGAKLyrT' \
    > test.out 2>&1
eval_tap $? 213 'SelectAllRecords' test.out

#- 214 SelectAllRecordsByCriteria
./ng net.accelbyte.sdk.cli.Main platform selectAllRecordsByCriteria \
    --namespace "$AB_NAMESPACE" \
    --storeId 'S4lVBng7' \
    --action 'CREATE' \
    --itemSku 'H1zm9Q5v' \
    --itemType 'OPTIONBOX' \
    --selected  \
    --type 'SECTION' \
    --updatedAtEnd 'm5vxFqAa' \
    --updatedAtStart 'CzHNbyDe' \
    > test.out 2>&1
eval_tap $? 214 'SelectAllRecordsByCriteria' test.out

#- 215 GetStatistic
./ng net.accelbyte.sdk.cli.Main platform getStatistic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'uKLXYmHu' \
    --action 'DELETE' \
    --itemSku 'M9wfmBVC' \
    --itemType 'BUNDLE' \
    --type 'SECTION' \
    --updatedAtEnd 'uDynT145' \
    --updatedAtStart 'WPVXXHkO' \
    > test.out 2>&1
eval_tap $? 215 'GetStatistic' test.out

#- 216 UnselectAllRecords
./ng net.accelbyte.sdk.cli.Main platform unselectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'xjIWHqg7' \
    > test.out 2>&1
eval_tap $? 216 'UnselectAllRecords' test.out

#- 217 SelectRecord
./ng net.accelbyte.sdk.cli.Main platform selectRecord \
    --changeId 'qiT3gqUz' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'D8BXPEU6' \
    > test.out 2>&1
eval_tap $? 217 'SelectRecord' test.out

#- 218 UnselectRecord
./ng net.accelbyte.sdk.cli.Main platform unselectRecord \
    --changeId 'Y8xNfSYM' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'R3MBjkSI' \
    > test.out 2>&1
eval_tap $? 218 'UnselectRecord' test.out

#- 219 CloneStore
./ng net.accelbyte.sdk.cli.Main platform cloneStore \
    --namespace "$AB_NAMESPACE" \
    --storeId '9Ca6HIqb' \
    --targetStoreId 'ZocCJlRB' \
    > test.out 2>&1
eval_tap $? 219 'CloneStore' test.out

#- 220 ExportStore
eval_tap 0 220 'ExportStore # SKIP deprecated' test.out

#- 221 QueryImportHistory
./ng net.accelbyte.sdk.cli.Main platform queryImportHistory \
    --namespace "$AB_NAMESPACE" \
    --storeId '6PErjMVy' \
    --end 'Q5Xtkc0i' \
    --limit '17' \
    --offset '85' \
    --sortBy 'R337kVql' \
    --start 'GTQqguwl' \
    --success  \
    > test.out 2>&1
eval_tap $? 221 'QueryImportHistory' test.out

#- 222 ImportStoreByCSV
./ng net.accelbyte.sdk.cli.Main platform importStoreByCSV \
    --namespace "$AB_NAMESPACE" \
    --storeId 'aguTvGfs' \
    --category 'tmp.dat' \
    --display 'tmp.dat' \
    --item 'tmp.dat' \
    --notes 'laE3kiHQ' \
    --section 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 222 'ImportStoreByCSV' test.out

#- 223 QuerySubscriptions
./ng net.accelbyte.sdk.cli.Main platform querySubscriptions \
    --namespace "$AB_NAMESPACE" \
    --chargeStatus 'SETUP' \
    --itemId 'JtvscueI' \
    --limit '64' \
    --offset '57' \
    --sku 'nE7RJ2lt' \
    --status 'EXPIRED' \
    --subscribedBy 'USER' \
    --userId 'r2Fpgxn3' \
    > test.out 2>&1
eval_tap $? 223 'QuerySubscriptions' test.out

#- 224 RecurringChargeSubscription
./ng net.accelbyte.sdk.cli.Main platform recurringChargeSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'GxA24bEL' \
    > test.out 2>&1
eval_tap $? 224 'RecurringChargeSubscription' test.out

#- 225 GetTicketDynamic
./ng net.accelbyte.sdk.cli.Main platform getTicketDynamic \
    --boothName '7YmuI7oA' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 225 'GetTicketDynamic' test.out

#- 226 DecreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform decreaseTicketSale \
    --boothName 'ZI4bNe0P' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "m1mrr8Kq"}' \
    > test.out 2>&1
eval_tap $? 226 'DecreaseTicketSale' test.out

#- 227 GetTicketBoothID
./ng net.accelbyte.sdk.cli.Main platform getTicketBoothID \
    --boothName 'cSjW8J4n' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 227 'GetTicketBoothID' test.out

#- 228 IncreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform increaseTicketSale \
    --boothName 'v2DmEsQx' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 18, "orderNo": "SIdtjSyG"}' \
    > test.out 2>&1
eval_tap $? 228 'IncreaseTicketSale' test.out

#- 229 Commit
./ng net.accelbyte.sdk.cli.Main platform commit \
    --namespace "$AB_NAMESPACE" \
    --body '{"actions": [{"operations": [{"creditPayload": {"balanceOrigin": "Playstation", "count": 92, "currencyCode": "d0Vizz8P", "expireAt": "1977-10-11T00:00:00Z"}, "debitPayload": {"count": 58, "currencyCode": "cZFOplic", "walletPlatform": "Steam"}, "fulFillItemPayload": {"count": 1, "entitlementCollectionId": "FTsW1Hfn", "entitlementOrigin": "Oculus", "itemIdentity": "3ekZDIab", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 1, "entitlementId": "P6IGiAi8"}, "type": "CREDIT_WALLET"}, {"creditPayload": {"balanceOrigin": "GooglePlay", "count": 22, "currencyCode": "OkRZFLse", "expireAt": "1994-03-15T00:00:00Z"}, "debitPayload": {"count": 4, "currencyCode": "P8UH6jhp", "walletPlatform": "Other"}, "fulFillItemPayload": {"count": 67, "entitlementCollectionId": "0s5Cpw3H", "entitlementOrigin": "System", "itemIdentity": "6vCvKVAP", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 31, "entitlementId": "qbXNd2CE"}, "type": "REVOKE_ENTITLEMENT"}, {"creditPayload": {"balanceOrigin": "Oculus", "count": 59, "currencyCode": "QSCJzykC", "expireAt": "1971-03-17T00:00:00Z"}, "debitPayload": {"count": 94, "currencyCode": "qh6q6kFk", "walletPlatform": "Oculus"}, "fulFillItemPayload": {"count": 26, "entitlementCollectionId": "ZRMpTYfe", "entitlementOrigin": "Xbox", "itemIdentity": "xYOsLt7d", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 94, "entitlementId": "ZA39NwYo"}, "type": "FULFILL_ITEM"}], "userId": "wIYQzAa4"}, {"operations": [{"creditPayload": {"balanceOrigin": "Nintendo", "count": 91, "currencyCode": "eMKxsYoR", "expireAt": "1974-12-18T00:00:00Z"}, "debitPayload": {"count": 15, "currencyCode": "LE9b0DuE", "walletPlatform": "Epic"}, "fulFillItemPayload": {"count": 22, "entitlementCollectionId": "eXoJxRJK", "entitlementOrigin": "Steam", "itemIdentity": "jxCqiWnp", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 29, "entitlementId": "dUlNyqeS"}, "type": "FULFILL_ITEM"}, {"creditPayload": {"balanceOrigin": "Twitch", "count": 57, "currencyCode": "daFEQVOb", "expireAt": "1973-12-11T00:00:00Z"}, "debitPayload": {"count": 58, "currencyCode": "SEQXGFS4", "walletPlatform": "Steam"}, "fulFillItemPayload": {"count": 91, "entitlementCollectionId": "pu694snW", "entitlementOrigin": "Twitch", "itemIdentity": "d6iYxrQT", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 46, "entitlementId": "8xprncUg"}, "type": "FULFILL_ITEM"}, {"creditPayload": {"balanceOrigin": "GooglePlay", "count": 16, "currencyCode": "A2hA4CYM", "expireAt": "1990-02-06T00:00:00Z"}, "debitPayload": {"count": 75, "currencyCode": "2PReFtRd", "walletPlatform": "Playstation"}, "fulFillItemPayload": {"count": 30, "entitlementCollectionId": "coRSIscr", "entitlementOrigin": "Epic", "itemIdentity": "gWsyH2Dw", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 94, "entitlementId": "5rMwApCo"}, "type": "DEBIT_WALLET"}], "userId": "wCTKlqTF"}, {"operations": [{"creditPayload": {"balanceOrigin": "System", "count": 86, "currencyCode": "2KkT8Hty", "expireAt": "1982-05-11T00:00:00Z"}, "debitPayload": {"count": 8, "currencyCode": "cTlaL1OZ", "walletPlatform": "Epic"}, "fulFillItemPayload": {"count": 100, "entitlementCollectionId": "KApkP1y0", "entitlementOrigin": "Nintendo", "itemIdentity": "L70DKrUW", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 24, "entitlementId": "RmrL60ma"}, "type": "FULFILL_ITEM"}, {"creditPayload": {"balanceOrigin": "IOS", "count": 61, "currencyCode": "jLvGRfvy", "expireAt": "1988-01-13T00:00:00Z"}, "debitPayload": {"count": 64, "currencyCode": "w87pS5hI", "walletPlatform": "Oculus"}, "fulFillItemPayload": {"count": 39, "entitlementCollectionId": "3DmqRSoF", "entitlementOrigin": "GooglePlay", "itemIdentity": "TqGQubGe", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 20, "entitlementId": "76CvYYR2"}, "type": "REVOKE_ENTITLEMENT"}, {"creditPayload": {"balanceOrigin": "Playstation", "count": 93, "currencyCode": "drRdIm3k", "expireAt": "1998-02-06T00:00:00Z"}, "debitPayload": {"count": 37, "currencyCode": "a6J4o8J8", "walletPlatform": "Oculus"}, "fulFillItemPayload": {"count": 85, "entitlementCollectionId": "IMhDqr0s", "entitlementOrigin": "IOS", "itemIdentity": "NFysBhVm", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 65, "entitlementId": "3QlLongG"}, "type": "DEBIT_WALLET"}], "userId": "8Dw7pnpv"}], "metadata": {"GfTqbnoV": {}, "IZQCoThx": {}, "6VvUZjY1": {}}, "needPreCheck": true, "transactionId": "Tznef6l1", "type": "DR5B2bFs"}' \
    > test.out 2>&1
eval_tap $? 229 'Commit' test.out

#- 230 GetTradeHistoryByCriteria
./ng net.accelbyte.sdk.cli.Main platform getTradeHistoryByCriteria \
    --namespace "$AB_NAMESPACE" \
    --limit '38' \
    --offset '19' \
    --status 'SUCCESS' \
    --type 'W11XjGpI' \
    --userId 's5OILgDy' \
    > test.out 2>&1
eval_tap $? 230 'GetTradeHistoryByCriteria' test.out

#- 231 GetTradeHistoryByTransactionId
./ng net.accelbyte.sdk.cli.Main platform getTradeHistoryByTransactionId \
    --namespace "$AB_NAMESPACE" \
    --transactionId '1XS4MX1n' \
    > test.out 2>&1
eval_tap $? 231 'GetTradeHistoryByTransactionId' test.out

#- 232 UnlockSteamUserAchievement
./ng net.accelbyte.sdk.cli.Main platform unlockSteamUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'j4BDrXQR' \
    --body '{"achievements": [{"id": "Fd8IPmi5", "value": 95}, {"id": "8iAXE5H7", "value": 24}, {"id": "37aZ6qDy", "value": 14}], "steamUserId": "qXsaEptK"}' \
    > test.out 2>&1
eval_tap $? 232 'UnlockSteamUserAchievement' test.out

#- 233 GetXblUserAchievements
./ng net.accelbyte.sdk.cli.Main platform getXblUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'HC72bPlY' \
    --xboxUserId 'u6Vr732q' \
    > test.out 2>&1
eval_tap $? 233 'GetXblUserAchievements' test.out

#- 234 UpdateXblUserAchievement
./ng net.accelbyte.sdk.cli.Main platform updateXblUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ys80Mc6B' \
    --body '{"achievements": [{"id": "0qrPoR3V", "percentComplete": 85}, {"id": "KdsPYooo", "percentComplete": 63}, {"id": "bXAcnlWE", "percentComplete": 46}], "serviceConfigId": "7LCLrGJr", "titleId": "2sSxeISm", "xboxUserId": "PtojLNyZ"}' \
    > test.out 2>&1
eval_tap $? 234 'UpdateXblUserAchievement' test.out

#- 235 AnonymizeCampaign
./ng net.accelbyte.sdk.cli.Main platform anonymizeCampaign \
    --namespace "$AB_NAMESPACE" \
    --userId '2xtRAglE' \
    > test.out 2>&1
eval_tap $? 235 'AnonymizeCampaign' test.out

#- 236 AnonymizeEntitlement
./ng net.accelbyte.sdk.cli.Main platform anonymizeEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'eTmAvp1T' \
    > test.out 2>&1
eval_tap $? 236 'AnonymizeEntitlement' test.out

#- 237 AnonymizeFulfillment
./ng net.accelbyte.sdk.cli.Main platform anonymizeFulfillment \
    --namespace "$AB_NAMESPACE" \
    --userId 'dmFWDZT1' \
    > test.out 2>&1
eval_tap $? 237 'AnonymizeFulfillment' test.out

#- 238 AnonymizeIntegration
./ng net.accelbyte.sdk.cli.Main platform anonymizeIntegration \
    --namespace "$AB_NAMESPACE" \
    --userId 'r1LmkO24' \
    > test.out 2>&1
eval_tap $? 238 'AnonymizeIntegration' test.out

#- 239 AnonymizeOrder
./ng net.accelbyte.sdk.cli.Main platform anonymizeOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'R6ZWwtIZ' \
    > test.out 2>&1
eval_tap $? 239 'AnonymizeOrder' test.out

#- 240 AnonymizePayment
./ng net.accelbyte.sdk.cli.Main platform anonymizePayment \
    --namespace "$AB_NAMESPACE" \
    --userId '5SwGF3UY' \
    > test.out 2>&1
eval_tap $? 240 'AnonymizePayment' test.out

#- 241 AnonymizeRevocation
./ng net.accelbyte.sdk.cli.Main platform anonymizeRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId 'K2QYjnYb' \
    > test.out 2>&1
eval_tap $? 241 'AnonymizeRevocation' test.out

#- 242 AnonymizeSubscription
./ng net.accelbyte.sdk.cli.Main platform anonymizeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'm8asudJ8' \
    > test.out 2>&1
eval_tap $? 242 'AnonymizeSubscription' test.out

#- 243 AnonymizeWallet
./ng net.accelbyte.sdk.cli.Main platform anonymizeWallet \
    --namespace "$AB_NAMESPACE" \
    --userId 'jxl4dntP' \
    > test.out 2>&1
eval_tap $? 243 'AnonymizeWallet' test.out

#- 244 GetUserDLCByPlatform
./ng net.accelbyte.sdk.cli.Main platform getUserDLCByPlatform \
    --namespace "$AB_NAMESPACE" \
    --userId '8Kpsm4jZ' \
    --type 'XBOX' \
    > test.out 2>&1
eval_tap $? 244 'GetUserDLCByPlatform' test.out

#- 245 GetUserDLC
./ng net.accelbyte.sdk.cli.Main platform getUserDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'XXY4aVBk' \
    --includeAllNamespaces  \
    --status 'FULFILLED' \
    --type 'EPICGAMES' \
    > test.out 2>&1
eval_tap $? 245 'GetUserDLC' test.out

#- 246 QueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'qQBUdeuX' \
    --activeOnly  \
    --appType 'GAME' \
    --collectionId 'ToSYEa6p' \
    --entitlementClazz 'OPTIONBOX' \
    --entitlementName 'CWXIGNL4' \
    --features 'DIIE67ye,YE2i808Q,qRMRAYWp' \
    --fuzzyMatchName  \
    --ignoreActiveDate  \
    --itemId 'V8N55aOx,7pH7YNXB,TyQj6uMQ' \
    --limit '18' \
    --offset '1' \
    --origin 'Nintendo' \
    > test.out 2>&1
eval_tap $? 246 'QueryUserEntitlements' test.out

#- 247 GrantUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform grantUserEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'F8jFos5g' \
    --body '[{"collectionId": "iGhPHxIe", "endDate": "1993-10-24T00:00:00Z", "grantedCode": "XYq9JLNv", "itemId": "M5wEBbT7", "itemNamespace": "mSWyXYTg", "language": "LrDn_OkPz", "metadata": {"NZXuKOry": {}, "GyrOlYq8": {}, "k7ZoUriM": {}}, "origin": "Steam", "quantity": 50, "region": "TK0QB5M2", "source": "REWARD", "startDate": "1993-04-12T00:00:00Z", "storeId": "RmQfb3zA"}, {"collectionId": "FZQInBgg", "endDate": "1982-09-08T00:00:00Z", "grantedCode": "2vWVyygN", "itemId": "RkU8a2wR", "itemNamespace": "wcdwsGcf", "language": "gPIR_PT", "metadata": {"gwitr0do": {}, "Fd1JdJdX": {}, "s65JjSU3": {}}, "origin": "Xbox", "quantity": 84, "region": "0n2w3RVa", "source": "REWARD", "startDate": "1988-02-28T00:00:00Z", "storeId": "j5NSACyf"}, {"collectionId": "0yDt18K3", "endDate": "1973-04-16T00:00:00Z", "grantedCode": "TmyiXBxB", "itemId": "HRxiPrZ5", "itemNamespace": "zTyT7ONc", "language": "rVKL-pHPk", "metadata": {"ZRIWeKeg": {}, "IUjs3XMc": {}, "5OSlAT01": {}}, "origin": "Oculus", "quantity": 3, "region": "a33YL0pQ", "source": "PURCHASE", "startDate": "1974-05-29T00:00:00Z", "storeId": "IiVQuzpi"}]' \
    > test.out 2>&1
eval_tap $? 247 'GrantUserEntitlement' test.out

#- 248 GetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'hKtSyUwJ' \
    --activeOnly  \
    --appId 'ZDC2snz3' \
    > test.out 2>&1
eval_tap $? 248 'GetUserAppEntitlementByAppId' test.out

#- 249 QueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'QYSYZtsM' \
    --activeOnly  \
    --limit '78' \
    --offset '16' \
    --appType 'DLC' \
    > test.out 2>&1
eval_tap $? 249 'QueryUserEntitlementsByAppType' test.out

#- 250 GetUserEntitlementsByIds
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementsByIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'vLV4cpQJ' \
    --ids 'uqzQC4XI,0JiGn559,bls5kOiy' \
    > test.out 2>&1
eval_tap $? 250 'GetUserEntitlementsByIds' test.out

#- 251 GetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'DUK4Vq9H' \
    --activeOnly  \
    --entitlementClazz 'SUBSCRIPTION' \
    --platform 'GZNHttq4' \
    --itemId 'ov08vS0U' \
    > test.out 2>&1
eval_tap $? 251 'GetUserEntitlementByItemId' test.out

#- 252 GetUserActiveEntitlementsByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserActiveEntitlementsByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'O3uOWX9C' \
    --ids 'Snlk2kN3,9u6gW3F6,FdOSVTAZ' \
    --platform 'owzbRCIM' \
    > test.out 2>&1
eval_tap $? 252 'GetUserActiveEntitlementsByItemIds' test.out

#- 253 GetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'efUdmNn7' \
    --activeOnly  \
    --entitlementClazz 'ENTITLEMENT' \
    --platform 'LyHk84RY' \
    --sku '3qDdBMot' \
    > test.out 2>&1
eval_tap $? 253 'GetUserEntitlementBySku' test.out

#- 254 ExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ay5SutIl' \
    --appIds 'mTFslLD9,2WEsvtVx,OyQTogng' \
    --itemIds 'eOJKlV6U,AuBPa30E,JpkIIBS4' \
    --platform '0U1AxEp2' \
    --skus 'kyRSHIML,JlgmB508,fMPK81Rn' \
    > test.out 2>&1
eval_tap $? 254 'ExistsAnyUserActiveEntitlement' test.out

#- 255 ExistsAnyUserActiveEntitlementByItemIds
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlementByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'JpewKYaS' \
    --platform 'EFYweTFy' \
    --itemIds 'C1slYBsH,kTyQqTQe,79ozldhN' \
    > test.out 2>&1
eval_tap $? 255 'ExistsAnyUserActiveEntitlementByItemIds' test.out

#- 256 GetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'rKrmla8x' \
    --appId 'nlIvB2LP' \
    > test.out 2>&1
eval_tap $? 256 'GetUserAppEntitlementOwnershipByAppId' test.out

#- 257 GetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'pg2RZNqg' \
    --entitlementClazz 'CODE' \
    --platform 'QSFupXTx' \
    --itemId 'JVdJVlQz' \
    > test.out 2>&1
eval_tap $? 257 'GetUserEntitlementOwnershipByItemId' test.out

#- 258 GetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'A2xV8Vxr' \
    --ids 'fD2b1CLz,VKDm7G7s,JA6Jljxc' \
    --platform '9JNRtXrB' \
    > test.out 2>&1
eval_tap $? 258 'GetUserEntitlementOwnershipByItemIds' test.out

#- 259 GetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'gj7DbiEK' \
    --entitlementClazz 'APP' \
    --platform 'iRkWwhEZ' \
    --sku '2Hkha4ZG' \
    > test.out 2>&1
eval_tap $? 259 'GetUserEntitlementOwnershipBySku' test.out

#- 260 RevokeAllEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeAllEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'WrODq7Tm' \
    > test.out 2>&1
eval_tap $? 260 'RevokeAllEntitlements' test.out

#- 261 RevokeUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'R5F46sfW' \
    --entitlementIds '5O5Ym0LL' \
    > test.out 2>&1
eval_tap $? 261 'RevokeUserEntitlements' test.out

#- 262 GetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlement \
    --entitlementId 'n2Ahu4FU' \
    --namespace "$AB_NAMESPACE" \
    --userId 'YIu0jCUo' \
    > test.out 2>&1
eval_tap $? 262 'GetUserEntitlement' test.out

#- 263 UpdateUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform updateUserEntitlement \
    --entitlementId 'o570Dx5i' \
    --namespace "$AB_NAMESPACE" \
    --userId 'M3LVEqUO' \
    --body '{"collectionId": "yCh7DQtr", "endDate": "1971-05-09T00:00:00Z", "nullFieldList": ["XjVn35Ke", "8ZUyYfsA", "wl646HIC"], "origin": "IOS", "reason": "eqa7Z2i1", "startDate": "1987-01-22T00:00:00Z", "status": "SOLD", "useCount": 59}' \
    > test.out 2>&1
eval_tap $? 263 'UpdateUserEntitlement' test.out

#- 264 ConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform consumeUserEntitlement \
    --entitlementId '7ORJ2HNG' \
    --namespace "$AB_NAMESPACE" \
    --userId 'kluI2qK2' \
    --body '{"metadata": {"HKI0FH7b": {}, "8Efwk874": {}, "UCvOUqWt": {}}, "options": ["BWkMz8H5", "9DfstZMj", "SYX5JrYq"], "platform": "Dnn9A5Fs", "requestId": "pCDtT3Jq", "useCount": 88}' \
    > test.out 2>&1
eval_tap $? 264 'ConsumeUserEntitlement' test.out

#- 265 DisableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform disableUserEntitlement \
    --entitlementId '96OxtN8Q' \
    --namespace "$AB_NAMESPACE" \
    --userId 'fV6trOoy' \
    > test.out 2>&1
eval_tap $? 265 'DisableUserEntitlement' test.out

#- 266 EnableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform enableUserEntitlement \
    --entitlementId 'PvPqOmh2' \
    --namespace "$AB_NAMESPACE" \
    --userId 'NB4RCsms' \
    > test.out 2>&1
eval_tap $? 266 'EnableUserEntitlement' test.out

#- 267 GetUserEntitlementHistories
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementHistories \
    --entitlementId 'zTEYhXI6' \
    --namespace "$AB_NAMESPACE" \
    --userId 'qvp7Lxsc' \
    > test.out 2>&1
eval_tap $? 267 'GetUserEntitlementHistories' test.out

#- 268 RevokeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlement \
    --entitlementId 'FD3ycep4' \
    --namespace "$AB_NAMESPACE" \
    --userId 'oonEgBEP' \
    --body '{"metadata": {"skJJ5CP2": {}, "tDe4oy4t": {}, "zenu29D1": {}}}' \
    > test.out 2>&1
eval_tap $? 268 'RevokeUserEntitlement' test.out

#- 269 RevokeUserEntitlementByUseCount
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlementByUseCount \
    --entitlementId '1Dr3ycRS' \
    --namespace "$AB_NAMESPACE" \
    --userId 'pOvooOBe' \
    --body '{"reason": "3aUOICnf", "useCount": 74}' \
    > test.out 2>&1
eval_tap $? 269 'RevokeUserEntitlementByUseCount' test.out

#- 270 PreCheckRevokeUserEntitlementByUseCount
./ng net.accelbyte.sdk.cli.Main platform preCheckRevokeUserEntitlementByUseCount \
    --entitlementId 'OeVl7IUp' \
    --namespace "$AB_NAMESPACE" \
    --userId 'xIkFDoUl' \
    --quantity '5' \
    > test.out 2>&1
eval_tap $? 270 'PreCheckRevokeUserEntitlementByUseCount' test.out

#- 271 RevokeUseCount
eval_tap 0 271 'RevokeUseCount # SKIP deprecated' test.out

#- 272 SellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform sellUserEntitlement \
    --entitlementId 'fpl05nae' \
    --namespace "$AB_NAMESPACE" \
    --userId '0DwjMEsV' \
    --body '{"platform": "O6TosuRk", "requestId": "LHqvDeOx", "useCount": 49}' \
    > test.out 2>&1
eval_tap $? 272 'SellUserEntitlement' test.out

#- 273 FulfillItem
./ng net.accelbyte.sdk.cli.Main platform fulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'nr09seND' \
    --body '{"duration": 88, "endDate": "1986-07-24T00:00:00Z", "entitlementCollectionId": "375hyxSh", "entitlementOrigin": "System", "itemId": "Z715YwQn", "itemSku": "yYd0Zz4S", "language": "r63GE3Ar", "metadata": {"ijnKXQnd": {}, "BheEOPsd": {}, "rXf6tAIi": {}}, "order": {"currency": {"currencyCode": "OxtVkyxU", "currencySymbol": "X5lj1fzh", "currencyType": "REAL", "decimals": 25, "namespace": "32jQ5hlk"}, "ext": {"sMkTLJpO": {}, "6oEQLm8Q": {}, "fLFRWHoz": {}}, "free": false}, "orderNo": "aTLYrnCW", "origin": "Oculus", "overrideBundleItemQty": {"zVnZh5oj": 29, "Td5bIf07": 6, "dUCjBRgj": 86}, "quantity": 5, "region": "6meV1MxQ", "source": "ACHIEVEMENT", "startDate": "1981-12-30T00:00:00Z", "storeId": "V4YPAvzT"}' \
    > test.out 2>&1
eval_tap $? 273 'FulfillItem' test.out

#- 274 RedeemCode
./ng net.accelbyte.sdk.cli.Main platform redeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'uog8Lz3y' \
    --body '{"code": "thZ2H3DW", "language": "llT-291", "region": "5EaR7ulE"}' \
    > test.out 2>&1
eval_tap $? 274 'RedeemCode' test.out

#- 275 PreCheckFulfillItem
./ng net.accelbyte.sdk.cli.Main platform preCheckFulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId '2us4Aqj5' \
    --body '{"itemId": "6JdeVKe9", "itemSku": "cxJv8FXj", "quantity": 6}' \
    > test.out 2>&1
eval_tap $? 275 'PreCheckFulfillItem' test.out

#- 276 FulfillRewards
./ng net.accelbyte.sdk.cli.Main platform fulfillRewards \
    --namespace "$AB_NAMESPACE" \
    --userId '6RyGzGaF' \
    --body '{"entitlementCollectionId": "fJZeM2AX", "entitlementOrigin": "Oculus", "metadata": {"BqmPi4OL": {}, "u1dZpdCG": {}, "JRG1ogS8": {}}, "origin": "Epic", "rewards": [{"currency": {"currencyCode": "tfitBPbX", "namespace": "aEm0eFJN"}, "item": {"itemId": "qaAwza2A", "itemName": "Q5HEqCbG", "itemSku": "HIVZMMFR", "itemType": "ZmxVAvub"}, "quantity": 63, "type": "ITEM"}, {"currency": {"currencyCode": "MYKq37wi", "namespace": "ZZpfSOtS"}, "item": {"itemId": "Gw8ZJTmP", "itemName": "EuVN8oJR", "itemSku": "61dq91ov", "itemType": "a8ecv4vp"}, "quantity": 59, "type": "CURRENCY"}, {"currency": {"currencyCode": "vGcU9GCz", "namespace": "ZCZvLdzH"}, "item": {"itemId": "PLppbn5z", "itemName": "hTVLJzsj", "itemSku": "TCESUAHb", "itemType": "iMze5uIB"}, "quantity": 28, "type": "ITEM"}], "source": "DLC", "transactionId": "VhrdNRgV"}' \
    > test.out 2>&1
eval_tap $? 276 'FulfillRewards' test.out

#- 277 QueryUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'n9Np2OEy' \
    --endTime 'k1xKYjZu' \
    --limit '79' \
    --offset '40' \
    --productId '2Kcyu6K7' \
    --startTime '8fm36FpJ' \
    --status 'FAILED' \
    --type 'PLAYSTATION' \
    > test.out 2>&1
eval_tap $? 277 'QueryUserIAPOrders' test.out

#- 278 QueryAllUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryAllUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId '93sL7iUe' \
    > test.out 2>&1
eval_tap $? 278 'QueryAllUserIAPOrders' test.out

#- 279 QueryUserIAPConsumeHistory
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPConsumeHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'ts18k2td' \
    --endTime 'PwELbBkK' \
    --limit '52' \
    --offset '2' \
    --startTime 'cFcK9ZkC' \
    --status 'PENDING' \
    --type 'STEAM' \
    > test.out 2>&1
eval_tap $? 279 'QueryUserIAPConsumeHistory' test.out

#- 280 MockFulfillIAPItem
./ng net.accelbyte.sdk.cli.Main platform mockFulfillIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'OahBG0Yx' \
    --body '{"itemIdentityType": "ITEM_SKU", "language": "eR-DFLz", "productId": "PMQUDhzn", "region": "Mb5FucfF", "transactionId": "Bg66BrCt", "type": "APPLE"}' \
    > test.out 2>&1
eval_tap $? 280 'MockFulfillIAPItem' test.out

#- 281 QueryUserThirdPartySubscription
./ng net.accelbyte.sdk.cli.Main platform queryUserThirdPartySubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'CJGxKclx' \
    --activeOnly  \
    --groupId 'cckln41m' \
    --limit '98' \
    --offset '3' \
    --platform 'TWITCH' \
    --productId 'bZxDaikz' \
    > test.out 2>&1
eval_tap $? 281 'QueryUserThirdPartySubscription' test.out

#- 282 GetThirdPartyPlatformSubscriptionOwnershipByGroupId
./ng net.accelbyte.sdk.cli.Main platform getThirdPartyPlatformSubscriptionOwnershipByGroupId \
    --namespace "$AB_NAMESPACE" \
    --platform 'STADIA' \
    --userId 'ExGQ158J' \
    --groupId 'MRWI29Ed' \
    > test.out 2>&1
eval_tap $? 282 'GetThirdPartyPlatformSubscriptionOwnershipByGroupId' test.out

#- 283 GetThirdPartyPlatformSubscriptionOwnershipByProductId
./ng net.accelbyte.sdk.cli.Main platform getThirdPartyPlatformSubscriptionOwnershipByProductId \
    --namespace "$AB_NAMESPACE" \
    --platform 'PLAYSTATION' \
    --userId 'bb3ngbf8' \
    --productId 'dbaSBkhU' \
    > test.out 2>&1
eval_tap $? 283 'GetThirdPartyPlatformSubscriptionOwnershipByProductId' test.out

#- 284 QueryUserThirdPartySubscriptionTransactions
./ng net.accelbyte.sdk.cli.Main platform queryUserThirdPartySubscriptionTransactions \
    --namespace "$AB_NAMESPACE" \
    --userId 'vzsohqSv' \
    --activeOnly  \
    --groupId 'RILIc7g3' \
    --limit '15' \
    --offset '72' \
    --platform 'GOOGLE' \
    --productId '6iXYC8V3' \
    > test.out 2>&1
eval_tap $? 284 'QueryUserThirdPartySubscriptionTransactions' test.out

#- 285 GetThirdPartySubscriptionDetails
./ng net.accelbyte.sdk.cli.Main platform getThirdPartySubscriptionDetails \
    --id '4Kwa4o2b' \
    --namespace "$AB_NAMESPACE" \
    --userId '58ioLaEr' \
    > test.out 2>&1
eval_tap $? 285 'GetThirdPartySubscriptionDetails' test.out

#- 286 GetSubscriptionHistory
./ng net.accelbyte.sdk.cli.Main platform getSubscriptionHistory \
    --id 'G5dBU4AS' \
    --namespace "$AB_NAMESPACE" \
    --userId '6Gy2feGW' \
    --limit '2' \
    --offset '90' \
    > test.out 2>&1
eval_tap $? 286 'GetSubscriptionHistory' test.out

#- 287 SyncSubscriptionTransaction
./ng net.accelbyte.sdk.cli.Main platform syncSubscriptionTransaction \
    --id 'Umx8YNfR' \
    --namespace "$AB_NAMESPACE" \
    --userId 'zPbP6NYe' \
    > test.out 2>&1
eval_tap $? 287 'SyncSubscriptionTransaction' test.out

#- 288 GetThirdPartyUserSubscriptionDetails
./ng net.accelbyte.sdk.cli.Main platform getThirdPartyUserSubscriptionDetails \
    --id '83iu7acE' \
    --namespace "$AB_NAMESPACE" \
    --userId 'RwGndQIF' \
    > test.out 2>&1
eval_tap $? 288 'GetThirdPartyUserSubscriptionDetails' test.out

#- 289 SyncSubscription
./ng net.accelbyte.sdk.cli.Main platform syncSubscription \
    --id 'C5ttWGwO' \
    --namespace "$AB_NAMESPACE" \
    --userId 'CJdXGE3w' \
    > test.out 2>&1
eval_tap $? 289 'SyncSubscription' test.out

#- 290 QueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'iup6WeT3' \
    --discounted  \
    --itemId 'tNdDPyZ3' \
    --limit '20' \
    --offset '38' \
    --status 'CHARGEBACK_REVERSED' \
    > test.out 2>&1
eval_tap $? 290 'QueryUserOrders' test.out

#- 291 AdminCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform adminCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'nQjZ1nso' \
    --body '{"currencyCode": "BH4ovRTX", "currencyNamespace": "oT9w7xnf", "discountCodes": ["7o6RHCdI", "P4te00DQ", "mcSnsoOJ"], "discountedPrice": 78, "entitlementPlatform": "Steam", "ext": {"oAmdaHSu": {}, "As0pZwKw": {}, "SK9OhDIk": {}}, "itemId": "bbpRIhNt", "language": "DLrewpz8", "options": {"skipPriceValidation": true}, "platform": "Epic", "price": 33, "quantity": 41, "region": "hDgvvJ6o", "returnUrl": "ovgOw8P5", "sandbox": false, "sectionId": "KudMaXMA"}' \
    > test.out 2>&1
eval_tap $? 291 'AdminCreateUserOrder' test.out

#- 292 CountOfPurchasedItem
./ng net.accelbyte.sdk.cli.Main platform countOfPurchasedItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'Z2NAOWZq' \
    --itemId '0vx6KejV' \
    > test.out 2>&1
eval_tap $? 292 'CountOfPurchasedItem' test.out

#- 293 GetUserOrder
./ng net.accelbyte.sdk.cli.Main platform getUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo '4b1JsrK6' \
    --userId 'tbZ0Lx2c' \
    > test.out 2>&1
eval_tap $? 293 'GetUserOrder' test.out

#- 294 UpdateUserOrderStatus
./ng net.accelbyte.sdk.cli.Main platform updateUserOrderStatus \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'X4mYiVxY' \
    --userId '5NYK6Hmo' \
    --body '{"status": "CHARGED", "statusReason": "AsExqZTu"}' \
    > test.out 2>&1
eval_tap $? 294 'UpdateUserOrderStatus' test.out

#- 295 FulfillUserOrder
./ng net.accelbyte.sdk.cli.Main platform fulfillUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'GhE4ENK5' \
    --userId 'YuUwZQrR' \
    > test.out 2>&1
eval_tap $? 295 'FulfillUserOrder' test.out

#- 296 GetUserOrderGrant
eval_tap 0 296 'GetUserOrderGrant # SKIP deprecated' test.out

#- 297 GetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform getUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'UvZ6Ip3t' \
    --userId '9Gc1LVFm' \
    > test.out 2>&1
eval_tap $? 297 'GetUserOrderHistories' test.out

#- 298 ProcessUserOrderNotification
./ng net.accelbyte.sdk.cli.Main platform processUserOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'RiWdeqFq' \
    --userId 'kjiFSMYk' \
    --body '{"additionalData": {"cardSummary": "jqBfVGWE"}, "authorisedTime": "1975-10-31T00:00:00Z", "chargebackReversedTime": "1997-10-30T00:00:00Z", "chargebackTime": "1985-07-05T00:00:00Z", "chargedTime": "1985-08-10T00:00:00Z", "createdTime": "1995-10-16T00:00:00Z", "currency": {"currencyCode": "Wn6NXoTi", "currencySymbol": "ewMzhtDT", "currencyType": "VIRTUAL", "decimals": 2, "namespace": "QycyAWyg"}, "customParameters": {"JPYS6fYA": {}, "ouDemYGX": {}, "NC46lCNC": {}}, "extOrderNo": "pnbSFAMn", "extTxId": "HuJgX0Hz", "extUserId": "PES4LMjh", "issuedAt": "1988-01-30T00:00:00Z", "metadata": {"apxmZ1pk": "h9yrazIS", "z1Ri3A2G": "uHrzGY2H", "yIPiRkHb": "ao0wQMP0"}, "namespace": "FkoSbQeX", "nonceStr": "rB2VeJla", "paymentData": {"discountAmount": 58, "discountCode": "P8Di10Jm", "subtotalPrice": 19, "tax": 63, "totalPrice": 16}, "paymentMethod": "UG8p6itU", "paymentMethodFee": 22, "paymentOrderNo": "rZhgZPLT", "paymentProvider": "XSOLLA", "paymentProviderFee": 40, "paymentStationUrl": "ZE6UUTXu", "price": 32, "refundedTime": "1980-12-05T00:00:00Z", "salesTax": 16, "sandbox": false, "sku": "gCutlL8J", "status": "CHARGED", "statusReason": "aBKBKXOG", "subscriptionId": "b8OG1ot4", "subtotalPrice": 86, "targetNamespace": "KOZN5zme", "targetUserId": "GySIMHOT", "tax": 10, "totalPrice": 44, "totalTax": 86, "txEndTime": "1991-08-29T00:00:00Z", "type": "HY0celFt", "userId": "lVUWNwpi", "vat": 45}' \
    > test.out 2>&1
eval_tap $? 298 'ProcessUserOrderNotification' test.out

#- 299 DownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform downloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'ZJRN354z' \
    --userId 'qjSejz4Q' \
    > test.out 2>&1
eval_tap $? 299 'DownloadUserOrderReceipt' test.out

#- 300 CreateUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform createUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --userId '8SvnF1Pb' \
    --body '{"currencyCode": "5qeUQQwP", "currencyNamespace": "YMBDs9LL", "customParameters": {"WN8cA0UE": {}, "PTmXxuHG": {}, "T8DoM52v": {}}, "description": "F7Y6jldM", "extOrderNo": "5Xf8Ywly", "extUserId": "ymV91Ica", "itemType": "APP", "language": "nsK-sJXq_718", "metadata": {"2cMep15Z": "pPEoDVRD", "3YTtf8oF": "qWWlWROO", "rY2qnnte": "nycFlLu8"}, "notifyUrl": "d0yXd4bk", "omitNotification": false, "platform": "KhJPYRv1", "price": 67, "recurringPaymentOrderNo": "lek0lXMw", "region": "b6mfiwzx", "returnUrl": "LnE2BCho", "sandbox": false, "sku": "MNQIuzwi", "subscriptionId": "RrXY89p5", "title": "9LjgABUS"}' \
    > test.out 2>&1
eval_tap $? 300 'CreateUserPaymentOrder' test.out

#- 301 RefundUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform refundUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'j1MbPAPn' \
    --userId 'ryIMHXwj' \
    --body '{"description": "RIQVct2f"}' \
    > test.out 2>&1
eval_tap $? 301 'RefundUserPaymentOrder' test.out

#- 302 GetUserPlatformAccountClosureHistories
./ng net.accelbyte.sdk.cli.Main platform getUserPlatformAccountClosureHistories \
    --namespace "$AB_NAMESPACE" \
    --userId 'Jxf3yTXi' \
    > test.out 2>&1
eval_tap $? 302 'GetUserPlatformAccountClosureHistories' test.out

#- 303 ApplyUserRedemption
./ng net.accelbyte.sdk.cli.Main platform applyUserRedemption \
    --namespace "$AB_NAMESPACE" \
    --userId 'FGwSJHtQ' \
    --body '{"code": "mTf2QGSL", "orderNo": "MJCyNcOT"}' \
    > test.out 2>&1
eval_tap $? 303 'ApplyUserRedemption' test.out

#- 304 DoRevocation
./ng net.accelbyte.sdk.cli.Main platform doRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId 'XUIxqGAp' \
    --body '{"meta": {"MA28Zrp8": {}, "6tuE8aRa": {}, "SVWVNHw4": {}}, "reason": "cIq0YyeP", "requestId": "TFAJrZgc", "revokeEntries": [{"currency": {"balanceOrigin": "Playstation", "currencyCode": "b80W3R0u", "namespace": "bCQfqSiX"}, "entitlement": {"entitlementId": "NnifWSi8"}, "item": {"entitlementOrigin": "Oculus", "itemIdentity": "k6o1U9aK", "itemIdentityType": "ITEM_SKU", "origin": "Twitch"}, "quantity": 38, "type": "ENTITLEMENT"}, {"currency": {"balanceOrigin": "GooglePlay", "currencyCode": "2BlWAd3Q", "namespace": "paVXirUk"}, "entitlement": {"entitlementId": "aVvNfBqI"}, "item": {"entitlementOrigin": "IOS", "itemIdentity": "g3NliHUp", "itemIdentityType": "ITEM_ID", "origin": "IOS"}, "quantity": 38, "type": "CURRENCY"}, {"currency": {"balanceOrigin": "Other", "currencyCode": "1Dw6a1e0", "namespace": "9Dyt5Q1w"}, "entitlement": {"entitlementId": "odWREPRt"}, "item": {"entitlementOrigin": "Epic", "itemIdentity": "xl6Sdje1", "itemIdentityType": "ITEM_ID", "origin": "Other"}, "quantity": 75, "type": "ITEM"}], "source": "OTHER", "transactionId": "LrbsW7pv"}' \
    > test.out 2>&1
eval_tap $? 304 'DoRevocation' test.out

#- 305 RegisterXblSessions
./ng net.accelbyte.sdk.cli.Main platform registerXblSessions \
    --namespace "$AB_NAMESPACE" \
    --userId 'OBRVqMn8' \
    --body '{"gameSessionId": "VeJxvCjM", "payload": {"TAj8YJQ1": {}, "tNHh5FYM": {}, "2vjcCKGu": {}}, "scid": "cYfbn3A1", "sessionTemplateName": "bDc2GTzS"}' \
    > test.out 2>&1
eval_tap $? 305 'RegisterXblSessions' test.out

#- 306 QueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform queryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId '0KlNWFs1' \
    --chargeStatus 'RECURRING_CHARGING' \
    --itemId 'Jo30cQsB' \
    --limit '82' \
    --offset '71' \
    --sku 'DL9xdWdM' \
    --status 'INIT' \
    --subscribedBy 'PLATFORM' \
    > test.out 2>&1
eval_tap $? 306 'QueryUserSubscriptions' test.out

#- 307 GetUserSubscriptionActivities
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionActivities \
    --namespace "$AB_NAMESPACE" \
    --userId 'YO9l0rJB' \
    --excludeSystem  \
    --limit '40' \
    --offset '84' \
    --subscriptionId 'asqpBXVx' \
    > test.out 2>&1
eval_tap $? 307 'GetUserSubscriptionActivities' test.out

#- 308 PlatformSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform platformSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZkGIbhdd' \
    --body '{"grantDays": 99, "itemId": "VmfxycMu", "language": "YGojrkCW", "reason": "Yj7oXiSs", "region": "wyJuKPpu", "source": "Xo15HGMs"}' \
    > test.out 2>&1
eval_tap $? 308 'PlatformSubscribeSubscription' test.out

#- 309 CheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform checkUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId '7dkmSqOR' \
    --itemId 'OssTFnnb' \
    > test.out 2>&1
eval_tap $? 309 'CheckUserSubscriptionSubscribableByItemId' test.out

#- 310 GetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform getUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'GPD7fPj4' \
    --userId 'rNM7Zhyk' \
    > test.out 2>&1
eval_tap $? 310 'GetUserSubscription' test.out

#- 311 DeleteUserSubscription
./ng net.accelbyte.sdk.cli.Main platform deleteUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'GwYvMyvH' \
    --userId 'XiyZa9aw' \
    > test.out 2>&1
eval_tap $? 311 'DeleteUserSubscription' test.out

#- 312 CancelSubscription
./ng net.accelbyte.sdk.cli.Main platform cancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'WfiDwLBK' \
    --userId 'QAg9LoK6' \
    --force  \
    --body '{"immediate": true, "reason": "swh1ajH7"}' \
    > test.out 2>&1
eval_tap $? 312 'CancelSubscription' test.out

#- 313 GrantDaysToSubscription
./ng net.accelbyte.sdk.cli.Main platform grantDaysToSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'hi4xlypl' \
    --userId 'oe3WM7wu' \
    --body '{"grantDays": 83, "reason": "QbNHZehD"}' \
    > test.out 2>&1
eval_tap $? 313 'GrantDaysToSubscription' test.out

#- 314 GetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'PRu91ExV' \
    --userId 'TYvpWLYW' \
    --excludeFree  \
    --limit '16' \
    --offset '10' \
    > test.out 2>&1
eval_tap $? 314 'GetUserSubscriptionBillingHistories' test.out

#- 315 ProcessUserSubscriptionNotification
./ng net.accelbyte.sdk.cli.Main platform processUserSubscriptionNotification \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'n1OnHLw4' \
    --userId 'buUwgWYg' \
    --body '{"additionalData": {"cardSummary": "Ah60pdDw"}, "authorisedTime": "1980-11-05T00:00:00Z", "chargebackReversedTime": "1995-12-31T00:00:00Z", "chargebackTime": "1979-09-05T00:00:00Z", "chargedTime": "1975-01-22T00:00:00Z", "createdTime": "1997-05-26T00:00:00Z", "currency": {"currencyCode": "2im7RnDv", "currencySymbol": "vlAQFRxv", "currencyType": "VIRTUAL", "decimals": 83, "namespace": "WSAlDG6K"}, "customParameters": {"8iQr6I4i": {}, "vyLTfe7I": {}, "z2JGo83T": {}}, "extOrderNo": "7x0hG2q2", "extTxId": "gbZ7d04F", "extUserId": "BqncyJs4", "issuedAt": "1989-03-05T00:00:00Z", "metadata": {"Zi5JYDAQ": "NHJBTeIq", "3FUYTE6e": "Bhal5zBk", "N1j3sB0q": "En0CfQWq"}, "namespace": "dXh9i21U", "nonceStr": "shVYmjbA", "paymentData": {"discountAmount": 1, "discountCode": "1EHScoTr", "subtotalPrice": 64, "tax": 15, "totalPrice": 72}, "paymentMethod": "QG33ObnY", "paymentMethodFee": 49, "paymentOrderNo": "4YMqlnR5", "paymentProvider": "XSOLLA", "paymentProviderFee": 41, "paymentStationUrl": "ZrnRCPyp", "price": 78, "refundedTime": "1984-12-01T00:00:00Z", "salesTax": 3, "sandbox": true, "sku": "GLLJTXOI", "status": "CHARGE_FAILED", "statusReason": "PbRqqjXU", "subscriptionId": "q9HUpNby", "subtotalPrice": 30, "targetNamespace": "JOwUsQNS", "targetUserId": "SkUnRNKo", "tax": 17, "totalPrice": 25, "totalTax": 82, "txEndTime": "1996-09-17T00:00:00Z", "type": "RcTISPQT", "userId": "4AqNOFzs", "vat": 35}' \
    > test.out 2>&1
eval_tap $? 315 'ProcessUserSubscriptionNotification' test.out

#- 316 AcquireUserTicket
./ng net.accelbyte.sdk.cli.Main platform acquireUserTicket \
    --boothName 'mOqz0rl6' \
    --namespace "$AB_NAMESPACE" \
    --userId 'fS9QK1SO' \
    --body '{"count": 9, "orderNo": "zE1W7BtG"}' \
    > test.out 2>&1
eval_tap $? 316 'AcquireUserTicket' test.out

#- 317 QueryUserCurrencyWallets
./ng net.accelbyte.sdk.cli.Main platform queryUserCurrencyWallets \
    --namespace "$AB_NAMESPACE" \
    --userId 'pwusyCt1' \
    > test.out 2>&1
eval_tap $? 317 'QueryUserCurrencyWallets' test.out

#- 318 DebitUserWalletByCurrencyCode
./ng net.accelbyte.sdk.cli.Main platform debitUserWalletByCurrencyCode \
    --currencyCode 'nTcIQGwd' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Uv8Jh0O7' \
    --body '{"allowOverdraft": true, "amount": 89, "balanceOrigin": "Playstation", "balanceSource": "DLC_REVOCATION", "metadata": {"TquMigmw": {}, "o7wQfrz1": {}, "2CFU6y4z": {}}, "reason": "2DUCjVwU"}' \
    > test.out 2>&1
eval_tap $? 318 'DebitUserWalletByCurrencyCode' test.out

#- 319 ListUserCurrencyTransactions
./ng net.accelbyte.sdk.cli.Main platform listUserCurrencyTransactions \
    --currencyCode '9PtH0nHv' \
    --namespace "$AB_NAMESPACE" \
    --userId '9DSNJtHM' \
    --limit '73' \
    --offset '39' \
    > test.out 2>&1
eval_tap $? 319 'ListUserCurrencyTransactions' test.out

#- 320 CheckBalance
./ng net.accelbyte.sdk.cli.Main platform checkBalance \
    --currencyCode 'tgmFeDAT' \
    --namespace "$AB_NAMESPACE" \
    --userId 'urRtB6Xf' \
    --request '{"amount": 69, "debitBalanceSource": "TRADE", "metadata": {"Gck6usuk": {}, "2DPh0cbk": {}, "CHgygEMy": {}}, "reason": "ygi9Y5gz", "walletPlatform": "Oculus"}' \
    > test.out 2>&1
eval_tap $? 320 'CheckBalance' test.out

#- 321 CheckWallet
eval_tap 0 321 'CheckWallet # SKIP deprecated' test.out

#- 322 CreditUserWallet
./ng net.accelbyte.sdk.cli.Main platform creditUserWallet \
    --currencyCode 'MPwHfzqs' \
    --namespace "$AB_NAMESPACE" \
    --userId 'GqhFm2rP' \
    --body '{"amount": 45, "expireAt": "1989-08-05T00:00:00Z", "metadata": {"1vezeE1s": {}, "Vv8O9WNF": {}, "LSndL0RQ": {}}, "origin": "Other", "reason": "eIx4PuuT", "source": "SELL_BACK"}' \
    > test.out 2>&1
eval_tap $? 322 'CreditUserWallet' test.out

#- 323 DebitByWalletPlatform
./ng net.accelbyte.sdk.cli.Main platform debitByWalletPlatform \
    --currencyCode 'nTINx8dR' \
    --namespace "$AB_NAMESPACE" \
    --userId 'eLlojojy' \
    --request '{"amount": 55, "debitBalanceSource": "EXPIRATION", "metadata": {"OFO4cJzq": {}, "LaJGPwcv": {}, "0ajTm1gu": {}}, "reason": "9sYNhwNp", "walletPlatform": "Epic"}' \
    > test.out 2>&1
eval_tap $? 323 'DebitByWalletPlatform' test.out

#- 324 PayWithUserWallet
./ng net.accelbyte.sdk.cli.Main platform payWithUserWallet \
    --currencyCode 'YqXipbVl' \
    --namespace "$AB_NAMESPACE" \
    --userId 'mdVxYP9d' \
    --body '{"amount": 83, "metadata": {"LGa6CM2k": {}, "SSu5sg5v": {}, "pByEKDsc": {}}, "walletPlatform": "Oculus"}' \
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
    --storeId '2XYoD4pP' \
    > test.out 2>&1
eval_tap $? 330 'ListViews' test.out

#- 331 CreateView
./ng net.accelbyte.sdk.cli.Main platform createView \
    --namespace "$AB_NAMESPACE" \
    --storeId 'PCPQK0cE' \
    --body '{"displayOrder": 24, "localizations": {"US8rnBNc": {"description": "43iMxcfo", "localExt": {"NfGuhoK5": {}, "x2PaBmNn": {}, "ISFUSCoO": {}}, "longDescription": "hcf2smAE", "title": "yPW5VS6j"}, "tU5VvOMW": {"description": "ERk3hrV2", "localExt": {"AKhYAZmm": {}, "RMQOEGsn": {}, "tYfuSN67": {}}, "longDescription": "c0yYqpVC", "title": "6zFoqBY6"}, "C6boH18v": {"description": "NXlf6ff5", "localExt": {"a2MtyLvY": {}, "YLkmvZjg": {}, "07bx3hLX": {}}, "longDescription": "eda5OwJd", "title": "UVtMWSkd"}}, "name": "9E3aiZhb"}' \
    > test.out 2>&1
eval_tap $? 331 'CreateView' test.out

#- 332 GetView
./ng net.accelbyte.sdk.cli.Main platform getView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'dD790pkN' \
    --storeId 'uA6qbub5' \
    > test.out 2>&1
eval_tap $? 332 'GetView' test.out

#- 333 UpdateView
./ng net.accelbyte.sdk.cli.Main platform updateView \
    --namespace "$AB_NAMESPACE" \
    --viewId '17F4RVdi' \
    --storeId 'HMW2mS4J' \
    --body '{"displayOrder": 67, "localizations": {"DBhqQQot": {"description": "s2J3earO", "localExt": {"Iu6H22l1": {}, "zCLlGFOo": {}, "THS7m8Jp": {}}, "longDescription": "AzQm9YYU", "title": "fkdiCDZ0"}, "d7bWE5Cb": {"description": "iO1LmA1a", "localExt": {"MVJtwWqz": {}, "Lkkz299x": {}, "ZMoaSCTe": {}}, "longDescription": "aPHxl4qO", "title": "lRhI09fv"}, "6zNE8hyn": {"description": "SSRYf5cH", "localExt": {"DxUUwdZw": {}, "Np8eEJNw": {}, "6QP38xwR": {}}, "longDescription": "2KtC0jqv", "title": "2hmDJJjT"}}, "name": "G51RKCUA"}' \
    > test.out 2>&1
eval_tap $? 333 'UpdateView' test.out

#- 334 DeleteView
./ng net.accelbyte.sdk.cli.Main platform deleteView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'MmIEAA4Z' \
    --storeId 'WQz55Bve' \
    > test.out 2>&1
eval_tap $? 334 'DeleteView' test.out

#- 335 QueryWallets
eval_tap 0 335 'QueryWallets # SKIP deprecated' test.out

#- 336 BulkCredit
./ng net.accelbyte.sdk.cli.Main platform bulkCredit \
    --namespace "$AB_NAMESPACE" \
    --body '[{"creditRequest": {"amount": 12, "expireAt": "1975-01-31T00:00:00Z", "metadata": {"KsSzd823": {}, "o6OVqUhE": {}, "6aYfUPnE": {}}, "origin": "Xbox", "reason": "oyqu4Lxq", "source": "TRADE"}, "currencyCode": "NCB4nWhe", "userIds": ["Cy53mXnE", "l3wJNkyy", "QONTsq7K"]}, {"creditRequest": {"amount": 33, "expireAt": "1977-07-12T00:00:00Z", "metadata": {"FH0IB0TA": {}, "qsb0bbJo": {}, "8p22UazH": {}}, "origin": "Xbox", "reason": "ta2gk0GG", "source": "REWARD"}, "currencyCode": "KILT8PD5", "userIds": ["cOvQp79F", "0BVNVq4m", "6psT7buG"]}, {"creditRequest": {"amount": 75, "expireAt": "1983-04-30T00:00:00Z", "metadata": {"RXxzTYAo": {}, "LrnEazwN": {}, "63mhhMI2": {}}, "origin": "Nintendo", "reason": "4gNWsn1n", "source": "REWARD"}, "currencyCode": "5jHvlNoO", "userIds": ["kLRj9CQl", "Tu6vJQHD", "3UjBzaJE"]}]' \
    > test.out 2>&1
eval_tap $? 336 'BulkCredit' test.out

#- 337 BulkDebit
./ng net.accelbyte.sdk.cli.Main platform bulkDebit \
    --namespace "$AB_NAMESPACE" \
    --body '[{"currencyCode": "Q6onNDq4", "request": {"allowOverdraft": true, "amount": 75, "balanceOrigin": "Steam", "balanceSource": "IAP_REVOCATION", "metadata": {"0W4qs5db": {}, "7soz8KPX": {}, "xGEFnLHC": {}}, "reason": "GNyJJUuA"}, "userIds": ["nORRciIM", "MAJCo4cy", "nOLnp8wb"]}, {"currencyCode": "RgcxcItE", "request": {"allowOverdraft": false, "amount": 34, "balanceOrigin": "Playstation", "balanceSource": "TRADE", "metadata": {"bjVn6t6b": {}, "sxjt4MRF": {}, "cGhisM28": {}}, "reason": "rc5xr014"}, "userIds": ["Hcf5oAM5", "3mkOJ6FC", "Fn27LG7W"]}, {"currencyCode": "2AAjSqgf", "request": {"allowOverdraft": false, "amount": 2, "balanceOrigin": "GooglePlay", "balanceSource": "ORDER_REVOCATION", "metadata": {"ys7tIcsK": {}, "1ybRvgBg": {}, "G4zB46eT": {}}, "reason": "jk4wVBMX"}, "userIds": ["VvCodLVT", "NBqR8rz2", "x6lsKSIk"]}]' \
    > test.out 2>&1
eval_tap $? 337 'BulkDebit' test.out

#- 338 GetWallet
eval_tap 0 338 'GetWallet # SKIP deprecated' test.out

#- 339 SyncOrders
./ng net.accelbyte.sdk.cli.Main platform syncOrders \
    --nextEvaluatedKey '1mLnNS7i' \
    --end 'tl3Y3MWP' \
    --start 'o15KIXV2' \
    > test.out 2>&1
eval_tap $? 339 'SyncOrders' test.out

#- 340 TestAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfig \
    --sandbox  \
    --body '{"allowedPaymentMethods": ["6DgRN6q0", "Lu5TNTJh", "NA7OOFqP"], "apiKey": "7KWLK5cG", "authoriseAsCapture": false, "blockedPaymentMethods": ["zNUF1bAo", "p0tiCZhX", "IASrdgAr"], "clientKey": "DY6Yf4ho", "dropInSettings": "gfS1QFIG", "liveEndpointUrlPrefix": "mOzFTyKn", "merchantAccount": "jVVMdoRs", "notificationHmacKey": "G7LC1GwA", "notificationPassword": "25K5W0y3", "notificationUsername": "Xwfegjss", "returnUrl": "xMV99now", "settings": "iXY216bo"}' \
    > test.out 2>&1
eval_tap $? 340 'TestAdyenConfig' test.out

#- 341 TestAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfig \
    --sandbox  \
    --body '{"appId": "8AGSO6Sd", "privateKey": "QyJzdWQz", "publicKey": "QjSrQYQO", "returnUrl": "OM8jNfSM"}' \
    > test.out 2>&1
eval_tap $? 341 'TestAliPayConfig' test.out

#- 342 TestCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfig \
    --sandbox  \
    --body '{"publicKey": "9mn8NJoz", "secretKey": "eAh2vTA7"}' \
    > test.out 2>&1
eval_tap $? 342 'TestCheckoutConfig' test.out

#- 343 DebugMatchedPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentMerchantConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'Ak7Rj94Y' \
    > test.out 2>&1
eval_tap $? 343 'DebugMatchedPaymentMerchantConfig' test.out

#- 344 TestNeonPayConfig
./ng net.accelbyte.sdk.cli.Main platform testNeonPayConfig \
    --sandbox  \
    --body '{"apiKey": "XKuHMyE7", "webhookSecretKey": "FCc38qgZ"}' \
    > test.out 2>&1
eval_tap $? 344 'TestNeonPayConfig' test.out

#- 345 TestPayPalConfig
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfig \
    --sandbox  \
    --body '{"clientID": "rB7NHIrp", "clientSecret": "SwfRqKmh", "returnUrl": "iRDJPM6N", "webHookId": "NgfWtAeG"}' \
    > test.out 2>&1
eval_tap $? 345 'TestPayPalConfig' test.out

#- 346 TestStripeConfig
./ng net.accelbyte.sdk.cli.Main platform testStripeConfig \
    --sandbox  \
    --body '{"allowedPaymentMethodTypes": ["WvGlPsON", "JhzZdr7Z", "CYxdAeOF"], "publishableKey": "bGSkPm7p", "secretKey": "auKYHVQD", "webhookSecret": "YMZAzzS4"}' \
    > test.out 2>&1
eval_tap $? 346 'TestStripeConfig' test.out

#- 347 TestWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfig \
    --body '{"appId": "aG5iU5KF", "key": "5Tum2IY3", "mchid": "WnzVjSin", "returnUrl": "jrTyn8U9"}' \
    > test.out 2>&1
eval_tap $? 347 'TestWxPayConfig' test.out

#- 348 TestXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfig \
    --body '{"apiKey": "ECVKaXBL", "flowCompletionUrl": "vh4cP7QR", "merchantId": 99, "projectId": 58, "projectSecretKey": "L4IInYpL"}' \
    > test.out 2>&1
eval_tap $? 348 'TestXsollaConfig' test.out

#- 349 GetPaymentMerchantConfig1
./ng net.accelbyte.sdk.cli.Main platform getPaymentMerchantConfig1 \
    --id 'IFdQo2Iw' \
    > test.out 2>&1
eval_tap $? 349 'GetPaymentMerchantConfig1' test.out

#- 350 UpdateAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform updateAdyenConfig \
    --id 'HrX6vi8c' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethods": ["KfJ4aPgS", "wnAvRTNt", "munuSNb6"], "apiKey": "4iWSasga", "authoriseAsCapture": true, "blockedPaymentMethods": ["bQFqdjV5", "OJPZ7J7q", "4jGLMLZV"], "clientKey": "skaivldm", "dropInSettings": "ekpZXEMi", "liveEndpointUrlPrefix": "WmRJ0QVL", "merchantAccount": "iizVtyLi", "notificationHmacKey": "lEFIyCPS", "notificationPassword": "BFcIFWv0", "notificationUsername": "ZVW4erne", "returnUrl": "CmPkoFtX", "settings": "8F4vjfyF"}' \
    > test.out 2>&1
eval_tap $? 350 'UpdateAdyenConfig' test.out

#- 351 TestAdyenConfigById
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfigById \
    --id 'USCpyqfQ' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 351 'TestAdyenConfigById' test.out

#- 352 UpdateAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateAliPayConfig \
    --id '0zy4sEKM' \
    --sandbox  \
    --validate  \
    --body '{"appId": "5gmPdMm2", "privateKey": "PZtx66Wa", "publicKey": "JbrJflgw", "returnUrl": "N1ghAFEj"}' \
    > test.out 2>&1
eval_tap $? 352 'UpdateAliPayConfig' test.out

#- 353 TestAliPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfigById \
    --id 'h7Fh9DCR' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 353 'TestAliPayConfigById' test.out

#- 354 UpdateCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform updateCheckoutConfig \
    --id '8frJjcx2' \
    --sandbox  \
    --validate  \
    --body '{"publicKey": "ez9ecUvk", "secretKey": "vAsNT3qh"}' \
    > test.out 2>&1
eval_tap $? 354 'UpdateCheckoutConfig' test.out

#- 355 TestCheckoutConfigById
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfigById \
    --id '0PhaPt6q' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 355 'TestCheckoutConfigById' test.out

#- 356 UpdateNeonPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateNeonPayConfig \
    --id '6XLYzDgA' \
    --sandbox  \
    --validate  \
    --body '{"apiKey": "OvrZIT6e", "webhookSecretKey": "yVqkJjOU"}' \
    > test.out 2>&1
eval_tap $? 356 'UpdateNeonPayConfig' test.out

#- 357 TestNeonPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testNeonPayConfigById \
    --id '6S4vb9ew' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 357 'TestNeonPayConfigById' test.out

#- 358 UpdatePayPalConfig
./ng net.accelbyte.sdk.cli.Main platform updatePayPalConfig \
    --id 'wWKlO6Mt' \
    --sandbox  \
    --validate  \
    --body '{"clientID": "aSN67ixj", "clientSecret": "oWf4YJ2w", "returnUrl": "jhHD4Cp9", "webHookId": "u4s8cPIK"}' \
    > test.out 2>&1
eval_tap $? 358 'UpdatePayPalConfig' test.out

#- 359 TestPayPalConfigById
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfigById \
    --id '9wD6DRAm' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 359 'TestPayPalConfigById' test.out

#- 360 UpdateStripeConfig
./ng net.accelbyte.sdk.cli.Main platform updateStripeConfig \
    --id 'Ie9tP55F' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethodTypes": ["Zlxy0AoC", "SdpoofPB", "ffROXQgI"], "publishableKey": "wpBpKpoP", "secretKey": "PrhJQ9ni", "webhookSecret": "UMUT4ccb"}' \
    > test.out 2>&1
eval_tap $? 360 'UpdateStripeConfig' test.out

#- 361 TestStripeConfigById
./ng net.accelbyte.sdk.cli.Main platform testStripeConfigById \
    --id 'eWUkWMZX' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 361 'TestStripeConfigById' test.out

#- 362 UpdateWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfig \
    --id 'z1xYfGv4' \
    --validate  \
    --body '{"appId": "tQ7OyaDl", "key": "PjVIcdeP", "mchid": "fcgRS5rH", "returnUrl": "ld3xSGcV"}' \
    > test.out 2>&1
eval_tap $? 362 'UpdateWxPayConfig' test.out

#- 363 UpdateWxPayConfigCert
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfigCert \
    --id 'yjDySdkp' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 363 'UpdateWxPayConfigCert' test.out

#- 364 TestWxPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfigById \
    --id 'IS5JOxt0' \
    > test.out 2>&1
eval_tap $? 364 'TestWxPayConfigById' test.out

#- 365 UpdateXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaConfig \
    --id 'kyHcuD6n' \
    --validate  \
    --body '{"apiKey": "CTll6gSY", "flowCompletionUrl": "r3itb5L0", "merchantId": 88, "projectId": 76, "projectSecretKey": "XL2Oc4hx"}' \
    > test.out 2>&1
eval_tap $? 365 'UpdateXsollaConfig' test.out

#- 366 TestXsollaConfigById
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfigById \
    --id '9vZxHP3f' \
    > test.out 2>&1
eval_tap $? 366 'TestXsollaConfigById' test.out

#- 367 UpdateXsollaUIConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaUIConfig \
    --id '4scDVAE4' \
    --body '{"device": "DESKTOP", "showCloseButton": false, "size": "MEDIUM", "theme": "DEFAULT_DARK"}' \
    > test.out 2>&1
eval_tap $? 367 'UpdateXsollaUIConfig' test.out

#- 368 QueryPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform queryPaymentProviderConfig \
    --limit '44' \
    --namespace "$AB_NAMESPACE" \
    --offset '85' \
    --region 'IaBaP3cB' \
    > test.out 2>&1
eval_tap $? 368 'QueryPaymentProviderConfig' test.out

#- 369 CreatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform createPaymentProviderConfig \
    --body '{"aggregate": "ADYEN", "namespace": "jx53ULZ0", "region": "XxNrf7y3", "sandboxTaxJarApiToken": "vPNCmNgh", "specials": ["ADYEN", "STRIPE", "WALLET"], "taxJarApiToken": "tLIU4qnn", "taxJarEnabled": false, "useGlobalTaxJarApiToken": false}' \
    > test.out 2>&1
eval_tap $? 369 'CreatePaymentProviderConfig' test.out

#- 370 GetAggregatePaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getAggregatePaymentProviders \
    > test.out 2>&1
eval_tap $? 370 'GetAggregatePaymentProviders' test.out

#- 371 DebugMatchedPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentProviderConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'OiWWIP4j' \
    > test.out 2>&1
eval_tap $? 371 'DebugMatchedPaymentProviderConfig' test.out

#- 372 GetSpecialPaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getSpecialPaymentProviders \
    > test.out 2>&1
eval_tap $? 372 'GetSpecialPaymentProviders' test.out

#- 373 UpdatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentProviderConfig \
    --id 'AfL2tovu' \
    --body '{"aggregate": "XSOLLA", "namespace": "Z52XEiLa", "region": "I9zYUuJ1", "sandboxTaxJarApiToken": "jECIovn5", "specials": ["STRIPE", "WALLET", "WXPAY"], "taxJarApiToken": "dFIu2K00", "taxJarEnabled": true, "useGlobalTaxJarApiToken": false}' \
    > test.out 2>&1
eval_tap $? 373 'UpdatePaymentProviderConfig' test.out

#- 374 DeletePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform deletePaymentProviderConfig \
    --id '2hCL5dpg' \
    > test.out 2>&1
eval_tap $? 374 'DeletePaymentProviderConfig' test.out

#- 375 GetPaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxConfig \
    > test.out 2>&1
eval_tap $? 375 'GetPaymentTaxConfig' test.out

#- 376 UpdatePaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentTaxConfig \
    --body '{"sandboxTaxJarApiToken": "WtkcDBl3", "taxJarApiToken": "kFIaxx9J", "taxJarEnabled": false, "taxJarProductCodesMapping": {"5lin4vHy": "7jBX98nu", "TEpWIQHi": "hATKZxjV", "zX5zuNkK": "Ia6SnbQS"}}' \
    > test.out 2>&1
eval_tap $? 376 'UpdatePaymentTaxConfig' test.out

#- 377 SyncPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform syncPaymentOrders \
    --nextEvaluatedKey '1NDlzGac' \
    --end '8ThE6kGi' \
    --start 'iHQhGKmk' \
    > test.out 2>&1
eval_tap $? 377 'SyncPaymentOrders' test.out

#- 378 PublicGetRootCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetRootCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'gvU2Jw7P' \
    --storeId 's1VFo6qo' \
    > test.out 2>&1
eval_tap $? 378 'PublicGetRootCategories' test.out

#- 379 DownloadCategories
./ng net.accelbyte.sdk.cli.Main platform downloadCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'levli6kJ' \
    --storeId 'gsaH3LgG' \
    > test.out 2>&1
eval_tap $? 379 'DownloadCategories' test.out

#- 380 PublicGetCategory
./ng net.accelbyte.sdk.cli.Main platform publicGetCategory \
    --categoryPath 'EbozDB4P' \
    --namespace "$AB_NAMESPACE" \
    --language '36KyLqzd' \
    --storeId 'XdEewDiw' \
    > test.out 2>&1
eval_tap $? 380 'PublicGetCategory' test.out

#- 381 PublicGetChildCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetChildCategories \
    --categoryPath 'EKQwHQ7h' \
    --namespace "$AB_NAMESPACE" \
    --language 'OImL4ivK' \
    --storeId 'DdqeKzb6' \
    > test.out 2>&1
eval_tap $? 381 'PublicGetChildCategories' test.out

#- 382 PublicGetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetDescendantCategories \
    --categoryPath 'yDYILRx1' \
    --namespace "$AB_NAMESPACE" \
    --language 'd5eeKLEA' \
    --storeId 'sLan1P8P' \
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
    --platform 'STADIA' \
    > test.out 2>&1
eval_tap $? 386 'GetIAPItemMapping' test.out

#- 387 PublicGetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --language 'epra4hvA' \
    --region 'eWZRhaI1' \
    --storeId 'XlJgasVR' \
    --appId 'Qc03iygW' \
    > test.out 2>&1
eval_tap $? 387 'PublicGetItemByAppId' test.out

#- 388 PublicQueryItems
./ng net.accelbyte.sdk.cli.Main platform publicQueryItems \
    --namespace "$AB_NAMESPACE" \
    --appType 'DLC' \
    --autoCalcEstimatedPrice  \
    --baseAppId 'kjpdYZPh' \
    --categoryPath '8R0WTM0z' \
    --features 'E4i9qo85' \
    --includeSubCategoryItem  \
    --itemType 'COINS' \
    --language 'l9FIzPSM' \
    --limit '46' \
    --offset '59' \
    --region 'wM8OZFJt' \
    --sortBy 'updatedAt:desc,name:desc,displayOrder' \
    --storeId 'rjOdiPBB' \
    --tags 'd2m1QcmU' \
    > test.out 2>&1
eval_tap $? 388 'PublicQueryItems' test.out

#- 389 PublicGetItemBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetItemBySku \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'hp0Ox9Zo' \
    --region '1fdt0PJm' \
    --storeId 'iEhXaSIk' \
    --sku 'wJlnVr0s' \
    > test.out 2>&1
eval_tap $? 389 'PublicGetItemBySku' test.out

#- 390 PublicGetEstimatedPrice
./ng net.accelbyte.sdk.cli.Main platform publicGetEstimatedPrice \
    --namespace "$AB_NAMESPACE" \
    --region 'ssQtHKB2' \
    --storeId '8HNz4oBd' \
    --itemIds 'kHWVo7P0' \
    > test.out 2>&1
eval_tap $? 390 'PublicGetEstimatedPrice' test.out

#- 391 PublicBulkGetItems
./ng net.accelbyte.sdk.cli.Main platform publicBulkGetItems \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language '512SbvjP' \
    --region 'dfnt51cw' \
    --storeId 'nm4YNrft' \
    --itemIds 'YgGV2Wgu' \
    > test.out 2>&1
eval_tap $? 391 'PublicBulkGetItems' test.out

#- 392 PublicValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform publicValidateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --body '{"itemIds": ["EAvDhLOe", "NBcx0VNo", "oJD99uxP"]}' \
    > test.out 2>&1
eval_tap $? 392 'PublicValidateItemPurchaseCondition' test.out

#- 393 PublicSearchItems
./ng net.accelbyte.sdk.cli.Main platform publicSearchItems \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --itemType 'MEDIA' \
    --limit '89' \
    --offset '88' \
    --region 'rDEKXWCc' \
    --storeId '5ZfuXRmu' \
    --keyword 'rOwv8zRs' \
    --language 'SQV8ORvG' \
    > test.out 2>&1
eval_tap $? 393 'PublicSearchItems' test.out

#- 394 PublicGetApp
./ng net.accelbyte.sdk.cli.Main platform publicGetApp \
    --itemId 'QmqqXqGK' \
    --namespace "$AB_NAMESPACE" \
    --language 'wG2KJwjE' \
    --region '9sNMkKvb' \
    --storeId 'zVKcioT5' \
    > test.out 2>&1
eval_tap $? 394 'PublicGetApp' test.out

#- 395 PublicGetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform publicGetItemDynamicData \
    --itemId 'UHvlZLih' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 395 'PublicGetItemDynamicData' test.out

#- 396 PublicGetItem
./ng net.accelbyte.sdk.cli.Main platform publicGetItem \
    --itemId 'iWeKhEgs' \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'lo9FOl45' \
    --populateBundle  \
    --region 'AM48Gqfx' \
    --storeId 'gKw4bCcX' \
    > test.out 2>&1
eval_tap $? 396 'PublicGetItem' test.out

#- 397 GetPaymentCustomization
eval_tap 0 397 'GetPaymentCustomization # SKIP deprecated' test.out

#- 398 PublicGetPaymentUrl
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentUrl \
    --namespace "$AB_NAMESPACE" \
    --body '{"neonPayConfig": {"cancelUrl": "MVMMN6U1", "successUrl": "7uP8cnqu"}, "paymentOrderNo": "mMP3mM2r", "paymentProvider": "PAYPAL", "returnUrl": "JR4Kk03H", "ui": "5ZcinORU", "zipCode": "ssyPAgiO"}' \
    > test.out 2>&1
eval_tap $? 398 'PublicGetPaymentUrl' test.out

#- 399 PublicGetPaymentMethods
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentMethods \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'Q9DEQDRa' \
    > test.out 2>&1
eval_tap $? 399 'PublicGetPaymentMethods' test.out

#- 400 PublicGetUnpaidPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUnpaidPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '52qRBD37' \
    > test.out 2>&1
eval_tap $? 400 'PublicGetUnpaidPaymentOrder' test.out

#- 401 Pay
./ng net.accelbyte.sdk.cli.Main platform pay \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'mbQ182ZO' \
    --paymentProvider 'NEONPAY' \
    --zipCode 'DXjxITZC' \
    --body '{"token": "xCXGPWfP"}' \
    > test.out 2>&1
eval_tap $? 401 'Pay' test.out

#- 402 PublicCheckPaymentOrderPaidStatus
./ng net.accelbyte.sdk.cli.Main platform publicCheckPaymentOrderPaidStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'bdgrjyxR' \
    > test.out 2>&1
eval_tap $? 402 'PublicCheckPaymentOrderPaidStatus' test.out

#- 403 GetPaymentPublicConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentPublicConfig \
    --namespace "$AB_NAMESPACE" \
    --sandbox  \
    --paymentProvider 'XSOLLA' \
    --region 'sVn55ICP' \
    > test.out 2>&1
eval_tap $? 403 'GetPaymentPublicConfig' test.out

#- 404 PublicGetQRCode
./ng net.accelbyte.sdk.cli.Main platform publicGetQRCode \
    --namespace "$AB_NAMESPACE" \
    --code '6eXtAGip' \
    > test.out 2>&1
eval_tap $? 404 'PublicGetQRCode' test.out

#- 405 PublicNormalizePaymentReturnUrl
./ng net.accelbyte.sdk.cli.Main platform publicNormalizePaymentReturnUrl \
    --namespace "$AB_NAMESPACE" \
    --payerID 'psiT8jKQ' \
    --foreinginvoice 'DTpjbbQj' \
    --invoiceId 'TjrZYFzw' \
    --payload 'YMdGvAVZ' \
    --redirectResult 'tqW0iSrN' \
    --resultCode 'i48VphdM' \
    --sessionId 'UjYi4vBI' \
    --status 'FUwpDQCE' \
    --token 'aNVS93hh' \
    --type 'iAiAKAOX' \
    --userId 'blwqTu5g' \
    --orderNo 'U3fBynKO' \
    --paymentOrderNo '4Jcd6idP' \
    --paymentProvider 'STRIPE' \
    --returnUrl 'OfGRZKTp' \
    > test.out 2>&1
eval_tap $? 405 'PublicNormalizePaymentReturnUrl' test.out

#- 406 GetPaymentTaxValue
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxValue \
    --namespace "$AB_NAMESPACE" \
    --zipCode 'ycwxfe9D' \
    --paymentOrderNo 'AgjVA5bj' \
    --paymentProvider 'WXPAY' \
    > test.out 2>&1
eval_tap $? 406 'GetPaymentTaxValue' test.out

#- 407 GetRewardByCode
./ng net.accelbyte.sdk.cli.Main platform getRewardByCode \
    --namespace "$AB_NAMESPACE" \
    --rewardCode 'bvPQu1QV' \
    > test.out 2>&1
eval_tap $? 407 'GetRewardByCode' test.out

#- 408 QueryRewards1
./ng net.accelbyte.sdk.cli.Main platform queryRewards1 \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'p8EPWNTJ' \
    --limit '90' \
    --offset '0' \
    --sortBy 'namespace,rewardCode:asc' \
    > test.out 2>&1
eval_tap $? 408 'QueryRewards1' test.out

#- 409 GetReward1
./ng net.accelbyte.sdk.cli.Main platform getReward1 \
    --namespace "$AB_NAMESPACE" \
    --rewardId '4kj8MEkq' \
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
    --appIds 'EP2glQwS,O3DPouHL,qMWA4ONI' \
    --itemIds '2vOLu3Bg,x5MxtjqJ,9bl7oSit' \
    --skus 'TiGN9v7p,Y1RvyFYQ,qRLlNuuJ' \
    > test.out 2>&1
eval_tap $? 411 'PublicExistsAnyMyActiveEntitlement' test.out

#- 412 PublicGetMyAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --appId 'rV19dfH1' \
    > test.out 2>&1
eval_tap $? 412 'PublicGetMyAppEntitlementOwnershipByAppId' test.out

#- 413 PublicGetMyEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'APP' \
    --itemId '1Yc1KNGz' \
    > test.out 2>&1
eval_tap $? 413 'PublicGetMyEntitlementOwnershipByItemId' test.out

#- 414 PublicGetMyEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'LOOTBOX' \
    --sku '9GEdLkic' \
    > test.out 2>&1
eval_tap $? 414 'PublicGetMyEntitlementOwnershipBySku' test.out

#- 415 PublicGetEntitlementOwnershipToken
./ng net.accelbyte.sdk.cli.Main platform publicGetEntitlementOwnershipToken \
    --namespace "$AB_NAMESPACE" \
    --appIds 'xSjE7XUV,RtGX5T4g,H9auaWyT' \
    --itemIds '8kLUIuZf,GF4yJKjV,YZ5sNoGW' \
    --skus 'nNdwnftg,r9mvSCfO,CViy3qCj' \
    > test.out 2>&1
eval_tap $? 415 'PublicGetEntitlementOwnershipToken' test.out

#- 416 SyncTwitchDropsEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement \
    --namespace "$AB_NAMESPACE" \
    --body '{"gameId": "Ke9MLJjL", "language": "piE-067", "region": "E1CGvzAE"}' \
    > test.out 2>&1
eval_tap $? 416 'SyncTwitchDropsEntitlement' test.out

#- 417 PublicGetMyWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetMyWallet \
    --currencyCode 'udSOT4ps' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 417 'PublicGetMyWallet' test.out

#- 418 SyncEpicGameDLC
./ng net.accelbyte.sdk.cli.Main platform syncEpicGameDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'bC8SBeXR' \
    --body '{"epicGamesJwtToken": "iNOAfI2K"}' \
    > test.out 2>&1
eval_tap $? 418 'SyncEpicGameDLC' test.out

#- 419 SyncOculusDLC
./ng net.accelbyte.sdk.cli.Main platform syncOculusDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'H6TnnQkN' \
    > test.out 2>&1
eval_tap $? 419 'SyncOculusDLC' test.out

#- 420 PublicSyncPsnDlcInventory
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'iqFqmBjk' \
    --body '{"serviceLabel": 68}' \
    > test.out 2>&1
eval_tap $? 420 'PublicSyncPsnDlcInventory' test.out

#- 421 PublicSyncPsnDlcInventoryWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventoryWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'nVkD1Bar' \
    --body '{"serviceLabels": [83, 100, 45]}' \
    > test.out 2>&1
eval_tap $? 421 'PublicSyncPsnDlcInventoryWithMultipleServiceLabels' test.out

#- 422 SyncSteamDLC
./ng net.accelbyte.sdk.cli.Main platform syncSteamDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ac2igWsL' \
    --body '{"appId": "FvMqadTb", "steamId": "TydgMJB6"}' \
    > test.out 2>&1
eval_tap $? 422 'SyncSteamDLC' test.out

#- 423 SyncXboxDLC
./ng net.accelbyte.sdk.cli.Main platform syncXboxDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'gNyI5zZY' \
    --body '{"xstsToken": "HgrLimAW"}' \
    > test.out 2>&1
eval_tap $? 423 'SyncXboxDLC' test.out

#- 424 PublicQueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'b6JBaKpH' \
    --appType 'DLC' \
    --entitlementClazz 'LOOTBOX' \
    --entitlementName 'w9VqP63R' \
    --features 'tkcCFOqg,iIN4vee5,2QvzFb1J' \
    --itemId 'F5pPIZ92,QZJ4a0zD,f4yIPNp1' \
    --limit '69' \
    --offset '99' \
    > test.out 2>&1
eval_tap $? 424 'PublicQueryUserEntitlements' test.out

#- 425 PublicGetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'u5QkgV4N' \
    --appId 'y968pAGP' \
    > test.out 2>&1
eval_tap $? 425 'PublicGetUserAppEntitlementByAppId' test.out

#- 426 PublicQueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId '1E74prEs' \
    --limit '40' \
    --offset '49' \
    --appType 'GAME' \
    > test.out 2>&1
eval_tap $? 426 'PublicQueryUserEntitlementsByAppType' test.out

#- 427 PublicGetUserEntitlementsByIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementsByIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'pJpmDMAD' \
    --availablePlatformOnly  \
    --ids 'zkDYIZKL,UBpMc5dJ,LXoRMhdN' \
    > test.out 2>&1
eval_tap $? 427 'PublicGetUserEntitlementsByIds' test.out

#- 428 PublicGetUserEntitlementByItemId
eval_tap 0 428 'PublicGetUserEntitlementByItemId # SKIP deprecated' test.out

#- 429 PublicGetUserEntitlementBySku
eval_tap 0 429 'PublicGetUserEntitlementBySku # SKIP deprecated' test.out

#- 430 PublicUserEntitlementHistory
./ng net.accelbyte.sdk.cli.Main platform publicUserEntitlementHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'j6t1lLAH' \
    --endDate 'mcsc3eDS' \
    --entitlementClazz 'APP' \
    --limit '61' \
    --offset '45' \
    --startDate 'pFCBm1Po' \
    > test.out 2>&1
eval_tap $? 430 'PublicUserEntitlementHistory' test.out

#- 431 PublicExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'Xcun4mGb' \
    --appIds 'I2BfnBfQ,GHeUdCeG,MT3II9lh' \
    --itemIds 'S4ICrFGY,1E51OZSm,Uudxq6Ut' \
    --skus 'Cy4xEttn,6vfPqsob,zFR6XPDU' \
    > test.out 2>&1
eval_tap $? 431 'PublicExistsAnyUserActiveEntitlement' test.out

#- 432 PublicGetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'p9GZxWmA' \
    --appId '0I2TDAtG' \
    > test.out 2>&1
eval_tap $? 432 'PublicGetUserAppEntitlementOwnershipByAppId' test.out

#- 433 PublicGetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'jqxnpGr2' \
    --entitlementClazz 'MEDIA' \
    --itemId 'imiQzSGk' \
    > test.out 2>&1
eval_tap $? 433 'PublicGetUserEntitlementOwnershipByItemId' test.out

#- 434 PublicGetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'V8eWvQRp' \
    --ids 'zSKqeWEy,AUrN1xKE,ZUQ7Z6Ys' \
    > test.out 2>&1
eval_tap $? 434 'PublicGetUserEntitlementOwnershipByItemIds' test.out

#- 435 PublicGetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'zonoZUS1' \
    --entitlementClazz 'OPTIONBOX' \
    --sku 'npMom0P6' \
    > test.out 2>&1
eval_tap $? 435 'PublicGetUserEntitlementOwnershipBySku' test.out

#- 436 PublicGetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlement \
    --entitlementId 'UAZamrko' \
    --namespace "$AB_NAMESPACE" \
    --userId 'cuccdzVG' \
    > test.out 2>&1
eval_tap $? 436 'PublicGetUserEntitlement' test.out

#- 437 PublicConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicConsumeUserEntitlement \
    --entitlementId '4xyArWAI' \
    --namespace "$AB_NAMESPACE" \
    --userId 'uMQgCLTK' \
    --body '{"metadata": {"operationSource": "INVENTORY"}, "options": ["IHjD33x1", "OiZ0hSaL", "TZ3NR03z"], "requestId": "2ILgHnv9", "useCount": 95}' \
    > test.out 2>&1
eval_tap $? 437 'PublicConsumeUserEntitlement' test.out

#- 438 PublicSellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicSellUserEntitlement \
    --entitlementId 'P3q0qfSm' \
    --namespace "$AB_NAMESPACE" \
    --userId 'iEbFrR07' \
    --body '{"requestId": "u00CTO2N", "useCount": 77}' \
    > test.out 2>&1
eval_tap $? 438 'PublicSellUserEntitlement' test.out

#- 439 PublicSplitUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicSplitUserEntitlement \
    --entitlementId 'cB77NGu4' \
    --namespace "$AB_NAMESPACE" \
    --userId 'xgmf9kgP' \
    --body '{"metadata": {"operationSource": "INVENTORY"}, "useCount": 100}' \
    > test.out 2>&1
eval_tap $? 439 'PublicSplitUserEntitlement' test.out

#- 440 PublicTransferUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicTransferUserEntitlement \
    --entitlementId 'OnEQY7Bf' \
    --namespace "$AB_NAMESPACE" \
    --userId 'iOhDlNb8' \
    --body '{"entitlementId": "avidAmW5", "metadata": {"operationSource": "INVENTORY"}, "useCount": 19}' \
    > test.out 2>&1
eval_tap $? 440 'PublicTransferUserEntitlement' test.out

#- 441 PublicRedeemCode
./ng net.accelbyte.sdk.cli.Main platform publicRedeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'kSz4f2qH' \
    --body '{"code": "gsRvH5tD", "language": "qcsJ-XgEQ", "region": "Sit4LA4i"}' \
    > test.out 2>&1
eval_tap $? 441 'PublicRedeemCode' test.out

#- 442 PublicFulfillAppleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillAppleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'kMmCinx4' \
    --body '{"excludeOldTransactions": false, "language": "MhK", "productId": "EvYQSZaZ", "receiptData": "vnzrfwC6", "region": "KJA03ngw", "transactionId": "jGGXomK8"}' \
    > test.out 2>&1
eval_tap $? 442 'PublicFulfillAppleIAPItem' test.out

#- 443 SyncEpicGamesInventory
./ng net.accelbyte.sdk.cli.Main platform syncEpicGamesInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'N7y1xR24' \
    --body '{"epicGamesJwtToken": "u9WFF0mT"}' \
    > test.out 2>&1
eval_tap $? 443 'SyncEpicGamesInventory' test.out

#- 444 PublicFulfillGoogleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillGoogleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'LElv3MIU' \
    --body '{"autoAck": true, "autoConsume": false, "language": "lo-NO", "orderId": "GXgLnKud", "packageName": "YMVP3uDq", "productId": "43jFefHH", "purchaseTime": 22, "purchaseToken": "BSGmoTXP", "region": "1aOWZfDw", "subscriptionPurchase": true}' \
    > test.out 2>&1
eval_tap $? 444 'PublicFulfillGoogleIAPItem' test.out

#- 445 SyncOculusConsumableEntitlements
./ng net.accelbyte.sdk.cli.Main platform syncOculusConsumableEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'aBaT7IFj' \
    > test.out 2>&1
eval_tap $? 445 'SyncOculusConsumableEntitlements' test.out

#- 446 PublicReconcilePlayStationStore
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStore \
    --namespace "$AB_NAMESPACE" \
    --userId 'hlY4Hmv7' \
    --body '{"currencyCode": "eoeA7NQm", "price": 0.7934824559629238, "productId": "OafZp4dj", "serviceLabel": 89}' \
    > test.out 2>&1
eval_tap $? 446 'PublicReconcilePlayStationStore' test.out

#- 447 PublicReconcilePlayStationStoreWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStoreWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'BvqGblNB' \
    --body '{"currencyCode": "CdPtK3fh", "price": 0.4477674677450083, "productId": "TKnccaUA", "serviceLabels": [56, 93, 78]}' \
    > test.out 2>&1
eval_tap $? 447 'PublicReconcilePlayStationStoreWithMultipleServiceLabels' test.out

#- 448 SyncSteamInventory
./ng net.accelbyte.sdk.cli.Main platform syncSteamInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'C8oe43Dv' \
    --body '{"appId": "Cax6lB6J", "currencyCode": "wAQpzeoe", "language": "xN_lFta", "price": 0.6502997503536692, "productId": "nIOm4xZ9", "region": "eoCASDI0", "steamId": "mApHprSe"}' \
    > test.out 2>&1
eval_tap $? 448 'SyncSteamInventory' test.out

#- 449 PublicQueryUserThirdPartySubscription
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserThirdPartySubscription \
    --namespace "$AB_NAMESPACE" \
    --platform 'STADIA' \
    --userId 'XJk5guMb' \
    --activeOnly  \
    --groupId 'EsxfN56l' \
    --limit '54' \
    --offset '81' \
    --productId '5EC4r8Oz' \
    > test.out 2>&1
eval_tap $? 449 'PublicQueryUserThirdPartySubscription' test.out

#- 450 SyncTwitchDropsEntitlement1
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'cEt5svF0' \
    --body '{"gameId": "QybXEX7K", "language": "rpA_dFpM", "region": "cK4Cw1Dl"}' \
    > test.out 2>&1
eval_tap $? 450 'SyncTwitchDropsEntitlement1' test.out

#- 451 SyncXboxInventory
./ng net.accelbyte.sdk.cli.Main platform syncXboxInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'iA5QDrFr' \
    --body '{"currencyCode": "HqDd7dK6", "price": 0.4201208736219737, "productId": "ilDByDjg", "xstsToken": "zeyDGa4i"}' \
    > test.out 2>&1
eval_tap $? 451 'SyncXboxInventory' test.out

#- 452 PublicQueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId '31tIM0LX' \
    --discounted  \
    --itemId 'HbcduOip' \
    --limit '69' \
    --offset '98' \
    --status 'FULFILLED' \
    > test.out 2>&1
eval_tap $? 452 'PublicQueryUserOrders' test.out

#- 453 PublicCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'ruvQ2Adc' \
    --body '{"currencyCode": "czQkkqC6", "discountCodes": ["nRWzcldL", "K7Q0NwP0", "LohBANqC"], "discountedPrice": 12, "ext": {"rFwku6Rm": {}, "iprAgzFc": {}, "E6eLfm5l": {}}, "itemId": "C1ke6ZPe", "language": "SeR", "price": 68, "quantity": 11, "region": "gJabbZiG", "returnUrl": "SWJNMz8h", "sectionId": "7cRFgoW9"}' \
    > test.out 2>&1
eval_tap $? 453 'PublicCreateUserOrder' test.out

#- 454 PublicPreviewOrderPrice
./ng net.accelbyte.sdk.cli.Main platform publicPreviewOrderPrice \
    --namespace "$AB_NAMESPACE" \
    --userId 'x1gfpcfM' \
    --body '{"currencyCode": "QhDpbvO4", "discountCodes": ["y190xYsU", "VCv8WOWj", "fTrzIpLu"], "discountedPrice": 93, "itemId": "dbacZYRd", "price": 13, "quantity": 81}' \
    > test.out 2>&1
eval_tap $? 454 'PublicPreviewOrderPrice' test.out

#- 455 PublicGetUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'cE1bQ2If' \
    --userId 'buWJ25Ld' \
    > test.out 2>&1
eval_tap $? 455 'PublicGetUserOrder' test.out

#- 456 PublicCancelUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCancelUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo '5mQNvF5S' \
    --userId 'ym4mcBDo' \
    > test.out 2>&1
eval_tap $? 456 'PublicCancelUserOrder' test.out

#- 457 PublicGetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'yJbjtptY' \
    --userId 'UoczQI2Z' \
    > test.out 2>&1
eval_tap $? 457 'PublicGetUserOrderHistories' test.out

#- 458 PublicDownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform publicDownloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'pHvoB4Es' \
    --userId 'wrbeou4k' \
    > test.out 2>&1
eval_tap $? 458 'PublicDownloadUserOrderReceipt' test.out

#- 459 PublicGetPaymentAccounts
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'NfUjPDn1' \
    > test.out 2>&1
eval_tap $? 459 'PublicGetPaymentAccounts' test.out

#- 460 PublicDeletePaymentAccount
./ng net.accelbyte.sdk.cli.Main platform publicDeletePaymentAccount \
    --id 'YLGEnyJO' \
    --namespace "$AB_NAMESPACE" \
    --type 'paypal' \
    --userId 'KhYyz4sc' \
    > test.out 2>&1
eval_tap $? 460 'PublicDeletePaymentAccount' test.out

#- 461 PublicListActiveSections
./ng net.accelbyte.sdk.cli.Main platform publicListActiveSections \
    --namespace "$AB_NAMESPACE" \
    --userId '8o4hnBDr' \
    --autoCalcEstimatedPrice  \
    --language 'dOROoES7' \
    --region '8kMXlHaj' \
    --storeId '2wUIKTO8' \
    --viewId 'nBT8HNFL' \
    > test.out 2>&1
eval_tap $? 461 'PublicListActiveSections' test.out

#- 462 PublicQueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId '28WxTzSm' \
    --chargeStatus 'SETUP' \
    --itemId 'VMQbMn8A' \
    --limit '64' \
    --offset '91' \
    --sku '1lYAtTW2' \
    --status 'INIT' \
    --subscribedBy 'USER' \
    > test.out 2>&1
eval_tap $? 462 'PublicQueryUserSubscriptions' test.out

#- 463 PublicSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform publicSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'gyFu4qKG' \
    --body '{"currencyCode": "qFkPom9k", "itemId": "KhOLtnAM", "language": "wap-drwl-697", "region": "90AQsAlQ", "returnUrl": "B49A5rYR", "source": "OAfNuQpb"}' \
    > test.out 2>&1
eval_tap $? 463 'PublicSubscribeSubscription' test.out

#- 464 PublicCheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform publicCheckUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'GAtXUKzd' \
    --itemId 'Dqv8jpRP' \
    > test.out 2>&1
eval_tap $? 464 'PublicCheckUserSubscriptionSubscribableByItemId' test.out

#- 465 PublicGetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'NXUUmbg4' \
    --userId 'aeTDmqoq' \
    > test.out 2>&1
eval_tap $? 465 'PublicGetUserSubscription' test.out

#- 466 PublicChangeSubscriptionBillingAccount
./ng net.accelbyte.sdk.cli.Main platform publicChangeSubscriptionBillingAccount \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'jlODBjGy' \
    --userId 'ZMxPeA6G' \
    > test.out 2>&1
eval_tap $? 466 'PublicChangeSubscriptionBillingAccount' test.out

#- 467 PublicCancelSubscription
./ng net.accelbyte.sdk.cli.Main platform publicCancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'ieBdiRwH' \
    --userId '0trwg1hn' \
    --body '{"immediate": false, "reason": "UtvLofGf"}' \
    > test.out 2>&1
eval_tap $? 467 'PublicCancelSubscription' test.out

#- 468 PublicGetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'CIf5JVv3' \
    --userId 'y9bTJEYu' \
    --excludeFree  \
    --limit '45' \
    --offset '70' \
    > test.out 2>&1
eval_tap $? 468 'PublicGetUserSubscriptionBillingHistories' test.out

#- 469 PublicListViews
./ng net.accelbyte.sdk.cli.Main platform publicListViews \
    --namespace "$AB_NAMESPACE" \
    --userId 'OuPfjMPK' \
    --language 'HH2F0j5O' \
    --storeId 'DPsyOQR3' \
    > test.out 2>&1
eval_tap $? 469 'PublicListViews' test.out

#- 470 PublicGetWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetWallet \
    --currencyCode 'nvkX9brP' \
    --namespace "$AB_NAMESPACE" \
    --userId 'DpAmtqU3' \
    > test.out 2>&1
eval_tap $? 470 'PublicGetWallet' test.out

#- 471 PublicListUserWalletTransactions
./ng net.accelbyte.sdk.cli.Main platform publicListUserWalletTransactions \
    --currencyCode 'VVksOVFr' \
    --namespace "$AB_NAMESPACE" \
    --userId 'flGi7jod' \
    --limit '70' \
    --offset '25' \
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
    --endTime '29H91omI' \
    --limit '62' \
    --offset '0' \
    --startTime 'IKKuaMg3' \
    --state 'REVOKE_FAILED' \
    --transactionId 'C0B0iO71' \
    --userId 'qB72x0fB' \
    > test.out 2>&1
eval_tap $? 473 'QueryFulfillments' test.out

#- 474 QueryItemsV2
./ng net.accelbyte.sdk.cli.Main platform queryItemsV2 \
    --namespace "$AB_NAMESPACE" \
    --appType 'SOFTWARE' \
    --availableDate 'IUlvvwW7' \
    --baseAppId '5tGwftrV' \
    --categoryPath 'rLzNyWKq' \
    --features 'KIGE9Dzn' \
    --includeSubCategoryItem  \
    --itemName '6KDhJ7f4' \
    --itemStatus 'ACTIVE' \
    --itemType 'COINS,CODE,MEDIA' \
    --limit '83' \
    --offset '42' \
    --region 'qsPJnEEj' \
    --sectionExclusive  \
    --sortBy 'createdAt:desc,updatedAt' \
    --storeId '649HmPWH' \
    --tags '7OBXlMcC' \
    --targetNamespace 'vSp3qUAn' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 474 'QueryItemsV2' test.out

#- 475 ImportStore1
./ng net.accelbyte.sdk.cli.Main platform importStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'xAYOCne3' \
    --strictMode  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 475 'ImportStore1' test.out

#- 476 ExportStore1
./ng net.accelbyte.sdk.cli.Main platform exportStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'sxaKuC46' \
    --body '{"itemIds": ["nSiPV1jx", "sQg3LEaJ", "viIoJEeI"]}' \
    > test.out 2>&1
eval_tap $? 476 'ExportStore1' test.out

#- 477 FulfillRewardsV2
./ng net.accelbyte.sdk.cli.Main platform fulfillRewardsV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'OqfygDEz' \
    --body '{"entitlementCollectionId": "YiOBIEal", "entitlementOrigin": "Epic", "metadata": {"o4A06K2K": {}, "CM2eAAC4": {}, "EOLQfNlW": {}}, "origin": "Epic", "rewards": [{"currency": {"currencyCode": "fAWhxApI", "namespace": "kEp7Pap5"}, "item": {"itemId": "0Ba1bnHD", "itemName": "JYgZt33z", "itemSku": "p9BAcyin", "itemType": "Hc4plTFF"}, "quantity": 0, "type": "CURRENCY"}, {"currency": {"currencyCode": "F9Cn5jN0", "namespace": "IjPyavwG"}, "item": {"itemId": "wpGLXzVD", "itemName": "mZj1QwX8", "itemSku": "WH9CbJhm", "itemType": "XT0W9lr6"}, "quantity": 16, "type": "ITEM"}, {"currency": {"currencyCode": "0mjczTFU", "namespace": "YnmQ9EZ2"}, "item": {"itemId": "WYdRCDIl", "itemName": "05L3lHgT", "itemSku": "EfHlmtyx", "itemType": "vH6SwuoX"}, "quantity": 18, "type": "CURRENCY"}], "source": "PROMOTION", "transactionId": "jAB4JrSy"}' \
    > test.out 2>&1
eval_tap $? 477 'FulfillRewardsV2' test.out

#- 478 FulfillItems
eval_tap 0 478 'FulfillItems # SKIP deprecated' test.out

#- 479 RetryFulfillItems
eval_tap 0 479 'RetryFulfillItems # SKIP deprecated' test.out

#- 480 RevokeItems
eval_tap 0 480 'RevokeItems # SKIP deprecated' test.out

#- 481 V2PublicFulfillAppleIAPItem
./ng net.accelbyte.sdk.cli.Main platform v2PublicFulfillAppleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'gn3pxItF' \
    --body '{"transactionId": "WKX3bNt2"}' \
    > test.out 2>&1
eval_tap $? 481 'V2PublicFulfillAppleIAPItem' test.out

#- 482 FulfillItemsV3
./ng net.accelbyte.sdk.cli.Main platform fulfillItemsV3 \
    --namespace "$AB_NAMESPACE" \
    --transactionId 'nayNNzpb' \
    --userId 'lGje29Me' \
    --body '{"items": [{"duration": 52, "endDate": "1994-11-04T00:00:00Z", "entitlementCollectionId": "63fUk6pQ", "entitlementOrigin": "Xbox", "itemId": "vyCUcU0r", "itemSku": "0trifWXl", "language": "Hxctt1gp", "metadata": {"xXxyniXQ": {}, "RQE7WERK": {}, "SKhTzQez": {}}, "orderNo": "64hEKpLW", "origin": "Epic", "quantity": 95, "region": "rzaD5VrC", "source": "GIFT", "startDate": "1974-06-08T00:00:00Z", "storeId": "xjvrrS69"}, {"duration": 58, "endDate": "1996-01-12T00:00:00Z", "entitlementCollectionId": "0imB4tK6", "entitlementOrigin": "Playstation", "itemId": "J2wfjYFi", "itemSku": "V6Ib2YjD", "language": "buv2OBN7", "metadata": {"68gLliUd": {}, "DTv8AG1R": {}, "Kldr6kDK": {}}, "orderNo": "Ix4SitYA", "origin": "Oculus", "quantity": 46, "region": "3FnkYfk9", "source": "EXPIRATION", "startDate": "1975-01-18T00:00:00Z", "storeId": "YLMfogMF"}, {"duration": 81, "endDate": "1992-07-20T00:00:00Z", "entitlementCollectionId": "jsLYPaHB", "entitlementOrigin": "Epic", "itemId": "d5w8wfZn", "itemSku": "gj0RriPA", "language": "sjFAxMD2", "metadata": {"LWnTwUv9": {}, "Fylo12Pc": {}, "I8m6cEWG": {}}, "orderNo": "JaXDuF9E", "origin": "Twitch", "quantity": 50, "region": "4t1k4Dpw", "source": "PAYMENT", "startDate": "1991-01-04T00:00:00Z", "storeId": "gtXe4jif"}]}' \
    > test.out 2>&1
eval_tap $? 482 'FulfillItemsV3' test.out

#- 483 RetryFulfillItemsV3
./ng net.accelbyte.sdk.cli.Main platform retryFulfillItemsV3 \
    --namespace "$AB_NAMESPACE" \
    --transactionId 'OAHgpaVe' \
    --userId 'NQZAZYFn' \
    > test.out 2>&1
eval_tap $? 483 'RetryFulfillItemsV3' test.out

#- 484 RevokeItemsV3
./ng net.accelbyte.sdk.cli.Main platform revokeItemsV3 \
    --namespace "$AB_NAMESPACE" \
    --transactionId '6CmBlv2f' \
    --userId 'xco2qSKh' \
    > test.out 2>&1
eval_tap $? 484 'RevokeItemsV3' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
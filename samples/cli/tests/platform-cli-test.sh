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
echo "1..509"

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
    --id 'VTHeFrdf' \
    > test.out 2>&1
eval_tap $? 3 'GetFulfillmentScript' test.out

#- 4 CreateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform createFulfillmentScript \
    --id 'dppNGSsV' \
    --body '{"grantDays": "IIQ7u1gI"}' \
    > test.out 2>&1
eval_tap $? 4 'CreateFulfillmentScript' test.out

#- 5 DeleteFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform deleteFulfillmentScript \
    --id 'nlH0wYCq' \
    > test.out 2>&1
eval_tap $? 5 'DeleteFulfillmentScript' test.out

#- 6 UpdateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform updateFulfillmentScript \
    --id 'Hy5Ow0YM' \
    --body '{"grantDays": "mQmYdjHg"}' \
    > test.out 2>&1
eval_tap $? 6 'UpdateFulfillmentScript' test.out

#- 7 ListItemTypeConfigs
./ng net.accelbyte.sdk.cli.Main platform listItemTypeConfigs \
    > test.out 2>&1
eval_tap $? 7 'ListItemTypeConfigs' test.out

#- 8 CreateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform createItemTypeConfig \
    --body '{"clazz": "5TiDOzMy", "dryRun": false, "fulfillmentUrl": "MdZsng7M", "itemType": "MEDIA", "purchaseConditionUrl": "Iw1y0a1P"}' \
    > test.out 2>&1
eval_tap $? 8 'CreateItemTypeConfig' test.out

#- 9 SearchItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform searchItemTypeConfig \
    --clazz 'LdGsbUHT' \
    --itemType 'OPTIONBOX' \
    > test.out 2>&1
eval_tap $? 9 'SearchItemTypeConfig' test.out

#- 10 GetItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform getItemTypeConfig \
    --id 'V9FszlJD' \
    > test.out 2>&1
eval_tap $? 10 'GetItemTypeConfig' test.out

#- 11 UpdateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform updateItemTypeConfig \
    --id 'ckAPnNx9' \
    --body '{"clazz": "3r4cYIMQ", "dryRun": true, "fulfillmentUrl": "DRKnZj2K", "purchaseConditionUrl": "3221PjjL"}' \
    > test.out 2>&1
eval_tap $? 11 'UpdateItemTypeConfig' test.out

#- 12 DeleteItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform deleteItemTypeConfig \
    --id 'mECMm61B' \
    > test.out 2>&1
eval_tap $? 12 'DeleteItemTypeConfig' test.out

#- 13 QueryCampaigns
./ng net.accelbyte.sdk.cli.Main platform queryCampaigns \
    --namespace "$AB_NAMESPACE" \
    --limit '17' \
    --name 'KfC4bpVC' \
    --offset '9' \
    --tag '4cZZnnhk' \
    > test.out 2>&1
eval_tap $? 13 'QueryCampaigns' test.out

#- 14 CreateCampaign
./ng net.accelbyte.sdk.cli.Main platform createCampaign \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "NvE4oBeK", "discountConfig": {"categories": [{"categoryPath": "OOFOpMpQ", "includeSubCategories": true}, {"categoryPath": "kD4biqg7", "includeSubCategories": false}, {"categoryPath": "KM4DLAl8", "includeSubCategories": true}], "currencyCode": "oKcvBAIS", "currencyNamespace": "OayKkrWW", "discountAmount": 57, "discountPercentage": 27, "discountType": "AMOUNT", "items": [{"itemId": "TnlQljGu", "itemName": "GFG2QJRm"}, {"itemId": "yLWn8K1L", "itemName": "lddSlTEk"}, {"itemId": "BSfq8YQx", "itemName": "mo48dbuc"}], "restrictType": "NONE", "stackable": true}, "items": [{"extraSubscriptionDays": 86, "itemId": "Et91CvjB", "itemName": "T8aNPhHc", "quantity": 59}, {"extraSubscriptionDays": 96, "itemId": "UMMfremq", "itemName": "IDZ0JviY", "quantity": 41}, {"extraSubscriptionDays": 92, "itemId": "PGQvvewl", "itemName": "A8wcvyHN", "quantity": 23}], "maxRedeemCountPerCampaignPerUser": 21, "maxRedeemCountPerCode": 93, "maxRedeemCountPerCodePerUser": 45, "maxSaleCount": 57, "name": "HZrS8z9o", "redeemEnd": "1977-08-23T00:00:00Z", "redeemStart": "1986-09-22T00:00:00Z", "redeemType": "ITEM", "status": "INACTIVE", "tags": ["b1tJywL1", "NJnY73pB", "s0Mb1Uqz"], "type": "REDEMPTION"}' \
    > test.out 2>&1
eval_tap $? 14 'CreateCampaign' test.out

#- 15 GetCampaign
./ng net.accelbyte.sdk.cli.Main platform getCampaign \
    --campaignId 'Xm2gJh7v' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'GetCampaign' test.out

#- 16 UpdateCampaign
./ng net.accelbyte.sdk.cli.Main platform updateCampaign \
    --campaignId 'V8N0N5qL' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "V9GgpArd", "discountConfig": {"categories": [{"categoryPath": "9ItzrYht", "includeSubCategories": true}, {"categoryPath": "5I6V5duz", "includeSubCategories": true}, {"categoryPath": "BnpjYQ26", "includeSubCategories": true}], "currencyCode": "2KXBgIFH", "currencyNamespace": "H4447gDz", "discountAmount": 9, "discountPercentage": 49, "discountType": "AMOUNT", "items": [{"itemId": "R47kUM4e", "itemName": "cegZJRuE"}, {"itemId": "QGTWOjeU", "itemName": "zHYX50QU"}, {"itemId": "6PbmjyTb", "itemName": "Q1lG0X0X"}], "restrictType": "NONE", "stackable": false}, "items": [{"extraSubscriptionDays": 74, "itemId": "NPytHYCx", "itemName": "qjdp4u0P", "quantity": 38}, {"extraSubscriptionDays": 87, "itemId": "sxJ7JM5j", "itemName": "T0xW3SKu", "quantity": 34}, {"extraSubscriptionDays": 27, "itemId": "TddBRkAP", "itemName": "Eww65zuM", "quantity": 7}], "maxRedeemCountPerCampaignPerUser": 89, "maxRedeemCountPerCode": 17, "maxRedeemCountPerCodePerUser": 80, "maxSaleCount": 23, "name": "vpu7i5Kc", "redeemEnd": "1992-06-19T00:00:00Z", "redeemStart": "1978-03-01T00:00:00Z", "redeemType": "DISCOUNT", "status": "ACTIVE", "tags": ["vGP7cSeS", "saOrh6HP", "ElT8Rwye"]}' \
    > test.out 2>&1
eval_tap $? 16 'UpdateCampaign' test.out

#- 17 RenameBatch
./ng net.accelbyte.sdk.cli.Main platform renameBatch \
    --campaignId 'qoZYPw8L' \
    --namespace "$AB_NAMESPACE" \
    --body '{"newName": "OXT1p9qy", "oldName": "N7OqmDOL"}' \
    > test.out 2>&1
eval_tap $? 17 'RenameBatch' test.out

#- 18 QueryCampaignBatchNames
./ng net.accelbyte.sdk.cli.Main platform queryCampaignBatchNames \
    --campaignId '06jLyuu9' \
    --namespace "$AB_NAMESPACE" \
    --batchName 'jIFrLmvg' \
    --limit '58' \
    > test.out 2>&1
eval_tap $? 18 'QueryCampaignBatchNames' test.out

#- 19 GetCampaignDynamic
./ng net.accelbyte.sdk.cli.Main platform getCampaignDynamic \
    --campaignId 'JFz91Edd' \
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
    --body '{"enableInventoryCheck": true, "itemDeletionCheckConfig": ["REWARD", "CAMPAIGN", "CATALOG"]}' \
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
    --body '{"appConfig": {"appName": "eAfnbqSs"}, "customConfig": {"connectionType": "TLS", "grpcServerAddress": "TrAiBlnt"}, "extendType": "CUSTOM"}' \
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
    --body '{"appConfig": {"appName": "Z6rsiv97"}, "customConfig": {"connectionType": "INSECURE", "grpcServerAddress": "u8FrCncU"}, "extendType": "APP"}' \
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
    --storeId 'PAgDNHUW' \
    > test.out 2>&1
eval_tap $? 31 'GetRootCategories' test.out

#- 32 CreateCategory
./ng net.accelbyte.sdk.cli.Main platform createCategory \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Xx1GsycN' \
    --body '{"categoryPath": "avuVM8Rq", "localizationDisplayNames": {"2S5jSapz": "jj1oFon7", "eEj878l6": "D2JqtPYF", "IcAW0A8m": "Rm63p5tD"}}' \
    > test.out 2>&1
eval_tap $? 32 'CreateCategory' test.out

#- 33 ListCategoriesBasic
./ng net.accelbyte.sdk.cli.Main platform listCategoriesBasic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'xv9hwlbM' \
    > test.out 2>&1
eval_tap $? 33 'ListCategoriesBasic' test.out

#- 34 GetCategory
./ng net.accelbyte.sdk.cli.Main platform getCategory \
    --categoryPath 'oGDkDUHk' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'bGayxqfm' \
    > test.out 2>&1
eval_tap $? 34 'GetCategory' test.out

#- 35 UpdateCategory
./ng net.accelbyte.sdk.cli.Main platform updateCategory \
    --categoryPath 'UQsmRkSx' \
    --namespace "$AB_NAMESPACE" \
    --storeId '3MLovoGW' \
    --body '{"localizationDisplayNames": {"ZoigMHNq": "xxyXYUai", "7XAErmpT": "DXpIXHa5", "lVGjjq7S": "s6QrK1iR"}}' \
    > test.out 2>&1
eval_tap $? 35 'UpdateCategory' test.out

#- 36 DeleteCategory
./ng net.accelbyte.sdk.cli.Main platform deleteCategory \
    --categoryPath 'UOyO65j2' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'MfxkHCZk' \
    > test.out 2>&1
eval_tap $? 36 'DeleteCategory' test.out

#- 37 GetChildCategories
./ng net.accelbyte.sdk.cli.Main platform getChildCategories \
    --categoryPath 'u3MzM6YL' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'pHpolkAV' \
    > test.out 2>&1
eval_tap $? 37 'GetChildCategories' test.out

#- 38 GetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform getDescendantCategories \
    --categoryPath '4ZL3iUah' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'oKnm4LdO' \
    > test.out 2>&1
eval_tap $? 38 'GetDescendantCategories' test.out

#- 39 QueryCodes
./ng net.accelbyte.sdk.cli.Main platform queryCodes \
    --campaignId 'JToBInAO' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --batchName 'lPAdphk5' \
    --batchNo '1,79,42' \
    --code 'L4qzRbr9' \
    --limit '26' \
    --offset '25' \
    --withBatchName  \
    > test.out 2>&1
eval_tap $? 39 'QueryCodes' test.out

#- 40 CreateCodes
./ng net.accelbyte.sdk.cli.Main platform createCodes \
    --campaignId 'G5Aq3dNV' \
    --namespace "$AB_NAMESPACE" \
    --body '{"batchName": "Vayio9Oc", "codeValue": "ExvxtBZh", "quantity": 3}' \
    > test.out 2>&1
eval_tap $? 40 'CreateCodes' test.out

#- 41 Download
./ng net.accelbyte.sdk.cli.Main platform download \
    --campaignId 'DDeJraN5' \
    --namespace "$AB_NAMESPACE" \
    --batchName 'NJofE6CV' \
    --batchNo '48,34,11' \
    --withBatchName  \
    > test.out 2>&1
eval_tap $? 41 'Download' test.out

#- 42 BulkDisableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkDisableCodes \
    --campaignId 'pgANNhqm' \
    --namespace "$AB_NAMESPACE" \
    --batchName 'rhad1dF0' \
    --batchNo '34,68,45' \
    > test.out 2>&1
eval_tap $? 42 'BulkDisableCodes' test.out

#- 43 BulkEnableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkEnableCodes \
    --campaignId 'lffD56RD' \
    --namespace "$AB_NAMESPACE" \
    --batchName 'TCPzsZ9U' \
    --batchNo '44,81,95' \
    > test.out 2>&1
eval_tap $? 43 'BulkEnableCodes' test.out

#- 44 QueryRedeemHistory
./ng net.accelbyte.sdk.cli.Main platform queryRedeemHistory \
    --campaignId 'zqBH3LSk' \
    --namespace "$AB_NAMESPACE" \
    --code '6h8gfqe5' \
    --limit '36' \
    --offset '98' \
    --userId 'lE7TuYKo' \
    > test.out 2>&1
eval_tap $? 44 'QueryRedeemHistory' test.out

#- 45 GetCode
./ng net.accelbyte.sdk.cli.Main platform getCode \
    --code 'YiRpG8JK' \
    --namespace "$AB_NAMESPACE" \
    --redeemable  \
    --withBatchName  \
    > test.out 2>&1
eval_tap $? 45 'GetCode' test.out

#- 46 DisableCode
./ng net.accelbyte.sdk.cli.Main platform disableCode \
    --code 'LJjobKvn' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 46 'DisableCode' test.out

#- 47 EnableCode
./ng net.accelbyte.sdk.cli.Main platform enableCode \
    --code 'zxzG2wRS' \
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
    --currencyType 'REAL' \
    > test.out 2>&1
eval_tap $? 51 'ListCurrencies' test.out

#- 52 CreateCurrency
./ng net.accelbyte.sdk.cli.Main platform createCurrency \
    --namespace "$AB_NAMESPACE" \
    --body '{"currencyCode": "XUHtCFNg", "currencySymbol": "lQPtteXe", "currencyType": "VIRTUAL", "decimals": 2, "localizationDescriptions": {"7iV8dgfP": "lAohL8Zy", "QcvnLdrr": "Nt0Yl3ek", "lLVXyjPG": "GFA90E8F"}}' \
    > test.out 2>&1
eval_tap $? 52 'CreateCurrency' test.out

#- 53 UpdateCurrency
./ng net.accelbyte.sdk.cli.Main platform updateCurrency \
    --currencyCode 'Px3Ku4fG' \
    --namespace "$AB_NAMESPACE" \
    --body '{"localizationDescriptions": {"UtpRejBY": "8o1F2Mv5", "WwITcv8Y": "zHLFZy4S", "4BkLIUEt": "22PXtXx3"}}' \
    > test.out 2>&1
eval_tap $? 53 'UpdateCurrency' test.out

#- 54 DeleteCurrency
./ng net.accelbyte.sdk.cli.Main platform deleteCurrency \
    --currencyCode '9Yrds2A7' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 54 'DeleteCurrency' test.out

#- 55 GetCurrencyConfig
./ng net.accelbyte.sdk.cli.Main platform getCurrencyConfig \
    --currencyCode 'DXa9lMEg' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 55 'GetCurrencyConfig' test.out

#- 56 GetCurrencySummary
./ng net.accelbyte.sdk.cli.Main platform getCurrencySummary \
    --currencyCode 'tJVSNKCV' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 56 'GetCurrencySummary' test.out

#- 57 GetDLCItemConfigHistory
./ng net.accelbyte.sdk.cli.Main platform getDLCItemConfigHistory \
    --namespace "$AB_NAMESPACE" \
    --dlcId '8Kyz65eb' \
    > test.out 2>&1
eval_tap $? 57 'GetDLCItemConfigHistory' test.out

#- 58 RestoreDLCItemConfigHistory
./ng net.accelbyte.sdk.cli.Main platform restoreDLCItemConfigHistory \
    --id 'qPLHK8xf' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 58 'RestoreDLCItemConfigHistory' test.out

#- 59 GetDLCItemConfig
./ng net.accelbyte.sdk.cli.Main platform getDLCItemConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 59 'GetDLCItemConfig' test.out

#- 60 UpdateDLCItemConfig
./ng net.accelbyte.sdk.cli.Main platform updateDLCItemConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"autoUpdate": true, "enableRevocation": false, "id": "NzDbrSFr", "rewards": [{"currency": {"currencyCode": "j6v8yggC", "namespace": "PGqmU4ps"}, "item": {"itemId": "wI4geFkU", "itemName": "WL8vyFlq", "itemSku": "oyxzwzJB", "itemType": "QToGtQIf"}, "quantity": 25, "type": "CURRENCY"}, {"currency": {"currencyCode": "N5IqnY7c", "namespace": "FNe3zdCz"}, "item": {"itemId": "mXQFMvQu", "itemName": "YpHW00eO", "itemSku": "jPZFXg3N", "itemType": "kabqYO6W"}, "quantity": 21, "type": "ITEM"}, {"currency": {"currencyCode": "9dlFOd2L", "namespace": "Ojw5HJTg"}, "item": {"itemId": "Gzjl2dIu", "itemName": "hmLhQwFt", "itemSku": "hfWObZWe", "itemType": "w41bijZ8"}, "quantity": 83, "type": "CURRENCY"}], "rvn": 16}, {"autoUpdate": true, "enableRevocation": true, "id": "8T5Kv5nZ", "rewards": [{"currency": {"currencyCode": "SK2RhySD", "namespace": "nNLlfSVg"}, "item": {"itemId": "kDTVLXpF", "itemName": "NfAq8yw8", "itemSku": "cDuNO3Bh", "itemType": "EbhgW2rz"}, "quantity": 39, "type": "ITEM"}, {"currency": {"currencyCode": "CewaSRCu", "namespace": "VRqyhrYq"}, "item": {"itemId": "ODfCMVqy", "itemName": "rvMIGTKn", "itemSku": "K6ayqks1", "itemType": "6vD7symK"}, "quantity": 57, "type": "CURRENCY"}, {"currency": {"currencyCode": "HttN5Jw0", "namespace": "T6LTwt1p"}, "item": {"itemId": "qnhvF4YQ", "itemName": "pfrkWvzT", "itemSku": "4pbOChsI", "itemType": "Lhzc0D2l"}, "quantity": 77, "type": "ITEM"}], "rvn": 82}, {"autoUpdate": false, "enableRevocation": true, "id": "QqAiuL7W", "rewards": [{"currency": {"currencyCode": "6OCpSIhO", "namespace": "gIoOr0Qr"}, "item": {"itemId": "Hr9WxzHk", "itemName": "gM262gK4", "itemSku": "npbrGQRT", "itemType": "cYyXczVG"}, "quantity": 68, "type": "CURRENCY"}, {"currency": {"currencyCode": "qPsBXJ0w", "namespace": "VnQ8fYwC"}, "item": {"itemId": "uZ0mRk2q", "itemName": "cOyBZnI6", "itemSku": "cw4538Fk", "itemType": "sDkmzS1y"}, "quantity": 80, "type": "CURRENCY"}, {"currency": {"currencyCode": "cA2JmEht", "namespace": "jPFrA5Ok"}, "item": {"itemId": "cjFXQmDo", "itemName": "pFZoUyXT", "itemSku": "3DERz2eV", "itemType": "eS2QoVoq"}, "quantity": 22, "type": "ITEM"}], "rvn": 68}]}' \
    > test.out 2>&1
eval_tap $? 60 'UpdateDLCItemConfig' test.out

#- 61 DeleteDLCItemConfig
./ng net.accelbyte.sdk.cli.Main platform deleteDLCItemConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 61 'DeleteDLCItemConfig' test.out

#- 62 GetPlatformDLCConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformDLCConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 62 'GetPlatformDLCConfig' test.out

#- 63 UpdatePlatformDLCConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformDLCConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"platform": "PSN", "platformDlcIdMap": {"oYjl98hn": "wcF3oktU", "cKAlO3od": "w01kZvWH", "Gh8VBHaD": "F1ZGS50P"}}, {"platform": "EPICGAMES", "platformDlcIdMap": {"LiNPt82A": "cShVgLb9", "pZRon9FL": "HoiQ8AbQ", "jtcjD945": "NfTYTgfM"}}, {"platform": "OCULUS", "platformDlcIdMap": {"C1BzUVTS": "G4fQSrmL", "Dn5qhsnG": "Pf3bNlew", "4LzsneQs": "N66LPn1K"}}]}' \
    > test.out 2>&1
eval_tap $? 63 'UpdatePlatformDLCConfig' test.out

#- 64 DeletePlatformDLCConfig
./ng net.accelbyte.sdk.cli.Main platform deletePlatformDLCConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 64 'DeletePlatformDLCConfig' test.out

#- 65 QueryEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryEntitlements \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --appType 'SOFTWARE' \
    --entitlementClazz 'LOOTBOX' \
    --entitlementName 'PNjJeKYD' \
    --itemId 'it6EtdRx,WeWGy2gW,winkTmnq' \
    --limit '34' \
    --offset '28' \
    --origin 'System' \
    --userId 'wOMJ7oSi' \
    > test.out 2>&1
eval_tap $? 65 'QueryEntitlements' test.out

#- 66 QueryEntitlementsByItemIds
./ng net.accelbyte.sdk.cli.Main platform queryEntitlementsByItemIds \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemIds '4RPU5lKS,4xKW9uYJ,FvSz9xhB' \
    --limit '35' \
    --offset '50' \
    > test.out 2>&1
eval_tap $? 66 'QueryEntitlementsByItemIds' test.out

#- 67 EnableEntitlementOriginFeature
./ng net.accelbyte.sdk.cli.Main platform enableEntitlementOriginFeature \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 67 'EnableEntitlementOriginFeature' test.out

#- 68 GetEntitlementConfigInfo
./ng net.accelbyte.sdk.cli.Main platform getEntitlementConfigInfo \
    --namespace "$AB_NAMESPACE" \
    --withoutCache  \
    > test.out 2>&1
eval_tap $? 68 'GetEntitlementConfigInfo' test.out

#- 69 GrantEntitlements
./ng net.accelbyte.sdk.cli.Main platform grantEntitlements \
    --namespace "$AB_NAMESPACE" \
    --body '{"entitlementGrantList": [{"collectionId": "alasEGrz", "endDate": "1986-07-11T00:00:00Z", "grantedCode": "BppnJPNC", "itemId": "aaYcAqJE", "itemNamespace": "6CWzc0A7", "language": "YOI_ZOYY", "metadata": {"HZwvUex7": {}, "aQeltvxS": {}, "maabtnnl": {}}, "origin": "Twitch", "quantity": 20, "region": "Hk71wYDd", "source": "IAP", "startDate": "1999-03-02T00:00:00Z", "storeId": "Lm288Pys"}, {"collectionId": "XYE6CdAX", "endDate": "1997-08-12T00:00:00Z", "grantedCode": "QiPA6F4W", "itemId": "a3ODDK9r", "itemNamespace": "l4ZkQ1ff", "language": "OLr", "metadata": {"aVZbQSoD": {}, "GmmFbaIx": {}, "Z4DT7Wdz": {}}, "origin": "GooglePlay", "quantity": 22, "region": "5Do54kCR", "source": "REFERRAL_BONUS", "startDate": "1973-01-24T00:00:00Z", "storeId": "KhHiEcId"}, {"collectionId": "0K3FEPzH", "endDate": "1984-12-01T00:00:00Z", "grantedCode": "qWi1spIy", "itemId": "DxgUYTJ6", "itemNamespace": "ZPYfPdbT", "language": "Xd_gKNu_uS", "metadata": {"kEgzRDEn": {}, "WmEc2rw9": {}, "rxhWOBuQ": {}}, "origin": "Steam", "quantity": 54, "region": "JuGRo8Gy", "source": "PROMOTION", "startDate": "1995-09-19T00:00:00Z", "storeId": "NFSFp4F0"}], "userIds": ["9OkyGyE0", "USWrajsr", "CJqTfVa6"]}' \
    > test.out 2>&1
eval_tap $? 69 'GrantEntitlements' test.out

#- 70 RevokeEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeEntitlements \
    --namespace "$AB_NAMESPACE" \
    --body '["01M7snXM", "3ozrL4Vw", "cD8xeThA"]' \
    > test.out 2>&1
eval_tap $? 70 'RevokeEntitlements' test.out

#- 71 GetEntitlement
./ng net.accelbyte.sdk.cli.Main platform getEntitlement \
    --entitlementId 'NQhWwo3B' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 71 'GetEntitlement' test.out

#- 72 QueryFulfillmentHistories
./ng net.accelbyte.sdk.cli.Main platform queryFulfillmentHistories \
    --namespace "$AB_NAMESPACE" \
    --limit '0' \
    --offset '44' \
    --status 'SUCCESS' \
    --userId 'tJphecXq' \
    > test.out 2>&1
eval_tap $? 72 'QueryFulfillmentHistories' test.out

#- 73 QueryIAPClawbackHistory
./ng net.accelbyte.sdk.cli.Main platform queryIAPClawbackHistory \
    --namespace "$AB_NAMESPACE" \
    --endTime 'QGgW4qQl' \
    --eventType 'REVOKED' \
    --externalOrderId 'E0141Umv' \
    --limit '60' \
    --offset '57' \
    --startTime 'qZg78bOt' \
    --status 'INIT' \
    --userId 'k6AObHGE' \
    > test.out 2>&1
eval_tap $? 73 'QueryIAPClawbackHistory' test.out

#- 74 MockPlayStationStreamEvent
./ng net.accelbyte.sdk.cli.Main platform mockPlayStationStreamEvent \
    --namespace "$AB_NAMESPACE" \
    --body '{"body": {"account": "Ta9AnvoK", "additionalData": {"entitlement": [{"clientTransaction": [{"amountConsumed": 78, "clientTransactionId": "GxS05v57"}, {"amountConsumed": 26, "clientTransactionId": "hDhTyAy4"}, {"amountConsumed": 35, "clientTransactionId": "1SAQERzz"}], "entitlementId": "lik4q71b", "usageCount": 72}, {"clientTransaction": [{"amountConsumed": 40, "clientTransactionId": "qC3H4Elg"}, {"amountConsumed": 79, "clientTransactionId": "gOAvhnVR"}, {"amountConsumed": 45, "clientTransactionId": "c81pAePu"}], "entitlementId": "Pr7CDap1", "usageCount": 67}, {"clientTransaction": [{"amountConsumed": 15, "clientTransactionId": "z3AHY8X4"}, {"amountConsumed": 40, "clientTransactionId": "8DFUuFcz"}, {"amountConsumed": 5, "clientTransactionId": "mVF2io2B"}], "entitlementId": "VtYd6fOC", "usageCount": 51}], "purpose": "FEDs5Ddw"}, "originalTitleName": "FqMDTH8m", "paymentProductSKU": "RMdgJFNU", "purchaseDate": "r56V1fY3", "sourceOrderItemId": "jnAxTlO9", "titleName": "88U8Q4eO"}, "eventDomain": "WwYKqpoH", "eventSource": "WOdLEPaQ", "eventType": "vTKYTMDL", "eventVersion": 6, "id": "cxauJKzA", "timestamp": "WvuOSfC0"}' \
    > test.out 2>&1
eval_tap $? 74 'MockPlayStationStreamEvent' test.out

#- 75 MockXblClawbackEvent
./ng net.accelbyte.sdk.cli.Main platform mockXblClawbackEvent \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": {"eventDate": "aP86BSc0", "eventState": "3V9ZkMYu", "lineItemId": "6YganzHY", "orderId": "nPmEDQD1", "productId": "Owi4R4mU", "productType": "09lUsF17", "purchasedDate": "bESHS2R3", "sandboxId": "aHXINmqS", "skuId": "77lci3R9", "subscriptionData": {"consumedDurationInDays": 73, "dateTime": "QystTyyK", "durationInDays": 36, "recurrenceId": "vjS0VEv5"}}, "datacontenttype": "gol8aS6m", "id": "ggKOS9tH", "source": "hrtOrPgD", "specVersion": "9UzRZp5w", "subject": "uzPNB07u", "time": "fEPAYKtV", "traceparent": "od18JtGm", "type": "jz8Sfewd"}' \
    > test.out 2>&1
eval_tap $? 75 'MockXblClawbackEvent' test.out

#- 76 GetAppleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getAppleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 76 'GetAppleIAPConfig' test.out

#- 77 UpdateAppleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateAppleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appAppleId": 24, "bundleId": "rEtnDpdw", "issuerId": "ht8TzVRU", "keyId": "evHv8KQ1", "password": "0ekF78H9", "version": "V2"}' \
    > test.out 2>&1
eval_tap $? 77 'UpdateAppleIAPConfig' test.out

#- 78 DeleteAppleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteAppleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 78 'DeleteAppleIAPConfig' test.out

#- 79 UpdateAppleP8File
./ng net.accelbyte.sdk.cli.Main platform updateAppleP8File \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 79 'UpdateAppleP8File' test.out

#- 80 GetEpicGamesIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getEpicGamesIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 80 'GetEpicGamesIAPConfig' test.out

#- 81 UpdateEpicGamesIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateEpicGamesIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"sandboxId": "1w4ZSLne"}' \
    > test.out 2>&1
eval_tap $? 81 'UpdateEpicGamesIAPConfig' test.out

#- 82 DeleteEpicGamesIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteEpicGamesIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 82 'DeleteEpicGamesIAPConfig' test.out

#- 83 GetGoogleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getGoogleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 83 'GetGoogleIAPConfig' test.out

#- 84 UpdateGoogleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateGoogleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"applicationName": "DswNk54f", "notificationTokenAudience": "FaQ7qnxK", "notificationTokenEmail": "3dsQfn74", "packageName": "EwPhvNHd", "serviceAccountId": "x5EmUmVn"}' \
    > test.out 2>&1
eval_tap $? 84 'UpdateGoogleIAPConfig' test.out

#- 85 DeleteGoogleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteGoogleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 85 'DeleteGoogleIAPConfig' test.out

#- 86 UpdateGoogleP12File
./ng net.accelbyte.sdk.cli.Main platform updateGoogleP12File \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 86 'UpdateGoogleP12File' test.out

#- 87 GetIAPItemConfig
./ng net.accelbyte.sdk.cli.Main platform getIAPItemConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 87 'GetIAPItemConfig' test.out

#- 88 UpdateIAPItemConfig
./ng net.accelbyte.sdk.cli.Main platform updateIAPItemConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"itemIdentity": "DiCuKgIO", "itemIdentityType": "ITEM_ID", "platformProductIdMap": {"z2LRYa7M": "p9WI3ZxV", "m3sYnyWT": "GGFWRw3Y", "mQWYCHbQ": "D7aLe0Ym"}}, {"itemIdentity": "kF7q7cKL", "itemIdentityType": "ITEM_ID", "platformProductIdMap": {"TLkQXKDH": "7dRAAAh6", "rDZry3zd": "KWSj2RCf", "CMFRNziL": "QLfscALe"}}, {"itemIdentity": "xmx7VRf8", "itemIdentityType": "ITEM_ID", "platformProductIdMap": {"N93AyKYD": "eZfloXBV", "4RQDqcaB": "XxX65kol", "aqFa95QR": "hqjPXiwE"}}]}' \
    > test.out 2>&1
eval_tap $? 88 'UpdateIAPItemConfig' test.out

#- 89 DeleteIAPItemConfig
./ng net.accelbyte.sdk.cli.Main platform deleteIAPItemConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 89 'DeleteIAPItemConfig' test.out

#- 90 GetOculusIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getOculusIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 90 'GetOculusIAPConfig' test.out

#- 91 UpdateOculusIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateOculusIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appId": "zaVof0Hk", "appSecret": "c583Yzln", "webhookVerifyToken": "TRpmbUjh"}' \
    > test.out 2>&1
eval_tap $? 91 'UpdateOculusIAPConfig' test.out

#- 92 DeleteOculusIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteOculusIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 92 'DeleteOculusIAPConfig' test.out

#- 93 ListOculusSubscriptionGroups
./ng net.accelbyte.sdk.cli.Main platform listOculusSubscriptionGroups \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 93 'ListOculusSubscriptionGroups' test.out

#- 94 CreateOculusSubscriptionGroup
./ng net.accelbyte.sdk.cli.Main platform createOculusSubscriptionGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"sku": "8rLVYYoC"}' \
    > test.out 2>&1
eval_tap $? 94 'CreateOculusSubscriptionGroup' test.out

#- 95 DeleteOculusSubscriptionGroup
./ng net.accelbyte.sdk.cli.Main platform deleteOculusSubscriptionGroup \
    --namespace "$AB_NAMESPACE" \
    --sku 'XaBZsQc9' \
    > test.out 2>&1
eval_tap $? 95 'DeleteOculusSubscriptionGroup' test.out

#- 96 ListOculusSubscriptionGroupTier
./ng net.accelbyte.sdk.cli.Main platform listOculusSubscriptionGroupTier \
    --namespace "$AB_NAMESPACE" \
    --sku 'gyK79XOY' \
    > test.out 2>&1
eval_tap $? 96 'ListOculusSubscriptionGroupTier' test.out

#- 97 AddTierIntoMetaQuestSubscriptionGroup
./ng net.accelbyte.sdk.cli.Main platform addTierIntoMetaQuestSubscriptionGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupSku": "9Jw2hZJs", "sku": "UUiTyXJ2"}' \
    > test.out 2>&1
eval_tap $? 97 'AddTierIntoMetaQuestSubscriptionGroup' test.out

#- 98 DeleteOculusSubscriptionTier
./ng net.accelbyte.sdk.cli.Main platform deleteOculusSubscriptionTier \
    --namespace "$AB_NAMESPACE" \
    --sku 'n9l17pkL' \
    > test.out 2>&1
eval_tap $? 98 'DeleteOculusSubscriptionTier' test.out

#- 99 GetPlayStationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getPlayStationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 99 'GetPlayStationIAPConfig' test.out

#- 100 UpdatePlaystationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlaystationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"backOfficeServerClientId": "DrIbcjnh", "backOfficeServerClientSecret": "YP81LsT0", "enableStreamJob": false, "environment": "i5ZGjOog", "streamName": "uGSKhS3W", "streamPartnerName": "DaKPukxw"}' \
    > test.out 2>&1
eval_tap $? 100 'UpdatePlaystationIAPConfig' test.out

#- 101 DeletePlaystationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deletePlaystationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 101 'DeletePlaystationIAPConfig' test.out

#- 102 ValidateExistedPlaystationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform validateExistedPlaystationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 102 'ValidateExistedPlaystationIAPConfig' test.out

#- 103 ValidatePlaystationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform validatePlaystationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"backOfficeServerClientId": "KgMHHPZO", "backOfficeServerClientSecret": "UrYGRBDA", "enableStreamJob": false, "environment": "c2RhgP69", "streamName": "fbJeD79d", "streamPartnerName": "R95kcMiP"}' \
    > test.out 2>&1
eval_tap $? 103 'ValidatePlaystationIAPConfig' test.out

#- 104 GetSteamIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getSteamIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 104 'GetSteamIAPConfig' test.out

#- 105 UpdateSteamIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateSteamIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appId": "liA7cAC0", "env": "LIVE", "publisherAuthenticationKey": "fSzqMMse", "syncMode": "TRANSACTION"}' \
    > test.out 2>&1
eval_tap $? 105 'UpdateSteamIAPConfig' test.out

#- 106 DeleteSteamIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteSteamIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 106 'DeleteSteamIAPConfig' test.out

#- 107 GetTwitchIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getTwitchIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 107 'GetTwitchIAPConfig' test.out

#- 108 UpdateTwitchIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateTwitchIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientId": "YrfKSHTq", "clientSecret": "RAflQI8Q", "organizationId": "dB3aEA6J"}' \
    > test.out 2>&1
eval_tap $? 108 'UpdateTwitchIAPConfig' test.out

#- 109 DeleteTwitchIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteTwitchIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 109 'DeleteTwitchIAPConfig' test.out

#- 110 GetXblIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getXblIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 110 'GetXblIAPConfig' test.out

#- 111 UpdateXblIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateXblIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"enableClawback": true, "entraAppClientId": "rqF9JPCm", "entraAppClientSecret": "eceJLC5M", "entraTenantId": "8vbPAUGY", "relyingPartyCert": "AcYeG8iE"}' \
    > test.out 2>&1
eval_tap $? 111 'UpdateXblIAPConfig' test.out

#- 112 DeleteXblAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteXblAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 112 'DeleteXblAPConfig' test.out

#- 113 UpdateXblBPCertFile
./ng net.accelbyte.sdk.cli.Main platform updateXblBPCertFile \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    --password '5YXVvK2i' \
    > test.out 2>&1
eval_tap $? 113 'UpdateXblBPCertFile' test.out

#- 114 QueryThirdPartyNotifications
./ng net.accelbyte.sdk.cli.Main platform queryThirdPartyNotifications \
    --namespace "$AB_NAMESPACE" \
    --endDate 'ldQpdPjq' \
    --externalId '0HumP522' \
    --limit '48' \
    --offset '43' \
    --source 'STADIA' \
    --startDate 'svyNTDRW' \
    --status 'IGNORED' \
    --type '1h7e9z1s' \
    > test.out 2>&1
eval_tap $? 114 'QueryThirdPartyNotifications' test.out

#- 115 QueryAbnormalTransactions
./ng net.accelbyte.sdk.cli.Main platform queryAbnormalTransactions \
    --namespace "$AB_NAMESPACE" \
    --limit '32' \
    --offset '12' \
    --orderId 'lK6eJoGu' \
    --steamId 'aCYp2aM4' \
    > test.out 2>&1
eval_tap $? 115 'QueryAbnormalTransactions' test.out

#- 116 AdminGetSteamJobInfo
./ng net.accelbyte.sdk.cli.Main platform adminGetSteamJobInfo \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 116 'AdminGetSteamJobInfo' test.out

#- 117 AdminResetSteamJobTime
./ng net.accelbyte.sdk.cli.Main platform adminResetSteamJobTime \
    --namespace "$AB_NAMESPACE" \
    --body '{"env": "SANDBOX", "lastTime": "1999-10-11T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 117 'AdminResetSteamJobTime' test.out

#- 118 AdminRefundIAPOrder
./ng net.accelbyte.sdk.cli.Main platform adminRefundIAPOrder \
    --iapOrderNo 'qlr6sxF6' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 118 'AdminRefundIAPOrder' test.out

#- 119 QuerySteamReportHistories
./ng net.accelbyte.sdk.cli.Main platform querySteamReportHistories \
    --namespace "$AB_NAMESPACE" \
    --limit '75' \
    --offset '57' \
    --orderId '42CT9ql5' \
    --processStatus 'ERROR' \
    --steamId 'EjYNfPHH' \
    > test.out 2>&1
eval_tap $? 119 'QuerySteamReportHistories' test.out

#- 120 QueryThirdPartySubscription
./ng net.accelbyte.sdk.cli.Main platform queryThirdPartySubscription \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --groupId 'czv8Bi7G' \
    --limit '20' \
    --offset '76' \
    --platform 'STEAM' \
    --productId 'xVOQq3jM' \
    --userId 'PZ8V5ozG' \
    > test.out 2>&1
eval_tap $? 120 'QueryThirdPartySubscription' test.out

#- 121 GetIAPOrderConsumeDetails
./ng net.accelbyte.sdk.cli.Main platform getIAPOrderConsumeDetails \
    --iapOrderNo '0rv62jM7' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 121 'GetIAPOrderConsumeDetails' test.out

#- 122 DownloadInvoiceDetails
./ng net.accelbyte.sdk.cli.Main platform downloadInvoiceDetails \
    --namespace "$AB_NAMESPACE" \
    --endTime 'NagDuEuZ' \
    --feature 'WGPiN21p' \
    --itemId 'uW1CvU1p' \
    --itemType 'OPTIONBOX' \
    --startTime 'LDwx4kyL' \
    > test.out 2>&1
eval_tap $? 122 'DownloadInvoiceDetails' test.out

#- 123 GenerateInvoiceSummary
./ng net.accelbyte.sdk.cli.Main platform generateInvoiceSummary \
    --namespace "$AB_NAMESPACE" \
    --endTime 'kNlV7EqY' \
    --feature '1MElBCRq' \
    --itemId 'xfKpVT2D' \
    --itemType 'MEDIA' \
    --startTime 'b3yC8z6N' \
    > test.out 2>&1
eval_tap $? 123 'GenerateInvoiceSummary' test.out

#- 124 SyncInGameItem
./ng net.accelbyte.sdk.cli.Main platform syncInGameItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Sbkq0NCN' \
    --body '{"categoryPath": "e4yC7bbj", "targetItemId": "q4sXBBHS", "targetNamespace": "lR08kWsT"}' \
    > test.out 2>&1
eval_tap $? 124 'SyncInGameItem' test.out

#- 125 CreateItem
./ng net.accelbyte.sdk.cli.Main platform createItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'emnzWMVI' \
    --body '{"appId": "AlF47VJu", "appType": "SOFTWARE", "baseAppId": "eRnPXNmh", "boothName": "0on5aU3z", "categoryPath": "fzHAmgEU", "clazz": "lqRqvVtk", "displayOrder": 28, "entitlementType": "CONSUMABLE", "ext": {"KUmLR4gI": {}, "0Lw6yCnf": {}, "VbWaFIlH": {}}, "features": ["CH6hpTPw", "RJZRg9z3", "J8h6gfXo"], "flexible": true, "images": [{"as": "uvlNh3rp", "caption": "hy60d9RN", "height": 46, "imageUrl": "4L3wL7Er", "smallImageUrl": "pEXzXkik", "width": 8}, {"as": "IpIJwojV", "caption": "j6GS8XF7", "height": 22, "imageUrl": "NJBrnVXu", "smallImageUrl": "GowsKzUz", "width": 60}, {"as": "8GUfKUtN", "caption": "X4DHC2lB", "height": 26, "imageUrl": "wFhHbhWI", "smallImageUrl": "tm6ft03z", "width": 17}], "inventoryConfig": {"customAttributes": {"5JisZPcb": {}, "rxqxaEKH": {}, "OHnU4nL6": {}}, "serverCustomAttributes": {"tLivLK6f": {}, "cQAhROEM": {}, "S8VXHU8p": {}}, "slotUsed": 20}, "itemId": "popbiHVq", "itemIds": ["mQq6YsnL", "lF83YMRm", "m4P2DkRQ"], "itemQty": {"BpRxCTRn": 22, "fqhvbgWm": 4, "LP9v0irw": 63}, "itemType": "APP", "listable": true, "localizations": {"WJZCL2VF": {"description": "uWfnzohu", "localExt": {"OPgnknjq": {}, "YalTmbl7": {}, "aM4vZyVv": {}}, "longDescription": "waCosNSh", "title": "7nwAcAef"}, "fbGjZrwL": {"description": "mpVfTsfz", "localExt": {"ExN0Wm6z": {}, "6n3N14ev": {}, "BNi4m4Xk": {}}, "longDescription": "jadSobVi", "title": "M7nmw6TV"}, "ba5OQeg3": {"description": "HLnacJjz", "localExt": {"vBdJ1zOC": {}, "ZjAItjnN": {}, "u70ddqHi": {}}, "longDescription": "mo5SpbOv", "title": "QLyplGaZ"}}, "lootBoxConfig": {"rewardCount": 95, "rewards": [{"lootBoxItems": [{"count": 54, "duration": 81, "endDate": "1991-10-09T00:00:00Z", "itemId": "H738BQqR", "itemSku": "ajwZkrCD", "itemType": "qdK2sMth"}, {"count": 66, "duration": 20, "endDate": "1975-11-23T00:00:00Z", "itemId": "i0prsaiw", "itemSku": "T4vxAuA2", "itemType": "IA7TCbtY"}, {"count": 12, "duration": 50, "endDate": "1980-01-12T00:00:00Z", "itemId": "oIjE7SPi", "itemSku": "kjJw7UA7", "itemType": "uAudEQxY"}], "name": "4GVM8HwK", "odds": 0.45159511456240764, "type": "PROBABILITY_GROUP", "weight": 78}, {"lootBoxItems": [{"count": 47, "duration": 64, "endDate": "1999-05-30T00:00:00Z", "itemId": "W9Zez6PE", "itemSku": "LvnuoC5A", "itemType": "iLcxjSpe"}, {"count": 43, "duration": 40, "endDate": "1990-09-27T00:00:00Z", "itemId": "wdWgPqOU", "itemSku": "l2UojVrN", "itemType": "F11cehVh"}, {"count": 67, "duration": 79, "endDate": "1998-01-04T00:00:00Z", "itemId": "gfCDKsAU", "itemSku": "T8IDLqoB", "itemType": "uIjOBHX0"}], "name": "E9h37qyJ", "odds": 0.4720516038540551, "type": "REWARD_GROUP", "weight": 46}, {"lootBoxItems": [{"count": 64, "duration": 63, "endDate": "1979-12-28T00:00:00Z", "itemId": "alIsBvKz", "itemSku": "zyP5Ycel", "itemType": "IPvxzINn"}, {"count": 25, "duration": 33, "endDate": "1984-05-18T00:00:00Z", "itemId": "nf2Uzjh6", "itemSku": "45h8hWmU", "itemType": "7sQBSi7Q"}, {"count": 91, "duration": 52, "endDate": "1982-05-26T00:00:00Z", "itemId": "Ax3I1Kmc", "itemSku": "Q80fU3xs", "itemType": "ar4moZAm"}], "name": "azJIbvF0", "odds": 0.44415374335689783, "type": "PROBABILITY_GROUP", "weight": 39}], "rollFunction": "DEFAULT"}, "maxCount": 74, "maxCountPerUser": 50, "name": "9mkMThP9", "optionBoxConfig": {"boxItems": [{"count": 77, "duration": 7, "endDate": "1972-01-08T00:00:00Z", "itemId": "6SMJnm1v", "itemSku": "7JG36zvS", "itemType": "mMVruOkA"}, {"count": 29, "duration": 71, "endDate": "1990-01-06T00:00:00Z", "itemId": "7klAVbWW", "itemSku": "9vrViFvU", "itemType": "MrNc3gtm"}, {"count": 69, "duration": 57, "endDate": "1975-08-05T00:00:00Z", "itemId": "c91RzoU0", "itemSku": "6p66fVbb", "itemType": "yiIqF9J6"}]}, "purchasable": false, "recurring": {"cycle": "MONTHLY", "fixedFreeDays": 78, "fixedTrialCycles": 70, "graceDays": 83}, "regionData": {"nJ22lKl2": [{"currencyCode": "qGqPCjq3", "currencyNamespace": "Glk2tS2T", "currencyType": "REAL", "discountAmount": 25, "discountExpireAt": "1991-07-16T00:00:00Z", "discountPercentage": 81, "discountPurchaseAt": "1993-05-05T00:00:00Z", "expireAt": "1983-09-02T00:00:00Z", "price": 100, "purchaseAt": "1980-02-17T00:00:00Z", "trialPrice": 82}, {"currencyCode": "elvN3zU1", "currencyNamespace": "TQD2lUZi", "currencyType": "REAL", "discountAmount": 22, "discountExpireAt": "1984-05-20T00:00:00Z", "discountPercentage": 41, "discountPurchaseAt": "1974-03-04T00:00:00Z", "expireAt": "1971-09-14T00:00:00Z", "price": 30, "purchaseAt": "1988-08-08T00:00:00Z", "trialPrice": 57}, {"currencyCode": "rEoXLSXu", "currencyNamespace": "bryLxT8T", "currencyType": "REAL", "discountAmount": 84, "discountExpireAt": "1996-09-14T00:00:00Z", "discountPercentage": 30, "discountPurchaseAt": "1981-01-01T00:00:00Z", "expireAt": "1977-05-12T00:00:00Z", "price": 9, "purchaseAt": "1981-11-28T00:00:00Z", "trialPrice": 76}], "iTWnHf86": [{"currencyCode": "iH9aMfox", "currencyNamespace": "vBVUa5zW", "currencyType": "REAL", "discountAmount": 44, "discountExpireAt": "1994-11-09T00:00:00Z", "discountPercentage": 52, "discountPurchaseAt": "1978-04-18T00:00:00Z", "expireAt": "1997-08-26T00:00:00Z", "price": 13, "purchaseAt": "1990-07-23T00:00:00Z", "trialPrice": 55}, {"currencyCode": "KgMscU7P", "currencyNamespace": "Qxi9hslT", "currencyType": "VIRTUAL", "discountAmount": 61, "discountExpireAt": "1988-04-05T00:00:00Z", "discountPercentage": 76, "discountPurchaseAt": "1999-04-21T00:00:00Z", "expireAt": "1999-12-08T00:00:00Z", "price": 84, "purchaseAt": "1971-03-31T00:00:00Z", "trialPrice": 69}, {"currencyCode": "FV2lmdHw", "currencyNamespace": "HCinA9ox", "currencyType": "VIRTUAL", "discountAmount": 16, "discountExpireAt": "1986-12-11T00:00:00Z", "discountPercentage": 92, "discountPurchaseAt": "1977-02-15T00:00:00Z", "expireAt": "1983-06-15T00:00:00Z", "price": 51, "purchaseAt": "1976-01-23T00:00:00Z", "trialPrice": 63}], "OCngCtS9": [{"currencyCode": "XC0Fdxax", "currencyNamespace": "4LKWqkyH", "currencyType": "VIRTUAL", "discountAmount": 36, "discountExpireAt": "1981-04-17T00:00:00Z", "discountPercentage": 65, "discountPurchaseAt": "1982-10-22T00:00:00Z", "expireAt": "1977-10-19T00:00:00Z", "price": 90, "purchaseAt": "1996-10-01T00:00:00Z", "trialPrice": 48}, {"currencyCode": "cwYhjwpl", "currencyNamespace": "u9gUj8V2", "currencyType": "VIRTUAL", "discountAmount": 57, "discountExpireAt": "1977-05-11T00:00:00Z", "discountPercentage": 70, "discountPurchaseAt": "1984-05-07T00:00:00Z", "expireAt": "1982-10-04T00:00:00Z", "price": 89, "purchaseAt": "1981-01-14T00:00:00Z", "trialPrice": 83}, {"currencyCode": "4VmeAynS", "currencyNamespace": "GgkmQZpP", "currencyType": "REAL", "discountAmount": 96, "discountExpireAt": "1990-02-01T00:00:00Z", "discountPercentage": 25, "discountPurchaseAt": "1989-09-18T00:00:00Z", "expireAt": "1972-12-22T00:00:00Z", "price": 78, "purchaseAt": "1990-09-26T00:00:00Z", "trialPrice": 30}]}, "saleConfig": {"currencyCode": "SsNgb9Je", "price": 50}, "seasonType": "TIER", "sectionExclusive": false, "sellable": false, "sku": "ffHu0q0u", "stackable": false, "status": "INACTIVE", "tags": ["6ruQY9ZC", "NJo8yxAg", "5YI8iKCD"], "targetCurrencyCode": "lDH8hykf", "targetNamespace": "5vX9ckAe", "thumbnailUrl": "PDFwyChe", "useCount": 33}' \
    > test.out 2>&1
eval_tap $? 125 'CreateItem' test.out

#- 126 GetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform getItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'rlwADLkp' \
    --appId 'fI88dt1O' \
    > test.out 2>&1
eval_tap $? 126 'GetItemByAppId' test.out

#- 127 QueryItems
./ng net.accelbyte.sdk.cli.Main platform queryItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --appType 'SOFTWARE' \
    --availableDate 'nQ2DDWqO' \
    --baseAppId 'MDgSTRLm' \
    --categoryPath 'J4bVCXZG' \
    --features 'wpaqat3k' \
    --includeSubCategoryItem  \
    --itemType 'SEASON' \
    --limit '94' \
    --offset '10' \
    --region 'WjJUkwp1' \
    --sortBy 'updatedAt:asc,createdAt,createdAt:asc' \
    --storeId 'jXDma2JY' \
    --tags 'rUiqaoLw' \
    --targetNamespace 'e6sPdSFr' \
    > test.out 2>&1
eval_tap $? 127 'QueryItems' test.out

#- 128 ListBasicItemsByFeatures
./ng net.accelbyte.sdk.cli.Main platform listBasicItemsByFeatures \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --features 'PT2S9cpx,gVwBf5AW,RZgTesZ1' \
    > test.out 2>&1
eval_tap $? 128 'ListBasicItemsByFeatures' test.out

#- 129 GetItems
./ng net.accelbyte.sdk.cli.Main platform getItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'XadDwmWa' \
    --itemIds 'TvxWL8Hc' \
    > test.out 2>&1
eval_tap $? 129 'GetItems' test.out

#- 130 GetItemBySku
./ng net.accelbyte.sdk.cli.Main platform getItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'LgTjBU1l' \
    --sku 'mUABetWa' \
    > test.out 2>&1
eval_tap $? 130 'GetItemBySku' test.out

#- 131 GetLocaleItemBySku
./ng net.accelbyte.sdk.cli.Main platform getLocaleItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'eS9iWTTK' \
    --populateBundle  \
    --region 'oCepIf8a' \
    --storeId 'dhbfYtcw' \
    --sku 'dpImmBj9' \
    > test.out 2>&1
eval_tap $? 131 'GetLocaleItemBySku' test.out

#- 132 GetEstimatedPrice
./ng net.accelbyte.sdk.cli.Main platform getEstimatedPrice \
    --namespace "$AB_NAMESPACE" \
    --platform 'hp9Wgeke' \
    --region 'xvV9Se15' \
    --storeId 'cukowgHu' \
    --itemIds 'fS15Aex1' \
    --userId 'l3mkwQuG' \
    > test.out 2>&1
eval_tap $? 132 'GetEstimatedPrice' test.out

#- 133 GetItemIdBySku
./ng net.accelbyte.sdk.cli.Main platform getItemIdBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId '8lSyRM8b' \
    --sku 'xQlJ32Ji' \
    > test.out 2>&1
eval_tap $? 133 'GetItemIdBySku' test.out

#- 134 GetBulkItemIdBySkus
./ng net.accelbyte.sdk.cli.Main platform getBulkItemIdBySkus \
    --namespace "$AB_NAMESPACE" \
    --sku 'd1jpRSyH,1CHS2mD1,ewR4QkRs' \
    --storeId 'D1ScfqhN' \
    > test.out 2>&1
eval_tap $? 134 'GetBulkItemIdBySkus' test.out

#- 135 BulkGetLocaleItems
./ng net.accelbyte.sdk.cli.Main platform bulkGetLocaleItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'pwNOaN0l' \
    --region 'qZf5hu5I' \
    --storeId '0J4Gq6HS' \
    --itemIds 'Ulq7Ewrs' \
    > test.out 2>&1
eval_tap $? 135 'BulkGetLocaleItems' test.out

#- 136 GetAvailablePredicateTypes
./ng net.accelbyte.sdk.cli.Main platform getAvailablePredicateTypes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 136 'GetAvailablePredicateTypes' test.out

#- 137 ValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform validateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --platform 'V5IovLQo' \
    --userId '1tv9r4Qh' \
    --body '{"itemIds": ["kJEonSmJ", "8dx1tNeG", "oyhzHZBp"]}' \
    > test.out 2>&1
eval_tap $? 137 'ValidateItemPurchaseCondition' test.out

#- 138 BulkUpdateRegionData
./ng net.accelbyte.sdk.cli.Main platform bulkUpdateRegionData \
    --namespace "$AB_NAMESPACE" \
    --storeId 'PjSwPJB8' \
    --body '{"changes": [{"itemIdentities": ["bzMnhZUN", "PGWzOtcM", "s5AbPSrz"], "itemIdentityType": "ITEM_SKU", "regionData": {"2YtYNHdP": [{"currencyCode": "zpzvr0In", "currencyNamespace": "24MHTiZq", "currencyType": "VIRTUAL", "discountAmount": 100, "discountExpireAt": "1972-06-16T00:00:00Z", "discountPercentage": 74, "discountPurchaseAt": "1978-05-25T00:00:00Z", "discountedPrice": 50, "expireAt": "1972-04-21T00:00:00Z", "price": 90, "purchaseAt": "1985-01-05T00:00:00Z", "trialPrice": 68}, {"currencyCode": "agUqMkDL", "currencyNamespace": "9irDRlkI", "currencyType": "VIRTUAL", "discountAmount": 0, "discountExpireAt": "1985-02-26T00:00:00Z", "discountPercentage": 96, "discountPurchaseAt": "1989-05-01T00:00:00Z", "discountedPrice": 78, "expireAt": "1999-11-01T00:00:00Z", "price": 38, "purchaseAt": "1985-06-04T00:00:00Z", "trialPrice": 82}, {"currencyCode": "X4Dmasz9", "currencyNamespace": "YsE4wK2r", "currencyType": "REAL", "discountAmount": 96, "discountExpireAt": "1983-07-04T00:00:00Z", "discountPercentage": 14, "discountPurchaseAt": "1996-08-19T00:00:00Z", "discountedPrice": 10, "expireAt": "1992-03-17T00:00:00Z", "price": 41, "purchaseAt": "1987-11-14T00:00:00Z", "trialPrice": 18}], "EM4xpjXH": [{"currencyCode": "rv7piMnr", "currencyNamespace": "llBSDgFX", "currencyType": "REAL", "discountAmount": 98, "discountExpireAt": "1973-07-28T00:00:00Z", "discountPercentage": 85, "discountPurchaseAt": "1984-10-04T00:00:00Z", "discountedPrice": 56, "expireAt": "1982-01-24T00:00:00Z", "price": 85, "purchaseAt": "1995-06-09T00:00:00Z", "trialPrice": 10}, {"currencyCode": "0saisnSS", "currencyNamespace": "GMNgtlQH", "currencyType": "VIRTUAL", "discountAmount": 12, "discountExpireAt": "1983-11-20T00:00:00Z", "discountPercentage": 20, "discountPurchaseAt": "1974-01-05T00:00:00Z", "discountedPrice": 28, "expireAt": "1981-06-01T00:00:00Z", "price": 79, "purchaseAt": "1981-01-11T00:00:00Z", "trialPrice": 11}, {"currencyCode": "X32hrONA", "currencyNamespace": "QBnRUegU", "currencyType": "VIRTUAL", "discountAmount": 85, "discountExpireAt": "1992-07-01T00:00:00Z", "discountPercentage": 62, "discountPurchaseAt": "1994-01-31T00:00:00Z", "discountedPrice": 73, "expireAt": "1984-11-06T00:00:00Z", "price": 95, "purchaseAt": "1982-05-12T00:00:00Z", "trialPrice": 23}], "IrBvNdaT": [{"currencyCode": "DcR5mbCW", "currencyNamespace": "fDEt9Pb5", "currencyType": "VIRTUAL", "discountAmount": 89, "discountExpireAt": "1998-03-26T00:00:00Z", "discountPercentage": 87, "discountPurchaseAt": "1973-02-18T00:00:00Z", "discountedPrice": 24, "expireAt": "1976-03-26T00:00:00Z", "price": 75, "purchaseAt": "1991-11-25T00:00:00Z", "trialPrice": 31}, {"currencyCode": "oD429la6", "currencyNamespace": "W6tvg1I2", "currencyType": "REAL", "discountAmount": 65, "discountExpireAt": "1971-11-04T00:00:00Z", "discountPercentage": 99, "discountPurchaseAt": "1987-02-24T00:00:00Z", "discountedPrice": 29, "expireAt": "1980-11-18T00:00:00Z", "price": 28, "purchaseAt": "1985-10-14T00:00:00Z", "trialPrice": 29}, {"currencyCode": "cZGn3spa", "currencyNamespace": "uRnNC4bu", "currencyType": "REAL", "discountAmount": 64, "discountExpireAt": "1972-01-10T00:00:00Z", "discountPercentage": 88, "discountPurchaseAt": "1990-08-27T00:00:00Z", "discountedPrice": 1, "expireAt": "1994-08-04T00:00:00Z", "price": 60, "purchaseAt": "1983-11-24T00:00:00Z", "trialPrice": 55}]}}, {"itemIdentities": ["5OqzAHD3", "IxAdlg8f", "tpT237TU"], "itemIdentityType": "ITEM_SKU", "regionData": {"sAXHAIxk": [{"currencyCode": "ao23LqEr", "currencyNamespace": "bN1tZnNX", "currencyType": "REAL", "discountAmount": 8, "discountExpireAt": "1999-03-02T00:00:00Z", "discountPercentage": 56, "discountPurchaseAt": "1980-03-19T00:00:00Z", "discountedPrice": 27, "expireAt": "1971-09-29T00:00:00Z", "price": 16, "purchaseAt": "1998-09-12T00:00:00Z", "trialPrice": 16}, {"currencyCode": "bRYHSPtr", "currencyNamespace": "smI5CkeO", "currencyType": "VIRTUAL", "discountAmount": 61, "discountExpireAt": "1991-01-31T00:00:00Z", "discountPercentage": 70, "discountPurchaseAt": "1977-04-03T00:00:00Z", "discountedPrice": 86, "expireAt": "1988-09-04T00:00:00Z", "price": 80, "purchaseAt": "1989-04-02T00:00:00Z", "trialPrice": 83}, {"currencyCode": "4Kf6Spcj", "currencyNamespace": "i2CW9S38", "currencyType": "VIRTUAL", "discountAmount": 42, "discountExpireAt": "1982-05-17T00:00:00Z", "discountPercentage": 43, "discountPurchaseAt": "1999-02-17T00:00:00Z", "discountedPrice": 13, "expireAt": "1979-04-07T00:00:00Z", "price": 35, "purchaseAt": "1973-10-25T00:00:00Z", "trialPrice": 27}], "TjH9JmNH": [{"currencyCode": "ZRuF1bzm", "currencyNamespace": "KxiOQLog", "currencyType": "REAL", "discountAmount": 97, "discountExpireAt": "1978-01-05T00:00:00Z", "discountPercentage": 29, "discountPurchaseAt": "1976-08-05T00:00:00Z", "discountedPrice": 52, "expireAt": "1990-08-26T00:00:00Z", "price": 18, "purchaseAt": "1988-10-15T00:00:00Z", "trialPrice": 83}, {"currencyCode": "SjUHlOgm", "currencyNamespace": "Oseog6Yp", "currencyType": "REAL", "discountAmount": 41, "discountExpireAt": "1971-07-04T00:00:00Z", "discountPercentage": 36, "discountPurchaseAt": "1980-09-13T00:00:00Z", "discountedPrice": 24, "expireAt": "1998-04-15T00:00:00Z", "price": 16, "purchaseAt": "1980-04-09T00:00:00Z", "trialPrice": 51}, {"currencyCode": "rIh08AKA", "currencyNamespace": "VExR3eP9", "currencyType": "REAL", "discountAmount": 11, "discountExpireAt": "1986-08-30T00:00:00Z", "discountPercentage": 96, "discountPurchaseAt": "1984-10-17T00:00:00Z", "discountedPrice": 60, "expireAt": "1996-07-30T00:00:00Z", "price": 69, "purchaseAt": "1983-01-24T00:00:00Z", "trialPrice": 35}], "lGI7Wjvd": [{"currencyCode": "K0ASoSNw", "currencyNamespace": "vXN2SNMS", "currencyType": "VIRTUAL", "discountAmount": 6, "discountExpireAt": "1984-03-12T00:00:00Z", "discountPercentage": 11, "discountPurchaseAt": "1971-12-05T00:00:00Z", "discountedPrice": 7, "expireAt": "1975-07-19T00:00:00Z", "price": 36, "purchaseAt": "1988-01-22T00:00:00Z", "trialPrice": 89}, {"currencyCode": "JnRVyWQY", "currencyNamespace": "AAj1xPUx", "currencyType": "REAL", "discountAmount": 93, "discountExpireAt": "1979-05-28T00:00:00Z", "discountPercentage": 61, "discountPurchaseAt": "1974-11-22T00:00:00Z", "discountedPrice": 16, "expireAt": "1979-02-12T00:00:00Z", "price": 19, "purchaseAt": "1972-05-31T00:00:00Z", "trialPrice": 7}, {"currencyCode": "5s2DL79e", "currencyNamespace": "xiuFrxsZ", "currencyType": "VIRTUAL", "discountAmount": 17, "discountExpireAt": "1983-10-30T00:00:00Z", "discountPercentage": 4, "discountPurchaseAt": "1998-08-24T00:00:00Z", "discountedPrice": 69, "expireAt": "1980-06-09T00:00:00Z", "price": 86, "purchaseAt": "1988-06-20T00:00:00Z", "trialPrice": 25}]}}, {"itemIdentities": ["mgqAnJeR", "ArjPvAKr", "vFGguLIK"], "itemIdentityType": "ITEM_SKU", "regionData": {"Gr2arqVC": [{"currencyCode": "CEPftybH", "currencyNamespace": "5m180bKv", "currencyType": "REAL", "discountAmount": 47, "discountExpireAt": "1982-07-13T00:00:00Z", "discountPercentage": 10, "discountPurchaseAt": "1981-11-01T00:00:00Z", "discountedPrice": 90, "expireAt": "1982-12-31T00:00:00Z", "price": 8, "purchaseAt": "1995-01-16T00:00:00Z", "trialPrice": 35}, {"currencyCode": "RRXxXwwv", "currencyNamespace": "H3lqTZo5", "currencyType": "VIRTUAL", "discountAmount": 37, "discountExpireAt": "1976-05-26T00:00:00Z", "discountPercentage": 51, "discountPurchaseAt": "1998-09-01T00:00:00Z", "discountedPrice": 55, "expireAt": "1992-11-10T00:00:00Z", "price": 62, "purchaseAt": "1988-01-24T00:00:00Z", "trialPrice": 73}, {"currencyCode": "uYf5IrRS", "currencyNamespace": "5DDX9zBF", "currencyType": "VIRTUAL", "discountAmount": 83, "discountExpireAt": "1971-07-28T00:00:00Z", "discountPercentage": 30, "discountPurchaseAt": "1978-09-27T00:00:00Z", "discountedPrice": 64, "expireAt": "1982-01-03T00:00:00Z", "price": 59, "purchaseAt": "1984-10-21T00:00:00Z", "trialPrice": 95}], "vUWlBSky": [{"currencyCode": "EQUXpyxa", "currencyNamespace": "el8LVEAX", "currencyType": "VIRTUAL", "discountAmount": 31, "discountExpireAt": "1987-05-21T00:00:00Z", "discountPercentage": 6, "discountPurchaseAt": "1990-11-20T00:00:00Z", "discountedPrice": 82, "expireAt": "1979-04-06T00:00:00Z", "price": 86, "purchaseAt": "1973-09-04T00:00:00Z", "trialPrice": 14}, {"currencyCode": "97wxTFQh", "currencyNamespace": "cFoSUcg7", "currencyType": "VIRTUAL", "discountAmount": 31, "discountExpireAt": "1975-11-06T00:00:00Z", "discountPercentage": 56, "discountPurchaseAt": "1995-11-12T00:00:00Z", "discountedPrice": 47, "expireAt": "1999-08-08T00:00:00Z", "price": 40, "purchaseAt": "1980-10-25T00:00:00Z", "trialPrice": 58}, {"currencyCode": "T1wqwRRb", "currencyNamespace": "W2r3z9mI", "currencyType": "REAL", "discountAmount": 52, "discountExpireAt": "1985-08-31T00:00:00Z", "discountPercentage": 80, "discountPurchaseAt": "1973-05-15T00:00:00Z", "discountedPrice": 99, "expireAt": "1971-03-17T00:00:00Z", "price": 8, "purchaseAt": "1976-03-21T00:00:00Z", "trialPrice": 67}], "nSeh8Y4z": [{"currencyCode": "pU0WYlaj", "currencyNamespace": "eDNiL1s5", "currencyType": "REAL", "discountAmount": 32, "discountExpireAt": "1985-10-28T00:00:00Z", "discountPercentage": 89, "discountPurchaseAt": "1982-09-23T00:00:00Z", "discountedPrice": 96, "expireAt": "1990-09-18T00:00:00Z", "price": 51, "purchaseAt": "1993-12-30T00:00:00Z", "trialPrice": 87}, {"currencyCode": "34fEP2NW", "currencyNamespace": "8b4nHq6r", "currencyType": "VIRTUAL", "discountAmount": 2, "discountExpireAt": "1972-04-12T00:00:00Z", "discountPercentage": 35, "discountPurchaseAt": "1972-04-30T00:00:00Z", "discountedPrice": 45, "expireAt": "1975-12-04T00:00:00Z", "price": 73, "purchaseAt": "1999-05-02T00:00:00Z", "trialPrice": 54}, {"currencyCode": "NyyudrtJ", "currencyNamespace": "eFR6wW1R", "currencyType": "VIRTUAL", "discountAmount": 32, "discountExpireAt": "1977-02-14T00:00:00Z", "discountPercentage": 89, "discountPurchaseAt": "1982-08-16T00:00:00Z", "discountedPrice": 69, "expireAt": "1986-08-24T00:00:00Z", "price": 61, "purchaseAt": "1988-06-03T00:00:00Z", "trialPrice": 80}]}}]}' \
    > test.out 2>&1
eval_tap $? 138 'BulkUpdateRegionData' test.out

#- 139 SearchItems
./ng net.accelbyte.sdk.cli.Main platform searchItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemType 'SEASON' \
    --limit '24' \
    --offset '83' \
    --sortBy 'X37F0q60' \
    --storeId 'VQFN0IVI' \
    --keyword 'JOoVHWry' \
    --language 'UgencXUr' \
    > test.out 2>&1
eval_tap $? 139 'SearchItems' test.out

#- 140 QueryUncategorizedItems
./ng net.accelbyte.sdk.cli.Main platform queryUncategorizedItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --limit '6' \
    --offset '42' \
    --sortBy 'createdAt:desc,createdAt:asc,name' \
    --storeId 'zs2q87pK' \
    > test.out 2>&1
eval_tap $? 140 'QueryUncategorizedItems' test.out

#- 141 GetItem
./ng net.accelbyte.sdk.cli.Main platform getItem \
    --itemId 'e0h9Ntpk' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'twXzSVLl' \
    > test.out 2>&1
eval_tap $? 141 'GetItem' test.out

#- 142 UpdateItem
./ng net.accelbyte.sdk.cli.Main platform updateItem \
    --itemId 'Yzhlby6g' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'rUgOOOTP' \
    --body '{"appId": "1xFLUEn8", "appType": "DEMO", "baseAppId": "n3vv8bHc", "boothName": "GmQiMNGP", "categoryPath": "sfhh7iwp", "clazz": "8XjUS6lI", "displayOrder": 17, "entitlementType": "DURABLE", "ext": {"bSr0x8ea": {}, "brBApmDq": {}, "R9HFOyXs": {}}, "features": ["JVVMP2GA", "QYOMTK7K", "Yp78xgaY"], "flexible": false, "images": [{"as": "djAF5iYb", "caption": "yUwMZ3I5", "height": 15, "imageUrl": "yts5uOiW", "smallImageUrl": "v4AFSrdV", "width": 69}, {"as": "pxapkzmr", "caption": "ZjZDS40x", "height": 15, "imageUrl": "I4ocv5Xa", "smallImageUrl": "ajpj8Ez2", "width": 79}, {"as": "EEOXZGWs", "caption": "zl2OSvpq", "height": 97, "imageUrl": "alGUT9LP", "smallImageUrl": "xAmhU3qw", "width": 21}], "inventoryConfig": {"customAttributes": {"9axDk5od": {}, "lYhIEhmZ": {}, "Iwv0I5jj": {}}, "serverCustomAttributes": {"BAT3Ftrs": {}, "ir5RzNSm": {}, "3bCUE935": {}}, "slotUsed": 92}, "itemIds": ["IB8h4zGG", "453f6aC7", "yBc4kOvI"], "itemQty": {"XTj2zA1J": 70, "GS79r9JV": 77, "4dfQQwpy": 71}, "itemType": "COINS", "listable": true, "localizations": {"GM6gjLwU": {"description": "06uKyjUs", "localExt": {"A1LhdH7X": {}, "9Kb0loRe": {}, "rL4x5d1F": {}}, "longDescription": "jwOxTr9D", "title": "lKIdb8Uw"}, "3h1gXNZk": {"description": "NonGpcgF", "localExt": {"C3pu01pi": {}, "WZkvpoGA": {}, "fFjh94Rw": {}}, "longDescription": "Skxa18Ha", "title": "FO3EZ1O1"}, "Ie6EsNOE": {"description": "SUaN585n", "localExt": {"exhe8IBi": {}, "8PRblxKQ": {}, "PkfewxvZ": {}}, "longDescription": "eTmrC9y5", "title": "3TENe0Fc"}}, "lootBoxConfig": {"rewardCount": 35, "rewards": [{"lootBoxItems": [{"count": 20, "duration": 11, "endDate": "1979-01-24T00:00:00Z", "itemId": "8o75tSO9", "itemSku": "x545asuh", "itemType": "CKNgA0sv"}, {"count": 18, "duration": 56, "endDate": "1981-07-27T00:00:00Z", "itemId": "Cgg4Ufbp", "itemSku": "jzJ9x1I6", "itemType": "jklLYumD"}, {"count": 16, "duration": 76, "endDate": "1988-09-27T00:00:00Z", "itemId": "XGK1I51c", "itemSku": "Pe5pTJTz", "itemType": "C11Mqs0s"}], "name": "y1rLSPD1", "odds": 0.9763827804063399, "type": "PROBABILITY_GROUP", "weight": 29}, {"lootBoxItems": [{"count": 64, "duration": 51, "endDate": "1990-07-23T00:00:00Z", "itemId": "FWlmlbFI", "itemSku": "l6Fb6nBJ", "itemType": "r04KG7Hd"}, {"count": 38, "duration": 37, "endDate": "1987-12-06T00:00:00Z", "itemId": "DU6tHUwv", "itemSku": "UxD5Fitk", "itemType": "l9Vumuau"}, {"count": 10, "duration": 53, "endDate": "1994-11-14T00:00:00Z", "itemId": "kREaqMrP", "itemSku": "fmtnwlcD", "itemType": "SS5QnpPI"}], "name": "DxoHPcxT", "odds": 0.5775303610962942, "type": "PROBABILITY_GROUP", "weight": 19}, {"lootBoxItems": [{"count": 76, "duration": 5, "endDate": "1976-02-19T00:00:00Z", "itemId": "mQwJEx9f", "itemSku": "WuWRPL2m", "itemType": "ccpGCSTx"}, {"count": 10, "duration": 7, "endDate": "1976-03-01T00:00:00Z", "itemId": "ErbeOEYF", "itemSku": "Gz1ZRBnU", "itemType": "IlQGeGRO"}, {"count": 1, "duration": 49, "endDate": "1985-04-29T00:00:00Z", "itemId": "Wb6n1HEF", "itemSku": "CEkdZSOO", "itemType": "rBR9p9px"}], "name": "GCBYBydo", "odds": 0.3039376408172755, "type": "PROBABILITY_GROUP", "weight": 29}], "rollFunction": "DEFAULT"}, "maxCount": 73, "maxCountPerUser": 2, "name": "KCKSOpP2", "optionBoxConfig": {"boxItems": [{"count": 23, "duration": 76, "endDate": "1985-09-07T00:00:00Z", "itemId": "66hsbn7W", "itemSku": "hLFYKocj", "itemType": "KdScTCQG"}, {"count": 92, "duration": 43, "endDate": "1995-06-12T00:00:00Z", "itemId": "3jWms0Sg", "itemSku": "LgfnfQbb", "itemType": "RVCn1r8J"}, {"count": 38, "duration": 56, "endDate": "1991-07-01T00:00:00Z", "itemId": "Z4VQ60ZV", "itemSku": "mr9mfwmz", "itemType": "4MdjcKuA"}]}, "purchasable": false, "recurring": {"cycle": "MONTHLY", "fixedFreeDays": 46, "fixedTrialCycles": 96, "graceDays": 19}, "regionData": {"ADqlwaWC": [{"currencyCode": "nyhEOEAV", "currencyNamespace": "a3rwGbun", "currencyType": "VIRTUAL", "discountAmount": 11, "discountExpireAt": "1986-08-15T00:00:00Z", "discountPercentage": 13, "discountPurchaseAt": "1977-01-31T00:00:00Z", "expireAt": "1995-06-18T00:00:00Z", "price": 72, "purchaseAt": "1999-06-01T00:00:00Z", "trialPrice": 9}, {"currencyCode": "ZEPeRePS", "currencyNamespace": "W2gTvyYI", "currencyType": "REAL", "discountAmount": 41, "discountExpireAt": "1998-06-22T00:00:00Z", "discountPercentage": 60, "discountPurchaseAt": "1982-08-26T00:00:00Z", "expireAt": "1973-12-10T00:00:00Z", "price": 86, "purchaseAt": "1987-03-16T00:00:00Z", "trialPrice": 62}, {"currencyCode": "VAXqgEqi", "currencyNamespace": "AqW4GtMk", "currencyType": "VIRTUAL", "discountAmount": 43, "discountExpireAt": "1996-02-13T00:00:00Z", "discountPercentage": 65, "discountPurchaseAt": "1982-04-24T00:00:00Z", "expireAt": "1982-05-21T00:00:00Z", "price": 98, "purchaseAt": "1987-02-21T00:00:00Z", "trialPrice": 73}], "IOVKVL3R": [{"currencyCode": "DS4Wtpgo", "currencyNamespace": "jHpAnQej", "currencyType": "REAL", "discountAmount": 68, "discountExpireAt": "1977-02-12T00:00:00Z", "discountPercentage": 33, "discountPurchaseAt": "1972-10-11T00:00:00Z", "expireAt": "1978-05-08T00:00:00Z", "price": 4, "purchaseAt": "1996-09-12T00:00:00Z", "trialPrice": 53}, {"currencyCode": "NazcJrbh", "currencyNamespace": "bm4Q1YCp", "currencyType": "VIRTUAL", "discountAmount": 76, "discountExpireAt": "1982-11-27T00:00:00Z", "discountPercentage": 88, "discountPurchaseAt": "1974-09-01T00:00:00Z", "expireAt": "1989-05-30T00:00:00Z", "price": 77, "purchaseAt": "1994-03-20T00:00:00Z", "trialPrice": 74}, {"currencyCode": "CY0UtEhe", "currencyNamespace": "2yyByVII", "currencyType": "REAL", "discountAmount": 59, "discountExpireAt": "1995-01-13T00:00:00Z", "discountPercentage": 86, "discountPurchaseAt": "1977-12-14T00:00:00Z", "expireAt": "1981-10-13T00:00:00Z", "price": 65, "purchaseAt": "1973-09-20T00:00:00Z", "trialPrice": 23}], "VpsR7JEQ": [{"currencyCode": "KamjwjuD", "currencyNamespace": "5vdK4okb", "currencyType": "REAL", "discountAmount": 79, "discountExpireAt": "1982-11-22T00:00:00Z", "discountPercentage": 26, "discountPurchaseAt": "1989-08-30T00:00:00Z", "expireAt": "1982-08-13T00:00:00Z", "price": 60, "purchaseAt": "1973-12-30T00:00:00Z", "trialPrice": 6}, {"currencyCode": "msvpZYNt", "currencyNamespace": "NOKauPKo", "currencyType": "REAL", "discountAmount": 31, "discountExpireAt": "1993-02-22T00:00:00Z", "discountPercentage": 17, "discountPurchaseAt": "1976-04-17T00:00:00Z", "expireAt": "1973-08-27T00:00:00Z", "price": 56, "purchaseAt": "1985-06-05T00:00:00Z", "trialPrice": 30}, {"currencyCode": "s4dbzpn4", "currencyNamespace": "B4nuQYoA", "currencyType": "VIRTUAL", "discountAmount": 40, "discountExpireAt": "1996-09-23T00:00:00Z", "discountPercentage": 21, "discountPurchaseAt": "1999-10-04T00:00:00Z", "expireAt": "1979-11-02T00:00:00Z", "price": 100, "purchaseAt": "1998-02-22T00:00:00Z", "trialPrice": 87}]}, "saleConfig": {"currencyCode": "N0pioV0N", "price": 85}, "seasonType": "TIER", "sectionExclusive": false, "sellable": true, "sku": "xolz0ETK", "stackable": false, "status": "ACTIVE", "tags": ["GyXWwhhb", "G1rH8f03", "rkrpXOsR"], "targetCurrencyCode": "rVGmNoxX", "targetNamespace": "bweEZAS9", "thumbnailUrl": "u4A7EgK0", "useCount": 95}' \
    > test.out 2>&1
eval_tap $? 142 'UpdateItem' test.out

#- 143 DeleteItem
./ng net.accelbyte.sdk.cli.Main platform deleteItem \
    --itemId 'Xof5S8YW' \
    --namespace "$AB_NAMESPACE" \
    --featuresToCheck 'CATALOG,REWARD,IAP' \
    --force  \
    --storeId 'e7rLl3Wg' \
    > test.out 2>&1
eval_tap $? 143 'DeleteItem' test.out

#- 144 AcquireItem
./ng net.accelbyte.sdk.cli.Main platform acquireItem \
    --itemId 'ccLJR06k' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 72, "orderNo": "OdCoHgLt"}' \
    > test.out 2>&1
eval_tap $? 144 'AcquireItem' test.out

#- 145 GetApp
./ng net.accelbyte.sdk.cli.Main platform getApp \
    --itemId 'm0MvzmZ7' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'hZhaF5bj' \
    > test.out 2>&1
eval_tap $? 145 'GetApp' test.out

#- 146 UpdateApp
./ng net.accelbyte.sdk.cli.Main platform updateApp \
    --itemId 'oNB8i5lt' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'KS5fCpDY' \
    --body '{"carousel": [{"alt": "hweSczPQ", "previewUrl": "5sWe4t20", "thumbnailUrl": "aB5se3w6", "type": "image", "url": "n7pgADZc", "videoSource": "generic"}, {"alt": "6pT40CHh", "previewUrl": "wXGmDDrS", "thumbnailUrl": "dIWxDsmG", "type": "video", "url": "jswJBtW5", "videoSource": "vimeo"}, {"alt": "oStTKwsw", "previewUrl": "3nOoEHBp", "thumbnailUrl": "cMrD9G1O", "type": "image", "url": "IHECm6iP", "videoSource": "youtube"}], "developer": "5Y8rYJvb", "forumUrl": "FpXCkxJX", "genres": ["MassivelyMultiplayer", "MassivelyMultiplayer", "MassivelyMultiplayer"], "localizations": {"vUHdY7LH": {"announcement": "JEfmgdh9", "slogan": "WlDh7u3M"}, "EivzYll0": {"announcement": "THzVAauO", "slogan": "2IRJtDXa"}, "Vqg3IyUM": {"announcement": "M3EEbr10", "slogan": "q6ES8x4t"}}, "platformRequirements": {"MuCGzH1R": [{"additionals": "dVZHuw41", "directXVersion": "ne7llqvr", "diskSpace": "que8HZ3H", "graphics": "m6tWCtg9", "label": "2QOluwbw", "osVersion": "rt8Njb3R", "processor": "5HRXuV0T", "ram": "c6OucxoS", "soundCard": "rQFamP7L"}, {"additionals": "whBJBd6t", "directXVersion": "uhSJF63D", "diskSpace": "NfcPG77V", "graphics": "lxFrzOR6", "label": "4PTCfDFn", "osVersion": "CaHKrrAu", "processor": "tMilbV9G", "ram": "URrnsyls", "soundCard": "HfFzoCgJ"}, {"additionals": "JjWZKO52", "directXVersion": "hZUSg26G", "diskSpace": "wO5ogWWZ", "graphics": "jqzd32UG", "label": "95CoGS3J", "osVersion": "lqXLDRvb", "processor": "9Nb4ZQ5D", "ram": "Ck7Kfw8I", "soundCard": "tvt3soXQ"}], "TOjLEkxr": [{"additionals": "T4z4WgGf", "directXVersion": "7CBwlsg5", "diskSpace": "x8DHlxID", "graphics": "6DWPmNWA", "label": "7F2d9zUr", "osVersion": "yOay53l7", "processor": "VhA7a7P9", "ram": "7KuW4YDz", "soundCard": "wYEF7xBe"}, {"additionals": "gjWUNXO9", "directXVersion": "uNDoOzot", "diskSpace": "1Nwq1j2P", "graphics": "2IgRqEmR", "label": "Al76eSNA", "osVersion": "bcyLXyoY", "processor": "1p4Z90w5", "ram": "N785RbwQ", "soundCard": "Kt62EbPm"}, {"additionals": "bhHeHX1Q", "directXVersion": "JEnvyKCc", "diskSpace": "BCpQ2S2g", "graphics": "jxeBZNwO", "label": "bnLoYpRs", "osVersion": "o95BGb83", "processor": "bJIDZr63", "ram": "QuAKJGXR", "soundCard": "I5t6gzSu"}], "Kf23ghR2": [{"additionals": "McW8f8N3", "directXVersion": "ieA93orJ", "diskSpace": "N2uYaobc", "graphics": "GPbUpMz7", "label": "v19ulYZ2", "osVersion": "j0sm1tuP", "processor": "PeWEPV8P", "ram": "4dgpzh4E", "soundCard": "6d1vUHpK"}, {"additionals": "4FnWj6Bn", "directXVersion": "ZpGQTEVK", "diskSpace": "HCJyUBgu", "graphics": "rbLUgUMK", "label": "YwVEwOwU", "osVersion": "icmAqaQQ", "processor": "rrvp3zM3", "ram": "Bgb6O8FW", "soundCard": "s6jFLNhq"}, {"additionals": "C8uUMp73", "directXVersion": "pk0vx8E1", "diskSpace": "IdyDrVwh", "graphics": "VUun4X1T", "label": "mXAaFuXt", "osVersion": "yWYiUVfH", "processor": "AssJ71Da", "ram": "IKmikQCb", "soundCard": "tfghwWZs"}]}, "platforms": ["Android", "Android", "IOS"], "players": ["Coop", "CrossPlatformMulti", "Single"], "primaryGenre": "FreeToPlay", "publisher": "ygurd8zF", "releaseDate": "1989-04-13T00:00:00Z", "websiteUrl": "ILUx4Gwe"}' \
    > test.out 2>&1
eval_tap $? 146 'UpdateApp' test.out

#- 147 DisableItem
./ng net.accelbyte.sdk.cli.Main platform disableItem \
    --itemId 'y3DK3ZYm' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'QduKNX3T' \
    --body '{"featuresToCheck": ["CAMPAIGN", "DLC", "CATALOG"]}' \
    > test.out 2>&1
eval_tap $? 147 'DisableItem' test.out

#- 148 GetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform getItemDynamicData \
    --itemId 'wD18ZlOD' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 148 'GetItemDynamicData' test.out

#- 149 EnableItem
./ng net.accelbyte.sdk.cli.Main platform enableItem \
    --itemId 'jpKvlMEO' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'QuibNXx1' \
    > test.out 2>&1
eval_tap $? 149 'EnableItem' test.out

#- 150 FeatureItem
./ng net.accelbyte.sdk.cli.Main platform featureItem \
    --feature 'A5WSdUyx' \
    --itemId '2BgpeZFC' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'H6EMZwyi' \
    > test.out 2>&1
eval_tap $? 150 'FeatureItem' test.out

#- 151 DefeatureItem
./ng net.accelbyte.sdk.cli.Main platform defeatureItem \
    --feature 'l02PxGVa' \
    --itemId 'E5zGQ7ls' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'rgMF9jmd' \
    > test.out 2>&1
eval_tap $? 151 'DefeatureItem' test.out

#- 152 GetLocaleItem
./ng net.accelbyte.sdk.cli.Main platform getLocaleItem \
    --itemId 'kOQuhSmM' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'l6ocaXA5' \
    --populateBundle  \
    --region 'UzXeV2hA' \
    --storeId '8KpH9RMl' \
    > test.out 2>&1
eval_tap $? 152 'GetLocaleItem' test.out

#- 153 UpdateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform updateItemPurchaseCondition \
    --itemId 'TFRyjwE7' \
    --namespace "$AB_NAMESPACE" \
    --storeId '6DKBjXh5' \
    --body '{"purchaseCondition": {"conditionGroups": [{"operator": "and", "predicates": [{"anyOf": 18, "code": "hIFLZv2p", "comparison": "includes", "name": "yPlkBjOL", "predicateType": "EntitlementPredicate", "value": "lHSWkmv1", "values": ["RSVLbfQU", "uOZVxFzo", "ZmjMhAFp"]}, {"anyOf": 69, "code": "ugHLTe3V", "comparison": "is", "name": "IJHmK1rc", "predicateType": "StatisticCodePredicate", "value": "6s3IxGv2", "values": ["wrFuoBZ8", "hnBzXnNM", "AysPnCar"]}, {"anyOf": 57, "code": "JZ2GMlmq", "comparison": "isLessThan", "name": "avq2xgMs", "predicateType": "SeasonTierPredicate", "value": "NKR2i6OK", "values": ["jMCNg03s", "CDN9ccFB", "XdVgiaBw"]}]}, {"operator": "and", "predicates": [{"anyOf": 41, "code": "417iRrJR", "comparison": "isGreaterThan", "name": "PZuRgpSi", "predicateType": "SeasonPassPredicate", "value": "GCLQ7iVQ", "values": ["sCie4Vtd", "zQunqSu9", "qLvW0TgM"]}, {"anyOf": 37, "code": "CkTqhakg", "comparison": "isLessThan", "name": "TlVbF2KS", "predicateType": "SeasonPassPredicate", "value": "N4RYe1yC", "values": ["G973SxJ1", "3qliyM6X", "AYv9ISkZ"]}, {"anyOf": 21, "code": "Bwi9B5iy", "comparison": "includes", "name": "P06AMCI5", "predicateType": "SeasonTierPredicate", "value": "xrMA8ipt", "values": ["bmIhaIEw", "29chD1tA", "vmKgHWHP"]}]}, {"operator": "or", "predicates": [{"anyOf": 85, "code": "RpfOycbv", "comparison": "isLessThanOrEqual", "name": "Bjnlg9Ps", "predicateType": "StatisticCodePredicate", "value": "P6LHFVRP", "values": ["X0h6LgwU", "c1LYE6LQ", "74uL0Cik"]}, {"anyOf": 29, "code": "hAJv9Rb3", "comparison": "isGreaterThan", "name": "TeuR4yjE", "predicateType": "SeasonPassPredicate", "value": "0lhnOR6H", "values": ["T8FqsNuu", "HZPev1Hu", "vwxBpdhD"]}, {"anyOf": 82, "code": "3PKavwhT", "comparison": "includes", "name": "GRfMlpbr", "predicateType": "EntitlementPredicate", "value": "rpVGKl8A", "values": ["ePrGKs71", "HAWVvUnC", "1GYgylOs"]}]}]}}' \
    > test.out 2>&1
eval_tap $? 153 'UpdateItemPurchaseCondition' test.out

#- 154 QueryItemReferences
./ng net.accelbyte.sdk.cli.Main platform queryItemReferences \
    --itemId 'LsMxN59f' \
    --namespace "$AB_NAMESPACE" \
    --featuresToCheck 'REWARD,DLC,DLC' \
    --storeId '4r6EBaii' \
    > test.out 2>&1
eval_tap $? 154 'QueryItemReferences' test.out

#- 155 ReturnItem
./ng net.accelbyte.sdk.cli.Main platform returnItem \
    --itemId 'jCAZFm13' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "fho63elI"}' \
    > test.out 2>&1
eval_tap $? 155 'ReturnItem' test.out

#- 156 QueryKeyGroups
./ng net.accelbyte.sdk.cli.Main platform queryKeyGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '41' \
    --name 'Q6H8qKkQ' \
    --offset '29' \
    --tag 'Tp5p9jQa' \
    > test.out 2>&1
eval_tap $? 156 'QueryKeyGroups' test.out

#- 157 CreateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform createKeyGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "jDW1tZjZ", "name": "xPhukvZn", "status": "ACTIVE", "tags": ["QJFDtsrW", "otWZgJV1", "aBhMrzYL"]}' \
    > test.out 2>&1
eval_tap $? 157 'CreateKeyGroup' test.out

#- 158 GetKeyGroupByBoothName
eval_tap 0 158 'GetKeyGroupByBoothName # SKIP deprecated' test.out

#- 159 GetKeyGroup
./ng net.accelbyte.sdk.cli.Main platform getKeyGroup \
    --keyGroupId 'SNlAdMqN' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 159 'GetKeyGroup' test.out

#- 160 UpdateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform updateKeyGroup \
    --keyGroupId 'xlsrvxBF' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "76imTWLz", "name": "pIiEzSnp", "status": "ACTIVE", "tags": ["BRnah59g", "RlvaCHIY", "Ya7xCo21"]}' \
    > test.out 2>&1
eval_tap $? 160 'UpdateKeyGroup' test.out

#- 161 GetKeyGroupDynamic
./ng net.accelbyte.sdk.cli.Main platform getKeyGroupDynamic \
    --keyGroupId 'qAjrYRVN' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 161 'GetKeyGroupDynamic' test.out

#- 162 ListKeys
./ng net.accelbyte.sdk.cli.Main platform listKeys \
    --keyGroupId '4Xws1YCg' \
    --namespace "$AB_NAMESPACE" \
    --limit '59' \
    --offset '51' \
    --status 'ACQUIRED' \
    > test.out 2>&1
eval_tap $? 162 'ListKeys' test.out

#- 163 UploadKeys
./ng net.accelbyte.sdk.cli.Main platform uploadKeys \
    --keyGroupId 'r8CuOBXa' \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 163 'UploadKeys' test.out

#- 164 QueryOrders
./ng net.accelbyte.sdk.cli.Main platform queryOrders \
    --namespace "$AB_NAMESPACE" \
    --endTime '0oqF99ED' \
    --limit '65' \
    --offset '37' \
    --orderNos 'xmW4cz6R,4htaqagJ,Yhj9BEJZ' \
    --sortBy 'v3NGxd9x' \
    --startTime 'vquq7ygF' \
    --status 'REFUND_FAILED' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 164 'QueryOrders' test.out

#- 165 GetOrderStatistics
./ng net.accelbyte.sdk.cli.Main platform getOrderStatistics \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 165 'GetOrderStatistics' test.out

#- 166 GetOrder
./ng net.accelbyte.sdk.cli.Main platform getOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo '9LPtqkEg' \
    > test.out 2>&1
eval_tap $? 166 'GetOrder' test.out

#- 167 RefundOrder
./ng net.accelbyte.sdk.cli.Main platform refundOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'UAA1u5EW' \
    --body '{"description": "4ji5XRfJ"}' \
    > test.out 2>&1
eval_tap $? 167 'RefundOrder' test.out

#- 168 GetPaymentCallbackConfig
eval_tap 0 168 'GetPaymentCallbackConfig # SKIP deprecated' test.out

#- 169 UpdatePaymentCallbackConfig
eval_tap 0 169 'UpdatePaymentCallbackConfig # SKIP deprecated' test.out

#- 170 GetPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentMerchantConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 170 'GetPaymentMerchantConfig' test.out

#- 171 UpdatePaymentDomainWhitelistConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentDomainWhitelistConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"domains": ["k9MDULE2", "b7qojWYP", "6RY8FiMX"]}' \
    > test.out 2>&1
eval_tap $? 171 'UpdatePaymentDomainWhitelistConfig' test.out

#- 172 QueryPaymentNotifications
./ng net.accelbyte.sdk.cli.Main platform queryPaymentNotifications \
    --namespace "$AB_NAMESPACE" \
    --endDate 'aQ8I7qlI' \
    --externalId 'cujzx3jk' \
    --limit '29' \
    --notificationSource 'CHECKOUT' \
    --notificationType 'sLQS78I3' \
    --offset '21' \
    --paymentOrderNo 'VK43egWX' \
    --startDate 'fNsN1a5P' \
    --status 'ERROR' \
    > test.out 2>&1
eval_tap $? 172 'QueryPaymentNotifications' test.out

#- 173 QueryPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform queryPaymentOrders \
    --namespace "$AB_NAMESPACE" \
    --channel 'EXTERNAL' \
    --extTxId 'xe28D8rE' \
    --limit '94' \
    --offset '22' \
    --status 'REFUND_FAILED' \
    > test.out 2>&1
eval_tap $? 173 'QueryPaymentOrders' test.out

#- 174 CreatePaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform createPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --body '{"currencyCode": "FgjA3B7a", "currencyNamespace": "yPk91MbL", "customParameters": {"yXUnbmOd": {}, "2mq1HnfW": {}, "7JPOvxSt": {}}, "description": "DKbLmN1k", "extOrderNo": "IpqpA0k5", "extUserId": "q43Sw5t2", "itemType": "SEASON", "language": "ZALn-oSHu_591", "metadata": {"5tdNyG33": "SWjQRd12", "MsxcxUfE": "QhdH4I86", "lLHHvovK": "xtwYNiEG"}, "notifyUrl": "eOX0Gaw0", "omitNotification": true, "platform": "WkDwwcGr", "price": 96, "recurringPaymentOrderNo": "W8DrzDsV", "region": "d0ELEhuK", "returnUrl": "UHShmcl5", "sandbox": true, "sku": "zF3CEUQW", "subscriptionId": "9dO037mh", "targetNamespace": "usB5hfsw", "targetUserId": "e0gYAarZ", "title": "Wrndwrfc"}' \
    > test.out 2>&1
eval_tap $? 174 'CreatePaymentOrderByDedicated' test.out

#- 175 ListExtOrderNoByExtTxId
./ng net.accelbyte.sdk.cli.Main platform listExtOrderNoByExtTxId \
    --namespace "$AB_NAMESPACE" \
    --extTxId 'BhJvQh2Q' \
    > test.out 2>&1
eval_tap $? 175 'ListExtOrderNoByExtTxId' test.out

#- 176 GetPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'kpcRPQju' \
    > test.out 2>&1
eval_tap $? 176 'GetPaymentOrder' test.out

#- 177 ChargePaymentOrder
./ng net.accelbyte.sdk.cli.Main platform chargePaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '8oRpblIu' \
    --body '{"extTxId": "SCfVBYm5", "paymentMethod": "gusLPf6T", "paymentProvider": "CHECKOUT"}' \
    > test.out 2>&1
eval_tap $? 177 'ChargePaymentOrder' test.out

#- 178 RefundPaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform refundPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'STTVG58C' \
    --body '{"description": "9EcWz44P"}' \
    > test.out 2>&1
eval_tap $? 178 'RefundPaymentOrderByDedicated' test.out

#- 179 SimulatePaymentOrderNotification
./ng net.accelbyte.sdk.cli.Main platform simulatePaymentOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '0TTKsDbp' \
    --body '{"amount": 64, "currencyCode": "WPBSqyzD", "notifyType": "CHARGE", "paymentProvider": "ALIPAY", "salesTax": 71, "vat": 83}' \
    > test.out 2>&1
eval_tap $? 179 'SimulatePaymentOrderNotification' test.out

#- 180 GetPaymentOrderChargeStatus
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrderChargeStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'B8TH6JNv' \
    > test.out 2>&1
eval_tap $? 180 'GetPaymentOrderChargeStatus' test.out

#- 181 GetPsnEntitlementOwnership
./ng net.accelbyte.sdk.cli.Main platform getPsnEntitlementOwnership \
    --entitlementLabel 'lZgXGUcd' \
    --namespace "$AB_NAMESPACE" \
    --body '{"accessToken": "rYUcu6JD", "serviceLabel": 15}' \
    > test.out 2>&1
eval_tap $? 181 'GetPsnEntitlementOwnership' test.out

#- 182 GetXboxEntitlementOwnership
./ng net.accelbyte.sdk.cli.Main platform getXboxEntitlementOwnership \
    --namespace "$AB_NAMESPACE" \
    --productSku 'anpYQNQG' \
    --body '{"delegationToken": "qK4KK6Jw", "sandboxId": "k2sGRMFG"}' \
    > test.out 2>&1
eval_tap $? 182 'GetXboxEntitlementOwnership' test.out

#- 183 GetPlatformEntitlementConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformEntitlementConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'IOS' \
    > test.out 2>&1
eval_tap $? 183 'GetPlatformEntitlementConfig' test.out

#- 184 UpdatePlatformEntitlementConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformEntitlementConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Xbox' \
    --body '{"allowedPlatformOrigins": ["Epic", "GooglePlay", "Nintendo"]}' \
    > test.out 2>&1
eval_tap $? 184 'UpdatePlatformEntitlementConfig' test.out

#- 185 GetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'IOS' \
    > test.out 2>&1
eval_tap $? 185 'GetPlatformWalletConfig' test.out

#- 186 UpdatePlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Epic' \
    --body '{"allowedBalanceOrigins": ["Xbox", "Other", "Xbox"]}' \
    > test.out 2>&1
eval_tap $? 186 'UpdatePlatformWalletConfig' test.out

#- 187 ResetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform resetPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Nintendo' \
    > test.out 2>&1
eval_tap $? 187 'ResetPlatformWalletConfig' test.out

#- 188 GetRevocationConfig
./ng net.accelbyte.sdk.cli.Main platform getRevocationConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 188 'GetRevocationConfig' test.out

#- 189 UpdateRevocationConfig
./ng net.accelbyte.sdk.cli.Main platform updateRevocationConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"entitlement": {"consumable": {"enabled": true, "strategy": "CUSTOM"}, "durable": {"enabled": false, "strategy": "CUSTOM"}}, "wallet": {"enabled": true, "strategy": "ALWAYS_REVOKE"}}' \
    > test.out 2>&1
eval_tap $? 189 'UpdateRevocationConfig' test.out

#- 190 DeleteRevocationConfig
./ng net.accelbyte.sdk.cli.Main platform deleteRevocationConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 190 'DeleteRevocationConfig' test.out

#- 191 QueryRevocationHistories
./ng net.accelbyte.sdk.cli.Main platform queryRevocationHistories \
    --namespace "$AB_NAMESPACE" \
    --endTime 'jfeIdTFT' \
    --limit '27' \
    --offset '77' \
    --source 'ORDER' \
    --startTime 'PgniLsHi' \
    --status 'SUCCESS' \
    --transactionId '1rbXv2dP' \
    --userId 'nX1Ct49Q' \
    > test.out 2>&1
eval_tap $? 191 'QueryRevocationHistories' test.out

#- 192 GetRevocationPluginConfig
./ng net.accelbyte.sdk.cli.Main platform getRevocationPluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 192 'GetRevocationPluginConfig' test.out

#- 193 UpdateRevocationPluginConfig
./ng net.accelbyte.sdk.cli.Main platform updateRevocationPluginConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appConfig": {"appName": "b7Bo97IY"}, "customConfig": {"connectionType": "INSECURE", "grpcServerAddress": "qBZb6BSg"}, "extendType": "CUSTOM"}' \
    > test.out 2>&1
eval_tap $? 193 'UpdateRevocationPluginConfig' test.out

#- 194 DeleteRevocationPluginConfig
./ng net.accelbyte.sdk.cli.Main platform deleteRevocationPluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 194 'DeleteRevocationPluginConfig' test.out

#- 195 UploadRevocationPluginConfigCertV2
./ng net.accelbyte.sdk.cli.Main platform uploadRevocationPluginConfigCertV2 \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 195 'UploadRevocationPluginConfigCertV2' test.out

#- 196 UploadRevocationPluginConfigCert
eval_tap 0 196 'UploadRevocationPluginConfigCert # SKIP deprecated' test.out

#- 197 CreateReward
./ng net.accelbyte.sdk.cli.Main platform createReward \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "2T9VWTU1", "eventTopic": "584Vhlr2", "maxAwarded": 31, "maxAwardedPerUser": 96, "namespaceExpression": "AgNLilyj", "rewardCode": "ddxhk3vB", "rewardConditions": [{"condition": "H2M8Y6VF", "conditionName": "LOtsXcVX", "eventName": "uxUqoQtK", "rewardItems": [{"duration": 58, "endDate": "1986-08-10T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "0WcfGdjH", "quantity": 89, "sku": "dGBnTFVr"}, {"duration": 85, "endDate": "1978-07-14T00:00:00Z", "identityType": "ITEM_ID", "itemId": "27lBGq0p", "quantity": 64, "sku": "dm0sRwwD"}, {"duration": 18, "endDate": "1987-01-01T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "WeaPSmTl", "quantity": 68, "sku": "5YnTuTjE"}]}, {"condition": "wSxPQ6Es", "conditionName": "5PKVETrk", "eventName": "Fa5w1cAN", "rewardItems": [{"duration": 88, "endDate": "1995-02-03T00:00:00Z", "identityType": "ITEM_ID", "itemId": "E1cvDd6i", "quantity": 83, "sku": "U3tVtpdE"}, {"duration": 7, "endDate": "1991-09-15T00:00:00Z", "identityType": "ITEM_ID", "itemId": "WbDrKy43", "quantity": 88, "sku": "MqVifBWM"}, {"duration": 78, "endDate": "1986-02-28T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "gkOaSuFD", "quantity": 29, "sku": "OePVLleZ"}]}, {"condition": "lOsPoaDY", "conditionName": "cQeQyoKr", "eventName": "1dJ8oOJM", "rewardItems": [{"duration": 55, "endDate": "1972-10-31T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "3D6g7PjE", "quantity": 29, "sku": "x8wSdzFq"}, {"duration": 69, "endDate": "1988-07-28T00:00:00Z", "identityType": "ITEM_ID", "itemId": "bwxIK8q0", "quantity": 91, "sku": "rAIla66w"}, {"duration": 84, "endDate": "1977-12-17T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "R26f7xHH", "quantity": 38, "sku": "gbSAg9wf"}]}], "userIdExpression": "8ceT4jNT"}' \
    > test.out 2>&1
eval_tap $? 197 'CreateReward' test.out

#- 198 QueryRewards
./ng net.accelbyte.sdk.cli.Main platform queryRewards \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'hgtjROTW' \
    --limit '55' \
    --offset '39' \
    --sortBy 'rewardCode:asc,namespace:asc' \
    > test.out 2>&1
eval_tap $? 198 'QueryRewards' test.out

#- 199 ExportRewards
./ng net.accelbyte.sdk.cli.Main platform exportRewards \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 199 'ExportRewards' test.out

#- 200 ImportRewards
./ng net.accelbyte.sdk.cli.Main platform importRewards \
    --namespace "$AB_NAMESPACE" \
    --replaceExisting  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 200 'ImportRewards' test.out

#- 201 GetReward
./ng net.accelbyte.sdk.cli.Main platform getReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'Ye7etJiD' \
    > test.out 2>&1
eval_tap $? 201 'GetReward' test.out

#- 202 UpdateReward
./ng net.accelbyte.sdk.cli.Main platform updateReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'VEeUu8NG' \
    --body '{"description": "1AeGZn7Z", "eventTopic": "zdO8vfGI", "maxAwarded": 63, "maxAwardedPerUser": 30, "namespaceExpression": "p2qCRQt0", "rewardCode": "SA6nEE0q", "rewardConditions": [{"condition": "4NDRTkx8", "conditionName": "W7nylEeq", "eventName": "SXmuz3m2", "rewardItems": [{"duration": 66, "endDate": "1980-04-02T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "e5v1j1Mf", "quantity": 15, "sku": "HdAShTny"}, {"duration": 57, "endDate": "1990-01-26T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "7OPi5Iz9", "quantity": 71, "sku": "76fvhfiM"}, {"duration": 68, "endDate": "1976-03-15T00:00:00Z", "identityType": "ITEM_ID", "itemId": "JyI9yb3q", "quantity": 82, "sku": "JgtJQ5RS"}]}, {"condition": "HGt7YbkJ", "conditionName": "mjwApJ8K", "eventName": "o2VDKpyj", "rewardItems": [{"duration": 48, "endDate": "1982-06-22T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "q5sM1iyO", "quantity": 14, "sku": "QPxsSdnG"}, {"duration": 85, "endDate": "1976-03-01T00:00:00Z", "identityType": "ITEM_ID", "itemId": "6EwwBOrv", "quantity": 56, "sku": "ufE3YVeF"}, {"duration": 76, "endDate": "1996-05-01T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "xmIBdNAB", "quantity": 27, "sku": "uOPrkBoM"}]}, {"condition": "ARtd1MJk", "conditionName": "Bcon2r68", "eventName": "thOQA9t2", "rewardItems": [{"duration": 32, "endDate": "1983-07-25T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "b2962rcZ", "quantity": 80, "sku": "4GN51vwf"}, {"duration": 74, "endDate": "1980-11-28T00:00:00Z", "identityType": "ITEM_ID", "itemId": "KfIMgKws", "quantity": 11, "sku": "CdFRrcW0"}, {"duration": 72, "endDate": "1987-07-17T00:00:00Z", "identityType": "ITEM_ID", "itemId": "vD7gXHs2", "quantity": 13, "sku": "WSPPhiSc"}]}], "userIdExpression": "UVfRtM20"}' \
    > test.out 2>&1
eval_tap $? 202 'UpdateReward' test.out

#- 203 DeleteReward
./ng net.accelbyte.sdk.cli.Main platform deleteReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'WKdKm2H6' \
    > test.out 2>&1
eval_tap $? 203 'DeleteReward' test.out

#- 204 CheckEventCondition
./ng net.accelbyte.sdk.cli.Main platform checkEventCondition \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'hjBV8aEY' \
    --body '{"payload": {"d11MFzhi": {}, "jtlWTAqN": {}, "ZKx5wGrY": {}}}' \
    > test.out 2>&1
eval_tap $? 204 'CheckEventCondition' test.out

#- 205 DeleteRewardConditionRecord
./ng net.accelbyte.sdk.cli.Main platform deleteRewardConditionRecord \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'ZF2pzNYN' \
    --body '{"conditionName": "8uPrbfhA", "userId": "5DjR4mf8"}' \
    > test.out 2>&1
eval_tap $? 205 'DeleteRewardConditionRecord' test.out

#- 206 QuerySections
./ng net.accelbyte.sdk.cli.Main platform querySections \
    --namespace "$AB_NAMESPACE" \
    --end '6XErvjXw' \
    --limit '77' \
    --offset '0' \
    --start '2XHKdDYl' \
    --storeId '31yFk887' \
    --viewId 'iJistMFQ' \
    > test.out 2>&1
eval_tap $? 206 'QuerySections' test.out

#- 207 CreateSection
./ng net.accelbyte.sdk.cli.Main platform createSection \
    --namespace "$AB_NAMESPACE" \
    --storeId 'lA2t7eR9' \
    --body '{"active": false, "displayOrder": 83, "endDate": "1975-08-12T00:00:00Z", "ext": {"87qSMzqT": {}, "031fC9DH": {}, "QxDwRJD6": {}}, "fixedPeriodRotationConfig": {"backfillType": "NONE", "duration": 96, "itemCount": 16, "rule": "SEQUENCE"}, "items": [{"id": "b9dR53E9", "sku": "Qnq1B1Te"}, {"id": "zcowrj30", "sku": "soxK4qlu"}, {"id": "Og3OFibF", "sku": "eHI15bL5"}], "localizations": {"rKlzO7hZ": {"description": "AmBB538m", "localExt": {"p9U2oHCy": {}, "fuEEf1pk": {}, "Sm0LAGUR": {}}, "longDescription": "4SzqItJ9", "title": "D1XEX8hs"}, "xUgUD7TI": {"description": "qJ07RxYq", "localExt": {"43qNORA7": {}, "5GFB3xON": {}, "4xfIRerZ": {}}, "longDescription": "rDOHPKjP", "title": "DqIeS4ON"}, "HwLEYUXb": {"description": "GMa3hByz", "localExt": {"31fckSoK": {}, "rapralIN": {}, "Oc2s2fGH": {}}, "longDescription": "bcfEhTEu", "title": "dXNanxWI"}}, "name": "vdmxaDb2", "rotationType": "FIXED_PERIOD", "startDate": "1986-05-09T00:00:00Z", "viewId": "7l2dD1TF"}' \
    > test.out 2>&1
eval_tap $? 207 'CreateSection' test.out

#- 208 PurgeExpiredSection
./ng net.accelbyte.sdk.cli.Main platform purgeExpiredSection \
    --namespace "$AB_NAMESPACE" \
    --storeId 'crSVvgcK' \
    > test.out 2>&1
eval_tap $? 208 'PurgeExpiredSection' test.out

#- 209 GetSection
./ng net.accelbyte.sdk.cli.Main platform getSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId '0g7iFxYb' \
    --storeId 'ZJlrA6lp' \
    > test.out 2>&1
eval_tap $? 209 'GetSection' test.out

#- 210 UpdateSection
./ng net.accelbyte.sdk.cli.Main platform updateSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'D82tAENG' \
    --storeId 'erHYw5DO' \
    --body '{"active": true, "displayOrder": 53, "endDate": "1993-10-14T00:00:00Z", "ext": {"e347xWK6": {}, "54iDF9db": {}, "r6uDKo4v": {}}, "fixedPeriodRotationConfig": {"backfillType": "CUSTOM", "duration": 18, "itemCount": 79, "rule": "LOOP"}, "items": [{"id": "wuMva781", "sku": "hJDwgtOB"}, {"id": "myXrmVhS", "sku": "42v2ICTk"}, {"id": "zAhH1wN1", "sku": "tm0RJgAZ"}], "localizations": {"Jt54W6nf": {"description": "y5RLU9qg", "localExt": {"N6VjZU0b": {}, "BFkSb270": {}, "4arbICQD": {}}, "longDescription": "D5sxdhc9", "title": "4R4UMtAE"}, "d8cGB83T": {"description": "3YHy3jRV", "localExt": {"LaxhBoFV": {}, "1pieF6i2": {}, "HzCASdP7": {}}, "longDescription": "6RJlWLsb", "title": "FoLSbx9Y"}, "ZEyZPJXc": {"description": "SzMSyYzN", "localExt": {"yCF6z9pm": {}, "Q1MqJZCv": {}, "xAVsAA8f": {}}, "longDescription": "XvnLwFkm", "title": "Vi27MgcD"}}, "name": "PKgmhhwC", "rotationType": "FIXED_PERIOD", "startDate": "1977-02-20T00:00:00Z", "viewId": "hE0IBTsb"}' \
    > test.out 2>&1
eval_tap $? 210 'UpdateSection' test.out

#- 211 DeleteSection
./ng net.accelbyte.sdk.cli.Main platform deleteSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'dbmgwcjC' \
    --storeId 'EbcDajEi' \
    > test.out 2>&1
eval_tap $? 211 'DeleteSection' test.out

#- 212 ListStores
./ng net.accelbyte.sdk.cli.Main platform listStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 212 'ListStores' test.out

#- 213 CreateStore
./ng net.accelbyte.sdk.cli.Main platform createStore \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultLanguage": "gzeEV0gP", "defaultRegion": "T55pawk2", "description": "lxZtlARN", "supportedLanguages": ["3aJFdpjG", "hdRhyqbF", "B4AxyMI3"], "supportedRegions": ["I2kawOPB", "noAUxayD", "zfWzGzSk"], "title": "09r4ZpQK"}' \
    > test.out 2>&1
eval_tap $? 213 'CreateStore' test.out

#- 214 GetCatalogDefinition
./ng net.accelbyte.sdk.cli.Main platform getCatalogDefinition \
    --namespace "$AB_NAMESPACE" \
    --catalogType 'ITEM' \
    > test.out 2>&1
eval_tap $? 214 'GetCatalogDefinition' test.out

#- 215 DownloadCSVTemplates
./ng net.accelbyte.sdk.cli.Main platform downloadCSVTemplates \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 215 'DownloadCSVTemplates' test.out

#- 216 ExportStoreByCSV
./ng net.accelbyte.sdk.cli.Main platform exportStoreByCSV \
    --namespace "$AB_NAMESPACE" \
    --body '{"catalogType": "CATEGORY", "fieldsToBeIncluded": ["K03WrohT", "4I19YAmg", "ktguqiYH"], "idsToBeExported": ["0vGYTVjy", "aXLIlSHi", "ixaPK2Mb"], "storeId": "63ykyNXX"}' \
    > test.out 2>&1
eval_tap $? 216 'ExportStoreByCSV' test.out

#- 217 ImportStore
eval_tap 0 217 'ImportStore # SKIP deprecated' test.out

#- 218 GetPublishedStore
./ng net.accelbyte.sdk.cli.Main platform getPublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 218 'GetPublishedStore' test.out

#- 219 DeletePublishedStore
./ng net.accelbyte.sdk.cli.Main platform deletePublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 219 'DeletePublishedStore' test.out

#- 220 GetPublishedStoreBackup
./ng net.accelbyte.sdk.cli.Main platform getPublishedStoreBackup \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 220 'GetPublishedStoreBackup' test.out

#- 221 RollbackPublishedStore
./ng net.accelbyte.sdk.cli.Main platform rollbackPublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 221 'RollbackPublishedStore' test.out

#- 222 GetStore
./ng net.accelbyte.sdk.cli.Main platform getStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'BGIx5Vyy' \
    > test.out 2>&1
eval_tap $? 222 'GetStore' test.out

#- 223 UpdateStore
./ng net.accelbyte.sdk.cli.Main platform updateStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'FAt77sBx' \
    --body '{"defaultLanguage": "Va6PV3IJ", "defaultRegion": "nm3GVvcz", "description": "MHmiD8L6", "supportedLanguages": ["t6QH5SMn", "uCVrTMSl", "t1cEEDM7"], "supportedRegions": ["fU3DN3se", "MysRpLP8", "lbbOTtVj"], "title": "c5ye4KKV"}' \
    > test.out 2>&1
eval_tap $? 223 'UpdateStore' test.out

#- 224 DeleteStore
./ng net.accelbyte.sdk.cli.Main platform deleteStore \
    --namespace "$AB_NAMESPACE" \
    --storeId '47q3sWaU' \
    > test.out 2>&1
eval_tap $? 224 'DeleteStore' test.out

#- 225 QueryChanges
./ng net.accelbyte.sdk.cli.Main platform queryChanges \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ouEaEQiT' \
    --action 'DELETE' \
    --itemSku '8EvBwjVA' \
    --itemType 'INGAMEITEM' \
    --limit '90' \
    --offset '15' \
    --selected  \
    --sortBy 'createdAt,updatedAt,updatedAt:desc' \
    --status 'UNPUBLISHED' \
    --type 'ITEM' \
    --updatedAtEnd 'xqp2zXAK' \
    --updatedAtStart 'RtpQ8pIr' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 225 'QueryChanges' test.out

#- 226 PublishAll
./ng net.accelbyte.sdk.cli.Main platform publishAll \
    --namespace "$AB_NAMESPACE" \
    --storeId 'YLlpE8tG' \
    > test.out 2>&1
eval_tap $? 226 'PublishAll' test.out

#- 227 PublishSelected
./ng net.accelbyte.sdk.cli.Main platform publishSelected \
    --namespace "$AB_NAMESPACE" \
    --storeId 'uec9IVD4' \
    > test.out 2>&1
eval_tap $? 227 'PublishSelected' test.out

#- 228 SelectAllRecords
./ng net.accelbyte.sdk.cli.Main platform selectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'UwnV6NU4' \
    > test.out 2>&1
eval_tap $? 228 'SelectAllRecords' test.out

#- 229 SelectAllRecordsByCriteria
./ng net.accelbyte.sdk.cli.Main platform selectAllRecordsByCriteria \
    --namespace "$AB_NAMESPACE" \
    --storeId 'mYGvqTtM' \
    --action 'CREATE' \
    --itemSku 'JBCiJILY' \
    --itemType 'INGAMEITEM' \
    --selected  \
    --type 'VIEW' \
    --updatedAtEnd 't3LrP7J1' \
    --updatedAtStart 'vWJwQvMQ' \
    > test.out 2>&1
eval_tap $? 229 'SelectAllRecordsByCriteria' test.out

#- 230 GetStatistic
./ng net.accelbyte.sdk.cli.Main platform getStatistic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'LUvITqjD' \
    --action 'DELETE' \
    --itemSku 'Dvjd2EbY' \
    --itemType 'BUNDLE' \
    --type 'CATEGORY' \
    --updatedAtEnd 'LGkLv6gB' \
    --updatedAtStart 'Wj3sDecw' \
    > test.out 2>&1
eval_tap $? 230 'GetStatistic' test.out

#- 231 UnselectAllRecords
./ng net.accelbyte.sdk.cli.Main platform unselectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId '2aZVUqkG' \
    > test.out 2>&1
eval_tap $? 231 'UnselectAllRecords' test.out

#- 232 SelectRecord
./ng net.accelbyte.sdk.cli.Main platform selectRecord \
    --changeId 'Qvvc4BWa' \
    --namespace "$AB_NAMESPACE" \
    --storeId '742GJDus' \
    > test.out 2>&1
eval_tap $? 232 'SelectRecord' test.out

#- 233 UnselectRecord
./ng net.accelbyte.sdk.cli.Main platform unselectRecord \
    --changeId 'KC6rG94t' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'p2UNExGz' \
    > test.out 2>&1
eval_tap $? 233 'UnselectRecord' test.out

#- 234 CloneStore
./ng net.accelbyte.sdk.cli.Main platform cloneStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'MDOHB9N7' \
    --targetStoreId 'kKBjnf8o' \
    > test.out 2>&1
eval_tap $? 234 'CloneStore' test.out

#- 235 ExportStore
eval_tap 0 235 'ExportStore # SKIP deprecated' test.out

#- 236 QueryImportHistory
./ng net.accelbyte.sdk.cli.Main platform queryImportHistory \
    --namespace "$AB_NAMESPACE" \
    --storeId 'QuLsqhxF' \
    --end 'Y0JzluPU' \
    --limit '7' \
    --offset '9' \
    --sortBy '2HyOvrFl' \
    --start 'VM29MDw4' \
    --success  \
    > test.out 2>&1
eval_tap $? 236 'QueryImportHistory' test.out

#- 237 ImportStoreByCSV
./ng net.accelbyte.sdk.cli.Main platform importStoreByCSV \
    --namespace "$AB_NAMESPACE" \
    --storeId '8jsQalQX' \
    --category 'tmp.dat' \
    --display 'tmp.dat' \
    --item 'tmp.dat' \
    --notes 'lfqojUtK' \
    --section 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 237 'ImportStoreByCSV' test.out

#- 238 QuerySubscriptions
./ng net.accelbyte.sdk.cli.Main platform querySubscriptions \
    --namespace "$AB_NAMESPACE" \
    --chargeStatus 'RECURRING_CHARGING' \
    --itemId 'RijWxYhe' \
    --limit '33' \
    --offset '54' \
    --sku 'iR3tWB4S' \
    --status 'INIT' \
    --subscribedBy 'USER' \
    --userId 'tfx47zfb' \
    > test.out 2>&1
eval_tap $? 238 'QuerySubscriptions' test.out

#- 239 RecurringChargeSubscription
./ng net.accelbyte.sdk.cli.Main platform recurringChargeSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'D44jCVM4' \
    > test.out 2>&1
eval_tap $? 239 'RecurringChargeSubscription' test.out

#- 240 GetTicketDynamic
./ng net.accelbyte.sdk.cli.Main platform getTicketDynamic \
    --boothName 'r8ef0p8q' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 240 'GetTicketDynamic' test.out

#- 241 DecreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform decreaseTicketSale \
    --boothName 'bMcrUNnj' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "rbyTPwt0"}' \
    > test.out 2>&1
eval_tap $? 241 'DecreaseTicketSale' test.out

#- 242 GetTicketBoothID
./ng net.accelbyte.sdk.cli.Main platform getTicketBoothID \
    --boothName 'aYjCcW7V' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 242 'GetTicketBoothID' test.out

#- 243 IncreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform increaseTicketSale \
    --boothName 'nu31npAB' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 85, "orderNo": "RKMiCI7r"}' \
    > test.out 2>&1
eval_tap $? 243 'IncreaseTicketSale' test.out

#- 244 Commit
./ng net.accelbyte.sdk.cli.Main platform commit \
    --namespace "$AB_NAMESPACE" \
    --body '{"actions": [{"operations": [{"creditPayload": {"balanceOrigin": "Playstation", "count": 3, "currencyCode": "4Kddwpbd", "expireAt": "1977-09-10T00:00:00Z"}, "debitPayload": {"count": 63, "currencyCode": "bjfcdGgP", "walletPlatform": "GooglePlay"}, "fulFillItemPayload": {"count": 1, "entitlementCollectionId": "rP112BA6", "entitlementOrigin": "Nintendo", "itemIdentity": "gYoPYE18", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 99, "entitlementId": "IgFucyVI"}, "type": "DEBIT_WALLET"}, {"creditPayload": {"balanceOrigin": "Steam", "count": 31, "currencyCode": "O3LPhw0j", "expireAt": "1998-09-26T00:00:00Z"}, "debitPayload": {"count": 8, "currencyCode": "01Dd73Qm", "walletPlatform": "Oculus"}, "fulFillItemPayload": {"count": 50, "entitlementCollectionId": "CQUfLGsa", "entitlementOrigin": "System", "itemIdentity": "GYCHBHtr", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 78, "entitlementId": "vTRIwAJB"}, "type": "FULFILL_ITEM"}, {"creditPayload": {"balanceOrigin": "Steam", "count": 46, "currencyCode": "v4GHkbJk", "expireAt": "1997-06-20T00:00:00Z"}, "debitPayload": {"count": 95, "currencyCode": "Vg8QWgfv", "walletPlatform": "Other"}, "fulFillItemPayload": {"count": 62, "entitlementCollectionId": "xmNKv38L", "entitlementOrigin": "Playstation", "itemIdentity": "eTMQ8Rcl", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 64, "entitlementId": "o3DCtajN"}, "type": "DEBIT_WALLET"}], "userId": "IwWMz4VW"}, {"operations": [{"creditPayload": {"balanceOrigin": "System", "count": 96, "currencyCode": "KzZhcZGH", "expireAt": "1998-05-30T00:00:00Z"}, "debitPayload": {"count": 89, "currencyCode": "RjPYPGqF", "walletPlatform": "Nintendo"}, "fulFillItemPayload": {"count": 22, "entitlementCollectionId": "7akMIkzB", "entitlementOrigin": "IOS", "itemIdentity": "KPcL2lyi", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 51, "entitlementId": "z0B9mt0b"}, "type": "REVOKE_ENTITLEMENT"}, {"creditPayload": {"balanceOrigin": "Playstation", "count": 26, "currencyCode": "oCZhApEc", "expireAt": "1977-05-18T00:00:00Z"}, "debitPayload": {"count": 87, "currencyCode": "x4zXF2g8", "walletPlatform": "Xbox"}, "fulFillItemPayload": {"count": 90, "entitlementCollectionId": "IRXaokGi", "entitlementOrigin": "Epic", "itemIdentity": "tzJd2sXU", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 63, "entitlementId": "JmlZDBMg"}, "type": "FULFILL_ITEM"}, {"creditPayload": {"balanceOrigin": "Other", "count": 46, "currencyCode": "ed8mGHiQ", "expireAt": "1998-12-21T00:00:00Z"}, "debitPayload": {"count": 66, "currencyCode": "p89FkUUe", "walletPlatform": "Epic"}, "fulFillItemPayload": {"count": 3, "entitlementCollectionId": "K7OLn7zj", "entitlementOrigin": "Other", "itemIdentity": "J1k0ZHeK", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 53, "entitlementId": "OEx28OSO"}, "type": "CREDIT_WALLET"}], "userId": "S0erb57b"}, {"operations": [{"creditPayload": {"balanceOrigin": "Steam", "count": 29, "currencyCode": "XZJx0Kgy", "expireAt": "1972-09-30T00:00:00Z"}, "debitPayload": {"count": 28, "currencyCode": "3CTM0OOH", "walletPlatform": "Nintendo"}, "fulFillItemPayload": {"count": 97, "entitlementCollectionId": "mgoUdEMY", "entitlementOrigin": "Epic", "itemIdentity": "6ZgnbwPk", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 11, "entitlementId": "0osRlZRl"}, "type": "CREDIT_WALLET"}, {"creditPayload": {"balanceOrigin": "GooglePlay", "count": 58, "currencyCode": "PeiAm540", "expireAt": "1972-03-13T00:00:00Z"}, "debitPayload": {"count": 88, "currencyCode": "PS93BFNl", "walletPlatform": "Oculus"}, "fulFillItemPayload": {"count": 4, "entitlementCollectionId": "MjzNL8iO", "entitlementOrigin": "Steam", "itemIdentity": "FTJpKwtX", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 12, "entitlementId": "jJYAiH6r"}, "type": "CREDIT_WALLET"}, {"creditPayload": {"balanceOrigin": "Other", "count": 81, "currencyCode": "shGlCWWn", "expireAt": "1986-12-10T00:00:00Z"}, "debitPayload": {"count": 5, "currencyCode": "3pIIOYky", "walletPlatform": "Playstation"}, "fulFillItemPayload": {"count": 37, "entitlementCollectionId": "ujYtmaE7", "entitlementOrigin": "Xbox", "itemIdentity": "be29G3xW", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 46, "entitlementId": "pXUsWbGx"}, "type": "REVOKE_ENTITLEMENT"}], "userId": "ZdmNaEMd"}], "metadata": {"proeEi3h": {}, "Y67944WN": {}, "FNYWgPu8": {}}, "needPreCheck": false, "transactionId": "9Nq30u3W", "type": "Yw2BWxDX"}' \
    > test.out 2>&1
eval_tap $? 244 'Commit' test.out

#- 245 GetTradeHistoryByCriteria
./ng net.accelbyte.sdk.cli.Main platform getTradeHistoryByCriteria \
    --namespace "$AB_NAMESPACE" \
    --limit '12' \
    --offset '4' \
    --status 'INIT' \
    --type 'V4r4vIIR' \
    --userId 'qrGuCbV9' \
    > test.out 2>&1
eval_tap $? 245 'GetTradeHistoryByCriteria' test.out

#- 246 GetTradeHistoryByTransactionId
./ng net.accelbyte.sdk.cli.Main platform getTradeHistoryByTransactionId \
    --namespace "$AB_NAMESPACE" \
    --transactionId 'h0Wb6PdD' \
    > test.out 2>&1
eval_tap $? 246 'GetTradeHistoryByTransactionId' test.out

#- 247 UnlockSteamUserAchievement
./ng net.accelbyte.sdk.cli.Main platform unlockSteamUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'bXDKNGNi' \
    --body '{"achievements": [{"id": "17eyuZoG", "value": 11}, {"id": "FwGlrn9X", "value": 90}, {"id": "kaua2OvP", "value": 49}], "steamUserId": "sKuoac0Y"}' \
    > test.out 2>&1
eval_tap $? 247 'UnlockSteamUserAchievement' test.out

#- 248 GetXblUserAchievements
./ng net.accelbyte.sdk.cli.Main platform getXblUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'dNrWoHxG' \
    --xboxUserId 'rx7J03RL' \
    > test.out 2>&1
eval_tap $? 248 'GetXblUserAchievements' test.out

#- 249 UpdateXblUserAchievement
./ng net.accelbyte.sdk.cli.Main platform updateXblUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId '73jJdvDW' \
    --body '{"achievements": [{"id": "hJFHNZxE", "percentComplete": 58}, {"id": "4xsvXeq0", "percentComplete": 40}, {"id": "jrz9I7jv", "percentComplete": 55}], "serviceConfigId": "F85ljSH8", "titleId": "pk2p2Xv4", "xboxUserId": "CpgtcReb"}' \
    > test.out 2>&1
eval_tap $? 249 'UpdateXblUserAchievement' test.out

#- 250 AnonymizeCampaign
./ng net.accelbyte.sdk.cli.Main platform anonymizeCampaign \
    --namespace "$AB_NAMESPACE" \
    --userId 'LIEuYByM' \
    > test.out 2>&1
eval_tap $? 250 'AnonymizeCampaign' test.out

#- 251 AnonymizeEntitlement
./ng net.accelbyte.sdk.cli.Main platform anonymizeEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'GtfxV9Zb' \
    > test.out 2>&1
eval_tap $? 251 'AnonymizeEntitlement' test.out

#- 252 AnonymizeFulfillment
./ng net.accelbyte.sdk.cli.Main platform anonymizeFulfillment \
    --namespace "$AB_NAMESPACE" \
    --userId 'Txw5uy3G' \
    > test.out 2>&1
eval_tap $? 252 'AnonymizeFulfillment' test.out

#- 253 AnonymizeIntegration
./ng net.accelbyte.sdk.cli.Main platform anonymizeIntegration \
    --namespace "$AB_NAMESPACE" \
    --userId 'wNClOPv2' \
    > test.out 2>&1
eval_tap $? 253 'AnonymizeIntegration' test.out

#- 254 AnonymizeOrder
./ng net.accelbyte.sdk.cli.Main platform anonymizeOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'GvYAmeWw' \
    > test.out 2>&1
eval_tap $? 254 'AnonymizeOrder' test.out

#- 255 AnonymizePayment
./ng net.accelbyte.sdk.cli.Main platform anonymizePayment \
    --namespace "$AB_NAMESPACE" \
    --userId 'SMIH53I0' \
    > test.out 2>&1
eval_tap $? 255 'AnonymizePayment' test.out

#- 256 AnonymizeRevocation
./ng net.accelbyte.sdk.cli.Main platform anonymizeRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId 'GrPzhvZP' \
    > test.out 2>&1
eval_tap $? 256 'AnonymizeRevocation' test.out

#- 257 AnonymizeSubscription
./ng net.accelbyte.sdk.cli.Main platform anonymizeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'ea4r27Nx' \
    > test.out 2>&1
eval_tap $? 257 'AnonymizeSubscription' test.out

#- 258 AnonymizeWallet
./ng net.accelbyte.sdk.cli.Main platform anonymizeWallet \
    --namespace "$AB_NAMESPACE" \
    --userId 'Yhlh9U2O' \
    > test.out 2>&1
eval_tap $? 258 'AnonymizeWallet' test.out

#- 259 GetUserDLCByPlatform
./ng net.accelbyte.sdk.cli.Main platform getUserDLCByPlatform \
    --namespace "$AB_NAMESPACE" \
    --userId '3xo9OiMk' \
    --type 'STEAM' \
    > test.out 2>&1
eval_tap $? 259 'GetUserDLCByPlatform' test.out

#- 260 GetUserDLC
./ng net.accelbyte.sdk.cli.Main platform getUserDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'nsZqd9or' \
    --includeAllNamespaces  \
    --status 'FULFILLED' \
    --type 'STEAM' \
    > test.out 2>&1
eval_tap $? 260 'GetUserDLC' test.out

#- 261 QueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'gdEtRaeU' \
    --activeOnly  \
    --appType 'DLC' \
    --collectionId 'NISQnTiK' \
    --entitlementClazz 'MEDIA' \
    --entitlementName 'PRshULfI' \
    --features 'CjXqMN9R,RiJglnyG,UfNQhrN3' \
    --fuzzyMatchName  \
    --ignoreActiveDate  \
    --itemId '32BF2KlP,4EWPbpbW,3ahmRPPB' \
    --limit '73' \
    --offset '91' \
    --origin 'Oculus' \
    > test.out 2>&1
eval_tap $? 261 'QueryUserEntitlements' test.out

#- 262 GrantUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform grantUserEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'Uc9dYrBe' \
    --body '[{"collectionId": "WNd8gOu6", "endDate": "1982-06-03T00:00:00Z", "grantedCode": "KSDVU949", "itemId": "P81IEF1D", "itemNamespace": "agkyaSoG", "language": "HCB", "metadata": {"NsNID16y": {}, "Svxt4sZk": {}, "WEsakXeP": {}}, "origin": "Other", "quantity": 82, "region": "FbWTEQZE", "source": "ACHIEVEMENT", "startDate": "1978-05-01T00:00:00Z", "storeId": "Z5JESPcJ"}, {"collectionId": "FygcOedH", "endDate": "1974-03-09T00:00:00Z", "grantedCode": "3VDWBbaT", "itemId": "g74mkLDI", "itemNamespace": "ADvAokGD", "language": "lWyu-IKxm_994", "metadata": {"vIWwaDOx": {}, "CCqdMkEg": {}, "QeC03JW5": {}}, "origin": "IOS", "quantity": 51, "region": "LnR9XXQQ", "source": "PROMOTION", "startDate": "1984-12-10T00:00:00Z", "storeId": "aMZKJJNQ"}, {"collectionId": "qaWbXZ2P", "endDate": "1998-05-21T00:00:00Z", "grantedCode": "c73zDk7h", "itemId": "Dh7vACHg", "itemNamespace": "SgETe9zE", "language": "neVW-egeQ", "metadata": {"dmi63gGa": {}, "qOO1iPZT": {}, "sCbyUPPT": {}}, "origin": "System", "quantity": 14, "region": "dKdS47vU", "source": "PURCHASE", "startDate": "1998-03-09T00:00:00Z", "storeId": "SqqilcfY"}]' \
    > test.out 2>&1
eval_tap $? 262 'GrantUserEntitlement' test.out

#- 263 GetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId '1rNSfxEe' \
    --activeOnly  \
    --appId 'Ie2O22uo' \
    > test.out 2>&1
eval_tap $? 263 'GetUserAppEntitlementByAppId' test.out

#- 264 QueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId '2jZH4CiO' \
    --activeOnly  \
    --limit '14' \
    --offset '74' \
    --appType 'DLC' \
    > test.out 2>&1
eval_tap $? 264 'QueryUserEntitlementsByAppType' test.out

#- 265 GetUserEntitlementsByIds
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementsByIds \
    --namespace "$AB_NAMESPACE" \
    --userId '8cbDprDO' \
    --ids 'nOWAvwh1,qW4UT8jl,kRyc0dVO' \
    > test.out 2>&1
eval_tap $? 265 'GetUserEntitlementsByIds' test.out

#- 266 GetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'Q1R4kaBX' \
    --activeOnly  \
    --entitlementClazz 'MEDIA' \
    --platform 'wXZWYoEQ' \
    --itemId 'ja8epGwY' \
    > test.out 2>&1
eval_tap $? 266 'GetUserEntitlementByItemId' test.out

#- 267 GetUserActiveEntitlementsByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserActiveEntitlementsByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'kqJEWqjc' \
    --ids 'ggbwmLrW,Q8crqgrA,DYD9bWP2' \
    --platform 'OowXW0iL' \
    > test.out 2>&1
eval_tap $? 267 'GetUserActiveEntitlementsByItemIds' test.out

#- 268 GetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'ANe6PMJM' \
    --activeOnly  \
    --entitlementClazz 'LOOTBOX' \
    --platform 'l5F6SeFH' \
    --sku 'AdUywVUF' \
    > test.out 2>&1
eval_tap $? 268 'GetUserEntitlementBySku' test.out

#- 269 ExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'C9QwGjRz' \
    --appIds 'y4yUtY6F,MDEntkFG,Gem4YuCR' \
    --itemIds 'SMh5fZMq,nIYdz8Pt,SAXWuZAR' \
    --platform '8pK2TGQm' \
    --skus 't154VB7e,Alt4raXK,6zmVeblH' \
    > test.out 2>&1
eval_tap $? 269 'ExistsAnyUserActiveEntitlement' test.out

#- 270 ExistsAnyUserActiveEntitlementByItemIds
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlementByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'k70UILNZ' \
    --platform 'd4bnZ4jv' \
    --itemIds 'B83pHw5m,GpL1kwHy,uaFZ0PRx' \
    > test.out 2>&1
eval_tap $? 270 'ExistsAnyUserActiveEntitlementByItemIds' test.out

#- 271 GetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'ij45o2Q1' \
    --appId 'DVoKlxDU' \
    > test.out 2>&1
eval_tap $? 271 'GetUserAppEntitlementOwnershipByAppId' test.out

#- 272 GetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'gSIxhEG8' \
    --entitlementClazz 'APP' \
    --platform 'nmdiMsuQ' \
    --itemId 'neFk82FY' \
    > test.out 2>&1
eval_tap $? 272 'GetUserEntitlementOwnershipByItemId' test.out

#- 273 GetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'IdBd5tu3' \
    --ids 'OQLE7Bqc,6sX1zcvR,JK4F1PA8' \
    --platform '4qCbMQC9' \
    > test.out 2>&1
eval_tap $? 273 'GetUserEntitlementOwnershipByItemIds' test.out

#- 274 GetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'YTXTkJEW' \
    --entitlementClazz 'APP' \
    --platform 'YQwVSIjS' \
    --sku 'hqx9PYYC' \
    > test.out 2>&1
eval_tap $? 274 'GetUserEntitlementOwnershipBySku' test.out

#- 275 RevokeAllEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeAllEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'iew74cOP' \
    > test.out 2>&1
eval_tap $? 275 'RevokeAllEntitlements' test.out

#- 276 RevokeUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'DexY7x4I' \
    --entitlementIds 'xqGYR6mD' \
    > test.out 2>&1
eval_tap $? 276 'RevokeUserEntitlements' test.out

#- 277 GetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlement \
    --entitlementId 'BQIDKuIU' \
    --namespace "$AB_NAMESPACE" \
    --userId 'K225aYaE' \
    > test.out 2>&1
eval_tap $? 277 'GetUserEntitlement' test.out

#- 278 UpdateUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform updateUserEntitlement \
    --entitlementId 'ZlwPz2Hd' \
    --namespace "$AB_NAMESPACE" \
    --userId '0WZDAKzB' \
    --body '{"collectionId": "64qEmsrK", "endDate": "1979-10-16T00:00:00Z", "nullFieldList": ["mCDxYGXY", "ODC8U6Z6", "CxvsByWu"], "origin": "IOS", "reason": "kn02sMCb", "startDate": "1988-07-31T00:00:00Z", "status": "INACTIVE", "useCount": 86}' \
    > test.out 2>&1
eval_tap $? 278 'UpdateUserEntitlement' test.out

#- 279 ConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform consumeUserEntitlement \
    --entitlementId 'TwAt7crU' \
    --namespace "$AB_NAMESPACE" \
    --userId 'MXwNt8U5' \
    --body '{"metadata": {"YFjZT6Hn": {}, "O3TPw2XL": {}, "kfV7xM6T": {}}, "options": ["x8cQSLA9", "vTbJ4vkD", "lYBw6EzI"], "platform": "7VTFuBfT", "requestId": "xEt9tYib", "useCount": 86}' \
    > test.out 2>&1
eval_tap $? 279 'ConsumeUserEntitlement' test.out

#- 280 DisableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform disableUserEntitlement \
    --entitlementId 'iCh8Rlvh' \
    --namespace "$AB_NAMESPACE" \
    --userId 'o2ZKlMYR' \
    > test.out 2>&1
eval_tap $? 280 'DisableUserEntitlement' test.out

#- 281 EnableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform enableUserEntitlement \
    --entitlementId '4ho7FbCW' \
    --namespace "$AB_NAMESPACE" \
    --userId 'hby1e48j' \
    > test.out 2>&1
eval_tap $? 281 'EnableUserEntitlement' test.out

#- 282 GetUserEntitlementHistories
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementHistories \
    --entitlementId 'GRF2fKLI' \
    --namespace "$AB_NAMESPACE" \
    --userId 'eFOyb3Kz' \
    > test.out 2>&1
eval_tap $? 282 'GetUserEntitlementHistories' test.out

#- 283 RevokeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlement \
    --entitlementId 'prgiwlPF' \
    --namespace "$AB_NAMESPACE" \
    --userId 'cLgHhCnQ' \
    --body '{"metadata": {"4kn4P8L9": {}, "49tvl8JM": {}, "xjiDKSy7": {}}}' \
    > test.out 2>&1
eval_tap $? 283 'RevokeUserEntitlement' test.out

#- 284 RevokeUserEntitlementByUseCount
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlementByUseCount \
    --entitlementId 'blwqg8A4' \
    --namespace "$AB_NAMESPACE" \
    --userId 'BMRbcCTZ' \
    --body '{"reason": "SSv4l7xm", "useCount": 59}' \
    > test.out 2>&1
eval_tap $? 284 'RevokeUserEntitlementByUseCount' test.out

#- 285 PreCheckRevokeUserEntitlementByUseCount
./ng net.accelbyte.sdk.cli.Main platform preCheckRevokeUserEntitlementByUseCount \
    --entitlementId 'rgWAbp3L' \
    --namespace "$AB_NAMESPACE" \
    --userId 'wpK2I2Ev' \
    --quantity '29' \
    > test.out 2>&1
eval_tap $? 285 'PreCheckRevokeUserEntitlementByUseCount' test.out

#- 286 RevokeUseCount
eval_tap 0 286 'RevokeUseCount # SKIP deprecated' test.out

#- 287 SellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform sellUserEntitlement \
    --entitlementId 'itkSAFxa' \
    --namespace "$AB_NAMESPACE" \
    --userId 'asu6Kchg' \
    --body '{"platform": "foP9kB9j", "requestId": "5zJ2J3xt", "useCount": 39}' \
    > test.out 2>&1
eval_tap $? 287 'SellUserEntitlement' test.out

#- 288 FulfillItem
./ng net.accelbyte.sdk.cli.Main platform fulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'JpkmkxaB' \
    --body '{"duration": 9, "endDate": "1976-12-23T00:00:00Z", "entitlementCollectionId": "EDZFloOy", "entitlementOrigin": "IOS", "itemId": "ZxiijeN0", "itemSku": "5Y307oPz", "language": "KIuFZQcP", "metadata": {"ac2MF36e": {}, "dyVzo0Qu": {}, "4vXZp6bL": {}}, "order": {"currency": {"currencyCode": "vyrugKAm", "currencySymbol": "9UwDfDCi", "currencyType": "VIRTUAL", "decimals": 53, "namespace": "Gw91ZHhJ"}, "ext": {"tlUnMe9e": {}, "BQnwmrAt": {}, "2b0JBq9t": {}}, "free": true}, "orderNo": "yfo4QG6V", "origin": "Other", "overrideBundleItemQty": {"qqT1yw1y": 71, "x96zNlxD": 50, "z68DVC72": 55}, "quantity": 77, "region": "5eAh2FWL", "source": "PAYMENT", "startDate": "1985-06-15T00:00:00Z", "storeId": "3wZnq6tx"}' \
    > test.out 2>&1
eval_tap $? 288 'FulfillItem' test.out

#- 289 RedeemCode
./ng net.accelbyte.sdk.cli.Main platform redeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId '98MYSkSh' \
    --body '{"code": "OKw8Qh8d", "language": "HVC-ckvO_758", "region": "BBMFmQLf"}' \
    > test.out 2>&1
eval_tap $? 289 'RedeemCode' test.out

#- 290 PreCheckFulfillItem
./ng net.accelbyte.sdk.cli.Main platform preCheckFulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'HrsJvQB1' \
    --body '{"itemId": "FZpPIdwT", "itemSku": "T04PvqDV", "quantity": 77}' \
    > test.out 2>&1
eval_tap $? 290 'PreCheckFulfillItem' test.out

#- 291 FulfillRewards
./ng net.accelbyte.sdk.cli.Main platform fulfillRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'HNoqNUwG' \
    --body '{"entitlementCollectionId": "SHIo1wjE", "entitlementOrigin": "Oculus", "metadata": {"1t9KEi8e": {}, "2OYIWKqw": {}, "vUg6EEVr": {}}, "origin": "GooglePlay", "rewards": [{"currency": {"currencyCode": "3TRfhtQ7", "namespace": "cvWW4VUc"}, "item": {"itemId": "l8dyGXBg", "itemName": "SBRkkDFP", "itemSku": "Y2tnSntR", "itemType": "GC8VsC5V"}, "quantity": 81, "type": "CURRENCY"}, {"currency": {"currencyCode": "Q3XaIPL4", "namespace": "5vHFVwpJ"}, "item": {"itemId": "zF6O7WUv", "itemName": "FpawRKPO", "itemSku": "HWvo9KLl", "itemType": "kOZiB3bO"}, "quantity": 99, "type": "CURRENCY"}, {"currency": {"currencyCode": "mAl1bGVp", "namespace": "ORijJqGv"}, "item": {"itemId": "MWKvhulI", "itemName": "afcOshD5", "itemSku": "rhrXt4Ne", "itemType": "I3SlaOMy"}, "quantity": 75, "type": "ITEM"}], "source": "ACHIEVEMENT", "transactionId": "kE186evJ"}' \
    > test.out 2>&1
eval_tap $? 291 'FulfillRewards' test.out

#- 292 QueryUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'l4KyCMUR' \
    --endTime 'pncxUoFM' \
    --limit '65' \
    --offset '29' \
    --productId 'F76m1KLu' \
    --startTime 'umZyDYe3' \
    --status 'FULFILLED' \
    --type 'XBOX' \
    > test.out 2>&1
eval_tap $? 292 'QueryUserIAPOrders' test.out

#- 293 QueryAllUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryAllUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'S8TyHlHz' \
    > test.out 2>&1
eval_tap $? 293 'QueryAllUserIAPOrders' test.out

#- 294 QueryUserIAPConsumeHistory
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPConsumeHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'MRzNZGXy' \
    --endTime 'hZXbHkSc' \
    --limit '13' \
    --offset '77' \
    --startTime 'hxZnjWmK' \
    --status 'FAIL' \
    --type 'APPLE' \
    > test.out 2>&1
eval_tap $? 294 'QueryUserIAPConsumeHistory' test.out

#- 295 MockFulfillIAPItem
./ng net.accelbyte.sdk.cli.Main platform mockFulfillIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'e89FYpzJ' \
    --body '{"itemIdentityType": "ITEM_ID", "language": "TPEo_rjLg", "productId": "PF0jNVcN", "region": "5eyboOBh", "transactionId": "1rad4EJU", "type": "GOOGLE"}' \
    > test.out 2>&1
eval_tap $? 295 'MockFulfillIAPItem' test.out

#- 296 AdminSyncOculusSubscriptions
./ng net.accelbyte.sdk.cli.Main platform adminSyncOculusSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'hvvM9aVI' \
    --body '{"skus": ["1bM3K67p", "Plz1ahrd", "vbAWYDse"]}' \
    > test.out 2>&1
eval_tap $? 296 'AdminSyncOculusSubscriptions' test.out

#- 297 AdminGetIAPOrderLineItems
./ng net.accelbyte.sdk.cli.Main platform adminGetIAPOrderLineItems \
    --iapOrderNo 'vZ8XlkHg' \
    --namespace "$AB_NAMESPACE" \
    --userId 'whgpJJWr' \
    > test.out 2>&1
eval_tap $? 297 'AdminGetIAPOrderLineItems' test.out

#- 298 AdminSyncSteamAbnormalTransaction
./ng net.accelbyte.sdk.cli.Main platform adminSyncSteamAbnormalTransaction \
    --namespace "$AB_NAMESPACE" \
    --userId '6r71o4vk' \
    > test.out 2>&1
eval_tap $? 298 'AdminSyncSteamAbnormalTransaction' test.out

#- 299 AdminSyncSteamIAPByTransaction
./ng net.accelbyte.sdk.cli.Main platform adminSyncSteamIAPByTransaction \
    --namespace "$AB_NAMESPACE" \
    --userId 'WIu99Vz3' \
    --body '{"orderId": "grNy9cwc"}' \
    > test.out 2>&1
eval_tap $? 299 'AdminSyncSteamIAPByTransaction' test.out

#- 300 QueryUserThirdPartySubscription
./ng net.accelbyte.sdk.cli.Main platform queryUserThirdPartySubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'BbW8h4De' \
    --activeOnly  \
    --groupId 'ZCrVfMxK' \
    --limit '75' \
    --offset '28' \
    --platform 'GOOGLE' \
    --productId 'BYkRpSaU' \
    > test.out 2>&1
eval_tap $? 300 'QueryUserThirdPartySubscription' test.out

#- 301 GetThirdPartyPlatformSubscriptionOwnershipByGroupId
./ng net.accelbyte.sdk.cli.Main platform getThirdPartyPlatformSubscriptionOwnershipByGroupId \
    --namespace "$AB_NAMESPACE" \
    --platform 'TWITCH' \
    --userId 'wYlfijCj' \
    --groupId 'K7eIDCGa' \
    > test.out 2>&1
eval_tap $? 301 'GetThirdPartyPlatformSubscriptionOwnershipByGroupId' test.out

#- 302 GetThirdPartyPlatformSubscriptionOwnershipByProductId
./ng net.accelbyte.sdk.cli.Main platform getThirdPartyPlatformSubscriptionOwnershipByProductId \
    --namespace "$AB_NAMESPACE" \
    --platform 'XBOX' \
    --userId 'm0LkLv83' \
    --productId '2QKonVJ5' \
    > test.out 2>&1
eval_tap $? 302 'GetThirdPartyPlatformSubscriptionOwnershipByProductId' test.out

#- 303 QueryUserThirdPartySubscriptionTransactions
./ng net.accelbyte.sdk.cli.Main platform queryUserThirdPartySubscriptionTransactions \
    --namespace "$AB_NAMESPACE" \
    --userId 'a2H20Ipu' \
    --activeOnly  \
    --groupId '88lqwahl' \
    --limit '61' \
    --offset '33' \
    --platform 'TWITCH' \
    --productId 'GlA40auz' \
    > test.out 2>&1
eval_tap $? 303 'QueryUserThirdPartySubscriptionTransactions' test.out

#- 304 GetThirdPartySubscriptionDetails
./ng net.accelbyte.sdk.cli.Main platform getThirdPartySubscriptionDetails \
    --id 'MUXqwCSl' \
    --namespace "$AB_NAMESPACE" \
    --userId 'aucoQkq3' \
    > test.out 2>&1
eval_tap $? 304 'GetThirdPartySubscriptionDetails' test.out

#- 305 GetSubscriptionHistory
./ng net.accelbyte.sdk.cli.Main platform getSubscriptionHistory \
    --id '7cpEl5ur' \
    --namespace "$AB_NAMESPACE" \
    --userId 'uzMGXVSK' \
    --limit '79' \
    --offset '81' \
    > test.out 2>&1
eval_tap $? 305 'GetSubscriptionHistory' test.out

#- 306 SyncSubscriptionTransaction
./ng net.accelbyte.sdk.cli.Main platform syncSubscriptionTransaction \
    --id 'rNytzj21' \
    --namespace "$AB_NAMESPACE" \
    --userId '5Xf5Y02L' \
    > test.out 2>&1
eval_tap $? 306 'SyncSubscriptionTransaction' test.out

#- 307 GetThirdPartyUserSubscriptionDetails
./ng net.accelbyte.sdk.cli.Main platform getThirdPartyUserSubscriptionDetails \
    --id 'G75eUpOI' \
    --namespace "$AB_NAMESPACE" \
    --userId 'NtG6M5da' \
    > test.out 2>&1
eval_tap $? 307 'GetThirdPartyUserSubscriptionDetails' test.out

#- 308 SyncSubscription
./ng net.accelbyte.sdk.cli.Main platform syncSubscription \
    --id 'cii0Gh72' \
    --namespace "$AB_NAMESPACE" \
    --userId 'O51jvPy9' \
    > test.out 2>&1
eval_tap $? 308 'SyncSubscription' test.out

#- 309 QueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'BAwtct3I' \
    --discounted  \
    --itemId 'CxgeOlH3' \
    --limit '70' \
    --offset '74' \
    --status 'REFUND_FAILED' \
    > test.out 2>&1
eval_tap $? 309 'QueryUserOrders' test.out

#- 310 AdminCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform adminCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId '3s2EC6lA' \
    --body '{"currencyCode": "OLAfE6jm", "currencyNamespace": "VF6BxaP0", "discountCodes": ["DJrIkoix", "lEnB4Fvg", "97MtVVKr"], "discountedPrice": 90, "entitlementPlatform": "Steam", "ext": {"ivV2fwb6": {}, "EHirRHfQ": {}, "3NYTq5xz": {}}, "itemId": "IjlwtV6g", "language": "6l7YtSRz", "options": {"skipPriceValidation": true}, "platform": "IOS", "price": 22, "quantity": 97, "region": "zav3D4PP", "returnUrl": "pujsRYia", "sandbox": true, "sectionId": "VPAvtVBz"}' \
    > test.out 2>&1
eval_tap $? 310 'AdminCreateUserOrder' test.out

#- 311 CountOfPurchasedItem
./ng net.accelbyte.sdk.cli.Main platform countOfPurchasedItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'KKmfbyJz' \
    --itemId 'iS6lTtap' \
    > test.out 2>&1
eval_tap $? 311 'CountOfPurchasedItem' test.out

#- 312 GetUserOrder
./ng net.accelbyte.sdk.cli.Main platform getUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'DyUEEua9' \
    --userId 'fMFBGbbc' \
    > test.out 2>&1
eval_tap $? 312 'GetUserOrder' test.out

#- 313 UpdateUserOrderStatus
./ng net.accelbyte.sdk.cli.Main platform updateUserOrderStatus \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'Ys50OrYq' \
    --userId 'TN0QCjy0' \
    --body '{"status": "FULFILLED", "statusReason": "HLgMkQrO"}' \
    > test.out 2>&1
eval_tap $? 313 'UpdateUserOrderStatus' test.out

#- 314 FulfillUserOrder
./ng net.accelbyte.sdk.cli.Main platform fulfillUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo '551NBL3l' \
    --userId 'NbkI2P28' \
    > test.out 2>&1
eval_tap $? 314 'FulfillUserOrder' test.out

#- 315 GetUserOrderGrant
eval_tap 0 315 'GetUserOrderGrant # SKIP deprecated' test.out

#- 316 GetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform getUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'SyDw8WOD' \
    --userId 'un2v97B0' \
    > test.out 2>&1
eval_tap $? 316 'GetUserOrderHistories' test.out

#- 317 ProcessUserOrderNotification
./ng net.accelbyte.sdk.cli.Main platform processUserOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'JXbpgiLk' \
    --userId 'z8RxHSMM' \
    --body '{"additionalData": {"cardSummary": "c5mv1V3a"}, "authorisedTime": "1994-08-19T00:00:00Z", "chargebackReversedTime": "1971-12-08T00:00:00Z", "chargebackTime": "1980-06-19T00:00:00Z", "chargedTime": "1996-05-16T00:00:00Z", "createdTime": "1983-02-06T00:00:00Z", "currency": {"currencyCode": "EIgRVVX4", "currencySymbol": "pShvCjlU", "currencyType": "REAL", "decimals": 99, "namespace": "W5dOgwAu"}, "customParameters": {"eRlaOe3Q": {}, "xTDunWVh": {}, "xzoUYyHl": {}}, "extOrderNo": "Q8xcA5gL", "extTxId": "E8TWJQcY", "extUserId": "5OtTkZEn", "issuedAt": "1990-01-24T00:00:00Z", "metadata": {"P3ZV6r4Q": "Qa0m3DxN", "Pc0pszBJ": "JquaNoE7", "nCX3Kdmc": "g6enWMGi"}, "namespace": "9BOlTono", "nonceStr": "h3T1uiVb", "paymentData": {"discountAmount": 36, "discountCode": "YDPjwNBS", "subtotalPrice": 46, "tax": 24, "totalPrice": 78}, "paymentMethod": "6MgatSQr", "paymentMethodFee": 38, "paymentOrderNo": "TSOQt1Kc", "paymentProvider": "XSOLLA", "paymentProviderFee": 21, "paymentStationUrl": "7VcxWvYt", "price": 74, "refundedTime": "1994-09-06T00:00:00Z", "salesTax": 96, "sandbox": false, "sku": "6kuNcmeh", "status": "DELETED", "statusReason": "p356U2iz", "subscriptionId": "a6zPnxvb", "subtotalPrice": 12, "targetNamespace": "sRzlktCZ", "targetUserId": "Bv8VcDT2", "tax": 81, "totalPrice": 90, "totalTax": 68, "txEndTime": "1978-12-08T00:00:00Z", "type": "ulCI86Hi", "userId": "OuoXW2q8", "vat": 14}' \
    > test.out 2>&1
eval_tap $? 317 'ProcessUserOrderNotification' test.out

#- 318 DownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform downloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'CUNfbw3G' \
    --userId '6sBlXCFV' \
    > test.out 2>&1
eval_tap $? 318 'DownloadUserOrderReceipt' test.out

#- 319 CreateUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform createUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'nr8YrzMa' \
    --body '{"currencyCode": "2EUKTtQG", "currencyNamespace": "u9l7urpo", "customParameters": {"XwOooI68": {}, "WKxzstiz": {}, "Ted1SkGM": {}}, "description": "hpctsok1", "extOrderNo": "8brJFmsc", "extUserId": "sz6okT3Q", "itemType": "LOOTBOX", "language": "nXYS-mspg_843", "metadata": {"xnoPAU0c": "y7OeGRGw", "zFhYsjt5": "zp4KEMji", "YQO3E0v5": "pSb9udMJ"}, "notifyUrl": "OcIl81Gy", "omitNotification": false, "platform": "u6nK7XJg", "price": 8, "recurringPaymentOrderNo": "ZTIgaYV4", "region": "NPKgYLxe", "returnUrl": "K7Ys5zUc", "sandbox": false, "sku": "8HJYcrQm", "subscriptionId": "wOoQyIKi", "title": "mDFStLlv"}' \
    > test.out 2>&1
eval_tap $? 319 'CreateUserPaymentOrder' test.out

#- 320 RefundUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform refundUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'x7tBPzYR' \
    --userId '0NedLJBX' \
    --body '{"description": "F05GQAQY"}' \
    > test.out 2>&1
eval_tap $? 320 'RefundUserPaymentOrder' test.out

#- 321 GetUserPlatformAccountClosureHistories
./ng net.accelbyte.sdk.cli.Main platform getUserPlatformAccountClosureHistories \
    --namespace "$AB_NAMESPACE" \
    --userId 'KVC9t115' \
    > test.out 2>&1
eval_tap $? 321 'GetUserPlatformAccountClosureHistories' test.out

#- 322 ApplyUserRedemption
./ng net.accelbyte.sdk.cli.Main platform applyUserRedemption \
    --namespace "$AB_NAMESPACE" \
    --userId '1by8Oorm' \
    --body '{"code": "N7T7rnTQ", "orderNo": "9Wog6yGT"}' \
    > test.out 2>&1
eval_tap $? 322 'ApplyUserRedemption' test.out

#- 323 DoRevocation
./ng net.accelbyte.sdk.cli.Main platform doRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId '2dAf9gDJ' \
    --body '{"meta": {"7hkDEJqB": {}, "Agdmhu0Y": {}, "m2skTzaL": {}}, "reason": "QRNMy1ZE", "requestId": "xgcavkCY", "revokeEntries": [{"currency": {"balanceOrigin": "Oculus", "currencyCode": "84mxlD7m", "namespace": "8rMbkrtP"}, "entitlement": {"entitlementId": "lf4dW58t"}, "item": {"entitlementOrigin": "Steam", "itemIdentity": "0vmix3Fp", "itemIdentityType": "ITEM_ID", "origin": "Twitch"}, "quantity": 97, "type": "CURRENCY"}, {"currency": {"balanceOrigin": "Epic", "currencyCode": "T5Ziw4Np", "namespace": "QYZxHbnQ"}, "entitlement": {"entitlementId": "iUz6CgL8"}, "item": {"entitlementOrigin": "Steam", "itemIdentity": "9LUxQ3H0", "itemIdentityType": "ITEM_SKU", "origin": "Epic"}, "quantity": 91, "type": "ENTITLEMENT"}, {"currency": {"balanceOrigin": "GooglePlay", "currencyCode": "B9dNaIS3", "namespace": "QjYo8oGf"}, "entitlement": {"entitlementId": "Yfkv07pb"}, "item": {"entitlementOrigin": "Steam", "itemIdentity": "CXJLKJdS", "itemIdentityType": "ITEM_ID", "origin": "Nintendo"}, "quantity": 72, "type": "CURRENCY"}], "source": "IAP", "transactionId": "6izXOjYj"}' \
    > test.out 2>&1
eval_tap $? 323 'DoRevocation' test.out

#- 324 RegisterXblSessions
./ng net.accelbyte.sdk.cli.Main platform registerXblSessions \
    --namespace "$AB_NAMESPACE" \
    --userId 'zjbyFXgu' \
    --body '{"gameSessionId": "ckdzIfsq", "payload": {"QK4mldfN": {}, "VGF4LeoA": {}, "cZBfdCti": {}}, "scid": "JXmdRQ5r", "sessionTemplateName": "lsOM9Ti0"}' \
    > test.out 2>&1
eval_tap $? 324 'RegisterXblSessions' test.out

#- 325 QueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform queryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'ifd3jAWo' \
    --chargeStatus 'CHARGE_FAILED' \
    --itemId 'ltWBEYbK' \
    --limit '85' \
    --offset '83' \
    --sku 'pVgzeDK5' \
    --status 'EXPIRED' \
    --subscribedBy 'USER' \
    > test.out 2>&1
eval_tap $? 325 'QueryUserSubscriptions' test.out

#- 326 GetUserSubscriptionActivities
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionActivities \
    --namespace "$AB_NAMESPACE" \
    --userId 'Lij37pTp' \
    --excludeSystem  \
    --limit '59' \
    --offset '40' \
    --subscriptionId 'GP3wrVfw' \
    > test.out 2>&1
eval_tap $? 326 'GetUserSubscriptionActivities' test.out

#- 327 PlatformSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform platformSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'faG9Yde1' \
    --body '{"grantDays": 98, "itemId": "N13BXPYU", "language": "495EhNSA", "reason": "N3haAA4f", "region": "JId4Ojye", "source": "hNsaJ7SL"}' \
    > test.out 2>&1
eval_tap $? 327 'PlatformSubscribeSubscription' test.out

#- 328 CheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform checkUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'hwIakTLw' \
    --itemId 'gV3uNdJp' \
    > test.out 2>&1
eval_tap $? 328 'CheckUserSubscriptionSubscribableByItemId' test.out

#- 329 GetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform getUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '4gYlT4Eb' \
    --userId 'Z6dijllT' \
    > test.out 2>&1
eval_tap $? 329 'GetUserSubscription' test.out

#- 330 DeleteUserSubscription
./ng net.accelbyte.sdk.cli.Main platform deleteUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '7oXf6nNK' \
    --userId 'PIiCRMvc' \
    > test.out 2>&1
eval_tap $? 330 'DeleteUserSubscription' test.out

#- 331 CancelSubscription
./ng net.accelbyte.sdk.cli.Main platform cancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'dPvctl55' \
    --userId 'mkaJL7rc' \
    --force  \
    --body '{"immediate": true, "reason": "zJ4yfj6v"}' \
    > test.out 2>&1
eval_tap $? 331 'CancelSubscription' test.out

#- 332 GrantDaysToSubscription
./ng net.accelbyte.sdk.cli.Main platform grantDaysToSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'TUWikZos' \
    --userId 'ODlqMhVK' \
    --body '{"grantDays": 8, "reason": "WkQCylg5"}' \
    > test.out 2>&1
eval_tap $? 332 'GrantDaysToSubscription' test.out

#- 333 GetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'XzVAIArI' \
    --userId 'L2bN4tEq' \
    --excludeFree  \
    --limit '76' \
    --offset '12' \
    > test.out 2>&1
eval_tap $? 333 'GetUserSubscriptionBillingHistories' test.out

#- 334 ProcessUserSubscriptionNotification
./ng net.accelbyte.sdk.cli.Main platform processUserSubscriptionNotification \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'ZMsztOXn' \
    --userId 'q4UGrLW3' \
    --body '{"additionalData": {"cardSummary": "cOzZgWKI"}, "authorisedTime": "1977-01-02T00:00:00Z", "chargebackReversedTime": "1987-06-21T00:00:00Z", "chargebackTime": "1999-07-05T00:00:00Z", "chargedTime": "1993-08-28T00:00:00Z", "createdTime": "1983-03-06T00:00:00Z", "currency": {"currencyCode": "SV48MuUO", "currencySymbol": "knqdNjUN", "currencyType": "VIRTUAL", "decimals": 87, "namespace": "8ME6gPoE"}, "customParameters": {"RiSZnjSz": {}, "TjjylZk0": {}, "oc8oeLN4": {}}, "extOrderNo": "WkiBftxK", "extTxId": "cXIk3cB4", "extUserId": "07MJR9zP", "issuedAt": "1997-01-25T00:00:00Z", "metadata": {"hCFYanTo": "rWVwhoM8", "Wa8Dbr1D": "u1CYM4rg", "iFVhOUXu": "DotICglX"}, "namespace": "UteUmWOf", "nonceStr": "GCDOApmm", "paymentData": {"discountAmount": 98, "discountCode": "q0IIvHEj", "subtotalPrice": 44, "tax": 90, "totalPrice": 36}, "paymentMethod": "kZfm3ew6", "paymentMethodFee": 93, "paymentOrderNo": "PX0zVJIJ", "paymentProvider": "XSOLLA", "paymentProviderFee": 36, "paymentStationUrl": "fDWsKbhW", "price": 15, "refundedTime": "1993-04-15T00:00:00Z", "salesTax": 93, "sandbox": false, "sku": "Qws2zPBv", "status": "CHARGEBACK", "statusReason": "Cz1gJRhm", "subscriptionId": "F28tTWhc", "subtotalPrice": 35, "targetNamespace": "JwkmfjkH", "targetUserId": "ZPi6TshK", "tax": 8, "totalPrice": 35, "totalTax": 20, "txEndTime": "1992-04-25T00:00:00Z", "type": "0ynDufOY", "userId": "ed4PqI2e", "vat": 97}' \
    > test.out 2>&1
eval_tap $? 334 'ProcessUserSubscriptionNotification' test.out

#- 335 AcquireUserTicket
./ng net.accelbyte.sdk.cli.Main platform acquireUserTicket \
    --boothName 'AK3jo5Bc' \
    --namespace "$AB_NAMESPACE" \
    --userId '50oPuln6' \
    --body '{"count": 69, "orderNo": "7otoulc1"}' \
    > test.out 2>&1
eval_tap $? 335 'AcquireUserTicket' test.out

#- 336 QueryUserCurrencyWallets
./ng net.accelbyte.sdk.cli.Main platform queryUserCurrencyWallets \
    --namespace "$AB_NAMESPACE" \
    --userId 'P3b0XC30' \
    > test.out 2>&1
eval_tap $? 336 'QueryUserCurrencyWallets' test.out

#- 337 DebitUserWalletByCurrencyCode
./ng net.accelbyte.sdk.cli.Main platform debitUserWalletByCurrencyCode \
    --currencyCode 'czudFGUo' \
    --namespace "$AB_NAMESPACE" \
    --userId 'rf02RdO3' \
    --body '{"allowOverdraft": false, "amount": 35, "balanceOrigin": "IOS", "balanceSource": "IAP_REVOCATION", "metadata": {"PHuCfAFv": {}, "2Tms7fcu": {}, "NEDJKi62": {}}, "reason": "DpHVg3Br"}' \
    > test.out 2>&1
eval_tap $? 337 'DebitUserWalletByCurrencyCode' test.out

#- 338 ListUserCurrencyTransactions
./ng net.accelbyte.sdk.cli.Main platform listUserCurrencyTransactions \
    --currencyCode 'lB01ih0d' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Raiy95R6' \
    --limit '32' \
    --offset '60' \
    > test.out 2>&1
eval_tap $? 338 'ListUserCurrencyTransactions' test.out

#- 339 CheckBalance
./ng net.accelbyte.sdk.cli.Main platform checkBalance \
    --currencyCode 'RvOMs0UR' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Q6D6Dn3d' \
    --request '{"amount": 22, "debitBalanceSource": "IAP_REVOCATION", "metadata": {"aQ0Kszz3": {}, "RyvSMVyc": {}, "j8mN5OP1": {}}, "reason": "CGjGmJZb", "walletPlatform": "Playstation"}' \
    > test.out 2>&1
eval_tap $? 339 'CheckBalance' test.out

#- 340 CheckWallet
eval_tap 0 340 'CheckWallet # SKIP deprecated' test.out

#- 341 CreditUserWallet
./ng net.accelbyte.sdk.cli.Main platform creditUserWallet \
    --currencyCode 'adQ7Mt8c' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Buqf3Gvq' \
    --body '{"amount": 43, "expireAt": "1988-02-09T00:00:00Z", "metadata": {"NxWGDAKC": {}, "piMPrHHI": {}, "20rYsUyE": {}}, "origin": "Playstation", "reason": "mjv9lwqM", "source": "CONSUME_ENTITLEMENT"}' \
    > test.out 2>&1
eval_tap $? 341 'CreditUserWallet' test.out

#- 342 DebitByWalletPlatform
./ng net.accelbyte.sdk.cli.Main platform debitByWalletPlatform \
    --currencyCode 'BcRjOYbr' \
    --namespace "$AB_NAMESPACE" \
    --userId '2bZTsG7Q' \
    --request '{"amount": 71, "debitBalanceSource": "ORDER_REVOCATION", "metadata": {"luM3gJ70": {}, "jqTanR9e": {}, "Qji0q4QH": {}}, "reason": "GAQajeY0", "walletPlatform": "GooglePlay"}' \
    > test.out 2>&1
eval_tap $? 342 'DebitByWalletPlatform' test.out

#- 343 PayWithUserWallet
./ng net.accelbyte.sdk.cli.Main platform payWithUserWallet \
    --currencyCode 'h0CxgR5m' \
    --namespace "$AB_NAMESPACE" \
    --userId 'aUAsQo5v' \
    --body '{"amount": 6, "metadata": {"wv1QZpIk": {}, "4hs6Dp0h": {}, "sc8XZcm8": {}}, "walletPlatform": "Steam"}' \
    > test.out 2>&1
eval_tap $? 343 'PayWithUserWallet' test.out

#- 344 GetUserWallet
eval_tap 0 344 'GetUserWallet # SKIP deprecated' test.out

#- 345 DebitUserWallet
eval_tap 0 345 'DebitUserWallet # SKIP deprecated' test.out

#- 346 DisableUserWallet
eval_tap 0 346 'DisableUserWallet # SKIP deprecated' test.out

#- 347 EnableUserWallet
eval_tap 0 347 'EnableUserWallet # SKIP deprecated' test.out

#- 348 ListUserWalletTransactions
eval_tap 0 348 'ListUserWalletTransactions # SKIP deprecated' test.out

#- 349 ListViews
./ng net.accelbyte.sdk.cli.Main platform listViews \
    --namespace "$AB_NAMESPACE" \
    --storeId 'j2flxO07' \
    > test.out 2>&1
eval_tap $? 349 'ListViews' test.out

#- 350 CreateView
./ng net.accelbyte.sdk.cli.Main platform createView \
    --namespace "$AB_NAMESPACE" \
    --storeId 'SfT4L2eL' \
    --body '{"displayOrder": 25, "localizations": {"bKqPzPag": {"description": "PySIfW4o", "localExt": {"3L2MOkB1": {}, "o092blpd": {}, "THmv9HWu": {}}, "longDescription": "NdMWfSUt", "title": "MByWSBWD"}, "FsUnkqXP": {"description": "lRYsTblV", "localExt": {"uOfYuwKw": {}, "Fdx01Uae": {}, "s0yyel4w": {}}, "longDescription": "Yfb98gUK", "title": "pMCSiBYD"}, "e4gpx54R": {"description": "xphyuvUM", "localExt": {"xRpWxYvR": {}, "0SSDnMY5": {}, "pBvi6dTw": {}}, "longDescription": "m27HiyMg", "title": "tr6Kol4D"}}, "name": "TgBZiK2S"}' \
    > test.out 2>&1
eval_tap $? 350 'CreateView' test.out

#- 351 GetView
./ng net.accelbyte.sdk.cli.Main platform getView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'nv9C1mUK' \
    --storeId 'rBZ67yZd' \
    > test.out 2>&1
eval_tap $? 351 'GetView' test.out

#- 352 UpdateView
./ng net.accelbyte.sdk.cli.Main platform updateView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'QhTrXv3b' \
    --storeId 'wCmfzaaF' \
    --body '{"displayOrder": 94, "localizations": {"I2LCxWgY": {"description": "snB39v9M", "localExt": {"30MKLuFp": {}, "RvZgJkg5": {}, "SwogURsZ": {}}, "longDescription": "QEtV3BAO", "title": "S9dJ19fN"}, "2R7eurID": {"description": "d5FXhPoc", "localExt": {"gXFaEALD": {}, "POHOiDXB": {}, "m1qqx7HM": {}}, "longDescription": "OKYouoEf", "title": "VsQqPhN3"}, "EVUouQWz": {"description": "ucqyWa4r", "localExt": {"V6OoJgJH": {}, "cm10JneP": {}, "z836yuit": {}}, "longDescription": "OiaPqPtM", "title": "WSYvO5HQ"}}, "name": "YCysZzLf"}' \
    > test.out 2>&1
eval_tap $? 352 'UpdateView' test.out

#- 353 DeleteView
./ng net.accelbyte.sdk.cli.Main platform deleteView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'q4NQg8a6' \
    --storeId '85k9vSdB' \
    > test.out 2>&1
eval_tap $? 353 'DeleteView' test.out

#- 354 GetWalletConfig
./ng net.accelbyte.sdk.cli.Main platform getWalletConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 354 'GetWalletConfig' test.out

#- 355 UpdateWalletConfig
./ng net.accelbyte.sdk.cli.Main platform updateWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"enablePaidForVCExpiration": true}' \
    > test.out 2>&1
eval_tap $? 355 'UpdateWalletConfig' test.out

#- 356 QueryWallets
eval_tap 0 356 'QueryWallets # SKIP deprecated' test.out

#- 357 BulkCredit
./ng net.accelbyte.sdk.cli.Main platform bulkCredit \
    --namespace "$AB_NAMESPACE" \
    --body '[{"creditRequest": {"amount": 7, "expireAt": "1998-05-06T00:00:00Z", "metadata": {"QJaIKH9l": {}, "WY55DrOW": {}, "M7GdZqzz": {}}, "origin": "Playstation", "reason": "9BQ9aBUt", "source": "REFERRAL_BONUS"}, "currencyCode": "Fad7e4ai", "userIds": ["2Xilt2ts", "aJ9shND9", "UJaqEXMn"]}, {"creditRequest": {"amount": 12, "expireAt": "1993-02-16T00:00:00Z", "metadata": {"8Fk0pIyV": {}, "OF9jZaR3": {}, "AMblN7wz": {}}, "origin": "Oculus", "reason": "YY5wfzfD", "source": "PURCHASE"}, "currencyCode": "uyAPHvTz", "userIds": ["YX7tyQ1v", "WsyejDmQ", "UoU4p3Oe"]}, {"creditRequest": {"amount": 34, "expireAt": "1981-10-26T00:00:00Z", "metadata": {"ywiR7FoH": {}, "JO9k4ssU": {}, "rMxkBML0": {}}, "origin": "IOS", "reason": "vIJo3jcb", "source": "IAP_CHARGEBACK_REVERSED"}, "currencyCode": "NW1Ki5xV", "userIds": ["miVVi34B", "J4c4KSvk", "r5mWh3D5"]}]' \
    > test.out 2>&1
eval_tap $? 357 'BulkCredit' test.out

#- 358 BulkDebit
./ng net.accelbyte.sdk.cli.Main platform bulkDebit \
    --namespace "$AB_NAMESPACE" \
    --body '[{"currencyCode": "ZVcnjlZh", "request": {"allowOverdraft": true, "amount": 8, "balanceOrigin": "GooglePlay", "balanceSource": "IAP_REVOCATION", "metadata": {"0X1DXqYU": {}, "xdRi2bAZ": {}, "6FkwWZCr": {}}, "reason": "P3b1iuEu"}, "userIds": ["saVaS6W3", "bnHsHrEo", "JQ1LpoGZ"]}, {"currencyCode": "WXU6roXg", "request": {"allowOverdraft": true, "amount": 13, "balanceOrigin": "Playstation", "balanceSource": "EXPIRATION", "metadata": {"bcImW9Jc": {}, "uVFTB9IV": {}, "I4jSCOBl": {}}, "reason": "pu5295c2"}, "userIds": ["4YfM8k8Z", "p4zS4ojS", "0n5ekBMr"]}, {"currencyCode": "G5h31xAg", "request": {"allowOverdraft": true, "amount": 10, "balanceOrigin": "Twitch", "balanceSource": "PAYMENT", "metadata": {"RHBgxtt3": {}, "NXzeWQwI": {}, "gs47yRyN": {}}, "reason": "LxYFCIvs"}, "userIds": ["JjoIlirR", "rBX3s01D", "5THYd6ys"]}]' \
    > test.out 2>&1
eval_tap $? 358 'BulkDebit' test.out

#- 359 GetWallet
eval_tap 0 359 'GetWallet # SKIP deprecated' test.out

#- 360 SyncOrders
./ng net.accelbyte.sdk.cli.Main platform syncOrders \
    --nextEvaluatedKey '78d3Pafd' \
    --end '5YKBD9pf' \
    --start 'iWfazosQ' \
    > test.out 2>&1
eval_tap $? 360 'SyncOrders' test.out

#- 361 TestAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfig \
    --sandbox  \
    --body '{"allowedPaymentMethods": ["Nup8OSkL", "Ch5xw3xX", "4bnIznON"], "apiKey": "PoDtaSw7", "authoriseAsCapture": true, "blockedPaymentMethods": ["w5VbeGT3", "w86NInug", "namfPDuk"], "clientKey": "sQpZA3Wd", "dropInSettings": "9eLrb3Xi", "liveEndpointUrlPrefix": "Ui6i36fK", "merchantAccount": "EKDmZCig", "notificationHmacKey": "MkI6RSYz", "notificationPassword": "8uSZynuG", "notificationUsername": "jxtYAbOj", "returnUrl": "pyOHOhVC", "settings": "2S1feBww"}' \
    > test.out 2>&1
eval_tap $? 361 'TestAdyenConfig' test.out

#- 362 TestAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfig \
    --sandbox  \
    --body '{"appId": "km1PR3cM", "privateKey": "wm6rIABv", "publicKey": "1VhA99g7", "returnUrl": "8nXpXr3k"}' \
    > test.out 2>&1
eval_tap $? 362 'TestAliPayConfig' test.out

#- 363 TestCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfig \
    --sandbox  \
    --body '{"publicKey": "f2dLct9i", "secretKey": "bkWtnsxv"}' \
    > test.out 2>&1
eval_tap $? 363 'TestCheckoutConfig' test.out

#- 364 DebugMatchedPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentMerchantConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'ZVZGSHj3' \
    > test.out 2>&1
eval_tap $? 364 'DebugMatchedPaymentMerchantConfig' test.out

#- 365 TestNeonPayConfig
./ng net.accelbyte.sdk.cli.Main platform testNeonPayConfig \
    --sandbox  \
    --body '{"apiKey": "Y0UhugRV", "webhookSecretKey": "AE2ZuYkZ"}' \
    > test.out 2>&1
eval_tap $? 365 'TestNeonPayConfig' test.out

#- 366 TestPayPalConfig
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfig \
    --sandbox  \
    --body '{"clientID": "0JIENfw7", "clientSecret": "BzHT4dvV", "returnUrl": "ee2El5Lf", "webHookId": "3fark7ht"}' \
    > test.out 2>&1
eval_tap $? 366 'TestPayPalConfig' test.out

#- 367 TestStripeConfig
./ng net.accelbyte.sdk.cli.Main platform testStripeConfig \
    --sandbox  \
    --body '{"allowedPaymentMethodTypes": ["F3M6eLos", "q0Ghc1OW", "OMv2Cp5t"], "publishableKey": "qIJcS1me", "secretKey": "FrG6IUo6", "webhookSecret": "L42s0Ccc"}' \
    > test.out 2>&1
eval_tap $? 367 'TestStripeConfig' test.out

#- 368 TestWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfig \
    --body '{"appId": "Sw6dEL9g", "key": "uq9pFUlK", "mchid": "pzZ8kueU", "returnUrl": "x3Ji58cW"}' \
    > test.out 2>&1
eval_tap $? 368 'TestWxPayConfig' test.out

#- 369 TestXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfig \
    --body '{"apiKey": "ByEs9iLx", "flowCompletionUrl": "qFThw97Z", "merchantId": 81, "projectId": 36, "projectSecretKey": "sWP6ZxkC"}' \
    > test.out 2>&1
eval_tap $? 369 'TestXsollaConfig' test.out

#- 370 GetPaymentMerchantConfig1
./ng net.accelbyte.sdk.cli.Main platform getPaymentMerchantConfig1 \
    --id 'CVKlIxZF' \
    > test.out 2>&1
eval_tap $? 370 'GetPaymentMerchantConfig1' test.out

#- 371 UpdateAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform updateAdyenConfig \
    --id 'VqccJlx0' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethods": ["MajLttt3", "q0f7MJpn", "U525qlGV"], "apiKey": "2e9iU4Fp", "authoriseAsCapture": false, "blockedPaymentMethods": ["8ybjSmpd", "Ag3MuMb0", "MVonb3Lm"], "clientKey": "sV5bEvEA", "dropInSettings": "WPR5d2RM", "liveEndpointUrlPrefix": "er0tPY9O", "merchantAccount": "hShga2PL", "notificationHmacKey": "rWGvUS2K", "notificationPassword": "yorZYqgG", "notificationUsername": "6j14nepH", "returnUrl": "4k8gOhda", "settings": "CbKuBS15"}' \
    > test.out 2>&1
eval_tap $? 371 'UpdateAdyenConfig' test.out

#- 372 TestAdyenConfigById
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfigById \
    --id 'R4nKYekp' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 372 'TestAdyenConfigById' test.out

#- 373 UpdateAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateAliPayConfig \
    --id 'DGNVAdo4' \
    --sandbox  \
    --validate  \
    --body '{"appId": "CnE0VVfL", "privateKey": "bftgcOW3", "publicKey": "xb8XDI2p", "returnUrl": "HPQko1jr"}' \
    > test.out 2>&1
eval_tap $? 373 'UpdateAliPayConfig' test.out

#- 374 TestAliPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfigById \
    --id '2qXRsHLp' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 374 'TestAliPayConfigById' test.out

#- 375 UpdateCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform updateCheckoutConfig \
    --id 'Wc5QQrD7' \
    --sandbox  \
    --validate  \
    --body '{"publicKey": "dWELbI7y", "secretKey": "3RPlBuUs"}' \
    > test.out 2>&1
eval_tap $? 375 'UpdateCheckoutConfig' test.out

#- 376 TestCheckoutConfigById
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfigById \
    --id 'mrCaJs3w' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 376 'TestCheckoutConfigById' test.out

#- 377 UpdateNeonPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateNeonPayConfig \
    --id 'jBB03NCi' \
    --sandbox  \
    --validate  \
    --body '{"apiKey": "sImdH9A5", "webhookSecretKey": "uqeLFE3M"}' \
    > test.out 2>&1
eval_tap $? 377 'UpdateNeonPayConfig' test.out

#- 378 TestNeonPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testNeonPayConfigById \
    --id 'VvvZDmpQ' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 378 'TestNeonPayConfigById' test.out

#- 379 UpdatePayPalConfig
./ng net.accelbyte.sdk.cli.Main platform updatePayPalConfig \
    --id 'Xa4QFebJ' \
    --sandbox  \
    --validate  \
    --body '{"clientID": "VMUkppc8", "clientSecret": "6aCwWtdu", "returnUrl": "k9Pr8H4O", "webHookId": "sxm2G6Do"}' \
    > test.out 2>&1
eval_tap $? 379 'UpdatePayPalConfig' test.out

#- 380 TestPayPalConfigById
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfigById \
    --id 'P9qfA3JE' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 380 'TestPayPalConfigById' test.out

#- 381 UpdateStripeConfig
./ng net.accelbyte.sdk.cli.Main platform updateStripeConfig \
    --id 'iu38pie0' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethodTypes": ["VDkmSd92", "BuGdtRVZ", "7jhMiTXM"], "publishableKey": "cunQyx9C", "secretKey": "KJ11k5J3", "webhookSecret": "oaqCOqTz"}' \
    > test.out 2>&1
eval_tap $? 381 'UpdateStripeConfig' test.out

#- 382 TestStripeConfigById
./ng net.accelbyte.sdk.cli.Main platform testStripeConfigById \
    --id 'oH3vCCd2' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 382 'TestStripeConfigById' test.out

#- 383 UpdateWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfig \
    --id 'p3rcDppm' \
    --validate  \
    --body '{"appId": "JqDwzBVf", "key": "HPEiCJo3", "mchid": "kvC4jhDD", "returnUrl": "SSg27avO"}' \
    > test.out 2>&1
eval_tap $? 383 'UpdateWxPayConfig' test.out

#- 384 UpdateWxPayConfigCert
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfigCert \
    --id 'UVCEBXmY' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 384 'UpdateWxPayConfigCert' test.out

#- 385 TestWxPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfigById \
    --id '6rUw1Lhf' \
    > test.out 2>&1
eval_tap $? 385 'TestWxPayConfigById' test.out

#- 386 UpdateXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaConfig \
    --id '0tzuexgU' \
    --validate  \
    --body '{"apiKey": "rwGmqRcD", "flowCompletionUrl": "8lMfqaC2", "merchantId": 86, "projectId": 19, "projectSecretKey": "X4SKK8nJ"}' \
    > test.out 2>&1
eval_tap $? 386 'UpdateXsollaConfig' test.out

#- 387 TestXsollaConfigById
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfigById \
    --id 'q2Yb1EOk' \
    > test.out 2>&1
eval_tap $? 387 'TestXsollaConfigById' test.out

#- 388 UpdateXsollaUIConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaUIConfig \
    --id 'nUlIcsyA' \
    --body '{"device": "DESKTOP", "showCloseButton": false, "size": "SMALL", "theme": "DEFAULT_DARK"}' \
    > test.out 2>&1
eval_tap $? 388 'UpdateXsollaUIConfig' test.out

#- 389 QueryPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform queryPaymentProviderConfig \
    --limit '13' \
    --namespace "$AB_NAMESPACE" \
    --offset '72' \
    --region 'N5zZwJKF' \
    > test.out 2>&1
eval_tap $? 389 'QueryPaymentProviderConfig' test.out

#- 390 CreatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform createPaymentProviderConfig \
    --body '{"aggregate": "CHECKOUT", "namespace": "8lfQja7s", "region": "40jReeAd", "sandboxTaxJarApiToken": "1UdG1oVw", "specials": ["WALLET", "PAYPAL", "WALLET"], "taxJarApiToken": "7rlJaZVO", "taxJarEnabled": false, "useGlobalTaxJarApiToken": true}' \
    > test.out 2>&1
eval_tap $? 390 'CreatePaymentProviderConfig' test.out

#- 391 GetAggregatePaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getAggregatePaymentProviders \
    > test.out 2>&1
eval_tap $? 391 'GetAggregatePaymentProviders' test.out

#- 392 DebugMatchedPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentProviderConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'JI8BqUEQ' \
    > test.out 2>&1
eval_tap $? 392 'DebugMatchedPaymentProviderConfig' test.out

#- 393 GetSpecialPaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getSpecialPaymentProviders \
    > test.out 2>&1
eval_tap $? 393 'GetSpecialPaymentProviders' test.out

#- 394 UpdatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentProviderConfig \
    --id 'qgbD71mk' \
    --body '{"aggregate": "CHECKOUT", "namespace": "1HQPoovU", "region": "IWP2ZJC6", "sandboxTaxJarApiToken": "3oQL2PFa", "specials": ["ADYEN", "CHECKOUT", "WXPAY"], "taxJarApiToken": "Z36H4YCj", "taxJarEnabled": false, "useGlobalTaxJarApiToken": true}' \
    > test.out 2>&1
eval_tap $? 394 'UpdatePaymentProviderConfig' test.out

#- 395 DeletePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform deletePaymentProviderConfig \
    --id 'H9kGPNAo' \
    > test.out 2>&1
eval_tap $? 395 'DeletePaymentProviderConfig' test.out

#- 396 GetPaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxConfig \
    > test.out 2>&1
eval_tap $? 396 'GetPaymentTaxConfig' test.out

#- 397 UpdatePaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentTaxConfig \
    --body '{"sandboxTaxJarApiToken": "Az21siGe", "taxJarApiToken": "GYT8fE3E", "taxJarEnabled": true, "taxJarProductCodesMapping": {"PyejXWNv": "1Fmgfk2O", "DWXbYwyI": "uKF88vek", "4UAGZo6V": "xmCGItDA"}}' \
    > test.out 2>&1
eval_tap $? 397 'UpdatePaymentTaxConfig' test.out

#- 398 SyncPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform syncPaymentOrders \
    --nextEvaluatedKey 'uUfH6U0I' \
    --end 'kFKufai8' \
    --start 'yRbT4QJD' \
    > test.out 2>&1
eval_tap $? 398 'SyncPaymentOrders' test.out

#- 399 PublicGetRootCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetRootCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'ZpgD9lsI' \
    --storeId 'IlL8EjS9' \
    > test.out 2>&1
eval_tap $? 399 'PublicGetRootCategories' test.out

#- 400 DownloadCategories
./ng net.accelbyte.sdk.cli.Main platform downloadCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'PVIHg9gT' \
    --storeId 'vfRdnfKF' \
    > test.out 2>&1
eval_tap $? 400 'DownloadCategories' test.out

#- 401 PublicGetCategory
./ng net.accelbyte.sdk.cli.Main platform publicGetCategory \
    --categoryPath 'asIA6A6c' \
    --namespace "$AB_NAMESPACE" \
    --language 'ZrJS0Jhl' \
    --storeId 'bP0fkTnn' \
    > test.out 2>&1
eval_tap $? 401 'PublicGetCategory' test.out

#- 402 PublicGetChildCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetChildCategories \
    --categoryPath 'HVRuRdAJ' \
    --namespace "$AB_NAMESPACE" \
    --language 'mxPGSQt3' \
    --storeId 'JdabZ4ez' \
    > test.out 2>&1
eval_tap $? 402 'PublicGetChildCategories' test.out

#- 403 PublicGetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetDescendantCategories \
    --categoryPath '3SCYnDtw' \
    --namespace "$AB_NAMESPACE" \
    --language 'pqonSn34' \
    --storeId 'NmqSmGdo' \
    > test.out 2>&1
eval_tap $? 403 'PublicGetDescendantCategories' test.out

#- 404 PublicListCurrencies
./ng net.accelbyte.sdk.cli.Main platform publicListCurrencies \
    --namespace "$AB_NAMESPACE" \
    --currencyType 'REAL' \
    > test.out 2>&1
eval_tap $? 404 'PublicListCurrencies' test.out

#- 405 GeDLCDurableRewardShortMap
./ng net.accelbyte.sdk.cli.Main platform geDLCDurableRewardShortMap \
    --namespace "$AB_NAMESPACE" \
    --dlcType 'XBOX' \
    > test.out 2>&1
eval_tap $? 405 'GeDLCDurableRewardShortMap' test.out

#- 406 GetAppleConfigVersion
./ng net.accelbyte.sdk.cli.Main platform getAppleConfigVersion \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 406 'GetAppleConfigVersion' test.out

#- 407 GetIAPItemMapping
./ng net.accelbyte.sdk.cli.Main platform getIAPItemMapping \
    --namespace "$AB_NAMESPACE" \
    --platform 'TWITCH' \
    > test.out 2>&1
eval_tap $? 407 'GetIAPItemMapping' test.out

#- 408 PublicGetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --language 'SboLsbQL' \
    --region 'tHs4QDE9' \
    --storeId 'ceQlJm4L' \
    --appId 'waLJHurJ' \
    > test.out 2>&1
eval_tap $? 408 'PublicGetItemByAppId' test.out

#- 409 PublicQueryItems
./ng net.accelbyte.sdk.cli.Main platform publicQueryItems \
    --namespace "$AB_NAMESPACE" \
    --appType 'GAME' \
    --autoCalcEstimatedPrice  \
    --baseAppId 'NjniYBf0' \
    --categoryPath 'VlozNCDt' \
    --features 'BcaYEcWG' \
    --includeSubCategoryItem  \
    --itemType 'COINS' \
    --language 'x4GZetKD' \
    --limit '91' \
    --offset '13' \
    --region 'OBE2TzXE' \
    --sortBy 'name:asc,updatedAt:desc' \
    --storeId 'dWhWPZG6' \
    --tags 'IyNPwypd' \
    > test.out 2>&1
eval_tap $? 409 'PublicQueryItems' test.out

#- 410 PublicGetItemBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetItemBySku \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language '0t9n0Xik' \
    --region 'bRVB5NB0' \
    --storeId 'xlwLOX31' \
    --sku 'zXWORzXW' \
    > test.out 2>&1
eval_tap $? 410 'PublicGetItemBySku' test.out

#- 411 PublicGetEstimatedPrice
./ng net.accelbyte.sdk.cli.Main platform publicGetEstimatedPrice \
    --namespace "$AB_NAMESPACE" \
    --region 'tovRZIHb' \
    --storeId 'uGJAgdfq' \
    --itemIds 'QNVjTRgW' \
    > test.out 2>&1
eval_tap $? 411 'PublicGetEstimatedPrice' test.out

#- 412 PublicBulkGetItems
./ng net.accelbyte.sdk.cli.Main platform publicBulkGetItems \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'Qhaw4JZ3' \
    --region 'qtzTzK37' \
    --storeId 'WLfL48Yk' \
    --itemIds 'y6Iibzgm' \
    > test.out 2>&1
eval_tap $? 412 'PublicBulkGetItems' test.out

#- 413 PublicValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform publicValidateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --body '{"itemIds": ["T9RNL8Lq", "7MJX9Yww", "CJx5nB8a"]}' \
    > test.out 2>&1
eval_tap $? 413 'PublicValidateItemPurchaseCondition' test.out

#- 414 PublicSearchItems
./ng net.accelbyte.sdk.cli.Main platform publicSearchItems \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --itemType 'COINS' \
    --limit '27' \
    --offset '41' \
    --region '0GU6dmGr' \
    --storeId 'ths0d9WJ' \
    --keyword 'zZscOseq' \
    --language 'NgnPdWer' \
    > test.out 2>&1
eval_tap $? 414 'PublicSearchItems' test.out

#- 415 PublicGetApp
./ng net.accelbyte.sdk.cli.Main platform publicGetApp \
    --itemId 'OG8tNYO1' \
    --namespace "$AB_NAMESPACE" \
    --language 'xxOlmM3J' \
    --region 'cR6kRDLO' \
    --storeId 'bCLzfPnE' \
    > test.out 2>&1
eval_tap $? 415 'PublicGetApp' test.out

#- 416 PublicGetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform publicGetItemDynamicData \
    --itemId 'ymT7srZf' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 416 'PublicGetItemDynamicData' test.out

#- 417 PublicGetItem
./ng net.accelbyte.sdk.cli.Main platform publicGetItem \
    --itemId 'PQOpMfTc' \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'AJMrPYIY' \
    --populateBundle  \
    --region 'FyUb2cqB' \
    --storeId 'm0eu7Px3' \
    > test.out 2>&1
eval_tap $? 417 'PublicGetItem' test.out

#- 418 GetPaymentCustomization
eval_tap 0 418 'GetPaymentCustomization # SKIP deprecated' test.out

#- 419 PublicGetPaymentUrl
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentUrl \
    --namespace "$AB_NAMESPACE" \
    --body '{"neonPayConfig": {"cancelUrl": "7AwWxwNW", "successUrl": "L1T7sjiJ"}, "paymentOrderNo": "NUNpHycu", "paymentProvider": "STRIPE", "returnUrl": "jCIVbT4E", "ui": "QAR8rjGt", "zipCode": "fIWDvybN"}' \
    > test.out 2>&1
eval_tap $? 419 'PublicGetPaymentUrl' test.out

#- 420 PublicGetPaymentMethods
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentMethods \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'LcnEflbC' \
    > test.out 2>&1
eval_tap $? 420 'PublicGetPaymentMethods' test.out

#- 421 PublicGetUnpaidPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUnpaidPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'QY8oFX26' \
    > test.out 2>&1
eval_tap $? 421 'PublicGetUnpaidPaymentOrder' test.out

#- 422 Pay
./ng net.accelbyte.sdk.cli.Main platform pay \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'bbMTukub' \
    --paymentProvider 'NEONPAY' \
    --zipCode 'GFQWuR0M' \
    --body '{"token": "6TmX37hd"}' \
    > test.out 2>&1
eval_tap $? 422 'Pay' test.out

#- 423 PublicCheckPaymentOrderPaidStatus
./ng net.accelbyte.sdk.cli.Main platform publicCheckPaymentOrderPaidStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'BWo53OuL' \
    > test.out 2>&1
eval_tap $? 423 'PublicCheckPaymentOrderPaidStatus' test.out

#- 424 GetPaymentPublicConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentPublicConfig \
    --namespace "$AB_NAMESPACE" \
    --sandbox  \
    --paymentProvider 'ALIPAY' \
    --region 'MMHT9V1h' \
    > test.out 2>&1
eval_tap $? 424 'GetPaymentPublicConfig' test.out

#- 425 PublicGetQRCode
./ng net.accelbyte.sdk.cli.Main platform publicGetQRCode \
    --namespace "$AB_NAMESPACE" \
    --code 'wCe43upl' \
    > test.out 2>&1
eval_tap $? 425 'PublicGetQRCode' test.out

#- 426 PublicNormalizePaymentReturnUrl
./ng net.accelbyte.sdk.cli.Main platform publicNormalizePaymentReturnUrl \
    --namespace "$AB_NAMESPACE" \
    --payerID 'NtWwl6NC' \
    --foreinginvoice 'PdU9wvdn' \
    --invoiceId 'EJbos4pJ' \
    --payload 'aUXgwgTb' \
    --redirectResult 'SUkC63jh' \
    --resultCode 'mO09QYLL' \
    --sessionId 'jk3T1xnb' \
    --status 'i5qFOa1h' \
    --token 'EOlZ3sTg' \
    --type 'QtKMYf5z' \
    --userId 'r7bmDdn7' \
    --orderNo '3Ofk98BZ' \
    --paymentOrderNo 'iaRVuQ3k' \
    --paymentProvider 'WALLET' \
    --returnUrl 'Qzb6igwk' \
    > test.out 2>&1
eval_tap $? 426 'PublicNormalizePaymentReturnUrl' test.out

#- 427 GetPaymentTaxValue
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxValue \
    --namespace "$AB_NAMESPACE" \
    --zipCode '3jo78TZL' \
    --paymentOrderNo 'rFDzYg86' \
    --paymentProvider 'STRIPE' \
    > test.out 2>&1
eval_tap $? 427 'GetPaymentTaxValue' test.out

#- 428 GetRewardByCode
./ng net.accelbyte.sdk.cli.Main platform getRewardByCode \
    --namespace "$AB_NAMESPACE" \
    --rewardCode 'LhY5zkG9' \
    > test.out 2>&1
eval_tap $? 428 'GetRewardByCode' test.out

#- 429 QueryRewards1
./ng net.accelbyte.sdk.cli.Main platform queryRewards1 \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'OKReJmp3' \
    --limit '85' \
    --offset '23' \
    --sortBy 'namespace:desc,rewardCode:asc,rewardCode' \
    > test.out 2>&1
eval_tap $? 429 'QueryRewards1' test.out

#- 430 GetReward1
./ng net.accelbyte.sdk.cli.Main platform getReward1 \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'ZgkTwJOI' \
    > test.out 2>&1
eval_tap $? 430 'GetReward1' test.out

#- 431 PublicListStores
./ng net.accelbyte.sdk.cli.Main platform publicListStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 431 'PublicListStores' test.out

#- 432 PublicExistsAnyMyActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyMyActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --appIds 'dZcZEKUs,afFP1CAZ,2CMlNfOS' \
    --itemIds 'ocK4Fp0g,s0JMslgF,VdefGMrE' \
    --skus 'kSySgDMS,a1ZcyYZJ,aqxOm4kn' \
    > test.out 2>&1
eval_tap $? 432 'PublicExistsAnyMyActiveEntitlement' test.out

#- 433 PublicGetMyAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --appId '3y94JqCJ' \
    > test.out 2>&1
eval_tap $? 433 'PublicGetMyAppEntitlementOwnershipByAppId' test.out

#- 434 PublicGetMyEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'APP' \
    --itemId 'el5rwIUr' \
    > test.out 2>&1
eval_tap $? 434 'PublicGetMyEntitlementOwnershipByItemId' test.out

#- 435 PublicGetMyEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'ENTITLEMENT' \
    --sku 'bD1RiL8i' \
    > test.out 2>&1
eval_tap $? 435 'PublicGetMyEntitlementOwnershipBySku' test.out

#- 436 PublicGetEntitlementOwnershipToken
./ng net.accelbyte.sdk.cli.Main platform publicGetEntitlementOwnershipToken \
    --namespace "$AB_NAMESPACE" \
    --appIds 'h6JMBNTo,4VHt6Rv3,8hEgwEx1' \
    --itemIds 'jd5nyDgH,yayqSmYc,MpxvpJ4e' \
    --skus 'WKL2j9h6,7r3Isl9k,pVG24LFD' \
    > test.out 2>&1
eval_tap $? 436 'PublicGetEntitlementOwnershipToken' test.out

#- 437 SyncTwitchDropsEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement \
    --namespace "$AB_NAMESPACE" \
    --body '{"gameId": "hxqAXDSe", "language": "wGj-EAPw", "region": "14AnQc4l"}' \
    > test.out 2>&1
eval_tap $? 437 'SyncTwitchDropsEntitlement' test.out

#- 438 PublicGetMyWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetMyWallet \
    --currencyCode 'ojKwp0Yq' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 438 'PublicGetMyWallet' test.out

#- 439 SyncEpicGameDLC
./ng net.accelbyte.sdk.cli.Main platform syncEpicGameDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'idOXH69Z' \
    --body '{"epicGamesJwtToken": "HzM3FtK1"}' \
    > test.out 2>&1
eval_tap $? 439 'SyncEpicGameDLC' test.out

#- 440 SyncOculusDLC
./ng net.accelbyte.sdk.cli.Main platform syncOculusDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'jauuoby8' \
    > test.out 2>&1
eval_tap $? 440 'SyncOculusDLC' test.out

#- 441 PublicSyncPsnDlcInventory
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'YLYIc9rU' \
    --body '{"serviceLabel": 66}' \
    > test.out 2>&1
eval_tap $? 441 'PublicSyncPsnDlcInventory' test.out

#- 442 PublicSyncPsnDlcInventoryWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventoryWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'uqBbGP6Z' \
    --body '{"serviceLabels": [89, 99, 47]}' \
    > test.out 2>&1
eval_tap $? 442 'PublicSyncPsnDlcInventoryWithMultipleServiceLabels' test.out

#- 443 SyncSteamDLC
./ng net.accelbyte.sdk.cli.Main platform syncSteamDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'ICx1I9HG' \
    --body '{"appId": "tjA20MDo", "steamId": "XAmDJOta"}' \
    > test.out 2>&1
eval_tap $? 443 'SyncSteamDLC' test.out

#- 444 SyncXboxDLC
./ng net.accelbyte.sdk.cli.Main platform syncXboxDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'flHY0b3A' \
    --body '{"xstsToken": "CDaV9f0T"}' \
    > test.out 2>&1
eval_tap $? 444 'SyncXboxDLC' test.out

#- 445 PublicQueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId '3iTPANl1' \
    --appType 'GAME' \
    --entitlementClazz 'MEDIA' \
    --entitlementName 'NG3tmsWi' \
    --features 'u6H38J0H,MswF3Uqf,82M7t4Wc' \
    --itemId 'PXXgbFGD,1Z9bBVW6,nQpZhzp1' \
    --limit '31' \
    --offset '82' \
    > test.out 2>&1
eval_tap $? 445 'PublicQueryUserEntitlements' test.out

#- 446 PublicGetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId '2YzQstRI' \
    --appId 'xLlM5KRZ' \
    > test.out 2>&1
eval_tap $? 446 'PublicGetUserAppEntitlementByAppId' test.out

#- 447 PublicQueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'kMfRxHNp' \
    --limit '70' \
    --offset '28' \
    --appType 'DEMO' \
    > test.out 2>&1
eval_tap $? 447 'PublicQueryUserEntitlementsByAppType' test.out

#- 448 PublicGetUserEntitlementsByIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementsByIds \
    --namespace "$AB_NAMESPACE" \
    --userId '8KLSatKd' \
    --availablePlatformOnly  \
    --ids '9Iqgp6nz,cc0jTSlI,9NvOiykA' \
    > test.out 2>&1
eval_tap $? 448 'PublicGetUserEntitlementsByIds' test.out

#- 449 PublicGetUserEntitlementByItemId
eval_tap 0 449 'PublicGetUserEntitlementByItemId # SKIP deprecated' test.out

#- 450 PublicGetUserEntitlementBySku
eval_tap 0 450 'PublicGetUserEntitlementBySku # SKIP deprecated' test.out

#- 451 PublicUserEntitlementHistory
./ng net.accelbyte.sdk.cli.Main platform publicUserEntitlementHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'ikxwWxkE' \
    --endDate 'zWRvMlzo' \
    --entitlementClazz 'APP' \
    --limit '44' \
    --offset '21' \
    --startDate '8Fvjmkl1' \
    > test.out 2>&1
eval_tap $? 451 'PublicUserEntitlementHistory' test.out

#- 452 PublicExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'myBq4pf9' \
    --appIds 'p33rwCEA,Or1UcsqA,8I0boO9t' \
    --itemIds '68B6j4Oo,FSskgBMR,9sULjKYH' \
    --skus 'LdBBWYBV,hguDfWzu,fZfaRbyd' \
    > test.out 2>&1
eval_tap $? 452 'PublicExistsAnyUserActiveEntitlement' test.out

#- 453 PublicGetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'lQJRSgDJ' \
    --appId 'Jm8IuxbF' \
    > test.out 2>&1
eval_tap $? 453 'PublicGetUserAppEntitlementOwnershipByAppId' test.out

#- 454 PublicGetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId '0kewpQQs' \
    --entitlementClazz 'APP' \
    --itemId 'z4AN9Lfo' \
    > test.out 2>&1
eval_tap $? 454 'PublicGetUserEntitlementOwnershipByItemId' test.out

#- 455 PublicGetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZwOBMhh0' \
    --ids 'VUGjOjPa,21hvNNV1,zGRbCp7G' \
    > test.out 2>&1
eval_tap $? 455 'PublicGetUserEntitlementOwnershipByItemIds' test.out

#- 456 PublicGetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId '4X17xSH4' \
    --entitlementClazz 'SUBSCRIPTION' \
    --sku 'amthXSNU' \
    > test.out 2>&1
eval_tap $? 456 'PublicGetUserEntitlementOwnershipBySku' test.out

#- 457 PublicGetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlement \
    --entitlementId 'N5YXkHpn' \
    --namespace "$AB_NAMESPACE" \
    --userId '62pTWRfl' \
    > test.out 2>&1
eval_tap $? 457 'PublicGetUserEntitlement' test.out

#- 458 PublicConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicConsumeUserEntitlement \
    --entitlementId 'SMan3UD1' \
    --namespace "$AB_NAMESPACE" \
    --userId 'RU53Hkzr' \
    --body '{"metadata": {"operationSource": "INVENTORY"}, "options": ["k0HLgLPD", "wmGtGP7B", "V9JUA6sn"], "requestId": "iVon8ZSD", "useCount": 67}' \
    > test.out 2>&1
eval_tap $? 458 'PublicConsumeUserEntitlement' test.out

#- 459 PublicSellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicSellUserEntitlement \
    --entitlementId 'dIew5mXp' \
    --namespace "$AB_NAMESPACE" \
    --userId 'tvZ2SIYb' \
    --body '{"requestId": "7dJNamhp", "useCount": 87}' \
    > test.out 2>&1
eval_tap $? 459 'PublicSellUserEntitlement' test.out

#- 460 PublicSplitUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicSplitUserEntitlement \
    --entitlementId '84K5S7p3' \
    --namespace "$AB_NAMESPACE" \
    --userId 'lGw1Ezyp' \
    --body '{"metadata": {"operationSource": "INVENTORY"}, "useCount": 77}' \
    > test.out 2>&1
eval_tap $? 460 'PublicSplitUserEntitlement' test.out

#- 461 PublicTransferUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicTransferUserEntitlement \
    --entitlementId 'dPK5DwcG' \
    --namespace "$AB_NAMESPACE" \
    --userId '7r1vXv7w' \
    --body '{"entitlementId": "aS6cWqeS", "metadata": {"operationSource": "INVENTORY"}, "useCount": 37}' \
    > test.out 2>&1
eval_tap $? 461 'PublicTransferUserEntitlement' test.out

#- 462 PublicRedeemCode
./ng net.accelbyte.sdk.cli.Main platform publicRedeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'wTHflEOm' \
    --body '{"code": "YV8hy2YG", "language": "zQAT", "region": "tqHV7L7n"}' \
    > test.out 2>&1
eval_tap $? 462 'PublicRedeemCode' test.out

#- 463 PublicFulfillAppleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillAppleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'leITV056' \
    --body '{"excludeOldTransactions": true, "language": "jASr-rB", "productId": "jgWgmg0L", "receiptData": "LVSsHqwt", "region": "zQu7yGD6", "transactionId": "nwNK9jM8"}' \
    > test.out 2>&1
eval_tap $? 463 'PublicFulfillAppleIAPItem' test.out

#- 464 SyncEpicGamesInventory
./ng net.accelbyte.sdk.cli.Main platform syncEpicGamesInventory \
    --namespace "$AB_NAMESPACE" \
    --userId '65RkVQAZ' \
    --body '{"epicGamesJwtToken": "fnqGesfs"}' \
    > test.out 2>&1
eval_tap $? 464 'SyncEpicGamesInventory' test.out

#- 465 PublicFulfillGoogleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillGoogleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'G1jFuYHP' \
    --body '{"autoAck": true, "autoConsume": true, "language": "IuP", "orderId": "ogeavOmv", "packageName": "fqLbzVjC", "productId": "hwZ7s4hT", "purchaseTime": 84, "purchaseToken": "eOdgsoSV", "region": "KNarfg5C", "subscriptionPurchase": false}' \
    > test.out 2>&1
eval_tap $? 465 'PublicFulfillGoogleIAPItem' test.out

#- 466 SyncOculusSubscriptions
./ng net.accelbyte.sdk.cli.Main platform syncOculusSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'Xp7dFwUH' \
    --body '{"skus": ["OssxuGCm", "1t9cIHps", "K2ICKz1A"]}' \
    > test.out 2>&1
eval_tap $? 466 'SyncOculusSubscriptions' test.out

#- 467 SyncOculusConsumableEntitlements
./ng net.accelbyte.sdk.cli.Main platform syncOculusConsumableEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'HCNE7JPn' \
    > test.out 2>&1
eval_tap $? 467 'SyncOculusConsumableEntitlements' test.out

#- 468 PublicReconcilePlayStationStore
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStore \
    --namespace "$AB_NAMESPACE" \
    --userId 'nd6hJqVO' \
    --body '{"currencyCode": "mGj9dAjs", "price": 0.650090143644636, "productId": "x3pg0ahz", "serviceLabel": 60}' \
    > test.out 2>&1
eval_tap $? 468 'PublicReconcilePlayStationStore' test.out

#- 469 PublicReconcilePlayStationStoreWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStoreWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'suN2x9BG' \
    --body '{"currencyCode": "13Z4Wnrn", "price": 0.6829775633215281, "productId": "SmVEW998", "serviceLabels": [16, 9, 92]}' \
    > test.out 2>&1
eval_tap $? 469 'PublicReconcilePlayStationStoreWithMultipleServiceLabels' test.out

#- 470 SyncSteamInventory
./ng net.accelbyte.sdk.cli.Main platform syncSteamInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'Xs7xcDae' \
    --body '{"appId": "GkDogfBY", "currencyCode": "rd8YVtwH", "language": "NCCQ-712", "price": 0.20745485131912555, "productId": "OTRO7P6d", "region": "KgBcYIQV", "steamId": "CU1oiS9s"}' \
    > test.out 2>&1
eval_tap $? 470 'SyncSteamInventory' test.out

#- 471 SyncSteamAbnormalTransaction
./ng net.accelbyte.sdk.cli.Main platform syncSteamAbnormalTransaction \
    --namespace "$AB_NAMESPACE" \
    --userId 'IzPdLVXn' \
    > test.out 2>&1
eval_tap $? 471 'SyncSteamAbnormalTransaction' test.out

#- 472 SyncSteamIAPByTransaction
./ng net.accelbyte.sdk.cli.Main platform syncSteamIAPByTransaction \
    --namespace "$AB_NAMESPACE" \
    --userId 'bLimMm8d' \
    --body '{"orderId": "guEwjOrq"}' \
    > test.out 2>&1
eval_tap $? 472 'SyncSteamIAPByTransaction' test.out

#- 473 PublicQueryUserThirdPartySubscription
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserThirdPartySubscription \
    --namespace "$AB_NAMESPACE" \
    --platform 'OCULUS' \
    --userId '5qsseK8S' \
    --activeOnly  \
    --groupId 'At05hNnp' \
    --limit '31' \
    --offset '25' \
    --productId 'pIVF4kqU' \
    > test.out 2>&1
eval_tap $? 473 'PublicQueryUserThirdPartySubscription' test.out

#- 474 SyncTwitchDropsEntitlement1
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'pWTMOQ4S' \
    --body '{"gameId": "41ohdXI3", "language": "YW_Uu", "region": "ouhLQpTa"}' \
    > test.out 2>&1
eval_tap $? 474 'SyncTwitchDropsEntitlement1' test.out

#- 475 SyncXboxInventory
./ng net.accelbyte.sdk.cli.Main platform syncXboxInventory \
    --namespace "$AB_NAMESPACE" \
    --userId '4G6xUOb2' \
    --body '{"currencyCode": "tgSFyldk", "price": 0.38396258984261644, "productId": "K2JbAFlQ", "xstsToken": "qVuu1Nx1"}' \
    > test.out 2>&1
eval_tap $? 475 'SyncXboxInventory' test.out

#- 476 PublicQueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'ALgd1y2t' \
    --discounted  \
    --itemId 'CbDNPLt3' \
    --limit '24' \
    --offset '33' \
    --status 'REFUNDED' \
    > test.out 2>&1
eval_tap $? 476 'PublicQueryUserOrders' test.out

#- 477 PublicCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'wblRjYS2' \
    --body '{"currencyCode": "e3PBRPCM", "discountCodes": ["72p9ZPA4", "IRuxlCa0", "CYozaeqT"], "discountedPrice": 75, "ext": {"aRUJRINf": {}, "JMDNW4sZ": {}, "B0Y4TmbB": {}}, "itemId": "IjM5DQR9", "language": "DnZ", "price": 13, "quantity": 83, "region": "87NqmDUQ", "returnUrl": "cgOpBAwI", "sectionId": "ocFxxwUa"}' \
    > test.out 2>&1
eval_tap $? 477 'PublicCreateUserOrder' test.out

#- 478 PublicPreviewOrderPrice
./ng net.accelbyte.sdk.cli.Main platform publicPreviewOrderPrice \
    --namespace "$AB_NAMESPACE" \
    --userId 'F62wFYe6' \
    --body '{"currencyCode": "bBDVYxb4", "discountCodes": ["8Tt9Qg4G", "UMp7NHTE", "XuK6KJVc"], "discountedPrice": 27, "itemId": "8bErVh9e", "price": 19, "quantity": 77}' \
    > test.out 2>&1
eval_tap $? 478 'PublicPreviewOrderPrice' test.out

#- 479 PublicGetUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'sUP6K2Dq' \
    --userId 've9OFkck' \
    > test.out 2>&1
eval_tap $? 479 'PublicGetUserOrder' test.out

#- 480 PublicCancelUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCancelUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'EnPhrz8j' \
    --userId 'LnUDjzJY' \
    > test.out 2>&1
eval_tap $? 480 'PublicCancelUserOrder' test.out

#- 481 PublicGetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'AvluW4Vg' \
    --userId 'FaGJgd4d' \
    > test.out 2>&1
eval_tap $? 481 'PublicGetUserOrderHistories' test.out

#- 482 PublicDownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform publicDownloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'ee4xrNtN' \
    --userId 'xmYTK8tN' \
    > test.out 2>&1
eval_tap $? 482 'PublicDownloadUserOrderReceipt' test.out

#- 483 PublicGetPaymentAccounts
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'oKKq9Hc1' \
    > test.out 2>&1
eval_tap $? 483 'PublicGetPaymentAccounts' test.out

#- 484 PublicDeletePaymentAccount
./ng net.accelbyte.sdk.cli.Main platform publicDeletePaymentAccount \
    --id 'w3CZ4sf8' \
    --namespace "$AB_NAMESPACE" \
    --type 'paypal' \
    --userId 'YLNTYJUJ' \
    > test.out 2>&1
eval_tap $? 484 'PublicDeletePaymentAccount' test.out

#- 485 PublicListActiveSections
./ng net.accelbyte.sdk.cli.Main platform publicListActiveSections \
    --namespace "$AB_NAMESPACE" \
    --userId 'zq9CEdJX' \
    --autoCalcEstimatedPrice  \
    --language 'zIdy9Frg' \
    --region 'POacHV0U' \
    --storeId 'opbbPM8r' \
    --viewId 'YUN47XvZ' \
    > test.out 2>&1
eval_tap $? 485 'PublicListActiveSections' test.out

#- 486 PublicQueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'gqilTFGo' \
    --chargeStatus 'RECURRING_CHARGING' \
    --itemId 'Vc8BtmNC' \
    --limit '17' \
    --offset '70' \
    --sku 'C5udsZXZ' \
    --status 'ACTIVE' \
    --subscribedBy 'USER' \
    > test.out 2>&1
eval_tap $? 486 'PublicQueryUserSubscriptions' test.out

#- 487 PublicSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform publicSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'cvzPXAFm' \
    --body '{"currencyCode": "tOqlhKPY", "itemId": "mQ6QNCD1", "language": "pG_093", "region": "3Q7TD6Ho", "returnUrl": "a3Kt3UQB", "source": "TMcr0gTr"}' \
    > test.out 2>&1
eval_tap $? 487 'PublicSubscribeSubscription' test.out

#- 488 PublicCheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform publicCheckUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId '2gWUQGOb' \
    --itemId 'PqjhxSAU' \
    > test.out 2>&1
eval_tap $? 488 'PublicCheckUserSubscriptionSubscribableByItemId' test.out

#- 489 PublicGetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'E50G4Fgx' \
    --userId 'mAKKMhru' \
    > test.out 2>&1
eval_tap $? 489 'PublicGetUserSubscription' test.out

#- 490 PublicChangeSubscriptionBillingAccount
./ng net.accelbyte.sdk.cli.Main platform publicChangeSubscriptionBillingAccount \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'p5V2RrIe' \
    --userId 'E0M4PIx5' \
    > test.out 2>&1
eval_tap $? 490 'PublicChangeSubscriptionBillingAccount' test.out

#- 491 PublicCancelSubscription
./ng net.accelbyte.sdk.cli.Main platform publicCancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'IdtnVaq5' \
    --userId 'GiTPzCRQ' \
    --body '{"immediate": true, "reason": "qHeEcpva"}' \
    > test.out 2>&1
eval_tap $? 491 'PublicCancelSubscription' test.out

#- 492 PublicGetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'fLF2AESB' \
    --userId 'UwmrhxRw' \
    --excludeFree  \
    --limit '45' \
    --offset '85' \
    > test.out 2>&1
eval_tap $? 492 'PublicGetUserSubscriptionBillingHistories' test.out

#- 493 PublicListViews
./ng net.accelbyte.sdk.cli.Main platform publicListViews \
    --namespace "$AB_NAMESPACE" \
    --userId 'rib5vj01' \
    --language 'F3FW6I9O' \
    --storeId '3eRB20Y7' \
    > test.out 2>&1
eval_tap $? 493 'PublicListViews' test.out

#- 494 PublicGetWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetWallet \
    --currencyCode 'TEZ9ut12' \
    --namespace "$AB_NAMESPACE" \
    --userId 'I3TKgWVl' \
    > test.out 2>&1
eval_tap $? 494 'PublicGetWallet' test.out

#- 495 PublicListUserWalletTransactions
./ng net.accelbyte.sdk.cli.Main platform publicListUserWalletTransactions \
    --currencyCode 'nADgWkPb' \
    --namespace "$AB_NAMESPACE" \
    --userId '5NeuN5sT' \
    --limit '57' \
    --offset '45' \
    > test.out 2>&1
eval_tap $? 495 'PublicListUserWalletTransactions' test.out

#- 496 PublicGetMyDLCContent
./ng net.accelbyte.sdk.cli.Main platform publicGetMyDLCContent \
    --includeAllNamespaces  \
    --type 'OCULUS' \
    > test.out 2>&1
eval_tap $? 496 'PublicGetMyDLCContent' test.out

#- 497 QueryFulfillments
./ng net.accelbyte.sdk.cli.Main platform queryFulfillments \
    --namespace "$AB_NAMESPACE" \
    --endTime 'KzbbP1Pi' \
    --limit '64' \
    --offset '37' \
    --startTime 'yvzBHxEF' \
    --state 'REVOKED' \
    --transactionId 'fpurcYRK' \
    --userId 'qpSxKWq5' \
    > test.out 2>&1
eval_tap $? 497 'QueryFulfillments' test.out

#- 498 QueryItemsV2
./ng net.accelbyte.sdk.cli.Main platform queryItemsV2 \
    --namespace "$AB_NAMESPACE" \
    --appType 'SOFTWARE' \
    --availableDate 'jVmZIjoU' \
    --baseAppId 'VwVPtCy4' \
    --categoryPath 'RmqNdRwj' \
    --features 'zjGEjcpU' \
    --includeSubCategoryItem  \
    --itemName '8s1pxdRE' \
    --itemStatus 'ACTIVE' \
    --itemType 'EXTENSION,SEASON,EXTENSION' \
    --limit '84' \
    --offset '31' \
    --region 'mZnVzmg0' \
    --sectionExclusive  \
    --sortBy 'updatedAt:asc,name:asc,updatedAt:desc' \
    --storeId 'mikbRwKX' \
    --tags 'qanOacS6' \
    --targetNamespace 'ljASSAwg' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 498 'QueryItemsV2' test.out

#- 499 ImportStore1
./ng net.accelbyte.sdk.cli.Main platform importStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'TfiAKNrS' \
    --strictMode  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 499 'ImportStore1' test.out

#- 500 ExportStore1
./ng net.accelbyte.sdk.cli.Main platform exportStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'bliepDpR' \
    --body '{"itemIds": ["i06nheE1", "lLZypIKL", "5EEqzH3p"]}' \
    > test.out 2>&1
eval_tap $? 500 'ExportStore1' test.out

#- 501 FulfillRewardsV2
./ng net.accelbyte.sdk.cli.Main platform fulfillRewardsV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ybTRTyB8' \
    --body '{"entitlementCollectionId": "mmzIZiVp", "entitlementOrigin": "Playstation", "metadata": {"E78C3Q0I": {}, "yFvjzbB7": {}, "nsnlIDaJ": {}}, "origin": "IOS", "rewards": [{"currency": {"currencyCode": "YwXQJUrI", "namespace": "RAIgdn6V"}, "item": {"itemId": "kMeWJXj3", "itemName": "L8aWjrEM", "itemSku": "wv5Qs7Js", "itemType": "436Qxaqq"}, "quantity": 93, "type": "ITEM"}, {"currency": {"currencyCode": "jvYZjyzI", "namespace": "TAjCfUx0"}, "item": {"itemId": "NdPOwSER", "itemName": "cmO9BnUN", "itemSku": "V3fRxYHV", "itemType": "jMT8emJ1"}, "quantity": 7, "type": "CURRENCY"}, {"currency": {"currencyCode": "zR1aHHaM", "namespace": "5Ws6teRa"}, "item": {"itemId": "y4f74Uhf", "itemName": "4t2I9iag", "itemSku": "e61sVU22", "itemType": "QqKul8CF"}, "quantity": 7, "type": "ITEM"}], "source": "OTHER", "transactionId": "gnTib3C7"}' \
    > test.out 2>&1
eval_tap $? 501 'FulfillRewardsV2' test.out

#- 502 FulfillItems
eval_tap 0 502 'FulfillItems # SKIP deprecated' test.out

#- 503 RetryFulfillItems
eval_tap 0 503 'RetryFulfillItems # SKIP deprecated' test.out

#- 504 RevokeItems
eval_tap 0 504 'RevokeItems # SKIP deprecated' test.out

#- 505 V2PublicFulfillAppleIAPItem
./ng net.accelbyte.sdk.cli.Main platform v2PublicFulfillAppleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'dSdgVruz' \
    --body '{"transactionId": "WalWP0dA"}' \
    > test.out 2>&1
eval_tap $? 505 'V2PublicFulfillAppleIAPItem' test.out

#- 506 BulkFulfillItemsV3
./ng net.accelbyte.sdk.cli.Main platform bulkFulfillItemsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'MIkTHFlo' \
    --body '[{"items": [{"duration": 21, "endDate": "1973-07-08T00:00:00Z", "entitlementCollectionId": "bynO7cqM", "entitlementOrigin": "GooglePlay", "itemId": "eKRrNrI6", "itemSku": "3cGO6rD4", "language": "MWaAISSA", "metadata": {"QxV7UBHO": {}, "mOA7FMR9": {}, "xfWc9NtS": {}}, "orderNo": "vxM29cMa", "origin": "Xbox", "quantity": 45, "region": "6oK7S5Yz", "source": "SELL_BACK", "startDate": "1986-04-06T00:00:00Z", "storeId": "fZ5fIx1R"}, {"duration": 43, "endDate": "1981-09-20T00:00:00Z", "entitlementCollectionId": "iU5cIFve", "entitlementOrigin": "Nintendo", "itemId": "gf4haQKU", "itemSku": "FvmtAuN8", "language": "FdZig02z", "metadata": {"jgh7WG7U": {}, "ApfyIZYp": {}, "eVo1N8Ha": {}}, "orderNo": "uzA8DugF", "origin": "Steam", "quantity": 69, "region": "BvlWS3jG", "source": "SELL_BACK", "startDate": "1991-01-09T00:00:00Z", "storeId": "PbJWKUAI"}, {"duration": 61, "endDate": "1998-10-16T00:00:00Z", "entitlementCollectionId": "QxHaiSuM", "entitlementOrigin": "IOS", "itemId": "4ec3ekEF", "itemSku": "Lixnya47", "language": "v4ALhZ66", "metadata": {"fFVp6lp3": {}, "rQfHTx2b": {}, "ALLqSzJN": {}}, "orderNo": "SnG5ZOeO", "origin": "IOS", "quantity": 30, "region": "XJIa24o2", "source": "OTHER", "startDate": "1980-04-15T00:00:00Z", "storeId": "pEdiPMhy"}], "transactionId": "cJCeBZP5"}, {"items": [{"duration": 8, "endDate": "1980-08-10T00:00:00Z", "entitlementCollectionId": "FZat6Bh6", "entitlementOrigin": "Oculus", "itemId": "CDXh3Nhs", "itemSku": "JBHBZZvV", "language": "t5uS0vDw", "metadata": {"5zGY7sHU": {}, "KujkajrF": {}, "cWM9qqUW": {}}, "orderNo": "CVBiA320", "origin": "Other", "quantity": 84, "region": "BitKKI0Z", "source": "PAYMENT", "startDate": "1991-12-03T00:00:00Z", "storeId": "HngXKNyZ"}, {"duration": 77, "endDate": "1995-10-16T00:00:00Z", "entitlementCollectionId": "UwIRYYKl", "entitlementOrigin": "Other", "itemId": "NbWPkKUZ", "itemSku": "PfekyMtd", "language": "reB78fBi", "metadata": {"G21I6Ao3": {}, "ATq64nfF": {}, "pl1K2bsj": {}}, "orderNo": "PbinZQJz", "origin": "Epic", "quantity": 10, "region": "NT6wCKEO", "source": "SELL_BACK", "startDate": "1986-09-29T00:00:00Z", "storeId": "QlsgMQ1I"}, {"duration": 55, "endDate": "1976-04-12T00:00:00Z", "entitlementCollectionId": "80WLGmdq", "entitlementOrigin": "Other", "itemId": "AIhL4my8", "itemSku": "32nirmvb", "language": "OC5lgtFJ", "metadata": {"C1TXviR0": {}, "EYGFQcfH": {}, "dDMeunW1": {}}, "orderNo": "gz92V73y", "origin": "Twitch", "quantity": 23, "region": "6F24UHue", "source": "PROMOTION", "startDate": "1989-06-11T00:00:00Z", "storeId": "K6vH20Cr"}], "transactionId": "cqeleNKB"}, {"items": [{"duration": 22, "endDate": "1998-03-13T00:00:00Z", "entitlementCollectionId": "a5rn3ksB", "entitlementOrigin": "IOS", "itemId": "LkC1G5Ih", "itemSku": "ITQ0y6X9", "language": "ZQCe3Vki", "metadata": {"GlrsjmtX": {}, "PQI0fY32": {}, "xC7AQLlK": {}}, "orderNo": "fdj30a1t", "origin": "Epic", "quantity": 14, "region": "d2PFNdmc", "source": "GIFT", "startDate": "1991-06-30T00:00:00Z", "storeId": "kRXob3N1"}, {"duration": 93, "endDate": "1980-11-12T00:00:00Z", "entitlementCollectionId": "jaqorNY2", "entitlementOrigin": "Other", "itemId": "PSUspSjv", "itemSku": "6n6rybBD", "language": "cyyfeK8j", "metadata": {"pAj6PW5h": {}, "zcN218YM": {}, "OqgcmyfD": {}}, "orderNo": "ri8JNrn5", "origin": "Other", "quantity": 68, "region": "ERQLYrho", "source": "DLC", "startDate": "1978-05-30T00:00:00Z", "storeId": "NFBkkVJb"}, {"duration": 19, "endDate": "1983-10-31T00:00:00Z", "entitlementCollectionId": "dZPfULtt", "entitlementOrigin": "Nintendo", "itemId": "k2bh6eUL", "itemSku": "Hu5oQunr", "language": "1ccToLrc", "metadata": {"VevBJx4R": {}, "Zecut7r4": {}, "cDDUbviw": {}}, "orderNo": "U159uXZA", "origin": "Oculus", "quantity": 96, "region": "sFhUuPd7", "source": "REFERRAL_BONUS", "startDate": "1979-02-01T00:00:00Z", "storeId": "MWgGh51z"}], "transactionId": "LLZbkQEQ"}]' \
    > test.out 2>&1
eval_tap $? 506 'BulkFulfillItemsV3' test.out

#- 507 FulfillItemsV3
./ng net.accelbyte.sdk.cli.Main platform fulfillItemsV3 \
    --namespace "$AB_NAMESPACE" \
    --transactionId 'ZgQafqYp' \
    --userId 'fqrx2RQt' \
    --body '{"items": [{"duration": 9, "endDate": "1974-01-22T00:00:00Z", "entitlementCollectionId": "8KugVWsi", "entitlementOrigin": "Steam", "itemId": "cicFsrAY", "itemSku": "UwsyeN7T", "language": "yETMJpft", "metadata": {"64Qnm0F1": {}, "Y3fxeHGr": {}, "FQNdA31l": {}}, "orderNo": "EbbVRF1K", "origin": "Nintendo", "quantity": 39, "region": "n43kOYNM", "source": "PROMOTION", "startDate": "1985-04-11T00:00:00Z", "storeId": "kqMIabnU"}, {"duration": 27, "endDate": "1976-09-06T00:00:00Z", "entitlementCollectionId": "3jbmMyTb", "entitlementOrigin": "Steam", "itemId": "zal3AMYO", "itemSku": "12vg5wLs", "language": "1Xf9Xe0o", "metadata": {"qwvQaXj0": {}, "MIeJ0M0r": {}, "SiksStey": {}}, "orderNo": "wGNj3TeG", "origin": "Other", "quantity": 7, "region": "HaUdFBlm", "source": "IAP", "startDate": "1997-04-18T00:00:00Z", "storeId": "3onsAAr1"}, {"duration": 40, "endDate": "1973-01-10T00:00:00Z", "entitlementCollectionId": "eNvkdCv1", "entitlementOrigin": "Twitch", "itemId": "FWHIHAyI", "itemSku": "1isVV3NS", "language": "B8bRMax3", "metadata": {"2enyO6DC": {}, "RqGSJpEJ": {}, "po4VyypJ": {}}, "orderNo": "t22oHJaa", "origin": "Oculus", "quantity": 32, "region": "T2bw9wUU", "source": "DLC", "startDate": "1995-01-16T00:00:00Z", "storeId": "P15AB6pL"}]}' \
    > test.out 2>&1
eval_tap $? 507 'FulfillItemsV3' test.out

#- 508 RetryFulfillItemsV3
./ng net.accelbyte.sdk.cli.Main platform retryFulfillItemsV3 \
    --namespace "$AB_NAMESPACE" \
    --transactionId 'xOtEJd5C' \
    --userId 'Q03Uenwo' \
    > test.out 2>&1
eval_tap $? 508 'RetryFulfillItemsV3' test.out

#- 509 RevokeItemsV3
./ng net.accelbyte.sdk.cli.Main platform revokeItemsV3 \
    --namespace "$AB_NAMESPACE" \
    --transactionId 'KTx3bmqN' \
    --userId 'eqVcx8B3' \
    > test.out 2>&1
eval_tap $? 509 'RevokeItemsV3' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
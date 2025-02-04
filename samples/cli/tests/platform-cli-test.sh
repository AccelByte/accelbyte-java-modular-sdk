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
echo "1..486"

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
    --id 't4VVlVqT' \
    > test.out 2>&1
eval_tap $? 3 'GetFulfillmentScript' test.out

#- 4 CreateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform createFulfillmentScript \
    --id 'n9nLHX5A' \
    --body '{"grantDays": "dICMkAnO"}' \
    > test.out 2>&1
eval_tap $? 4 'CreateFulfillmentScript' test.out

#- 5 DeleteFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform deleteFulfillmentScript \
    --id 'uddRHwDU' \
    > test.out 2>&1
eval_tap $? 5 'DeleteFulfillmentScript' test.out

#- 6 UpdateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform updateFulfillmentScript \
    --id 'GyMGPAek' \
    --body '{"grantDays": "LY0QUEZl"}' \
    > test.out 2>&1
eval_tap $? 6 'UpdateFulfillmentScript' test.out

#- 7 ListItemTypeConfigs
./ng net.accelbyte.sdk.cli.Main platform listItemTypeConfigs \
    > test.out 2>&1
eval_tap $? 7 'ListItemTypeConfigs' test.out

#- 8 CreateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform createItemTypeConfig \
    --body '{"clazz": "tgTbLzoU", "dryRun": false, "fulfillmentUrl": "ShbVts7N", "itemType": "CODE", "purchaseConditionUrl": "eBhpCcVN"}' \
    > test.out 2>&1
eval_tap $? 8 'CreateItemTypeConfig' test.out

#- 9 SearchItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform searchItemTypeConfig \
    --clazz 'oXzi710V' \
    --itemType 'APP' \
    > test.out 2>&1
eval_tap $? 9 'SearchItemTypeConfig' test.out

#- 10 GetItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform getItemTypeConfig \
    --id '71Ovuun1' \
    > test.out 2>&1
eval_tap $? 10 'GetItemTypeConfig' test.out

#- 11 UpdateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform updateItemTypeConfig \
    --id '9GWBaN0Z' \
    --body '{"clazz": "dyyCNw2i", "dryRun": false, "fulfillmentUrl": "qkwR6v0c", "purchaseConditionUrl": "3WwLPdY0"}' \
    > test.out 2>&1
eval_tap $? 11 'UpdateItemTypeConfig' test.out

#- 12 DeleteItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform deleteItemTypeConfig \
    --id 'Oov1HxNh' \
    > test.out 2>&1
eval_tap $? 12 'DeleteItemTypeConfig' test.out

#- 13 QueryCampaigns
./ng net.accelbyte.sdk.cli.Main platform queryCampaigns \
    --namespace "$AB_NAMESPACE" \
    --limit '13' \
    --name '4xiMbD9h' \
    --offset '34' \
    --tag 'fLlCvaxH' \
    > test.out 2>&1
eval_tap $? 13 'QueryCampaigns' test.out

#- 14 CreateCampaign
./ng net.accelbyte.sdk.cli.Main platform createCampaign \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "C542Xb9P", "discountConfig": {"categories": [{"categoryPath": "lARJKRM3", "includeSubCategories": false}, {"categoryPath": "365uyR6X", "includeSubCategories": true}, {"categoryPath": "m2ByW9OB", "includeSubCategories": false}], "currencyCode": "ZP5PN6ey", "currencyNamespace": "2uH917E3", "discountAmount": 42, "discountPercentage": 97, "discountType": "PERCENTAGE", "items": [{"itemId": "IEkNLLm7", "itemName": "OkxBhL72"}, {"itemId": "UieRpar5", "itemName": "IWD0d517"}, {"itemId": "cWRvZUXD", "itemName": "QO4ERDnm"}], "restrictType": "NONE", "stackable": true}, "items": [{"extraSubscriptionDays": 75, "itemId": "ZiJ5Dtt6", "itemName": "nekGSW9z", "quantity": 11}, {"extraSubscriptionDays": 11, "itemId": "TFc1cU1S", "itemName": "gxdFHDJr", "quantity": 78}, {"extraSubscriptionDays": 64, "itemId": "vZnPgUgr", "itemName": "VHpHmwSZ", "quantity": 73}], "maxRedeemCountPerCampaignPerUser": 61, "maxRedeemCountPerCode": 58, "maxRedeemCountPerCodePerUser": 41, "maxSaleCount": 2, "name": "dARvkARt", "redeemEnd": "1997-04-27T00:00:00Z", "redeemStart": "1975-11-16T00:00:00Z", "redeemType": "ITEM", "status": "INACTIVE", "tags": ["mRAStaqR", "nqXJ59xY", "b6RteDWN"], "type": "REDEMPTION"}' \
    > test.out 2>&1
eval_tap $? 14 'CreateCampaign' test.out

#- 15 GetCampaign
./ng net.accelbyte.sdk.cli.Main platform getCampaign \
    --campaignId 'HgYMFC99' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'GetCampaign' test.out

#- 16 UpdateCampaign
./ng net.accelbyte.sdk.cli.Main platform updateCampaign \
    --campaignId 'YhsdD3hR' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "QK8ifx3G", "discountConfig": {"categories": [{"categoryPath": "A3GG1gcZ", "includeSubCategories": true}, {"categoryPath": "xCTKeXiJ", "includeSubCategories": true}, {"categoryPath": "IvKe9C9K", "includeSubCategories": true}], "currencyCode": "TQmwUpfk", "currencyNamespace": "wgoFSGdK", "discountAmount": 30, "discountPercentage": 61, "discountType": "AMOUNT", "items": [{"itemId": "4adb1f8A", "itemName": "QVU7og2E"}, {"itemId": "ACK5LzYk", "itemName": "8E41Nri8"}, {"itemId": "w9kS8iEI", "itemName": "xUQceYyu"}], "restrictType": "NONE", "stackable": true}, "items": [{"extraSubscriptionDays": 83, "itemId": "FAqoE97l", "itemName": "l1r4ppZa", "quantity": 4}, {"extraSubscriptionDays": 34, "itemId": "GAYyuTI7", "itemName": "7t1dm8k0", "quantity": 37}, {"extraSubscriptionDays": 80, "itemId": "EvlTRSbs", "itemName": "m3A2ejD3", "quantity": 68}], "maxRedeemCountPerCampaignPerUser": 60, "maxRedeemCountPerCode": 54, "maxRedeemCountPerCodePerUser": 74, "maxSaleCount": 24, "name": "SwFUoJGU", "redeemEnd": "1992-12-09T00:00:00Z", "redeemStart": "1983-12-17T00:00:00Z", "redeemType": "DISCOUNT", "status": "ACTIVE", "tags": ["Je20U2ko", "XArBmmIp", "aqmO363l"]}' \
    > test.out 2>&1
eval_tap $? 16 'UpdateCampaign' test.out

#- 17 RenameBatch
./ng net.accelbyte.sdk.cli.Main platform renameBatch \
    --campaignId 'WOWcS6WZ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"newName": "lZlJ0WoQ", "oldName": "qpdeuKKK"}' \
    > test.out 2>&1
eval_tap $? 17 'RenameBatch' test.out

#- 18 QueryCampaignBatchNames
./ng net.accelbyte.sdk.cli.Main platform queryCampaignBatchNames \
    --campaignId 'hdNC1Fg5' \
    --namespace "$AB_NAMESPACE" \
    --batchName 'zQjlY2ne' \
    --limit '79' \
    > test.out 2>&1
eval_tap $? 18 'QueryCampaignBatchNames' test.out

#- 19 GetCampaignDynamic
./ng net.accelbyte.sdk.cli.Main platform getCampaignDynamic \
    --campaignId 'GDJrqE1L' \
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
    --body '{"enableInventoryCheck": true}' \
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
    --body '{"appConfig": {"appName": "zdM6ymJ8"}, "customConfig": {"connectionType": "INSECURE", "grpcServerAddress": "nojjrzj9"}, "extendType": "APP"}' \
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
    --body '{"appConfig": {"appName": "DeAGMuEd"}, "customConfig": {"connectionType": "INSECURE", "grpcServerAddress": "FLiRJfCo"}, "extendType": "CUSTOM"}' \
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
    --storeId '6L0jgMqa' \
    > test.out 2>&1
eval_tap $? 31 'GetRootCategories' test.out

#- 32 CreateCategory
./ng net.accelbyte.sdk.cli.Main platform createCategory \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ucPJPUzA' \
    --body '{"categoryPath": "zTOg21l9", "localizationDisplayNames": {"yJ1IEy09": "EItbnlWN", "4bZcWad9": "LZa7XkMM", "fhLV6UVQ": "terGOExN"}}' \
    > test.out 2>&1
eval_tap $? 32 'CreateCategory' test.out

#- 33 ListCategoriesBasic
./ng net.accelbyte.sdk.cli.Main platform listCategoriesBasic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'xkJlJAEs' \
    > test.out 2>&1
eval_tap $? 33 'ListCategoriesBasic' test.out

#- 34 GetCategory
./ng net.accelbyte.sdk.cli.Main platform getCategory \
    --categoryPath '6GdZY4Q9' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'h4OWt2jp' \
    > test.out 2>&1
eval_tap $? 34 'GetCategory' test.out

#- 35 UpdateCategory
./ng net.accelbyte.sdk.cli.Main platform updateCategory \
    --categoryPath 'x1QCNWBC' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'q6UwaVQ1' \
    --body '{"localizationDisplayNames": {"QKzTDCsJ": "1bv0Z0F3", "I9jDFgxc": "fxLb8nxg", "79PMk0mE": "sPKWSyAF"}}' \
    > test.out 2>&1
eval_tap $? 35 'UpdateCategory' test.out

#- 36 DeleteCategory
./ng net.accelbyte.sdk.cli.Main platform deleteCategory \
    --categoryPath '2JRaAS8Y' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ExGj7ixM' \
    > test.out 2>&1
eval_tap $? 36 'DeleteCategory' test.out

#- 37 GetChildCategories
./ng net.accelbyte.sdk.cli.Main platform getChildCategories \
    --categoryPath 'jVZF8GLE' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'PMHpLOBU' \
    > test.out 2>&1
eval_tap $? 37 'GetChildCategories' test.out

#- 38 GetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform getDescendantCategories \
    --categoryPath 'Z8xXnW3N' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'DIYN8IUC' \
    > test.out 2>&1
eval_tap $? 38 'GetDescendantCategories' test.out

#- 39 QueryCodes
./ng net.accelbyte.sdk.cli.Main platform queryCodes \
    --campaignId 'xmakVVG4' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --batchName 'fCccDd3w' \
    --batchNo '30,50,34' \
    --code 'E0OMqpQb' \
    --limit '72' \
    --offset '64' \
    --withBatchName  \
    > test.out 2>&1
eval_tap $? 39 'QueryCodes' test.out

#- 40 CreateCodes
./ng net.accelbyte.sdk.cli.Main platform createCodes \
    --campaignId 'cnUtS8OV' \
    --namespace "$AB_NAMESPACE" \
    --body '{"batchName": "06Yr4Yw0", "codeValue": "lSy4fAN3", "quantity": 29}' \
    > test.out 2>&1
eval_tap $? 40 'CreateCodes' test.out

#- 41 Download
./ng net.accelbyte.sdk.cli.Main platform download \
    --campaignId 'Qjrr0aG0' \
    --namespace "$AB_NAMESPACE" \
    --batchName 'FLMib8TI' \
    --batchNo '45,66,23' \
    --withBatchName  \
    > test.out 2>&1
eval_tap $? 41 'Download' test.out

#- 42 BulkDisableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkDisableCodes \
    --campaignId 'AuiBG3ea' \
    --namespace "$AB_NAMESPACE" \
    --batchName 'vm1mcOW1' \
    --batchNo '52,81,25' \
    > test.out 2>&1
eval_tap $? 42 'BulkDisableCodes' test.out

#- 43 BulkEnableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkEnableCodes \
    --campaignId 'TWleYzDZ' \
    --namespace "$AB_NAMESPACE" \
    --batchName 'tC6qm6Ij' \
    --batchNo '53,19,26' \
    > test.out 2>&1
eval_tap $? 43 'BulkEnableCodes' test.out

#- 44 QueryRedeemHistory
./ng net.accelbyte.sdk.cli.Main platform queryRedeemHistory \
    --campaignId '52ooP6r8' \
    --namespace "$AB_NAMESPACE" \
    --code 'iNhVwScr' \
    --limit '85' \
    --offset '45' \
    --userId 'iXdeDpZn' \
    > test.out 2>&1
eval_tap $? 44 'QueryRedeemHistory' test.out

#- 45 GetCode
./ng net.accelbyte.sdk.cli.Main platform getCode \
    --code 'tdzx1eNq' \
    --namespace "$AB_NAMESPACE" \
    --redeemable  \
    --withBatchName  \
    > test.out 2>&1
eval_tap $? 45 'GetCode' test.out

#- 46 DisableCode
./ng net.accelbyte.sdk.cli.Main platform disableCode \
    --code 'FRBUj6cq' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 46 'DisableCode' test.out

#- 47 EnableCode
./ng net.accelbyte.sdk.cli.Main platform enableCode \
    --code 'gxwTUWen' \
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
    --body '{"currencyCode": "bfWgexKa", "currencySymbol": "JqNpqhjs", "currencyType": "VIRTUAL", "decimals": 64, "localizationDescriptions": {"R9epEzXR": "YFjDXdWl", "KyUFiT4A": "UOF48nyE", "bgv9Zpxo": "wVoTP12W"}}' \
    > test.out 2>&1
eval_tap $? 52 'CreateCurrency' test.out

#- 53 UpdateCurrency
./ng net.accelbyte.sdk.cli.Main platform updateCurrency \
    --currencyCode 'wcqJoVlM' \
    --namespace "$AB_NAMESPACE" \
    --body '{"localizationDescriptions": {"DdDvSIDI": "JxKw8ZEH", "0SKqqMmR": "05daWgNs", "pbp4vCxB": "XTNX9vkf"}}' \
    > test.out 2>&1
eval_tap $? 53 'UpdateCurrency' test.out

#- 54 DeleteCurrency
./ng net.accelbyte.sdk.cli.Main platform deleteCurrency \
    --currencyCode 'btEYzTWA' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 54 'DeleteCurrency' test.out

#- 55 GetCurrencyConfig
./ng net.accelbyte.sdk.cli.Main platform getCurrencyConfig \
    --currencyCode 'h4JUyI0A' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 55 'GetCurrencyConfig' test.out

#- 56 GetCurrencySummary
./ng net.accelbyte.sdk.cli.Main platform getCurrencySummary \
    --currencyCode '6fZszQD8' \
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
    --body '{"data": [{"id": "LGtxTJ6a", "rewards": [{"currency": {"currencyCode": "YBzGESyQ", "namespace": "ncgBTWYB"}, "item": {"itemId": "52TgjzpW", "itemName": "d4NohrOn", "itemSku": "vuyDUfXI", "itemType": "3FcypeWa"}, "quantity": 83, "type": "ITEM"}, {"currency": {"currencyCode": "P8KcV9YI", "namespace": "RhwRkUpW"}, "item": {"itemId": "funV5xOz", "itemName": "5va8C6xZ", "itemSku": "MfGNzX48", "itemType": "4UtMsONw"}, "quantity": 25, "type": "ITEM"}, {"currency": {"currencyCode": "DWu6v0G5", "namespace": "i3f6yv5A"}, "item": {"itemId": "sF5NzkgQ", "itemName": "gBFf2KtU", "itemSku": "C27yNXfz", "itemType": "J3URxRvR"}, "quantity": 75, "type": "ITEM"}]}, {"id": "QeiMckXY", "rewards": [{"currency": {"currencyCode": "vwOcxkQt", "namespace": "MYAcTzvz"}, "item": {"itemId": "KcZJLoIp", "itemName": "a7aa6e3P", "itemSku": "D50Qfzdd", "itemType": "fM0kF7Ok"}, "quantity": 71, "type": "CURRENCY"}, {"currency": {"currencyCode": "3aj3TDJI", "namespace": "pz0RmYWj"}, "item": {"itemId": "8FVOzM3t", "itemName": "sFp8uyvD", "itemSku": "0fpc66Hd", "itemType": "Wt2dvAqW"}, "quantity": 78, "type": "CURRENCY"}, {"currency": {"currencyCode": "l2WD1oDP", "namespace": "fP9eoiOr"}, "item": {"itemId": "5Q8tt0Pg", "itemName": "9sW9bCdp", "itemSku": "68e3cluR", "itemType": "bTDj4n27"}, "quantity": 1, "type": "ITEM"}]}, {"id": "V4BPPpgj", "rewards": [{"currency": {"currencyCode": "s4kuyRIO", "namespace": "TVgU2hND"}, "item": {"itemId": "z46UFMpS", "itemName": "tXNF7naF", "itemSku": "87uAbH0L", "itemType": "kXDdLKch"}, "quantity": 3, "type": "CURRENCY"}, {"currency": {"currencyCode": "69GjN7g8", "namespace": "lPWqQKyx"}, "item": {"itemId": "Fam6D7gf", "itemName": "5xm649D7", "itemSku": "MMgkuEyj", "itemType": "8GKT72Xb"}, "quantity": 93, "type": "ITEM"}, {"currency": {"currencyCode": "pvDvE9ah", "namespace": "tFg8N1wj"}, "item": {"itemId": "1dCU1IRM", "itemName": "JU0aSXcV", "itemSku": "q4kpjGjj", "itemType": "GOQ9c2bT"}, "quantity": 58, "type": "ITEM"}]}]}' \
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
    --body '{"data": [{"platform": "EPICGAMES", "platformDlcIdMap": {"XNgdEXHf": "r7mvQaRB", "opt8ispZ": "vxnamyn4", "SNKrqqnh": "TFcOCON7"}}, {"platform": "PSN", "platformDlcIdMap": {"mVxpvPYl": "Rfwc82Lg", "CgSJqDvi": "5hIxxDgs", "uxBLTyOC": "ru9goO0Z"}}, {"platform": "STEAM", "platformDlcIdMap": {"CqrmS5VR": "bBJ3giQq", "qIwz3MIq": "H0i1ZQet", "IT5twnIZ": "e4SB6WC0"}}]}' \
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
    --entitlementClazz 'CODE' \
    --entitlementName 'Bmp5RnxA' \
    --itemId 'Uvps7Amz,vqt2weGc,vvwvmKzl' \
    --limit '20' \
    --offset '74' \
    --origin 'Epic' \
    --userId 'We8cfj3E' \
    > test.out 2>&1
eval_tap $? 63 'QueryEntitlements1' test.out

#- 64 QueryEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryEntitlements \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemIds 'TL5UA5E1,DVYxm4eW,uU9Ew6Mt' \
    --limit '32' \
    --offset '77' \
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
    --body '{"entitlementGrantList": [{"collectionId": "gxHHPsVY", "endDate": "1999-12-08T00:00:00Z", "grantedCode": "1Y37PHxM", "itemId": "c9kebWY4", "itemNamespace": "6hXCSiOg", "language": "fANU_Iclw_506", "metadata": {"uOqshZAQ": {}, "BDPD0oXj": {}, "6fzLlqlo": {}}, "origin": "Epic", "quantity": 74, "region": "N7DJhEkp", "source": "PROMOTION", "startDate": "1972-07-08T00:00:00Z", "storeId": "onfhL7Iz"}, {"collectionId": "y1lW0KJZ", "endDate": "1991-12-13T00:00:00Z", "grantedCode": "62RWkV8F", "itemId": "yESfks6Z", "itemNamespace": "RT0lcv6g", "language": "Hnnc-636", "metadata": {"w4SjHkxF": {}, "TncIepJ3": {}, "U267w33D": {}}, "origin": "Twitch", "quantity": 92, "region": "jWVkZEkq", "source": "ACHIEVEMENT", "startDate": "1992-07-13T00:00:00Z", "storeId": "xPI28ufd"}, {"collectionId": "zgMODvRt", "endDate": "1972-07-04T00:00:00Z", "grantedCode": "X3WHuB7K", "itemId": "RhrkxiNV", "itemNamespace": "K8AgHDvz", "language": "Zw-YmoH", "metadata": {"eVhHPJsl": {}, "zz7pWS2H": {}, "f5To78Gy": {}}, "origin": "GooglePlay", "quantity": 79, "region": "xTcufX5R", "source": "PURCHASE", "startDate": "1991-03-03T00:00:00Z", "storeId": "dL4uCMle"}], "userIds": ["VX5b55QE", "eeUDNup6", "wi3DgNuI"]}' \
    > test.out 2>&1
eval_tap $? 67 'GrantEntitlements' test.out

#- 68 RevokeEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeEntitlements \
    --namespace "$AB_NAMESPACE" \
    --body '["frV0qk8L", "K2c9GsjM", "H0pnsyuo"]' \
    > test.out 2>&1
eval_tap $? 68 'RevokeEntitlements' test.out

#- 69 GetEntitlement
./ng net.accelbyte.sdk.cli.Main platform getEntitlement \
    --entitlementId '8btJ2GkK' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 69 'GetEntitlement' test.out

#- 70 QueryFulfillmentHistories
./ng net.accelbyte.sdk.cli.Main platform queryFulfillmentHistories \
    --namespace "$AB_NAMESPACE" \
    --limit '45' \
    --offset '82' \
    --status 'FAIL' \
    --userId 'lMNRC6Bl' \
    > test.out 2>&1
eval_tap $? 70 'QueryFulfillmentHistories' test.out

#- 71 QueryIAPClawbackHistory
./ng net.accelbyte.sdk.cli.Main platform queryIAPClawbackHistory \
    --namespace "$AB_NAMESPACE" \
    --endTime 'Rz0wgPXZ' \
    --eventType 'CHARGEBACK' \
    --externalOrderId 'SqIl8FGC' \
    --limit '6' \
    --offset '49' \
    --startTime 'fonV4FQ6' \
    --status 'FAIL' \
    --userId '9bPgCnnT' \
    > test.out 2>&1
eval_tap $? 71 'QueryIAPClawbackHistory' test.out

#- 72 MockPlayStationStreamEvent
./ng net.accelbyte.sdk.cli.Main platform mockPlayStationStreamEvent \
    --namespace "$AB_NAMESPACE" \
    --body '{"body": {"account": "XuhSTN2b", "additionalData": {"entitlement": [{"clientTransaction": [{"amountConsumed": 20, "clientTransactionId": "dib0mBj7"}, {"amountConsumed": 73, "clientTransactionId": "YnlJPKYM"}, {"amountConsumed": 55, "clientTransactionId": "oAP1BJ1w"}], "entitlementId": "hzxdWRes", "usageCount": 92}, {"clientTransaction": [{"amountConsumed": 43, "clientTransactionId": "SkX4tOIs"}, {"amountConsumed": 7, "clientTransactionId": "gsFdhOJm"}, {"amountConsumed": 5, "clientTransactionId": "pcUXW8yi"}], "entitlementId": "iSdabyoy", "usageCount": 37}, {"clientTransaction": [{"amountConsumed": 62, "clientTransactionId": "TOLLA3Vl"}, {"amountConsumed": 26, "clientTransactionId": "parnWRTZ"}, {"amountConsumed": 27, "clientTransactionId": "lG903Z0H"}], "entitlementId": "gamfaV4j", "usageCount": 86}], "purpose": "Cyd0f1i4"}, "originalTitleName": "hZQmzh5j", "paymentProductSKU": "VjrMibvI", "purchaseDate": "jtkFp9mt", "sourceOrderItemId": "6ioKIGLF", "titleName": "F5TrfyPi"}, "eventDomain": "m3m1jqFF", "eventSource": "oXLZYccK", "eventType": "NUxyr0An", "eventVersion": 20, "id": "gJNK9a4n", "timestamp": "Za9mD86n"}' \
    > test.out 2>&1
eval_tap $? 72 'MockPlayStationStreamEvent' test.out

#- 73 MockXblClawbackEvent
./ng net.accelbyte.sdk.cli.Main platform mockXblClawbackEvent \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": {"eventDate": "dwncMh3U", "eventState": "HHSBTf3h", "lineItemId": "axnVxqx1", "orderId": "gNlAHxRT", "productId": "mXXBfMCf", "productType": "O1Fb130W", "purchasedDate": "KPsDApmz", "sandboxId": "kSaD4jnD", "skuId": "D6NtBILU", "subscriptionData": {"consumedDurationInDays": 3, "dateTime": "72vWu90B", "durationInDays": 47, "recurrenceId": "lMnzLqgV"}}, "datacontenttype": "Tcfwupqz", "id": "66a3HhNR", "source": "q3UejWQJ", "specVersion": "Awn4RVEM", "subject": "ldbgtlpN", "time": "b3RRVnP1", "traceparent": "NLQHY4ZD", "type": "SE9p24ra"}' \
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
    --body '{"appAppleId": 67, "bundleId": "QmBv2Nij", "issuerId": "dgLhd1wc", "keyId": "AX9bBz1b", "password": "lg0wAB09", "version": "V1"}' \
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
    --body '{"sandboxId": "SrHIOZAh"}' \
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
    --body '{"applicationName": "t2DtHz5d", "notificationTokenAudience": "N1QCyda4", "notificationTokenEmail": "HNSVtUTD", "packageName": "v2kZZZy0", "serviceAccountId": "EqtMK6rV"}' \
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
    --body '{"data": [{"itemIdentity": "ZUEvUUa6", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"vPbiqBUb": "RFOsinQd", "XSpZoreC": "17EkC8IR", "F1ejLx6o": "T1sXu4Fk"}}, {"itemIdentity": "aM7whgA8", "itemIdentityType": "ITEM_ID", "platformProductIdMap": {"IUL1GkWR": "yzYpRkT0", "2tpAAaYj": "lXKgsFNQ", "wSlYa9bw": "Cy8B5VRp"}}, {"itemIdentity": "WlSe7Wv2", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"apAGmQCW": "nBmOnDf4", "yko1CTMG": "rTTVq6PQ", "RTlb4dsA": "5972qNMD"}}]}' \
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
    --body '{"appId": "KDTgh4gv", "appSecret": "Clqw6GaV"}' \
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
    --body '{"backOfficeServerClientId": "blz5uY7E", "backOfficeServerClientSecret": "OTFbyrQ9", "enableStreamJob": false, "environment": "ocmW61cA", "streamName": "LZ9de1Fm", "streamPartnerName": "vak7j75U"}' \
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
    --body '{"backOfficeServerClientId": "HrjAd450", "backOfficeServerClientSecret": "Ggle10bv", "enableStreamJob": false, "environment": "rPwNN74n", "streamName": "eoUt9TyW", "streamPartnerName": "JotbT1XV"}' \
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
    --body '{"appId": "MvYm3lXE", "publisherAuthenticationKey": "NMVxarP7"}' \
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
    --body '{"clientId": "Ros9J90Z", "clientSecret": "rcRc19fo", "organizationId": "2zMg3dIf"}' \
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
    --body '{"enableClawback": true, "entraAppClientId": "WDvZYa1b", "entraAppClientSecret": "Ys7M93CP", "entraTenantId": "nCbsi0SI", "relyingPartyCert": "ykM5oABo"}' \
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
    --password 'QjP5jDN9' \
    > test.out 2>&1
eval_tap $? 105 'UpdateXblBPCertFile' test.out

#- 106 QueryThirdPartyNotifications
./ng net.accelbyte.sdk.cli.Main platform queryThirdPartyNotifications \
    --namespace "$AB_NAMESPACE" \
    --endDate '9Ufu2Gxx' \
    --externalId 'ZBvMOdjk' \
    --limit '67' \
    --offset '68' \
    --source 'APPLE' \
    --startDate 'R6JoXGSf' \
    --status 'IGNORED' \
    --type 'pSXApInb' \
    > test.out 2>&1
eval_tap $? 106 'QueryThirdPartyNotifications' test.out

#- 107 QueryThirdPartySubscription
./ng net.accelbyte.sdk.cli.Main platform queryThirdPartySubscription \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --groupId 'P160UkJc' \
    --limit '17' \
    --offset '6' \
    --platform 'EPICGAMES' \
    --productId 'u4nnrwWf' \
    --userId 'GqtwGOmv' \
    > test.out 2>&1
eval_tap $? 107 'QueryThirdPartySubscription' test.out

#- 108 GetIAPOrderConsumeDetails
./ng net.accelbyte.sdk.cli.Main platform getIAPOrderConsumeDetails \
    --iapOrderNo 'y36mVYyv' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 108 'GetIAPOrderConsumeDetails' test.out

#- 109 DownloadInvoiceDetails
./ng net.accelbyte.sdk.cli.Main platform downloadInvoiceDetails \
    --namespace "$AB_NAMESPACE" \
    --endTime 'VUBt95ml' \
    --feature 'q9bQhOOb' \
    --itemId 'xH2u3Lls' \
    --itemType 'BUNDLE' \
    --startTime 'jRNJwjc5' \
    > test.out 2>&1
eval_tap $? 109 'DownloadInvoiceDetails' test.out

#- 110 GenerateInvoiceSummary
./ng net.accelbyte.sdk.cli.Main platform generateInvoiceSummary \
    --namespace "$AB_NAMESPACE" \
    --endTime 'QWJ5Q0Y1' \
    --feature 'HTEvmpDz' \
    --itemId 'yApxz6qq' \
    --itemType 'MEDIA' \
    --startTime 'bMw1wBpz' \
    > test.out 2>&1
eval_tap $? 110 'GenerateInvoiceSummary' test.out

#- 111 SyncInGameItem
./ng net.accelbyte.sdk.cli.Main platform syncInGameItem \
    --namespace "$AB_NAMESPACE" \
    --storeId '7vnJTy8V' \
    --body '{"categoryPath": "BBjurLNC", "targetItemId": "xLolQ4z8", "targetNamespace": "8eDIEYzb"}' \
    > test.out 2>&1
eval_tap $? 111 'SyncInGameItem' test.out

#- 112 CreateItem
./ng net.accelbyte.sdk.cli.Main platform createItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'vwJUQvZH' \
    --body '{"appId": "MrvFfAAE", "appType": "SOFTWARE", "baseAppId": "du6s6Ucl", "boothName": "aBCfgs5W", "categoryPath": "ha929XRi", "clazz": "b3WD6Axc", "displayOrder": 20, "entitlementType": "DURABLE", "ext": {"6V9LIKK4": {}, "pLdxSTY0": {}, "12Kbm3Ca": {}}, "features": ["IyCw7T6d", "Aswebb1P", "IfkYLNX4"], "flexible": false, "images": [{"as": "p5wBEj6L", "caption": "bJHJoGaN", "height": 92, "imageUrl": "ahh33ddF", "smallImageUrl": "9XWesM1h", "width": 69}, {"as": "PLHIkyDE", "caption": "yAuS2Wt6", "height": 29, "imageUrl": "zDeI5bbM", "smallImageUrl": "SRGd4yxa", "width": 66}, {"as": "hwwRbR7d", "caption": "rz8jEBa8", "height": 75, "imageUrl": "6opnOiRh", "smallImageUrl": "A21twQF6", "width": 39}], "inventoryConfig": {"customAttributes": {"c44z3FEU": {}, "aEu4e6dQ": {}, "yudnYb3W": {}}, "serverCustomAttributes": {"ElJj34df": {}, "EaH90N1T": {}, "Jho1ohig": {}}, "slotUsed": 53}, "itemIds": ["zD8VhJlo", "ujujML7P", "7Ux7wenl"], "itemQty": {"cEY8pPyM": 52, "ijBvDypf": 34, "cUl5bTOX": 79}, "itemType": "OPTIONBOX", "listable": true, "localizations": {"sWxQ4cas": {"description": "N64qQ7zp", "localExt": {"04AxZuWm": {}, "bvF2tzqb": {}, "CNS0186Q": {}}, "longDescription": "Yn4rwlWW", "title": "5Ne2kITc"}, "heo7XvPp": {"description": "iK61JCoO", "localExt": {"a7N94fKC": {}, "oJtNylfx": {}, "aC6B8Do9": {}}, "longDescription": "UqWECUxI", "title": "mmNyUtXL"}, "GTR3wn8I": {"description": "7oKVYAkI", "localExt": {"D07521ej": {}, "pjPzGd1p": {}, "CszYFenY": {}}, "longDescription": "CmnkK6y1", "title": "z5wgDJRo"}}, "lootBoxConfig": {"rewardCount": 54, "rewards": [{"lootBoxItems": [{"count": 61, "duration": 46, "endDate": "1985-04-28T00:00:00Z", "itemId": "6pb8Zid2", "itemSku": "bqkXnJUY", "itemType": "Nq3GjHeQ"}, {"count": 77, "duration": 52, "endDate": "1993-06-20T00:00:00Z", "itemId": "Lp3fgGqP", "itemSku": "dQG15SUz", "itemType": "fL9pRfRK"}, {"count": 7, "duration": 80, "endDate": "1989-03-01T00:00:00Z", "itemId": "fuZfiq6m", "itemSku": "KztTY6GD", "itemType": "QKq8gfJN"}], "name": "rYmGlSx7", "odds": 0.6483021850376618, "type": "REWARD", "weight": 67}, {"lootBoxItems": [{"count": 50, "duration": 19, "endDate": "1974-03-01T00:00:00Z", "itemId": "vHdlaf6G", "itemSku": "SnCkViX3", "itemType": "BKq0VoK6"}, {"count": 18, "duration": 97, "endDate": "1999-08-13T00:00:00Z", "itemId": "HMqg8CpC", "itemSku": "pc3U1P9Q", "itemType": "7MxDayPr"}, {"count": 52, "duration": 49, "endDate": "1995-03-17T00:00:00Z", "itemId": "Bj0wqich", "itemSku": "IZyoGDYM", "itemType": "YEUgf831"}], "name": "J2yoBLcI", "odds": 0.18609643473410742, "type": "REWARD", "weight": 32}, {"lootBoxItems": [{"count": 84, "duration": 53, "endDate": "1977-09-14T00:00:00Z", "itemId": "wCVZxMtT", "itemSku": "zxUo8jii", "itemType": "wPUFOuuR"}, {"count": 100, "duration": 41, "endDate": "1983-12-02T00:00:00Z", "itemId": "ImIV5rsI", "itemSku": "xJ3PtjLf", "itemType": "CqMmvUoL"}, {"count": 79, "duration": 58, "endDate": "1984-01-02T00:00:00Z", "itemId": "JplZcbnZ", "itemSku": "bM892VBI", "itemType": "d3IODJ5i"}], "name": "0vYrhmYy", "odds": 0.9891376206566885, "type": "REWARD_GROUP", "weight": 6}], "rollFunction": "CUSTOM"}, "maxCount": 21, "maxCountPerUser": 35, "name": "L3iNDqCg", "optionBoxConfig": {"boxItems": [{"count": 75, "duration": 72, "endDate": "1997-02-05T00:00:00Z", "itemId": "arkzMhxV", "itemSku": "tEpI5Urm", "itemType": "R8P4qAiC"}, {"count": 73, "duration": 67, "endDate": "1994-03-20T00:00:00Z", "itemId": "6jk4hzFP", "itemSku": "LnFJexg8", "itemType": "snfr74oB"}, {"count": 84, "duration": 18, "endDate": "1971-08-25T00:00:00Z", "itemId": "1xSDuZOO", "itemSku": "MKjmcBAx", "itemType": "mfuQItbI"}]}, "purchasable": false, "recurring": {"cycle": "YEARLY", "fixedFreeDays": 29, "fixedTrialCycles": 50, "graceDays": 51}, "regionData": {"AmFhKRs9": [{"currencyCode": "Dj157BYM", "currencyNamespace": "CQ9LEsbO", "currencyType": "VIRTUAL", "discountAmount": 21, "discountExpireAt": "1981-10-01T00:00:00Z", "discountPercentage": 12, "discountPurchaseAt": "1974-01-12T00:00:00Z", "expireAt": "1995-09-15T00:00:00Z", "price": 61, "purchaseAt": "1980-11-01T00:00:00Z", "trialPrice": 20}, {"currencyCode": "BXXIFI4s", "currencyNamespace": "HupkilQm", "currencyType": "REAL", "discountAmount": 33, "discountExpireAt": "1992-04-26T00:00:00Z", "discountPercentage": 56, "discountPurchaseAt": "1996-06-01T00:00:00Z", "expireAt": "1990-11-24T00:00:00Z", "price": 72, "purchaseAt": "1987-01-15T00:00:00Z", "trialPrice": 25}, {"currencyCode": "EKjDjcck", "currencyNamespace": "OF85dUEu", "currencyType": "REAL", "discountAmount": 26, "discountExpireAt": "1981-07-25T00:00:00Z", "discountPercentage": 97, "discountPurchaseAt": "1993-04-04T00:00:00Z", "expireAt": "1981-01-20T00:00:00Z", "price": 8, "purchaseAt": "1980-08-28T00:00:00Z", "trialPrice": 62}], "kZLC5Fdc": [{"currencyCode": "meR8nXyT", "currencyNamespace": "6RM6BOaY", "currencyType": "REAL", "discountAmount": 41, "discountExpireAt": "1972-04-15T00:00:00Z", "discountPercentage": 3, "discountPurchaseAt": "1990-12-08T00:00:00Z", "expireAt": "1994-07-09T00:00:00Z", "price": 39, "purchaseAt": "1971-07-28T00:00:00Z", "trialPrice": 36}, {"currencyCode": "ylcDY6Ka", "currencyNamespace": "cGatPdVg", "currencyType": "VIRTUAL", "discountAmount": 47, "discountExpireAt": "1974-06-24T00:00:00Z", "discountPercentage": 81, "discountPurchaseAt": "1994-07-13T00:00:00Z", "expireAt": "1981-05-27T00:00:00Z", "price": 47, "purchaseAt": "1990-04-29T00:00:00Z", "trialPrice": 39}, {"currencyCode": "si0QHJ6o", "currencyNamespace": "F8fgHZWo", "currencyType": "VIRTUAL", "discountAmount": 77, "discountExpireAt": "1984-01-13T00:00:00Z", "discountPercentage": 21, "discountPurchaseAt": "1990-08-31T00:00:00Z", "expireAt": "1987-09-07T00:00:00Z", "price": 66, "purchaseAt": "1995-07-23T00:00:00Z", "trialPrice": 2}], "IDv8eoCB": [{"currencyCode": "Vb6VtTWV", "currencyNamespace": "iOUasZQh", "currencyType": "REAL", "discountAmount": 91, "discountExpireAt": "1993-10-21T00:00:00Z", "discountPercentage": 6, "discountPurchaseAt": "1983-10-19T00:00:00Z", "expireAt": "1972-12-11T00:00:00Z", "price": 38, "purchaseAt": "1982-01-24T00:00:00Z", "trialPrice": 88}, {"currencyCode": "VlCpuSRT", "currencyNamespace": "x7HPzzH7", "currencyType": "REAL", "discountAmount": 56, "discountExpireAt": "1999-09-09T00:00:00Z", "discountPercentage": 94, "discountPurchaseAt": "1984-02-15T00:00:00Z", "expireAt": "1995-08-15T00:00:00Z", "price": 54, "purchaseAt": "1997-06-27T00:00:00Z", "trialPrice": 76}, {"currencyCode": "z96SelW5", "currencyNamespace": "yK9aA4wt", "currencyType": "REAL", "discountAmount": 34, "discountExpireAt": "1983-03-11T00:00:00Z", "discountPercentage": 84, "discountPurchaseAt": "1998-01-26T00:00:00Z", "expireAt": "1984-06-11T00:00:00Z", "price": 54, "purchaseAt": "1980-01-03T00:00:00Z", "trialPrice": 8}]}, "saleConfig": {"currencyCode": "fRGja763", "price": 60}, "seasonType": "TIER", "sectionExclusive": true, "sellable": false, "sku": "AkeyPVzT", "stackable": false, "status": "ACTIVE", "tags": ["XAy3Eg7U", "hLPf4DPg", "keAOiLG1"], "targetCurrencyCode": "ywpkjBK1", "targetNamespace": "afo8vG1I", "thumbnailUrl": "Cs2gMzoy", "useCount": 4}' \
    > test.out 2>&1
eval_tap $? 112 'CreateItem' test.out

#- 113 GetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform getItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'thJPAgLG' \
    --appId 'YuSP0ivS' \
    > test.out 2>&1
eval_tap $? 113 'GetItemByAppId' test.out

#- 114 QueryItems
./ng net.accelbyte.sdk.cli.Main platform queryItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --appType 'GAME' \
    --availableDate 'XAFQknZH' \
    --baseAppId 'vIKAR44x' \
    --categoryPath 'JAya6d6y' \
    --features 'Rx5CpMU5' \
    --includeSubCategoryItem  \
    --itemType 'LOOTBOX' \
    --limit '74' \
    --offset '47' \
    --region 'RJiCEMYK' \
    --sortBy 'displayOrder,updatedAt' \
    --storeId 'VM642KTN' \
    --tags 'XCWxhwY6' \
    --targetNamespace 'iJqnPqxQ' \
    > test.out 2>&1
eval_tap $? 114 'QueryItems' test.out

#- 115 ListBasicItemsByFeatures
./ng net.accelbyte.sdk.cli.Main platform listBasicItemsByFeatures \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --features 'SJarUpoA,7V6oR2P4,S1Ez2yhD' \
    > test.out 2>&1
eval_tap $? 115 'ListBasicItemsByFeatures' test.out

#- 116 GetItems
./ng net.accelbyte.sdk.cli.Main platform getItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'hXLLIPIZ' \
    --itemIds 'byBTG2IC' \
    > test.out 2>&1
eval_tap $? 116 'GetItems' test.out

#- 117 GetItemBySku
./ng net.accelbyte.sdk.cli.Main platform getItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'UqWFMfX5' \
    --sku '9dTLWxoN' \
    > test.out 2>&1
eval_tap $? 117 'GetItemBySku' test.out

#- 118 GetLocaleItemBySku
./ng net.accelbyte.sdk.cli.Main platform getLocaleItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'lQ3WIoBj' \
    --populateBundle  \
    --region 'yvCJgiEL' \
    --storeId '1XWCWQkV' \
    --sku 'ZlNSyi1z' \
    > test.out 2>&1
eval_tap $? 118 'GetLocaleItemBySku' test.out

#- 119 GetEstimatedPrice
./ng net.accelbyte.sdk.cli.Main platform getEstimatedPrice \
    --namespace "$AB_NAMESPACE" \
    --platform 'eO8XD4L4' \
    --region 'VKrfo27z' \
    --storeId 'CumNgB27' \
    --itemIds 'JMzFOVZ0' \
    --userId 'eWjBKo92' \
    > test.out 2>&1
eval_tap $? 119 'GetEstimatedPrice' test.out

#- 120 GetItemIdBySku
./ng net.accelbyte.sdk.cli.Main platform getItemIdBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'W8nKnPFB' \
    --sku '4YWSS4Sc' \
    > test.out 2>&1
eval_tap $? 120 'GetItemIdBySku' test.out

#- 121 GetBulkItemIdBySkus
./ng net.accelbyte.sdk.cli.Main platform getBulkItemIdBySkus \
    --namespace "$AB_NAMESPACE" \
    --sku 'qm6aVEBJ,jSh0HhbI,LKkslGYf' \
    --storeId 'mYsljmCS' \
    > test.out 2>&1
eval_tap $? 121 'GetBulkItemIdBySkus' test.out

#- 122 BulkGetLocaleItems
./ng net.accelbyte.sdk.cli.Main platform bulkGetLocaleItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'MUovXMoh' \
    --region 'xWMelZNg' \
    --storeId 'PIbTESH3' \
    --itemIds 'LWduc5Ho' \
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
    --platform 'SEomK3BE' \
    --userId 'AhLn4kR8' \
    --body '{"itemIds": ["u4tpmk6Z", "aMrhSg5z", "CjAIhe16"]}' \
    > test.out 2>&1
eval_tap $? 124 'ValidateItemPurchaseCondition' test.out

#- 125 BulkUpdateRegionData
./ng net.accelbyte.sdk.cli.Main platform bulkUpdateRegionData \
    --namespace "$AB_NAMESPACE" \
    --storeId 'JRxAZxit' \
    --body '{"changes": [{"itemIdentities": ["IHa1EZe9", "Vw74ftBg", "Ls5JpFDe"], "itemIdentityType": "ITEM_ID", "regionData": {"1HhjXwLn": [{"currencyCode": "M3GvswuM", "currencyNamespace": "yuMKPI93", "currencyType": "REAL", "discountAmount": 1, "discountExpireAt": "1999-04-03T00:00:00Z", "discountPercentage": 67, "discountPurchaseAt": "1993-04-24T00:00:00Z", "discountedPrice": 14, "expireAt": "1973-09-30T00:00:00Z", "price": 8, "purchaseAt": "1998-01-25T00:00:00Z", "trialPrice": 0}, {"currencyCode": "XW8Z0xlN", "currencyNamespace": "53FTUBho", "currencyType": "REAL", "discountAmount": 71, "discountExpireAt": "1978-08-17T00:00:00Z", "discountPercentage": 33, "discountPurchaseAt": "1978-12-11T00:00:00Z", "discountedPrice": 6, "expireAt": "1996-07-12T00:00:00Z", "price": 73, "purchaseAt": "1995-04-02T00:00:00Z", "trialPrice": 69}, {"currencyCode": "wkt18rSy", "currencyNamespace": "FdnVYprl", "currencyType": "REAL", "discountAmount": 95, "discountExpireAt": "1997-01-20T00:00:00Z", "discountPercentage": 16, "discountPurchaseAt": "1981-03-13T00:00:00Z", "discountedPrice": 70, "expireAt": "1986-02-02T00:00:00Z", "price": 22, "purchaseAt": "1985-02-10T00:00:00Z", "trialPrice": 10}], "gZbGuDA7": [{"currencyCode": "lE36ILZz", "currencyNamespace": "FTEUCLmU", "currencyType": "VIRTUAL", "discountAmount": 81, "discountExpireAt": "1982-07-31T00:00:00Z", "discountPercentage": 78, "discountPurchaseAt": "1973-01-13T00:00:00Z", "discountedPrice": 35, "expireAt": "1992-12-14T00:00:00Z", "price": 69, "purchaseAt": "1991-02-05T00:00:00Z", "trialPrice": 15}, {"currencyCode": "L3N6D1OP", "currencyNamespace": "tMrTgBfZ", "currencyType": "REAL", "discountAmount": 89, "discountExpireAt": "1973-05-26T00:00:00Z", "discountPercentage": 47, "discountPurchaseAt": "1997-12-07T00:00:00Z", "discountedPrice": 68, "expireAt": "1984-03-02T00:00:00Z", "price": 81, "purchaseAt": "1981-11-14T00:00:00Z", "trialPrice": 49}, {"currencyCode": "I9yimaeR", "currencyNamespace": "9Cj6O7gn", "currencyType": "REAL", "discountAmount": 23, "discountExpireAt": "1990-04-04T00:00:00Z", "discountPercentage": 53, "discountPurchaseAt": "1988-11-04T00:00:00Z", "discountedPrice": 89, "expireAt": "1994-01-14T00:00:00Z", "price": 21, "purchaseAt": "1975-09-19T00:00:00Z", "trialPrice": 44}], "kFKBzeeI": [{"currencyCode": "lROnhGGW", "currencyNamespace": "XBi2MvST", "currencyType": "REAL", "discountAmount": 32, "discountExpireAt": "1998-07-21T00:00:00Z", "discountPercentage": 38, "discountPurchaseAt": "1978-01-31T00:00:00Z", "discountedPrice": 98, "expireAt": "1976-08-23T00:00:00Z", "price": 95, "purchaseAt": "1984-02-05T00:00:00Z", "trialPrice": 69}, {"currencyCode": "5bfYhgzs", "currencyNamespace": "M09KqhBH", "currencyType": "VIRTUAL", "discountAmount": 29, "discountExpireAt": "1991-11-29T00:00:00Z", "discountPercentage": 27, "discountPurchaseAt": "1982-01-25T00:00:00Z", "discountedPrice": 89, "expireAt": "1994-01-28T00:00:00Z", "price": 98, "purchaseAt": "1984-03-04T00:00:00Z", "trialPrice": 98}, {"currencyCode": "7SOXkqXu", "currencyNamespace": "NBios3pH", "currencyType": "REAL", "discountAmount": 82, "discountExpireAt": "1983-04-27T00:00:00Z", "discountPercentage": 29, "discountPurchaseAt": "1994-05-16T00:00:00Z", "discountedPrice": 56, "expireAt": "1984-10-16T00:00:00Z", "price": 75, "purchaseAt": "1989-01-21T00:00:00Z", "trialPrice": 74}]}}, {"itemIdentities": ["V1UMC84x", "25ocXBwR", "VzMWTsMF"], "itemIdentityType": "ITEM_ID", "regionData": {"NK5pO4GX": [{"currencyCode": "E9I2m4wn", "currencyNamespace": "fmO4MSqI", "currencyType": "VIRTUAL", "discountAmount": 75, "discountExpireAt": "1999-09-18T00:00:00Z", "discountPercentage": 64, "discountPurchaseAt": "1995-08-01T00:00:00Z", "discountedPrice": 90, "expireAt": "1981-12-16T00:00:00Z", "price": 14, "purchaseAt": "1974-03-28T00:00:00Z", "trialPrice": 64}, {"currencyCode": "oyuXZw9J", "currencyNamespace": "FFPm5Yiv", "currencyType": "VIRTUAL", "discountAmount": 3, "discountExpireAt": "1974-05-08T00:00:00Z", "discountPercentage": 48, "discountPurchaseAt": "1986-09-14T00:00:00Z", "discountedPrice": 56, "expireAt": "1971-02-28T00:00:00Z", "price": 76, "purchaseAt": "1983-05-04T00:00:00Z", "trialPrice": 56}, {"currencyCode": "dRh9Kdo2", "currencyNamespace": "hJLBRKxq", "currencyType": "REAL", "discountAmount": 4, "discountExpireAt": "1998-12-10T00:00:00Z", "discountPercentage": 20, "discountPurchaseAt": "1973-12-28T00:00:00Z", "discountedPrice": 41, "expireAt": "1985-01-23T00:00:00Z", "price": 2, "purchaseAt": "1973-04-25T00:00:00Z", "trialPrice": 28}], "oX6Nh33X": [{"currencyCode": "jbGx7wpR", "currencyNamespace": "rcICn0ts", "currencyType": "REAL", "discountAmount": 64, "discountExpireAt": "1989-04-06T00:00:00Z", "discountPercentage": 27, "discountPurchaseAt": "1992-10-23T00:00:00Z", "discountedPrice": 77, "expireAt": "1987-09-02T00:00:00Z", "price": 68, "purchaseAt": "1978-03-06T00:00:00Z", "trialPrice": 15}, {"currencyCode": "uXyRBoQp", "currencyNamespace": "mPGgHlmL", "currencyType": "REAL", "discountAmount": 5, "discountExpireAt": "1996-06-28T00:00:00Z", "discountPercentage": 80, "discountPurchaseAt": "1977-04-16T00:00:00Z", "discountedPrice": 26, "expireAt": "1993-08-11T00:00:00Z", "price": 18, "purchaseAt": "1988-01-04T00:00:00Z", "trialPrice": 62}, {"currencyCode": "Kaea8vVo", "currencyNamespace": "iE8WsbgB", "currencyType": "VIRTUAL", "discountAmount": 54, "discountExpireAt": "1977-01-08T00:00:00Z", "discountPercentage": 78, "discountPurchaseAt": "1980-06-25T00:00:00Z", "discountedPrice": 61, "expireAt": "1978-01-13T00:00:00Z", "price": 93, "purchaseAt": "1981-11-01T00:00:00Z", "trialPrice": 33}], "yqyJuXsd": [{"currencyCode": "G5QQasTO", "currencyNamespace": "LKYN1Xut", "currencyType": "REAL", "discountAmount": 23, "discountExpireAt": "1972-02-07T00:00:00Z", "discountPercentage": 8, "discountPurchaseAt": "1984-11-09T00:00:00Z", "discountedPrice": 67, "expireAt": "1986-01-24T00:00:00Z", "price": 28, "purchaseAt": "1987-12-16T00:00:00Z", "trialPrice": 50}, {"currencyCode": "ww1XdVIX", "currencyNamespace": "IganaRA5", "currencyType": "REAL", "discountAmount": 65, "discountExpireAt": "1992-09-07T00:00:00Z", "discountPercentage": 73, "discountPurchaseAt": "1972-02-17T00:00:00Z", "discountedPrice": 7, "expireAt": "1988-10-20T00:00:00Z", "price": 6, "purchaseAt": "1984-11-05T00:00:00Z", "trialPrice": 80}, {"currencyCode": "wG7NZGHw", "currencyNamespace": "iecFHFLR", "currencyType": "REAL", "discountAmount": 66, "discountExpireAt": "1980-04-21T00:00:00Z", "discountPercentage": 31, "discountPurchaseAt": "1977-10-03T00:00:00Z", "discountedPrice": 66, "expireAt": "1984-02-09T00:00:00Z", "price": 28, "purchaseAt": "1990-12-08T00:00:00Z", "trialPrice": 6}]}}, {"itemIdentities": ["M9MpDkRM", "yChxxTbO", "kgj2SJ9D"], "itemIdentityType": "ITEM_SKU", "regionData": {"SyTeQhlK": [{"currencyCode": "5j5e9Z1M", "currencyNamespace": "lszDs6SE", "currencyType": "VIRTUAL", "discountAmount": 10, "discountExpireAt": "1978-06-26T00:00:00Z", "discountPercentage": 6, "discountPurchaseAt": "1996-03-11T00:00:00Z", "discountedPrice": 48, "expireAt": "1981-06-17T00:00:00Z", "price": 58, "purchaseAt": "1995-07-23T00:00:00Z", "trialPrice": 29}, {"currencyCode": "GP7xHYR4", "currencyNamespace": "suenknsz", "currencyType": "REAL", "discountAmount": 79, "discountExpireAt": "1972-08-08T00:00:00Z", "discountPercentage": 71, "discountPurchaseAt": "1994-11-13T00:00:00Z", "discountedPrice": 100, "expireAt": "1998-01-15T00:00:00Z", "price": 24, "purchaseAt": "1981-09-20T00:00:00Z", "trialPrice": 97}, {"currencyCode": "QEDsKxeM", "currencyNamespace": "Uosa0Ahu", "currencyType": "REAL", "discountAmount": 5, "discountExpireAt": "1998-03-06T00:00:00Z", "discountPercentage": 58, "discountPurchaseAt": "1975-08-16T00:00:00Z", "discountedPrice": 98, "expireAt": "1975-09-02T00:00:00Z", "price": 54, "purchaseAt": "1986-12-17T00:00:00Z", "trialPrice": 75}], "0t1Cwpmi": [{"currencyCode": "bJuXtvW7", "currencyNamespace": "yZJwqbnF", "currencyType": "VIRTUAL", "discountAmount": 78, "discountExpireAt": "1979-06-10T00:00:00Z", "discountPercentage": 50, "discountPurchaseAt": "1975-04-02T00:00:00Z", "discountedPrice": 24, "expireAt": "1994-05-28T00:00:00Z", "price": 56, "purchaseAt": "1979-05-17T00:00:00Z", "trialPrice": 62}, {"currencyCode": "HM4khzWT", "currencyNamespace": "Zc5w77ct", "currencyType": "REAL", "discountAmount": 41, "discountExpireAt": "1988-02-21T00:00:00Z", "discountPercentage": 26, "discountPurchaseAt": "1982-03-10T00:00:00Z", "discountedPrice": 42, "expireAt": "1989-04-16T00:00:00Z", "price": 43, "purchaseAt": "1983-04-11T00:00:00Z", "trialPrice": 4}, {"currencyCode": "fPNmzjfr", "currencyNamespace": "pLbt5OYH", "currencyType": "VIRTUAL", "discountAmount": 57, "discountExpireAt": "1990-09-03T00:00:00Z", "discountPercentage": 81, "discountPurchaseAt": "1986-10-30T00:00:00Z", "discountedPrice": 32, "expireAt": "1995-06-13T00:00:00Z", "price": 57, "purchaseAt": "1971-02-08T00:00:00Z", "trialPrice": 70}], "VnyhGNUg": [{"currencyCode": "Cx9qXSRJ", "currencyNamespace": "le7UxeEv", "currencyType": "VIRTUAL", "discountAmount": 28, "discountExpireAt": "1981-10-03T00:00:00Z", "discountPercentage": 41, "discountPurchaseAt": "1988-10-24T00:00:00Z", "discountedPrice": 94, "expireAt": "1985-04-29T00:00:00Z", "price": 17, "purchaseAt": "1988-08-27T00:00:00Z", "trialPrice": 48}, {"currencyCode": "1FuMuAb8", "currencyNamespace": "lpePVYYt", "currencyType": "REAL", "discountAmount": 21, "discountExpireAt": "1979-05-17T00:00:00Z", "discountPercentage": 57, "discountPurchaseAt": "1996-10-18T00:00:00Z", "discountedPrice": 38, "expireAt": "1994-07-06T00:00:00Z", "price": 18, "purchaseAt": "1996-02-13T00:00:00Z", "trialPrice": 86}, {"currencyCode": "lST5E9BQ", "currencyNamespace": "LO4ua7kv", "currencyType": "VIRTUAL", "discountAmount": 96, "discountExpireAt": "1971-05-10T00:00:00Z", "discountPercentage": 24, "discountPurchaseAt": "1985-05-15T00:00:00Z", "discountedPrice": 58, "expireAt": "1988-10-12T00:00:00Z", "price": 68, "purchaseAt": "1979-10-01T00:00:00Z", "trialPrice": 54}]}}]}' \
    > test.out 2>&1
eval_tap $? 125 'BulkUpdateRegionData' test.out

#- 126 SearchItems
./ng net.accelbyte.sdk.cli.Main platform searchItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemType 'SEASON' \
    --limit '47' \
    --offset '86' \
    --sortBy 'QUq1JZIv' \
    --storeId 'ljUMkKWZ' \
    --keyword 'mXqaX1zS' \
    --language 'ANCpR8vI' \
    > test.out 2>&1
eval_tap $? 126 'SearchItems' test.out

#- 127 QueryUncategorizedItems
./ng net.accelbyte.sdk.cli.Main platform queryUncategorizedItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --limit '99' \
    --offset '45' \
    --sortBy 'name:asc,createdAt' \
    --storeId 'clSGDGjq' \
    > test.out 2>&1
eval_tap $? 127 'QueryUncategorizedItems' test.out

#- 128 GetItem
./ng net.accelbyte.sdk.cli.Main platform getItem \
    --itemId 'bOQ9V2dD' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'MdCL9dJ6' \
    > test.out 2>&1
eval_tap $? 128 'GetItem' test.out

#- 129 UpdateItem
./ng net.accelbyte.sdk.cli.Main platform updateItem \
    --itemId 'd5ToQ6pH' \
    --namespace "$AB_NAMESPACE" \
    --storeId '0tCRKAeW' \
    --body '{"appId": "Q8FEPVOs", "appType": "DEMO", "baseAppId": "4iw8OfkI", "boothName": "wQxiylDg", "categoryPath": "hyVl12an", "clazz": "lGnrEcxt", "displayOrder": 75, "entitlementType": "CONSUMABLE", "ext": {"MK4niKab": {}, "bslVrPgV": {}, "D3e7M7xp": {}}, "features": ["M2b4zKGF", "m6YOS6lw", "VS1KEZVk"], "flexible": false, "images": [{"as": "SY4gfpvd", "caption": "oLGifYAn", "height": 69, "imageUrl": "PPL8GZf1", "smallImageUrl": "16yOL3ak", "width": 47}, {"as": "oN847Kwh", "caption": "tnrezvxf", "height": 52, "imageUrl": "K4WUjkff", "smallImageUrl": "xZZsj9rn", "width": 32}, {"as": "7yKocQ8O", "caption": "xQMkptVz", "height": 9, "imageUrl": "bW18D3kN", "smallImageUrl": "iL38nKPc", "width": 81}], "inventoryConfig": {"customAttributes": {"7UZqPHeG": {}, "Q4EQN63n": {}, "r5en8Av0": {}}, "serverCustomAttributes": {"StOkvaFz": {}, "i5b90gh4": {}, "UI2iAnuw": {}}, "slotUsed": 42}, "itemIds": ["80zgYeM8", "31LFWcik", "wALadkas"], "itemQty": {"FQC2scAs": 6, "SsV0bAyh": 56, "4IWh05lu": 8}, "itemType": "APP", "listable": true, "localizations": {"MJNj1yIs": {"description": "leTHKmf2", "localExt": {"PkHaGyOS": {}, "uKqXOq4h": {}, "kGYsuodZ": {}}, "longDescription": "vyfxLvXD", "title": "tp1TNra5"}, "7YDfXPbN": {"description": "32RlCxex", "localExt": {"sFqzHaYC": {}, "gioEwtyR": {}, "lYhQNsNK": {}}, "longDescription": "61Ln2aXM", "title": "F3UZLGXl"}, "DiRpS6zw": {"description": "bPLlVtd9", "localExt": {"NkdHMuUz": {}, "GUnwxBo1": {}, "wEgEVRgu": {}}, "longDescription": "Ns0N3MzP", "title": "WVQiQKyv"}}, "lootBoxConfig": {"rewardCount": 38, "rewards": [{"lootBoxItems": [{"count": 57, "duration": 13, "endDate": "1999-12-10T00:00:00Z", "itemId": "NdVZCc7U", "itemSku": "iLo9kuJ5", "itemType": "rL5gtSMj"}, {"count": 83, "duration": 96, "endDate": "1981-11-03T00:00:00Z", "itemId": "McURK1Pr", "itemSku": "T4gYtiHN", "itemType": "BpzQRAX0"}, {"count": 61, "duration": 78, "endDate": "1981-07-22T00:00:00Z", "itemId": "FsMVg4q3", "itemSku": "7bqWVkvO", "itemType": "EWLTdNEF"}], "name": "Toowv2bw", "odds": 0.7959504209291441, "type": "REWARD_GROUP", "weight": 97}, {"lootBoxItems": [{"count": 57, "duration": 44, "endDate": "1977-08-20T00:00:00Z", "itemId": "hHzChcMV", "itemSku": "ZERoh80k", "itemType": "QJ7inMcv"}, {"count": 95, "duration": 86, "endDate": "1993-01-03T00:00:00Z", "itemId": "wREB1CqH", "itemSku": "gB854Zqv", "itemType": "YLGIsNvQ"}, {"count": 97, "duration": 78, "endDate": "1992-09-03T00:00:00Z", "itemId": "4Ryr3E3m", "itemSku": "diyfSixA", "itemType": "sOAf4Ii8"}], "name": "JVM1OkyH", "odds": 0.9489243501860072, "type": "PROBABILITY_GROUP", "weight": 63}, {"lootBoxItems": [{"count": 94, "duration": 66, "endDate": "1986-04-29T00:00:00Z", "itemId": "Uay6qxfv", "itemSku": "OONbAPHA", "itemType": "ligX6jI7"}, {"count": 51, "duration": 29, "endDate": "1973-09-09T00:00:00Z", "itemId": "9bhTic91", "itemSku": "wtA7H1Ic", "itemType": "1dwRJ7aG"}, {"count": 83, "duration": 13, "endDate": "1981-06-21T00:00:00Z", "itemId": "lQt9gotL", "itemSku": "pPZ4Diy4", "itemType": "hSdv3ypd"}], "name": "IvXj6zee", "odds": 0.7184904447182805, "type": "PROBABILITY_GROUP", "weight": 24}], "rollFunction": "CUSTOM"}, "maxCount": 80, "maxCountPerUser": 38, "name": "6QhLd28W", "optionBoxConfig": {"boxItems": [{"count": 41, "duration": 52, "endDate": "1998-05-13T00:00:00Z", "itemId": "r1ndbXDT", "itemSku": "9lqu9nmj", "itemType": "aErXK4bJ"}, {"count": 26, "duration": 32, "endDate": "1985-03-27T00:00:00Z", "itemId": "tptpVRTo", "itemSku": "JYvCRrCt", "itemType": "ASUoOUlZ"}, {"count": 20, "duration": 84, "endDate": "1973-11-26T00:00:00Z", "itemId": "u1fOoUVm", "itemSku": "nphN9Zbm", "itemType": "62pNkwfh"}]}, "purchasable": false, "recurring": {"cycle": "QUARTERLY", "fixedFreeDays": 17, "fixedTrialCycles": 74, "graceDays": 87}, "regionData": {"9XRlBv5v": [{"currencyCode": "Pd00Lgxt", "currencyNamespace": "luK7lgPd", "currencyType": "REAL", "discountAmount": 0, "discountExpireAt": "1994-09-23T00:00:00Z", "discountPercentage": 85, "discountPurchaseAt": "1974-09-10T00:00:00Z", "expireAt": "1981-08-06T00:00:00Z", "price": 57, "purchaseAt": "1982-10-29T00:00:00Z", "trialPrice": 18}, {"currencyCode": "ElqklnQW", "currencyNamespace": "6Q4RuohN", "currencyType": "REAL", "discountAmount": 28, "discountExpireAt": "1996-07-28T00:00:00Z", "discountPercentage": 86, "discountPurchaseAt": "1987-08-08T00:00:00Z", "expireAt": "1995-12-20T00:00:00Z", "price": 37, "purchaseAt": "1983-10-12T00:00:00Z", "trialPrice": 4}, {"currencyCode": "ScL9KmNA", "currencyNamespace": "K4YFu1rS", "currencyType": "VIRTUAL", "discountAmount": 84, "discountExpireAt": "1992-05-31T00:00:00Z", "discountPercentage": 28, "discountPurchaseAt": "1972-09-02T00:00:00Z", "expireAt": "1987-05-19T00:00:00Z", "price": 27, "purchaseAt": "1974-01-16T00:00:00Z", "trialPrice": 74}], "Mo1u0UBy": [{"currencyCode": "wYgxmyZy", "currencyNamespace": "y3KFCB6h", "currencyType": "VIRTUAL", "discountAmount": 17, "discountExpireAt": "1977-01-29T00:00:00Z", "discountPercentage": 84, "discountPurchaseAt": "1971-11-11T00:00:00Z", "expireAt": "1972-10-04T00:00:00Z", "price": 54, "purchaseAt": "1972-11-02T00:00:00Z", "trialPrice": 47}, {"currencyCode": "qhoF9PZI", "currencyNamespace": "YOlRWh5V", "currencyType": "REAL", "discountAmount": 45, "discountExpireAt": "1971-01-07T00:00:00Z", "discountPercentage": 99, "discountPurchaseAt": "1977-11-13T00:00:00Z", "expireAt": "1973-07-11T00:00:00Z", "price": 30, "purchaseAt": "1973-02-03T00:00:00Z", "trialPrice": 92}, {"currencyCode": "GMN2X3mt", "currencyNamespace": "DISbXVwo", "currencyType": "VIRTUAL", "discountAmount": 64, "discountExpireAt": "1990-02-22T00:00:00Z", "discountPercentage": 11, "discountPurchaseAt": "1995-09-21T00:00:00Z", "expireAt": "1975-03-07T00:00:00Z", "price": 67, "purchaseAt": "1975-12-25T00:00:00Z", "trialPrice": 9}], "lUVLheiX": [{"currencyCode": "M99i5XYq", "currencyNamespace": "EtrHDS6h", "currencyType": "VIRTUAL", "discountAmount": 87, "discountExpireAt": "1983-09-30T00:00:00Z", "discountPercentage": 58, "discountPurchaseAt": "1995-08-04T00:00:00Z", "expireAt": "1972-05-30T00:00:00Z", "price": 41, "purchaseAt": "1993-12-13T00:00:00Z", "trialPrice": 58}, {"currencyCode": "VqEf49JZ", "currencyNamespace": "W5tcMYyl", "currencyType": "VIRTUAL", "discountAmount": 95, "discountExpireAt": "1981-07-26T00:00:00Z", "discountPercentage": 38, "discountPurchaseAt": "1972-02-02T00:00:00Z", "expireAt": "1996-05-16T00:00:00Z", "price": 83, "purchaseAt": "1976-09-11T00:00:00Z", "trialPrice": 75}, {"currencyCode": "w8vHkiYV", "currencyNamespace": "visnqAiw", "currencyType": "VIRTUAL", "discountAmount": 1, "discountExpireAt": "1990-01-20T00:00:00Z", "discountPercentage": 78, "discountPurchaseAt": "1982-02-04T00:00:00Z", "expireAt": "1998-10-03T00:00:00Z", "price": 37, "purchaseAt": "1992-06-10T00:00:00Z", "trialPrice": 62}]}, "saleConfig": {"currencyCode": "cUE1iOcr", "price": 54}, "seasonType": "TIER", "sectionExclusive": true, "sellable": false, "sku": "LGVOlSDW", "stackable": false, "status": "ACTIVE", "tags": ["EtVGbA4h", "fwjMdhz5", "nxBADpeD"], "targetCurrencyCode": "BNy9b1bA", "targetNamespace": "C0DHDYHi", "thumbnailUrl": "VD8AqibH", "useCount": 47}' \
    > test.out 2>&1
eval_tap $? 129 'UpdateItem' test.out

#- 130 DeleteItem
./ng net.accelbyte.sdk.cli.Main platform deleteItem \
    --itemId 'J8qI3Ut7' \
    --namespace "$AB_NAMESPACE" \
    --force  \
    --storeId 'wrsTw34C' \
    > test.out 2>&1
eval_tap $? 130 'DeleteItem' test.out

#- 131 AcquireItem
./ng net.accelbyte.sdk.cli.Main platform acquireItem \
    --itemId 'RKVf70Z6' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 46, "orderNo": "8IBdLMqj"}' \
    > test.out 2>&1
eval_tap $? 131 'AcquireItem' test.out

#- 132 GetApp
./ng net.accelbyte.sdk.cli.Main platform getApp \
    --itemId 'ncjl79y5' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'lnrS7pKY' \
    > test.out 2>&1
eval_tap $? 132 'GetApp' test.out

#- 133 UpdateApp
./ng net.accelbyte.sdk.cli.Main platform updateApp \
    --itemId 'Y0weB76Y' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'qs4Vzzpt' \
    --body '{"carousel": [{"alt": "tgpNhg1V", "previewUrl": "KescVIvq", "thumbnailUrl": "JgWs9I6C", "type": "image", "url": "yKdLYpeZ", "videoSource": "vimeo"}, {"alt": "qZDUXf9W", "previewUrl": "LcC1IYSY", "thumbnailUrl": "hS1Tst1W", "type": "video", "url": "dlpMhrZC", "videoSource": "youtube"}, {"alt": "AjlflRvK", "previewUrl": "jkyuXlMw", "thumbnailUrl": "sFViXTDS", "type": "video", "url": "h0FbUJma", "videoSource": "youtube"}], "developer": "XK6q5naR", "forumUrl": "lGfAElwd", "genres": ["RPG", "Indie", "Adventure"], "localizations": {"7ldQ2NHh": {"announcement": "Cyxu2dVm", "slogan": "sAbmSq2u"}, "TX8viOhT": {"announcement": "J0F8ZvwX", "slogan": "09Z57M7V"}, "pWubDuuz": {"announcement": "3Ryfy5rG", "slogan": "G4C0UcOW"}}, "platformRequirements": {"CWkghKGb": [{"additionals": "TI4uogwp", "directXVersion": "GH6RK60o", "diskSpace": "UpiKpEGf", "graphics": "OaTLIlC3", "label": "j4I6aYhD", "osVersion": "yZBLA2ss", "processor": "LLgwcOJ1", "ram": "tnkPRQEy", "soundCard": "OdGsSIUr"}, {"additionals": "nW0Sn1q2", "directXVersion": "BPdLB6Zz", "diskSpace": "NgJGHlCB", "graphics": "EtKfmoJ8", "label": "NLO72yiE", "osVersion": "uMh7MxtC", "processor": "u5dKtKXF", "ram": "j4snmuRa", "soundCard": "t50TC1L5"}, {"additionals": "HjLYdC5N", "directXVersion": "JbdOt5FA", "diskSpace": "Z9H2BNQo", "graphics": "Ktm7u8TY", "label": "ceIWoQ5W", "osVersion": "Jbjpnx3M", "processor": "FfOD1GyO", "ram": "cDsXBEWS", "soundCard": "R4mR5Jrt"}], "vQ5GJaLU": [{"additionals": "U681FLC8", "directXVersion": "PQB2YjBF", "diskSpace": "cJAP8f54", "graphics": "dPJYfAuS", "label": "TIB5Kqw2", "osVersion": "2NfO0Dhf", "processor": "vRtez1jR", "ram": "m1SXdLbJ", "soundCard": "TLftJwUf"}, {"additionals": "8z6RonLn", "directXVersion": "tqIN7O4M", "diskSpace": "97hEYgS4", "graphics": "eNVTmcG7", "label": "8oQihTue", "osVersion": "ZLjXuO4H", "processor": "qNsNBjKQ", "ram": "VaaHSXuO", "soundCard": "nnEQt7hw"}, {"additionals": "XibPQath", "directXVersion": "4Bjcrd67", "diskSpace": "Eduf0LUC", "graphics": "UZSNiDEj", "label": "p46ixBoy", "osVersion": "8y3DbNpa", "processor": "znD1MzFa", "ram": "2rkem0Yw", "soundCard": "icEP3Nk0"}], "RmhyMoXn": [{"additionals": "kDWOhtkv", "directXVersion": "2cYDlBD1", "diskSpace": "IpttdXnM", "graphics": "hujK0u5l", "label": "2kfjJ73X", "osVersion": "V9YPCNKw", "processor": "GBDEOoT9", "ram": "bl0xx4xc", "soundCard": "hVJoFt0O"}, {"additionals": "Agyh9rUu", "directXVersion": "1aUIeQQO", "diskSpace": "xZ0a4UpQ", "graphics": "x4OrG0UC", "label": "OI3tDfcR", "osVersion": "OGJE8LTP", "processor": "w2Xcd8ZL", "ram": "mY1Q9qP7", "soundCard": "sMEfyTB5"}, {"additionals": "TwQu1CiB", "directXVersion": "do4G2pSU", "diskSpace": "HV9Fle4E", "graphics": "16a6B6b3", "label": "BEF6AmEk", "osVersion": "JD8UZrgg", "processor": "o4botPyo", "ram": "FzNMgcir", "soundCard": "Xw2nOnsU"}]}, "platforms": ["IOS", "Windows", "Android"], "players": ["CrossPlatformMulti", "CrossPlatformMulti", "Single"], "primaryGenre": "Sports", "publisher": "VOeuap1a", "releaseDate": "1981-01-18T00:00:00Z", "websiteUrl": "WCGlyA0n"}' \
    > test.out 2>&1
eval_tap $? 133 'UpdateApp' test.out

#- 134 DisableItem
./ng net.accelbyte.sdk.cli.Main platform disableItem \
    --itemId 'DpbFPtQb' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'hWD2apCp' \
    > test.out 2>&1
eval_tap $? 134 'DisableItem' test.out

#- 135 GetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform getItemDynamicData \
    --itemId 'KXR7VDCt' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 135 'GetItemDynamicData' test.out

#- 136 EnableItem
./ng net.accelbyte.sdk.cli.Main platform enableItem \
    --itemId 'mfgrhtoC' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'cIinqVBm' \
    > test.out 2>&1
eval_tap $? 136 'EnableItem' test.out

#- 137 FeatureItem
./ng net.accelbyte.sdk.cli.Main platform featureItem \
    --feature 'G1eLtBN6' \
    --itemId 'd4m638wY' \
    --namespace "$AB_NAMESPACE" \
    --storeId '60WqqZ7j' \
    > test.out 2>&1
eval_tap $? 137 'FeatureItem' test.out

#- 138 DefeatureItem
./ng net.accelbyte.sdk.cli.Main platform defeatureItem \
    --feature 'Vee6BH2r' \
    --itemId 'V2S1zoGd' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'xktI8QCx' \
    > test.out 2>&1
eval_tap $? 138 'DefeatureItem' test.out

#- 139 GetLocaleItem
./ng net.accelbyte.sdk.cli.Main platform getLocaleItem \
    --itemId 'YmnoOddh' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'PV2pFHot' \
    --populateBundle  \
    --region 'izHWqPlF' \
    --storeId 'W9qTikck' \
    > test.out 2>&1
eval_tap $? 139 'GetLocaleItem' test.out

#- 140 UpdateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform updateItemPurchaseCondition \
    --itemId 'k20CeSaB' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'a14DA2uy' \
    --body '{"purchaseCondition": {"conditionGroups": [{"operator": "or", "predicates": [{"anyOf": 20, "code": "rhS6tKYv", "comparison": "excludes", "name": "kqpbv5BR", "predicateType": "EntitlementPredicate", "value": "U6GnEHo5", "values": ["skdV0omi", "zS8CUUzO", "GRuABreK"]}, {"anyOf": 60, "code": "deyQJk8B", "comparison": "isGreaterThan", "name": "k7aLRRqv", "predicateType": "SeasonTierPredicate", "value": "81jVDFgf", "values": ["KrmcReQ6", "u3jOOCFi", "6BjrDxCb"]}, {"anyOf": 88, "code": "oDZTVBWK", "comparison": "isGreaterThan", "name": "487EwcGB", "predicateType": "SeasonPassPredicate", "value": "EneLxqnV", "values": ["XZn12iL0", "ma2MbWvW", "qqPr4tZ9"]}]}, {"operator": "and", "predicates": [{"anyOf": 72, "code": "X3Mx9xfb", "comparison": "is", "name": "bPXXjVTR", "predicateType": "SeasonPassPredicate", "value": "PY1DDFjK", "values": ["URz1M8WV", "5OjUBAvI", "FtwpBYq5"]}, {"anyOf": 10, "code": "g4WlLe8y", "comparison": "isGreaterThanOrEqual", "name": "0aessr4f", "predicateType": "SeasonTierPredicate", "value": "t9LhWCoY", "values": ["qj71uQ41", "M3lMpTuP", "DMUSYhof"]}, {"anyOf": 35, "code": "w2pLPDVK", "comparison": "includes", "name": "j05yk8rp", "predicateType": "SeasonTierPredicate", "value": "8KYG1Pqe", "values": ["ZeSJ90gg", "YTOaOZ3M", "BPCq0mR8"]}]}, {"operator": "and", "predicates": [{"anyOf": 1, "code": "QbTRYklE", "comparison": "isLessThan", "name": "EDh7mOaT", "predicateType": "EntitlementPredicate", "value": "w8VmoBGS", "values": ["HasUogOa", "roqLUMNM", "Dsw8NLjA"]}, {"anyOf": 68, "code": "IcUbVdHF", "comparison": "isLessThan", "name": "9coug1et", "predicateType": "SeasonTierPredicate", "value": "Pd61dQ5X", "values": ["swZuWI8m", "UX3699Q6", "CR4dHS0r"]}, {"anyOf": 9, "code": "ZTCsf6J8", "comparison": "isNot", "name": "0cFDaPh2", "predicateType": "StatisticCodePredicate", "value": "JGD77QBG", "values": ["JNKAB2if", "g8oZpPZ7", "AZg5k6N0"]}]}]}}' \
    > test.out 2>&1
eval_tap $? 140 'UpdateItemPurchaseCondition' test.out

#- 141 ReturnItem
./ng net.accelbyte.sdk.cli.Main platform returnItem \
    --itemId 'reJoIBzM' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "E4RWXp6a"}' \
    > test.out 2>&1
eval_tap $? 141 'ReturnItem' test.out

#- 142 QueryKeyGroups
./ng net.accelbyte.sdk.cli.Main platform queryKeyGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '96' \
    --name 'CFvrP0Xy' \
    --offset '77' \
    --tag 'PYZ0a4Hw' \
    > test.out 2>&1
eval_tap $? 142 'QueryKeyGroups' test.out

#- 143 CreateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform createKeyGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "HijXgsp1", "name": "3LC0Hxxg", "status": "ACTIVE", "tags": ["HkXe1KbY", "bexFFQMs", "F3qBctYB"]}' \
    > test.out 2>&1
eval_tap $? 143 'CreateKeyGroup' test.out

#- 144 GetKeyGroupByBoothName
eval_tap 0 144 'GetKeyGroupByBoothName # SKIP deprecated' test.out

#- 145 GetKeyGroup
./ng net.accelbyte.sdk.cli.Main platform getKeyGroup \
    --keyGroupId 'ILgmKlTY' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 145 'GetKeyGroup' test.out

#- 146 UpdateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform updateKeyGroup \
    --keyGroupId 'BEKtkiqj' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "rcCHckON", "name": "1hsLGeeq", "status": "INACTIVE", "tags": ["AuMNmPw4", "Yg9iaAR5", "EKUhY02V"]}' \
    > test.out 2>&1
eval_tap $? 146 'UpdateKeyGroup' test.out

#- 147 GetKeyGroupDynamic
./ng net.accelbyte.sdk.cli.Main platform getKeyGroupDynamic \
    --keyGroupId 'HXfTzAPP' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 147 'GetKeyGroupDynamic' test.out

#- 148 ListKeys
./ng net.accelbyte.sdk.cli.Main platform listKeys \
    --keyGroupId 'ZetHixig' \
    --namespace "$AB_NAMESPACE" \
    --limit '71' \
    --offset '30' \
    --status 'ACTIVE' \
    > test.out 2>&1
eval_tap $? 148 'ListKeys' test.out

#- 149 UploadKeys
./ng net.accelbyte.sdk.cli.Main platform uploadKeys \
    --keyGroupId 'DRgzQmE5' \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 149 'UploadKeys' test.out

#- 150 QueryOrders
./ng net.accelbyte.sdk.cli.Main platform queryOrders \
    --namespace "$AB_NAMESPACE" \
    --endTime '451xZFHo' \
    --limit '34' \
    --offset '88' \
    --orderNos 'aNpEvTOu,Uz59RkMf,YvfuTLkt' \
    --sortBy 'D82tZrmH' \
    --startTime 'LcecIVrd' \
    --status 'DELETED' \
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
    --orderNo 'E69O4kNL' \
    > test.out 2>&1
eval_tap $? 152 'GetOrder' test.out

#- 153 RefundOrder
./ng net.accelbyte.sdk.cli.Main platform refundOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo '37fLDWxu' \
    --body '{"description": "U7mvmgXV"}' \
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
    --body '{"domains": ["szxHkLaT", "QYHDF7RY", "k6QZbQfk"]}' \
    > test.out 2>&1
eval_tap $? 157 'UpdatePaymentDomainWhitelistConfig' test.out

#- 158 QueryPaymentNotifications
./ng net.accelbyte.sdk.cli.Main platform queryPaymentNotifications \
    --namespace "$AB_NAMESPACE" \
    --endDate 'MJPSqi7o' \
    --externalId 'IhMhzAya' \
    --limit '98' \
    --notificationSource 'CHECKOUT' \
    --notificationType 'E2pzfP2i' \
    --offset '30' \
    --paymentOrderNo 'cjKtJ3WQ' \
    --startDate 'VjuZy6vp' \
    --status 'ERROR' \
    > test.out 2>&1
eval_tap $? 158 'QueryPaymentNotifications' test.out

#- 159 QueryPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform queryPaymentOrders \
    --namespace "$AB_NAMESPACE" \
    --channel 'EXTERNAL' \
    --extTxId 'nbktLUlL' \
    --limit '56' \
    --offset '63' \
    --status 'NOTIFICATION_OF_CHARGEBACK' \
    > test.out 2>&1
eval_tap $? 159 'QueryPaymentOrders' test.out

#- 160 CreatePaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform createPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --body '{"currencyCode": "7I8f6RF6", "currencyNamespace": "Ar4tMkUW", "customParameters": {"gd1kDXP3": {}, "e0fV36mF": {}, "IEnvoJkw": {}}, "description": "M6y3km5s", "extOrderNo": "uzbZjTyd", "extUserId": "bkyi2CI2", "itemType": "INGAMEITEM", "language": "QlpX_409", "metadata": {"XhwT6oqt": "dfw7SPet", "NPQ35usW": "jwJjni9R", "Ov2uukb9": "sKge9n2Z"}, "notifyUrl": "0r96d0eH", "omitNotification": true, "platform": "g9ErXEJs", "price": 44, "recurringPaymentOrderNo": "MJTuAIph", "region": "2QpPQX6p", "returnUrl": "NzuhIeUo", "sandbox": true, "sku": "LxsruuRn", "subscriptionId": "4Po6DF0I", "targetNamespace": "V00QtqRZ", "targetUserId": "cYu9ytKe", "title": "r79QXm3Q"}' \
    > test.out 2>&1
eval_tap $? 160 'CreatePaymentOrderByDedicated' test.out

#- 161 ListExtOrderNoByExtTxId
./ng net.accelbyte.sdk.cli.Main platform listExtOrderNoByExtTxId \
    --namespace "$AB_NAMESPACE" \
    --extTxId 'oMi6HPrX' \
    > test.out 2>&1
eval_tap $? 161 'ListExtOrderNoByExtTxId' test.out

#- 162 GetPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'J11yRU9F' \
    > test.out 2>&1
eval_tap $? 162 'GetPaymentOrder' test.out

#- 163 ChargePaymentOrder
./ng net.accelbyte.sdk.cli.Main platform chargePaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'lh1Pj76X' \
    --body '{"extTxId": "azn7Pz2T", "paymentMethod": "T1Uc8Uze", "paymentProvider": "PAYPAL"}' \
    > test.out 2>&1
eval_tap $? 163 'ChargePaymentOrder' test.out

#- 164 RefundPaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform refundPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'yQ8PO6UJ' \
    --body '{"description": "TFGtSwM7"}' \
    > test.out 2>&1
eval_tap $? 164 'RefundPaymentOrderByDedicated' test.out

#- 165 SimulatePaymentOrderNotification
./ng net.accelbyte.sdk.cli.Main platform simulatePaymentOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'OyZ3aw0u' \
    --body '{"amount": 83, "currencyCode": "RwdYrY7P", "notifyType": "CHARGE", "paymentProvider": "WXPAY", "salesTax": 74, "vat": 12}' \
    > test.out 2>&1
eval_tap $? 165 'SimulatePaymentOrderNotification' test.out

#- 166 GetPaymentOrderChargeStatus
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrderChargeStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '4I9DjX41' \
    > test.out 2>&1
eval_tap $? 166 'GetPaymentOrderChargeStatus' test.out

#- 167 GetPsnEntitlementOwnership
./ng net.accelbyte.sdk.cli.Main platform getPsnEntitlementOwnership \
    --entitlementLabel '31jM0Pbb' \
    --namespace "$AB_NAMESPACE" \
    --body '{"accessToken": "fhiP9E6O", "serviceLabel": 73}' \
    > test.out 2>&1
eval_tap $? 167 'GetPsnEntitlementOwnership' test.out

#- 168 GetXboxEntitlementOwnership
./ng net.accelbyte.sdk.cli.Main platform getXboxEntitlementOwnership \
    --namespace "$AB_NAMESPACE" \
    --productSku 'RXJd5Dl1' \
    --body '{"delegationToken": "B0wTWOVu", "sandboxId": "ZCuXlGYe"}' \
    > test.out 2>&1
eval_tap $? 168 'GetXboxEntitlementOwnership' test.out

#- 169 GetPlatformEntitlementConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformEntitlementConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Playstation' \
    > test.out 2>&1
eval_tap $? 169 'GetPlatformEntitlementConfig' test.out

#- 170 UpdatePlatformEntitlementConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformEntitlementConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Nintendo' \
    --body '{"allowedPlatformOrigins": ["IOS", "Oculus", "Xbox"]}' \
    > test.out 2>&1
eval_tap $? 170 'UpdatePlatformEntitlementConfig' test.out

#- 171 GetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Other' \
    > test.out 2>&1
eval_tap $? 171 'GetPlatformWalletConfig' test.out

#- 172 UpdatePlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Steam' \
    --body '{"allowedBalanceOrigins": ["System", "Epic", "Epic"]}' \
    > test.out 2>&1
eval_tap $? 172 'UpdatePlatformWalletConfig' test.out

#- 173 ResetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform resetPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Oculus' \
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
    --body '{"entitlement": {"consumable": {"enabled": false, "strategy": "CUSTOM"}, "durable": {"enabled": false, "strategy": "REVOKE_OR_REPORT"}}, "wallet": {"enabled": true, "strategy": "ALWAYS_REVOKE"}}' \
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
    --endTime 'VSxzZdPY' \
    --limit '15' \
    --offset '36' \
    --source 'OTHER' \
    --startTime 'yAT7oVUW' \
    --status 'SUCCESS' \
    --transactionId 'YCnCCjol' \
    --userId '2KzWSliJ' \
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
    --body '{"appConfig": {"appName": "lkruZCsd"}, "customConfig": {"connectionType": "INSECURE", "grpcServerAddress": "ahEjNxk5"}, "extendType": "CUSTOM"}' \
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
    --body '{"description": "hgo91ncw", "eventTopic": "dhpYWAxJ", "maxAwarded": 63, "maxAwardedPerUser": 99, "namespaceExpression": "jnJQetSr", "rewardCode": "Dp1Dz6U2", "rewardConditions": [{"condition": "jTYUzu48", "conditionName": "AkMmF6S3", "eventName": "9QScWAVi", "rewardItems": [{"duration": 8, "endDate": "1977-01-15T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "MYxJ0F2K", "quantity": 27, "sku": "1NY0Sklg"}, {"duration": 87, "endDate": "1994-09-16T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "d01fmrS8", "quantity": 50, "sku": "nBYqZJVp"}, {"duration": 3, "endDate": "1978-10-13T00:00:00Z", "identityType": "ITEM_ID", "itemId": "CmMXcyzD", "quantity": 0, "sku": "d4FcxoRO"}]}, {"condition": "Wm8TiuCu", "conditionName": "gXcRPBxF", "eventName": "XgAPrZl7", "rewardItems": [{"duration": 18, "endDate": "1997-08-27T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "Epb0m3Nv", "quantity": 34, "sku": "p5VPAT4f"}, {"duration": 54, "endDate": "1997-10-21T00:00:00Z", "identityType": "ITEM_ID", "itemId": "1w32BeST", "quantity": 71, "sku": "x2CpzAbt"}, {"duration": 49, "endDate": "1972-01-05T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "eCfCaDws", "quantity": 80, "sku": "2cBKpEZs"}]}, {"condition": "aCSBzTr2", "conditionName": "Grr2ptsg", "eventName": "gKIhQ7Fb", "rewardItems": [{"duration": 80, "endDate": "1976-08-29T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "ZCHHzxSi", "quantity": 27, "sku": "IaAaNvgh"}, {"duration": 50, "endDate": "1973-11-15T00:00:00Z", "identityType": "ITEM_ID", "itemId": "uhQstdwu", "quantity": 59, "sku": "lpIzGJMN"}, {"duration": 85, "endDate": "1986-04-19T00:00:00Z", "identityType": "ITEM_ID", "itemId": "9bAQZMva", "quantity": 99, "sku": "gEp002GK"}]}], "userIdExpression": "TRCrf95d"}' \
    > test.out 2>&1
eval_tap $? 182 'CreateReward' test.out

#- 183 QueryRewards
./ng net.accelbyte.sdk.cli.Main platform queryRewards \
    --namespace "$AB_NAMESPACE" \
    --eventTopic '8seg9ZVD' \
    --limit '73' \
    --offset '33' \
    --sortBy 'rewardCode:asc,rewardCode,namespace:asc' \
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
    --rewardId 'WrdFDijV' \
    > test.out 2>&1
eval_tap $? 186 'GetReward' test.out

#- 187 UpdateReward
./ng net.accelbyte.sdk.cli.Main platform updateReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'OiQbWuoT' \
    --body '{"description": "5oFwuhsr", "eventTopic": "ul3pX3gl", "maxAwarded": 5, "maxAwardedPerUser": 32, "namespaceExpression": "TQFdKMaD", "rewardCode": "n7r8ZeT3", "rewardConditions": [{"condition": "oT9uaZZ5", "conditionName": "dHmWIJur", "eventName": "3SVCQRb4", "rewardItems": [{"duration": 40, "endDate": "1984-02-05T00:00:00Z", "identityType": "ITEM_ID", "itemId": "qltbBEch", "quantity": 90, "sku": "RowUnJXF"}, {"duration": 95, "endDate": "1971-05-07T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "dDe4ta74", "quantity": 63, "sku": "FVTAH0on"}, {"duration": 28, "endDate": "1994-05-20T00:00:00Z", "identityType": "ITEM_ID", "itemId": "8p8A9FUz", "quantity": 17, "sku": "X8KwP4zD"}]}, {"condition": "N0te5VUB", "conditionName": "3r3q0Qd7", "eventName": "V8d7ZADo", "rewardItems": [{"duration": 51, "endDate": "1988-05-13T00:00:00Z", "identityType": "ITEM_ID", "itemId": "u0aR9s4y", "quantity": 66, "sku": "LEnWAHqo"}, {"duration": 65, "endDate": "1992-12-04T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "7ziSB0j3", "quantity": 43, "sku": "Jnaiovo9"}, {"duration": 31, "endDate": "1975-05-09T00:00:00Z", "identityType": "ITEM_ID", "itemId": "gD8wrwNb", "quantity": 95, "sku": "wGaUiVm8"}]}, {"condition": "U3EplOAC", "conditionName": "fAUa8wqS", "eventName": "43GnC1ZE", "rewardItems": [{"duration": 22, "endDate": "1980-03-27T00:00:00Z", "identityType": "ITEM_ID", "itemId": "mYw25mPI", "quantity": 53, "sku": "eXOJMkNk"}, {"duration": 29, "endDate": "1981-10-27T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "prAhRM14", "quantity": 15, "sku": "9jpmE0Ih"}, {"duration": 9, "endDate": "1998-02-24T00:00:00Z", "identityType": "ITEM_ID", "itemId": "LHKUifGW", "quantity": 44, "sku": "uGOOE6Sx"}]}], "userIdExpression": "j6ZvUORd"}' \
    > test.out 2>&1
eval_tap $? 187 'UpdateReward' test.out

#- 188 DeleteReward
./ng net.accelbyte.sdk.cli.Main platform deleteReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId '27n8zAOa' \
    > test.out 2>&1
eval_tap $? 188 'DeleteReward' test.out

#- 189 CheckEventCondition
./ng net.accelbyte.sdk.cli.Main platform checkEventCondition \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'Rst2MfBo' \
    --body '{"payload": {"LfjhA2bP": {}, "C09m5WNE": {}, "J7BHVKpo": {}}}' \
    > test.out 2>&1
eval_tap $? 189 'CheckEventCondition' test.out

#- 190 DeleteRewardConditionRecord
./ng net.accelbyte.sdk.cli.Main platform deleteRewardConditionRecord \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'Jw56BXWi' \
    --body '{"conditionName": "gHqFya2a", "userId": "X1GatzDR"}' \
    > test.out 2>&1
eval_tap $? 190 'DeleteRewardConditionRecord' test.out

#- 191 QuerySections
./ng net.accelbyte.sdk.cli.Main platform querySections \
    --namespace "$AB_NAMESPACE" \
    --end 'BFQx4s3k' \
    --limit '14' \
    --offset '92' \
    --start '8Ru3tYJS' \
    --storeId 'okuOjeTu' \
    --viewId 'dN5oaITB' \
    > test.out 2>&1
eval_tap $? 191 'QuerySections' test.out

#- 192 CreateSection
./ng net.accelbyte.sdk.cli.Main platform createSection \
    --namespace "$AB_NAMESPACE" \
    --storeId 'J3kpCIYp' \
    --body '{"active": true, "displayOrder": 19, "endDate": "1996-09-05T00:00:00Z", "ext": {"x5AACwUf": {}, "cbdfBm7Q": {}, "ZVlPD8wx": {}}, "fixedPeriodRotationConfig": {"backfillType": "CUSTOM", "duration": 89, "itemCount": 54, "rule": "SEQUENCE"}, "items": [{"id": "1AUXRU45", "sku": "oE2BUXRd"}, {"id": "bp6R3otf", "sku": "RspZ07XM"}, {"id": "Medb2QtT", "sku": "eP7mFwLs"}], "localizations": {"ah4DQdzc": {"description": "6t6xYJYi", "localExt": {"1dAQHgL9": {}, "sF3Fo1DM": {}, "sCV5MAR5": {}}, "longDescription": "sjGXAym0", "title": "6JV2s67F"}, "nH2crlpB": {"description": "zKU0nlpf", "localExt": {"DdtHMCFK": {}, "RauizHXJ": {}, "RMM4sdNW": {}}, "longDescription": "6uHSlw9K", "title": "FbkUgqSD"}, "h6cuzRPr": {"description": "sEjMFq24", "localExt": {"ZUtjHo2z": {}, "0fxzXhT1": {}, "uXp1Zzzz": {}}, "longDescription": "k2ZZW9ev", "title": "x1081nxT"}}, "name": "sWgTPh4V", "rotationType": "CUSTOM", "startDate": "1983-11-25T00:00:00Z", "viewId": "fgzhSCJg"}' \
    > test.out 2>&1
eval_tap $? 192 'CreateSection' test.out

#- 193 PurgeExpiredSection
./ng net.accelbyte.sdk.cli.Main platform purgeExpiredSection \
    --namespace "$AB_NAMESPACE" \
    --storeId 'rTPGIbF8' \
    > test.out 2>&1
eval_tap $? 193 'PurgeExpiredSection' test.out

#- 194 GetSection
./ng net.accelbyte.sdk.cli.Main platform getSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'pKh6hQb1' \
    --storeId '5JSevzz6' \
    > test.out 2>&1
eval_tap $? 194 'GetSection' test.out

#- 195 UpdateSection
./ng net.accelbyte.sdk.cli.Main platform updateSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId '2txOUIsJ' \
    --storeId 'kaA3i8HZ' \
    --body '{"active": false, "displayOrder": 57, "endDate": "1989-12-12T00:00:00Z", "ext": {"wE2iUA3Q": {}, "KBX6L8KW": {}, "ZpXOTxOV": {}}, "fixedPeriodRotationConfig": {"backfillType": "NONE", "duration": 84, "itemCount": 48, "rule": "SEQUENCE"}, "items": [{"id": "RNYnicXc", "sku": "sM9JnmDz"}, {"id": "CUpX4vAt", "sku": "aBoTTslJ"}, {"id": "1TG7Vb2Z", "sku": "FqnKIDbH"}], "localizations": {"ddCruU70": {"description": "e4KSVwnm", "localExt": {"lPD1MmmG": {}, "kEIZ0hAe": {}, "C16O8CRn": {}}, "longDescription": "SctN5RGM", "title": "cAcOjh3Z"}, "ZQAjGwYD": {"description": "4DZs5ITn", "localExt": {"0tzYhO4O": {}, "Jxtz7yyy": {}, "SK3j80Ap": {}}, "longDescription": "wSCVTk5g", "title": "IUBILzop"}, "Lc5A8Nzt": {"description": "BSjUFDeR", "localExt": {"zPQ4YaAH": {}, "CKVvxNSU": {}, "b9vlYwe5": {}}, "longDescription": "P5ZU9HBL", "title": "ccTPBqei"}}, "name": "f7axa0s3", "rotationType": "FIXED_PERIOD", "startDate": "1992-09-24T00:00:00Z", "viewId": "n2KZbZCT"}' \
    > test.out 2>&1
eval_tap $? 195 'UpdateSection' test.out

#- 196 DeleteSection
./ng net.accelbyte.sdk.cli.Main platform deleteSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'rsFS3SnM' \
    --storeId 'bMOOdrJS' \
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
    --body '{"defaultLanguage": "9tdTFMop", "defaultRegion": "Kcgfks4e", "description": "4IUXiwSc", "supportedLanguages": ["IYbvfr10", "PTzgCLH2", "zIdyP5La"], "supportedRegions": ["inEFJOwd", "WeQztwn1", "qO0G01d2"], "title": "I1aKlPY6"}' \
    > test.out 2>&1
eval_tap $? 198 'CreateStore' test.out

#- 199 GetCatalogDefinition
./ng net.accelbyte.sdk.cli.Main platform getCatalogDefinition \
    --namespace "$AB_NAMESPACE" \
    --catalogType 'VIEW' \
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
    --body '{"catalogType": "APP", "fieldsToBeIncluded": ["gSxHkgO0", "g7M1dfrj", "V1yCvWiu"], "idsToBeExported": ["RZM7xwwl", "od9XI2OW", "HQK4UkIR"], "storeId": "VIxc0tWJ"}' \
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
    --storeId '70pNrsXw' \
    > test.out 2>&1
eval_tap $? 207 'GetStore' test.out

#- 208 UpdateStore
./ng net.accelbyte.sdk.cli.Main platform updateStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'CX0S3tGb' \
    --body '{"defaultLanguage": "R0vd8V9Z", "defaultRegion": "pImghRYM", "description": "bWlD1nFz", "supportedLanguages": ["jbHZx6Vn", "ueB6dPtR", "kJpZvUjG"], "supportedRegions": ["p7ht28OI", "ayNUDj9t", "IPaTLcjT"], "title": "u1ULX7XX"}' \
    > test.out 2>&1
eval_tap $? 208 'UpdateStore' test.out

#- 209 DeleteStore
./ng net.accelbyte.sdk.cli.Main platform deleteStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'MmnmLayG' \
    > test.out 2>&1
eval_tap $? 209 'DeleteStore' test.out

#- 210 QueryChanges
./ng net.accelbyte.sdk.cli.Main platform queryChanges \
    --namespace "$AB_NAMESPACE" \
    --storeId '28IEjMbG' \
    --action 'CREATE' \
    --itemSku 'H8bu5Hyw' \
    --itemType 'SUBSCRIPTION' \
    --limit '52' \
    --offset '70' \
    --selected  \
    --sortBy 'updatedAt,createdAt:desc' \
    --status 'UNPUBLISHED' \
    --type 'SECTION' \
    --updatedAtEnd 'gLXHm3iT' \
    --updatedAtStart '1hJPNnc3' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 210 'QueryChanges' test.out

#- 211 PublishAll
./ng net.accelbyte.sdk.cli.Main platform publishAll \
    --namespace "$AB_NAMESPACE" \
    --storeId 'OUBho6Nt' \
    > test.out 2>&1
eval_tap $? 211 'PublishAll' test.out

#- 212 PublishSelected
./ng net.accelbyte.sdk.cli.Main platform publishSelected \
    --namespace "$AB_NAMESPACE" \
    --storeId 'gcGLKFCn' \
    > test.out 2>&1
eval_tap $? 212 'PublishSelected' test.out

#- 213 SelectAllRecords
./ng net.accelbyte.sdk.cli.Main platform selectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'l2gd1Zg6' \
    > test.out 2>&1
eval_tap $? 213 'SelectAllRecords' test.out

#- 214 SelectAllRecordsByCriteria
./ng net.accelbyte.sdk.cli.Main platform selectAllRecordsByCriteria \
    --namespace "$AB_NAMESPACE" \
    --storeId 'LMlxcoQg' \
    --action 'UPDATE' \
    --itemSku 'gur5NEAE' \
    --itemType 'MEDIA' \
    --selected  \
    --type 'STORE' \
    --updatedAtEnd 'AvnHaF9i' \
    --updatedAtStart 'qVvgr7ju' \
    > test.out 2>&1
eval_tap $? 214 'SelectAllRecordsByCriteria' test.out

#- 215 GetStatistic
./ng net.accelbyte.sdk.cli.Main platform getStatistic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'KayZ17Z1' \
    --action 'UPDATE' \
    --itemSku 'zBtNAOa0' \
    --itemType 'OPTIONBOX' \
    --type 'CATEGORY' \
    --updatedAtEnd 'Y5SEMCCl' \
    --updatedAtStart 'MebhXtIS' \
    > test.out 2>&1
eval_tap $? 215 'GetStatistic' test.out

#- 216 UnselectAllRecords
./ng net.accelbyte.sdk.cli.Main platform unselectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId '0F00Yl6s' \
    > test.out 2>&1
eval_tap $? 216 'UnselectAllRecords' test.out

#- 217 SelectRecord
./ng net.accelbyte.sdk.cli.Main platform selectRecord \
    --changeId 'X23lUACV' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ZzBLDqG5' \
    > test.out 2>&1
eval_tap $? 217 'SelectRecord' test.out

#- 218 UnselectRecord
./ng net.accelbyte.sdk.cli.Main platform unselectRecord \
    --changeId 'TiQIy9I4' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'kjxpgC6N' \
    > test.out 2>&1
eval_tap $? 218 'UnselectRecord' test.out

#- 219 CloneStore
./ng net.accelbyte.sdk.cli.Main platform cloneStore \
    --namespace "$AB_NAMESPACE" \
    --storeId '2I0DeRL8' \
    --targetStoreId 'KVf6wWDP' \
    > test.out 2>&1
eval_tap $? 219 'CloneStore' test.out

#- 220 ExportStore
eval_tap 0 220 'ExportStore # SKIP deprecated' test.out

#- 221 QueryImportHistory
./ng net.accelbyte.sdk.cli.Main platform queryImportHistory \
    --namespace "$AB_NAMESPACE" \
    --storeId '05PQM6Tz' \
    --end 'eDeMWYtg' \
    --limit '19' \
    --offset '17' \
    --sortBy 'dePbVqns' \
    --start 'baWM7rPF' \
    --success  \
    > test.out 2>&1
eval_tap $? 221 'QueryImportHistory' test.out

#- 222 ImportStoreByCSV
./ng net.accelbyte.sdk.cli.Main platform importStoreByCSV \
    --namespace "$AB_NAMESPACE" \
    --storeId 'to7bJECW' \
    --category 'tmp.dat' \
    --display 'tmp.dat' \
    --item 'tmp.dat' \
    --notes 'bx2rOpep' \
    --section 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 222 'ImportStoreByCSV' test.out

#- 223 QuerySubscriptions
./ng net.accelbyte.sdk.cli.Main platform querySubscriptions \
    --namespace "$AB_NAMESPACE" \
    --chargeStatus 'CHARGE_FAILED' \
    --itemId 'bw7fD83z' \
    --limit '15' \
    --offset '48' \
    --sku 'bbThxZ0p' \
    --status 'INIT' \
    --subscribedBy 'USER' \
    --userId 'lBus32Wl' \
    > test.out 2>&1
eval_tap $? 223 'QuerySubscriptions' test.out

#- 224 RecurringChargeSubscription
./ng net.accelbyte.sdk.cli.Main platform recurringChargeSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '1bWOeNg6' \
    > test.out 2>&1
eval_tap $? 224 'RecurringChargeSubscription' test.out

#- 225 GetTicketDynamic
./ng net.accelbyte.sdk.cli.Main platform getTicketDynamic \
    --boothName '0ZmQbv3U' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 225 'GetTicketDynamic' test.out

#- 226 DecreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform decreaseTicketSale \
    --boothName 'VWAFQgeF' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "fRZTv4oQ"}' \
    > test.out 2>&1
eval_tap $? 226 'DecreaseTicketSale' test.out

#- 227 GetTicketBoothID
./ng net.accelbyte.sdk.cli.Main platform getTicketBoothID \
    --boothName 'm6kcIX6k' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 227 'GetTicketBoothID' test.out

#- 228 IncreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform increaseTicketSale \
    --boothName '8xlEVKKG' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 86, "orderNo": "3xNmSg1m"}' \
    > test.out 2>&1
eval_tap $? 228 'IncreaseTicketSale' test.out

#- 229 Commit
./ng net.accelbyte.sdk.cli.Main platform commit \
    --namespace "$AB_NAMESPACE" \
    --body '{"actions": [{"operations": [{"creditPayload": {"balanceOrigin": "Epic", "count": 42, "currencyCode": "0YzvTtXP", "expireAt": "1980-10-24T00:00:00Z"}, "debitPayload": {"count": 20, "currencyCode": "C9llrvJc", "walletPlatform": "Oculus"}, "fulFillItemPayload": {"count": 17, "entitlementCollectionId": "oGfA1Oyp", "entitlementOrigin": "Steam", "itemIdentity": "kkPcE1gi", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 25, "entitlementId": "Q9DnHHxu"}, "type": "DEBIT_WALLET"}, {"creditPayload": {"balanceOrigin": "Oculus", "count": 81, "currencyCode": "cYzIfXyE", "expireAt": "1998-03-19T00:00:00Z"}, "debitPayload": {"count": 24, "currencyCode": "rw5d3MEJ", "walletPlatform": "Xbox"}, "fulFillItemPayload": {"count": 36, "entitlementCollectionId": "RpwIgP3E", "entitlementOrigin": "Epic", "itemIdentity": "1lPqucSw", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 41, "entitlementId": "DLd7ygUA"}, "type": "DEBIT_WALLET"}, {"creditPayload": {"balanceOrigin": "Nintendo", "count": 94, "currencyCode": "qFoz8zNk", "expireAt": "1975-10-28T00:00:00Z"}, "debitPayload": {"count": 11, "currencyCode": "hgvK5wrU", "walletPlatform": "IOS"}, "fulFillItemPayload": {"count": 90, "entitlementCollectionId": "FpUTEFcP", "entitlementOrigin": "System", "itemIdentity": "vp9A5sK3", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 25, "entitlementId": "Jc2IRHLH"}, "type": "REVOKE_ENTITLEMENT"}], "userId": "3juhCDLa"}, {"operations": [{"creditPayload": {"balanceOrigin": "Nintendo", "count": 96, "currencyCode": "yV6Sos4N", "expireAt": "1984-12-21T00:00:00Z"}, "debitPayload": {"count": 36, "currencyCode": "Y9hDpEsm", "walletPlatform": "Playstation"}, "fulFillItemPayload": {"count": 88, "entitlementCollectionId": "VgregqOX", "entitlementOrigin": "Xbox", "itemIdentity": "VqwsiVvl", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 78, "entitlementId": "NMopDY9P"}, "type": "DEBIT_WALLET"}, {"creditPayload": {"balanceOrigin": "Xbox", "count": 63, "currencyCode": "oZCOLOXh", "expireAt": "1987-11-14T00:00:00Z"}, "debitPayload": {"count": 1, "currencyCode": "fxOnUPQb", "walletPlatform": "Steam"}, "fulFillItemPayload": {"count": 11, "entitlementCollectionId": "RM5tZgA5", "entitlementOrigin": "Twitch", "itemIdentity": "rMvq5S5L", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 69, "entitlementId": "ld3BYgpE"}, "type": "REVOKE_ENTITLEMENT"}, {"creditPayload": {"balanceOrigin": "GooglePlay", "count": 90, "currencyCode": "wGsoNnrA", "expireAt": "1988-09-24T00:00:00Z"}, "debitPayload": {"count": 34, "currencyCode": "QmYIt4QJ", "walletPlatform": "Steam"}, "fulFillItemPayload": {"count": 42, "entitlementCollectionId": "M8oIaP2P", "entitlementOrigin": "GooglePlay", "itemIdentity": "1KoRdYA2", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 26, "entitlementId": "mkIFBZnZ"}, "type": "FULFILL_ITEM"}], "userId": "OQPX6s8Y"}, {"operations": [{"creditPayload": {"balanceOrigin": "IOS", "count": 27, "currencyCode": "B57KTrBK", "expireAt": "1982-08-17T00:00:00Z"}, "debitPayload": {"count": 71, "currencyCode": "w1SkApBV", "walletPlatform": "Playstation"}, "fulFillItemPayload": {"count": 70, "entitlementCollectionId": "yDdTat4v", "entitlementOrigin": "IOS", "itemIdentity": "iat5Dz1H", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 77, "entitlementId": "NvrzQ92s"}, "type": "FULFILL_ITEM"}, {"creditPayload": {"balanceOrigin": "Playstation", "count": 23, "currencyCode": "eTsRP0Dh", "expireAt": "1976-01-07T00:00:00Z"}, "debitPayload": {"count": 49, "currencyCode": "RULb2FdN", "walletPlatform": "GooglePlay"}, "fulFillItemPayload": {"count": 79, "entitlementCollectionId": "b0Dp9AYI", "entitlementOrigin": "Playstation", "itemIdentity": "8Ep9yot8", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 4, "entitlementId": "QMLE9QfS"}, "type": "CREDIT_WALLET"}, {"creditPayload": {"balanceOrigin": "IOS", "count": 41, "currencyCode": "AGvpD0QQ", "expireAt": "1989-10-22T00:00:00Z"}, "debitPayload": {"count": 37, "currencyCode": "pFSILZ7N", "walletPlatform": "IOS"}, "fulFillItemPayload": {"count": 2, "entitlementCollectionId": "vXCfPVdE", "entitlementOrigin": "Oculus", "itemIdentity": "oziR5sd6", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 5, "entitlementId": "af5lQypk"}, "type": "REVOKE_ENTITLEMENT"}], "userId": "Uct5UBUY"}], "metadata": {"PMZR0L5w": {}, "3X7WlSHk": {}, "61UoJDe9": {}}, "needPreCheck": true, "transactionId": "3refjWfV", "type": "f3Hdoz3x"}' \
    > test.out 2>&1
eval_tap $? 229 'Commit' test.out

#- 230 GetTradeHistoryByCriteria
./ng net.accelbyte.sdk.cli.Main platform getTradeHistoryByCriteria \
    --namespace "$AB_NAMESPACE" \
    --limit '48' \
    --offset '21' \
    --status 'FAILED' \
    --type 'XaCNRqit' \
    --userId 'NW1WNK6Y' \
    > test.out 2>&1
eval_tap $? 230 'GetTradeHistoryByCriteria' test.out

#- 231 GetTradeHistoryByTransactionId
./ng net.accelbyte.sdk.cli.Main platform getTradeHistoryByTransactionId \
    --namespace "$AB_NAMESPACE" \
    --transactionId 'OU23U2Dh' \
    > test.out 2>&1
eval_tap $? 231 'GetTradeHistoryByTransactionId' test.out

#- 232 UnlockSteamUserAchievement
./ng net.accelbyte.sdk.cli.Main platform unlockSteamUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'oAliSoE3' \
    --body '{"achievements": [{"id": "lQ17nY6p", "value": 48}, {"id": "BYr4aBHy", "value": 21}, {"id": "T1tvylc8", "value": 13}], "steamUserId": "HWELZof3"}' \
    > test.out 2>&1
eval_tap $? 232 'UnlockSteamUserAchievement' test.out

#- 233 GetXblUserAchievements
./ng net.accelbyte.sdk.cli.Main platform getXblUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'CGIp5RiX' \
    --xboxUserId 'f90Nvih2' \
    > test.out 2>&1
eval_tap $? 233 'GetXblUserAchievements' test.out

#- 234 UpdateXblUserAchievement
./ng net.accelbyte.sdk.cli.Main platform updateXblUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId '3tw9aXzi' \
    --body '{"achievements": [{"id": "UJSNBN7e", "percentComplete": 35}, {"id": "QUxOTj2d", "percentComplete": 36}, {"id": "GjnlQ9Ro", "percentComplete": 71}], "serviceConfigId": "oc8I3SuO", "titleId": "grROUR7N", "xboxUserId": "YCjoKa2V"}' \
    > test.out 2>&1
eval_tap $? 234 'UpdateXblUserAchievement' test.out

#- 235 AnonymizeCampaign
./ng net.accelbyte.sdk.cli.Main platform anonymizeCampaign \
    --namespace "$AB_NAMESPACE" \
    --userId '0ohmWJI1' \
    > test.out 2>&1
eval_tap $? 235 'AnonymizeCampaign' test.out

#- 236 AnonymizeEntitlement
./ng net.accelbyte.sdk.cli.Main platform anonymizeEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'AzQzJpvM' \
    > test.out 2>&1
eval_tap $? 236 'AnonymizeEntitlement' test.out

#- 237 AnonymizeFulfillment
./ng net.accelbyte.sdk.cli.Main platform anonymizeFulfillment \
    --namespace "$AB_NAMESPACE" \
    --userId '1o7bbbwV' \
    > test.out 2>&1
eval_tap $? 237 'AnonymizeFulfillment' test.out

#- 238 AnonymizeIntegration
./ng net.accelbyte.sdk.cli.Main platform anonymizeIntegration \
    --namespace "$AB_NAMESPACE" \
    --userId '6M5NEeVB' \
    > test.out 2>&1
eval_tap $? 238 'AnonymizeIntegration' test.out

#- 239 AnonymizeOrder
./ng net.accelbyte.sdk.cli.Main platform anonymizeOrder \
    --namespace "$AB_NAMESPACE" \
    --userId '5q7ZEdWy' \
    > test.out 2>&1
eval_tap $? 239 'AnonymizeOrder' test.out

#- 240 AnonymizePayment
./ng net.accelbyte.sdk.cli.Main platform anonymizePayment \
    --namespace "$AB_NAMESPACE" \
    --userId 'O3E4aZ1N' \
    > test.out 2>&1
eval_tap $? 240 'AnonymizePayment' test.out

#- 241 AnonymizeRevocation
./ng net.accelbyte.sdk.cli.Main platform anonymizeRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId 'uPw0ksJM' \
    > test.out 2>&1
eval_tap $? 241 'AnonymizeRevocation' test.out

#- 242 AnonymizeSubscription
./ng net.accelbyte.sdk.cli.Main platform anonymizeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'rEdSORU2' \
    > test.out 2>&1
eval_tap $? 242 'AnonymizeSubscription' test.out

#- 243 AnonymizeWallet
./ng net.accelbyte.sdk.cli.Main platform anonymizeWallet \
    --namespace "$AB_NAMESPACE" \
    --userId 'NmSqmkSB' \
    > test.out 2>&1
eval_tap $? 243 'AnonymizeWallet' test.out

#- 244 GetUserDLCByPlatform
./ng net.accelbyte.sdk.cli.Main platform getUserDLCByPlatform \
    --namespace "$AB_NAMESPACE" \
    --userId 'zktk6CwG' \
    --type 'STEAM' \
    > test.out 2>&1
eval_tap $? 244 'GetUserDLCByPlatform' test.out

#- 245 GetUserDLC
./ng net.accelbyte.sdk.cli.Main platform getUserDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'CZ6lT1wD' \
    --includeAllNamespaces  \
    --status 'REVOKE_FAILED' \
    --type 'OCULUS' \
    > test.out 2>&1
eval_tap $? 245 'GetUserDLC' test.out

#- 246 QueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'wJRgbcFZ' \
    --activeOnly  \
    --appType 'DLC' \
    --collectionId 'l2ek9n7H' \
    --entitlementClazz 'ENTITLEMENT' \
    --entitlementName 'fan2h3E0' \
    --features 'MelScdJB,eHe5ZEAT,B7Ri8zJ1' \
    --fuzzyMatchName  \
    --ignoreActiveDate  \
    --itemId 'xCffZ0H9,ia3OhhdH,KY7idtce' \
    --limit '58' \
    --offset '82' \
    --origin 'Twitch' \
    > test.out 2>&1
eval_tap $? 246 'QueryUserEntitlements' test.out

#- 247 GrantUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform grantUserEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId '80zBJriz' \
    --body '[{"collectionId": "zxC7f55Z", "endDate": "1973-07-20T00:00:00Z", "grantedCode": "sYsZrtqw", "itemId": "2EcXhCIU", "itemNamespace": "fTQGGhIa", "language": "sEWI", "metadata": {"jFjWOruS": {}, "Pq7J7ldl": {}, "8Hn3hXna": {}}, "origin": "Twitch", "quantity": 30, "region": "7rrorZLF", "source": "OTHER", "startDate": "1998-09-08T00:00:00Z", "storeId": "a6exmScx"}, {"collectionId": "vXsrVPsW", "endDate": "1976-12-16T00:00:00Z", "grantedCode": "bC45nHig", "itemId": "csL50jnu", "itemNamespace": "uKP6reL9", "language": "Dt", "metadata": {"LHNo6He4": {}, "FG92wBLG": {}, "2OV0PP3Z": {}}, "origin": "Twitch", "quantity": 31, "region": "ngzjFJGn", "source": "PROMOTION", "startDate": "1973-10-25T00:00:00Z", "storeId": "NZ49E4DR"}, {"collectionId": "t1SstmLl", "endDate": "1994-06-30T00:00:00Z", "grantedCode": "mWVILnFT", "itemId": "Brj50RLS", "itemNamespace": "1GvjpaV6", "language": "oD_QIXq-989", "metadata": {"ZygSlVAv": {}, "QIumGCe2": {}, "AgKPqNWD": {}}, "origin": "System", "quantity": 1, "region": "VbE7EE8x", "source": "PROMOTION", "startDate": "1987-04-05T00:00:00Z", "storeId": "hvqJAA59"}]' \
    > test.out 2>&1
eval_tap $? 247 'GrantUserEntitlement' test.out

#- 248 GetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'JuqNtbHV' \
    --activeOnly  \
    --appId 'A9w7hKcD' \
    > test.out 2>&1
eval_tap $? 248 'GetUserAppEntitlementByAppId' test.out

#- 249 QueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'dA4uS4xa' \
    --activeOnly  \
    --limit '29' \
    --offset '84' \
    --appType 'DEMO' \
    > test.out 2>&1
eval_tap $? 249 'QueryUserEntitlementsByAppType' test.out

#- 250 GetUserEntitlementsByIds
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementsByIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'fdC4LiWn' \
    --ids '4uYPgWil,PI84YwHs,dn1EEZKY' \
    > test.out 2>&1
eval_tap $? 250 'GetUserEntitlementsByIds' test.out

#- 251 GetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'rGTE7jeH' \
    --activeOnly  \
    --entitlementClazz 'ENTITLEMENT' \
    --platform 'k8VqnDdo' \
    --itemId 'na6zMRF4' \
    > test.out 2>&1
eval_tap $? 251 'GetUserEntitlementByItemId' test.out

#- 252 GetUserActiveEntitlementsByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserActiveEntitlementsByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'pwC9U8d6' \
    --ids 'XjuZDC2p,iiYzm6Ad,6c2XWiVv' \
    --platform 'LGiWPD1a' \
    > test.out 2>&1
eval_tap $? 252 'GetUserActiveEntitlementsByItemIds' test.out

#- 253 GetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId '6G39dIdM' \
    --activeOnly  \
    --entitlementClazz 'CODE' \
    --platform 'r4D1e0zq' \
    --sku 'acFKrcQn' \
    > test.out 2>&1
eval_tap $? 253 'GetUserEntitlementBySku' test.out

#- 254 ExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'bY8OfSis' \
    --appIds 'TcNP8iQQ,wt48ZDLl,2Zl698QF' \
    --itemIds 'ps1yNxMB,P2B6zg1j,lRsv7CTL' \
    --platform '5BXmTIrp' \
    --skus '66weJzEJ,srC2P9yp,WmUQ7wWe' \
    > test.out 2>&1
eval_tap $? 254 'ExistsAnyUserActiveEntitlement' test.out

#- 255 ExistsAnyUserActiveEntitlementByItemIds
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlementByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'H9NYdtYD' \
    --platform 'b8x72DNP' \
    --itemIds 'lVcGERQb,v0DizOkJ,EbtAOVzg' \
    > test.out 2>&1
eval_tap $? 255 'ExistsAnyUserActiveEntitlementByItemIds' test.out

#- 256 GetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'oeOHlv7F' \
    --appId 'CQvtyaW2' \
    > test.out 2>&1
eval_tap $? 256 'GetUserAppEntitlementOwnershipByAppId' test.out

#- 257 GetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'vWvdGCF0' \
    --entitlementClazz 'OPTIONBOX' \
    --platform 'GTv5fPOa' \
    --itemId 'SgzQ9X02' \
    > test.out 2>&1
eval_tap $? 257 'GetUserEntitlementOwnershipByItemId' test.out

#- 258 GetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'nGLScnpx' \
    --ids 'uVj9U3Zu,FS2N5x5h,eDZwwdW4' \
    --platform 'SYDDxH9b' \
    > test.out 2>&1
eval_tap $? 258 'GetUserEntitlementOwnershipByItemIds' test.out

#- 259 GetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId '6PhTorBN' \
    --entitlementClazz 'ENTITLEMENT' \
    --platform 'Gvif674G' \
    --sku 'GbmdBPDu' \
    > test.out 2>&1
eval_tap $? 259 'GetUserEntitlementOwnershipBySku' test.out

#- 260 RevokeAllEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeAllEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'T9IL5QHw' \
    > test.out 2>&1
eval_tap $? 260 'RevokeAllEntitlements' test.out

#- 261 RevokeUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'bQkSydhY' \
    --entitlementIds 'rUB0LKWJ' \
    > test.out 2>&1
eval_tap $? 261 'RevokeUserEntitlements' test.out

#- 262 GetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlement \
    --entitlementId 'XjxFtEag' \
    --namespace "$AB_NAMESPACE" \
    --userId 'bVpMqRKE' \
    > test.out 2>&1
eval_tap $? 262 'GetUserEntitlement' test.out

#- 263 UpdateUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform updateUserEntitlement \
    --entitlementId 'Y5UnSLrW' \
    --namespace "$AB_NAMESPACE" \
    --userId 'TvsT4rmR' \
    --body '{"collectionId": "FyNywa0U", "endDate": "1984-06-21T00:00:00Z", "nullFieldList": ["u2zpo0ts", "03tgY2Qa", "hfPIhhyA"], "origin": "Oculus", "reason": "DJE9Z5Ey", "startDate": "1989-02-13T00:00:00Z", "status": "SOLD", "useCount": 40}' \
    > test.out 2>&1
eval_tap $? 263 'UpdateUserEntitlement' test.out

#- 264 ConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform consumeUserEntitlement \
    --entitlementId 'WEEMSN6T' \
    --namespace "$AB_NAMESPACE" \
    --userId 'CZciTcu4' \
    --body '{"metadata": {"TwYYS57v": {}, "coznJNYO": {}, "PpUYV46L": {}}, "options": ["PgvZsqeQ", "5dAzfF1Y", "j9FOynet"], "platform": "TC79sVgR", "requestId": "CD5YkrWE", "useCount": 34}' \
    > test.out 2>&1
eval_tap $? 264 'ConsumeUserEntitlement' test.out

#- 265 DisableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform disableUserEntitlement \
    --entitlementId '8G7gzJ7o' \
    --namespace "$AB_NAMESPACE" \
    --userId 'JsTexOmL' \
    > test.out 2>&1
eval_tap $? 265 'DisableUserEntitlement' test.out

#- 266 EnableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform enableUserEntitlement \
    --entitlementId '6phTKz6S' \
    --namespace "$AB_NAMESPACE" \
    --userId '72boyDln' \
    > test.out 2>&1
eval_tap $? 266 'EnableUserEntitlement' test.out

#- 267 GetUserEntitlementHistories
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementHistories \
    --entitlementId 'gATmGL2D' \
    --namespace "$AB_NAMESPACE" \
    --userId 'cxTd8NMb' \
    > test.out 2>&1
eval_tap $? 267 'GetUserEntitlementHistories' test.out

#- 268 RevokeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlement \
    --entitlementId '3u0khqiH' \
    --namespace "$AB_NAMESPACE" \
    --userId 'vvPPWuKN' \
    --body '{"metadata": {"XWsfAspy": {}, "God5FfKN": {}, "qrKhPg9A": {}}}' \
    > test.out 2>&1
eval_tap $? 268 'RevokeUserEntitlement' test.out

#- 269 RevokeUserEntitlementByUseCount
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlementByUseCount \
    --entitlementId 'CDkPQIWJ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'VCzakK9O' \
    --body '{"reason": "GUSEE2PA", "useCount": 5}' \
    > test.out 2>&1
eval_tap $? 269 'RevokeUserEntitlementByUseCount' test.out

#- 270 PreCheckRevokeUserEntitlementByUseCount
./ng net.accelbyte.sdk.cli.Main platform preCheckRevokeUserEntitlementByUseCount \
    --entitlementId '5CGJfcG7' \
    --namespace "$AB_NAMESPACE" \
    --userId 'b0qCd5O4' \
    --quantity '63' \
    > test.out 2>&1
eval_tap $? 270 'PreCheckRevokeUserEntitlementByUseCount' test.out

#- 271 RevokeUseCount
eval_tap 0 271 'RevokeUseCount # SKIP deprecated' test.out

#- 272 SellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform sellUserEntitlement \
    --entitlementId 'MrtdHURZ' \
    --namespace "$AB_NAMESPACE" \
    --userId '4muce23n' \
    --body '{"platform": "qac9T8ef", "requestId": "x54RHG9L", "useCount": 57}' \
    > test.out 2>&1
eval_tap $? 272 'SellUserEntitlement' test.out

#- 273 FulfillItem
./ng net.accelbyte.sdk.cli.Main platform fulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'qdj5Lc4J' \
    --body '{"duration": 6, "endDate": "1989-12-04T00:00:00Z", "entitlementCollectionId": "nR6PgD9c", "entitlementOrigin": "Steam", "itemId": "U5yJsEHI", "itemSku": "BP5m0VLr", "language": "RTfkmUbH", "metadata": {"0KTQamUR": {}, "ybpmUBhK": {}, "uCoOHf72": {}}, "order": {"currency": {"currencyCode": "TQU89e76", "currencySymbol": "LdNaUEGW", "currencyType": "VIRTUAL", "decimals": 49, "namespace": "BBiyGWvO"}, "ext": {"GzIVdrXM": {}, "Os78W0Al": {}, "Z1YNBBmq": {}}, "free": false}, "orderNo": "exyVsgJe", "origin": "Twitch", "overrideBundleItemQty": {"uG3pA0Ar": 32, "GQBQ2anH": 45, "vlnvHtpc": 96}, "quantity": 88, "region": "O6iYqPpL", "source": "CONSUME_ENTITLEMENT", "startDate": "1998-09-05T00:00:00Z", "storeId": "kACtB2Mw"}' \
    > test.out 2>&1
eval_tap $? 273 'FulfillItem' test.out

#- 274 RedeemCode
./ng net.accelbyte.sdk.cli.Main platform redeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'WTIr0o2h' \
    --body '{"code": "FXHfooH0", "language": "wU_500", "region": "0dW6IHFV"}' \
    > test.out 2>&1
eval_tap $? 274 'RedeemCode' test.out

#- 275 PreCheckFulfillItem
./ng net.accelbyte.sdk.cli.Main platform preCheckFulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'HwrFToEx' \
    --body '{"itemId": "9XAkgVkS", "itemSku": "uEXSXk63", "quantity": 7}' \
    > test.out 2>&1
eval_tap $? 275 'PreCheckFulfillItem' test.out

#- 276 FulfillRewards
./ng net.accelbyte.sdk.cli.Main platform fulfillRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 're6nkqDA' \
    --body '{"entitlementCollectionId": "GTI8A3fi", "entitlementOrigin": "Twitch", "metadata": {"FdH3wZj2": {}, "uIAnElJ6": {}, "JeQ6r4UF": {}}, "origin": "IOS", "rewards": [{"currency": {"currencyCode": "UklNDJan", "namespace": "qyedn0mC"}, "item": {"itemId": "jK6WOaaA", "itemName": "tg1ZKjSg", "itemSku": "lMrV0XbX", "itemType": "rDvJiQ9L"}, "quantity": 99, "type": "ITEM"}, {"currency": {"currencyCode": "osTokUMN", "namespace": "56YEeVJ9"}, "item": {"itemId": "r0KOoiFl", "itemName": "sPmdtdAZ", "itemSku": "8rsMQBhw", "itemType": "vbkHef9w"}, "quantity": 57, "type": "ITEM"}, {"currency": {"currencyCode": "6ddE5qR5", "namespace": "Ta3CJGPZ"}, "item": {"itemId": "2RwYzpjr", "itemName": "1YheZdTP", "itemSku": "R47a1qCy", "itemType": "76TIf8nd"}, "quantity": 31, "type": "ITEM"}], "source": "REDEEM_CODE", "transactionId": "VcTeLi9P"}' \
    > test.out 2>&1
eval_tap $? 276 'FulfillRewards' test.out

#- 277 QueryUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'jllgrHbr' \
    --endTime 'I31RCVGa' \
    --limit '55' \
    --offset '52' \
    --productId 'SO5n68Uv' \
    --startTime 'uq4Bmsf0' \
    --status 'FULFILLED' \
    --type 'STADIA' \
    > test.out 2>&1
eval_tap $? 277 'QueryUserIAPOrders' test.out

#- 278 QueryAllUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryAllUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'ACu0KEtE' \
    > test.out 2>&1
eval_tap $? 278 'QueryAllUserIAPOrders' test.out

#- 279 QueryUserIAPConsumeHistory
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPConsumeHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'kMkmnGkL' \
    --endTime 'aP3mA6CB' \
    --limit '86' \
    --offset '27' \
    --startTime 'mhPSTYuX' \
    --status 'PENDING' \
    --type 'OCULUS' \
    > test.out 2>&1
eval_tap $? 279 'QueryUserIAPConsumeHistory' test.out

#- 280 MockFulfillIAPItem
./ng net.accelbyte.sdk.cli.Main platform mockFulfillIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'oZ8iSUkc' \
    --body '{"itemIdentityType": "ITEM_ID", "language": "XjxR-ktfK", "productId": "FLJHQSvU", "region": "mxycp2kA", "transactionId": "1jEy3wun", "type": "OCULUS"}' \
    > test.out 2>&1
eval_tap $? 280 'MockFulfillIAPItem' test.out

#- 281 QueryUserThirdPartySubscription
./ng net.accelbyte.sdk.cli.Main platform queryUserThirdPartySubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'ybDm8Iv4' \
    --activeOnly  \
    --groupId 'bxdhz7g5' \
    --limit '97' \
    --offset '54' \
    --platform 'STADIA' \
    --productId 'tHwc62SX' \
    > test.out 2>&1
eval_tap $? 281 'QueryUserThirdPartySubscription' test.out

#- 282 GetThirdPartyPlatformSubscriptionOwnershipByGroupId
./ng net.accelbyte.sdk.cli.Main platform getThirdPartyPlatformSubscriptionOwnershipByGroupId \
    --namespace "$AB_NAMESPACE" \
    --platform 'TWITCH' \
    --userId 'SlIHfwfu' \
    --groupId 'KueErjWW' \
    > test.out 2>&1
eval_tap $? 282 'GetThirdPartyPlatformSubscriptionOwnershipByGroupId' test.out

#- 283 GetThirdPartyPlatformSubscriptionOwnershipByProductId
./ng net.accelbyte.sdk.cli.Main platform getThirdPartyPlatformSubscriptionOwnershipByProductId \
    --namespace "$AB_NAMESPACE" \
    --platform 'OCULUS' \
    --userId 'RlsoMY8W' \
    --productId 'NAfjptuI' \
    > test.out 2>&1
eval_tap $? 283 'GetThirdPartyPlatformSubscriptionOwnershipByProductId' test.out

#- 284 QueryUserThirdPartySubscriptionTransactions
./ng net.accelbyte.sdk.cli.Main platform queryUserThirdPartySubscriptionTransactions \
    --namespace "$AB_NAMESPACE" \
    --userId 'zVY35gjH' \
    --activeOnly  \
    --groupId '7YDBuZGE' \
    --limit '93' \
    --offset '34' \
    --platform 'XBOX' \
    --productId 'kQC0qqGV' \
    > test.out 2>&1
eval_tap $? 284 'QueryUserThirdPartySubscriptionTransactions' test.out

#- 285 GetThirdPartySubscriptionDetails
./ng net.accelbyte.sdk.cli.Main platform getThirdPartySubscriptionDetails \
    --id '3bElS4Rx' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Me7tDppm' \
    > test.out 2>&1
eval_tap $? 285 'GetThirdPartySubscriptionDetails' test.out

#- 286 GetSubscriptionHistory
./ng net.accelbyte.sdk.cli.Main platform getSubscriptionHistory \
    --id 'IejyxcS6' \
    --namespace "$AB_NAMESPACE" \
    --userId 'fd42iZDg' \
    --limit '44' \
    --offset '74' \
    > test.out 2>&1
eval_tap $? 286 'GetSubscriptionHistory' test.out

#- 287 SyncSubscriptionTransaction
./ng net.accelbyte.sdk.cli.Main platform syncSubscriptionTransaction \
    --id 'b152G6S2' \
    --namespace "$AB_NAMESPACE" \
    --userId 'uHOzOdiS' \
    > test.out 2>&1
eval_tap $? 287 'SyncSubscriptionTransaction' test.out

#- 288 GetThirdPartyUserSubscriptionDetails
./ng net.accelbyte.sdk.cli.Main platform getThirdPartyUserSubscriptionDetails \
    --id 'UiWiqAla' \
    --namespace "$AB_NAMESPACE" \
    --userId 'I4VeWJNe' \
    > test.out 2>&1
eval_tap $? 288 'GetThirdPartyUserSubscriptionDetails' test.out

#- 289 SyncSubscription
./ng net.accelbyte.sdk.cli.Main platform syncSubscription \
    --id 'Rm2hJ87S' \
    --namespace "$AB_NAMESPACE" \
    --userId 'FGjBgMrN' \
    > test.out 2>&1
eval_tap $? 289 'SyncSubscription' test.out

#- 290 QueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'zDsoePyu' \
    --discounted  \
    --itemId 'myAXZZGs' \
    --limit '71' \
    --offset '97' \
    --status 'CLOSED' \
    > test.out 2>&1
eval_tap $? 290 'QueryUserOrders' test.out

#- 291 AdminCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform adminCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'UOXhUkSv' \
    --body '{"currencyCode": "AdfIccYF", "currencyNamespace": "4rJX9Ebo", "discountCodes": ["OcwonSbw", "ltXyzj20", "gEwbw1PO"], "discountedPrice": 70, "entitlementPlatform": "Epic", "ext": {"p8K1RSPZ": {}, "Y0SJyJ8c": {}, "7nS4ZFAC": {}}, "itemId": "zPBvvfnu", "language": "1XXNtZkb", "options": {"skipPriceValidation": false}, "platform": "IOS", "price": 47, "quantity": 99, "region": "G4YV8CyC", "returnUrl": "kPFlE4Op", "sandbox": true, "sectionId": "JBjKWqoj"}' \
    > test.out 2>&1
eval_tap $? 291 'AdminCreateUserOrder' test.out

#- 292 CountOfPurchasedItem
./ng net.accelbyte.sdk.cli.Main platform countOfPurchasedItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'OEQS1JjG' \
    --itemId 'o1OIBOwT' \
    > test.out 2>&1
eval_tap $? 292 'CountOfPurchasedItem' test.out

#- 293 GetUserOrder
./ng net.accelbyte.sdk.cli.Main platform getUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'D6LxP5os' \
    --userId 'toNHfa8c' \
    > test.out 2>&1
eval_tap $? 293 'GetUserOrder' test.out

#- 294 UpdateUserOrderStatus
./ng net.accelbyte.sdk.cli.Main platform updateUserOrderStatus \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'myuuTgNT' \
    --userId 'HhUanw4h' \
    --body '{"status": "CHARGEBACK_REVERSED", "statusReason": "yotO9afx"}' \
    > test.out 2>&1
eval_tap $? 294 'UpdateUserOrderStatus' test.out

#- 295 FulfillUserOrder
./ng net.accelbyte.sdk.cli.Main platform fulfillUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'WwxN8NLX' \
    --userId 'fzD9BELi' \
    > test.out 2>&1
eval_tap $? 295 'FulfillUserOrder' test.out

#- 296 GetUserOrderGrant
eval_tap 0 296 'GetUserOrderGrant # SKIP deprecated' test.out

#- 297 GetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform getUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'neHiUIom' \
    --userId '62b34MQi' \
    > test.out 2>&1
eval_tap $? 297 'GetUserOrderHistories' test.out

#- 298 ProcessUserOrderNotification
./ng net.accelbyte.sdk.cli.Main platform processUserOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'xNFUudbA' \
    --userId 'JKoT07OO' \
    --body '{"additionalData": {"cardSummary": "Gf8lrm5T"}, "authorisedTime": "1977-07-08T00:00:00Z", "chargebackReversedTime": "1985-09-25T00:00:00Z", "chargebackTime": "1975-01-10T00:00:00Z", "chargedTime": "1984-07-03T00:00:00Z", "createdTime": "1992-04-27T00:00:00Z", "currency": {"currencyCode": "uPO03sBL", "currencySymbol": "8oHH9ryK", "currencyType": "VIRTUAL", "decimals": 91, "namespace": "fJwwFdeq"}, "customParameters": {"yIq3NJPf": {}, "8rfNXRrN": {}, "78Fz5peB": {}}, "extOrderNo": "PvTCwzKJ", "extTxId": "OM97Z4cE", "extUserId": "OGVwQtjW", "issuedAt": "1987-05-30T00:00:00Z", "metadata": {"VMOViNeP": "gC2cBkBD", "TmIASJz1": "FU11CncE", "ruC4fImJ": "OiLlz7ja"}, "namespace": "RkK9ZC9r", "nonceStr": "RGRxNI9k", "paymentData": {"discountAmount": 28, "discountCode": "tQojXg9B", "subtotalPrice": 25, "tax": 76, "totalPrice": 74}, "paymentMethod": "1jb1rkxf", "paymentMethodFee": 44, "paymentOrderNo": "1ZKbne9d", "paymentProvider": "WALLET", "paymentProviderFee": 51, "paymentStationUrl": "7CY86c0z", "price": 12, "refundedTime": "1998-06-18T00:00:00Z", "salesTax": 95, "sandbox": false, "sku": "qQkNm7XT", "status": "CHARGE_FAILED", "statusReason": "wmOruaNW", "subscriptionId": "6IXuAtWk", "subtotalPrice": 43, "targetNamespace": "udbEE5Ob", "targetUserId": "KFygFEAm", "tax": 91, "totalPrice": 97, "totalTax": 24, "txEndTime": "1988-05-23T00:00:00Z", "type": "OKC5P8Ds", "userId": "Y5GZdsF5", "vat": 15}' \
    > test.out 2>&1
eval_tap $? 298 'ProcessUserOrderNotification' test.out

#- 299 DownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform downloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'RjeWQpMg' \
    --userId '8muQAnHU' \
    > test.out 2>&1
eval_tap $? 299 'DownloadUserOrderReceipt' test.out

#- 300 CreateUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform createUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --userId '1ZMoJ3um' \
    --body '{"currencyCode": "8TmO4q6D", "currencyNamespace": "vJYKjDWo", "customParameters": {"Kv2znywK": {}, "XxRwqXa9": {}, "ppx6yZz6": {}}, "description": "vqYf341F", "extOrderNo": "oCMvdAlX", "extUserId": "wCjF1yPw", "itemType": "LOOTBOX", "language": "NcDH-045", "metadata": {"s5R74mJq": "jDX55xNi", "qqGDipgu": "OGVBvyqL", "aatopPC3": "d4k992IK"}, "notifyUrl": "F7SB5xPY", "omitNotification": true, "platform": "KaLhBbDU", "price": 78, "recurringPaymentOrderNo": "xejfTg0T", "region": "w2JsqHJL", "returnUrl": "3LES4fUY", "sandbox": false, "sku": "WqpMr3Mp", "subscriptionId": "1Tvgs17K", "title": "fPCQWkZn"}' \
    > test.out 2>&1
eval_tap $? 300 'CreateUserPaymentOrder' test.out

#- 301 RefundUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform refundUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'AF8bn5Sm' \
    --userId '8Y2tUGPC' \
    --body '{"description": "jUyqoWvx"}' \
    > test.out 2>&1
eval_tap $? 301 'RefundUserPaymentOrder' test.out

#- 302 GetUserPlatformAccountClosureHistories
./ng net.accelbyte.sdk.cli.Main platform getUserPlatformAccountClosureHistories \
    --namespace "$AB_NAMESPACE" \
    --userId 'UxWROeiQ' \
    > test.out 2>&1
eval_tap $? 302 'GetUserPlatformAccountClosureHistories' test.out

#- 303 ApplyUserRedemption
./ng net.accelbyte.sdk.cli.Main platform applyUserRedemption \
    --namespace "$AB_NAMESPACE" \
    --userId '0LfSjTOm' \
    --body '{"code": "PbWpysoR", "orderNo": "WSSKRpK4"}' \
    > test.out 2>&1
eval_tap $? 303 'ApplyUserRedemption' test.out

#- 304 DoRevocation
./ng net.accelbyte.sdk.cli.Main platform doRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId 'qKVPEDOR' \
    --body '{"meta": {"ttxrETDf": {}, "92dhXVih": {}, "QJE2VpkU": {}}, "reason": "TqwXqGmZ", "requestId": "r3gLHCj5", "revokeEntries": [{"currency": {"balanceOrigin": "IOS", "currencyCode": "k3U0Qyo9", "namespace": "4GZy3SLE"}, "entitlement": {"entitlementId": "XfGadhzG"}, "item": {"entitlementOrigin": "Oculus", "itemIdentity": "VnfXryFL", "itemIdentityType": "ITEM_SKU", "origin": "Playstation"}, "quantity": 53, "type": "CURRENCY"}, {"currency": {"balanceOrigin": "Xbox", "currencyCode": "bx89DOpt", "namespace": "ip1dUAeY"}, "entitlement": {"entitlementId": "WaNPBHX2"}, "item": {"entitlementOrigin": "Nintendo", "itemIdentity": "37O0EPiw", "itemIdentityType": "ITEM_SKU", "origin": "Epic"}, "quantity": 51, "type": "ENTITLEMENT"}, {"currency": {"balanceOrigin": "Other", "currencyCode": "o9PYos05", "namespace": "uAaLR7Jk"}, "entitlement": {"entitlementId": "K7R0eTX0"}, "item": {"entitlementOrigin": "Oculus", "itemIdentity": "nEsSPlwo", "itemIdentityType": "ITEM_ID", "origin": "Nintendo"}, "quantity": 43, "type": "ITEM"}], "source": "OTHER", "transactionId": "aRYJkbFb"}' \
    > test.out 2>&1
eval_tap $? 304 'DoRevocation' test.out

#- 305 RegisterXblSessions
./ng net.accelbyte.sdk.cli.Main platform registerXblSessions \
    --namespace "$AB_NAMESPACE" \
    --userId 'yVoEgUnn' \
    --body '{"gameSessionId": "wZAio9Et", "payload": {"V3hucHKz": {}, "gzNZ61Jx": {}, "xCeGmIgz": {}}, "scid": "75QYsLif", "sessionTemplateName": "ww2h6eQc"}' \
    > test.out 2>&1
eval_tap $? 305 'RegisterXblSessions' test.out

#- 306 QueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform queryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'qO9XwjDt' \
    --chargeStatus 'RECURRING_CHARGING' \
    --itemId '44VCiBG5' \
    --limit '25' \
    --offset '59' \
    --sku 'A5ZNUvzY' \
    --status 'EXPIRED' \
    --subscribedBy 'USER' \
    > test.out 2>&1
eval_tap $? 306 'QueryUserSubscriptions' test.out

#- 307 GetUserSubscriptionActivities
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionActivities \
    --namespace "$AB_NAMESPACE" \
    --userId '8Yvgm8Uz' \
    --excludeSystem  \
    --limit '61' \
    --offset '66' \
    --subscriptionId '4oQpeM54' \
    > test.out 2>&1
eval_tap $? 307 'GetUserSubscriptionActivities' test.out

#- 308 PlatformSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform platformSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'qH2rWNEM' \
    --body '{"grantDays": 4, "itemId": "sjspHSOP", "language": "1sv8ouNE", "reason": "E8d3V9j4", "region": "38XwnDrP", "source": "vmP1Zy24"}' \
    > test.out 2>&1
eval_tap $? 308 'PlatformSubscribeSubscription' test.out

#- 309 CheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform checkUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'oBcuq6DG' \
    --itemId 'T0WPUrTY' \
    > test.out 2>&1
eval_tap $? 309 'CheckUserSubscriptionSubscribableByItemId' test.out

#- 310 GetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform getUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'Y7rIycrR' \
    --userId 'lEuYP5D1' \
    > test.out 2>&1
eval_tap $? 310 'GetUserSubscription' test.out

#- 311 DeleteUserSubscription
./ng net.accelbyte.sdk.cli.Main platform deleteUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'BAO5XLss' \
    --userId 'dtpQ00Nw' \
    > test.out 2>&1
eval_tap $? 311 'DeleteUserSubscription' test.out

#- 312 CancelSubscription
./ng net.accelbyte.sdk.cli.Main platform cancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'Eh2AFOQw' \
    --userId 'YWYMYUgX' \
    --force  \
    --body '{"immediate": true, "reason": "PfRUsgLO"}' \
    > test.out 2>&1
eval_tap $? 312 'CancelSubscription' test.out

#- 313 GrantDaysToSubscription
./ng net.accelbyte.sdk.cli.Main platform grantDaysToSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'rNf41oyc' \
    --userId 'NarNgmLi' \
    --body '{"grantDays": 92, "reason": "FaF9DhT0"}' \
    > test.out 2>&1
eval_tap $? 313 'GrantDaysToSubscription' test.out

#- 314 GetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'nzSk9cEY' \
    --userId 'p5WbfJJH' \
    --excludeFree  \
    --limit '12' \
    --offset '24' \
    > test.out 2>&1
eval_tap $? 314 'GetUserSubscriptionBillingHistories' test.out

#- 315 ProcessUserSubscriptionNotification
./ng net.accelbyte.sdk.cli.Main platform processUserSubscriptionNotification \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'KT80Zckm' \
    --userId 'Y6snM8qz' \
    --body '{"additionalData": {"cardSummary": "VadBKSBE"}, "authorisedTime": "1985-04-20T00:00:00Z", "chargebackReversedTime": "1980-02-14T00:00:00Z", "chargebackTime": "1998-07-31T00:00:00Z", "chargedTime": "1983-05-14T00:00:00Z", "createdTime": "1982-07-31T00:00:00Z", "currency": {"currencyCode": "YC1jWRSU", "currencySymbol": "84XUv8xz", "currencyType": "VIRTUAL", "decimals": 80, "namespace": "LY2ywnaC"}, "customParameters": {"k6x6UXeD": {}, "7Hn3s21p": {}, "TGF8wXxJ": {}}, "extOrderNo": "RqFo69gI", "extTxId": "1BPOG91q", "extUserId": "EYJrMUKt", "issuedAt": "1971-03-21T00:00:00Z", "metadata": {"N8EFYLL5": "K2QxaMvT", "nSLjXzQR": "f5odvSli", "78KCYTZL": "MvOFuIbi"}, "namespace": "tbUj9ouk", "nonceStr": "6qPmBgSw", "paymentData": {"discountAmount": 59, "discountCode": "l8JAM3YA", "subtotalPrice": 32, "tax": 100, "totalPrice": 42}, "paymentMethod": "aklQk7sQ", "paymentMethodFee": 43, "paymentOrderNo": "m5bJm7Uj", "paymentProvider": "CHECKOUT", "paymentProviderFee": 19, "paymentStationUrl": "kJSbZrVS", "price": 78, "refundedTime": "1997-10-27T00:00:00Z", "salesTax": 50, "sandbox": false, "sku": "vHcuPv9O", "status": "CHARGED", "statusReason": "zz6QBQOd", "subscriptionId": "8grBt6ZT", "subtotalPrice": 72, "targetNamespace": "eeuHsw5y", "targetUserId": "GzP0kYTW", "tax": 56, "totalPrice": 72, "totalTax": 55, "txEndTime": "1978-03-22T00:00:00Z", "type": "Opldoa3t", "userId": "oMjtOis9", "vat": 8}' \
    > test.out 2>&1
eval_tap $? 315 'ProcessUserSubscriptionNotification' test.out

#- 316 AcquireUserTicket
./ng net.accelbyte.sdk.cli.Main platform acquireUserTicket \
    --boothName '8lIWqFix' \
    --namespace "$AB_NAMESPACE" \
    --userId 'eTnGMh6r' \
    --body '{"count": 7, "orderNo": "bQGOp1h5"}' \
    > test.out 2>&1
eval_tap $? 316 'AcquireUserTicket' test.out

#- 317 QueryUserCurrencyWallets
./ng net.accelbyte.sdk.cli.Main platform queryUserCurrencyWallets \
    --namespace "$AB_NAMESPACE" \
    --userId '5liZykMS' \
    > test.out 2>&1
eval_tap $? 317 'QueryUserCurrencyWallets' test.out

#- 318 DebitUserWalletByCurrencyCode
./ng net.accelbyte.sdk.cli.Main platform debitUserWalletByCurrencyCode \
    --currencyCode 'o1BY7IkR' \
    --namespace "$AB_NAMESPACE" \
    --userId 'snfhYSGD' \
    --body '{"allowOverdraft": true, "amount": 53, "balanceOrigin": "Twitch", "balanceSource": "DLC_REVOCATION", "metadata": {"vNH5OSyh": {}, "mVhAPgWn": {}, "Km8VLN5b": {}}, "reason": "dgG1X87q"}' \
    > test.out 2>&1
eval_tap $? 318 'DebitUserWalletByCurrencyCode' test.out

#- 319 ListUserCurrencyTransactions
./ng net.accelbyte.sdk.cli.Main platform listUserCurrencyTransactions \
    --currencyCode 'BiyF7vox' \
    --namespace "$AB_NAMESPACE" \
    --userId 'b40kbllL' \
    --limit '21' \
    --offset '17' \
    > test.out 2>&1
eval_tap $? 319 'ListUserCurrencyTransactions' test.out

#- 320 CheckBalance
./ng net.accelbyte.sdk.cli.Main platform checkBalance \
    --currencyCode 'vHKI8tyT' \
    --namespace "$AB_NAMESPACE" \
    --userId 'UVQy9Lw1' \
    --request '{"amount": 55, "debitBalanceSource": "IAP_REVOCATION", "metadata": {"fSvk8xUS": {}, "cgLhpxTF": {}, "sAQbIoUt": {}}, "reason": "z1Hoi8cL", "walletPlatform": "Nintendo"}' \
    > test.out 2>&1
eval_tap $? 320 'CheckBalance' test.out

#- 321 CheckWallet
eval_tap 0 321 'CheckWallet # SKIP deprecated' test.out

#- 322 CreditUserWallet
./ng net.accelbyte.sdk.cli.Main platform creditUserWallet \
    --currencyCode 'eb7g6PqL' \
    --namespace "$AB_NAMESPACE" \
    --userId 'LGjbfAuQ' \
    --body '{"amount": 4, "expireAt": "1972-12-16T00:00:00Z", "metadata": {"XMEWmyUz": {}, "VzB9szWO": {}, "5RicRInm": {}}, "origin": "IOS", "reason": "BanSFfSe", "source": "ACHIEVEMENT"}' \
    > test.out 2>&1
eval_tap $? 322 'CreditUserWallet' test.out

#- 323 DebitByWalletPlatform
./ng net.accelbyte.sdk.cli.Main platform debitByWalletPlatform \
    --currencyCode 'siHkDboU' \
    --namespace "$AB_NAMESPACE" \
    --userId 'TASOnFdK' \
    --request '{"amount": 54, "debitBalanceSource": "TRADE", "metadata": {"lNUWAexo": {}, "ru9g5RZf": {}, "uyltukpE": {}}, "reason": "quxmoLzA", "walletPlatform": "GooglePlay"}' \
    > test.out 2>&1
eval_tap $? 323 'DebitByWalletPlatform' test.out

#- 324 PayWithUserWallet
./ng net.accelbyte.sdk.cli.Main platform payWithUserWallet \
    --currencyCode 'CBfYoqkR' \
    --namespace "$AB_NAMESPACE" \
    --userId 'mrrRhys8' \
    --body '{"amount": 21, "metadata": {"kyPG457P": {}, "faZFa3Sj": {}, "Plm5pTCn": {}}, "walletPlatform": "Oculus"}' \
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
    --storeId '7oFKlthG' \
    > test.out 2>&1
eval_tap $? 330 'ListViews' test.out

#- 331 CreateView
./ng net.accelbyte.sdk.cli.Main platform createView \
    --namespace "$AB_NAMESPACE" \
    --storeId 'bMbsIIpB' \
    --body '{"displayOrder": 42, "localizations": {"Q5K6mSOp": {"description": "GcZGUze8", "localExt": {"C0f5yUlX": {}, "SjacYKsu": {}, "GJt4alHa": {}}, "longDescription": "WV3kA7ul", "title": "iL8N50TC"}, "31XefmjY": {"description": "LwIQ9F44", "localExt": {"QDJyOdAG": {}, "u7TOiyqj": {}, "e9pmMPzT": {}}, "longDescription": "cnWzqQyv", "title": "VpmjYd7F"}, "2vg4LgJj": {"description": "Lg5m4Dmw", "localExt": {"sgWKtBFO": {}, "eirSkEHL": {}, "oe5Usgog": {}}, "longDescription": "QSeg83cy", "title": "UJLBtKrv"}}, "name": "3g2ZuTHF"}' \
    > test.out 2>&1
eval_tap $? 331 'CreateView' test.out

#- 332 GetView
./ng net.accelbyte.sdk.cli.Main platform getView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'WVliQ9Ir' \
    --storeId 'jjwV0QC4' \
    > test.out 2>&1
eval_tap $? 332 'GetView' test.out

#- 333 UpdateView
./ng net.accelbyte.sdk.cli.Main platform updateView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'SBojfbKS' \
    --storeId 'WRtRZpfo' \
    --body '{"displayOrder": 50, "localizations": {"2rIm8qdb": {"description": "7hmaneQP", "localExt": {"DifSICvw": {}, "CPVxA2Tz": {}, "BBzgdG8M": {}}, "longDescription": "iMj1BdIN", "title": "VTlQIetz"}, "36HY5jJb": {"description": "T7FV6yB7", "localExt": {"a9pwzsrm": {}, "c3HPJdX7": {}, "UF8EVlkN": {}}, "longDescription": "bg7JXZNa", "title": "yR0BGsIv"}, "j5mclfBy": {"description": "qka4mql8", "localExt": {"I8U8U60N": {}, "2zUaRtkg": {}, "AqaE9l7k": {}}, "longDescription": "11H2yY76", "title": "H7EwSoms"}}, "name": "qCDGxpfl"}' \
    > test.out 2>&1
eval_tap $? 333 'UpdateView' test.out

#- 334 DeleteView
./ng net.accelbyte.sdk.cli.Main platform deleteView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'XXyve6rv' \
    --storeId 'XQ3vRehd' \
    > test.out 2>&1
eval_tap $? 334 'DeleteView' test.out

#- 335 GetWalletConfig
./ng net.accelbyte.sdk.cli.Main platform getWalletConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 335 'GetWalletConfig' test.out

#- 336 UpdateWalletConfig
./ng net.accelbyte.sdk.cli.Main platform updateWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"enablePaidForVCExpiration": true}' \
    > test.out 2>&1
eval_tap $? 336 'UpdateWalletConfig' test.out

#- 337 QueryWallets
eval_tap 0 337 'QueryWallets # SKIP deprecated' test.out

#- 338 BulkCredit
./ng net.accelbyte.sdk.cli.Main platform bulkCredit \
    --namespace "$AB_NAMESPACE" \
    --body '[{"creditRequest": {"amount": 97, "expireAt": "1979-09-22T00:00:00Z", "metadata": {"M0RcA2Hb": {}, "swVLnwTT": {}, "zzO1ETXH": {}}, "origin": "Steam", "reason": "XksRLNWx", "source": "OTHER"}, "currencyCode": "K2g7igtF", "userIds": ["VFPG5i1Z", "v3dc4MeB", "DCBOTAtT"]}, {"creditRequest": {"amount": 46, "expireAt": "1981-04-08T00:00:00Z", "metadata": {"mWRGIId7": {}, "9owpBjSJ": {}, "oylVRo9T": {}}, "origin": "Steam", "reason": "C7M8KGBV", "source": "DLC"}, "currencyCode": "ump8kkl3", "userIds": ["XG6oa78S", "567p9l4o", "sKYXxUoL"]}, {"creditRequest": {"amount": 75, "expireAt": "1998-09-01T00:00:00Z", "metadata": {"6rh26SXI": {}, "z6wJNLjY": {}, "dRm3rNfY": {}}, "origin": "System", "reason": "qweg8ooD", "source": "PROMOTION"}, "currencyCode": "cOCFnTV2", "userIds": ["OamYxwA6", "hVkhxEe1", "OQjRp9tM"]}]' \
    > test.out 2>&1
eval_tap $? 338 'BulkCredit' test.out

#- 339 BulkDebit
./ng net.accelbyte.sdk.cli.Main platform bulkDebit \
    --namespace "$AB_NAMESPACE" \
    --body '[{"currencyCode": "90d0lLmg", "request": {"allowOverdraft": false, "amount": 26, "balanceOrigin": "Oculus", "balanceSource": "TRADE", "metadata": {"K6GwJdY4": {}, "NDNUfmOt": {}, "L1N0sc2h": {}}, "reason": "pFyyXxwq"}, "userIds": ["sgU0ozql", "2vB4pRJN", "Ia1Mh3FI"]}, {"currencyCode": "sMk68vSc", "request": {"allowOverdraft": false, "amount": 64, "balanceOrigin": "Steam", "balanceSource": "PAYMENT", "metadata": {"dMrJVyEu": {}, "SuVQwrlH": {}, "jdMS2wCg": {}}, "reason": "TNYMf6Bj"}, "userIds": ["WgSSc4E2", "25PYTTFr", "hDR4nIEt"]}, {"currencyCode": "xUIFVZc5", "request": {"allowOverdraft": false, "amount": 41, "balanceOrigin": "Xbox", "balanceSource": "EXPIRATION", "metadata": {"WXlMRPg0": {}, "ozdwTt64": {}, "Dop2wmgX": {}}, "reason": "1dfLWSqm"}, "userIds": ["rMIfEczn", "nvEgsPat", "xyYEy6vT"]}]' \
    > test.out 2>&1
eval_tap $? 339 'BulkDebit' test.out

#- 340 GetWallet
eval_tap 0 340 'GetWallet # SKIP deprecated' test.out

#- 341 SyncOrders
./ng net.accelbyte.sdk.cli.Main platform syncOrders \
    --nextEvaluatedKey 'fZtbGjMj' \
    --end 'Z9fzLCNm' \
    --start '8HmlVJF9' \
    > test.out 2>&1
eval_tap $? 341 'SyncOrders' test.out

#- 342 TestAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfig \
    --sandbox  \
    --body '{"allowedPaymentMethods": ["nqZs8Iwx", "h8xtUj8S", "e7KIvUlb"], "apiKey": "g7ZKFOC6", "authoriseAsCapture": true, "blockedPaymentMethods": ["S6tdUnTB", "tYMlLQjp", "78Wt3QKG"], "clientKey": "Rz11Si5W", "dropInSettings": "oBbiBztT", "liveEndpointUrlPrefix": "li6RoVao", "merchantAccount": "o3nqY9wt", "notificationHmacKey": "q7Ugkuiu", "notificationPassword": "3XMbExeE", "notificationUsername": "F3fDApTr", "returnUrl": "ULiYdxSH", "settings": "K2pldESB"}' \
    > test.out 2>&1
eval_tap $? 342 'TestAdyenConfig' test.out

#- 343 TestAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfig \
    --sandbox  \
    --body '{"appId": "Fz7ZH2Ro", "privateKey": "COh2DjW5", "publicKey": "RbZrqfVd", "returnUrl": "7OwRlePU"}' \
    > test.out 2>&1
eval_tap $? 343 'TestAliPayConfig' test.out

#- 344 TestCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfig \
    --sandbox  \
    --body '{"publicKey": "EBVIbsx4", "secretKey": "R4aUrnuq"}' \
    > test.out 2>&1
eval_tap $? 344 'TestCheckoutConfig' test.out

#- 345 DebugMatchedPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentMerchantConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'HupZmNT1' \
    > test.out 2>&1
eval_tap $? 345 'DebugMatchedPaymentMerchantConfig' test.out

#- 346 TestNeonPayConfig
./ng net.accelbyte.sdk.cli.Main platform testNeonPayConfig \
    --sandbox  \
    --body '{"apiKey": "5wcfom1n", "webhookSecretKey": "26VAEypO"}' \
    > test.out 2>&1
eval_tap $? 346 'TestNeonPayConfig' test.out

#- 347 TestPayPalConfig
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfig \
    --sandbox  \
    --body '{"clientID": "5qGAezWg", "clientSecret": "MYdWPfJv", "returnUrl": "CYBX1ONs", "webHookId": "CF7bYTmh"}' \
    > test.out 2>&1
eval_tap $? 347 'TestPayPalConfig' test.out

#- 348 TestStripeConfig
./ng net.accelbyte.sdk.cli.Main platform testStripeConfig \
    --sandbox  \
    --body '{"allowedPaymentMethodTypes": ["Z5vGf1yw", "11VrCCZ4", "mqXHOT16"], "publishableKey": "LBmucrhB", "secretKey": "N9qIC19f", "webhookSecret": "qwW3wsz6"}' \
    > test.out 2>&1
eval_tap $? 348 'TestStripeConfig' test.out

#- 349 TestWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfig \
    --body '{"appId": "j2pULphn", "key": "0RXmMPl2", "mchid": "4kfyx198", "returnUrl": "zQqoWrVj"}' \
    > test.out 2>&1
eval_tap $? 349 'TestWxPayConfig' test.out

#- 350 TestXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfig \
    --body '{"apiKey": "qXK8CBnK", "flowCompletionUrl": "lWqIbkCy", "merchantId": 64, "projectId": 8, "projectSecretKey": "WoGYtEZD"}' \
    > test.out 2>&1
eval_tap $? 350 'TestXsollaConfig' test.out

#- 351 GetPaymentMerchantConfig1
./ng net.accelbyte.sdk.cli.Main platform getPaymentMerchantConfig1 \
    --id 'FhvKb9vb' \
    > test.out 2>&1
eval_tap $? 351 'GetPaymentMerchantConfig1' test.out

#- 352 UpdateAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform updateAdyenConfig \
    --id '446i2qUy' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethods": ["iECqNSzK", "J2awSsbv", "ZJCNkLbZ"], "apiKey": "plQF4n5m", "authoriseAsCapture": true, "blockedPaymentMethods": ["zDmk8ano", "uY888b0n", "pPUCFFTz"], "clientKey": "nfnOEaHk", "dropInSettings": "aJnOgRQm", "liveEndpointUrlPrefix": "SqkWKeQw", "merchantAccount": "8GoodwKh", "notificationHmacKey": "73Tfubfr", "notificationPassword": "iiZMGUgO", "notificationUsername": "aVuXfflD", "returnUrl": "ebGNyhu3", "settings": "1inYdWLH"}' \
    > test.out 2>&1
eval_tap $? 352 'UpdateAdyenConfig' test.out

#- 353 TestAdyenConfigById
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfigById \
    --id 'E5q9bYYl' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 353 'TestAdyenConfigById' test.out

#- 354 UpdateAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateAliPayConfig \
    --id '67MZEEnm' \
    --sandbox  \
    --validate  \
    --body '{"appId": "cz1SxMcy", "privateKey": "xaMgEsnP", "publicKey": "A8ZenpiC", "returnUrl": "UW5sNols"}' \
    > test.out 2>&1
eval_tap $? 354 'UpdateAliPayConfig' test.out

#- 355 TestAliPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfigById \
    --id '7BXHnjeF' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 355 'TestAliPayConfigById' test.out

#- 356 UpdateCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform updateCheckoutConfig \
    --id 'sLCx1hFF' \
    --sandbox  \
    --validate  \
    --body '{"publicKey": "Z1cqxmCX", "secretKey": "QoHOqESF"}' \
    > test.out 2>&1
eval_tap $? 356 'UpdateCheckoutConfig' test.out

#- 357 TestCheckoutConfigById
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfigById \
    --id 'dzbanGfL' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 357 'TestCheckoutConfigById' test.out

#- 358 UpdateNeonPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateNeonPayConfig \
    --id 'UNyK8e4c' \
    --sandbox  \
    --validate  \
    --body '{"apiKey": "fOMYxWKv", "webhookSecretKey": "SBo4ENCD"}' \
    > test.out 2>&1
eval_tap $? 358 'UpdateNeonPayConfig' test.out

#- 359 TestNeonPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testNeonPayConfigById \
    --id 'VSmkYUy0' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 359 'TestNeonPayConfigById' test.out

#- 360 UpdatePayPalConfig
./ng net.accelbyte.sdk.cli.Main platform updatePayPalConfig \
    --id 'LtRd86ny' \
    --sandbox  \
    --validate  \
    --body '{"clientID": "NFmWAW64", "clientSecret": "aDsbnIKH", "returnUrl": "E909vnEJ", "webHookId": "MahHSWa3"}' \
    > test.out 2>&1
eval_tap $? 360 'UpdatePayPalConfig' test.out

#- 361 TestPayPalConfigById
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfigById \
    --id 'okRgrhza' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 361 'TestPayPalConfigById' test.out

#- 362 UpdateStripeConfig
./ng net.accelbyte.sdk.cli.Main platform updateStripeConfig \
    --id 'BLMfGQl7' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethodTypes": ["LKCSICjt", "slLRcnvx", "m0nZdTYx"], "publishableKey": "3BoLbeBM", "secretKey": "DetnK7mb", "webhookSecret": "4EIqhNfK"}' \
    > test.out 2>&1
eval_tap $? 362 'UpdateStripeConfig' test.out

#- 363 TestStripeConfigById
./ng net.accelbyte.sdk.cli.Main platform testStripeConfigById \
    --id 'qU7NAUJe' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 363 'TestStripeConfigById' test.out

#- 364 UpdateWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfig \
    --id 'JNEC64Lt' \
    --validate  \
    --body '{"appId": "OKGTt9Bi", "key": "UzlwtDgD", "mchid": "64RU0edS", "returnUrl": "r9nym72t"}' \
    > test.out 2>&1
eval_tap $? 364 'UpdateWxPayConfig' test.out

#- 365 UpdateWxPayConfigCert
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfigCert \
    --id '5H5KXJ9i' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 365 'UpdateWxPayConfigCert' test.out

#- 366 TestWxPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfigById \
    --id '1d8r9rJ4' \
    > test.out 2>&1
eval_tap $? 366 'TestWxPayConfigById' test.out

#- 367 UpdateXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaConfig \
    --id 'AnZF2mMX' \
    --validate  \
    --body '{"apiKey": "1y6vRNkK", "flowCompletionUrl": "76t2l5Xa", "merchantId": 74, "projectId": 73, "projectSecretKey": "0QpDZ3PK"}' \
    > test.out 2>&1
eval_tap $? 367 'UpdateXsollaConfig' test.out

#- 368 TestXsollaConfigById
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfigById \
    --id 'DGi2O3ZF' \
    > test.out 2>&1
eval_tap $? 368 'TestXsollaConfigById' test.out

#- 369 UpdateXsollaUIConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaUIConfig \
    --id 'yxjDaaT6' \
    --body '{"device": "MOBILE", "showCloseButton": false, "size": "SMALL", "theme": "DEFAULT_DARK"}' \
    > test.out 2>&1
eval_tap $? 369 'UpdateXsollaUIConfig' test.out

#- 370 QueryPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform queryPaymentProviderConfig \
    --limit '82' \
    --namespace "$AB_NAMESPACE" \
    --offset '80' \
    --region 'Zsw3PilC' \
    > test.out 2>&1
eval_tap $? 370 'QueryPaymentProviderConfig' test.out

#- 371 CreatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform createPaymentProviderConfig \
    --body '{"aggregate": "CHECKOUT", "namespace": "xiadbU3d", "region": "XvAJ7xhB", "sandboxTaxJarApiToken": "2VkNjGf0", "specials": ["ADYEN", "ALIPAY", "CHECKOUT"], "taxJarApiToken": "ogh0KNyz", "taxJarEnabled": false, "useGlobalTaxJarApiToken": false}' \
    > test.out 2>&1
eval_tap $? 371 'CreatePaymentProviderConfig' test.out

#- 372 GetAggregatePaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getAggregatePaymentProviders \
    > test.out 2>&1
eval_tap $? 372 'GetAggregatePaymentProviders' test.out

#- 373 DebugMatchedPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentProviderConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'bme9Dcz5' \
    > test.out 2>&1
eval_tap $? 373 'DebugMatchedPaymentProviderConfig' test.out

#- 374 GetSpecialPaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getSpecialPaymentProviders \
    > test.out 2>&1
eval_tap $? 374 'GetSpecialPaymentProviders' test.out

#- 375 UpdatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentProviderConfig \
    --id 'tBcUDBce' \
    --body '{"aggregate": "XSOLLA", "namespace": "gg0UbThC", "region": "XReqgAkW", "sandboxTaxJarApiToken": "Yk08m0a7", "specials": ["CHECKOUT", "PAYPAL", "STRIPE"], "taxJarApiToken": "OX1f8tBO", "taxJarEnabled": true, "useGlobalTaxJarApiToken": false}' \
    > test.out 2>&1
eval_tap $? 375 'UpdatePaymentProviderConfig' test.out

#- 376 DeletePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform deletePaymentProviderConfig \
    --id 'IPy5eN5z' \
    > test.out 2>&1
eval_tap $? 376 'DeletePaymentProviderConfig' test.out

#- 377 GetPaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxConfig \
    > test.out 2>&1
eval_tap $? 377 'GetPaymentTaxConfig' test.out

#- 378 UpdatePaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentTaxConfig \
    --body '{"sandboxTaxJarApiToken": "1oqII2Em", "taxJarApiToken": "SLSseNgG", "taxJarEnabled": true, "taxJarProductCodesMapping": {"FzdxYRfj": "CxdfhWbE", "KZ11VKUD": "XpufbPGf", "9JJi0qyV": "3obtfZOo"}}' \
    > test.out 2>&1
eval_tap $? 378 'UpdatePaymentTaxConfig' test.out

#- 379 SyncPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform syncPaymentOrders \
    --nextEvaluatedKey '2CNsYVxX' \
    --end '5hTjy46y' \
    --start 'wu5nZ0CH' \
    > test.out 2>&1
eval_tap $? 379 'SyncPaymentOrders' test.out

#- 380 PublicGetRootCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetRootCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'mZJ3pnuQ' \
    --storeId 'p4t7Dyqr' \
    > test.out 2>&1
eval_tap $? 380 'PublicGetRootCategories' test.out

#- 381 DownloadCategories
./ng net.accelbyte.sdk.cli.Main platform downloadCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'ho5Ny6cJ' \
    --storeId '0BSQ9ZrL' \
    > test.out 2>&1
eval_tap $? 381 'DownloadCategories' test.out

#- 382 PublicGetCategory
./ng net.accelbyte.sdk.cli.Main platform publicGetCategory \
    --categoryPath '9xaypUXd' \
    --namespace "$AB_NAMESPACE" \
    --language '1RYK1uXa' \
    --storeId 'kW04H0ws' \
    > test.out 2>&1
eval_tap $? 382 'PublicGetCategory' test.out

#- 383 PublicGetChildCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetChildCategories \
    --categoryPath 'V9CyZ25L' \
    --namespace "$AB_NAMESPACE" \
    --language 'yxqUX4Os' \
    --storeId '4nqG0iMQ' \
    > test.out 2>&1
eval_tap $? 383 'PublicGetChildCategories' test.out

#- 384 PublicGetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetDescendantCategories \
    --categoryPath 'szclq1yU' \
    --namespace "$AB_NAMESPACE" \
    --language 'JFRc8Ghi' \
    --storeId 'bbbHU3wp' \
    > test.out 2>&1
eval_tap $? 384 'PublicGetDescendantCategories' test.out

#- 385 PublicListCurrencies
./ng net.accelbyte.sdk.cli.Main platform publicListCurrencies \
    --namespace "$AB_NAMESPACE" \
    --currencyType 'REAL' \
    > test.out 2>&1
eval_tap $? 385 'PublicListCurrencies' test.out

#- 386 GeDLCDurableRewardShortMap
./ng net.accelbyte.sdk.cli.Main platform geDLCDurableRewardShortMap \
    --namespace "$AB_NAMESPACE" \
    --dlcType 'EPICGAMES' \
    > test.out 2>&1
eval_tap $? 386 'GeDLCDurableRewardShortMap' test.out

#- 387 GetAppleConfigVersion
./ng net.accelbyte.sdk.cli.Main platform getAppleConfigVersion \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 387 'GetAppleConfigVersion' test.out

#- 388 GetIAPItemMapping
./ng net.accelbyte.sdk.cli.Main platform getIAPItemMapping \
    --namespace "$AB_NAMESPACE" \
    --platform 'GOOGLE' \
    > test.out 2>&1
eval_tap $? 388 'GetIAPItemMapping' test.out

#- 389 PublicGetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --language 'FJnUDOus' \
    --region 'SC9MWvyW' \
    --storeId '8GfCRrHZ' \
    --appId 'ibmVTC2o' \
    > test.out 2>&1
eval_tap $? 389 'PublicGetItemByAppId' test.out

#- 390 PublicQueryItems
./ng net.accelbyte.sdk.cli.Main platform publicQueryItems \
    --namespace "$AB_NAMESPACE" \
    --appType 'SOFTWARE' \
    --autoCalcEstimatedPrice  \
    --baseAppId 'vxvJFGWv' \
    --categoryPath '1HsJFFHO' \
    --features 'ub7wMgnw' \
    --includeSubCategoryItem  \
    --itemType 'SEASON' \
    --language 'EJC9KbE2' \
    --limit '87' \
    --offset '30' \
    --region 'RMOt9gId' \
    --sortBy 'name:asc,displayOrder' \
    --storeId 'rjXceWZj' \
    --tags 'j7sWnCYn' \
    > test.out 2>&1
eval_tap $? 390 'PublicQueryItems' test.out

#- 391 PublicGetItemBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetItemBySku \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'iXAH4U1j' \
    --region 'AYtOQ3u2' \
    --storeId 'YILYQnSO' \
    --sku 'k8mXBVFP' \
    > test.out 2>&1
eval_tap $? 391 'PublicGetItemBySku' test.out

#- 392 PublicGetEstimatedPrice
./ng net.accelbyte.sdk.cli.Main platform publicGetEstimatedPrice \
    --namespace "$AB_NAMESPACE" \
    --region 'rLeDLRXC' \
    --storeId '5W4ECFI2' \
    --itemIds 'mOEXVfOE' \
    > test.out 2>&1
eval_tap $? 392 'PublicGetEstimatedPrice' test.out

#- 393 PublicBulkGetItems
./ng net.accelbyte.sdk.cli.Main platform publicBulkGetItems \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'Ig4X7znz' \
    --region 'ZonIecPM' \
    --storeId 'HFq3WUgO' \
    --itemIds 'yyyxZbtM' \
    > test.out 2>&1
eval_tap $? 393 'PublicBulkGetItems' test.out

#- 394 PublicValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform publicValidateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --body '{"itemIds": ["llJqUGsu", "OH9RLaX8", "sLMsjwnN"]}' \
    > test.out 2>&1
eval_tap $? 394 'PublicValidateItemPurchaseCondition' test.out

#- 395 PublicSearchItems
./ng net.accelbyte.sdk.cli.Main platform publicSearchItems \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --itemType 'INGAMEITEM' \
    --limit '68' \
    --offset '11' \
    --region 'l7XTIAV9' \
    --storeId 'dXBfjUfN' \
    --keyword 'NBW8EbTd' \
    --language 'tNPTgiVK' \
    > test.out 2>&1
eval_tap $? 395 'PublicSearchItems' test.out

#- 396 PublicGetApp
./ng net.accelbyte.sdk.cli.Main platform publicGetApp \
    --itemId 'zUBiIWY7' \
    --namespace "$AB_NAMESPACE" \
    --language 'bKYmWooD' \
    --region 'NR0MSs57' \
    --storeId 'oRutzohY' \
    > test.out 2>&1
eval_tap $? 396 'PublicGetApp' test.out

#- 397 PublicGetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform publicGetItemDynamicData \
    --itemId 'cUkHEWIV' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 397 'PublicGetItemDynamicData' test.out

#- 398 PublicGetItem
./ng net.accelbyte.sdk.cli.Main platform publicGetItem \
    --itemId 'RRwjd9eO' \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'GHDGYqHx' \
    --populateBundle  \
    --region 'BLDO7LXp' \
    --storeId 'LjweB58w' \
    > test.out 2>&1
eval_tap $? 398 'PublicGetItem' test.out

#- 399 GetPaymentCustomization
eval_tap 0 399 'GetPaymentCustomization # SKIP deprecated' test.out

#- 400 PublicGetPaymentUrl
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentUrl \
    --namespace "$AB_NAMESPACE" \
    --body '{"neonPayConfig": {"cancelUrl": "70KJ5qbh", "successUrl": "3mmoaP4M"}, "paymentOrderNo": "iYpBsykT", "paymentProvider": "XSOLLA", "returnUrl": "0n5GrFRo", "ui": "kyC1WsXu", "zipCode": "WNcypQMw"}' \
    > test.out 2>&1
eval_tap $? 400 'PublicGetPaymentUrl' test.out

#- 401 PublicGetPaymentMethods
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentMethods \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'lqzt0DQQ' \
    > test.out 2>&1
eval_tap $? 401 'PublicGetPaymentMethods' test.out

#- 402 PublicGetUnpaidPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUnpaidPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'AbTkPXYf' \
    > test.out 2>&1
eval_tap $? 402 'PublicGetUnpaidPaymentOrder' test.out

#- 403 Pay
./ng net.accelbyte.sdk.cli.Main platform pay \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'GERiYwzh' \
    --paymentProvider 'ADYEN' \
    --zipCode '2n4ctrUQ' \
    --body '{"token": "jglGp5xO"}' \
    > test.out 2>&1
eval_tap $? 403 'Pay' test.out

#- 404 PublicCheckPaymentOrderPaidStatus
./ng net.accelbyte.sdk.cli.Main platform publicCheckPaymentOrderPaidStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'GUPiLlXv' \
    > test.out 2>&1
eval_tap $? 404 'PublicCheckPaymentOrderPaidStatus' test.out

#- 405 GetPaymentPublicConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentPublicConfig \
    --namespace "$AB_NAMESPACE" \
    --sandbox  \
    --paymentProvider 'NEONPAY' \
    --region 'bpjv4rQB' \
    > test.out 2>&1
eval_tap $? 405 'GetPaymentPublicConfig' test.out

#- 406 PublicGetQRCode
./ng net.accelbyte.sdk.cli.Main platform publicGetQRCode \
    --namespace "$AB_NAMESPACE" \
    --code 'hvmW9fYM' \
    > test.out 2>&1
eval_tap $? 406 'PublicGetQRCode' test.out

#- 407 PublicNormalizePaymentReturnUrl
./ng net.accelbyte.sdk.cli.Main platform publicNormalizePaymentReturnUrl \
    --namespace "$AB_NAMESPACE" \
    --payerID 'ZTdYIbXx' \
    --foreinginvoice '8ETMHj0l' \
    --invoiceId 'vxBRFpWl' \
    --payload '7L5dRzJ0' \
    --redirectResult 'EYkHW5qb' \
    --resultCode 'hmnyrvnn' \
    --sessionId 'MVmXAegJ' \
    --status 'plwBTFVe' \
    --token 'oJN1Lpko' \
    --type 'WFLkObBl' \
    --userId 'B1VF2FTs' \
    --orderNo 'kKr2iGxy' \
    --paymentOrderNo '5v1h1dMk' \
    --paymentProvider 'ALIPAY' \
    --returnUrl 'wmtxddCN' \
    > test.out 2>&1
eval_tap $? 407 'PublicNormalizePaymentReturnUrl' test.out

#- 408 GetPaymentTaxValue
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxValue \
    --namespace "$AB_NAMESPACE" \
    --zipCode 'Gn1mfLUu' \
    --paymentOrderNo 'WHbP1E7H' \
    --paymentProvider 'STRIPE' \
    > test.out 2>&1
eval_tap $? 408 'GetPaymentTaxValue' test.out

#- 409 GetRewardByCode
./ng net.accelbyte.sdk.cli.Main platform getRewardByCode \
    --namespace "$AB_NAMESPACE" \
    --rewardCode 'bFUjFKOL' \
    > test.out 2>&1
eval_tap $? 409 'GetRewardByCode' test.out

#- 410 QueryRewards1
./ng net.accelbyte.sdk.cli.Main platform queryRewards1 \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'Xk4iU4kL' \
    --limit '30' \
    --offset '47' \
    --sortBy 'namespace,namespace:asc,rewardCode:desc' \
    > test.out 2>&1
eval_tap $? 410 'QueryRewards1' test.out

#- 411 GetReward1
./ng net.accelbyte.sdk.cli.Main platform getReward1 \
    --namespace "$AB_NAMESPACE" \
    --rewardId '3yKUrX96' \
    > test.out 2>&1
eval_tap $? 411 'GetReward1' test.out

#- 412 PublicListStores
./ng net.accelbyte.sdk.cli.Main platform publicListStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 412 'PublicListStores' test.out

#- 413 PublicExistsAnyMyActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyMyActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --appIds 'rm7B7IDC,Mwq12EJB,fSKIlavL' \
    --itemIds 'EDgVOxDe,w3ZtYKsQ,mxQd4rdF' \
    --skus 'BaVXpfwt,NPd4vBsR,cjSAzA1B' \
    > test.out 2>&1
eval_tap $? 413 'PublicExistsAnyMyActiveEntitlement' test.out

#- 414 PublicGetMyAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --appId 'QFdnJ5Ra' \
    > test.out 2>&1
eval_tap $? 414 'PublicGetMyAppEntitlementOwnershipByAppId' test.out

#- 415 PublicGetMyEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'LOOTBOX' \
    --itemId 'QEtojSaL' \
    > test.out 2>&1
eval_tap $? 415 'PublicGetMyEntitlementOwnershipByItemId' test.out

#- 416 PublicGetMyEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'SUBSCRIPTION' \
    --sku '0PLOSWJz' \
    > test.out 2>&1
eval_tap $? 416 'PublicGetMyEntitlementOwnershipBySku' test.out

#- 417 PublicGetEntitlementOwnershipToken
./ng net.accelbyte.sdk.cli.Main platform publicGetEntitlementOwnershipToken \
    --namespace "$AB_NAMESPACE" \
    --appIds '15xIR3z4,lg0mqUGb,9oSuf2PI' \
    --itemIds '1BHx6f5E,7naw53Iv,AFaznIVu' \
    --skus 'WfN50UQ0,0j88d97e,4m3jSpfB' \
    > test.out 2>&1
eval_tap $? 417 'PublicGetEntitlementOwnershipToken' test.out

#- 418 SyncTwitchDropsEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement \
    --namespace "$AB_NAMESPACE" \
    --body '{"gameId": "WRlho0ui", "language": "Dzf-SWBa", "region": "V29rqEr1"}' \
    > test.out 2>&1
eval_tap $? 418 'SyncTwitchDropsEntitlement' test.out

#- 419 PublicGetMyWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetMyWallet \
    --currencyCode 'UV6JINQb' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 419 'PublicGetMyWallet' test.out

#- 420 SyncEpicGameDLC
./ng net.accelbyte.sdk.cli.Main platform syncEpicGameDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'gZxl4oS5' \
    --body '{"epicGamesJwtToken": "A2xgKTxO"}' \
    > test.out 2>&1
eval_tap $? 420 'SyncEpicGameDLC' test.out

#- 421 SyncOculusDLC
./ng net.accelbyte.sdk.cli.Main platform syncOculusDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'bWumthkQ' \
    > test.out 2>&1
eval_tap $? 421 'SyncOculusDLC' test.out

#- 422 PublicSyncPsnDlcInventory
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'a03xDVtc' \
    --body '{"serviceLabel": 27}' \
    > test.out 2>&1
eval_tap $? 422 'PublicSyncPsnDlcInventory' test.out

#- 423 PublicSyncPsnDlcInventoryWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventoryWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'WBPw8Ko6' \
    --body '{"serviceLabels": [72, 83, 54]}' \
    > test.out 2>&1
eval_tap $? 423 'PublicSyncPsnDlcInventoryWithMultipleServiceLabels' test.out

#- 424 SyncSteamDLC
./ng net.accelbyte.sdk.cli.Main platform syncSteamDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'BubJp0JJ' \
    --body '{"appId": "oCyofPCo", "steamId": "iGNObDYr"}' \
    > test.out 2>&1
eval_tap $? 424 'SyncSteamDLC' test.out

#- 425 SyncXboxDLC
./ng net.accelbyte.sdk.cli.Main platform syncXboxDLC \
    --namespace "$AB_NAMESPACE" \
    --userId '348FmU7v' \
    --body '{"xstsToken": "bj065kfc"}' \
    > test.out 2>&1
eval_tap $? 425 'SyncXboxDLC' test.out

#- 426 PublicQueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId '7LaMnd34' \
    --appType 'GAME' \
    --entitlementClazz 'SUBSCRIPTION' \
    --entitlementName 'HjiqUdWw' \
    --features 'HU3suCFR,oiqOT0Cx,xCDhHU3K' \
    --itemId 'CDnt9WHU,sH4JKc1B,fB1SqtV7' \
    --limit '2' \
    --offset '51' \
    > test.out 2>&1
eval_tap $? 426 'PublicQueryUserEntitlements' test.out

#- 427 PublicGetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId '2Lz4WLuJ' \
    --appId 'xIZkIPwR' \
    > test.out 2>&1
eval_tap $? 427 'PublicGetUserAppEntitlementByAppId' test.out

#- 428 PublicQueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'IQ6bTOBL' \
    --limit '3' \
    --offset '23' \
    --appType 'GAME' \
    > test.out 2>&1
eval_tap $? 428 'PublicQueryUserEntitlementsByAppType' test.out

#- 429 PublicGetUserEntitlementsByIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementsByIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'CUXhK5wm' \
    --availablePlatformOnly  \
    --ids 'lL4vOrY5,sKuMwomr,iQTPRJ0t' \
    > test.out 2>&1
eval_tap $? 429 'PublicGetUserEntitlementsByIds' test.out

#- 430 PublicGetUserEntitlementByItemId
eval_tap 0 430 'PublicGetUserEntitlementByItemId # SKIP deprecated' test.out

#- 431 PublicGetUserEntitlementBySku
eval_tap 0 431 'PublicGetUserEntitlementBySku # SKIP deprecated' test.out

#- 432 PublicUserEntitlementHistory
./ng net.accelbyte.sdk.cli.Main platform publicUserEntitlementHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'mHLFPSLV' \
    --endDate 'uox11ozb' \
    --entitlementClazz 'LOOTBOX' \
    --limit '97' \
    --offset '85' \
    --startDate 'UsClzs13' \
    > test.out 2>&1
eval_tap $? 432 'PublicUserEntitlementHistory' test.out

#- 433 PublicExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'Cn86XB43' \
    --appIds 'dQRWcJCI,KeN9tNvb,PMtPv1X4' \
    --itemIds 'fKgJV0q8,a0kOpIXb,FD0evMpv' \
    --skus '3K0OHVox,X0gd0J78,ScUfGdfB' \
    > test.out 2>&1
eval_tap $? 433 'PublicExistsAnyUserActiveEntitlement' test.out

#- 434 PublicGetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'hLF6i7VE' \
    --appId 'uvHdbbK4' \
    > test.out 2>&1
eval_tap $? 434 'PublicGetUserAppEntitlementOwnershipByAppId' test.out

#- 435 PublicGetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'CEgYXY8F' \
    --entitlementClazz 'ENTITLEMENT' \
    --itemId 'BFwqQeEg' \
    > test.out 2>&1
eval_tap $? 435 'PublicGetUserEntitlementOwnershipByItemId' test.out

#- 436 PublicGetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'Wy0Aiko3' \
    --ids 'zRcKmA8k,BfgxwLBt,Y0Aaw7W3' \
    > test.out 2>&1
eval_tap $? 436 'PublicGetUserEntitlementOwnershipByItemIds' test.out

#- 437 PublicGetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId '2uylyYLq' \
    --entitlementClazz 'ENTITLEMENT' \
    --sku 'D3bQ6T49' \
    > test.out 2>&1
eval_tap $? 437 'PublicGetUserEntitlementOwnershipBySku' test.out

#- 438 PublicGetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlement \
    --entitlementId 'AuxXl5zY' \
    --namespace "$AB_NAMESPACE" \
    --userId 'RhYH8ty6' \
    > test.out 2>&1
eval_tap $? 438 'PublicGetUserEntitlement' test.out

#- 439 PublicConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicConsumeUserEntitlement \
    --entitlementId 'hAQQrn94' \
    --namespace "$AB_NAMESPACE" \
    --userId 'x36SKxe5' \
    --body '{"metadata": {"operationSource": "INVENTORY"}, "options": ["5fZZNer8", "Q9adb9xT", "Q0amFe8U"], "requestId": "gef2ATds", "useCount": 92}' \
    > test.out 2>&1
eval_tap $? 439 'PublicConsumeUserEntitlement' test.out

#- 440 PublicSellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicSellUserEntitlement \
    --entitlementId 'QQcVViHm' \
    --namespace "$AB_NAMESPACE" \
    --userId 'GWQJigIR' \
    --body '{"requestId": "4WBWVjfv", "useCount": 25}' \
    > test.out 2>&1
eval_tap $? 440 'PublicSellUserEntitlement' test.out

#- 441 PublicSplitUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicSplitUserEntitlement \
    --entitlementId 'dC7BnRo2' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Nz1xKWRn' \
    --body '{"metadata": {"operationSource": "INVENTORY"}, "useCount": 46}' \
    > test.out 2>&1
eval_tap $? 441 'PublicSplitUserEntitlement' test.out

#- 442 PublicTransferUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicTransferUserEntitlement \
    --entitlementId 'JEW2EfXJ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'RZ5xH5Ws' \
    --body '{"entitlementId": "WkqJDfxM", "metadata": {"operationSource": "INVENTORY"}, "useCount": 41}' \
    > test.out 2>&1
eval_tap $? 442 'PublicTransferUserEntitlement' test.out

#- 443 PublicRedeemCode
./ng net.accelbyte.sdk.cli.Main platform publicRedeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'Yl9GCox7' \
    --body '{"code": "X9zjpZKM", "language": "LD_gt", "region": "4vRXi8vG"}' \
    > test.out 2>&1
eval_tap $? 443 'PublicRedeemCode' test.out

#- 444 PublicFulfillAppleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillAppleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId '0adFO55S' \
    --body '{"excludeOldTransactions": false, "language": "Bnw_Qgjv", "productId": "RhDgLESq", "receiptData": "OrJJNwKl", "region": "jvPtUmR3", "transactionId": "yBs9D6pf"}' \
    > test.out 2>&1
eval_tap $? 444 'PublicFulfillAppleIAPItem' test.out

#- 445 SyncEpicGamesInventory
./ng net.accelbyte.sdk.cli.Main platform syncEpicGamesInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'l1RP0pVu' \
    --body '{"epicGamesJwtToken": "ODDulVRE"}' \
    > test.out 2>&1
eval_tap $? 445 'SyncEpicGamesInventory' test.out

#- 446 PublicFulfillGoogleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillGoogleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'WUyyLhak' \
    --body '{"autoAck": true, "autoConsume": false, "language": "By-pdFo", "orderId": "9hDAwlME", "packageName": "laM7Azkk", "productId": "VmOeeD0m", "purchaseTime": 61, "purchaseToken": "i2RAqn7c", "region": "LL2Der45", "subscriptionPurchase": false}' \
    > test.out 2>&1
eval_tap $? 446 'PublicFulfillGoogleIAPItem' test.out

#- 447 SyncOculusConsumableEntitlements
./ng net.accelbyte.sdk.cli.Main platform syncOculusConsumableEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId '7eSSK664' \
    > test.out 2>&1
eval_tap $? 447 'SyncOculusConsumableEntitlements' test.out

#- 448 PublicReconcilePlayStationStore
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStore \
    --namespace "$AB_NAMESPACE" \
    --userId 'JB6lyXXD' \
    --body '{"currencyCode": "hK8jvmxu", "price": 0.4710869163114981, "productId": "y8SLzdIg", "serviceLabel": 42}' \
    > test.out 2>&1
eval_tap $? 448 'PublicReconcilePlayStationStore' test.out

#- 449 PublicReconcilePlayStationStoreWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStoreWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'YIyTCA2S' \
    --body '{"currencyCode": "TnCWzcpX", "price": 0.3789186715038354, "productId": "eUfLDY28", "serviceLabels": [48, 74, 45]}' \
    > test.out 2>&1
eval_tap $? 449 'PublicReconcilePlayStationStoreWithMultipleServiceLabels' test.out

#- 450 SyncSteamInventory
./ng net.accelbyte.sdk.cli.Main platform syncSteamInventory \
    --namespace "$AB_NAMESPACE" \
    --userId '468yzgLP' \
    --body '{"appId": "8rwMaEFw", "currencyCode": "RIEha8E9", "language": "YPv_LR", "price": 0.3582203217654685, "productId": "ggqdhojE", "region": "lRXO0aTH", "steamId": "HribNiXV"}' \
    > test.out 2>&1
eval_tap $? 450 'SyncSteamInventory' test.out

#- 451 PublicQueryUserThirdPartySubscription
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserThirdPartySubscription \
    --namespace "$AB_NAMESPACE" \
    --platform 'OCULUS' \
    --userId '0odmNLtF' \
    --activeOnly  \
    --groupId 'YUw5UtaY' \
    --limit '45' \
    --offset '67' \
    --productId 'UiWVV14T' \
    > test.out 2>&1
eval_tap $? 451 'PublicQueryUserThirdPartySubscription' test.out

#- 452 SyncTwitchDropsEntitlement1
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'kxLtYfCd' \
    --body '{"gameId": "NSpoOuss", "language": "siGL-aRTX-278", "region": "USYrLFEz"}' \
    > test.out 2>&1
eval_tap $? 452 'SyncTwitchDropsEntitlement1' test.out

#- 453 SyncXboxInventory
./ng net.accelbyte.sdk.cli.Main platform syncXboxInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'GI8iTEsc' \
    --body '{"currencyCode": "n3nUixyk", "price": 0.819735942107035, "productId": "pHtSTZEW", "xstsToken": "7Vlv3lcX"}' \
    > test.out 2>&1
eval_tap $? 453 'SyncXboxInventory' test.out

#- 454 PublicQueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'LVzTRfto' \
    --discounted  \
    --itemId 'NgRKvmCJ' \
    --limit '12' \
    --offset '62' \
    --status 'REFUND_FAILED' \
    > test.out 2>&1
eval_tap $? 454 'PublicQueryUserOrders' test.out

#- 455 PublicCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'BBt6k8E6' \
    --body '{"currencyCode": "YYRIGhOc", "discountCodes": ["N2Nt1zss", "Z42E6Liv", "8ilBkRfL"], "discountedPrice": 20, "ext": {"EZ2HgJos": {}, "RMyp7sz7": {}, "a2idXOF4": {}}, "itemId": "LgWDjuXk", "language": "pBy-Eb", "price": 53, "quantity": 63, "region": "rRrP59rL", "returnUrl": "uL4HRtAB", "sectionId": "GVgvZxvW"}' \
    > test.out 2>&1
eval_tap $? 455 'PublicCreateUserOrder' test.out

#- 456 PublicPreviewOrderPrice
./ng net.accelbyte.sdk.cli.Main platform publicPreviewOrderPrice \
    --namespace "$AB_NAMESPACE" \
    --userId 'oss4EcBh' \
    --body '{"currencyCode": "uduAxOAh", "discountCodes": ["yZPSY3Ks", "Dh1X41s1", "0dXaIUCQ"], "discountedPrice": 43, "itemId": "G7SgvznI", "price": 87, "quantity": 38}' \
    > test.out 2>&1
eval_tap $? 456 'PublicPreviewOrderPrice' test.out

#- 457 PublicGetUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'UIVMztnI' \
    --userId 'ZkvITNr4' \
    > test.out 2>&1
eval_tap $? 457 'PublicGetUserOrder' test.out

#- 458 PublicCancelUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCancelUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'wkjDGLYp' \
    --userId 'mHxIdM0P' \
    > test.out 2>&1
eval_tap $? 458 'PublicCancelUserOrder' test.out

#- 459 PublicGetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'REBhZSqv' \
    --userId '9ZWe10B8' \
    > test.out 2>&1
eval_tap $? 459 'PublicGetUserOrderHistories' test.out

#- 460 PublicDownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform publicDownloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'ABmVCSrR' \
    --userId '0srI7AGS' \
    > test.out 2>&1
eval_tap $? 460 'PublicDownloadUserOrderReceipt' test.out

#- 461 PublicGetPaymentAccounts
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'SVVNKP2l' \
    > test.out 2>&1
eval_tap $? 461 'PublicGetPaymentAccounts' test.out

#- 462 PublicDeletePaymentAccount
./ng net.accelbyte.sdk.cli.Main platform publicDeletePaymentAccount \
    --id 'upogBt70' \
    --namespace "$AB_NAMESPACE" \
    --type 'paypal' \
    --userId 'c6r5jN0C' \
    > test.out 2>&1
eval_tap $? 462 'PublicDeletePaymentAccount' test.out

#- 463 PublicListActiveSections
./ng net.accelbyte.sdk.cli.Main platform publicListActiveSections \
    --namespace "$AB_NAMESPACE" \
    --userId 'ViT3VIXW' \
    --autoCalcEstimatedPrice  \
    --language '8Cd5ty0k' \
    --region 'R0kTa2Pf' \
    --storeId 'g3UQOLzw' \
    --viewId 'inf4ejPe' \
    > test.out 2>&1
eval_tap $? 463 'PublicListActiveSections' test.out

#- 464 PublicQueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'GKjVXiW3' \
    --chargeStatus 'RECURRING_CHARGING' \
    --itemId 'Bh6PIFQU' \
    --limit '39' \
    --offset '15' \
    --sku 'W2t3Wp7h' \
    --status 'CANCELLED' \
    --subscribedBy 'PLATFORM' \
    > test.out 2>&1
eval_tap $? 464 'PublicQueryUserSubscriptions' test.out

#- 465 PublicSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform publicSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'nXQhVti1' \
    --body '{"currencyCode": "7tirAQQO", "itemId": "en731SrG", "language": "yAM_MixH", "region": "m5cG7IpB", "returnUrl": "igVOlWR3", "source": "RnAqDwM7"}' \
    > test.out 2>&1
eval_tap $? 465 'PublicSubscribeSubscription' test.out

#- 466 PublicCheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform publicCheckUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'vZMyokAJ' \
    --itemId 'gVL4bvKV' \
    > test.out 2>&1
eval_tap $? 466 'PublicCheckUserSubscriptionSubscribableByItemId' test.out

#- 467 PublicGetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'RV3RO7vw' \
    --userId 'NzlbBHiW' \
    > test.out 2>&1
eval_tap $? 467 'PublicGetUserSubscription' test.out

#- 468 PublicChangeSubscriptionBillingAccount
./ng net.accelbyte.sdk.cli.Main platform publicChangeSubscriptionBillingAccount \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'yxR7vpRG' \
    --userId 'KMC7r8Bt' \
    > test.out 2>&1
eval_tap $? 468 'PublicChangeSubscriptionBillingAccount' test.out

#- 469 PublicCancelSubscription
./ng net.accelbyte.sdk.cli.Main platform publicCancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'QKd3S7SW' \
    --userId 'ZMJyuLYU' \
    --body '{"immediate": false, "reason": "7ntrvbxp"}' \
    > test.out 2>&1
eval_tap $? 469 'PublicCancelSubscription' test.out

#- 470 PublicGetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'OUszROfK' \
    --userId 'QNxKBVQt' \
    --excludeFree  \
    --limit '15' \
    --offset '9' \
    > test.out 2>&1
eval_tap $? 470 'PublicGetUserSubscriptionBillingHistories' test.out

#- 471 PublicListViews
./ng net.accelbyte.sdk.cli.Main platform publicListViews \
    --namespace "$AB_NAMESPACE" \
    --userId 'dh2YJaDt' \
    --language 'ezi4KlFm' \
    --storeId '6BNsQAD3' \
    > test.out 2>&1
eval_tap $? 471 'PublicListViews' test.out

#- 472 PublicGetWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetWallet \
    --currencyCode 'WsNbLrv7' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Kyk9MkDw' \
    > test.out 2>&1
eval_tap $? 472 'PublicGetWallet' test.out

#- 473 PublicListUserWalletTransactions
./ng net.accelbyte.sdk.cli.Main platform publicListUserWalletTransactions \
    --currencyCode 'K0XxGcFm' \
    --namespace "$AB_NAMESPACE" \
    --userId '8X2yQaY4' \
    --limit '87' \
    --offset '35' \
    > test.out 2>&1
eval_tap $? 473 'PublicListUserWalletTransactions' test.out

#- 474 PublicGetMyDLCContent
./ng net.accelbyte.sdk.cli.Main platform publicGetMyDLCContent \
    --includeAllNamespaces  \
    --type 'XBOX' \
    > test.out 2>&1
eval_tap $? 474 'PublicGetMyDLCContent' test.out

#- 475 QueryFulfillments
./ng net.accelbyte.sdk.cli.Main platform queryFulfillments \
    --namespace "$AB_NAMESPACE" \
    --endTime 'BSarYE84' \
    --limit '50' \
    --offset '76' \
    --startTime 'd0jjDzZG' \
    --state 'FULFILL_FAILED' \
    --transactionId 'zCnqcCpi' \
    --userId 'AMGV33bD' \
    > test.out 2>&1
eval_tap $? 475 'QueryFulfillments' test.out

#- 476 QueryItemsV2
./ng net.accelbyte.sdk.cli.Main platform queryItemsV2 \
    --namespace "$AB_NAMESPACE" \
    --appType 'SOFTWARE' \
    --availableDate 'Cv0MK1SS' \
    --baseAppId 'z1iOGAGz' \
    --categoryPath 'gdojNADB' \
    --features 'KRV7Ropr' \
    --includeSubCategoryItem  \
    --itemName 'DF9jSs3K' \
    --itemStatus 'ACTIVE' \
    --itemType 'SUBSCRIPTION,CODE,MEDIA' \
    --limit '8' \
    --offset '75' \
    --region '1BuufFuO' \
    --sectionExclusive  \
    --sortBy 'displayOrder,createdAt,name:desc' \
    --storeId 'PESozRgc' \
    --tags 'z7iVfzYY' \
    --targetNamespace '6iAUEbib' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 476 'QueryItemsV2' test.out

#- 477 ImportStore1
./ng net.accelbyte.sdk.cli.Main platform importStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'NNWTzwpg' \
    --strictMode  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 477 'ImportStore1' test.out

#- 478 ExportStore1
./ng net.accelbyte.sdk.cli.Main platform exportStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Wr0aOFIa' \
    --body '{"itemIds": ["0aoAzaMS", "LtIauJ07", "qmg6XcYf"]}' \
    > test.out 2>&1
eval_tap $? 478 'ExportStore1' test.out

#- 479 FulfillRewardsV2
./ng net.accelbyte.sdk.cli.Main platform fulfillRewardsV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'M8cumDK8' \
    --body '{"entitlementCollectionId": "YqB7wsby", "entitlementOrigin": "Other", "metadata": {"1WQnS5Iw": {}, "bL9yIv6M": {}, "ljcYVsRM": {}}, "origin": "Steam", "rewards": [{"currency": {"currencyCode": "f45GtjDu", "namespace": "08RCWZdD"}, "item": {"itemId": "FLw85naz", "itemName": "ZqhSwWFi", "itemSku": "5SNv0Mg3", "itemType": "q0hKAxEa"}, "quantity": 16, "type": "CURRENCY"}, {"currency": {"currencyCode": "stTIY7f7", "namespace": "QOjtTh8v"}, "item": {"itemId": "w3mynewt", "itemName": "q3IcFlxB", "itemSku": "dXIOFL81", "itemType": "hTMK5nxK"}, "quantity": 11, "type": "CURRENCY"}, {"currency": {"currencyCode": "9MNnUYVz", "namespace": "TeY5wCE6"}, "item": {"itemId": "fpm6nhjq", "itemName": "cRYb7lZA", "itemSku": "KYj2hNsF", "itemType": "IQ25cW3A"}, "quantity": 75, "type": "CURRENCY"}], "source": "GIFT", "transactionId": "9KwDs9b7"}' \
    > test.out 2>&1
eval_tap $? 479 'FulfillRewardsV2' test.out

#- 480 FulfillItems
eval_tap 0 480 'FulfillItems # SKIP deprecated' test.out

#- 481 RetryFulfillItems
eval_tap 0 481 'RetryFulfillItems # SKIP deprecated' test.out

#- 482 RevokeItems
eval_tap 0 482 'RevokeItems # SKIP deprecated' test.out

#- 483 V2PublicFulfillAppleIAPItem
./ng net.accelbyte.sdk.cli.Main platform v2PublicFulfillAppleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'YffNEHpL' \
    --body '{"transactionId": "J43tHFgr"}' \
    > test.out 2>&1
eval_tap $? 483 'V2PublicFulfillAppleIAPItem' test.out

#- 484 FulfillItemsV3
./ng net.accelbyte.sdk.cli.Main platform fulfillItemsV3 \
    --namespace "$AB_NAMESPACE" \
    --transactionId 'KFZxYi89' \
    --userId 'NLMCm73I' \
    --body '{"items": [{"duration": 88, "endDate": "1987-06-18T00:00:00Z", "entitlementCollectionId": "6DHQV7NA", "entitlementOrigin": "GooglePlay", "itemId": "AlNcZVsE", "itemSku": "3592TDNT", "language": "BPiQRxTs", "metadata": {"fiBsYZnT": {}, "PO1LBan2": {}, "WPwBnv0H": {}}, "orderNo": "YH9GUORd", "origin": "Other", "quantity": 55, "region": "KCNApUsZ", "source": "PROMOTION", "startDate": "1993-01-20T00:00:00Z", "storeId": "LB4eknIZ"}, {"duration": 69, "endDate": "1997-09-25T00:00:00Z", "entitlementCollectionId": "JtnklZvy", "entitlementOrigin": "System", "itemId": "MgXRk0IP", "itemSku": "4wSYDr7i", "language": "43R55GRq", "metadata": {"Zumjvt6R": {}, "r3bE9JOP": {}, "o45CPvew": {}}, "orderNo": "rtc7omz7", "origin": "System", "quantity": 23, "region": "xWYYsyOD", "source": "SELL_BACK", "startDate": "1982-09-29T00:00:00Z", "storeId": "LLCGJ190"}, {"duration": 39, "endDate": "1985-12-14T00:00:00Z", "entitlementCollectionId": "CcrlY9oF", "entitlementOrigin": "GooglePlay", "itemId": "cYLXnNix", "itemSku": "AaBSuwKA", "language": "ny8qtEpS", "metadata": {"SpvKDqWU": {}, "u3xc5482": {}, "6gUNzGk2": {}}, "orderNo": "yN1MwS99", "origin": "Nintendo", "quantity": 7, "region": "ZFk1lxvG", "source": "EXPIRATION", "startDate": "1982-12-04T00:00:00Z", "storeId": "zvw03WmK"}]}' \
    > test.out 2>&1
eval_tap $? 484 'FulfillItemsV3' test.out

#- 485 RetryFulfillItemsV3
./ng net.accelbyte.sdk.cli.Main platform retryFulfillItemsV3 \
    --namespace "$AB_NAMESPACE" \
    --transactionId 'lEo5IRC4' \
    --userId 'NWVdLpjR' \
    > test.out 2>&1
eval_tap $? 485 'RetryFulfillItemsV3' test.out

#- 486 RevokeItemsV3
./ng net.accelbyte.sdk.cli.Main platform revokeItemsV3 \
    --namespace "$AB_NAMESPACE" \
    --transactionId 'NXhunEFg' \
    --userId 'fgqfoOJc' \
    > test.out 2>&1
eval_tap $? 486 'RevokeItemsV3' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
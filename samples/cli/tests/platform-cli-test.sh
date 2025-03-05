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
echo "1..497"

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
    --id 'tCQzq9gu' \
    > test.out 2>&1
eval_tap $? 3 'GetFulfillmentScript' test.out

#- 4 CreateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform createFulfillmentScript \
    --id 'wtIXdm4C' \
    --body '{"grantDays": "1n6D5pA8"}' \
    > test.out 2>&1
eval_tap $? 4 'CreateFulfillmentScript' test.out

#- 5 DeleteFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform deleteFulfillmentScript \
    --id 'uJZk6gfP' \
    > test.out 2>&1
eval_tap $? 5 'DeleteFulfillmentScript' test.out

#- 6 UpdateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform updateFulfillmentScript \
    --id 'qeUiaZi9' \
    --body '{"grantDays": "43VNUlwS"}' \
    > test.out 2>&1
eval_tap $? 6 'UpdateFulfillmentScript' test.out

#- 7 ListItemTypeConfigs
./ng net.accelbyte.sdk.cli.Main platform listItemTypeConfigs \
    > test.out 2>&1
eval_tap $? 7 'ListItemTypeConfigs' test.out

#- 8 CreateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform createItemTypeConfig \
    --body '{"clazz": "z559bLUK", "dryRun": true, "fulfillmentUrl": "UHly2kyB", "itemType": "OPTIONBOX", "purchaseConditionUrl": "I4Kiem8y"}' \
    > test.out 2>&1
eval_tap $? 8 'CreateItemTypeConfig' test.out

#- 9 SearchItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform searchItemTypeConfig \
    --clazz 'L9iaGzs5' \
    --itemType 'LOOTBOX' \
    > test.out 2>&1
eval_tap $? 9 'SearchItemTypeConfig' test.out

#- 10 GetItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform getItemTypeConfig \
    --id 'q7ed7cck' \
    > test.out 2>&1
eval_tap $? 10 'GetItemTypeConfig' test.out

#- 11 UpdateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform updateItemTypeConfig \
    --id 'Evy6DNm4' \
    --body '{"clazz": "ZrDAL0B3", "dryRun": false, "fulfillmentUrl": "98vREBeP", "purchaseConditionUrl": "ULkezYul"}' \
    > test.out 2>&1
eval_tap $? 11 'UpdateItemTypeConfig' test.out

#- 12 DeleteItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform deleteItemTypeConfig \
    --id 'izt4cmKM' \
    > test.out 2>&1
eval_tap $? 12 'DeleteItemTypeConfig' test.out

#- 13 QueryCampaigns
./ng net.accelbyte.sdk.cli.Main platform queryCampaigns \
    --namespace "$AB_NAMESPACE" \
    --limit '9' \
    --name 'Iar8Orsk' \
    --offset '6' \
    --tag '0G3s1IHD' \
    > test.out 2>&1
eval_tap $? 13 'QueryCampaigns' test.out

#- 14 CreateCampaign
./ng net.accelbyte.sdk.cli.Main platform createCampaign \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "LmNhVTAW", "discountConfig": {"categories": [{"categoryPath": "LkCKR1JN", "includeSubCategories": true}, {"categoryPath": "FaHOs4aP", "includeSubCategories": true}, {"categoryPath": "4HKZLUvV", "includeSubCategories": true}], "currencyCode": "qaPr2KIb", "currencyNamespace": "hTG6ijBB", "discountAmount": 59, "discountPercentage": 99, "discountType": "AMOUNT", "items": [{"itemId": "qrX5cnUa", "itemName": "QHRyFIx0"}, {"itemId": "ec1SlKW4", "itemName": "9OYfZyuT"}, {"itemId": "sKErS9H6", "itemName": "tO1j7O3j"}], "restrictType": "NONE", "stackable": false}, "items": [{"extraSubscriptionDays": 59, "itemId": "NOQTFUNX", "itemName": "O47JFBxU", "quantity": 4}, {"extraSubscriptionDays": 30, "itemId": "uMVxfwwU", "itemName": "x5Zxwge8", "quantity": 69}, {"extraSubscriptionDays": 44, "itemId": "43zY6skb", "itemName": "DXe980AQ", "quantity": 74}], "maxRedeemCountPerCampaignPerUser": 21, "maxRedeemCountPerCode": 100, "maxRedeemCountPerCodePerUser": 62, "maxSaleCount": 68, "name": "qBhnZkon", "redeemEnd": "1979-10-19T00:00:00Z", "redeemStart": "1975-08-26T00:00:00Z", "redeemType": "DISCOUNT", "status": "INACTIVE", "tags": ["UZnk2aaj", "jpMpKc9L", "9Cg8L2hQ"], "type": "REDEMPTION"}' \
    > test.out 2>&1
eval_tap $? 14 'CreateCampaign' test.out

#- 15 GetCampaign
./ng net.accelbyte.sdk.cli.Main platform getCampaign \
    --campaignId 'q54F9PRR' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'GetCampaign' test.out

#- 16 UpdateCampaign
./ng net.accelbyte.sdk.cli.Main platform updateCampaign \
    --campaignId 'hPxwo4ps' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "fCrWjkX5", "discountConfig": {"categories": [{"categoryPath": "nFy0fRnP", "includeSubCategories": false}, {"categoryPath": "idHQlVld", "includeSubCategories": true}, {"categoryPath": "RC0TglLS", "includeSubCategories": true}], "currencyCode": "Q0mZtyGp", "currencyNamespace": "TTo3Nsau", "discountAmount": 71, "discountPercentage": 61, "discountType": "PERCENTAGE", "items": [{"itemId": "B6iUO7C4", "itemName": "86XpWOO1"}, {"itemId": "hJity3cO", "itemName": "uMQKc4My"}, {"itemId": "50nTXYxC", "itemName": "5nmuVBmV"}], "restrictType": "NONE", "stackable": true}, "items": [{"extraSubscriptionDays": 18, "itemId": "o4Wn8Wjw", "itemName": "pFd00VZu", "quantity": 3}, {"extraSubscriptionDays": 82, "itemId": "X1deER9e", "itemName": "B3U87EWE", "quantity": 96}, {"extraSubscriptionDays": 85, "itemId": "lbtfmNRy", "itemName": "aJK9qnJn", "quantity": 55}], "maxRedeemCountPerCampaignPerUser": 76, "maxRedeemCountPerCode": 30, "maxRedeemCountPerCodePerUser": 81, "maxSaleCount": 86, "name": "Law5E5Tw", "redeemEnd": "1977-08-20T00:00:00Z", "redeemStart": "1982-05-30T00:00:00Z", "redeemType": "DISCOUNT", "status": "INACTIVE", "tags": ["0VnK53Zm", "MjU6gl0G", "WFkTytQN"]}' \
    > test.out 2>&1
eval_tap $? 16 'UpdateCampaign' test.out

#- 17 RenameBatch
./ng net.accelbyte.sdk.cli.Main platform renameBatch \
    --campaignId '1OEk3PZY' \
    --namespace "$AB_NAMESPACE" \
    --body '{"newName": "aIh5rfvw", "oldName": "DfpekYUl"}' \
    > test.out 2>&1
eval_tap $? 17 'RenameBatch' test.out

#- 18 QueryCampaignBatchNames
./ng net.accelbyte.sdk.cli.Main platform queryCampaignBatchNames \
    --campaignId '3rgDNvvL' \
    --namespace "$AB_NAMESPACE" \
    --batchName 'SiCKPgXa' \
    --limit '38' \
    > test.out 2>&1
eval_tap $? 18 'QueryCampaignBatchNames' test.out

#- 19 GetCampaignDynamic
./ng net.accelbyte.sdk.cli.Main platform getCampaignDynamic \
    --campaignId 'nVl5FVEx' \
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
    --body '{"enableInventoryCheck": true, "itemDeletionCheckConfig": ["ENTITLEMENT", "CAMPAIGN", "CATALOG"]}' \
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
    --body '{"appConfig": {"appName": "qMIbvxp6"}, "customConfig": {"connectionType": "INSECURE", "grpcServerAddress": "wQYBIrdf"}, "extendType": "APP"}' \
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
    --body '{"appConfig": {"appName": "WWrpEAxr"}, "customConfig": {"connectionType": "TLS", "grpcServerAddress": "dWKHRFM9"}, "extendType": "CUSTOM"}' \
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
    --storeId 'FzVbVNCc' \
    > test.out 2>&1
eval_tap $? 31 'GetRootCategories' test.out

#- 32 CreateCategory
./ng net.accelbyte.sdk.cli.Main platform createCategory \
    --namespace "$AB_NAMESPACE" \
    --storeId '0LWg98qd' \
    --body '{"categoryPath": "VEJdkdbw", "localizationDisplayNames": {"EExw2rXq": "QEbKw1fG", "pS0T072W": "QafBx4Ux", "joNp7KKF": "31UoIfet"}}' \
    > test.out 2>&1
eval_tap $? 32 'CreateCategory' test.out

#- 33 ListCategoriesBasic
./ng net.accelbyte.sdk.cli.Main platform listCategoriesBasic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'l205i5l7' \
    > test.out 2>&1
eval_tap $? 33 'ListCategoriesBasic' test.out

#- 34 GetCategory
./ng net.accelbyte.sdk.cli.Main platform getCategory \
    --categoryPath 'WbvqDCcG' \
    --namespace "$AB_NAMESPACE" \
    --storeId '5SFibh55' \
    > test.out 2>&1
eval_tap $? 34 'GetCategory' test.out

#- 35 UpdateCategory
./ng net.accelbyte.sdk.cli.Main platform updateCategory \
    --categoryPath 'R8jdUetp' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'FH3bXy4L' \
    --body '{"localizationDisplayNames": {"uQ0pi5Gv": "ghnTxIam", "wXl6JL6T": "1S64CDon", "gRuf53WU": "9ry6WUW3"}}' \
    > test.out 2>&1
eval_tap $? 35 'UpdateCategory' test.out

#- 36 DeleteCategory
./ng net.accelbyte.sdk.cli.Main platform deleteCategory \
    --categoryPath 'vkzwo5ym' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'DxWfKCZF' \
    > test.out 2>&1
eval_tap $? 36 'DeleteCategory' test.out

#- 37 GetChildCategories
./ng net.accelbyte.sdk.cli.Main platform getChildCategories \
    --categoryPath 'hC4RqltA' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'MOmbWUIs' \
    > test.out 2>&1
eval_tap $? 37 'GetChildCategories' test.out

#- 38 GetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform getDescendantCategories \
    --categoryPath 'c1uTzQGQ' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'umewaDNy' \
    > test.out 2>&1
eval_tap $? 38 'GetDescendantCategories' test.out

#- 39 QueryCodes
./ng net.accelbyte.sdk.cli.Main platform queryCodes \
    --campaignId 'rkHpSC85' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --batchName 'zhDYnrKw' \
    --batchNo '26,28,68' \
    --code 'l74tRkFs' \
    --limit '72' \
    --offset '98' \
    --withBatchName  \
    > test.out 2>&1
eval_tap $? 39 'QueryCodes' test.out

#- 40 CreateCodes
./ng net.accelbyte.sdk.cli.Main platform createCodes \
    --campaignId 'bxRiOla9' \
    --namespace "$AB_NAMESPACE" \
    --body '{"batchName": "sUxRioAj", "codeValue": "WihRWSPg", "quantity": 34}' \
    > test.out 2>&1
eval_tap $? 40 'CreateCodes' test.out

#- 41 Download
./ng net.accelbyte.sdk.cli.Main platform download \
    --campaignId 'r8WV1mVB' \
    --namespace "$AB_NAMESPACE" \
    --batchName 'V0AMeiz7' \
    --batchNo '60,86,11' \
    --withBatchName  \
    > test.out 2>&1
eval_tap $? 41 'Download' test.out

#- 42 BulkDisableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkDisableCodes \
    --campaignId 'FbiwdFlC' \
    --namespace "$AB_NAMESPACE" \
    --batchName '2u29OMvF' \
    --batchNo '59,48,48' \
    > test.out 2>&1
eval_tap $? 42 'BulkDisableCodes' test.out

#- 43 BulkEnableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkEnableCodes \
    --campaignId 'usJFE85M' \
    --namespace "$AB_NAMESPACE" \
    --batchName 'j4W70lNx' \
    --batchNo '36,27,55' \
    > test.out 2>&1
eval_tap $? 43 'BulkEnableCodes' test.out

#- 44 QueryRedeemHistory
./ng net.accelbyte.sdk.cli.Main platform queryRedeemHistory \
    --campaignId 'udUrpacY' \
    --namespace "$AB_NAMESPACE" \
    --code 'tvdNQpsO' \
    --limit '3' \
    --offset '55' \
    --userId 'cS2CUgB9' \
    > test.out 2>&1
eval_tap $? 44 'QueryRedeemHistory' test.out

#- 45 GetCode
./ng net.accelbyte.sdk.cli.Main platform getCode \
    --code 'Klh0nZvW' \
    --namespace "$AB_NAMESPACE" \
    --redeemable  \
    --withBatchName  \
    > test.out 2>&1
eval_tap $? 45 'GetCode' test.out

#- 46 DisableCode
./ng net.accelbyte.sdk.cli.Main platform disableCode \
    --code 'jJC2iTxC' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 46 'DisableCode' test.out

#- 47 EnableCode
./ng net.accelbyte.sdk.cli.Main platform enableCode \
    --code '4Et7B6lm' \
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
    --body '{"currencyCode": "PLEP1ffv", "currencySymbol": "v7911oSN", "currencyType": "VIRTUAL", "decimals": 94, "localizationDescriptions": {"YhY75PoJ": "WF9B1UYS", "aspGxuVQ": "kvJPcoi4", "3nyK3d9k": "DJYyjcYg"}}' \
    > test.out 2>&1
eval_tap $? 52 'CreateCurrency' test.out

#- 53 UpdateCurrency
./ng net.accelbyte.sdk.cli.Main platform updateCurrency \
    --currencyCode '8r8hd6xB' \
    --namespace "$AB_NAMESPACE" \
    --body '{"localizationDescriptions": {"VPEYGT5W": "bkpBep30", "8xoEr680": "GhmwopLj", "zRzy6c3e": "bpceoYmH"}}' \
    > test.out 2>&1
eval_tap $? 53 'UpdateCurrency' test.out

#- 54 DeleteCurrency
./ng net.accelbyte.sdk.cli.Main platform deleteCurrency \
    --currencyCode 'kMaCZ3IS' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 54 'DeleteCurrency' test.out

#- 55 GetCurrencyConfig
./ng net.accelbyte.sdk.cli.Main platform getCurrencyConfig \
    --currencyCode '9Q0T6UPG' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 55 'GetCurrencyConfig' test.out

#- 56 GetCurrencySummary
./ng net.accelbyte.sdk.cli.Main platform getCurrencySummary \
    --currencyCode 'a1jxGG9t' \
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
    --body '{"data": [{"id": "CELluXK1", "rewards": [{"currency": {"currencyCode": "5jGBRKcS", "namespace": "HVcgfgC1"}, "item": {"itemId": "Z7Ii0IjA", "itemName": "ifoexUl6", "itemSku": "veMjis1o", "itemType": "rO4KXUL1"}, "quantity": 71, "type": "ITEM"}, {"currency": {"currencyCode": "ILpF7xCx", "namespace": "440oWyRm"}, "item": {"itemId": "VzkRDKSl", "itemName": "RrpHQOOX", "itemSku": "95Y5DEer", "itemType": "epYyPAg5"}, "quantity": 59, "type": "ITEM"}, {"currency": {"currencyCode": "obmUSfNR", "namespace": "dTGpQafm"}, "item": {"itemId": "R6LNwQh7", "itemName": "blmnzOVB", "itemSku": "sgSRdIKP", "itemType": "OYD1hDt2"}, "quantity": 93, "type": "ITEM"}]}, {"id": "kzllD4sD", "rewards": [{"currency": {"currencyCode": "5oThXvrk", "namespace": "PmarRu79"}, "item": {"itemId": "XoQSlH3d", "itemName": "im4XXGvP", "itemSku": "C7yiVlQe", "itemType": "rHgDPTuE"}, "quantity": 19, "type": "CURRENCY"}, {"currency": {"currencyCode": "3dmGlD0w", "namespace": "fv14kJ7Z"}, "item": {"itemId": "IBKFoVC5", "itemName": "YLAfQWuz", "itemSku": "XlcRqEKq", "itemType": "GLZRTjED"}, "quantity": 22, "type": "ITEM"}, {"currency": {"currencyCode": "2Rx0iGAq", "namespace": "dGzzPsqN"}, "item": {"itemId": "zqP5HAyk", "itemName": "Gyfll0HS", "itemSku": "Qq26McHs", "itemType": "UNY2TyR5"}, "quantity": 61, "type": "ITEM"}]}, {"id": "kCF09ZCX", "rewards": [{"currency": {"currencyCode": "caIaqR1c", "namespace": "LC6gDf0x"}, "item": {"itemId": "uftlAzK5", "itemName": "T98zfRvO", "itemSku": "u12RFSvE", "itemType": "c0MTXeCE"}, "quantity": 16, "type": "CURRENCY"}, {"currency": {"currencyCode": "2FnKaXqw", "namespace": "8KgtmgJO"}, "item": {"itemId": "QkptuH3x", "itemName": "WOPV056v", "itemSku": "fCHuYLjH", "itemType": "DRNCbGN7"}, "quantity": 29, "type": "CURRENCY"}, {"currency": {"currencyCode": "RmrPdpWn", "namespace": "oEIszDsu"}, "item": {"itemId": "jesMgagT", "itemName": "yJPE1SJP", "itemSku": "VVIsVz61", "itemType": "nWjbzHSv"}, "quantity": 100, "type": "ITEM"}]}]}' \
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
    --body '{"data": [{"platform": "EPICGAMES", "platformDlcIdMap": {"UCR04mzn": "8PcMz3tG", "KduxloCJ": "MJqaAOnL", "Fi1oRJDf": "1KWbLxnO"}}, {"platform": "OCULUS", "platformDlcIdMap": {"3RrrthK1": "U4G0rF4t", "UgL21mjc": "hFSvsFhA", "CnWfQ3zq": "uSORBYDS"}}, {"platform": "EPICGAMES", "platformDlcIdMap": {"RKcc5NJU": "JOvC668Z", "madncbJ4": "vp19ciKx", "OdRWNLZ9": "imRTN6hT"}}]}' \
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
    --entitlementClazz 'CODE' \
    --entitlementName 'b70WS9wv' \
    --itemId 'hyL682Uc,bAcT71on,uAZuJzwA' \
    --limit '69' \
    --offset '26' \
    --origin 'Xbox' \
    --userId 'AcDa5W8A' \
    > test.out 2>&1
eval_tap $? 63 'QueryEntitlements1' test.out

#- 64 QueryEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryEntitlements \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemIds 'vzE1dUtr,Gneb5Zrp,M6vB3pOK' \
    --limit '65' \
    --offset '82' \
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
    --body '{"entitlementGrantList": [{"collectionId": "fSRvkBI5", "endDate": "1988-08-28T00:00:00Z", "grantedCode": "EQW5CvIK", "itemId": "IMh19G0w", "itemNamespace": "bz1Cpfmh", "language": "zBtv-zLLd", "metadata": {"awXfhAEM": {}, "KCSICFYa": {}, "733iOXwZ": {}}, "origin": "Twitch", "quantity": 53, "region": "4TV2kAaX", "source": "OTHER", "startDate": "1981-10-10T00:00:00Z", "storeId": "4oJzuGZw"}, {"collectionId": "v7xrbiwq", "endDate": "1999-03-13T00:00:00Z", "grantedCode": "ZH8mV1hD", "itemId": "tDSU5QQk", "itemNamespace": "A6QheHAL", "language": "jqE_zkox_VL", "metadata": {"qUDebNQl": {}, "zLBQFJ9d": {}, "ctuhDC6b": {}}, "origin": "Oculus", "quantity": 5, "region": "yMe5Chcc", "source": "REFERRAL_BONUS", "startDate": "1972-12-15T00:00:00Z", "storeId": "T9CfsPR7"}, {"collectionId": "hJaKMo1j", "endDate": "1977-01-23T00:00:00Z", "grantedCode": "kKU2pBTF", "itemId": "cNEn0t0U", "itemNamespace": "OugYn8kP", "language": "wChF-QDpF-786", "metadata": {"8mZxW1nB": {}, "GnEWxuJu": {}, "ZJP1Se4g": {}}, "origin": "GooglePlay", "quantity": 37, "region": "h0MmrqSy", "source": "OTHER", "startDate": "1999-09-25T00:00:00Z", "storeId": "KELfALan"}], "userIds": ["w2L4SLBd", "XmxJQXPk", "seRbacrz"]}' \
    > test.out 2>&1
eval_tap $? 67 'GrantEntitlements' test.out

#- 68 RevokeEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeEntitlements \
    --namespace "$AB_NAMESPACE" \
    --body '["GQ7vPovy", "7FlgNIc2", "rql9Jtra"]' \
    > test.out 2>&1
eval_tap $? 68 'RevokeEntitlements' test.out

#- 69 GetEntitlement
./ng net.accelbyte.sdk.cli.Main platform getEntitlement \
    --entitlementId 'pNYvDCGd' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 69 'GetEntitlement' test.out

#- 70 QueryFulfillmentHistories
./ng net.accelbyte.sdk.cli.Main platform queryFulfillmentHistories \
    --namespace "$AB_NAMESPACE" \
    --limit '90' \
    --offset '7' \
    --status 'SUCCESS' \
    --userId '2HGPEEDz' \
    > test.out 2>&1
eval_tap $? 70 'QueryFulfillmentHistories' test.out

#- 71 QueryIAPClawbackHistory
./ng net.accelbyte.sdk.cli.Main platform queryIAPClawbackHistory \
    --namespace "$AB_NAMESPACE" \
    --endTime 'T3C4h0tP' \
    --eventType 'CHARGEBACK' \
    --externalOrderId 'TpcYOlXF' \
    --limit '7' \
    --offset '93' \
    --startTime 'P8vLfq5r' \
    --status 'INIT' \
    --userId 'GfjLgRea' \
    > test.out 2>&1
eval_tap $? 71 'QueryIAPClawbackHistory' test.out

#- 72 MockPlayStationStreamEvent
./ng net.accelbyte.sdk.cli.Main platform mockPlayStationStreamEvent \
    --namespace "$AB_NAMESPACE" \
    --body '{"body": {"account": "m6GnZimA", "additionalData": {"entitlement": [{"clientTransaction": [{"amountConsumed": 10, "clientTransactionId": "KFaMrgtR"}, {"amountConsumed": 51, "clientTransactionId": "7gT3KDwB"}, {"amountConsumed": 49, "clientTransactionId": "RYGBl5Vk"}], "entitlementId": "hDrfE67B", "usageCount": 70}, {"clientTransaction": [{"amountConsumed": 85, "clientTransactionId": "oVeaywYu"}, {"amountConsumed": 68, "clientTransactionId": "8lbXymzf"}, {"amountConsumed": 60, "clientTransactionId": "C6qAJQ1p"}], "entitlementId": "5GhFF7uG", "usageCount": 43}, {"clientTransaction": [{"amountConsumed": 50, "clientTransactionId": "tckvQ7Ob"}, {"amountConsumed": 57, "clientTransactionId": "QOhqqEzf"}, {"amountConsumed": 69, "clientTransactionId": "m9bAAFD5"}], "entitlementId": "pn9D5wLv", "usageCount": 43}], "purpose": "7InplhY4"}, "originalTitleName": "iqEi76kh", "paymentProductSKU": "dTALXSCV", "purchaseDate": "AX8h35SW", "sourceOrderItemId": "Zy5QvcwN", "titleName": "2P0IVpJM"}, "eventDomain": "8c9IgFQv", "eventSource": "YD85qtIM", "eventType": "MeBXJU59", "eventVersion": 27, "id": "864mencA", "timestamp": "MSV5hFXm"}' \
    > test.out 2>&1
eval_tap $? 72 'MockPlayStationStreamEvent' test.out

#- 73 MockXblClawbackEvent
./ng net.accelbyte.sdk.cli.Main platform mockXblClawbackEvent \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": {"eventDate": "1evS1sZW", "eventState": "pa6WZLyo", "lineItemId": "OyJQMKMd", "orderId": "tRppsxdT", "productId": "5XrN1Jt1", "productType": "iobYltXy", "purchasedDate": "51KnA4ma", "sandboxId": "hMVUltOg", "skuId": "pT6huaaK", "subscriptionData": {"consumedDurationInDays": 63, "dateTime": "W4VaZNhA", "durationInDays": 12, "recurrenceId": "BkVhSI8Z"}}, "datacontenttype": "3T5bekg7", "id": "NtOYo3dx", "source": "roUBm0Ot", "specVersion": "odxKdEOC", "subject": "ZVHowM82", "time": "M6Ay266m", "traceparent": "6sAiCrVn", "type": "tLZmv5i5"}' \
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
    --body '{"appAppleId": 78, "bundleId": "NqcahMjb", "issuerId": "EHBMyuBs", "keyId": "KAiLApdz", "password": "fyOzoxC7", "version": "V2"}' \
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
    --body '{"sandboxId": "lKwOyupJ"}' \
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
    --body '{"applicationName": "2RRyjQkp", "notificationTokenAudience": "zKxAFf7f", "notificationTokenEmail": "Ea4A7jvB", "packageName": "6OZiggp6", "serviceAccountId": "DboU7OxX"}' \
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
    --body '{"data": [{"itemIdentity": "CDHFkL5H", "itemIdentityType": "ITEM_ID", "platformProductIdMap": {"St4Pq9lO": "DeAS1Ctj", "1qarBqxH": "HS9sgFA4", "stE5WzB3": "ob67jTXS"}}, {"itemIdentity": "7M3OkJ9x", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"zTTla8Oe": "mlz1XGuj", "iyFzsp5X": "CiP6hyqF", "hrACk9nP": "tM2Yhxhi"}}, {"itemIdentity": "OHdfHHlN", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"kX0VeOxC": "RmitULPY", "X3v5LjAY": "7ONiBQkj", "NCLTvFAo": "9YPxz9Nl"}}]}' \
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
    --body '{"appId": "29TeEnvc", "appSecret": "VbzI0JaC"}' \
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
    --body '{"backOfficeServerClientId": "ZhbbGCTL", "backOfficeServerClientSecret": "de485xjP", "enableStreamJob": true, "environment": "mIQU7mhn", "streamName": "2z33ivBq", "streamPartnerName": "GKDyzQoV"}' \
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
    --body '{"backOfficeServerClientId": "kvOCYQvP", "backOfficeServerClientSecret": "WqkfJNA3", "enableStreamJob": false, "environment": "xjumRxiM", "streamName": "xQ1JwhII", "streamPartnerName": "P7ZHznxB"}' \
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
    --body '{"appId": "vBc0IXEo", "env": "SANDBOX", "publisherAuthenticationKey": "DaRqV7zH", "syncMode": "TRANSACTION"}' \
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
    --body '{"clientId": "3PV7dJgC", "clientSecret": "OrSTOV1L", "organizationId": "KFWF8QyW"}' \
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
    --body '{"enableClawback": true, "entraAppClientId": "1LJvdYpP", "entraAppClientSecret": "sk2p8UeA", "entraTenantId": "Vrqfw5Tn", "relyingPartyCert": "J197jEbR"}' \
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
    --password '1driVMeg' \
    > test.out 2>&1
eval_tap $? 105 'UpdateXblBPCertFile' test.out

#- 106 QueryThirdPartyNotifications
./ng net.accelbyte.sdk.cli.Main platform queryThirdPartyNotifications \
    --namespace "$AB_NAMESPACE" \
    --endDate 'nGD4VG0M' \
    --externalId 'IF0eSeQc' \
    --limit '60' \
    --offset '90' \
    --source 'TWITCH' \
    --startDate 'hNwnAMI0' \
    --status 'IGNORED' \
    --type 'RCYyfjH4' \
    > test.out 2>&1
eval_tap $? 106 'QueryThirdPartyNotifications' test.out

#- 107 QueryAbnormalTransactions
./ng net.accelbyte.sdk.cli.Main platform queryAbnormalTransactions \
    --namespace "$AB_NAMESPACE" \
    --limit '43' \
    --offset '87' \
    --orderId 'te00NI4A' \
    --steamId 'cxFqXMVq' \
    > test.out 2>&1
eval_tap $? 107 'QueryAbnormalTransactions' test.out

#- 108 AdminGetSteamJobInfo
./ng net.accelbyte.sdk.cli.Main platform adminGetSteamJobInfo \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 108 'AdminGetSteamJobInfo' test.out

#- 109 AdminResetSteamJobTime
./ng net.accelbyte.sdk.cli.Main platform adminResetSteamJobTime \
    --namespace "$AB_NAMESPACE" \
    --body '{"env": "SANDBOX", "lastTime": "1994-04-11T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 109 'AdminResetSteamJobTime' test.out

#- 110 AdminRefundIAPOrder
./ng net.accelbyte.sdk.cli.Main platform adminRefundIAPOrder \
    --iapOrderNo 'bjqgvTNc' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 110 'AdminRefundIAPOrder' test.out

#- 111 QuerySteamReportHistories
./ng net.accelbyte.sdk.cli.Main platform querySteamReportHistories \
    --namespace "$AB_NAMESPACE" \
    --limit '31' \
    --offset '26' \
    --orderId 'Lds8CFv7' \
    --processStatus 'ERROR' \
    --steamId 'jwy8tgiv' \
    > test.out 2>&1
eval_tap $? 111 'QuerySteamReportHistories' test.out

#- 112 QueryThirdPartySubscription
./ng net.accelbyte.sdk.cli.Main platform queryThirdPartySubscription \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --groupId 'vPhTCoW0' \
    --limit '43' \
    --offset '20' \
    --platform 'PLAYSTATION' \
    --productId 'gYnh2i2O' \
    --userId 'mzFnP9NR' \
    > test.out 2>&1
eval_tap $? 112 'QueryThirdPartySubscription' test.out

#- 113 GetIAPOrderConsumeDetails
./ng net.accelbyte.sdk.cli.Main platform getIAPOrderConsumeDetails \
    --iapOrderNo 'w3HAu4SA' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 113 'GetIAPOrderConsumeDetails' test.out

#- 114 DownloadInvoiceDetails
./ng net.accelbyte.sdk.cli.Main platform downloadInvoiceDetails \
    --namespace "$AB_NAMESPACE" \
    --endTime 'eNQu2aNm' \
    --feature 'B6DUAn9l' \
    --itemId 'FBbUYlf6' \
    --itemType 'SEASON' \
    --startTime 'AByeQ9WA' \
    > test.out 2>&1
eval_tap $? 114 'DownloadInvoiceDetails' test.out

#- 115 GenerateInvoiceSummary
./ng net.accelbyte.sdk.cli.Main platform generateInvoiceSummary \
    --namespace "$AB_NAMESPACE" \
    --endTime 'i4o0b9tG' \
    --feature 'WCRgyhg3' \
    --itemId 'cg4CKQdp' \
    --itemType 'EXTENSION' \
    --startTime 'WUGdUbNG' \
    > test.out 2>&1
eval_tap $? 115 'GenerateInvoiceSummary' test.out

#- 116 SyncInGameItem
./ng net.accelbyte.sdk.cli.Main platform syncInGameItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'mFa5KJZ7' \
    --body '{"categoryPath": "ogbpjyrS", "targetItemId": "G3pGQNSl", "targetNamespace": "L2rrbu3J"}' \
    > test.out 2>&1
eval_tap $? 116 'SyncInGameItem' test.out

#- 117 CreateItem
./ng net.accelbyte.sdk.cli.Main platform createItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'MeQSgvTc' \
    --body '{"appId": "iXfDgVja", "appType": "SOFTWARE", "baseAppId": "TAcfaCFq", "boothName": "f9txbg7x", "categoryPath": "qxGKkst0", "clazz": "fNPv6MTS", "displayOrder": 60, "entitlementType": "CONSUMABLE", "ext": {"ALnjBNQa": {}, "vQzZwX2v": {}, "GLqm9aYH": {}}, "features": ["7OtiKKQF", "GwnJIooD", "Sbu4ud5a"], "flexible": true, "images": [{"as": "BjvegB0f", "caption": "6vKNjpqJ", "height": 43, "imageUrl": "rb1H0YDB", "smallImageUrl": "Tt2BicxY", "width": 62}, {"as": "yLydVt3n", "caption": "7A7QCZv5", "height": 97, "imageUrl": "SuZrGDVl", "smallImageUrl": "BwcB7N2j", "width": 92}, {"as": "IkvL06GX", "caption": "VpZWAXNi", "height": 74, "imageUrl": "ioI8dZMu", "smallImageUrl": "Jmo1BQsc", "width": 18}], "inventoryConfig": {"customAttributes": {"QXDaRwDR": {}, "9jkUMjNe": {}, "FnsZJZJF": {}}, "serverCustomAttributes": {"OqP0pQ2p": {}, "89xi0jld": {}, "ftbP1VMK": {}}, "slotUsed": 81}, "itemIds": ["GuIu5Mos", "bMo4ZU0m", "QAJNmcbN"], "itemQty": {"ZoMdYA4x": 61, "uSmzBh8q": 23, "sNoHZv91": 67}, "itemType": "MEDIA", "listable": false, "localizations": {"mAeQYYRK": {"description": "vHJ0ocrg", "localExt": {"fm7hM50z": {}, "cHciL9CH": {}, "rswIHNuF": {}}, "longDescription": "4GSkU4v3", "title": "O4c6fvbq"}, "pj5A09BS": {"description": "LCJr9T4w", "localExt": {"d1AQLMNI": {}, "sZhZaWdc": {}, "KBIS6UCu": {}}, "longDescription": "55HuzHXg", "title": "ABstCivq"}, "tS6J1pPX": {"description": "RJZ4M7GD", "localExt": {"MKWIcebv": {}, "wsmHSkLw": {}, "g9zHo80H": {}}, "longDescription": "QA2zieBi", "title": "Pr9Djpff"}}, "lootBoxConfig": {"rewardCount": 65, "rewards": [{"lootBoxItems": [{"count": 79, "duration": 19, "endDate": "1972-03-08T00:00:00Z", "itemId": "P6c5dGtR", "itemSku": "AchsuuhT", "itemType": "v8uweG80"}, {"count": 13, "duration": 25, "endDate": "1977-12-06T00:00:00Z", "itemId": "vpYF5lg4", "itemSku": "0bEK4n3P", "itemType": "xKoJw3Wv"}, {"count": 91, "duration": 0, "endDate": "1971-07-13T00:00:00Z", "itemId": "09CTVhPE", "itemSku": "tUJHtM6a", "itemType": "exrxjKxT"}], "name": "OMi0my1s", "odds": 0.9351260398456173, "type": "REWARD", "weight": 64}, {"lootBoxItems": [{"count": 31, "duration": 9, "endDate": "1984-12-11T00:00:00Z", "itemId": "9oo1FqWU", "itemSku": "dRBnUSuu", "itemType": "K0yrVZXn"}, {"count": 43, "duration": 17, "endDate": "1981-05-07T00:00:00Z", "itemId": "sNLhpcnO", "itemSku": "t9dK8sNb", "itemType": "ueuMstVP"}, {"count": 89, "duration": 57, "endDate": "1976-02-26T00:00:00Z", "itemId": "pHwdH7Hx", "itemSku": "bUQ4W497", "itemType": "jxdBz1La"}], "name": "1JTR2FpC", "odds": 0.9853176481758603, "type": "REWARD", "weight": 75}, {"lootBoxItems": [{"count": 46, "duration": 63, "endDate": "1971-10-05T00:00:00Z", "itemId": "0ETkbfGh", "itemSku": "zKxHpX7D", "itemType": "TspyGgVB"}, {"count": 90, "duration": 97, "endDate": "1990-10-24T00:00:00Z", "itemId": "6USUMjTZ", "itemSku": "fz27EhPk", "itemType": "pJvueFz6"}, {"count": 85, "duration": 30, "endDate": "1991-01-13T00:00:00Z", "itemId": "QUXX9Adm", "itemSku": "mmTuMZ2A", "itemType": "5pohIGal"}], "name": "ytZTGO1A", "odds": 0.10562211625545448, "type": "PROBABILITY_GROUP", "weight": 84}], "rollFunction": "CUSTOM"}, "maxCount": 34, "maxCountPerUser": 80, "name": "2wKcUxNf", "optionBoxConfig": {"boxItems": [{"count": 54, "duration": 94, "endDate": "1972-02-05T00:00:00Z", "itemId": "vtNINM8H", "itemSku": "LiKPKanL", "itemType": "QNNZMgFc"}, {"count": 5, "duration": 64, "endDate": "1980-04-15T00:00:00Z", "itemId": "eaFV0GzP", "itemSku": "ccpr3kiZ", "itemType": "DvckQIhL"}, {"count": 17, "duration": 62, "endDate": "1975-08-11T00:00:00Z", "itemId": "wt9wop3C", "itemSku": "AKSArQdh", "itemType": "gwrB7JIk"}]}, "purchasable": false, "recurring": {"cycle": "YEARLY", "fixedFreeDays": 19, "fixedTrialCycles": 70, "graceDays": 8}, "regionData": {"NZIzNqMk": [{"currencyCode": "c15LObZf", "currencyNamespace": "7Ulxx7MQ", "currencyType": "REAL", "discountAmount": 66, "discountExpireAt": "1988-03-29T00:00:00Z", "discountPercentage": 78, "discountPurchaseAt": "1973-10-03T00:00:00Z", "expireAt": "1978-12-24T00:00:00Z", "price": 72, "purchaseAt": "1982-08-07T00:00:00Z", "trialPrice": 51}, {"currencyCode": "3GbiYPKO", "currencyNamespace": "SiiQz6dt", "currencyType": "VIRTUAL", "discountAmount": 38, "discountExpireAt": "1977-01-09T00:00:00Z", "discountPercentage": 47, "discountPurchaseAt": "1996-03-08T00:00:00Z", "expireAt": "1995-03-11T00:00:00Z", "price": 62, "purchaseAt": "1987-03-16T00:00:00Z", "trialPrice": 63}, {"currencyCode": "xjwMgt4K", "currencyNamespace": "eVqKFeHN", "currencyType": "VIRTUAL", "discountAmount": 96, "discountExpireAt": "1994-01-22T00:00:00Z", "discountPercentage": 64, "discountPurchaseAt": "1977-10-27T00:00:00Z", "expireAt": "1998-12-18T00:00:00Z", "price": 21, "purchaseAt": "1980-08-29T00:00:00Z", "trialPrice": 58}], "AKpC903q": [{"currencyCode": "q7GUtqvx", "currencyNamespace": "rG5CTZ9u", "currencyType": "VIRTUAL", "discountAmount": 100, "discountExpireAt": "1985-01-19T00:00:00Z", "discountPercentage": 98, "discountPurchaseAt": "1980-01-21T00:00:00Z", "expireAt": "1980-08-15T00:00:00Z", "price": 82, "purchaseAt": "1983-08-08T00:00:00Z", "trialPrice": 79}, {"currencyCode": "CVAp9fj3", "currencyNamespace": "UEIUWa7I", "currencyType": "VIRTUAL", "discountAmount": 90, "discountExpireAt": "1988-11-17T00:00:00Z", "discountPercentage": 45, "discountPurchaseAt": "1973-07-24T00:00:00Z", "expireAt": "1981-07-19T00:00:00Z", "price": 94, "purchaseAt": "1984-12-20T00:00:00Z", "trialPrice": 91}, {"currencyCode": "0RqvbaPb", "currencyNamespace": "Yld7xQWU", "currencyType": "VIRTUAL", "discountAmount": 16, "discountExpireAt": "1981-05-31T00:00:00Z", "discountPercentage": 92, "discountPurchaseAt": "1982-11-13T00:00:00Z", "expireAt": "1982-04-25T00:00:00Z", "price": 43, "purchaseAt": "1994-12-15T00:00:00Z", "trialPrice": 8}], "H4O0QZkY": [{"currencyCode": "sAYXqFmP", "currencyNamespace": "eskoK4AU", "currencyType": "REAL", "discountAmount": 35, "discountExpireAt": "1996-08-14T00:00:00Z", "discountPercentage": 90, "discountPurchaseAt": "1982-04-22T00:00:00Z", "expireAt": "1999-03-04T00:00:00Z", "price": 7, "purchaseAt": "1978-01-08T00:00:00Z", "trialPrice": 69}, {"currencyCode": "JKvD9rsj", "currencyNamespace": "hClPcIJt", "currencyType": "REAL", "discountAmount": 77, "discountExpireAt": "1973-08-20T00:00:00Z", "discountPercentage": 48, "discountPurchaseAt": "1981-06-18T00:00:00Z", "expireAt": "1985-10-04T00:00:00Z", "price": 6, "purchaseAt": "1971-10-28T00:00:00Z", "trialPrice": 55}, {"currencyCode": "VHopQ6HI", "currencyNamespace": "ffgS4d8I", "currencyType": "REAL", "discountAmount": 40, "discountExpireAt": "1985-08-20T00:00:00Z", "discountPercentage": 82, "discountPurchaseAt": "1999-01-12T00:00:00Z", "expireAt": "1987-08-01T00:00:00Z", "price": 76, "purchaseAt": "1971-10-25T00:00:00Z", "trialPrice": 23}]}, "saleConfig": {"currencyCode": "EPeEuxLs", "price": 1}, "seasonType": "PASS", "sectionExclusive": true, "sellable": true, "sku": "3Kwm5Jyt", "stackable": true, "status": "ACTIVE", "tags": ["2ycILWn7", "EqCkzBqh", "9oC7SwEu"], "targetCurrencyCode": "1ELEG9zI", "targetNamespace": "XQEGlFHW", "thumbnailUrl": "tlUCCvrJ", "useCount": 84}' \
    > test.out 2>&1
eval_tap $? 117 'CreateItem' test.out

#- 118 GetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform getItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId '1xleL0R4' \
    --appId 'vWw5Bfx0' \
    > test.out 2>&1
eval_tap $? 118 'GetItemByAppId' test.out

#- 119 QueryItems
./ng net.accelbyte.sdk.cli.Main platform queryItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --appType 'SOFTWARE' \
    --availableDate 'bPhLuhvZ' \
    --baseAppId 'qUNuqHtw' \
    --categoryPath 'sxZJZYvP' \
    --features '1GYzKRCl' \
    --includeSubCategoryItem  \
    --itemType 'APP' \
    --limit '33' \
    --offset '2' \
    --region 'U3ZQKGMq' \
    --sortBy 'updatedAt,updatedAt:desc,updatedAt:asc' \
    --storeId '2cJYOowL' \
    --tags 'fmv9LQGv' \
    --targetNamespace 'aGWWDC0N' \
    > test.out 2>&1
eval_tap $? 119 'QueryItems' test.out

#- 120 ListBasicItemsByFeatures
./ng net.accelbyte.sdk.cli.Main platform listBasicItemsByFeatures \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --features 'BBjxFkSb,VZMNpBsq,XeE6Qs0I' \
    > test.out 2>&1
eval_tap $? 120 'ListBasicItemsByFeatures' test.out

#- 121 GetItems
./ng net.accelbyte.sdk.cli.Main platform getItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'hhTEfYOA' \
    --itemIds 'jce6lg28' \
    > test.out 2>&1
eval_tap $? 121 'GetItems' test.out

#- 122 GetItemBySku
./ng net.accelbyte.sdk.cli.Main platform getItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'k0PMEOWa' \
    --sku 'IQyDU8nK' \
    > test.out 2>&1
eval_tap $? 122 'GetItemBySku' test.out

#- 123 GetLocaleItemBySku
./ng net.accelbyte.sdk.cli.Main platform getLocaleItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'gcuGvJMm' \
    --populateBundle  \
    --region 'puJenyUw' \
    --storeId '9zyPxX3J' \
    --sku 'IGEOzdkc' \
    > test.out 2>&1
eval_tap $? 123 'GetLocaleItemBySku' test.out

#- 124 GetEstimatedPrice
./ng net.accelbyte.sdk.cli.Main platform getEstimatedPrice \
    --namespace "$AB_NAMESPACE" \
    --platform 'K2im1Huz' \
    --region 'CuUWOENa' \
    --storeId 'J00UPyDD' \
    --itemIds 'bdsKQYJG' \
    --userId 'zNGUcez9' \
    > test.out 2>&1
eval_tap $? 124 'GetEstimatedPrice' test.out

#- 125 GetItemIdBySku
./ng net.accelbyte.sdk.cli.Main platform getItemIdBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId '8h7ovabE' \
    --sku 'T8gtNEH1' \
    > test.out 2>&1
eval_tap $? 125 'GetItemIdBySku' test.out

#- 126 GetBulkItemIdBySkus
./ng net.accelbyte.sdk.cli.Main platform getBulkItemIdBySkus \
    --namespace "$AB_NAMESPACE" \
    --sku 'j2IdT15C,muw3yLlz,yU0NW7b9' \
    --storeId 'QuuAYwCK' \
    > test.out 2>&1
eval_tap $? 126 'GetBulkItemIdBySkus' test.out

#- 127 BulkGetLocaleItems
./ng net.accelbyte.sdk.cli.Main platform bulkGetLocaleItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'vw5ooyzd' \
    --region 'QOlPeJ04' \
    --storeId 'mUsvpGnN' \
    --itemIds 'YVfF2OWm' \
    > test.out 2>&1
eval_tap $? 127 'BulkGetLocaleItems' test.out

#- 128 GetAvailablePredicateTypes
./ng net.accelbyte.sdk.cli.Main platform getAvailablePredicateTypes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 128 'GetAvailablePredicateTypes' test.out

#- 129 ValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform validateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --platform '29JKuEU7' \
    --userId 'WqBwbGLA' \
    --body '{"itemIds": ["MLzSwTzm", "8THggat7", "Q8gNujdg"]}' \
    > test.out 2>&1
eval_tap $? 129 'ValidateItemPurchaseCondition' test.out

#- 130 BulkUpdateRegionData
./ng net.accelbyte.sdk.cli.Main platform bulkUpdateRegionData \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ygI7lSKB' \
    --body '{"changes": [{"itemIdentities": ["xSwnjWSh", "Xxoost8s", "KtUv4SJI"], "itemIdentityType": "ITEM_ID", "regionData": {"Oz5WsBw3": [{"currencyCode": "9BmMZTqI", "currencyNamespace": "t5EfS1Dt", "currencyType": "REAL", "discountAmount": 90, "discountExpireAt": "1984-06-05T00:00:00Z", "discountPercentage": 97, "discountPurchaseAt": "1985-04-04T00:00:00Z", "discountedPrice": 0, "expireAt": "1988-06-15T00:00:00Z", "price": 5, "purchaseAt": "1989-12-04T00:00:00Z", "trialPrice": 36}, {"currencyCode": "hOCigJF5", "currencyNamespace": "6rYMAPyG", "currencyType": "REAL", "discountAmount": 65, "discountExpireAt": "1980-07-17T00:00:00Z", "discountPercentage": 27, "discountPurchaseAt": "1983-08-10T00:00:00Z", "discountedPrice": 50, "expireAt": "1976-03-27T00:00:00Z", "price": 99, "purchaseAt": "1999-03-03T00:00:00Z", "trialPrice": 83}, {"currencyCode": "wVfKlhUO", "currencyNamespace": "ys9wnCuc", "currencyType": "VIRTUAL", "discountAmount": 65, "discountExpireAt": "1981-06-24T00:00:00Z", "discountPercentage": 68, "discountPurchaseAt": "1976-11-10T00:00:00Z", "discountedPrice": 57, "expireAt": "1982-09-09T00:00:00Z", "price": 43, "purchaseAt": "1991-07-27T00:00:00Z", "trialPrice": 79}], "WuJgfhgQ": [{"currencyCode": "82cVfw6S", "currencyNamespace": "kV3GFvPd", "currencyType": "VIRTUAL", "discountAmount": 81, "discountExpireAt": "1974-12-01T00:00:00Z", "discountPercentage": 9, "discountPurchaseAt": "1991-07-16T00:00:00Z", "discountedPrice": 95, "expireAt": "1992-11-18T00:00:00Z", "price": 62, "purchaseAt": "1993-04-27T00:00:00Z", "trialPrice": 87}, {"currencyCode": "AhOqQE20", "currencyNamespace": "aPn6z0uT", "currencyType": "VIRTUAL", "discountAmount": 86, "discountExpireAt": "1984-04-27T00:00:00Z", "discountPercentage": 0, "discountPurchaseAt": "1999-08-26T00:00:00Z", "discountedPrice": 14, "expireAt": "1980-01-10T00:00:00Z", "price": 31, "purchaseAt": "1987-06-30T00:00:00Z", "trialPrice": 70}, {"currencyCode": "WrRiDJLK", "currencyNamespace": "QnzwCyH0", "currencyType": "VIRTUAL", "discountAmount": 54, "discountExpireAt": "1980-01-28T00:00:00Z", "discountPercentage": 85, "discountPurchaseAt": "1993-06-16T00:00:00Z", "discountedPrice": 43, "expireAt": "1998-12-09T00:00:00Z", "price": 9, "purchaseAt": "1987-10-26T00:00:00Z", "trialPrice": 32}], "R6m6EkAI": [{"currencyCode": "3knGFqVg", "currencyNamespace": "Isl0TEbP", "currencyType": "REAL", "discountAmount": 3, "discountExpireAt": "1973-03-06T00:00:00Z", "discountPercentage": 5, "discountPurchaseAt": "1994-11-09T00:00:00Z", "discountedPrice": 98, "expireAt": "1997-02-02T00:00:00Z", "price": 26, "purchaseAt": "1975-10-10T00:00:00Z", "trialPrice": 14}, {"currencyCode": "CKiK7yvZ", "currencyNamespace": "DmAZzj83", "currencyType": "VIRTUAL", "discountAmount": 100, "discountExpireAt": "1983-07-24T00:00:00Z", "discountPercentage": 79, "discountPurchaseAt": "1990-04-08T00:00:00Z", "discountedPrice": 22, "expireAt": "1985-04-05T00:00:00Z", "price": 45, "purchaseAt": "1990-10-29T00:00:00Z", "trialPrice": 14}, {"currencyCode": "M5VvYyFi", "currencyNamespace": "aYKqOQYe", "currencyType": "VIRTUAL", "discountAmount": 73, "discountExpireAt": "1995-05-08T00:00:00Z", "discountPercentage": 69, "discountPurchaseAt": "1976-05-23T00:00:00Z", "discountedPrice": 73, "expireAt": "1972-01-01T00:00:00Z", "price": 48, "purchaseAt": "1992-01-21T00:00:00Z", "trialPrice": 11}]}}, {"itemIdentities": ["1xLctamX", "d6dcNrb6", "UDSrMb8X"], "itemIdentityType": "ITEM_SKU", "regionData": {"Tzx3S1Zg": [{"currencyCode": "XTxQOQ8l", "currencyNamespace": "ancrMkVA", "currencyType": "VIRTUAL", "discountAmount": 60, "discountExpireAt": "1978-11-16T00:00:00Z", "discountPercentage": 78, "discountPurchaseAt": "1997-06-23T00:00:00Z", "discountedPrice": 46, "expireAt": "1974-06-16T00:00:00Z", "price": 77, "purchaseAt": "1991-07-26T00:00:00Z", "trialPrice": 70}, {"currencyCode": "dJMQhwvy", "currencyNamespace": "tKd8y0e0", "currencyType": "REAL", "discountAmount": 48, "discountExpireAt": "1985-09-24T00:00:00Z", "discountPercentage": 97, "discountPurchaseAt": "1979-06-26T00:00:00Z", "discountedPrice": 80, "expireAt": "1990-01-15T00:00:00Z", "price": 58, "purchaseAt": "1977-05-08T00:00:00Z", "trialPrice": 75}, {"currencyCode": "MzZjusmS", "currencyNamespace": "U5N5WWjj", "currencyType": "VIRTUAL", "discountAmount": 53, "discountExpireAt": "1972-10-31T00:00:00Z", "discountPercentage": 70, "discountPurchaseAt": "1973-01-31T00:00:00Z", "discountedPrice": 32, "expireAt": "1976-09-04T00:00:00Z", "price": 55, "purchaseAt": "1992-07-26T00:00:00Z", "trialPrice": 18}], "19d9YsVV": [{"currencyCode": "3NV07oZP", "currencyNamespace": "f1J063j0", "currencyType": "REAL", "discountAmount": 33, "discountExpireAt": "1984-02-20T00:00:00Z", "discountPercentage": 66, "discountPurchaseAt": "1995-03-12T00:00:00Z", "discountedPrice": 57, "expireAt": "1997-06-08T00:00:00Z", "price": 92, "purchaseAt": "1991-03-27T00:00:00Z", "trialPrice": 6}, {"currencyCode": "q4RN8wYR", "currencyNamespace": "QiLTjXHL", "currencyType": "VIRTUAL", "discountAmount": 95, "discountExpireAt": "1984-09-26T00:00:00Z", "discountPercentage": 94, "discountPurchaseAt": "1998-01-21T00:00:00Z", "discountedPrice": 4, "expireAt": "1980-12-13T00:00:00Z", "price": 3, "purchaseAt": "1997-11-27T00:00:00Z", "trialPrice": 23}, {"currencyCode": "s7PGHzyA", "currencyNamespace": "T7nk0WVz", "currencyType": "VIRTUAL", "discountAmount": 44, "discountExpireAt": "1994-05-24T00:00:00Z", "discountPercentage": 94, "discountPurchaseAt": "1989-05-02T00:00:00Z", "discountedPrice": 0, "expireAt": "1986-03-29T00:00:00Z", "price": 2, "purchaseAt": "1991-02-23T00:00:00Z", "trialPrice": 32}], "XIxKa0un": [{"currencyCode": "rHpwnw2Y", "currencyNamespace": "L9y5KAPF", "currencyType": "REAL", "discountAmount": 71, "discountExpireAt": "1974-11-13T00:00:00Z", "discountPercentage": 88, "discountPurchaseAt": "1989-10-28T00:00:00Z", "discountedPrice": 36, "expireAt": "1974-08-18T00:00:00Z", "price": 22, "purchaseAt": "1987-09-14T00:00:00Z", "trialPrice": 27}, {"currencyCode": "rHSEn8Cr", "currencyNamespace": "0NEo6Uxl", "currencyType": "REAL", "discountAmount": 78, "discountExpireAt": "1990-08-08T00:00:00Z", "discountPercentage": 11, "discountPurchaseAt": "1979-07-16T00:00:00Z", "discountedPrice": 33, "expireAt": "1988-05-14T00:00:00Z", "price": 20, "purchaseAt": "1980-06-18T00:00:00Z", "trialPrice": 3}, {"currencyCode": "YROtj1a4", "currencyNamespace": "lXlOurvq", "currencyType": "REAL", "discountAmount": 74, "discountExpireAt": "1991-06-24T00:00:00Z", "discountPercentage": 29, "discountPurchaseAt": "1990-11-09T00:00:00Z", "discountedPrice": 16, "expireAt": "1978-05-29T00:00:00Z", "price": 19, "purchaseAt": "1977-09-15T00:00:00Z", "trialPrice": 24}]}}, {"itemIdentities": ["uvBqUFpS", "P9ICUL0K", "86FXTkTs"], "itemIdentityType": "ITEM_ID", "regionData": {"dJuLHgmh": [{"currencyCode": "owj2VJng", "currencyNamespace": "rNZIF7Gd", "currencyType": "REAL", "discountAmount": 61, "discountExpireAt": "1989-01-30T00:00:00Z", "discountPercentage": 42, "discountPurchaseAt": "1987-04-12T00:00:00Z", "discountedPrice": 33, "expireAt": "1990-10-06T00:00:00Z", "price": 81, "purchaseAt": "1989-08-31T00:00:00Z", "trialPrice": 49}, {"currencyCode": "2J2exJoS", "currencyNamespace": "gFDOKqe3", "currencyType": "VIRTUAL", "discountAmount": 26, "discountExpireAt": "1974-08-21T00:00:00Z", "discountPercentage": 18, "discountPurchaseAt": "1972-08-04T00:00:00Z", "discountedPrice": 77, "expireAt": "1991-11-12T00:00:00Z", "price": 86, "purchaseAt": "1981-01-25T00:00:00Z", "trialPrice": 58}, {"currencyCode": "fYGaYdUG", "currencyNamespace": "kIoipVwF", "currencyType": "VIRTUAL", "discountAmount": 49, "discountExpireAt": "1990-11-15T00:00:00Z", "discountPercentage": 22, "discountPurchaseAt": "1972-03-31T00:00:00Z", "discountedPrice": 97, "expireAt": "1979-02-27T00:00:00Z", "price": 38, "purchaseAt": "1996-08-19T00:00:00Z", "trialPrice": 49}], "0ASzGmAZ": [{"currencyCode": "WLYcvfK9", "currencyNamespace": "0esYdWti", "currencyType": "VIRTUAL", "discountAmount": 27, "discountExpireAt": "1979-05-25T00:00:00Z", "discountPercentage": 47, "discountPurchaseAt": "1987-10-15T00:00:00Z", "discountedPrice": 28, "expireAt": "1975-12-16T00:00:00Z", "price": 6, "purchaseAt": "1975-07-01T00:00:00Z", "trialPrice": 51}, {"currencyCode": "sdJog02x", "currencyNamespace": "F8e35sLn", "currencyType": "REAL", "discountAmount": 36, "discountExpireAt": "1985-08-25T00:00:00Z", "discountPercentage": 81, "discountPurchaseAt": "1995-07-06T00:00:00Z", "discountedPrice": 70, "expireAt": "1991-08-20T00:00:00Z", "price": 72, "purchaseAt": "1983-07-02T00:00:00Z", "trialPrice": 69}, {"currencyCode": "y2HF0dwy", "currencyNamespace": "PNqSnRWR", "currencyType": "REAL", "discountAmount": 91, "discountExpireAt": "1979-04-07T00:00:00Z", "discountPercentage": 58, "discountPurchaseAt": "1994-11-23T00:00:00Z", "discountedPrice": 11, "expireAt": "1980-06-14T00:00:00Z", "price": 23, "purchaseAt": "1971-04-16T00:00:00Z", "trialPrice": 45}], "OAdaTzYS": [{"currencyCode": "m35dGwcL", "currencyNamespace": "nyX3vlm9", "currencyType": "REAL", "discountAmount": 43, "discountExpireAt": "1975-05-06T00:00:00Z", "discountPercentage": 23, "discountPurchaseAt": "1977-12-07T00:00:00Z", "discountedPrice": 54, "expireAt": "1986-05-26T00:00:00Z", "price": 51, "purchaseAt": "1973-06-06T00:00:00Z", "trialPrice": 68}, {"currencyCode": "o1kk8iKX", "currencyNamespace": "nY3CC91g", "currencyType": "REAL", "discountAmount": 19, "discountExpireAt": "1985-12-23T00:00:00Z", "discountPercentage": 14, "discountPurchaseAt": "1976-05-11T00:00:00Z", "discountedPrice": 73, "expireAt": "1997-05-08T00:00:00Z", "price": 69, "purchaseAt": "1996-09-09T00:00:00Z", "trialPrice": 22}, {"currencyCode": "5ajMFaxx", "currencyNamespace": "JlbBKqf8", "currencyType": "VIRTUAL", "discountAmount": 69, "discountExpireAt": "1985-06-14T00:00:00Z", "discountPercentage": 77, "discountPurchaseAt": "1990-01-19T00:00:00Z", "discountedPrice": 5, "expireAt": "1998-10-19T00:00:00Z", "price": 26, "purchaseAt": "1971-07-19T00:00:00Z", "trialPrice": 67}]}}]}' \
    > test.out 2>&1
eval_tap $? 130 'BulkUpdateRegionData' test.out

#- 131 SearchItems
./ng net.accelbyte.sdk.cli.Main platform searchItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemType 'SEASON' \
    --limit '66' \
    --offset '18' \
    --sortBy 'mMvaEbkr' \
    --storeId 'mtuLHAc2' \
    --keyword 'j4JRmNif' \
    --language 'i0qCibt0' \
    > test.out 2>&1
eval_tap $? 131 'SearchItems' test.out

#- 132 QueryUncategorizedItems
./ng net.accelbyte.sdk.cli.Main platform queryUncategorizedItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --limit '70' \
    --offset '25' \
    --sortBy 'displayOrder:desc,displayOrder:asc,updatedAt:asc' \
    --storeId 'ZJe9De4K' \
    > test.out 2>&1
eval_tap $? 132 'QueryUncategorizedItems' test.out

#- 133 GetItem
./ng net.accelbyte.sdk.cli.Main platform getItem \
    --itemId 'hbpHjOKy' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'IeptR2UR' \
    > test.out 2>&1
eval_tap $? 133 'GetItem' test.out

#- 134 UpdateItem
./ng net.accelbyte.sdk.cli.Main platform updateItem \
    --itemId 'jMlN3F4R' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ceLQxx4Z' \
    --body '{"appId": "oSipExNv", "appType": "DLC", "baseAppId": "4w1kPWfJ", "boothName": "ZfGbXuTC", "categoryPath": "XYzlIXHO", "clazz": "csfwhrjm", "displayOrder": 79, "entitlementType": "CONSUMABLE", "ext": {"Z3BZDP74": {}, "H69VBVVK": {}, "B4z6Zc5m": {}}, "features": ["4nasKlZH", "5jFZLyW6", "Khgx0tWH"], "flexible": true, "images": [{"as": "nBGRicGn", "caption": "LGCgQ01P", "height": 58, "imageUrl": "DDV7GnIa", "smallImageUrl": "U5oh4Ryu", "width": 73}, {"as": "URiCqvfk", "caption": "v5XA6pez", "height": 35, "imageUrl": "39bVPw5p", "smallImageUrl": "fKUjN5bU", "width": 1}, {"as": "mcXthzYJ", "caption": "Ie7cdKdh", "height": 66, "imageUrl": "dTa4Su8v", "smallImageUrl": "JoA0gihH", "width": 50}], "inventoryConfig": {"customAttributes": {"kVzzw0gC": {}, "QMAEPcEG": {}, "bS6ZAUdH": {}}, "serverCustomAttributes": {"eONj8t8b": {}, "dac7NUvk": {}, "UQkYzJmA": {}}, "slotUsed": 0}, "itemIds": ["veBMjgMU", "tUUKZARA", "qhwggkvg"], "itemQty": {"58UPdey9": 71, "sBVuujuh": 47, "6MZhCmfN": 47}, "itemType": "BUNDLE", "listable": true, "localizations": {"3GG8YX5K": {"description": "zGneBRPS", "localExt": {"Bgjt2jIQ": {}, "UDgVQyiJ": {}, "zSnlRlFB": {}}, "longDescription": "lWOnVXO8", "title": "ew2zgliM"}, "44fQuY16": {"description": "fMiTGGgg", "localExt": {"rQBINGra": {}, "fbNj5zvT": {}, "EdoYMf4K": {}}, "longDescription": "F1P6E0Wq", "title": "xmVo8JYe"}, "9UdmJPiu": {"description": "iFIXInWt", "localExt": {"4wVBYAvB": {}, "SOu1c8iV": {}, "UUyOe6AJ": {}}, "longDescription": "o1WoSxfx", "title": "GquPOBMA"}}, "lootBoxConfig": {"rewardCount": 84, "rewards": [{"lootBoxItems": [{"count": 92, "duration": 35, "endDate": "1976-04-14T00:00:00Z", "itemId": "nxY5YJO6", "itemSku": "HsjDkOod", "itemType": "wa8ZXnbm"}, {"count": 49, "duration": 83, "endDate": "1993-01-17T00:00:00Z", "itemId": "YSL55XAM", "itemSku": "lMHMy1Gt", "itemType": "7Fki4n2N"}, {"count": 11, "duration": 8, "endDate": "1972-09-19T00:00:00Z", "itemId": "fvtqwdo1", "itemSku": "Ui87xvrH", "itemType": "lyF9JI50"}], "name": "LmM4QDeT", "odds": 0.30103440116151814, "type": "PROBABILITY_GROUP", "weight": 5}, {"lootBoxItems": [{"count": 13, "duration": 29, "endDate": "1980-07-11T00:00:00Z", "itemId": "sMBu19Fb", "itemSku": "CHX8AYmr", "itemType": "2KFwLNsm"}, {"count": 93, "duration": 14, "endDate": "1987-11-03T00:00:00Z", "itemId": "QQapjWhd", "itemSku": "m2OADRWz", "itemType": "juHkVMZs"}, {"count": 13, "duration": 59, "endDate": "1982-02-19T00:00:00Z", "itemId": "bciHTXsQ", "itemSku": "vRvAq7hj", "itemType": "kG9IhBaM"}], "name": "4NSfEqyx", "odds": 0.887419829332349, "type": "REWARD_GROUP", "weight": 55}, {"lootBoxItems": [{"count": 86, "duration": 28, "endDate": "1972-01-02T00:00:00Z", "itemId": "xuM4riBH", "itemSku": "KCW3rqPh", "itemType": "aqlJIBOT"}, {"count": 61, "duration": 37, "endDate": "1988-02-16T00:00:00Z", "itemId": "ZIZHOQhS", "itemSku": "vFoqedeO", "itemType": "VF8Cx8UT"}, {"count": 43, "duration": 18, "endDate": "1982-03-01T00:00:00Z", "itemId": "n46cxxIF", "itemSku": "OkRznnIy", "itemType": "j3UzlUFO"}], "name": "L8RVpJHB", "odds": 0.6165225422199864, "type": "REWARD_GROUP", "weight": 39}], "rollFunction": "CUSTOM"}, "maxCount": 50, "maxCountPerUser": 51, "name": "EUC2tXl1", "optionBoxConfig": {"boxItems": [{"count": 9, "duration": 3, "endDate": "1991-09-14T00:00:00Z", "itemId": "wJCbVJR9", "itemSku": "lb0Bt1vO", "itemType": "viAllEpb"}, {"count": 72, "duration": 66, "endDate": "1982-10-22T00:00:00Z", "itemId": "lppmdJYT", "itemSku": "tR5jTiXP", "itemType": "Btm3b33B"}, {"count": 49, "duration": 0, "endDate": "1977-08-13T00:00:00Z", "itemId": "e9Wm23YT", "itemSku": "c7hJKiRg", "itemType": "SIhM5jYx"}]}, "purchasable": true, "recurring": {"cycle": "MONTHLY", "fixedFreeDays": 12, "fixedTrialCycles": 50, "graceDays": 67}, "regionData": {"bZ1Hfj0Z": [{"currencyCode": "5gYMYX2S", "currencyNamespace": "BFWzcIBd", "currencyType": "VIRTUAL", "discountAmount": 34, "discountExpireAt": "1982-11-29T00:00:00Z", "discountPercentage": 32, "discountPurchaseAt": "1999-11-12T00:00:00Z", "expireAt": "1998-08-28T00:00:00Z", "price": 72, "purchaseAt": "1995-05-14T00:00:00Z", "trialPrice": 39}, {"currencyCode": "vllUF6l3", "currencyNamespace": "Ap8TbpRh", "currencyType": "VIRTUAL", "discountAmount": 72, "discountExpireAt": "1991-05-15T00:00:00Z", "discountPercentage": 53, "discountPurchaseAt": "1981-12-17T00:00:00Z", "expireAt": "1972-03-05T00:00:00Z", "price": 71, "purchaseAt": "1988-11-24T00:00:00Z", "trialPrice": 10}, {"currencyCode": "TaF2v5iS", "currencyNamespace": "hEkSB7dk", "currencyType": "VIRTUAL", "discountAmount": 61, "discountExpireAt": "1979-10-28T00:00:00Z", "discountPercentage": 8, "discountPurchaseAt": "1982-08-27T00:00:00Z", "expireAt": "1996-09-07T00:00:00Z", "price": 29, "purchaseAt": "1972-04-24T00:00:00Z", "trialPrice": 27}], "wAttYv5U": [{"currencyCode": "lW6qHlOI", "currencyNamespace": "QmzrHHuX", "currencyType": "VIRTUAL", "discountAmount": 20, "discountExpireAt": "1980-08-26T00:00:00Z", "discountPercentage": 71, "discountPurchaseAt": "1987-01-08T00:00:00Z", "expireAt": "1998-07-11T00:00:00Z", "price": 75, "purchaseAt": "1990-07-07T00:00:00Z", "trialPrice": 34}, {"currencyCode": "hhhGcfWY", "currencyNamespace": "bzomwWyI", "currencyType": "VIRTUAL", "discountAmount": 6, "discountExpireAt": "1985-01-30T00:00:00Z", "discountPercentage": 66, "discountPurchaseAt": "1999-06-28T00:00:00Z", "expireAt": "1990-12-02T00:00:00Z", "price": 24, "purchaseAt": "1993-10-12T00:00:00Z", "trialPrice": 38}, {"currencyCode": "GrLhA7mW", "currencyNamespace": "snMN0mfh", "currencyType": "VIRTUAL", "discountAmount": 30, "discountExpireAt": "1973-07-29T00:00:00Z", "discountPercentage": 9, "discountPurchaseAt": "1979-02-02T00:00:00Z", "expireAt": "1975-12-16T00:00:00Z", "price": 60, "purchaseAt": "1998-11-22T00:00:00Z", "trialPrice": 65}], "g3brw3CD": [{"currencyCode": "tllAxRGr", "currencyNamespace": "biUAFU9T", "currencyType": "VIRTUAL", "discountAmount": 12, "discountExpireAt": "1999-07-20T00:00:00Z", "discountPercentage": 54, "discountPurchaseAt": "1983-11-11T00:00:00Z", "expireAt": "1987-11-12T00:00:00Z", "price": 58, "purchaseAt": "1988-02-29T00:00:00Z", "trialPrice": 2}, {"currencyCode": "82IUwygz", "currencyNamespace": "KW1wl47n", "currencyType": "REAL", "discountAmount": 29, "discountExpireAt": "1994-07-21T00:00:00Z", "discountPercentage": 21, "discountPurchaseAt": "1976-04-17T00:00:00Z", "expireAt": "1982-10-14T00:00:00Z", "price": 54, "purchaseAt": "1987-04-19T00:00:00Z", "trialPrice": 100}, {"currencyCode": "IwNhjGyN", "currencyNamespace": "UJLxFtW2", "currencyType": "REAL", "discountAmount": 24, "discountExpireAt": "1999-01-30T00:00:00Z", "discountPercentage": 90, "discountPurchaseAt": "1996-07-30T00:00:00Z", "expireAt": "1994-07-15T00:00:00Z", "price": 69, "purchaseAt": "1984-11-09T00:00:00Z", "trialPrice": 85}]}, "saleConfig": {"currencyCode": "5zpjXsU2", "price": 11}, "seasonType": "TIER", "sectionExclusive": false, "sellable": false, "sku": "jVm6I6x4", "stackable": true, "status": "ACTIVE", "tags": ["2OU0fAKU", "NbiwFFts", "L8WMOcVz"], "targetCurrencyCode": "Zym93uuk", "targetNamespace": "bMur1Et0", "thumbnailUrl": "5U6sRfmw", "useCount": 25}' \
    > test.out 2>&1
eval_tap $? 134 'UpdateItem' test.out

#- 135 DeleteItem
./ng net.accelbyte.sdk.cli.Main platform deleteItem \
    --itemId 'tNrWqcpG' \
    --namespace "$AB_NAMESPACE" \
    --featuresToCheck 'CAMPAIGN,CAMPAIGN,DLC' \
    --force  \
    --storeId 'Y6d3FPE4' \
    > test.out 2>&1
eval_tap $? 135 'DeleteItem' test.out

#- 136 AcquireItem
./ng net.accelbyte.sdk.cli.Main platform acquireItem \
    --itemId 'VyrIXh2F' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 30, "orderNo": "Uty9vn5R"}' \
    > test.out 2>&1
eval_tap $? 136 'AcquireItem' test.out

#- 137 GetApp
./ng net.accelbyte.sdk.cli.Main platform getApp \
    --itemId 'FeW4E0Fv' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId '8khUVKtm' \
    > test.out 2>&1
eval_tap $? 137 'GetApp' test.out

#- 138 UpdateApp
./ng net.accelbyte.sdk.cli.Main platform updateApp \
    --itemId 'vt3dpau7' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'KzdLphAX' \
    --body '{"carousel": [{"alt": "N5tYrstc", "previewUrl": "RoCQmgaG", "thumbnailUrl": "svrfeavY", "type": "video", "url": "XyqiHTbJ", "videoSource": "vimeo"}, {"alt": "VE9LUUHe", "previewUrl": "XmBvyma6", "thumbnailUrl": "2OcZm6Dm", "type": "image", "url": "qkJxpqpV", "videoSource": "vimeo"}, {"alt": "Xyrs4DlV", "previewUrl": "HZBPudQ7", "thumbnailUrl": "BEwc5utJ", "type": "video", "url": "4COrXDme", "videoSource": "generic"}], "developer": "KknWGQt0", "forumUrl": "76QmQKOp", "genres": ["MassivelyMultiplayer", "Adventure", "Adventure"], "localizations": {"AlVJbNm0": {"announcement": "qTYNEnCQ", "slogan": "PbXMokR4"}, "2WMdu5Dq": {"announcement": "0dg5al5v", "slogan": "kcme5bAK"}, "huJclS7Q": {"announcement": "AOBTfzYo", "slogan": "7dgToGW5"}}, "platformRequirements": {"GPQ1VRos": [{"additionals": "vWmjEri0", "directXVersion": "cv02ZIdf", "diskSpace": "YtppDlh0", "graphics": "Xc5SRjN9", "label": "YMHlmCXp", "osVersion": "Oo0tP2WE", "processor": "12AV0fHw", "ram": "oCQiqFJg", "soundCard": "DCsc1kmg"}, {"additionals": "h9lhKZgM", "directXVersion": "iIN0S5Hz", "diskSpace": "4J8p1wuP", "graphics": "2PMglvm6", "label": "s2Dd6Hiy", "osVersion": "ECebhkUz", "processor": "m1hqt7HL", "ram": "yjqbHAcq", "soundCard": "40Ci6MyT"}, {"additionals": "MlfWGByg", "directXVersion": "wDVp05mN", "diskSpace": "qRLMuRSr", "graphics": "ec0LnUzA", "label": "fUue2see", "osVersion": "d3WmfbFs", "processor": "h2EhGZf6", "ram": "xuyYGOmO", "soundCard": "YgLH5s6J"}], "fuia34Nj": [{"additionals": "QhprHhJl", "directXVersion": "8l0lpHXp", "diskSpace": "CWxlXkzw", "graphics": "03BOjFrp", "label": "sUtvwgSq", "osVersion": "fU6J8l8p", "processor": "JTuA0dzH", "ram": "VPxN4SiW", "soundCard": "w4wtjoBU"}, {"additionals": "SBAvm55g", "directXVersion": "gErelPU7", "diskSpace": "vojj8dIA", "graphics": "MziSupqw", "label": "M4SsCcTP", "osVersion": "cbqUHXWm", "processor": "B61hleB2", "ram": "3icTZVtG", "soundCard": "lwMIF8pV"}, {"additionals": "HvNpz3PY", "directXVersion": "QRdwll1l", "diskSpace": "PgRhaf7D", "graphics": "f6uFmRKH", "label": "pOiwBEbj", "osVersion": "UphGVnLf", "processor": "CzwSS2f4", "ram": "KCt1TahD", "soundCard": "iKuX90s0"}], "XQIlVDS9": [{"additionals": "Io7M9OK8", "directXVersion": "tZbG3eE6", "diskSpace": "NqvyxT76", "graphics": "o2vYTNwJ", "label": "l19z47uL", "osVersion": "fXqT6OlL", "processor": "RTWUv7n1", "ram": "DPenU7mt", "soundCard": "0mfNn4Se"}, {"additionals": "eMYPrsux", "directXVersion": "czyLMeu5", "diskSpace": "u5S2YVWa", "graphics": "dwArAnS3", "label": "FypcNkHP", "osVersion": "i3nMpN2Q", "processor": "SxgkVdYm", "ram": "VQTmg87T", "soundCard": "ippgKquS"}, {"additionals": "0sty7t56", "directXVersion": "rA0pa1WW", "diskSpace": "wzLhMAt5", "graphics": "8Wcsw8Qv", "label": "EmazNFK5", "osVersion": "cROpn2Lh", "processor": "JTH52I5g", "ram": "VhQ99rxg", "soundCard": "XYAxNWHW"}]}, "platforms": ["Windows", "Windows", "Windows"], "players": ["MMO", "LocalCoop", "LocalCoop"], "primaryGenre": "FreeToPlay", "publisher": "zirFYzMK", "releaseDate": "1984-01-18T00:00:00Z", "websiteUrl": "gI4A6e1n"}' \
    > test.out 2>&1
eval_tap $? 138 'UpdateApp' test.out

#- 139 DisableItem
./ng net.accelbyte.sdk.cli.Main platform disableItem \
    --itemId 'cATR3Aen' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'bKFw3CAZ' \
    --body '{"featuresToCheck": ["DLC", "ENTITLEMENT"]}' \
    > test.out 2>&1
eval_tap $? 139 'DisableItem' test.out

#- 140 GetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform getItemDynamicData \
    --itemId '8IIP6W6T' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 140 'GetItemDynamicData' test.out

#- 141 EnableItem
./ng net.accelbyte.sdk.cli.Main platform enableItem \
    --itemId 'hjA5lOLK' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'm6GZDxZY' \
    > test.out 2>&1
eval_tap $? 141 'EnableItem' test.out

#- 142 FeatureItem
./ng net.accelbyte.sdk.cli.Main platform featureItem \
    --feature 'RxeYRg40' \
    --itemId 'JhLFuktG' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'lWpRugUU' \
    > test.out 2>&1
eval_tap $? 142 'FeatureItem' test.out

#- 143 DefeatureItem
./ng net.accelbyte.sdk.cli.Main platform defeatureItem \
    --feature '56aFZXjh' \
    --itemId 'y02jLOzy' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'KNEWqcgN' \
    > test.out 2>&1
eval_tap $? 143 'DefeatureItem' test.out

#- 144 GetLocaleItem
./ng net.accelbyte.sdk.cli.Main platform getLocaleItem \
    --itemId 'UQUCAbOC' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'zHskrpp1' \
    --populateBundle  \
    --region 'uo3QANYc' \
    --storeId 'N74lbmUu' \
    > test.out 2>&1
eval_tap $? 144 'GetLocaleItem' test.out

#- 145 UpdateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform updateItemPurchaseCondition \
    --itemId 'G5t38oCX' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'DCqjjJY1' \
    --body '{"purchaseCondition": {"conditionGroups": [{"operator": "or", "predicates": [{"anyOf": 20, "code": "JXGUEPQz", "comparison": "isLessThan", "name": "fGAp945i", "predicateType": "StatisticCodePredicate", "value": "iNyxes00", "values": ["ZW1CwiID", "app0XcLX", "yXfotq3n"]}, {"anyOf": 48, "code": "qZxZMoGE", "comparison": "isNot", "name": "b8KfGAja", "predicateType": "EntitlementPredicate", "value": "es8zeAk5", "values": ["I80WczkS", "r7Lt2pzU", "A0JB8bL4"]}, {"anyOf": 55, "code": "nerdmJIf", "comparison": "isGreaterThanOrEqual", "name": "vDwDphgV", "predicateType": "SeasonTierPredicate", "value": "E9pXLx1K", "values": ["WEzEnloh", "Z9RAX5CJ", "ctAglr6b"]}]}, {"operator": "and", "predicates": [{"anyOf": 85, "code": "ANOCvfZa", "comparison": "isLessThan", "name": "n22ctTUx", "predicateType": "StatisticCodePredicate", "value": "a0Yj7ORp", "values": ["NRPZJ5X5", "WMqAg2rW", "FUIzxAXX"]}, {"anyOf": 10, "code": "70ngeeYP", "comparison": "isNot", "name": "xE7P59uq", "predicateType": "StatisticCodePredicate", "value": "0RrTFimP", "values": ["FROqVczt", "f6ZAqzJa", "2o04g0Sr"]}, {"anyOf": 18, "code": "38zbKKoX", "comparison": "isNot", "name": "z5W9a6vY", "predicateType": "EntitlementPredicate", "value": "15G96hbE", "values": ["J3Rkjirv", "9fTIiyd6", "Xb2hUWkc"]}]}, {"operator": "and", "predicates": [{"anyOf": 5, "code": "CNFXd6yi", "comparison": "isLessThanOrEqual", "name": "iFDAH6jW", "predicateType": "SeasonPassPredicate", "value": "xVv3Lu0Z", "values": ["YWXtewap", "SXzpqj3u", "V6YrNZI8"]}, {"anyOf": 3, "code": "G5mvsNRi", "comparison": "excludes", "name": "5Dz4TRoO", "predicateType": "StatisticCodePredicate", "value": "VA0z3Hb5", "values": ["ltJ5gcOY", "0byjCtie", "B4xhQ3FE"]}, {"anyOf": 80, "code": "hVg6RFyE", "comparison": "includes", "name": "J07HQCBX", "predicateType": "EntitlementPredicate", "value": "3aMqSw6h", "values": ["I02wPM1B", "wCYyI9TI", "xTrLiRnT"]}]}]}}' \
    > test.out 2>&1
eval_tap $? 145 'UpdateItemPurchaseCondition' test.out

#- 146 QueryItemReferences
./ng net.accelbyte.sdk.cli.Main platform queryItemReferences \
    --itemId '6HD26Q9N' \
    --namespace "$AB_NAMESPACE" \
    --featuresToCheck 'CATALOG,IAP,CAMPAIGN' \
    --storeId 'EzdJyCOA' \
    > test.out 2>&1
eval_tap $? 146 'QueryItemReferences' test.out

#- 147 ReturnItem
./ng net.accelbyte.sdk.cli.Main platform returnItem \
    --itemId 'zJs2mBzN' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "rfapg18n"}' \
    > test.out 2>&1
eval_tap $? 147 'ReturnItem' test.out

#- 148 QueryKeyGroups
./ng net.accelbyte.sdk.cli.Main platform queryKeyGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '48' \
    --name '7XZaACaQ' \
    --offset '64' \
    --tag 'GcwxkCeb' \
    > test.out 2>&1
eval_tap $? 148 'QueryKeyGroups' test.out

#- 149 CreateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform createKeyGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "u5OHkVPc", "name": "NJ7WokrU", "status": "ACTIVE", "tags": ["5t0T6Tmp", "pT2eLLLP", "CBB8Q9pr"]}' \
    > test.out 2>&1
eval_tap $? 149 'CreateKeyGroup' test.out

#- 150 GetKeyGroupByBoothName
eval_tap 0 150 'GetKeyGroupByBoothName # SKIP deprecated' test.out

#- 151 GetKeyGroup
./ng net.accelbyte.sdk.cli.Main platform getKeyGroup \
    --keyGroupId 'dLE0RCUu' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 151 'GetKeyGroup' test.out

#- 152 UpdateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform updateKeyGroup \
    --keyGroupId 'ZvajOxrB' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "w7KjiFme", "name": "PWOMlH7u", "status": "ACTIVE", "tags": ["MyRYPGRP", "a3GZCzGJ", "GqrsiNh2"]}' \
    > test.out 2>&1
eval_tap $? 152 'UpdateKeyGroup' test.out

#- 153 GetKeyGroupDynamic
./ng net.accelbyte.sdk.cli.Main platform getKeyGroupDynamic \
    --keyGroupId 'zUSpH8Kd' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 153 'GetKeyGroupDynamic' test.out

#- 154 ListKeys
./ng net.accelbyte.sdk.cli.Main platform listKeys \
    --keyGroupId 'DmKrnHrw' \
    --namespace "$AB_NAMESPACE" \
    --limit '2' \
    --offset '94' \
    --status 'ACTIVE' \
    > test.out 2>&1
eval_tap $? 154 'ListKeys' test.out

#- 155 UploadKeys
./ng net.accelbyte.sdk.cli.Main platform uploadKeys \
    --keyGroupId 'DG4JDw3b' \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 155 'UploadKeys' test.out

#- 156 QueryOrders
./ng net.accelbyte.sdk.cli.Main platform queryOrders \
    --namespace "$AB_NAMESPACE" \
    --endTime 'DhKGJSPt' \
    --limit '36' \
    --offset '95' \
    --orderNos 'VrhFAfvK,5aGHIYQm,7plh5jrB' \
    --sortBy '9n0QZwn3' \
    --startTime 'YJCTwhtL' \
    --status 'REFUND_FAILED' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 156 'QueryOrders' test.out

#- 157 GetOrderStatistics
./ng net.accelbyte.sdk.cli.Main platform getOrderStatistics \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 157 'GetOrderStatistics' test.out

#- 158 GetOrder
./ng net.accelbyte.sdk.cli.Main platform getOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'pJlKm6i4' \
    > test.out 2>&1
eval_tap $? 158 'GetOrder' test.out

#- 159 RefundOrder
./ng net.accelbyte.sdk.cli.Main platform refundOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'sMlrgQ6G' \
    --body '{"description": "vQ9wxRl4"}' \
    > test.out 2>&1
eval_tap $? 159 'RefundOrder' test.out

#- 160 GetPaymentCallbackConfig
eval_tap 0 160 'GetPaymentCallbackConfig # SKIP deprecated' test.out

#- 161 UpdatePaymentCallbackConfig
eval_tap 0 161 'UpdatePaymentCallbackConfig # SKIP deprecated' test.out

#- 162 GetPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentMerchantConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 162 'GetPaymentMerchantConfig' test.out

#- 163 UpdatePaymentDomainWhitelistConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentDomainWhitelistConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"domains": ["pRNlmy2U", "Ss6GlkVY", "LOLOe9wM"]}' \
    > test.out 2>&1
eval_tap $? 163 'UpdatePaymentDomainWhitelistConfig' test.out

#- 164 QueryPaymentNotifications
./ng net.accelbyte.sdk.cli.Main platform queryPaymentNotifications \
    --namespace "$AB_NAMESPACE" \
    --endDate 'wjRg0jE3' \
    --externalId 'Xcn6O9Tz' \
    --limit '50' \
    --notificationSource 'ADYEN' \
    --notificationType 'KHlXIxqa' \
    --offset '74' \
    --paymentOrderNo '4VaN5KxZ' \
    --startDate 'UT1q7X7c' \
    --status 'WARN' \
    > test.out 2>&1
eval_tap $? 164 'QueryPaymentNotifications' test.out

#- 165 QueryPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform queryPaymentOrders \
    --namespace "$AB_NAMESPACE" \
    --channel 'EXTERNAL' \
    --extTxId 'Z1X6o0mP' \
    --limit '72' \
    --offset '61' \
    --status 'REFUNDED' \
    > test.out 2>&1
eval_tap $? 165 'QueryPaymentOrders' test.out

#- 166 CreatePaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform createPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --body '{"currencyCode": "z7rxDOJL", "currencyNamespace": "QQhPJNzb", "customParameters": {"2ZmQmpxs": {}, "kArAinFm": {}, "sx4HLxRp": {}}, "description": "gQAbn9YQ", "extOrderNo": "kwc6e4ZU", "extUserId": "5XaZSxKQ", "itemType": "BUNDLE", "language": "XFxT", "metadata": {"Rjpr4gQ6": "et0Bxkhj", "GUE3Ns7t": "97H9mH5s", "E19lbwD9": "SB6TbLBS"}, "notifyUrl": "uE2vJgcc", "omitNotification": true, "platform": "727JSmB3", "price": 16, "recurringPaymentOrderNo": "AUrfGmgP", "region": "58fW0X8I", "returnUrl": "SYVzlpvn", "sandbox": true, "sku": "HnS7zPHF", "subscriptionId": "sNnjwQbD", "targetNamespace": "LDNTzye3", "targetUserId": "h3dIJ4cn", "title": "T7DhQ3KS"}' \
    > test.out 2>&1
eval_tap $? 166 'CreatePaymentOrderByDedicated' test.out

#- 167 ListExtOrderNoByExtTxId
./ng net.accelbyte.sdk.cli.Main platform listExtOrderNoByExtTxId \
    --namespace "$AB_NAMESPACE" \
    --extTxId 'LRSG3kfH' \
    > test.out 2>&1
eval_tap $? 167 'ListExtOrderNoByExtTxId' test.out

#- 168 GetPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'qkCdLfzx' \
    > test.out 2>&1
eval_tap $? 168 'GetPaymentOrder' test.out

#- 169 ChargePaymentOrder
./ng net.accelbyte.sdk.cli.Main platform chargePaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'gt5dBcvq' \
    --body '{"extTxId": "7abXRoR5", "paymentMethod": "rZ3WlANb", "paymentProvider": "WXPAY"}' \
    > test.out 2>&1
eval_tap $? 169 'ChargePaymentOrder' test.out

#- 170 RefundPaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform refundPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '9PubiMuX' \
    --body '{"description": "AX35pXOw"}' \
    > test.out 2>&1
eval_tap $? 170 'RefundPaymentOrderByDedicated' test.out

#- 171 SimulatePaymentOrderNotification
./ng net.accelbyte.sdk.cli.Main platform simulatePaymentOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'dmUVcMBV' \
    --body '{"amount": 63, "currencyCode": "BMwYIk7T", "notifyType": "REFUND", "paymentProvider": "WALLET", "salesTax": 64, "vat": 32}' \
    > test.out 2>&1
eval_tap $? 171 'SimulatePaymentOrderNotification' test.out

#- 172 GetPaymentOrderChargeStatus
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrderChargeStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'kLxwhUR3' \
    > test.out 2>&1
eval_tap $? 172 'GetPaymentOrderChargeStatus' test.out

#- 173 GetPsnEntitlementOwnership
./ng net.accelbyte.sdk.cli.Main platform getPsnEntitlementOwnership \
    --entitlementLabel '5ROMSMcc' \
    --namespace "$AB_NAMESPACE" \
    --body '{"accessToken": "2io2Tl2N", "serviceLabel": 56}' \
    > test.out 2>&1
eval_tap $? 173 'GetPsnEntitlementOwnership' test.out

#- 174 GetXboxEntitlementOwnership
./ng net.accelbyte.sdk.cli.Main platform getXboxEntitlementOwnership \
    --namespace "$AB_NAMESPACE" \
    --productSku 'FyqlG9l7' \
    --body '{"delegationToken": "8FJHSxGt", "sandboxId": "RBLGGIJJ"}' \
    > test.out 2>&1
eval_tap $? 174 'GetXboxEntitlementOwnership' test.out

#- 175 GetPlatformEntitlementConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformEntitlementConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Other' \
    > test.out 2>&1
eval_tap $? 175 'GetPlatformEntitlementConfig' test.out

#- 176 UpdatePlatformEntitlementConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformEntitlementConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'IOS' \
    --body '{"allowedPlatformOrigins": ["Steam", "System", "Xbox"]}' \
    > test.out 2>&1
eval_tap $? 176 'UpdatePlatformEntitlementConfig' test.out

#- 177 GetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'GooglePlay' \
    > test.out 2>&1
eval_tap $? 177 'GetPlatformWalletConfig' test.out

#- 178 UpdatePlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Epic' \
    --body '{"allowedBalanceOrigins": ["Steam", "Oculus", "GooglePlay"]}' \
    > test.out 2>&1
eval_tap $? 178 'UpdatePlatformWalletConfig' test.out

#- 179 ResetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform resetPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Playstation' \
    > test.out 2>&1
eval_tap $? 179 'ResetPlatformWalletConfig' test.out

#- 180 GetRevocationConfig
./ng net.accelbyte.sdk.cli.Main platform getRevocationConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 180 'GetRevocationConfig' test.out

#- 181 UpdateRevocationConfig
./ng net.accelbyte.sdk.cli.Main platform updateRevocationConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"entitlement": {"consumable": {"enabled": false, "strategy": "REVOKE_OR_REPORT"}, "durable": {"enabled": true, "strategy": "CUSTOM"}}, "wallet": {"enabled": false, "strategy": "ALWAYS_REVOKE"}}' \
    > test.out 2>&1
eval_tap $? 181 'UpdateRevocationConfig' test.out

#- 182 DeleteRevocationConfig
./ng net.accelbyte.sdk.cli.Main platform deleteRevocationConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 182 'DeleteRevocationConfig' test.out

#- 183 QueryRevocationHistories
./ng net.accelbyte.sdk.cli.Main platform queryRevocationHistories \
    --namespace "$AB_NAMESPACE" \
    --endTime 'NeRmeKCD' \
    --limit '63' \
    --offset '11' \
    --source 'IAP' \
    --startTime 'u4w1BaEq' \
    --status 'SUCCESS' \
    --transactionId 'fX8yIU2K' \
    --userId 'DYZLpWKq' \
    > test.out 2>&1
eval_tap $? 183 'QueryRevocationHistories' test.out

#- 184 GetRevocationPluginConfig
./ng net.accelbyte.sdk.cli.Main platform getRevocationPluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 184 'GetRevocationPluginConfig' test.out

#- 185 UpdateRevocationPluginConfig
./ng net.accelbyte.sdk.cli.Main platform updateRevocationPluginConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appConfig": {"appName": "rqqJzI6B"}, "customConfig": {"connectionType": "INSECURE", "grpcServerAddress": "M9tVPnS7"}, "extendType": "APP"}' \
    > test.out 2>&1
eval_tap $? 185 'UpdateRevocationPluginConfig' test.out

#- 186 DeleteRevocationPluginConfig
./ng net.accelbyte.sdk.cli.Main platform deleteRevocationPluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 186 'DeleteRevocationPluginConfig' test.out

#- 187 UploadRevocationPluginConfigCert
./ng net.accelbyte.sdk.cli.Main platform uploadRevocationPluginConfigCert \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 187 'UploadRevocationPluginConfigCert' test.out

#- 188 CreateReward
./ng net.accelbyte.sdk.cli.Main platform createReward \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "IDYCgGKX", "eventTopic": "caSAdeb5", "maxAwarded": 34, "maxAwardedPerUser": 16, "namespaceExpression": "zyE7c3zW", "rewardCode": "Vhs2so4U", "rewardConditions": [{"condition": "wPsI6Nwc", "conditionName": "0r8ljV5q", "eventName": "y2t5aXcd", "rewardItems": [{"duration": 31, "endDate": "1975-08-27T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "ZpaZ7Bnu", "quantity": 66, "sku": "YFciTJLA"}, {"duration": 82, "endDate": "1979-10-30T00:00:00Z", "identityType": "ITEM_ID", "itemId": "eoHmGlIh", "quantity": 60, "sku": "J43PF4pb"}, {"duration": 85, "endDate": "1992-05-23T00:00:00Z", "identityType": "ITEM_ID", "itemId": "njJlGK8z", "quantity": 79, "sku": "HPoFO3aA"}]}, {"condition": "AdV8NIe2", "conditionName": "7Zmxvyv3", "eventName": "6kk2Agnj", "rewardItems": [{"duration": 55, "endDate": "1993-04-20T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "uWCSA0lo", "quantity": 39, "sku": "M6RYFzbb"}, {"duration": 31, "endDate": "1972-12-04T00:00:00Z", "identityType": "ITEM_ID", "itemId": "9lhXatI9", "quantity": 26, "sku": "B8k4nHAc"}, {"duration": 55, "endDate": "1980-07-18T00:00:00Z", "identityType": "ITEM_ID", "itemId": "ScDPqFV4", "quantity": 87, "sku": "Ej9xZfck"}]}, {"condition": "IAA8Lwt9", "conditionName": "LR6WGPQI", "eventName": "cR0Jb6L1", "rewardItems": [{"duration": 70, "endDate": "1980-11-07T00:00:00Z", "identityType": "ITEM_ID", "itemId": "FEUXaaQB", "quantity": 30, "sku": "rZARlXa5"}, {"duration": 32, "endDate": "1979-07-29T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "fAHICsCG", "quantity": 26, "sku": "7ZDTr7k3"}, {"duration": 96, "endDate": "1979-05-19T00:00:00Z", "identityType": "ITEM_ID", "itemId": "MXpq0qe2", "quantity": 100, "sku": "i2gZI7Aa"}]}], "userIdExpression": "h5s5umi9"}' \
    > test.out 2>&1
eval_tap $? 188 'CreateReward' test.out

#- 189 QueryRewards
./ng net.accelbyte.sdk.cli.Main platform queryRewards \
    --namespace "$AB_NAMESPACE" \
    --eventTopic '85FKxb68' \
    --limit '8' \
    --offset '34' \
    --sortBy 'rewardCode:desc,namespace:asc,namespace' \
    > test.out 2>&1
eval_tap $? 189 'QueryRewards' test.out

#- 190 ExportRewards
./ng net.accelbyte.sdk.cli.Main platform exportRewards \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 190 'ExportRewards' test.out

#- 191 ImportRewards
./ng net.accelbyte.sdk.cli.Main platform importRewards \
    --namespace "$AB_NAMESPACE" \
    --replaceExisting  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 191 'ImportRewards' test.out

#- 192 GetReward
./ng net.accelbyte.sdk.cli.Main platform getReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'srJJNepy' \
    > test.out 2>&1
eval_tap $? 192 'GetReward' test.out

#- 193 UpdateReward
./ng net.accelbyte.sdk.cli.Main platform updateReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'tR1oOmhO' \
    --body '{"description": "kQfMhmha", "eventTopic": "DsIVLNnt", "maxAwarded": 47, "maxAwardedPerUser": 95, "namespaceExpression": "xBbyxKjw", "rewardCode": "CNGg7OmC", "rewardConditions": [{"condition": "Q8ZEdFD1", "conditionName": "0op6SHaN", "eventName": "SvYZMMal", "rewardItems": [{"duration": 78, "endDate": "1973-09-28T00:00:00Z", "identityType": "ITEM_ID", "itemId": "w29ZJwDt", "quantity": 8, "sku": "nRhoUa4Y"}, {"duration": 15, "endDate": "1976-08-10T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "D53SKPL2", "quantity": 36, "sku": "zQCIH02s"}, {"duration": 90, "endDate": "1991-06-05T00:00:00Z", "identityType": "ITEM_ID", "itemId": "N1kSEewE", "quantity": 20, "sku": "fcqFSsA8"}]}, {"condition": "UUoUJvHY", "conditionName": "Fob7H1gw", "eventName": "EwJJOAUI", "rewardItems": [{"duration": 67, "endDate": "1983-01-10T00:00:00Z", "identityType": "ITEM_ID", "itemId": "O8BMoXyR", "quantity": 18, "sku": "NTCoEN0a"}, {"duration": 71, "endDate": "1971-07-24T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "MSwjwckq", "quantity": 4, "sku": "zSJtnm2p"}, {"duration": 60, "endDate": "1976-10-06T00:00:00Z", "identityType": "ITEM_ID", "itemId": "IhfXMuTl", "quantity": 57, "sku": "CsJQ0l6l"}]}, {"condition": "4pzQF6gJ", "conditionName": "C7DBbkKk", "eventName": "68JgPgy8", "rewardItems": [{"duration": 87, "endDate": "1990-09-16T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "Mve9tTAW", "quantity": 41, "sku": "XEZ2F9Ki"}, {"duration": 43, "endDate": "1979-03-13T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "l6WU3klG", "quantity": 13, "sku": "v5LBgYYX"}, {"duration": 82, "endDate": "1975-08-04T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "5AhWUL8p", "quantity": 54, "sku": "thWqOOTC"}]}], "userIdExpression": "6qsVkwtj"}' \
    > test.out 2>&1
eval_tap $? 193 'UpdateReward' test.out

#- 194 DeleteReward
./ng net.accelbyte.sdk.cli.Main platform deleteReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'YvxkDYYX' \
    > test.out 2>&1
eval_tap $? 194 'DeleteReward' test.out

#- 195 CheckEventCondition
./ng net.accelbyte.sdk.cli.Main platform checkEventCondition \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'C7dld1MM' \
    --body '{"payload": {"7urpRei0": {}, "GlqIrP6T": {}, "ryPC0bIc": {}}}' \
    > test.out 2>&1
eval_tap $? 195 'CheckEventCondition' test.out

#- 196 DeleteRewardConditionRecord
./ng net.accelbyte.sdk.cli.Main platform deleteRewardConditionRecord \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'yG2K9FVr' \
    --body '{"conditionName": "DZ5kUvRE", "userId": "7bqk8nep"}' \
    > test.out 2>&1
eval_tap $? 196 'DeleteRewardConditionRecord' test.out

#- 197 QuerySections
./ng net.accelbyte.sdk.cli.Main platform querySections \
    --namespace "$AB_NAMESPACE" \
    --end '3H44McDw' \
    --limit '50' \
    --offset '6' \
    --start 'Pgs6enMI' \
    --storeId 'lIHSwIsD' \
    --viewId '6BlrO6Dy' \
    > test.out 2>&1
eval_tap $? 197 'QuerySections' test.out

#- 198 CreateSection
./ng net.accelbyte.sdk.cli.Main platform createSection \
    --namespace "$AB_NAMESPACE" \
    --storeId 'OYqlff2D' \
    --body '{"active": false, "displayOrder": 44, "endDate": "1983-05-31T00:00:00Z", "ext": {"47GITvFX": {}, "VMCKEa7Q": {}, "jZgtFR8W": {}}, "fixedPeriodRotationConfig": {"backfillType": "NONE", "duration": 23, "itemCount": 75, "rule": "SEQUENCE"}, "items": [{"id": "bL0x4bie", "sku": "02Nd092E"}, {"id": "0zYgTACM", "sku": "GJ2ZIHNa"}, {"id": "ZWAfNPwP", "sku": "PvUD65OS"}], "localizations": {"LIm3gZGC": {"description": "zCKlRMwG", "localExt": {"4ksR7HLq": {}, "ovSZnOHj": {}, "R7c4QIyv": {}}, "longDescription": "Zbo0rHZ4", "title": "MDWw67n6"}, "id9ntKs4": {"description": "BIkh6ofr", "localExt": {"oxTkPdB4": {}, "EBqVqiGv": {}, "T7WNnsbf": {}}, "longDescription": "8r0U9un0", "title": "T47tHexE"}, "tiMIFEV8": {"description": "DmoqB6aJ", "localExt": {"idQxjfaB": {}, "9SHDsCae": {}, "BmXf2g4E": {}}, "longDescription": "wqttGGdf", "title": "PeVJxajW"}}, "name": "YmjdRyHw", "rotationType": "NONE", "startDate": "1971-09-14T00:00:00Z", "viewId": "LpgpjSA3"}' \
    > test.out 2>&1
eval_tap $? 198 'CreateSection' test.out

#- 199 PurgeExpiredSection
./ng net.accelbyte.sdk.cli.Main platform purgeExpiredSection \
    --namespace "$AB_NAMESPACE" \
    --storeId '8R3PXlWp' \
    > test.out 2>&1
eval_tap $? 199 'PurgeExpiredSection' test.out

#- 200 GetSection
./ng net.accelbyte.sdk.cli.Main platform getSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId '8PQkSbGf' \
    --storeId 'WeaosiZh' \
    > test.out 2>&1
eval_tap $? 200 'GetSection' test.out

#- 201 UpdateSection
./ng net.accelbyte.sdk.cli.Main platform updateSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'orB0Ul9Q' \
    --storeId 'Iy6q5u7F' \
    --body '{"active": true, "displayOrder": 0, "endDate": "1980-02-12T00:00:00Z", "ext": {"1xKuUQmY": {}, "7e22uDbE": {}, "bB3yg9lP": {}}, "fixedPeriodRotationConfig": {"backfillType": "NONE", "duration": 2, "itemCount": 60, "rule": "SEQUENCE"}, "items": [{"id": "MQ6pmNTY", "sku": "41JM4Vwh"}, {"id": "P5r8C1EU", "sku": "Nu8Wi69k"}, {"id": "oAjfNjFK", "sku": "Xjubjpe4"}], "localizations": {"DHdoujSv": {"description": "Ve4VqRtH", "localExt": {"1Zx56MRn": {}, "qncw6HXG": {}, "hzF4AZfM": {}}, "longDescription": "apvtpmtD", "title": "aT5KxPSH"}, "TcsxhRER": {"description": "9gT52xc6", "localExt": {"S3NbVexB": {}, "9vcQrA50": {}, "HGD3PmEq": {}}, "longDescription": "ZT7AjoMs", "title": "h8cNAsBt"}, "LimGDhzz": {"description": "ddxI8g12", "localExt": {"0T7pPkwz": {}, "075SK29r": {}, "xh5jiXv7": {}}, "longDescription": "5HApFYT0", "title": "wtbQtJ8t"}}, "name": "bt4LtZSa", "rotationType": "CUSTOM", "startDate": "1983-08-30T00:00:00Z", "viewId": "DksWCtpQ"}' \
    > test.out 2>&1
eval_tap $? 201 'UpdateSection' test.out

#- 202 DeleteSection
./ng net.accelbyte.sdk.cli.Main platform deleteSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'etlUZTAO' \
    --storeId 'C9lfoN3U' \
    > test.out 2>&1
eval_tap $? 202 'DeleteSection' test.out

#- 203 ListStores
./ng net.accelbyte.sdk.cli.Main platform listStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 203 'ListStores' test.out

#- 204 CreateStore
./ng net.accelbyte.sdk.cli.Main platform createStore \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultLanguage": "1iBuJ6Bb", "defaultRegion": "2aXZrqgA", "description": "JxfGbWdE", "supportedLanguages": ["QmIkK7h0", "MbPwOsx0", "bsjRF1Kc"], "supportedRegions": ["VZZyLoWq", "oE0cShFP", "GgvZUwfu"], "title": "eQ9jrF20"}' \
    > test.out 2>&1
eval_tap $? 204 'CreateStore' test.out

#- 205 GetCatalogDefinition
./ng net.accelbyte.sdk.cli.Main platform getCatalogDefinition \
    --namespace "$AB_NAMESPACE" \
    --catalogType 'ITEM' \
    > test.out 2>&1
eval_tap $? 205 'GetCatalogDefinition' test.out

#- 206 DownloadCSVTemplates
./ng net.accelbyte.sdk.cli.Main platform downloadCSVTemplates \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 206 'DownloadCSVTemplates' test.out

#- 207 ExportStoreByCSV
./ng net.accelbyte.sdk.cli.Main platform exportStoreByCSV \
    --namespace "$AB_NAMESPACE" \
    --body '{"catalogType": "APP", "fieldsToBeIncluded": ["rfuFNxJb", "ID5UHUIY", "9Vsg3yhk"], "idsToBeExported": ["J5WbW3ZG", "sM6oPvLu", "UalFfyN6"], "storeId": "m0DIOSFX"}' \
    > test.out 2>&1
eval_tap $? 207 'ExportStoreByCSV' test.out

#- 208 ImportStore
eval_tap 0 208 'ImportStore # SKIP deprecated' test.out

#- 209 GetPublishedStore
./ng net.accelbyte.sdk.cli.Main platform getPublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 209 'GetPublishedStore' test.out

#- 210 DeletePublishedStore
./ng net.accelbyte.sdk.cli.Main platform deletePublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 210 'DeletePublishedStore' test.out

#- 211 GetPublishedStoreBackup
./ng net.accelbyte.sdk.cli.Main platform getPublishedStoreBackup \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 211 'GetPublishedStoreBackup' test.out

#- 212 RollbackPublishedStore
./ng net.accelbyte.sdk.cli.Main platform rollbackPublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 212 'RollbackPublishedStore' test.out

#- 213 GetStore
./ng net.accelbyte.sdk.cli.Main platform getStore \
    --namespace "$AB_NAMESPACE" \
    --storeId '3W6Nu31T' \
    > test.out 2>&1
eval_tap $? 213 'GetStore' test.out

#- 214 UpdateStore
./ng net.accelbyte.sdk.cli.Main platform updateStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'YcuvCBpu' \
    --body '{"defaultLanguage": "RtriZ0fl", "defaultRegion": "oWlVqXCS", "description": "Kt3YNGvT", "supportedLanguages": ["Er7wXeWo", "2ypqa8xN", "7i0d1P0j"], "supportedRegions": ["ZkRBvIvY", "mDNXeXl2", "8x1WIlwg"], "title": "8OKM0895"}' \
    > test.out 2>&1
eval_tap $? 214 'UpdateStore' test.out

#- 215 DeleteStore
./ng net.accelbyte.sdk.cli.Main platform deleteStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'DaC2PI2N' \
    > test.out 2>&1
eval_tap $? 215 'DeleteStore' test.out

#- 216 QueryChanges
./ng net.accelbyte.sdk.cli.Main platform queryChanges \
    --namespace "$AB_NAMESPACE" \
    --storeId 'g6xuchLK' \
    --action 'UPDATE' \
    --itemSku 'JdZbcda6' \
    --itemType 'LOOTBOX' \
    --limit '89' \
    --offset '17' \
    --selected  \
    --sortBy 'updatedAt,updatedAt:desc,createdAt' \
    --status 'PUBLISHED' \
    --type 'CATEGORY' \
    --updatedAtEnd 'jHDmw95R' \
    --updatedAtStart 'meE3AqIv' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 216 'QueryChanges' test.out

#- 217 PublishAll
./ng net.accelbyte.sdk.cli.Main platform publishAll \
    --namespace "$AB_NAMESPACE" \
    --storeId 'cPZK4xhk' \
    > test.out 2>&1
eval_tap $? 217 'PublishAll' test.out

#- 218 PublishSelected
./ng net.accelbyte.sdk.cli.Main platform publishSelected \
    --namespace "$AB_NAMESPACE" \
    --storeId 'JFfGWx6T' \
    > test.out 2>&1
eval_tap $? 218 'PublishSelected' test.out

#- 219 SelectAllRecords
./ng net.accelbyte.sdk.cli.Main platform selectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'qrCLp3l8' \
    > test.out 2>&1
eval_tap $? 219 'SelectAllRecords' test.out

#- 220 SelectAllRecordsByCriteria
./ng net.accelbyte.sdk.cli.Main platform selectAllRecordsByCriteria \
    --namespace "$AB_NAMESPACE" \
    --storeId 'w2yEK8ea' \
    --action 'DELETE' \
    --itemSku 'jU9BcpmX' \
    --itemType 'CODE' \
    --selected  \
    --type 'VIEW' \
    --updatedAtEnd 'Qws1vISB' \
    --updatedAtStart 'wiUvZr60' \
    > test.out 2>&1
eval_tap $? 220 'SelectAllRecordsByCriteria' test.out

#- 221 GetStatistic
./ng net.accelbyte.sdk.cli.Main platform getStatistic \
    --namespace "$AB_NAMESPACE" \
    --storeId '3GUlNFOF' \
    --action 'CREATE' \
    --itemSku 'dtFyYMkR' \
    --itemType 'COINS' \
    --type 'CATEGORY' \
    --updatedAtEnd 'BiqzAc04' \
    --updatedAtStart 'rkxtBuDv' \
    > test.out 2>&1
eval_tap $? 221 'GetStatistic' test.out

#- 222 UnselectAllRecords
./ng net.accelbyte.sdk.cli.Main platform unselectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'sALhpJHR' \
    > test.out 2>&1
eval_tap $? 222 'UnselectAllRecords' test.out

#- 223 SelectRecord
./ng net.accelbyte.sdk.cli.Main platform selectRecord \
    --changeId 'DlEGOvcO' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'J1R1UfcW' \
    > test.out 2>&1
eval_tap $? 223 'SelectRecord' test.out

#- 224 UnselectRecord
./ng net.accelbyte.sdk.cli.Main platform unselectRecord \
    --changeId 'RdES0SYt' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ubZ2SU3D' \
    > test.out 2>&1
eval_tap $? 224 'UnselectRecord' test.out

#- 225 CloneStore
./ng net.accelbyte.sdk.cli.Main platform cloneStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Sif3eiF8' \
    --targetStoreId '0TaMMRVX' \
    > test.out 2>&1
eval_tap $? 225 'CloneStore' test.out

#- 226 ExportStore
eval_tap 0 226 'ExportStore # SKIP deprecated' test.out

#- 227 QueryImportHistory
./ng net.accelbyte.sdk.cli.Main platform queryImportHistory \
    --namespace "$AB_NAMESPACE" \
    --storeId 'WzAjJJdx' \
    --end 'erEIy6XL' \
    --limit '55' \
    --offset '66' \
    --sortBy 'ZvZsHYit' \
    --start 'uXr8fauj' \
    --success  \
    > test.out 2>&1
eval_tap $? 227 'QueryImportHistory' test.out

#- 228 ImportStoreByCSV
./ng net.accelbyte.sdk.cli.Main platform importStoreByCSV \
    --namespace "$AB_NAMESPACE" \
    --storeId 'jJeOgZ8o' \
    --category 'tmp.dat' \
    --display 'tmp.dat' \
    --item 'tmp.dat' \
    --notes 'LWRAx3r6' \
    --section 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 228 'ImportStoreByCSV' test.out

#- 229 QuerySubscriptions
./ng net.accelbyte.sdk.cli.Main platform querySubscriptions \
    --namespace "$AB_NAMESPACE" \
    --chargeStatus 'CHARGED' \
    --itemId 'ZEqW4d60' \
    --limit '18' \
    --offset '7' \
    --sku 'QdTrRCR1' \
    --status 'EXPIRED' \
    --subscribedBy 'USER' \
    --userId 'NXfpKOc6' \
    > test.out 2>&1
eval_tap $? 229 'QuerySubscriptions' test.out

#- 230 RecurringChargeSubscription
./ng net.accelbyte.sdk.cli.Main platform recurringChargeSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'qkGLlFzd' \
    > test.out 2>&1
eval_tap $? 230 'RecurringChargeSubscription' test.out

#- 231 GetTicketDynamic
./ng net.accelbyte.sdk.cli.Main platform getTicketDynamic \
    --boothName 'SQ8DYZmz' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 231 'GetTicketDynamic' test.out

#- 232 DecreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform decreaseTicketSale \
    --boothName 'ud1qg2Nb' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "KVJUJBid"}' \
    > test.out 2>&1
eval_tap $? 232 'DecreaseTicketSale' test.out

#- 233 GetTicketBoothID
./ng net.accelbyte.sdk.cli.Main platform getTicketBoothID \
    --boothName 'AX48Suo5' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 233 'GetTicketBoothID' test.out

#- 234 IncreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform increaseTicketSale \
    --boothName '3hTvNhdx' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 76, "orderNo": "lM3HxOs8"}' \
    > test.out 2>&1
eval_tap $? 234 'IncreaseTicketSale' test.out

#- 235 Commit
./ng net.accelbyte.sdk.cli.Main platform commit \
    --namespace "$AB_NAMESPACE" \
    --body '{"actions": [{"operations": [{"creditPayload": {"balanceOrigin": "GooglePlay", "count": 51, "currencyCode": "6Iy6NT3m", "expireAt": "1995-06-21T00:00:00Z"}, "debitPayload": {"count": 2, "currencyCode": "CY7vXL5s", "walletPlatform": "Epic"}, "fulFillItemPayload": {"count": 35, "entitlementCollectionId": "RerTZHgN", "entitlementOrigin": "Oculus", "itemIdentity": "5B4D4JGD", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 68, "entitlementId": "DhEoGTn1"}, "type": "FULFILL_ITEM"}, {"creditPayload": {"balanceOrigin": "Xbox", "count": 93, "currencyCode": "JBSAfRQm", "expireAt": "1974-03-06T00:00:00Z"}, "debitPayload": {"count": 82, "currencyCode": "wO0kWWM7", "walletPlatform": "Xbox"}, "fulFillItemPayload": {"count": 62, "entitlementCollectionId": "abfiAQZA", "entitlementOrigin": "Steam", "itemIdentity": "ou9rgjhK", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 36, "entitlementId": "yjqQN4QI"}, "type": "FULFILL_ITEM"}, {"creditPayload": {"balanceOrigin": "Other", "count": 63, "currencyCode": "a0Ws3BWd", "expireAt": "1993-06-25T00:00:00Z"}, "debitPayload": {"count": 28, "currencyCode": "4MXZxmw8", "walletPlatform": "Nintendo"}, "fulFillItemPayload": {"count": 49, "entitlementCollectionId": "fTeQ800Q", "entitlementOrigin": "Twitch", "itemIdentity": "HoJljq5w", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 32, "entitlementId": "BTx9LBJ9"}, "type": "REVOKE_ENTITLEMENT"}], "userId": "EKfvBtgM"}, {"operations": [{"creditPayload": {"balanceOrigin": "Playstation", "count": 8, "currencyCode": "ubCJloFa", "expireAt": "1998-12-12T00:00:00Z"}, "debitPayload": {"count": 10, "currencyCode": "2nFPPjNs", "walletPlatform": "Nintendo"}, "fulFillItemPayload": {"count": 31, "entitlementCollectionId": "A8qNZRz8", "entitlementOrigin": "GooglePlay", "itemIdentity": "trKCk42F", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 63, "entitlementId": "ZCbAf55N"}, "type": "DEBIT_WALLET"}, {"creditPayload": {"balanceOrigin": "IOS", "count": 39, "currencyCode": "fUnRXkHI", "expireAt": "1981-06-28T00:00:00Z"}, "debitPayload": {"count": 71, "currencyCode": "emixLmIF", "walletPlatform": "Playstation"}, "fulFillItemPayload": {"count": 5, "entitlementCollectionId": "WEmbdQl5", "entitlementOrigin": "Playstation", "itemIdentity": "npCah8W4", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 82, "entitlementId": "71Czcygl"}, "type": "FULFILL_ITEM"}, {"creditPayload": {"balanceOrigin": "Steam", "count": 40, "currencyCode": "eg38A4Zm", "expireAt": "1996-09-22T00:00:00Z"}, "debitPayload": {"count": 100, "currencyCode": "3Qs6itvE", "walletPlatform": "Playstation"}, "fulFillItemPayload": {"count": 97, "entitlementCollectionId": "iWRthpg1", "entitlementOrigin": "Steam", "itemIdentity": "CM50pZus", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 26, "entitlementId": "LpN7PgDG"}, "type": "CREDIT_WALLET"}], "userId": "z0KA4kcW"}, {"operations": [{"creditPayload": {"balanceOrigin": "Other", "count": 42, "currencyCode": "Yo9h4lVf", "expireAt": "1986-09-27T00:00:00Z"}, "debitPayload": {"count": 23, "currencyCode": "8rxYW2V7", "walletPlatform": "Steam"}, "fulFillItemPayload": {"count": 33, "entitlementCollectionId": "kPChWb1x", "entitlementOrigin": "System", "itemIdentity": "w81ATFph", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 52, "entitlementId": "TGSYK1bc"}, "type": "REVOKE_ENTITLEMENT"}, {"creditPayload": {"balanceOrigin": "GooglePlay", "count": 100, "currencyCode": "yKndKtgd", "expireAt": "1973-05-13T00:00:00Z"}, "debitPayload": {"count": 68, "currencyCode": "xcuqGnzq", "walletPlatform": "GooglePlay"}, "fulFillItemPayload": {"count": 81, "entitlementCollectionId": "gybewXMF", "entitlementOrigin": "Epic", "itemIdentity": "OvFMXjqI", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 53, "entitlementId": "MH8xxOgp"}, "type": "CREDIT_WALLET"}, {"creditPayload": {"balanceOrigin": "GooglePlay", "count": 22, "currencyCode": "sKC8CnsA", "expireAt": "1999-01-11T00:00:00Z"}, "debitPayload": {"count": 62, "currencyCode": "ngHaNt4K", "walletPlatform": "Oculus"}, "fulFillItemPayload": {"count": 76, "entitlementCollectionId": "zxRb5Dsl", "entitlementOrigin": "Nintendo", "itemIdentity": "kFxbFrhs", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 46, "entitlementId": "hdS0pbvH"}, "type": "FULFILL_ITEM"}], "userId": "b7btxS32"}], "metadata": {"95VSyHiR": {}, "tU1LbcUG": {}, "KO6wA1Mv": {}}, "needPreCheck": true, "transactionId": "TWE5tRL0", "type": "7OMFE57r"}' \
    > test.out 2>&1
eval_tap $? 235 'Commit' test.out

#- 236 GetTradeHistoryByCriteria
./ng net.accelbyte.sdk.cli.Main platform getTradeHistoryByCriteria \
    --namespace "$AB_NAMESPACE" \
    --limit '91' \
    --offset '61' \
    --status 'INIT' \
    --type 'j15dgMDm' \
    --userId 'yJVvu4QF' \
    > test.out 2>&1
eval_tap $? 236 'GetTradeHistoryByCriteria' test.out

#- 237 GetTradeHistoryByTransactionId
./ng net.accelbyte.sdk.cli.Main platform getTradeHistoryByTransactionId \
    --namespace "$AB_NAMESPACE" \
    --transactionId 'uJ9O7Fof' \
    > test.out 2>&1
eval_tap $? 237 'GetTradeHistoryByTransactionId' test.out

#- 238 UnlockSteamUserAchievement
./ng net.accelbyte.sdk.cli.Main platform unlockSteamUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'vJEBvpbS' \
    --body '{"achievements": [{"id": "52rVpj0J", "value": 81}, {"id": "cfagmT5a", "value": 48}, {"id": "6iIN4Cbn", "value": 77}], "steamUserId": "A9oqIxPR"}' \
    > test.out 2>&1
eval_tap $? 238 'UnlockSteamUserAchievement' test.out

#- 239 GetXblUserAchievements
./ng net.accelbyte.sdk.cli.Main platform getXblUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'Rs4LGKLS' \
    --xboxUserId '5NuZyVkc' \
    > test.out 2>&1
eval_tap $? 239 'GetXblUserAchievements' test.out

#- 240 UpdateXblUserAchievement
./ng net.accelbyte.sdk.cli.Main platform updateXblUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'QkgYhXAY' \
    --body '{"achievements": [{"id": "BnsJAKXl", "percentComplete": 30}, {"id": "yqZVYzgm", "percentComplete": 90}, {"id": "w3IstXgU", "percentComplete": 26}], "serviceConfigId": "i6vEqzVN", "titleId": "N7rv4uTD", "xboxUserId": "8o8E4lX3"}' \
    > test.out 2>&1
eval_tap $? 240 'UpdateXblUserAchievement' test.out

#- 241 AnonymizeCampaign
./ng net.accelbyte.sdk.cli.Main platform anonymizeCampaign \
    --namespace "$AB_NAMESPACE" \
    --userId 'PKNK5eye' \
    > test.out 2>&1
eval_tap $? 241 'AnonymizeCampaign' test.out

#- 242 AnonymizeEntitlement
./ng net.accelbyte.sdk.cli.Main platform anonymizeEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'vQeqlRuK' \
    > test.out 2>&1
eval_tap $? 242 'AnonymizeEntitlement' test.out

#- 243 AnonymizeFulfillment
./ng net.accelbyte.sdk.cli.Main platform anonymizeFulfillment \
    --namespace "$AB_NAMESPACE" \
    --userId 'qHEpnP2x' \
    > test.out 2>&1
eval_tap $? 243 'AnonymizeFulfillment' test.out

#- 244 AnonymizeIntegration
./ng net.accelbyte.sdk.cli.Main platform anonymizeIntegration \
    --namespace "$AB_NAMESPACE" \
    --userId 'x8YYXI7y' \
    > test.out 2>&1
eval_tap $? 244 'AnonymizeIntegration' test.out

#- 245 AnonymizeOrder
./ng net.accelbyte.sdk.cli.Main platform anonymizeOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'TnCKbt8F' \
    > test.out 2>&1
eval_tap $? 245 'AnonymizeOrder' test.out

#- 246 AnonymizePayment
./ng net.accelbyte.sdk.cli.Main platform anonymizePayment \
    --namespace "$AB_NAMESPACE" \
    --userId 'p7Ot9QTK' \
    > test.out 2>&1
eval_tap $? 246 'AnonymizePayment' test.out

#- 247 AnonymizeRevocation
./ng net.accelbyte.sdk.cli.Main platform anonymizeRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId 'dBI4WcdO' \
    > test.out 2>&1
eval_tap $? 247 'AnonymizeRevocation' test.out

#- 248 AnonymizeSubscription
./ng net.accelbyte.sdk.cli.Main platform anonymizeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'nTIwKCXY' \
    > test.out 2>&1
eval_tap $? 248 'AnonymizeSubscription' test.out

#- 249 AnonymizeWallet
./ng net.accelbyte.sdk.cli.Main platform anonymizeWallet \
    --namespace "$AB_NAMESPACE" \
    --userId '0KAva0wY' \
    > test.out 2>&1
eval_tap $? 249 'AnonymizeWallet' test.out

#- 250 GetUserDLCByPlatform
./ng net.accelbyte.sdk.cli.Main platform getUserDLCByPlatform \
    --namespace "$AB_NAMESPACE" \
    --userId 'X85mccEO' \
    --type 'PSN' \
    > test.out 2>&1
eval_tap $? 250 'GetUserDLCByPlatform' test.out

#- 251 GetUserDLC
./ng net.accelbyte.sdk.cli.Main platform getUserDLC \
    --namespace "$AB_NAMESPACE" \
    --userId '6XzYlh1m' \
    --includeAllNamespaces  \
    --status 'REVOKED' \
    --type 'STEAM' \
    > test.out 2>&1
eval_tap $? 251 'GetUserDLC' test.out

#- 252 QueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'SMxj478U' \
    --activeOnly  \
    --appType 'SOFTWARE' \
    --collectionId 't6PNNEVM' \
    --entitlementClazz 'OPTIONBOX' \
    --entitlementName '6ecX9yj4' \
    --features 'Im3JBJsY,LO7LE5UM,eFLDwBpj' \
    --fuzzyMatchName  \
    --ignoreActiveDate  \
    --itemId 'PjDaciQg,bcgmVrNP,0HojPQUY' \
    --limit '44' \
    --offset '64' \
    --origin 'Nintendo' \
    > test.out 2>&1
eval_tap $? 252 'QueryUserEntitlements' test.out

#- 253 GrantUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform grantUserEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'BSAdl9L8' \
    --body '[{"collectionId": "9YPufNLt", "endDate": "1992-03-08T00:00:00Z", "grantedCode": "elb7PQj0", "itemId": "e5qHo05P", "itemNamespace": "dxgv9SxI", "language": "RugX-ab", "metadata": {"fAf9jShZ": {}, "Ms96K9DX": {}, "nDdVbTpR": {}}, "origin": "Epic", "quantity": 100, "region": "tsoipEeH", "source": "PROMOTION", "startDate": "1979-03-08T00:00:00Z", "storeId": "1bSquNfL"}, {"collectionId": "ab1Nb3dr", "endDate": "1998-03-24T00:00:00Z", "grantedCode": "ElpvCLuK", "itemId": "yJJphutI", "itemNamespace": "rEpnVFAw", "language": "rf-cIuZ-087", "metadata": {"vGNk8C33": {}, "JyZdw7PL": {}, "jCbR2UKj": {}}, "origin": "System", "quantity": 71, "region": "UA4ClwVN", "source": "IAP", "startDate": "1971-09-30T00:00:00Z", "storeId": "NSCHkFXx"}, {"collectionId": "hCSjlWHq", "endDate": "1979-10-30T00:00:00Z", "grantedCode": "SXGNueig", "itemId": "mr9hhl2C", "itemNamespace": "DkgOSalg", "language": "qu_FXct", "metadata": {"xmCWed3h": {}, "BT9sU1ku": {}, "LV6kQiNv": {}}, "origin": "Oculus", "quantity": 3, "region": "7LTwFmiF", "source": "OTHER", "startDate": "1983-05-07T00:00:00Z", "storeId": "uF8bUaze"}]' \
    > test.out 2>&1
eval_tap $? 253 'GrantUserEntitlement' test.out

#- 254 GetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'iCYdtZwT' \
    --activeOnly  \
    --appId 'zCnm4HS8' \
    > test.out 2>&1
eval_tap $? 254 'GetUserAppEntitlementByAppId' test.out

#- 255 QueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'kPQhPSxJ' \
    --activeOnly  \
    --limit '13' \
    --offset '94' \
    --appType 'SOFTWARE' \
    > test.out 2>&1
eval_tap $? 255 'QueryUserEntitlementsByAppType' test.out

#- 256 GetUserEntitlementsByIds
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementsByIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'bafQ93ia' \
    --ids 'N8pbIH0F,0HU8d9LI,P9fot94K' \
    > test.out 2>&1
eval_tap $? 256 'GetUserEntitlementsByIds' test.out

#- 257 GetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'a5haf9ZU' \
    --activeOnly  \
    --entitlementClazz 'APP' \
    --platform 'ZghPV7M1' \
    --itemId 'hDHG9gqk' \
    > test.out 2>&1
eval_tap $? 257 'GetUserEntitlementByItemId' test.out

#- 258 GetUserActiveEntitlementsByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserActiveEntitlementsByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'CFiLaj0d' \
    --ids 'bu0KJvbD,Bi7d9Q3I,gAyeeYNk' \
    --platform 'RYxUpsTv' \
    > test.out 2>&1
eval_tap $? 258 'GetUserActiveEntitlementsByItemIds' test.out

#- 259 GetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'x4MnLGMC' \
    --activeOnly  \
    --entitlementClazz 'SUBSCRIPTION' \
    --platform 'dSUXJX5l' \
    --sku 'BFRqqBwj' \
    > test.out 2>&1
eval_tap $? 259 'GetUserEntitlementBySku' test.out

#- 260 ExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId '7Vs0w2Ic' \
    --appIds 'i9hTuckC,fgNXi8PT,D7Lh63r5' \
    --itemIds 'usbyNpm6,YC0ZqP2w,EYbwiW5u' \
    --platform 'ru2KPq72' \
    --skus 'a2BU897Y,IKd9fGPl,9GJDhYpx' \
    > test.out 2>&1
eval_tap $? 260 'ExistsAnyUserActiveEntitlement' test.out

#- 261 ExistsAnyUserActiveEntitlementByItemIds
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlementByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'G3VBYIEZ' \
    --platform 'sfoR1Dp0' \
    --itemIds 'jJjeY2DV,pKgvhIdk,dw7EJeyF' \
    > test.out 2>&1
eval_tap $? 261 'ExistsAnyUserActiveEntitlementByItemIds' test.out

#- 262 GetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'CcIqUJso' \
    --appId 'GMnZ3pDm' \
    > test.out 2>&1
eval_tap $? 262 'GetUserAppEntitlementOwnershipByAppId' test.out

#- 263 GetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'zx8Idgzz' \
    --entitlementClazz 'SUBSCRIPTION' \
    --platform 'RBybr9jT' \
    --itemId 'Cs4t27k4' \
    > test.out 2>&1
eval_tap $? 263 'GetUserEntitlementOwnershipByItemId' test.out

#- 264 GetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'nTrzWCPi' \
    --ids 'eDtuw7lp,jtJXkngp,RSHbrqnY' \
    --platform 'niDTc7mF' \
    > test.out 2>&1
eval_tap $? 264 'GetUserEntitlementOwnershipByItemIds' test.out

#- 265 GetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'JtGRLbhD' \
    --entitlementClazz 'ENTITLEMENT' \
    --platform 'ftrClgiZ' \
    --sku 'L1qxREKo' \
    > test.out 2>&1
eval_tap $? 265 'GetUserEntitlementOwnershipBySku' test.out

#- 266 RevokeAllEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeAllEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId '7cHM2tie' \
    > test.out 2>&1
eval_tap $? 266 'RevokeAllEntitlements' test.out

#- 267 RevokeUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'JQf1HkEH' \
    --entitlementIds 'dxoHAQbd' \
    > test.out 2>&1
eval_tap $? 267 'RevokeUserEntitlements' test.out

#- 268 GetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlement \
    --entitlementId 'tq7Ae29s' \
    --namespace "$AB_NAMESPACE" \
    --userId 'cgW6Al2R' \
    > test.out 2>&1
eval_tap $? 268 'GetUserEntitlement' test.out

#- 269 UpdateUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform updateUserEntitlement \
    --entitlementId 'eLxqlPuM' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ALPculu8' \
    --body '{"collectionId": "RsVFmpVL", "endDate": "1989-08-02T00:00:00Z", "nullFieldList": ["wQyrqydL", "HvDoqqAy", "ez52JTLL"], "origin": "Other", "reason": "t4aKYa1N", "startDate": "1975-07-17T00:00:00Z", "status": "ACTIVE", "useCount": 17}' \
    > test.out 2>&1
eval_tap $? 269 'UpdateUserEntitlement' test.out

#- 270 ConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform consumeUserEntitlement \
    --entitlementId 'roggGG1z' \
    --namespace "$AB_NAMESPACE" \
    --userId 'XnIQBUe1' \
    --body '{"metadata": {"sm8cqrsf": {}, "SlbnEfkV": {}, "feNLXZrY": {}}, "options": ["J5SUpdXw", "QDIQmu7F", "2cCVKKFj"], "platform": "xcqiFbJL", "requestId": "yz9lCKua", "useCount": 43}' \
    > test.out 2>&1
eval_tap $? 270 'ConsumeUserEntitlement' test.out

#- 271 DisableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform disableUserEntitlement \
    --entitlementId 'oLiFmcSp' \
    --namespace "$AB_NAMESPACE" \
    --userId 'HY6ciPA4' \
    > test.out 2>&1
eval_tap $? 271 'DisableUserEntitlement' test.out

#- 272 EnableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform enableUserEntitlement \
    --entitlementId 'o32vPc4q' \
    --namespace "$AB_NAMESPACE" \
    --userId 'iwNVpzHS' \
    > test.out 2>&1
eval_tap $? 272 'EnableUserEntitlement' test.out

#- 273 GetUserEntitlementHistories
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementHistories \
    --entitlementId 'NRvtjtRM' \
    --namespace "$AB_NAMESPACE" \
    --userId '9N44QPQL' \
    > test.out 2>&1
eval_tap $? 273 'GetUserEntitlementHistories' test.out

#- 274 RevokeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlement \
    --entitlementId 'zowurSPU' \
    --namespace "$AB_NAMESPACE" \
    --userId 'DnSeB2qq' \
    --body '{"metadata": {"tw4nAado": {}, "EyJ4rGYn": {}, "GItwdZLF": {}}}' \
    > test.out 2>&1
eval_tap $? 274 'RevokeUserEntitlement' test.out

#- 275 RevokeUserEntitlementByUseCount
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlementByUseCount \
    --entitlementId 'afCs4ujc' \
    --namespace "$AB_NAMESPACE" \
    --userId 'oqwonQCz' \
    --body '{"reason": "y5ih4MlB", "useCount": 66}' \
    > test.out 2>&1
eval_tap $? 275 'RevokeUserEntitlementByUseCount' test.out

#- 276 PreCheckRevokeUserEntitlementByUseCount
./ng net.accelbyte.sdk.cli.Main platform preCheckRevokeUserEntitlementByUseCount \
    --entitlementId '2CQdmsMw' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZNCvp8UY' \
    --quantity '1' \
    > test.out 2>&1
eval_tap $? 276 'PreCheckRevokeUserEntitlementByUseCount' test.out

#- 277 RevokeUseCount
eval_tap 0 277 'RevokeUseCount # SKIP deprecated' test.out

#- 278 SellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform sellUserEntitlement \
    --entitlementId 'HWnuKWaS' \
    --namespace "$AB_NAMESPACE" \
    --userId 'tA2xJLgx' \
    --body '{"platform": "goTNZZWw", "requestId": "kVd9Knsu", "useCount": 87}' \
    > test.out 2>&1
eval_tap $? 278 'SellUserEntitlement' test.out

#- 279 FulfillItem
./ng net.accelbyte.sdk.cli.Main platform fulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'oXoKtska' \
    --body '{"duration": 32, "endDate": "1977-11-14T00:00:00Z", "entitlementCollectionId": "jb4hyRhn", "entitlementOrigin": "Twitch", "itemId": "2rTYIUa7", "itemSku": "la4Hx2PU", "language": "vpbG5Vvk", "metadata": {"9Bga6m41": {}, "mdg54kBt": {}, "SByOvnHE": {}}, "order": {"currency": {"currencyCode": "DYuH50bU", "currencySymbol": "FPmydRhB", "currencyType": "VIRTUAL", "decimals": 97, "namespace": "negkDnTe"}, "ext": {"8AlATfGf": {}, "dkfthcME": {}, "eHcgILwS": {}}, "free": true}, "orderNo": "lm5OPawF", "origin": "Other", "overrideBundleItemQty": {"8Lg7Dk6L": 28, "rBWflihR": 7, "vZGQiGKu": 85}, "quantity": 57, "region": "qSdoMsDv", "source": "OTHER", "startDate": "1978-10-31T00:00:00Z", "storeId": "XHX0fMXn"}' \
    > test.out 2>&1
eval_tap $? 279 'FulfillItem' test.out

#- 280 RedeemCode
./ng net.accelbyte.sdk.cli.Main platform redeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'J9euh8ih' \
    --body '{"code": "qmNyfd1K", "language": "lL_kXqO", "region": "k3rQtm6H"}' \
    > test.out 2>&1
eval_tap $? 280 'RedeemCode' test.out

#- 281 PreCheckFulfillItem
./ng net.accelbyte.sdk.cli.Main platform preCheckFulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'V0JEnHjE' \
    --body '{"itemId": "HqkG4lZF", "itemSku": "1cLVCeb2", "quantity": 76}' \
    > test.out 2>&1
eval_tap $? 281 'PreCheckFulfillItem' test.out

#- 282 FulfillRewards
./ng net.accelbyte.sdk.cli.Main platform fulfillRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'PDLn4xzp' \
    --body '{"entitlementCollectionId": "qzZ76IAd", "entitlementOrigin": "Other", "metadata": {"rd1qvQNU": {}, "urVTxFzD": {}, "M92B1y76": {}}, "origin": "Twitch", "rewards": [{"currency": {"currencyCode": "qvDSjLjr", "namespace": "Ve4tz3xp"}, "item": {"itemId": "k9laK8AJ", "itemName": "yEQ8xBK2", "itemSku": "JeiiDvLB", "itemType": "28LqZRgu"}, "quantity": 73, "type": "ITEM"}, {"currency": {"currencyCode": "KlLSjJgx", "namespace": "nWGOaxTQ"}, "item": {"itemId": "KgrofP4z", "itemName": "9ZZ8iWpL", "itemSku": "aMhfZ0r1", "itemType": "buRCGnnH"}, "quantity": 91, "type": "ITEM"}, {"currency": {"currencyCode": "UtvzCKTE", "namespace": "nXpejVen"}, "item": {"itemId": "b1bpWf8R", "itemName": "atAoBCqX", "itemSku": "JTMTCMmr", "itemType": "8KjqLZdZ"}, "quantity": 46, "type": "CURRENCY"}], "source": "REDEEM_CODE", "transactionId": "anM2BjgW"}' \
    > test.out 2>&1
eval_tap $? 282 'FulfillRewards' test.out

#- 283 QueryUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId '7wZLnRCS' \
    --endTime 'BZyvpWyp' \
    --limit '29' \
    --offset '2' \
    --productId 'FCKEKUbR' \
    --startTime 'eNxTsqPi' \
    --status 'VERIFIED' \
    --type 'APPLE' \
    > test.out 2>&1
eval_tap $? 283 'QueryUserIAPOrders' test.out

#- 284 QueryAllUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryAllUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'kufm8p90' \
    > test.out 2>&1
eval_tap $? 284 'QueryAllUserIAPOrders' test.out

#- 285 QueryUserIAPConsumeHistory
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPConsumeHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'VLbOJDMZ' \
    --endTime '0XFA2NBa' \
    --limit '61' \
    --offset '50' \
    --startTime 'joucmW7n' \
    --status 'PENDING' \
    --type 'TWITCH' \
    > test.out 2>&1
eval_tap $? 285 'QueryUserIAPConsumeHistory' test.out

#- 286 MockFulfillIAPItem
./ng net.accelbyte.sdk.cli.Main platform mockFulfillIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'KWa6JDcw' \
    --body '{"itemIdentityType": "ITEM_SKU", "language": "Kma-fYgc", "productId": "9Z2eQ3Od", "region": "9RCsWsLw", "transactionId": "RLfHGy4C", "type": "STADIA"}' \
    > test.out 2>&1
eval_tap $? 286 'MockFulfillIAPItem' test.out

#- 287 AdminGetIAPOrderLineItems
./ng net.accelbyte.sdk.cli.Main platform adminGetIAPOrderLineItems \
    --iapOrderNo 'p0xC9Nzh' \
    --namespace "$AB_NAMESPACE" \
    --userId 'KfKcUswf' \
    > test.out 2>&1
eval_tap $? 287 'AdminGetIAPOrderLineItems' test.out

#- 288 AdminSyncSteamAbnormalTransaction
./ng net.accelbyte.sdk.cli.Main platform adminSyncSteamAbnormalTransaction \
    --namespace "$AB_NAMESPACE" \
    --userId 'izhqFXtq' \
    > test.out 2>&1
eval_tap $? 288 'AdminSyncSteamAbnormalTransaction' test.out

#- 289 AdminSyncSteamIAPByTransaction
./ng net.accelbyte.sdk.cli.Main platform adminSyncSteamIAPByTransaction \
    --namespace "$AB_NAMESPACE" \
    --userId 'jZOx89at' \
    --body '{"orderId": "9tCRnB1c"}' \
    > test.out 2>&1
eval_tap $? 289 'AdminSyncSteamIAPByTransaction' test.out

#- 290 QueryUserThirdPartySubscription
./ng net.accelbyte.sdk.cli.Main platform queryUserThirdPartySubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'G8Ycy45t' \
    --activeOnly  \
    --groupId 'Ie8nu56M' \
    --limit '93' \
    --offset '72' \
    --platform 'XBOX' \
    --productId 'e9JIR9Lv' \
    > test.out 2>&1
eval_tap $? 290 'QueryUserThirdPartySubscription' test.out

#- 291 GetThirdPartyPlatformSubscriptionOwnershipByGroupId
./ng net.accelbyte.sdk.cli.Main platform getThirdPartyPlatformSubscriptionOwnershipByGroupId \
    --namespace "$AB_NAMESPACE" \
    --platform 'PLAYSTATION' \
    --userId 'FSfSvp3f' \
    --groupId 'SHjRwKvl' \
    > test.out 2>&1
eval_tap $? 291 'GetThirdPartyPlatformSubscriptionOwnershipByGroupId' test.out

#- 292 GetThirdPartyPlatformSubscriptionOwnershipByProductId
./ng net.accelbyte.sdk.cli.Main platform getThirdPartyPlatformSubscriptionOwnershipByProductId \
    --namespace "$AB_NAMESPACE" \
    --platform 'APPLE' \
    --userId 'TksxoJti' \
    --productId 'LTjvluHP' \
    > test.out 2>&1
eval_tap $? 292 'GetThirdPartyPlatformSubscriptionOwnershipByProductId' test.out

#- 293 QueryUserThirdPartySubscriptionTransactions
./ng net.accelbyte.sdk.cli.Main platform queryUserThirdPartySubscriptionTransactions \
    --namespace "$AB_NAMESPACE" \
    --userId '3QnuOnvQ' \
    --activeOnly  \
    --groupId '866cZ55P' \
    --limit '25' \
    --offset '24' \
    --platform 'TWITCH' \
    --productId 'ki47B2hP' \
    > test.out 2>&1
eval_tap $? 293 'QueryUserThirdPartySubscriptionTransactions' test.out

#- 294 GetThirdPartySubscriptionDetails
./ng net.accelbyte.sdk.cli.Main platform getThirdPartySubscriptionDetails \
    --id 'Jr2WNuam' \
    --namespace "$AB_NAMESPACE" \
    --userId 'PHG6uXjI' \
    > test.out 2>&1
eval_tap $? 294 'GetThirdPartySubscriptionDetails' test.out

#- 295 GetSubscriptionHistory
./ng net.accelbyte.sdk.cli.Main platform getSubscriptionHistory \
    --id 'cfDNoa88' \
    --namespace "$AB_NAMESPACE" \
    --userId 'XjlEWQgv' \
    --limit '15' \
    --offset '78' \
    > test.out 2>&1
eval_tap $? 295 'GetSubscriptionHistory' test.out

#- 296 SyncSubscriptionTransaction
./ng net.accelbyte.sdk.cli.Main platform syncSubscriptionTransaction \
    --id 'eTNeKRsD' \
    --namespace "$AB_NAMESPACE" \
    --userId '5wib9GTQ' \
    > test.out 2>&1
eval_tap $? 296 'SyncSubscriptionTransaction' test.out

#- 297 GetThirdPartyUserSubscriptionDetails
./ng net.accelbyte.sdk.cli.Main platform getThirdPartyUserSubscriptionDetails \
    --id '9S0dtljf' \
    --namespace "$AB_NAMESPACE" \
    --userId '6vNbpHqs' \
    > test.out 2>&1
eval_tap $? 297 'GetThirdPartyUserSubscriptionDetails' test.out

#- 298 SyncSubscription
./ng net.accelbyte.sdk.cli.Main platform syncSubscription \
    --id 'iO8Jn8PJ' \
    --namespace "$AB_NAMESPACE" \
    --userId '2BTP44LH' \
    > test.out 2>&1
eval_tap $? 298 'SyncSubscription' test.out

#- 299 QueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'I3DX48jZ' \
    --discounted  \
    --itemId '0ARIS4cg' \
    --limit '19' \
    --offset '5' \
    --status 'REFUNDING' \
    > test.out 2>&1
eval_tap $? 299 'QueryUserOrders' test.out

#- 300 AdminCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform adminCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'gMVnXN8c' \
    --body '{"currencyCode": "SixJmIqF", "currencyNamespace": "ZVPQDZVf", "discountCodes": ["B9dnoUHv", "aN4ktZLE", "iMMxlpEi"], "discountedPrice": 24, "entitlementPlatform": "Steam", "ext": {"32R1t2mz": {}, "uFquPmyu": {}, "Rp5WX9me": {}}, "itemId": "1edE47Wm", "language": "PMtIKi7Z", "options": {"skipPriceValidation": false}, "platform": "Playstation", "price": 50, "quantity": 37, "region": "q85rVAn1", "returnUrl": "7thA4Eri", "sandbox": false, "sectionId": "iBHXCyQ2"}' \
    > test.out 2>&1
eval_tap $? 300 'AdminCreateUserOrder' test.out

#- 301 CountOfPurchasedItem
./ng net.accelbyte.sdk.cli.Main platform countOfPurchasedItem \
    --namespace "$AB_NAMESPACE" \
    --userId '6jjeQXvO' \
    --itemId 'zghjH4Kq' \
    > test.out 2>&1
eval_tap $? 301 'CountOfPurchasedItem' test.out

#- 302 GetUserOrder
./ng net.accelbyte.sdk.cli.Main platform getUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'sQCQGGPC' \
    --userId 'ZvLJ7wk2' \
    > test.out 2>&1
eval_tap $? 302 'GetUserOrder' test.out

#- 303 UpdateUserOrderStatus
./ng net.accelbyte.sdk.cli.Main platform updateUserOrderStatus \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'vOQaiA4H' \
    --userId 'XWUla7hv' \
    --body '{"status": "CLOSED", "statusReason": "FpCNAExe"}' \
    > test.out 2>&1
eval_tap $? 303 'UpdateUserOrderStatus' test.out

#- 304 FulfillUserOrder
./ng net.accelbyte.sdk.cli.Main platform fulfillUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'BsI6syzn' \
    --userId '1B15w9kd' \
    > test.out 2>&1
eval_tap $? 304 'FulfillUserOrder' test.out

#- 305 GetUserOrderGrant
eval_tap 0 305 'GetUserOrderGrant # SKIP deprecated' test.out

#- 306 GetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform getUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'O4kMs2mS' \
    --userId 'vLv0AA9z' \
    > test.out 2>&1
eval_tap $? 306 'GetUserOrderHistories' test.out

#- 307 ProcessUserOrderNotification
./ng net.accelbyte.sdk.cli.Main platform processUserOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'GxHtjK0m' \
    --userId 'dPCXGJjY' \
    --body '{"additionalData": {"cardSummary": "kPD7vOis"}, "authorisedTime": "1999-10-02T00:00:00Z", "chargebackReversedTime": "1990-12-12T00:00:00Z", "chargebackTime": "1992-07-06T00:00:00Z", "chargedTime": "1990-11-04T00:00:00Z", "createdTime": "1996-10-09T00:00:00Z", "currency": {"currencyCode": "i7NoHoHs", "currencySymbol": "9TJCrAVX", "currencyType": "VIRTUAL", "decimals": 7, "namespace": "D0wDufI4"}, "customParameters": {"xMy9pbeK": {}, "Xjp9ftYJ": {}, "2MJuMHVo": {}}, "extOrderNo": "mmoUln0U", "extTxId": "i0Bq3SNQ", "extUserId": "ZtPttaCE", "issuedAt": "1988-08-04T00:00:00Z", "metadata": {"BuMREJLn": "54OO0G9u", "QcKRlH3R": "cInwZlTU", "NehUc7h6": "ej3v7j3p"}, "namespace": "yrwEdP0k", "nonceStr": "3zJgo0MM", "paymentData": {"discountAmount": 32, "discountCode": "XX21N9jE", "subtotalPrice": 69, "tax": 48, "totalPrice": 61}, "paymentMethod": "nJR9yH6x", "paymentMethodFee": 52, "paymentOrderNo": "XhctBOVG", "paymentProvider": "WALLET", "paymentProviderFee": 60, "paymentStationUrl": "jCgIrnkt", "price": 56, "refundedTime": "1998-03-16T00:00:00Z", "salesTax": 0, "sandbox": false, "sku": "CCJ1shb7", "status": "CHARGE_FAILED", "statusReason": "0h6aETrC", "subscriptionId": "BVM4Vjyo", "subtotalPrice": 92, "targetNamespace": "pnn9KMtn", "targetUserId": "FjU3GzzI", "tax": 65, "totalPrice": 65, "totalTax": 31, "txEndTime": "1984-05-22T00:00:00Z", "type": "SBiIfNYj", "userId": "v2cnj1Sp", "vat": 5}' \
    > test.out 2>&1
eval_tap $? 307 'ProcessUserOrderNotification' test.out

#- 308 DownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform downloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'tvrKcY7Q' \
    --userId 'HrDd9SZV' \
    > test.out 2>&1
eval_tap $? 308 'DownloadUserOrderReceipt' test.out

#- 309 CreateUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform createUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'LFz6VvKa' \
    --body '{"currencyCode": "t3bhhNsq", "currencyNamespace": "eqtmPelM", "customParameters": {"StjBWER0": {}, "oygV0yEY": {}, "0UX5Mc9Q": {}}, "description": "NKzNfmYz", "extOrderNo": "JBtwzAWy", "extUserId": "cGgrn9Yb", "itemType": "SUBSCRIPTION", "language": "iFl-BTzv", "metadata": {"qk2t8lo4": "EMtMyuqk", "rDIuKwbw": "eD0P7sZf", "ymSVh4FW": "Ox5sketg"}, "notifyUrl": "3NuGwMiV", "omitNotification": false, "platform": "PLIhkah3", "price": 50, "recurringPaymentOrderNo": "1khC3CDP", "region": "cHdURs8K", "returnUrl": "gV8XayLy", "sandbox": true, "sku": "60hgyTOQ", "subscriptionId": "1QbXzQdd", "title": "0WD90Q1O"}' \
    > test.out 2>&1
eval_tap $? 309 'CreateUserPaymentOrder' test.out

#- 310 RefundUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform refundUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'fUV1kMeO' \
    --userId 'tTwq46xy' \
    --body '{"description": "uuT5ENj3"}' \
    > test.out 2>&1
eval_tap $? 310 'RefundUserPaymentOrder' test.out

#- 311 GetUserPlatformAccountClosureHistories
./ng net.accelbyte.sdk.cli.Main platform getUserPlatformAccountClosureHistories \
    --namespace "$AB_NAMESPACE" \
    --userId 'IgGCUEnv' \
    > test.out 2>&1
eval_tap $? 311 'GetUserPlatformAccountClosureHistories' test.out

#- 312 ApplyUserRedemption
./ng net.accelbyte.sdk.cli.Main platform applyUserRedemption \
    --namespace "$AB_NAMESPACE" \
    --userId 'dGSDgI7s' \
    --body '{"code": "ipKwLBx0", "orderNo": "DFC9MyJW"}' \
    > test.out 2>&1
eval_tap $? 312 'ApplyUserRedemption' test.out

#- 313 DoRevocation
./ng net.accelbyte.sdk.cli.Main platform doRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId 'NkOrx4NS' \
    --body '{"meta": {"pkItKqJT": {}, "VJFxmBqv": {}, "GYe8Ibqj": {}}, "reason": "Am1YdcC1", "requestId": "gwnzhw94", "revokeEntries": [{"currency": {"balanceOrigin": "Playstation", "currencyCode": "i6AbU4Fv", "namespace": "fgxSkrxC"}, "entitlement": {"entitlementId": "qGv0Uy9Q"}, "item": {"entitlementOrigin": "Oculus", "itemIdentity": "AThILl5d", "itemIdentityType": "ITEM_ID", "origin": "Xbox"}, "quantity": 21, "type": "ITEM"}, {"currency": {"balanceOrigin": "GooglePlay", "currencyCode": "Si77IMiF", "namespace": "kz5Qvabf"}, "entitlement": {"entitlementId": "uY0bqdRa"}, "item": {"entitlementOrigin": "Steam", "itemIdentity": "LcJBE0WE", "itemIdentityType": "ITEM_ID", "origin": "Xbox"}, "quantity": 31, "type": "ENTITLEMENT"}, {"currency": {"balanceOrigin": "Oculus", "currencyCode": "NG6wJxFA", "namespace": "JCVzT6uA"}, "entitlement": {"entitlementId": "NgQfqlHq"}, "item": {"entitlementOrigin": "Oculus", "itemIdentity": "pIsIqs99", "itemIdentityType": "ITEM_SKU", "origin": "IOS"}, "quantity": 17, "type": "ENTITLEMENT"}], "source": "IAP", "transactionId": "6wuLuqv6"}' \
    > test.out 2>&1
eval_tap $? 313 'DoRevocation' test.out

#- 314 RegisterXblSessions
./ng net.accelbyte.sdk.cli.Main platform registerXblSessions \
    --namespace "$AB_NAMESPACE" \
    --userId 'SE4DLRna' \
    --body '{"gameSessionId": "AyQEoZzV", "payload": {"3RdAe7F3": {}, "AKoUxW6G": {}, "FoaUxMZe": {}}, "scid": "ALXrfWA7", "sessionTemplateName": "Bb5UtSTs"}' \
    > test.out 2>&1
eval_tap $? 314 'RegisterXblSessions' test.out

#- 315 QueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform queryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'ltiDwJEx' \
    --chargeStatus 'NEVER' \
    --itemId 'HkuEpnoT' \
    --limit '31' \
    --offset '79' \
    --sku 'kyCQxMO9' \
    --status 'CANCELLED' \
    --subscribedBy 'PLATFORM' \
    > test.out 2>&1
eval_tap $? 315 'QueryUserSubscriptions' test.out

#- 316 GetUserSubscriptionActivities
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionActivities \
    --namespace "$AB_NAMESPACE" \
    --userId 'lmUc9aIU' \
    --excludeSystem  \
    --limit '41' \
    --offset '82' \
    --subscriptionId 'edKtfAHy' \
    > test.out 2>&1
eval_tap $? 316 'GetUserSubscriptionActivities' test.out

#- 317 PlatformSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform platformSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'G2o1xOrL' \
    --body '{"grantDays": 33, "itemId": "9xl9cn1D", "language": "B6DVZ5af", "reason": "hVphrWi1", "region": "lQ9xd2h3", "source": "tl3K9Qm4"}' \
    > test.out 2>&1
eval_tap $? 317 'PlatformSubscribeSubscription' test.out

#- 318 CheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform checkUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'KBbELX8Y' \
    --itemId '4evO1H7K' \
    > test.out 2>&1
eval_tap $? 318 'CheckUserSubscriptionSubscribableByItemId' test.out

#- 319 GetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform getUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'nFZ6L8pu' \
    --userId 'T6C9sFwa' \
    > test.out 2>&1
eval_tap $? 319 'GetUserSubscription' test.out

#- 320 DeleteUserSubscription
./ng net.accelbyte.sdk.cli.Main platform deleteUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'HtJxWF7a' \
    --userId 'P9RyXT7a' \
    > test.out 2>&1
eval_tap $? 320 'DeleteUserSubscription' test.out

#- 321 CancelSubscription
./ng net.accelbyte.sdk.cli.Main platform cancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '4fAbhmZb' \
    --userId 'MWQaSj2w' \
    --force  \
    --body '{"immediate": true, "reason": "nfQMfyGz"}' \
    > test.out 2>&1
eval_tap $? 321 'CancelSubscription' test.out

#- 322 GrantDaysToSubscription
./ng net.accelbyte.sdk.cli.Main platform grantDaysToSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'D1Sb6UJu' \
    --userId 'haRtMMxW' \
    --body '{"grantDays": 20, "reason": "VFGK17eR"}' \
    > test.out 2>&1
eval_tap $? 322 'GrantDaysToSubscription' test.out

#- 323 GetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '6cmQWnhS' \
    --userId 'WMmO4Owv' \
    --excludeFree  \
    --limit '98' \
    --offset '60' \
    > test.out 2>&1
eval_tap $? 323 'GetUserSubscriptionBillingHistories' test.out

#- 324 ProcessUserSubscriptionNotification
./ng net.accelbyte.sdk.cli.Main platform processUserSubscriptionNotification \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'MyHuba42' \
    --userId '1uGqvI0R' \
    --body '{"additionalData": {"cardSummary": "7OdNMSRB"}, "authorisedTime": "1999-01-08T00:00:00Z", "chargebackReversedTime": "1978-05-08T00:00:00Z", "chargebackTime": "1995-06-14T00:00:00Z", "chargedTime": "1985-11-09T00:00:00Z", "createdTime": "1971-07-31T00:00:00Z", "currency": {"currencyCode": "DtGaC9Gh", "currencySymbol": "xuehLT0C", "currencyType": "REAL", "decimals": 33, "namespace": "j7CM3aNV"}, "customParameters": {"jYkNVdbK": {}, "GDNCW09W": {}, "Z5KrYVeJ": {}}, "extOrderNo": "7MZoP8hP", "extTxId": "9wtiLKK1", "extUserId": "W9b11OOp", "issuedAt": "1980-12-14T00:00:00Z", "metadata": {"zjy3x5jH": "pJDlVLV4", "vgNey6dE": "qI4ARodY", "O7EtwBrZ": "PcenyunK"}, "namespace": "pc2mlt3r", "nonceStr": "ldXvJkRq", "paymentData": {"discountAmount": 12, "discountCode": "Qf9RBY5P", "subtotalPrice": 69, "tax": 16, "totalPrice": 29}, "paymentMethod": "r6dleOKK", "paymentMethodFee": 84, "paymentOrderNo": "EmzkWML5", "paymentProvider": "WALLET", "paymentProviderFee": 5, "paymentStationUrl": "0hFbtz8d", "price": 34, "refundedTime": "1996-09-16T00:00:00Z", "salesTax": 71, "sandbox": false, "sku": "0gT76m0o", "status": "REQUEST_FOR_INFORMATION", "statusReason": "4AP2jw0G", "subscriptionId": "AS7MunXB", "subtotalPrice": 17, "targetNamespace": "ndzuhdP7", "targetUserId": "SktYJBYH", "tax": 3, "totalPrice": 5, "totalTax": 30, "txEndTime": "1979-08-13T00:00:00Z", "type": "enyQOqML", "userId": "ChcvhMNo", "vat": 32}' \
    > test.out 2>&1
eval_tap $? 324 'ProcessUserSubscriptionNotification' test.out

#- 325 AcquireUserTicket
./ng net.accelbyte.sdk.cli.Main platform acquireUserTicket \
    --boothName 'sZSuAkN6' \
    --namespace "$AB_NAMESPACE" \
    --userId 'IYUGyW1q' \
    --body '{"count": 96, "orderNo": "89EFEiVR"}' \
    > test.out 2>&1
eval_tap $? 325 'AcquireUserTicket' test.out

#- 326 QueryUserCurrencyWallets
./ng net.accelbyte.sdk.cli.Main platform queryUserCurrencyWallets \
    --namespace "$AB_NAMESPACE" \
    --userId 'wiwIk2Hg' \
    > test.out 2>&1
eval_tap $? 326 'QueryUserCurrencyWallets' test.out

#- 327 DebitUserWalletByCurrencyCode
./ng net.accelbyte.sdk.cli.Main platform debitUserWalletByCurrencyCode \
    --currencyCode 'w4TNUTAI' \
    --namespace "$AB_NAMESPACE" \
    --userId '0w08mBEU' \
    --body '{"allowOverdraft": true, "amount": 61, "balanceOrigin": "Other", "balanceSource": "TRADE", "metadata": {"FPmVKZf1": {}, "LNUdVQT6": {}, "Vh55kSNV": {}}, "reason": "o0JOeoUD"}' \
    > test.out 2>&1
eval_tap $? 327 'DebitUserWalletByCurrencyCode' test.out

#- 328 ListUserCurrencyTransactions
./ng net.accelbyte.sdk.cli.Main platform listUserCurrencyTransactions \
    --currencyCode 'nM8LvS6L' \
    --namespace "$AB_NAMESPACE" \
    --userId 'kGhGfJwx' \
    --limit '76' \
    --offset '16' \
    > test.out 2>&1
eval_tap $? 328 'ListUserCurrencyTransactions' test.out

#- 329 CheckBalance
./ng net.accelbyte.sdk.cli.Main platform checkBalance \
    --currencyCode 'nk3mxhMX' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ee51cZIo' \
    --request '{"amount": 8, "debitBalanceSource": "ORDER_REVOCATION", "metadata": {"aSttoGQl": {}, "kimTFqKT": {}, "lNbCtNOh": {}}, "reason": "TEiLUyvG", "walletPlatform": "Oculus"}' \
    > test.out 2>&1
eval_tap $? 329 'CheckBalance' test.out

#- 330 CheckWallet
eval_tap 0 330 'CheckWallet # SKIP deprecated' test.out

#- 331 CreditUserWallet
./ng net.accelbyte.sdk.cli.Main platform creditUserWallet \
    --currencyCode 'Y14E5fKR' \
    --namespace "$AB_NAMESPACE" \
    --userId 'tB3kTr2h' \
    --body '{"amount": 67, "expireAt": "1997-12-21T00:00:00Z", "metadata": {"x0KbNQPo": {}, "IWljv32L": {}, "U4KWsziD": {}}, "origin": "Steam", "reason": "2nDKFntC", "source": "ACHIEVEMENT"}' \
    > test.out 2>&1
eval_tap $? 331 'CreditUserWallet' test.out

#- 332 DebitByWalletPlatform
./ng net.accelbyte.sdk.cli.Main platform debitByWalletPlatform \
    --currencyCode 'r7QS5yDp' \
    --namespace "$AB_NAMESPACE" \
    --userId 'u42gRjKE' \
    --request '{"amount": 2, "debitBalanceSource": "OTHER", "metadata": {"hhbd9u3T": {}, "YK6I2vnu": {}, "AxeH76qt": {}}, "reason": "O8lIfzCK", "walletPlatform": "IOS"}' \
    > test.out 2>&1
eval_tap $? 332 'DebitByWalletPlatform' test.out

#- 333 PayWithUserWallet
./ng net.accelbyte.sdk.cli.Main platform payWithUserWallet \
    --currencyCode 'O9vnOWWU' \
    --namespace "$AB_NAMESPACE" \
    --userId 'VRSm6FnB' \
    --body '{"amount": 53, "metadata": {"QZldSffq": {}, "xpp07xFc": {}, "MLa7zk5j": {}}, "walletPlatform": "Steam"}' \
    > test.out 2>&1
eval_tap $? 333 'PayWithUserWallet' test.out

#- 334 GetUserWallet
eval_tap 0 334 'GetUserWallet # SKIP deprecated' test.out

#- 335 DebitUserWallet
eval_tap 0 335 'DebitUserWallet # SKIP deprecated' test.out

#- 336 DisableUserWallet
eval_tap 0 336 'DisableUserWallet # SKIP deprecated' test.out

#- 337 EnableUserWallet
eval_tap 0 337 'EnableUserWallet # SKIP deprecated' test.out

#- 338 ListUserWalletTransactions
eval_tap 0 338 'ListUserWalletTransactions # SKIP deprecated' test.out

#- 339 ListViews
./ng net.accelbyte.sdk.cli.Main platform listViews \
    --namespace "$AB_NAMESPACE" \
    --storeId 'YLInyt02' \
    > test.out 2>&1
eval_tap $? 339 'ListViews' test.out

#- 340 CreateView
./ng net.accelbyte.sdk.cli.Main platform createView \
    --namespace "$AB_NAMESPACE" \
    --storeId 'cFCHSpzg' \
    --body '{"displayOrder": 65, "localizations": {"iY5eLFfX": {"description": "B8HS0kDC", "localExt": {"43TceTKm": {}, "h3vwPMnB": {}, "BlIyj4ur": {}}, "longDescription": "pw2bYwjZ", "title": "uAte1JvQ"}, "GyYjPByY": {"description": "i1QTviyg", "localExt": {"vCCQbIMq": {}, "wdYMYa8S": {}, "kEnzP5eJ": {}}, "longDescription": "eT8TrCZs", "title": "hWToJTJD"}, "ktrezAZZ": {"description": "lreUj7AB", "localExt": {"m0zFlJ53": {}, "yHsdeEID": {}, "ByegP8CH": {}}, "longDescription": "oSiDKFMa", "title": "fq8WNLGf"}}, "name": "5QoMwMxS"}' \
    > test.out 2>&1
eval_tap $? 340 'CreateView' test.out

#- 341 GetView
./ng net.accelbyte.sdk.cli.Main platform getView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'hGfCFYPr' \
    --storeId 'xNH1Jld4' \
    > test.out 2>&1
eval_tap $? 341 'GetView' test.out

#- 342 UpdateView
./ng net.accelbyte.sdk.cli.Main platform updateView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'MiCgyBll' \
    --storeId '6FkD20g9' \
    --body '{"displayOrder": 22, "localizations": {"mm6zh544": {"description": "rou62mK3", "localExt": {"eDlyncB0": {}, "m4d6zlck": {}, "nUJhK9iT": {}}, "longDescription": "im5Zxa2w", "title": "oaj9LpZF"}, "zwsgqV0E": {"description": "c5pJCRvP", "localExt": {"8dRd15ed": {}, "aDq8683Q": {}, "nD5QyX1A": {}}, "longDescription": "QAdbJiyd", "title": "2JDiYNv1"}, "7ngOwmCL": {"description": "fZiZR30t", "localExt": {"uEjqCani": {}, "YLdTe2ZK": {}, "1YHoHp2A": {}}, "longDescription": "uF2rPrxO", "title": "eZJOluHf"}}, "name": "ISqicD7j"}' \
    > test.out 2>&1
eval_tap $? 342 'UpdateView' test.out

#- 343 DeleteView
./ng net.accelbyte.sdk.cli.Main platform deleteView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'GZ2UtF1v' \
    --storeId '18kiw2xE' \
    > test.out 2>&1
eval_tap $? 343 'DeleteView' test.out

#- 344 GetWalletConfig
./ng net.accelbyte.sdk.cli.Main platform getWalletConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 344 'GetWalletConfig' test.out

#- 345 UpdateWalletConfig
./ng net.accelbyte.sdk.cli.Main platform updateWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"enablePaidForVCExpiration": false}' \
    > test.out 2>&1
eval_tap $? 345 'UpdateWalletConfig' test.out

#- 346 QueryWallets
eval_tap 0 346 'QueryWallets # SKIP deprecated' test.out

#- 347 BulkCredit
./ng net.accelbyte.sdk.cli.Main platform bulkCredit \
    --namespace "$AB_NAMESPACE" \
    --body '[{"creditRequest": {"amount": 19, "expireAt": "1996-06-02T00:00:00Z", "metadata": {"bIg3Kji2": {}, "Qcjp3T5N": {}, "u1SqNIYZ": {}}, "origin": "Oculus", "reason": "E3X8CisH", "source": "GIFT"}, "currencyCode": "t1mghkbl", "userIds": ["kr6aAXGD", "xYVBFSeV", "5eaYJySn"]}, {"creditRequest": {"amount": 62, "expireAt": "1987-07-16T00:00:00Z", "metadata": {"YGeqMOTa": {}, "y0W7IPIo": {}, "a8o8iiEw": {}}, "origin": "GooglePlay", "reason": "sXFCoII7", "source": "GIFT"}, "currencyCode": "bCfh1PI6", "userIds": ["h0VL98Ys", "bj1jkXOr", "MqEIZ3RV"]}, {"creditRequest": {"amount": 38, "expireAt": "1996-05-27T00:00:00Z", "metadata": {"6Kl3J0f3": {}, "U8PfDvMs": {}, "X3zvVZeH": {}}, "origin": "Twitch", "reason": "2q8tISoP", "source": "PURCHASE"}, "currencyCode": "NRrXVcZp", "userIds": ["Ti3bTk8Z", "P1K0Mxrd", "fUS0p9WH"]}]' \
    > test.out 2>&1
eval_tap $? 347 'BulkCredit' test.out

#- 348 BulkDebit
./ng net.accelbyte.sdk.cli.Main platform bulkDebit \
    --namespace "$AB_NAMESPACE" \
    --body '[{"currencyCode": "3AEsDgDA", "request": {"allowOverdraft": true, "amount": 70, "balanceOrigin": "System", "balanceSource": "EXPIRATION", "metadata": {"ceSIAmLN": {}, "h69CShSh": {}, "SyHoOcQM": {}}, "reason": "33doxDII"}, "userIds": ["Fa3gggyP", "VqQZdbhg", "8YeYuT6p"]}, {"currencyCode": "ERHkzPFH", "request": {"allowOverdraft": false, "amount": 39, "balanceOrigin": "System", "balanceSource": "IAP_REVOCATION", "metadata": {"OvYsGuen": {}, "vLIMwwTT": {}, "5k7th32J": {}}, "reason": "Wp59LVwB"}, "userIds": ["VDrzuClP", "E3jzEvvB", "HGMXxepq"]}, {"currencyCode": "zLvMiB3R", "request": {"allowOverdraft": false, "amount": 98, "balanceOrigin": "IOS", "balanceSource": "DLC_REVOCATION", "metadata": {"2cAJ52Ep": {}, "XBh5C7lE": {}, "iVPfivYB": {}}, "reason": "ZDyau8vT"}, "userIds": ["JvQkRI1l", "qdR16OF8", "7uHEA9ds"]}]' \
    > test.out 2>&1
eval_tap $? 348 'BulkDebit' test.out

#- 349 GetWallet
eval_tap 0 349 'GetWallet # SKIP deprecated' test.out

#- 350 SyncOrders
./ng net.accelbyte.sdk.cli.Main platform syncOrders \
    --nextEvaluatedKey '0mNy4oAC' \
    --end 'hkrBydKK' \
    --start 'cafMx3ke' \
    > test.out 2>&1
eval_tap $? 350 'SyncOrders' test.out

#- 351 TestAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfig \
    --sandbox  \
    --body '{"allowedPaymentMethods": ["pd1DxlGm", "oab7LZG5", "pkvmbJfE"], "apiKey": "yjgq7dhc", "authoriseAsCapture": false, "blockedPaymentMethods": ["nXoTXTaG", "BZRujoy1", "UfKEdPqy"], "clientKey": "wLz6vqT2", "dropInSettings": "bqq1xw47", "liveEndpointUrlPrefix": "o2oZnYmS", "merchantAccount": "MEMc5DFc", "notificationHmacKey": "OLpr2kiG", "notificationPassword": "ZGDglYE3", "notificationUsername": "KrVQx58i", "returnUrl": "p8d5N39Z", "settings": "46NNANH2"}' \
    > test.out 2>&1
eval_tap $? 351 'TestAdyenConfig' test.out

#- 352 TestAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfig \
    --sandbox  \
    --body '{"appId": "m7e5Ybh1", "privateKey": "8zcx764q", "publicKey": "4PT262iD", "returnUrl": "VfDtzaUY"}' \
    > test.out 2>&1
eval_tap $? 352 'TestAliPayConfig' test.out

#- 353 TestCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfig \
    --sandbox  \
    --body '{"publicKey": "Itf3kcvW", "secretKey": "RMuaSCkl"}' \
    > test.out 2>&1
eval_tap $? 353 'TestCheckoutConfig' test.out

#- 354 DebugMatchedPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentMerchantConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'tYG6JuaS' \
    > test.out 2>&1
eval_tap $? 354 'DebugMatchedPaymentMerchantConfig' test.out

#- 355 TestNeonPayConfig
./ng net.accelbyte.sdk.cli.Main platform testNeonPayConfig \
    --sandbox  \
    --body '{"apiKey": "ioAi6wo9", "webhookSecretKey": "wlSAjGiS"}' \
    > test.out 2>&1
eval_tap $? 355 'TestNeonPayConfig' test.out

#- 356 TestPayPalConfig
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfig \
    --sandbox  \
    --body '{"clientID": "IVOcVAvo", "clientSecret": "lSqgj3PW", "returnUrl": "s3hgsh1u", "webHookId": "byJ9ab0N"}' \
    > test.out 2>&1
eval_tap $? 356 'TestPayPalConfig' test.out

#- 357 TestStripeConfig
./ng net.accelbyte.sdk.cli.Main platform testStripeConfig \
    --sandbox  \
    --body '{"allowedPaymentMethodTypes": ["RUnKRTrI", "315ZHgxi", "VkxMExsH"], "publishableKey": "nykHIgRd", "secretKey": "uj5txapL", "webhookSecret": "a0aDVmPn"}' \
    > test.out 2>&1
eval_tap $? 357 'TestStripeConfig' test.out

#- 358 TestWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfig \
    --body '{"appId": "QHb9TFQX", "key": "QBWO9NYP", "mchid": "PxAahyMn", "returnUrl": "CYIRc36S"}' \
    > test.out 2>&1
eval_tap $? 358 'TestWxPayConfig' test.out

#- 359 TestXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfig \
    --body '{"apiKey": "TYyJDFsF", "flowCompletionUrl": "xSyK19Pc", "merchantId": 65, "projectId": 83, "projectSecretKey": "jfCZQBys"}' \
    > test.out 2>&1
eval_tap $? 359 'TestXsollaConfig' test.out

#- 360 GetPaymentMerchantConfig1
./ng net.accelbyte.sdk.cli.Main platform getPaymentMerchantConfig1 \
    --id 'OtN7EAUn' \
    > test.out 2>&1
eval_tap $? 360 'GetPaymentMerchantConfig1' test.out

#- 361 UpdateAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform updateAdyenConfig \
    --id 'SWwpTkpZ' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethods": ["uPEd9tII", "7gE93ePv", "LVGz9eOG"], "apiKey": "o48CAsse", "authoriseAsCapture": true, "blockedPaymentMethods": ["QUAUREVk", "Zw0MJrQz", "Gstx0Rix"], "clientKey": "sUKGCnwG", "dropInSettings": "esoKxPoY", "liveEndpointUrlPrefix": "nfSfrBaT", "merchantAccount": "0dfa0MBQ", "notificationHmacKey": "e4Fcy5NX", "notificationPassword": "7I9TQFor", "notificationUsername": "RTBrZG4G", "returnUrl": "2jm4lzhG", "settings": "YnmZdKWq"}' \
    > test.out 2>&1
eval_tap $? 361 'UpdateAdyenConfig' test.out

#- 362 TestAdyenConfigById
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfigById \
    --id 'rouc0CEO' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 362 'TestAdyenConfigById' test.out

#- 363 UpdateAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateAliPayConfig \
    --id 'UDNqHJQg' \
    --sandbox  \
    --validate  \
    --body '{"appId": "fRe61C8s", "privateKey": "RIIgygvS", "publicKey": "gu6d9xef", "returnUrl": "iGNVmmc6"}' \
    > test.out 2>&1
eval_tap $? 363 'UpdateAliPayConfig' test.out

#- 364 TestAliPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfigById \
    --id 'Eo3wf9wZ' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 364 'TestAliPayConfigById' test.out

#- 365 UpdateCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform updateCheckoutConfig \
    --id 'yOAH2Eg2' \
    --sandbox  \
    --validate  \
    --body '{"publicKey": "i1gFeEK8", "secretKey": "HCWw1YsE"}' \
    > test.out 2>&1
eval_tap $? 365 'UpdateCheckoutConfig' test.out

#- 366 TestCheckoutConfigById
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfigById \
    --id 'YYfGpy1d' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 366 'TestCheckoutConfigById' test.out

#- 367 UpdateNeonPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateNeonPayConfig \
    --id 'LsdCYfBr' \
    --sandbox  \
    --validate  \
    --body '{"apiKey": "plLe3O11", "webhookSecretKey": "zRXtzGJK"}' \
    > test.out 2>&1
eval_tap $? 367 'UpdateNeonPayConfig' test.out

#- 368 TestNeonPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testNeonPayConfigById \
    --id 'Vio90Cvr' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 368 'TestNeonPayConfigById' test.out

#- 369 UpdatePayPalConfig
./ng net.accelbyte.sdk.cli.Main platform updatePayPalConfig \
    --id 'Nd18b6td' \
    --sandbox  \
    --validate  \
    --body '{"clientID": "upMJXbmR", "clientSecret": "uNkW9AtJ", "returnUrl": "CMc8lX4T", "webHookId": "jl4eBxmd"}' \
    > test.out 2>&1
eval_tap $? 369 'UpdatePayPalConfig' test.out

#- 370 TestPayPalConfigById
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfigById \
    --id '1c3t2U18' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 370 'TestPayPalConfigById' test.out

#- 371 UpdateStripeConfig
./ng net.accelbyte.sdk.cli.Main platform updateStripeConfig \
    --id 'CO6mWubH' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethodTypes": ["KgJn1K9T", "WFB9nqcW", "wLTNxK3q"], "publishableKey": "ub4K8uqJ", "secretKey": "uNUKcxdL", "webhookSecret": "NhsGb9U4"}' \
    > test.out 2>&1
eval_tap $? 371 'UpdateStripeConfig' test.out

#- 372 TestStripeConfigById
./ng net.accelbyte.sdk.cli.Main platform testStripeConfigById \
    --id 'e86bgaR2' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 372 'TestStripeConfigById' test.out

#- 373 UpdateWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfig \
    --id 'HUUv4Cpq' \
    --validate  \
    --body '{"appId": "7POznfFH", "key": "Uz1RKDF6", "mchid": "3ZIXRq2v", "returnUrl": "IHsQP0nC"}' \
    > test.out 2>&1
eval_tap $? 373 'UpdateWxPayConfig' test.out

#- 374 UpdateWxPayConfigCert
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfigCert \
    --id 'QOK3iC31' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 374 'UpdateWxPayConfigCert' test.out

#- 375 TestWxPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfigById \
    --id 'UGdsuWUf' \
    > test.out 2>&1
eval_tap $? 375 'TestWxPayConfigById' test.out

#- 376 UpdateXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaConfig \
    --id 'F26XVFnI' \
    --validate  \
    --body '{"apiKey": "j53Ka5T4", "flowCompletionUrl": "7RIvKaA0", "merchantId": 55, "projectId": 19, "projectSecretKey": "ICWTgte3"}' \
    > test.out 2>&1
eval_tap $? 376 'UpdateXsollaConfig' test.out

#- 377 TestXsollaConfigById
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfigById \
    --id 'WoogSvWf' \
    > test.out 2>&1
eval_tap $? 377 'TestXsollaConfigById' test.out

#- 378 UpdateXsollaUIConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaUIConfig \
    --id 'lm4ZzXLb' \
    --body '{"device": "DESKTOP", "showCloseButton": true, "size": "SMALL", "theme": "DEFAULT_DARK"}' \
    > test.out 2>&1
eval_tap $? 378 'UpdateXsollaUIConfig' test.out

#- 379 QueryPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform queryPaymentProviderConfig \
    --limit '0' \
    --namespace "$AB_NAMESPACE" \
    --offset '95' \
    --region 'japmSXBx' \
    > test.out 2>&1
eval_tap $? 379 'QueryPaymentProviderConfig' test.out

#- 380 CreatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform createPaymentProviderConfig \
    --body '{"aggregate": "NEONPAY", "namespace": "TMh1Acax", "region": "rwx3oxxY", "sandboxTaxJarApiToken": "BuUMl9eW", "specials": ["CHECKOUT", "PAYPAL", "CHECKOUT"], "taxJarApiToken": "0C8DlNkL", "taxJarEnabled": true, "useGlobalTaxJarApiToken": false}' \
    > test.out 2>&1
eval_tap $? 380 'CreatePaymentProviderConfig' test.out

#- 381 GetAggregatePaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getAggregatePaymentProviders \
    > test.out 2>&1
eval_tap $? 381 'GetAggregatePaymentProviders' test.out

#- 382 DebugMatchedPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentProviderConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'PU23u4UN' \
    > test.out 2>&1
eval_tap $? 382 'DebugMatchedPaymentProviderConfig' test.out

#- 383 GetSpecialPaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getSpecialPaymentProviders \
    > test.out 2>&1
eval_tap $? 383 'GetSpecialPaymentProviders' test.out

#- 384 UpdatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentProviderConfig \
    --id 'rFkqR4K2' \
    --body '{"aggregate": "NEONPAY", "namespace": "XjwfvPJA", "region": "eeYNChbJ", "sandboxTaxJarApiToken": "4fTFvsXM", "specials": ["ALIPAY", "ADYEN", "NEONPAY"], "taxJarApiToken": "sSTyZXLD", "taxJarEnabled": false, "useGlobalTaxJarApiToken": false}' \
    > test.out 2>&1
eval_tap $? 384 'UpdatePaymentProviderConfig' test.out

#- 385 DeletePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform deletePaymentProviderConfig \
    --id 'gbFSBALD' \
    > test.out 2>&1
eval_tap $? 385 'DeletePaymentProviderConfig' test.out

#- 386 GetPaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxConfig \
    > test.out 2>&1
eval_tap $? 386 'GetPaymentTaxConfig' test.out

#- 387 UpdatePaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentTaxConfig \
    --body '{"sandboxTaxJarApiToken": "5r5VX3oj", "taxJarApiToken": "tXUuwn9N", "taxJarEnabled": false, "taxJarProductCodesMapping": {"ezJYnxdD": "37KxgpWu", "Ab99A0cL": "MoeLIMNC", "q1LKyVL9": "yaAvmWqp"}}' \
    > test.out 2>&1
eval_tap $? 387 'UpdatePaymentTaxConfig' test.out

#- 388 SyncPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform syncPaymentOrders \
    --nextEvaluatedKey 'WqeN5K7r' \
    --end 'fxEFoghK' \
    --start '3IGPt1uc' \
    > test.out 2>&1
eval_tap $? 388 'SyncPaymentOrders' test.out

#- 389 PublicGetRootCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetRootCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'KHlYG9g9' \
    --storeId 'RwarGJ7R' \
    > test.out 2>&1
eval_tap $? 389 'PublicGetRootCategories' test.out

#- 390 DownloadCategories
./ng net.accelbyte.sdk.cli.Main platform downloadCategories \
    --namespace "$AB_NAMESPACE" \
    --language '1JoLHzYP' \
    --storeId 'myMum45A' \
    > test.out 2>&1
eval_tap $? 390 'DownloadCategories' test.out

#- 391 PublicGetCategory
./ng net.accelbyte.sdk.cli.Main platform publicGetCategory \
    --categoryPath '7qWux9ME' \
    --namespace "$AB_NAMESPACE" \
    --language 'eiboRt3f' \
    --storeId 'IspJ5MuH' \
    > test.out 2>&1
eval_tap $? 391 'PublicGetCategory' test.out

#- 392 PublicGetChildCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetChildCategories \
    --categoryPath 'exYxAjNJ' \
    --namespace "$AB_NAMESPACE" \
    --language 'ssxPFbcI' \
    --storeId 'Uy71K79Z' \
    > test.out 2>&1
eval_tap $? 392 'PublicGetChildCategories' test.out

#- 393 PublicGetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetDescendantCategories \
    --categoryPath 'XFtTM6f9' \
    --namespace "$AB_NAMESPACE" \
    --language 'M9l0IkXP' \
    --storeId 'Pw6fOwe8' \
    > test.out 2>&1
eval_tap $? 393 'PublicGetDescendantCategories' test.out

#- 394 PublicListCurrencies
./ng net.accelbyte.sdk.cli.Main platform publicListCurrencies \
    --namespace "$AB_NAMESPACE" \
    --currencyType 'REAL' \
    > test.out 2>&1
eval_tap $? 394 'PublicListCurrencies' test.out

#- 395 GeDLCDurableRewardShortMap
./ng net.accelbyte.sdk.cli.Main platform geDLCDurableRewardShortMap \
    --namespace "$AB_NAMESPACE" \
    --dlcType 'OCULUS' \
    > test.out 2>&1
eval_tap $? 395 'GeDLCDurableRewardShortMap' test.out

#- 396 GetAppleConfigVersion
./ng net.accelbyte.sdk.cli.Main platform getAppleConfigVersion \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 396 'GetAppleConfigVersion' test.out

#- 397 GetIAPItemMapping
./ng net.accelbyte.sdk.cli.Main platform getIAPItemMapping \
    --namespace "$AB_NAMESPACE" \
    --platform 'STEAM' \
    > test.out 2>&1
eval_tap $? 397 'GetIAPItemMapping' test.out

#- 398 PublicGetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --language 'JZ8t31SX' \
    --region 'nEavNYEx' \
    --storeId 'CjPQtays' \
    --appId 'wdplkOKI' \
    > test.out 2>&1
eval_tap $? 398 'PublicGetItemByAppId' test.out

#- 399 PublicQueryItems
./ng net.accelbyte.sdk.cli.Main platform publicQueryItems \
    --namespace "$AB_NAMESPACE" \
    --appType 'DLC' \
    --autoCalcEstimatedPrice  \
    --baseAppId '5gcOymsK' \
    --categoryPath '5MwleNIX' \
    --features 'IKG2cEcn' \
    --includeSubCategoryItem  \
    --itemType 'COINS' \
    --language 'TF1ywHy0' \
    --limit '46' \
    --offset '66' \
    --region 'S9yK37Yv' \
    --sortBy 'displayOrder:asc,createdAt:desc,name:desc' \
    --storeId 'y0drSmpg' \
    --tags 'bh236hwA' \
    > test.out 2>&1
eval_tap $? 399 'PublicQueryItems' test.out

#- 400 PublicGetItemBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetItemBySku \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'xFAAdf9s' \
    --region 'bxLud1h4' \
    --storeId 'kEMG31Dj' \
    --sku 'KUtgnzvs' \
    > test.out 2>&1
eval_tap $? 400 'PublicGetItemBySku' test.out

#- 401 PublicGetEstimatedPrice
./ng net.accelbyte.sdk.cli.Main platform publicGetEstimatedPrice \
    --namespace "$AB_NAMESPACE" \
    --region 'IbauJllq' \
    --storeId 'RwV22TIH' \
    --itemIds 'knPPC0FP' \
    > test.out 2>&1
eval_tap $? 401 'PublicGetEstimatedPrice' test.out

#- 402 PublicBulkGetItems
./ng net.accelbyte.sdk.cli.Main platform publicBulkGetItems \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'jfI9ARnM' \
    --region 'Hd8TwEJG' \
    --storeId 'e57pY2Ty' \
    --itemIds 'oB8zLFER' \
    > test.out 2>&1
eval_tap $? 402 'PublicBulkGetItems' test.out

#- 403 PublicValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform publicValidateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --body '{"itemIds": ["pIvJgCWP", "Uu8JrtIY", "0TFC7MuB"]}' \
    > test.out 2>&1
eval_tap $? 403 'PublicValidateItemPurchaseCondition' test.out

#- 404 PublicSearchItems
./ng net.accelbyte.sdk.cli.Main platform publicSearchItems \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --itemType 'BUNDLE' \
    --limit '38' \
    --offset '54' \
    --region 'ZIfuFoGH' \
    --storeId '3Q0LQq3t' \
    --keyword 'p9hth4lO' \
    --language 'qhy6CEK7' \
    > test.out 2>&1
eval_tap $? 404 'PublicSearchItems' test.out

#- 405 PublicGetApp
./ng net.accelbyte.sdk.cli.Main platform publicGetApp \
    --itemId 'SQAowHRd' \
    --namespace "$AB_NAMESPACE" \
    --language 'YN0q9ult' \
    --region 'j3nHgZqH' \
    --storeId 'X0P5kNHG' \
    > test.out 2>&1
eval_tap $? 405 'PublicGetApp' test.out

#- 406 PublicGetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform publicGetItemDynamicData \
    --itemId 'G2wWsgkk' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 406 'PublicGetItemDynamicData' test.out

#- 407 PublicGetItem
./ng net.accelbyte.sdk.cli.Main platform publicGetItem \
    --itemId 'gTcdAToq' \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'q1LxznH7' \
    --populateBundle  \
    --region '0H3eL7vU' \
    --storeId '8gPNsYlp' \
    > test.out 2>&1
eval_tap $? 407 'PublicGetItem' test.out

#- 408 GetPaymentCustomization
eval_tap 0 408 'GetPaymentCustomization # SKIP deprecated' test.out

#- 409 PublicGetPaymentUrl
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentUrl \
    --namespace "$AB_NAMESPACE" \
    --body '{"neonPayConfig": {"cancelUrl": "dINBePZb", "successUrl": "3TJBzw2t"}, "paymentOrderNo": "DbArzxFe", "paymentProvider": "NEONPAY", "returnUrl": "2aFcmWft", "ui": "7QcMUHlq", "zipCode": "nBX1lKNF"}' \
    > test.out 2>&1
eval_tap $? 409 'PublicGetPaymentUrl' test.out

#- 410 PublicGetPaymentMethods
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentMethods \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'bRDa84fJ' \
    > test.out 2>&1
eval_tap $? 410 'PublicGetPaymentMethods' test.out

#- 411 PublicGetUnpaidPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUnpaidPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'oz3Dorqf' \
    > test.out 2>&1
eval_tap $? 411 'PublicGetUnpaidPaymentOrder' test.out

#- 412 Pay
./ng net.accelbyte.sdk.cli.Main platform pay \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '106GD826' \
    --paymentProvider 'ALIPAY' \
    --zipCode 'N2uzwFbL' \
    --body '{"token": "hvp7Udm4"}' \
    > test.out 2>&1
eval_tap $? 412 'Pay' test.out

#- 413 PublicCheckPaymentOrderPaidStatus
./ng net.accelbyte.sdk.cli.Main platform publicCheckPaymentOrderPaidStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'Z1PlmpP7' \
    > test.out 2>&1
eval_tap $? 413 'PublicCheckPaymentOrderPaidStatus' test.out

#- 414 GetPaymentPublicConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentPublicConfig \
    --namespace "$AB_NAMESPACE" \
    --sandbox  \
    --paymentProvider 'ALIPAY' \
    --region 'VxvBdFyq' \
    > test.out 2>&1
eval_tap $? 414 'GetPaymentPublicConfig' test.out

#- 415 PublicGetQRCode
./ng net.accelbyte.sdk.cli.Main platform publicGetQRCode \
    --namespace "$AB_NAMESPACE" \
    --code '3EKAGyiz' \
    > test.out 2>&1
eval_tap $? 415 'PublicGetQRCode' test.out

#- 416 PublicNormalizePaymentReturnUrl
./ng net.accelbyte.sdk.cli.Main platform publicNormalizePaymentReturnUrl \
    --namespace "$AB_NAMESPACE" \
    --payerID 'umizrJan' \
    --foreinginvoice '0HoiIyFD' \
    --invoiceId '5fitvabZ' \
    --payload 'i6DFF5UF' \
    --redirectResult 'a0z6KlNQ' \
    --resultCode 'Atbza48t' \
    --sessionId '8EIoMrxh' \
    --status 'fGh6WCkF' \
    --token 'DiTOtiy3' \
    --type 'XVdNMOU6' \
    --userId 'ftnD1SDy' \
    --orderNo 'cU3W8cjI' \
    --paymentOrderNo 'uaqNHg7V' \
    --paymentProvider 'ADYEN' \
    --returnUrl 'CChobdwq' \
    > test.out 2>&1
eval_tap $? 416 'PublicNormalizePaymentReturnUrl' test.out

#- 417 GetPaymentTaxValue
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxValue \
    --namespace "$AB_NAMESPACE" \
    --zipCode 'NvySsBiv' \
    --paymentOrderNo 'e9O5kLkU' \
    --paymentProvider 'CHECKOUT' \
    > test.out 2>&1
eval_tap $? 417 'GetPaymentTaxValue' test.out

#- 418 GetRewardByCode
./ng net.accelbyte.sdk.cli.Main platform getRewardByCode \
    --namespace "$AB_NAMESPACE" \
    --rewardCode 'yxFicCIr' \
    > test.out 2>&1
eval_tap $? 418 'GetRewardByCode' test.out

#- 419 QueryRewards1
./ng net.accelbyte.sdk.cli.Main platform queryRewards1 \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'LtSAxvgt' \
    --limit '10' \
    --offset '21' \
    --sortBy 'rewardCode,namespace' \
    > test.out 2>&1
eval_tap $? 419 'QueryRewards1' test.out

#- 420 GetReward1
./ng net.accelbyte.sdk.cli.Main platform getReward1 \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'Ri3x1vve' \
    > test.out 2>&1
eval_tap $? 420 'GetReward1' test.out

#- 421 PublicListStores
./ng net.accelbyte.sdk.cli.Main platform publicListStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 421 'PublicListStores' test.out

#- 422 PublicExistsAnyMyActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyMyActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --appIds '4C991Ceg,DoYIby3d,NEqgFuyJ' \
    --itemIds 'VTh0jKto,Bd6vVEdj,nqJd6uJg' \
    --skus 'FXoIUTAd,EdrOp6mQ,BTenJxuQ' \
    > test.out 2>&1
eval_tap $? 422 'PublicExistsAnyMyActiveEntitlement' test.out

#- 423 PublicGetMyAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --appId 'hXucM5O1' \
    > test.out 2>&1
eval_tap $? 423 'PublicGetMyAppEntitlementOwnershipByAppId' test.out

#- 424 PublicGetMyEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'LOOTBOX' \
    --itemId 'j7g07Qyv' \
    > test.out 2>&1
eval_tap $? 424 'PublicGetMyEntitlementOwnershipByItemId' test.out

#- 425 PublicGetMyEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'SUBSCRIPTION' \
    --sku 'vZAR4Kga' \
    > test.out 2>&1
eval_tap $? 425 'PublicGetMyEntitlementOwnershipBySku' test.out

#- 426 PublicGetEntitlementOwnershipToken
./ng net.accelbyte.sdk.cli.Main platform publicGetEntitlementOwnershipToken \
    --namespace "$AB_NAMESPACE" \
    --appIds 'NzzSRZ40,W8XXNaOP,xxobdC6y' \
    --itemIds 'SIzCsDOB,GHn5VjHW,RENMYC3L' \
    --skus 'BbEerlcE,xemZcDir,baolHPYV' \
    > test.out 2>&1
eval_tap $? 426 'PublicGetEntitlementOwnershipToken' test.out

#- 427 SyncTwitchDropsEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement \
    --namespace "$AB_NAMESPACE" \
    --body '{"gameId": "FLD01BuJ", "language": "QRL-liJs", "region": "TOQy6AoI"}' \
    > test.out 2>&1
eval_tap $? 427 'SyncTwitchDropsEntitlement' test.out

#- 428 PublicGetMyWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetMyWallet \
    --currencyCode '459zmQ4Q' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 428 'PublicGetMyWallet' test.out

#- 429 SyncEpicGameDLC
./ng net.accelbyte.sdk.cli.Main platform syncEpicGameDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'LbEalnr1' \
    --body '{"epicGamesJwtToken": "OrRZyiqI"}' \
    > test.out 2>&1
eval_tap $? 429 'SyncEpicGameDLC' test.out

#- 430 SyncOculusDLC
./ng net.accelbyte.sdk.cli.Main platform syncOculusDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'g6bv0Tib' \
    > test.out 2>&1
eval_tap $? 430 'SyncOculusDLC' test.out

#- 431 PublicSyncPsnDlcInventory
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'ELNvgqgk' \
    --body '{"serviceLabel": 14}' \
    > test.out 2>&1
eval_tap $? 431 'PublicSyncPsnDlcInventory' test.out

#- 432 PublicSyncPsnDlcInventoryWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventoryWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'oXW5ynuu' \
    --body '{"serviceLabels": [72, 52, 95]}' \
    > test.out 2>&1
eval_tap $? 432 'PublicSyncPsnDlcInventoryWithMultipleServiceLabels' test.out

#- 433 SyncSteamDLC
./ng net.accelbyte.sdk.cli.Main platform syncSteamDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'ROCQbAMa' \
    --body '{"appId": "xMCkqqGq", "steamId": "INdiRM9r"}' \
    > test.out 2>&1
eval_tap $? 433 'SyncSteamDLC' test.out

#- 434 SyncXboxDLC
./ng net.accelbyte.sdk.cli.Main platform syncXboxDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'dKKKR8Mj' \
    --body '{"xstsToken": "IPR1PJZB"}' \
    > test.out 2>&1
eval_tap $? 434 'SyncXboxDLC' test.out

#- 435 PublicQueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'uu9UdwZJ' \
    --appType 'GAME' \
    --entitlementClazz 'APP' \
    --entitlementName 'JJ2UptxU' \
    --features 'rcLO1XWX,cwwxfvYG,AfKBHk6s' \
    --itemId 'QQtnXOH0,Ze8cqVJb,kfdGfdVM' \
    --limit '81' \
    --offset '56' \
    > test.out 2>&1
eval_tap $? 435 'PublicQueryUserEntitlements' test.out

#- 436 PublicGetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'LJ3HUMge' \
    --appId 'on4mn3Bz' \
    > test.out 2>&1
eval_tap $? 436 'PublicGetUserAppEntitlementByAppId' test.out

#- 437 PublicQueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'BeirgsVX' \
    --limit '89' \
    --offset '19' \
    --appType 'DEMO' \
    > test.out 2>&1
eval_tap $? 437 'PublicQueryUserEntitlementsByAppType' test.out

#- 438 PublicGetUserEntitlementsByIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementsByIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'Bo7skhIu' \
    --availablePlatformOnly  \
    --ids 'QFAX4Fbc,MfMWx57p,kwtO2cNM' \
    > test.out 2>&1
eval_tap $? 438 'PublicGetUserEntitlementsByIds' test.out

#- 439 PublicGetUserEntitlementByItemId
eval_tap 0 439 'PublicGetUserEntitlementByItemId # SKIP deprecated' test.out

#- 440 PublicGetUserEntitlementBySku
eval_tap 0 440 'PublicGetUserEntitlementBySku # SKIP deprecated' test.out

#- 441 PublicUserEntitlementHistory
./ng net.accelbyte.sdk.cli.Main platform publicUserEntitlementHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'ox02w75W' \
    --endDate 'HJktFoo5' \
    --entitlementClazz 'MEDIA' \
    --limit '49' \
    --offset '5' \
    --startDate 'lzpL3l7N' \
    > test.out 2>&1
eval_tap $? 441 'PublicUserEntitlementHistory' test.out

#- 442 PublicExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'x84xXDOG' \
    --appIds 'v9JBXajg,fDZrBJsY,lCG6vD4A' \
    --itemIds 'lnk1YmdJ,qAW4Ifz2,ozmqCd8v' \
    --skus '04EIPk3i,KRofTcCc,eJNDuLpP' \
    > test.out 2>&1
eval_tap $? 442 'PublicExistsAnyUserActiveEntitlement' test.out

#- 443 PublicGetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 't6hYX6Zb' \
    --appId 'PWnHAQ9e' \
    > test.out 2>&1
eval_tap $? 443 'PublicGetUserAppEntitlementOwnershipByAppId' test.out

#- 444 PublicGetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'jT7y8oX5' \
    --entitlementClazz 'ENTITLEMENT' \
    --itemId '7FTIiy5H' \
    > test.out 2>&1
eval_tap $? 444 'PublicGetUserEntitlementOwnershipByItemId' test.out

#- 445 PublicGetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId '4Re8LUJC' \
    --ids 'xOVQ18yu,6IFSDkzK,v5ZJvPWB' \
    > test.out 2>&1
eval_tap $? 445 'PublicGetUserEntitlementOwnershipByItemIds' test.out

#- 446 PublicGetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'NdpBdaOs' \
    --entitlementClazz 'LOOTBOX' \
    --sku '3G5YWqK7' \
    > test.out 2>&1
eval_tap $? 446 'PublicGetUserEntitlementOwnershipBySku' test.out

#- 447 PublicGetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlement \
    --entitlementId 'gnL5Ages' \
    --namespace "$AB_NAMESPACE" \
    --userId 'iWlmKCwG' \
    > test.out 2>&1
eval_tap $? 447 'PublicGetUserEntitlement' test.out

#- 448 PublicConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicConsumeUserEntitlement \
    --entitlementId 'cr8RUsmo' \
    --namespace "$AB_NAMESPACE" \
    --userId 'tknRYCBZ' \
    --body '{"metadata": {"operationSource": "INVENTORY"}, "options": ["XdGnFbcp", "X9wSazbp", "OXqc9vFP"], "requestId": "hc7iMFji", "useCount": 47}' \
    > test.out 2>&1
eval_tap $? 448 'PublicConsumeUserEntitlement' test.out

#- 449 PublicSellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicSellUserEntitlement \
    --entitlementId 'MayL56fV' \
    --namespace "$AB_NAMESPACE" \
    --userId '1ZYA7qjT' \
    --body '{"requestId": "HocUINZg", "useCount": 72}' \
    > test.out 2>&1
eval_tap $? 449 'PublicSellUserEntitlement' test.out

#- 450 PublicSplitUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicSplitUserEntitlement \
    --entitlementId 'fLHrpG11' \
    --namespace "$AB_NAMESPACE" \
    --userId 'mZSrPQ8z' \
    --body '{"metadata": {"operationSource": "INVENTORY"}, "useCount": 9}' \
    > test.out 2>&1
eval_tap $? 450 'PublicSplitUserEntitlement' test.out

#- 451 PublicTransferUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicTransferUserEntitlement \
    --entitlementId 'kis0NK9q' \
    --namespace "$AB_NAMESPACE" \
    --userId 'R4G2n4Hb' \
    --body '{"entitlementId": "pnw8uL9e", "metadata": {"operationSource": "INVENTORY"}, "useCount": 91}' \
    > test.out 2>&1
eval_tap $? 451 'PublicTransferUserEntitlement' test.out

#- 452 PublicRedeemCode
./ng net.accelbyte.sdk.cli.Main platform publicRedeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'uq2keoZt' \
    --body '{"code": "rUqqEdcv", "language": "QmN_BArq", "region": "Mg4sbfKa"}' \
    > test.out 2>&1
eval_tap $? 452 'PublicRedeemCode' test.out

#- 453 PublicFulfillAppleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillAppleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'yt7MUmvU' \
    --body '{"excludeOldTransactions": true, "language": "aun", "productId": "gJ7bgRyG", "receiptData": "m5mA1yKB", "region": "nyinoqU6", "transactionId": "kHMKohtM"}' \
    > test.out 2>&1
eval_tap $? 453 'PublicFulfillAppleIAPItem' test.out

#- 454 SyncEpicGamesInventory
./ng net.accelbyte.sdk.cli.Main platform syncEpicGamesInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'cdbGzIqb' \
    --body '{"epicGamesJwtToken": "sFCshGrk"}' \
    > test.out 2>&1
eval_tap $? 454 'SyncEpicGamesInventory' test.out

#- 455 PublicFulfillGoogleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillGoogleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'w1fFlIAR' \
    --body '{"autoAck": true, "autoConsume": true, "language": "ZoEM", "orderId": "hSiPhQsT", "packageName": "g286YBeq", "productId": "IBnyFYx1", "purchaseTime": 4, "purchaseToken": "Hf0WKupn", "region": "3xjIJIL9", "subscriptionPurchase": false}' \
    > test.out 2>&1
eval_tap $? 455 'PublicFulfillGoogleIAPItem' test.out

#- 456 SyncOculusConsumableEntitlements
./ng net.accelbyte.sdk.cli.Main platform syncOculusConsumableEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId '1cdnqX6m' \
    > test.out 2>&1
eval_tap $? 456 'SyncOculusConsumableEntitlements' test.out

#- 457 PublicReconcilePlayStationStore
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStore \
    --namespace "$AB_NAMESPACE" \
    --userId 'qaEa860V' \
    --body '{"currencyCode": "hRLSkQwO", "price": 0.2228715700044409, "productId": "VMbeaN3t", "serviceLabel": 87}' \
    > test.out 2>&1
eval_tap $? 457 'PublicReconcilePlayStationStore' test.out

#- 458 PublicReconcilePlayStationStoreWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStoreWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'IAf9mJyW' \
    --body '{"currencyCode": "UorLUFv6", "price": 0.38606579831663645, "productId": "HXQTXhfd", "serviceLabels": [16, 37, 38]}' \
    > test.out 2>&1
eval_tap $? 458 'PublicReconcilePlayStationStoreWithMultipleServiceLabels' test.out

#- 459 SyncSteamInventory
./ng net.accelbyte.sdk.cli.Main platform syncSteamInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'KNkOGNdg' \
    --body '{"appId": "kknkFXWK", "currencyCode": "Yh5Rpg6S", "language": "nEV", "price": 0.019941805478981278, "productId": "vTybeH4r", "region": "b7qkrULw", "steamId": "BX6H8MTf"}' \
    > test.out 2>&1
eval_tap $? 459 'SyncSteamInventory' test.out

#- 460 SyncSteamAbnormalTransaction
./ng net.accelbyte.sdk.cli.Main platform syncSteamAbnormalTransaction \
    --namespace "$AB_NAMESPACE" \
    --userId 'QurAkMLu' \
    > test.out 2>&1
eval_tap $? 460 'SyncSteamAbnormalTransaction' test.out

#- 461 SyncSteamIAPByTransaction
./ng net.accelbyte.sdk.cli.Main platform syncSteamIAPByTransaction \
    --namespace "$AB_NAMESPACE" \
    --userId '8HVTa73m' \
    --body '{"orderId": "NCvURsCy"}' \
    > test.out 2>&1
eval_tap $? 461 'SyncSteamIAPByTransaction' test.out

#- 462 PublicQueryUserThirdPartySubscription
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserThirdPartySubscription \
    --namespace "$AB_NAMESPACE" \
    --platform 'APPLE' \
    --userId 't47KeKn3' \
    --activeOnly  \
    --groupId 'SZHN7Rnn' \
    --limit '89' \
    --offset '66' \
    --productId 'mH1dj3Ba' \
    > test.out 2>&1
eval_tap $? 462 'PublicQueryUserThirdPartySubscription' test.out

#- 463 SyncTwitchDropsEntitlement1
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'VPdFqnMl' \
    --body '{"gameId": "0dj6qvG8", "language": "itc", "region": "mCPscRko"}' \
    > test.out 2>&1
eval_tap $? 463 'SyncTwitchDropsEntitlement1' test.out

#- 464 SyncXboxInventory
./ng net.accelbyte.sdk.cli.Main platform syncXboxInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'nhP1rgmJ' \
    --body '{"currencyCode": "c3m43g13", "price": 0.6671493831432684, "productId": "u2nT19GR", "xstsToken": "TBWcXCjw"}' \
    > test.out 2>&1
eval_tap $? 464 'SyncXboxInventory' test.out

#- 465 PublicQueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'cKI29edf' \
    --discounted  \
    --itemId 'CUYZGEEq' \
    --limit '5' \
    --offset '0' \
    --status 'REFUNDING' \
    > test.out 2>&1
eval_tap $? 465 'PublicQueryUserOrders' test.out

#- 466 PublicCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'RPkXk1KP' \
    --body '{"currencyCode": "zd0th4Wz", "discountCodes": ["OIqQSXEU", "kZ2Jagc0", "9UzaJ5Jl"], "discountedPrice": 13, "ext": {"rhXOGV70": {}, "PGBDzWMJ": {}, "L4URCsn1": {}}, "itemId": "1bde1ukG", "language": "eVyV-Bu", "price": 93, "quantity": 78, "region": "msxBAcTW", "returnUrl": "4j6wHkHe", "sectionId": "U5ekA4k5"}' \
    > test.out 2>&1
eval_tap $? 466 'PublicCreateUserOrder' test.out

#- 467 PublicPreviewOrderPrice
./ng net.accelbyte.sdk.cli.Main platform publicPreviewOrderPrice \
    --namespace "$AB_NAMESPACE" \
    --userId 'Z2nM1yWW' \
    --body '{"currencyCode": "xStqhVs0", "discountCodes": ["zfTFt3uA", "Ty8NBeUb", "PKJewsc6"], "discountedPrice": 14, "itemId": "fSK6IdjX", "price": 74, "quantity": 46}' \
    > test.out 2>&1
eval_tap $? 467 'PublicPreviewOrderPrice' test.out

#- 468 PublicGetUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'nsB8gctl' \
    --userId 'FM3Fpiul' \
    > test.out 2>&1
eval_tap $? 468 'PublicGetUserOrder' test.out

#- 469 PublicCancelUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCancelUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'pLiBEhDM' \
    --userId 'Dm3T4lH9' \
    > test.out 2>&1
eval_tap $? 469 'PublicCancelUserOrder' test.out

#- 470 PublicGetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'C8aRSejY' \
    --userId 't9O5kpmz' \
    > test.out 2>&1
eval_tap $? 470 'PublicGetUserOrderHistories' test.out

#- 471 PublicDownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform publicDownloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'nAd3m6hQ' \
    --userId 'aOQTDysS' \
    > test.out 2>&1
eval_tap $? 471 'PublicDownloadUserOrderReceipt' test.out

#- 472 PublicGetPaymentAccounts
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'pKH8jaYg' \
    > test.out 2>&1
eval_tap $? 472 'PublicGetPaymentAccounts' test.out

#- 473 PublicDeletePaymentAccount
./ng net.accelbyte.sdk.cli.Main platform publicDeletePaymentAccount \
    --id '8kZsk2Wn' \
    --namespace "$AB_NAMESPACE" \
    --type 'paypal' \
    --userId 'e0QFHqC0' \
    > test.out 2>&1
eval_tap $? 473 'PublicDeletePaymentAccount' test.out

#- 474 PublicListActiveSections
./ng net.accelbyte.sdk.cli.Main platform publicListActiveSections \
    --namespace "$AB_NAMESPACE" \
    --userId 'nKumIe2z' \
    --autoCalcEstimatedPrice  \
    --language 'gLGPhPJT' \
    --region '12i0GBxn' \
    --storeId 'TGUF1WJz' \
    --viewId 'yBhDWgm7' \
    > test.out 2>&1
eval_tap $? 474 'PublicListActiveSections' test.out

#- 475 PublicQueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId '740GhJqd' \
    --chargeStatus 'NEVER' \
    --itemId 'bllBtApN' \
    --limit '40' \
    --offset '38' \
    --sku 'Sro7FEDo' \
    --status 'EXPIRED' \
    --subscribedBy 'USER' \
    > test.out 2>&1
eval_tap $? 475 'PublicQueryUserSubscriptions' test.out

#- 476 PublicSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform publicSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'q27QMhbd' \
    --body '{"currencyCode": "nsUbn148", "itemId": "qoSYQzt8", "language": "NUQ-Mxuy", "region": "cAi3JgNe", "returnUrl": "KbSTR8zj", "source": "CIpum9jj"}' \
    > test.out 2>&1
eval_tap $? 476 'PublicSubscribeSubscription' test.out

#- 477 PublicCheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform publicCheckUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'aolwYgFU' \
    --itemId 'yonHhNyk' \
    > test.out 2>&1
eval_tap $? 477 'PublicCheckUserSubscriptionSubscribableByItemId' test.out

#- 478 PublicGetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '3hUplnIQ' \
    --userId 'ivJODLKU' \
    > test.out 2>&1
eval_tap $? 478 'PublicGetUserSubscription' test.out

#- 479 PublicChangeSubscriptionBillingAccount
./ng net.accelbyte.sdk.cli.Main platform publicChangeSubscriptionBillingAccount \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'vD64OlQ5' \
    --userId 'JDIcl8wU' \
    > test.out 2>&1
eval_tap $? 479 'PublicChangeSubscriptionBillingAccount' test.out

#- 480 PublicCancelSubscription
./ng net.accelbyte.sdk.cli.Main platform publicCancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'VVwPBef8' \
    --userId 'JbgEd2jX' \
    --body '{"immediate": false, "reason": "WgIOLw7u"}' \
    > test.out 2>&1
eval_tap $? 480 'PublicCancelSubscription' test.out

#- 481 PublicGetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'k79RHEbW' \
    --userId 'aqiA5idt' \
    --excludeFree  \
    --limit '69' \
    --offset '33' \
    > test.out 2>&1
eval_tap $? 481 'PublicGetUserSubscriptionBillingHistories' test.out

#- 482 PublicListViews
./ng net.accelbyte.sdk.cli.Main platform publicListViews \
    --namespace "$AB_NAMESPACE" \
    --userId 'st2h4K26' \
    --language '4oJ6w8PZ' \
    --storeId '75jzR6Wn' \
    > test.out 2>&1
eval_tap $? 482 'PublicListViews' test.out

#- 483 PublicGetWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetWallet \
    --currencyCode 'Wj4nbHOT' \
    --namespace "$AB_NAMESPACE" \
    --userId 'nbixnkwA' \
    > test.out 2>&1
eval_tap $? 483 'PublicGetWallet' test.out

#- 484 PublicListUserWalletTransactions
./ng net.accelbyte.sdk.cli.Main platform publicListUserWalletTransactions \
    --currencyCode 'iRdQAp33' \
    --namespace "$AB_NAMESPACE" \
    --userId '9EqeNjPg' \
    --limit '65' \
    --offset '29' \
    > test.out 2>&1
eval_tap $? 484 'PublicListUserWalletTransactions' test.out

#- 485 PublicGetMyDLCContent
./ng net.accelbyte.sdk.cli.Main platform publicGetMyDLCContent \
    --includeAllNamespaces  \
    --type 'STEAM' \
    > test.out 2>&1
eval_tap $? 485 'PublicGetMyDLCContent' test.out

#- 486 QueryFulfillments
./ng net.accelbyte.sdk.cli.Main platform queryFulfillments \
    --namespace "$AB_NAMESPACE" \
    --endTime 'Vc8BXzku' \
    --limit '22' \
    --offset '15' \
    --startTime '9uUsYOsk' \
    --state 'REVOKED' \
    --transactionId 'u9sv1qbX' \
    --userId '2eXIPqO4' \
    > test.out 2>&1
eval_tap $? 486 'QueryFulfillments' test.out

#- 487 QueryItemsV2
./ng net.accelbyte.sdk.cli.Main platform queryItemsV2 \
    --namespace "$AB_NAMESPACE" \
    --appType 'DLC' \
    --availableDate 'MIKuscT3' \
    --baseAppId 'TjlYrOGi' \
    --categoryPath 'XnsI0QDW' \
    --features 'b7r7QPdE' \
    --includeSubCategoryItem  \
    --itemName '2EIg8TvK' \
    --itemStatus 'INACTIVE' \
    --itemType 'INGAMEITEM,INGAMEITEM,SUBSCRIPTION' \
    --limit '18' \
    --offset '84' \
    --region 'V7c9DXEu' \
    --sectionExclusive  \
    --sortBy 'displayOrder,updatedAt:asc,name:asc' \
    --storeId 'iZP0ilnS' \
    --tags 'SrAJ1zfG' \
    --targetNamespace '88WOSdMJ' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 487 'QueryItemsV2' test.out

#- 488 ImportStore1
./ng net.accelbyte.sdk.cli.Main platform importStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'DrPlsiTb' \
    --strictMode  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 488 'ImportStore1' test.out

#- 489 ExportStore1
./ng net.accelbyte.sdk.cli.Main platform exportStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'OqQ5eY7h' \
    --body '{"itemIds": ["LtGzlos8", "iiNzVVIg", "cHHMy0pN"]}' \
    > test.out 2>&1
eval_tap $? 489 'ExportStore1' test.out

#- 490 FulfillRewardsV2
./ng net.accelbyte.sdk.cli.Main platform fulfillRewardsV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'oZqEHx7s' \
    --body '{"entitlementCollectionId": "9YENUfl3", "entitlementOrigin": "IOS", "metadata": {"YPs71gA6": {}, "Pg1OlLJT": {}, "ZSnLUsq9": {}}, "origin": "Oculus", "rewards": [{"currency": {"currencyCode": "YA2PAAGD", "namespace": "PMbt7f3n"}, "item": {"itemId": "rxPGkMWx", "itemName": "yjXXnSap", "itemSku": "vsDhTxdh", "itemType": "HY4jM098"}, "quantity": 90, "type": "CURRENCY"}, {"currency": {"currencyCode": "jIsHFqgJ", "namespace": "VCcpTi0y"}, "item": {"itemId": "5XjIfc18", "itemName": "qWIbFOIF", "itemSku": "wDMFeRji", "itemType": "VJ5htHit"}, "quantity": 2, "type": "CURRENCY"}, {"currency": {"currencyCode": "u09e10GS", "namespace": "MBUC9DLA"}, "item": {"itemId": "7L6k9xre", "itemName": "tSY4ndtj", "itemSku": "veyedtAO", "itemType": "q3EbAAyg"}, "quantity": 66, "type": "ITEM"}], "source": "SELL_BACK", "transactionId": "ivCShjsk"}' \
    > test.out 2>&1
eval_tap $? 490 'FulfillRewardsV2' test.out

#- 491 FulfillItems
eval_tap 0 491 'FulfillItems # SKIP deprecated' test.out

#- 492 RetryFulfillItems
eval_tap 0 492 'RetryFulfillItems # SKIP deprecated' test.out

#- 493 RevokeItems
eval_tap 0 493 'RevokeItems # SKIP deprecated' test.out

#- 494 V2PublicFulfillAppleIAPItem
./ng net.accelbyte.sdk.cli.Main platform v2PublicFulfillAppleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'MC4baweA' \
    --body '{"transactionId": "dzvMzzlM"}' \
    > test.out 2>&1
eval_tap $? 494 'V2PublicFulfillAppleIAPItem' test.out

#- 495 FulfillItemsV3
./ng net.accelbyte.sdk.cli.Main platform fulfillItemsV3 \
    --namespace "$AB_NAMESPACE" \
    --transactionId 'Kept5q7b' \
    --userId '3hoX6IpB' \
    --body '{"items": [{"duration": 22, "endDate": "1978-07-15T00:00:00Z", "entitlementCollectionId": "Brd0kGGq", "entitlementOrigin": "Epic", "itemId": "IWOGYIz5", "itemSku": "DWmIGVa2", "language": "elhMuhn8", "metadata": {"4iMAolSr": {}, "ysBoQdks": {}, "1gKJPAGg": {}}, "orderNo": "6z17O7O0", "origin": "Other", "quantity": 92, "region": "ZAnzQEa5", "source": "PURCHASE", "startDate": "1996-05-06T00:00:00Z", "storeId": "zHorO2i0"}, {"duration": 23, "endDate": "1998-05-02T00:00:00Z", "entitlementCollectionId": "NdIBoZpZ", "entitlementOrigin": "Oculus", "itemId": "jS6E6gbH", "itemSku": "H4xyhjPo", "language": "WeQySsgO", "metadata": {"cgxqBQdL": {}, "uOHNLovo": {}, "qV1EInmw": {}}, "orderNo": "hpEO9DV2", "origin": "Steam", "quantity": 19, "region": "fGOunuaR", "source": "GIFT", "startDate": "1992-05-17T00:00:00Z", "storeId": "PltWSOzD"}, {"duration": 56, "endDate": "1991-11-22T00:00:00Z", "entitlementCollectionId": "eQFE9G9A", "entitlementOrigin": "System", "itemId": "GtxMwAlL", "itemSku": "3pbaV4M3", "language": "fBWrIq6W", "metadata": {"HkKoqIK0": {}, "391ZgfL5": {}, "gQ1cNL7l": {}}, "orderNo": "8JXp9fgV", "origin": "Steam", "quantity": 37, "region": "NI1CwBlb", "source": "GIFT", "startDate": "1973-09-19T00:00:00Z", "storeId": "krj4y8rW"}]}' \
    > test.out 2>&1
eval_tap $? 495 'FulfillItemsV3' test.out

#- 496 RetryFulfillItemsV3
./ng net.accelbyte.sdk.cli.Main platform retryFulfillItemsV3 \
    --namespace "$AB_NAMESPACE" \
    --transactionId '6DZVf63V' \
    --userId 'Yu8pedw0' \
    > test.out 2>&1
eval_tap $? 496 'RetryFulfillItemsV3' test.out

#- 497 RevokeItemsV3
./ng net.accelbyte.sdk.cli.Main platform revokeItemsV3 \
    --namespace "$AB_NAMESPACE" \
    --transactionId 'aCJaVVMQ' \
    --userId 'cZRCSFfU' \
    > test.out 2>&1
eval_tap $? 497 'RevokeItemsV3' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
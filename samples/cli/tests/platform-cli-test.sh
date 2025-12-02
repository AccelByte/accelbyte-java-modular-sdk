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
echo "1..507"

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
    --id 'clrN1T19' \
    > test.out 2>&1
eval_tap $? 3 'GetFulfillmentScript' test.out

#- 4 CreateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform createFulfillmentScript \
    --id 'uT3B6KiH' \
    --body '{"grantDays": "6T3aHQRg"}' \
    > test.out 2>&1
eval_tap $? 4 'CreateFulfillmentScript' test.out

#- 5 DeleteFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform deleteFulfillmentScript \
    --id 'lROauUQQ' \
    > test.out 2>&1
eval_tap $? 5 'DeleteFulfillmentScript' test.out

#- 6 UpdateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform updateFulfillmentScript \
    --id 'gI0ZgX3y' \
    --body '{"grantDays": "ZdrkKOWQ"}' \
    > test.out 2>&1
eval_tap $? 6 'UpdateFulfillmentScript' test.out

#- 7 ListItemTypeConfigs
./ng net.accelbyte.sdk.cli.Main platform listItemTypeConfigs \
    > test.out 2>&1
eval_tap $? 7 'ListItemTypeConfigs' test.out

#- 8 CreateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform createItemTypeConfig \
    --body '{"clazz": "qMdF8dY1", "dryRun": true, "fulfillmentUrl": "nbl9TzvN", "itemType": "INGAMEITEM", "purchaseConditionUrl": "BoVnkdso"}' \
    > test.out 2>&1
eval_tap $? 8 'CreateItemTypeConfig' test.out

#- 9 SearchItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform searchItemTypeConfig \
    --clazz 'LveMxEsY' \
    --itemType 'CODE' \
    > test.out 2>&1
eval_tap $? 9 'SearchItemTypeConfig' test.out

#- 10 GetItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform getItemTypeConfig \
    --id 'yGYrl0yF' \
    > test.out 2>&1
eval_tap $? 10 'GetItemTypeConfig' test.out

#- 11 UpdateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform updateItemTypeConfig \
    --id 'n53NHZzh' \
    --body '{"clazz": "bGI5BJrd", "dryRun": true, "fulfillmentUrl": "tyPgKWR4", "purchaseConditionUrl": "q0xr5WLT"}' \
    > test.out 2>&1
eval_tap $? 11 'UpdateItemTypeConfig' test.out

#- 12 DeleteItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform deleteItemTypeConfig \
    --id 'b23e4ETs' \
    > test.out 2>&1
eval_tap $? 12 'DeleteItemTypeConfig' test.out

#- 13 QueryCampaigns
./ng net.accelbyte.sdk.cli.Main platform queryCampaigns \
    --namespace "$AB_NAMESPACE" \
    --limit '52' \
    --name 'woYg3U8K' \
    --offset '80' \
    --tag 'Qg2HX0hW' \
    > test.out 2>&1
eval_tap $? 13 'QueryCampaigns' test.out

#- 14 CreateCampaign
./ng net.accelbyte.sdk.cli.Main platform createCampaign \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "41cjXlWd", "discountConfig": {"categories": [{"categoryPath": "pcu7LKSN", "includeSubCategories": false}, {"categoryPath": "kJC2uy1J", "includeSubCategories": true}, {"categoryPath": "pbl5gvF5", "includeSubCategories": false}], "currencyCode": "YSu6aBff", "currencyNamespace": "IulB1Eny", "discountAmount": 54, "discountPercentage": 99, "discountType": "AMOUNT", "items": [{"itemId": "keor7pus", "itemName": "0OAXIAo9"}, {"itemId": "CMKsPrtW", "itemName": "vJk3zJpX"}, {"itemId": "nhgnHghY", "itemName": "WlM7fyr4"}], "restrictType": "ITEMS_AND_CATEGORIES", "stackable": false}, "items": [{"extraSubscriptionDays": 0, "itemId": "Qx6gz6aA", "itemName": "3VrLoHJX", "quantity": 98}, {"extraSubscriptionDays": 42, "itemId": "AuzbXnOF", "itemName": "fhJFqPsu", "quantity": 75}, {"extraSubscriptionDays": 34, "itemId": "SUagxkup", "itemName": "7sOPv8Hl", "quantity": 72}], "maxRedeemCountPerCampaignPerUser": 0, "maxRedeemCountPerCode": 39, "maxRedeemCountPerCodePerUser": 67, "maxSaleCount": 5, "name": "SUUGVUxX", "redeemEnd": "1984-09-20T00:00:00Z", "redeemStart": "1992-07-23T00:00:00Z", "redeemType": "DISCOUNT", "status": "INACTIVE", "tags": ["UOM4yN6f", "JWIZP7t5", "BNUMwFcK"], "type": "REDEMPTION"}' \
    > test.out 2>&1
eval_tap $? 14 'CreateCampaign' test.out

#- 15 GetCampaign
./ng net.accelbyte.sdk.cli.Main platform getCampaign \
    --campaignId 'TrHcJPSA' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'GetCampaign' test.out

#- 16 UpdateCampaign
./ng net.accelbyte.sdk.cli.Main platform updateCampaign \
    --campaignId 'OqhzpUsf' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "9Wyj5vKe", "discountConfig": {"categories": [{"categoryPath": "rzwnzW2Y", "includeSubCategories": false}, {"categoryPath": "LyNRgoqI", "includeSubCategories": false}, {"categoryPath": "dapI6Y2A", "includeSubCategories": true}], "currencyCode": "ij33itpd", "currencyNamespace": "3mjLNfl6", "discountAmount": 88, "discountPercentage": 11, "discountType": "AMOUNT", "items": [{"itemId": "p3N5tSzc", "itemName": "5X8mETqo"}, {"itemId": "m7s5CUV6", "itemName": "Rdy6Q7QS"}, {"itemId": "3XBL0Xi0", "itemName": "9Xht0OMk"}], "restrictType": "NONE", "stackable": true}, "items": [{"extraSubscriptionDays": 62, "itemId": "R0HQNgFj", "itemName": "Lzj0TdLi", "quantity": 33}, {"extraSubscriptionDays": 87, "itemId": "QOPRjXsJ", "itemName": "vOX1X9zj", "quantity": 42}, {"extraSubscriptionDays": 76, "itemId": "u755MXNU", "itemName": "ltJLHzGJ", "quantity": 91}], "maxRedeemCountPerCampaignPerUser": 29, "maxRedeemCountPerCode": 89, "maxRedeemCountPerCodePerUser": 42, "maxSaleCount": 27, "name": "kkMzBWyj", "redeemEnd": "1976-01-24T00:00:00Z", "redeemStart": "1983-09-14T00:00:00Z", "redeemType": "DISCOUNT", "status": "ACTIVE", "tags": ["0T4lJceo", "OWU4Jp8w", "124HAAEM"]}' \
    > test.out 2>&1
eval_tap $? 16 'UpdateCampaign' test.out

#- 17 RenameBatch
./ng net.accelbyte.sdk.cli.Main platform renameBatch \
    --campaignId 'u12Vv0cB' \
    --namespace "$AB_NAMESPACE" \
    --body '{"newName": "tEfvsB4z", "oldName": "ILpaaidY"}' \
    > test.out 2>&1
eval_tap $? 17 'RenameBatch' test.out

#- 18 QueryCampaignBatchNames
./ng net.accelbyte.sdk.cli.Main platform queryCampaignBatchNames \
    --campaignId 'daZCN183' \
    --namespace "$AB_NAMESPACE" \
    --batchName 'sugfpN7M' \
    --limit '59' \
    > test.out 2>&1
eval_tap $? 18 'QueryCampaignBatchNames' test.out

#- 19 GetCampaignDynamic
./ng net.accelbyte.sdk.cli.Main platform getCampaignDynamic \
    --campaignId 'Vx7h9SDt' \
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
    --body '{"enableInventoryCheck": true, "itemDeletionCheckConfig": ["REWARD", "IAP"]}' \
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
    --body '{"appConfig": {"appName": "sYehcucv"}, "customConfig": {"connectionType": "INSECURE", "grpcServerAddress": "GPSskk05"}, "extendType": "CUSTOM"}' \
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
    --body '{"appConfig": {"appName": "IA1to2eh"}, "customConfig": {"connectionType": "INSECURE", "grpcServerAddress": "OaHZsriv"}, "extendType": "CUSTOM"}' \
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
    --storeId 'XlzfjR9W' \
    > test.out 2>&1
eval_tap $? 31 'GetRootCategories' test.out

#- 32 CreateCategory
./ng net.accelbyte.sdk.cli.Main platform createCategory \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Q4O3A7Xw' \
    --body '{"categoryPath": "kLGqBCjM", "localizationDisplayNames": {"ZyqkvWIA": "KfyhSpY9", "XpcoRzu9": "GrDsQxSt", "mVPhfKuj": "c9F6wDU1"}}' \
    > test.out 2>&1
eval_tap $? 32 'CreateCategory' test.out

#- 33 ListCategoriesBasic
./ng net.accelbyte.sdk.cli.Main platform listCategoriesBasic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'TPVmpPOh' \
    > test.out 2>&1
eval_tap $? 33 'ListCategoriesBasic' test.out

#- 34 GetCategory
./ng net.accelbyte.sdk.cli.Main platform getCategory \
    --categoryPath 'tC5o2cZE' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'wzOCWamE' \
    > test.out 2>&1
eval_tap $? 34 'GetCategory' test.out

#- 35 UpdateCategory
./ng net.accelbyte.sdk.cli.Main platform updateCategory \
    --categoryPath 'GrArmwqO' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'xBVCD5IC' \
    --body '{"localizationDisplayNames": {"FowRQ5le": "j1viriBw", "TPr3Xvbp": "JUp8grw6", "ylfqXtYR": "CM91TcGt"}}' \
    > test.out 2>&1
eval_tap $? 35 'UpdateCategory' test.out

#- 36 DeleteCategory
./ng net.accelbyte.sdk.cli.Main platform deleteCategory \
    --categoryPath '5Mprrbem' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'XGD57OQn' \
    > test.out 2>&1
eval_tap $? 36 'DeleteCategory' test.out

#- 37 GetChildCategories
./ng net.accelbyte.sdk.cli.Main platform getChildCategories \
    --categoryPath 'fPOzpE3m' \
    --namespace "$AB_NAMESPACE" \
    --storeId '6lBTW5sd' \
    > test.out 2>&1
eval_tap $? 37 'GetChildCategories' test.out

#- 38 GetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform getDescendantCategories \
    --categoryPath 'Lqz9Gt6U' \
    --namespace "$AB_NAMESPACE" \
    --storeId '6x3WnnbQ' \
    > test.out 2>&1
eval_tap $? 38 'GetDescendantCategories' test.out

#- 39 QueryCodes
./ng net.accelbyte.sdk.cli.Main platform queryCodes \
    --campaignId 'w10xF3oy' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --batchName 'lCEGTLzN' \
    --batchNo '50,1,40' \
    --code 'zOM59Bzs' \
    --limit '83' \
    --offset '99' \
    --withBatchName  \
    > test.out 2>&1
eval_tap $? 39 'QueryCodes' test.out

#- 40 CreateCodes
./ng net.accelbyte.sdk.cli.Main platform createCodes \
    --campaignId 'O62aAW1f' \
    --namespace "$AB_NAMESPACE" \
    --body '{"batchName": "EQC81Lm6", "codeValue": "k6aseYAg", "quantity": 49}' \
    > test.out 2>&1
eval_tap $? 40 'CreateCodes' test.out

#- 41 Download
./ng net.accelbyte.sdk.cli.Main platform download \
    --campaignId 'jHL7Jq9v' \
    --namespace "$AB_NAMESPACE" \
    --batchName 'CJspWxbx' \
    --batchNo '92,57,40' \
    --withBatchName  \
    > test.out 2>&1
eval_tap $? 41 'Download' test.out

#- 42 BulkDisableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkDisableCodes \
    --campaignId '75cZfzsi' \
    --namespace "$AB_NAMESPACE" \
    --batchName 'YTjBmxTq' \
    --batchNo '56,59,20' \
    > test.out 2>&1
eval_tap $? 42 'BulkDisableCodes' test.out

#- 43 BulkEnableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkEnableCodes \
    --campaignId 'wh629KwI' \
    --namespace "$AB_NAMESPACE" \
    --batchName '7FBdrOb3' \
    --batchNo '91,9,48' \
    > test.out 2>&1
eval_tap $? 43 'BulkEnableCodes' test.out

#- 44 QueryRedeemHistory
./ng net.accelbyte.sdk.cli.Main platform queryRedeemHistory \
    --campaignId 'tRUQelTy' \
    --namespace "$AB_NAMESPACE" \
    --code '2BMPjGwS' \
    --limit '96' \
    --offset '8' \
    --userId 'fwtqrz6T' \
    > test.out 2>&1
eval_tap $? 44 'QueryRedeemHistory' test.out

#- 45 GetCode
./ng net.accelbyte.sdk.cli.Main platform getCode \
    --code '9PgJiS8B' \
    --namespace "$AB_NAMESPACE" \
    --redeemable  \
    --withBatchName  \
    > test.out 2>&1
eval_tap $? 45 'GetCode' test.out

#- 46 DisableCode
./ng net.accelbyte.sdk.cli.Main platform disableCode \
    --code 'Eqqn9UEA' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 46 'DisableCode' test.out

#- 47 EnableCode
./ng net.accelbyte.sdk.cli.Main platform enableCode \
    --code 'cpt16WRA' \
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
    --body '{"currencyCode": "O3pkohQl", "currencySymbol": "BtFu5Aoi", "currencyType": "REAL", "decimals": 16, "localizationDescriptions": {"5uoKiRl9": "Qt1EqheH", "hFZN8hqo": "Z2s95dAU", "dmxV5kzI": "koCTvwgj"}}' \
    > test.out 2>&1
eval_tap $? 52 'CreateCurrency' test.out

#- 53 UpdateCurrency
./ng net.accelbyte.sdk.cli.Main platform updateCurrency \
    --currencyCode 'fSlWIDcg' \
    --namespace "$AB_NAMESPACE" \
    --body '{"localizationDescriptions": {"m0j5WAgf": "tnERMbTm", "R7GstjZO": "gA6t7mZ6", "KrLiKqdR": "4cp0yz9a"}}' \
    > test.out 2>&1
eval_tap $? 53 'UpdateCurrency' test.out

#- 54 DeleteCurrency
./ng net.accelbyte.sdk.cli.Main platform deleteCurrency \
    --currencyCode '63FI0e6D' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 54 'DeleteCurrency' test.out

#- 55 GetCurrencyConfig
./ng net.accelbyte.sdk.cli.Main platform getCurrencyConfig \
    --currencyCode 'MetYdIRm' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 55 'GetCurrencyConfig' test.out

#- 56 GetCurrencySummary
./ng net.accelbyte.sdk.cli.Main platform getCurrencySummary \
    --currencyCode 't77pWnv3' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 56 'GetCurrencySummary' test.out

#- 57 GetDLCItemConfigHistory
./ng net.accelbyte.sdk.cli.Main platform getDLCItemConfigHistory \
    --namespace "$AB_NAMESPACE" \
    --dlcId 'F8SL2N8T' \
    > test.out 2>&1
eval_tap $? 57 'GetDLCItemConfigHistory' test.out

#- 58 RestoreDLCItemConfigHistory
./ng net.accelbyte.sdk.cli.Main platform restoreDLCItemConfigHistory \
    --id 'KmyQLRnb' \
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
    --body '{"data": [{"autoUpdate": true, "enableRevocation": false, "id": "EtbMt2tE", "rewards": [{"currency": {"currencyCode": "C1SdGRCL", "namespace": "qCNBS0R6"}, "item": {"itemId": "UZqqFmSl", "itemName": "xJjUnUAv", "itemSku": "gci4Txhu", "itemType": "FjfBn51x"}, "quantity": 26, "type": "ITEM"}, {"currency": {"currencyCode": "0zWuFTl5", "namespace": "is8DKcxG"}, "item": {"itemId": "fkap0HQh", "itemName": "wi5pdIc9", "itemSku": "94LaH5vN", "itemType": "hXOuG0Sl"}, "quantity": 88, "type": "ITEM"}, {"currency": {"currencyCode": "3g3QJqNt", "namespace": "vM1jYYyW"}, "item": {"itemId": "H8AeCK3Q", "itemName": "dgFuvXJq", "itemSku": "mhoomQbs", "itemType": "kqjjX9zB"}, "quantity": 24, "type": "CURRENCY"}], "rvn": 27}, {"autoUpdate": false, "enableRevocation": false, "id": "J7BnTjsl", "rewards": [{"currency": {"currencyCode": "F8XKprLg", "namespace": "JjPa1QLy"}, "item": {"itemId": "rATyHGdD", "itemName": "eF4dSbXH", "itemSku": "YoLSYRJI", "itemType": "Ku6G5wm9"}, "quantity": 32, "type": "ITEM"}, {"currency": {"currencyCode": "t1DIZXcT", "namespace": "jX3E1g5Y"}, "item": {"itemId": "kHhfF3Jd", "itemName": "J23unPwR", "itemSku": "ShWiAuuK", "itemType": "qBgqex7D"}, "quantity": 52, "type": "CURRENCY"}, {"currency": {"currencyCode": "viaZPCS9", "namespace": "aqMuizf0"}, "item": {"itemId": "WtiI2AnG", "itemName": "UUrudfsm", "itemSku": "S0mKwaJS", "itemType": "uXHCiZw0"}, "quantity": 18, "type": "ITEM"}], "rvn": 97}, {"autoUpdate": false, "enableRevocation": false, "id": "1TEzQoX2", "rewards": [{"currency": {"currencyCode": "8EhyGp71", "namespace": "j2irBDpM"}, "item": {"itemId": "hzmTHOjX", "itemName": "7QQlgqN0", "itemSku": "gVEi4OTL", "itemType": "FTmLhjyG"}, "quantity": 66, "type": "ITEM"}, {"currency": {"currencyCode": "mrDRaXP7", "namespace": "GB3e1s12"}, "item": {"itemId": "rfgI1DbB", "itemName": "gRKqd8fw", "itemSku": "A7L9Rfah", "itemType": "jzMtlQVz"}, "quantity": 91, "type": "ITEM"}, {"currency": {"currencyCode": "tg7fRrG1", "namespace": "0adEfeGz"}, "item": {"itemId": "U0cwl5OS", "itemName": "iZIherx9", "itemSku": "VHPpkAYv", "itemType": "Ndrc2nFz"}, "quantity": 69, "type": "CURRENCY"}], "rvn": 72}]}' \
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
    --body '{"data": [{"platform": "XBOX", "platformDlcIdMap": {"icnQIoO5": "4EyXdJbE", "troSbfc9": "eXYAayw5", "TNOYIdpF": "jA6UTXWT"}}, {"platform": "XBOX", "platformDlcIdMap": {"Y9rjS6vL": "gjYHxH23", "Bdc0irkt": "S9pUWjQF", "ivpuw7wO": "wUdGz99q"}}, {"platform": "OCULUS", "platformDlcIdMap": {"K95qw00G": "T0TjqHIm", "lIqeTB81": "hRldKKp7", "XPAfsMJI": "HRTcqPqQ"}}]}' \
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
    --entitlementName 'd7UDkQ1Q' \
    --itemId '2BBq78nG,bT3Q0x1l,hj8QinqO' \
    --limit '91' \
    --offset '37' \
    --origin 'Playstation' \
    --userId 'OPAuIUEs' \
    > test.out 2>&1
eval_tap $? 65 'QueryEntitlements' test.out

#- 66 QueryEntitlementsByItemIds
./ng net.accelbyte.sdk.cli.Main platform queryEntitlementsByItemIds \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemIds 'aVtVyv5O,UF5249WL,WG2K6KJo' \
    --limit '67' \
    --offset '35' \
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
    --body '{"entitlementGrantList": [{"collectionId": "DR6uWbWP", "endDate": "1980-02-27T00:00:00Z", "grantedCode": "UU7154mx", "itemId": "7mgQgPb0", "itemNamespace": "6VBYYaPL", "language": "yQB", "metadata": {"ywAu36jo": {}, "maXra1wN": {}, "Gu2zsNnR": {}}, "origin": "Oculus", "quantity": 3, "region": "kz8pWRhh", "source": "PURCHASE", "startDate": "1972-09-22T00:00:00Z", "storeId": "d9qUtG1C"}, {"collectionId": "FvHegHc8", "endDate": "1980-04-15T00:00:00Z", "grantedCode": "i6sX0rsJ", "itemId": "OVfRhU1V", "itemNamespace": "XO9YzbUA", "language": "dk-Yq", "metadata": {"xUR7MZdD": {}, "Je753KaG": {}, "4zX3rx69": {}}, "origin": "Epic", "quantity": 27, "region": "6pvHEOlX", "source": "ACHIEVEMENT", "startDate": "1983-06-04T00:00:00Z", "storeId": "D1q3lzEm"}, {"collectionId": "FcSEse3H", "endDate": "1980-11-04T00:00:00Z", "grantedCode": "tnUqyO1t", "itemId": "b7ncTsod", "itemNamespace": "xkaSppcr", "language": "nKL_CVKK-hC", "metadata": {"NuWShCDJ": {}, "zkG6Hu3h": {}, "lwM6XgjE": {}}, "origin": "Playstation", "quantity": 24, "region": "eq4dZMqm", "source": "IAP", "startDate": "1980-02-16T00:00:00Z", "storeId": "LZRDUH6q"}], "userIds": ["waatOrxd", "SuTuO29M", "5ApKZgT9"]}' \
    > test.out 2>&1
eval_tap $? 69 'GrantEntitlements' test.out

#- 70 RevokeEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeEntitlements \
    --namespace "$AB_NAMESPACE" \
    --body '["J1B4KT0e", "35wDbG8P", "ZIlkSLFl"]' \
    > test.out 2>&1
eval_tap $? 70 'RevokeEntitlements' test.out

#- 71 GetEntitlement
./ng net.accelbyte.sdk.cli.Main platform getEntitlement \
    --entitlementId 'IocheEbT' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 71 'GetEntitlement' test.out

#- 72 QueryFulfillmentHistories
./ng net.accelbyte.sdk.cli.Main platform queryFulfillmentHistories \
    --namespace "$AB_NAMESPACE" \
    --limit '75' \
    --offset '5' \
    --status 'SUCCESS' \
    --userId 'rclSL7Mt' \
    > test.out 2>&1
eval_tap $? 72 'QueryFulfillmentHistories' test.out

#- 73 QueryIAPClawbackHistory
./ng net.accelbyte.sdk.cli.Main platform queryIAPClawbackHistory \
    --namespace "$AB_NAMESPACE" \
    --endTime 'Q1gUCtc2' \
    --eventType 'OTHER' \
    --externalOrderId 'hT2BqGm0' \
    --limit '86' \
    --offset '45' \
    --startTime 'Sk4fnvJ5' \
    --status 'FAIL' \
    --userId 'nBKZZ6Hu' \
    > test.out 2>&1
eval_tap $? 73 'QueryIAPClawbackHistory' test.out

#- 74 MockPlayStationStreamEvent
./ng net.accelbyte.sdk.cli.Main platform mockPlayStationStreamEvent \
    --namespace "$AB_NAMESPACE" \
    --body '{"body": {"account": "RkEIrciH", "additionalData": {"entitlement": [{"clientTransaction": [{"amountConsumed": 5, "clientTransactionId": "GxVvih5r"}, {"amountConsumed": 94, "clientTransactionId": "4APt5aWf"}, {"amountConsumed": 89, "clientTransactionId": "4oN2jUDf"}], "entitlementId": "pLFk4Qkc", "usageCount": 32}, {"clientTransaction": [{"amountConsumed": 3, "clientTransactionId": "WRAyRqUh"}, {"amountConsumed": 67, "clientTransactionId": "Kkrh7Bi9"}, {"amountConsumed": 55, "clientTransactionId": "5Ief9V9a"}], "entitlementId": "v4gydxqr", "usageCount": 88}, {"clientTransaction": [{"amountConsumed": 48, "clientTransactionId": "lNgHWfcp"}, {"amountConsumed": 68, "clientTransactionId": "ZDjcwaXa"}, {"amountConsumed": 83, "clientTransactionId": "4uxYufdc"}], "entitlementId": "GOn8ubrw", "usageCount": 72}], "purpose": "1MmqgiC2"}, "originalTitleName": "HHtcmbed", "paymentProductSKU": "keCcejek", "purchaseDate": "8QNOnk18", "sourceOrderItemId": "GnwWXUEX", "titleName": "yMhT22TL"}, "eventDomain": "SFDQbAI1", "eventSource": "u3Uc3jPR", "eventType": "YigCwD9B", "eventVersion": 17, "id": "E2TbaGWv", "timestamp": "vpsUSU5K"}' \
    > test.out 2>&1
eval_tap $? 74 'MockPlayStationStreamEvent' test.out

#- 75 MockXblClawbackEvent
./ng net.accelbyte.sdk.cli.Main platform mockXblClawbackEvent \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": {"eventDate": "rVcaYjTW", "eventState": "jxe0ppnu", "lineItemId": "FBxH3oml", "orderId": "oLfw7mW7", "productId": "KVMHusCF", "productType": "zoMb4K0Q", "purchasedDate": "F0MVQ05U", "sandboxId": "G16A6Jv1", "skuId": "AzEyAu6e", "subscriptionData": {"consumedDurationInDays": 28, "dateTime": "VFSqiPHZ", "durationInDays": 10, "recurrenceId": "ZBBNBquH"}}, "datacontenttype": "XQyE8AzV", "id": "bZdaB7nG", "source": "woSgsiAD", "specVersion": "l63noQJs", "subject": "axOnxSH1", "time": "OhT8TnPJ", "traceparent": "pTLu30U7", "type": "WnB1SKJt"}' \
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
    --body '{"appAppleId": 3, "bundleId": "NsPGj6wV", "issuerId": "FlWHriuI", "keyId": "VFDOe7NC", "password": "CAUuPpBU", "version": "V1"}' \
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
    --body '{"sandboxId": "CZSp9Olt"}' \
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
    --body '{"applicationName": "wuav0DOm", "notificationTokenAudience": "ZLm0YhZo", "notificationTokenEmail": "dDJz7ie3", "packageName": "AeKJ2L64", "serviceAccountId": "7GEg1OIN"}' \
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
    --body '{"data": [{"itemIdentity": "l5l5xdYl", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"CIBb5yWe": "t8ijQeKW", "8KRNRtbA": "NdTA8dVw", "Uk631Rh0": "f8a9ULlT"}}, {"itemIdentity": "k8GBoskY", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"X4m3MGlQ": "zC7Tt3MW", "5ULQPVEN": "sSab7X2K", "rvx6FtTG": "ibmIECwt"}}, {"itemIdentity": "sE2tmljO", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"jHlDHX76": "V1RHaLlV", "aDYFRqi4": "Y6aoOwnE", "V705m8F5": "5beZpjEH"}}]}' \
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
    --body '{"appId": "xlxhy9WW", "appSecret": "5xG4ob35", "webhookVerifyToken": "Y2iF7d5Q"}' \
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
    --body '{"sku": "3y0USZI2"}' \
    > test.out 2>&1
eval_tap $? 94 'CreateOculusSubscriptionGroup' test.out

#- 95 DeleteOculusSubscriptionGroup
./ng net.accelbyte.sdk.cli.Main platform deleteOculusSubscriptionGroup \
    --namespace "$AB_NAMESPACE" \
    --sku 'BnnYMUXS' \
    > test.out 2>&1
eval_tap $? 95 'DeleteOculusSubscriptionGroup' test.out

#- 96 ListOculusSubscriptionGroupTier
./ng net.accelbyte.sdk.cli.Main platform listOculusSubscriptionGroupTier \
    --namespace "$AB_NAMESPACE" \
    --sku 'yyvyZ6PB' \
    > test.out 2>&1
eval_tap $? 96 'ListOculusSubscriptionGroupTier' test.out

#- 97 AddTierIntoMetaQuestSubscriptionGroup
./ng net.accelbyte.sdk.cli.Main platform addTierIntoMetaQuestSubscriptionGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupSku": "k1NLZwsW", "sku": "N0Gy80Iw"}' \
    > test.out 2>&1
eval_tap $? 97 'AddTierIntoMetaQuestSubscriptionGroup' test.out

#- 98 DeleteOculusSubscriptionTier
./ng net.accelbyte.sdk.cli.Main platform deleteOculusSubscriptionTier \
    --namespace "$AB_NAMESPACE" \
    --sku 'BCMR0hoG' \
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
    --body '{"backOfficeServerClientId": "pNFZts3p", "backOfficeServerClientSecret": "jqARPegF", "enableStreamJob": true, "environment": "FlCtRC5Y", "streamName": "hbBUbIj4", "streamPartnerName": "h3xXUj6P"}' \
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
    --body '{"backOfficeServerClientId": "eRnWNkOE", "backOfficeServerClientSecret": "1pSOiRbo", "enableStreamJob": true, "environment": "cKRCsXvg", "streamName": "PdaD6g5i", "streamPartnerName": "3BD9n1v0"}' \
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
    --body '{"appId": "OHczYruS", "env": "LIVE", "publisherAuthenticationKey": "nMr9CvQk", "syncMode": "INVENTORY"}' \
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
    --body '{"clientId": "BfaU7Toz", "clientSecret": "fSiWe8A9", "organizationId": "rs3Fq6tF"}' \
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
    --body '{"enableClawback": true, "entraAppClientId": "GNEANa6u", "entraAppClientSecret": "7qzQFjTg", "entraTenantId": "hrCpwj9r", "relyingPartyCert": "FTo0md4d"}' \
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
    --password 'BqTSzue4' \
    > test.out 2>&1
eval_tap $? 113 'UpdateXblBPCertFile' test.out

#- 114 QueryThirdPartyNotifications
./ng net.accelbyte.sdk.cli.Main platform queryThirdPartyNotifications \
    --namespace "$AB_NAMESPACE" \
    --endDate '7xVI3DwJ' \
    --externalId 'rLV4j5B1' \
    --limit '36' \
    --offset '68' \
    --source 'STEAM' \
    --startDate 'G3tac1Ik' \
    --status 'WARN' \
    --type 'SStsGPXs' \
    > test.out 2>&1
eval_tap $? 114 'QueryThirdPartyNotifications' test.out

#- 115 QueryAbnormalTransactions
./ng net.accelbyte.sdk.cli.Main platform queryAbnormalTransactions \
    --namespace "$AB_NAMESPACE" \
    --limit '57' \
    --offset '12' \
    --orderId 'tAXTmuWb' \
    --steamId 'rYk9iyMD' \
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
    --body '{"env": "LIVE", "lastTime": "1992-03-21T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 117 'AdminResetSteamJobTime' test.out

#- 118 AdminRefundIAPOrder
./ng net.accelbyte.sdk.cli.Main platform adminRefundIAPOrder \
    --iapOrderNo 'co8YguCb' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 118 'AdminRefundIAPOrder' test.out

#- 119 QuerySteamReportHistories
./ng net.accelbyte.sdk.cli.Main platform querySteamReportHistories \
    --namespace "$AB_NAMESPACE" \
    --limit '99' \
    --offset '33' \
    --orderId 'SbUhM8sx' \
    --processStatus 'PROCESSED' \
    --steamId '09GcqYrV' \
    > test.out 2>&1
eval_tap $? 119 'QuerySteamReportHistories' test.out

#- 120 QueryThirdPartySubscription
./ng net.accelbyte.sdk.cli.Main platform queryThirdPartySubscription \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --groupId 'pceAXSC7' \
    --limit '91' \
    --offset '83' \
    --platform 'TWITCH' \
    --productId 'EM1Wuvac' \
    --userId 'YMKvJmIj' \
    > test.out 2>&1
eval_tap $? 120 'QueryThirdPartySubscription' test.out

#- 121 GetIAPOrderConsumeDetails
./ng net.accelbyte.sdk.cli.Main platform getIAPOrderConsumeDetails \
    --iapOrderNo '4XvbM9Zv' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 121 'GetIAPOrderConsumeDetails' test.out

#- 122 DownloadInvoiceDetails
./ng net.accelbyte.sdk.cli.Main platform downloadInvoiceDetails \
    --namespace "$AB_NAMESPACE" \
    --endTime 'Cyo0SQFJ' \
    --feature 'o4VJ0pxP' \
    --itemId '0y5C6iRj' \
    --itemType 'SUBSCRIPTION' \
    --startTime 'mxuH8sLQ' \
    > test.out 2>&1
eval_tap $? 122 'DownloadInvoiceDetails' test.out

#- 123 GenerateInvoiceSummary
./ng net.accelbyte.sdk.cli.Main platform generateInvoiceSummary \
    --namespace "$AB_NAMESPACE" \
    --endTime '1l63cEh5' \
    --feature 'lW5JjntD' \
    --itemId 'RE0ehzEv' \
    --itemType 'CODE' \
    --startTime 'K1NsQZvB' \
    > test.out 2>&1
eval_tap $? 123 'GenerateInvoiceSummary' test.out

#- 124 SyncInGameItem
./ng net.accelbyte.sdk.cli.Main platform syncInGameItem \
    --namespace "$AB_NAMESPACE" \
    --storeId '2lYHseED' \
    --body '{"categoryPath": "O49CFFuG", "targetItemId": "RhwDJZTR", "targetNamespace": "mKooaTji"}' \
    > test.out 2>&1
eval_tap $? 124 'SyncInGameItem' test.out

#- 125 CreateItem
./ng net.accelbyte.sdk.cli.Main platform createItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'QLK4gkQY' \
    --body '{"appId": "KYZVt307", "appType": "DEMO", "baseAppId": "F0EkaPRS", "boothName": "A2WjbUn8", "categoryPath": "rMcwpEJm", "clazz": "iEACm9Vf", "displayOrder": 65, "entitlementType": "DURABLE", "ext": {"PfYEzMc5": {}, "aqGdbZfX": {}, "XGH0eNbb": {}}, "features": ["acWIH2Ra", "LHBmrwWC", "GH6K1AaG"], "flexible": false, "images": [{"as": "gB44vMEN", "caption": "7KsYL7La", "height": 28, "imageUrl": "eWP8BXTR", "smallImageUrl": "nbl7plC2", "width": 93}, {"as": "Ml6bEhvg", "caption": "CjCvbuuo", "height": 22, "imageUrl": "thp1diQF", "smallImageUrl": "ug4kGyRK", "width": 75}, {"as": "f8jXpCvs", "caption": "PHE0CkCF", "height": 66, "imageUrl": "RDqnJB7M", "smallImageUrl": "fl4AljRe", "width": 37}], "inventoryConfig": {"customAttributes": {"Yy10oEKj": {}, "cehJcyTG": {}, "gT5RGdEr": {}}, "serverCustomAttributes": {"FGEiY7IG": {}, "mN3sVt8S": {}, "UFQb8ixR": {}}, "slotUsed": 52}, "itemId": "i95DIadX", "itemIds": ["6y4cphUe", "Nf21orKq", "1jDMqxZu"], "itemQty": {"LMHlBnz5": 51, "tgBfbJxQ": 71, "5Nmf6Pfk": 65}, "itemType": "INGAMEITEM", "listable": true, "localizations": {"KLmEPeJC": {"description": "s7VUvyrD", "localExt": {"MXUT4sum": {}, "0aQvalyd": {}, "8w2AWrTO": {}}, "longDescription": "XisTVyTC", "title": "esMAN1D8"}, "tJweGDE1": {"description": "Ys1GlX2z", "localExt": {"VfrtQlRd": {}, "w79CCCR1": {}, "Bc1HtCuJ": {}}, "longDescription": "3CaTGJj3", "title": "VjoFvgko"}, "LqdNiPds": {"description": "90Dr8hUp", "localExt": {"vqRa7Djl": {}, "ZjjB6DmP": {}, "Ughy0WSh": {}}, "longDescription": "hGzEYnuT", "title": "KHrHNitN"}}, "lootBoxConfig": {"rewardCount": 7, "rewards": [{"lootBoxItems": [{"count": 39, "duration": 62, "endDate": "1976-08-02T00:00:00Z", "itemId": "DAXGeSZI", "itemSku": "PCKUIoM0", "itemType": "hu5jfdN4"}, {"count": 47, "duration": 15, "endDate": "1994-11-09T00:00:00Z", "itemId": "e9PAVFm1", "itemSku": "1lFfQyOQ", "itemType": "c0AeF4BF"}, {"count": 97, "duration": 78, "endDate": "1996-02-19T00:00:00Z", "itemId": "qW1PFS2e", "itemSku": "YdBTwj56", "itemType": "gSa2gtoz"}], "name": "JJzZ2taj", "odds": 0.06151617444168411, "type": "PROBABILITY_GROUP", "weight": 78}, {"lootBoxItems": [{"count": 0, "duration": 26, "endDate": "1988-11-29T00:00:00Z", "itemId": "ZRuoHOvM", "itemSku": "5jzofVWx", "itemType": "vpzCpfSt"}, {"count": 34, "duration": 62, "endDate": "1982-01-06T00:00:00Z", "itemId": "UBbH8die", "itemSku": "EpcQWYUa", "itemType": "MtP2FU51"}, {"count": 24, "duration": 84, "endDate": "1972-04-05T00:00:00Z", "itemId": "hJQbXsIB", "itemSku": "qWOgpqAk", "itemType": "r5wiCGeu"}], "name": "EawbYXHf", "odds": 0.6593088351985373, "type": "REWARD", "weight": 70}, {"lootBoxItems": [{"count": 72, "duration": 63, "endDate": "1991-12-29T00:00:00Z", "itemId": "m5wXMFfX", "itemSku": "2BMwIwP6", "itemType": "uQwZBFAz"}, {"count": 57, "duration": 87, "endDate": "1976-06-09T00:00:00Z", "itemId": "qmGoHEGk", "itemSku": "LD4cKNVe", "itemType": "dU2R2XRv"}, {"count": 77, "duration": 34, "endDate": "1987-12-06T00:00:00Z", "itemId": "kt7V8sAn", "itemSku": "4TzsD7Pm", "itemType": "I8oplLE3"}], "name": "gleGxKjB", "odds": 0.14692212198990218, "type": "REWARD_GROUP", "weight": 64}], "rollFunction": "DEFAULT"}, "maxCount": 59, "maxCountPerUser": 58, "name": "VbYGAncM", "optionBoxConfig": {"boxItems": [{"count": 86, "duration": 98, "endDate": "1997-10-05T00:00:00Z", "itemId": "cpCW9IY5", "itemSku": "qrIHpN1j", "itemType": "ES8qorQ5"}, {"count": 31, "duration": 48, "endDate": "1997-09-28T00:00:00Z", "itemId": "52twXygt", "itemSku": "fxxQwFmf", "itemType": "CIDDYmVa"}, {"count": 38, "duration": 72, "endDate": "1973-11-02T00:00:00Z", "itemId": "AxeJCGzg", "itemSku": "ql3MMBlp", "itemType": "N5xN4w6U"}]}, "purchasable": true, "recurring": {"cycle": "QUARTERLY", "fixedFreeDays": 23, "fixedTrialCycles": 53, "graceDays": 47}, "regionData": {"0B604FpF": [{"currencyCode": "w6RqAq1E", "currencyNamespace": "grEwbFdp", "currencyType": "VIRTUAL", "discountAmount": 53, "discountExpireAt": "1974-07-28T00:00:00Z", "discountPercentage": 42, "discountPurchaseAt": "1975-10-14T00:00:00Z", "expireAt": "1972-02-10T00:00:00Z", "price": 17, "purchaseAt": "1994-01-10T00:00:00Z", "trialPrice": 72}, {"currencyCode": "FmgVWeNC", "currencyNamespace": "O4iZw8yp", "currencyType": "REAL", "discountAmount": 1, "discountExpireAt": "1974-06-22T00:00:00Z", "discountPercentage": 4, "discountPurchaseAt": "1971-10-20T00:00:00Z", "expireAt": "1990-01-03T00:00:00Z", "price": 0, "purchaseAt": "1984-05-02T00:00:00Z", "trialPrice": 61}, {"currencyCode": "ctPIsZHD", "currencyNamespace": "2ZqOY2UC", "currencyType": "REAL", "discountAmount": 10, "discountExpireAt": "1971-07-14T00:00:00Z", "discountPercentage": 83, "discountPurchaseAt": "1994-04-11T00:00:00Z", "expireAt": "1990-07-18T00:00:00Z", "price": 63, "purchaseAt": "1989-06-22T00:00:00Z", "trialPrice": 69}], "PSAGCtv7": [{"currencyCode": "00X1YauO", "currencyNamespace": "Ahz0CL5U", "currencyType": "VIRTUAL", "discountAmount": 79, "discountExpireAt": "1978-07-13T00:00:00Z", "discountPercentage": 57, "discountPurchaseAt": "1974-05-04T00:00:00Z", "expireAt": "1973-10-31T00:00:00Z", "price": 68, "purchaseAt": "1980-09-14T00:00:00Z", "trialPrice": 96}, {"currencyCode": "CttdUziE", "currencyNamespace": "9ab1gqN3", "currencyType": "REAL", "discountAmount": 54, "discountExpireAt": "1999-04-05T00:00:00Z", "discountPercentage": 90, "discountPurchaseAt": "1971-06-11T00:00:00Z", "expireAt": "1982-01-29T00:00:00Z", "price": 32, "purchaseAt": "1985-02-09T00:00:00Z", "trialPrice": 22}, {"currencyCode": "DC0sncbw", "currencyNamespace": "FKiHepTX", "currencyType": "REAL", "discountAmount": 3, "discountExpireAt": "1995-02-05T00:00:00Z", "discountPercentage": 7, "discountPurchaseAt": "1986-04-26T00:00:00Z", "expireAt": "1977-10-22T00:00:00Z", "price": 54, "purchaseAt": "1987-06-01T00:00:00Z", "trialPrice": 2}], "0GMijQNx": [{"currencyCode": "eRwbuu5F", "currencyNamespace": "yJvbmrmv", "currencyType": "REAL", "discountAmount": 100, "discountExpireAt": "1992-08-19T00:00:00Z", "discountPercentage": 74, "discountPurchaseAt": "1988-05-24T00:00:00Z", "expireAt": "1981-07-09T00:00:00Z", "price": 100, "purchaseAt": "1999-11-27T00:00:00Z", "trialPrice": 36}, {"currencyCode": "HWaKXsQn", "currencyNamespace": "iq6JtLYZ", "currencyType": "VIRTUAL", "discountAmount": 91, "discountExpireAt": "1988-04-22T00:00:00Z", "discountPercentage": 90, "discountPurchaseAt": "1986-11-02T00:00:00Z", "expireAt": "1990-02-18T00:00:00Z", "price": 80, "purchaseAt": "1990-05-24T00:00:00Z", "trialPrice": 64}, {"currencyCode": "iqFNGbPS", "currencyNamespace": "RqWpUXz9", "currencyType": "REAL", "discountAmount": 16, "discountExpireAt": "1996-03-09T00:00:00Z", "discountPercentage": 56, "discountPurchaseAt": "1976-09-13T00:00:00Z", "expireAt": "1972-05-07T00:00:00Z", "price": 36, "purchaseAt": "1974-03-08T00:00:00Z", "trialPrice": 37}]}, "saleConfig": {"currencyCode": "LpTTk5s1", "price": 12}, "seasonType": "PASS", "sectionExclusive": true, "sellable": false, "sku": "YhYMgAIO", "stackable": true, "status": "INACTIVE", "tags": ["UHzzW53t", "o0lP9Gms", "trvocu7j"], "targetCurrencyCode": "MPQ4sOpa", "targetNamespace": "AInQSrSi", "thumbnailUrl": "7zzM5Sgt", "useCount": 8}' \
    > test.out 2>&1
eval_tap $? 125 'CreateItem' test.out

#- 126 GetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform getItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'zqVfyGXm' \
    --appId 'CxpHCihr' \
    > test.out 2>&1
eval_tap $? 126 'GetItemByAppId' test.out

#- 127 QueryItems
./ng net.accelbyte.sdk.cli.Main platform queryItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --appType 'GAME' \
    --availableDate 'CchYoYQl' \
    --baseAppId '5yvFJZay' \
    --categoryPath 'ammy8IbS' \
    --features 'ZLAZSdnO' \
    --includeSubCategoryItem  \
    --itemType 'INGAMEITEM' \
    --limit '43' \
    --offset '33' \
    --region 'WqMeHBk2' \
    --sortBy 'name:asc,createdAt:asc,createdAt:desc' \
    --storeId 'VGQil2oM' \
    --tags 'XTiHnT0p' \
    --targetNamespace 'JTsQ2ecs' \
    > test.out 2>&1
eval_tap $? 127 'QueryItems' test.out

#- 128 ListBasicItemsByFeatures
./ng net.accelbyte.sdk.cli.Main platform listBasicItemsByFeatures \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --features 'zGAWkEJT,2icMqgfN,bWfnNhex' \
    > test.out 2>&1
eval_tap $? 128 'ListBasicItemsByFeatures' test.out

#- 129 GetItems
./ng net.accelbyte.sdk.cli.Main platform getItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'HWMnqxbJ' \
    --itemIds 'Q5MRLgL0' \
    > test.out 2>&1
eval_tap $? 129 'GetItems' test.out

#- 130 GetItemBySku
./ng net.accelbyte.sdk.cli.Main platform getItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'c0nZ7pDr' \
    --sku 'iZIZfij9' \
    > test.out 2>&1
eval_tap $? 130 'GetItemBySku' test.out

#- 131 GetLocaleItemBySku
./ng net.accelbyte.sdk.cli.Main platform getLocaleItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'HBFisjm4' \
    --populateBundle  \
    --region '4i39ZHrp' \
    --storeId '4NVYhBV0' \
    --sku 'YvdDczJv' \
    > test.out 2>&1
eval_tap $? 131 'GetLocaleItemBySku' test.out

#- 132 GetEstimatedPrice
./ng net.accelbyte.sdk.cli.Main platform getEstimatedPrice \
    --namespace "$AB_NAMESPACE" \
    --platform '5iRVp0UZ' \
    --region '5SPZzHq6' \
    --storeId 'ltYwzkTV' \
    --itemIds '6jsTkGtD' \
    --userId 'NSZi1dKa' \
    > test.out 2>&1
eval_tap $? 132 'GetEstimatedPrice' test.out

#- 133 GetItemIdBySku
./ng net.accelbyte.sdk.cli.Main platform getItemIdBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'gJz0T38N' \
    --sku 'sAte1R2o' \
    > test.out 2>&1
eval_tap $? 133 'GetItemIdBySku' test.out

#- 134 GetBulkItemIdBySkus
./ng net.accelbyte.sdk.cli.Main platform getBulkItemIdBySkus \
    --namespace "$AB_NAMESPACE" \
    --sku 'AJZlwYDM,E18qAf8v,uEIBXyod' \
    --storeId 'JoTazUAE' \
    > test.out 2>&1
eval_tap $? 134 'GetBulkItemIdBySkus' test.out

#- 135 BulkGetLocaleItems
./ng net.accelbyte.sdk.cli.Main platform bulkGetLocaleItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'Mk31pdqW' \
    --region '5gO0q5G8' \
    --storeId '9e9gpLrt' \
    --itemIds 'txSuF99e' \
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
    --platform 'WoyDacYs' \
    --userId 'mlALkxCw' \
    --body '{"itemIds": ["3VOMJqC8", "xjvSfWhz", "a58kzLRa"]}' \
    > test.out 2>&1
eval_tap $? 137 'ValidateItemPurchaseCondition' test.out

#- 138 BulkUpdateRegionData
./ng net.accelbyte.sdk.cli.Main platform bulkUpdateRegionData \
    --namespace "$AB_NAMESPACE" \
    --storeId 'GyaMKDY9' \
    --body '{"changes": [{"itemIdentities": ["jl940L5R", "lxZwcqli", "gFouEPMk"], "itemIdentityType": "ITEM_SKU", "regionData": {"Wy4qY11p": [{"currencyCode": "vD8Grfhi", "currencyNamespace": "zaWzhpPa", "currencyType": "VIRTUAL", "discountAmount": 1, "discountExpireAt": "1982-10-06T00:00:00Z", "discountPercentage": 33, "discountPurchaseAt": "1997-10-17T00:00:00Z", "discountedPrice": 26, "expireAt": "1979-08-01T00:00:00Z", "price": 16, "purchaseAt": "1994-08-04T00:00:00Z", "trialPrice": 91}, {"currencyCode": "4qBDyieF", "currencyNamespace": "rEM8viGP", "currencyType": "VIRTUAL", "discountAmount": 2, "discountExpireAt": "1975-01-10T00:00:00Z", "discountPercentage": 80, "discountPurchaseAt": "1986-12-22T00:00:00Z", "discountedPrice": 90, "expireAt": "1972-11-29T00:00:00Z", "price": 26, "purchaseAt": "1983-10-12T00:00:00Z", "trialPrice": 32}, {"currencyCode": "iHwe48OM", "currencyNamespace": "72ZUvT4v", "currencyType": "REAL", "discountAmount": 34, "discountExpireAt": "1979-07-16T00:00:00Z", "discountPercentage": 58, "discountPurchaseAt": "1988-12-03T00:00:00Z", "discountedPrice": 42, "expireAt": "1979-06-18T00:00:00Z", "price": 30, "purchaseAt": "1972-05-02T00:00:00Z", "trialPrice": 11}], "HxuqfY4F": [{"currencyCode": "johPQYCY", "currencyNamespace": "uEo4LtuO", "currencyType": "VIRTUAL", "discountAmount": 21, "discountExpireAt": "1994-05-14T00:00:00Z", "discountPercentage": 99, "discountPurchaseAt": "1984-02-03T00:00:00Z", "discountedPrice": 7, "expireAt": "1980-10-12T00:00:00Z", "price": 30, "purchaseAt": "1982-08-30T00:00:00Z", "trialPrice": 30}, {"currencyCode": "dYVanvDh", "currencyNamespace": "LceSEuZF", "currencyType": "REAL", "discountAmount": 39, "discountExpireAt": "1975-10-27T00:00:00Z", "discountPercentage": 61, "discountPurchaseAt": "1992-04-30T00:00:00Z", "discountedPrice": 19, "expireAt": "1998-03-19T00:00:00Z", "price": 3, "purchaseAt": "1983-06-27T00:00:00Z", "trialPrice": 64}, {"currencyCode": "wV2BVuhl", "currencyNamespace": "ZWamHNbK", "currencyType": "VIRTUAL", "discountAmount": 69, "discountExpireAt": "1994-02-17T00:00:00Z", "discountPercentage": 38, "discountPurchaseAt": "1974-08-16T00:00:00Z", "discountedPrice": 55, "expireAt": "1971-07-21T00:00:00Z", "price": 38, "purchaseAt": "1975-11-03T00:00:00Z", "trialPrice": 86}], "ZmmNtSSF": [{"currencyCode": "qEpLwJPv", "currencyNamespace": "Kq1WcfEb", "currencyType": "REAL", "discountAmount": 98, "discountExpireAt": "1974-09-04T00:00:00Z", "discountPercentage": 46, "discountPurchaseAt": "1973-05-11T00:00:00Z", "discountedPrice": 92, "expireAt": "1972-04-02T00:00:00Z", "price": 40, "purchaseAt": "1991-12-17T00:00:00Z", "trialPrice": 7}, {"currencyCode": "kiN8WKls", "currencyNamespace": "57B9My1n", "currencyType": "VIRTUAL", "discountAmount": 84, "discountExpireAt": "1989-02-12T00:00:00Z", "discountPercentage": 100, "discountPurchaseAt": "1978-09-02T00:00:00Z", "discountedPrice": 10, "expireAt": "1993-07-26T00:00:00Z", "price": 19, "purchaseAt": "1973-09-08T00:00:00Z", "trialPrice": 70}, {"currencyCode": "PGOVdo74", "currencyNamespace": "CtJhLJnS", "currencyType": "REAL", "discountAmount": 14, "discountExpireAt": "1998-03-31T00:00:00Z", "discountPercentage": 49, "discountPurchaseAt": "1987-06-03T00:00:00Z", "discountedPrice": 11, "expireAt": "1987-12-08T00:00:00Z", "price": 52, "purchaseAt": "1991-03-29T00:00:00Z", "trialPrice": 32}]}}, {"itemIdentities": ["2ykxyyn1", "XW6dwuuN", "wvUtCst9"], "itemIdentityType": "ITEM_ID", "regionData": {"SMlJNmFp": [{"currencyCode": "aOhK41dd", "currencyNamespace": "acCswJ9x", "currencyType": "REAL", "discountAmount": 42, "discountExpireAt": "1976-01-10T00:00:00Z", "discountPercentage": 100, "discountPurchaseAt": "1990-07-01T00:00:00Z", "discountedPrice": 13, "expireAt": "1974-07-15T00:00:00Z", "price": 15, "purchaseAt": "1981-11-06T00:00:00Z", "trialPrice": 21}, {"currencyCode": "WWJTgnsx", "currencyNamespace": "ZfkXqI0K", "currencyType": "REAL", "discountAmount": 18, "discountExpireAt": "1999-11-17T00:00:00Z", "discountPercentage": 57, "discountPurchaseAt": "1980-11-21T00:00:00Z", "discountedPrice": 92, "expireAt": "1979-08-16T00:00:00Z", "price": 16, "purchaseAt": "1984-06-30T00:00:00Z", "trialPrice": 28}, {"currencyCode": "rcUrcyV3", "currencyNamespace": "49YKZCFD", "currencyType": "REAL", "discountAmount": 39, "discountExpireAt": "1993-01-05T00:00:00Z", "discountPercentage": 92, "discountPurchaseAt": "1977-08-21T00:00:00Z", "discountedPrice": 66, "expireAt": "1973-08-13T00:00:00Z", "price": 2, "purchaseAt": "1984-06-19T00:00:00Z", "trialPrice": 62}], "szBANQtP": [{"currencyCode": "CJBozrYC", "currencyNamespace": "gHUlICbl", "currencyType": "VIRTUAL", "discountAmount": 60, "discountExpireAt": "1990-03-05T00:00:00Z", "discountPercentage": 30, "discountPurchaseAt": "1988-03-29T00:00:00Z", "discountedPrice": 8, "expireAt": "1982-04-26T00:00:00Z", "price": 72, "purchaseAt": "1990-10-05T00:00:00Z", "trialPrice": 95}, {"currencyCode": "D58deHEQ", "currencyNamespace": "2QwzWXa8", "currencyType": "VIRTUAL", "discountAmount": 9, "discountExpireAt": "1974-10-02T00:00:00Z", "discountPercentage": 26, "discountPurchaseAt": "1977-01-11T00:00:00Z", "discountedPrice": 29, "expireAt": "1992-07-22T00:00:00Z", "price": 48, "purchaseAt": "1999-04-02T00:00:00Z", "trialPrice": 63}, {"currencyCode": "wCWAaNjM", "currencyNamespace": "nkWIgRzh", "currencyType": "VIRTUAL", "discountAmount": 39, "discountExpireAt": "1976-12-17T00:00:00Z", "discountPercentage": 73, "discountPurchaseAt": "1992-02-16T00:00:00Z", "discountedPrice": 73, "expireAt": "1975-10-11T00:00:00Z", "price": 32, "purchaseAt": "1981-10-25T00:00:00Z", "trialPrice": 95}], "wXygTF6A": [{"currencyCode": "yTtOv9Xa", "currencyNamespace": "pmVLhAI0", "currencyType": "REAL", "discountAmount": 87, "discountExpireAt": "1999-07-20T00:00:00Z", "discountPercentage": 39, "discountPurchaseAt": "1977-01-08T00:00:00Z", "discountedPrice": 38, "expireAt": "1982-12-27T00:00:00Z", "price": 43, "purchaseAt": "1987-06-19T00:00:00Z", "trialPrice": 2}, {"currencyCode": "ujqi5yZM", "currencyNamespace": "eSYQeYD9", "currencyType": "REAL", "discountAmount": 69, "discountExpireAt": "1995-02-17T00:00:00Z", "discountPercentage": 31, "discountPurchaseAt": "1991-08-24T00:00:00Z", "discountedPrice": 78, "expireAt": "1977-01-31T00:00:00Z", "price": 1, "purchaseAt": "1999-09-03T00:00:00Z", "trialPrice": 85}, {"currencyCode": "c5yIuNkm", "currencyNamespace": "JaWiZlcz", "currencyType": "REAL", "discountAmount": 56, "discountExpireAt": "1989-07-15T00:00:00Z", "discountPercentage": 61, "discountPurchaseAt": "1988-11-05T00:00:00Z", "discountedPrice": 28, "expireAt": "1993-10-16T00:00:00Z", "price": 66, "purchaseAt": "1987-05-15T00:00:00Z", "trialPrice": 92}]}}, {"itemIdentities": ["UwVMTNZZ", "f6UjHhlp", "fxvUcLnB"], "itemIdentityType": "ITEM_SKU", "regionData": {"syKFC83D": [{"currencyCode": "rqW2jEac", "currencyNamespace": "SooFsWIH", "currencyType": "VIRTUAL", "discountAmount": 40, "discountExpireAt": "1992-04-21T00:00:00Z", "discountPercentage": 91, "discountPurchaseAt": "1991-02-16T00:00:00Z", "discountedPrice": 13, "expireAt": "1993-11-01T00:00:00Z", "price": 75, "purchaseAt": "1983-09-07T00:00:00Z", "trialPrice": 15}, {"currencyCode": "00s74UTt", "currencyNamespace": "i1zv6iM3", "currencyType": "VIRTUAL", "discountAmount": 81, "discountExpireAt": "1971-12-30T00:00:00Z", "discountPercentage": 31, "discountPurchaseAt": "1983-07-22T00:00:00Z", "discountedPrice": 17, "expireAt": "1991-08-09T00:00:00Z", "price": 25, "purchaseAt": "1984-09-21T00:00:00Z", "trialPrice": 60}, {"currencyCode": "1OGLwj6p", "currencyNamespace": "IrPoCOT4", "currencyType": "REAL", "discountAmount": 49, "discountExpireAt": "1989-09-07T00:00:00Z", "discountPercentage": 74, "discountPurchaseAt": "1996-07-09T00:00:00Z", "discountedPrice": 89, "expireAt": "1989-10-29T00:00:00Z", "price": 91, "purchaseAt": "1977-05-20T00:00:00Z", "trialPrice": 23}], "5OQogppk": [{"currencyCode": "sFfuop21", "currencyNamespace": "ha44Es3u", "currencyType": "VIRTUAL", "discountAmount": 11, "discountExpireAt": "1984-02-12T00:00:00Z", "discountPercentage": 58, "discountPurchaseAt": "1985-12-27T00:00:00Z", "discountedPrice": 86, "expireAt": "1979-11-02T00:00:00Z", "price": 88, "purchaseAt": "1979-05-09T00:00:00Z", "trialPrice": 1}, {"currencyCode": "dVFSvEY5", "currencyNamespace": "A6ucWDUq", "currencyType": "REAL", "discountAmount": 2, "discountExpireAt": "1979-11-25T00:00:00Z", "discountPercentage": 68, "discountPurchaseAt": "1997-07-24T00:00:00Z", "discountedPrice": 7, "expireAt": "1976-10-10T00:00:00Z", "price": 63, "purchaseAt": "1988-10-20T00:00:00Z", "trialPrice": 43}, {"currencyCode": "m2424F9U", "currencyNamespace": "v2i1QArq", "currencyType": "REAL", "discountAmount": 18, "discountExpireAt": "1975-04-11T00:00:00Z", "discountPercentage": 85, "discountPurchaseAt": "1981-03-04T00:00:00Z", "discountedPrice": 2, "expireAt": "1975-11-20T00:00:00Z", "price": 29, "purchaseAt": "1979-02-27T00:00:00Z", "trialPrice": 56}], "OYBstTbM": [{"currencyCode": "LPgfuC8F", "currencyNamespace": "gYZlEAk0", "currencyType": "REAL", "discountAmount": 28, "discountExpireAt": "1990-05-07T00:00:00Z", "discountPercentage": 98, "discountPurchaseAt": "1998-02-24T00:00:00Z", "discountedPrice": 63, "expireAt": "1975-10-15T00:00:00Z", "price": 11, "purchaseAt": "1997-01-03T00:00:00Z", "trialPrice": 21}, {"currencyCode": "e5ZMRu5t", "currencyNamespace": "YM5gkMkE", "currencyType": "VIRTUAL", "discountAmount": 0, "discountExpireAt": "1983-02-16T00:00:00Z", "discountPercentage": 45, "discountPurchaseAt": "1996-05-21T00:00:00Z", "discountedPrice": 78, "expireAt": "1984-09-21T00:00:00Z", "price": 14, "purchaseAt": "1994-05-01T00:00:00Z", "trialPrice": 0}, {"currencyCode": "2vDBaS69", "currencyNamespace": "MM0jR5TA", "currencyType": "VIRTUAL", "discountAmount": 41, "discountExpireAt": "1975-07-07T00:00:00Z", "discountPercentage": 49, "discountPurchaseAt": "1989-01-21T00:00:00Z", "discountedPrice": 90, "expireAt": "1975-09-03T00:00:00Z", "price": 49, "purchaseAt": "1991-01-17T00:00:00Z", "trialPrice": 37}]}}]}' \
    > test.out 2>&1
eval_tap $? 138 'BulkUpdateRegionData' test.out

#- 139 SearchItems
./ng net.accelbyte.sdk.cli.Main platform searchItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemType 'EXTENSION' \
    --limit '40' \
    --offset '5' \
    --sortBy 'Fvehvvdv' \
    --storeId 'Wxsuw0Kn' \
    --keyword 'SvueHX96' \
    --language 'HLnjOuC9' \
    > test.out 2>&1
eval_tap $? 139 'SearchItems' test.out

#- 140 QueryUncategorizedItems
./ng net.accelbyte.sdk.cli.Main platform queryUncategorizedItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --limit '48' \
    --offset '96' \
    --sortBy 'name,displayOrder:asc,updatedAt' \
    --storeId 'ZS8Lu6dV' \
    > test.out 2>&1
eval_tap $? 140 'QueryUncategorizedItems' test.out

#- 141 GetItem
./ng net.accelbyte.sdk.cli.Main platform getItem \
    --itemId 'En2psVxk' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'IztnJThW' \
    > test.out 2>&1
eval_tap $? 141 'GetItem' test.out

#- 142 UpdateItem
./ng net.accelbyte.sdk.cli.Main platform updateItem \
    --itemId 'x5CPUFlr' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ki0iiLRE' \
    --body '{"appId": "ilENe7Yc", "appType": "SOFTWARE", "baseAppId": "whXdKL1J", "boothName": "gomHCJcW", "categoryPath": "LOBo1iZs", "clazz": "fRC5TbMH", "displayOrder": 52, "entitlementType": "CONSUMABLE", "ext": {"Y4c0br33": {}, "7CvLQQ9j": {}, "qHg4odke": {}}, "features": ["kTt9yKO2", "hUGeyAAP", "E4A4Dopg"], "flexible": false, "images": [{"as": "5UZ83D8D", "caption": "SqbKzIhT", "height": 34, "imageUrl": "OItIjvhV", "smallImageUrl": "1m8ee9er", "width": 27}, {"as": "xBc6ZNqV", "caption": "tBXICtD7", "height": 12, "imageUrl": "xUuka7xj", "smallImageUrl": "OxOySG5c", "width": 77}, {"as": "WKAbaqH3", "caption": "XSOD8qvw", "height": 84, "imageUrl": "MZN0R396", "smallImageUrl": "0lg6giiy", "width": 37}], "inventoryConfig": {"customAttributes": {"LGrVmJSX": {}, "1aKnzlkf": {}, "gMi0MSr8": {}}, "serverCustomAttributes": {"mgogl4GZ": {}, "HSjNOpYR": {}, "ZMli7gjZ": {}}, "slotUsed": 5}, "itemIds": ["A19xieEg", "xOjALQqW", "6YY9RdZt"], "itemQty": {"7Hczvm5D": 91, "cLLAXQuu": 44, "CD4JT38w": 45}, "itemType": "APP", "listable": true, "localizations": {"Gili6yLH": {"description": "GIgd5uto", "localExt": {"U5i9DdY9": {}, "B4J1x1R0": {}, "1HFDeTGe": {}}, "longDescription": "qmqIdZYD", "title": "Ys05ohca"}, "zLa3KGpH": {"description": "1OO3AiSG", "localExt": {"nboBzQdx": {}, "Trnvilkf": {}, "pQI7YQB6": {}}, "longDescription": "EH98z2FW", "title": "E362lLAF"}, "dpSj4E5R": {"description": "7d4mCMKi", "localExt": {"3L6jAynu": {}, "Y6HMwc5R": {}, "ZT3J9Qp1": {}}, "longDescription": "zpcg1U20", "title": "mDIKAwOL"}}, "lootBoxConfig": {"rewardCount": 22, "rewards": [{"lootBoxItems": [{"count": 40, "duration": 95, "endDate": "1999-04-04T00:00:00Z", "itemId": "aSV4laAN", "itemSku": "i5Iq0P0s", "itemType": "e9PyY0pl"}, {"count": 99, "duration": 6, "endDate": "1971-12-14T00:00:00Z", "itemId": "kcQqRehA", "itemSku": "JjXEewkN", "itemType": "uaGFKjCC"}, {"count": 66, "duration": 21, "endDate": "1989-08-13T00:00:00Z", "itemId": "byoqEO60", "itemSku": "QACdNqSN", "itemType": "1nLC2jsv"}], "name": "ALotWe7d", "odds": 0.4095960480167684, "type": "PROBABILITY_GROUP", "weight": 8}, {"lootBoxItems": [{"count": 43, "duration": 15, "endDate": "1995-08-19T00:00:00Z", "itemId": "ERjPRBJ8", "itemSku": "15m4SvBf", "itemType": "Fk7MQgHz"}, {"count": 17, "duration": 77, "endDate": "1982-06-24T00:00:00Z", "itemId": "NMFjpCq5", "itemSku": "rJMSCMpl", "itemType": "64d2nQer"}, {"count": 86, "duration": 75, "endDate": "1989-10-21T00:00:00Z", "itemId": "ij2uOo2E", "itemSku": "k2xg1yE6", "itemType": "hOLVxShn"}], "name": "GLavBsJH", "odds": 0.6765711761690862, "type": "PROBABILITY_GROUP", "weight": 0}, {"lootBoxItems": [{"count": 93, "duration": 79, "endDate": "1999-09-08T00:00:00Z", "itemId": "WhwnddHS", "itemSku": "LNTrMuuC", "itemType": "IV8HK461"}, {"count": 45, "duration": 93, "endDate": "1975-10-27T00:00:00Z", "itemId": "Mp7LcLtN", "itemSku": "9DSPmeL2", "itemType": "LBehqRkT"}, {"count": 44, "duration": 55, "endDate": "1974-11-24T00:00:00Z", "itemId": "TkfetxYY", "itemSku": "1U6bhVIG", "itemType": "O65vZm4o"}], "name": "HOhyovfo", "odds": 0.7499910199582391, "type": "REWARD", "weight": 14}], "rollFunction": "DEFAULT"}, "maxCount": 68, "maxCountPerUser": 90, "name": "n2CRGmgq", "optionBoxConfig": {"boxItems": [{"count": 75, "duration": 84, "endDate": "1977-03-04T00:00:00Z", "itemId": "r4LFjZ0W", "itemSku": "YqFzpbDi", "itemType": "806ryDwY"}, {"count": 9, "duration": 3, "endDate": "1974-06-22T00:00:00Z", "itemId": "EMS3lvnU", "itemSku": "DIEL1sUd", "itemType": "n6TQzFl5"}, {"count": 86, "duration": 96, "endDate": "1981-08-03T00:00:00Z", "itemId": "7DOvKCVr", "itemSku": "WBi9xjFO", "itemType": "sDK6r8H5"}]}, "purchasable": true, "recurring": {"cycle": "MONTHLY", "fixedFreeDays": 17, "fixedTrialCycles": 16, "graceDays": 17}, "regionData": {"RkNj8VpD": [{"currencyCode": "D5p1fice", "currencyNamespace": "WTj1ufGf", "currencyType": "REAL", "discountAmount": 17, "discountExpireAt": "1992-05-16T00:00:00Z", "discountPercentage": 84, "discountPurchaseAt": "1972-12-06T00:00:00Z", "expireAt": "1983-02-06T00:00:00Z", "price": 57, "purchaseAt": "1977-06-19T00:00:00Z", "trialPrice": 4}, {"currencyCode": "f4oREqJV", "currencyNamespace": "V63WyQ0A", "currencyType": "REAL", "discountAmount": 16, "discountExpireAt": "1972-05-26T00:00:00Z", "discountPercentage": 51, "discountPurchaseAt": "1989-11-23T00:00:00Z", "expireAt": "1988-08-12T00:00:00Z", "price": 8, "purchaseAt": "1994-09-11T00:00:00Z", "trialPrice": 50}, {"currencyCode": "gQBu9Zmv", "currencyNamespace": "5FjnS7Ps", "currencyType": "REAL", "discountAmount": 0, "discountExpireAt": "1972-11-22T00:00:00Z", "discountPercentage": 8, "discountPurchaseAt": "1994-05-29T00:00:00Z", "expireAt": "1990-11-04T00:00:00Z", "price": 31, "purchaseAt": "1992-10-25T00:00:00Z", "trialPrice": 77}], "AxXN6My2": [{"currencyCode": "qCA8uQs4", "currencyNamespace": "dUNwSpPk", "currencyType": "VIRTUAL", "discountAmount": 61, "discountExpireAt": "1995-10-22T00:00:00Z", "discountPercentage": 10, "discountPurchaseAt": "1983-09-07T00:00:00Z", "expireAt": "1988-08-29T00:00:00Z", "price": 37, "purchaseAt": "1994-01-28T00:00:00Z", "trialPrice": 91}, {"currencyCode": "eTDWVzQG", "currencyNamespace": "OIAiNwg7", "currencyType": "VIRTUAL", "discountAmount": 78, "discountExpireAt": "1976-03-31T00:00:00Z", "discountPercentage": 32, "discountPurchaseAt": "1996-07-04T00:00:00Z", "expireAt": "1994-12-17T00:00:00Z", "price": 70, "purchaseAt": "1996-06-06T00:00:00Z", "trialPrice": 9}, {"currencyCode": "iPYQTnPJ", "currencyNamespace": "QFSpYFbe", "currencyType": "REAL", "discountAmount": 15, "discountExpireAt": "1977-06-17T00:00:00Z", "discountPercentage": 25, "discountPurchaseAt": "1973-11-11T00:00:00Z", "expireAt": "1992-07-02T00:00:00Z", "price": 26, "purchaseAt": "1994-10-05T00:00:00Z", "trialPrice": 10}], "ULuMMeZN": [{"currencyCode": "3xM1LHVV", "currencyNamespace": "tIUlcBIA", "currencyType": "REAL", "discountAmount": 36, "discountExpireAt": "1976-11-06T00:00:00Z", "discountPercentage": 18, "discountPurchaseAt": "1980-06-14T00:00:00Z", "expireAt": "1997-08-22T00:00:00Z", "price": 27, "purchaseAt": "1972-06-30T00:00:00Z", "trialPrice": 30}, {"currencyCode": "Tvf9O8lu", "currencyNamespace": "UrYCBP1K", "currencyType": "REAL", "discountAmount": 50, "discountExpireAt": "1987-09-09T00:00:00Z", "discountPercentage": 63, "discountPurchaseAt": "1983-09-04T00:00:00Z", "expireAt": "1996-09-13T00:00:00Z", "price": 51, "purchaseAt": "1972-10-06T00:00:00Z", "trialPrice": 60}, {"currencyCode": "a3e3tenz", "currencyNamespace": "Jy1PKAQh", "currencyType": "REAL", "discountAmount": 50, "discountExpireAt": "1976-07-16T00:00:00Z", "discountPercentage": 81, "discountPurchaseAt": "1980-07-13T00:00:00Z", "expireAt": "1992-08-25T00:00:00Z", "price": 64, "purchaseAt": "1991-06-07T00:00:00Z", "trialPrice": 62}]}, "saleConfig": {"currencyCode": "G750AwFu", "price": 85}, "seasonType": "TIER", "sectionExclusive": true, "sellable": true, "sku": "Hpbfn3J3", "stackable": true, "status": "ACTIVE", "tags": ["2KHnTcGH", "yDhstTgL", "sHXIy0q8"], "targetCurrencyCode": "GZtZtWsf", "targetNamespace": "RmRKxWUO", "thumbnailUrl": "xYLEkwyx", "useCount": 21}' \
    > test.out 2>&1
eval_tap $? 142 'UpdateItem' test.out

#- 143 DeleteItem
./ng net.accelbyte.sdk.cli.Main platform deleteItem \
    --itemId 'KoRZWmjN' \
    --namespace "$AB_NAMESPACE" \
    --featuresToCheck 'DLC,ENTITLEMENT,ENTITLEMENT' \
    --force  \
    --storeId '1EMgarWY' \
    > test.out 2>&1
eval_tap $? 143 'DeleteItem' test.out

#- 144 AcquireItem
./ng net.accelbyte.sdk.cli.Main platform acquireItem \
    --itemId 'DOffjJVy' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 50, "orderNo": "TwmWrNSL"}' \
    > test.out 2>&1
eval_tap $? 144 'AcquireItem' test.out

#- 145 GetApp
./ng net.accelbyte.sdk.cli.Main platform getApp \
    --itemId '0tWBjaPA' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId '5MNgOa1f' \
    > test.out 2>&1
eval_tap $? 145 'GetApp' test.out

#- 146 UpdateApp
./ng net.accelbyte.sdk.cli.Main platform updateApp \
    --itemId '63SVtgA4' \
    --namespace "$AB_NAMESPACE" \
    --storeId '8UAu8Lft' \
    --body '{"carousel": [{"alt": "kfBG5X8Q", "previewUrl": "JQALwoaQ", "thumbnailUrl": "9kxuW5Bz", "type": "video", "url": "tsmuIcU6", "videoSource": "youtube"}, {"alt": "f7rqw6NY", "previewUrl": "AFCTaBQO", "thumbnailUrl": "dUhFjUIE", "type": "video", "url": "9xjGvQWV", "videoSource": "generic"}, {"alt": "AdwU0CM6", "previewUrl": "eQxQORxd", "thumbnailUrl": "hFOxUlHc", "type": "image", "url": "yo25RAMh", "videoSource": "youtube"}], "developer": "4t9l12cb", "forumUrl": "HFDKCbIu", "genres": ["RPG", "Sports", "Casual"], "localizations": {"QiSapsIF": {"announcement": "0h9dB8xj", "slogan": "x6xW9OwR"}, "PDW329qt": {"announcement": "E15LSapO", "slogan": "ZvveJ9FC"}, "WAc3jCUB": {"announcement": "8hZqaf34", "slogan": "sl9Lr3Mh"}}, "platformRequirements": {"I0luW3dv": [{"additionals": "3nKqL1YN", "directXVersion": "fbZVfP41", "diskSpace": "03YnwrF7", "graphics": "350h30Sf", "label": "8mYDHONM", "osVersion": "Od1W1oz4", "processor": "xS5kxNxQ", "ram": "37KAqgaN", "soundCard": "YYmckLmP"}, {"additionals": "pVAZjmL0", "directXVersion": "GlZGVe8K", "diskSpace": "25VUSNVK", "graphics": "Ez1XwSSJ", "label": "iqDYO9Ip", "osVersion": "cGkQcG61", "processor": "b7dB8hhj", "ram": "c6Igft1o", "soundCard": "v3pN5Vf1"}, {"additionals": "i14bWBQp", "directXVersion": "PK7NvcHp", "diskSpace": "hOmBzQgk", "graphics": "23vCZL3E", "label": "3CtKyL9S", "osVersion": "Kl1j20eB", "processor": "pKDreyjt", "ram": "nfrDO1At", "soundCard": "27spYI06"}], "glpVjyNl": [{"additionals": "p9GXy42s", "directXVersion": "xpgrxvkA", "diskSpace": "NfRtzuyQ", "graphics": "VaTldsld", "label": "lPavwiF3", "osVersion": "x9cPptPf", "processor": "gNqgYUC8", "ram": "Tk6aNH07", "soundCard": "OYXZzgWh"}, {"additionals": "CspwzDGX", "directXVersion": "xifikx2v", "diskSpace": "Fuu3vuNj", "graphics": "mPFjazmd", "label": "quxh3klG", "osVersion": "zljFCq95", "processor": "O5Nuv8Ez", "ram": "pMAn9U0q", "soundCard": "eOlU88LA"}, {"additionals": "te8genuZ", "directXVersion": "q9fS4QhA", "diskSpace": "4mPTljbH", "graphics": "wOgODmIF", "label": "gCHklb5V", "osVersion": "FFnb7agz", "processor": "MqqkdGaR", "ram": "XrQnfPaK", "soundCard": "7YL9nyvj"}], "pM0ycPyJ": [{"additionals": "a55Jl4j3", "directXVersion": "d4WsveiE", "diskSpace": "Sr6d7hTT", "graphics": "2fSsoUaY", "label": "ZNgFTXQg", "osVersion": "XFWUSSgC", "processor": "i5i50Izp", "ram": "VxVvDeUh", "soundCard": "Z47bALF6"}, {"additionals": "Doe8JlRA", "directXVersion": "Z7DtcSCo", "diskSpace": "0xj4voDn", "graphics": "qjr4aPNG", "label": "pcZuOqxT", "osVersion": "mdTWElOj", "processor": "5f80IIDf", "ram": "od3dM7VA", "soundCard": "BWL17Py6"}, {"additionals": "Bj87fr8E", "directXVersion": "1fygofEf", "diskSpace": "yFW210QL", "graphics": "bvEM2rBh", "label": "XH0ogfLK", "osVersion": "uNyG3LCg", "processor": "l3GWQAd4", "ram": "jBeuwLcC", "soundCard": "oYCsFj7A"}]}, "platforms": ["Android", "IOS", "Linux"], "players": ["Multi", "CrossPlatformMulti", "CrossPlatformMulti"], "primaryGenre": "MassivelyMultiplayer", "publisher": "A5oYgV3n", "releaseDate": "1972-01-11T00:00:00Z", "websiteUrl": "CMTFPhN4"}' \
    > test.out 2>&1
eval_tap $? 146 'UpdateApp' test.out

#- 147 DisableItem
./ng net.accelbyte.sdk.cli.Main platform disableItem \
    --itemId 'i0BjtZdJ' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'L14McciW' \
    --body '{"featuresToCheck": ["DLC", "REWARD"]}' \
    > test.out 2>&1
eval_tap $? 147 'DisableItem' test.out

#- 148 GetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform getItemDynamicData \
    --itemId '9P4p6haC' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 148 'GetItemDynamicData' test.out

#- 149 EnableItem
./ng net.accelbyte.sdk.cli.Main platform enableItem \
    --itemId '3d9b4CFp' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Z4ONpmuJ' \
    > test.out 2>&1
eval_tap $? 149 'EnableItem' test.out

#- 150 FeatureItem
./ng net.accelbyte.sdk.cli.Main platform featureItem \
    --feature 'szDpJr7Y' \
    --itemId 'BSraxTpE' \
    --namespace "$AB_NAMESPACE" \
    --storeId '6VXuR59j' \
    > test.out 2>&1
eval_tap $? 150 'FeatureItem' test.out

#- 151 DefeatureItem
./ng net.accelbyte.sdk.cli.Main platform defeatureItem \
    --feature 'unCcDaDh' \
    --itemId 'xRtTWIXD' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'eS8jJRwI' \
    > test.out 2>&1
eval_tap $? 151 'DefeatureItem' test.out

#- 152 GetLocaleItem
./ng net.accelbyte.sdk.cli.Main platform getLocaleItem \
    --itemId 'LTxQufSx' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'Oc4MamaT' \
    --populateBundle  \
    --region 'I7OX0h5H' \
    --storeId 'Csnk3SMP' \
    > test.out 2>&1
eval_tap $? 152 'GetLocaleItem' test.out

#- 153 UpdateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform updateItemPurchaseCondition \
    --itemId 'zdKbU5RM' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'iXLyryag' \
    --body '{"purchaseCondition": {"conditionGroups": [{"operator": "and", "predicates": [{"anyOf": 45, "code": "OIssbSxA", "comparison": "isLessThanOrEqual", "name": "QWUqIif8", "predicateType": "EntitlementPredicate", "value": "DiWcTsAF", "values": ["oieFkH0e", "vxJtyhvI", "FnjxVF0K"]}, {"anyOf": 32, "code": "f72qX9Xo", "comparison": "includes", "name": "ZunBlgKo", "predicateType": "StatisticCodePredicate", "value": "gQzOVfdY", "values": ["3QctjI4g", "KTSpJHJT", "Kqb5bvUF"]}, {"anyOf": 41, "code": "gCwkZdbP", "comparison": "isLessThan", "name": "8ikZvKZO", "predicateType": "StatisticCodePredicate", "value": "UKnsXMng", "values": ["0ANeA6ST", "tGl1Qpuk", "vG33gFWw"]}]}, {"operator": "or", "predicates": [{"anyOf": 80, "code": "9z9T1i7k", "comparison": "excludes", "name": "Fm03eDzT", "predicateType": "SeasonTierPredicate", "value": "MArEMy8a", "values": ["AvArQFP7", "2Gf3yvY6", "DrN9gJcG"]}, {"anyOf": 80, "code": "DN2TPKVH", "comparison": "isNot", "name": "xUperVOQ", "predicateType": "SeasonPassPredicate", "value": "MmnMfaZx", "values": ["Qt3ZkpRC", "HtrbP3IL", "ZNxzsO0B"]}, {"anyOf": 58, "code": "ZCP40hhl", "comparison": "isGreaterThanOrEqual", "name": "5PTGs50p", "predicateType": "StatisticCodePredicate", "value": "JCHiwhvx", "values": ["BlHZ8rG8", "iYrwMzUc", "7Fnw6J1h"]}]}, {"operator": "or", "predicates": [{"anyOf": 69, "code": "T0g036DC", "comparison": "excludes", "name": "iMi6hYLo", "predicateType": "SeasonPassPredicate", "value": "1myd2gY1", "values": ["r3doevvh", "MQw6ktyX", "dfbjgNDT"]}, {"anyOf": 90, "code": "YjDylDuv", "comparison": "isLessThan", "name": "CqLYFprm", "predicateType": "StatisticCodePredicate", "value": "dOWFipfE", "values": ["VGnorC9Y", "9qQjmEcG", "Tjh8aPoi"]}, {"anyOf": 21, "code": "CGI215ua", "comparison": "isLessThan", "name": "TIWjZbe6", "predicateType": "SeasonPassPredicate", "value": "BdnhMKX9", "values": ["P1gXyqTk", "qymAlN9o", "4AyvhAHo"]}]}]}}' \
    > test.out 2>&1
eval_tap $? 153 'UpdateItemPurchaseCondition' test.out

#- 154 QueryItemReferences
./ng net.accelbyte.sdk.cli.Main platform queryItemReferences \
    --itemId 'k45wHDX1' \
    --namespace "$AB_NAMESPACE" \
    --featuresToCheck 'DLC,CATALOG,ENTITLEMENT' \
    --storeId '2zu3iric' \
    > test.out 2>&1
eval_tap $? 154 'QueryItemReferences' test.out

#- 155 ReturnItem
./ng net.accelbyte.sdk.cli.Main platform returnItem \
    --itemId 'hEfbmVY7' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "fa452SqG"}' \
    > test.out 2>&1
eval_tap $? 155 'ReturnItem' test.out

#- 156 QueryKeyGroups
./ng net.accelbyte.sdk.cli.Main platform queryKeyGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '53' \
    --name 'KG0iqEqK' \
    --offset '89' \
    --tag 'RTQKhLCo' \
    > test.out 2>&1
eval_tap $? 156 'QueryKeyGroups' test.out

#- 157 CreateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform createKeyGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "auKxxVOa", "name": "69c5Ynlj", "status": "INACTIVE", "tags": ["1AYY4zCl", "N3WLZtBc", "zJHDxH3i"]}' \
    > test.out 2>&1
eval_tap $? 157 'CreateKeyGroup' test.out

#- 158 GetKeyGroupByBoothName
eval_tap 0 158 'GetKeyGroupByBoothName # SKIP deprecated' test.out

#- 159 GetKeyGroup
./ng net.accelbyte.sdk.cli.Main platform getKeyGroup \
    --keyGroupId 'R4cFou2K' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 159 'GetKeyGroup' test.out

#- 160 UpdateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform updateKeyGroup \
    --keyGroupId 'eKfRa6FP' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "Q6oqNcQv", "name": "XuqW7T4X", "status": "INACTIVE", "tags": ["0ezq92yZ", "sccsUyeA", "Bzv4GYrP"]}' \
    > test.out 2>&1
eval_tap $? 160 'UpdateKeyGroup' test.out

#- 161 GetKeyGroupDynamic
./ng net.accelbyte.sdk.cli.Main platform getKeyGroupDynamic \
    --keyGroupId 'YcK8qCFX' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 161 'GetKeyGroupDynamic' test.out

#- 162 ListKeys
./ng net.accelbyte.sdk.cli.Main platform listKeys \
    --keyGroupId 'OxF5F2uf' \
    --namespace "$AB_NAMESPACE" \
    --limit '48' \
    --offset '41' \
    --status 'ACTIVE' \
    > test.out 2>&1
eval_tap $? 162 'ListKeys' test.out

#- 163 UploadKeys
./ng net.accelbyte.sdk.cli.Main platform uploadKeys \
    --keyGroupId 'Icr44hwj' \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 163 'UploadKeys' test.out

#- 164 QueryOrders
./ng net.accelbyte.sdk.cli.Main platform queryOrders \
    --namespace "$AB_NAMESPACE" \
    --endTime 'DX0WDfZO' \
    --limit '88' \
    --offset '61' \
    --orderNos '4RfKp2P7,OPKHFYBZ,3xIcReLj' \
    --sortBy 'qcX9W2eF' \
    --startTime 'hU0QYp8R' \
    --status 'FULFILLED' \
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
    --orderNo 'LVVs0tha' \
    > test.out 2>&1
eval_tap $? 166 'GetOrder' test.out

#- 167 RefundOrder
./ng net.accelbyte.sdk.cli.Main platform refundOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'g9L0YZxr' \
    --body '{"description": "i4LdPrSA"}' \
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
    --body '{"domains": ["cHUpk9ng", "MqpwSUYi", "lNr8s2Pm"]}' \
    > test.out 2>&1
eval_tap $? 171 'UpdatePaymentDomainWhitelistConfig' test.out

#- 172 QueryPaymentNotifications
./ng net.accelbyte.sdk.cli.Main platform queryPaymentNotifications \
    --namespace "$AB_NAMESPACE" \
    --endDate 'oztcWWD0' \
    --externalId 'cckgjZ8B' \
    --limit '10' \
    --notificationSource 'NEONPAY' \
    --notificationType 'QJlRQHnz' \
    --offset '50' \
    --paymentOrderNo 'p8EWnv3B' \
    --startDate 'KYYhTKik' \
    --status 'IGNORED' \
    > test.out 2>&1
eval_tap $? 172 'QueryPaymentNotifications' test.out

#- 173 QueryPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform queryPaymentOrders \
    --namespace "$AB_NAMESPACE" \
    --channel 'INTERNAL' \
    --extTxId 'kJjtHRys' \
    --limit '27' \
    --offset '3' \
    --status 'NOTIFICATION_OF_CHARGEBACK' \
    > test.out 2>&1
eval_tap $? 173 'QueryPaymentOrders' test.out

#- 174 CreatePaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform createPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --body '{"currencyCode": "lMxEelVx", "currencyNamespace": "vMdNbRAm", "customParameters": {"Xy0RHSvQ": {}, "o38Yzwtn": {}, "c2RpsUxO": {}}, "description": "jzD64PQW", "extOrderNo": "lgmNxHTk", "extUserId": "oLk5SLAU", "itemType": "EXTENSION", "language": "iz", "metadata": {"i01zn011": "dri3XknE", "bbti5v92": "44tL0tmk", "JvmC41BP": "p6chxdAl"}, "notifyUrl": "pAnM0o8O", "omitNotification": true, "platform": "QWL4fs6C", "price": 39, "recurringPaymentOrderNo": "c3qlTPSj", "region": "xIyT560S", "returnUrl": "v4gBvfvw", "sandbox": false, "sku": "qQ16ng08", "subscriptionId": "fDyxvSKb", "targetNamespace": "HRbh1W0R", "targetUserId": "TUCeb5Ms", "title": "nVRROHCU"}' \
    > test.out 2>&1
eval_tap $? 174 'CreatePaymentOrderByDedicated' test.out

#- 175 ListExtOrderNoByExtTxId
./ng net.accelbyte.sdk.cli.Main platform listExtOrderNoByExtTxId \
    --namespace "$AB_NAMESPACE" \
    --extTxId 'uvIELE96' \
    > test.out 2>&1
eval_tap $? 175 'ListExtOrderNoByExtTxId' test.out

#- 176 GetPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '1JA6RhJ6' \
    > test.out 2>&1
eval_tap $? 176 'GetPaymentOrder' test.out

#- 177 ChargePaymentOrder
./ng net.accelbyte.sdk.cli.Main platform chargePaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'jN3UiRj5' \
    --body '{"extTxId": "tBgrh3gk", "paymentMethod": "q6kTUlB5", "paymentProvider": "WALLET"}' \
    > test.out 2>&1
eval_tap $? 177 'ChargePaymentOrder' test.out

#- 178 RefundPaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform refundPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'Q6gxM4qF' \
    --body '{"description": "uxGFqsjF"}' \
    > test.out 2>&1
eval_tap $? 178 'RefundPaymentOrderByDedicated' test.out

#- 179 SimulatePaymentOrderNotification
./ng net.accelbyte.sdk.cli.Main platform simulatePaymentOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '7iQVKk7N' \
    --body '{"amount": 4, "currencyCode": "tigrsng8", "notifyType": "CHARGE", "paymentProvider": "ALIPAY", "salesTax": 81, "vat": 24}' \
    > test.out 2>&1
eval_tap $? 179 'SimulatePaymentOrderNotification' test.out

#- 180 GetPaymentOrderChargeStatus
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrderChargeStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'tQXkfDFo' \
    > test.out 2>&1
eval_tap $? 180 'GetPaymentOrderChargeStatus' test.out

#- 181 GetPsnEntitlementOwnership
./ng net.accelbyte.sdk.cli.Main platform getPsnEntitlementOwnership \
    --entitlementLabel 'rb9cPS3Q' \
    --namespace "$AB_NAMESPACE" \
    --body '{"accessToken": "D79fuxRn", "serviceLabel": 100}' \
    > test.out 2>&1
eval_tap $? 181 'GetPsnEntitlementOwnership' test.out

#- 182 GetXboxEntitlementOwnership
./ng net.accelbyte.sdk.cli.Main platform getXboxEntitlementOwnership \
    --namespace "$AB_NAMESPACE" \
    --productSku 'yupwMI4N' \
    --body '{"delegationToken": "pihsasZM", "sandboxId": "pC0ubGnC"}' \
    > test.out 2>&1
eval_tap $? 182 'GetXboxEntitlementOwnership' test.out

#- 183 GetPlatformEntitlementConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformEntitlementConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Playstation' \
    > test.out 2>&1
eval_tap $? 183 'GetPlatformEntitlementConfig' test.out

#- 184 UpdatePlatformEntitlementConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformEntitlementConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Xbox' \
    --body '{"allowedPlatformOrigins": ["Nintendo", "System", "Twitch"]}' \
    > test.out 2>&1
eval_tap $? 184 'UpdatePlatformEntitlementConfig' test.out

#- 185 GetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Playstation' \
    > test.out 2>&1
eval_tap $? 185 'GetPlatformWalletConfig' test.out

#- 186 UpdatePlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Steam' \
    --body '{"allowedBalanceOrigins": ["Epic", "GooglePlay", "Nintendo"]}' \
    > test.out 2>&1
eval_tap $? 186 'UpdatePlatformWalletConfig' test.out

#- 187 ResetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform resetPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Playstation' \
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
    --body '{"entitlement": {"consumable": {"enabled": false, "strategy": "CUSTOM"}, "durable": {"enabled": false, "strategy": "REVOKE_OR_REPORT"}}, "wallet": {"enabled": true, "strategy": "ALWAYS_REVOKE"}}' \
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
    --endTime 'bx8TzBfe' \
    --limit '60' \
    --offset '71' \
    --source 'IAP' \
    --startTime 'UYIlFgFv' \
    --status 'FAIL' \
    --transactionId '76LyIJfE' \
    --userId 'UGGchZTC' \
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
    --body '{"appConfig": {"appName": "VOMrGUyh"}, "customConfig": {"connectionType": "INSECURE", "grpcServerAddress": "bvSz8zom"}, "extendType": "APP"}' \
    > test.out 2>&1
eval_tap $? 193 'UpdateRevocationPluginConfig' test.out

#- 194 DeleteRevocationPluginConfig
./ng net.accelbyte.sdk.cli.Main platform deleteRevocationPluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 194 'DeleteRevocationPluginConfig' test.out

#- 195 UploadRevocationPluginConfigCert
./ng net.accelbyte.sdk.cli.Main platform uploadRevocationPluginConfigCert \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 195 'UploadRevocationPluginConfigCert' test.out

#- 196 CreateReward
./ng net.accelbyte.sdk.cli.Main platform createReward \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "YVB9vp5d", "eventTopic": "wqFWmw4E", "maxAwarded": 48, "maxAwardedPerUser": 13, "namespaceExpression": "6ByGvOEq", "rewardCode": "hrl3Yv4H", "rewardConditions": [{"condition": "TuSpIrOJ", "conditionName": "Dep6xOqX", "eventName": "QNGTwCaK", "rewardItems": [{"duration": 7, "endDate": "1971-02-13T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "lCGs8XZ6", "quantity": 88, "sku": "TYHEXw0s"}, {"duration": 79, "endDate": "1999-12-22T00:00:00Z", "identityType": "ITEM_ID", "itemId": "Trbihc5g", "quantity": 14, "sku": "CdyWk7u8"}, {"duration": 40, "endDate": "1982-04-04T00:00:00Z", "identityType": "ITEM_ID", "itemId": "HioFBGnD", "quantity": 80, "sku": "cTkdKeYO"}]}, {"condition": "ZyBCmU4G", "conditionName": "a4bbVbCf", "eventName": "s8dVjz0a", "rewardItems": [{"duration": 42, "endDate": "1979-01-28T00:00:00Z", "identityType": "ITEM_ID", "itemId": "8ro4q3TX", "quantity": 47, "sku": "hNWQkvXh"}, {"duration": 88, "endDate": "1973-01-04T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "Bjwl0LWU", "quantity": 72, "sku": "2ougzmeO"}, {"duration": 45, "endDate": "1971-07-14T00:00:00Z", "identityType": "ITEM_ID", "itemId": "tKWx9Y08", "quantity": 76, "sku": "YXPIgo3i"}]}, {"condition": "djNNxLLe", "conditionName": "0GkzoeeS", "eventName": "XbaRSQOQ", "rewardItems": [{"duration": 60, "endDate": "1983-03-03T00:00:00Z", "identityType": "ITEM_ID", "itemId": "o52OHbks", "quantity": 86, "sku": "U2tJvQM4"}, {"duration": 80, "endDate": "1976-10-22T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "IldgAPPs", "quantity": 24, "sku": "ML5Ntkuv"}, {"duration": 39, "endDate": "1997-01-09T00:00:00Z", "identityType": "ITEM_ID", "itemId": "qbcEJny0", "quantity": 15, "sku": "GoKIqhFX"}]}], "userIdExpression": "LSkCIAMN"}' \
    > test.out 2>&1
eval_tap $? 196 'CreateReward' test.out

#- 197 QueryRewards
./ng net.accelbyte.sdk.cli.Main platform queryRewards \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'SJwsX9TW' \
    --limit '6' \
    --offset '49' \
    --sortBy 'namespace:asc,namespace' \
    > test.out 2>&1
eval_tap $? 197 'QueryRewards' test.out

#- 198 ExportRewards
./ng net.accelbyte.sdk.cli.Main platform exportRewards \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 198 'ExportRewards' test.out

#- 199 ImportRewards
./ng net.accelbyte.sdk.cli.Main platform importRewards \
    --namespace "$AB_NAMESPACE" \
    --replaceExisting  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 199 'ImportRewards' test.out

#- 200 GetReward
./ng net.accelbyte.sdk.cli.Main platform getReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId '1T8pDvUF' \
    > test.out 2>&1
eval_tap $? 200 'GetReward' test.out

#- 201 UpdateReward
./ng net.accelbyte.sdk.cli.Main platform updateReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'RaR0KDrM' \
    --body '{"description": "REAV50k8", "eventTopic": "DlKOw8bl", "maxAwarded": 26, "maxAwardedPerUser": 94, "namespaceExpression": "d8Yjs8Ui", "rewardCode": "79eHCSif", "rewardConditions": [{"condition": "GY70FQEd", "conditionName": "Jv5Cppgh", "eventName": "VSfK7M5V", "rewardItems": [{"duration": 8, "endDate": "1992-12-24T00:00:00Z", "identityType": "ITEM_ID", "itemId": "o9gSdPyV", "quantity": 0, "sku": "zhGpU8J8"}, {"duration": 98, "endDate": "1973-07-18T00:00:00Z", "identityType": "ITEM_ID", "itemId": "fDyNDL1M", "quantity": 69, "sku": "H1TD95gT"}, {"duration": 66, "endDate": "1975-08-08T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "7BxBG6K2", "quantity": 59, "sku": "3dufBXge"}]}, {"condition": "ksvd6yWA", "conditionName": "47iLqR4M", "eventName": "zTY2Nn3L", "rewardItems": [{"duration": 19, "endDate": "1979-03-07T00:00:00Z", "identityType": "ITEM_ID", "itemId": "R5Jm4UF3", "quantity": 22, "sku": "vyBbt5Wd"}, {"duration": 39, "endDate": "1980-11-22T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "MWWCPgZe", "quantity": 43, "sku": "uX3gE5M2"}, {"duration": 93, "endDate": "1972-12-07T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "VIu0GrNG", "quantity": 56, "sku": "YvMeKLBY"}]}, {"condition": "jMUTVRbl", "conditionName": "g46NQ1rJ", "eventName": "Mhfc4Z5B", "rewardItems": [{"duration": 54, "endDate": "1997-11-11T00:00:00Z", "identityType": "ITEM_ID", "itemId": "qrFQJIOv", "quantity": 27, "sku": "z7LR4Ckn"}, {"duration": 10, "endDate": "1989-12-31T00:00:00Z", "identityType": "ITEM_ID", "itemId": "uVIyeUEu", "quantity": 15, "sku": "EBoXooGV"}, {"duration": 47, "endDate": "1979-10-06T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "bPUaJMB9", "quantity": 96, "sku": "uPGMkd9G"}]}], "userIdExpression": "q0m2n7we"}' \
    > test.out 2>&1
eval_tap $? 201 'UpdateReward' test.out

#- 202 DeleteReward
./ng net.accelbyte.sdk.cli.Main platform deleteReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'Orl0cWUD' \
    > test.out 2>&1
eval_tap $? 202 'DeleteReward' test.out

#- 203 CheckEventCondition
./ng net.accelbyte.sdk.cli.Main platform checkEventCondition \
    --namespace "$AB_NAMESPACE" \
    --rewardId '2td7Rxh3' \
    --body '{"payload": {"88z5k7X3": {}, "JK0g45Gq": {}, "BwcPKSM9": {}}}' \
    > test.out 2>&1
eval_tap $? 203 'CheckEventCondition' test.out

#- 204 DeleteRewardConditionRecord
./ng net.accelbyte.sdk.cli.Main platform deleteRewardConditionRecord \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'tOpsOnnX' \
    --body '{"conditionName": "28JZdzCN", "userId": "zGCQdr26"}' \
    > test.out 2>&1
eval_tap $? 204 'DeleteRewardConditionRecord' test.out

#- 205 QuerySections
./ng net.accelbyte.sdk.cli.Main platform querySections \
    --namespace "$AB_NAMESPACE" \
    --end 'jJshT7sk' \
    --limit '71' \
    --offset '19' \
    --start 'dAX0b0wi' \
    --storeId 'oGbVajjm' \
    --viewId 'GRTHKtVF' \
    > test.out 2>&1
eval_tap $? 205 'QuerySections' test.out

#- 206 CreateSection
./ng net.accelbyte.sdk.cli.Main platform createSection \
    --namespace "$AB_NAMESPACE" \
    --storeId 'aG6oej8W' \
    --body '{"active": false, "displayOrder": 3, "endDate": "1971-03-27T00:00:00Z", "ext": {"CgVg0wyk": {}, "RLL00EdX": {}, "hsvfV6Qz": {}}, "fixedPeriodRotationConfig": {"backfillType": "NONE", "duration": 46, "itemCount": 74, "rule": "LOOP"}, "items": [{"id": "456Blkap", "sku": "jKFOneEr"}, {"id": "5ppp42Ks", "sku": "SbME3n5O"}, {"id": "PH0OvgEv", "sku": "fWVUas24"}], "localizations": {"783I1WGr": {"description": "79pFluap", "localExt": {"V10IjG6V": {}, "unOfMUil": {}, "QM8X1MND": {}}, "longDescription": "ADk5rCLT", "title": "PNI20SRv"}, "HS3oH3Tc": {"description": "gztDqT6O", "localExt": {"KRqnBS4v": {}, "uJ8tsQ0u": {}, "IZmT7N0a": {}}, "longDescription": "GOmtIfFM", "title": "WkXiStdN"}, "wqJKjJ1Q": {"description": "13mqeHB0", "localExt": {"dhCGlz3W": {}, "MlBs4PUH": {}, "55JGrOJN": {}}, "longDescription": "SKSce2Cr", "title": "0QEmOa0t"}}, "name": "lvPMTP3n", "rotationType": "NONE", "startDate": "1986-04-24T00:00:00Z", "viewId": "kmRVb7uH"}' \
    > test.out 2>&1
eval_tap $? 206 'CreateSection' test.out

#- 207 PurgeExpiredSection
./ng net.accelbyte.sdk.cli.Main platform purgeExpiredSection \
    --namespace "$AB_NAMESPACE" \
    --storeId 'p5xzq58a' \
    > test.out 2>&1
eval_tap $? 207 'PurgeExpiredSection' test.out

#- 208 GetSection
./ng net.accelbyte.sdk.cli.Main platform getSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'BntGmvwd' \
    --storeId '9hZbCDyA' \
    > test.out 2>&1
eval_tap $? 208 'GetSection' test.out

#- 209 UpdateSection
./ng net.accelbyte.sdk.cli.Main platform updateSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'R0ty8QtX' \
    --storeId '6pnSWMkx' \
    --body '{"active": true, "displayOrder": 18, "endDate": "1989-10-05T00:00:00Z", "ext": {"usiz5vUJ": {}, "Szv04tCs": {}, "Yd2RE7De": {}}, "fixedPeriodRotationConfig": {"backfillType": "CUSTOM", "duration": 34, "itemCount": 24, "rule": "SEQUENCE"}, "items": [{"id": "fIXQFm7T", "sku": "N3HOOXld"}, {"id": "1Be3yvHu", "sku": "uDBFqFTi"}, {"id": "8BP4RLqp", "sku": "NExdEkAb"}], "localizations": {"56c90OhF": {"description": "yWdIuakX", "localExt": {"UQQrjJ4J": {}, "iH6iMwMz": {}, "9oo7AZzm": {}}, "longDescription": "Fg2E4lEJ", "title": "blJ3CGSS"}, "ZfmM0BdC": {"description": "4eK2TrKH", "localExt": {"dRH3LN09": {}, "ww6nxPEi": {}, "CqY8OtSi": {}}, "longDescription": "tt2Ptu3p", "title": "whuBNfbr"}, "OutG5RCz": {"description": "j9k1Ik0S", "localExt": {"agPPdOUY": {}, "ope4ZUac": {}, "4Xdjg9pg": {}}, "longDescription": "ytz7VBhf", "title": "YXclpbfU"}}, "name": "sj7xfboX", "rotationType": "FIXED_PERIOD", "startDate": "1971-06-04T00:00:00Z", "viewId": "9BNyW2vh"}' \
    > test.out 2>&1
eval_tap $? 209 'UpdateSection' test.out

#- 210 DeleteSection
./ng net.accelbyte.sdk.cli.Main platform deleteSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'HBMwNkwQ' \
    --storeId 'UgRid1qB' \
    > test.out 2>&1
eval_tap $? 210 'DeleteSection' test.out

#- 211 ListStores
./ng net.accelbyte.sdk.cli.Main platform listStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 211 'ListStores' test.out

#- 212 CreateStore
./ng net.accelbyte.sdk.cli.Main platform createStore \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultLanguage": "4sGnyDyZ", "defaultRegion": "IQfaK8JW", "description": "kZntZ2RX", "supportedLanguages": ["6fuYwB2i", "6d36vuJn", "WLuMP6Ov"], "supportedRegions": ["EznfUIns", "Q4vQfIPP", "Gc1L4QzL"], "title": "ZV0KQLzM"}' \
    > test.out 2>&1
eval_tap $? 212 'CreateStore' test.out

#- 213 GetCatalogDefinition
./ng net.accelbyte.sdk.cli.Main platform getCatalogDefinition \
    --namespace "$AB_NAMESPACE" \
    --catalogType 'APP' \
    > test.out 2>&1
eval_tap $? 213 'GetCatalogDefinition' test.out

#- 214 DownloadCSVTemplates
./ng net.accelbyte.sdk.cli.Main platform downloadCSVTemplates \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 214 'DownloadCSVTemplates' test.out

#- 215 ExportStoreByCSV
./ng net.accelbyte.sdk.cli.Main platform exportStoreByCSV \
    --namespace "$AB_NAMESPACE" \
    --body '{"catalogType": "CATEGORY", "fieldsToBeIncluded": ["ETFCHlvj", "vA6tLBAD", "HZKF6hWv"], "idsToBeExported": ["dPUNihcR", "FtomB0gP", "7OloyR1t"], "storeId": "qRPjnmhC"}' \
    > test.out 2>&1
eval_tap $? 215 'ExportStoreByCSV' test.out

#- 216 ImportStore
eval_tap 0 216 'ImportStore # SKIP deprecated' test.out

#- 217 GetPublishedStore
./ng net.accelbyte.sdk.cli.Main platform getPublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 217 'GetPublishedStore' test.out

#- 218 DeletePublishedStore
./ng net.accelbyte.sdk.cli.Main platform deletePublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 218 'DeletePublishedStore' test.out

#- 219 GetPublishedStoreBackup
./ng net.accelbyte.sdk.cli.Main platform getPublishedStoreBackup \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 219 'GetPublishedStoreBackup' test.out

#- 220 RollbackPublishedStore
./ng net.accelbyte.sdk.cli.Main platform rollbackPublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 220 'RollbackPublishedStore' test.out

#- 221 GetStore
./ng net.accelbyte.sdk.cli.Main platform getStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'DVNdonCi' \
    > test.out 2>&1
eval_tap $? 221 'GetStore' test.out

#- 222 UpdateStore
./ng net.accelbyte.sdk.cli.Main platform updateStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'KVzHWr8C' \
    --body '{"defaultLanguage": "LdXZAi8h", "defaultRegion": "uxbFPRm5", "description": "6oUCS41e", "supportedLanguages": ["wxIZ20LE", "THHtnbKQ", "1f5W9vkK"], "supportedRegions": ["FUt8hduM", "68XWrV3d", "xPZXsA9T"], "title": "KVmhTKr4"}' \
    > test.out 2>&1
eval_tap $? 222 'UpdateStore' test.out

#- 223 DeleteStore
./ng net.accelbyte.sdk.cli.Main platform deleteStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'jfpPHMIH' \
    > test.out 2>&1
eval_tap $? 223 'DeleteStore' test.out

#- 224 QueryChanges
./ng net.accelbyte.sdk.cli.Main platform queryChanges \
    --namespace "$AB_NAMESPACE" \
    --storeId '7Sf0tMUG' \
    --action 'CREATE' \
    --itemSku 'QcQFwLeQ' \
    --itemType 'LOOTBOX' \
    --limit '36' \
    --offset '76' \
    --selected  \
    --sortBy 'createdAt:desc' \
    --status 'PUBLISHED' \
    --type 'ITEM' \
    --updatedAtEnd 'Hu6GLqke' \
    --updatedAtStart 'D89ZTRTx' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 224 'QueryChanges' test.out

#- 225 PublishAll
./ng net.accelbyte.sdk.cli.Main platform publishAll \
    --namespace "$AB_NAMESPACE" \
    --storeId 'TzD5FEAp' \
    > test.out 2>&1
eval_tap $? 225 'PublishAll' test.out

#- 226 PublishSelected
./ng net.accelbyte.sdk.cli.Main platform publishSelected \
    --namespace "$AB_NAMESPACE" \
    --storeId 'd79wvimd' \
    > test.out 2>&1
eval_tap $? 226 'PublishSelected' test.out

#- 227 SelectAllRecords
./ng net.accelbyte.sdk.cli.Main platform selectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId '93JXK4p6' \
    > test.out 2>&1
eval_tap $? 227 'SelectAllRecords' test.out

#- 228 SelectAllRecordsByCriteria
./ng net.accelbyte.sdk.cli.Main platform selectAllRecordsByCriteria \
    --namespace "$AB_NAMESPACE" \
    --storeId 'xUCaHpKC' \
    --action 'DELETE' \
    --itemSku 'MMjm385A' \
    --itemType 'OPTIONBOX' \
    --selected  \
    --type 'SECTION' \
    --updatedAtEnd 'DpUjfI2V' \
    --updatedAtStart 'jObqmTWD' \
    > test.out 2>&1
eval_tap $? 228 'SelectAllRecordsByCriteria' test.out

#- 229 GetStatistic
./ng net.accelbyte.sdk.cli.Main platform getStatistic \
    --namespace "$AB_NAMESPACE" \
    --storeId '1iL0SHl2' \
    --action 'DELETE' \
    --itemSku 'b0zLTg7R' \
    --itemType 'INGAMEITEM' \
    --type 'STORE' \
    --updatedAtEnd 'Uaaqa4Wt' \
    --updatedAtStart 'oHKh4PXT' \
    > test.out 2>&1
eval_tap $? 229 'GetStatistic' test.out

#- 230 UnselectAllRecords
./ng net.accelbyte.sdk.cli.Main platform unselectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'b670urgB' \
    > test.out 2>&1
eval_tap $? 230 'UnselectAllRecords' test.out

#- 231 SelectRecord
./ng net.accelbyte.sdk.cli.Main platform selectRecord \
    --changeId 'Jp8ETcHp' \
    --namespace "$AB_NAMESPACE" \
    --storeId '0J9tRPae' \
    > test.out 2>&1
eval_tap $? 231 'SelectRecord' test.out

#- 232 UnselectRecord
./ng net.accelbyte.sdk.cli.Main platform unselectRecord \
    --changeId 'GM8BsmdD' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'kRONbKjK' \
    > test.out 2>&1
eval_tap $? 232 'UnselectRecord' test.out

#- 233 CloneStore
./ng net.accelbyte.sdk.cli.Main platform cloneStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'H87IP9KK' \
    --targetStoreId 'ROrZGI6q' \
    > test.out 2>&1
eval_tap $? 233 'CloneStore' test.out

#- 234 ExportStore
eval_tap 0 234 'ExportStore # SKIP deprecated' test.out

#- 235 QueryImportHistory
./ng net.accelbyte.sdk.cli.Main platform queryImportHistory \
    --namespace "$AB_NAMESPACE" \
    --storeId '9QyTZ7rw' \
    --end 'tWFpatDe' \
    --limit '85' \
    --offset '39' \
    --sortBy 'kwOWK87o' \
    --start 'Wt0YMFFH' \
    --success  \
    > test.out 2>&1
eval_tap $? 235 'QueryImportHistory' test.out

#- 236 ImportStoreByCSV
./ng net.accelbyte.sdk.cli.Main platform importStoreByCSV \
    --namespace "$AB_NAMESPACE" \
    --storeId 'YEU0XT5G' \
    --category 'tmp.dat' \
    --display 'tmp.dat' \
    --item 'tmp.dat' \
    --notes 'EWtpRJqz' \
    --section 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 236 'ImportStoreByCSV' test.out

#- 237 QuerySubscriptions
./ng net.accelbyte.sdk.cli.Main platform querySubscriptions \
    --namespace "$AB_NAMESPACE" \
    --chargeStatus 'CHARGE_FAILED' \
    --itemId 'RxYWQRNc' \
    --limit '88' \
    --offset '98' \
    --sku '9kAIujUM' \
    --status 'EXPIRED' \
    --subscribedBy 'USER' \
    --userId 'suFuMcUX' \
    > test.out 2>&1
eval_tap $? 237 'QuerySubscriptions' test.out

#- 238 RecurringChargeSubscription
./ng net.accelbyte.sdk.cli.Main platform recurringChargeSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'VYpPxudE' \
    > test.out 2>&1
eval_tap $? 238 'RecurringChargeSubscription' test.out

#- 239 GetTicketDynamic
./ng net.accelbyte.sdk.cli.Main platform getTicketDynamic \
    --boothName 'tZhZT1h9' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 239 'GetTicketDynamic' test.out

#- 240 DecreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform decreaseTicketSale \
    --boothName 'm6JzxU73' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "Dun2KPwf"}' \
    > test.out 2>&1
eval_tap $? 240 'DecreaseTicketSale' test.out

#- 241 GetTicketBoothID
./ng net.accelbyte.sdk.cli.Main platform getTicketBoothID \
    --boothName 'wcPoNbuX' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 241 'GetTicketBoothID' test.out

#- 242 IncreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform increaseTicketSale \
    --boothName 'NclnIad4' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 3, "orderNo": "UUrPVhhp"}' \
    > test.out 2>&1
eval_tap $? 242 'IncreaseTicketSale' test.out

#- 243 Commit
./ng net.accelbyte.sdk.cli.Main platform commit \
    --namespace "$AB_NAMESPACE" \
    --body '{"actions": [{"operations": [{"creditPayload": {"balanceOrigin": "IOS", "count": 49, "currencyCode": "zQ2dTMcL", "expireAt": "1979-03-10T00:00:00Z"}, "debitPayload": {"count": 62, "currencyCode": "FtWx24nb", "walletPlatform": "Other"}, "fulFillItemPayload": {"count": 65, "entitlementCollectionId": "4szNfIKG", "entitlementOrigin": "Xbox", "itemIdentity": "jKYoV1H8", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 60, "entitlementId": "C77fyjGX"}, "type": "FULFILL_ITEM"}, {"creditPayload": {"balanceOrigin": "Playstation", "count": 71, "currencyCode": "BfTI7KTi", "expireAt": "1976-03-03T00:00:00Z"}, "debitPayload": {"count": 48, "currencyCode": "GZtfvfqI", "walletPlatform": "Steam"}, "fulFillItemPayload": {"count": 39, "entitlementCollectionId": "3nK9PBiQ", "entitlementOrigin": "GooglePlay", "itemIdentity": "S7b7H9cw", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 23, "entitlementId": "aeYz0z7C"}, "type": "REVOKE_ENTITLEMENT"}, {"creditPayload": {"balanceOrigin": "IOS", "count": 39, "currencyCode": "N3BpmD8m", "expireAt": "1978-11-13T00:00:00Z"}, "debitPayload": {"count": 84, "currencyCode": "uZPpAymg", "walletPlatform": "GooglePlay"}, "fulFillItemPayload": {"count": 88, "entitlementCollectionId": "nKg9S4bX", "entitlementOrigin": "Nintendo", "itemIdentity": "Akb8JNLL", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 18, "entitlementId": "hLuSMmDU"}, "type": "CREDIT_WALLET"}], "userId": "INc2nqMM"}, {"operations": [{"creditPayload": {"balanceOrigin": "Oculus", "count": 9, "currencyCode": "Y9JfyEKs", "expireAt": "1976-10-04T00:00:00Z"}, "debitPayload": {"count": 47, "currencyCode": "CbfWLhE3", "walletPlatform": "Steam"}, "fulFillItemPayload": {"count": 47, "entitlementCollectionId": "0ziEODls", "entitlementOrigin": "Epic", "itemIdentity": "8CH0eRQt", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 36, "entitlementId": "35SFbNDO"}, "type": "DEBIT_WALLET"}, {"creditPayload": {"balanceOrigin": "Playstation", "count": 14, "currencyCode": "Ej8C6qh0", "expireAt": "1996-05-21T00:00:00Z"}, "debitPayload": {"count": 25, "currencyCode": "Lvyoua8v", "walletPlatform": "IOS"}, "fulFillItemPayload": {"count": 19, "entitlementCollectionId": "zURVYwdV", "entitlementOrigin": "Twitch", "itemIdentity": "z7FqofYd", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 2, "entitlementId": "oOcRssYa"}, "type": "REVOKE_ENTITLEMENT"}, {"creditPayload": {"balanceOrigin": "System", "count": 22, "currencyCode": "5WeaaRy9", "expireAt": "1996-06-25T00:00:00Z"}, "debitPayload": {"count": 23, "currencyCode": "38vyR2jC", "walletPlatform": "Other"}, "fulFillItemPayload": {"count": 21, "entitlementCollectionId": "SZwwE87e", "entitlementOrigin": "Playstation", "itemIdentity": "yrLWWJYB", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 68, "entitlementId": "bm1cSwtV"}, "type": "REVOKE_ENTITLEMENT"}], "userId": "othnWFvp"}, {"operations": [{"creditPayload": {"balanceOrigin": "Nintendo", "count": 53, "currencyCode": "JtpqtCnA", "expireAt": "1990-06-25T00:00:00Z"}, "debitPayload": {"count": 49, "currencyCode": "dPs731zx", "walletPlatform": "Steam"}, "fulFillItemPayload": {"count": 98, "entitlementCollectionId": "qV3s1tqn", "entitlementOrigin": "Twitch", "itemIdentity": "J8RBlVWj", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 97, "entitlementId": "oxiW2mAA"}, "type": "CREDIT_WALLET"}, {"creditPayload": {"balanceOrigin": "Other", "count": 94, "currencyCode": "zczVSqVz", "expireAt": "1991-06-02T00:00:00Z"}, "debitPayload": {"count": 37, "currencyCode": "O1O8zC1a", "walletPlatform": "Other"}, "fulFillItemPayload": {"count": 26, "entitlementCollectionId": "Vg8OMXxw", "entitlementOrigin": "GooglePlay", "itemIdentity": "VbJLmcDe", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 79, "entitlementId": "OUZOHTxJ"}, "type": "CREDIT_WALLET"}, {"creditPayload": {"balanceOrigin": "Other", "count": 100, "currencyCode": "9uycd3Bv", "expireAt": "1973-03-09T00:00:00Z"}, "debitPayload": {"count": 25, "currencyCode": "D0AdpfMu", "walletPlatform": "Other"}, "fulFillItemPayload": {"count": 94, "entitlementCollectionId": "DQD2GcYM", "entitlementOrigin": "IOS", "itemIdentity": "DsYZjI5t", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 88, "entitlementId": "qMiwn44Q"}, "type": "DEBIT_WALLET"}], "userId": "gmMuSqIq"}], "metadata": {"ITlo1sMu": {}, "5liFncZI": {}, "Tx7a05zw": {}}, "needPreCheck": false, "transactionId": "bGJk3H8h", "type": "pIndYO7D"}' \
    > test.out 2>&1
eval_tap $? 243 'Commit' test.out

#- 244 GetTradeHistoryByCriteria
./ng net.accelbyte.sdk.cli.Main platform getTradeHistoryByCriteria \
    --namespace "$AB_NAMESPACE" \
    --limit '16' \
    --offset '17' \
    --status 'SUCCESS' \
    --type 'l1QzIl3D' \
    --userId '0cNt0VLx' \
    > test.out 2>&1
eval_tap $? 244 'GetTradeHistoryByCriteria' test.out

#- 245 GetTradeHistoryByTransactionId
./ng net.accelbyte.sdk.cli.Main platform getTradeHistoryByTransactionId \
    --namespace "$AB_NAMESPACE" \
    --transactionId 'ZwYFS3Or' \
    > test.out 2>&1
eval_tap $? 245 'GetTradeHistoryByTransactionId' test.out

#- 246 UnlockSteamUserAchievement
./ng net.accelbyte.sdk.cli.Main platform unlockSteamUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'czptbVTz' \
    --body '{"achievements": [{"id": "4LhKCkdf", "value": 17}, {"id": "hSeMP1Jv", "value": 74}, {"id": "rNINjTF9", "value": 93}], "steamUserId": "F32M0fDk"}' \
    > test.out 2>&1
eval_tap $? 246 'UnlockSteamUserAchievement' test.out

#- 247 GetXblUserAchievements
./ng net.accelbyte.sdk.cli.Main platform getXblUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'A61fvU4u' \
    --xboxUserId 'kKxgdMLB' \
    > test.out 2>&1
eval_tap $? 247 'GetXblUserAchievements' test.out

#- 248 UpdateXblUserAchievement
./ng net.accelbyte.sdk.cli.Main platform updateXblUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'tSmx0v17' \
    --body '{"achievements": [{"id": "F4QW7AhE", "percentComplete": 13}, {"id": "YCRjeCYa", "percentComplete": 66}, {"id": "6ejgm6oN", "percentComplete": 91}], "serviceConfigId": "htL7ITlr", "titleId": "XfnOOFni", "xboxUserId": "uKhu4tFa"}' \
    > test.out 2>&1
eval_tap $? 248 'UpdateXblUserAchievement' test.out

#- 249 AnonymizeCampaign
./ng net.accelbyte.sdk.cli.Main platform anonymizeCampaign \
    --namespace "$AB_NAMESPACE" \
    --userId 'zFYjNe2l' \
    > test.out 2>&1
eval_tap $? 249 'AnonymizeCampaign' test.out

#- 250 AnonymizeEntitlement
./ng net.accelbyte.sdk.cli.Main platform anonymizeEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'Diei0VPn' \
    > test.out 2>&1
eval_tap $? 250 'AnonymizeEntitlement' test.out

#- 251 AnonymizeFulfillment
./ng net.accelbyte.sdk.cli.Main platform anonymizeFulfillment \
    --namespace "$AB_NAMESPACE" \
    --userId 'vD4y9XA5' \
    > test.out 2>&1
eval_tap $? 251 'AnonymizeFulfillment' test.out

#- 252 AnonymizeIntegration
./ng net.accelbyte.sdk.cli.Main platform anonymizeIntegration \
    --namespace "$AB_NAMESPACE" \
    --userId 'efogwtNX' \
    > test.out 2>&1
eval_tap $? 252 'AnonymizeIntegration' test.out

#- 253 AnonymizeOrder
./ng net.accelbyte.sdk.cli.Main platform anonymizeOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'NU0CpZLl' \
    > test.out 2>&1
eval_tap $? 253 'AnonymizeOrder' test.out

#- 254 AnonymizePayment
./ng net.accelbyte.sdk.cli.Main platform anonymizePayment \
    --namespace "$AB_NAMESPACE" \
    --userId '90OaFNH1' \
    > test.out 2>&1
eval_tap $? 254 'AnonymizePayment' test.out

#- 255 AnonymizeRevocation
./ng net.accelbyte.sdk.cli.Main platform anonymizeRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId 'PvwD1Mrj' \
    > test.out 2>&1
eval_tap $? 255 'AnonymizeRevocation' test.out

#- 256 AnonymizeSubscription
./ng net.accelbyte.sdk.cli.Main platform anonymizeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'AVQ09c1g' \
    > test.out 2>&1
eval_tap $? 256 'AnonymizeSubscription' test.out

#- 257 AnonymizeWallet
./ng net.accelbyte.sdk.cli.Main platform anonymizeWallet \
    --namespace "$AB_NAMESPACE" \
    --userId '03PQ3aEQ' \
    > test.out 2>&1
eval_tap $? 257 'AnonymizeWallet' test.out

#- 258 GetUserDLCByPlatform
./ng net.accelbyte.sdk.cli.Main platform getUserDLCByPlatform \
    --namespace "$AB_NAMESPACE" \
    --userId '0VsfPJfd' \
    --type 'PSN' \
    > test.out 2>&1
eval_tap $? 258 'GetUserDLCByPlatform' test.out

#- 259 GetUserDLC
./ng net.accelbyte.sdk.cli.Main platform getUserDLC \
    --namespace "$AB_NAMESPACE" \
    --userId '2dobMP9G' \
    --includeAllNamespaces  \
    --status 'REVOKE_FAILED' \
    --type 'OCULUS' \
    > test.out 2>&1
eval_tap $? 259 'GetUserDLC' test.out

#- 260 QueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'MC6zj1Fn' \
    --activeOnly  \
    --appType 'DEMO' \
    --collectionId 'ciRq43sc' \
    --entitlementClazz 'CODE' \
    --entitlementName 'jHrTDbCq' \
    --features 'WeYi9yPq,ZC9u3Egy,yLzv4X4g' \
    --fuzzyMatchName  \
    --ignoreActiveDate  \
    --itemId 'BO7QyEam,Dpom8xt1,9Mbea4gT' \
    --limit '19' \
    --offset '90' \
    --origin 'Epic' \
    > test.out 2>&1
eval_tap $? 260 'QueryUserEntitlements' test.out

#- 261 GrantUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform grantUserEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'e3CguYkB' \
    --body '[{"collectionId": "TkJQr1vN", "endDate": "1979-08-29T00:00:00Z", "grantedCode": "QMQ4Otdk", "itemId": "lqb82IgT", "itemNamespace": "3yLDD0Hg", "language": "kXpN-mz", "metadata": {"GXIiVW4Q": {}, "fQqwPj44": {}, "TBItWkia": {}}, "origin": "Oculus", "quantity": 67, "region": "JYtA7mWA", "source": "GIFT", "startDate": "1999-05-05T00:00:00Z", "storeId": "CFyAadLN"}, {"collectionId": "60D37itN", "endDate": "1986-02-28T00:00:00Z", "grantedCode": "UhIgR9Ah", "itemId": "hewm0eLZ", "itemNamespace": "y1G8bCZ5", "language": "BtH-702", "metadata": {"ddzrShWp": {}, "UMAEpi1d": {}, "GEewzyh1": {}}, "origin": "Nintendo", "quantity": 69, "region": "UXzuMKhw", "source": "IAP", "startDate": "1985-03-31T00:00:00Z", "storeId": "zsNXaKGr"}, {"collectionId": "QaM6r2mA", "endDate": "1997-06-06T00:00:00Z", "grantedCode": "2M3WaMnI", "itemId": "fcRbZFqN", "itemNamespace": "Wf2QJtfR", "language": "tlZ-iUJC-Iv", "metadata": {"qKtwVM4Z": {}, "z7FXDBeS": {}, "PwpPOgTb": {}}, "origin": "Playstation", "quantity": 40, "region": "3ePYJBth", "source": "IAP", "startDate": "1984-03-24T00:00:00Z", "storeId": "clVsdnu0"}]' \
    > test.out 2>&1
eval_tap $? 261 'GrantUserEntitlement' test.out

#- 262 GetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'ddKQQKdu' \
    --activeOnly  \
    --appId 'JkAo8epR' \
    > test.out 2>&1
eval_tap $? 262 'GetUserAppEntitlementByAppId' test.out

#- 263 QueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'YUb91azz' \
    --activeOnly  \
    --limit '75' \
    --offset '84' \
    --appType 'DLC' \
    > test.out 2>&1
eval_tap $? 263 'QueryUserEntitlementsByAppType' test.out

#- 264 GetUserEntitlementsByIds
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementsByIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'Tlp8dzlp' \
    --ids 'erwabUCW,1VeId79c,DgCxhbaN' \
    > test.out 2>&1
eval_tap $? 264 'GetUserEntitlementsByIds' test.out

#- 265 GetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'cF9oqAnm' \
    --activeOnly  \
    --entitlementClazz 'ENTITLEMENT' \
    --platform 'VXVWSF53' \
    --itemId 'B8hTRj4y' \
    > test.out 2>&1
eval_tap $? 265 'GetUserEntitlementByItemId' test.out

#- 266 GetUserActiveEntitlementsByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserActiveEntitlementsByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'wLYCEyVG' \
    --ids 'Dhu3KXk8,PuKBAoL6,HYdyNjPn' \
    --platform 'iih3rWIt' \
    > test.out 2>&1
eval_tap $? 266 'GetUserActiveEntitlementsByItemIds' test.out

#- 267 GetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'LeOl4ecc' \
    --activeOnly  \
    --entitlementClazz 'SUBSCRIPTION' \
    --platform 'RdlicQjD' \
    --sku '4zzV8bTM' \
    > test.out 2>&1
eval_tap $? 267 'GetUserEntitlementBySku' test.out

#- 268 ExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'QwIfndxd' \
    --appIds 'n0pDIbah,2Rgri4eE,rbsr8THw' \
    --itemIds '8wy6gL5k,JLckwd1K,eY7zJHK9' \
    --platform '1xhQopTK' \
    --skus 'nHnxajA3,vstoLfeN,luc6uM8Y' \
    > test.out 2>&1
eval_tap $? 268 'ExistsAnyUserActiveEntitlement' test.out

#- 269 ExistsAnyUserActiveEntitlementByItemIds
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlementByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'puIf96xM' \
    --platform 'fJkaklBo' \
    --itemIds 'lWIm8bZu,Sh5CYQhM,Ittea4HF' \
    > test.out 2>&1
eval_tap $? 269 'ExistsAnyUserActiveEntitlementByItemIds' test.out

#- 270 GetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'PCiyzq3B' \
    --appId '7s9Nfkjx' \
    > test.out 2>&1
eval_tap $? 270 'GetUserAppEntitlementOwnershipByAppId' test.out

#- 271 GetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId '9mguckUU' \
    --entitlementClazz 'CODE' \
    --platform 'H1kUTL1q' \
    --itemId 'ya500IS7' \
    > test.out 2>&1
eval_tap $? 271 'GetUserEntitlementOwnershipByItemId' test.out

#- 272 GetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'zHcxj2hM' \
    --ids '3G1pEIch,xG7r0TlK,u95Redtg' \
    --platform 'dYK5uLrb' \
    > test.out 2>&1
eval_tap $? 272 'GetUserEntitlementOwnershipByItemIds' test.out

#- 273 GetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId '6BRHXSbk' \
    --entitlementClazz 'OPTIONBOX' \
    --platform '32J81ROq' \
    --sku '2ByEEH1k' \
    > test.out 2>&1
eval_tap $? 273 'GetUserEntitlementOwnershipBySku' test.out

#- 274 RevokeAllEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeAllEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'kp56z7Ac' \
    > test.out 2>&1
eval_tap $? 274 'RevokeAllEntitlements' test.out

#- 275 RevokeUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId '4KRuTHE5' \
    --entitlementIds '7lgHCWa6' \
    > test.out 2>&1
eval_tap $? 275 'RevokeUserEntitlements' test.out

#- 276 GetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlement \
    --entitlementId 'Jvsp16Xa' \
    --namespace "$AB_NAMESPACE" \
    --userId 'OnteYJzH' \
    > test.out 2>&1
eval_tap $? 276 'GetUserEntitlement' test.out

#- 277 UpdateUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform updateUserEntitlement \
    --entitlementId 'UfwAL0h3' \
    --namespace "$AB_NAMESPACE" \
    --userId '9HX85iqK' \
    --body '{"collectionId": "YFLX9puA", "endDate": "1979-12-19T00:00:00Z", "nullFieldList": ["Tn0JRd6b", "oPsKJgRc", "gin5BAxi"], "origin": "Oculus", "reason": "f1PD5Ea8", "startDate": "1973-10-10T00:00:00Z", "status": "SOLD", "useCount": 77}' \
    > test.out 2>&1
eval_tap $? 277 'UpdateUserEntitlement' test.out

#- 278 ConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform consumeUserEntitlement \
    --entitlementId 'WNhLwdTL' \
    --namespace "$AB_NAMESPACE" \
    --userId 'nWvSKOrZ' \
    --body '{"metadata": {"fUgJWHs2": {}, "DX6UU4fZ": {}, "5zu9NFde": {}}, "options": ["14oyHB5J", "UVLEoSCd", "jD7h3nU6"], "platform": "xIPI7xTL", "requestId": "FSd8L6q3", "useCount": 71}' \
    > test.out 2>&1
eval_tap $? 278 'ConsumeUserEntitlement' test.out

#- 279 DisableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform disableUserEntitlement \
    --entitlementId 'qvacCxix' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ehneEmvB' \
    > test.out 2>&1
eval_tap $? 279 'DisableUserEntitlement' test.out

#- 280 EnableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform enableUserEntitlement \
    --entitlementId 'ZOfG6yHE' \
    --namespace "$AB_NAMESPACE" \
    --userId 'NwkTLAF5' \
    > test.out 2>&1
eval_tap $? 280 'EnableUserEntitlement' test.out

#- 281 GetUserEntitlementHistories
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementHistories \
    --entitlementId 'OE7TMfwd' \
    --namespace "$AB_NAMESPACE" \
    --userId 'LqJED8Uf' \
    > test.out 2>&1
eval_tap $? 281 'GetUserEntitlementHistories' test.out

#- 282 RevokeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlement \
    --entitlementId 'Ah8hH4w9' \
    --namespace "$AB_NAMESPACE" \
    --userId 'q30DLXXZ' \
    --body '{"metadata": {"qO5elinM": {}, "YjHAEx32": {}, "ZaNzHgAS": {}}}' \
    > test.out 2>&1
eval_tap $? 282 'RevokeUserEntitlement' test.out

#- 283 RevokeUserEntitlementByUseCount
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlementByUseCount \
    --entitlementId '7siHrkFq' \
    --namespace "$AB_NAMESPACE" \
    --userId 'MkecLZfE' \
    --body '{"reason": "9i9pcDdx", "useCount": 9}' \
    > test.out 2>&1
eval_tap $? 283 'RevokeUserEntitlementByUseCount' test.out

#- 284 PreCheckRevokeUserEntitlementByUseCount
./ng net.accelbyte.sdk.cli.Main platform preCheckRevokeUserEntitlementByUseCount \
    --entitlementId 'AbVIRsTf' \
    --namespace "$AB_NAMESPACE" \
    --userId 'TwtFDrgK' \
    --quantity '13' \
    > test.out 2>&1
eval_tap $? 284 'PreCheckRevokeUserEntitlementByUseCount' test.out

#- 285 RevokeUseCount
eval_tap 0 285 'RevokeUseCount # SKIP deprecated' test.out

#- 286 SellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform sellUserEntitlement \
    --entitlementId 'c9DAcaW2' \
    --namespace "$AB_NAMESPACE" \
    --userId 'kQifVozk' \
    --body '{"platform": "L3qMSKTC", "requestId": "oIOLoj8G", "useCount": 94}' \
    > test.out 2>&1
eval_tap $? 286 'SellUserEntitlement' test.out

#- 287 FulfillItem
./ng net.accelbyte.sdk.cli.Main platform fulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'PfvT2viP' \
    --body '{"duration": 89, "endDate": "1972-12-12T00:00:00Z", "entitlementCollectionId": "Jo44OAin", "entitlementOrigin": "Epic", "itemId": "dp4B51bM", "itemSku": "JMVTtsz5", "language": "PRxkZEjl", "metadata": {"G50J3yYE": {}, "7O7I9wJX": {}, "o3YnCLSS": {}}, "order": {"currency": {"currencyCode": "3nHT6SfJ", "currencySymbol": "P7Sc70pb", "currencyType": "REAL", "decimals": 30, "namespace": "rxlnzLet"}, "ext": {"ePkLpK6r": {}, "VeZ7DZT2": {}, "n5efJKOP": {}}, "free": false}, "orderNo": "bFMsbuhZ", "origin": "GooglePlay", "overrideBundleItemQty": {"m6IWy9i1": 54, "eyQqbU77": 61, "r5DBREZ7": 62}, "quantity": 67, "region": "v4iF1YcO", "source": "OTHER", "startDate": "1997-06-23T00:00:00Z", "storeId": "JBu0S8an"}' \
    > test.out 2>&1
eval_tap $? 287 'FulfillItem' test.out

#- 288 RedeemCode
./ng net.accelbyte.sdk.cli.Main platform redeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'tmH2Jb7D' \
    --body '{"code": "CDP7r7eo", "language": "gl-IgWr", "region": "2KABQHCZ"}' \
    > test.out 2>&1
eval_tap $? 288 'RedeemCode' test.out

#- 289 PreCheckFulfillItem
./ng net.accelbyte.sdk.cli.Main platform preCheckFulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'f8ZU7isC' \
    --body '{"itemId": "UwqLBTyU", "itemSku": "0UAjEvSg", "quantity": 99}' \
    > test.out 2>&1
eval_tap $? 289 'PreCheckFulfillItem' test.out

#- 290 FulfillRewards
./ng net.accelbyte.sdk.cli.Main platform fulfillRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'PZAGwN5U' \
    --body '{"entitlementCollectionId": "9YTrJm8H", "entitlementOrigin": "GooglePlay", "metadata": {"Qi2iYcQ2": {}, "Qp6bZJal": {}, "FwOqhFlu": {}}, "origin": "Nintendo", "rewards": [{"currency": {"currencyCode": "fUiWQpQY", "namespace": "tsQ4yeO5"}, "item": {"itemId": "aopTOH9W", "itemName": "B6cIlLQU", "itemSku": "IcXoB50G", "itemType": "AiPD7iiR"}, "quantity": 5, "type": "ITEM"}, {"currency": {"currencyCode": "YYEdSTah", "namespace": "Lc1Mukxd"}, "item": {"itemId": "2HYADeH0", "itemName": "6a9dvAAC", "itemSku": "FLbHZQXB", "itemType": "GIZ1NGGH"}, "quantity": 89, "type": "CURRENCY"}, {"currency": {"currencyCode": "ia7WC5cB", "namespace": "RwAYe1jd"}, "item": {"itemId": "7RA2g2Y7", "itemName": "qzTtEEVQ", "itemSku": "rbiFQedk", "itemType": "1iMxn0hP"}, "quantity": 62, "type": "ITEM"}], "source": "PAYMENT", "transactionId": "wpPfWXoo"}' \
    > test.out 2>&1
eval_tap $? 290 'FulfillRewards' test.out

#- 291 QueryUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'fmWYRiBy' \
    --endTime 'Bd30c4t8' \
    --limit '75' \
    --offset '78' \
    --productId 'FR6CsKRu' \
    --startTime 'JXHlh4yH' \
    --status 'PARTIAL_REVOKED' \
    --type 'PLAYSTATION' \
    > test.out 2>&1
eval_tap $? 291 'QueryUserIAPOrders' test.out

#- 292 QueryAllUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryAllUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'GhadkL7U' \
    > test.out 2>&1
eval_tap $? 292 'QueryAllUserIAPOrders' test.out

#- 293 QueryUserIAPConsumeHistory
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPConsumeHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'WoZKdVUH' \
    --endTime 'WO3USbN7' \
    --limit '95' \
    --offset '80' \
    --startTime 'cMUhDiNT' \
    --status 'SUCCESS' \
    --type 'APPLE' \
    > test.out 2>&1
eval_tap $? 293 'QueryUserIAPConsumeHistory' test.out

#- 294 MockFulfillIAPItem
./ng net.accelbyte.sdk.cli.Main platform mockFulfillIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'TLLPhDnB' \
    --body '{"itemIdentityType": "ITEM_ID", "language": "fG_vcMi", "productId": "9zqZOTZn", "region": "r1CRSRAO", "transactionId": "gSWDCF37", "type": "APPLE"}' \
    > test.out 2>&1
eval_tap $? 294 'MockFulfillIAPItem' test.out

#- 295 AdminSyncOculusSubscriptions
./ng net.accelbyte.sdk.cli.Main platform adminSyncOculusSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'p6rv7TXl' \
    --body '{"skus": ["N8AAjxqc", "CL6Rud9M", "NbXPpI6D"]}' \
    > test.out 2>&1
eval_tap $? 295 'AdminSyncOculusSubscriptions' test.out

#- 296 AdminGetIAPOrderLineItems
./ng net.accelbyte.sdk.cli.Main platform adminGetIAPOrderLineItems \
    --iapOrderNo 'QQLZBJfm' \
    --namespace "$AB_NAMESPACE" \
    --userId '8kO1BbFY' \
    > test.out 2>&1
eval_tap $? 296 'AdminGetIAPOrderLineItems' test.out

#- 297 AdminSyncSteamAbnormalTransaction
./ng net.accelbyte.sdk.cli.Main platform adminSyncSteamAbnormalTransaction \
    --namespace "$AB_NAMESPACE" \
    --userId '7JyXqdDW' \
    > test.out 2>&1
eval_tap $? 297 'AdminSyncSteamAbnormalTransaction' test.out

#- 298 AdminSyncSteamIAPByTransaction
./ng net.accelbyte.sdk.cli.Main platform adminSyncSteamIAPByTransaction \
    --namespace "$AB_NAMESPACE" \
    --userId 'XtHH1neo' \
    --body '{"orderId": "D34Ewzoq"}' \
    > test.out 2>&1
eval_tap $? 298 'AdminSyncSteamIAPByTransaction' test.out

#- 299 QueryUserThirdPartySubscription
./ng net.accelbyte.sdk.cli.Main platform queryUserThirdPartySubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'TtxxEjeB' \
    --activeOnly  \
    --groupId 'v4wjS2U0' \
    --limit '60' \
    --offset '100' \
    --platform 'XBOX' \
    --productId 'I6F6o7zv' \
    > test.out 2>&1
eval_tap $? 299 'QueryUserThirdPartySubscription' test.out

#- 300 GetThirdPartyPlatformSubscriptionOwnershipByGroupId
./ng net.accelbyte.sdk.cli.Main platform getThirdPartyPlatformSubscriptionOwnershipByGroupId \
    --namespace "$AB_NAMESPACE" \
    --platform 'GOOGLE' \
    --userId 'WsE5PXJw' \
    --groupId 'tjU7cH6k' \
    > test.out 2>&1
eval_tap $? 300 'GetThirdPartyPlatformSubscriptionOwnershipByGroupId' test.out

#- 301 GetThirdPartyPlatformSubscriptionOwnershipByProductId
./ng net.accelbyte.sdk.cli.Main platform getThirdPartyPlatformSubscriptionOwnershipByProductId \
    --namespace "$AB_NAMESPACE" \
    --platform 'GOOGLE' \
    --userId 'G1Y2fKSX' \
    --productId 'hM5AWGaj' \
    > test.out 2>&1
eval_tap $? 301 'GetThirdPartyPlatformSubscriptionOwnershipByProductId' test.out

#- 302 QueryUserThirdPartySubscriptionTransactions
./ng net.accelbyte.sdk.cli.Main platform queryUserThirdPartySubscriptionTransactions \
    --namespace "$AB_NAMESPACE" \
    --userId '3sLaiT9V' \
    --activeOnly  \
    --groupId 'icnXEvyH' \
    --limit '31' \
    --offset '98' \
    --platform 'GOOGLE' \
    --productId 'YlJxAXH9' \
    > test.out 2>&1
eval_tap $? 302 'QueryUserThirdPartySubscriptionTransactions' test.out

#- 303 GetThirdPartySubscriptionDetails
./ng net.accelbyte.sdk.cli.Main platform getThirdPartySubscriptionDetails \
    --id 'j2npD8Cj' \
    --namespace "$AB_NAMESPACE" \
    --userId 'EthP75RG' \
    > test.out 2>&1
eval_tap $? 303 'GetThirdPartySubscriptionDetails' test.out

#- 304 GetSubscriptionHistory
./ng net.accelbyte.sdk.cli.Main platform getSubscriptionHistory \
    --id '7OOzQFa3' \
    --namespace "$AB_NAMESPACE" \
    --userId '4gATl45l' \
    --limit '93' \
    --offset '30' \
    > test.out 2>&1
eval_tap $? 304 'GetSubscriptionHistory' test.out

#- 305 SyncSubscriptionTransaction
./ng net.accelbyte.sdk.cli.Main platform syncSubscriptionTransaction \
    --id 'MHzePdVj' \
    --namespace "$AB_NAMESPACE" \
    --userId 'E8LutjGg' \
    > test.out 2>&1
eval_tap $? 305 'SyncSubscriptionTransaction' test.out

#- 306 GetThirdPartyUserSubscriptionDetails
./ng net.accelbyte.sdk.cli.Main platform getThirdPartyUserSubscriptionDetails \
    --id '1MwMThmz' \
    --namespace "$AB_NAMESPACE" \
    --userId 'lvkgGKgz' \
    > test.out 2>&1
eval_tap $? 306 'GetThirdPartyUserSubscriptionDetails' test.out

#- 307 SyncSubscription
./ng net.accelbyte.sdk.cli.Main platform syncSubscription \
    --id 'D1uXIV1j' \
    --namespace "$AB_NAMESPACE" \
    --userId 'LGDF5wiC' \
    > test.out 2>&1
eval_tap $? 307 'SyncSubscription' test.out

#- 308 QueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'HsqAQuzE' \
    --discounted  \
    --itemId 'GJSw8eLs' \
    --limit '61' \
    --offset '8' \
    --status 'CHARGEBACK_REVERSED' \
    > test.out 2>&1
eval_tap $? 308 'QueryUserOrders' test.out

#- 309 AdminCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform adminCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'PYZ4u8IH' \
    --body '{"currencyCode": "efNB3lGJ", "currencyNamespace": "xCGc9no4", "discountCodes": ["2NGuJBuo", "tKXw1KIo", "oTKLp31Z"], "discountedPrice": 34, "entitlementPlatform": "Other", "ext": {"NpNXzTba": {}, "aGTm3anN": {}, "9RZpicLl": {}}, "itemId": "jZm2l6RH", "language": "6obEcV0U", "options": {"skipPriceValidation": false}, "platform": "IOS", "price": 6, "quantity": 85, "region": "DOHi1x3C", "returnUrl": "KAVlKuRm", "sandbox": true, "sectionId": "2cj9KOBI"}' \
    > test.out 2>&1
eval_tap $? 309 'AdminCreateUserOrder' test.out

#- 310 CountOfPurchasedItem
./ng net.accelbyte.sdk.cli.Main platform countOfPurchasedItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'laECOBw0' \
    --itemId 'aU9f5WVr' \
    > test.out 2>&1
eval_tap $? 310 'CountOfPurchasedItem' test.out

#- 311 GetUserOrder
./ng net.accelbyte.sdk.cli.Main platform getUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'S7Trm3hb' \
    --userId 'AYvN5lVZ' \
    > test.out 2>&1
eval_tap $? 311 'GetUserOrder' test.out

#- 312 UpdateUserOrderStatus
./ng net.accelbyte.sdk.cli.Main platform updateUserOrderStatus \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'm81fpGMm' \
    --userId 'wDCw1LQc' \
    --body '{"status": "CHARGEBACK", "statusReason": "Jaj0oS0t"}' \
    > test.out 2>&1
eval_tap $? 312 'UpdateUserOrderStatus' test.out

#- 313 FulfillUserOrder
./ng net.accelbyte.sdk.cli.Main platform fulfillUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'X0UOGYS6' \
    --userId 'BiMWUWpn' \
    > test.out 2>&1
eval_tap $? 313 'FulfillUserOrder' test.out

#- 314 GetUserOrderGrant
eval_tap 0 314 'GetUserOrderGrant # SKIP deprecated' test.out

#- 315 GetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform getUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'LI2zdVud' \
    --userId 'R1JkOpK7' \
    > test.out 2>&1
eval_tap $? 315 'GetUserOrderHistories' test.out

#- 316 ProcessUserOrderNotification
./ng net.accelbyte.sdk.cli.Main platform processUserOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --orderNo '2q0T8sM4' \
    --userId '5w2ahEuo' \
    --body '{"additionalData": {"cardSummary": "zfrPD5Qu"}, "authorisedTime": "1973-02-04T00:00:00Z", "chargebackReversedTime": "1987-08-01T00:00:00Z", "chargebackTime": "1972-04-06T00:00:00Z", "chargedTime": "1975-04-14T00:00:00Z", "createdTime": "1977-01-23T00:00:00Z", "currency": {"currencyCode": "aUkf33rG", "currencySymbol": "72ClFznk", "currencyType": "REAL", "decimals": 51, "namespace": "CROO8Akb"}, "customParameters": {"QSiwk0BS": {}, "zsRKaLkV": {}, "pZc6AIb7": {}}, "extOrderNo": "lU9QqsxW", "extTxId": "yqoB03DM", "extUserId": "C1tnrTIg", "issuedAt": "1999-04-11T00:00:00Z", "metadata": {"zoJhgdx7": "sl0wmu7T", "gU2EaIFw": "D1zi5ST9", "hviX5Uqd": "qZmfMk7p"}, "namespace": "sqrdicfo", "nonceStr": "S3J9sBgD", "paymentData": {"discountAmount": 34, "discountCode": "sqdshvAK", "subtotalPrice": 73, "tax": 37, "totalPrice": 99}, "paymentMethod": "Ji0LTYLB", "paymentMethodFee": 60, "paymentOrderNo": "cP7axMEm", "paymentProvider": "PAYPAL", "paymentProviderFee": 12, "paymentStationUrl": "S4KvojqN", "price": 40, "refundedTime": "1985-12-24T00:00:00Z", "salesTax": 70, "sandbox": false, "sku": "5Zczs6tt", "status": "DELETED", "statusReason": "uSwSzRfB", "subscriptionId": "RcWqD5xw", "subtotalPrice": 44, "targetNamespace": "3U7XJjFb", "targetUserId": "78ofl3Y1", "tax": 26, "totalPrice": 5, "totalTax": 71, "txEndTime": "1981-01-15T00:00:00Z", "type": "BAr5VrRZ", "userId": "4S7ev4OB", "vat": 40}' \
    > test.out 2>&1
eval_tap $? 316 'ProcessUserOrderNotification' test.out

#- 317 DownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform downloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'l15R1JTR' \
    --userId '0igAeKlf' \
    > test.out 2>&1
eval_tap $? 317 'DownloadUserOrderReceipt' test.out

#- 318 CreateUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform createUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --userId '5JrbVmQZ' \
    --body '{"currencyCode": "BjRNxRpY", "currencyNamespace": "ovaYaPBH", "customParameters": {"gPhQXHo5": {}, "g4hvGYE5": {}, "z7X4JF4S": {}}, "description": "Ra497H1y", "extOrderNo": "z1CpNMja", "extUserId": "VSA5CcrV", "itemType": "LOOTBOX", "language": "Fwfg_cUHY-AF", "metadata": {"mzahC2x7": "XM054czg", "wpauZxu7": "eTNyT3vP", "Lg6ntFzA": "oHDDXVJy"}, "notifyUrl": "Z0BGW3zP", "omitNotification": false, "platform": "aWWytkoG", "price": 32, "recurringPaymentOrderNo": "zY4dyAn8", "region": "Bfu56hLb", "returnUrl": "Ti8RN1SX", "sandbox": true, "sku": "qKd070iR", "subscriptionId": "dzWng5RE", "title": "imGaSA2B"}' \
    > test.out 2>&1
eval_tap $? 318 'CreateUserPaymentOrder' test.out

#- 319 RefundUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform refundUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'HKITFwqC' \
    --userId '67Yl2Nyy' \
    --body '{"description": "kFPl8Puz"}' \
    > test.out 2>&1
eval_tap $? 319 'RefundUserPaymentOrder' test.out

#- 320 GetUserPlatformAccountClosureHistories
./ng net.accelbyte.sdk.cli.Main platform getUserPlatformAccountClosureHistories \
    --namespace "$AB_NAMESPACE" \
    --userId 'CNKUkeME' \
    > test.out 2>&1
eval_tap $? 320 'GetUserPlatformAccountClosureHistories' test.out

#- 321 ApplyUserRedemption
./ng net.accelbyte.sdk.cli.Main platform applyUserRedemption \
    --namespace "$AB_NAMESPACE" \
    --userId 'rdJ4hvhd' \
    --body '{"code": "DuCGGa24", "orderNo": "vDJz6mo2"}' \
    > test.out 2>&1
eval_tap $? 321 'ApplyUserRedemption' test.out

#- 322 DoRevocation
./ng net.accelbyte.sdk.cli.Main platform doRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId 'CCkmRQ0L' \
    --body '{"meta": {"W1JUXqHc": {}, "vVDskoQH": {}, "pVncSPaS": {}}, "reason": "B8QRsIFe", "requestId": "DeBsjUPY", "revokeEntries": [{"currency": {"balanceOrigin": "Oculus", "currencyCode": "rRcrbBto", "namespace": "HBJlrd0d"}, "entitlement": {"entitlementId": "ZxmhS2FC"}, "item": {"entitlementOrigin": "Steam", "itemIdentity": "usPSoeOR", "itemIdentityType": "ITEM_ID", "origin": "System"}, "quantity": 81, "type": "ITEM"}, {"currency": {"balanceOrigin": "Epic", "currencyCode": "BzGqPUFX", "namespace": "e7vyW0Xd"}, "entitlement": {"entitlementId": "docSZqq7"}, "item": {"entitlementOrigin": "Twitch", "itemIdentity": "vuf4ENgL", "itemIdentityType": "ITEM_SKU", "origin": "Nintendo"}, "quantity": 39, "type": "ITEM"}, {"currency": {"balanceOrigin": "Playstation", "currencyCode": "86C7Vxl4", "namespace": "oSpAncUW"}, "entitlement": {"entitlementId": "pWebqqTf"}, "item": {"entitlementOrigin": "Xbox", "itemIdentity": "tykaQuUS", "itemIdentityType": "ITEM_ID", "origin": "IOS"}, "quantity": 73, "type": "ENTITLEMENT"}], "source": "OTHER", "transactionId": "FQPYutFM"}' \
    > test.out 2>&1
eval_tap $? 322 'DoRevocation' test.out

#- 323 RegisterXblSessions
./ng net.accelbyte.sdk.cli.Main platform registerXblSessions \
    --namespace "$AB_NAMESPACE" \
    --userId 'CVBhGtPz' \
    --body '{"gameSessionId": "lkr6Juu2", "payload": {"1S3Zlr6o": {}, "iUxnYUjS": {}, "bmntjuqx": {}}, "scid": "AtfhxDNS", "sessionTemplateName": "oJiBjLUj"}' \
    > test.out 2>&1
eval_tap $? 323 'RegisterXblSessions' test.out

#- 324 QueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform queryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'sPhV9arG' \
    --chargeStatus 'SETUP' \
    --itemId 'uJcMXXsA' \
    --limit '81' \
    --offset '3' \
    --sku 'mQ7W0Tx5' \
    --status 'EXPIRED' \
    --subscribedBy 'PLATFORM' \
    > test.out 2>&1
eval_tap $? 324 'QueryUserSubscriptions' test.out

#- 325 GetUserSubscriptionActivities
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionActivities \
    --namespace "$AB_NAMESPACE" \
    --userId '38l2xM6H' \
    --excludeSystem  \
    --limit '73' \
    --offset '69' \
    --subscriptionId 'Ixez9lkh' \
    > test.out 2>&1
eval_tap $? 325 'GetUserSubscriptionActivities' test.out

#- 326 PlatformSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform platformSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'JkMNJxnG' \
    --body '{"grantDays": 100, "itemId": "xugsq1ek", "language": "Siiw8qrO", "reason": "tejcS335", "region": "o8ZJwwKx", "source": "RqqpIYTg"}' \
    > test.out 2>&1
eval_tap $? 326 'PlatformSubscribeSubscription' test.out

#- 327 CheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform checkUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'E1TI9k58' \
    --itemId 'Mw6QsQDL' \
    > test.out 2>&1
eval_tap $? 327 'CheckUserSubscriptionSubscribableByItemId' test.out

#- 328 GetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform getUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'iZ8A2P9T' \
    --userId 'knj2d1ik' \
    > test.out 2>&1
eval_tap $? 328 'GetUserSubscription' test.out

#- 329 DeleteUserSubscription
./ng net.accelbyte.sdk.cli.Main platform deleteUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'ZPTFaFhB' \
    --userId 'gcNMjqy3' \
    > test.out 2>&1
eval_tap $? 329 'DeleteUserSubscription' test.out

#- 330 CancelSubscription
./ng net.accelbyte.sdk.cli.Main platform cancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 's8WYdIPH' \
    --userId 'n6ewTdPt' \
    --force  \
    --body '{"immediate": true, "reason": "JYo72LWZ"}' \
    > test.out 2>&1
eval_tap $? 330 'CancelSubscription' test.out

#- 331 GrantDaysToSubscription
./ng net.accelbyte.sdk.cli.Main platform grantDaysToSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'Fx8QEK85' \
    --userId 'G0mqCGZK' \
    --body '{"grantDays": 61, "reason": "YbjzxEmU"}' \
    > test.out 2>&1
eval_tap $? 331 'GrantDaysToSubscription' test.out

#- 332 GetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'C6Zg1iK9' \
    --userId 'FRjLfNYl' \
    --excludeFree  \
    --limit '77' \
    --offset '80' \
    > test.out 2>&1
eval_tap $? 332 'GetUserSubscriptionBillingHistories' test.out

#- 333 ProcessUserSubscriptionNotification
./ng net.accelbyte.sdk.cli.Main platform processUserSubscriptionNotification \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'DbIZvHFK' \
    --userId '0RFx7qVx' \
    --body '{"additionalData": {"cardSummary": "51gyXYjt"}, "authorisedTime": "1974-03-03T00:00:00Z", "chargebackReversedTime": "1972-01-05T00:00:00Z", "chargebackTime": "1997-12-15T00:00:00Z", "chargedTime": "1997-12-15T00:00:00Z", "createdTime": "1976-01-30T00:00:00Z", "currency": {"currencyCode": "WG2ZF4W2", "currencySymbol": "Wv8YcEvK", "currencyType": "VIRTUAL", "decimals": 85, "namespace": "LFZITwc0"}, "customParameters": {"whZaXRih": {}, "aD7ajwZP": {}, "8OsWkxPs": {}}, "extOrderNo": "ECRjJYS1", "extTxId": "sqkuLD45", "extUserId": "NF033Xy3", "issuedAt": "1983-01-05T00:00:00Z", "metadata": {"6zP7f5yU": "0hlPUTjc", "MSXeoFxb": "H79SvGcl", "YTLknrpp": "ned14k0P"}, "namespace": "psGtks7F", "nonceStr": "OG1iVoHb", "paymentData": {"discountAmount": 63, "discountCode": "pSQM2L7E", "subtotalPrice": 34, "tax": 56, "totalPrice": 59}, "paymentMethod": "JgWR0ASn", "paymentMethodFee": 88, "paymentOrderNo": "oNHf85qj", "paymentProvider": "PAYPAL", "paymentProviderFee": 6, "paymentStationUrl": "AptkVh3p", "price": 93, "refundedTime": "1976-10-27T00:00:00Z", "salesTax": 12, "sandbox": false, "sku": "L6R0tElL", "status": "AUTHORISE_FAILED", "statusReason": "6wJfsgY1", "subscriptionId": "GBR0NYac", "subtotalPrice": 51, "targetNamespace": "Uq8Ql9SI", "targetUserId": "sIHPgAwA", "tax": 71, "totalPrice": 76, "totalTax": 77, "txEndTime": "1973-03-20T00:00:00Z", "type": "Niw3BHad", "userId": "W1ZzKDJX", "vat": 79}' \
    > test.out 2>&1
eval_tap $? 333 'ProcessUserSubscriptionNotification' test.out

#- 334 AcquireUserTicket
./ng net.accelbyte.sdk.cli.Main platform acquireUserTicket \
    --boothName 'T8FtbZiI' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZR2kXFWG' \
    --body '{"count": 75, "orderNo": "n0gxW9H6"}' \
    > test.out 2>&1
eval_tap $? 334 'AcquireUserTicket' test.out

#- 335 QueryUserCurrencyWallets
./ng net.accelbyte.sdk.cli.Main platform queryUserCurrencyWallets \
    --namespace "$AB_NAMESPACE" \
    --userId 'hWdZ6zXm' \
    > test.out 2>&1
eval_tap $? 335 'QueryUserCurrencyWallets' test.out

#- 336 DebitUserWalletByCurrencyCode
./ng net.accelbyte.sdk.cli.Main platform debitUserWalletByCurrencyCode \
    --currencyCode '8qFMPh79' \
    --namespace "$AB_NAMESPACE" \
    --userId 'TVNHzo47' \
    --body '{"allowOverdraft": true, "amount": 63, "balanceOrigin": "Oculus", "balanceSource": "PAYMENT", "metadata": {"pUAm5KIF": {}, "7adQ8P2u": {}, "Bjx1TCXT": {}}, "reason": "kEsNAyas"}' \
    > test.out 2>&1
eval_tap $? 336 'DebitUserWalletByCurrencyCode' test.out

#- 337 ListUserCurrencyTransactions
./ng net.accelbyte.sdk.cli.Main platform listUserCurrencyTransactions \
    --currencyCode '2LGileY7' \
    --namespace "$AB_NAMESPACE" \
    --userId 'F8on9Jpa' \
    --limit '42' \
    --offset '82' \
    > test.out 2>&1
eval_tap $? 337 'ListUserCurrencyTransactions' test.out

#- 338 CheckBalance
./ng net.accelbyte.sdk.cli.Main platform checkBalance \
    --currencyCode 'ywTG7gfZ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'XsddDN9i' \
    --request '{"amount": 3, "debitBalanceSource": "IAP_REVOCATION", "metadata": {"T93wfbZg": {}, "X1BWb2KX": {}, "RE73gyVT": {}}, "reason": "aZ8OZSfw", "walletPlatform": "IOS"}' \
    > test.out 2>&1
eval_tap $? 338 'CheckBalance' test.out

#- 339 CheckWallet
eval_tap 0 339 'CheckWallet # SKIP deprecated' test.out

#- 340 CreditUserWallet
./ng net.accelbyte.sdk.cli.Main platform creditUserWallet \
    --currencyCode 'GkQ6wFnq' \
    --namespace "$AB_NAMESPACE" \
    --userId 'VCnlidXm' \
    --body '{"amount": 73, "expireAt": "1999-12-06T00:00:00Z", "metadata": {"WKAGJG3j": {}, "IZKZF5Cj": {}, "GV0GrnUG": {}}, "origin": "System", "reason": "AmmdzMzh", "source": "ACHIEVEMENT"}' \
    > test.out 2>&1
eval_tap $? 340 'CreditUserWallet' test.out

#- 341 DebitByWalletPlatform
./ng net.accelbyte.sdk.cli.Main platform debitByWalletPlatform \
    --currencyCode 'O9nu1Ytx' \
    --namespace "$AB_NAMESPACE" \
    --userId 'LzdSBXAR' \
    --request '{"amount": 4, "debitBalanceSource": "IAP_REVOCATION", "metadata": {"kuiZS2Ei": {}, "wOJPgbMH": {}, "nGZyYa8p": {}}, "reason": "2S3iTW7E", "walletPlatform": "Xbox"}' \
    > test.out 2>&1
eval_tap $? 341 'DebitByWalletPlatform' test.out

#- 342 PayWithUserWallet
./ng net.accelbyte.sdk.cli.Main platform payWithUserWallet \
    --currencyCode '95PBKI17' \
    --namespace "$AB_NAMESPACE" \
    --userId 'OKCeLsCE' \
    --body '{"amount": 55, "metadata": {"I7IK3BvP": {}, "BOBMVgQz": {}, "VLIYeRDB": {}}, "walletPlatform": "Nintendo"}' \
    > test.out 2>&1
eval_tap $? 342 'PayWithUserWallet' test.out

#- 343 GetUserWallet
eval_tap 0 343 'GetUserWallet # SKIP deprecated' test.out

#- 344 DebitUserWallet
eval_tap 0 344 'DebitUserWallet # SKIP deprecated' test.out

#- 345 DisableUserWallet
eval_tap 0 345 'DisableUserWallet # SKIP deprecated' test.out

#- 346 EnableUserWallet
eval_tap 0 346 'EnableUserWallet # SKIP deprecated' test.out

#- 347 ListUserWalletTransactions
eval_tap 0 347 'ListUserWalletTransactions # SKIP deprecated' test.out

#- 348 ListViews
./ng net.accelbyte.sdk.cli.Main platform listViews \
    --namespace "$AB_NAMESPACE" \
    --storeId '1yVeEDlk' \
    > test.out 2>&1
eval_tap $? 348 'ListViews' test.out

#- 349 CreateView
./ng net.accelbyte.sdk.cli.Main platform createView \
    --namespace "$AB_NAMESPACE" \
    --storeId 'UoKjxes0' \
    --body '{"displayOrder": 80, "localizations": {"9qCaMUaV": {"description": "quFGu3Ms", "localExt": {"wQvEPiZL": {}, "6Cee9mTf": {}, "idOVDxNE": {}}, "longDescription": "SepL0KvK", "title": "tDLVWPC3"}, "2lfV0QEN": {"description": "1jltLHvs", "localExt": {"vavKBHvl": {}, "VughL7PU": {}, "p31fDXs8": {}}, "longDescription": "q6LHZutC", "title": "uWGPQsIo"}, "g39yZRQT": {"description": "pWsxBOtD", "localExt": {"2hNSw8Ex": {}, "ViGV9bg0": {}, "Cz3zR27j": {}}, "longDescription": "lGbricgQ", "title": "nzS0zvXF"}}, "name": "ygKHqudS"}' \
    > test.out 2>&1
eval_tap $? 349 'CreateView' test.out

#- 350 GetView
./ng net.accelbyte.sdk.cli.Main platform getView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'CUTBcxXj' \
    --storeId 'Vp7YNihc' \
    > test.out 2>&1
eval_tap $? 350 'GetView' test.out

#- 351 UpdateView
./ng net.accelbyte.sdk.cli.Main platform updateView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'nBO3Zvjw' \
    --storeId 'YqkiJu4N' \
    --body '{"displayOrder": 11, "localizations": {"ltzJGuDe": {"description": "XXtkuUUj", "localExt": {"NR0lBpVm": {}, "fwmrQGyL": {}, "jOFbNJX5": {}}, "longDescription": "S0A3sCLc", "title": "eMCc1dSf"}, "f5a2VQla": {"description": "Ai5TAH8d", "localExt": {"0Xez4qll": {}, "dG32ZvDH": {}, "ybjarCif": {}}, "longDescription": "fGZBihja", "title": "V80ucV44"}, "v2AOHxjF": {"description": "eoGii82X", "localExt": {"W2WEUyD0": {}, "YgrR5bJy": {}, "PHcbdYxo": {}}, "longDescription": "4CC1gFJq", "title": "SccBUm47"}}, "name": "ASKckh6f"}' \
    > test.out 2>&1
eval_tap $? 351 'UpdateView' test.out

#- 352 DeleteView
./ng net.accelbyte.sdk.cli.Main platform deleteView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'Gaq9wEHE' \
    --storeId 'rmBiVtKA' \
    > test.out 2>&1
eval_tap $? 352 'DeleteView' test.out

#- 353 GetWalletConfig
./ng net.accelbyte.sdk.cli.Main platform getWalletConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 353 'GetWalletConfig' test.out

#- 354 UpdateWalletConfig
./ng net.accelbyte.sdk.cli.Main platform updateWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"enablePaidForVCExpiration": false}' \
    > test.out 2>&1
eval_tap $? 354 'UpdateWalletConfig' test.out

#- 355 QueryWallets
eval_tap 0 355 'QueryWallets # SKIP deprecated' test.out

#- 356 BulkCredit
./ng net.accelbyte.sdk.cli.Main platform bulkCredit \
    --namespace "$AB_NAMESPACE" \
    --body '[{"creditRequest": {"amount": 86, "expireAt": "1983-11-03T00:00:00Z", "metadata": {"tX8GKv1g": {}, "1FmXDBqp": {}, "FzjaZts5": {}}, "origin": "Nintendo", "reason": "opLthdcH", "source": "PURCHASE"}, "currencyCode": "2sWvg759", "userIds": ["cBfs0WH8", "vPWnbZXu", "GRG9W9Uf"]}, {"creditRequest": {"amount": 5, "expireAt": "1977-12-18T00:00:00Z", "metadata": {"PBjHBBlR": {}, "yYKF2iWM": {}, "KkU5dJSl": {}}, "origin": "IOS", "reason": "0BUwUNTM", "source": "REDEEM_CODE"}, "currencyCode": "JdlVozsq", "userIds": ["g85a2bYM", "kxdmEJV1", "okTr9gj8"]}, {"creditRequest": {"amount": 19, "expireAt": "1999-11-15T00:00:00Z", "metadata": {"Cps9YjVb": {}, "4lFWtfYw": {}, "Ueh8heFW": {}}, "origin": "IOS", "reason": "mHgAGchN", "source": "REWARD"}, "currencyCode": "j6k7D3Ha", "userIds": ["evRGrHle", "ZroD6KwK", "pxiXhmX7"]}]' \
    > test.out 2>&1
eval_tap $? 356 'BulkCredit' test.out

#- 357 BulkDebit
./ng net.accelbyte.sdk.cli.Main platform bulkDebit \
    --namespace "$AB_NAMESPACE" \
    --body '[{"currencyCode": "vT2qEFsx", "request": {"allowOverdraft": true, "amount": 1, "balanceOrigin": "Steam", "balanceSource": "ORDER_REVOCATION", "metadata": {"Pnsfaudw": {}, "e63sv0M4": {}, "zz28R4fA": {}}, "reason": "tAskOhM8"}, "userIds": ["BP4d2B3F", "EihAAh9i", "38qXYoXy"]}, {"currencyCode": "RMNEyODR", "request": {"allowOverdraft": true, "amount": 1, "balanceOrigin": "Oculus", "balanceSource": "PAYMENT", "metadata": {"zstfJuYo": {}, "6wrS2FZ3": {}, "kUgiQxK9": {}}, "reason": "1qksC6rL"}, "userIds": ["mvetGOBw", "oiV30hCK", "ZbmMaAwH"]}, {"currencyCode": "nHQqGdUD", "request": {"allowOverdraft": true, "amount": 33, "balanceOrigin": "IOS", "balanceSource": "TRADE", "metadata": {"22nqeWdo": {}, "JddVDZXt": {}, "rIlSIBmZ": {}}, "reason": "9VqDav1m"}, "userIds": ["PpdxSZe6", "DSGmACCC", "JTrk3xKr"]}]' \
    > test.out 2>&1
eval_tap $? 357 'BulkDebit' test.out

#- 358 GetWallet
eval_tap 0 358 'GetWallet # SKIP deprecated' test.out

#- 359 SyncOrders
./ng net.accelbyte.sdk.cli.Main platform syncOrders \
    --nextEvaluatedKey 'Uvoo1Rt3' \
    --end 'frinQePi' \
    --start 'ygXa3mIy' \
    > test.out 2>&1
eval_tap $? 359 'SyncOrders' test.out

#- 360 TestAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfig \
    --sandbox  \
    --body '{"allowedPaymentMethods": ["4xcHr75O", "YdjvIvrL", "RVkRcJpe"], "apiKey": "x0QtFcgZ", "authoriseAsCapture": true, "blockedPaymentMethods": ["a7q9FQeE", "Ro0QpGkH", "uO1oxzmp"], "clientKey": "UcCaYBWX", "dropInSettings": "KoEE4Bkx", "liveEndpointUrlPrefix": "qjT4rUNz", "merchantAccount": "uBBFnhrs", "notificationHmacKey": "ITSXneFM", "notificationPassword": "cGmLMmOr", "notificationUsername": "dGDiNvcD", "returnUrl": "G8YnnIPP", "settings": "krpItbvQ"}' \
    > test.out 2>&1
eval_tap $? 360 'TestAdyenConfig' test.out

#- 361 TestAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfig \
    --sandbox  \
    --body '{"appId": "fvtRLJcY", "privateKey": "aKDQqg0J", "publicKey": "vH46XgdS", "returnUrl": "lV8wob0u"}' \
    > test.out 2>&1
eval_tap $? 361 'TestAliPayConfig' test.out

#- 362 TestCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfig \
    --sandbox  \
    --body '{"publicKey": "SJWwJVrR", "secretKey": "fuycq4jZ"}' \
    > test.out 2>&1
eval_tap $? 362 'TestCheckoutConfig' test.out

#- 363 DebugMatchedPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentMerchantConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'rOfEqTd2' \
    > test.out 2>&1
eval_tap $? 363 'DebugMatchedPaymentMerchantConfig' test.out

#- 364 TestNeonPayConfig
./ng net.accelbyte.sdk.cli.Main platform testNeonPayConfig \
    --sandbox  \
    --body '{"apiKey": "f3MGTCWq", "webhookSecretKey": "6mndYpLt"}' \
    > test.out 2>&1
eval_tap $? 364 'TestNeonPayConfig' test.out

#- 365 TestPayPalConfig
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfig \
    --sandbox  \
    --body '{"clientID": "p2yGQYrc", "clientSecret": "XY8r1voB", "returnUrl": "ttEmJlO7", "webHookId": "0Psmx37P"}' \
    > test.out 2>&1
eval_tap $? 365 'TestPayPalConfig' test.out

#- 366 TestStripeConfig
./ng net.accelbyte.sdk.cli.Main platform testStripeConfig \
    --sandbox  \
    --body '{"allowedPaymentMethodTypes": ["g8pk73oU", "2t6CwScD", "jyXoMVxj"], "publishableKey": "6jGSGc3v", "secretKey": "oDvfyQ9a", "webhookSecret": "bZr5kgR6"}' \
    > test.out 2>&1
eval_tap $? 366 'TestStripeConfig' test.out

#- 367 TestWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfig \
    --body '{"appId": "MJNPcfem", "key": "NiweFhFY", "mchid": "cshTNWmz", "returnUrl": "YhsDvFSn"}' \
    > test.out 2>&1
eval_tap $? 367 'TestWxPayConfig' test.out

#- 368 TestXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfig \
    --body '{"apiKey": "7Itd2Que", "flowCompletionUrl": "dgYV7wzS", "merchantId": 89, "projectId": 97, "projectSecretKey": "MVrWDHoK"}' \
    > test.out 2>&1
eval_tap $? 368 'TestXsollaConfig' test.out

#- 369 GetPaymentMerchantConfig1
./ng net.accelbyte.sdk.cli.Main platform getPaymentMerchantConfig1 \
    --id 'U0gA0A1Z' \
    > test.out 2>&1
eval_tap $? 369 'GetPaymentMerchantConfig1' test.out

#- 370 UpdateAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform updateAdyenConfig \
    --id '8e7QyoOx' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethods": ["75iAcF1p", "mzI52YqA", "qdHgrsIr"], "apiKey": "h5DEIlP6", "authoriseAsCapture": true, "blockedPaymentMethods": ["cUCe9JpM", "0y9rSjcL", "a1F4g06d"], "clientKey": "Z0GcQiAL", "dropInSettings": "8dt7lKWq", "liveEndpointUrlPrefix": "2QOF5qPa", "merchantAccount": "QR2vp6wi", "notificationHmacKey": "pqbSjAq7", "notificationPassword": "7CTv5eQr", "notificationUsername": "6n4A3z1e", "returnUrl": "8zhbYPCo", "settings": "Aargifm5"}' \
    > test.out 2>&1
eval_tap $? 370 'UpdateAdyenConfig' test.out

#- 371 TestAdyenConfigById
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfigById \
    --id 'cjglJ3RL' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 371 'TestAdyenConfigById' test.out

#- 372 UpdateAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateAliPayConfig \
    --id 'Hfq31Ti6' \
    --sandbox  \
    --validate  \
    --body '{"appId": "FNVIWDq1", "privateKey": "VC9bOjKz", "publicKey": "pOrRltbO", "returnUrl": "fvStaw2n"}' \
    > test.out 2>&1
eval_tap $? 372 'UpdateAliPayConfig' test.out

#- 373 TestAliPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfigById \
    --id 'ZmEWF0nZ' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 373 'TestAliPayConfigById' test.out

#- 374 UpdateCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform updateCheckoutConfig \
    --id '2ATzyvIS' \
    --sandbox  \
    --validate  \
    --body '{"publicKey": "Li1yRGGk", "secretKey": "R7eZr68m"}' \
    > test.out 2>&1
eval_tap $? 374 'UpdateCheckoutConfig' test.out

#- 375 TestCheckoutConfigById
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfigById \
    --id 'RJRC0nuV' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 375 'TestCheckoutConfigById' test.out

#- 376 UpdateNeonPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateNeonPayConfig \
    --id 'ymNQgFgI' \
    --sandbox  \
    --validate  \
    --body '{"apiKey": "r1I3FfgC", "webhookSecretKey": "59sADAA1"}' \
    > test.out 2>&1
eval_tap $? 376 'UpdateNeonPayConfig' test.out

#- 377 TestNeonPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testNeonPayConfigById \
    --id 'QV1Bbx4p' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 377 'TestNeonPayConfigById' test.out

#- 378 UpdatePayPalConfig
./ng net.accelbyte.sdk.cli.Main platform updatePayPalConfig \
    --id 'DQ1rm3or' \
    --sandbox  \
    --validate  \
    --body '{"clientID": "3TaWOFv1", "clientSecret": "waVRmseF", "returnUrl": "d0SuMGae", "webHookId": "2p03HWGM"}' \
    > test.out 2>&1
eval_tap $? 378 'UpdatePayPalConfig' test.out

#- 379 TestPayPalConfigById
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfigById \
    --id '0N6wsqbH' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 379 'TestPayPalConfigById' test.out

#- 380 UpdateStripeConfig
./ng net.accelbyte.sdk.cli.Main platform updateStripeConfig \
    --id 'qAvzMrMj' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethodTypes": ["eP0fTswr", "bQTzlKkj", "RgA92aY3"], "publishableKey": "8BheEh9X", "secretKey": "3pcEBwCW", "webhookSecret": "WzLV9ORW"}' \
    > test.out 2>&1
eval_tap $? 380 'UpdateStripeConfig' test.out

#- 381 TestStripeConfigById
./ng net.accelbyte.sdk.cli.Main platform testStripeConfigById \
    --id 'qy7yHl0A' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 381 'TestStripeConfigById' test.out

#- 382 UpdateWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfig \
    --id 'njkGLRi8' \
    --validate  \
    --body '{"appId": "4FkbBdHo", "key": "hP0JxXsC", "mchid": "l2owqL8R", "returnUrl": "SivKkkBX"}' \
    > test.out 2>&1
eval_tap $? 382 'UpdateWxPayConfig' test.out

#- 383 UpdateWxPayConfigCert
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfigCert \
    --id 'qms7DMnW' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 383 'UpdateWxPayConfigCert' test.out

#- 384 TestWxPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfigById \
    --id 'msOGWae9' \
    > test.out 2>&1
eval_tap $? 384 'TestWxPayConfigById' test.out

#- 385 UpdateXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaConfig \
    --id '8yIslFJO' \
    --validate  \
    --body '{"apiKey": "jSRcLqNS", "flowCompletionUrl": "hkMTJ1AD", "merchantId": 6, "projectId": 31, "projectSecretKey": "e8KOavg6"}' \
    > test.out 2>&1
eval_tap $? 385 'UpdateXsollaConfig' test.out

#- 386 TestXsollaConfigById
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfigById \
    --id 'kmMLEJAj' \
    > test.out 2>&1
eval_tap $? 386 'TestXsollaConfigById' test.out

#- 387 UpdateXsollaUIConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaUIConfig \
    --id 'uvxMduZx' \
    --body '{"device": "MOBILE", "showCloseButton": true, "size": "SMALL", "theme": "DEFAULT"}' \
    > test.out 2>&1
eval_tap $? 387 'UpdateXsollaUIConfig' test.out

#- 388 QueryPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform queryPaymentProviderConfig \
    --limit '61' \
    --namespace "$AB_NAMESPACE" \
    --offset '97' \
    --region 'JVWWTYOB' \
    > test.out 2>&1
eval_tap $? 388 'QueryPaymentProviderConfig' test.out

#- 389 CreatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform createPaymentProviderConfig \
    --body '{"aggregate": "STRIPE", "namespace": "swUYv0h8", "region": "ZJtQFxZM", "sandboxTaxJarApiToken": "mTenwpPv", "specials": ["PAYPAL", "ALIPAY", "XSOLLA"], "taxJarApiToken": "K3lUGUfV", "taxJarEnabled": true, "useGlobalTaxJarApiToken": false}' \
    > test.out 2>&1
eval_tap $? 389 'CreatePaymentProviderConfig' test.out

#- 390 GetAggregatePaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getAggregatePaymentProviders \
    > test.out 2>&1
eval_tap $? 390 'GetAggregatePaymentProviders' test.out

#- 391 DebugMatchedPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentProviderConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'Q5evCmF2' \
    > test.out 2>&1
eval_tap $? 391 'DebugMatchedPaymentProviderConfig' test.out

#- 392 GetSpecialPaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getSpecialPaymentProviders \
    > test.out 2>&1
eval_tap $? 392 'GetSpecialPaymentProviders' test.out

#- 393 UpdatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentProviderConfig \
    --id '8u9PntkH' \
    --body '{"aggregate": "NEONPAY", "namespace": "NatAzMlO", "region": "WweAjALk", "sandboxTaxJarApiToken": "HmnO5g1t", "specials": ["NEONPAY", "ALIPAY", "WXPAY"], "taxJarApiToken": "LsbRPbcC", "taxJarEnabled": false, "useGlobalTaxJarApiToken": true}' \
    > test.out 2>&1
eval_tap $? 393 'UpdatePaymentProviderConfig' test.out

#- 394 DeletePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform deletePaymentProviderConfig \
    --id 'hjdxTeIk' \
    > test.out 2>&1
eval_tap $? 394 'DeletePaymentProviderConfig' test.out

#- 395 GetPaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxConfig \
    > test.out 2>&1
eval_tap $? 395 'GetPaymentTaxConfig' test.out

#- 396 UpdatePaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentTaxConfig \
    --body '{"sandboxTaxJarApiToken": "5wTfgQyM", "taxJarApiToken": "zqUhevbj", "taxJarEnabled": false, "taxJarProductCodesMapping": {"qQxpeUTo": "4wOwxkdm", "0bRt1H13": "fDXSKttc", "1gxcbMDl": "jRVk4mV9"}}' \
    > test.out 2>&1
eval_tap $? 396 'UpdatePaymentTaxConfig' test.out

#- 397 SyncPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform syncPaymentOrders \
    --nextEvaluatedKey 'YkdteREl' \
    --end 'asB6mzIY' \
    --start 'JJXcpLrU' \
    > test.out 2>&1
eval_tap $? 397 'SyncPaymentOrders' test.out

#- 398 PublicGetRootCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetRootCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'wDDcIBZz' \
    --storeId 'azxhYLwP' \
    > test.out 2>&1
eval_tap $? 398 'PublicGetRootCategories' test.out

#- 399 DownloadCategories
./ng net.accelbyte.sdk.cli.Main platform downloadCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'NBMrxpL8' \
    --storeId 'UExMWBGy' \
    > test.out 2>&1
eval_tap $? 399 'DownloadCategories' test.out

#- 400 PublicGetCategory
./ng net.accelbyte.sdk.cli.Main platform publicGetCategory \
    --categoryPath 'DTjhie3u' \
    --namespace "$AB_NAMESPACE" \
    --language 'WOQHWavz' \
    --storeId 'mjYfH539' \
    > test.out 2>&1
eval_tap $? 400 'PublicGetCategory' test.out

#- 401 PublicGetChildCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetChildCategories \
    --categoryPath 'FE8pD4rc' \
    --namespace "$AB_NAMESPACE" \
    --language 'IVZAuTO0' \
    --storeId 'oFYVnWuf' \
    > test.out 2>&1
eval_tap $? 401 'PublicGetChildCategories' test.out

#- 402 PublicGetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetDescendantCategories \
    --categoryPath 'OOLHNkv2' \
    --namespace "$AB_NAMESPACE" \
    --language 'NoVkP7b8' \
    --storeId 'k7hoA2oj' \
    > test.out 2>&1
eval_tap $? 402 'PublicGetDescendantCategories' test.out

#- 403 PublicListCurrencies
./ng net.accelbyte.sdk.cli.Main platform publicListCurrencies \
    --namespace "$AB_NAMESPACE" \
    --currencyType 'VIRTUAL' \
    > test.out 2>&1
eval_tap $? 403 'PublicListCurrencies' test.out

#- 404 GeDLCDurableRewardShortMap
./ng net.accelbyte.sdk.cli.Main platform geDLCDurableRewardShortMap \
    --namespace "$AB_NAMESPACE" \
    --dlcType 'EPICGAMES' \
    > test.out 2>&1
eval_tap $? 404 'GeDLCDurableRewardShortMap' test.out

#- 405 GetAppleConfigVersion
./ng net.accelbyte.sdk.cli.Main platform getAppleConfigVersion \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 405 'GetAppleConfigVersion' test.out

#- 406 GetIAPItemMapping
./ng net.accelbyte.sdk.cli.Main platform getIAPItemMapping \
    --namespace "$AB_NAMESPACE" \
    --platform 'XBOX' \
    > test.out 2>&1
eval_tap $? 406 'GetIAPItemMapping' test.out

#- 407 PublicGetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --language 'jEl73Iwz' \
    --region 'CNHfyRaB' \
    --storeId 'Xep8dz4B' \
    --appId '4ApZW7HC' \
    > test.out 2>&1
eval_tap $? 407 'PublicGetItemByAppId' test.out

#- 408 PublicQueryItems
./ng net.accelbyte.sdk.cli.Main platform publicQueryItems \
    --namespace "$AB_NAMESPACE" \
    --appType 'GAME' \
    --autoCalcEstimatedPrice  \
    --baseAppId '4LraYbr2' \
    --categoryPath 'hVuaLQZi' \
    --features 'LXBYMN0S' \
    --includeSubCategoryItem  \
    --itemType 'CODE' \
    --language 'uIbZA5DL' \
    --limit '79' \
    --offset '43' \
    --region 'iU4YvDsT' \
    --sortBy 'displayOrder,name,createdAt:desc' \
    --storeId 'Qgt14htl' \
    --tags 'sUVE7Tlh' \
    > test.out 2>&1
eval_tap $? 408 'PublicQueryItems' test.out

#- 409 PublicGetItemBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetItemBySku \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'EFRxUyYa' \
    --region 'oxrRqwDG' \
    --storeId 'VhrTNVjo' \
    --sku '1EIuvCHL' \
    > test.out 2>&1
eval_tap $? 409 'PublicGetItemBySku' test.out

#- 410 PublicGetEstimatedPrice
./ng net.accelbyte.sdk.cli.Main platform publicGetEstimatedPrice \
    --namespace "$AB_NAMESPACE" \
    --region '497Yt2JG' \
    --storeId 'D8jRzSLm' \
    --itemIds 'zMuWaJS1' \
    > test.out 2>&1
eval_tap $? 410 'PublicGetEstimatedPrice' test.out

#- 411 PublicBulkGetItems
./ng net.accelbyte.sdk.cli.Main platform publicBulkGetItems \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'cpDiGtpp' \
    --region 'pb4uWVU3' \
    --storeId 's4UHtguE' \
    --itemIds 'NkvRxPjw' \
    > test.out 2>&1
eval_tap $? 411 'PublicBulkGetItems' test.out

#- 412 PublicValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform publicValidateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --body '{"itemIds": ["hk9VKmFP", "SoxcmAS4", "MaQc6w2F"]}' \
    > test.out 2>&1
eval_tap $? 412 'PublicValidateItemPurchaseCondition' test.out

#- 413 PublicSearchItems
./ng net.accelbyte.sdk.cli.Main platform publicSearchItems \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --itemType 'APP' \
    --limit '52' \
    --offset '37' \
    --region 'vRFxquIw' \
    --storeId 'LgBidN7u' \
    --keyword 'j2tlFkxX' \
    --language 'uT9k8jgR' \
    > test.out 2>&1
eval_tap $? 413 'PublicSearchItems' test.out

#- 414 PublicGetApp
./ng net.accelbyte.sdk.cli.Main platform publicGetApp \
    --itemId 'f4lxvU2q' \
    --namespace "$AB_NAMESPACE" \
    --language 'qL4DIvJs' \
    --region 'RlqdOxKK' \
    --storeId '8bvsX5jp' \
    > test.out 2>&1
eval_tap $? 414 'PublicGetApp' test.out

#- 415 PublicGetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform publicGetItemDynamicData \
    --itemId 'H0NyKw4B' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 415 'PublicGetItemDynamicData' test.out

#- 416 PublicGetItem
./ng net.accelbyte.sdk.cli.Main platform publicGetItem \
    --itemId 'NprZhtLY' \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'veR8DWaC' \
    --populateBundle  \
    --region 'pUWr27aC' \
    --storeId '7kvu2GQx' \
    > test.out 2>&1
eval_tap $? 416 'PublicGetItem' test.out

#- 417 GetPaymentCustomization
eval_tap 0 417 'GetPaymentCustomization # SKIP deprecated' test.out

#- 418 PublicGetPaymentUrl
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentUrl \
    --namespace "$AB_NAMESPACE" \
    --body '{"neonPayConfig": {"cancelUrl": "DYROLf8m", "successUrl": "LZiqNBDM"}, "paymentOrderNo": "m4UE82W4", "paymentProvider": "WALLET", "returnUrl": "HwEszwCw", "ui": "0p4iUV5s", "zipCode": "CZ6YjLpy"}' \
    > test.out 2>&1
eval_tap $? 418 'PublicGetPaymentUrl' test.out

#- 419 PublicGetPaymentMethods
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentMethods \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'E7Z2j0jG' \
    > test.out 2>&1
eval_tap $? 419 'PublicGetPaymentMethods' test.out

#- 420 PublicGetUnpaidPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUnpaidPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '01hYFrKf' \
    > test.out 2>&1
eval_tap $? 420 'PublicGetUnpaidPaymentOrder' test.out

#- 421 Pay
./ng net.accelbyte.sdk.cli.Main platform pay \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '6rpgPqtf' \
    --paymentProvider 'WXPAY' \
    --zipCode 'nalc6QHs' \
    --body '{"token": "iLuVemeO"}' \
    > test.out 2>&1
eval_tap $? 421 'Pay' test.out

#- 422 PublicCheckPaymentOrderPaidStatus
./ng net.accelbyte.sdk.cli.Main platform publicCheckPaymentOrderPaidStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '1ohZr9Vd' \
    > test.out 2>&1
eval_tap $? 422 'PublicCheckPaymentOrderPaidStatus' test.out

#- 423 GetPaymentPublicConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentPublicConfig \
    --namespace "$AB_NAMESPACE" \
    --sandbox  \
    --paymentProvider 'NEONPAY' \
    --region 't7mNPhVC' \
    > test.out 2>&1
eval_tap $? 423 'GetPaymentPublicConfig' test.out

#- 424 PublicGetQRCode
./ng net.accelbyte.sdk.cli.Main platform publicGetQRCode \
    --namespace "$AB_NAMESPACE" \
    --code '87TQoPUu' \
    > test.out 2>&1
eval_tap $? 424 'PublicGetQRCode' test.out

#- 425 PublicNormalizePaymentReturnUrl
./ng net.accelbyte.sdk.cli.Main platform publicNormalizePaymentReturnUrl \
    --namespace "$AB_NAMESPACE" \
    --payerID 'GrLwdPfO' \
    --foreinginvoice 'QTAfIQLe' \
    --invoiceId 'nlAHmOen' \
    --payload 'Cwp5Abuu' \
    --redirectResult 'OQCx7tlp' \
    --resultCode 'zae3fm3a' \
    --sessionId 'Exmv5KCB' \
    --status 'Ns0wLI33' \
    --token 'jnFzv67m' \
    --type 'Iclr9aEi' \
    --userId 'i9wZ8vBa' \
    --orderNo 'WPK4mH55' \
    --paymentOrderNo 'TuEHdOPJ' \
    --paymentProvider 'WXPAY' \
    --returnUrl 'uqPtjqKO' \
    > test.out 2>&1
eval_tap $? 425 'PublicNormalizePaymentReturnUrl' test.out

#- 426 GetPaymentTaxValue
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxValue \
    --namespace "$AB_NAMESPACE" \
    --zipCode 'GTj2qvRW' \
    --paymentOrderNo 'jE26iIAO' \
    --paymentProvider 'WXPAY' \
    > test.out 2>&1
eval_tap $? 426 'GetPaymentTaxValue' test.out

#- 427 GetRewardByCode
./ng net.accelbyte.sdk.cli.Main platform getRewardByCode \
    --namespace "$AB_NAMESPACE" \
    --rewardCode '5P7IacXq' \
    > test.out 2>&1
eval_tap $? 427 'GetRewardByCode' test.out

#- 428 QueryRewards1
./ng net.accelbyte.sdk.cli.Main platform queryRewards1 \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'Nz4KqVYx' \
    --limit '66' \
    --offset '64' \
    --sortBy 'namespace,namespace:desc' \
    > test.out 2>&1
eval_tap $? 428 'QueryRewards1' test.out

#- 429 GetReward1
./ng net.accelbyte.sdk.cli.Main platform getReward1 \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'OrTfzhjI' \
    > test.out 2>&1
eval_tap $? 429 'GetReward1' test.out

#- 430 PublicListStores
./ng net.accelbyte.sdk.cli.Main platform publicListStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 430 'PublicListStores' test.out

#- 431 PublicExistsAnyMyActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyMyActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --appIds '8x3meYet,EhZ4wGT9,IdLPoAm3' \
    --itemIds 'stuzqySb,nSlL1NEF,dVIpQura' \
    --skus 'RnAuKIXZ,5lcYkUmB,E7k8B9Aj' \
    > test.out 2>&1
eval_tap $? 431 'PublicExistsAnyMyActiveEntitlement' test.out

#- 432 PublicGetMyAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --appId 'uAjxqbLe' \
    > test.out 2>&1
eval_tap $? 432 'PublicGetMyAppEntitlementOwnershipByAppId' test.out

#- 433 PublicGetMyEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'LOOTBOX' \
    --itemId 'KUFxNzGg' \
    > test.out 2>&1
eval_tap $? 433 'PublicGetMyEntitlementOwnershipByItemId' test.out

#- 434 PublicGetMyEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'LOOTBOX' \
    --sku 'e8OSbd4V' \
    > test.out 2>&1
eval_tap $? 434 'PublicGetMyEntitlementOwnershipBySku' test.out

#- 435 PublicGetEntitlementOwnershipToken
./ng net.accelbyte.sdk.cli.Main platform publicGetEntitlementOwnershipToken \
    --namespace "$AB_NAMESPACE" \
    --appIds 'G8BykXle,gsl2Oiv0,coeI9M2t' \
    --itemIds 'z9xpedfu,wnqRN0oy,5na7EFVb' \
    --skus 'ld9Cm2Xt,aOtmYoUY,PRvhA9eM' \
    > test.out 2>&1
eval_tap $? 435 'PublicGetEntitlementOwnershipToken' test.out

#- 436 SyncTwitchDropsEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement \
    --namespace "$AB_NAMESPACE" \
    --body '{"gameId": "fToYypn3", "language": "jMZ_OhZg", "region": "HMTaro9h"}' \
    > test.out 2>&1
eval_tap $? 436 'SyncTwitchDropsEntitlement' test.out

#- 437 PublicGetMyWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetMyWallet \
    --currencyCode 'bj6XPfdw' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 437 'PublicGetMyWallet' test.out

#- 438 SyncEpicGameDLC
./ng net.accelbyte.sdk.cli.Main platform syncEpicGameDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'KfOB8wBD' \
    --body '{"epicGamesJwtToken": "QRzLFLXo"}' \
    > test.out 2>&1
eval_tap $? 438 'SyncEpicGameDLC' test.out

#- 439 SyncOculusDLC
./ng net.accelbyte.sdk.cli.Main platform syncOculusDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'oAxJCW4N' \
    > test.out 2>&1
eval_tap $? 439 'SyncOculusDLC' test.out

#- 440 PublicSyncPsnDlcInventory
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventory \
    --namespace "$AB_NAMESPACE" \
    --userId '1f0GLlsJ' \
    --body '{"serviceLabel": 18}' \
    > test.out 2>&1
eval_tap $? 440 'PublicSyncPsnDlcInventory' test.out

#- 441 PublicSyncPsnDlcInventoryWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventoryWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId '11JfLeyl' \
    --body '{"serviceLabels": [92, 54, 55]}' \
    > test.out 2>&1
eval_tap $? 441 'PublicSyncPsnDlcInventoryWithMultipleServiceLabels' test.out

#- 442 SyncSteamDLC
./ng net.accelbyte.sdk.cli.Main platform syncSteamDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'rVlDVEXD' \
    --body '{"appId": "tvpQQqlh", "steamId": "C4c4kmB2"}' \
    > test.out 2>&1
eval_tap $? 442 'SyncSteamDLC' test.out

#- 443 SyncXboxDLC
./ng net.accelbyte.sdk.cli.Main platform syncXboxDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'k8h2Pk0v' \
    --body '{"xstsToken": "RWBvZklD"}' \
    > test.out 2>&1
eval_tap $? 443 'SyncXboxDLC' test.out

#- 444 PublicQueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'qS242YBv' \
    --appType 'SOFTWARE' \
    --entitlementClazz 'ENTITLEMENT' \
    --entitlementName 'FUwxim4r' \
    --features 'FFjUsyig,97hDT4aS,TDie5tgd' \
    --itemId 'KVj0RNWh,ycJb29sd,MMg8QGj8' \
    --limit '23' \
    --offset '14' \
    > test.out 2>&1
eval_tap $? 444 'PublicQueryUserEntitlements' test.out

#- 445 PublicGetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'zn7TId8V' \
    --appId 'Qt9VQ6f4' \
    > test.out 2>&1
eval_tap $? 445 'PublicGetUserAppEntitlementByAppId' test.out

#- 446 PublicQueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'iytUOa7M' \
    --limit '86' \
    --offset '43' \
    --appType 'SOFTWARE' \
    > test.out 2>&1
eval_tap $? 446 'PublicQueryUserEntitlementsByAppType' test.out

#- 447 PublicGetUserEntitlementsByIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementsByIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'nscJItkm' \
    --availablePlatformOnly  \
    --ids 'IUHkwp0Z,J1lPVp0Y,92p0G8m4' \
    > test.out 2>&1
eval_tap $? 447 'PublicGetUserEntitlementsByIds' test.out

#- 448 PublicGetUserEntitlementByItemId
eval_tap 0 448 'PublicGetUserEntitlementByItemId # SKIP deprecated' test.out

#- 449 PublicGetUserEntitlementBySku
eval_tap 0 449 'PublicGetUserEntitlementBySku # SKIP deprecated' test.out

#- 450 PublicUserEntitlementHistory
./ng net.accelbyte.sdk.cli.Main platform publicUserEntitlementHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'EpamY1V5' \
    --endDate 'yd7BHMfi' \
    --entitlementClazz 'CODE' \
    --limit '71' \
    --offset '59' \
    --startDate '7Oj4Fba0' \
    > test.out 2>&1
eval_tap $? 450 'PublicUserEntitlementHistory' test.out

#- 451 PublicExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'ddokcAOZ' \
    --appIds 'rE9zrPZD,REEC6kEP,VKrSgpDf' \
    --itemIds 'MHXAlmfk,BMBdVSuW,OJf1N9nO' \
    --skus 'jcupCVyl,XK224Jqc,vShXvc8r' \
    > test.out 2>&1
eval_tap $? 451 'PublicExistsAnyUserActiveEntitlement' test.out

#- 452 PublicGetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'eh1HFneO' \
    --appId 'tRv89jtL' \
    > test.out 2>&1
eval_tap $? 452 'PublicGetUserAppEntitlementOwnershipByAppId' test.out

#- 453 PublicGetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'Sa6FgaiG' \
    --entitlementClazz 'OPTIONBOX' \
    --itemId 'rOohGmZ2' \
    > test.out 2>&1
eval_tap $? 453 'PublicGetUserEntitlementOwnershipByItemId' test.out

#- 454 PublicGetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'GV1KnXHA' \
    --ids 'PPlhpKMw,uQ1RfJIL,cLkV5lFD' \
    > test.out 2>&1
eval_tap $? 454 'PublicGetUserEntitlementOwnershipByItemIds' test.out

#- 455 PublicGetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'VaxZTQ6d' \
    --entitlementClazz 'CODE' \
    --sku 'SmI0DMtR' \
    > test.out 2>&1
eval_tap $? 455 'PublicGetUserEntitlementOwnershipBySku' test.out

#- 456 PublicGetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlement \
    --entitlementId 'ORoIQt6R' \
    --namespace "$AB_NAMESPACE" \
    --userId 'MHq0H8pH' \
    > test.out 2>&1
eval_tap $? 456 'PublicGetUserEntitlement' test.out

#- 457 PublicConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicConsumeUserEntitlement \
    --entitlementId 'YOq8X18x' \
    --namespace "$AB_NAMESPACE" \
    --userId 'fbg6naqt' \
    --body '{"metadata": {"operationSource": "INVENTORY"}, "options": ["cOw0d4PZ", "8n5xKtMP", "gtwRC3D0"], "requestId": "Fl9pZSLz", "useCount": 27}' \
    > test.out 2>&1
eval_tap $? 457 'PublicConsumeUserEntitlement' test.out

#- 458 PublicSellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicSellUserEntitlement \
    --entitlementId 'Ek4fhBth' \
    --namespace "$AB_NAMESPACE" \
    --userId 'gDcmaXlt' \
    --body '{"requestId": "qIxK1ABA", "useCount": 18}' \
    > test.out 2>&1
eval_tap $? 458 'PublicSellUserEntitlement' test.out

#- 459 PublicSplitUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicSplitUserEntitlement \
    --entitlementId '73vGdsRF' \
    --namespace "$AB_NAMESPACE" \
    --userId 'zW0bNXoD' \
    --body '{"metadata": {"operationSource": "INVENTORY"}, "useCount": 30}' \
    > test.out 2>&1
eval_tap $? 459 'PublicSplitUserEntitlement' test.out

#- 460 PublicTransferUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicTransferUserEntitlement \
    --entitlementId '7R90BWXZ' \
    --namespace "$AB_NAMESPACE" \
    --userId '6vSZgd5A' \
    --body '{"entitlementId": "ijeKLN98", "metadata": {"operationSource": "INVENTORY"}, "useCount": 79}' \
    > test.out 2>&1
eval_tap $? 460 'PublicTransferUserEntitlement' test.out

#- 461 PublicRedeemCode
./ng net.accelbyte.sdk.cli.Main platform publicRedeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'LkDW0P25' \
    --body '{"code": "X0VxlhwM", "language": "csYI_744", "region": "tTkqpAn7"}' \
    > test.out 2>&1
eval_tap $? 461 'PublicRedeemCode' test.out

#- 462 PublicFulfillAppleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillAppleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'PDLhsNXp' \
    --body '{"excludeOldTransactions": true, "language": "LRO-WZJZ", "productId": "daGVQkdK", "receiptData": "wOHCSqJ4", "region": "odvuunCS", "transactionId": "goNQY1Ue"}' \
    > test.out 2>&1
eval_tap $? 462 'PublicFulfillAppleIAPItem' test.out

#- 463 SyncEpicGamesInventory
./ng net.accelbyte.sdk.cli.Main platform syncEpicGamesInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'zOsH1fQF' \
    --body '{"epicGamesJwtToken": "ECbwaKFj"}' \
    > test.out 2>&1
eval_tap $? 463 'SyncEpicGamesInventory' test.out

#- 464 PublicFulfillGoogleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillGoogleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'z6CftUkx' \
    --body '{"autoAck": false, "autoConsume": false, "language": "VCYL-oTbf-530", "orderId": "A6y9nPmh", "packageName": "RVNSur6T", "productId": "SzeRWFQh", "purchaseTime": 68, "purchaseToken": "wiXTsjVr", "region": "NUsWMcvU", "subscriptionPurchase": true}' \
    > test.out 2>&1
eval_tap $? 464 'PublicFulfillGoogleIAPItem' test.out

#- 465 SyncOculusSubscriptions
./ng net.accelbyte.sdk.cli.Main platform syncOculusSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'DvGToYQK' \
    --body '{"skus": ["DQmXclvj", "ZvA2jF7e", "DfhmDk99"]}' \
    > test.out 2>&1
eval_tap $? 465 'SyncOculusSubscriptions' test.out

#- 466 SyncOculusConsumableEntitlements
./ng net.accelbyte.sdk.cli.Main platform syncOculusConsumableEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'AdduTf3R' \
    > test.out 2>&1
eval_tap $? 466 'SyncOculusConsumableEntitlements' test.out

#- 467 PublicReconcilePlayStationStore
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStore \
    --namespace "$AB_NAMESPACE" \
    --userId '29zE1kX6' \
    --body '{"currencyCode": "gZ1EkNUl", "price": 0.8537613165231613, "productId": "kARJrfrw", "serviceLabel": 20}' \
    > test.out 2>&1
eval_tap $? 467 'PublicReconcilePlayStationStore' test.out

#- 468 PublicReconcilePlayStationStoreWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStoreWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'nwbzYTfa' \
    --body '{"currencyCode": "keSucLLe", "price": 0.9860767975079863, "productId": "ssFRf7nC", "serviceLabels": [40, 41, 10]}' \
    > test.out 2>&1
eval_tap $? 468 'PublicReconcilePlayStationStoreWithMultipleServiceLabels' test.out

#- 469 SyncSteamInventory
./ng net.accelbyte.sdk.cli.Main platform syncSteamInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'k5BedEFy' \
    --body '{"appId": "muzBgtVt", "currencyCode": "qiWv5oyw", "language": "DjTn-To", "price": 0.6657991763502442, "productId": "lrMj7BcJ", "region": "GxDgNOVN", "steamId": "Xeyc2MH7"}' \
    > test.out 2>&1
eval_tap $? 469 'SyncSteamInventory' test.out

#- 470 SyncSteamAbnormalTransaction
./ng net.accelbyte.sdk.cli.Main platform syncSteamAbnormalTransaction \
    --namespace "$AB_NAMESPACE" \
    --userId 'o0aQXH5F' \
    > test.out 2>&1
eval_tap $? 470 'SyncSteamAbnormalTransaction' test.out

#- 471 SyncSteamIAPByTransaction
./ng net.accelbyte.sdk.cli.Main platform syncSteamIAPByTransaction \
    --namespace "$AB_NAMESPACE" \
    --userId 'r9vuxRVU' \
    --body '{"orderId": "E1AzWQMk"}' \
    > test.out 2>&1
eval_tap $? 471 'SyncSteamIAPByTransaction' test.out

#- 472 PublicQueryUserThirdPartySubscription
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserThirdPartySubscription \
    --namespace "$AB_NAMESPACE" \
    --platform 'TWITCH' \
    --userId '96WdN2wM' \
    --activeOnly  \
    --groupId 'DWT3hnaF' \
    --limit '93' \
    --offset '40' \
    --productId 'hhDCVMC3' \
    > test.out 2>&1
eval_tap $? 472 'PublicQueryUserThirdPartySubscription' test.out

#- 473 SyncTwitchDropsEntitlement1
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'hqXbI9UL' \
    --body '{"gameId": "9DfbNFQF", "language": "QjQ_483", "region": "UyxrpFiq"}' \
    > test.out 2>&1
eval_tap $? 473 'SyncTwitchDropsEntitlement1' test.out

#- 474 SyncXboxInventory
./ng net.accelbyte.sdk.cli.Main platform syncXboxInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'uk4BBn9K' \
    --body '{"currencyCode": "fbZjSAsi", "price": 0.7028626837734667, "productId": "OikTn8bU", "xstsToken": "UKLTYvlC"}' \
    > test.out 2>&1
eval_tap $? 474 'SyncXboxInventory' test.out

#- 475 PublicQueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'TNfbrMSC' \
    --discounted  \
    --itemId 'sGVBzZmb' \
    --limit '61' \
    --offset '8' \
    --status 'CHARGEBACK' \
    > test.out 2>&1
eval_tap $? 475 'PublicQueryUserOrders' test.out

#- 476 PublicCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'PGM9seeH' \
    --body '{"currencyCode": "HKiLnsH9", "discountCodes": ["TPUDk0Wt", "Mc8srIH9", "4rX221FG"], "discountedPrice": 84, "ext": {"OgAxNvjR": {}, "L5ezK3P8": {}, "7B6V3YxP": {}}, "itemId": "vsy3Ry1d", "language": "IIx-IVQs_VO", "price": 37, "quantity": 21, "region": "bORfurjo", "returnUrl": "GsYkPN93", "sectionId": "HadiXbgg"}' \
    > test.out 2>&1
eval_tap $? 476 'PublicCreateUserOrder' test.out

#- 477 PublicPreviewOrderPrice
./ng net.accelbyte.sdk.cli.Main platform publicPreviewOrderPrice \
    --namespace "$AB_NAMESPACE" \
    --userId 'AQpOe1XK' \
    --body '{"currencyCode": "nYqQ5MRk", "discountCodes": ["BXJmdQgK", "PXcXeZlx", "UlZh7hoF"], "discountedPrice": 24, "itemId": "odKGwSNx", "price": 80, "quantity": 69}' \
    > test.out 2>&1
eval_tap $? 477 'PublicPreviewOrderPrice' test.out

#- 478 PublicGetUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'phlcJxcn' \
    --userId 'Bq7INMLR' \
    > test.out 2>&1
eval_tap $? 478 'PublicGetUserOrder' test.out

#- 479 PublicCancelUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCancelUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'eAP4PkG0' \
    --userId 'bOV8Qsoj' \
    > test.out 2>&1
eval_tap $? 479 'PublicCancelUserOrder' test.out

#- 480 PublicGetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'diX0ZX3b' \
    --userId 'i3VXITHA' \
    > test.out 2>&1
eval_tap $? 480 'PublicGetUserOrderHistories' test.out

#- 481 PublicDownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform publicDownloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'IHPULepX' \
    --userId 'unX2AH7y' \
    > test.out 2>&1
eval_tap $? 481 'PublicDownloadUserOrderReceipt' test.out

#- 482 PublicGetPaymentAccounts
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'TxrmPt9G' \
    > test.out 2>&1
eval_tap $? 482 'PublicGetPaymentAccounts' test.out

#- 483 PublicDeletePaymentAccount
./ng net.accelbyte.sdk.cli.Main platform publicDeletePaymentAccount \
    --id '0tL1u4OO' \
    --namespace "$AB_NAMESPACE" \
    --type 'card' \
    --userId 'V2TjuOgJ' \
    > test.out 2>&1
eval_tap $? 483 'PublicDeletePaymentAccount' test.out

#- 484 PublicListActiveSections
./ng net.accelbyte.sdk.cli.Main platform publicListActiveSections \
    --namespace "$AB_NAMESPACE" \
    --userId '3vWh1Ggf' \
    --autoCalcEstimatedPrice  \
    --language 'KmduEwdQ' \
    --region 'OZbUihJ6' \
    --storeId 'VZASlc31' \
    --viewId 'Tq43zoaN' \
    > test.out 2>&1
eval_tap $? 484 'PublicListActiveSections' test.out

#- 485 PublicQueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId '29dnO5oK' \
    --chargeStatus 'CHARGED' \
    --itemId 'Uox74ccl' \
    --limit '70' \
    --offset '97' \
    --sku 'YSpwHgRt' \
    --status 'EXPIRED' \
    --subscribedBy 'PLATFORM' \
    > test.out 2>&1
eval_tap $? 485 'PublicQueryUserSubscriptions' test.out

#- 486 PublicSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform publicSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'oWMChTOy' \
    --body '{"currencyCode": "VlkG7oJ1", "itemId": "R3YKLFzH", "language": "Gg-428", "region": "g3lLcHMT", "returnUrl": "1E99za1P", "source": "R1zlCfSt"}' \
    > test.out 2>&1
eval_tap $? 486 'PublicSubscribeSubscription' test.out

#- 487 PublicCheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform publicCheckUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'HmFhsZBN' \
    --itemId 'Zo1U5Uoc' \
    > test.out 2>&1
eval_tap $? 487 'PublicCheckUserSubscriptionSubscribableByItemId' test.out

#- 488 PublicGetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '6QBS12ME' \
    --userId 'uqY7HM0n' \
    > test.out 2>&1
eval_tap $? 488 'PublicGetUserSubscription' test.out

#- 489 PublicChangeSubscriptionBillingAccount
./ng net.accelbyte.sdk.cli.Main platform publicChangeSubscriptionBillingAccount \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'MvrRw0Fa' \
    --userId 'BnJOS5OD' \
    > test.out 2>&1
eval_tap $? 489 'PublicChangeSubscriptionBillingAccount' test.out

#- 490 PublicCancelSubscription
./ng net.accelbyte.sdk.cli.Main platform publicCancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'ljVTHOpr' \
    --userId 'WoEdpGUs' \
    --body '{"immediate": true, "reason": "BtY9VWIF"}' \
    > test.out 2>&1
eval_tap $? 490 'PublicCancelSubscription' test.out

#- 491 PublicGetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'TgFe0AHt' \
    --userId 'hWhMdX7R' \
    --excludeFree  \
    --limit '28' \
    --offset '37' \
    > test.out 2>&1
eval_tap $? 491 'PublicGetUserSubscriptionBillingHistories' test.out

#- 492 PublicListViews
./ng net.accelbyte.sdk.cli.Main platform publicListViews \
    --namespace "$AB_NAMESPACE" \
    --userId 'Q5KWEvAo' \
    --language 'Sqy5Gb8g' \
    --storeId 'VRSNu1ca' \
    > test.out 2>&1
eval_tap $? 492 'PublicListViews' test.out

#- 493 PublicGetWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetWallet \
    --currencyCode 'GDd09gP0' \
    --namespace "$AB_NAMESPACE" \
    --userId 'fIWV4ehH' \
    > test.out 2>&1
eval_tap $? 493 'PublicGetWallet' test.out

#- 494 PublicListUserWalletTransactions
./ng net.accelbyte.sdk.cli.Main platform publicListUserWalletTransactions \
    --currencyCode '5GaXZdbo' \
    --namespace "$AB_NAMESPACE" \
    --userId 'atYRZfCA' \
    --limit '99' \
    --offset '44' \
    > test.out 2>&1
eval_tap $? 494 'PublicListUserWalletTransactions' test.out

#- 495 PublicGetMyDLCContent
./ng net.accelbyte.sdk.cli.Main platform publicGetMyDLCContent \
    --includeAllNamespaces  \
    --type 'EPICGAMES' \
    > test.out 2>&1
eval_tap $? 495 'PublicGetMyDLCContent' test.out

#- 496 QueryFulfillments
./ng net.accelbyte.sdk.cli.Main platform queryFulfillments \
    --namespace "$AB_NAMESPACE" \
    --endTime 'GfRq9Qhp' \
    --limit '83' \
    --offset '48' \
    --startTime 'CzskPdS2' \
    --state 'FULFILLED' \
    --transactionId 'lGE35yHL' \
    --userId 'KEGgROC6' \
    > test.out 2>&1
eval_tap $? 496 'QueryFulfillments' test.out

#- 497 QueryItemsV2
./ng net.accelbyte.sdk.cli.Main platform queryItemsV2 \
    --namespace "$AB_NAMESPACE" \
    --appType 'DEMO' \
    --availableDate 'ohwVLc6m' \
    --baseAppId '6F1Oj31k' \
    --categoryPath 'a6CPe2B3' \
    --features 'KGG55xa7' \
    --includeSubCategoryItem  \
    --itemName 'RIMBStl4' \
    --itemStatus 'INACTIVE' \
    --itemType 'SEASON,SEASON,INGAMEITEM' \
    --limit '16' \
    --offset '86' \
    --region '9oJqyzJx' \
    --sectionExclusive  \
    --sortBy 'name:desc,displayOrder:desc' \
    --storeId 'u3pnQhqb' \
    --tags 'gzLKoUBK' \
    --targetNamespace 'inFTmp11' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 497 'QueryItemsV2' test.out

#- 498 ImportStore1
./ng net.accelbyte.sdk.cli.Main platform importStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'SepSsJtu' \
    --strictMode  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 498 'ImportStore1' test.out

#- 499 ExportStore1
./ng net.accelbyte.sdk.cli.Main platform exportStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId '1VFgyiAf' \
    --body '{"itemIds": ["2gyUj2AM", "HezeA8EK", "zkLXFuxR"]}' \
    > test.out 2>&1
eval_tap $? 499 'ExportStore1' test.out

#- 500 FulfillRewardsV2
./ng net.accelbyte.sdk.cli.Main platform fulfillRewardsV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'TcCl7t2A' \
    --body '{"entitlementCollectionId": "dtcXEdmT", "entitlementOrigin": "Other", "metadata": {"tH23SqHv": {}, "1eXPcuVT": {}, "m3JCgDvR": {}}, "origin": "Epic", "rewards": [{"currency": {"currencyCode": "iRlLatB4", "namespace": "AUNRzrD1"}, "item": {"itemId": "Lpv2nDrU", "itemName": "WIu3WBCI", "itemSku": "pHTWemKC", "itemType": "32yAUP6b"}, "quantity": 4, "type": "ITEM"}, {"currency": {"currencyCode": "b5U6ypry", "namespace": "uKI3YzoX"}, "item": {"itemId": "VlnQR8Tr", "itemName": "6jj92D0d", "itemSku": "9MZS5OH8", "itemType": "Zw3mEP2W"}, "quantity": 61, "type": "ITEM"}, {"currency": {"currencyCode": "NzVPN1oB", "namespace": "2XeJMcMW"}, "item": {"itemId": "f94i0Pnv", "itemName": "wbMV0qvM", "itemSku": "08cyFkIN", "itemType": "P2T4sZHO"}, "quantity": 28, "type": "CURRENCY"}], "source": "CONSUME_ENTITLEMENT", "transactionId": "bQCox2nO"}' \
    > test.out 2>&1
eval_tap $? 500 'FulfillRewardsV2' test.out

#- 501 FulfillItems
eval_tap 0 501 'FulfillItems # SKIP deprecated' test.out

#- 502 RetryFulfillItems
eval_tap 0 502 'RetryFulfillItems # SKIP deprecated' test.out

#- 503 RevokeItems
eval_tap 0 503 'RevokeItems # SKIP deprecated' test.out

#- 504 V2PublicFulfillAppleIAPItem
./ng net.accelbyte.sdk.cli.Main platform v2PublicFulfillAppleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'prGBQevF' \
    --body '{"transactionId": "335msIgP"}' \
    > test.out 2>&1
eval_tap $? 504 'V2PublicFulfillAppleIAPItem' test.out

#- 505 FulfillItemsV3
./ng net.accelbyte.sdk.cli.Main platform fulfillItemsV3 \
    --namespace "$AB_NAMESPACE" \
    --transactionId 'LJBqFDq3' \
    --userId 'E9yZKSrj' \
    --body '{"items": [{"duration": 83, "endDate": "1990-12-31T00:00:00Z", "entitlementCollectionId": "vD0PYsA5", "entitlementOrigin": "Playstation", "itemId": "xKAOnXag", "itemSku": "AidwvIK3", "language": "D2z0f3Vz", "metadata": {"ik2Ec9FU": {}, "l0cwd7l7": {}, "bVLc2qzV": {}}, "orderNo": "Jyt2aKHs", "origin": "Nintendo", "quantity": 24, "region": "VjYyUZAG", "source": "REDEEM_CODE", "startDate": "1977-11-17T00:00:00Z", "storeId": "btoPQZMf"}, {"duration": 5, "endDate": "1985-06-23T00:00:00Z", "entitlementCollectionId": "cvKK8li8", "entitlementOrigin": "Other", "itemId": "l2KiAVWu", "itemSku": "igienJ9F", "language": "MeX22RJw", "metadata": {"rEDx9Ex4": {}, "78e6zc1z": {}, "3xUXCoSn": {}}, "orderNo": "SjCUjQem", "origin": "GooglePlay", "quantity": 82, "region": "r9NEHiZg", "source": "CONSUME_ENTITLEMENT", "startDate": "1988-03-04T00:00:00Z", "storeId": "kj0FD8re"}, {"duration": 34, "endDate": "1981-04-03T00:00:00Z", "entitlementCollectionId": "921KjqlA", "entitlementOrigin": "System", "itemId": "AveSuf6W", "itemSku": "fgWXSbYd", "language": "2cLydDEw", "metadata": {"VqMZFpJn": {}, "mZyuSGs7": {}, "LmrLw4QO": {}}, "orderNo": "oTuft0Aa", "origin": "System", "quantity": 42, "region": "hpxa2XdY", "source": "GIFT", "startDate": "1988-08-13T00:00:00Z", "storeId": "DSGB1Jqd"}]}' \
    > test.out 2>&1
eval_tap $? 505 'FulfillItemsV3' test.out

#- 506 RetryFulfillItemsV3
./ng net.accelbyte.sdk.cli.Main platform retryFulfillItemsV3 \
    --namespace "$AB_NAMESPACE" \
    --transactionId 't6N4apVk' \
    --userId 'VEX3uPGq' \
    > test.out 2>&1
eval_tap $? 506 'RetryFulfillItemsV3' test.out

#- 507 RevokeItemsV3
./ng net.accelbyte.sdk.cli.Main platform revokeItemsV3 \
    --namespace "$AB_NAMESPACE" \
    --transactionId 'tIJHGUsA' \
    --userId 'SvguQKSC' \
    > test.out 2>&1
eval_tap $? 507 'RevokeItemsV3' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
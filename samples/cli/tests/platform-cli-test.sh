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
echo "1..448"

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
    --id '18m582hL' \
    > test.out 2>&1
eval_tap $? 3 'GetFulfillmentScript' test.out

#- 4 CreateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform createFulfillmentScript \
    --id 'e3SzmtQK' \
    --body '{"grantDays": "NA33DN8b"}' \
    > test.out 2>&1
eval_tap $? 4 'CreateFulfillmentScript' test.out

#- 5 DeleteFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform deleteFulfillmentScript \
    --id 'ih4NCO7D' \
    > test.out 2>&1
eval_tap $? 5 'DeleteFulfillmentScript' test.out

#- 6 UpdateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform updateFulfillmentScript \
    --id 'sDdSmg85' \
    --body '{"grantDays": "KPlOCmz6"}' \
    > test.out 2>&1
eval_tap $? 6 'UpdateFulfillmentScript' test.out

#- 7 ListItemTypeConfigs
./ng net.accelbyte.sdk.cli.Main platform listItemTypeConfigs \
    > test.out 2>&1
eval_tap $? 7 'ListItemTypeConfigs' test.out

#- 8 CreateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform createItemTypeConfig \
    --body '{"clazz": "oczstBPU", "dryRun": false, "fulfillmentUrl": "iSFTep1O", "itemType": "SEASON", "purchaseConditionUrl": "nssrTmMX"}' \
    > test.out 2>&1
eval_tap $? 8 'CreateItemTypeConfig' test.out

#- 9 SearchItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform searchItemTypeConfig \
    --clazz '0Gqn6jIe' \
    --itemType 'EXTENSION' \
    > test.out 2>&1
eval_tap $? 9 'SearchItemTypeConfig' test.out

#- 10 GetItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform getItemTypeConfig \
    --id 'wZbqViga' \
    > test.out 2>&1
eval_tap $? 10 'GetItemTypeConfig' test.out

#- 11 UpdateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform updateItemTypeConfig \
    --id 'jPQQY3SE' \
    --body '{"clazz": "DTFJjHap", "dryRun": false, "fulfillmentUrl": "vnZS3fVE", "purchaseConditionUrl": "4rwXkrj2"}' \
    > test.out 2>&1
eval_tap $? 11 'UpdateItemTypeConfig' test.out

#- 12 DeleteItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform deleteItemTypeConfig \
    --id 'U4rqtqUE' \
    > test.out 2>&1
eval_tap $? 12 'DeleteItemTypeConfig' test.out

#- 13 QueryCampaigns
./ng net.accelbyte.sdk.cli.Main platform queryCampaigns \
    --namespace "$AB_NAMESPACE" \
    --limit '44' \
    --name 'Ctccxo5p' \
    --offset '5' \
    --tag 'd9zGxKfz' \
    > test.out 2>&1
eval_tap $? 13 'QueryCampaigns' test.out

#- 14 CreateCampaign
./ng net.accelbyte.sdk.cli.Main platform createCampaign \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "g6KZWsRl", "discountConfig": {"categories": [{"categoryPath": "aZoX67NW", "includeSubCategories": false}, {"categoryPath": "G7LWxRak", "includeSubCategories": true}, {"categoryPath": "pvcC4fKI", "includeSubCategories": true}], "currencyCode": "qYKOZt5x", "currencyNamespace": "yO7rjWyA", "discountAmount": 100, "discountPercentage": 54, "discountType": "PERCENTAGE", "items": [{"itemId": "VgiVdRuw", "itemName": "3odbxcOz"}, {"itemId": "M3Ws7Y4d", "itemName": "nnuNOTCS"}, {"itemId": "mQZWoEK3", "itemName": "MA6iGx57"}], "restrictType": "ITEMS_AND_CATEGORIES", "stackable": false}, "items": [{"extraSubscriptionDays": 95, "itemId": "3w08SNsm", "itemName": "KcXNScHE", "quantity": 76}, {"extraSubscriptionDays": 45, "itemId": "RqhnzEHk", "itemName": "Czb4bPUc", "quantity": 82}, {"extraSubscriptionDays": 23, "itemId": "si2TCMZV", "itemName": "G7H3uYeT", "quantity": 76}], "maxRedeemCountPerCampaignPerUser": 2, "maxRedeemCountPerCode": 39, "maxRedeemCountPerCodePerUser": 54, "maxSaleCount": 72, "name": "oFg1sgQB", "redeemEnd": "1977-07-29T00:00:00Z", "redeemStart": "1978-06-12T00:00:00Z", "redeemType": "ITEM", "status": "ACTIVE", "tags": ["PhZrNgmP", "2HkhVGWj", "MKcAkdMo"], "type": "REDEMPTION"}' \
    > test.out 2>&1
eval_tap $? 14 'CreateCampaign' test.out

#- 15 GetCampaign
./ng net.accelbyte.sdk.cli.Main platform getCampaign \
    --campaignId 'AKEMFTN3' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'GetCampaign' test.out

#- 16 UpdateCampaign
./ng net.accelbyte.sdk.cli.Main platform updateCampaign \
    --campaignId '3zB9dzXb' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "wu9kdv6N", "discountConfig": {"categories": [{"categoryPath": "j1Al9RL8", "includeSubCategories": false}, {"categoryPath": "QvYYojzV", "includeSubCategories": false}, {"categoryPath": "oaYjRNN3", "includeSubCategories": false}], "currencyCode": "X9IVW3C0", "currencyNamespace": "rUWoOnNY", "discountAmount": 90, "discountPercentage": 55, "discountType": "PERCENTAGE", "items": [{"itemId": "0mQOYiVp", "itemName": "4nseqqAF"}, {"itemId": "0m6YMsTs", "itemName": "8DXinYDd"}, {"itemId": "L5SUqUN1", "itemName": "DkLB3TPT"}], "restrictType": "ITEMS_AND_CATEGORIES", "stackable": true}, "items": [{"extraSubscriptionDays": 89, "itemId": "9ZDzlQaS", "itemName": "7JVDjwX6", "quantity": 79}, {"extraSubscriptionDays": 93, "itemId": "SJWPlTnf", "itemName": "6OoxdNKC", "quantity": 97}, {"extraSubscriptionDays": 90, "itemId": "oYiVWTcp", "itemName": "e801N3PD", "quantity": 76}], "maxRedeemCountPerCampaignPerUser": 59, "maxRedeemCountPerCode": 95, "maxRedeemCountPerCodePerUser": 35, "maxSaleCount": 53, "name": "RKSOukVt", "redeemEnd": "1995-05-13T00:00:00Z", "redeemStart": "1996-07-03T00:00:00Z", "redeemType": "ITEM", "status": "INACTIVE", "tags": ["LwGDXyOl", "fWZXLsjX", "dfQnHKkS"]}' \
    > test.out 2>&1
eval_tap $? 16 'UpdateCampaign' test.out

#- 17 GetCampaignDynamic
./ng net.accelbyte.sdk.cli.Main platform getCampaignDynamic \
    --campaignId '22KQjpYY' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'GetCampaignDynamic' test.out

#- 18 GetCatalogConfig
./ng net.accelbyte.sdk.cli.Main platform getCatalogConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'GetCatalogConfig' test.out

#- 19 UpdateCatalogConfig
./ng net.accelbyte.sdk.cli.Main platform updateCatalogConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"enableInventoryCheck": false}' \
    > test.out 2>&1
eval_tap $? 19 'UpdateCatalogConfig' test.out

#- 20 GetLootBoxPluginConfig
./ng net.accelbyte.sdk.cli.Main platform getLootBoxPluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'GetLootBoxPluginConfig' test.out

#- 21 UpdateLootBoxPluginConfig
./ng net.accelbyte.sdk.cli.Main platform updateLootBoxPluginConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appConfig": {"appName": "kk6K6rt4"}, "customConfig": {"connectionType": "INSECURE", "grpcServerAddress": "dcyVzw2R"}, "extendType": "APP"}' \
    > test.out 2>&1
eval_tap $? 21 'UpdateLootBoxPluginConfig' test.out

#- 22 DeleteLootBoxPluginConfig
./ng net.accelbyte.sdk.cli.Main platform deleteLootBoxPluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'DeleteLootBoxPluginConfig' test.out

#- 23 UplodLootBoxPluginConfigCert
./ng net.accelbyte.sdk.cli.Main platform uplodLootBoxPluginConfigCert \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 23 'UplodLootBoxPluginConfigCert' test.out

#- 24 GetLootBoxGrpcInfo
./ng net.accelbyte.sdk.cli.Main platform getLootBoxGrpcInfo \
    --namespace "$AB_NAMESPACE" \
    --force  \
    > test.out 2>&1
eval_tap $? 24 'GetLootBoxGrpcInfo' test.out

#- 25 GetSectionPluginConfig
./ng net.accelbyte.sdk.cli.Main platform getSectionPluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 25 'GetSectionPluginConfig' test.out

#- 26 UpdateSectionPluginConfig
./ng net.accelbyte.sdk.cli.Main platform updateSectionPluginConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appConfig": {"appName": "vL8EUWyg"}, "customConfig": {"connectionType": "INSECURE", "grpcServerAddress": "CwdRwP8O"}, "extendType": "CUSTOM"}' \
    > test.out 2>&1
eval_tap $? 26 'UpdateSectionPluginConfig' test.out

#- 27 DeleteSectionPluginConfig
./ng net.accelbyte.sdk.cli.Main platform deleteSectionPluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'DeleteSectionPluginConfig' test.out

#- 28 UploadSectionPluginConfigCert
./ng net.accelbyte.sdk.cli.Main platform uploadSectionPluginConfigCert \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 28 'UploadSectionPluginConfigCert' test.out

#- 29 GetRootCategories
./ng net.accelbyte.sdk.cli.Main platform getRootCategories \
    --namespace "$AB_NAMESPACE" \
    --storeId 'NQJ46KDM' \
    > test.out 2>&1
eval_tap $? 29 'GetRootCategories' test.out

#- 30 CreateCategory
./ng net.accelbyte.sdk.cli.Main platform createCategory \
    --namespace "$AB_NAMESPACE" \
    --storeId 'p69Tw2vE' \
    --body '{"categoryPath": "1epivxwf", "localizationDisplayNames": {"JSG5lqBh": "vH3XUcQ0", "DCakNApA": "dxk1sxvY", "tpsYIZaQ": "YC9UPIYj"}}' \
    > test.out 2>&1
eval_tap $? 30 'CreateCategory' test.out

#- 31 ListCategoriesBasic
./ng net.accelbyte.sdk.cli.Main platform listCategoriesBasic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ZQ997EeV' \
    > test.out 2>&1
eval_tap $? 31 'ListCategoriesBasic' test.out

#- 32 GetCategory
./ng net.accelbyte.sdk.cli.Main platform getCategory \
    --categoryPath 'I8qTfhyT' \
    --namespace "$AB_NAMESPACE" \
    --storeId '97IOJxr1' \
    > test.out 2>&1
eval_tap $? 32 'GetCategory' test.out

#- 33 UpdateCategory
./ng net.accelbyte.sdk.cli.Main platform updateCategory \
    --categoryPath '9uNR4NFW' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'taGCK87E' \
    --body '{"localizationDisplayNames": {"OmcMy9bk": "f8GITmsr", "I4TePe2v": "JtiLYuUa", "jZ1ntDoq": "80OVcAo7"}}' \
    > test.out 2>&1
eval_tap $? 33 'UpdateCategory' test.out

#- 34 DeleteCategory
./ng net.accelbyte.sdk.cli.Main platform deleteCategory \
    --categoryPath 'XOVKu6eN' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'v85HWRco' \
    > test.out 2>&1
eval_tap $? 34 'DeleteCategory' test.out

#- 35 GetChildCategories
./ng net.accelbyte.sdk.cli.Main platform getChildCategories \
    --categoryPath 'nQ2YnrPZ' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'c3IDaUR6' \
    > test.out 2>&1
eval_tap $? 35 'GetChildCategories' test.out

#- 36 GetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform getDescendantCategories \
    --categoryPath 'T9iKzTbB' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'zBShnJAx' \
    > test.out 2>&1
eval_tap $? 36 'GetDescendantCategories' test.out

#- 37 QueryCodes
./ng net.accelbyte.sdk.cli.Main platform queryCodes \
    --campaignId 'g5tdRdrd' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --batchNo '60' \
    --code 'Rwk8VNNN' \
    --limit '58' \
    --offset '25' \
    > test.out 2>&1
eval_tap $? 37 'QueryCodes' test.out

#- 38 CreateCodes
./ng net.accelbyte.sdk.cli.Main platform createCodes \
    --campaignId 'Lugdu9SF' \
    --namespace "$AB_NAMESPACE" \
    --body '{"codeValue": "JI5w0CVy", "quantity": 86}' \
    > test.out 2>&1
eval_tap $? 38 'CreateCodes' test.out

#- 39 Download
./ng net.accelbyte.sdk.cli.Main platform download \
    --campaignId '772LfFrB' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '71' \
    > test.out 2>&1
eval_tap $? 39 'Download' test.out

#- 40 BulkDisableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkDisableCodes \
    --campaignId 'MPXHVsIG' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '90' \
    > test.out 2>&1
eval_tap $? 40 'BulkDisableCodes' test.out

#- 41 BulkEnableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkEnableCodes \
    --campaignId '1DpFESps' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '97' \
    > test.out 2>&1
eval_tap $? 41 'BulkEnableCodes' test.out

#- 42 QueryRedeemHistory
./ng net.accelbyte.sdk.cli.Main platform queryRedeemHistory \
    --campaignId 'nGUHo7nw' \
    --namespace "$AB_NAMESPACE" \
    --code 'F0yc2VWO' \
    --limit '17' \
    --offset '69' \
    --userId 'lJEXRZOh' \
    > test.out 2>&1
eval_tap $? 42 'QueryRedeemHistory' test.out

#- 43 GetCode
./ng net.accelbyte.sdk.cli.Main platform getCode \
    --code 'F3v5O2qp' \
    --namespace "$AB_NAMESPACE" \
    --redeemable  \
    > test.out 2>&1
eval_tap $? 43 'GetCode' test.out

#- 44 DisableCode
./ng net.accelbyte.sdk.cli.Main platform disableCode \
    --code 'l7gFJZ0X' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 44 'DisableCode' test.out

#- 45 EnableCode
./ng net.accelbyte.sdk.cli.Main platform enableCode \
    --code 'p77IKPip' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 45 'EnableCode' test.out

#- 46 GetServicePluginConfig
eval_tap 0 46 'GetServicePluginConfig # SKIP deprecated' test.out

#- 47 UpdateServicePluginConfig
eval_tap 0 47 'UpdateServicePluginConfig # SKIP deprecated' test.out

#- 48 DeleteServicePluginConfig
eval_tap 0 48 'DeleteServicePluginConfig # SKIP deprecated' test.out

#- 49 ListCurrencies
./ng net.accelbyte.sdk.cli.Main platform listCurrencies \
    --namespace "$AB_NAMESPACE" \
    --currencyType 'VIRTUAL' \
    > test.out 2>&1
eval_tap $? 49 'ListCurrencies' test.out

#- 50 CreateCurrency
./ng net.accelbyte.sdk.cli.Main platform createCurrency \
    --namespace "$AB_NAMESPACE" \
    --body '{"currencyCode": "ebQRxBb6", "currencySymbol": "DU5cLosm", "currencyType": "VIRTUAL", "decimals": 75, "localizationDescriptions": {"yOMMLFT7": "Ly9eXGe1", "VO7v5pFU": "NQSCIsle", "wh0cEACo": "hYfumuxP"}}' \
    > test.out 2>&1
eval_tap $? 50 'CreateCurrency' test.out

#- 51 UpdateCurrency
./ng net.accelbyte.sdk.cli.Main platform updateCurrency \
    --currencyCode '6txG2a4N' \
    --namespace "$AB_NAMESPACE" \
    --body '{"localizationDescriptions": {"7vLobMcp": "E7VFJkCD", "5PAvQP6G": "6G7t6OZk", "1Gm3KaRi": "6OgLOCZs"}}' \
    > test.out 2>&1
eval_tap $? 51 'UpdateCurrency' test.out

#- 52 DeleteCurrency
./ng net.accelbyte.sdk.cli.Main platform deleteCurrency \
    --currencyCode 'zW34JE7N' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 52 'DeleteCurrency' test.out

#- 53 GetCurrencyConfig
./ng net.accelbyte.sdk.cli.Main platform getCurrencyConfig \
    --currencyCode 'VAtGMyX3' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 53 'GetCurrencyConfig' test.out

#- 54 GetCurrencySummary
./ng net.accelbyte.sdk.cli.Main platform getCurrencySummary \
    --currencyCode 'YqPItMnk' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 54 'GetCurrencySummary' test.out

#- 55 GetDLCItemConfig
./ng net.accelbyte.sdk.cli.Main platform getDLCItemConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 55 'GetDLCItemConfig' test.out

#- 56 UpdateDLCItemConfig
./ng net.accelbyte.sdk.cli.Main platform updateDLCItemConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"id": "4mUEoAcy", "rewards": [{"currency": {"currencyCode": "Rj7TJqJU", "namespace": "EoGalXpb"}, "item": {"itemId": "Z2LH4Vxb", "itemSku": "cMARPrsM", "itemType": "dxsRYsyz"}, "quantity": 18, "type": "CURRENCY"}, {"currency": {"currencyCode": "sGsxVntz", "namespace": "xfhSPDgP"}, "item": {"itemId": "w63o05H4", "itemSku": "CMxcF3Aq", "itemType": "R1A7qCSu"}, "quantity": 48, "type": "CURRENCY"}, {"currency": {"currencyCode": "RSWx0qfb", "namespace": "QiK3LuZh"}, "item": {"itemId": "jqxNv6vf", "itemSku": "VMuf00V9", "itemType": "e2huc1B6"}, "quantity": 7, "type": "ITEM"}]}, {"id": "n4I9dobZ", "rewards": [{"currency": {"currencyCode": "NclIz7pc", "namespace": "UWQldAvd"}, "item": {"itemId": "CYdfqves", "itemSku": "66jZKlkJ", "itemType": "zpWjeTLJ"}, "quantity": 80, "type": "CURRENCY"}, {"currency": {"currencyCode": "KVRSomrX", "namespace": "W34Jqo3W"}, "item": {"itemId": "wbeeuAh0", "itemSku": "wSzDWhGg", "itemType": "ogJfx1kR"}, "quantity": 70, "type": "ITEM"}, {"currency": {"currencyCode": "BJoeA8rF", "namespace": "LCgSVOkB"}, "item": {"itemId": "fL8ztdA1", "itemSku": "wnExVthr", "itemType": "hoREgbJX"}, "quantity": 13, "type": "ITEM"}]}, {"id": "ZwaKJ6Sr", "rewards": [{"currency": {"currencyCode": "fYugh4P3", "namespace": "zXYrKD3F"}, "item": {"itemId": "qDURr8rX", "itemSku": "TzLo9UDN", "itemType": "T1q4VwsF"}, "quantity": 29, "type": "ITEM"}, {"currency": {"currencyCode": "CjJkvquS", "namespace": "LfVqR8vx"}, "item": {"itemId": "CGQv10ZM", "itemSku": "xeFX06EO", "itemType": "MitRjkiX"}, "quantity": 59, "type": "CURRENCY"}, {"currency": {"currencyCode": "2QgTeQuw", "namespace": "c0fsNqLZ"}, "item": {"itemId": "T6eQU9su", "itemSku": "3VeucsxG", "itemType": "Jg7c96Ou"}, "quantity": 56, "type": "CURRENCY"}]}]}' \
    > test.out 2>&1
eval_tap $? 56 'UpdateDLCItemConfig' test.out

#- 57 DeleteDLCItemConfig
./ng net.accelbyte.sdk.cli.Main platform deleteDLCItemConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 57 'DeleteDLCItemConfig' test.out

#- 58 GetPlatformDLCConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformDLCConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 58 'GetPlatformDLCConfig' test.out

#- 59 UpdatePlatformDLCConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformDLCConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"platform": "STEAM", "platformDlcIdMap": {"FX9fRyn8": "3BRJchlm", "TFKM8jy6": "3ZiHIMfS", "d9kNMNOI": "q03uugXT"}}, {"platform": "XBOX", "platformDlcIdMap": {"o3Sf8JPH": "y0UtF88R", "kETXybd0": "xKWk8qsP", "7Ytk5MLL": "wEYnD1AP"}}, {"platform": "PSN", "platformDlcIdMap": {"jfZS6LzP": "4ofedDx4", "Zs1uq44k": "yuG1fJtD", "woJB4gVr": "AWAeZgpi"}}]}' \
    > test.out 2>&1
eval_tap $? 59 'UpdatePlatformDLCConfig' test.out

#- 60 DeletePlatformDLCConfig
./ng net.accelbyte.sdk.cli.Main platform deletePlatformDLCConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 60 'DeletePlatformDLCConfig' test.out

#- 61 QueryEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryEntitlements \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --appType 'SOFTWARE' \
    --entitlementClazz 'APP' \
    --entitlementName 'oTbi4B30' \
    --itemId 'KitHRqF0,I1y0K35b,hgCUxA3Q' \
    --limit '34' \
    --offset '17' \
    --origin 'Playstation' \
    --userId 'kdKeX0SV' \
    > test.out 2>&1
eval_tap $? 61 'QueryEntitlements' test.out

#- 62 QueryEntitlements1
./ng net.accelbyte.sdk.cli.Main platform queryEntitlements1 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemIds 'OgJQLGku,95V1Hyfu,cfq9SM3o' \
    --limit '8' \
    --offset '27' \
    > test.out 2>&1
eval_tap $? 62 'QueryEntitlements1' test.out

#- 63 EnableEntitlementOriginFeature
./ng net.accelbyte.sdk.cli.Main platform enableEntitlementOriginFeature \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 63 'EnableEntitlementOriginFeature' test.out

#- 64 GetEntitlementConfigInfo
./ng net.accelbyte.sdk.cli.Main platform getEntitlementConfigInfo \
    --namespace "$AB_NAMESPACE" \
    --withoutCache  \
    > test.out 2>&1
eval_tap $? 64 'GetEntitlementConfigInfo' test.out

#- 65 GrantEntitlements
./ng net.accelbyte.sdk.cli.Main platform grantEntitlements \
    --namespace "$AB_NAMESPACE" \
    --body '{"entitlementGrantList": [{"collectionId": "vFEZGU5y", "endDate": "1983-05-24T00:00:00Z", "grantedCode": "FXLlmQ45", "itemId": "KcqG012O", "itemNamespace": "th8oaOJb", "language": "yHF-HWKn", "origin": "Steam", "quantity": 35, "region": "OqduCIiq", "source": "ACHIEVEMENT", "startDate": "1989-06-14T00:00:00Z", "storeId": "oLSm6X3P"}, {"collectionId": "r0ajRTVw", "endDate": "1998-05-18T00:00:00Z", "grantedCode": "iOUZDdQ0", "itemId": "9WhiUd9a", "itemNamespace": "6BdbvaEb", "language": "BA-469", "origin": "Steam", "quantity": 46, "region": "ot8EAbxS", "source": "GIFT", "startDate": "1994-04-10T00:00:00Z", "storeId": "Sje7LiDR"}, {"collectionId": "rYAQNvtl", "endDate": "1976-06-10T00:00:00Z", "grantedCode": "DvKqcIlu", "itemId": "g1Z80iXr", "itemNamespace": "KrQ1m14f", "language": "QMg-713", "origin": "System", "quantity": 71, "region": "6SdnjU8W", "source": "REDEEM_CODE", "startDate": "1980-05-30T00:00:00Z", "storeId": "5FWTf2ki"}], "userIds": ["G5Bl2HKV", "W5arlXyO", "nKWPcT6Z"]}' \
    > test.out 2>&1
eval_tap $? 65 'GrantEntitlements' test.out

#- 66 RevokeEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeEntitlements \
    --namespace "$AB_NAMESPACE" \
    --body '["ab5RSlLS", "GRAWvTBP", "T80J5r45"]' \
    > test.out 2>&1
eval_tap $? 66 'RevokeEntitlements' test.out

#- 67 GetEntitlement
./ng net.accelbyte.sdk.cli.Main platform getEntitlement \
    --entitlementId 'dxnWwuX2' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 67 'GetEntitlement' test.out

#- 68 QueryFulfillmentHistories
./ng net.accelbyte.sdk.cli.Main platform queryFulfillmentHistories \
    --namespace "$AB_NAMESPACE" \
    --limit '19' \
    --offset '30' \
    --status 'FAIL' \
    --userId '3YInK0cT' \
    > test.out 2>&1
eval_tap $? 68 'QueryFulfillmentHistories' test.out

#- 69 QueryIAPClawbackHistory
./ng net.accelbyte.sdk.cli.Main platform queryIAPClawbackHistory \
    --namespace "$AB_NAMESPACE" \
    --endTime 'oJ0ZhiJJ' \
    --eventType 'CHARGEBACK_REVERSED' \
    --externalOrderId 'XuhurQNu' \
    --limit '84' \
    --offset '86' \
    --startTime '5nLkPLcF' \
    --status 'IGNORED' \
    --userId 'Vnf0zpc9' \
    > test.out 2>&1
eval_tap $? 69 'QueryIAPClawbackHistory' test.out

#- 70 MockPlayStationStreamEvent
./ng net.accelbyte.sdk.cli.Main platform mockPlayStationStreamEvent \
    --namespace "$AB_NAMESPACE" \
    --body '{"body": {"account": "rAzzOTiS", "additionalData": {"entitlement": [{"clientTransaction": [{"amountConsumed": 72, "clientTransactionId": "sBgDmwn5"}, {"amountConsumed": 88, "clientTransactionId": "WYse2Fci"}, {"amountConsumed": 8, "clientTransactionId": "VVuiqUnS"}], "entitlementId": "BIF0o9i8", "usageCount": 4}, {"clientTransaction": [{"amountConsumed": 41, "clientTransactionId": "xRD1R4kF"}, {"amountConsumed": 9, "clientTransactionId": "Ao3c1slM"}, {"amountConsumed": 42, "clientTransactionId": "hfuNKNQP"}], "entitlementId": "AghMCCYC", "usageCount": 21}, {"clientTransaction": [{"amountConsumed": 34, "clientTransactionId": "lKixfU8V"}, {"amountConsumed": 91, "clientTransactionId": "iNcghpMF"}, {"amountConsumed": 99, "clientTransactionId": "x6yYjNio"}], "entitlementId": "QJ6SYgOJ", "usageCount": 22}], "purpose": "TMfsjkSH"}, "originalTitleName": "hoimxmyV", "paymentProductSKU": "iuhhxhej", "purchaseDate": "H7spvsdk", "sourceOrderItemId": "wG9118Z9", "titleName": "NNlN3PN8"}, "eventDomain": "KBoK1Yci", "eventSource": "oqElnXMq", "eventType": "2mEJrgX3", "eventVersion": 25, "id": "Lp2uAk9u", "timestamp": "tRcMVB7z"}' \
    > test.out 2>&1
eval_tap $? 70 'MockPlayStationStreamEvent' test.out

#- 71 GetAppleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getAppleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 71 'GetAppleIAPConfig' test.out

#- 72 UpdateAppleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateAppleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"bundleId": "3XTMz3Zw", "password": "8PiPgcdl"}' \
    > test.out 2>&1
eval_tap $? 72 'UpdateAppleIAPConfig' test.out

#- 73 DeleteAppleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteAppleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 73 'DeleteAppleIAPConfig' test.out

#- 74 GetEpicGamesIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getEpicGamesIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 74 'GetEpicGamesIAPConfig' test.out

#- 75 UpdateEpicGamesIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateEpicGamesIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"sandboxId": "0HJnA9YF"}' \
    > test.out 2>&1
eval_tap $? 75 'UpdateEpicGamesIAPConfig' test.out

#- 76 DeleteEpicGamesIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteEpicGamesIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 76 'DeleteEpicGamesIAPConfig' test.out

#- 77 GetGoogleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getGoogleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 77 'GetGoogleIAPConfig' test.out

#- 78 UpdateGoogleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateGoogleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"applicationName": "Uctt7moX", "serviceAccountId": "Z8WGsTOI"}' \
    > test.out 2>&1
eval_tap $? 78 'UpdateGoogleIAPConfig' test.out

#- 79 DeleteGoogleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteGoogleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 79 'DeleteGoogleIAPConfig' test.out

#- 80 UpdateGoogleP12File
./ng net.accelbyte.sdk.cli.Main platform updateGoogleP12File \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 80 'UpdateGoogleP12File' test.out

#- 81 GetIAPItemConfig
./ng net.accelbyte.sdk.cli.Main platform getIAPItemConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 81 'GetIAPItemConfig' test.out

#- 82 UpdateIAPItemConfig
./ng net.accelbyte.sdk.cli.Main platform updateIAPItemConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"itemIdentity": "cONqX3LM", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"xIeF1Tjw": "w6JmX1BP", "147lcVCd": "0zMciUE8", "stq66qsH": "5bVmOdnT"}}, {"itemIdentity": "gWusJ4gJ", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"iyPBhGMe": "YjzsoGYD", "A5SucjY1": "CvKzL7Gh", "5ojiOnLT": "CzE4EmnM"}}, {"itemIdentity": "BJNtvikc", "itemIdentityType": "ITEM_ID", "platformProductIdMap": {"xm5IZlFY": "M7lIBQ9d", "D024541P": "b4bnhLa2", "axHYNrMf": "DLN5ElCA"}}]}' \
    > test.out 2>&1
eval_tap $? 82 'UpdateIAPItemConfig' test.out

#- 83 DeleteIAPItemConfig
./ng net.accelbyte.sdk.cli.Main platform deleteIAPItemConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 83 'DeleteIAPItemConfig' test.out

#- 84 GetOculusIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getOculusIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 84 'GetOculusIAPConfig' test.out

#- 85 UpdateOculusIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateOculusIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appId": "MxPtWAJ0", "appSecret": "rdnCZRDv"}' \
    > test.out 2>&1
eval_tap $? 85 'UpdateOculusIAPConfig' test.out

#- 86 DeleteOculusIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteOculusIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 86 'DeleteOculusIAPConfig' test.out

#- 87 GetPlayStationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getPlayStationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 87 'GetPlayStationIAPConfig' test.out

#- 88 UpdatePlaystationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlaystationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"backOfficeServerClientId": "FjVug078", "backOfficeServerClientSecret": "qnqS07T3", "enableStreamJob": true, "environment": "0E2h0YU2", "streamName": "wdsl71Mc", "streamPartnerName": "Uaqkutrj"}' \
    > test.out 2>&1
eval_tap $? 88 'UpdatePlaystationIAPConfig' test.out

#- 89 DeletePlaystationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deletePlaystationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 89 'DeletePlaystationIAPConfig' test.out

#- 90 ValidateExistedPlaystationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform validateExistedPlaystationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 90 'ValidateExistedPlaystationIAPConfig' test.out

#- 91 ValidatePlaystationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform validatePlaystationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"backOfficeServerClientId": "7GUOjb8Z", "backOfficeServerClientSecret": "JpqENlOQ", "enableStreamJob": false, "environment": "L5VrAYcG", "streamName": "e1pddO7P", "streamPartnerName": "SbnKAV7k"}' \
    > test.out 2>&1
eval_tap $? 91 'ValidatePlaystationIAPConfig' test.out

#- 92 GetSteamIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getSteamIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 92 'GetSteamIAPConfig' test.out

#- 93 UpdateSteamIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateSteamIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appId": "e7Eipchf", "publisherAuthenticationKey": "Xn7hDFkZ"}' \
    > test.out 2>&1
eval_tap $? 93 'UpdateSteamIAPConfig' test.out

#- 94 DeleteSteamIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteSteamIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 94 'DeleteSteamIAPConfig' test.out

#- 95 GetTwitchIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getTwitchIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 95 'GetTwitchIAPConfig' test.out

#- 96 UpdateTwitchIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateTwitchIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientId": "rHh8I1SG", "clientSecret": "2TfO9wEm", "organizationId": "Qn4UvtzV"}' \
    > test.out 2>&1
eval_tap $? 96 'UpdateTwitchIAPConfig' test.out

#- 97 DeleteTwitchIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteTwitchIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 97 'DeleteTwitchIAPConfig' test.out

#- 98 GetXblIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getXblIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 98 'GetXblIAPConfig' test.out

#- 99 UpdateXblIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateXblIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"relyingPartyCert": "QP5CBceQ"}' \
    > test.out 2>&1
eval_tap $? 99 'UpdateXblIAPConfig' test.out

#- 100 DeleteXblAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteXblAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 100 'DeleteXblAPConfig' test.out

#- 101 UpdateXblBPCertFile
./ng net.accelbyte.sdk.cli.Main platform updateXblBPCertFile \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    --password 'JYHJpOQb' \
    > test.out 2>&1
eval_tap $? 101 'UpdateXblBPCertFile' test.out

#- 102 DownloadInvoiceDetails
./ng net.accelbyte.sdk.cli.Main platform downloadInvoiceDetails \
    --namespace "$AB_NAMESPACE" \
    --feature 'WsTNLKb6' \
    --itemId 'WLyJ7lmV' \
    --itemType 'MEDIA' \
    --endTime '7yo6X7Z6' \
    --startTime 'm8Dwld86' \
    > test.out 2>&1
eval_tap $? 102 'DownloadInvoiceDetails' test.out

#- 103 GenerateInvoiceSummary
./ng net.accelbyte.sdk.cli.Main platform generateInvoiceSummary \
    --namespace "$AB_NAMESPACE" \
    --feature 'nwaLMXnF' \
    --itemId '0644A4FK' \
    --itemType 'MEDIA' \
    --endTime 'Eq6mVOQc' \
    --startTime 'SVH64QC1' \
    > test.out 2>&1
eval_tap $? 103 'GenerateInvoiceSummary' test.out

#- 104 SyncInGameItem
./ng net.accelbyte.sdk.cli.Main platform syncInGameItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'CGgAjwCq' \
    --body '{"categoryPath": "dbtQ2y28", "targetItemId": "DKjwGJE2", "targetNamespace": "ziQrqEIS"}' \
    > test.out 2>&1
eval_tap $? 104 'SyncInGameItem' test.out

#- 105 CreateItem
./ng net.accelbyte.sdk.cli.Main platform createItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Z0487b87' \
    --body '{"appId": "6F8yuqmg", "appType": "DLC", "baseAppId": "U71b8u8w", "boothName": "yLZMqIt1", "categoryPath": "XTuoikbv", "clazz": "mPUqRXOg", "displayOrder": 35, "entitlementType": "DURABLE", "ext": {"LtXXWGFX": {}, "GFP0n75q": {}, "rzDD8WYc": {}}, "features": ["4aENEHJm", "kaYPuinN", "K3zlSv3D"], "flexible": true, "images": [{"as": "GlmzJFVw", "caption": "h27EEKkZ", "height": 86, "imageUrl": "aqGHfXAL", "smallImageUrl": "wpDTyjWW", "width": 50}, {"as": "4j0PjtsX", "caption": "Beh0RncV", "height": 75, "imageUrl": "UskB2kyf", "smallImageUrl": "1mqAj1DA", "width": 92}, {"as": "k5xOdUGX", "caption": "Nys3kB7a", "height": 19, "imageUrl": "E7sKtyRg", "smallImageUrl": "NV0w3CIl", "width": 13}], "inventoryConfig": {"customAttributes": {"qrbvuL9n": {}, "JKYKzbMW": {}, "6p59JFNC": {}}, "serverCustomAttributes": {"PkEwo9BL": {}, "d5pAyASc": {}, "qLfk9o8k": {}}, "slotUsed": 53}, "itemIds": ["gm50WFrR", "Yws1kgvB", "pXpcAyS9"], "itemQty": {"EQROS8VQ": 79, "KZQurtQc": 59, "zOGK1OaN": 16}, "itemType": "MEDIA", "listable": true, "localizations": {"KvE9Z6Mw": {"description": "LAHPE2ux", "localExt": {"XY0iE8qU": {}, "V45vusyt": {}, "sFKUG5rp": {}}, "longDescription": "CotcEldY", "title": "FjiYACbb"}, "kaIpsmcB": {"description": "E8h0NT7I", "localExt": {"gjNP2oed": {}, "wA6GuXBc": {}, "Yrmwtas0": {}}, "longDescription": "vmtD7aUt", "title": "dwi5din0"}, "POP9ygAx": {"description": "WD4fPDiJ", "localExt": {"XR4w1KtI": {}, "E7W6WYWr": {}, "O3GblHrt": {}}, "longDescription": "b6K2U7dq", "title": "I3WZprC9"}}, "lootBoxConfig": {"rewardCount": 87, "rewards": [{"lootBoxItems": [{"count": 35, "duration": 1, "endDate": "1978-04-15T00:00:00Z", "itemId": "wJLrUpwp", "itemSku": "Ywj8zkaV", "itemType": "bOuNIYAw"}, {"count": 9, "duration": 37, "endDate": "1980-11-11T00:00:00Z", "itemId": "1hiz0uYp", "itemSku": "gjIgbR7J", "itemType": "hlqMVoE9"}, {"count": 81, "duration": 9, "endDate": "1974-08-06T00:00:00Z", "itemId": "PQzRoy1C", "itemSku": "tz66XZTv", "itemType": "DxiyCeuS"}], "name": "ZoQTmLW3", "odds": 0.0651214633412237, "type": "PROBABILITY_GROUP", "weight": 90}, {"lootBoxItems": [{"count": 52, "duration": 89, "endDate": "1985-10-28T00:00:00Z", "itemId": "4IxG9A2v", "itemSku": "vbyL7vN7", "itemType": "by7dDIWU"}, {"count": 33, "duration": 72, "endDate": "1978-02-11T00:00:00Z", "itemId": "GRZFmPRg", "itemSku": "wjqzz2nH", "itemType": "lFipizQK"}, {"count": 54, "duration": 4, "endDate": "1979-04-11T00:00:00Z", "itemId": "nsG6s8a2", "itemSku": "9zJfociT", "itemType": "CuNtX0wB"}], "name": "IuzflRGz", "odds": 0.9196139611316507, "type": "REWARD_GROUP", "weight": 64}, {"lootBoxItems": [{"count": 20, "duration": 22, "endDate": "1992-08-31T00:00:00Z", "itemId": "TGjC5GpA", "itemSku": "zF4WiwiF", "itemType": "pOOKT1O3"}, {"count": 51, "duration": 93, "endDate": "1985-04-24T00:00:00Z", "itemId": "cPNRMT2U", "itemSku": "A1p7CIRC", "itemType": "5i53HLUH"}, {"count": 26, "duration": 72, "endDate": "1988-01-05T00:00:00Z", "itemId": "SYEPBEyO", "itemSku": "S7UlxQWY", "itemType": "dOfxY9oJ"}], "name": "Zukm0AO8", "odds": 0.5750654283341602, "type": "PROBABILITY_GROUP", "weight": 15}], "rollFunction": "DEFAULT"}, "maxCount": 65, "maxCountPerUser": 14, "name": "QBEHfnhf", "optionBoxConfig": {"boxItems": [{"count": 54, "duration": 79, "endDate": "1995-05-20T00:00:00Z", "itemId": "7b5eYK9s", "itemSku": "iP4VkpWd", "itemType": "B3cQXEND"}, {"count": 93, "duration": 40, "endDate": "1985-06-28T00:00:00Z", "itemId": "YNuBFuNr", "itemSku": "QXfeRJP3", "itemType": "1VW5CjAF"}, {"count": 79, "duration": 58, "endDate": "1990-09-24T00:00:00Z", "itemId": "n1O26mNl", "itemSku": "2q4l501B", "itemType": "mXI5gR1R"}]}, "purchasable": false, "recurring": {"cycle": "WEEKLY", "fixedFreeDays": 29, "fixedTrialCycles": 96, "graceDays": 63}, "regionData": {"JpTUG2oZ": [{"currencyCode": "6JIakHIX", "currencyNamespace": "yWzoMVFA", "currencyType": "VIRTUAL", "discountAmount": 85, "discountExpireAt": "1989-12-05T00:00:00Z", "discountPercentage": 1, "discountPurchaseAt": "1990-08-23T00:00:00Z", "expireAt": "1977-07-03T00:00:00Z", "price": 26, "purchaseAt": "1974-01-08T00:00:00Z", "trialPrice": 89}, {"currencyCode": "me64GJDf", "currencyNamespace": "bhTsfbVH", "currencyType": "REAL", "discountAmount": 5, "discountExpireAt": "1996-11-26T00:00:00Z", "discountPercentage": 24, "discountPurchaseAt": "1990-06-20T00:00:00Z", "expireAt": "1979-02-17T00:00:00Z", "price": 61, "purchaseAt": "1974-05-22T00:00:00Z", "trialPrice": 7}, {"currencyCode": "kXI7Wl6Z", "currencyNamespace": "JETcJiga", "currencyType": "VIRTUAL", "discountAmount": 0, "discountExpireAt": "1996-07-18T00:00:00Z", "discountPercentage": 62, "discountPurchaseAt": "1987-05-27T00:00:00Z", "expireAt": "1992-11-25T00:00:00Z", "price": 6, "purchaseAt": "1981-11-01T00:00:00Z", "trialPrice": 69}], "NI5TU27C": [{"currencyCode": "KbtBACHu", "currencyNamespace": "XYrHlsNW", "currencyType": "VIRTUAL", "discountAmount": 86, "discountExpireAt": "1987-02-10T00:00:00Z", "discountPercentage": 99, "discountPurchaseAt": "1981-03-05T00:00:00Z", "expireAt": "1986-03-02T00:00:00Z", "price": 52, "purchaseAt": "1996-10-22T00:00:00Z", "trialPrice": 62}, {"currencyCode": "c2DAzAuS", "currencyNamespace": "B8ZQUkqH", "currencyType": "VIRTUAL", "discountAmount": 80, "discountExpireAt": "1981-04-19T00:00:00Z", "discountPercentage": 5, "discountPurchaseAt": "1981-04-03T00:00:00Z", "expireAt": "1974-01-24T00:00:00Z", "price": 70, "purchaseAt": "1977-03-20T00:00:00Z", "trialPrice": 51}, {"currencyCode": "4P0Sci1d", "currencyNamespace": "63YRy0a6", "currencyType": "VIRTUAL", "discountAmount": 24, "discountExpireAt": "1974-12-27T00:00:00Z", "discountPercentage": 24, "discountPurchaseAt": "1973-10-21T00:00:00Z", "expireAt": "1972-03-25T00:00:00Z", "price": 97, "purchaseAt": "1979-12-12T00:00:00Z", "trialPrice": 26}], "S2m4RqM2": [{"currencyCode": "9ePBNcTf", "currencyNamespace": "VvhgO8mY", "currencyType": "REAL", "discountAmount": 89, "discountExpireAt": "1983-08-21T00:00:00Z", "discountPercentage": 19, "discountPurchaseAt": "1980-07-12T00:00:00Z", "expireAt": "1984-06-03T00:00:00Z", "price": 82, "purchaseAt": "1993-05-12T00:00:00Z", "trialPrice": 11}, {"currencyCode": "mWu1TuNS", "currencyNamespace": "QTolI1e8", "currencyType": "VIRTUAL", "discountAmount": 72, "discountExpireAt": "1978-02-08T00:00:00Z", "discountPercentage": 84, "discountPurchaseAt": "1997-04-01T00:00:00Z", "expireAt": "1982-06-10T00:00:00Z", "price": 96, "purchaseAt": "1984-10-02T00:00:00Z", "trialPrice": 25}, {"currencyCode": "XwmUofod", "currencyNamespace": "bgbRWoYV", "currencyType": "VIRTUAL", "discountAmount": 15, "discountExpireAt": "1987-11-24T00:00:00Z", "discountPercentage": 73, "discountPurchaseAt": "1993-09-10T00:00:00Z", "expireAt": "1983-04-05T00:00:00Z", "price": 11, "purchaseAt": "1993-10-02T00:00:00Z", "trialPrice": 78}]}, "saleConfig": {"currencyCode": "pYt5udZ4", "price": 94}, "seasonType": "PASS", "sectionExclusive": true, "sellable": false, "sku": "7Kmg3oxV", "stackable": false, "status": "INACTIVE", "tags": ["ptOQxTWH", "bUm6k9lC", "TPVoMhnj"], "targetCurrencyCode": "R8zPCT3U", "targetNamespace": "yzAPN77p", "thumbnailUrl": "sxbdLEC7", "useCount": 53}' \
    > test.out 2>&1
eval_tap $? 105 'CreateItem' test.out

#- 106 GetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform getItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'sB4by2zd' \
    --appId 'k5zQAs2p' \
    > test.out 2>&1
eval_tap $? 106 'GetItemByAppId' test.out

#- 107 QueryItems
./ng net.accelbyte.sdk.cli.Main platform queryItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --appType 'SOFTWARE' \
    --availableDate 'UUDg1Vf7' \
    --baseAppId 'T9uGPvcx' \
    --categoryPath 'h8t9ruX1' \
    --features 'ONTXspfn' \
    --includeSubCategoryItem  \
    --itemType 'COINS' \
    --limit '40' \
    --offset '55' \
    --region 'q54YuhV4' \
    --sortBy 'createdAt:asc,displayOrder:asc,updatedAt:asc' \
    --storeId '50h7vTNT' \
    --tags 'VeEdxhKm' \
    --targetNamespace 'lDCRIZIi' \
    > test.out 2>&1
eval_tap $? 107 'QueryItems' test.out

#- 108 ListBasicItemsByFeatures
./ng net.accelbyte.sdk.cli.Main platform listBasicItemsByFeatures \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --features 'nqfGbwDA,BPzC9APP,n5b6DLGI' \
    > test.out 2>&1
eval_tap $? 108 'ListBasicItemsByFeatures' test.out

#- 109 GetItems
./ng net.accelbyte.sdk.cli.Main platform getItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'txRE5vVT' \
    --itemIds '6GZVEQDP' \
    > test.out 2>&1
eval_tap $? 109 'GetItems' test.out

#- 110 GetItemBySku
./ng net.accelbyte.sdk.cli.Main platform getItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'oWBwaivZ' \
    --sku '6beCL6Kn' \
    > test.out 2>&1
eval_tap $? 110 'GetItemBySku' test.out

#- 111 GetLocaleItemBySku
./ng net.accelbyte.sdk.cli.Main platform getLocaleItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'bVTX47i4' \
    --populateBundle  \
    --region 'rN69xd4z' \
    --storeId 'uo2og8qD' \
    --sku '6512ttH0' \
    > test.out 2>&1
eval_tap $? 111 'GetLocaleItemBySku' test.out

#- 112 GetEstimatedPrice
./ng net.accelbyte.sdk.cli.Main platform getEstimatedPrice \
    --namespace "$AB_NAMESPACE" \
    --platform 'PUVRvbGf' \
    --region 'yqboF5hQ' \
    --storeId 'wJosI2UD' \
    --itemIds 'YRAsRXn8' \
    --userId 'bTu2Oohg' \
    > test.out 2>&1
eval_tap $? 112 'GetEstimatedPrice' test.out

#- 113 GetItemIdBySku
./ng net.accelbyte.sdk.cli.Main platform getItemIdBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'XnL9ofuw' \
    --sku 'ckYCjSjN' \
    > test.out 2>&1
eval_tap $? 113 'GetItemIdBySku' test.out

#- 114 GetBulkItemIdBySkus
./ng net.accelbyte.sdk.cli.Main platform getBulkItemIdBySkus \
    --namespace "$AB_NAMESPACE" \
    --sku '9XGwqKSW,ND7jMsQ3,sKE5hN3y' \
    --storeId '2A6A7UUc' \
    > test.out 2>&1
eval_tap $? 114 'GetBulkItemIdBySkus' test.out

#- 115 BulkGetLocaleItems
./ng net.accelbyte.sdk.cli.Main platform bulkGetLocaleItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language '6dhUEiCi' \
    --region 'QO1gIIXD' \
    --storeId 'KKWjhdpW' \
    --itemIds 'B7Zgau1Z' \
    > test.out 2>&1
eval_tap $? 115 'BulkGetLocaleItems' test.out

#- 116 GetAvailablePredicateTypes
./ng net.accelbyte.sdk.cli.Main platform getAvailablePredicateTypes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 116 'GetAvailablePredicateTypes' test.out

#- 117 ValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform validateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --platform 'd4NaR7Or' \
    --userId 'FSgJm6X7' \
    --body '{"itemIds": ["f6vSglcz", "Zsng0grg", "KDz7X32N"]}' \
    > test.out 2>&1
eval_tap $? 117 'ValidateItemPurchaseCondition' test.out

#- 118 BulkUpdateRegionData
./ng net.accelbyte.sdk.cli.Main platform bulkUpdateRegionData \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ENPKYAtm' \
    --body '{"changes": [{"itemIdentities": ["cPLS09s3", "bbSPd7Yf", "1FBl4tXs"], "itemIdentityType": "ITEM_SKU", "regionData": {"nUmG3P5K": [{"currencyCode": "KJlFXTkG", "currencyNamespace": "aZWVhj7s", "currencyType": "VIRTUAL", "discountAmount": 64, "discountExpireAt": "1979-02-01T00:00:00Z", "discountPercentage": 75, "discountPurchaseAt": "1971-10-22T00:00:00Z", "discountedPrice": 60, "expireAt": "1985-09-15T00:00:00Z", "price": 75, "purchaseAt": "1992-07-14T00:00:00Z", "trialPrice": 34}, {"currencyCode": "0pmkq80N", "currencyNamespace": "9n66QLvH", "currencyType": "REAL", "discountAmount": 41, "discountExpireAt": "1989-03-21T00:00:00Z", "discountPercentage": 46, "discountPurchaseAt": "1994-08-18T00:00:00Z", "discountedPrice": 10, "expireAt": "1997-05-01T00:00:00Z", "price": 36, "purchaseAt": "1974-02-14T00:00:00Z", "trialPrice": 21}, {"currencyCode": "wzcs4ChU", "currencyNamespace": "MFf1mz5w", "currencyType": "REAL", "discountAmount": 88, "discountExpireAt": "1984-11-14T00:00:00Z", "discountPercentage": 85, "discountPurchaseAt": "1971-05-03T00:00:00Z", "discountedPrice": 84, "expireAt": "1971-07-30T00:00:00Z", "price": 58, "purchaseAt": "1974-04-19T00:00:00Z", "trialPrice": 2}], "iKbOxdOf": [{"currencyCode": "tmdQg6PP", "currencyNamespace": "rU6HX3z8", "currencyType": "VIRTUAL", "discountAmount": 17, "discountExpireAt": "1974-04-12T00:00:00Z", "discountPercentage": 60, "discountPurchaseAt": "1993-09-20T00:00:00Z", "discountedPrice": 17, "expireAt": "1987-04-10T00:00:00Z", "price": 87, "purchaseAt": "1973-05-14T00:00:00Z", "trialPrice": 75}, {"currencyCode": "nBKBwQYt", "currencyNamespace": "4WKc6f7i", "currencyType": "VIRTUAL", "discountAmount": 51, "discountExpireAt": "1985-08-14T00:00:00Z", "discountPercentage": 24, "discountPurchaseAt": "1978-04-25T00:00:00Z", "discountedPrice": 77, "expireAt": "1993-11-19T00:00:00Z", "price": 90, "purchaseAt": "1993-05-30T00:00:00Z", "trialPrice": 13}, {"currencyCode": "ItzDsIjE", "currencyNamespace": "ydeymwAs", "currencyType": "VIRTUAL", "discountAmount": 12, "discountExpireAt": "1987-07-07T00:00:00Z", "discountPercentage": 74, "discountPurchaseAt": "1986-09-20T00:00:00Z", "discountedPrice": 19, "expireAt": "1989-11-28T00:00:00Z", "price": 75, "purchaseAt": "1997-09-09T00:00:00Z", "trialPrice": 46}], "6j9WhDgg": [{"currencyCode": "kWiFXJRh", "currencyNamespace": "gFJoJPOv", "currencyType": "VIRTUAL", "discountAmount": 45, "discountExpireAt": "1984-01-23T00:00:00Z", "discountPercentage": 79, "discountPurchaseAt": "1986-04-04T00:00:00Z", "discountedPrice": 65, "expireAt": "1999-08-04T00:00:00Z", "price": 8, "purchaseAt": "1989-06-10T00:00:00Z", "trialPrice": 23}, {"currencyCode": "iyVyc7AD", "currencyNamespace": "2sNx21Yk", "currencyType": "VIRTUAL", "discountAmount": 10, "discountExpireAt": "1975-03-01T00:00:00Z", "discountPercentage": 31, "discountPurchaseAt": "1975-04-06T00:00:00Z", "discountedPrice": 49, "expireAt": "1996-04-15T00:00:00Z", "price": 81, "purchaseAt": "1990-09-17T00:00:00Z", "trialPrice": 9}, {"currencyCode": "pBHNk251", "currencyNamespace": "Rz1mJbam", "currencyType": "REAL", "discountAmount": 40, "discountExpireAt": "1979-11-06T00:00:00Z", "discountPercentage": 45, "discountPurchaseAt": "1995-07-27T00:00:00Z", "discountedPrice": 55, "expireAt": "1990-01-20T00:00:00Z", "price": 9, "purchaseAt": "1974-12-24T00:00:00Z", "trialPrice": 37}]}}, {"itemIdentities": ["C0ln3bII", "rUSPuWK1", "uj2iiSot"], "itemIdentityType": "ITEM_SKU", "regionData": {"i7xxo5Tz": [{"currencyCode": "0X2sLsaz", "currencyNamespace": "pFiTMJ9m", "currencyType": "VIRTUAL", "discountAmount": 84, "discountExpireAt": "1982-06-15T00:00:00Z", "discountPercentage": 2, "discountPurchaseAt": "1983-06-02T00:00:00Z", "discountedPrice": 91, "expireAt": "1996-09-24T00:00:00Z", "price": 38, "purchaseAt": "1971-02-23T00:00:00Z", "trialPrice": 9}, {"currencyCode": "iiCkHVh4", "currencyNamespace": "VFRnZDET", "currencyType": "VIRTUAL", "discountAmount": 19, "discountExpireAt": "1987-11-23T00:00:00Z", "discountPercentage": 61, "discountPurchaseAt": "1991-07-08T00:00:00Z", "discountedPrice": 91, "expireAt": "1991-10-29T00:00:00Z", "price": 15, "purchaseAt": "1986-12-07T00:00:00Z", "trialPrice": 71}, {"currencyCode": "TYU6yVEC", "currencyNamespace": "jNkNKpWf", "currencyType": "VIRTUAL", "discountAmount": 37, "discountExpireAt": "1977-06-29T00:00:00Z", "discountPercentage": 20, "discountPurchaseAt": "1980-10-02T00:00:00Z", "discountedPrice": 78, "expireAt": "1977-11-11T00:00:00Z", "price": 71, "purchaseAt": "1995-09-07T00:00:00Z", "trialPrice": 14}], "d5ozRbSQ": [{"currencyCode": "T5gxA01O", "currencyNamespace": "Ndf3f2tm", "currencyType": "VIRTUAL", "discountAmount": 55, "discountExpireAt": "1986-05-24T00:00:00Z", "discountPercentage": 8, "discountPurchaseAt": "1990-08-02T00:00:00Z", "discountedPrice": 70, "expireAt": "1984-04-14T00:00:00Z", "price": 91, "purchaseAt": "1978-03-16T00:00:00Z", "trialPrice": 27}, {"currencyCode": "aYWLGxDd", "currencyNamespace": "8arb5iFy", "currencyType": "REAL", "discountAmount": 50, "discountExpireAt": "1980-10-14T00:00:00Z", "discountPercentage": 95, "discountPurchaseAt": "1987-06-12T00:00:00Z", "discountedPrice": 35, "expireAt": "1982-04-09T00:00:00Z", "price": 15, "purchaseAt": "1996-01-18T00:00:00Z", "trialPrice": 36}, {"currencyCode": "W5b0Zxhv", "currencyNamespace": "yKbvhkvk", "currencyType": "VIRTUAL", "discountAmount": 9, "discountExpireAt": "1977-07-09T00:00:00Z", "discountPercentage": 35, "discountPurchaseAt": "1976-01-02T00:00:00Z", "discountedPrice": 26, "expireAt": "1992-04-02T00:00:00Z", "price": 45, "purchaseAt": "1976-07-28T00:00:00Z", "trialPrice": 94}], "BXr3J203": [{"currencyCode": "ZzQEXNq8", "currencyNamespace": "2V1h1zEH", "currencyType": "VIRTUAL", "discountAmount": 55, "discountExpireAt": "1988-11-12T00:00:00Z", "discountPercentage": 82, "discountPurchaseAt": "1982-12-27T00:00:00Z", "discountedPrice": 26, "expireAt": "1993-10-14T00:00:00Z", "price": 38, "purchaseAt": "1992-06-20T00:00:00Z", "trialPrice": 20}, {"currencyCode": "s4Juowg8", "currencyNamespace": "xLeDG3VQ", "currencyType": "REAL", "discountAmount": 81, "discountExpireAt": "1982-03-01T00:00:00Z", "discountPercentage": 72, "discountPurchaseAt": "1987-05-29T00:00:00Z", "discountedPrice": 27, "expireAt": "1991-01-20T00:00:00Z", "price": 100, "purchaseAt": "1980-06-24T00:00:00Z", "trialPrice": 26}, {"currencyCode": "q8R8t4Ef", "currencyNamespace": "NwazgADI", "currencyType": "VIRTUAL", "discountAmount": 11, "discountExpireAt": "1986-05-16T00:00:00Z", "discountPercentage": 34, "discountPurchaseAt": "1972-10-22T00:00:00Z", "discountedPrice": 91, "expireAt": "1973-06-16T00:00:00Z", "price": 83, "purchaseAt": "1974-09-18T00:00:00Z", "trialPrice": 67}]}}, {"itemIdentities": ["4nsAPyEN", "Cd0v2jD9", "GGSXAp0l"], "itemIdentityType": "ITEM_SKU", "regionData": {"U16Ty4o4": [{"currencyCode": "FOo0jYuB", "currencyNamespace": "YhYSGik5", "currencyType": "VIRTUAL", "discountAmount": 88, "discountExpireAt": "1997-04-03T00:00:00Z", "discountPercentage": 13, "discountPurchaseAt": "1975-04-17T00:00:00Z", "discountedPrice": 79, "expireAt": "1985-10-12T00:00:00Z", "price": 67, "purchaseAt": "1990-07-07T00:00:00Z", "trialPrice": 15}, {"currencyCode": "8UiDZlg2", "currencyNamespace": "7w6H3pes", "currencyType": "REAL", "discountAmount": 21, "discountExpireAt": "1980-01-20T00:00:00Z", "discountPercentage": 13, "discountPurchaseAt": "1982-04-04T00:00:00Z", "discountedPrice": 71, "expireAt": "1994-11-10T00:00:00Z", "price": 10, "purchaseAt": "1972-09-23T00:00:00Z", "trialPrice": 84}, {"currencyCode": "YGVqM8wr", "currencyNamespace": "JCVYtrJj", "currencyType": "REAL", "discountAmount": 33, "discountExpireAt": "1982-09-03T00:00:00Z", "discountPercentage": 83, "discountPurchaseAt": "1975-08-19T00:00:00Z", "discountedPrice": 60, "expireAt": "1991-10-29T00:00:00Z", "price": 98, "purchaseAt": "1980-05-01T00:00:00Z", "trialPrice": 5}], "vQJvceVK": [{"currencyCode": "kkIfoyoT", "currencyNamespace": "Xh7nxI0C", "currencyType": "REAL", "discountAmount": 56, "discountExpireAt": "1975-08-25T00:00:00Z", "discountPercentage": 20, "discountPurchaseAt": "1994-04-02T00:00:00Z", "discountedPrice": 40, "expireAt": "1985-03-14T00:00:00Z", "price": 98, "purchaseAt": "1972-07-24T00:00:00Z", "trialPrice": 59}, {"currencyCode": "CCmAnGyd", "currencyNamespace": "oJpO2UGP", "currencyType": "VIRTUAL", "discountAmount": 16, "discountExpireAt": "1999-12-17T00:00:00Z", "discountPercentage": 7, "discountPurchaseAt": "1973-09-18T00:00:00Z", "discountedPrice": 64, "expireAt": "1990-04-28T00:00:00Z", "price": 57, "purchaseAt": "1976-06-17T00:00:00Z", "trialPrice": 76}, {"currencyCode": "Wr0bRGel", "currencyNamespace": "oBvsmpRQ", "currencyType": "VIRTUAL", "discountAmount": 33, "discountExpireAt": "1996-12-03T00:00:00Z", "discountPercentage": 6, "discountPurchaseAt": "1999-09-07T00:00:00Z", "discountedPrice": 28, "expireAt": "1984-10-09T00:00:00Z", "price": 88, "purchaseAt": "1989-01-27T00:00:00Z", "trialPrice": 46}], "sEssLXZh": [{"currencyCode": "XqHBwW1l", "currencyNamespace": "86x1Gzrh", "currencyType": "VIRTUAL", "discountAmount": 69, "discountExpireAt": "1980-04-03T00:00:00Z", "discountPercentage": 18, "discountPurchaseAt": "1985-12-27T00:00:00Z", "discountedPrice": 66, "expireAt": "1994-06-13T00:00:00Z", "price": 32, "purchaseAt": "1997-12-07T00:00:00Z", "trialPrice": 67}, {"currencyCode": "J4wF9y2s", "currencyNamespace": "mNbOVdfP", "currencyType": "REAL", "discountAmount": 4, "discountExpireAt": "1984-11-30T00:00:00Z", "discountPercentage": 14, "discountPurchaseAt": "1984-08-26T00:00:00Z", "discountedPrice": 35, "expireAt": "1981-03-06T00:00:00Z", "price": 48, "purchaseAt": "1997-10-17T00:00:00Z", "trialPrice": 42}, {"currencyCode": "3x6TKdcW", "currencyNamespace": "Vxpd73iT", "currencyType": "VIRTUAL", "discountAmount": 32, "discountExpireAt": "1971-11-25T00:00:00Z", "discountPercentage": 58, "discountPurchaseAt": "1984-04-13T00:00:00Z", "discountedPrice": 63, "expireAt": "1986-06-30T00:00:00Z", "price": 6, "purchaseAt": "1992-10-26T00:00:00Z", "trialPrice": 85}]}}]}' \
    > test.out 2>&1
eval_tap $? 118 'BulkUpdateRegionData' test.out

#- 119 SearchItems
./ng net.accelbyte.sdk.cli.Main platform searchItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemType 'INGAMEITEM' \
    --limit '98' \
    --offset '48' \
    --sortBy 'd1wgEqyn' \
    --storeId 'cD5Jw8cP' \
    --keyword 'XF6XAjcc' \
    --language 'rBwqwDkg' \
    > test.out 2>&1
eval_tap $? 119 'SearchItems' test.out

#- 120 QueryUncategorizedItems
./ng net.accelbyte.sdk.cli.Main platform queryUncategorizedItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --limit '15' \
    --offset '29' \
    --sortBy 'updatedAt,updatedAt:asc,name:asc' \
    --storeId 'OUkeLEUo' \
    > test.out 2>&1
eval_tap $? 120 'QueryUncategorizedItems' test.out

#- 121 GetItem
./ng net.accelbyte.sdk.cli.Main platform getItem \
    --itemId 'Wl3F81jc' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'M3OjC5Jn' \
    > test.out 2>&1
eval_tap $? 121 'GetItem' test.out

#- 122 UpdateItem
./ng net.accelbyte.sdk.cli.Main platform updateItem \
    --itemId 'Q7jliYYa' \
    --namespace "$AB_NAMESPACE" \
    --storeId '0bxAllZ9' \
    --body '{"appId": "c3VFfmqa", "appType": "SOFTWARE", "baseAppId": "jA5iv8cC", "boothName": "LF7fgSgd", "categoryPath": "bjD4jND7", "clazz": "1jHtxm7k", "displayOrder": 76, "entitlementType": "DURABLE", "ext": {"frlBnj7L": {}, "JurxdodT": {}, "kl1M4DMX": {}}, "features": ["psQN0dF7", "2AnwHS63", "gkqW8LUZ"], "flexible": false, "images": [{"as": "BNFs8NFD", "caption": "WckdDOP6", "height": 67, "imageUrl": "kX7IG60S", "smallImageUrl": "vm0xkvEX", "width": 31}, {"as": "JL2nlnAt", "caption": "8U4g1dEu", "height": 87, "imageUrl": "U0BcFAQB", "smallImageUrl": "YKURKYJW", "width": 18}, {"as": "XSDGHVdV", "caption": "5uLHBsaQ", "height": 53, "imageUrl": "qaT5fHkQ", "smallImageUrl": "XnJrVzzD", "width": 71}], "inventoryConfig": {"customAttributes": {"hwHNz1MT": {}, "7TBIqeB6": {}, "8OmRUn9P": {}}, "serverCustomAttributes": {"TVcRtwhs": {}, "kuXej7wM": {}, "74X5Few5": {}}, "slotUsed": 97}, "itemIds": ["8Fyp0tPz", "eQBXTK7L", "St4wLRlX"], "itemQty": {"V1tYBgqT": 40, "M9vtHBpl": 75, "mn8uPre5": 92}, "itemType": "APP", "listable": false, "localizations": {"3DYfuO05": {"description": "pYFD5qwl", "localExt": {"rFufrE5V": {}, "hLQk3LEp": {}, "7yTjcU5r": {}}, "longDescription": "iRHtC2nH", "title": "3myLe0RI"}, "RxDZ68OE": {"description": "qDioDI8o", "localExt": {"3OHfVtKs": {}, "6TBVNjqO": {}, "RstUlqZO": {}}, "longDescription": "C8F8Z4JW", "title": "r5Inv36H"}, "gg07fVyg": {"description": "Y99lo0pu", "localExt": {"weBJLJuI": {}, "buY37yJN": {}, "yhx06dkB": {}}, "longDescription": "yhYQ1NCf", "title": "hfORm819"}}, "lootBoxConfig": {"rewardCount": 2, "rewards": [{"lootBoxItems": [{"count": 86, "duration": 7, "endDate": "1982-08-06T00:00:00Z", "itemId": "7SvBU53B", "itemSku": "vSBrpFJI", "itemType": "mTzULUbI"}, {"count": 79, "duration": 13, "endDate": "1999-09-03T00:00:00Z", "itemId": "WHHYWEdS", "itemSku": "2uJq2sRt", "itemType": "gNyMpTQK"}, {"count": 81, "duration": 37, "endDate": "1994-06-06T00:00:00Z", "itemId": "SOdSNbcd", "itemSku": "xCv6clBO", "itemType": "5JJkGL1X"}], "name": "dQDlJzHc", "odds": 0.8377208750308861, "type": "REWARD_GROUP", "weight": 100}, {"lootBoxItems": [{"count": 11, "duration": 63, "endDate": "1971-02-25T00:00:00Z", "itemId": "zkyTy85K", "itemSku": "H0JwJhV6", "itemType": "tm9mIrhv"}, {"count": 59, "duration": 10, "endDate": "1995-07-17T00:00:00Z", "itemId": "olND5lWC", "itemSku": "5GZA14R1", "itemType": "fmJmZZxm"}, {"count": 97, "duration": 99, "endDate": "1989-01-05T00:00:00Z", "itemId": "w6c1yj6S", "itemSku": "9piBBJGa", "itemType": "KbmBrhe8"}], "name": "3x83HF2e", "odds": 0.9316108027871899, "type": "REWARD_GROUP", "weight": 8}, {"lootBoxItems": [{"count": 47, "duration": 78, "endDate": "1982-07-09T00:00:00Z", "itemId": "FDFpkViX", "itemSku": "xNa8HOm4", "itemType": "u2AXnRfu"}, {"count": 33, "duration": 53, "endDate": "1982-11-12T00:00:00Z", "itemId": "NzU5I0XE", "itemSku": "B0RgOIOK", "itemType": "I1vxIZUR"}, {"count": 5, "duration": 8, "endDate": "1996-08-10T00:00:00Z", "itemId": "Zy2mw0tz", "itemSku": "IHz3pr9A", "itemType": "NgpABzUs"}], "name": "x5ytlu0W", "odds": 0.3904072417851211, "type": "REWARD_GROUP", "weight": 16}], "rollFunction": "CUSTOM"}, "maxCount": 45, "maxCountPerUser": 62, "name": "Ktni5uDz", "optionBoxConfig": {"boxItems": [{"count": 16, "duration": 64, "endDate": "1980-05-22T00:00:00Z", "itemId": "FeSrBp4O", "itemSku": "Qg5k0Wyr", "itemType": "mQ63KfOt"}, {"count": 63, "duration": 7, "endDate": "1982-04-26T00:00:00Z", "itemId": "2Cs6M4Af", "itemSku": "v1lKf2J5", "itemType": "8i7UzrTR"}, {"count": 13, "duration": 7, "endDate": "1972-02-19T00:00:00Z", "itemId": "TjNYbt6e", "itemSku": "CO1qW7x5", "itemType": "pLXKI7Qr"}]}, "purchasable": false, "recurring": {"cycle": "QUARTERLY", "fixedFreeDays": 10, "fixedTrialCycles": 95, "graceDays": 29}, "regionData": {"FVDzXx0B": [{"currencyCode": "uQGhbGOi", "currencyNamespace": "MeirDOxM", "currencyType": "REAL", "discountAmount": 39, "discountExpireAt": "1988-02-16T00:00:00Z", "discountPercentage": 25, "discountPurchaseAt": "1991-04-08T00:00:00Z", "expireAt": "1991-02-02T00:00:00Z", "price": 9, "purchaseAt": "1999-04-24T00:00:00Z", "trialPrice": 74}, {"currencyCode": "jjzhyv43", "currencyNamespace": "MvJmeSw7", "currencyType": "VIRTUAL", "discountAmount": 85, "discountExpireAt": "1991-02-22T00:00:00Z", "discountPercentage": 85, "discountPurchaseAt": "1974-10-02T00:00:00Z", "expireAt": "1995-06-06T00:00:00Z", "price": 57, "purchaseAt": "1980-08-29T00:00:00Z", "trialPrice": 0}, {"currencyCode": "8TF7oeps", "currencyNamespace": "7PpB6pNk", "currencyType": "REAL", "discountAmount": 23, "discountExpireAt": "1981-08-24T00:00:00Z", "discountPercentage": 32, "discountPurchaseAt": "1973-11-07T00:00:00Z", "expireAt": "1999-05-15T00:00:00Z", "price": 38, "purchaseAt": "1983-09-13T00:00:00Z", "trialPrice": 46}], "sCPpJ2hT": [{"currencyCode": "NMxLayyb", "currencyNamespace": "JNewL2cp", "currencyType": "VIRTUAL", "discountAmount": 34, "discountExpireAt": "1982-03-23T00:00:00Z", "discountPercentage": 10, "discountPurchaseAt": "1982-04-05T00:00:00Z", "expireAt": "1972-09-04T00:00:00Z", "price": 19, "purchaseAt": "1973-04-10T00:00:00Z", "trialPrice": 42}, {"currencyCode": "YWoWvXgX", "currencyNamespace": "YvDnwNlM", "currencyType": "REAL", "discountAmount": 92, "discountExpireAt": "1999-05-30T00:00:00Z", "discountPercentage": 83, "discountPurchaseAt": "1986-04-23T00:00:00Z", "expireAt": "1984-07-27T00:00:00Z", "price": 47, "purchaseAt": "1992-01-01T00:00:00Z", "trialPrice": 40}, {"currencyCode": "ZRh0RPvH", "currencyNamespace": "NMi61Gzv", "currencyType": "REAL", "discountAmount": 26, "discountExpireAt": "1981-02-26T00:00:00Z", "discountPercentage": 28, "discountPurchaseAt": "1981-06-26T00:00:00Z", "expireAt": "1995-09-12T00:00:00Z", "price": 93, "purchaseAt": "1998-08-23T00:00:00Z", "trialPrice": 36}], "FN8nxsXr": [{"currencyCode": "1HGLNfdD", "currencyNamespace": "V3u890qc", "currencyType": "VIRTUAL", "discountAmount": 24, "discountExpireAt": "1979-11-28T00:00:00Z", "discountPercentage": 25, "discountPurchaseAt": "1992-10-21T00:00:00Z", "expireAt": "1992-11-18T00:00:00Z", "price": 95, "purchaseAt": "1979-03-08T00:00:00Z", "trialPrice": 90}, {"currencyCode": "ljUacoaY", "currencyNamespace": "wRBnHwYw", "currencyType": "VIRTUAL", "discountAmount": 4, "discountExpireAt": "1984-06-06T00:00:00Z", "discountPercentage": 63, "discountPurchaseAt": "1977-03-29T00:00:00Z", "expireAt": "1999-03-28T00:00:00Z", "price": 97, "purchaseAt": "1993-12-10T00:00:00Z", "trialPrice": 1}, {"currencyCode": "w6cO0ICp", "currencyNamespace": "94kbYGuE", "currencyType": "VIRTUAL", "discountAmount": 62, "discountExpireAt": "1972-01-31T00:00:00Z", "discountPercentage": 87, "discountPurchaseAt": "1981-01-04T00:00:00Z", "expireAt": "1997-03-23T00:00:00Z", "price": 45, "purchaseAt": "1979-11-28T00:00:00Z", "trialPrice": 80}]}, "saleConfig": {"currencyCode": "scFe5hyc", "price": 21}, "seasonType": "PASS", "sectionExclusive": false, "sellable": false, "sku": "8nmZE7nN", "stackable": false, "status": "ACTIVE", "tags": ["jAn0egw2", "uOkWwJ1x", "Zyo9ENIu"], "targetCurrencyCode": "fZ7W5pXy", "targetNamespace": "At5DPyRh", "thumbnailUrl": "oMvVWcT6", "useCount": 62}' \
    > test.out 2>&1
eval_tap $? 122 'UpdateItem' test.out

#- 123 DeleteItem
./ng net.accelbyte.sdk.cli.Main platform deleteItem \
    --itemId '6CNhnHZ2' \
    --namespace "$AB_NAMESPACE" \
    --force  \
    --storeId 'vPn8pzKw' \
    > test.out 2>&1
eval_tap $? 123 'DeleteItem' test.out

#- 124 AcquireItem
./ng net.accelbyte.sdk.cli.Main platform acquireItem \
    --itemId 'zYDUqLLL' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 86, "orderNo": "3GUuznPr"}' \
    > test.out 2>&1
eval_tap $? 124 'AcquireItem' test.out

#- 125 GetApp
./ng net.accelbyte.sdk.cli.Main platform getApp \
    --itemId 'mXvwMdaN' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'oAXDUDrj' \
    > test.out 2>&1
eval_tap $? 125 'GetApp' test.out

#- 126 UpdateApp
./ng net.accelbyte.sdk.cli.Main platform updateApp \
    --itemId 'hcWGWnJB' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'mrGNIfyl' \
    --body '{"carousel": [{"alt": "CuN8Yhyv", "previewUrl": "W84oVLMD", "thumbnailUrl": "9iwfJ1hZ", "type": "video", "url": "iQqWccl8", "videoSource": "youtube"}, {"alt": "owCXcKB0", "previewUrl": "bp9lwUzC", "thumbnailUrl": "EhZiq0pb", "type": "image", "url": "B8np8DXe", "videoSource": "youtube"}, {"alt": "NIpLgmHH", "previewUrl": "6zkATCCJ", "thumbnailUrl": "SCHHHqOa", "type": "video", "url": "1UOPeifw", "videoSource": "generic"}], "developer": "pIsCiiUI", "forumUrl": "qquaiswI", "genres": ["Adventure", "Action", "Adventure"], "localizations": {"CmuQZdhM": {"announcement": "PZBgxRjI", "slogan": "Q4706rUn"}, "XiHzlCUi": {"announcement": "k6bGE4C6", "slogan": "JqtBlRyH"}, "dBfXdRcl": {"announcement": "jUDHNSmG", "slogan": "AiHCdLKr"}}, "platformRequirements": {"VI96OAG0": [{"additionals": "7VGM5dhw", "directXVersion": "GVcvQxRx", "diskSpace": "i49wH7VP", "graphics": "Hoy2K8dp", "label": "iVaVVacD", "osVersion": "5h0aAqM1", "processor": "eOGZRdja", "ram": "NHlhBus4", "soundCard": "jLHpAyiW"}, {"additionals": "dHpeQ6x9", "directXVersion": "BScV1svX", "diskSpace": "ORTyTfn1", "graphics": "8kd7zdzS", "label": "IFheWb9y", "osVersion": "xYBhq7qn", "processor": "aEMyUILO", "ram": "UaEf1WS3", "soundCard": "l9M6v8TE"}, {"additionals": "Els2WIp7", "directXVersion": "Nj83VqPr", "diskSpace": "hEFzFkjp", "graphics": "T9eYayBx", "label": "QaTnbENd", "osVersion": "1ye9igfP", "processor": "rKmhT7av", "ram": "QTEE6RdG", "soundCard": "2CtBcMtC"}], "0czwruXy": [{"additionals": "AcbpDDMj", "directXVersion": "0oRSJqnQ", "diskSpace": "sabSWNZx", "graphics": "8Gx2My2I", "label": "BEYETFHY", "osVersion": "4aHzDK9q", "processor": "wx8OWZdW", "ram": "fwGgJrvZ", "soundCard": "5tG0LYFO"}, {"additionals": "DmIWEreJ", "directXVersion": "MUFp56Yy", "diskSpace": "yR7RzchZ", "graphics": "TxkqDT6y", "label": "SM0CgtEh", "osVersion": "LhUP80Ez", "processor": "5VqADCY5", "ram": "y8iftcuR", "soundCard": "wwrRqyBh"}, {"additionals": "V9l2B83O", "directXVersion": "AJBITxtw", "diskSpace": "M7sopXbs", "graphics": "iKHrLKwi", "label": "Y0eVrITz", "osVersion": "tQuevO8e", "processor": "R54GaOws", "ram": "nwfVgJ3C", "soundCard": "SQHuTYGG"}], "qRgSfIqN": [{"additionals": "aP5NiYp3", "directXVersion": "GEKuilvT", "diskSpace": "RFvplvGD", "graphics": "FyspzBPM", "label": "LWecmknt", "osVersion": "EY5s6jit", "processor": "bgeCPllp", "ram": "mqLPTLWg", "soundCard": "N1MpmdlU"}, {"additionals": "KQlaRRuD", "directXVersion": "nvpZoVd1", "diskSpace": "7GWPResK", "graphics": "pNIGq6mO", "label": "LBc8T25A", "osVersion": "WLnDvu9a", "processor": "Bz2Z8nWX", "ram": "yk4xZtv8", "soundCard": "DXEC6Rov"}, {"additionals": "0DzQdAJx", "directXVersion": "iv7hWLw1", "diskSpace": "Dv05Bl2z", "graphics": "hVKYTabO", "label": "yAZmdhh1", "osVersion": "VVGUe9uo", "processor": "UHDX9ucZ", "ram": "lFgBjb4Z", "soundCard": "6NNn78dk"}]}, "platforms": ["IOS", "Linux", "Android"], "players": ["LocalCoop", "Single", "Single"], "primaryGenre": "Racing", "publisher": "S7lWpjLQ", "releaseDate": "1982-05-29T00:00:00Z", "websiteUrl": "c1KayFY0"}' \
    > test.out 2>&1
eval_tap $? 126 'UpdateApp' test.out

#- 127 DisableItem
./ng net.accelbyte.sdk.cli.Main platform disableItem \
    --itemId 'QuIB8mZJ' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'xYfFcIUs' \
    > test.out 2>&1
eval_tap $? 127 'DisableItem' test.out

#- 128 GetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform getItemDynamicData \
    --itemId 'b9ZjpIBY' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 128 'GetItemDynamicData' test.out

#- 129 EnableItem
./ng net.accelbyte.sdk.cli.Main platform enableItem \
    --itemId 'hKq9AAQD' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'jf3s9cKS' \
    > test.out 2>&1
eval_tap $? 129 'EnableItem' test.out

#- 130 FeatureItem
./ng net.accelbyte.sdk.cli.Main platform featureItem \
    --feature 'nbr9vcYP' \
    --itemId 'bLoroJ3w' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'X4K2J26s' \
    > test.out 2>&1
eval_tap $? 130 'FeatureItem' test.out

#- 131 DefeatureItem
./ng net.accelbyte.sdk.cli.Main platform defeatureItem \
    --feature '0vIimkBN' \
    --itemId 'b0fZFcAf' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'fwIuVfKJ' \
    > test.out 2>&1
eval_tap $? 131 'DefeatureItem' test.out

#- 132 GetLocaleItem
./ng net.accelbyte.sdk.cli.Main platform getLocaleItem \
    --itemId 'yfFSAnkC' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'PZzsCb4O' \
    --populateBundle  \
    --region '45VwfRw7' \
    --storeId 'lR0JLY7G' \
    > test.out 2>&1
eval_tap $? 132 'GetLocaleItem' test.out

#- 133 UpdateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform updateItemPurchaseCondition \
    --itemId 'cLmTQFCG' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Jv6FC1oA' \
    --body '{"purchaseCondition": {"conditionGroups": [{"operator": "or", "predicates": [{"anyOf": 65, "comparison": "isGreaterThanOrEqual", "name": "bUCx3ZIw", "predicateType": "EntitlementPredicate", "value": "s3ZfTXsa", "values": ["3XLdhzzL", "R48y1l0c", "0DHa0Wwq"]}, {"anyOf": 17, "comparison": "is", "name": "nKQpospb", "predicateType": "SeasonPassPredicate", "value": "axGYhBVK", "values": ["sM4nPpRa", "hzSFSSKB", "fPq1s3N5"]}, {"anyOf": 16, "comparison": "isGreaterThan", "name": "lt78eLC3", "predicateType": "SeasonPassPredicate", "value": "uJvdrIRT", "values": ["gFMeh0f5", "4bu5Oj6s", "9s4qe2Jr"]}]}, {"operator": "or", "predicates": [{"anyOf": 3, "comparison": "isGreaterThanOrEqual", "name": "Dw6x8re6", "predicateType": "EntitlementPredicate", "value": "h335OT9V", "values": ["C0f3i8sg", "feQxELvL", "cW6AsWKr"]}, {"anyOf": 36, "comparison": "isLessThan", "name": "I81yITYo", "predicateType": "SeasonPassPredicate", "value": "LQojwSdA", "values": ["pSC9H5BJ", "rX1vNh9m", "xWGbeL0L"]}, {"anyOf": 53, "comparison": "isLessThan", "name": "bBdoDWy7", "predicateType": "SeasonPassPredicate", "value": "JjEWQwom", "values": ["V8RhOHfo", "GX0lHVMc", "Qoo2a7xv"]}]}, {"operator": "and", "predicates": [{"anyOf": 65, "comparison": "excludes", "name": "iYdFWLY9", "predicateType": "EntitlementPredicate", "value": "2O5DhyKN", "values": ["Qb3mAcm3", "AHdpHtHY", "IoqFiSbf"]}, {"anyOf": 72, "comparison": "isGreaterThanOrEqual", "name": "eB6HPglW", "predicateType": "SeasonPassPredicate", "value": "XG2KWaSW", "values": ["LgDjVDxX", "9Yixef2T", "FaIrxPy8"]}, {"anyOf": 37, "comparison": "isLessThan", "name": "9nG9RKvR", "predicateType": "SeasonTierPredicate", "value": "LXx2OzGR", "values": ["ZBv29Dvz", "6UKYjzqo", "nUcpDqp5"]}]}]}}' \
    > test.out 2>&1
eval_tap $? 133 'UpdateItemPurchaseCondition' test.out

#- 134 ReturnItem
./ng net.accelbyte.sdk.cli.Main platform returnItem \
    --itemId 'st1ugrAm' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "276Uh34G"}' \
    > test.out 2>&1
eval_tap $? 134 'ReturnItem' test.out

#- 135 QueryKeyGroups
./ng net.accelbyte.sdk.cli.Main platform queryKeyGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '48' \
    --name 't1Uc8HF2' \
    --offset '4' \
    --tag 'X3op2NBi' \
    > test.out 2>&1
eval_tap $? 135 'QueryKeyGroups' test.out

#- 136 CreateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform createKeyGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "221NrjO6", "name": "6a9IJSq0", "status": "INACTIVE", "tags": ["ngeiPtRe", "fz7zu0bQ", "Bxj8o3Ia"]}' \
    > test.out 2>&1
eval_tap $? 136 'CreateKeyGroup' test.out

#- 137 GetKeyGroupByBoothName
eval_tap 0 137 'GetKeyGroupByBoothName # SKIP deprecated' test.out

#- 138 GetKeyGroup
./ng net.accelbyte.sdk.cli.Main platform getKeyGroup \
    --keyGroupId '8P6zlHVj' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 138 'GetKeyGroup' test.out

#- 139 UpdateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform updateKeyGroup \
    --keyGroupId 'YEBlcHTR' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "k77PSwrs", "name": "o22cLH3Y", "status": "ACTIVE", "tags": ["LjDZDfip", "ClhTIPn1", "LeMIiFHc"]}' \
    > test.out 2>&1
eval_tap $? 139 'UpdateKeyGroup' test.out

#- 140 GetKeyGroupDynamic
./ng net.accelbyte.sdk.cli.Main platform getKeyGroupDynamic \
    --keyGroupId 'DzjfbS7K' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 140 'GetKeyGroupDynamic' test.out

#- 141 ListKeys
./ng net.accelbyte.sdk.cli.Main platform listKeys \
    --keyGroupId 'H1f5hHBT' \
    --namespace "$AB_NAMESPACE" \
    --limit '66' \
    --offset '53' \
    --status 'ACQUIRED' \
    > test.out 2>&1
eval_tap $? 141 'ListKeys' test.out

#- 142 UploadKeys
./ng net.accelbyte.sdk.cli.Main platform uploadKeys \
    --keyGroupId 'lzHAcKyE' \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 142 'UploadKeys' test.out

#- 143 QueryOrders
./ng net.accelbyte.sdk.cli.Main platform queryOrders \
    --namespace "$AB_NAMESPACE" \
    --endTime 'he0umCAg' \
    --limit '69' \
    --offset '31' \
    --orderNos 'bzW0dEzV,QL44GtOf,vh6RYo3w' \
    --sortBy 'h9DUcSFS' \
    --startTime '1Xkcstfb' \
    --status 'REFUND_FAILED' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 143 'QueryOrders' test.out

#- 144 GetOrderStatistics
./ng net.accelbyte.sdk.cli.Main platform getOrderStatistics \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 144 'GetOrderStatistics' test.out

#- 145 GetOrder
./ng net.accelbyte.sdk.cli.Main platform getOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'fLxODE2B' \
    > test.out 2>&1
eval_tap $? 145 'GetOrder' test.out

#- 146 RefundOrder
./ng net.accelbyte.sdk.cli.Main platform refundOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'MNDGc7r1' \
    --body '{"description": "HdHmsd6t"}' \
    > test.out 2>&1
eval_tap $? 146 'RefundOrder' test.out

#- 147 GetPaymentCallbackConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentCallbackConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 147 'GetPaymentCallbackConfig' test.out

#- 148 UpdatePaymentCallbackConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentCallbackConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"dryRun": true, "notifyUrl": "uHmrOe8k", "privateKey": "6l6vY7hJ"}' \
    > test.out 2>&1
eval_tap $? 148 'UpdatePaymentCallbackConfig' test.out

#- 149 QueryPaymentNotifications
./ng net.accelbyte.sdk.cli.Main platform queryPaymentNotifications \
    --namespace "$AB_NAMESPACE" \
    --endDate 'JkWuypNO' \
    --externalId 'H82nvaxx' \
    --limit '80' \
    --notificationSource 'ADYEN' \
    --notificationType 'SZymyMNi' \
    --offset '64' \
    --paymentOrderNo 'iz3cOzi8' \
    --startDate 'Wrad88fJ' \
    --status 'IGNORED' \
    > test.out 2>&1
eval_tap $? 149 'QueryPaymentNotifications' test.out

#- 150 QueryPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform queryPaymentOrders \
    --namespace "$AB_NAMESPACE" \
    --channel 'EXTERNAL' \
    --extTxId 'EH3E0Vqs' \
    --limit '67' \
    --offset '93' \
    --status 'REFUNDED' \
    > test.out 2>&1
eval_tap $? 150 'QueryPaymentOrders' test.out

#- 151 CreatePaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform createPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --body '{"currencyCode": "9VKOKpmm", "currencyNamespace": "mu7lxxXk", "customParameters": {"kBNGyTRa": {}, "AeaFwCOU": {}, "ovm6JlOh": {}}, "description": "7pO1qJpU", "extOrderNo": "h48r6qdB", "extUserId": "Vm652Knv", "itemType": "INGAMEITEM", "language": "ZpjM_Dx", "metadata": {"YUppucOP": "p5EF6lbx", "RRg1SSsf": "EoRfH4i4", "dAyEUNSz": "aweSAwzr"}, "notifyUrl": "xFWQeEG6", "omitNotification": true, "platform": "LuaUc0jw", "price": 70, "recurringPaymentOrderNo": "0UzvOfnm", "region": "tHlHWl04", "returnUrl": "E2mxMSFM", "sandbox": false, "sku": "z6cEIium", "subscriptionId": "xpheRuWY", "targetNamespace": "8qR4STAK", "targetUserId": "NqAWyckd", "title": "2aIgg7rC"}' \
    > test.out 2>&1
eval_tap $? 151 'CreatePaymentOrderByDedicated' test.out

#- 152 ListExtOrderNoByExtTxId
./ng net.accelbyte.sdk.cli.Main platform listExtOrderNoByExtTxId \
    --namespace "$AB_NAMESPACE" \
    --extTxId 'b7SVo4rZ' \
    > test.out 2>&1
eval_tap $? 152 'ListExtOrderNoByExtTxId' test.out

#- 153 GetPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'vHDZ82yf' \
    > test.out 2>&1
eval_tap $? 153 'GetPaymentOrder' test.out

#- 154 ChargePaymentOrder
./ng net.accelbyte.sdk.cli.Main platform chargePaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'CyMkwY5V' \
    --body '{"extTxId": "YAR9Ccvy", "paymentMethod": "brdXTooH", "paymentProvider": "ALIPAY"}' \
    > test.out 2>&1
eval_tap $? 154 'ChargePaymentOrder' test.out

#- 155 RefundPaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform refundPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'Sfr2egBw' \
    --body '{"description": "h5eszE80"}' \
    > test.out 2>&1
eval_tap $? 155 'RefundPaymentOrderByDedicated' test.out

#- 156 SimulatePaymentOrderNotification
./ng net.accelbyte.sdk.cli.Main platform simulatePaymentOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '5vjvfJEz' \
    --body '{"amount": 99, "currencyCode": "VTbRBJTB", "notifyType": "CHARGE", "paymentProvider": "ALIPAY", "salesTax": 79, "vat": 38}' \
    > test.out 2>&1
eval_tap $? 156 'SimulatePaymentOrderNotification' test.out

#- 157 GetPaymentOrderChargeStatus
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrderChargeStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'nd4naPnw' \
    > test.out 2>&1
eval_tap $? 157 'GetPaymentOrderChargeStatus' test.out

#- 158 GetPlatformEntitlementConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformEntitlementConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Steam' \
    > test.out 2>&1
eval_tap $? 158 'GetPlatformEntitlementConfig' test.out

#- 159 UpdatePlatformEntitlementConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformEntitlementConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Xbox' \
    --body '{"allowedPlatformOrigins": ["GooglePlay", "Xbox", "Oculus"]}' \
    > test.out 2>&1
eval_tap $? 159 'UpdatePlatformEntitlementConfig' test.out

#- 160 GetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Xbox' \
    > test.out 2>&1
eval_tap $? 160 'GetPlatformWalletConfig' test.out

#- 161 UpdatePlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Oculus' \
    --body '{"allowedBalanceOrigins": ["Playstation", "System", "Playstation"]}' \
    > test.out 2>&1
eval_tap $? 161 'UpdatePlatformWalletConfig' test.out

#- 162 ResetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform resetPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Epic' \
    > test.out 2>&1
eval_tap $? 162 'ResetPlatformWalletConfig' test.out

#- 163 GetRevocationConfig
./ng net.accelbyte.sdk.cli.Main platform getRevocationConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 163 'GetRevocationConfig' test.out

#- 164 UpdateRevocationConfig
./ng net.accelbyte.sdk.cli.Main platform updateRevocationConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"entitlement": {"consumable": {"enabled": false, "strategy": "CUSTOM"}, "durable": {"enabled": false, "strategy": "REVOKE_OR_REPORT"}}, "wallet": {"enabled": true, "strategy": "ALWAYS_REVOKE"}}' \
    > test.out 2>&1
eval_tap $? 164 'UpdateRevocationConfig' test.out

#- 165 DeleteRevocationConfig
./ng net.accelbyte.sdk.cli.Main platform deleteRevocationConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 165 'DeleteRevocationConfig' test.out

#- 166 QueryRevocationHistories
./ng net.accelbyte.sdk.cli.Main platform queryRevocationHistories \
    --namespace "$AB_NAMESPACE" \
    --endTime 'OHKjucpO' \
    --limit '57' \
    --offset '30' \
    --source 'OTHER' \
    --startTime 'goSMyycJ' \
    --status 'SUCCESS' \
    --transactionId '2BW77Wnu' \
    --userId 'OjzZdP4V' \
    > test.out 2>&1
eval_tap $? 166 'QueryRevocationHistories' test.out

#- 167 GetRevocationPluginConfig
./ng net.accelbyte.sdk.cli.Main platform getRevocationPluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 167 'GetRevocationPluginConfig' test.out

#- 168 UpdateRevocationPluginConfig
./ng net.accelbyte.sdk.cli.Main platform updateRevocationPluginConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appConfig": {"appName": "0StVJj2o"}, "customConfig": {"connectionType": "TLS", "grpcServerAddress": "pYrZacnJ"}, "extendType": "CUSTOM"}' \
    > test.out 2>&1
eval_tap $? 168 'UpdateRevocationPluginConfig' test.out

#- 169 DeleteRevocationPluginConfig
./ng net.accelbyte.sdk.cli.Main platform deleteRevocationPluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 169 'DeleteRevocationPluginConfig' test.out

#- 170 UploadRevocationPluginConfigCert
./ng net.accelbyte.sdk.cli.Main platform uploadRevocationPluginConfigCert \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 170 'UploadRevocationPluginConfigCert' test.out

#- 171 CreateReward
./ng net.accelbyte.sdk.cli.Main platform createReward \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "CtBRqer5", "eventTopic": "wA2dKaUR", "maxAwarded": 81, "maxAwardedPerUser": 22, "namespaceExpression": "MBW5Jx3o", "rewardCode": "fRKbvw7E", "rewardConditions": [{"condition": "ft6Y1CM3", "conditionName": "prPzmqPe", "eventName": "7YYYzqYW", "rewardItems": [{"duration": 5, "endDate": "1997-10-07T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "o9eqGRZl", "quantity": 58, "sku": "Da0t0pNO"}, {"duration": 74, "endDate": "1991-11-04T00:00:00Z", "identityType": "ITEM_ID", "itemId": "RTjrbZjF", "quantity": 38, "sku": "yCIVMIqS"}, {"duration": 90, "endDate": "1993-12-29T00:00:00Z", "identityType": "ITEM_ID", "itemId": "aElxrig2", "quantity": 32, "sku": "A3ABbZJ6"}]}, {"condition": "EycRe9uO", "conditionName": "dWNF1Rvx", "eventName": "jqMYLE6z", "rewardItems": [{"duration": 48, "endDate": "1980-05-23T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "amLwvHXa", "quantity": 37, "sku": "dFCW4WxP"}, {"duration": 57, "endDate": "1976-11-26T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "SudpVecK", "quantity": 22, "sku": "aTvVQ0TK"}, {"duration": 35, "endDate": "1980-06-28T00:00:00Z", "identityType": "ITEM_ID", "itemId": "4L6Mn4Wq", "quantity": 18, "sku": "vzxmy6kC"}]}, {"condition": "qzPwzIJQ", "conditionName": "EZpNzlWe", "eventName": "L3heoG9a", "rewardItems": [{"duration": 67, "endDate": "1978-01-21T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "NaIMKtv7", "quantity": 70, "sku": "x3l7gkpg"}, {"duration": 88, "endDate": "1999-03-12T00:00:00Z", "identityType": "ITEM_ID", "itemId": "J2ICSxtS", "quantity": 8, "sku": "GLKYBh06"}, {"duration": 14, "endDate": "1996-05-06T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "Io2T605x", "quantity": 87, "sku": "zt8PIFd0"}]}], "userIdExpression": "jwa8Upfw"}' \
    > test.out 2>&1
eval_tap $? 171 'CreateReward' test.out

#- 172 QueryRewards
./ng net.accelbyte.sdk.cli.Main platform queryRewards \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'Y0qwWRN4' \
    --limit '52' \
    --offset '76' \
    --sortBy 'rewardCode:desc,rewardCode:asc' \
    > test.out 2>&1
eval_tap $? 172 'QueryRewards' test.out

#- 173 ExportRewards
./ng net.accelbyte.sdk.cli.Main platform exportRewards \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 173 'ExportRewards' test.out

#- 174 ImportRewards
./ng net.accelbyte.sdk.cli.Main platform importRewards \
    --namespace "$AB_NAMESPACE" \
    --replaceExisting  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 174 'ImportRewards' test.out

#- 175 GetReward
./ng net.accelbyte.sdk.cli.Main platform getReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId '83KRZvbt' \
    > test.out 2>&1
eval_tap $? 175 'GetReward' test.out

#- 176 UpdateReward
./ng net.accelbyte.sdk.cli.Main platform updateReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'QOG9Dajk' \
    --body '{"description": "0XgCJUvS", "eventTopic": "RGX2ZRYC", "maxAwarded": 87, "maxAwardedPerUser": 57, "namespaceExpression": "P5a9BZPo", "rewardCode": "EnEUOTR6", "rewardConditions": [{"condition": "7lRKb8YS", "conditionName": "Q8RzIqfH", "eventName": "o4oeDqbX", "rewardItems": [{"duration": 30, "endDate": "1985-03-14T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "YdAxF3uK", "quantity": 61, "sku": "ugAO5DA8"}, {"duration": 83, "endDate": "1973-12-17T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "Sp8frnz5", "quantity": 78, "sku": "FSWvZYYj"}, {"duration": 85, "endDate": "1976-12-10T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "YAPOXWop", "quantity": 6, "sku": "vhdg8jRV"}]}, {"condition": "b4bc9BCd", "conditionName": "JsDB90fV", "eventName": "GJZHrqab", "rewardItems": [{"duration": 79, "endDate": "1987-07-09T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "85PnDj8N", "quantity": 48, "sku": "CKzPdngh"}, {"duration": 69, "endDate": "1979-03-20T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "N6ELtzna", "quantity": 89, "sku": "NoVV1984"}, {"duration": 45, "endDate": "1975-03-09T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "bMtVoIeg", "quantity": 69, "sku": "AAexgLvD"}]}, {"condition": "ECXwtySF", "conditionName": "lgRSy5l2", "eventName": "4oRZ4mIo", "rewardItems": [{"duration": 12, "endDate": "1990-04-10T00:00:00Z", "identityType": "ITEM_ID", "itemId": "tFyKhaCu", "quantity": 43, "sku": "LG66xSy1"}, {"duration": 48, "endDate": "1982-12-09T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "Cq8gqaP4", "quantity": 56, "sku": "4Zpc619g"}, {"duration": 3, "endDate": "1978-09-18T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "REWW676z", "quantity": 20, "sku": "NY5jujK6"}]}], "userIdExpression": "QaZNmhq6"}' \
    > test.out 2>&1
eval_tap $? 176 'UpdateReward' test.out

#- 177 DeleteReward
./ng net.accelbyte.sdk.cli.Main platform deleteReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'M43GoE3x' \
    > test.out 2>&1
eval_tap $? 177 'DeleteReward' test.out

#- 178 CheckEventCondition
./ng net.accelbyte.sdk.cli.Main platform checkEventCondition \
    --namespace "$AB_NAMESPACE" \
    --rewardId '2etXZXiJ' \
    --body '{"payload": {"lR7KTpjK": {}, "0DLzgkod": {}, "mtHGunoZ": {}}}' \
    > test.out 2>&1
eval_tap $? 178 'CheckEventCondition' test.out

#- 179 DeleteRewardConditionRecord
./ng net.accelbyte.sdk.cli.Main platform deleteRewardConditionRecord \
    --namespace "$AB_NAMESPACE" \
    --rewardId '6CbgmgfW' \
    --body '{"conditionName": "Zu7qn0zM", "userId": "LBIGLKy6"}' \
    > test.out 2>&1
eval_tap $? 179 'DeleteRewardConditionRecord' test.out

#- 180 QuerySections
./ng net.accelbyte.sdk.cli.Main platform querySections \
    --namespace "$AB_NAMESPACE" \
    --end 'aQfTTFja' \
    --limit '73' \
    --offset '65' \
    --start 'RnQbw0oe' \
    --storeId 'bLCjl4mh' \
    --viewId 'zwRzFiUq' \
    > test.out 2>&1
eval_tap $? 180 'QuerySections' test.out

#- 181 CreateSection
./ng net.accelbyte.sdk.cli.Main platform createSection \
    --namespace "$AB_NAMESPACE" \
    --storeId '9dzTuMLr' \
    --body '{"active": true, "displayOrder": 63, "endDate": "1985-12-19T00:00:00Z", "ext": {"7YUqSFIf": {}, "ZnxgxDSo": {}, "lJd54TfL": {}}, "fixedPeriodRotationConfig": {"backfillType": "CUSTOM", "duration": 25, "itemCount": 75, "rule": "SEQUENCE"}, "items": [{"id": "7OGm3PuV", "sku": "D6tb6CqG"}, {"id": "ViArclHs", "sku": "Dx0tRv0Q"}, {"id": "OGRS0LnB", "sku": "yep7Jxm9"}], "localizations": {"T3LEgWg1": {"description": "aREb3gye", "localExt": {"r8x9iFyZ": {}, "4Oaqsxgx": {}, "cqbEAgq6": {}}, "longDescription": "a7uKsrEE", "title": "XpFd4Rbx"}, "VEb2jmtG": {"description": "dUzmXA0W", "localExt": {"PIBl0s5k": {}, "jbRb5qR7": {}, "pFLReTKv": {}}, "longDescription": "jJ1LO5ck", "title": "WKudHLXm"}, "rEmXLzO8": {"description": "GXImg8k3", "localExt": {"6Kp326h3": {}, "x4jW8Irv": {}, "HmsFp5Cv": {}}, "longDescription": "zL3MNRp8", "title": "NXBGkhjw"}}, "name": "6sVoOpzW", "rotationType": "FIXED_PERIOD", "startDate": "1989-02-28T00:00:00Z", "viewId": "Q6NVopXD"}' \
    > test.out 2>&1
eval_tap $? 181 'CreateSection' test.out

#- 182 PurgeExpiredSection
./ng net.accelbyte.sdk.cli.Main platform purgeExpiredSection \
    --namespace "$AB_NAMESPACE" \
    --storeId 'LIWA3rT7' \
    > test.out 2>&1
eval_tap $? 182 'PurgeExpiredSection' test.out

#- 183 GetSection
./ng net.accelbyte.sdk.cli.Main platform getSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'kheN57sD' \
    --storeId 'jbBK8pk7' \
    > test.out 2>&1
eval_tap $? 183 'GetSection' test.out

#- 184 UpdateSection
./ng net.accelbyte.sdk.cli.Main platform updateSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'X0kIAC4M' \
    --storeId 'BwvOxZkX' \
    --body '{"active": true, "displayOrder": 36, "endDate": "1976-04-02T00:00:00Z", "ext": {"l7TIJ85Z": {}, "qKg8imMj": {}, "RmUOVb8w": {}}, "fixedPeriodRotationConfig": {"backfillType": "CUSTOM", "duration": 40, "itemCount": 33, "rule": "SEQUENCE"}, "items": [{"id": "IKd3EueT", "sku": "qzGyCWy5"}, {"id": "gFzHrVMy", "sku": "IWfECpiP"}, {"id": "pq8NDGPr", "sku": "TRWlcA3o"}], "localizations": {"yCDisx7f": {"description": "RT40YKzD", "localExt": {"OjrcQ2OC": {}, "ZlUG8uuJ": {}, "hEz920vX": {}}, "longDescription": "czNuGcHD", "title": "W37ZCeUl"}, "OJZUTgeq": {"description": "9Ta4fMb2", "localExt": {"n1la9c9W": {}, "A9a0MRa2": {}, "f1n8RAL2": {}}, "longDescription": "vTieTVto", "title": "36JpPN04"}, "keGBhFdX": {"description": "9ZyVFI4T", "localExt": {"Ymls27ef": {}, "mgYzF2G3": {}, "mRUGqDc6": {}}, "longDescription": "vqcYaEZr", "title": "rSE5BLUo"}}, "name": "Bt4xUGrQ", "rotationType": "NONE", "startDate": "1977-06-18T00:00:00Z", "viewId": "3caclcdO"}' \
    > test.out 2>&1
eval_tap $? 184 'UpdateSection' test.out

#- 185 DeleteSection
./ng net.accelbyte.sdk.cli.Main platform deleteSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'n8P0w94g' \
    --storeId 'iNxHoEly' \
    > test.out 2>&1
eval_tap $? 185 'DeleteSection' test.out

#- 186 ListStores
./ng net.accelbyte.sdk.cli.Main platform listStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 186 'ListStores' test.out

#- 187 CreateStore
./ng net.accelbyte.sdk.cli.Main platform createStore \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultLanguage": "wZl28Xi3", "defaultRegion": "pWpCHiSh", "description": "bHQc7Zmb", "supportedLanguages": ["mh3nor9W", "6iA6un6G", "5IPVfZF8"], "supportedRegions": ["KmZJwV4v", "tXP270BV", "n3HwFtAy"], "title": "6uRA9wDu"}' \
    > test.out 2>&1
eval_tap $? 187 'CreateStore' test.out

#- 188 GetCatalogDefinition
./ng net.accelbyte.sdk.cli.Main platform getCatalogDefinition \
    --namespace "$AB_NAMESPACE" \
    --catalogType 'CATEGORY' \
    > test.out 2>&1
eval_tap $? 188 'GetCatalogDefinition' test.out

#- 189 DownloadCSVTemplates
./ng net.accelbyte.sdk.cli.Main platform downloadCSVTemplates \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 189 'DownloadCSVTemplates' test.out

#- 190 ExportStoreByCSV
./ng net.accelbyte.sdk.cli.Main platform exportStoreByCSV \
    --namespace "$AB_NAMESPACE" \
    --body '{"catalogType": "VIEW", "fieldsToBeIncluded": ["hknSDX7t", "S8GksjM0", "haXyerpY"], "idsToBeExported": ["vM4qD3Hj", "sPFBwucm", "GG46Ajd0"], "storeId": "Qz819UbB"}' \
    > test.out 2>&1
eval_tap $? 190 'ExportStoreByCSV' test.out

#- 191 ImportStore
eval_tap 0 191 'ImportStore # SKIP deprecated' test.out

#- 192 GetPublishedStore
./ng net.accelbyte.sdk.cli.Main platform getPublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 192 'GetPublishedStore' test.out

#- 193 DeletePublishedStore
./ng net.accelbyte.sdk.cli.Main platform deletePublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 193 'DeletePublishedStore' test.out

#- 194 GetPublishedStoreBackup
./ng net.accelbyte.sdk.cli.Main platform getPublishedStoreBackup \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 194 'GetPublishedStoreBackup' test.out

#- 195 RollbackPublishedStore
./ng net.accelbyte.sdk.cli.Main platform rollbackPublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 195 'RollbackPublishedStore' test.out

#- 196 GetStore
./ng net.accelbyte.sdk.cli.Main platform getStore \
    --namespace "$AB_NAMESPACE" \
    --storeId '74H9Cf40' \
    > test.out 2>&1
eval_tap $? 196 'GetStore' test.out

#- 197 UpdateStore
./ng net.accelbyte.sdk.cli.Main platform updateStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'weLd52OF' \
    --body '{"defaultLanguage": "cPrAmScu", "defaultRegion": "1ntW0jar", "description": "JdYLHdHM", "supportedLanguages": ["cLB6s02V", "kM0QNFKl", "BjrPwRcD"], "supportedRegions": ["eBrNlcwU", "Gl2kM4IH", "I97EO7Xr"], "title": "ZOHCQg1k"}' \
    > test.out 2>&1
eval_tap $? 197 'UpdateStore' test.out

#- 198 DeleteStore
./ng net.accelbyte.sdk.cli.Main platform deleteStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'uLg2fvjy' \
    > test.out 2>&1
eval_tap $? 198 'DeleteStore' test.out

#- 199 QueryChanges
./ng net.accelbyte.sdk.cli.Main platform queryChanges \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ac0mypF3' \
    --action 'CREATE' \
    --itemSku '167ZOm6u' \
    --itemType 'SEASON' \
    --limit '59' \
    --offset '84' \
    --selected  \
    --sortBy 'createdAt:desc,createdAt:asc' \
    --status 'PUBLISHED' \
    --type 'STORE' \
    --updatedAtEnd 's7dDd5re' \
    --updatedAtStart 'VeskDFXW' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 199 'QueryChanges' test.out

#- 200 PublishAll
./ng net.accelbyte.sdk.cli.Main platform publishAll \
    --namespace "$AB_NAMESPACE" \
    --storeId 'tCSfwmXH' \
    > test.out 2>&1
eval_tap $? 200 'PublishAll' test.out

#- 201 PublishSelected
./ng net.accelbyte.sdk.cli.Main platform publishSelected \
    --namespace "$AB_NAMESPACE" \
    --storeId 'R5ZiTMDo' \
    > test.out 2>&1
eval_tap $? 201 'PublishSelected' test.out

#- 202 SelectAllRecords
./ng net.accelbyte.sdk.cli.Main platform selectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId '82ru6DWz' \
    > test.out 2>&1
eval_tap $? 202 'SelectAllRecords' test.out

#- 203 SelectAllRecordsByCriteria
./ng net.accelbyte.sdk.cli.Main platform selectAllRecordsByCriteria \
    --namespace "$AB_NAMESPACE" \
    --storeId 'pZjIIk08' \
    --action 'CREATE' \
    --itemSku 'SHFCf6IW' \
    --itemType 'CODE' \
    --selected  \
    --type 'VIEW' \
    --updatedAtEnd 'Ni3jtQyf' \
    --updatedAtStart 'LsUWcdoi' \
    > test.out 2>&1
eval_tap $? 203 'SelectAllRecordsByCriteria' test.out

#- 204 GetStatistic
./ng net.accelbyte.sdk.cli.Main platform getStatistic \
    --namespace "$AB_NAMESPACE" \
    --storeId '4iLuL6MF' \
    --action 'CREATE' \
    --itemSku 'q6c8ljZp' \
    --itemType 'INGAMEITEM' \
    --type 'CATEGORY' \
    --updatedAtEnd 'X8fRjXSL' \
    --updatedAtStart '5hMG2aO5' \
    > test.out 2>&1
eval_tap $? 204 'GetStatistic' test.out

#- 205 UnselectAllRecords
./ng net.accelbyte.sdk.cli.Main platform unselectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'XTh57hAZ' \
    > test.out 2>&1
eval_tap $? 205 'UnselectAllRecords' test.out

#- 206 SelectRecord
./ng net.accelbyte.sdk.cli.Main platform selectRecord \
    --changeId 'I3lT2rAu' \
    --namespace "$AB_NAMESPACE" \
    --storeId '0mj5b8eS' \
    > test.out 2>&1
eval_tap $? 206 'SelectRecord' test.out

#- 207 UnselectRecord
./ng net.accelbyte.sdk.cli.Main platform unselectRecord \
    --changeId 'yrtaSlPF' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'mj5m521t' \
    > test.out 2>&1
eval_tap $? 207 'UnselectRecord' test.out

#- 208 CloneStore
./ng net.accelbyte.sdk.cli.Main platform cloneStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'bLb35RCO' \
    --targetStoreId 'vQgrGnGg' \
    > test.out 2>&1
eval_tap $? 208 'CloneStore' test.out

#- 209 ExportStore
eval_tap 0 209 'ExportStore # SKIP deprecated' test.out

#- 210 QueryImportHistory
./ng net.accelbyte.sdk.cli.Main platform queryImportHistory \
    --namespace "$AB_NAMESPACE" \
    --storeId 'VhziOlTd' \
    --end 'rK0M4uyT' \
    --limit '3' \
    --offset '72' \
    --sortBy 'MJgSCqIF' \
    --start 'F7h4fPAO' \
    --success  \
    > test.out 2>&1
eval_tap $? 210 'QueryImportHistory' test.out

#- 211 ImportStoreByCSV
./ng net.accelbyte.sdk.cli.Main platform importStoreByCSV \
    --namespace "$AB_NAMESPACE" \
    --storeId 's6hQqQXa' \
    --category 'tmp.dat' \
    --display 'tmp.dat' \
    --item 'tmp.dat' \
    --notes 'Yh7DxMvL' \
    --section 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 211 'ImportStoreByCSV' test.out

#- 212 QuerySubscriptions
./ng net.accelbyte.sdk.cli.Main platform querySubscriptions \
    --namespace "$AB_NAMESPACE" \
    --chargeStatus 'RECURRING_CHARGING' \
    --itemId '35Xh8k4h' \
    --limit '92' \
    --offset '87' \
    --sku 'lo7Ld5Es' \
    --status 'EXPIRED' \
    --subscribedBy 'USER' \
    --userId 'i2WDn4e8' \
    > test.out 2>&1
eval_tap $? 212 'QuerySubscriptions' test.out

#- 213 RecurringChargeSubscription
./ng net.accelbyte.sdk.cli.Main platform recurringChargeSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'kT5EHS1D' \
    > test.out 2>&1
eval_tap $? 213 'RecurringChargeSubscription' test.out

#- 214 GetTicketDynamic
./ng net.accelbyte.sdk.cli.Main platform getTicketDynamic \
    --boothName 'yqNFSMyQ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 214 'GetTicketDynamic' test.out

#- 215 DecreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform decreaseTicketSale \
    --boothName 'GrNwU3cP' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "jjsAmtqm"}' \
    > test.out 2>&1
eval_tap $? 215 'DecreaseTicketSale' test.out

#- 216 GetTicketBoothID
./ng net.accelbyte.sdk.cli.Main platform getTicketBoothID \
    --boothName 'tan48ZRz' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 216 'GetTicketBoothID' test.out

#- 217 IncreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform increaseTicketSale \
    --boothName 'QIEV7JEe' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 8, "orderNo": "QsxpfT4G"}' \
    > test.out 2>&1
eval_tap $? 217 'IncreaseTicketSale' test.out

#- 218 Commit
./ng net.accelbyte.sdk.cli.Main platform commit \
    --namespace "$AB_NAMESPACE" \
    --body '{"actions": [{"operations": [{"creditPayload": {"balanceOrigin": "System", "count": 14, "currencyCode": "7wxHPbb3", "expireAt": "1981-10-23T00:00:00Z"}, "debitPayload": {"count": 57, "currencyCode": "lSaM9W92", "walletPlatform": "Playstation"}, "fulFillItemPayload": {"count": 85, "entitlementCollectionId": "kJmEmZXw", "entitlementOrigin": "Other", "itemIdentity": "3z1K84wD", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 27, "entitlementId": "Q1ReAEUy"}, "type": "FULFILL_ITEM"}, {"creditPayload": {"balanceOrigin": "Twitch", "count": 31, "currencyCode": "PdxVAlp5", "expireAt": "1977-10-18T00:00:00Z"}, "debitPayload": {"count": 88, "currencyCode": "XF0IaqCS", "walletPlatform": "Oculus"}, "fulFillItemPayload": {"count": 93, "entitlementCollectionId": "iH75rRex", "entitlementOrigin": "Epic", "itemIdentity": "GIsGpDoW", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 77, "entitlementId": "sgUzq7CS"}, "type": "DEBIT_WALLET"}, {"creditPayload": {"balanceOrigin": "Xbox", "count": 77, "currencyCode": "vMQ79eYd", "expireAt": "1972-12-30T00:00:00Z"}, "debitPayload": {"count": 40, "currencyCode": "vCf8K1ca", "walletPlatform": "Oculus"}, "fulFillItemPayload": {"count": 77, "entitlementCollectionId": "4HOsnLgb", "entitlementOrigin": "Oculus", "itemIdentity": "2SM704VG", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 24, "entitlementId": "LjH1w6Ay"}, "type": "FULFILL_ITEM"}], "userId": "Brl4O5g3"}, {"operations": [{"creditPayload": {"balanceOrigin": "Twitch", "count": 24, "currencyCode": "T7nAHUAu", "expireAt": "1997-02-03T00:00:00Z"}, "debitPayload": {"count": 73, "currencyCode": "WMogX7H2", "walletPlatform": "GooglePlay"}, "fulFillItemPayload": {"count": 0, "entitlementCollectionId": "58tcMWGY", "entitlementOrigin": "System", "itemIdentity": "w6NQxVbj", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 89, "entitlementId": "Q57lWwAM"}, "type": "FULFILL_ITEM"}, {"creditPayload": {"balanceOrigin": "Oculus", "count": 69, "currencyCode": "Ao8r4cbD", "expireAt": "1990-04-09T00:00:00Z"}, "debitPayload": {"count": 1, "currencyCode": "daDlsvdh", "walletPlatform": "Other"}, "fulFillItemPayload": {"count": 72, "entitlementCollectionId": "vT9UWPVf", "entitlementOrigin": "System", "itemIdentity": "oSQulpvQ", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 64, "entitlementId": "9zBvR7S8"}, "type": "REVOKE_ENTITLEMENT"}, {"creditPayload": {"balanceOrigin": "Twitch", "count": 55, "currencyCode": "7IRur7Xj", "expireAt": "1973-02-06T00:00:00Z"}, "debitPayload": {"count": 60, "currencyCode": "2Q0HTVUw", "walletPlatform": "Nintendo"}, "fulFillItemPayload": {"count": 63, "entitlementCollectionId": "YzwHWFqf", "entitlementOrigin": "Playstation", "itemIdentity": "Mbdk23PL", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 37, "entitlementId": "1kLXKPUT"}, "type": "REVOKE_ENTITLEMENT"}], "userId": "Wj9w2vCz"}, {"operations": [{"creditPayload": {"balanceOrigin": "Nintendo", "count": 44, "currencyCode": "Jx9ucLb8", "expireAt": "1976-10-27T00:00:00Z"}, "debitPayload": {"count": 61, "currencyCode": "R1GIgLTp", "walletPlatform": "Nintendo"}, "fulFillItemPayload": {"count": 59, "entitlementCollectionId": "8cqMtklM", "entitlementOrigin": "Steam", "itemIdentity": "Jk0KbwA7", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 80, "entitlementId": "KfkN1tsP"}, "type": "DEBIT_WALLET"}, {"creditPayload": {"balanceOrigin": "Twitch", "count": 17, "currencyCode": "raPrYVfk", "expireAt": "1988-01-31T00:00:00Z"}, "debitPayload": {"count": 64, "currencyCode": "0pR82PUl", "walletPlatform": "Nintendo"}, "fulFillItemPayload": {"count": 20, "entitlementCollectionId": "FtZG40Sr", "entitlementOrigin": "Oculus", "itemIdentity": "ryxA2bRi", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 38, "entitlementId": "fpuOMNRM"}, "type": "FULFILL_ITEM"}, {"creditPayload": {"balanceOrigin": "Twitch", "count": 27, "currencyCode": "YjBeefKv", "expireAt": "1974-06-27T00:00:00Z"}, "debitPayload": {"count": 5, "currencyCode": "64OHMj9I", "walletPlatform": "Other"}, "fulFillItemPayload": {"count": 93, "entitlementCollectionId": "jfUNVYQN", "entitlementOrigin": "Xbox", "itemIdentity": "ckBLaXny", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 73, "entitlementId": "SAiVjbcu"}, "type": "FULFILL_ITEM"}], "userId": "bCtIfQgD"}], "metadata": {"rgGw5EnZ": {}, "sGQJ3Dey": {}, "b60s7Yqw": {}}, "needPreCheck": false, "transactionId": "3qQntawB", "type": "tObwv9X3"}' \
    > test.out 2>&1
eval_tap $? 218 'Commit' test.out

#- 219 GetTradeHistoryByCriteria
./ng net.accelbyte.sdk.cli.Main platform getTradeHistoryByCriteria \
    --namespace "$AB_NAMESPACE" \
    --limit '21' \
    --offset '73' \
    --status 'SUCCESS' \
    --type 'Ifrqb4Cv' \
    --userId 'wnKqfRy2' \
    > test.out 2>&1
eval_tap $? 219 'GetTradeHistoryByCriteria' test.out

#- 220 GetTradeHistoryByTransactionId
./ng net.accelbyte.sdk.cli.Main platform getTradeHistoryByTransactionId \
    --namespace "$AB_NAMESPACE" \
    --transactionId 'S9Y6iBS2' \
    > test.out 2>&1
eval_tap $? 220 'GetTradeHistoryByTransactionId' test.out

#- 221 UnlockSteamUserAchievement
./ng net.accelbyte.sdk.cli.Main platform unlockSteamUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId '8c8ADGGa' \
    --body '{"achievements": [{"id": "9MGBdD5N", "value": 94}, {"id": "3joQTQS1", "value": 89}, {"id": "5ooZspoy", "value": 25}], "steamUserId": "8ml0K1El"}' \
    > test.out 2>&1
eval_tap $? 221 'UnlockSteamUserAchievement' test.out

#- 222 GetXblUserAchievements
./ng net.accelbyte.sdk.cli.Main platform getXblUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId '5MCiwbDS' \
    --xboxUserId 'SZ8FyWuj' \
    > test.out 2>&1
eval_tap $? 222 'GetXblUserAchievements' test.out

#- 223 UpdateXblUserAchievement
./ng net.accelbyte.sdk.cli.Main platform updateXblUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'sL3Ja4xm' \
    --body '{"achievements": [{"id": "ADy6XzYj", "percentComplete": 28}, {"id": "LuR3q7LP", "percentComplete": 70}, {"id": "3dAMoj1D", "percentComplete": 6}], "serviceConfigId": "y86PFEqh", "titleId": "XX6by3CO", "xboxUserId": "xI2uHaTE"}' \
    > test.out 2>&1
eval_tap $? 223 'UpdateXblUserAchievement' test.out

#- 224 AnonymizeCampaign
./ng net.accelbyte.sdk.cli.Main platform anonymizeCampaign \
    --namespace "$AB_NAMESPACE" \
    --userId '86AXqPQZ' \
    > test.out 2>&1
eval_tap $? 224 'AnonymizeCampaign' test.out

#- 225 AnonymizeEntitlement
./ng net.accelbyte.sdk.cli.Main platform anonymizeEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'WkHnZpi7' \
    > test.out 2>&1
eval_tap $? 225 'AnonymizeEntitlement' test.out

#- 226 AnonymizeFulfillment
./ng net.accelbyte.sdk.cli.Main platform anonymizeFulfillment \
    --namespace "$AB_NAMESPACE" \
    --userId 'e94i6pLI' \
    > test.out 2>&1
eval_tap $? 226 'AnonymizeFulfillment' test.out

#- 227 AnonymizeIntegration
./ng net.accelbyte.sdk.cli.Main platform anonymizeIntegration \
    --namespace "$AB_NAMESPACE" \
    --userId 'b1wsJB1f' \
    > test.out 2>&1
eval_tap $? 227 'AnonymizeIntegration' test.out

#- 228 AnonymizeOrder
./ng net.accelbyte.sdk.cli.Main platform anonymizeOrder \
    --namespace "$AB_NAMESPACE" \
    --userId '6Z8HfhEN' \
    > test.out 2>&1
eval_tap $? 228 'AnonymizeOrder' test.out

#- 229 AnonymizePayment
./ng net.accelbyte.sdk.cli.Main platform anonymizePayment \
    --namespace "$AB_NAMESPACE" \
    --userId '4iXv5YnD' \
    > test.out 2>&1
eval_tap $? 229 'AnonymizePayment' test.out

#- 230 AnonymizeRevocation
./ng net.accelbyte.sdk.cli.Main platform anonymizeRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId '8TuEAoCL' \
    > test.out 2>&1
eval_tap $? 230 'AnonymizeRevocation' test.out

#- 231 AnonymizeSubscription
./ng net.accelbyte.sdk.cli.Main platform anonymizeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'Pm0d7T8s' \
    > test.out 2>&1
eval_tap $? 231 'AnonymizeSubscription' test.out

#- 232 AnonymizeWallet
./ng net.accelbyte.sdk.cli.Main platform anonymizeWallet \
    --namespace "$AB_NAMESPACE" \
    --userId 'ovQNoyvM' \
    > test.out 2>&1
eval_tap $? 232 'AnonymizeWallet' test.out

#- 233 GetUserDLCByPlatform
./ng net.accelbyte.sdk.cli.Main platform getUserDLCByPlatform \
    --namespace "$AB_NAMESPACE" \
    --userId 'P74qAOk6' \
    --type 'STEAM' \
    > test.out 2>&1
eval_tap $? 233 'GetUserDLCByPlatform' test.out

#- 234 GetUserDLC
./ng net.accelbyte.sdk.cli.Main platform getUserDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'tCFkppGc' \
    --type 'STEAM' \
    > test.out 2>&1
eval_tap $? 234 'GetUserDLC' test.out

#- 235 QueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId '46IPn9CD' \
    --activeOnly  \
    --appType 'DLC' \
    --collectionId 'bnolaJa6' \
    --entitlementClazz 'SUBSCRIPTION' \
    --entitlementName 'GgQdNULR' \
    --features 'qTZq9Eza,0rKL6Txg,bHDgcCIb' \
    --fuzzyMatchName  \
    --itemId 'lbPFbfI2,KnmP5Kum,ly5RqcGA' \
    --limit '74' \
    --offset '77' \
    --origin 'Oculus' \
    > test.out 2>&1
eval_tap $? 235 'QueryUserEntitlements' test.out

#- 236 GrantUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform grantUserEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId '6QVOTO3F' \
    --body '[{"collectionId": "3r654Eoy", "endDate": "1975-01-31T00:00:00Z", "grantedCode": "S0CepvPg", "itemId": "guEtA8ZC", "itemNamespace": "56iYAhO4", "language": "lmxv_bRHR", "origin": "Oculus", "quantity": 97, "region": "TGd4d7ko", "source": "IAP", "startDate": "1991-01-26T00:00:00Z", "storeId": "WNrj3cOS"}, {"collectionId": "EDv509V3", "endDate": "1973-08-15T00:00:00Z", "grantedCode": "nfthIOn6", "itemId": "86adqgv3", "itemNamespace": "g0OjT8Pu", "language": "NCs-ziFz_Eo", "origin": "Xbox", "quantity": 100, "region": "vBJICK7H", "source": "IAP", "startDate": "1996-12-05T00:00:00Z", "storeId": "RwEMXLQE"}, {"collectionId": "VhxV1fzp", "endDate": "1999-02-15T00:00:00Z", "grantedCode": "oauh1A30", "itemId": "Bdfps4Tg", "itemNamespace": "ec6QyGYF", "language": "Dm", "origin": "Other", "quantity": 86, "region": "xV66CyZM", "source": "OTHER", "startDate": "1984-02-17T00:00:00Z", "storeId": "91NKwyov"}]' \
    > test.out 2>&1
eval_tap $? 236 'GrantUserEntitlement' test.out

#- 237 GetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'R2QlMtsn' \
    --activeOnly  \
    --appId '292NDAdC' \
    > test.out 2>&1
eval_tap $? 237 'GetUserAppEntitlementByAppId' test.out

#- 238 QueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'sRP8t1eq' \
    --activeOnly  \
    --limit '17' \
    --offset '78' \
    --appType 'DLC' \
    > test.out 2>&1
eval_tap $? 238 'QueryUserEntitlementsByAppType' test.out

#- 239 GetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'Z4NBoawY' \
    --activeOnly  \
    --entitlementClazz 'OPTIONBOX' \
    --platform 'o1ZOOHYr' \
    --itemId 'WXCcFOI0' \
    > test.out 2>&1
eval_tap $? 239 'GetUserEntitlementByItemId' test.out

#- 240 GetUserActiveEntitlementsByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserActiveEntitlementsByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'essclEZf' \
    --ids 'bmF6S5MS,n1HVWu5P,CgxYIjHt' \
    --platform 'maKFcrjC' \
    > test.out 2>&1
eval_tap $? 240 'GetUserActiveEntitlementsByItemIds' test.out

#- 241 GetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'TLbhwT1r' \
    --activeOnly  \
    --entitlementClazz 'MEDIA' \
    --platform 'UAnD2ebJ' \
    --sku 'BjiCxIZ1' \
    > test.out 2>&1
eval_tap $? 241 'GetUserEntitlementBySku' test.out

#- 242 ExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'gQaKuTtY' \
    --appIds 'yZQH3Psw,6tyFrjzi,1lxwO3Nh' \
    --itemIds 'WLerLmCn,Ui26DvJf,46a10Hao' \
    --platform 'sE1Tj40B' \
    --skus '7GhizG3V,TlCqK24u,WZgPErwe' \
    > test.out 2>&1
eval_tap $? 242 'ExistsAnyUserActiveEntitlement' test.out

#- 243 ExistsAnyUserActiveEntitlementByItemIds
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlementByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'LrdS8IpE' \
    --platform 'CdEVjuzq' \
    --itemIds 'cuvy0ODF,vCFtUDs0,ql5sfjwN' \
    > test.out 2>&1
eval_tap $? 243 'ExistsAnyUserActiveEntitlementByItemIds' test.out

#- 244 GetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'myhgj83z' \
    --appId 'SUKamUUf' \
    > test.out 2>&1
eval_tap $? 244 'GetUserAppEntitlementOwnershipByAppId' test.out

#- 245 GetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'c5k8vDWW' \
    --entitlementClazz 'CODE' \
    --platform 'lOHHyJvf' \
    --itemId 'grss4PNZ' \
    > test.out 2>&1
eval_tap $? 245 'GetUserEntitlementOwnershipByItemId' test.out

#- 246 GetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'IUooF7ZE' \
    --ids 'Cz1KqCim,vaicDy7k,OY4JeGQE' \
    --platform 'GPAMNlL5' \
    > test.out 2>&1
eval_tap $? 246 'GetUserEntitlementOwnershipByItemIds' test.out

#- 247 GetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'rAAiGlko' \
    --entitlementClazz 'OPTIONBOX' \
    --platform 'v53RbO92' \
    --sku 'JPXH1DDJ' \
    > test.out 2>&1
eval_tap $? 247 'GetUserEntitlementOwnershipBySku' test.out

#- 248 RevokeAllEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeAllEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'eXZUs9JM' \
    > test.out 2>&1
eval_tap $? 248 'RevokeAllEntitlements' test.out

#- 249 RevokeUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'KixENOW8' \
    --entitlementIds 's9L24Zqp' \
    > test.out 2>&1
eval_tap $? 249 'RevokeUserEntitlements' test.out

#- 250 GetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlement \
    --entitlementId 'A2WDoHDZ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'MQY1Xs19' \
    > test.out 2>&1
eval_tap $? 250 'GetUserEntitlement' test.out

#- 251 UpdateUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform updateUserEntitlement \
    --entitlementId 'EP9xoj99' \
    --namespace "$AB_NAMESPACE" \
    --userId 'NgCd2p6n' \
    --body '{"collectionId": "JjYZmSzP", "endDate": "1997-08-27T00:00:00Z", "nullFieldList": ["Jc7n9kah", "GP3sEp5a", "PsP7r2Dh"], "origin": "Nintendo", "reason": "dypEHhq7", "startDate": "1974-06-11T00:00:00Z", "status": "ACTIVE", "useCount": 19}' \
    > test.out 2>&1
eval_tap $? 251 'UpdateUserEntitlement' test.out

#- 252 ConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform consumeUserEntitlement \
    --entitlementId 'aMrng8hw' \
    --namespace "$AB_NAMESPACE" \
    --userId 'pT0bpHXV' \
    --body '{"options": ["WNJcQc2e", "KlcrdF5A", "dQdbaYlE"], "platform": "ZVEL0Gef", "requestId": "lIlRU997", "useCount": 57}' \
    > test.out 2>&1
eval_tap $? 252 'ConsumeUserEntitlement' test.out

#- 253 DisableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform disableUserEntitlement \
    --entitlementId 'G2Eo79K5' \
    --namespace "$AB_NAMESPACE" \
    --userId 'fazCa6RN' \
    > test.out 2>&1
eval_tap $? 253 'DisableUserEntitlement' test.out

#- 254 EnableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform enableUserEntitlement \
    --entitlementId 'wMZigfva' \
    --namespace "$AB_NAMESPACE" \
    --userId 'qCsgZvJB' \
    > test.out 2>&1
eval_tap $? 254 'EnableUserEntitlement' test.out

#- 255 GetUserEntitlementHistories
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementHistories \
    --entitlementId 'uXGZ5KLO' \
    --namespace "$AB_NAMESPACE" \
    --userId 'JTUJ1VjH' \
    > test.out 2>&1
eval_tap $? 255 'GetUserEntitlementHistories' test.out

#- 256 RevokeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlement \
    --entitlementId 'iIPodrs1' \
    --namespace "$AB_NAMESPACE" \
    --userId 'eMJgRwam' \
    > test.out 2>&1
eval_tap $? 256 'RevokeUserEntitlement' test.out

#- 257 RevokeUserEntitlementByUseCount
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlementByUseCount \
    --entitlementId 'QCDn3yDS' \
    --namespace "$AB_NAMESPACE" \
    --userId 'FpQdCbQT' \
    --body '{"reason": "F3sIemuI", "useCount": 60}' \
    > test.out 2>&1
eval_tap $? 257 'RevokeUserEntitlementByUseCount' test.out

#- 258 PreCheckRevokeUserEntitlementByUseCount
./ng net.accelbyte.sdk.cli.Main platform preCheckRevokeUserEntitlementByUseCount \
    --entitlementId 'sR9b5mg0' \
    --namespace "$AB_NAMESPACE" \
    --userId 'kMcwrqBh' \
    --quantity '56' \
    > test.out 2>&1
eval_tap $? 258 'PreCheckRevokeUserEntitlementByUseCount' test.out

#- 259 RevokeUseCount
eval_tap 0 259 'RevokeUseCount # SKIP deprecated' test.out

#- 260 SellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform sellUserEntitlement \
    --entitlementId 'eSlv3SQy' \
    --namespace "$AB_NAMESPACE" \
    --userId '0bvU4HI5' \
    --body '{"platform": "xGBdTZyC", "requestId": "uf3Dvv42", "useCount": 84}' \
    > test.out 2>&1
eval_tap $? 260 'SellUserEntitlement' test.out

#- 261 FulfillItem
./ng net.accelbyte.sdk.cli.Main platform fulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'iVIDkwO6' \
    --body '{"duration": 56, "endDate": "1972-01-27T00:00:00Z", "entitlementCollectionId": "7l9S1Luu", "entitlementOrigin": "System", "itemId": "jSmdYcC3", "itemSku": "QJ0ShnX7", "language": "3AJQNR0v", "metadata": {"X6jQM9x4": {}, "NzcwF2Ox": {}, "wMAzeNlN": {}}, "order": {"currency": {"currencyCode": "vDCkkSa9", "currencySymbol": "NY0fme52", "currencyType": "REAL", "decimals": 2, "namespace": "GHw5RebT"}, "ext": {"OIThGWBC": {}, "SuPPnw67": {}, "RRT6oB5o": {}}, "free": false}, "orderNo": "KC9ZboRv", "origin": "Playstation", "overrideBundleItemQty": {"3yWVYfqz": 28, "rFSWp8AK": 11, "F0Z8pqAb": 61}, "quantity": 17, "region": "ifOxOJx3", "source": "DLC", "startDate": "1973-01-05T00:00:00Z", "storeId": "apbjRT80"}' \
    > test.out 2>&1
eval_tap $? 261 'FulfillItem' test.out

#- 262 RedeemCode
./ng net.accelbyte.sdk.cli.Main platform redeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'NLREOXBw' \
    --body '{"code": "UypCPtbj", "language": "Ghju-368", "region": "5lNa2KCg"}' \
    > test.out 2>&1
eval_tap $? 262 'RedeemCode' test.out

#- 263 PreCheckFulfillItem
./ng net.accelbyte.sdk.cli.Main platform preCheckFulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId '1QA6L0vv' \
    --body '{"itemId": "kM5dRLDV", "itemSku": "BwTRFTw3", "quantity": 92}' \
    > test.out 2>&1
eval_tap $? 263 'PreCheckFulfillItem' test.out

#- 264 FulfillRewards
./ng net.accelbyte.sdk.cli.Main platform fulfillRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'CHJVFifk' \
    --body '{"entitlementCollectionId": "qSKS6VSy", "entitlementOrigin": "Epic", "metadata": {"KkUnRANm": {}, "VBqzNtds": {}, "YQ7qqb4d": {}}, "origin": "Other", "rewards": [{"currency": {"currencyCode": "sscjxdwL", "namespace": "lOvC2NNN"}, "item": {"itemId": "OqlkaDyg", "itemSku": "VvNyC3DL", "itemType": "PXke3PIH"}, "quantity": 91, "type": "CURRENCY"}, {"currency": {"currencyCode": "J3jEcLWK", "namespace": "IUCOgiQh"}, "item": {"itemId": "y5Jroopb", "itemSku": "YDjzyEyn", "itemType": "xmdnVgAh"}, "quantity": 55, "type": "ITEM"}, {"currency": {"currencyCode": "LDpaPBGL", "namespace": "G21dc8E6"}, "item": {"itemId": "F4vVIaTL", "itemSku": "DYwvI4XT", "itemType": "BEPi5rqa"}, "quantity": 75, "type": "ITEM"}], "source": "OTHER", "transactionId": "N868qG3W"}' \
    > test.out 2>&1
eval_tap $? 264 'FulfillRewards' test.out

#- 265 QueryUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'hUlWsjRU' \
    --endTime 'tJVMjlr7' \
    --limit '53' \
    --offset '2' \
    --productId 'VO7zm5WP' \
    --startTime 'mefWZrmD' \
    --status 'FULFILLED' \
    --type 'XBOX' \
    > test.out 2>&1
eval_tap $? 265 'QueryUserIAPOrders' test.out

#- 266 QueryAllUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryAllUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId '11L3K8Lc' \
    > test.out 2>&1
eval_tap $? 266 'QueryAllUserIAPOrders' test.out

#- 267 QueryUserIAPConsumeHistory
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPConsumeHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'kUy4v7w6' \
    --endTime '2fHuSVH2' \
    --limit '62' \
    --offset '98' \
    --startTime 'Ks2sFs0M' \
    --status 'FAIL' \
    --type 'XBOX' \
    > test.out 2>&1
eval_tap $? 267 'QueryUserIAPConsumeHistory' test.out

#- 268 MockFulfillIAPItem
./ng net.accelbyte.sdk.cli.Main platform mockFulfillIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'BTDA1N8g' \
    --body '{"itemIdentityType": "ITEM_SKU", "language": "pQFI-gDYP", "productId": "vrfDjTM1", "region": "A4xfBU0a", "transactionId": "sI2yLYFC", "type": "STADIA"}' \
    > test.out 2>&1
eval_tap $? 268 'MockFulfillIAPItem' test.out

#- 269 QueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'Xwjx3Wz4' \
    --discounted  \
    --itemId '0yFsgA4D' \
    --limit '59' \
    --offset '85' \
    --status 'REFUNDING' \
    > test.out 2>&1
eval_tap $? 269 'QueryUserOrders' test.out

#- 270 AdminCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform adminCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZQlCkP4P' \
    --body '{"currencyCode": "FRkwWY3t", "currencyNamespace": "DWwUzz62", "discountCodes": ["2YRCwhOU", "2q9xcmXV", "PsEMiHt7"], "discountedPrice": 17, "entitlementPlatform": "Nintendo", "ext": {"4GKPb05G": {}, "ZjJ2OPVg": {}, "RNYTnL6n": {}}, "itemId": "Tm6DhTVw", "language": "qfKm2UXG", "options": {"skipPriceValidation": false}, "platform": "GooglePlay", "price": 16, "quantity": 79, "region": "AqznxdRt", "returnUrl": "ZaUrWt8U", "sandbox": false, "sectionId": "WyY8Dt4s"}' \
    > test.out 2>&1
eval_tap $? 270 'AdminCreateUserOrder' test.out

#- 271 CountOfPurchasedItem
./ng net.accelbyte.sdk.cli.Main platform countOfPurchasedItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'UHnV1NE8' \
    --itemId 'Ed5zO1Sc' \
    > test.out 2>&1
eval_tap $? 271 'CountOfPurchasedItem' test.out

#- 272 GetUserOrder
./ng net.accelbyte.sdk.cli.Main platform getUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'tYeHmOhj' \
    --userId 'DtyUPwuH' \
    > test.out 2>&1
eval_tap $? 272 'GetUserOrder' test.out

#- 273 UpdateUserOrderStatus
./ng net.accelbyte.sdk.cli.Main platform updateUserOrderStatus \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'G2oJI3pJ' \
    --userId 'FjnyMqh8' \
    --body '{"status": "FULFILL_FAILED", "statusReason": "SbVRzpGH"}' \
    > test.out 2>&1
eval_tap $? 273 'UpdateUserOrderStatus' test.out

#- 274 FulfillUserOrder
./ng net.accelbyte.sdk.cli.Main platform fulfillUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo '9vppgv2C' \
    --userId 'BZ4gE3a8' \
    > test.out 2>&1
eval_tap $? 274 'FulfillUserOrder' test.out

#- 275 GetUserOrderGrant
eval_tap 0 275 'GetUserOrderGrant # SKIP deprecated' test.out

#- 276 GetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform getUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo '3AG1z3Gy' \
    --userId 'jiXAH5jH' \
    > test.out 2>&1
eval_tap $? 276 'GetUserOrderHistories' test.out

#- 277 ProcessUserOrderNotification
./ng net.accelbyte.sdk.cli.Main platform processUserOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'qgBF5TyV' \
    --userId '1bCPQZzH' \
    --body '{"additionalData": {"cardSummary": "yEgagB90"}, "authorisedTime": "1997-10-12T00:00:00Z", "chargebackReversedTime": "1975-08-18T00:00:00Z", "chargebackTime": "1971-03-13T00:00:00Z", "chargedTime": "1977-07-01T00:00:00Z", "createdTime": "1998-10-24T00:00:00Z", "currency": {"currencyCode": "BrUeGXFj", "currencySymbol": "hxNwNxbZ", "currencyType": "VIRTUAL", "decimals": 70, "namespace": "4zakyw4q"}, "customParameters": {"0jNIxKEQ": {}, "JvntzrgA": {}, "xqrRayUU": {}}, "extOrderNo": "uSBCiL2H", "extTxId": "0w72GZJQ", "extUserId": "TdyDUAv9", "issuedAt": "1989-09-11T00:00:00Z", "metadata": {"FFM5AkF4": "7lvzzF1F", "uPz0f3sk": "8NJeUBD3", "ZzFpoN1R": "eTh3afEW"}, "namespace": "qHuyriVx", "nonceStr": "axvIWyrU", "paymentMethod": "JNzRdGhw", "paymentMethodFee": 50, "paymentOrderNo": "Whj0WbN1", "paymentProvider": "ALIPAY", "paymentProviderFee": 64, "paymentStationUrl": "vXGioAWP", "price": 53, "refundedTime": "1975-05-27T00:00:00Z", "salesTax": 10, "sandbox": false, "sku": "P16ZVnNW", "status": "REFUNDING", "statusReason": "VAOxegTD", "subscriptionId": "jncXcUFo", "subtotalPrice": 17, "targetNamespace": "gHLb1gO2", "targetUserId": "0LsVEngA", "tax": 66, "totalPrice": 40, "totalTax": 40, "txEndTime": "1972-05-01T00:00:00Z", "type": "R6W3XxTo", "userId": "MZUPDQSU", "vat": 78}' \
    > test.out 2>&1
eval_tap $? 277 'ProcessUserOrderNotification' test.out

#- 278 DownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform downloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'wh6kitsZ' \
    --userId 'ZzSzFtV0' \
    > test.out 2>&1
eval_tap $? 278 'DownloadUserOrderReceipt' test.out

#- 279 CreateUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform createUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'akHoBUiX' \
    --body '{"currencyCode": "oA4pgWiw", "currencyNamespace": "68P4WdK3", "customParameters": {"aQBZZqBi": {}, "FqHtQSFj": {}, "RKn8gLL6": {}}, "description": "jm00fXKF", "extOrderNo": "q3qPL3cZ", "extUserId": "8tiWN8m3", "itemType": "APP", "language": "NMzF-HaDF", "metadata": {"oLd4I7c8": "kwSlEPEA", "q72DvV76": "FvcZ8PZL", "r73msxU3": "L6GeDVcP"}, "notifyUrl": "kD7uY4Xv", "omitNotification": true, "platform": "U9lAzALw", "price": 42, "recurringPaymentOrderNo": "FRRF0lqM", "region": "81NBoE7H", "returnUrl": "GWFF5JjL", "sandbox": false, "sku": "Eb1BPWQH", "subscriptionId": "t5mbFEe8", "title": "8osOH8T5"}' \
    > test.out 2>&1
eval_tap $? 279 'CreateUserPaymentOrder' test.out

#- 280 RefundUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform refundUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'DWVxonUB' \
    --userId 'dIIG6WEU' \
    --body '{"description": "Pxnu7Ha1"}' \
    > test.out 2>&1
eval_tap $? 280 'RefundUserPaymentOrder' test.out

#- 281 ApplyUserRedemption
./ng net.accelbyte.sdk.cli.Main platform applyUserRedemption \
    --namespace "$AB_NAMESPACE" \
    --userId 'ATD4jGVw' \
    --body '{"code": "YeSvAOiY", "orderNo": "Rpi0iR6q"}' \
    > test.out 2>&1
eval_tap $? 281 'ApplyUserRedemption' test.out

#- 282 DoRevocation
./ng net.accelbyte.sdk.cli.Main platform doRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId 'M1W0TIdx' \
    --body '{"meta": {"Vf7pqGRE": {}, "vasRV9u9": {}, "Bpink4hz": {}}, "revokeEntries": [{"currency": {"balanceOrigin": "Playstation", "currencyCode": "9se8eB7m", "namespace": "1XzDyS2d"}, "entitlement": {"entitlementId": "zjBSnk2F"}, "item": {"entitlementOrigin": "Steam", "itemIdentity": "J03wSuaW", "itemIdentityType": "ITEM_ID", "origin": "Steam"}, "quantity": 0, "type": "CURRENCY"}, {"currency": {"balanceOrigin": "GooglePlay", "currencyCode": "KyoJWjXn", "namespace": "Ai1zH0Iz"}, "entitlement": {"entitlementId": "KQ5ok3mO"}, "item": {"entitlementOrigin": "Twitch", "itemIdentity": "jO2D5iOa", "itemIdentityType": "ITEM_SKU", "origin": "System"}, "quantity": 67, "type": "ITEM"}, {"currency": {"balanceOrigin": "Steam", "currencyCode": "JeIUi7TN", "namespace": "VjhSK0e8"}, "entitlement": {"entitlementId": "w3LCzSVz"}, "item": {"entitlementOrigin": "Playstation", "itemIdentity": "ihp1Odyc", "itemIdentityType": "ITEM_ID", "origin": "Twitch"}, "quantity": 64, "type": "CURRENCY"}], "source": "IAP", "transactionId": "z8q5B3kA"}' \
    > test.out 2>&1
eval_tap $? 282 'DoRevocation' test.out

#- 283 RegisterXblSessions
./ng net.accelbyte.sdk.cli.Main platform registerXblSessions \
    --namespace "$AB_NAMESPACE" \
    --userId 'eI9ZRcPo' \
    --body '{"gameSessionId": "UzF3FEsO", "payload": {"RxPoaVtp": {}, "H27NA7Xi": {}, "CMAuyCqc": {}}, "scid": "4obcfil0", "sessionTemplateName": "9EqroQJL"}' \
    > test.out 2>&1
eval_tap $? 283 'RegisterXblSessions' test.out

#- 284 QueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform queryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'toQtd8qB' \
    --chargeStatus 'NEVER' \
    --itemId 'PeEQrWau' \
    --limit '59' \
    --offset '11' \
    --sku 'UaAA1cqF' \
    --status 'INIT' \
    --subscribedBy 'USER' \
    > test.out 2>&1
eval_tap $? 284 'QueryUserSubscriptions' test.out

#- 285 GetUserSubscriptionActivities
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionActivities \
    --namespace "$AB_NAMESPACE" \
    --userId 'YtFpzVD3' \
    --excludeSystem  \
    --limit '31' \
    --offset '74' \
    --subscriptionId 'v4QpdFIS' \
    > test.out 2>&1
eval_tap $? 285 'GetUserSubscriptionActivities' test.out

#- 286 PlatformSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform platformSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'XatWtJqm' \
    --body '{"grantDays": 54, "itemId": "mUqVmi9d", "language": "62Rj5tLR", "reason": "McIbMK9u", "region": "vtvxgRZt", "source": "iEFxznBC"}' \
    > test.out 2>&1
eval_tap $? 286 'PlatformSubscribeSubscription' test.out

#- 287 CheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform checkUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId '37G8bQHB' \
    --itemId 'aQ0wbwGL' \
    > test.out 2>&1
eval_tap $? 287 'CheckUserSubscriptionSubscribableByItemId' test.out

#- 288 GetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform getUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'x6d9gUzH' \
    --userId 'LLi8uvFM' \
    > test.out 2>&1
eval_tap $? 288 'GetUserSubscription' test.out

#- 289 DeleteUserSubscription
./ng net.accelbyte.sdk.cli.Main platform deleteUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '3Ig5f5jA' \
    --userId 'IdE5dj3b' \
    > test.out 2>&1
eval_tap $? 289 'DeleteUserSubscription' test.out

#- 290 CancelSubscription
./ng net.accelbyte.sdk.cli.Main platform cancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'QCVqlf7u' \
    --userId 'Ncc4GsO1' \
    --force  \
    --body '{"immediate": false, "reason": "jKWW4FDN"}' \
    > test.out 2>&1
eval_tap $? 290 'CancelSubscription' test.out

#- 291 GrantDaysToSubscription
./ng net.accelbyte.sdk.cli.Main platform grantDaysToSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'rQerYA21' \
    --userId '4rQTBXju' \
    --body '{"grantDays": 96, "reason": "Nh6PxGnf"}' \
    > test.out 2>&1
eval_tap $? 291 'GrantDaysToSubscription' test.out

#- 292 GetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'rQnYjDYl' \
    --userId 'IWuFpSyA' \
    --excludeFree  \
    --limit '66' \
    --offset '40' \
    > test.out 2>&1
eval_tap $? 292 'GetUserSubscriptionBillingHistories' test.out

#- 293 ProcessUserSubscriptionNotification
./ng net.accelbyte.sdk.cli.Main platform processUserSubscriptionNotification \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'g0Js1jd9' \
    --userId 'ZpD2Y66o' \
    --body '{"additionalData": {"cardSummary": "zRPJadXj"}, "authorisedTime": "1988-08-27T00:00:00Z", "chargebackReversedTime": "1989-03-02T00:00:00Z", "chargebackTime": "1981-10-10T00:00:00Z", "chargedTime": "1994-08-13T00:00:00Z", "createdTime": "1983-09-07T00:00:00Z", "currency": {"currencyCode": "FEakDRoc", "currencySymbol": "e2VVwgRW", "currencyType": "VIRTUAL", "decimals": 82, "namespace": "20MY8Dup"}, "customParameters": {"EziwL6YN": {}, "tRarXNWO": {}, "VDetgA4M": {}}, "extOrderNo": "pJldfXpZ", "extTxId": "cNNXYiEL", "extUserId": "8uSQPMni", "issuedAt": "1981-03-10T00:00:00Z", "metadata": {"0XbtRkFf": "tIlgrPQf", "522tm6pz": "6ZHAn0Es", "CzO9778x": "lxAFNYOr"}, "namespace": "JATaTF2Q", "nonceStr": "HmlTJPKV", "paymentMethod": "6Zm5m00Q", "paymentMethodFee": 65, "paymentOrderNo": "SNKR8Tig", "paymentProvider": "ADYEN", "paymentProviderFee": 42, "paymentStationUrl": "TSjNsxxS", "price": 12, "refundedTime": "1982-04-25T00:00:00Z", "salesTax": 66, "sandbox": true, "sku": "gR7e2Zmm", "status": "AUTHORISE_FAILED", "statusReason": "EBLO2XOB", "subscriptionId": "REc0lzgD", "subtotalPrice": 66, "targetNamespace": "M8P9uplz", "targetUserId": "wXe2wskR", "tax": 70, "totalPrice": 75, "totalTax": 23, "txEndTime": "1998-04-04T00:00:00Z", "type": "FSwelVl8", "userId": "P7Q91ePu", "vat": 77}' \
    > test.out 2>&1
eval_tap $? 293 'ProcessUserSubscriptionNotification' test.out

#- 294 AcquireUserTicket
./ng net.accelbyte.sdk.cli.Main platform acquireUserTicket \
    --boothName 'yTu2vsEL' \
    --namespace "$AB_NAMESPACE" \
    --userId 'xU89aanS' \
    --body '{"count": 57, "orderNo": "FnOcBSiu"}' \
    > test.out 2>&1
eval_tap $? 294 'AcquireUserTicket' test.out

#- 295 QueryUserCurrencyWallets
./ng net.accelbyte.sdk.cli.Main platform queryUserCurrencyWallets \
    --namespace "$AB_NAMESPACE" \
    --userId 'BnaBB9ae' \
    > test.out 2>&1
eval_tap $? 295 'QueryUserCurrencyWallets' test.out

#- 296 DebitUserWalletByCurrencyCode
./ng net.accelbyte.sdk.cli.Main platform debitUserWalletByCurrencyCode \
    --currencyCode 'r0muFrnA' \
    --namespace "$AB_NAMESPACE" \
    --userId 'gJJ4eZRT' \
    --body '{"allowOverdraft": false, "amount": 7, "balanceOrigin": "System", "balanceSource": "EXPIRATION", "metadata": {"cwuPnKtT": {}, "Gqj515Mw": {}, "lYu3J6fZ": {}}, "reason": "LT22Sbdy"}' \
    > test.out 2>&1
eval_tap $? 296 'DebitUserWalletByCurrencyCode' test.out

#- 297 ListUserCurrencyTransactions
./ng net.accelbyte.sdk.cli.Main platform listUserCurrencyTransactions \
    --currencyCode 'vYW9bfpn' \
    --namespace "$AB_NAMESPACE" \
    --userId 'C6yhyY69' \
    --limit '45' \
    --offset '92' \
    > test.out 2>&1
eval_tap $? 297 'ListUserCurrencyTransactions' test.out

#- 298 CheckBalance
./ng net.accelbyte.sdk.cli.Main platform checkBalance \
    --currencyCode '3TPzLqoN' \
    --namespace "$AB_NAMESPACE" \
    --userId 'aVLWuszj' \
    --request '{"amount": 87, "debitBalanceSource": "IAP_REVOCATION", "metadata": {"f71qyoZZ": {}, "r6ZScdUP": {}, "ZxIN5s8C": {}}, "reason": "s48qRJqo", "walletPlatform": "Other"}' \
    > test.out 2>&1
eval_tap $? 298 'CheckBalance' test.out

#- 299 CheckWallet
eval_tap 0 299 'CheckWallet # SKIP deprecated' test.out

#- 300 CreditUserWallet
./ng net.accelbyte.sdk.cli.Main platform creditUserWallet \
    --currencyCode 'AP6ZVm1a' \
    --namespace "$AB_NAMESPACE" \
    --userId 'HomwlqMY' \
    --body '{"amount": 24, "expireAt": "1977-03-12T00:00:00Z", "metadata": {"2zbDIxDp": {}, "e7d5Aiuv": {}, "10c6DAPh": {}}, "origin": "Playstation", "reason": "jOoQLHNO", "source": "SELL_BACK"}' \
    > test.out 2>&1
eval_tap $? 300 'CreditUserWallet' test.out

#- 301 DebitByWalletPlatform
./ng net.accelbyte.sdk.cli.Main platform debitByWalletPlatform \
    --currencyCode 'DhMjgutK' \
    --namespace "$AB_NAMESPACE" \
    --userId 'SQTa7PR0' \
    --request '{"amount": 89, "debitBalanceSource": "TRADE", "metadata": {"8nvQMt9N": {}, "q3kbtpYq": {}, "3mk9j5B2": {}}, "reason": "PQ60JqJy", "walletPlatform": "GooglePlay"}' \
    > test.out 2>&1
eval_tap $? 301 'DebitByWalletPlatform' test.out

#- 302 PayWithUserWallet
./ng net.accelbyte.sdk.cli.Main platform payWithUserWallet \
    --currencyCode 'Tb01OYuk' \
    --namespace "$AB_NAMESPACE" \
    --userId 'r2wqJSbY' \
    --body '{"amount": 64, "metadata": {"oNEBqAcF": {}, "HeunLDaw": {}, "2REsPNYn": {}}, "walletPlatform": "Steam"}' \
    > test.out 2>&1
eval_tap $? 302 'PayWithUserWallet' test.out

#- 303 GetUserWallet
eval_tap 0 303 'GetUserWallet # SKIP deprecated' test.out

#- 304 DebitUserWallet
eval_tap 0 304 'DebitUserWallet # SKIP deprecated' test.out

#- 305 DisableUserWallet
eval_tap 0 305 'DisableUserWallet # SKIP deprecated' test.out

#- 306 EnableUserWallet
eval_tap 0 306 'EnableUserWallet # SKIP deprecated' test.out

#- 307 ListUserWalletTransactions
eval_tap 0 307 'ListUserWalletTransactions # SKIP deprecated' test.out

#- 308 ListViews
./ng net.accelbyte.sdk.cli.Main platform listViews \
    --namespace "$AB_NAMESPACE" \
    --storeId 'PV1AmR5J' \
    > test.out 2>&1
eval_tap $? 308 'ListViews' test.out

#- 309 CreateView
./ng net.accelbyte.sdk.cli.Main platform createView \
    --namespace "$AB_NAMESPACE" \
    --storeId 'klZYTB5H' \
    --body '{"displayOrder": 53, "localizations": {"ckstVyOw": {"description": "HysiSKJl", "localExt": {"1yWfksV5": {}, "lKFztaLD": {}, "143Za0vR": {}}, "longDescription": "K3U4CZH2", "title": "sLECLcWI"}, "2waFkc8k": {"description": "6Z2r0Ykl", "localExt": {"jTkuP5Si": {}, "u2RgiwUv": {}, "xbfKIccc": {}}, "longDescription": "OV0J1xJF", "title": "eng7Zpf8"}, "q6jJlJeF": {"description": "mHadEpHW", "localExt": {"s2Q1LlUk": {}, "aEVRicHV": {}, "yJ9pilMx": {}}, "longDescription": "IGJXXRHu", "title": "208Zyckw"}}, "name": "ui2EVQLQ"}' \
    > test.out 2>&1
eval_tap $? 309 'CreateView' test.out

#- 310 GetView
./ng net.accelbyte.sdk.cli.Main platform getView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'ZOEo3MNO' \
    --storeId 'yckgDX0p' \
    > test.out 2>&1
eval_tap $? 310 'GetView' test.out

#- 311 UpdateView
./ng net.accelbyte.sdk.cli.Main platform updateView \
    --namespace "$AB_NAMESPACE" \
    --viewId '0a9mgsx2' \
    --storeId 'qhkyhHoO' \
    --body '{"displayOrder": 34, "localizations": {"tISgJTEu": {"description": "N6amMDXq", "localExt": {"7AOyNHjB": {}, "kvgQOY5o": {}, "Esxi2AUX": {}}, "longDescription": "lEhRPJnE", "title": "DIYtbZcT"}, "Jc2DWQzm": {"description": "evRbUR4F", "localExt": {"d4FeLUBl": {}, "1KRhBLQq": {}, "uzbgXejq": {}}, "longDescription": "yqyHjpxH", "title": "Fe5WMnja"}, "tBZM171i": {"description": "aqvVNIrh", "localExt": {"vhKOA8BI": {}, "aMXS9law": {}, "qGnvbchc": {}}, "longDescription": "fpvAo9Jk", "title": "CCyf1eF6"}}, "name": "0ccrzT4i"}' \
    > test.out 2>&1
eval_tap $? 311 'UpdateView' test.out

#- 312 DeleteView
./ng net.accelbyte.sdk.cli.Main platform deleteView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'hqn7jniv' \
    --storeId '23L1EkTO' \
    > test.out 2>&1
eval_tap $? 312 'DeleteView' test.out

#- 313 QueryWallets
eval_tap 0 313 'QueryWallets # SKIP deprecated' test.out

#- 314 BulkCredit
./ng net.accelbyte.sdk.cli.Main platform bulkCredit \
    --namespace "$AB_NAMESPACE" \
    --body '[{"creditRequest": {"amount": 49, "expireAt": "1986-05-24T00:00:00Z", "metadata": {"CbBnZZTe": {}, "ycEpNARF": {}, "hgp0zR6h": {}}, "origin": "IOS", "reason": "YAeSZVTp", "source": "IAP"}, "currencyCode": "Zf8wOCUu", "userIds": ["XBGh9ssE", "zgLYagAV", "N2aYqXHO"]}, {"creditRequest": {"amount": 50, "expireAt": "1990-03-19T00:00:00Z", "metadata": {"bk9lJhQX": {}, "rk7wWLqo": {}, "A1CVcXqH": {}}, "origin": "Other", "reason": "iGYBjelE", "source": "REFUND"}, "currencyCode": "QM6FDyWK", "userIds": ["4vr3QGyH", "Actdl5yT", "zwQcIS59"]}, {"creditRequest": {"amount": 9, "expireAt": "1987-03-25T00:00:00Z", "metadata": {"5GpLPNnR": {}, "RwP7fW45": {}, "gzNODMDz": {}}, "origin": "Xbox", "reason": "cgieV2DD", "source": "IAP"}, "currencyCode": "eY0Q5pua", "userIds": ["Ql1sZnJL", "oUCqDISE", "aYJkXAd6"]}]' \
    > test.out 2>&1
eval_tap $? 314 'BulkCredit' test.out

#- 315 BulkDebit
./ng net.accelbyte.sdk.cli.Main platform bulkDebit \
    --namespace "$AB_NAMESPACE" \
    --body '[{"currencyCode": "YuiPea7r", "request": {"allowOverdraft": false, "amount": 27, "balanceOrigin": "IOS", "balanceSource": "IAP_REVOCATION", "metadata": {"GP2jB40z": {}, "h65Qw5hy": {}, "CfEEqqcu": {}}, "reason": "BlGxzKdk"}, "userIds": ["nnGYiZO5", "sqpvwgIN", "4mnR4ARF"]}, {"currencyCode": "qluAOu2q", "request": {"allowOverdraft": true, "amount": 31, "balanceOrigin": "System", "balanceSource": "DLC_REVOCATION", "metadata": {"R5bVPizD": {}, "4rXEDPCY": {}, "XDoXYEIC": {}}, "reason": "GFDFskMm"}, "userIds": ["whu4RgR5", "CmMvCbrJ", "FUafw2yI"]}, {"currencyCode": "dOP4ccK7", "request": {"allowOverdraft": true, "amount": 72, "balanceOrigin": "Xbox", "balanceSource": "EXPIRATION", "metadata": {"Xo8ts0MC": {}, "ouSUSSEG": {}, "x74plrir": {}}, "reason": "0LXXxSXE"}, "userIds": ["x4sawD4f", "RPHWirMB", "FF91CYNo"]}]' \
    > test.out 2>&1
eval_tap $? 315 'BulkDebit' test.out

#- 316 GetWallet
eval_tap 0 316 'GetWallet # SKIP deprecated' test.out

#- 317 SyncOrders
./ng net.accelbyte.sdk.cli.Main platform syncOrders \
    --nextEvaluatedKey '5IAiPgai' \
    --end 'LfA3dcqS' \
    --start 'jH3vFDZ7' \
    > test.out 2>&1
eval_tap $? 317 'SyncOrders' test.out

#- 318 TestAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfig \
    --sandbox  \
    --body '{"allowedPaymentMethods": ["ng9RIL0o", "UmI85Jcd", "OHjfK2WJ"], "apiKey": "Da9F9LmJ", "authoriseAsCapture": false, "blockedPaymentMethods": ["KDnV6MaB", "CnoKwvK5", "a7vWDjd1"], "clientKey": "Gq6ALUxe", "dropInSettings": "ffabCq5D", "liveEndpointUrlPrefix": "MUWbCphg", "merchantAccount": "zkudmMne", "notificationHmacKey": "PVieFLHA", "notificationPassword": "HGx8qqie", "notificationUsername": "RXEBYtQT", "returnUrl": "4CxubHbV", "settings": "I2T9k72v"}' \
    > test.out 2>&1
eval_tap $? 318 'TestAdyenConfig' test.out

#- 319 TestAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfig \
    --sandbox  \
    --body '{"appId": "GYzhUH0p", "privateKey": "7ylFTybN", "publicKey": "RwJLANVS", "returnUrl": "wSDWmfIb"}' \
    > test.out 2>&1
eval_tap $? 319 'TestAliPayConfig' test.out

#- 320 TestCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfig \
    --sandbox  \
    --body '{"publicKey": "brL1ZDtd", "secretKey": "zVvYReaZ"}' \
    > test.out 2>&1
eval_tap $? 320 'TestCheckoutConfig' test.out

#- 321 DebugMatchedPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentMerchantConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'sxF4Aux7' \
    > test.out 2>&1
eval_tap $? 321 'DebugMatchedPaymentMerchantConfig' test.out

#- 322 TestPayPalConfig
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfig \
    --sandbox  \
    --body '{"clientID": "uqVbgaRs", "clientSecret": "ynStRJkz", "returnUrl": "AQ3wuqTn", "webHookId": "ZNUYwznk"}' \
    > test.out 2>&1
eval_tap $? 322 'TestPayPalConfig' test.out

#- 323 TestStripeConfig
./ng net.accelbyte.sdk.cli.Main platform testStripeConfig \
    --sandbox  \
    --body '{"allowedPaymentMethodTypes": ["sXB5CNFn", "HyvPm9xE", "Ea0LNdnE"], "publishableKey": "dDtIpC9a", "secretKey": "9S4nB9sv", "webhookSecret": "ojg5Dda3"}' \
    > test.out 2>&1
eval_tap $? 323 'TestStripeConfig' test.out

#- 324 TestWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfig \
    --body '{"appId": "vG5ya3n5", "key": "PgtQkx0y", "mchid": "G1fOYdZq", "returnUrl": "19PAIXkc"}' \
    > test.out 2>&1
eval_tap $? 324 'TestWxPayConfig' test.out

#- 325 TestXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfig \
    --body '{"apiKey": "ZulLo62S", "flowCompletionUrl": "wst1oZ68", "merchantId": 11, "projectId": 93, "projectSecretKey": "Ciu2ZCiy"}' \
    > test.out 2>&1
eval_tap $? 325 'TestXsollaConfig' test.out

#- 326 GetPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentMerchantConfig \
    --id 'mdSctikR' \
    > test.out 2>&1
eval_tap $? 326 'GetPaymentMerchantConfig' test.out

#- 327 UpdateAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform updateAdyenConfig \
    --id 'VMoceQdn' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethods": ["2gZAm3Bw", "V8sNH1ws", "lycDyfdq"], "apiKey": "Rs3viyKO", "authoriseAsCapture": true, "blockedPaymentMethods": ["x9Pn69aq", "HibW4REj", "a52q1Yfs"], "clientKey": "PyhKZosH", "dropInSettings": "7gXMofPk", "liveEndpointUrlPrefix": "6Yon1Rtp", "merchantAccount": "71sHLqRL", "notificationHmacKey": "Xao6dCiv", "notificationPassword": "9s0A6uCx", "notificationUsername": "BoR1BXzx", "returnUrl": "XRBx0kfC", "settings": "6sQgrC8f"}' \
    > test.out 2>&1
eval_tap $? 327 'UpdateAdyenConfig' test.out

#- 328 TestAdyenConfigById
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfigById \
    --id 'IeW3iVxV' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 328 'TestAdyenConfigById' test.out

#- 329 UpdateAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateAliPayConfig \
    --id 'grG79UHo' \
    --sandbox  \
    --validate  \
    --body '{"appId": "dkfpHdq8", "privateKey": "nmFlbrSj", "publicKey": "aJ0CWTXd", "returnUrl": "uOvJXgtz"}' \
    > test.out 2>&1
eval_tap $? 329 'UpdateAliPayConfig' test.out

#- 330 TestAliPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfigById \
    --id 'wOTENOX0' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 330 'TestAliPayConfigById' test.out

#- 331 UpdateCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform updateCheckoutConfig \
    --id 'nmth3xQJ' \
    --sandbox  \
    --validate  \
    --body '{"publicKey": "QZGNpbjt", "secretKey": "m2POY8hs"}' \
    > test.out 2>&1
eval_tap $? 331 'UpdateCheckoutConfig' test.out

#- 332 TestCheckoutConfigById
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfigById \
    --id 'P1AJhzQK' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 332 'TestCheckoutConfigById' test.out

#- 333 UpdatePayPalConfig
./ng net.accelbyte.sdk.cli.Main platform updatePayPalConfig \
    --id 'B8bYYWJR' \
    --sandbox  \
    --validate  \
    --body '{"clientID": "VEYI3SAs", "clientSecret": "TxJGq6jv", "returnUrl": "VFxWmrFN", "webHookId": "dTQfzl67"}' \
    > test.out 2>&1
eval_tap $? 333 'UpdatePayPalConfig' test.out

#- 334 TestPayPalConfigById
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfigById \
    --id 'kTfw8aBq' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 334 'TestPayPalConfigById' test.out

#- 335 UpdateStripeConfig
./ng net.accelbyte.sdk.cli.Main platform updateStripeConfig \
    --id 'tGbHnJvb' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethodTypes": ["r0S6zRxg", "ZGOtEx7o", "aPuGJ4NU"], "publishableKey": "NQe7O3sV", "secretKey": "7stgvs1Z", "webhookSecret": "DSkHPAun"}' \
    > test.out 2>&1
eval_tap $? 335 'UpdateStripeConfig' test.out

#- 336 TestStripeConfigById
./ng net.accelbyte.sdk.cli.Main platform testStripeConfigById \
    --id 'rXN6zRbJ' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 336 'TestStripeConfigById' test.out

#- 337 UpdateWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfig \
    --id 'XJwKkZyL' \
    --validate  \
    --body '{"appId": "DToL4dbX", "key": "G2nqybaW", "mchid": "rsL1PfBz", "returnUrl": "6K9EB8tv"}' \
    > test.out 2>&1
eval_tap $? 337 'UpdateWxPayConfig' test.out

#- 338 UpdateWxPayConfigCert
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfigCert \
    --id '08sw8aeb' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 338 'UpdateWxPayConfigCert' test.out

#- 339 TestWxPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfigById \
    --id 'dSSUVdE6' \
    > test.out 2>&1
eval_tap $? 339 'TestWxPayConfigById' test.out

#- 340 UpdateXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaConfig \
    --id 'ubaPbs17' \
    --validate  \
    --body '{"apiKey": "NX6gCDyT", "flowCompletionUrl": "wWxyVADI", "merchantId": 92, "projectId": 30, "projectSecretKey": "sLXQtc6a"}' \
    > test.out 2>&1
eval_tap $? 340 'UpdateXsollaConfig' test.out

#- 341 TestXsollaConfigById
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfigById \
    --id 'VEKqYNwK' \
    > test.out 2>&1
eval_tap $? 341 'TestXsollaConfigById' test.out

#- 342 UpdateXsollaUIConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaUIConfig \
    --id 'xlZgAWsv' \
    --body '{"device": "MOBILE", "showCloseButton": true, "size": "SMALL", "theme": "DEFAULT_DARK"}' \
    > test.out 2>&1
eval_tap $? 342 'UpdateXsollaUIConfig' test.out

#- 343 QueryPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform queryPaymentProviderConfig \
    --limit '55' \
    --namespace "$AB_NAMESPACE" \
    --offset '89' \
    --region 'zpc5ewRG' \
    > test.out 2>&1
eval_tap $? 343 'QueryPaymentProviderConfig' test.out

#- 344 CreatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform createPaymentProviderConfig \
    --body '{"aggregate": "ADYEN", "namespace": "VbWS9aTu", "region": "QteAgXjk", "sandboxTaxJarApiToken": "TBIwTg3s", "specials": ["STRIPE", "ADYEN", "WXPAY"], "taxJarApiToken": "5xrauskL", "taxJarEnabled": false, "useGlobalTaxJarApiToken": false}' \
    > test.out 2>&1
eval_tap $? 344 'CreatePaymentProviderConfig' test.out

#- 345 GetAggregatePaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getAggregatePaymentProviders \
    > test.out 2>&1
eval_tap $? 345 'GetAggregatePaymentProviders' test.out

#- 346 DebugMatchedPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentProviderConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'uA6bs8Ys' \
    > test.out 2>&1
eval_tap $? 346 'DebugMatchedPaymentProviderConfig' test.out

#- 347 GetSpecialPaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getSpecialPaymentProviders \
    > test.out 2>&1
eval_tap $? 347 'GetSpecialPaymentProviders' test.out

#- 348 UpdatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentProviderConfig \
    --id 'yTrVo8Gz' \
    --body '{"aggregate": "XSOLLA", "namespace": "AhUiwSK0", "region": "NYrCrPEB", "sandboxTaxJarApiToken": "BZcM1WqI", "specials": ["ALIPAY", "PAYPAL", "WALLET"], "taxJarApiToken": "NNoP2JkI", "taxJarEnabled": true, "useGlobalTaxJarApiToken": false}' \
    > test.out 2>&1
eval_tap $? 348 'UpdatePaymentProviderConfig' test.out

#- 349 DeletePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform deletePaymentProviderConfig \
    --id '0jfgu2hU' \
    > test.out 2>&1
eval_tap $? 349 'DeletePaymentProviderConfig' test.out

#- 350 GetPaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxConfig \
    > test.out 2>&1
eval_tap $? 350 'GetPaymentTaxConfig' test.out

#- 351 UpdatePaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentTaxConfig \
    --body '{"sandboxTaxJarApiToken": "ptV6JpBr", "taxJarApiToken": "byPuP28B", "taxJarEnabled": true, "taxJarProductCodesMapping": {"j0vDxk20": "tUTCk169", "DLMmry9Y": "zeH8xn8n", "J3NclWPW": "DKWSrJgo"}}' \
    > test.out 2>&1
eval_tap $? 351 'UpdatePaymentTaxConfig' test.out

#- 352 SyncPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform syncPaymentOrders \
    --nextEvaluatedKey 'c7mlMsLJ' \
    --end 'tYEAxBGG' \
    --start 'dNXAWX6p' \
    > test.out 2>&1
eval_tap $? 352 'SyncPaymentOrders' test.out

#- 353 PublicGetRootCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetRootCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'QW4GwreV' \
    --storeId 'rZXOUrFx' \
    > test.out 2>&1
eval_tap $? 353 'PublicGetRootCategories' test.out

#- 354 DownloadCategories
./ng net.accelbyte.sdk.cli.Main platform downloadCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'JVGx3QK1' \
    --storeId 'AjO9rGSW' \
    > test.out 2>&1
eval_tap $? 354 'DownloadCategories' test.out

#- 355 PublicGetCategory
./ng net.accelbyte.sdk.cli.Main platform publicGetCategory \
    --categoryPath '0LJ16hHy' \
    --namespace "$AB_NAMESPACE" \
    --language 'xrz1EjOZ' \
    --storeId 'v9SbJrws' \
    > test.out 2>&1
eval_tap $? 355 'PublicGetCategory' test.out

#- 356 PublicGetChildCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetChildCategories \
    --categoryPath 'LlmppCru' \
    --namespace "$AB_NAMESPACE" \
    --language 'y7UyyWD0' \
    --storeId 'xqb9lgWB' \
    > test.out 2>&1
eval_tap $? 356 'PublicGetChildCategories' test.out

#- 357 PublicGetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetDescendantCategories \
    --categoryPath 'cCT4uA0n' \
    --namespace "$AB_NAMESPACE" \
    --language 'rvPgm2hP' \
    --storeId 's5mt6JaZ' \
    > test.out 2>&1
eval_tap $? 357 'PublicGetDescendantCategories' test.out

#- 358 PublicListCurrencies
./ng net.accelbyte.sdk.cli.Main platform publicListCurrencies \
    --namespace "$AB_NAMESPACE" \
    --currencyType 'VIRTUAL' \
    > test.out 2>&1
eval_tap $? 358 'PublicListCurrencies' test.out

#- 359 GeDLCDurableRewardShortMap
./ng net.accelbyte.sdk.cli.Main platform geDLCDurableRewardShortMap \
    --namespace "$AB_NAMESPACE" \
    --dlcType 'XBOX' \
    > test.out 2>&1
eval_tap $? 359 'GeDLCDurableRewardShortMap' test.out

#- 360 GetIAPItemMapping
./ng net.accelbyte.sdk.cli.Main platform getIAPItemMapping \
    --namespace "$AB_NAMESPACE" \
    --platform 'OCULUS' \
    > test.out 2>&1
eval_tap $? 360 'GetIAPItemMapping' test.out

#- 361 PublicGetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --language 'G8HuT3nb' \
    --region 'aBM8BYBx' \
    --storeId 'sWeIzkWS' \
    --appId 'pTuOwGcf' \
    > test.out 2>&1
eval_tap $? 361 'PublicGetItemByAppId' test.out

#- 362 PublicQueryItems
./ng net.accelbyte.sdk.cli.Main platform publicQueryItems \
    --namespace "$AB_NAMESPACE" \
    --appType 'DLC' \
    --autoCalcEstimatedPrice  \
    --baseAppId '0Xt63Kr8' \
    --categoryPath '9rVodf8H' \
    --features 'a2DkeUsg' \
    --includeSubCategoryItem  \
    --itemType 'MEDIA' \
    --language '08XXrPuU' \
    --limit '37' \
    --offset '15' \
    --region '4Y3I8iiW' \
    --sortBy 'displayOrder,updatedAt,name:desc' \
    --storeId '6HoBocLu' \
    --tags 'rlvEaFtj' \
    > test.out 2>&1
eval_tap $? 362 'PublicQueryItems' test.out

#- 363 PublicGetItemBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetItemBySku \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'hFMcPG2l' \
    --region 'OWohY1qS' \
    --storeId 'vxCZD8w6' \
    --sku 'AjErW8UH' \
    > test.out 2>&1
eval_tap $? 363 'PublicGetItemBySku' test.out

#- 364 PublicGetEstimatedPrice
./ng net.accelbyte.sdk.cli.Main platform publicGetEstimatedPrice \
    --namespace "$AB_NAMESPACE" \
    --region 'PkFgcqmo' \
    --storeId 'pgn6t1Uc' \
    --itemIds '9oBeEUFW' \
    > test.out 2>&1
eval_tap $? 364 'PublicGetEstimatedPrice' test.out

#- 365 PublicBulkGetItems
./ng net.accelbyte.sdk.cli.Main platform publicBulkGetItems \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'm8rEpXRT' \
    --region 'L830nMDt' \
    --storeId '9GQuTAVK' \
    --itemIds 'qTBrBqcu' \
    > test.out 2>&1
eval_tap $? 365 'PublicBulkGetItems' test.out

#- 366 PublicValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform publicValidateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --body '{"itemIds": ["VIle8Rfu", "IrLOewzo", "wyTQNTYA"]}' \
    > test.out 2>&1
eval_tap $? 366 'PublicValidateItemPurchaseCondition' test.out

#- 367 PublicSearchItems
./ng net.accelbyte.sdk.cli.Main platform publicSearchItems \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --itemType 'APP' \
    --limit '31' \
    --offset '82' \
    --region 'qB1rRuV5' \
    --storeId 'QvUdsdFk' \
    --keyword 'FsgU2E7D' \
    --language 'zBTFULkI' \
    > test.out 2>&1
eval_tap $? 367 'PublicSearchItems' test.out

#- 368 PublicGetApp
./ng net.accelbyte.sdk.cli.Main platform publicGetApp \
    --itemId 'IhitxB1P' \
    --namespace "$AB_NAMESPACE" \
    --language '8HX5lfoG' \
    --region 'JWKjeBGP' \
    --storeId '4hkxUEHK' \
    > test.out 2>&1
eval_tap $? 368 'PublicGetApp' test.out

#- 369 PublicGetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform publicGetItemDynamicData \
    --itemId 'Kvm7ZaPD' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 369 'PublicGetItemDynamicData' test.out

#- 370 PublicGetItem
./ng net.accelbyte.sdk.cli.Main platform publicGetItem \
    --itemId 'buog4R6w' \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'IyQfs5Ot' \
    --populateBundle  \
    --region 'WhBizOPH' \
    --storeId 'uiQ2Jmtn' \
    > test.out 2>&1
eval_tap $? 370 'PublicGetItem' test.out

#- 371 GetPaymentCustomization
eval_tap 0 371 'GetPaymentCustomization # SKIP deprecated' test.out

#- 372 PublicGetPaymentUrl
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentUrl \
    --namespace "$AB_NAMESPACE" \
    --body '{"paymentOrderNo": "zv9X2nhu", "paymentProvider": "WXPAY", "returnUrl": "lfpdfQKH", "ui": "RrmxpE5d", "zipCode": "eMX6EUVq"}' \
    > test.out 2>&1
eval_tap $? 372 'PublicGetPaymentUrl' test.out

#- 373 PublicGetPaymentMethods
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentMethods \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '0tEn7L6t' \
    > test.out 2>&1
eval_tap $? 373 'PublicGetPaymentMethods' test.out

#- 374 PublicGetUnpaidPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUnpaidPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '4L87QDXf' \
    > test.out 2>&1
eval_tap $? 374 'PublicGetUnpaidPaymentOrder' test.out

#- 375 Pay
./ng net.accelbyte.sdk.cli.Main platform pay \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'kTuJr3md' \
    --paymentProvider 'XSOLLA' \
    --zipCode 'txKVohwQ' \
    --body '{"token": "WDzUv20r"}' \
    > test.out 2>&1
eval_tap $? 375 'Pay' test.out

#- 376 PublicCheckPaymentOrderPaidStatus
./ng net.accelbyte.sdk.cli.Main platform publicCheckPaymentOrderPaidStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'bZCjWX4L' \
    > test.out 2>&1
eval_tap $? 376 'PublicCheckPaymentOrderPaidStatus' test.out

#- 377 GetPaymentPublicConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentPublicConfig \
    --namespace "$AB_NAMESPACE" \
    --sandbox  \
    --paymentProvider 'WXPAY' \
    --region 'PC9BqUhK' \
    > test.out 2>&1
eval_tap $? 377 'GetPaymentPublicConfig' test.out

#- 378 PublicGetQRCode
./ng net.accelbyte.sdk.cli.Main platform publicGetQRCode \
    --namespace "$AB_NAMESPACE" \
    --code '6hq8WJUf' \
    > test.out 2>&1
eval_tap $? 378 'PublicGetQRCode' test.out

#- 379 PublicNormalizePaymentReturnUrl
./ng net.accelbyte.sdk.cli.Main platform publicNormalizePaymentReturnUrl \
    --namespace "$AB_NAMESPACE" \
    --payerID 'r5098zJX' \
    --foreinginvoice 'ZXXTtkPO' \
    --invoiceId 'bVCuuLCx' \
    --payload 'zCYcI3ND' \
    --redirectResult 'G64iKyWd' \
    --resultCode '5xtxkpcc' \
    --sessionId 'y1R7TfWM' \
    --status 'hHvcOT1G' \
    --token 'VwS3PtA8' \
    --type 'ScvgcyfD' \
    --userId 'nihQVpaf' \
    --orderNo 'Ga8MBxBA' \
    --paymentOrderNo 'wSjRkFvf' \
    --paymentProvider 'ADYEN' \
    --returnUrl '68ZPyS7i' \
    > test.out 2>&1
eval_tap $? 379 'PublicNormalizePaymentReturnUrl' test.out

#- 380 GetPaymentTaxValue
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxValue \
    --namespace "$AB_NAMESPACE" \
    --zipCode '2ZYunBod' \
    --paymentOrderNo 'Y1pvvcVd' \
    --paymentProvider 'PAYPAL' \
    > test.out 2>&1
eval_tap $? 380 'GetPaymentTaxValue' test.out

#- 381 GetRewardByCode
./ng net.accelbyte.sdk.cli.Main platform getRewardByCode \
    --namespace "$AB_NAMESPACE" \
    --rewardCode 'GeqfOb1i' \
    > test.out 2>&1
eval_tap $? 381 'GetRewardByCode' test.out

#- 382 QueryRewards1
./ng net.accelbyte.sdk.cli.Main platform queryRewards1 \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'PFLi9UCy' \
    --limit '82' \
    --offset '4' \
    --sortBy 'namespace,rewardCode,namespace:desc' \
    > test.out 2>&1
eval_tap $? 382 'QueryRewards1' test.out

#- 383 GetReward1
./ng net.accelbyte.sdk.cli.Main platform getReward1 \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'JU8Jy3i8' \
    > test.out 2>&1
eval_tap $? 383 'GetReward1' test.out

#- 384 PublicListStores
./ng net.accelbyte.sdk.cli.Main platform publicListStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 384 'PublicListStores' test.out

#- 385 PublicExistsAnyMyActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyMyActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --appIds 'Kt4BlRFB,T81oiX5G,ePlrBBBR' \
    --itemIds 'Wty7f5SW,rWtfjsOv,4DAsRPEO' \
    --skus 'adlQ4rRP,P7cADYyJ,tIntpQxy' \
    > test.out 2>&1
eval_tap $? 385 'PublicExistsAnyMyActiveEntitlement' test.out

#- 386 PublicGetMyAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --appId 'PPWX7abp' \
    > test.out 2>&1
eval_tap $? 386 'PublicGetMyAppEntitlementOwnershipByAppId' test.out

#- 387 PublicGetMyEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'LOOTBOX' \
    --itemId 'RyPeq1XY' \
    > test.out 2>&1
eval_tap $? 387 'PublicGetMyEntitlementOwnershipByItemId' test.out

#- 388 PublicGetMyEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'SUBSCRIPTION' \
    --sku '4MwuXUbL' \
    > test.out 2>&1
eval_tap $? 388 'PublicGetMyEntitlementOwnershipBySku' test.out

#- 389 PublicGetEntitlementOwnershipToken
./ng net.accelbyte.sdk.cli.Main platform publicGetEntitlementOwnershipToken \
    --namespace "$AB_NAMESPACE" \
    --appIds 'SFnGhJOj,QflDdYC2,7sEhYNeV' \
    --itemIds 'zTkuPtUz,GnL6bNns,UKa7VRs3' \
    --skus 'LlcctlHe,yx0G6d8r,VolWGxEx' \
    > test.out 2>&1
eval_tap $? 389 'PublicGetEntitlementOwnershipToken' test.out

#- 390 SyncTwitchDropsEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement \
    --namespace "$AB_NAMESPACE" \
    --body '{"gameId": "TGNzgZfk", "language": "aiv", "region": "SuxWXCf8"}' \
    > test.out 2>&1
eval_tap $? 390 'SyncTwitchDropsEntitlement' test.out

#- 391 PublicGetMyWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetMyWallet \
    --currencyCode 'nqjZK7xt' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 391 'PublicGetMyWallet' test.out

#- 392 SyncEpicGameDLC
./ng net.accelbyte.sdk.cli.Main platform syncEpicGameDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'yToSliXu' \
    --body '{"epicGamesJwtToken": "9iD4U035"}' \
    > test.out 2>&1
eval_tap $? 392 'SyncEpicGameDLC' test.out

#- 393 SyncOculusDLC
./ng net.accelbyte.sdk.cli.Main platform syncOculusDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'agv2avDj' \
    > test.out 2>&1
eval_tap $? 393 'SyncOculusDLC' test.out

#- 394 PublicSyncPsnDlcInventory
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'F7HJDNRi' \
    --body '{"serviceLabel": 83}' \
    > test.out 2>&1
eval_tap $? 394 'PublicSyncPsnDlcInventory' test.out

#- 395 PublicSyncPsnDlcInventoryWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventoryWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'yECVlUj6' \
    --body '{"serviceLabels": [96, 9, 53]}' \
    > test.out 2>&1
eval_tap $? 395 'PublicSyncPsnDlcInventoryWithMultipleServiceLabels' test.out

#- 396 SyncSteamDLC
./ng net.accelbyte.sdk.cli.Main platform syncSteamDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 't0myxysE' \
    --body '{"appId": "x88gRPnn", "steamId": "ymjoQa51"}' \
    > test.out 2>&1
eval_tap $? 396 'SyncSteamDLC' test.out

#- 397 SyncXboxDLC
./ng net.accelbyte.sdk.cli.Main platform syncXboxDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'C0iKsu8I' \
    --body '{"xstsToken": "M7eH7g5G"}' \
    > test.out 2>&1
eval_tap $? 397 'SyncXboxDLC' test.out

#- 398 PublicQueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId '3ySn0pLT' \
    --appType 'SOFTWARE' \
    --entitlementClazz 'MEDIA' \
    --entitlementName 'NYeMhIsL' \
    --features 'PROARERf,1lqnEABX,BXUlF2hI' \
    --itemId 'b4gM6XTK,FozbHQ34,8o6WeMJl' \
    --limit '59' \
    --offset '18' \
    > test.out 2>&1
eval_tap $? 398 'PublicQueryUserEntitlements' test.out

#- 399 PublicGetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZWy8yK3y' \
    --appId 'JKdyuHLg' \
    > test.out 2>&1
eval_tap $? 399 'PublicGetUserAppEntitlementByAppId' test.out

#- 400 PublicQueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'GSnBA7aU' \
    --limit '19' \
    --offset '11' \
    --appType 'DEMO' \
    > test.out 2>&1
eval_tap $? 400 'PublicQueryUserEntitlementsByAppType' test.out

#- 401 PublicGetUserEntitlementsByIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementsByIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'SDxDEv8v' \
    --availablePlatformOnly  \
    --ids '6uYrO5W5,VPJcdoDH,gFWsApOo' \
    > test.out 2>&1
eval_tap $? 401 'PublicGetUserEntitlementsByIds' test.out

#- 402 PublicGetUserEntitlementByItemId
eval_tap 0 402 'PublicGetUserEntitlementByItemId # SKIP deprecated' test.out

#- 403 PublicGetUserEntitlementBySku
eval_tap 0 403 'PublicGetUserEntitlementBySku # SKIP deprecated' test.out

#- 404 PublicUserEntitlementHistory
./ng net.accelbyte.sdk.cli.Main platform publicUserEntitlementHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'tRxJUwLi' \
    --endDate 'kumjz9ME' \
    --entitlementClazz 'SUBSCRIPTION' \
    --limit '89' \
    --offset '96' \
    --startDate 'IotNYbhO' \
    > test.out 2>&1
eval_tap $? 404 'PublicUserEntitlementHistory' test.out

#- 405 PublicExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'hQFw9tSR' \
    --appIds 'TeKGnuKy,b37Ovzwn,4Bw1OnNu' \
    --itemIds 'Eq3KXSf3,atq84Er2,YxhbK0oA' \
    --skus 'qK4aKG29,N3uNkyeO,u9Xgm4a2' \
    > test.out 2>&1
eval_tap $? 405 'PublicExistsAnyUserActiveEntitlement' test.out

#- 406 PublicGetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'UMru2RQl' \
    --appId 'lSMbAaZm' \
    > test.out 2>&1
eval_tap $? 406 'PublicGetUserAppEntitlementOwnershipByAppId' test.out

#- 407 PublicGetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'aSliZDGE' \
    --entitlementClazz 'SUBSCRIPTION' \
    --itemId '19g9816F' \
    > test.out 2>&1
eval_tap $? 407 'PublicGetUserEntitlementOwnershipByItemId' test.out

#- 408 PublicGetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'aG6VgZ0o' \
    --ids 'ueuic4FX,PeK1FrSL,CQw9si6s' \
    > test.out 2>&1
eval_tap $? 408 'PublicGetUserEntitlementOwnershipByItemIds' test.out

#- 409 PublicGetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'bpSh3pwN' \
    --entitlementClazz 'OPTIONBOX' \
    --sku 'yIqnblzN' \
    > test.out 2>&1
eval_tap $? 409 'PublicGetUserEntitlementOwnershipBySku' test.out

#- 410 PublicGetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlement \
    --entitlementId 'YoywBGGp' \
    --namespace "$AB_NAMESPACE" \
    --userId 'r323INOj' \
    > test.out 2>&1
eval_tap $? 410 'PublicGetUserEntitlement' test.out

#- 411 PublicConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicConsumeUserEntitlement \
    --entitlementId 'Fx4A346t' \
    --namespace "$AB_NAMESPACE" \
    --userId 'F9CwJDnE' \
    --body '{"options": ["XfNf4rYv", "N7C5z6th", "TeN3k3DQ"], "requestId": "slouMOyN", "useCount": 35}' \
    > test.out 2>&1
eval_tap $? 411 'PublicConsumeUserEntitlement' test.out

#- 412 PublicSellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicSellUserEntitlement \
    --entitlementId 'lTKIHhzt' \
    --namespace "$AB_NAMESPACE" \
    --userId 'KsdiBcil' \
    --body '{"requestId": "vaZ0rp2K", "useCount": 82}' \
    > test.out 2>&1
eval_tap $? 412 'PublicSellUserEntitlement' test.out

#- 413 PublicSplitUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicSplitUserEntitlement \
    --entitlementId 'om4ReuqO' \
    --namespace "$AB_NAMESPACE" \
    --userId 'zQD1lkzn' \
    --body '{"useCount": 32}' \
    > test.out 2>&1
eval_tap $? 413 'PublicSplitUserEntitlement' test.out

#- 414 PublicTransferUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicTransferUserEntitlement \
    --entitlementId 'hVTnjNH2' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Pryhtu2E' \
    --body '{"entitlementId": "od8sIjSW", "useCount": 32}' \
    > test.out 2>&1
eval_tap $? 414 'PublicTransferUserEntitlement' test.out

#- 415 PublicRedeemCode
./ng net.accelbyte.sdk.cli.Main platform publicRedeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'd0SU0ERp' \
    --body '{"code": "olgr5sDH", "language": "DJ_Xo", "region": "nid1pe3f"}' \
    > test.out 2>&1
eval_tap $? 415 'PublicRedeemCode' test.out

#- 416 PublicFulfillAppleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillAppleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId '2zMMLWRS' \
    --body '{"excludeOldTransactions": true, "language": "xi_LC", "productId": "uGcxpYQR", "receiptData": "m381O6Eo", "region": "XZ0DOFLs", "transactionId": "dk5Ln6zf"}' \
    > test.out 2>&1
eval_tap $? 416 'PublicFulfillAppleIAPItem' test.out

#- 417 SyncEpicGamesInventory
./ng net.accelbyte.sdk.cli.Main platform syncEpicGamesInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'DZnZdnrU' \
    --body '{"epicGamesJwtToken": "8cscaMAg"}' \
    > test.out 2>&1
eval_tap $? 417 'SyncEpicGamesInventory' test.out

#- 418 PublicFulfillGoogleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillGoogleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'R0skKZbt' \
    --body '{"autoAck": false, "language": "VRFW-062", "orderId": "WIHaoPCo", "packageName": "uIGVtROj", "productId": "3NKwSmj0", "purchaseTime": 35, "purchaseToken": "AwIayVdx", "region": "nouOdGtK"}' \
    > test.out 2>&1
eval_tap $? 418 'PublicFulfillGoogleIAPItem' test.out

#- 419 SyncOculusConsumableEntitlements
./ng net.accelbyte.sdk.cli.Main platform syncOculusConsumableEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'l5xQwfyo' \
    > test.out 2>&1
eval_tap $? 419 'SyncOculusConsumableEntitlements' test.out

#- 420 PublicReconcilePlayStationStore
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStore \
    --namespace "$AB_NAMESPACE" \
    --userId 'NSbqqtj9' \
    --body '{"currencyCode": "6V5XgDVj", "price": 0.9205865521443428, "productId": "h6n9dI0X", "serviceLabel": 96}' \
    > test.out 2>&1
eval_tap $? 420 'PublicReconcilePlayStationStore' test.out

#- 421 PublicReconcilePlayStationStoreWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStoreWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId '3ccWXaAZ' \
    --body '{"currencyCode": "S3MVLDJh", "price": 0.9308749635260805, "productId": "0kFA96Lm", "serviceLabels": [81, 75, 49]}' \
    > test.out 2>&1
eval_tap $? 421 'PublicReconcilePlayStationStoreWithMultipleServiceLabels' test.out

#- 422 SyncSteamInventory
./ng net.accelbyte.sdk.cli.Main platform syncSteamInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'bkvb3taD' \
    --body '{"appId": "LIUTrfe0", "currencyCode": "F3pu7boM", "language": "PjM-xy", "price": 0.8052536398964164, "productId": "5ykzWHXC", "region": "cs9Syqi5", "steamId": "DRVrm4VC"}' \
    > test.out 2>&1
eval_tap $? 422 'SyncSteamInventory' test.out

#- 423 SyncTwitchDropsEntitlement1
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'GJmqaULz' \
    --body '{"gameId": "HJiBn67W", "language": "Zp", "region": "OlIWK3rp"}' \
    > test.out 2>&1
eval_tap $? 423 'SyncTwitchDropsEntitlement1' test.out

#- 424 SyncXboxInventory
./ng net.accelbyte.sdk.cli.Main platform syncXboxInventory \
    --namespace "$AB_NAMESPACE" \
    --userId '1zGtgeT8' \
    --body '{"currencyCode": "dYKr6URf", "price": 0.6678323246461318, "productId": "Xlulo7tJ", "xstsToken": "kCGX8reU"}' \
    > test.out 2>&1
eval_tap $? 424 'SyncXboxInventory' test.out

#- 425 PublicQueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId '0KdcleZ7' \
    --discounted  \
    --itemId 'ZmIyXGDg' \
    --limit '54' \
    --offset '26' \
    --status 'REFUNDING' \
    > test.out 2>&1
eval_tap $? 425 'PublicQueryUserOrders' test.out

#- 426 PublicCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'Hn3BjjnX' \
    --body '{"currencyCode": "7kXjKBr2", "discountCodes": ["fnwEypFd", "wHlmiGs7", "HXzrBY9f"], "discountedPrice": 12, "ext": {"x9t9DqPG": {}, "NPJ9JyIs": {}, "UZdtZw81": {}}, "itemId": "9O4r8Z2Z", "language": "Iy_Sb", "price": 48, "quantity": 18, "region": "Tsls2SSS", "returnUrl": "Ihn7fUx4", "sectionId": "RHwe1JIf"}' \
    > test.out 2>&1
eval_tap $? 426 'PublicCreateUserOrder' test.out

#- 427 PublicPreviewOrderPrice
./ng net.accelbyte.sdk.cli.Main platform publicPreviewOrderPrice \
    --namespace "$AB_NAMESPACE" \
    --userId '2vg27jZf' \
    --body '{"currencyCode": "IV91jrtD", "discountCodes": ["dGUenI3N", "Z6bN5e2b", "jFCxGqj7"], "discountedPrice": 78, "itemId": "NB78uG7E", "price": 99, "quantity": 91}' \
    > test.out 2>&1
eval_tap $? 427 'PublicPreviewOrderPrice' test.out

#- 428 PublicGetUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'tB4iqeGI' \
    --userId 'gYQwN413' \
    > test.out 2>&1
eval_tap $? 428 'PublicGetUserOrder' test.out

#- 429 PublicCancelUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCancelUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'cFJHwHW1' \
    --userId 'DfMLsKTs' \
    > test.out 2>&1
eval_tap $? 429 'PublicCancelUserOrder' test.out

#- 430 PublicGetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'qkzzFaYP' \
    --userId 'KNkRLTXh' \
    > test.out 2>&1
eval_tap $? 430 'PublicGetUserOrderHistories' test.out

#- 431 PublicDownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform publicDownloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'tyEzOAwI' \
    --userId 'J0cwYZ3j' \
    > test.out 2>&1
eval_tap $? 431 'PublicDownloadUserOrderReceipt' test.out

#- 432 PublicGetPaymentAccounts
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'eAT7hj1F' \
    > test.out 2>&1
eval_tap $? 432 'PublicGetPaymentAccounts' test.out

#- 433 PublicDeletePaymentAccount
./ng net.accelbyte.sdk.cli.Main platform publicDeletePaymentAccount \
    --id '3KQAT0S2' \
    --namespace "$AB_NAMESPACE" \
    --type 'paypal' \
    --userId '9zRg9ubh' \
    > test.out 2>&1
eval_tap $? 433 'PublicDeletePaymentAccount' test.out

#- 434 PublicListActiveSections
./ng net.accelbyte.sdk.cli.Main platform publicListActiveSections \
    --namespace "$AB_NAMESPACE" \
    --userId 'J9GCMTnw' \
    --autoCalcEstimatedPrice  \
    --language 'PINAsskq' \
    --region 'Q98etGSA' \
    --storeId '9hfH2NGe' \
    --viewId 'gsqOt4zV' \
    > test.out 2>&1
eval_tap $? 434 'PublicListActiveSections' test.out

#- 435 PublicQueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'QPWTdOki' \
    --chargeStatus 'CHARGE_FAILED' \
    --itemId '8Pe30B0y' \
    --limit '4' \
    --offset '28' \
    --sku '9wichV4m' \
    --status 'INIT' \
    --subscribedBy 'USER' \
    > test.out 2>&1
eval_tap $? 435 'PublicQueryUserSubscriptions' test.out

#- 436 PublicSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform publicSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'JUDGRanb' \
    --body '{"currencyCode": "0HGzaARW", "itemId": "EgHzD1P7", "language": "dvo-DVNv", "region": "YiLBhNXA", "returnUrl": "ChHvTFIT", "source": "uvahVAOz"}' \
    > test.out 2>&1
eval_tap $? 436 'PublicSubscribeSubscription' test.out

#- 437 PublicCheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform publicCheckUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId '4eTTnQsQ' \
    --itemId 'uh8gWyIM' \
    > test.out 2>&1
eval_tap $? 437 'PublicCheckUserSubscriptionSubscribableByItemId' test.out

#- 438 PublicGetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'c3AfjFsb' \
    --userId 'ZxNLEXxP' \
    > test.out 2>&1
eval_tap $? 438 'PublicGetUserSubscription' test.out

#- 439 PublicChangeSubscriptionBillingAccount
./ng net.accelbyte.sdk.cli.Main platform publicChangeSubscriptionBillingAccount \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'QftkgLQM' \
    --userId 'oALUNdPV' \
    > test.out 2>&1
eval_tap $? 439 'PublicChangeSubscriptionBillingAccount' test.out

#- 440 PublicCancelSubscription
./ng net.accelbyte.sdk.cli.Main platform publicCancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'VTL8mkPH' \
    --userId 'C95ALKA2' \
    --body '{"immediate": false, "reason": "IJrFUe1Y"}' \
    > test.out 2>&1
eval_tap $? 440 'PublicCancelSubscription' test.out

#- 441 PublicGetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'R3IWYaeM' \
    --userId 'NoXYqcMO' \
    --excludeFree  \
    --limit '35' \
    --offset '80' \
    > test.out 2>&1
eval_tap $? 441 'PublicGetUserSubscriptionBillingHistories' test.out

#- 442 PublicListViews
./ng net.accelbyte.sdk.cli.Main platform publicListViews \
    --namespace "$AB_NAMESPACE" \
    --userId 'FZJJ52u0' \
    --language 'c9j1sRWD' \
    --storeId 'hWehETMF' \
    > test.out 2>&1
eval_tap $? 442 'PublicListViews' test.out

#- 443 PublicGetWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetWallet \
    --currencyCode 'oQYrJBSM' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ncvym0e4' \
    > test.out 2>&1
eval_tap $? 443 'PublicGetWallet' test.out

#- 444 PublicListUserWalletTransactions
./ng net.accelbyte.sdk.cli.Main platform publicListUserWalletTransactions \
    --currencyCode 'aoyenaKz' \
    --namespace "$AB_NAMESPACE" \
    --userId 'qfKh1x20' \
    --limit '92' \
    --offset '21' \
    > test.out 2>&1
eval_tap $? 444 'PublicListUserWalletTransactions' test.out

#- 445 QueryItems1
./ng net.accelbyte.sdk.cli.Main platform queryItems1 \
    --namespace "$AB_NAMESPACE" \
    --appType 'SOFTWARE' \
    --availableDate 'AIqshb2C' \
    --baseAppId 'Fe3PYQtf' \
    --categoryPath 'rBXZxT7L' \
    --features 'Msg3AEM5' \
    --includeSubCategoryItem  \
    --itemName 'nl9A6Kxh' \
    --itemStatus 'INACTIVE' \
    --itemType 'APP' \
    --limit '68' \
    --offset '11' \
    --region 'RVxswH0C' \
    --sectionExclusive  \
    --sortBy 'displayOrder:desc,updatedAt:desc,name:desc' \
    --storeId 'Im31Hw0m' \
    --tags 'QYhLwvbz' \
    --targetNamespace 'lShB0C0K' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 445 'QueryItems1' test.out

#- 446 ImportStore1
./ng net.accelbyte.sdk.cli.Main platform importStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Kz8GNAa6' \
    --strictMode  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 446 'ImportStore1' test.out

#- 447 ExportStore1
./ng net.accelbyte.sdk.cli.Main platform exportStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'VpQg7JQq' \
    --body '{"itemIds": ["VmluqqBS", "YQTdXFzB", "ztWZzCK0"]}' \
    > test.out 2>&1
eval_tap $? 447 'ExportStore1' test.out

#- 448 FulfillRewardsV2
./ng net.accelbyte.sdk.cli.Main platform fulfillRewardsV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'XxEz3Wo4' \
    --body '{"entitlementCollectionId": "3LM021IS", "entitlementOrigin": "IOS", "metadata": {"XuA2NDDT": {}, "6qukj8nX": {}, "LGLsznMW": {}}, "origin": "GooglePlay", "rewards": [{"currency": {"currencyCode": "hiqV1MlF", "namespace": "9x4iSlz1"}, "item": {"itemId": "NwgIWH9U", "itemSku": "5t86URS6", "itemType": "dZLedabl"}, "quantity": 47, "type": "ITEM"}, {"currency": {"currencyCode": "rlPR5bdB", "namespace": "BtwzW5sa"}, "item": {"itemId": "L6HVNIeS", "itemSku": "IPAgJCQ7", "itemType": "tnZh0NPL"}, "quantity": 22, "type": "CURRENCY"}, {"currency": {"currencyCode": "ueBECQ40", "namespace": "k1c3uxMf"}, "item": {"itemId": "yPNGHSgG", "itemSku": "V08tdcsi", "itemType": "rBYW1XJI"}, "quantity": 53, "type": "CURRENCY"}], "source": "IAP", "transactionId": "rrUMqU6B"}' \
    > test.out 2>&1
eval_tap $? 448 'FulfillRewardsV2' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
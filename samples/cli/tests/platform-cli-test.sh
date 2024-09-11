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
echo "1..462"

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
    --id 'Ks3W1bJq' \
    > test.out 2>&1
eval_tap $? 3 'GetFulfillmentScript' test.out

#- 4 CreateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform createFulfillmentScript \
    --id '9YAjjthC' \
    --body '{"grantDays": "hs2TElIL"}' \
    > test.out 2>&1
eval_tap $? 4 'CreateFulfillmentScript' test.out

#- 5 DeleteFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform deleteFulfillmentScript \
    --id 'DlC4GKJJ' \
    > test.out 2>&1
eval_tap $? 5 'DeleteFulfillmentScript' test.out

#- 6 UpdateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform updateFulfillmentScript \
    --id 'GglX8I9T' \
    --body '{"grantDays": "3dlOk7l2"}' \
    > test.out 2>&1
eval_tap $? 6 'UpdateFulfillmentScript' test.out

#- 7 ListItemTypeConfigs
./ng net.accelbyte.sdk.cli.Main platform listItemTypeConfigs \
    > test.out 2>&1
eval_tap $? 7 'ListItemTypeConfigs' test.out

#- 8 CreateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform createItemTypeConfig \
    --body '{"clazz": "WQRkszBQ", "dryRun": false, "fulfillmentUrl": "2p3jBXQm", "itemType": "APP", "purchaseConditionUrl": "g95SMi9G"}' \
    > test.out 2>&1
eval_tap $? 8 'CreateItemTypeConfig' test.out

#- 9 SearchItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform searchItemTypeConfig \
    --clazz 'g3zbpips' \
    --itemType 'BUNDLE' \
    > test.out 2>&1
eval_tap $? 9 'SearchItemTypeConfig' test.out

#- 10 GetItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform getItemTypeConfig \
    --id 'f95W6YUM' \
    > test.out 2>&1
eval_tap $? 10 'GetItemTypeConfig' test.out

#- 11 UpdateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform updateItemTypeConfig \
    --id '6NGKKi0g' \
    --body '{"clazz": "Ow6ML7wg", "dryRun": false, "fulfillmentUrl": "dKPNz14O", "purchaseConditionUrl": "jJVMNJIq"}' \
    > test.out 2>&1
eval_tap $? 11 'UpdateItemTypeConfig' test.out

#- 12 DeleteItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform deleteItemTypeConfig \
    --id 'R4I7KPl8' \
    > test.out 2>&1
eval_tap $? 12 'DeleteItemTypeConfig' test.out

#- 13 QueryCampaigns
./ng net.accelbyte.sdk.cli.Main platform queryCampaigns \
    --namespace "$AB_NAMESPACE" \
    --limit '18' \
    --name 'ofZ3y5o0' \
    --offset '46' \
    --tag 'gQViJnjx' \
    > test.out 2>&1
eval_tap $? 13 'QueryCampaigns' test.out

#- 14 CreateCampaign
./ng net.accelbyte.sdk.cli.Main platform createCampaign \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "GxgrhecQ", "discountConfig": {"categories": [{"categoryPath": "BKfdh0BA", "includeSubCategories": true}, {"categoryPath": "lZ7skDSs", "includeSubCategories": false}, {"categoryPath": "lNDyREUM", "includeSubCategories": false}], "currencyCode": "ybSAysE9", "currencyNamespace": "4lwuHEqX", "discountAmount": 25, "discountPercentage": 23, "discountType": "PERCENTAGE", "items": [{"itemId": "brjY3nOJ", "itemName": "XXUsJNbN"}, {"itemId": "V8bXbryT", "itemName": "7ND3POQM"}, {"itemId": "nguWlc1D", "itemName": "8EErxT8W"}], "restrictType": "NONE", "stackable": true}, "items": [{"extraSubscriptionDays": 46, "itemId": "sprQmiRm", "itemName": "e7csnOTW", "quantity": 52}, {"extraSubscriptionDays": 26, "itemId": "ZgPtPUVx", "itemName": "5ayzAlFW", "quantity": 95}, {"extraSubscriptionDays": 92, "itemId": "ciq1Na7X", "itemName": "2QJEitGb", "quantity": 94}], "maxRedeemCountPerCampaignPerUser": 97, "maxRedeemCountPerCode": 26, "maxRedeemCountPerCodePerUser": 59, "maxSaleCount": 17, "name": "KFgmgc90", "redeemEnd": "1990-02-01T00:00:00Z", "redeemStart": "1996-03-01T00:00:00Z", "redeemType": "DISCOUNT", "status": "ACTIVE", "tags": ["xPxKXnOg", "Z5uwrjq0", "wFXL9WX0"], "type": "REDEMPTION"}' \
    > test.out 2>&1
eval_tap $? 14 'CreateCampaign' test.out

#- 15 GetCampaign
./ng net.accelbyte.sdk.cli.Main platform getCampaign \
    --campaignId 'iqqDuLXG' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'GetCampaign' test.out

#- 16 UpdateCampaign
./ng net.accelbyte.sdk.cli.Main platform updateCampaign \
    --campaignId 'U4iw6813' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "hTytVMxt", "discountConfig": {"categories": [{"categoryPath": "ELXfC02J", "includeSubCategories": false}, {"categoryPath": "y0DebRwF", "includeSubCategories": true}, {"categoryPath": "h6oTqzmK", "includeSubCategories": true}], "currencyCode": "GlYI6XAd", "currencyNamespace": "dDHjjNll", "discountAmount": 70, "discountPercentage": 94, "discountType": "AMOUNT", "items": [{"itemId": "7b0AUjnm", "itemName": "RKOPrqkE"}, {"itemId": "oTKN4mzd", "itemName": "OqbUsWTg"}, {"itemId": "GI8cLQ6n", "itemName": "PJUWKv71"}], "restrictType": "ITEMS_AND_CATEGORIES", "stackable": false}, "items": [{"extraSubscriptionDays": 94, "itemId": "9a2PtLWT", "itemName": "3eVCfKxT", "quantity": 63}, {"extraSubscriptionDays": 74, "itemId": "LQfNalww", "itemName": "ZYsFjUoC", "quantity": 61}, {"extraSubscriptionDays": 96, "itemId": "AryBpJZo", "itemName": "fnsOwDfN", "quantity": 7}], "maxRedeemCountPerCampaignPerUser": 15, "maxRedeemCountPerCode": 44, "maxRedeemCountPerCodePerUser": 29, "maxSaleCount": 21, "name": "Xc6ikCCu", "redeemEnd": "1994-09-26T00:00:00Z", "redeemStart": "1979-06-13T00:00:00Z", "redeemType": "DISCOUNT", "status": "INACTIVE", "tags": ["QxDw8ko6", "2ZxZROJn", "j3Dlm50V"]}' \
    > test.out 2>&1
eval_tap $? 16 'UpdateCampaign' test.out

#- 17 RenameBatch
./ng net.accelbyte.sdk.cli.Main platform renameBatch \
    --campaignId 'Ep2x9gq0' \
    --namespace "$AB_NAMESPACE" \
    --body '{"newName": "WUOSMqCh", "oldName": "fOwB5mPz"}' \
    > test.out 2>&1
eval_tap $? 17 'RenameBatch' test.out

#- 18 QueryCampaignBatchNames
./ng net.accelbyte.sdk.cli.Main platform queryCampaignBatchNames \
    --campaignId 'alSr8KCX' \
    --namespace "$AB_NAMESPACE" \
    --batchName 'QPjAc4Cx' \
    --limit '20' \
    > test.out 2>&1
eval_tap $? 18 'QueryCampaignBatchNames' test.out

#- 19 GetCampaignDynamic
./ng net.accelbyte.sdk.cli.Main platform getCampaignDynamic \
    --campaignId 'A8hpylZo' \
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
    --body '{"appConfig": {"appName": "4aKjrSmH"}, "customConfig": {"connectionType": "INSECURE", "grpcServerAddress": "LY98fYvn"}, "extendType": "CUSTOM"}' \
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
    --body '{"appConfig": {"appName": "chFVJNYG"}, "customConfig": {"connectionType": "TLS", "grpcServerAddress": "uzGQRacF"}, "extendType": "APP"}' \
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
    --storeId '8NJVZBCX' \
    > test.out 2>&1
eval_tap $? 31 'GetRootCategories' test.out

#- 32 CreateCategory
./ng net.accelbyte.sdk.cli.Main platform createCategory \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Tpg6Hu01' \
    --body '{"categoryPath": "Tz9ihxho", "localizationDisplayNames": {"LU24QsF4": "IHF9aDII", "RzRZGUXZ": "wuFnj6AW", "doRmkXn5": "sp7W6pjg"}}' \
    > test.out 2>&1
eval_tap $? 32 'CreateCategory' test.out

#- 33 ListCategoriesBasic
./ng net.accelbyte.sdk.cli.Main platform listCategoriesBasic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'AiXxcBQ5' \
    > test.out 2>&1
eval_tap $? 33 'ListCategoriesBasic' test.out

#- 34 GetCategory
./ng net.accelbyte.sdk.cli.Main platform getCategory \
    --categoryPath 'itoc8jHT' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'xcfzR0sx' \
    > test.out 2>&1
eval_tap $? 34 'GetCategory' test.out

#- 35 UpdateCategory
./ng net.accelbyte.sdk.cli.Main platform updateCategory \
    --categoryPath 'dnj4fuFD' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'NSA4Twlg' \
    --body '{"localizationDisplayNames": {"4fKQZEJE": "MuiLJiDk", "4LYbPdpE": "1PSxqmCO", "3UaMdxh6": "7BHEs3bs"}}' \
    > test.out 2>&1
eval_tap $? 35 'UpdateCategory' test.out

#- 36 DeleteCategory
./ng net.accelbyte.sdk.cli.Main platform deleteCategory \
    --categoryPath 'AmWdFynX' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'RXg3Mne8' \
    > test.out 2>&1
eval_tap $? 36 'DeleteCategory' test.out

#- 37 GetChildCategories
./ng net.accelbyte.sdk.cli.Main platform getChildCategories \
    --categoryPath 'Mc4O4HrB' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'A2PlPlAJ' \
    > test.out 2>&1
eval_tap $? 37 'GetChildCategories' test.out

#- 38 GetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform getDescendantCategories \
    --categoryPath 'ZGlAIoBc' \
    --namespace "$AB_NAMESPACE" \
    --storeId '0RsdYeWj' \
    > test.out 2>&1
eval_tap $? 38 'GetDescendantCategories' test.out

#- 39 QueryCodes
./ng net.accelbyte.sdk.cli.Main platform queryCodes \
    --campaignId 'Yw0o6fnj' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --batchName 'DJC45xG0' \
    --batchNo '86,31,19' \
    --code 'Mm4o8K1o' \
    --limit '99' \
    --offset '29' \
    --withBatchName  \
    > test.out 2>&1
eval_tap $? 39 'QueryCodes' test.out

#- 40 CreateCodes
./ng net.accelbyte.sdk.cli.Main platform createCodes \
    --campaignId 'TNCIWc7U' \
    --namespace "$AB_NAMESPACE" \
    --body '{"batchName": "FoO4FcNl", "codeValue": "ZooJzJOX", "quantity": 7}' \
    > test.out 2>&1
eval_tap $? 40 'CreateCodes' test.out

#- 41 Download
./ng net.accelbyte.sdk.cli.Main platform download \
    --campaignId '8xu4VGAr' \
    --namespace "$AB_NAMESPACE" \
    --batchName 'zY8TVABG' \
    --batchNo '29,77,76' \
    --withBatchName  \
    > test.out 2>&1
eval_tap $? 41 'Download' test.out

#- 42 BulkDisableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkDisableCodes \
    --campaignId '0T2teM4v' \
    --namespace "$AB_NAMESPACE" \
    --batchName 'cYDzdVGD' \
    --batchNo '35,68,7' \
    > test.out 2>&1
eval_tap $? 42 'BulkDisableCodes' test.out

#- 43 BulkEnableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkEnableCodes \
    --campaignId 'AFhhFyL2' \
    --namespace "$AB_NAMESPACE" \
    --batchName 'qzqi5eJE' \
    --batchNo '96,69,45' \
    > test.out 2>&1
eval_tap $? 43 'BulkEnableCodes' test.out

#- 44 QueryRedeemHistory
./ng net.accelbyte.sdk.cli.Main platform queryRedeemHistory \
    --campaignId 'oBnwo3y9' \
    --namespace "$AB_NAMESPACE" \
    --code '4uSjdhVH' \
    --limit '74' \
    --offset '71' \
    --userId 'kL3F4e8b' \
    > test.out 2>&1
eval_tap $? 44 'QueryRedeemHistory' test.out

#- 45 GetCode
./ng net.accelbyte.sdk.cli.Main platform getCode \
    --code 'ukbiW1tc' \
    --namespace "$AB_NAMESPACE" \
    --redeemable  \
    --withBatchName  \
    > test.out 2>&1
eval_tap $? 45 'GetCode' test.out

#- 46 DisableCode
./ng net.accelbyte.sdk.cli.Main platform disableCode \
    --code 'GYxd2cfT' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 46 'DisableCode' test.out

#- 47 EnableCode
./ng net.accelbyte.sdk.cli.Main platform enableCode \
    --code 'eyDSC2Of' \
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
    --body '{"currencyCode": "UTZ0V0dC", "currencySymbol": "Wsii3Whv", "currencyType": "REAL", "decimals": 51, "localizationDescriptions": {"GdnmSF5v": "Ubt7XLGO", "rLm0hdMx": "3k7RAEnh", "4RxMhiHv": "CvgrvXQq"}}' \
    > test.out 2>&1
eval_tap $? 52 'CreateCurrency' test.out

#- 53 UpdateCurrency
./ng net.accelbyte.sdk.cli.Main platform updateCurrency \
    --currencyCode '8jTNeY97' \
    --namespace "$AB_NAMESPACE" \
    --body '{"localizationDescriptions": {"prm4HHZF": "906Eeue5", "w5GnORmk": "NwILJ64P", "8fvSud8m": "c6Yv4r7e"}}' \
    > test.out 2>&1
eval_tap $? 53 'UpdateCurrency' test.out

#- 54 DeleteCurrency
./ng net.accelbyte.sdk.cli.Main platform deleteCurrency \
    --currencyCode 'NDpVlomZ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 54 'DeleteCurrency' test.out

#- 55 GetCurrencyConfig
./ng net.accelbyte.sdk.cli.Main platform getCurrencyConfig \
    --currencyCode 'jOVEorbs' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 55 'GetCurrencyConfig' test.out

#- 56 GetCurrencySummary
./ng net.accelbyte.sdk.cli.Main platform getCurrencySummary \
    --currencyCode 'EGxTqRnH' \
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
    --body '{"data": [{"id": "MC0O1g3p", "rewards": [{"currency": {"currencyCode": "IEheYE1I", "namespace": "Ri7RfSYB"}, "item": {"itemId": "1D1pQn9v", "itemName": "8MhRmyRm", "itemSku": "gIev0Ud5", "itemType": "9tT20lpt"}, "quantity": 51, "type": "ITEM"}, {"currency": {"currencyCode": "0JY5sj2V", "namespace": "i3Rvf10Z"}, "item": {"itemId": "XTBF4xKn", "itemName": "yDRM9cNu", "itemSku": "kSBTfHpf", "itemType": "ezugQXcf"}, "quantity": 44, "type": "CURRENCY"}, {"currency": {"currencyCode": "gdqsoZuO", "namespace": "MRRBshuv"}, "item": {"itemId": "nR598NsK", "itemName": "gsxsdGCo", "itemSku": "TtL0W0QF", "itemType": "p0qgCEfN"}, "quantity": 15, "type": "CURRENCY"}]}, {"id": "pFIJhb0G", "rewards": [{"currency": {"currencyCode": "OBKamwon", "namespace": "Zv4aSGCe"}, "item": {"itemId": "6gdKifz1", "itemName": "uwOQyEAK", "itemSku": "qazYpevy", "itemType": "brWKukFs"}, "quantity": 41, "type": "ITEM"}, {"currency": {"currencyCode": "zzTYlhcC", "namespace": "IYESXUcg"}, "item": {"itemId": "AaJwSoyj", "itemName": "ltTOFw5n", "itemSku": "q9BzNXcK", "itemType": "JUpHhpJZ"}, "quantity": 39, "type": "CURRENCY"}, {"currency": {"currencyCode": "JXk1lAwt", "namespace": "ytkvaf7i"}, "item": {"itemId": "qox8iual", "itemName": "zVyyCPYU", "itemSku": "37z8YP5Q", "itemType": "mII1YaRn"}, "quantity": 4, "type": "CURRENCY"}]}, {"id": "Jkz0W8QG", "rewards": [{"currency": {"currencyCode": "Vs7xwoh0", "namespace": "oSxjuXdB"}, "item": {"itemId": "i7SCaS1D", "itemName": "5swu5WAJ", "itemSku": "Ro89iIii", "itemType": "DJNR31Sd"}, "quantity": 80, "type": "ITEM"}, {"currency": {"currencyCode": "LfU4Tbyk", "namespace": "lZyiFVWw"}, "item": {"itemId": "Yx5xvD8w", "itemName": "rHB4KXD8", "itemSku": "q6Alljkv", "itemType": "XnyMDmrk"}, "quantity": 62, "type": "ITEM"}, {"currency": {"currencyCode": "nGDCuRjb", "namespace": "VzEYzFbX"}, "item": {"itemId": "jf8Ihda4", "itemName": "trZrWRtH", "itemSku": "EsxSX6s8", "itemType": "qekW66LD"}, "quantity": 79, "type": "CURRENCY"}]}]}' \
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
    --body '{"data": [{"platform": "XBOX", "platformDlcIdMap": {"OqFWxtX9": "itPIedhL", "xxUUQs5f": "y8C3vWo1", "Xaj2LF02": "Cpc2TNI7"}}, {"platform": "PSN", "platformDlcIdMap": {"dSS2e45u": "6v1Ow73X", "MP1mizLD": "WdXPl5jw", "wFLCl5fA": "BGAIOD5y"}}, {"platform": "STEAM", "platformDlcIdMap": {"FaViWijr": "Lzz67Ud1", "sD1OHImO": "OXaLqRtd", "vwDPJ5df": "YN2vsKFm"}}]}' \
    > test.out 2>&1
eval_tap $? 61 'UpdatePlatformDLCConfig' test.out

#- 62 DeletePlatformDLCConfig
./ng net.accelbyte.sdk.cli.Main platform deletePlatformDLCConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 62 'DeletePlatformDLCConfig' test.out

#- 63 QueryEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryEntitlements \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --appType 'GAME' \
    --entitlementClazz 'ENTITLEMENT' \
    --entitlementName 'SwRexWur' \
    --itemId 'zFGniM6o,LABOMc0N,ldPDQHKg' \
    --limit '35' \
    --offset '51' \
    --origin 'Other' \
    --userId '9mczwSMm' \
    > test.out 2>&1
eval_tap $? 63 'QueryEntitlements' test.out

#- 64 QueryEntitlements1
./ng net.accelbyte.sdk.cli.Main platform queryEntitlements1 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemIds 'yQXgINTZ,s7AWn1k5,5kVYzdyE' \
    --limit '78' \
    --offset '23' \
    > test.out 2>&1
eval_tap $? 64 'QueryEntitlements1' test.out

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
    --body '{"entitlementGrantList": [{"collectionId": "PIerUVdC", "endDate": "1997-01-08T00:00:00Z", "grantedCode": "oN3H14XW", "itemId": "M89OxRwW", "itemNamespace": "8AVwDpdh", "language": "aC_XWqr", "metadata": {"HQ2LHf6r": {}, "tRZ0FSG7": {}, "wQSyKfzj": {}}, "origin": "Other", "quantity": 76, "region": "21If2meM", "source": "REDEEM_CODE", "startDate": "1974-04-01T00:00:00Z", "storeId": "tuu7nAF1"}, {"collectionId": "38oT6oue", "endDate": "1978-01-26T00:00:00Z", "grantedCode": "BFYARz9H", "itemId": "YhR1dvh8", "itemNamespace": "4gO2AMXC", "language": "AA_lcUw", "metadata": {"GKPfXrFd": {}, "UG6earrf": {}, "TIURQYMQ": {}}, "origin": "System", "quantity": 98, "region": "ELlKgJTS", "source": "REFERRAL_BONUS", "startDate": "1971-10-23T00:00:00Z", "storeId": "6nOmeMZQ"}, {"collectionId": "2mo0pT4P", "endDate": "1998-10-07T00:00:00Z", "grantedCode": "vc1Zzar3", "itemId": "JmU1TP1v", "itemNamespace": "ooj7chGy", "language": "TNxj-FUPq-Js", "metadata": {"a1AWbwqu": {}, "LHudQW9K": {}, "cQ2paVaX": {}}, "origin": "System", "quantity": 1, "region": "Bn2vBczV", "source": "GIFT", "startDate": "1983-11-03T00:00:00Z", "storeId": "fcfQp2K5"}], "userIds": ["mbZg8qoS", "rtCq7S9R", "EpMoAQI7"]}' \
    > test.out 2>&1
eval_tap $? 67 'GrantEntitlements' test.out

#- 68 RevokeEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeEntitlements \
    --namespace "$AB_NAMESPACE" \
    --body '["x61IWMoL", "VFKpJRXq", "ecez983Q"]' \
    > test.out 2>&1
eval_tap $? 68 'RevokeEntitlements' test.out

#- 69 GetEntitlement
./ng net.accelbyte.sdk.cli.Main platform getEntitlement \
    --entitlementId 'xGEP6p2y' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 69 'GetEntitlement' test.out

#- 70 QueryFulfillmentHistories
./ng net.accelbyte.sdk.cli.Main platform queryFulfillmentHistories \
    --namespace "$AB_NAMESPACE" \
    --limit '15' \
    --offset '43' \
    --status 'SUCCESS' \
    --userId 'Hk8lqCem' \
    > test.out 2>&1
eval_tap $? 70 'QueryFulfillmentHistories' test.out

#- 71 QueryIAPClawbackHistory
./ng net.accelbyte.sdk.cli.Main platform queryIAPClawbackHistory \
    --namespace "$AB_NAMESPACE" \
    --endTime 'DuUaPPJE' \
    --eventType 'CHARGEBACK' \
    --externalOrderId 'XANECZep' \
    --limit '63' \
    --offset '34' \
    --startTime 'DBjXTMuV' \
    --status 'FAIL' \
    --userId '7bplFX3F' \
    > test.out 2>&1
eval_tap $? 71 'QueryIAPClawbackHistory' test.out

#- 72 MockPlayStationStreamEvent
./ng net.accelbyte.sdk.cli.Main platform mockPlayStationStreamEvent \
    --namespace "$AB_NAMESPACE" \
    --body '{"body": {"account": "58jR6yIP", "additionalData": {"entitlement": [{"clientTransaction": [{"amountConsumed": 51, "clientTransactionId": "VmkJsaXi"}, {"amountConsumed": 71, "clientTransactionId": "NVWYhSyA"}, {"amountConsumed": 44, "clientTransactionId": "X5sgkf9J"}], "entitlementId": "tUOV57WQ", "usageCount": 79}, {"clientTransaction": [{"amountConsumed": 32, "clientTransactionId": "7kTOQYKB"}, {"amountConsumed": 26, "clientTransactionId": "deqvKher"}, {"amountConsumed": 78, "clientTransactionId": "4ESJ8VEv"}], "entitlementId": "9L1PXpKC", "usageCount": 80}, {"clientTransaction": [{"amountConsumed": 77, "clientTransactionId": "DK20bqYY"}, {"amountConsumed": 52, "clientTransactionId": "ScxD5Apd"}, {"amountConsumed": 23, "clientTransactionId": "O3cv96tQ"}], "entitlementId": "PQ7ofD6h", "usageCount": 65}], "purpose": "g7yeNfwi"}, "originalTitleName": "vwPNSJXY", "paymentProductSKU": "ktTPQNvg", "purchaseDate": "PvVqtpCF", "sourceOrderItemId": "6FYSP2xH", "titleName": "DHgZEK1d"}, "eventDomain": "O5Mbe4n6", "eventSource": "Jfi5qJCd", "eventType": "MnVGrLk3", "eventVersion": 10, "id": "uHkqfNyj", "timestamp": "h6L2hTdz"}' \
    > test.out 2>&1
eval_tap $? 72 'MockPlayStationStreamEvent' test.out

#- 73 GetAppleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getAppleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 73 'GetAppleIAPConfig' test.out

#- 74 UpdateAppleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateAppleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"bundleId": "zQSCqE0v", "password": "MpQknFcd"}' \
    > test.out 2>&1
eval_tap $? 74 'UpdateAppleIAPConfig' test.out

#- 75 DeleteAppleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteAppleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 75 'DeleteAppleIAPConfig' test.out

#- 76 GetEpicGamesIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getEpicGamesIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 76 'GetEpicGamesIAPConfig' test.out

#- 77 UpdateEpicGamesIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateEpicGamesIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"sandboxId": "7Q5RF3Lj"}' \
    > test.out 2>&1
eval_tap $? 77 'UpdateEpicGamesIAPConfig' test.out

#- 78 DeleteEpicGamesIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteEpicGamesIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 78 'DeleteEpicGamesIAPConfig' test.out

#- 79 GetGoogleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getGoogleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 79 'GetGoogleIAPConfig' test.out

#- 80 UpdateGoogleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateGoogleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"applicationName": "PDHdTnls", "serviceAccountId": "1EgwKKMZ"}' \
    > test.out 2>&1
eval_tap $? 80 'UpdateGoogleIAPConfig' test.out

#- 81 DeleteGoogleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteGoogleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 81 'DeleteGoogleIAPConfig' test.out

#- 82 UpdateGoogleP12File
./ng net.accelbyte.sdk.cli.Main platform updateGoogleP12File \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 82 'UpdateGoogleP12File' test.out

#- 83 GetIAPItemConfig
./ng net.accelbyte.sdk.cli.Main platform getIAPItemConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 83 'GetIAPItemConfig' test.out

#- 84 UpdateIAPItemConfig
./ng net.accelbyte.sdk.cli.Main platform updateIAPItemConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"itemIdentity": "qgGbptmB", "itemIdentityType": "ITEM_ID", "platformProductIdMap": {"duxestq8": "078xF49s", "VW15J2GP": "tCYcf5Et", "4Ah4qsP5": "eMAK38zi"}}, {"itemIdentity": "9FJBExjB", "itemIdentityType": "ITEM_ID", "platformProductIdMap": {"fSNlddzK": "Jsa8DpTx", "nz98Wwhz": "rYFxutcr", "grYW8T5w": "ynSFe5bl"}}, {"itemIdentity": "1GUmofeL", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"bUMMqUFD": "7tAGIMS1", "CvnB7xcb": "rJHvJI5V", "fQagMwlt": "ISDyA0X4"}}]}' \
    > test.out 2>&1
eval_tap $? 84 'UpdateIAPItemConfig' test.out

#- 85 DeleteIAPItemConfig
./ng net.accelbyte.sdk.cli.Main platform deleteIAPItemConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 85 'DeleteIAPItemConfig' test.out

#- 86 GetOculusIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getOculusIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 86 'GetOculusIAPConfig' test.out

#- 87 UpdateOculusIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateOculusIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appId": "zS1GhMtw", "appSecret": "Rgy5uT92"}' \
    > test.out 2>&1
eval_tap $? 87 'UpdateOculusIAPConfig' test.out

#- 88 DeleteOculusIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteOculusIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 88 'DeleteOculusIAPConfig' test.out

#- 89 GetPlayStationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getPlayStationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 89 'GetPlayStationIAPConfig' test.out

#- 90 UpdatePlaystationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlaystationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"backOfficeServerClientId": "AMnG7kAf", "backOfficeServerClientSecret": "tKDCqArL", "enableStreamJob": false, "environment": "VMDxTjCH", "streamName": "2A4ahyaU", "streamPartnerName": "ARwh8GCH"}' \
    > test.out 2>&1
eval_tap $? 90 'UpdatePlaystationIAPConfig' test.out

#- 91 DeletePlaystationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deletePlaystationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 91 'DeletePlaystationIAPConfig' test.out

#- 92 ValidateExistedPlaystationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform validateExistedPlaystationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 92 'ValidateExistedPlaystationIAPConfig' test.out

#- 93 ValidatePlaystationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform validatePlaystationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"backOfficeServerClientId": "Rd3y1EBl", "backOfficeServerClientSecret": "6U8ctZpg", "enableStreamJob": false, "environment": "ih6PmAUY", "streamName": "mcOpQHs8", "streamPartnerName": "r8hlAQtr"}' \
    > test.out 2>&1
eval_tap $? 93 'ValidatePlaystationIAPConfig' test.out

#- 94 GetSteamIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getSteamIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 94 'GetSteamIAPConfig' test.out

#- 95 UpdateSteamIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateSteamIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appId": "YOI13jtu", "publisherAuthenticationKey": "S6xPLSDa"}' \
    > test.out 2>&1
eval_tap $? 95 'UpdateSteamIAPConfig' test.out

#- 96 DeleteSteamIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteSteamIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 96 'DeleteSteamIAPConfig' test.out

#- 97 GetTwitchIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getTwitchIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 97 'GetTwitchIAPConfig' test.out

#- 98 UpdateTwitchIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateTwitchIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientId": "W46uy95K", "clientSecret": "W3N3QZeM", "organizationId": "SrmCqGjs"}' \
    > test.out 2>&1
eval_tap $? 98 'UpdateTwitchIAPConfig' test.out

#- 99 DeleteTwitchIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteTwitchIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 99 'DeleteTwitchIAPConfig' test.out

#- 100 GetXblIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getXblIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 100 'GetXblIAPConfig' test.out

#- 101 UpdateXblIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateXblIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"relyingPartyCert": "2LGZlrEl"}' \
    > test.out 2>&1
eval_tap $? 101 'UpdateXblIAPConfig' test.out

#- 102 DeleteXblAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteXblAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 102 'DeleteXblAPConfig' test.out

#- 103 UpdateXblBPCertFile
./ng net.accelbyte.sdk.cli.Main platform updateXblBPCertFile \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    --password '5VBQfKbs' \
    > test.out 2>&1
eval_tap $? 103 'UpdateXblBPCertFile' test.out

#- 104 DownloadInvoiceDetails
./ng net.accelbyte.sdk.cli.Main platform downloadInvoiceDetails \
    --namespace "$AB_NAMESPACE" \
    --endTime 'ggHKu3sl' \
    --feature 'UK016Pk7' \
    --itemId 'Dh6MibTy' \
    --itemType 'BUNDLE' \
    --startTime 'j1XVZC6C' \
    > test.out 2>&1
eval_tap $? 104 'DownloadInvoiceDetails' test.out

#- 105 GenerateInvoiceSummary
./ng net.accelbyte.sdk.cli.Main platform generateInvoiceSummary \
    --namespace "$AB_NAMESPACE" \
    --endTime 'I0YxH5d4' \
    --feature 'KYkFcmik' \
    --itemId '62iw9VSw' \
    --itemType 'SEASON' \
    --startTime 'pjn6kgqu' \
    > test.out 2>&1
eval_tap $? 105 'GenerateInvoiceSummary' test.out

#- 106 SyncInGameItem
./ng net.accelbyte.sdk.cli.Main platform syncInGameItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'iCIZyR1V' \
    --body '{"categoryPath": "cY9OsHbQ", "targetItemId": "FaOjOMfH", "targetNamespace": "oUmGDtl8"}' \
    > test.out 2>&1
eval_tap $? 106 'SyncInGameItem' test.out

#- 107 CreateItem
./ng net.accelbyte.sdk.cli.Main platform createItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'BUJCoH2M' \
    --body '{"appId": "oYOkgUTz", "appType": "DLC", "baseAppId": "jJLLbPaK", "boothName": "aZmXrici", "categoryPath": "NfNeYrAW", "clazz": "QX3BsgRY", "displayOrder": 32, "entitlementType": "DURABLE", "ext": {"cEajZx33": {}, "qTrOGCjx": {}, "38rdNG6l": {}}, "features": ["R689mf5X", "VfzxrLX7", "z4BTR59S"], "flexible": true, "images": [{"as": "6j9WpHq7", "caption": "wziDm2Nv", "height": 56, "imageUrl": "lbbOscb7", "smallImageUrl": "j8XxpSi1", "width": 73}, {"as": "epZagF7q", "caption": "OcMHPuPo", "height": 49, "imageUrl": "KZet87g5", "smallImageUrl": "Jtf5npnq", "width": 23}, {"as": "p9bcmTbq", "caption": "rZuk5MXo", "height": 90, "imageUrl": "KkrmjhKj", "smallImageUrl": "95PAKfIu", "width": 17}], "inventoryConfig": {"customAttributes": {"8trClNwC": {}, "9Usbx4Hp": {}, "SuAIMsr4": {}}, "serverCustomAttributes": {"yDf5iSHw": {}, "G9sGQCyK": {}, "SjPUmGuL": {}}, "slotUsed": 82}, "itemIds": ["ue1x9yQJ", "PcM4md1n", "zr5SZGVh"], "itemQty": {"Qn8GTw67": 65, "VFBHbbis": 19, "QeLXVDS0": 11}, "itemType": "CODE", "listable": true, "localizations": {"ywpfgiCP": {"description": "4ScZiQrG", "localExt": {"RRidzrbb": {}, "z7kGPt78": {}, "jq1irfyG": {}}, "longDescription": "DKHcuEAs", "title": "K3GT6sKY"}, "F74Lf6R6": {"description": "JzW2SCEC", "localExt": {"VY35tLIp": {}, "pogoaNev": {}, "H5Gc2z7h": {}}, "longDescription": "cpY240FS", "title": "p1oC2Xt4"}, "CACdxzai": {"description": "PF8VE9oA", "localExt": {"ZMRlPzHN": {}, "RjFtNVb9": {}, "c19rvaHi": {}}, "longDescription": "NqccxfyH", "title": "8xb3d107"}}, "lootBoxConfig": {"rewardCount": 16, "rewards": [{"lootBoxItems": [{"count": 88, "duration": 74, "endDate": "1999-04-01T00:00:00Z", "itemId": "1JxHv2Ua", "itemSku": "Kc5eiOFl", "itemType": "k3huM7LP"}, {"count": 43, "duration": 28, "endDate": "1999-05-28T00:00:00Z", "itemId": "gVFDtYDh", "itemSku": "jyR3uoT1", "itemType": "Y2tBTpa6"}, {"count": 3, "duration": 2, "endDate": "1978-12-29T00:00:00Z", "itemId": "jjCa8MNR", "itemSku": "TdwOddW3", "itemType": "vwoY8X0E"}], "name": "zLWWLAQB", "odds": 0.11317121731441537, "type": "REWARD", "weight": 25}, {"lootBoxItems": [{"count": 61, "duration": 78, "endDate": "1992-08-23T00:00:00Z", "itemId": "GBu21Y27", "itemSku": "agKVHV1q", "itemType": "X6aYAxn2"}, {"count": 43, "duration": 24, "endDate": "1976-06-05T00:00:00Z", "itemId": "b9ikzEkW", "itemSku": "TwIkE9b7", "itemType": "2nIqgAGt"}, {"count": 52, "duration": 23, "endDate": "1993-11-12T00:00:00Z", "itemId": "9n3VgJjE", "itemSku": "AzCLHYYU", "itemType": "Gl4UvUTE"}], "name": "njRalegU", "odds": 0.8125504433110291, "type": "PROBABILITY_GROUP", "weight": 31}, {"lootBoxItems": [{"count": 56, "duration": 69, "endDate": "1992-05-10T00:00:00Z", "itemId": "MZY0b6Wv", "itemSku": "xMYt6O2z", "itemType": "gfiH2X2n"}, {"count": 45, "duration": 83, "endDate": "1992-11-19T00:00:00Z", "itemId": "MUCPOydm", "itemSku": "O7sn22SM", "itemType": "2fJ8ZQ6R"}, {"count": 65, "duration": 11, "endDate": "1998-07-12T00:00:00Z", "itemId": "ahv5YseR", "itemSku": "fhE4vFB5", "itemType": "rPHLOMJu"}], "name": "CjRT7mOc", "odds": 0.7309488607064045, "type": "REWARD", "weight": 14}], "rollFunction": "DEFAULT"}, "maxCount": 42, "maxCountPerUser": 61, "name": "3eOPuHvl", "optionBoxConfig": {"boxItems": [{"count": 91, "duration": 13, "endDate": "1972-11-23T00:00:00Z", "itemId": "Du97Awl6", "itemSku": "Bbhjj3Ae", "itemType": "kAqO6UDU"}, {"count": 39, "duration": 30, "endDate": "1995-12-30T00:00:00Z", "itemId": "085ElouJ", "itemSku": "6XiRJy28", "itemType": "HkkAeMmM"}, {"count": 31, "duration": 40, "endDate": "1972-02-04T00:00:00Z", "itemId": "L8S3LBKX", "itemSku": "sDGowan1", "itemType": "o9fETVVP"}]}, "purchasable": true, "recurring": {"cycle": "MONTHLY", "fixedFreeDays": 10, "fixedTrialCycles": 84, "graceDays": 25}, "regionData": {"hE3OIthq": [{"currencyCode": "pbWYk3qv", "currencyNamespace": "ysORkOkh", "currencyType": "REAL", "discountAmount": 45, "discountExpireAt": "1993-12-15T00:00:00Z", "discountPercentage": 0, "discountPurchaseAt": "1985-08-16T00:00:00Z", "expireAt": "1974-04-05T00:00:00Z", "price": 59, "purchaseAt": "1989-05-28T00:00:00Z", "trialPrice": 5}, {"currencyCode": "1sqNRh4t", "currencyNamespace": "NxCDFsT1", "currencyType": "REAL", "discountAmount": 13, "discountExpireAt": "1995-08-07T00:00:00Z", "discountPercentage": 49, "discountPurchaseAt": "1988-11-28T00:00:00Z", "expireAt": "1984-12-15T00:00:00Z", "price": 78, "purchaseAt": "1999-10-16T00:00:00Z", "trialPrice": 96}, {"currencyCode": "wGdYQSzO", "currencyNamespace": "XwoytJhg", "currencyType": "VIRTUAL", "discountAmount": 79, "discountExpireAt": "1988-08-05T00:00:00Z", "discountPercentage": 29, "discountPurchaseAt": "1994-08-16T00:00:00Z", "expireAt": "1993-04-04T00:00:00Z", "price": 38, "purchaseAt": "1989-01-28T00:00:00Z", "trialPrice": 98}], "XlSc7mYk": [{"currencyCode": "uv2VjZ87", "currencyNamespace": "Tg3GpnkD", "currencyType": "VIRTUAL", "discountAmount": 66, "discountExpireAt": "1978-08-06T00:00:00Z", "discountPercentage": 43, "discountPurchaseAt": "1983-10-29T00:00:00Z", "expireAt": "1988-10-30T00:00:00Z", "price": 32, "purchaseAt": "1995-05-14T00:00:00Z", "trialPrice": 80}, {"currencyCode": "qynXfJ1p", "currencyNamespace": "C920HhDL", "currencyType": "VIRTUAL", "discountAmount": 68, "discountExpireAt": "1988-12-17T00:00:00Z", "discountPercentage": 20, "discountPurchaseAt": "1987-02-15T00:00:00Z", "expireAt": "1977-07-18T00:00:00Z", "price": 30, "purchaseAt": "1976-02-27T00:00:00Z", "trialPrice": 52}, {"currencyCode": "kIkxGTUu", "currencyNamespace": "v8pb9Tt6", "currencyType": "REAL", "discountAmount": 70, "discountExpireAt": "1990-12-08T00:00:00Z", "discountPercentage": 55, "discountPurchaseAt": "1983-01-12T00:00:00Z", "expireAt": "1994-04-22T00:00:00Z", "price": 63, "purchaseAt": "1980-04-22T00:00:00Z", "trialPrice": 5}], "7Xa3T1uE": [{"currencyCode": "LYQj91MK", "currencyNamespace": "wiBJzo86", "currencyType": "REAL", "discountAmount": 60, "discountExpireAt": "1972-03-21T00:00:00Z", "discountPercentage": 26, "discountPurchaseAt": "1976-05-24T00:00:00Z", "expireAt": "1989-01-12T00:00:00Z", "price": 9, "purchaseAt": "1975-02-03T00:00:00Z", "trialPrice": 21}, {"currencyCode": "1Y6yelyB", "currencyNamespace": "DSbdLboS", "currencyType": "VIRTUAL", "discountAmount": 0, "discountExpireAt": "1999-01-31T00:00:00Z", "discountPercentage": 91, "discountPurchaseAt": "1980-09-04T00:00:00Z", "expireAt": "1993-04-20T00:00:00Z", "price": 90, "purchaseAt": "1981-10-02T00:00:00Z", "trialPrice": 88}, {"currencyCode": "PYbgUjxy", "currencyNamespace": "L9yGL5ce", "currencyType": "REAL", "discountAmount": 5, "discountExpireAt": "1985-05-29T00:00:00Z", "discountPercentage": 13, "discountPurchaseAt": "1980-10-24T00:00:00Z", "expireAt": "1978-07-18T00:00:00Z", "price": 53, "purchaseAt": "1995-11-27T00:00:00Z", "trialPrice": 17}]}, "saleConfig": {"currencyCode": "EyGvlegS", "price": 58}, "seasonType": "PASS", "sectionExclusive": true, "sellable": true, "sku": "QGwhOuhO", "stackable": true, "status": "INACTIVE", "tags": ["f1wUj1XS", "xWURz0GX", "XLKnywiT"], "targetCurrencyCode": "Qjfsq8HR", "targetNamespace": "RgJkqZTj", "thumbnailUrl": "uFErhXBH", "useCount": 99}' \
    > test.out 2>&1
eval_tap $? 107 'CreateItem' test.out

#- 108 GetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform getItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'SQe9VMvb' \
    --appId 'ROuOZmKp' \
    > test.out 2>&1
eval_tap $? 108 'GetItemByAppId' test.out

#- 109 QueryItems
./ng net.accelbyte.sdk.cli.Main platform queryItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --appType 'GAME' \
    --availableDate 'VVeEKDEN' \
    --baseAppId '6bDiuy7a' \
    --categoryPath 'eJ7rGqiU' \
    --features 'KtEtUy3T' \
    --includeSubCategoryItem  \
    --itemType 'BUNDLE' \
    --limit '5' \
    --offset '78' \
    --region 'Jx7dnYbw' \
    --sortBy 'name,name:desc,createdAt:asc' \
    --storeId '8r1PAWir' \
    --tags 'GxANhGAZ' \
    --targetNamespace 'iTMC7wso' \
    > test.out 2>&1
eval_tap $? 109 'QueryItems' test.out

#- 110 ListBasicItemsByFeatures
./ng net.accelbyte.sdk.cli.Main platform listBasicItemsByFeatures \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --features 'lDOnizoZ,owoi1B5y,GhLDyVwC' \
    > test.out 2>&1
eval_tap $? 110 'ListBasicItemsByFeatures' test.out

#- 111 GetItems
./ng net.accelbyte.sdk.cli.Main platform getItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId '5U6RYQ3X' \
    --itemIds 'nQclpmwP' \
    > test.out 2>&1
eval_tap $? 111 'GetItems' test.out

#- 112 GetItemBySku
./ng net.accelbyte.sdk.cli.Main platform getItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'CmfepWIa' \
    --sku 'Jf8EliEG' \
    > test.out 2>&1
eval_tap $? 112 'GetItemBySku' test.out

#- 113 GetLocaleItemBySku
./ng net.accelbyte.sdk.cli.Main platform getLocaleItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language '7EZ1QjVL' \
    --populateBundle  \
    --region '2wVzjouH' \
    --storeId 'TmkVV8ZE' \
    --sku 'J80OAqUU' \
    > test.out 2>&1
eval_tap $? 113 'GetLocaleItemBySku' test.out

#- 114 GetEstimatedPrice
./ng net.accelbyte.sdk.cli.Main platform getEstimatedPrice \
    --namespace "$AB_NAMESPACE" \
    --platform 'abajM5DC' \
    --region 'TZHNRrpC' \
    --storeId 'QETsDah3' \
    --itemIds 'dsXEuRr7' \
    --userId 'QhNQJYMJ' \
    > test.out 2>&1
eval_tap $? 114 'GetEstimatedPrice' test.out

#- 115 GetItemIdBySku
./ng net.accelbyte.sdk.cli.Main platform getItemIdBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'P5TU4qgI' \
    --sku 'LKAv8bvV' \
    > test.out 2>&1
eval_tap $? 115 'GetItemIdBySku' test.out

#- 116 GetBulkItemIdBySkus
./ng net.accelbyte.sdk.cli.Main platform getBulkItemIdBySkus \
    --namespace "$AB_NAMESPACE" \
    --sku 'zFNcoWDG,6ckUssyD,LxEUxaTZ' \
    --storeId 'nhHikQhW' \
    > test.out 2>&1
eval_tap $? 116 'GetBulkItemIdBySkus' test.out

#- 117 BulkGetLocaleItems
./ng net.accelbyte.sdk.cli.Main platform bulkGetLocaleItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'HCAa3qMR' \
    --region 'uY46OWRm' \
    --storeId 'UrbcO7uV' \
    --itemIds 'jct0i7H3' \
    > test.out 2>&1
eval_tap $? 117 'BulkGetLocaleItems' test.out

#- 118 GetAvailablePredicateTypes
./ng net.accelbyte.sdk.cli.Main platform getAvailablePredicateTypes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 118 'GetAvailablePredicateTypes' test.out

#- 119 ValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform validateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --platform 'lbSWjtJM' \
    --userId 'UdYyHBhy' \
    --body '{"itemIds": ["T9rJlxvQ", "vZrGFgAe", "K25MRLiX"]}' \
    > test.out 2>&1
eval_tap $? 119 'ValidateItemPurchaseCondition' test.out

#- 120 BulkUpdateRegionData
./ng net.accelbyte.sdk.cli.Main platform bulkUpdateRegionData \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ofz0syGY' \
    --body '{"changes": [{"itemIdentities": ["kBmK21Ft", "gZaL4VO3", "3nrGfhML"], "itemIdentityType": "ITEM_ID", "regionData": {"4yox4T4k": [{"currencyCode": "KdoWV8oH", "currencyNamespace": "jRSZw7l7", "currencyType": "VIRTUAL", "discountAmount": 69, "discountExpireAt": "1999-01-30T00:00:00Z", "discountPercentage": 47, "discountPurchaseAt": "1986-12-11T00:00:00Z", "discountedPrice": 37, "expireAt": "1999-09-08T00:00:00Z", "price": 78, "purchaseAt": "1999-03-01T00:00:00Z", "trialPrice": 10}, {"currencyCode": "jTRwBPaq", "currencyNamespace": "5RhfT3MP", "currencyType": "REAL", "discountAmount": 14, "discountExpireAt": "1992-09-30T00:00:00Z", "discountPercentage": 49, "discountPurchaseAt": "1994-12-14T00:00:00Z", "discountedPrice": 77, "expireAt": "1979-06-09T00:00:00Z", "price": 31, "purchaseAt": "1996-11-05T00:00:00Z", "trialPrice": 57}, {"currencyCode": "QENLM9xw", "currencyNamespace": "FHQXleFR", "currencyType": "REAL", "discountAmount": 13, "discountExpireAt": "1999-06-25T00:00:00Z", "discountPercentage": 9, "discountPurchaseAt": "1999-01-08T00:00:00Z", "discountedPrice": 43, "expireAt": "1983-06-28T00:00:00Z", "price": 19, "purchaseAt": "1987-07-09T00:00:00Z", "trialPrice": 40}], "JSk8UxnN": [{"currencyCode": "p7T1unkc", "currencyNamespace": "OkqSyRrm", "currencyType": "VIRTUAL", "discountAmount": 91, "discountExpireAt": "1974-08-13T00:00:00Z", "discountPercentage": 43, "discountPurchaseAt": "1991-04-03T00:00:00Z", "discountedPrice": 70, "expireAt": "1981-09-20T00:00:00Z", "price": 78, "purchaseAt": "1989-06-11T00:00:00Z", "trialPrice": 70}, {"currencyCode": "ebzaZt2Q", "currencyNamespace": "a1aYqHV2", "currencyType": "REAL", "discountAmount": 45, "discountExpireAt": "1979-09-03T00:00:00Z", "discountPercentage": 7, "discountPurchaseAt": "1996-08-20T00:00:00Z", "discountedPrice": 95, "expireAt": "1974-03-26T00:00:00Z", "price": 93, "purchaseAt": "1983-10-29T00:00:00Z", "trialPrice": 59}, {"currencyCode": "9OH3KpHT", "currencyNamespace": "OR5TOFkQ", "currencyType": "VIRTUAL", "discountAmount": 0, "discountExpireAt": "1994-07-09T00:00:00Z", "discountPercentage": 88, "discountPurchaseAt": "1991-08-29T00:00:00Z", "discountedPrice": 58, "expireAt": "1987-02-14T00:00:00Z", "price": 36, "purchaseAt": "1996-12-06T00:00:00Z", "trialPrice": 69}], "Sqnoqj7P": [{"currencyCode": "fnOdhB9y", "currencyNamespace": "ZJxi4BVs", "currencyType": "VIRTUAL", "discountAmount": 85, "discountExpireAt": "1980-11-28T00:00:00Z", "discountPercentage": 80, "discountPurchaseAt": "1993-03-21T00:00:00Z", "discountedPrice": 84, "expireAt": "1978-07-21T00:00:00Z", "price": 26, "purchaseAt": "1980-01-04T00:00:00Z", "trialPrice": 86}, {"currencyCode": "iZLB4hnc", "currencyNamespace": "hUFvGgh0", "currencyType": "REAL", "discountAmount": 7, "discountExpireAt": "1987-04-01T00:00:00Z", "discountPercentage": 36, "discountPurchaseAt": "1976-10-03T00:00:00Z", "discountedPrice": 46, "expireAt": "1987-09-21T00:00:00Z", "price": 49, "purchaseAt": "1988-09-03T00:00:00Z", "trialPrice": 47}, {"currencyCode": "NxN6cr44", "currencyNamespace": "jFZbpkB6", "currencyType": "VIRTUAL", "discountAmount": 0, "discountExpireAt": "1981-02-22T00:00:00Z", "discountPercentage": 21, "discountPurchaseAt": "1982-10-23T00:00:00Z", "discountedPrice": 57, "expireAt": "1972-01-13T00:00:00Z", "price": 90, "purchaseAt": "1982-05-26T00:00:00Z", "trialPrice": 76}]}}, {"itemIdentities": ["RloWQJMx", "YRmxIFgb", "IEfSUKM7"], "itemIdentityType": "ITEM_ID", "regionData": {"42ZdGLEh": [{"currencyCode": "GQHXzUIC", "currencyNamespace": "9xs1j6LH", "currencyType": "REAL", "discountAmount": 8, "discountExpireAt": "1984-08-15T00:00:00Z", "discountPercentage": 53, "discountPurchaseAt": "1986-10-12T00:00:00Z", "discountedPrice": 7, "expireAt": "1995-08-11T00:00:00Z", "price": 47, "purchaseAt": "1996-05-07T00:00:00Z", "trialPrice": 90}, {"currencyCode": "Svc2XySg", "currencyNamespace": "PwXRESL1", "currencyType": "REAL", "discountAmount": 5, "discountExpireAt": "1977-04-30T00:00:00Z", "discountPercentage": 84, "discountPurchaseAt": "1992-06-09T00:00:00Z", "discountedPrice": 3, "expireAt": "1986-10-04T00:00:00Z", "price": 96, "purchaseAt": "1982-05-20T00:00:00Z", "trialPrice": 61}, {"currencyCode": "RbLp56wc", "currencyNamespace": "WnHRCJEY", "currencyType": "VIRTUAL", "discountAmount": 43, "discountExpireAt": "1999-07-27T00:00:00Z", "discountPercentage": 8, "discountPurchaseAt": "1977-05-13T00:00:00Z", "discountedPrice": 34, "expireAt": "1971-08-06T00:00:00Z", "price": 93, "purchaseAt": "1996-06-05T00:00:00Z", "trialPrice": 74}], "BQSKgP55": [{"currencyCode": "XWOdVv03", "currencyNamespace": "9tBctgiX", "currencyType": "VIRTUAL", "discountAmount": 30, "discountExpireAt": "1997-02-12T00:00:00Z", "discountPercentage": 50, "discountPurchaseAt": "1993-07-23T00:00:00Z", "discountedPrice": 82, "expireAt": "1974-08-05T00:00:00Z", "price": 2, "purchaseAt": "1998-09-19T00:00:00Z", "trialPrice": 18}, {"currencyCode": "DcomZVoF", "currencyNamespace": "GurL5DxO", "currencyType": "REAL", "discountAmount": 90, "discountExpireAt": "1989-06-26T00:00:00Z", "discountPercentage": 44, "discountPurchaseAt": "1974-10-04T00:00:00Z", "discountedPrice": 98, "expireAt": "1982-11-03T00:00:00Z", "price": 9, "purchaseAt": "1995-07-16T00:00:00Z", "trialPrice": 2}, {"currencyCode": "5yfxexUi", "currencyNamespace": "5jkqEqZi", "currencyType": "REAL", "discountAmount": 56, "discountExpireAt": "1979-10-03T00:00:00Z", "discountPercentage": 83, "discountPurchaseAt": "1988-07-01T00:00:00Z", "discountedPrice": 94, "expireAt": "1979-07-24T00:00:00Z", "price": 57, "purchaseAt": "1996-12-31T00:00:00Z", "trialPrice": 80}], "PntvzVKG": [{"currencyCode": "g08SXwiT", "currencyNamespace": "SPnWBubp", "currencyType": "VIRTUAL", "discountAmount": 3, "discountExpireAt": "1995-04-18T00:00:00Z", "discountPercentage": 68, "discountPurchaseAt": "1973-01-05T00:00:00Z", "discountedPrice": 90, "expireAt": "1994-04-22T00:00:00Z", "price": 95, "purchaseAt": "1998-11-14T00:00:00Z", "trialPrice": 23}, {"currencyCode": "VSQ0SmRF", "currencyNamespace": "mIfN5jUU", "currencyType": "VIRTUAL", "discountAmount": 36, "discountExpireAt": "1985-11-04T00:00:00Z", "discountPercentage": 33, "discountPurchaseAt": "1980-06-26T00:00:00Z", "discountedPrice": 48, "expireAt": "1992-01-05T00:00:00Z", "price": 47, "purchaseAt": "1996-03-20T00:00:00Z", "trialPrice": 56}, {"currencyCode": "oNATIM2W", "currencyNamespace": "v1lIJLzW", "currencyType": "REAL", "discountAmount": 61, "discountExpireAt": "1988-06-05T00:00:00Z", "discountPercentage": 1, "discountPurchaseAt": "1985-07-06T00:00:00Z", "discountedPrice": 79, "expireAt": "1981-07-04T00:00:00Z", "price": 32, "purchaseAt": "1982-06-30T00:00:00Z", "trialPrice": 23}]}}, {"itemIdentities": ["o0n2pbrO", "hoQ2hpAi", "6KWl9Y9P"], "itemIdentityType": "ITEM_ID", "regionData": {"qz5Dqlqi": [{"currencyCode": "PyhDmkPy", "currencyNamespace": "a1OebXPw", "currencyType": "VIRTUAL", "discountAmount": 40, "discountExpireAt": "1998-03-20T00:00:00Z", "discountPercentage": 96, "discountPurchaseAt": "1998-12-27T00:00:00Z", "discountedPrice": 88, "expireAt": "1989-07-18T00:00:00Z", "price": 8, "purchaseAt": "1978-11-30T00:00:00Z", "trialPrice": 26}, {"currencyCode": "i0NbqLV6", "currencyNamespace": "Sjv42r7P", "currencyType": "REAL", "discountAmount": 86, "discountExpireAt": "1988-04-07T00:00:00Z", "discountPercentage": 88, "discountPurchaseAt": "1980-09-20T00:00:00Z", "discountedPrice": 45, "expireAt": "1979-09-23T00:00:00Z", "price": 86, "purchaseAt": "1996-11-07T00:00:00Z", "trialPrice": 88}, {"currencyCode": "xv6atCcd", "currencyNamespace": "zhIeCzUB", "currencyType": "VIRTUAL", "discountAmount": 66, "discountExpireAt": "1988-03-10T00:00:00Z", "discountPercentage": 97, "discountPurchaseAt": "1996-04-28T00:00:00Z", "discountedPrice": 15, "expireAt": "1979-12-27T00:00:00Z", "price": 18, "purchaseAt": "1991-01-17T00:00:00Z", "trialPrice": 55}], "FjBPsIXA": [{"currencyCode": "pKJUa9S2", "currencyNamespace": "4Dilnl7t", "currencyType": "REAL", "discountAmount": 59, "discountExpireAt": "1990-10-27T00:00:00Z", "discountPercentage": 76, "discountPurchaseAt": "1987-05-05T00:00:00Z", "discountedPrice": 98, "expireAt": "1996-02-03T00:00:00Z", "price": 12, "purchaseAt": "1988-09-30T00:00:00Z", "trialPrice": 18}, {"currencyCode": "rZEgbwQQ", "currencyNamespace": "blQmiB53", "currencyType": "REAL", "discountAmount": 53, "discountExpireAt": "1996-07-28T00:00:00Z", "discountPercentage": 90, "discountPurchaseAt": "1978-04-17T00:00:00Z", "discountedPrice": 100, "expireAt": "1994-09-11T00:00:00Z", "price": 74, "purchaseAt": "1983-07-14T00:00:00Z", "trialPrice": 33}, {"currencyCode": "CuCTlLHl", "currencyNamespace": "ePhBuJ7t", "currencyType": "VIRTUAL", "discountAmount": 82, "discountExpireAt": "1975-05-14T00:00:00Z", "discountPercentage": 51, "discountPurchaseAt": "1975-03-02T00:00:00Z", "discountedPrice": 99, "expireAt": "1989-12-06T00:00:00Z", "price": 28, "purchaseAt": "1980-07-05T00:00:00Z", "trialPrice": 83}], "YpZWUNgv": [{"currencyCode": "9CMijlEp", "currencyNamespace": "kFp7KZJg", "currencyType": "VIRTUAL", "discountAmount": 0, "discountExpireAt": "1977-09-19T00:00:00Z", "discountPercentage": 8, "discountPurchaseAt": "1978-10-11T00:00:00Z", "discountedPrice": 7, "expireAt": "1985-09-29T00:00:00Z", "price": 43, "purchaseAt": "1985-01-17T00:00:00Z", "trialPrice": 20}, {"currencyCode": "goMbVluX", "currencyNamespace": "uPBAEtCV", "currencyType": "VIRTUAL", "discountAmount": 75, "discountExpireAt": "1974-09-16T00:00:00Z", "discountPercentage": 66, "discountPurchaseAt": "1993-10-25T00:00:00Z", "discountedPrice": 44, "expireAt": "1976-12-29T00:00:00Z", "price": 10, "purchaseAt": "1987-12-26T00:00:00Z", "trialPrice": 51}, {"currencyCode": "7Zybgj8r", "currencyNamespace": "ZpSZ7Wja", "currencyType": "REAL", "discountAmount": 17, "discountExpireAt": "1999-06-03T00:00:00Z", "discountPercentage": 99, "discountPurchaseAt": "1971-11-11T00:00:00Z", "discountedPrice": 8, "expireAt": "1994-06-12T00:00:00Z", "price": 60, "purchaseAt": "1998-09-05T00:00:00Z", "trialPrice": 80}]}}]}' \
    > test.out 2>&1
eval_tap $? 120 'BulkUpdateRegionData' test.out

#- 121 SearchItems
./ng net.accelbyte.sdk.cli.Main platform searchItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemType 'LOOTBOX' \
    --limit '41' \
    --offset '93' \
    --sortBy '75aOyEUy' \
    --storeId '0TIz2c9H' \
    --keyword 'qFItRc8a' \
    --language 'yS3yZ38U' \
    > test.out 2>&1
eval_tap $? 121 'SearchItems' test.out

#- 122 QueryUncategorizedItems
./ng net.accelbyte.sdk.cli.Main platform queryUncategorizedItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --limit '74' \
    --offset '79' \
    --sortBy 'updatedAt:desc,createdAt:asc' \
    --storeId 'RktxHX11' \
    > test.out 2>&1
eval_tap $? 122 'QueryUncategorizedItems' test.out

#- 123 GetItem
./ng net.accelbyte.sdk.cli.Main platform getItem \
    --itemId 'HmT87dxc' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'rNZIoMFt' \
    > test.out 2>&1
eval_tap $? 123 'GetItem' test.out

#- 124 UpdateItem
./ng net.accelbyte.sdk.cli.Main platform updateItem \
    --itemId 'WFjqVmFu' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'NTkUP2Ye' \
    --body '{"appId": "Ot1qwsUM", "appType": "DEMO", "baseAppId": "P4DttiDl", "boothName": "EM6xNTVj", "categoryPath": "26bvD08O", "clazz": "UDwxa1b0", "displayOrder": 33, "entitlementType": "DURABLE", "ext": {"vqr7INrk": {}, "zZgVgfkV": {}, "d0DwHI1t": {}}, "features": ["f2H8oF9e", "1PCW1hvT", "H5yoVGpI"], "flexible": true, "images": [{"as": "Jz3wdi9m", "caption": "ANBu9Mxv", "height": 71, "imageUrl": "Q2Wye3tz", "smallImageUrl": "VX867fTO", "width": 42}, {"as": "3TQuXICK", "caption": "svoTrsoE", "height": 94, "imageUrl": "PxMsJDlJ", "smallImageUrl": "AAwCpnzV", "width": 11}, {"as": "xRJ1YvoN", "caption": "AjfbZGw3", "height": 70, "imageUrl": "fod7mhCG", "smallImageUrl": "DBf4TMkE", "width": 32}], "inventoryConfig": {"customAttributes": {"8MVxaF1i": {}, "hfrZDHEz": {}, "h4AR1vYV": {}}, "serverCustomAttributes": {"5hm1431t": {}, "wiLMDQaF": {}, "v8dxCljw": {}}, "slotUsed": 71}, "itemIds": ["RpeVrKFC", "0p64SrEq", "xrduOkec"], "itemQty": {"ESsXTufN": 79, "VHC1jmgr": 10, "5KruxDJD": 14}, "itemType": "COINS", "listable": false, "localizations": {"jHm34sQb": {"description": "Rjl0zQkb", "localExt": {"jz0SogZX": {}, "Olflbih0": {}, "7ZvKkDXk": {}}, "longDescription": "V1ijDxQk", "title": "f2H5Ynoo"}, "t6XM0CoX": {"description": "WpKrNsIz", "localExt": {"tEKpfPR9": {}, "uVTVNd7o": {}, "pwOsTmH6": {}}, "longDescription": "Qj1CFjmy", "title": "im77KaJv"}, "glB4XktJ": {"description": "XJa9mHn7", "localExt": {"xZlKPTat": {}, "WYY0L3g1": {}, "Y2j73VAo": {}}, "longDescription": "v20DLdOW", "title": "1izHDY6t"}}, "lootBoxConfig": {"rewardCount": 37, "rewards": [{"lootBoxItems": [{"count": 4, "duration": 72, "endDate": "1978-05-11T00:00:00Z", "itemId": "IhLTMygW", "itemSku": "gH4nPfxt", "itemType": "ZUZCv2Bw"}, {"count": 82, "duration": 17, "endDate": "1972-12-28T00:00:00Z", "itemId": "fthsxU0N", "itemSku": "wbQOP0Y9", "itemType": "8EJ4QUYA"}, {"count": 46, "duration": 68, "endDate": "1979-09-26T00:00:00Z", "itemId": "ObzJp7Co", "itemSku": "1NhL5OM2", "itemType": "bhC704qU"}], "name": "87HK4n0K", "odds": 0.4950620057926377, "type": "PROBABILITY_GROUP", "weight": 88}, {"lootBoxItems": [{"count": 20, "duration": 27, "endDate": "1973-06-23T00:00:00Z", "itemId": "zJuO43qE", "itemSku": "2YSdpX2a", "itemType": "iW9CL4Bm"}, {"count": 75, "duration": 47, "endDate": "1972-12-14T00:00:00Z", "itemId": "5TDzoKVv", "itemSku": "jHAVTy7x", "itemType": "aka0fTZw"}, {"count": 11, "duration": 25, "endDate": "1980-04-11T00:00:00Z", "itemId": "2qrOZIVG", "itemSku": "TQ9VPDxw", "itemType": "V1WxsKYq"}], "name": "z33I2Vea", "odds": 0.24785175000687698, "type": "REWARD_GROUP", "weight": 23}, {"lootBoxItems": [{"count": 16, "duration": 19, "endDate": "1986-11-04T00:00:00Z", "itemId": "Rskv4eDI", "itemSku": "kHqG49EB", "itemType": "YRo3JvmK"}, {"count": 28, "duration": 20, "endDate": "1989-11-18T00:00:00Z", "itemId": "SZAY9O9R", "itemSku": "Xak286Ez", "itemType": "LUDSegIQ"}, {"count": 14, "duration": 36, "endDate": "1985-11-28T00:00:00Z", "itemId": "MIWLWD1m", "itemSku": "FHmR7Mvb", "itemType": "kA8wakJh"}], "name": "3dNhBRKT", "odds": 0.22059138217541174, "type": "REWARD_GROUP", "weight": 11}], "rollFunction": "DEFAULT"}, "maxCount": 43, "maxCountPerUser": 33, "name": "qS6GKdTe", "optionBoxConfig": {"boxItems": [{"count": 59, "duration": 93, "endDate": "1999-07-16T00:00:00Z", "itemId": "WmIGHvXI", "itemSku": "a3IEa7mm", "itemType": "fjakqOkq"}, {"count": 21, "duration": 95, "endDate": "1982-02-14T00:00:00Z", "itemId": "mBqqa0FC", "itemSku": "71xqMIcN", "itemType": "ud8HVhjv"}, {"count": 100, "duration": 79, "endDate": "1999-04-12T00:00:00Z", "itemId": "KlE7Ifkl", "itemSku": "GQcuku1k", "itemType": "zuIvRp4j"}]}, "purchasable": false, "recurring": {"cycle": "QUARTERLY", "fixedFreeDays": 44, "fixedTrialCycles": 42, "graceDays": 60}, "regionData": {"eORKSI0J": [{"currencyCode": "8Zp8PhRO", "currencyNamespace": "nwbwXVrg", "currencyType": "REAL", "discountAmount": 52, "discountExpireAt": "1996-03-02T00:00:00Z", "discountPercentage": 66, "discountPurchaseAt": "1984-04-26T00:00:00Z", "expireAt": "1972-05-30T00:00:00Z", "price": 38, "purchaseAt": "1977-02-06T00:00:00Z", "trialPrice": 51}, {"currencyCode": "7a2F1bec", "currencyNamespace": "wO1jBwHW", "currencyType": "VIRTUAL", "discountAmount": 77, "discountExpireAt": "1988-09-11T00:00:00Z", "discountPercentage": 47, "discountPurchaseAt": "1972-03-30T00:00:00Z", "expireAt": "1974-01-15T00:00:00Z", "price": 47, "purchaseAt": "1984-07-28T00:00:00Z", "trialPrice": 13}, {"currencyCode": "ConovP7V", "currencyNamespace": "QpAdkiTU", "currencyType": "REAL", "discountAmount": 19, "discountExpireAt": "1977-05-04T00:00:00Z", "discountPercentage": 91, "discountPurchaseAt": "1984-01-07T00:00:00Z", "expireAt": "1994-12-16T00:00:00Z", "price": 81, "purchaseAt": "1993-07-11T00:00:00Z", "trialPrice": 4}], "gVLKFKbl": [{"currencyCode": "p1knuvbU", "currencyNamespace": "jPMYYoxC", "currencyType": "VIRTUAL", "discountAmount": 92, "discountExpireAt": "1996-07-30T00:00:00Z", "discountPercentage": 19, "discountPurchaseAt": "1991-05-01T00:00:00Z", "expireAt": "1996-09-27T00:00:00Z", "price": 95, "purchaseAt": "1999-07-23T00:00:00Z", "trialPrice": 46}, {"currencyCode": "1H4Kmzha", "currencyNamespace": "18WmwkSn", "currencyType": "VIRTUAL", "discountAmount": 61, "discountExpireAt": "1990-05-01T00:00:00Z", "discountPercentage": 35, "discountPurchaseAt": "1971-05-09T00:00:00Z", "expireAt": "1975-09-28T00:00:00Z", "price": 41, "purchaseAt": "1989-08-14T00:00:00Z", "trialPrice": 23}, {"currencyCode": "cc8WClEG", "currencyNamespace": "izlqVbi5", "currencyType": "REAL", "discountAmount": 99, "discountExpireAt": "1998-09-12T00:00:00Z", "discountPercentage": 49, "discountPurchaseAt": "1991-07-20T00:00:00Z", "expireAt": "1979-09-19T00:00:00Z", "price": 46, "purchaseAt": "1976-11-30T00:00:00Z", "trialPrice": 27}], "2wOK5Yjn": [{"currencyCode": "V5oNWNid", "currencyNamespace": "U8jwdAbR", "currencyType": "REAL", "discountAmount": 56, "discountExpireAt": "1983-01-06T00:00:00Z", "discountPercentage": 56, "discountPurchaseAt": "1993-04-10T00:00:00Z", "expireAt": "1985-10-04T00:00:00Z", "price": 42, "purchaseAt": "1992-09-08T00:00:00Z", "trialPrice": 75}, {"currencyCode": "TtIT12W1", "currencyNamespace": "Gob0EmkK", "currencyType": "REAL", "discountAmount": 94, "discountExpireAt": "1979-07-16T00:00:00Z", "discountPercentage": 11, "discountPurchaseAt": "1977-04-05T00:00:00Z", "expireAt": "1978-05-18T00:00:00Z", "price": 71, "purchaseAt": "1977-05-19T00:00:00Z", "trialPrice": 38}, {"currencyCode": "qKptSMAO", "currencyNamespace": "qQCHUhWe", "currencyType": "VIRTUAL", "discountAmount": 60, "discountExpireAt": "1972-12-01T00:00:00Z", "discountPercentage": 34, "discountPurchaseAt": "1999-01-22T00:00:00Z", "expireAt": "1993-05-05T00:00:00Z", "price": 69, "purchaseAt": "1986-02-14T00:00:00Z", "trialPrice": 78}]}, "saleConfig": {"currencyCode": "ixlJgpdB", "price": 8}, "seasonType": "TIER", "sectionExclusive": true, "sellable": true, "sku": "VeXucKTq", "stackable": true, "status": "ACTIVE", "tags": ["WpDnsFf2", "yILM8rDR", "aMqhh0xX"], "targetCurrencyCode": "j2bya8Vn", "targetNamespace": "tCGUkRtq", "thumbnailUrl": "s959ptgX", "useCount": 88}' \
    > test.out 2>&1
eval_tap $? 124 'UpdateItem' test.out

#- 125 DeleteItem
./ng net.accelbyte.sdk.cli.Main platform deleteItem \
    --itemId 'OBXC3dIY' \
    --namespace "$AB_NAMESPACE" \
    --force  \
    --storeId 'IwpbQXsS' \
    > test.out 2>&1
eval_tap $? 125 'DeleteItem' test.out

#- 126 AcquireItem
./ng net.accelbyte.sdk.cli.Main platform acquireItem \
    --itemId '435fvheB' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 25, "orderNo": "SCVY8K0y"}' \
    > test.out 2>&1
eval_tap $? 126 'AcquireItem' test.out

#- 127 GetApp
./ng net.accelbyte.sdk.cli.Main platform getApp \
    --itemId 'PDp0mq1z' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'gNnkiYpL' \
    > test.out 2>&1
eval_tap $? 127 'GetApp' test.out

#- 128 UpdateApp
./ng net.accelbyte.sdk.cli.Main platform updateApp \
    --itemId 'Ap921cEP' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'BQZMUl2K' \
    --body '{"carousel": [{"alt": "fzvZf2MU", "previewUrl": "WhIrBLdj", "thumbnailUrl": "6Eb6Jfhn", "type": "video", "url": "k0Wyu6fj", "videoSource": "youtube"}, {"alt": "zHlZXYwr", "previewUrl": "YgACwwxH", "thumbnailUrl": "g5m7NRSJ", "type": "video", "url": "fR5vfELK", "videoSource": "generic"}, {"alt": "6eip6x9X", "previewUrl": "iOe5GePQ", "thumbnailUrl": "VhalonE9", "type": "video", "url": "V2C213cn", "videoSource": "generic"}], "developer": "ws7jLqg7", "forumUrl": "PSBufKEL", "genres": ["Strategy", "Strategy", "Casual"], "localizations": {"2Le5AH4Y": {"announcement": "oxpYuW01", "slogan": "tKdaD0vC"}, "UbeM0Ymg": {"announcement": "f1gpznZo", "slogan": "DJf0zZ1O"}, "iXGbHGcw": {"announcement": "N3sC4Vli", "slogan": "hnleyfBc"}}, "platformRequirements": {"M1fhNckA": [{"additionals": "61V6pocc", "directXVersion": "oO58gTBO", "diskSpace": "kW9dnzZp", "graphics": "RgwLXIwj", "label": "5WzGggwH", "osVersion": "fB1mqXeg", "processor": "MoqLVuYq", "ram": "AHqxWGBg", "soundCard": "eHQzwqh0"}, {"additionals": "BPSbT1aD", "directXVersion": "dBwkiXBj", "diskSpace": "tv1ajFZP", "graphics": "rAMQ2C22", "label": "oO8CiciF", "osVersion": "dQkbFVRE", "processor": "zAHzZc33", "ram": "I53H2pyd", "soundCard": "Qb6sBASI"}, {"additionals": "4aULsmYO", "directXVersion": "WJ5ZP5va", "diskSpace": "AtmZwnl0", "graphics": "3F8brooi", "label": "UJAZ7FOf", "osVersion": "DcY1ARRL", "processor": "PQio0Vor", "ram": "DpQ30MYf", "soundCard": "7GZejsxl"}], "g2pyuxu7": [{"additionals": "ULoWOblS", "directXVersion": "xpewGfro", "diskSpace": "FQBSxGdk", "graphics": "IMyR4K8y", "label": "tNx6wckg", "osVersion": "2psWfFxo", "processor": "zx4A38Ew", "ram": "j2v9ELkh", "soundCard": "GUDJpcay"}, {"additionals": "OMAegEpy", "directXVersion": "pVPc4ymS", "diskSpace": "xOcJTG0C", "graphics": "QX58UYyZ", "label": "6zOB5XDa", "osVersion": "H5Q4SOZh", "processor": "w4JBX0nI", "ram": "URhgAd9b", "soundCard": "VkWXCF0H"}, {"additionals": "UXRDXVzQ", "directXVersion": "EsLTcBG1", "diskSpace": "eVnjplsH", "graphics": "KO9otOTE", "label": "pNN6hzL6", "osVersion": "O0yT8KMu", "processor": "WEsh0a72", "ram": "4mZuYzCo", "soundCard": "U0Rc7Khv"}], "netG848t": [{"additionals": "ccSnYWx1", "directXVersion": "JmShYTCV", "diskSpace": "WoGJbEt1", "graphics": "ObJUULHb", "label": "zqP3fOS7", "osVersion": "eVyuCMvw", "processor": "nf4llIgs", "ram": "fZKlEgCz", "soundCard": "D1tleVyp"}, {"additionals": "3UwZl0VU", "directXVersion": "cWdatJtp", "diskSpace": "zus1AqXz", "graphics": "7lN8OeHZ", "label": "pH9YsG9o", "osVersion": "r1w8r6a2", "processor": "bbpjiuRe", "ram": "zJbFiKFo", "soundCard": "B7iIfbhK"}, {"additionals": "YSzj4m5d", "directXVersion": "JQax9HRE", "diskSpace": "dtETqLew", "graphics": "ghi05PVv", "label": "hoS3o0Uq", "osVersion": "EyBBenTw", "processor": "8ZJyZA4z", "ram": "OQn6t5qb", "soundCard": "dS5WbJMO"}]}, "platforms": ["Android", "Windows", "Windows"], "players": ["Single", "CrossPlatformMulti", "Multi"], "primaryGenre": "MassivelyMultiplayer", "publisher": "1zv04nDB", "releaseDate": "1981-08-24T00:00:00Z", "websiteUrl": "UxoB3edT"}' \
    > test.out 2>&1
eval_tap $? 128 'UpdateApp' test.out

#- 129 DisableItem
./ng net.accelbyte.sdk.cli.Main platform disableItem \
    --itemId 'sud8uVPs' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'VOAR8Dv8' \
    > test.out 2>&1
eval_tap $? 129 'DisableItem' test.out

#- 130 GetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform getItemDynamicData \
    --itemId '73YIQXKT' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 130 'GetItemDynamicData' test.out

#- 131 EnableItem
./ng net.accelbyte.sdk.cli.Main platform enableItem \
    --itemId 'TzWkNOtE' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'owque7Xu' \
    > test.out 2>&1
eval_tap $? 131 'EnableItem' test.out

#- 132 FeatureItem
./ng net.accelbyte.sdk.cli.Main platform featureItem \
    --feature 'gXbpD21a' \
    --itemId 'GoGKa8LX' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'GgkbzutJ' \
    > test.out 2>&1
eval_tap $? 132 'FeatureItem' test.out

#- 133 DefeatureItem
./ng net.accelbyte.sdk.cli.Main platform defeatureItem \
    --feature 'OsCnJCJ2' \
    --itemId 'MbUyya6t' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'I8E2cx5i' \
    > test.out 2>&1
eval_tap $? 133 'DefeatureItem' test.out

#- 134 GetLocaleItem
./ng net.accelbyte.sdk.cli.Main platform getLocaleItem \
    --itemId 'Q5WlM0Th' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'RgAoKXNX' \
    --populateBundle  \
    --region 'Tl2OTxno' \
    --storeId 'x6ZFEa0O' \
    > test.out 2>&1
eval_tap $? 134 'GetLocaleItem' test.out

#- 135 UpdateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform updateItemPurchaseCondition \
    --itemId '3UKJsD3U' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Uu2aJ8sw' \
    --body '{"purchaseCondition": {"conditionGroups": [{"operator": "or", "predicates": [{"anyOf": 36, "code": "1a7u7qyR", "comparison": "isGreaterThanOrEqual", "name": "ub23WTxq", "predicateType": "StatisticCodePredicate", "value": "Jyox93O1", "values": ["rK5DVMkg", "0Dbuqx7g", "JXuHuIQo"]}, {"anyOf": 67, "code": "tmR3Tkuc", "comparison": "includes", "name": "HrYek2pq", "predicateType": "StatisticCodePredicate", "value": "nC2GWLk5", "values": ["a6pL3PQA", "yeIf5HAm", "wJbbF4Q7"]}, {"anyOf": 64, "code": "3ooSqRWX", "comparison": "is", "name": "GwuTkdMk", "predicateType": "EntitlementPredicate", "value": "no4mLOIy", "values": ["aLHAJgE8", "oRNWErzX", "ZKi9PhXa"]}]}, {"operator": "or", "predicates": [{"anyOf": 89, "code": "IMviVvDM", "comparison": "isNot", "name": "nSFtk1SY", "predicateType": "SeasonTierPredicate", "value": "W8MJ5Yuf", "values": ["XCZ1kJ39", "3R1rfIHh", "adFxFapI"]}, {"anyOf": 10, "code": "I87uoqEH", "comparison": "isGreaterThan", "name": "m1MpdUIA", "predicateType": "StatisticCodePredicate", "value": "hwNp24cz", "values": ["UKcRWLcB", "kUKvPtaR", "K6FOCDxi"]}, {"anyOf": 25, "code": "pYP6ghCz", "comparison": "isLessThan", "name": "qcstayfs", "predicateType": "SeasonPassPredicate", "value": "fJ7zvVny", "values": ["AJvGmDl2", "PMAKjRzF", "4CP5sF99"]}]}, {"operator": "and", "predicates": [{"anyOf": 62, "code": "4V2ISM8x", "comparison": "isGreaterThan", "name": "Vf7Ghv7V", "predicateType": "StatisticCodePredicate", "value": "h6Aj8uz3", "values": ["gGD0dsyK", "Wd9Gut1N", "i2JhHeTv"]}, {"anyOf": 83, "code": "lTwpgNms", "comparison": "isGreaterThanOrEqual", "name": "n2Baz4YK", "predicateType": "SeasonPassPredicate", "value": "ecgI8cLl", "values": ["YesIpTZe", "Ji9UMr87", "XWuGWIHM"]}, {"anyOf": 6, "code": "Db02GV7z", "comparison": "includes", "name": "tfjnz9Jm", "predicateType": "SeasonPassPredicate", "value": "QQeONpoc", "values": ["5HxdXlcR", "NU9yjHHj", "pdKNH1CO"]}]}]}}' \
    > test.out 2>&1
eval_tap $? 135 'UpdateItemPurchaseCondition' test.out

#- 136 ReturnItem
./ng net.accelbyte.sdk.cli.Main platform returnItem \
    --itemId 'f5SShoLD' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "YefYD51Y"}' \
    > test.out 2>&1
eval_tap $? 136 'ReturnItem' test.out

#- 137 QueryKeyGroups
./ng net.accelbyte.sdk.cli.Main platform queryKeyGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '75' \
    --name 'iWdMNv5x' \
    --offset '92' \
    --tag 'NCbGzE19' \
    > test.out 2>&1
eval_tap $? 137 'QueryKeyGroups' test.out

#- 138 CreateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform createKeyGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "8pYgbywn", "name": "tFLnZpk6", "status": "ACTIVE", "tags": ["7dnTg5mx", "01T2KhWi", "IdesIJSP"]}' \
    > test.out 2>&1
eval_tap $? 138 'CreateKeyGroup' test.out

#- 139 GetKeyGroupByBoothName
eval_tap 0 139 'GetKeyGroupByBoothName # SKIP deprecated' test.out

#- 140 GetKeyGroup
./ng net.accelbyte.sdk.cli.Main platform getKeyGroup \
    --keyGroupId 'fOhq9W6J' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 140 'GetKeyGroup' test.out

#- 141 UpdateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform updateKeyGroup \
    --keyGroupId 'CfQQaF0V' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "pi311kT3", "name": "GVJloUYP", "status": "ACTIVE", "tags": ["hVHjwcsw", "j4e7YbNQ", "1esO0SVI"]}' \
    > test.out 2>&1
eval_tap $? 141 'UpdateKeyGroup' test.out

#- 142 GetKeyGroupDynamic
./ng net.accelbyte.sdk.cli.Main platform getKeyGroupDynamic \
    --keyGroupId 'yrHIad6J' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 142 'GetKeyGroupDynamic' test.out

#- 143 ListKeys
./ng net.accelbyte.sdk.cli.Main platform listKeys \
    --keyGroupId 'nuezyvKv' \
    --namespace "$AB_NAMESPACE" \
    --limit '46' \
    --offset '84' \
    --status 'ACTIVE' \
    > test.out 2>&1
eval_tap $? 143 'ListKeys' test.out

#- 144 UploadKeys
./ng net.accelbyte.sdk.cli.Main platform uploadKeys \
    --keyGroupId 'viCxa4GI' \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 144 'UploadKeys' test.out

#- 145 QueryOrders
./ng net.accelbyte.sdk.cli.Main platform queryOrders \
    --namespace "$AB_NAMESPACE" \
    --endTime 'FX71RdPs' \
    --limit '49' \
    --offset '98' \
    --orderNos '03RvAXLo,Z90JveeC,cEeB6cfO' \
    --sortBy 'xuQQ3t0e' \
    --startTime 'lmsfY3mI' \
    --status 'DELETED' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 145 'QueryOrders' test.out

#- 146 GetOrderStatistics
./ng net.accelbyte.sdk.cli.Main platform getOrderStatistics \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 146 'GetOrderStatistics' test.out

#- 147 GetOrder
./ng net.accelbyte.sdk.cli.Main platform getOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'dlassupk' \
    > test.out 2>&1
eval_tap $? 147 'GetOrder' test.out

#- 148 RefundOrder
./ng net.accelbyte.sdk.cli.Main platform refundOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'iNi6oYfh' \
    --body '{"description": "f3FSlB8Y"}' \
    > test.out 2>&1
eval_tap $? 148 'RefundOrder' test.out

#- 149 GetPaymentCallbackConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentCallbackConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 149 'GetPaymentCallbackConfig' test.out

#- 150 UpdatePaymentCallbackConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentCallbackConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"dryRun": false, "notifyUrl": "stEntkyA", "privateKey": "N77V4yFF"}' \
    > test.out 2>&1
eval_tap $? 150 'UpdatePaymentCallbackConfig' test.out

#- 151 GetPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentMerchantConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 151 'GetPaymentMerchantConfig' test.out

#- 152 UpdatePaymentDomainWhitelistConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentDomainWhitelistConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"domains": ["WxPNT7kV", "4fll6KuV", "ov2PuFlC"]}' \
    > test.out 2>&1
eval_tap $? 152 'UpdatePaymentDomainWhitelistConfig' test.out

#- 153 QueryPaymentNotifications
./ng net.accelbyte.sdk.cli.Main platform queryPaymentNotifications \
    --namespace "$AB_NAMESPACE" \
    --endDate 'fCHEu4kv' \
    --externalId '6msJToTB' \
    --limit '30' \
    --notificationSource 'XSOLLA' \
    --notificationType 'pQ23N2rf' \
    --offset '3' \
    --paymentOrderNo 'sdj2oUmk' \
    --startDate 'DmjxsNX9' \
    --status 'ERROR' \
    > test.out 2>&1
eval_tap $? 153 'QueryPaymentNotifications' test.out

#- 154 QueryPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform queryPaymentOrders \
    --namespace "$AB_NAMESPACE" \
    --channel 'INTERNAL' \
    --extTxId 'IXOvSAo3' \
    --limit '42' \
    --offset '1' \
    --status 'CHARGEBACK_REVERSED' \
    > test.out 2>&1
eval_tap $? 154 'QueryPaymentOrders' test.out

#- 155 CreatePaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform createPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --body '{"currencyCode": "J3MfKwSP", "currencyNamespace": "4xeAk0bA", "customParameters": {"i5stvpa1": {}, "NutWfRKw": {}, "VTCdpNTr": {}}, "description": "0DgWrJ29", "extOrderNo": "ZHcLW4FN", "extUserId": "BOZ8tUCX", "itemType": "SEASON", "language": "Avd_RdNR", "metadata": {"9kJJhXHj": "ewPlZ7CL", "6RrGHhjZ": "8zao9vJF", "gFErbPNs": "ujzDJAPw"}, "notifyUrl": "vR44Mz9r", "omitNotification": false, "platform": "5FskcZ8r", "price": 52, "recurringPaymentOrderNo": "XKI1guYX", "region": "V8G4q2Zl", "returnUrl": "Od8IFCl6", "sandbox": true, "sku": "3YJYrcx5", "subscriptionId": "3mnbtErt", "targetNamespace": "EeaJAxa4", "targetUserId": "W0nsrV4w", "title": "iX1i6THB"}' \
    > test.out 2>&1
eval_tap $? 155 'CreatePaymentOrderByDedicated' test.out

#- 156 ListExtOrderNoByExtTxId
./ng net.accelbyte.sdk.cli.Main platform listExtOrderNoByExtTxId \
    --namespace "$AB_NAMESPACE" \
    --extTxId 'M9oUoq7f' \
    > test.out 2>&1
eval_tap $? 156 'ListExtOrderNoByExtTxId' test.out

#- 157 GetPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'LXZkafWS' \
    > test.out 2>&1
eval_tap $? 157 'GetPaymentOrder' test.out

#- 158 ChargePaymentOrder
./ng net.accelbyte.sdk.cli.Main platform chargePaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'umqxu0Ad' \
    --body '{"extTxId": "9evisDvT", "paymentMethod": "X4aGn5TG", "paymentProvider": "NEONPAY"}' \
    > test.out 2>&1
eval_tap $? 158 'ChargePaymentOrder' test.out

#- 159 RefundPaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform refundPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'wnyrMUdy' \
    --body '{"description": "rJ1w13Pz"}' \
    > test.out 2>&1
eval_tap $? 159 'RefundPaymentOrderByDedicated' test.out

#- 160 SimulatePaymentOrderNotification
./ng net.accelbyte.sdk.cli.Main platform simulatePaymentOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'rGvpELfE' \
    --body '{"amount": 48, "currencyCode": "n1rkr1r4", "notifyType": "REFUND", "paymentProvider": "PAYPAL", "salesTax": 0, "vat": 76}' \
    > test.out 2>&1
eval_tap $? 160 'SimulatePaymentOrderNotification' test.out

#- 161 GetPaymentOrderChargeStatus
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrderChargeStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '8y8XbCUU' \
    > test.out 2>&1
eval_tap $? 161 'GetPaymentOrderChargeStatus' test.out

#- 162 GetPsnEntitlementOwnership
./ng net.accelbyte.sdk.cli.Main platform getPsnEntitlementOwnership \
    --entitlementLabel 'PeNxc3FN' \
    --namespace "$AB_NAMESPACE" \
    --body '{"accessToken": "vrKiqWxb", "serviceLabel": 13}' \
    > test.out 2>&1
eval_tap $? 162 'GetPsnEntitlementOwnership' test.out

#- 163 GetXboxEntitlementOwnership
./ng net.accelbyte.sdk.cli.Main platform getXboxEntitlementOwnership \
    --namespace "$AB_NAMESPACE" \
    --productSku 'eBxMgzzW' \
    --body '{"delegationToken": "2wSOljxR", "sandboxId": "Im3bjVn5"}' \
    > test.out 2>&1
eval_tap $? 163 'GetXboxEntitlementOwnership' test.out

#- 164 GetPlatformEntitlementConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformEntitlementConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'GooglePlay' \
    > test.out 2>&1
eval_tap $? 164 'GetPlatformEntitlementConfig' test.out

#- 165 UpdatePlatformEntitlementConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformEntitlementConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'GooglePlay' \
    --body '{"allowedPlatformOrigins": ["IOS", "Steam", "Steam"]}' \
    > test.out 2>&1
eval_tap $? 165 'UpdatePlatformEntitlementConfig' test.out

#- 166 GetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'GooglePlay' \
    > test.out 2>&1
eval_tap $? 166 'GetPlatformWalletConfig' test.out

#- 167 UpdatePlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Nintendo' \
    --body '{"allowedBalanceOrigins": ["IOS", "Epic", "Nintendo"]}' \
    > test.out 2>&1
eval_tap $? 167 'UpdatePlatformWalletConfig' test.out

#- 168 ResetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform resetPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Playstation' \
    > test.out 2>&1
eval_tap $? 168 'ResetPlatformWalletConfig' test.out

#- 169 GetRevocationConfig
./ng net.accelbyte.sdk.cli.Main platform getRevocationConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 169 'GetRevocationConfig' test.out

#- 170 UpdateRevocationConfig
./ng net.accelbyte.sdk.cli.Main platform updateRevocationConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"entitlement": {"consumable": {"enabled": false, "strategy": "CUSTOM"}, "durable": {"enabled": true, "strategy": "CUSTOM"}}, "wallet": {"enabled": false, "strategy": "REVOKE_OR_REPORT"}}' \
    > test.out 2>&1
eval_tap $? 170 'UpdateRevocationConfig' test.out

#- 171 DeleteRevocationConfig
./ng net.accelbyte.sdk.cli.Main platform deleteRevocationConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 171 'DeleteRevocationConfig' test.out

#- 172 QueryRevocationHistories
./ng net.accelbyte.sdk.cli.Main platform queryRevocationHistories \
    --namespace "$AB_NAMESPACE" \
    --endTime 'vlH9jZHE' \
    --limit '1' \
    --offset '80' \
    --source 'OTHER' \
    --startTime '6UJTBilj' \
    --status 'FAIL' \
    --transactionId 'FYBs0zwK' \
    --userId 'SgONWMjj' \
    > test.out 2>&1
eval_tap $? 172 'QueryRevocationHistories' test.out

#- 173 GetRevocationPluginConfig
./ng net.accelbyte.sdk.cli.Main platform getRevocationPluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 173 'GetRevocationPluginConfig' test.out

#- 174 UpdateRevocationPluginConfig
./ng net.accelbyte.sdk.cli.Main platform updateRevocationPluginConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appConfig": {"appName": "Ux5muDOr"}, "customConfig": {"connectionType": "TLS", "grpcServerAddress": "TuHm2Ouv"}, "extendType": "APP"}' \
    > test.out 2>&1
eval_tap $? 174 'UpdateRevocationPluginConfig' test.out

#- 175 DeleteRevocationPluginConfig
./ng net.accelbyte.sdk.cli.Main platform deleteRevocationPluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 175 'DeleteRevocationPluginConfig' test.out

#- 176 UploadRevocationPluginConfigCert
./ng net.accelbyte.sdk.cli.Main platform uploadRevocationPluginConfigCert \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 176 'UploadRevocationPluginConfigCert' test.out

#- 177 CreateReward
./ng net.accelbyte.sdk.cli.Main platform createReward \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "uzBjK978", "eventTopic": "gechpzo5", "maxAwarded": 21, "maxAwardedPerUser": 7, "namespaceExpression": "M5Mu2iBR", "rewardCode": "sK64GM5t", "rewardConditions": [{"condition": "nctaGeoY", "conditionName": "Fi9w9uPf", "eventName": "lk7p3dVx", "rewardItems": [{"duration": 100, "endDate": "1986-11-16T00:00:00Z", "identityType": "ITEM_ID", "itemId": "LzGXViYx", "quantity": 85, "sku": "GthC7Lor"}, {"duration": 57, "endDate": "1989-01-01T00:00:00Z", "identityType": "ITEM_ID", "itemId": "eFllNss4", "quantity": 45, "sku": "qZLEbd3c"}, {"duration": 26, "endDate": "1983-05-13T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "4RbhTgzW", "quantity": 1, "sku": "2MyQyt01"}]}, {"condition": "1eLl1ARa", "conditionName": "JIcQwaBk", "eventName": "8EEceJra", "rewardItems": [{"duration": 14, "endDate": "1998-07-02T00:00:00Z", "identityType": "ITEM_ID", "itemId": "0mNqdLE0", "quantity": 89, "sku": "iGvUMnrY"}, {"duration": 12, "endDate": "1974-12-24T00:00:00Z", "identityType": "ITEM_ID", "itemId": "668H8gf0", "quantity": 75, "sku": "pXfZVqHS"}, {"duration": 66, "endDate": "1986-12-21T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "TNbooXmC", "quantity": 56, "sku": "eWUU3VtI"}]}, {"condition": "7cTEBkFh", "conditionName": "IXTXpCye", "eventName": "6D4eeogo", "rewardItems": [{"duration": 45, "endDate": "1991-01-11T00:00:00Z", "identityType": "ITEM_ID", "itemId": "9zZ7Os81", "quantity": 68, "sku": "MEDfg048"}, {"duration": 29, "endDate": "1998-05-17T00:00:00Z", "identityType": "ITEM_ID", "itemId": "nsbn99gG", "quantity": 59, "sku": "eoV0h0Gt"}, {"duration": 5, "endDate": "1974-11-15T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "q4LGSxlJ", "quantity": 8, "sku": "AhCUg3mx"}]}], "userIdExpression": "NcM43pGi"}' \
    > test.out 2>&1
eval_tap $? 177 'CreateReward' test.out

#- 178 QueryRewards
./ng net.accelbyte.sdk.cli.Main platform queryRewards \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'DCpk1y2U' \
    --limit '93' \
    --offset '16' \
    --sortBy 'rewardCode,rewardCode:desc,namespace' \
    > test.out 2>&1
eval_tap $? 178 'QueryRewards' test.out

#- 179 ExportRewards
./ng net.accelbyte.sdk.cli.Main platform exportRewards \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 179 'ExportRewards' test.out

#- 180 ImportRewards
./ng net.accelbyte.sdk.cli.Main platform importRewards \
    --namespace "$AB_NAMESPACE" \
    --replaceExisting  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 180 'ImportRewards' test.out

#- 181 GetReward
./ng net.accelbyte.sdk.cli.Main platform getReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'wzlYKADL' \
    > test.out 2>&1
eval_tap $? 181 'GetReward' test.out

#- 182 UpdateReward
./ng net.accelbyte.sdk.cli.Main platform updateReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'zATgkxKi' \
    --body '{"description": "Y7NO5GIG", "eventTopic": "beHC6FGs", "maxAwarded": 12, "maxAwardedPerUser": 48, "namespaceExpression": "zLSYhixk", "rewardCode": "HoBO1wQj", "rewardConditions": [{"condition": "e3RUlNSR", "conditionName": "38L64KKY", "eventName": "65zm7Hn6", "rewardItems": [{"duration": 64, "endDate": "1980-06-14T00:00:00Z", "identityType": "ITEM_ID", "itemId": "ZlMjWQhL", "quantity": 24, "sku": "4FBGqRre"}, {"duration": 77, "endDate": "1988-02-21T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "Lv0CNOlY", "quantity": 55, "sku": "YsaEk7oc"}, {"duration": 11, "endDate": "1986-05-17T00:00:00Z", "identityType": "ITEM_ID", "itemId": "VJ7XRHKe", "quantity": 55, "sku": "GO8ohjdN"}]}, {"condition": "dkaYNqh1", "conditionName": "QxZlVCL3", "eventName": "MtKuPd2L", "rewardItems": [{"duration": 74, "endDate": "1987-06-11T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "nDtKQqjl", "quantity": 41, "sku": "Q0tnXkd2"}, {"duration": 94, "endDate": "1973-01-02T00:00:00Z", "identityType": "ITEM_ID", "itemId": "fT2wZM6W", "quantity": 12, "sku": "UCw8GyFs"}, {"duration": 1, "endDate": "1972-03-16T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "mO27WBLB", "quantity": 13, "sku": "XD3k9NLf"}]}, {"condition": "5EZcvXYi", "conditionName": "m3caIjBx", "eventName": "01UwNWFP", "rewardItems": [{"duration": 13, "endDate": "1992-04-03T00:00:00Z", "identityType": "ITEM_ID", "itemId": "IMyuklCi", "quantity": 22, "sku": "0xocMvSL"}, {"duration": 80, "endDate": "1979-06-11T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "cC9Ja3jB", "quantity": 80, "sku": "QWKTVETK"}, {"duration": 8, "endDate": "1994-09-02T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "IACHSAbA", "quantity": 38, "sku": "kEi4FH1g"}]}], "userIdExpression": "7V0Cv8Ce"}' \
    > test.out 2>&1
eval_tap $? 182 'UpdateReward' test.out

#- 183 DeleteReward
./ng net.accelbyte.sdk.cli.Main platform deleteReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'V0seem7U' \
    > test.out 2>&1
eval_tap $? 183 'DeleteReward' test.out

#- 184 CheckEventCondition
./ng net.accelbyte.sdk.cli.Main platform checkEventCondition \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'cR1JInc7' \
    --body '{"payload": {"dZACQ6Vq": {}, "q3qZwnCI": {}, "DuD8XUXm": {}}}' \
    > test.out 2>&1
eval_tap $? 184 'CheckEventCondition' test.out

#- 185 DeleteRewardConditionRecord
./ng net.accelbyte.sdk.cli.Main platform deleteRewardConditionRecord \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'k4hQXwHl' \
    --body '{"conditionName": "BFoEqhHi", "userId": "i54fwJ5s"}' \
    > test.out 2>&1
eval_tap $? 185 'DeleteRewardConditionRecord' test.out

#- 186 QuerySections
./ng net.accelbyte.sdk.cli.Main platform querySections \
    --namespace "$AB_NAMESPACE" \
    --end 'gNcFj6Qs' \
    --limit '34' \
    --offset '60' \
    --start 'RmgZvuKR' \
    --storeId 'PArYCQ0x' \
    --viewId 'lAyeZRc9' \
    > test.out 2>&1
eval_tap $? 186 'QuerySections' test.out

#- 187 CreateSection
./ng net.accelbyte.sdk.cli.Main platform createSection \
    --namespace "$AB_NAMESPACE" \
    --storeId 'sZN6Rdkm' \
    --body '{"active": false, "displayOrder": 99, "endDate": "1971-05-29T00:00:00Z", "ext": {"n1cM50dV": {}, "BAlX9wvX": {}, "lcndHhhU": {}}, "fixedPeriodRotationConfig": {"backfillType": "CUSTOM", "duration": 30, "itemCount": 2, "rule": "SEQUENCE"}, "items": [{"id": "wqXf9xUH", "sku": "TWs2lVBR"}, {"id": "N3qzRNXr", "sku": "2KOG2JUl"}, {"id": "YYNFeWZu", "sku": "y7Hv3QkD"}], "localizations": {"IqX6ztby": {"description": "gkXD4JiH", "localExt": {"0hfU3eYJ": {}, "Vw3LQ6uB": {}, "V1wrf30W": {}}, "longDescription": "ZgRwqFpd", "title": "4MhwA0RW"}, "1AWpfTaN": {"description": "5KEFkoyj", "localExt": {"8fWiIvq2": {}, "4SSDUSzh": {}, "GqoLLxyC": {}}, "longDescription": "021dCV7X", "title": "KwU8foXr"}, "ob6DLZcJ": {"description": "KFAxcijr", "localExt": {"G1hluL4z": {}, "dNOSe1SJ": {}, "LjvYAF6A": {}}, "longDescription": "nFu7zDWp", "title": "NGf3xiJ8"}}, "name": "0fZAEtAu", "rotationType": "NONE", "startDate": "1978-05-26T00:00:00Z", "viewId": "Ep6nNEQ9"}' \
    > test.out 2>&1
eval_tap $? 187 'CreateSection' test.out

#- 188 PurgeExpiredSection
./ng net.accelbyte.sdk.cli.Main platform purgeExpiredSection \
    --namespace "$AB_NAMESPACE" \
    --storeId 'nnqKlEeG' \
    > test.out 2>&1
eval_tap $? 188 'PurgeExpiredSection' test.out

#- 189 GetSection
./ng net.accelbyte.sdk.cli.Main platform getSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'loe82hZe' \
    --storeId '9RLkCgfM' \
    > test.out 2>&1
eval_tap $? 189 'GetSection' test.out

#- 190 UpdateSection
./ng net.accelbyte.sdk.cli.Main platform updateSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'RKB10EH2' \
    --storeId '7B02ccC7' \
    --body '{"active": false, "displayOrder": 56, "endDate": "1998-11-27T00:00:00Z", "ext": {"OgkniuLM": {}, "tdji6Cg9": {}, "yxhtBQ5H": {}}, "fixedPeriodRotationConfig": {"backfillType": "NONE", "duration": 17, "itemCount": 98, "rule": "SEQUENCE"}, "items": [{"id": "IfZMrQuy", "sku": "zwgLqJAP"}, {"id": "WTSbTLP0", "sku": "9SHd1iZ1"}, {"id": "kGj55vW3", "sku": "E1ARzBA6"}], "localizations": {"kp3vloqc": {"description": "8N6Oy7gn", "localExt": {"hlyxbHAA": {}, "ZvV75ta4": {}, "3qWHB59g": {}}, "longDescription": "d0oAbMPT", "title": "TVk6JRzU"}, "RnfitsFF": {"description": "3kEmlEp2", "localExt": {"FYISDpvV": {}, "SoRonNao": {}, "HDPtEiZo": {}}, "longDescription": "M83bFFcZ", "title": "GsGI0Kgc"}, "jNDWzeNj": {"description": "fPTxs9lK", "localExt": {"LnH0fuUI": {}, "aMbOOdDi": {}, "rDBSQFux": {}}, "longDescription": "wO1oaexL", "title": "K3oNInKc"}}, "name": "adMzDhYS", "rotationType": "CUSTOM", "startDate": "1983-11-13T00:00:00Z", "viewId": "mvEpx1o1"}' \
    > test.out 2>&1
eval_tap $? 190 'UpdateSection' test.out

#- 191 DeleteSection
./ng net.accelbyte.sdk.cli.Main platform deleteSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'yeroO93H' \
    --storeId 'OeR4zlaG' \
    > test.out 2>&1
eval_tap $? 191 'DeleteSection' test.out

#- 192 ListStores
./ng net.accelbyte.sdk.cli.Main platform listStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 192 'ListStores' test.out

#- 193 CreateStore
./ng net.accelbyte.sdk.cli.Main platform createStore \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultLanguage": "XCJk57xS", "defaultRegion": "OkvwzbW9", "description": "SyNy92j7", "supportedLanguages": ["OQoSjJkB", "kWgzf7AL", "fGUU9Zhd"], "supportedRegions": ["TOnCf5te", "94oHAF8N", "pQBqZMkY"], "title": "NJoQTxXl"}' \
    > test.out 2>&1
eval_tap $? 193 'CreateStore' test.out

#- 194 GetCatalogDefinition
./ng net.accelbyte.sdk.cli.Main platform getCatalogDefinition \
    --namespace "$AB_NAMESPACE" \
    --catalogType 'ITEM' \
    > test.out 2>&1
eval_tap $? 194 'GetCatalogDefinition' test.out

#- 195 DownloadCSVTemplates
./ng net.accelbyte.sdk.cli.Main platform downloadCSVTemplates \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 195 'DownloadCSVTemplates' test.out

#- 196 ExportStoreByCSV
./ng net.accelbyte.sdk.cli.Main platform exportStoreByCSV \
    --namespace "$AB_NAMESPACE" \
    --body '{"catalogType": "APP", "fieldsToBeIncluded": ["wrXvIukJ", "fbbKxclP", "l5plFo9G"], "idsToBeExported": ["C9fD7pBd", "KobLTC7O", "a7Qun47l"], "storeId": "nviFiThr"}' \
    > test.out 2>&1
eval_tap $? 196 'ExportStoreByCSV' test.out

#- 197 ImportStore
eval_tap 0 197 'ImportStore # SKIP deprecated' test.out

#- 198 GetPublishedStore
./ng net.accelbyte.sdk.cli.Main platform getPublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 198 'GetPublishedStore' test.out

#- 199 DeletePublishedStore
./ng net.accelbyte.sdk.cli.Main platform deletePublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 199 'DeletePublishedStore' test.out

#- 200 GetPublishedStoreBackup
./ng net.accelbyte.sdk.cli.Main platform getPublishedStoreBackup \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 200 'GetPublishedStoreBackup' test.out

#- 201 RollbackPublishedStore
./ng net.accelbyte.sdk.cli.Main platform rollbackPublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 201 'RollbackPublishedStore' test.out

#- 202 GetStore
./ng net.accelbyte.sdk.cli.Main platform getStore \
    --namespace "$AB_NAMESPACE" \
    --storeId '4BdlLORq' \
    > test.out 2>&1
eval_tap $? 202 'GetStore' test.out

#- 203 UpdateStore
./ng net.accelbyte.sdk.cli.Main platform updateStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'bdB9JesX' \
    --body '{"defaultLanguage": "L7eqBqHt", "defaultRegion": "vQwgTlSe", "description": "pBzrLtdu", "supportedLanguages": ["sG3uQSP0", "PsflnZ4y", "JIQMMIM9"], "supportedRegions": ["tUwwSU7w", "uSPjfolW", "dnSyXc7Z"], "title": "tebnBSm7"}' \
    > test.out 2>&1
eval_tap $? 203 'UpdateStore' test.out

#- 204 DeleteStore
./ng net.accelbyte.sdk.cli.Main platform deleteStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'yUY61hqa' \
    > test.out 2>&1
eval_tap $? 204 'DeleteStore' test.out

#- 205 QueryChanges
./ng net.accelbyte.sdk.cli.Main platform queryChanges \
    --namespace "$AB_NAMESPACE" \
    --storeId 'PxCMcJ8w' \
    --action 'DELETE' \
    --itemSku 'tw38vf6y' \
    --itemType 'EXTENSION' \
    --limit '60' \
    --offset '100' \
    --selected  \
    --sortBy 'updatedAt,createdAt:asc' \
    --status 'PUBLISHED' \
    --type 'ITEM' \
    --updatedAtEnd 'w0yPiueu' \
    --updatedAtStart 'qy3CC5vS' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 205 'QueryChanges' test.out

#- 206 PublishAll
./ng net.accelbyte.sdk.cli.Main platform publishAll \
    --namespace "$AB_NAMESPACE" \
    --storeId '8bN2Bx5t' \
    > test.out 2>&1
eval_tap $? 206 'PublishAll' test.out

#- 207 PublishSelected
./ng net.accelbyte.sdk.cli.Main platform publishSelected \
    --namespace "$AB_NAMESPACE" \
    --storeId 'wNpkF6wY' \
    > test.out 2>&1
eval_tap $? 207 'PublishSelected' test.out

#- 208 SelectAllRecords
./ng net.accelbyte.sdk.cli.Main platform selectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'uZzXCsAw' \
    > test.out 2>&1
eval_tap $? 208 'SelectAllRecords' test.out

#- 209 SelectAllRecordsByCriteria
./ng net.accelbyte.sdk.cli.Main platform selectAllRecordsByCriteria \
    --namespace "$AB_NAMESPACE" \
    --storeId 'GQkuhpfk' \
    --action 'CREATE' \
    --itemSku 'Y2X6o0JE' \
    --itemType 'EXTENSION' \
    --selected  \
    --type 'STORE' \
    --updatedAtEnd '7Q8nAHSh' \
    --updatedAtStart '49TG2S0l' \
    > test.out 2>&1
eval_tap $? 209 'SelectAllRecordsByCriteria' test.out

#- 210 GetStatistic
./ng net.accelbyte.sdk.cli.Main platform getStatistic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'hHlqbLpq' \
    --action 'UPDATE' \
    --itemSku 'Yztr3Zam' \
    --itemType 'LOOTBOX' \
    --type 'SECTION' \
    --updatedAtEnd 'aVe9b5EJ' \
    --updatedAtStart 'xNHY4JtZ' \
    > test.out 2>&1
eval_tap $? 210 'GetStatistic' test.out

#- 211 UnselectAllRecords
./ng net.accelbyte.sdk.cli.Main platform unselectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'oR1H7FyP' \
    > test.out 2>&1
eval_tap $? 211 'UnselectAllRecords' test.out

#- 212 SelectRecord
./ng net.accelbyte.sdk.cli.Main platform selectRecord \
    --changeId 'Nz4npB4M' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'uWlqMiJ0' \
    > test.out 2>&1
eval_tap $? 212 'SelectRecord' test.out

#- 213 UnselectRecord
./ng net.accelbyte.sdk.cli.Main platform unselectRecord \
    --changeId 'mHIsKMls' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'aksXLAde' \
    > test.out 2>&1
eval_tap $? 213 'UnselectRecord' test.out

#- 214 CloneStore
./ng net.accelbyte.sdk.cli.Main platform cloneStore \
    --namespace "$AB_NAMESPACE" \
    --storeId '7ABVazTg' \
    --targetStoreId '8cjXxWtf' \
    > test.out 2>&1
eval_tap $? 214 'CloneStore' test.out

#- 215 ExportStore
eval_tap 0 215 'ExportStore # SKIP deprecated' test.out

#- 216 QueryImportHistory
./ng net.accelbyte.sdk.cli.Main platform queryImportHistory \
    --namespace "$AB_NAMESPACE" \
    --storeId 'nbaHz4op' \
    --end 'E9BjdI1C' \
    --limit '97' \
    --offset '68' \
    --sortBy 'wyyDilPe' \
    --start '3IARWFLO' \
    --success  \
    > test.out 2>&1
eval_tap $? 216 'QueryImportHistory' test.out

#- 217 ImportStoreByCSV
./ng net.accelbyte.sdk.cli.Main platform importStoreByCSV \
    --namespace "$AB_NAMESPACE" \
    --storeId 'B0k6gJfm' \
    --category 'tmp.dat' \
    --display 'tmp.dat' \
    --item 'tmp.dat' \
    --notes 'qPlnA9w2' \
    --section 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 217 'ImportStoreByCSV' test.out

#- 218 QuerySubscriptions
./ng net.accelbyte.sdk.cli.Main platform querySubscriptions \
    --namespace "$AB_NAMESPACE" \
    --chargeStatus 'CHARGED' \
    --itemId 'uxetjMBk' \
    --limit '66' \
    --offset '25' \
    --sku 'f1RXzIv5' \
    --status 'CANCELLED' \
    --subscribedBy 'USER' \
    --userId 'leJwf6Qm' \
    > test.out 2>&1
eval_tap $? 218 'QuerySubscriptions' test.out

#- 219 RecurringChargeSubscription
./ng net.accelbyte.sdk.cli.Main platform recurringChargeSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'gNnQGvxe' \
    > test.out 2>&1
eval_tap $? 219 'RecurringChargeSubscription' test.out

#- 220 GetTicketDynamic
./ng net.accelbyte.sdk.cli.Main platform getTicketDynamic \
    --boothName 'wQVEiIzX' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 220 'GetTicketDynamic' test.out

#- 221 DecreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform decreaseTicketSale \
    --boothName 'FHArRGx6' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "0ykqHN8t"}' \
    > test.out 2>&1
eval_tap $? 221 'DecreaseTicketSale' test.out

#- 222 GetTicketBoothID
./ng net.accelbyte.sdk.cli.Main platform getTicketBoothID \
    --boothName 'Q4HJLBkD' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 222 'GetTicketBoothID' test.out

#- 223 IncreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform increaseTicketSale \
    --boothName 'h0Ot4DVy' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 51, "orderNo": "yom0oDs9"}' \
    > test.out 2>&1
eval_tap $? 223 'IncreaseTicketSale' test.out

#- 224 Commit
./ng net.accelbyte.sdk.cli.Main platform commit \
    --namespace "$AB_NAMESPACE" \
    --body '{"actions": [{"operations": [{"creditPayload": {"balanceOrigin": "System", "count": 97, "currencyCode": "iXSaklCe", "expireAt": "1982-06-14T00:00:00Z"}, "debitPayload": {"count": 5, "currencyCode": "9nNHE8zV", "walletPlatform": "IOS"}, "fulFillItemPayload": {"count": 37, "entitlementCollectionId": "YCOOkJv6", "entitlementOrigin": "Playstation", "itemIdentity": "wWexVPcT", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 98, "entitlementId": "ddSTsfQa"}, "type": "CREDIT_WALLET"}, {"creditPayload": {"balanceOrigin": "GooglePlay", "count": 59, "currencyCode": "jw7PKNAm", "expireAt": "1992-04-02T00:00:00Z"}, "debitPayload": {"count": 50, "currencyCode": "x7e9oEv4", "walletPlatform": "Other"}, "fulFillItemPayload": {"count": 46, "entitlementCollectionId": "ju5D0NYu", "entitlementOrigin": "Epic", "itemIdentity": "0yrFBTpU", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 64, "entitlementId": "e8ZcZjp7"}, "type": "FULFILL_ITEM"}, {"creditPayload": {"balanceOrigin": "IOS", "count": 62, "currencyCode": "MfUuczMT", "expireAt": "1983-04-04T00:00:00Z"}, "debitPayload": {"count": 97, "currencyCode": "jXUYl3Oz", "walletPlatform": "Playstation"}, "fulFillItemPayload": {"count": 11, "entitlementCollectionId": "E22ECcLC", "entitlementOrigin": "Other", "itemIdentity": "x9XQAe8J", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 9, "entitlementId": "Urp74ay3"}, "type": "REVOKE_ENTITLEMENT"}], "userId": "2UITebzm"}, {"operations": [{"creditPayload": {"balanceOrigin": "Playstation", "count": 99, "currencyCode": "ZzOQJNfY", "expireAt": "1996-07-23T00:00:00Z"}, "debitPayload": {"count": 14, "currencyCode": "kZsKNh5c", "walletPlatform": "Epic"}, "fulFillItemPayload": {"count": 59, "entitlementCollectionId": "nRN0rqOg", "entitlementOrigin": "Steam", "itemIdentity": "hco94GlC", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 11, "entitlementId": "vGI12ZY7"}, "type": "REVOKE_ENTITLEMENT"}, {"creditPayload": {"balanceOrigin": "IOS", "count": 41, "currencyCode": "TBr6IKQ9", "expireAt": "1997-04-06T00:00:00Z"}, "debitPayload": {"count": 73, "currencyCode": "3NR96y1L", "walletPlatform": "Oculus"}, "fulFillItemPayload": {"count": 54, "entitlementCollectionId": "FCfau4Wx", "entitlementOrigin": "GooglePlay", "itemIdentity": "NZO21bIZ", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 10, "entitlementId": "jqg9XN7i"}, "type": "DEBIT_WALLET"}, {"creditPayload": {"balanceOrigin": "System", "count": 40, "currencyCode": "c2ZLngKL", "expireAt": "1971-11-02T00:00:00Z"}, "debitPayload": {"count": 31, "currencyCode": "TmKpxNmR", "walletPlatform": "Xbox"}, "fulFillItemPayload": {"count": 61, "entitlementCollectionId": "TziI4j49", "entitlementOrigin": "Twitch", "itemIdentity": "MdYwEvpc", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 41, "entitlementId": "FYLTbrrH"}, "type": "DEBIT_WALLET"}], "userId": "i1UTSHuh"}, {"operations": [{"creditPayload": {"balanceOrigin": "Other", "count": 88, "currencyCode": "38SeV4Hc", "expireAt": "1992-12-29T00:00:00Z"}, "debitPayload": {"count": 82, "currencyCode": "dcyCsbsw", "walletPlatform": "Playstation"}, "fulFillItemPayload": {"count": 96, "entitlementCollectionId": "XqCKl5No", "entitlementOrigin": "GooglePlay", "itemIdentity": "M2Pfvv92", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 8, "entitlementId": "PUiUHSPR"}, "type": "REVOKE_ENTITLEMENT"}, {"creditPayload": {"balanceOrigin": "Nintendo", "count": 56, "currencyCode": "nANHeU2k", "expireAt": "1971-05-09T00:00:00Z"}, "debitPayload": {"count": 47, "currencyCode": "zSnT1gE0", "walletPlatform": "IOS"}, "fulFillItemPayload": {"count": 18, "entitlementCollectionId": "s9Sg0A6p", "entitlementOrigin": "GooglePlay", "itemIdentity": "LNsJ0adV", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 92, "entitlementId": "shNnltcA"}, "type": "REVOKE_ENTITLEMENT"}, {"creditPayload": {"balanceOrigin": "IOS", "count": 36, "currencyCode": "E3oIjfqa", "expireAt": "1990-07-02T00:00:00Z"}, "debitPayload": {"count": 76, "currencyCode": "8U5hRZZg", "walletPlatform": "IOS"}, "fulFillItemPayload": {"count": 46, "entitlementCollectionId": "4hOC7EC8", "entitlementOrigin": "Xbox", "itemIdentity": "GM5fgDox", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 31, "entitlementId": "jx7YVrVm"}, "type": "REVOKE_ENTITLEMENT"}], "userId": "rZOiRivB"}], "metadata": {"6ibJpn0z": {}, "2lLtZKXC": {}, "UZwX2cbg": {}}, "needPreCheck": false, "transactionId": "ZwQBm6Cd", "type": "jMRjeX1K"}' \
    > test.out 2>&1
eval_tap $? 224 'Commit' test.out

#- 225 GetTradeHistoryByCriteria
./ng net.accelbyte.sdk.cli.Main platform getTradeHistoryByCriteria \
    --namespace "$AB_NAMESPACE" \
    --limit '69' \
    --offset '53' \
    --status 'FAILED' \
    --type 'xND0OJIb' \
    --userId 'JHX9sWHV' \
    > test.out 2>&1
eval_tap $? 225 'GetTradeHistoryByCriteria' test.out

#- 226 GetTradeHistoryByTransactionId
./ng net.accelbyte.sdk.cli.Main platform getTradeHistoryByTransactionId \
    --namespace "$AB_NAMESPACE" \
    --transactionId 'mLXK19sH' \
    > test.out 2>&1
eval_tap $? 226 'GetTradeHistoryByTransactionId' test.out

#- 227 UnlockSteamUserAchievement
./ng net.accelbyte.sdk.cli.Main platform unlockSteamUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'bH6Qu6Df' \
    --body '{"achievements": [{"id": "ljKLGd4J", "value": 76}, {"id": "wFmzz1Bu", "value": 79}, {"id": "EUFeXR3M", "value": 42}], "steamUserId": "6TN1YM1O"}' \
    > test.out 2>&1
eval_tap $? 227 'UnlockSteamUserAchievement' test.out

#- 228 GetXblUserAchievements
./ng net.accelbyte.sdk.cli.Main platform getXblUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'WF8cXUwN' \
    --xboxUserId 'XcvhjYOY' \
    > test.out 2>&1
eval_tap $? 228 'GetXblUserAchievements' test.out

#- 229 UpdateXblUserAchievement
./ng net.accelbyte.sdk.cli.Main platform updateXblUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'cQrvNKoz' \
    --body '{"achievements": [{"id": "q0mJyIVY", "percentComplete": 56}, {"id": "4S9jGBQ2", "percentComplete": 33}, {"id": "6ufq19Xx", "percentComplete": 17}], "serviceConfigId": "QQcUqy2k", "titleId": "apr0O5Om", "xboxUserId": "rKk38uMF"}' \
    > test.out 2>&1
eval_tap $? 229 'UpdateXblUserAchievement' test.out

#- 230 AnonymizeCampaign
./ng net.accelbyte.sdk.cli.Main platform anonymizeCampaign \
    --namespace "$AB_NAMESPACE" \
    --userId 'xBBKxYPq' \
    > test.out 2>&1
eval_tap $? 230 'AnonymizeCampaign' test.out

#- 231 AnonymizeEntitlement
./ng net.accelbyte.sdk.cli.Main platform anonymizeEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId '51deQS2L' \
    > test.out 2>&1
eval_tap $? 231 'AnonymizeEntitlement' test.out

#- 232 AnonymizeFulfillment
./ng net.accelbyte.sdk.cli.Main platform anonymizeFulfillment \
    --namespace "$AB_NAMESPACE" \
    --userId 's9AnC0pA' \
    > test.out 2>&1
eval_tap $? 232 'AnonymizeFulfillment' test.out

#- 233 AnonymizeIntegration
./ng net.accelbyte.sdk.cli.Main platform anonymizeIntegration \
    --namespace "$AB_NAMESPACE" \
    --userId 'B6L8kew7' \
    > test.out 2>&1
eval_tap $? 233 'AnonymizeIntegration' test.out

#- 234 AnonymizeOrder
./ng net.accelbyte.sdk.cli.Main platform anonymizeOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'skqv9FwF' \
    > test.out 2>&1
eval_tap $? 234 'AnonymizeOrder' test.out

#- 235 AnonymizePayment
./ng net.accelbyte.sdk.cli.Main platform anonymizePayment \
    --namespace "$AB_NAMESPACE" \
    --userId 'AUJtYzlW' \
    > test.out 2>&1
eval_tap $? 235 'AnonymizePayment' test.out

#- 236 AnonymizeRevocation
./ng net.accelbyte.sdk.cli.Main platform anonymizeRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId 'hei5bIe3' \
    > test.out 2>&1
eval_tap $? 236 'AnonymizeRevocation' test.out

#- 237 AnonymizeSubscription
./ng net.accelbyte.sdk.cli.Main platform anonymizeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'wWrhRZq3' \
    > test.out 2>&1
eval_tap $? 237 'AnonymizeSubscription' test.out

#- 238 AnonymizeWallet
./ng net.accelbyte.sdk.cli.Main platform anonymizeWallet \
    --namespace "$AB_NAMESPACE" \
    --userId 'c9DDfGOe' \
    > test.out 2>&1
eval_tap $? 238 'AnonymizeWallet' test.out

#- 239 GetUserDLCByPlatform
./ng net.accelbyte.sdk.cli.Main platform getUserDLCByPlatform \
    --namespace "$AB_NAMESPACE" \
    --userId 'vbUl0a5S' \
    --type 'EPICGAMES' \
    > test.out 2>&1
eval_tap $? 239 'GetUserDLCByPlatform' test.out

#- 240 GetUserDLC
./ng net.accelbyte.sdk.cli.Main platform getUserDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'QduFVQsj' \
    --includeAllNamespaces  \
    --status 'REVOKED' \
    --type 'PSN' \
    > test.out 2>&1
eval_tap $? 240 'GetUserDLC' test.out

#- 241 QueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'h8ykzfY2' \
    --activeOnly  \
    --appType 'DEMO' \
    --collectionId 'Zej7QmkR' \
    --entitlementClazz 'CODE' \
    --entitlementName 'ea0vKKGU' \
    --features 'rzrc7pOJ,9YiFeB03,gqsydNVK' \
    --fuzzyMatchName  \
    --itemId 'ouD0ybaC,aKbhSUVc,XckTIgSg' \
    --limit '73' \
    --offset '6' \
    --origin 'System' \
    > test.out 2>&1
eval_tap $? 241 'QueryUserEntitlements' test.out

#- 242 GrantUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform grantUserEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'lMttOXdd' \
    --body '[{"collectionId": "f4rlwcSG", "endDate": "1982-05-08T00:00:00Z", "grantedCode": "3x5iO6eT", "itemId": "34ReR24B", "itemNamespace": "0ZoczcYt", "language": "Uod_RRAD", "metadata": {"SNfOqTvS": {}, "1IWij56T": {}, "3rITPmpg": {}}, "origin": "Xbox", "quantity": 44, "region": "E3pr5UKC", "source": "PROMOTION", "startDate": "1989-04-09T00:00:00Z", "storeId": "6FtCSqWo"}, {"collectionId": "97Xht4GL", "endDate": "1996-11-10T00:00:00Z", "grantedCode": "BTUT9rKM", "itemId": "KUPiRopv", "itemNamespace": "4oTzlyHC", "language": "zPjW-ToAU_716", "metadata": {"vzFgsJlq": {}, "ZevKg8zZ": {}, "z3kKUYWF": {}}, "origin": "Other", "quantity": 65, "region": "8QhAR6OY", "source": "PURCHASE", "startDate": "1981-05-25T00:00:00Z", "storeId": "XPSpWmqE"}, {"collectionId": "IrJ8FRTU", "endDate": "1999-09-19T00:00:00Z", "grantedCode": "hjTRzWFy", "itemId": "KaKLEBje", "itemNamespace": "CwcLPkim", "language": "lEoc-HojI", "metadata": {"njEvKltc": {}, "jSNxB2rQ": {}, "BsKV9WTo": {}}, "origin": "Epic", "quantity": 4, "region": "v9uPcGM8", "source": "IAP", "startDate": "1999-02-11T00:00:00Z", "storeId": "mJdwzFQ3"}]' \
    > test.out 2>&1
eval_tap $? 242 'GrantUserEntitlement' test.out

#- 243 GetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId '18NihyUI' \
    --activeOnly  \
    --appId 'Kxa9ppbx' \
    > test.out 2>&1
eval_tap $? 243 'GetUserAppEntitlementByAppId' test.out

#- 244 QueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'mIXD52QI' \
    --activeOnly  \
    --limit '89' \
    --offset '68' \
    --appType 'GAME' \
    > test.out 2>&1
eval_tap $? 244 'QueryUserEntitlementsByAppType' test.out

#- 245 GetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId '0m5wvwUa' \
    --activeOnly  \
    --entitlementClazz 'SUBSCRIPTION' \
    --platform 'B3BkwVEq' \
    --itemId 'WxtqN6kK' \
    > test.out 2>&1
eval_tap $? 245 'GetUserEntitlementByItemId' test.out

#- 246 GetUserActiveEntitlementsByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserActiveEntitlementsByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'Opfyyl3x' \
    --ids 'fkLWRBkn,frTxlFS3,SDJCVREp' \
    --platform 'eaVXjAsg' \
    > test.out 2>&1
eval_tap $? 246 'GetUserActiveEntitlementsByItemIds' test.out

#- 247 GetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'cX9vb3lT' \
    --activeOnly  \
    --entitlementClazz 'MEDIA' \
    --platform 'MwZBhTIj' \
    --sku 'tU0NMauI' \
    > test.out 2>&1
eval_tap $? 247 'GetUserEntitlementBySku' test.out

#- 248 ExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId '9P0ZlEky' \
    --appIds 'Ooj8RvWh,crzbc2R5,LJH1YcWs' \
    --itemIds 'mWZLYDmk,afVsi9bd,xMcJpyDN' \
    --platform 'uXTNI3Q0' \
    --skus 'yov7bPmp,PnPGD5zZ,31CMvPxw' \
    > test.out 2>&1
eval_tap $? 248 'ExistsAnyUserActiveEntitlement' test.out

#- 249 ExistsAnyUserActiveEntitlementByItemIds
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlementByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'Of5xIHVP' \
    --platform 'mSFTZADs' \
    --itemIds 'beKei8Pm,s6JSjh9X,AcBV2L9v' \
    > test.out 2>&1
eval_tap $? 249 'ExistsAnyUserActiveEntitlementByItemIds' test.out

#- 250 GetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'CT7B3bcu' \
    --appId 'G9dRrGTU' \
    > test.out 2>&1
eval_tap $? 250 'GetUserAppEntitlementOwnershipByAppId' test.out

#- 251 GetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'kLHPYfb3' \
    --entitlementClazz 'LOOTBOX' \
    --platform 'cqpEcoNF' \
    --itemId 'gBXay7d1' \
    > test.out 2>&1
eval_tap $? 251 'GetUserEntitlementOwnershipByItemId' test.out

#- 252 GetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId '92LTZpBd' \
    --ids 'e1xPCRIG,R6ZAtztt,Tq4kQLxb' \
    --platform 'yOHE1sXz' \
    > test.out 2>&1
eval_tap $? 252 'GetUserEntitlementOwnershipByItemIds' test.out

#- 253 GetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'sA7Jdqfc' \
    --entitlementClazz 'LOOTBOX' \
    --platform 'UsmizX2P' \
    --sku 'OYwGp59O' \
    > test.out 2>&1
eval_tap $? 253 'GetUserEntitlementOwnershipBySku' test.out

#- 254 RevokeAllEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeAllEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId '5S5XyHhL' \
    > test.out 2>&1
eval_tap $? 254 'RevokeAllEntitlements' test.out

#- 255 RevokeUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'RRFJdUBE' \
    --entitlementIds 'fjE8yvRA' \
    > test.out 2>&1
eval_tap $? 255 'RevokeUserEntitlements' test.out

#- 256 GetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlement \
    --entitlementId 'O5lZoYQi' \
    --namespace "$AB_NAMESPACE" \
    --userId 'lZhmvGnf' \
    > test.out 2>&1
eval_tap $? 256 'GetUserEntitlement' test.out

#- 257 UpdateUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform updateUserEntitlement \
    --entitlementId 'h38L5NTm' \
    --namespace "$AB_NAMESPACE" \
    --userId 'lGLruBOT' \
    --body '{"collectionId": "lV4zeoAk", "endDate": "1973-12-23T00:00:00Z", "nullFieldList": ["2lmd8uoT", "FNk7MlBt", "08afMfd5"], "origin": "Steam", "reason": "5ivDV71a", "startDate": "1977-02-09T00:00:00Z", "status": "SOLD", "useCount": 64}' \
    > test.out 2>&1
eval_tap $? 257 'UpdateUserEntitlement' test.out

#- 258 ConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform consumeUserEntitlement \
    --entitlementId 'dK0qn2bi' \
    --namespace "$AB_NAMESPACE" \
    --userId '5NtvmsIo' \
    --body '{"metadata": {"Ta3Acmfl": {}, "6nSBBbqC": {}, "lBtKZlMg": {}}, "options": ["eQ2L9wdY", "dsb37LQF", "Accidgp0"], "platform": "yhEdH2Fc", "requestId": "aI7y1zQo", "useCount": 75}' \
    > test.out 2>&1
eval_tap $? 258 'ConsumeUserEntitlement' test.out

#- 259 DisableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform disableUserEntitlement \
    --entitlementId 'MV89Mdz4' \
    --namespace "$AB_NAMESPACE" \
    --userId 'AjBJDc8G' \
    > test.out 2>&1
eval_tap $? 259 'DisableUserEntitlement' test.out

#- 260 EnableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform enableUserEntitlement \
    --entitlementId 'hoyqw884' \
    --namespace "$AB_NAMESPACE" \
    --userId 'vA9B7mlc' \
    > test.out 2>&1
eval_tap $? 260 'EnableUserEntitlement' test.out

#- 261 GetUserEntitlementHistories
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementHistories \
    --entitlementId 'WllT0G7E' \
    --namespace "$AB_NAMESPACE" \
    --userId 'MDmHTMJH' \
    > test.out 2>&1
eval_tap $? 261 'GetUserEntitlementHistories' test.out

#- 262 RevokeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlement \
    --entitlementId 'pYZ4T4AX' \
    --namespace "$AB_NAMESPACE" \
    --userId '2lJd0Yha' \
    --body '{"metadata": {"yTcuI4W2": {}, "UR42aIu9": {}, "b9PFKHmG": {}}}' \
    > test.out 2>&1
eval_tap $? 262 'RevokeUserEntitlement' test.out

#- 263 RevokeUserEntitlementByUseCount
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlementByUseCount \
    --entitlementId 'HgvyI0JF' \
    --namespace "$AB_NAMESPACE" \
    --userId '72JzULTJ' \
    --body '{"reason": "RmQOY4wr", "useCount": 81}' \
    > test.out 2>&1
eval_tap $? 263 'RevokeUserEntitlementByUseCount' test.out

#- 264 PreCheckRevokeUserEntitlementByUseCount
./ng net.accelbyte.sdk.cli.Main platform preCheckRevokeUserEntitlementByUseCount \
    --entitlementId 'wDk6MXCQ' \
    --namespace "$AB_NAMESPACE" \
    --userId '3B5VTvZw' \
    --quantity '88' \
    > test.out 2>&1
eval_tap $? 264 'PreCheckRevokeUserEntitlementByUseCount' test.out

#- 265 RevokeUseCount
eval_tap 0 265 'RevokeUseCount # SKIP deprecated' test.out

#- 266 SellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform sellUserEntitlement \
    --entitlementId '6kRyU1Rl' \
    --namespace "$AB_NAMESPACE" \
    --userId 'GGXiHiaj' \
    --body '{"platform": "FCnJlyqd", "requestId": "HtHeoCeY", "useCount": 78}' \
    > test.out 2>&1
eval_tap $? 266 'SellUserEntitlement' test.out

#- 267 FulfillItem
./ng net.accelbyte.sdk.cli.Main platform fulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'vULOaHiB' \
    --body '{"duration": 76, "endDate": "1971-08-29T00:00:00Z", "entitlementCollectionId": "naJ072j3", "entitlementOrigin": "Epic", "itemId": "TaMpAZpV", "itemSku": "5bmpPt28", "language": "n3fT8P4Z", "metadata": {"rAhpoKNF": {}, "hmdYvWR8": {}, "TFKoIv2c": {}}, "order": {"currency": {"currencyCode": "xHqqKqhS", "currencySymbol": "KIbntpeW", "currencyType": "REAL", "decimals": 17, "namespace": "4B2Qp8iv"}, "ext": {"nrIOy1t6": {}, "pamvgX8C": {}, "sC90h2Pd": {}}, "free": false}, "orderNo": "Zv0PZHJF", "origin": "Epic", "overrideBundleItemQty": {"wvnDYtEQ": 85, "W8IifZ5G": 91, "DM0jLj3Z": 75}, "quantity": 14, "region": "AOFtuTuS", "source": "REWARD", "startDate": "1972-03-15T00:00:00Z", "storeId": "E4RMfUmm"}' \
    > test.out 2>&1
eval_tap $? 267 'FulfillItem' test.out

#- 268 RedeemCode
./ng net.accelbyte.sdk.cli.Main platform redeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'tutkQByz' \
    --body '{"code": "86yomT6l", "language": "OGA-yodI_Qy", "region": "8hHdGXfn"}' \
    > test.out 2>&1
eval_tap $? 268 'RedeemCode' test.out

#- 269 PreCheckFulfillItem
./ng net.accelbyte.sdk.cli.Main platform preCheckFulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId '5wk3Mh9K' \
    --body '{"itemId": "9j0TYeIM", "itemSku": "Lu8nCrC9", "quantity": 20}' \
    > test.out 2>&1
eval_tap $? 269 'PreCheckFulfillItem' test.out

#- 270 FulfillRewards
./ng net.accelbyte.sdk.cli.Main platform fulfillRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'LNMenQuo' \
    --body '{"entitlementCollectionId": "mVmOpGZW", "entitlementOrigin": "Nintendo", "metadata": {"9c0Zy8Vn": {}, "17TDwSPF": {}, "68J0bV5F": {}}, "origin": "Other", "rewards": [{"currency": {"currencyCode": "O3OchTbF", "namespace": "8VFIR5To"}, "item": {"itemId": "WVK1ZYmf", "itemName": "57OPLKBk", "itemSku": "RAXOmxJd", "itemType": "UUxUWVTm"}, "quantity": 41, "type": "ITEM"}, {"currency": {"currencyCode": "YNu8k7jZ", "namespace": "oUyXXDLF"}, "item": {"itemId": "xRY5G48H", "itemName": "ak4oERoM", "itemSku": "cf5NKz2b", "itemType": "dnGTmtL2"}, "quantity": 97, "type": "ITEM"}, {"currency": {"currencyCode": "qbt9g856", "namespace": "9YY335v6"}, "item": {"itemId": "wogaC7VR", "itemName": "Yd5WaYSx", "itemSku": "iVJy7e5S", "itemType": "fSdf9W8a"}, "quantity": 60, "type": "CURRENCY"}], "source": "IAP_CHARGEBACK_REVERSED", "transactionId": "qZPjhro5"}' \
    > test.out 2>&1
eval_tap $? 270 'FulfillRewards' test.out

#- 271 QueryUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId '19G3D1WM' \
    --endTime 'W8JjGsRD' \
    --limit '73' \
    --offset '10' \
    --productId 'C0UoSpza' \
    --startTime 'N4Soutvk' \
    --status 'FULFILLED' \
    --type 'STADIA' \
    > test.out 2>&1
eval_tap $? 271 'QueryUserIAPOrders' test.out

#- 272 QueryAllUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryAllUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'kHcmULPJ' \
    > test.out 2>&1
eval_tap $? 272 'QueryAllUserIAPOrders' test.out

#- 273 QueryUserIAPConsumeHistory
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPConsumeHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'uMQdMDkR' \
    --endTime '7pS7MZlZ' \
    --limit '20' \
    --offset '75' \
    --startTime 'JdG7otYT' \
    --status 'PENDING' \
    --type 'APPLE' \
    > test.out 2>&1
eval_tap $? 273 'QueryUserIAPConsumeHistory' test.out

#- 274 MockFulfillIAPItem
./ng net.accelbyte.sdk.cli.Main platform mockFulfillIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'ik9EdRmC' \
    --body '{"itemIdentityType": "ITEM_SKU", "language": "nb", "productId": "ehe5G5VW", "region": "OreVU9SA", "transactionId": "K9OrFGTH", "type": "STADIA"}' \
    > test.out 2>&1
eval_tap $? 274 'MockFulfillIAPItem' test.out

#- 275 QueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId '71N1OH9U' \
    --discounted  \
    --itemId 'veGw3uCA' \
    --limit '25' \
    --offset '55' \
    --status 'CHARGEBACK' \
    > test.out 2>&1
eval_tap $? 275 'QueryUserOrders' test.out

#- 276 AdminCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform adminCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'QJuB4GTR' \
    --body '{"currencyCode": "TzdhqTYR", "currencyNamespace": "3z8zgrRz", "discountCodes": ["a891VkIv", "AKU4T0fd", "EJplJ7N4"], "discountedPrice": 7, "entitlementPlatform": "Steam", "ext": {"g0PNAFY4": {}, "Z46ujv3R": {}, "pZRYad4p": {}}, "itemId": "rlgGLfBi", "language": "UIBhQvhx", "options": {"skipPriceValidation": true}, "platform": "Oculus", "price": 78, "quantity": 96, "region": "QUFMHKpx", "returnUrl": "QQJHyRqh", "sandbox": false, "sectionId": "kG8LZiMK"}' \
    > test.out 2>&1
eval_tap $? 276 'AdminCreateUserOrder' test.out

#- 277 CountOfPurchasedItem
./ng net.accelbyte.sdk.cli.Main platform countOfPurchasedItem \
    --namespace "$AB_NAMESPACE" \
    --userId '4eawbJtk' \
    --itemId '3zBJbMgV' \
    > test.out 2>&1
eval_tap $? 277 'CountOfPurchasedItem' test.out

#- 278 GetUserOrder
./ng net.accelbyte.sdk.cli.Main platform getUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo '0OV2qjYw' \
    --userId 'w2EP4rei' \
    > test.out 2>&1
eval_tap $? 278 'GetUserOrder' test.out

#- 279 UpdateUserOrderStatus
./ng net.accelbyte.sdk.cli.Main platform updateUserOrderStatus \
    --namespace "$AB_NAMESPACE" \
    --orderNo 's1jOkwxM' \
    --userId 'jFhaFy7a' \
    --body '{"status": "CHARGED", "statusReason": "8T4zx6lp"}' \
    > test.out 2>&1
eval_tap $? 279 'UpdateUserOrderStatus' test.out

#- 280 FulfillUserOrder
./ng net.accelbyte.sdk.cli.Main platform fulfillUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'Yxy1bTtM' \
    --userId 'h8lKG3Qn' \
    > test.out 2>&1
eval_tap $? 280 'FulfillUserOrder' test.out

#- 281 GetUserOrderGrant
eval_tap 0 281 'GetUserOrderGrant # SKIP deprecated' test.out

#- 282 GetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform getUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo '0OuCsaMC' \
    --userId 'znhytKDy' \
    > test.out 2>&1
eval_tap $? 282 'GetUserOrderHistories' test.out

#- 283 ProcessUserOrderNotification
./ng net.accelbyte.sdk.cli.Main platform processUserOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'xaW6V7bt' \
    --userId '4JHnBFJ8' \
    --body '{"additionalData": {"cardSummary": "5QvFJ3kD"}, "authorisedTime": "1991-12-16T00:00:00Z", "chargebackReversedTime": "1994-01-05T00:00:00Z", "chargebackTime": "1988-10-10T00:00:00Z", "chargedTime": "1997-05-14T00:00:00Z", "createdTime": "1996-08-26T00:00:00Z", "currency": {"currencyCode": "P9yvfdHI", "currencySymbol": "a15n5cdB", "currencyType": "REAL", "decimals": 69, "namespace": "z9PSVgg2"}, "customParameters": {"ANcB4l5I": {}, "WlgQBhd1": {}, "O8YqlNz1": {}}, "extOrderNo": "nauSe5sA", "extTxId": "f7fXMDyY", "extUserId": "JrJgRv34", "issuedAt": "1989-09-07T00:00:00Z", "metadata": {"clA1ZQKI": "v7JdiVXS", "bIjpFWpn": "Vc1QuwaS", "jdzQhfnL": "KUGAlrMF"}, "namespace": "722aQFsV", "nonceStr": "2N2fMoyx", "paymentData": {"discountAmount": 52, "discountCode": "6vrejEuG", "subtotalPrice": 90, "tax": 77, "totalPrice": 27}, "paymentMethod": "4ewpZiUh", "paymentMethodFee": 57, "paymentOrderNo": "SuwzyDu7", "paymentProvider": "STRIPE", "paymentProviderFee": 82, "paymentStationUrl": "WkOrfloH", "price": 40, "refundedTime": "1984-03-17T00:00:00Z", "salesTax": 78, "sandbox": false, "sku": "CNoN8ptv", "status": "CHARGE_FAILED", "statusReason": "OjyPy6Qv", "subscriptionId": "mYG3AgvB", "subtotalPrice": 68, "targetNamespace": "H9lFPCVV", "targetUserId": "wo2o68v0", "tax": 65, "totalPrice": 95, "totalTax": 85, "txEndTime": "1973-11-17T00:00:00Z", "type": "QDFxE0kT", "userId": "8xKzdpuP", "vat": 51}' \
    > test.out 2>&1
eval_tap $? 283 'ProcessUserOrderNotification' test.out

#- 284 DownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform downloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'vfPZwEL4' \
    --userId 'ZrHdEG0k' \
    > test.out 2>&1
eval_tap $? 284 'DownloadUserOrderReceipt' test.out

#- 285 CreateUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform createUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'e2GQHTI9' \
    --body '{"currencyCode": "BZkYQNUS", "currencyNamespace": "OsEf9sOg", "customParameters": {"r2UQQW9N": {}, "kIfClEc7": {}, "btJd7AC7": {}}, "description": "CLU3J7mn", "extOrderNo": "UglfLQrM", "extUserId": "pyYXMCm4", "itemType": "CODE", "language": "SIX-222", "metadata": {"ZPOeeIiq": "PFGR3wXH", "u22dUbPn": "Ak4CcetN", "oaxYoVig": "9BWGfH8U"}, "notifyUrl": "05P6aksw", "omitNotification": false, "platform": "bSGAH2D2", "price": 4, "recurringPaymentOrderNo": "vfPrs5H1", "region": "0Y4zw2nW", "returnUrl": "hDYs8b4N", "sandbox": false, "sku": "15ZylWam", "subscriptionId": "HDgFIpnO", "title": "wQbCMs8X"}' \
    > test.out 2>&1
eval_tap $? 285 'CreateUserPaymentOrder' test.out

#- 286 RefundUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform refundUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'FLMhOcX0' \
    --userId 'WwDkXJKu' \
    --body '{"description": "1WhNi2VK"}' \
    > test.out 2>&1
eval_tap $? 286 'RefundUserPaymentOrder' test.out

#- 287 GetUserPlatformAccountClosureHistories
./ng net.accelbyte.sdk.cli.Main platform getUserPlatformAccountClosureHistories \
    --namespace "$AB_NAMESPACE" \
    --userId 'r5YEgggC' \
    > test.out 2>&1
eval_tap $? 287 'GetUserPlatformAccountClosureHistories' test.out

#- 288 ApplyUserRedemption
./ng net.accelbyte.sdk.cli.Main platform applyUserRedemption \
    --namespace "$AB_NAMESPACE" \
    --userId 'kubmob7U' \
    --body '{"code": "ljqtGUoL", "orderNo": "c4m0YZSP"}' \
    > test.out 2>&1
eval_tap $? 288 'ApplyUserRedemption' test.out

#- 289 DoRevocation
./ng net.accelbyte.sdk.cli.Main platform doRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId '1huq3ca2' \
    --body '{"meta": {"CM08hjj6": {}, "X2DIPAhu": {}, "hV3FxLhH": {}}, "reason": "xsqvqiIg", "revokeEntries": [{"currency": {"balanceOrigin": "Playstation", "currencyCode": "5qcWUK7q", "namespace": "IDL60Q5e"}, "entitlement": {"entitlementId": "cResfeQV"}, "item": {"entitlementOrigin": "Twitch", "itemIdentity": "2RRQBUjc", "itemIdentityType": "ITEM_ID", "origin": "IOS"}, "quantity": 71, "type": "ITEM"}, {"currency": {"balanceOrigin": "Nintendo", "currencyCode": "tm0kDbU2", "namespace": "tPsCk2V6"}, "entitlement": {"entitlementId": "Dhxwq7RL"}, "item": {"entitlementOrigin": "Epic", "itemIdentity": "A1XH2vJr", "itemIdentityType": "ITEM_SKU", "origin": "Other"}, "quantity": 95, "type": "ITEM"}, {"currency": {"balanceOrigin": "Playstation", "currencyCode": "qA91fmQC", "namespace": "BT6hQP2Q"}, "entitlement": {"entitlementId": "C5eQe2LI"}, "item": {"entitlementOrigin": "Nintendo", "itemIdentity": "pB5ZMXyW", "itemIdentityType": "ITEM_SKU", "origin": "IOS"}, "quantity": 23, "type": "ENTITLEMENT"}], "source": "IAP", "transactionId": "Ra82sQoX"}' \
    > test.out 2>&1
eval_tap $? 289 'DoRevocation' test.out

#- 290 RegisterXblSessions
./ng net.accelbyte.sdk.cli.Main platform registerXblSessions \
    --namespace "$AB_NAMESPACE" \
    --userId 'EfQ5VR3o' \
    --body '{"gameSessionId": "JBvCLN5Q", "payload": {"tOPyvNoy": {}, "Wb7TZI00": {}, "Zhs1AlE2": {}}, "scid": "an0GVrCc", "sessionTemplateName": "WORBY6Fu"}' \
    > test.out 2>&1
eval_tap $? 290 'RegisterXblSessions' test.out

#- 291 QueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform queryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'fCOAuJun' \
    --chargeStatus 'RECURRING_CHARGING' \
    --itemId 'yBRjwgkz' \
    --limit '42' \
    --offset '100' \
    --sku 'igeZD7Yz' \
    --status 'ACTIVE' \
    --subscribedBy 'PLATFORM' \
    > test.out 2>&1
eval_tap $? 291 'QueryUserSubscriptions' test.out

#- 292 GetUserSubscriptionActivities
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionActivities \
    --namespace "$AB_NAMESPACE" \
    --userId 'msDEpwrT' \
    --excludeSystem  \
    --limit '4' \
    --offset '26' \
    --subscriptionId 'EN1jJT5s' \
    > test.out 2>&1
eval_tap $? 292 'GetUserSubscriptionActivities' test.out

#- 293 PlatformSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform platformSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'XvDc4Q7c' \
    --body '{"grantDays": 62, "itemId": "VuAj9KHQ", "language": "tUj9RBy0", "reason": "C4Isv1cu", "region": "5JrenHrd", "source": "vNlv86Cu"}' \
    > test.out 2>&1
eval_tap $? 293 'PlatformSubscribeSubscription' test.out

#- 294 CheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform checkUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'CXtGmjqH' \
    --itemId 'Nxmlcwcy' \
    > test.out 2>&1
eval_tap $? 294 'CheckUserSubscriptionSubscribableByItemId' test.out

#- 295 GetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform getUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'OxkFuXvz' \
    --userId 'w5IbR6v8' \
    > test.out 2>&1
eval_tap $? 295 'GetUserSubscription' test.out

#- 296 DeleteUserSubscription
./ng net.accelbyte.sdk.cli.Main platform deleteUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'k2gCEKGM' \
    --userId '3tBC9OOM' \
    > test.out 2>&1
eval_tap $? 296 'DeleteUserSubscription' test.out

#- 297 CancelSubscription
./ng net.accelbyte.sdk.cli.Main platform cancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'zjYWXhBp' \
    --userId '6HbwPJ64' \
    --force  \
    --body '{"immediate": true, "reason": "LXJClAie"}' \
    > test.out 2>&1
eval_tap $? 297 'CancelSubscription' test.out

#- 298 GrantDaysToSubscription
./ng net.accelbyte.sdk.cli.Main platform grantDaysToSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'p9F7dE0w' \
    --userId '6vblbW8x' \
    --body '{"grantDays": 34, "reason": "CejcySTQ"}' \
    > test.out 2>&1
eval_tap $? 298 'GrantDaysToSubscription' test.out

#- 299 GetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'enZ5jBEk' \
    --userId 'pD8XJTVN' \
    --excludeFree  \
    --limit '83' \
    --offset '17' \
    > test.out 2>&1
eval_tap $? 299 'GetUserSubscriptionBillingHistories' test.out

#- 300 ProcessUserSubscriptionNotification
./ng net.accelbyte.sdk.cli.Main platform processUserSubscriptionNotification \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'dzqxUi6a' \
    --userId '9oag8jR2' \
    --body '{"additionalData": {"cardSummary": "JafYlLfz"}, "authorisedTime": "1975-09-20T00:00:00Z", "chargebackReversedTime": "1985-07-01T00:00:00Z", "chargebackTime": "1988-07-13T00:00:00Z", "chargedTime": "1993-01-10T00:00:00Z", "createdTime": "1976-03-23T00:00:00Z", "currency": {"currencyCode": "EjyhSUZy", "currencySymbol": "ywbJgqkt", "currencyType": "VIRTUAL", "decimals": 18, "namespace": "uPeYqGAJ"}, "customParameters": {"EVP783UO": {}, "9F7LByHj": {}, "uEZ0wbTJ": {}}, "extOrderNo": "q4PXxFpE", "extTxId": "S5ymOT0J", "extUserId": "piMvMMiG", "issuedAt": "1971-08-31T00:00:00Z", "metadata": {"Ch9dj2GH": "I0Qr2Nrf", "ppzRJdb9": "WHd4Upbn", "dnAkV3gQ": "Ehmud88l"}, "namespace": "c0SUwMsw", "nonceStr": "2e8lGeLY", "paymentData": {"discountAmount": 14, "discountCode": "aXmoSZsN", "subtotalPrice": 41, "tax": 100, "totalPrice": 29}, "paymentMethod": "Zgcb8cVM", "paymentMethodFee": 25, "paymentOrderNo": "dsJjPrYf", "paymentProvider": "ADYEN", "paymentProviderFee": 23, "paymentStationUrl": "7w0db0nJ", "price": 30, "refundedTime": "1997-04-07T00:00:00Z", "salesTax": 68, "sandbox": false, "sku": "iIb0ebfG", "status": "REFUNDING", "statusReason": "1ZvI2BpU", "subscriptionId": "u8aQ0pb7", "subtotalPrice": 97, "targetNamespace": "ZunPrCsz", "targetUserId": "irYoNsnA", "tax": 76, "totalPrice": 2, "totalTax": 74, "txEndTime": "1971-12-18T00:00:00Z", "type": "ikE2hfD3", "userId": "EzRmrsC2", "vat": 34}' \
    > test.out 2>&1
eval_tap $? 300 'ProcessUserSubscriptionNotification' test.out

#- 301 AcquireUserTicket
./ng net.accelbyte.sdk.cli.Main platform acquireUserTicket \
    --boothName 'FNJ77cL0' \
    --namespace "$AB_NAMESPACE" \
    --userId '1CXmbRPw' \
    --body '{"count": 47, "orderNo": "HXlVRuHM"}' \
    > test.out 2>&1
eval_tap $? 301 'AcquireUserTicket' test.out

#- 302 QueryUserCurrencyWallets
./ng net.accelbyte.sdk.cli.Main platform queryUserCurrencyWallets \
    --namespace "$AB_NAMESPACE" \
    --userId 'Zoxx2EqR' \
    > test.out 2>&1
eval_tap $? 302 'QueryUserCurrencyWallets' test.out

#- 303 DebitUserWalletByCurrencyCode
./ng net.accelbyte.sdk.cli.Main platform debitUserWalletByCurrencyCode \
    --currencyCode 'bfK27a1k' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ja4ukeAR' \
    --body '{"allowOverdraft": true, "amount": 9, "balanceOrigin": "Xbox", "balanceSource": "IAP_REVOCATION", "metadata": {"32cKyTI3": {}, "enDw9ZZh": {}, "cvPULMC5": {}}, "reason": "zfpCZ4SM"}' \
    > test.out 2>&1
eval_tap $? 303 'DebitUserWalletByCurrencyCode' test.out

#- 304 ListUserCurrencyTransactions
./ng net.accelbyte.sdk.cli.Main platform listUserCurrencyTransactions \
    --currencyCode 'vFz7oPCM' \
    --namespace "$AB_NAMESPACE" \
    --userId 'BYmmXG4q' \
    --limit '42' \
    --offset '92' \
    > test.out 2>&1
eval_tap $? 304 'ListUserCurrencyTransactions' test.out

#- 305 CheckBalance
./ng net.accelbyte.sdk.cli.Main platform checkBalance \
    --currencyCode 'W0VeH9eJ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'PrH8ju0Z' \
    --request '{"amount": 74, "debitBalanceSource": "EXPIRATION", "metadata": {"T1sKE3l7": {}, "sBReW93e": {}, "w1fZuNd5": {}}, "reason": "Oe7R4uTG", "walletPlatform": "Xbox"}' \
    > test.out 2>&1
eval_tap $? 305 'CheckBalance' test.out

#- 306 CheckWallet
eval_tap 0 306 'CheckWallet # SKIP deprecated' test.out

#- 307 CreditUserWallet
./ng net.accelbyte.sdk.cli.Main platform creditUserWallet \
    --currencyCode 'dlDBkRdk' \
    --namespace "$AB_NAMESPACE" \
    --userId 'UOrsofpA' \
    --body '{"amount": 59, "expireAt": "1977-09-28T00:00:00Z", "metadata": {"2UVQsi49": {}, "kvd9yqRL": {}, "Fc2225r9": {}}, "origin": "Nintendo", "reason": "PrJeYppZ", "source": "REFERRAL_BONUS"}' \
    > test.out 2>&1
eval_tap $? 307 'CreditUserWallet' test.out

#- 308 DebitByWalletPlatform
./ng net.accelbyte.sdk.cli.Main platform debitByWalletPlatform \
    --currencyCode '9UD2OpNq' \
    --namespace "$AB_NAMESPACE" \
    --userId 'iOISxI16' \
    --request '{"amount": 17, "debitBalanceSource": "OTHER", "metadata": {"RkotrfHq": {}, "7xUbNttL": {}, "mLUF3J3j": {}}, "reason": "LiLVSX2r", "walletPlatform": "Epic"}' \
    > test.out 2>&1
eval_tap $? 308 'DebitByWalletPlatform' test.out

#- 309 PayWithUserWallet
./ng net.accelbyte.sdk.cli.Main platform payWithUserWallet \
    --currencyCode 'TRTZaIyu' \
    --namespace "$AB_NAMESPACE" \
    --userId '7XgoJukI' \
    --body '{"amount": 29, "metadata": {"gYDrFvRX": {}, "rvZvulkX": {}, "wUJvNwcI": {}}, "walletPlatform": "Epic"}' \
    > test.out 2>&1
eval_tap $? 309 'PayWithUserWallet' test.out

#- 310 GetUserWallet
eval_tap 0 310 'GetUserWallet # SKIP deprecated' test.out

#- 311 DebitUserWallet
eval_tap 0 311 'DebitUserWallet # SKIP deprecated' test.out

#- 312 DisableUserWallet
eval_tap 0 312 'DisableUserWallet # SKIP deprecated' test.out

#- 313 EnableUserWallet
eval_tap 0 313 'EnableUserWallet # SKIP deprecated' test.out

#- 314 ListUserWalletTransactions
eval_tap 0 314 'ListUserWalletTransactions # SKIP deprecated' test.out

#- 315 ListViews
./ng net.accelbyte.sdk.cli.Main platform listViews \
    --namespace "$AB_NAMESPACE" \
    --storeId 'hSadggoS' \
    > test.out 2>&1
eval_tap $? 315 'ListViews' test.out

#- 316 CreateView
./ng net.accelbyte.sdk.cli.Main platform createView \
    --namespace "$AB_NAMESPACE" \
    --storeId 'RafgovqM' \
    --body '{"displayOrder": 0, "localizations": {"wTFd4BqM": {"description": "fe6WMpmu", "localExt": {"Bd4X0yrX": {}, "p8CwIMcn": {}, "tL8HM52W": {}}, "longDescription": "s99SDuxV", "title": "NpXpdWzz"}, "UT6Z0VCB": {"description": "T93TkZ8G", "localExt": {"sTyNIXds": {}, "xosm4sVe": {}, "mL7Grntq": {}}, "longDescription": "tmq1FBvF", "title": "VnvDQWLp"}, "WV8Z6wBL": {"description": "rDJxdU7m", "localExt": {"qGRHr2e4": {}, "GsvNDKfy": {}, "afnfCo7t": {}}, "longDescription": "Ox4Uz9ko", "title": "OVZiZ3BS"}}, "name": "dkvfts9D"}' \
    > test.out 2>&1
eval_tap $? 316 'CreateView' test.out

#- 317 GetView
./ng net.accelbyte.sdk.cli.Main platform getView \
    --namespace "$AB_NAMESPACE" \
    --viewId '1E6Njb8p' \
    --storeId 'BTSm4KTf' \
    > test.out 2>&1
eval_tap $? 317 'GetView' test.out

#- 318 UpdateView
./ng net.accelbyte.sdk.cli.Main platform updateView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'NjMJ3i8L' \
    --storeId 'FO3kAVLh' \
    --body '{"displayOrder": 56, "localizations": {"7pbrrtMH": {"description": "hme8XFTm", "localExt": {"IqsS2LCV": {}, "rb1Qoxck": {}, "l8DkqkQ3": {}}, "longDescription": "RHfENxQj", "title": "8XIBTzFY"}, "U4XJ00UL": {"description": "LcqknEQW", "localExt": {"qU0mpX8H": {}, "cGb1c98Z": {}, "3Bb6BhWy": {}}, "longDescription": "Za2zYKwV", "title": "FoaLZKiP"}, "gngCOCXS": {"description": "WLo8nl8Y", "localExt": {"HkUWtoLb": {}, "8mN4byPY": {}, "ZkQRnmaC": {}}, "longDescription": "5hEAXbFx", "title": "W6F4ROMd"}}, "name": "zTpzw0Ye"}' \
    > test.out 2>&1
eval_tap $? 318 'UpdateView' test.out

#- 319 DeleteView
./ng net.accelbyte.sdk.cli.Main platform deleteView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'Rb82wJhP' \
    --storeId 'nC6qWqoX' \
    > test.out 2>&1
eval_tap $? 319 'DeleteView' test.out

#- 320 QueryWallets
eval_tap 0 320 'QueryWallets # SKIP deprecated' test.out

#- 321 BulkCredit
./ng net.accelbyte.sdk.cli.Main platform bulkCredit \
    --namespace "$AB_NAMESPACE" \
    --body '[{"creditRequest": {"amount": 59, "expireAt": "1985-07-15T00:00:00Z", "metadata": {"tuCUyS5t": {}, "0Oun5Fks": {}, "h69A8C1J": {}}, "origin": "Epic", "reason": "pHzNwJK1", "source": "REFERRAL_BONUS"}, "currencyCode": "yck6GHnf", "userIds": ["uHJWLdX8", "5kk3ctcl", "DPNTTxay"]}, {"creditRequest": {"amount": 34, "expireAt": "1977-12-02T00:00:00Z", "metadata": {"RwWAHOjW": {}, "hSQdPXGi": {}, "3SpEb4h9": {}}, "origin": "IOS", "reason": "WFZSwoNG", "source": "REFERRAL_BONUS"}, "currencyCode": "8VpNg4aZ", "userIds": ["cGBbVm1W", "RLmknu8z", "YrgQ8zfT"]}, {"creditRequest": {"amount": 82, "expireAt": "1995-07-26T00:00:00Z", "metadata": {"gfTF6E5d": {}, "EzHJIOLj": {}, "jx06GQar": {}}, "origin": "System", "reason": "IqUfxJu9", "source": "REWARD"}, "currencyCode": "BKWiNjW5", "userIds": ["J7R3scAd", "Uj5alxKl", "9vzpprjP"]}]' \
    > test.out 2>&1
eval_tap $? 321 'BulkCredit' test.out

#- 322 BulkDebit
./ng net.accelbyte.sdk.cli.Main platform bulkDebit \
    --namespace "$AB_NAMESPACE" \
    --body '[{"currencyCode": "lZ9vajly", "request": {"allowOverdraft": true, "amount": 73, "balanceOrigin": "System", "balanceSource": "IAP_REVOCATION", "metadata": {"ztWPmHs0": {}, "4imL2zjC": {}, "YYG7l91P": {}}, "reason": "3pvQ3n7R"}, "userIds": ["m4w2o1cq", "gKoSGbR2", "secMZsWd"]}, {"currencyCode": "0pyfP2We", "request": {"allowOverdraft": false, "amount": 3, "balanceOrigin": "Oculus", "balanceSource": "OTHER", "metadata": {"fbmtj8wa": {}, "9ebXNQxY": {}, "qFRdMnqi": {}}, "reason": "bVhvrs89"}, "userIds": ["IHpsdilE", "DTpfGCAb", "AbDbCSEM"]}, {"currencyCode": "NIztWL2j", "request": {"allowOverdraft": false, "amount": 87, "balanceOrigin": "GooglePlay", "balanceSource": "OTHER", "metadata": {"nBQEUWf6": {}, "gXbfAs7F": {}, "qYnQJGU9": {}}, "reason": "BfqrPRGV"}, "userIds": ["9tpuBjv7", "Hnkmsa8C", "KJjjTTXV"]}]' \
    > test.out 2>&1
eval_tap $? 322 'BulkDebit' test.out

#- 323 GetWallet
eval_tap 0 323 'GetWallet # SKIP deprecated' test.out

#- 324 SyncOrders
./ng net.accelbyte.sdk.cli.Main platform syncOrders \
    --nextEvaluatedKey 'AoH2Q4xi' \
    --end '12EylPuZ' \
    --start 'HOXEzlnP' \
    > test.out 2>&1
eval_tap $? 324 'SyncOrders' test.out

#- 325 TestAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfig \
    --sandbox  \
    --body '{"allowedPaymentMethods": ["Q980NU4D", "is29Fd5g", "N3tPK46C"], "apiKey": "DuDlqVGM", "authoriseAsCapture": false, "blockedPaymentMethods": ["YOrm8h0B", "OixHsLAE", "U0Ls4wf6"], "clientKey": "UuTDcaiQ", "dropInSettings": "vfokiSe6", "liveEndpointUrlPrefix": "CNmM35cB", "merchantAccount": "fCl6MkTb", "notificationHmacKey": "JitvZOJm", "notificationPassword": "8wXqNWZR", "notificationUsername": "xbQSCCuU", "returnUrl": "vhIc3FFx", "settings": "z1ExZB9o"}' \
    > test.out 2>&1
eval_tap $? 325 'TestAdyenConfig' test.out

#- 326 TestAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfig \
    --sandbox  \
    --body '{"appId": "YdXLYTSD", "privateKey": "0I2Yfhoy", "publicKey": "KcmAoUzy", "returnUrl": "rFxinhr9"}' \
    > test.out 2>&1
eval_tap $? 326 'TestAliPayConfig' test.out

#- 327 TestCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfig \
    --sandbox  \
    --body '{"publicKey": "3RL4gRCE", "secretKey": "It32z8HG"}' \
    > test.out 2>&1
eval_tap $? 327 'TestCheckoutConfig' test.out

#- 328 DebugMatchedPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentMerchantConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'TtvsYzpe' \
    > test.out 2>&1
eval_tap $? 328 'DebugMatchedPaymentMerchantConfig' test.out

#- 329 TestNeonPayConfig
./ng net.accelbyte.sdk.cli.Main platform testNeonPayConfig \
    --sandbox  \
    --body '{"apiKey": "0wAgd8KX", "webhookSecretKey": "IS36LqeE"}' \
    > test.out 2>&1
eval_tap $? 329 'TestNeonPayConfig' test.out

#- 330 TestPayPalConfig
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfig \
    --sandbox  \
    --body '{"clientID": "FcHQG658", "clientSecret": "483UQDIl", "returnUrl": "lQlF9K9S", "webHookId": "6GESt7mq"}' \
    > test.out 2>&1
eval_tap $? 330 'TestPayPalConfig' test.out

#- 331 TestStripeConfig
./ng net.accelbyte.sdk.cli.Main platform testStripeConfig \
    --sandbox  \
    --body '{"allowedPaymentMethodTypes": ["kE1AvTB1", "uRuOvCty", "ll64lZAD"], "publishableKey": "TiGm7aMw", "secretKey": "N8l5J7f0", "webhookSecret": "nJvbsesJ"}' \
    > test.out 2>&1
eval_tap $? 331 'TestStripeConfig' test.out

#- 332 TestWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfig \
    --body '{"appId": "2NJd0gbq", "key": "Kk2aHLgp", "mchid": "wMPPV5RX", "returnUrl": "n845vHt8"}' \
    > test.out 2>&1
eval_tap $? 332 'TestWxPayConfig' test.out

#- 333 TestXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfig \
    --body '{"apiKey": "oSaoVM21", "flowCompletionUrl": "PslUHGBq", "merchantId": 34, "projectId": 100, "projectSecretKey": "8jf1qpx8"}' \
    > test.out 2>&1
eval_tap $? 333 'TestXsollaConfig' test.out

#- 334 GetPaymentMerchantConfig1
./ng net.accelbyte.sdk.cli.Main platform getPaymentMerchantConfig1 \
    --id 'xOGMDouc' \
    > test.out 2>&1
eval_tap $? 334 'GetPaymentMerchantConfig1' test.out

#- 335 UpdateAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform updateAdyenConfig \
    --id 'qcUMJKko' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethods": ["4oChk9iR", "iGJyLTPC", "IpWEzwMq"], "apiKey": "DzkPPhjR", "authoriseAsCapture": false, "blockedPaymentMethods": ["R078GvOa", "m6CNAg6e", "L4xKNAcs"], "clientKey": "Hcs4zupJ", "dropInSettings": "CyyA1sty", "liveEndpointUrlPrefix": "PLuNsK1I", "merchantAccount": "HKRDBavl", "notificationHmacKey": "pHDq4Zh5", "notificationPassword": "Yu9KdRxM", "notificationUsername": "rNIJtb26", "returnUrl": "DjVZzMta", "settings": "BiAcGmeM"}' \
    > test.out 2>&1
eval_tap $? 335 'UpdateAdyenConfig' test.out

#- 336 TestAdyenConfigById
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfigById \
    --id 'X5uriwiK' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 336 'TestAdyenConfigById' test.out

#- 337 UpdateAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateAliPayConfig \
    --id 'QIos1J2q' \
    --sandbox  \
    --validate  \
    --body '{"appId": "aNIEre4d", "privateKey": "16P19U8f", "publicKey": "mbfSzaPB", "returnUrl": "xfo127yp"}' \
    > test.out 2>&1
eval_tap $? 337 'UpdateAliPayConfig' test.out

#- 338 TestAliPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfigById \
    --id 'CSlOLuCE' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 338 'TestAliPayConfigById' test.out

#- 339 UpdateCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform updateCheckoutConfig \
    --id 'ngKTzvWK' \
    --sandbox  \
    --validate  \
    --body '{"publicKey": "VDuRTR9o", "secretKey": "A0czFMkz"}' \
    > test.out 2>&1
eval_tap $? 339 'UpdateCheckoutConfig' test.out

#- 340 TestCheckoutConfigById
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfigById \
    --id 'vSHu4ZhV' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 340 'TestCheckoutConfigById' test.out

#- 341 UpdateNeonPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateNeonPayConfig \
    --id 'mkvG7TQe' \
    --sandbox  \
    --validate  \
    --body '{"apiKey": "mF3tinQr", "webhookSecretKey": "V43HtUpE"}' \
    > test.out 2>&1
eval_tap $? 341 'UpdateNeonPayConfig' test.out

#- 342 TestNeonPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testNeonPayConfigById \
    --id 'jN7XrUra' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 342 'TestNeonPayConfigById' test.out

#- 343 UpdatePayPalConfig
./ng net.accelbyte.sdk.cli.Main platform updatePayPalConfig \
    --id 'NSpjnTmz' \
    --sandbox  \
    --validate  \
    --body '{"clientID": "h4sAf0fV", "clientSecret": "TblNRdxh", "returnUrl": "7PWyOlwQ", "webHookId": "ukrbTfSQ"}' \
    > test.out 2>&1
eval_tap $? 343 'UpdatePayPalConfig' test.out

#- 344 TestPayPalConfigById
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfigById \
    --id 'jd3Y8ofa' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 344 'TestPayPalConfigById' test.out

#- 345 UpdateStripeConfig
./ng net.accelbyte.sdk.cli.Main platform updateStripeConfig \
    --id 'kMMaCZW4' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethodTypes": ["j5XB1zp5", "j0gCH8Qh", "CEqRzLaY"], "publishableKey": "rW7znrko", "secretKey": "vOvZr3og", "webhookSecret": "Z9nz41nx"}' \
    > test.out 2>&1
eval_tap $? 345 'UpdateStripeConfig' test.out

#- 346 TestStripeConfigById
./ng net.accelbyte.sdk.cli.Main platform testStripeConfigById \
    --id 'jmtRTItG' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 346 'TestStripeConfigById' test.out

#- 347 UpdateWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfig \
    --id 'ptvz7Q19' \
    --validate  \
    --body '{"appId": "VCDP7Sza", "key": "nFDNsPKZ", "mchid": "dq7kaXlT", "returnUrl": "eSF5TWQW"}' \
    > test.out 2>&1
eval_tap $? 347 'UpdateWxPayConfig' test.out

#- 348 UpdateWxPayConfigCert
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfigCert \
    --id 'jg3gZbGR' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 348 'UpdateWxPayConfigCert' test.out

#- 349 TestWxPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfigById \
    --id '2Veko6zr' \
    > test.out 2>&1
eval_tap $? 349 'TestWxPayConfigById' test.out

#- 350 UpdateXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaConfig \
    --id 'Kjh9VClt' \
    --validate  \
    --body '{"apiKey": "3FtvAxnV", "flowCompletionUrl": "JFhBhhoq", "merchantId": 93, "projectId": 97, "projectSecretKey": "z0ISh0ZN"}' \
    > test.out 2>&1
eval_tap $? 350 'UpdateXsollaConfig' test.out

#- 351 TestXsollaConfigById
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfigById \
    --id '7XBiJpA8' \
    > test.out 2>&1
eval_tap $? 351 'TestXsollaConfigById' test.out

#- 352 UpdateXsollaUIConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaUIConfig \
    --id 'SioiraU2' \
    --body '{"device": "MOBILE", "showCloseButton": true, "size": "SMALL", "theme": "DEFAULT"}' \
    > test.out 2>&1
eval_tap $? 352 'UpdateXsollaUIConfig' test.out

#- 353 QueryPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform queryPaymentProviderConfig \
    --limit '15' \
    --namespace "$AB_NAMESPACE" \
    --offset '94' \
    --region 'EmPTAg7N' \
    > test.out 2>&1
eval_tap $? 353 'QueryPaymentProviderConfig' test.out

#- 354 CreatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform createPaymentProviderConfig \
    --body '{"aggregate": "CHECKOUT", "namespace": "Oc3dcX73", "region": "8QZRroIl", "sandboxTaxJarApiToken": "PWcLUQB1", "specials": ["CHECKOUT", "WALLET", "CHECKOUT"], "taxJarApiToken": "pvp2YuKJ", "taxJarEnabled": true, "useGlobalTaxJarApiToken": false}' \
    > test.out 2>&1
eval_tap $? 354 'CreatePaymentProviderConfig' test.out

#- 355 GetAggregatePaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getAggregatePaymentProviders \
    > test.out 2>&1
eval_tap $? 355 'GetAggregatePaymentProviders' test.out

#- 356 DebugMatchedPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentProviderConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'lLxLstjR' \
    > test.out 2>&1
eval_tap $? 356 'DebugMatchedPaymentProviderConfig' test.out

#- 357 GetSpecialPaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getSpecialPaymentProviders \
    > test.out 2>&1
eval_tap $? 357 'GetSpecialPaymentProviders' test.out

#- 358 UpdatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentProviderConfig \
    --id 'QPWnIOjZ' \
    --body '{"aggregate": "XSOLLA", "namespace": "x3BjoTKZ", "region": "lOhUVsQE", "sandboxTaxJarApiToken": "NVb1Vlcm", "specials": ["XSOLLA", "NEONPAY", "STRIPE"], "taxJarApiToken": "FdLXKjWc", "taxJarEnabled": false, "useGlobalTaxJarApiToken": false}' \
    > test.out 2>&1
eval_tap $? 358 'UpdatePaymentProviderConfig' test.out

#- 359 DeletePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform deletePaymentProviderConfig \
    --id 'y6qZZqVT' \
    > test.out 2>&1
eval_tap $? 359 'DeletePaymentProviderConfig' test.out

#- 360 GetPaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxConfig \
    > test.out 2>&1
eval_tap $? 360 'GetPaymentTaxConfig' test.out

#- 361 UpdatePaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentTaxConfig \
    --body '{"sandboxTaxJarApiToken": "T1VtYp80", "taxJarApiToken": "lcz5sEPu", "taxJarEnabled": false, "taxJarProductCodesMapping": {"NqJYebf0": "CLhUg3mN", "xBGUrA9V": "bRuQ4SNm", "BtzYhBQs": "m5DKeoZN"}}' \
    > test.out 2>&1
eval_tap $? 361 'UpdatePaymentTaxConfig' test.out

#- 362 SyncPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform syncPaymentOrders \
    --nextEvaluatedKey 'zoJ7nlHb' \
    --end 'KWlu8Dxq' \
    --start 'eQy7zuvs' \
    > test.out 2>&1
eval_tap $? 362 'SyncPaymentOrders' test.out

#- 363 PublicGetRootCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetRootCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'kfjNuHmF' \
    --storeId 'mmrOWMSi' \
    > test.out 2>&1
eval_tap $? 363 'PublicGetRootCategories' test.out

#- 364 DownloadCategories
./ng net.accelbyte.sdk.cli.Main platform downloadCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'ewSoKpoI' \
    --storeId '8MMVTKGB' \
    > test.out 2>&1
eval_tap $? 364 'DownloadCategories' test.out

#- 365 PublicGetCategory
./ng net.accelbyte.sdk.cli.Main platform publicGetCategory \
    --categoryPath 'AeRTjleO' \
    --namespace "$AB_NAMESPACE" \
    --language 'hjs3qTJy' \
    --storeId '1POR75bC' \
    > test.out 2>&1
eval_tap $? 365 'PublicGetCategory' test.out

#- 366 PublicGetChildCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetChildCategories \
    --categoryPath 'yNteXwFd' \
    --namespace "$AB_NAMESPACE" \
    --language 'TaDQdv4n' \
    --storeId 'fIhLbZGN' \
    > test.out 2>&1
eval_tap $? 366 'PublicGetChildCategories' test.out

#- 367 PublicGetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetDescendantCategories \
    --categoryPath 'bH0lIbKZ' \
    --namespace "$AB_NAMESPACE" \
    --language '2vvs6LT3' \
    --storeId 'mVL4PI9N' \
    > test.out 2>&1
eval_tap $? 367 'PublicGetDescendantCategories' test.out

#- 368 PublicListCurrencies
./ng net.accelbyte.sdk.cli.Main platform publicListCurrencies \
    --namespace "$AB_NAMESPACE" \
    --currencyType 'REAL' \
    > test.out 2>&1
eval_tap $? 368 'PublicListCurrencies' test.out

#- 369 GeDLCDurableRewardShortMap
./ng net.accelbyte.sdk.cli.Main platform geDLCDurableRewardShortMap \
    --namespace "$AB_NAMESPACE" \
    --dlcType 'XBOX' \
    > test.out 2>&1
eval_tap $? 369 'GeDLCDurableRewardShortMap' test.out

#- 370 GetIAPItemMapping
./ng net.accelbyte.sdk.cli.Main platform getIAPItemMapping \
    --namespace "$AB_NAMESPACE" \
    --platform 'APPLE' \
    > test.out 2>&1
eval_tap $? 370 'GetIAPItemMapping' test.out

#- 371 PublicGetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --language 'hzpQe4aU' \
    --region 'kaNw6qqf' \
    --storeId 'yze5Ky0l' \
    --appId 'AafrKeDp' \
    > test.out 2>&1
eval_tap $? 371 'PublicGetItemByAppId' test.out

#- 372 PublicQueryItems
./ng net.accelbyte.sdk.cli.Main platform publicQueryItems \
    --namespace "$AB_NAMESPACE" \
    --appType 'DEMO' \
    --autoCalcEstimatedPrice  \
    --baseAppId 'zgAdaHkW' \
    --categoryPath 'j2BR7nOZ' \
    --features 'qDhM3VGd' \
    --includeSubCategoryItem  \
    --itemType 'CODE' \
    --language '0YEDeEIY' \
    --limit '90' \
    --offset '2' \
    --region 'osFOJsE6' \
    --sortBy 'createdAt,createdAt:asc,createdAt:desc' \
    --storeId 'rR7VA0NG' \
    --tags '7RoSVMuW' \
    > test.out 2>&1
eval_tap $? 372 'PublicQueryItems' test.out

#- 373 PublicGetItemBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetItemBySku \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'f0Dg6cjC' \
    --region 'IZBISIii' \
    --storeId 'CmmdZ8Bt' \
    --sku 'w7JXvNWk' \
    > test.out 2>&1
eval_tap $? 373 'PublicGetItemBySku' test.out

#- 374 PublicGetEstimatedPrice
./ng net.accelbyte.sdk.cli.Main platform publicGetEstimatedPrice \
    --namespace "$AB_NAMESPACE" \
    --region 'OmUFSDxs' \
    --storeId 'Lax9Wu70' \
    --itemIds '8Qbyhltf' \
    > test.out 2>&1
eval_tap $? 374 'PublicGetEstimatedPrice' test.out

#- 375 PublicBulkGetItems
./ng net.accelbyte.sdk.cli.Main platform publicBulkGetItems \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'rCJ2njTK' \
    --region 'ucRte9Wo' \
    --storeId '4Mf6vWuG' \
    --itemIds 'DM5ByaR2' \
    > test.out 2>&1
eval_tap $? 375 'PublicBulkGetItems' test.out

#- 376 PublicValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform publicValidateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --body '{"itemIds": ["Yjr03SrT", "IYdLJE67", "hiYTGX0Z"]}' \
    > test.out 2>&1
eval_tap $? 376 'PublicValidateItemPurchaseCondition' test.out

#- 377 PublicSearchItems
./ng net.accelbyte.sdk.cli.Main platform publicSearchItems \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --itemType 'BUNDLE' \
    --limit '32' \
    --offset '70' \
    --region 'mKuzYm58' \
    --storeId 'VYYpl9xC' \
    --keyword 'k98QKxAK' \
    --language 'NiJyge2B' \
    > test.out 2>&1
eval_tap $? 377 'PublicSearchItems' test.out

#- 378 PublicGetApp
./ng net.accelbyte.sdk.cli.Main platform publicGetApp \
    --itemId 'wZ4t4ujH' \
    --namespace "$AB_NAMESPACE" \
    --language 'eIWvNQpb' \
    --region 'olWjTB4B' \
    --storeId 'BnQTZf9h' \
    > test.out 2>&1
eval_tap $? 378 'PublicGetApp' test.out

#- 379 PublicGetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform publicGetItemDynamicData \
    --itemId 'OwEAS0nG' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 379 'PublicGetItemDynamicData' test.out

#- 380 PublicGetItem
./ng net.accelbyte.sdk.cli.Main platform publicGetItem \
    --itemId 'Jy95zSs9' \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'eUeiYQWE' \
    --populateBundle  \
    --region 'dvkzEEQ8' \
    --storeId 'rMo9Gw9T' \
    > test.out 2>&1
eval_tap $? 380 'PublicGetItem' test.out

#- 381 GetPaymentCustomization
eval_tap 0 381 'GetPaymentCustomization # SKIP deprecated' test.out

#- 382 PublicGetPaymentUrl
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentUrl \
    --namespace "$AB_NAMESPACE" \
    --body '{"neonPayConfig": {"cancelUrl": "NPkA9dKP", "successUrl": "BTzEYttm"}, "paymentOrderNo": "EW0fJGRT", "paymentProvider": "NEONPAY", "returnUrl": "zOI3xYTU", "ui": "OcnUNKad", "zipCode": "onyVXQbP"}' \
    > test.out 2>&1
eval_tap $? 382 'PublicGetPaymentUrl' test.out

#- 383 PublicGetPaymentMethods
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentMethods \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'JL2Tpoin' \
    > test.out 2>&1
eval_tap $? 383 'PublicGetPaymentMethods' test.out

#- 384 PublicGetUnpaidPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUnpaidPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'LtnYEgoR' \
    > test.out 2>&1
eval_tap $? 384 'PublicGetUnpaidPaymentOrder' test.out

#- 385 Pay
./ng net.accelbyte.sdk.cli.Main platform pay \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'qyC1PjAv' \
    --paymentProvider 'NEONPAY' \
    --zipCode '6ZLhm7rK' \
    --body '{"token": "NPaw9PHh"}' \
    > test.out 2>&1
eval_tap $? 385 'Pay' test.out

#- 386 PublicCheckPaymentOrderPaidStatus
./ng net.accelbyte.sdk.cli.Main platform publicCheckPaymentOrderPaidStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'f6i6VEgq' \
    > test.out 2>&1
eval_tap $? 386 'PublicCheckPaymentOrderPaidStatus' test.out

#- 387 GetPaymentPublicConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentPublicConfig \
    --namespace "$AB_NAMESPACE" \
    --sandbox  \
    --paymentProvider 'WALLET' \
    --region 'NGB3dOq7' \
    > test.out 2>&1
eval_tap $? 387 'GetPaymentPublicConfig' test.out

#- 388 PublicGetQRCode
./ng net.accelbyte.sdk.cli.Main platform publicGetQRCode \
    --namespace "$AB_NAMESPACE" \
    --code 'gemDbbrL' \
    > test.out 2>&1
eval_tap $? 388 'PublicGetQRCode' test.out

#- 389 PublicNormalizePaymentReturnUrl
./ng net.accelbyte.sdk.cli.Main platform publicNormalizePaymentReturnUrl \
    --namespace "$AB_NAMESPACE" \
    --payerID 'RlFQUcMT' \
    --foreinginvoice 'OfrULXGZ' \
    --invoiceId 'bJi2bOBj' \
    --payload 'RJCw9vAy' \
    --redirectResult 'ti15VPgN' \
    --resultCode 'PRgxxxg0' \
    --sessionId 'Ls6JPvQJ' \
    --status 'vlwHxBNG' \
    --token '0qbErsWN' \
    --type 'gyiSrRnj' \
    --userId '3ilcrx5g' \
    --orderNo 'TtnKDwU1' \
    --paymentOrderNo 'M7ibpccf' \
    --paymentProvider 'STRIPE' \
    --returnUrl 'id4c7Esw' \
    > test.out 2>&1
eval_tap $? 389 'PublicNormalizePaymentReturnUrl' test.out

#- 390 GetPaymentTaxValue
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxValue \
    --namespace "$AB_NAMESPACE" \
    --zipCode '8aHw3Fp1' \
    --paymentOrderNo 'ML8Kj9eE' \
    --paymentProvider 'STRIPE' \
    > test.out 2>&1
eval_tap $? 390 'GetPaymentTaxValue' test.out

#- 391 GetRewardByCode
./ng net.accelbyte.sdk.cli.Main platform getRewardByCode \
    --namespace "$AB_NAMESPACE" \
    --rewardCode 'P9TzCc1g' \
    > test.out 2>&1
eval_tap $? 391 'GetRewardByCode' test.out

#- 392 QueryRewards1
./ng net.accelbyte.sdk.cli.Main platform queryRewards1 \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'RdmUZy59' \
    --limit '92' \
    --offset '33' \
    --sortBy 'rewardCode,namespace:asc,rewardCode:desc' \
    > test.out 2>&1
eval_tap $? 392 'QueryRewards1' test.out

#- 393 GetReward1
./ng net.accelbyte.sdk.cli.Main platform getReward1 \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'rtkKFX1l' \
    > test.out 2>&1
eval_tap $? 393 'GetReward1' test.out

#- 394 PublicListStores
./ng net.accelbyte.sdk.cli.Main platform publicListStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 394 'PublicListStores' test.out

#- 395 PublicExistsAnyMyActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyMyActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --appIds 'ONea20UD,WSOVDqIp,VpRPsgBx' \
    --itemIds 'O2lvansi,nQQq1RGX,vQ8VthBw' \
    --skus 'wwaEqJ7p,yYTeLFjW,VbvFnSCk' \
    > test.out 2>&1
eval_tap $? 395 'PublicExistsAnyMyActiveEntitlement' test.out

#- 396 PublicGetMyAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --appId 'WYZ1U9Zx' \
    > test.out 2>&1
eval_tap $? 396 'PublicGetMyAppEntitlementOwnershipByAppId' test.out

#- 397 PublicGetMyEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'OPTIONBOX' \
    --itemId 'KmygCL1t' \
    > test.out 2>&1
eval_tap $? 397 'PublicGetMyEntitlementOwnershipByItemId' test.out

#- 398 PublicGetMyEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'APP' \
    --sku 'AI24P7bB' \
    > test.out 2>&1
eval_tap $? 398 'PublicGetMyEntitlementOwnershipBySku' test.out

#- 399 PublicGetEntitlementOwnershipToken
./ng net.accelbyte.sdk.cli.Main platform publicGetEntitlementOwnershipToken \
    --namespace "$AB_NAMESPACE" \
    --appIds 'I5ddBd2D,gBjTAJlE,xnUQWtUN' \
    --itemIds 'EGAsXN2I,nJQUxUmd,lyAcwr6k' \
    --skus 'AK7g6IFU,CU3ceLhB,qiU4MpSm' \
    > test.out 2>&1
eval_tap $? 399 'PublicGetEntitlementOwnershipToken' test.out

#- 400 SyncTwitchDropsEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement \
    --namespace "$AB_NAMESPACE" \
    --body '{"gameId": "uuAeTW2F", "language": "iv", "region": "XqXbkOpb"}' \
    > test.out 2>&1
eval_tap $? 400 'SyncTwitchDropsEntitlement' test.out

#- 401 PublicGetMyWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetMyWallet \
    --currencyCode '4W335bfa' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 401 'PublicGetMyWallet' test.out

#- 402 SyncEpicGameDLC
./ng net.accelbyte.sdk.cli.Main platform syncEpicGameDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'sQd8dXOK' \
    --body '{"epicGamesJwtToken": "FxtJOPrH"}' \
    > test.out 2>&1
eval_tap $? 402 'SyncEpicGameDLC' test.out

#- 403 SyncOculusDLC
./ng net.accelbyte.sdk.cli.Main platform syncOculusDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'KgQBpjfy' \
    > test.out 2>&1
eval_tap $? 403 'SyncOculusDLC' test.out

#- 404 PublicSyncPsnDlcInventory
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'hLd68fcD' \
    --body '{"serviceLabel": 47}' \
    > test.out 2>&1
eval_tap $? 404 'PublicSyncPsnDlcInventory' test.out

#- 405 PublicSyncPsnDlcInventoryWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventoryWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'w9h5bvb6' \
    --body '{"serviceLabels": [81, 26]}' \
    > test.out 2>&1
eval_tap $? 405 'PublicSyncPsnDlcInventoryWithMultipleServiceLabels' test.out

#- 406 SyncSteamDLC
./ng net.accelbyte.sdk.cli.Main platform syncSteamDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'AQtZkNZn' \
    --body '{"appId": "RM5qgWB7", "steamId": "1hG4B8jq"}' \
    > test.out 2>&1
eval_tap $? 406 'SyncSteamDLC' test.out

#- 407 SyncXboxDLC
./ng net.accelbyte.sdk.cli.Main platform syncXboxDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'UAcCre5M' \
    --body '{"xstsToken": "qKAfCtHl"}' \
    > test.out 2>&1
eval_tap $? 407 'SyncXboxDLC' test.out

#- 408 PublicQueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'KwauppqS' \
    --appType 'DEMO' \
    --entitlementClazz 'MEDIA' \
    --entitlementName 'TkgpnIZQ' \
    --features 'ae1pA99M,FnlOQwSy,bp7eCEDO' \
    --itemId 'KYx7xkQO,WieCCbpE,MOYYKXG0' \
    --limit '8' \
    --offset '73' \
    > test.out 2>&1
eval_tap $? 408 'PublicQueryUserEntitlements' test.out

#- 409 PublicGetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId '7UBos2Ns' \
    --appId 'QCAY4THC' \
    > test.out 2>&1
eval_tap $? 409 'PublicGetUserAppEntitlementByAppId' test.out

#- 410 PublicQueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'LgVma24l' \
    --limit '12' \
    --offset '12' \
    --appType 'SOFTWARE' \
    > test.out 2>&1
eval_tap $? 410 'PublicQueryUserEntitlementsByAppType' test.out

#- 411 PublicGetUserEntitlementsByIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementsByIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'hgoMIyFx' \
    --availablePlatformOnly  \
    --ids 'bXxfPBbG,hRNNxuQq,7PzhRUKn' \
    > test.out 2>&1
eval_tap $? 411 'PublicGetUserEntitlementsByIds' test.out

#- 412 PublicGetUserEntitlementByItemId
eval_tap 0 412 'PublicGetUserEntitlementByItemId # SKIP deprecated' test.out

#- 413 PublicGetUserEntitlementBySku
eval_tap 0 413 'PublicGetUserEntitlementBySku # SKIP deprecated' test.out

#- 414 PublicUserEntitlementHistory
./ng net.accelbyte.sdk.cli.Main platform publicUserEntitlementHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'j0PGDM6c' \
    --endDate '0y5DGFDt' \
    --entitlementClazz 'CODE' \
    --limit '14' \
    --offset '93' \
    --startDate 'jDtQgHPi' \
    > test.out 2>&1
eval_tap $? 414 'PublicUserEntitlementHistory' test.out

#- 415 PublicExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'lGytNRwi' \
    --appIds 'GLZiz5iY,BLNEJOUQ,oJhZkRdx' \
    --itemIds 'JwnYguvN,vY7zOugK,Epc4bY7W' \
    --skus 'jXUd84UE,1LzjBASK,w5NKYqPp' \
    > test.out 2>&1
eval_tap $? 415 'PublicExistsAnyUserActiveEntitlement' test.out

#- 416 PublicGetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZMEyDE1T' \
    --appId 'BjeDzEwT' \
    > test.out 2>&1
eval_tap $? 416 'PublicGetUserAppEntitlementOwnershipByAppId' test.out

#- 417 PublicGetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZmsMlLtl' \
    --entitlementClazz 'APP' \
    --itemId 'ZYxGuEnR' \
    > test.out 2>&1
eval_tap $? 417 'PublicGetUserEntitlementOwnershipByItemId' test.out

#- 418 PublicGetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'EcTBKGQG' \
    --ids '9Gcr39Q0,35EYXJKz,DIl7gBRR' \
    > test.out 2>&1
eval_tap $? 418 'PublicGetUserEntitlementOwnershipByItemIds' test.out

#- 419 PublicGetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'iwojQyjv' \
    --entitlementClazz 'APP' \
    --sku 'GW34XPk5' \
    > test.out 2>&1
eval_tap $? 419 'PublicGetUserEntitlementOwnershipBySku' test.out

#- 420 PublicGetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlement \
    --entitlementId 'NyFDxCHv' \
    --namespace "$AB_NAMESPACE" \
    --userId 'kV2ARYWj' \
    > test.out 2>&1
eval_tap $? 420 'PublicGetUserEntitlement' test.out

#- 421 PublicConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicConsumeUserEntitlement \
    --entitlementId 'StClWdCZ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'v8N7iWtw' \
    --body '{"metadata": {"operationSource": "INVENTORY"}, "options": ["GZrWsZkB", "AGdzLde6", "pp6rZw9A"], "requestId": "BbNndaKf", "useCount": 62}' \
    > test.out 2>&1
eval_tap $? 421 'PublicConsumeUserEntitlement' test.out

#- 422 PublicSellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicSellUserEntitlement \
    --entitlementId 'fccuj8EC' \
    --namespace "$AB_NAMESPACE" \
    --userId 'B3HicpOL' \
    --body '{"requestId": "Tlx17JDo", "useCount": 84}' \
    > test.out 2>&1
eval_tap $? 422 'PublicSellUserEntitlement' test.out

#- 423 PublicSplitUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicSplitUserEntitlement \
    --entitlementId '5eibx25z' \
    --namespace "$AB_NAMESPACE" \
    --userId 'qxKQdVEx' \
    --body '{"metadata": {"operationSource": "INVENTORY"}, "useCount": 78}' \
    > test.out 2>&1
eval_tap $? 423 'PublicSplitUserEntitlement' test.out

#- 424 PublicTransferUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicTransferUserEntitlement \
    --entitlementId 'SXg3tCjw' \
    --namespace "$AB_NAMESPACE" \
    --userId 'SbAPDnH0' \
    --body '{"entitlementId": "D6OSTbLC", "metadata": {"operationSource": "INVENTORY"}, "useCount": 31}' \
    > test.out 2>&1
eval_tap $? 424 'PublicTransferUserEntitlement' test.out

#- 425 PublicRedeemCode
./ng net.accelbyte.sdk.cli.Main platform publicRedeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZdwPGzsM' \
    --body '{"code": "ZX5aj7Vx", "language": "UVTO-EmCM-047", "region": "j4og7Xwn"}' \
    > test.out 2>&1
eval_tap $? 425 'PublicRedeemCode' test.out

#- 426 PublicFulfillAppleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillAppleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZaL3MUT5' \
    --body '{"excludeOldTransactions": false, "language": "dLba_917", "productId": "vMOUSzrh", "receiptData": "rrdPTOTu", "region": "iXvSBmh5", "transactionId": "AiexTm8L"}' \
    > test.out 2>&1
eval_tap $? 426 'PublicFulfillAppleIAPItem' test.out

#- 427 SyncEpicGamesInventory
./ng net.accelbyte.sdk.cli.Main platform syncEpicGamesInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'vVDVkZV8' \
    --body '{"epicGamesJwtToken": "1UWalwmD"}' \
    > test.out 2>&1
eval_tap $? 427 'SyncEpicGamesInventory' test.out

#- 428 PublicFulfillGoogleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillGoogleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'Q9FKNurg' \
    --body '{"autoAck": true, "language": "LuR", "orderId": "dznpQlHq", "packageName": "2b0R2vzP", "productId": "JClgw92P", "purchaseTime": 37, "purchaseToken": "MOLqpPnA", "region": "WaoMytTA"}' \
    > test.out 2>&1
eval_tap $? 428 'PublicFulfillGoogleIAPItem' test.out

#- 429 SyncOculusConsumableEntitlements
./ng net.accelbyte.sdk.cli.Main platform syncOculusConsumableEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'dT3wD7iQ' \
    > test.out 2>&1
eval_tap $? 429 'SyncOculusConsumableEntitlements' test.out

#- 430 PublicReconcilePlayStationStore
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStore \
    --namespace "$AB_NAMESPACE" \
    --userId 'tXSPbZFx' \
    --body '{"currencyCode": "to928mMY", "price": 0.14397475261980275, "productId": "XNvdldJY", "serviceLabel": 60}' \
    > test.out 2>&1
eval_tap $? 430 'PublicReconcilePlayStationStore' test.out

#- 431 PublicReconcilePlayStationStoreWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStoreWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'LWdvTSUZ' \
    --body '{"currencyCode": "wwh50VhO", "price": 0.6045803307740539, "productId": "c0uq6214", "serviceLabels": [0, 60, 21]}' \
    > test.out 2>&1
eval_tap $? 431 'PublicReconcilePlayStationStoreWithMultipleServiceLabels' test.out

#- 432 SyncSteamInventory
./ng net.accelbyte.sdk.cli.Main platform syncSteamInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'Rp32CWfz' \
    --body '{"appId": "LwiqPaBN", "currencyCode": "ivXuvJA8", "language": "wq-UgLg", "price": 0.8021064116043998, "productId": "4I6vPwwC", "region": "1PhvT6pD", "steamId": "VbxyAJ7Z"}' \
    > test.out 2>&1
eval_tap $? 432 'SyncSteamInventory' test.out

#- 433 SyncTwitchDropsEntitlement1
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'tjHIaZ4w' \
    --body '{"gameId": "wQLVM24N", "language": "zl-FRAM_621", "region": "nXqjqxGG"}' \
    > test.out 2>&1
eval_tap $? 433 'SyncTwitchDropsEntitlement1' test.out

#- 434 SyncXboxInventory
./ng net.accelbyte.sdk.cli.Main platform syncXboxInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'frQxzLeP' \
    --body '{"currencyCode": "k3u2DQx9", "price": 0.049951679334302446, "productId": "Zk4l0BXl", "xstsToken": "WsPTVcCj"}' \
    > test.out 2>&1
eval_tap $? 434 'SyncXboxInventory' test.out

#- 435 PublicQueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'TJqsx0nc' \
    --discounted  \
    --itemId 'ixn77wAl' \
    --limit '24' \
    --offset '1' \
    --status 'CHARGEBACK_REVERSED' \
    > test.out 2>&1
eval_tap $? 435 'PublicQueryUserOrders' test.out

#- 436 PublicCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'TDhCcasE' \
    --body '{"currencyCode": "vh92hIXH", "discountCodes": ["EwbrHaAQ", "WWvkqtHJ", "vrRAshX3"], "discountedPrice": 82, "ext": {"xufJFMeI": {}, "ykh40h3b": {}, "4AfGYewS": {}}, "itemId": "zhxhzqnW", "language": "Zf-Yl", "price": 22, "quantity": 69, "region": "lv3oHjvn", "returnUrl": "2w0SHyEH", "sectionId": "DgOkEVG0"}' \
    > test.out 2>&1
eval_tap $? 436 'PublicCreateUserOrder' test.out

#- 437 PublicPreviewOrderPrice
./ng net.accelbyte.sdk.cli.Main platform publicPreviewOrderPrice \
    --namespace "$AB_NAMESPACE" \
    --userId 'ML41We0F' \
    --body '{"currencyCode": "SXNq5dUQ", "discountCodes": ["jIvbs84O", "xRStDwEU", "Qitu7Kxc"], "discountedPrice": 47, "itemId": "wDnscBDt", "price": 55, "quantity": 33}' \
    > test.out 2>&1
eval_tap $? 437 'PublicPreviewOrderPrice' test.out

#- 438 PublicGetUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'ZqujlyNI' \
    --userId 't6dbesBE' \
    > test.out 2>&1
eval_tap $? 438 'PublicGetUserOrder' test.out

#- 439 PublicCancelUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCancelUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'OeX1aa98' \
    --userId 'jNJx0c0X' \
    > test.out 2>&1
eval_tap $? 439 'PublicCancelUserOrder' test.out

#- 440 PublicGetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'Vp7N6rOO' \
    --userId 'nt7u1ycb' \
    > test.out 2>&1
eval_tap $? 440 'PublicGetUserOrderHistories' test.out

#- 441 PublicDownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform publicDownloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'Hm6nQ1n8' \
    --userId 'zCLRpgtH' \
    > test.out 2>&1
eval_tap $? 441 'PublicDownloadUserOrderReceipt' test.out

#- 442 PublicGetPaymentAccounts
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId '5xUu7ajD' \
    > test.out 2>&1
eval_tap $? 442 'PublicGetPaymentAccounts' test.out

#- 443 PublicDeletePaymentAccount
./ng net.accelbyte.sdk.cli.Main platform publicDeletePaymentAccount \
    --id 'vgxK1TEE' \
    --namespace "$AB_NAMESPACE" \
    --type 'card' \
    --userId 'SAGhtbiI' \
    > test.out 2>&1
eval_tap $? 443 'PublicDeletePaymentAccount' test.out

#- 444 PublicListActiveSections
./ng net.accelbyte.sdk.cli.Main platform publicListActiveSections \
    --namespace "$AB_NAMESPACE" \
    --userId 'YT65DAqu' \
    --autoCalcEstimatedPrice  \
    --language 'r7L7Uj0z' \
    --region 'NBpxXM2A' \
    --storeId '9s6B1DKj' \
    --viewId 'a9kYEnCB' \
    > test.out 2>&1
eval_tap $? 444 'PublicListActiveSections' test.out

#- 445 PublicQueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'vnLnnSeM' \
    --chargeStatus 'SETUP' \
    --itemId '5sgA9lJe' \
    --limit '99' \
    --offset '74' \
    --sku 'IaK3Fhou' \
    --status 'ACTIVE' \
    --subscribedBy 'PLATFORM' \
    > test.out 2>&1
eval_tap $? 445 'PublicQueryUserSubscriptions' test.out

#- 446 PublicSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform publicSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'mXAFjVTP' \
    --body '{"currencyCode": "fPlPZMwM", "itemId": "sQ0tY3w4", "language": "fk-962", "region": "mwzvtHqq", "returnUrl": "3OiPCTDb", "source": "KrD7BIAL"}' \
    > test.out 2>&1
eval_tap $? 446 'PublicSubscribeSubscription' test.out

#- 447 PublicCheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform publicCheckUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId '7bHbxe6H' \
    --itemId 'xyxEIqIH' \
    > test.out 2>&1
eval_tap $? 447 'PublicCheckUserSubscriptionSubscribableByItemId' test.out

#- 448 PublicGetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '448k2rMy' \
    --userId 'vkdMJOg7' \
    > test.out 2>&1
eval_tap $? 448 'PublicGetUserSubscription' test.out

#- 449 PublicChangeSubscriptionBillingAccount
./ng net.accelbyte.sdk.cli.Main platform publicChangeSubscriptionBillingAccount \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'CvImdUnS' \
    --userId 'ZGxljnce' \
    > test.out 2>&1
eval_tap $? 449 'PublicChangeSubscriptionBillingAccount' test.out

#- 450 PublicCancelSubscription
./ng net.accelbyte.sdk.cli.Main platform publicCancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '41GjrM0J' \
    --userId 'iFxh7rqF' \
    --body '{"immediate": false, "reason": "htas729r"}' \
    > test.out 2>&1
eval_tap $? 450 'PublicCancelSubscription' test.out

#- 451 PublicGetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'PzfkPaIc' \
    --userId 'ObZ3U3M2' \
    --excludeFree  \
    --limit '80' \
    --offset '3' \
    > test.out 2>&1
eval_tap $? 451 'PublicGetUserSubscriptionBillingHistories' test.out

#- 452 PublicListViews
./ng net.accelbyte.sdk.cli.Main platform publicListViews \
    --namespace "$AB_NAMESPACE" \
    --userId 'UlY7hVLG' \
    --language '4pEko2kQ' \
    --storeId '4k3FUipp' \
    > test.out 2>&1
eval_tap $? 452 'PublicListViews' test.out

#- 453 PublicGetWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetWallet \
    --currencyCode 'nBhMfxv8' \
    --namespace "$AB_NAMESPACE" \
    --userId 'aJg9GZWz' \
    > test.out 2>&1
eval_tap $? 453 'PublicGetWallet' test.out

#- 454 PublicListUserWalletTransactions
./ng net.accelbyte.sdk.cli.Main platform publicListUserWalletTransactions \
    --currencyCode 'l5GfWdCW' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Hb2DglDS' \
    --limit '16' \
    --offset '26' \
    > test.out 2>&1
eval_tap $? 454 'PublicListUserWalletTransactions' test.out

#- 455 PublicGetMyDLCContent
./ng net.accelbyte.sdk.cli.Main platform publicGetMyDLCContent \
    --includeAllNamespaces  \
    --type 'STEAM' \
    > test.out 2>&1
eval_tap $? 455 'PublicGetMyDLCContent' test.out

#- 456 QueryFulfillments
./ng net.accelbyte.sdk.cli.Main platform queryFulfillments \
    --namespace "$AB_NAMESPACE" \
    --endTime 'kM538WZ3' \
    --limit '97' \
    --offset '75' \
    --startTime 'O7q8usTs' \
    --state 'FULFILLED' \
    --transactionId 'fxwAKQNJ' \
    --userId 'ZNTTwtH9' \
    > test.out 2>&1
eval_tap $? 456 'QueryFulfillments' test.out

#- 457 QueryItemsV2
./ng net.accelbyte.sdk.cli.Main platform queryItemsV2 \
    --namespace "$AB_NAMESPACE" \
    --appType 'DEMO' \
    --availableDate 'oGYihTWD' \
    --baseAppId 'kfwhs53o' \
    --categoryPath 'eoXcNpWm' \
    --features 'ksmkouRC' \
    --includeSubCategoryItem  \
    --itemName 'XJZecfZy' \
    --itemStatus 'INACTIVE' \
    --itemType 'MEDIA,COINS,INGAMEITEM' \
    --limit '82' \
    --offset '58' \
    --region 'niFqv8YE' \
    --sectionExclusive  \
    --sortBy 'name:desc,updatedAt:asc,displayOrder' \
    --storeId 'ka3yW9Bv' \
    --tags 'RnA9fG6m' \
    --targetNamespace '1cHTo6RH' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 457 'QueryItemsV2' test.out

#- 458 ImportStore1
./ng net.accelbyte.sdk.cli.Main platform importStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'HxtDFUr2' \
    --strictMode  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 458 'ImportStore1' test.out

#- 459 ExportStore1
./ng net.accelbyte.sdk.cli.Main platform exportStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId '7qO3OV2J' \
    --body '{"itemIds": ["J3G1dqGq", "HjANQGRs", "DWdrzB4G"]}' \
    > test.out 2>&1
eval_tap $? 459 'ExportStore1' test.out

#- 460 FulfillRewardsV2
./ng net.accelbyte.sdk.cli.Main platform fulfillRewardsV2 \
    --namespace "$AB_NAMESPACE" \
    --userId '2bllK2du' \
    --body '{"entitlementCollectionId": "QfwTpoEW", "entitlementOrigin": "Other", "metadata": {"yk6j40XA": {}, "FknP9zgV": {}, "286Fvj9U": {}}, "origin": "Playstation", "rewards": [{"currency": {"currencyCode": "ouQV18M3", "namespace": "N6ZYddVF"}, "item": {"itemId": "uFF8iOOb", "itemName": "0CzOJ9iK", "itemSku": "QHKsnsyD", "itemType": "ImqekPxJ"}, "quantity": 61, "type": "CURRENCY"}, {"currency": {"currencyCode": "3ktDetYE", "namespace": "mCOB7etY"}, "item": {"itemId": "ZaRmA7Kt", "itemName": "Ddk8LfJF", "itemSku": "A1g0CAWe", "itemType": "68X9q52O"}, "quantity": 83, "type": "CURRENCY"}, {"currency": {"currencyCode": "zXzg8UgL", "namespace": "oMmacKOc"}, "item": {"itemId": "zm02bFRk", "itemName": "BpkSRDTh", "itemSku": "2WsAkU5A", "itemType": "nCWqJKMx"}, "quantity": 27, "type": "ITEM"}], "source": "REDEEM_CODE", "transactionId": "Xz3s6eQG"}' \
    > test.out 2>&1
eval_tap $? 460 'FulfillRewardsV2' test.out

#- 461 FulfillItems
./ng net.accelbyte.sdk.cli.Main platform fulfillItems \
    --namespace "$AB_NAMESPACE" \
    --transactionId 'vmVvgPhs' \
    --userId 'IHB5p8WU' \
    --body '{"items": [{"duration": 89, "endDate": "1975-01-22T00:00:00Z", "entitlementCollectionId": "4iV12vfe", "entitlementOrigin": "Epic", "itemId": "QJlR8hJI", "itemSku": "K79AFnLu", "language": "siq6yYtS", "metadata": {"cLy5gRu4": {}, "X9Q7A8S3": {}, "XcbfujrU": {}}, "orderNo": "b97EhmYF", "origin": "Epic", "quantity": 55, "region": "pICs7N1F", "source": "REWARD", "startDate": "1975-02-27T00:00:00Z", "storeId": "pVJAY8Bm"}, {"duration": 63, "endDate": "1985-09-20T00:00:00Z", "entitlementCollectionId": "GpniHir0", "entitlementOrigin": "Other", "itemId": "iY4QKcZi", "itemSku": "Zmeusbsv", "language": "lsgM24Ic", "metadata": {"4HJVOBzA": {}, "Rs9oSATs": {}, "8i1M51pv": {}}, "orderNo": "6cSdhk8Y", "origin": "Epic", "quantity": 82, "region": "6A6DzOzi", "source": "REDEEM_CODE", "startDate": "1979-10-29T00:00:00Z", "storeId": "Q0c41LFx"}, {"duration": 30, "endDate": "1978-01-20T00:00:00Z", "entitlementCollectionId": "NgZflm8N", "entitlementOrigin": "Steam", "itemId": "dY5iaud5", "itemSku": "CfsFGV3H", "language": "t6YjBuli", "metadata": {"EDxbHRYH": {}, "6r2nUCGQ": {}, "feel8bnw": {}}, "orderNo": "JI4l8iiJ", "origin": "Nintendo", "quantity": 92, "region": "OzeTZFUP", "source": "REDEEM_CODE", "startDate": "1992-05-07T00:00:00Z", "storeId": "gUXKtEfY"}]}' \
    > test.out 2>&1
eval_tap $? 461 'FulfillItems' test.out

#- 462 RevokeItems
./ng net.accelbyte.sdk.cli.Main platform revokeItems \
    --namespace "$AB_NAMESPACE" \
    --transactionId 'QPgxXTpj' \
    --userId 'Jy6pYVo0' \
    > test.out 2>&1
eval_tap $? 462 'RevokeItems' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
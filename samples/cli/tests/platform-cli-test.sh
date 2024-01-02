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
echo "1..436"

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
    --id 'VVU85DSq' \
    > test.out 2>&1
eval_tap $? 3 'GetFulfillmentScript' test.out

#- 4 CreateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform createFulfillmentScript \
    --id 'P51JlIJI' \
    --body '{"grantDays": "ZU8lQEoE"}' \
    > test.out 2>&1
eval_tap $? 4 'CreateFulfillmentScript' test.out

#- 5 DeleteFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform deleteFulfillmentScript \
    --id 'gIaqFHMG' \
    > test.out 2>&1
eval_tap $? 5 'DeleteFulfillmentScript' test.out

#- 6 UpdateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform updateFulfillmentScript \
    --id '7JkheHtZ' \
    --body '{"grantDays": "nHswyWzX"}' \
    > test.out 2>&1
eval_tap $? 6 'UpdateFulfillmentScript' test.out

#- 7 ListItemTypeConfigs
./ng net.accelbyte.sdk.cli.Main platform listItemTypeConfigs \
    > test.out 2>&1
eval_tap $? 7 'ListItemTypeConfigs' test.out

#- 8 CreateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform createItemTypeConfig \
    --body '{"clazz": "6jlMDbmQ", "dryRun": true, "fulfillmentUrl": "7XPIhUQp", "itemType": "LOOTBOX", "purchaseConditionUrl": "H7P22HU7"}' \
    > test.out 2>&1
eval_tap $? 8 'CreateItemTypeConfig' test.out

#- 9 SearchItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform searchItemTypeConfig \
    --clazz 'CC58DEIg' \
    --itemType 'MEDIA' \
    > test.out 2>&1
eval_tap $? 9 'SearchItemTypeConfig' test.out

#- 10 GetItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform getItemTypeConfig \
    --id 'qYxYHLDL' \
    > test.out 2>&1
eval_tap $? 10 'GetItemTypeConfig' test.out

#- 11 UpdateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform updateItemTypeConfig \
    --id 'aGoeta5V' \
    --body '{"clazz": "mNg3EsMv", "dryRun": true, "fulfillmentUrl": "ZYPT1nwu", "purchaseConditionUrl": "y2oao8Vp"}' \
    > test.out 2>&1
eval_tap $? 11 'UpdateItemTypeConfig' test.out

#- 12 DeleteItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform deleteItemTypeConfig \
    --id 'pN9Aij14' \
    > test.out 2>&1
eval_tap $? 12 'DeleteItemTypeConfig' test.out

#- 13 QueryCampaigns
./ng net.accelbyte.sdk.cli.Main platform queryCampaigns \
    --namespace "$AB_NAMESPACE" \
    --limit '75' \
    --name 'PaFZY9Fe' \
    --offset '64' \
    --tag 'BZKPDz23' \
    > test.out 2>&1
eval_tap $? 13 'QueryCampaigns' test.out

#- 14 CreateCampaign
./ng net.accelbyte.sdk.cli.Main platform createCampaign \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "ux0xwMAP", "items": [{"extraSubscriptionDays": 52, "itemId": "z74fWW1E", "itemName": "9oDh6iN4", "quantity": 24}, {"extraSubscriptionDays": 85, "itemId": "ohVEONvi", "itemName": "fxJ2L9aA", "quantity": 63}, {"extraSubscriptionDays": 80, "itemId": "XRNBW3Rc", "itemName": "TrY4oCTk", "quantity": 91}], "maxRedeemCountPerCampaignPerUser": 14, "maxRedeemCountPerCode": 98, "maxRedeemCountPerCodePerUser": 13, "maxSaleCount": 19, "name": "Wek0Z9gw", "redeemEnd": "1992-08-14T00:00:00Z", "redeemStart": "1971-09-24T00:00:00Z", "redeemType": "ITEM", "status": "INACTIVE", "tags": ["R0rZjvMm", "wjL9RwjI", "uUBPOQBb"], "type": "REDEMPTION"}' \
    > test.out 2>&1
eval_tap $? 14 'CreateCampaign' test.out

#- 15 GetCampaign
./ng net.accelbyte.sdk.cli.Main platform getCampaign \
    --campaignId 'J9OkZ1fd' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'GetCampaign' test.out

#- 16 UpdateCampaign
./ng net.accelbyte.sdk.cli.Main platform updateCampaign \
    --campaignId 'k6vKHm3G' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "s5wm69Qx", "items": [{"extraSubscriptionDays": 65, "itemId": "vHt9PMzb", "itemName": "m7Ueic3M", "quantity": 73}, {"extraSubscriptionDays": 97, "itemId": "lCAb1a1v", "itemName": "OQF2RqGI", "quantity": 12}, {"extraSubscriptionDays": 61, "itemId": "zZVDRQbS", "itemName": "YDrqLQzN", "quantity": 1}], "maxRedeemCountPerCampaignPerUser": 30, "maxRedeemCountPerCode": 79, "maxRedeemCountPerCodePerUser": 83, "maxSaleCount": 95, "name": "bEX1qPov", "redeemEnd": "1995-05-02T00:00:00Z", "redeemStart": "1988-06-10T00:00:00Z", "redeemType": "ITEM", "status": "INACTIVE", "tags": ["SXR1Zahg", "rO9xTJYR", "R2mP7tny"]}' \
    > test.out 2>&1
eval_tap $? 16 'UpdateCampaign' test.out

#- 17 GetCampaignDynamic
./ng net.accelbyte.sdk.cli.Main platform getCampaignDynamic \
    --campaignId 'r6Cvnsm5' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'GetCampaignDynamic' test.out

#- 18 GetLootBoxPluginConfig
./ng net.accelbyte.sdk.cli.Main platform getLootBoxPluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'GetLootBoxPluginConfig' test.out

#- 19 UpdateLootBoxPluginConfig
./ng net.accelbyte.sdk.cli.Main platform updateLootBoxPluginConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appConfig": {"appName": "vvWXws8v"}, "customConfig": {"connectionType": "INSECURE", "grpcServerAddress": "eSReiVM7"}, "extendType": "CUSTOM"}' \
    > test.out 2>&1
eval_tap $? 19 'UpdateLootBoxPluginConfig' test.out

#- 20 DeleteLootBoxPluginConfig
./ng net.accelbyte.sdk.cli.Main platform deleteLootBoxPluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'DeleteLootBoxPluginConfig' test.out

#- 21 UplodLootBoxPluginConfigCert
./ng net.accelbyte.sdk.cli.Main platform uplodLootBoxPluginConfigCert \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 21 'UplodLootBoxPluginConfigCert' test.out

#- 22 GetLootBoxGrpcInfo
./ng net.accelbyte.sdk.cli.Main platform getLootBoxGrpcInfo \
    --namespace "$AB_NAMESPACE" \
    --force  \
    > test.out 2>&1
eval_tap $? 22 'GetLootBoxGrpcInfo' test.out

#- 23 GetSectionPluginConfig
./ng net.accelbyte.sdk.cli.Main platform getSectionPluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'GetSectionPluginConfig' test.out

#- 24 UpdateSectionPluginConfig
./ng net.accelbyte.sdk.cli.Main platform updateSectionPluginConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appConfig": {"appName": "L2XzK25u"}, "customConfig": {"connectionType": "INSECURE", "grpcServerAddress": "O1a0r9bw"}, "extendType": "CUSTOM"}' \
    > test.out 2>&1
eval_tap $? 24 'UpdateSectionPluginConfig' test.out

#- 25 DeleteSectionPluginConfig
./ng net.accelbyte.sdk.cli.Main platform deleteSectionPluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 25 'DeleteSectionPluginConfig' test.out

#- 26 UploadSectionPluginConfigCert
./ng net.accelbyte.sdk.cli.Main platform uploadSectionPluginConfigCert \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 26 'UploadSectionPluginConfigCert' test.out

#- 27 GetRootCategories
./ng net.accelbyte.sdk.cli.Main platform getRootCategories \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Y2bKJqoo' \
    > test.out 2>&1
eval_tap $? 27 'GetRootCategories' test.out

#- 28 CreateCategory
./ng net.accelbyte.sdk.cli.Main platform createCategory \
    --namespace "$AB_NAMESPACE" \
    --storeId 'rV9QpbBZ' \
    --body '{"categoryPath": "eW1GlHbz", "localizationDisplayNames": {"bwPPB7Js": "t34v30Bg", "8HYB5GXe": "wE9lUuZD", "2T3o7o3l": "4KwSObKe"}}' \
    > test.out 2>&1
eval_tap $? 28 'CreateCategory' test.out

#- 29 ListCategoriesBasic
./ng net.accelbyte.sdk.cli.Main platform listCategoriesBasic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'XXXNj4O8' \
    > test.out 2>&1
eval_tap $? 29 'ListCategoriesBasic' test.out

#- 30 GetCategory
./ng net.accelbyte.sdk.cli.Main platform getCategory \
    --categoryPath 'lU8lqPGo' \
    --namespace "$AB_NAMESPACE" \
    --storeId '42NhRooI' \
    > test.out 2>&1
eval_tap $? 30 'GetCategory' test.out

#- 31 UpdateCategory
./ng net.accelbyte.sdk.cli.Main platform updateCategory \
    --categoryPath 'mN5y7fCS' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'C2RCUT78' \
    --body '{"localizationDisplayNames": {"Oy9Vj2uc": "XObIhfQ9", "Na19cEH7": "POYLoD6V", "ek2Pmlus": "F7c0EXwr"}}' \
    > test.out 2>&1
eval_tap $? 31 'UpdateCategory' test.out

#- 32 DeleteCategory
./ng net.accelbyte.sdk.cli.Main platform deleteCategory \
    --categoryPath 'n4Jmx3MZ' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'eenAIyx7' \
    > test.out 2>&1
eval_tap $? 32 'DeleteCategory' test.out

#- 33 GetChildCategories
./ng net.accelbyte.sdk.cli.Main platform getChildCategories \
    --categoryPath 'YGZZMwtF' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Kn0pBxoe' \
    > test.out 2>&1
eval_tap $? 33 'GetChildCategories' test.out

#- 34 GetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform getDescendantCategories \
    --categoryPath 'bv7AYV6O' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Tb5946G6' \
    > test.out 2>&1
eval_tap $? 34 'GetDescendantCategories' test.out

#- 35 QueryCodes
./ng net.accelbyte.sdk.cli.Main platform queryCodes \
    --campaignId '635F0yyW' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --batchNo '26' \
    --code 'XhPxgiFn' \
    --limit '9' \
    --offset '92' \
    > test.out 2>&1
eval_tap $? 35 'QueryCodes' test.out

#- 36 CreateCodes
./ng net.accelbyte.sdk.cli.Main platform createCodes \
    --campaignId 'wKAdjzoV' \
    --namespace "$AB_NAMESPACE" \
    --body '{"quantity": 97}' \
    > test.out 2>&1
eval_tap $? 36 'CreateCodes' test.out

#- 37 Download
./ng net.accelbyte.sdk.cli.Main platform download \
    --campaignId 'BOrsWXQz' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '80' \
    > test.out 2>&1
eval_tap $? 37 'Download' test.out

#- 38 BulkDisableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkDisableCodes \
    --campaignId '2lvxKrGS' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '13' \
    > test.out 2>&1
eval_tap $? 38 'BulkDisableCodes' test.out

#- 39 BulkEnableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkEnableCodes \
    --campaignId '9IUe9Ygr' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '23' \
    > test.out 2>&1
eval_tap $? 39 'BulkEnableCodes' test.out

#- 40 QueryRedeemHistory
./ng net.accelbyte.sdk.cli.Main platform queryRedeemHistory \
    --campaignId 'no03n0HQ' \
    --namespace "$AB_NAMESPACE" \
    --code 'MJthdzGy' \
    --limit '29' \
    --offset '44' \
    --userId '5zcHAzWE' \
    > test.out 2>&1
eval_tap $? 40 'QueryRedeemHistory' test.out

#- 41 GetCode
./ng net.accelbyte.sdk.cli.Main platform getCode \
    --code 'gd4X8D7i' \
    --namespace "$AB_NAMESPACE" \
    --redeemable  \
    > test.out 2>&1
eval_tap $? 41 'GetCode' test.out

#- 42 DisableCode
./ng net.accelbyte.sdk.cli.Main platform disableCode \
    --code 'jomMRugC' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 42 'DisableCode' test.out

#- 43 EnableCode
./ng net.accelbyte.sdk.cli.Main platform enableCode \
    --code 'QUpydwRC' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 43 'EnableCode' test.out

#- 44 GetServicePluginConfig
eval_tap 0 44 'GetServicePluginConfig # SKIP deprecated' test.out

#- 45 UpdateServicePluginConfig
eval_tap 0 45 'UpdateServicePluginConfig # SKIP deprecated' test.out

#- 46 DeleteServicePluginConfig
eval_tap 0 46 'DeleteServicePluginConfig # SKIP deprecated' test.out

#- 47 ListCurrencies
./ng net.accelbyte.sdk.cli.Main platform listCurrencies \
    --namespace "$AB_NAMESPACE" \
    --currencyType 'VIRTUAL' \
    > test.out 2>&1
eval_tap $? 47 'ListCurrencies' test.out

#- 48 CreateCurrency
./ng net.accelbyte.sdk.cli.Main platform createCurrency \
    --namespace "$AB_NAMESPACE" \
    --body '{"currencyCode": "NGISlFzA", "currencySymbol": "nXZfBYWf", "currencyType": "REAL", "decimals": 22, "localizationDescriptions": {"HD0kfhtv": "2WAa2Umx", "cDik7LY9": "9LEzUzru", "6NW4BBxp": "Smll4kXU"}}' \
    > test.out 2>&1
eval_tap $? 48 'CreateCurrency' test.out

#- 49 UpdateCurrency
./ng net.accelbyte.sdk.cli.Main platform updateCurrency \
    --currencyCode '3OgoBh5f' \
    --namespace "$AB_NAMESPACE" \
    --body '{"localizationDescriptions": {"9qNhpor2": "YtFEmtfe", "gafIGOym": "N97b4qkM", "7znrdqw1": "HtWzle4n"}}' \
    > test.out 2>&1
eval_tap $? 49 'UpdateCurrency' test.out

#- 50 DeleteCurrency
./ng net.accelbyte.sdk.cli.Main platform deleteCurrency \
    --currencyCode 'eDitblzl' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 50 'DeleteCurrency' test.out

#- 51 GetCurrencyConfig
./ng net.accelbyte.sdk.cli.Main platform getCurrencyConfig \
    --currencyCode 'owH4k4fz' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 51 'GetCurrencyConfig' test.out

#- 52 GetCurrencySummary
./ng net.accelbyte.sdk.cli.Main platform getCurrencySummary \
    --currencyCode '0JGmPyuA' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 52 'GetCurrencySummary' test.out

#- 53 GetDLCItemConfig
./ng net.accelbyte.sdk.cli.Main platform getDLCItemConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 53 'GetDLCItemConfig' test.out

#- 54 UpdateDLCItemConfig
./ng net.accelbyte.sdk.cli.Main platform updateDLCItemConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"id": "KSOYGEKH", "rewards": [{"currency": {"currencyCode": "6y9u37qZ", "namespace": "0cZWn0Nq"}, "item": {"itemId": "kzxxSPmm", "itemSku": "7WsBiTki", "itemType": "KOdDRLhE"}, "quantity": 87, "type": "ITEM"}, {"currency": {"currencyCode": "Gg0w6QaW", "namespace": "yHMdayIT"}, "item": {"itemId": "2q3XczHz", "itemSku": "PM7LhXq8", "itemType": "n1LYBZxi"}, "quantity": 0, "type": "ITEM"}, {"currency": {"currencyCode": "czzl1mg7", "namespace": "B11X0b6U"}, "item": {"itemId": "mOYGfGUH", "itemSku": "d9E4wPOn", "itemType": "Gm0HUZhM"}, "quantity": 17, "type": "CURRENCY"}]}, {"id": "rLH5QRGw", "rewards": [{"currency": {"currencyCode": "CRwLYltm", "namespace": "1DeLvuwv"}, "item": {"itemId": "uTvvOHWE", "itemSku": "57KW4da6", "itemType": "yC2qFhY3"}, "quantity": 6, "type": "CURRENCY"}, {"currency": {"currencyCode": "SdBPvWYI", "namespace": "q2QFLnUh"}, "item": {"itemId": "1r2pGlMB", "itemSku": "CCaoo7Bm", "itemType": "VY350D4R"}, "quantity": 68, "type": "ITEM"}, {"currency": {"currencyCode": "TXACGUcD", "namespace": "mBw50EPL"}, "item": {"itemId": "9hSwFQbd", "itemSku": "UG8yV7TS", "itemType": "KruvMp2R"}, "quantity": 9, "type": "ITEM"}]}, {"id": "YqXJjIqm", "rewards": [{"currency": {"currencyCode": "9oUXN9zW", "namespace": "h8k0KgRM"}, "item": {"itemId": "s7sgcvZ2", "itemSku": "MNeeiYpG", "itemType": "hlf5Ujir"}, "quantity": 14, "type": "ITEM"}, {"currency": {"currencyCode": "OI0NdQPA", "namespace": "AbdSF71q"}, "item": {"itemId": "58XnJfy1", "itemSku": "afICN5IT", "itemType": "0I1h9Nek"}, "quantity": 67, "type": "CURRENCY"}, {"currency": {"currencyCode": "eWWT4jYa", "namespace": "fDXgjMTp"}, "item": {"itemId": "Gqayv4P9", "itemSku": "FqZz74cD", "itemType": "2ORdskVQ"}, "quantity": 98, "type": "ITEM"}]}]}' \
    > test.out 2>&1
eval_tap $? 54 'UpdateDLCItemConfig' test.out

#- 55 DeleteDLCItemConfig
./ng net.accelbyte.sdk.cli.Main platform deleteDLCItemConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 55 'DeleteDLCItemConfig' test.out

#- 56 GetPlatformDLCConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformDLCConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 56 'GetPlatformDLCConfig' test.out

#- 57 UpdatePlatformDLCConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformDLCConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"platform": "EPICGAMES", "platformDlcIdMap": {"KEzxsB2h": "QTsNBW5K", "FKevbX3O": "EfMubQhM", "SgaYAbYT": "u6R9JxUh"}}, {"platform": "STEAM", "platformDlcIdMap": {"C8pIpC9C": "7rz1ccWg", "pHWGKHwO": "4vGWWtI3", "4v0kZp0Y": "mYo53HpJ"}}, {"platform": "STEAM", "platformDlcIdMap": {"9QSTOeyw": "HnbspZoe", "GPmibGPu": "dNSzeNHl", "wRlD3i4O": "YeMF6lhD"}}]}' \
    > test.out 2>&1
eval_tap $? 57 'UpdatePlatformDLCConfig' test.out

#- 58 DeletePlatformDLCConfig
./ng net.accelbyte.sdk.cli.Main platform deletePlatformDLCConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 58 'DeletePlatformDLCConfig' test.out

#- 59 QueryEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryEntitlements \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --appType 'DEMO' \
    --entitlementClazz 'MEDIA' \
    --entitlementName 'oKVmtPrN' \
    --itemId '7ZOVn6EP,O0RyKQse,VqktGoF1' \
    --limit '0' \
    --offset '23' \
    --origin 'Epic' \
    --userId 'bjkKUEtw' \
    > test.out 2>&1
eval_tap $? 59 'QueryEntitlements' test.out

#- 60 QueryEntitlements1
./ng net.accelbyte.sdk.cli.Main platform queryEntitlements1 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemIds 'J0LBdv7e,eqq2tytZ,8c1oYnj6' \
    --limit '90' \
    --offset '39' \
    > test.out 2>&1
eval_tap $? 60 'QueryEntitlements1' test.out

#- 61 EnableEntitlementOriginFeature
./ng net.accelbyte.sdk.cli.Main platform enableEntitlementOriginFeature \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 61 'EnableEntitlementOriginFeature' test.out

#- 62 GetEntitlementConfigInfo
./ng net.accelbyte.sdk.cli.Main platform getEntitlementConfigInfo \
    --namespace "$AB_NAMESPACE" \
    --withoutCache  \
    > test.out 2>&1
eval_tap $? 62 'GetEntitlementConfigInfo' test.out

#- 63 GrantEntitlements
./ng net.accelbyte.sdk.cli.Main platform grantEntitlements \
    --namespace "$AB_NAMESPACE" \
    --body '{"entitlementGrantList": [{"endDate": "1982-12-05T00:00:00Z", "grantedCode": "HEK57l61", "itemId": "DUAOkf5z", "itemNamespace": "qlXkHb7n", "language": "wXe-256", "origin": "GooglePlay", "quantity": 44, "region": "dBejiGlv", "source": "REFERRAL_BONUS", "startDate": "1971-04-10T00:00:00Z", "storeId": "4x6007bG"}, {"endDate": "1999-12-07T00:00:00Z", "grantedCode": "UFVFbvrr", "itemId": "EqipVa9i", "itemNamespace": "zPyv6xmB", "language": "vR-pYLG_778", "origin": "Epic", "quantity": 73, "region": "aXLTrG4v", "source": "GIFT", "startDate": "1995-02-08T00:00:00Z", "storeId": "hTOgkdBE"}, {"endDate": "1974-11-08T00:00:00Z", "grantedCode": "Eso5c8uo", "itemId": "tdVlNQUS", "itemNamespace": "EuQq7tki", "language": "ODW_281", "origin": "Epic", "quantity": 30, "region": "2HVglDjG", "source": "ACHIEVEMENT", "startDate": "1990-09-23T00:00:00Z", "storeId": "KMWSNzHf"}], "userIds": ["srIeIY6F", "lI3CYVvC", "EUPUlSUh"]}' \
    > test.out 2>&1
eval_tap $? 63 'GrantEntitlements' test.out

#- 64 RevokeEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeEntitlements \
    --namespace "$AB_NAMESPACE" \
    --body '["ylRVzPC3", "lNDOfQAY", "yficyVw4"]' \
    > test.out 2>&1
eval_tap $? 64 'RevokeEntitlements' test.out

#- 65 GetEntitlement
./ng net.accelbyte.sdk.cli.Main platform getEntitlement \
    --entitlementId 'Qx4fUBKX' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 65 'GetEntitlement' test.out

#- 66 QueryFulfillmentHistories
./ng net.accelbyte.sdk.cli.Main platform queryFulfillmentHistories \
    --namespace "$AB_NAMESPACE" \
    --limit '41' \
    --offset '98' \
    --status 'SUCCESS' \
    --userId 'wGk1VBQR' \
    > test.out 2>&1
eval_tap $? 66 'QueryFulfillmentHistories' test.out

#- 67 QueryIAPClawbackHistory
./ng net.accelbyte.sdk.cli.Main platform queryIAPClawbackHistory \
    --namespace "$AB_NAMESPACE" \
    --endTime 'oYfcrKZG' \
    --eventType 'CHARGEBACK' \
    --externalOrderId 'YWJ1NSOu' \
    --limit '34' \
    --offset '22' \
    --startTime 'CpXk3ra6' \
    --status 'SUCCESS' \
    --userId 'FywXJztK' \
    > test.out 2>&1
eval_tap $? 67 'QueryIAPClawbackHistory' test.out

#- 68 MockPlayStationStreamEvent
./ng net.accelbyte.sdk.cli.Main platform mockPlayStationStreamEvent \
    --namespace "$AB_NAMESPACE" \
    --body '{"body": {"account": "XgSwtSZK", "additionalData": {"entitlement": [{"clientTransaction": [{"amountConsumed": 65, "clientTransactionId": "2VQ8TkEa"}, {"amountConsumed": 72, "clientTransactionId": "OOKkZicq"}, {"amountConsumed": 90, "clientTransactionId": "3yZqv7ft"}], "entitlementId": "mYAA6cFJ", "usageCount": 46}, {"clientTransaction": [{"amountConsumed": 77, "clientTransactionId": "0fCbjMfU"}, {"amountConsumed": 66, "clientTransactionId": "wfpg7GiL"}, {"amountConsumed": 6, "clientTransactionId": "voK7zMvl"}], "entitlementId": "WJsu6b28", "usageCount": 36}, {"clientTransaction": [{"amountConsumed": 71, "clientTransactionId": "PmsnyqEq"}, {"amountConsumed": 36, "clientTransactionId": "Z9Cy3KfQ"}, {"amountConsumed": 19, "clientTransactionId": "qlUs0qYZ"}], "entitlementId": "Ej2lbm1S", "usageCount": 54}], "purpose": "PfwaOLaM"}, "originalTitleName": "xrSt5qRc", "paymentProductSKU": "anCpdnzt", "purchaseDate": "n62xUw3g", "sourceOrderItemId": "L6rx9NZm", "titleName": "ohpu3WZH"}, "eventDomain": "8s6bL8FW", "eventSource": "O8vtaC2r", "eventType": "hhfMIr8z", "eventVersion": 89, "id": "ssbyy656", "timestamp": "x0RmY4vu"}' \
    > test.out 2>&1
eval_tap $? 68 'MockPlayStationStreamEvent' test.out

#- 69 GetAppleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getAppleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 69 'GetAppleIAPConfig' test.out

#- 70 UpdateAppleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateAppleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"bundleId": "5w3gjSOR", "password": "JZjt8L3t"}' \
    > test.out 2>&1
eval_tap $? 70 'UpdateAppleIAPConfig' test.out

#- 71 DeleteAppleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteAppleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 71 'DeleteAppleIAPConfig' test.out

#- 72 GetEpicGamesIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getEpicGamesIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 72 'GetEpicGamesIAPConfig' test.out

#- 73 UpdateEpicGamesIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateEpicGamesIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"sandboxId": "d2XtzcpM"}' \
    > test.out 2>&1
eval_tap $? 73 'UpdateEpicGamesIAPConfig' test.out

#- 74 DeleteEpicGamesIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteEpicGamesIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 74 'DeleteEpicGamesIAPConfig' test.out

#- 75 GetGoogleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getGoogleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 75 'GetGoogleIAPConfig' test.out

#- 76 UpdateGoogleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateGoogleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"applicationName": "bcJhqZ2B", "serviceAccountId": "gS5OlyRA"}' \
    > test.out 2>&1
eval_tap $? 76 'UpdateGoogleIAPConfig' test.out

#- 77 DeleteGoogleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteGoogleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 77 'DeleteGoogleIAPConfig' test.out

#- 78 UpdateGoogleP12File
./ng net.accelbyte.sdk.cli.Main platform updateGoogleP12File \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 78 'UpdateGoogleP12File' test.out

#- 79 GetIAPItemConfig
./ng net.accelbyte.sdk.cli.Main platform getIAPItemConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 79 'GetIAPItemConfig' test.out

#- 80 UpdateIAPItemConfig
./ng net.accelbyte.sdk.cli.Main platform updateIAPItemConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"itemIdentity": "OUU3LjIl", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"bRhvq1fH": "k6Lmxjuq", "5uzSb2BX": "okMuLzhF", "uc6TnKDW": "zdJqVcxQ"}}, {"itemIdentity": "ljO07zs3", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"qEV0uSZF": "VBRMXiXK", "BGe3DU0M": "CuUmwHw1", "0PTmSm5u": "viYvkiRP"}}, {"itemIdentity": "FMPD5zwF", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"bGU5Jk4I": "4EJZp7nY", "hserkqgX": "sADW2Lwc", "8qvlj0JG": "XJVfYvqT"}}]}' \
    > test.out 2>&1
eval_tap $? 80 'UpdateIAPItemConfig' test.out

#- 81 DeleteIAPItemConfig
./ng net.accelbyte.sdk.cli.Main platform deleteIAPItemConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 81 'DeleteIAPItemConfig' test.out

#- 82 GetOculusIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getOculusIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 82 'GetOculusIAPConfig' test.out

#- 83 UpdateOculusIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateOculusIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appId": "MBeOTOsQ", "appSecret": "W9BhR26z"}' \
    > test.out 2>&1
eval_tap $? 83 'UpdateOculusIAPConfig' test.out

#- 84 DeleteOculusIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteOculusIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 84 'DeleteOculusIAPConfig' test.out

#- 85 GetPlayStationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getPlayStationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 85 'GetPlayStationIAPConfig' test.out

#- 86 UpdatePlaystationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlaystationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"backOfficeServerClientId": "3gn7tUpb", "backOfficeServerClientSecret": "FEduhnsA", "enableStreamJob": true, "environment": "iMD2oTSk", "streamName": "934XHeDi", "streamPartnerName": "7ReTKi3f"}' \
    > test.out 2>&1
eval_tap $? 86 'UpdatePlaystationIAPConfig' test.out

#- 87 DeletePlaystationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deletePlaystationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 87 'DeletePlaystationIAPConfig' test.out

#- 88 ValidateExistedPlaystationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform validateExistedPlaystationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 88 'ValidateExistedPlaystationIAPConfig' test.out

#- 89 ValidatePlaystationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform validatePlaystationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"backOfficeServerClientId": "edgew477", "backOfficeServerClientSecret": "VzXHadJd", "enableStreamJob": false, "environment": "n6K1P7qZ", "streamName": "QOdvTlHv", "streamPartnerName": "WL8jHBpf"}' \
    > test.out 2>&1
eval_tap $? 89 'ValidatePlaystationIAPConfig' test.out

#- 90 GetSteamIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getSteamIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 90 'GetSteamIAPConfig' test.out

#- 91 UpdateSteamIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateSteamIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appId": "hn57KioC", "publisherAuthenticationKey": "VdVJTYiV"}' \
    > test.out 2>&1
eval_tap $? 91 'UpdateSteamIAPConfig' test.out

#- 92 DeleteSteamIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteSteamIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 92 'DeleteSteamIAPConfig' test.out

#- 93 GetTwitchIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getTwitchIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 93 'GetTwitchIAPConfig' test.out

#- 94 UpdateTwitchIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateTwitchIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientId": "9xHyRT06", "clientSecret": "lWYzDGWl", "organizationId": "SSm46U3E"}' \
    > test.out 2>&1
eval_tap $? 94 'UpdateTwitchIAPConfig' test.out

#- 95 DeleteTwitchIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteTwitchIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 95 'DeleteTwitchIAPConfig' test.out

#- 96 GetXblIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getXblIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 96 'GetXblIAPConfig' test.out

#- 97 UpdateXblIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateXblIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"relyingPartyCert": "nH3Emktd"}' \
    > test.out 2>&1
eval_tap $? 97 'UpdateXblIAPConfig' test.out

#- 98 DeleteXblAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteXblAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 98 'DeleteXblAPConfig' test.out

#- 99 UpdateXblBPCertFile
./ng net.accelbyte.sdk.cli.Main platform updateXblBPCertFile \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    --password 'p1Q47qMU' \
    > test.out 2>&1
eval_tap $? 99 'UpdateXblBPCertFile' test.out

#- 100 DownloadInvoiceDetails
./ng net.accelbyte.sdk.cli.Main platform downloadInvoiceDetails \
    --namespace "$AB_NAMESPACE" \
    --feature 'LL6dFx0m' \
    --itemId 'iwTZIjg8' \
    --itemType 'APP' \
    --endTime 'Khi8t7eN' \
    --startTime '4SalaU9r' \
    > test.out 2>&1
eval_tap $? 100 'DownloadInvoiceDetails' test.out

#- 101 GenerateInvoiceSummary
./ng net.accelbyte.sdk.cli.Main platform generateInvoiceSummary \
    --namespace "$AB_NAMESPACE" \
    --feature 'HhjBSoAI' \
    --itemId '8MiJ0fPk' \
    --itemType 'SEASON' \
    --endTime 'DQOskJ6Z' \
    --startTime 'u9g3GQ2J' \
    > test.out 2>&1
eval_tap $? 101 'GenerateInvoiceSummary' test.out

#- 102 SyncInGameItem
./ng net.accelbyte.sdk.cli.Main platform syncInGameItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'H575aoRd' \
    --body '{"categoryPath": "THc1GcuR", "targetItemId": "8fQdpsil", "targetNamespace": "CZnCdHnb"}' \
    > test.out 2>&1
eval_tap $? 102 'SyncInGameItem' test.out

#- 103 CreateItem
./ng net.accelbyte.sdk.cli.Main platform createItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'GtM8ZrMG' \
    --body '{"appId": "Xxbac4Ns", "appType": "SOFTWARE", "baseAppId": "7wAbpsb8", "boothName": "cmpvGO6u", "categoryPath": "yDT2qpQM", "clazz": "XwdKOKdn", "displayOrder": 81, "entitlementType": "DURABLE", "ext": {"uAXdzE2l": {}, "Xgyy9GII": {}, "2JViB8SQ": {}}, "features": ["fB7UufcL", "XJZv3Iop", "fch6pqX6"], "flexible": false, "images": [{"as": "ZQHo1c3P", "caption": "9psuPpVU", "height": 14, "imageUrl": "1ThNGmmE", "smallImageUrl": "EwfLK1GY", "width": 13}, {"as": "eASkynIX", "caption": "ryzSzzIL", "height": 98, "imageUrl": "OsG6yIeE", "smallImageUrl": "BwXKoaHU", "width": 91}, {"as": "sMCRyx3O", "caption": "ZQdPidlq", "height": 100, "imageUrl": "sus3YrlE", "smallImageUrl": "RmMeFQm7", "width": 10}], "itemIds": ["zxBLZZ03", "hZSYP7vY", "MkAo9Hj0"], "itemQty": {"Y9TNPb9t": 38, "1NCy9ZDE": 57, "C0Qmx03W": 12}, "itemType": "SUBSCRIPTION", "listable": false, "localizations": {"ZFiEAyn5": {"description": "1NkRszmx", "localExt": {"N0aOtSMq": {}, "hTju4fBq": {}, "ZxJUbPBb": {}}, "longDescription": "otGYsick", "title": "7YjnYOth"}, "LOoml2oJ": {"description": "4VZDPdNy", "localExt": {"H3omQZAO": {}, "hrjRXip0": {}, "HKPPfowD": {}}, "longDescription": "vyQjqJUL", "title": "EUVU4fji"}, "duWzbDAH": {"description": "tGVYWYjw", "localExt": {"95NWXTgJ": {}, "RtyScXmG": {}, "dSRHdNpd": {}}, "longDescription": "0bMVMVPf", "title": "YjLHMGLd"}}, "lootBoxConfig": {"rewardCount": 8, "rewards": [{"lootBoxItems": [{"count": 68, "duration": 57, "endDate": "1991-08-27T00:00:00Z", "itemId": "yEpSQIAi", "itemSku": "uAWhx5g3", "itemType": "0cn6bhwf"}, {"count": 87, "duration": 56, "endDate": "1990-06-30T00:00:00Z", "itemId": "cJiuZntq", "itemSku": "OtC5ceJ8", "itemType": "1mxJr1Kh"}, {"count": 16, "duration": 79, "endDate": "1974-09-24T00:00:00Z", "itemId": "26RZGJBD", "itemSku": "4l8nLDE1", "itemType": "UqJQQ23L"}], "name": "TdADgVbH", "odds": 0.8811344714977244, "type": "REWARD_GROUP", "weight": 20}, {"lootBoxItems": [{"count": 93, "duration": 80, "endDate": "1974-06-10T00:00:00Z", "itemId": "PZBvw68h", "itemSku": "Q7uCUbIe", "itemType": "u7Yh023V"}, {"count": 86, "duration": 29, "endDate": "1976-01-30T00:00:00Z", "itemId": "buuwKm6h", "itemSku": "5LD7XU98", "itemType": "mLfhURf1"}, {"count": 95, "duration": 18, "endDate": "1997-09-09T00:00:00Z", "itemId": "3IFMcV9B", "itemSku": "iO6kibVE", "itemType": "KgyKkcwv"}], "name": "CgYxng3g", "odds": 0.9722849344657488, "type": "REWARD_GROUP", "weight": 89}, {"lootBoxItems": [{"count": 96, "duration": 28, "endDate": "1989-04-14T00:00:00Z", "itemId": "keHuvZMP", "itemSku": "TCO6hkrQ", "itemType": "CrI8xRY7"}, {"count": 50, "duration": 2, "endDate": "1989-04-02T00:00:00Z", "itemId": "CCSZ4Eq0", "itemSku": "9IHnR04W", "itemType": "VGeYdGDY"}, {"count": 94, "duration": 43, "endDate": "1989-11-16T00:00:00Z", "itemId": "JuWF3fJ6", "itemSku": "jzdujCoQ", "itemType": "mYmLSD9S"}], "name": "FnmjeEEP", "odds": 0.8787100201580068, "type": "PROBABILITY_GROUP", "weight": 37}], "rollFunction": "DEFAULT"}, "maxCount": 67, "maxCountPerUser": 0, "name": "Ue6It73h", "optionBoxConfig": {"boxItems": [{"count": 55, "duration": 98, "endDate": "1975-05-25T00:00:00Z", "itemId": "rmvorVrn", "itemSku": "Wrv9WqHz", "itemType": "nxfFUGmF"}, {"count": 79, "duration": 98, "endDate": "1993-03-31T00:00:00Z", "itemId": "SvAhGzO9", "itemSku": "SehqHZtv", "itemType": "uSOCFfkt"}, {"count": 47, "duration": 90, "endDate": "1992-08-15T00:00:00Z", "itemId": "vx8ga4pO", "itemSku": "yvTbWtXX", "itemType": "jT7eIcsy"}]}, "purchasable": true, "recurring": {"cycle": "QUARTERLY", "fixedFreeDays": 81, "fixedTrialCycles": 14, "graceDays": 83}, "regionData": {"nt1Rm9j5": [{"currencyCode": "gfOaNEnz", "currencyNamespace": "FA5yTeNy", "currencyType": "REAL", "discountAmount": 29, "discountExpireAt": "1971-02-20T00:00:00Z", "discountPercentage": 10, "discountPurchaseAt": "1978-11-27T00:00:00Z", "expireAt": "1988-12-27T00:00:00Z", "price": 100, "purchaseAt": "1980-08-11T00:00:00Z", "trialPrice": 47}, {"currencyCode": "xEe0uxR2", "currencyNamespace": "Zcb3P0ID", "currencyType": "REAL", "discountAmount": 15, "discountExpireAt": "1987-08-07T00:00:00Z", "discountPercentage": 51, "discountPurchaseAt": "1979-11-02T00:00:00Z", "expireAt": "1972-07-16T00:00:00Z", "price": 15, "purchaseAt": "1978-09-12T00:00:00Z", "trialPrice": 80}, {"currencyCode": "0Pr3dH4K", "currencyNamespace": "IfToOhUU", "currencyType": "REAL", "discountAmount": 5, "discountExpireAt": "1978-11-19T00:00:00Z", "discountPercentage": 58, "discountPurchaseAt": "1994-02-13T00:00:00Z", "expireAt": "1994-04-24T00:00:00Z", "price": 85, "purchaseAt": "1983-08-21T00:00:00Z", "trialPrice": 10}], "b2Tb6ZO6": [{"currencyCode": "wr0lSofY", "currencyNamespace": "SlBwJZXG", "currencyType": "VIRTUAL", "discountAmount": 47, "discountExpireAt": "1977-11-21T00:00:00Z", "discountPercentage": 9, "discountPurchaseAt": "1996-01-08T00:00:00Z", "expireAt": "1987-08-24T00:00:00Z", "price": 14, "purchaseAt": "1988-05-13T00:00:00Z", "trialPrice": 87}, {"currencyCode": "Veu5FpUw", "currencyNamespace": "xLxEPI7S", "currencyType": "VIRTUAL", "discountAmount": 89, "discountExpireAt": "1976-10-13T00:00:00Z", "discountPercentage": 54, "discountPurchaseAt": "1975-08-25T00:00:00Z", "expireAt": "1989-09-23T00:00:00Z", "price": 23, "purchaseAt": "1973-04-12T00:00:00Z", "trialPrice": 50}, {"currencyCode": "8vcmf63a", "currencyNamespace": "bLPs0iY4", "currencyType": "VIRTUAL", "discountAmount": 66, "discountExpireAt": "1998-03-26T00:00:00Z", "discountPercentage": 66, "discountPurchaseAt": "1980-06-15T00:00:00Z", "expireAt": "1976-07-31T00:00:00Z", "price": 32, "purchaseAt": "1998-10-03T00:00:00Z", "trialPrice": 8}], "Kl2ObTF3": [{"currencyCode": "MZ3DAKvY", "currencyNamespace": "t3AL8ns6", "currencyType": "VIRTUAL", "discountAmount": 62, "discountExpireAt": "1993-07-06T00:00:00Z", "discountPercentage": 36, "discountPurchaseAt": "1978-07-07T00:00:00Z", "expireAt": "1973-02-17T00:00:00Z", "price": 32, "purchaseAt": "1994-03-10T00:00:00Z", "trialPrice": 12}, {"currencyCode": "JkfppwcG", "currencyNamespace": "Efxh5FvV", "currencyType": "REAL", "discountAmount": 72, "discountExpireAt": "1990-01-04T00:00:00Z", "discountPercentage": 1, "discountPurchaseAt": "1998-03-06T00:00:00Z", "expireAt": "1989-10-05T00:00:00Z", "price": 40, "purchaseAt": "1983-01-29T00:00:00Z", "trialPrice": 40}, {"currencyCode": "wzgIPoYA", "currencyNamespace": "peVWq2a0", "currencyType": "VIRTUAL", "discountAmount": 33, "discountExpireAt": "1975-04-24T00:00:00Z", "discountPercentage": 68, "discountPurchaseAt": "1988-03-11T00:00:00Z", "expireAt": "1981-05-23T00:00:00Z", "price": 0, "purchaseAt": "1971-12-05T00:00:00Z", "trialPrice": 92}]}, "saleConfig": {"currencyCode": "cRGcLLtN", "price": 50}, "seasonType": "PASS", "sectionExclusive": false, "sellable": false, "sku": "Xr0Ht9Mq", "stackable": true, "status": "ACTIVE", "tags": ["ELkyT1OR", "Hc8j9cM6", "lQIL0COQ"], "targetCurrencyCode": "nv1LOLaN", "targetNamespace": "NmtBzYmj", "thumbnailUrl": "9U2Q9wwZ", "useCount": 59}' \
    > test.out 2>&1
eval_tap $? 103 'CreateItem' test.out

#- 104 GetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform getItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'rHe2J4Kv' \
    --appId 'owj2SLfh' \
    > test.out 2>&1
eval_tap $? 104 'GetItemByAppId' test.out

#- 105 QueryItems
./ng net.accelbyte.sdk.cli.Main platform queryItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --appType 'DEMO' \
    --availableDate 'PeVlgH2e' \
    --baseAppId '3LQyw8Tp' \
    --categoryPath 'Iwn8BMHG' \
    --features 'sEXosbVj' \
    --includeSubCategoryItem  \
    --itemType 'BUNDLE' \
    --limit '61' \
    --offset '12' \
    --region 'e3zrQr5m' \
    --sortBy 'createdAt,createdAt:desc,displayOrder' \
    --storeId 'TM322XLt' \
    --tags '5MPezo9w' \
    --targetNamespace 'lxERp7vp' \
    > test.out 2>&1
eval_tap $? 105 'QueryItems' test.out

#- 106 ListBasicItemsByFeatures
./ng net.accelbyte.sdk.cli.Main platform listBasicItemsByFeatures \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --features 'BZfEK1vO,v0XOEVQT,8rRrNenR' \
    > test.out 2>&1
eval_tap $? 106 'ListBasicItemsByFeatures' test.out

#- 107 GetItems
./ng net.accelbyte.sdk.cli.Main platform getItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'BuDG96xU' \
    --itemIds 'nvZSxENj' \
    > test.out 2>&1
eval_tap $? 107 'GetItems' test.out

#- 108 GetItemBySku
./ng net.accelbyte.sdk.cli.Main platform getItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'qnV9e5qE' \
    --sku 'V60bG87D' \
    > test.out 2>&1
eval_tap $? 108 'GetItemBySku' test.out

#- 109 GetLocaleItemBySku
./ng net.accelbyte.sdk.cli.Main platform getLocaleItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language '4eBYxxyj' \
    --populateBundle  \
    --region 'ibhrf30g' \
    --storeId '0s5Wrevd' \
    --sku '8wXTthAg' \
    > test.out 2>&1
eval_tap $? 109 'GetLocaleItemBySku' test.out

#- 110 GetEstimatedPrice
./ng net.accelbyte.sdk.cli.Main platform getEstimatedPrice \
    --namespace "$AB_NAMESPACE" \
    --region 'F10gbXb2' \
    --storeId 'kuKzmcOt' \
    --itemIds '6twUmhMN' \
    --userId 'tNOcfVtH' \
    > test.out 2>&1
eval_tap $? 110 'GetEstimatedPrice' test.out

#- 111 GetItemIdBySku
./ng net.accelbyte.sdk.cli.Main platform getItemIdBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'QP83hKrR' \
    --sku 'IlgLS8iT' \
    > test.out 2>&1
eval_tap $? 111 'GetItemIdBySku' test.out

#- 112 GetBulkItemIdBySkus
./ng net.accelbyte.sdk.cli.Main platform getBulkItemIdBySkus \
    --namespace "$AB_NAMESPACE" \
    --sku 'WPEeTBNa,VB8imZb6,7WVUbD4v' \
    --storeId 'S9GF4xlJ' \
    > test.out 2>&1
eval_tap $? 112 'GetBulkItemIdBySkus' test.out

#- 113 BulkGetLocaleItems
./ng net.accelbyte.sdk.cli.Main platform bulkGetLocaleItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'RTcD5aix' \
    --region '4AaqkS86' \
    --storeId 'WiZgsyZY' \
    --itemIds 'YDC5b3D0' \
    > test.out 2>&1
eval_tap $? 113 'BulkGetLocaleItems' test.out

#- 114 GetAvailablePredicateTypes
./ng net.accelbyte.sdk.cli.Main platform getAvailablePredicateTypes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 114 'GetAvailablePredicateTypes' test.out

#- 115 ValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform validateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --userId 'ThLH8vIT' \
    --body '{"itemIds": ["EtE4LBJn", "W9qi8qKF", "0Vg5CP5O"]}' \
    > test.out 2>&1
eval_tap $? 115 'ValidateItemPurchaseCondition' test.out

#- 116 BulkUpdateRegionData
./ng net.accelbyte.sdk.cli.Main platform bulkUpdateRegionData \
    --namespace "$AB_NAMESPACE" \
    --storeId 'qXiYSlP5' \
    --body '{"changes": [{"itemIdentities": ["tqUkFDDr", "8GqwzcOs", "nxMdGrNI"], "itemIdentityType": "ITEM_SKU", "regionData": {"fQbrEOZQ": [{"currencyCode": "dyRbYVGi", "currencyNamespace": "zf2L76ow", "currencyType": "REAL", "discountAmount": 80, "discountExpireAt": "1990-12-27T00:00:00Z", "discountPercentage": 81, "discountPurchaseAt": "1988-12-09T00:00:00Z", "discountedPrice": 26, "expireAt": "1980-08-24T00:00:00Z", "price": 2, "purchaseAt": "1982-10-06T00:00:00Z", "trialPrice": 96}, {"currencyCode": "O8pAw2wr", "currencyNamespace": "5OZAybA2", "currencyType": "VIRTUAL", "discountAmount": 95, "discountExpireAt": "1982-03-12T00:00:00Z", "discountPercentage": 54, "discountPurchaseAt": "1981-05-09T00:00:00Z", "discountedPrice": 15, "expireAt": "1975-04-26T00:00:00Z", "price": 59, "purchaseAt": "1980-12-20T00:00:00Z", "trialPrice": 29}, {"currencyCode": "r4pNFePE", "currencyNamespace": "QvxyUPmi", "currencyType": "REAL", "discountAmount": 4, "discountExpireAt": "1992-06-20T00:00:00Z", "discountPercentage": 33, "discountPurchaseAt": "1997-07-03T00:00:00Z", "discountedPrice": 44, "expireAt": "1989-05-11T00:00:00Z", "price": 10, "purchaseAt": "1983-07-03T00:00:00Z", "trialPrice": 61}], "Gr1VU2fs": [{"currencyCode": "gboujBSh", "currencyNamespace": "McZyP8Ml", "currencyType": "REAL", "discountAmount": 53, "discountExpireAt": "1994-12-05T00:00:00Z", "discountPercentage": 98, "discountPurchaseAt": "1996-07-18T00:00:00Z", "discountedPrice": 1, "expireAt": "1992-11-29T00:00:00Z", "price": 25, "purchaseAt": "1983-09-22T00:00:00Z", "trialPrice": 31}, {"currencyCode": "fptGILPF", "currencyNamespace": "eyTPRfpM", "currencyType": "REAL", "discountAmount": 41, "discountExpireAt": "1986-05-04T00:00:00Z", "discountPercentage": 53, "discountPurchaseAt": "1999-07-23T00:00:00Z", "discountedPrice": 19, "expireAt": "1976-01-06T00:00:00Z", "price": 80, "purchaseAt": "1987-08-23T00:00:00Z", "trialPrice": 44}, {"currencyCode": "nambqVGy", "currencyNamespace": "eil7JAWB", "currencyType": "VIRTUAL", "discountAmount": 88, "discountExpireAt": "1973-11-26T00:00:00Z", "discountPercentage": 16, "discountPurchaseAt": "1997-10-16T00:00:00Z", "discountedPrice": 75, "expireAt": "1984-09-05T00:00:00Z", "price": 60, "purchaseAt": "1976-02-21T00:00:00Z", "trialPrice": 97}], "Q8q8Jnj5": [{"currencyCode": "IHo9ERE8", "currencyNamespace": "Y2Dhjozf", "currencyType": "VIRTUAL", "discountAmount": 1, "discountExpireAt": "1998-09-27T00:00:00Z", "discountPercentage": 11, "discountPurchaseAt": "1978-07-11T00:00:00Z", "discountedPrice": 25, "expireAt": "1977-12-03T00:00:00Z", "price": 70, "purchaseAt": "1995-12-09T00:00:00Z", "trialPrice": 92}, {"currencyCode": "qvlsvoiM", "currencyNamespace": "5kDOKYvu", "currencyType": "VIRTUAL", "discountAmount": 25, "discountExpireAt": "1980-08-17T00:00:00Z", "discountPercentage": 84, "discountPurchaseAt": "1997-06-21T00:00:00Z", "discountedPrice": 24, "expireAt": "1997-04-04T00:00:00Z", "price": 18, "purchaseAt": "1993-11-19T00:00:00Z", "trialPrice": 82}, {"currencyCode": "GZoBqLjM", "currencyNamespace": "VbTAXfVE", "currencyType": "VIRTUAL", "discountAmount": 76, "discountExpireAt": "1982-07-23T00:00:00Z", "discountPercentage": 98, "discountPurchaseAt": "1980-02-09T00:00:00Z", "discountedPrice": 8, "expireAt": "1977-04-13T00:00:00Z", "price": 27, "purchaseAt": "1996-05-11T00:00:00Z", "trialPrice": 99}]}}, {"itemIdentities": ["GN3ZK0Hh", "NryeiIHd", "e7IwQIb9"], "itemIdentityType": "ITEM_SKU", "regionData": {"dPtk7MDw": [{"currencyCode": "zpGn12rm", "currencyNamespace": "nUux2kwi", "currencyType": "REAL", "discountAmount": 60, "discountExpireAt": "1971-04-17T00:00:00Z", "discountPercentage": 16, "discountPurchaseAt": "1974-02-28T00:00:00Z", "discountedPrice": 73, "expireAt": "1976-11-11T00:00:00Z", "price": 3, "purchaseAt": "1973-04-08T00:00:00Z", "trialPrice": 87}, {"currencyCode": "wDiqFMXy", "currencyNamespace": "tDWQHZSC", "currencyType": "VIRTUAL", "discountAmount": 0, "discountExpireAt": "1978-01-01T00:00:00Z", "discountPercentage": 5, "discountPurchaseAt": "1972-11-04T00:00:00Z", "discountedPrice": 26, "expireAt": "1997-07-16T00:00:00Z", "price": 42, "purchaseAt": "1971-11-09T00:00:00Z", "trialPrice": 78}, {"currencyCode": "CfR30X38", "currencyNamespace": "RMj4WEIs", "currencyType": "VIRTUAL", "discountAmount": 49, "discountExpireAt": "1981-05-20T00:00:00Z", "discountPercentage": 76, "discountPurchaseAt": "1974-03-28T00:00:00Z", "discountedPrice": 85, "expireAt": "1998-04-05T00:00:00Z", "price": 80, "purchaseAt": "1971-05-01T00:00:00Z", "trialPrice": 80}], "uCjQ8otn": [{"currencyCode": "5Rw3gXBR", "currencyNamespace": "LURkQEey", "currencyType": "VIRTUAL", "discountAmount": 42, "discountExpireAt": "1991-07-25T00:00:00Z", "discountPercentage": 12, "discountPurchaseAt": "1981-07-04T00:00:00Z", "discountedPrice": 43, "expireAt": "1976-11-25T00:00:00Z", "price": 31, "purchaseAt": "1977-07-16T00:00:00Z", "trialPrice": 37}, {"currencyCode": "Rn8lf2Pq", "currencyNamespace": "BdaM0Iy3", "currencyType": "VIRTUAL", "discountAmount": 61, "discountExpireAt": "1976-07-16T00:00:00Z", "discountPercentage": 35, "discountPurchaseAt": "1984-09-18T00:00:00Z", "discountedPrice": 20, "expireAt": "1985-02-10T00:00:00Z", "price": 93, "purchaseAt": "1995-11-30T00:00:00Z", "trialPrice": 86}, {"currencyCode": "epfdlbLG", "currencyNamespace": "ezcTJzXA", "currencyType": "VIRTUAL", "discountAmount": 34, "discountExpireAt": "1985-12-12T00:00:00Z", "discountPercentage": 77, "discountPurchaseAt": "1973-05-25T00:00:00Z", "discountedPrice": 14, "expireAt": "1988-10-18T00:00:00Z", "price": 72, "purchaseAt": "1998-08-19T00:00:00Z", "trialPrice": 56}], "QYclQO8h": [{"currencyCode": "HoWK6DFq", "currencyNamespace": "dFYyjPKD", "currencyType": "VIRTUAL", "discountAmount": 33, "discountExpireAt": "1988-11-20T00:00:00Z", "discountPercentage": 86, "discountPurchaseAt": "1977-10-15T00:00:00Z", "discountedPrice": 46, "expireAt": "1985-06-06T00:00:00Z", "price": 75, "purchaseAt": "1971-01-10T00:00:00Z", "trialPrice": 30}, {"currencyCode": "MXP2Ky8A", "currencyNamespace": "XrCRe8S5", "currencyType": "VIRTUAL", "discountAmount": 8, "discountExpireAt": "1981-07-06T00:00:00Z", "discountPercentage": 42, "discountPurchaseAt": "1995-01-11T00:00:00Z", "discountedPrice": 49, "expireAt": "1989-01-14T00:00:00Z", "price": 21, "purchaseAt": "1976-04-05T00:00:00Z", "trialPrice": 4}, {"currencyCode": "tetFNncB", "currencyNamespace": "PsPm2CMC", "currencyType": "VIRTUAL", "discountAmount": 36, "discountExpireAt": "1986-12-15T00:00:00Z", "discountPercentage": 67, "discountPurchaseAt": "1993-08-22T00:00:00Z", "discountedPrice": 99, "expireAt": "1975-02-27T00:00:00Z", "price": 37, "purchaseAt": "1995-05-19T00:00:00Z", "trialPrice": 68}]}}, {"itemIdentities": ["K8sEazYJ", "6GRE8Mht", "pxxjmYIv"], "itemIdentityType": "ITEM_ID", "regionData": {"4DTTMjQQ": [{"currencyCode": "byIhH1WU", "currencyNamespace": "igEPcUUK", "currencyType": "VIRTUAL", "discountAmount": 26, "discountExpireAt": "1972-02-23T00:00:00Z", "discountPercentage": 52, "discountPurchaseAt": "1997-04-01T00:00:00Z", "discountedPrice": 38, "expireAt": "1974-09-03T00:00:00Z", "price": 67, "purchaseAt": "1996-04-20T00:00:00Z", "trialPrice": 95}, {"currencyCode": "H5r3u2LZ", "currencyNamespace": "5tbclEQq", "currencyType": "REAL", "discountAmount": 18, "discountExpireAt": "1974-01-01T00:00:00Z", "discountPercentage": 95, "discountPurchaseAt": "1999-05-10T00:00:00Z", "discountedPrice": 14, "expireAt": "1992-08-30T00:00:00Z", "price": 58, "purchaseAt": "1974-02-28T00:00:00Z", "trialPrice": 92}, {"currencyCode": "pBKkYN1P", "currencyNamespace": "2k1ThqKk", "currencyType": "REAL", "discountAmount": 4, "discountExpireAt": "1973-10-20T00:00:00Z", "discountPercentage": 39, "discountPurchaseAt": "1992-05-28T00:00:00Z", "discountedPrice": 96, "expireAt": "1977-06-15T00:00:00Z", "price": 89, "purchaseAt": "1990-02-09T00:00:00Z", "trialPrice": 37}], "o8TF2F9p": [{"currencyCode": "We4GHkvF", "currencyNamespace": "wPnwsOfT", "currencyType": "REAL", "discountAmount": 37, "discountExpireAt": "1973-10-08T00:00:00Z", "discountPercentage": 63, "discountPurchaseAt": "1974-10-10T00:00:00Z", "discountedPrice": 99, "expireAt": "1996-09-13T00:00:00Z", "price": 14, "purchaseAt": "1983-01-11T00:00:00Z", "trialPrice": 10}, {"currencyCode": "Mw0s2ELn", "currencyNamespace": "a4LdlIxi", "currencyType": "VIRTUAL", "discountAmount": 35, "discountExpireAt": "1978-09-07T00:00:00Z", "discountPercentage": 47, "discountPurchaseAt": "1978-03-03T00:00:00Z", "discountedPrice": 79, "expireAt": "1971-01-11T00:00:00Z", "price": 84, "purchaseAt": "1981-09-23T00:00:00Z", "trialPrice": 97}, {"currencyCode": "KPmpvEXx", "currencyNamespace": "OMBKSH6K", "currencyType": "REAL", "discountAmount": 50, "discountExpireAt": "1995-05-03T00:00:00Z", "discountPercentage": 48, "discountPurchaseAt": "1995-03-25T00:00:00Z", "discountedPrice": 4, "expireAt": "1997-04-30T00:00:00Z", "price": 23, "purchaseAt": "1996-10-16T00:00:00Z", "trialPrice": 94}], "X9prBDvt": [{"currencyCode": "Gu66CLYE", "currencyNamespace": "ITBVdfmn", "currencyType": "REAL", "discountAmount": 29, "discountExpireAt": "1984-04-02T00:00:00Z", "discountPercentage": 81, "discountPurchaseAt": "1982-12-22T00:00:00Z", "discountedPrice": 19, "expireAt": "1973-03-30T00:00:00Z", "price": 45, "purchaseAt": "1971-03-30T00:00:00Z", "trialPrice": 28}, {"currencyCode": "jP6fh39x", "currencyNamespace": "0dPIvPBl", "currencyType": "REAL", "discountAmount": 2, "discountExpireAt": "1983-11-22T00:00:00Z", "discountPercentage": 91, "discountPurchaseAt": "1977-02-08T00:00:00Z", "discountedPrice": 36, "expireAt": "1976-05-22T00:00:00Z", "price": 50, "purchaseAt": "1987-07-16T00:00:00Z", "trialPrice": 31}, {"currencyCode": "IakTayU6", "currencyNamespace": "ujlNN5XP", "currencyType": "REAL", "discountAmount": 6, "discountExpireAt": "1981-10-02T00:00:00Z", "discountPercentage": 40, "discountPurchaseAt": "1991-11-09T00:00:00Z", "discountedPrice": 40, "expireAt": "1980-12-06T00:00:00Z", "price": 30, "purchaseAt": "1981-04-07T00:00:00Z", "trialPrice": 45}]}}]}' \
    > test.out 2>&1
eval_tap $? 116 'BulkUpdateRegionData' test.out

#- 117 SearchItems
./ng net.accelbyte.sdk.cli.Main platform searchItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemType 'MEDIA' \
    --limit '59' \
    --offset '62' \
    --sortBy 'N6vKCBTO' \
    --storeId 'QOaVtTQs' \
    --keyword 'ehzjprfk' \
    --language '3OlT1vDs' \
    > test.out 2>&1
eval_tap $? 117 'SearchItems' test.out

#- 118 QueryUncategorizedItems
./ng net.accelbyte.sdk.cli.Main platform queryUncategorizedItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --limit '24' \
    --offset '45' \
    --sortBy 'displayOrder:desc,name:desc,name:asc' \
    --storeId 'cuqQIip3' \
    > test.out 2>&1
eval_tap $? 118 'QueryUncategorizedItems' test.out

#- 119 GetItem
./ng net.accelbyte.sdk.cli.Main platform getItem \
    --itemId 'KcjT5tIF' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId '9Qmi9JLO' \
    > test.out 2>&1
eval_tap $? 119 'GetItem' test.out

#- 120 UpdateItem
./ng net.accelbyte.sdk.cli.Main platform updateItem \
    --itemId 'SZVRcL7N' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'gpqStoQO' \
    --body '{"appId": "eb6tDlm2", "appType": "DEMO", "baseAppId": "aB4vh8me", "boothName": "tFCvVkOL", "categoryPath": "r20gosOq", "clazz": "rcq2Yqu2", "displayOrder": 95, "entitlementType": "CONSUMABLE", "ext": {"4mftUU27": {}, "wW1tvDC2": {}, "mePJarQb": {}}, "features": ["Y9SkCQuq", "n5NTLiZG", "8OH8awYj"], "flexible": false, "images": [{"as": "GlBX1ig9", "caption": "sdYWsl9V", "height": 36, "imageUrl": "jmVHfCbP", "smallImageUrl": "LnmdvGCr", "width": 71}, {"as": "3hNzHy9q", "caption": "wLKbirKN", "height": 17, "imageUrl": "w34ryzCs", "smallImageUrl": "Hyqn1x76", "width": 30}, {"as": "4icbCFpO", "caption": "dubBqbGR", "height": 13, "imageUrl": "pzi4Rlcx", "smallImageUrl": "hfLdoXlG", "width": 61}], "itemIds": ["233azOnJ", "y5Nm4Ksa", "dsQxHlQx"], "itemQty": {"llK5GSvs": 37, "IHyggJ0Z": 49, "aOa1nC4m": 92}, "itemType": "EXTENSION", "listable": true, "localizations": {"sf0sqbhH": {"description": "bghsWuZb", "localExt": {"QhGZ8pnd": {}, "C1nOhpAn": {}, "eQKjnDlo": {}}, "longDescription": "0ncSEmaj", "title": "hRnIUSj6"}, "KJXNpwLp": {"description": "EYCUfPIR", "localExt": {"304WBJYJ": {}, "uRlfyCqs": {}, "Im8E6TJX": {}}, "longDescription": "CJomwY5f", "title": "qwwvLgjV"}, "7KelhR6y": {"description": "k5EKUg0A", "localExt": {"E3Rx7Llq": {}, "11nvYxKH": {}, "Cg1mTgm7": {}}, "longDescription": "zUQKj6CG", "title": "0lKtSvpb"}}, "lootBoxConfig": {"rewardCount": 74, "rewards": [{"lootBoxItems": [{"count": 53, "duration": 80, "endDate": "1983-12-22T00:00:00Z", "itemId": "eXsAiDSb", "itemSku": "AODQ8HrU", "itemType": "aqMbmebu"}, {"count": 68, "duration": 97, "endDate": "1981-03-21T00:00:00Z", "itemId": "PjvFLRpy", "itemSku": "s4rpnXin", "itemType": "KB1W9fkN"}, {"count": 96, "duration": 2, "endDate": "1986-07-11T00:00:00Z", "itemId": "HRs8sP9D", "itemSku": "NLeWlrAU", "itemType": "AA6J3Zqg"}], "name": "IawizqGa", "odds": 0.7932997528483813, "type": "REWARD_GROUP", "weight": 94}, {"lootBoxItems": [{"count": 11, "duration": 40, "endDate": "1993-03-18T00:00:00Z", "itemId": "hT53h87L", "itemSku": "6VoeD2Yt", "itemType": "eaLTvctg"}, {"count": 25, "duration": 36, "endDate": "1992-01-15T00:00:00Z", "itemId": "lN6yJWGz", "itemSku": "Sy7KJ875", "itemType": "wHCPuiiy"}, {"count": 82, "duration": 8, "endDate": "1974-02-25T00:00:00Z", "itemId": "RkcgPjp0", "itemSku": "XYRnJ1Al", "itemType": "yrQDlYEa"}], "name": "w4PswgVs", "odds": 0.5141100050142878, "type": "REWARD_GROUP", "weight": 21}, {"lootBoxItems": [{"count": 1, "duration": 55, "endDate": "1978-09-21T00:00:00Z", "itemId": "gs5I054Z", "itemSku": "axF58kCz", "itemType": "3QPMAcsn"}, {"count": 48, "duration": 91, "endDate": "1979-02-19T00:00:00Z", "itemId": "s9FMyfSI", "itemSku": "yZNRwOjU", "itemType": "8G4q4MNh"}, {"count": 60, "duration": 12, "endDate": "1972-07-26T00:00:00Z", "itemId": "iZgSfRFs", "itemSku": "kwrWSz1F", "itemType": "PyOzb4uU"}], "name": "tD7DV2WO", "odds": 0.30807167775193156, "type": "PROBABILITY_GROUP", "weight": 60}], "rollFunction": "CUSTOM"}, "maxCount": 71, "maxCountPerUser": 18, "name": "yiWvdiyV", "optionBoxConfig": {"boxItems": [{"count": 58, "duration": 25, "endDate": "1972-03-29T00:00:00Z", "itemId": "fIYWiYHY", "itemSku": "7IQxVk20", "itemType": "r6xyLAHF"}, {"count": 92, "duration": 55, "endDate": "1984-11-17T00:00:00Z", "itemId": "ymuTUgQz", "itemSku": "lnnSU1Is", "itemType": "lkNGYkHm"}, {"count": 9, "duration": 44, "endDate": "1992-05-29T00:00:00Z", "itemId": "mTu1ytF1", "itemSku": "8vORcMwd", "itemType": "pzJRupId"}]}, "purchasable": false, "recurring": {"cycle": "YEARLY", "fixedFreeDays": 0, "fixedTrialCycles": 74, "graceDays": 64}, "regionData": {"1iCYUMGl": [{"currencyCode": "LqmpHvxn", "currencyNamespace": "g1BzFwTj", "currencyType": "REAL", "discountAmount": 34, "discountExpireAt": "1993-01-06T00:00:00Z", "discountPercentage": 71, "discountPurchaseAt": "1985-10-08T00:00:00Z", "expireAt": "1996-12-17T00:00:00Z", "price": 22, "purchaseAt": "1977-01-09T00:00:00Z", "trialPrice": 76}, {"currencyCode": "XiwNghsm", "currencyNamespace": "EzfoRdfM", "currencyType": "REAL", "discountAmount": 39, "discountExpireAt": "1977-06-14T00:00:00Z", "discountPercentage": 37, "discountPurchaseAt": "1996-02-24T00:00:00Z", "expireAt": "1974-02-19T00:00:00Z", "price": 89, "purchaseAt": "1974-11-11T00:00:00Z", "trialPrice": 68}, {"currencyCode": "dm1pfKRI", "currencyNamespace": "VCoBTuKW", "currencyType": "REAL", "discountAmount": 93, "discountExpireAt": "1999-03-05T00:00:00Z", "discountPercentage": 89, "discountPurchaseAt": "1984-05-20T00:00:00Z", "expireAt": "1993-09-26T00:00:00Z", "price": 9, "purchaseAt": "1980-05-17T00:00:00Z", "trialPrice": 47}], "1QhWQxHw": [{"currencyCode": "SI2U4wdu", "currencyNamespace": "GCGlfRDZ", "currencyType": "REAL", "discountAmount": 72, "discountExpireAt": "1972-11-23T00:00:00Z", "discountPercentage": 77, "discountPurchaseAt": "1999-07-04T00:00:00Z", "expireAt": "1986-11-23T00:00:00Z", "price": 30, "purchaseAt": "1977-03-13T00:00:00Z", "trialPrice": 27}, {"currencyCode": "Cu8O5NN3", "currencyNamespace": "A31sil8U", "currencyType": "REAL", "discountAmount": 29, "discountExpireAt": "1988-09-28T00:00:00Z", "discountPercentage": 45, "discountPurchaseAt": "1992-12-12T00:00:00Z", "expireAt": "1972-10-30T00:00:00Z", "price": 52, "purchaseAt": "1976-03-02T00:00:00Z", "trialPrice": 51}, {"currencyCode": "Jf8ZCcsz", "currencyNamespace": "GExFcc9q", "currencyType": "REAL", "discountAmount": 59, "discountExpireAt": "1976-03-02T00:00:00Z", "discountPercentage": 11, "discountPurchaseAt": "1981-01-29T00:00:00Z", "expireAt": "1995-08-08T00:00:00Z", "price": 60, "purchaseAt": "1992-12-03T00:00:00Z", "trialPrice": 28}], "36w8LvZq": [{"currencyCode": "jSahl6n5", "currencyNamespace": "aOcau514", "currencyType": "VIRTUAL", "discountAmount": 67, "discountExpireAt": "1983-04-21T00:00:00Z", "discountPercentage": 41, "discountPurchaseAt": "1999-09-15T00:00:00Z", "expireAt": "1985-05-14T00:00:00Z", "price": 56, "purchaseAt": "1982-09-29T00:00:00Z", "trialPrice": 97}, {"currencyCode": "4wx2hjTR", "currencyNamespace": "evnDSJ3i", "currencyType": "REAL", "discountAmount": 38, "discountExpireAt": "1985-03-29T00:00:00Z", "discountPercentage": 35, "discountPurchaseAt": "1990-02-19T00:00:00Z", "expireAt": "1984-01-03T00:00:00Z", "price": 84, "purchaseAt": "1996-03-21T00:00:00Z", "trialPrice": 39}, {"currencyCode": "kqrodAdK", "currencyNamespace": "4RXD1ZsB", "currencyType": "REAL", "discountAmount": 96, "discountExpireAt": "1989-12-08T00:00:00Z", "discountPercentage": 13, "discountPurchaseAt": "1999-03-23T00:00:00Z", "expireAt": "1998-02-28T00:00:00Z", "price": 15, "purchaseAt": "1972-03-07T00:00:00Z", "trialPrice": 62}]}, "saleConfig": {"currencyCode": "I8xaytSY", "price": 74}, "seasonType": "TIER", "sectionExclusive": false, "sellable": false, "sku": "JKe4bp6g", "stackable": false, "status": "ACTIVE", "tags": ["Sd93Mwqr", "3te3HPIH", "osxuHK8a"], "targetCurrencyCode": "Tf4X7x5v", "targetNamespace": "10ltzOp5", "thumbnailUrl": "XIcmTKRz", "useCount": 66}' \
    > test.out 2>&1
eval_tap $? 120 'UpdateItem' test.out

#- 121 DeleteItem
./ng net.accelbyte.sdk.cli.Main platform deleteItem \
    --itemId 'qMJ3HhdG' \
    --namespace "$AB_NAMESPACE" \
    --force  \
    --storeId 'zfUJXDKI' \
    > test.out 2>&1
eval_tap $? 121 'DeleteItem' test.out

#- 122 AcquireItem
./ng net.accelbyte.sdk.cli.Main platform acquireItem \
    --itemId 'm4gt4Evp' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 42, "orderNo": "MzLXptrQ"}' \
    > test.out 2>&1
eval_tap $? 122 'AcquireItem' test.out

#- 123 GetApp
./ng net.accelbyte.sdk.cli.Main platform getApp \
    --itemId 'fEvM43aZ' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'P2Uj5Ucl' \
    > test.out 2>&1
eval_tap $? 123 'GetApp' test.out

#- 124 UpdateApp
./ng net.accelbyte.sdk.cli.Main platform updateApp \
    --itemId 'CXZWM742' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'MSPSf2cD' \
    --body '{"carousel": [{"alt": "j3FjoQ9p", "previewUrl": "oSgcWZ6z", "thumbnailUrl": "22mLXu2X", "type": "image", "url": "8MLZyEPm", "videoSource": "generic"}, {"alt": "WIXnvMlG", "previewUrl": "KZHRBPen", "thumbnailUrl": "ZM9C7nTa", "type": "video", "url": "eaEMHFJE", "videoSource": "generic"}, {"alt": "Fbp00R2Y", "previewUrl": "XfSi5axz", "thumbnailUrl": "k1BfU9xE", "type": "video", "url": "OOGIsVeZ", "videoSource": "youtube"}], "developer": "Tq1D7hei", "forumUrl": "rG2m7tt1", "genres": ["Casual", "Indie", "Racing"], "localizations": {"4Z4eTowD": {"announcement": "eXrYwU1X", "slogan": "StbVcwuL"}, "hlZq2YZu": {"announcement": "batgyXlP", "slogan": "1fSDI7ep"}, "8dQoV7KV": {"announcement": "oxEnv1Qf", "slogan": "NxNbYKnC"}}, "platformRequirements": {"JZKOLPIc": [{"additionals": "9lNssJJS", "directXVersion": "TrZg8rHO", "diskSpace": "IoE8z3mJ", "graphics": "ygns2NMo", "label": "qCnjFsdZ", "osVersion": "wB9Rh1He", "processor": "YaGLVtkQ", "ram": "styF7HVG", "soundCard": "fjBZNXAv"}, {"additionals": "lpX1NgkR", "directXVersion": "zfEbnSPn", "diskSpace": "2IKaO13Y", "graphics": "0A24eOJy", "label": "5lNZx2E9", "osVersion": "VyHS4508", "processor": "Lp3elOyv", "ram": "VEinlqRx", "soundCard": "aEqWPGTP"}, {"additionals": "SobMU6oN", "directXVersion": "SqDjLUmF", "diskSpace": "PzwNu50M", "graphics": "511Crk3g", "label": "dd46ZKgN", "osVersion": "2fEyI7AY", "processor": "iwGhehMH", "ram": "4PffXE40", "soundCard": "6qiD7ejx"}], "w6oHYp8b": [{"additionals": "6B0OqiNN", "directXVersion": "mmhVmmu7", "diskSpace": "OliFHIQe", "graphics": "Z0zcImNR", "label": "9mEVUF0I", "osVersion": "46fiYJmm", "processor": "AWDJje6X", "ram": "Y1sg6QVI", "soundCard": "GYWrhJiv"}, {"additionals": "DExUQYna", "directXVersion": "N7f5Roj8", "diskSpace": "UcAG6P9k", "graphics": "mbLhsw0X", "label": "kyZrVVII", "osVersion": "FfnwVyRL", "processor": "EEX3TIn3", "ram": "qJB85dt3", "soundCard": "bKfUP77r"}, {"additionals": "UagLOvPJ", "directXVersion": "nznrkBCN", "diskSpace": "ZzAN47w1", "graphics": "NpD3XRUz", "label": "XjQJ1MCD", "osVersion": "OlK6cQqX", "processor": "r0wPwPbk", "ram": "AbrWJ0TN", "soundCard": "vtCFM2Ra"}], "75OUo0Dc": [{"additionals": "W65eBWFA", "directXVersion": "VV1MIFRE", "diskSpace": "1oxtR5wU", "graphics": "2LfmeeWA", "label": "OJUKHX23", "osVersion": "sIggP1mh", "processor": "WHUSWPFc", "ram": "t8CZVe9d", "soundCard": "90YfNChs"}, {"additionals": "AEgVrXEy", "directXVersion": "361zBIcZ", "diskSpace": "k8t1m7IW", "graphics": "ynqgGBH9", "label": "5m8aRgr5", "osVersion": "BK5IWAWh", "processor": "4xk0uF57", "ram": "ULCNL9Kk", "soundCard": "hEZy4qHL"}, {"additionals": "aGqXysZ9", "directXVersion": "RKPC67Im", "diskSpace": "zAAd6Lq1", "graphics": "0igT6YOP", "label": "YSyPj8sb", "osVersion": "OEC5gtZB", "processor": "fg1qesmy", "ram": "nW6bficc", "soundCard": "gp009fAp"}]}, "platforms": ["Linux", "Linux", "Linux"], "players": ["Multi", "CrossPlatformMulti", "CrossPlatformMulti"], "primaryGenre": "RPG", "publisher": "cLZ322FU", "releaseDate": "1992-05-28T00:00:00Z", "websiteUrl": "qWkvz8rk"}' \
    > test.out 2>&1
eval_tap $? 124 'UpdateApp' test.out

#- 125 DisableItem
./ng net.accelbyte.sdk.cli.Main platform disableItem \
    --itemId 'KyesQNzl' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'KQxUyAaU' \
    > test.out 2>&1
eval_tap $? 125 'DisableItem' test.out

#- 126 GetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform getItemDynamicData \
    --itemId '2PKbvsce' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 126 'GetItemDynamicData' test.out

#- 127 EnableItem
./ng net.accelbyte.sdk.cli.Main platform enableItem \
    --itemId 'VoEBITbE' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'IfQr5LfG' \
    > test.out 2>&1
eval_tap $? 127 'EnableItem' test.out

#- 128 FeatureItem
./ng net.accelbyte.sdk.cli.Main platform featureItem \
    --feature 'ya2GfHPE' \
    --itemId 'llir52kD' \
    --namespace "$AB_NAMESPACE" \
    --storeId '3ZbN6Ln0' \
    > test.out 2>&1
eval_tap $? 128 'FeatureItem' test.out

#- 129 DefeatureItem
./ng net.accelbyte.sdk.cli.Main platform defeatureItem \
    --feature 'wTWLh9so' \
    --itemId 'GaGhmrtM' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'o55V5ZG6' \
    > test.out 2>&1
eval_tap $? 129 'DefeatureItem' test.out

#- 130 GetLocaleItem
./ng net.accelbyte.sdk.cli.Main platform getLocaleItem \
    --itemId 'PA4aw9Iw' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'gDEFQYpC' \
    --populateBundle  \
    --region 'di45jrn8' \
    --storeId '3pd0Qe4M' \
    > test.out 2>&1
eval_tap $? 130 'GetLocaleItem' test.out

#- 131 UpdateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform updateItemPurchaseCondition \
    --itemId '8hJTK0vY' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'jlKp3swu' \
    --body '{"purchaseCondition": {"conditionGroups": [{"operator": "or", "predicates": [{"anyOf": 79, "comparison": "isLessThan", "name": "Hf6xseW0", "predicateType": "SeasonPassPredicate", "value": "xuY2qhag", "values": ["2bxVkjoN", "fRf3y0ra", "wq6Bmw7A"]}, {"anyOf": 63, "comparison": "isGreaterThanOrEqual", "name": "K3JpKjsJ", "predicateType": "SeasonTierPredicate", "value": "GLQKYrxk", "values": ["bdSKunOj", "ddUyLIr7", "YWPo9SJN"]}, {"anyOf": 6, "comparison": "isNot", "name": "jIiDQgAW", "predicateType": "SeasonTierPredicate", "value": "qD6v34l7", "values": ["bMiAwZgA", "O5cDMiy9", "5J9zTMk1"]}]}, {"operator": "and", "predicates": [{"anyOf": 88, "comparison": "isGreaterThan", "name": "wa7OnquM", "predicateType": "SeasonPassPredicate", "value": "EVXP4mqC", "values": ["dukDAp37", "4ClnQmVI", "WhRBrzkt"]}, {"anyOf": 11, "comparison": "isLessThan", "name": "Re80k4oR", "predicateType": "SeasonTierPredicate", "value": "GDivoGCj", "values": ["YfenKgl2", "SZMBWHPF", "btKjC0Z9"]}, {"anyOf": 97, "comparison": "excludes", "name": "mgoNDBK1", "predicateType": "SeasonTierPredicate", "value": "BCSwjja3", "values": ["CSLzNlO5", "eAoz1k2t", "IetnUClQ"]}]}, {"operator": "or", "predicates": [{"anyOf": 46, "comparison": "isLessThanOrEqual", "name": "5gxbkyhf", "predicateType": "SeasonTierPredicate", "value": "rFMnNP1G", "values": ["u6O3DtVD", "WqhApOWY", "6Cgrguzz"]}, {"anyOf": 39, "comparison": "isNot", "name": "obwvW0Vh", "predicateType": "EntitlementPredicate", "value": "owcp863I", "values": ["kLulJBw3", "hbM8cw4l", "V4iXcUZK"]}, {"anyOf": 84, "comparison": "isLessThan", "name": "HiqW9gxI", "predicateType": "SeasonPassPredicate", "value": "WCBSgvUF", "values": ["JC98bHDl", "BOsmCUIB", "bdL0Kfmv"]}]}]}}' \
    > test.out 2>&1
eval_tap $? 131 'UpdateItemPurchaseCondition' test.out

#- 132 ReturnItem
./ng net.accelbyte.sdk.cli.Main platform returnItem \
    --itemId 'qSM9APXp' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "g1cTsqtV"}' \
    > test.out 2>&1
eval_tap $? 132 'ReturnItem' test.out

#- 133 QueryKeyGroups
./ng net.accelbyte.sdk.cli.Main platform queryKeyGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '11' \
    --name 'WIoqxPtc' \
    --offset '5' \
    --tag 'IjjcBStU' \
    > test.out 2>&1
eval_tap $? 133 'QueryKeyGroups' test.out

#- 134 CreateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform createKeyGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "72MZ6Rg1", "name": "n9QrP7Kk", "status": "ACTIVE", "tags": ["dXus7gwj", "UlPstplS", "pdRLNa8N"]}' \
    > test.out 2>&1
eval_tap $? 134 'CreateKeyGroup' test.out

#- 135 GetKeyGroupByBoothName
eval_tap 0 135 'GetKeyGroupByBoothName # SKIP deprecated' test.out

#- 136 GetKeyGroup
./ng net.accelbyte.sdk.cli.Main platform getKeyGroup \
    --keyGroupId 'XPN4rdWx' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 136 'GetKeyGroup' test.out

#- 137 UpdateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform updateKeyGroup \
    --keyGroupId 'VQLppdLI' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "Iuc6ileB", "name": "tdHtZYlt", "status": "ACTIVE", "tags": ["zRwMT72h", "oCVGjrBD", "fMaAs7cn"]}' \
    > test.out 2>&1
eval_tap $? 137 'UpdateKeyGroup' test.out

#- 138 GetKeyGroupDynamic
./ng net.accelbyte.sdk.cli.Main platform getKeyGroupDynamic \
    --keyGroupId '8f3497Pl' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 138 'GetKeyGroupDynamic' test.out

#- 139 ListKeys
./ng net.accelbyte.sdk.cli.Main platform listKeys \
    --keyGroupId 'DArl7bPd' \
    --namespace "$AB_NAMESPACE" \
    --limit '60' \
    --offset '5' \
    --status 'ACTIVE' \
    > test.out 2>&1
eval_tap $? 139 'ListKeys' test.out

#- 140 UploadKeys
./ng net.accelbyte.sdk.cli.Main platform uploadKeys \
    --keyGroupId 'uLGVkH1c' \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 140 'UploadKeys' test.out

#- 141 QueryOrders
./ng net.accelbyte.sdk.cli.Main platform queryOrders \
    --namespace "$AB_NAMESPACE" \
    --endTime 'OJqX1T42' \
    --limit '56' \
    --offset '24' \
    --orderNos '6BPvaWzP,K8vzBvJe,LA12f6rC' \
    --sortBy 'NcTP4vKA' \
    --startTime 'DGeg0VpF' \
    --status 'INIT' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 141 'QueryOrders' test.out

#- 142 GetOrderStatistics
./ng net.accelbyte.sdk.cli.Main platform getOrderStatistics \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 142 'GetOrderStatistics' test.out

#- 143 GetOrder
./ng net.accelbyte.sdk.cli.Main platform getOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo '8eLXxvPu' \
    > test.out 2>&1
eval_tap $? 143 'GetOrder' test.out

#- 144 RefundOrder
./ng net.accelbyte.sdk.cli.Main platform refundOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'hZsTPEiP' \
    --body '{"description": "bXmzQ08B"}' \
    > test.out 2>&1
eval_tap $? 144 'RefundOrder' test.out

#- 145 GetPaymentCallbackConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentCallbackConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 145 'GetPaymentCallbackConfig' test.out

#- 146 UpdatePaymentCallbackConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentCallbackConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"dryRun": false, "notifyUrl": "oXHkyljE", "privateKey": "YeYCkX2Z"}' \
    > test.out 2>&1
eval_tap $? 146 'UpdatePaymentCallbackConfig' test.out

#- 147 QueryPaymentNotifications
./ng net.accelbyte.sdk.cli.Main platform queryPaymentNotifications \
    --namespace "$AB_NAMESPACE" \
    --endDate 'fjgN1qrA' \
    --externalId 'fiT3lrXi' \
    --limit '66' \
    --notificationSource 'CHECKOUT' \
    --notificationType '4KaBNwid' \
    --offset '86' \
    --paymentOrderNo 'XVaSqmMk' \
    --startDate '9o5rnzNy' \
    --status 'WARN' \
    > test.out 2>&1
eval_tap $? 147 'QueryPaymentNotifications' test.out

#- 148 QueryPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform queryPaymentOrders \
    --namespace "$AB_NAMESPACE" \
    --channel 'EXTERNAL' \
    --extTxId 'TrYVMMDj' \
    --limit '57' \
    --offset '44' \
    --status 'CHARGE_FAILED' \
    > test.out 2>&1
eval_tap $? 148 'QueryPaymentOrders' test.out

#- 149 CreatePaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform createPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --body '{"currencyCode": "wuRGGxIV", "currencyNamespace": "pzH7HVwg", "customParameters": {"V5xGO62Z": {}, "nyoQkjga": {}, "Xeq8iFMA": {}}, "description": "hsFJAm3X", "extOrderNo": "KFbDfpHd", "extUserId": "o78lRAoI", "itemType": "MEDIA", "language": "hMzQ_682", "metadata": {"oUR3LZwG": "gskcgmNw", "BvAKuf5r": "IE9kTWlp", "OSrQOhGq": "woj39HSW"}, "notifyUrl": "RIt56Ry1", "omitNotification": true, "platform": "CcR0rRNy", "price": 54, "recurringPaymentOrderNo": "ACx25LZu", "region": "Zy1jRjoN", "returnUrl": "YVnrHBpy", "sandbox": false, "sku": "OQQYrMDz", "subscriptionId": "U7oxjU2Y", "targetNamespace": "pg9Fpzc3", "targetUserId": "FWK9252a", "title": "E6d8Z9rt"}' \
    > test.out 2>&1
eval_tap $? 149 'CreatePaymentOrderByDedicated' test.out

#- 150 ListExtOrderNoByExtTxId
./ng net.accelbyte.sdk.cli.Main platform listExtOrderNoByExtTxId \
    --namespace "$AB_NAMESPACE" \
    --extTxId 'qsJ0B97F' \
    > test.out 2>&1
eval_tap $? 150 'ListExtOrderNoByExtTxId' test.out

#- 151 GetPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'gkd5FToB' \
    > test.out 2>&1
eval_tap $? 151 'GetPaymentOrder' test.out

#- 152 ChargePaymentOrder
./ng net.accelbyte.sdk.cli.Main platform chargePaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'EkUMBbzo' \
    --body '{"extTxId": "wYe7FaeX", "paymentMethod": "yf7pfpLv", "paymentProvider": "XSOLLA"}' \
    > test.out 2>&1
eval_tap $? 152 'ChargePaymentOrder' test.out

#- 153 RefundPaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform refundPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'I57p9AXA' \
    --body '{"description": "XHUpeFS5"}' \
    > test.out 2>&1
eval_tap $? 153 'RefundPaymentOrderByDedicated' test.out

#- 154 SimulatePaymentOrderNotification
./ng net.accelbyte.sdk.cli.Main platform simulatePaymentOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'mSkrJaC4' \
    --body '{"amount": 80, "currencyCode": "cYfKDfC3", "notifyType": "REFUND", "paymentProvider": "PAYPAL", "salesTax": 72, "vat": 6}' \
    > test.out 2>&1
eval_tap $? 154 'SimulatePaymentOrderNotification' test.out

#- 155 GetPaymentOrderChargeStatus
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrderChargeStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '9Ppzwrke' \
    > test.out 2>&1
eval_tap $? 155 'GetPaymentOrderChargeStatus' test.out

#- 156 GetPlatformEntitlementConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformEntitlementConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Other' \
    > test.out 2>&1
eval_tap $? 156 'GetPlatformEntitlementConfig' test.out

#- 157 UpdatePlatformEntitlementConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformEntitlementConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Xbox' \
    --body '{"allowedPlatformOrigins": ["Playstation", "Twitch", "IOS"]}' \
    > test.out 2>&1
eval_tap $? 157 'UpdatePlatformEntitlementConfig' test.out

#- 158 GetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Nintendo' \
    > test.out 2>&1
eval_tap $? 158 'GetPlatformWalletConfig' test.out

#- 159 UpdatePlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Other' \
    --body '{"allowedBalanceOrigins": ["GooglePlay", "Twitch", "IOS"]}' \
    > test.out 2>&1
eval_tap $? 159 'UpdatePlatformWalletConfig' test.out

#- 160 ResetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform resetPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Nintendo' \
    > test.out 2>&1
eval_tap $? 160 'ResetPlatformWalletConfig' test.out

#- 161 GetRevocationConfig
./ng net.accelbyte.sdk.cli.Main platform getRevocationConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 161 'GetRevocationConfig' test.out

#- 162 UpdateRevocationConfig
./ng net.accelbyte.sdk.cli.Main platform updateRevocationConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"entitlement": {"consumable": {"enabled": true, "strategy": "CUSTOM"}, "durable": {"enabled": true, "strategy": "REVOKE_OR_REPORT"}}, "wallet": {"enabled": true, "strategy": "REVOKE_OR_REPORT"}}' \
    > test.out 2>&1
eval_tap $? 162 'UpdateRevocationConfig' test.out

#- 163 DeleteRevocationConfig
./ng net.accelbyte.sdk.cli.Main platform deleteRevocationConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 163 'DeleteRevocationConfig' test.out

#- 164 QueryRevocationHistories
./ng net.accelbyte.sdk.cli.Main platform queryRevocationHistories \
    --namespace "$AB_NAMESPACE" \
    --endTime 'CnCoVt3V' \
    --limit '67' \
    --offset '55' \
    --source 'ORDER' \
    --startTime 'tfrNUXbD' \
    --status 'FAIL' \
    --transactionId 'wrS6LvGD' \
    --userId '6DNSHOr6' \
    > test.out 2>&1
eval_tap $? 164 'QueryRevocationHistories' test.out

#- 165 GetRevocationPluginConfig
./ng net.accelbyte.sdk.cli.Main platform getRevocationPluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 165 'GetRevocationPluginConfig' test.out

#- 166 UpdateRevocationPluginConfig
./ng net.accelbyte.sdk.cli.Main platform updateRevocationPluginConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appConfig": {"appName": "Th2DI2SF"}, "customConfig": {"connectionType": "INSECURE", "grpcServerAddress": "3kfbx569"}, "extendType": "APP"}' \
    > test.out 2>&1
eval_tap $? 166 'UpdateRevocationPluginConfig' test.out

#- 167 DeleteRevocationPluginConfig
./ng net.accelbyte.sdk.cli.Main platform deleteRevocationPluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 167 'DeleteRevocationPluginConfig' test.out

#- 168 UploadRevocationPluginConfigCert
./ng net.accelbyte.sdk.cli.Main platform uploadRevocationPluginConfigCert \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 168 'UploadRevocationPluginConfigCert' test.out

#- 169 CreateReward
./ng net.accelbyte.sdk.cli.Main platform createReward \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "Of2jqDoO", "eventTopic": "ApW6gcm2", "maxAwarded": 76, "maxAwardedPerUser": 68, "namespaceExpression": "UsrQVgao", "rewardCode": "ML6nSrKg", "rewardConditions": [{"condition": "pL9Wp0oI", "conditionName": "0rBTM92m", "eventName": "iM8tA3mF", "rewardItems": [{"duration": 16, "endDate": "1987-06-10T00:00:00Z", "itemId": "eGKjZhuX", "quantity": 27}, {"duration": 88, "endDate": "1983-12-28T00:00:00Z", "itemId": "VI6g0lYx", "quantity": 64}, {"duration": 1, "endDate": "1982-06-25T00:00:00Z", "itemId": "8DSL5nAk", "quantity": 10}]}, {"condition": "Xvb5Ucvx", "conditionName": "GSLWzW2E", "eventName": "qUaHL8sD", "rewardItems": [{"duration": 90, "endDate": "1992-01-29T00:00:00Z", "itemId": "EqHdxXy3", "quantity": 22}, {"duration": 16, "endDate": "1975-04-04T00:00:00Z", "itemId": "wEdEV44Z", "quantity": 80}, {"duration": 95, "endDate": "1990-06-11T00:00:00Z", "itemId": "fueKaIaz", "quantity": 78}]}, {"condition": "ets5SzvN", "conditionName": "C9daQXFL", "eventName": "PT0b5zKp", "rewardItems": [{"duration": 72, "endDate": "1993-09-15T00:00:00Z", "itemId": "f2ufTnZK", "quantity": 31}, {"duration": 98, "endDate": "1971-11-07T00:00:00Z", "itemId": "qOjozQGf", "quantity": 54}, {"duration": 22, "endDate": "1980-08-04T00:00:00Z", "itemId": "BXR10VqW", "quantity": 68}]}], "userIdExpression": "ysyGuCjl"}' \
    > test.out 2>&1
eval_tap $? 169 'CreateReward' test.out

#- 170 QueryRewards
./ng net.accelbyte.sdk.cli.Main platform queryRewards \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'mVeULUxo' \
    --limit '61' \
    --offset '26' \
    --sortBy 'rewardCode:desc,namespace:desc' \
    > test.out 2>&1
eval_tap $? 170 'QueryRewards' test.out

#- 171 ExportRewards
./ng net.accelbyte.sdk.cli.Main platform exportRewards \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 171 'ExportRewards' test.out

#- 172 ImportRewards
./ng net.accelbyte.sdk.cli.Main platform importRewards \
    --namespace "$AB_NAMESPACE" \
    --replaceExisting  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 172 'ImportRewards' test.out

#- 173 GetReward
./ng net.accelbyte.sdk.cli.Main platform getReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'PU3wRo9K' \
    > test.out 2>&1
eval_tap $? 173 'GetReward' test.out

#- 174 UpdateReward
./ng net.accelbyte.sdk.cli.Main platform updateReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'yJMqTW7t' \
    --body '{"description": "SR4EtH8A", "eventTopic": "cmTLV5Vz", "maxAwarded": 87, "maxAwardedPerUser": 26, "namespaceExpression": "aQVtZWDA", "rewardCode": "a9Ke2u5Q", "rewardConditions": [{"condition": "iPofFG9j", "conditionName": "w38nFsab", "eventName": "0IYV3vh7", "rewardItems": [{"duration": 45, "endDate": "1992-03-04T00:00:00Z", "itemId": "ebdk8R3o", "quantity": 41}, {"duration": 60, "endDate": "1999-09-16T00:00:00Z", "itemId": "nzSbWysY", "quantity": 58}, {"duration": 16, "endDate": "1972-01-28T00:00:00Z", "itemId": "RxcFVR16", "quantity": 37}]}, {"condition": "l2zm24fQ", "conditionName": "jAgtDVct", "eventName": "NpIrr44k", "rewardItems": [{"duration": 79, "endDate": "1998-03-10T00:00:00Z", "itemId": "ZRiykYXN", "quantity": 42}, {"duration": 13, "endDate": "1986-05-01T00:00:00Z", "itemId": "043q0FCT", "quantity": 86}, {"duration": 43, "endDate": "1987-06-19T00:00:00Z", "itemId": "rlqsnrFt", "quantity": 89}]}, {"condition": "SEkht0vk", "conditionName": "rXqWSuaD", "eventName": "XUDPacRI", "rewardItems": [{"duration": 84, "endDate": "1988-07-17T00:00:00Z", "itemId": "Z9Gg2ixy", "quantity": 33}, {"duration": 65, "endDate": "1973-12-23T00:00:00Z", "itemId": "Q85lYVop", "quantity": 9}, {"duration": 25, "endDate": "1989-01-11T00:00:00Z", "itemId": "eCGozV31", "quantity": 73}]}], "userIdExpression": "NGxf42S8"}' \
    > test.out 2>&1
eval_tap $? 174 'UpdateReward' test.out

#- 175 DeleteReward
./ng net.accelbyte.sdk.cli.Main platform deleteReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'yS8G31rB' \
    > test.out 2>&1
eval_tap $? 175 'DeleteReward' test.out

#- 176 CheckEventCondition
./ng net.accelbyte.sdk.cli.Main platform checkEventCondition \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'fo8VZDOE' \
    --body '{"payload": {"ooYrMNZn": {}, "RtyTawCr": {}, "HbHljnMK": {}}}' \
    > test.out 2>&1
eval_tap $? 176 'CheckEventCondition' test.out

#- 177 DeleteRewardConditionRecord
./ng net.accelbyte.sdk.cli.Main platform deleteRewardConditionRecord \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'V6oqmQqi' \
    --body '{"conditionName": "bdeCR0Hh", "userId": "ZTXzfEmC"}' \
    > test.out 2>&1
eval_tap $? 177 'DeleteRewardConditionRecord' test.out

#- 178 QuerySections
./ng net.accelbyte.sdk.cli.Main platform querySections \
    --namespace "$AB_NAMESPACE" \
    --end 'xg8zJRSp' \
    --limit '61' \
    --offset '45' \
    --start 'hgCP4LZH' \
    --storeId 'c8tsAy43' \
    --viewId '38BqGRlu' \
    > test.out 2>&1
eval_tap $? 178 'QuerySections' test.out

#- 179 CreateSection
./ng net.accelbyte.sdk.cli.Main platform createSection \
    --namespace "$AB_NAMESPACE" \
    --storeId 'SfqqzaI8' \
    --body '{"active": true, "displayOrder": 27, "endDate": "1989-03-05T00:00:00Z", "ext": {"RnGH24R4": {}, "X1TujoWx": {}, "48HITTAG": {}}, "fixedPeriodRotationConfig": {"backfillType": "NONE", "duration": 93, "itemCount": 25, "rule": "SEQUENCE"}, "items": [{"id": "Yy43XTYn", "sku": "mB6Jfq75"}, {"id": "eqAsXAV6", "sku": "uqGmiVFK"}, {"id": "VnjTCBRj", "sku": "J8ryOabV"}], "localizations": {"e2MPOkmy": {"description": "WqPoHLWg", "localExt": {"sE76t7VQ": {}, "pBzDIv2o": {}, "0CXkgDE6": {}}, "longDescription": "527MlZWY", "title": "ztcuIop8"}, "hadr55XZ": {"description": "jwQ5FJUn", "localExt": {"lMX6H38h": {}, "kVkxpo3x": {}, "W9kglPuT": {}}, "longDescription": "jhZLXek1", "title": "zZOkmwbH"}, "unf7vb9T": {"description": "iUjT4zCC", "localExt": {"VRYvuK4Z": {}, "L9reeqO0": {}, "mj40JYOP": {}}, "longDescription": "ZB1Gz2Ba", "title": "Yp3D0fZz"}}, "name": "HLvTw0hV", "rotationType": "FIXED_PERIOD", "startDate": "1983-10-09T00:00:00Z", "viewId": "Zl17vqIr"}' \
    > test.out 2>&1
eval_tap $? 179 'CreateSection' test.out

#- 180 PurgeExpiredSection
./ng net.accelbyte.sdk.cli.Main platform purgeExpiredSection \
    --namespace "$AB_NAMESPACE" \
    --storeId 'm8qZV1pv' \
    > test.out 2>&1
eval_tap $? 180 'PurgeExpiredSection' test.out

#- 181 GetSection
./ng net.accelbyte.sdk.cli.Main platform getSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId '87Z4FpoO' \
    --storeId 'SAYCzQk3' \
    > test.out 2>&1
eval_tap $? 181 'GetSection' test.out

#- 182 UpdateSection
./ng net.accelbyte.sdk.cli.Main platform updateSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'nLLhHv1Z' \
    --storeId 'yBA5hPcK' \
    --body '{"active": true, "displayOrder": 94, "endDate": "1978-09-24T00:00:00Z", "ext": {"jiqdeAaT": {}, "Xa3vXZNM": {}, "V9lppJda": {}}, "fixedPeriodRotationConfig": {"backfillType": "CUSTOM", "duration": 4, "itemCount": 92, "rule": "SEQUENCE"}, "items": [{"id": "CLfA308J", "sku": "Y6uHn0Kx"}, {"id": "ss7R6NWG", "sku": "krTcoRJ2"}, {"id": "all5fBIE", "sku": "FiRjSlvf"}], "localizations": {"9MbWDWox": {"description": "MYAZn3j3", "localExt": {"73114Bzc": {}, "UtUtuAj2": {}, "6yOb6asB": {}}, "longDescription": "bkWl4XQw", "title": "RjY59o1A"}, "u1vpHTV6": {"description": "2XE9vfOb", "localExt": {"oKNTdhp6": {}, "qbmGCyKr": {}, "cV8THSyz": {}}, "longDescription": "qgM49Lzt", "title": "L5jwuVGs"}, "qeXtHtKm": {"description": "Ng9d5BOl", "localExt": {"VsdggbMu": {}, "ZxFqLBFE": {}, "MkUclQ3c": {}}, "longDescription": "jTpr12Cc", "title": "ubexac9Y"}}, "name": "SgbtMsrr", "rotationType": "NONE", "startDate": "1996-08-04T00:00:00Z", "viewId": "KbQAbhM6"}' \
    > test.out 2>&1
eval_tap $? 182 'UpdateSection' test.out

#- 183 DeleteSection
./ng net.accelbyte.sdk.cli.Main platform deleteSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'rTGuIqWg' \
    --storeId '3UTCDeCj' \
    > test.out 2>&1
eval_tap $? 183 'DeleteSection' test.out

#- 184 ListStores
./ng net.accelbyte.sdk.cli.Main platform listStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 184 'ListStores' test.out

#- 185 CreateStore
./ng net.accelbyte.sdk.cli.Main platform createStore \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultLanguage": "kgvKSWAv", "defaultRegion": "NhyTsbbI", "description": "iPIQA8SX", "supportedLanguages": ["DYKfLljX", "teZ2ApLP", "jdSuA9uN"], "supportedRegions": ["AJFxf3nK", "dxrhcSr1", "7xQfKdjK"], "title": "LMtxSUtx"}' \
    > test.out 2>&1
eval_tap $? 185 'CreateStore' test.out

#- 186 ImportStore
eval_tap 0 186 'ImportStore # SKIP deprecated' test.out

#- 187 GetPublishedStore
./ng net.accelbyte.sdk.cli.Main platform getPublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 187 'GetPublishedStore' test.out

#- 188 DeletePublishedStore
./ng net.accelbyte.sdk.cli.Main platform deletePublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 188 'DeletePublishedStore' test.out

#- 189 GetPublishedStoreBackup
./ng net.accelbyte.sdk.cli.Main platform getPublishedStoreBackup \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 189 'GetPublishedStoreBackup' test.out

#- 190 RollbackPublishedStore
./ng net.accelbyte.sdk.cli.Main platform rollbackPublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 190 'RollbackPublishedStore' test.out

#- 191 GetStore
./ng net.accelbyte.sdk.cli.Main platform getStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'OwejYfMn' \
    > test.out 2>&1
eval_tap $? 191 'GetStore' test.out

#- 192 UpdateStore
./ng net.accelbyte.sdk.cli.Main platform updateStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'YxME8CKm' \
    --body '{"defaultLanguage": "trPvCJhS", "defaultRegion": "c6QUwZxK", "description": "AEvcwAVE", "supportedLanguages": ["oJhtxwbt", "OGVHgdM7", "dpPJ3OQO"], "supportedRegions": ["zxYB3Obb", "mZX6GosP", "0jA1IZCo"], "title": "omdT9lfw"}' \
    > test.out 2>&1
eval_tap $? 192 'UpdateStore' test.out

#- 193 DeleteStore
./ng net.accelbyte.sdk.cli.Main platform deleteStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ItquUnS5' \
    > test.out 2>&1
eval_tap $? 193 'DeleteStore' test.out

#- 194 QueryChanges
./ng net.accelbyte.sdk.cli.Main platform queryChanges \
    --namespace "$AB_NAMESPACE" \
    --storeId 'NaYarVxW' \
    --action 'UPDATE' \
    --itemSku 'yMyW2tIX' \
    --itemType 'EXTENSION' \
    --limit '42' \
    --offset '68' \
    --selected  \
    --sortBy 'updatedAt,createdAt,createdAt:desc' \
    --status 'PUBLISHED' \
    --type 'VIEW' \
    --updatedAtEnd 'k2OnKIT8' \
    --updatedAtStart '99kJZ7Q2' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 194 'QueryChanges' test.out

#- 195 PublishAll
./ng net.accelbyte.sdk.cli.Main platform publishAll \
    --namespace "$AB_NAMESPACE" \
    --storeId 'eg4msy5h' \
    > test.out 2>&1
eval_tap $? 195 'PublishAll' test.out

#- 196 PublishSelected
./ng net.accelbyte.sdk.cli.Main platform publishSelected \
    --namespace "$AB_NAMESPACE" \
    --storeId 'uR7XTw0m' \
    > test.out 2>&1
eval_tap $? 196 'PublishSelected' test.out

#- 197 SelectAllRecords
./ng net.accelbyte.sdk.cli.Main platform selectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId '8TasMa7q' \
    > test.out 2>&1
eval_tap $? 197 'SelectAllRecords' test.out

#- 198 SelectAllRecordsByCriteria
./ng net.accelbyte.sdk.cli.Main platform selectAllRecordsByCriteria \
    --namespace "$AB_NAMESPACE" \
    --storeId 'uWGpciEW' \
    --action 'DELETE' \
    --itemSku 'Etp4I8gK' \
    --itemType 'APP' \
    --selected  \
    --type 'ITEM' \
    --updatedAtEnd 'EmStPtlV' \
    --updatedAtStart '1Yg6CSgF' \
    > test.out 2>&1
eval_tap $? 198 'SelectAllRecordsByCriteria' test.out

#- 199 GetStatistic
./ng net.accelbyte.sdk.cli.Main platform getStatistic \
    --namespace "$AB_NAMESPACE" \
    --storeId '6IlIudWl' \
    --action 'CREATE' \
    --itemSku 'A4NlMbDR' \
    --itemType 'SEASON' \
    --type 'ITEM' \
    --updatedAtEnd 'th3EDwnF' \
    --updatedAtStart 'TVCs53m7' \
    > test.out 2>&1
eval_tap $? 199 'GetStatistic' test.out

#- 200 UnselectAllRecords
./ng net.accelbyte.sdk.cli.Main platform unselectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'PSwDbj2y' \
    > test.out 2>&1
eval_tap $? 200 'UnselectAllRecords' test.out

#- 201 SelectRecord
./ng net.accelbyte.sdk.cli.Main platform selectRecord \
    --changeId 'nCOyJ9UY' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'CrpqT84f' \
    > test.out 2>&1
eval_tap $? 201 'SelectRecord' test.out

#- 202 UnselectRecord
./ng net.accelbyte.sdk.cli.Main platform unselectRecord \
    --changeId 'v9IpJTxf' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'UcLiwi28' \
    > test.out 2>&1
eval_tap $? 202 'UnselectRecord' test.out

#- 203 CloneStore
./ng net.accelbyte.sdk.cli.Main platform cloneStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'svUVvecN' \
    --targetStoreId 'UZ0FHZE4' \
    > test.out 2>&1
eval_tap $? 203 'CloneStore' test.out

#- 204 ExportStore
eval_tap 0 204 'ExportStore # SKIP deprecated' test.out

#- 205 QuerySubscriptions
./ng net.accelbyte.sdk.cli.Main platform querySubscriptions \
    --namespace "$AB_NAMESPACE" \
    --chargeStatus 'CHARGED' \
    --itemId 'f3dmYL6d' \
    --limit '92' \
    --offset '36' \
    --sku '2ZcJuacF' \
    --status 'EXPIRED' \
    --subscribedBy 'USER' \
    --userId 'JO7Y5ube' \
    > test.out 2>&1
eval_tap $? 205 'QuerySubscriptions' test.out

#- 206 RecurringChargeSubscription
./ng net.accelbyte.sdk.cli.Main platform recurringChargeSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'GfgWm2E8' \
    > test.out 2>&1
eval_tap $? 206 'RecurringChargeSubscription' test.out

#- 207 GetTicketDynamic
./ng net.accelbyte.sdk.cli.Main platform getTicketDynamic \
    --boothName 'qIpMX5Qk' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 207 'GetTicketDynamic' test.out

#- 208 DecreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform decreaseTicketSale \
    --boothName 'PxsgfotP' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "61Yo2u0L"}' \
    > test.out 2>&1
eval_tap $? 208 'DecreaseTicketSale' test.out

#- 209 GetTicketBoothID
./ng net.accelbyte.sdk.cli.Main platform getTicketBoothID \
    --boothName 'iQG4shZm' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 209 'GetTicketBoothID' test.out

#- 210 IncreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform increaseTicketSale \
    --boothName 'BtaQ0drQ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 71, "orderNo": "IQU8Rk1u"}' \
    > test.out 2>&1
eval_tap $? 210 'IncreaseTicketSale' test.out

#- 211 Commit
./ng net.accelbyte.sdk.cli.Main platform commit \
    --namespace "$AB_NAMESPACE" \
    --body '{"actions": [{"operations": [{"creditPayload": {"balanceOrigin": "Other", "count": 73, "currencyCode": "tlllbeds", "expireAt": "1971-10-06T00:00:00Z"}, "debitPayload": {"count": 70, "currencyCode": "L8wDkarW", "walletPlatform": "Playstation"}, "fulFillItemPayload": {"count": 46, "entitlementOrigin": "Steam", "itemIdentity": "5sn71ILW", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 12, "entitlementId": "KUD0zcPE"}, "type": "FULFILL_ITEM"}, {"creditPayload": {"balanceOrigin": "Other", "count": 91, "currencyCode": "dtG1Jyg2", "expireAt": "1998-07-26T00:00:00Z"}, "debitPayload": {"count": 33, "currencyCode": "fdx9MSoB", "walletPlatform": "Other"}, "fulFillItemPayload": {"count": 96, "entitlementOrigin": "IOS", "itemIdentity": "D01XX0dY", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 6, "entitlementId": "NiBIOGDd"}, "type": "REVOKE_ENTITLEMENT"}, {"creditPayload": {"balanceOrigin": "Xbox", "count": 5, "currencyCode": "owQ5doyO", "expireAt": "1995-05-30T00:00:00Z"}, "debitPayload": {"count": 82, "currencyCode": "CobZHoTp", "walletPlatform": "Epic"}, "fulFillItemPayload": {"count": 69, "entitlementOrigin": "Xbox", "itemIdentity": "TqnKP2IG", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 48, "entitlementId": "giQ1eLW8"}, "type": "FULFILL_ITEM"}], "userId": "QnsyVtxW"}, {"operations": [{"creditPayload": {"balanceOrigin": "System", "count": 43, "currencyCode": "seIIjx5x", "expireAt": "1977-02-09T00:00:00Z"}, "debitPayload": {"count": 87, "currencyCode": "MyqfF2e7", "walletPlatform": "Epic"}, "fulFillItemPayload": {"count": 80, "entitlementOrigin": "Twitch", "itemIdentity": "Zuzszl1B", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 49, "entitlementId": "3NvvLSmZ"}, "type": "REVOKE_ENTITLEMENT"}, {"creditPayload": {"balanceOrigin": "GooglePlay", "count": 1, "currencyCode": "HyTOHjIy", "expireAt": "1988-11-06T00:00:00Z"}, "debitPayload": {"count": 11, "currencyCode": "1nDYq2Lc", "walletPlatform": "IOS"}, "fulFillItemPayload": {"count": 50, "entitlementOrigin": "IOS", "itemIdentity": "OF3SN9FV", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 68, "entitlementId": "vOrPDnvS"}, "type": "FULFILL_ITEM"}, {"creditPayload": {"balanceOrigin": "Playstation", "count": 33, "currencyCode": "DiCKqell", "expireAt": "1992-08-21T00:00:00Z"}, "debitPayload": {"count": 18, "currencyCode": "N4B0A2yM", "walletPlatform": "Nintendo"}, "fulFillItemPayload": {"count": 25, "entitlementOrigin": "Nintendo", "itemIdentity": "wbl1C1xZ", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 73, "entitlementId": "5fPiUEte"}, "type": "FULFILL_ITEM"}], "userId": "QkGJlvq1"}, {"operations": [{"creditPayload": {"balanceOrigin": "Steam", "count": 41, "currencyCode": "9GJCTSxd", "expireAt": "1979-10-25T00:00:00Z"}, "debitPayload": {"count": 74, "currencyCode": "He76sKhX", "walletPlatform": "Epic"}, "fulFillItemPayload": {"count": 5, "entitlementOrigin": "Playstation", "itemIdentity": "AoWiN8KC", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 3, "entitlementId": "LLHUDhMk"}, "type": "REVOKE_ENTITLEMENT"}, {"creditPayload": {"balanceOrigin": "Xbox", "count": 98, "currencyCode": "EghUscaU", "expireAt": "1994-04-16T00:00:00Z"}, "debitPayload": {"count": 84, "currencyCode": "V6ct9qCi", "walletPlatform": "Playstation"}, "fulFillItemPayload": {"count": 40, "entitlementOrigin": "GooglePlay", "itemIdentity": "38iLXHlH", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 49, "entitlementId": "0JPTvp7Z"}, "type": "DEBIT_WALLET"}, {"creditPayload": {"balanceOrigin": "Playstation", "count": 21, "currencyCode": "JcLr8Rea", "expireAt": "1977-02-11T00:00:00Z"}, "debitPayload": {"count": 80, "currencyCode": "Q369T9aZ", "walletPlatform": "Nintendo"}, "fulFillItemPayload": {"count": 91, "entitlementOrigin": "IOS", "itemIdentity": "7yn51SvY", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 9, "entitlementId": "WDxyoJPy"}, "type": "CREDIT_WALLET"}], "userId": "lRhDnuR3"}], "metadata": {"YKhsOHJY": {}, "eWJqd7z9": {}, "5EVyReKj": {}}, "needPreCheck": false, "transactionId": "lrDOvsRM", "type": "m6s5H5Lp"}' \
    > test.out 2>&1
eval_tap $? 211 'Commit' test.out

#- 212 GetTradeHistoryByCriteria
./ng net.accelbyte.sdk.cli.Main platform getTradeHistoryByCriteria \
    --namespace "$AB_NAMESPACE" \
    --limit '39' \
    --offset '13' \
    --status 'INIT' \
    --type 'L1seQBqj' \
    --userId 'iZNBqooR' \
    > test.out 2>&1
eval_tap $? 212 'GetTradeHistoryByCriteria' test.out

#- 213 GetTradeHistoryByTransactionId
./ng net.accelbyte.sdk.cli.Main platform getTradeHistoryByTransactionId \
    --namespace "$AB_NAMESPACE" \
    --transactionId 'jL8Zf7SX' \
    > test.out 2>&1
eval_tap $? 213 'GetTradeHistoryByTransactionId' test.out

#- 214 UnlockSteamUserAchievement
./ng net.accelbyte.sdk.cli.Main platform unlockSteamUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'c8nCbYTT' \
    --body '{"achievements": [{"id": "TNP5bQWs", "value": 2}, {"id": "EFyubkhz", "value": 94}, {"id": "8cdTpo2O", "value": 78}], "steamUserId": "MpOEigE0"}' \
    > test.out 2>&1
eval_tap $? 214 'UnlockSteamUserAchievement' test.out

#- 215 GetXblUserAchievements
./ng net.accelbyte.sdk.cli.Main platform getXblUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'Pn9EgT9M' \
    --xboxUserId 'ohV8U4kR' \
    > test.out 2>&1
eval_tap $? 215 'GetXblUserAchievements' test.out

#- 216 UpdateXblUserAchievement
./ng net.accelbyte.sdk.cli.Main platform updateXblUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'bZN60uXj' \
    --body '{"achievements": [{"id": "VlvWgbH3", "percentComplete": 22}, {"id": "hYSe82kP", "percentComplete": 91}, {"id": "tnxhFPs1", "percentComplete": 9}], "serviceConfigId": "L9J4I1nY", "titleId": "Yr0piqNb", "xboxUserId": "fKlIMdMS"}' \
    > test.out 2>&1
eval_tap $? 216 'UpdateXblUserAchievement' test.out

#- 217 AnonymizeCampaign
./ng net.accelbyte.sdk.cli.Main platform anonymizeCampaign \
    --namespace "$AB_NAMESPACE" \
    --userId '79eN2l7J' \
    > test.out 2>&1
eval_tap $? 217 'AnonymizeCampaign' test.out

#- 218 AnonymizeEntitlement
./ng net.accelbyte.sdk.cli.Main platform anonymizeEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZIgE9Iok' \
    > test.out 2>&1
eval_tap $? 218 'AnonymizeEntitlement' test.out

#- 219 AnonymizeFulfillment
./ng net.accelbyte.sdk.cli.Main platform anonymizeFulfillment \
    --namespace "$AB_NAMESPACE" \
    --userId 'j7pwx9BH' \
    > test.out 2>&1
eval_tap $? 219 'AnonymizeFulfillment' test.out

#- 220 AnonymizeIntegration
./ng net.accelbyte.sdk.cli.Main platform anonymizeIntegration \
    --namespace "$AB_NAMESPACE" \
    --userId 'by7D4sIE' \
    > test.out 2>&1
eval_tap $? 220 'AnonymizeIntegration' test.out

#- 221 AnonymizeOrder
./ng net.accelbyte.sdk.cli.Main platform anonymizeOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'XxipwVmb' \
    > test.out 2>&1
eval_tap $? 221 'AnonymizeOrder' test.out

#- 222 AnonymizePayment
./ng net.accelbyte.sdk.cli.Main platform anonymizePayment \
    --namespace "$AB_NAMESPACE" \
    --userId '9te0OTlF' \
    > test.out 2>&1
eval_tap $? 222 'AnonymizePayment' test.out

#- 223 AnonymizeRevocation
./ng net.accelbyte.sdk.cli.Main platform anonymizeRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId '6kG3IvCy' \
    > test.out 2>&1
eval_tap $? 223 'AnonymizeRevocation' test.out

#- 224 AnonymizeSubscription
./ng net.accelbyte.sdk.cli.Main platform anonymizeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId '4ginkFsI' \
    > test.out 2>&1
eval_tap $? 224 'AnonymizeSubscription' test.out

#- 225 AnonymizeWallet
./ng net.accelbyte.sdk.cli.Main platform anonymizeWallet \
    --namespace "$AB_NAMESPACE" \
    --userId 'u5qReacy' \
    > test.out 2>&1
eval_tap $? 225 'AnonymizeWallet' test.out

#- 226 GetUserDLCByPlatform
./ng net.accelbyte.sdk.cli.Main platform getUserDLCByPlatform \
    --namespace "$AB_NAMESPACE" \
    --userId 'oj8TCaCJ' \
    --type 'STEAM' \
    > test.out 2>&1
eval_tap $? 226 'GetUserDLCByPlatform' test.out

#- 227 GetUserDLC
./ng net.accelbyte.sdk.cli.Main platform getUserDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'Vd6z3I9t' \
    --type 'OCULUS' \
    > test.out 2>&1
eval_tap $? 227 'GetUserDLC' test.out

#- 228 QueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'FiaRiFl1' \
    --activeOnly  \
    --appType 'DEMO' \
    --entitlementClazz 'CODE' \
    --entitlementName '4X8o0trq' \
    --features 'pgTW9nQN,nwqYeilB,XKP63JMx' \
    --fuzzyMatchName  \
    --itemId 'IX9lsBPp,4NZRZ2qx,QH30GYu8' \
    --limit '33' \
    --offset '22' \
    --origin 'Playstation' \
    > test.out 2>&1
eval_tap $? 228 'QueryUserEntitlements' test.out

#- 229 GrantUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform grantUserEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'Sb98RQDQ' \
    --body '[{"endDate": "1983-03-04T00:00:00Z", "grantedCode": "x2dbsoG0", "itemId": "ucvBdV59", "itemNamespace": "mniiaIG7", "language": "DWEM-tsTk", "origin": "System", "quantity": 22, "region": "L0PX5o4n", "source": "ACHIEVEMENT", "startDate": "1992-12-23T00:00:00Z", "storeId": "BxRv6SUu"}, {"endDate": "1986-11-12T00:00:00Z", "grantedCode": "EW6mWSfm", "itemId": "YMRagmD2", "itemNamespace": "vQUh4WBb", "language": "abWV_kTZT", "origin": "Nintendo", "quantity": 26, "region": "sfCNdzo2", "source": "ACHIEVEMENT", "startDate": "1986-07-20T00:00:00Z", "storeId": "NjNNiFe1"}, {"endDate": "1971-10-27T00:00:00Z", "grantedCode": "sUAlH4wY", "itemId": "fhh7EBhz", "itemNamespace": "7IuxxMG2", "language": "IM-Uu", "origin": "GooglePlay", "quantity": 80, "region": "exlaqQFH", "source": "OTHER", "startDate": "1992-05-16T00:00:00Z", "storeId": "vqpxs8tB"}]' \
    > test.out 2>&1
eval_tap $? 229 'GrantUserEntitlement' test.out

#- 230 GetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'F8x7dneW' \
    --activeOnly  \
    --appId '5ug1xxON' \
    > test.out 2>&1
eval_tap $? 230 'GetUserAppEntitlementByAppId' test.out

#- 231 QueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId '2OEj6ADm' \
    --activeOnly  \
    --limit '34' \
    --offset '98' \
    --appType 'DLC' \
    > test.out 2>&1
eval_tap $? 231 'QueryUserEntitlementsByAppType' test.out

#- 232 GetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'fkKnQnIT' \
    --activeOnly  \
    --entitlementClazz 'ENTITLEMENT' \
    --platform 'Sd9RtYtW' \
    --itemId 'yp89HgfX' \
    > test.out 2>&1
eval_tap $? 232 'GetUserEntitlementByItemId' test.out

#- 233 GetUserActiveEntitlementsByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserActiveEntitlementsByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'Qgzxgmem' \
    --ids 'I5BTVp90,9zvfs3xK,9yeCaMJd' \
    --platform '7tNmI21W' \
    > test.out 2>&1
eval_tap $? 233 'GetUserActiveEntitlementsByItemIds' test.out

#- 234 GetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'qp7Z10gX' \
    --activeOnly  \
    --entitlementClazz 'ENTITLEMENT' \
    --platform 'zmF9X0Tv' \
    --sku 'P0DNIJ2i' \
    > test.out 2>&1
eval_tap $? 234 'GetUserEntitlementBySku' test.out

#- 235 ExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'xlUXbtNC' \
    --appIds '8wZvsJR7,UK2pARnt,ift3ZzN0' \
    --itemIds 'iiHe4wA5,s3ytQ6fy,sul5YGb6' \
    --platform 'MTnn9Ci6' \
    --skus 'EJ6lkPtW,GR27Yrad,qxcCXcHo' \
    > test.out 2>&1
eval_tap $? 235 'ExistsAnyUserActiveEntitlement' test.out

#- 236 ExistsAnyUserActiveEntitlementByItemIds
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlementByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'PCv7MzON' \
    --platform 'Vcj6ZdIl' \
    --itemIds 'ToOsWboe,VC1v1irl,xSGUgjXd' \
    > test.out 2>&1
eval_tap $? 236 'ExistsAnyUserActiveEntitlementByItemIds' test.out

#- 237 GetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'MRbp51J4' \
    --appId '6agSS52k' \
    > test.out 2>&1
eval_tap $? 237 'GetUserAppEntitlementOwnershipByAppId' test.out

#- 238 GetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'C9d9RsGp' \
    --entitlementClazz 'MEDIA' \
    --platform 'fiGzJf5S' \
    --itemId 'HcxhIoIz' \
    > test.out 2>&1
eval_tap $? 238 'GetUserEntitlementOwnershipByItemId' test.out

#- 239 GetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'xSAQ0u3D' \
    --ids 'nHiyjxai,uEIdUfQC,KkEZXVjr' \
    --platform 'vHz0Xs3e' \
    > test.out 2>&1
eval_tap $? 239 'GetUserEntitlementOwnershipByItemIds' test.out

#- 240 GetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'poXLH0Wb' \
    --entitlementClazz 'SUBSCRIPTION' \
    --platform 'JycQ0SGL' \
    --sku 'tBVrx3hW' \
    > test.out 2>&1
eval_tap $? 240 'GetUserEntitlementOwnershipBySku' test.out

#- 241 RevokeAllEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeAllEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'HqgzCOyl' \
    > test.out 2>&1
eval_tap $? 241 'RevokeAllEntitlements' test.out

#- 242 RevokeUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'r7m8pbwB' \
    --entitlementIds 'PUVWnPin' \
    > test.out 2>&1
eval_tap $? 242 'RevokeUserEntitlements' test.out

#- 243 GetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlement \
    --entitlementId 'Md9sM10J' \
    --namespace "$AB_NAMESPACE" \
    --userId 'qWlRfr7f' \
    > test.out 2>&1
eval_tap $? 243 'GetUserEntitlement' test.out

#- 244 UpdateUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform updateUserEntitlement \
    --entitlementId 'uwAlyJz5' \
    --namespace "$AB_NAMESPACE" \
    --userId 'umkfxrp2' \
    --body '{"endDate": "1981-09-15T00:00:00Z", "nullFieldList": ["DQWWXVQM", "A7JM1OLs", "pBPbdmDy"], "origin": "IOS", "reason": "z0v7hdIJ", "startDate": "1971-08-31T00:00:00Z", "status": "SOLD", "useCount": 0}' \
    > test.out 2>&1
eval_tap $? 244 'UpdateUserEntitlement' test.out

#- 245 ConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform consumeUserEntitlement \
    --entitlementId 'knJN6uMS' \
    --namespace "$AB_NAMESPACE" \
    --userId '1pNGqngL' \
    --body '{"options": ["RsHMX6wQ", "gexVx5dF", "5kZ8l6sB"], "platform": "bzYjVmze", "requestId": "0H6JFova", "useCount": 39}' \
    > test.out 2>&1
eval_tap $? 245 'ConsumeUserEntitlement' test.out

#- 246 DisableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform disableUserEntitlement \
    --entitlementId '37TtYq5K' \
    --namespace "$AB_NAMESPACE" \
    --userId 'iOcMTMrW' \
    > test.out 2>&1
eval_tap $? 246 'DisableUserEntitlement' test.out

#- 247 EnableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform enableUserEntitlement \
    --entitlementId 'YaRyEqAi' \
    --namespace "$AB_NAMESPACE" \
    --userId 'NWwAsgkW' \
    > test.out 2>&1
eval_tap $? 247 'EnableUserEntitlement' test.out

#- 248 GetUserEntitlementHistories
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementHistories \
    --entitlementId 'HTjcrng3' \
    --namespace "$AB_NAMESPACE" \
    --userId 'pQDl0vpv' \
    > test.out 2>&1
eval_tap $? 248 'GetUserEntitlementHistories' test.out

#- 249 RevokeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlement \
    --entitlementId 'hDOOTArE' \
    --namespace "$AB_NAMESPACE" \
    --userId 'IegDsF2p' \
    > test.out 2>&1
eval_tap $? 249 'RevokeUserEntitlement' test.out

#- 250 RevokeUserEntitlementByUseCount
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlementByUseCount \
    --entitlementId 'HNgX6YwH' \
    --namespace "$AB_NAMESPACE" \
    --userId 'EH1j2Yh9' \
    --body '{"reason": "FYD0JtN6", "useCount": 65}' \
    > test.out 2>&1
eval_tap $? 250 'RevokeUserEntitlementByUseCount' test.out

#- 251 PreCheckRevokeUserEntitlementByUseCount
./ng net.accelbyte.sdk.cli.Main platform preCheckRevokeUserEntitlementByUseCount \
    --entitlementId 'bDev5dKp' \
    --namespace "$AB_NAMESPACE" \
    --userId 'PNx499P0' \
    --quantity '39' \
    > test.out 2>&1
eval_tap $? 251 'PreCheckRevokeUserEntitlementByUseCount' test.out

#- 252 RevokeUseCount
eval_tap 0 252 'RevokeUseCount # SKIP deprecated' test.out

#- 253 SellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform sellUserEntitlement \
    --entitlementId '1a5DImTZ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'A2P8irrW' \
    --body '{"platform": "Y1aG4gIM", "requestId": "6pKdXfRr", "useCount": 82}' \
    > test.out 2>&1
eval_tap $? 253 'SellUserEntitlement' test.out

#- 254 FulfillItem
./ng net.accelbyte.sdk.cli.Main platform fulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'rYpeQujT' \
    --body '{"duration": 41, "endDate": "1974-10-03T00:00:00Z", "entitlementOrigin": "IOS", "itemId": "v2PjiKFR", "itemSku": "lWYf9OFR", "language": "qj1HaNVp", "metadata": {"SiAccyE8": {}, "8SGm6Gxh": {}, "0Tugt746": {}}, "order": {"currency": {"currencyCode": "LCIcyVOg", "currencySymbol": "EiVwt5rP", "currencyType": "REAL", "decimals": 23, "namespace": "znkigS5u"}, "ext": {"PVH430bt": {}, "hiMjWEHb": {}, "j3bVIu7R": {}}, "free": true}, "orderNo": "C4Dah8C7", "origin": "System", "overrideBundleItemQty": {"ANKAO9SR": 17, "dI4moafk": 82, "BujmABpF": 59}, "quantity": 13, "region": "uoE94au2", "source": "ACHIEVEMENT", "startDate": "1982-02-16T00:00:00Z", "storeId": "fjTkfCDN"}' \
    > test.out 2>&1
eval_tap $? 254 'FulfillItem' test.out

#- 255 RedeemCode
./ng net.accelbyte.sdk.cli.Main platform redeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'UE0tbT3M' \
    --body '{"code": "whFyJq7N", "language": "sZye", "region": "lqa7fCOw"}' \
    > test.out 2>&1
eval_tap $? 255 'RedeemCode' test.out

#- 256 PreCheckFulfillItem
./ng net.accelbyte.sdk.cli.Main platform preCheckFulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId '76YEdGoH' \
    --body '{"itemId": "EyqUHXwV", "itemSku": "PIeZIjK8", "quantity": 71}' \
    > test.out 2>&1
eval_tap $? 256 'PreCheckFulfillItem' test.out

#- 257 FulfillRewards
./ng net.accelbyte.sdk.cli.Main platform fulfillRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'kY7Oxd1t' \
    --body '{"entitlementOrigin": "Steam", "metadata": {"OsQglWbb": {}, "66fd4Rzs": {}, "0wm4owjq": {}}, "origin": "Epic", "rewards": [{"currency": {"currencyCode": "itKDMCWw", "namespace": "OUAc0mWU"}, "item": {"itemId": "vrM2Ehj9", "itemSku": "plR71WOJ", "itemType": "ShWlp8WH"}, "quantity": 93, "type": "CURRENCY"}, {"currency": {"currencyCode": "H704OmVi", "namespace": "RijXC14t"}, "item": {"itemId": "3FcbzjIm", "itemSku": "tTUpnLj2", "itemType": "rIjK4ZzB"}, "quantity": 49, "type": "ITEM"}, {"currency": {"currencyCode": "HUIRTAqt", "namespace": "F7UVaENO"}, "item": {"itemId": "qYKZqbq1", "itemSku": "ZYDEZxnW", "itemType": "EH6P3IDC"}, "quantity": 12, "type": "CURRENCY"}], "source": "REFERRAL_BONUS", "transactionId": "4INwnTcJ"}' \
    > test.out 2>&1
eval_tap $? 257 'FulfillRewards' test.out

#- 258 QueryUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'vroOlXG5' \
    --endTime 'pJ46ZPmn' \
    --limit '29' \
    --offset '52' \
    --productId '24e2htvK' \
    --startTime '3YnAyIdY' \
    --status 'FAILED' \
    --type 'XBOX' \
    > test.out 2>&1
eval_tap $? 258 'QueryUserIAPOrders' test.out

#- 259 QueryAllUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryAllUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'sbeVDM22' \
    > test.out 2>&1
eval_tap $? 259 'QueryAllUserIAPOrders' test.out

#- 260 QueryUserIAPConsumeHistory
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPConsumeHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'r2iu7sBo' \
    --endTime '5p6Mqf5e' \
    --limit '93' \
    --offset '71' \
    --startTime 'XTonAUXy' \
    --status 'SUCCESS' \
    --type 'PLAYSTATION' \
    > test.out 2>&1
eval_tap $? 260 'QueryUserIAPConsumeHistory' test.out

#- 261 MockFulfillIAPItem
./ng net.accelbyte.sdk.cli.Main platform mockFulfillIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'wH5lxT22' \
    --body '{"itemIdentityType": "ITEM_ID", "language": "UtKA_VbjF", "productId": "AJ092BB4", "region": "6jrdjn2P", "transactionId": "rMLOIXMB", "type": "PLAYSTATION"}' \
    > test.out 2>&1
eval_tap $? 261 'MockFulfillIAPItem' test.out

#- 262 QueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'ulxAky7j' \
    --itemId 'hAqOqi5m' \
    --limit '65' \
    --offset '56' \
    --status 'FULFILL_FAILED' \
    > test.out 2>&1
eval_tap $? 262 'QueryUserOrders' test.out

#- 263 AdminCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform adminCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'BHPHiaxy' \
    --body '{"currencyCode": "dFjn0jJG", "currencyNamespace": "U9u1zFBr", "discountedPrice": 30, "ext": {"sNplqfjE": {}, "w8ZUg9lF": {}, "XZY8smCN": {}}, "itemId": "qM4gdlcz", "language": "kYE7v64C", "options": {"skipPriceValidation": false}, "platform": "Playstation", "price": 59, "quantity": 9, "region": "PTOFuh5E", "returnUrl": "Bu2dDHfJ", "sandbox": false, "sectionId": "Q83AjEfE"}' \
    > test.out 2>&1
eval_tap $? 263 'AdminCreateUserOrder' test.out

#- 264 CountOfPurchasedItem
./ng net.accelbyte.sdk.cli.Main platform countOfPurchasedItem \
    --namespace "$AB_NAMESPACE" \
    --userId '7wOu1tVn' \
    --itemId 'CrOfme79' \
    > test.out 2>&1
eval_tap $? 264 'CountOfPurchasedItem' test.out

#- 265 GetUserOrder
./ng net.accelbyte.sdk.cli.Main platform getUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'YtoNEuyh' \
    --userId 'W5ln4Skw' \
    > test.out 2>&1
eval_tap $? 265 'GetUserOrder' test.out

#- 266 UpdateUserOrderStatus
./ng net.accelbyte.sdk.cli.Main platform updateUserOrderStatus \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'RgVYR7EW' \
    --userId 'qruyi6tD' \
    --body '{"status": "CLOSED", "statusReason": "po0CfRz8"}' \
    > test.out 2>&1
eval_tap $? 266 'UpdateUserOrderStatus' test.out

#- 267 FulfillUserOrder
./ng net.accelbyte.sdk.cli.Main platform fulfillUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'ofI60bFe' \
    --userId 'vtAHMePn' \
    > test.out 2>&1
eval_tap $? 267 'FulfillUserOrder' test.out

#- 268 GetUserOrderGrant
./ng net.accelbyte.sdk.cli.Main platform getUserOrderGrant \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'ZosjD71o' \
    --userId '9KKcUiq5' \
    > test.out 2>&1
eval_tap $? 268 'GetUserOrderGrant' test.out

#- 269 GetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform getUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'AjmUSJq1' \
    --userId 'KLg5ONs2' \
    > test.out 2>&1
eval_tap $? 269 'GetUserOrderHistories' test.out

#- 270 ProcessUserOrderNotification
./ng net.accelbyte.sdk.cli.Main platform processUserOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --orderNo '3mzL92xi' \
    --userId 'E8as1MYW' \
    --body '{"additionalData": {"cardSummary": "v9ckDCqh"}, "authorisedTime": "1976-10-19T00:00:00Z", "chargebackReversedTime": "1993-11-17T00:00:00Z", "chargebackTime": "1990-11-15T00:00:00Z", "chargedTime": "1987-06-29T00:00:00Z", "createdTime": "1976-05-08T00:00:00Z", "currency": {"currencyCode": "7z5T4Yt9", "currencySymbol": "H3ZBH4Wd", "currencyType": "VIRTUAL", "decimals": 94, "namespace": "fDN4z0Sh"}, "customParameters": {"o1ti0kai": {}, "lfZvbcGD": {}, "w9LO3F6B": {}}, "extOrderNo": "SuFhU0FN", "extTxId": "c3Lv5C4k", "extUserId": "SCWTFxC9", "issuedAt": "1976-09-06T00:00:00Z", "metadata": {"RpsqNoPP": "2PGInpNB", "ka8eHYOm": "qC1S3pYM", "1O1KC30s": "WXOflcv9"}, "namespace": "aPOYc6jr", "nonceStr": "U8LjnEsl", "paymentMethod": "U8RgyI1S", "paymentMethodFee": 11, "paymentOrderNo": "gIP7OgRm", "paymentProvider": "CHECKOUT", "paymentProviderFee": 42, "paymentStationUrl": "9ZmzHKxm", "price": 61, "refundedTime": "1971-09-05T00:00:00Z", "salesTax": 31, "sandbox": true, "sku": "Iowczs11", "status": "CHARGEBACK", "statusReason": "xPt9Bd5S", "subscriptionId": "skqsLNf6", "subtotalPrice": 96, "targetNamespace": "1ZwbdLAc", "targetUserId": "S8VMG0bd", "tax": 2, "totalPrice": 32, "totalTax": 10, "txEndTime": "1990-01-18T00:00:00Z", "type": "SZR6xfFl", "userId": "WwtUQg5y", "vat": 86}' \
    > test.out 2>&1
eval_tap $? 270 'ProcessUserOrderNotification' test.out

#- 271 DownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform downloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'hDhsUkjj' \
    --userId 'EtZ74jmI' \
    > test.out 2>&1
eval_tap $? 271 'DownloadUserOrderReceipt' test.out

#- 272 CreateUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform createUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'jqU26GvB' \
    --body '{"currencyCode": "hdMZQrsp", "currencyNamespace": "1smcWyTt", "customParameters": {"dNUqZwWX": {}, "ejdcsAIl": {}, "h5AVGFm7": {}}, "description": "6jdgo171", "extOrderNo": "oYe305tY", "extUserId": "9O5N21Ha", "itemType": "CODE", "language": "SaP-htKh_303", "metadata": {"W6dWsycC": "n3KiYxcC", "oJCNwXOl": "UfjQkpdI", "qyGFm4YJ": "oveUpcoE"}, "notifyUrl": "y0AZIg9o", "omitNotification": true, "platform": "FxPhEm14", "price": 79, "recurringPaymentOrderNo": "vi69Rory", "region": "ouz4irIk", "returnUrl": "TsovlvjM", "sandbox": false, "sku": "hMfiMvj4", "subscriptionId": "AroFwaky", "title": "p4ioUdV4"}' \
    > test.out 2>&1
eval_tap $? 272 'CreateUserPaymentOrder' test.out

#- 273 RefundUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform refundUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'qtL1uZeV' \
    --userId 'CW3jyncM' \
    --body '{"description": "1BZ8KEmU"}' \
    > test.out 2>&1
eval_tap $? 273 'RefundUserPaymentOrder' test.out

#- 274 ApplyUserRedemption
./ng net.accelbyte.sdk.cli.Main platform applyUserRedemption \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZwQvWW7w' \
    --body '{"code": "nWBZrZCM", "orderNo": "dUdCNaLH"}' \
    > test.out 2>&1
eval_tap $? 274 'ApplyUserRedemption' test.out

#- 275 DoRevocation
./ng net.accelbyte.sdk.cli.Main platform doRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId 'OR4GHBrp' \
    --body '{"meta": {"S7Hmt5y0": {}, "O9YHRZQF": {}, "GhtRz8NC": {}}, "revokeEntries": [{"currency": {"balanceOrigin": "System", "currencyCode": "ajtPgoZW", "namespace": "wjWtwedc"}, "entitlement": {"entitlementId": "dJbffbNg"}, "item": {"entitlementOrigin": "Steam", "itemIdentity": "TXytUakv", "itemIdentityType": "ITEM_SKU", "origin": "Oculus"}, "quantity": 48, "type": "ENTITLEMENT"}, {"currency": {"balanceOrigin": "Other", "currencyCode": "aMerttwd", "namespace": "JIvnYIrx"}, "entitlement": {"entitlementId": "1264WHJH"}, "item": {"entitlementOrigin": "GooglePlay", "itemIdentity": "3SqkHFg6", "itemIdentityType": "ITEM_SKU", "origin": "Nintendo"}, "quantity": 4, "type": "CURRENCY"}, {"currency": {"balanceOrigin": "GooglePlay", "currencyCode": "iKq2IyU8", "namespace": "sJ23xcCG"}, "entitlement": {"entitlementId": "eF19XSy0"}, "item": {"entitlementOrigin": "System", "itemIdentity": "kqYdULkD", "itemIdentityType": "ITEM_SKU", "origin": "Twitch"}, "quantity": 91, "type": "ITEM"}], "source": "DLC", "transactionId": "YuVGeW1e"}' \
    > test.out 2>&1
eval_tap $? 275 'DoRevocation' test.out

#- 276 RegisterXblSessions
./ng net.accelbyte.sdk.cli.Main platform registerXblSessions \
    --namespace "$AB_NAMESPACE" \
    --userId 'sxpDIu4O' \
    --body '{"gameSessionId": "mZRa8Fpb", "payload": {"goFH5yts": {}, "36scxLRP": {}, "srkINeb8": {}}, "scid": "f642ZeHQ", "sessionTemplateName": "X5X95Y8o"}' \
    > test.out 2>&1
eval_tap $? 276 'RegisterXblSessions' test.out

#- 277 QueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform queryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId '3NbMT3aF' \
    --chargeStatus 'RECURRING_CHARGING' \
    --itemId 'vdDO8hc2' \
    --limit '95' \
    --offset '60' \
    --sku 'h02g8H4G' \
    --status 'EXPIRED' \
    --subscribedBy 'USER' \
    > test.out 2>&1
eval_tap $? 277 'QueryUserSubscriptions' test.out

#- 278 GetUserSubscriptionActivities
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionActivities \
    --namespace "$AB_NAMESPACE" \
    --userId 'YPWwwzsT' \
    --excludeSystem  \
    --limit '88' \
    --offset '63' \
    --subscriptionId 'ccBbFYzm' \
    > test.out 2>&1
eval_tap $? 278 'GetUserSubscriptionActivities' test.out

#- 279 PlatformSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform platformSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'GMs2zzBv' \
    --body '{"grantDays": 75, "itemId": "IuXxfjy5", "language": "cDCzmbVG", "reason": "4k3M5moA", "region": "cD6YL2CH", "source": "wscFY5n7"}' \
    > test.out 2>&1
eval_tap $? 279 'PlatformSubscribeSubscription' test.out

#- 280 CheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform checkUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'iW3E4mO5' \
    --itemId 'LwWeuCAU' \
    > test.out 2>&1
eval_tap $? 280 'CheckUserSubscriptionSubscribableByItemId' test.out

#- 281 GetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform getUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'uYe0gxHp' \
    --userId 'pz4fGaip' \
    > test.out 2>&1
eval_tap $? 281 'GetUserSubscription' test.out

#- 282 DeleteUserSubscription
./ng net.accelbyte.sdk.cli.Main platform deleteUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'KtwJ6kG8' \
    --userId '9Dpz6NRz' \
    > test.out 2>&1
eval_tap $? 282 'DeleteUserSubscription' test.out

#- 283 CancelSubscription
./ng net.accelbyte.sdk.cli.Main platform cancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'UcheJGPT' \
    --userId 'OW1lSuJj' \
    --force  \
    --body '{"immediate": true, "reason": "3lSaGeU6"}' \
    > test.out 2>&1
eval_tap $? 283 'CancelSubscription' test.out

#- 284 GrantDaysToSubscription
./ng net.accelbyte.sdk.cli.Main platform grantDaysToSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'kUDJLGUr' \
    --userId 'Q2uv9Vmh' \
    --body '{"grantDays": 84, "reason": "jcQ11gT8"}' \
    > test.out 2>&1
eval_tap $? 284 'GrantDaysToSubscription' test.out

#- 285 GetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'dqiNTqk5' \
    --userId 'pQ48DReC' \
    --excludeFree  \
    --limit '0' \
    --offset '46' \
    > test.out 2>&1
eval_tap $? 285 'GetUserSubscriptionBillingHistories' test.out

#- 286 ProcessUserSubscriptionNotification
./ng net.accelbyte.sdk.cli.Main platform processUserSubscriptionNotification \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'NKUjW6oa' \
    --userId 'xkqOicKZ' \
    --body '{"additionalData": {"cardSummary": "kWhQQx4u"}, "authorisedTime": "1995-09-13T00:00:00Z", "chargebackReversedTime": "1985-06-13T00:00:00Z", "chargebackTime": "1985-01-17T00:00:00Z", "chargedTime": "1985-11-18T00:00:00Z", "createdTime": "1993-03-14T00:00:00Z", "currency": {"currencyCode": "696Es288", "currencySymbol": "1kir81gf", "currencyType": "VIRTUAL", "decimals": 27, "namespace": "y3NcOux2"}, "customParameters": {"8YXfdBCs": {}, "88K6ReOf": {}, "Sndd9oM2": {}}, "extOrderNo": "py8FaXdB", "extTxId": "7RhRfK6N", "extUserId": "FyQavNre", "issuedAt": "1991-07-20T00:00:00Z", "metadata": {"3q8uMQQj": "dLbx742X", "wEYUdA1p": "ANoEgUnJ", "cEbNbmdz": "LnQ3Oczg"}, "namespace": "CuPlcyu1", "nonceStr": "LYFFGoEM", "paymentMethod": "LH41I9Zl", "paymentMethodFee": 22, "paymentOrderNo": "wjLn3EQ8", "paymentProvider": "PAYPAL", "paymentProviderFee": 73, "paymentStationUrl": "FCOcIAOI", "price": 78, "refundedTime": "1990-03-05T00:00:00Z", "salesTax": 96, "sandbox": false, "sku": "InOUblKb", "status": "CHARGEBACK_REVERSED", "statusReason": "KdO5Un12", "subscriptionId": "o6QMyXGR", "subtotalPrice": 88, "targetNamespace": "D2h4dzVN", "targetUserId": "hav3WyMh", "tax": 77, "totalPrice": 88, "totalTax": 72, "txEndTime": "1992-07-04T00:00:00Z", "type": "OfIFTK7z", "userId": "qDQQVBLp", "vat": 68}' \
    > test.out 2>&1
eval_tap $? 286 'ProcessUserSubscriptionNotification' test.out

#- 287 AcquireUserTicket
./ng net.accelbyte.sdk.cli.Main platform acquireUserTicket \
    --boothName 'u836xsS7' \
    --namespace "$AB_NAMESPACE" \
    --userId 'x7kf4rpC' \
    --body '{"count": 50, "orderNo": "u5BPpp6r"}' \
    > test.out 2>&1
eval_tap $? 287 'AcquireUserTicket' test.out

#- 288 QueryUserCurrencyWallets
./ng net.accelbyte.sdk.cli.Main platform queryUserCurrencyWallets \
    --namespace "$AB_NAMESPACE" \
    --userId 'iwcwk1UO' \
    > test.out 2>&1
eval_tap $? 288 'QueryUserCurrencyWallets' test.out

#- 289 DebitUserWalletByCurrencyCode
./ng net.accelbyte.sdk.cli.Main platform debitUserWalletByCurrencyCode \
    --currencyCode 'DoLxSE2D' \
    --namespace "$AB_NAMESPACE" \
    --userId 'By8XAOes' \
    --body '{"allowOverdraft": false, "amount": 54, "balanceOrigin": "Steam", "balanceSource": "PAYMENT", "metadata": {"BL5JCVMm": {}, "AvtTn69d": {}, "93a0gdku": {}}, "reason": "UIwMaVNQ"}' \
    > test.out 2>&1
eval_tap $? 289 'DebitUserWalletByCurrencyCode' test.out

#- 290 ListUserCurrencyTransactions
./ng net.accelbyte.sdk.cli.Main platform listUserCurrencyTransactions \
    --currencyCode 'Y0o1ZFAB' \
    --namespace "$AB_NAMESPACE" \
    --userId 'hJ8nn5sM' \
    --limit '28' \
    --offset '81' \
    > test.out 2>&1
eval_tap $? 290 'ListUserCurrencyTransactions' test.out

#- 291 CheckBalance
./ng net.accelbyte.sdk.cli.Main platform checkBalance \
    --currencyCode 'sXqJ40x3' \
    --namespace "$AB_NAMESPACE" \
    --userId '6ulzoO2E' \
    --request '{"amount": 68, "debitBalanceSource": "TRADE", "metadata": {"gdcrRW3N": {}, "dR7NFon4": {}, "OqUzHut3": {}}, "reason": "Sz3keDVB", "walletPlatform": "Steam"}' \
    > test.out 2>&1
eval_tap $? 291 'CheckBalance' test.out

#- 292 CheckWallet
eval_tap 0 292 'CheckWallet # SKIP deprecated' test.out

#- 293 CreditUserWallet
./ng net.accelbyte.sdk.cli.Main platform creditUserWallet \
    --currencyCode 'lvC05nq0' \
    --namespace "$AB_NAMESPACE" \
    --userId 'jKfJgd6U' \
    --body '{"amount": 96, "expireAt": "1992-03-20T00:00:00Z", "metadata": {"S5UmYUxG": {}, "Q6waqMUt": {}, "rv6iTyOr": {}}, "origin": "Xbox", "reason": "SuYvz6wP", "source": "GIFT"}' \
    > test.out 2>&1
eval_tap $? 293 'CreditUserWallet' test.out

#- 294 DebitByWalletPlatform
./ng net.accelbyte.sdk.cli.Main platform debitByWalletPlatform \
    --currencyCode 'h5mmBCz8' \
    --namespace "$AB_NAMESPACE" \
    --userId 'tG08TXR1' \
    --request '{"amount": 43, "debitBalanceSource": "DLC_REVOCATION", "metadata": {"8LKByuue": {}, "NI45hS4C": {}, "V6XtUvJt": {}}, "reason": "9UxoaWCC", "walletPlatform": "IOS"}' \
    > test.out 2>&1
eval_tap $? 294 'DebitByWalletPlatform' test.out

#- 295 PayWithUserWallet
./ng net.accelbyte.sdk.cli.Main platform payWithUserWallet \
    --currencyCode 'XzGPRWTc' \
    --namespace "$AB_NAMESPACE" \
    --userId 'iW3Mzvl3' \
    --body '{"amount": 69, "metadata": {"VNluSC52": {}, "MAiZDSpT": {}, "t9QalE6c": {}}, "walletPlatform": "Nintendo"}' \
    > test.out 2>&1
eval_tap $? 295 'PayWithUserWallet' test.out

#- 296 GetUserWallet
eval_tap 0 296 'GetUserWallet # SKIP deprecated' test.out

#- 297 DebitUserWallet
eval_tap 0 297 'DebitUserWallet # SKIP deprecated' test.out

#- 298 DisableUserWallet
eval_tap 0 298 'DisableUserWallet # SKIP deprecated' test.out

#- 299 EnableUserWallet
eval_tap 0 299 'EnableUserWallet # SKIP deprecated' test.out

#- 300 ListUserWalletTransactions
eval_tap 0 300 'ListUserWalletTransactions # SKIP deprecated' test.out

#- 301 ListViews
./ng net.accelbyte.sdk.cli.Main platform listViews \
    --namespace "$AB_NAMESPACE" \
    --storeId 'JW1xcBEZ' \
    > test.out 2>&1
eval_tap $? 301 'ListViews' test.out

#- 302 CreateView
./ng net.accelbyte.sdk.cli.Main platform createView \
    --namespace "$AB_NAMESPACE" \
    --storeId 'SwfpO0ph' \
    --body '{"displayOrder": 40, "localizations": {"GoMioxZX": {"description": "RZ5inNpo", "localExt": {"yoZ7vSYi": {}, "DXJfmRzq": {}, "ht0DDGVB": {}}, "longDescription": "hbEeZGOf", "title": "ORyRddcx"}, "Ugf79BBM": {"description": "nCccdFo2", "localExt": {"qtV86VJz": {}, "U8TKI2Ta": {}, "qtoHi9hB": {}}, "longDescription": "OAaTMI8N", "title": "4SkXRbdJ"}, "paoEzH6y": {"description": "947dVKU1", "localExt": {"XacoHfHR": {}, "Brpi31SM": {}, "feR0RXQ5": {}}, "longDescription": "qKezDwyW", "title": "7Iz2Tmny"}}, "name": "HPMibaGU"}' \
    > test.out 2>&1
eval_tap $? 302 'CreateView' test.out

#- 303 GetView
./ng net.accelbyte.sdk.cli.Main platform getView \
    --namespace "$AB_NAMESPACE" \
    --viewId '9usNJATB' \
    --storeId 'RXEOqThV' \
    > test.out 2>&1
eval_tap $? 303 'GetView' test.out

#- 304 UpdateView
./ng net.accelbyte.sdk.cli.Main platform updateView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'jhcUhh2B' \
    --storeId 'YtJyTrJH' \
    --body '{"displayOrder": 96, "localizations": {"qMMnd5fk": {"description": "kH806gkZ", "localExt": {"sdFmX758": {}, "W6kMH6mU": {}, "EIEKJwbw": {}}, "longDescription": "RWdAlDLL", "title": "5EyeUExM"}, "FtJsVQyl": {"description": "CCBGcASs", "localExt": {"bdaBPGDQ": {}, "JhG5GxGm": {}, "8eu2nrqc": {}}, "longDescription": "jli8hBOY", "title": "J0zzLiBT"}, "sgFJ8WpU": {"description": "PnWNfWbt", "localExt": {"YvoJaJXq": {}, "MlKLL8XN": {}, "iCOFXMjz": {}}, "longDescription": "riHZA4B4", "title": "mIIUoMDF"}}, "name": "unRFi0kA"}' \
    > test.out 2>&1
eval_tap $? 304 'UpdateView' test.out

#- 305 DeleteView
./ng net.accelbyte.sdk.cli.Main platform deleteView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'vPVbFevT' \
    --storeId 'V1DkjiQ0' \
    > test.out 2>&1
eval_tap $? 305 'DeleteView' test.out

#- 306 QueryWallets
eval_tap 0 306 'QueryWallets # SKIP deprecated' test.out

#- 307 BulkCredit
./ng net.accelbyte.sdk.cli.Main platform bulkCredit \
    --namespace "$AB_NAMESPACE" \
    --body '[{"creditRequest": {"amount": 53, "expireAt": "1989-11-04T00:00:00Z", "metadata": {"prIHQn9A": {}, "J7weL78L": {}, "TnfRFrBu": {}}, "origin": "Steam", "reason": "HFZl3BYV", "source": "GIFT"}, "currencyCode": "WWy45Bo8", "userIds": ["WYvXdRyl", "vDrKK1ht", "wuTgwRgM"]}, {"creditRequest": {"amount": 38, "expireAt": "1973-03-21T00:00:00Z", "metadata": {"KfPGBYnx": {}, "dkuBjcjf": {}, "pZ9gxYMI": {}}, "origin": "System", "reason": "b3oBm7hA", "source": "GIFT"}, "currencyCode": "H4vBVsyd", "userIds": ["NlIXFHJy", "mxkx02W7", "r3JgcONs"]}, {"creditRequest": {"amount": 72, "expireAt": "1993-06-05T00:00:00Z", "metadata": {"gXPh8qvi": {}, "OrBXFEhD": {}, "c3Yxwv7R": {}}, "origin": "Playstation", "reason": "I0bgGyt1", "source": "PURCHASE"}, "currencyCode": "6ba8ircY", "userIds": ["vLr1p23q", "vgmzVsPQ", "uL35hvhQ"]}]' \
    > test.out 2>&1
eval_tap $? 307 'BulkCredit' test.out

#- 308 BulkDebit
./ng net.accelbyte.sdk.cli.Main platform bulkDebit \
    --namespace "$AB_NAMESPACE" \
    --body '[{"currencyCode": "L1gT9fhQ", "request": {"allowOverdraft": true, "amount": 26, "balanceOrigin": "Steam", "balanceSource": "ORDER_REVOCATION", "metadata": {"tbTrldms": {}, "aYrutExW": {}, "2wNJh1yX": {}}, "reason": "TI4XtFLZ"}, "userIds": ["bRQdscTu", "MEBug4EN", "U8Zt3STL"]}, {"currencyCode": "yiRv5Gbi", "request": {"allowOverdraft": true, "amount": 75, "balanceOrigin": "System", "balanceSource": "EXPIRATION", "metadata": {"zZJeeaaq": {}, "MeB1muj6": {}, "D2f2nOXA": {}}, "reason": "151um1jQ"}, "userIds": ["rsUhylo8", "PclQH2ac", "FThkiSbJ"]}, {"currencyCode": "Hh34rftV", "request": {"allowOverdraft": true, "amount": 42, "balanceOrigin": "Steam", "balanceSource": "EXPIRATION", "metadata": {"hhrq0RZZ": {}, "UIkBdFZU": {}, "qKvpcnu4": {}}, "reason": "ZbdfuSZn"}, "userIds": ["bMoAbQbT", "BvAyRfqm", "5ub3A6yl"]}]' \
    > test.out 2>&1
eval_tap $? 308 'BulkDebit' test.out

#- 309 GetWallet
eval_tap 0 309 'GetWallet # SKIP deprecated' test.out

#- 310 SyncOrders
./ng net.accelbyte.sdk.cli.Main platform syncOrders \
    --nextEvaluatedKey 'WbvFenRA' \
    --end 'C10NNubr' \
    --start 'c1TiohuL' \
    > test.out 2>&1
eval_tap $? 310 'SyncOrders' test.out

#- 311 TestAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfig \
    --sandbox  \
    --body '{"allowedPaymentMethods": ["XZcWYbA7", "kiMbZIEt", "W0p4e6b6"], "apiKey": "KdRxT2nu", "authoriseAsCapture": false, "blockedPaymentMethods": ["lb1dX5kc", "pQgx9och", "nprCAcxz"], "clientKey": "HjszwFqE", "dropInSettings": "Cv3fUrcd", "liveEndpointUrlPrefix": "BWVyRq7s", "merchantAccount": "ylLsazCc", "notificationHmacKey": "qW2aJVBC", "notificationPassword": "VyFfH7V8", "notificationUsername": "xwri1h63", "returnUrl": "IDWD3Q1S", "settings": "Y94HYxde"}' \
    > test.out 2>&1
eval_tap $? 311 'TestAdyenConfig' test.out

#- 312 TestAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfig \
    --sandbox  \
    --body '{"appId": "zdjQqCVc", "privateKey": "chEm70zD", "publicKey": "pdc1bTeZ", "returnUrl": "jqd1B1Fk"}' \
    > test.out 2>&1
eval_tap $? 312 'TestAliPayConfig' test.out

#- 313 TestCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfig \
    --sandbox  \
    --body '{"publicKey": "wfkt7gkl", "secretKey": "npSZSUSY"}' \
    > test.out 2>&1
eval_tap $? 313 'TestCheckoutConfig' test.out

#- 314 DebugMatchedPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentMerchantConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'rz7rIQkY' \
    > test.out 2>&1
eval_tap $? 314 'DebugMatchedPaymentMerchantConfig' test.out

#- 315 TestPayPalConfig
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfig \
    --sandbox  \
    --body '{"clientID": "o3GLZy6O", "clientSecret": "N0ZHEeKb", "returnUrl": "jnWjgSjB", "webHookId": "rjQl37Gl"}' \
    > test.out 2>&1
eval_tap $? 315 'TestPayPalConfig' test.out

#- 316 TestStripeConfig
./ng net.accelbyte.sdk.cli.Main platform testStripeConfig \
    --sandbox  \
    --body '{"allowedPaymentMethodTypes": ["sDeuVmzo", "PZwSwlq4", "e6W3Jr2R"], "publishableKey": "oAXDn9qj", "secretKey": "TxOy723z", "webhookSecret": "ztWkPry7"}' \
    > test.out 2>&1
eval_tap $? 316 'TestStripeConfig' test.out

#- 317 TestWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfig \
    --body '{"appId": "QUEv2psu", "key": "WdyFf6M4", "mchid": "WBbYDwMx", "returnUrl": "PRvnjtaS"}' \
    > test.out 2>&1
eval_tap $? 317 'TestWxPayConfig' test.out

#- 318 TestXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfig \
    --body '{"apiKey": "8XOvVcTS", "flowCompletionUrl": "zfvBBcdH", "merchantId": 79, "projectId": 77, "projectSecretKey": "IBay75sN"}' \
    > test.out 2>&1
eval_tap $? 318 'TestXsollaConfig' test.out

#- 319 GetPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentMerchantConfig \
    --id 'tICk0D6D' \
    > test.out 2>&1
eval_tap $? 319 'GetPaymentMerchantConfig' test.out

#- 320 UpdateAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform updateAdyenConfig \
    --id 'AKVERoU7' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethods": ["6Arotx2b", "v3U7Tszu", "ST0jO2NN"], "apiKey": "MHmsTJb2", "authoriseAsCapture": true, "blockedPaymentMethods": ["dordReMS", "DM6zjGYC", "6NwqV7SW"], "clientKey": "hcqqh3Vm", "dropInSettings": "FYgsNYcG", "liveEndpointUrlPrefix": "CoGUsJPF", "merchantAccount": "IleGkpVk", "notificationHmacKey": "BMltYM6f", "notificationPassword": "7CSeMTBz", "notificationUsername": "Qa0lwtxo", "returnUrl": "rg3xg3bK", "settings": "tbfudPzx"}' \
    > test.out 2>&1
eval_tap $? 320 'UpdateAdyenConfig' test.out

#- 321 TestAdyenConfigById
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfigById \
    --id '3gqWrytQ' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 321 'TestAdyenConfigById' test.out

#- 322 UpdateAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateAliPayConfig \
    --id 'tMz4elt1' \
    --sandbox  \
    --validate  \
    --body '{"appId": "NWp4kxex", "privateKey": "E9rPDQ7m", "publicKey": "mwOGsLua", "returnUrl": "pzVE3IYS"}' \
    > test.out 2>&1
eval_tap $? 322 'UpdateAliPayConfig' test.out

#- 323 TestAliPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfigById \
    --id '6OKL3lUG' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 323 'TestAliPayConfigById' test.out

#- 324 UpdateCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform updateCheckoutConfig \
    --id 'ZAaDu8hQ' \
    --sandbox  \
    --validate  \
    --body '{"publicKey": "9tBNgu43", "secretKey": "gnxOmN8t"}' \
    > test.out 2>&1
eval_tap $? 324 'UpdateCheckoutConfig' test.out

#- 325 TestCheckoutConfigById
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfigById \
    --id 'k3nWJdOx' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 325 'TestCheckoutConfigById' test.out

#- 326 UpdatePayPalConfig
./ng net.accelbyte.sdk.cli.Main platform updatePayPalConfig \
    --id 'Gi80jkHs' \
    --sandbox  \
    --validate  \
    --body '{"clientID": "Wmet7xr6", "clientSecret": "SUz0bUKM", "returnUrl": "Q6K0ZO5P", "webHookId": "dfNuPTJJ"}' \
    > test.out 2>&1
eval_tap $? 326 'UpdatePayPalConfig' test.out

#- 327 TestPayPalConfigById
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfigById \
    --id 'N1EF8dso' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 327 'TestPayPalConfigById' test.out

#- 328 UpdateStripeConfig
./ng net.accelbyte.sdk.cli.Main platform updateStripeConfig \
    --id 'MCPSWrgi' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethodTypes": ["TkSMwFEZ", "FgMOYyxM", "fO6jm6tK"], "publishableKey": "F1VLx66x", "secretKey": "eyDMVrB0", "webhookSecret": "oQt1S9o0"}' \
    > test.out 2>&1
eval_tap $? 328 'UpdateStripeConfig' test.out

#- 329 TestStripeConfigById
./ng net.accelbyte.sdk.cli.Main platform testStripeConfigById \
    --id 'hyJs8TgH' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 329 'TestStripeConfigById' test.out

#- 330 UpdateWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfig \
    --id 'fMAYsdVy' \
    --validate  \
    --body '{"appId": "vQAmtug0", "key": "4XBO09PY", "mchid": "qqeoyhDp", "returnUrl": "fYZjIyFH"}' \
    > test.out 2>&1
eval_tap $? 330 'UpdateWxPayConfig' test.out

#- 331 UpdateWxPayConfigCert
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfigCert \
    --id '1cGrPtEa' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 331 'UpdateWxPayConfigCert' test.out

#- 332 TestWxPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfigById \
    --id 'CA9vFFjd' \
    > test.out 2>&1
eval_tap $? 332 'TestWxPayConfigById' test.out

#- 333 UpdateXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaConfig \
    --id 'ovoU5t4X' \
    --validate  \
    --body '{"apiKey": "bZJay7RZ", "flowCompletionUrl": "XLFSKl7K", "merchantId": 89, "projectId": 25, "projectSecretKey": "5gVX33es"}' \
    > test.out 2>&1
eval_tap $? 333 'UpdateXsollaConfig' test.out

#- 334 TestXsollaConfigById
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfigById \
    --id 'EuHifnZf' \
    > test.out 2>&1
eval_tap $? 334 'TestXsollaConfigById' test.out

#- 335 UpdateXsollaUIConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaUIConfig \
    --id 'hJGwpiNY' \
    --body '{"device": "MOBILE", "showCloseButton": false, "size": "MEDIUM", "theme": "DEFAULT_DARK"}' \
    > test.out 2>&1
eval_tap $? 335 'UpdateXsollaUIConfig' test.out

#- 336 QueryPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform queryPaymentProviderConfig \
    --limit '5' \
    --namespace "$AB_NAMESPACE" \
    --offset '82' \
    --region 'hVuYmQG0' \
    > test.out 2>&1
eval_tap $? 336 'QueryPaymentProviderConfig' test.out

#- 337 CreatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform createPaymentProviderConfig \
    --body '{"aggregate": "ADYEN", "namespace": "TZvRzOPE", "region": "ACD7G2Jv", "sandboxTaxJarApiToken": "H0v4M0os", "specials": ["ADYEN", "CHECKOUT", "CHECKOUT"], "taxJarApiToken": "WpvP747E", "taxJarEnabled": false, "useGlobalTaxJarApiToken": false}' \
    > test.out 2>&1
eval_tap $? 337 'CreatePaymentProviderConfig' test.out

#- 338 GetAggregatePaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getAggregatePaymentProviders \
    > test.out 2>&1
eval_tap $? 338 'GetAggregatePaymentProviders' test.out

#- 339 DebugMatchedPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentProviderConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'c4xbXwOu' \
    > test.out 2>&1
eval_tap $? 339 'DebugMatchedPaymentProviderConfig' test.out

#- 340 GetSpecialPaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getSpecialPaymentProviders \
    > test.out 2>&1
eval_tap $? 340 'GetSpecialPaymentProviders' test.out

#- 341 UpdatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentProviderConfig \
    --id 'If2UqYSj' \
    --body '{"aggregate": "ADYEN", "namespace": "LbPTkuFp", "region": "LzyiE74R", "sandboxTaxJarApiToken": "5noYVCnp", "specials": ["CHECKOUT", "CHECKOUT", "XSOLLA"], "taxJarApiToken": "vEu5cM3n", "taxJarEnabled": false, "useGlobalTaxJarApiToken": false}' \
    > test.out 2>&1
eval_tap $? 341 'UpdatePaymentProviderConfig' test.out

#- 342 DeletePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform deletePaymentProviderConfig \
    --id 'EMReHoVy' \
    > test.out 2>&1
eval_tap $? 342 'DeletePaymentProviderConfig' test.out

#- 343 GetPaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxConfig \
    > test.out 2>&1
eval_tap $? 343 'GetPaymentTaxConfig' test.out

#- 344 UpdatePaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentTaxConfig \
    --body '{"sandboxTaxJarApiToken": "Dx47j6wN", "taxJarApiToken": "zf6cQLgI", "taxJarEnabled": true, "taxJarProductCodesMapping": {"5HTyEtXt": "PQ4c1Q2d", "IWtUYOpv": "zKqGRJtx", "KdUOZ4pF": "We3VUbKU"}}' \
    > test.out 2>&1
eval_tap $? 344 'UpdatePaymentTaxConfig' test.out

#- 345 SyncPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform syncPaymentOrders \
    --nextEvaluatedKey 'I5gRbGbw' \
    --end 'yuHjd4Vx' \
    --start 'biEidTY3' \
    > test.out 2>&1
eval_tap $? 345 'SyncPaymentOrders' test.out

#- 346 PublicGetRootCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetRootCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'v3HaHAU7' \
    --storeId 'wxWLye7X' \
    > test.out 2>&1
eval_tap $? 346 'PublicGetRootCategories' test.out

#- 347 DownloadCategories
./ng net.accelbyte.sdk.cli.Main platform downloadCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'wV31OMUI' \
    --storeId '3o6Hm18y' \
    > test.out 2>&1
eval_tap $? 347 'DownloadCategories' test.out

#- 348 PublicGetCategory
./ng net.accelbyte.sdk.cli.Main platform publicGetCategory \
    --categoryPath 'fRa97w2K' \
    --namespace "$AB_NAMESPACE" \
    --language 'eeNS4NXA' \
    --storeId '9TiW84vX' \
    > test.out 2>&1
eval_tap $? 348 'PublicGetCategory' test.out

#- 349 PublicGetChildCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetChildCategories \
    --categoryPath 'AWNIrdlh' \
    --namespace "$AB_NAMESPACE" \
    --language 'vdIgluzd' \
    --storeId 'hGKXQWdV' \
    > test.out 2>&1
eval_tap $? 349 'PublicGetChildCategories' test.out

#- 350 PublicGetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetDescendantCategories \
    --categoryPath 'aVrE1ckm' \
    --namespace "$AB_NAMESPACE" \
    --language 'OCXIVs05' \
    --storeId '5Jxo7kNC' \
    > test.out 2>&1
eval_tap $? 350 'PublicGetDescendantCategories' test.out

#- 351 PublicListCurrencies
./ng net.accelbyte.sdk.cli.Main platform publicListCurrencies \
    --namespace "$AB_NAMESPACE" \
    --currencyType 'REAL' \
    > test.out 2>&1
eval_tap $? 351 'PublicListCurrencies' test.out

#- 352 GeDLCDurableRewardShortMap
./ng net.accelbyte.sdk.cli.Main platform geDLCDurableRewardShortMap \
    --namespace "$AB_NAMESPACE" \
    --dlcType 'XBOX' \
    > test.out 2>&1
eval_tap $? 352 'GeDLCDurableRewardShortMap' test.out

#- 353 GetIAPItemMapping
./ng net.accelbyte.sdk.cli.Main platform getIAPItemMapping \
    --namespace "$AB_NAMESPACE" \
    --platform 'GOOGLE' \
    > test.out 2>&1
eval_tap $? 353 'GetIAPItemMapping' test.out

#- 354 PublicGetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --language 'h71ffcFg' \
    --region 'NHF456Qq' \
    --storeId 'dLxRbOgY' \
    --appId 'NkrbsxKk' \
    > test.out 2>&1
eval_tap $? 354 'PublicGetItemByAppId' test.out

#- 355 PublicQueryItems
./ng net.accelbyte.sdk.cli.Main platform publicQueryItems \
    --namespace "$AB_NAMESPACE" \
    --appType 'SOFTWARE' \
    --autoCalcEstimatedPrice  \
    --baseAppId 'fPU5dnRM' \
    --categoryPath 'vFSWwQ6f' \
    --features 'K63YzCXG' \
    --includeSubCategoryItem  \
    --itemType 'SUBSCRIPTION' \
    --language 'eL2Qkezl' \
    --limit '15' \
    --offset '10' \
    --region 'JVpFI5l3' \
    --sortBy 'displayOrder:desc,updatedAt:asc' \
    --storeId 'HGKIQk84' \
    --tags 'UEnO6bXs' \
    > test.out 2>&1
eval_tap $? 355 'PublicQueryItems' test.out

#- 356 PublicGetItemBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetItemBySku \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'M2OuoofL' \
    --region 'VRNElN2V' \
    --storeId 'PAXjVqb2' \
    --sku 'si7FkFdV' \
    > test.out 2>&1
eval_tap $? 356 'PublicGetItemBySku' test.out

#- 357 PublicGetEstimatedPrice
./ng net.accelbyte.sdk.cli.Main platform publicGetEstimatedPrice \
    --namespace "$AB_NAMESPACE" \
    --region 'iktgsTNq' \
    --storeId '5OuOEaT3' \
    --itemIds 'mabCnWMg' \
    > test.out 2>&1
eval_tap $? 357 'PublicGetEstimatedPrice' test.out

#- 358 PublicBulkGetItems
./ng net.accelbyte.sdk.cli.Main platform publicBulkGetItems \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'Iz8OVXCY' \
    --region 'tHz7Gldd' \
    --storeId 'vCEnDOps' \
    --itemIds 'DfKM6n6F' \
    > test.out 2>&1
eval_tap $? 358 'PublicBulkGetItems' test.out

#- 359 PublicValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform publicValidateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --body '{"itemIds": ["dPVZ2QPY", "iMeLn27b", "0i6FbgzR"]}' \
    > test.out 2>&1
eval_tap $? 359 'PublicValidateItemPurchaseCondition' test.out

#- 360 PublicSearchItems
./ng net.accelbyte.sdk.cli.Main platform publicSearchItems \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --itemType 'COINS' \
    --limit '4' \
    --offset '29' \
    --region '34FidY3y' \
    --storeId 'QwjD7wdU' \
    --keyword 'jtNBMusb' \
    --language 'EMVWObl4' \
    > test.out 2>&1
eval_tap $? 360 'PublicSearchItems' test.out

#- 361 PublicGetApp
./ng net.accelbyte.sdk.cli.Main platform publicGetApp \
    --itemId 'E82octFl' \
    --namespace "$AB_NAMESPACE" \
    --language '17bnD4kw' \
    --region 'ptsLaDSh' \
    --storeId 'mBOnkm1y' \
    > test.out 2>&1
eval_tap $? 361 'PublicGetApp' test.out

#- 362 PublicGetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform publicGetItemDynamicData \
    --itemId '2EyQkT5B' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 362 'PublicGetItemDynamicData' test.out

#- 363 PublicGetItem
./ng net.accelbyte.sdk.cli.Main platform publicGetItem \
    --itemId 'mdMce57Q' \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language '4NA0Lqn6' \
    --populateBundle  \
    --region 'a7dAVhNy' \
    --storeId '05hUxTgy' \
    > test.out 2>&1
eval_tap $? 363 'PublicGetItem' test.out

#- 364 GetPaymentCustomization
eval_tap 0 364 'GetPaymentCustomization # SKIP deprecated' test.out

#- 365 PublicGetPaymentUrl
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentUrl \
    --namespace "$AB_NAMESPACE" \
    --body '{"paymentOrderNo": "6410oYeX", "paymentProvider": "XSOLLA", "returnUrl": "SkMHRD5E", "ui": "dUcCW6yH", "zipCode": "Im6V9FaT"}' \
    > test.out 2>&1
eval_tap $? 365 'PublicGetPaymentUrl' test.out

#- 366 PublicGetPaymentMethods
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentMethods \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'ChqWiTgk' \
    > test.out 2>&1
eval_tap $? 366 'PublicGetPaymentMethods' test.out

#- 367 PublicGetUnpaidPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUnpaidPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'o5pZGvCk' \
    > test.out 2>&1
eval_tap $? 367 'PublicGetUnpaidPaymentOrder' test.out

#- 368 Pay
./ng net.accelbyte.sdk.cli.Main platform pay \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '7igMttgq' \
    --paymentProvider 'XSOLLA' \
    --zipCode 'PpXeJC4i' \
    --body '{"token": "3PSkDOe8"}' \
    > test.out 2>&1
eval_tap $? 368 'Pay' test.out

#- 369 PublicCheckPaymentOrderPaidStatus
./ng net.accelbyte.sdk.cli.Main platform publicCheckPaymentOrderPaidStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'Gozu9JIH' \
    > test.out 2>&1
eval_tap $? 369 'PublicCheckPaymentOrderPaidStatus' test.out

#- 370 GetPaymentPublicConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentPublicConfig \
    --namespace "$AB_NAMESPACE" \
    --sandbox  \
    --paymentProvider 'XSOLLA' \
    --region 'xo2fRmlN' \
    > test.out 2>&1
eval_tap $? 370 'GetPaymentPublicConfig' test.out

#- 371 PublicGetQRCode
./ng net.accelbyte.sdk.cli.Main platform publicGetQRCode \
    --namespace "$AB_NAMESPACE" \
    --code 'TW961Bih' \
    > test.out 2>&1
eval_tap $? 371 'PublicGetQRCode' test.out

#- 372 PublicNormalizePaymentReturnUrl
./ng net.accelbyte.sdk.cli.Main platform publicNormalizePaymentReturnUrl \
    --namespace "$AB_NAMESPACE" \
    --payerID 'sEwc9P9B' \
    --foreinginvoice 'Tv9xARx9' \
    --invoiceId 'z70T5Nm1' \
    --payload 'mlqieDgT' \
    --redirectResult 'Mw9bcwEY' \
    --resultCode '0tfskQ6V' \
    --sessionId 'N3Iu4Mtz' \
    --status 'LLjNM8jI' \
    --token 'YMxL1oPO' \
    --type 'zX3nw0go' \
    --userId 'q3NLpfiP' \
    --orderNo 'p1tjKNSB' \
    --paymentOrderNo '2hD6DgiA' \
    --paymentProvider 'ADYEN' \
    --returnUrl 'UvcvpbkE' \
    > test.out 2>&1
eval_tap $? 372 'PublicNormalizePaymentReturnUrl' test.out

#- 373 GetPaymentTaxValue
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxValue \
    --namespace "$AB_NAMESPACE" \
    --zipCode 'ceITujU9' \
    --paymentOrderNo 'c1akHfXx' \
    --paymentProvider 'XSOLLA' \
    > test.out 2>&1
eval_tap $? 373 'GetPaymentTaxValue' test.out

#- 374 GetRewardByCode
./ng net.accelbyte.sdk.cli.Main platform getRewardByCode \
    --namespace "$AB_NAMESPACE" \
    --rewardCode '76XEy6EN' \
    > test.out 2>&1
eval_tap $? 374 'GetRewardByCode' test.out

#- 375 QueryRewards1
./ng net.accelbyte.sdk.cli.Main platform queryRewards1 \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'SXU9YuH2' \
    --limit '83' \
    --offset '85' \
    --sortBy 'namespace,rewardCode,rewardCode:desc' \
    > test.out 2>&1
eval_tap $? 375 'QueryRewards1' test.out

#- 376 GetReward1
./ng net.accelbyte.sdk.cli.Main platform getReward1 \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'RdRQSpzl' \
    > test.out 2>&1
eval_tap $? 376 'GetReward1' test.out

#- 377 PublicListStores
./ng net.accelbyte.sdk.cli.Main platform publicListStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 377 'PublicListStores' test.out

#- 378 PublicExistsAnyMyActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyMyActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --appIds 'x9YxVYs3,TULrdZv4,agw1xCTj' \
    --itemIds 'bIZ5c3NA,SrvPkzOM,MTAMbQnu' \
    --skus 'ASNYzJOf,spXaL6fb,1iHJjwd6' \
    > test.out 2>&1
eval_tap $? 378 'PublicExistsAnyMyActiveEntitlement' test.out

#- 379 PublicGetMyAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --appId 'JUeAuC3n' \
    > test.out 2>&1
eval_tap $? 379 'PublicGetMyAppEntitlementOwnershipByAppId' test.out

#- 380 PublicGetMyEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'OPTIONBOX' \
    --itemId 'OehTKZuS' \
    > test.out 2>&1
eval_tap $? 380 'PublicGetMyEntitlementOwnershipByItemId' test.out

#- 381 PublicGetMyEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'CODE' \
    --sku 'YWT5W87i' \
    > test.out 2>&1
eval_tap $? 381 'PublicGetMyEntitlementOwnershipBySku' test.out

#- 382 PublicGetEntitlementOwnershipToken
./ng net.accelbyte.sdk.cli.Main platform publicGetEntitlementOwnershipToken \
    --namespace "$AB_NAMESPACE" \
    --appIds 'Wn2njHEH,xcoPP3XA,DVyq87AX' \
    --itemIds 'RiGOKJvf,i4vbxgZb,gfhJ8ue3' \
    --skus 'GQSca9hO,pUKlsoyN,DePjJlPV' \
    > test.out 2>&1
eval_tap $? 382 'PublicGetEntitlementOwnershipToken' test.out

#- 383 SyncTwitchDropsEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement \
    --namespace "$AB_NAMESPACE" \
    --body '{"gameId": "9fWZaqtH", "language": "kcR-DyCb_325", "region": "a1miTP9t"}' \
    > test.out 2>&1
eval_tap $? 383 'SyncTwitchDropsEntitlement' test.out

#- 384 PublicGetMyWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetMyWallet \
    --currencyCode 'FcW78Ymc' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 384 'PublicGetMyWallet' test.out

#- 385 SyncEpicGameDLC
./ng net.accelbyte.sdk.cli.Main platform syncEpicGameDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'DiUSC6ZC' \
    --body '{"epicGamesJwtToken": "R2ddVSGZ"}' \
    > test.out 2>&1
eval_tap $? 385 'SyncEpicGameDLC' test.out

#- 386 SyncOculusDLC
./ng net.accelbyte.sdk.cli.Main platform syncOculusDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'aXxqO097' \
    > test.out 2>&1
eval_tap $? 386 'SyncOculusDLC' test.out

#- 387 PublicSyncPsnDlcInventory
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'rW5jVoyl' \
    --body '{"serviceLabel": 67}' \
    > test.out 2>&1
eval_tap $? 387 'PublicSyncPsnDlcInventory' test.out

#- 388 PublicSyncPsnDlcInventoryWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventoryWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'nCmrQDnF' \
    --body '{"serviceLabels": [98, 93, 21]}' \
    > test.out 2>&1
eval_tap $? 388 'PublicSyncPsnDlcInventoryWithMultipleServiceLabels' test.out

#- 389 SyncSteamDLC
./ng net.accelbyte.sdk.cli.Main platform syncSteamDLC \
    --namespace "$AB_NAMESPACE" \
    --userId '1lVSXn3h' \
    --body '{"appId": "FtttNpVQ", "steamId": "pBxEEmbv"}' \
    > test.out 2>&1
eval_tap $? 389 'SyncSteamDLC' test.out

#- 390 SyncXboxDLC
./ng net.accelbyte.sdk.cli.Main platform syncXboxDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'Q4wDG6K7' \
    --body '{"xstsToken": "aip2Nep5"}' \
    > test.out 2>&1
eval_tap $? 390 'SyncXboxDLC' test.out

#- 391 PublicQueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'Xdqah2Hj' \
    --appType 'DEMO' \
    --entitlementClazz 'SUBSCRIPTION' \
    --entitlementName 'MjQjvrgj' \
    --features 'VIk6OpsX,thMXzazi,RgeQ50UF' \
    --itemId 'qNv02xJg,sZQwMfwN,btMDsfvS' \
    --limit '6' \
    --offset '21' \
    > test.out 2>&1
eval_tap $? 391 'PublicQueryUserEntitlements' test.out

#- 392 PublicGetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ionk26jp' \
    --appId '5WV4lnG8' \
    > test.out 2>&1
eval_tap $? 392 'PublicGetUserAppEntitlementByAppId' test.out

#- 393 PublicQueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'CAcMfsoL' \
    --limit '8' \
    --offset '89' \
    --appType 'DEMO' \
    > test.out 2>&1
eval_tap $? 393 'PublicQueryUserEntitlementsByAppType' test.out

#- 394 PublicGetUserEntitlementByItemId
eval_tap 0 394 'PublicGetUserEntitlementByItemId # SKIP deprecated' test.out

#- 395 PublicGetUserEntitlementBySku
eval_tap 0 395 'PublicGetUserEntitlementBySku # SKIP deprecated' test.out

#- 396 PublicExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'gYnpjl1s' \
    --appIds '65MgBYIa,VVQ2Dk0o,BLuQsg1l' \
    --itemIds 'NbNH3QwO,kI1fouxl,NzQC1lbd' \
    --skus 'o3IsBXQR,4b8pJH8j,GbRzefD8' \
    > test.out 2>&1
eval_tap $? 396 'PublicExistsAnyUserActiveEntitlement' test.out

#- 397 PublicGetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'dVci6NAo' \
    --appId 'eWDwivsm' \
    > test.out 2>&1
eval_tap $? 397 'PublicGetUserAppEntitlementOwnershipByAppId' test.out

#- 398 PublicGetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'XbYNIeOY' \
    --entitlementClazz 'CODE' \
    --itemId 'ODLoPXJ5' \
    > test.out 2>&1
eval_tap $? 398 'PublicGetUserEntitlementOwnershipByItemId' test.out

#- 399 PublicGetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'G1Nn5sXO' \
    --ids 'lJxnUFlT,9Hj4qYIs,niiMLkEZ' \
    > test.out 2>&1
eval_tap $? 399 'PublicGetUserEntitlementOwnershipByItemIds' test.out

#- 400 PublicGetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'J3Ei70UK' \
    --entitlementClazz 'APP' \
    --sku 'dDsLgkpT' \
    > test.out 2>&1
eval_tap $? 400 'PublicGetUserEntitlementOwnershipBySku' test.out

#- 401 PublicGetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlement \
    --entitlementId 'u4UsQ3jU' \
    --namespace "$AB_NAMESPACE" \
    --userId '9JdalI8y' \
    > test.out 2>&1
eval_tap $? 401 'PublicGetUserEntitlement' test.out

#- 402 PublicConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicConsumeUserEntitlement \
    --entitlementId 'gQsVCQ8D' \
    --namespace "$AB_NAMESPACE" \
    --userId 'jkgLeYZr' \
    --body '{"options": ["H6XwDDiW", "NkTuJ4dT", "dulZHuyR"], "requestId": "Q32lCKOP", "useCount": 100}' \
    > test.out 2>&1
eval_tap $? 402 'PublicConsumeUserEntitlement' test.out

#- 403 PublicSellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicSellUserEntitlement \
    --entitlementId 'yYFMSJLD' \
    --namespace "$AB_NAMESPACE" \
    --userId 'C3hiuYvJ' \
    --body '{"requestId": "pe8zS3fN", "useCount": 19}' \
    > test.out 2>&1
eval_tap $? 403 'PublicSellUserEntitlement' test.out

#- 404 PublicRedeemCode
./ng net.accelbyte.sdk.cli.Main platform publicRedeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'mc2KKXAX' \
    --body '{"code": "MNpf5EoZ", "language": "rb", "region": "HeVU2BQm"}' \
    > test.out 2>&1
eval_tap $? 404 'PublicRedeemCode' test.out

#- 405 PublicFulfillAppleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillAppleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'Uguxug6G' \
    --body '{"excludeOldTransactions": true, "language": "lJ_KMES", "productId": "R7MJ3RHB", "receiptData": "FVjFJEAC", "region": "jvwCvE41", "transactionId": "gBDahf3v"}' \
    > test.out 2>&1
eval_tap $? 405 'PublicFulfillAppleIAPItem' test.out

#- 406 SyncEpicGamesInventory
./ng net.accelbyte.sdk.cli.Main platform syncEpicGamesInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'qiSscP5b' \
    --body '{"epicGamesJwtToken": "v1yWZjGI"}' \
    > test.out 2>&1
eval_tap $? 406 'SyncEpicGamesInventory' test.out

#- 407 PublicFulfillGoogleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillGoogleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'aQI4NiKg' \
    --body '{"autoAck": true, "language": "zR-Qqkd", "orderId": "nXOHVVnP", "packageName": "aAqtuqac", "productId": "qICihv4H", "purchaseTime": 80, "purchaseToken": "CnJjkKrd", "region": "4eHvKshW"}' \
    > test.out 2>&1
eval_tap $? 407 'PublicFulfillGoogleIAPItem' test.out

#- 408 SyncOculusConsumableEntitlements
./ng net.accelbyte.sdk.cli.Main platform syncOculusConsumableEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'LekJAmJ2' \
    > test.out 2>&1
eval_tap $? 408 'SyncOculusConsumableEntitlements' test.out

#- 409 PublicReconcilePlayStationStore
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStore \
    --namespace "$AB_NAMESPACE" \
    --userId 'bkWPuBui' \
    --body '{"currencyCode": "TQJM6OWL", "price": 0.04498516943613784, "productId": "Q2lyudQ6", "serviceLabel": 33}' \
    > test.out 2>&1
eval_tap $? 409 'PublicReconcilePlayStationStore' test.out

#- 410 PublicReconcilePlayStationStoreWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStoreWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'vppOOZtL' \
    --body '{"currencyCode": "6cRRrYTQ", "price": 0.6755648283141731, "productId": "vixmt4AO", "serviceLabels": [96, 17, 95]}' \
    > test.out 2>&1
eval_tap $? 410 'PublicReconcilePlayStationStoreWithMultipleServiceLabels' test.out

#- 411 SyncSteamInventory
./ng net.accelbyte.sdk.cli.Main platform syncSteamInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'H5qxwro4' \
    --body '{"appId": "5SLy4JTi", "currencyCode": "NXwNyh3M", "language": "nb-nVdV-784", "price": 0.5231889557947419, "productId": "OYFZN4Uk", "region": "NIrifraJ", "steamId": "7C9MTUnU"}' \
    > test.out 2>&1
eval_tap $? 411 'SyncSteamInventory' test.out

#- 412 SyncTwitchDropsEntitlement1
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'JfliRnT2' \
    --body '{"gameId": "Sjuwxg2s", "language": "owy_tgmW", "region": "p9zbyFYs"}' \
    > test.out 2>&1
eval_tap $? 412 'SyncTwitchDropsEntitlement1' test.out

#- 413 SyncXboxInventory
./ng net.accelbyte.sdk.cli.Main platform syncXboxInventory \
    --namespace "$AB_NAMESPACE" \
    --userId '0qkQX0Oz' \
    --body '{"currencyCode": "LvYbOGzF", "price": 0.8660938159836246, "productId": "b3BMv0F7", "xstsToken": "hDCErl90"}' \
    > test.out 2>&1
eval_tap $? 413 'SyncXboxInventory' test.out

#- 414 PublicQueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'rUkUBzj8' \
    --itemId 'DV906qUR' \
    --limit '1' \
    --offset '29' \
    --status 'CLOSED' \
    > test.out 2>&1
eval_tap $? 414 'PublicQueryUserOrders' test.out

#- 415 PublicCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'T2MU1CCG' \
    --body '{"currencyCode": "S2Sq1z5u", "discountedPrice": 51, "ext": {"NoZhMWNC": {}, "Zhdvy2iv": {}, "47AAFyUF": {}}, "itemId": "aziEkzp7", "language": "YGI_dDOB_FQ", "price": 23, "quantity": 36, "region": "AEudyK1n", "returnUrl": "FnHZ7mTc", "sectionId": "VheQUE6S"}' \
    > test.out 2>&1
eval_tap $? 415 'PublicCreateUserOrder' test.out

#- 416 PublicGetUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'mBYv9J6L' \
    --userId 'W5kzb1ri' \
    > test.out 2>&1
eval_tap $? 416 'PublicGetUserOrder' test.out

#- 417 PublicCancelUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCancelUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo '7jQXRvBP' \
    --userId 'CysJhvIJ' \
    > test.out 2>&1
eval_tap $? 417 'PublicCancelUserOrder' test.out

#- 418 PublicGetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo '3cjfctBu' \
    --userId 'Y0P8BS46' \
    > test.out 2>&1
eval_tap $? 418 'PublicGetUserOrderHistories' test.out

#- 419 PublicDownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform publicDownloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'y3OrPtuu' \
    --userId 'BxJapgek' \
    > test.out 2>&1
eval_tap $? 419 'PublicDownloadUserOrderReceipt' test.out

#- 420 PublicGetPaymentAccounts
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'gRepdz1g' \
    > test.out 2>&1
eval_tap $? 420 'PublicGetPaymentAccounts' test.out

#- 421 PublicDeletePaymentAccount
./ng net.accelbyte.sdk.cli.Main platform publicDeletePaymentAccount \
    --id 'EP3A5GJ7' \
    --namespace "$AB_NAMESPACE" \
    --type 'paypal' \
    --userId '8Fu4riV8' \
    > test.out 2>&1
eval_tap $? 421 'PublicDeletePaymentAccount' test.out

#- 422 PublicListActiveSections
./ng net.accelbyte.sdk.cli.Main platform publicListActiveSections \
    --namespace "$AB_NAMESPACE" \
    --userId 'Gl5Qi4q8' \
    --autoCalcEstimatedPrice  \
    --language 'qQ5Emky3' \
    --region 'kW4VhKt7' \
    --storeId 'VFaoeruQ' \
    --viewId 'I0IZNLlO' \
    > test.out 2>&1
eval_tap $? 422 'PublicListActiveSections' test.out

#- 423 PublicQueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId '8UozSQs2' \
    --chargeStatus 'CHARGE_FAILED' \
    --itemId 'msDFvahb' \
    --limit '15' \
    --offset '85' \
    --sku 'yQ6uaoMP' \
    --status 'INIT' \
    --subscribedBy 'USER' \
    > test.out 2>&1
eval_tap $? 423 'PublicQueryUserSubscriptions' test.out

#- 424 PublicSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform publicSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'NvHQ3w2L' \
    --body '{"currencyCode": "L9YaZ8V0", "itemId": "NoKAOuzM", "language": "Mb-VOYk-ES", "region": "QUDSSFl7", "returnUrl": "ZWq0iOvO", "source": "rEhzeTeB"}' \
    > test.out 2>&1
eval_tap $? 424 'PublicSubscribeSubscription' test.out

#- 425 PublicCheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform publicCheckUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'AKZadWNe' \
    --itemId 'QK4XXqn6' \
    > test.out 2>&1
eval_tap $? 425 'PublicCheckUserSubscriptionSubscribableByItemId' test.out

#- 426 PublicGetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'iKtOBxGZ' \
    --userId 'SKcLksfk' \
    > test.out 2>&1
eval_tap $? 426 'PublicGetUserSubscription' test.out

#- 427 PublicChangeSubscriptionBillingAccount
./ng net.accelbyte.sdk.cli.Main platform publicChangeSubscriptionBillingAccount \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'XuNai3yE' \
    --userId 'jCTQbVUW' \
    > test.out 2>&1
eval_tap $? 427 'PublicChangeSubscriptionBillingAccount' test.out

#- 428 PublicCancelSubscription
./ng net.accelbyte.sdk.cli.Main platform publicCancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'iKSWg2qP' \
    --userId '6nVNxEK7' \
    --body '{"immediate": true, "reason": "HYtKCuYP"}' \
    > test.out 2>&1
eval_tap $? 428 'PublicCancelSubscription' test.out

#- 429 PublicGetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'RHG5Kbh3' \
    --userId 'bG7riCTe' \
    --excludeFree  \
    --limit '31' \
    --offset '45' \
    > test.out 2>&1
eval_tap $? 429 'PublicGetUserSubscriptionBillingHistories' test.out

#- 430 PublicListViews
./ng net.accelbyte.sdk.cli.Main platform publicListViews \
    --namespace "$AB_NAMESPACE" \
    --userId 'C3AYW67S' \
    --language 'lL5lUt1p' \
    --storeId 'yfarDTpn' \
    > test.out 2>&1
eval_tap $? 430 'PublicListViews' test.out

#- 431 PublicGetWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetWallet \
    --currencyCode '1ejaYi64' \
    --namespace "$AB_NAMESPACE" \
    --userId 'CUZR6L4f' \
    > test.out 2>&1
eval_tap $? 431 'PublicGetWallet' test.out

#- 432 PublicListUserWalletTransactions
./ng net.accelbyte.sdk.cli.Main platform publicListUserWalletTransactions \
    --currencyCode 'Dmuo2oik' \
    --namespace "$AB_NAMESPACE" \
    --userId 'kbeEl5nH' \
    --limit '28' \
    --offset '69' \
    > test.out 2>&1
eval_tap $? 432 'PublicListUserWalletTransactions' test.out

#- 433 QueryItems1
./ng net.accelbyte.sdk.cli.Main platform queryItems1 \
    --namespace "$AB_NAMESPACE" \
    --appType 'DLC' \
    --availableDate 'OS3vqsjR' \
    --baseAppId 't9QURCTO' \
    --categoryPath 'IOkbjSFe' \
    --features 'acrZgM2J' \
    --includeSubCategoryItem  \
    --itemName 'glbsDAhb' \
    --itemStatus 'ACTIVE' \
    --itemType 'LOOTBOX' \
    --limit '90' \
    --offset '80' \
    --region 'JUw8L65I' \
    --sectionExclusive  \
    --sortBy 'name:asc,updatedAt,updatedAt:asc' \
    --storeId '16bw22wd' \
    --tags 'GD44K98m' \
    --targetNamespace 'Ao0pe59F' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 433 'QueryItems1' test.out

#- 434 ImportStore1
./ng net.accelbyte.sdk.cli.Main platform importStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Iw3UA4LN' \
    --strictMode  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 434 'ImportStore1' test.out

#- 435 ExportStore1
./ng net.accelbyte.sdk.cli.Main platform exportStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'qg0wD8hr' \
    --body '{"itemIds": ["4ySir1TV", "oJslCLuk", "uY4hCpnR"]}' \
    > test.out 2>&1
eval_tap $? 435 'ExportStore1' test.out

#- 436 FulfillRewardsV2
./ng net.accelbyte.sdk.cli.Main platform fulfillRewardsV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'vOJ9iHwh' \
    --body '{"entitlementOrigin": "Nintendo", "metadata": {"xthRF9o6": {}, "1IuQqLku": {}, "83r9ugBt": {}}, "origin": "Oculus", "rewards": [{"currency": {"currencyCode": "RFQDOvNW", "namespace": "8orGmrMD"}, "item": {"itemId": "hXtQ4Gyc", "itemSku": "hMqWDC9e", "itemType": "XqpmPCrj"}, "quantity": 99, "type": "ITEM"}, {"currency": {"currencyCode": "HJ4pBssT", "namespace": "k5TZ4QpG"}, "item": {"itemId": "yq1DV2YZ", "itemSku": "7i2l5fvj", "itemType": "DiF2LXOJ"}, "quantity": 53, "type": "CURRENCY"}, {"currency": {"currencyCode": "gRxW9xUB", "namespace": "xtaN65bm"}, "item": {"itemId": "3AppsseE", "itemSku": "R8iwczfp", "itemType": "uvVpxC5f"}, "quantity": 62, "type": "CURRENCY"}], "source": "SELL_BACK", "transactionId": "9UCJrQfA"}' \
    > test.out 2>&1
eval_tap $? 436 'FulfillRewardsV2' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
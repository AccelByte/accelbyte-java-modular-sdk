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
    --id 'TSCs7Uyv' \
    > test.out 2>&1
eval_tap $? 3 'GetFulfillmentScript' test.out

#- 4 CreateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform createFulfillmentScript \
    --id 'FDrep3xA' \
    --body '{"grantDays": "ZO13Y1nT"}' \
    > test.out 2>&1
eval_tap $? 4 'CreateFulfillmentScript' test.out

#- 5 DeleteFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform deleteFulfillmentScript \
    --id 'NmvfdOoZ' \
    > test.out 2>&1
eval_tap $? 5 'DeleteFulfillmentScript' test.out

#- 6 UpdateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform updateFulfillmentScript \
    --id 'vcSKb9hZ' \
    --body '{"grantDays": "qg5RDCg1"}' \
    > test.out 2>&1
eval_tap $? 6 'UpdateFulfillmentScript' test.out

#- 7 ListItemTypeConfigs
./ng net.accelbyte.sdk.cli.Main platform listItemTypeConfigs \
    > test.out 2>&1
eval_tap $? 7 'ListItemTypeConfigs' test.out

#- 8 CreateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform createItemTypeConfig \
    --body '{"clazz": "Nocp45lA", "dryRun": false, "fulfillmentUrl": "2I1WQRmW", "itemType": "SUBSCRIPTION", "purchaseConditionUrl": "M7bc1oAW"}' \
    > test.out 2>&1
eval_tap $? 8 'CreateItemTypeConfig' test.out

#- 9 SearchItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform searchItemTypeConfig \
    --clazz 'kwDsfg6k' \
    --itemType 'APP' \
    > test.out 2>&1
eval_tap $? 9 'SearchItemTypeConfig' test.out

#- 10 GetItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform getItemTypeConfig \
    --id 'fnynEtB2' \
    > test.out 2>&1
eval_tap $? 10 'GetItemTypeConfig' test.out

#- 11 UpdateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform updateItemTypeConfig \
    --id 'HKapIfIZ' \
    --body '{"clazz": "jrdi0G5H", "dryRun": true, "fulfillmentUrl": "4PHacEMi", "purchaseConditionUrl": "fyKLhb75"}' \
    > test.out 2>&1
eval_tap $? 11 'UpdateItemTypeConfig' test.out

#- 12 DeleteItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform deleteItemTypeConfig \
    --id 'PpzA2Nmh' \
    > test.out 2>&1
eval_tap $? 12 'DeleteItemTypeConfig' test.out

#- 13 QueryCampaigns
./ng net.accelbyte.sdk.cli.Main platform queryCampaigns \
    --namespace "$AB_NAMESPACE" \
    --limit '79' \
    --name 'ivWSbc3i' \
    --offset '44' \
    --tag 'NVeyihdp' \
    > test.out 2>&1
eval_tap $? 13 'QueryCampaigns' test.out

#- 14 CreateCampaign
./ng net.accelbyte.sdk.cli.Main platform createCampaign \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "M9wQrEJh", "discountConfig": {"categories": [{"categoryPath": "HUkyI06R", "includeSubCategories": true}, {"categoryPath": "UXIRfy3q", "includeSubCategories": false}, {"categoryPath": "lKkhjm1Z", "includeSubCategories": false}], "currencyCode": "ITBEAdJ4", "currencyNamespace": "u7YtTa71", "discountAmount": 93, "discountPercentage": 83, "discountType": "AMOUNT", "items": [{"itemId": "LNSZgnWJ", "itemName": "ud4vGPpD"}, {"itemId": "TSEicIx2", "itemName": "Y2kiEg3a"}, {"itemId": "d6mXcQP7", "itemName": "yJKX2W9p"}], "restrictType": "ITEMS_AND_CATEGORIES", "stackable": false}, "items": [{"extraSubscriptionDays": 85, "itemId": "5mBZiGCj", "itemName": "1a9b3wx3", "quantity": 95}, {"extraSubscriptionDays": 58, "itemId": "z6fsny8S", "itemName": "znM753aq", "quantity": 80}, {"extraSubscriptionDays": 69, "itemId": "FWaoVvA7", "itemName": "HRqHrcdT", "quantity": 4}], "maxRedeemCountPerCampaignPerUser": 70, "maxRedeemCountPerCode": 36, "maxRedeemCountPerCodePerUser": 16, "maxSaleCount": 30, "name": "c2mJpcqo", "redeemEnd": "1983-01-29T00:00:00Z", "redeemStart": "1976-07-04T00:00:00Z", "redeemType": "ITEM", "status": "INACTIVE", "tags": ["WzThwHp2", "qwWSTlRF", "KiS6NOrd"], "type": "REDEMPTION"}' \
    > test.out 2>&1
eval_tap $? 14 'CreateCampaign' test.out

#- 15 GetCampaign
./ng net.accelbyte.sdk.cli.Main platform getCampaign \
    --campaignId 'l7oV8l4K' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'GetCampaign' test.out

#- 16 UpdateCampaign
./ng net.accelbyte.sdk.cli.Main platform updateCampaign \
    --campaignId 'TMCZAAmW' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "afxArIMy", "discountConfig": {"categories": [{"categoryPath": "R2Q5buhB", "includeSubCategories": true}, {"categoryPath": "Jayp7DtJ", "includeSubCategories": true}, {"categoryPath": "g1N3josC", "includeSubCategories": true}], "currencyCode": "xKwbsCMh", "currencyNamespace": "Wt357FdX", "discountAmount": 74, "discountPercentage": 61, "discountType": "AMOUNT", "items": [{"itemId": "9PMkY5a8", "itemName": "Fg1xP8Lp"}, {"itemId": "PZNcqIPe", "itemName": "D771E6TE"}, {"itemId": "tgCdWP1e", "itemName": "9NTyX6oU"}], "restrictType": "NONE", "stackable": true}, "items": [{"extraSubscriptionDays": 48, "itemId": "fglZ3Zic", "itemName": "BaTPlmsC", "quantity": 26}, {"extraSubscriptionDays": 93, "itemId": "zMpWkkZu", "itemName": "8YQb0tB1", "quantity": 58}, {"extraSubscriptionDays": 16, "itemId": "ai1TGJiF", "itemName": "Ur5f8BTP", "quantity": 32}], "maxRedeemCountPerCampaignPerUser": 39, "maxRedeemCountPerCode": 84, "maxRedeemCountPerCodePerUser": 84, "maxSaleCount": 93, "name": "1Qk02hae", "redeemEnd": "1987-05-27T00:00:00Z", "redeemStart": "1975-08-23T00:00:00Z", "redeemType": "ITEM", "status": "ACTIVE", "tags": ["yp8aqlmM", "cOz6rn4d", "WakYLUkX"]}' \
    > test.out 2>&1
eval_tap $? 16 'UpdateCampaign' test.out

#- 17 GetCampaignDynamic
./ng net.accelbyte.sdk.cli.Main platform getCampaignDynamic \
    --campaignId 'W310iqHD' \
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
    --body '{"appConfig": {"appName": "9pk8A5DL"}, "customConfig": {"connectionType": "INSECURE", "grpcServerAddress": "GMUuk6mG"}, "extendType": "APP"}' \
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
    --body '{"appConfig": {"appName": "5twaRMyv"}, "customConfig": {"connectionType": "TLS", "grpcServerAddress": "ygolI8q0"}, "extendType": "APP"}' \
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
    --storeId 'TLZSM3e9' \
    > test.out 2>&1
eval_tap $? 29 'GetRootCategories' test.out

#- 30 CreateCategory
./ng net.accelbyte.sdk.cli.Main platform createCategory \
    --namespace "$AB_NAMESPACE" \
    --storeId 'O6HIdBXr' \
    --body '{"categoryPath": "LYDxYP82", "localizationDisplayNames": {"BMSDKXGU": "pNgnRMLS", "mktVwC7g": "cfMPpKec", "7tbTVjB9": "teosTNm4"}}' \
    > test.out 2>&1
eval_tap $? 30 'CreateCategory' test.out

#- 31 ListCategoriesBasic
./ng net.accelbyte.sdk.cli.Main platform listCategoriesBasic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'WYn2AHgO' \
    > test.out 2>&1
eval_tap $? 31 'ListCategoriesBasic' test.out

#- 32 GetCategory
./ng net.accelbyte.sdk.cli.Main platform getCategory \
    --categoryPath 'ZGctqOrT' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'HDmttB7D' \
    > test.out 2>&1
eval_tap $? 32 'GetCategory' test.out

#- 33 UpdateCategory
./ng net.accelbyte.sdk.cli.Main platform updateCategory \
    --categoryPath 'Nskz5Jzk' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'qsGAZHDA' \
    --body '{"localizationDisplayNames": {"9OCLuZpl": "dhlEbzKv", "ukOUbc61": "gpr2fcjL", "lDPucgan": "VU7gQfLk"}}' \
    > test.out 2>&1
eval_tap $? 33 'UpdateCategory' test.out

#- 34 DeleteCategory
./ng net.accelbyte.sdk.cli.Main platform deleteCategory \
    --categoryPath '27ZMs5yd' \
    --namespace "$AB_NAMESPACE" \
    --storeId '6qWXKnP0' \
    > test.out 2>&1
eval_tap $? 34 'DeleteCategory' test.out

#- 35 GetChildCategories
./ng net.accelbyte.sdk.cli.Main platform getChildCategories \
    --categoryPath '2mRDnMKU' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'GI9gxycf' \
    > test.out 2>&1
eval_tap $? 35 'GetChildCategories' test.out

#- 36 GetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform getDescendantCategories \
    --categoryPath 'AX8xeO5W' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'sT2CZpo7' \
    > test.out 2>&1
eval_tap $? 36 'GetDescendantCategories' test.out

#- 37 QueryCodes
./ng net.accelbyte.sdk.cli.Main platform queryCodes \
    --campaignId 'DsMVaaCS' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --batchNo '89' \
    --code 'uLYF7GSx' \
    --limit '61' \
    --offset '15' \
    > test.out 2>&1
eval_tap $? 37 'QueryCodes' test.out

#- 38 CreateCodes
./ng net.accelbyte.sdk.cli.Main platform createCodes \
    --campaignId 'GZXXnGED' \
    --namespace "$AB_NAMESPACE" \
    --body '{"codeValue": "oITBuABt", "quantity": 78}' \
    > test.out 2>&1
eval_tap $? 38 'CreateCodes' test.out

#- 39 Download
./ng net.accelbyte.sdk.cli.Main platform download \
    --campaignId 'Cz9Zz8wR' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '56' \
    > test.out 2>&1
eval_tap $? 39 'Download' test.out

#- 40 BulkDisableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkDisableCodes \
    --campaignId 'UBqZil3f' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '93' \
    > test.out 2>&1
eval_tap $? 40 'BulkDisableCodes' test.out

#- 41 BulkEnableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkEnableCodes \
    --campaignId 'D8XMiTIC' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '81' \
    > test.out 2>&1
eval_tap $? 41 'BulkEnableCodes' test.out

#- 42 QueryRedeemHistory
./ng net.accelbyte.sdk.cli.Main platform queryRedeemHistory \
    --campaignId '4EnXpRSZ' \
    --namespace "$AB_NAMESPACE" \
    --code 'f7J8tdXR' \
    --limit '32' \
    --offset '70' \
    --userId 'Tj4oPHwR' \
    > test.out 2>&1
eval_tap $? 42 'QueryRedeemHistory' test.out

#- 43 GetCode
./ng net.accelbyte.sdk.cli.Main platform getCode \
    --code 'dvQgIIWi' \
    --namespace "$AB_NAMESPACE" \
    --redeemable  \
    > test.out 2>&1
eval_tap $? 43 'GetCode' test.out

#- 44 DisableCode
./ng net.accelbyte.sdk.cli.Main platform disableCode \
    --code 'gQObAQhs' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 44 'DisableCode' test.out

#- 45 EnableCode
./ng net.accelbyte.sdk.cli.Main platform enableCode \
    --code 'RyBovWOz' \
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
    --currencyType 'REAL' \
    > test.out 2>&1
eval_tap $? 49 'ListCurrencies' test.out

#- 50 CreateCurrency
./ng net.accelbyte.sdk.cli.Main platform createCurrency \
    --namespace "$AB_NAMESPACE" \
    --body '{"currencyCode": "n1YZJLsG", "currencySymbol": "rB82O7h8", "currencyType": "REAL", "decimals": 81, "localizationDescriptions": {"ev0uytms": "gEvSLpfz", "N3FS3Wfd": "SVTKv8sB", "ZuTAKYb5": "ldcxACF0"}}' \
    > test.out 2>&1
eval_tap $? 50 'CreateCurrency' test.out

#- 51 UpdateCurrency
./ng net.accelbyte.sdk.cli.Main platform updateCurrency \
    --currencyCode 'eNgp7AJL' \
    --namespace "$AB_NAMESPACE" \
    --body '{"localizationDescriptions": {"O4gtal0p": "R3Jqq9M8", "PSsVLBLt": "prMe8vms", "UvtmH7Sp": "M235xZCg"}}' \
    > test.out 2>&1
eval_tap $? 51 'UpdateCurrency' test.out

#- 52 DeleteCurrency
./ng net.accelbyte.sdk.cli.Main platform deleteCurrency \
    --currencyCode 'vfkIPekr' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 52 'DeleteCurrency' test.out

#- 53 GetCurrencyConfig
./ng net.accelbyte.sdk.cli.Main platform getCurrencyConfig \
    --currencyCode '5LZNuKae' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 53 'GetCurrencyConfig' test.out

#- 54 GetCurrencySummary
./ng net.accelbyte.sdk.cli.Main platform getCurrencySummary \
    --currencyCode 'a4CFFRNQ' \
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
    --body '{"data": [{"id": "QXPZ1FWf", "rewards": [{"currency": {"currencyCode": "26RdWLZ6", "namespace": "GBtcgUPL"}, "item": {"itemId": "qPLr1PkG", "itemSku": "0LLjFCGk", "itemType": "b74Klu5z"}, "quantity": 63, "type": "ITEM"}, {"currency": {"currencyCode": "XgOJKji9", "namespace": "MxQzpdFT"}, "item": {"itemId": "jKpJfPB2", "itemSku": "CC0dSzgZ", "itemType": "015gYo6Y"}, "quantity": 57, "type": "ITEM"}, {"currency": {"currencyCode": "JZ8yBDUq", "namespace": "NTku5geQ"}, "item": {"itemId": "ugtbounQ", "itemSku": "W64EHoEK", "itemType": "4g83RC3F"}, "quantity": 78, "type": "ITEM"}]}, {"id": "qIim44ZH", "rewards": [{"currency": {"currencyCode": "VRHNgcyO", "namespace": "c4pGfUfc"}, "item": {"itemId": "X1t2KeiR", "itemSku": "sBpIXmvK", "itemType": "74pJCr6j"}, "quantity": 90, "type": "CURRENCY"}, {"currency": {"currencyCode": "4Er37CYF", "namespace": "KezW2sJE"}, "item": {"itemId": "FLAGNJqv", "itemSku": "QQWB680X", "itemType": "hRAU0MIO"}, "quantity": 41, "type": "CURRENCY"}, {"currency": {"currencyCode": "tjDEAF7I", "namespace": "lUMG1Dw9"}, "item": {"itemId": "HyJ2Zu1r", "itemSku": "36wTgC0Z", "itemType": "625PkBdu"}, "quantity": 42, "type": "ITEM"}]}, {"id": "Fv2ZxNpt", "rewards": [{"currency": {"currencyCode": "K8sCEeW6", "namespace": "MfH0Q9nc"}, "item": {"itemId": "wc2LdUlL", "itemSku": "ZyxMntWw", "itemType": "S7kRpKBI"}, "quantity": 40, "type": "ITEM"}, {"currency": {"currencyCode": "XvevYMVZ", "namespace": "J2pGxgUo"}, "item": {"itemId": "nULORKtn", "itemSku": "Kmh9f2Uz", "itemType": "p8H0ZhMm"}, "quantity": 82, "type": "CURRENCY"}, {"currency": {"currencyCode": "BVC0MTKI", "namespace": "PoXGFUuk"}, "item": {"itemId": "6Lrgs8KW", "itemSku": "5ncJZvcc", "itemType": "j5LpJA0a"}, "quantity": 86, "type": "CURRENCY"}]}]}' \
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
    --body '{"data": [{"platform": "EPICGAMES", "platformDlcIdMap": {"RRfV8UNy": "sNdM284N", "AMVPFxF1": "s0Qx6xPG", "U4C9zgXH": "9cs4sjB9"}}, {"platform": "OCULUS", "platformDlcIdMap": {"16mzKA0j": "OzlH2NVV", "iocTOuz2": "3m27iBbp", "FC6YmSSr": "GvpQPEGL"}}, {"platform": "PSN", "platformDlcIdMap": {"BwwKPxh2": "ezbwzOMl", "7jPHZUKs": "ZPyW2gNJ", "kIrUutgl": "rNADXDdL"}}]}' \
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
    --appType 'DLC' \
    --entitlementClazz 'CODE' \
    --entitlementName '9veUnzr5' \
    --itemId '6ELJlGkU,ruHV21PG,M6l9k6jt' \
    --limit '4' \
    --offset '6' \
    --origin 'GooglePlay' \
    --userId 'wIXYXmUd' \
    > test.out 2>&1
eval_tap $? 61 'QueryEntitlements' test.out

#- 62 QueryEntitlements1
./ng net.accelbyte.sdk.cli.Main platform queryEntitlements1 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemIds 'cd7TcVYd,p0zbt8yy,0hG0Anyd' \
    --limit '95' \
    --offset '53' \
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
    --body '{"entitlementGrantList": [{"collectionId": "sVrPC3Bh", "endDate": "1987-05-05T00:00:00Z", "grantedCode": "0coebdTD", "itemId": "gs9Cd7O2", "itemNamespace": "6LY9PW4d", "language": "YPo-wBXZ", "origin": "System", "quantity": 4, "region": "byS39Zqy", "source": "REFERRAL_BONUS", "startDate": "1994-04-30T00:00:00Z", "storeId": "RZLaQNww"}, {"collectionId": "CrKa13Ax", "endDate": "1971-11-20T00:00:00Z", "grantedCode": "lemra5Ja", "itemId": "dOlyR8vk", "itemNamespace": "WMWXLgxp", "language": "UUnf", "origin": "Oculus", "quantity": 72, "region": "8lL2tIYd", "source": "REWARD", "startDate": "1997-01-18T00:00:00Z", "storeId": "qbbrq4pi"}, {"collectionId": "ZhF4XjMx", "endDate": "1982-04-25T00:00:00Z", "grantedCode": "LX6WOd3t", "itemId": "uHoXoTHC", "itemNamespace": "wPhFoMor", "language": "TTa_xNqx", "origin": "Nintendo", "quantity": 1, "region": "5iQFVjyO", "source": "REFERRAL_BONUS", "startDate": "1995-07-25T00:00:00Z", "storeId": "atMjv6wz"}], "userIds": ["fn8X0n5u", "nMtjX2a8", "Y6DaZnOe"]}' \
    > test.out 2>&1
eval_tap $? 65 'GrantEntitlements' test.out

#- 66 RevokeEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeEntitlements \
    --namespace "$AB_NAMESPACE" \
    --body '["Pk36OVo1", "dsGWDXuQ", "xI5GcgiW"]' \
    > test.out 2>&1
eval_tap $? 66 'RevokeEntitlements' test.out

#- 67 GetEntitlement
./ng net.accelbyte.sdk.cli.Main platform getEntitlement \
    --entitlementId 'nAtE7jLz' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 67 'GetEntitlement' test.out

#- 68 QueryFulfillmentHistories
./ng net.accelbyte.sdk.cli.Main platform queryFulfillmentHistories \
    --namespace "$AB_NAMESPACE" \
    --limit '3' \
    --offset '37' \
    --status 'SUCCESS' \
    --userId 'UbhmRxJZ' \
    > test.out 2>&1
eval_tap $? 68 'QueryFulfillmentHistories' test.out

#- 69 QueryIAPClawbackHistory
./ng net.accelbyte.sdk.cli.Main platform queryIAPClawbackHistory \
    --namespace "$AB_NAMESPACE" \
    --endTime 'eViCttOr' \
    --eventType 'CHARGEBACK' \
    --externalOrderId 'cZEPw8wa' \
    --limit '94' \
    --offset '75' \
    --startTime 'zGrfLJjJ' \
    --status 'SUCCESS' \
    --userId 'txr3fSt6' \
    > test.out 2>&1
eval_tap $? 69 'QueryIAPClawbackHistory' test.out

#- 70 MockPlayStationStreamEvent
./ng net.accelbyte.sdk.cli.Main platform mockPlayStationStreamEvent \
    --namespace "$AB_NAMESPACE" \
    --body '{"body": {"account": "IqG2XIMp", "additionalData": {"entitlement": [{"clientTransaction": [{"amountConsumed": 36, "clientTransactionId": "Ykcj4Oqn"}, {"amountConsumed": 22, "clientTransactionId": "qrwXkrtz"}, {"amountConsumed": 89, "clientTransactionId": "ZEf3X2H7"}], "entitlementId": "cb1O4hpd", "usageCount": 85}, {"clientTransaction": [{"amountConsumed": 6, "clientTransactionId": "WNKO9cOx"}, {"amountConsumed": 54, "clientTransactionId": "D860CPb0"}, {"amountConsumed": 10, "clientTransactionId": "GlocraiA"}], "entitlementId": "jPjZjDER", "usageCount": 77}, {"clientTransaction": [{"amountConsumed": 75, "clientTransactionId": "5acIRIY5"}, {"amountConsumed": 79, "clientTransactionId": "1pRq9WfV"}, {"amountConsumed": 50, "clientTransactionId": "OSotJeIj"}], "entitlementId": "uWLMugca", "usageCount": 24}], "purpose": "3aElchSY"}, "originalTitleName": "7l3xrdLA", "paymentProductSKU": "av4CHIQT", "purchaseDate": "SjwoFI2m", "sourceOrderItemId": "jCXtm9Tb", "titleName": "POQimiQd"}, "eventDomain": "CAHZhntN", "eventSource": "MQbPHgJ4", "eventType": "Eg1ebZV0", "eventVersion": 32, "id": "KcfWwuWq", "timestamp": "KYm1LsOc"}' \
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
    --body '{"bundleId": "1YUu1ObF", "password": "tRKW7fRa"}' \
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
    --body '{"sandboxId": "iDDM6RVG"}' \
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
    --body '{"applicationName": "i6Ewr62h", "serviceAccountId": "4TadWmQ0"}' \
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
    --body '{"data": [{"itemIdentity": "BsSMeMjG", "itemIdentityType": "ITEM_ID", "platformProductIdMap": {"5SWUrRZw": "dBNJPkUG", "4uIr2W6q": "Dn6SF0cJ", "3QH2hmHP": "WD21p8Qg"}}, {"itemIdentity": "tLrhjq7f", "itemIdentityType": "ITEM_ID", "platformProductIdMap": {"f9kceCEt": "IeuIrgrv", "eeEVQUN6": "MPAtUIjS", "yLaoqLDA": "avXMzP2Q"}}, {"itemIdentity": "csyfxsgz", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"0eGRA3W0": "P015nx2X", "SzYj64AO": "qnlCNrZY", "QI7dh0EH": "4BxW0dme"}}]}' \
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
    --body '{"appId": "mMDCVNas", "appSecret": "cnGIEnb3"}' \
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
    --body '{"backOfficeServerClientId": "eYU6njgo", "backOfficeServerClientSecret": "eMstu6Ng", "enableStreamJob": false, "environment": "ILiiTQ6z", "streamName": "XreclEx3", "streamPartnerName": "s2ONtb96"}' \
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
    --body '{"backOfficeServerClientId": "5XPZSnZh", "backOfficeServerClientSecret": "fAwj0vRk", "enableStreamJob": true, "environment": "BDkQrd9Z", "streamName": "zagBx9Sp", "streamPartnerName": "lO3Af8Bf"}' \
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
    --body '{"appId": "WqUY01T7", "publisherAuthenticationKey": "kcqooiiY"}' \
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
    --body '{"clientId": "46lkMbaO", "clientSecret": "vZpys55d", "organizationId": "vMCe7y5f"}' \
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
    --body '{"relyingPartyCert": "oSVesQJD"}' \
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
    --password 'R7gexGAh' \
    > test.out 2>&1
eval_tap $? 101 'UpdateXblBPCertFile' test.out

#- 102 DownloadInvoiceDetails
./ng net.accelbyte.sdk.cli.Main platform downloadInvoiceDetails \
    --namespace "$AB_NAMESPACE" \
    --feature 'o5hVscZF' \
    --itemId '5NnZTc7T' \
    --itemType 'SEASON' \
    --endTime '708p9qCM' \
    --startTime 'c8WreQGC' \
    > test.out 2>&1
eval_tap $? 102 'DownloadInvoiceDetails' test.out

#- 103 GenerateInvoiceSummary
./ng net.accelbyte.sdk.cli.Main platform generateInvoiceSummary \
    --namespace "$AB_NAMESPACE" \
    --feature '5rffbLtz' \
    --itemId 'yx4V68kX' \
    --itemType 'SEASON' \
    --endTime 'oJjkVOnd' \
    --startTime 'zBryx6wA' \
    > test.out 2>&1
eval_tap $? 103 'GenerateInvoiceSummary' test.out

#- 104 SyncInGameItem
./ng net.accelbyte.sdk.cli.Main platform syncInGameItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'S8MBfxZ2' \
    --body '{"categoryPath": "GB1m6aOw", "targetItemId": "A47nXpK1", "targetNamespace": "ZdyQYeMA"}' \
    > test.out 2>&1
eval_tap $? 104 'SyncInGameItem' test.out

#- 105 CreateItem
./ng net.accelbyte.sdk.cli.Main platform createItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'PN88mkcX' \
    --body '{"appId": "H0VIRV86", "appType": "DEMO", "baseAppId": "HtYCvGBG", "boothName": "j6Wjx76I", "categoryPath": "UGzLLSPC", "clazz": "J3U0ASrL", "displayOrder": 83, "entitlementType": "CONSUMABLE", "ext": {"vlykWhaV": {}, "6ypCC8sI": {}, "OgoCagOq": {}}, "features": ["5Yl3OlrZ", "42S0pKur", "k10JVHow"], "flexible": false, "images": [{"as": "X4R7laZ0", "caption": "hvJIUwvA", "height": 8, "imageUrl": "4wO9MNPD", "smallImageUrl": "2FzbI6V8", "width": 27}, {"as": "vGQqHgsi", "caption": "FnOlYm6t", "height": 52, "imageUrl": "nLHdSdpd", "smallImageUrl": "xZlQugC9", "width": 21}, {"as": "JFIdFW5T", "caption": "EBSCHnua", "height": 82, "imageUrl": "6cPP9gTT", "smallImageUrl": "OWHQ9j3J", "width": 20}], "inventoryConfig": {"customAttributes": {"cl99oSq6": {}, "xJQilCS3": {}, "jWfiLt7B": {}}, "serverCustomAttributes": {"awNNttbX": {}, "YFvna5iz": {}, "AcdFt8AH": {}}, "slotUsed": 76}, "itemIds": ["k7PvgJq6", "tdrlDAfu", "chDgdfHW"], "itemQty": {"mrKfI2eS": 36, "iI3x8GDM": 14, "tgm0W4VN": 95}, "itemType": "INGAMEITEM", "listable": true, "localizations": {"XMTYfMTP": {"description": "KGZ8bYjO", "localExt": {"omZxqbqp": {}, "Mkk4a46H": {}, "T8BTDd4C": {}}, "longDescription": "JNMIkdwr", "title": "Buw25Bye"}, "V2RcoHVn": {"description": "VQVxGMD5", "localExt": {"H2YLLtuI": {}, "v01YDTES": {}, "mX5to8qG": {}}, "longDescription": "9dNqgII9", "title": "b4VXKslk"}, "PRIyFUib": {"description": "lpZVU1YS", "localExt": {"P3QH9181": {}, "grKoeZCb": {}, "5zmLDpDE": {}}, "longDescription": "fwPzjZzb", "title": "lOPClc1o"}}, "lootBoxConfig": {"rewardCount": 84, "rewards": [{"lootBoxItems": [{"count": 10, "duration": 52, "endDate": "1995-10-24T00:00:00Z", "itemId": "Sy7EizQ5", "itemSku": "A2SAE2sq", "itemType": "BvXIRnDX"}, {"count": 18, "duration": 64, "endDate": "1991-02-16T00:00:00Z", "itemId": "elk32h7j", "itemSku": "cXosEDpi", "itemType": "3OjYnJ7A"}, {"count": 90, "duration": 25, "endDate": "1993-01-25T00:00:00Z", "itemId": "ZSzd7uXy", "itemSku": "jR2PUs4C", "itemType": "CZ0x81rC"}], "name": "dRxXkxLT", "odds": 0.756976782436109, "type": "PROBABILITY_GROUP", "weight": 29}, {"lootBoxItems": [{"count": 26, "duration": 18, "endDate": "1974-07-21T00:00:00Z", "itemId": "xFj7x5d7", "itemSku": "cWVYBGJX", "itemType": "M0RlPMNw"}, {"count": 83, "duration": 100, "endDate": "1997-08-12T00:00:00Z", "itemId": "Xrb6r42m", "itemSku": "9tpsOXQH", "itemType": "uuy3Ycyq"}, {"count": 6, "duration": 54, "endDate": "1991-10-22T00:00:00Z", "itemId": "Tzyx6sYt", "itemSku": "bi8wsl0z", "itemType": "ITcV4Xmx"}], "name": "GbGWjtHO", "odds": 0.995552746780445, "type": "REWARD", "weight": 60}, {"lootBoxItems": [{"count": 4, "duration": 14, "endDate": "1982-02-25T00:00:00Z", "itemId": "2zOjdDX5", "itemSku": "FKbCqfmu", "itemType": "tjpybTCD"}, {"count": 11, "duration": 64, "endDate": "1972-05-29T00:00:00Z", "itemId": "OSKy1rv5", "itemSku": "aEpo5v6E", "itemType": "RgyYbqF6"}, {"count": 73, "duration": 30, "endDate": "1995-07-22T00:00:00Z", "itemId": "YSbSjShS", "itemSku": "HgNIAqzk", "itemType": "K7GHrBf2"}], "name": "nHDPDEjv", "odds": 0.7955803123327306, "type": "PROBABILITY_GROUP", "weight": 52}], "rollFunction": "DEFAULT"}, "maxCount": 66, "maxCountPerUser": 15, "name": "9crBXFkC", "optionBoxConfig": {"boxItems": [{"count": 50, "duration": 95, "endDate": "1988-12-02T00:00:00Z", "itemId": "3B8SrjKu", "itemSku": "4RLyn96Y", "itemType": "BDzp17j8"}, {"count": 78, "duration": 11, "endDate": "1983-03-17T00:00:00Z", "itemId": "l7H9hMHs", "itemSku": "MRATDWfQ", "itemType": "YowErT5T"}, {"count": 10, "duration": 11, "endDate": "1974-08-04T00:00:00Z", "itemId": "X0ISgu5K", "itemSku": "R28GA3DN", "itemType": "9FNA7ijR"}]}, "purchasable": true, "recurring": {"cycle": "MONTHLY", "fixedFreeDays": 13, "fixedTrialCycles": 63, "graceDays": 56}, "regionData": {"NYwrQwAg": [{"currencyCode": "bn2xx8K4", "currencyNamespace": "WQYVCP94", "currencyType": "REAL", "discountAmount": 22, "discountExpireAt": "1993-10-25T00:00:00Z", "discountPercentage": 76, "discountPurchaseAt": "1977-11-18T00:00:00Z", "expireAt": "1995-09-24T00:00:00Z", "price": 89, "purchaseAt": "1996-05-07T00:00:00Z", "trialPrice": 61}, {"currencyCode": "lLktswiM", "currencyNamespace": "QjkQN7Dd", "currencyType": "REAL", "discountAmount": 94, "discountExpireAt": "1990-10-04T00:00:00Z", "discountPercentage": 16, "discountPurchaseAt": "1981-01-11T00:00:00Z", "expireAt": "1997-01-01T00:00:00Z", "price": 21, "purchaseAt": "1991-10-05T00:00:00Z", "trialPrice": 25}, {"currencyCode": "MXl3L2Jv", "currencyNamespace": "GodiN713", "currencyType": "REAL", "discountAmount": 13, "discountExpireAt": "1972-10-14T00:00:00Z", "discountPercentage": 7, "discountPurchaseAt": "1990-08-31T00:00:00Z", "expireAt": "1976-12-18T00:00:00Z", "price": 51, "purchaseAt": "1971-12-19T00:00:00Z", "trialPrice": 68}], "OvoPvXRp": [{"currencyCode": "S6dxZ9Be", "currencyNamespace": "0G7QDKwX", "currencyType": "REAL", "discountAmount": 37, "discountExpireAt": "1995-03-13T00:00:00Z", "discountPercentage": 20, "discountPurchaseAt": "1981-02-16T00:00:00Z", "expireAt": "1984-12-12T00:00:00Z", "price": 18, "purchaseAt": "1980-02-09T00:00:00Z", "trialPrice": 52}, {"currencyCode": "SEFeJc60", "currencyNamespace": "RbvGELuN", "currencyType": "VIRTUAL", "discountAmount": 71, "discountExpireAt": "1988-10-30T00:00:00Z", "discountPercentage": 54, "discountPurchaseAt": "1998-06-22T00:00:00Z", "expireAt": "1973-03-02T00:00:00Z", "price": 17, "purchaseAt": "1992-01-23T00:00:00Z", "trialPrice": 66}, {"currencyCode": "RGpYotzF", "currencyNamespace": "6LAMVWTa", "currencyType": "REAL", "discountAmount": 37, "discountExpireAt": "1986-12-16T00:00:00Z", "discountPercentage": 90, "discountPurchaseAt": "1994-07-02T00:00:00Z", "expireAt": "1980-05-24T00:00:00Z", "price": 79, "purchaseAt": "1980-02-04T00:00:00Z", "trialPrice": 30}], "7YNURiNB": [{"currencyCode": "PB7glhYn", "currencyNamespace": "6H7OaEnh", "currencyType": "VIRTUAL", "discountAmount": 93, "discountExpireAt": "1982-09-03T00:00:00Z", "discountPercentage": 40, "discountPurchaseAt": "1999-04-08T00:00:00Z", "expireAt": "1974-11-08T00:00:00Z", "price": 78, "purchaseAt": "1974-05-25T00:00:00Z", "trialPrice": 73}, {"currencyCode": "XXp9L6bC", "currencyNamespace": "qTm8aGmU", "currencyType": "VIRTUAL", "discountAmount": 90, "discountExpireAt": "1984-06-30T00:00:00Z", "discountPercentage": 48, "discountPurchaseAt": "1975-05-12T00:00:00Z", "expireAt": "1990-10-14T00:00:00Z", "price": 69, "purchaseAt": "1980-02-07T00:00:00Z", "trialPrice": 35}, {"currencyCode": "XSB7tnzu", "currencyNamespace": "JyyuVIhL", "currencyType": "VIRTUAL", "discountAmount": 63, "discountExpireAt": "1979-04-26T00:00:00Z", "discountPercentage": 37, "discountPurchaseAt": "1988-09-15T00:00:00Z", "expireAt": "1981-10-29T00:00:00Z", "price": 6, "purchaseAt": "1995-05-31T00:00:00Z", "trialPrice": 30}]}, "saleConfig": {"currencyCode": "yGwEKeXH", "price": 72}, "seasonType": "PASS", "sectionExclusive": false, "sellable": true, "sku": "DfeDpv8K", "stackable": false, "status": "INACTIVE", "tags": ["drGV6NCy", "iajhTKkT", "oGHdmm7c"], "targetCurrencyCode": "XKFl8kX1", "targetNamespace": "gaZ5bbne", "thumbnailUrl": "aOfPrUi9", "useCount": 14}' \
    > test.out 2>&1
eval_tap $? 105 'CreateItem' test.out

#- 106 GetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform getItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'Pg715oiE' \
    --appId 'ymfgeMfA' \
    > test.out 2>&1
eval_tap $? 106 'GetItemByAppId' test.out

#- 107 QueryItems
./ng net.accelbyte.sdk.cli.Main platform queryItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --appType 'DEMO' \
    --availableDate 'tNq3wzeu' \
    --baseAppId 'ioCCWB4p' \
    --categoryPath 'iclvq7Qd' \
    --features 'NBHLvWRp' \
    --includeSubCategoryItem  \
    --itemType 'SEASON' \
    --limit '24' \
    --offset '53' \
    --region 'wqfMPdDz' \
    --sortBy 'updatedAt:desc,displayOrder,updatedAt:asc' \
    --storeId 'hWao6UDF' \
    --tags 'vTDSzM5G' \
    --targetNamespace 'vRdntp4a' \
    > test.out 2>&1
eval_tap $? 107 'QueryItems' test.out

#- 108 ListBasicItemsByFeatures
./ng net.accelbyte.sdk.cli.Main platform listBasicItemsByFeatures \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --features 'ljtn0T1q,MtW3vyMz,luBj21UR' \
    > test.out 2>&1
eval_tap $? 108 'ListBasicItemsByFeatures' test.out

#- 109 GetItems
./ng net.accelbyte.sdk.cli.Main platform getItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId '5Q4SFyHw' \
    --itemIds '0xhzON4D' \
    > test.out 2>&1
eval_tap $? 109 'GetItems' test.out

#- 110 GetItemBySku
./ng net.accelbyte.sdk.cli.Main platform getItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'aMP0P5XT' \
    --sku '0NC9nQdU' \
    > test.out 2>&1
eval_tap $? 110 'GetItemBySku' test.out

#- 111 GetLocaleItemBySku
./ng net.accelbyte.sdk.cli.Main platform getLocaleItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'wDjVkPRp' \
    --populateBundle  \
    --region 'vFp8RgX6' \
    --storeId 'WctbrAG6' \
    --sku '9LPDiUmn' \
    > test.out 2>&1
eval_tap $? 111 'GetLocaleItemBySku' test.out

#- 112 GetEstimatedPrice
./ng net.accelbyte.sdk.cli.Main platform getEstimatedPrice \
    --namespace "$AB_NAMESPACE" \
    --platform '71A5sOC1' \
    --region 'BF0Qpqw7' \
    --storeId 'mB7eFHEN' \
    --itemIds 'E3uan8xW' \
    --userId 'yxCX4s2b' \
    > test.out 2>&1
eval_tap $? 112 'GetEstimatedPrice' test.out

#- 113 GetItemIdBySku
./ng net.accelbyte.sdk.cli.Main platform getItemIdBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'bzw3yUNV' \
    --sku 'B9BVmGgL' \
    > test.out 2>&1
eval_tap $? 113 'GetItemIdBySku' test.out

#- 114 GetBulkItemIdBySkus
./ng net.accelbyte.sdk.cli.Main platform getBulkItemIdBySkus \
    --namespace "$AB_NAMESPACE" \
    --sku 'apcDGM3x,3MRtkT1X,3CKRR6jd' \
    --storeId 'pmtpl8l1' \
    > test.out 2>&1
eval_tap $? 114 'GetBulkItemIdBySkus' test.out

#- 115 BulkGetLocaleItems
./ng net.accelbyte.sdk.cli.Main platform bulkGetLocaleItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language '0kuE8t5E' \
    --region 'WdR71EzK' \
    --storeId 'BLqNwGZV' \
    --itemIds 'DnRRR5BB' \
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
    --platform 'DvF8HMRu' \
    --userId 'D4mE3Prw' \
    --body '{"itemIds": ["3ZxwVff0", "RkQK9I14", "0AYUEtFc"]}' \
    > test.out 2>&1
eval_tap $? 117 'ValidateItemPurchaseCondition' test.out

#- 118 BulkUpdateRegionData
./ng net.accelbyte.sdk.cli.Main platform bulkUpdateRegionData \
    --namespace "$AB_NAMESPACE" \
    --storeId 'TYfM3lAj' \
    --body '{"changes": [{"itemIdentities": ["xFVVb1N8", "fHttYN0d", "jSmwDbLF"], "itemIdentityType": "ITEM_SKU", "regionData": {"44Q70oLH": [{"currencyCode": "zoa7vBlq", "currencyNamespace": "MMn5pabe", "currencyType": "VIRTUAL", "discountAmount": 71, "discountExpireAt": "1977-09-15T00:00:00Z", "discountPercentage": 18, "discountPurchaseAt": "1987-12-21T00:00:00Z", "discountedPrice": 14, "expireAt": "1983-07-10T00:00:00Z", "price": 34, "purchaseAt": "1985-10-17T00:00:00Z", "trialPrice": 22}, {"currencyCode": "kyvL5tns", "currencyNamespace": "RK3CP6uv", "currencyType": "REAL", "discountAmount": 97, "discountExpireAt": "1979-10-11T00:00:00Z", "discountPercentage": 50, "discountPurchaseAt": "1991-11-10T00:00:00Z", "discountedPrice": 32, "expireAt": "1983-08-03T00:00:00Z", "price": 81, "purchaseAt": "1982-06-17T00:00:00Z", "trialPrice": 32}, {"currencyCode": "iLp77ZEg", "currencyNamespace": "TKV4mUoh", "currencyType": "REAL", "discountAmount": 10, "discountExpireAt": "1995-04-06T00:00:00Z", "discountPercentage": 33, "discountPurchaseAt": "1973-07-21T00:00:00Z", "discountedPrice": 85, "expireAt": "1982-03-17T00:00:00Z", "price": 91, "purchaseAt": "1983-04-01T00:00:00Z", "trialPrice": 79}], "dBal7RNs": [{"currencyCode": "uohx6s8N", "currencyNamespace": "j9PMapQa", "currencyType": "VIRTUAL", "discountAmount": 69, "discountExpireAt": "1978-10-07T00:00:00Z", "discountPercentage": 89, "discountPurchaseAt": "1994-07-04T00:00:00Z", "discountedPrice": 90, "expireAt": "1972-07-20T00:00:00Z", "price": 76, "purchaseAt": "1983-02-08T00:00:00Z", "trialPrice": 11}, {"currencyCode": "nWKJWlQl", "currencyNamespace": "I9J4zHdX", "currencyType": "VIRTUAL", "discountAmount": 43, "discountExpireAt": "1997-04-23T00:00:00Z", "discountPercentage": 51, "discountPurchaseAt": "1972-03-31T00:00:00Z", "discountedPrice": 98, "expireAt": "1987-10-10T00:00:00Z", "price": 92, "purchaseAt": "1986-11-05T00:00:00Z", "trialPrice": 43}, {"currencyCode": "anIgMp55", "currencyNamespace": "M5JbYiEc", "currencyType": "REAL", "discountAmount": 38, "discountExpireAt": "1999-01-31T00:00:00Z", "discountPercentage": 98, "discountPurchaseAt": "1997-01-09T00:00:00Z", "discountedPrice": 39, "expireAt": "1997-08-14T00:00:00Z", "price": 96, "purchaseAt": "1993-11-01T00:00:00Z", "trialPrice": 21}], "hmZdUYDd": [{"currencyCode": "VhcQvL2P", "currencyNamespace": "NboqPa8l", "currencyType": "VIRTUAL", "discountAmount": 70, "discountExpireAt": "1995-03-24T00:00:00Z", "discountPercentage": 39, "discountPurchaseAt": "1990-04-17T00:00:00Z", "discountedPrice": 71, "expireAt": "1995-04-18T00:00:00Z", "price": 50, "purchaseAt": "1986-01-24T00:00:00Z", "trialPrice": 23}, {"currencyCode": "NVIqokZX", "currencyNamespace": "3a2TujL2", "currencyType": "VIRTUAL", "discountAmount": 99, "discountExpireAt": "1994-01-03T00:00:00Z", "discountPercentage": 1, "discountPurchaseAt": "1977-08-20T00:00:00Z", "discountedPrice": 86, "expireAt": "1988-12-22T00:00:00Z", "price": 83, "purchaseAt": "1990-12-29T00:00:00Z", "trialPrice": 1}, {"currencyCode": "bawdsZfo", "currencyNamespace": "QXYnjMUd", "currencyType": "VIRTUAL", "discountAmount": 14, "discountExpireAt": "1994-07-18T00:00:00Z", "discountPercentage": 73, "discountPurchaseAt": "1997-05-13T00:00:00Z", "discountedPrice": 46, "expireAt": "1978-03-29T00:00:00Z", "price": 79, "purchaseAt": "1984-05-10T00:00:00Z", "trialPrice": 74}]}}, {"itemIdentities": ["qZ0q0244", "RnCMmtwk", "VtWDpjIr"], "itemIdentityType": "ITEM_ID", "regionData": {"QhICaz89": [{"currencyCode": "kuHhwmTf", "currencyNamespace": "GSFFY9OJ", "currencyType": "REAL", "discountAmount": 62, "discountExpireAt": "1996-04-30T00:00:00Z", "discountPercentage": 79, "discountPurchaseAt": "1973-03-03T00:00:00Z", "discountedPrice": 87, "expireAt": "1984-10-26T00:00:00Z", "price": 73, "purchaseAt": "1994-07-20T00:00:00Z", "trialPrice": 56}, {"currencyCode": "jlaC4Soy", "currencyNamespace": "I67CORka", "currencyType": "REAL", "discountAmount": 100, "discountExpireAt": "1975-12-07T00:00:00Z", "discountPercentage": 89, "discountPurchaseAt": "1997-01-11T00:00:00Z", "discountedPrice": 100, "expireAt": "1974-07-28T00:00:00Z", "price": 73, "purchaseAt": "1999-07-04T00:00:00Z", "trialPrice": 81}, {"currencyCode": "985754DU", "currencyNamespace": "ENA9MrN5", "currencyType": "VIRTUAL", "discountAmount": 15, "discountExpireAt": "1993-10-05T00:00:00Z", "discountPercentage": 43, "discountPurchaseAt": "1987-08-01T00:00:00Z", "discountedPrice": 21, "expireAt": "1984-03-04T00:00:00Z", "price": 67, "purchaseAt": "1975-05-05T00:00:00Z", "trialPrice": 50}], "1E7wd4Fi": [{"currencyCode": "bZSrxmxl", "currencyNamespace": "fmlxKvGH", "currencyType": "VIRTUAL", "discountAmount": 75, "discountExpireAt": "1990-07-20T00:00:00Z", "discountPercentage": 41, "discountPurchaseAt": "1990-07-15T00:00:00Z", "discountedPrice": 25, "expireAt": "1985-11-24T00:00:00Z", "price": 89, "purchaseAt": "1989-05-25T00:00:00Z", "trialPrice": 93}, {"currencyCode": "kjK5j20q", "currencyNamespace": "MFWdetX7", "currencyType": "REAL", "discountAmount": 81, "discountExpireAt": "1973-10-11T00:00:00Z", "discountPercentage": 5, "discountPurchaseAt": "1981-03-15T00:00:00Z", "discountedPrice": 16, "expireAt": "1997-04-14T00:00:00Z", "price": 75, "purchaseAt": "1974-03-09T00:00:00Z", "trialPrice": 54}, {"currencyCode": "5V3266c6", "currencyNamespace": "CcLpUwyf", "currencyType": "VIRTUAL", "discountAmount": 41, "discountExpireAt": "1977-12-04T00:00:00Z", "discountPercentage": 49, "discountPurchaseAt": "1984-05-19T00:00:00Z", "discountedPrice": 20, "expireAt": "1998-02-21T00:00:00Z", "price": 27, "purchaseAt": "1977-03-06T00:00:00Z", "trialPrice": 58}], "iIQxfDqr": [{"currencyCode": "85o1fh2E", "currencyNamespace": "GZba7PWb", "currencyType": "VIRTUAL", "discountAmount": 4, "discountExpireAt": "1978-11-08T00:00:00Z", "discountPercentage": 20, "discountPurchaseAt": "1991-09-10T00:00:00Z", "discountedPrice": 25, "expireAt": "1975-09-12T00:00:00Z", "price": 9, "purchaseAt": "1978-10-14T00:00:00Z", "trialPrice": 1}, {"currencyCode": "j45sYyPO", "currencyNamespace": "L1QE3Iwf", "currencyType": "REAL", "discountAmount": 83, "discountExpireAt": "1998-10-18T00:00:00Z", "discountPercentage": 83, "discountPurchaseAt": "1972-07-03T00:00:00Z", "discountedPrice": 72, "expireAt": "1979-08-18T00:00:00Z", "price": 89, "purchaseAt": "1973-06-16T00:00:00Z", "trialPrice": 15}, {"currencyCode": "Vxy9q1Au", "currencyNamespace": "meig3R68", "currencyType": "REAL", "discountAmount": 0, "discountExpireAt": "1997-01-04T00:00:00Z", "discountPercentage": 86, "discountPurchaseAt": "1988-11-02T00:00:00Z", "discountedPrice": 62, "expireAt": "1994-02-07T00:00:00Z", "price": 63, "purchaseAt": "1986-10-06T00:00:00Z", "trialPrice": 15}]}}, {"itemIdentities": ["4U6ogLmA", "p7EABJvt", "0t5ZBRWm"], "itemIdentityType": "ITEM_ID", "regionData": {"TkeyMpgm": [{"currencyCode": "wYd0Z52c", "currencyNamespace": "cji6chNn", "currencyType": "VIRTUAL", "discountAmount": 25, "discountExpireAt": "1975-02-28T00:00:00Z", "discountPercentage": 9, "discountPurchaseAt": "1988-10-30T00:00:00Z", "discountedPrice": 48, "expireAt": "1983-05-17T00:00:00Z", "price": 59, "purchaseAt": "1980-12-15T00:00:00Z", "trialPrice": 63}, {"currencyCode": "7dO7mBcV", "currencyNamespace": "f9XL5kuT", "currencyType": "VIRTUAL", "discountAmount": 86, "discountExpireAt": "1983-02-10T00:00:00Z", "discountPercentage": 5, "discountPurchaseAt": "1988-10-09T00:00:00Z", "discountedPrice": 30, "expireAt": "1997-06-24T00:00:00Z", "price": 37, "purchaseAt": "1996-12-16T00:00:00Z", "trialPrice": 43}, {"currencyCode": "eIbmyLe8", "currencyNamespace": "xqKdqsoI", "currencyType": "REAL", "discountAmount": 63, "discountExpireAt": "1983-03-17T00:00:00Z", "discountPercentage": 94, "discountPurchaseAt": "1989-09-16T00:00:00Z", "discountedPrice": 35, "expireAt": "1972-05-06T00:00:00Z", "price": 83, "purchaseAt": "1977-06-20T00:00:00Z", "trialPrice": 99}], "B3ajtExk": [{"currencyCode": "ePgscaj5", "currencyNamespace": "WRE2RsE2", "currencyType": "VIRTUAL", "discountAmount": 28, "discountExpireAt": "1990-07-19T00:00:00Z", "discountPercentage": 31, "discountPurchaseAt": "1992-02-25T00:00:00Z", "discountedPrice": 8, "expireAt": "1997-06-02T00:00:00Z", "price": 35, "purchaseAt": "1997-08-08T00:00:00Z", "trialPrice": 63}, {"currencyCode": "3W6MJd25", "currencyNamespace": "b18xgQlr", "currencyType": "REAL", "discountAmount": 72, "discountExpireAt": "1972-10-22T00:00:00Z", "discountPercentage": 47, "discountPurchaseAt": "1989-08-06T00:00:00Z", "discountedPrice": 72, "expireAt": "1998-05-04T00:00:00Z", "price": 99, "purchaseAt": "1989-02-10T00:00:00Z", "trialPrice": 91}, {"currencyCode": "KSz56M6Z", "currencyNamespace": "Uk2rA2Wg", "currencyType": "REAL", "discountAmount": 63, "discountExpireAt": "1981-06-23T00:00:00Z", "discountPercentage": 39, "discountPurchaseAt": "1996-10-25T00:00:00Z", "discountedPrice": 34, "expireAt": "1988-07-10T00:00:00Z", "price": 4, "purchaseAt": "1998-06-17T00:00:00Z", "trialPrice": 77}], "FPYlyeEI": [{"currencyCode": "xA1If4Dc", "currencyNamespace": "Yzy0Q7aX", "currencyType": "REAL", "discountAmount": 99, "discountExpireAt": "1985-07-30T00:00:00Z", "discountPercentage": 31, "discountPurchaseAt": "1977-02-21T00:00:00Z", "discountedPrice": 18, "expireAt": "1992-05-30T00:00:00Z", "price": 96, "purchaseAt": "1999-03-02T00:00:00Z", "trialPrice": 54}, {"currencyCode": "qA6U81Vl", "currencyNamespace": "xHgulYIl", "currencyType": "REAL", "discountAmount": 41, "discountExpireAt": "1992-12-17T00:00:00Z", "discountPercentage": 80, "discountPurchaseAt": "1978-04-30T00:00:00Z", "discountedPrice": 74, "expireAt": "1998-01-21T00:00:00Z", "price": 32, "purchaseAt": "1996-05-24T00:00:00Z", "trialPrice": 86}, {"currencyCode": "Tf3jmBIh", "currencyNamespace": "hWZiVwAi", "currencyType": "REAL", "discountAmount": 93, "discountExpireAt": "1971-04-13T00:00:00Z", "discountPercentage": 30, "discountPurchaseAt": "1981-03-24T00:00:00Z", "discountedPrice": 12, "expireAt": "1997-01-06T00:00:00Z", "price": 78, "purchaseAt": "1987-10-12T00:00:00Z", "trialPrice": 63}]}}]}' \
    > test.out 2>&1
eval_tap $? 118 'BulkUpdateRegionData' test.out

#- 119 SearchItems
./ng net.accelbyte.sdk.cli.Main platform searchItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemType 'OPTIONBOX' \
    --limit '53' \
    --offset '5' \
    --sortBy 'POkVBXES' \
    --storeId 'JSGjgvDW' \
    --keyword 'C9L49qLz' \
    --language 'N2Vtj7wK' \
    > test.out 2>&1
eval_tap $? 119 'SearchItems' test.out

#- 120 QueryUncategorizedItems
./ng net.accelbyte.sdk.cli.Main platform queryUncategorizedItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --limit '36' \
    --offset '45' \
    --sortBy 'displayOrder:desc,updatedAt:asc' \
    --storeId 'OYnlodu6' \
    > test.out 2>&1
eval_tap $? 120 'QueryUncategorizedItems' test.out

#- 121 GetItem
./ng net.accelbyte.sdk.cli.Main platform getItem \
    --itemId 'EWEcMDwO' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'pocK8evn' \
    > test.out 2>&1
eval_tap $? 121 'GetItem' test.out

#- 122 UpdateItem
./ng net.accelbyte.sdk.cli.Main platform updateItem \
    --itemId 'r37VN9hb' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'f5LJWdVQ' \
    --body '{"appId": "27WRQ20w", "appType": "DEMO", "baseAppId": "qPlcVWTR", "boothName": "o6Vj8hX7", "categoryPath": "s6kp3JTx", "clazz": "uAB7xcKu", "displayOrder": 9, "entitlementType": "CONSUMABLE", "ext": {"3MjrNyYV": {}, "AQ3OOQpr": {}, "syBj6kpy": {}}, "features": ["CgXz9CHY", "hkisrOut", "dPXltyOO"], "flexible": false, "images": [{"as": "zzIytJjK", "caption": "sq3UyjKQ", "height": 5, "imageUrl": "uD6thm2X", "smallImageUrl": "c3dmaFPG", "width": 21}, {"as": "EYFAyyvC", "caption": "tcU5O7s2", "height": 81, "imageUrl": "IZGEPiLv", "smallImageUrl": "P6HZH2Fd", "width": 50}, {"as": "pwwtEUJe", "caption": "eKg8CqfQ", "height": 68, "imageUrl": "ybo6tUE2", "smallImageUrl": "oxDrZ6R6", "width": 52}], "inventoryConfig": {"customAttributes": {"W75S4FRK": {}, "7WtO9k0w": {}, "AawrMuhX": {}}, "serverCustomAttributes": {"WBrVJyav": {}, "kuRAlwLN": {}, "YYjcrUJM": {}}, "slotUsed": 85}, "itemIds": ["yZQ4lm4l", "9XW7hDwg", "lTb0NpGD"], "itemQty": {"Oy9vXzFz": 64, "883EtGIC": 87, "qJgEwBlX": 49}, "itemType": "MEDIA", "listable": false, "localizations": {"n8iOD5o2": {"description": "is5Flp0D", "localExt": {"CMAgPmdd": {}, "MUah9wGp": {}, "o2CvYIY2": {}}, "longDescription": "oO9drY2x", "title": "j2h7WTud"}, "4W37MlUy": {"description": "hYVCOwWI", "localExt": {"xoQoJEXo": {}, "mWpX6AAn": {}, "DKgsTyKN": {}}, "longDescription": "LkeZCPTh", "title": "6CmkLIaq"}, "UY1xSl73": {"description": "Skt4LNeS", "localExt": {"GE2AxRUO": {}, "tMVmIwNA": {}, "ejEMiPpf": {}}, "longDescription": "1LvlUH4I", "title": "fFxeRig1"}}, "lootBoxConfig": {"rewardCount": 74, "rewards": [{"lootBoxItems": [{"count": 90, "duration": 83, "endDate": "1992-11-10T00:00:00Z", "itemId": "9eNOF5CE", "itemSku": "QomHuJA7", "itemType": "Cs53fl3N"}, {"count": 53, "duration": 16, "endDate": "1975-06-10T00:00:00Z", "itemId": "nOJfBQHA", "itemSku": "m2EgoFvO", "itemType": "tELhshhU"}, {"count": 44, "duration": 13, "endDate": "1984-01-20T00:00:00Z", "itemId": "ujpO6TFm", "itemSku": "J44SdEbH", "itemType": "0R7AlxGJ"}], "name": "D6WER6nW", "odds": 0.5234929312966831, "type": "REWARD", "weight": 4}, {"lootBoxItems": [{"count": 37, "duration": 49, "endDate": "1985-02-24T00:00:00Z", "itemId": "nNV1qLbK", "itemSku": "xOK0dyf8", "itemType": "ZhpKIEnO"}, {"count": 22, "duration": 97, "endDate": "1980-01-15T00:00:00Z", "itemId": "s1ENIWy7", "itemSku": "p813LewW", "itemType": "lTpR1jfs"}, {"count": 28, "duration": 76, "endDate": "1991-06-02T00:00:00Z", "itemId": "8YudKDa0", "itemSku": "RvarRfYZ", "itemType": "GYbBKkWG"}], "name": "WyiuKQf5", "odds": 0.47976144929374154, "type": "REWARD_GROUP", "weight": 84}, {"lootBoxItems": [{"count": 8, "duration": 13, "endDate": "1973-07-01T00:00:00Z", "itemId": "W6Zap1zZ", "itemSku": "2nGse5K0", "itemType": "0ttRehLD"}, {"count": 7, "duration": 57, "endDate": "1999-07-19T00:00:00Z", "itemId": "IcWaJAsO", "itemSku": "AI3IT0OL", "itemType": "p9JrjsCh"}, {"count": 98, "duration": 38, "endDate": "1982-04-06T00:00:00Z", "itemId": "uoaJFDyo", "itemSku": "z0db6wtu", "itemType": "eEAhZA0Z"}], "name": "EyXFhzOh", "odds": 0.14717342673333234, "type": "REWARD", "weight": 16}], "rollFunction": "DEFAULT"}, "maxCount": 54, "maxCountPerUser": 82, "name": "CQwA9a5o", "optionBoxConfig": {"boxItems": [{"count": 57, "duration": 25, "endDate": "1971-07-29T00:00:00Z", "itemId": "pFah6IPD", "itemSku": "fwq8as4e", "itemType": "oIDl7zdS"}, {"count": 0, "duration": 69, "endDate": "1990-10-15T00:00:00Z", "itemId": "pNYEkVd0", "itemSku": "zYrQd9G3", "itemType": "EKTizNuN"}, {"count": 90, "duration": 44, "endDate": "1983-10-20T00:00:00Z", "itemId": "DZe68wAH", "itemSku": "oKn6Pdq9", "itemType": "fSzWOGzO"}]}, "purchasable": false, "recurring": {"cycle": "QUARTERLY", "fixedFreeDays": 7, "fixedTrialCycles": 23, "graceDays": 3}, "regionData": {"eldkB1AN": [{"currencyCode": "b8h8TCgL", "currencyNamespace": "JtvINPmS", "currencyType": "REAL", "discountAmount": 47, "discountExpireAt": "1985-04-19T00:00:00Z", "discountPercentage": 92, "discountPurchaseAt": "1981-10-03T00:00:00Z", "expireAt": "1983-08-16T00:00:00Z", "price": 70, "purchaseAt": "1974-11-14T00:00:00Z", "trialPrice": 19}, {"currencyCode": "xOqEQ0ze", "currencyNamespace": "rI4DC7dV", "currencyType": "REAL", "discountAmount": 89, "discountExpireAt": "1977-03-26T00:00:00Z", "discountPercentage": 53, "discountPurchaseAt": "1971-01-21T00:00:00Z", "expireAt": "1985-02-17T00:00:00Z", "price": 41, "purchaseAt": "1975-04-21T00:00:00Z", "trialPrice": 87}, {"currencyCode": "5qJm5qFy", "currencyNamespace": "pU2bSZdb", "currencyType": "REAL", "discountAmount": 63, "discountExpireAt": "1999-12-02T00:00:00Z", "discountPercentage": 44, "discountPurchaseAt": "1977-07-01T00:00:00Z", "expireAt": "1973-02-25T00:00:00Z", "price": 25, "purchaseAt": "1977-03-31T00:00:00Z", "trialPrice": 40}], "IVmUlNh1": [{"currencyCode": "EUHGA7di", "currencyNamespace": "fOpGwGz2", "currencyType": "REAL", "discountAmount": 58, "discountExpireAt": "1975-05-30T00:00:00Z", "discountPercentage": 18, "discountPurchaseAt": "1990-01-03T00:00:00Z", "expireAt": "1975-12-11T00:00:00Z", "price": 44, "purchaseAt": "1996-07-29T00:00:00Z", "trialPrice": 72}, {"currencyCode": "xRxMLEzF", "currencyNamespace": "mN14g401", "currencyType": "REAL", "discountAmount": 65, "discountExpireAt": "1995-10-04T00:00:00Z", "discountPercentage": 24, "discountPurchaseAt": "1981-07-02T00:00:00Z", "expireAt": "1980-05-12T00:00:00Z", "price": 80, "purchaseAt": "1986-07-28T00:00:00Z", "trialPrice": 83}, {"currencyCode": "YY3u3B4v", "currencyNamespace": "aZHMj7Oa", "currencyType": "VIRTUAL", "discountAmount": 62, "discountExpireAt": "1984-06-20T00:00:00Z", "discountPercentage": 16, "discountPurchaseAt": "1973-07-16T00:00:00Z", "expireAt": "1983-09-08T00:00:00Z", "price": 52, "purchaseAt": "1987-08-15T00:00:00Z", "trialPrice": 98}], "AIeFIPX2": [{"currencyCode": "SB6k2yEG", "currencyNamespace": "zfgIQV5u", "currencyType": "REAL", "discountAmount": 15, "discountExpireAt": "1992-05-21T00:00:00Z", "discountPercentage": 61, "discountPurchaseAt": "1985-05-30T00:00:00Z", "expireAt": "1977-01-21T00:00:00Z", "price": 63, "purchaseAt": "1972-11-08T00:00:00Z", "trialPrice": 23}, {"currencyCode": "zY0UcnfX", "currencyNamespace": "kqYzXerL", "currencyType": "VIRTUAL", "discountAmount": 11, "discountExpireAt": "1992-06-12T00:00:00Z", "discountPercentage": 32, "discountPurchaseAt": "1994-10-24T00:00:00Z", "expireAt": "1996-04-18T00:00:00Z", "price": 70, "purchaseAt": "1993-04-29T00:00:00Z", "trialPrice": 11}, {"currencyCode": "hvUYTcg2", "currencyNamespace": "5KnZBG1a", "currencyType": "REAL", "discountAmount": 32, "discountExpireAt": "1988-05-08T00:00:00Z", "discountPercentage": 46, "discountPurchaseAt": "1996-01-14T00:00:00Z", "expireAt": "1979-01-03T00:00:00Z", "price": 66, "purchaseAt": "1972-05-31T00:00:00Z", "trialPrice": 74}]}, "saleConfig": {"currencyCode": "umUEaJwz", "price": 49}, "seasonType": "PASS", "sectionExclusive": true, "sellable": false, "sku": "76tfnPiu", "stackable": true, "status": "ACTIVE", "tags": ["wVqqvIsq", "wXyfX6uG", "ATWsdd5k"], "targetCurrencyCode": "3y1shnEa", "targetNamespace": "kqrYTJP8", "thumbnailUrl": "ZdJWx9fl", "useCount": 69}' \
    > test.out 2>&1
eval_tap $? 122 'UpdateItem' test.out

#- 123 DeleteItem
./ng net.accelbyte.sdk.cli.Main platform deleteItem \
    --itemId '4Gq7ri0l' \
    --namespace "$AB_NAMESPACE" \
    --force  \
    --storeId 'HYyEi9XC' \
    > test.out 2>&1
eval_tap $? 123 'DeleteItem' test.out

#- 124 AcquireItem
./ng net.accelbyte.sdk.cli.Main platform acquireItem \
    --itemId 'YAsMZ9Xb' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 23, "orderNo": "BLiwsehs"}' \
    > test.out 2>&1
eval_tap $? 124 'AcquireItem' test.out

#- 125 GetApp
./ng net.accelbyte.sdk.cli.Main platform getApp \
    --itemId 'GM1DEnQm' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId '7xmHu2fM' \
    > test.out 2>&1
eval_tap $? 125 'GetApp' test.out

#- 126 UpdateApp
./ng net.accelbyte.sdk.cli.Main platform updateApp \
    --itemId 'mnvmQwgK' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'EMVFqL9u' \
    --body '{"carousel": [{"alt": "o6vSfQwi", "previewUrl": "DOhkIzAr", "thumbnailUrl": "ILer8DBy", "type": "image", "url": "2GqnwlPX", "videoSource": "generic"}, {"alt": "bDXBHBjo", "previewUrl": "sKYD4WVb", "thumbnailUrl": "azd1wj1N", "type": "video", "url": "mdpyRJRJ", "videoSource": "generic"}, {"alt": "u6GfYOzb", "previewUrl": "htYVrson", "thumbnailUrl": "U8eyhY1A", "type": "image", "url": "kPCJja9i", "videoSource": "generic"}], "developer": "2SkQS9Wk", "forumUrl": "7xRgup03", "genres": ["Casual", "Action", "FreeToPlay"], "localizations": {"bqz5EYI2": {"announcement": "Op8Z1qrS", "slogan": "pPEeyXm1"}, "Iyy1w7TS": {"announcement": "ySPLsEBf", "slogan": "IJK7Y3wj"}, "QzXuBzOs": {"announcement": "bUJ57yde", "slogan": "f66O9pN9"}}, "platformRequirements": {"VwwV5rF2": [{"additionals": "fF4JQRAs", "directXVersion": "UxFTaRv9", "diskSpace": "rCmr5pqh", "graphics": "erFfl4yP", "label": "tlv34YRZ", "osVersion": "yGG3Tn3r", "processor": "xI2Tolsi", "ram": "YvJocDQ7", "soundCard": "MW3xEUj5"}, {"additionals": "y6ZUPpDw", "directXVersion": "WourLvEU", "diskSpace": "dLLt5N8o", "graphics": "VSL0rGkM", "label": "u8oDviiZ", "osVersion": "SqBbXDqw", "processor": "TuguSz0F", "ram": "McLHvDQ7", "soundCard": "DPBCUK3G"}, {"additionals": "nmOe4yRX", "directXVersion": "P4lIY4eh", "diskSpace": "aX3LZupC", "graphics": "pkyle5HJ", "label": "Kw4AW5BM", "osVersion": "wiqYKCBE", "processor": "GinxrVkh", "ram": "PcMUUpmw", "soundCard": "qQ4wpx88"}], "YcTQzVLx": [{"additionals": "kuUYGast", "directXVersion": "6iOFEEex", "diskSpace": "hV7tBute", "graphics": "5Z8LiRKb", "label": "5CMTm60b", "osVersion": "I33EEYAj", "processor": "64ggGBhW", "ram": "g3FdRjPp", "soundCard": "KcvWzOsJ"}, {"additionals": "Ihv6N5Xg", "directXVersion": "A9xVm8kd", "diskSpace": "vJrYuS8P", "graphics": "kMizoY3P", "label": "xmcoT7wr", "osVersion": "EDEbcFMF", "processor": "Hw7iCr7H", "ram": "t2S8FPEx", "soundCard": "zEVDFd4M"}, {"additionals": "d1CZMQwy", "directXVersion": "gfOouG5R", "diskSpace": "C6vR8pzr", "graphics": "QQ6tcLqZ", "label": "y7994ONS", "osVersion": "6EBvRloG", "processor": "fCYlivDv", "ram": "uOYDwG0J", "soundCard": "UaIMGABc"}], "OZ4OonXf": [{"additionals": "Gtl8YFPq", "directXVersion": "8NGOEinT", "diskSpace": "q8C50nYx", "graphics": "2WWbrLA7", "label": "n3NtXTUM", "osVersion": "MlQqRrzo", "processor": "tp4MOSQd", "ram": "TTFFZPFN", "soundCard": "2Mnbutbp"}, {"additionals": "kgynCYiJ", "directXVersion": "HCGjdcoZ", "diskSpace": "i4V7UW9d", "graphics": "LQeSpFkq", "label": "zz3z5Rhw", "osVersion": "XHrwAkjJ", "processor": "kwL0QWT4", "ram": "LccYl37g", "soundCard": "bexm8pO0"}, {"additionals": "oKAsYQde", "directXVersion": "T1uIWfdY", "diskSpace": "apq0TVQU", "graphics": "aF7z8ZGT", "label": "uyRPzGgr", "osVersion": "XE8dMnrw", "processor": "mCh1oXYL", "ram": "tVljnqiq", "soundCard": "fO60gpQ2"}]}, "platforms": ["MacOS", "Windows", "IOS"], "players": ["Coop", "Multi", "LocalCoop"], "primaryGenre": "Simulation", "publisher": "eot8bgLq", "releaseDate": "1971-08-05T00:00:00Z", "websiteUrl": "XqsaR7CA"}' \
    > test.out 2>&1
eval_tap $? 126 'UpdateApp' test.out

#- 127 DisableItem
./ng net.accelbyte.sdk.cli.Main platform disableItem \
    --itemId 't3Tr3BLX' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'weGf31Dl' \
    > test.out 2>&1
eval_tap $? 127 'DisableItem' test.out

#- 128 GetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform getItemDynamicData \
    --itemId 'lTTCX6rX' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 128 'GetItemDynamicData' test.out

#- 129 EnableItem
./ng net.accelbyte.sdk.cli.Main platform enableItem \
    --itemId 'McgC9n1P' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'HGIvV7OH' \
    > test.out 2>&1
eval_tap $? 129 'EnableItem' test.out

#- 130 FeatureItem
./ng net.accelbyte.sdk.cli.Main platform featureItem \
    --feature 'EaQMLi4J' \
    --itemId 'DLyxHv6K' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'IJQF2zCK' \
    > test.out 2>&1
eval_tap $? 130 'FeatureItem' test.out

#- 131 DefeatureItem
./ng net.accelbyte.sdk.cli.Main platform defeatureItem \
    --feature 'FjIlK3Qf' \
    --itemId 'G0qqQ87B' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'aZX3yBxR' \
    > test.out 2>&1
eval_tap $? 131 'DefeatureItem' test.out

#- 132 GetLocaleItem
./ng net.accelbyte.sdk.cli.Main platform getLocaleItem \
    --itemId 'FtcXabqq' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language '4xiZev07' \
    --populateBundle  \
    --region 'KZzqzxLE' \
    --storeId 'TrsaGdS3' \
    > test.out 2>&1
eval_tap $? 132 'GetLocaleItem' test.out

#- 133 UpdateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform updateItemPurchaseCondition \
    --itemId 'ahVLHXn7' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'UszXwDrB' \
    --body '{"purchaseCondition": {"conditionGroups": [{"operator": "or", "predicates": [{"anyOf": 40, "comparison": "is", "name": "rQeMxgHA", "predicateType": "SeasonPassPredicate", "value": "a2YWYPo0", "values": ["JjR68MNX", "O5qOLJSC", "HWbM0boD"]}, {"anyOf": 25, "comparison": "isLessThan", "name": "Wu1OD96u", "predicateType": "SeasonTierPredicate", "value": "e3ONMe6o", "values": ["bkgH7sUW", "8l7NCHry", "fbe2BeMc"]}, {"anyOf": 60, "comparison": "isNot", "name": "K4WS8nXk", "predicateType": "SeasonTierPredicate", "value": "OMA6Nbsi", "values": ["9Fd2uvcz", "6FAqZL9r", "eANdCeea"]}]}, {"operator": "and", "predicates": [{"anyOf": 64, "comparison": "isNot", "name": "I6OZ7Pxk", "predicateType": "SeasonTierPredicate", "value": "JP5XXJV8", "values": ["DdbypKIG", "l2XJLh5a", "gmqIFu25"]}, {"anyOf": 89, "comparison": "is", "name": "UcaYQQFF", "predicateType": "SeasonTierPredicate", "value": "CEyrIe5e", "values": ["s798aXuH", "7zWvRmFE", "4hIkXFT7"]}, {"anyOf": 70, "comparison": "is", "name": "A1lSpdVJ", "predicateType": "EntitlementPredicate", "value": "MlO7Wh1e", "values": ["Toa9bO8Z", "aqRUktwG", "y8vv3H0I"]}]}, {"operator": "or", "predicates": [{"anyOf": 96, "comparison": "isNot", "name": "GjacGopO", "predicateType": "SeasonTierPredicate", "value": "OdEEdrPy", "values": ["qxeB5iWd", "aUaN1sJ8", "xWIDTPdz"]}, {"anyOf": 46, "comparison": "isLessThanOrEqual", "name": "SywylidI", "predicateType": "SeasonPassPredicate", "value": "6YOwqF1M", "values": ["CQu2QC7N", "tLvAJePo", "gbOrbPAr"]}, {"anyOf": 41, "comparison": "isLessThan", "name": "aW0heO7E", "predicateType": "SeasonPassPredicate", "value": "JnKG5HCB", "values": ["C0KI2c9O", "52IHigXq", "k3b5VJsT"]}]}]}}' \
    > test.out 2>&1
eval_tap $? 133 'UpdateItemPurchaseCondition' test.out

#- 134 ReturnItem
./ng net.accelbyte.sdk.cli.Main platform returnItem \
    --itemId 'o9cufncp' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "lpO9Ncfy"}' \
    > test.out 2>&1
eval_tap $? 134 'ReturnItem' test.out

#- 135 QueryKeyGroups
./ng net.accelbyte.sdk.cli.Main platform queryKeyGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '80' \
    --name 'V7BjT5JU' \
    --offset '25' \
    --tag '44BRZGTW' \
    > test.out 2>&1
eval_tap $? 135 'QueryKeyGroups' test.out

#- 136 CreateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform createKeyGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "VTxJxtjU", "name": "6mHXCvB7", "status": "INACTIVE", "tags": ["Sqg4uGUR", "OJ1Cy7qo", "1rjq5dWD"]}' \
    > test.out 2>&1
eval_tap $? 136 'CreateKeyGroup' test.out

#- 137 GetKeyGroupByBoothName
eval_tap 0 137 'GetKeyGroupByBoothName # SKIP deprecated' test.out

#- 138 GetKeyGroup
./ng net.accelbyte.sdk.cli.Main platform getKeyGroup \
    --keyGroupId 'BDqCIHMi' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 138 'GetKeyGroup' test.out

#- 139 UpdateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform updateKeyGroup \
    --keyGroupId 'JPNM9D1v' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "bUfAVlOS", "name": "wX4noS7S", "status": "INACTIVE", "tags": ["u2uAlgeD", "R8Hlh9Sf", "Q4KM82N0"]}' \
    > test.out 2>&1
eval_tap $? 139 'UpdateKeyGroup' test.out

#- 140 GetKeyGroupDynamic
./ng net.accelbyte.sdk.cli.Main platform getKeyGroupDynamic \
    --keyGroupId 'lhYUrJdA' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 140 'GetKeyGroupDynamic' test.out

#- 141 ListKeys
./ng net.accelbyte.sdk.cli.Main platform listKeys \
    --keyGroupId 'cbrFq74G' \
    --namespace "$AB_NAMESPACE" \
    --limit '37' \
    --offset '38' \
    --status 'ACQUIRED' \
    > test.out 2>&1
eval_tap $? 141 'ListKeys' test.out

#- 142 UploadKeys
./ng net.accelbyte.sdk.cli.Main platform uploadKeys \
    --keyGroupId '2LY8phVF' \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 142 'UploadKeys' test.out

#- 143 QueryOrders
./ng net.accelbyte.sdk.cli.Main platform queryOrders \
    --namespace "$AB_NAMESPACE" \
    --endTime 'KvJnT2M3' \
    --limit '65' \
    --offset '80' \
    --orderNos 'PLbRmDkW,XubuFDVt,SGRkBC0M' \
    --sortBy 'AhZDYVIp' \
    --startTime '0TluYETk' \
    --status 'CLOSED' \
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
    --orderNo 'tHFPrSwj' \
    > test.out 2>&1
eval_tap $? 145 'GetOrder' test.out

#- 146 RefundOrder
./ng net.accelbyte.sdk.cli.Main platform refundOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'Y5ZhqrOs' \
    --body '{"description": "ohi31EtH"}' \
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
    --body '{"dryRun": true, "notifyUrl": "x7pdkSTB", "privateKey": "FjZfm4J7"}' \
    > test.out 2>&1
eval_tap $? 148 'UpdatePaymentCallbackConfig' test.out

#- 149 QueryPaymentNotifications
./ng net.accelbyte.sdk.cli.Main platform queryPaymentNotifications \
    --namespace "$AB_NAMESPACE" \
    --endDate 'J7LNv27L' \
    --externalId 'hWcDRC2x' \
    --limit '3' \
    --notificationSource 'STRIPE' \
    --notificationType 'rcXvd6Y8' \
    --offset '67' \
    --paymentOrderNo 'LZ7qmWJQ' \
    --startDate 'UoM0Kqkz' \
    --status 'PROCESSED' \
    > test.out 2>&1
eval_tap $? 149 'QueryPaymentNotifications' test.out

#- 150 QueryPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform queryPaymentOrders \
    --namespace "$AB_NAMESPACE" \
    --channel 'EXTERNAL' \
    --extTxId 'EM5iqKgQ' \
    --limit '55' \
    --offset '45' \
    --status 'DELETED' \
    > test.out 2>&1
eval_tap $? 150 'QueryPaymentOrders' test.out

#- 151 CreatePaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform createPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --body '{"currencyCode": "pygxHPUz", "currencyNamespace": "UOhPe7ah", "customParameters": {"8DgWxCYv": {}, "dCJlFTDZ": {}, "B5lD9ogO": {}}, "description": "DAFCgrQr", "extOrderNo": "3FFGV8D7", "extUserId": "6lN1FA7o", "itemType": "CODE", "language": "riUL_kUFV_626", "metadata": {"iMZZOQFf": "TI6cF4Ik", "kF3z1YBg": "MQIlfQa1", "jXHVNpB6": "xe2EBuOq"}, "notifyUrl": "1ZRWk6aO", "omitNotification": true, "platform": "q0OkEmHv", "price": 34, "recurringPaymentOrderNo": "FWoBgGfF", "region": "0yudts74", "returnUrl": "7IzmqEvF", "sandbox": true, "sku": "Nmz0pXua", "subscriptionId": "60GewikM", "targetNamespace": "vy0E87ny", "targetUserId": "knUvqRwl", "title": "5qYCMPwD"}' \
    > test.out 2>&1
eval_tap $? 151 'CreatePaymentOrderByDedicated' test.out

#- 152 ListExtOrderNoByExtTxId
./ng net.accelbyte.sdk.cli.Main platform listExtOrderNoByExtTxId \
    --namespace "$AB_NAMESPACE" \
    --extTxId 'MLHHpI2J' \
    > test.out 2>&1
eval_tap $? 152 'ListExtOrderNoByExtTxId' test.out

#- 153 GetPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'Pp6OTQVB' \
    > test.out 2>&1
eval_tap $? 153 'GetPaymentOrder' test.out

#- 154 ChargePaymentOrder
./ng net.accelbyte.sdk.cli.Main platform chargePaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'm931yYOn' \
    --body '{"extTxId": "bZz8eAp3", "paymentMethod": "07SU9O2i", "paymentProvider": "CHECKOUT"}' \
    > test.out 2>&1
eval_tap $? 154 'ChargePaymentOrder' test.out

#- 155 RefundPaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform refundPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'SD6ZBnsb' \
    --body '{"description": "afYvkciC"}' \
    > test.out 2>&1
eval_tap $? 155 'RefundPaymentOrderByDedicated' test.out

#- 156 SimulatePaymentOrderNotification
./ng net.accelbyte.sdk.cli.Main platform simulatePaymentOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'wST6AgXe' \
    --body '{"amount": 85, "currencyCode": "izm4nY2p", "notifyType": "CHARGE", "paymentProvider": "STRIPE", "salesTax": 71, "vat": 73}' \
    > test.out 2>&1
eval_tap $? 156 'SimulatePaymentOrderNotification' test.out

#- 157 GetPaymentOrderChargeStatus
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrderChargeStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'ffg4AWGq' \
    > test.out 2>&1
eval_tap $? 157 'GetPaymentOrderChargeStatus' test.out

#- 158 GetPlatformEntitlementConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformEntitlementConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'IOS' \
    > test.out 2>&1
eval_tap $? 158 'GetPlatformEntitlementConfig' test.out

#- 159 UpdatePlatformEntitlementConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformEntitlementConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Oculus' \
    --body '{"allowedPlatformOrigins": ["Steam", "Xbox", "Twitch"]}' \
    > test.out 2>&1
eval_tap $? 159 'UpdatePlatformEntitlementConfig' test.out

#- 160 GetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Playstation' \
    > test.out 2>&1
eval_tap $? 160 'GetPlatformWalletConfig' test.out

#- 161 UpdatePlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'GooglePlay' \
    --body '{"allowedBalanceOrigins": ["Epic", "System", "Steam"]}' \
    > test.out 2>&1
eval_tap $? 161 'UpdatePlatformWalletConfig' test.out

#- 162 ResetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform resetPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Oculus' \
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
    --body '{"entitlement": {"consumable": {"enabled": true, "strategy": "REVOKE_OR_REPORT"}, "durable": {"enabled": false, "strategy": "CUSTOM"}}, "wallet": {"enabled": true, "strategy": "REVOKE_OR_REPORT"}}' \
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
    --endTime 'dQP8zSkF' \
    --limit '55' \
    --offset '35' \
    --source 'ORDER' \
    --startTime 'Alnj8f57' \
    --status 'SUCCESS' \
    --transactionId 'TQ56BBsa' \
    --userId '4DACqOkM' \
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
    --body '{"appConfig": {"appName": "1RfyZBsx"}, "customConfig": {"connectionType": "TLS", "grpcServerAddress": "v4Gclnqa"}, "extendType": "CUSTOM"}' \
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
    --body '{"description": "kDWm4FLg", "eventTopic": "mc5ix9wn", "maxAwarded": 5, "maxAwardedPerUser": 45, "namespaceExpression": "drz3uzPk", "rewardCode": "7Pf195Ez", "rewardConditions": [{"condition": "n6BMV7mF", "conditionName": "4bIrgfYU", "eventName": "2lzGNkbx", "rewardItems": [{"duration": 85, "endDate": "1978-01-04T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "7BX5pnb3", "quantity": 39, "sku": "1PAdjuMz"}, {"duration": 44, "endDate": "1990-08-14T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "Wz2TBMVG", "quantity": 19, "sku": "3MmjztKK"}, {"duration": 23, "endDate": "1999-11-22T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "V76xAFSo", "quantity": 10, "sku": "byriEuUW"}]}, {"condition": "A6gtiV09", "conditionName": "dBKSU2L1", "eventName": "kHDfxyIU", "rewardItems": [{"duration": 15, "endDate": "1999-06-24T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "1H4mtijg", "quantity": 44, "sku": "QGtMwSS5"}, {"duration": 19, "endDate": "1990-06-29T00:00:00Z", "identityType": "ITEM_ID", "itemId": "oyQN5QOv", "quantity": 33, "sku": "WxNQfvb7"}, {"duration": 61, "endDate": "1998-01-16T00:00:00Z", "identityType": "ITEM_ID", "itemId": "QFx6lboe", "quantity": 27, "sku": "ckqvhpUa"}]}, {"condition": "bgO9XNSd", "conditionName": "jI2f0d2z", "eventName": "Foc4dDsW", "rewardItems": [{"duration": 38, "endDate": "1998-06-24T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "mrWSUM0d", "quantity": 3, "sku": "5Lo9bUZ6"}, {"duration": 100, "endDate": "1972-11-11T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "hi3onoqT", "quantity": 7, "sku": "LzAPFlpI"}, {"duration": 20, "endDate": "1989-06-16T00:00:00Z", "identityType": "ITEM_ID", "itemId": "Tz8qsQY0", "quantity": 88, "sku": "LHQNMYal"}]}], "userIdExpression": "nKVipQUt"}' \
    > test.out 2>&1
eval_tap $? 171 'CreateReward' test.out

#- 172 QueryRewards
./ng net.accelbyte.sdk.cli.Main platform queryRewards \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'taf16cCX' \
    --limit '85' \
    --offset '54' \
    --sortBy 'rewardCode,namespace,rewardCode:desc' \
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
    --rewardId 'lDYTWZsb' \
    > test.out 2>&1
eval_tap $? 175 'GetReward' test.out

#- 176 UpdateReward
./ng net.accelbyte.sdk.cli.Main platform updateReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'ixFxMvsm' \
    --body '{"description": "7cnL7IA6", "eventTopic": "Glwb0Hh8", "maxAwarded": 33, "maxAwardedPerUser": 1, "namespaceExpression": "bj6pcAxz", "rewardCode": "tlcB63Oa", "rewardConditions": [{"condition": "WzBuPpWJ", "conditionName": "zczeYGWF", "eventName": "NveIFEif", "rewardItems": [{"duration": 47, "endDate": "1985-10-12T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "x6ShPxmk", "quantity": 78, "sku": "09kyPAQf"}, {"duration": 49, "endDate": "1975-06-11T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "iZ9nv0tj", "quantity": 77, "sku": "tvHPPjA4"}, {"duration": 99, "endDate": "1973-04-14T00:00:00Z", "identityType": "ITEM_ID", "itemId": "TVPdzBDU", "quantity": 2, "sku": "057b8TcH"}]}, {"condition": "ITbDziBS", "conditionName": "gcOX0H2M", "eventName": "wkHFIu2t", "rewardItems": [{"duration": 73, "endDate": "1972-02-07T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "zo7a9cnz", "quantity": 19, "sku": "3oNNegjv"}, {"duration": 12, "endDate": "1985-07-26T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "3qDn6bXG", "quantity": 74, "sku": "vWDdLY2W"}, {"duration": 63, "endDate": "1988-03-29T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "D5Gl3iiM", "quantity": 80, "sku": "o9mLYhOH"}]}, {"condition": "UOgHbPgT", "conditionName": "98DSWEmv", "eventName": "3lFJ1Sm2", "rewardItems": [{"duration": 28, "endDate": "1971-09-10T00:00:00Z", "identityType": "ITEM_ID", "itemId": "656wfsRt", "quantity": 94, "sku": "qQmjyix5"}, {"duration": 53, "endDate": "1996-01-22T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "uGk8kbZw", "quantity": 13, "sku": "1yaYq1BV"}, {"duration": 34, "endDate": "1987-12-14T00:00:00Z", "identityType": "ITEM_ID", "itemId": "x1uLe7iS", "quantity": 15, "sku": "4kgFwfYk"}]}], "userIdExpression": "nfKsHlcG"}' \
    > test.out 2>&1
eval_tap $? 176 'UpdateReward' test.out

#- 177 DeleteReward
./ng net.accelbyte.sdk.cli.Main platform deleteReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'f6AheoHi' \
    > test.out 2>&1
eval_tap $? 177 'DeleteReward' test.out

#- 178 CheckEventCondition
./ng net.accelbyte.sdk.cli.Main platform checkEventCondition \
    --namespace "$AB_NAMESPACE" \
    --rewardId '4qkwmC1D' \
    --body '{"payload": {"AfSfMbd0": {}, "HwzmHf4c": {}, "0rexHRmT": {}}}' \
    > test.out 2>&1
eval_tap $? 178 'CheckEventCondition' test.out

#- 179 DeleteRewardConditionRecord
./ng net.accelbyte.sdk.cli.Main platform deleteRewardConditionRecord \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'Vki2g2hd' \
    --body '{"conditionName": "DUK7iaTZ", "userId": "ZtiaBLJU"}' \
    > test.out 2>&1
eval_tap $? 179 'DeleteRewardConditionRecord' test.out

#- 180 QuerySections
./ng net.accelbyte.sdk.cli.Main platform querySections \
    --namespace "$AB_NAMESPACE" \
    --end 'cuQtZDgt' \
    --limit '25' \
    --offset '84' \
    --start '3EupRQzD' \
    --storeId 'yRiU5eSM' \
    --viewId 'nbYjJeob' \
    > test.out 2>&1
eval_tap $? 180 'QuerySections' test.out

#- 181 CreateSection
./ng net.accelbyte.sdk.cli.Main platform createSection \
    --namespace "$AB_NAMESPACE" \
    --storeId '7yDntWvw' \
    --body '{"active": true, "displayOrder": 12, "endDate": "1977-03-19T00:00:00Z", "ext": {"mpwXjuXG": {}, "WojP7QvW": {}, "FTZjQTpt": {}}, "fixedPeriodRotationConfig": {"backfillType": "NONE", "duration": 22, "itemCount": 99, "rule": "SEQUENCE"}, "items": [{"id": "sT8xypWw", "sku": "z75dXQXa"}, {"id": "e7KlHJ7G", "sku": "gZDliKzQ"}, {"id": "IvByWQO9", "sku": "TKa0AnxM"}], "localizations": {"8VdpQ6HO": {"description": "UbQTeowa", "localExt": {"NAvKwq99": {}, "uSvek1Lf": {}, "TImyEQWo": {}}, "longDescription": "7ul8Oa4E", "title": "d3rqjBhn"}, "07vhFFws": {"description": "yX2U0E6u", "localExt": {"HdUUe6Us": {}, "bhw7YCmG": {}, "lyiEkM5u": {}}, "longDescription": "6lS9zSNd", "title": "nO7H7PLi"}, "5i9LrTvh": {"description": "grGwLSWx", "localExt": {"7TEk9yX7": {}, "Wh62rfaK": {}, "56R7Ae8B": {}}, "longDescription": "zgJwwH09", "title": "RMNdelRB"}}, "name": "SA4HPN7c", "rotationType": "FIXED_PERIOD", "startDate": "1982-02-26T00:00:00Z", "viewId": "JDO4iV8E"}' \
    > test.out 2>&1
eval_tap $? 181 'CreateSection' test.out

#- 182 PurgeExpiredSection
./ng net.accelbyte.sdk.cli.Main platform purgeExpiredSection \
    --namespace "$AB_NAMESPACE" \
    --storeId 'uKhLys4A' \
    > test.out 2>&1
eval_tap $? 182 'PurgeExpiredSection' test.out

#- 183 GetSection
./ng net.accelbyte.sdk.cli.Main platform getSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'uXqagnp4' \
    --storeId 'wZwfRC5D' \
    > test.out 2>&1
eval_tap $? 183 'GetSection' test.out

#- 184 UpdateSection
./ng net.accelbyte.sdk.cli.Main platform updateSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'sdQdKqUw' \
    --storeId 'gLs6KM0B' \
    --body '{"active": true, "displayOrder": 41, "endDate": "1973-09-06T00:00:00Z", "ext": {"EzoslQ5Q": {}, "qxAFvdNO": {}, "uPnrv5ER": {}}, "fixedPeriodRotationConfig": {"backfillType": "CUSTOM", "duration": 90, "itemCount": 23, "rule": "SEQUENCE"}, "items": [{"id": "Pc7O56wP", "sku": "EZM3fiXk"}, {"id": "CN7zW6q0", "sku": "GnwriPvi"}, {"id": "yuGCQKjr", "sku": "CeTwNT08"}], "localizations": {"kO7X6Jhk": {"description": "zyyfxg9y", "localExt": {"XS8bgf4O": {}, "WdUpoMVd": {}, "pqMPxPVY": {}}, "longDescription": "l9AjfhBm", "title": "aj1qh7Sw"}, "iZVO3pRY": {"description": "SE2YV3qO", "localExt": {"31faLVje": {}, "0Y4BL3mh": {}, "pAVyPA42": {}}, "longDescription": "PBKWDJpJ", "title": "h8BCYKmk"}, "fmlpA7uR": {"description": "l6TXykOM", "localExt": {"gG1762Co": {}, "ugNfa6nW": {}, "7ZCH55sY": {}}, "longDescription": "5ngjYABY", "title": "T0VKgXb5"}}, "name": "1tjONCIJ", "rotationType": "CUSTOM", "startDate": "1988-06-21T00:00:00Z", "viewId": "K6TEvhD4"}' \
    > test.out 2>&1
eval_tap $? 184 'UpdateSection' test.out

#- 185 DeleteSection
./ng net.accelbyte.sdk.cli.Main platform deleteSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'f8MiRKRb' \
    --storeId 'eYzNAvhE' \
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
    --body '{"defaultLanguage": "akdOUxls", "defaultRegion": "F2VTORnx", "description": "ujgG8m98", "supportedLanguages": ["ThugjhkZ", "9wQ7U1ZM", "r4ZCmo0V"], "supportedRegions": ["gqoPvxn3", "YHdRiJJZ", "VxSjRKb0"], "title": "XCaKhohZ"}' \
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
    --body '{"catalogType": "SECTION", "fieldsToBeIncluded": ["nlfaaWl9", "6d8BcLs2", "DaUeXopG"], "idsToBeExported": ["UGyPDj4q", "Nh0NHmEi", "hTvXjZDu"], "storeId": "tRPszRJp"}' \
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
    --storeId 'oPlDXUIe' \
    > test.out 2>&1
eval_tap $? 196 'GetStore' test.out

#- 197 UpdateStore
./ng net.accelbyte.sdk.cli.Main platform updateStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'oovj9uMH' \
    --body '{"defaultLanguage": "y8aezAuk", "defaultRegion": "BhTgzT5A", "description": "4yV7izzS", "supportedLanguages": ["NZ6Dtdg0", "Ya1rWtFQ", "kkby9e2x"], "supportedRegions": ["spbj5Bam", "OwhB7shA", "sKsFJPvF"], "title": "BflAkyxt"}' \
    > test.out 2>&1
eval_tap $? 197 'UpdateStore' test.out

#- 198 DeleteStore
./ng net.accelbyte.sdk.cli.Main platform deleteStore \
    --namespace "$AB_NAMESPACE" \
    --storeId '6olE5unh' \
    > test.out 2>&1
eval_tap $? 198 'DeleteStore' test.out

#- 199 QueryChanges
./ng net.accelbyte.sdk.cli.Main platform queryChanges \
    --namespace "$AB_NAMESPACE" \
    --storeId 'GHIVgmZa' \
    --action 'DELETE' \
    --itemSku 'EssnmW0B' \
    --itemType 'OPTIONBOX' \
    --limit '60' \
    --offset '64' \
    --selected  \
    --sortBy 'updatedAt,createdAt:desc' \
    --status 'UNPUBLISHED' \
    --type 'ITEM' \
    --updatedAtEnd 'PBHTg4gf' \
    --updatedAtStart 'teImE4wK' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 199 'QueryChanges' test.out

#- 200 PublishAll
./ng net.accelbyte.sdk.cli.Main platform publishAll \
    --namespace "$AB_NAMESPACE" \
    --storeId 'AC6jwSov' \
    > test.out 2>&1
eval_tap $? 200 'PublishAll' test.out

#- 201 PublishSelected
./ng net.accelbyte.sdk.cli.Main platform publishSelected \
    --namespace "$AB_NAMESPACE" \
    --storeId 'nxsRgyKp' \
    > test.out 2>&1
eval_tap $? 201 'PublishSelected' test.out

#- 202 SelectAllRecords
./ng net.accelbyte.sdk.cli.Main platform selectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'azDZSA4N' \
    > test.out 2>&1
eval_tap $? 202 'SelectAllRecords' test.out

#- 203 SelectAllRecordsByCriteria
./ng net.accelbyte.sdk.cli.Main platform selectAllRecordsByCriteria \
    --namespace "$AB_NAMESPACE" \
    --storeId 'qI6hsy8n' \
    --action 'UPDATE' \
    --itemSku 'mb9J6D79' \
    --itemType 'OPTIONBOX' \
    --selected  \
    --type 'SECTION' \
    --updatedAtEnd 'FHoqIBoG' \
    --updatedAtStart 'aenC6POi' \
    > test.out 2>&1
eval_tap $? 203 'SelectAllRecordsByCriteria' test.out

#- 204 GetStatistic
./ng net.accelbyte.sdk.cli.Main platform getStatistic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'GxS36OKG' \
    --action 'UPDATE' \
    --itemSku 'ynoIUyWr' \
    --itemType 'SEASON' \
    --type 'CATEGORY' \
    --updatedAtEnd 'hVBl1vaS' \
    --updatedAtStart 'x0CdYm0M' \
    > test.out 2>&1
eval_tap $? 204 'GetStatistic' test.out

#- 205 UnselectAllRecords
./ng net.accelbyte.sdk.cli.Main platform unselectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 't6skneM1' \
    > test.out 2>&1
eval_tap $? 205 'UnselectAllRecords' test.out

#- 206 SelectRecord
./ng net.accelbyte.sdk.cli.Main platform selectRecord \
    --changeId 'Kiprk7dO' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Ny2IvUj1' \
    > test.out 2>&1
eval_tap $? 206 'SelectRecord' test.out

#- 207 UnselectRecord
./ng net.accelbyte.sdk.cli.Main platform unselectRecord \
    --changeId 'TPbT6Yz8' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'TLzIuTrW' \
    > test.out 2>&1
eval_tap $? 207 'UnselectRecord' test.out

#- 208 CloneStore
./ng net.accelbyte.sdk.cli.Main platform cloneStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'KykH2RQ6' \
    --targetStoreId '3bT0M2B3' \
    > test.out 2>&1
eval_tap $? 208 'CloneStore' test.out

#- 209 ExportStore
eval_tap 0 209 'ExportStore # SKIP deprecated' test.out

#- 210 QueryImportHistory
./ng net.accelbyte.sdk.cli.Main platform queryImportHistory \
    --namespace "$AB_NAMESPACE" \
    --storeId 'HKisdlot' \
    --end 'yHJtvWgO' \
    --limit '59' \
    --offset '53' \
    --sortBy 'gOXZftRD' \
    --start 'ND4jlidi' \
    --success  \
    > test.out 2>&1
eval_tap $? 210 'QueryImportHistory' test.out

#- 211 ImportStoreByCSV
./ng net.accelbyte.sdk.cli.Main platform importStoreByCSV \
    --namespace "$AB_NAMESPACE" \
    --storeId 'O6G7IOAl' \
    --category 'tmp.dat' \
    --display 'tmp.dat' \
    --item 'tmp.dat' \
    --notes '5F6t7cM4' \
    --section 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 211 'ImportStoreByCSV' test.out

#- 212 QuerySubscriptions
./ng net.accelbyte.sdk.cli.Main platform querySubscriptions \
    --namespace "$AB_NAMESPACE" \
    --chargeStatus 'CHARGE_FAILED' \
    --itemId 'JAnPoCbe' \
    --limit '7' \
    --offset '27' \
    --sku 'Uxd7t8Hl' \
    --status 'CANCELLED' \
    --subscribedBy 'USER' \
    --userId 'tGrpkFsA' \
    > test.out 2>&1
eval_tap $? 212 'QuerySubscriptions' test.out

#- 213 RecurringChargeSubscription
./ng net.accelbyte.sdk.cli.Main platform recurringChargeSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'NvWQLrCU' \
    > test.out 2>&1
eval_tap $? 213 'RecurringChargeSubscription' test.out

#- 214 GetTicketDynamic
./ng net.accelbyte.sdk.cli.Main platform getTicketDynamic \
    --boothName 'PsAWIWop' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 214 'GetTicketDynamic' test.out

#- 215 DecreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform decreaseTicketSale \
    --boothName 'oIASktfC' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "W56yA8RW"}' \
    > test.out 2>&1
eval_tap $? 215 'DecreaseTicketSale' test.out

#- 216 GetTicketBoothID
./ng net.accelbyte.sdk.cli.Main platform getTicketBoothID \
    --boothName 'kacgX6MP' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 216 'GetTicketBoothID' test.out

#- 217 IncreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform increaseTicketSale \
    --boothName 'iOQzesbr' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 47, "orderNo": "aclI4SlY"}' \
    > test.out 2>&1
eval_tap $? 217 'IncreaseTicketSale' test.out

#- 218 Commit
./ng net.accelbyte.sdk.cli.Main platform commit \
    --namespace "$AB_NAMESPACE" \
    --body '{"actions": [{"operations": [{"creditPayload": {"balanceOrigin": "GooglePlay", "count": 47, "currencyCode": "aFPaLhvd", "expireAt": "1980-04-13T00:00:00Z"}, "debitPayload": {"count": 82, "currencyCode": "TG7RSwEU", "walletPlatform": "Other"}, "fulFillItemPayload": {"count": 69, "entitlementCollectionId": "f32BRn7y", "entitlementOrigin": "Steam", "itemIdentity": "AHbzjhsd", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 83, "entitlementId": "oY4Ty4h7"}, "type": "DEBIT_WALLET"}, {"creditPayload": {"balanceOrigin": "System", "count": 73, "currencyCode": "eWnr4aap", "expireAt": "1974-09-13T00:00:00Z"}, "debitPayload": {"count": 97, "currencyCode": "aOoqoEP9", "walletPlatform": "Oculus"}, "fulFillItemPayload": {"count": 56, "entitlementCollectionId": "hFbbYz6W", "entitlementOrigin": "Epic", "itemIdentity": "UqCl2WD6", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 80, "entitlementId": "LjP23yF5"}, "type": "DEBIT_WALLET"}, {"creditPayload": {"balanceOrigin": "IOS", "count": 6, "currencyCode": "B7lCcIzI", "expireAt": "1974-12-13T00:00:00Z"}, "debitPayload": {"count": 17, "currencyCode": "RWFAoLZb", "walletPlatform": "GooglePlay"}, "fulFillItemPayload": {"count": 83, "entitlementCollectionId": "m8HB0Wle", "entitlementOrigin": "Twitch", "itemIdentity": "UdLQmsGu", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 14, "entitlementId": "5gtqQbzp"}, "type": "DEBIT_WALLET"}], "userId": "WGf4J6NH"}, {"operations": [{"creditPayload": {"balanceOrigin": "Twitch", "count": 97, "currencyCode": "cJfgp91P", "expireAt": "1990-01-10T00:00:00Z"}, "debitPayload": {"count": 79, "currencyCode": "8PG8IBDO", "walletPlatform": "Epic"}, "fulFillItemPayload": {"count": 16, "entitlementCollectionId": "g7suExsG", "entitlementOrigin": "Twitch", "itemIdentity": "6I2dwNag", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 57, "entitlementId": "EucUCzCJ"}, "type": "CREDIT_WALLET"}, {"creditPayload": {"balanceOrigin": "Xbox", "count": 74, "currencyCode": "mhl0ayIO", "expireAt": "1992-10-03T00:00:00Z"}, "debitPayload": {"count": 0, "currencyCode": "yjKmCNl6", "walletPlatform": "Oculus"}, "fulFillItemPayload": {"count": 10, "entitlementCollectionId": "0RLfPTXp", "entitlementOrigin": "Xbox", "itemIdentity": "ojK59YfJ", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 56, "entitlementId": "682OgOPx"}, "type": "REVOKE_ENTITLEMENT"}, {"creditPayload": {"balanceOrigin": "Steam", "count": 54, "currencyCode": "a3eX1C7H", "expireAt": "1987-03-11T00:00:00Z"}, "debitPayload": {"count": 85, "currencyCode": "G6PcY6c2", "walletPlatform": "Other"}, "fulFillItemPayload": {"count": 12, "entitlementCollectionId": "T4kUl8Am", "entitlementOrigin": "IOS", "itemIdentity": "ibrBF4fC", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 65, "entitlementId": "XXfOIB6Y"}, "type": "CREDIT_WALLET"}], "userId": "QBArLzzS"}, {"operations": [{"creditPayload": {"balanceOrigin": "GooglePlay", "count": 26, "currencyCode": "am4pXNSJ", "expireAt": "1971-08-23T00:00:00Z"}, "debitPayload": {"count": 89, "currencyCode": "WJLvtxWD", "walletPlatform": "Playstation"}, "fulFillItemPayload": {"count": 89, "entitlementCollectionId": "CjfCfRiu", "entitlementOrigin": "System", "itemIdentity": "Lw0J9jy2", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 48, "entitlementId": "qX2wZ1aV"}, "type": "FULFILL_ITEM"}, {"creditPayload": {"balanceOrigin": "Playstation", "count": 6, "currencyCode": "frhE34sv", "expireAt": "1990-11-24T00:00:00Z"}, "debitPayload": {"count": 69, "currencyCode": "1DIAJQ3t", "walletPlatform": "Oculus"}, "fulFillItemPayload": {"count": 53, "entitlementCollectionId": "4TJvkVvD", "entitlementOrigin": "Steam", "itemIdentity": "qZzOJwc9", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 67, "entitlementId": "jgl379zH"}, "type": "CREDIT_WALLET"}, {"creditPayload": {"balanceOrigin": "Playstation", "count": 3, "currencyCode": "0WZDmTKx", "expireAt": "1975-08-19T00:00:00Z"}, "debitPayload": {"count": 51, "currencyCode": "SChCyTas", "walletPlatform": "Steam"}, "fulFillItemPayload": {"count": 32, "entitlementCollectionId": "PT9JaLIs", "entitlementOrigin": "Epic", "itemIdentity": "Reea2QN1", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 78, "entitlementId": "7MyX5Pqg"}, "type": "DEBIT_WALLET"}], "userId": "d2XbAPZ7"}], "metadata": {"H3Dr5qzI": {}, "CENsO9Ur": {}, "ckkQX1Up": {}}, "needPreCheck": true, "transactionId": "sCUlJzir", "type": "JAPXVf9F"}' \
    > test.out 2>&1
eval_tap $? 218 'Commit' test.out

#- 219 GetTradeHistoryByCriteria
./ng net.accelbyte.sdk.cli.Main platform getTradeHistoryByCriteria \
    --namespace "$AB_NAMESPACE" \
    --limit '81' \
    --offset '97' \
    --status 'FAILED' \
    --type 'wxZx5dYd' \
    --userId '9QSmLjJ7' \
    > test.out 2>&1
eval_tap $? 219 'GetTradeHistoryByCriteria' test.out

#- 220 GetTradeHistoryByTransactionId
./ng net.accelbyte.sdk.cli.Main platform getTradeHistoryByTransactionId \
    --namespace "$AB_NAMESPACE" \
    --transactionId 'XqCYD4I5' \
    > test.out 2>&1
eval_tap $? 220 'GetTradeHistoryByTransactionId' test.out

#- 221 UnlockSteamUserAchievement
./ng net.accelbyte.sdk.cli.Main platform unlockSteamUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'e0qvF716' \
    --body '{"achievements": [{"id": "TMGSkYjs", "value": 43}, {"id": "FYA5jiFB", "value": 12}, {"id": "s7dsGNiN", "value": 15}], "steamUserId": "p9CM1gus"}' \
    > test.out 2>&1
eval_tap $? 221 'UnlockSteamUserAchievement' test.out

#- 222 GetXblUserAchievements
./ng net.accelbyte.sdk.cli.Main platform getXblUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'lRpmveIT' \
    --xboxUserId 'LMZYmEA7' \
    > test.out 2>&1
eval_tap $? 222 'GetXblUserAchievements' test.out

#- 223 UpdateXblUserAchievement
./ng net.accelbyte.sdk.cli.Main platform updateXblUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'ywEorx5O' \
    --body '{"achievements": [{"id": "cxWDOXvA", "percentComplete": 75}, {"id": "XFYmmaWl", "percentComplete": 77}, {"id": "WEbOkFJL", "percentComplete": 48}], "serviceConfigId": "nE1MuJAZ", "titleId": "a2T9JtOX", "xboxUserId": "yibEHLOo"}' \
    > test.out 2>&1
eval_tap $? 223 'UpdateXblUserAchievement' test.out

#- 224 AnonymizeCampaign
./ng net.accelbyte.sdk.cli.Main platform anonymizeCampaign \
    --namespace "$AB_NAMESPACE" \
    --userId 'aASm138O' \
    > test.out 2>&1
eval_tap $? 224 'AnonymizeCampaign' test.out

#- 225 AnonymizeEntitlement
./ng net.accelbyte.sdk.cli.Main platform anonymizeEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'hfjJUKt2' \
    > test.out 2>&1
eval_tap $? 225 'AnonymizeEntitlement' test.out

#- 226 AnonymizeFulfillment
./ng net.accelbyte.sdk.cli.Main platform anonymizeFulfillment \
    --namespace "$AB_NAMESPACE" \
    --userId 'GhuUSVVq' \
    > test.out 2>&1
eval_tap $? 226 'AnonymizeFulfillment' test.out

#- 227 AnonymizeIntegration
./ng net.accelbyte.sdk.cli.Main platform anonymizeIntegration \
    --namespace "$AB_NAMESPACE" \
    --userId 'uX5MixQY' \
    > test.out 2>&1
eval_tap $? 227 'AnonymizeIntegration' test.out

#- 228 AnonymizeOrder
./ng net.accelbyte.sdk.cli.Main platform anonymizeOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'GPnBG5q9' \
    > test.out 2>&1
eval_tap $? 228 'AnonymizeOrder' test.out

#- 229 AnonymizePayment
./ng net.accelbyte.sdk.cli.Main platform anonymizePayment \
    --namespace "$AB_NAMESPACE" \
    --userId 'SD3iCD3n' \
    > test.out 2>&1
eval_tap $? 229 'AnonymizePayment' test.out

#- 230 AnonymizeRevocation
./ng net.accelbyte.sdk.cli.Main platform anonymizeRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId 'vreV0hLZ' \
    > test.out 2>&1
eval_tap $? 230 'AnonymizeRevocation' test.out

#- 231 AnonymizeSubscription
./ng net.accelbyte.sdk.cli.Main platform anonymizeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'npheCHix' \
    > test.out 2>&1
eval_tap $? 231 'AnonymizeSubscription' test.out

#- 232 AnonymizeWallet
./ng net.accelbyte.sdk.cli.Main platform anonymizeWallet \
    --namespace "$AB_NAMESPACE" \
    --userId 'DkAt0U1s' \
    > test.out 2>&1
eval_tap $? 232 'AnonymizeWallet' test.out

#- 233 GetUserDLCByPlatform
./ng net.accelbyte.sdk.cli.Main platform getUserDLCByPlatform \
    --namespace "$AB_NAMESPACE" \
    --userId 'pXUhkdc1' \
    --type 'STEAM' \
    > test.out 2>&1
eval_tap $? 233 'GetUserDLCByPlatform' test.out

#- 234 GetUserDLC
./ng net.accelbyte.sdk.cli.Main platform getUserDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'HiQ5Ikos' \
    --type 'STEAM' \
    > test.out 2>&1
eval_tap $? 234 'GetUserDLC' test.out

#- 235 QueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'y1Ab9NCN' \
    --activeOnly  \
    --appType 'DLC' \
    --collectionId 'DSHc69dR' \
    --entitlementClazz 'MEDIA' \
    --entitlementName 'D947Udok' \
    --features 'zoxsdXeF,doFMtWe7,6tRQX9yG' \
    --fuzzyMatchName  \
    --itemId 'NI8jNRpv,8Q4FZDXW,sjTEn1H5' \
    --limit '88' \
    --offset '0' \
    --origin 'Nintendo' \
    > test.out 2>&1
eval_tap $? 235 'QueryUserEntitlements' test.out

#- 236 GrantUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform grantUserEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'HrpMHRFJ' \
    --body '[{"collectionId": "cVk63uQW", "endDate": "1971-12-10T00:00:00Z", "grantedCode": "hF0s8n4C", "itemId": "4nNJxai7", "itemNamespace": "MKQRpIb5", "language": "ZAPR-guDT", "origin": "Xbox", "quantity": 37, "region": "MBiWZuJ7", "source": "REWARD", "startDate": "1971-02-28T00:00:00Z", "storeId": "MMPi6NWk"}, {"collectionId": "TsD6PAKX", "endDate": "1997-05-13T00:00:00Z", "grantedCode": "P5t335rS", "itemId": "22cnqZVg", "itemNamespace": "MW6ZJMGW", "language": "iu-449", "origin": "Epic", "quantity": 56, "region": "Rj00FZG4", "source": "REWARD", "startDate": "1987-09-25T00:00:00Z", "storeId": "kj7MSyBB"}, {"collectionId": "JTN6kJhW", "endDate": "1974-12-12T00:00:00Z", "grantedCode": "px0YXZUY", "itemId": "V9YDaypw", "itemNamespace": "e02x4wqp", "language": "rUW_GSUt-jM", "origin": "Playstation", "quantity": 40, "region": "JO5PLvpA", "source": "PROMOTION", "startDate": "1998-04-24T00:00:00Z", "storeId": "buGq7VlW"}]' \
    > test.out 2>&1
eval_tap $? 236 'GrantUserEntitlement' test.out

#- 237 GetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId '0Qs2TH3J' \
    --activeOnly  \
    --appId '4EnGO9A0' \
    > test.out 2>&1
eval_tap $? 237 'GetUserAppEntitlementByAppId' test.out

#- 238 QueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'KU9St8rV' \
    --activeOnly  \
    --limit '81' \
    --offset '48' \
    --appType 'DEMO' \
    > test.out 2>&1
eval_tap $? 238 'QueryUserEntitlementsByAppType' test.out

#- 239 GetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'rN0tM9o2' \
    --activeOnly  \
    --entitlementClazz 'SUBSCRIPTION' \
    --platform 'Ccm0jjoN' \
    --itemId 'xx7404US' \
    > test.out 2>&1
eval_tap $? 239 'GetUserEntitlementByItemId' test.out

#- 240 GetUserActiveEntitlementsByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserActiveEntitlementsByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId '5q6WRfUd' \
    --ids 'TY4ECgCI,a6BLSltH,sV5suIBO' \
    --platform 'pREIpi5t' \
    > test.out 2>&1
eval_tap $? 240 'GetUserActiveEntitlementsByItemIds' test.out

#- 241 GetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'Dgv1mRmp' \
    --activeOnly  \
    --entitlementClazz 'ENTITLEMENT' \
    --platform 'FxnE6Sqe' \
    --sku 'M4I51TdD' \
    > test.out 2>&1
eval_tap $? 241 'GetUserEntitlementBySku' test.out

#- 242 ExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId '9cGI7qt7' \
    --appIds '7TjRV6tL,EiBFDSwf,q1W6hsuE' \
    --itemIds '5eYywQhF,336viEKS,3JQ4Oxab' \
    --platform '5Lup12uT' \
    --skus 'tuHZXFPJ,e3JxSrHC,MxLpUyHj' \
    > test.out 2>&1
eval_tap $? 242 'ExistsAnyUserActiveEntitlement' test.out

#- 243 ExistsAnyUserActiveEntitlementByItemIds
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlementByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'dwB41YxS' \
    --platform 'BCuprhaI' \
    --itemIds 'RkAAhlPk,ErVqUB9c,GdX4LlTB' \
    > test.out 2>&1
eval_tap $? 243 'ExistsAnyUserActiveEntitlementByItemIds' test.out

#- 244 GetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'tzJo0hKe' \
    --appId 'hA8thycY' \
    > test.out 2>&1
eval_tap $? 244 'GetUserAppEntitlementOwnershipByAppId' test.out

#- 245 GetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId '0nrvj2b2' \
    --entitlementClazz 'SUBSCRIPTION' \
    --platform 'MuxtJZSv' \
    --itemId 'wXx7dHq4' \
    > test.out 2>&1
eval_tap $? 245 'GetUserEntitlementOwnershipByItemId' test.out

#- 246 GetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'kmtHFwVV' \
    --ids 'TDIbExVm,Zj3EYjk6,2we9Jfb4' \
    --platform 'AjRG4IaY' \
    > test.out 2>&1
eval_tap $? 246 'GetUserEntitlementOwnershipByItemIds' test.out

#- 247 GetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId '8ALHGOg1' \
    --entitlementClazz 'OPTIONBOX' \
    --platform 'lnaYoIyp' \
    --sku 'EJFbNBiJ' \
    > test.out 2>&1
eval_tap $? 247 'GetUserEntitlementOwnershipBySku' test.out

#- 248 RevokeAllEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeAllEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'jrCJxgPl' \
    > test.out 2>&1
eval_tap $? 248 'RevokeAllEntitlements' test.out

#- 249 RevokeUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'fCHfcAoT' \
    --entitlementIds 'UU0hTV2s' \
    > test.out 2>&1
eval_tap $? 249 'RevokeUserEntitlements' test.out

#- 250 GetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlement \
    --entitlementId '08vWF8bP' \
    --namespace "$AB_NAMESPACE" \
    --userId 'R94FRFaO' \
    > test.out 2>&1
eval_tap $? 250 'GetUserEntitlement' test.out

#- 251 UpdateUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform updateUserEntitlement \
    --entitlementId 'JVZmLjnT' \
    --namespace "$AB_NAMESPACE" \
    --userId 'xsMN7tPw' \
    --body '{"collectionId": "XcJnq71a", "endDate": "1978-06-22T00:00:00Z", "nullFieldList": ["ITuR7Oc9", "WQRibTTb", "WHrYxJXb"], "origin": "Nintendo", "reason": "5Q85MJgG", "startDate": "1995-08-07T00:00:00Z", "status": "CONSUMED", "useCount": 33}' \
    > test.out 2>&1
eval_tap $? 251 'UpdateUserEntitlement' test.out

#- 252 ConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform consumeUserEntitlement \
    --entitlementId 'FztTmGBs' \
    --namespace "$AB_NAMESPACE" \
    --userId '89U3SoyJ' \
    --body '{"options": ["Vt4KI0gE", "ud9fH4s1", "yrUVEdSl"], "platform": "w0H2LhRX", "requestId": "gmqhObkL", "useCount": 60}' \
    > test.out 2>&1
eval_tap $? 252 'ConsumeUserEntitlement' test.out

#- 253 DisableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform disableUserEntitlement \
    --entitlementId '74fO1EkT' \
    --namespace "$AB_NAMESPACE" \
    --userId 'FRYE5IvV' \
    > test.out 2>&1
eval_tap $? 253 'DisableUserEntitlement' test.out

#- 254 EnableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform enableUserEntitlement \
    --entitlementId 'g24Wn7Du' \
    --namespace "$AB_NAMESPACE" \
    --userId 'jIm5xnJ4' \
    > test.out 2>&1
eval_tap $? 254 'EnableUserEntitlement' test.out

#- 255 GetUserEntitlementHistories
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementHistories \
    --entitlementId '0QOUmF5z' \
    --namespace "$AB_NAMESPACE" \
    --userId 'hVwICnrI' \
    > test.out 2>&1
eval_tap $? 255 'GetUserEntitlementHistories' test.out

#- 256 RevokeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlement \
    --entitlementId 'HEz9uNsm' \
    --namespace "$AB_NAMESPACE" \
    --userId 'sOpP77qS' \
    > test.out 2>&1
eval_tap $? 256 'RevokeUserEntitlement' test.out

#- 257 RevokeUserEntitlementByUseCount
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlementByUseCount \
    --entitlementId 'H43HOxBw' \
    --namespace "$AB_NAMESPACE" \
    --userId 'zVF6JsCd' \
    --body '{"reason": "85zIPpHi", "useCount": 77}' \
    > test.out 2>&1
eval_tap $? 257 'RevokeUserEntitlementByUseCount' test.out

#- 258 PreCheckRevokeUserEntitlementByUseCount
./ng net.accelbyte.sdk.cli.Main platform preCheckRevokeUserEntitlementByUseCount \
    --entitlementId '7ZjpXo7s' \
    --namespace "$AB_NAMESPACE" \
    --userId 'IQycWB3z' \
    --quantity '46' \
    > test.out 2>&1
eval_tap $? 258 'PreCheckRevokeUserEntitlementByUseCount' test.out

#- 259 RevokeUseCount
eval_tap 0 259 'RevokeUseCount # SKIP deprecated' test.out

#- 260 SellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform sellUserEntitlement \
    --entitlementId 'fTEBXQwf' \
    --namespace "$AB_NAMESPACE" \
    --userId 'cwMbycZM' \
    --body '{"platform": "cqYDq6jr", "requestId": "ZaWzyY0P", "useCount": 75}' \
    > test.out 2>&1
eval_tap $? 260 'SellUserEntitlement' test.out

#- 261 FulfillItem
./ng net.accelbyte.sdk.cli.Main platform fulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'eBqcilvQ' \
    --body '{"duration": 69, "endDate": "1975-04-08T00:00:00Z", "entitlementCollectionId": "u0KkjT7c", "entitlementOrigin": "Xbox", "itemId": "D8crZ7c0", "itemSku": "K2EZWSsH", "language": "eHxd7UCC", "metadata": {"Jn8HLHzV": {}, "GeaaXc5G": {}, "1xLFnMg7": {}}, "order": {"currency": {"currencyCode": "4J0snQ6l", "currencySymbol": "MroLTDTR", "currencyType": "REAL", "decimals": 64, "namespace": "2IQ3bUev"}, "ext": {"nrLQoz5e": {}, "y3oTBQAs": {}, "o6u3iqxT": {}}, "free": true}, "orderNo": "64WUMcBT", "origin": "Playstation", "overrideBundleItemQty": {"VOrNlr6r": 74, "iYIyZckj": 96, "u09fPCvu": 2}, "quantity": 78, "region": "u4gV4gF7", "source": "CONSUME_ENTITLEMENT", "startDate": "1972-12-10T00:00:00Z", "storeId": "N7QNToMi"}' \
    > test.out 2>&1
eval_tap $? 261 'FulfillItem' test.out

#- 262 RedeemCode
./ng net.accelbyte.sdk.cli.Main platform redeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'Y1O1jNSt' \
    --body '{"code": "vyDMi9Bo", "language": "sdRo_373", "region": "W8HFZM6z"}' \
    > test.out 2>&1
eval_tap $? 262 'RedeemCode' test.out

#- 263 PreCheckFulfillItem
./ng net.accelbyte.sdk.cli.Main platform preCheckFulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'Xi3MU4sQ' \
    --body '{"itemId": "8JAWA5J7", "itemSku": "3bi7mX4Y", "quantity": 32}' \
    > test.out 2>&1
eval_tap $? 263 'PreCheckFulfillItem' test.out

#- 264 FulfillRewards
./ng net.accelbyte.sdk.cli.Main platform fulfillRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'eW2VhQ7f' \
    --body '{"entitlementCollectionId": "OqNbXOuN", "entitlementOrigin": "Steam", "metadata": {"raduM1YW": {}, "jxqVpgF2": {}, "EamM3x6d": {}}, "origin": "Xbox", "rewards": [{"currency": {"currencyCode": "vy6zmF6d", "namespace": "3OHReTze"}, "item": {"itemId": "3elyL5g1", "itemSku": "sB1tsbAa", "itemType": "esP2Eh5O"}, "quantity": 20, "type": "CURRENCY"}, {"currency": {"currencyCode": "VhPTEyqW", "namespace": "sUwg8FFO"}, "item": {"itemId": "jipHFETt", "itemSku": "U8WTg4jz", "itemType": "x4sywEpx"}, "quantity": 40, "type": "ITEM"}, {"currency": {"currencyCode": "n14JtSst", "namespace": "1G5anqnW"}, "item": {"itemId": "7Ed9U2rR", "itemSku": "aEEy3ZRd", "itemType": "N5E77mkQ"}, "quantity": 70, "type": "ITEM"}], "source": "ACHIEVEMENT", "transactionId": "hcVXTJ7C"}' \
    > test.out 2>&1
eval_tap $? 264 'FulfillRewards' test.out

#- 265 QueryUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'cQYRIfyJ' \
    --endTime 'Nyk2YVjY' \
    --limit '27' \
    --offset '24' \
    --productId 'LkKLqZrD' \
    --startTime 'QhnAh7qY' \
    --status 'FULFILLED' \
    --type 'EPICGAMES' \
    > test.out 2>&1
eval_tap $? 265 'QueryUserIAPOrders' test.out

#- 266 QueryAllUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryAllUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'unk4knHJ' \
    > test.out 2>&1
eval_tap $? 266 'QueryAllUserIAPOrders' test.out

#- 267 QueryUserIAPConsumeHistory
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPConsumeHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'QdsJ83df' \
    --endTime 'JsLbCjKs' \
    --limit '21' \
    --offset '51' \
    --startTime 'wcjRZHzB' \
    --status 'PENDING' \
    --type 'PLAYSTATION' \
    > test.out 2>&1
eval_tap $? 267 'QueryUserIAPConsumeHistory' test.out

#- 268 MockFulfillIAPItem
./ng net.accelbyte.sdk.cli.Main platform mockFulfillIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'QMitZVzC' \
    --body '{"itemIdentityType": "ITEM_ID", "language": "UKEe-217", "productId": "vJRjMqkP", "region": "tbfVsJTE", "transactionId": "dudf6cvW", "type": "APPLE"}' \
    > test.out 2>&1
eval_tap $? 268 'MockFulfillIAPItem' test.out

#- 269 QueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'jFCcbRZz' \
    --discounted  \
    --itemId 'QdPTiqTJ' \
    --limit '75' \
    --offset '10' \
    --status 'FULFILL_FAILED' \
    > test.out 2>&1
eval_tap $? 269 'QueryUserOrders' test.out

#- 270 AdminCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform adminCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'P7Z2SLxm' \
    --body '{"currencyCode": "HZTR9st3", "currencyNamespace": "c2iOD1hZ", "discountCodes": ["qXbOT3Mb", "VJcOA8Vz", "bKb2F12z"], "discountedPrice": 16, "entitlementPlatform": "Xbox", "ext": {"BJnVyrdk": {}, "69Z1xYVF": {}, "2El8Tirz": {}}, "itemId": "utRBC4h9", "language": "TmolTwZo", "options": {"skipPriceValidation": true}, "platform": "Playstation", "price": 35, "quantity": 98, "region": "LxtJSq2j", "returnUrl": "QIjrLy8c", "sandbox": false, "sectionId": "HO1bHzXf"}' \
    > test.out 2>&1
eval_tap $? 270 'AdminCreateUserOrder' test.out

#- 271 CountOfPurchasedItem
./ng net.accelbyte.sdk.cli.Main platform countOfPurchasedItem \
    --namespace "$AB_NAMESPACE" \
    --userId '0LrZLLFM' \
    --itemId 'cfLSORFC' \
    > test.out 2>&1
eval_tap $? 271 'CountOfPurchasedItem' test.out

#- 272 GetUserOrder
./ng net.accelbyte.sdk.cli.Main platform getUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'sPL90z01' \
    --userId 'UxVnCvHc' \
    > test.out 2>&1
eval_tap $? 272 'GetUserOrder' test.out

#- 273 UpdateUserOrderStatus
./ng net.accelbyte.sdk.cli.Main platform updateUserOrderStatus \
    --namespace "$AB_NAMESPACE" \
    --orderNo '0p4nyltV' \
    --userId 'ECXXJFt3' \
    --body '{"status": "FULFILLED", "statusReason": "Dp1th2Hd"}' \
    > test.out 2>&1
eval_tap $? 273 'UpdateUserOrderStatus' test.out

#- 274 FulfillUserOrder
./ng net.accelbyte.sdk.cli.Main platform fulfillUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'DC5k2hz8' \
    --userId 'YxvWBiga' \
    > test.out 2>&1
eval_tap $? 274 'FulfillUserOrder' test.out

#- 275 GetUserOrderGrant
eval_tap 0 275 'GetUserOrderGrant # SKIP deprecated' test.out

#- 276 GetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform getUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'Ea2n0jYn' \
    --userId 'yYzKw31x' \
    > test.out 2>&1
eval_tap $? 276 'GetUserOrderHistories' test.out

#- 277 ProcessUserOrderNotification
./ng net.accelbyte.sdk.cli.Main platform processUserOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'Q1XDoq0p' \
    --userId 'IdiWnXgc' \
    --body '{"additionalData": {"cardSummary": "3npL9pxw"}, "authorisedTime": "1971-11-22T00:00:00Z", "chargebackReversedTime": "1987-12-03T00:00:00Z", "chargebackTime": "1993-01-19T00:00:00Z", "chargedTime": "1999-08-31T00:00:00Z", "createdTime": "1972-10-22T00:00:00Z", "currency": {"currencyCode": "71Bpfash", "currencySymbol": "b0F7Dy9l", "currencyType": "REAL", "decimals": 27, "namespace": "41RP0xFW"}, "customParameters": {"nRwOmkkr": {}, "x3I4epaM": {}, "OmHwSKVT": {}}, "extOrderNo": "p0oCRvwA", "extTxId": "Snq83i3e", "extUserId": "Iy07ldze", "issuedAt": "1979-03-14T00:00:00Z", "metadata": {"m9kqD7w0": "ydnDEdOw", "iNHYKSFE": "73bsck88", "FaAEiIEC": "uRnZZvKf"}, "namespace": "ru6zymoe", "nonceStr": "Z6UHbwld", "paymentMethod": "zsjEDh18", "paymentMethodFee": 53, "paymentOrderNo": "u28cAFRA", "paymentProvider": "ADYEN", "paymentProviderFee": 23, "paymentStationUrl": "7gEIg4mO", "price": 11, "refundedTime": "1989-11-25T00:00:00Z", "salesTax": 7, "sandbox": true, "sku": "WT3Omh1g", "status": "INIT", "statusReason": "sOh5u4sU", "subscriptionId": "j6aBlMwc", "subtotalPrice": 27, "targetNamespace": "VUvERjmL", "targetUserId": "ugWtxlYN", "tax": 12, "totalPrice": 0, "totalTax": 2, "txEndTime": "1986-12-26T00:00:00Z", "type": "aB4xHZLk", "userId": "JAzzne0l", "vat": 14}' \
    > test.out 2>&1
eval_tap $? 277 'ProcessUserOrderNotification' test.out

#- 278 DownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform downloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'Wu20F8BB' \
    --userId 'pZ5hlPqx' \
    > test.out 2>&1
eval_tap $? 278 'DownloadUserOrderReceipt' test.out

#- 279 CreateUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform createUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'TdtjUNP9' \
    --body '{"currencyCode": "VHf18F3X", "currencyNamespace": "BLChCrUy", "customParameters": {"yYpHGEyy": {}, "LQ9UuWAy": {}, "E5z3f2Ub": {}}, "description": "pvpag4gN", "extOrderNo": "XDxl4yR5", "extUserId": "XiTgzHAi", "itemType": "BUNDLE", "language": "hRg_oGCp", "metadata": {"VIYxBDWc": "QLBdOURi", "Ln6EbJh4": "ZORUHb6y", "NeHGJkkl": "1BTGVAVH"}, "notifyUrl": "YL7Yoveb", "omitNotification": true, "platform": "b6IOLW9s", "price": 14, "recurringPaymentOrderNo": "kHOr7b0n", "region": "AaX92xa8", "returnUrl": "50Xrdh4g", "sandbox": false, "sku": "yBawKDF3", "subscriptionId": "Z2W2vX4Z", "title": "QkStjohz"}' \
    > test.out 2>&1
eval_tap $? 279 'CreateUserPaymentOrder' test.out

#- 280 RefundUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform refundUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'Ki5k6NeT' \
    --userId 'WWxWps3w' \
    --body '{"description": "qdS6Yfk5"}' \
    > test.out 2>&1
eval_tap $? 280 'RefundUserPaymentOrder' test.out

#- 281 ApplyUserRedemption
./ng net.accelbyte.sdk.cli.Main platform applyUserRedemption \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ivw9ODiq' \
    --body '{"code": "bV6EZhl9", "orderNo": "SjmRBhoi"}' \
    > test.out 2>&1
eval_tap $? 281 'ApplyUserRedemption' test.out

#- 282 DoRevocation
./ng net.accelbyte.sdk.cli.Main platform doRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId 'GWzmQo3z' \
    --body '{"meta": {"X5BlfNel": {}, "OgvNFAAI": {}, "3qfLpr3Q": {}}, "revokeEntries": [{"currency": {"balanceOrigin": "Other", "currencyCode": "mbFZbw5B", "namespace": "CPIPT9Hn"}, "entitlement": {"entitlementId": "1ti4lj1E"}, "item": {"entitlementOrigin": "Steam", "itemIdentity": "oV8rcJxY", "itemIdentityType": "ITEM_SKU", "origin": "Oculus"}, "quantity": 78, "type": "ENTITLEMENT"}, {"currency": {"balanceOrigin": "Epic", "currencyCode": "bVeA0A48", "namespace": "tJJDuTxE"}, "entitlement": {"entitlementId": "NvoC6rGC"}, "item": {"entitlementOrigin": "Nintendo", "itemIdentity": "bKuRrHNT", "itemIdentityType": "ITEM_ID", "origin": "Other"}, "quantity": 21, "type": "ITEM"}, {"currency": {"balanceOrigin": "GooglePlay", "currencyCode": "aGS0Dh73", "namespace": "jhlvf4XF"}, "entitlement": {"entitlementId": "GkUFxfBb"}, "item": {"entitlementOrigin": "System", "itemIdentity": "cgCjywKu", "itemIdentityType": "ITEM_SKU", "origin": "Epic"}, "quantity": 72, "type": "ENTITLEMENT"}], "source": "OTHER", "transactionId": "6pdRlug8"}' \
    > test.out 2>&1
eval_tap $? 282 'DoRevocation' test.out

#- 283 RegisterXblSessions
./ng net.accelbyte.sdk.cli.Main platform registerXblSessions \
    --namespace "$AB_NAMESPACE" \
    --userId 'SHaY8gT0' \
    --body '{"gameSessionId": "9h6bB5KF", "payload": {"am2GGLcT": {}, "oQaOVmY3": {}, "Z6yzmr1V": {}}, "scid": "l0r1WtU0", "sessionTemplateName": "O0nw3Y5a"}' \
    > test.out 2>&1
eval_tap $? 283 'RegisterXblSessions' test.out

#- 284 QueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform queryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'k31FRvrt' \
    --chargeStatus 'CHARGED' \
    --itemId 'IiH1zUil' \
    --limit '80' \
    --offset '28' \
    --sku 'K02mfFLx' \
    --status 'ACTIVE' \
    --subscribedBy 'USER' \
    > test.out 2>&1
eval_tap $? 284 'QueryUserSubscriptions' test.out

#- 285 GetUserSubscriptionActivities
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionActivities \
    --namespace "$AB_NAMESPACE" \
    --userId 'dQDuRksy' \
    --excludeSystem  \
    --limit '90' \
    --offset '57' \
    --subscriptionId 'nfkmEIyq' \
    > test.out 2>&1
eval_tap $? 285 'GetUserSubscriptionActivities' test.out

#- 286 PlatformSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform platformSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'xhH3ilyz' \
    --body '{"grantDays": 96, "itemId": "lN7BsLaG", "language": "AOBcoHM2", "reason": "pDGzm7Lo", "region": "qIjy42o9", "source": "jjMzyJtt"}' \
    > test.out 2>&1
eval_tap $? 286 'PlatformSubscribeSubscription' test.out

#- 287 CheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform checkUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'IiAnBK1i' \
    --itemId 'aoBuhw4S' \
    > test.out 2>&1
eval_tap $? 287 'CheckUserSubscriptionSubscribableByItemId' test.out

#- 288 GetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform getUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '944ATo2F' \
    --userId '33hCffRW' \
    > test.out 2>&1
eval_tap $? 288 'GetUserSubscription' test.out

#- 289 DeleteUserSubscription
./ng net.accelbyte.sdk.cli.Main platform deleteUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'kgOp5EbQ' \
    --userId 'IUDeirBO' \
    > test.out 2>&1
eval_tap $? 289 'DeleteUserSubscription' test.out

#- 290 CancelSubscription
./ng net.accelbyte.sdk.cli.Main platform cancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '4nI8H4rz' \
    --userId 'qT8qZzpw' \
    --force  \
    --body '{"immediate": false, "reason": "0zRQv2YS"}' \
    > test.out 2>&1
eval_tap $? 290 'CancelSubscription' test.out

#- 291 GrantDaysToSubscription
./ng net.accelbyte.sdk.cli.Main platform grantDaysToSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'dGgmgSps' \
    --userId '2QTUYOJI' \
    --body '{"grantDays": 46, "reason": "nTNqtFHW"}' \
    > test.out 2>&1
eval_tap $? 291 'GrantDaysToSubscription' test.out

#- 292 GetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'wZgzPXKX' \
    --userId '4nKEfwao' \
    --excludeFree  \
    --limit '62' \
    --offset '9' \
    > test.out 2>&1
eval_tap $? 292 'GetUserSubscriptionBillingHistories' test.out

#- 293 ProcessUserSubscriptionNotification
./ng net.accelbyte.sdk.cli.Main platform processUserSubscriptionNotification \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'OLdG86xq' \
    --userId '4VoInums' \
    --body '{"additionalData": {"cardSummary": "0uBUPf3m"}, "authorisedTime": "1995-12-25T00:00:00Z", "chargebackReversedTime": "1989-05-13T00:00:00Z", "chargebackTime": "1984-03-09T00:00:00Z", "chargedTime": "1987-01-12T00:00:00Z", "createdTime": "1996-02-10T00:00:00Z", "currency": {"currencyCode": "1V4qpx0u", "currencySymbol": "WeWFp1sP", "currencyType": "REAL", "decimals": 58, "namespace": "mIf1ESMu"}, "customParameters": {"fC8vkDgE": {}, "topsWSV0": {}, "emLcAEO6": {}}, "extOrderNo": "htF9AZQI", "extTxId": "UoJLq5IX", "extUserId": "bTiCfRne", "issuedAt": "1998-07-24T00:00:00Z", "metadata": {"Hu24UKKy": "itNdf6X9", "jaSLUWR4": "KaawcbMq", "FCGnskkR": "zlc8VIDH"}, "namespace": "0xBGfmEN", "nonceStr": "JibbcTse", "paymentMethod": "cXzFMJM1", "paymentMethodFee": 83, "paymentOrderNo": "5eiKnxDh", "paymentProvider": "WALLET", "paymentProviderFee": 21, "paymentStationUrl": "GQMGCFYn", "price": 29, "refundedTime": "1973-05-13T00:00:00Z", "salesTax": 57, "sandbox": true, "sku": "uxudONAe", "status": "REFUNDING", "statusReason": "otxxY7eH", "subscriptionId": "8e0c60Gd", "subtotalPrice": 66, "targetNamespace": "Il1gxaQN", "targetUserId": "mpzIv5hS", "tax": 71, "totalPrice": 94, "totalTax": 34, "txEndTime": "1994-03-05T00:00:00Z", "type": "bwPk8UvS", "userId": "8GH6FkPN", "vat": 6}' \
    > test.out 2>&1
eval_tap $? 293 'ProcessUserSubscriptionNotification' test.out

#- 294 AcquireUserTicket
./ng net.accelbyte.sdk.cli.Main platform acquireUserTicket \
    --boothName 'U6Ttymta' \
    --namespace "$AB_NAMESPACE" \
    --userId 'hwXB74bF' \
    --body '{"count": 12, "orderNo": "m75waOt6"}' \
    > test.out 2>&1
eval_tap $? 294 'AcquireUserTicket' test.out

#- 295 QueryUserCurrencyWallets
./ng net.accelbyte.sdk.cli.Main platform queryUserCurrencyWallets \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZmHqaNW0' \
    > test.out 2>&1
eval_tap $? 295 'QueryUserCurrencyWallets' test.out

#- 296 DebitUserWalletByCurrencyCode
./ng net.accelbyte.sdk.cli.Main platform debitUserWalletByCurrencyCode \
    --currencyCode 'LrtKj4Jy' \
    --namespace "$AB_NAMESPACE" \
    --userId '8WT1yUOP' \
    --body '{"allowOverdraft": true, "amount": 77, "balanceOrigin": "Oculus", "balanceSource": "TRADE", "metadata": {"0mYJbrUG": {}, "k3hrnQVO": {}, "klUBlqpH": {}}, "reason": "7Gf0zKvs"}' \
    > test.out 2>&1
eval_tap $? 296 'DebitUserWalletByCurrencyCode' test.out

#- 297 ListUserCurrencyTransactions
./ng net.accelbyte.sdk.cli.Main platform listUserCurrencyTransactions \
    --currencyCode '7n5eY5tu' \
    --namespace "$AB_NAMESPACE" \
    --userId '3L2ShiUZ' \
    --limit '63' \
    --offset '84' \
    > test.out 2>&1
eval_tap $? 297 'ListUserCurrencyTransactions' test.out

#- 298 CheckBalance
./ng net.accelbyte.sdk.cli.Main platform checkBalance \
    --currencyCode 'Ws2PfLau' \
    --namespace "$AB_NAMESPACE" \
    --userId 'coDRfTh6' \
    --request '{"amount": 29, "debitBalanceSource": "DLC_REVOCATION", "metadata": {"fRWas8jU": {}, "y4SPmuVw": {}, "TpnfvdKU": {}}, "reason": "x1PNGnlA", "walletPlatform": "Playstation"}' \
    > test.out 2>&1
eval_tap $? 298 'CheckBalance' test.out

#- 299 CheckWallet
eval_tap 0 299 'CheckWallet # SKIP deprecated' test.out

#- 300 CreditUserWallet
./ng net.accelbyte.sdk.cli.Main platform creditUserWallet \
    --currencyCode 'kWdL1kqw' \
    --namespace "$AB_NAMESPACE" \
    --userId 'tdekraHo' \
    --body '{"amount": 80, "expireAt": "1977-12-26T00:00:00Z", "metadata": {"o89DIMN5": {}, "YsYfHuAk": {}, "NiTi1Qvi": {}}, "origin": "IOS", "reason": "uNFhvha8", "source": "PROMOTION"}' \
    > test.out 2>&1
eval_tap $? 300 'CreditUserWallet' test.out

#- 301 DebitByWalletPlatform
./ng net.accelbyte.sdk.cli.Main platform debitByWalletPlatform \
    --currencyCode '2tgvuwiO' \
    --namespace "$AB_NAMESPACE" \
    --userId 'rf2huejK' \
    --request '{"amount": 53, "debitBalanceSource": "EXPIRATION", "metadata": {"2liTNd79": {}, "bYnlCblW": {}, "GK09VoaO": {}}, "reason": "ThlEepuk", "walletPlatform": "GooglePlay"}' \
    > test.out 2>&1
eval_tap $? 301 'DebitByWalletPlatform' test.out

#- 302 PayWithUserWallet
./ng net.accelbyte.sdk.cli.Main platform payWithUserWallet \
    --currencyCode 'e1ZiUNDD' \
    --namespace "$AB_NAMESPACE" \
    --userId '0EH2pj9J' \
    --body '{"amount": 84, "metadata": {"0pvodPat": {}, "2505gv8d": {}, "PVkDgOU4": {}}, "walletPlatform": "Steam"}' \
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
    --storeId 'vR3TX5fF' \
    > test.out 2>&1
eval_tap $? 308 'ListViews' test.out

#- 309 CreateView
./ng net.accelbyte.sdk.cli.Main platform createView \
    --namespace "$AB_NAMESPACE" \
    --storeId 'gid77ca7' \
    --body '{"displayOrder": 41, "localizations": {"Q61BHA5f": {"description": "abBASlcF", "localExt": {"8aNuAesT": {}, "oTXHw5ls": {}, "0VupzcUa": {}}, "longDescription": "bZfPYghk", "title": "jyjJwCac"}, "hOARilYN": {"description": "8oJvdJCL", "localExt": {"9dCMmkcF": {}, "3n4n3Kv8": {}, "4YfKhVOG": {}}, "longDescription": "oaypF1Xz", "title": "1OcxsopE"}, "SbH5qhoJ": {"description": "0bHqo4LT", "localExt": {"zyKESnmA": {}, "cH1pmmjl": {}, "Acf7n9j3": {}}, "longDescription": "ZeBDmDSi", "title": "2JiZZ6kJ"}}, "name": "pmAhwOII"}' \
    > test.out 2>&1
eval_tap $? 309 'CreateView' test.out

#- 310 GetView
./ng net.accelbyte.sdk.cli.Main platform getView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'IhxYLoTd' \
    --storeId 'BFeRetiI' \
    > test.out 2>&1
eval_tap $? 310 'GetView' test.out

#- 311 UpdateView
./ng net.accelbyte.sdk.cli.Main platform updateView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'ef9lb2Cf' \
    --storeId '9gYTYVKM' \
    --body '{"displayOrder": 62, "localizations": {"eXUWbk1u": {"description": "Untsp8jk", "localExt": {"s6fj6AIQ": {}, "n5TF4Pht": {}, "RJFWFuEG": {}}, "longDescription": "a1LwkOku", "title": "xPlYv5GQ"}, "cRfnlxBu": {"description": "w2qDk55Q", "localExt": {"1PiOTITT": {}, "Lp8lR5zF": {}, "FhsrLRn5": {}}, "longDescription": "cIUqwGCZ", "title": "h0BpYMvm"}, "ZCNqUgg3": {"description": "I4YM0Wz6", "localExt": {"FBTNBGtJ": {}, "mKINMJcK": {}, "K4zZrdIJ": {}}, "longDescription": "I7aPWr8g", "title": "uW7rfu0D"}}, "name": "B10XB5yH"}' \
    > test.out 2>&1
eval_tap $? 311 'UpdateView' test.out

#- 312 DeleteView
./ng net.accelbyte.sdk.cli.Main platform deleteView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'CH8itCpd' \
    --storeId '43ja6aLq' \
    > test.out 2>&1
eval_tap $? 312 'DeleteView' test.out

#- 313 QueryWallets
eval_tap 0 313 'QueryWallets # SKIP deprecated' test.out

#- 314 BulkCredit
./ng net.accelbyte.sdk.cli.Main platform bulkCredit \
    --namespace "$AB_NAMESPACE" \
    --body '[{"creditRequest": {"amount": 14, "expireAt": "1972-03-01T00:00:00Z", "metadata": {"KHwSE88d": {}, "K4s5kUC0": {}, "VGe2rKnf": {}}, "origin": "Other", "reason": "IzeR66Uq", "source": "OTHER"}, "currencyCode": "CkXEI0mQ", "userIds": ["LeilbLOq", "dQZJyQAN", "Uic8voMO"]}, {"creditRequest": {"amount": 27, "expireAt": "1994-11-16T00:00:00Z", "metadata": {"la24L5m3": {}, "Tyk168IX": {}, "toM7H1sf": {}}, "origin": "Twitch", "reason": "KGi8M2r6", "source": "TRADE"}, "currencyCode": "rbkSsS2Y", "userIds": ["229QdOut", "W3ox2GAM", "DoFIQfCG"]}, {"creditRequest": {"amount": 44, "expireAt": "1974-10-21T00:00:00Z", "metadata": {"QFMZDEtx": {}, "tvHxP91I": {}, "yBUUTRpB": {}}, "origin": "Oculus", "reason": "5e40rgAk", "source": "REDEEM_CODE"}, "currencyCode": "AICfZKgT", "userIds": ["zeAX64L4", "YYDJh7Bc", "r9qjtCcv"]}]' \
    > test.out 2>&1
eval_tap $? 314 'BulkCredit' test.out

#- 315 BulkDebit
./ng net.accelbyte.sdk.cli.Main platform bulkDebit \
    --namespace "$AB_NAMESPACE" \
    --body '[{"currencyCode": "5pcgeK4G", "request": {"allowOverdraft": false, "amount": 57, "balanceOrigin": "IOS", "balanceSource": "ORDER_REVOCATION", "metadata": {"bTECsds2": {}, "ZgAT0p7M": {}, "TD1i7IWx": {}}, "reason": "l5RWdav7"}, "userIds": ["Ms3CLvwF", "vwOIr3Sy", "Z8Xzus3s"]}, {"currencyCode": "uxr03iI4", "request": {"allowOverdraft": true, "amount": 98, "balanceOrigin": "Epic", "balanceSource": "PAYMENT", "metadata": {"gcrP2nsK": {}, "udhI1yYx": {}, "k65ZxHt1": {}}, "reason": "VrA41Edw"}, "userIds": ["g6DxK1z1", "e9JHGJwQ", "HSwbOJAw"]}, {"currencyCode": "ubplGcRX", "request": {"allowOverdraft": false, "amount": 74, "balanceOrigin": "Nintendo", "balanceSource": "OTHER", "metadata": {"WvUHv5t8": {}, "BrSZrSHU": {}, "e54peWIv": {}}, "reason": "JKRICscA"}, "userIds": ["bzxQpSn2", "edu25rxc", "8HTEUfet"]}]' \
    > test.out 2>&1
eval_tap $? 315 'BulkDebit' test.out

#- 316 GetWallet
eval_tap 0 316 'GetWallet # SKIP deprecated' test.out

#- 317 SyncOrders
./ng net.accelbyte.sdk.cli.Main platform syncOrders \
    --nextEvaluatedKey 'xQUzv0sC' \
    --end '34k4LgDx' \
    --start 'tc87XeCL' \
    > test.out 2>&1
eval_tap $? 317 'SyncOrders' test.out

#- 318 TestAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfig \
    --sandbox  \
    --body '{"allowedPaymentMethods": ["rtGw42EU", "YC3ZXQcb", "OzO78bZH"], "apiKey": "g93ZUElJ", "authoriseAsCapture": true, "blockedPaymentMethods": ["vd2AO3Eo", "9Viwg7u1", "w94GZKgk"], "clientKey": "Bb9Xf9Aq", "dropInSettings": "cwlUOqZV", "liveEndpointUrlPrefix": "T03uGiTF", "merchantAccount": "2mdcXvXJ", "notificationHmacKey": "lB1jupx1", "notificationPassword": "oJWbIxRF", "notificationUsername": "T4rygGp1", "returnUrl": "e6FSwCeh", "settings": "ITliYcm0"}' \
    > test.out 2>&1
eval_tap $? 318 'TestAdyenConfig' test.out

#- 319 TestAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfig \
    --sandbox  \
    --body '{"appId": "0P5BxAm5", "privateKey": "uKMotJDm", "publicKey": "UvlIoHiS", "returnUrl": "Bzz1UrIq"}' \
    > test.out 2>&1
eval_tap $? 319 'TestAliPayConfig' test.out

#- 320 TestCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfig \
    --sandbox  \
    --body '{"publicKey": "PohzcXqH", "secretKey": "dTh63rHA"}' \
    > test.out 2>&1
eval_tap $? 320 'TestCheckoutConfig' test.out

#- 321 DebugMatchedPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentMerchantConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'C8pygU6y' \
    > test.out 2>&1
eval_tap $? 321 'DebugMatchedPaymentMerchantConfig' test.out

#- 322 TestPayPalConfig
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfig \
    --sandbox  \
    --body '{"clientID": "1entCBng", "clientSecret": "XU1Z96aw", "returnUrl": "LDFFU9cl", "webHookId": "m8Xh0n0Q"}' \
    > test.out 2>&1
eval_tap $? 322 'TestPayPalConfig' test.out

#- 323 TestStripeConfig
./ng net.accelbyte.sdk.cli.Main platform testStripeConfig \
    --sandbox  \
    --body '{"allowedPaymentMethodTypes": ["7IP7EXBu", "DO7pbN7E", "4AVWcoPj"], "publishableKey": "C4jbk25s", "secretKey": "GNpTwu5a", "webhookSecret": "qFfe6tXz"}' \
    > test.out 2>&1
eval_tap $? 323 'TestStripeConfig' test.out

#- 324 TestWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfig \
    --body '{"appId": "VQJ0lqNF", "key": "MN05Oxy4", "mchid": "TqLzYKgO", "returnUrl": "QkiJa8AI"}' \
    > test.out 2>&1
eval_tap $? 324 'TestWxPayConfig' test.out

#- 325 TestXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfig \
    --body '{"apiKey": "cCBjjd3e", "flowCompletionUrl": "mY2OEJqw", "merchantId": 66, "projectId": 22, "projectSecretKey": "TCZiKkTD"}' \
    > test.out 2>&1
eval_tap $? 325 'TestXsollaConfig' test.out

#- 326 GetPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentMerchantConfig \
    --id 'rZEY4ZcO' \
    > test.out 2>&1
eval_tap $? 326 'GetPaymentMerchantConfig' test.out

#- 327 UpdateAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform updateAdyenConfig \
    --id 'n77VgpIK' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethods": ["rznUqc7g", "IoOskOtZ", "9PRMCnum"], "apiKey": "Gt2m5Xn2", "authoriseAsCapture": true, "blockedPaymentMethods": ["lsqERyps", "GMEJL1DJ", "bwQitjCB"], "clientKey": "aNfb6Txg", "dropInSettings": "ZLLDxsYv", "liveEndpointUrlPrefix": "k6PyjQVg", "merchantAccount": "ZJfWGm54", "notificationHmacKey": "iYp5ZW3S", "notificationPassword": "X4O10XMA", "notificationUsername": "AoycH1xt", "returnUrl": "MJ028wYk", "settings": "PgSLTHY4"}' \
    > test.out 2>&1
eval_tap $? 327 'UpdateAdyenConfig' test.out

#- 328 TestAdyenConfigById
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfigById \
    --id 'shux1duy' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 328 'TestAdyenConfigById' test.out

#- 329 UpdateAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateAliPayConfig \
    --id '4KwHwUik' \
    --sandbox  \
    --validate  \
    --body '{"appId": "716trSii", "privateKey": "Udmnaa8q", "publicKey": "lUlDo3Mx", "returnUrl": "uU9UjiZd"}' \
    > test.out 2>&1
eval_tap $? 329 'UpdateAliPayConfig' test.out

#- 330 TestAliPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfigById \
    --id 'GVSOn3ye' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 330 'TestAliPayConfigById' test.out

#- 331 UpdateCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform updateCheckoutConfig \
    --id 'k2kCZohJ' \
    --sandbox  \
    --validate  \
    --body '{"publicKey": "p7Plov2c", "secretKey": "9ZssD5Qs"}' \
    > test.out 2>&1
eval_tap $? 331 'UpdateCheckoutConfig' test.out

#- 332 TestCheckoutConfigById
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfigById \
    --id '0YT5jFtU' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 332 'TestCheckoutConfigById' test.out

#- 333 UpdatePayPalConfig
./ng net.accelbyte.sdk.cli.Main platform updatePayPalConfig \
    --id 'BJq5CpSA' \
    --sandbox  \
    --validate  \
    --body '{"clientID": "PHPqLadO", "clientSecret": "UhVwhDbv", "returnUrl": "RFH7hHTe", "webHookId": "zg3WuBI0"}' \
    > test.out 2>&1
eval_tap $? 333 'UpdatePayPalConfig' test.out

#- 334 TestPayPalConfigById
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfigById \
    --id 'xNiFkH8P' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 334 'TestPayPalConfigById' test.out

#- 335 UpdateStripeConfig
./ng net.accelbyte.sdk.cli.Main platform updateStripeConfig \
    --id 'E5dq6UDB' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethodTypes": ["4HGlhTUs", "YCQXOS1G", "NPu4aQe4"], "publishableKey": "JN2iIU55", "secretKey": "a1XZhk59", "webhookSecret": "5wh9ieU3"}' \
    > test.out 2>&1
eval_tap $? 335 'UpdateStripeConfig' test.out

#- 336 TestStripeConfigById
./ng net.accelbyte.sdk.cli.Main platform testStripeConfigById \
    --id '7kL2PyJf' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 336 'TestStripeConfigById' test.out

#- 337 UpdateWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfig \
    --id 'uxafWb2i' \
    --validate  \
    --body '{"appId": "rfkmGB7n", "key": "zCbifHJA", "mchid": "AWIGYssQ", "returnUrl": "8dxVWaKB"}' \
    > test.out 2>&1
eval_tap $? 337 'UpdateWxPayConfig' test.out

#- 338 UpdateWxPayConfigCert
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfigCert \
    --id '7q2v1wXV' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 338 'UpdateWxPayConfigCert' test.out

#- 339 TestWxPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfigById \
    --id 'OOlpTFu7' \
    > test.out 2>&1
eval_tap $? 339 'TestWxPayConfigById' test.out

#- 340 UpdateXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaConfig \
    --id 'IkFWWDI4' \
    --validate  \
    --body '{"apiKey": "6hmbvUJp", "flowCompletionUrl": "z00X8DSJ", "merchantId": 82, "projectId": 73, "projectSecretKey": "occK5duN"}' \
    > test.out 2>&1
eval_tap $? 340 'UpdateXsollaConfig' test.out

#- 341 TestXsollaConfigById
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfigById \
    --id 'EfrSXGi1' \
    > test.out 2>&1
eval_tap $? 341 'TestXsollaConfigById' test.out

#- 342 UpdateXsollaUIConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaUIConfig \
    --id 'lkH7bQ4r' \
    --body '{"device": "MOBILE", "showCloseButton": true, "size": "MEDIUM", "theme": "DEFAULT"}' \
    > test.out 2>&1
eval_tap $? 342 'UpdateXsollaUIConfig' test.out

#- 343 QueryPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform queryPaymentProviderConfig \
    --limit '93' \
    --namespace "$AB_NAMESPACE" \
    --offset '22' \
    --region 'IVil1VpF' \
    > test.out 2>&1
eval_tap $? 343 'QueryPaymentProviderConfig' test.out

#- 344 CreatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform createPaymentProviderConfig \
    --body '{"aggregate": "XSOLLA", "namespace": "U8FuvWDS", "region": "6R8VS9d5", "sandboxTaxJarApiToken": "njL0tx84", "specials": ["STRIPE", "WALLET", "ADYEN"], "taxJarApiToken": "ToWvztH1", "taxJarEnabled": false, "useGlobalTaxJarApiToken": false}' \
    > test.out 2>&1
eval_tap $? 344 'CreatePaymentProviderConfig' test.out

#- 345 GetAggregatePaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getAggregatePaymentProviders \
    > test.out 2>&1
eval_tap $? 345 'GetAggregatePaymentProviders' test.out

#- 346 DebugMatchedPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentProviderConfig \
    --namespace "$AB_NAMESPACE" \
    --region '0PP95hgh' \
    > test.out 2>&1
eval_tap $? 346 'DebugMatchedPaymentProviderConfig' test.out

#- 347 GetSpecialPaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getSpecialPaymentProviders \
    > test.out 2>&1
eval_tap $? 347 'GetSpecialPaymentProviders' test.out

#- 348 UpdatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentProviderConfig \
    --id 'EPEEv3oI' \
    --body '{"aggregate": "ADYEN", "namespace": "KLtfEZJa", "region": "s4QGlpKU", "sandboxTaxJarApiToken": "zq0MUy3g", "specials": ["XSOLLA", "PAYPAL", "ADYEN"], "taxJarApiToken": "pb2q7FGX", "taxJarEnabled": true, "useGlobalTaxJarApiToken": false}' \
    > test.out 2>&1
eval_tap $? 348 'UpdatePaymentProviderConfig' test.out

#- 349 DeletePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform deletePaymentProviderConfig \
    --id 't2LZPuN3' \
    > test.out 2>&1
eval_tap $? 349 'DeletePaymentProviderConfig' test.out

#- 350 GetPaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxConfig \
    > test.out 2>&1
eval_tap $? 350 'GetPaymentTaxConfig' test.out

#- 351 UpdatePaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentTaxConfig \
    --body '{"sandboxTaxJarApiToken": "kMYUkNAP", "taxJarApiToken": "5hSXLzTS", "taxJarEnabled": false, "taxJarProductCodesMapping": {"xgAoU3kQ": "3zncxhgN", "w3ihkdWz": "tl7NvscR", "YM02GH4w": "FwmtiuAH"}}' \
    > test.out 2>&1
eval_tap $? 351 'UpdatePaymentTaxConfig' test.out

#- 352 SyncPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform syncPaymentOrders \
    --nextEvaluatedKey '2uiev8o8' \
    --end 'Okl7TOum' \
    --start 'FvgqWZQd' \
    > test.out 2>&1
eval_tap $? 352 'SyncPaymentOrders' test.out

#- 353 PublicGetRootCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetRootCategories \
    --namespace "$AB_NAMESPACE" \
    --language '4jz4Cp9w' \
    --storeId 'JFcFsAxt' \
    > test.out 2>&1
eval_tap $? 353 'PublicGetRootCategories' test.out

#- 354 DownloadCategories
./ng net.accelbyte.sdk.cli.Main platform downloadCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'iKrFhF6J' \
    --storeId 'gVeGZqhp' \
    > test.out 2>&1
eval_tap $? 354 'DownloadCategories' test.out

#- 355 PublicGetCategory
./ng net.accelbyte.sdk.cli.Main platform publicGetCategory \
    --categoryPath 'U0lr9gM9' \
    --namespace "$AB_NAMESPACE" \
    --language 'bKFm8CWq' \
    --storeId '9KFDLbMG' \
    > test.out 2>&1
eval_tap $? 355 'PublicGetCategory' test.out

#- 356 PublicGetChildCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetChildCategories \
    --categoryPath 'yd4xMNqb' \
    --namespace "$AB_NAMESPACE" \
    --language 'qSaoWpVP' \
    --storeId 'W5d7MFG5' \
    > test.out 2>&1
eval_tap $? 356 'PublicGetChildCategories' test.out

#- 357 PublicGetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetDescendantCategories \
    --categoryPath 'pjkSCU40' \
    --namespace "$AB_NAMESPACE" \
    --language '9cIdqfdD' \
    --storeId 'BYCmiiPb' \
    > test.out 2>&1
eval_tap $? 357 'PublicGetDescendantCategories' test.out

#- 358 PublicListCurrencies
./ng net.accelbyte.sdk.cli.Main platform publicListCurrencies \
    --namespace "$AB_NAMESPACE" \
    --currencyType 'REAL' \
    > test.out 2>&1
eval_tap $? 358 'PublicListCurrencies' test.out

#- 359 GeDLCDurableRewardShortMap
./ng net.accelbyte.sdk.cli.Main platform geDLCDurableRewardShortMap \
    --namespace "$AB_NAMESPACE" \
    --dlcType 'OCULUS' \
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
    --language 'Xea5j5UC' \
    --region 'VR6aF1JK' \
    --storeId 'KvthImq1' \
    --appId 'UT9fYRqu' \
    > test.out 2>&1
eval_tap $? 361 'PublicGetItemByAppId' test.out

#- 362 PublicQueryItems
./ng net.accelbyte.sdk.cli.Main platform publicQueryItems \
    --namespace "$AB_NAMESPACE" \
    --appType 'DLC' \
    --autoCalcEstimatedPrice  \
    --baseAppId '02ffbBOZ' \
    --categoryPath 'EGabdKG1' \
    --features 'RqOVPmNN' \
    --includeSubCategoryItem  \
    --itemType 'BUNDLE' \
    --language 'eZx39DF0' \
    --limit '31' \
    --offset '98' \
    --region '7ZjIv4UK' \
    --sortBy 'name,createdAt,createdAt:asc' \
    --storeId 'DB84pItN' \
    --tags 'tLFtExFb' \
    > test.out 2>&1
eval_tap $? 362 'PublicQueryItems' test.out

#- 363 PublicGetItemBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetItemBySku \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language '5f3aq9oB' \
    --region 'IGJsgANd' \
    --storeId '0NZscKEt' \
    --sku 'SnKpUgAF' \
    > test.out 2>&1
eval_tap $? 363 'PublicGetItemBySku' test.out

#- 364 PublicGetEstimatedPrice
./ng net.accelbyte.sdk.cli.Main platform publicGetEstimatedPrice \
    --namespace "$AB_NAMESPACE" \
    --region 'tktMZWsm' \
    --storeId 'dDzrO4wx' \
    --itemIds 'TFz9pIkB' \
    > test.out 2>&1
eval_tap $? 364 'PublicGetEstimatedPrice' test.out

#- 365 PublicBulkGetItems
./ng net.accelbyte.sdk.cli.Main platform publicBulkGetItems \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'G1hWadxs' \
    --region 'gmqQXjL2' \
    --storeId '1H0Hqk4X' \
    --itemIds '0boVup3G' \
    > test.out 2>&1
eval_tap $? 365 'PublicBulkGetItems' test.out

#- 366 PublicValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform publicValidateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --body '{"itemIds": ["EH8xG6DK", "3YvOD3Mx", "DV6dIRoN"]}' \
    > test.out 2>&1
eval_tap $? 366 'PublicValidateItemPurchaseCondition' test.out

#- 367 PublicSearchItems
./ng net.accelbyte.sdk.cli.Main platform publicSearchItems \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --itemType 'COINS' \
    --limit '26' \
    --offset '76' \
    --region 'ksoWnMf7' \
    --storeId 'Z7HGolOH' \
    --keyword 'Y6eNpQs3' \
    --language 'YCMNJR4x' \
    > test.out 2>&1
eval_tap $? 367 'PublicSearchItems' test.out

#- 368 PublicGetApp
./ng net.accelbyte.sdk.cli.Main platform publicGetApp \
    --itemId 'Ll4L8ArV' \
    --namespace "$AB_NAMESPACE" \
    --language 'quZQCsS5' \
    --region 'thxkaPie' \
    --storeId 'uAU3fJEX' \
    > test.out 2>&1
eval_tap $? 368 'PublicGetApp' test.out

#- 369 PublicGetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform publicGetItemDynamicData \
    --itemId 'wlbivOQD' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 369 'PublicGetItemDynamicData' test.out

#- 370 PublicGetItem
./ng net.accelbyte.sdk.cli.Main platform publicGetItem \
    --itemId '1vneTyM2' \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'YXOaMehl' \
    --populateBundle  \
    --region 'na0xFduR' \
    --storeId 'kprgckHf' \
    > test.out 2>&1
eval_tap $? 370 'PublicGetItem' test.out

#- 371 GetPaymentCustomization
eval_tap 0 371 'GetPaymentCustomization # SKIP deprecated' test.out

#- 372 PublicGetPaymentUrl
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentUrl \
    --namespace "$AB_NAMESPACE" \
    --body '{"paymentOrderNo": "iKeBE05j", "paymentProvider": "STRIPE", "returnUrl": "hFASNwiw", "ui": "m1Y7k2mN", "zipCode": "7ymqGfCr"}' \
    > test.out 2>&1
eval_tap $? 372 'PublicGetPaymentUrl' test.out

#- 373 PublicGetPaymentMethods
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentMethods \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'VEe80fN6' \
    > test.out 2>&1
eval_tap $? 373 'PublicGetPaymentMethods' test.out

#- 374 PublicGetUnpaidPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUnpaidPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'uDwM4aGl' \
    > test.out 2>&1
eval_tap $? 374 'PublicGetUnpaidPaymentOrder' test.out

#- 375 Pay
./ng net.accelbyte.sdk.cli.Main platform pay \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'rg53kYNs' \
    --paymentProvider 'CHECKOUT' \
    --zipCode 'lwkFkm7O' \
    --body '{"token": "ox7B6igx"}' \
    > test.out 2>&1
eval_tap $? 375 'Pay' test.out

#- 376 PublicCheckPaymentOrderPaidStatus
./ng net.accelbyte.sdk.cli.Main platform publicCheckPaymentOrderPaidStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'RpszMz5V' \
    > test.out 2>&1
eval_tap $? 376 'PublicCheckPaymentOrderPaidStatus' test.out

#- 377 GetPaymentPublicConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentPublicConfig \
    --namespace "$AB_NAMESPACE" \
    --sandbox  \
    --paymentProvider 'ALIPAY' \
    --region 'WjMDFafu' \
    > test.out 2>&1
eval_tap $? 377 'GetPaymentPublicConfig' test.out

#- 378 PublicGetQRCode
./ng net.accelbyte.sdk.cli.Main platform publicGetQRCode \
    --namespace "$AB_NAMESPACE" \
    --code '7rCH5EcN' \
    > test.out 2>&1
eval_tap $? 378 'PublicGetQRCode' test.out

#- 379 PublicNormalizePaymentReturnUrl
./ng net.accelbyte.sdk.cli.Main platform publicNormalizePaymentReturnUrl \
    --namespace "$AB_NAMESPACE" \
    --payerID 'iXmkSLWo' \
    --foreinginvoice '5hHgAOs9' \
    --invoiceId 'AHfefk8T' \
    --payload 'or2jJQ0T' \
    --redirectResult 'lHNuFttZ' \
    --resultCode 'aq1tWzUP' \
    --sessionId 'm7zcA65G' \
    --status 'hVgio5Af' \
    --token 'YhEcsxz0' \
    --type 'iCDugwuQ' \
    --userId 'aXynHWnN' \
    --orderNo 'DB5y6b5b' \
    --paymentOrderNo 'domqJT7l' \
    --paymentProvider 'WXPAY' \
    --returnUrl '34KEqobp' \
    > test.out 2>&1
eval_tap $? 379 'PublicNormalizePaymentReturnUrl' test.out

#- 380 GetPaymentTaxValue
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxValue \
    --namespace "$AB_NAMESPACE" \
    --zipCode 'Vw8V1iJK' \
    --paymentOrderNo 'uiZdcCmP' \
    --paymentProvider 'PAYPAL' \
    > test.out 2>&1
eval_tap $? 380 'GetPaymentTaxValue' test.out

#- 381 GetRewardByCode
./ng net.accelbyte.sdk.cli.Main platform getRewardByCode \
    --namespace "$AB_NAMESPACE" \
    --rewardCode '9eyHR3fo' \
    > test.out 2>&1
eval_tap $? 381 'GetRewardByCode' test.out

#- 382 QueryRewards1
./ng net.accelbyte.sdk.cli.Main platform queryRewards1 \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'vJWdyDle' \
    --limit '80' \
    --offset '75' \
    --sortBy 'rewardCode:desc,rewardCode:asc,namespace' \
    > test.out 2>&1
eval_tap $? 382 'QueryRewards1' test.out

#- 383 GetReward1
./ng net.accelbyte.sdk.cli.Main platform getReward1 \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'NZ7heCMN' \
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
    --appIds 'X7askY7Y,G2qu7103,6knwJ8rd' \
    --itemIds 'gCNRPXYQ,rvC2hjIA,vy04b8Ge' \
    --skus 'yfCVhI9P,fHlKMxdV,6vQ0OgUQ' \
    > test.out 2>&1
eval_tap $? 385 'PublicExistsAnyMyActiveEntitlement' test.out

#- 386 PublicGetMyAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --appId 'WTFcBjXV' \
    > test.out 2>&1
eval_tap $? 386 'PublicGetMyAppEntitlementOwnershipByAppId' test.out

#- 387 PublicGetMyEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'ENTITLEMENT' \
    --itemId 'Jl1CgsRN' \
    > test.out 2>&1
eval_tap $? 387 'PublicGetMyEntitlementOwnershipByItemId' test.out

#- 388 PublicGetMyEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'APP' \
    --sku 'cV9PttAT' \
    > test.out 2>&1
eval_tap $? 388 'PublicGetMyEntitlementOwnershipBySku' test.out

#- 389 PublicGetEntitlementOwnershipToken
./ng net.accelbyte.sdk.cli.Main platform publicGetEntitlementOwnershipToken \
    --namespace "$AB_NAMESPACE" \
    --appIds 'jj8tXSEd,9jbdXnHN,1wxeepUk' \
    --itemIds 'Md67TaY2,UtFKXFGj,AxssbVR2' \
    --skus 'DAY6lWWS,lxEM15Wf,8BCOr6mp' \
    > test.out 2>&1
eval_tap $? 389 'PublicGetEntitlementOwnershipToken' test.out

#- 390 SyncTwitchDropsEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement \
    --namespace "$AB_NAMESPACE" \
    --body '{"gameId": "7CWrDdNC", "language": "sokz_gYAb", "region": "xPYJzQJR"}' \
    > test.out 2>&1
eval_tap $? 390 'SyncTwitchDropsEntitlement' test.out

#- 391 PublicGetMyWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetMyWallet \
    --currencyCode 'obyQ4YZP' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 391 'PublicGetMyWallet' test.out

#- 392 SyncEpicGameDLC
./ng net.accelbyte.sdk.cli.Main platform syncEpicGameDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'jSb6Ljts' \
    --body '{"epicGamesJwtToken": "UITVPzj4"}' \
    > test.out 2>&1
eval_tap $? 392 'SyncEpicGameDLC' test.out

#- 393 SyncOculusDLC
./ng net.accelbyte.sdk.cli.Main platform syncOculusDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'XDhm3aHv' \
    > test.out 2>&1
eval_tap $? 393 'SyncOculusDLC' test.out

#- 394 PublicSyncPsnDlcInventory
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'u4VIQRtS' \
    --body '{"serviceLabel": 31}' \
    > test.out 2>&1
eval_tap $? 394 'PublicSyncPsnDlcInventory' test.out

#- 395 PublicSyncPsnDlcInventoryWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventoryWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'mglWFRFH' \
    --body '{"serviceLabels": [42, 100, 22]}' \
    > test.out 2>&1
eval_tap $? 395 'PublicSyncPsnDlcInventoryWithMultipleServiceLabels' test.out

#- 396 SyncSteamDLC
./ng net.accelbyte.sdk.cli.Main platform syncSteamDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'UIScflt7' \
    --body '{"appId": "ufCkqXPS", "steamId": "LiYeswdb"}' \
    > test.out 2>&1
eval_tap $? 396 'SyncSteamDLC' test.out

#- 397 SyncXboxDLC
./ng net.accelbyte.sdk.cli.Main platform syncXboxDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'Zhde2oLT' \
    --body '{"xstsToken": "sN2He9oZ"}' \
    > test.out 2>&1
eval_tap $? 397 'SyncXboxDLC' test.out

#- 398 PublicQueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId '0VwBCS0e' \
    --appType 'GAME' \
    --entitlementClazz 'LOOTBOX' \
    --entitlementName 'r3ohEqyn' \
    --features '26HFhadv,j5DRz6mL,B0wwkYrH' \
    --itemId '79EnfMcz,Q4EGoC1k,td3T1MbJ' \
    --limit '56' \
    --offset '25' \
    > test.out 2>&1
eval_tap $? 398 'PublicQueryUserEntitlements' test.out

#- 399 PublicGetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'OmXd734j' \
    --appId 'wpl6j1Vw' \
    > test.out 2>&1
eval_tap $? 399 'PublicGetUserAppEntitlementByAppId' test.out

#- 400 PublicQueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 't3sB8qjA' \
    --limit '87' \
    --offset '34' \
    --appType 'SOFTWARE' \
    > test.out 2>&1
eval_tap $? 400 'PublicQueryUserEntitlementsByAppType' test.out

#- 401 PublicGetUserEntitlementsByIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementsByIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'U0FMsHXQ' \
    --availablePlatformOnly  \
    --ids 'rjzrXuaw,6dSa3YCu,uGJFiH2d' \
    > test.out 2>&1
eval_tap $? 401 'PublicGetUserEntitlementsByIds' test.out

#- 402 PublicGetUserEntitlementByItemId
eval_tap 0 402 'PublicGetUserEntitlementByItemId # SKIP deprecated' test.out

#- 403 PublicGetUserEntitlementBySku
eval_tap 0 403 'PublicGetUserEntitlementBySku # SKIP deprecated' test.out

#- 404 PublicUserEntitlementHistory
./ng net.accelbyte.sdk.cli.Main platform publicUserEntitlementHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'lGrI4yOh' \
    --endDate 'o7SsHiMl' \
    --entitlementClazz 'SUBSCRIPTION' \
    --limit '70' \
    --offset '62' \
    --startDate 'KsCbmpzK' \
    > test.out 2>&1
eval_tap $? 404 'PublicUserEntitlementHistory' test.out

#- 405 PublicExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'qAJdnfy3' \
    --appIds 'xIuyLawq,3yx4Fyz4,pCVQfEeU' \
    --itemIds 'yMef3uGQ,8BfGeG0g,ejazxtGa' \
    --skus '75MJEdUU,2iP63kfp,gXlfkHZB' \
    > test.out 2>&1
eval_tap $? 405 'PublicExistsAnyUserActiveEntitlement' test.out

#- 406 PublicGetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'KRQtt2BY' \
    --appId 'VXE01HOr' \
    > test.out 2>&1
eval_tap $? 406 'PublicGetUserAppEntitlementOwnershipByAppId' test.out

#- 407 PublicGetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'wsQkETz0' \
    --entitlementClazz 'OPTIONBOX' \
    --itemId '4doOIpvv' \
    > test.out 2>&1
eval_tap $? 407 'PublicGetUserEntitlementOwnershipByItemId' test.out

#- 408 PublicGetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'LwjylzRL' \
    --ids '5dE2VhAv,TL7lKtkh,KPk1qDIP' \
    > test.out 2>&1
eval_tap $? 408 'PublicGetUserEntitlementOwnershipByItemIds' test.out

#- 409 PublicGetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'vJXGEFa6' \
    --entitlementClazz 'MEDIA' \
    --sku 'ewUu6b80' \
    > test.out 2>&1
eval_tap $? 409 'PublicGetUserEntitlementOwnershipBySku' test.out

#- 410 PublicGetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlement \
    --entitlementId 'akcVKc85' \
    --namespace "$AB_NAMESPACE" \
    --userId 'C7nQFVxI' \
    > test.out 2>&1
eval_tap $? 410 'PublicGetUserEntitlement' test.out

#- 411 PublicConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicConsumeUserEntitlement \
    --entitlementId 'UD9DFbRe' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Zu1m39BC' \
    --body '{"options": ["gUAbrlyM", "DGXpqHbg", "eTeEsAlr"], "requestId": "CYkP0DEA", "useCount": 73}' \
    > test.out 2>&1
eval_tap $? 411 'PublicConsumeUserEntitlement' test.out

#- 412 PublicSellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicSellUserEntitlement \
    --entitlementId 'CVBpgXO8' \
    --namespace "$AB_NAMESPACE" \
    --userId 'EaSSeUbu' \
    --body '{"requestId": "kNkT4lj1", "useCount": 47}' \
    > test.out 2>&1
eval_tap $? 412 'PublicSellUserEntitlement' test.out

#- 413 PublicSplitUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicSplitUserEntitlement \
    --entitlementId 'YBZdKxFz' \
    --namespace "$AB_NAMESPACE" \
    --userId '42v2kdcl' \
    --body '{"useCount": 13}' \
    > test.out 2>&1
eval_tap $? 413 'PublicSplitUserEntitlement' test.out

#- 414 PublicTransferUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicTransferUserEntitlement \
    --entitlementId '3HGXo0Uo' \
    --namespace "$AB_NAMESPACE" \
    --userId '06eTKNAT' \
    --body '{"entitlementId": "eOy5kHKF", "useCount": 44}' \
    > test.out 2>&1
eval_tap $? 414 'PublicTransferUserEntitlement' test.out

#- 415 PublicRedeemCode
./ng net.accelbyte.sdk.cli.Main platform publicRedeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'yllJknUX' \
    --body '{"code": "ih3u1YgC", "language": "Szn", "region": "ElWaNSh0"}' \
    > test.out 2>&1
eval_tap $? 415 'PublicRedeemCode' test.out

#- 416 PublicFulfillAppleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillAppleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'TI2rSIvH' \
    --body '{"excludeOldTransactions": false, "language": "InD_Xpvc_817", "productId": "lUY9Ovri", "receiptData": "R6HWeNWk", "region": "Myc0SckG", "transactionId": "ZahxUERO"}' \
    > test.out 2>&1
eval_tap $? 416 'PublicFulfillAppleIAPItem' test.out

#- 417 SyncEpicGamesInventory
./ng net.accelbyte.sdk.cli.Main platform syncEpicGamesInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'ngAup08F' \
    --body '{"epicGamesJwtToken": "maWw9im6"}' \
    > test.out 2>&1
eval_tap $? 417 'SyncEpicGamesInventory' test.out

#- 418 PublicFulfillGoogleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillGoogleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'uSAb51Kk' \
    --body '{"autoAck": true, "language": "BP_dypR", "orderId": "Jagwt05v", "packageName": "UatbUhYE", "productId": "HGu6LhR4", "purchaseTime": 43, "purchaseToken": "Co6MorcF", "region": "LnsDibdp"}' \
    > test.out 2>&1
eval_tap $? 418 'PublicFulfillGoogleIAPItem' test.out

#- 419 SyncOculusConsumableEntitlements
./ng net.accelbyte.sdk.cli.Main platform syncOculusConsumableEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'cKAMUfXF' \
    > test.out 2>&1
eval_tap $? 419 'SyncOculusConsumableEntitlements' test.out

#- 420 PublicReconcilePlayStationStore
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStore \
    --namespace "$AB_NAMESPACE" \
    --userId 'tv7hs1dP' \
    --body '{"currencyCode": "W4FTcHc0", "price": 0.706803550681105, "productId": "6Caumwwt", "serviceLabel": 1}' \
    > test.out 2>&1
eval_tap $? 420 'PublicReconcilePlayStationStore' test.out

#- 421 PublicReconcilePlayStationStoreWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStoreWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'AHmYd8h1' \
    --body '{"currencyCode": "GgUue5kT", "price": 0.18581701144091622, "productId": "K73XIQyC", "serviceLabels": [33, 62, 23]}' \
    > test.out 2>&1
eval_tap $? 421 'PublicReconcilePlayStationStoreWithMultipleServiceLabels' test.out

#- 422 SyncSteamInventory
./ng net.accelbyte.sdk.cli.Main platform syncSteamInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'kVYEYXQn' \
    --body '{"appId": "R6yvYuIs", "currencyCode": "diMnx19L", "language": "pqN", "price": 0.5816542762081669, "productId": "eRcqv1dX", "region": "8FGsrTUE", "steamId": "uOYhwnhz"}' \
    > test.out 2>&1
eval_tap $? 422 'SyncSteamInventory' test.out

#- 423 SyncTwitchDropsEntitlement1
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'JotLuoXc' \
    --body '{"gameId": "IrmO6hdu", "language": "JlCm", "region": "8IHUUdri"}' \
    > test.out 2>&1
eval_tap $? 423 'SyncTwitchDropsEntitlement1' test.out

#- 424 SyncXboxInventory
./ng net.accelbyte.sdk.cli.Main platform syncXboxInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'YHiFFEmW' \
    --body '{"currencyCode": "HzyT48Zf", "price": 0.07942418347179936, "productId": "LLXmgqlG", "xstsToken": "QvXwwV2H"}' \
    > test.out 2>&1
eval_tap $? 424 'SyncXboxInventory' test.out

#- 425 PublicQueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'IfgPdWXW' \
    --discounted  \
    --itemId '1R81RgvL' \
    --limit '12' \
    --offset '85' \
    --status 'FULFILL_FAILED' \
    > test.out 2>&1
eval_tap $? 425 'PublicQueryUserOrders' test.out

#- 426 PublicCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'qsxo64dt' \
    --body '{"currencyCode": "CJp1RgSk", "discountCodes": ["8JNI6MBF", "BVYPn4wN", "MOEsJzVK"], "discountedPrice": 38, "ext": {"9fvd7YeX": {}, "Tc9crx2g": {}, "QSjJe7hL": {}}, "itemId": "T0oURWKY", "language": "QPQO_movM-pG", "price": 62, "quantity": 17, "region": "0QB51WsP", "returnUrl": "d3yrhZfY", "sectionId": "AMTsWX2s"}' \
    > test.out 2>&1
eval_tap $? 426 'PublicCreateUserOrder' test.out

#- 427 PublicPreviewOrderPrice
./ng net.accelbyte.sdk.cli.Main platform publicPreviewOrderPrice \
    --namespace "$AB_NAMESPACE" \
    --userId 'OTlrSDD4' \
    --body '{"currencyCode": "lf0eOzHW", "discountCodes": ["xJP4tncl", "IUMrc2Gr", "gU4GZYGp"], "discountedPrice": 98, "itemId": "Mdj1L2MP", "price": 47, "quantity": 43}' \
    > test.out 2>&1
eval_tap $? 427 'PublicPreviewOrderPrice' test.out

#- 428 PublicGetUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'Xxikl4UH' \
    --userId 'AzoU8WOW' \
    > test.out 2>&1
eval_tap $? 428 'PublicGetUserOrder' test.out

#- 429 PublicCancelUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCancelUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'VByDQ5ux' \
    --userId 'zP6kvhbd' \
    > test.out 2>&1
eval_tap $? 429 'PublicCancelUserOrder' test.out

#- 430 PublicGetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'VVYVjNUR' \
    --userId 'b1aJcWTu' \
    > test.out 2>&1
eval_tap $? 430 'PublicGetUserOrderHistories' test.out

#- 431 PublicDownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform publicDownloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'eOxAEMXg' \
    --userId 'WQWlVumF' \
    > test.out 2>&1
eval_tap $? 431 'PublicDownloadUserOrderReceipt' test.out

#- 432 PublicGetPaymentAccounts
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'AqNErE4a' \
    > test.out 2>&1
eval_tap $? 432 'PublicGetPaymentAccounts' test.out

#- 433 PublicDeletePaymentAccount
./ng net.accelbyte.sdk.cli.Main platform publicDeletePaymentAccount \
    --id 'wMM5AAy1' \
    --namespace "$AB_NAMESPACE" \
    --type 'paypal' \
    --userId 'VDTRVCSX' \
    > test.out 2>&1
eval_tap $? 433 'PublicDeletePaymentAccount' test.out

#- 434 PublicListActiveSections
./ng net.accelbyte.sdk.cli.Main platform publicListActiveSections \
    --namespace "$AB_NAMESPACE" \
    --userId 'RyPj9ZV3' \
    --autoCalcEstimatedPrice  \
    --language 'ae9kW5H1' \
    --region 'loRCcyuv' \
    --storeId 'Um7n5pnQ' \
    --viewId '38tTQ9w5' \
    > test.out 2>&1
eval_tap $? 434 'PublicListActiveSections' test.out

#- 435 PublicQueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'zU2CJB09' \
    --chargeStatus 'CHARGE_FAILED' \
    --itemId 'ed54ss9Y' \
    --limit '64' \
    --offset '68' \
    --sku 'dKm0259U' \
    --status 'CANCELLED' \
    --subscribedBy 'PLATFORM' \
    > test.out 2>&1
eval_tap $? 435 'PublicQueryUserSubscriptions' test.out

#- 436 PublicSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform publicSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId '7sagBYkr' \
    --body '{"currencyCode": "UjGRdWd5", "itemId": "qL8jP61N", "language": "MUw_tHEi_462", "region": "Fpyv5eKX", "returnUrl": "13hGSykI", "source": "7nL0eIRb"}' \
    > test.out 2>&1
eval_tap $? 436 'PublicSubscribeSubscription' test.out

#- 437 PublicCheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform publicCheckUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'T5lSvKwV' \
    --itemId 'Y49GfrG1' \
    > test.out 2>&1
eval_tap $? 437 'PublicCheckUserSubscriptionSubscribableByItemId' test.out

#- 438 PublicGetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'qfPNFIfs' \
    --userId 'jWe7vql6' \
    > test.out 2>&1
eval_tap $? 438 'PublicGetUserSubscription' test.out

#- 439 PublicChangeSubscriptionBillingAccount
./ng net.accelbyte.sdk.cli.Main platform publicChangeSubscriptionBillingAccount \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'qAVMVWge' \
    --userId '6EEnVOIF' \
    > test.out 2>&1
eval_tap $? 439 'PublicChangeSubscriptionBillingAccount' test.out

#- 440 PublicCancelSubscription
./ng net.accelbyte.sdk.cli.Main platform publicCancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'FbyKfOim' \
    --userId 'gal70UUo' \
    --body '{"immediate": true, "reason": "pqvd1eWS"}' \
    > test.out 2>&1
eval_tap $? 440 'PublicCancelSubscription' test.out

#- 441 PublicGetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'rS4UoxbW' \
    --userId '7VpMBCqW' \
    --excludeFree  \
    --limit '87' \
    --offset '36' \
    > test.out 2>&1
eval_tap $? 441 'PublicGetUserSubscriptionBillingHistories' test.out

#- 442 PublicListViews
./ng net.accelbyte.sdk.cli.Main platform publicListViews \
    --namespace "$AB_NAMESPACE" \
    --userId 'XSkv8hQG' \
    --language 'QVdWYpeA' \
    --storeId 'oPqL7aKZ' \
    > test.out 2>&1
eval_tap $? 442 'PublicListViews' test.out

#- 443 PublicGetWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetWallet \
    --currencyCode 'gtNgsZyA' \
    --namespace "$AB_NAMESPACE" \
    --userId 'iXj3SdXI' \
    > test.out 2>&1
eval_tap $? 443 'PublicGetWallet' test.out

#- 444 PublicListUserWalletTransactions
./ng net.accelbyte.sdk.cli.Main platform publicListUserWalletTransactions \
    --currencyCode 'EqnFmqnM' \
    --namespace "$AB_NAMESPACE" \
    --userId 'hu3PQMW7' \
    --limit '60' \
    --offset '8' \
    > test.out 2>&1
eval_tap $? 444 'PublicListUserWalletTransactions' test.out

#- 445 QueryItems1
./ng net.accelbyte.sdk.cli.Main platform queryItems1 \
    --namespace "$AB_NAMESPACE" \
    --appType 'DEMO' \
    --availableDate '3cuZEyAh' \
    --baseAppId 'K9NKK7Zu' \
    --categoryPath 'idtcKfTT' \
    --features 'k3PqPx5d' \
    --includeSubCategoryItem  \
    --itemName 'JeV8PtSM' \
    --itemStatus 'INACTIVE' \
    --itemType 'APP' \
    --limit '76' \
    --offset '40' \
    --region 'Di8pUmp4' \
    --sectionExclusive  \
    --sortBy 'name,createdAt:asc' \
    --storeId 'hzL8znCU' \
    --tags 'kgBTTmHQ' \
    --targetNamespace 'KeRpQimr' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 445 'QueryItems1' test.out

#- 446 ImportStore1
./ng net.accelbyte.sdk.cli.Main platform importStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId '6RAXxRSI' \
    --strictMode  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 446 'ImportStore1' test.out

#- 447 ExportStore1
./ng net.accelbyte.sdk.cli.Main platform exportStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'KKRaA2BD' \
    --body '{"itemIds": ["JWy7bEa1", "lZGazPts", "5pMotwpr"]}' \
    > test.out 2>&1
eval_tap $? 447 'ExportStore1' test.out

#- 448 FulfillRewardsV2
./ng net.accelbyte.sdk.cli.Main platform fulfillRewardsV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'solboAAR' \
    --body '{"entitlementCollectionId": "VbYUu0QX", "entitlementOrigin": "GooglePlay", "metadata": {"lfQLoelf": {}, "K47HGtbh": {}, "yoPt04eH": {}}, "origin": "GooglePlay", "rewards": [{"currency": {"currencyCode": "DtC971D4", "namespace": "EG2nLCFT"}, "item": {"itemId": "IXVDJBXM", "itemSku": "C250JuaB", "itemType": "NoUWVWyE"}, "quantity": 64, "type": "CURRENCY"}, {"currency": {"currencyCode": "ggoFqggF", "namespace": "KFkIEmjR"}, "item": {"itemId": "VywbG0D3", "itemSku": "YlG7emuf", "itemType": "4M7Lp6SD"}, "quantity": 23, "type": "CURRENCY"}, {"currency": {"currencyCode": "Xh8b7mP3", "namespace": "yRq8HGfq"}, "item": {"itemId": "IjsJiSOd", "itemSku": "9wqW6yVk", "itemType": "yT7sXtPC"}, "quantity": 94, "type": "CURRENCY"}], "source": "OTHER", "transactionId": "fmXBcReB"}' \
    > test.out 2>&1
eval_tap $? 448 'FulfillRewardsV2' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
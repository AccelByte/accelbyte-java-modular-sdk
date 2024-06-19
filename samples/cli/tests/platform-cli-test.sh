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
echo "1..456"

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
    --id '2x6g5qgt' \
    > test.out 2>&1
eval_tap $? 3 'GetFulfillmentScript' test.out

#- 4 CreateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform createFulfillmentScript \
    --id 'yAHnCgU3' \
    --body '{"grantDays": "2pB1A0rj"}' \
    > test.out 2>&1
eval_tap $? 4 'CreateFulfillmentScript' test.out

#- 5 DeleteFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform deleteFulfillmentScript \
    --id 'r7xtKkM9' \
    > test.out 2>&1
eval_tap $? 5 'DeleteFulfillmentScript' test.out

#- 6 UpdateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform updateFulfillmentScript \
    --id '3eOCrewH' \
    --body '{"grantDays": "Rf0slkBT"}' \
    > test.out 2>&1
eval_tap $? 6 'UpdateFulfillmentScript' test.out

#- 7 ListItemTypeConfigs
./ng net.accelbyte.sdk.cli.Main platform listItemTypeConfigs \
    > test.out 2>&1
eval_tap $? 7 'ListItemTypeConfigs' test.out

#- 8 CreateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform createItemTypeConfig \
    --body '{"clazz": "STSjwR21", "dryRun": false, "fulfillmentUrl": "SayRga9R", "itemType": "LOOTBOX", "purchaseConditionUrl": "yTKOg1VN"}' \
    > test.out 2>&1
eval_tap $? 8 'CreateItemTypeConfig' test.out

#- 9 SearchItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform searchItemTypeConfig \
    --clazz 'ibGit5Gv' \
    --itemType 'EXTENSION' \
    > test.out 2>&1
eval_tap $? 9 'SearchItemTypeConfig' test.out

#- 10 GetItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform getItemTypeConfig \
    --id 'QnHgc1g6' \
    > test.out 2>&1
eval_tap $? 10 'GetItemTypeConfig' test.out

#- 11 UpdateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform updateItemTypeConfig \
    --id '1EoQWN6Z' \
    --body '{"clazz": "IscJ0mP5", "dryRun": false, "fulfillmentUrl": "i6IPe4AO", "purchaseConditionUrl": "LJMrXs1A"}' \
    > test.out 2>&1
eval_tap $? 11 'UpdateItemTypeConfig' test.out

#- 12 DeleteItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform deleteItemTypeConfig \
    --id 'r2rgmhPW' \
    > test.out 2>&1
eval_tap $? 12 'DeleteItemTypeConfig' test.out

#- 13 QueryCampaigns
./ng net.accelbyte.sdk.cli.Main platform queryCampaigns \
    --namespace "$AB_NAMESPACE" \
    --limit '34' \
    --name 'eKsXMPCf' \
    --offset '30' \
    --tag 'NgXjwuEH' \
    > test.out 2>&1
eval_tap $? 13 'QueryCampaigns' test.out

#- 14 CreateCampaign
./ng net.accelbyte.sdk.cli.Main platform createCampaign \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "Mkf79sld", "discountConfig": {"categories": [{"categoryPath": "BeYpAAqt", "includeSubCategories": true}, {"categoryPath": "kANUOmzZ", "includeSubCategories": true}, {"categoryPath": "8c1zoIZt", "includeSubCategories": true}], "currencyCode": "LX1SYe6c", "currencyNamespace": "3A2yL81g", "discountAmount": 57, "discountPercentage": 42, "discountType": "PERCENTAGE", "items": [{"itemId": "TAd44gdj", "itemName": "i22JIO6U"}, {"itemId": "phz1vZNC", "itemName": "buZs6DFt"}, {"itemId": "ABkhclnB", "itemName": "tMzbrk5e"}], "restrictType": "NONE", "stackable": true}, "items": [{"extraSubscriptionDays": 35, "itemId": "Pccb4Eiy", "itemName": "a1zDgbxR", "quantity": 80}, {"extraSubscriptionDays": 7, "itemId": "BuWWsO85", "itemName": "YXhgpvf9", "quantity": 44}, {"extraSubscriptionDays": 21, "itemId": "c9fz1S2F", "itemName": "nJuWC7cG", "quantity": 34}], "maxRedeemCountPerCampaignPerUser": 2, "maxRedeemCountPerCode": 16, "maxRedeemCountPerCodePerUser": 49, "maxSaleCount": 82, "name": "ma1JMYo7", "redeemEnd": "1975-05-19T00:00:00Z", "redeemStart": "1982-09-25T00:00:00Z", "redeemType": "DISCOUNT", "status": "INACTIVE", "tags": ["FkWTfx0d", "UaMLUqQb", "m01n4wPD"], "type": "REDEMPTION"}' \
    > test.out 2>&1
eval_tap $? 14 'CreateCampaign' test.out

#- 15 GetCampaign
./ng net.accelbyte.sdk.cli.Main platform getCampaign \
    --campaignId '1a709KJT' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'GetCampaign' test.out

#- 16 UpdateCampaign
./ng net.accelbyte.sdk.cli.Main platform updateCampaign \
    --campaignId 'BVXNnxji' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "qPEAp50z", "discountConfig": {"categories": [{"categoryPath": "ZC0RPneY", "includeSubCategories": true}, {"categoryPath": "4mbUdlNa", "includeSubCategories": true}, {"categoryPath": "nfUC3skr", "includeSubCategories": true}], "currencyCode": "yoSbopFO", "currencyNamespace": "k1LneZwX", "discountAmount": 45, "discountPercentage": 10, "discountType": "AMOUNT", "items": [{"itemId": "3J0XH0hT", "itemName": "ed6Go9fc"}, {"itemId": "zxhgy0c8", "itemName": "uGGu3qUS"}, {"itemId": "IE4V8dFu", "itemName": "xxqCQE1F"}], "restrictType": "NONE", "stackable": true}, "items": [{"extraSubscriptionDays": 81, "itemId": "oPyxQn71", "itemName": "qrGxWgB7", "quantity": 29}, {"extraSubscriptionDays": 78, "itemId": "ouQxgBa4", "itemName": "JY2wVKTQ", "quantity": 81}, {"extraSubscriptionDays": 20, "itemId": "Rg27l8B6", "itemName": "Lpcv4B0A", "quantity": 76}], "maxRedeemCountPerCampaignPerUser": 27, "maxRedeemCountPerCode": 35, "maxRedeemCountPerCodePerUser": 34, "maxSaleCount": 69, "name": "5Gd6t8sM", "redeemEnd": "1986-09-25T00:00:00Z", "redeemStart": "1976-02-05T00:00:00Z", "redeemType": "ITEM", "status": "ACTIVE", "tags": ["o6XqFoi0", "kKOCFuce", "riDQ7sPo"]}' \
    > test.out 2>&1
eval_tap $? 16 'UpdateCampaign' test.out

#- 17 GetCampaignDynamic
./ng net.accelbyte.sdk.cli.Main platform getCampaignDynamic \
    --campaignId 'sFLsTr0Y' \
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
    --body '{"appConfig": {"appName": "CBH6wZqH"}, "customConfig": {"connectionType": "TLS", "grpcServerAddress": "jKD6U3xY"}, "extendType": "APP"}' \
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
    --body '{"appConfig": {"appName": "Qfh4ReJp"}, "customConfig": {"connectionType": "INSECURE", "grpcServerAddress": "kF3BXJ9Z"}, "extendType": "APP"}' \
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
    --storeId 'OxuBw5fW' \
    > test.out 2>&1
eval_tap $? 29 'GetRootCategories' test.out

#- 30 CreateCategory
./ng net.accelbyte.sdk.cli.Main platform createCategory \
    --namespace "$AB_NAMESPACE" \
    --storeId 'knnHI6If' \
    --body '{"categoryPath": "Pj3eTBKe", "localizationDisplayNames": {"sEijOLxg": "YbhjQQKL", "9tzXsTaO": "pkuYwvN2", "31KgQiLc": "zJZ5rTli"}}' \
    > test.out 2>&1
eval_tap $? 30 'CreateCategory' test.out

#- 31 ListCategoriesBasic
./ng net.accelbyte.sdk.cli.Main platform listCategoriesBasic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'BxopgkI3' \
    > test.out 2>&1
eval_tap $? 31 'ListCategoriesBasic' test.out

#- 32 GetCategory
./ng net.accelbyte.sdk.cli.Main platform getCategory \
    --categoryPath '0MGmj9NV' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'QKOpAWs9' \
    > test.out 2>&1
eval_tap $? 32 'GetCategory' test.out

#- 33 UpdateCategory
./ng net.accelbyte.sdk.cli.Main platform updateCategory \
    --categoryPath 'najw6yNz' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'aTZwh4ju' \
    --body '{"localizationDisplayNames": {"zA42k50k": "kb44DZhv", "6TXY81Dm": "LRgFXgca", "Mlbs3Q0X": "42SfNLcc"}}' \
    > test.out 2>&1
eval_tap $? 33 'UpdateCategory' test.out

#- 34 DeleteCategory
./ng net.accelbyte.sdk.cli.Main platform deleteCategory \
    --categoryPath 'ZlPs69rQ' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'zZt4Tu3Y' \
    > test.out 2>&1
eval_tap $? 34 'DeleteCategory' test.out

#- 35 GetChildCategories
./ng net.accelbyte.sdk.cli.Main platform getChildCategories \
    --categoryPath 'PW0H3go7' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'nrlGltLy' \
    > test.out 2>&1
eval_tap $? 35 'GetChildCategories' test.out

#- 36 GetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform getDescendantCategories \
    --categoryPath 'I1Da6R5P' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'I4KSkWa4' \
    > test.out 2>&1
eval_tap $? 36 'GetDescendantCategories' test.out

#- 37 QueryCodes
./ng net.accelbyte.sdk.cli.Main platform queryCodes \
    --campaignId 'C35IRw2k' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --batchNo '34' \
    --code 'NzYu224B' \
    --limit '27' \
    --offset '79' \
    > test.out 2>&1
eval_tap $? 37 'QueryCodes' test.out

#- 38 CreateCodes
./ng net.accelbyte.sdk.cli.Main platform createCodes \
    --campaignId 'b8B6dgZF' \
    --namespace "$AB_NAMESPACE" \
    --body '{"codeValue": "9hII2QdE", "quantity": 92}' \
    > test.out 2>&1
eval_tap $? 38 'CreateCodes' test.out

#- 39 Download
./ng net.accelbyte.sdk.cli.Main platform download \
    --campaignId 'wScCYpKE' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '67' \
    > test.out 2>&1
eval_tap $? 39 'Download' test.out

#- 40 BulkDisableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkDisableCodes \
    --campaignId 'q8xmOUcp' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '85' \
    > test.out 2>&1
eval_tap $? 40 'BulkDisableCodes' test.out

#- 41 BulkEnableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkEnableCodes \
    --campaignId 'R2kbQI8F' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '58' \
    > test.out 2>&1
eval_tap $? 41 'BulkEnableCodes' test.out

#- 42 QueryRedeemHistory
./ng net.accelbyte.sdk.cli.Main platform queryRedeemHistory \
    --campaignId 'dyiuI79L' \
    --namespace "$AB_NAMESPACE" \
    --code '09Vx5vug' \
    --limit '94' \
    --offset '25' \
    --userId 'uyQOZvIk' \
    > test.out 2>&1
eval_tap $? 42 'QueryRedeemHistory' test.out

#- 43 GetCode
./ng net.accelbyte.sdk.cli.Main platform getCode \
    --code 'ohLGGqPw' \
    --namespace "$AB_NAMESPACE" \
    --redeemable  \
    > test.out 2>&1
eval_tap $? 43 'GetCode' test.out

#- 44 DisableCode
./ng net.accelbyte.sdk.cli.Main platform disableCode \
    --code 'wqXrHlFU' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 44 'DisableCode' test.out

#- 45 EnableCode
./ng net.accelbyte.sdk.cli.Main platform enableCode \
    --code 'vQYahoXF' \
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
    --body '{"currencyCode": "rpTiRMjY", "currencySymbol": "ppkc6iza", "currencyType": "REAL", "decimals": 78, "localizationDescriptions": {"5CBMHJov": "GPL18z3N", "P5ih4769": "fGyQPunw", "3Tp4nn9o": "31B4n2ph"}}' \
    > test.out 2>&1
eval_tap $? 50 'CreateCurrency' test.out

#- 51 UpdateCurrency
./ng net.accelbyte.sdk.cli.Main platform updateCurrency \
    --currencyCode 'iyHV2tKt' \
    --namespace "$AB_NAMESPACE" \
    --body '{"localizationDescriptions": {"mXjPIXpH": "MkYz0aq1", "EzhlLXDo": "yXOkCCuI", "VFYa4URg": "HehDrnbd"}}' \
    > test.out 2>&1
eval_tap $? 51 'UpdateCurrency' test.out

#- 52 DeleteCurrency
./ng net.accelbyte.sdk.cli.Main platform deleteCurrency \
    --currencyCode 'UGu57L7l' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 52 'DeleteCurrency' test.out

#- 53 GetCurrencyConfig
./ng net.accelbyte.sdk.cli.Main platform getCurrencyConfig \
    --currencyCode 'G4Kh2oVw' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 53 'GetCurrencyConfig' test.out

#- 54 GetCurrencySummary
./ng net.accelbyte.sdk.cli.Main platform getCurrencySummary \
    --currencyCode '0Y860fEm' \
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
    --body '{"data": [{"id": "LOrG9FaN", "rewards": [{"currency": {"currencyCode": "CbJ4AkHA", "namespace": "bklX7iEi"}, "item": {"itemId": "mzMzQYlq", "itemSku": "MDATOqny", "itemType": "yCSgTFL2"}, "quantity": 83, "type": "ITEM"}, {"currency": {"currencyCode": "hBg5HN7r", "namespace": "JkweNpui"}, "item": {"itemId": "pmfRgefJ", "itemSku": "ZhVWnXOM", "itemType": "4YkVfN2n"}, "quantity": 39, "type": "CURRENCY"}, {"currency": {"currencyCode": "jLdDvx9T", "namespace": "zfALc5WU"}, "item": {"itemId": "5SFDw0wv", "itemSku": "zTnqI6JX", "itemType": "VbtoFsiX"}, "quantity": 82, "type": "ITEM"}]}, {"id": "7vFZtcXi", "rewards": [{"currency": {"currencyCode": "eLlp9yiQ", "namespace": "ccxnHS58"}, "item": {"itemId": "pspOawd3", "itemSku": "4HYQwhQT", "itemType": "jhCNlmJl"}, "quantity": 85, "type": "CURRENCY"}, {"currency": {"currencyCode": "Vdt7t8y6", "namespace": "Rh5phnjW"}, "item": {"itemId": "SV5q09Fp", "itemSku": "o0DwWiBR", "itemType": "7zV47Eiy"}, "quantity": 6, "type": "ITEM"}, {"currency": {"currencyCode": "JPo3u6iy", "namespace": "47dKXYYY"}, "item": {"itemId": "mIx63btT", "itemSku": "w2K7nhGu", "itemType": "TR9he4pd"}, "quantity": 22, "type": "ITEM"}]}, {"id": "nLQ6ft5j", "rewards": [{"currency": {"currencyCode": "fdtQvj0G", "namespace": "RHf02gwe"}, "item": {"itemId": "VqUhPMww", "itemSku": "7V8eQP47", "itemType": "GJjk5Tzt"}, "quantity": 63, "type": "CURRENCY"}, {"currency": {"currencyCode": "HasAYw3K", "namespace": "l134ebHp"}, "item": {"itemId": "Eli4OuRZ", "itemSku": "Le3eijKE", "itemType": "HRjFIVer"}, "quantity": 100, "type": "ITEM"}, {"currency": {"currencyCode": "CbIcH9l1", "namespace": "qlb3LYvU"}, "item": {"itemId": "UJUJpl6A", "itemSku": "S1PuzwH0", "itemType": "niGUpDx7"}, "quantity": 3, "type": "ITEM"}]}]}' \
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
    --body '{"data": [{"platform": "EPICGAMES", "platformDlcIdMap": {"dunO3cs3": "sYSnzOlH", "mwIqe5Cw": "ktL32D8i", "R7BpY1hC": "FRD1gVdz"}}, {"platform": "PSN", "platformDlcIdMap": {"38GwNsda": "DvolpySf", "38uWdpAb": "Ujm0SJGc", "NnNmxqNi": "hwJ74Us9"}}, {"platform": "EPICGAMES", "platformDlcIdMap": {"je3MumO5": "OCIs8cyI", "lQinW3oB": "LuHhDTNf", "mjBsnlJa": "lCWiq7XA"}}]}' \
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
    --appType 'GAME' \
    --entitlementClazz 'MEDIA' \
    --entitlementName 'z5yntw1A' \
    --itemId 'yVbDWVps,p1ogYORh,DMDYOkLy' \
    --limit '20' \
    --offset '1' \
    --origin 'Epic' \
    --userId 'HttJPiWy' \
    > test.out 2>&1
eval_tap $? 61 'QueryEntitlements' test.out

#- 62 QueryEntitlements1
./ng net.accelbyte.sdk.cli.Main platform queryEntitlements1 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemIds 'LeNXecdu,FgQtwKAb,5ZNzdsPZ' \
    --limit '38' \
    --offset '65' \
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
    --body '{"entitlementGrantList": [{"collectionId": "hJQmGxgG", "endDate": "1989-08-07T00:00:00Z", "grantedCode": "C0DhnUWn", "itemId": "ERZsrVwn", "itemNamespace": "3sEC8x3d", "language": "LEJ", "origin": "Playstation", "quantity": 43, "region": "1WOhj9qh", "source": "PURCHASE", "startDate": "1978-12-08T00:00:00Z", "storeId": "tS8z1hMF"}, {"collectionId": "1Ebigpxp", "endDate": "1977-11-21T00:00:00Z", "grantedCode": "Mr6Kk8RD", "itemId": "MlKEqSRU", "itemNamespace": "ZpUpF7sI", "language": "etH", "origin": "Steam", "quantity": 8, "region": "NgAAYqT9", "source": "PROMOTION", "startDate": "1985-04-16T00:00:00Z", "storeId": "IuStpBDa"}, {"collectionId": "qNfkUI2W", "endDate": "1973-07-10T00:00:00Z", "grantedCode": "kk0lEjDi", "itemId": "U0RksnYO", "itemNamespace": "qW6drB5n", "language": "gQS_xT", "origin": "System", "quantity": 10, "region": "AEKDFION", "source": "GIFT", "startDate": "1974-01-03T00:00:00Z", "storeId": "cBecEFsW"}], "userIds": ["fIiFsvSR", "9i3Wp7zs", "VrtNQ7dK"]}' \
    > test.out 2>&1
eval_tap $? 65 'GrantEntitlements' test.out

#- 66 RevokeEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeEntitlements \
    --namespace "$AB_NAMESPACE" \
    --body '["Ys5KZ1cZ", "ZjwCeVR6", "ZKm9CSTv"]' \
    > test.out 2>&1
eval_tap $? 66 'RevokeEntitlements' test.out

#- 67 GetEntitlement
./ng net.accelbyte.sdk.cli.Main platform getEntitlement \
    --entitlementId 'hqPTajpo' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 67 'GetEntitlement' test.out

#- 68 QueryFulfillmentHistories
./ng net.accelbyte.sdk.cli.Main platform queryFulfillmentHistories \
    --namespace "$AB_NAMESPACE" \
    --limit '74' \
    --offset '13' \
    --status 'SUCCESS' \
    --userId 's28WRvm6' \
    > test.out 2>&1
eval_tap $? 68 'QueryFulfillmentHistories' test.out

#- 69 QueryIAPClawbackHistory
./ng net.accelbyte.sdk.cli.Main platform queryIAPClawbackHistory \
    --namespace "$AB_NAMESPACE" \
    --endTime 'HEKhqz8r' \
    --eventType 'REFUND' \
    --externalOrderId '8teefKYE' \
    --limit '29' \
    --offset '12' \
    --startTime 'daU5zVuD' \
    --status 'SUCCESS' \
    --userId 'RQpgf7Hd' \
    > test.out 2>&1
eval_tap $? 69 'QueryIAPClawbackHistory' test.out

#- 70 MockPlayStationStreamEvent
./ng net.accelbyte.sdk.cli.Main platform mockPlayStationStreamEvent \
    --namespace "$AB_NAMESPACE" \
    --body '{"body": {"account": "Jb3cJNeB", "additionalData": {"entitlement": [{"clientTransaction": [{"amountConsumed": 45, "clientTransactionId": "WB2F47Zn"}, {"amountConsumed": 17, "clientTransactionId": "XxZcgHhy"}, {"amountConsumed": 33, "clientTransactionId": "PuKbLOyT"}], "entitlementId": "vCy1CHYI", "usageCount": 51}, {"clientTransaction": [{"amountConsumed": 93, "clientTransactionId": "M7cHuAmO"}, {"amountConsumed": 34, "clientTransactionId": "PdveMmPL"}, {"amountConsumed": 32, "clientTransactionId": "xwpts8Se"}], "entitlementId": "73RuOcRe", "usageCount": 18}, {"clientTransaction": [{"amountConsumed": 9, "clientTransactionId": "G8OiETcl"}, {"amountConsumed": 55, "clientTransactionId": "4hJXE6bs"}, {"amountConsumed": 31, "clientTransactionId": "6s8WeSAz"}], "entitlementId": "4xuF6aZR", "usageCount": 66}], "purpose": "JGg46KtH"}, "originalTitleName": "edkz06YX", "paymentProductSKU": "wICg7rae", "purchaseDate": "thRSazCw", "sourceOrderItemId": "2WC5RI4c", "titleName": "l0hCQjsN"}, "eventDomain": "TFnvkrl0", "eventSource": "Kwvs4n1J", "eventType": "8gSFWVuV", "eventVersion": 98, "id": "uQXT6A4m", "timestamp": "jtBsrTB2"}' \
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
    --body '{"bundleId": "TNIDvZ7q", "password": "0qkEkDNj"}' \
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
    --body '{"sandboxId": "KR5aQFdP"}' \
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
    --body '{"applicationName": "rWKt6JCQ", "serviceAccountId": "WmThLMSL"}' \
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
    --body '{"data": [{"itemIdentity": "Xw2Yt5HY", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"Zt2TAMW4": "Zu9EFIDi", "WIUqyLtA": "peZgI2X9", "QDAOz7wj": "kjntWTWH"}}, {"itemIdentity": "4EwD4vvJ", "itemIdentityType": "ITEM_ID", "platformProductIdMap": {"WPP6S3kH": "F921OUxl", "hWECBuy8": "NzU04Jsj", "pjkNMyzb": "dV31iVVX"}}, {"itemIdentity": "20gwvjhw", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"IO3aOTdN": "w8asbBET", "8L6nGc97": "ayMJ93Bn", "ARtYhJLK": "Hctr9Vhr"}}]}' \
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
    --body '{"appId": "koQSYRSM", "appSecret": "hUYWpj9I"}' \
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
    --body '{"backOfficeServerClientId": "6lCLS6PV", "backOfficeServerClientSecret": "XbhzzqhA", "enableStreamJob": false, "environment": "UbRYD5pk", "streamName": "P0PUuGq1", "streamPartnerName": "nU8lQryn"}' \
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
    --body '{"backOfficeServerClientId": "rYXVQwLD", "backOfficeServerClientSecret": "JvP86iHp", "enableStreamJob": true, "environment": "pCzlzKTo", "streamName": "X4nE1dcd", "streamPartnerName": "pT4hXPYb"}' \
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
    --body '{"appId": "LiPjt3MT", "publisherAuthenticationKey": "x226E7zf"}' \
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
    --body '{"clientId": "iqvL2Iyn", "clientSecret": "hEAJQjCy", "organizationId": "6gTJB7eL"}' \
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
    --body '{"relyingPartyCert": "KRQY7wnX"}' \
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
    --password 'LkpdzO9q' \
    > test.out 2>&1
eval_tap $? 101 'UpdateXblBPCertFile' test.out

#- 102 DownloadInvoiceDetails
./ng net.accelbyte.sdk.cli.Main platform downloadInvoiceDetails \
    --namespace "$AB_NAMESPACE" \
    --feature 'pWUWYRat' \
    --itemId 'boOtfJeb' \
    --itemType 'SEASON' \
    --endTime 'VfHhHCj2' \
    --startTime 'HJaZORZJ' \
    > test.out 2>&1
eval_tap $? 102 'DownloadInvoiceDetails' test.out

#- 103 GenerateInvoiceSummary
./ng net.accelbyte.sdk.cli.Main platform generateInvoiceSummary \
    --namespace "$AB_NAMESPACE" \
    --feature 'aQeF61oW' \
    --itemId 'DgzdWg6t' \
    --itemType 'BUNDLE' \
    --endTime 'sC8Yej19' \
    --startTime '1IzLObJd' \
    > test.out 2>&1
eval_tap $? 103 'GenerateInvoiceSummary' test.out

#- 104 SyncInGameItem
./ng net.accelbyte.sdk.cli.Main platform syncInGameItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'HBuALkwi' \
    --body '{"categoryPath": "U4V9ff0R", "targetItemId": "BiCUXy30", "targetNamespace": "zdQbU2sC"}' \
    > test.out 2>&1
eval_tap $? 104 'SyncInGameItem' test.out

#- 105 CreateItem
./ng net.accelbyte.sdk.cli.Main platform createItem \
    --namespace "$AB_NAMESPACE" \
    --storeId '5q4yCmdP' \
    --body '{"appId": "ejFPIQRl", "appType": "SOFTWARE", "baseAppId": "gPPuhrN0", "boothName": "ecffQ5eZ", "categoryPath": "0yeEk0Iz", "clazz": "NWYn1tyY", "displayOrder": 98, "entitlementType": "DURABLE", "ext": {"zK4hpEHk": {}, "u5gIr40R": {}, "rE0I5PdT": {}}, "features": ["bFsOsGxx", "QRkYRW7d", "lXcV4BIk"], "flexible": false, "images": [{"as": "HyY0p0ud", "caption": "352wkgBq", "height": 85, "imageUrl": "WbqIszJS", "smallImageUrl": "3KssNZe6", "width": 75}, {"as": "GpvTWsBd", "caption": "I8bHzPdp", "height": 56, "imageUrl": "YzhFRGe4", "smallImageUrl": "wuwqdRJ3", "width": 35}, {"as": "btfkutJ6", "caption": "8S7ODcap", "height": 79, "imageUrl": "s8RbdGtW", "smallImageUrl": "e5Ued4DS", "width": 96}], "inventoryConfig": {"customAttributes": {"9ziefEdj": {}, "DpMK0Hr4": {}, "jYtYRs41": {}}, "serverCustomAttributes": {"qeI3qNRz": {}, "70Og4Fiy": {}, "94RH1LxK": {}}, "slotUsed": 75}, "itemIds": ["vV6iwNF9", "lqDtYfFX", "ZXGmyGp2"], "itemQty": {"u3s8gskJ": 30, "w2kGWgpN": 100, "qxYe28ko": 16}, "itemType": "SEASON", "listable": true, "localizations": {"4mbvdWG4": {"description": "IJXgGR83", "localExt": {"jICDjs7X": {}, "t1e0vtPD": {}, "YXVn8BNh": {}}, "longDescription": "U79i8sZr", "title": "AMjIBR6m"}, "hOLcF3KA": {"description": "05qr5UUx", "localExt": {"PtclUO71": {}, "KlBTvFca": {}, "2FwJrdgY": {}}, "longDescription": "F9XDRU7Z", "title": "bwQI0eVV"}, "uddYKI6q": {"description": "TIHvlILy", "localExt": {"laXfhT2O": {}, "1mEphk0k": {}, "QNPbM42T": {}}, "longDescription": "ZzOZg5eS", "title": "hVjaI2Pd"}}, "lootBoxConfig": {"rewardCount": 90, "rewards": [{"lootBoxItems": [{"count": 66, "duration": 48, "endDate": "1974-04-15T00:00:00Z", "itemId": "JY24vFy9", "itemSku": "A9coaeWl", "itemType": "F4TMMAjg"}, {"count": 32, "duration": 17, "endDate": "1996-01-02T00:00:00Z", "itemId": "JUca3lEq", "itemSku": "PXosBauI", "itemType": "yUszK6wI"}, {"count": 50, "duration": 55, "endDate": "1972-02-19T00:00:00Z", "itemId": "pPi51qfA", "itemSku": "OOEekw5v", "itemType": "tDN3USNT"}], "name": "0KGwvT8r", "odds": 0.5321821943750457, "type": "REWARD_GROUP", "weight": 44}, {"lootBoxItems": [{"count": 46, "duration": 4, "endDate": "1998-11-08T00:00:00Z", "itemId": "W2N9zq2A", "itemSku": "XdQ4Ox0z", "itemType": "DTLIYGUS"}, {"count": 48, "duration": 55, "endDate": "1984-08-31T00:00:00Z", "itemId": "4XqFzl0F", "itemSku": "emngzqs5", "itemType": "65BA1DGz"}, {"count": 77, "duration": 53, "endDate": "1994-01-01T00:00:00Z", "itemId": "Hv6JNSRa", "itemSku": "vt6UcSi4", "itemType": "HbjK4h6d"}], "name": "0rx2HkrC", "odds": 0.5736259967313051, "type": "REWARD", "weight": 43}, {"lootBoxItems": [{"count": 37, "duration": 2, "endDate": "1990-06-10T00:00:00Z", "itemId": "etQ5D5vT", "itemSku": "2XAc1eiF", "itemType": "WHhCjnms"}, {"count": 69, "duration": 2, "endDate": "1974-04-19T00:00:00Z", "itemId": "sQvhVbyD", "itemSku": "SbFgk65D", "itemType": "Eb6eOybn"}, {"count": 28, "duration": 51, "endDate": "1976-12-15T00:00:00Z", "itemId": "DogLr7NC", "itemSku": "7VwGddWN", "itemType": "L7lPNoNt"}], "name": "D5dCB3xl", "odds": 0.8096902217805376, "type": "REWARD_GROUP", "weight": 35}], "rollFunction": "DEFAULT"}, "maxCount": 3, "maxCountPerUser": 29, "name": "kHar2TPi", "optionBoxConfig": {"boxItems": [{"count": 54, "duration": 60, "endDate": "1982-08-23T00:00:00Z", "itemId": "cKPR4uep", "itemSku": "30Jdxsy8", "itemType": "M6Z65xYg"}, {"count": 31, "duration": 61, "endDate": "1997-11-13T00:00:00Z", "itemId": "BkhmCVhD", "itemSku": "kyXO9pYT", "itemType": "vwE1c4CZ"}, {"count": 65, "duration": 54, "endDate": "1989-05-19T00:00:00Z", "itemId": "s99CEqZm", "itemSku": "PfO1XrkV", "itemType": "n6uqN52T"}]}, "purchasable": true, "recurring": {"cycle": "WEEKLY", "fixedFreeDays": 26, "fixedTrialCycles": 90, "graceDays": 2}, "regionData": {"isUGBek8": [{"currencyCode": "3miM13ke", "currencyNamespace": "fty6e7xm", "currencyType": "REAL", "discountAmount": 36, "discountExpireAt": "1979-09-29T00:00:00Z", "discountPercentage": 84, "discountPurchaseAt": "1971-04-02T00:00:00Z", "expireAt": "1987-11-04T00:00:00Z", "price": 88, "purchaseAt": "1985-12-21T00:00:00Z", "trialPrice": 10}, {"currencyCode": "GpeFzgb9", "currencyNamespace": "aca7UmrE", "currencyType": "VIRTUAL", "discountAmount": 7, "discountExpireAt": "1989-02-23T00:00:00Z", "discountPercentage": 67, "discountPurchaseAt": "1973-08-22T00:00:00Z", "expireAt": "1980-07-27T00:00:00Z", "price": 2, "purchaseAt": "1985-11-27T00:00:00Z", "trialPrice": 17}, {"currencyCode": "n39sAl8u", "currencyNamespace": "xPE5OHKw", "currencyType": "REAL", "discountAmount": 95, "discountExpireAt": "1992-03-26T00:00:00Z", "discountPercentage": 83, "discountPurchaseAt": "1997-02-13T00:00:00Z", "expireAt": "1990-01-09T00:00:00Z", "price": 99, "purchaseAt": "1979-03-03T00:00:00Z", "trialPrice": 8}], "dnfyS3hv": [{"currencyCode": "iwlyKiP1", "currencyNamespace": "eUsMgjmy", "currencyType": "REAL", "discountAmount": 79, "discountExpireAt": "1993-04-21T00:00:00Z", "discountPercentage": 19, "discountPurchaseAt": "1994-01-23T00:00:00Z", "expireAt": "1996-04-13T00:00:00Z", "price": 22, "purchaseAt": "1980-10-21T00:00:00Z", "trialPrice": 57}, {"currencyCode": "wMStBSVF", "currencyNamespace": "CgnAIkrJ", "currencyType": "VIRTUAL", "discountAmount": 8, "discountExpireAt": "1977-12-03T00:00:00Z", "discountPercentage": 79, "discountPurchaseAt": "1992-03-26T00:00:00Z", "expireAt": "1987-02-08T00:00:00Z", "price": 4, "purchaseAt": "1977-06-24T00:00:00Z", "trialPrice": 67}, {"currencyCode": "SSYhffuB", "currencyNamespace": "fhl33SmN", "currencyType": "VIRTUAL", "discountAmount": 88, "discountExpireAt": "1989-10-05T00:00:00Z", "discountPercentage": 6, "discountPurchaseAt": "1972-02-05T00:00:00Z", "expireAt": "1988-07-15T00:00:00Z", "price": 26, "purchaseAt": "1987-06-15T00:00:00Z", "trialPrice": 79}], "ogpsPmuj": [{"currencyCode": "SU72RX8N", "currencyNamespace": "uG32WF5f", "currencyType": "VIRTUAL", "discountAmount": 76, "discountExpireAt": "1996-06-07T00:00:00Z", "discountPercentage": 57, "discountPurchaseAt": "1983-01-12T00:00:00Z", "expireAt": "1996-06-27T00:00:00Z", "price": 73, "purchaseAt": "1994-09-01T00:00:00Z", "trialPrice": 4}, {"currencyCode": "ixJ4mQCZ", "currencyNamespace": "O1W3pIX5", "currencyType": "VIRTUAL", "discountAmount": 82, "discountExpireAt": "1974-12-31T00:00:00Z", "discountPercentage": 41, "discountPurchaseAt": "1981-05-31T00:00:00Z", "expireAt": "1994-03-25T00:00:00Z", "price": 0, "purchaseAt": "1974-05-21T00:00:00Z", "trialPrice": 44}, {"currencyCode": "03FA36ej", "currencyNamespace": "2BZXaxSv", "currencyType": "VIRTUAL", "discountAmount": 6, "discountExpireAt": "1982-11-08T00:00:00Z", "discountPercentage": 82, "discountPurchaseAt": "1976-04-07T00:00:00Z", "expireAt": "1989-06-02T00:00:00Z", "price": 88, "purchaseAt": "1988-10-22T00:00:00Z", "trialPrice": 4}]}, "saleConfig": {"currencyCode": "4SQ4YsvH", "price": 65}, "seasonType": "PASS", "sectionExclusive": false, "sellable": true, "sku": "3uMPOCg2", "stackable": true, "status": "ACTIVE", "tags": ["aRSEFzz4", "6DATKp3N", "dtrKI5Ss"], "targetCurrencyCode": "xDk65Aik", "targetNamespace": "RLrN7LdN", "thumbnailUrl": "9CBULyKB", "useCount": 33}' \
    > test.out 2>&1
eval_tap $? 105 'CreateItem' test.out

#- 106 GetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform getItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId '9Nkr6Twe' \
    --appId 'GZkLQwzI' \
    > test.out 2>&1
eval_tap $? 106 'GetItemByAppId' test.out

#- 107 QueryItems
./ng net.accelbyte.sdk.cli.Main platform queryItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --appType 'SOFTWARE' \
    --availableDate 'kVziGYWM' \
    --baseAppId 'yaUAgBJV' \
    --categoryPath 'V7gyVY7S' \
    --features 'XdXdKm02' \
    --includeSubCategoryItem  \
    --itemType 'BUNDLE' \
    --limit '36' \
    --offset '56' \
    --region 'TOuX2Usw' \
    --sortBy 'updatedAt:asc,displayOrder,name:asc' \
    --storeId 'qWaQypiP' \
    --tags 'kk61b54P' \
    --targetNamespace 'T6CL7CKo' \
    > test.out 2>&1
eval_tap $? 107 'QueryItems' test.out

#- 108 ListBasicItemsByFeatures
./ng net.accelbyte.sdk.cli.Main platform listBasicItemsByFeatures \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --features 'RY6A1cpT,cMthqOzk,3tCcLImp' \
    > test.out 2>&1
eval_tap $? 108 'ListBasicItemsByFeatures' test.out

#- 109 GetItems
./ng net.accelbyte.sdk.cli.Main platform getItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'Gd9ort7x' \
    --itemIds 'wxP90Obu' \
    > test.out 2>&1
eval_tap $? 109 'GetItems' test.out

#- 110 GetItemBySku
./ng net.accelbyte.sdk.cli.Main platform getItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId '0fDsFkNZ' \
    --sku 'qgqyQOyO' \
    > test.out 2>&1
eval_tap $? 110 'GetItemBySku' test.out

#- 111 GetLocaleItemBySku
./ng net.accelbyte.sdk.cli.Main platform getLocaleItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'Cm8H2NxG' \
    --populateBundle  \
    --region 'VWIeGP4z' \
    --storeId 'zOa0sJmD' \
    --sku 'Duxeni7y' \
    > test.out 2>&1
eval_tap $? 111 'GetLocaleItemBySku' test.out

#- 112 GetEstimatedPrice
./ng net.accelbyte.sdk.cli.Main platform getEstimatedPrice \
    --namespace "$AB_NAMESPACE" \
    --platform 'O2Yyf7Sm' \
    --region 'cHue9NYy' \
    --storeId 'iAUUKxyI' \
    --itemIds 'G22AwSQw' \
    --userId 'tmAfFLBa' \
    > test.out 2>&1
eval_tap $? 112 'GetEstimatedPrice' test.out

#- 113 GetItemIdBySku
./ng net.accelbyte.sdk.cli.Main platform getItemIdBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'cN07KB0C' \
    --sku 'QeKbiECO' \
    > test.out 2>&1
eval_tap $? 113 'GetItemIdBySku' test.out

#- 114 GetBulkItemIdBySkus
./ng net.accelbyte.sdk.cli.Main platform getBulkItemIdBySkus \
    --namespace "$AB_NAMESPACE" \
    --sku 'vvzwDViR,yN2LZiQS,VaFh3L69' \
    --storeId 'kXv1NFia' \
    > test.out 2>&1
eval_tap $? 114 'GetBulkItemIdBySkus' test.out

#- 115 BulkGetLocaleItems
./ng net.accelbyte.sdk.cli.Main platform bulkGetLocaleItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'r2snV3HI' \
    --region 'w9zos9bh' \
    --storeId 'kT41hQZH' \
    --itemIds 'qQ1yiCy9' \
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
    --platform 'aAv4OSOR' \
    --userId 'ygrWcm7H' \
    --body '{"itemIds": ["QCR1G3n6", "UcPCHPdZ", "PZabtJv1"]}' \
    > test.out 2>&1
eval_tap $? 117 'ValidateItemPurchaseCondition' test.out

#- 118 BulkUpdateRegionData
./ng net.accelbyte.sdk.cli.Main platform bulkUpdateRegionData \
    --namespace "$AB_NAMESPACE" \
    --storeId '3WVzylWV' \
    --body '{"changes": [{"itemIdentities": ["wTfw9igp", "5hCGAwBm", "EbkLdFQq"], "itemIdentityType": "ITEM_ID", "regionData": {"okRUuj5i": [{"currencyCode": "tDPuhzwc", "currencyNamespace": "zUuKrGMm", "currencyType": "VIRTUAL", "discountAmount": 55, "discountExpireAt": "1998-02-11T00:00:00Z", "discountPercentage": 51, "discountPurchaseAt": "1994-10-26T00:00:00Z", "discountedPrice": 65, "expireAt": "1999-02-03T00:00:00Z", "price": 77, "purchaseAt": "1971-07-28T00:00:00Z", "trialPrice": 5}, {"currencyCode": "q2yQtDKj", "currencyNamespace": "u7kl4RAV", "currencyType": "VIRTUAL", "discountAmount": 99, "discountExpireAt": "1993-12-19T00:00:00Z", "discountPercentage": 24, "discountPurchaseAt": "1984-07-12T00:00:00Z", "discountedPrice": 94, "expireAt": "1986-12-02T00:00:00Z", "price": 40, "purchaseAt": "1973-07-29T00:00:00Z", "trialPrice": 57}, {"currencyCode": "tPZpm57q", "currencyNamespace": "GqqCTCrA", "currencyType": "REAL", "discountAmount": 17, "discountExpireAt": "1980-03-04T00:00:00Z", "discountPercentage": 49, "discountPurchaseAt": "1974-07-15T00:00:00Z", "discountedPrice": 61, "expireAt": "1995-02-08T00:00:00Z", "price": 49, "purchaseAt": "1983-08-11T00:00:00Z", "trialPrice": 23}], "YeF71Cs7": [{"currencyCode": "TnqkKIZo", "currencyNamespace": "pCvYQtdk", "currencyType": "VIRTUAL", "discountAmount": 11, "discountExpireAt": "1993-05-07T00:00:00Z", "discountPercentage": 11, "discountPurchaseAt": "1988-02-07T00:00:00Z", "discountedPrice": 56, "expireAt": "1997-08-21T00:00:00Z", "price": 9, "purchaseAt": "1974-01-15T00:00:00Z", "trialPrice": 20}, {"currencyCode": "MxiWY2KK", "currencyNamespace": "xZU4LWtX", "currencyType": "VIRTUAL", "discountAmount": 31, "discountExpireAt": "1991-05-24T00:00:00Z", "discountPercentage": 53, "discountPurchaseAt": "1985-05-26T00:00:00Z", "discountedPrice": 77, "expireAt": "1998-12-28T00:00:00Z", "price": 74, "purchaseAt": "1997-09-15T00:00:00Z", "trialPrice": 52}, {"currencyCode": "ZZ7zmtAX", "currencyNamespace": "GfKvhL3K", "currencyType": "VIRTUAL", "discountAmount": 98, "discountExpireAt": "1971-06-30T00:00:00Z", "discountPercentage": 37, "discountPurchaseAt": "1995-10-29T00:00:00Z", "discountedPrice": 72, "expireAt": "1989-11-17T00:00:00Z", "price": 82, "purchaseAt": "1971-01-07T00:00:00Z", "trialPrice": 71}], "IbsJnLP2": [{"currencyCode": "EuOb72oQ", "currencyNamespace": "LezjIj0B", "currencyType": "REAL", "discountAmount": 20, "discountExpireAt": "1973-06-12T00:00:00Z", "discountPercentage": 26, "discountPurchaseAt": "1975-02-12T00:00:00Z", "discountedPrice": 91, "expireAt": "1987-05-09T00:00:00Z", "price": 10, "purchaseAt": "1975-04-29T00:00:00Z", "trialPrice": 92}, {"currencyCode": "FFxBrmEJ", "currencyNamespace": "hYuImM0G", "currencyType": "VIRTUAL", "discountAmount": 36, "discountExpireAt": "1984-01-02T00:00:00Z", "discountPercentage": 14, "discountPurchaseAt": "1971-08-07T00:00:00Z", "discountedPrice": 10, "expireAt": "1981-09-28T00:00:00Z", "price": 97, "purchaseAt": "1991-11-26T00:00:00Z", "trialPrice": 25}, {"currencyCode": "pk2HaN8b", "currencyNamespace": "q1ImHIdp", "currencyType": "REAL", "discountAmount": 89, "discountExpireAt": "1996-09-10T00:00:00Z", "discountPercentage": 41, "discountPurchaseAt": "1988-12-13T00:00:00Z", "discountedPrice": 64, "expireAt": "1984-01-29T00:00:00Z", "price": 94, "purchaseAt": "1979-10-27T00:00:00Z", "trialPrice": 19}]}}, {"itemIdentities": ["gfVOskvS", "cGnoSr7V", "FLiZJnPE"], "itemIdentityType": "ITEM_ID", "regionData": {"AaR1cTHW": [{"currencyCode": "c72lwBaK", "currencyNamespace": "djCNnO5N", "currencyType": "REAL", "discountAmount": 29, "discountExpireAt": "1994-04-29T00:00:00Z", "discountPercentage": 66, "discountPurchaseAt": "1973-11-05T00:00:00Z", "discountedPrice": 83, "expireAt": "1979-10-17T00:00:00Z", "price": 26, "purchaseAt": "1971-07-08T00:00:00Z", "trialPrice": 26}, {"currencyCode": "P5AWGCad", "currencyNamespace": "mlKJuZ92", "currencyType": "VIRTUAL", "discountAmount": 36, "discountExpireAt": "1984-03-16T00:00:00Z", "discountPercentage": 14, "discountPurchaseAt": "1983-02-13T00:00:00Z", "discountedPrice": 81, "expireAt": "1998-05-23T00:00:00Z", "price": 64, "purchaseAt": "1971-05-19T00:00:00Z", "trialPrice": 92}, {"currencyCode": "1Sl5zATh", "currencyNamespace": "8XJwgkE7", "currencyType": "REAL", "discountAmount": 49, "discountExpireAt": "1975-04-04T00:00:00Z", "discountPercentage": 93, "discountPurchaseAt": "1979-03-26T00:00:00Z", "discountedPrice": 53, "expireAt": "1972-01-25T00:00:00Z", "price": 81, "purchaseAt": "1980-03-06T00:00:00Z", "trialPrice": 99}], "VRCnlEA8": [{"currencyCode": "e9uyDnPh", "currencyNamespace": "FLcK4wZM", "currencyType": "VIRTUAL", "discountAmount": 81, "discountExpireAt": "1977-06-08T00:00:00Z", "discountPercentage": 28, "discountPurchaseAt": "1987-05-01T00:00:00Z", "discountedPrice": 73, "expireAt": "1983-01-23T00:00:00Z", "price": 1, "purchaseAt": "1973-08-16T00:00:00Z", "trialPrice": 50}, {"currencyCode": "5RzoaJRn", "currencyNamespace": "YxJKMrWd", "currencyType": "VIRTUAL", "discountAmount": 50, "discountExpireAt": "1997-04-21T00:00:00Z", "discountPercentage": 82, "discountPurchaseAt": "1992-11-21T00:00:00Z", "discountedPrice": 69, "expireAt": "1988-06-26T00:00:00Z", "price": 63, "purchaseAt": "1980-10-02T00:00:00Z", "trialPrice": 91}, {"currencyCode": "MuvjVIJi", "currencyNamespace": "LvNidSSo", "currencyType": "REAL", "discountAmount": 20, "discountExpireAt": "1996-02-29T00:00:00Z", "discountPercentage": 80, "discountPurchaseAt": "1972-11-02T00:00:00Z", "discountedPrice": 45, "expireAt": "1996-07-23T00:00:00Z", "price": 93, "purchaseAt": "1973-12-22T00:00:00Z", "trialPrice": 18}], "jnyDqmmO": [{"currencyCode": "HbDQxwIR", "currencyNamespace": "di8DV8GV", "currencyType": "REAL", "discountAmount": 21, "discountExpireAt": "1982-05-22T00:00:00Z", "discountPercentage": 85, "discountPurchaseAt": "1997-06-14T00:00:00Z", "discountedPrice": 78, "expireAt": "1996-01-28T00:00:00Z", "price": 83, "purchaseAt": "1973-07-13T00:00:00Z", "trialPrice": 87}, {"currencyCode": "FyN5Dwo0", "currencyNamespace": "u2sPopmF", "currencyType": "REAL", "discountAmount": 49, "discountExpireAt": "1995-02-07T00:00:00Z", "discountPercentage": 26, "discountPurchaseAt": "1981-03-08T00:00:00Z", "discountedPrice": 74, "expireAt": "1992-11-05T00:00:00Z", "price": 67, "purchaseAt": "1974-07-30T00:00:00Z", "trialPrice": 57}, {"currencyCode": "XEm9seuA", "currencyNamespace": "VunQ9jRz", "currencyType": "VIRTUAL", "discountAmount": 73, "discountExpireAt": "1995-09-21T00:00:00Z", "discountPercentage": 69, "discountPurchaseAt": "1995-10-29T00:00:00Z", "discountedPrice": 66, "expireAt": "1998-09-13T00:00:00Z", "price": 59, "purchaseAt": "1992-07-22T00:00:00Z", "trialPrice": 41}]}}, {"itemIdentities": ["6kRd0uGi", "qTI4hHgL", "eLF84sLF"], "itemIdentityType": "ITEM_SKU", "regionData": {"BAfZSyiQ": [{"currencyCode": "FxIpgnTI", "currencyNamespace": "m42kIB2y", "currencyType": "VIRTUAL", "discountAmount": 57, "discountExpireAt": "1978-11-10T00:00:00Z", "discountPercentage": 61, "discountPurchaseAt": "1978-02-13T00:00:00Z", "discountedPrice": 17, "expireAt": "1993-06-28T00:00:00Z", "price": 75, "purchaseAt": "1979-05-16T00:00:00Z", "trialPrice": 19}, {"currencyCode": "f7BedwWr", "currencyNamespace": "ahGv6PDo", "currencyType": "VIRTUAL", "discountAmount": 64, "discountExpireAt": "1981-09-02T00:00:00Z", "discountPercentage": 17, "discountPurchaseAt": "1977-04-05T00:00:00Z", "discountedPrice": 65, "expireAt": "1973-03-28T00:00:00Z", "price": 3, "purchaseAt": "1975-10-10T00:00:00Z", "trialPrice": 14}, {"currencyCode": "te1o9fu4", "currencyNamespace": "YbJjnz1D", "currencyType": "REAL", "discountAmount": 47, "discountExpireAt": "1984-09-04T00:00:00Z", "discountPercentage": 30, "discountPurchaseAt": "1977-04-16T00:00:00Z", "discountedPrice": 32, "expireAt": "1995-03-25T00:00:00Z", "price": 77, "purchaseAt": "1985-05-15T00:00:00Z", "trialPrice": 84}], "FghvJ8x3": [{"currencyCode": "Z5MgXZnQ", "currencyNamespace": "ITA2OqZx", "currencyType": "REAL", "discountAmount": 79, "discountExpireAt": "1982-12-27T00:00:00Z", "discountPercentage": 35, "discountPurchaseAt": "1989-02-19T00:00:00Z", "discountedPrice": 3, "expireAt": "1986-03-18T00:00:00Z", "price": 12, "purchaseAt": "1990-12-25T00:00:00Z", "trialPrice": 20}, {"currencyCode": "ypptb32J", "currencyNamespace": "hNV1eogh", "currencyType": "VIRTUAL", "discountAmount": 91, "discountExpireAt": "1988-10-17T00:00:00Z", "discountPercentage": 97, "discountPurchaseAt": "1978-07-28T00:00:00Z", "discountedPrice": 3, "expireAt": "1975-11-25T00:00:00Z", "price": 7, "purchaseAt": "1995-06-28T00:00:00Z", "trialPrice": 69}, {"currencyCode": "rEotBXAh", "currencyNamespace": "z0B0BLBe", "currencyType": "REAL", "discountAmount": 60, "discountExpireAt": "1987-12-29T00:00:00Z", "discountPercentage": 35, "discountPurchaseAt": "1997-12-24T00:00:00Z", "discountedPrice": 15, "expireAt": "1971-01-09T00:00:00Z", "price": 96, "purchaseAt": "1981-02-22T00:00:00Z", "trialPrice": 78}], "EMxqazCu": [{"currencyCode": "8X70Sxlt", "currencyNamespace": "mNGbiZSA", "currencyType": "VIRTUAL", "discountAmount": 81, "discountExpireAt": "1990-07-17T00:00:00Z", "discountPercentage": 83, "discountPurchaseAt": "1989-05-20T00:00:00Z", "discountedPrice": 99, "expireAt": "1980-08-04T00:00:00Z", "price": 97, "purchaseAt": "1991-04-04T00:00:00Z", "trialPrice": 38}, {"currencyCode": "UjYgvCLM", "currencyNamespace": "rjGGZamE", "currencyType": "VIRTUAL", "discountAmount": 46, "discountExpireAt": "1989-10-05T00:00:00Z", "discountPercentage": 20, "discountPurchaseAt": "1974-07-06T00:00:00Z", "discountedPrice": 83, "expireAt": "1978-10-06T00:00:00Z", "price": 72, "purchaseAt": "1999-02-11T00:00:00Z", "trialPrice": 81}, {"currencyCode": "ZHuCkgiC", "currencyNamespace": "ke6oDOQS", "currencyType": "VIRTUAL", "discountAmount": 35, "discountExpireAt": "1988-08-16T00:00:00Z", "discountPercentage": 80, "discountPurchaseAt": "1992-10-24T00:00:00Z", "discountedPrice": 74, "expireAt": "1993-10-29T00:00:00Z", "price": 13, "purchaseAt": "1981-12-28T00:00:00Z", "trialPrice": 53}]}}]}' \
    > test.out 2>&1
eval_tap $? 118 'BulkUpdateRegionData' test.out

#- 119 SearchItems
./ng net.accelbyte.sdk.cli.Main platform searchItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemType 'SUBSCRIPTION' \
    --limit '79' \
    --offset '0' \
    --sortBy 'cQzd8T5p' \
    --storeId '6XZOGGF8' \
    --keyword 'EMk2XSJI' \
    --language 'BqhLcX6q' \
    > test.out 2>&1
eval_tap $? 119 'SearchItems' test.out

#- 120 QueryUncategorizedItems
./ng net.accelbyte.sdk.cli.Main platform queryUncategorizedItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --limit '11' \
    --offset '31' \
    --sortBy 'createdAt:desc,displayOrder' \
    --storeId 'WzEk87q5' \
    > test.out 2>&1
eval_tap $? 120 'QueryUncategorizedItems' test.out

#- 121 GetItem
./ng net.accelbyte.sdk.cli.Main platform getItem \
    --itemId 'FR1pfVGr' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'j7IP2NoV' \
    > test.out 2>&1
eval_tap $? 121 'GetItem' test.out

#- 122 UpdateItem
./ng net.accelbyte.sdk.cli.Main platform updateItem \
    --itemId 'g8JbT9Bm' \
    --namespace "$AB_NAMESPACE" \
    --storeId '08ahtZWX' \
    --body '{"appId": "Zn0Snbuy", "appType": "DEMO", "baseAppId": "tosF3YRo", "boothName": "r3kvpHNc", "categoryPath": "qCWozO0d", "clazz": "AuWdO0v5", "displayOrder": 69, "entitlementType": "DURABLE", "ext": {"WuONcgdI": {}, "UojLKryA": {}, "3kxFcEWL": {}}, "features": ["Vaozbsmj", "SXsHsIu1", "qBXy2ihZ"], "flexible": false, "images": [{"as": "5DggizvV", "caption": "afXT0RRp", "height": 80, "imageUrl": "76EzVBOk", "smallImageUrl": "AdWLIAUx", "width": 67}, {"as": "KNetkS33", "caption": "Fno41ntp", "height": 45, "imageUrl": "8S8Ol0AL", "smallImageUrl": "bgXMb0Ss", "width": 45}, {"as": "f8Fv33XD", "caption": "Y9aYMyy4", "height": 91, "imageUrl": "3Sz68dVf", "smallImageUrl": "hEg9nVsE", "width": 79}], "inventoryConfig": {"customAttributes": {"cB1U6LC1": {}, "BGBavG72": {}, "HLSIGeBp": {}}, "serverCustomAttributes": {"q6ZyBFdB": {}, "dqkRgScX": {}, "qWtCSSJB": {}}, "slotUsed": 37}, "itemIds": ["elLd5uBT", "HN6p5apK", "mHdazXcH"], "itemQty": {"arsMpS2k": 2, "a1z4kJiK": 80, "dt8OZfmG": 38}, "itemType": "COINS", "listable": false, "localizations": {"7F4n2F0w": {"description": "IP1qOxRx", "localExt": {"h0ifYsZa": {}, "Oqg2v5aF": {}, "H607tXQM": {}}, "longDescription": "yqFGCafx", "title": "btyugR1t"}, "iQkk6huQ": {"description": "Rvpyxhw8", "localExt": {"1rfkwF5Q": {}, "as3WF30k": {}, "YUXeouK9": {}}, "longDescription": "muxJPkBE", "title": "IE7Mb5ds"}, "mhnVp17X": {"description": "laoYINtf", "localExt": {"y5Wh3ZMy": {}, "5bzgaVZR": {}, "Tr0jWwCl": {}}, "longDescription": "gfTKw5g7", "title": "tLdnm2E3"}}, "lootBoxConfig": {"rewardCount": 98, "rewards": [{"lootBoxItems": [{"count": 76, "duration": 31, "endDate": "1977-11-26T00:00:00Z", "itemId": "1y8NHo06", "itemSku": "J1iYGN1g", "itemType": "GbOA5ptY"}, {"count": 42, "duration": 92, "endDate": "1983-12-31T00:00:00Z", "itemId": "UkLmJtw5", "itemSku": "Trwe3UKX", "itemType": "G1w2Zxa5"}, {"count": 88, "duration": 73, "endDate": "1999-09-24T00:00:00Z", "itemId": "WXC5LsGZ", "itemSku": "wkaL8ev2", "itemType": "FPEA6Idp"}], "name": "lpbL4k6I", "odds": 0.8589613948939672, "type": "REWARD", "weight": 65}, {"lootBoxItems": [{"count": 97, "duration": 18, "endDate": "1972-07-08T00:00:00Z", "itemId": "sfOCqPIU", "itemSku": "jhjhhChH", "itemType": "GkXPSGm0"}, {"count": 4, "duration": 90, "endDate": "1979-09-16T00:00:00Z", "itemId": "PZfTSs7A", "itemSku": "Sbnf9sls", "itemType": "2ySdIA42"}, {"count": 20, "duration": 62, "endDate": "1994-08-04T00:00:00Z", "itemId": "CInW0aSp", "itemSku": "73sSyypI", "itemType": "CfbG0mSz"}], "name": "mQxVZ8r6", "odds": 0.20638832285192732, "type": "REWARD", "weight": 60}, {"lootBoxItems": [{"count": 6, "duration": 30, "endDate": "1981-04-27T00:00:00Z", "itemId": "JfvWU6Ep", "itemSku": "fZGJ7xjf", "itemType": "IpYMzey4"}, {"count": 75, "duration": 68, "endDate": "1972-09-24T00:00:00Z", "itemId": "MYYJjvOc", "itemSku": "BpmN2elc", "itemType": "bG9mFAAP"}, {"count": 45, "duration": 64, "endDate": "1982-04-22T00:00:00Z", "itemId": "EBj8TgJI", "itemSku": "I9I3wQXa", "itemType": "2Wa2tW0a"}], "name": "zqypS9ot", "odds": 0.18646987308266938, "type": "PROBABILITY_GROUP", "weight": 82}], "rollFunction": "DEFAULT"}, "maxCount": 54, "maxCountPerUser": 96, "name": "eEdcALz7", "optionBoxConfig": {"boxItems": [{"count": 6, "duration": 39, "endDate": "1986-03-24T00:00:00Z", "itemId": "yaszaxi5", "itemSku": "vHCFcfyG", "itemType": "FHDfjDo5"}, {"count": 93, "duration": 90, "endDate": "1995-09-11T00:00:00Z", "itemId": "8vD3IupE", "itemSku": "N3nwSufA", "itemType": "fz9yCwTH"}, {"count": 10, "duration": 27, "endDate": "1985-07-15T00:00:00Z", "itemId": "nTaTLKi2", "itemSku": "OYbd1qVt", "itemType": "4xkOrWbQ"}]}, "purchasable": false, "recurring": {"cycle": "YEARLY", "fixedFreeDays": 66, "fixedTrialCycles": 46, "graceDays": 42}, "regionData": {"09zjJcNP": [{"currencyCode": "K9EITn29", "currencyNamespace": "PMWicCnC", "currencyType": "VIRTUAL", "discountAmount": 91, "discountExpireAt": "1987-06-21T00:00:00Z", "discountPercentage": 87, "discountPurchaseAt": "1981-11-03T00:00:00Z", "expireAt": "1986-02-24T00:00:00Z", "price": 83, "purchaseAt": "1974-07-28T00:00:00Z", "trialPrice": 73}, {"currencyCode": "oaumJsBo", "currencyNamespace": "hXKSY0rv", "currencyType": "REAL", "discountAmount": 95, "discountExpireAt": "1988-09-05T00:00:00Z", "discountPercentage": 2, "discountPurchaseAt": "1975-09-12T00:00:00Z", "expireAt": "1988-08-08T00:00:00Z", "price": 93, "purchaseAt": "1988-09-03T00:00:00Z", "trialPrice": 43}, {"currencyCode": "SrI25n0N", "currencyNamespace": "pfDJZpbR", "currencyType": "VIRTUAL", "discountAmount": 71, "discountExpireAt": "1971-05-10T00:00:00Z", "discountPercentage": 91, "discountPurchaseAt": "1997-06-04T00:00:00Z", "expireAt": "1985-02-20T00:00:00Z", "price": 40, "purchaseAt": "1983-05-04T00:00:00Z", "trialPrice": 15}], "GWnQnoBa": [{"currencyCode": "weUQB2XJ", "currencyNamespace": "y3k9KaxQ", "currencyType": "REAL", "discountAmount": 65, "discountExpireAt": "1983-11-20T00:00:00Z", "discountPercentage": 75, "discountPurchaseAt": "1995-06-30T00:00:00Z", "expireAt": "1975-08-17T00:00:00Z", "price": 61, "purchaseAt": "1972-03-07T00:00:00Z", "trialPrice": 52}, {"currencyCode": "yB0kbeXc", "currencyNamespace": "ck2wCJ1s", "currencyType": "VIRTUAL", "discountAmount": 13, "discountExpireAt": "1994-07-18T00:00:00Z", "discountPercentage": 20, "discountPurchaseAt": "1994-12-03T00:00:00Z", "expireAt": "1985-11-12T00:00:00Z", "price": 61, "purchaseAt": "1974-03-21T00:00:00Z", "trialPrice": 59}, {"currencyCode": "YsTetlSO", "currencyNamespace": "9H1cRSp2", "currencyType": "REAL", "discountAmount": 20, "discountExpireAt": "1983-10-30T00:00:00Z", "discountPercentage": 96, "discountPurchaseAt": "1989-10-10T00:00:00Z", "expireAt": "1991-03-03T00:00:00Z", "price": 73, "purchaseAt": "1978-08-10T00:00:00Z", "trialPrice": 96}], "kTPmWegF": [{"currencyCode": "9plE3LeV", "currencyNamespace": "0hxL66Tv", "currencyType": "REAL", "discountAmount": 96, "discountExpireAt": "1993-02-17T00:00:00Z", "discountPercentage": 28, "discountPurchaseAt": "1980-10-13T00:00:00Z", "expireAt": "1978-11-07T00:00:00Z", "price": 1, "purchaseAt": "1984-08-23T00:00:00Z", "trialPrice": 63}, {"currencyCode": "lKyf5lXv", "currencyNamespace": "wlRpkKBV", "currencyType": "VIRTUAL", "discountAmount": 70, "discountExpireAt": "1984-04-13T00:00:00Z", "discountPercentage": 49, "discountPurchaseAt": "1981-06-06T00:00:00Z", "expireAt": "1985-06-03T00:00:00Z", "price": 5, "purchaseAt": "1971-06-13T00:00:00Z", "trialPrice": 76}, {"currencyCode": "RqpdbwZg", "currencyNamespace": "GfeZ9IKq", "currencyType": "VIRTUAL", "discountAmount": 53, "discountExpireAt": "1985-07-19T00:00:00Z", "discountPercentage": 40, "discountPurchaseAt": "1977-07-19T00:00:00Z", "expireAt": "1998-04-05T00:00:00Z", "price": 73, "purchaseAt": "1972-11-22T00:00:00Z", "trialPrice": 80}]}, "saleConfig": {"currencyCode": "XL7Xx3es", "price": 22}, "seasonType": "TIER", "sectionExclusive": false, "sellable": true, "sku": "4Y3bINQ7", "stackable": false, "status": "INACTIVE", "tags": ["63NdzJqr", "uQZOerWl", "N41hYgxl"], "targetCurrencyCode": "HOU6TjAm", "targetNamespace": "m8ZJwbEg", "thumbnailUrl": "lgRKRt6n", "useCount": 54}' \
    > test.out 2>&1
eval_tap $? 122 'UpdateItem' test.out

#- 123 DeleteItem
./ng net.accelbyte.sdk.cli.Main platform deleteItem \
    --itemId 'bY3HWghZ' \
    --namespace "$AB_NAMESPACE" \
    --force  \
    --storeId 'VJosQsDd' \
    > test.out 2>&1
eval_tap $? 123 'DeleteItem' test.out

#- 124 AcquireItem
./ng net.accelbyte.sdk.cli.Main platform acquireItem \
    --itemId 'I8box9nn' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 100, "orderNo": "dD3LnAad"}' \
    > test.out 2>&1
eval_tap $? 124 'AcquireItem' test.out

#- 125 GetApp
./ng net.accelbyte.sdk.cli.Main platform getApp \
    --itemId 'iy8DFUbI' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'jZ1V75hO' \
    > test.out 2>&1
eval_tap $? 125 'GetApp' test.out

#- 126 UpdateApp
./ng net.accelbyte.sdk.cli.Main platform updateApp \
    --itemId 'ielDDXdx' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'cEB6RxWH' \
    --body '{"carousel": [{"alt": "vnZKb0So", "previewUrl": "WgENtuc6", "thumbnailUrl": "FseTlrjy", "type": "video", "url": "aiDF4sMa", "videoSource": "generic"}, {"alt": "sOHT1rFB", "previewUrl": "trjdtR9K", "thumbnailUrl": "HmrgopE1", "type": "image", "url": "7RSWxToN", "videoSource": "youtube"}, {"alt": "vnRk0oB0", "previewUrl": "O4Y2Sv5y", "thumbnailUrl": "wEGwWQQV", "type": "video", "url": "0SVPRhN7", "videoSource": "vimeo"}], "developer": "DqBdYSqM", "forumUrl": "HIxsLksG", "genres": ["Casual", "MassivelyMultiplayer", "Strategy"], "localizations": {"dC58UWxY": {"announcement": "OPL6WPKV", "slogan": "s3LFfC0D"}, "sOyydh8G": {"announcement": "bQ05p6N0", "slogan": "P1Rrz84L"}, "kINlaSOb": {"announcement": "MzGcRfFC", "slogan": "t7qPc7FP"}}, "platformRequirements": {"HIqWVa8s": [{"additionals": "hUX2y9Qw", "directXVersion": "kT0lGced", "diskSpace": "JXdMNgE2", "graphics": "yObzG5KX", "label": "QRov5EBU", "osVersion": "XCvDrbGA", "processor": "8Y6bqmZ5", "ram": "hU7L89kg", "soundCard": "yNb8wzTX"}, {"additionals": "b21qtHag", "directXVersion": "DntzIgOB", "diskSpace": "uene67Gd", "graphics": "uUFQLRQc", "label": "jyc2QBfL", "osVersion": "UgY8KtwT", "processor": "RGi8DZb2", "ram": "24dUVMzx", "soundCard": "AGVL3s20"}, {"additionals": "84vcpznL", "directXVersion": "g033QjQ3", "diskSpace": "s8nQlOtd", "graphics": "odnTJYd4", "label": "GJnYGTaw", "osVersion": "u7Xceo0S", "processor": "UhI59V9b", "ram": "ItQpVngK", "soundCard": "BK1pgglA"}], "SSMdPx9g": [{"additionals": "naIo9aY1", "directXVersion": "6g7TNzB7", "diskSpace": "5MmxRYdl", "graphics": "JBp4e9NH", "label": "0FgPBuIg", "osVersion": "VAScdeI9", "processor": "6uQdcgFa", "ram": "dpvnVHFo", "soundCard": "u8Fsvz0F"}, {"additionals": "97OiM0EX", "directXVersion": "C93Pl4Da", "diskSpace": "Y8SXJODf", "graphics": "GCDdoBPf", "label": "DA7aAfBn", "osVersion": "IAzSkcSK", "processor": "x8cPIQfU", "ram": "F5LCRSjF", "soundCard": "D0gd27Io"}, {"additionals": "V6LXE58o", "directXVersion": "jMLltYU7", "diskSpace": "8mjiLwib", "graphics": "PCybIqsu", "label": "CykoI18O", "osVersion": "OI5e9LSe", "processor": "BTqwYBhi", "ram": "0PJMTkOW", "soundCard": "DA1VRk9c"}], "6D48dPed": [{"additionals": "hNsM5n2S", "directXVersion": "bSwkGVUV", "diskSpace": "jANe77PI", "graphics": "dLrnVW08", "label": "QPqaBCQi", "osVersion": "11EOyITo", "processor": "wY4IzoPV", "ram": "J2aOdJLc", "soundCard": "tCz1nI2P"}, {"additionals": "exJqLnl1", "directXVersion": "cjaDN0dq", "diskSpace": "tVWQzv5f", "graphics": "umK0pFI9", "label": "erS07wuA", "osVersion": "6isPe8Td", "processor": "jtebieC7", "ram": "CHTZhAJU", "soundCard": "avDSx3wB"}, {"additionals": "ONsT0xu2", "directXVersion": "5otWaeHM", "diskSpace": "Q1OfwUpl", "graphics": "OPwZw8rf", "label": "tkaHMgRT", "osVersion": "cv02uQyt", "processor": "7QoSfvTl", "ram": "3K2WjLoH", "soundCard": "yHRp4q4Y"}]}, "platforms": ["Windows", "IOS", "Windows"], "players": ["LocalCoop", "LocalCoop", "LocalCoop"], "primaryGenre": "FreeToPlay", "publisher": "mBObne2Q", "releaseDate": "1984-09-26T00:00:00Z", "websiteUrl": "sQTq7AqE"}' \
    > test.out 2>&1
eval_tap $? 126 'UpdateApp' test.out

#- 127 DisableItem
./ng net.accelbyte.sdk.cli.Main platform disableItem \
    --itemId '7saIzGz6' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'hkvNnnZd' \
    > test.out 2>&1
eval_tap $? 127 'DisableItem' test.out

#- 128 GetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform getItemDynamicData \
    --itemId 'B8MhUkRN' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 128 'GetItemDynamicData' test.out

#- 129 EnableItem
./ng net.accelbyte.sdk.cli.Main platform enableItem \
    --itemId 'Acx0PjIc' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'U2VNsfzi' \
    > test.out 2>&1
eval_tap $? 129 'EnableItem' test.out

#- 130 FeatureItem
./ng net.accelbyte.sdk.cli.Main platform featureItem \
    --feature 'utYCjIzA' \
    --itemId 'g6Y2fyy7' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'JDgnLJye' \
    > test.out 2>&1
eval_tap $? 130 'FeatureItem' test.out

#- 131 DefeatureItem
./ng net.accelbyte.sdk.cli.Main platform defeatureItem \
    --feature 'pdVfCjaW' \
    --itemId 'ftU3nEVM' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'm6GwomBp' \
    > test.out 2>&1
eval_tap $? 131 'DefeatureItem' test.out

#- 132 GetLocaleItem
./ng net.accelbyte.sdk.cli.Main platform getLocaleItem \
    --itemId 'TOOV3Nsk' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'UU6dBxcz' \
    --populateBundle  \
    --region 'mcTgIf4B' \
    --storeId 'h81mTd7U' \
    > test.out 2>&1
eval_tap $? 132 'GetLocaleItem' test.out

#- 133 UpdateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform updateItemPurchaseCondition \
    --itemId 'dzdlbry9' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'usm4flHd' \
    --body '{"purchaseCondition": {"conditionGroups": [{"operator": "and", "predicates": [{"anyOf": 53, "comparison": "isGreaterThanOrEqual", "name": "CMkKbhDJ", "predicateType": "EntitlementPredicate", "value": "N5OU3LBG", "values": ["tgt2jc5E", "k7W1r8mO", "s7NxrJUR"]}, {"anyOf": 13, "comparison": "excludes", "name": "9CMd89a5", "predicateType": "SeasonTierPredicate", "value": "FLTT5kzt", "values": ["PmerYYjG", "xshNcJto", "Jyiar9kk"]}, {"anyOf": 9, "comparison": "isGreaterThanOrEqual", "name": "X0ifUoC3", "predicateType": "SeasonPassPredicate", "value": "A7WQbnqU", "values": ["wYPI81KI", "XUejBD4z", "ClMfTXup"]}]}, {"operator": "and", "predicates": [{"anyOf": 31, "comparison": "isLessThanOrEqual", "name": "ZXCE9xTL", "predicateType": "SeasonPassPredicate", "value": "jg9c27F7", "values": ["P12p3fAy", "EG5INZe0", "YKHJcDTP"]}, {"anyOf": 81, "comparison": "isLessThanOrEqual", "name": "nK6RinkU", "predicateType": "EntitlementPredicate", "value": "RY1U6KPU", "values": ["rKmZPZXg", "oGEYlqAW", "ImpDpiSo"]}, {"anyOf": 47, "comparison": "excludes", "name": "gpQuMlcV", "predicateType": "SeasonPassPredicate", "value": "w1EhMLtf", "values": ["8TRqPAsz", "17KFopDg", "jqcHk5ow"]}]}, {"operator": "or", "predicates": [{"anyOf": 66, "comparison": "is", "name": "HhvqgMcB", "predicateType": "EntitlementPredicate", "value": "9bS86pjb", "values": ["2908DSOH", "UxmfKLHO", "NNdSsG2M"]}, {"anyOf": 73, "comparison": "includes", "name": "VT8ymu6O", "predicateType": "SeasonTierPredicate", "value": "wLBjR89b", "values": ["CFaLzHph", "2jDCBwzG", "wAx1oXrf"]}, {"anyOf": 9, "comparison": "isLessThanOrEqual", "name": "R5pK2cNf", "predicateType": "EntitlementPredicate", "value": "1VxePhBG", "values": ["1EgcGAe6", "5GWYbo0e", "l8uLKtzL"]}]}]}}' \
    > test.out 2>&1
eval_tap $? 133 'UpdateItemPurchaseCondition' test.out

#- 134 ReturnItem
./ng net.accelbyte.sdk.cli.Main platform returnItem \
    --itemId 'yUXXfYSv' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "LuHAq8ua"}' \
    > test.out 2>&1
eval_tap $? 134 'ReturnItem' test.out

#- 135 QueryKeyGroups
./ng net.accelbyte.sdk.cli.Main platform queryKeyGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '74' \
    --name 'BBzDF3Iw' \
    --offset '25' \
    --tag 'QWtblMS6' \
    > test.out 2>&1
eval_tap $? 135 'QueryKeyGroups' test.out

#- 136 CreateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform createKeyGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "nitJjkyU", "name": "GZpoOz8P", "status": "ACTIVE", "tags": ["STDqp4S8", "drh8vOHc", "OgYHjmnu"]}' \
    > test.out 2>&1
eval_tap $? 136 'CreateKeyGroup' test.out

#- 137 GetKeyGroupByBoothName
eval_tap 0 137 'GetKeyGroupByBoothName # SKIP deprecated' test.out

#- 138 GetKeyGroup
./ng net.accelbyte.sdk.cli.Main platform getKeyGroup \
    --keyGroupId 'AlThSGL6' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 138 'GetKeyGroup' test.out

#- 139 UpdateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform updateKeyGroup \
    --keyGroupId 'YDb47qa5' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "at1x8jn5", "name": "5sGVszpV", "status": "INACTIVE", "tags": ["BANh5GEF", "jTeIfUoE", "m3MhWWwT"]}' \
    > test.out 2>&1
eval_tap $? 139 'UpdateKeyGroup' test.out

#- 140 GetKeyGroupDynamic
./ng net.accelbyte.sdk.cli.Main platform getKeyGroupDynamic \
    --keyGroupId 'yLRC0MQ3' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 140 'GetKeyGroupDynamic' test.out

#- 141 ListKeys
./ng net.accelbyte.sdk.cli.Main platform listKeys \
    --keyGroupId 'Xr7i652j' \
    --namespace "$AB_NAMESPACE" \
    --limit '58' \
    --offset '16' \
    --status 'ACTIVE' \
    > test.out 2>&1
eval_tap $? 141 'ListKeys' test.out

#- 142 UploadKeys
./ng net.accelbyte.sdk.cli.Main platform uploadKeys \
    --keyGroupId 'abFpEXii' \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 142 'UploadKeys' test.out

#- 143 QueryOrders
./ng net.accelbyte.sdk.cli.Main platform queryOrders \
    --namespace "$AB_NAMESPACE" \
    --endTime '6k2bqHeV' \
    --limit '36' \
    --offset '81' \
    --orderNos '9gNH12Bj,wWM776pg,Au56n1QU' \
    --sortBy 'vHDeBvzM' \
    --startTime 't8tHbPjS' \
    --status 'CHARGEBACK_REVERSED' \
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
    --orderNo '8CsjTJWQ' \
    > test.out 2>&1
eval_tap $? 145 'GetOrder' test.out

#- 146 RefundOrder
./ng net.accelbyte.sdk.cli.Main platform refundOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'bkmAiMcy' \
    --body '{"description": "EnQYpdLO"}' \
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
    --body '{"dryRun": true, "notifyUrl": "UkGfRLRJ", "privateKey": "zqGPnOWx"}' \
    > test.out 2>&1
eval_tap $? 148 'UpdatePaymentCallbackConfig' test.out

#- 149 GetPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentMerchantConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 149 'GetPaymentMerchantConfig' test.out

#- 150 UpdatePaymentDomainWhitelistConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentDomainWhitelistConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"domains": ["50L1B9Yr", "OR4ob1fq", "TIjQP8tW"]}' \
    > test.out 2>&1
eval_tap $? 150 'UpdatePaymentDomainWhitelistConfig' test.out

#- 151 QueryPaymentNotifications
./ng net.accelbyte.sdk.cli.Main platform queryPaymentNotifications \
    --namespace "$AB_NAMESPACE" \
    --endDate 'UYv9ATxA' \
    --externalId 'nWeuld6p' \
    --limit '70' \
    --notificationSource 'XSOLLA' \
    --notificationType 'vqtAhWEC' \
    --offset '22' \
    --paymentOrderNo 'PqHROVMM' \
    --startDate 'SaNRQFuz' \
    --status 'WARN' \
    > test.out 2>&1
eval_tap $? 151 'QueryPaymentNotifications' test.out

#- 152 QueryPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform queryPaymentOrders \
    --namespace "$AB_NAMESPACE" \
    --channel 'EXTERNAL' \
    --extTxId 'uedIs1NW' \
    --limit '34' \
    --offset '82' \
    --status 'CHARGED' \
    > test.out 2>&1
eval_tap $? 152 'QueryPaymentOrders' test.out

#- 153 CreatePaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform createPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --body '{"currencyCode": "JSVAGbQb", "currencyNamespace": "bpMUSoM8", "customParameters": {"S4UBlcX1": {}, "un9IQGMp": {}, "W4iqYg59": {}}, "description": "88PhXnpp", "extOrderNo": "eqPbCKlm", "extUserId": "ibSZ7T2d", "itemType": "APP", "language": "vYvr_724", "metadata": {"IFA87k10": "kFUmbgjz", "dnxfQXZB": "xkPMb6Y5", "lscoq4wP": "IXRwIMUu"}, "notifyUrl": "WzRJqmLo", "omitNotification": true, "platform": "O8C2XK5H", "price": 87, "recurringPaymentOrderNo": "29i3iYmq", "region": "yEr8HhKb", "returnUrl": "ziLFGoWE", "sandbox": false, "sku": "NIiZeRHH", "subscriptionId": "lsauFXKw", "targetNamespace": "4GQoYvWK", "targetUserId": "RR639Z9y", "title": "9hcTpKKu"}' \
    > test.out 2>&1
eval_tap $? 153 'CreatePaymentOrderByDedicated' test.out

#- 154 ListExtOrderNoByExtTxId
./ng net.accelbyte.sdk.cli.Main platform listExtOrderNoByExtTxId \
    --namespace "$AB_NAMESPACE" \
    --extTxId 'FfrvScRg' \
    > test.out 2>&1
eval_tap $? 154 'ListExtOrderNoByExtTxId' test.out

#- 155 GetPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'BLAXreao' \
    > test.out 2>&1
eval_tap $? 155 'GetPaymentOrder' test.out

#- 156 ChargePaymentOrder
./ng net.accelbyte.sdk.cli.Main platform chargePaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '1ajHFoL5' \
    --body '{"extTxId": "I0AJL1PA", "paymentMethod": "sVrNLleT", "paymentProvider": "PAYPAL"}' \
    > test.out 2>&1
eval_tap $? 156 'ChargePaymentOrder' test.out

#- 157 RefundPaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform refundPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'p3CeYyEo' \
    --body '{"description": "kTou7F8L"}' \
    > test.out 2>&1
eval_tap $? 157 'RefundPaymentOrderByDedicated' test.out

#- 158 SimulatePaymentOrderNotification
./ng net.accelbyte.sdk.cli.Main platform simulatePaymentOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '0Bdzkluy' \
    --body '{"amount": 79, "currencyCode": "MCBY0y0a", "notifyType": "REFUND", "paymentProvider": "WALLET", "salesTax": 16, "vat": 54}' \
    > test.out 2>&1
eval_tap $? 158 'SimulatePaymentOrderNotification' test.out

#- 159 GetPaymentOrderChargeStatus
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrderChargeStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'aDOucyvI' \
    > test.out 2>&1
eval_tap $? 159 'GetPaymentOrderChargeStatus' test.out

#- 160 GetPsnEntitlementOwnership
./ng net.accelbyte.sdk.cli.Main platform getPsnEntitlementOwnership \
    --entitlementLabel 'YnYQNDMu' \
    --namespace "$AB_NAMESPACE" \
    --body '{"accessToken": "emdAA1y9", "serviceLabel": 73}' \
    > test.out 2>&1
eval_tap $? 160 'GetPsnEntitlementOwnership' test.out

#- 161 GetXboxEntitlementOwnership
./ng net.accelbyte.sdk.cli.Main platform getXboxEntitlementOwnership \
    --namespace "$AB_NAMESPACE" \
    --productSku 'b8mh567R' \
    --body '{"delegationToken": "iPFZdakH", "sandboxId": "lWW0nzDh"}' \
    > test.out 2>&1
eval_tap $? 161 'GetXboxEntitlementOwnership' test.out

#- 162 GetPlatformEntitlementConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformEntitlementConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Nintendo' \
    > test.out 2>&1
eval_tap $? 162 'GetPlatformEntitlementConfig' test.out

#- 163 UpdatePlatformEntitlementConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformEntitlementConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'IOS' \
    --body '{"allowedPlatformOrigins": ["Nintendo", "Steam", "Steam"]}' \
    > test.out 2>&1
eval_tap $? 163 'UpdatePlatformEntitlementConfig' test.out

#- 164 GetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Playstation' \
    > test.out 2>&1
eval_tap $? 164 'GetPlatformWalletConfig' test.out

#- 165 UpdatePlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Epic' \
    --body '{"allowedBalanceOrigins": ["Twitch", "Oculus", "Nintendo"]}' \
    > test.out 2>&1
eval_tap $? 165 'UpdatePlatformWalletConfig' test.out

#- 166 ResetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform resetPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Playstation' \
    > test.out 2>&1
eval_tap $? 166 'ResetPlatformWalletConfig' test.out

#- 167 GetRevocationConfig
./ng net.accelbyte.sdk.cli.Main platform getRevocationConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 167 'GetRevocationConfig' test.out

#- 168 UpdateRevocationConfig
./ng net.accelbyte.sdk.cli.Main platform updateRevocationConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"entitlement": {"consumable": {"enabled": false, "strategy": "REVOKE_OR_REPORT"}, "durable": {"enabled": false, "strategy": "CUSTOM"}}, "wallet": {"enabled": false, "strategy": "REVOKE_OR_REPORT"}}' \
    > test.out 2>&1
eval_tap $? 168 'UpdateRevocationConfig' test.out

#- 169 DeleteRevocationConfig
./ng net.accelbyte.sdk.cli.Main platform deleteRevocationConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 169 'DeleteRevocationConfig' test.out

#- 170 QueryRevocationHistories
./ng net.accelbyte.sdk.cli.Main platform queryRevocationHistories \
    --namespace "$AB_NAMESPACE" \
    --endTime 'uvHVGdzp' \
    --limit '73' \
    --offset '55' \
    --source 'IAP' \
    --startTime '18xyTAVt' \
    --status 'FAIL' \
    --transactionId 'j5difUPo' \
    --userId 'RCU9qWsF' \
    > test.out 2>&1
eval_tap $? 170 'QueryRevocationHistories' test.out

#- 171 GetRevocationPluginConfig
./ng net.accelbyte.sdk.cli.Main platform getRevocationPluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 171 'GetRevocationPluginConfig' test.out

#- 172 UpdateRevocationPluginConfig
./ng net.accelbyte.sdk.cli.Main platform updateRevocationPluginConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appConfig": {"appName": "EPGjcXdH"}, "customConfig": {"connectionType": "TLS", "grpcServerAddress": "N6nO5lKL"}, "extendType": "CUSTOM"}' \
    > test.out 2>&1
eval_tap $? 172 'UpdateRevocationPluginConfig' test.out

#- 173 DeleteRevocationPluginConfig
./ng net.accelbyte.sdk.cli.Main platform deleteRevocationPluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 173 'DeleteRevocationPluginConfig' test.out

#- 174 UploadRevocationPluginConfigCert
./ng net.accelbyte.sdk.cli.Main platform uploadRevocationPluginConfigCert \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 174 'UploadRevocationPluginConfigCert' test.out

#- 175 CreateReward
./ng net.accelbyte.sdk.cli.Main platform createReward \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "F4JVFtCp", "eventTopic": "Pb35Gg9y", "maxAwarded": 66, "maxAwardedPerUser": 86, "namespaceExpression": "JAiBdwI6", "rewardCode": "mLbgzTYJ", "rewardConditions": [{"condition": "hsnPnayR", "conditionName": "NVP3pt8Z", "eventName": "6501sL8X", "rewardItems": [{"duration": 84, "endDate": "1976-06-28T00:00:00Z", "identityType": "ITEM_ID", "itemId": "m8nDgFTe", "quantity": 65, "sku": "GfNIXKIj"}, {"duration": 43, "endDate": "1984-11-01T00:00:00Z", "identityType": "ITEM_ID", "itemId": "DHCqvrD5", "quantity": 52, "sku": "HD3e23Qf"}, {"duration": 61, "endDate": "1974-12-09T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "gZPJWAgd", "quantity": 16, "sku": "rFuZoZLn"}]}, {"condition": "WsW1pVSn", "conditionName": "6jpnEM4G", "eventName": "BfAGe5Qh", "rewardItems": [{"duration": 34, "endDate": "1984-02-16T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "tTCDQxQ0", "quantity": 15, "sku": "tpashWtT"}, {"duration": 40, "endDate": "1981-03-31T00:00:00Z", "identityType": "ITEM_ID", "itemId": "1YpyLlee", "quantity": 15, "sku": "McaybyLq"}, {"duration": 56, "endDate": "1975-10-03T00:00:00Z", "identityType": "ITEM_ID", "itemId": "r4XCfQzB", "quantity": 79, "sku": "klAk4UU9"}]}, {"condition": "k0mFbsQy", "conditionName": "ClV2vt6n", "eventName": "KowkpSB0", "rewardItems": [{"duration": 35, "endDate": "1986-02-21T00:00:00Z", "identityType": "ITEM_ID", "itemId": "yNGIX69u", "quantity": 98, "sku": "Wch71oj1"}, {"duration": 82, "endDate": "1976-05-27T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "PPFyv3mn", "quantity": 10, "sku": "wV5IgTBH"}, {"duration": 11, "endDate": "1993-10-18T00:00:00Z", "identityType": "ITEM_ID", "itemId": "GzgtMTvz", "quantity": 2, "sku": "c2iWj96f"}]}], "userIdExpression": "Ko9jk31f"}' \
    > test.out 2>&1
eval_tap $? 175 'CreateReward' test.out

#- 176 QueryRewards
./ng net.accelbyte.sdk.cli.Main platform queryRewards \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'A3iGkDrU' \
    --limit '90' \
    --offset '76' \
    --sortBy 'namespace:desc,namespace,rewardCode:desc' \
    > test.out 2>&1
eval_tap $? 176 'QueryRewards' test.out

#- 177 ExportRewards
./ng net.accelbyte.sdk.cli.Main platform exportRewards \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 177 'ExportRewards' test.out

#- 178 ImportRewards
./ng net.accelbyte.sdk.cli.Main platform importRewards \
    --namespace "$AB_NAMESPACE" \
    --replaceExisting  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 178 'ImportRewards' test.out

#- 179 GetReward
./ng net.accelbyte.sdk.cli.Main platform getReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'ZyKrzKgi' \
    > test.out 2>&1
eval_tap $? 179 'GetReward' test.out

#- 180 UpdateReward
./ng net.accelbyte.sdk.cli.Main platform updateReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId '61RWNaOK' \
    --body '{"description": "mCOwk4X4", "eventTopic": "waIpjoY3", "maxAwarded": 31, "maxAwardedPerUser": 99, "namespaceExpression": "qZrXCZxY", "rewardCode": "YtaeVpKz", "rewardConditions": [{"condition": "mYxO93SW", "conditionName": "0vc5BEdS", "eventName": "mHfPJZ2v", "rewardItems": [{"duration": 6, "endDate": "1975-03-18T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "lrSZKNrN", "quantity": 95, "sku": "lVJbMqoR"}, {"duration": 69, "endDate": "1984-04-04T00:00:00Z", "identityType": "ITEM_ID", "itemId": "TeeI1Trz", "quantity": 4, "sku": "RvtPc77w"}, {"duration": 38, "endDate": "1973-11-25T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "viTlhObU", "quantity": 52, "sku": "0joxmiel"}]}, {"condition": "p2utEq7I", "conditionName": "yVSPiGWE", "eventName": "eQEneC6k", "rewardItems": [{"duration": 72, "endDate": "1991-05-18T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "n0vLb6BQ", "quantity": 14, "sku": "iL8LGzE2"}, {"duration": 71, "endDate": "1999-07-07T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "nBcnsrKz", "quantity": 86, "sku": "I5B4Kr2l"}, {"duration": 3, "endDate": "1988-10-06T00:00:00Z", "identityType": "ITEM_ID", "itemId": "PdVqvSpZ", "quantity": 44, "sku": "G72WuUMB"}]}, {"condition": "UFd4VVJW", "conditionName": "4LcoLJ6l", "eventName": "881SDGx8", "rewardItems": [{"duration": 3, "endDate": "1980-04-08T00:00:00Z", "identityType": "ITEM_ID", "itemId": "kEmW64pv", "quantity": 17, "sku": "1bhZSH3e"}, {"duration": 32, "endDate": "1972-07-11T00:00:00Z", "identityType": "ITEM_ID", "itemId": "Qum7BcFL", "quantity": 63, "sku": "zAOfCm6h"}, {"duration": 60, "endDate": "1984-03-01T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "XHpIjnvd", "quantity": 61, "sku": "zJj8pcuO"}]}], "userIdExpression": "CESOeYpH"}' \
    > test.out 2>&1
eval_tap $? 180 'UpdateReward' test.out

#- 181 DeleteReward
./ng net.accelbyte.sdk.cli.Main platform deleteReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'EUBJU4Jl' \
    > test.out 2>&1
eval_tap $? 181 'DeleteReward' test.out

#- 182 CheckEventCondition
./ng net.accelbyte.sdk.cli.Main platform checkEventCondition \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'Ghk3CVIa' \
    --body '{"payload": {"2MXkpllM": {}, "50Mg6g1v": {}, "rueqJYn5": {}}}' \
    > test.out 2>&1
eval_tap $? 182 'CheckEventCondition' test.out

#- 183 DeleteRewardConditionRecord
./ng net.accelbyte.sdk.cli.Main platform deleteRewardConditionRecord \
    --namespace "$AB_NAMESPACE" \
    --rewardId '8iPZ2oNF' \
    --body '{"conditionName": "d3ducf6D", "userId": "3LRNQgpc"}' \
    > test.out 2>&1
eval_tap $? 183 'DeleteRewardConditionRecord' test.out

#- 184 QuerySections
./ng net.accelbyte.sdk.cli.Main platform querySections \
    --namespace "$AB_NAMESPACE" \
    --end 'dst8itpW' \
    --limit '60' \
    --offset '31' \
    --start 'wb4BeDPJ' \
    --storeId 'gAIHKoHu' \
    --viewId 'mxqUVsaZ' \
    > test.out 2>&1
eval_tap $? 184 'QuerySections' test.out

#- 185 CreateSection
./ng net.accelbyte.sdk.cli.Main platform createSection \
    --namespace "$AB_NAMESPACE" \
    --storeId '88nDfvmX' \
    --body '{"active": false, "displayOrder": 48, "endDate": "1997-10-06T00:00:00Z", "ext": {"2tvF5Dfg": {}, "7diaJIZo": {}, "aHFEC8Wn": {}}, "fixedPeriodRotationConfig": {"backfillType": "CUSTOM", "duration": 28, "itemCount": 84, "rule": "SEQUENCE"}, "items": [{"id": "y9Ou3nRX", "sku": "tvOONK3k"}, {"id": "aIKZ4jYn", "sku": "0u4LD0wQ"}, {"id": "eoTT4FsI", "sku": "9qkUzz0g"}], "localizations": {"oi5TBou5": {"description": "Nu6Iv6XY", "localExt": {"qXWF7Fr2": {}, "PMEjSxsp": {}, "iZoibYvJ": {}}, "longDescription": "tIZrlxKA", "title": "2Picg0Sa"}, "1b453VYO": {"description": "1e3zz1aX", "localExt": {"UZvQV5Ne": {}, "UkBaSwlH": {}, "Eum407DV": {}}, "longDescription": "yRv2henC", "title": "LMUHd52A"}, "tMEKWcyD": {"description": "eVQCYjzL", "localExt": {"eC0zrUsE": {}, "nBc54BTM": {}, "7Cdvf322": {}}, "longDescription": "Q4rfiYaI", "title": "LSdOoVSO"}}, "name": "IgPNfFa7", "rotationType": "FIXED_PERIOD", "startDate": "1976-11-23T00:00:00Z", "viewId": "x8Ar0WPq"}' \
    > test.out 2>&1
eval_tap $? 185 'CreateSection' test.out

#- 186 PurgeExpiredSection
./ng net.accelbyte.sdk.cli.Main platform purgeExpiredSection \
    --namespace "$AB_NAMESPACE" \
    --storeId 'BvI13dyI' \
    > test.out 2>&1
eval_tap $? 186 'PurgeExpiredSection' test.out

#- 187 GetSection
./ng net.accelbyte.sdk.cli.Main platform getSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'KEYPsYIU' \
    --storeId 'CxiNuKDd' \
    > test.out 2>&1
eval_tap $? 187 'GetSection' test.out

#- 188 UpdateSection
./ng net.accelbyte.sdk.cli.Main platform updateSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'lWvIFsdI' \
    --storeId 'jK7tdFUG' \
    --body '{"active": false, "displayOrder": 79, "endDate": "1988-12-20T00:00:00Z", "ext": {"nHZgM4zt": {}, "nX3CBEJ4": {}, "NbVyVWzk": {}}, "fixedPeriodRotationConfig": {"backfillType": "CUSTOM", "duration": 2, "itemCount": 78, "rule": "SEQUENCE"}, "items": [{"id": "i0nFD7i6", "sku": "rm0KZ6QP"}, {"id": "mBdxgT61", "sku": "ZXSbYUCS"}, {"id": "pPN6i6FG", "sku": "XYshZ9Zc"}], "localizations": {"KaBwD9hf": {"description": "B2Ewcal2", "localExt": {"AFxhAFbY": {}, "EK9eiIbE": {}, "MArDZzYJ": {}}, "longDescription": "X8K20OXc", "title": "0Hjb81u6"}, "14Ui4DeW": {"description": "WDx7N3La", "localExt": {"k2khBbZA": {}, "EJ4mH7lO": {}, "UYxfuFwC": {}}, "longDescription": "MSpFZGSC", "title": "K0N1Y9AK"}, "B3ThV6SZ": {"description": "6C0dSoUu", "localExt": {"ZLYODQF7": {}, "SgF1UmGT": {}, "ss01tP20": {}}, "longDescription": "SLTzkvLt", "title": "PfcYQr2O"}}, "name": "HMiUtyeX", "rotationType": "FIXED_PERIOD", "startDate": "1976-03-04T00:00:00Z", "viewId": "jsiYde3K"}' \
    > test.out 2>&1
eval_tap $? 188 'UpdateSection' test.out

#- 189 DeleteSection
./ng net.accelbyte.sdk.cli.Main platform deleteSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId '0VPNq8do' \
    --storeId 'v7s6T6Q5' \
    > test.out 2>&1
eval_tap $? 189 'DeleteSection' test.out

#- 190 ListStores
./ng net.accelbyte.sdk.cli.Main platform listStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 190 'ListStores' test.out

#- 191 CreateStore
./ng net.accelbyte.sdk.cli.Main platform createStore \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultLanguage": "CXFmj6LL", "defaultRegion": "PPdhVlJy", "description": "cthE4FJv", "supportedLanguages": ["1ykgwXE9", "7ofrKP3G", "ap2svwHB"], "supportedRegions": ["llFRPUvb", "zcvfMoKn", "JYOFjJdH"], "title": "9I5MLhno"}' \
    > test.out 2>&1
eval_tap $? 191 'CreateStore' test.out

#- 192 GetCatalogDefinition
./ng net.accelbyte.sdk.cli.Main platform getCatalogDefinition \
    --namespace "$AB_NAMESPACE" \
    --catalogType 'CATEGORY' \
    > test.out 2>&1
eval_tap $? 192 'GetCatalogDefinition' test.out

#- 193 DownloadCSVTemplates
./ng net.accelbyte.sdk.cli.Main platform downloadCSVTemplates \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 193 'DownloadCSVTemplates' test.out

#- 194 ExportStoreByCSV
./ng net.accelbyte.sdk.cli.Main platform exportStoreByCSV \
    --namespace "$AB_NAMESPACE" \
    --body '{"catalogType": "APP", "fieldsToBeIncluded": ["FZOpXUkh", "FkvW1fC8", "JE0WAoC5"], "idsToBeExported": ["6x165JVF", "frgQtF3S", "jMks9FS0"], "storeId": "6trmTymY"}' \
    > test.out 2>&1
eval_tap $? 194 'ExportStoreByCSV' test.out

#- 195 ImportStore
eval_tap 0 195 'ImportStore # SKIP deprecated' test.out

#- 196 GetPublishedStore
./ng net.accelbyte.sdk.cli.Main platform getPublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 196 'GetPublishedStore' test.out

#- 197 DeletePublishedStore
./ng net.accelbyte.sdk.cli.Main platform deletePublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 197 'DeletePublishedStore' test.out

#- 198 GetPublishedStoreBackup
./ng net.accelbyte.sdk.cli.Main platform getPublishedStoreBackup \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 198 'GetPublishedStoreBackup' test.out

#- 199 RollbackPublishedStore
./ng net.accelbyte.sdk.cli.Main platform rollbackPublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 199 'RollbackPublishedStore' test.out

#- 200 GetStore
./ng net.accelbyte.sdk.cli.Main platform getStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'LxxZFprD' \
    > test.out 2>&1
eval_tap $? 200 'GetStore' test.out

#- 201 UpdateStore
./ng net.accelbyte.sdk.cli.Main platform updateStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 's4JO3lhv' \
    --body '{"defaultLanguage": "Cn7lufZD", "defaultRegion": "eiP58KGI", "description": "0b9tZpAt", "supportedLanguages": ["58p9iRW8", "kHDsknWI", "jLcll6iI"], "supportedRegions": ["y4NfdcgP", "MYmzEQN6", "RZjI2gob"], "title": "sR550MuS"}' \
    > test.out 2>&1
eval_tap $? 201 'UpdateStore' test.out

#- 202 DeleteStore
./ng net.accelbyte.sdk.cli.Main platform deleteStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'gcOV2z4C' \
    > test.out 2>&1
eval_tap $? 202 'DeleteStore' test.out

#- 203 QueryChanges
./ng net.accelbyte.sdk.cli.Main platform queryChanges \
    --namespace "$AB_NAMESPACE" \
    --storeId 'jgfbL3iH' \
    --action 'DELETE' \
    --itemSku '41DD0dUq' \
    --itemType 'EXTENSION' \
    --limit '48' \
    --offset '62' \
    --selected  \
    --sortBy 'createdAt:desc,updatedAt:desc,createdAt' \
    --status 'UNPUBLISHED' \
    --type 'VIEW' \
    --updatedAtEnd 'vIFUr3Kb' \
    --updatedAtStart 'OF1zfYUh' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 203 'QueryChanges' test.out

#- 204 PublishAll
./ng net.accelbyte.sdk.cli.Main platform publishAll \
    --namespace "$AB_NAMESPACE" \
    --storeId 'MzSSA8eS' \
    > test.out 2>&1
eval_tap $? 204 'PublishAll' test.out

#- 205 PublishSelected
./ng net.accelbyte.sdk.cli.Main platform publishSelected \
    --namespace "$AB_NAMESPACE" \
    --storeId 'JsPOyplu' \
    > test.out 2>&1
eval_tap $? 205 'PublishSelected' test.out

#- 206 SelectAllRecords
./ng net.accelbyte.sdk.cli.Main platform selectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'n7NusaiQ' \
    > test.out 2>&1
eval_tap $? 206 'SelectAllRecords' test.out

#- 207 SelectAllRecordsByCriteria
./ng net.accelbyte.sdk.cli.Main platform selectAllRecordsByCriteria \
    --namespace "$AB_NAMESPACE" \
    --storeId 'lj1yOF5P' \
    --action 'UPDATE' \
    --itemSku 'lf16reUj' \
    --itemType 'MEDIA' \
    --selected  \
    --type 'CATEGORY' \
    --updatedAtEnd '6lEKFkAb' \
    --updatedAtStart 'nl9pb8Gv' \
    > test.out 2>&1
eval_tap $? 207 'SelectAllRecordsByCriteria' test.out

#- 208 GetStatistic
./ng net.accelbyte.sdk.cli.Main platform getStatistic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'hTh3VqKK' \
    --action 'UPDATE' \
    --itemSku 'P376h0OB' \
    --itemType 'LOOTBOX' \
    --type 'CATEGORY' \
    --updatedAtEnd 'EvpHnKoW' \
    --updatedAtStart 'ehHHFxlF' \
    > test.out 2>&1
eval_tap $? 208 'GetStatistic' test.out

#- 209 UnselectAllRecords
./ng net.accelbyte.sdk.cli.Main platform unselectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId '0tKN9EpA' \
    > test.out 2>&1
eval_tap $? 209 'UnselectAllRecords' test.out

#- 210 SelectRecord
./ng net.accelbyte.sdk.cli.Main platform selectRecord \
    --changeId 'HV4M2Bcv' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'FBwqeZkj' \
    > test.out 2>&1
eval_tap $? 210 'SelectRecord' test.out

#- 211 UnselectRecord
./ng net.accelbyte.sdk.cli.Main platform unselectRecord \
    --changeId 'zsm0PNK6' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'vVdEBhGy' \
    > test.out 2>&1
eval_tap $? 211 'UnselectRecord' test.out

#- 212 CloneStore
./ng net.accelbyte.sdk.cli.Main platform cloneStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'fNt1OKke' \
    --targetStoreId 'ecDdBM2R' \
    > test.out 2>&1
eval_tap $? 212 'CloneStore' test.out

#- 213 ExportStore
eval_tap 0 213 'ExportStore # SKIP deprecated' test.out

#- 214 QueryImportHistory
./ng net.accelbyte.sdk.cli.Main platform queryImportHistory \
    --namespace "$AB_NAMESPACE" \
    --storeId 'xnYFdTRn' \
    --end 'jAEu4QBA' \
    --limit '10' \
    --offset '84' \
    --sortBy 'l8fzUlEh' \
    --start 'ZGGD4Q6t' \
    --success  \
    > test.out 2>&1
eval_tap $? 214 'QueryImportHistory' test.out

#- 215 ImportStoreByCSV
./ng net.accelbyte.sdk.cli.Main platform importStoreByCSV \
    --namespace "$AB_NAMESPACE" \
    --storeId '2K41oJD1' \
    --category 'tmp.dat' \
    --display 'tmp.dat' \
    --item 'tmp.dat' \
    --notes 'M60Y8hlF' \
    --section 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 215 'ImportStoreByCSV' test.out

#- 216 QuerySubscriptions
./ng net.accelbyte.sdk.cli.Main platform querySubscriptions \
    --namespace "$AB_NAMESPACE" \
    --chargeStatus 'CHARGE_FAILED' \
    --itemId 'mnahgjXj' \
    --limit '95' \
    --offset '23' \
    --sku 'eHb6ALYC' \
    --status 'INIT' \
    --subscribedBy 'PLATFORM' \
    --userId '8WKEhavs' \
    > test.out 2>&1
eval_tap $? 216 'QuerySubscriptions' test.out

#- 217 RecurringChargeSubscription
./ng net.accelbyte.sdk.cli.Main platform recurringChargeSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '5yrFqdJw' \
    > test.out 2>&1
eval_tap $? 217 'RecurringChargeSubscription' test.out

#- 218 GetTicketDynamic
./ng net.accelbyte.sdk.cli.Main platform getTicketDynamic \
    --boothName 'BONfY9Xk' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 218 'GetTicketDynamic' test.out

#- 219 DecreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform decreaseTicketSale \
    --boothName 'xElUH3vN' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "J0JR8kZQ"}' \
    > test.out 2>&1
eval_tap $? 219 'DecreaseTicketSale' test.out

#- 220 GetTicketBoothID
./ng net.accelbyte.sdk.cli.Main platform getTicketBoothID \
    --boothName 'Y7Wc594y' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 220 'GetTicketBoothID' test.out

#- 221 IncreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform increaseTicketSale \
    --boothName 'rIyXzdXD' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 81, "orderNo": "c0DY47dL"}' \
    > test.out 2>&1
eval_tap $? 221 'IncreaseTicketSale' test.out

#- 222 Commit
./ng net.accelbyte.sdk.cli.Main platform commit \
    --namespace "$AB_NAMESPACE" \
    --body '{"actions": [{"operations": [{"creditPayload": {"balanceOrigin": "IOS", "count": 99, "currencyCode": "AWGOObaf", "expireAt": "1997-10-07T00:00:00Z"}, "debitPayload": {"count": 69, "currencyCode": "87oiSWgn", "walletPlatform": "GooglePlay"}, "fulFillItemPayload": {"count": 6, "entitlementCollectionId": "tHf7QblY", "entitlementOrigin": "Twitch", "itemIdentity": "JmzVmcnA", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 46, "entitlementId": "k02YZElh"}, "type": "DEBIT_WALLET"}, {"creditPayload": {"balanceOrigin": "GooglePlay", "count": 44, "currencyCode": "FDeqKrUq", "expireAt": "1993-06-19T00:00:00Z"}, "debitPayload": {"count": 29, "currencyCode": "qHFN4qnV", "walletPlatform": "Nintendo"}, "fulFillItemPayload": {"count": 75, "entitlementCollectionId": "f6NDJ8Gk", "entitlementOrigin": "Oculus", "itemIdentity": "TJ85lWa5", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 79, "entitlementId": "4KqSERzA"}, "type": "REVOKE_ENTITLEMENT"}, {"creditPayload": {"balanceOrigin": "Twitch", "count": 13, "currencyCode": "z16tfYrV", "expireAt": "1999-08-23T00:00:00Z"}, "debitPayload": {"count": 31, "currencyCode": "F30eHr0v", "walletPlatform": "Xbox"}, "fulFillItemPayload": {"count": 22, "entitlementCollectionId": "YsMYCRGE", "entitlementOrigin": "Twitch", "itemIdentity": "1UHocmMF", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 18, "entitlementId": "i0umPpOC"}, "type": "DEBIT_WALLET"}], "userId": "svCkxmgD"}, {"operations": [{"creditPayload": {"balanceOrigin": "Steam", "count": 24, "currencyCode": "gQvmZgzh", "expireAt": "1994-01-16T00:00:00Z"}, "debitPayload": {"count": 33, "currencyCode": "mlkCkWcx", "walletPlatform": "Nintendo"}, "fulFillItemPayload": {"count": 65, "entitlementCollectionId": "rJ8ETr8u", "entitlementOrigin": "Nintendo", "itemIdentity": "xREA3SGX", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 46, "entitlementId": "q1S9u5BN"}, "type": "FULFILL_ITEM"}, {"creditPayload": {"balanceOrigin": "GooglePlay", "count": 30, "currencyCode": "iAByUT3u", "expireAt": "1982-06-18T00:00:00Z"}, "debitPayload": {"count": 50, "currencyCode": "jszAEio1", "walletPlatform": "Nintendo"}, "fulFillItemPayload": {"count": 89, "entitlementCollectionId": "9Wyv45I5", "entitlementOrigin": "Steam", "itemIdentity": "o7rmnAyj", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 25, "entitlementId": "NXdxWOUZ"}, "type": "DEBIT_WALLET"}, {"creditPayload": {"balanceOrigin": "Steam", "count": 75, "currencyCode": "d38lPDxg", "expireAt": "1991-03-29T00:00:00Z"}, "debitPayload": {"count": 82, "currencyCode": "Cb3wSrgV", "walletPlatform": "GooglePlay"}, "fulFillItemPayload": {"count": 75, "entitlementCollectionId": "iha1cljB", "entitlementOrigin": "Nintendo", "itemIdentity": "TsDr2VwE", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 17, "entitlementId": "MQlqUCVb"}, "type": "DEBIT_WALLET"}], "userId": "JauJ0LaY"}, {"operations": [{"creditPayload": {"balanceOrigin": "Nintendo", "count": 30, "currencyCode": "nylYUnWr", "expireAt": "1976-02-27T00:00:00Z"}, "debitPayload": {"count": 80, "currencyCode": "YiglE5eu", "walletPlatform": "GooglePlay"}, "fulFillItemPayload": {"count": 93, "entitlementCollectionId": "FUJDfZYs", "entitlementOrigin": "IOS", "itemIdentity": "ssNt0WRI", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 63, "entitlementId": "q4nmIHtA"}, "type": "FULFILL_ITEM"}, {"creditPayload": {"balanceOrigin": "IOS", "count": 36, "currencyCode": "htVZC2qG", "expireAt": "1987-09-04T00:00:00Z"}, "debitPayload": {"count": 12, "currencyCode": "azNjJU5d", "walletPlatform": "Xbox"}, "fulFillItemPayload": {"count": 68, "entitlementCollectionId": "CV7bZV3w", "entitlementOrigin": "System", "itemIdentity": "zQisJkKl", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 81, "entitlementId": "qtYQfDrV"}, "type": "DEBIT_WALLET"}, {"creditPayload": {"balanceOrigin": "Epic", "count": 54, "currencyCode": "VIFociZB", "expireAt": "1997-03-15T00:00:00Z"}, "debitPayload": {"count": 99, "currencyCode": "WCXx4P7x", "walletPlatform": "Playstation"}, "fulFillItemPayload": {"count": 21, "entitlementCollectionId": "Wc6Q8itL", "entitlementOrigin": "Playstation", "itemIdentity": "qgN1VEKP", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 86, "entitlementId": "HOZxyXkH"}, "type": "DEBIT_WALLET"}], "userId": "c4JtZT5K"}], "metadata": {"a2FeugYm": {}, "GhbMo4wm": {}, "foZetd5T": {}}, "needPreCheck": true, "transactionId": "3tmAZmbb", "type": "Mq5aixVp"}' \
    > test.out 2>&1
eval_tap $? 222 'Commit' test.out

#- 223 GetTradeHistoryByCriteria
./ng net.accelbyte.sdk.cli.Main platform getTradeHistoryByCriteria \
    --namespace "$AB_NAMESPACE" \
    --limit '9' \
    --offset '84' \
    --status 'INIT' \
    --type 'aCNZ6NFI' \
    --userId 'LptuPICI' \
    > test.out 2>&1
eval_tap $? 223 'GetTradeHistoryByCriteria' test.out

#- 224 GetTradeHistoryByTransactionId
./ng net.accelbyte.sdk.cli.Main platform getTradeHistoryByTransactionId \
    --namespace "$AB_NAMESPACE" \
    --transactionId 'f524xulv' \
    > test.out 2>&1
eval_tap $? 224 'GetTradeHistoryByTransactionId' test.out

#- 225 UnlockSteamUserAchievement
./ng net.accelbyte.sdk.cli.Main platform unlockSteamUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'w0v0BltT' \
    --body '{"achievements": [{"id": "SZoADfYQ", "value": 2}, {"id": "FCfzef19", "value": 87}, {"id": "LNsMMx9z", "value": 38}], "steamUserId": "GeIL3qr0"}' \
    > test.out 2>&1
eval_tap $? 225 'UnlockSteamUserAchievement' test.out

#- 226 GetXblUserAchievements
./ng net.accelbyte.sdk.cli.Main platform getXblUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'JiXQ9zfy' \
    --xboxUserId 'ywRP8xFQ' \
    > test.out 2>&1
eval_tap $? 226 'GetXblUserAchievements' test.out

#- 227 UpdateXblUserAchievement
./ng net.accelbyte.sdk.cli.Main platform updateXblUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'UXD7mlih' \
    --body '{"achievements": [{"id": "BlbjGuni", "percentComplete": 47}, {"id": "q7o6UdLj", "percentComplete": 65}, {"id": "MR81fFUi", "percentComplete": 1}], "serviceConfigId": "XcKPEMeM", "titleId": "gMgi8FaD", "xboxUserId": "zajYTER1"}' \
    > test.out 2>&1
eval_tap $? 227 'UpdateXblUserAchievement' test.out

#- 228 AnonymizeCampaign
./ng net.accelbyte.sdk.cli.Main platform anonymizeCampaign \
    --namespace "$AB_NAMESPACE" \
    --userId '8xgp7R4l' \
    > test.out 2>&1
eval_tap $? 228 'AnonymizeCampaign' test.out

#- 229 AnonymizeEntitlement
./ng net.accelbyte.sdk.cli.Main platform anonymizeEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'rHuzxB8o' \
    > test.out 2>&1
eval_tap $? 229 'AnonymizeEntitlement' test.out

#- 230 AnonymizeFulfillment
./ng net.accelbyte.sdk.cli.Main platform anonymizeFulfillment \
    --namespace "$AB_NAMESPACE" \
    --userId 'DJtnmfON' \
    > test.out 2>&1
eval_tap $? 230 'AnonymizeFulfillment' test.out

#- 231 AnonymizeIntegration
./ng net.accelbyte.sdk.cli.Main platform anonymizeIntegration \
    --namespace "$AB_NAMESPACE" \
    --userId 'pe4v5GfT' \
    > test.out 2>&1
eval_tap $? 231 'AnonymizeIntegration' test.out

#- 232 AnonymizeOrder
./ng net.accelbyte.sdk.cli.Main platform anonymizeOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'HRlpW8FH' \
    > test.out 2>&1
eval_tap $? 232 'AnonymizeOrder' test.out

#- 233 AnonymizePayment
./ng net.accelbyte.sdk.cli.Main platform anonymizePayment \
    --namespace "$AB_NAMESPACE" \
    --userId '4pUgyDUJ' \
    > test.out 2>&1
eval_tap $? 233 'AnonymizePayment' test.out

#- 234 AnonymizeRevocation
./ng net.accelbyte.sdk.cli.Main platform anonymizeRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId '2VegK9tr' \
    > test.out 2>&1
eval_tap $? 234 'AnonymizeRevocation' test.out

#- 235 AnonymizeSubscription
./ng net.accelbyte.sdk.cli.Main platform anonymizeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'TvWdmQ5V' \
    > test.out 2>&1
eval_tap $? 235 'AnonymizeSubscription' test.out

#- 236 AnonymizeWallet
./ng net.accelbyte.sdk.cli.Main platform anonymizeWallet \
    --namespace "$AB_NAMESPACE" \
    --userId 'gsXFoYli' \
    > test.out 2>&1
eval_tap $? 236 'AnonymizeWallet' test.out

#- 237 GetUserDLCByPlatform
./ng net.accelbyte.sdk.cli.Main platform getUserDLCByPlatform \
    --namespace "$AB_NAMESPACE" \
    --userId 'wsgyBzNr' \
    --type 'EPICGAMES' \
    > test.out 2>&1
eval_tap $? 237 'GetUserDLCByPlatform' test.out

#- 238 GetUserDLC
./ng net.accelbyte.sdk.cli.Main platform getUserDLC \
    --namespace "$AB_NAMESPACE" \
    --userId '2qaMCRzy' \
    --type 'XBOX' \
    > test.out 2>&1
eval_tap $? 238 'GetUserDLC' test.out

#- 239 QueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'TypZhk2N' \
    --activeOnly  \
    --appType 'GAME' \
    --collectionId 'tmWMP1jW' \
    --entitlementClazz 'APP' \
    --entitlementName 'umTNpByF' \
    --features '5BEnZyo6,HDdH6frv,Abo0CJd5' \
    --fuzzyMatchName  \
    --itemId '4SixvkCq,AxMVi7pt,0C8NcXXg' \
    --limit '67' \
    --offset '3' \
    --origin 'Playstation' \
    > test.out 2>&1
eval_tap $? 239 'QueryUserEntitlements' test.out

#- 240 GrantUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform grantUserEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'heQ4NlBT' \
    --body '[{"collectionId": "0uQ0ovpz", "endDate": "1971-04-10T00:00:00Z", "grantedCode": "X7ivSWSO", "itemId": "XLpySOvV", "itemNamespace": "1OhvWtKG", "language": "uvu-Aoua", "origin": "Epic", "quantity": 77, "region": "cVVJQG4w", "source": "PROMOTION", "startDate": "1999-08-03T00:00:00Z", "storeId": "S5rcO0Xu"}, {"collectionId": "P5BA0Ona", "endDate": "1985-03-12T00:00:00Z", "grantedCode": "WrXdCEks", "itemId": "NjOCQGbY", "itemNamespace": "1GVnAASC", "language": "CUjs", "origin": "Xbox", "quantity": 94, "region": "bR0hivYo", "source": "IAP", "startDate": "1996-04-29T00:00:00Z", "storeId": "0wNOGD00"}, {"collectionId": "nkuWtyQ2", "endDate": "1979-07-31T00:00:00Z", "grantedCode": "zYMXm7zr", "itemId": "rpLKvCip", "itemNamespace": "iCF86at5", "language": "JZW", "origin": "Xbox", "quantity": 16, "region": "qLs0lz4w", "source": "REFERRAL_BONUS", "startDate": "1971-12-21T00:00:00Z", "storeId": "VzRYQU3j"}]' \
    > test.out 2>&1
eval_tap $? 240 'GrantUserEntitlement' test.out

#- 241 GetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId '9ea6f6I1' \
    --activeOnly  \
    --appId 'hIqh7DW6' \
    > test.out 2>&1
eval_tap $? 241 'GetUserAppEntitlementByAppId' test.out

#- 242 QueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'PqvGCDK1' \
    --activeOnly  \
    --limit '38' \
    --offset '38' \
    --appType 'GAME' \
    > test.out 2>&1
eval_tap $? 242 'QueryUserEntitlementsByAppType' test.out

#- 243 GetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'SKXnP9F1' \
    --activeOnly  \
    --entitlementClazz 'ENTITLEMENT' \
    --platform 'dsJ5OuTm' \
    --itemId 'c67vkL6L' \
    > test.out 2>&1
eval_tap $? 243 'GetUserEntitlementByItemId' test.out

#- 244 GetUserActiveEntitlementsByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserActiveEntitlementsByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'dxz84Og7' \
    --ids '9TvjT9PD,Te6QLRLE,shx38DVF' \
    --platform 'F3kk9f8T' \
    > test.out 2>&1
eval_tap $? 244 'GetUserActiveEntitlementsByItemIds' test.out

#- 245 GetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'TeLP4b7m' \
    --activeOnly  \
    --entitlementClazz 'OPTIONBOX' \
    --platform '6zHcs7TQ' \
    --sku 'Riq3i8ZD' \
    > test.out 2>&1
eval_tap $? 245 'GetUserEntitlementBySku' test.out

#- 246 ExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'SmXqFJWA' \
    --appIds 'JtyYk8lR,dZ03mMyz,2A9u0kfu' \
    --itemIds 's4jRvBAC,0CdoZ8oz,ZgF3R996' \
    --platform 'Oilf3Od7' \
    --skus 'umdLhlXj,RmR7BRsr,GZcqdxm9' \
    > test.out 2>&1
eval_tap $? 246 'ExistsAnyUserActiveEntitlement' test.out

#- 247 ExistsAnyUserActiveEntitlementByItemIds
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlementByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'NRgvdE9B' \
    --platform 'NF1sYZoo' \
    --itemIds 'kNdIrM6a,oZiHsphM,e7PpbPqN' \
    > test.out 2>&1
eval_tap $? 247 'ExistsAnyUserActiveEntitlementByItemIds' test.out

#- 248 GetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'XJtQ0iYZ' \
    --appId 'VQMMiiL9' \
    > test.out 2>&1
eval_tap $? 248 'GetUserAppEntitlementOwnershipByAppId' test.out

#- 249 GetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'xkmt7FOf' \
    --entitlementClazz 'MEDIA' \
    --platform 'HhzeHiZ1' \
    --itemId 'FGGV6jrb' \
    > test.out 2>&1
eval_tap $? 249 'GetUserEntitlementOwnershipByItemId' test.out

#- 250 GetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'JVp2qFuP' \
    --ids 'QNcrIvls,mnSxYon9,VIN2wx6Q' \
    --platform 'MvsPFBab' \
    > test.out 2>&1
eval_tap $? 250 'GetUserEntitlementOwnershipByItemIds' test.out

#- 251 GetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'XBF3QYNK' \
    --entitlementClazz 'OPTIONBOX' \
    --platform 'jplMVvOO' \
    --sku 'pl2bUiHp' \
    > test.out 2>&1
eval_tap $? 251 'GetUserEntitlementOwnershipBySku' test.out

#- 252 RevokeAllEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeAllEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId '9pOGRT4Q' \
    > test.out 2>&1
eval_tap $? 252 'RevokeAllEntitlements' test.out

#- 253 RevokeUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'zx8Rv8l8' \
    --entitlementIds 'HA9y0hRd' \
    > test.out 2>&1
eval_tap $? 253 'RevokeUserEntitlements' test.out

#- 254 GetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlement \
    --entitlementId 'uGC2QO7p' \
    --namespace "$AB_NAMESPACE" \
    --userId '3HHSf7FJ' \
    > test.out 2>&1
eval_tap $? 254 'GetUserEntitlement' test.out

#- 255 UpdateUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform updateUserEntitlement \
    --entitlementId 'Yuaor11b' \
    --namespace "$AB_NAMESPACE" \
    --userId 'p1efauVA' \
    --body '{"collectionId": "413TD34h", "endDate": "1983-06-28T00:00:00Z", "nullFieldList": ["oSy4ERUL", "JBn6dGLx", "fz1JXQr4"], "origin": "GooglePlay", "reason": "XcQEYljC", "startDate": "1972-05-25T00:00:00Z", "status": "REVOKED", "useCount": 22}' \
    > test.out 2>&1
eval_tap $? 255 'UpdateUserEntitlement' test.out

#- 256 ConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform consumeUserEntitlement \
    --entitlementId 'pAUHnRBp' \
    --namespace "$AB_NAMESPACE" \
    --userId 'C5161fGv' \
    --body '{"options": ["tv8aSJpm", "E5Pj6Hud", "yoW8V6dV"], "platform": "8leS0wRK", "requestId": "EjCCJJt2", "useCount": 85}' \
    > test.out 2>&1
eval_tap $? 256 'ConsumeUserEntitlement' test.out

#- 257 DisableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform disableUserEntitlement \
    --entitlementId 'QO19VQVS' \
    --namespace "$AB_NAMESPACE" \
    --userId 'o9zAA2ZU' \
    > test.out 2>&1
eval_tap $? 257 'DisableUserEntitlement' test.out

#- 258 EnableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform enableUserEntitlement \
    --entitlementId 'aLOIA3Rg' \
    --namespace "$AB_NAMESPACE" \
    --userId 'nEItVEb7' \
    > test.out 2>&1
eval_tap $? 258 'EnableUserEntitlement' test.out

#- 259 GetUserEntitlementHistories
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementHistories \
    --entitlementId 'RGOgccsE' \
    --namespace "$AB_NAMESPACE" \
    --userId 'C5T4pSPa' \
    > test.out 2>&1
eval_tap $? 259 'GetUserEntitlementHistories' test.out

#- 260 RevokeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlement \
    --entitlementId 'JjvbA3TI' \
    --namespace "$AB_NAMESPACE" \
    --userId 'O7trgT9v' \
    > test.out 2>&1
eval_tap $? 260 'RevokeUserEntitlement' test.out

#- 261 RevokeUserEntitlementByUseCount
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlementByUseCount \
    --entitlementId 'rlVsEaLL' \
    --namespace "$AB_NAMESPACE" \
    --userId 'XK39wx62' \
    --body '{"reason": "v7FURNPw", "useCount": 49}' \
    > test.out 2>&1
eval_tap $? 261 'RevokeUserEntitlementByUseCount' test.out

#- 262 PreCheckRevokeUserEntitlementByUseCount
./ng net.accelbyte.sdk.cli.Main platform preCheckRevokeUserEntitlementByUseCount \
    --entitlementId 'dJ159hZR' \
    --namespace "$AB_NAMESPACE" \
    --userId 'NrcSCpmj' \
    --quantity '12' \
    > test.out 2>&1
eval_tap $? 262 'PreCheckRevokeUserEntitlementByUseCount' test.out

#- 263 RevokeUseCount
eval_tap 0 263 'RevokeUseCount # SKIP deprecated' test.out

#- 264 SellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform sellUserEntitlement \
    --entitlementId 'C7rUCLSo' \
    --namespace "$AB_NAMESPACE" \
    --userId 'CQqRytsq' \
    --body '{"platform": "Me7YRvHY", "requestId": "1ugg6oIm", "useCount": 98}' \
    > test.out 2>&1
eval_tap $? 264 'SellUserEntitlement' test.out

#- 265 FulfillItem
./ng net.accelbyte.sdk.cli.Main platform fulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'KDYtUHwu' \
    --body '{"duration": 67, "endDate": "1981-10-20T00:00:00Z", "entitlementCollectionId": "j5j3HWDg", "entitlementOrigin": "Playstation", "itemId": "mTb9pTdP", "itemSku": "9DBCaLlk", "language": "3LIfXGp6", "metadata": {"MrvMuVYA": {}, "hCnYsEqg": {}, "sA9qfFxS": {}}, "order": {"currency": {"currencyCode": "f4GmeVMK", "currencySymbol": "Ite21sX0", "currencyType": "VIRTUAL", "decimals": 99, "namespace": "CbQAbedi"}, "ext": {"EVQDmPq7": {}, "54h7kEh9": {}, "oPcvBh8C": {}}, "free": true}, "orderNo": "YTHXi1XE", "origin": "Twitch", "overrideBundleItemQty": {"U3cyboj7": 66, "GUMVehCr": 91, "T6m9Lv9J": 69}, "quantity": 13, "region": "kLjrINkr", "source": "ACHIEVEMENT", "startDate": "1991-09-11T00:00:00Z", "storeId": "WtM5wY95"}' \
    > test.out 2>&1
eval_tap $? 265 'FulfillItem' test.out

#- 266 RedeemCode
./ng net.accelbyte.sdk.cli.Main platform redeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'qoOG7N1F' \
    --body '{"code": "nDxOYo4V", "language": "OHtM", "region": "K8vHTiZd"}' \
    > test.out 2>&1
eval_tap $? 266 'RedeemCode' test.out

#- 267 PreCheckFulfillItem
./ng net.accelbyte.sdk.cli.Main platform preCheckFulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'yKtrUFf3' \
    --body '{"itemId": "WOlDq98u", "itemSku": "1c4LE8ti", "quantity": 67}' \
    > test.out 2>&1
eval_tap $? 267 'PreCheckFulfillItem' test.out

#- 268 FulfillRewards
./ng net.accelbyte.sdk.cli.Main platform fulfillRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'oWowPxAd' \
    --body '{"entitlementCollectionId": "BVitP9UR", "entitlementOrigin": "Nintendo", "metadata": {"gmN6C433": {}, "XBpxmHyr": {}, "rfXT7HDZ": {}}, "origin": "Oculus", "rewards": [{"currency": {"currencyCode": "P0I1diUI", "namespace": "Qzcvknjn"}, "item": {"itemId": "dr8EXdlD", "itemSku": "X2mO69LN", "itemType": "zHDIwdXv"}, "quantity": 89, "type": "ITEM"}, {"currency": {"currencyCode": "lgflGLs7", "namespace": "YtGrVGRq"}, "item": {"itemId": "i5prv94O", "itemSku": "huJqZZr7", "itemType": "xjTr468y"}, "quantity": 24, "type": "CURRENCY"}, {"currency": {"currencyCode": "AhMHn1Pt", "namespace": "JbBypwbz"}, "item": {"itemId": "hIiFO34L", "itemSku": "898laSNo", "itemType": "xeUddVS4"}, "quantity": 93, "type": "ITEM"}], "source": "REFERRAL_BONUS", "transactionId": "8M4fufWf"}' \
    > test.out 2>&1
eval_tap $? 268 'FulfillRewards' test.out

#- 269 QueryUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'YZNYZz7p' \
    --endTime 'aQjo70J4' \
    --limit '36' \
    --offset '80' \
    --productId 'j4ik8lN5' \
    --startTime 'XmOTKCpZ' \
    --status 'FULFILLED' \
    --type 'APPLE' \
    > test.out 2>&1
eval_tap $? 269 'QueryUserIAPOrders' test.out

#- 270 QueryAllUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryAllUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'zZPLRhW3' \
    > test.out 2>&1
eval_tap $? 270 'QueryAllUserIAPOrders' test.out

#- 271 QueryUserIAPConsumeHistory
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPConsumeHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'B4DtWmdf' \
    --endTime 'Ix18bPE8' \
    --limit '59' \
    --offset '36' \
    --startTime 'LbddTj9M' \
    --status 'PENDING' \
    --type 'XBOX' \
    > test.out 2>&1
eval_tap $? 271 'QueryUserIAPConsumeHistory' test.out

#- 272 MockFulfillIAPItem
./ng net.accelbyte.sdk.cli.Main platform mockFulfillIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'nZob0KtS' \
    --body '{"itemIdentityType": "ITEM_SKU", "language": "Nz", "productId": "MQ26MYCI", "region": "SSBl8rYH", "transactionId": "ijN1ZYUI", "type": "STADIA"}' \
    > test.out 2>&1
eval_tap $? 272 'MockFulfillIAPItem' test.out

#- 273 QueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'FJeLCRgu' \
    --discounted  \
    --itemId 'STfHQZVq' \
    --limit '22' \
    --offset '87' \
    --status 'CHARGED' \
    > test.out 2>&1
eval_tap $? 273 'QueryUserOrders' test.out

#- 274 AdminCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform adminCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'ogVkL3ep' \
    --body '{"currencyCode": "OySUzjWZ", "currencyNamespace": "nXkyFHyE", "discountCodes": ["DK6tcsEd", "lsNkG8D5", "yobqYEUj"], "discountedPrice": 88, "entitlementPlatform": "Steam", "ext": {"ElnRtLES": {}, "kvupfgXl": {}, "oQilbDMN": {}}, "itemId": "bWMYxI9W", "language": "DmSNwCka", "options": {"skipPriceValidation": true}, "platform": "Other", "price": 62, "quantity": 34, "region": "9dQ19sUp", "returnUrl": "Wn4BIdtS", "sandbox": false, "sectionId": "AtUP2nbM"}' \
    > test.out 2>&1
eval_tap $? 274 'AdminCreateUserOrder' test.out

#- 275 CountOfPurchasedItem
./ng net.accelbyte.sdk.cli.Main platform countOfPurchasedItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'tvWfZjla' \
    --itemId 'Z3jMT6Av' \
    > test.out 2>&1
eval_tap $? 275 'CountOfPurchasedItem' test.out

#- 276 GetUserOrder
./ng net.accelbyte.sdk.cli.Main platform getUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'QDziKwJf' \
    --userId 'WwqaHWxf' \
    > test.out 2>&1
eval_tap $? 276 'GetUserOrder' test.out

#- 277 UpdateUserOrderStatus
./ng net.accelbyte.sdk.cli.Main platform updateUserOrderStatus \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'CSJzB45O' \
    --userId 'vomzz6qA' \
    --body '{"status": "CHARGEBACK", "statusReason": "FgSM9Ypr"}' \
    > test.out 2>&1
eval_tap $? 277 'UpdateUserOrderStatus' test.out

#- 278 FulfillUserOrder
./ng net.accelbyte.sdk.cli.Main platform fulfillUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'MfoHcdEY' \
    --userId 'FvR6YMco' \
    > test.out 2>&1
eval_tap $? 278 'FulfillUserOrder' test.out

#- 279 GetUserOrderGrant
eval_tap 0 279 'GetUserOrderGrant # SKIP deprecated' test.out

#- 280 GetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform getUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'xgoLon5C' \
    --userId 'zNewRlf5' \
    > test.out 2>&1
eval_tap $? 280 'GetUserOrderHistories' test.out

#- 281 ProcessUserOrderNotification
./ng net.accelbyte.sdk.cli.Main platform processUserOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'ESocD3U4' \
    --userId 'uI3ssypZ' \
    --body '{"additionalData": {"cardSummary": "70B3CEZU"}, "authorisedTime": "1988-07-11T00:00:00Z", "chargebackReversedTime": "1985-05-08T00:00:00Z", "chargebackTime": "1975-05-19T00:00:00Z", "chargedTime": "1987-03-27T00:00:00Z", "createdTime": "1994-11-09T00:00:00Z", "currency": {"currencyCode": "yUFuzRsl", "currencySymbol": "QhftHroG", "currencyType": "REAL", "decimals": 53, "namespace": "XMjmo5qh"}, "customParameters": {"d3MwLAsp": {}, "PsjD3L0J": {}, "0McKfYAT": {}}, "extOrderNo": "PL9xblYy", "extTxId": "V98StQMU", "extUserId": "0h22dmsi", "issuedAt": "1986-04-23T00:00:00Z", "metadata": {"FrwlNhiC": "rn4AuCDO", "KYaCQmir": "0CHpsKxW", "8XDAuj69": "yIhqDkFk"}, "namespace": "h2OYlbtw", "nonceStr": "cImRxmxM", "paymentData": {"subtotalPrice": 6, "tax": 71, "totalPrice": 22}, "paymentMethod": "GK7NB2Ix", "paymentMethodFee": 22, "paymentOrderNo": "vkb46Snq", "paymentProvider": "PAYPAL", "paymentProviderFee": 49, "paymentStationUrl": "m0e9i5CG", "price": 62, "refundedTime": "1999-10-09T00:00:00Z", "salesTax": 90, "sandbox": false, "sku": "swOfhjRG", "status": "REFUND_FAILED", "statusReason": "PiVQmt5Y", "subscriptionId": "C7Ciqsf2", "subtotalPrice": 70, "targetNamespace": "QbghoDfn", "targetUserId": "QhMo4qWW", "tax": 55, "totalPrice": 10, "totalTax": 13, "txEndTime": "1991-09-07T00:00:00Z", "type": "DjY5lHTL", "userId": "0YUcqAiJ", "vat": 32}' \
    > test.out 2>&1
eval_tap $? 281 'ProcessUserOrderNotification' test.out

#- 282 DownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform downloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'J7odSxs8' \
    --userId 's6zaexQS' \
    > test.out 2>&1
eval_tap $? 282 'DownloadUserOrderReceipt' test.out

#- 283 CreateUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform createUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'Mg01FNP5' \
    --body '{"currencyCode": "TJKWuN1I", "currencyNamespace": "zwdVz6TC", "customParameters": {"tYOwJwOE": {}, "cn0AVu9p": {}, "VOZXr4GY": {}}, "description": "ODU3JHyw", "extOrderNo": "l1JI9wZC", "extUserId": "kKSRl2xd", "itemType": "COINS", "language": "nApx_Xrsu-860", "metadata": {"hJUCDPAM": "cHUqepg7", "HIuMsONU": "A1ILMgUL", "jqyhJNEm": "H8oTzI7t"}, "notifyUrl": "3JtzmLVZ", "omitNotification": true, "platform": "CyfMDsB7", "price": 71, "recurringPaymentOrderNo": "J7USUAco", "region": "HzMQE4tc", "returnUrl": "L0ILVw7c", "sandbox": true, "sku": "DuusvXMi", "subscriptionId": "FgOVSq5l", "title": "0RrBxY0Z"}' \
    > test.out 2>&1
eval_tap $? 283 'CreateUserPaymentOrder' test.out

#- 284 RefundUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform refundUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '44JX7lO5' \
    --userId '3dWQEfSU' \
    --body '{"description": "KG6yqOqF"}' \
    > test.out 2>&1
eval_tap $? 284 'RefundUserPaymentOrder' test.out

#- 285 GetUserPlatformAccountClosureHistories
./ng net.accelbyte.sdk.cli.Main platform getUserPlatformAccountClosureHistories \
    --namespace "$AB_NAMESPACE" \
    --userId 'mUrubB8B' \
    > test.out 2>&1
eval_tap $? 285 'GetUserPlatformAccountClosureHistories' test.out

#- 286 ApplyUserRedemption
./ng net.accelbyte.sdk.cli.Main platform applyUserRedemption \
    --namespace "$AB_NAMESPACE" \
    --userId 'r0ZHfagv' \
    --body '{"code": "oTvHOVyT", "orderNo": "FsoQw0Kb"}' \
    > test.out 2>&1
eval_tap $? 286 'ApplyUserRedemption' test.out

#- 287 DoRevocation
./ng net.accelbyte.sdk.cli.Main platform doRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId 'hBcuwWha' \
    --body '{"meta": {"NtgSDz6l": {}, "s0rrNtHk": {}, "C1vuzcUt": {}}, "revokeEntries": [{"currency": {"balanceOrigin": "Xbox", "currencyCode": "8MzaRcAg", "namespace": "VhaEptrX"}, "entitlement": {"entitlementId": "HyJ0jMXw"}, "item": {"entitlementOrigin": "Playstation", "itemIdentity": "ItvZRovk", "itemIdentityType": "ITEM_SKU", "origin": "Nintendo"}, "quantity": 48, "type": "ITEM"}, {"currency": {"balanceOrigin": "Twitch", "currencyCode": "KQvJlgKY", "namespace": "ZCddYo3M"}, "entitlement": {"entitlementId": "hlBknLsy"}, "item": {"entitlementOrigin": "IOS", "itemIdentity": "IW9xHh3v", "itemIdentityType": "ITEM_SKU", "origin": "Xbox"}, "quantity": 36, "type": "ITEM"}, {"currency": {"balanceOrigin": "Xbox", "currencyCode": "1Z1MsMkH", "namespace": "e0aWjO5y"}, "entitlement": {"entitlementId": "NiUgJXKw"}, "item": {"entitlementOrigin": "Xbox", "itemIdentity": "PZF1a3zn", "itemIdentityType": "ITEM_ID", "origin": "System"}, "quantity": 61, "type": "ENTITLEMENT"}], "source": "IAP", "transactionId": "ipVUxkkB"}' \
    > test.out 2>&1
eval_tap $? 287 'DoRevocation' test.out

#- 288 RegisterXblSessions
./ng net.accelbyte.sdk.cli.Main platform registerXblSessions \
    --namespace "$AB_NAMESPACE" \
    --userId 'YOtQowU6' \
    --body '{"gameSessionId": "iVPw5NNe", "payload": {"WBxqS5dF": {}, "xB3au1cx": {}, "3rS6SVe6": {}}, "scid": "1Yd5aQpe", "sessionTemplateName": "Tipi6c4z"}' \
    > test.out 2>&1
eval_tap $? 288 'RegisterXblSessions' test.out

#- 289 QueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform queryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'i7s9BFJy' \
    --chargeStatus 'RECURRING_CHARGING' \
    --itemId 'gntEHpzZ' \
    --limit '28' \
    --offset '13' \
    --sku 'dFDOhOLc' \
    --status 'ACTIVE' \
    --subscribedBy 'USER' \
    > test.out 2>&1
eval_tap $? 289 'QueryUserSubscriptions' test.out

#- 290 GetUserSubscriptionActivities
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionActivities \
    --namespace "$AB_NAMESPACE" \
    --userId 'klBjVXfi' \
    --excludeSystem  \
    --limit '33' \
    --offset '32' \
    --subscriptionId '5l5mo8ki' \
    > test.out 2>&1
eval_tap $? 290 'GetUserSubscriptionActivities' test.out

#- 291 PlatformSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform platformSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'zHtZjpoF' \
    --body '{"grantDays": 97, "itemId": "uvM1I5Bk", "language": "rfdyFGZI", "reason": "Mmu7ZwFC", "region": "d0wkXWT9", "source": "IhTDLc3I"}' \
    > test.out 2>&1
eval_tap $? 291 'PlatformSubscribeSubscription' test.out

#- 292 CheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform checkUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'CLZ7lwha' \
    --itemId 'vTlFHmgv' \
    > test.out 2>&1
eval_tap $? 292 'CheckUserSubscriptionSubscribableByItemId' test.out

#- 293 GetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform getUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'NuNXKW5V' \
    --userId 'msS3j1m8' \
    > test.out 2>&1
eval_tap $? 293 'GetUserSubscription' test.out

#- 294 DeleteUserSubscription
./ng net.accelbyte.sdk.cli.Main platform deleteUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'x6C6HH4k' \
    --userId '6xQcmiQP' \
    > test.out 2>&1
eval_tap $? 294 'DeleteUserSubscription' test.out

#- 295 CancelSubscription
./ng net.accelbyte.sdk.cli.Main platform cancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'vJYEEchq' \
    --userId 'G7hF0oEd' \
    --force  \
    --body '{"immediate": true, "reason": "HmsRiYql"}' \
    > test.out 2>&1
eval_tap $? 295 'CancelSubscription' test.out

#- 296 GrantDaysToSubscription
./ng net.accelbyte.sdk.cli.Main platform grantDaysToSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'ASt3un0X' \
    --userId '7BMrloVj' \
    --body '{"grantDays": 59, "reason": "sozIyf88"}' \
    > test.out 2>&1
eval_tap $? 296 'GrantDaysToSubscription' test.out

#- 297 GetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'v8duM94J' \
    --userId 'Qj59DZzc' \
    --excludeFree  \
    --limit '11' \
    --offset '46' \
    > test.out 2>&1
eval_tap $? 297 'GetUserSubscriptionBillingHistories' test.out

#- 298 ProcessUserSubscriptionNotification
./ng net.accelbyte.sdk.cli.Main platform processUserSubscriptionNotification \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'EsOHWpxY' \
    --userId 'sqHEKb1L' \
    --body '{"additionalData": {"cardSummary": "xdP61aNt"}, "authorisedTime": "1982-03-04T00:00:00Z", "chargebackReversedTime": "1994-12-14T00:00:00Z", "chargebackTime": "1977-01-13T00:00:00Z", "chargedTime": "1985-11-21T00:00:00Z", "createdTime": "1982-04-05T00:00:00Z", "currency": {"currencyCode": "HMc6HrhR", "currencySymbol": "At8gNZP1", "currencyType": "REAL", "decimals": 64, "namespace": "0NbNMqhc"}, "customParameters": {"HrrgtiqY": {}, "SE5uDoGl": {}, "CrMsacyV": {}}, "extOrderNo": "2PCNWRSP", "extTxId": "YuhKm7tc", "extUserId": "rLLe4XoM", "issuedAt": "1977-01-06T00:00:00Z", "metadata": {"hAFplXPh": "TbueSefZ", "Emy8byEy": "TAOYqwKC", "G66fmuE4": "9zW5dye2"}, "namespace": "9slRGE5Y", "nonceStr": "ql9BWs9q", "paymentData": {"subtotalPrice": 51, "tax": 1, "totalPrice": 33}, "paymentMethod": "sHFIPB9E", "paymentMethodFee": 87, "paymentOrderNo": "dydRr42b", "paymentProvider": "ALIPAY", "paymentProviderFee": 84, "paymentStationUrl": "PIPnj6pL", "price": 73, "refundedTime": "1979-08-07T00:00:00Z", "salesTax": 18, "sandbox": false, "sku": "SqIkF56m", "status": "CHARGEBACK_REVERSED", "statusReason": "q5dmjFYz", "subscriptionId": "E4jvkM8e", "subtotalPrice": 42, "targetNamespace": "4fLS4gTG", "targetUserId": "1wDwc4Tt", "tax": 18, "totalPrice": 50, "totalTax": 100, "txEndTime": "1973-07-01T00:00:00Z", "type": "xMZehQJw", "userId": "2X4GKqBK", "vat": 72}' \
    > test.out 2>&1
eval_tap $? 298 'ProcessUserSubscriptionNotification' test.out

#- 299 AcquireUserTicket
./ng net.accelbyte.sdk.cli.Main platform acquireUserTicket \
    --boothName 'vfvSgSjG' \
    --namespace "$AB_NAMESPACE" \
    --userId 'D5U1XNDx' \
    --body '{"count": 26, "orderNo": "Sw2LqWk8"}' \
    > test.out 2>&1
eval_tap $? 299 'AcquireUserTicket' test.out

#- 300 QueryUserCurrencyWallets
./ng net.accelbyte.sdk.cli.Main platform queryUserCurrencyWallets \
    --namespace "$AB_NAMESPACE" \
    --userId 'AHVmrGgJ' \
    > test.out 2>&1
eval_tap $? 300 'QueryUserCurrencyWallets' test.out

#- 301 DebitUserWalletByCurrencyCode
./ng net.accelbyte.sdk.cli.Main platform debitUserWalletByCurrencyCode \
    --currencyCode 'HiOn39I6' \
    --namespace "$AB_NAMESPACE" \
    --userId 'hnBQfcJ8' \
    --body '{"allowOverdraft": false, "amount": 71, "balanceOrigin": "Playstation", "balanceSource": "DLC_REVOCATION", "metadata": {"MlJKN9Qj": {}, "byJxTX0l": {}, "DLjFT29G": {}}, "reason": "wXeCViLD"}' \
    > test.out 2>&1
eval_tap $? 301 'DebitUserWalletByCurrencyCode' test.out

#- 302 ListUserCurrencyTransactions
./ng net.accelbyte.sdk.cli.Main platform listUserCurrencyTransactions \
    --currencyCode 'tFjVWU32' \
    --namespace "$AB_NAMESPACE" \
    --userId '4JulmHBX' \
    --limit '68' \
    --offset '71' \
    > test.out 2>&1
eval_tap $? 302 'ListUserCurrencyTransactions' test.out

#- 303 CheckBalance
./ng net.accelbyte.sdk.cli.Main platform checkBalance \
    --currencyCode 'kbRJf6hq' \
    --namespace "$AB_NAMESPACE" \
    --userId 'NpdONxnl' \
    --request '{"amount": 22, "debitBalanceSource": "TRADE", "metadata": {"ZqUmYfrO": {}, "bcxDxTSU": {}, "Iggzd8Os": {}}, "reason": "9lDhZxDE", "walletPlatform": "Other"}' \
    > test.out 2>&1
eval_tap $? 303 'CheckBalance' test.out

#- 304 CheckWallet
eval_tap 0 304 'CheckWallet # SKIP deprecated' test.out

#- 305 CreditUserWallet
./ng net.accelbyte.sdk.cli.Main platform creditUserWallet \
    --currencyCode 'lLwvnRxu' \
    --namespace "$AB_NAMESPACE" \
    --userId 'dOd4Rb6v' \
    --body '{"amount": 75, "expireAt": "1995-05-10T00:00:00Z", "metadata": {"HqcPjzF5": {}, "WmUN8aM2": {}, "ncirthsg": {}}, "origin": "IOS", "reason": "TJ0EU0XV", "source": "TRADE"}' \
    > test.out 2>&1
eval_tap $? 305 'CreditUserWallet' test.out

#- 306 DebitByWalletPlatform
./ng net.accelbyte.sdk.cli.Main platform debitByWalletPlatform \
    --currencyCode 'a9CwYJby' \
    --namespace "$AB_NAMESPACE" \
    --userId 'XxaySunY' \
    --request '{"amount": 69, "debitBalanceSource": "IAP_REVOCATION", "metadata": {"3pq6jHEC": {}, "0d7MAOmU": {}, "mzrJ8tm0": {}}, "reason": "9tG4XMLV", "walletPlatform": "Steam"}' \
    > test.out 2>&1
eval_tap $? 306 'DebitByWalletPlatform' test.out

#- 307 PayWithUserWallet
./ng net.accelbyte.sdk.cli.Main platform payWithUserWallet \
    --currencyCode 'UmwajYV0' \
    --namespace "$AB_NAMESPACE" \
    --userId 'T32bOq6O' \
    --body '{"amount": 67, "metadata": {"bcPUQraR": {}, "aRUhCN1b": {}, "5Q3POnL1": {}}, "walletPlatform": "GooglePlay"}' \
    > test.out 2>&1
eval_tap $? 307 'PayWithUserWallet' test.out

#- 308 GetUserWallet
eval_tap 0 308 'GetUserWallet # SKIP deprecated' test.out

#- 309 DebitUserWallet
eval_tap 0 309 'DebitUserWallet # SKIP deprecated' test.out

#- 310 DisableUserWallet
eval_tap 0 310 'DisableUserWallet # SKIP deprecated' test.out

#- 311 EnableUserWallet
eval_tap 0 311 'EnableUserWallet # SKIP deprecated' test.out

#- 312 ListUserWalletTransactions
eval_tap 0 312 'ListUserWalletTransactions # SKIP deprecated' test.out

#- 313 ListViews
./ng net.accelbyte.sdk.cli.Main platform listViews \
    --namespace "$AB_NAMESPACE" \
    --storeId 'fEhlEETs' \
    > test.out 2>&1
eval_tap $? 313 'ListViews' test.out

#- 314 CreateView
./ng net.accelbyte.sdk.cli.Main platform createView \
    --namespace "$AB_NAMESPACE" \
    --storeId 'cx1z79Nm' \
    --body '{"displayOrder": 13, "localizations": {"b00BVwXy": {"description": "usbLfA6J", "localExt": {"bkn0JVvx": {}, "7IxPQDLR": {}, "etz8UIlE": {}}, "longDescription": "YKau6F4B", "title": "X4x1Pypk"}, "1TK4dMUJ": {"description": "zWVZOyUd", "localExt": {"H2TXUZwz": {}, "OFrYRjQh": {}, "zh2X4w3L": {}}, "longDescription": "gx7wHL5U", "title": "vZrIwMrb"}, "ck3xsD11": {"description": "br7zlCKZ", "localExt": {"EndioSn7": {}, "WqVSsl12": {}, "MRCf4Hm2": {}}, "longDescription": "E9m7pH04", "title": "o4qksVze"}}, "name": "SKyMD5D2"}' \
    > test.out 2>&1
eval_tap $? 314 'CreateView' test.out

#- 315 GetView
./ng net.accelbyte.sdk.cli.Main platform getView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'LUwXn5tQ' \
    --storeId 'kOqMIuSu' \
    > test.out 2>&1
eval_tap $? 315 'GetView' test.out

#- 316 UpdateView
./ng net.accelbyte.sdk.cli.Main platform updateView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'SZ5aB5yZ' \
    --storeId 'orD1nNEV' \
    --body '{"displayOrder": 97, "localizations": {"JVAPyAso": {"description": "uRL7H68F", "localExt": {"wlaEx1QD": {}, "CXsgpTZu": {}, "bJYBQw0I": {}}, "longDescription": "P27tl1nS", "title": "ZAMv027F"}, "yGgBSe2T": {"description": "O2N1SbmL", "localExt": {"b4hhWY8J": {}, "6xkNM6Kh": {}, "LsAZP9Qx": {}}, "longDescription": "f4G8Ju5F", "title": "pxK5zVtn"}, "j3ocwpyO": {"description": "lqYJBbiX", "localExt": {"KKE7Q6IX": {}, "oqVJajIs": {}, "rW9bn0gS": {}}, "longDescription": "OslJyJoD", "title": "4X7X3PyE"}}, "name": "RRuQ72wF"}' \
    > test.out 2>&1
eval_tap $? 316 'UpdateView' test.out

#- 317 DeleteView
./ng net.accelbyte.sdk.cli.Main platform deleteView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'daLrPnEH' \
    --storeId 'k0ZH5GCn' \
    > test.out 2>&1
eval_tap $? 317 'DeleteView' test.out

#- 318 QueryWallets
eval_tap 0 318 'QueryWallets # SKIP deprecated' test.out

#- 319 BulkCredit
./ng net.accelbyte.sdk.cli.Main platform bulkCredit \
    --namespace "$AB_NAMESPACE" \
    --body '[{"creditRequest": {"amount": 68, "expireAt": "1999-01-10T00:00:00Z", "metadata": {"8mTuKPfQ": {}, "g4EgZaVs": {}, "swhSckBe": {}}, "origin": "Playstation", "reason": "kZLXEyJo", "source": "TRADE"}, "currencyCode": "OnHMsYqU", "userIds": ["HN92uKEN", "N8sjH49S", "BRArtTYJ"]}, {"creditRequest": {"amount": 4, "expireAt": "1984-01-13T00:00:00Z", "metadata": {"XyJ8j4qz": {}, "fsyYBRgt": {}, "1XNKQmHP": {}}, "origin": "Epic", "reason": "LPwk83lg", "source": "DLC"}, "currencyCode": "uaBWy8to", "userIds": ["Wb4audMC", "l1zJqQgY", "ZVdGi8MA"]}, {"creditRequest": {"amount": 11, "expireAt": "1998-11-17T00:00:00Z", "metadata": {"TWysLwfW": {}, "H38WszV3": {}, "Z4Ye4jGr": {}}, "origin": "Oculus", "reason": "2LUbsiS9", "source": "DLC"}, "currencyCode": "X3NxqOFo", "userIds": ["k3LyBZPC", "xSRzjqBf", "wTxmK3X9"]}]' \
    > test.out 2>&1
eval_tap $? 319 'BulkCredit' test.out

#- 320 BulkDebit
./ng net.accelbyte.sdk.cli.Main platform bulkDebit \
    --namespace "$AB_NAMESPACE" \
    --body '[{"currencyCode": "cnmRKSrZ", "request": {"allowOverdraft": true, "amount": 73, "balanceOrigin": "Other", "balanceSource": "PAYMENT", "metadata": {"8JkNSLal": {}, "sIiVz361": {}, "PRzrG6V0": {}}, "reason": "EXFf3qo6"}, "userIds": ["XyutaZPg", "TxiyAQB0", "PzJqQiZg"]}, {"currencyCode": "9bdRgB1y", "request": {"allowOverdraft": false, "amount": 86, "balanceOrigin": "IOS", "balanceSource": "OTHER", "metadata": {"o27Zfhl1": {}, "CEhFX0XD": {}, "Jy9jJGBU": {}}, "reason": "85fO3735"}, "userIds": ["EMQAkNpi", "A8ZWmZrj", "ragTsUUS"]}, {"currencyCode": "cZsv45cE", "request": {"allowOverdraft": true, "amount": 3, "balanceOrigin": "Nintendo", "balanceSource": "EXPIRATION", "metadata": {"oYlW6t9z": {}, "H3VGf7l2": {}, "w9vkH1S3": {}}, "reason": "6kgkMJUl"}, "userIds": ["bRl09UIB", "5MM6tRfp", "IC9b7M6C"]}]' \
    > test.out 2>&1
eval_tap $? 320 'BulkDebit' test.out

#- 321 GetWallet
eval_tap 0 321 'GetWallet # SKIP deprecated' test.out

#- 322 SyncOrders
./ng net.accelbyte.sdk.cli.Main platform syncOrders \
    --nextEvaluatedKey '1AZ0wxqc' \
    --end 'vv2XJhFH' \
    --start 'lHreEW4D' \
    > test.out 2>&1
eval_tap $? 322 'SyncOrders' test.out

#- 323 TestAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfig \
    --sandbox  \
    --body '{"allowedPaymentMethods": ["Ny5wXaJZ", "n8KXHe06", "IhaQm6ie"], "apiKey": "f3wch0wh", "authoriseAsCapture": false, "blockedPaymentMethods": ["bfUGVyYZ", "N8sycgR0", "cbKMvReA"], "clientKey": "8hTpaKYO", "dropInSettings": "rewP8G8V", "liveEndpointUrlPrefix": "1iUzBjFI", "merchantAccount": "dyz8Hdcs", "notificationHmacKey": "8KOCIfJ4", "notificationPassword": "xqlVQm9D", "notificationUsername": "tDP5E2E6", "returnUrl": "tICmjDDK", "settings": "x93FEynL"}' \
    > test.out 2>&1
eval_tap $? 323 'TestAdyenConfig' test.out

#- 324 TestAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfig \
    --sandbox  \
    --body '{"appId": "wvJt7KmT", "privateKey": "I4JvhF2N", "publicKey": "8zG1bsGB", "returnUrl": "2JGb4dYZ"}' \
    > test.out 2>&1
eval_tap $? 324 'TestAliPayConfig' test.out

#- 325 TestCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfig \
    --sandbox  \
    --body '{"publicKey": "rGtyzS2U", "secretKey": "tcTtTDXL"}' \
    > test.out 2>&1
eval_tap $? 325 'TestCheckoutConfig' test.out

#- 326 DebugMatchedPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentMerchantConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'mYtgvidV' \
    > test.out 2>&1
eval_tap $? 326 'DebugMatchedPaymentMerchantConfig' test.out

#- 327 TestNeonPayConfig
./ng net.accelbyte.sdk.cli.Main platform testNeonPayConfig \
    --sandbox  \
    --body '{"apiKey": "VNFBHw7Z", "webhookSecretKey": "W5bcR0Kq"}' \
    > test.out 2>&1
eval_tap $? 327 'TestNeonPayConfig' test.out

#- 328 TestPayPalConfig
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfig \
    --sandbox  \
    --body '{"clientID": "uA1V9KUU", "clientSecret": "9qEHvfGK", "returnUrl": "172IC4iM", "webHookId": "noMtqU7N"}' \
    > test.out 2>&1
eval_tap $? 328 'TestPayPalConfig' test.out

#- 329 TestStripeConfig
./ng net.accelbyte.sdk.cli.Main platform testStripeConfig \
    --sandbox  \
    --body '{"allowedPaymentMethodTypes": ["KtF7SOin", "VjFwuZoF", "g9cBnNke"], "publishableKey": "AXK6M3zG", "secretKey": "CYaRr5KK", "webhookSecret": "WrZlVO4P"}' \
    > test.out 2>&1
eval_tap $? 329 'TestStripeConfig' test.out

#- 330 TestWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfig \
    --body '{"appId": "WoJtjeUy", "key": "hYbA28rj", "mchid": "6OWP1VnN", "returnUrl": "72sjy0DC"}' \
    > test.out 2>&1
eval_tap $? 330 'TestWxPayConfig' test.out

#- 331 TestXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfig \
    --body '{"apiKey": "LdXgfY4z", "flowCompletionUrl": "BS1zRcVL", "merchantId": 67, "projectId": 36, "projectSecretKey": "Rrkx4J7y"}' \
    > test.out 2>&1
eval_tap $? 331 'TestXsollaConfig' test.out

#- 332 GetPaymentMerchantConfig1
./ng net.accelbyte.sdk.cli.Main platform getPaymentMerchantConfig1 \
    --id 'D9Gg0IL1' \
    > test.out 2>&1
eval_tap $? 332 'GetPaymentMerchantConfig1' test.out

#- 333 UpdateAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform updateAdyenConfig \
    --id 'h68HaU1y' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethods": ["Oge84CvX", "W1jZEjF1", "3MJubYZq"], "apiKey": "iSEn9sZ0", "authoriseAsCapture": true, "blockedPaymentMethods": ["wR6AaFFD", "62LzURAU", "tM5bRG0n"], "clientKey": "ejtdj0eW", "dropInSettings": "yFtYWZxp", "liveEndpointUrlPrefix": "uOrx8HI7", "merchantAccount": "j1nVsKhE", "notificationHmacKey": "krIvjWXy", "notificationPassword": "4RbfI1I3", "notificationUsername": "hboWiNIl", "returnUrl": "xv4w5gJg", "settings": "G300UF9R"}' \
    > test.out 2>&1
eval_tap $? 333 'UpdateAdyenConfig' test.out

#- 334 TestAdyenConfigById
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfigById \
    --id 'Nui8wmP2' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 334 'TestAdyenConfigById' test.out

#- 335 UpdateAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateAliPayConfig \
    --id '3LbrsJYL' \
    --sandbox  \
    --validate  \
    --body '{"appId": "TwfjBxyL", "privateKey": "5a0DJyJR", "publicKey": "9qpfdQN5", "returnUrl": "vESV8b8W"}' \
    > test.out 2>&1
eval_tap $? 335 'UpdateAliPayConfig' test.out

#- 336 TestAliPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfigById \
    --id 'axi6C0tz' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 336 'TestAliPayConfigById' test.out

#- 337 UpdateCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform updateCheckoutConfig \
    --id 'fewSP14L' \
    --sandbox  \
    --validate  \
    --body '{"publicKey": "fIeFyaXE", "secretKey": "5wR3G4kd"}' \
    > test.out 2>&1
eval_tap $? 337 'UpdateCheckoutConfig' test.out

#- 338 TestCheckoutConfigById
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfigById \
    --id '4LUnfij2' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 338 'TestCheckoutConfigById' test.out

#- 339 UpdateNeonPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateNeonPayConfig \
    --id 'iVmrjJR6' \
    --sandbox  \
    --validate  \
    --body '{"apiKey": "wG28NGCO", "webhookSecretKey": "wiKBcLC9"}' \
    > test.out 2>&1
eval_tap $? 339 'UpdateNeonPayConfig' test.out

#- 340 TestNeonPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testNeonPayConfigById \
    --id 'UMHiupvI' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 340 'TestNeonPayConfigById' test.out

#- 341 UpdatePayPalConfig
./ng net.accelbyte.sdk.cli.Main platform updatePayPalConfig \
    --id 'V0AdHsK2' \
    --sandbox  \
    --validate  \
    --body '{"clientID": "1AdmYTeK", "clientSecret": "b8X0yPWF", "returnUrl": "3CBOgf4n", "webHookId": "bHklFkCZ"}' \
    > test.out 2>&1
eval_tap $? 341 'UpdatePayPalConfig' test.out

#- 342 TestPayPalConfigById
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfigById \
    --id 'I3xACbcZ' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 342 'TestPayPalConfigById' test.out

#- 343 UpdateStripeConfig
./ng net.accelbyte.sdk.cli.Main platform updateStripeConfig \
    --id 'fviC27d8' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethodTypes": ["osLc7g4u", "HXYqQTGw", "iqvHDLts"], "publishableKey": "u1VNIMFQ", "secretKey": "srW9UxRS", "webhookSecret": "8tKAkxCE"}' \
    > test.out 2>&1
eval_tap $? 343 'UpdateStripeConfig' test.out

#- 344 TestStripeConfigById
./ng net.accelbyte.sdk.cli.Main platform testStripeConfigById \
    --id 'GNf48zSg' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 344 'TestStripeConfigById' test.out

#- 345 UpdateWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfig \
    --id 'mHbC5ANj' \
    --validate  \
    --body '{"appId": "HLjbEnSF", "key": "s0g1ikym", "mchid": "iZjb4hkD", "returnUrl": "1JaRJeAv"}' \
    > test.out 2>&1
eval_tap $? 345 'UpdateWxPayConfig' test.out

#- 346 UpdateWxPayConfigCert
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfigCert \
    --id 'QHJCa4yC' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 346 'UpdateWxPayConfigCert' test.out

#- 347 TestWxPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfigById \
    --id 'exCgkHBj' \
    > test.out 2>&1
eval_tap $? 347 'TestWxPayConfigById' test.out

#- 348 UpdateXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaConfig \
    --id '4KEZWX4N' \
    --validate  \
    --body '{"apiKey": "rXtP4mmo", "flowCompletionUrl": "iBVmtjZI", "merchantId": 19, "projectId": 17, "projectSecretKey": "f6z6Y9NH"}' \
    > test.out 2>&1
eval_tap $? 348 'UpdateXsollaConfig' test.out

#- 349 TestXsollaConfigById
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfigById \
    --id 'DXQZGjdS' \
    > test.out 2>&1
eval_tap $? 349 'TestXsollaConfigById' test.out

#- 350 UpdateXsollaUIConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaUIConfig \
    --id 'Q0lus08U' \
    --body '{"device": "MOBILE", "showCloseButton": false, "size": "MEDIUM", "theme": "DEFAULT_DARK"}' \
    > test.out 2>&1
eval_tap $? 350 'UpdateXsollaUIConfig' test.out

#- 351 QueryPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform queryPaymentProviderConfig \
    --limit '27' \
    --namespace "$AB_NAMESPACE" \
    --offset '61' \
    --region 'sxY18LHV' \
    > test.out 2>&1
eval_tap $? 351 'QueryPaymentProviderConfig' test.out

#- 352 CreatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform createPaymentProviderConfig \
    --body '{"aggregate": "STRIPE", "namespace": "EB5jmGep", "region": "ps2C5Klo", "sandboxTaxJarApiToken": "WJoQsI2C", "specials": ["WALLET", "STRIPE", "ALIPAY"], "taxJarApiToken": "BEyILO7z", "taxJarEnabled": false, "useGlobalTaxJarApiToken": true}' \
    > test.out 2>&1
eval_tap $? 352 'CreatePaymentProviderConfig' test.out

#- 353 GetAggregatePaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getAggregatePaymentProviders \
    > test.out 2>&1
eval_tap $? 353 'GetAggregatePaymentProviders' test.out

#- 354 DebugMatchedPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentProviderConfig \
    --namespace "$AB_NAMESPACE" \
    --region '7Or6UJYf' \
    > test.out 2>&1
eval_tap $? 354 'DebugMatchedPaymentProviderConfig' test.out

#- 355 GetSpecialPaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getSpecialPaymentProviders \
    > test.out 2>&1
eval_tap $? 355 'GetSpecialPaymentProviders' test.out

#- 356 UpdatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentProviderConfig \
    --id 'aNemPAre' \
    --body '{"aggregate": "CHECKOUT", "namespace": "zDpEmdld", "region": "GYP9Wu8I", "sandboxTaxJarApiToken": "OYYiUTs7", "specials": ["WALLET", "WALLET", "WXPAY"], "taxJarApiToken": "mpquRUhG", "taxJarEnabled": true, "useGlobalTaxJarApiToken": false}' \
    > test.out 2>&1
eval_tap $? 356 'UpdatePaymentProviderConfig' test.out

#- 357 DeletePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform deletePaymentProviderConfig \
    --id 'pMLq9AUb' \
    > test.out 2>&1
eval_tap $? 357 'DeletePaymentProviderConfig' test.out

#- 358 GetPaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxConfig \
    > test.out 2>&1
eval_tap $? 358 'GetPaymentTaxConfig' test.out

#- 359 UpdatePaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentTaxConfig \
    --body '{"sandboxTaxJarApiToken": "354tcdJN", "taxJarApiToken": "xwo42M8a", "taxJarEnabled": true, "taxJarProductCodesMapping": {"xQErbRQz": "bkMRe2lZ", "0Rklxum7": "KxKY6kvl", "bDSr6c19": "CvDAmAIC"}}' \
    > test.out 2>&1
eval_tap $? 359 'UpdatePaymentTaxConfig' test.out

#- 360 SyncPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform syncPaymentOrders \
    --nextEvaluatedKey '4HwLIPiv' \
    --end 'LmTgWHy0' \
    --start 'bqIRyGKG' \
    > test.out 2>&1
eval_tap $? 360 'SyncPaymentOrders' test.out

#- 361 PublicGetRootCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetRootCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'bPL1DZPx' \
    --storeId 'y7URxFGd' \
    > test.out 2>&1
eval_tap $? 361 'PublicGetRootCategories' test.out

#- 362 DownloadCategories
./ng net.accelbyte.sdk.cli.Main platform downloadCategories \
    --namespace "$AB_NAMESPACE" \
    --language '5uusIJbv' \
    --storeId 'd8lJnPsk' \
    > test.out 2>&1
eval_tap $? 362 'DownloadCategories' test.out

#- 363 PublicGetCategory
./ng net.accelbyte.sdk.cli.Main platform publicGetCategory \
    --categoryPath '9jTmIW1K' \
    --namespace "$AB_NAMESPACE" \
    --language 'Lm3uPNit' \
    --storeId '3sf9Ooz8' \
    > test.out 2>&1
eval_tap $? 363 'PublicGetCategory' test.out

#- 364 PublicGetChildCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetChildCategories \
    --categoryPath 'i2AtUA8Q' \
    --namespace "$AB_NAMESPACE" \
    --language 'BVETaeOM' \
    --storeId 'qTQOAiNu' \
    > test.out 2>&1
eval_tap $? 364 'PublicGetChildCategories' test.out

#- 365 PublicGetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetDescendantCategories \
    --categoryPath 'KsTpoaV8' \
    --namespace "$AB_NAMESPACE" \
    --language 'rii1ujeu' \
    --storeId 'FPaaM3yx' \
    > test.out 2>&1
eval_tap $? 365 'PublicGetDescendantCategories' test.out

#- 366 PublicListCurrencies
./ng net.accelbyte.sdk.cli.Main platform publicListCurrencies \
    --namespace "$AB_NAMESPACE" \
    --currencyType 'REAL' \
    > test.out 2>&1
eval_tap $? 366 'PublicListCurrencies' test.out

#- 367 GeDLCDurableRewardShortMap
./ng net.accelbyte.sdk.cli.Main platform geDLCDurableRewardShortMap \
    --namespace "$AB_NAMESPACE" \
    --dlcType 'STEAM' \
    > test.out 2>&1
eval_tap $? 367 'GeDLCDurableRewardShortMap' test.out

#- 368 GetIAPItemMapping
./ng net.accelbyte.sdk.cli.Main platform getIAPItemMapping \
    --namespace "$AB_NAMESPACE" \
    --platform 'APPLE' \
    > test.out 2>&1
eval_tap $? 368 'GetIAPItemMapping' test.out

#- 369 PublicGetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --language 'W8RVos5Q' \
    --region 'bkBBjFQG' \
    --storeId 'cQc26Jng' \
    --appId 'Ij6VSu5L' \
    > test.out 2>&1
eval_tap $? 369 'PublicGetItemByAppId' test.out

#- 370 PublicQueryItems
./ng net.accelbyte.sdk.cli.Main platform publicQueryItems \
    --namespace "$AB_NAMESPACE" \
    --appType 'DLC' \
    --autoCalcEstimatedPrice  \
    --baseAppId 'VuCNNvhG' \
    --categoryPath 'cs4n9PGl' \
    --features '1nK4Epd0' \
    --includeSubCategoryItem  \
    --itemType 'LOOTBOX' \
    --language 'IJYgdjMi' \
    --limit '2' \
    --offset '27' \
    --region 'G2YRJ8dP' \
    --sortBy 'name,displayOrder:desc,updatedAt:asc' \
    --storeId 'd2yFLl5X' \
    --tags '9ltwrwTC' \
    > test.out 2>&1
eval_tap $? 370 'PublicQueryItems' test.out

#- 371 PublicGetItemBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetItemBySku \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'LlPlPXhC' \
    --region 'nLqhgN9n' \
    --storeId 'lCKfjv8I' \
    --sku 'EHv1KCrh' \
    > test.out 2>&1
eval_tap $? 371 'PublicGetItemBySku' test.out

#- 372 PublicGetEstimatedPrice
./ng net.accelbyte.sdk.cli.Main platform publicGetEstimatedPrice \
    --namespace "$AB_NAMESPACE" \
    --region '446Dwzmq' \
    --storeId 'SWvc6tE7' \
    --itemIds 'U2VL7k78' \
    > test.out 2>&1
eval_tap $? 372 'PublicGetEstimatedPrice' test.out

#- 373 PublicBulkGetItems
./ng net.accelbyte.sdk.cli.Main platform publicBulkGetItems \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'DwwPZMIE' \
    --region 'SXHZn488' \
    --storeId 'Yc6kmGw8' \
    --itemIds 'YeUwshrX' \
    > test.out 2>&1
eval_tap $? 373 'PublicBulkGetItems' test.out

#- 374 PublicValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform publicValidateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --body '{"itemIds": ["zaQNKvRu", "GADHLFyh", "fWiOyMz3"]}' \
    > test.out 2>&1
eval_tap $? 374 'PublicValidateItemPurchaseCondition' test.out

#- 375 PublicSearchItems
./ng net.accelbyte.sdk.cli.Main platform publicSearchItems \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --itemType 'INGAMEITEM' \
    --limit '17' \
    --offset '89' \
    --region 'dlzPV6wj' \
    --storeId 'RGp9rRK3' \
    --keyword '3OBwJ93m' \
    --language 'zddOwo1e' \
    > test.out 2>&1
eval_tap $? 375 'PublicSearchItems' test.out

#- 376 PublicGetApp
./ng net.accelbyte.sdk.cli.Main platform publicGetApp \
    --itemId '5unjdzRf' \
    --namespace "$AB_NAMESPACE" \
    --language 'UcOQTRuq' \
    --region 'XEeeZe5L' \
    --storeId 'fM5fySom' \
    > test.out 2>&1
eval_tap $? 376 'PublicGetApp' test.out

#- 377 PublicGetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform publicGetItemDynamicData \
    --itemId '7uBGNRM0' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 377 'PublicGetItemDynamicData' test.out

#- 378 PublicGetItem
./ng net.accelbyte.sdk.cli.Main platform publicGetItem \
    --itemId 'Y2zrDZAs' \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'e1HbSxZn' \
    --populateBundle  \
    --region 'a94a4WWN' \
    --storeId 'zlzPqCK3' \
    > test.out 2>&1
eval_tap $? 378 'PublicGetItem' test.out

#- 379 GetPaymentCustomization
eval_tap 0 379 'GetPaymentCustomization # SKIP deprecated' test.out

#- 380 PublicGetPaymentUrl
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentUrl \
    --namespace "$AB_NAMESPACE" \
    --body '{"neonPayConfig": {"cancelUrl": "6PmEDrUE", "successUrl": "oTAxpFEE"}, "paymentOrderNo": "GlQkfEOl", "paymentProvider": "CHECKOUT", "returnUrl": "i3MtaCAL", "ui": "jCTxgGUH", "zipCode": "ZPxaNTGy"}' \
    > test.out 2>&1
eval_tap $? 380 'PublicGetPaymentUrl' test.out

#- 381 PublicGetPaymentMethods
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentMethods \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'V4LLKacl' \
    > test.out 2>&1
eval_tap $? 381 'PublicGetPaymentMethods' test.out

#- 382 PublicGetUnpaidPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUnpaidPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'tw6Afq0J' \
    > test.out 2>&1
eval_tap $? 382 'PublicGetUnpaidPaymentOrder' test.out

#- 383 Pay
./ng net.accelbyte.sdk.cli.Main platform pay \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '30G0iWwl' \
    --paymentProvider 'NEONPAY' \
    --zipCode 'W5WRTKKD' \
    --body '{"token": "OS4s1NQM"}' \
    > test.out 2>&1
eval_tap $? 383 'Pay' test.out

#- 384 PublicCheckPaymentOrderPaidStatus
./ng net.accelbyte.sdk.cli.Main platform publicCheckPaymentOrderPaidStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'PBjsFivV' \
    > test.out 2>&1
eval_tap $? 384 'PublicCheckPaymentOrderPaidStatus' test.out

#- 385 GetPaymentPublicConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentPublicConfig \
    --namespace "$AB_NAMESPACE" \
    --sandbox  \
    --paymentProvider 'ALIPAY' \
    --region 'eleskIVx' \
    > test.out 2>&1
eval_tap $? 385 'GetPaymentPublicConfig' test.out

#- 386 PublicGetQRCode
./ng net.accelbyte.sdk.cli.Main platform publicGetQRCode \
    --namespace "$AB_NAMESPACE" \
    --code 'TOaovSNi' \
    > test.out 2>&1
eval_tap $? 386 'PublicGetQRCode' test.out

#- 387 PublicNormalizePaymentReturnUrl
./ng net.accelbyte.sdk.cli.Main platform publicNormalizePaymentReturnUrl \
    --namespace "$AB_NAMESPACE" \
    --payerID 'cO2zlBjP' \
    --foreinginvoice 'U4TDC94h' \
    --invoiceId 'Kzfads5y' \
    --payload 'aMglJlho' \
    --redirectResult 'H11dTATj' \
    --resultCode 'uWxXVYvb' \
    --sessionId 'zTymVRrt' \
    --status 'SRopkDuM' \
    --token '66ZTutDn' \
    --type '4uZGEmO7' \
    --userId 'v3TK2JsZ' \
    --orderNo 'ANe5B6hV' \
    --paymentOrderNo 'W1t0JBH7' \
    --paymentProvider 'WXPAY' \
    --returnUrl 'IPFIXVbe' \
    > test.out 2>&1
eval_tap $? 387 'PublicNormalizePaymentReturnUrl' test.out

#- 388 GetPaymentTaxValue
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxValue \
    --namespace "$AB_NAMESPACE" \
    --zipCode 'wQhy8wAT' \
    --paymentOrderNo 'z572Ffsa' \
    --paymentProvider 'WALLET' \
    > test.out 2>&1
eval_tap $? 388 'GetPaymentTaxValue' test.out

#- 389 GetRewardByCode
./ng net.accelbyte.sdk.cli.Main platform getRewardByCode \
    --namespace "$AB_NAMESPACE" \
    --rewardCode 'DxGhBh8k' \
    > test.out 2>&1
eval_tap $? 389 'GetRewardByCode' test.out

#- 390 QueryRewards1
./ng net.accelbyte.sdk.cli.Main platform queryRewards1 \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'HhU1N0q7' \
    --limit '82' \
    --offset '73' \
    --sortBy 'namespace:desc,rewardCode,rewardCode:asc' \
    > test.out 2>&1
eval_tap $? 390 'QueryRewards1' test.out

#- 391 GetReward1
./ng net.accelbyte.sdk.cli.Main platform getReward1 \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'HgtqQXm5' \
    > test.out 2>&1
eval_tap $? 391 'GetReward1' test.out

#- 392 PublicListStores
./ng net.accelbyte.sdk.cli.Main platform publicListStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 392 'PublicListStores' test.out

#- 393 PublicExistsAnyMyActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyMyActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --appIds 'njFJBUjq,EsBI4yQ0,U2e2ffQ3' \
    --itemIds 'esIAvLA2,SbjKzskx,Kh81jc4r' \
    --skus 'acmGK05c,a4BXK7ly,kNWeShJm' \
    > test.out 2>&1
eval_tap $? 393 'PublicExistsAnyMyActiveEntitlement' test.out

#- 394 PublicGetMyAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --appId 'IBxvdmTZ' \
    > test.out 2>&1
eval_tap $? 394 'PublicGetMyAppEntitlementOwnershipByAppId' test.out

#- 395 PublicGetMyEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'ENTITLEMENT' \
    --itemId 'BznEYgMr' \
    > test.out 2>&1
eval_tap $? 395 'PublicGetMyEntitlementOwnershipByItemId' test.out

#- 396 PublicGetMyEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'OPTIONBOX' \
    --sku '1rF95Rj7' \
    > test.out 2>&1
eval_tap $? 396 'PublicGetMyEntitlementOwnershipBySku' test.out

#- 397 PublicGetEntitlementOwnershipToken
./ng net.accelbyte.sdk.cli.Main platform publicGetEntitlementOwnershipToken \
    --namespace "$AB_NAMESPACE" \
    --appIds 'GFTSznpV,gJhdw3HX,3i2CYgvf' \
    --itemIds 'SnDbr4Vj,GtB2yPwL,VlIBa84d' \
    --skus 'dL7uAkpu,51nUVHMD,gFN3ZWNp' \
    > test.out 2>&1
eval_tap $? 397 'PublicGetEntitlementOwnershipToken' test.out

#- 398 SyncTwitchDropsEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement \
    --namespace "$AB_NAMESPACE" \
    --body '{"gameId": "tdYd0P2m", "language": "Too", "region": "tC23j0o4"}' \
    > test.out 2>&1
eval_tap $? 398 'SyncTwitchDropsEntitlement' test.out

#- 399 PublicGetMyWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetMyWallet \
    --currencyCode 'O7PECdhm' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 399 'PublicGetMyWallet' test.out

#- 400 SyncEpicGameDLC
./ng net.accelbyte.sdk.cli.Main platform syncEpicGameDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'r2LhDsm9' \
    --body '{"epicGamesJwtToken": "3FQbW1wL"}' \
    > test.out 2>&1
eval_tap $? 400 'SyncEpicGameDLC' test.out

#- 401 SyncOculusDLC
./ng net.accelbyte.sdk.cli.Main platform syncOculusDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'VaAQJD8v' \
    > test.out 2>&1
eval_tap $? 401 'SyncOculusDLC' test.out

#- 402 PublicSyncPsnDlcInventory
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventory \
    --namespace "$AB_NAMESPACE" \
    --userId '60mNYyHr' \
    --body '{"serviceLabel": 35}' \
    > test.out 2>&1
eval_tap $? 402 'PublicSyncPsnDlcInventory' test.out

#- 403 PublicSyncPsnDlcInventoryWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventoryWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ac29ipnV' \
    --body '{"serviceLabels": [35, 77, 78]}' \
    > test.out 2>&1
eval_tap $? 403 'PublicSyncPsnDlcInventoryWithMultipleServiceLabels' test.out

#- 404 SyncSteamDLC
./ng net.accelbyte.sdk.cli.Main platform syncSteamDLC \
    --namespace "$AB_NAMESPACE" \
    --userId '1tU7qNcd' \
    --body '{"appId": "DN7v0B2p", "steamId": "BW6gg2nI"}' \
    > test.out 2>&1
eval_tap $? 404 'SyncSteamDLC' test.out

#- 405 SyncXboxDLC
./ng net.accelbyte.sdk.cli.Main platform syncXboxDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'pcqA1RIT' \
    --body '{"xstsToken": "g6ewpxB8"}' \
    > test.out 2>&1
eval_tap $? 405 'SyncXboxDLC' test.out

#- 406 PublicQueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'SUrUvrmW' \
    --appType 'GAME' \
    --entitlementClazz 'CODE' \
    --entitlementName 'TfulrsSe' \
    --features 'OT229WQz,R36nz0jj,LaYWlA4G' \
    --itemId 'fiC24LHQ,5X7CGTaS,XnKz1Ipn' \
    --limit '86' \
    --offset '90' \
    > test.out 2>&1
eval_tap $? 406 'PublicQueryUserEntitlements' test.out

#- 407 PublicGetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId '8UWUH83c' \
    --appId 'uWpOrvmo' \
    > test.out 2>&1
eval_tap $? 407 'PublicGetUserAppEntitlementByAppId' test.out

#- 408 PublicQueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'vs6WNbr6' \
    --limit '94' \
    --offset '6' \
    --appType 'DEMO' \
    > test.out 2>&1
eval_tap $? 408 'PublicQueryUserEntitlementsByAppType' test.out

#- 409 PublicGetUserEntitlementsByIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementsByIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'PP34Ug0o' \
    --availablePlatformOnly  \
    --ids 'qbpbqK9b,YfAbgUSK,WaTlYCUE' \
    > test.out 2>&1
eval_tap $? 409 'PublicGetUserEntitlementsByIds' test.out

#- 410 PublicGetUserEntitlementByItemId
eval_tap 0 410 'PublicGetUserEntitlementByItemId # SKIP deprecated' test.out

#- 411 PublicGetUserEntitlementBySku
eval_tap 0 411 'PublicGetUserEntitlementBySku # SKIP deprecated' test.out

#- 412 PublicUserEntitlementHistory
./ng net.accelbyte.sdk.cli.Main platform publicUserEntitlementHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'IzNDeWjv' \
    --endDate 'GGpbamZ8' \
    --entitlementClazz 'CODE' \
    --limit '36' \
    --offset '70' \
    --startDate 'pF3gEir1' \
    > test.out 2>&1
eval_tap $? 412 'PublicUserEntitlementHistory' test.out

#- 413 PublicExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'ibBPcxFY' \
    --appIds 'ganS3T1y,EMNtQ9wD,uXo1xSsQ' \
    --itemIds 'V7rOs8J6,xtg6mUU0,dkWLhTMJ' \
    --skus 'r1UdXdUY,i8FJMp8N,YdTARO5J' \
    > test.out 2>&1
eval_tap $? 413 'PublicExistsAnyUserActiveEntitlement' test.out

#- 414 PublicGetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'ylP6WxLh' \
    --appId 'DPFhPf5S' \
    > test.out 2>&1
eval_tap $? 414 'PublicGetUserAppEntitlementOwnershipByAppId' test.out

#- 415 PublicGetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'k0Wr5wG2' \
    --entitlementClazz 'OPTIONBOX' \
    --itemId 'R9U5fJwr' \
    > test.out 2>&1
eval_tap $? 415 'PublicGetUserEntitlementOwnershipByItemId' test.out

#- 416 PublicGetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId '86ft3inR' \
    --ids '2MWgK06A,8sgbx5t2,gDunvbA1' \
    > test.out 2>&1
eval_tap $? 416 'PublicGetUserEntitlementOwnershipByItemIds' test.out

#- 417 PublicGetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'BdHtMiTM' \
    --entitlementClazz 'MEDIA' \
    --sku 'KSqcXvu1' \
    > test.out 2>&1
eval_tap $? 417 'PublicGetUserEntitlementOwnershipBySku' test.out

#- 418 PublicGetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlement \
    --entitlementId '0k7qE6C0' \
    --namespace "$AB_NAMESPACE" \
    --userId 'v82KVGfM' \
    > test.out 2>&1
eval_tap $? 418 'PublicGetUserEntitlement' test.out

#- 419 PublicConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicConsumeUserEntitlement \
    --entitlementId 'Mhi7dYMx' \
    --namespace "$AB_NAMESPACE" \
    --userId 'i3CIU0DC' \
    --body '{"options": ["mc9WNF4N", "qL0eJVIy", "oQ6j7tag"], "requestId": "Di1UEDCg", "useCount": 31}' \
    > test.out 2>&1
eval_tap $? 419 'PublicConsumeUserEntitlement' test.out

#- 420 PublicSellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicSellUserEntitlement \
    --entitlementId 'Iraj0SEI' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ql3wDsX8' \
    --body '{"requestId": "35E5JwKg", "useCount": 56}' \
    > test.out 2>&1
eval_tap $? 420 'PublicSellUserEntitlement' test.out

#- 421 PublicSplitUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicSplitUserEntitlement \
    --entitlementId 'AeA7lcBE' \
    --namespace "$AB_NAMESPACE" \
    --userId 'jk5Opmtd' \
    --body '{"useCount": 56}' \
    > test.out 2>&1
eval_tap $? 421 'PublicSplitUserEntitlement' test.out

#- 422 PublicTransferUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicTransferUserEntitlement \
    --entitlementId 'Jv0ITeQV' \
    --namespace "$AB_NAMESPACE" \
    --userId 'GW9zvHjZ' \
    --body '{"entitlementId": "XeIDCSzj", "useCount": 85}' \
    > test.out 2>&1
eval_tap $? 422 'PublicTransferUserEntitlement' test.out

#- 423 PublicRedeemCode
./ng net.accelbyte.sdk.cli.Main platform publicRedeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'h3b8WUXw' \
    --body '{"code": "NU8Vw8TD", "language": "sn-zOgS-bj", "region": "MVirxchT"}' \
    > test.out 2>&1
eval_tap $? 423 'PublicRedeemCode' test.out

#- 424 PublicFulfillAppleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillAppleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'OBK9VYCG' \
    --body '{"excludeOldTransactions": false, "language": "cNNL", "productId": "s7uTupfK", "receiptData": "eEqNCtVa", "region": "ZhOb8WzB", "transactionId": "UnPnh2lH"}' \
    > test.out 2>&1
eval_tap $? 424 'PublicFulfillAppleIAPItem' test.out

#- 425 SyncEpicGamesInventory
./ng net.accelbyte.sdk.cli.Main platform syncEpicGamesInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 's2m0sTdV' \
    --body '{"epicGamesJwtToken": "ETE6Ny3E"}' \
    > test.out 2>&1
eval_tap $? 425 'SyncEpicGamesInventory' test.out

#- 426 PublicFulfillGoogleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillGoogleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'AfhJOwBf' \
    --body '{"autoAck": false, "language": "wZcV", "orderId": "A3jZ7nO7", "packageName": "UUqkZybM", "productId": "m45MxYLa", "purchaseTime": 42, "purchaseToken": "QRRvvJbY", "region": "fAyr8ELf"}' \
    > test.out 2>&1
eval_tap $? 426 'PublicFulfillGoogleIAPItem' test.out

#- 427 SyncOculusConsumableEntitlements
./ng net.accelbyte.sdk.cli.Main platform syncOculusConsumableEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'hupnihxI' \
    > test.out 2>&1
eval_tap $? 427 'SyncOculusConsumableEntitlements' test.out

#- 428 PublicReconcilePlayStationStore
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStore \
    --namespace "$AB_NAMESPACE" \
    --userId '6BEtn2mu' \
    --body '{"currencyCode": "cV0WwNpx", "price": 0.013379736321827651, "productId": "hrk5QAfd", "serviceLabel": 64}' \
    > test.out 2>&1
eval_tap $? 428 'PublicReconcilePlayStationStore' test.out

#- 429 PublicReconcilePlayStationStoreWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStoreWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZoMmdlE2' \
    --body '{"currencyCode": "BaP2Higk", "price": 0.3466551302877968, "productId": "qJYcdyKH", "serviceLabels": [50, 19, 66]}' \
    > test.out 2>&1
eval_tap $? 429 'PublicReconcilePlayStationStoreWithMultipleServiceLabels' test.out

#- 430 SyncSteamInventory
./ng net.accelbyte.sdk.cli.Main platform syncSteamInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'FZKAwp7d' \
    --body '{"appId": "MGkb4oZ0", "currencyCode": "PwvQU3y0", "language": "sevW_AY", "price": 0.943703997377044, "productId": "qPcMZJvK", "region": "hiCIoL3f", "steamId": "C63PgVT5"}' \
    > test.out 2>&1
eval_tap $? 430 'SyncSteamInventory' test.out

#- 431 SyncTwitchDropsEntitlement1
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'DMXELX2z' \
    --body '{"gameId": "syKRmPtj", "language": "iI_wbJQ", "region": "PYJLtgYj"}' \
    > test.out 2>&1
eval_tap $? 431 'SyncTwitchDropsEntitlement1' test.out

#- 432 SyncXboxInventory
./ng net.accelbyte.sdk.cli.Main platform syncXboxInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'yy8e0zuo' \
    --body '{"currencyCode": "3UVbNbS8", "price": 0.5453888952960716, "productId": "9gXqn5l2", "xstsToken": "Ej1QGb7A"}' \
    > test.out 2>&1
eval_tap $? 432 'SyncXboxInventory' test.out

#- 433 PublicQueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'kZaWFh5h' \
    --discounted  \
    --itemId 'HdTfQ9V9' \
    --limit '68' \
    --offset '89' \
    --status 'FULFILLED' \
    > test.out 2>&1
eval_tap $? 433 'PublicQueryUserOrders' test.out

#- 434 PublicCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'mVUvKrMe' \
    --body '{"currencyCode": "hwgsblbm", "discountCodes": ["aBSQO5Oq", "cy3pN6Kh", "gNM1Kmp8"], "discountedPrice": 79, "ext": {"Cs4guDMB": {}, "h9XjQBfr": {}, "jH3wuZqd": {}}, "itemId": "o9ZLlqwV", "language": "RUW_PsCr", "price": 47, "quantity": 52, "region": "OeF4iOEt", "returnUrl": "ELuK8WQ1", "sectionId": "xky0NPST"}' \
    > test.out 2>&1
eval_tap $? 434 'PublicCreateUserOrder' test.out

#- 435 PublicPreviewOrderPrice
./ng net.accelbyte.sdk.cli.Main platform publicPreviewOrderPrice \
    --namespace "$AB_NAMESPACE" \
    --userId 'dphZGODa' \
    --body '{"currencyCode": "OV2s1gWW", "discountCodes": ["Zddt4Tz7", "Zv2rt3te", "sov99sCv"], "discountedPrice": 22, "itemId": "raem6axV", "price": 56, "quantity": 78}' \
    > test.out 2>&1
eval_tap $? 435 'PublicPreviewOrderPrice' test.out

#- 436 PublicGetUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'YRVzi5O2' \
    --userId 'a9Ia2Hfw' \
    > test.out 2>&1
eval_tap $? 436 'PublicGetUserOrder' test.out

#- 437 PublicCancelUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCancelUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'XSkW46Ks' \
    --userId 'dzNQd30Q' \
    > test.out 2>&1
eval_tap $? 437 'PublicCancelUserOrder' test.out

#- 438 PublicGetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'b4tkfFWr' \
    --userId 'wrZpq5EG' \
    > test.out 2>&1
eval_tap $? 438 'PublicGetUserOrderHistories' test.out

#- 439 PublicDownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform publicDownloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo '2JQN2SkB' \
    --userId 'VVxfMWrE' \
    > test.out 2>&1
eval_tap $? 439 'PublicDownloadUserOrderReceipt' test.out

#- 440 PublicGetPaymentAccounts
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'BjsDr9gG' \
    > test.out 2>&1
eval_tap $? 440 'PublicGetPaymentAccounts' test.out

#- 441 PublicDeletePaymentAccount
./ng net.accelbyte.sdk.cli.Main platform publicDeletePaymentAccount \
    --id 'GQNnix4q' \
    --namespace "$AB_NAMESPACE" \
    --type 'paypal' \
    --userId 'fNwOj1Ae' \
    > test.out 2>&1
eval_tap $? 441 'PublicDeletePaymentAccount' test.out

#- 442 PublicListActiveSections
./ng net.accelbyte.sdk.cli.Main platform publicListActiveSections \
    --namespace "$AB_NAMESPACE" \
    --userId 'DkusgiQd' \
    --autoCalcEstimatedPrice  \
    --language '7zIih29x' \
    --region '4vAcur0I' \
    --storeId 'jfWrXf9z' \
    --viewId 'qrLqDXeo' \
    > test.out 2>&1
eval_tap $? 442 'PublicListActiveSections' test.out

#- 443 PublicQueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'gmhfvXjf' \
    --chargeStatus 'SETUP' \
    --itemId 'BuhdpHR1' \
    --limit '26' \
    --offset '83' \
    --sku 'dDkmnQtr' \
    --status 'ACTIVE' \
    --subscribedBy 'USER' \
    > test.out 2>&1
eval_tap $? 443 'PublicQueryUserSubscriptions' test.out

#- 444 PublicSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform publicSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'NWkQjR10' \
    --body '{"currencyCode": "IXPz3BXR", "itemId": "JtGfHjLQ", "language": "PRpR_lQKw-911", "region": "zuRe59n5", "returnUrl": "97PmDgPx", "source": "hrZTY9oS"}' \
    > test.out 2>&1
eval_tap $? 444 'PublicSubscribeSubscription' test.out

#- 445 PublicCheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform publicCheckUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'ooafC1Y1' \
    --itemId 'fGLVmjU4' \
    > test.out 2>&1
eval_tap $? 445 'PublicCheckUserSubscriptionSubscribableByItemId' test.out

#- 446 PublicGetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'eRPIazGI' \
    --userId 'lcOXKJxZ' \
    > test.out 2>&1
eval_tap $? 446 'PublicGetUserSubscription' test.out

#- 447 PublicChangeSubscriptionBillingAccount
./ng net.accelbyte.sdk.cli.Main platform publicChangeSubscriptionBillingAccount \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'qbKqfwUZ' \
    --userId 'RMoKZojM' \
    > test.out 2>&1
eval_tap $? 447 'PublicChangeSubscriptionBillingAccount' test.out

#- 448 PublicCancelSubscription
./ng net.accelbyte.sdk.cli.Main platform publicCancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '2AnLVNcM' \
    --userId 'XpxGe2Ug' \
    --body '{"immediate": false, "reason": "mr2R4f4V"}' \
    > test.out 2>&1
eval_tap $? 448 'PublicCancelSubscription' test.out

#- 449 PublicGetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'MhVrCU8Z' \
    --userId '2iYw0Bhy' \
    --excludeFree  \
    --limit '2' \
    --offset '32' \
    > test.out 2>&1
eval_tap $? 449 'PublicGetUserSubscriptionBillingHistories' test.out

#- 450 PublicListViews
./ng net.accelbyte.sdk.cli.Main platform publicListViews \
    --namespace "$AB_NAMESPACE" \
    --userId 's319dsFF' \
    --language 'rFZCCpKP' \
    --storeId 'G3P7aJtM' \
    > test.out 2>&1
eval_tap $? 450 'PublicListViews' test.out

#- 451 PublicGetWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetWallet \
    --currencyCode 'CGSpDwwX' \
    --namespace "$AB_NAMESPACE" \
    --userId 'oT9Au4Y2' \
    > test.out 2>&1
eval_tap $? 451 'PublicGetWallet' test.out

#- 452 PublicListUserWalletTransactions
./ng net.accelbyte.sdk.cli.Main platform publicListUserWalletTransactions \
    --currencyCode 'NvIwW1uZ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'dPdCTrdc' \
    --limit '1' \
    --offset '5' \
    > test.out 2>&1
eval_tap $? 452 'PublicListUserWalletTransactions' test.out

#- 453 QueryItemsV2
./ng net.accelbyte.sdk.cli.Main platform queryItemsV2 \
    --namespace "$AB_NAMESPACE" \
    --appType 'DEMO' \
    --availableDate 'KcCrdPUt' \
    --baseAppId '5hsbCFzi' \
    --categoryPath 'uS5Qx1pP' \
    --features 'bFzEdiAU' \
    --includeSubCategoryItem  \
    --itemName 'ZQkHNU1P' \
    --itemStatus 'INACTIVE' \
    --itemType 'SEASON,OPTIONBOX,APP' \
    --limit '82' \
    --offset '51' \
    --region 'GZT6JcBT' \
    --sectionExclusive  \
    --sortBy 'displayOrder,updatedAt,name:desc' \
    --storeId 'e4a2bH36' \
    --tags 'tfIk2ZO5' \
    --targetNamespace '5H2dFmr8' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 453 'QueryItemsV2' test.out

#- 454 ImportStore1
./ng net.accelbyte.sdk.cli.Main platform importStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'xw722qxK' \
    --strictMode  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 454 'ImportStore1' test.out

#- 455 ExportStore1
./ng net.accelbyte.sdk.cli.Main platform exportStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'nDU7tGkw' \
    --body '{"itemIds": ["EcKqb9O3", "8hbo2UUY", "EZWFQHB2"]}' \
    > test.out 2>&1
eval_tap $? 455 'ExportStore1' test.out

#- 456 FulfillRewardsV2
./ng net.accelbyte.sdk.cli.Main platform fulfillRewardsV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'mCqkuzLg' \
    --body '{"entitlementCollectionId": "Su3W6MSI", "entitlementOrigin": "System", "metadata": {"JmDA60oJ": {}, "12siB96k": {}, "MZDs4jT9": {}}, "origin": "Oculus", "rewards": [{"currency": {"currencyCode": "13I1nLjS", "namespace": "QOEOLJEb"}, "item": {"itemId": "kgs0PcxA", "itemSku": "WL4n5Qn6", "itemType": "ZFpzMlqK"}, "quantity": 88, "type": "ITEM"}, {"currency": {"currencyCode": "292qgMlT", "namespace": "KWQ6J1vl"}, "item": {"itemId": "IDldwUtM", "itemSku": "D8HeYTBQ", "itemType": "7Jb5xlPQ"}, "quantity": 24, "type": "CURRENCY"}, {"currency": {"currencyCode": "hSsy6s4j", "namespace": "iWWgkjnD"}, "item": {"itemId": "nmR9AV3A", "itemSku": "Y54MLoFH", "itemType": "6Xd1Zd16"}, "quantity": 46, "type": "CURRENCY"}], "source": "CONSUME_ENTITLEMENT", "transactionId": "Bguj1AVw"}' \
    > test.out 2>&1
eval_tap $? 456 'FulfillRewardsV2' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
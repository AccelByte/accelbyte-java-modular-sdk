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
    --id 'MY48X0A6' \
    > test.out 2>&1
eval_tap $? 3 'GetFulfillmentScript' test.out

#- 4 CreateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform createFulfillmentScript \
    --id 'lqXlVGrm' \
    --body '{"grantDays": "7QthLUxP"}' \
    > test.out 2>&1
eval_tap $? 4 'CreateFulfillmentScript' test.out

#- 5 DeleteFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform deleteFulfillmentScript \
    --id 'hWWurA6p' \
    > test.out 2>&1
eval_tap $? 5 'DeleteFulfillmentScript' test.out

#- 6 UpdateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform updateFulfillmentScript \
    --id 't97KaRii' \
    --body '{"grantDays": "6pRxzfvD"}' \
    > test.out 2>&1
eval_tap $? 6 'UpdateFulfillmentScript' test.out

#- 7 ListItemTypeConfigs
./ng net.accelbyte.sdk.cli.Main platform listItemTypeConfigs \
    > test.out 2>&1
eval_tap $? 7 'ListItemTypeConfigs' test.out

#- 8 CreateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform createItemTypeConfig \
    --body '{"clazz": "YoPvQkZI", "dryRun": true, "fulfillmentUrl": "lMFc5sTk", "itemType": "OPTIONBOX", "purchaseConditionUrl": "DCxPzAvB"}' \
    > test.out 2>&1
eval_tap $? 8 'CreateItemTypeConfig' test.out

#- 9 SearchItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform searchItemTypeConfig \
    --clazz '2ltbffky' \
    --itemType 'CODE' \
    > test.out 2>&1
eval_tap $? 9 'SearchItemTypeConfig' test.out

#- 10 GetItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform getItemTypeConfig \
    --id '3vcblss8' \
    > test.out 2>&1
eval_tap $? 10 'GetItemTypeConfig' test.out

#- 11 UpdateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform updateItemTypeConfig \
    --id 'TdUM6psF' \
    --body '{"clazz": "qyNikKNe", "dryRun": true, "fulfillmentUrl": "YSiGyMon", "purchaseConditionUrl": "ynmtwPG9"}' \
    > test.out 2>&1
eval_tap $? 11 'UpdateItemTypeConfig' test.out

#- 12 DeleteItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform deleteItemTypeConfig \
    --id 'bKtZxGmY' \
    > test.out 2>&1
eval_tap $? 12 'DeleteItemTypeConfig' test.out

#- 13 QueryCampaigns
./ng net.accelbyte.sdk.cli.Main platform queryCampaigns \
    --namespace "$AB_NAMESPACE" \
    --limit '15' \
    --name 'zxi9WxRR' \
    --offset '62' \
    --tag 'dn0RMx0z' \
    > test.out 2>&1
eval_tap $? 13 'QueryCampaigns' test.out

#- 14 CreateCampaign
./ng net.accelbyte.sdk.cli.Main platform createCampaign \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "9hVUQA3j", "discountConfig": {"categories": [{"categoryPath": "Ex6AKOTP", "includeSubCategories": false}, {"categoryPath": "ai2jxC4D", "includeSubCategories": true}, {"categoryPath": "3lCxbCTx", "includeSubCategories": false}], "currencyCode": "ApAfkBRi", "currencyNamespace": "zFtdSOSs", "discountAmount": 32, "discountPercentage": 31, "discountType": "AMOUNT", "items": [{"itemId": "HFcRhbur", "itemName": "64sB0FGW"}, {"itemId": "qhle0PIk", "itemName": "PRUNhdVS"}, {"itemId": "mJySFM8a", "itemName": "qM1wXfmm"}], "restrictType": "ITEMS_AND_CATEGORIES", "stackable": false}, "items": [{"extraSubscriptionDays": 67, "itemId": "dF524XCd", "itemName": "WPs7ALfe", "quantity": 11}, {"extraSubscriptionDays": 72, "itemId": "2yWxkNHv", "itemName": "p1YLtX16", "quantity": 59}, {"extraSubscriptionDays": 84, "itemId": "VLfVApxV", "itemName": "wNFZ6pVO", "quantity": 72}], "maxRedeemCountPerCampaignPerUser": 58, "maxRedeemCountPerCode": 86, "maxRedeemCountPerCodePerUser": 86, "maxSaleCount": 35, "name": "3iY6qJnV", "redeemEnd": "1992-02-11T00:00:00Z", "redeemStart": "1996-12-14T00:00:00Z", "redeemType": "DISCOUNT", "status": "ACTIVE", "tags": ["Ksm6jsRh", "ztcXVIp0", "jpzpgqZQ"], "type": "REDEMPTION"}' \
    > test.out 2>&1
eval_tap $? 14 'CreateCampaign' test.out

#- 15 GetCampaign
./ng net.accelbyte.sdk.cli.Main platform getCampaign \
    --campaignId 'rMXFH5ZX' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'GetCampaign' test.out

#- 16 UpdateCampaign
./ng net.accelbyte.sdk.cli.Main platform updateCampaign \
    --campaignId 'S230EAjq' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "oXGf5pf3", "discountConfig": {"categories": [{"categoryPath": "u3UI1yy4", "includeSubCategories": false}, {"categoryPath": "B2ipE6qg", "includeSubCategories": true}, {"categoryPath": "CTq9IB6c", "includeSubCategories": true}], "currencyCode": "s0ihHW39", "currencyNamespace": "gNojp2g3", "discountAmount": 92, "discountPercentage": 54, "discountType": "PERCENTAGE", "items": [{"itemId": "QUqlW2N8", "itemName": "e50uh5lD"}, {"itemId": "jSeR6W1v", "itemName": "ZBnz6bZn"}, {"itemId": "zThtsVTL", "itemName": "7axAJT5i"}], "restrictType": "ITEMS_AND_CATEGORIES", "stackable": true}, "items": [{"extraSubscriptionDays": 57, "itemId": "wuBzoVPJ", "itemName": "ZuEa95ZG", "quantity": 56}, {"extraSubscriptionDays": 65, "itemId": "zQH69eF2", "itemName": "nTLFzBex", "quantity": 25}, {"extraSubscriptionDays": 12, "itemId": "lsJRlPC7", "itemName": "E124MW2Z", "quantity": 7}], "maxRedeemCountPerCampaignPerUser": 54, "maxRedeemCountPerCode": 32, "maxRedeemCountPerCodePerUser": 11, "maxSaleCount": 22, "name": "WHbq9ajC", "redeemEnd": "1989-03-07T00:00:00Z", "redeemStart": "1978-05-12T00:00:00Z", "redeemType": "DISCOUNT", "status": "INACTIVE", "tags": ["TjAZhntT", "htKdefeC", "hIjmLDac"]}' \
    > test.out 2>&1
eval_tap $? 16 'UpdateCampaign' test.out

#- 17 RenameBatch
./ng net.accelbyte.sdk.cli.Main platform renameBatch \
    --campaignId '0lhvSnbC' \
    --namespace "$AB_NAMESPACE" \
    --body '{"newName": "L9zY7FTV", "oldName": "ZiodH81E"}' \
    > test.out 2>&1
eval_tap $? 17 'RenameBatch' test.out

#- 18 QueryCampaignBatchNames
./ng net.accelbyte.sdk.cli.Main platform queryCampaignBatchNames \
    --campaignId 'u4DLbpor' \
    --namespace "$AB_NAMESPACE" \
    --batchName 'sQmdn8rP' \
    --limit '15' \
    > test.out 2>&1
eval_tap $? 18 'QueryCampaignBatchNames' test.out

#- 19 GetCampaignDynamic
./ng net.accelbyte.sdk.cli.Main platform getCampaignDynamic \
    --campaignId '1FRSvgID' \
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
    --body '{"enableInventoryCheck": false, "itemDeletionCheckConfig": ["CATALOG", "CAMPAIGN", "REWARD"]}' \
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
    --body '{"appConfig": {"appName": "ngx5GI0H"}, "customConfig": {"connectionType": "INSECURE", "grpcServerAddress": "FyQplEt1"}, "extendType": "APP"}' \
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
    --body '{"appConfig": {"appName": "Dzz9q7yT"}, "customConfig": {"connectionType": "INSECURE", "grpcServerAddress": "mOtI1KEF"}, "extendType": "APP"}' \
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
    --storeId 'dl2gxBEw' \
    > test.out 2>&1
eval_tap $? 31 'GetRootCategories' test.out

#- 32 CreateCategory
./ng net.accelbyte.sdk.cli.Main platform createCategory \
    --namespace "$AB_NAMESPACE" \
    --storeId 'tPIaxYBM' \
    --body '{"categoryPath": "kaQ9W2Pm", "localizationDisplayNames": {"HbQS8Txk": "bdGD9Ruo", "HUWsO5lW": "z1zm2h9e", "1VeijPMc": "Ei1fw8qI"}}' \
    > test.out 2>&1
eval_tap $? 32 'CreateCategory' test.out

#- 33 ListCategoriesBasic
./ng net.accelbyte.sdk.cli.Main platform listCategoriesBasic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'LBVh96VO' \
    > test.out 2>&1
eval_tap $? 33 'ListCategoriesBasic' test.out

#- 34 GetCategory
./ng net.accelbyte.sdk.cli.Main platform getCategory \
    --categoryPath 'dgtWY2zt' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'm1byMp4X' \
    > test.out 2>&1
eval_tap $? 34 'GetCategory' test.out

#- 35 UpdateCategory
./ng net.accelbyte.sdk.cli.Main platform updateCategory \
    --categoryPath 'Ko3Cott5' \
    --namespace "$AB_NAMESPACE" \
    --storeId '2ExCQozt' \
    --body '{"localizationDisplayNames": {"HAbPruOb": "hc6Sta5J", "WToJLZXQ": "Ph6GwHXr", "8jZsRvMm": "wTj8Fb88"}}' \
    > test.out 2>&1
eval_tap $? 35 'UpdateCategory' test.out

#- 36 DeleteCategory
./ng net.accelbyte.sdk.cli.Main platform deleteCategory \
    --categoryPath 'f2FfDURc' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ECzdbvhj' \
    > test.out 2>&1
eval_tap $? 36 'DeleteCategory' test.out

#- 37 GetChildCategories
./ng net.accelbyte.sdk.cli.Main platform getChildCategories \
    --categoryPath '73yxKKBM' \
    --namespace "$AB_NAMESPACE" \
    --storeId '07TpmGCc' \
    > test.out 2>&1
eval_tap $? 37 'GetChildCategories' test.out

#- 38 GetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform getDescendantCategories \
    --categoryPath 'GyuXVGUe' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'V4dD2tYl' \
    > test.out 2>&1
eval_tap $? 38 'GetDescendantCategories' test.out

#- 39 QueryCodes
./ng net.accelbyte.sdk.cli.Main platform queryCodes \
    --campaignId 'ymbFmXjg' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --batchName '8FVmAM4o' \
    --batchNo '56,85,85' \
    --code 'p4GWYwRK' \
    --limit '79' \
    --offset '81' \
    --withBatchName  \
    > test.out 2>&1
eval_tap $? 39 'QueryCodes' test.out

#- 40 CreateCodes
./ng net.accelbyte.sdk.cli.Main platform createCodes \
    --campaignId 't6repbR4' \
    --namespace "$AB_NAMESPACE" \
    --body '{"batchName": "Up5VT1Jh", "codeValue": "W5367sdc", "quantity": 35}' \
    > test.out 2>&1
eval_tap $? 40 'CreateCodes' test.out

#- 41 Download
./ng net.accelbyte.sdk.cli.Main platform download \
    --campaignId 'bmq0iFnx' \
    --namespace "$AB_NAMESPACE" \
    --batchName 'YCjGe9QP' \
    --batchNo '37,20,49' \
    --withBatchName  \
    > test.out 2>&1
eval_tap $? 41 'Download' test.out

#- 42 BulkDisableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkDisableCodes \
    --campaignId 'EedIVXfe' \
    --namespace "$AB_NAMESPACE" \
    --batchName 'tRQ1X1B6' \
    --batchNo '34,80,100' \
    > test.out 2>&1
eval_tap $? 42 'BulkDisableCodes' test.out

#- 43 BulkEnableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkEnableCodes \
    --campaignId '0Vu8NutA' \
    --namespace "$AB_NAMESPACE" \
    --batchName 'xuZ48H1H' \
    --batchNo '49,24,21' \
    > test.out 2>&1
eval_tap $? 43 'BulkEnableCodes' test.out

#- 44 QueryRedeemHistory
./ng net.accelbyte.sdk.cli.Main platform queryRedeemHistory \
    --campaignId 'WR0EX2nI' \
    --namespace "$AB_NAMESPACE" \
    --code 'DHOMU8xv' \
    --limit '75' \
    --offset '35' \
    --userId 'UgzO2T91' \
    > test.out 2>&1
eval_tap $? 44 'QueryRedeemHistory' test.out

#- 45 GetCode
./ng net.accelbyte.sdk.cli.Main platform getCode \
    --code '6lzyWffJ' \
    --namespace "$AB_NAMESPACE" \
    --redeemable  \
    --withBatchName  \
    > test.out 2>&1
eval_tap $? 45 'GetCode' test.out

#- 46 DisableCode
./ng net.accelbyte.sdk.cli.Main platform disableCode \
    --code 'id5bZMVC' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 46 'DisableCode' test.out

#- 47 EnableCode
./ng net.accelbyte.sdk.cli.Main platform enableCode \
    --code 'cRj6VdrE' \
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
    --body '{"currencyCode": "2u9aTy5J", "currencySymbol": "X9LuahVZ", "currencyType": "REAL", "decimals": 29, "localizationDescriptions": {"s1tl489R": "fZ8IzpkX", "EWlMAaXt": "ooImg2pP", "0rEdtJLi": "zsn0UwF8"}}' \
    > test.out 2>&1
eval_tap $? 52 'CreateCurrency' test.out

#- 53 UpdateCurrency
./ng net.accelbyte.sdk.cli.Main platform updateCurrency \
    --currencyCode 'fo7v1mAZ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"localizationDescriptions": {"ZOVQOJUu": "rrKUh93E", "FwlvaxuL": "aKPIxEls", "0p05xMwe": "D1AwlzZD"}}' \
    > test.out 2>&1
eval_tap $? 53 'UpdateCurrency' test.out

#- 54 DeleteCurrency
./ng net.accelbyte.sdk.cli.Main platform deleteCurrency \
    --currencyCode 'bGVpWNwg' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 54 'DeleteCurrency' test.out

#- 55 GetCurrencyConfig
./ng net.accelbyte.sdk.cli.Main platform getCurrencyConfig \
    --currencyCode 'PXnGai5Y' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 55 'GetCurrencyConfig' test.out

#- 56 GetCurrencySummary
./ng net.accelbyte.sdk.cli.Main platform getCurrencySummary \
    --currencyCode 'vP8iY4uE' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 56 'GetCurrencySummary' test.out

#- 57 GetDLCItemConfigHistory
./ng net.accelbyte.sdk.cli.Main platform getDLCItemConfigHistory \
    --namespace "$AB_NAMESPACE" \
    --dlcId 'Di7wC0wg' \
    > test.out 2>&1
eval_tap $? 57 'GetDLCItemConfigHistory' test.out

#- 58 RestoreDLCItemConfigHistory
./ng net.accelbyte.sdk.cli.Main platform restoreDLCItemConfigHistory \
    --id 'zcSHPWix' \
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
    --body '{"data": [{"autoUpdate": true, "enableRevocation": false, "id": "FyssrBWG", "rewards": [{"currency": {"currencyCode": "Htzt7kCm", "namespace": "uR6gyViZ"}, "item": {"itemId": "CPyoklE4", "itemName": "A5k09aMn", "itemSku": "RIAIRHbP", "itemType": "bTApvgen"}, "quantity": 68, "type": "ITEM"}, {"currency": {"currencyCode": "k8PMPA3j", "namespace": "VSkj65QK"}, "item": {"itemId": "roHrseL2", "itemName": "cVqSwCPI", "itemSku": "vWXCgni0", "itemType": "xxKbfY95"}, "quantity": 54, "type": "ITEM"}, {"currency": {"currencyCode": "Mews0PZk", "namespace": "guf4kueL"}, "item": {"itemId": "TU8L9UES", "itemName": "4UaRygLl", "itemSku": "O4qhL4UZ", "itemType": "htdKheOf"}, "quantity": 77, "type": "ITEM"}], "rvn": 87}, {"autoUpdate": false, "enableRevocation": true, "id": "NMZgvm2D", "rewards": [{"currency": {"currencyCode": "3UugVxUE", "namespace": "85jR8hna"}, "item": {"itemId": "0496hYan", "itemName": "3ELPr62A", "itemSku": "fc8NctYO", "itemType": "zMc8rJfd"}, "quantity": 25, "type": "ITEM"}, {"currency": {"currencyCode": "VcdcHJzW", "namespace": "sjx6sYDE"}, "item": {"itemId": "mUAwFfhq", "itemName": "GEGDnvSa", "itemSku": "OmhL5e4r", "itemType": "2frYAUkj"}, "quantity": 58, "type": "CURRENCY"}, {"currency": {"currencyCode": "zlhHF2ci", "namespace": "rpt7UFk5"}, "item": {"itemId": "BjtakMhU", "itemName": "s7OHbzH4", "itemSku": "idoilhku", "itemType": "qNrCWsjS"}, "quantity": 32, "type": "CURRENCY"}], "rvn": 28}, {"autoUpdate": true, "enableRevocation": false, "id": "VvLO7aqS", "rewards": [{"currency": {"currencyCode": "KPVNgn8V", "namespace": "5wxOEzSk"}, "item": {"itemId": "i7I9iEMH", "itemName": "8kYWCnyQ", "itemSku": "A2heVnyc", "itemType": "6W0pQJ4X"}, "quantity": 61, "type": "CURRENCY"}, {"currency": {"currencyCode": "CNstz4RB", "namespace": "NcMExUQU"}, "item": {"itemId": "XRX4sfz5", "itemName": "KvIY4Xby", "itemSku": "TfryAf2L", "itemType": "jH2cozdv"}, "quantity": 2, "type": "CURRENCY"}, {"currency": {"currencyCode": "nXh71TBN", "namespace": "nZat32LO"}, "item": {"itemId": "H02IzDHY", "itemName": "QTHjmFfX", "itemSku": "RPjhtUHY", "itemType": "VwjFn70J"}, "quantity": 47, "type": "ITEM"}], "rvn": 50}]}' \
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
    --body '{"data": [{"platform": "PSN", "platformDlcIdMap": {"RtjlDNFW": "elKHhURg", "yr89joLK": "pS0XZyua", "4I4Ax74w": "dTehfMvP"}}, {"platform": "EPICGAMES", "platformDlcIdMap": {"C5vsRKLh": "aimxKqLd", "PyOpfDiL": "oYmNcVQm", "2LyEjKer": "3Rz7tKuU"}}, {"platform": "STEAM", "platformDlcIdMap": {"khwFcXqB": "ajUr4SR5", "fI6dGlmr": "e2dtIG8H", "Bkpv59Bf": "51HTOy3y"}}]}' \
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
    --appType 'DLC' \
    --entitlementClazz 'APP' \
    --entitlementName 'bakeWmAu' \
    --itemId 'C3PWxQBS,x9dr8bZS,ltgqsD2m' \
    --limit '63' \
    --offset '57' \
    --origin 'Nintendo' \
    --userId '32Fa0cCN' \
    > test.out 2>&1
eval_tap $? 65 'QueryEntitlements' test.out

#- 66 QueryEntitlementsByItemIds
./ng net.accelbyte.sdk.cli.Main platform queryEntitlementsByItemIds \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemIds 's84uFhn6,r9uAUsGb,Wt7rhIlY' \
    --limit '91' \
    --offset '7' \
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
    --body '{"entitlementGrantList": [{"collectionId": "BdsaeITk", "endDate": "1993-08-21T00:00:00Z", "grantedCode": "gu0ZI1ha", "itemId": "RZwwPgEP", "itemNamespace": "GHmI9MVQ", "language": "czb-eQci", "metadata": {"on4iAayY": {}, "CLSUHUh8": {}, "kpgnvC7y": {}}, "origin": "Nintendo", "quantity": 32, "region": "rgQxfoqT", "source": "PURCHASE", "startDate": "1976-12-22T00:00:00Z", "storeId": "HW1nzgLJ"}, {"collectionId": "5pgM95ES", "endDate": "1983-01-08T00:00:00Z", "grantedCode": "YV58mLgM", "itemId": "Jpc4B1St", "itemNamespace": "HrFIQpWL", "language": "bcyh", "metadata": {"hqKouRCl": {}, "9kQ3f8wk": {}, "UotednSW": {}}, "origin": "Oculus", "quantity": 64, "region": "YCB9ccoG", "source": "IAP", "startDate": "1979-07-14T00:00:00Z", "storeId": "dW8muz5P"}, {"collectionId": "J3gAtI3i", "endDate": "1976-01-21T00:00:00Z", "grantedCode": "v7iD0WpR", "itemId": "wIzxmgg5", "itemNamespace": "c8spwv37", "language": "VMt-157", "metadata": {"gWdfPEnM": {}, "5T9B5D3Y": {}, "EjCfl7MH": {}}, "origin": "Playstation", "quantity": 55, "region": "vpzKYVN6", "source": "REFERRAL_BONUS", "startDate": "1992-06-20T00:00:00Z", "storeId": "sJzQxCjd"}], "userIds": ["cBppfqkL", "hIQovlsv", "Sro706ec"]}' \
    > test.out 2>&1
eval_tap $? 69 'GrantEntitlements' test.out

#- 70 RevokeEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeEntitlements \
    --namespace "$AB_NAMESPACE" \
    --body '["M6YrPnCB", "vfNgYoYF", "bPwWLomw"]' \
    > test.out 2>&1
eval_tap $? 70 'RevokeEntitlements' test.out

#- 71 GetEntitlement
./ng net.accelbyte.sdk.cli.Main platform getEntitlement \
    --entitlementId 'dsluyZOS' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 71 'GetEntitlement' test.out

#- 72 QueryFulfillmentHistories
./ng net.accelbyte.sdk.cli.Main platform queryFulfillmentHistories \
    --namespace "$AB_NAMESPACE" \
    --limit '1' \
    --offset '7' \
    --status 'FAIL' \
    --userId '3NMBMIOh' \
    > test.out 2>&1
eval_tap $? 72 'QueryFulfillmentHistories' test.out

#- 73 QueryIAPClawbackHistory
./ng net.accelbyte.sdk.cli.Main platform queryIAPClawbackHistory \
    --namespace "$AB_NAMESPACE" \
    --endTime 'fJOZvrAh' \
    --eventType 'REFUND' \
    --externalOrderId 'qS7Y2TKM' \
    --limit '66' \
    --offset '36' \
    --startTime 'WuxNlkNa' \
    --status 'SUCCESS' \
    --userId 'zbldlT0r' \
    > test.out 2>&1
eval_tap $? 73 'QueryIAPClawbackHistory' test.out

#- 74 MockPlayStationStreamEvent
./ng net.accelbyte.sdk.cli.Main platform mockPlayStationStreamEvent \
    --namespace "$AB_NAMESPACE" \
    --body '{"body": {"account": "ZLS7kNuZ", "additionalData": {"entitlement": [{"clientTransaction": [{"amountConsumed": 2, "clientTransactionId": "BmgpMYVo"}, {"amountConsumed": 100, "clientTransactionId": "zDNgBi1s"}, {"amountConsumed": 9, "clientTransactionId": "iCSz8m2D"}], "entitlementId": "eWQBFKZU", "usageCount": 48}, {"clientTransaction": [{"amountConsumed": 81, "clientTransactionId": "ioaSsY02"}, {"amountConsumed": 3, "clientTransactionId": "EMEiuYUy"}, {"amountConsumed": 92, "clientTransactionId": "Ex6oI3X7"}], "entitlementId": "IBowiKCB", "usageCount": 27}, {"clientTransaction": [{"amountConsumed": 94, "clientTransactionId": "IHDPHuFz"}, {"amountConsumed": 56, "clientTransactionId": "beXDzMdh"}, {"amountConsumed": 3, "clientTransactionId": "oHotkODR"}], "entitlementId": "XztHZG2n", "usageCount": 24}], "purpose": "xc4mdjcF"}, "originalTitleName": "3mMQIuZc", "paymentProductSKU": "oCjnQ4mh", "purchaseDate": "HgHBuKT6", "sourceOrderItemId": "Xm4T4O6T", "titleName": "w4MDGSp6"}, "eventDomain": "2gkvSSzE", "eventSource": "hGmyMcgT", "eventType": "R4uAwLkr", "eventVersion": 58, "id": "RlDCmt7T", "timestamp": "nzduJNxQ"}' \
    > test.out 2>&1
eval_tap $? 74 'MockPlayStationStreamEvent' test.out

#- 75 MockXblClawbackEvent
./ng net.accelbyte.sdk.cli.Main platform mockXblClawbackEvent \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": {"eventDate": "pPbgxgWU", "eventState": "AB44zeDL", "lineItemId": "9rLUA86F", "orderId": "Rpnn0uRG", "productId": "hxCf7j5D", "productType": "bzgPr8n5", "purchasedDate": "HV3qa1wC", "sandboxId": "U0NHkk3R", "skuId": "o243Zjz9", "subscriptionData": {"consumedDurationInDays": 48, "dateTime": "UqlsrozT", "durationInDays": 8, "recurrenceId": "W0ksHiS5"}}, "datacontenttype": "czY3unA4", "id": "S64Rp8NR", "source": "eTNvEtYo", "specVersion": "l6ZE1M5H", "subject": "bts3K0M0", "time": "IHqFmC2D", "traceparent": "HychVbhY", "type": "Y5GoxWdD"}' \
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
    --body '{"appAppleId": 47, "bundleId": "37Emdtci", "issuerId": "1VRNTSOP", "keyId": "trVvOUfY", "password": "DLenYlQ6", "version": "V2"}' \
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
    --body '{"sandboxId": "fmfNcvfa"}' \
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
    --body '{"applicationName": "XjRQmyLI", "notificationTokenAudience": "6k7YuWl7", "notificationTokenEmail": "10rQ0ANO", "packageName": "O0e6qAgQ", "serviceAccountId": "PpQwMLEu"}' \
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
    --body '{"data": [{"itemIdentity": "LHcvjqVk", "itemIdentityType": "ITEM_ID", "platformProductIdMap": {"SMNK23yE": "C6ORsQKv", "PiwdUiHj": "wTlw6hea", "w3RAZTUL": "Ph6BBdmr"}}, {"itemIdentity": "SZHdFtq9", "itemIdentityType": "ITEM_ID", "platformProductIdMap": {"ZxSSUMOO": "KVfoPuho", "US7EpUxg": "K3aAMO1i", "G6E92XHA": "cy6exTse"}}, {"itemIdentity": "y8VNoI9w", "itemIdentityType": "ITEM_ID", "platformProductIdMap": {"i7adaxDP": "JQqPy6zZ", "8uwnQILJ": "jbnySJ9D", "3s1haOlG": "XobB5oLU"}}]}' \
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
    --body '{"appId": "Xv6YK46P", "appSecret": "EX2Pcywe", "webhookVerifyToken": "7ZbTO7Zr"}' \
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
    --body '{"sku": "xKIKow1a"}' \
    > test.out 2>&1
eval_tap $? 94 'CreateOculusSubscriptionGroup' test.out

#- 95 DeleteOculusSubscriptionGroup
./ng net.accelbyte.sdk.cli.Main platform deleteOculusSubscriptionGroup \
    --namespace "$AB_NAMESPACE" \
    --sku 'IqLsaac7' \
    > test.out 2>&1
eval_tap $? 95 'DeleteOculusSubscriptionGroup' test.out

#- 96 ListOculusSubscriptionGroupTier
./ng net.accelbyte.sdk.cli.Main platform listOculusSubscriptionGroupTier \
    --namespace "$AB_NAMESPACE" \
    --sku 'QSm80e6i' \
    > test.out 2>&1
eval_tap $? 96 'ListOculusSubscriptionGroupTier' test.out

#- 97 AddTierIntoMetaQuestSubscriptionGroup
./ng net.accelbyte.sdk.cli.Main platform addTierIntoMetaQuestSubscriptionGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupSku": "qGoihs05", "sku": "ZYHlHiX0"}' \
    > test.out 2>&1
eval_tap $? 97 'AddTierIntoMetaQuestSubscriptionGroup' test.out

#- 98 DeleteOculusSubscriptionTier
./ng net.accelbyte.sdk.cli.Main platform deleteOculusSubscriptionTier \
    --namespace "$AB_NAMESPACE" \
    --sku '9u29RF6p' \
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
    --body '{"backOfficeServerClientId": "YP3uYzB3", "backOfficeServerClientSecret": "nxqEjEqp", "enableStreamJob": true, "environment": "iuI5I53R", "streamName": "5Vcb1yv7", "streamPartnerName": "BziDj8Xh"}' \
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
    --body '{"backOfficeServerClientId": "oElOMrb1", "backOfficeServerClientSecret": "drSl2v8E", "enableStreamJob": false, "environment": "oiDRrFqB", "streamName": "G8ayAvYj", "streamPartnerName": "3bQtrwIf"}' \
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
    --body '{"appId": "r1YARgyz", "env": "LIVE", "publisherAuthenticationKey": "2BMCjWkB", "syncMode": "INVENTORY"}' \
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
    --body '{"clientId": "Ln5gvi8R", "clientSecret": "NNn2iI67", "organizationId": "tOrH9hip"}' \
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
    --body '{"enableClawback": false, "entraAppClientId": "HCufyuu5", "entraAppClientSecret": "0C4AssLe", "entraTenantId": "tw0GmSEG", "relyingPartyCert": "CpMlJfEx"}' \
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
    --password '3Y5iosyq' \
    > test.out 2>&1
eval_tap $? 113 'UpdateXblBPCertFile' test.out

#- 114 QueryThirdPartyNotifications
./ng net.accelbyte.sdk.cli.Main platform queryThirdPartyNotifications \
    --namespace "$AB_NAMESPACE" \
    --endDate '0HhXSOt0' \
    --externalId 'oU7JQdbC' \
    --limit '71' \
    --offset '13' \
    --source 'STEAM' \
    --startDate '1eCLNjwi' \
    --status 'PROCESSED' \
    --type 'qR1WASZQ' \
    > test.out 2>&1
eval_tap $? 114 'QueryThirdPartyNotifications' test.out

#- 115 QueryAbnormalTransactions
./ng net.accelbyte.sdk.cli.Main platform queryAbnormalTransactions \
    --namespace "$AB_NAMESPACE" \
    --limit '74' \
    --offset '83' \
    --orderId 'Y42RMxvN' \
    --steamId 'SiWZ0C8t' \
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
    --body '{"env": "SANDBOX", "lastTime": "1999-04-07T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 117 'AdminResetSteamJobTime' test.out

#- 118 AdminRefundIAPOrder
./ng net.accelbyte.sdk.cli.Main platform adminRefundIAPOrder \
    --iapOrderNo 'h9EaYzCL' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 118 'AdminRefundIAPOrder' test.out

#- 119 QuerySteamReportHistories
./ng net.accelbyte.sdk.cli.Main platform querySteamReportHistories \
    --namespace "$AB_NAMESPACE" \
    --limit '72' \
    --offset '58' \
    --orderId 'fV4M7KKX' \
    --processStatus 'IGNORED' \
    --steamId 'YthyZZiA' \
    > test.out 2>&1
eval_tap $? 119 'QuerySteamReportHistories' test.out

#- 120 QueryThirdPartySubscription
./ng net.accelbyte.sdk.cli.Main platform queryThirdPartySubscription \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --groupId 'PDiofCkv' \
    --limit '76' \
    --offset '65' \
    --platform 'OCULUS' \
    --productId 'GssVWvyB' \
    --userId 'Kfab8wIv' \
    > test.out 2>&1
eval_tap $? 120 'QueryThirdPartySubscription' test.out

#- 121 GetIAPOrderConsumeDetails
./ng net.accelbyte.sdk.cli.Main platform getIAPOrderConsumeDetails \
    --iapOrderNo 'Tw9g8Zi0' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 121 'GetIAPOrderConsumeDetails' test.out

#- 122 DownloadInvoiceDetails
./ng net.accelbyte.sdk.cli.Main platform downloadInvoiceDetails \
    --namespace "$AB_NAMESPACE" \
    --endTime 'lEoGPy5c' \
    --feature 'BODgquOn' \
    --itemId 'qEDQ3KiS' \
    --itemType 'MEDIA' \
    --startTime '3GWrBxAr' \
    > test.out 2>&1
eval_tap $? 122 'DownloadInvoiceDetails' test.out

#- 123 GenerateInvoiceSummary
./ng net.accelbyte.sdk.cli.Main platform generateInvoiceSummary \
    --namespace "$AB_NAMESPACE" \
    --endTime 'GFvDFFYO' \
    --feature '56StEDyc' \
    --itemId 'n8P6Etat' \
    --itemType 'INGAMEITEM' \
    --startTime 'vBwNcjNn' \
    > test.out 2>&1
eval_tap $? 123 'GenerateInvoiceSummary' test.out

#- 124 SyncInGameItem
./ng net.accelbyte.sdk.cli.Main platform syncInGameItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Db3gad01' \
    --body '{"categoryPath": "Xlm5KnhX", "targetItemId": "cXdvrRf7", "targetNamespace": "jnLHKrFN"}' \
    > test.out 2>&1
eval_tap $? 124 'SyncInGameItem' test.out

#- 125 CreateItem
./ng net.accelbyte.sdk.cli.Main platform createItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'vhXeXeFl' \
    --body '{"appId": "GKiw72HD", "appType": "DLC", "baseAppId": "94LwgHVX", "boothName": "zWF4XF24", "categoryPath": "EXdMVwMs", "clazz": "7207lXtH", "displayOrder": 38, "entitlementType": "CONSUMABLE", "ext": {"Y56fp14N": {}, "FMkk7GYX": {}, "2aU4o446": {}}, "features": ["EkYZOogN", "EqKLj7EJ", "pkCMm2Qu"], "flexible": true, "images": [{"as": "JCyTUo96", "caption": "i0a4Nqf7", "height": 65, "imageUrl": "oyefpxin", "smallImageUrl": "xHCyOCFD", "width": 13}, {"as": "sjjV8794", "caption": "GQN5eRVT", "height": 71, "imageUrl": "0OF8vb2I", "smallImageUrl": "tgRO7nwg", "width": 30}, {"as": "7LOPSkDO", "caption": "WcsvN9Hx", "height": 30, "imageUrl": "6Wn8eNL7", "smallImageUrl": "UDp8gKmo", "width": 71}], "inventoryConfig": {"customAttributes": {"kRnrD4Ow": {}, "cEmhEhip": {}, "KYnu1Qpy": {}}, "serverCustomAttributes": {"INUKkB6k": {}, "hRqrJXVz": {}, "IoGJHQrV": {}}, "slotUsed": 14}, "itemId": "Qa5mxHqp", "itemIds": ["ktic7Kjx", "KKFOQAGR", "ZSAEr24D"], "itemQty": {"jwQMj3Ah": 96, "X4xrxfna": 73, "EdNm6WMI": 8}, "itemType": "EXTENSION", "listable": false, "localizations": {"nQssvCZL": {"description": "XadP4YIo", "localExt": {"vIbsVLLf": {}, "cwc1a0WA": {}, "dNGnEZ78": {}}, "longDescription": "Ija6adSg", "title": "jgbeb1OY"}, "bHpqZIVV": {"description": "jaNYltJv", "localExt": {"lhiimGIi": {}, "Z49SojLW": {}, "Bdv92DUi": {}}, "longDescription": "Qdikc7OH", "title": "kHDXz0vP"}, "fjCU39Cd": {"description": "FGrFiGhz", "localExt": {"ITgLlLWj": {}, "2jLlPqzm": {}, "UYNKJGVe": {}}, "longDescription": "Q69kDtVe", "title": "4y48jGDu"}}, "lootBoxConfig": {"rewardCount": 9, "rewards": [{"lootBoxItems": [{"count": 64, "duration": 75, "endDate": "1984-09-30T00:00:00Z", "itemId": "4sQP9cBg", "itemSku": "XiXNVmwn", "itemType": "U8tBZu54"}, {"count": 57, "duration": 45, "endDate": "1986-03-28T00:00:00Z", "itemId": "jduDcavV", "itemSku": "CPEu2hgg", "itemType": "2gO94574"}, {"count": 79, "duration": 67, "endDate": "1976-08-13T00:00:00Z", "itemId": "3YIO03fk", "itemSku": "jXiTigoy", "itemType": "RmgXFPsh"}], "name": "V97PSO2H", "odds": 0.6960373615166402, "type": "PROBABILITY_GROUP", "weight": 48}, {"lootBoxItems": [{"count": 81, "duration": 95, "endDate": "1980-02-20T00:00:00Z", "itemId": "GHM8LtT4", "itemSku": "FJMbb1Vq", "itemType": "J9VPQauT"}, {"count": 0, "duration": 3, "endDate": "1984-10-18T00:00:00Z", "itemId": "uqqoAUN5", "itemSku": "FAVscM5M", "itemType": "C4XaGxr5"}, {"count": 33, "duration": 25, "endDate": "1992-06-29T00:00:00Z", "itemId": "Aw1fmXRj", "itemSku": "UjTyMJWY", "itemType": "ommPVgxf"}], "name": "ygPxUyVp", "odds": 0.3331994762375279, "type": "REWARD_GROUP", "weight": 25}, {"lootBoxItems": [{"count": 85, "duration": 13, "endDate": "1997-06-11T00:00:00Z", "itemId": "dRcM5o1z", "itemSku": "MuGU7pzt", "itemType": "eZxN9JIk"}, {"count": 26, "duration": 61, "endDate": "1992-12-15T00:00:00Z", "itemId": "lEG2oHnY", "itemSku": "1N4iytQl", "itemType": "RyFQac5q"}, {"count": 97, "duration": 79, "endDate": "1973-12-21T00:00:00Z", "itemId": "N8GBndlX", "itemSku": "75sqAMB0", "itemType": "pFurtpAR"}], "name": "UqSZ9QF4", "odds": 0.494578282803561, "type": "PROBABILITY_GROUP", "weight": 4}], "rollFunction": "DEFAULT"}, "maxCount": 65, "maxCountPerUser": 43, "name": "Y8Vfprg8", "optionBoxConfig": {"boxItems": [{"count": 81, "duration": 65, "endDate": "1972-11-22T00:00:00Z", "itemId": "SgD8rkF3", "itemSku": "YgxVBLQC", "itemType": "Z3N4x6lo"}, {"count": 26, "duration": 88, "endDate": "1988-05-17T00:00:00Z", "itemId": "U3iFSJqA", "itemSku": "yF7sty8N", "itemType": "wrMVo7hh"}, {"count": 78, "duration": 1, "endDate": "1979-10-20T00:00:00Z", "itemId": "OCJg6rMH", "itemSku": "HoR8SYif", "itemType": "9cgHrGJ4"}]}, "purchasable": false, "recurring": {"cycle": "MONTHLY", "fixedFreeDays": 35, "fixedTrialCycles": 9, "graceDays": 59}, "regionData": {"6s8b5XJv": [{"currencyCode": "3bGXUu7Z", "currencyNamespace": "ZPvD71cn", "currencyType": "VIRTUAL", "discountAmount": 26, "discountExpireAt": "1986-05-17T00:00:00Z", "discountPercentage": 14, "discountPurchaseAt": "1976-03-09T00:00:00Z", "expireAt": "1975-06-22T00:00:00Z", "price": 6, "purchaseAt": "1993-12-26T00:00:00Z", "trialPrice": 34}, {"currencyCode": "j8iYXqD2", "currencyNamespace": "PTOz2Sjd", "currencyType": "VIRTUAL", "discountAmount": 49, "discountExpireAt": "1978-08-28T00:00:00Z", "discountPercentage": 37, "discountPurchaseAt": "1984-11-04T00:00:00Z", "expireAt": "1981-11-16T00:00:00Z", "price": 29, "purchaseAt": "1985-01-22T00:00:00Z", "trialPrice": 35}, {"currencyCode": "VR4MvJgt", "currencyNamespace": "rZ0kyaII", "currencyType": "VIRTUAL", "discountAmount": 25, "discountExpireAt": "1978-01-28T00:00:00Z", "discountPercentage": 32, "discountPurchaseAt": "1988-08-17T00:00:00Z", "expireAt": "1974-07-19T00:00:00Z", "price": 96, "purchaseAt": "1984-11-30T00:00:00Z", "trialPrice": 40}], "Fo7RLVwZ": [{"currencyCode": "hUql9fod", "currencyNamespace": "qVWK9wja", "currencyType": "REAL", "discountAmount": 77, "discountExpireAt": "1999-10-30T00:00:00Z", "discountPercentage": 21, "discountPurchaseAt": "1993-05-02T00:00:00Z", "expireAt": "1990-08-05T00:00:00Z", "price": 17, "purchaseAt": "1980-05-23T00:00:00Z", "trialPrice": 37}, {"currencyCode": "k6nW9HS4", "currencyNamespace": "hVt7YTsV", "currencyType": "VIRTUAL", "discountAmount": 18, "discountExpireAt": "1974-07-24T00:00:00Z", "discountPercentage": 29, "discountPurchaseAt": "1986-07-17T00:00:00Z", "expireAt": "1972-01-14T00:00:00Z", "price": 72, "purchaseAt": "1991-01-18T00:00:00Z", "trialPrice": 89}, {"currencyCode": "h4Ldym4N", "currencyNamespace": "iZsWTzNH", "currencyType": "REAL", "discountAmount": 7, "discountExpireAt": "1994-08-22T00:00:00Z", "discountPercentage": 42, "discountPurchaseAt": "1980-06-23T00:00:00Z", "expireAt": "1977-04-23T00:00:00Z", "price": 54, "purchaseAt": "1995-09-11T00:00:00Z", "trialPrice": 92}], "D333jKwI": [{"currencyCode": "ZYAIJPRj", "currencyNamespace": "HrQpUqTd", "currencyType": "VIRTUAL", "discountAmount": 59, "discountExpireAt": "1991-07-17T00:00:00Z", "discountPercentage": 11, "discountPurchaseAt": "1991-01-31T00:00:00Z", "expireAt": "1993-07-24T00:00:00Z", "price": 50, "purchaseAt": "1971-10-29T00:00:00Z", "trialPrice": 23}, {"currencyCode": "1oUx4fpD", "currencyNamespace": "IF1VNGTb", "currencyType": "VIRTUAL", "discountAmount": 61, "discountExpireAt": "1971-07-06T00:00:00Z", "discountPercentage": 58, "discountPurchaseAt": "1976-03-13T00:00:00Z", "expireAt": "1975-07-23T00:00:00Z", "price": 13, "purchaseAt": "1982-04-08T00:00:00Z", "trialPrice": 1}, {"currencyCode": "sBFoEkvm", "currencyNamespace": "Gz8OGg8p", "currencyType": "REAL", "discountAmount": 100, "discountExpireAt": "1974-05-19T00:00:00Z", "discountPercentage": 44, "discountPurchaseAt": "1977-02-28T00:00:00Z", "expireAt": "1971-01-26T00:00:00Z", "price": 53, "purchaseAt": "1979-06-22T00:00:00Z", "trialPrice": 22}]}, "saleConfig": {"currencyCode": "xkNGXLGa", "price": 11}, "seasonType": "TIER", "sectionExclusive": false, "sellable": true, "sku": "JK1TuaGr", "stackable": true, "status": "INACTIVE", "tags": ["RyImQqFD", "Jr2mTibT", "ZUKkcxZ5"], "targetCurrencyCode": "Zgfx8tRA", "targetNamespace": "vBO9ErPS", "thumbnailUrl": "ThGn2mjd", "useCount": 3}' \
    > test.out 2>&1
eval_tap $? 125 'CreateItem' test.out

#- 126 GetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform getItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'dhLi28j3' \
    --appId 'htfljbJy' \
    > test.out 2>&1
eval_tap $? 126 'GetItemByAppId' test.out

#- 127 QueryItems
./ng net.accelbyte.sdk.cli.Main platform queryItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --appType 'SOFTWARE' \
    --availableDate '1Q86MzYw' \
    --baseAppId 'cOzMW5Ix' \
    --categoryPath 'JGgk3aES' \
    --features 'RFizKLXT' \
    --includeSubCategoryItem  \
    --itemType 'APP' \
    --limit '63' \
    --offset '80' \
    --region 'Qr74jYFY' \
    --sortBy 'createdAt,updatedAt:desc' \
    --storeId 'yrt1wfww' \
    --tags 'kwxZ7tqw' \
    --targetNamespace 'x8HphZ9v' \
    > test.out 2>&1
eval_tap $? 127 'QueryItems' test.out

#- 128 ListBasicItemsByFeatures
./ng net.accelbyte.sdk.cli.Main platform listBasicItemsByFeatures \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --features '8MZo8atf,nzP3oNIy,qkZIvicy' \
    > test.out 2>&1
eval_tap $? 128 'ListBasicItemsByFeatures' test.out

#- 129 GetItems
./ng net.accelbyte.sdk.cli.Main platform getItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'knxOwb9w' \
    --itemIds 'kGOLbobh' \
    > test.out 2>&1
eval_tap $? 129 'GetItems' test.out

#- 130 GetItemBySku
./ng net.accelbyte.sdk.cli.Main platform getItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId '8m05tE1b' \
    --sku 'Vqv8Xmhk' \
    > test.out 2>&1
eval_tap $? 130 'GetItemBySku' test.out

#- 131 GetLocaleItemBySku
./ng net.accelbyte.sdk.cli.Main platform getLocaleItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'QRsmQKgU' \
    --populateBundle  \
    --region 'hyv7sZcF' \
    --storeId '1BPtq3iW' \
    --sku 'De5xCQxQ' \
    > test.out 2>&1
eval_tap $? 131 'GetLocaleItemBySku' test.out

#- 132 GetEstimatedPrice
./ng net.accelbyte.sdk.cli.Main platform getEstimatedPrice \
    --namespace "$AB_NAMESPACE" \
    --platform 'toRHBVJS' \
    --region 'ueoRVlFu' \
    --storeId 'QyixkqHj' \
    --itemIds 'ukLbe0Dh' \
    --userId 'gJSFFrdu' \
    > test.out 2>&1
eval_tap $? 132 'GetEstimatedPrice' test.out

#- 133 GetItemIdBySku
./ng net.accelbyte.sdk.cli.Main platform getItemIdBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'GLhzcsuc' \
    --sku '0VWH22Zf' \
    > test.out 2>&1
eval_tap $? 133 'GetItemIdBySku' test.out

#- 134 GetBulkItemIdBySkus
./ng net.accelbyte.sdk.cli.Main platform getBulkItemIdBySkus \
    --namespace "$AB_NAMESPACE" \
    --sku 'UoQHP0Vm,COIcsluB,WRIMpo0L' \
    --storeId 'WO966sPr' \
    > test.out 2>&1
eval_tap $? 134 'GetBulkItemIdBySkus' test.out

#- 135 BulkGetLocaleItems
./ng net.accelbyte.sdk.cli.Main platform bulkGetLocaleItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language '4uWJNPcr' \
    --region 'giF9xInX' \
    --storeId 'OiLOS34x' \
    --itemIds '7Exdfto1' \
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
    --platform '3NrsKqiw' \
    --userId 'rQ4LeyZ5' \
    --body '{"itemIds": ["ioYm0sWF", "PGqeJ1s0", "gKD3ib87"]}' \
    > test.out 2>&1
eval_tap $? 137 'ValidateItemPurchaseCondition' test.out

#- 138 BulkUpdateRegionData
./ng net.accelbyte.sdk.cli.Main platform bulkUpdateRegionData \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Rz5HS4iU' \
    --body '{"changes": [{"itemIdentities": ["SQhpiusw", "KfL92EGN", "emvOyaQC"], "itemIdentityType": "ITEM_SKU", "regionData": {"uhdC48vg": [{"currencyCode": "kHfoIFAt", "currencyNamespace": "saKbOlOa", "currencyType": "VIRTUAL", "discountAmount": 29, "discountExpireAt": "1987-10-01T00:00:00Z", "discountPercentage": 62, "discountPurchaseAt": "1972-06-22T00:00:00Z", "discountedPrice": 19, "expireAt": "1998-03-31T00:00:00Z", "price": 16, "purchaseAt": "1994-08-05T00:00:00Z", "trialPrice": 64}, {"currencyCode": "Sbt7GGgl", "currencyNamespace": "qn5R5TRH", "currencyType": "REAL", "discountAmount": 96, "discountExpireAt": "1979-04-22T00:00:00Z", "discountPercentage": 30, "discountPurchaseAt": "1979-12-25T00:00:00Z", "discountedPrice": 14, "expireAt": "1989-07-28T00:00:00Z", "price": 53, "purchaseAt": "1982-08-14T00:00:00Z", "trialPrice": 16}, {"currencyCode": "qmzATwxs", "currencyNamespace": "Ot97dukM", "currencyType": "VIRTUAL", "discountAmount": 8, "discountExpireAt": "1982-09-07T00:00:00Z", "discountPercentage": 24, "discountPurchaseAt": "1998-08-07T00:00:00Z", "discountedPrice": 97, "expireAt": "1980-01-06T00:00:00Z", "price": 97, "purchaseAt": "1996-06-16T00:00:00Z", "trialPrice": 91}], "aOwvviuB": [{"currencyCode": "3mPFpFaK", "currencyNamespace": "Tik9Ys05", "currencyType": "REAL", "discountAmount": 45, "discountExpireAt": "1972-02-22T00:00:00Z", "discountPercentage": 70, "discountPurchaseAt": "1973-04-13T00:00:00Z", "discountedPrice": 78, "expireAt": "1974-11-08T00:00:00Z", "price": 66, "purchaseAt": "1978-04-07T00:00:00Z", "trialPrice": 28}, {"currencyCode": "iwLrZYgk", "currencyNamespace": "0E6IPC7L", "currencyType": "REAL", "discountAmount": 2, "discountExpireAt": "1996-08-02T00:00:00Z", "discountPercentage": 68, "discountPurchaseAt": "1973-10-20T00:00:00Z", "discountedPrice": 32, "expireAt": "1987-10-25T00:00:00Z", "price": 84, "purchaseAt": "1983-12-11T00:00:00Z", "trialPrice": 65}, {"currencyCode": "dyilVgNp", "currencyNamespace": "MiQ25sdO", "currencyType": "VIRTUAL", "discountAmount": 5, "discountExpireAt": "1980-01-08T00:00:00Z", "discountPercentage": 36, "discountPurchaseAt": "1972-05-27T00:00:00Z", "discountedPrice": 15, "expireAt": "1975-07-08T00:00:00Z", "price": 42, "purchaseAt": "1988-05-03T00:00:00Z", "trialPrice": 94}], "upD4312D": [{"currencyCode": "hBvVM9nS", "currencyNamespace": "T7G3mHJh", "currencyType": "REAL", "discountAmount": 84, "discountExpireAt": "1989-07-04T00:00:00Z", "discountPercentage": 88, "discountPurchaseAt": "1991-05-03T00:00:00Z", "discountedPrice": 9, "expireAt": "1998-05-17T00:00:00Z", "price": 57, "purchaseAt": "1976-06-13T00:00:00Z", "trialPrice": 9}, {"currencyCode": "fCUZpk3U", "currencyNamespace": "x2EmLxWK", "currencyType": "REAL", "discountAmount": 27, "discountExpireAt": "1971-02-17T00:00:00Z", "discountPercentage": 26, "discountPurchaseAt": "1990-12-27T00:00:00Z", "discountedPrice": 32, "expireAt": "1983-12-14T00:00:00Z", "price": 28, "purchaseAt": "1976-07-02T00:00:00Z", "trialPrice": 38}, {"currencyCode": "Oo9V7QBI", "currencyNamespace": "Hu1IHC25", "currencyType": "VIRTUAL", "discountAmount": 90, "discountExpireAt": "1978-12-29T00:00:00Z", "discountPercentage": 49, "discountPurchaseAt": "1984-05-17T00:00:00Z", "discountedPrice": 74, "expireAt": "1976-11-06T00:00:00Z", "price": 16, "purchaseAt": "1986-05-02T00:00:00Z", "trialPrice": 17}]}}, {"itemIdentities": ["DKIsVtOH", "lO7ci4HW", "ZVYj1f2A"], "itemIdentityType": "ITEM_SKU", "regionData": {"eHPKp4il": [{"currencyCode": "SA0gZTW9", "currencyNamespace": "sQCCCmoh", "currencyType": "VIRTUAL", "discountAmount": 81, "discountExpireAt": "1980-09-05T00:00:00Z", "discountPercentage": 67, "discountPurchaseAt": "1988-09-22T00:00:00Z", "discountedPrice": 47, "expireAt": "1979-07-28T00:00:00Z", "price": 8, "purchaseAt": "1998-10-22T00:00:00Z", "trialPrice": 71}, {"currencyCode": "z06aB9aX", "currencyNamespace": "c44ab2u4", "currencyType": "REAL", "discountAmount": 65, "discountExpireAt": "1985-11-24T00:00:00Z", "discountPercentage": 4, "discountPurchaseAt": "1997-04-23T00:00:00Z", "discountedPrice": 62, "expireAt": "1973-12-05T00:00:00Z", "price": 49, "purchaseAt": "1978-12-10T00:00:00Z", "trialPrice": 89}, {"currencyCode": "4MsLku9l", "currencyNamespace": "MDWjfdKw", "currencyType": "VIRTUAL", "discountAmount": 14, "discountExpireAt": "1980-11-23T00:00:00Z", "discountPercentage": 39, "discountPurchaseAt": "1987-04-24T00:00:00Z", "discountedPrice": 17, "expireAt": "1975-09-19T00:00:00Z", "price": 2, "purchaseAt": "1994-12-09T00:00:00Z", "trialPrice": 58}], "MJ82tmCB": [{"currencyCode": "lm9CTjtk", "currencyNamespace": "HjojzPFu", "currencyType": "REAL", "discountAmount": 62, "discountExpireAt": "1977-02-03T00:00:00Z", "discountPercentage": 98, "discountPurchaseAt": "1972-08-07T00:00:00Z", "discountedPrice": 10, "expireAt": "1980-04-06T00:00:00Z", "price": 45, "purchaseAt": "1974-01-02T00:00:00Z", "trialPrice": 48}, {"currencyCode": "xqwNbqy9", "currencyNamespace": "qViKPUit", "currencyType": "REAL", "discountAmount": 87, "discountExpireAt": "1998-05-15T00:00:00Z", "discountPercentage": 53, "discountPurchaseAt": "1984-11-13T00:00:00Z", "discountedPrice": 65, "expireAt": "1972-04-10T00:00:00Z", "price": 0, "purchaseAt": "1978-02-14T00:00:00Z", "trialPrice": 94}, {"currencyCode": "oKqtlKbz", "currencyNamespace": "70eeIsp7", "currencyType": "VIRTUAL", "discountAmount": 10, "discountExpireAt": "1985-04-07T00:00:00Z", "discountPercentage": 28, "discountPurchaseAt": "1992-04-15T00:00:00Z", "discountedPrice": 70, "expireAt": "1978-07-04T00:00:00Z", "price": 82, "purchaseAt": "1974-10-04T00:00:00Z", "trialPrice": 21}], "NTt8CuIW": [{"currencyCode": "lTvDh3ta", "currencyNamespace": "LkYKhW78", "currencyType": "REAL", "discountAmount": 35, "discountExpireAt": "1995-03-02T00:00:00Z", "discountPercentage": 97, "discountPurchaseAt": "1972-08-21T00:00:00Z", "discountedPrice": 2, "expireAt": "1987-07-25T00:00:00Z", "price": 2, "purchaseAt": "1998-01-12T00:00:00Z", "trialPrice": 24}, {"currencyCode": "KaWLiAhH", "currencyNamespace": "tRniSaGq", "currencyType": "VIRTUAL", "discountAmount": 53, "discountExpireAt": "1991-01-18T00:00:00Z", "discountPercentage": 73, "discountPurchaseAt": "1985-04-06T00:00:00Z", "discountedPrice": 47, "expireAt": "1998-07-22T00:00:00Z", "price": 17, "purchaseAt": "1982-06-22T00:00:00Z", "trialPrice": 97}, {"currencyCode": "IHv2BEJK", "currencyNamespace": "9s6e2tai", "currencyType": "REAL", "discountAmount": 25, "discountExpireAt": "1975-04-29T00:00:00Z", "discountPercentage": 94, "discountPurchaseAt": "1976-06-13T00:00:00Z", "discountedPrice": 9, "expireAt": "1993-06-30T00:00:00Z", "price": 19, "purchaseAt": "1972-10-08T00:00:00Z", "trialPrice": 84}]}}, {"itemIdentities": ["NyfiFcPt", "d1ycXCkq", "2YKnvqMD"], "itemIdentityType": "ITEM_SKU", "regionData": {"VrJC6Niv": [{"currencyCode": "EAseoGUg", "currencyNamespace": "qj3JQkTL", "currencyType": "REAL", "discountAmount": 66, "discountExpireAt": "1978-12-07T00:00:00Z", "discountPercentage": 68, "discountPurchaseAt": "1991-04-10T00:00:00Z", "discountedPrice": 93, "expireAt": "1991-01-31T00:00:00Z", "price": 95, "purchaseAt": "1974-08-09T00:00:00Z", "trialPrice": 95}, {"currencyCode": "l3eQRsUi", "currencyNamespace": "Fbo911ko", "currencyType": "REAL", "discountAmount": 61, "discountExpireAt": "1974-04-08T00:00:00Z", "discountPercentage": 31, "discountPurchaseAt": "1981-08-04T00:00:00Z", "discountedPrice": 30, "expireAt": "1973-02-02T00:00:00Z", "price": 18, "purchaseAt": "1985-08-18T00:00:00Z", "trialPrice": 45}, {"currencyCode": "0jSoijy5", "currencyNamespace": "mWcuEVXx", "currencyType": "VIRTUAL", "discountAmount": 2, "discountExpireAt": "1971-09-20T00:00:00Z", "discountPercentage": 19, "discountPurchaseAt": "1995-04-17T00:00:00Z", "discountedPrice": 60, "expireAt": "1975-05-05T00:00:00Z", "price": 32, "purchaseAt": "1973-08-08T00:00:00Z", "trialPrice": 21}], "uaa9olEr": [{"currencyCode": "prcokqho", "currencyNamespace": "Xm7zea32", "currencyType": "VIRTUAL", "discountAmount": 54, "discountExpireAt": "1977-03-05T00:00:00Z", "discountPercentage": 65, "discountPurchaseAt": "1975-07-30T00:00:00Z", "discountedPrice": 96, "expireAt": "1995-01-30T00:00:00Z", "price": 89, "purchaseAt": "1983-07-29T00:00:00Z", "trialPrice": 26}, {"currencyCode": "VgA04tYy", "currencyNamespace": "mUZWmxOQ", "currencyType": "REAL", "discountAmount": 0, "discountExpireAt": "1988-10-27T00:00:00Z", "discountPercentage": 27, "discountPurchaseAt": "1985-07-21T00:00:00Z", "discountedPrice": 80, "expireAt": "1988-08-31T00:00:00Z", "price": 5, "purchaseAt": "1971-03-05T00:00:00Z", "trialPrice": 46}, {"currencyCode": "WhQEd0A7", "currencyNamespace": "cVqR3ZwI", "currencyType": "VIRTUAL", "discountAmount": 86, "discountExpireAt": "1973-08-23T00:00:00Z", "discountPercentage": 78, "discountPurchaseAt": "1973-06-07T00:00:00Z", "discountedPrice": 30, "expireAt": "1990-07-29T00:00:00Z", "price": 38, "purchaseAt": "1978-03-09T00:00:00Z", "trialPrice": 11}], "F3pTgcxg": [{"currencyCode": "l3CWshqn", "currencyNamespace": "9NjL2vyi", "currencyType": "VIRTUAL", "discountAmount": 84, "discountExpireAt": "1990-05-31T00:00:00Z", "discountPercentage": 46, "discountPurchaseAt": "1998-05-02T00:00:00Z", "discountedPrice": 8, "expireAt": "1999-01-06T00:00:00Z", "price": 26, "purchaseAt": "1984-02-19T00:00:00Z", "trialPrice": 47}, {"currencyCode": "bo3yxfuP", "currencyNamespace": "WPBMtEcs", "currencyType": "VIRTUAL", "discountAmount": 4, "discountExpireAt": "1975-04-02T00:00:00Z", "discountPercentage": 9, "discountPurchaseAt": "1971-07-05T00:00:00Z", "discountedPrice": 9, "expireAt": "1974-05-18T00:00:00Z", "price": 73, "purchaseAt": "1973-11-07T00:00:00Z", "trialPrice": 0}, {"currencyCode": "6SzOksWH", "currencyNamespace": "2zKyn6TC", "currencyType": "VIRTUAL", "discountAmount": 24, "discountExpireAt": "1990-11-18T00:00:00Z", "discountPercentage": 11, "discountPurchaseAt": "1991-05-27T00:00:00Z", "discountedPrice": 8, "expireAt": "1978-03-19T00:00:00Z", "price": 84, "purchaseAt": "1996-10-09T00:00:00Z", "trialPrice": 32}]}}]}' \
    > test.out 2>&1
eval_tap $? 138 'BulkUpdateRegionData' test.out

#- 139 SearchItems
./ng net.accelbyte.sdk.cli.Main platform searchItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemType 'CODE' \
    --limit '23' \
    --offset '39' \
    --sortBy 'qaJAtjzp' \
    --storeId 'QiiO4GRT' \
    --keyword 'w3YqSaa1' \
    --language '6OhpJZ96' \
    > test.out 2>&1
eval_tap $? 139 'SearchItems' test.out

#- 140 QueryUncategorizedItems
./ng net.accelbyte.sdk.cli.Main platform queryUncategorizedItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --limit '68' \
    --offset '64' \
    --sortBy 'createdAt,updatedAt:asc,createdAt:asc' \
    --storeId 'pkFZNPW5' \
    > test.out 2>&1
eval_tap $? 140 'QueryUncategorizedItems' test.out

#- 141 GetItem
./ng net.accelbyte.sdk.cli.Main platform getItem \
    --itemId 'K83LSNVu' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId '3Vz3oAJw' \
    > test.out 2>&1
eval_tap $? 141 'GetItem' test.out

#- 142 UpdateItem
./ng net.accelbyte.sdk.cli.Main platform updateItem \
    --itemId 'QNor0ADz' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'QsocZOCd' \
    --body '{"appId": "tU09hIEz", "appType": "GAME", "baseAppId": "kJGRVZQk", "boothName": "tEHWDQdJ", "categoryPath": "7lElI5Wt", "clazz": "AGSsCCUJ", "displayOrder": 21, "entitlementType": "DURABLE", "ext": {"CzBiCvBL": {}, "UQIcw8VM": {}, "9Hp9bHiZ": {}}, "features": ["N28epF2j", "zmclLW9O", "LXBF38C4"], "flexible": true, "images": [{"as": "xNzTSqHm", "caption": "4jqqfbuy", "height": 11, "imageUrl": "9jviPjPW", "smallImageUrl": "uoMkTP69", "width": 33}, {"as": "gbbVkaOy", "caption": "njJk8mac", "height": 16, "imageUrl": "tV1rIbX4", "smallImageUrl": "IFzv7fLo", "width": 36}, {"as": "I8m1PnaQ", "caption": "fc5jEaJ9", "height": 55, "imageUrl": "LQj11L0j", "smallImageUrl": "w7JSfwo6", "width": 78}], "inventoryConfig": {"customAttributes": {"MWUD0Aaw": {}, "I8K70Pwr": {}, "VY0cyDmY": {}}, "serverCustomAttributes": {"0zVSkzhX": {}, "RABQfnMy": {}, "9qu62X7g": {}}, "slotUsed": 72}, "itemIds": ["zBRNS80R", "m4u6RiZX", "JumdOqkR"], "itemQty": {"VH5sYmxl": 68, "mrfDvYnq": 25, "C8iY2x5I": 19}, "itemType": "MEDIA", "listable": true, "localizations": {"T200CIjB": {"description": "pethgf7J", "localExt": {"MT6YWG9d": {}, "yERy1Pro": {}, "9KRztIJI": {}}, "longDescription": "QHAqHvSP", "title": "hzAbtfD0"}, "GzBLd1IR": {"description": "6DWaF8LM", "localExt": {"iFCgy1ID": {}, "CS4IdWUk": {}, "YBr8pBMQ": {}}, "longDescription": "JVhopJjU", "title": "N5t1Jz6D"}, "1i9cW4cV": {"description": "aTPDcvnB", "localExt": {"bFY2t9UG": {}, "cpxcp7LK": {}, "wWaTfmLw": {}}, "longDescription": "7VIxvy2f", "title": "V9BJ4Fp1"}}, "lootBoxConfig": {"rewardCount": 43, "rewards": [{"lootBoxItems": [{"count": 50, "duration": 69, "endDate": "1993-10-03T00:00:00Z", "itemId": "RVks8i8G", "itemSku": "MPSzGBzV", "itemType": "rYckNNZp"}, {"count": 70, "duration": 14, "endDate": "1997-08-08T00:00:00Z", "itemId": "9FnnLd0p", "itemSku": "yR0gd1Wv", "itemType": "gTlYXIpt"}, {"count": 80, "duration": 23, "endDate": "1988-03-23T00:00:00Z", "itemId": "60exuoKz", "itemSku": "zToBOObL", "itemType": "BLiMnsD0"}], "name": "jQdLvQSX", "odds": 0.1130773301328164, "type": "REWARD_GROUP", "weight": 39}, {"lootBoxItems": [{"count": 59, "duration": 28, "endDate": "1990-01-25T00:00:00Z", "itemId": "Ia7xdjmS", "itemSku": "PR5pWlf7", "itemType": "Lk5s79Oe"}, {"count": 49, "duration": 33, "endDate": "1974-04-28T00:00:00Z", "itemId": "YrhBMglN", "itemSku": "bvx3lk56", "itemType": "ywtxlk7O"}, {"count": 37, "duration": 52, "endDate": "1978-12-14T00:00:00Z", "itemId": "c3nL5zqv", "itemSku": "gxWg375p", "itemType": "BqLU61AM"}], "name": "5NyMLuq3", "odds": 0.7385864128603838, "type": "PROBABILITY_GROUP", "weight": 64}, {"lootBoxItems": [{"count": 73, "duration": 13, "endDate": "1987-12-24T00:00:00Z", "itemId": "oDPdAfUV", "itemSku": "p0eh4Qts", "itemType": "AkgcnQo6"}, {"count": 23, "duration": 32, "endDate": "1999-08-21T00:00:00Z", "itemId": "9rBMa8zi", "itemSku": "NLXXSEdn", "itemType": "GhMaJAwQ"}, {"count": 90, "duration": 84, "endDate": "1992-08-08T00:00:00Z", "itemId": "V8Y8Rl2Q", "itemSku": "mV6lguyq", "itemType": "SFfCHrKS"}], "name": "ZxXGuVsg", "odds": 0.07158215185224759, "type": "REWARD", "weight": 42}], "rollFunction": "DEFAULT"}, "maxCount": 92, "maxCountPerUser": 26, "name": "zfNUDFo7", "optionBoxConfig": {"boxItems": [{"count": 2, "duration": 55, "endDate": "1971-08-25T00:00:00Z", "itemId": "fOgJNoBO", "itemSku": "0SdNSVey", "itemType": "23zbqrhr"}, {"count": 8, "duration": 75, "endDate": "1979-03-13T00:00:00Z", "itemId": "YfmTMS9D", "itemSku": "o2thjb9l", "itemType": "54pGHxdH"}, {"count": 81, "duration": 54, "endDate": "1981-03-23T00:00:00Z", "itemId": "4kkrTjpr", "itemSku": "bmvVqwne", "itemType": "Ln6dgo2X"}]}, "purchasable": true, "recurring": {"cycle": "QUARTERLY", "fixedFreeDays": 7, "fixedTrialCycles": 77, "graceDays": 82}, "regionData": {"Tu1QRFBM": [{"currencyCode": "uu0mhASs", "currencyNamespace": "zBtmL8AN", "currencyType": "VIRTUAL", "discountAmount": 37, "discountExpireAt": "1981-11-25T00:00:00Z", "discountPercentage": 51, "discountPurchaseAt": "1996-07-01T00:00:00Z", "expireAt": "1982-09-17T00:00:00Z", "price": 47, "purchaseAt": "1991-05-14T00:00:00Z", "trialPrice": 32}, {"currencyCode": "NyWFvh5l", "currencyNamespace": "6hIntDZ2", "currencyType": "VIRTUAL", "discountAmount": 45, "discountExpireAt": "1974-09-10T00:00:00Z", "discountPercentage": 23, "discountPurchaseAt": "1986-04-26T00:00:00Z", "expireAt": "1974-03-29T00:00:00Z", "price": 33, "purchaseAt": "1997-03-10T00:00:00Z", "trialPrice": 92}, {"currencyCode": "o51Ljae5", "currencyNamespace": "MVker3Kr", "currencyType": "REAL", "discountAmount": 39, "discountExpireAt": "1988-01-25T00:00:00Z", "discountPercentage": 14, "discountPurchaseAt": "1979-10-31T00:00:00Z", "expireAt": "1991-11-01T00:00:00Z", "price": 21, "purchaseAt": "1985-07-23T00:00:00Z", "trialPrice": 22}], "hsGZ7sfx": [{"currencyCode": "PnkF2uns", "currencyNamespace": "V2JLSnac", "currencyType": "REAL", "discountAmount": 52, "discountExpireAt": "1989-09-19T00:00:00Z", "discountPercentage": 74, "discountPurchaseAt": "1978-06-25T00:00:00Z", "expireAt": "1978-07-29T00:00:00Z", "price": 53, "purchaseAt": "1981-06-11T00:00:00Z", "trialPrice": 48}, {"currencyCode": "Z1zdhWN7", "currencyNamespace": "D2Z6pXHc", "currencyType": "REAL", "discountAmount": 15, "discountExpireAt": "1986-04-26T00:00:00Z", "discountPercentage": 62, "discountPurchaseAt": "1996-04-21T00:00:00Z", "expireAt": "1993-09-04T00:00:00Z", "price": 83, "purchaseAt": "1999-10-15T00:00:00Z", "trialPrice": 50}, {"currencyCode": "xltLBRCg", "currencyNamespace": "CseEV7KA", "currencyType": "REAL", "discountAmount": 97, "discountExpireAt": "1973-03-27T00:00:00Z", "discountPercentage": 32, "discountPurchaseAt": "1980-07-11T00:00:00Z", "expireAt": "1992-07-22T00:00:00Z", "price": 84, "purchaseAt": "1980-01-22T00:00:00Z", "trialPrice": 25}], "FfX0m6Nm": [{"currencyCode": "wg8t0WmR", "currencyNamespace": "Lv2EBje4", "currencyType": "REAL", "discountAmount": 18, "discountExpireAt": "1996-04-06T00:00:00Z", "discountPercentage": 35, "discountPurchaseAt": "1971-02-23T00:00:00Z", "expireAt": "1995-02-26T00:00:00Z", "price": 13, "purchaseAt": "1997-10-21T00:00:00Z", "trialPrice": 94}, {"currencyCode": "l3ODr474", "currencyNamespace": "xcNn2jEm", "currencyType": "REAL", "discountAmount": 58, "discountExpireAt": "1978-04-05T00:00:00Z", "discountPercentage": 80, "discountPurchaseAt": "1981-07-14T00:00:00Z", "expireAt": "1997-06-16T00:00:00Z", "price": 95, "purchaseAt": "1994-07-23T00:00:00Z", "trialPrice": 5}, {"currencyCode": "9W4fQNBm", "currencyNamespace": "THAxms67", "currencyType": "VIRTUAL", "discountAmount": 45, "discountExpireAt": "1975-07-29T00:00:00Z", "discountPercentage": 95, "discountPurchaseAt": "1994-02-09T00:00:00Z", "expireAt": "1999-07-27T00:00:00Z", "price": 98, "purchaseAt": "1994-11-09T00:00:00Z", "trialPrice": 99}]}, "saleConfig": {"currencyCode": "wr7FBIgy", "price": 9}, "seasonType": "TIER", "sectionExclusive": true, "sellable": true, "sku": "p2X08hcA", "stackable": false, "status": "ACTIVE", "tags": ["bLycBhLD", "jGXlvUgW", "yGOPTpXR"], "targetCurrencyCode": "uLUIcB0d", "targetNamespace": "ZpmHY2qe", "thumbnailUrl": "kcKXF3EU", "useCount": 82}' \
    > test.out 2>&1
eval_tap $? 142 'UpdateItem' test.out

#- 143 DeleteItem
./ng net.accelbyte.sdk.cli.Main platform deleteItem \
    --itemId 'VFXD2XRi' \
    --namespace "$AB_NAMESPACE" \
    --featuresToCheck 'ENTITLEMENT,IAP,IAP' \
    --force  \
    --storeId '6TKFSHW5' \
    > test.out 2>&1
eval_tap $? 143 'DeleteItem' test.out

#- 144 AcquireItem
./ng net.accelbyte.sdk.cli.Main platform acquireItem \
    --itemId 'ge5NtKLV' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 71, "orderNo": "iu6bLlZb"}' \
    > test.out 2>&1
eval_tap $? 144 'AcquireItem' test.out

#- 145 GetApp
./ng net.accelbyte.sdk.cli.Main platform getApp \
    --itemId 'HYk0ZDW4' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'KRv2RVOR' \
    > test.out 2>&1
eval_tap $? 145 'GetApp' test.out

#- 146 UpdateApp
./ng net.accelbyte.sdk.cli.Main platform updateApp \
    --itemId '9RzAfHxp' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'wCTOjgVZ' \
    --body '{"carousel": [{"alt": "sGOGIJkE", "previewUrl": "FR10giZF", "thumbnailUrl": "oO67XPna", "type": "image", "url": "qldgC5qq", "videoSource": "generic"}, {"alt": "BV2PEnhm", "previewUrl": "CC67Zbi3", "thumbnailUrl": "41MWdztB", "type": "image", "url": "bvJyXfLc", "videoSource": "generic"}, {"alt": "6I2EvHUV", "previewUrl": "jU9QDmpw", "thumbnailUrl": "6A2Sj55g", "type": "image", "url": "44ZiCCbm", "videoSource": "vimeo"}], "developer": "P4BbqLrj", "forumUrl": "twoIjFZG", "genres": ["Action", "Racing", "Strategy"], "localizations": {"jL4wecBK": {"announcement": "Dv1OLvwT", "slogan": "fa2e5On1"}, "iGyM54ed": {"announcement": "Bp70JyXB", "slogan": "qJbpIQhk"}, "WD3cKGur": {"announcement": "CPqeFIQX", "slogan": "gP2rqbi2"}}, "platformRequirements": {"HFBz3m06": [{"additionals": "rj46B96U", "directXVersion": "eOl4ULAx", "diskSpace": "BEEMi1vs", "graphics": "a1igSb3T", "label": "PiROi8HS", "osVersion": "5kXNZeCV", "processor": "z62tPmzx", "ram": "qRAn3EVZ", "soundCard": "BjUShXZF"}, {"additionals": "hCdh18r4", "directXVersion": "fD52qOAE", "diskSpace": "PEkYBoTD", "graphics": "lrlA0qtW", "label": "bxM58eSW", "osVersion": "g5tmoRxa", "processor": "pDHhhkVn", "ram": "lSaf3GZm", "soundCard": "H4ftZYwy"}, {"additionals": "7Xa9hZAg", "directXVersion": "RcBgVEtY", "diskSpace": "QXGnxB2y", "graphics": "VGV2K0YA", "label": "m6QXekbR", "osVersion": "Gdlsc52C", "processor": "FFMwtGrd", "ram": "53vdvyUv", "soundCard": "QBPtnftj"}], "NXV3Z3aC": [{"additionals": "l1OkfjzJ", "directXVersion": "ZvS5fs2P", "diskSpace": "7hhaUwLh", "graphics": "X5R1LqmT", "label": "GUlnHrWr", "osVersion": "SEEDN5dz", "processor": "YxN5fhoW", "ram": "AC7QsZQa", "soundCard": "8dYpEmY6"}, {"additionals": "weteAHPH", "directXVersion": "gBVUNYt8", "diskSpace": "axBianTx", "graphics": "mjU6PH9O", "label": "uzyrSQ6b", "osVersion": "OGuoeGho", "processor": "kkAcCcdX", "ram": "J5atD7rh", "soundCard": "Q26tZJ17"}, {"additionals": "d77UpIxW", "directXVersion": "gn7tNa4X", "diskSpace": "UIywhpzS", "graphics": "6duBe7dR", "label": "AXArxi9u", "osVersion": "jbEcyeJf", "processor": "frs1cUWI", "ram": "dgVNWE47", "soundCard": "BtOf7sE7"}], "lgJpnZr4": [{"additionals": "2H8oeoLB", "directXVersion": "JSvgnXkk", "diskSpace": "KGcTLn1o", "graphics": "nla1cTsh", "label": "Njzm5Yng", "osVersion": "RGuNYDoz", "processor": "MszczKgt", "ram": "QHVbItzP", "soundCard": "YuBOMtGr"}, {"additionals": "YAnpYZq6", "directXVersion": "glL7jnDH", "diskSpace": "atvmOPYV", "graphics": "eLwkYhgT", "label": "419jB95q", "osVersion": "NHL9ioES", "processor": "azsxf47I", "ram": "Za5y58Pm", "soundCard": "X7w9MLyi"}, {"additionals": "dF7gNIbW", "directXVersion": "2D2u40VL", "diskSpace": "oe16iUzT", "graphics": "IURAMfyI", "label": "DajaWfxz", "osVersion": "rDAyh3sC", "processor": "XpfbfeLo", "ram": "eYT95AvR", "soundCard": "nTLA2nDC"}]}, "platforms": ["IOS", "Windows", "MacOS"], "players": ["CrossPlatformMulti", "Multi", "CrossPlatformMulti"], "primaryGenre": "FreeToPlay", "publisher": "Mhgi0Pps", "releaseDate": "1980-05-14T00:00:00Z", "websiteUrl": "rkxoJb5B"}' \
    > test.out 2>&1
eval_tap $? 146 'UpdateApp' test.out

#- 147 DisableItem
./ng net.accelbyte.sdk.cli.Main platform disableItem \
    --itemId '35jf5OT8' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'XRpikmwY' \
    --body '{"featuresToCheck": ["IAP", "CAMPAIGN", "ENTITLEMENT"]}' \
    > test.out 2>&1
eval_tap $? 147 'DisableItem' test.out

#- 148 GetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform getItemDynamicData \
    --itemId 'wg7oJCmU' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 148 'GetItemDynamicData' test.out

#- 149 EnableItem
./ng net.accelbyte.sdk.cli.Main platform enableItem \
    --itemId '4DVcHuB9' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'dEC0CBVH' \
    > test.out 2>&1
eval_tap $? 149 'EnableItem' test.out

#- 150 FeatureItem
./ng net.accelbyte.sdk.cli.Main platform featureItem \
    --feature 'Jgdcd1PN' \
    --itemId '9dztjLr2' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ayAxDuzZ' \
    > test.out 2>&1
eval_tap $? 150 'FeatureItem' test.out

#- 151 DefeatureItem
./ng net.accelbyte.sdk.cli.Main platform defeatureItem \
    --feature 'az7bpGsK' \
    --itemId 'UkDDrCQ3' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'J7k0EzuC' \
    > test.out 2>&1
eval_tap $? 151 'DefeatureItem' test.out

#- 152 GetLocaleItem
./ng net.accelbyte.sdk.cli.Main platform getLocaleItem \
    --itemId 'vmXI7ZAC' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'paQNjYmp' \
    --populateBundle  \
    --region '9pXJ0LLp' \
    --storeId 'lumgiqkS' \
    > test.out 2>&1
eval_tap $? 152 'GetLocaleItem' test.out

#- 153 UpdateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform updateItemPurchaseCondition \
    --itemId '6WC2JQK1' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'RLFItxXK' \
    --body '{"purchaseCondition": {"conditionGroups": [{"operator": "and", "predicates": [{"anyOf": 98, "code": "itoXept5", "comparison": "isLessThan", "name": "tQSBsY8p", "predicateType": "EntitlementPredicate", "value": "FsUobHuj", "values": ["Jwu3pIqX", "VtkziVaK", "QAlJMXnn"]}, {"anyOf": 44, "code": "lQNtFT0Z", "comparison": "isGreaterThanOrEqual", "name": "K1lJvEo6", "predicateType": "StatisticCodePredicate", "value": "yONsN3Cf", "values": ["WLHJFf31", "nDkXJ0Wa", "duxFPlK2"]}, {"anyOf": 32, "code": "vRThartn", "comparison": "isLessThanOrEqual", "name": "YEv4e5UU", "predicateType": "EntitlementPredicate", "value": "3F19Oyr4", "values": ["3EdJH4k2", "KS5zZ1bE", "KoiXa7JJ"]}]}, {"operator": "or", "predicates": [{"anyOf": 18, "code": "BvwXvNJ1", "comparison": "isLessThanOrEqual", "name": "DGdfJJIy", "predicateType": "SeasonPassPredicate", "value": "kPvJ7Xz4", "values": ["MaRJ5UPw", "1kKDxQXs", "niAdv3KK"]}, {"anyOf": 81, "code": "itgoUEVu", "comparison": "excludes", "name": "Hb7snzx0", "predicateType": "StatisticCodePredicate", "value": "TE3VMmfk", "values": ["Rtja8iNk", "X51I5dIv", "0Y5VYS3V"]}, {"anyOf": 62, "code": "O7aM5T1h", "comparison": "isNot", "name": "pVURNlIc", "predicateType": "SeasonPassPredicate", "value": "Oe609Byd", "values": ["de9UkFOE", "QmEW5IJm", "48tPzlrQ"]}]}, {"operator": "and", "predicates": [{"anyOf": 53, "code": "BciBCAg9", "comparison": "excludes", "name": "Y0ZtTG41", "predicateType": "SeasonTierPredicate", "value": "7tVKHIrv", "values": ["bROIC1Zq", "yalC0jmT", "Y1fpfy7d"]}, {"anyOf": 90, "code": "W285cAg1", "comparison": "isGreaterThan", "name": "OXCRTQE7", "predicateType": "StatisticCodePredicate", "value": "TvOpaL73", "values": ["X0GFAkEJ", "ST5G16Ku", "yN2pD4cV"]}, {"anyOf": 97, "code": "M1HnMH8f", "comparison": "excludes", "name": "PFHc3g8y", "predicateType": "EntitlementPredicate", "value": "FWKnI9kb", "values": ["UdW3dNlC", "Igbz5EHS", "JBSeGmc6"]}]}]}}' \
    > test.out 2>&1
eval_tap $? 153 'UpdateItemPurchaseCondition' test.out

#- 154 QueryItemReferences
./ng net.accelbyte.sdk.cli.Main platform queryItemReferences \
    --itemId 'bxQJBbvc' \
    --namespace "$AB_NAMESPACE" \
    --featuresToCheck 'ENTITLEMENT,CATALOG,REWARD' \
    --storeId 'E6Zywmsr' \
    > test.out 2>&1
eval_tap $? 154 'QueryItemReferences' test.out

#- 155 ReturnItem
./ng net.accelbyte.sdk.cli.Main platform returnItem \
    --itemId 'aWTRSHHh' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "9FyqnHVl"}' \
    > test.out 2>&1
eval_tap $? 155 'ReturnItem' test.out

#- 156 QueryKeyGroups
./ng net.accelbyte.sdk.cli.Main platform queryKeyGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '59' \
    --name 'qG2yxvu1' \
    --offset '79' \
    --tag 'n33ReRlD' \
    > test.out 2>&1
eval_tap $? 156 'QueryKeyGroups' test.out

#- 157 CreateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform createKeyGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "BhPcogHD", "name": "KrGvKoA6", "status": "ACTIVE", "tags": ["z3ekOSJ9", "mP4NK4lE", "ANmmpLb7"]}' \
    > test.out 2>&1
eval_tap $? 157 'CreateKeyGroup' test.out

#- 158 GetKeyGroupByBoothName
eval_tap 0 158 'GetKeyGroupByBoothName # SKIP deprecated' test.out

#- 159 GetKeyGroup
./ng net.accelbyte.sdk.cli.Main platform getKeyGroup \
    --keyGroupId 'orQGc70T' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 159 'GetKeyGroup' test.out

#- 160 UpdateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform updateKeyGroup \
    --keyGroupId '8ymmRfvB' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "mOhx9Omo", "name": "w6IiRhtm", "status": "INACTIVE", "tags": ["Rxf7GgI8", "UwpWdvGc", "97Yro082"]}' \
    > test.out 2>&1
eval_tap $? 160 'UpdateKeyGroup' test.out

#- 161 GetKeyGroupDynamic
./ng net.accelbyte.sdk.cli.Main platform getKeyGroupDynamic \
    --keyGroupId 'fKUM2sWZ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 161 'GetKeyGroupDynamic' test.out

#- 162 ListKeys
./ng net.accelbyte.sdk.cli.Main platform listKeys \
    --keyGroupId 'nPwgUQPA' \
    --namespace "$AB_NAMESPACE" \
    --limit '9' \
    --offset '23' \
    --status 'ACTIVE' \
    > test.out 2>&1
eval_tap $? 162 'ListKeys' test.out

#- 163 UploadKeys
./ng net.accelbyte.sdk.cli.Main platform uploadKeys \
    --keyGroupId 'RgvjU4Vm' \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 163 'UploadKeys' test.out

#- 164 QueryOrders
./ng net.accelbyte.sdk.cli.Main platform queryOrders \
    --namespace "$AB_NAMESPACE" \
    --endTime 'yRLRFcC4' \
    --limit '97' \
    --offset '91' \
    --orderNos 'faCDko49,dlq9FmvS,lUPeqXDy' \
    --sortBy '0IZg3VQ3' \
    --startTime 'o1fRFXZP' \
    --status 'FULFILL_FAILED' \
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
    --orderNo 'ELk08Msx' \
    > test.out 2>&1
eval_tap $? 166 'GetOrder' test.out

#- 167 RefundOrder
./ng net.accelbyte.sdk.cli.Main platform refundOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'E17CXk91' \
    --body '{"description": "u1NbGEP2"}' \
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
    --body '{"domains": ["DQZuOcq6", "eftzbCkW", "wd1s9G5f"]}' \
    > test.out 2>&1
eval_tap $? 171 'UpdatePaymentDomainWhitelistConfig' test.out

#- 172 QueryPaymentNotifications
./ng net.accelbyte.sdk.cli.Main platform queryPaymentNotifications \
    --namespace "$AB_NAMESPACE" \
    --endDate 'u7iAv0nK' \
    --externalId '1OFLbhkh' \
    --limit '77' \
    --notificationSource 'XSOLLA' \
    --notificationType 'Mq8DamlM' \
    --offset '1' \
    --paymentOrderNo 'bhR9m9VC' \
    --startDate 'aFKdZnSr' \
    --status 'PROCESSED' \
    > test.out 2>&1
eval_tap $? 172 'QueryPaymentNotifications' test.out

#- 173 QueryPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform queryPaymentOrders \
    --namespace "$AB_NAMESPACE" \
    --channel 'INTERNAL' \
    --extTxId '3DocH9XJ' \
    --limit '43' \
    --offset '95' \
    --status 'INIT' \
    > test.out 2>&1
eval_tap $? 173 'QueryPaymentOrders' test.out

#- 174 CreatePaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform createPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --body '{"currencyCode": "U7T3246E", "currencyNamespace": "lMqJtGw4", "customParameters": {"cK176uyH": {}, "bAq1qD9p": {}, "G0QFmUqV": {}}, "description": "Mn92S1up", "extOrderNo": "TdmOPQG6", "extUserId": "qdoHo0s7", "itemType": "EXTENSION", "language": "AKe-dnFi", "metadata": {"2wZjx4mI": "K3f5XVDc", "l4IUPe9z": "yQTdikiM", "tL9ojRcd": "Bp06ph1K"}, "notifyUrl": "INCRZjYB", "omitNotification": false, "platform": "lud0KnJj", "price": 74, "recurringPaymentOrderNo": "rp1JSGuT", "region": "erMqlM3L", "returnUrl": "G8jPvVEJ", "sandbox": true, "sku": "KnFkyBFB", "subscriptionId": "izZ0ZloT", "targetNamespace": "dGKXekNA", "targetUserId": "GjkSZ058", "title": "ar8Pq8Ub"}' \
    > test.out 2>&1
eval_tap $? 174 'CreatePaymentOrderByDedicated' test.out

#- 175 ListExtOrderNoByExtTxId
./ng net.accelbyte.sdk.cli.Main platform listExtOrderNoByExtTxId \
    --namespace "$AB_NAMESPACE" \
    --extTxId 'uMZR3UH2' \
    > test.out 2>&1
eval_tap $? 175 'ListExtOrderNoByExtTxId' test.out

#- 176 GetPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'I3IXZhNm' \
    > test.out 2>&1
eval_tap $? 176 'GetPaymentOrder' test.out

#- 177 ChargePaymentOrder
./ng net.accelbyte.sdk.cli.Main platform chargePaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'HSGyjgTk' \
    --body '{"extTxId": "mtNVlpYY", "paymentMethod": "cCdaHAkU", "paymentProvider": "XSOLLA"}' \
    > test.out 2>&1
eval_tap $? 177 'ChargePaymentOrder' test.out

#- 178 RefundPaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform refundPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'S5Khqxlm' \
    --body '{"description": "v1b4rigE"}' \
    > test.out 2>&1
eval_tap $? 178 'RefundPaymentOrderByDedicated' test.out

#- 179 SimulatePaymentOrderNotification
./ng net.accelbyte.sdk.cli.Main platform simulatePaymentOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'zmh1WWiT' \
    --body '{"amount": 54, "currencyCode": "hZvbAQNB", "notifyType": "REFUND", "paymentProvider": "STRIPE", "salesTax": 29, "vat": 90}' \
    > test.out 2>&1
eval_tap $? 179 'SimulatePaymentOrderNotification' test.out

#- 180 GetPaymentOrderChargeStatus
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrderChargeStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '4nlGyIrI' \
    > test.out 2>&1
eval_tap $? 180 'GetPaymentOrderChargeStatus' test.out

#- 181 GetPsnEntitlementOwnership
./ng net.accelbyte.sdk.cli.Main platform getPsnEntitlementOwnership \
    --entitlementLabel 'pkafqD8B' \
    --namespace "$AB_NAMESPACE" \
    --body '{"accessToken": "21NfymwF", "serviceLabel": 87}' \
    > test.out 2>&1
eval_tap $? 181 'GetPsnEntitlementOwnership' test.out

#- 182 GetXboxEntitlementOwnership
./ng net.accelbyte.sdk.cli.Main platform getXboxEntitlementOwnership \
    --namespace "$AB_NAMESPACE" \
    --productSku 'wRAQ6Ity' \
    --body '{"delegationToken": "GekD9Iur", "sandboxId": "VUSaxJeQ"}' \
    > test.out 2>&1
eval_tap $? 182 'GetXboxEntitlementOwnership' test.out

#- 183 GetPlatformEntitlementConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformEntitlementConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'GooglePlay' \
    > test.out 2>&1
eval_tap $? 183 'GetPlatformEntitlementConfig' test.out

#- 184 UpdatePlatformEntitlementConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformEntitlementConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Nintendo' \
    --body '{"allowedPlatformOrigins": ["Xbox", "Epic", "Epic"]}' \
    > test.out 2>&1
eval_tap $? 184 'UpdatePlatformEntitlementConfig' test.out

#- 185 GetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Oculus' \
    > test.out 2>&1
eval_tap $? 185 'GetPlatformWalletConfig' test.out

#- 186 UpdatePlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'IOS' \
    --body '{"allowedBalanceOrigins": ["Playstation", "Epic", "Twitch"]}' \
    > test.out 2>&1
eval_tap $? 186 'UpdatePlatformWalletConfig' test.out

#- 187 ResetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform resetPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'GooglePlay' \
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
    --body '{"entitlement": {"consumable": {"enabled": false, "strategy": "REVOKE_OR_REPORT"}, "durable": {"enabled": true, "strategy": "CUSTOM"}}, "wallet": {"enabled": false, "strategy": "CUSTOM"}}' \
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
    --endTime '73srIGsV' \
    --limit '94' \
    --offset '45' \
    --source 'OTHER' \
    --startTime 'BgkZLq7E' \
    --status 'FAIL' \
    --transactionId 'MF2N9qQS' \
    --userId 'dqtsy3Vb' \
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
    --body '{"appConfig": {"appName": "gP51Wvi5"}, "customConfig": {"connectionType": "INSECURE", "grpcServerAddress": "UlgSsHWi"}, "extendType": "CUSTOM"}' \
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
    --body '{"description": "2LCvNOhC", "eventTopic": "U9wmxj2k", "maxAwarded": 51, "maxAwardedPerUser": 47, "namespaceExpression": "ODRMKcF0", "rewardCode": "USyTNjuj", "rewardConditions": [{"condition": "EnOsFHal", "conditionName": "wWm9QwBz", "eventName": "S0CIrgl6", "rewardItems": [{"duration": 32, "endDate": "1976-12-16T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "uLEdUBAx", "quantity": 91, "sku": "q2AmLpAT"}, {"duration": 45, "endDate": "1991-01-24T00:00:00Z", "identityType": "ITEM_ID", "itemId": "IxxTFHOh", "quantity": 70, "sku": "WuGxXbD9"}, {"duration": 89, "endDate": "1972-11-30T00:00:00Z", "identityType": "ITEM_ID", "itemId": "zyJX3wrL", "quantity": 74, "sku": "e4ZV7PhF"}]}, {"condition": "zt1rEquQ", "conditionName": "rb7U0Dcc", "eventName": "l1kBPlMI", "rewardItems": [{"duration": 92, "endDate": "1997-11-26T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "VhfQzaXe", "quantity": 7, "sku": "hIdj6uN8"}, {"duration": 25, "endDate": "1983-03-04T00:00:00Z", "identityType": "ITEM_ID", "itemId": "cknpyjhc", "quantity": 42, "sku": "tfEiyYUl"}, {"duration": 93, "endDate": "1994-03-08T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "cC1ilKfK", "quantity": 95, "sku": "eElNng1g"}]}, {"condition": "GEWOkJ5o", "conditionName": "EVQwFdMe", "eventName": "4TVgbpTl", "rewardItems": [{"duration": 13, "endDate": "1994-01-30T00:00:00Z", "identityType": "ITEM_ID", "itemId": "47d7TMQB", "quantity": 40, "sku": "sQDjxjTh"}, {"duration": 18, "endDate": "1994-08-30T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "CWFxhmGf", "quantity": 75, "sku": "Tsu6kEdU"}, {"duration": 70, "endDate": "1987-12-08T00:00:00Z", "identityType": "ITEM_ID", "itemId": "YWKdqEIm", "quantity": 100, "sku": "AMEDCD0t"}]}], "userIdExpression": "81tFhlfb"}' \
    > test.out 2>&1
eval_tap $? 196 'CreateReward' test.out

#- 197 QueryRewards
./ng net.accelbyte.sdk.cli.Main platform queryRewards \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'n6NnDnlz' \
    --limit '28' \
    --offset '2' \
    --sortBy 'namespace,namespace:asc' \
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
    --rewardId 'g2nBD3zz' \
    > test.out 2>&1
eval_tap $? 200 'GetReward' test.out

#- 201 UpdateReward
./ng net.accelbyte.sdk.cli.Main platform updateReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'IO8BJ3fb' \
    --body '{"description": "sWa5OO09", "eventTopic": "isiVcMnj", "maxAwarded": 89, "maxAwardedPerUser": 70, "namespaceExpression": "9JgxVUC4", "rewardCode": "kJHFwtpw", "rewardConditions": [{"condition": "W4phkIWm", "conditionName": "nBPjC11N", "eventName": "q86VRJyD", "rewardItems": [{"duration": 64, "endDate": "1978-05-29T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "tCk5UFMb", "quantity": 91, "sku": "DEyy0zHw"}, {"duration": 44, "endDate": "1995-02-06T00:00:00Z", "identityType": "ITEM_ID", "itemId": "ReZzWLVR", "quantity": 78, "sku": "CgQwbMZm"}, {"duration": 69, "endDate": "1984-06-20T00:00:00Z", "identityType": "ITEM_ID", "itemId": "x0bAjnxm", "quantity": 5, "sku": "UaOflW8Z"}]}, {"condition": "oA8UYlAA", "conditionName": "SEoTAFEk", "eventName": "dAdPzNzC", "rewardItems": [{"duration": 2, "endDate": "1973-09-16T00:00:00Z", "identityType": "ITEM_ID", "itemId": "TDJodn3b", "quantity": 54, "sku": "rx2avG6X"}, {"duration": 65, "endDate": "1999-11-28T00:00:00Z", "identityType": "ITEM_ID", "itemId": "QjyNLpXj", "quantity": 51, "sku": "Fb15O2Gl"}, {"duration": 40, "endDate": "1998-10-24T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "z4YcxUVt", "quantity": 33, "sku": "sH3Vs6lz"}]}, {"condition": "hfcAS9QP", "conditionName": "CbPMz02g", "eventName": "1U20GxrM", "rewardItems": [{"duration": 75, "endDate": "1987-01-31T00:00:00Z", "identityType": "ITEM_ID", "itemId": "KwxiItbj", "quantity": 76, "sku": "egiiOJUK"}, {"duration": 69, "endDate": "1979-04-28T00:00:00Z", "identityType": "ITEM_ID", "itemId": "RaeveGlm", "quantity": 88, "sku": "8kegb1c1"}, {"duration": 21, "endDate": "1993-10-27T00:00:00Z", "identityType": "ITEM_ID", "itemId": "bMVaeLdf", "quantity": 91, "sku": "iRtsMSJM"}]}], "userIdExpression": "1j4WBLqM"}' \
    > test.out 2>&1
eval_tap $? 201 'UpdateReward' test.out

#- 202 DeleteReward
./ng net.accelbyte.sdk.cli.Main platform deleteReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'JAj6Fznh' \
    > test.out 2>&1
eval_tap $? 202 'DeleteReward' test.out

#- 203 CheckEventCondition
./ng net.accelbyte.sdk.cli.Main platform checkEventCondition \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'bBYlEY4b' \
    --body '{"payload": {"mhGh0KD1": {}, "ssq9dSl9": {}, "ZXH2YvHF": {}}}' \
    > test.out 2>&1
eval_tap $? 203 'CheckEventCondition' test.out

#- 204 DeleteRewardConditionRecord
./ng net.accelbyte.sdk.cli.Main platform deleteRewardConditionRecord \
    --namespace "$AB_NAMESPACE" \
    --rewardId '4t6fFjSo' \
    --body '{"conditionName": "UuM2FcrD", "userId": "wHcL3r60"}' \
    > test.out 2>&1
eval_tap $? 204 'DeleteRewardConditionRecord' test.out

#- 205 QuerySections
./ng net.accelbyte.sdk.cli.Main platform querySections \
    --namespace "$AB_NAMESPACE" \
    --end 'OfnxEipY' \
    --limit '4' \
    --offset '84' \
    --start '1PfqBUH1' \
    --storeId '46rz5U66' \
    --viewId 'lD4q5FPd' \
    > test.out 2>&1
eval_tap $? 205 'QuerySections' test.out

#- 206 CreateSection
./ng net.accelbyte.sdk.cli.Main platform createSection \
    --namespace "$AB_NAMESPACE" \
    --storeId 'wYPMlJ5B' \
    --body '{"active": false, "displayOrder": 87, "endDate": "1987-03-15T00:00:00Z", "ext": {"LflmcAFl": {}, "vN1GO9h0": {}, "lYdhfYTc": {}}, "fixedPeriodRotationConfig": {"backfillType": "CUSTOM", "duration": 7, "itemCount": 70, "rule": "SEQUENCE"}, "items": [{"id": "LsdAd882", "sku": "Ezj3SGkn"}, {"id": "WRpQStJD", "sku": "GVGnqGdc"}, {"id": "SiQEGFR1", "sku": "lqUy0ZgI"}], "localizations": {"5oda4cPT": {"description": "DUXWfm3I", "localExt": {"91LuFXaq": {}, "eE9E9eLR": {}, "xgJrPmDv": {}}, "longDescription": "gwIM8PCm", "title": "sYwHZeZq"}, "3FgAoFbF": {"description": "VFKCdKLr", "localExt": {"ioPWx5au": {}, "E7xTmE5D": {}, "Yi8MC5Iz": {}}, "longDescription": "AaTZYvLu", "title": "1aKNlb0h"}, "dyYDZIzx": {"description": "0eFERcOt", "localExt": {"djVDg8Wl": {}, "ytxFbX6E": {}, "ScQS3F9U": {}}, "longDescription": "CEwHGMZR", "title": "AhgVAyIX"}}, "name": "iOYuC8yF", "rotationType": "FIXED_PERIOD", "startDate": "1986-04-08T00:00:00Z", "viewId": "ulWUMgRQ"}' \
    > test.out 2>&1
eval_tap $? 206 'CreateSection' test.out

#- 207 PurgeExpiredSection
./ng net.accelbyte.sdk.cli.Main platform purgeExpiredSection \
    --namespace "$AB_NAMESPACE" \
    --storeId 'PBDlnDMd' \
    > test.out 2>&1
eval_tap $? 207 'PurgeExpiredSection' test.out

#- 208 GetSection
./ng net.accelbyte.sdk.cli.Main platform getSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'qqM0wWXQ' \
    --storeId 'ghSfNjyr' \
    > test.out 2>&1
eval_tap $? 208 'GetSection' test.out

#- 209 UpdateSection
./ng net.accelbyte.sdk.cli.Main platform updateSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'AyPAQ5Wu' \
    --storeId 'NWNuJ0QI' \
    --body '{"active": false, "displayOrder": 43, "endDate": "1990-12-01T00:00:00Z", "ext": {"aV8l5t75": {}, "PQzhj7md": {}, "fTCIuODV": {}}, "fixedPeriodRotationConfig": {"backfillType": "NONE", "duration": 4, "itemCount": 81, "rule": "LOOP"}, "items": [{"id": "QjoTX1Rl", "sku": "rzqTLf2L"}, {"id": "Z0HIazlR", "sku": "XkO9Ouuj"}, {"id": "WLS6Rpjx", "sku": "h5iubL4q"}], "localizations": {"9MFbxmDz": {"description": "3zYc63SG", "localExt": {"auf9ZGsd": {}, "1kXiDnBz": {}, "6jVSBRUh": {}}, "longDescription": "sXp9q7rC", "title": "Rsbe0Ku5"}, "dP6viOTd": {"description": "NmlJfqsW", "localExt": {"RnLQZ5KU": {}, "AVvYmIcc": {}, "639yRpSl": {}}, "longDescription": "IEenKDZf", "title": "mwmi9lc8"}, "JBFpOZNe": {"description": "Lz0wTb8v", "localExt": {"eheUEup4": {}, "kRCfbQvt": {}, "ccKQSQE9": {}}, "longDescription": "jSkbgjce", "title": "ooH3HIyR"}}, "name": "c97tT7BN", "rotationType": "NONE", "startDate": "1971-08-05T00:00:00Z", "viewId": "tBtusyun"}' \
    > test.out 2>&1
eval_tap $? 209 'UpdateSection' test.out

#- 210 DeleteSection
./ng net.accelbyte.sdk.cli.Main platform deleteSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'RcjSEUBT' \
    --storeId 'dL9cGgZ2' \
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
    --body '{"defaultLanguage": "TZ0b4Uhz", "defaultRegion": "jQCc4iC5", "description": "YTMj3sFG", "supportedLanguages": ["Nhq0vV21", "Nx3DLzkK", "rM3kksk5"], "supportedRegions": ["o1pbZv6l", "8hrhP5tM", "SXDFZ5Nj"], "title": "rkUpCwTv"}' \
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
    --body '{"catalogType": "ITEM", "fieldsToBeIncluded": ["ZlJ8MYY1", "0lyF0BTe", "B1Uz8H6Z"], "idsToBeExported": ["TVpFPQ6r", "0G0LLK9p", "ayiJQ8qu"], "storeId": "UvybZD0i"}' \
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
    --storeId 'eh2VclOX' \
    > test.out 2>&1
eval_tap $? 221 'GetStore' test.out

#- 222 UpdateStore
./ng net.accelbyte.sdk.cli.Main platform updateStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'gQUYvrdK' \
    --body '{"defaultLanguage": "YDoyxYrA", "defaultRegion": "LzOWNqUC", "description": "sLdrM8L2", "supportedLanguages": ["NQbNZMfg", "wFS5GHTC", "yaFAndA6"], "supportedRegions": ["tBKwqwrQ", "G5292Zgr", "5mcRj3s3"], "title": "M1AhWM1V"}' \
    > test.out 2>&1
eval_tap $? 222 'UpdateStore' test.out

#- 223 DeleteStore
./ng net.accelbyte.sdk.cli.Main platform deleteStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'L7WuXc3M' \
    > test.out 2>&1
eval_tap $? 223 'DeleteStore' test.out

#- 224 QueryChanges
./ng net.accelbyte.sdk.cli.Main platform queryChanges \
    --namespace "$AB_NAMESPACE" \
    --storeId 'LjHJO4WH' \
    --action 'CREATE' \
    --itemSku '245yHq6q' \
    --itemType 'COINS' \
    --limit '87' \
    --offset '60' \
    --selected  \
    --sortBy 'createdAt:desc,createdAt:asc,updatedAt:desc' \
    --status 'UNPUBLISHED' \
    --type 'STORE' \
    --updatedAtEnd 't7L9x4cM' \
    --updatedAtStart 'yAb6SmRK' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 224 'QueryChanges' test.out

#- 225 PublishAll
./ng net.accelbyte.sdk.cli.Main platform publishAll \
    --namespace "$AB_NAMESPACE" \
    --storeId 'EO1dfCCf' \
    > test.out 2>&1
eval_tap $? 225 'PublishAll' test.out

#- 226 PublishSelected
./ng net.accelbyte.sdk.cli.Main platform publishSelected \
    --namespace "$AB_NAMESPACE" \
    --storeId '80gO1OxA' \
    > test.out 2>&1
eval_tap $? 226 'PublishSelected' test.out

#- 227 SelectAllRecords
./ng net.accelbyte.sdk.cli.Main platform selectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'MAx7vGNW' \
    > test.out 2>&1
eval_tap $? 227 'SelectAllRecords' test.out

#- 228 SelectAllRecordsByCriteria
./ng net.accelbyte.sdk.cli.Main platform selectAllRecordsByCriteria \
    --namespace "$AB_NAMESPACE" \
    --storeId '77AnEkqx' \
    --action 'UPDATE' \
    --itemSku 'EJFygPul' \
    --itemType 'CODE' \
    --selected  \
    --type 'SECTION' \
    --updatedAtEnd 'mU7SYEYX' \
    --updatedAtStart 'zFpUCqp0' \
    > test.out 2>&1
eval_tap $? 228 'SelectAllRecordsByCriteria' test.out

#- 229 GetStatistic
./ng net.accelbyte.sdk.cli.Main platform getStatistic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'RhlvVgx0' \
    --action 'CREATE' \
    --itemSku 'mSmAvQpU' \
    --itemType 'INGAMEITEM' \
    --type 'VIEW' \
    --updatedAtEnd 'hh2Gtll3' \
    --updatedAtStart 'H8cTkSkV' \
    > test.out 2>&1
eval_tap $? 229 'GetStatistic' test.out

#- 230 UnselectAllRecords
./ng net.accelbyte.sdk.cli.Main platform unselectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'SKzGcUng' \
    > test.out 2>&1
eval_tap $? 230 'UnselectAllRecords' test.out

#- 231 SelectRecord
./ng net.accelbyte.sdk.cli.Main platform selectRecord \
    --changeId 'OjPiPNbs' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'HRessCcB' \
    > test.out 2>&1
eval_tap $? 231 'SelectRecord' test.out

#- 232 UnselectRecord
./ng net.accelbyte.sdk.cli.Main platform unselectRecord \
    --changeId 'eboavo8P' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Zoa3qUIN' \
    > test.out 2>&1
eval_tap $? 232 'UnselectRecord' test.out

#- 233 CloneStore
./ng net.accelbyte.sdk.cli.Main platform cloneStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'hDimBckP' \
    --targetStoreId 'LvcnbFIt' \
    > test.out 2>&1
eval_tap $? 233 'CloneStore' test.out

#- 234 ExportStore
eval_tap 0 234 'ExportStore # SKIP deprecated' test.out

#- 235 QueryImportHistory
./ng net.accelbyte.sdk.cli.Main platform queryImportHistory \
    --namespace "$AB_NAMESPACE" \
    --storeId 'OAesag4O' \
    --end 'TsYYwDaQ' \
    --limit '49' \
    --offset '33' \
    --sortBy 'HLqWgunN' \
    --start 'edO3DAHo' \
    --success  \
    > test.out 2>&1
eval_tap $? 235 'QueryImportHistory' test.out

#- 236 ImportStoreByCSV
./ng net.accelbyte.sdk.cli.Main platform importStoreByCSV \
    --namespace "$AB_NAMESPACE" \
    --storeId '9ozaMdRA' \
    --category 'tmp.dat' \
    --display 'tmp.dat' \
    --item 'tmp.dat' \
    --notes 'l4UBl0Dw' \
    --section 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 236 'ImportStoreByCSV' test.out

#- 237 QuerySubscriptions
./ng net.accelbyte.sdk.cli.Main platform querySubscriptions \
    --namespace "$AB_NAMESPACE" \
    --chargeStatus 'CHARGED' \
    --itemId 'naXF7Soq' \
    --limit '26' \
    --offset '6' \
    --sku 'ogL0xL3U' \
    --status 'EXPIRED' \
    --subscribedBy 'PLATFORM' \
    --userId 'UFNBUEZc' \
    > test.out 2>&1
eval_tap $? 237 'QuerySubscriptions' test.out

#- 238 RecurringChargeSubscription
./ng net.accelbyte.sdk.cli.Main platform recurringChargeSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'OnOMauBt' \
    > test.out 2>&1
eval_tap $? 238 'RecurringChargeSubscription' test.out

#- 239 GetTicketDynamic
./ng net.accelbyte.sdk.cli.Main platform getTicketDynamic \
    --boothName 'urGbeiMN' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 239 'GetTicketDynamic' test.out

#- 240 DecreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform decreaseTicketSale \
    --boothName 'SwWQtaix' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "K0ekEsKL"}' \
    > test.out 2>&1
eval_tap $? 240 'DecreaseTicketSale' test.out

#- 241 GetTicketBoothID
./ng net.accelbyte.sdk.cli.Main platform getTicketBoothID \
    --boothName 'SaoXWJy1' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 241 'GetTicketBoothID' test.out

#- 242 IncreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform increaseTicketSale \
    --boothName 'X7PkQTKl' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 95, "orderNo": "cNQewdej"}' \
    > test.out 2>&1
eval_tap $? 242 'IncreaseTicketSale' test.out

#- 243 Commit
./ng net.accelbyte.sdk.cli.Main platform commit \
    --namespace "$AB_NAMESPACE" \
    --body '{"actions": [{"operations": [{"creditPayload": {"balanceOrigin": "Nintendo", "count": 70, "currencyCode": "Uct2V5bC", "expireAt": "1979-02-13T00:00:00Z"}, "debitPayload": {"count": 27, "currencyCode": "TRBn24cm", "walletPlatform": "Steam"}, "fulFillItemPayload": {"count": 31, "entitlementCollectionId": "nYwWBPv8", "entitlementOrigin": "Other", "itemIdentity": "bzJ3mhC6", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 30, "entitlementId": "z7LVdmqp"}, "type": "FULFILL_ITEM"}, {"creditPayload": {"balanceOrigin": "Xbox", "count": 47, "currencyCode": "NYSIzy0j", "expireAt": "1983-01-15T00:00:00Z"}, "debitPayload": {"count": 36, "currencyCode": "iMAZeTZd", "walletPlatform": "Epic"}, "fulFillItemPayload": {"count": 66, "entitlementCollectionId": "kmosuLQ4", "entitlementOrigin": "Playstation", "itemIdentity": "6hiIfGDN", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 74, "entitlementId": "pHnYq28h"}, "type": "FULFILL_ITEM"}, {"creditPayload": {"balanceOrigin": "Twitch", "count": 49, "currencyCode": "GLeIoHlc", "expireAt": "1993-09-24T00:00:00Z"}, "debitPayload": {"count": 100, "currencyCode": "WVe6x0Sf", "walletPlatform": "Other"}, "fulFillItemPayload": {"count": 81, "entitlementCollectionId": "DJBa9UCO", "entitlementOrigin": "Oculus", "itemIdentity": "aKhLuYUD", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 52, "entitlementId": "pSROVRBa"}, "type": "FULFILL_ITEM"}], "userId": "ySxOhK2s"}, {"operations": [{"creditPayload": {"balanceOrigin": "Steam", "count": 36, "currencyCode": "8yVIKrUh", "expireAt": "1991-01-30T00:00:00Z"}, "debitPayload": {"count": 62, "currencyCode": "MMt7UWsp", "walletPlatform": "IOS"}, "fulFillItemPayload": {"count": 25, "entitlementCollectionId": "lHMgcEQq", "entitlementOrigin": "Other", "itemIdentity": "iVTuFmBI", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 43, "entitlementId": "VNt4fL8w"}, "type": "DEBIT_WALLET"}, {"creditPayload": {"balanceOrigin": "System", "count": 12, "currencyCode": "s2q1ElAn", "expireAt": "1991-04-16T00:00:00Z"}, "debitPayload": {"count": 12, "currencyCode": "YixyPI0E", "walletPlatform": "Playstation"}, "fulFillItemPayload": {"count": 16, "entitlementCollectionId": "50L29fFv", "entitlementOrigin": "Oculus", "itemIdentity": "RwbYgrpQ", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 67, "entitlementId": "gVw6aiMW"}, "type": "FULFILL_ITEM"}, {"creditPayload": {"balanceOrigin": "System", "count": 65, "currencyCode": "76VNbgqf", "expireAt": "1994-03-23T00:00:00Z"}, "debitPayload": {"count": 22, "currencyCode": "TRYuDm1j", "walletPlatform": "Xbox"}, "fulFillItemPayload": {"count": 49, "entitlementCollectionId": "lkkfG7sN", "entitlementOrigin": "System", "itemIdentity": "pgXPsisp", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 31, "entitlementId": "bfm2ZUIC"}, "type": "CREDIT_WALLET"}], "userId": "4TEtC547"}, {"operations": [{"creditPayload": {"balanceOrigin": "Xbox", "count": 36, "currencyCode": "OeQHQALx", "expireAt": "1972-08-07T00:00:00Z"}, "debitPayload": {"count": 53, "currencyCode": "PVohZh6Y", "walletPlatform": "Other"}, "fulFillItemPayload": {"count": 18, "entitlementCollectionId": "sXnJgenp", "entitlementOrigin": "Oculus", "itemIdentity": "FDwxPG6j", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 39, "entitlementId": "KoNBIO6h"}, "type": "DEBIT_WALLET"}, {"creditPayload": {"balanceOrigin": "Oculus", "count": 35, "currencyCode": "hwc6yH5v", "expireAt": "1986-04-28T00:00:00Z"}, "debitPayload": {"count": 33, "currencyCode": "254lzMuE", "walletPlatform": "Xbox"}, "fulFillItemPayload": {"count": 59, "entitlementCollectionId": "WivXvKhw", "entitlementOrigin": "Nintendo", "itemIdentity": "UkW5m0zo", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 58, "entitlementId": "LzkWFknb"}, "type": "FULFILL_ITEM"}, {"creditPayload": {"balanceOrigin": "Nintendo", "count": 84, "currencyCode": "SeRY6DLv", "expireAt": "1991-11-30T00:00:00Z"}, "debitPayload": {"count": 95, "currencyCode": "jI6hFDAX", "walletPlatform": "Steam"}, "fulFillItemPayload": {"count": 90, "entitlementCollectionId": "gMjMJ9uV", "entitlementOrigin": "Other", "itemIdentity": "cSuP2pNm", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 51, "entitlementId": "l0VS0W4N"}, "type": "DEBIT_WALLET"}], "userId": "UbamD1dT"}], "metadata": {"ZSAh3B4I": {}, "wBZ9Lz7v": {}, "rPhOippN": {}}, "needPreCheck": false, "transactionId": "4IToyDAl", "type": "MkHc3dYq"}' \
    > test.out 2>&1
eval_tap $? 243 'Commit' test.out

#- 244 GetTradeHistoryByCriteria
./ng net.accelbyte.sdk.cli.Main platform getTradeHistoryByCriteria \
    --namespace "$AB_NAMESPACE" \
    --limit '69' \
    --offset '17' \
    --status 'INIT' \
    --type 'aBqLLHw5' \
    --userId 'fNnJx4t3' \
    > test.out 2>&1
eval_tap $? 244 'GetTradeHistoryByCriteria' test.out

#- 245 GetTradeHistoryByTransactionId
./ng net.accelbyte.sdk.cli.Main platform getTradeHistoryByTransactionId \
    --namespace "$AB_NAMESPACE" \
    --transactionId '1H2G1I0p' \
    > test.out 2>&1
eval_tap $? 245 'GetTradeHistoryByTransactionId' test.out

#- 246 UnlockSteamUserAchievement
./ng net.accelbyte.sdk.cli.Main platform unlockSteamUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId '7AVFENGG' \
    --body '{"achievements": [{"id": "j3XmaP9y", "value": 94}, {"id": "b0rrhCxf", "value": 88}, {"id": "ZAvaC2U2", "value": 77}], "steamUserId": "fynoyyfy"}' \
    > test.out 2>&1
eval_tap $? 246 'UnlockSteamUserAchievement' test.out

#- 247 GetXblUserAchievements
./ng net.accelbyte.sdk.cli.Main platform getXblUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'vPipwSxW' \
    --xboxUserId 'sh62zvf9' \
    > test.out 2>&1
eval_tap $? 247 'GetXblUserAchievements' test.out

#- 248 UpdateXblUserAchievement
./ng net.accelbyte.sdk.cli.Main platform updateXblUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'AE3TWN3M' \
    --body '{"achievements": [{"id": "zgWuQekb", "percentComplete": 19}, {"id": "UAztocPE", "percentComplete": 36}, {"id": "DSc0YYRN", "percentComplete": 44}], "serviceConfigId": "1RMiz53Z", "titleId": "MYdc771E", "xboxUserId": "1f8Qh8do"}' \
    > test.out 2>&1
eval_tap $? 248 'UpdateXblUserAchievement' test.out

#- 249 AnonymizeCampaign
./ng net.accelbyte.sdk.cli.Main platform anonymizeCampaign \
    --namespace "$AB_NAMESPACE" \
    --userId 'ub5U1OYh' \
    > test.out 2>&1
eval_tap $? 249 'AnonymizeCampaign' test.out

#- 250 AnonymizeEntitlement
./ng net.accelbyte.sdk.cli.Main platform anonymizeEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'Wy8pCRii' \
    > test.out 2>&1
eval_tap $? 250 'AnonymizeEntitlement' test.out

#- 251 AnonymizeFulfillment
./ng net.accelbyte.sdk.cli.Main platform anonymizeFulfillment \
    --namespace "$AB_NAMESPACE" \
    --userId '9O73W86N' \
    > test.out 2>&1
eval_tap $? 251 'AnonymizeFulfillment' test.out

#- 252 AnonymizeIntegration
./ng net.accelbyte.sdk.cli.Main platform anonymizeIntegration \
    --namespace "$AB_NAMESPACE" \
    --userId 'YEMzikdV' \
    > test.out 2>&1
eval_tap $? 252 'AnonymizeIntegration' test.out

#- 253 AnonymizeOrder
./ng net.accelbyte.sdk.cli.Main platform anonymizeOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'rm8tLWjN' \
    > test.out 2>&1
eval_tap $? 253 'AnonymizeOrder' test.out

#- 254 AnonymizePayment
./ng net.accelbyte.sdk.cli.Main platform anonymizePayment \
    --namespace "$AB_NAMESPACE" \
    --userId 'eclLEDxz' \
    > test.out 2>&1
eval_tap $? 254 'AnonymizePayment' test.out

#- 255 AnonymizeRevocation
./ng net.accelbyte.sdk.cli.Main platform anonymizeRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId 'DqasTexJ' \
    > test.out 2>&1
eval_tap $? 255 'AnonymizeRevocation' test.out

#- 256 AnonymizeSubscription
./ng net.accelbyte.sdk.cli.Main platform anonymizeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'jgxBaO6l' \
    > test.out 2>&1
eval_tap $? 256 'AnonymizeSubscription' test.out

#- 257 AnonymizeWallet
./ng net.accelbyte.sdk.cli.Main platform anonymizeWallet \
    --namespace "$AB_NAMESPACE" \
    --userId 'BWfi2BIu' \
    > test.out 2>&1
eval_tap $? 257 'AnonymizeWallet' test.out

#- 258 GetUserDLCByPlatform
./ng net.accelbyte.sdk.cli.Main platform getUserDLCByPlatform \
    --namespace "$AB_NAMESPACE" \
    --userId 'RLiJdQj7' \
    --type 'OCULUS' \
    > test.out 2>&1
eval_tap $? 258 'GetUserDLCByPlatform' test.out

#- 259 GetUserDLC
./ng net.accelbyte.sdk.cli.Main platform getUserDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'RtaXtDjZ' \
    --includeAllNamespaces  \
    --status 'REVOKE_FAILED' \
    --type 'PSN' \
    > test.out 2>&1
eval_tap $? 259 'GetUserDLC' test.out

#- 260 QueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId '4NOWHqAx' \
    --activeOnly  \
    --appType 'GAME' \
    --collectionId 'Sb6DFLpH' \
    --entitlementClazz 'CODE' \
    --entitlementName '3CnSutO1' \
    --features 'Yvpup4B6,c9xQ2TCC,bmSHnaKs' \
    --fuzzyMatchName  \
    --ignoreActiveDate  \
    --itemId 'FHmVL8EQ,7V76BENX,gMtqCHEG' \
    --limit '11' \
    --offset '8' \
    --origin 'Nintendo' \
    > test.out 2>&1
eval_tap $? 260 'QueryUserEntitlements' test.out

#- 261 GrantUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform grantUserEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId '3lTJqMwi' \
    --body '[{"collectionId": "FowxTUZw", "endDate": "1980-04-25T00:00:00Z", "grantedCode": "R9G8LdTB", "itemId": "fU1TDl0G", "itemNamespace": "Kd4gysju", "language": "luD-VARM_PU", "metadata": {"rTSKHPyh": {}, "AssgGEW4": {}, "M8GIx4Wh": {}}, "origin": "GooglePlay", "quantity": 36, "region": "uMzIOyQf", "source": "REFERRAL_BONUS", "startDate": "1979-10-10T00:00:00Z", "storeId": "6kVl9k5z"}, {"collectionId": "L56que5s", "endDate": "1983-02-24T00:00:00Z", "grantedCode": "yfgUvKpP", "itemId": "3BSCOWxS", "itemNamespace": "Sod9ZTDx", "language": "Qtpa-whAk-584", "metadata": {"16vvRGH9": {}, "EpZXxi3i": {}, "Fa0Q8wg5": {}}, "origin": "Playstation", "quantity": 72, "region": "fShOJLjm", "source": "OTHER", "startDate": "1996-03-04T00:00:00Z", "storeId": "5t49bMJC"}, {"collectionId": "0RUWqCLD", "endDate": "1983-05-24T00:00:00Z", "grantedCode": "wVJQwnN0", "itemId": "RBup5buK", "itemNamespace": "GCEZDx4J", "language": "wP_jUYE_704", "metadata": {"nvwyscjV": {}, "zFlJAJt5": {}, "2rbDEfBD": {}}, "origin": "Xbox", "quantity": 63, "region": "kD3PFynP", "source": "IAP", "startDate": "1980-08-02T00:00:00Z", "storeId": "SEUlLjrt"}]' \
    > test.out 2>&1
eval_tap $? 261 'GrantUserEntitlement' test.out

#- 262 GetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId '5D1LcbOD' \
    --activeOnly  \
    --appId 'ALbgPZtD' \
    > test.out 2>&1
eval_tap $? 262 'GetUserAppEntitlementByAppId' test.out

#- 263 QueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'deQ1uEtc' \
    --activeOnly  \
    --limit '77' \
    --offset '69' \
    --appType 'GAME' \
    > test.out 2>&1
eval_tap $? 263 'QueryUserEntitlementsByAppType' test.out

#- 264 GetUserEntitlementsByIds
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementsByIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'VCThJT2I' \
    --ids '2hPKuNGL,iV4l1EES,1asfq6pN' \
    > test.out 2>&1
eval_tap $? 264 'GetUserEntitlementsByIds' test.out

#- 265 GetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId '2kmKJaXM' \
    --activeOnly  \
    --entitlementClazz 'LOOTBOX' \
    --platform 'V5LZ5iFN' \
    --itemId 'KyoIidLu' \
    > test.out 2>&1
eval_tap $? 265 'GetUserEntitlementByItemId' test.out

#- 266 GetUserActiveEntitlementsByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserActiveEntitlementsByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'kRYd0Od6' \
    --ids 'Ux8s5NKu,SqMGnN5H,bIQcsO5q' \
    --platform 'xtBPU8rC' \
    > test.out 2>&1
eval_tap $? 266 'GetUserActiveEntitlementsByItemIds' test.out

#- 267 GetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'o0Uu1In7' \
    --activeOnly  \
    --entitlementClazz 'SUBSCRIPTION' \
    --platform 'F5SjHdsv' \
    --sku '57vwBS00' \
    > test.out 2>&1
eval_tap $? 267 'GetUserEntitlementBySku' test.out

#- 268 ExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'rEp0b0pu' \
    --appIds 'IFqwXHIz,L16NxFvh,OFNayEeb' \
    --itemIds 'OY7E26Cl,Qxo0nkVD,dRl1ir7m' \
    --platform 'wAMOGHIh' \
    --skus 'E4jhb5et,PCv6EvsX,v1DlZDt9' \
    > test.out 2>&1
eval_tap $? 268 'ExistsAnyUserActiveEntitlement' test.out

#- 269 ExistsAnyUserActiveEntitlementByItemIds
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlementByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'pC7MvWJf' \
    --platform 'sazyVcXL' \
    --itemIds 'zjLbIbNX,DeCKFAjl,G2FCmHvC' \
    > test.out 2>&1
eval_tap $? 269 'ExistsAnyUserActiveEntitlementByItemIds' test.out

#- 270 GetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'u18W18TH' \
    --appId 'Iyz83SLN' \
    > test.out 2>&1
eval_tap $? 270 'GetUserAppEntitlementOwnershipByAppId' test.out

#- 271 GetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'nuXJnoZH' \
    --entitlementClazz 'SUBSCRIPTION' \
    --platform 'C5ehCGeE' \
    --itemId 'BqXpOtPR' \
    > test.out 2>&1
eval_tap $? 271 'GetUserEntitlementOwnershipByItemId' test.out

#- 272 GetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'H6lkk7Fy' \
    --ids '3vL9eGUM,IaSq8Doi,fOBjDZcM' \
    --platform 'Cfp5VnAq' \
    > test.out 2>&1
eval_tap $? 272 'GetUserEntitlementOwnershipByItemIds' test.out

#- 273 GetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId '62q4JcqL' \
    --entitlementClazz 'APP' \
    --platform 'YN4nOkUO' \
    --sku 'krsJ3wkn' \
    > test.out 2>&1
eval_tap $? 273 'GetUserEntitlementOwnershipBySku' test.out

#- 274 RevokeAllEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeAllEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'YBs3YeBE' \
    > test.out 2>&1
eval_tap $? 274 'RevokeAllEntitlements' test.out

#- 275 RevokeUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'eQKOtZYI' \
    --entitlementIds 'kFdQh9QN' \
    > test.out 2>&1
eval_tap $? 275 'RevokeUserEntitlements' test.out

#- 276 GetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlement \
    --entitlementId 'JG9t5AlF' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ellZbl1m' \
    > test.out 2>&1
eval_tap $? 276 'GetUserEntitlement' test.out

#- 277 UpdateUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform updateUserEntitlement \
    --entitlementId '3VaqKLgc' \
    --namespace "$AB_NAMESPACE" \
    --userId 'NEcNd6FF' \
    --body '{"collectionId": "hPlpkqiB", "endDate": "1986-12-08T00:00:00Z", "nullFieldList": ["9JS7kGo0", "gipdYdhf", "YexRaxFG"], "origin": "Twitch", "reason": "Wr07bbqB", "startDate": "1972-12-24T00:00:00Z", "status": "ACTIVE", "useCount": 49}' \
    > test.out 2>&1
eval_tap $? 277 'UpdateUserEntitlement' test.out

#- 278 ConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform consumeUserEntitlement \
    --entitlementId 'XoafGmN3' \
    --namespace "$AB_NAMESPACE" \
    --userId '11xbYCns' \
    --body '{"metadata": {"uAzCfMKj": {}, "Ikf0NPX7": {}, "WHnyGUFa": {}}, "options": ["BbEDeAiX", "8r7MFOiU", "Nlj92JEu"], "platform": "FA5ujNEB", "requestId": "jW9AF7th", "useCount": 33}' \
    > test.out 2>&1
eval_tap $? 278 'ConsumeUserEntitlement' test.out

#- 279 DisableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform disableUserEntitlement \
    --entitlementId 'atZg2QGS' \
    --namespace "$AB_NAMESPACE" \
    --userId 'dWpgDaYH' \
    > test.out 2>&1
eval_tap $? 279 'DisableUserEntitlement' test.out

#- 280 EnableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform enableUserEntitlement \
    --entitlementId 'rxxEKymV' \
    --namespace "$AB_NAMESPACE" \
    --userId '2cUAjK8a' \
    > test.out 2>&1
eval_tap $? 280 'EnableUserEntitlement' test.out

#- 281 GetUserEntitlementHistories
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementHistories \
    --entitlementId 'zlayje7C' \
    --namespace "$AB_NAMESPACE" \
    --userId '8yCRKWTv' \
    > test.out 2>&1
eval_tap $? 281 'GetUserEntitlementHistories' test.out

#- 282 RevokeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlement \
    --entitlementId 'v0RXNQpl' \
    --namespace "$AB_NAMESPACE" \
    --userId 'cvBbLfsg' \
    --body '{"metadata": {"Ymx2uLyP": {}, "FbEssazN": {}, "2POtWVNY": {}}}' \
    > test.out 2>&1
eval_tap $? 282 'RevokeUserEntitlement' test.out

#- 283 RevokeUserEntitlementByUseCount
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlementByUseCount \
    --entitlementId '1FEIJape' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Mujj9KB6' \
    --body '{"reason": "qdwRpd63", "useCount": 9}' \
    > test.out 2>&1
eval_tap $? 283 'RevokeUserEntitlementByUseCount' test.out

#- 284 PreCheckRevokeUserEntitlementByUseCount
./ng net.accelbyte.sdk.cli.Main platform preCheckRevokeUserEntitlementByUseCount \
    --entitlementId 'aHQFPahs' \
    --namespace "$AB_NAMESPACE" \
    --userId 'o9X2cwhq' \
    --quantity '33' \
    > test.out 2>&1
eval_tap $? 284 'PreCheckRevokeUserEntitlementByUseCount' test.out

#- 285 RevokeUseCount
eval_tap 0 285 'RevokeUseCount # SKIP deprecated' test.out

#- 286 SellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform sellUserEntitlement \
    --entitlementId 'DqOFTJKO' \
    --namespace "$AB_NAMESPACE" \
    --userId '1M5VJC0t' \
    --body '{"platform": "uNQnEBAz", "requestId": "V5D30TC1", "useCount": 59}' \
    > test.out 2>&1
eval_tap $? 286 'SellUserEntitlement' test.out

#- 287 FulfillItem
./ng net.accelbyte.sdk.cli.Main platform fulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'cgjDm9B7' \
    --body '{"duration": 46, "endDate": "1979-03-27T00:00:00Z", "entitlementCollectionId": "TwphEdom", "entitlementOrigin": "Steam", "itemId": "uo71kliN", "itemSku": "XDmS4Np6", "language": "WbBESAeL", "metadata": {"BA5nxxBE": {}, "AxdLhuSD": {}, "dY9g1P2T": {}}, "order": {"currency": {"currencyCode": "rvs2zrSA", "currencySymbol": "18u25yMC", "currencyType": "REAL", "decimals": 13, "namespace": "Ecv5O8qA"}, "ext": {"EgSYbGMt": {}, "K4VNvvKq": {}, "TG6RQPJj": {}}, "free": true}, "orderNo": "0oYMzYAK", "origin": "Other", "overrideBundleItemQty": {"pSH2NeKb": 32, "7YWb1xhH": 93, "5Vjci3E6": 71}, "quantity": 17, "region": "Gu6D6Qtt", "source": "EXPIRATION", "startDate": "1978-10-17T00:00:00Z", "storeId": "bZHCDyIV"}' \
    > test.out 2>&1
eval_tap $? 287 'FulfillItem' test.out

#- 288 RedeemCode
./ng net.accelbyte.sdk.cli.Main platform redeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId '9Tzh5mpz' \
    --body '{"code": "wT5bpNOE", "language": "ioY_783", "region": "UXZdgg8i"}' \
    > test.out 2>&1
eval_tap $? 288 'RedeemCode' test.out

#- 289 PreCheckFulfillItem
./ng net.accelbyte.sdk.cli.Main platform preCheckFulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'dUqWNtGr' \
    --body '{"itemId": "YXWl92k8", "itemSku": "dO88O1XT", "quantity": 32}' \
    > test.out 2>&1
eval_tap $? 289 'PreCheckFulfillItem' test.out

#- 290 FulfillRewards
./ng net.accelbyte.sdk.cli.Main platform fulfillRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'BuM56yuH' \
    --body '{"entitlementCollectionId": "jXAJ9RrH", "entitlementOrigin": "Oculus", "metadata": {"XNEBBeMK": {}, "cJGUpjcd": {}, "I2ObubLC": {}}, "origin": "Nintendo", "rewards": [{"currency": {"currencyCode": "eqmuG5Qs", "namespace": "qmPI2seE"}, "item": {"itemId": "tps9wkds", "itemName": "NCmCpIRt", "itemSku": "q26A0m2I", "itemType": "W5fkXHym"}, "quantity": 42, "type": "ITEM"}, {"currency": {"currencyCode": "a7UTIQHE", "namespace": "XOEYdQe5"}, "item": {"itemId": "i0kvcua4", "itemName": "jCY1WITw", "itemSku": "mvF5pfHo", "itemType": "E5oRvSh8"}, "quantity": 89, "type": "ITEM"}, {"currency": {"currencyCode": "CuErkDXB", "namespace": "gZN2oj37"}, "item": {"itemId": "gW8iH1uk", "itemName": "YBxFWFZF", "itemSku": "0zJtdarG", "itemType": "FLivfIKQ"}, "quantity": 93, "type": "ITEM"}], "source": "CONSUME_ENTITLEMENT", "transactionId": "4HgkGLDI"}' \
    > test.out 2>&1
eval_tap $? 290 'FulfillRewards' test.out

#- 291 QueryUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'JJGijCcW' \
    --endTime 'LwHze26g' \
    --limit '83' \
    --offset '93' \
    --productId 'L7BGWZOJ' \
    --startTime 'ziLxbuwU' \
    --status 'PARTIAL_REVOKED' \
    --type 'EPICGAMES' \
    > test.out 2>&1
eval_tap $? 291 'QueryUserIAPOrders' test.out

#- 292 QueryAllUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryAllUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'nZpDDTL2' \
    > test.out 2>&1
eval_tap $? 292 'QueryAllUserIAPOrders' test.out

#- 293 QueryUserIAPConsumeHistory
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPConsumeHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'bpct8BzI' \
    --endTime 'gzapbNhA' \
    --limit '18' \
    --offset '96' \
    --startTime '6eqciSnD' \
    --status 'PENDING' \
    --type 'EPICGAMES' \
    > test.out 2>&1
eval_tap $? 293 'QueryUserIAPConsumeHistory' test.out

#- 294 MockFulfillIAPItem
./ng net.accelbyte.sdk.cli.Main platform mockFulfillIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'x7VLWn8E' \
    --body '{"itemIdentityType": "ITEM_SKU", "language": "ENnr-OaLE", "productId": "XBYIppVR", "region": "JV7WfOxQ", "transactionId": "XGgXPUhZ", "type": "EPICGAMES"}' \
    > test.out 2>&1
eval_tap $? 294 'MockFulfillIAPItem' test.out

#- 295 AdminSyncOculusSubscriptions
./ng net.accelbyte.sdk.cli.Main platform adminSyncOculusSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'wiSesnBq' \
    --body '{"skus": ["mqNv3zOY", "VYDkunbD", "ckIb2gxm"]}' \
    > test.out 2>&1
eval_tap $? 295 'AdminSyncOculusSubscriptions' test.out

#- 296 AdminGetIAPOrderLineItems
./ng net.accelbyte.sdk.cli.Main platform adminGetIAPOrderLineItems \
    --iapOrderNo '9zfOp6ST' \
    --namespace "$AB_NAMESPACE" \
    --userId 'kcZHSRHP' \
    > test.out 2>&1
eval_tap $? 296 'AdminGetIAPOrderLineItems' test.out

#- 297 AdminSyncSteamAbnormalTransaction
./ng net.accelbyte.sdk.cli.Main platform adminSyncSteamAbnormalTransaction \
    --namespace "$AB_NAMESPACE" \
    --userId 'SkWOOsHR' \
    > test.out 2>&1
eval_tap $? 297 'AdminSyncSteamAbnormalTransaction' test.out

#- 298 AdminSyncSteamIAPByTransaction
./ng net.accelbyte.sdk.cli.Main platform adminSyncSteamIAPByTransaction \
    --namespace "$AB_NAMESPACE" \
    --userId 'OIFznfpL' \
    --body '{"orderId": "5USr76AM"}' \
    > test.out 2>&1
eval_tap $? 298 'AdminSyncSteamIAPByTransaction' test.out

#- 299 QueryUserThirdPartySubscription
./ng net.accelbyte.sdk.cli.Main platform queryUserThirdPartySubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'moI1JPnu' \
    --activeOnly  \
    --groupId 'WeXGVH2e' \
    --limit '56' \
    --offset '34' \
    --platform 'STADIA' \
    --productId 'Coz0x7Or' \
    > test.out 2>&1
eval_tap $? 299 'QueryUserThirdPartySubscription' test.out

#- 300 GetThirdPartyPlatformSubscriptionOwnershipByGroupId
./ng net.accelbyte.sdk.cli.Main platform getThirdPartyPlatformSubscriptionOwnershipByGroupId \
    --namespace "$AB_NAMESPACE" \
    --platform 'EPICGAMES' \
    --userId '7z8SLvAz' \
    --groupId 'kBsalKnY' \
    > test.out 2>&1
eval_tap $? 300 'GetThirdPartyPlatformSubscriptionOwnershipByGroupId' test.out

#- 301 GetThirdPartyPlatformSubscriptionOwnershipByProductId
./ng net.accelbyte.sdk.cli.Main platform getThirdPartyPlatformSubscriptionOwnershipByProductId \
    --namespace "$AB_NAMESPACE" \
    --platform 'APPLE' \
    --userId 'fy4bSxRh' \
    --productId 'nmjP0npU' \
    > test.out 2>&1
eval_tap $? 301 'GetThirdPartyPlatformSubscriptionOwnershipByProductId' test.out

#- 302 QueryUserThirdPartySubscriptionTransactions
./ng net.accelbyte.sdk.cli.Main platform queryUserThirdPartySubscriptionTransactions \
    --namespace "$AB_NAMESPACE" \
    --userId 'dhywSidm' \
    --activeOnly  \
    --groupId 'bgqepIcJ' \
    --limit '62' \
    --offset '8' \
    --platform 'PLAYSTATION' \
    --productId 'fwAgOBIE' \
    > test.out 2>&1
eval_tap $? 302 'QueryUserThirdPartySubscriptionTransactions' test.out

#- 303 GetThirdPartySubscriptionDetails
./ng net.accelbyte.sdk.cli.Main platform getThirdPartySubscriptionDetails \
    --id 'RNA53NaD' \
    --namespace "$AB_NAMESPACE" \
    --userId 'TDKc6H4K' \
    > test.out 2>&1
eval_tap $? 303 'GetThirdPartySubscriptionDetails' test.out

#- 304 GetSubscriptionHistory
./ng net.accelbyte.sdk.cli.Main platform getSubscriptionHistory \
    --id 'TmhC0biS' \
    --namespace "$AB_NAMESPACE" \
    --userId 'kdqCWibW' \
    --limit '37' \
    --offset '97' \
    > test.out 2>&1
eval_tap $? 304 'GetSubscriptionHistory' test.out

#- 305 SyncSubscriptionTransaction
./ng net.accelbyte.sdk.cli.Main platform syncSubscriptionTransaction \
    --id 'g6dEU5Ir' \
    --namespace "$AB_NAMESPACE" \
    --userId 'QCuenIch' \
    > test.out 2>&1
eval_tap $? 305 'SyncSubscriptionTransaction' test.out

#- 306 GetThirdPartyUserSubscriptionDetails
./ng net.accelbyte.sdk.cli.Main platform getThirdPartyUserSubscriptionDetails \
    --id '8JfZhKMw' \
    --namespace "$AB_NAMESPACE" \
    --userId 'lcCNGLu3' \
    > test.out 2>&1
eval_tap $? 306 'GetThirdPartyUserSubscriptionDetails' test.out

#- 307 SyncSubscription
./ng net.accelbyte.sdk.cli.Main platform syncSubscription \
    --id 'QEvyUwD2' \
    --namespace "$AB_NAMESPACE" \
    --userId 'NISiLvmg' \
    > test.out 2>&1
eval_tap $? 307 'SyncSubscription' test.out

#- 308 QueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId '5mKPvu3O' \
    --discounted  \
    --itemId 'IRH7soG2' \
    --limit '18' \
    --offset '16' \
    --status 'CHARGED' \
    > test.out 2>&1
eval_tap $? 308 'QueryUserOrders' test.out

#- 309 AdminCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform adminCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId '1liCaSsB' \
    --body '{"currencyCode": "mVfAXntr", "currencyNamespace": "or0uKReb", "discountCodes": ["8gyP3PEP", "2Jjtb5R4", "hKAmmYzu"], "discountedPrice": 53, "entitlementPlatform": "Oculus", "ext": {"O7Em51Ez": {}, "DIsmQw9V": {}, "DSsYxTmG": {}}, "itemId": "Hu9TcQq8", "language": "7lLul4CP", "options": {"skipPriceValidation": true}, "platform": "Playstation", "price": 22, "quantity": 43, "region": "nwLGWOZK", "returnUrl": "AWi6XKs7", "sandbox": true, "sectionId": "Z9ngy08L"}' \
    > test.out 2>&1
eval_tap $? 309 'AdminCreateUserOrder' test.out

#- 310 CountOfPurchasedItem
./ng net.accelbyte.sdk.cli.Main platform countOfPurchasedItem \
    --namespace "$AB_NAMESPACE" \
    --userId '4cVL0l66' \
    --itemId 'xdV5SlMx' \
    > test.out 2>&1
eval_tap $? 310 'CountOfPurchasedItem' test.out

#- 311 GetUserOrder
./ng net.accelbyte.sdk.cli.Main platform getUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'SpcaaWuH' \
    --userId 'i4hoIc8d' \
    > test.out 2>&1
eval_tap $? 311 'GetUserOrder' test.out

#- 312 UpdateUserOrderStatus
./ng net.accelbyte.sdk.cli.Main platform updateUserOrderStatus \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'rXvk44Tw' \
    --userId '06dphyLt' \
    --body '{"status": "DELETED", "statusReason": "9OrWctnq"}' \
    > test.out 2>&1
eval_tap $? 312 'UpdateUserOrderStatus' test.out

#- 313 FulfillUserOrder
./ng net.accelbyte.sdk.cli.Main platform fulfillUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'E1KmyDnC' \
    --userId 'phwrRUg4' \
    > test.out 2>&1
eval_tap $? 313 'FulfillUserOrder' test.out

#- 314 GetUserOrderGrant
eval_tap 0 314 'GetUserOrderGrant # SKIP deprecated' test.out

#- 315 GetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform getUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'XrV2HDjc' \
    --userId '9NBNYEzu' \
    > test.out 2>&1
eval_tap $? 315 'GetUserOrderHistories' test.out

#- 316 ProcessUserOrderNotification
./ng net.accelbyte.sdk.cli.Main platform processUserOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'XfYxWdeP' \
    --userId 'f12bS3sh' \
    --body '{"additionalData": {"cardSummary": "F5YgUF6z"}, "authorisedTime": "1981-06-22T00:00:00Z", "chargebackReversedTime": "1988-04-15T00:00:00Z", "chargebackTime": "1992-02-26T00:00:00Z", "chargedTime": "1985-05-29T00:00:00Z", "createdTime": "1992-05-16T00:00:00Z", "currency": {"currencyCode": "hoi1epft", "currencySymbol": "Y52DTYTX", "currencyType": "REAL", "decimals": 85, "namespace": "qi93bRcm"}, "customParameters": {"2tSnSMoq": {}, "6LlDBmLW": {}, "SwouzY6t": {}}, "extOrderNo": "6OfLkgkJ", "extTxId": "mYeTCAlq", "extUserId": "kdil5ITh", "issuedAt": "1999-11-18T00:00:00Z", "metadata": {"313PPDc6": "xgszuGd7", "jF7AZniz": "EWEC2WOE", "y7GmHVZW": "MDv6j8z2"}, "namespace": "xvYwWnYV", "nonceStr": "cNX3dxXL", "paymentData": {"discountAmount": 53, "discountCode": "91hwNwdN", "subtotalPrice": 24, "tax": 91, "totalPrice": 59}, "paymentMethod": "bQi4LXiu", "paymentMethodFee": 93, "paymentOrderNo": "pgpQ1isw", "paymentProvider": "ADYEN", "paymentProviderFee": 33, "paymentStationUrl": "YBLA5bWY", "price": 87, "refundedTime": "1995-12-20T00:00:00Z", "salesTax": 34, "sandbox": false, "sku": "KJu6392m", "status": "DELETED", "statusReason": "tG4sPo99", "subscriptionId": "UmTNXeXt", "subtotalPrice": 17, "targetNamespace": "cimCeg7H", "targetUserId": "TGG3ySzP", "tax": 6, "totalPrice": 41, "totalTax": 67, "txEndTime": "1987-03-25T00:00:00Z", "type": "7NMXE1rw", "userId": "Zwq2nvDJ", "vat": 22}' \
    > test.out 2>&1
eval_tap $? 316 'ProcessUserOrderNotification' test.out

#- 317 DownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform downloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'M6lqC9PY' \
    --userId 'n0bSeRIW' \
    > test.out 2>&1
eval_tap $? 317 'DownloadUserOrderReceipt' test.out

#- 318 CreateUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform createUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'XKWNM0nM' \
    --body '{"currencyCode": "GZ36Ui7J", "currencyNamespace": "psGXGjCj", "customParameters": {"qUUbkZDW": {}, "lBZy32LK": {}, "lyubEloI": {}}, "description": "OSX8Nz6V", "extOrderNo": "am4HvrFO", "extUserId": "BS8G24Pw", "itemType": "APP", "language": "AEN", "metadata": {"f2wf5fvj": "9q8B0dBv", "7QVpyXAt": "j8Fo0NEm", "YSp5e34Y": "twP6tZhi"}, "notifyUrl": "ViDEztkJ", "omitNotification": true, "platform": "My6wGUvz", "price": 42, "recurringPaymentOrderNo": "1ETBlELX", "region": "DsG8lnTe", "returnUrl": "e8ofby5x", "sandbox": true, "sku": "GiRyeBWx", "subscriptionId": "Z1T7Ii6b", "title": "fvcGHpNm"}' \
    > test.out 2>&1
eval_tap $? 318 'CreateUserPaymentOrder' test.out

#- 319 RefundUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform refundUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'Z2lnmFOw' \
    --userId 'A6xiLH2I' \
    --body '{"description": "N585GBZ8"}' \
    > test.out 2>&1
eval_tap $? 319 'RefundUserPaymentOrder' test.out

#- 320 GetUserPlatformAccountClosureHistories
./ng net.accelbyte.sdk.cli.Main platform getUserPlatformAccountClosureHistories \
    --namespace "$AB_NAMESPACE" \
    --userId 'OOWfhJmA' \
    > test.out 2>&1
eval_tap $? 320 'GetUserPlatformAccountClosureHistories' test.out

#- 321 ApplyUserRedemption
./ng net.accelbyte.sdk.cli.Main platform applyUserRedemption \
    --namespace "$AB_NAMESPACE" \
    --userId 'Qvhr83Wr' \
    --body '{"code": "Fx39kWOP", "orderNo": "8EmsIKWK"}' \
    > test.out 2>&1
eval_tap $? 321 'ApplyUserRedemption' test.out

#- 322 DoRevocation
./ng net.accelbyte.sdk.cli.Main platform doRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId 'KWE82s87' \
    --body '{"meta": {"0oJPZNqy": {}, "GQnKOwz6": {}, "cZQXtAAZ": {}}, "reason": "jrJIoCDN", "requestId": "A3vpdUvP", "revokeEntries": [{"currency": {"balanceOrigin": "System", "currencyCode": "0GjLzvn0", "namespace": "iY9rV5AN"}, "entitlement": {"entitlementId": "TueHucAc"}, "item": {"entitlementOrigin": "Twitch", "itemIdentity": "U9Tv1kYp", "itemIdentityType": "ITEM_SKU", "origin": "Oculus"}, "quantity": 54, "type": "CURRENCY"}, {"currency": {"balanceOrigin": "Twitch", "currencyCode": "Qqn8z7Wg", "namespace": "x6X0t9sJ"}, "entitlement": {"entitlementId": "l7NJVzQn"}, "item": {"entitlementOrigin": "IOS", "itemIdentity": "svISkZt6", "itemIdentityType": "ITEM_SKU", "origin": "Twitch"}, "quantity": 44, "type": "CURRENCY"}, {"currency": {"balanceOrigin": "IOS", "currencyCode": "b5uG81sA", "namespace": "UEJRsqjo"}, "entitlement": {"entitlementId": "8eoiwIcE"}, "item": {"entitlementOrigin": "IOS", "itemIdentity": "G7m6ee3F", "itemIdentityType": "ITEM_SKU", "origin": "Other"}, "quantity": 5, "type": "ITEM"}], "source": "OTHER", "transactionId": "jcL9Bn7C"}' \
    > test.out 2>&1
eval_tap $? 322 'DoRevocation' test.out

#- 323 RegisterXblSessions
./ng net.accelbyte.sdk.cli.Main platform registerXblSessions \
    --namespace "$AB_NAMESPACE" \
    --userId '66YVe0e8' \
    --body '{"gameSessionId": "i5WOwZKy", "payload": {"ZRwYUbX5": {}, "9rVStZGm": {}, "angE7Srz": {}}, "scid": "e6Tn7Mad", "sessionTemplateName": "B7Uo2m65"}' \
    > test.out 2>&1
eval_tap $? 323 'RegisterXblSessions' test.out

#- 324 QueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform queryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'GXRRNkBG' \
    --chargeStatus 'NEVER' \
    --itemId 'euiqdysO' \
    --limit '34' \
    --offset '78' \
    --sku 'axJE0yav' \
    --status 'ACTIVE' \
    --subscribedBy 'PLATFORM' \
    > test.out 2>&1
eval_tap $? 324 'QueryUserSubscriptions' test.out

#- 325 GetUserSubscriptionActivities
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionActivities \
    --namespace "$AB_NAMESPACE" \
    --userId '1Fbk2LdD' \
    --excludeSystem  \
    --limit '79' \
    --offset '31' \
    --subscriptionId 'zwrjvT1f' \
    > test.out 2>&1
eval_tap $? 325 'GetUserSubscriptionActivities' test.out

#- 326 PlatformSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform platformSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZMUNraMB' \
    --body '{"grantDays": 68, "itemId": "p5g85QkG", "language": "IzQSbRww", "reason": "tyBpj1Dy", "region": "oZ4Wn2zl", "source": "BUrPXQ9X"}' \
    > test.out 2>&1
eval_tap $? 326 'PlatformSubscribeSubscription' test.out

#- 327 CheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform checkUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'mpARqnAz' \
    --itemId 'h1hA9TPG' \
    > test.out 2>&1
eval_tap $? 327 'CheckUserSubscriptionSubscribableByItemId' test.out

#- 328 GetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform getUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'jmO0vKq7' \
    --userId 'QMMICueY' \
    > test.out 2>&1
eval_tap $? 328 'GetUserSubscription' test.out

#- 329 DeleteUserSubscription
./ng net.accelbyte.sdk.cli.Main platform deleteUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '2gJiewJy' \
    --userId 'vVHGrLUq' \
    > test.out 2>&1
eval_tap $? 329 'DeleteUserSubscription' test.out

#- 330 CancelSubscription
./ng net.accelbyte.sdk.cli.Main platform cancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'QDmj4WKW' \
    --userId 'jVz4Ubj1' \
    --force  \
    --body '{"immediate": true, "reason": "m9S97QYD"}' \
    > test.out 2>&1
eval_tap $? 330 'CancelSubscription' test.out

#- 331 GrantDaysToSubscription
./ng net.accelbyte.sdk.cli.Main platform grantDaysToSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'CpRqhLJG' \
    --userId 'C2p63aJK' \
    --body '{"grantDays": 69, "reason": "nqOGkwYZ"}' \
    > test.out 2>&1
eval_tap $? 331 'GrantDaysToSubscription' test.out

#- 332 GetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'GIrKi7zl' \
    --userId 'EZBvoBsM' \
    --excludeFree  \
    --limit '46' \
    --offset '64' \
    > test.out 2>&1
eval_tap $? 332 'GetUserSubscriptionBillingHistories' test.out

#- 333 ProcessUserSubscriptionNotification
./ng net.accelbyte.sdk.cli.Main platform processUserSubscriptionNotification \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'jJ9rzP9u' \
    --userId 'EHUR4vu0' \
    --body '{"additionalData": {"cardSummary": "prx0HSOE"}, "authorisedTime": "1973-12-24T00:00:00Z", "chargebackReversedTime": "1994-04-14T00:00:00Z", "chargebackTime": "1994-02-19T00:00:00Z", "chargedTime": "1975-06-26T00:00:00Z", "createdTime": "1976-03-06T00:00:00Z", "currency": {"currencyCode": "6BSzmZnS", "currencySymbol": "fUbqKWLO", "currencyType": "REAL", "decimals": 81, "namespace": "sDTCCgQt"}, "customParameters": {"Q8d9nnLc": {}, "CPUOQSsA": {}, "tQznQPrg": {}}, "extOrderNo": "xJb3229y", "extTxId": "Mu5vgnbo", "extUserId": "UaUaLkmi", "issuedAt": "1992-08-07T00:00:00Z", "metadata": {"cBNq7XiL": "cUNAN1W8", "qm4x3TUc": "ZG6TFEMo", "IOTBw3ZZ": "dkvHlssE"}, "namespace": "C3FochKQ", "nonceStr": "SjMeS3NC", "paymentData": {"discountAmount": 43, "discountCode": "iHZKkelu", "subtotalPrice": 9, "tax": 43, "totalPrice": 41}, "paymentMethod": "yhBMWqZL", "paymentMethodFee": 1, "paymentOrderNo": "4ux4Hsh4", "paymentProvider": "CHECKOUT", "paymentProviderFee": 54, "paymentStationUrl": "RU94lEPO", "price": 78, "refundedTime": "1975-05-06T00:00:00Z", "salesTax": 94, "sandbox": true, "sku": "aYk5pDJW", "status": "REQUEST_FOR_INFORMATION", "statusReason": "6Z0oPzDr", "subscriptionId": "gEl9vHRH", "subtotalPrice": 26, "targetNamespace": "s57uKiob", "targetUserId": "nTLY6GXR", "tax": 23, "totalPrice": 9, "totalTax": 60, "txEndTime": "1986-03-15T00:00:00Z", "type": "Nj1qi4i1", "userId": "xiYOYo7l", "vat": 72}' \
    > test.out 2>&1
eval_tap $? 333 'ProcessUserSubscriptionNotification' test.out

#- 334 AcquireUserTicket
./ng net.accelbyte.sdk.cli.Main platform acquireUserTicket \
    --boothName 'oAhGNWnZ' \
    --namespace "$AB_NAMESPACE" \
    --userId '9M1w5opn' \
    --body '{"count": 71, "orderNo": "9VtBNsI7"}' \
    > test.out 2>&1
eval_tap $? 334 'AcquireUserTicket' test.out

#- 335 QueryUserCurrencyWallets
./ng net.accelbyte.sdk.cli.Main platform queryUserCurrencyWallets \
    --namespace "$AB_NAMESPACE" \
    --userId 'VKqxX7Zj' \
    > test.out 2>&1
eval_tap $? 335 'QueryUserCurrencyWallets' test.out

#- 336 DebitUserWalletByCurrencyCode
./ng net.accelbyte.sdk.cli.Main platform debitUserWalletByCurrencyCode \
    --currencyCode '9iARDPzf' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ymjBDGYX' \
    --body '{"allowOverdraft": false, "amount": 30, "balanceOrigin": "Oculus", "balanceSource": "TRADE", "metadata": {"MD9jqNqC": {}, "KuIyqJf2": {}, "jVIf0l7q": {}}, "reason": "CG1G6ZUO"}' \
    > test.out 2>&1
eval_tap $? 336 'DebitUserWalletByCurrencyCode' test.out

#- 337 ListUserCurrencyTransactions
./ng net.accelbyte.sdk.cli.Main platform listUserCurrencyTransactions \
    --currencyCode 'tuZ8Z9jw' \
    --namespace "$AB_NAMESPACE" \
    --userId 'lIVtsqEA' \
    --limit '86' \
    --offset '48' \
    > test.out 2>&1
eval_tap $? 337 'ListUserCurrencyTransactions' test.out

#- 338 CheckBalance
./ng net.accelbyte.sdk.cli.Main platform checkBalance \
    --currencyCode 'W42dZkAW' \
    --namespace "$AB_NAMESPACE" \
    --userId 'LAEc5gWS' \
    --request '{"amount": 58, "debitBalanceSource": "OTHER", "metadata": {"u6SLlv1J": {}, "fm4okffP": {}, "CqRAg7Fg": {}}, "reason": "aqFb6Koz", "walletPlatform": "Other"}' \
    > test.out 2>&1
eval_tap $? 338 'CheckBalance' test.out

#- 339 CheckWallet
eval_tap 0 339 'CheckWallet # SKIP deprecated' test.out

#- 340 CreditUserWallet
./ng net.accelbyte.sdk.cli.Main platform creditUserWallet \
    --currencyCode 'b6jouiER' \
    --namespace "$AB_NAMESPACE" \
    --userId 'DrHxelae' \
    --body '{"amount": 25, "expireAt": "1998-07-26T00:00:00Z", "metadata": {"o3CYzxyl": {}, "CMsA2XMq": {}, "FPHGZj7r": {}}, "origin": "System", "reason": "p6u8ZfGa", "source": "DLC"}' \
    > test.out 2>&1
eval_tap $? 340 'CreditUserWallet' test.out

#- 341 DebitByWalletPlatform
./ng net.accelbyte.sdk.cli.Main platform debitByWalletPlatform \
    --currencyCode 'OfDUkIoK' \
    --namespace "$AB_NAMESPACE" \
    --userId 'PkMv3M6I' \
    --request '{"amount": 24, "debitBalanceSource": "OTHER", "metadata": {"IPtOMktS": {}, "OyoZI2VM": {}, "aWBUUeqr": {}}, "reason": "LIJk1YFa", "walletPlatform": "Epic"}' \
    > test.out 2>&1
eval_tap $? 341 'DebitByWalletPlatform' test.out

#- 342 PayWithUserWallet
./ng net.accelbyte.sdk.cli.Main platform payWithUserWallet \
    --currencyCode '4taRA3mn' \
    --namespace "$AB_NAMESPACE" \
    --userId 'vwdubXaQ' \
    --body '{"amount": 9, "metadata": {"Ncdyy9u7": {}, "vOd2eTIw": {}, "UgzFSdVs": {}}, "walletPlatform": "IOS"}' \
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
    --storeId 'enrqH7E4' \
    > test.out 2>&1
eval_tap $? 348 'ListViews' test.out

#- 349 CreateView
./ng net.accelbyte.sdk.cli.Main platform createView \
    --namespace "$AB_NAMESPACE" \
    --storeId 'PRaFdLhJ' \
    --body '{"displayOrder": 68, "localizations": {"sqaLtYbF": {"description": "qPuGDOnc", "localExt": {"d1vTK6Gu": {}, "eFO0qzkA": {}, "PaxTDP57": {}}, "longDescription": "jtDryJW8", "title": "6Sc3bjCu"}, "mR16YB0m": {"description": "XVjsOmHN", "localExt": {"pac0uvFR": {}, "JXpi4diA": {}, "jXp1CSIe": {}}, "longDescription": "RDcrMxYO", "title": "KYki0Brd"}, "91f6pxSs": {"description": "ORUaYBog", "localExt": {"TcxiaM91": {}, "38dwlSO2": {}, "0rpOvwn1": {}}, "longDescription": "WQTlXU5n", "title": "5ONI1rrF"}}, "name": "bjScWNpc"}' \
    > test.out 2>&1
eval_tap $? 349 'CreateView' test.out

#- 350 GetView
./ng net.accelbyte.sdk.cli.Main platform getView \
    --namespace "$AB_NAMESPACE" \
    --viewId '46pk9bqU' \
    --storeId 'dS8mhim9' \
    > test.out 2>&1
eval_tap $? 350 'GetView' test.out

#- 351 UpdateView
./ng net.accelbyte.sdk.cli.Main platform updateView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'sRuWmhER' \
    --storeId '1JVkqQAv' \
    --body '{"displayOrder": 94, "localizations": {"krvupzmH": {"description": "FSprTSCu", "localExt": {"UrwX22Wr": {}, "8mk7paAO": {}, "lAdBzqc8": {}}, "longDescription": "phZGV2cv", "title": "9VP0BLXE"}, "P1GJholE": {"description": "s1PahsFR", "localExt": {"cffmWXdB": {}, "VUkNIbuF": {}, "7LYtJSdu": {}}, "longDescription": "KYlc9Nsb", "title": "N0tipANA"}, "pcS9LVKj": {"description": "SLb1w79n", "localExt": {"IWOmka15": {}, "cvqkIUSu": {}, "Z6nTPTNG": {}}, "longDescription": "ML3qPp8m", "title": "vRczEF0u"}}, "name": "CuLuMZwy"}' \
    > test.out 2>&1
eval_tap $? 351 'UpdateView' test.out

#- 352 DeleteView
./ng net.accelbyte.sdk.cli.Main platform deleteView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'XTMR5Pbk' \
    --storeId 'tWbqNDhm' \
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
    --body '{"enablePaidForVCExpiration": true}' \
    > test.out 2>&1
eval_tap $? 354 'UpdateWalletConfig' test.out

#- 355 QueryWallets
eval_tap 0 355 'QueryWallets # SKIP deprecated' test.out

#- 356 BulkCredit
./ng net.accelbyte.sdk.cli.Main platform bulkCredit \
    --namespace "$AB_NAMESPACE" \
    --body '[{"creditRequest": {"amount": 9, "expireAt": "1979-11-02T00:00:00Z", "metadata": {"vfPo1Lj5": {}, "tb5BhtBY": {}, "4zA8xLBc": {}}, "origin": "Steam", "reason": "DsjW4xHF", "source": "GIFT"}, "currencyCode": "X4nhHOis", "userIds": ["jBCkmpkT", "ZP1j5IKi", "AvvqBNWj"]}, {"creditRequest": {"amount": 20, "expireAt": "1980-09-20T00:00:00Z", "metadata": {"WrM47dZg": {}, "AHONhDBE": {}, "6tkMyxCd": {}}, "origin": "Steam", "reason": "8FqSzPYv", "source": "CONSUME_ENTITLEMENT"}, "currencyCode": "eobml2jY", "userIds": ["JIPf3eqh", "U0gU2Qm5", "jsjYIB3l"]}, {"creditRequest": {"amount": 99, "expireAt": "1990-04-03T00:00:00Z", "metadata": {"cm1jwpO1": {}, "H3DAALPP": {}, "FItn3fYf": {}}, "origin": "GooglePlay", "reason": "vtCevtQ8", "source": "PURCHASE"}, "currencyCode": "ETCOWGc6", "userIds": ["nSPfRnnM", "GMWSQBeu", "EcgwaYV8"]}]' \
    > test.out 2>&1
eval_tap $? 356 'BulkCredit' test.out

#- 357 BulkDebit
./ng net.accelbyte.sdk.cli.Main platform bulkDebit \
    --namespace "$AB_NAMESPACE" \
    --body '[{"currencyCode": "o7efMkkx", "request": {"allowOverdraft": false, "amount": 75, "balanceOrigin": "Twitch", "balanceSource": "EXPIRATION", "metadata": {"QtDBfOTo": {}, "3AdCR1a8": {}, "pv5T0clB": {}}, "reason": "3ix6gWoM"}, "userIds": ["QSGbVXdY", "Rnr7NMkx", "wxkFKTdr"]}, {"currencyCode": "rfeMwK4a", "request": {"allowOverdraft": false, "amount": 9, "balanceOrigin": "GooglePlay", "balanceSource": "IAP_REVOCATION", "metadata": {"FdQKQZJf": {}, "NoHuUimw": {}, "02SK8mVN": {}}, "reason": "oVHlBMez"}, "userIds": ["s8luZxDZ", "7Xqc1BjV", "l3jBSbNM"]}, {"currencyCode": "3KqZhHtm", "request": {"allowOverdraft": true, "amount": 24, "balanceOrigin": "GooglePlay", "balanceSource": "DLC_REVOCATION", "metadata": {"cW8G6ZyY": {}, "L3UipXFG": {}, "QrOUDqMT": {}}, "reason": "0Fy8oP78"}, "userIds": ["xNcisBBt", "Pcxuuqwk", "1oRiaLwK"]}]' \
    > test.out 2>&1
eval_tap $? 357 'BulkDebit' test.out

#- 358 GetWallet
eval_tap 0 358 'GetWallet # SKIP deprecated' test.out

#- 359 SyncOrders
./ng net.accelbyte.sdk.cli.Main platform syncOrders \
    --nextEvaluatedKey 'TASA5equ' \
    --end 'wh5enTRF' \
    --start 'X4L0qZZp' \
    > test.out 2>&1
eval_tap $? 359 'SyncOrders' test.out

#- 360 TestAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfig \
    --sandbox  \
    --body '{"allowedPaymentMethods": ["ephZL2zZ", "x7NjrLbe", "HvgfiJLw"], "apiKey": "Ppqqm4RL", "authoriseAsCapture": true, "blockedPaymentMethods": ["HAhhsu9b", "fuu1EhL6", "fi0RPlK9"], "clientKey": "JlCjW4u5", "dropInSettings": "SMvBLsMQ", "liveEndpointUrlPrefix": "SNXX8Xm3", "merchantAccount": "PE2iXrx7", "notificationHmacKey": "MARos6UC", "notificationPassword": "d0Rjd7oH", "notificationUsername": "uMHy9Iqm", "returnUrl": "MVQ87Nhd", "settings": "W2gKDZ5Y"}' \
    > test.out 2>&1
eval_tap $? 360 'TestAdyenConfig' test.out

#- 361 TestAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfig \
    --sandbox  \
    --body '{"appId": "iZd3xC0P", "privateKey": "JfZoxeLC", "publicKey": "CsyR1TfS", "returnUrl": "jL0afMfV"}' \
    > test.out 2>&1
eval_tap $? 361 'TestAliPayConfig' test.out

#- 362 TestCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfig \
    --sandbox  \
    --body '{"publicKey": "MwDKh3mE", "secretKey": "HcbXkD1y"}' \
    > test.out 2>&1
eval_tap $? 362 'TestCheckoutConfig' test.out

#- 363 DebugMatchedPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentMerchantConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'AGtjWuvO' \
    > test.out 2>&1
eval_tap $? 363 'DebugMatchedPaymentMerchantConfig' test.out

#- 364 TestNeonPayConfig
./ng net.accelbyte.sdk.cli.Main platform testNeonPayConfig \
    --sandbox  \
    --body '{"apiKey": "gMiTlg0Z", "webhookSecretKey": "LWJ0pqrV"}' \
    > test.out 2>&1
eval_tap $? 364 'TestNeonPayConfig' test.out

#- 365 TestPayPalConfig
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfig \
    --sandbox  \
    --body '{"clientID": "rBBMbx4W", "clientSecret": "9pkBDtmj", "returnUrl": "MUSjyz5v", "webHookId": "u6AE5aOu"}' \
    > test.out 2>&1
eval_tap $? 365 'TestPayPalConfig' test.out

#- 366 TestStripeConfig
./ng net.accelbyte.sdk.cli.Main platform testStripeConfig \
    --sandbox  \
    --body '{"allowedPaymentMethodTypes": ["T9cWCTrK", "Pqi9b9hN", "MK9bBLrd"], "publishableKey": "ppwXIfoH", "secretKey": "tXPtOKO7", "webhookSecret": "IsOxOviZ"}' \
    > test.out 2>&1
eval_tap $? 366 'TestStripeConfig' test.out

#- 367 TestWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfig \
    --body '{"appId": "YArkud7h", "key": "PIwXcaaU", "mchid": "cFVLuvV1", "returnUrl": "MSBCy3zs"}' \
    > test.out 2>&1
eval_tap $? 367 'TestWxPayConfig' test.out

#- 368 TestXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfig \
    --body '{"apiKey": "JYoE3HrX", "flowCompletionUrl": "gACOTfwm", "merchantId": 44, "projectId": 88, "projectSecretKey": "UuqJO680"}' \
    > test.out 2>&1
eval_tap $? 368 'TestXsollaConfig' test.out

#- 369 GetPaymentMerchantConfig1
./ng net.accelbyte.sdk.cli.Main platform getPaymentMerchantConfig1 \
    --id 'G4EoWRtJ' \
    > test.out 2>&1
eval_tap $? 369 'GetPaymentMerchantConfig1' test.out

#- 370 UpdateAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform updateAdyenConfig \
    --id '85x3dUVH' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethods": ["8pLyC5UN", "6c2CBGbP", "SSkxoRaJ"], "apiKey": "WGcRXEu4", "authoriseAsCapture": false, "blockedPaymentMethods": ["SesQ1oLY", "2b3S50Jn", "HTmWdefX"], "clientKey": "HMpjCqUT", "dropInSettings": "FsDoYIN9", "liveEndpointUrlPrefix": "mcyBMPFc", "merchantAccount": "DjNSuQft", "notificationHmacKey": "eHCMB9Le", "notificationPassword": "wVXxTrAp", "notificationUsername": "6X3OgsGB", "returnUrl": "JF3Qx1o8", "settings": "89FnHTmT"}' \
    > test.out 2>&1
eval_tap $? 370 'UpdateAdyenConfig' test.out

#- 371 TestAdyenConfigById
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfigById \
    --id 'BgcR9Gb8' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 371 'TestAdyenConfigById' test.out

#- 372 UpdateAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateAliPayConfig \
    --id 'r3i6twD3' \
    --sandbox  \
    --validate  \
    --body '{"appId": "zFtkZCwD", "privateKey": "v2ZmOEUe", "publicKey": "aLxq5I4N", "returnUrl": "S0RAdtJZ"}' \
    > test.out 2>&1
eval_tap $? 372 'UpdateAliPayConfig' test.out

#- 373 TestAliPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfigById \
    --id 'PIs1jRBJ' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 373 'TestAliPayConfigById' test.out

#- 374 UpdateCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform updateCheckoutConfig \
    --id 'Iqm2Ego5' \
    --sandbox  \
    --validate  \
    --body '{"publicKey": "jGudrvD7", "secretKey": "TWDZQpVt"}' \
    > test.out 2>&1
eval_tap $? 374 'UpdateCheckoutConfig' test.out

#- 375 TestCheckoutConfigById
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfigById \
    --id 'OfQFucc0' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 375 'TestCheckoutConfigById' test.out

#- 376 UpdateNeonPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateNeonPayConfig \
    --id 'LShxYUEF' \
    --sandbox  \
    --validate  \
    --body '{"apiKey": "YCyrPWdN", "webhookSecretKey": "bnh28osk"}' \
    > test.out 2>&1
eval_tap $? 376 'UpdateNeonPayConfig' test.out

#- 377 TestNeonPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testNeonPayConfigById \
    --id 'bbGiWWgg' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 377 'TestNeonPayConfigById' test.out

#- 378 UpdatePayPalConfig
./ng net.accelbyte.sdk.cli.Main platform updatePayPalConfig \
    --id 'f4EOTC4A' \
    --sandbox  \
    --validate  \
    --body '{"clientID": "u1CkrtTY", "clientSecret": "j22cBrIK", "returnUrl": "jwLzAL2c", "webHookId": "Pi7F3Raa"}' \
    > test.out 2>&1
eval_tap $? 378 'UpdatePayPalConfig' test.out

#- 379 TestPayPalConfigById
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfigById \
    --id 'jbWBEu4l' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 379 'TestPayPalConfigById' test.out

#- 380 UpdateStripeConfig
./ng net.accelbyte.sdk.cli.Main platform updateStripeConfig \
    --id 'wlH9eR1Z' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethodTypes": ["8ieSHNPm", "cuNeIvCg", "l55SpD6C"], "publishableKey": "kfmAGdXw", "secretKey": "LlfS1s0c", "webhookSecret": "CHPZDxWC"}' \
    > test.out 2>&1
eval_tap $? 380 'UpdateStripeConfig' test.out

#- 381 TestStripeConfigById
./ng net.accelbyte.sdk.cli.Main platform testStripeConfigById \
    --id 'wUk70Tg7' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 381 'TestStripeConfigById' test.out

#- 382 UpdateWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfig \
    --id 'wosFyDkT' \
    --validate  \
    --body '{"appId": "UTaLtju5", "key": "LGHknyhL", "mchid": "mGrACCJI", "returnUrl": "5ijohwSe"}' \
    > test.out 2>&1
eval_tap $? 382 'UpdateWxPayConfig' test.out

#- 383 UpdateWxPayConfigCert
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfigCert \
    --id 'XPLmAPEE' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 383 'UpdateWxPayConfigCert' test.out

#- 384 TestWxPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfigById \
    --id 'bvqokqDK' \
    > test.out 2>&1
eval_tap $? 384 'TestWxPayConfigById' test.out

#- 385 UpdateXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaConfig \
    --id 'Lj608Whh' \
    --validate  \
    --body '{"apiKey": "EvFiVDvm", "flowCompletionUrl": "pTjNmX2q", "merchantId": 46, "projectId": 21, "projectSecretKey": "TyUqUMq9"}' \
    > test.out 2>&1
eval_tap $? 385 'UpdateXsollaConfig' test.out

#- 386 TestXsollaConfigById
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfigById \
    --id 'QlhRiPMQ' \
    > test.out 2>&1
eval_tap $? 386 'TestXsollaConfigById' test.out

#- 387 UpdateXsollaUIConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaUIConfig \
    --id '46dUHJRf' \
    --body '{"device": "DESKTOP", "showCloseButton": true, "size": "MEDIUM", "theme": "DARK"}' \
    > test.out 2>&1
eval_tap $? 387 'UpdateXsollaUIConfig' test.out

#- 388 QueryPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform queryPaymentProviderConfig \
    --limit '39' \
    --namespace "$AB_NAMESPACE" \
    --offset '25' \
    --region 'BANfNF5w' \
    > test.out 2>&1
eval_tap $? 388 'QueryPaymentProviderConfig' test.out

#- 389 CreatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform createPaymentProviderConfig \
    --body '{"aggregate": "NEONPAY", "namespace": "5dcjMHzK", "region": "CbWuWB1o", "sandboxTaxJarApiToken": "sfmVCRLU", "specials": ["STRIPE", "ADYEN", "WALLET"], "taxJarApiToken": "wGAFTedu", "taxJarEnabled": true, "useGlobalTaxJarApiToken": true}' \
    > test.out 2>&1
eval_tap $? 389 'CreatePaymentProviderConfig' test.out

#- 390 GetAggregatePaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getAggregatePaymentProviders \
    > test.out 2>&1
eval_tap $? 390 'GetAggregatePaymentProviders' test.out

#- 391 DebugMatchedPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentProviderConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'mMKOMwDD' \
    > test.out 2>&1
eval_tap $? 391 'DebugMatchedPaymentProviderConfig' test.out

#- 392 GetSpecialPaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getSpecialPaymentProviders \
    > test.out 2>&1
eval_tap $? 392 'GetSpecialPaymentProviders' test.out

#- 393 UpdatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentProviderConfig \
    --id 'vAwW8n6u' \
    --body '{"aggregate": "NEONPAY", "namespace": "tr6JVAaH", "region": "ZUc4BuU9", "sandboxTaxJarApiToken": "6wczepOm", "specials": ["NEONPAY", "PAYPAL", "XSOLLA"], "taxJarApiToken": "DHFw4cix", "taxJarEnabled": false, "useGlobalTaxJarApiToken": true}' \
    > test.out 2>&1
eval_tap $? 393 'UpdatePaymentProviderConfig' test.out

#- 394 DeletePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform deletePaymentProviderConfig \
    --id '1zFWP7P4' \
    > test.out 2>&1
eval_tap $? 394 'DeletePaymentProviderConfig' test.out

#- 395 GetPaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxConfig \
    > test.out 2>&1
eval_tap $? 395 'GetPaymentTaxConfig' test.out

#- 396 UpdatePaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentTaxConfig \
    --body '{"sandboxTaxJarApiToken": "sjX7zApi", "taxJarApiToken": "oJtX4hTq", "taxJarEnabled": true, "taxJarProductCodesMapping": {"epnnUIiR": "WbW4DP8B", "8hb0jU61": "SltdNMVH", "A3Bo2zMo": "ba3zEFsz"}}' \
    > test.out 2>&1
eval_tap $? 396 'UpdatePaymentTaxConfig' test.out

#- 397 SyncPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform syncPaymentOrders \
    --nextEvaluatedKey 'FDTTluYq' \
    --end 'XllLc13C' \
    --start 'kVwvKQih' \
    > test.out 2>&1
eval_tap $? 397 'SyncPaymentOrders' test.out

#- 398 PublicGetRootCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetRootCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'M9vj6y1q' \
    --storeId 'HA1mAAs1' \
    > test.out 2>&1
eval_tap $? 398 'PublicGetRootCategories' test.out

#- 399 DownloadCategories
./ng net.accelbyte.sdk.cli.Main platform downloadCategories \
    --namespace "$AB_NAMESPACE" \
    --language '7urmN82Z' \
    --storeId 'U06lrGUM' \
    > test.out 2>&1
eval_tap $? 399 'DownloadCategories' test.out

#- 400 PublicGetCategory
./ng net.accelbyte.sdk.cli.Main platform publicGetCategory \
    --categoryPath 'qi1RyJNT' \
    --namespace "$AB_NAMESPACE" \
    --language 'Ma278sze' \
    --storeId 'oXOHB4A0' \
    > test.out 2>&1
eval_tap $? 400 'PublicGetCategory' test.out

#- 401 PublicGetChildCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetChildCategories \
    --categoryPath '4omXF89Y' \
    --namespace "$AB_NAMESPACE" \
    --language '3adNFmt7' \
    --storeId 'TVJbar0a' \
    > test.out 2>&1
eval_tap $? 401 'PublicGetChildCategories' test.out

#- 402 PublicGetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetDescendantCategories \
    --categoryPath 'xLQjWvri' \
    --namespace "$AB_NAMESPACE" \
    --language 'KrnNWkKJ' \
    --storeId 'gfhksZbd' \
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
    --dlcType 'OCULUS' \
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
    --platform 'GOOGLE' \
    > test.out 2>&1
eval_tap $? 406 'GetIAPItemMapping' test.out

#- 407 PublicGetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --language 'WoalsNpV' \
    --region '0fGdq3Mt' \
    --storeId 'ekISJqNH' \
    --appId 'MCIXoWim' \
    > test.out 2>&1
eval_tap $? 407 'PublicGetItemByAppId' test.out

#- 408 PublicQueryItems
./ng net.accelbyte.sdk.cli.Main platform publicQueryItems \
    --namespace "$AB_NAMESPACE" \
    --appType 'SOFTWARE' \
    --autoCalcEstimatedPrice  \
    --baseAppId 'lLlW0gaQ' \
    --categoryPath 'TZq2Qm3O' \
    --features 'Bt9qSF9U' \
    --includeSubCategoryItem  \
    --itemType 'SEASON' \
    --language 'Kgwuumkq' \
    --limit '14' \
    --offset '97' \
    --region 'GH2WhJdS' \
    --sortBy 'name,createdAt:asc,displayOrder:asc' \
    --storeId 'qD0gi7SX' \
    --tags 'eJeAIL8J' \
    > test.out 2>&1
eval_tap $? 408 'PublicQueryItems' test.out

#- 409 PublicGetItemBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetItemBySku \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'Lz7t73n3' \
    --region 'tFsoSmJY' \
    --storeId 'HvPKR4Se' \
    --sku 'TIEJE6Fw' \
    > test.out 2>&1
eval_tap $? 409 'PublicGetItemBySku' test.out

#- 410 PublicGetEstimatedPrice
./ng net.accelbyte.sdk.cli.Main platform publicGetEstimatedPrice \
    --namespace "$AB_NAMESPACE" \
    --region 'mHIQNCPQ' \
    --storeId 'cxQUJfWb' \
    --itemIds 'KpiLudpC' \
    > test.out 2>&1
eval_tap $? 410 'PublicGetEstimatedPrice' test.out

#- 411 PublicBulkGetItems
./ng net.accelbyte.sdk.cli.Main platform publicBulkGetItems \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'hn2hnfLd' \
    --region 'ZsdUyNKC' \
    --storeId 'QE5Skb87' \
    --itemIds 'n59YeybB' \
    > test.out 2>&1
eval_tap $? 411 'PublicBulkGetItems' test.out

#- 412 PublicValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform publicValidateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --body '{"itemIds": ["kaKPIPba", "d0w8rX7o", "QL2YKkR7"]}' \
    > test.out 2>&1
eval_tap $? 412 'PublicValidateItemPurchaseCondition' test.out

#- 413 PublicSearchItems
./ng net.accelbyte.sdk.cli.Main platform publicSearchItems \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --itemType 'CODE' \
    --limit '71' \
    --offset '1' \
    --region 'ogjropRu' \
    --storeId 'hQCE7Ftz' \
    --keyword 'jehgEhEI' \
    --language '5kvnZM35' \
    > test.out 2>&1
eval_tap $? 413 'PublicSearchItems' test.out

#- 414 PublicGetApp
./ng net.accelbyte.sdk.cli.Main platform publicGetApp \
    --itemId '1hGJUegr' \
    --namespace "$AB_NAMESPACE" \
    --language '5mBRogqg' \
    --region 'uAjLtGLM' \
    --storeId 'WoxD7iKN' \
    > test.out 2>&1
eval_tap $? 414 'PublicGetApp' test.out

#- 415 PublicGetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform publicGetItemDynamicData \
    --itemId 'n9IWuIZe' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 415 'PublicGetItemDynamicData' test.out

#- 416 PublicGetItem
./ng net.accelbyte.sdk.cli.Main platform publicGetItem \
    --itemId 'JSzGln8X' \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'qGvd7PV9' \
    --populateBundle  \
    --region 'zzi6NkoY' \
    --storeId 'YbgEbo0Y' \
    > test.out 2>&1
eval_tap $? 416 'PublicGetItem' test.out

#- 417 GetPaymentCustomization
eval_tap 0 417 'GetPaymentCustomization # SKIP deprecated' test.out

#- 418 PublicGetPaymentUrl
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentUrl \
    --namespace "$AB_NAMESPACE" \
    --body '{"neonPayConfig": {"cancelUrl": "VtnNWuty", "successUrl": "j1ZvppbZ"}, "paymentOrderNo": "GavkcQEB", "paymentProvider": "XSOLLA", "returnUrl": "a7CQ05mc", "ui": "Vp8dCX13", "zipCode": "VJhAzqlq"}' \
    > test.out 2>&1
eval_tap $? 418 'PublicGetPaymentUrl' test.out

#- 419 PublicGetPaymentMethods
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentMethods \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'MNm89CaG' \
    > test.out 2>&1
eval_tap $? 419 'PublicGetPaymentMethods' test.out

#- 420 PublicGetUnpaidPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUnpaidPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '12DsacUr' \
    > test.out 2>&1
eval_tap $? 420 'PublicGetUnpaidPaymentOrder' test.out

#- 421 Pay
./ng net.accelbyte.sdk.cli.Main platform pay \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'Cd6CRBDd' \
    --paymentProvider 'ADYEN' \
    --zipCode 'p9XqASFd' \
    --body '{"token": "rsRYzrme"}' \
    > test.out 2>&1
eval_tap $? 421 'Pay' test.out

#- 422 PublicCheckPaymentOrderPaidStatus
./ng net.accelbyte.sdk.cli.Main platform publicCheckPaymentOrderPaidStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'sRrGTJr4' \
    > test.out 2>&1
eval_tap $? 422 'PublicCheckPaymentOrderPaidStatus' test.out

#- 423 GetPaymentPublicConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentPublicConfig \
    --namespace "$AB_NAMESPACE" \
    --sandbox  \
    --paymentProvider 'CHECKOUT' \
    --region 'qQw09nZr' \
    > test.out 2>&1
eval_tap $? 423 'GetPaymentPublicConfig' test.out

#- 424 PublicGetQRCode
./ng net.accelbyte.sdk.cli.Main platform publicGetQRCode \
    --namespace "$AB_NAMESPACE" \
    --code 'HWZPZ8H0' \
    > test.out 2>&1
eval_tap $? 424 'PublicGetQRCode' test.out

#- 425 PublicNormalizePaymentReturnUrl
./ng net.accelbyte.sdk.cli.Main platform publicNormalizePaymentReturnUrl \
    --namespace "$AB_NAMESPACE" \
    --payerID 'vMflIopz' \
    --foreinginvoice 'X2Xer8xW' \
    --invoiceId 'HzHgt8dM' \
    --payload 'MDrvoe1i' \
    --redirectResult 'OhJO6zSP' \
    --resultCode 'SoBfh5YK' \
    --sessionId 'LX5Fs7Pd' \
    --status 'HGMMu1uJ' \
    --token 'SCHQWGoT' \
    --type 'sbamDCD2' \
    --userId 'iZBc0gNJ' \
    --orderNo 'XLePn88e' \
    --paymentOrderNo 'Crf6YtAE' \
    --paymentProvider 'ALIPAY' \
    --returnUrl 'Btwmc61Z' \
    > test.out 2>&1
eval_tap $? 425 'PublicNormalizePaymentReturnUrl' test.out

#- 426 GetPaymentTaxValue
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxValue \
    --namespace "$AB_NAMESPACE" \
    --zipCode '7HHabAOb' \
    --paymentOrderNo 'p3QJ0rF5' \
    --paymentProvider 'STRIPE' \
    > test.out 2>&1
eval_tap $? 426 'GetPaymentTaxValue' test.out

#- 427 GetRewardByCode
./ng net.accelbyte.sdk.cli.Main platform getRewardByCode \
    --namespace "$AB_NAMESPACE" \
    --rewardCode 'IS4zl2P6' \
    > test.out 2>&1
eval_tap $? 427 'GetRewardByCode' test.out

#- 428 QueryRewards1
./ng net.accelbyte.sdk.cli.Main platform queryRewards1 \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'zdDhqTdd' \
    --limit '52' \
    --offset '66' \
    --sortBy 'rewardCode,namespace' \
    > test.out 2>&1
eval_tap $? 428 'QueryRewards1' test.out

#- 429 GetReward1
./ng net.accelbyte.sdk.cli.Main platform getReward1 \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'lHqaT9W3' \
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
    --appIds 'C2dyAzPH,wkjl1Wsw,ZtDFdwyv' \
    --itemIds '62kPMrcY,fgZ3kMyc,CZYxPs4V' \
    --skus 'IM7OAZWh,4zOzb15e,UtexO8cj' \
    > test.out 2>&1
eval_tap $? 431 'PublicExistsAnyMyActiveEntitlement' test.out

#- 432 PublicGetMyAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --appId 'C1SocQrD' \
    > test.out 2>&1
eval_tap $? 432 'PublicGetMyAppEntitlementOwnershipByAppId' test.out

#- 433 PublicGetMyEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'OPTIONBOX' \
    --itemId 'Du88VWrT' \
    > test.out 2>&1
eval_tap $? 433 'PublicGetMyEntitlementOwnershipByItemId' test.out

#- 434 PublicGetMyEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'ENTITLEMENT' \
    --sku 'YOFu58d8' \
    > test.out 2>&1
eval_tap $? 434 'PublicGetMyEntitlementOwnershipBySku' test.out

#- 435 PublicGetEntitlementOwnershipToken
./ng net.accelbyte.sdk.cli.Main platform publicGetEntitlementOwnershipToken \
    --namespace "$AB_NAMESPACE" \
    --appIds 'qm2zYgJm,94rVsLYr,Kk2DwN3x' \
    --itemIds '9ZIIRRAD,5Kr1B8aZ,uMRKzXMn' \
    --skus '8uGsU1EY,drAqlCEk,ysNHT20y' \
    > test.out 2>&1
eval_tap $? 435 'PublicGetEntitlementOwnershipToken' test.out

#- 436 SyncTwitchDropsEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement \
    --namespace "$AB_NAMESPACE" \
    --body '{"gameId": "qLDXauVg", "language": "QCK_tGCD-874", "region": "WFMzjC1T"}' \
    > test.out 2>&1
eval_tap $? 436 'SyncTwitchDropsEntitlement' test.out

#- 437 PublicGetMyWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetMyWallet \
    --currencyCode 'YPLVpsZL' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 437 'PublicGetMyWallet' test.out

#- 438 SyncEpicGameDLC
./ng net.accelbyte.sdk.cli.Main platform syncEpicGameDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'Y7rUYgiA' \
    --body '{"epicGamesJwtToken": "Aiq8wA1X"}' \
    > test.out 2>&1
eval_tap $? 438 'SyncEpicGameDLC' test.out

#- 439 SyncOculusDLC
./ng net.accelbyte.sdk.cli.Main platform syncOculusDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'NAd2EPcG' \
    > test.out 2>&1
eval_tap $? 439 'SyncOculusDLC' test.out

#- 440 PublicSyncPsnDlcInventory
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'rfiIVMPD' \
    --body '{"serviceLabel": 46}' \
    > test.out 2>&1
eval_tap $? 440 'PublicSyncPsnDlcInventory' test.out

#- 441 PublicSyncPsnDlcInventoryWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventoryWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'bTlYU38g' \
    --body '{"serviceLabels": [20, 44, 7]}' \
    > test.out 2>&1
eval_tap $? 441 'PublicSyncPsnDlcInventoryWithMultipleServiceLabels' test.out

#- 442 SyncSteamDLC
./ng net.accelbyte.sdk.cli.Main platform syncSteamDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'VajI0mgc' \
    --body '{"appId": "RdtEkTKp", "steamId": "nCMt2SbA"}' \
    > test.out 2>&1
eval_tap $? 442 'SyncSteamDLC' test.out

#- 443 SyncXboxDLC
./ng net.accelbyte.sdk.cli.Main platform syncXboxDLC \
    --namespace "$AB_NAMESPACE" \
    --userId '96ICWy6P' \
    --body '{"xstsToken": "uvfeOJKa"}' \
    > test.out 2>&1
eval_tap $? 443 'SyncXboxDLC' test.out

#- 444 PublicQueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId '3SicicMM' \
    --appType 'GAME' \
    --entitlementClazz 'ENTITLEMENT' \
    --entitlementName 'FON6tjHE' \
    --features 'y8VMmdml,VxcNGtYY,tNIhD9sj' \
    --itemId '1ZwzjvQl,YRtCSAgQ,1VvUYcL7' \
    --limit '37' \
    --offset '84' \
    > test.out 2>&1
eval_tap $? 444 'PublicQueryUserEntitlements' test.out

#- 445 PublicGetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'iZFa6sZd' \
    --appId 'AyxtJLWe' \
    > test.out 2>&1
eval_tap $? 445 'PublicGetUserAppEntitlementByAppId' test.out

#- 446 PublicQueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'KtKyUvNv' \
    --limit '50' \
    --offset '73' \
    --appType 'GAME' \
    > test.out 2>&1
eval_tap $? 446 'PublicQueryUserEntitlementsByAppType' test.out

#- 447 PublicGetUserEntitlementsByIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementsByIds \
    --namespace "$AB_NAMESPACE" \
    --userId '3BjoADpC' \
    --availablePlatformOnly  \
    --ids '91Lsi9HD,2ywHysZN,h5s13XsH' \
    > test.out 2>&1
eval_tap $? 447 'PublicGetUserEntitlementsByIds' test.out

#- 448 PublicGetUserEntitlementByItemId
eval_tap 0 448 'PublicGetUserEntitlementByItemId # SKIP deprecated' test.out

#- 449 PublicGetUserEntitlementBySku
eval_tap 0 449 'PublicGetUserEntitlementBySku # SKIP deprecated' test.out

#- 450 PublicUserEntitlementHistory
./ng net.accelbyte.sdk.cli.Main platform publicUserEntitlementHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'G73kueyf' \
    --endDate 'zrAtDc4J' \
    --entitlementClazz 'OPTIONBOX' \
    --limit '38' \
    --offset '91' \
    --startDate 'IYtJcwwp' \
    > test.out 2>&1
eval_tap $? 450 'PublicUserEntitlementHistory' test.out

#- 451 PublicExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'idpg6aqd' \
    --appIds '62hwcX2b,ND18fVB5,oWdQTdx3' \
    --itemIds 'v9wSBJuO,bG07gV9S,WdRtDplO' \
    --skus 'ACBb8KO5,ONA6BzET,riHQJOwT' \
    > test.out 2>&1
eval_tap $? 451 'PublicExistsAnyUserActiveEntitlement' test.out

#- 452 PublicGetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'JTKckjtC' \
    --appId 'RqHBysOg' \
    > test.out 2>&1
eval_tap $? 452 'PublicGetUserAppEntitlementOwnershipByAppId' test.out

#- 453 PublicGetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'zT9qJv64' \
    --entitlementClazz 'ENTITLEMENT' \
    --itemId 'uKP7fgEf' \
    > test.out 2>&1
eval_tap $? 453 'PublicGetUserEntitlementOwnershipByItemId' test.out

#- 454 PublicGetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'B1xdfPJs' \
    --ids 'oEwLEJdw,eJV4GSVc,ZcR7pSlA' \
    > test.out 2>&1
eval_tap $? 454 'PublicGetUserEntitlementOwnershipByItemIds' test.out

#- 455 PublicGetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'FWcymWoH' \
    --entitlementClazz 'APP' \
    --sku 'hPUawcXk' \
    > test.out 2>&1
eval_tap $? 455 'PublicGetUserEntitlementOwnershipBySku' test.out

#- 456 PublicGetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlement \
    --entitlementId 'FllgkYyg' \
    --namespace "$AB_NAMESPACE" \
    --userId 'rT2riCvV' \
    > test.out 2>&1
eval_tap $? 456 'PublicGetUserEntitlement' test.out

#- 457 PublicConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicConsumeUserEntitlement \
    --entitlementId 'HDptYVFK' \
    --namespace "$AB_NAMESPACE" \
    --userId 'DblVu76p' \
    --body '{"metadata": {"operationSource": "INVENTORY"}, "options": ["meNI6aHj", "Z5kM9mYA", "4Jr3ZQiv"], "requestId": "j3VZCMUn", "useCount": 75}' \
    > test.out 2>&1
eval_tap $? 457 'PublicConsumeUserEntitlement' test.out

#- 458 PublicSellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicSellUserEntitlement \
    --entitlementId 'yCRiVnmp' \
    --namespace "$AB_NAMESPACE" \
    --userId 'lqY1mJVI' \
    --body '{"requestId": "iKafyxX1", "useCount": 59}' \
    > test.out 2>&1
eval_tap $? 458 'PublicSellUserEntitlement' test.out

#- 459 PublicSplitUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicSplitUserEntitlement \
    --entitlementId 'jSTr1OCd' \
    --namespace "$AB_NAMESPACE" \
    --userId 'mxOhIAzg' \
    --body '{"metadata": {"operationSource": "INVENTORY"}, "useCount": 65}' \
    > test.out 2>&1
eval_tap $? 459 'PublicSplitUserEntitlement' test.out

#- 460 PublicTransferUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicTransferUserEntitlement \
    --entitlementId 'nC22rZGN' \
    --namespace "$AB_NAMESPACE" \
    --userId 'aRpHJ1lY' \
    --body '{"entitlementId": "m6yZwBgf", "metadata": {"operationSource": "INVENTORY"}, "useCount": 60}' \
    > test.out 2>&1
eval_tap $? 460 'PublicTransferUserEntitlement' test.out

#- 461 PublicRedeemCode
./ng net.accelbyte.sdk.cli.Main platform publicRedeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'dDjPHqRG' \
    --body '{"code": "xwOfdSQG", "language": "hTj", "region": "ILn181mz"}' \
    > test.out 2>&1
eval_tap $? 461 'PublicRedeemCode' test.out

#- 462 PublicFulfillAppleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillAppleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'gOkGrjhj' \
    --body '{"excludeOldTransactions": false, "language": "WSj-049", "productId": "NvgwI5HC", "receiptData": "EeKwgkRq", "region": "EtGx5Ztj", "transactionId": "4CfDXj6k"}' \
    > test.out 2>&1
eval_tap $? 462 'PublicFulfillAppleIAPItem' test.out

#- 463 SyncEpicGamesInventory
./ng net.accelbyte.sdk.cli.Main platform syncEpicGamesInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'YVkdf22E' \
    --body '{"epicGamesJwtToken": "CMWigFjn"}' \
    > test.out 2>&1
eval_tap $? 463 'SyncEpicGamesInventory' test.out

#- 464 PublicFulfillGoogleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillGoogleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'HCF095Ck' \
    --body '{"autoAck": true, "autoConsume": false, "language": "LTMo-Ihrr_ma", "orderId": "SvDFz6qh", "packageName": "WFgeQhWR", "productId": "RDfhb25a", "purchaseTime": 97, "purchaseToken": "DcCE4vuw", "region": "cL0lXcNf", "subscriptionPurchase": true}' \
    > test.out 2>&1
eval_tap $? 464 'PublicFulfillGoogleIAPItem' test.out

#- 465 SyncOculusSubscriptions
./ng net.accelbyte.sdk.cli.Main platform syncOculusSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'FjCpmnVc' \
    --body '{"skus": ["A8etfBmh", "DLJXuxAJ", "IKFahpZ9"]}' \
    > test.out 2>&1
eval_tap $? 465 'SyncOculusSubscriptions' test.out

#- 466 SyncOculusConsumableEntitlements
./ng net.accelbyte.sdk.cli.Main platform syncOculusConsumableEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'MBygJsvw' \
    > test.out 2>&1
eval_tap $? 466 'SyncOculusConsumableEntitlements' test.out

#- 467 PublicReconcilePlayStationStore
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStore \
    --namespace "$AB_NAMESPACE" \
    --userId 'fbvlyuJO' \
    --body '{"currencyCode": "egA3QaBo", "price": 0.6127069091144844, "productId": "DmW8ZG54", "serviceLabel": 62}' \
    > test.out 2>&1
eval_tap $? 467 'PublicReconcilePlayStationStore' test.out

#- 468 PublicReconcilePlayStationStoreWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStoreWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'D1bvSYmE' \
    --body '{"currencyCode": "eNU4ZZUv", "price": 0.7709174056107955, "productId": "HPeuc31J", "serviceLabels": [3, 43, 28]}' \
    > test.out 2>&1
eval_tap $? 468 'PublicReconcilePlayStationStoreWithMultipleServiceLabels' test.out

#- 469 SyncSteamInventory
./ng net.accelbyte.sdk.cli.Main platform syncSteamInventory \
    --namespace "$AB_NAMESPACE" \
    --userId '82jK4BfZ' \
    --body '{"appId": "j6mxvcJt", "currencyCode": "gXeBXGI4", "language": "DHXe-aYan", "price": 0.46664522432543776, "productId": "oibxUj2K", "region": "G8SMSS9x", "steamId": "SZCKvVuI"}' \
    > test.out 2>&1
eval_tap $? 469 'SyncSteamInventory' test.out

#- 470 SyncSteamAbnormalTransaction
./ng net.accelbyte.sdk.cli.Main platform syncSteamAbnormalTransaction \
    --namespace "$AB_NAMESPACE" \
    --userId 'IkTO0Vhw' \
    > test.out 2>&1
eval_tap $? 470 'SyncSteamAbnormalTransaction' test.out

#- 471 SyncSteamIAPByTransaction
./ng net.accelbyte.sdk.cli.Main platform syncSteamIAPByTransaction \
    --namespace "$AB_NAMESPACE" \
    --userId 'kDow8oM4' \
    --body '{"orderId": "LqtptSTg"}' \
    > test.out 2>&1
eval_tap $? 471 'SyncSteamIAPByTransaction' test.out

#- 472 PublicQueryUserThirdPartySubscription
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserThirdPartySubscription \
    --namespace "$AB_NAMESPACE" \
    --platform 'EPICGAMES' \
    --userId '2HmmJow2' \
    --activeOnly  \
    --groupId '3n3o7STT' \
    --limit '95' \
    --offset '1' \
    --productId 'rE0LkgNc' \
    > test.out 2>&1
eval_tap $? 472 'PublicQueryUserThirdPartySubscription' test.out

#- 473 SyncTwitchDropsEntitlement1
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'tFgT2ONM' \
    --body '{"gameId": "l7vfPMli", "language": "Jc", "region": "WS284tw6"}' \
    > test.out 2>&1
eval_tap $? 473 'SyncTwitchDropsEntitlement1' test.out

#- 474 SyncXboxInventory
./ng net.accelbyte.sdk.cli.Main platform syncXboxInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'WFW8gwxI' \
    --body '{"currencyCode": "rXUVryqM", "price": 0.1736235559370758, "productId": "0kfouaS7", "xstsToken": "iRgIsqSc"}' \
    > test.out 2>&1
eval_tap $? 474 'SyncXboxInventory' test.out

#- 475 PublicQueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'sb2jaN5V' \
    --discounted  \
    --itemId 'MrVjRwB9' \
    --limit '0' \
    --offset '57' \
    --status 'INIT' \
    > test.out 2>&1
eval_tap $? 475 'PublicQueryUserOrders' test.out

#- 476 PublicCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'DEU5BxdI' \
    --body '{"currencyCode": "0GvIrv4f", "discountCodes": ["0MnrnkNZ", "KuzIFXVd", "Gwe9F5Xj"], "discountedPrice": 94, "ext": {"CJbfSK9Z": {}, "pE5YtpLy": {}, "FHc7MS8b": {}}, "itemId": "VZKaQaLg", "language": "Ojl", "price": 89, "quantity": 68, "region": "xCLEOv0E", "returnUrl": "fG08FxaS", "sectionId": "jzMD8Uuj"}' \
    > test.out 2>&1
eval_tap $? 476 'PublicCreateUserOrder' test.out

#- 477 PublicPreviewOrderPrice
./ng net.accelbyte.sdk.cli.Main platform publicPreviewOrderPrice \
    --namespace "$AB_NAMESPACE" \
    --userId '8Xv3uT4R' \
    --body '{"currencyCode": "jJlZLrv1", "discountCodes": ["Rp0qGqoH", "KZGtgZZb", "2QvAcjG2"], "discountedPrice": 52, "itemId": "dzMbnXRO", "price": 51, "quantity": 98}' \
    > test.out 2>&1
eval_tap $? 477 'PublicPreviewOrderPrice' test.out

#- 478 PublicGetUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'PDvE8q5z' \
    --userId '4S91YFPA' \
    > test.out 2>&1
eval_tap $? 478 'PublicGetUserOrder' test.out

#- 479 PublicCancelUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCancelUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'Rx9IaDoU' \
    --userId '0zGDBDe4' \
    > test.out 2>&1
eval_tap $? 479 'PublicCancelUserOrder' test.out

#- 480 PublicGetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'YQYc6hLy' \
    --userId 'DEvTXpGv' \
    > test.out 2>&1
eval_tap $? 480 'PublicGetUserOrderHistories' test.out

#- 481 PublicDownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform publicDownloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'ncj31k4o' \
    --userId 'l3lHNx5s' \
    > test.out 2>&1
eval_tap $? 481 'PublicDownloadUserOrderReceipt' test.out

#- 482 PublicGetPaymentAccounts
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'KLSaE7Ti' \
    > test.out 2>&1
eval_tap $? 482 'PublicGetPaymentAccounts' test.out

#- 483 PublicDeletePaymentAccount
./ng net.accelbyte.sdk.cli.Main platform publicDeletePaymentAccount \
    --id 'eKUrBTX7' \
    --namespace "$AB_NAMESPACE" \
    --type 'card' \
    --userId 'Ct2P7OaG' \
    > test.out 2>&1
eval_tap $? 483 'PublicDeletePaymentAccount' test.out

#- 484 PublicListActiveSections
./ng net.accelbyte.sdk.cli.Main platform publicListActiveSections \
    --namespace "$AB_NAMESPACE" \
    --userId 'IIVl50I4' \
    --autoCalcEstimatedPrice  \
    --language '9aPgsa8D' \
    --region 'pI8M8NkS' \
    --storeId 'a5NEsHNL' \
    --viewId 'ySBxQHgP' \
    > test.out 2>&1
eval_tap $? 484 'PublicListActiveSections' test.out

#- 485 PublicQueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId '517JRA1y' \
    --chargeStatus 'NEVER' \
    --itemId 'IKXACyRu' \
    --limit '57' \
    --offset '100' \
    --sku 'jppzIyQf' \
    --status 'ACTIVE' \
    --subscribedBy 'USER' \
    > test.out 2>&1
eval_tap $? 485 'PublicQueryUserSubscriptions' test.out

#- 486 PublicSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform publicSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'mkmJoB73' \
    --body '{"currencyCode": "icobhJyv", "itemId": "PNu9oe0m", "language": "xQ_qESY", "region": "QGQ2LdTG", "returnUrl": "d3AyXKp5", "source": "8zeR9ceT"}' \
    > test.out 2>&1
eval_tap $? 486 'PublicSubscribeSubscription' test.out

#- 487 PublicCheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform publicCheckUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'dmPG1G9T' \
    --itemId 'SnGIvP1A' \
    > test.out 2>&1
eval_tap $? 487 'PublicCheckUserSubscriptionSubscribableByItemId' test.out

#- 488 PublicGetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'LQSOM9si' \
    --userId 'muHGD1bN' \
    > test.out 2>&1
eval_tap $? 488 'PublicGetUserSubscription' test.out

#- 489 PublicChangeSubscriptionBillingAccount
./ng net.accelbyte.sdk.cli.Main platform publicChangeSubscriptionBillingAccount \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'zbrdnaMO' \
    --userId 'yqZmW1lA' \
    > test.out 2>&1
eval_tap $? 489 'PublicChangeSubscriptionBillingAccount' test.out

#- 490 PublicCancelSubscription
./ng net.accelbyte.sdk.cli.Main platform publicCancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'fd2dm8Du' \
    --userId 'P792eV6Q' \
    --body '{"immediate": true, "reason": "gmOnIEkG"}' \
    > test.out 2>&1
eval_tap $? 490 'PublicCancelSubscription' test.out

#- 491 PublicGetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'ctnJPOYU' \
    --userId 'nZWo53mn' \
    --excludeFree  \
    --limit '89' \
    --offset '96' \
    > test.out 2>&1
eval_tap $? 491 'PublicGetUserSubscriptionBillingHistories' test.out

#- 492 PublicListViews
./ng net.accelbyte.sdk.cli.Main platform publicListViews \
    --namespace "$AB_NAMESPACE" \
    --userId 'RYxjPaSb' \
    --language 'j4whPr6B' \
    --storeId 'll4X3Ytj' \
    > test.out 2>&1
eval_tap $? 492 'PublicListViews' test.out

#- 493 PublicGetWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetWallet \
    --currencyCode 'Adq3jkfa' \
    --namespace "$AB_NAMESPACE" \
    --userId 'U1RgL4G7' \
    > test.out 2>&1
eval_tap $? 493 'PublicGetWallet' test.out

#- 494 PublicListUserWalletTransactions
./ng net.accelbyte.sdk.cli.Main platform publicListUserWalletTransactions \
    --currencyCode 'afTDXHxw' \
    --namespace "$AB_NAMESPACE" \
    --userId 'cTbAK778' \
    --limit '23' \
    --offset '31' \
    > test.out 2>&1
eval_tap $? 494 'PublicListUserWalletTransactions' test.out

#- 495 PublicGetMyDLCContent
./ng net.accelbyte.sdk.cli.Main platform publicGetMyDLCContent \
    --includeAllNamespaces  \
    --type 'XBOX' \
    > test.out 2>&1
eval_tap $? 495 'PublicGetMyDLCContent' test.out

#- 496 QueryFulfillments
./ng net.accelbyte.sdk.cli.Main platform queryFulfillments \
    --namespace "$AB_NAMESPACE" \
    --endTime 'hmSBNSjv' \
    --limit '45' \
    --offset '64' \
    --startTime 'cYn6hStu' \
    --state 'REVOKED' \
    --transactionId 'OvH5dL2z' \
    --userId 'nM7pfIlF' \
    > test.out 2>&1
eval_tap $? 496 'QueryFulfillments' test.out

#- 497 QueryItemsV2
./ng net.accelbyte.sdk.cli.Main platform queryItemsV2 \
    --namespace "$AB_NAMESPACE" \
    --appType 'DEMO' \
    --availableDate 'dnhGjIgx' \
    --baseAppId '4gY9ZUtj' \
    --categoryPath 'dTGw473V' \
    --features 'aEWJmvle' \
    --includeSubCategoryItem  \
    --itemName 'KzQfgm6h' \
    --itemStatus 'INACTIVE' \
    --itemType 'MEDIA,SUBSCRIPTION,BUNDLE' \
    --limit '19' \
    --offset '65' \
    --region 'M8iQXw1P' \
    --sectionExclusive  \
    --sortBy 'createdAt:asc,updatedAt,createdAt' \
    --storeId '2C1AMkNQ' \
    --tags 'F1Nszibw' \
    --targetNamespace 'qyGSgFXV' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 497 'QueryItemsV2' test.out

#- 498 ImportStore1
./ng net.accelbyte.sdk.cli.Main platform importStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId '1bbrNSJG' \
    --strictMode  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 498 'ImportStore1' test.out

#- 499 ExportStore1
./ng net.accelbyte.sdk.cli.Main platform exportStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId '5hETSqEY' \
    --body '{"itemIds": ["qrCIOd6d", "Y0ZoNYty", "mWK4SMsW"]}' \
    > test.out 2>&1
eval_tap $? 499 'ExportStore1' test.out

#- 500 FulfillRewardsV2
./ng net.accelbyte.sdk.cli.Main platform fulfillRewardsV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'gJicdUyH' \
    --body '{"entitlementCollectionId": "86wAMscd", "entitlementOrigin": "Other", "metadata": {"PbPwSdee": {}, "7dLq9VvG": {}, "uIoVl6yb": {}}, "origin": "Twitch", "rewards": [{"currency": {"currencyCode": "5yoiJ2Od", "namespace": "zvLJ2wPp"}, "item": {"itemId": "tVl892Ju", "itemName": "28HunB3N", "itemSku": "yFV6fXFW", "itemType": "gkLKluNQ"}, "quantity": 42, "type": "ITEM"}, {"currency": {"currencyCode": "JANQ0VsF", "namespace": "NhbWrCMb"}, "item": {"itemId": "8sQbRXay", "itemName": "pbT34b5y", "itemSku": "9xKy7g2e", "itemType": "0x5axacR"}, "quantity": 83, "type": "CURRENCY"}, {"currency": {"currencyCode": "ZvmAnxeA", "namespace": "GNGeuBDR"}, "item": {"itemId": "uvLm7LYw", "itemName": "xwOyiOVB", "itemSku": "2HxEtG3y", "itemType": "qTr5BMaG"}, "quantity": 100, "type": "CURRENCY"}], "source": "CONSUME_ENTITLEMENT", "transactionId": "yw4GwJwz"}' \
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
    --userId '4CKCdJSk' \
    --body '{"transactionId": "jfifBtXI"}' \
    > test.out 2>&1
eval_tap $? 504 'V2PublicFulfillAppleIAPItem' test.out

#- 505 FulfillItemsV3
./ng net.accelbyte.sdk.cli.Main platform fulfillItemsV3 \
    --namespace "$AB_NAMESPACE" \
    --transactionId 't9INKbfy' \
    --userId 'lxdxuwaW' \
    --body '{"items": [{"duration": 93, "endDate": "1990-03-19T00:00:00Z", "entitlementCollectionId": "zccKr4G7", "entitlementOrigin": "Playstation", "itemId": "qt4D2u2L", "itemSku": "uROnv1dB", "language": "JDZFTZAX", "metadata": {"PHlDMYV4": {}, "57rck6qZ": {}, "DP8zOWPT": {}}, "orderNo": "DA0bpNNH", "origin": "Playstation", "quantity": 55, "region": "IHgS3QgY", "source": "PURCHASE", "startDate": "1999-05-01T00:00:00Z", "storeId": "kfkevWGq"}, {"duration": 97, "endDate": "1992-08-30T00:00:00Z", "entitlementCollectionId": "ChgqvsCQ", "entitlementOrigin": "IOS", "itemId": "AFJhgdMP", "itemSku": "LNfooVIu", "language": "I0SNjNeE", "metadata": {"z3NJyn8R": {}, "gxT4rnO2": {}, "4k6W9iIK": {}}, "orderNo": "trtsPGLc", "origin": "Oculus", "quantity": 15, "region": "Qo7W9jxh", "source": "IAP", "startDate": "1989-07-18T00:00:00Z", "storeId": "D4GzPzWO"}, {"duration": 100, "endDate": "1990-04-21T00:00:00Z", "entitlementCollectionId": "dpiKUFL9", "entitlementOrigin": "Other", "itemId": "F73gCi2V", "itemSku": "eViTsu0O", "language": "VnVoiZlg", "metadata": {"mjtnBI5Q": {}, "QZyajAqy": {}, "IVJFkysq": {}}, "orderNo": "mRn3FDe0", "origin": "Other", "quantity": 71, "region": "PQAgdKgZ", "source": "EXPIRATION", "startDate": "1997-11-26T00:00:00Z", "storeId": "ZW0LLwZg"}]}' \
    > test.out 2>&1
eval_tap $? 505 'FulfillItemsV3' test.out

#- 506 RetryFulfillItemsV3
./ng net.accelbyte.sdk.cli.Main platform retryFulfillItemsV3 \
    --namespace "$AB_NAMESPACE" \
    --transactionId '4Gk0aoH7' \
    --userId 'otoacbuv' \
    > test.out 2>&1
eval_tap $? 506 'RetryFulfillItemsV3' test.out

#- 507 RevokeItemsV3
./ng net.accelbyte.sdk.cli.Main platform revokeItemsV3 \
    --namespace "$AB_NAMESPACE" \
    --transactionId 'kcKHMdKB' \
    --userId 'dRsO4UIq' \
    > test.out 2>&1
eval_tap $? 507 'RevokeItemsV3' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
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
echo "1..499"

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
    --id 'xFeefOXa' \
    > test.out 2>&1
eval_tap $? 3 'GetFulfillmentScript' test.out

#- 4 CreateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform createFulfillmentScript \
    --id '5sAoiOWj' \
    --body '{"grantDays": "w4wLJG8M"}' \
    > test.out 2>&1
eval_tap $? 4 'CreateFulfillmentScript' test.out

#- 5 DeleteFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform deleteFulfillmentScript \
    --id 'jIODXXDS' \
    > test.out 2>&1
eval_tap $? 5 'DeleteFulfillmentScript' test.out

#- 6 UpdateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform updateFulfillmentScript \
    --id 'Z4GUq7ss' \
    --body '{"grantDays": "aKjiqRJR"}' \
    > test.out 2>&1
eval_tap $? 6 'UpdateFulfillmentScript' test.out

#- 7 ListItemTypeConfigs
./ng net.accelbyte.sdk.cli.Main platform listItemTypeConfigs \
    > test.out 2>&1
eval_tap $? 7 'ListItemTypeConfigs' test.out

#- 8 CreateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform createItemTypeConfig \
    --body '{"clazz": "3XbiMYlA", "dryRun": false, "fulfillmentUrl": "nNYUEgWf", "itemType": "EXTENSION", "purchaseConditionUrl": "7KTgXufJ"}' \
    > test.out 2>&1
eval_tap $? 8 'CreateItemTypeConfig' test.out

#- 9 SearchItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform searchItemTypeConfig \
    --clazz 'xlP5fWeR' \
    --itemType 'BUNDLE' \
    > test.out 2>&1
eval_tap $? 9 'SearchItemTypeConfig' test.out

#- 10 GetItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform getItemTypeConfig \
    --id 'eCB8bsV9' \
    > test.out 2>&1
eval_tap $? 10 'GetItemTypeConfig' test.out

#- 11 UpdateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform updateItemTypeConfig \
    --id 'ol6ovola' \
    --body '{"clazz": "7QUfrJe5", "dryRun": true, "fulfillmentUrl": "IDUotL6y", "purchaseConditionUrl": "L7bXFoDB"}' \
    > test.out 2>&1
eval_tap $? 11 'UpdateItemTypeConfig' test.out

#- 12 DeleteItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform deleteItemTypeConfig \
    --id 'xdrApry5' \
    > test.out 2>&1
eval_tap $? 12 'DeleteItemTypeConfig' test.out

#- 13 QueryCampaigns
./ng net.accelbyte.sdk.cli.Main platform queryCampaigns \
    --namespace "$AB_NAMESPACE" \
    --limit '92' \
    --name 'alEeLMVO' \
    --offset '95' \
    --tag 'hHBDHOaS' \
    > test.out 2>&1
eval_tap $? 13 'QueryCampaigns' test.out

#- 14 CreateCampaign
./ng net.accelbyte.sdk.cli.Main platform createCampaign \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "SptRH5Sg", "discountConfig": {"categories": [{"categoryPath": "Y9UsqyHo", "includeSubCategories": false}, {"categoryPath": "xIWIWQvg", "includeSubCategories": false}, {"categoryPath": "o8efVa7l", "includeSubCategories": true}], "currencyCode": "M32rvmQz", "currencyNamespace": "9xGcujy3", "discountAmount": 27, "discountPercentage": 51, "discountType": "PERCENTAGE", "items": [{"itemId": "GxvRaIIR", "itemName": "aYPOmIp9"}, {"itemId": "mbSZi5WZ", "itemName": "ZtStNHDu"}, {"itemId": "l5Zdh51l", "itemName": "m4hQSLYq"}], "restrictType": "ITEMS_AND_CATEGORIES", "stackable": true}, "items": [{"extraSubscriptionDays": 74, "itemId": "uD7IScTf", "itemName": "TumDsl9Q", "quantity": 60}, {"extraSubscriptionDays": 37, "itemId": "nsJGtTVh", "itemName": "hakY8apR", "quantity": 81}, {"extraSubscriptionDays": 33, "itemId": "1shXyZJY", "itemName": "JjGasUjz", "quantity": 86}], "maxRedeemCountPerCampaignPerUser": 90, "maxRedeemCountPerCode": 23, "maxRedeemCountPerCodePerUser": 47, "maxSaleCount": 38, "name": "ufg9wv17", "redeemEnd": "1989-01-22T00:00:00Z", "redeemStart": "1995-10-18T00:00:00Z", "redeemType": "ITEM", "status": "ACTIVE", "tags": ["dga8hA0p", "4A27ZYJj", "KC5Tw9y8"], "type": "REDEMPTION"}' \
    > test.out 2>&1
eval_tap $? 14 'CreateCampaign' test.out

#- 15 GetCampaign
./ng net.accelbyte.sdk.cli.Main platform getCampaign \
    --campaignId 'w6xRuZJo' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'GetCampaign' test.out

#- 16 UpdateCampaign
./ng net.accelbyte.sdk.cli.Main platform updateCampaign \
    --campaignId '2X7yxeLQ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "lZN8pi5N", "discountConfig": {"categories": [{"categoryPath": "j6M3sEcS", "includeSubCategories": true}, {"categoryPath": "2JSUa5yS", "includeSubCategories": true}, {"categoryPath": "c8aedHHF", "includeSubCategories": true}], "currencyCode": "3nMfT3nF", "currencyNamespace": "l2cdlbnG", "discountAmount": 41, "discountPercentage": 25, "discountType": "AMOUNT", "items": [{"itemId": "6XNmS0aN", "itemName": "53U7h7f7"}, {"itemId": "6FNwaENz", "itemName": "IGNyfI4F"}, {"itemId": "3HIVK0Pq", "itemName": "zhxrnnCs"}], "restrictType": "NONE", "stackable": true}, "items": [{"extraSubscriptionDays": 95, "itemId": "ckr0mPpR", "itemName": "VYwfVQBX", "quantity": 80}, {"extraSubscriptionDays": 34, "itemId": "7cZ7sbWD", "itemName": "mKnHs0Nu", "quantity": 100}, {"extraSubscriptionDays": 76, "itemId": "bkD5rbzS", "itemName": "APKTdYAj", "quantity": 100}], "maxRedeemCountPerCampaignPerUser": 23, "maxRedeemCountPerCode": 31, "maxRedeemCountPerCodePerUser": 43, "maxSaleCount": 37, "name": "srh4BJ1k", "redeemEnd": "1994-05-17T00:00:00Z", "redeemStart": "1996-06-08T00:00:00Z", "redeemType": "DISCOUNT", "status": "INACTIVE", "tags": ["j5LT5oSz", "6BUlVvRh", "OkAVlK3V"]}' \
    > test.out 2>&1
eval_tap $? 16 'UpdateCampaign' test.out

#- 17 RenameBatch
./ng net.accelbyte.sdk.cli.Main platform renameBatch \
    --campaignId 'hpwgrPYw' \
    --namespace "$AB_NAMESPACE" \
    --body '{"newName": "yL145j0J", "oldName": "UWVH75P7"}' \
    > test.out 2>&1
eval_tap $? 17 'RenameBatch' test.out

#- 18 QueryCampaignBatchNames
./ng net.accelbyte.sdk.cli.Main platform queryCampaignBatchNames \
    --campaignId 'r70AicBu' \
    --namespace "$AB_NAMESPACE" \
    --batchName 'xEPsw5fw' \
    --limit '59' \
    > test.out 2>&1
eval_tap $? 18 'QueryCampaignBatchNames' test.out

#- 19 GetCampaignDynamic
./ng net.accelbyte.sdk.cli.Main platform getCampaignDynamic \
    --campaignId 'pSOIbbvO' \
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
    --body '{"enableInventoryCheck": true, "itemDeletionCheckConfig": ["DLC", "REWARD"]}' \
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
    --body '{"appConfig": {"appName": "RU6KxJSW"}, "customConfig": {"connectionType": "INSECURE", "grpcServerAddress": "6mDDRfKh"}, "extendType": "CUSTOM"}' \
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
    --body '{"appConfig": {"appName": "PfF28l41"}, "customConfig": {"connectionType": "INSECURE", "grpcServerAddress": "sZBwrMUE"}, "extendType": "APP"}' \
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
    --storeId 'DVxkLA37' \
    > test.out 2>&1
eval_tap $? 31 'GetRootCategories' test.out

#- 32 CreateCategory
./ng net.accelbyte.sdk.cli.Main platform createCategory \
    --namespace "$AB_NAMESPACE" \
    --storeId 'WxxO57c2' \
    --body '{"categoryPath": "yJxFBKD9", "localizationDisplayNames": {"ZxBZ8b5e": "j7mZiMEe", "1OrvK4iR": "aOTatAUT", "pEgqZIDA": "4tFdm8dh"}}' \
    > test.out 2>&1
eval_tap $? 32 'CreateCategory' test.out

#- 33 ListCategoriesBasic
./ng net.accelbyte.sdk.cli.Main platform listCategoriesBasic \
    --namespace "$AB_NAMESPACE" \
    --storeId '2zz31Ayk' \
    > test.out 2>&1
eval_tap $? 33 'ListCategoriesBasic' test.out

#- 34 GetCategory
./ng net.accelbyte.sdk.cli.Main platform getCategory \
    --categoryPath 'CfHvk5wa' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'TXAHBa6c' \
    > test.out 2>&1
eval_tap $? 34 'GetCategory' test.out

#- 35 UpdateCategory
./ng net.accelbyte.sdk.cli.Main platform updateCategory \
    --categoryPath 'zas2p9aT' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'IVMBP5wx' \
    --body '{"localizationDisplayNames": {"6214xF3T": "oFI8I5Rx", "POR1anNW": "7u2OxfuI", "v4CRUzfy": "6TAHgtD4"}}' \
    > test.out 2>&1
eval_tap $? 35 'UpdateCategory' test.out

#- 36 DeleteCategory
./ng net.accelbyte.sdk.cli.Main platform deleteCategory \
    --categoryPath 'Q2bu91sX' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'CYxobcyo' \
    > test.out 2>&1
eval_tap $? 36 'DeleteCategory' test.out

#- 37 GetChildCategories
./ng net.accelbyte.sdk.cli.Main platform getChildCategories \
    --categoryPath '6FjGpySk' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'yF4XmtVE' \
    > test.out 2>&1
eval_tap $? 37 'GetChildCategories' test.out

#- 38 GetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform getDescendantCategories \
    --categoryPath 'pfD9edNL' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'be1CTzie' \
    > test.out 2>&1
eval_tap $? 38 'GetDescendantCategories' test.out

#- 39 QueryCodes
./ng net.accelbyte.sdk.cli.Main platform queryCodes \
    --campaignId 'xafpWzEP' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --batchName 'CBQPcqXQ' \
    --batchNo '88,2,66' \
    --code 'swEAeKQz' \
    --limit '90' \
    --offset '79' \
    --withBatchName  \
    > test.out 2>&1
eval_tap $? 39 'QueryCodes' test.out

#- 40 CreateCodes
./ng net.accelbyte.sdk.cli.Main platform createCodes \
    --campaignId '2LNBaw16' \
    --namespace "$AB_NAMESPACE" \
    --body '{"batchName": "V5kmHpvh", "codeValue": "QlbnafzC", "quantity": 14}' \
    > test.out 2>&1
eval_tap $? 40 'CreateCodes' test.out

#- 41 Download
./ng net.accelbyte.sdk.cli.Main platform download \
    --campaignId '4FoP8rdT' \
    --namespace "$AB_NAMESPACE" \
    --batchName 'tucCJRjn' \
    --batchNo '92,79,36' \
    --withBatchName  \
    > test.out 2>&1
eval_tap $? 41 'Download' test.out

#- 42 BulkDisableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkDisableCodes \
    --campaignId 'DwofdmqD' \
    --namespace "$AB_NAMESPACE" \
    --batchName 'ut4Sop0r' \
    --batchNo '52,100,39' \
    > test.out 2>&1
eval_tap $? 42 'BulkDisableCodes' test.out

#- 43 BulkEnableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkEnableCodes \
    --campaignId 'PSN62CSx' \
    --namespace "$AB_NAMESPACE" \
    --batchName 'm3cODWcH' \
    --batchNo '8,72,83' \
    > test.out 2>&1
eval_tap $? 43 'BulkEnableCodes' test.out

#- 44 QueryRedeemHistory
./ng net.accelbyte.sdk.cli.Main platform queryRedeemHistory \
    --campaignId '7ISc91To' \
    --namespace "$AB_NAMESPACE" \
    --code '6RXIEoAp' \
    --limit '59' \
    --offset '60' \
    --userId 'cbP1bsDF' \
    > test.out 2>&1
eval_tap $? 44 'QueryRedeemHistory' test.out

#- 45 GetCode
./ng net.accelbyte.sdk.cli.Main platform getCode \
    --code 'F1unseSM' \
    --namespace "$AB_NAMESPACE" \
    --redeemable  \
    --withBatchName  \
    > test.out 2>&1
eval_tap $? 45 'GetCode' test.out

#- 46 DisableCode
./ng net.accelbyte.sdk.cli.Main platform disableCode \
    --code 'QqfcurN4' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 46 'DisableCode' test.out

#- 47 EnableCode
./ng net.accelbyte.sdk.cli.Main platform enableCode \
    --code 'XEmPiYv7' \
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
    --body '{"currencyCode": "ruz7Qa32", "currencySymbol": "f5TaAtsg", "currencyType": "REAL", "decimals": 48, "localizationDescriptions": {"N7vlL21N": "uj6FPAD6", "5ulD7RDo": "9w0bCSoG", "EdpvxH0a": "kf3FyehG"}}' \
    > test.out 2>&1
eval_tap $? 52 'CreateCurrency' test.out

#- 53 UpdateCurrency
./ng net.accelbyte.sdk.cli.Main platform updateCurrency \
    --currencyCode 'BflgcMp2' \
    --namespace "$AB_NAMESPACE" \
    --body '{"localizationDescriptions": {"ptTEq0Gi": "lAQ6dbkj", "sMNIx0fT": "RiIgaTnH", "gPYaJXEF": "Lwb4tAbZ"}}' \
    > test.out 2>&1
eval_tap $? 53 'UpdateCurrency' test.out

#- 54 DeleteCurrency
./ng net.accelbyte.sdk.cli.Main platform deleteCurrency \
    --currencyCode '2nJr1z0E' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 54 'DeleteCurrency' test.out

#- 55 GetCurrencyConfig
./ng net.accelbyte.sdk.cli.Main platform getCurrencyConfig \
    --currencyCode 'yUHX1LTr' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 55 'GetCurrencyConfig' test.out

#- 56 GetCurrencySummary
./ng net.accelbyte.sdk.cli.Main platform getCurrencySummary \
    --currencyCode 'rbkT5iC8' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 56 'GetCurrencySummary' test.out

#- 57 GetDLCItemConfigHistory
./ng net.accelbyte.sdk.cli.Main platform getDLCItemConfigHistory \
    --namespace "$AB_NAMESPACE" \
    --dlcId 'VOjFRQSW' \
    > test.out 2>&1
eval_tap $? 57 'GetDLCItemConfigHistory' test.out

#- 58 RestoreDLCItemConfigHistory
./ng net.accelbyte.sdk.cli.Main platform restoreDLCItemConfigHistory \
    --id 'bZ7SMQCu' \
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
    --body '{"data": [{"autoUpdate": false, "id": "lJVYhz8I", "rewards": [{"currency": {"currencyCode": "hkZQEl28", "namespace": "56VKcFCu"}, "item": {"itemId": "HP5xpxD5", "itemName": "XFV4H3D8", "itemSku": "ePC4d9f0", "itemType": "MINkwNcU"}, "quantity": 52, "type": "ITEM"}, {"currency": {"currencyCode": "GyWa71NT", "namespace": "oUEokAEX"}, "item": {"itemId": "0wAxbq1O", "itemName": "yXdlKz8D", "itemSku": "QyAEu3hr", "itemType": "Dcem1gyD"}, "quantity": 88, "type": "CURRENCY"}, {"currency": {"currencyCode": "lCDWj6OL", "namespace": "T4nf0oas"}, "item": {"itemId": "O9WhWyRI", "itemName": "Mr0gglY4", "itemSku": "b2ZMePel", "itemType": "c1qpcLWM"}, "quantity": 82, "type": "CURRENCY"}], "rvn": 3}, {"autoUpdate": false, "id": "Of0ZZx1b", "rewards": [{"currency": {"currencyCode": "ejiYG967", "namespace": "yXZgHPqw"}, "item": {"itemId": "nHlRwy0p", "itemName": "2m0WKZoc", "itemSku": "VoIlodqt", "itemType": "EEne02Kc"}, "quantity": 49, "type": "ITEM"}, {"currency": {"currencyCode": "92tGfIiU", "namespace": "HShUquAP"}, "item": {"itemId": "ORWA7g5Z", "itemName": "Z5wC9huj", "itemSku": "uSe0MxWw", "itemType": "MicpcMCt"}, "quantity": 62, "type": "ITEM"}, {"currency": {"currencyCode": "DEoyu25b", "namespace": "BaNQg9JO"}, "item": {"itemId": "u457503A", "itemName": "miVIL8aq", "itemSku": "oq39jynO", "itemType": "MHtsNk6T"}, "quantity": 97, "type": "ITEM"}], "rvn": 68}, {"autoUpdate": true, "id": "5YAzYdiY", "rewards": [{"currency": {"currencyCode": "GrVmzQtw", "namespace": "hGi0Cu2I"}, "item": {"itemId": "AwxfZ5Xm", "itemName": "n7ApRJtF", "itemSku": "7GdPaJf8", "itemType": "XC9iTdah"}, "quantity": 29, "type": "ITEM"}, {"currency": {"currencyCode": "sCGdvkwt", "namespace": "oTsrZN6g"}, "item": {"itemId": "0aaRHg2y", "itemName": "G6VAJOE1", "itemSku": "OlvDv8Lw", "itemType": "gnnq88Ry"}, "quantity": 19, "type": "ITEM"}, {"currency": {"currencyCode": "qw3hupSk", "namespace": "SbNjfg7Q"}, "item": {"itemId": "FY6OLXxX", "itemName": "XFEi2dPT", "itemSku": "wvYbIdif", "itemType": "JDH42Uuf"}, "quantity": 8, "type": "CURRENCY"}], "rvn": 98}]}' \
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
    --body '{"data": [{"platform": "OCULUS", "platformDlcIdMap": {"NfurlCR3": "267fGpqZ", "YWMCQbfV": "xtpKMsU1", "9nIwjTPO": "WK3mxQra"}}, {"platform": "EPICGAMES", "platformDlcIdMap": {"a3wMn3WS": "rRes7lCy", "ZzinRlAC": "oUBPSQkw", "x0Q0HaWR": "IPNXiJcP"}}, {"platform": "OCULUS", "platformDlcIdMap": {"EfqgsdXv": "g36QCf2o", "CRHamykV": "uUbSpRlX", "yK4J9qeV": "1Y1KVW1b"}}]}' \
    > test.out 2>&1
eval_tap $? 63 'UpdatePlatformDLCConfig' test.out

#- 64 DeletePlatformDLCConfig
./ng net.accelbyte.sdk.cli.Main platform deletePlatformDLCConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 64 'DeletePlatformDLCConfig' test.out

#- 65 QueryEntitlements1
./ng net.accelbyte.sdk.cli.Main platform queryEntitlements1 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --appType 'DLC' \
    --entitlementClazz 'SUBSCRIPTION' \
    --entitlementName 'm8CRCqWg' \
    --itemId 'cfBrPvK7,FMCy4bCj,tx4Svmlv' \
    --limit '2' \
    --offset '78' \
    --origin 'Playstation' \
    --userId 'VQ0pJboQ' \
    > test.out 2>&1
eval_tap $? 65 'QueryEntitlements1' test.out

#- 66 QueryEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryEntitlements \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemIds 'SUI7hsnF,zjLFEgpZ,eYU72QcK' \
    --limit '32' \
    --offset '55' \
    > test.out 2>&1
eval_tap $? 66 'QueryEntitlements' test.out

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
    --body '{"entitlementGrantList": [{"collectionId": "ZY6QGpOs", "endDate": "1997-11-22T00:00:00Z", "grantedCode": "UF5RIWni", "itemId": "ajIdg5V4", "itemNamespace": "ejVjpsbu", "language": "fc_cyBm-537", "metadata": {"hNOCYd4v": {}, "LGeCezoP": {}, "NbC3V1tQ": {}}, "origin": "Twitch", "quantity": 20, "region": "oHer1sai", "source": "REFERRAL_BONUS", "startDate": "1987-12-12T00:00:00Z", "storeId": "grpkJeDc"}, {"collectionId": "LNc8i5Ns", "endDate": "1977-06-10T00:00:00Z", "grantedCode": "FcjQyTw6", "itemId": "wz5oFa4v", "itemNamespace": "aX5a9jU6", "language": "kUgY_nDCW", "metadata": {"3vetdlrq": {}, "SaEBFpF0": {}, "ZiXFaHVb": {}}, "origin": "Epic", "quantity": 23, "region": "Fe2oayD8", "source": "OTHER", "startDate": "1990-12-27T00:00:00Z", "storeId": "HFQj9985"}, {"collectionId": "ci2xRvND", "endDate": "1973-07-08T00:00:00Z", "grantedCode": "L4FWNdAi", "itemId": "juObtjox", "itemNamespace": "E2XZ6qVk", "language": "Lfq_616", "metadata": {"tTgbYvuO": {}, "yEka4LlU": {}, "a5s4GAsC": {}}, "origin": "Epic", "quantity": 21, "region": "VJfoIwJ9", "source": "PURCHASE", "startDate": "1994-05-15T00:00:00Z", "storeId": "tDMVRv3U"}], "userIds": ["6FNfg1kR", "ZRVmSUW1", "DmjQIbpv"]}' \
    > test.out 2>&1
eval_tap $? 69 'GrantEntitlements' test.out

#- 70 RevokeEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeEntitlements \
    --namespace "$AB_NAMESPACE" \
    --body '["zRJWjBaj", "7RTC9KW9", "OXj1w5YU"]' \
    > test.out 2>&1
eval_tap $? 70 'RevokeEntitlements' test.out

#- 71 GetEntitlement
./ng net.accelbyte.sdk.cli.Main platform getEntitlement \
    --entitlementId 'K0CFnKvL' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 71 'GetEntitlement' test.out

#- 72 QueryFulfillmentHistories
./ng net.accelbyte.sdk.cli.Main platform queryFulfillmentHistories \
    --namespace "$AB_NAMESPACE" \
    --limit '47' \
    --offset '21' \
    --status 'FAIL' \
    --userId 'NUhVzrzv' \
    > test.out 2>&1
eval_tap $? 72 'QueryFulfillmentHistories' test.out

#- 73 QueryIAPClawbackHistory
./ng net.accelbyte.sdk.cli.Main platform queryIAPClawbackHistory \
    --namespace "$AB_NAMESPACE" \
    --endTime 'xUsEoSQP' \
    --eventType 'OTHER' \
    --externalOrderId 'NTECIJKf' \
    --limit '55' \
    --offset '87' \
    --startTime 'uaD6aMAu' \
    --status 'IGNORED' \
    --userId 'E4E6RRuA' \
    > test.out 2>&1
eval_tap $? 73 'QueryIAPClawbackHistory' test.out

#- 74 MockPlayStationStreamEvent
./ng net.accelbyte.sdk.cli.Main platform mockPlayStationStreamEvent \
    --namespace "$AB_NAMESPACE" \
    --body '{"body": {"account": "Dcx8wtha", "additionalData": {"entitlement": [{"clientTransaction": [{"amountConsumed": 8, "clientTransactionId": "ZChxRAW3"}, {"amountConsumed": 77, "clientTransactionId": "hDPxgcgy"}, {"amountConsumed": 70, "clientTransactionId": "tAuDw3ku"}], "entitlementId": "w7XsGW2n", "usageCount": 55}, {"clientTransaction": [{"amountConsumed": 38, "clientTransactionId": "8yD9T1O5"}, {"amountConsumed": 77, "clientTransactionId": "PQeWJvAR"}, {"amountConsumed": 15, "clientTransactionId": "Sn5e4n7N"}], "entitlementId": "TFFIVsVs", "usageCount": 72}, {"clientTransaction": [{"amountConsumed": 92, "clientTransactionId": "ekQEiHXj"}, {"amountConsumed": 83, "clientTransactionId": "KyUy5puX"}, {"amountConsumed": 32, "clientTransactionId": "AcGPnlFi"}], "entitlementId": "aVuQiBH5", "usageCount": 71}], "purpose": "JFq6bx0g"}, "originalTitleName": "BJ6SfI3S", "paymentProductSKU": "mx7oA7VC", "purchaseDate": "fgdNE3l1", "sourceOrderItemId": "kfrjGJTB", "titleName": "f9UXYEWd"}, "eventDomain": "KQuuFyzI", "eventSource": "les3Gk3j", "eventType": "QfHGTgjO", "eventVersion": 81, "id": "r4rNstiw", "timestamp": "PdvcL3yt"}' \
    > test.out 2>&1
eval_tap $? 74 'MockPlayStationStreamEvent' test.out

#- 75 MockXblClawbackEvent
./ng net.accelbyte.sdk.cli.Main platform mockXblClawbackEvent \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": {"eventDate": "4lypDF8y", "eventState": "wSEY2orY", "lineItemId": "Fiq99kK4", "orderId": "dWarEjCi", "productId": "9Talp8uk", "productType": "SHTgmzq9", "purchasedDate": "uBirZaC0", "sandboxId": "0hINE5Im", "skuId": "aADBqdvq", "subscriptionData": {"consumedDurationInDays": 91, "dateTime": "rV7iNYu8", "durationInDays": 88, "recurrenceId": "WMm8Q4H9"}}, "datacontenttype": "njSiDxOU", "id": "QuWZGreb", "source": "G9kAqDYJ", "specVersion": "L8UXIbzy", "subject": "AfU0n7yK", "time": "p9a3PZ7j", "traceparent": "We2Zz8o9", "type": "QXwfUstv"}' \
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
    --body '{"appAppleId": 41, "bundleId": "Fk6Ax4df", "issuerId": "tQSvJzd6", "keyId": "WOPNBG7f", "password": "7k0KfdMZ", "version": "V1"}' \
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
    --body '{"sandboxId": "4auyhNi8"}' \
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
    --body '{"applicationName": "duPRb8Xv", "notificationTokenAudience": "fG8Dndcn", "notificationTokenEmail": "AqS9Wftk", "packageName": "4pBI3IJw", "serviceAccountId": "EZrkNbjR"}' \
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
    --body '{"data": [{"itemIdentity": "eYFUJAcU", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"qqsqQJH5": "s8hCLpkS", "eHaNUMQg": "kiZllz7i", "hOmzuzpj": "S4LuCe0Z"}}, {"itemIdentity": "mQq3Zujb", "itemIdentityType": "ITEM_ID", "platformProductIdMap": {"AoPY1Fpy": "ggxTsWmY", "TXVMyzYO": "aXA65FDe", "IbBMWU52": "fOJHNGjr"}}, {"itemIdentity": "WaQ6Fp1G", "itemIdentityType": "ITEM_ID", "platformProductIdMap": {"7eaxDOpQ": "Oy1gstis", "vcdLOHRk": "puOa4sCS", "fkZ2oJbo": "XxqhLsdE"}}]}' \
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
    --body '{"appId": "tS9eNXjX", "appSecret": "j1luOkXH"}' \
    > test.out 2>&1
eval_tap $? 91 'UpdateOculusIAPConfig' test.out

#- 92 DeleteOculusIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteOculusIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 92 'DeleteOculusIAPConfig' test.out

#- 93 GetPlayStationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getPlayStationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 93 'GetPlayStationIAPConfig' test.out

#- 94 UpdatePlaystationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlaystationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"backOfficeServerClientId": "AoZPaFbG", "backOfficeServerClientSecret": "SoNg48Ey", "enableStreamJob": true, "environment": "y3pU85tk", "streamName": "TlqNqAo8", "streamPartnerName": "oHu9KRLm"}' \
    > test.out 2>&1
eval_tap $? 94 'UpdatePlaystationIAPConfig' test.out

#- 95 DeletePlaystationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deletePlaystationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 95 'DeletePlaystationIAPConfig' test.out

#- 96 ValidateExistedPlaystationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform validateExistedPlaystationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 96 'ValidateExistedPlaystationIAPConfig' test.out

#- 97 ValidatePlaystationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform validatePlaystationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"backOfficeServerClientId": "pP8WltLN", "backOfficeServerClientSecret": "zONIepjg", "enableStreamJob": true, "environment": "6J6tTHtn", "streamName": "7o3oD8Vg", "streamPartnerName": "uEbOOkQi"}' \
    > test.out 2>&1
eval_tap $? 97 'ValidatePlaystationIAPConfig' test.out

#- 98 GetSteamIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getSteamIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 98 'GetSteamIAPConfig' test.out

#- 99 UpdateSteamIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateSteamIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appId": "TRFXo15g", "env": "LIVE", "publisherAuthenticationKey": "1JOadtcU", "syncMode": "INVENTORY"}' \
    > test.out 2>&1
eval_tap $? 99 'UpdateSteamIAPConfig' test.out

#- 100 DeleteSteamIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteSteamIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 100 'DeleteSteamIAPConfig' test.out

#- 101 GetTwitchIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getTwitchIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 101 'GetTwitchIAPConfig' test.out

#- 102 UpdateTwitchIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateTwitchIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientId": "ADbJKW5J", "clientSecret": "81E5K50p", "organizationId": "Vh5SJqF6"}' \
    > test.out 2>&1
eval_tap $? 102 'UpdateTwitchIAPConfig' test.out

#- 103 DeleteTwitchIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteTwitchIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 103 'DeleteTwitchIAPConfig' test.out

#- 104 GetXblIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getXblIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 104 'GetXblIAPConfig' test.out

#- 105 UpdateXblIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateXblIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"enableClawback": true, "entraAppClientId": "ZeuDmPLZ", "entraAppClientSecret": "aDfL3slf", "entraTenantId": "ERgc23B7", "relyingPartyCert": "EefzCSKN"}' \
    > test.out 2>&1
eval_tap $? 105 'UpdateXblIAPConfig' test.out

#- 106 DeleteXblAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteXblAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 106 'DeleteXblAPConfig' test.out

#- 107 UpdateXblBPCertFile
./ng net.accelbyte.sdk.cli.Main platform updateXblBPCertFile \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    --password '2pvYfASb' \
    > test.out 2>&1
eval_tap $? 107 'UpdateXblBPCertFile' test.out

#- 108 QueryThirdPartyNotifications
./ng net.accelbyte.sdk.cli.Main platform queryThirdPartyNotifications \
    --namespace "$AB_NAMESPACE" \
    --endDate 'Jkxoc7OR' \
    --externalId 'ADw3P9wz' \
    --limit '30' \
    --offset '60' \
    --source 'APPLE' \
    --startDate 'K5uoAiRT' \
    --status 'WARN' \
    --type '10GxDdpT' \
    > test.out 2>&1
eval_tap $? 108 'QueryThirdPartyNotifications' test.out

#- 109 QueryAbnormalTransactions
./ng net.accelbyte.sdk.cli.Main platform queryAbnormalTransactions \
    --namespace "$AB_NAMESPACE" \
    --limit '95' \
    --offset '41' \
    --orderId 'DjrOrNiQ' \
    --steamId 'ypA9H4Gx' \
    > test.out 2>&1
eval_tap $? 109 'QueryAbnormalTransactions' test.out

#- 110 AdminGetSteamJobInfo
./ng net.accelbyte.sdk.cli.Main platform adminGetSteamJobInfo \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 110 'AdminGetSteamJobInfo' test.out

#- 111 AdminResetSteamJobTime
./ng net.accelbyte.sdk.cli.Main platform adminResetSteamJobTime \
    --namespace "$AB_NAMESPACE" \
    --body '{"env": "LIVE", "lastTime": "1985-03-02T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 111 'AdminResetSteamJobTime' test.out

#- 112 AdminRefundIAPOrder
./ng net.accelbyte.sdk.cli.Main platform adminRefundIAPOrder \
    --iapOrderNo 'io0gl8gT' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 112 'AdminRefundIAPOrder' test.out

#- 113 QuerySteamReportHistories
./ng net.accelbyte.sdk.cli.Main platform querySteamReportHistories \
    --namespace "$AB_NAMESPACE" \
    --limit '73' \
    --offset '57' \
    --orderId 'PtjRTVl1' \
    --processStatus 'IGNORED' \
    --steamId 'l664CA35' \
    > test.out 2>&1
eval_tap $? 113 'QuerySteamReportHistories' test.out

#- 114 QueryThirdPartySubscription
./ng net.accelbyte.sdk.cli.Main platform queryThirdPartySubscription \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --groupId 'eFtZcnYw' \
    --limit '95' \
    --offset '73' \
    --platform 'APPLE' \
    --productId 'fd6Gx74i' \
    --userId '3URv2Xo3' \
    > test.out 2>&1
eval_tap $? 114 'QueryThirdPartySubscription' test.out

#- 115 GetIAPOrderConsumeDetails
./ng net.accelbyte.sdk.cli.Main platform getIAPOrderConsumeDetails \
    --iapOrderNo 'fegcxBMz' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 115 'GetIAPOrderConsumeDetails' test.out

#- 116 DownloadInvoiceDetails
./ng net.accelbyte.sdk.cli.Main platform downloadInvoiceDetails \
    --namespace "$AB_NAMESPACE" \
    --endTime 'ejSGjaG4' \
    --feature '5JkXiWEZ' \
    --itemId 'tpJsCprk' \
    --itemType 'CODE' \
    --startTime 'Kdsho42J' \
    > test.out 2>&1
eval_tap $? 116 'DownloadInvoiceDetails' test.out

#- 117 GenerateInvoiceSummary
./ng net.accelbyte.sdk.cli.Main platform generateInvoiceSummary \
    --namespace "$AB_NAMESPACE" \
    --endTime 'sWKRUygM' \
    --feature 'LnwUNr5w' \
    --itemId 'ZR81VkjV' \
    --itemType 'SUBSCRIPTION' \
    --startTime 'Az7QLqOf' \
    > test.out 2>&1
eval_tap $? 117 'GenerateInvoiceSummary' test.out

#- 118 SyncInGameItem
./ng net.accelbyte.sdk.cli.Main platform syncInGameItem \
    --namespace "$AB_NAMESPACE" \
    --storeId '4hGmbj0E' \
    --body '{"categoryPath": "D4LKZsPu", "targetItemId": "3gC5ENuJ", "targetNamespace": "YJ31AMY1"}' \
    > test.out 2>&1
eval_tap $? 118 'SyncInGameItem' test.out

#- 119 CreateItem
./ng net.accelbyte.sdk.cli.Main platform createItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'yjXrU0zt' \
    --body '{"appId": "Fy7nieoL", "appType": "SOFTWARE", "baseAppId": "p72xS77J", "boothName": "42RkNmU4", "categoryPath": "4xp2DW6Z", "clazz": "WewACeFO", "displayOrder": 82, "entitlementType": "CONSUMABLE", "ext": {"a1XpTLpt": {}, "8K3SGwkA": {}, "eTDnffmd": {}}, "features": ["cpnCsAD9", "QR3xBupi", "TxPcz8tD"], "flexible": true, "images": [{"as": "mcgHMNni", "caption": "KGYuqA9C", "height": 93, "imageUrl": "9rQwh6Zb", "smallImageUrl": "Mi50JQPt", "width": 86}, {"as": "b68xklva", "caption": "O4yKgZjU", "height": 81, "imageUrl": "yg4cRzei", "smallImageUrl": "g8xdub4G", "width": 66}, {"as": "Wsava6q2", "caption": "NmDIhq71", "height": 93, "imageUrl": "JLl9Cb5Q", "smallImageUrl": "1fDXCyIz", "width": 85}], "inventoryConfig": {"customAttributes": {"uyUD6fsp": {}, "YhyQY17n": {}, "jUZmEiqs": {}}, "serverCustomAttributes": {"33UiLPGx": {}, "7EP2Fm9U": {}, "Xzp6uYAu": {}}, "slotUsed": 23}, "itemIds": ["Vz9o2enq", "SKLN7K3N", "NoSGlp4w"], "itemQty": {"foOoCXQR": 99, "T9yvqski": 41, "uRvLXXcA": 50}, "itemType": "COINS", "listable": false, "localizations": {"hXWMDDv8": {"description": "5gJekL08", "localExt": {"SaGnG9Oa": {}, "RbULpqGg": {}, "kYyISlyB": {}}, "longDescription": "zKBxPUyq", "title": "a46K2jGI"}, "uA8Yll4p": {"description": "sLAqcNwb", "localExt": {"CrpKrB0S": {}, "aGsxilNT": {}, "WB1gblpQ": {}}, "longDescription": "0Kqdf7ZG", "title": "MVjTTck9"}, "UT1sKbm4": {"description": "vjriYS9t", "localExt": {"wx1r0sZU": {}, "lRIhJQSK": {}, "VKBGH1u0": {}}, "longDescription": "4rSC94bg", "title": "WpC3g4Xg"}}, "lootBoxConfig": {"rewardCount": 69, "rewards": [{"lootBoxItems": [{"count": 16, "duration": 61, "endDate": "1980-07-03T00:00:00Z", "itemId": "RXrDL6vi", "itemSku": "R67KZMja", "itemType": "XYGc1vJs"}, {"count": 32, "duration": 7, "endDate": "1975-05-15T00:00:00Z", "itemId": "WwPfIAcU", "itemSku": "WcXHoq29", "itemType": "l7UVGlXE"}, {"count": 91, "duration": 74, "endDate": "1998-05-23T00:00:00Z", "itemId": "NPMU4lge", "itemSku": "MrM6b9dP", "itemType": "6OSQd4wS"}], "name": "ruX0mejZ", "odds": 0.8657256844994061, "type": "REWARD_GROUP", "weight": 60}, {"lootBoxItems": [{"count": 55, "duration": 38, "endDate": "1985-12-22T00:00:00Z", "itemId": "nbDM7RXk", "itemSku": "vymWcodQ", "itemType": "JAAKbs1u"}, {"count": 80, "duration": 29, "endDate": "1979-06-10T00:00:00Z", "itemId": "o74ACuhX", "itemSku": "TB3Odvnh", "itemType": "xIpfhHtc"}, {"count": 9, "duration": 61, "endDate": "1971-09-16T00:00:00Z", "itemId": "fxta5y3b", "itemSku": "JptLpS8r", "itemType": "0udGxb7m"}], "name": "iASLS5Ty", "odds": 0.9313352669454565, "type": "PROBABILITY_GROUP", "weight": 22}, {"lootBoxItems": [{"count": 0, "duration": 76, "endDate": "1993-10-12T00:00:00Z", "itemId": "6zrLGUAh", "itemSku": "Qo9ch3JV", "itemType": "DlykQQz5"}, {"count": 25, "duration": 98, "endDate": "1983-11-16T00:00:00Z", "itemId": "GbaIyd8d", "itemSku": "iU1QWARW", "itemType": "aVEQcyb1"}, {"count": 66, "duration": 61, "endDate": "1981-11-22T00:00:00Z", "itemId": "2jsER695", "itemSku": "xHr8QBxS", "itemType": "ig8clbdW"}], "name": "LTD8ZLrQ", "odds": 0.6850436198628911, "type": "REWARD_GROUP", "weight": 14}], "rollFunction": "CUSTOM"}, "maxCount": 24, "maxCountPerUser": 9, "name": "SkRBjj0d", "optionBoxConfig": {"boxItems": [{"count": 26, "duration": 87, "endDate": "1991-02-24T00:00:00Z", "itemId": "WpD37I9c", "itemSku": "bFn46dlw", "itemType": "yjPVQtoY"}, {"count": 47, "duration": 100, "endDate": "1983-05-19T00:00:00Z", "itemId": "yl23lyu6", "itemSku": "GZpamFRU", "itemType": "sfwMfWi3"}, {"count": 29, "duration": 58, "endDate": "1984-08-09T00:00:00Z", "itemId": "1wNYu3IQ", "itemSku": "VRjfsAr2", "itemType": "VaVR3sWY"}]}, "purchasable": false, "recurring": {"cycle": "WEEKLY", "fixedFreeDays": 86, "fixedTrialCycles": 35, "graceDays": 65}, "regionData": {"RhxgttKI": [{"currencyCode": "Fmf4RCBV", "currencyNamespace": "2fibXPZG", "currencyType": "VIRTUAL", "discountAmount": 5, "discountExpireAt": "1987-08-15T00:00:00Z", "discountPercentage": 85, "discountPurchaseAt": "1974-06-08T00:00:00Z", "expireAt": "1993-12-06T00:00:00Z", "price": 98, "purchaseAt": "1983-06-27T00:00:00Z", "trialPrice": 29}, {"currencyCode": "0W46nqN1", "currencyNamespace": "VdPYyvFI", "currencyType": "REAL", "discountAmount": 49, "discountExpireAt": "1994-07-11T00:00:00Z", "discountPercentage": 57, "discountPurchaseAt": "1980-11-22T00:00:00Z", "expireAt": "1976-12-31T00:00:00Z", "price": 33, "purchaseAt": "1981-08-23T00:00:00Z", "trialPrice": 97}, {"currencyCode": "qvW3QcqC", "currencyNamespace": "tLpzeFGd", "currencyType": "REAL", "discountAmount": 0, "discountExpireAt": "1991-08-12T00:00:00Z", "discountPercentage": 35, "discountPurchaseAt": "1981-06-04T00:00:00Z", "expireAt": "1995-05-12T00:00:00Z", "price": 19, "purchaseAt": "1979-02-11T00:00:00Z", "trialPrice": 65}], "Qw4NJNXI": [{"currencyCode": "XHrG3l2q", "currencyNamespace": "Pw2VM6zZ", "currencyType": "VIRTUAL", "discountAmount": 83, "discountExpireAt": "1994-05-11T00:00:00Z", "discountPercentage": 24, "discountPurchaseAt": "1981-05-17T00:00:00Z", "expireAt": "1994-01-28T00:00:00Z", "price": 82, "purchaseAt": "1992-10-02T00:00:00Z", "trialPrice": 8}, {"currencyCode": "K50hPgdQ", "currencyNamespace": "XhZc3IoG", "currencyType": "VIRTUAL", "discountAmount": 18, "discountExpireAt": "1998-11-08T00:00:00Z", "discountPercentage": 35, "discountPurchaseAt": "1978-04-04T00:00:00Z", "expireAt": "1973-07-30T00:00:00Z", "price": 82, "purchaseAt": "1986-05-03T00:00:00Z", "trialPrice": 75}, {"currencyCode": "Mctd4AuH", "currencyNamespace": "TsZTrdO6", "currencyType": "REAL", "discountAmount": 88, "discountExpireAt": "1972-08-13T00:00:00Z", "discountPercentage": 64, "discountPurchaseAt": "1985-07-12T00:00:00Z", "expireAt": "1981-11-12T00:00:00Z", "price": 80, "purchaseAt": "1986-08-26T00:00:00Z", "trialPrice": 83}], "k2n7j738": [{"currencyCode": "UgYNC1fZ", "currencyNamespace": "6XmvqdZO", "currencyType": "REAL", "discountAmount": 9, "discountExpireAt": "1989-06-10T00:00:00Z", "discountPercentage": 98, "discountPurchaseAt": "1996-07-21T00:00:00Z", "expireAt": "1997-05-02T00:00:00Z", "price": 97, "purchaseAt": "1971-11-24T00:00:00Z", "trialPrice": 95}, {"currencyCode": "fsbMRz2E", "currencyNamespace": "yGWtT5xi", "currencyType": "REAL", "discountAmount": 1, "discountExpireAt": "1989-08-20T00:00:00Z", "discountPercentage": 28, "discountPurchaseAt": "1972-06-01T00:00:00Z", "expireAt": "1999-07-05T00:00:00Z", "price": 26, "purchaseAt": "1995-04-24T00:00:00Z", "trialPrice": 34}, {"currencyCode": "FALbNyUe", "currencyNamespace": "YwrSc8Nq", "currencyType": "REAL", "discountAmount": 20, "discountExpireAt": "1987-10-12T00:00:00Z", "discountPercentage": 31, "discountPurchaseAt": "1985-12-29T00:00:00Z", "expireAt": "1999-03-09T00:00:00Z", "price": 18, "purchaseAt": "1994-07-01T00:00:00Z", "trialPrice": 21}]}, "saleConfig": {"currencyCode": "0wFUn8oY", "price": 36}, "seasonType": "TIER", "sectionExclusive": true, "sellable": false, "sku": "1E9jdjaz", "stackable": true, "status": "INACTIVE", "tags": ["X91XqPoP", "nmwlwxrE", "UbnGbfVG"], "targetCurrencyCode": "M7Q4OBrD", "targetNamespace": "gOC5wbWB", "thumbnailUrl": "1yeJt59U", "useCount": 6}' \
    > test.out 2>&1
eval_tap $? 119 'CreateItem' test.out

#- 120 GetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform getItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'KKqA9Alk' \
    --appId 'MeEsujdW' \
    > test.out 2>&1
eval_tap $? 120 'GetItemByAppId' test.out

#- 121 QueryItems
./ng net.accelbyte.sdk.cli.Main platform queryItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --appType 'SOFTWARE' \
    --availableDate '2OVntZer' \
    --baseAppId 'cZHDWVRv' \
    --categoryPath 'xMNCa5Di' \
    --features 'GIa0xFij' \
    --includeSubCategoryItem  \
    --itemType 'LOOTBOX' \
    --limit '54' \
    --offset '74' \
    --region 'elkawPH0' \
    --sortBy 'name:desc,displayOrder:desc,displayOrder' \
    --storeId 'dcJQzDvG' \
    --tags 'hTwLklRO' \
    --targetNamespace 'L1nzxnCO' \
    > test.out 2>&1
eval_tap $? 121 'QueryItems' test.out

#- 122 ListBasicItemsByFeatures
./ng net.accelbyte.sdk.cli.Main platform listBasicItemsByFeatures \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --features '7UaUc157,UIusmhvM,pzSpBbSu' \
    > test.out 2>&1
eval_tap $? 122 'ListBasicItemsByFeatures' test.out

#- 123 GetItems
./ng net.accelbyte.sdk.cli.Main platform getItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'PbOI06Cx' \
    --itemIds 'XNBz2t6v' \
    > test.out 2>&1
eval_tap $? 123 'GetItems' test.out

#- 124 GetItemBySku
./ng net.accelbyte.sdk.cli.Main platform getItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'hR64Ejnj' \
    --sku 'KiouVbFV' \
    > test.out 2>&1
eval_tap $? 124 'GetItemBySku' test.out

#- 125 GetLocaleItemBySku
./ng net.accelbyte.sdk.cli.Main platform getLocaleItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'Vg6N8Yy2' \
    --populateBundle  \
    --region '5nZXuhIE' \
    --storeId 'uo1BmFhX' \
    --sku 'SUzVVzOk' \
    > test.out 2>&1
eval_tap $? 125 'GetLocaleItemBySku' test.out

#- 126 GetEstimatedPrice
./ng net.accelbyte.sdk.cli.Main platform getEstimatedPrice \
    --namespace "$AB_NAMESPACE" \
    --platform 'SI6yAPTB' \
    --region 'SjHhKoQf' \
    --storeId '2OYqTid5' \
    --itemIds 'M3exy7yS' \
    --userId 'IHovrXL6' \
    > test.out 2>&1
eval_tap $? 126 'GetEstimatedPrice' test.out

#- 127 GetItemIdBySku
./ng net.accelbyte.sdk.cli.Main platform getItemIdBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'p6bDs5Ka' \
    --sku 'I821Nz6l' \
    > test.out 2>&1
eval_tap $? 127 'GetItemIdBySku' test.out

#- 128 GetBulkItemIdBySkus
./ng net.accelbyte.sdk.cli.Main platform getBulkItemIdBySkus \
    --namespace "$AB_NAMESPACE" \
    --sku 'UoO18W5M,J2Vxkr9C,NIBSOjpw' \
    --storeId '1EDpXzg6' \
    > test.out 2>&1
eval_tap $? 128 'GetBulkItemIdBySkus' test.out

#- 129 BulkGetLocaleItems
./ng net.accelbyte.sdk.cli.Main platform bulkGetLocaleItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'JmmrgCWY' \
    --region 'qvIml0ib' \
    --storeId 'O3j0OZmL' \
    --itemIds 'Lo6OLINw' \
    > test.out 2>&1
eval_tap $? 129 'BulkGetLocaleItems' test.out

#- 130 GetAvailablePredicateTypes
./ng net.accelbyte.sdk.cli.Main platform getAvailablePredicateTypes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 130 'GetAvailablePredicateTypes' test.out

#- 131 ValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform validateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --platform 'B4jRdfsG' \
    --userId 'BfB4gnST' \
    --body '{"itemIds": ["YLccZ0YL", "tj2DqcwI", "J1NsHjNL"]}' \
    > test.out 2>&1
eval_tap $? 131 'ValidateItemPurchaseCondition' test.out

#- 132 BulkUpdateRegionData
./ng net.accelbyte.sdk.cli.Main platform bulkUpdateRegionData \
    --namespace "$AB_NAMESPACE" \
    --storeId 'xuvgzkHO' \
    --body '{"changes": [{"itemIdentities": ["QY8L0HWT", "YPpe9DCR", "mHcKrQL0"], "itemIdentityType": "ITEM_SKU", "regionData": {"yjp103EP": [{"currencyCode": "S9FUj8MI", "currencyNamespace": "mGH3WvQf", "currencyType": "REAL", "discountAmount": 28, "discountExpireAt": "1982-11-09T00:00:00Z", "discountPercentage": 72, "discountPurchaseAt": "1992-12-08T00:00:00Z", "discountedPrice": 41, "expireAt": "1999-10-15T00:00:00Z", "price": 50, "purchaseAt": "1979-05-10T00:00:00Z", "trialPrice": 68}, {"currencyCode": "lxKqYbsY", "currencyNamespace": "Gz7IxskM", "currencyType": "REAL", "discountAmount": 11, "discountExpireAt": "1977-04-24T00:00:00Z", "discountPercentage": 92, "discountPurchaseAt": "1976-11-16T00:00:00Z", "discountedPrice": 4, "expireAt": "1976-05-14T00:00:00Z", "price": 11, "purchaseAt": "1993-11-11T00:00:00Z", "trialPrice": 97}, {"currencyCode": "8Phn1y2z", "currencyNamespace": "Nta1xGyh", "currencyType": "REAL", "discountAmount": 51, "discountExpireAt": "1971-08-23T00:00:00Z", "discountPercentage": 29, "discountPurchaseAt": "1977-10-13T00:00:00Z", "discountedPrice": 75, "expireAt": "1979-06-14T00:00:00Z", "price": 38, "purchaseAt": "1989-01-17T00:00:00Z", "trialPrice": 22}], "twr8V7mC": [{"currencyCode": "t9IGdZ9H", "currencyNamespace": "u54mQpbG", "currencyType": "REAL", "discountAmount": 57, "discountExpireAt": "1972-02-26T00:00:00Z", "discountPercentage": 15, "discountPurchaseAt": "1990-10-14T00:00:00Z", "discountedPrice": 39, "expireAt": "1981-04-05T00:00:00Z", "price": 26, "purchaseAt": "1973-02-25T00:00:00Z", "trialPrice": 62}, {"currencyCode": "yebfS44X", "currencyNamespace": "fgMUcnxo", "currencyType": "VIRTUAL", "discountAmount": 75, "discountExpireAt": "1999-04-09T00:00:00Z", "discountPercentage": 43, "discountPurchaseAt": "1972-06-12T00:00:00Z", "discountedPrice": 3, "expireAt": "1984-06-17T00:00:00Z", "price": 53, "purchaseAt": "1993-04-16T00:00:00Z", "trialPrice": 48}, {"currencyCode": "Q6jQPKS2", "currencyNamespace": "NGOxfLqx", "currencyType": "VIRTUAL", "discountAmount": 10, "discountExpireAt": "1980-03-29T00:00:00Z", "discountPercentage": 16, "discountPurchaseAt": "1974-10-09T00:00:00Z", "discountedPrice": 28, "expireAt": "1997-10-28T00:00:00Z", "price": 13, "purchaseAt": "1975-06-14T00:00:00Z", "trialPrice": 41}], "yjXy5Igk": [{"currencyCode": "ZPpoz20D", "currencyNamespace": "Z72BHmk2", "currencyType": "VIRTUAL", "discountAmount": 38, "discountExpireAt": "1976-10-05T00:00:00Z", "discountPercentage": 50, "discountPurchaseAt": "1991-05-29T00:00:00Z", "discountedPrice": 77, "expireAt": "1981-04-04T00:00:00Z", "price": 91, "purchaseAt": "1985-07-02T00:00:00Z", "trialPrice": 30}, {"currencyCode": "AyZYQvl7", "currencyNamespace": "ZQhBrCqx", "currencyType": "REAL", "discountAmount": 69, "discountExpireAt": "1986-06-03T00:00:00Z", "discountPercentage": 79, "discountPurchaseAt": "1979-12-09T00:00:00Z", "discountedPrice": 42, "expireAt": "1991-04-09T00:00:00Z", "price": 53, "purchaseAt": "1991-10-23T00:00:00Z", "trialPrice": 69}, {"currencyCode": "sV7d8FKz", "currencyNamespace": "937Hukcv", "currencyType": "REAL", "discountAmount": 62, "discountExpireAt": "1990-02-12T00:00:00Z", "discountPercentage": 74, "discountPurchaseAt": "1971-09-20T00:00:00Z", "discountedPrice": 12, "expireAt": "1976-02-16T00:00:00Z", "price": 0, "purchaseAt": "1976-05-17T00:00:00Z", "trialPrice": 11}]}}, {"itemIdentities": ["h0NZ0oai", "qc8qf8l2", "Qc9XzMtO"], "itemIdentityType": "ITEM_ID", "regionData": {"Xyi9rkxv": [{"currencyCode": "FGSgLcJ4", "currencyNamespace": "QNeuyVaH", "currencyType": "REAL", "discountAmount": 100, "discountExpireAt": "1975-10-07T00:00:00Z", "discountPercentage": 39, "discountPurchaseAt": "1989-02-07T00:00:00Z", "discountedPrice": 66, "expireAt": "1991-02-14T00:00:00Z", "price": 91, "purchaseAt": "1999-12-23T00:00:00Z", "trialPrice": 68}, {"currencyCode": "13DdynUw", "currencyNamespace": "zlZMeC7e", "currencyType": "REAL", "discountAmount": 27, "discountExpireAt": "1983-08-12T00:00:00Z", "discountPercentage": 63, "discountPurchaseAt": "1992-04-08T00:00:00Z", "discountedPrice": 5, "expireAt": "1981-04-16T00:00:00Z", "price": 43, "purchaseAt": "1973-03-03T00:00:00Z", "trialPrice": 26}, {"currencyCode": "h0zG3Qxs", "currencyNamespace": "yCLEccDY", "currencyType": "VIRTUAL", "discountAmount": 39, "discountExpireAt": "1992-10-06T00:00:00Z", "discountPercentage": 5, "discountPurchaseAt": "1971-03-10T00:00:00Z", "discountedPrice": 87, "expireAt": "1990-08-25T00:00:00Z", "price": 16, "purchaseAt": "1975-05-31T00:00:00Z", "trialPrice": 48}], "D8v1oyk0": [{"currencyCode": "pLOv41x0", "currencyNamespace": "qqKZNYeG", "currencyType": "REAL", "discountAmount": 20, "discountExpireAt": "1980-02-19T00:00:00Z", "discountPercentage": 36, "discountPurchaseAt": "1975-12-03T00:00:00Z", "discountedPrice": 81, "expireAt": "1973-04-21T00:00:00Z", "price": 34, "purchaseAt": "1985-07-14T00:00:00Z", "trialPrice": 92}, {"currencyCode": "Ex1wUdqf", "currencyNamespace": "cAhVaAgx", "currencyType": "REAL", "discountAmount": 64, "discountExpireAt": "1997-08-28T00:00:00Z", "discountPercentage": 19, "discountPurchaseAt": "1986-12-06T00:00:00Z", "discountedPrice": 38, "expireAt": "1999-11-19T00:00:00Z", "price": 34, "purchaseAt": "1984-06-30T00:00:00Z", "trialPrice": 65}, {"currencyCode": "Ih1i2wp0", "currencyNamespace": "jxTxcuzb", "currencyType": "REAL", "discountAmount": 77, "discountExpireAt": "1983-12-06T00:00:00Z", "discountPercentage": 96, "discountPurchaseAt": "1977-05-28T00:00:00Z", "discountedPrice": 56, "expireAt": "1987-02-14T00:00:00Z", "price": 16, "purchaseAt": "1983-04-12T00:00:00Z", "trialPrice": 54}], "NYjRfkHE": [{"currencyCode": "imPxxUnj", "currencyNamespace": "GCRZjm66", "currencyType": "VIRTUAL", "discountAmount": 65, "discountExpireAt": "1986-08-02T00:00:00Z", "discountPercentage": 51, "discountPurchaseAt": "1985-04-09T00:00:00Z", "discountedPrice": 84, "expireAt": "1983-12-10T00:00:00Z", "price": 10, "purchaseAt": "1973-06-04T00:00:00Z", "trialPrice": 80}, {"currencyCode": "GtTgnYRf", "currencyNamespace": "OXcWhQ76", "currencyType": "VIRTUAL", "discountAmount": 70, "discountExpireAt": "1980-12-10T00:00:00Z", "discountPercentage": 41, "discountPurchaseAt": "1982-12-07T00:00:00Z", "discountedPrice": 15, "expireAt": "1976-02-15T00:00:00Z", "price": 29, "purchaseAt": "1981-02-18T00:00:00Z", "trialPrice": 47}, {"currencyCode": "yRn4CLgR", "currencyNamespace": "yR6N6vxr", "currencyType": "REAL", "discountAmount": 17, "discountExpireAt": "1996-06-04T00:00:00Z", "discountPercentage": 36, "discountPurchaseAt": "1973-03-28T00:00:00Z", "discountedPrice": 15, "expireAt": "1992-12-01T00:00:00Z", "price": 73, "purchaseAt": "1987-12-26T00:00:00Z", "trialPrice": 29}]}}, {"itemIdentities": ["AAEKLKtz", "ScMAmzhS", "gFJOBUBz"], "itemIdentityType": "ITEM_ID", "regionData": {"xOLpdOdR": [{"currencyCode": "twAmE9om", "currencyNamespace": "hGgV7MOI", "currencyType": "VIRTUAL", "discountAmount": 16, "discountExpireAt": "1978-04-24T00:00:00Z", "discountPercentage": 4, "discountPurchaseAt": "1987-07-29T00:00:00Z", "discountedPrice": 58, "expireAt": "1980-03-31T00:00:00Z", "price": 30, "purchaseAt": "1988-11-26T00:00:00Z", "trialPrice": 13}, {"currencyCode": "lUKxx14T", "currencyNamespace": "8L6x9fo3", "currencyType": "REAL", "discountAmount": 48, "discountExpireAt": "1973-07-21T00:00:00Z", "discountPercentage": 66, "discountPurchaseAt": "1973-05-30T00:00:00Z", "discountedPrice": 65, "expireAt": "1994-05-07T00:00:00Z", "price": 48, "purchaseAt": "1974-10-11T00:00:00Z", "trialPrice": 66}, {"currencyCode": "CZAtE1dQ", "currencyNamespace": "PnRZeViU", "currencyType": "REAL", "discountAmount": 37, "discountExpireAt": "1974-07-04T00:00:00Z", "discountPercentage": 82, "discountPurchaseAt": "1980-06-24T00:00:00Z", "discountedPrice": 64, "expireAt": "1991-02-10T00:00:00Z", "price": 89, "purchaseAt": "1989-03-01T00:00:00Z", "trialPrice": 77}], "XVLby3qV": [{"currencyCode": "6xi4wvlP", "currencyNamespace": "lMDLlPBV", "currencyType": "REAL", "discountAmount": 63, "discountExpireAt": "1981-12-01T00:00:00Z", "discountPercentage": 12, "discountPurchaseAt": "1992-08-17T00:00:00Z", "discountedPrice": 89, "expireAt": "1998-08-01T00:00:00Z", "price": 55, "purchaseAt": "1978-12-06T00:00:00Z", "trialPrice": 44}, {"currencyCode": "qcGoiV5U", "currencyNamespace": "bvS84jhx", "currencyType": "REAL", "discountAmount": 68, "discountExpireAt": "1988-05-12T00:00:00Z", "discountPercentage": 77, "discountPurchaseAt": "1973-03-12T00:00:00Z", "discountedPrice": 49, "expireAt": "1975-04-30T00:00:00Z", "price": 27, "purchaseAt": "1995-03-22T00:00:00Z", "trialPrice": 57}, {"currencyCode": "rbFL4fNw", "currencyNamespace": "6gi74WAs", "currencyType": "REAL", "discountAmount": 37, "discountExpireAt": "1991-12-18T00:00:00Z", "discountPercentage": 17, "discountPurchaseAt": "1972-08-27T00:00:00Z", "discountedPrice": 96, "expireAt": "1981-06-06T00:00:00Z", "price": 65, "purchaseAt": "1992-12-01T00:00:00Z", "trialPrice": 71}], "qNud60tK": [{"currencyCode": "0SRPUmoP", "currencyNamespace": "GJHjlRa9", "currencyType": "VIRTUAL", "discountAmount": 10, "discountExpireAt": "1984-03-25T00:00:00Z", "discountPercentage": 70, "discountPurchaseAt": "1992-08-24T00:00:00Z", "discountedPrice": 33, "expireAt": "1991-11-22T00:00:00Z", "price": 75, "purchaseAt": "1980-03-14T00:00:00Z", "trialPrice": 41}, {"currencyCode": "MXlOdX8z", "currencyNamespace": "gry3aAc6", "currencyType": "REAL", "discountAmount": 98, "discountExpireAt": "1988-02-07T00:00:00Z", "discountPercentage": 1, "discountPurchaseAt": "1980-03-06T00:00:00Z", "discountedPrice": 28, "expireAt": "1986-12-13T00:00:00Z", "price": 100, "purchaseAt": "1990-03-13T00:00:00Z", "trialPrice": 69}, {"currencyCode": "WMaJ9Wwd", "currencyNamespace": "4AustNuq", "currencyType": "REAL", "discountAmount": 31, "discountExpireAt": "1994-08-06T00:00:00Z", "discountPercentage": 22, "discountPurchaseAt": "1998-02-12T00:00:00Z", "discountedPrice": 39, "expireAt": "1986-06-07T00:00:00Z", "price": 81, "purchaseAt": "1996-06-11T00:00:00Z", "trialPrice": 17}]}}]}' \
    > test.out 2>&1
eval_tap $? 132 'BulkUpdateRegionData' test.out

#- 133 SearchItems
./ng net.accelbyte.sdk.cli.Main platform searchItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemType 'COINS' \
    --limit '96' \
    --offset '70' \
    --sortBy '9m35Ai3N' \
    --storeId 'bTcldWSz' \
    --keyword '91xTgqYL' \
    --language 'DMk2at5W' \
    > test.out 2>&1
eval_tap $? 133 'SearchItems' test.out

#- 134 QueryUncategorizedItems
./ng net.accelbyte.sdk.cli.Main platform queryUncategorizedItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --limit '88' \
    --offset '75' \
    --sortBy 'createdAt:asc,name:asc,displayOrder' \
    --storeId 'i8e7Kfqh' \
    > test.out 2>&1
eval_tap $? 134 'QueryUncategorizedItems' test.out

#- 135 GetItem
./ng net.accelbyte.sdk.cli.Main platform getItem \
    --itemId 'uS8I2zAO' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'sjONyVQ6' \
    > test.out 2>&1
eval_tap $? 135 'GetItem' test.out

#- 136 UpdateItem
./ng net.accelbyte.sdk.cli.Main platform updateItem \
    --itemId 'rspUbTdV' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'NtnucpNY' \
    --body '{"appId": "91V6fjjD", "appType": "DEMO", "baseAppId": "hnp6RvJv", "boothName": "AKpZuxac", "categoryPath": "vnUo0C9m", "clazz": "Y3nHxgdO", "displayOrder": 11, "entitlementType": "CONSUMABLE", "ext": {"1H31AwZz": {}, "uiw2gGgL": {}, "w4MBT6Bw": {}}, "features": ["Ptu7GYMS", "5Y5ojYIs", "H3R07mKj"], "flexible": true, "images": [{"as": "m0bl420X", "caption": "lhgC6M2a", "height": 28, "imageUrl": "l5tMESa4", "smallImageUrl": "p1kZjLzy", "width": 74}, {"as": "RYyWOYzD", "caption": "rMUL35eu", "height": 13, "imageUrl": "tzoKFQMf", "smallImageUrl": "a06jmiMU", "width": 93}, {"as": "B0PqZPVU", "caption": "KELwewjt", "height": 53, "imageUrl": "0Y1W0pk4", "smallImageUrl": "fwqcQhcu", "width": 67}], "inventoryConfig": {"customAttributes": {"c9uu2zUL": {}, "zNuLPB47": {}, "YEazqx1J": {}}, "serverCustomAttributes": {"dcf9UpUt": {}, "hfpNy7gY": {}, "ieWrCoQx": {}}, "slotUsed": 58}, "itemIds": ["xzPPKhFr", "yO6fioz1", "nGlYAkeD"], "itemQty": {"mrxQv3Bl": 7, "El2NZ6FI": 42, "ogL6uDER": 92}, "itemType": "EXTENSION", "listable": true, "localizations": {"VWa3JK42": {"description": "e2oa9lWH", "localExt": {"iZzN33Lp": {}, "WmjLVWgp": {}, "VUqcd1q5": {}}, "longDescription": "I7t8JVMm", "title": "5Up7kPW7"}, "5ZMbV60e": {"description": "X7hT2oHu", "localExt": {"34YvQ36J": {}, "DhXG5275": {}, "WBQ9FITh": {}}, "longDescription": "XnPViopM", "title": "dlyeqzci"}, "fSMHxTmY": {"description": "Q2zaCU3e", "localExt": {"qMLEVl49": {}, "Lb7EMTor": {}, "odpGqhqH": {}}, "longDescription": "rfbgf3jV", "title": "ybFqLM8q"}}, "lootBoxConfig": {"rewardCount": 56, "rewards": [{"lootBoxItems": [{"count": 26, "duration": 52, "endDate": "1980-11-26T00:00:00Z", "itemId": "ZNc2labG", "itemSku": "4qHE7aeR", "itemType": "FApET7Wf"}, {"count": 79, "duration": 23, "endDate": "1988-10-25T00:00:00Z", "itemId": "FwKP36ym", "itemSku": "QTgrmZJV", "itemType": "yAzG7oiJ"}, {"count": 93, "duration": 15, "endDate": "1980-07-28T00:00:00Z", "itemId": "sEy0tmo3", "itemSku": "irR3qwuI", "itemType": "MNCxLzad"}], "name": "Hb3Ubf48", "odds": 0.2092161961577853, "type": "REWARD", "weight": 94}, {"lootBoxItems": [{"count": 98, "duration": 19, "endDate": "1978-02-10T00:00:00Z", "itemId": "QKnbKNz1", "itemSku": "1cyqYQiY", "itemType": "oksRFNbA"}, {"count": 53, "duration": 4, "endDate": "1977-11-08T00:00:00Z", "itemId": "ChzGbayw", "itemSku": "QH5z2OtJ", "itemType": "cBgrPEW5"}, {"count": 6, "duration": 85, "endDate": "1983-08-28T00:00:00Z", "itemId": "BXa0vDbr", "itemSku": "5ifTmfpc", "itemType": "FAnCl4xu"}], "name": "C6EaWZKM", "odds": 0.33451130236274673, "type": "REWARD", "weight": 28}, {"lootBoxItems": [{"count": 25, "duration": 97, "endDate": "1977-07-29T00:00:00Z", "itemId": "CBBd8uRc", "itemSku": "yZs7rQuw", "itemType": "zaCXBSIS"}, {"count": 79, "duration": 39, "endDate": "1973-03-01T00:00:00Z", "itemId": "GnJz9dwV", "itemSku": "qu72407l", "itemType": "5i6vbhbn"}, {"count": 13, "duration": 39, "endDate": "1973-12-07T00:00:00Z", "itemId": "iErkBRRO", "itemSku": "IFH2gqFs", "itemType": "PcHUNpdn"}], "name": "5BtQZM9G", "odds": 0.6099035245167523, "type": "REWARD_GROUP", "weight": 95}], "rollFunction": "CUSTOM"}, "maxCount": 68, "maxCountPerUser": 92, "name": "dChL2lQq", "optionBoxConfig": {"boxItems": [{"count": 86, "duration": 69, "endDate": "1982-06-11T00:00:00Z", "itemId": "ErxOyz0q", "itemSku": "Xny1BWAI", "itemType": "WsKs91Az"}, {"count": 77, "duration": 95, "endDate": "1972-04-13T00:00:00Z", "itemId": "nKETYIyo", "itemSku": "2YQwPEuG", "itemType": "FZTxA1j7"}, {"count": 59, "duration": 68, "endDate": "1971-12-30T00:00:00Z", "itemId": "df0CvQDH", "itemSku": "2jChVNEf", "itemType": "H0cOngmA"}]}, "purchasable": true, "recurring": {"cycle": "YEARLY", "fixedFreeDays": 59, "fixedTrialCycles": 82, "graceDays": 45}, "regionData": {"OmYZWEUi": [{"currencyCode": "4346wx4j", "currencyNamespace": "LBmqptKE", "currencyType": "REAL", "discountAmount": 85, "discountExpireAt": "1979-02-02T00:00:00Z", "discountPercentage": 43, "discountPurchaseAt": "1997-01-15T00:00:00Z", "expireAt": "1980-04-07T00:00:00Z", "price": 42, "purchaseAt": "1987-10-04T00:00:00Z", "trialPrice": 43}, {"currencyCode": "4My7WQTL", "currencyNamespace": "69QezK0H", "currencyType": "REAL", "discountAmount": 27, "discountExpireAt": "1988-05-22T00:00:00Z", "discountPercentage": 74, "discountPurchaseAt": "1991-12-27T00:00:00Z", "expireAt": "1977-02-04T00:00:00Z", "price": 66, "purchaseAt": "1991-03-04T00:00:00Z", "trialPrice": 77}, {"currencyCode": "wUxGgOsy", "currencyNamespace": "Kc3CrlP8", "currencyType": "REAL", "discountAmount": 84, "discountExpireAt": "1992-03-06T00:00:00Z", "discountPercentage": 5, "discountPurchaseAt": "1985-01-09T00:00:00Z", "expireAt": "1995-04-12T00:00:00Z", "price": 42, "purchaseAt": "1989-06-17T00:00:00Z", "trialPrice": 80}], "aZ50znwT": [{"currencyCode": "V4BD5bhq", "currencyNamespace": "ylmH3XlZ", "currencyType": "REAL", "discountAmount": 78, "discountExpireAt": "1998-04-28T00:00:00Z", "discountPercentage": 8, "discountPurchaseAt": "1997-06-04T00:00:00Z", "expireAt": "1981-09-19T00:00:00Z", "price": 70, "purchaseAt": "1987-07-17T00:00:00Z", "trialPrice": 50}, {"currencyCode": "fIS1c3bA", "currencyNamespace": "nA0NpqOb", "currencyType": "VIRTUAL", "discountAmount": 37, "discountExpireAt": "1998-01-10T00:00:00Z", "discountPercentage": 46, "discountPurchaseAt": "1985-07-15T00:00:00Z", "expireAt": "1971-04-06T00:00:00Z", "price": 55, "purchaseAt": "1971-01-11T00:00:00Z", "trialPrice": 36}, {"currencyCode": "tuQuUbl0", "currencyNamespace": "kAnCwcm4", "currencyType": "VIRTUAL", "discountAmount": 55, "discountExpireAt": "1994-03-25T00:00:00Z", "discountPercentage": 76, "discountPurchaseAt": "1984-09-26T00:00:00Z", "expireAt": "1997-10-23T00:00:00Z", "price": 83, "purchaseAt": "1994-10-06T00:00:00Z", "trialPrice": 55}], "p8XV1OAv": [{"currencyCode": "iHn6obgv", "currencyNamespace": "p2WTDhqs", "currencyType": "VIRTUAL", "discountAmount": 14, "discountExpireAt": "1977-09-14T00:00:00Z", "discountPercentage": 70, "discountPurchaseAt": "1995-05-24T00:00:00Z", "expireAt": "1990-12-09T00:00:00Z", "price": 23, "purchaseAt": "1974-12-11T00:00:00Z", "trialPrice": 62}, {"currencyCode": "3ySUzSN6", "currencyNamespace": "hFND3Gd8", "currencyType": "VIRTUAL", "discountAmount": 77, "discountExpireAt": "1976-07-12T00:00:00Z", "discountPercentage": 22, "discountPurchaseAt": "1973-04-16T00:00:00Z", "expireAt": "1999-01-05T00:00:00Z", "price": 88, "purchaseAt": "1993-06-06T00:00:00Z", "trialPrice": 45}, {"currencyCode": "BfjF2JU0", "currencyNamespace": "cN8bCtTe", "currencyType": "REAL", "discountAmount": 39, "discountExpireAt": "1990-04-03T00:00:00Z", "discountPercentage": 93, "discountPurchaseAt": "1990-06-23T00:00:00Z", "expireAt": "1995-01-03T00:00:00Z", "price": 38, "purchaseAt": "1986-08-31T00:00:00Z", "trialPrice": 19}]}, "saleConfig": {"currencyCode": "iQPWR2Jg", "price": 96}, "seasonType": "PASS", "sectionExclusive": false, "sellable": false, "sku": "QzjG9sHr", "stackable": true, "status": "ACTIVE", "tags": ["YGPtiASn", "xwcnFg3E", "rROHI0rJ"], "targetCurrencyCode": "QIrKNE5R", "targetNamespace": "blNh4hDo", "thumbnailUrl": "eOYtvdDB", "useCount": 45}' \
    > test.out 2>&1
eval_tap $? 136 'UpdateItem' test.out

#- 137 DeleteItem
./ng net.accelbyte.sdk.cli.Main platform deleteItem \
    --itemId 'viFqzRqK' \
    --namespace "$AB_NAMESPACE" \
    --featuresToCheck 'CATALOG,REWARD,DLC' \
    --force  \
    --storeId 'Zd63SBj0' \
    > test.out 2>&1
eval_tap $? 137 'DeleteItem' test.out

#- 138 AcquireItem
./ng net.accelbyte.sdk.cli.Main platform acquireItem \
    --itemId 'gPr5mCiG' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 29, "orderNo": "GsIwJCxh"}' \
    > test.out 2>&1
eval_tap $? 138 'AcquireItem' test.out

#- 139 GetApp
./ng net.accelbyte.sdk.cli.Main platform getApp \
    --itemId '5N8m9Inq' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'zfsN4qPb' \
    > test.out 2>&1
eval_tap $? 139 'GetApp' test.out

#- 140 UpdateApp
./ng net.accelbyte.sdk.cli.Main platform updateApp \
    --itemId 'lcmxyJ2x' \
    --namespace "$AB_NAMESPACE" \
    --storeId '6n4ypfME' \
    --body '{"carousel": [{"alt": "QzflKXWS", "previewUrl": "mEycQH04", "thumbnailUrl": "VzyAf9Hd", "type": "image", "url": "4UhjmMts", "videoSource": "vimeo"}, {"alt": "7wBvtu1Q", "previewUrl": "1I51zyVJ", "thumbnailUrl": "f0vPDam3", "type": "video", "url": "uFNR72sV", "videoSource": "vimeo"}, {"alt": "co0EBZrm", "previewUrl": "MABPb6cu", "thumbnailUrl": "4EKcIUSR", "type": "image", "url": "ZjFSmEhE", "videoSource": "youtube"}], "developer": "r6FaZABZ", "forumUrl": "F0eItK8E", "genres": ["Action", "Action", "Indie"], "localizations": {"XTLOpHrR": {"announcement": "f5a7pQkn", "slogan": "GsjdZxdw"}, "eh4MYUzd": {"announcement": "xksAP1qL", "slogan": "ORemN9qT"}, "qsg32hKW": {"announcement": "UGfYtfrx", "slogan": "HhgEIcKt"}}, "platformRequirements": {"gNNW6TDV": [{"additionals": "zz4sazWD", "directXVersion": "VrbjEw6E", "diskSpace": "AhnDlUqn", "graphics": "Djns0TkM", "label": "RpLDY7Tr", "osVersion": "diPxFzNV", "processor": "RN1clkRR", "ram": "oQuY8AkL", "soundCard": "M6OnqWVl"}, {"additionals": "EWrC2arF", "directXVersion": "0hPHWQuz", "diskSpace": "rtvVVJk1", "graphics": "u2fc1RVQ", "label": "B38rnkER", "osVersion": "dqRIBR20", "processor": "VWQ7E6tH", "ram": "egWOfihU", "soundCard": "mj2MO78V"}, {"additionals": "Es5vcwYB", "directXVersion": "jnO41yVF", "diskSpace": "4JGi2CcJ", "graphics": "JLVakEL2", "label": "0qnXyoNw", "osVersion": "X1elTS3L", "processor": "2IhFTBOk", "ram": "xRzwqk6p", "soundCard": "xqtthbwc"}], "PXBpkL4i": [{"additionals": "J2ZkoLoD", "directXVersion": "F4Zp5Db2", "diskSpace": "PXptuoA5", "graphics": "ZOIbyugy", "label": "JCCWpzlY", "osVersion": "97oPCuiG", "processor": "JspoJY6v", "ram": "Dl5MKOrg", "soundCard": "osanG8Se"}, {"additionals": "lxfjb21z", "directXVersion": "U3jme24s", "diskSpace": "2cYczqEx", "graphics": "vLyzB8N3", "label": "owAlFS5V", "osVersion": "sOUneDdq", "processor": "0Gk7v35U", "ram": "6rWPIoLD", "soundCard": "KfEU8Wfg"}, {"additionals": "49zJtXff", "directXVersion": "8ulcaq2i", "diskSpace": "IH0Plocf", "graphics": "mKd1IpFK", "label": "MOReBrdx", "osVersion": "E2s5Cm3Q", "processor": "QtXrgxzA", "ram": "5uiF6Lkf", "soundCard": "qFE9bWOm"}], "0xQE9p8R": [{"additionals": "6QatYvN0", "directXVersion": "q9UO6a0J", "diskSpace": "giU4YH0n", "graphics": "3DQpbTv3", "label": "knMNI34C", "osVersion": "8XANrDzQ", "processor": "u93xiBXs", "ram": "lZhIJT8O", "soundCard": "mvos8BmM"}, {"additionals": "qsMdP7Uz", "directXVersion": "EFs4JINk", "diskSpace": "1g37tMdq", "graphics": "q2tKnAIX", "label": "MllFAjZf", "osVersion": "FnKEwn2O", "processor": "jtbS8JGF", "ram": "uDZWo6oh", "soundCard": "XCwVDPDB"}, {"additionals": "5Cqjl1FU", "directXVersion": "D3xlAo2n", "diskSpace": "GOQRRcz8", "graphics": "GSz660vn", "label": "Fs0IXsVR", "osVersion": "uG0H9efK", "processor": "4sQI0CLI", "ram": "hMJAmXyn", "soundCard": "8fGlY5jJ"}]}, "platforms": ["Linux", "IOS", "Linux"], "players": ["LocalCoop", "MMO", "MMO"], "primaryGenre": "Simulation", "publisher": "YpnO5iM0", "releaseDate": "1977-11-16T00:00:00Z", "websiteUrl": "mJKa08Ux"}' \
    > test.out 2>&1
eval_tap $? 140 'UpdateApp' test.out

#- 141 DisableItem
./ng net.accelbyte.sdk.cli.Main platform disableItem \
    --itemId 'HfpCFgp0' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'cRbGk8aE' \
    --body '{"featuresToCheck": ["IAP", "ENTITLEMENT", "REWARD"]}' \
    > test.out 2>&1
eval_tap $? 141 'DisableItem' test.out

#- 142 GetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform getItemDynamicData \
    --itemId 'aown229N' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 142 'GetItemDynamicData' test.out

#- 143 EnableItem
./ng net.accelbyte.sdk.cli.Main platform enableItem \
    --itemId 'dd3YKkmb' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ntqDsUIM' \
    > test.out 2>&1
eval_tap $? 143 'EnableItem' test.out

#- 144 FeatureItem
./ng net.accelbyte.sdk.cli.Main platform featureItem \
    --feature 'pdrLNa1O' \
    --itemId 'raGqVo7v' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'OdN6Y8ov' \
    > test.out 2>&1
eval_tap $? 144 'FeatureItem' test.out

#- 145 DefeatureItem
./ng net.accelbyte.sdk.cli.Main platform defeatureItem \
    --feature 'mYdWQLA9' \
    --itemId 'Nxuddzim' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Wl0DqJ4j' \
    > test.out 2>&1
eval_tap $? 145 'DefeatureItem' test.out

#- 146 GetLocaleItem
./ng net.accelbyte.sdk.cli.Main platform getLocaleItem \
    --itemId '3rkWHkkg' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'zMifcqv6' \
    --populateBundle  \
    --region 'VTyLysIS' \
    --storeId 'NAEHdybr' \
    > test.out 2>&1
eval_tap $? 146 'GetLocaleItem' test.out

#- 147 UpdateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform updateItemPurchaseCondition \
    --itemId 'LFADuFZx' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'sgzDPW8s' \
    --body '{"purchaseCondition": {"conditionGroups": [{"operator": "and", "predicates": [{"anyOf": 30, "code": "p8k6uUE7", "comparison": "excludes", "name": "LflsSO9K", "predicateType": "StatisticCodePredicate", "value": "aQv6PYVT", "values": ["Pv6QriIo", "uDMVHnoL", "QElbfo2g"]}, {"anyOf": 14, "code": "sDruiSZ0", "comparison": "isLessThan", "name": "ydowBSzr", "predicateType": "SeasonTierPredicate", "value": "f6aACm7H", "values": ["VjG44L9k", "neuYc5PL", "XqKRqCJf"]}, {"anyOf": 98, "code": "bszkV7Vz", "comparison": "isGreaterThanOrEqual", "name": "SDUJGjKH", "predicateType": "StatisticCodePredicate", "value": "PL0ewKbx", "values": ["1U3fLMqp", "ZmIcvcCQ", "EfTD17G4"]}]}, {"operator": "and", "predicates": [{"anyOf": 48, "code": "U30UGAlT", "comparison": "includes", "name": "mAEZVhJN", "predicateType": "SeasonTierPredicate", "value": "3H3N9sPh", "values": ["xyOAlScw", "Ez6ltmxG", "dvTKfx6F"]}, {"anyOf": 87, "code": "PyMTBz3x", "comparison": "excludes", "name": "P0wd4f1Q", "predicateType": "SeasonTierPredicate", "value": "cVSeyVsb", "values": ["iqQ1tHyW", "7LPGFaus", "zvDrfbav"]}, {"anyOf": 63, "code": "C2fYBYTa", "comparison": "isLessThan", "name": "5f6OP3mn", "predicateType": "EntitlementPredicate", "value": "RQXCeyp8", "values": ["5H3Vrapn", "BA1z21u5", "8OIUaEeD"]}]}, {"operator": "or", "predicates": [{"anyOf": 17, "code": "SGafnp2H", "comparison": "includes", "name": "0QYwMUYy", "predicateType": "SeasonTierPredicate", "value": "aQPgJ6dR", "values": ["s0QEtO3F", "YUxtKOPQ", "o44yjJH9"]}, {"anyOf": 64, "code": "LO5Yr7wt", "comparison": "isLessThan", "name": "AFyEaNNS", "predicateType": "SeasonPassPredicate", "value": "nYTC2YmY", "values": ["vTVd8pIT", "7KtA1c2f", "YNo8tQVN"]}, {"anyOf": 30, "code": "pjs5gtOQ", "comparison": "isGreaterThanOrEqual", "name": "vRp5kV5I", "predicateType": "StatisticCodePredicate", "value": "KK8XR0w7", "values": ["FvDwCHtx", "NfHE3jqP", "Gq8EnveI"]}]}]}}' \
    > test.out 2>&1
eval_tap $? 147 'UpdateItemPurchaseCondition' test.out

#- 148 QueryItemReferences
./ng net.accelbyte.sdk.cli.Main platform queryItemReferences \
    --itemId 'JLRglFUg' \
    --namespace "$AB_NAMESPACE" \
    --featuresToCheck 'ENTITLEMENT,CATALOG,DLC' \
    --storeId 'y0Shk7wO' \
    > test.out 2>&1
eval_tap $? 148 'QueryItemReferences' test.out

#- 149 ReturnItem
./ng net.accelbyte.sdk.cli.Main platform returnItem \
    --itemId 'piA3ZZ6E' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "rtX5gJ7g"}' \
    > test.out 2>&1
eval_tap $? 149 'ReturnItem' test.out

#- 150 QueryKeyGroups
./ng net.accelbyte.sdk.cli.Main platform queryKeyGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '52' \
    --name 'VMxE6hqe' \
    --offset '21' \
    --tag 'M6DApqFZ' \
    > test.out 2>&1
eval_tap $? 150 'QueryKeyGroups' test.out

#- 151 CreateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform createKeyGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "xoFConKt", "name": "XjDWuMeY", "status": "ACTIVE", "tags": ["7FwYQDEu", "vxSw8W7w", "MPpSihjo"]}' \
    > test.out 2>&1
eval_tap $? 151 'CreateKeyGroup' test.out

#- 152 GetKeyGroupByBoothName
eval_tap 0 152 'GetKeyGroupByBoothName # SKIP deprecated' test.out

#- 153 GetKeyGroup
./ng net.accelbyte.sdk.cli.Main platform getKeyGroup \
    --keyGroupId '6utkW8gk' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 153 'GetKeyGroup' test.out

#- 154 UpdateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform updateKeyGroup \
    --keyGroupId 'OAlMN85m' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "kB8ZTi65", "name": "sa8z0p2X", "status": "ACTIVE", "tags": ["jjHknSvU", "mkQ09eNB", "WMsGCBy0"]}' \
    > test.out 2>&1
eval_tap $? 154 'UpdateKeyGroup' test.out

#- 155 GetKeyGroupDynamic
./ng net.accelbyte.sdk.cli.Main platform getKeyGroupDynamic \
    --keyGroupId 'ydgHTulP' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 155 'GetKeyGroupDynamic' test.out

#- 156 ListKeys
./ng net.accelbyte.sdk.cli.Main platform listKeys \
    --keyGroupId 'HlD6DnL6' \
    --namespace "$AB_NAMESPACE" \
    --limit '56' \
    --offset '6' \
    --status 'ACQUIRED' \
    > test.out 2>&1
eval_tap $? 156 'ListKeys' test.out

#- 157 UploadKeys
./ng net.accelbyte.sdk.cli.Main platform uploadKeys \
    --keyGroupId 'MdNTtTkU' \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 157 'UploadKeys' test.out

#- 158 QueryOrders
./ng net.accelbyte.sdk.cli.Main platform queryOrders \
    --namespace "$AB_NAMESPACE" \
    --endTime 'MVvSUUyi' \
    --limit '89' \
    --offset '11' \
    --orderNos 'AquZiz1R,wRbkh8pB,SLnkpfzG' \
    --sortBy 'BO86h3Fr' \
    --startTime '8KA4H06x' \
    --status 'CHARGEBACK' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 158 'QueryOrders' test.out

#- 159 GetOrderStatistics
./ng net.accelbyte.sdk.cli.Main platform getOrderStatistics \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 159 'GetOrderStatistics' test.out

#- 160 GetOrder
./ng net.accelbyte.sdk.cli.Main platform getOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'vUulE8qB' \
    > test.out 2>&1
eval_tap $? 160 'GetOrder' test.out

#- 161 RefundOrder
./ng net.accelbyte.sdk.cli.Main platform refundOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'Q4zswms6' \
    --body '{"description": "69kkMW0z"}' \
    > test.out 2>&1
eval_tap $? 161 'RefundOrder' test.out

#- 162 GetPaymentCallbackConfig
eval_tap 0 162 'GetPaymentCallbackConfig # SKIP deprecated' test.out

#- 163 UpdatePaymentCallbackConfig
eval_tap 0 163 'UpdatePaymentCallbackConfig # SKIP deprecated' test.out

#- 164 GetPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentMerchantConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 164 'GetPaymentMerchantConfig' test.out

#- 165 UpdatePaymentDomainWhitelistConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentDomainWhitelistConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"domains": ["Gx4Gj5vj", "D9dZuAGZ", "8fnt5J9i"]}' \
    > test.out 2>&1
eval_tap $? 165 'UpdatePaymentDomainWhitelistConfig' test.out

#- 166 QueryPaymentNotifications
./ng net.accelbyte.sdk.cli.Main platform queryPaymentNotifications \
    --namespace "$AB_NAMESPACE" \
    --endDate 'EZwCsrQg' \
    --externalId 'Fo3tQGgs' \
    --limit '89' \
    --notificationSource 'ADYEN' \
    --notificationType 'Q6KQt4Eb' \
    --offset '17' \
    --paymentOrderNo 'LE6uQ7c9' \
    --startDate 'pO8xmmic' \
    --status 'WARN' \
    > test.out 2>&1
eval_tap $? 166 'QueryPaymentNotifications' test.out

#- 167 QueryPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform queryPaymentOrders \
    --namespace "$AB_NAMESPACE" \
    --channel 'INTERNAL' \
    --extTxId '08i9JrZO' \
    --limit '76' \
    --offset '66' \
    --status 'REFUNDED' \
    > test.out 2>&1
eval_tap $? 167 'QueryPaymentOrders' test.out

#- 168 CreatePaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform createPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --body '{"currencyCode": "Y4NXY91M", "currencyNamespace": "tRTYjUw7", "customParameters": {"GrVXI3UA": {}, "waqGEdVI": {}, "qvfbQamr": {}}, "description": "Qs8TGF7z", "extOrderNo": "Ux9RkSrT", "extUserId": "fjo85YBd", "itemType": "SUBSCRIPTION", "language": "xpLb", "metadata": {"uuKefzMC": "Cpi8ZTV3", "xfhwOWmT": "u5xSCtxu", "3uVGy2o9": "lk3ZN5dx"}, "notifyUrl": "aebZzF2b", "omitNotification": false, "platform": "tlNWpAkG", "price": 65, "recurringPaymentOrderNo": "dQRmSdDi", "region": "H5TwLCE5", "returnUrl": "OZOd1ioO", "sandbox": true, "sku": "vIKPKUQU", "subscriptionId": "K4Jt3m9Y", "targetNamespace": "gj8kRY3k", "targetUserId": "UD9oIPgN", "title": "Bi4BNzLT"}' \
    > test.out 2>&1
eval_tap $? 168 'CreatePaymentOrderByDedicated' test.out

#- 169 ListExtOrderNoByExtTxId
./ng net.accelbyte.sdk.cli.Main platform listExtOrderNoByExtTxId \
    --namespace "$AB_NAMESPACE" \
    --extTxId 'smYlvAah' \
    > test.out 2>&1
eval_tap $? 169 'ListExtOrderNoByExtTxId' test.out

#- 170 GetPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'BC5RusRo' \
    > test.out 2>&1
eval_tap $? 170 'GetPaymentOrder' test.out

#- 171 ChargePaymentOrder
./ng net.accelbyte.sdk.cli.Main platform chargePaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'PdYmsKYF' \
    --body '{"extTxId": "pyVIquVB", "paymentMethod": "YkdrdgIv", "paymentProvider": "XSOLLA"}' \
    > test.out 2>&1
eval_tap $? 171 'ChargePaymentOrder' test.out

#- 172 RefundPaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform refundPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'j5MpP7iL' \
    --body '{"description": "lDdi7nOp"}' \
    > test.out 2>&1
eval_tap $? 172 'RefundPaymentOrderByDedicated' test.out

#- 173 SimulatePaymentOrderNotification
./ng net.accelbyte.sdk.cli.Main platform simulatePaymentOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'vJVR5Dqz' \
    --body '{"amount": 57, "currencyCode": "eSfwAuSN", "notifyType": "REFUND", "paymentProvider": "ADYEN", "salesTax": 7, "vat": 40}' \
    > test.out 2>&1
eval_tap $? 173 'SimulatePaymentOrderNotification' test.out

#- 174 GetPaymentOrderChargeStatus
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrderChargeStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'bGB3vjEE' \
    > test.out 2>&1
eval_tap $? 174 'GetPaymentOrderChargeStatus' test.out

#- 175 GetPsnEntitlementOwnership
./ng net.accelbyte.sdk.cli.Main platform getPsnEntitlementOwnership \
    --entitlementLabel 'iFzcIrxN' \
    --namespace "$AB_NAMESPACE" \
    --body '{"accessToken": "8UZCz3Pp", "serviceLabel": 90}' \
    > test.out 2>&1
eval_tap $? 175 'GetPsnEntitlementOwnership' test.out

#- 176 GetXboxEntitlementOwnership
./ng net.accelbyte.sdk.cli.Main platform getXboxEntitlementOwnership \
    --namespace "$AB_NAMESPACE" \
    --productSku 'YzQBwdx7' \
    --body '{"delegationToken": "LR4khouJ", "sandboxId": "58b3i6rO"}' \
    > test.out 2>&1
eval_tap $? 176 'GetXboxEntitlementOwnership' test.out

#- 177 GetPlatformEntitlementConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformEntitlementConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Steam' \
    > test.out 2>&1
eval_tap $? 177 'GetPlatformEntitlementConfig' test.out

#- 178 UpdatePlatformEntitlementConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformEntitlementConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Steam' \
    --body '{"allowedPlatformOrigins": ["Xbox", "System", "Epic"]}' \
    > test.out 2>&1
eval_tap $? 178 'UpdatePlatformEntitlementConfig' test.out

#- 179 GetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Oculus' \
    > test.out 2>&1
eval_tap $? 179 'GetPlatformWalletConfig' test.out

#- 180 UpdatePlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Nintendo' \
    --body '{"allowedBalanceOrigins": ["Steam", "Nintendo", "Other"]}' \
    > test.out 2>&1
eval_tap $? 180 'UpdatePlatformWalletConfig' test.out

#- 181 ResetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform resetPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Xbox' \
    > test.out 2>&1
eval_tap $? 181 'ResetPlatformWalletConfig' test.out

#- 182 GetRevocationConfig
./ng net.accelbyte.sdk.cli.Main platform getRevocationConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 182 'GetRevocationConfig' test.out

#- 183 UpdateRevocationConfig
./ng net.accelbyte.sdk.cli.Main platform updateRevocationConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"entitlement": {"consumable": {"enabled": false, "strategy": "REVOKE_OR_REPORT"}, "durable": {"enabled": true, "strategy": "REVOKE_OR_REPORT"}}, "wallet": {"enabled": true, "strategy": "REVOKE_OR_REPORT"}}' \
    > test.out 2>&1
eval_tap $? 183 'UpdateRevocationConfig' test.out

#- 184 DeleteRevocationConfig
./ng net.accelbyte.sdk.cli.Main platform deleteRevocationConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 184 'DeleteRevocationConfig' test.out

#- 185 QueryRevocationHistories
./ng net.accelbyte.sdk.cli.Main platform queryRevocationHistories \
    --namespace "$AB_NAMESPACE" \
    --endTime 'oCYjWfe9' \
    --limit '31' \
    --offset '13' \
    --source 'ORDER' \
    --startTime 'WNgZpCVR' \
    --status 'SUCCESS' \
    --transactionId 'YkQWTbVB' \
    --userId 'AmDNxi1h' \
    > test.out 2>&1
eval_tap $? 185 'QueryRevocationHistories' test.out

#- 186 GetRevocationPluginConfig
./ng net.accelbyte.sdk.cli.Main platform getRevocationPluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 186 'GetRevocationPluginConfig' test.out

#- 187 UpdateRevocationPluginConfig
./ng net.accelbyte.sdk.cli.Main platform updateRevocationPluginConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appConfig": {"appName": "6D0nhd69"}, "customConfig": {"connectionType": "INSECURE", "grpcServerAddress": "OdmjcziQ"}, "extendType": "APP"}' \
    > test.out 2>&1
eval_tap $? 187 'UpdateRevocationPluginConfig' test.out

#- 188 DeleteRevocationPluginConfig
./ng net.accelbyte.sdk.cli.Main platform deleteRevocationPluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 188 'DeleteRevocationPluginConfig' test.out

#- 189 UploadRevocationPluginConfigCert
./ng net.accelbyte.sdk.cli.Main platform uploadRevocationPluginConfigCert \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 189 'UploadRevocationPluginConfigCert' test.out

#- 190 CreateReward
./ng net.accelbyte.sdk.cli.Main platform createReward \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "PuPFC8Mo", "eventTopic": "Ysffkg8U", "maxAwarded": 49, "maxAwardedPerUser": 99, "namespaceExpression": "6Y7lNMcg", "rewardCode": "rqXZfoBx", "rewardConditions": [{"condition": "LCqFiVvk", "conditionName": "2Jmopvgt", "eventName": "CxPzWoLO", "rewardItems": [{"duration": 80, "endDate": "1984-11-13T00:00:00Z", "identityType": "ITEM_ID", "itemId": "T2GyPBw3", "quantity": 1, "sku": "J2P0Ke9E"}, {"duration": 60, "endDate": "1992-04-04T00:00:00Z", "identityType": "ITEM_ID", "itemId": "IH8fvlxR", "quantity": 3, "sku": "y89RzO06"}, {"duration": 80, "endDate": "1990-03-28T00:00:00Z", "identityType": "ITEM_ID", "itemId": "VQQ3uwGm", "quantity": 1, "sku": "pxAFz0hH"}]}, {"condition": "HiyHgPGs", "conditionName": "MIpRO58I", "eventName": "mLq3cObg", "rewardItems": [{"duration": 72, "endDate": "1976-06-12T00:00:00Z", "identityType": "ITEM_ID", "itemId": "T5FyLff8", "quantity": 74, "sku": "piDRtHUm"}, {"duration": 30, "endDate": "1990-10-18T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "oCPbu7BP", "quantity": 88, "sku": "7aNwNZVA"}, {"duration": 22, "endDate": "1996-06-15T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "7ROJRQw9", "quantity": 61, "sku": "qehHVY5I"}]}, {"condition": "pVUnAKU3", "conditionName": "hNNNESjo", "eventName": "3t9xfVGf", "rewardItems": [{"duration": 25, "endDate": "1984-10-03T00:00:00Z", "identityType": "ITEM_ID", "itemId": "unLBdcqd", "quantity": 84, "sku": "sFU99ijm"}, {"duration": 47, "endDate": "1995-07-27T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "19o1CZwT", "quantity": 48, "sku": "tJn8xlXG"}, {"duration": 44, "endDate": "1998-01-11T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "ZOUWFqrE", "quantity": 10, "sku": "OVVHGS7S"}]}], "userIdExpression": "EjNtAgsg"}' \
    > test.out 2>&1
eval_tap $? 190 'CreateReward' test.out

#- 191 QueryRewards
./ng net.accelbyte.sdk.cli.Main platform queryRewards \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'oURjVRyq' \
    --limit '84' \
    --offset '45' \
    --sortBy 'namespace:asc,rewardCode,namespace:desc' \
    > test.out 2>&1
eval_tap $? 191 'QueryRewards' test.out

#- 192 ExportRewards
./ng net.accelbyte.sdk.cli.Main platform exportRewards \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 192 'ExportRewards' test.out

#- 193 ImportRewards
./ng net.accelbyte.sdk.cli.Main platform importRewards \
    --namespace "$AB_NAMESPACE" \
    --replaceExisting  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 193 'ImportRewards' test.out

#- 194 GetReward
./ng net.accelbyte.sdk.cli.Main platform getReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'B6CulwLn' \
    > test.out 2>&1
eval_tap $? 194 'GetReward' test.out

#- 195 UpdateReward
./ng net.accelbyte.sdk.cli.Main platform updateReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId '2TQmrMp0' \
    --body '{"description": "fuHiaDE3", "eventTopic": "S1RmQois", "maxAwarded": 54, "maxAwardedPerUser": 41, "namespaceExpression": "J6QXu64b", "rewardCode": "oXNs0m8K", "rewardConditions": [{"condition": "6QFsdOsF", "conditionName": "kAmz3CYX", "eventName": "SwLPNGf6", "rewardItems": [{"duration": 55, "endDate": "1975-07-15T00:00:00Z", "identityType": "ITEM_ID", "itemId": "DPM8bAlq", "quantity": 94, "sku": "SzNCLLlf"}, {"duration": 7, "endDate": "1982-04-12T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "av8iqg93", "quantity": 3, "sku": "JR9CxRaf"}, {"duration": 95, "endDate": "1983-03-09T00:00:00Z", "identityType": "ITEM_ID", "itemId": "GRX1gTy6", "quantity": 66, "sku": "g6nfdqec"}]}, {"condition": "YUUMjxhh", "conditionName": "rkwAFWR3", "eventName": "btsN4xSk", "rewardItems": [{"duration": 34, "endDate": "1999-09-29T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "aEdDZUOh", "quantity": 59, "sku": "iHV2erG2"}, {"duration": 2, "endDate": "1978-07-29T00:00:00Z", "identityType": "ITEM_ID", "itemId": "NEo6G6Mn", "quantity": 65, "sku": "az79iIov"}, {"duration": 41, "endDate": "1972-03-24T00:00:00Z", "identityType": "ITEM_ID", "itemId": "Loof9tCB", "quantity": 65, "sku": "TVFWPNaW"}]}, {"condition": "rWP7qlek", "conditionName": "OCxy5mlJ", "eventName": "345kCT3q", "rewardItems": [{"duration": 18, "endDate": "1994-10-26T00:00:00Z", "identityType": "ITEM_ID", "itemId": "br0khh1t", "quantity": 40, "sku": "dG5175me"}, {"duration": 41, "endDate": "1988-07-13T00:00:00Z", "identityType": "ITEM_ID", "itemId": "VbhF3MK6", "quantity": 17, "sku": "LRm7MIn2"}, {"duration": 99, "endDate": "1988-11-03T00:00:00Z", "identityType": "ITEM_ID", "itemId": "x2Ot8wj8", "quantity": 15, "sku": "Iwge4el3"}]}], "userIdExpression": "cvV0W7RC"}' \
    > test.out 2>&1
eval_tap $? 195 'UpdateReward' test.out

#- 196 DeleteReward
./ng net.accelbyte.sdk.cli.Main platform deleteReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'fCQm9gJN' \
    > test.out 2>&1
eval_tap $? 196 'DeleteReward' test.out

#- 197 CheckEventCondition
./ng net.accelbyte.sdk.cli.Main platform checkEventCondition \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'PJs0kTmv' \
    --body '{"payload": {"4azOrPIW": {}, "GkV9CBwP": {}, "OHh38xA1": {}}}' \
    > test.out 2>&1
eval_tap $? 197 'CheckEventCondition' test.out

#- 198 DeleteRewardConditionRecord
./ng net.accelbyte.sdk.cli.Main platform deleteRewardConditionRecord \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'ytNKYSJw' \
    --body '{"conditionName": "T3wAFAB0", "userId": "ZyqXfXAL"}' \
    > test.out 2>&1
eval_tap $? 198 'DeleteRewardConditionRecord' test.out

#- 199 QuerySections
./ng net.accelbyte.sdk.cli.Main platform querySections \
    --namespace "$AB_NAMESPACE" \
    --end 'avNWWWdY' \
    --limit '29' \
    --offset '36' \
    --start '021fxqKO' \
    --storeId 'JYEKkaYX' \
    --viewId 'CdNJEwLb' \
    > test.out 2>&1
eval_tap $? 199 'QuerySections' test.out

#- 200 CreateSection
./ng net.accelbyte.sdk.cli.Main platform createSection \
    --namespace "$AB_NAMESPACE" \
    --storeId 'PndvVStB' \
    --body '{"active": false, "displayOrder": 59, "endDate": "1991-01-31T00:00:00Z", "ext": {"453M4nNw": {}, "1og1VrrZ": {}, "nAbJmL8U": {}}, "fixedPeriodRotationConfig": {"backfillType": "NONE", "duration": 76, "itemCount": 86, "rule": "SEQUENCE"}, "items": [{"id": "NCl1JyVZ", "sku": "klh8yh7z"}, {"id": "orTuIOGb", "sku": "qyQkPG3y"}, {"id": "BGdHQbG2", "sku": "tBBiZQY8"}], "localizations": {"BZ9Ywtff": {"description": "Ivgevwzx", "localExt": {"XiXOn4Mn": {}, "Da9TrlYs": {}, "ZPVRDYtA": {}}, "longDescription": "6dJBE7ON", "title": "RedmlgGa"}, "nRsmaGwC": {"description": "ESvBOBvm", "localExt": {"fTIYQ1JX": {}, "NxkhmyCw": {}, "IAHjtlMw": {}}, "longDescription": "RaKhmM11", "title": "Emu8mFhF"}, "GTGq7aKf": {"description": "jnIxskB8", "localExt": {"naRBtYUw": {}, "aXgZZCBG": {}, "iRpCzOWX": {}}, "longDescription": "yEgho5Zm", "title": "WG7wIArV"}}, "name": "lpLB2jGR", "rotationType": "CUSTOM", "startDate": "1999-08-14T00:00:00Z", "viewId": "qnRhGduk"}' \
    > test.out 2>&1
eval_tap $? 200 'CreateSection' test.out

#- 201 PurgeExpiredSection
./ng net.accelbyte.sdk.cli.Main platform purgeExpiredSection \
    --namespace "$AB_NAMESPACE" \
    --storeId 'oo1d8Gbr' \
    > test.out 2>&1
eval_tap $? 201 'PurgeExpiredSection' test.out

#- 202 GetSection
./ng net.accelbyte.sdk.cli.Main platform getSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'xz9UE38F' \
    --storeId 'CeeRaBFh' \
    > test.out 2>&1
eval_tap $? 202 'GetSection' test.out

#- 203 UpdateSection
./ng net.accelbyte.sdk.cli.Main platform updateSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'mVkCZzCL' \
    --storeId 'PewXgDUE' \
    --body '{"active": false, "displayOrder": 75, "endDate": "1983-12-26T00:00:00Z", "ext": {"xgwLFwCw": {}, "SSYFTZ56": {}, "uA87ZZVn": {}}, "fixedPeriodRotationConfig": {"backfillType": "CUSTOM", "duration": 0, "itemCount": 58, "rule": "SEQUENCE"}, "items": [{"id": "92kj4sSt", "sku": "kEu6YHRv"}, {"id": "k5q9HRJX", "sku": "y15sZBNR"}, {"id": "U8VOzBqZ", "sku": "xrQpjmTL"}], "localizations": {"iyaK7tES": {"description": "FCKttEVh", "localExt": {"BcTD7hHV": {}, "JxswPGmK": {}, "KgpUwGNd": {}}, "longDescription": "CuFVM02o", "title": "8KJuh69E"}, "t3J4tdiJ": {"description": "mEofrpzA", "localExt": {"15xRd7WO": {}, "5xAerJuI": {}, "ZVArp8tF": {}}, "longDescription": "SRuVa3sr", "title": "ZNQTPvSq"}, "FiUgexEL": {"description": "hA0BiGO0", "localExt": {"JkZvjEHq": {}, "kAQuA0IT": {}, "9u6Wd8ZZ": {}}, "longDescription": "uOVosHgg", "title": "BvJeuf07"}}, "name": "gEr0Sd9K", "rotationType": "FIXED_PERIOD", "startDate": "1996-11-13T00:00:00Z", "viewId": "WK00Wlm1"}' \
    > test.out 2>&1
eval_tap $? 203 'UpdateSection' test.out

#- 204 DeleteSection
./ng net.accelbyte.sdk.cli.Main platform deleteSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'AU1Y4X0b' \
    --storeId 'hSAvR7Eu' \
    > test.out 2>&1
eval_tap $? 204 'DeleteSection' test.out

#- 205 ListStores
./ng net.accelbyte.sdk.cli.Main platform listStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 205 'ListStores' test.out

#- 206 CreateStore
./ng net.accelbyte.sdk.cli.Main platform createStore \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultLanguage": "f2mM8w86", "defaultRegion": "8iHk6VA8", "description": "qI1uwMd7", "supportedLanguages": ["XCyC8vOC", "wbiUZ008", "Ht5bZ1iS"], "supportedRegions": ["gGKlGdx1", "IMfJBH2F", "1vDJwCTC"], "title": "5YEH91d8"}' \
    > test.out 2>&1
eval_tap $? 206 'CreateStore' test.out

#- 207 GetCatalogDefinition
./ng net.accelbyte.sdk.cli.Main platform getCatalogDefinition \
    --namespace "$AB_NAMESPACE" \
    --catalogType 'CATEGORY' \
    > test.out 2>&1
eval_tap $? 207 'GetCatalogDefinition' test.out

#- 208 DownloadCSVTemplates
./ng net.accelbyte.sdk.cli.Main platform downloadCSVTemplates \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 208 'DownloadCSVTemplates' test.out

#- 209 ExportStoreByCSV
./ng net.accelbyte.sdk.cli.Main platform exportStoreByCSV \
    --namespace "$AB_NAMESPACE" \
    --body '{"catalogType": "APP", "fieldsToBeIncluded": ["gfTrfAJM", "8WE9rbOr", "xfGUW30C"], "idsToBeExported": ["pM1z5oYJ", "9Uba1Vvy", "zAK2xP7E"], "storeId": "tdvyPzs5"}' \
    > test.out 2>&1
eval_tap $? 209 'ExportStoreByCSV' test.out

#- 210 ImportStore
eval_tap 0 210 'ImportStore # SKIP deprecated' test.out

#- 211 GetPublishedStore
./ng net.accelbyte.sdk.cli.Main platform getPublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 211 'GetPublishedStore' test.out

#- 212 DeletePublishedStore
./ng net.accelbyte.sdk.cli.Main platform deletePublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 212 'DeletePublishedStore' test.out

#- 213 GetPublishedStoreBackup
./ng net.accelbyte.sdk.cli.Main platform getPublishedStoreBackup \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 213 'GetPublishedStoreBackup' test.out

#- 214 RollbackPublishedStore
./ng net.accelbyte.sdk.cli.Main platform rollbackPublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 214 'RollbackPublishedStore' test.out

#- 215 GetStore
./ng net.accelbyte.sdk.cli.Main platform getStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'rCFiQxQC' \
    > test.out 2>&1
eval_tap $? 215 'GetStore' test.out

#- 216 UpdateStore
./ng net.accelbyte.sdk.cli.Main platform updateStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'F9eKU082' \
    --body '{"defaultLanguage": "Ljz4uL1K", "defaultRegion": "66E4LtUK", "description": "XdLmw9K4", "supportedLanguages": ["qo2ypm1E", "3aWtvKun", "NHyW5Vkq"], "supportedRegions": ["xN1usEMk", "KLTLbja2", "zvB65Cpo"], "title": "wl2KIVjg"}' \
    > test.out 2>&1
eval_tap $? 216 'UpdateStore' test.out

#- 217 DeleteStore
./ng net.accelbyte.sdk.cli.Main platform deleteStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'EKUlRiPl' \
    > test.out 2>&1
eval_tap $? 217 'DeleteStore' test.out

#- 218 QueryChanges
./ng net.accelbyte.sdk.cli.Main platform queryChanges \
    --namespace "$AB_NAMESPACE" \
    --storeId 'm4hz54ei' \
    --action 'DELETE' \
    --itemSku 'QgmTu4Ud' \
    --itemType 'OPTIONBOX' \
    --limit '27' \
    --offset '48' \
    --selected  \
    --sortBy 'updatedAt:desc,updatedAt:asc,createdAt:desc' \
    --status 'UNPUBLISHED' \
    --type 'VIEW' \
    --updatedAtEnd 'Ro7vNKAf' \
    --updatedAtStart 'mkkt0Xvw' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 218 'QueryChanges' test.out

#- 219 PublishAll
./ng net.accelbyte.sdk.cli.Main platform publishAll \
    --namespace "$AB_NAMESPACE" \
    --storeId 'jV5qIGfA' \
    > test.out 2>&1
eval_tap $? 219 'PublishAll' test.out

#- 220 PublishSelected
./ng net.accelbyte.sdk.cli.Main platform publishSelected \
    --namespace "$AB_NAMESPACE" \
    --storeId '1miC7fz0' \
    > test.out 2>&1
eval_tap $? 220 'PublishSelected' test.out

#- 221 SelectAllRecords
./ng net.accelbyte.sdk.cli.Main platform selectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'cy7gi3GO' \
    > test.out 2>&1
eval_tap $? 221 'SelectAllRecords' test.out

#- 222 SelectAllRecordsByCriteria
./ng net.accelbyte.sdk.cli.Main platform selectAllRecordsByCriteria \
    --namespace "$AB_NAMESPACE" \
    --storeId 'j9J4fnx7' \
    --action 'CREATE' \
    --itemSku 'yBcCISA5' \
    --itemType 'OPTIONBOX' \
    --selected  \
    --type 'CATEGORY' \
    --updatedAtEnd '3rPZ9F3X' \
    --updatedAtStart 'vNlLXIDQ' \
    > test.out 2>&1
eval_tap $? 222 'SelectAllRecordsByCriteria' test.out

#- 223 GetStatistic
./ng net.accelbyte.sdk.cli.Main platform getStatistic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'lqQOW7ZL' \
    --action 'UPDATE' \
    --itemSku 'HIEzEv84' \
    --itemType 'INGAMEITEM' \
    --type 'CATEGORY' \
    --updatedAtEnd 'JbdejmLY' \
    --updatedAtStart 'ItqQV8iH' \
    > test.out 2>&1
eval_tap $? 223 'GetStatistic' test.out

#- 224 UnselectAllRecords
./ng net.accelbyte.sdk.cli.Main platform unselectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'JlIfnZWA' \
    > test.out 2>&1
eval_tap $? 224 'UnselectAllRecords' test.out

#- 225 SelectRecord
./ng net.accelbyte.sdk.cli.Main platform selectRecord \
    --changeId 'WBkoX319' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'LKbduK8F' \
    > test.out 2>&1
eval_tap $? 225 'SelectRecord' test.out

#- 226 UnselectRecord
./ng net.accelbyte.sdk.cli.Main platform unselectRecord \
    --changeId 'YeD5ipBs' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'KtxbmlJJ' \
    > test.out 2>&1
eval_tap $? 226 'UnselectRecord' test.out

#- 227 CloneStore
./ng net.accelbyte.sdk.cli.Main platform cloneStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'XKvmkXAK' \
    --targetStoreId 'AzLB25iH' \
    > test.out 2>&1
eval_tap $? 227 'CloneStore' test.out

#- 228 ExportStore
eval_tap 0 228 'ExportStore # SKIP deprecated' test.out

#- 229 QueryImportHistory
./ng net.accelbyte.sdk.cli.Main platform queryImportHistory \
    --namespace "$AB_NAMESPACE" \
    --storeId 'TqEthQl5' \
    --end 'KqOOyXx0' \
    --limit '100' \
    --offset '50' \
    --sortBy 'xNSK8uyx' \
    --start '7xa62M1d' \
    --success  \
    > test.out 2>&1
eval_tap $? 229 'QueryImportHistory' test.out

#- 230 ImportStoreByCSV
./ng net.accelbyte.sdk.cli.Main platform importStoreByCSV \
    --namespace "$AB_NAMESPACE" \
    --storeId 'X7hkjT64' \
    --category 'tmp.dat' \
    --display 'tmp.dat' \
    --item 'tmp.dat' \
    --notes 'k4DNgsYg' \
    --section 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 230 'ImportStoreByCSV' test.out

#- 231 QuerySubscriptions
./ng net.accelbyte.sdk.cli.Main platform querySubscriptions \
    --namespace "$AB_NAMESPACE" \
    --chargeStatus 'RECURRING_CHARGING' \
    --itemId 'ukdk9Q07' \
    --limit '6' \
    --offset '71' \
    --sku 'o8pcylMm' \
    --status 'INIT' \
    --subscribedBy 'PLATFORM' \
    --userId 'ib0i0ohj' \
    > test.out 2>&1
eval_tap $? 231 'QuerySubscriptions' test.out

#- 232 RecurringChargeSubscription
./ng net.accelbyte.sdk.cli.Main platform recurringChargeSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'doPQzcnB' \
    > test.out 2>&1
eval_tap $? 232 'RecurringChargeSubscription' test.out

#- 233 GetTicketDynamic
./ng net.accelbyte.sdk.cli.Main platform getTicketDynamic \
    --boothName 'jnSU4szh' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 233 'GetTicketDynamic' test.out

#- 234 DecreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform decreaseTicketSale \
    --boothName 'RL1OyhGH' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "qbXwVAlD"}' \
    > test.out 2>&1
eval_tap $? 234 'DecreaseTicketSale' test.out

#- 235 GetTicketBoothID
./ng net.accelbyte.sdk.cli.Main platform getTicketBoothID \
    --boothName '0BIoxPyJ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 235 'GetTicketBoothID' test.out

#- 236 IncreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform increaseTicketSale \
    --boothName 'sIp3dvgp' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 12, "orderNo": "zvvf2esd"}' \
    > test.out 2>&1
eval_tap $? 236 'IncreaseTicketSale' test.out

#- 237 Commit
./ng net.accelbyte.sdk.cli.Main platform commit \
    --namespace "$AB_NAMESPACE" \
    --body '{"actions": [{"operations": [{"creditPayload": {"balanceOrigin": "Playstation", "count": 26, "currencyCode": "xXXa6ErS", "expireAt": "1985-02-19T00:00:00Z"}, "debitPayload": {"count": 66, "currencyCode": "qAV1u0cK", "walletPlatform": "Xbox"}, "fulFillItemPayload": {"count": 73, "entitlementCollectionId": "baeGlbUN", "entitlementOrigin": "Epic", "itemIdentity": "djx0yuv5", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 92, "entitlementId": "omHI6oAy"}, "type": "REVOKE_ENTITLEMENT"}, {"creditPayload": {"balanceOrigin": "IOS", "count": 49, "currencyCode": "nBCcTOKC", "expireAt": "1978-08-09T00:00:00Z"}, "debitPayload": {"count": 64, "currencyCode": "X5qVpEw6", "walletPlatform": "Xbox"}, "fulFillItemPayload": {"count": 71, "entitlementCollectionId": "vSOs38Gh", "entitlementOrigin": "Xbox", "itemIdentity": "TNMoBC6x", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 96, "entitlementId": "gmhLdeQF"}, "type": "FULFILL_ITEM"}, {"creditPayload": {"balanceOrigin": "Nintendo", "count": 85, "currencyCode": "M4A6gexb", "expireAt": "1991-02-24T00:00:00Z"}, "debitPayload": {"count": 24, "currencyCode": "BQAwkmSo", "walletPlatform": "Epic"}, "fulFillItemPayload": {"count": 28, "entitlementCollectionId": "yW3IBQdk", "entitlementOrigin": "Playstation", "itemIdentity": "YNoe6lPj", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 12, "entitlementId": "KpftpW9s"}, "type": "REVOKE_ENTITLEMENT"}], "userId": "89xmW4b7"}, {"operations": [{"creditPayload": {"balanceOrigin": "Nintendo", "count": 26, "currencyCode": "HCItzIrm", "expireAt": "1992-02-19T00:00:00Z"}, "debitPayload": {"count": 53, "currencyCode": "VhwlKeJM", "walletPlatform": "GooglePlay"}, "fulFillItemPayload": {"count": 66, "entitlementCollectionId": "GfRPEakG", "entitlementOrigin": "Nintendo", "itemIdentity": "dmbyIHmg", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 57, "entitlementId": "vISnVkBn"}, "type": "FULFILL_ITEM"}, {"creditPayload": {"balanceOrigin": "Twitch", "count": 99, "currencyCode": "Bj8il9si", "expireAt": "1988-07-31T00:00:00Z"}, "debitPayload": {"count": 5, "currencyCode": "WPIRmm3a", "walletPlatform": "Steam"}, "fulFillItemPayload": {"count": 83, "entitlementCollectionId": "HuQ1Vwfs", "entitlementOrigin": "Other", "itemIdentity": "ts3CQMj8", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 2, "entitlementId": "jWD2m0mI"}, "type": "FULFILL_ITEM"}, {"creditPayload": {"balanceOrigin": "Nintendo", "count": 38, "currencyCode": "DN1NTM6t", "expireAt": "1973-11-25T00:00:00Z"}, "debitPayload": {"count": 1, "currencyCode": "7Cobmj4B", "walletPlatform": "GooglePlay"}, "fulFillItemPayload": {"count": 61, "entitlementCollectionId": "c9V3MBEQ", "entitlementOrigin": "Playstation", "itemIdentity": "LP8lfA1Q", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 18, "entitlementId": "6P7UZLLW"}, "type": "REVOKE_ENTITLEMENT"}], "userId": "VYivovRB"}, {"operations": [{"creditPayload": {"balanceOrigin": "Nintendo", "count": 2, "currencyCode": "wB69ulYb", "expireAt": "1982-09-14T00:00:00Z"}, "debitPayload": {"count": 42, "currencyCode": "lNp3TvkU", "walletPlatform": "Epic"}, "fulFillItemPayload": {"count": 65, "entitlementCollectionId": "NpsnbPrm", "entitlementOrigin": "Twitch", "itemIdentity": "ErkHUAXT", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 6, "entitlementId": "5cZ8Yz44"}, "type": "CREDIT_WALLET"}, {"creditPayload": {"balanceOrigin": "Xbox", "count": 14, "currencyCode": "5cSyqSVl", "expireAt": "1983-06-16T00:00:00Z"}, "debitPayload": {"count": 85, "currencyCode": "BYBdWKM2", "walletPlatform": "Oculus"}, "fulFillItemPayload": {"count": 77, "entitlementCollectionId": "rhXJa7Th", "entitlementOrigin": "GooglePlay", "itemIdentity": "FL9H1KMY", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 93, "entitlementId": "u6WCWs6k"}, "type": "CREDIT_WALLET"}, {"creditPayload": {"balanceOrigin": "Twitch", "count": 71, "currencyCode": "kDQQKGR3", "expireAt": "1976-11-24T00:00:00Z"}, "debitPayload": {"count": 49, "currencyCode": "9SnysMHC", "walletPlatform": "IOS"}, "fulFillItemPayload": {"count": 84, "entitlementCollectionId": "iXWzKHLD", "entitlementOrigin": "GooglePlay", "itemIdentity": "LPm35BMc", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 28, "entitlementId": "pkSTrj45"}, "type": "FULFILL_ITEM"}], "userId": "GxegUvmp"}], "metadata": {"yOw1eEIH": {}, "EUocOedV": {}, "P7yMpvzG": {}}, "needPreCheck": false, "transactionId": "O9OOSEac", "type": "Qd1yY7SQ"}' \
    > test.out 2>&1
eval_tap $? 237 'Commit' test.out

#- 238 GetTradeHistoryByCriteria
./ng net.accelbyte.sdk.cli.Main platform getTradeHistoryByCriteria \
    --namespace "$AB_NAMESPACE" \
    --limit '6' \
    --offset '97' \
    --status 'SUCCESS' \
    --type 'dslf0rv2' \
    --userId 'KcV2Y9Wr' \
    > test.out 2>&1
eval_tap $? 238 'GetTradeHistoryByCriteria' test.out

#- 239 GetTradeHistoryByTransactionId
./ng net.accelbyte.sdk.cli.Main platform getTradeHistoryByTransactionId \
    --namespace "$AB_NAMESPACE" \
    --transactionId 'lZp7aZiq' \
    > test.out 2>&1
eval_tap $? 239 'GetTradeHistoryByTransactionId' test.out

#- 240 UnlockSteamUserAchievement
./ng net.accelbyte.sdk.cli.Main platform unlockSteamUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'YM0virO7' \
    --body '{"achievements": [{"id": "SNHPfHHI", "value": 61}, {"id": "zCFlF7sl", "value": 40}, {"id": "s45ZmvlH", "value": 44}], "steamUserId": "wZwoSogF"}' \
    > test.out 2>&1
eval_tap $? 240 'UnlockSteamUserAchievement' test.out

#- 241 GetXblUserAchievements
./ng net.accelbyte.sdk.cli.Main platform getXblUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'CjwUxegI' \
    --xboxUserId 'j5VLjQuk' \
    > test.out 2>&1
eval_tap $? 241 'GetXblUserAchievements' test.out

#- 242 UpdateXblUserAchievement
./ng net.accelbyte.sdk.cli.Main platform updateXblUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'Wdr9zJXX' \
    --body '{"achievements": [{"id": "SwBJ9Mgr", "percentComplete": 87}, {"id": "RENLmmz0", "percentComplete": 100}, {"id": "gTpa4nhV", "percentComplete": 51}], "serviceConfigId": "1FlcIlJl", "titleId": "7KZ5geFQ", "xboxUserId": "pEsZmcCE"}' \
    > test.out 2>&1
eval_tap $? 242 'UpdateXblUserAchievement' test.out

#- 243 AnonymizeCampaign
./ng net.accelbyte.sdk.cli.Main platform anonymizeCampaign \
    --namespace "$AB_NAMESPACE" \
    --userId '0o8s8TjT' \
    > test.out 2>&1
eval_tap $? 243 'AnonymizeCampaign' test.out

#- 244 AnonymizeEntitlement
./ng net.accelbyte.sdk.cli.Main platform anonymizeEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'u0VJTjiG' \
    > test.out 2>&1
eval_tap $? 244 'AnonymizeEntitlement' test.out

#- 245 AnonymizeFulfillment
./ng net.accelbyte.sdk.cli.Main platform anonymizeFulfillment \
    --namespace "$AB_NAMESPACE" \
    --userId 'Pgrd3TGX' \
    > test.out 2>&1
eval_tap $? 245 'AnonymizeFulfillment' test.out

#- 246 AnonymizeIntegration
./ng net.accelbyte.sdk.cli.Main platform anonymizeIntegration \
    --namespace "$AB_NAMESPACE" \
    --userId 'bphEOeP6' \
    > test.out 2>&1
eval_tap $? 246 'AnonymizeIntegration' test.out

#- 247 AnonymizeOrder
./ng net.accelbyte.sdk.cli.Main platform anonymizeOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'MRMKNIiE' \
    > test.out 2>&1
eval_tap $? 247 'AnonymizeOrder' test.out

#- 248 AnonymizePayment
./ng net.accelbyte.sdk.cli.Main platform anonymizePayment \
    --namespace "$AB_NAMESPACE" \
    --userId 'm4Hb3mdL' \
    > test.out 2>&1
eval_tap $? 248 'AnonymizePayment' test.out

#- 249 AnonymizeRevocation
./ng net.accelbyte.sdk.cli.Main platform anonymizeRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId 'ehQVpPnD' \
    > test.out 2>&1
eval_tap $? 249 'AnonymizeRevocation' test.out

#- 250 AnonymizeSubscription
./ng net.accelbyte.sdk.cli.Main platform anonymizeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'c83RrUhB' \
    > test.out 2>&1
eval_tap $? 250 'AnonymizeSubscription' test.out

#- 251 AnonymizeWallet
./ng net.accelbyte.sdk.cli.Main platform anonymizeWallet \
    --namespace "$AB_NAMESPACE" \
    --userId 'extQE7BV' \
    > test.out 2>&1
eval_tap $? 251 'AnonymizeWallet' test.out

#- 252 GetUserDLCByPlatform
./ng net.accelbyte.sdk.cli.Main platform getUserDLCByPlatform \
    --namespace "$AB_NAMESPACE" \
    --userId 'lytRdAHS' \
    --type 'EPICGAMES' \
    > test.out 2>&1
eval_tap $? 252 'GetUserDLCByPlatform' test.out

#- 253 GetUserDLC
./ng net.accelbyte.sdk.cli.Main platform getUserDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'GSaNja2F' \
    --includeAllNamespaces  \
    --status 'REVOKE_FAILED' \
    --type 'STEAM' \
    > test.out 2>&1
eval_tap $? 253 'GetUserDLC' test.out

#- 254 QueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'owmRRS3a' \
    --activeOnly  \
    --appType 'DEMO' \
    --collectionId 'yj2zzdgS' \
    --entitlementClazz 'ENTITLEMENT' \
    --entitlementName 'Pbhm3K9D' \
    --features 'r1JpwQmx,WEGlEO0z,Fs5T1P0N' \
    --fuzzyMatchName  \
    --ignoreActiveDate  \
    --itemId 'aK1XnTE6,o1syomly,YoU0Yqeu' \
    --limit '13' \
    --offset '16' \
    --origin 'GooglePlay' \
    > test.out 2>&1
eval_tap $? 254 'QueryUserEntitlements' test.out

#- 255 GrantUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform grantUserEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'w5BNWZLc' \
    --body '[{"collectionId": "KoOZpwKu", "endDate": "1982-11-19T00:00:00Z", "grantedCode": "cTfWgB95", "itemId": "815s3pUR", "itemNamespace": "MaMQO4fv", "language": "aLf-xVrW-bd", "metadata": {"RhbvtILX": {}, "wCf06TSB": {}, "W5hajbge": {}}, "origin": "Epic", "quantity": 76, "region": "YlZVOJvq", "source": "PROMOTION", "startDate": "1974-01-05T00:00:00Z", "storeId": "ukRaFogz"}, {"collectionId": "JxSHCin8", "endDate": "1985-03-06T00:00:00Z", "grantedCode": "rpnYdVcl", "itemId": "rob4hpCF", "itemNamespace": "Ue0tcUxr", "language": "ZSe", "metadata": {"Fgp9HlzZ": {}, "2JsO7RxV": {}, "plgKD4IA": {}}, "origin": "Steam", "quantity": 42, "region": "0WGHvv3D", "source": "ACHIEVEMENT", "startDate": "1997-11-27T00:00:00Z", "storeId": "6hNt3qnx"}, {"collectionId": "WYE7LAqV", "endDate": "1972-01-26T00:00:00Z", "grantedCode": "GnS0IxjL", "itemId": "6lxUfewG", "itemNamespace": "dNVC6NNb", "language": "Lo_WZpV_Et", "metadata": {"r6nWbC21": {}, "dGDpydEu": {}, "NbAAXVkV": {}}, "origin": "GooglePlay", "quantity": 58, "region": "krrk8hvB", "source": "PURCHASE", "startDate": "1982-08-10T00:00:00Z", "storeId": "7pPPihsw"}]' \
    > test.out 2>&1
eval_tap $? 255 'GrantUserEntitlement' test.out

#- 256 GetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZXC4ZGtn' \
    --activeOnly  \
    --appId 'AX0kBRaX' \
    > test.out 2>&1
eval_tap $? 256 'GetUserAppEntitlementByAppId' test.out

#- 257 QueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'rkYYVbWV' \
    --activeOnly  \
    --limit '21' \
    --offset '67' \
    --appType 'DLC' \
    > test.out 2>&1
eval_tap $? 257 'QueryUserEntitlementsByAppType' test.out

#- 258 GetUserEntitlementsByIds
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementsByIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'IaEtYJTr' \
    --ids 'LZY1ezOj,tHGvoODO,GXFFocuO' \
    > test.out 2>&1
eval_tap $? 258 'GetUserEntitlementsByIds' test.out

#- 259 GetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'nb6eJJ2s' \
    --activeOnly  \
    --entitlementClazz 'CODE' \
    --platform 'TjFyqAxn' \
    --itemId 'GemnC1Aj' \
    > test.out 2>&1
eval_tap $? 259 'GetUserEntitlementByItemId' test.out

#- 260 GetUserActiveEntitlementsByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserActiveEntitlementsByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'dArnPUpm' \
    --ids 'Ac1fjRBZ,CsikjG5I,KOdDkq0z' \
    --platform 'JCWmxFZm' \
    > test.out 2>&1
eval_tap $? 260 'GetUserActiveEntitlementsByItemIds' test.out

#- 261 GetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'zdgRoEJ0' \
    --activeOnly  \
    --entitlementClazz 'SUBSCRIPTION' \
    --platform 'aBMjm1Zs' \
    --sku 'OIiQ44zq' \
    > test.out 2>&1
eval_tap $? 261 'GetUserEntitlementBySku' test.out

#- 262 ExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'LShnrGF0' \
    --appIds '3GZT5N3A,UG9AIogG,3mhWT4Pv' \
    --itemIds 'RUhfYTLI,saN8dCrE,QWzBzjvq' \
    --platform 'uekXXm6N' \
    --skus 'J4Uj9hl8,Lo1JGPx8,bnIuy4GA' \
    > test.out 2>&1
eval_tap $? 262 'ExistsAnyUserActiveEntitlement' test.out

#- 263 ExistsAnyUserActiveEntitlementByItemIds
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlementByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'ikNdXZyt' \
    --platform '0x2ZAH5F' \
    --itemIds 'MSNw6XcV,qaTbiWi3,9VfMntiC' \
    > test.out 2>&1
eval_tap $? 263 'ExistsAnyUserActiveEntitlementByItemIds' test.out

#- 264 GetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId '36w2dmks' \
    --appId 'C34k5MPn' \
    > test.out 2>&1
eval_tap $? 264 'GetUserAppEntitlementOwnershipByAppId' test.out

#- 265 GetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'N9QaXxqP' \
    --entitlementClazz 'MEDIA' \
    --platform '0rABhvef' \
    --itemId 'GN5aRWQp' \
    > test.out 2>&1
eval_tap $? 265 'GetUserEntitlementOwnershipByItemId' test.out

#- 266 GetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'Jx7x0wB3' \
    --ids 'ArkuLuQu,EbqFchsp,xoAPRfs2' \
    --platform 'M8yq7zfG' \
    > test.out 2>&1
eval_tap $? 266 'GetUserEntitlementOwnershipByItemIds' test.out

#- 267 GetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'QWzWkZS8' \
    --entitlementClazz 'SUBSCRIPTION' \
    --platform 'k9dJOa6p' \
    --sku 'e6EZ71sF' \
    > test.out 2>&1
eval_tap $? 267 'GetUserEntitlementOwnershipBySku' test.out

#- 268 RevokeAllEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeAllEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'JkMNdzsk' \
    > test.out 2>&1
eval_tap $? 268 'RevokeAllEntitlements' test.out

#- 269 RevokeUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'YhZhtFW4' \
    --entitlementIds 'RfzQIUKP' \
    > test.out 2>&1
eval_tap $? 269 'RevokeUserEntitlements' test.out

#- 270 GetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlement \
    --entitlementId 'RPKhtCPd' \
    --namespace "$AB_NAMESPACE" \
    --userId 'gwGxVCqu' \
    > test.out 2>&1
eval_tap $? 270 'GetUserEntitlement' test.out

#- 271 UpdateUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform updateUserEntitlement \
    --entitlementId '0k0caVc7' \
    --namespace "$AB_NAMESPACE" \
    --userId 'PtFakMvh' \
    --body '{"collectionId": "pZVphOVh", "endDate": "1982-02-28T00:00:00Z", "nullFieldList": ["yIRdWP4r", "7Bh3Uu3L", "xtNq1wcY"], "origin": "IOS", "reason": "ekFgcdqn", "startDate": "1973-02-05T00:00:00Z", "status": "ACTIVE", "useCount": 75}' \
    > test.out 2>&1
eval_tap $? 271 'UpdateUserEntitlement' test.out

#- 272 ConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform consumeUserEntitlement \
    --entitlementId 'wZNyoLbh' \
    --namespace "$AB_NAMESPACE" \
    --userId 'IiTBwtY8' \
    --body '{"metadata": {"eBp2Fifz": {}, "UFsXWyG5": {}, "MBsD830y": {}}, "options": ["tYSQl2W6", "3O2YwJyi", "nLKDoGWb"], "platform": "rmjwzdpP", "requestId": "UCSqpwz8", "useCount": 60}' \
    > test.out 2>&1
eval_tap $? 272 'ConsumeUserEntitlement' test.out

#- 273 DisableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform disableUserEntitlement \
    --entitlementId '2IswtL58' \
    --namespace "$AB_NAMESPACE" \
    --userId 'rY6iQvZU' \
    > test.out 2>&1
eval_tap $? 273 'DisableUserEntitlement' test.out

#- 274 EnableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform enableUserEntitlement \
    --entitlementId 'IiWGdGij' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Or9JTFEH' \
    > test.out 2>&1
eval_tap $? 274 'EnableUserEntitlement' test.out

#- 275 GetUserEntitlementHistories
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementHistories \
    --entitlementId 'Z9BQGF7Q' \
    --namespace "$AB_NAMESPACE" \
    --userId 'aH7IvPhy' \
    > test.out 2>&1
eval_tap $? 275 'GetUserEntitlementHistories' test.out

#- 276 RevokeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlement \
    --entitlementId 'CfmPIpYa' \
    --namespace "$AB_NAMESPACE" \
    --userId 'XMvUzCne' \
    --body '{"metadata": {"Ffs5Aiej": {}, "zmzdyd5B": {}, "uwMI92mx": {}}}' \
    > test.out 2>&1
eval_tap $? 276 'RevokeUserEntitlement' test.out

#- 277 RevokeUserEntitlementByUseCount
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlementByUseCount \
    --entitlementId 'gb5XduP1' \
    --namespace "$AB_NAMESPACE" \
    --userId 'm8MK4V3t' \
    --body '{"reason": "pVeBWhpl", "useCount": 2}' \
    > test.out 2>&1
eval_tap $? 277 'RevokeUserEntitlementByUseCount' test.out

#- 278 PreCheckRevokeUserEntitlementByUseCount
./ng net.accelbyte.sdk.cli.Main platform preCheckRevokeUserEntitlementByUseCount \
    --entitlementId 'TRXlKSqn' \
    --namespace "$AB_NAMESPACE" \
    --userId 'GYcMjQVt' \
    --quantity '16' \
    > test.out 2>&1
eval_tap $? 278 'PreCheckRevokeUserEntitlementByUseCount' test.out

#- 279 RevokeUseCount
eval_tap 0 279 'RevokeUseCount # SKIP deprecated' test.out

#- 280 SellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform sellUserEntitlement \
    --entitlementId 'Oy0dlgq6' \
    --namespace "$AB_NAMESPACE" \
    --userId 'MFZgDtN5' \
    --body '{"platform": "iq4FHzvp", "requestId": "bzOc3c0B", "useCount": 47}' \
    > test.out 2>&1
eval_tap $? 280 'SellUserEntitlement' test.out

#- 281 FulfillItem
./ng net.accelbyte.sdk.cli.Main platform fulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'i2i0sPCe' \
    --body '{"duration": 11, "endDate": "1981-02-18T00:00:00Z", "entitlementCollectionId": "MN6J1OOS", "entitlementOrigin": "Steam", "itemId": "fmRUP5k2", "itemSku": "sDTuJK0a", "language": "rA2pdarD", "metadata": {"B8QbdYr9": {}, "BkHjU9I1": {}, "1uT7lFzf": {}}, "order": {"currency": {"currencyCode": "YCSjvW27", "currencySymbol": "sPiTR849", "currencyType": "VIRTUAL", "decimals": 44, "namespace": "AgnpparL"}, "ext": {"2B8kaDIV": {}, "ID794KLH": {}, "Y3G6Wnwj": {}}, "free": true}, "orderNo": "c4ZorKnR", "origin": "Oculus", "overrideBundleItemQty": {"z2tMgA58": 48, "4L2kwqI7": 23, "4iaeXhX9": 14}, "quantity": 33, "region": "IcrCfLMW", "source": "ACHIEVEMENT", "startDate": "1975-09-11T00:00:00Z", "storeId": "eHvXIOww"}' \
    > test.out 2>&1
eval_tap $? 281 'FulfillItem' test.out

#- 282 RedeemCode
./ng net.accelbyte.sdk.cli.Main platform redeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'ggGdxd2R' \
    --body '{"code": "QX8xZecZ", "language": "rMHy", "region": "0bXD4rFt"}' \
    > test.out 2>&1
eval_tap $? 282 'RedeemCode' test.out

#- 283 PreCheckFulfillItem
./ng net.accelbyte.sdk.cli.Main platform preCheckFulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'LbfnmOWT' \
    --body '{"itemId": "6JGa20AE", "itemSku": "yUti6Raq", "quantity": 62}' \
    > test.out 2>&1
eval_tap $? 283 'PreCheckFulfillItem' test.out

#- 284 FulfillRewards
./ng net.accelbyte.sdk.cli.Main platform fulfillRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'aZ2RadId' \
    --body '{"entitlementCollectionId": "PvkbZNBe", "entitlementOrigin": "Other", "metadata": {"ZjMuloKn": {}, "x46IwBic": {}, "rTuR6ire": {}}, "origin": "IOS", "rewards": [{"currency": {"currencyCode": "QcOIJnMY", "namespace": "KakVw5Wb"}, "item": {"itemId": "Wyr0G50N", "itemName": "wQfwu5sp", "itemSku": "pQTDEC8K", "itemType": "LyRpdujf"}, "quantity": 68, "type": "ITEM"}, {"currency": {"currencyCode": "V8D60mkm", "namespace": "kJzBmEhb"}, "item": {"itemId": "Jt8f74hb", "itemName": "xaNYDK4h", "itemSku": "UtommVC0", "itemType": "JFXdEgn3"}, "quantity": 5, "type": "ITEM"}, {"currency": {"currencyCode": "JcnNNknu", "namespace": "pTe7gLnJ"}, "item": {"itemId": "TvgZO5YJ", "itemName": "H54aOtW0", "itemSku": "bOEciFDd", "itemType": "TenOGbFT"}, "quantity": 5, "type": "ITEM"}], "source": "PAYMENT", "transactionId": "xa0sQhqY"}' \
    > test.out 2>&1
eval_tap $? 284 'FulfillRewards' test.out

#- 285 QueryUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId '3gIU7oQE' \
    --endTime 'e6mtQty3' \
    --limit '28' \
    --offset '48' \
    --productId 'A7KbqmDn' \
    --startTime 'ws5n4sc2' \
    --status 'REVOKE_FAILED' \
    --type 'GOOGLE' \
    > test.out 2>&1
eval_tap $? 285 'QueryUserIAPOrders' test.out

#- 286 QueryAllUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryAllUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'PFHNN0hQ' \
    > test.out 2>&1
eval_tap $? 286 'QueryAllUserIAPOrders' test.out

#- 287 QueryUserIAPConsumeHistory
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPConsumeHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'LAascpej' \
    --endTime 'UWHggoPJ' \
    --limit '53' \
    --offset '51' \
    --startTime 'Ka0RfZzq' \
    --status 'SUCCESS' \
    --type 'XBOX' \
    > test.out 2>&1
eval_tap $? 287 'QueryUserIAPConsumeHistory' test.out

#- 288 MockFulfillIAPItem
./ng net.accelbyte.sdk.cli.Main platform mockFulfillIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'nL6aq6VP' \
    --body '{"itemIdentityType": "ITEM_SKU", "language": "cvf", "productId": "sjbckdSZ", "region": "41H7R1xx", "transactionId": "AjwNYVgY", "type": "STEAM"}' \
    > test.out 2>&1
eval_tap $? 288 'MockFulfillIAPItem' test.out

#- 289 AdminGetIAPOrderLineItems
./ng net.accelbyte.sdk.cli.Main platform adminGetIAPOrderLineItems \
    --iapOrderNo 'XsZz0ykl' \
    --namespace "$AB_NAMESPACE" \
    --userId 'YBBgR5Y4' \
    > test.out 2>&1
eval_tap $? 289 'AdminGetIAPOrderLineItems' test.out

#- 290 AdminSyncSteamAbnormalTransaction
./ng net.accelbyte.sdk.cli.Main platform adminSyncSteamAbnormalTransaction \
    --namespace "$AB_NAMESPACE" \
    --userId 'i4gmdVDX' \
    > test.out 2>&1
eval_tap $? 290 'AdminSyncSteamAbnormalTransaction' test.out

#- 291 AdminSyncSteamIAPByTransaction
./ng net.accelbyte.sdk.cli.Main platform adminSyncSteamIAPByTransaction \
    --namespace "$AB_NAMESPACE" \
    --userId 'J1tEaMBC' \
    --body '{"orderId": "ZxlPMtHX"}' \
    > test.out 2>&1
eval_tap $? 291 'AdminSyncSteamIAPByTransaction' test.out

#- 292 QueryUserThirdPartySubscription
./ng net.accelbyte.sdk.cli.Main platform queryUserThirdPartySubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'ljn3DR2J' \
    --activeOnly  \
    --groupId 'PdyBr0on' \
    --limit '90' \
    --offset '22' \
    --platform 'EPICGAMES' \
    --productId '8IxAtxfD' \
    > test.out 2>&1
eval_tap $? 292 'QueryUserThirdPartySubscription' test.out

#- 293 GetThirdPartyPlatformSubscriptionOwnershipByGroupId
./ng net.accelbyte.sdk.cli.Main platform getThirdPartyPlatformSubscriptionOwnershipByGroupId \
    --namespace "$AB_NAMESPACE" \
    --platform 'PLAYSTATION' \
    --userId 'Wv0cdbDJ' \
    --groupId '5p78vbuE' \
    > test.out 2>&1
eval_tap $? 293 'GetThirdPartyPlatformSubscriptionOwnershipByGroupId' test.out

#- 294 GetThirdPartyPlatformSubscriptionOwnershipByProductId
./ng net.accelbyte.sdk.cli.Main platform getThirdPartyPlatformSubscriptionOwnershipByProductId \
    --namespace "$AB_NAMESPACE" \
    --platform 'STEAM' \
    --userId 'B33ynlYH' \
    --productId 'PjpZSQs0' \
    > test.out 2>&1
eval_tap $? 294 'GetThirdPartyPlatformSubscriptionOwnershipByProductId' test.out

#- 295 QueryUserThirdPartySubscriptionTransactions
./ng net.accelbyte.sdk.cli.Main platform queryUserThirdPartySubscriptionTransactions \
    --namespace "$AB_NAMESPACE" \
    --userId 'EddcbHUb' \
    --activeOnly  \
    --groupId 'U19wcXzZ' \
    --limit '86' \
    --offset '40' \
    --platform 'TWITCH' \
    --productId 'jzTCuVgh' \
    > test.out 2>&1
eval_tap $? 295 'QueryUserThirdPartySubscriptionTransactions' test.out

#- 296 GetThirdPartySubscriptionDetails
./ng net.accelbyte.sdk.cli.Main platform getThirdPartySubscriptionDetails \
    --id 'jERLn4Se' \
    --namespace "$AB_NAMESPACE" \
    --userId 'K6MdoOMS' \
    > test.out 2>&1
eval_tap $? 296 'GetThirdPartySubscriptionDetails' test.out

#- 297 GetSubscriptionHistory
./ng net.accelbyte.sdk.cli.Main platform getSubscriptionHistory \
    --id 'CDW1NQIS' \
    --namespace "$AB_NAMESPACE" \
    --userId 'MwjtLu7p' \
    --limit '57' \
    --offset '32' \
    > test.out 2>&1
eval_tap $? 297 'GetSubscriptionHistory' test.out

#- 298 SyncSubscriptionTransaction
./ng net.accelbyte.sdk.cli.Main platform syncSubscriptionTransaction \
    --id 'tM7qeSHX' \
    --namespace "$AB_NAMESPACE" \
    --userId 'sBi07cE9' \
    > test.out 2>&1
eval_tap $? 298 'SyncSubscriptionTransaction' test.out

#- 299 GetThirdPartyUserSubscriptionDetails
./ng net.accelbyte.sdk.cli.Main platform getThirdPartyUserSubscriptionDetails \
    --id 'SPVo6bC2' \
    --namespace "$AB_NAMESPACE" \
    --userId 'jsZt8mb1' \
    > test.out 2>&1
eval_tap $? 299 'GetThirdPartyUserSubscriptionDetails' test.out

#- 300 SyncSubscription
./ng net.accelbyte.sdk.cli.Main platform syncSubscription \
    --id '4RSexDpN' \
    --namespace "$AB_NAMESPACE" \
    --userId 'bWXyMDtX' \
    > test.out 2>&1
eval_tap $? 300 'SyncSubscription' test.out

#- 301 QueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'FMDRtcIK' \
    --discounted  \
    --itemId 'slkBGos3' \
    --limit '0' \
    --offset '38' \
    --status 'REFUND_FAILED' \
    > test.out 2>&1
eval_tap $? 301 'QueryUserOrders' test.out

#- 302 AdminCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform adminCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'vjsqvlWo' \
    --body '{"currencyCode": "rZMXLuir", "currencyNamespace": "PwPfR0ZZ", "discountCodes": ["rMlK5O71", "rwdq1YUL", "3SmgV4Hc"], "discountedPrice": 28, "entitlementPlatform": "Oculus", "ext": {"9Ng7Q0ne": {}, "xPaifkHs": {}, "gYc2d2Zs": {}}, "itemId": "cxsobtcr", "language": "BSRgE7t3", "options": {"skipPriceValidation": true}, "platform": "Xbox", "price": 25, "quantity": 41, "region": "5y8inOun", "returnUrl": "VLaVroNQ", "sandbox": true, "sectionId": "UWI1rjms"}' \
    > test.out 2>&1
eval_tap $? 302 'AdminCreateUserOrder' test.out

#- 303 CountOfPurchasedItem
./ng net.accelbyte.sdk.cli.Main platform countOfPurchasedItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'Opv9sOi6' \
    --itemId 'FHnJnGxh' \
    > test.out 2>&1
eval_tap $? 303 'CountOfPurchasedItem' test.out

#- 304 GetUserOrder
./ng net.accelbyte.sdk.cli.Main platform getUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'roaIjsER' \
    --userId 'fmxXJ0bU' \
    > test.out 2>&1
eval_tap $? 304 'GetUserOrder' test.out

#- 305 UpdateUserOrderStatus
./ng net.accelbyte.sdk.cli.Main platform updateUserOrderStatus \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'rp96zB3S' \
    --userId 'qUsf3ny4' \
    --body '{"status": "REFUNDING", "statusReason": "1AsjJaCm"}' \
    > test.out 2>&1
eval_tap $? 305 'UpdateUserOrderStatus' test.out

#- 306 FulfillUserOrder
./ng net.accelbyte.sdk.cli.Main platform fulfillUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'WgGejNRX' \
    --userId 'c6mV9lsi' \
    > test.out 2>&1
eval_tap $? 306 'FulfillUserOrder' test.out

#- 307 GetUserOrderGrant
eval_tap 0 307 'GetUserOrderGrant # SKIP deprecated' test.out

#- 308 GetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform getUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'dDknz6jO' \
    --userId 'wPFM47s9' \
    > test.out 2>&1
eval_tap $? 308 'GetUserOrderHistories' test.out

#- 309 ProcessUserOrderNotification
./ng net.accelbyte.sdk.cli.Main platform processUserOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'uyRANN1P' \
    --userId '2a7s69eh' \
    --body '{"additionalData": {"cardSummary": "gmxM5smf"}, "authorisedTime": "1980-03-15T00:00:00Z", "chargebackReversedTime": "1994-02-22T00:00:00Z", "chargebackTime": "1985-09-08T00:00:00Z", "chargedTime": "1995-07-12T00:00:00Z", "createdTime": "1983-08-23T00:00:00Z", "currency": {"currencyCode": "vSxWKib4", "currencySymbol": "BGzFzV04", "currencyType": "VIRTUAL", "decimals": 27, "namespace": "mxJ328IK"}, "customParameters": {"PMaMQxQa": {}, "jUDYGQm1": {}, "L9SdsZWg": {}}, "extOrderNo": "dWus3kLX", "extTxId": "dpJAo83l", "extUserId": "gNPf3xZe", "issuedAt": "1985-05-15T00:00:00Z", "metadata": {"hbbNPLVq": "18nkgt1e", "l4qgM0v9": "PMKLFGkJ", "pcmFUAZf": "VQOywy4s"}, "namespace": "6Pu52Sf6", "nonceStr": "49hdYwq7", "paymentData": {"discountAmount": 91, "discountCode": "FAmCVfPe", "subtotalPrice": 97, "tax": 54, "totalPrice": 18}, "paymentMethod": "KXK53et9", "paymentMethodFee": 50, "paymentOrderNo": "qgXFcAJ7", "paymentProvider": "STRIPE", "paymentProviderFee": 46, "paymentStationUrl": "EpqmQDsC", "price": 62, "refundedTime": "1994-12-13T00:00:00Z", "salesTax": 80, "sandbox": false, "sku": "AHek4Q0C", "status": "CHARGEBACK", "statusReason": "sCDjMcXm", "subscriptionId": "51TTvNFX", "subtotalPrice": 17, "targetNamespace": "qHVh1SGq", "targetUserId": "kcU3qf4g", "tax": 60, "totalPrice": 7, "totalTax": 51, "txEndTime": "1990-01-25T00:00:00Z", "type": "0oxtdsXM", "userId": "3xpaaHoB", "vat": 52}' \
    > test.out 2>&1
eval_tap $? 309 'ProcessUserOrderNotification' test.out

#- 310 DownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform downloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'RPqU0KYm' \
    --userId 'cCdboRj9' \
    > test.out 2>&1
eval_tap $? 310 'DownloadUserOrderReceipt' test.out

#- 311 CreateUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform createUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'Rp7glSYm' \
    --body '{"currencyCode": "svH1mraM", "currencyNamespace": "9YPNsd3w", "customParameters": {"5QBDOGDV": {}, "RUYXM92P": {}, "bqyRPpwJ": {}}, "description": "PZSFH9FS", "extOrderNo": "WK0Pbynk", "extUserId": "yKT37PS3", "itemType": "LOOTBOX", "language": "WEjz-uHMe", "metadata": {"OJdQOI3h": "W2NKvZZh", "8wAemunP": "zTnCDl6o", "acmqpnnX": "dy4iE0gn"}, "notifyUrl": "22cUcK25", "omitNotification": true, "platform": "cErrIl5h", "price": 31, "recurringPaymentOrderNo": "21ry7OFr", "region": "JJ2F2yfv", "returnUrl": "2lWoX5Xi", "sandbox": true, "sku": "NpWijuH4", "subscriptionId": "hXZ9RP9a", "title": "VqVu3kXV"}' \
    > test.out 2>&1
eval_tap $? 311 'CreateUserPaymentOrder' test.out

#- 312 RefundUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform refundUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '0V1ya0W6' \
    --userId 'M84SWtNj' \
    --body '{"description": "vhv6rNwi"}' \
    > test.out 2>&1
eval_tap $? 312 'RefundUserPaymentOrder' test.out

#- 313 GetUserPlatformAccountClosureHistories
./ng net.accelbyte.sdk.cli.Main platform getUserPlatformAccountClosureHistories \
    --namespace "$AB_NAMESPACE" \
    --userId 'Edu0m9yh' \
    > test.out 2>&1
eval_tap $? 313 'GetUserPlatformAccountClosureHistories' test.out

#- 314 ApplyUserRedemption
./ng net.accelbyte.sdk.cli.Main platform applyUserRedemption \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZnyC0ihj' \
    --body '{"code": "KhuesXoe", "orderNo": "3jmdG9td"}' \
    > test.out 2>&1
eval_tap $? 314 'ApplyUserRedemption' test.out

#- 315 DoRevocation
./ng net.accelbyte.sdk.cli.Main platform doRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId 'Zsqy2xUi' \
    --body '{"meta": {"3oHwid3x": {}, "ywMSNe2H": {}, "Jw879Enj": {}}, "reason": "O1ARQGjf", "requestId": "qf0sYfT1", "revokeEntries": [{"currency": {"balanceOrigin": "IOS", "currencyCode": "sqsfnU53", "namespace": "0vJcwPe5"}, "entitlement": {"entitlementId": "69GXYShb"}, "item": {"entitlementOrigin": "Playstation", "itemIdentity": "draQaB4H", "itemIdentityType": "ITEM_ID", "origin": "IOS"}, "quantity": 64, "type": "CURRENCY"}, {"currency": {"balanceOrigin": "Epic", "currencyCode": "qagXYoCU", "namespace": "HDB1udmc"}, "entitlement": {"entitlementId": "enWaJIuH"}, "item": {"entitlementOrigin": "Oculus", "itemIdentity": "sEahc5Qd", "itemIdentityType": "ITEM_SKU", "origin": "Xbox"}, "quantity": 4, "type": "CURRENCY"}, {"currency": {"balanceOrigin": "Xbox", "currencyCode": "BCPe8qty", "namespace": "LrZQa0ee"}, "entitlement": {"entitlementId": "9tucuLVl"}, "item": {"entitlementOrigin": "Other", "itemIdentity": "h9PsOdbz", "itemIdentityType": "ITEM_ID", "origin": "Twitch"}, "quantity": 98, "type": "ITEM"}], "source": "DLC", "transactionId": "1LSp88pe"}' \
    > test.out 2>&1
eval_tap $? 315 'DoRevocation' test.out

#- 316 RegisterXblSessions
./ng net.accelbyte.sdk.cli.Main platform registerXblSessions \
    --namespace "$AB_NAMESPACE" \
    --userId 'oVAeVgzv' \
    --body '{"gameSessionId": "ADbBTXXc", "payload": {"sb2btrRe": {}, "7wklniBX": {}, "s2yjhNOy": {}}, "scid": "H75pzdv0", "sessionTemplateName": "gZ3PB2l9"}' \
    > test.out 2>&1
eval_tap $? 316 'RegisterXblSessions' test.out

#- 317 QueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform queryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'yxDmiDcv' \
    --chargeStatus 'RECURRING_CHARGING' \
    --itemId 'c5cUKhWo' \
    --limit '79' \
    --offset '83' \
    --sku 'MGJbFMuO' \
    --status 'INIT' \
    --subscribedBy 'PLATFORM' \
    > test.out 2>&1
eval_tap $? 317 'QueryUserSubscriptions' test.out

#- 318 GetUserSubscriptionActivities
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionActivities \
    --namespace "$AB_NAMESPACE" \
    --userId 'EPFBZgYO' \
    --excludeSystem  \
    --limit '32' \
    --offset '20' \
    --subscriptionId 'pJin2HIk' \
    > test.out 2>&1
eval_tap $? 318 'GetUserSubscriptionActivities' test.out

#- 319 PlatformSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform platformSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'ALITtzrU' \
    --body '{"grantDays": 73, "itemId": "7UMYvsnA", "language": "hVX0qfTY", "reason": "vACzkE0x", "region": "ZdzkOJyA", "source": "hpfAID6I"}' \
    > test.out 2>&1
eval_tap $? 319 'PlatformSubscribeSubscription' test.out

#- 320 CheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform checkUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'xPcjca9o' \
    --itemId '9M0OtB8p' \
    > test.out 2>&1
eval_tap $? 320 'CheckUserSubscriptionSubscribableByItemId' test.out

#- 321 GetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform getUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'YcP3q5LG' \
    --userId 'pjxicbOC' \
    > test.out 2>&1
eval_tap $? 321 'GetUserSubscription' test.out

#- 322 DeleteUserSubscription
./ng net.accelbyte.sdk.cli.Main platform deleteUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'UUmlh87R' \
    --userId 'QGuqe3hy' \
    > test.out 2>&1
eval_tap $? 322 'DeleteUserSubscription' test.out

#- 323 CancelSubscription
./ng net.accelbyte.sdk.cli.Main platform cancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '0FvAyggH' \
    --userId 'w5lr35ln' \
    --force  \
    --body '{"immediate": true, "reason": "WnzOrBpQ"}' \
    > test.out 2>&1
eval_tap $? 323 'CancelSubscription' test.out

#- 324 GrantDaysToSubscription
./ng net.accelbyte.sdk.cli.Main platform grantDaysToSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'bgyKSWle' \
    --userId 'whntCjKE' \
    --body '{"grantDays": 82, "reason": "lvqjP9Fe"}' \
    > test.out 2>&1
eval_tap $? 324 'GrantDaysToSubscription' test.out

#- 325 GetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '6tWs3v9O' \
    --userId 'bS2O63Cf' \
    --excludeFree  \
    --limit '20' \
    --offset '65' \
    > test.out 2>&1
eval_tap $? 325 'GetUserSubscriptionBillingHistories' test.out

#- 326 ProcessUserSubscriptionNotification
./ng net.accelbyte.sdk.cli.Main platform processUserSubscriptionNotification \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'hY8TLG94' \
    --userId 'ekLM2sz6' \
    --body '{"additionalData": {"cardSummary": "VRKANXn5"}, "authorisedTime": "1989-05-01T00:00:00Z", "chargebackReversedTime": "1987-09-13T00:00:00Z", "chargebackTime": "1980-02-06T00:00:00Z", "chargedTime": "1984-05-09T00:00:00Z", "createdTime": "1983-03-15T00:00:00Z", "currency": {"currencyCode": "scdRjIyO", "currencySymbol": "YzRSemce", "currencyType": "VIRTUAL", "decimals": 43, "namespace": "Tdc7y2Oy"}, "customParameters": {"4P8kYli7": {}, "AZPK1i5b": {}, "ay6zwAem": {}}, "extOrderNo": "hnGllgG9", "extTxId": "X29ItAgS", "extUserId": "W1QtNQ3H", "issuedAt": "1973-07-23T00:00:00Z", "metadata": {"dPGtJ7VX": "0IGl9mJ0", "6e50a0h6": "6zNPWkPY", "YlQPX2wK": "Q0UMeiX2"}, "namespace": "uKvT20XF", "nonceStr": "0zXfuzj1", "paymentData": {"discountAmount": 59, "discountCode": "z8ULgIvA", "subtotalPrice": 76, "tax": 57, "totalPrice": 94}, "paymentMethod": "E9mgGkNf", "paymentMethodFee": 99, "paymentOrderNo": "5QJRN4Al", "paymentProvider": "NEONPAY", "paymentProviderFee": 44, "paymentStationUrl": "VKfIuzCg", "price": 56, "refundedTime": "1995-08-10T00:00:00Z", "salesTax": 54, "sandbox": true, "sku": "GufOmc33", "status": "AUTHORISED", "statusReason": "XOkNBjQW", "subscriptionId": "3MasA8rY", "subtotalPrice": 70, "targetNamespace": "J9S1LAjC", "targetUserId": "feqihSwM", "tax": 29, "totalPrice": 52, "totalTax": 68, "txEndTime": "1980-03-08T00:00:00Z", "type": "vY7dL2Ik", "userId": "FQdor9LK", "vat": 61}' \
    > test.out 2>&1
eval_tap $? 326 'ProcessUserSubscriptionNotification' test.out

#- 327 AcquireUserTicket
./ng net.accelbyte.sdk.cli.Main platform acquireUserTicket \
    --boothName '1baiPbAB' \
    --namespace "$AB_NAMESPACE" \
    --userId 'RymXAO6k' \
    --body '{"count": 74, "orderNo": "MBQol5fF"}' \
    > test.out 2>&1
eval_tap $? 327 'AcquireUserTicket' test.out

#- 328 QueryUserCurrencyWallets
./ng net.accelbyte.sdk.cli.Main platform queryUserCurrencyWallets \
    --namespace "$AB_NAMESPACE" \
    --userId '95vDUjdm' \
    > test.out 2>&1
eval_tap $? 328 'QueryUserCurrencyWallets' test.out

#- 329 DebitUserWalletByCurrencyCode
./ng net.accelbyte.sdk.cli.Main platform debitUserWalletByCurrencyCode \
    --currencyCode 'VyAO1wEA' \
    --namespace "$AB_NAMESPACE" \
    --userId 'paUT2gkN' \
    --body '{"allowOverdraft": false, "amount": 54, "balanceOrigin": "Other", "balanceSource": "DLC_REVOCATION", "metadata": {"nromth8g": {}, "jXjc860F": {}, "4zBKHaMn": {}}, "reason": "11v7HKaB"}' \
    > test.out 2>&1
eval_tap $? 329 'DebitUserWalletByCurrencyCode' test.out

#- 330 ListUserCurrencyTransactions
./ng net.accelbyte.sdk.cli.Main platform listUserCurrencyTransactions \
    --currencyCode 'YnnF3JMw' \
    --namespace "$AB_NAMESPACE" \
    --userId 'kqTzTtz8' \
    --limit '9' \
    --offset '76' \
    > test.out 2>&1
eval_tap $? 330 'ListUserCurrencyTransactions' test.out

#- 331 CheckBalance
./ng net.accelbyte.sdk.cli.Main platform checkBalance \
    --currencyCode 't2W3b1hj' \
    --namespace "$AB_NAMESPACE" \
    --userId 'VunLIfyW' \
    --request '{"amount": 7, "debitBalanceSource": "ORDER_REVOCATION", "metadata": {"NWeVaDER": {}, "SSPpx4Z0": {}, "MmqKXIVf": {}}, "reason": "O09c7CFs", "walletPlatform": "Xbox"}' \
    > test.out 2>&1
eval_tap $? 331 'CheckBalance' test.out

#- 332 CheckWallet
eval_tap 0 332 'CheckWallet # SKIP deprecated' test.out

#- 333 CreditUserWallet
./ng net.accelbyte.sdk.cli.Main platform creditUserWallet \
    --currencyCode 'czNSmLZX' \
    --namespace "$AB_NAMESPACE" \
    --userId '4eVthecv' \
    --body '{"amount": 75, "expireAt": "1996-11-13T00:00:00Z", "metadata": {"RTE5cKmF": {}, "dCqdc5G6": {}, "pAb6Pfij": {}}, "origin": "System", "reason": "gFGCDWo5", "source": "CONSUME_ENTITLEMENT"}' \
    > test.out 2>&1
eval_tap $? 333 'CreditUserWallet' test.out

#- 334 DebitByWalletPlatform
./ng net.accelbyte.sdk.cli.Main platform debitByWalletPlatform \
    --currencyCode 'Z2rYFmbw' \
    --namespace "$AB_NAMESPACE" \
    --userId 'cjk2S9rq' \
    --request '{"amount": 8, "debitBalanceSource": "PAYMENT", "metadata": {"TRIQmQYh": {}, "jskkJ5QO": {}, "xo8cYigJ": {}}, "reason": "1fwL2kAy", "walletPlatform": "GooglePlay"}' \
    > test.out 2>&1
eval_tap $? 334 'DebitByWalletPlatform' test.out

#- 335 PayWithUserWallet
./ng net.accelbyte.sdk.cli.Main platform payWithUserWallet \
    --currencyCode 'w8WExrOI' \
    --namespace "$AB_NAMESPACE" \
    --userId '0RT6cgfs' \
    --body '{"amount": 78, "metadata": {"KopObsaf": {}, "6Wdp04hJ": {}, "9OLnHaP4": {}}, "walletPlatform": "Epic"}' \
    > test.out 2>&1
eval_tap $? 335 'PayWithUserWallet' test.out

#- 336 GetUserWallet
eval_tap 0 336 'GetUserWallet # SKIP deprecated' test.out

#- 337 DebitUserWallet
eval_tap 0 337 'DebitUserWallet # SKIP deprecated' test.out

#- 338 DisableUserWallet
eval_tap 0 338 'DisableUserWallet # SKIP deprecated' test.out

#- 339 EnableUserWallet
eval_tap 0 339 'EnableUserWallet # SKIP deprecated' test.out

#- 340 ListUserWalletTransactions
eval_tap 0 340 'ListUserWalletTransactions # SKIP deprecated' test.out

#- 341 ListViews
./ng net.accelbyte.sdk.cli.Main platform listViews \
    --namespace "$AB_NAMESPACE" \
    --storeId 'EPSHKwi6' \
    > test.out 2>&1
eval_tap $? 341 'ListViews' test.out

#- 342 CreateView
./ng net.accelbyte.sdk.cli.Main platform createView \
    --namespace "$AB_NAMESPACE" \
    --storeId 'jptkMfkz' \
    --body '{"displayOrder": 59, "localizations": {"1vNzrIkG": {"description": "hvuDKuxF", "localExt": {"g2pC3Q30": {}, "sOKw5J6R": {}, "kywBc523": {}}, "longDescription": "wnLinnTv", "title": "dq8SvTRH"}, "ipxT6PYI": {"description": "FJ4vWwfP", "localExt": {"uyRDsNK1": {}, "SANIgA4U": {}, "kJC2tWVk": {}}, "longDescription": "mc8N2A58", "title": "gAZt4S0R"}, "hDxgGLOS": {"description": "rQwlEODW", "localExt": {"FC0W0dq1": {}, "6Y70kdSn": {}, "bpAiQLZb": {}}, "longDescription": "CI8Ex79x", "title": "tLbzKpja"}}, "name": "aruPNSPQ"}' \
    > test.out 2>&1
eval_tap $? 342 'CreateView' test.out

#- 343 GetView
./ng net.accelbyte.sdk.cli.Main platform getView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'k8X9oleS' \
    --storeId 'PP68fCK1' \
    > test.out 2>&1
eval_tap $? 343 'GetView' test.out

#- 344 UpdateView
./ng net.accelbyte.sdk.cli.Main platform updateView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'ePlpEWyt' \
    --storeId 'idzoCQd0' \
    --body '{"displayOrder": 84, "localizations": {"ugksgkAB": {"description": "9p2IybIZ", "localExt": {"zuexKs7s": {}, "W4FAMAZ2": {}, "O4QuuNA9": {}}, "longDescription": "jz9jmfbb", "title": "4ZK6huq2"}, "YwPYZeh9": {"description": "c1WolTqz", "localExt": {"GOmDmj6C": {}, "YN7upYhH": {}, "EIdi3hvx": {}}, "longDescription": "qj2y5UKY", "title": "ersMfa7I"}, "KiwGSs5S": {"description": "0scMQ35K", "localExt": {"vzrFQVfO": {}, "uZ0x8L1F": {}, "skFXCk24": {}}, "longDescription": "x8bIEgVM", "title": "8ojBq0pC"}}, "name": "A1s6S1Vz"}' \
    > test.out 2>&1
eval_tap $? 344 'UpdateView' test.out

#- 345 DeleteView
./ng net.accelbyte.sdk.cli.Main platform deleteView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'MSb5yAkW' \
    --storeId 'RV1VWsio' \
    > test.out 2>&1
eval_tap $? 345 'DeleteView' test.out

#- 346 GetWalletConfig
./ng net.accelbyte.sdk.cli.Main platform getWalletConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 346 'GetWalletConfig' test.out

#- 347 UpdateWalletConfig
./ng net.accelbyte.sdk.cli.Main platform updateWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"enablePaidForVCExpiration": true}' \
    > test.out 2>&1
eval_tap $? 347 'UpdateWalletConfig' test.out

#- 348 QueryWallets
eval_tap 0 348 'QueryWallets # SKIP deprecated' test.out

#- 349 BulkCredit
./ng net.accelbyte.sdk.cli.Main platform bulkCredit \
    --namespace "$AB_NAMESPACE" \
    --body '[{"creditRequest": {"amount": 25, "expireAt": "1989-12-01T00:00:00Z", "metadata": {"17IKCdMv": {}, "4FLsh4UN": {}, "tTLQQNqF": {}}, "origin": "IOS", "reason": "49muRwbP", "source": "OTHER"}, "currencyCode": "Y5Nv5T6o", "userIds": ["bUSzZCGL", "CecbIqlx", "F4lOHeOI"]}, {"creditRequest": {"amount": 82, "expireAt": "1973-11-19T00:00:00Z", "metadata": {"WXx2pwzJ": {}, "1gXdKfyj": {}, "PKAQ9sZZ": {}}, "origin": "Oculus", "reason": "JZobybdw", "source": "REWARD"}, "currencyCode": "DxaBhz4k", "userIds": ["O2OL33BS", "y4VV1yFe", "0a5c5wx8"]}, {"creditRequest": {"amount": 99, "expireAt": "1996-06-27T00:00:00Z", "metadata": {"Oi8FX4HS": {}, "GZ46XZ6C": {}, "zUeZ0osU": {}}, "origin": "Playstation", "reason": "B466Z6n7", "source": "TRADE"}, "currencyCode": "uhC6rzAc", "userIds": ["2QkX82EL", "piXhKaP3", "4PelishN"]}]' \
    > test.out 2>&1
eval_tap $? 349 'BulkCredit' test.out

#- 350 BulkDebit
./ng net.accelbyte.sdk.cli.Main platform bulkDebit \
    --namespace "$AB_NAMESPACE" \
    --body '[{"currencyCode": "fCLQcMb4", "request": {"allowOverdraft": false, "amount": 16, "balanceOrigin": "Steam", "balanceSource": "EXPIRATION", "metadata": {"sCGhRwTp": {}, "Uzll1cgb": {}, "V8hXw3Gv": {}}, "reason": "J1hgJXAK"}, "userIds": ["aXznwXVa", "HGmjrjzf", "3bwBjecx"]}, {"currencyCode": "895G8XsW", "request": {"allowOverdraft": false, "amount": 81, "balanceOrigin": "Epic", "balanceSource": "PAYMENT", "metadata": {"2eOMKlGb": {}, "TBpj8Es4": {}, "XStl4f0j": {}}, "reason": "6szjZcSA"}, "userIds": ["Fdb8Sydh", "CsKcquK2", "NWMEnO04"]}, {"currencyCode": "V2mWfgg5", "request": {"allowOverdraft": true, "amount": 40, "balanceOrigin": "Playstation", "balanceSource": "PAYMENT", "metadata": {"34tJR32o": {}, "DUifvkSd": {}, "CHwx2M9t": {}}, "reason": "mow97NhM"}, "userIds": ["5YkG4Rh3", "2MFfs4J6", "43tb5mu8"]}]' \
    > test.out 2>&1
eval_tap $? 350 'BulkDebit' test.out

#- 351 GetWallet
eval_tap 0 351 'GetWallet # SKIP deprecated' test.out

#- 352 SyncOrders
./ng net.accelbyte.sdk.cli.Main platform syncOrders \
    --nextEvaluatedKey 'IWeHefSV' \
    --end 'G70HPQeK' \
    --start 'AdKjupNv' \
    > test.out 2>&1
eval_tap $? 352 'SyncOrders' test.out

#- 353 TestAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfig \
    --sandbox  \
    --body '{"allowedPaymentMethods": ["VAJaH040", "IBSu3tfp", "MJyPyn1I"], "apiKey": "dXdvy5jD", "authoriseAsCapture": false, "blockedPaymentMethods": ["uTxtfrEP", "FJitw6eH", "Rjhv4oVK"], "clientKey": "Lja54zQP", "dropInSettings": "WMlQAYhO", "liveEndpointUrlPrefix": "FGFefn5K", "merchantAccount": "rCQ2csJN", "notificationHmacKey": "6tHOz6GI", "notificationPassword": "yQBjlWnB", "notificationUsername": "7H8stfKl", "returnUrl": "siXA6Bma", "settings": "VHwDIej8"}' \
    > test.out 2>&1
eval_tap $? 353 'TestAdyenConfig' test.out

#- 354 TestAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfig \
    --sandbox  \
    --body '{"appId": "c7rik8hi", "privateKey": "Gf2RUikx", "publicKey": "YT9TaCYg", "returnUrl": "stvj6V4d"}' \
    > test.out 2>&1
eval_tap $? 354 'TestAliPayConfig' test.out

#- 355 TestCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfig \
    --sandbox  \
    --body '{"publicKey": "L5DcFQpg", "secretKey": "et34ws5N"}' \
    > test.out 2>&1
eval_tap $? 355 'TestCheckoutConfig' test.out

#- 356 DebugMatchedPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentMerchantConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'axbQRhCv' \
    > test.out 2>&1
eval_tap $? 356 'DebugMatchedPaymentMerchantConfig' test.out

#- 357 TestNeonPayConfig
./ng net.accelbyte.sdk.cli.Main platform testNeonPayConfig \
    --sandbox  \
    --body '{"apiKey": "bu3Sspsr", "webhookSecretKey": "CDURgF1u"}' \
    > test.out 2>&1
eval_tap $? 357 'TestNeonPayConfig' test.out

#- 358 TestPayPalConfig
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfig \
    --sandbox  \
    --body '{"clientID": "juU8ql6p", "clientSecret": "4tuSwNFQ", "returnUrl": "vG6ulOgi", "webHookId": "GDmVYmdd"}' \
    > test.out 2>&1
eval_tap $? 358 'TestPayPalConfig' test.out

#- 359 TestStripeConfig
./ng net.accelbyte.sdk.cli.Main platform testStripeConfig \
    --sandbox  \
    --body '{"allowedPaymentMethodTypes": ["ql55jrPy", "VGBK0Vfx", "hf8akMPN"], "publishableKey": "4IApG7OF", "secretKey": "bXLr3UvX", "webhookSecret": "0uBj9d8Q"}' \
    > test.out 2>&1
eval_tap $? 359 'TestStripeConfig' test.out

#- 360 TestWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfig \
    --body '{"appId": "KRwPqZc2", "key": "YRtI68w4", "mchid": "zPCr4Md0", "returnUrl": "S7Gwdvru"}' \
    > test.out 2>&1
eval_tap $? 360 'TestWxPayConfig' test.out

#- 361 TestXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfig \
    --body '{"apiKey": "JDnCNPDS", "flowCompletionUrl": "CUwIIdKy", "merchantId": 75, "projectId": 43, "projectSecretKey": "QpzQVYZn"}' \
    > test.out 2>&1
eval_tap $? 361 'TestXsollaConfig' test.out

#- 362 GetPaymentMerchantConfig1
./ng net.accelbyte.sdk.cli.Main platform getPaymentMerchantConfig1 \
    --id 'UEMttNMT' \
    > test.out 2>&1
eval_tap $? 362 'GetPaymentMerchantConfig1' test.out

#- 363 UpdateAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform updateAdyenConfig \
    --id 'GtpFoOHk' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethods": ["bYqj3GUR", "mbc6afPm", "VaAagFUF"], "apiKey": "elZAiteF", "authoriseAsCapture": true, "blockedPaymentMethods": ["zB9IMIfk", "hnWMlOzR", "ipRcDsOw"], "clientKey": "ianBFCPh", "dropInSettings": "0HXA2bEn", "liveEndpointUrlPrefix": "NJ6GI5L9", "merchantAccount": "np0AgqVX", "notificationHmacKey": "6DSXenW2", "notificationPassword": "8HHDnPZW", "notificationUsername": "5jdXx9Ao", "returnUrl": "kVmLaCJ1", "settings": "dRhRGGff"}' \
    > test.out 2>&1
eval_tap $? 363 'UpdateAdyenConfig' test.out

#- 364 TestAdyenConfigById
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfigById \
    --id 'SNPjEySb' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 364 'TestAdyenConfigById' test.out

#- 365 UpdateAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateAliPayConfig \
    --id '6rvL8HhM' \
    --sandbox  \
    --validate  \
    --body '{"appId": "PTw6JZUr", "privateKey": "2u7s7wZU", "publicKey": "CRppXz5Y", "returnUrl": "Crwc0ZgR"}' \
    > test.out 2>&1
eval_tap $? 365 'UpdateAliPayConfig' test.out

#- 366 TestAliPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfigById \
    --id 'E8Y6dCkG' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 366 'TestAliPayConfigById' test.out

#- 367 UpdateCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform updateCheckoutConfig \
    --id 'GsSfjnts' \
    --sandbox  \
    --validate  \
    --body '{"publicKey": "L0wm7qzc", "secretKey": "MDjy32D0"}' \
    > test.out 2>&1
eval_tap $? 367 'UpdateCheckoutConfig' test.out

#- 368 TestCheckoutConfigById
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfigById \
    --id 'meyTXZUO' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 368 'TestCheckoutConfigById' test.out

#- 369 UpdateNeonPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateNeonPayConfig \
    --id 'Tokan13t' \
    --sandbox  \
    --validate  \
    --body '{"apiKey": "bK746SoF", "webhookSecretKey": "PYnAmTKi"}' \
    > test.out 2>&1
eval_tap $? 369 'UpdateNeonPayConfig' test.out

#- 370 TestNeonPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testNeonPayConfigById \
    --id 'cVZkH4CE' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 370 'TestNeonPayConfigById' test.out

#- 371 UpdatePayPalConfig
./ng net.accelbyte.sdk.cli.Main platform updatePayPalConfig \
    --id 'KvndTfAJ' \
    --sandbox  \
    --validate  \
    --body '{"clientID": "qRROVzMl", "clientSecret": "Fj3NpmVK", "returnUrl": "d1U2Oj6D", "webHookId": "Ue9bhBBI"}' \
    > test.out 2>&1
eval_tap $? 371 'UpdatePayPalConfig' test.out

#- 372 TestPayPalConfigById
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfigById \
    --id 'XwPUEHzK' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 372 'TestPayPalConfigById' test.out

#- 373 UpdateStripeConfig
./ng net.accelbyte.sdk.cli.Main platform updateStripeConfig \
    --id 'H5Wk3msr' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethodTypes": ["Dkc7OcxY", "oPVuWwje", "W5sfA1tl"], "publishableKey": "TrMEhwL8", "secretKey": "lSh7xqIA", "webhookSecret": "jmaQCml6"}' \
    > test.out 2>&1
eval_tap $? 373 'UpdateStripeConfig' test.out

#- 374 TestStripeConfigById
./ng net.accelbyte.sdk.cli.Main platform testStripeConfigById \
    --id '6T7Kit6e' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 374 'TestStripeConfigById' test.out

#- 375 UpdateWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfig \
    --id 'kevNZawj' \
    --validate  \
    --body '{"appId": "LYTeelDt", "key": "aCo7qLlt", "mchid": "bHMPaBdU", "returnUrl": "mLMFgAn5"}' \
    > test.out 2>&1
eval_tap $? 375 'UpdateWxPayConfig' test.out

#- 376 UpdateWxPayConfigCert
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfigCert \
    --id 'ywDh78Em' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 376 'UpdateWxPayConfigCert' test.out

#- 377 TestWxPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfigById \
    --id 'DxSJXR58' \
    > test.out 2>&1
eval_tap $? 377 'TestWxPayConfigById' test.out

#- 378 UpdateXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaConfig \
    --id 'Fzpo8am3' \
    --validate  \
    --body '{"apiKey": "3BafuGmj", "flowCompletionUrl": "9E1a2qWg", "merchantId": 78, "projectId": 10, "projectSecretKey": "cu6JarZL"}' \
    > test.out 2>&1
eval_tap $? 378 'UpdateXsollaConfig' test.out

#- 379 TestXsollaConfigById
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfigById \
    --id 'c7tdpq06' \
    > test.out 2>&1
eval_tap $? 379 'TestXsollaConfigById' test.out

#- 380 UpdateXsollaUIConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaUIConfig \
    --id 'oI6tnLEa' \
    --body '{"device": "MOBILE", "showCloseButton": true, "size": "LARGE", "theme": "DEFAULT"}' \
    > test.out 2>&1
eval_tap $? 380 'UpdateXsollaUIConfig' test.out

#- 381 QueryPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform queryPaymentProviderConfig \
    --limit '67' \
    --namespace "$AB_NAMESPACE" \
    --offset '85' \
    --region 'xsgGwf0N' \
    > test.out 2>&1
eval_tap $? 381 'QueryPaymentProviderConfig' test.out

#- 382 CreatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform createPaymentProviderConfig \
    --body '{"aggregate": "NEONPAY", "namespace": "fOaFost7", "region": "2S8muwP7", "sandboxTaxJarApiToken": "jTIhjhMq", "specials": ["XSOLLA", "ADYEN", "NEONPAY"], "taxJarApiToken": "JkkGobFS", "taxJarEnabled": false, "useGlobalTaxJarApiToken": false}' \
    > test.out 2>&1
eval_tap $? 382 'CreatePaymentProviderConfig' test.out

#- 383 GetAggregatePaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getAggregatePaymentProviders \
    > test.out 2>&1
eval_tap $? 383 'GetAggregatePaymentProviders' test.out

#- 384 DebugMatchedPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentProviderConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'vs9aK6bx' \
    > test.out 2>&1
eval_tap $? 384 'DebugMatchedPaymentProviderConfig' test.out

#- 385 GetSpecialPaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getSpecialPaymentProviders \
    > test.out 2>&1
eval_tap $? 385 'GetSpecialPaymentProviders' test.out

#- 386 UpdatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentProviderConfig \
    --id 'QJXtg5gt' \
    --body '{"aggregate": "STRIPE", "namespace": "FZCgdy0c", "region": "k1gPjrR6", "sandboxTaxJarApiToken": "qa1u002g", "specials": ["STRIPE", "ADYEN", "XSOLLA"], "taxJarApiToken": "Gzcda7fx", "taxJarEnabled": true, "useGlobalTaxJarApiToken": true}' \
    > test.out 2>&1
eval_tap $? 386 'UpdatePaymentProviderConfig' test.out

#- 387 DeletePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform deletePaymentProviderConfig \
    --id 'QtxCvNfP' \
    > test.out 2>&1
eval_tap $? 387 'DeletePaymentProviderConfig' test.out

#- 388 GetPaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxConfig \
    > test.out 2>&1
eval_tap $? 388 'GetPaymentTaxConfig' test.out

#- 389 UpdatePaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentTaxConfig \
    --body '{"sandboxTaxJarApiToken": "EEVnU0KK", "taxJarApiToken": "dLEvXQp2", "taxJarEnabled": true, "taxJarProductCodesMapping": {"7nmRjfoa": "z97bgK85", "8Jhk1bwf": "xlJ6tZoI", "pQ6zWK95": "fBuUBA6K"}}' \
    > test.out 2>&1
eval_tap $? 389 'UpdatePaymentTaxConfig' test.out

#- 390 SyncPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform syncPaymentOrders \
    --nextEvaluatedKey 'qi1CZWFU' \
    --end 'HhFZBLtg' \
    --start 'PyYBAZOw' \
    > test.out 2>&1
eval_tap $? 390 'SyncPaymentOrders' test.out

#- 391 PublicGetRootCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetRootCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'VsmIcN4j' \
    --storeId 'lhoepU0O' \
    > test.out 2>&1
eval_tap $? 391 'PublicGetRootCategories' test.out

#- 392 DownloadCategories
./ng net.accelbyte.sdk.cli.Main platform downloadCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'WV7SXH0P' \
    --storeId 'psRpXpJU' \
    > test.out 2>&1
eval_tap $? 392 'DownloadCategories' test.out

#- 393 PublicGetCategory
./ng net.accelbyte.sdk.cli.Main platform publicGetCategory \
    --categoryPath 'tPPnHjD3' \
    --namespace "$AB_NAMESPACE" \
    --language 'eursgsME' \
    --storeId 'm7auW4X1' \
    > test.out 2>&1
eval_tap $? 393 'PublicGetCategory' test.out

#- 394 PublicGetChildCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetChildCategories \
    --categoryPath 'pqk6HB2d' \
    --namespace "$AB_NAMESPACE" \
    --language 'S8EgEWgR' \
    --storeId 'eCKuWlSY' \
    > test.out 2>&1
eval_tap $? 394 'PublicGetChildCategories' test.out

#- 395 PublicGetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetDescendantCategories \
    --categoryPath 'n8kV7JgE' \
    --namespace "$AB_NAMESPACE" \
    --language 'rTay8CC7' \
    --storeId 'ZK5eLqOg' \
    > test.out 2>&1
eval_tap $? 395 'PublicGetDescendantCategories' test.out

#- 396 PublicListCurrencies
./ng net.accelbyte.sdk.cli.Main platform publicListCurrencies \
    --namespace "$AB_NAMESPACE" \
    --currencyType 'VIRTUAL' \
    > test.out 2>&1
eval_tap $? 396 'PublicListCurrencies' test.out

#- 397 GeDLCDurableRewardShortMap
./ng net.accelbyte.sdk.cli.Main platform geDLCDurableRewardShortMap \
    --namespace "$AB_NAMESPACE" \
    --dlcType 'OCULUS' \
    > test.out 2>&1
eval_tap $? 397 'GeDLCDurableRewardShortMap' test.out

#- 398 GetAppleConfigVersion
./ng net.accelbyte.sdk.cli.Main platform getAppleConfigVersion \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 398 'GetAppleConfigVersion' test.out

#- 399 GetIAPItemMapping
./ng net.accelbyte.sdk.cli.Main platform getIAPItemMapping \
    --namespace "$AB_NAMESPACE" \
    --platform 'XBOX' \
    > test.out 2>&1
eval_tap $? 399 'GetIAPItemMapping' test.out

#- 400 PublicGetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --language 'uW1ycRaF' \
    --region '37zTWibR' \
    --storeId 'mtOF9Ex7' \
    --appId 'AV8OTaKJ' \
    > test.out 2>&1
eval_tap $? 400 'PublicGetItemByAppId' test.out

#- 401 PublicQueryItems
./ng net.accelbyte.sdk.cli.Main platform publicQueryItems \
    --namespace "$AB_NAMESPACE" \
    --appType 'DEMO' \
    --autoCalcEstimatedPrice  \
    --baseAppId 'ofothwP3' \
    --categoryPath 'XRrjjhZI' \
    --features 'Ehybf97C' \
    --includeSubCategoryItem  \
    --itemType 'COINS' \
    --language 'cgcRVs0B' \
    --limit '55' \
    --offset '34' \
    --region 'lpfxuDkh' \
    --sortBy 'updatedAt:desc,displayOrder,createdAt:desc' \
    --storeId '40QWRj12' \
    --tags 'DfFOLjXF' \
    > test.out 2>&1
eval_tap $? 401 'PublicQueryItems' test.out

#- 402 PublicGetItemBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetItemBySku \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'DY6hqFRg' \
    --region 'N6MLpf39' \
    --storeId 'J4V7wNM0' \
    --sku 'EbPOGLIB' \
    > test.out 2>&1
eval_tap $? 402 'PublicGetItemBySku' test.out

#- 403 PublicGetEstimatedPrice
./ng net.accelbyte.sdk.cli.Main platform publicGetEstimatedPrice \
    --namespace "$AB_NAMESPACE" \
    --region 'P3ztOyRg' \
    --storeId '0dymSmXA' \
    --itemIds '08YicsuM' \
    > test.out 2>&1
eval_tap $? 403 'PublicGetEstimatedPrice' test.out

#- 404 PublicBulkGetItems
./ng net.accelbyte.sdk.cli.Main platform publicBulkGetItems \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'ZmoUO8Fo' \
    --region '5DIuQYwq' \
    --storeId 'LrIgTmsS' \
    --itemIds 'ixsJJdSW' \
    > test.out 2>&1
eval_tap $? 404 'PublicBulkGetItems' test.out

#- 405 PublicValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform publicValidateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --body '{"itemIds": ["rVs3Oodu", "FwcP97e8", "K0YTPJDS"]}' \
    > test.out 2>&1
eval_tap $? 405 'PublicValidateItemPurchaseCondition' test.out

#- 406 PublicSearchItems
./ng net.accelbyte.sdk.cli.Main platform publicSearchItems \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --itemType 'COINS' \
    --limit '31' \
    --offset '20' \
    --region 'cnSTmOy4' \
    --storeId 'e3O5UGkz' \
    --keyword 'rtd4W7hn' \
    --language 'E8aGbU7P' \
    > test.out 2>&1
eval_tap $? 406 'PublicSearchItems' test.out

#- 407 PublicGetApp
./ng net.accelbyte.sdk.cli.Main platform publicGetApp \
    --itemId 'vQBvjvTr' \
    --namespace "$AB_NAMESPACE" \
    --language 'NnxGB7se' \
    --region 's7zBBYkh' \
    --storeId 'kN1hYm1S' \
    > test.out 2>&1
eval_tap $? 407 'PublicGetApp' test.out

#- 408 PublicGetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform publicGetItemDynamicData \
    --itemId '2k3ibcll' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 408 'PublicGetItemDynamicData' test.out

#- 409 PublicGetItem
./ng net.accelbyte.sdk.cli.Main platform publicGetItem \
    --itemId 'zTAAglAS' \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'QSVOq1dO' \
    --populateBundle  \
    --region 'jVe6K6hp' \
    --storeId 'gjRdbycF' \
    > test.out 2>&1
eval_tap $? 409 'PublicGetItem' test.out

#- 410 GetPaymentCustomization
eval_tap 0 410 'GetPaymentCustomization # SKIP deprecated' test.out

#- 411 PublicGetPaymentUrl
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentUrl \
    --namespace "$AB_NAMESPACE" \
    --body '{"neonPayConfig": {"cancelUrl": "5aWnX1H7", "successUrl": "5grQ3Z27"}, "paymentOrderNo": "H1FxWF44", "paymentProvider": "CHECKOUT", "returnUrl": "DQXJPt0k", "ui": "HQA6UvYG", "zipCode": "jkWJrbDc"}' \
    > test.out 2>&1
eval_tap $? 411 'PublicGetPaymentUrl' test.out

#- 412 PublicGetPaymentMethods
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentMethods \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'nl4vmvOK' \
    > test.out 2>&1
eval_tap $? 412 'PublicGetPaymentMethods' test.out

#- 413 PublicGetUnpaidPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUnpaidPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'wAcoPAvM' \
    > test.out 2>&1
eval_tap $? 413 'PublicGetUnpaidPaymentOrder' test.out

#- 414 Pay
./ng net.accelbyte.sdk.cli.Main platform pay \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'O1E6cQo2' \
    --paymentProvider 'ALIPAY' \
    --zipCode 'N4nzJeS1' \
    --body '{"token": "fUtQ0gr9"}' \
    > test.out 2>&1
eval_tap $? 414 'Pay' test.out

#- 415 PublicCheckPaymentOrderPaidStatus
./ng net.accelbyte.sdk.cli.Main platform publicCheckPaymentOrderPaidStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'HixaxKtT' \
    > test.out 2>&1
eval_tap $? 415 'PublicCheckPaymentOrderPaidStatus' test.out

#- 416 GetPaymentPublicConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentPublicConfig \
    --namespace "$AB_NAMESPACE" \
    --sandbox  \
    --paymentProvider 'PAYPAL' \
    --region 'gOX0alQy' \
    > test.out 2>&1
eval_tap $? 416 'GetPaymentPublicConfig' test.out

#- 417 PublicGetQRCode
./ng net.accelbyte.sdk.cli.Main platform publicGetQRCode \
    --namespace "$AB_NAMESPACE" \
    --code 'wXju8dSj' \
    > test.out 2>&1
eval_tap $? 417 'PublicGetQRCode' test.out

#- 418 PublicNormalizePaymentReturnUrl
./ng net.accelbyte.sdk.cli.Main platform publicNormalizePaymentReturnUrl \
    --namespace "$AB_NAMESPACE" \
    --payerID 'KMo08ZC5' \
    --foreinginvoice 'Nguqjvan' \
    --invoiceId 'scMjWb4O' \
    --payload '26lvKZK4' \
    --redirectResult 'ZY1100dD' \
    --resultCode 'EIfL4Oxo' \
    --sessionId 'nsVin65J' \
    --status 'KIQaGz4a' \
    --token '8qBxw5qC' \
    --type 'Rh7y30Pp' \
    --userId 'i6y7LKcw' \
    --orderNo '8EIBsdYe' \
    --paymentOrderNo 'cm90UGGx' \
    --paymentProvider 'PAYPAL' \
    --returnUrl 'fIpNJpIu' \
    > test.out 2>&1
eval_tap $? 418 'PublicNormalizePaymentReturnUrl' test.out

#- 419 GetPaymentTaxValue
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxValue \
    --namespace "$AB_NAMESPACE" \
    --zipCode 'BZmzC2iY' \
    --paymentOrderNo 'Ws3vRKbE' \
    --paymentProvider 'STRIPE' \
    > test.out 2>&1
eval_tap $? 419 'GetPaymentTaxValue' test.out

#- 420 GetRewardByCode
./ng net.accelbyte.sdk.cli.Main platform getRewardByCode \
    --namespace "$AB_NAMESPACE" \
    --rewardCode 'NFJBjUXp' \
    > test.out 2>&1
eval_tap $? 420 'GetRewardByCode' test.out

#- 421 QueryRewards1
./ng net.accelbyte.sdk.cli.Main platform queryRewards1 \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'fglKvNII' \
    --limit '2' \
    --offset '47' \
    --sortBy 'namespace:desc,rewardCode,rewardCode:asc' \
    > test.out 2>&1
eval_tap $? 421 'QueryRewards1' test.out

#- 422 GetReward1
./ng net.accelbyte.sdk.cli.Main platform getReward1 \
    --namespace "$AB_NAMESPACE" \
    --rewardId '6BfspLkx' \
    > test.out 2>&1
eval_tap $? 422 'GetReward1' test.out

#- 423 PublicListStores
./ng net.accelbyte.sdk.cli.Main platform publicListStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 423 'PublicListStores' test.out

#- 424 PublicExistsAnyMyActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyMyActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --appIds 'IZnOE04n,elfOIV4G,8NCPVFdk' \
    --itemIds 'PWspSLYM,5Gw8Nn3v,yyfvaqVU' \
    --skus 'ZEtUF8PW,HlFX5vJM,NQC792TH' \
    > test.out 2>&1
eval_tap $? 424 'PublicExistsAnyMyActiveEntitlement' test.out

#- 425 PublicGetMyAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --appId 'jtI8YSDy' \
    > test.out 2>&1
eval_tap $? 425 'PublicGetMyAppEntitlementOwnershipByAppId' test.out

#- 426 PublicGetMyEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'SUBSCRIPTION' \
    --itemId 'yqzbOVTh' \
    > test.out 2>&1
eval_tap $? 426 'PublicGetMyEntitlementOwnershipByItemId' test.out

#- 427 PublicGetMyEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'MEDIA' \
    --sku 'bEEpBaXz' \
    > test.out 2>&1
eval_tap $? 427 'PublicGetMyEntitlementOwnershipBySku' test.out

#- 428 PublicGetEntitlementOwnershipToken
./ng net.accelbyte.sdk.cli.Main platform publicGetEntitlementOwnershipToken \
    --namespace "$AB_NAMESPACE" \
    --appIds 'Xq89oKP5,N7YNmw3I,3cQ1RqY5' \
    --itemIds 'CJNz7YaK,gCTiHX16,vGKbCX34' \
    --skus '7Emztnd5,rKsAXdT2,SYc8bSca' \
    > test.out 2>&1
eval_tap $? 428 'PublicGetEntitlementOwnershipToken' test.out

#- 429 SyncTwitchDropsEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement \
    --namespace "$AB_NAMESPACE" \
    --body '{"gameId": "8YBJaC8l", "language": "yilK_796", "region": "J1npXdMN"}' \
    > test.out 2>&1
eval_tap $? 429 'SyncTwitchDropsEntitlement' test.out

#- 430 PublicGetMyWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetMyWallet \
    --currencyCode 'KgIiBOmc' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 430 'PublicGetMyWallet' test.out

#- 431 SyncEpicGameDLC
./ng net.accelbyte.sdk.cli.Main platform syncEpicGameDLC \
    --namespace "$AB_NAMESPACE" \
    --userId '6f6hvkP1' \
    --body '{"epicGamesJwtToken": "4ysArG9W"}' \
    > test.out 2>&1
eval_tap $? 431 'SyncEpicGameDLC' test.out

#- 432 SyncOculusDLC
./ng net.accelbyte.sdk.cli.Main platform syncOculusDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'fd47wdYd' \
    > test.out 2>&1
eval_tap $? 432 'SyncOculusDLC' test.out

#- 433 PublicSyncPsnDlcInventory
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventory \
    --namespace "$AB_NAMESPACE" \
    --userId '6W2J6v7R' \
    --body '{"serviceLabel": 43}' \
    > test.out 2>&1
eval_tap $? 433 'PublicSyncPsnDlcInventory' test.out

#- 434 PublicSyncPsnDlcInventoryWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventoryWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'Zq5hfPbA' \
    --body '{"serviceLabels": [73, 84, 22]}' \
    > test.out 2>&1
eval_tap $? 434 'PublicSyncPsnDlcInventoryWithMultipleServiceLabels' test.out

#- 435 SyncSteamDLC
./ng net.accelbyte.sdk.cli.Main platform syncSteamDLC \
    --namespace "$AB_NAMESPACE" \
    --userId '2YlSaeTK' \
    --body '{"appId": "Nt4UsQzN", "steamId": "SpiRkR9W"}' \
    > test.out 2>&1
eval_tap $? 435 'SyncSteamDLC' test.out

#- 436 SyncXboxDLC
./ng net.accelbyte.sdk.cli.Main platform syncXboxDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'aTW5Io4A' \
    --body '{"xstsToken": "KbKloxe4"}' \
    > test.out 2>&1
eval_tap $? 436 'SyncXboxDLC' test.out

#- 437 PublicQueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'liuaDuFJ' \
    --appType 'SOFTWARE' \
    --entitlementClazz 'APP' \
    --entitlementName 'edjS1Lqd' \
    --features 'ZacBvWF4,rtGNpm50,qYUF4o3I' \
    --itemId 'xvkg01UW,zdTP6JPy,YjNf9uN8' \
    --limit '20' \
    --offset '69' \
    > test.out 2>&1
eval_tap $? 437 'PublicQueryUserEntitlements' test.out

#- 438 PublicGetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'SeEBGTM2' \
    --appId 'OyGczTJ0' \
    > test.out 2>&1
eval_tap $? 438 'PublicGetUserAppEntitlementByAppId' test.out

#- 439 PublicQueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'QnjmceKB' \
    --limit '48' \
    --offset '63' \
    --appType 'GAME' \
    > test.out 2>&1
eval_tap $? 439 'PublicQueryUserEntitlementsByAppType' test.out

#- 440 PublicGetUserEntitlementsByIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementsByIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'ywnbsx3o' \
    --availablePlatformOnly  \
    --ids '5RAw35TY,PL9Y1UIO,5dXc66LW' \
    > test.out 2>&1
eval_tap $? 440 'PublicGetUserEntitlementsByIds' test.out

#- 441 PublicGetUserEntitlementByItemId
eval_tap 0 441 'PublicGetUserEntitlementByItemId # SKIP deprecated' test.out

#- 442 PublicGetUserEntitlementBySku
eval_tap 0 442 'PublicGetUserEntitlementBySku # SKIP deprecated' test.out

#- 443 PublicUserEntitlementHistory
./ng net.accelbyte.sdk.cli.Main platform publicUserEntitlementHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'fHqdd6KM' \
    --endDate 'KndK1hPU' \
    --entitlementClazz 'MEDIA' \
    --limit '91' \
    --offset '11' \
    --startDate 'cG9CGDqi' \
    > test.out 2>&1
eval_tap $? 443 'PublicUserEntitlementHistory' test.out

#- 444 PublicExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'hDpqx4Ly' \
    --appIds 'rHnmAn7Q,rXqxpDBy,OvoLCmka' \
    --itemIds 'cFM1jTbl,JuQ8iYya,HqsSKGi1' \
    --skus 'Qnb2Vz2u,0dSVcbor,NtxsAVSG' \
    > test.out 2>&1
eval_tap $? 444 'PublicExistsAnyUserActiveEntitlement' test.out

#- 445 PublicGetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ecsos54b' \
    --appId 's5jX9Fnv' \
    > test.out 2>&1
eval_tap $? 445 'PublicGetUserAppEntitlementOwnershipByAppId' test.out

#- 446 PublicGetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'JeXc9Xyl' \
    --entitlementClazz 'APP' \
    --itemId '1jTcAUyG' \
    > test.out 2>&1
eval_tap $? 446 'PublicGetUserEntitlementOwnershipByItemId' test.out

#- 447 PublicGetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'O5m0kg42' \
    --ids 'lYe8tE6n,a9Zo6Yal,fdBxao6J' \
    > test.out 2>&1
eval_tap $? 447 'PublicGetUserEntitlementOwnershipByItemIds' test.out

#- 448 PublicGetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'IYFV16fT' \
    --entitlementClazz 'MEDIA' \
    --sku 'au6wxgYt' \
    > test.out 2>&1
eval_tap $? 448 'PublicGetUserEntitlementOwnershipBySku' test.out

#- 449 PublicGetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlement \
    --entitlementId 'nfq5OyAx' \
    --namespace "$AB_NAMESPACE" \
    --userId '2d5cR426' \
    > test.out 2>&1
eval_tap $? 449 'PublicGetUserEntitlement' test.out

#- 450 PublicConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicConsumeUserEntitlement \
    --entitlementId '2vg1gRpm' \
    --namespace "$AB_NAMESPACE" \
    --userId '9tZhUFU2' \
    --body '{"metadata": {"operationSource": "INVENTORY"}, "options": ["kcKiZtM2", "bxtmePr7", "isjHemtG"], "requestId": "wvMiTnJt", "useCount": 8}' \
    > test.out 2>&1
eval_tap $? 450 'PublicConsumeUserEntitlement' test.out

#- 451 PublicSellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicSellUserEntitlement \
    --entitlementId 'cTCtSpKw' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Mnx5wW9c' \
    --body '{"requestId": "3gFXOP50", "useCount": 9}' \
    > test.out 2>&1
eval_tap $? 451 'PublicSellUserEntitlement' test.out

#- 452 PublicSplitUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicSplitUserEntitlement \
    --entitlementId 'V0UbvDw3' \
    --namespace "$AB_NAMESPACE" \
    --userId 'hV9NLJqf' \
    --body '{"metadata": {"operationSource": "INVENTORY"}, "useCount": 78}' \
    > test.out 2>&1
eval_tap $? 452 'PublicSplitUserEntitlement' test.out

#- 453 PublicTransferUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicTransferUserEntitlement \
    --entitlementId '4Xv5QI1R' \
    --namespace "$AB_NAMESPACE" \
    --userId 'HAhaODR9' \
    --body '{"entitlementId": "AS62equC", "metadata": {"operationSource": "INVENTORY"}, "useCount": 30}' \
    > test.out 2>&1
eval_tap $? 453 'PublicTransferUserEntitlement' test.out

#- 454 PublicRedeemCode
./ng net.accelbyte.sdk.cli.Main platform publicRedeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'WF4RrnOw' \
    --body '{"code": "GCXVCvt0", "language": "Qq_TBzf_if", "region": "2tK9y7pl"}' \
    > test.out 2>&1
eval_tap $? 454 'PublicRedeemCode' test.out

#- 455 PublicFulfillAppleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillAppleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'hLZ44CyZ' \
    --body '{"excludeOldTransactions": true, "language": "kUx-TWLY-214", "productId": "D9MheUz4", "receiptData": "QebvIUlR", "region": "8BJyA2xT", "transactionId": "lRUL7wAk"}' \
    > test.out 2>&1
eval_tap $? 455 'PublicFulfillAppleIAPItem' test.out

#- 456 SyncEpicGamesInventory
./ng net.accelbyte.sdk.cli.Main platform syncEpicGamesInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'aIPtnwTB' \
    --body '{"epicGamesJwtToken": "RGP3LJwa"}' \
    > test.out 2>&1
eval_tap $? 456 'SyncEpicGamesInventory' test.out

#- 457 PublicFulfillGoogleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillGoogleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId '41NDIeif' \
    --body '{"autoAck": false, "autoConsume": false, "language": "hQ-cP", "orderId": "fR02VkoF", "packageName": "EhUKmtOs", "productId": "vOtxwZA6", "purchaseTime": 79, "purchaseToken": "LLVrTKFt", "region": "0Tb2kKNX", "subscriptionPurchase": false}' \
    > test.out 2>&1
eval_tap $? 457 'PublicFulfillGoogleIAPItem' test.out

#- 458 SyncOculusConsumableEntitlements
./ng net.accelbyte.sdk.cli.Main platform syncOculusConsumableEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'HPqfTpYM' \
    > test.out 2>&1
eval_tap $? 458 'SyncOculusConsumableEntitlements' test.out

#- 459 PublicReconcilePlayStationStore
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStore \
    --namespace "$AB_NAMESPACE" \
    --userId 'z0Wqe2dA' \
    --body '{"currencyCode": "ojMRBM6U", "price": 0.2931792422137025, "productId": "bPSMZBpv", "serviceLabel": 66}' \
    > test.out 2>&1
eval_tap $? 459 'PublicReconcilePlayStationStore' test.out

#- 460 PublicReconcilePlayStationStoreWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStoreWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'DIdy2JMc' \
    --body '{"currencyCode": "5yb4rz5u", "price": 0.1341573230901475, "productId": "a5zN7gQg", "serviceLabels": [75, 20, 78]}' \
    > test.out 2>&1
eval_tap $? 460 'PublicReconcilePlayStationStoreWithMultipleServiceLabels' test.out

#- 461 SyncSteamInventory
./ng net.accelbyte.sdk.cli.Main platform syncSteamInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'Bb1cEBE0' \
    --body '{"appId": "7vNNwv5M", "currencyCode": "wD4HPCtI", "language": "qSRP-ZhEY_fi", "price": 0.3191051552591009, "productId": "tfvq6bvY", "region": "pq81J7gL", "steamId": "RONvcyTm"}' \
    > test.out 2>&1
eval_tap $? 461 'SyncSteamInventory' test.out

#- 462 SyncSteamAbnormalTransaction
./ng net.accelbyte.sdk.cli.Main platform syncSteamAbnormalTransaction \
    --namespace "$AB_NAMESPACE" \
    --userId 'AvwM4kkk' \
    > test.out 2>&1
eval_tap $? 462 'SyncSteamAbnormalTransaction' test.out

#- 463 SyncSteamIAPByTransaction
./ng net.accelbyte.sdk.cli.Main platform syncSteamIAPByTransaction \
    --namespace "$AB_NAMESPACE" \
    --userId 'WX2E0ZFe' \
    --body '{"orderId": "dqUirD1g"}' \
    > test.out 2>&1
eval_tap $? 463 'SyncSteamIAPByTransaction' test.out

#- 464 PublicQueryUserThirdPartySubscription
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserThirdPartySubscription \
    --namespace "$AB_NAMESPACE" \
    --platform 'TWITCH' \
    --userId 'UwVp2KTt' \
    --activeOnly  \
    --groupId 'VlOooaFC' \
    --limit '3' \
    --offset '4' \
    --productId 'IMLWboU2' \
    > test.out 2>&1
eval_tap $? 464 'PublicQueryUserThirdPartySubscription' test.out

#- 465 SyncTwitchDropsEntitlement1
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'F3Jhtsnp' \
    --body '{"gameId": "D40QYxXK", "language": "zk", "region": "28zCE3iv"}' \
    > test.out 2>&1
eval_tap $? 465 'SyncTwitchDropsEntitlement1' test.out

#- 466 SyncXboxInventory
./ng net.accelbyte.sdk.cli.Main platform syncXboxInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'c5L0QIW4' \
    --body '{"currencyCode": "dn40C0cs", "price": 0.9507699741970451, "productId": "NZo3DQgM", "xstsToken": "cz9cq1tk"}' \
    > test.out 2>&1
eval_tap $? 466 'SyncXboxInventory' test.out

#- 467 PublicQueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'a1X6xtC4' \
    --discounted  \
    --itemId 'tELanbGH' \
    --limit '22' \
    --offset '87' \
    --status 'CHARGED' \
    > test.out 2>&1
eval_tap $? 467 'PublicQueryUserOrders' test.out

#- 468 PublicCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'yVwDqYtD' \
    --body '{"currencyCode": "vqGVIijG", "discountCodes": ["m7Hmy516", "VQg4KA6p", "Tc9WlZJx"], "discountedPrice": 96, "ext": {"zDOYeEpU": {}, "0s9327dr": {}, "sUdPHVnc": {}}, "itemId": "FO0JehBV", "language": "nyq", "price": 70, "quantity": 23, "region": "JgDrvZ9T", "returnUrl": "m8bT0CI3", "sectionId": "ztdCaZUa"}' \
    > test.out 2>&1
eval_tap $? 468 'PublicCreateUserOrder' test.out

#- 469 PublicPreviewOrderPrice
./ng net.accelbyte.sdk.cli.Main platform publicPreviewOrderPrice \
    --namespace "$AB_NAMESPACE" \
    --userId 'W6mBmZQ3' \
    --body '{"currencyCode": "NiPlc7lf", "discountCodes": ["svWYW9oo", "PqA4Sfnc", "ybsDqj2h"], "discountedPrice": 91, "itemId": "mndIqIgF", "price": 87, "quantity": 55}' \
    > test.out 2>&1
eval_tap $? 469 'PublicPreviewOrderPrice' test.out

#- 470 PublicGetUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'j40vi8ND' \
    --userId 'T9T923Cs' \
    > test.out 2>&1
eval_tap $? 470 'PublicGetUserOrder' test.out

#- 471 PublicCancelUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCancelUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'B945xw5V' \
    --userId 'MQMGclyL' \
    > test.out 2>&1
eval_tap $? 471 'PublicCancelUserOrder' test.out

#- 472 PublicGetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'EFyuu3MO' \
    --userId 'tP3ADYzx' \
    > test.out 2>&1
eval_tap $? 472 'PublicGetUserOrderHistories' test.out

#- 473 PublicDownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform publicDownloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'eXAReUf8' \
    --userId 'dgeojVyT' \
    > test.out 2>&1
eval_tap $? 473 'PublicDownloadUserOrderReceipt' test.out

#- 474 PublicGetPaymentAccounts
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId '9VOvUrXr' \
    > test.out 2>&1
eval_tap $? 474 'PublicGetPaymentAccounts' test.out

#- 475 PublicDeletePaymentAccount
./ng net.accelbyte.sdk.cli.Main platform publicDeletePaymentAccount \
    --id 'ReH6zHDi' \
    --namespace "$AB_NAMESPACE" \
    --type 'paypal' \
    --userId 'gMYOXTT8' \
    > test.out 2>&1
eval_tap $? 475 'PublicDeletePaymentAccount' test.out

#- 476 PublicListActiveSections
./ng net.accelbyte.sdk.cli.Main platform publicListActiveSections \
    --namespace "$AB_NAMESPACE" \
    --userId 'QvvXw2vo' \
    --autoCalcEstimatedPrice  \
    --language 'QIwml1Qp' \
    --region 'D2gN2nxA' \
    --storeId 'zJNrXZGr' \
    --viewId '1TjKovqA' \
    > test.out 2>&1
eval_tap $? 476 'PublicListActiveSections' test.out

#- 477 PublicQueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'pvC8bhae' \
    --chargeStatus 'SETUP' \
    --itemId 'q50HHnJp' \
    --limit '21' \
    --offset '25' \
    --sku '7Pqj2tVN' \
    --status 'EXPIRED' \
    --subscribedBy 'PLATFORM' \
    > test.out 2>&1
eval_tap $? 477 'PublicQueryUserSubscriptions' test.out

#- 478 PublicSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform publicSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'uFdl5fYo' \
    --body '{"currencyCode": "UF70fcOh", "itemId": "qa6yOfyf", "language": "kd", "region": "HTzYtyJS", "returnUrl": "G1sbqxW5", "source": "T2iuwgKs"}' \
    > test.out 2>&1
eval_tap $? 478 'PublicSubscribeSubscription' test.out

#- 479 PublicCheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform publicCheckUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId '4FPa68gL' \
    --itemId 'EWVKttLY' \
    > test.out 2>&1
eval_tap $? 479 'PublicCheckUserSubscriptionSubscribableByItemId' test.out

#- 480 PublicGetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'NhJKuh2Z' \
    --userId 'G8g16JkS' \
    > test.out 2>&1
eval_tap $? 480 'PublicGetUserSubscription' test.out

#- 481 PublicChangeSubscriptionBillingAccount
./ng net.accelbyte.sdk.cli.Main platform publicChangeSubscriptionBillingAccount \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'vDw6fhnP' \
    --userId 'ju5irEp1' \
    > test.out 2>&1
eval_tap $? 481 'PublicChangeSubscriptionBillingAccount' test.out

#- 482 PublicCancelSubscription
./ng net.accelbyte.sdk.cli.Main platform publicCancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'DjOeJTU5' \
    --userId 'a2FNT8xH' \
    --body '{"immediate": false, "reason": "23h1OlM4"}' \
    > test.out 2>&1
eval_tap $? 482 'PublicCancelSubscription' test.out

#- 483 PublicGetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'm4gIVzVP' \
    --userId 'XNo6cgOy' \
    --excludeFree  \
    --limit '82' \
    --offset '24' \
    > test.out 2>&1
eval_tap $? 483 'PublicGetUserSubscriptionBillingHistories' test.out

#- 484 PublicListViews
./ng net.accelbyte.sdk.cli.Main platform publicListViews \
    --namespace "$AB_NAMESPACE" \
    --userId '6zcIl3km' \
    --language 'WNHX5mJL' \
    --storeId 'AhocyYES' \
    > test.out 2>&1
eval_tap $? 484 'PublicListViews' test.out

#- 485 PublicGetWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetWallet \
    --currencyCode '5wjlJn1R' \
    --namespace "$AB_NAMESPACE" \
    --userId 'De7g4M2b' \
    > test.out 2>&1
eval_tap $? 485 'PublicGetWallet' test.out

#- 486 PublicListUserWalletTransactions
./ng net.accelbyte.sdk.cli.Main platform publicListUserWalletTransactions \
    --currencyCode 'ty08Zd2G' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Z06uFDGd' \
    --limit '21' \
    --offset '71' \
    > test.out 2>&1
eval_tap $? 486 'PublicListUserWalletTransactions' test.out

#- 487 PublicGetMyDLCContent
./ng net.accelbyte.sdk.cli.Main platform publicGetMyDLCContent \
    --includeAllNamespaces  \
    --type 'XBOX' \
    > test.out 2>&1
eval_tap $? 487 'PublicGetMyDLCContent' test.out

#- 488 QueryFulfillments
./ng net.accelbyte.sdk.cli.Main platform queryFulfillments \
    --namespace "$AB_NAMESPACE" \
    --endTime 'gUzbk7oz' \
    --limit '4' \
    --offset '58' \
    --startTime 'JpzcuWwk' \
    --state 'FULFILLED' \
    --transactionId 'PnOXUciL' \
    --userId 'zUGA6fMv' \
    > test.out 2>&1
eval_tap $? 488 'QueryFulfillments' test.out

#- 489 QueryItemsV2
./ng net.accelbyte.sdk.cli.Main platform queryItemsV2 \
    --namespace "$AB_NAMESPACE" \
    --appType 'SOFTWARE' \
    --availableDate 'UgGaIM0T' \
    --baseAppId 'QAosySjO' \
    --categoryPath '7ZZgbQzw' \
    --features 'iQ2lnaUJ' \
    --includeSubCategoryItem  \
    --itemName 'f0MjBFPg' \
    --itemStatus 'ACTIVE' \
    --itemType 'COINS,SEASON,CODE' \
    --limit '71' \
    --offset '52' \
    --region 'UaoQU2Y7' \
    --sectionExclusive  \
    --sortBy 'name:desc,createdAt,displayOrder:asc' \
    --storeId '6lzYZd2R' \
    --tags 'S5ZOtb2R' \
    --targetNamespace '8B0AMnzT' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 489 'QueryItemsV2' test.out

#- 490 ImportStore1
./ng net.accelbyte.sdk.cli.Main platform importStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId '8iCQJTwV' \
    --strictMode  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 490 'ImportStore1' test.out

#- 491 ExportStore1
./ng net.accelbyte.sdk.cli.Main platform exportStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'FyMuttUw' \
    --body '{"itemIds": ["qjswYZ2w", "zkhN4Va1", "yzjNoMsj"]}' \
    > test.out 2>&1
eval_tap $? 491 'ExportStore1' test.out

#- 492 FulfillRewardsV2
./ng net.accelbyte.sdk.cli.Main platform fulfillRewardsV2 \
    --namespace "$AB_NAMESPACE" \
    --userId '6kqGPBVZ' \
    --body '{"entitlementCollectionId": "cheP55VA", "entitlementOrigin": "Epic", "metadata": {"jv1sVgrP": {}, "YKqup42L": {}, "dmIrJyGJ": {}}, "origin": "Xbox", "rewards": [{"currency": {"currencyCode": "9HJCzeJv", "namespace": "Tnp7ggYO"}, "item": {"itemId": "qiBS6nxc", "itemName": "QOj4DE2y", "itemSku": "QQ88FUiH", "itemType": "GXs0TMkh"}, "quantity": 34, "type": "ITEM"}, {"currency": {"currencyCode": "Tmmv2Mf0", "namespace": "e5EfMl1y"}, "item": {"itemId": "u6qY5WRu", "itemName": "7sViZ6gC", "itemSku": "n5nCfsGu", "itemType": "OeDPZGs1"}, "quantity": 45, "type": "CURRENCY"}, {"currency": {"currencyCode": "bO3VFwac", "namespace": "SEIqznx8"}, "item": {"itemId": "FXoOOSh0", "itemName": "l1zh8X1S", "itemSku": "TB2bQ8uR", "itemType": "rLLJExd1"}, "quantity": 63, "type": "ITEM"}], "source": "PURCHASE", "transactionId": "xnvT5xgv"}' \
    > test.out 2>&1
eval_tap $? 492 'FulfillRewardsV2' test.out

#- 493 FulfillItems
eval_tap 0 493 'FulfillItems # SKIP deprecated' test.out

#- 494 RetryFulfillItems
eval_tap 0 494 'RetryFulfillItems # SKIP deprecated' test.out

#- 495 RevokeItems
eval_tap 0 495 'RevokeItems # SKIP deprecated' test.out

#- 496 V2PublicFulfillAppleIAPItem
./ng net.accelbyte.sdk.cli.Main platform v2PublicFulfillAppleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'qyEpR8Sl' \
    --body '{"transactionId": "VGhBIlzW"}' \
    > test.out 2>&1
eval_tap $? 496 'V2PublicFulfillAppleIAPItem' test.out

#- 497 FulfillItemsV3
./ng net.accelbyte.sdk.cli.Main platform fulfillItemsV3 \
    --namespace "$AB_NAMESPACE" \
    --transactionId 'G5Mwu1s1' \
    --userId 'lXn8zFgL' \
    --body '{"items": [{"duration": 27, "endDate": "1978-02-20T00:00:00Z", "entitlementCollectionId": "coOsdDyA", "entitlementOrigin": "Steam", "itemId": "DECenX38", "itemSku": "sUC83uYp", "language": "jqaF1ZmS", "metadata": {"0c9OS8HX": {}, "A6vZqS7r": {}, "7aiBxSal": {}}, "orderNo": "dtDQL4RM", "origin": "System", "quantity": 32, "region": "IRYT4TjB", "source": "PROMOTION", "startDate": "1975-09-20T00:00:00Z", "storeId": "CrRjH1Pd"}, {"duration": 30, "endDate": "1995-08-10T00:00:00Z", "entitlementCollectionId": "cGsO9ZpE", "entitlementOrigin": "Nintendo", "itemId": "v5w9SngJ", "itemSku": "quvJxvyQ", "language": "2Q9yUm63", "metadata": {"tmgAU7l9": {}, "SB78OhtU": {}, "FwT5kP5Q": {}}, "orderNo": "OGgDxvCP", "origin": "Oculus", "quantity": 21, "region": "VJCzJQer", "source": "PURCHASE", "startDate": "1981-04-01T00:00:00Z", "storeId": "RTmND4ZZ"}, {"duration": 95, "endDate": "1984-06-11T00:00:00Z", "entitlementCollectionId": "WGxrJzM4", "entitlementOrigin": "Xbox", "itemId": "8kX0lS1I", "itemSku": "F8aFuuHs", "language": "6QWSZYxV", "metadata": {"dbWDVaSx": {}, "3hPWLo2I": {}, "8BkY0N9K": {}}, "orderNo": "92DQp1at", "origin": "GooglePlay", "quantity": 8, "region": "8VCRLqR2", "source": "CONSUME_ENTITLEMENT", "startDate": "1996-05-23T00:00:00Z", "storeId": "gUZHG7ve"}]}' \
    > test.out 2>&1
eval_tap $? 497 'FulfillItemsV3' test.out

#- 498 RetryFulfillItemsV3
./ng net.accelbyte.sdk.cli.Main platform retryFulfillItemsV3 \
    --namespace "$AB_NAMESPACE" \
    --transactionId '7aZSAZRm' \
    --userId 'FG9Nvmc9' \
    > test.out 2>&1
eval_tap $? 498 'RetryFulfillItemsV3' test.out

#- 499 RevokeItemsV3
./ng net.accelbyte.sdk.cli.Main platform revokeItemsV3 \
    --namespace "$AB_NAMESPACE" \
    --transactionId 'eLuq8nqh' \
    --userId 'Q6wWkNrQ' \
    > test.out 2>&1
eval_tap $? 499 'RevokeItemsV3' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
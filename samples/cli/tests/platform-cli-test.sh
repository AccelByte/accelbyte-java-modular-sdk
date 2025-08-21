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
    --id 'TzYJqwE3' \
    > test.out 2>&1
eval_tap $? 3 'GetFulfillmentScript' test.out

#- 4 CreateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform createFulfillmentScript \
    --id 'n9M42zuB' \
    --body '{"grantDays": "jnwkDQd6"}' \
    > test.out 2>&1
eval_tap $? 4 'CreateFulfillmentScript' test.out

#- 5 DeleteFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform deleteFulfillmentScript \
    --id 'pYdbOGjz' \
    > test.out 2>&1
eval_tap $? 5 'DeleteFulfillmentScript' test.out

#- 6 UpdateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform updateFulfillmentScript \
    --id 'YcSkJa6k' \
    --body '{"grantDays": "cg2GDR4V"}' \
    > test.out 2>&1
eval_tap $? 6 'UpdateFulfillmentScript' test.out

#- 7 ListItemTypeConfigs
./ng net.accelbyte.sdk.cli.Main platform listItemTypeConfigs \
    > test.out 2>&1
eval_tap $? 7 'ListItemTypeConfigs' test.out

#- 8 CreateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform createItemTypeConfig \
    --body '{"clazz": "R1399OLr", "dryRun": true, "fulfillmentUrl": "lmPIvozh", "itemType": "SUBSCRIPTION", "purchaseConditionUrl": "NV4aZ00n"}' \
    > test.out 2>&1
eval_tap $? 8 'CreateItemTypeConfig' test.out

#- 9 SearchItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform searchItemTypeConfig \
    --clazz 'KFUDyzeN' \
    --itemType 'COINS' \
    > test.out 2>&1
eval_tap $? 9 'SearchItemTypeConfig' test.out

#- 10 GetItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform getItemTypeConfig \
    --id 'mLXC6dKi' \
    > test.out 2>&1
eval_tap $? 10 'GetItemTypeConfig' test.out

#- 11 UpdateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform updateItemTypeConfig \
    --id 'pVbXLo5v' \
    --body '{"clazz": "jRKCtcO7", "dryRun": true, "fulfillmentUrl": "EJ0jbWf7", "purchaseConditionUrl": "OtmYhLit"}' \
    > test.out 2>&1
eval_tap $? 11 'UpdateItemTypeConfig' test.out

#- 12 DeleteItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform deleteItemTypeConfig \
    --id 'yvLvrGqG' \
    > test.out 2>&1
eval_tap $? 12 'DeleteItemTypeConfig' test.out

#- 13 QueryCampaigns
./ng net.accelbyte.sdk.cli.Main platform queryCampaigns \
    --namespace "$AB_NAMESPACE" \
    --limit '29' \
    --name 'A1V8xC1J' \
    --offset '29' \
    --tag 'PpoBEmSm' \
    > test.out 2>&1
eval_tap $? 13 'QueryCampaigns' test.out

#- 14 CreateCampaign
./ng net.accelbyte.sdk.cli.Main platform createCampaign \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "7SlIB6HJ", "discountConfig": {"categories": [{"categoryPath": "D2ufporg", "includeSubCategories": true}, {"categoryPath": "1Z2UMnm7", "includeSubCategories": false}, {"categoryPath": "CiwaMiVb", "includeSubCategories": false}], "currencyCode": "hfouGBIP", "currencyNamespace": "Qq72FLWV", "discountAmount": 62, "discountPercentage": 73, "discountType": "AMOUNT", "items": [{"itemId": "OoaL3Rvm", "itemName": "445oTbQb"}, {"itemId": "oCDBCwLL", "itemName": "PQQfrCeA"}, {"itemId": "skS7CHl1", "itemName": "IbzBQ9sL"}], "restrictType": "NONE", "stackable": false}, "items": [{"extraSubscriptionDays": 61, "itemId": "SGvq57mm", "itemName": "p2LcLxtW", "quantity": 59}, {"extraSubscriptionDays": 91, "itemId": "s7bteNQT", "itemName": "dWSkKRJj", "quantity": 23}, {"extraSubscriptionDays": 42, "itemId": "fRR5qOJD", "itemName": "R9elFAEZ", "quantity": 37}], "maxRedeemCountPerCampaignPerUser": 94, "maxRedeemCountPerCode": 31, "maxRedeemCountPerCodePerUser": 62, "maxSaleCount": 51, "name": "DCvwAsJD", "redeemEnd": "1974-06-29T00:00:00Z", "redeemStart": "1991-03-12T00:00:00Z", "redeemType": "DISCOUNT", "status": "INACTIVE", "tags": ["t12UY9sK", "EZQ3O8Dj", "1IG87eL5"], "type": "REDEMPTION"}' \
    > test.out 2>&1
eval_tap $? 14 'CreateCampaign' test.out

#- 15 GetCampaign
./ng net.accelbyte.sdk.cli.Main platform getCampaign \
    --campaignId '1KRcUKIS' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'GetCampaign' test.out

#- 16 UpdateCampaign
./ng net.accelbyte.sdk.cli.Main platform updateCampaign \
    --campaignId 'QMzeDRHD' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "suvBGmlm", "discountConfig": {"categories": [{"categoryPath": "eUACQSsZ", "includeSubCategories": false}, {"categoryPath": "2LYZMW3d", "includeSubCategories": true}, {"categoryPath": "0WanDk4Q", "includeSubCategories": true}], "currencyCode": "aW9N1Oxj", "currencyNamespace": "qUir0uj5", "discountAmount": 9, "discountPercentage": 27, "discountType": "AMOUNT", "items": [{"itemId": "L1IL8piz", "itemName": "Z1JYAXPa"}, {"itemId": "w0fQgAJI", "itemName": "C44FPjHg"}, {"itemId": "PAEWwTif", "itemName": "LxZj3Lfo"}], "restrictType": "NONE", "stackable": false}, "items": [{"extraSubscriptionDays": 32, "itemId": "hErfQhLQ", "itemName": "cSOoi7GM", "quantity": 27}, {"extraSubscriptionDays": 96, "itemId": "bhzAFGn7", "itemName": "tu31sZAF", "quantity": 2}, {"extraSubscriptionDays": 69, "itemId": "P4A0jZKK", "itemName": "2yPBthHR", "quantity": 16}], "maxRedeemCountPerCampaignPerUser": 33, "maxRedeemCountPerCode": 55, "maxRedeemCountPerCodePerUser": 54, "maxSaleCount": 99, "name": "g3zUn5xZ", "redeemEnd": "1975-02-08T00:00:00Z", "redeemStart": "1987-06-22T00:00:00Z", "redeemType": "DISCOUNT", "status": "INACTIVE", "tags": ["GenbJYrz", "QHIBKC9e", "DdSlthhY"]}' \
    > test.out 2>&1
eval_tap $? 16 'UpdateCampaign' test.out

#- 17 RenameBatch
./ng net.accelbyte.sdk.cli.Main platform renameBatch \
    --campaignId 'OvNatzX8' \
    --namespace "$AB_NAMESPACE" \
    --body '{"newName": "u8o4LSmF", "oldName": "01SIS4sT"}' \
    > test.out 2>&1
eval_tap $? 17 'RenameBatch' test.out

#- 18 QueryCampaignBatchNames
./ng net.accelbyte.sdk.cli.Main platform queryCampaignBatchNames \
    --campaignId 'mMwbIGWG' \
    --namespace "$AB_NAMESPACE" \
    --batchName 'YNKTb3kd' \
    --limit '73' \
    > test.out 2>&1
eval_tap $? 18 'QueryCampaignBatchNames' test.out

#- 19 GetCampaignDynamic
./ng net.accelbyte.sdk.cli.Main platform getCampaignDynamic \
    --campaignId 'y4P9FN11' \
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
    --body '{"enableInventoryCheck": true, "itemDeletionCheckConfig": ["DLC", "ENTITLEMENT"]}' \
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
    --body '{"appConfig": {"appName": "8bWnU1zL"}, "customConfig": {"connectionType": "INSECURE", "grpcServerAddress": "QyESijuQ"}, "extendType": "APP"}' \
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
    --body '{"appConfig": {"appName": "NRLJe9Pk"}, "customConfig": {"connectionType": "INSECURE", "grpcServerAddress": "tLpmhHW4"}, "extendType": "APP"}' \
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
    --storeId 'pui8qVdn' \
    > test.out 2>&1
eval_tap $? 31 'GetRootCategories' test.out

#- 32 CreateCategory
./ng net.accelbyte.sdk.cli.Main platform createCategory \
    --namespace "$AB_NAMESPACE" \
    --storeId 'QRxkD3O4' \
    --body '{"categoryPath": "1YZsAJMn", "localizationDisplayNames": {"8F76oNWY": "hpFmDrgO", "puFEnIGC": "AkLDpcVC", "AJ0DAoDM": "Wa3Nqomw"}}' \
    > test.out 2>&1
eval_tap $? 32 'CreateCategory' test.out

#- 33 ListCategoriesBasic
./ng net.accelbyte.sdk.cli.Main platform listCategoriesBasic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'X3HXdB0j' \
    > test.out 2>&1
eval_tap $? 33 'ListCategoriesBasic' test.out

#- 34 GetCategory
./ng net.accelbyte.sdk.cli.Main platform getCategory \
    --categoryPath 'BRdSqS6N' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'QXGrSO51' \
    > test.out 2>&1
eval_tap $? 34 'GetCategory' test.out

#- 35 UpdateCategory
./ng net.accelbyte.sdk.cli.Main platform updateCategory \
    --categoryPath 'yXF2bvjL' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'jPW1x26p' \
    --body '{"localizationDisplayNames": {"YeV92N6E": "vc6OJuEa", "xVN7daH2": "NXz729VM", "mWJSpdGM": "nSiN34Tp"}}' \
    > test.out 2>&1
eval_tap $? 35 'UpdateCategory' test.out

#- 36 DeleteCategory
./ng net.accelbyte.sdk.cli.Main platform deleteCategory \
    --categoryPath 'pihHOR0v' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'J9NvZiG6' \
    > test.out 2>&1
eval_tap $? 36 'DeleteCategory' test.out

#- 37 GetChildCategories
./ng net.accelbyte.sdk.cli.Main platform getChildCategories \
    --categoryPath 'FzDrA60r' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'jpLsvsPL' \
    > test.out 2>&1
eval_tap $? 37 'GetChildCategories' test.out

#- 38 GetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform getDescendantCategories \
    --categoryPath 'zKNs0PM4' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'uiabCWDt' \
    > test.out 2>&1
eval_tap $? 38 'GetDescendantCategories' test.out

#- 39 QueryCodes
./ng net.accelbyte.sdk.cli.Main platform queryCodes \
    --campaignId 'Vzo1gmHI' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --batchName 'rpPylbux' \
    --batchNo '14,65,20' \
    --code '8Glt57qW' \
    --limit '27' \
    --offset '56' \
    --withBatchName  \
    > test.out 2>&1
eval_tap $? 39 'QueryCodes' test.out

#- 40 CreateCodes
./ng net.accelbyte.sdk.cli.Main platform createCodes \
    --campaignId 'Diw6iDZa' \
    --namespace "$AB_NAMESPACE" \
    --body '{"batchName": "wrWfc9k7", "codeValue": "q4K0z3i0", "quantity": 16}' \
    > test.out 2>&1
eval_tap $? 40 'CreateCodes' test.out

#- 41 Download
./ng net.accelbyte.sdk.cli.Main platform download \
    --campaignId 'LzOBp0nB' \
    --namespace "$AB_NAMESPACE" \
    --batchName 'lTgLoa8V' \
    --batchNo '8,96,95' \
    --withBatchName  \
    > test.out 2>&1
eval_tap $? 41 'Download' test.out

#- 42 BulkDisableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkDisableCodes \
    --campaignId 'Dqep9sAV' \
    --namespace "$AB_NAMESPACE" \
    --batchName 'FEP9i7Rf' \
    --batchNo '70,40,71' \
    > test.out 2>&1
eval_tap $? 42 'BulkDisableCodes' test.out

#- 43 BulkEnableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkEnableCodes \
    --campaignId 'A5WF0DqR' \
    --namespace "$AB_NAMESPACE" \
    --batchName '5QPdTmXK' \
    --batchNo '59,92,43' \
    > test.out 2>&1
eval_tap $? 43 'BulkEnableCodes' test.out

#- 44 QueryRedeemHistory
./ng net.accelbyte.sdk.cli.Main platform queryRedeemHistory \
    --campaignId 'qy7hs45L' \
    --namespace "$AB_NAMESPACE" \
    --code 'DipcjEqF' \
    --limit '8' \
    --offset '98' \
    --userId 'TPncNOEF' \
    > test.out 2>&1
eval_tap $? 44 'QueryRedeemHistory' test.out

#- 45 GetCode
./ng net.accelbyte.sdk.cli.Main platform getCode \
    --code 'JU9s4aDJ' \
    --namespace "$AB_NAMESPACE" \
    --redeemable  \
    --withBatchName  \
    > test.out 2>&1
eval_tap $? 45 'GetCode' test.out

#- 46 DisableCode
./ng net.accelbyte.sdk.cli.Main platform disableCode \
    --code '4TDpf6u5' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 46 'DisableCode' test.out

#- 47 EnableCode
./ng net.accelbyte.sdk.cli.Main platform enableCode \
    --code 'RonE0pJv' \
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
    --body '{"currencyCode": "3wy3SSyk", "currencySymbol": "WHoRojF8", "currencyType": "VIRTUAL", "decimals": 53, "localizationDescriptions": {"fvsjIs7Q": "7PW1GJBf", "YreKETuo": "snCLKlL0", "I0DoNaBl": "M65JVA9b"}}' \
    > test.out 2>&1
eval_tap $? 52 'CreateCurrency' test.out

#- 53 UpdateCurrency
./ng net.accelbyte.sdk.cli.Main platform updateCurrency \
    --currencyCode 'dMzNvtm3' \
    --namespace "$AB_NAMESPACE" \
    --body '{"localizationDescriptions": {"gjimX5ZS": "VvNI9WHP", "VK0u75KY": "i6UgOqIg", "dqqQemsV": "dRJQPIBV"}}' \
    > test.out 2>&1
eval_tap $? 53 'UpdateCurrency' test.out

#- 54 DeleteCurrency
./ng net.accelbyte.sdk.cli.Main platform deleteCurrency \
    --currencyCode 'bJ8QoLqM' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 54 'DeleteCurrency' test.out

#- 55 GetCurrencyConfig
./ng net.accelbyte.sdk.cli.Main platform getCurrencyConfig \
    --currencyCode 'AHJ9UjHy' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 55 'GetCurrencyConfig' test.out

#- 56 GetCurrencySummary
./ng net.accelbyte.sdk.cli.Main platform getCurrencySummary \
    --currencyCode 'MXDNtcst' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 56 'GetCurrencySummary' test.out

#- 57 GetDLCItemConfigHistory
./ng net.accelbyte.sdk.cli.Main platform getDLCItemConfigHistory \
    --namespace "$AB_NAMESPACE" \
    --dlcId 'mSIP51kc' \
    > test.out 2>&1
eval_tap $? 57 'GetDLCItemConfigHistory' test.out

#- 58 RestoreDLCItemConfigHistory
./ng net.accelbyte.sdk.cli.Main platform restoreDLCItemConfigHistory \
    --id '1C2pL6Sk' \
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
    --body '{"data": [{"autoUpdate": true, "enableRevocation": true, "id": "QrhYn9mj", "rewards": [{"currency": {"currencyCode": "A1OnWI5N", "namespace": "v5ZydhTg"}, "item": {"itemId": "VcxCwIH3", "itemName": "lftJ577m", "itemSku": "sMO9W0CW", "itemType": "5zXZk7TB"}, "quantity": 92, "type": "CURRENCY"}, {"currency": {"currencyCode": "dbZZT0k0", "namespace": "kcRpHWEM"}, "item": {"itemId": "yh7nS2Bw", "itemName": "e08OmkFS", "itemSku": "mOZNEYrh", "itemType": "rMeT75ls"}, "quantity": 44, "type": "ITEM"}, {"currency": {"currencyCode": "2CkwYFjx", "namespace": "MfLE3gAQ"}, "item": {"itemId": "p7cfyhXG", "itemName": "jL80gREL", "itemSku": "WJmHrSQu", "itemType": "8Znbei9N"}, "quantity": 7, "type": "ITEM"}], "rvn": 63}, {"autoUpdate": false, "enableRevocation": false, "id": "hLdb6vfj", "rewards": [{"currency": {"currencyCode": "fbbTQcSz", "namespace": "u0kj1rlO"}, "item": {"itemId": "NdF0UEVZ", "itemName": "1GxJVKDG", "itemSku": "VBx3TFVd", "itemType": "cb3ByfBL"}, "quantity": 96, "type": "CURRENCY"}, {"currency": {"currencyCode": "zLcazVkE", "namespace": "w0k4LGwC"}, "item": {"itemId": "7AQOj6xn", "itemName": "6MAXIuQ1", "itemSku": "i04ygTkj", "itemType": "0iVoWwvq"}, "quantity": 29, "type": "ITEM"}, {"currency": {"currencyCode": "eSbZUL6O", "namespace": "GNPynAls"}, "item": {"itemId": "A0egFUtK", "itemName": "Qq4tEZ7c", "itemSku": "nT93fHTw", "itemType": "NvQHXAJX"}, "quantity": 47, "type": "ITEM"}], "rvn": 38}, {"autoUpdate": true, "enableRevocation": false, "id": "uzeR1gqq", "rewards": [{"currency": {"currencyCode": "OrJ7930X", "namespace": "mkPopvgn"}, "item": {"itemId": "nw0845wJ", "itemName": "Mbvfp9Uf", "itemSku": "pePJUDKY", "itemType": "VrV1Vtgz"}, "quantity": 46, "type": "CURRENCY"}, {"currency": {"currencyCode": "WOAnBhHz", "namespace": "SQNPN8G6"}, "item": {"itemId": "QHu1RyDX", "itemName": "L1gkp8Du", "itemSku": "7nCwzhgL", "itemType": "EajYruyz"}, "quantity": 19, "type": "CURRENCY"}, {"currency": {"currencyCode": "5d3jk95P", "namespace": "Z31msfZe"}, "item": {"itemId": "SV0RzKeC", "itemName": "g8S9qtz9", "itemSku": "5poqiHJk", "itemType": "inkIOJme"}, "quantity": 78, "type": "CURRENCY"}], "rvn": 72}]}' \
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
    --body '{"data": [{"platform": "EPICGAMES", "platformDlcIdMap": {"9z7ba88g": "PJo5pckc", "Ss19irlY": "qInEFkfR", "HHfLckHJ": "rZ8sF6GG"}}, {"platform": "PSN", "platformDlcIdMap": {"kqBj19ik": "DFv561Ck", "lRWYls7r": "tiVTtE3c", "ocoz15Wm": "fejF9w7b"}}, {"platform": "PSN", "platformDlcIdMap": {"GjptqjNH": "tblHUL5a", "nlWq4g4p": "yCOAqI9s", "AX3nuhOD": "CWPg3vbc"}}]}' \
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
    --appType 'SOFTWARE' \
    --entitlementClazz 'CODE' \
    --entitlementName 'dbYyBvq6' \
    --itemId 'hQQQV1kw,DXn5fz28,6mBbBGRJ' \
    --limit '61' \
    --offset '64' \
    --origin 'Oculus' \
    --userId '4xj9bihs' \
    > test.out 2>&1
eval_tap $? 65 'QueryEntitlements1' test.out

#- 66 QueryEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryEntitlements \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemIds 'qLVooO5j,UuJgAXbD,xOeMLOZE' \
    --limit '55' \
    --offset '31' \
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
    --body '{"entitlementGrantList": [{"collectionId": "WHFs7SsP", "endDate": "1980-06-02T00:00:00Z", "grantedCode": "W9J0wQzQ", "itemId": "k1I9ahhW", "itemNamespace": "0fSnvkjC", "language": "zL-cuZH-116", "metadata": {"wD1UJhH7": {}, "PN5SjvPM": {}, "QL1909r7": {}}, "origin": "Oculus", "quantity": 63, "region": "3oxAvyiy", "source": "REDEEM_CODE", "startDate": "1977-07-06T00:00:00Z", "storeId": "sg8TcAmN"}, {"collectionId": "J77fmQor", "endDate": "1990-05-04T00:00:00Z", "grantedCode": "eXJ71HjS", "itemId": "14BYzmy2", "itemNamespace": "60RGkfT8", "language": "jdyD_HNux-834", "metadata": {"SbybvgyT": {}, "MZQyjxOs": {}, "doZ6ZUNx": {}}, "origin": "Steam", "quantity": 93, "region": "4rkcZBmh", "source": "REFERRAL_BONUS", "startDate": "1996-07-27T00:00:00Z", "storeId": "MERSemBh"}, {"collectionId": "3vJm8DOt", "endDate": "1996-10-20T00:00:00Z", "grantedCode": "J87andg5", "itemId": "hbDBnEog", "itemNamespace": "cV7nV069", "language": "Qv_rWPL", "metadata": {"5AvGyolS": {}, "HsHyfbkV": {}, "FL7GwakG": {}}, "origin": "Twitch", "quantity": 72, "region": "NJNOXEbY", "source": "PROMOTION", "startDate": "1994-05-31T00:00:00Z", "storeId": "EjbG2u9o"}], "userIds": ["yacgRoQf", "oRncx2WA", "VGm5r0fm"]}' \
    > test.out 2>&1
eval_tap $? 69 'GrantEntitlements' test.out

#- 70 RevokeEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeEntitlements \
    --namespace "$AB_NAMESPACE" \
    --body '["zfNvoT6E", "f5RkpsCa", "wsiGWcPF"]' \
    > test.out 2>&1
eval_tap $? 70 'RevokeEntitlements' test.out

#- 71 GetEntitlement
./ng net.accelbyte.sdk.cli.Main platform getEntitlement \
    --entitlementId 'nGO3uK70' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 71 'GetEntitlement' test.out

#- 72 QueryFulfillmentHistories
./ng net.accelbyte.sdk.cli.Main platform queryFulfillmentHistories \
    --namespace "$AB_NAMESPACE" \
    --limit '54' \
    --offset '85' \
    --status 'FAIL' \
    --userId 'zJx2vgNj' \
    > test.out 2>&1
eval_tap $? 72 'QueryFulfillmentHistories' test.out

#- 73 QueryIAPClawbackHistory
./ng net.accelbyte.sdk.cli.Main platform queryIAPClawbackHistory \
    --namespace "$AB_NAMESPACE" \
    --endTime '2cFj8uqN' \
    --eventType 'CHARGEBACK_REVERSED' \
    --externalOrderId 'MXHB0TX3' \
    --limit '63' \
    --offset '66' \
    --startTime 'IUUAHSQb' \
    --status 'IGNORED' \
    --userId 'YVPlg1jg' \
    > test.out 2>&1
eval_tap $? 73 'QueryIAPClawbackHistory' test.out

#- 74 MockPlayStationStreamEvent
./ng net.accelbyte.sdk.cli.Main platform mockPlayStationStreamEvent \
    --namespace "$AB_NAMESPACE" \
    --body '{"body": {"account": "XND5YNZY", "additionalData": {"entitlement": [{"clientTransaction": [{"amountConsumed": 37, "clientTransactionId": "NAaqjVVm"}, {"amountConsumed": 82, "clientTransactionId": "P3LHXx9T"}, {"amountConsumed": 26, "clientTransactionId": "ovtvyG3A"}], "entitlementId": "D2L3S0WJ", "usageCount": 87}, {"clientTransaction": [{"amountConsumed": 39, "clientTransactionId": "KgQXcKxb"}, {"amountConsumed": 90, "clientTransactionId": "hyP6CRnE"}, {"amountConsumed": 52, "clientTransactionId": "OtbLk6V6"}], "entitlementId": "hWZnrdSw", "usageCount": 77}, {"clientTransaction": [{"amountConsumed": 66, "clientTransactionId": "07usNtdG"}, {"amountConsumed": 80, "clientTransactionId": "21G4o0c5"}, {"amountConsumed": 90, "clientTransactionId": "BglZfvbG"}], "entitlementId": "F9ttR8JK", "usageCount": 88}], "purpose": "9OtOHJJA"}, "originalTitleName": "MoNBbsLy", "paymentProductSKU": "QYSq8SXi", "purchaseDate": "SrkIoXdQ", "sourceOrderItemId": "tHLvYpCQ", "titleName": "27rP5hN9"}, "eventDomain": "QFCfClYC", "eventSource": "tpXihRcs", "eventType": "ivDBrxCB", "eventVersion": 0, "id": "f4IOd5Pg", "timestamp": "h7Qng1Wx"}' \
    > test.out 2>&1
eval_tap $? 74 'MockPlayStationStreamEvent' test.out

#- 75 MockXblClawbackEvent
./ng net.accelbyte.sdk.cli.Main platform mockXblClawbackEvent \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": {"eventDate": "HpN28ZlV", "eventState": "rVuW9p7Q", "lineItemId": "lPXtdvOx", "orderId": "Oy4CvHX1", "productId": "wJjv8xrx", "productType": "uvixZrnj", "purchasedDate": "g5Gl3mRA", "sandboxId": "p5PNt93H", "skuId": "v2gO2cnj", "subscriptionData": {"consumedDurationInDays": 82, "dateTime": "epi6vWNF", "durationInDays": 33, "recurrenceId": "FchX2IKS"}}, "datacontenttype": "xLWCraTE", "id": "w2CtWsjY", "source": "tqkAaXNo", "specVersion": "MaqBRKbQ", "subject": "8AUzJf9k", "time": "9RMMc0M8", "traceparent": "PAuucQta", "type": "EhhZsm6o"}' \
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
    --body '{"appAppleId": 67, "bundleId": "sdwkhlMT", "issuerId": "R8SoSPol", "keyId": "ONhRyerC", "password": "DVaC14MA", "version": "V1"}' \
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
    --body '{"sandboxId": "6wdjduRU"}' \
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
    --body '{"applicationName": "xYA4F3Ls", "notificationTokenAudience": "GoLcOIm7", "notificationTokenEmail": "d39lzv90", "packageName": "BABCzzwA", "serviceAccountId": "Mg3zkyHx"}' \
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
    --body '{"data": [{"itemIdentity": "HTsoG1JI", "itemIdentityType": "ITEM_ID", "platformProductIdMap": {"gHqSTy9i": "dbXsCOlx", "Vqjy2P2X": "YNCzPuNl", "fOKm1WBo": "yJn00SIx"}}, {"itemIdentity": "3CcJw2og", "itemIdentityType": "ITEM_ID", "platformProductIdMap": {"nzcOi7CV": "cs2edb1m", "cHXA2ViK": "Pk1iuJUY", "5gWAKdSB": "fVVssv9E"}}, {"itemIdentity": "f5uFiAcS", "itemIdentityType": "ITEM_ID", "platformProductIdMap": {"P4XGePLE": "5KnQIUaQ", "hzDH81VF": "OvX7CI4X", "K02BB3Ec": "xUrCNh4s"}}]}' \
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
    --body '{"appId": "mKzXi4zL", "appSecret": "gTieuZNL"}' \
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
    --body '{"backOfficeServerClientId": "Q3HSfp60", "backOfficeServerClientSecret": "luSGeDhJ", "enableStreamJob": false, "environment": "R9gkUfYr", "streamName": "2GRXQCkI", "streamPartnerName": "ITwBN8Pf"}' \
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
    --body '{"backOfficeServerClientId": "S1pmjbNp", "backOfficeServerClientSecret": "Kp2pCXuc", "enableStreamJob": false, "environment": "RUt50CqJ", "streamName": "wpeR6WCI", "streamPartnerName": "71rYGaUw"}' \
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
    --body '{"appId": "nd2kzkN7", "env": "LIVE", "publisherAuthenticationKey": "a3Ygy1hf", "syncMode": "INVENTORY"}' \
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
    --body '{"clientId": "2D1kgxj8", "clientSecret": "EcKM3Rzc", "organizationId": "SErsEwcU"}' \
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
    --body '{"enableClawback": true, "entraAppClientId": "KyNCnr3n", "entraAppClientSecret": "Z6PjM0Vo", "entraTenantId": "BAbtveGI", "relyingPartyCert": "JdsfCjT3"}' \
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
    --password 'UejFViWw' \
    > test.out 2>&1
eval_tap $? 107 'UpdateXblBPCertFile' test.out

#- 108 QueryThirdPartyNotifications
./ng net.accelbyte.sdk.cli.Main platform queryThirdPartyNotifications \
    --namespace "$AB_NAMESPACE" \
    --endDate 'YjQCKgsI' \
    --externalId 'CLj77fWV' \
    --limit '37' \
    --offset '77' \
    --source 'APPLE' \
    --startDate 'aOnuhXzO' \
    --status 'IGNORED' \
    --type '6K84O3YF' \
    > test.out 2>&1
eval_tap $? 108 'QueryThirdPartyNotifications' test.out

#- 109 QueryAbnormalTransactions
./ng net.accelbyte.sdk.cli.Main platform queryAbnormalTransactions \
    --namespace "$AB_NAMESPACE" \
    --limit '81' \
    --offset '53' \
    --orderId '0Ih7s9c9' \
    --steamId 'qXzW9aJp' \
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
    --body '{"env": "SANDBOX", "lastTime": "1999-03-20T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 111 'AdminResetSteamJobTime' test.out

#- 112 AdminRefundIAPOrder
./ng net.accelbyte.sdk.cli.Main platform adminRefundIAPOrder \
    --iapOrderNo 'k13VDAxw' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 112 'AdminRefundIAPOrder' test.out

#- 113 QuerySteamReportHistories
./ng net.accelbyte.sdk.cli.Main platform querySteamReportHistories \
    --namespace "$AB_NAMESPACE" \
    --limit '19' \
    --offset '16' \
    --orderId '14TEq9Lj' \
    --processStatus 'IGNORED' \
    --steamId 'A3HBFJaH' \
    > test.out 2>&1
eval_tap $? 113 'QuerySteamReportHistories' test.out

#- 114 QueryThirdPartySubscription
./ng net.accelbyte.sdk.cli.Main platform queryThirdPartySubscription \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --groupId 'e6GMvIqg' \
    --limit '22' \
    --offset '53' \
    --platform 'TWITCH' \
    --productId 'JVKG1Fcc' \
    --userId 'zeQwAyLo' \
    > test.out 2>&1
eval_tap $? 114 'QueryThirdPartySubscription' test.out

#- 115 GetIAPOrderConsumeDetails
./ng net.accelbyte.sdk.cli.Main platform getIAPOrderConsumeDetails \
    --iapOrderNo 'baq3zfaF' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 115 'GetIAPOrderConsumeDetails' test.out

#- 116 DownloadInvoiceDetails
./ng net.accelbyte.sdk.cli.Main platform downloadInvoiceDetails \
    --namespace "$AB_NAMESPACE" \
    --endTime 'e98yUYHD' \
    --feature 'IWFnrC1T' \
    --itemId 'u8zub38I' \
    --itemType 'APP' \
    --startTime 'DF9PIBUV' \
    > test.out 2>&1
eval_tap $? 116 'DownloadInvoiceDetails' test.out

#- 117 GenerateInvoiceSummary
./ng net.accelbyte.sdk.cli.Main platform generateInvoiceSummary \
    --namespace "$AB_NAMESPACE" \
    --endTime 'lqS5qUgF' \
    --feature 'na0FD5zu' \
    --itemId 'hQTi4EvG' \
    --itemType 'SEASON' \
    --startTime 'WYABRNV7' \
    > test.out 2>&1
eval_tap $? 117 'GenerateInvoiceSummary' test.out

#- 118 SyncInGameItem
./ng net.accelbyte.sdk.cli.Main platform syncInGameItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'x3YFD66G' \
    --body '{"categoryPath": "6ymJVyNA", "targetItemId": "i84MQIk0", "targetNamespace": "YflmBEiy"}' \
    > test.out 2>&1
eval_tap $? 118 'SyncInGameItem' test.out

#- 119 CreateItem
./ng net.accelbyte.sdk.cli.Main platform createItem \
    --namespace "$AB_NAMESPACE" \
    --storeId '2jddDoPV' \
    --body '{"appId": "eywm9fP9", "appType": "DLC", "baseAppId": "Qqatz0VD", "boothName": "kFeUuM4O", "categoryPath": "cgb22ULr", "clazz": "y24ladx8", "displayOrder": 52, "entitlementType": "DURABLE", "ext": {"p0H5xD3r": {}, "ne7ScR2M": {}, "qTsVt9RC": {}}, "features": ["VhUrKcQG", "bXByY8GM", "RtFd60QF"], "flexible": false, "images": [{"as": "7kl5mu9j", "caption": "0dFCCD1v", "height": 80, "imageUrl": "JDumMxss", "smallImageUrl": "CGkbt96P", "width": 25}, {"as": "X6gFvQia", "caption": "SCMv4Scp", "height": 40, "imageUrl": "lyiT5zp5", "smallImageUrl": "35kmvcRP", "width": 65}, {"as": "tGomly8w", "caption": "bXdjYlFB", "height": 71, "imageUrl": "d4I4taxG", "smallImageUrl": "C0zVimdm", "width": 85}], "inventoryConfig": {"customAttributes": {"0EFqCTc0": {}, "OhIQ3fWn": {}, "RXHmCp8C": {}}, "serverCustomAttributes": {"kJyPnGRi": {}, "sn5Mkjfw": {}, "zCyAZesG": {}}, "slotUsed": 19}, "itemIds": ["RTeeDZBK", "zthV5HcZ", "ptikIEO0"], "itemQty": {"BZ7zMAel": 96, "rufGE5H0": 74, "k72solQA": 97}, "itemType": "OPTIONBOX", "listable": false, "localizations": {"WeUujeK3": {"description": "YRXnQS9W", "localExt": {"9lz09lme": {}, "J27zz6Iw": {}, "aMSRUU3X": {}}, "longDescription": "HfjVzI7u", "title": "Tse4FM8u"}, "ci92X8HK": {"description": "gtZ1mJ42", "localExt": {"55CZlpOD": {}, "4D0XV0Qf": {}, "tKUzzXEt": {}}, "longDescription": "cDybqBkL", "title": "9lgigS6v"}, "CfrcrNXs": {"description": "aAiNKND6", "localExt": {"AC09YZbS": {}, "SrRjLP5U": {}, "d95R6CmQ": {}}, "longDescription": "AJSs4fAk", "title": "OjjSKVPT"}}, "lootBoxConfig": {"rewardCount": 5, "rewards": [{"lootBoxItems": [{"count": 82, "duration": 55, "endDate": "1978-07-18T00:00:00Z", "itemId": "vL5YiGeF", "itemSku": "tJhc9iDn", "itemType": "hRXdAEtB"}, {"count": 63, "duration": 87, "endDate": "1990-05-28T00:00:00Z", "itemId": "bT0p1AJq", "itemSku": "bIlxiX7e", "itemType": "rUSKiiB7"}, {"count": 28, "duration": 57, "endDate": "1981-02-24T00:00:00Z", "itemId": "daqYha7L", "itemSku": "ua554Lfn", "itemType": "4zRC3FHt"}], "name": "cxWX0y8G", "odds": 0.2641768610491977, "type": "REWARD", "weight": 28}, {"lootBoxItems": [{"count": 11, "duration": 56, "endDate": "1991-03-26T00:00:00Z", "itemId": "iMPAl0pk", "itemSku": "SaKBqmi1", "itemType": "H4SvgmiD"}, {"count": 4, "duration": 60, "endDate": "1984-09-18T00:00:00Z", "itemId": "fIm9obbL", "itemSku": "kbrzOP0Q", "itemType": "BA6mCHIZ"}, {"count": 24, "duration": 63, "endDate": "1996-07-18T00:00:00Z", "itemId": "GKRGGjo7", "itemSku": "32axbU0b", "itemType": "UEF8gN7M"}], "name": "Hqa60aiO", "odds": 0.16637933546023698, "type": "REWARD_GROUP", "weight": 0}, {"lootBoxItems": [{"count": 28, "duration": 9, "endDate": "1973-05-01T00:00:00Z", "itemId": "lDSWGxfp", "itemSku": "UbQNACEA", "itemType": "u9nzUiy9"}, {"count": 23, "duration": 78, "endDate": "1973-12-23T00:00:00Z", "itemId": "ljtMzKu6", "itemSku": "ZuCNtwFo", "itemType": "pQcOLGTQ"}, {"count": 25, "duration": 20, "endDate": "1982-04-16T00:00:00Z", "itemId": "IgZ9yMnd", "itemSku": "J85asZiZ", "itemType": "zz3uUnA6"}], "name": "hjKW9n3a", "odds": 0.442310079791156, "type": "REWARD_GROUP", "weight": 73}], "rollFunction": "CUSTOM"}, "maxCount": 29, "maxCountPerUser": 7, "name": "hzAPt6M6", "optionBoxConfig": {"boxItems": [{"count": 29, "duration": 1, "endDate": "1980-10-20T00:00:00Z", "itemId": "g3k368Hn", "itemSku": "penwvzsk", "itemType": "9LbrUkN5"}, {"count": 84, "duration": 27, "endDate": "1981-11-22T00:00:00Z", "itemId": "ibpx61F2", "itemSku": "UO6M257n", "itemType": "YUw1FXj7"}, {"count": 20, "duration": 60, "endDate": "1977-04-15T00:00:00Z", "itemId": "PwtXZXrf", "itemSku": "XaGkPMGL", "itemType": "eQlQaVjW"}]}, "purchasable": false, "recurring": {"cycle": "YEARLY", "fixedFreeDays": 79, "fixedTrialCycles": 51, "graceDays": 58}, "regionData": {"vf4ZaXvL": [{"currencyCode": "VMcIsns4", "currencyNamespace": "oO1R7284", "currencyType": "VIRTUAL", "discountAmount": 63, "discountExpireAt": "1982-02-22T00:00:00Z", "discountPercentage": 27, "discountPurchaseAt": "1971-06-07T00:00:00Z", "expireAt": "1975-11-10T00:00:00Z", "price": 90, "purchaseAt": "1990-08-04T00:00:00Z", "trialPrice": 13}, {"currencyCode": "wn3q9dGC", "currencyNamespace": "pAouFE6U", "currencyType": "REAL", "discountAmount": 60, "discountExpireAt": "1993-01-10T00:00:00Z", "discountPercentage": 42, "discountPurchaseAt": "1979-11-20T00:00:00Z", "expireAt": "1990-09-18T00:00:00Z", "price": 7, "purchaseAt": "1976-12-08T00:00:00Z", "trialPrice": 32}, {"currencyCode": "8LejQ5za", "currencyNamespace": "sHEufKOz", "currencyType": "REAL", "discountAmount": 0, "discountExpireAt": "1999-09-02T00:00:00Z", "discountPercentage": 55, "discountPurchaseAt": "1976-02-21T00:00:00Z", "expireAt": "1996-07-11T00:00:00Z", "price": 52, "purchaseAt": "1986-06-29T00:00:00Z", "trialPrice": 64}], "NLOzvKLF": [{"currencyCode": "8Rlwzb7C", "currencyNamespace": "8UveSC9Z", "currencyType": "REAL", "discountAmount": 55, "discountExpireAt": "1992-02-09T00:00:00Z", "discountPercentage": 98, "discountPurchaseAt": "1993-04-18T00:00:00Z", "expireAt": "1985-06-10T00:00:00Z", "price": 85, "purchaseAt": "1991-01-05T00:00:00Z", "trialPrice": 83}, {"currencyCode": "RMwwT1ZA", "currencyNamespace": "Py32VlKE", "currencyType": "REAL", "discountAmount": 20, "discountExpireAt": "1985-08-30T00:00:00Z", "discountPercentage": 54, "discountPurchaseAt": "1992-02-13T00:00:00Z", "expireAt": "1987-03-21T00:00:00Z", "price": 76, "purchaseAt": "1983-04-03T00:00:00Z", "trialPrice": 31}, {"currencyCode": "BldIyXtF", "currencyNamespace": "E1DuxTiX", "currencyType": "VIRTUAL", "discountAmount": 31, "discountExpireAt": "1991-04-03T00:00:00Z", "discountPercentage": 90, "discountPurchaseAt": "1974-06-16T00:00:00Z", "expireAt": "1979-03-17T00:00:00Z", "price": 55, "purchaseAt": "1979-09-22T00:00:00Z", "trialPrice": 54}], "6Txb5Grq": [{"currencyCode": "IExhWnn7", "currencyNamespace": "aDQpl9q2", "currencyType": "VIRTUAL", "discountAmount": 90, "discountExpireAt": "1980-03-17T00:00:00Z", "discountPercentage": 14, "discountPurchaseAt": "1991-12-21T00:00:00Z", "expireAt": "1979-04-02T00:00:00Z", "price": 73, "purchaseAt": "1971-11-15T00:00:00Z", "trialPrice": 68}, {"currencyCode": "jy2ZKC6R", "currencyNamespace": "3IEqdMeO", "currencyType": "REAL", "discountAmount": 95, "discountExpireAt": "1981-09-23T00:00:00Z", "discountPercentage": 78, "discountPurchaseAt": "1973-10-09T00:00:00Z", "expireAt": "1992-05-19T00:00:00Z", "price": 80, "purchaseAt": "1977-04-25T00:00:00Z", "trialPrice": 76}, {"currencyCode": "MU49eUyD", "currencyNamespace": "p7u35lEe", "currencyType": "REAL", "discountAmount": 71, "discountExpireAt": "1987-06-25T00:00:00Z", "discountPercentage": 17, "discountPurchaseAt": "1988-04-28T00:00:00Z", "expireAt": "1995-12-02T00:00:00Z", "price": 31, "purchaseAt": "1982-06-05T00:00:00Z", "trialPrice": 62}]}, "saleConfig": {"currencyCode": "iqcBZnsv", "price": 43}, "seasonType": "PASS", "sectionExclusive": true, "sellable": false, "sku": "e2y5SDcZ", "stackable": true, "status": "INACTIVE", "tags": ["fcb0mOeu", "kPHkRlnm", "K2N2FhYi"], "targetCurrencyCode": "1ihcdyT6", "targetNamespace": "D7pmZN4S", "thumbnailUrl": "bfuQuxUH", "useCount": 28}' \
    > test.out 2>&1
eval_tap $? 119 'CreateItem' test.out

#- 120 GetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform getItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'YIa5XsIF' \
    --appId 'Oz2czoFu' \
    > test.out 2>&1
eval_tap $? 120 'GetItemByAppId' test.out

#- 121 QueryItems
./ng net.accelbyte.sdk.cli.Main platform queryItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --appType 'DLC' \
    --availableDate 'BRa7Pxr0' \
    --baseAppId 'ZpmdyNL6' \
    --categoryPath '1pl5iKCV' \
    --features 'xpW50bOB' \
    --includeSubCategoryItem  \
    --itemType 'SUBSCRIPTION' \
    --limit '99' \
    --offset '59' \
    --region 'INLrCxkJ' \
    --sortBy 'name:asc,createdAt:desc,displayOrder:asc' \
    --storeId 'PcfYhJ8S' \
    --tags 'YpzwCc5F' \
    --targetNamespace 'xmAqTfIR' \
    > test.out 2>&1
eval_tap $? 121 'QueryItems' test.out

#- 122 ListBasicItemsByFeatures
./ng net.accelbyte.sdk.cli.Main platform listBasicItemsByFeatures \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --features '0v5e7Fkp,MBQBsQCo,iAX8N4X8' \
    > test.out 2>&1
eval_tap $? 122 'ListBasicItemsByFeatures' test.out

#- 123 GetItems
./ng net.accelbyte.sdk.cli.Main platform getItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'mJU4IgRK' \
    --itemIds 'ON8ia2xj' \
    > test.out 2>&1
eval_tap $? 123 'GetItems' test.out

#- 124 GetItemBySku
./ng net.accelbyte.sdk.cli.Main platform getItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'NqwIiIp4' \
    --sku '8Dcs3AwC' \
    > test.out 2>&1
eval_tap $? 124 'GetItemBySku' test.out

#- 125 GetLocaleItemBySku
./ng net.accelbyte.sdk.cli.Main platform getLocaleItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'MtKUSi4X' \
    --populateBundle  \
    --region 'uWsgxmcN' \
    --storeId 'OsE6tx6k' \
    --sku '8kkeUYxl' \
    > test.out 2>&1
eval_tap $? 125 'GetLocaleItemBySku' test.out

#- 126 GetEstimatedPrice
./ng net.accelbyte.sdk.cli.Main platform getEstimatedPrice \
    --namespace "$AB_NAMESPACE" \
    --platform 'uMs17kGs' \
    --region 'BV8zfrL1' \
    --storeId 'pWHyu6nk' \
    --itemIds 'ptDJhu1b' \
    --userId 'u2I65Vhx' \
    > test.out 2>&1
eval_tap $? 126 'GetEstimatedPrice' test.out

#- 127 GetItemIdBySku
./ng net.accelbyte.sdk.cli.Main platform getItemIdBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'AotQe4dA' \
    --sku 'lbVylpIf' \
    > test.out 2>&1
eval_tap $? 127 'GetItemIdBySku' test.out

#- 128 GetBulkItemIdBySkus
./ng net.accelbyte.sdk.cli.Main platform getBulkItemIdBySkus \
    --namespace "$AB_NAMESPACE" \
    --sku '3CEY2DKL,qQhaqmWF,C1Lur7TC' \
    --storeId 'p5VPQKy3' \
    > test.out 2>&1
eval_tap $? 128 'GetBulkItemIdBySkus' test.out

#- 129 BulkGetLocaleItems
./ng net.accelbyte.sdk.cli.Main platform bulkGetLocaleItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'MJlmWAVf' \
    --region '5nbHuJVu' \
    --storeId '9c2jBFjL' \
    --itemIds 'yKqvEjEi' \
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
    --platform 'hJ6PHdE8' \
    --userId 'Yrfb04w8' \
    --body '{"itemIds": ["Mdyw0KrV", "lpCYrKqG", "gI59lalR"]}' \
    > test.out 2>&1
eval_tap $? 131 'ValidateItemPurchaseCondition' test.out

#- 132 BulkUpdateRegionData
./ng net.accelbyte.sdk.cli.Main platform bulkUpdateRegionData \
    --namespace "$AB_NAMESPACE" \
    --storeId 'NBVzoLWP' \
    --body '{"changes": [{"itemIdentities": ["AHLg3wPL", "eqkfTL1F", "6wbvXyxT"], "itemIdentityType": "ITEM_SKU", "regionData": {"alEym5oV": [{"currencyCode": "Xb2gKXHi", "currencyNamespace": "PSdRf3XL", "currencyType": "VIRTUAL", "discountAmount": 39, "discountExpireAt": "1974-09-03T00:00:00Z", "discountPercentage": 53, "discountPurchaseAt": "1991-04-02T00:00:00Z", "discountedPrice": 89, "expireAt": "1976-03-18T00:00:00Z", "price": 12, "purchaseAt": "1993-01-25T00:00:00Z", "trialPrice": 64}, {"currencyCode": "n8uckA5Z", "currencyNamespace": "HuOrawh7", "currencyType": "REAL", "discountAmount": 25, "discountExpireAt": "1996-06-11T00:00:00Z", "discountPercentage": 10, "discountPurchaseAt": "1976-03-09T00:00:00Z", "discountedPrice": 27, "expireAt": "1979-04-26T00:00:00Z", "price": 14, "purchaseAt": "1996-07-06T00:00:00Z", "trialPrice": 75}, {"currencyCode": "XF8or1vD", "currencyNamespace": "UsON297G", "currencyType": "REAL", "discountAmount": 73, "discountExpireAt": "1981-01-12T00:00:00Z", "discountPercentage": 33, "discountPurchaseAt": "1987-10-28T00:00:00Z", "discountedPrice": 19, "expireAt": "1998-11-30T00:00:00Z", "price": 88, "purchaseAt": "1972-09-20T00:00:00Z", "trialPrice": 34}], "NNjlQkLz": [{"currencyCode": "e77Yf6Fl", "currencyNamespace": "228d9erQ", "currencyType": "REAL", "discountAmount": 93, "discountExpireAt": "1981-04-20T00:00:00Z", "discountPercentage": 85, "discountPurchaseAt": "1999-01-25T00:00:00Z", "discountedPrice": 69, "expireAt": "1984-12-05T00:00:00Z", "price": 77, "purchaseAt": "1977-10-26T00:00:00Z", "trialPrice": 4}, {"currencyCode": "1U86PD0u", "currencyNamespace": "FChHgjsW", "currencyType": "REAL", "discountAmount": 16, "discountExpireAt": "1990-06-20T00:00:00Z", "discountPercentage": 86, "discountPurchaseAt": "1987-12-08T00:00:00Z", "discountedPrice": 28, "expireAt": "1995-08-03T00:00:00Z", "price": 41, "purchaseAt": "1991-04-06T00:00:00Z", "trialPrice": 24}, {"currencyCode": "knqVoRsl", "currencyNamespace": "hUrLEakL", "currencyType": "VIRTUAL", "discountAmount": 74, "discountExpireAt": "1983-03-08T00:00:00Z", "discountPercentage": 35, "discountPurchaseAt": "1993-01-30T00:00:00Z", "discountedPrice": 74, "expireAt": "1988-06-26T00:00:00Z", "price": 77, "purchaseAt": "1982-06-24T00:00:00Z", "trialPrice": 68}], "3byNwdHP": [{"currencyCode": "BHktFMFv", "currencyNamespace": "7VH7hd6U", "currencyType": "REAL", "discountAmount": 32, "discountExpireAt": "1988-05-02T00:00:00Z", "discountPercentage": 5, "discountPurchaseAt": "1989-03-10T00:00:00Z", "discountedPrice": 87, "expireAt": "1997-04-05T00:00:00Z", "price": 70, "purchaseAt": "1996-07-15T00:00:00Z", "trialPrice": 87}, {"currencyCode": "c0d8q3jf", "currencyNamespace": "PABEiG5I", "currencyType": "VIRTUAL", "discountAmount": 93, "discountExpireAt": "1996-04-16T00:00:00Z", "discountPercentage": 51, "discountPurchaseAt": "1993-04-07T00:00:00Z", "discountedPrice": 15, "expireAt": "1998-12-14T00:00:00Z", "price": 63, "purchaseAt": "1991-04-14T00:00:00Z", "trialPrice": 10}, {"currencyCode": "d87X2a5z", "currencyNamespace": "f5pJwVqa", "currencyType": "REAL", "discountAmount": 64, "discountExpireAt": "1986-12-25T00:00:00Z", "discountPercentage": 43, "discountPurchaseAt": "1982-12-28T00:00:00Z", "discountedPrice": 96, "expireAt": "1996-01-13T00:00:00Z", "price": 16, "purchaseAt": "1988-04-07T00:00:00Z", "trialPrice": 58}]}}, {"itemIdentities": ["ZWTkSIvc", "BwuXjB1W", "TpEFOebT"], "itemIdentityType": "ITEM_ID", "regionData": {"JbGEaI9T": [{"currencyCode": "NDN9aCE2", "currencyNamespace": "DLA0XPmO", "currencyType": "VIRTUAL", "discountAmount": 82, "discountExpireAt": "1998-05-30T00:00:00Z", "discountPercentage": 70, "discountPurchaseAt": "1991-07-19T00:00:00Z", "discountedPrice": 36, "expireAt": "1991-11-09T00:00:00Z", "price": 45, "purchaseAt": "1971-10-18T00:00:00Z", "trialPrice": 51}, {"currencyCode": "tWTDmQ8P", "currencyNamespace": "MtkcSElL", "currencyType": "REAL", "discountAmount": 68, "discountExpireAt": "1998-11-23T00:00:00Z", "discountPercentage": 80, "discountPurchaseAt": "1983-02-07T00:00:00Z", "discountedPrice": 12, "expireAt": "1987-09-22T00:00:00Z", "price": 70, "purchaseAt": "1997-01-07T00:00:00Z", "trialPrice": 2}, {"currencyCode": "0THuLCH5", "currencyNamespace": "ltiKstpC", "currencyType": "REAL", "discountAmount": 85, "discountExpireAt": "1999-08-30T00:00:00Z", "discountPercentage": 80, "discountPurchaseAt": "1996-04-02T00:00:00Z", "discountedPrice": 32, "expireAt": "1996-02-02T00:00:00Z", "price": 40, "purchaseAt": "1981-05-26T00:00:00Z", "trialPrice": 86}], "Ox3jm9qn": [{"currencyCode": "0U2fFal7", "currencyNamespace": "ohXrIwAV", "currencyType": "VIRTUAL", "discountAmount": 100, "discountExpireAt": "1993-02-12T00:00:00Z", "discountPercentage": 13, "discountPurchaseAt": "1977-01-06T00:00:00Z", "discountedPrice": 33, "expireAt": "1990-01-21T00:00:00Z", "price": 22, "purchaseAt": "1993-11-13T00:00:00Z", "trialPrice": 13}, {"currencyCode": "AB84nmYl", "currencyNamespace": "QgoYjQ9l", "currencyType": "REAL", "discountAmount": 17, "discountExpireAt": "1980-05-02T00:00:00Z", "discountPercentage": 0, "discountPurchaseAt": "1983-02-08T00:00:00Z", "discountedPrice": 94, "expireAt": "1987-12-15T00:00:00Z", "price": 86, "purchaseAt": "1983-09-17T00:00:00Z", "trialPrice": 23}, {"currencyCode": "IBdOv9gj", "currencyNamespace": "mnM1PJb9", "currencyType": "REAL", "discountAmount": 34, "discountExpireAt": "1990-11-15T00:00:00Z", "discountPercentage": 70, "discountPurchaseAt": "1993-04-23T00:00:00Z", "discountedPrice": 0, "expireAt": "1977-09-07T00:00:00Z", "price": 70, "purchaseAt": "1983-05-05T00:00:00Z", "trialPrice": 86}], "Ev7hIVce": [{"currencyCode": "hCG5Z5A5", "currencyNamespace": "qHsoie8H", "currencyType": "REAL", "discountAmount": 44, "discountExpireAt": "1986-10-31T00:00:00Z", "discountPercentage": 12, "discountPurchaseAt": "1997-09-19T00:00:00Z", "discountedPrice": 45, "expireAt": "1981-10-06T00:00:00Z", "price": 55, "purchaseAt": "1974-11-06T00:00:00Z", "trialPrice": 9}, {"currencyCode": "SkwORvjK", "currencyNamespace": "xgJ6dH7b", "currencyType": "REAL", "discountAmount": 9, "discountExpireAt": "1997-10-23T00:00:00Z", "discountPercentage": 73, "discountPurchaseAt": "1981-04-21T00:00:00Z", "discountedPrice": 92, "expireAt": "1996-08-07T00:00:00Z", "price": 48, "purchaseAt": "1996-02-10T00:00:00Z", "trialPrice": 59}, {"currencyCode": "5n89FpYY", "currencyNamespace": "k4SPRxX5", "currencyType": "VIRTUAL", "discountAmount": 19, "discountExpireAt": "1995-09-11T00:00:00Z", "discountPercentage": 72, "discountPurchaseAt": "1995-06-22T00:00:00Z", "discountedPrice": 33, "expireAt": "1993-07-22T00:00:00Z", "price": 97, "purchaseAt": "1979-10-14T00:00:00Z", "trialPrice": 77}]}}, {"itemIdentities": ["4RR1VziH", "b4fgi4wo", "hVOU2bpr"], "itemIdentityType": "ITEM_ID", "regionData": {"VsvhZ91j": [{"currencyCode": "dygkjMkX", "currencyNamespace": "Jsi1rlEb", "currencyType": "VIRTUAL", "discountAmount": 75, "discountExpireAt": "1983-07-17T00:00:00Z", "discountPercentage": 80, "discountPurchaseAt": "1977-07-04T00:00:00Z", "discountedPrice": 60, "expireAt": "1987-05-16T00:00:00Z", "price": 13, "purchaseAt": "1983-12-09T00:00:00Z", "trialPrice": 50}, {"currencyCode": "bPvtryea", "currencyNamespace": "8A7zVNvL", "currencyType": "VIRTUAL", "discountAmount": 82, "discountExpireAt": "1980-05-01T00:00:00Z", "discountPercentage": 89, "discountPurchaseAt": "1975-06-26T00:00:00Z", "discountedPrice": 23, "expireAt": "1998-04-08T00:00:00Z", "price": 90, "purchaseAt": "1979-05-19T00:00:00Z", "trialPrice": 4}, {"currencyCode": "NKrlqfvz", "currencyNamespace": "rN8RcAEe", "currencyType": "REAL", "discountAmount": 67, "discountExpireAt": "1982-01-15T00:00:00Z", "discountPercentage": 47, "discountPurchaseAt": "1977-11-01T00:00:00Z", "discountedPrice": 79, "expireAt": "1977-08-22T00:00:00Z", "price": 75, "purchaseAt": "1978-11-13T00:00:00Z", "trialPrice": 63}], "5PduYab1": [{"currencyCode": "s6cxJTI9", "currencyNamespace": "IwSC4DFO", "currencyType": "VIRTUAL", "discountAmount": 48, "discountExpireAt": "1978-06-07T00:00:00Z", "discountPercentage": 52, "discountPurchaseAt": "1992-11-10T00:00:00Z", "discountedPrice": 6, "expireAt": "1996-11-15T00:00:00Z", "price": 17, "purchaseAt": "1998-11-27T00:00:00Z", "trialPrice": 72}, {"currencyCode": "sP5npT8t", "currencyNamespace": "N3HZHg1U", "currencyType": "VIRTUAL", "discountAmount": 20, "discountExpireAt": "1982-10-26T00:00:00Z", "discountPercentage": 70, "discountPurchaseAt": "1982-09-24T00:00:00Z", "discountedPrice": 23, "expireAt": "1974-05-13T00:00:00Z", "price": 25, "purchaseAt": "1971-12-18T00:00:00Z", "trialPrice": 75}, {"currencyCode": "mO3585HL", "currencyNamespace": "zy0jaa8r", "currencyType": "REAL", "discountAmount": 14, "discountExpireAt": "1987-06-25T00:00:00Z", "discountPercentage": 1, "discountPurchaseAt": "1988-07-14T00:00:00Z", "discountedPrice": 51, "expireAt": "1994-10-09T00:00:00Z", "price": 91, "purchaseAt": "1991-12-24T00:00:00Z", "trialPrice": 10}], "5yAicICv": [{"currencyCode": "wcneRA6J", "currencyNamespace": "tXvmEdKI", "currencyType": "VIRTUAL", "discountAmount": 55, "discountExpireAt": "1987-08-22T00:00:00Z", "discountPercentage": 61, "discountPurchaseAt": "1988-08-23T00:00:00Z", "discountedPrice": 12, "expireAt": "1974-08-02T00:00:00Z", "price": 67, "purchaseAt": "1972-03-23T00:00:00Z", "trialPrice": 80}, {"currencyCode": "bKPqyRX6", "currencyNamespace": "4OrZerIz", "currencyType": "REAL", "discountAmount": 46, "discountExpireAt": "1991-06-14T00:00:00Z", "discountPercentage": 6, "discountPurchaseAt": "1995-09-28T00:00:00Z", "discountedPrice": 38, "expireAt": "1991-12-05T00:00:00Z", "price": 60, "purchaseAt": "1988-12-21T00:00:00Z", "trialPrice": 47}, {"currencyCode": "AW29YtLp", "currencyNamespace": "PMwDtEef", "currencyType": "REAL", "discountAmount": 96, "discountExpireAt": "1992-03-09T00:00:00Z", "discountPercentage": 82, "discountPurchaseAt": "1997-04-18T00:00:00Z", "discountedPrice": 51, "expireAt": "1972-02-25T00:00:00Z", "price": 22, "purchaseAt": "1978-06-10T00:00:00Z", "trialPrice": 28}]}}]}' \
    > test.out 2>&1
eval_tap $? 132 'BulkUpdateRegionData' test.out

#- 133 SearchItems
./ng net.accelbyte.sdk.cli.Main platform searchItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemType 'COINS' \
    --limit '29' \
    --offset '37' \
    --sortBy 'zZSoBl35' \
    --storeId 'qxX5nVFS' \
    --keyword 'kFVbmv5R' \
    --language 'Iq3bGba1' \
    > test.out 2>&1
eval_tap $? 133 'SearchItems' test.out

#- 134 QueryUncategorizedItems
./ng net.accelbyte.sdk.cli.Main platform queryUncategorizedItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --limit '80' \
    --offset '89' \
    --sortBy 'name,createdAt:desc,displayOrder:desc' \
    --storeId 'refPbvMc' \
    > test.out 2>&1
eval_tap $? 134 'QueryUncategorizedItems' test.out

#- 135 GetItem
./ng net.accelbyte.sdk.cli.Main platform getItem \
    --itemId '1EV8ux7G' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId '7YzgJ81k' \
    > test.out 2>&1
eval_tap $? 135 'GetItem' test.out

#- 136 UpdateItem
./ng net.accelbyte.sdk.cli.Main platform updateItem \
    --itemId 'x8ZBKUeq' \
    --namespace "$AB_NAMESPACE" \
    --storeId '2kWcjZ8l' \
    --body '{"appId": "SQ86ExsI", "appType": "DLC", "baseAppId": "TJ2MZkaz", "boothName": "VY0UvxiW", "categoryPath": "sqH2aF9b", "clazz": "Rz2QImAw", "displayOrder": 60, "entitlementType": "CONSUMABLE", "ext": {"7jiNmZjY": {}, "iVAcOMdN": {}, "oa4Deqjp": {}}, "features": ["XV3q17Xz", "z8s8x42O", "HFlmLxpO"], "flexible": true, "images": [{"as": "68TOfJBa", "caption": "3nGv0zmd", "height": 48, "imageUrl": "fWyQ0KJL", "smallImageUrl": "NiSyXZvU", "width": 50}, {"as": "x6MW1nBg", "caption": "uE3zvzjg", "height": 7, "imageUrl": "WMDHHCTx", "smallImageUrl": "EESVubxE", "width": 53}, {"as": "Wfh1ILnO", "caption": "1zK7CBVV", "height": 89, "imageUrl": "An1R0ktl", "smallImageUrl": "Iqz9N7gy", "width": 92}], "inventoryConfig": {"customAttributes": {"VfMr0L1m": {}, "oOPk7rrW": {}, "jkyb0goJ": {}}, "serverCustomAttributes": {"cBrpnAsU": {}, "Lhji3izK": {}, "cwXNVEGy": {}}, "slotUsed": 91}, "itemIds": ["3t7rKauT", "bJwYeSfO", "hF4cYlSE"], "itemQty": {"ZGby30J8": 19, "JDpzEX7V": 85, "SejG7B9s": 34}, "itemType": "INGAMEITEM", "listable": true, "localizations": {"OfAQDfed": {"description": "AvaXyGRx", "localExt": {"rclWmZyx": {}, "KAycVxVi": {}, "ZZl72OZc": {}}, "longDescription": "PGbRwncH", "title": "0Xrw548m"}, "oxIsmlfY": {"description": "ATeglJWF", "localExt": {"IUIDpo5B": {}, "rXhGpozj": {}, "p5SGzlPy": {}}, "longDescription": "EC5dj8zN", "title": "3AqUmkhE"}, "77Tcl2Xs": {"description": "oQ4ZeHva", "localExt": {"GdxyBJS8": {}, "GezDDXz7": {}, "l0BFaw6K": {}}, "longDescription": "AVnHrLbT", "title": "pnVX6eUK"}}, "lootBoxConfig": {"rewardCount": 2, "rewards": [{"lootBoxItems": [{"count": 51, "duration": 69, "endDate": "1981-07-10T00:00:00Z", "itemId": "8m2BRpVz", "itemSku": "rLtHXnZF", "itemType": "8YdpjIQE"}, {"count": 43, "duration": 98, "endDate": "1991-11-20T00:00:00Z", "itemId": "QqhbZT1G", "itemSku": "5aaDHa1B", "itemType": "sCIj6gBd"}, {"count": 79, "duration": 20, "endDate": "1983-08-27T00:00:00Z", "itemId": "ERC2JrTj", "itemSku": "eFash7XB", "itemType": "4i4GYddw"}], "name": "x2ym0F1q", "odds": 0.8768369092334428, "type": "PROBABILITY_GROUP", "weight": 7}, {"lootBoxItems": [{"count": 37, "duration": 55, "endDate": "1985-10-03T00:00:00Z", "itemId": "LdMhQf1s", "itemSku": "2whRTVQL", "itemType": "femFRT5A"}, {"count": 13, "duration": 11, "endDate": "1976-10-30T00:00:00Z", "itemId": "2OwqWtWs", "itemSku": "1eeRwHKn", "itemType": "iY6w5qmr"}, {"count": 66, "duration": 6, "endDate": "1994-12-14T00:00:00Z", "itemId": "tsNZUpci", "itemSku": "6YTlZAHJ", "itemType": "M66H4RoE"}], "name": "CyOY84ZA", "odds": 0.7463864960905852, "type": "REWARD_GROUP", "weight": 97}, {"lootBoxItems": [{"count": 20, "duration": 79, "endDate": "1985-07-03T00:00:00Z", "itemId": "jo0PUu4d", "itemSku": "Bnr0lXyy", "itemType": "4YKW8Sid"}, {"count": 100, "duration": 19, "endDate": "1991-11-06T00:00:00Z", "itemId": "KygqTXEg", "itemSku": "xVv4bMDP", "itemType": "Pk794IiX"}, {"count": 38, "duration": 13, "endDate": "1993-06-07T00:00:00Z", "itemId": "vhx7XZVQ", "itemSku": "3ISH2bjY", "itemType": "F9XjtD1F"}], "name": "hlRI0hrz", "odds": 0.6869087188632915, "type": "REWARD_GROUP", "weight": 66}], "rollFunction": "DEFAULT"}, "maxCount": 76, "maxCountPerUser": 34, "name": "1qfeFTJc", "optionBoxConfig": {"boxItems": [{"count": 89, "duration": 77, "endDate": "1999-04-10T00:00:00Z", "itemId": "CE6rWbNh", "itemSku": "xVFjqJzm", "itemType": "U81WbabP"}, {"count": 74, "duration": 7, "endDate": "1986-04-29T00:00:00Z", "itemId": "DDcM4nEb", "itemSku": "LWvyZui5", "itemType": "Pl77lIZW"}, {"count": 77, "duration": 63, "endDate": "1982-03-21T00:00:00Z", "itemId": "Cj5WOFZt", "itemSku": "XgIUDPhH", "itemType": "3IZzq3fZ"}]}, "purchasable": true, "recurring": {"cycle": "YEARLY", "fixedFreeDays": 12, "fixedTrialCycles": 23, "graceDays": 67}, "regionData": {"tMsxSnfg": [{"currencyCode": "d4d2htO3", "currencyNamespace": "ZgQYWxh0", "currencyType": "VIRTUAL", "discountAmount": 25, "discountExpireAt": "1990-04-21T00:00:00Z", "discountPercentage": 1, "discountPurchaseAt": "1984-11-03T00:00:00Z", "expireAt": "1981-06-01T00:00:00Z", "price": 48, "purchaseAt": "1976-11-19T00:00:00Z", "trialPrice": 78}, {"currencyCode": "jDlOTe67", "currencyNamespace": "ZZHtVeP4", "currencyType": "VIRTUAL", "discountAmount": 34, "discountExpireAt": "1995-05-01T00:00:00Z", "discountPercentage": 64, "discountPurchaseAt": "1974-01-13T00:00:00Z", "expireAt": "1978-11-24T00:00:00Z", "price": 33, "purchaseAt": "1998-02-07T00:00:00Z", "trialPrice": 38}, {"currencyCode": "PtuSx6BS", "currencyNamespace": "0Sm95Rbl", "currencyType": "VIRTUAL", "discountAmount": 6, "discountExpireAt": "1976-12-30T00:00:00Z", "discountPercentage": 63, "discountPurchaseAt": "1982-03-28T00:00:00Z", "expireAt": "1998-03-25T00:00:00Z", "price": 49, "purchaseAt": "1973-08-31T00:00:00Z", "trialPrice": 35}], "zyI8JpHr": [{"currencyCode": "f0Y6X3NW", "currencyNamespace": "3eznnWru", "currencyType": "VIRTUAL", "discountAmount": 1, "discountExpireAt": "1981-01-20T00:00:00Z", "discountPercentage": 58, "discountPurchaseAt": "1993-08-01T00:00:00Z", "expireAt": "1971-02-22T00:00:00Z", "price": 65, "purchaseAt": "1987-11-30T00:00:00Z", "trialPrice": 25}, {"currencyCode": "X1R4DVTt", "currencyNamespace": "lI9FiWIB", "currencyType": "REAL", "discountAmount": 23, "discountExpireAt": "1993-01-23T00:00:00Z", "discountPercentage": 83, "discountPurchaseAt": "1993-01-30T00:00:00Z", "expireAt": "1995-12-14T00:00:00Z", "price": 85, "purchaseAt": "1986-07-18T00:00:00Z", "trialPrice": 25}, {"currencyCode": "WFebwzxW", "currencyNamespace": "IYD4PmL8", "currencyType": "REAL", "discountAmount": 13, "discountExpireAt": "1986-04-18T00:00:00Z", "discountPercentage": 44, "discountPurchaseAt": "1996-03-15T00:00:00Z", "expireAt": "1989-03-17T00:00:00Z", "price": 22, "purchaseAt": "1971-10-13T00:00:00Z", "trialPrice": 75}], "kHRwgy93": [{"currencyCode": "suuFWloN", "currencyNamespace": "rR8bpmEh", "currencyType": "REAL", "discountAmount": 94, "discountExpireAt": "1991-05-05T00:00:00Z", "discountPercentage": 60, "discountPurchaseAt": "1972-12-17T00:00:00Z", "expireAt": "1986-11-22T00:00:00Z", "price": 33, "purchaseAt": "1995-07-26T00:00:00Z", "trialPrice": 35}, {"currencyCode": "SYdVcTlH", "currencyNamespace": "9Bjgy9u1", "currencyType": "VIRTUAL", "discountAmount": 40, "discountExpireAt": "1982-04-18T00:00:00Z", "discountPercentage": 88, "discountPurchaseAt": "1984-03-13T00:00:00Z", "expireAt": "1973-04-20T00:00:00Z", "price": 87, "purchaseAt": "1995-11-24T00:00:00Z", "trialPrice": 17}, {"currencyCode": "cdgHOSAK", "currencyNamespace": "ALTztqCd", "currencyType": "VIRTUAL", "discountAmount": 5, "discountExpireAt": "1972-12-11T00:00:00Z", "discountPercentage": 16, "discountPurchaseAt": "1976-01-25T00:00:00Z", "expireAt": "1987-05-24T00:00:00Z", "price": 62, "purchaseAt": "1976-08-26T00:00:00Z", "trialPrice": 34}]}, "saleConfig": {"currencyCode": "wT293Mij", "price": 77}, "seasonType": "TIER", "sectionExclusive": true, "sellable": true, "sku": "p38dwLcu", "stackable": false, "status": "INACTIVE", "tags": ["rtOeDSP6", "9g4OdIxM", "24hglDvj"], "targetCurrencyCode": "BgbYyjkb", "targetNamespace": "sU8M17dU", "thumbnailUrl": "UY0LntB5", "useCount": 94}' \
    > test.out 2>&1
eval_tap $? 136 'UpdateItem' test.out

#- 137 DeleteItem
./ng net.accelbyte.sdk.cli.Main platform deleteItem \
    --itemId '29iryFUr' \
    --namespace "$AB_NAMESPACE" \
    --featuresToCheck 'CAMPAIGN,CATALOG,IAP' \
    --force  \
    --storeId 'Va8n6cgu' \
    > test.out 2>&1
eval_tap $? 137 'DeleteItem' test.out

#- 138 AcquireItem
./ng net.accelbyte.sdk.cli.Main platform acquireItem \
    --itemId 'Vs2rKDhk' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 43, "orderNo": "MWUsGJAW"}' \
    > test.out 2>&1
eval_tap $? 138 'AcquireItem' test.out

#- 139 GetApp
./ng net.accelbyte.sdk.cli.Main platform getApp \
    --itemId 'infTNW1f' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'LIB8e3bY' \
    > test.out 2>&1
eval_tap $? 139 'GetApp' test.out

#- 140 UpdateApp
./ng net.accelbyte.sdk.cli.Main platform updateApp \
    --itemId 'Bcc4k0oa' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'idTSjfsR' \
    --body '{"carousel": [{"alt": "Vb0GAGi2", "previewUrl": "jiGVpTFm", "thumbnailUrl": "W4lCjbBx", "type": "video", "url": "zgijza59", "videoSource": "youtube"}, {"alt": "OoEeqoAc", "previewUrl": "nIdZbv7V", "thumbnailUrl": "4ZgOfztN", "type": "video", "url": "TPPtk4Xa", "videoSource": "youtube"}, {"alt": "sj7q2oIX", "previewUrl": "Krl1ndKX", "thumbnailUrl": "HoVmuyis", "type": "image", "url": "agIg6d4n", "videoSource": "youtube"}], "developer": "Uko0RY3n", "forumUrl": "IAzNdEuz", "genres": ["Casual", "Racing", "Sports"], "localizations": {"JnWt5mi2": {"announcement": "BJUkHBnw", "slogan": "jpCpmCZs"}, "E9qOKIsh": {"announcement": "IHIdjJxl", "slogan": "fHGQPVhK"}, "NeJQURyD": {"announcement": "qFc1uabu", "slogan": "JbjINjgl"}}, "platformRequirements": {"SiefgF5T": [{"additionals": "hf5eUbek", "directXVersion": "649NGVGR", "diskSpace": "VmqaqFpK", "graphics": "bmDiZQrq", "label": "UuE4BrnY", "osVersion": "40brdxJN", "processor": "pBwFUF9S", "ram": "GomXspeT", "soundCard": "zHof8eRs"}, {"additionals": "bqtl8Yhi", "directXVersion": "jS1uiNau", "diskSpace": "TXTsAxPN", "graphics": "Sbw1u2Hl", "label": "m0V895Go", "osVersion": "xwsV9arD", "processor": "sYOwdxm2", "ram": "vz6Rz8eM", "soundCard": "OIFsTjSV"}, {"additionals": "NcbANyNP", "directXVersion": "0fYQ28dG", "diskSpace": "cJOpt52J", "graphics": "614BN4kG", "label": "9nfnxYUz", "osVersion": "bamkwyLK", "processor": "ENe2siEa", "ram": "NqAm3OGm", "soundCard": "nHpxwjo7"}], "q4awMK9z": [{"additionals": "t6vuN43i", "directXVersion": "2ppO18dT", "diskSpace": "1mFhqyfe", "graphics": "A2s9PTHF", "label": "PoVh6whY", "osVersion": "U3n4CNfa", "processor": "8crTBatS", "ram": "oMXprPF8", "soundCard": "i8GzkxBP"}, {"additionals": "hedimlcy", "directXVersion": "hw6bPKSo", "diskSpace": "fpd9ISLY", "graphics": "903lmhPF", "label": "VzH17dYZ", "osVersion": "GL2GwoSE", "processor": "M0ZEJ72c", "ram": "DcqPEzMm", "soundCard": "XlRSS8pF"}, {"additionals": "AYgBbtqf", "directXVersion": "5mrAfhB8", "diskSpace": "k2RGFpjD", "graphics": "JjK7nVIy", "label": "Bp07DpkU", "osVersion": "SPEP9c1W", "processor": "xiROG41O", "ram": "048UxBeu", "soundCard": "3N1MlwnK"}], "1VP2Dhnt": [{"additionals": "4vVeO6QK", "directXVersion": "NG41GG7s", "diskSpace": "DbfVovFV", "graphics": "vw1VRFdI", "label": "hVRNAbr0", "osVersion": "JgdnVWKm", "processor": "KmnzP6wW", "ram": "5dvWvtcA", "soundCard": "8R8VRT6p"}, {"additionals": "bvEB95PE", "directXVersion": "7YeNbzi3", "diskSpace": "zIwuUfJ4", "graphics": "HhgY84D3", "label": "XJXKI8cA", "osVersion": "UM6TYdOz", "processor": "AUjSoMQ6", "ram": "heC3lTVt", "soundCard": "MrQW6vog"}, {"additionals": "BWcLhDPy", "directXVersion": "pW8UMeNX", "diskSpace": "rBTtInUB", "graphics": "ZygFGLgE", "label": "MWTVTHdr", "osVersion": "F6BNeygF", "processor": "RRPy3Tbs", "ram": "m5W3nk2t", "soundCard": "XKl5vBTd"}]}, "platforms": ["Linux", "MacOS", "Linux"], "players": ["CrossPlatformMulti", "MMO", "Single"], "primaryGenre": "FreeToPlay", "publisher": "F8gznRvl", "releaseDate": "1978-09-17T00:00:00Z", "websiteUrl": "qtA5HiIf"}' \
    > test.out 2>&1
eval_tap $? 140 'UpdateApp' test.out

#- 141 DisableItem
./ng net.accelbyte.sdk.cli.Main platform disableItem \
    --itemId 'Y2B26NVP' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'VRPrvOZI' \
    --body '{"featuresToCheck": ["ENTITLEMENT", "CAMPAIGN"]}' \
    > test.out 2>&1
eval_tap $? 141 'DisableItem' test.out

#- 142 GetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform getItemDynamicData \
    --itemId 'ir2HE2mt' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 142 'GetItemDynamicData' test.out

#- 143 EnableItem
./ng net.accelbyte.sdk.cli.Main platform enableItem \
    --itemId 'iC5T9wQ2' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'XJtQIl99' \
    > test.out 2>&1
eval_tap $? 143 'EnableItem' test.out

#- 144 FeatureItem
./ng net.accelbyte.sdk.cli.Main platform featureItem \
    --feature 'ZRB8qBDW' \
    --itemId 'SgZCi22D' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'hDcmHSMa' \
    > test.out 2>&1
eval_tap $? 144 'FeatureItem' test.out

#- 145 DefeatureItem
./ng net.accelbyte.sdk.cli.Main platform defeatureItem \
    --feature 'yMvvk5bq' \
    --itemId 'Lq4pm78a' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'aovuoXMl' \
    > test.out 2>&1
eval_tap $? 145 'DefeatureItem' test.out

#- 146 GetLocaleItem
./ng net.accelbyte.sdk.cli.Main platform getLocaleItem \
    --itemId 'aeTsHUtb' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'Bpv2I3YY' \
    --populateBundle  \
    --region 'OtEmE3Tn' \
    --storeId 'C8qCtIfv' \
    > test.out 2>&1
eval_tap $? 146 'GetLocaleItem' test.out

#- 147 UpdateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform updateItemPurchaseCondition \
    --itemId 'wfCVXUum' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'IjMeVhgM' \
    --body '{"purchaseCondition": {"conditionGroups": [{"operator": "and", "predicates": [{"anyOf": 6, "code": "XOuVynDg", "comparison": "isNot", "name": "6XmR6s87", "predicateType": "SeasonPassPredicate", "value": "psgrZ8yv", "values": ["9kcdYcyg", "6rW4yXJ7", "qutRx5IS"]}, {"anyOf": 59, "code": "ciwvEKNB", "comparison": "isNot", "name": "IHrpK1kH", "predicateType": "SeasonTierPredicate", "value": "8UUfHfYZ", "values": ["NafXbpJR", "w8HzPlzZ", "UDzxXVnk"]}, {"anyOf": 37, "code": "Y1PSFJhS", "comparison": "is", "name": "uatmDS5J", "predicateType": "EntitlementPredicate", "value": "ZWAWwufl", "values": ["WmV7g7BZ", "Y6i7lwGY", "ZKVlZXsv"]}]}, {"operator": "and", "predicates": [{"anyOf": 64, "code": "vko9JHDb", "comparison": "isGreaterThan", "name": "93b7xf3a", "predicateType": "SeasonPassPredicate", "value": "HYM2A42S", "values": ["PXrwWJP6", "IfWa3DrM", "cZzgzV6B"]}, {"anyOf": 93, "code": "7lsGWI15", "comparison": "includes", "name": "Q31pX6ok", "predicateType": "SeasonPassPredicate", "value": "4CHIdqdz", "values": ["JRDUpIRA", "A26XARKt", "76HusQ2L"]}, {"anyOf": 3, "code": "Y5XMFH8c", "comparison": "includes", "name": "luxHwKFS", "predicateType": "StatisticCodePredicate", "value": "MkXHeppT", "values": ["7w1Gs2RU", "9THeN72h", "QmY2dZdF"]}]}, {"operator": "and", "predicates": [{"anyOf": 40, "code": "R94Tfbmh", "comparison": "isLessThanOrEqual", "name": "WVnw7ge9", "predicateType": "EntitlementPredicate", "value": "PW4w4edU", "values": ["pJRMGprd", "MZFtJBle", "sM80gFqR"]}, {"anyOf": 72, "code": "UakxYELS", "comparison": "isGreaterThanOrEqual", "name": "fbLfCPOD", "predicateType": "EntitlementPredicate", "value": "wiKKRY6I", "values": ["VgmbaHhB", "JpCYDL3p", "sHnsabhB"]}, {"anyOf": 4, "code": "J4ohI20A", "comparison": "isGreaterThan", "name": "XYnDZI6J", "predicateType": "StatisticCodePredicate", "value": "xxwbB7Ic", "values": ["4gr0gY1n", "0fjiEhCy", "3MjkvGd0"]}]}]}}' \
    > test.out 2>&1
eval_tap $? 147 'UpdateItemPurchaseCondition' test.out

#- 148 QueryItemReferences
./ng net.accelbyte.sdk.cli.Main platform queryItemReferences \
    --itemId 'WHAAEaXU' \
    --namespace "$AB_NAMESPACE" \
    --featuresToCheck 'CAMPAIGN,CATALOG,CAMPAIGN' \
    --storeId 'lO4C36iD' \
    > test.out 2>&1
eval_tap $? 148 'QueryItemReferences' test.out

#- 149 ReturnItem
./ng net.accelbyte.sdk.cli.Main platform returnItem \
    --itemId '5uoI8PyN' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "OWh62pDX"}' \
    > test.out 2>&1
eval_tap $? 149 'ReturnItem' test.out

#- 150 QueryKeyGroups
./ng net.accelbyte.sdk.cli.Main platform queryKeyGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '67' \
    --name 'y3vGV5ae' \
    --offset '26' \
    --tag 'SgP4vAhm' \
    > test.out 2>&1
eval_tap $? 150 'QueryKeyGroups' test.out

#- 151 CreateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform createKeyGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "ykZekuVj", "name": "NDkFqOGC", "status": "ACTIVE", "tags": ["RYFbyqYw", "NducuP3r", "8NO0vFSl"]}' \
    > test.out 2>&1
eval_tap $? 151 'CreateKeyGroup' test.out

#- 152 GetKeyGroupByBoothName
eval_tap 0 152 'GetKeyGroupByBoothName # SKIP deprecated' test.out

#- 153 GetKeyGroup
./ng net.accelbyte.sdk.cli.Main platform getKeyGroup \
    --keyGroupId 'PVfN8Uoo' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 153 'GetKeyGroup' test.out

#- 154 UpdateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform updateKeyGroup \
    --keyGroupId 'jtQroy4Y' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "1JHtxdok", "name": "995Hwtdg", "status": "ACTIVE", "tags": ["xz24TD13", "QxKLuaiY", "xkLY1Bd9"]}' \
    > test.out 2>&1
eval_tap $? 154 'UpdateKeyGroup' test.out

#- 155 GetKeyGroupDynamic
./ng net.accelbyte.sdk.cli.Main platform getKeyGroupDynamic \
    --keyGroupId 'WjJ4LTjk' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 155 'GetKeyGroupDynamic' test.out

#- 156 ListKeys
./ng net.accelbyte.sdk.cli.Main platform listKeys \
    --keyGroupId 'c5WRDtHe' \
    --namespace "$AB_NAMESPACE" \
    --limit '25' \
    --offset '87' \
    --status 'ACTIVE' \
    > test.out 2>&1
eval_tap $? 156 'ListKeys' test.out

#- 157 UploadKeys
./ng net.accelbyte.sdk.cli.Main platform uploadKeys \
    --keyGroupId 'HuXkdjFL' \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 157 'UploadKeys' test.out

#- 158 QueryOrders
./ng net.accelbyte.sdk.cli.Main platform queryOrders \
    --namespace "$AB_NAMESPACE" \
    --endTime 'tMGXrC8A' \
    --limit '85' \
    --offset '21' \
    --orderNos 'gzIVOfWn,wR7K3gSH,ue7mW5Gg' \
    --sortBy 'ngCiTCiD' \
    --startTime 'ozDjbXx8' \
    --status 'REFUNDING' \
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
    --orderNo '2K051z1C' \
    > test.out 2>&1
eval_tap $? 160 'GetOrder' test.out

#- 161 RefundOrder
./ng net.accelbyte.sdk.cli.Main platform refundOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'UYCSEppm' \
    --body '{"description": "eMUJXmq0"}' \
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
    --body '{"domains": ["F6MYIDd8", "foZlLKyy", "h8RBgk6H"]}' \
    > test.out 2>&1
eval_tap $? 165 'UpdatePaymentDomainWhitelistConfig' test.out

#- 166 QueryPaymentNotifications
./ng net.accelbyte.sdk.cli.Main platform queryPaymentNotifications \
    --namespace "$AB_NAMESPACE" \
    --endDate 'jnoCreJc' \
    --externalId 'FDjkVaIj' \
    --limit '6' \
    --notificationSource 'XSOLLA' \
    --notificationType 'DqhGFfHn' \
    --offset '55' \
    --paymentOrderNo 'gnNYDn6S' \
    --startDate '0eCFiFyc' \
    --status 'ERROR' \
    > test.out 2>&1
eval_tap $? 166 'QueryPaymentNotifications' test.out

#- 167 QueryPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform queryPaymentOrders \
    --namespace "$AB_NAMESPACE" \
    --channel 'EXTERNAL' \
    --extTxId 'Ahn23bBG' \
    --limit '96' \
    --offset '11' \
    --status 'REFUND_FAILED' \
    > test.out 2>&1
eval_tap $? 167 'QueryPaymentOrders' test.out

#- 168 CreatePaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform createPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --body '{"currencyCode": "3KRAjKTV", "currencyNamespace": "8olnpTsR", "customParameters": {"ok2ZQMpH": {}, "ToUqH9T0": {}, "337yVfrC": {}}, "description": "BIjBTsqd", "extOrderNo": "5YmLiZAB", "extUserId": "FPiPzbz6", "itemType": "SEASON", "language": "eK", "metadata": {"LhIZYrYb": "HzgMTwsG", "wGSHegrB": "yeAOuNVW", "TAQ84kfV": "nEjSQI3z"}, "notifyUrl": "c4bf0Xh3", "omitNotification": true, "platform": "pBSRM9U7", "price": 53, "recurringPaymentOrderNo": "Tct9zqA1", "region": "algvhKJ2", "returnUrl": "bsvm7Ox7", "sandbox": false, "sku": "gPSEzjVV", "subscriptionId": "xLK5oPkS", "targetNamespace": "f19W7KQd", "targetUserId": "ifWMNf3c", "title": "d64lmZw1"}' \
    > test.out 2>&1
eval_tap $? 168 'CreatePaymentOrderByDedicated' test.out

#- 169 ListExtOrderNoByExtTxId
./ng net.accelbyte.sdk.cli.Main platform listExtOrderNoByExtTxId \
    --namespace "$AB_NAMESPACE" \
    --extTxId 'fNVTeyRq' \
    > test.out 2>&1
eval_tap $? 169 'ListExtOrderNoByExtTxId' test.out

#- 170 GetPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '1qyaYRDR' \
    > test.out 2>&1
eval_tap $? 170 'GetPaymentOrder' test.out

#- 171 ChargePaymentOrder
./ng net.accelbyte.sdk.cli.Main platform chargePaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'KLiYCcXM' \
    --body '{"extTxId": "5ipcYU2q", "paymentMethod": "6B36dp3d", "paymentProvider": "STRIPE"}' \
    > test.out 2>&1
eval_tap $? 171 'ChargePaymentOrder' test.out

#- 172 RefundPaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform refundPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'xcXJENYM' \
    --body '{"description": "3zPJcKiN"}' \
    > test.out 2>&1
eval_tap $? 172 'RefundPaymentOrderByDedicated' test.out

#- 173 SimulatePaymentOrderNotification
./ng net.accelbyte.sdk.cli.Main platform simulatePaymentOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'tAhvfvUZ' \
    --body '{"amount": 67, "currencyCode": "x536FhBv", "notifyType": "CHARGE", "paymentProvider": "ADYEN", "salesTax": 88, "vat": 100}' \
    > test.out 2>&1
eval_tap $? 173 'SimulatePaymentOrderNotification' test.out

#- 174 GetPaymentOrderChargeStatus
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrderChargeStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'qDVaDO1E' \
    > test.out 2>&1
eval_tap $? 174 'GetPaymentOrderChargeStatus' test.out

#- 175 GetPsnEntitlementOwnership
./ng net.accelbyte.sdk.cli.Main platform getPsnEntitlementOwnership \
    --entitlementLabel '5aQy6GTS' \
    --namespace "$AB_NAMESPACE" \
    --body '{"accessToken": "F30KPBxi", "serviceLabel": 86}' \
    > test.out 2>&1
eval_tap $? 175 'GetPsnEntitlementOwnership' test.out

#- 176 GetXboxEntitlementOwnership
./ng net.accelbyte.sdk.cli.Main platform getXboxEntitlementOwnership \
    --namespace "$AB_NAMESPACE" \
    --productSku 'CMPQdVRm' \
    --body '{"delegationToken": "QiB23tkd", "sandboxId": "nG5aImAt"}' \
    > test.out 2>&1
eval_tap $? 176 'GetXboxEntitlementOwnership' test.out

#- 177 GetPlatformEntitlementConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformEntitlementConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Other' \
    > test.out 2>&1
eval_tap $? 177 'GetPlatformEntitlementConfig' test.out

#- 178 UpdatePlatformEntitlementConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformEntitlementConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'IOS' \
    --body '{"allowedPlatformOrigins": ["Twitch", "Twitch", "Steam"]}' \
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
    --platform 'Other' \
    --body '{"allowedBalanceOrigins": ["Nintendo", "Other", "Nintendo"]}' \
    > test.out 2>&1
eval_tap $? 180 'UpdatePlatformWalletConfig' test.out

#- 181 ResetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform resetPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Playstation' \
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
    --body '{"entitlement": {"consumable": {"enabled": true, "strategy": "REVOKE_OR_REPORT"}, "durable": {"enabled": true, "strategy": "REVOKE_OR_REPORT"}}, "wallet": {"enabled": true, "strategy": "REVOKE_OR_REPORT"}}' \
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
    --endTime 'auAckVmK' \
    --limit '0' \
    --offset '70' \
    --source 'ORDER' \
    --startTime 'rShqz9H0' \
    --status 'FAIL' \
    --transactionId 'Ocijwy54' \
    --userId 'uJCZPp9w' \
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
    --body '{"appConfig": {"appName": "ub5Z52d9"}, "customConfig": {"connectionType": "INSECURE", "grpcServerAddress": "QGSa9Lqi"}, "extendType": "APP"}' \
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
    --body '{"description": "8jJY1xoK", "eventTopic": "ZoFpSZsD", "maxAwarded": 89, "maxAwardedPerUser": 38, "namespaceExpression": "z7tL4RG2", "rewardCode": "gwof8PwF", "rewardConditions": [{"condition": "o7tAOmBv", "conditionName": "1fhKxZd9", "eventName": "PnsQQB8w", "rewardItems": [{"duration": 86, "endDate": "1974-08-19T00:00:00Z", "identityType": "ITEM_ID", "itemId": "htK4EB64", "quantity": 55, "sku": "exnrz9Xb"}, {"duration": 98, "endDate": "1992-07-22T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "a3HV0ZNQ", "quantity": 91, "sku": "cWfLSltt"}, {"duration": 11, "endDate": "1999-12-09T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "171qND11", "quantity": 10, "sku": "Nufhcp2N"}]}, {"condition": "SRTNSodi", "conditionName": "Y9o7YQ09", "eventName": "ouSzsxFE", "rewardItems": [{"duration": 51, "endDate": "1996-01-11T00:00:00Z", "identityType": "ITEM_ID", "itemId": "KLKaTYYu", "quantity": 87, "sku": "qBq77VbU"}, {"duration": 36, "endDate": "1981-04-08T00:00:00Z", "identityType": "ITEM_ID", "itemId": "iODAhEHP", "quantity": 68, "sku": "q256bi0W"}, {"duration": 100, "endDate": "1995-06-08T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "8akMm4KJ", "quantity": 81, "sku": "gWRX9JnO"}]}, {"condition": "mMQvOih6", "conditionName": "wdI5DJv3", "eventName": "0xdasvD5", "rewardItems": [{"duration": 62, "endDate": "1996-10-13T00:00:00Z", "identityType": "ITEM_ID", "itemId": "ChDPKL0E", "quantity": 12, "sku": "GwAsOihr"}, {"duration": 30, "endDate": "1994-05-11T00:00:00Z", "identityType": "ITEM_ID", "itemId": "tYmmdhLw", "quantity": 90, "sku": "s6zaPZkK"}, {"duration": 2, "endDate": "1971-04-28T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "KIBkmFcJ", "quantity": 6, "sku": "TezPyMcW"}]}], "userIdExpression": "690HTxnN"}' \
    > test.out 2>&1
eval_tap $? 190 'CreateReward' test.out

#- 191 QueryRewards
./ng net.accelbyte.sdk.cli.Main platform queryRewards \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'BiWvqmrB' \
    --limit '94' \
    --offset '24' \
    --sortBy 'namespace:desc,namespace,namespace:asc' \
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
    --rewardId 'QLKJyUuJ' \
    > test.out 2>&1
eval_tap $? 194 'GetReward' test.out

#- 195 UpdateReward
./ng net.accelbyte.sdk.cli.Main platform updateReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'lwhJUs77' \
    --body '{"description": "rMcdIegJ", "eventTopic": "53VQTjs5", "maxAwarded": 48, "maxAwardedPerUser": 59, "namespaceExpression": "cvmatdfG", "rewardCode": "YU2pVk5Y", "rewardConditions": [{"condition": "WJXiBx3z", "conditionName": "lScc17bR", "eventName": "z64ba0ax", "rewardItems": [{"duration": 10, "endDate": "1974-08-14T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "CklmK1YC", "quantity": 99, "sku": "u5DieQae"}, {"duration": 18, "endDate": "1979-06-10T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "K285GskY", "quantity": 39, "sku": "Elx5pwRU"}, {"duration": 55, "endDate": "1979-12-21T00:00:00Z", "identityType": "ITEM_ID", "itemId": "9xE9CgYk", "quantity": 16, "sku": "iSjxDFaF"}]}, {"condition": "2F60jWxp", "conditionName": "Tzc8rQtO", "eventName": "3DJHMEGW", "rewardItems": [{"duration": 10, "endDate": "1973-02-01T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "0RwhQMJU", "quantity": 92, "sku": "wjDPuqpT"}, {"duration": 34, "endDate": "1996-08-26T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "hNKeKZ3j", "quantity": 88, "sku": "oAF4kh69"}, {"duration": 66, "endDate": "1991-08-05T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "j0EF5rBX", "quantity": 62, "sku": "FWGjUzDc"}]}, {"condition": "SKdyiOB6", "conditionName": "3oxLVFwA", "eventName": "mTfverJu", "rewardItems": [{"duration": 28, "endDate": "1975-11-10T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "mRM9R7Gi", "quantity": 38, "sku": "z2nM3ALy"}, {"duration": 99, "endDate": "1989-05-19T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "oI3942Lb", "quantity": 11, "sku": "T6GXLyCR"}, {"duration": 66, "endDate": "1977-06-23T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "WnrUbpHl", "quantity": 61, "sku": "oMaqcv9Q"}]}], "userIdExpression": "vlSUL6RD"}' \
    > test.out 2>&1
eval_tap $? 195 'UpdateReward' test.out

#- 196 DeleteReward
./ng net.accelbyte.sdk.cli.Main platform deleteReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'd6BNx8P4' \
    > test.out 2>&1
eval_tap $? 196 'DeleteReward' test.out

#- 197 CheckEventCondition
./ng net.accelbyte.sdk.cli.Main platform checkEventCondition \
    --namespace "$AB_NAMESPACE" \
    --rewardId '0yCVwLKK' \
    --body '{"payload": {"BPj7WpLI": {}, "GzV8qXUJ": {}, "GqGW07WL": {}}}' \
    > test.out 2>&1
eval_tap $? 197 'CheckEventCondition' test.out

#- 198 DeleteRewardConditionRecord
./ng net.accelbyte.sdk.cli.Main platform deleteRewardConditionRecord \
    --namespace "$AB_NAMESPACE" \
    --rewardId '6tSSqYTo' \
    --body '{"conditionName": "48jyh1qo", "userId": "Qye6aEh0"}' \
    > test.out 2>&1
eval_tap $? 198 'DeleteRewardConditionRecord' test.out

#- 199 QuerySections
./ng net.accelbyte.sdk.cli.Main platform querySections \
    --namespace "$AB_NAMESPACE" \
    --end 'm4HYkU8X' \
    --limit '77' \
    --offset '96' \
    --start 'q4yshWaf' \
    --storeId 'l7GyaCuk' \
    --viewId 'NrK4TnB4' \
    > test.out 2>&1
eval_tap $? 199 'QuerySections' test.out

#- 200 CreateSection
./ng net.accelbyte.sdk.cli.Main platform createSection \
    --namespace "$AB_NAMESPACE" \
    --storeId 'U6ZTxZcK' \
    --body '{"active": false, "displayOrder": 1, "endDate": "1974-08-06T00:00:00Z", "ext": {"UEyG0kV4": {}, "FqDeuoTE": {}, "LHHDrics": {}}, "fixedPeriodRotationConfig": {"backfillType": "CUSTOM", "duration": 45, "itemCount": 13, "rule": "SEQUENCE"}, "items": [{"id": "WIBP3TbP", "sku": "7eVkhDfp"}, {"id": "ADNO7qMP", "sku": "VBPCdIWm"}, {"id": "qQFoDkvv", "sku": "LXiVlSh5"}], "localizations": {"X3mcXAhK": {"description": "vUZGcd5P", "localExt": {"Msua2XKq": {}, "jZ9mLzuK": {}, "7vLyUL5V": {}}, "longDescription": "iEuzUBFE", "title": "nPg34FJP"}, "i0iZQyi2": {"description": "CTJiiuYY", "localExt": {"X1KUUKje": {}, "yRUV9Fmj": {}, "8VnIAHSw": {}}, "longDescription": "RDkbiwUe", "title": "qAH51RDk"}, "imNjclP6": {"description": "NhOqCT5P", "localExt": {"L2gy9r8z": {}, "GJDJq4me": {}, "GOfHslst": {}}, "longDescription": "yqU2286H", "title": "JhbZJWoz"}}, "name": "kmj0vvQ1", "rotationType": "CUSTOM", "startDate": "1996-05-29T00:00:00Z", "viewId": "rYqBMn6D"}' \
    > test.out 2>&1
eval_tap $? 200 'CreateSection' test.out

#- 201 PurgeExpiredSection
./ng net.accelbyte.sdk.cli.Main platform purgeExpiredSection \
    --namespace "$AB_NAMESPACE" \
    --storeId 'jmByfXEF' \
    > test.out 2>&1
eval_tap $? 201 'PurgeExpiredSection' test.out

#- 202 GetSection
./ng net.accelbyte.sdk.cli.Main platform getSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'uHQUm6Wr' \
    --storeId 'w7hPR3CX' \
    > test.out 2>&1
eval_tap $? 202 'GetSection' test.out

#- 203 UpdateSection
./ng net.accelbyte.sdk.cli.Main platform updateSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'YK6KqjFb' \
    --storeId 'FUUwb7aJ' \
    --body '{"active": true, "displayOrder": 81, "endDate": "1975-05-13T00:00:00Z", "ext": {"yIBIph9Q": {}, "iidq6bwE": {}, "CA5MrAzl": {}}, "fixedPeriodRotationConfig": {"backfillType": "NONE", "duration": 47, "itemCount": 98, "rule": "SEQUENCE"}, "items": [{"id": "q61hl71X", "sku": "tgA8f7HR"}, {"id": "fXR6pztu", "sku": "1s8EYJzY"}, {"id": "0r3Fefiq", "sku": "8a5WWVGw"}], "localizations": {"i8Os9Xk7": {"description": "aVxG1ydK", "localExt": {"LTL1qBDF": {}, "u3dVS39K": {}, "f2UjnxcK": {}}, "longDescription": "SpmzBbmR", "title": "c0fj35V9"}, "t51o8czi": {"description": "Bwxs3hAs", "localExt": {"RHEBFxKW": {}, "9gGGDM1H": {}, "mdE6HsGQ": {}}, "longDescription": "sJbe4Ooj", "title": "mOR8Y4XC"}, "5I5nZEtN": {"description": "XRqw2uBR", "localExt": {"hPQmmCLS": {}, "zB8EoPDM": {}, "cd6FIM1t": {}}, "longDescription": "e6OuZlTb", "title": "NonSIlxY"}}, "name": "bf2RFdMr", "rotationType": "FIXED_PERIOD", "startDate": "1972-09-13T00:00:00Z", "viewId": "DUVWrOvh"}' \
    > test.out 2>&1
eval_tap $? 203 'UpdateSection' test.out

#- 204 DeleteSection
./ng net.accelbyte.sdk.cli.Main platform deleteSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'nCmioCIF' \
    --storeId 'N1EUJaBn' \
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
    --body '{"defaultLanguage": "km0IFft3", "defaultRegion": "SRktjMBg", "description": "TOHuvTqk", "supportedLanguages": ["7KDu3TOm", "NVydYutz", "IN1xEM9a"], "supportedRegions": ["x4OO9SlS", "4BtPt0x9", "TiHdLlN3"], "title": "bDY9t7Vi"}' \
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
    --body '{"catalogType": "APP", "fieldsToBeIncluded": ["MWEW4IGg", "W37xbAuv", "oyYAL5Qs"], "idsToBeExported": ["f0UxorN6", "qvQkvvJr", "LsYXkAD7"], "storeId": "tIR9aXZy"}' \
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
    --storeId 'kp8ehU5b' \
    > test.out 2>&1
eval_tap $? 215 'GetStore' test.out

#- 216 UpdateStore
./ng net.accelbyte.sdk.cli.Main platform updateStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'rzO51iZe' \
    --body '{"defaultLanguage": "XqZcdJSd", "defaultRegion": "MEc4KkJe", "description": "hs8FfMf5", "supportedLanguages": ["ZxXpvbim", "IQufovli", "AsCHRRWT"], "supportedRegions": ["N5UK8jxQ", "cmyDXVGT", "pFZp9NB7"], "title": "J4JQpBsi"}' \
    > test.out 2>&1
eval_tap $? 216 'UpdateStore' test.out

#- 217 DeleteStore
./ng net.accelbyte.sdk.cli.Main platform deleteStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'QQkfvqHz' \
    > test.out 2>&1
eval_tap $? 217 'DeleteStore' test.out

#- 218 QueryChanges
./ng net.accelbyte.sdk.cli.Main platform queryChanges \
    --namespace "$AB_NAMESPACE" \
    --storeId 'tGgcXSe6' \
    --action 'DELETE' \
    --itemSku 'nN1v9ivM' \
    --itemType 'COINS' \
    --limit '18' \
    --offset '72' \
    --selected  \
    --sortBy 'createdAt:asc,createdAt:desc,createdAt' \
    --status 'PUBLISHED' \
    --type 'STORE' \
    --updatedAtEnd 'GQKvkZv4' \
    --updatedAtStart 'RBpChXO9' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 218 'QueryChanges' test.out

#- 219 PublishAll
./ng net.accelbyte.sdk.cli.Main platform publishAll \
    --namespace "$AB_NAMESPACE" \
    --storeId 'vwn3EWUl' \
    > test.out 2>&1
eval_tap $? 219 'PublishAll' test.out

#- 220 PublishSelected
./ng net.accelbyte.sdk.cli.Main platform publishSelected \
    --namespace "$AB_NAMESPACE" \
    --storeId 'qyJzDYA8' \
    > test.out 2>&1
eval_tap $? 220 'PublishSelected' test.out

#- 221 SelectAllRecords
./ng net.accelbyte.sdk.cli.Main platform selectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'E5Q9NJvU' \
    > test.out 2>&1
eval_tap $? 221 'SelectAllRecords' test.out

#- 222 SelectAllRecordsByCriteria
./ng net.accelbyte.sdk.cli.Main platform selectAllRecordsByCriteria \
    --namespace "$AB_NAMESPACE" \
    --storeId 'PlsF43d8' \
    --action 'DELETE' \
    --itemSku '9DcFNWkG' \
    --itemType 'INGAMEITEM' \
    --selected  \
    --type 'CATEGORY' \
    --updatedAtEnd 'IwRTwkVz' \
    --updatedAtStart 'Zbx20tJM' \
    > test.out 2>&1
eval_tap $? 222 'SelectAllRecordsByCriteria' test.out

#- 223 GetStatistic
./ng net.accelbyte.sdk.cli.Main platform getStatistic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'jJewLp1t' \
    --action 'UPDATE' \
    --itemSku '2iRlKILu' \
    --itemType 'APP' \
    --type 'VIEW' \
    --updatedAtEnd 'JVngSdAM' \
    --updatedAtStart 'kBgh6a1K' \
    > test.out 2>&1
eval_tap $? 223 'GetStatistic' test.out

#- 224 UnselectAllRecords
./ng net.accelbyte.sdk.cli.Main platform unselectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'EonflUKj' \
    > test.out 2>&1
eval_tap $? 224 'UnselectAllRecords' test.out

#- 225 SelectRecord
./ng net.accelbyte.sdk.cli.Main platform selectRecord \
    --changeId 'Iku1oE7p' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'OweMgQFZ' \
    > test.out 2>&1
eval_tap $? 225 'SelectRecord' test.out

#- 226 UnselectRecord
./ng net.accelbyte.sdk.cli.Main platform unselectRecord \
    --changeId 'Cy4BVEz5' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Gn712FxA' \
    > test.out 2>&1
eval_tap $? 226 'UnselectRecord' test.out

#- 227 CloneStore
./ng net.accelbyte.sdk.cli.Main platform cloneStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'oCuflp11' \
    --targetStoreId 'CyRtfOLZ' \
    > test.out 2>&1
eval_tap $? 227 'CloneStore' test.out

#- 228 ExportStore
eval_tap 0 228 'ExportStore # SKIP deprecated' test.out

#- 229 QueryImportHistory
./ng net.accelbyte.sdk.cli.Main platform queryImportHistory \
    --namespace "$AB_NAMESPACE" \
    --storeId '7iL3QtJ5' \
    --end 'pUkzvgxE' \
    --limit '2' \
    --offset '54' \
    --sortBy 'c9gDqvPW' \
    --start 'ykfRYjDz' \
    --success  \
    > test.out 2>&1
eval_tap $? 229 'QueryImportHistory' test.out

#- 230 ImportStoreByCSV
./ng net.accelbyte.sdk.cli.Main platform importStoreByCSV \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ZZ6g5eZM' \
    --category 'tmp.dat' \
    --display 'tmp.dat' \
    --item 'tmp.dat' \
    --notes 'Z9oXZf5E' \
    --section 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 230 'ImportStoreByCSV' test.out

#- 231 QuerySubscriptions
./ng net.accelbyte.sdk.cli.Main platform querySubscriptions \
    --namespace "$AB_NAMESPACE" \
    --chargeStatus 'NEVER' \
    --itemId 'yg7h5lMs' \
    --limit '52' \
    --offset '19' \
    --sku 'jwtm1dU1' \
    --status 'CANCELLED' \
    --subscribedBy 'PLATFORM' \
    --userId 'YXC30gL6' \
    > test.out 2>&1
eval_tap $? 231 'QuerySubscriptions' test.out

#- 232 RecurringChargeSubscription
./ng net.accelbyte.sdk.cli.Main platform recurringChargeSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'PbVazwE7' \
    > test.out 2>&1
eval_tap $? 232 'RecurringChargeSubscription' test.out

#- 233 GetTicketDynamic
./ng net.accelbyte.sdk.cli.Main platform getTicketDynamic \
    --boothName 'dduMPV5P' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 233 'GetTicketDynamic' test.out

#- 234 DecreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform decreaseTicketSale \
    --boothName 'maeyRWPZ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "HXiHhAKA"}' \
    > test.out 2>&1
eval_tap $? 234 'DecreaseTicketSale' test.out

#- 235 GetTicketBoothID
./ng net.accelbyte.sdk.cli.Main platform getTicketBoothID \
    --boothName 'L2pcLGaT' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 235 'GetTicketBoothID' test.out

#- 236 IncreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform increaseTicketSale \
    --boothName 'TlCV2h03' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 97, "orderNo": "2JBxF1jw"}' \
    > test.out 2>&1
eval_tap $? 236 'IncreaseTicketSale' test.out

#- 237 Commit
./ng net.accelbyte.sdk.cli.Main platform commit \
    --namespace "$AB_NAMESPACE" \
    --body '{"actions": [{"operations": [{"creditPayload": {"balanceOrigin": "Other", "count": 22, "currencyCode": "xs9C1EJa", "expireAt": "1997-10-24T00:00:00Z"}, "debitPayload": {"count": 55, "currencyCode": "lKNT0GW9", "walletPlatform": "Epic"}, "fulFillItemPayload": {"count": 1, "entitlementCollectionId": "DsVTgyxo", "entitlementOrigin": "Nintendo", "itemIdentity": "B5TPNePw", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 25, "entitlementId": "nzwbPFkd"}, "type": "CREDIT_WALLET"}, {"creditPayload": {"balanceOrigin": "Playstation", "count": 73, "currencyCode": "l06mdBfJ", "expireAt": "1999-03-24T00:00:00Z"}, "debitPayload": {"count": 21, "currencyCode": "3nxEZp2g", "walletPlatform": "Other"}, "fulFillItemPayload": {"count": 50, "entitlementCollectionId": "kVGwMrE5", "entitlementOrigin": "IOS", "itemIdentity": "tHpYkjZm", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 59, "entitlementId": "5FMGw2aF"}, "type": "REVOKE_ENTITLEMENT"}, {"creditPayload": {"balanceOrigin": "Xbox", "count": 13, "currencyCode": "GjVu5qM2", "expireAt": "1973-04-06T00:00:00Z"}, "debitPayload": {"count": 40, "currencyCode": "h2RKtDCg", "walletPlatform": "IOS"}, "fulFillItemPayload": {"count": 40, "entitlementCollectionId": "MHoYAxwZ", "entitlementOrigin": "Epic", "itemIdentity": "Cd2Pn6Wn", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 69, "entitlementId": "MaQ4MUpO"}, "type": "REVOKE_ENTITLEMENT"}], "userId": "KvnD8gia"}, {"operations": [{"creditPayload": {"balanceOrigin": "GooglePlay", "count": 65, "currencyCode": "mRn8MW90", "expireAt": "1986-06-13T00:00:00Z"}, "debitPayload": {"count": 83, "currencyCode": "QkLVeeJd", "walletPlatform": "Playstation"}, "fulFillItemPayload": {"count": 4, "entitlementCollectionId": "kr3hCZPE", "entitlementOrigin": "System", "itemIdentity": "jKn1tals", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 35, "entitlementId": "uVSFb5K9"}, "type": "FULFILL_ITEM"}, {"creditPayload": {"balanceOrigin": "Playstation", "count": 90, "currencyCode": "FDNOhx7V", "expireAt": "1996-12-04T00:00:00Z"}, "debitPayload": {"count": 85, "currencyCode": "zcGQl9qL", "walletPlatform": "Steam"}, "fulFillItemPayload": {"count": 97, "entitlementCollectionId": "8P41RnbV", "entitlementOrigin": "System", "itemIdentity": "e7VFHGEe", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 70, "entitlementId": "sEQR7C7g"}, "type": "FULFILL_ITEM"}, {"creditPayload": {"balanceOrigin": "Nintendo", "count": 24, "currencyCode": "Jx6Uxjfc", "expireAt": "1979-09-23T00:00:00Z"}, "debitPayload": {"count": 13, "currencyCode": "D2Xb4hO8", "walletPlatform": "Playstation"}, "fulFillItemPayload": {"count": 47, "entitlementCollectionId": "GFj1QzSP", "entitlementOrigin": "Xbox", "itemIdentity": "KxxEHmuw", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 51, "entitlementId": "UTqOgOsQ"}, "type": "DEBIT_WALLET"}], "userId": "Qs50kcQp"}, {"operations": [{"creditPayload": {"balanceOrigin": "Other", "count": 19, "currencyCode": "BEwe3inG", "expireAt": "1979-12-17T00:00:00Z"}, "debitPayload": {"count": 97, "currencyCode": "thrq9jZA", "walletPlatform": "Playstation"}, "fulFillItemPayload": {"count": 10, "entitlementCollectionId": "wCitO73H", "entitlementOrigin": "IOS", "itemIdentity": "iwJJBjPK", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 84, "entitlementId": "AFtq1cka"}, "type": "REVOKE_ENTITLEMENT"}, {"creditPayload": {"balanceOrigin": "GooglePlay", "count": 5, "currencyCode": "GtJPaHfL", "expireAt": "1989-12-16T00:00:00Z"}, "debitPayload": {"count": 43, "currencyCode": "X8Y43tRw", "walletPlatform": "Oculus"}, "fulFillItemPayload": {"count": 44, "entitlementCollectionId": "6Iql4uzs", "entitlementOrigin": "Nintendo", "itemIdentity": "qJ641pIo", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 20, "entitlementId": "OlXeXX05"}, "type": "REVOKE_ENTITLEMENT"}, {"creditPayload": {"balanceOrigin": "Oculus", "count": 75, "currencyCode": "xMeDlJQk", "expireAt": "1998-03-18T00:00:00Z"}, "debitPayload": {"count": 96, "currencyCode": "xKKpjEsF", "walletPlatform": "IOS"}, "fulFillItemPayload": {"count": 47, "entitlementCollectionId": "3LpOUt4T", "entitlementOrigin": "Other", "itemIdentity": "ISZlHY8D", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 35, "entitlementId": "aDtSFYMO"}, "type": "DEBIT_WALLET"}], "userId": "KYvvu2Id"}], "metadata": {"SDxaafoO": {}, "mi3OsQuA": {}, "XNp4xNLd": {}}, "needPreCheck": false, "transactionId": "TPPmofHZ", "type": "BiV8W70e"}' \
    > test.out 2>&1
eval_tap $? 237 'Commit' test.out

#- 238 GetTradeHistoryByCriteria
./ng net.accelbyte.sdk.cli.Main platform getTradeHistoryByCriteria \
    --namespace "$AB_NAMESPACE" \
    --limit '85' \
    --offset '74' \
    --status 'INIT' \
    --type 'o1DHL60Q' \
    --userId 'rmlMwxxp' \
    > test.out 2>&1
eval_tap $? 238 'GetTradeHistoryByCriteria' test.out

#- 239 GetTradeHistoryByTransactionId
./ng net.accelbyte.sdk.cli.Main platform getTradeHistoryByTransactionId \
    --namespace "$AB_NAMESPACE" \
    --transactionId 'QLT8ALxG' \
    > test.out 2>&1
eval_tap $? 239 'GetTradeHistoryByTransactionId' test.out

#- 240 UnlockSteamUserAchievement
./ng net.accelbyte.sdk.cli.Main platform unlockSteamUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId '7GypYnEo' \
    --body '{"achievements": [{"id": "wlgKWwxA", "value": 62}, {"id": "ZUDNNv08", "value": 56}, {"id": "JSVA6mIJ", "value": 9}], "steamUserId": "XjnPKWMz"}' \
    > test.out 2>&1
eval_tap $? 240 'UnlockSteamUserAchievement' test.out

#- 241 GetXblUserAchievements
./ng net.accelbyte.sdk.cli.Main platform getXblUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'QIK38g05' \
    --xboxUserId 'WzAm8b9J' \
    > test.out 2>&1
eval_tap $? 241 'GetXblUserAchievements' test.out

#- 242 UpdateXblUserAchievement
./ng net.accelbyte.sdk.cli.Main platform updateXblUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'N3mzPsq0' \
    --body '{"achievements": [{"id": "KpYiao9Y", "percentComplete": 0}, {"id": "0lFNFGUN", "percentComplete": 21}, {"id": "DQVwIeXQ", "percentComplete": 35}], "serviceConfigId": "GahsAGlO", "titleId": "hgB8rpiq", "xboxUserId": "j3eFAjZc"}' \
    > test.out 2>&1
eval_tap $? 242 'UpdateXblUserAchievement' test.out

#- 243 AnonymizeCampaign
./ng net.accelbyte.sdk.cli.Main platform anonymizeCampaign \
    --namespace "$AB_NAMESPACE" \
    --userId 'olsl2uVv' \
    > test.out 2>&1
eval_tap $? 243 'AnonymizeCampaign' test.out

#- 244 AnonymizeEntitlement
./ng net.accelbyte.sdk.cli.Main platform anonymizeEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'xnTqZbWA' \
    > test.out 2>&1
eval_tap $? 244 'AnonymizeEntitlement' test.out

#- 245 AnonymizeFulfillment
./ng net.accelbyte.sdk.cli.Main platform anonymizeFulfillment \
    --namespace "$AB_NAMESPACE" \
    --userId 'aCff53EL' \
    > test.out 2>&1
eval_tap $? 245 'AnonymizeFulfillment' test.out

#- 246 AnonymizeIntegration
./ng net.accelbyte.sdk.cli.Main platform anonymizeIntegration \
    --namespace "$AB_NAMESPACE" \
    --userId 'QYU2xAFA' \
    > test.out 2>&1
eval_tap $? 246 'AnonymizeIntegration' test.out

#- 247 AnonymizeOrder
./ng net.accelbyte.sdk.cli.Main platform anonymizeOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'CX2DvSls' \
    > test.out 2>&1
eval_tap $? 247 'AnonymizeOrder' test.out

#- 248 AnonymizePayment
./ng net.accelbyte.sdk.cli.Main platform anonymizePayment \
    --namespace "$AB_NAMESPACE" \
    --userId 'KA09KXNT' \
    > test.out 2>&1
eval_tap $? 248 'AnonymizePayment' test.out

#- 249 AnonymizeRevocation
./ng net.accelbyte.sdk.cli.Main platform anonymizeRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId 'UwGrwxg4' \
    > test.out 2>&1
eval_tap $? 249 'AnonymizeRevocation' test.out

#- 250 AnonymizeSubscription
./ng net.accelbyte.sdk.cli.Main platform anonymizeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'V9RRCLol' \
    > test.out 2>&1
eval_tap $? 250 'AnonymizeSubscription' test.out

#- 251 AnonymizeWallet
./ng net.accelbyte.sdk.cli.Main platform anonymizeWallet \
    --namespace "$AB_NAMESPACE" \
    --userId 't4MuwNMK' \
    > test.out 2>&1
eval_tap $? 251 'AnonymizeWallet' test.out

#- 252 GetUserDLCByPlatform
./ng net.accelbyte.sdk.cli.Main platform getUserDLCByPlatform \
    --namespace "$AB_NAMESPACE" \
    --userId 'MUTGAu7V' \
    --type 'OCULUS' \
    > test.out 2>&1
eval_tap $? 252 'GetUserDLCByPlatform' test.out

#- 253 GetUserDLC
./ng net.accelbyte.sdk.cli.Main platform getUserDLC \
    --namespace "$AB_NAMESPACE" \
    --userId '2eGFEAgB' \
    --includeAllNamespaces  \
    --status 'REVOKED' \
    --type 'OCULUS' \
    > test.out 2>&1
eval_tap $? 253 'GetUserDLC' test.out

#- 254 QueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'WyTtl1jX' \
    --activeOnly  \
    --appType 'DLC' \
    --collectionId 'eGEDehR2' \
    --entitlementClazz 'APP' \
    --entitlementName 'xInVHgfr' \
    --features 'Gv8kQDQR,gxHdp41h,9u5bWdko' \
    --fuzzyMatchName  \
    --ignoreActiveDate  \
    --itemId 'dbR0Tk0t,rK2Xirix,hlmFD4bM' \
    --limit '74' \
    --offset '69' \
    --origin 'Xbox' \
    > test.out 2>&1
eval_tap $? 254 'QueryUserEntitlements' test.out

#- 255 GrantUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform grantUserEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'HX3yWMZW' \
    --body '[{"collectionId": "GLEmAFei", "endDate": "1976-01-06T00:00:00Z", "grantedCode": "OxnFrW4H", "itemId": "7Opezuoj", "itemNamespace": "Y2hcVHkK", "language": "BCVG_jo", "metadata": {"kbaRklxY": {}, "WAsgqSkP": {}, "iU8NoiyS": {}}, "origin": "GooglePlay", "quantity": 50, "region": "wIWWTdY2", "source": "PROMOTION", "startDate": "1988-11-09T00:00:00Z", "storeId": "MqD3Awdy"}, {"collectionId": "DgXpYkgs", "endDate": "1995-02-25T00:00:00Z", "grantedCode": "mLpJpkuV", "itemId": "fY2cic68", "itemNamespace": "WzkcwcGX", "language": "ZJrj_BHQz-cO", "metadata": {"qvvkvSZL": {}, "knPkWvtV": {}, "bzfBaWWr": {}}, "origin": "Steam", "quantity": 13, "region": "4olX50Wj", "source": "REWARD", "startDate": "1975-02-27T00:00:00Z", "storeId": "gmlKi5jc"}, {"collectionId": "d1jtl1Bt", "endDate": "1998-10-18T00:00:00Z", "grantedCode": "M8TO68aG", "itemId": "x4IgaARB", "itemNamespace": "rvHNByNi", "language": "yAKp-eXry", "metadata": {"tSQIEt7f": {}, "hppGiVOk": {}, "DV0SqxsD": {}}, "origin": "Other", "quantity": 44, "region": "ap0GwjdF", "source": "ACHIEVEMENT", "startDate": "1973-01-08T00:00:00Z", "storeId": "OP3mx2K1"}]' \
    > test.out 2>&1
eval_tap $? 255 'GrantUserEntitlement' test.out

#- 256 GetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'KMgIvjT2' \
    --activeOnly  \
    --appId 'Rj9xyaBd' \
    > test.out 2>&1
eval_tap $? 256 'GetUserAppEntitlementByAppId' test.out

#- 257 QueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'cXuV9HSM' \
    --activeOnly  \
    --limit '56' \
    --offset '95' \
    --appType 'SOFTWARE' \
    > test.out 2>&1
eval_tap $? 257 'QueryUserEntitlementsByAppType' test.out

#- 258 GetUserEntitlementsByIds
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementsByIds \
    --namespace "$AB_NAMESPACE" \
    --userId '8BjuunC0' \
    --ids 'u3fUBAeF,MFJff8yY,oXmHHNKN' \
    > test.out 2>&1
eval_tap $? 258 'GetUserEntitlementsByIds' test.out

#- 259 GetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'kIdWpFJI' \
    --activeOnly  \
    --entitlementClazz 'MEDIA' \
    --platform 'yvgxp8mT' \
    --itemId '6B0b9ceB' \
    > test.out 2>&1
eval_tap $? 259 'GetUserEntitlementByItemId' test.out

#- 260 GetUserActiveEntitlementsByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserActiveEntitlementsByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'm1KfMitd' \
    --ids 'clzFOcOd,7UulgQUL,llEaGrHc' \
    --platform 'MtgsIHmL' \
    > test.out 2>&1
eval_tap $? 260 'GetUserActiveEntitlementsByItemIds' test.out

#- 261 GetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'sjdCFoSL' \
    --activeOnly  \
    --entitlementClazz 'MEDIA' \
    --platform 'fdGKh3hg' \
    --sku 'aKwisqPC' \
    > test.out 2>&1
eval_tap $? 261 'GetUserEntitlementBySku' test.out

#- 262 ExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'A63ivH6G' \
    --appIds '8Xk5CIZT,LQHSY2Vd,WZEP09gD' \
    --itemIds 'HzuM5Du2,RYu0wREd,h1pyldjW' \
    --platform 'mZiqS373' \
    --skus 'jFKTvJjU,jlF6fn2e,vNzdGi2F' \
    > test.out 2>&1
eval_tap $? 262 'ExistsAnyUserActiveEntitlement' test.out

#- 263 ExistsAnyUserActiveEntitlementByItemIds
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlementByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'TE7m2Efk' \
    --platform 'mOXEIwYS' \
    --itemIds 'lMbqBip2,upNYwsAc,Lp8nCvFN' \
    > test.out 2>&1
eval_tap $? 263 'ExistsAnyUserActiveEntitlementByItemIds' test.out

#- 264 GetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'fJjO5Rs2' \
    --appId 'dDb6qwCv' \
    > test.out 2>&1
eval_tap $? 264 'GetUserAppEntitlementOwnershipByAppId' test.out

#- 265 GetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'YlMADFgd' \
    --entitlementClazz 'LOOTBOX' \
    --platform 'TFEQ5iuY' \
    --itemId '1sta6DMo' \
    > test.out 2>&1
eval_tap $? 265 'GetUserEntitlementOwnershipByItemId' test.out

#- 266 GetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'GhKoyeWQ' \
    --ids 'HF9nxow7,1nJTGvOG,ELzKNnWC' \
    --platform '5oD2D6qG' \
    > test.out 2>&1
eval_tap $? 266 'GetUserEntitlementOwnershipByItemIds' test.out

#- 267 GetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'nQhIhrWa' \
    --entitlementClazz 'APP' \
    --platform 'mga6uM4h' \
    --sku '1HzKcPEB' \
    > test.out 2>&1
eval_tap $? 267 'GetUserEntitlementOwnershipBySku' test.out

#- 268 RevokeAllEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeAllEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId '19t7kFVE' \
    > test.out 2>&1
eval_tap $? 268 'RevokeAllEntitlements' test.out

#- 269 RevokeUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId '7tTQWa0l' \
    --entitlementIds 'OBM3RIXh' \
    > test.out 2>&1
eval_tap $? 269 'RevokeUserEntitlements' test.out

#- 270 GetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlement \
    --entitlementId '9d4fvOlo' \
    --namespace "$AB_NAMESPACE" \
    --userId 'o3gJBt8p' \
    > test.out 2>&1
eval_tap $? 270 'GetUserEntitlement' test.out

#- 271 UpdateUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform updateUserEntitlement \
    --entitlementId 'ZxvcwQ9i' \
    --namespace "$AB_NAMESPACE" \
    --userId '4rD9ATvH' \
    --body '{"collectionId": "eWGTdODJ", "endDate": "1986-10-20T00:00:00Z", "nullFieldList": ["vdntzqST", "GzTl2Ud5", "mApC7xtX"], "origin": "Epic", "reason": "y50UIOxp", "startDate": "1979-11-08T00:00:00Z", "status": "ACTIVE", "useCount": 34}' \
    > test.out 2>&1
eval_tap $? 271 'UpdateUserEntitlement' test.out

#- 272 ConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform consumeUserEntitlement \
    --entitlementId 'o8uBBnDx' \
    --namespace "$AB_NAMESPACE" \
    --userId 'YOjCqwgq' \
    --body '{"metadata": {"XXhNNKab": {}, "C3M6gEyj": {}, "ghReIGKl": {}}, "options": ["nKlm3NYW", "qqy4J9yO", "yZlZDJ5o"], "platform": "LDcHdR2m", "requestId": "gleFo6Sk", "useCount": 46}' \
    > test.out 2>&1
eval_tap $? 272 'ConsumeUserEntitlement' test.out

#- 273 DisableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform disableUserEntitlement \
    --entitlementId 'wBlz1zyt' \
    --namespace "$AB_NAMESPACE" \
    --userId 'YWXVSiyN' \
    > test.out 2>&1
eval_tap $? 273 'DisableUserEntitlement' test.out

#- 274 EnableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform enableUserEntitlement \
    --entitlementId 'xso869EK' \
    --namespace "$AB_NAMESPACE" \
    --userId 'wExdETWP' \
    > test.out 2>&1
eval_tap $? 274 'EnableUserEntitlement' test.out

#- 275 GetUserEntitlementHistories
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementHistories \
    --entitlementId 'dFiecPd7' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ss1EMG5q' \
    > test.out 2>&1
eval_tap $? 275 'GetUserEntitlementHistories' test.out

#- 276 RevokeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlement \
    --entitlementId 'k5IHuOzR' \
    --namespace "$AB_NAMESPACE" \
    --userId '1g8jVcIe' \
    --body '{"metadata": {"XerNWqgh": {}, "ZCFVodGF": {}, "AePDpcVU": {}}}' \
    > test.out 2>&1
eval_tap $? 276 'RevokeUserEntitlement' test.out

#- 277 RevokeUserEntitlementByUseCount
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlementByUseCount \
    --entitlementId 'UrNtKgkv' \
    --namespace "$AB_NAMESPACE" \
    --userId 'sReIQVBf' \
    --body '{"reason": "uirYXsYu", "useCount": 47}' \
    > test.out 2>&1
eval_tap $? 277 'RevokeUserEntitlementByUseCount' test.out

#- 278 PreCheckRevokeUserEntitlementByUseCount
./ng net.accelbyte.sdk.cli.Main platform preCheckRevokeUserEntitlementByUseCount \
    --entitlementId 'rUug0OKF' \
    --namespace "$AB_NAMESPACE" \
    --userId 'BZTJxNvD' \
    --quantity '50' \
    > test.out 2>&1
eval_tap $? 278 'PreCheckRevokeUserEntitlementByUseCount' test.out

#- 279 RevokeUseCount
eval_tap 0 279 'RevokeUseCount # SKIP deprecated' test.out

#- 280 SellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform sellUserEntitlement \
    --entitlementId '45VywpeI' \
    --namespace "$AB_NAMESPACE" \
    --userId 'PD53o51L' \
    --body '{"platform": "7PiYQy2q", "requestId": "4lS0K3gJ", "useCount": 86}' \
    > test.out 2>&1
eval_tap $? 280 'SellUserEntitlement' test.out

#- 281 FulfillItem
./ng net.accelbyte.sdk.cli.Main platform fulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'U92fsR88' \
    --body '{"duration": 13, "endDate": "1998-05-30T00:00:00Z", "entitlementCollectionId": "pgypZO8X", "entitlementOrigin": "Twitch", "itemId": "epe3aoB1", "itemSku": "I4ME0Q4O", "language": "fZtsEbD4", "metadata": {"NSCiVpiJ": {}, "u5IOmuAj": {}, "kf0KkARB": {}}, "order": {"currency": {"currencyCode": "fYf9Y2Nn", "currencySymbol": "TrlfQR7T", "currencyType": "REAL", "decimals": 31, "namespace": "NiKU0Tnl"}, "ext": {"56pEAkU4": {}, "D4on4oBs": {}, "EoRYj0zq": {}}, "free": true}, "orderNo": "knjckZ1u", "origin": "Xbox", "overrideBundleItemQty": {"KBWxPKKp": 60, "MAVc85oL": 40, "tNadfyZ3": 23}, "quantity": 24, "region": "bBopb78B", "source": "EXPIRATION", "startDate": "1995-01-20T00:00:00Z", "storeId": "qheKDp86"}' \
    > test.out 2>&1
eval_tap $? 281 'FulfillItem' test.out

#- 282 RedeemCode
./ng net.accelbyte.sdk.cli.Main platform redeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'zYtbIFSW' \
    --body '{"code": "dLKUxBzj", "language": "Ge_598", "region": "qZzcsleR"}' \
    > test.out 2>&1
eval_tap $? 282 'RedeemCode' test.out

#- 283 PreCheckFulfillItem
./ng net.accelbyte.sdk.cli.Main platform preCheckFulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'g4wZglMU' \
    --body '{"itemId": "85IgnYVe", "itemSku": "cSk8f69I", "quantity": 75}' \
    > test.out 2>&1
eval_tap $? 283 'PreCheckFulfillItem' test.out

#- 284 FulfillRewards
./ng net.accelbyte.sdk.cli.Main platform fulfillRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'kEieLLI0' \
    --body '{"entitlementCollectionId": "Hk73vEud", "entitlementOrigin": "Steam", "metadata": {"zl3GMAU5": {}, "DJsCwdQk": {}, "Hg0sSjv8": {}}, "origin": "Twitch", "rewards": [{"currency": {"currencyCode": "GqkOiWBJ", "namespace": "JPZnbsOB"}, "item": {"itemId": "MAhAIdFg", "itemName": "CTTfAOP5", "itemSku": "5JlNDSMz", "itemType": "DYPT0sax"}, "quantity": 14, "type": "CURRENCY"}, {"currency": {"currencyCode": "Pip5wV16", "namespace": "6LTXsmeU"}, "item": {"itemId": "xuUcdlzU", "itemName": "d59Su6i0", "itemSku": "c5F7YTJc", "itemType": "CKLTJ7tg"}, "quantity": 41, "type": "ITEM"}, {"currency": {"currencyCode": "zd76jkcp", "namespace": "uN6seMoS"}, "item": {"itemId": "9wKga9ua", "itemName": "pMV3RKNQ", "itemSku": "o1jtKWtK", "itemType": "63iu7Vcu"}, "quantity": 5, "type": "CURRENCY"}], "source": "ORDER_REVOCATION", "transactionId": "O9CeRBWZ"}' \
    > test.out 2>&1
eval_tap $? 284 'FulfillRewards' test.out

#- 285 QueryUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId '3MD7yvvT' \
    --endTime 'lvy6RDdq' \
    --limit '29' \
    --offset '19' \
    --productId 'n1uHTSGB' \
    --startTime 'zvEx6mvv' \
    --status 'FAILED' \
    --type 'PLAYSTATION' \
    > test.out 2>&1
eval_tap $? 285 'QueryUserIAPOrders' test.out

#- 286 QueryAllUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryAllUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'OQsls2iS' \
    > test.out 2>&1
eval_tap $? 286 'QueryAllUserIAPOrders' test.out

#- 287 QueryUserIAPConsumeHistory
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPConsumeHistory \
    --namespace "$AB_NAMESPACE" \
    --userId '0zCydvfY' \
    --endTime 'm4kbgVBu' \
    --limit '67' \
    --offset '43' \
    --startTime 'RHFiyX1N' \
    --status 'FAIL' \
    --type 'XBOX' \
    > test.out 2>&1
eval_tap $? 287 'QueryUserIAPConsumeHistory' test.out

#- 288 MockFulfillIAPItem
./ng net.accelbyte.sdk.cli.Main platform mockFulfillIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'ci6gfCdp' \
    --body '{"itemIdentityType": "ITEM_SKU", "language": "UBPo_Mori-SJ", "productId": "Q36ok7jG", "region": "1yUMWvzn", "transactionId": "jl9uISlA", "type": "APPLE"}' \
    > test.out 2>&1
eval_tap $? 288 'MockFulfillIAPItem' test.out

#- 289 AdminGetIAPOrderLineItems
./ng net.accelbyte.sdk.cli.Main platform adminGetIAPOrderLineItems \
    --iapOrderNo 'N1pnAair' \
    --namespace "$AB_NAMESPACE" \
    --userId 'UMWmLTp6' \
    > test.out 2>&1
eval_tap $? 289 'AdminGetIAPOrderLineItems' test.out

#- 290 AdminSyncSteamAbnormalTransaction
./ng net.accelbyte.sdk.cli.Main platform adminSyncSteamAbnormalTransaction \
    --namespace "$AB_NAMESPACE" \
    --userId 'qMDF3xEB' \
    > test.out 2>&1
eval_tap $? 290 'AdminSyncSteamAbnormalTransaction' test.out

#- 291 AdminSyncSteamIAPByTransaction
./ng net.accelbyte.sdk.cli.Main platform adminSyncSteamIAPByTransaction \
    --namespace "$AB_NAMESPACE" \
    --userId 'UTHWZVJE' \
    --body '{"orderId": "JUtW4DcS"}' \
    > test.out 2>&1
eval_tap $? 291 'AdminSyncSteamIAPByTransaction' test.out

#- 292 QueryUserThirdPartySubscription
./ng net.accelbyte.sdk.cli.Main platform queryUserThirdPartySubscription \
    --namespace "$AB_NAMESPACE" \
    --userId '2GzDaibT' \
    --activeOnly  \
    --groupId '2GWiVRGi' \
    --limit '22' \
    --offset '5' \
    --platform 'GOOGLE' \
    --productId 'Fzfvn2TM' \
    > test.out 2>&1
eval_tap $? 292 'QueryUserThirdPartySubscription' test.out

#- 293 GetThirdPartyPlatformSubscriptionOwnershipByGroupId
./ng net.accelbyte.sdk.cli.Main platform getThirdPartyPlatformSubscriptionOwnershipByGroupId \
    --namespace "$AB_NAMESPACE" \
    --platform 'EPICGAMES' \
    --userId 'Ix2BLLCh' \
    --groupId 'I9pfc8wr' \
    > test.out 2>&1
eval_tap $? 293 'GetThirdPartyPlatformSubscriptionOwnershipByGroupId' test.out

#- 294 GetThirdPartyPlatformSubscriptionOwnershipByProductId
./ng net.accelbyte.sdk.cli.Main platform getThirdPartyPlatformSubscriptionOwnershipByProductId \
    --namespace "$AB_NAMESPACE" \
    --platform 'STEAM' \
    --userId 'VV5Z7kXv' \
    --productId 'RoyyI9eR' \
    > test.out 2>&1
eval_tap $? 294 'GetThirdPartyPlatformSubscriptionOwnershipByProductId' test.out

#- 295 QueryUserThirdPartySubscriptionTransactions
./ng net.accelbyte.sdk.cli.Main platform queryUserThirdPartySubscriptionTransactions \
    --namespace "$AB_NAMESPACE" \
    --userId 'mTyBZn4i' \
    --activeOnly  \
    --groupId 'SthvAQLn' \
    --limit '75' \
    --offset '93' \
    --platform 'OCULUS' \
    --productId 'HDgJZBGM' \
    > test.out 2>&1
eval_tap $? 295 'QueryUserThirdPartySubscriptionTransactions' test.out

#- 296 GetThirdPartySubscriptionDetails
./ng net.accelbyte.sdk.cli.Main platform getThirdPartySubscriptionDetails \
    --id 'y8JiSHVk' \
    --namespace "$AB_NAMESPACE" \
    --userId 'hIZXGNMx' \
    > test.out 2>&1
eval_tap $? 296 'GetThirdPartySubscriptionDetails' test.out

#- 297 GetSubscriptionHistory
./ng net.accelbyte.sdk.cli.Main platform getSubscriptionHistory \
    --id 'wJA6Ze8l' \
    --namespace "$AB_NAMESPACE" \
    --userId 'HqQMETbC' \
    --limit '9' \
    --offset '35' \
    > test.out 2>&1
eval_tap $? 297 'GetSubscriptionHistory' test.out

#- 298 SyncSubscriptionTransaction
./ng net.accelbyte.sdk.cli.Main platform syncSubscriptionTransaction \
    --id 'ldLTc6Ll' \
    --namespace "$AB_NAMESPACE" \
    --userId 'nWaCQQPl' \
    > test.out 2>&1
eval_tap $? 298 'SyncSubscriptionTransaction' test.out

#- 299 GetThirdPartyUserSubscriptionDetails
./ng net.accelbyte.sdk.cli.Main platform getThirdPartyUserSubscriptionDetails \
    --id 'UKhjBBk9' \
    --namespace "$AB_NAMESPACE" \
    --userId 'fRl7pat0' \
    > test.out 2>&1
eval_tap $? 299 'GetThirdPartyUserSubscriptionDetails' test.out

#- 300 SyncSubscription
./ng net.accelbyte.sdk.cli.Main platform syncSubscription \
    --id 'qVnAv7q7' \
    --namespace "$AB_NAMESPACE" \
    --userId 'gBzARnnQ' \
    > test.out 2>&1
eval_tap $? 300 'SyncSubscription' test.out

#- 301 QueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'thN3RXIV' \
    --discounted  \
    --itemId 'TYagIgmd' \
    --limit '23' \
    --offset '88' \
    --status 'CLOSED' \
    > test.out 2>&1
eval_tap $? 301 'QueryUserOrders' test.out

#- 302 AdminCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform adminCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'CHS0pfW1' \
    --body '{"currencyCode": "lVCEKOsh", "currencyNamespace": "ix3EUKlw", "discountCodes": ["em4uTIwJ", "HEt8VdiA", "l5HIqja6"], "discountedPrice": 47, "entitlementPlatform": "Nintendo", "ext": {"od8nd5xS": {}, "bGkOiJDC": {}, "IOIknENa": {}}, "itemId": "6b5szoQK", "language": "lYVL0hDN", "options": {"skipPriceValidation": true}, "platform": "IOS", "price": 78, "quantity": 45, "region": "d7q7UcRf", "returnUrl": "VbJWIzgN", "sandbox": true, "sectionId": "HNj0KZLs"}' \
    > test.out 2>&1
eval_tap $? 302 'AdminCreateUserOrder' test.out

#- 303 CountOfPurchasedItem
./ng net.accelbyte.sdk.cli.Main platform countOfPurchasedItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'ofPyouDS' \
    --itemId 'teo58qAO' \
    > test.out 2>&1
eval_tap $? 303 'CountOfPurchasedItem' test.out

#- 304 GetUserOrder
./ng net.accelbyte.sdk.cli.Main platform getUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'nDng9P7i' \
    --userId 'ULcoPrlG' \
    > test.out 2>&1
eval_tap $? 304 'GetUserOrder' test.out

#- 305 UpdateUserOrderStatus
./ng net.accelbyte.sdk.cli.Main platform updateUserOrderStatus \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'eJP0FIR5' \
    --userId 'mlqN1Wt8' \
    --body '{"status": "CLOSED", "statusReason": "LJmKvnGs"}' \
    > test.out 2>&1
eval_tap $? 305 'UpdateUserOrderStatus' test.out

#- 306 FulfillUserOrder
./ng net.accelbyte.sdk.cli.Main platform fulfillUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'nR1hynNL' \
    --userId 'g3G9Ctbq' \
    > test.out 2>&1
eval_tap $? 306 'FulfillUserOrder' test.out

#- 307 GetUserOrderGrant
eval_tap 0 307 'GetUserOrderGrant # SKIP deprecated' test.out

#- 308 GetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform getUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'kMvURwLn' \
    --userId '3N4jvPwQ' \
    > test.out 2>&1
eval_tap $? 308 'GetUserOrderHistories' test.out

#- 309 ProcessUserOrderNotification
./ng net.accelbyte.sdk.cli.Main platform processUserOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'c2Dd05Pu' \
    --userId 'ZL4UW60y' \
    --body '{"additionalData": {"cardSummary": "85GbemRi"}, "authorisedTime": "1990-03-26T00:00:00Z", "chargebackReversedTime": "1981-05-30T00:00:00Z", "chargebackTime": "1988-02-12T00:00:00Z", "chargedTime": "1977-09-13T00:00:00Z", "createdTime": "1989-08-19T00:00:00Z", "currency": {"currencyCode": "KSYua2bb", "currencySymbol": "vfXBjRmm", "currencyType": "REAL", "decimals": 56, "namespace": "7KNHoJyG"}, "customParameters": {"TK2hYfl8": {}, "j7tAUyv4": {}, "GrnnaVdW": {}}, "extOrderNo": "TtkXPdst", "extTxId": "bkyEdu7L", "extUserId": "0uQx2JnS", "issuedAt": "1982-05-31T00:00:00Z", "metadata": {"OhcQSBQb": "80dwx7lr", "ffD60Evm": "OvuPUt6K", "gJdal9zw": "qec8qsKG"}, "namespace": "DSf6UHrv", "nonceStr": "6WePT0rw", "paymentData": {"discountAmount": 76, "discountCode": "6dc1H18e", "subtotalPrice": 84, "tax": 23, "totalPrice": 36}, "paymentMethod": "DjWdn7hH", "paymentMethodFee": 59, "paymentOrderNo": "rLQ5g5dH", "paymentProvider": "STRIPE", "paymentProviderFee": 11, "paymentStationUrl": "2biLj5R6", "price": 61, "refundedTime": "1995-06-05T00:00:00Z", "salesTax": 81, "sandbox": false, "sku": "zh5oKqZS", "status": "REFUND_FAILED", "statusReason": "3mgEcBEJ", "subscriptionId": "yJqvzxC7", "subtotalPrice": 92, "targetNamespace": "AE9BVKFJ", "targetUserId": "lC0isIkt", "tax": 53, "totalPrice": 95, "totalTax": 58, "txEndTime": "1983-12-06T00:00:00Z", "type": "TvGzgB2B", "userId": "hGV3Ux7i", "vat": 61}' \
    > test.out 2>&1
eval_tap $? 309 'ProcessUserOrderNotification' test.out

#- 310 DownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform downloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'lxwsiqJ4' \
    --userId 'wu5ZAURL' \
    > test.out 2>&1
eval_tap $? 310 'DownloadUserOrderReceipt' test.out

#- 311 CreateUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform createUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'BTs8hMsx' \
    --body '{"currencyCode": "G8REgeHl", "currencyNamespace": "RUvFhqE8", "customParameters": {"CHKNXXF3": {}, "s99qxBoN": {}, "Mwj8BXLt": {}}, "description": "KBzkSVbl", "extOrderNo": "vzYuM1DP", "extUserId": "DA0Nt11F", "itemType": "OPTIONBOX", "language": "NorV", "metadata": {"9sDIQu1Q": "kcAXEsAe", "AmbBoIzu": "2A5n2iEn", "nEWmKTha": "d8jbUvZ6"}, "notifyUrl": "tJEjEX1o", "omitNotification": true, "platform": "Y48n8ItH", "price": 14, "recurringPaymentOrderNo": "OOwFxihh", "region": "TQQBT0eD", "returnUrl": "YhUYI4Q0", "sandbox": true, "sku": "82zmM7R9", "subscriptionId": "tD4JOaRm", "title": "2yIxtAg3"}' \
    > test.out 2>&1
eval_tap $? 311 'CreateUserPaymentOrder' test.out

#- 312 RefundUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform refundUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'QSELeQlJ' \
    --userId 't5h5wMN5' \
    --body '{"description": "Hfq8X0zX"}' \
    > test.out 2>&1
eval_tap $? 312 'RefundUserPaymentOrder' test.out

#- 313 GetUserPlatformAccountClosureHistories
./ng net.accelbyte.sdk.cli.Main platform getUserPlatformAccountClosureHistories \
    --namespace "$AB_NAMESPACE" \
    --userId 'MkPXhH81' \
    > test.out 2>&1
eval_tap $? 313 'GetUserPlatformAccountClosureHistories' test.out

#- 314 ApplyUserRedemption
./ng net.accelbyte.sdk.cli.Main platform applyUserRedemption \
    --namespace "$AB_NAMESPACE" \
    --userId 'SgJEH99s' \
    --body '{"code": "NwELlqnL", "orderNo": "BftOXFAU"}' \
    > test.out 2>&1
eval_tap $? 314 'ApplyUserRedemption' test.out

#- 315 DoRevocation
./ng net.accelbyte.sdk.cli.Main platform doRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId 'NrRXYwvL' \
    --body '{"meta": {"VF713RJA": {}, "x87U51q4": {}, "IxkobNET": {}}, "reason": "1xM5lFcv", "requestId": "jjepJt32", "revokeEntries": [{"currency": {"balanceOrigin": "Oculus", "currencyCode": "st5JIW8z", "namespace": "HvVWzBzY"}, "entitlement": {"entitlementId": "EXflCLwy"}, "item": {"entitlementOrigin": "GooglePlay", "itemIdentity": "GkPf0knL", "itemIdentityType": "ITEM_SKU", "origin": "Xbox"}, "quantity": 64, "type": "CURRENCY"}, {"currency": {"balanceOrigin": "Oculus", "currencyCode": "YlctvcaP", "namespace": "gkEGmgpo"}, "entitlement": {"entitlementId": "80ZdbU61"}, "item": {"entitlementOrigin": "Playstation", "itemIdentity": "NJ8Mv1kC", "itemIdentityType": "ITEM_ID", "origin": "Nintendo"}, "quantity": 16, "type": "CURRENCY"}, {"currency": {"balanceOrigin": "Epic", "currencyCode": "UuPSzzsg", "namespace": "G8G6jEH7"}, "entitlement": {"entitlementId": "RrsWjgRs"}, "item": {"entitlementOrigin": "IOS", "itemIdentity": "oT30P4Uo", "itemIdentityType": "ITEM_ID", "origin": "Playstation"}, "quantity": 25, "type": "ITEM"}], "source": "IAP", "transactionId": "CJe1VfD2"}' \
    > test.out 2>&1
eval_tap $? 315 'DoRevocation' test.out

#- 316 RegisterXblSessions
./ng net.accelbyte.sdk.cli.Main platform registerXblSessions \
    --namespace "$AB_NAMESPACE" \
    --userId 'c9XEKhcb' \
    --body '{"gameSessionId": "C1trwXjR", "payload": {"y9uh1sm3": {}, "XtlMQhx5": {}, "OqQtVrdR": {}}, "scid": "pmw6Vog4", "sessionTemplateName": "zulUZZ6n"}' \
    > test.out 2>&1
eval_tap $? 316 'RegisterXblSessions' test.out

#- 317 QueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform queryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId '2ot5RpW4' \
    --chargeStatus 'NEVER' \
    --itemId 'oFUjaW0k' \
    --limit '28' \
    --offset '78' \
    --sku 'aI4DFs37' \
    --status 'INIT' \
    --subscribedBy 'USER' \
    > test.out 2>&1
eval_tap $? 317 'QueryUserSubscriptions' test.out

#- 318 GetUserSubscriptionActivities
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionActivities \
    --namespace "$AB_NAMESPACE" \
    --userId '6NWgI27t' \
    --excludeSystem  \
    --limit '60' \
    --offset '52' \
    --subscriptionId 'C3HdHSR2' \
    > test.out 2>&1
eval_tap $? 318 'GetUserSubscriptionActivities' test.out

#- 319 PlatformSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform platformSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'auu7hwwp' \
    --body '{"grantDays": 20, "itemId": "Z5WaAxi8", "language": "6t27WMI8", "reason": "4Rf0PSHi", "region": "egLTWpDQ", "source": "EedB526q"}' \
    > test.out 2>&1
eval_tap $? 319 'PlatformSubscribeSubscription' test.out

#- 320 CheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform checkUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'eDeVE7fT' \
    --itemId 'qSJYySUD' \
    > test.out 2>&1
eval_tap $? 320 'CheckUserSubscriptionSubscribableByItemId' test.out

#- 321 GetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform getUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'aXTcPFLT' \
    --userId 'KQKkp2Dv' \
    > test.out 2>&1
eval_tap $? 321 'GetUserSubscription' test.out

#- 322 DeleteUserSubscription
./ng net.accelbyte.sdk.cli.Main platform deleteUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'bbVgFCbD' \
    --userId 'F4bXvPwy' \
    > test.out 2>&1
eval_tap $? 322 'DeleteUserSubscription' test.out

#- 323 CancelSubscription
./ng net.accelbyte.sdk.cli.Main platform cancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '8YkFH7GH' \
    --userId 'ITKmNmOX' \
    --force  \
    --body '{"immediate": false, "reason": "ZdvCx9Gc"}' \
    > test.out 2>&1
eval_tap $? 323 'CancelSubscription' test.out

#- 324 GrantDaysToSubscription
./ng net.accelbyte.sdk.cli.Main platform grantDaysToSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'H4hlgcq0' \
    --userId '8V83jwvX' \
    --body '{"grantDays": 99, "reason": "iRbK4Hzl"}' \
    > test.out 2>&1
eval_tap $? 324 'GrantDaysToSubscription' test.out

#- 325 GetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'JxThl68d' \
    --userId 't2oKA96a' \
    --excludeFree  \
    --limit '25' \
    --offset '64' \
    > test.out 2>&1
eval_tap $? 325 'GetUserSubscriptionBillingHistories' test.out

#- 326 ProcessUserSubscriptionNotification
./ng net.accelbyte.sdk.cli.Main platform processUserSubscriptionNotification \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'QixzD6Qs' \
    --userId 'Z04aQsNT' \
    --body '{"additionalData": {"cardSummary": "JUNkzp3V"}, "authorisedTime": "1995-10-22T00:00:00Z", "chargebackReversedTime": "1976-07-17T00:00:00Z", "chargebackTime": "1982-01-17T00:00:00Z", "chargedTime": "1972-07-22T00:00:00Z", "createdTime": "1996-09-04T00:00:00Z", "currency": {"currencyCode": "8BCT9xaX", "currencySymbol": "DMwfb0RE", "currencyType": "REAL", "decimals": 24, "namespace": "B7OD0Tol"}, "customParameters": {"xol1tYeU": {}, "4Ysyj40v": {}, "o6JXJPhN": {}}, "extOrderNo": "4lOchKVm", "extTxId": "oKiqyIRB", "extUserId": "HuO6sPkE", "issuedAt": "1977-05-20T00:00:00Z", "metadata": {"ej3X3Op9": "JInzanX7", "jbbTsW7Y": "OnT6fDbH", "7nDx9Eqd": "ud2yPAEN"}, "namespace": "dJOaxADS", "nonceStr": "ZRgxvNCO", "paymentData": {"discountAmount": 59, "discountCode": "B4oUmJzJ", "subtotalPrice": 8, "tax": 92, "totalPrice": 41}, "paymentMethod": "3rHFvsvl", "paymentMethodFee": 96, "paymentOrderNo": "nqLaTZgI", "paymentProvider": "ALIPAY", "paymentProviderFee": 93, "paymentStationUrl": "vHZ515ZA", "price": 14, "refundedTime": "1988-05-24T00:00:00Z", "salesTax": 21, "sandbox": true, "sku": "4WmsZjN5", "status": "CHARGEBACK_REVERSED", "statusReason": "tLrGJD80", "subscriptionId": "X6RM2Yl6", "subtotalPrice": 17, "targetNamespace": "U1Lxxqc3", "targetUserId": "5ECEiOud", "tax": 55, "totalPrice": 85, "totalTax": 29, "txEndTime": "1982-07-28T00:00:00Z", "type": "Hbgrhccu", "userId": "yv316zbw", "vat": 65}' \
    > test.out 2>&1
eval_tap $? 326 'ProcessUserSubscriptionNotification' test.out

#- 327 AcquireUserTicket
./ng net.accelbyte.sdk.cli.Main platform acquireUserTicket \
    --boothName 'UNI2mhCB' \
    --namespace "$AB_NAMESPACE" \
    --userId 'gNuGB2D6' \
    --body '{"count": 2, "orderNo": "FiBXMRI8"}' \
    > test.out 2>&1
eval_tap $? 327 'AcquireUserTicket' test.out

#- 328 QueryUserCurrencyWallets
./ng net.accelbyte.sdk.cli.Main platform queryUserCurrencyWallets \
    --namespace "$AB_NAMESPACE" \
    --userId 'hPs6vVyF' \
    > test.out 2>&1
eval_tap $? 328 'QueryUserCurrencyWallets' test.out

#- 329 DebitUserWalletByCurrencyCode
./ng net.accelbyte.sdk.cli.Main platform debitUserWalletByCurrencyCode \
    --currencyCode 'ttpkYOxV' \
    --namespace "$AB_NAMESPACE" \
    --userId 'n1jyph4R' \
    --body '{"allowOverdraft": true, "amount": 99, "balanceOrigin": "Twitch", "balanceSource": "TRADE", "metadata": {"jXgy4hgw": {}, "q279rWih": {}, "9TbDxGek": {}}, "reason": "V7g9Ac9q"}' \
    > test.out 2>&1
eval_tap $? 329 'DebitUserWalletByCurrencyCode' test.out

#- 330 ListUserCurrencyTransactions
./ng net.accelbyte.sdk.cli.Main platform listUserCurrencyTransactions \
    --currencyCode 'uFestq8p' \
    --namespace "$AB_NAMESPACE" \
    --userId 'nmpjvNzx' \
    --limit '76' \
    --offset '79' \
    > test.out 2>&1
eval_tap $? 330 'ListUserCurrencyTransactions' test.out

#- 331 CheckBalance
./ng net.accelbyte.sdk.cli.Main platform checkBalance \
    --currencyCode '0onHE2M5' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ojpp4Ekl' \
    --request '{"amount": 47, "debitBalanceSource": "ORDER_REVOCATION", "metadata": {"IsXZmDPR": {}, "fcpRlGSY": {}, "ZUNCs6O1": {}}, "reason": "c5kPlLVV", "walletPlatform": "GooglePlay"}' \
    > test.out 2>&1
eval_tap $? 331 'CheckBalance' test.out

#- 332 CheckWallet
eval_tap 0 332 'CheckWallet # SKIP deprecated' test.out

#- 333 CreditUserWallet
./ng net.accelbyte.sdk.cli.Main platform creditUserWallet \
    --currencyCode 'Vw9PxKDt' \
    --namespace "$AB_NAMESPACE" \
    --userId 'uvpSk6Xr' \
    --body '{"amount": 86, "expireAt": "1974-06-15T00:00:00Z", "metadata": {"IeTHnzDJ": {}, "l5ZnI7HW": {}, "wlqKp9zJ": {}}, "origin": "Oculus", "reason": "9mHbBAtq", "source": "IAP_CHARGEBACK_REVERSED"}' \
    > test.out 2>&1
eval_tap $? 333 'CreditUserWallet' test.out

#- 334 DebitByWalletPlatform
./ng net.accelbyte.sdk.cli.Main platform debitByWalletPlatform \
    --currencyCode 'Am6ntASn' \
    --namespace "$AB_NAMESPACE" \
    --userId 'zxC9ujwA' \
    --request '{"amount": 54, "debitBalanceSource": "EXPIRATION", "metadata": {"IqQVOwv4": {}, "rWs8g6VL": {}, "TxyuEjLq": {}}, "reason": "nW0Mn9Ph", "walletPlatform": "Playstation"}' \
    > test.out 2>&1
eval_tap $? 334 'DebitByWalletPlatform' test.out

#- 335 PayWithUserWallet
./ng net.accelbyte.sdk.cli.Main platform payWithUserWallet \
    --currencyCode '08uuVbDr' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ct9sDSyU' \
    --body '{"amount": 7, "metadata": {"6xvw2ocS": {}, "FB0O1Y4R": {}, "r6nVLWrq": {}}, "walletPlatform": "Oculus"}' \
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
    --storeId 'sY8BIH85' \
    > test.out 2>&1
eval_tap $? 341 'ListViews' test.out

#- 342 CreateView
./ng net.accelbyte.sdk.cli.Main platform createView \
    --namespace "$AB_NAMESPACE" \
    --storeId 'V57nRHUF' \
    --body '{"displayOrder": 51, "localizations": {"srYHc6jT": {"description": "TCFbp3xY", "localExt": {"oMHOIAXz": {}, "ehwtEbzq": {}, "qIdnJPol": {}}, "longDescription": "Bbmn1aWp", "title": "r2l7kRtU"}, "CpIHKuMn": {"description": "m0ZYo8ca", "localExt": {"UcYmkNmp": {}, "H8iPx3SE": {}, "I3e4dgOg": {}}, "longDescription": "xfzqATKv", "title": "TfP8V5cl"}, "qHQrng3V": {"description": "kSYN2epE", "localExt": {"UXPL8qOe": {}, "pHbE1LTj": {}, "fgDsbxnJ": {}}, "longDescription": "o7hf67Ag", "title": "Hz1NRVNx"}}, "name": "LPYeFDP2"}' \
    > test.out 2>&1
eval_tap $? 342 'CreateView' test.out

#- 343 GetView
./ng net.accelbyte.sdk.cli.Main platform getView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'Yyn7Fv1Q' \
    --storeId '5AqG7W3M' \
    > test.out 2>&1
eval_tap $? 343 'GetView' test.out

#- 344 UpdateView
./ng net.accelbyte.sdk.cli.Main platform updateView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'kjjcPpWf' \
    --storeId 'tYaxuguj' \
    --body '{"displayOrder": 88, "localizations": {"cqCauMI1": {"description": "5QQWlddt", "localExt": {"ZaP1ZjJO": {}, "sqdX35sv": {}, "0LHawrVN": {}}, "longDescription": "DcHjdub0", "title": "DfiKCGKQ"}, "f9yPggnp": {"description": "mcl3afQK", "localExt": {"HmeSzjiy": {}, "JfYm9yiA": {}, "sHsKLLCm": {}}, "longDescription": "r5UeuTrG", "title": "njHFeNKu"}, "C3nXoKrr": {"description": "sLVMYOn9", "localExt": {"S3R26zCQ": {}, "onDfPEdx": {}, "g8gO31gs": {}}, "longDescription": "BsAzkj6F", "title": "vzB9NHkm"}}, "name": "BUr4oYeE"}' \
    > test.out 2>&1
eval_tap $? 344 'UpdateView' test.out

#- 345 DeleteView
./ng net.accelbyte.sdk.cli.Main platform deleteView \
    --namespace "$AB_NAMESPACE" \
    --viewId '0arE70DY' \
    --storeId '3l96z6PI' \
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
    --body '[{"creditRequest": {"amount": 46, "expireAt": "1986-08-24T00:00:00Z", "metadata": {"2K8gWVsp": {}, "0GKNChi4": {}, "JQTo60g2": {}}, "origin": "Playstation", "reason": "cunZaSfC", "source": "IAP_CHARGEBACK_REVERSED"}, "currencyCode": "bI1nx8c9", "userIds": ["LAdjFqqc", "EylFZ2dr", "rvariqFV"]}, {"creditRequest": {"amount": 72, "expireAt": "1971-06-03T00:00:00Z", "metadata": {"8WEB2jJh": {}, "p4cBwQXQ": {}, "YNIr1kT1": {}}, "origin": "IOS", "reason": "JQsnUVXm", "source": "DLC"}, "currencyCode": "pMVUIiWX", "userIds": ["TDQ1v8wp", "gg2qh3db", "3bxEiuT7"]}, {"creditRequest": {"amount": 49, "expireAt": "1980-01-31T00:00:00Z", "metadata": {"Q1EOU88e": {}, "EfiWaPOr": {}, "mdJtIO36": {}}, "origin": "Playstation", "reason": "PtwU3Unm", "source": "REFERRAL_BONUS"}, "currencyCode": "plwwWbqn", "userIds": ["oRkbJZ4P", "9asB9Q7t", "3khtMG60"]}]' \
    > test.out 2>&1
eval_tap $? 349 'BulkCredit' test.out

#- 350 BulkDebit
./ng net.accelbyte.sdk.cli.Main platform bulkDebit \
    --namespace "$AB_NAMESPACE" \
    --body '[{"currencyCode": "vgU4iGHF", "request": {"allowOverdraft": false, "amount": 14, "balanceOrigin": "Playstation", "balanceSource": "IAP_REVOCATION", "metadata": {"Af7t95vw": {}, "UHEJ8T8Y": {}, "GPj44y2m": {}}, "reason": "wTm8gGd9"}, "userIds": ["73QdoRsf", "caHaYhJo", "vtWqLjc3"]}, {"currencyCode": "cERQgKfR", "request": {"allowOverdraft": true, "amount": 26, "balanceOrigin": "Other", "balanceSource": "EXPIRATION", "metadata": {"GU2eStHF": {}, "pE1RNoMu": {}, "zudMrSVs": {}}, "reason": "z0rFmdPk"}, "userIds": ["RnX3oP1Y", "9v5iKHvc", "ycYubQqu"]}, {"currencyCode": "wv8KnEX0", "request": {"allowOverdraft": false, "amount": 82, "balanceOrigin": "Steam", "balanceSource": "IAP_REVOCATION", "metadata": {"ncoYPtL8": {}, "rnv1D7yJ": {}, "W46ZxpHj": {}}, "reason": "BjUyNwnn"}, "userIds": ["ZFyJfGMK", "KNFuV9Mz", "N7wJn8ER"]}]' \
    > test.out 2>&1
eval_tap $? 350 'BulkDebit' test.out

#- 351 GetWallet
eval_tap 0 351 'GetWallet # SKIP deprecated' test.out

#- 352 SyncOrders
./ng net.accelbyte.sdk.cli.Main platform syncOrders \
    --nextEvaluatedKey 'AsTT5c9E' \
    --end 'I1sgGHl2' \
    --start '3R8p8QIy' \
    > test.out 2>&1
eval_tap $? 352 'SyncOrders' test.out

#- 353 TestAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfig \
    --sandbox  \
    --body '{"allowedPaymentMethods": ["oQkMoRKj", "6HeEa0nj", "ISlwDBXr"], "apiKey": "xzkO3q2V", "authoriseAsCapture": true, "blockedPaymentMethods": ["2A7NZcVv", "SJR6HFtz", "KtisaQmb"], "clientKey": "iE0Kpg4T", "dropInSettings": "CvM8Xmgt", "liveEndpointUrlPrefix": "ijWfGfEJ", "merchantAccount": "UJ75GIBo", "notificationHmacKey": "Q9j1z5UU", "notificationPassword": "V4ASNQyc", "notificationUsername": "uip8de4u", "returnUrl": "zsCqMOPe", "settings": "4pLt8dEJ"}' \
    > test.out 2>&1
eval_tap $? 353 'TestAdyenConfig' test.out

#- 354 TestAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfig \
    --sandbox  \
    --body '{"appId": "PXDMM7bd", "privateKey": "QJH2uaXv", "publicKey": "lWpEasUD", "returnUrl": "UqIBrnBr"}' \
    > test.out 2>&1
eval_tap $? 354 'TestAliPayConfig' test.out

#- 355 TestCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfig \
    --sandbox  \
    --body '{"publicKey": "c3BgLWKw", "secretKey": "QYH6INET"}' \
    > test.out 2>&1
eval_tap $? 355 'TestCheckoutConfig' test.out

#- 356 DebugMatchedPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentMerchantConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'JgYZ9LVU' \
    > test.out 2>&1
eval_tap $? 356 'DebugMatchedPaymentMerchantConfig' test.out

#- 357 TestNeonPayConfig
./ng net.accelbyte.sdk.cli.Main platform testNeonPayConfig \
    --sandbox  \
    --body '{"apiKey": "AN6MXF5p", "webhookSecretKey": "yosc50y4"}' \
    > test.out 2>&1
eval_tap $? 357 'TestNeonPayConfig' test.out

#- 358 TestPayPalConfig
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfig \
    --sandbox  \
    --body '{"clientID": "mSN3ZPEr", "clientSecret": "1IH9sMkx", "returnUrl": "MsR4qdi7", "webHookId": "0PZcjQnB"}' \
    > test.out 2>&1
eval_tap $? 358 'TestPayPalConfig' test.out

#- 359 TestStripeConfig
./ng net.accelbyte.sdk.cli.Main platform testStripeConfig \
    --sandbox  \
    --body '{"allowedPaymentMethodTypes": ["wMe0EANp", "tv7RH9ox", "2ndZPqtI"], "publishableKey": "sSzH16vc", "secretKey": "dNPD4K3c", "webhookSecret": "8TrYC2Jh"}' \
    > test.out 2>&1
eval_tap $? 359 'TestStripeConfig' test.out

#- 360 TestWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfig \
    --body '{"appId": "fhHv8xPT", "key": "Q2h4m18M", "mchid": "3n0m0uVZ", "returnUrl": "d3ZbWoQd"}' \
    > test.out 2>&1
eval_tap $? 360 'TestWxPayConfig' test.out

#- 361 TestXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfig \
    --body '{"apiKey": "J37vcFPn", "flowCompletionUrl": "91eYDy3V", "merchantId": 59, "projectId": 81, "projectSecretKey": "y4UcLSw8"}' \
    > test.out 2>&1
eval_tap $? 361 'TestXsollaConfig' test.out

#- 362 GetPaymentMerchantConfig1
./ng net.accelbyte.sdk.cli.Main platform getPaymentMerchantConfig1 \
    --id 'cNa49aUs' \
    > test.out 2>&1
eval_tap $? 362 'GetPaymentMerchantConfig1' test.out

#- 363 UpdateAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform updateAdyenConfig \
    --id 'fhUbPxwD' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethods": ["Traa8ZCX", "BJwRDAzY", "ADdcPLOu"], "apiKey": "8LHEiuym", "authoriseAsCapture": false, "blockedPaymentMethods": ["HtfeCrWR", "v1ZbhZOD", "bpBgqv9Z"], "clientKey": "oB9VbIuM", "dropInSettings": "XUrlQk6m", "liveEndpointUrlPrefix": "oiEcxeme", "merchantAccount": "GlFuwFsR", "notificationHmacKey": "Km6MRrgx", "notificationPassword": "JgNJM814", "notificationUsername": "glgpis2S", "returnUrl": "M8v19ewB", "settings": "haycxRmf"}' \
    > test.out 2>&1
eval_tap $? 363 'UpdateAdyenConfig' test.out

#- 364 TestAdyenConfigById
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfigById \
    --id 'H26OBxmc' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 364 'TestAdyenConfigById' test.out

#- 365 UpdateAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateAliPayConfig \
    --id '2HQy4Imz' \
    --sandbox  \
    --validate  \
    --body '{"appId": "LAA3AdUM", "privateKey": "ev1ErlCn", "publicKey": "SCFhsyfy", "returnUrl": "TmIhcQWg"}' \
    > test.out 2>&1
eval_tap $? 365 'UpdateAliPayConfig' test.out

#- 366 TestAliPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfigById \
    --id 'ddBzpG7o' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 366 'TestAliPayConfigById' test.out

#- 367 UpdateCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform updateCheckoutConfig \
    --id '0F2ddobH' \
    --sandbox  \
    --validate  \
    --body '{"publicKey": "Ao8bXMvj", "secretKey": "pLnpp6yG"}' \
    > test.out 2>&1
eval_tap $? 367 'UpdateCheckoutConfig' test.out

#- 368 TestCheckoutConfigById
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfigById \
    --id '6FiEWLoC' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 368 'TestCheckoutConfigById' test.out

#- 369 UpdateNeonPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateNeonPayConfig \
    --id 'OtohVGeo' \
    --sandbox  \
    --validate  \
    --body '{"apiKey": "itRzAALy", "webhookSecretKey": "fHwxsQIC"}' \
    > test.out 2>&1
eval_tap $? 369 'UpdateNeonPayConfig' test.out

#- 370 TestNeonPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testNeonPayConfigById \
    --id 'YHU0auTn' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 370 'TestNeonPayConfigById' test.out

#- 371 UpdatePayPalConfig
./ng net.accelbyte.sdk.cli.Main platform updatePayPalConfig \
    --id 'oLCY48f5' \
    --sandbox  \
    --validate  \
    --body '{"clientID": "qN2sXBHf", "clientSecret": "ObjJjdUP", "returnUrl": "7em0a7P9", "webHookId": "X3yMjprm"}' \
    > test.out 2>&1
eval_tap $? 371 'UpdatePayPalConfig' test.out

#- 372 TestPayPalConfigById
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfigById \
    --id 'hBlFLmEU' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 372 'TestPayPalConfigById' test.out

#- 373 UpdateStripeConfig
./ng net.accelbyte.sdk.cli.Main platform updateStripeConfig \
    --id 'jbs5Y3pH' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethodTypes": ["hZswzben", "Bt6o9oUq", "FvPbAjNA"], "publishableKey": "4VfIDobA", "secretKey": "LnueIK0U", "webhookSecret": "uI1bCUX8"}' \
    > test.out 2>&1
eval_tap $? 373 'UpdateStripeConfig' test.out

#- 374 TestStripeConfigById
./ng net.accelbyte.sdk.cli.Main platform testStripeConfigById \
    --id 'H3gSYRXQ' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 374 'TestStripeConfigById' test.out

#- 375 UpdateWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfig \
    --id '0NqgDya0' \
    --validate  \
    --body '{"appId": "preHPssl", "key": "pL2PTYo0", "mchid": "SwQN6LDl", "returnUrl": "BMjdXeuk"}' \
    > test.out 2>&1
eval_tap $? 375 'UpdateWxPayConfig' test.out

#- 376 UpdateWxPayConfigCert
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfigCert \
    --id 'EEr1gDbJ' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 376 'UpdateWxPayConfigCert' test.out

#- 377 TestWxPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfigById \
    --id 'UgSxsM43' \
    > test.out 2>&1
eval_tap $? 377 'TestWxPayConfigById' test.out

#- 378 UpdateXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaConfig \
    --id '4vpZ3isi' \
    --validate  \
    --body '{"apiKey": "JEJSBlod", "flowCompletionUrl": "IlJdG9WW", "merchantId": 4, "projectId": 55, "projectSecretKey": "Gc99r1eI"}' \
    > test.out 2>&1
eval_tap $? 378 'UpdateXsollaConfig' test.out

#- 379 TestXsollaConfigById
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfigById \
    --id 'mC8GpdpI' \
    > test.out 2>&1
eval_tap $? 379 'TestXsollaConfigById' test.out

#- 380 UpdateXsollaUIConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaUIConfig \
    --id '2L1ftoUr' \
    --body '{"device": "MOBILE", "showCloseButton": false, "size": "SMALL", "theme": "DARK"}' \
    > test.out 2>&1
eval_tap $? 380 'UpdateXsollaUIConfig' test.out

#- 381 QueryPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform queryPaymentProviderConfig \
    --limit '12' \
    --namespace "$AB_NAMESPACE" \
    --offset '35' \
    --region 'IcfQWgSB' \
    > test.out 2>&1
eval_tap $? 381 'QueryPaymentProviderConfig' test.out

#- 382 CreatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform createPaymentProviderConfig \
    --body '{"aggregate": "ADYEN", "namespace": "lau3bac1", "region": "iImeixI6", "sandboxTaxJarApiToken": "t5seQLea", "specials": ["ALIPAY", "CHECKOUT", "STRIPE"], "taxJarApiToken": "nvwbHcXZ", "taxJarEnabled": false, "useGlobalTaxJarApiToken": false}' \
    > test.out 2>&1
eval_tap $? 382 'CreatePaymentProviderConfig' test.out

#- 383 GetAggregatePaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getAggregatePaymentProviders \
    > test.out 2>&1
eval_tap $? 383 'GetAggregatePaymentProviders' test.out

#- 384 DebugMatchedPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentProviderConfig \
    --namespace "$AB_NAMESPACE" \
    --region 't9yXXOqA' \
    > test.out 2>&1
eval_tap $? 384 'DebugMatchedPaymentProviderConfig' test.out

#- 385 GetSpecialPaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getSpecialPaymentProviders \
    > test.out 2>&1
eval_tap $? 385 'GetSpecialPaymentProviders' test.out

#- 386 UpdatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentProviderConfig \
    --id 'NKhrxqnV' \
    --body '{"aggregate": "NEONPAY", "namespace": "KpvIh4MW", "region": "EdgzTAM9", "sandboxTaxJarApiToken": "1Z3czpxy", "specials": ["CHECKOUT", "ADYEN", "NEONPAY"], "taxJarApiToken": "Bb6KMPUU", "taxJarEnabled": false, "useGlobalTaxJarApiToken": true}' \
    > test.out 2>&1
eval_tap $? 386 'UpdatePaymentProviderConfig' test.out

#- 387 DeletePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform deletePaymentProviderConfig \
    --id 'AIZxdATv' \
    > test.out 2>&1
eval_tap $? 387 'DeletePaymentProviderConfig' test.out

#- 388 GetPaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxConfig \
    > test.out 2>&1
eval_tap $? 388 'GetPaymentTaxConfig' test.out

#- 389 UpdatePaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentTaxConfig \
    --body '{"sandboxTaxJarApiToken": "XJjygky3", "taxJarApiToken": "YpXxzdJk", "taxJarEnabled": false, "taxJarProductCodesMapping": {"k4mMxHhD": "AiEvPiXa", "MsYr6KaF": "omvr55Y0", "xcavBMZx": "VGZqPCaB"}}' \
    > test.out 2>&1
eval_tap $? 389 'UpdatePaymentTaxConfig' test.out

#- 390 SyncPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform syncPaymentOrders \
    --nextEvaluatedKey 'tIkz20wT' \
    --end 'ovPTo27a' \
    --start 'nAFzZb4F' \
    > test.out 2>&1
eval_tap $? 390 'SyncPaymentOrders' test.out

#- 391 PublicGetRootCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetRootCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'ISS5uXZv' \
    --storeId 'aQzrK2UN' \
    > test.out 2>&1
eval_tap $? 391 'PublicGetRootCategories' test.out

#- 392 DownloadCategories
./ng net.accelbyte.sdk.cli.Main platform downloadCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'yqGjzUZR' \
    --storeId 'pw3MVfOu' \
    > test.out 2>&1
eval_tap $? 392 'DownloadCategories' test.out

#- 393 PublicGetCategory
./ng net.accelbyte.sdk.cli.Main platform publicGetCategory \
    --categoryPath 'xOWZB9gy' \
    --namespace "$AB_NAMESPACE" \
    --language '4Tco9AnA' \
    --storeId '9KAmWI2P' \
    > test.out 2>&1
eval_tap $? 393 'PublicGetCategory' test.out

#- 394 PublicGetChildCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetChildCategories \
    --categoryPath 'vdfp5hBg' \
    --namespace "$AB_NAMESPACE" \
    --language 'Wx0zkmfb' \
    --storeId 'sE5sXyBo' \
    > test.out 2>&1
eval_tap $? 394 'PublicGetChildCategories' test.out

#- 395 PublicGetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetDescendantCategories \
    --categoryPath 'zzu2GqZQ' \
    --namespace "$AB_NAMESPACE" \
    --language 'yja2UieX' \
    --storeId 'Wgm79rKG' \
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
    --dlcType 'EPICGAMES' \
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
    --platform 'OCULUS' \
    > test.out 2>&1
eval_tap $? 399 'GetIAPItemMapping' test.out

#- 400 PublicGetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --language 're1WiYkB' \
    --region 'LBzSx8Y2' \
    --storeId 'JY76O2gD' \
    --appId 'Rk7vyZJK' \
    > test.out 2>&1
eval_tap $? 400 'PublicGetItemByAppId' test.out

#- 401 PublicQueryItems
./ng net.accelbyte.sdk.cli.Main platform publicQueryItems \
    --namespace "$AB_NAMESPACE" \
    --appType 'GAME' \
    --autoCalcEstimatedPrice  \
    --baseAppId 'TuK2MNev' \
    --categoryPath '5h3SOP8y' \
    --features '3NBvnMi3' \
    --includeSubCategoryItem  \
    --itemType 'CODE' \
    --language 'Yaeghb2K' \
    --limit '92' \
    --offset '67' \
    --region '96w7B81P' \
    --sortBy 'updatedAt:desc,createdAt:desc,updatedAt' \
    --storeId 'aY7v0W3T' \
    --tags 'GZPcFO1Q' \
    > test.out 2>&1
eval_tap $? 401 'PublicQueryItems' test.out

#- 402 PublicGetItemBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetItemBySku \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'H9ANa3aw' \
    --region '7bBTvd8d' \
    --storeId 'zZnxoUXi' \
    --sku 'LdKK3csV' \
    > test.out 2>&1
eval_tap $? 402 'PublicGetItemBySku' test.out

#- 403 PublicGetEstimatedPrice
./ng net.accelbyte.sdk.cli.Main platform publicGetEstimatedPrice \
    --namespace "$AB_NAMESPACE" \
    --region '6nW8aY6b' \
    --storeId 'Lmq03LN0' \
    --itemIds '01Uc01yM' \
    > test.out 2>&1
eval_tap $? 403 'PublicGetEstimatedPrice' test.out

#- 404 PublicBulkGetItems
./ng net.accelbyte.sdk.cli.Main platform publicBulkGetItems \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'kBTgum6K' \
    --region 'z5YbwSgR' \
    --storeId 'cOs2qoAn' \
    --itemIds 'uOIjICUM' \
    > test.out 2>&1
eval_tap $? 404 'PublicBulkGetItems' test.out

#- 405 PublicValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform publicValidateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --body '{"itemIds": ["BePsrXPs", "0AyJt8bq", "NLkAquo5"]}' \
    > test.out 2>&1
eval_tap $? 405 'PublicValidateItemPurchaseCondition' test.out

#- 406 PublicSearchItems
./ng net.accelbyte.sdk.cli.Main platform publicSearchItems \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --itemType 'MEDIA' \
    --limit '24' \
    --offset '95' \
    --region 'dZEKgeMT' \
    --storeId 'qUYnD7Oq' \
    --keyword 'xmUw1PSB' \
    --language 'iLUBvkEN' \
    > test.out 2>&1
eval_tap $? 406 'PublicSearchItems' test.out

#- 407 PublicGetApp
./ng net.accelbyte.sdk.cli.Main platform publicGetApp \
    --itemId 'uQ3AldWj' \
    --namespace "$AB_NAMESPACE" \
    --language '6ZBRSosX' \
    --region 'ajAMRgBf' \
    --storeId 'E0lFnM7L' \
    > test.out 2>&1
eval_tap $? 407 'PublicGetApp' test.out

#- 408 PublicGetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform publicGetItemDynamicData \
    --itemId 'KruHQlKf' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 408 'PublicGetItemDynamicData' test.out

#- 409 PublicGetItem
./ng net.accelbyte.sdk.cli.Main platform publicGetItem \
    --itemId 'igFDbvo8' \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language '7h9u7rYe' \
    --populateBundle  \
    --region 'aRGiPKw3' \
    --storeId 'wX6qWmJj' \
    > test.out 2>&1
eval_tap $? 409 'PublicGetItem' test.out

#- 410 GetPaymentCustomization
eval_tap 0 410 'GetPaymentCustomization # SKIP deprecated' test.out

#- 411 PublicGetPaymentUrl
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentUrl \
    --namespace "$AB_NAMESPACE" \
    --body '{"neonPayConfig": {"cancelUrl": "naCNw56M", "successUrl": "4xsS9CDm"}, "paymentOrderNo": "KauXvJ1S", "paymentProvider": "WXPAY", "returnUrl": "Pn1tHKiy", "ui": "eCWRvkyT", "zipCode": "FupUH5OD"}' \
    > test.out 2>&1
eval_tap $? 411 'PublicGetPaymentUrl' test.out

#- 412 PublicGetPaymentMethods
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentMethods \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '3BdDUBxz' \
    > test.out 2>&1
eval_tap $? 412 'PublicGetPaymentMethods' test.out

#- 413 PublicGetUnpaidPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUnpaidPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'IYm6VedW' \
    > test.out 2>&1
eval_tap $? 413 'PublicGetUnpaidPaymentOrder' test.out

#- 414 Pay
./ng net.accelbyte.sdk.cli.Main platform pay \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'GxAXCbKL' \
    --paymentProvider 'ADYEN' \
    --zipCode 'GSgU2IJD' \
    --body '{"token": "m1x3sXyl"}' \
    > test.out 2>&1
eval_tap $? 414 'Pay' test.out

#- 415 PublicCheckPaymentOrderPaidStatus
./ng net.accelbyte.sdk.cli.Main platform publicCheckPaymentOrderPaidStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'Fjkqf40F' \
    > test.out 2>&1
eval_tap $? 415 'PublicCheckPaymentOrderPaidStatus' test.out

#- 416 GetPaymentPublicConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentPublicConfig \
    --namespace "$AB_NAMESPACE" \
    --sandbox  \
    --paymentProvider 'NEONPAY' \
    --region 'xvEaLfbG' \
    > test.out 2>&1
eval_tap $? 416 'GetPaymentPublicConfig' test.out

#- 417 PublicGetQRCode
./ng net.accelbyte.sdk.cli.Main platform publicGetQRCode \
    --namespace "$AB_NAMESPACE" \
    --code 'bNyyCtGo' \
    > test.out 2>&1
eval_tap $? 417 'PublicGetQRCode' test.out

#- 418 PublicNormalizePaymentReturnUrl
./ng net.accelbyte.sdk.cli.Main platform publicNormalizePaymentReturnUrl \
    --namespace "$AB_NAMESPACE" \
    --payerID 'ocGf5Kcs' \
    --foreinginvoice 'R7qaFhEH' \
    --invoiceId 'iwQI6DlX' \
    --payload 'inulnu3C' \
    --redirectResult '6Jbn5Qpb' \
    --resultCode 'BrYM7LzU' \
    --sessionId '9peoOXts' \
    --status 'e4fq0m5Q' \
    --token 'ak6WpFcp' \
    --type 'yuMT7ToB' \
    --userId 'Op3GcVAA' \
    --orderNo '398r2k06' \
    --paymentOrderNo 'vAol6f9X' \
    --paymentProvider 'ALIPAY' \
    --returnUrl 'ufQcSyNt' \
    > test.out 2>&1
eval_tap $? 418 'PublicNormalizePaymentReturnUrl' test.out

#- 419 GetPaymentTaxValue
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxValue \
    --namespace "$AB_NAMESPACE" \
    --zipCode 'EXygRRZZ' \
    --paymentOrderNo 'QcXbJHqE' \
    --paymentProvider 'XSOLLA' \
    > test.out 2>&1
eval_tap $? 419 'GetPaymentTaxValue' test.out

#- 420 GetRewardByCode
./ng net.accelbyte.sdk.cli.Main platform getRewardByCode \
    --namespace "$AB_NAMESPACE" \
    --rewardCode '07z6Xfma' \
    > test.out 2>&1
eval_tap $? 420 'GetRewardByCode' test.out

#- 421 QueryRewards1
./ng net.accelbyte.sdk.cli.Main platform queryRewards1 \
    --namespace "$AB_NAMESPACE" \
    --eventTopic '8T5Ev2Y9' \
    --limit '73' \
    --offset '96' \
    --sortBy 'namespace,rewardCode' \
    > test.out 2>&1
eval_tap $? 421 'QueryRewards1' test.out

#- 422 GetReward1
./ng net.accelbyte.sdk.cli.Main platform getReward1 \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'VoHB8ldq' \
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
    --appIds 'jiXGhIuK,kxZrcQhL,LwKIwPLX' \
    --itemIds 'dHUXPjmn,s0jtCCBB,Fw56v1nO' \
    --skus 'CA5bkgx4,YaMIBf7q,Tk6MmzOE' \
    > test.out 2>&1
eval_tap $? 424 'PublicExistsAnyMyActiveEntitlement' test.out

#- 425 PublicGetMyAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --appId 'riov3xxA' \
    > test.out 2>&1
eval_tap $? 425 'PublicGetMyAppEntitlementOwnershipByAppId' test.out

#- 426 PublicGetMyEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'CODE' \
    --itemId 'wPsouyJy' \
    > test.out 2>&1
eval_tap $? 426 'PublicGetMyEntitlementOwnershipByItemId' test.out

#- 427 PublicGetMyEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'MEDIA' \
    --sku 'cTRx5u7K' \
    > test.out 2>&1
eval_tap $? 427 'PublicGetMyEntitlementOwnershipBySku' test.out

#- 428 PublicGetEntitlementOwnershipToken
./ng net.accelbyte.sdk.cli.Main platform publicGetEntitlementOwnershipToken \
    --namespace "$AB_NAMESPACE" \
    --appIds 'AjglwXRL,NvWRmJii,aokNosC8' \
    --itemIds 'fim8yysG,wpJwaas2,MpbppjUA' \
    --skus 'bShQqlqW,v4NtCPCD,cW0OSxpN' \
    > test.out 2>&1
eval_tap $? 428 'PublicGetEntitlementOwnershipToken' test.out

#- 429 SyncTwitchDropsEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement \
    --namespace "$AB_NAMESPACE" \
    --body '{"gameId": "EJTI2kM5", "language": "jzjU-kd", "region": "IOwYNWBa"}' \
    > test.out 2>&1
eval_tap $? 429 'SyncTwitchDropsEntitlement' test.out

#- 430 PublicGetMyWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetMyWallet \
    --currencyCode 'y6pJ1sBP' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 430 'PublicGetMyWallet' test.out

#- 431 SyncEpicGameDLC
./ng net.accelbyte.sdk.cli.Main platform syncEpicGameDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'LxpbAe9u' \
    --body '{"epicGamesJwtToken": "vHuSb19v"}' \
    > test.out 2>&1
eval_tap $? 431 'SyncEpicGameDLC' test.out

#- 432 SyncOculusDLC
./ng net.accelbyte.sdk.cli.Main platform syncOculusDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'tExHluHd' \
    > test.out 2>&1
eval_tap $? 432 'SyncOculusDLC' test.out

#- 433 PublicSyncPsnDlcInventory
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventory \
    --namespace "$AB_NAMESPACE" \
    --userId '6yeRHgwR' \
    --body '{"serviceLabel": 59}' \
    > test.out 2>&1
eval_tap $? 433 'PublicSyncPsnDlcInventory' test.out

#- 434 PublicSyncPsnDlcInventoryWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventoryWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ly3vDeek' \
    --body '{"serviceLabels": [51, 86, 39]}' \
    > test.out 2>&1
eval_tap $? 434 'PublicSyncPsnDlcInventoryWithMultipleServiceLabels' test.out

#- 435 SyncSteamDLC
./ng net.accelbyte.sdk.cli.Main platform syncSteamDLC \
    --namespace "$AB_NAMESPACE" \
    --userId '4cr3txj7' \
    --body '{"appId": "eQHV6RIP", "steamId": "OJ0aZWMH"}' \
    > test.out 2>&1
eval_tap $? 435 'SyncSteamDLC' test.out

#- 436 SyncXboxDLC
./ng net.accelbyte.sdk.cli.Main platform syncXboxDLC \
    --namespace "$AB_NAMESPACE" \
    --userId '32K0Bw9G' \
    --body '{"xstsToken": "OZFhoddz"}' \
    > test.out 2>&1
eval_tap $? 436 'SyncXboxDLC' test.out

#- 437 PublicQueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'Oij1g6UA' \
    --appType 'DLC' \
    --entitlementClazz 'CODE' \
    --entitlementName 'Ev30fOjC' \
    --features 'MWqkkcOk,NRedpPLh,BpDY4Wsb' \
    --itemId 'vC2xdvwp,nCm2QB6y,77AlmR5r' \
    --limit '71' \
    --offset '80' \
    > test.out 2>&1
eval_tap $? 437 'PublicQueryUserEntitlements' test.out

#- 438 PublicGetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'CyRicbb2' \
    --appId 've1ZAPm5' \
    > test.out 2>&1
eval_tap $? 438 'PublicGetUserAppEntitlementByAppId' test.out

#- 439 PublicQueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId '0swaK0X8' \
    --limit '85' \
    --offset '0' \
    --appType 'GAME' \
    > test.out 2>&1
eval_tap $? 439 'PublicQueryUserEntitlementsByAppType' test.out

#- 440 PublicGetUserEntitlementsByIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementsByIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'sBkgLTWR' \
    --availablePlatformOnly  \
    --ids '5aIX54Xd,gNq7NJ2r,tHC3nfmi' \
    > test.out 2>&1
eval_tap $? 440 'PublicGetUserEntitlementsByIds' test.out

#- 441 PublicGetUserEntitlementByItemId
eval_tap 0 441 'PublicGetUserEntitlementByItemId # SKIP deprecated' test.out

#- 442 PublicGetUserEntitlementBySku
eval_tap 0 442 'PublicGetUserEntitlementBySku # SKIP deprecated' test.out

#- 443 PublicUserEntitlementHistory
./ng net.accelbyte.sdk.cli.Main platform publicUserEntitlementHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'BuICYmlb' \
    --endDate 'jurW9sze' \
    --entitlementClazz 'CODE' \
    --limit '40' \
    --offset '65' \
    --startDate 'EULQ0EWS' \
    > test.out 2>&1
eval_tap $? 443 'PublicUserEntitlementHistory' test.out

#- 444 PublicExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'e1KecXa8' \
    --appIds 'VXZLFYIj,ktrNOd1s,dqww4AOa' \
    --itemIds 'uc5aiI1S,h2l8EmoN,bhCs6lLx' \
    --skus 'Oi4l3x8F,MCtODJBD,bW24BgAc' \
    > test.out 2>&1
eval_tap $? 444 'PublicExistsAnyUserActiveEntitlement' test.out

#- 445 PublicGetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'e3yVTtQ4' \
    --appId 'TJoBLL3u' \
    > test.out 2>&1
eval_tap $? 445 'PublicGetUserAppEntitlementOwnershipByAppId' test.out

#- 446 PublicGetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'brkhaF5X' \
    --entitlementClazz 'SUBSCRIPTION' \
    --itemId 'EgVuqyA6' \
    > test.out 2>&1
eval_tap $? 446 'PublicGetUserEntitlementOwnershipByItemId' test.out

#- 447 PublicGetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'SIBc7XCz' \
    --ids '2pNzN4Bg,6kftxd4i,AaCnzteF' \
    > test.out 2>&1
eval_tap $? 447 'PublicGetUserEntitlementOwnershipByItemIds' test.out

#- 448 PublicGetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'rdoc60v6' \
    --entitlementClazz 'CODE' \
    --sku 'ThqNlGRY' \
    > test.out 2>&1
eval_tap $? 448 'PublicGetUserEntitlementOwnershipBySku' test.out

#- 449 PublicGetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlement \
    --entitlementId 'PzYsYoz5' \
    --namespace "$AB_NAMESPACE" \
    --userId 'KuHavHAZ' \
    > test.out 2>&1
eval_tap $? 449 'PublicGetUserEntitlement' test.out

#- 450 PublicConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicConsumeUserEntitlement \
    --entitlementId 'kCxSALOp' \
    --namespace "$AB_NAMESPACE" \
    --userId 'sigWh591' \
    --body '{"metadata": {"operationSource": "INVENTORY"}, "options": ["qtkqAFPo", "FyAID5XQ", "kLcxKw0c"], "requestId": "A4tomJF8", "useCount": 60}' \
    > test.out 2>&1
eval_tap $? 450 'PublicConsumeUserEntitlement' test.out

#- 451 PublicSellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicSellUserEntitlement \
    --entitlementId 'rwwqDBos' \
    --namespace "$AB_NAMESPACE" \
    --userId 'IlJzZLDa' \
    --body '{"requestId": "OJRCn38j", "useCount": 58}' \
    > test.out 2>&1
eval_tap $? 451 'PublicSellUserEntitlement' test.out

#- 452 PublicSplitUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicSplitUserEntitlement \
    --entitlementId 'NmZrlumo' \
    --namespace "$AB_NAMESPACE" \
    --userId 'bKAj3dvo' \
    --body '{"metadata": {"operationSource": "INVENTORY"}, "useCount": 69}' \
    > test.out 2>&1
eval_tap $? 452 'PublicSplitUserEntitlement' test.out

#- 453 PublicTransferUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicTransferUserEntitlement \
    --entitlementId 'F2cKnW9P' \
    --namespace "$AB_NAMESPACE" \
    --userId '2zcEwG04' \
    --body '{"entitlementId": "7kviskKF", "metadata": {"operationSource": "INVENTORY"}, "useCount": 61}' \
    > test.out 2>&1
eval_tap $? 453 'PublicTransferUserEntitlement' test.out

#- 454 PublicRedeemCode
./ng net.accelbyte.sdk.cli.Main platform publicRedeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'OFIGQdKa' \
    --body '{"code": "Pz818X7K", "language": "Lj_420", "region": "sfSSWDlH"}' \
    > test.out 2>&1
eval_tap $? 454 'PublicRedeemCode' test.out

#- 455 PublicFulfillAppleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillAppleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'G6dtcbwF' \
    --body '{"excludeOldTransactions": true, "language": "nMmg", "productId": "Z0A1fyYf", "receiptData": "o8oUxQGO", "region": "bpdpCZlY", "transactionId": "TLUSrj3a"}' \
    > test.out 2>&1
eval_tap $? 455 'PublicFulfillAppleIAPItem' test.out

#- 456 SyncEpicGamesInventory
./ng net.accelbyte.sdk.cli.Main platform syncEpicGamesInventory \
    --namespace "$AB_NAMESPACE" \
    --userId '6EYvD7vc' \
    --body '{"epicGamesJwtToken": "kGBKkxkP"}' \
    > test.out 2>&1
eval_tap $? 456 'SyncEpicGamesInventory' test.out

#- 457 PublicFulfillGoogleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillGoogleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'tR1Z1IQY' \
    --body '{"autoAck": true, "autoConsume": false, "language": "AVo", "orderId": "38MXIkgn", "packageName": "VytWnXjk", "productId": "cgjh8AQH", "purchaseTime": 37, "purchaseToken": "QJvSSWr5", "region": "9eVtAc1B", "subscriptionPurchase": false}' \
    > test.out 2>&1
eval_tap $? 457 'PublicFulfillGoogleIAPItem' test.out

#- 458 SyncOculusConsumableEntitlements
./ng net.accelbyte.sdk.cli.Main platform syncOculusConsumableEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'T0bN1t6B' \
    > test.out 2>&1
eval_tap $? 458 'SyncOculusConsumableEntitlements' test.out

#- 459 PublicReconcilePlayStationStore
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStore \
    --namespace "$AB_NAMESPACE" \
    --userId 'sOfXFTpm' \
    --body '{"currencyCode": "Ac2VIwj7", "price": 0.6312768561272042, "productId": "Nd0q3ALd", "serviceLabel": 27}' \
    > test.out 2>&1
eval_tap $? 459 'PublicReconcilePlayStationStore' test.out

#- 460 PublicReconcilePlayStationStoreWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStoreWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'EVAV7pwj' \
    --body '{"currencyCode": "mJEYZcAJ", "price": 0.6016485990286432, "productId": "I4ImR6WC", "serviceLabels": [32, 9, 63]}' \
    > test.out 2>&1
eval_tap $? 460 'PublicReconcilePlayStationStoreWithMultipleServiceLabels' test.out

#- 461 SyncSteamInventory
./ng net.accelbyte.sdk.cli.Main platform syncSteamInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'PxVOeYqS' \
    --body '{"appId": "SYCFJblj", "currencyCode": "6lNEuUJS", "language": "Lf-RGse-ZO", "price": 0.9737075001174148, "productId": "hDY9IGxK", "region": "3pN4MkPM", "steamId": "CCQOZ8OL"}' \
    > test.out 2>&1
eval_tap $? 461 'SyncSteamInventory' test.out

#- 462 SyncSteamAbnormalTransaction
./ng net.accelbyte.sdk.cli.Main platform syncSteamAbnormalTransaction \
    --namespace "$AB_NAMESPACE" \
    --userId 'usYCCds9' \
    > test.out 2>&1
eval_tap $? 462 'SyncSteamAbnormalTransaction' test.out

#- 463 SyncSteamIAPByTransaction
./ng net.accelbyte.sdk.cli.Main platform syncSteamIAPByTransaction \
    --namespace "$AB_NAMESPACE" \
    --userId 'KaNAgsKd' \
    --body '{"orderId": "Psif2u40"}' \
    > test.out 2>&1
eval_tap $? 463 'SyncSteamIAPByTransaction' test.out

#- 464 PublicQueryUserThirdPartySubscription
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserThirdPartySubscription \
    --namespace "$AB_NAMESPACE" \
    --platform 'STADIA' \
    --userId '1bpWJP3j' \
    --activeOnly  \
    --groupId 'SLBNb00A' \
    --limit '26' \
    --offset '77' \
    --productId 'TNqFpMFs' \
    > test.out 2>&1
eval_tap $? 464 'PublicQueryUserThirdPartySubscription' test.out

#- 465 SyncTwitchDropsEntitlement1
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'uIJg8ynS' \
    --body '{"gameId": "fmaKc4gH", "language": "SOv_387", "region": "LtMBLO6I"}' \
    > test.out 2>&1
eval_tap $? 465 'SyncTwitchDropsEntitlement1' test.out

#- 466 SyncXboxInventory
./ng net.accelbyte.sdk.cli.Main platform syncXboxInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'SD6KIUyp' \
    --body '{"currencyCode": "IuGHB8b8", "price": 0.395709389793686, "productId": "3vCV7VkE", "xstsToken": "D1qLV5Xn"}' \
    > test.out 2>&1
eval_tap $? 466 'SyncXboxInventory' test.out

#- 467 PublicQueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId '7Ddvu2Q0' \
    --discounted  \
    --itemId 'XvtWpMl3' \
    --limit '99' \
    --offset '46' \
    --status 'CHARGED' \
    > test.out 2>&1
eval_tap $? 467 'PublicQueryUserOrders' test.out

#- 468 PublicCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId '6UGmqwtu' \
    --body '{"currencyCode": "zzKvwBRa", "discountCodes": ["lZmz0WaY", "SOVk70Dp", "vfS8yq3I"], "discountedPrice": 4, "ext": {"mMoiJLy5": {}, "WjRDiQj5": {}, "TR99gcW6": {}}, "itemId": "kxdEgldJ", "language": "Xkn-xMxS", "price": 93, "quantity": 90, "region": "PCXRo1BQ", "returnUrl": "ecoPBurM", "sectionId": "yqvR6JDH"}' \
    > test.out 2>&1
eval_tap $? 468 'PublicCreateUserOrder' test.out

#- 469 PublicPreviewOrderPrice
./ng net.accelbyte.sdk.cli.Main platform publicPreviewOrderPrice \
    --namespace "$AB_NAMESPACE" \
    --userId 'gyvMyyde' \
    --body '{"currencyCode": "wlnVSRxB", "discountCodes": ["vBc0Bqh5", "o79Z30ta", "IPUHT0uF"], "discountedPrice": 71, "itemId": "H51JIkpX", "price": 38, "quantity": 60}' \
    > test.out 2>&1
eval_tap $? 469 'PublicPreviewOrderPrice' test.out

#- 470 PublicGetUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'raFkwHb5' \
    --userId 'vmxBnfXA' \
    > test.out 2>&1
eval_tap $? 470 'PublicGetUserOrder' test.out

#- 471 PublicCancelUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCancelUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'gjN8D6Qe' \
    --userId 'ZUGoPLAu' \
    > test.out 2>&1
eval_tap $? 471 'PublicCancelUserOrder' test.out

#- 472 PublicGetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'mFPVkZry' \
    --userId 'mthFP8TV' \
    > test.out 2>&1
eval_tap $? 472 'PublicGetUserOrderHistories' test.out

#- 473 PublicDownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform publicDownloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo '50rBNOJN' \
    --userId 'DglK9GME' \
    > test.out 2>&1
eval_tap $? 473 'PublicDownloadUserOrderReceipt' test.out

#- 474 PublicGetPaymentAccounts
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'fHuyqCeC' \
    > test.out 2>&1
eval_tap $? 474 'PublicGetPaymentAccounts' test.out

#- 475 PublicDeletePaymentAccount
./ng net.accelbyte.sdk.cli.Main platform publicDeletePaymentAccount \
    --id 'wC28MX2S' \
    --namespace "$AB_NAMESPACE" \
    --type 'card' \
    --userId 'vLZhvJSb' \
    > test.out 2>&1
eval_tap $? 475 'PublicDeletePaymentAccount' test.out

#- 476 PublicListActiveSections
./ng net.accelbyte.sdk.cli.Main platform publicListActiveSections \
    --namespace "$AB_NAMESPACE" \
    --userId 'gSOF5KHw' \
    --autoCalcEstimatedPrice  \
    --language 'N2uq78K0' \
    --region 'BlFMVFvP' \
    --storeId 'eNWiCSKx' \
    --viewId 'srI9hr0y' \
    > test.out 2>&1
eval_tap $? 476 'PublicListActiveSections' test.out

#- 477 PublicQueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'OemJvOpL' \
    --chargeStatus 'CHARGE_FAILED' \
    --itemId 'goYGbTQG' \
    --limit '59' \
    --offset '81' \
    --sku '8OHZ36GO' \
    --status 'ACTIVE' \
    --subscribedBy 'PLATFORM' \
    > test.out 2>&1
eval_tap $? 477 'PublicQueryUserSubscriptions' test.out

#- 478 PublicSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform publicSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'WzAwMyhc' \
    --body '{"currencyCode": "bZVJ3yfm", "itemId": "WDrk3EYd", "language": "Hmn-jzRp", "region": "ikKeMrar", "returnUrl": "91icXkaH", "source": "ExR01f8L"}' \
    > test.out 2>&1
eval_tap $? 478 'PublicSubscribeSubscription' test.out

#- 479 PublicCheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform publicCheckUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'c1ATh0d3' \
    --itemId 'lDddv791' \
    > test.out 2>&1
eval_tap $? 479 'PublicCheckUserSubscriptionSubscribableByItemId' test.out

#- 480 PublicGetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'olRFrKDt' \
    --userId 'lXRGNWI9' \
    > test.out 2>&1
eval_tap $? 480 'PublicGetUserSubscription' test.out

#- 481 PublicChangeSubscriptionBillingAccount
./ng net.accelbyte.sdk.cli.Main platform publicChangeSubscriptionBillingAccount \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'rlcD4NEl' \
    --userId 'p3Fdsgpw' \
    > test.out 2>&1
eval_tap $? 481 'PublicChangeSubscriptionBillingAccount' test.out

#- 482 PublicCancelSubscription
./ng net.accelbyte.sdk.cli.Main platform publicCancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '4pcdIJiW' \
    --userId 'Jxt3vdpZ' \
    --body '{"immediate": false, "reason": "dGc9DsVx"}' \
    > test.out 2>&1
eval_tap $? 482 'PublicCancelSubscription' test.out

#- 483 PublicGetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'lNz8ZRgY' \
    --userId 'PQmuWmcq' \
    --excludeFree  \
    --limit '89' \
    --offset '1' \
    > test.out 2>&1
eval_tap $? 483 'PublicGetUserSubscriptionBillingHistories' test.out

#- 484 PublicListViews
./ng net.accelbyte.sdk.cli.Main platform publicListViews \
    --namespace "$AB_NAMESPACE" \
    --userId 'TQFyX4Yn' \
    --language 'ImmaPSHN' \
    --storeId 'zhK8XZGD' \
    > test.out 2>&1
eval_tap $? 484 'PublicListViews' test.out

#- 485 PublicGetWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetWallet \
    --currencyCode 'Ur56ZSkg' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ua9vAh5O' \
    > test.out 2>&1
eval_tap $? 485 'PublicGetWallet' test.out

#- 486 PublicListUserWalletTransactions
./ng net.accelbyte.sdk.cli.Main platform publicListUserWalletTransactions \
    --currencyCode 'KTzQxgQM' \
    --namespace "$AB_NAMESPACE" \
    --userId 'YmxPtvcT' \
    --limit '71' \
    --offset '99' \
    > test.out 2>&1
eval_tap $? 486 'PublicListUserWalletTransactions' test.out

#- 487 PublicGetMyDLCContent
./ng net.accelbyte.sdk.cli.Main platform publicGetMyDLCContent \
    --includeAllNamespaces  \
    --type 'EPICGAMES' \
    > test.out 2>&1
eval_tap $? 487 'PublicGetMyDLCContent' test.out

#- 488 QueryFulfillments
./ng net.accelbyte.sdk.cli.Main platform queryFulfillments \
    --namespace "$AB_NAMESPACE" \
    --endTime 'lXDEjsym' \
    --limit '2' \
    --offset '63' \
    --startTime 'aKVWblZ7' \
    --state 'FULFILLED' \
    --transactionId 'ziQ2IXq6' \
    --userId 'A6Qiw4BN' \
    > test.out 2>&1
eval_tap $? 488 'QueryFulfillments' test.out

#- 489 QueryItemsV2
./ng net.accelbyte.sdk.cli.Main platform queryItemsV2 \
    --namespace "$AB_NAMESPACE" \
    --appType 'DLC' \
    --availableDate 'dDM12hJA' \
    --baseAppId 'WGxdJCrw' \
    --categoryPath '6pNOwRlf' \
    --features 'BlJDUf8Q' \
    --includeSubCategoryItem  \
    --itemName 'peVOR3OX' \
    --itemStatus 'INACTIVE' \
    --itemType 'INGAMEITEM,SUBSCRIPTION,COINS' \
    --limit '44' \
    --offset '76' \
    --region 'DfXZ5cUE' \
    --sectionExclusive  \
    --sortBy 'updatedAt:asc,displayOrder:desc,displayOrder' \
    --storeId 'inFmRbuE' \
    --tags 'Mls0SXRr' \
    --targetNamespace 'KpTu4y6E' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 489 'QueryItemsV2' test.out

#- 490 ImportStore1
./ng net.accelbyte.sdk.cli.Main platform importStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'EUzfHKrv' \
    --strictMode  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 490 'ImportStore1' test.out

#- 491 ExportStore1
./ng net.accelbyte.sdk.cli.Main platform exportStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'c40pDGEB' \
    --body '{"itemIds": ["hOlXpMIt", "KWJu21LH", "fZ4Kk5ow"]}' \
    > test.out 2>&1
eval_tap $? 491 'ExportStore1' test.out

#- 492 FulfillRewardsV2
./ng net.accelbyte.sdk.cli.Main platform fulfillRewardsV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'XIpVPFaB' \
    --body '{"entitlementCollectionId": "KLnmqHWU", "entitlementOrigin": "Steam", "metadata": {"N5gShPC8": {}, "Vlq0IRhn": {}, "SCWw6RXd": {}}, "origin": "Playstation", "rewards": [{"currency": {"currencyCode": "fZ69Faee", "namespace": "1byrhQJW"}, "item": {"itemId": "X0ZHB4qy", "itemName": "JGUnJ3SY", "itemSku": "ieTSK5Ge", "itemType": "xXbUhOEs"}, "quantity": 75, "type": "ITEM"}, {"currency": {"currencyCode": "4bmPCNVN", "namespace": "PbDq505a"}, "item": {"itemId": "a1epVw6c", "itemName": "CrX4aLmE", "itemSku": "OajWyUzY", "itemType": "RiwyYPCt"}, "quantity": 12, "type": "ITEM"}, {"currency": {"currencyCode": "I1dxzSvH", "namespace": "nfLxqxYG"}, "item": {"itemId": "3Vh5ccUA", "itemName": "WyKTYvjL", "itemSku": "YpvAs48G", "itemType": "XMmTaaLP"}, "quantity": 56, "type": "CURRENCY"}], "source": "REWARD", "transactionId": "CcB4ZVTo"}' \
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
    --userId 'aqp2VPCj' \
    --body '{"transactionId": "id5L4OZb"}' \
    > test.out 2>&1
eval_tap $? 496 'V2PublicFulfillAppleIAPItem' test.out

#- 497 FulfillItemsV3
./ng net.accelbyte.sdk.cli.Main platform fulfillItemsV3 \
    --namespace "$AB_NAMESPACE" \
    --transactionId '2aQ9J7uE' \
    --userId 'MxH8R95K' \
    --body '{"items": [{"duration": 72, "endDate": "1977-10-11T00:00:00Z", "entitlementCollectionId": "k0UMEuQy", "entitlementOrigin": "Steam", "itemId": "68Jc5hjf", "itemSku": "q8hkvHKD", "language": "gMhXjCPQ", "metadata": {"Z5VVpOmG": {}, "hxehIsA7": {}, "LEps4SKz": {}}, "orderNo": "tIqqmzTv", "origin": "Oculus", "quantity": 7, "region": "yoaQZFCc", "source": "REWARD", "startDate": "1984-01-16T00:00:00Z", "storeId": "4BjczHmG"}, {"duration": 7, "endDate": "1993-11-19T00:00:00Z", "entitlementCollectionId": "pxxac9GV", "entitlementOrigin": "Steam", "itemId": "aJbjicF1", "itemSku": "cx5rkkEQ", "language": "Myhrq0HB", "metadata": {"jBElOBA8": {}, "seLGxYOZ": {}, "wtGTAS5G": {}}, "orderNo": "886fx2UV", "origin": "GooglePlay", "quantity": 65, "region": "9G2jimvX", "source": "CONSUME_ENTITLEMENT", "startDate": "1971-11-21T00:00:00Z", "storeId": "URD0rDld"}, {"duration": 98, "endDate": "1972-08-24T00:00:00Z", "entitlementCollectionId": "OUoMv9uN", "entitlementOrigin": "Xbox", "itemId": "Hbyy3S5r", "itemSku": "lmuMYQyL", "language": "a6hKKWuN", "metadata": {"iM9F9dfN": {}, "ZPaqrydQ": {}, "zPVHDbww": {}}, "orderNo": "V4rGlcqm", "origin": "Twitch", "quantity": 2, "region": "24rjmMBI", "source": "DLC", "startDate": "1975-03-15T00:00:00Z", "storeId": "RF2qSaBO"}]}' \
    > test.out 2>&1
eval_tap $? 497 'FulfillItemsV3' test.out

#- 498 RetryFulfillItemsV3
./ng net.accelbyte.sdk.cli.Main platform retryFulfillItemsV3 \
    --namespace "$AB_NAMESPACE" \
    --transactionId 'S7vLmLqi' \
    --userId 'MxrrVCsf' \
    > test.out 2>&1
eval_tap $? 498 'RetryFulfillItemsV3' test.out

#- 499 RevokeItemsV3
./ng net.accelbyte.sdk.cli.Main platform revokeItemsV3 \
    --namespace "$AB_NAMESPACE" \
    --transactionId '5LgwHB3N' \
    --userId 'GA0UVShB' \
    > test.out 2>&1
eval_tap $? 499 'RevokeItemsV3' test.out


rm -f "tmp.dat"

exit $EXIT_CODE